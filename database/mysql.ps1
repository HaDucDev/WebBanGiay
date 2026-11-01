param(
    [ValidateSet('Start', 'Stop', 'Status')]
    [string]$Action = 'Start'
)

$ErrorActionPreference = 'Stop'
$databaseRoot = [System.IO.Path]::GetFullPath($PSScriptRoot)
$projectRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$envPath = Join-Path $databaseRoot '.env'
$composeFile = Join-Path $databaseRoot 'compose.yaml'
$composeProject = 'webbangiay'
$containerName = 'webbangiay-mysql'
$volumeName = 'webbangiay-mysql-data'

function Invoke-Docker {
    param([string[]]$DockerArguments, [string]$InputText)
    $savedPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        if ($PSBoundParameters.ContainsKey('InputText')) {
            $lines = @($InputText | & docker @DockerArguments 2>&1)
        } else {
            $lines = @(& docker @DockerArguments 2>&1)
        }
        $nativeExit = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $savedPreference
    }
    return [PSCustomObject]@{
        ExitCode = $nativeExit
        Output = (($lines | ForEach-Object { $_.ToString() }) -join [Environment]::NewLine)
    }
}

function Assert-DockerSuccess {
    param($Result, [string]$Message)
    if ($Result.ExitCode -ne 0) {
        throw ($Message + [Environment]::NewLine + $Result.Output)
    }
}

function ConvertTo-JavaPropertyValue {
    param([string]$Value)
    $builder = New-Object System.Text.StringBuilder
    for ($index = 0; $index -lt $Value.Length; $index++) {
        $character = $Value[$index]
        switch ([int]$character) {
            9  { [void]$builder.Append('\t'); break }
            10 { [void]$builder.Append('\n'); break }
            12 { [void]$builder.Append('\f'); break }
            13 { [void]$builder.Append('\r'); break }
            92 { [void]$builder.Append('\\'); break }
            default {
                if ($index -eq 0 -and $character -eq ' ') {
                    [void]$builder.Append('\ ')
                } elseif ([int]$character -gt 126 -or [int]$character -lt 32) {
                    [void]$builder.Append(('\u{0:x4}' -f [int]$character))
                } else {
                    [void]$builder.Append($character)
                }
            }
        }
    }
    return $builder.ToString()
}

