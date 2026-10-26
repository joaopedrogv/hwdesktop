@echo off
setlocal enabledelayedexpansion

:: =========================================================
:: BUILD AND DEPLOY - Orquestrador Completo
:: Executa o build e, se nao houver erros, executa o deploy
:: =========================================================

:: Define o diretorio onde este script esta (pasta _deploy)
set "SCRIPT_DIR=%~dp0"

:: Define os caminhos dos scripts que serao chamados
set "BUILD_SCRIPT=%SCRIPT_DIR%build-all.bat"
set "DEPLOY_SCRIPT=%SCRIPT_DIR%deploy-all.bat"
set "NO_CLEAN_ON_START=CLEAN"
set "NO_PAUSE_ON_ENDS=NO_PAUSE"

:: =========================================================
:: 1. Validar se os scripts existem
:: =========================================================
if not exist "%BUILD_SCRIPT%" (
    echo ==================================================
    echo ERRO: Script de build nao encontrado!
    echo ==================================================
    echo Caminho esperado: %BUILD_SCRIPT%
    echo.
    pause
    exit /b 1
)

if not exist "%DEPLOY_SCRIPT%" (
    echo ==================================================
    echo ERRO: Script de deploy nao encontrado!
    echo ==================================================
    echo Caminho esperado: %DEPLOY_SCRIPT%
    echo.
    pause
    exit /b 1
)

:: =========================================================
:: 2. Confirmacao inicial
:: =========================================================
echo.
echo ==================================================
echo  INICIANDO PROCESSO COMPLETO: BUILD + DEPLOY
echo ==================================================
echo.
echo  Este processo ira:
echo    1. Compilar todos os pacotes (build-all.bat)
echo    2. Copiar os BPLs para a rede (deploy-all.bat)
echo.
set /p "CONFIRMA=  Deseja continuar? (S/N): "
if /i "!CONFIRMA!" neq "S" (
    echo.
    echo Processo cancelado pelo usuario.
    pause
    exit /b 0
)

:: =========================================================
:: 3. ETAPA 1: BUILD
:: =========================================================
echo.
echo ==================================================
echo  ETAPA 1/2: EXECUTANDO BUILD
echo ==================================================
echo.
echo Inicio do build: %date% %time%
echo.

call "%BUILD_SCRIPT%" "%NO_CLEAN_ON_START%" "%NO_PAUSE_ON_ENDS%"

:: Captura o codigo de erro imediatamente apos a chamada
set "BUILD_ERROR=!ERRORLEVEL!"

echo.
echo Fim do build: %date% %time%
echo.

:: Verifica se houve erro no build
if !BUILD_ERROR! neq 0 (
    echo ==================================================
    echo  *** FALHA NO BUILD ***
    echo ==================================================
    echo.
    echo  O build terminou com erros.
    echo  O deploy NAO sera executado.
    echo.
    echo  Corrija os erros de compilacao e tente novamente.
    echo.
    pause
    exit /b 1
)

:: =========================================================
:: 4. ETAPA 2: DEPLOY (somente se o build foi bem-sucedido)
:: =========================================================
echo ==================================================
echo  ETAPA 2/2: EXECUTANDO DEPLOY
echo ==================================================
echo.
echo  Build concluido com sucesso!
echo  Iniciando copia dos arquivos para a rede...
echo.
echo Inicio do deploy: %date% %time%
echo.

call "%DEPLOY_SCRIPT%" "%NO_PAUSE_ON_ENDS%"

:: Captura o codigo de erro imediatamente apos a chamada
set "DEPLOY_ERROR=!ERRORLEVEL!"

echo.
echo Fim do deploy: %date% %time%
echo.

:: Verifica se houve erro no deploy
if !DEPLOY_ERROR! neq 0 (
    echo ==================================================
    echo  *** FALHA NO DEPLOY ***
    echo ==================================================
    echo.
    echo  O build foi concluido com sucesso,
    echo  mas houve erros ao copiar os arquivos para a rede.
    echo.
    echo  Verifique:
    echo    - Conexao com a rede
    echo    - Permissoes na pasta de destino
    echo    - Se algum arquivo esta em uso
    echo.
    pause
    exit /b 1
)

:: =========================================================
:: 5. SUCESSO TOTAL
:: =========================================================
echo ==================================================
echo  *** PROCESSO CONCLUIDO COM SUCESSO ***
echo ==================================================
echo.
echo  Build  : OK
echo  Deploy : OK
echo.
echo  Todos os pacotes foram compilados e copiados
echo  para o diretorio de destino com sucesso.
echo.
pause
exit /b 0