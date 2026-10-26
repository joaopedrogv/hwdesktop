@echo off
setlocal

set "MENU_SCRIPT=%~dp0menu.ps1"
set "PWSH_EXE="

rem Prefere a instalacao estavel; permite outras instalacoes disponiveis no PATH.
if exist "%ProgramFiles%\PowerShell\7\pwsh.exe" set "PWSH_EXE=%ProgramFiles%\PowerShell\7\pwsh.exe"
if not defined PWSH_EXE (
    for /f "delims=" %%P in ('where.exe pwsh.exe 2^>nul') do if not defined PWSH_EXE set "PWSH_EXE=%%P"
)

if not defined PWSH_EXE (
    echo.
    echo Este menu requer PowerShell 7.5 ou superior.
    echo Instale o PowerShell 7 e abra este arquivo novamente.
    echo https://aka.ms/powershell-release?tag=stable
    echo.
    pause
    exit /b 2
)

if not exist "%MENU_SCRIPT%" (
    echo Nao foi encontrado o arquivo "%MENU_SCRIPT%".
    pause
    exit /b 2
)

"%PWSH_EXE%" -NoLogo -NoProfile -File "%MENU_SCRIPT%" %*
set "MENU_EXIT_CODE=%ERRORLEVEL%"

if not "%MENU_EXIT_CODE%"=="0" (
    echo.
    echo O menu terminou com erro. Confira a mensagem acima.
    pause
)

exit /b %MENU_EXIT_CODE%