try {
    if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
        throw 'Docker CLI was not found. Install/open Docker Desktop and run this file again.'
    }
    $engine = Invoke-Docker -DockerArguments @('version', '--format', '{{.Server.Version}}')
    Assert-DockerSuccess $engine 'Docker Engine is unavailable. Open Docker Desktop and wait until it is ready.'
    $composeVersion = Invoke-Docker -DockerArguments @('compose', 'version', '--short')
    Assert-DockerSuccess $composeVersion 'Docker Compose is unavailable. Update Docker Desktop.'

    if (-not (Test-Path -LiteralPath $envPath)) {
        Copy-Item -LiteralPath (Join-Path $databaseRoot '.env.example') -Destination $envPath
        Write-Host 'Created .env from .env.example for local MySQL settings.'
    }
    $composeArguments = @('compose', '--project-name', $composeProject,
        '--project-directory', $databaseRoot, '--env-file', $envPath, '--file', $composeFile)
    $configuration = Invoke-Docker -DockerArguments ($composeArguments + @('config', '--format', 'json'))
    Assert-DockerSuccess $configuration 'Compose configuration is invalid.'
    $settings = $configuration.Output | ConvertFrom-Json
    $mysql = $settings.services.mysql
    $port = [int]$mysql.ports[0].published
    $mysqlUser = [string]$mysql.environment.MYSQL_USER
    $mysqlPassword = [string]$mysql.environment.MYSQL_PASSWORD
    if ($mysqlUser -notmatch '^[A-Za-z][A-Za-z0-9_]{0,31}$' -or $mysqlUser -eq 'root') {
        throw 'MYSQL_USER must be a non-root account using letters, digits and underscores.'
    }

    $existingContainer = Invoke-Docker -DockerArguments @('container', 'inspect', $containerName,
        '--format', '{{json .Config.Labels}}')
    if ($existingContainer.ExitCode -eq 0) {
        $labels = $existingContainer.Output | ConvertFrom-Json
        if ($labels.'com.docker.compose.project' -ne $composeProject -or
            $labels.'com.docker.compose.service' -ne 'mysql') {
            throw "Container $containerName already exists outside this Compose project. It was left unchanged."
        }
    }

    if ($Action -eq 'Stop') {
        $stopped = Invoke-Docker -DockerArguments ($composeArguments + @('stop', 'mysql'))
        Assert-DockerSuccess $stopped 'Could not stop MySQL.'
        Write-Host $stopped.Output
        Write-Host 'MySQL stopped. The database volume and its data are preserved.'
        exit 0
    }
    if ($Action -eq 'Status') {
        $status = Invoke-Docker -DockerArguments ($composeArguments + @('ps', '--all'))
        Assert-DockerSuccess $status 'Could not read MySQL status.'
        Write-Host $status.Output
        exit 0
    }

    $existingVolume = Invoke-Docker -DockerArguments @('volume', 'inspect', $volumeName,
        '--format', '{{json .Labels}}')
    if ($existingVolume.ExitCode -eq 0) {
        $labels = $existingVolume.Output | ConvertFrom-Json
        if ($labels.'com.docker.compose.project' -ne $composeProject) {
            throw "Volume $volumeName already exists outside this Compose project. Its data was left unchanged."
        }
    }

    $image = [string]$mysql.image
    $localImage = Invoke-Docker -DockerArguments @('image', 'inspect', $image, '--format', '{{.Id}}')
    if ($localImage.ExitCode -eq 0) {
        Write-Host "Using local image $image. No image download is needed."
    } else {
        Write-Host "Image $image was not found locally. Downloading it..."
        $download = Invoke-Docker -DockerArguments @('pull', $image)
        Assert-DockerSuccess $download 'Could not download the MySQL image.'
        Write-Host $download.Output
    }

    Write-Host 'Creating/starting MySQL and waiting for schema initialization...'
    $started = Invoke-Docker -DockerArguments ($composeArguments +
        @('up', '--detach', '--wait', '--wait-timeout', '180', 'mysql'))
    if ($started.ExitCode -ne 0) {
        Write-Host $started.Output
        $logs = Invoke-Docker -DockerArguments ($composeArguments + @('logs', '--tail', '35', 'mysql'))
        Write-Host $logs.Output
        throw 'MySQL is not ready. Check the port and .env. Existing volume passwords are not reset by restarting.'
    }
    Write-Host $started.Output

    $clientCommand = 'export MYSQL_PWD=$MYSQL_PASSWORD; exec mysql --protocol=TCP --host=127.0.0.1 --user=$MYSQL_USER --database=$MYSQL_DATABASE --default-character-set=utf8mb4 --batch --skip-column-names'
    $schemaQuery = "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name IN ('category','user','promotion','product','cart','cartitem','contact');"
    $schema = Invoke-Docker -DockerArguments ($composeArguments +
        @('exec', '-T', 'mysql', 'sh', '-c', $clientCommand)) -InputText $schemaQuery
    Assert-DockerSuccess $schema 'Could not verify the application schema.'
    if ($schema.Output.Trim() -ne '7') {
        throw 'The database does not contain the seven expected tables. Existing data was not reset.'
    }

    $propertyPath = Join-Path $projectRoot 'src\main\resources\db.properties'
    $jdbcUrl = "jdbc:mysql://127.0.0.1:$port/Web_Ban_Giay?useSSL=false&useUnicode=true&characterEncoding=UTF-8"
    $propertyText = @('driverName = com.mysql.cj.jdbc.Driver',
        ('url = ' + $jdbcUrl),
        ('user = ' + (ConvertTo-JavaPropertyValue $mysqlUser)),
        ('password = ' + (ConvertTo-JavaPropertyValue $mysqlPassword))) -join "`r`n"
    $propertyText += "`r`n"
    $oldProperties = if (Test-Path -LiteralPath $propertyPath) { [IO.File]::ReadAllText($propertyPath) } else { $null }
    if ($oldProperties -cne $propertyText) {
        if ($null -ne $oldProperties) {
            $propertyBackup = Join-Path ([IO.Path]::GetTempPath()) ('webbangiay-db-' + [guid]::NewGuid().ToString('N') + '.properties')
            Copy-Item -LiteralPath $propertyPath -Destination $propertyBackup
            Write-Host "Previous db.properties backed up to $propertyBackup"
        }
        [IO.File]::WriteAllText($propertyPath, $propertyText, [Text.Encoding]::ASCII)
    }

    $dataQuery = "SELECT 'category',COUNT(*) FROM category UNION ALL SELECT 'product',COUNT(*) FROM product UNION ALL SELECT 'user',COUNT(*) FROM user UNION ALL SELECT 'promotion',COUNT(*) FROM promotion;"
    $data = Invoke-Docker -DockerArguments ($composeArguments +
        @('exec', '-T', 'mysql', 'sh', '-c', $clientCommand)) -InputText $dataQuery
    Assert-DockerSuccess $data 'Could not read database row counts.'
    Write-Host $data.Output

    $catalogQuery = "SELECT COUNT(*) FROM product WHERE id IN (1,2,3) AND price >= 100000;"
    $catalog = Invoke-Docker -DockerArguments ($composeArguments +
        @('exec', '-T', 'mysql', 'sh', '-c', $clientCommand)) -InputText $catalogQuery
    Assert-DockerSuccess $catalog 'Could not verify catalog prices.'
    if ([int]$catalog.Output.Trim() -gt 0) {
        Write-Host 'Legacy VND demo prices remain in this database. Recreate the project database volume when you are ready to load the English/USD catalog.' -ForegroundColor Yellow
    }
    Write-Host ''
    Write-Host "MySQL is ready: 127.0.0.1:$port / Web_Ban_Giay / user $mysqlUser" -ForegroundColor Green
    Write-Host 'Java db.properties is synchronized with .env. Build/deploy the WAR after config changes.'
    exit 0
} catch {
    Write-Host ''
    Write-Host ('ERROR: ' + $_.Exception.Message) -ForegroundColor Red
    exit 1
}
