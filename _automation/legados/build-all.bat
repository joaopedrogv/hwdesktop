@echo off
setlocal enabledelayedexpansion

cd ..

set "CONFIG_DIR=%~dp0..\config"
set "ORDER_FILE=!CONFIG_DIR!\package-list.txt"
set "BUILD_SCRIPT=%~dp0..\core\build-package.bat"
set "CLEAN_SCRIPT=%~dp0clean.bat"
set "NO_CLEAN_ON_START=%~1"
set "NO_PAUSE_ON_ENDS=%~2"
set "NO_PAUSE_ON_ENDS_CLEAN=!NO_PAUSE_ON_ENDS!"

if "!NO_PAUSE_ON_ENDS!"=="" if "!NO_CLEAN_ON_START!"=="" set "NO_PAUSE_ON_ENDS_CLEAN=NO_PAUSE"

echo Parametro NO_PAUSE_ON_ENDS_CLEAN: !NO_PAUSE_ON_ENDS_CLEAN!

if not exist "!ORDER_FILE!" (
    echo Erro: Arquivo de ordem nao encontrado: !ORDER_FILE!
    pause & exit /b 1
)
if not exist "!BUILD_SCRIPT!" (
    echo Erro: Script de build nao encontrado: !BUILD_SCRIPT!
    pause & exit /b 1
)

:: Chamando clean.bat
if /i not "%NO_CLEAN_ON_START%"=="NO_CLEAN" (
    echo Executando limpeza dos pacotes...
    call "%CLEAN_SCRIPT%" "!NO_PAUSE_ON_ENDS_CLEAN!"
)

echo Iniciando build dos pacotes na ordem especificada...
echo.

for /f "usebackq tokens=1,2,3 delims=; eol=#" %%A in ("!ORDER_FILE!") do (
    set "PK_NAME=%%A"
    set "PK_PATH=%%B"
    set "BUILD_TYPE=%%C"

    :: Remove espacos em branco acidentais
    for /f "tokens=* delims= " %%x in ("!PK_NAME!") do set "PK_NAME=%%x"
    for /f "tokens=* delims= " %%x in ("!PK_PATH!") do set "PK_PATH=%%x"
    for /f "tokens=* delims= " %%x in ("!BUILD_TYPE!") do set "BUILD_TYPE=%%x"

    if "!PK_NAME!" neq "" (
        if "!BUILD_TYPE!"=="" set "BUILD_TYPE=NORMAL"

        echo ==================================================
        echo Build: !PK_NAME! [Tipo: !BUILD_TYPE!]
        echo ==================================================

        call "!BUILD_SCRIPT!" "!PK_NAME!" "!PK_PATH!" "!BUILD_TYPE!"

        if errorlevel 1 (
            echo.
            echo FALHA: Build !PK_NAME! nao concluido com sucesso.
            pause
            exit /b 1
        )
        echo.
    )
)

echo ==================================================
echo BUILD CONCLUIDO COM SUCESSO!
echo ==================================================

if /i not "%NO_PAUSE_ON_ENDS%"=="NO_PAUSE" (
    echo.
    pause
)
