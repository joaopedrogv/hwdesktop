@echo off
setlocal enabledelayedexpansion

:: =========================================================
:: 1. Definir Caminhos de forma segura
:: =========================================================
:: %~dp0 pega o caminho exato de onde este script está (pasta _automation\legados)
set "DEPLOY_DIR=%~dp0..\"
set "ORDER_FILE=%DEPLOY_DIR%config\package-list.txt"
set "NO_PAUSE_ON_ENDS=%~1"

:: Navega para a raiz do projeto (um nível acima de _automation)
cd /d "%DEPLOY_DIR%.."
set "PROJ_ROOT=%cd%"

:: =========================================================
:: 2. Limpar pasta DCU global (se existir)
:: =========================================================
if exist "dcu" (
    echo Limpando arquivos DCU globais...
    del /q "dcu\*.dcu" >nul 2>&1
    echo.
)

if not exist "%ORDER_FILE%" (
    echo Erro: Arquivo de ordem nao encontrado: %ORDER_FILE%
    pause
    exit /b 1
)

echo Limpando arquivos DCP e BPL listados em package-list.txt...
echo.

:: =========================================================
:: 3. Excluir DCPs e BPLs
:: =========================================================
:: O novo formato do package-list.txt é: NomeDoPacote;CaminhoRelativo;TipoDeBuild
:: Usamos "tokens=1 delims=;" para extrair apenas o nome do pacote (a primeira coluna)
:: Usamos "eol=#" para ignorar linhas de comentário no arquivo de texto.

for /f "usebackq tokens=1 delims=; eol=#" %%A in ("%ORDER_FILE%") do (
    set "pkg=%%A"

    :: Remove espaços em branco acidentais nas pontas do nome
    for /f "tokens=* delims= " %%x in ("!pkg!") do set "pkg=%%x"

    if "!pkg!" neq "" (
        :: Excluir .dcp
        if exist "dcp\!pkg!.dcp" (
            del "dcp\!pkg!.dcp"
            echo   [DCP] !pkg!.dcp
        )

        :: Excluir .bpl
        if exist "bpl\!pkg!.bpl" (
            del "bpl\!pkg!.bpl"
            echo   [BPL] !pkg!.bpl
        )
    )
)

echo.
echo ==================================================
echo LIMPEZA CONCLUIDA
echo ==================================================


if /i not "%NO_PAUSE_ON_ENDS%"=="NO_PAUSE" (
    echo.
    pause
)