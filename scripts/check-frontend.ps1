param(
    [string]$BaseUrl = 'http://localhost:8080/LastEcommerce'
)

$ErrorActionPreference = 'Stop'
$appUri = [Uri]($BaseUrl.TrimEnd('/') + '/')
$webRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../src/main/webapp'))
$failures = New-Object 'System.Collections.Generic.List[string]'
$assets = New-Object 'System.Collections.Generic.HashSet[string]'
$pending = New-Object 'System.Collections.Generic.Queue[string]'
$pageCount = 0
$assetCount = 0

function Read-Response([string]$Url) {
    try {
        return Invoke-WebRequest -Uri $Url -UseBasicParsing -TimeoutSec 20
    } catch {
        $failures.Add("Request failed: $Url - $($_.Exception.Message)")
        return $null
    }
}

function Add-Asset([string]$Reference, [Uri]$ParentUri) {
    if ([string]::IsNullOrWhiteSpace($Reference) -or $Reference.StartsWith('data:')) { return }
    $uri = New-Object Uri($ParentUri, [Net.WebUtility]::HtmlDecode($Reference))
    if ($uri.Authority -eq $appUri.Authority -and $uri.Scheme -eq $appUri.Scheme) {
        if ($assets.Add($uri.AbsoluteUri)) { $pending.Enqueue($uri.AbsoluteUri) }
    }
}

$pages = @('', 'login?action=login', 'category', 'category?action=giay-nam',
    'category?action=giay-nu', 'cart', 'blog', 'blog-single', 'contact',
    'admin', 'admin/product', 'admin/user', 'admin/order', 'admin/category')

foreach ($page in $pages) {
    $uri = New-Object Uri($appUri, $page)
    $response = Read-Response $uri.AbsoluteUri
    if ($null -eq $response) { continue }
    $pageCount++
    $html = [string]$response.Content
    foreach ($tag in @('html', 'head', 'body')) {
        if ([regex]::Matches($html, "<$tag\b", 'IgnoreCase').Count -ne 1) {
            $failures.Add("Expected exactly one <$tag> in $uri")
        }
    }
    if ($page -eq '') {
        $detail = [regex]::Match($html, 'href="([^"]*/product-detail\?id=\d+)"')
        if ($detail.Success) {
            $detailUri = New-Object Uri($appUri, $detail.Groups[1].Value)
            $detailResponse = Read-Response $detailUri.AbsoluteUri
            if ($null -ne $detailResponse -and $detailResponse.Content -notmatch '(?:Product|Web) ID: \d+') {
                $failures.Add("Product details were empty: $detailUri")
            }
        }
    }
    foreach ($match in [regex]::Matches($html, '<(?:img|script|link)\b[^>]*?\b(?:src|href)=["'']([^"'']+)["'']', 'IgnoreCase')) {
        Add-Asset $match.Groups[1].Value $uri
    }
}

while ($pending.Count -gt 0) {
    $uri = [Uri]$pending.Dequeue()
    $response = Read-Response $uri.AbsoluteUri
    if ($null -eq $response) { continue }
    $assetCount++
    $type = [string]$response.Headers['Content-Type']
    if ($type -match '^text/html') {
        $failures.Add("Static resource returned HTML: $uri")
        continue
    }
    $relative = [Uri]::UnescapeDataString($uri.AbsolutePath.Substring($appUri.AbsolutePath.TrimEnd('/').Length)).TrimStart('/')
    $diskPath = [IO.Path]::GetFullPath((Join-Path $webRoot $relative))
    if ($diskPath.StartsWith($webRoot + [IO.Path]::DirectorySeparatorChar) -and (Test-Path -LiteralPath $diskPath -PathType Leaf)) {
        $sha = [Security.Cryptography.SHA256]::Create()
        try {
            $servedHash = [BitConverter]::ToString($sha.ComputeHash($response.RawContentStream.ToArray()))
            $localHash = [BitConverter]::ToString($sha.ComputeHash([IO.File]::ReadAllBytes($diskPath)))
            if ($servedHash -ne $localHash) { $failures.Add("Response differs from the source file: $uri") }
        } finally { $sha.Dispose() }
    }
    if ($type -match '^text/css') {
        foreach ($match in [regex]::Matches([string]$response.Content, 'url\(\s*["'']?([^\s\)"'']+)', 'IgnoreCase')) {
            if ($match.Groups[1].Value -notmatch '^#') { Add-Asset $match.Groups[1].Value $uri }
        }
    }
}

try {
    $null = Invoke-WebRequest -Uri ($appUri.AbsoluteUri + 'assets/no-such-frontend-file.css') -UseBasicParsing -TimeoutSec 10
    $failures.Add('A missing CSS file must return 404, not an HTML page with status 200.')
} catch {
    if ($null -eq $_.Exception.Response -or [int]$_.Exception.Response.StatusCode -ne 404) {
        $failures.Add('The missing-resource check did not return HTTP 404.')
    }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Host "FAIL: $_" -ForegroundColor Red }
    throw "$($failures.Count) frontend checks failed."
}
Write-Host "PASS: $pageCount pages and $assetCount local resources. CSS, JavaScript, fonts and images returned their real content."
