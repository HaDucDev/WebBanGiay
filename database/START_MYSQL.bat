@echo off
setlocal
cd /d "%~dp0"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0mysql.ps1" -Action Start
set "mysql_task_exit=%ERRORLEVEL%"
if /I "%~1"=="--no-pause" goto finished
echo.
pause
:finished
exit /b %mysql_task_exit%
