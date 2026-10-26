@echo off
:: =========================================================
:: BUILD SELECT - Wrapper para o script PowerShell
:: Permite selecionar pacotes individualmente para compilacao
:: =========================================================

:: Verifica se o PowerShell esta disponivel
where powershell >nul 2>&1
if errorlevel 1 (
    echo Erro: PowerShell nao encontrado no sistema.
    pause
    exit /b 1
)

:: Obtém o diretorio do script sem aspas extras
set "SCRIPT_DIR=%~dp0.."

:: Remove a barra final se existir para evitar problemas
if "%SCRIPT_DIR:~-1%"=="\" set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

:: Executa o script PowerShell passando o diretorio atual
powershell -ExecutionPolicy Bypass -File "%~dp0build-select.ps1" -ScriptDir "%SCRIPT_DIR%"

pause