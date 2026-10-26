@echo off
setlocal enabledelayedexpansion

:: =========================================================
:: 1. Configurações e Caminhos Robustos
:: =========================================================
:: %~dp0 garante que o script saiba onde ele está, independente de onde for chamado
set "DEPLOY_DIR=%~dp0..\"
set "ORDER_FILE=%DEPLOY_DIR%config\package-list.txt"
set "NO_PAUSE_ON_ENDS=%~1"

:: DESTINO NA REDE (Ajuste se necessario)
set "DESTINO_BPL=\\192.168.254.50\sys\hwupdatedist\0409_6_35\software"
@REM set "DESTINO_BPL=D:\Hw\dist\Hw Update\0409_6_35\software"

:: Navega para a raiz do projeto (um nível acima de _deploy)
cd /d "%DEPLOY_DIR%.."
set "PROJ_ROOT=%cd%"
set "ORIGEM_BPL=%PROJ_ROOT%\bpl"

:: =========================================================
:: 2. Validações Iniciais
:: =========================================================
if not exist "%ORDER_FILE%" (
    echo Erro: Arquivo de ordem nao encontrado: %ORDER_FILE%
    pause
    exit /b 1
)

if not exist "%ORIGEM_BPL%" (
    echo Erro: Pasta de origem dos BPLs nao encontrada: %ORIGEM_BPL%
    echo Execute o build_only.bat primeiro para gerar os BPLs.
    pause
    exit /b 1
)

:: Tenta criar o destino se nao existir (pode falhar se a rede estiver offline)
if not exist "%DESTINO_BPL%" (
    echo Criando diretorio de destino: %DESTINO_BPL%
    mkdir "%DESTINO_BPL%"
    if errorlevel 1 (
        echo Erro: Nao foi possivel criar ou acessar o diretorio de destino.
        echo Verifique se a rede esta acessivel e se voce tem permissao.
        pause
        exit /b 1
    )
)

:: =========================================================
:: 3. Execução do Deploy
:: =========================================================
echo Copiando BPLs listados em build_order.txt...
echo Origem : %ORIGEM_BPL%
echo Destino: %DESTINO_BPL%
echo.

:: Contadores para o resumo final
set "COPIADOS=0"
set "FALHAS=0"
set "NAO_ENCONTRADOS=0"

:: Lê apenas a primeira coluna (Nome do Pacote) ignorando comentários (#)
for /f "usebackq tokens=1 delims=; eol=#" %%A in ("%ORDER_FILE%") do (
    set "pkg=%%A"

    :: Remove espaços em branco acidentais
    for /f "tokens=* delims= " %%x in ("!pkg!") do set "pkg=%%x"

    if "!pkg!" neq "" (
        set "BPL_FILE=!pkg!.bpl"
        set "BPL_PATH=!ORIGEM_BPL!\!BPL_FILE!"

        if exist "!BPL_PATH!" (
            echo Copiando !BPL_FILE!...
            copy /Y "!BPL_PATH!" "%DESTINO_BPL%\" >nul

            if errorlevel 1 (
                echo   [ERRO] Falha ao copiar !BPL_FILE! para a rede.
                set /a FALHAS+=1
            ) else (
                set /a COPIADOS+=1
            )
        ) else (
            echo   [AVISO] !BPL_FILE! nao encontrado na pasta de origem.
            set /a NAO_ENCONTRADOS+=1
        )
    )
)

:: =========================================================
:: 4. Resumo Final
:: =========================================================
echo.
echo ==================================================
echo RESUMO DO DEPLOY
echo ==================================================
echo   Copiados com sucesso : !COPIADOS!
echo   Nao encontrados      : !NAO_ENCONTRADOS!
echo   Falhas de copia      : !FALHAS!
echo ==================================================

if !FALHAS! GTR 0 (
    echo ATENCAO: Houve falhas durante a copia para a rede.
    if /i not "%NO_PAUSE_ON_ENDS%"=="NO_PAUSE" (
        echo.
        pause
    )
    exit /b 1
) else (
    echo DEPLOY CONCLUIDO COM SUCESSO!
    if /i not "%NO_PAUSE_ON_ENDS%"=="NO_PAUSE" (
        echo.
        pause
    )
)