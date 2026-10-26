@echo off
setlocal

set "SOURCE=D:\Hw\Projeto_Fiscal40\Modern"
set "SEVENZIP=D:\apps\7z\7za.exe"
set "BACKUP_DIR=D:\Bkp\fontes\sync-git-svn\local-svn"
set "DATESTAMP=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"
set "DATESTAMP=%DATESTAMP: =0%"

:: Verifica se o diretório SOURCE existe
if not exist "%SOURCE%" (
    echo ERRO: Origem nao encontrada: %SOURCE%
    exit /b 1
)

:: Cria pasta de backups se não existir
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

:: Caminho do arquivo ZIP de backup
set "ZIP_FILE=%BACKUP_DIR%\BACKUP_ONLY_%DATESTAMP%.zip"

echo.
echo [1/2] Criando backup ZIP de "%SOURCE%"...
if exist "%SEVENZIP%" (
    "%SEVENZIP%" a -tzip "%ZIP_FILE%" "%SOURCE%\*" >nul
    if errorlevel 1 (
        echo ERRO: Falha ao criar backup ZIP.
        exit /b 1
    ) else (
        echo Backup salvo em: %ZIP_FILE%
    )
) else (
    echo ERRO: 7za.exe nao encontrado em: %SEVENZIP%
    exit /b 1
)

:: Caminho do arquivo de exclusão
set "EXCLUDE_FILE=%SOURCE%\exclude.txt"

:: Cria ou sobrescreve exclude.txt com os itens a serem excluídos
echo \__history > "%EXCLUDE_FILE%"
echo \__recovery >> "%EXCLUDE_FILE%"
echo GPATH >> "%EXCLUDE_FILE%"
echo GRTAGS >> "%EXCLUDE_FILE%"
echo GTAGS >> "%EXCLUDE_FILE%"
echo \.vscode >> "%EXCLUDE_FILE%"
echo \package\Win32\Debug >> "%EXCLUDE_FILE%"
echo exclude.txt >> "%EXCLUDE_FILE%"

echo.
echo [2/2] Excluindo arquivos e pastas listados em exclude.txt...

:: Lê cada linha do exclude.txt
for /f "usebackq eol=; tokens=* delims=" %%i in ("%EXCLUDE_FILE%") do (
    set "ITEM=%%i"
    setlocal enabledelayedexpansion

    :: Monta caminho completo
    set "FULL_PATH=%SOURCE%\!ITEM!"

    :: Verifica se é diretório
    if exist "!FULL_PATH!\" (
        echo Removendo pasta: !FULL_PATH!
        rd /s /q "!FULL_PATH!" 2>nul
    ) else if exist "!FULL_PATH!" (
        echo Removendo arquivo: !FULL_PATH!
        del /q "!FULL_PATH!" 2>nul
    ) else (
        echo Nao encontrado: !FULL_PATH!
    )

    endlocal
)

:: === EXCLUSÃO RECURSIVA PARA __history e __recovery ===
echo.
echo [Extra] Excluindo recursivamente __history e __recovery em todos os subdiretorios...

for /r "%SOURCE%" %%d in (__history __recovery) do (
    if exist "%%d\" (
        echo Removendo pasta recursiva: %%d
        rd /s /q "%%d" 2>nul
    ) else if exist "%%d" (
        echo Removendo arquivo recursivo: %%d
        del /q "%%d" 2>nul
    )
)

:: === EXCLUSÃO RECURSIVA PARA __history e __recovery ===
echo.
echo [Extra] Excluindo recursivamente __history e __recovery em todos os subdiretorios...

for /r "%SOURCE%\package\Win32" %%d in (Debug) do (
    if exist "%%d" (
        echo Removendo arquivo recursivo: %%d
        del /q "%%d" 2>nul
    )
)

:: Remove o próprio exclude.txt no final
::del /q "%EXCLUDE_FILE%"

echo.
echo Limpeza concluida! Backup ZIP criado e arquivos indesejados removidos.
pause