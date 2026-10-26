@echo off
setlocal enabledelayedexpansion

:: =========================================================
:: 1. Validar Parametros
:: =========================================================
if "%~1"=="" ( echo Erro: Nome do pacote nao informado. & exit /b 1 )
if "%~2"=="" ( echo Erro: Caminho relativo do pacote nao informado. & exit /b 1 )

set "PKG_NAME=%~1"
set "PK_REL_PATH=%~2"
set "BUILD_TYPE=%~3"
if "!BUILD_TYPE!"=="" set "BUILD_TYPE=NORMAL"

:: =========================================================
:: 2. Carregar Configuracoes de Ambiente
:: =========================================================
set "CONFIG_FILE=%~dp0..\config\config-paths.bat"
if not exist "!CONFIG_FILE!" (
    echo Erro: Arquivo de configuracao nao encontrado: !CONFIG_FILE!
    pause & exit /b 1
)
call "!CONFIG_FILE!"

:: =========================================================
:: 3. Preparar Ambiente e Caminhos
:: =========================================================
cd "!PK_REL_PATH!"
set "DPK_DIR=%cd%"

set "ZIP_APP=!FUNC_BASE!\zipdx.exe"
set "BRCC32=!BORLAND_BASE!\Bin\brcc32.exe"
set "DCC32=!BORLAND_BASE!\Bin\dcc32.exe"
set "SCRIPTS_DIR=!PROJETO_BASE!\scripts\versoes"

:: Verificar ferramentas basicas
if not exist "!DCC32!" ( echo Erro: dcc32.exe nao encontrado em !DCC32! & pause & exit /b 1 )
if not exist "!BRCC32!" ( echo Erro: brcc32.exe nao encontrado em !BRCC32! & pause & exit /b 1 )

if "!BUILD_TYPE!"=="SQL_RES" (
    if not exist "!ZIP_APP!" ( echo Erro: zipdx.exe nao encontrado em !ZIP_APP! & pause & exit /b 1 )
)

:: =========================================================
:: 4. BLOCO ESPECIAL: SQL_RES (Logica do pkReestrutura)
:: =========================================================
if "!BUILD_TYPE!"=="SQL_RES" (
    echo.
    echo --------------------------------------------------
    echo Executando build especial SQL_RES para %PKG_NAME%
    echo --------------------------------------------------

    set "MANIFEST_FILE=!DPK_DIR!\manifest.txt"
    set "TEMP_MANIFEST=!DPK_DIR!\manifest_temp.txt"

    :: Ler build atual
    set "CURRENT_BUILD=0"
    set "BUILD_NUMBER=1"
    if exist "!MANIFEST_FILE!" (
        for /f "tokens=2 delims==" %%b in ('findstr /i "^build=" "!MANIFEST_FILE!"') do (
            set "CURRENT_BUILD=%%b"
            set /a BUILD_NUMBER=%%b+1
        )
    )
    if exist "!TEMP_MANIFEST!" del "!TEMP_MANIFEST!"

    :: Gerar manifesto TEMPORARIO
    echo Gerando manifesto base...
    set "LAST_NUM=0"
    set "LAST_NAME=000"
    for %%f in ("!SCRIPTS_DIR!\*.sql") do (
        set "nome=%%~nf"
        "!ZIP_APP!" "%%f" "!TEMP_MANIFEST!" > NUL

        set "num=%%~nf"
        for /f "tokens=* delims=0" %%n in ("!num!") do (
            if "%%n"=="" (set "val=0") else (set "val=%%n")
        )
        if !val! GTR !LAST_NUM! (
            set "LAST_NUM=!val!"
            set "LAST_NAME=%%~nf"
        )
    )

    :: Comparar manifestos
    set "OLD_SCRIPTS=!DPK_DIR!\manifest_old_scripts.txt"
    if exist "!OLD_SCRIPTS!" del "!OLD_SCRIPTS!"
    if exist "!MANIFEST_FILE!" (
        findstr /v /i "^build= ^last= ^manifest\.txt=" "!MANIFEST_FILE!" > "!OLD_SCRIPTS!"
    )

    set "BUILD_CHANGED=1"
    if exist "!OLD_SCRIPTS!" (
        fc /b "!OLD_SCRIPTS!" "!TEMP_MANIFEST!" >nul 2>&1
        if errorlevel 1 (
            echo Detectada alteracao nos scripts. Build sera incrementado.
            set "BUILD_CHANGED=1"
        ) else (
            echo Nenhuma alteracao detectada. Mantendo build atual.
            set "BUILD_CHANGED=0"
            set "BUILD_NUMBER=!CURRENT_BUILD!"
            if "!BUILD_NUMBER!"=="0" set "BUILD_NUMBER=1"
        )
    ) else (
        echo Primeira execucao. Build iniciado em 1.
    )

    :: Montar manifesto final
    if exist "!MANIFEST_FILE!" del "!MANIFEST_FILE!"
    type "!TEMP_MANIFEST!" >> "!MANIFEST_FILE!"
    >>"!MANIFEST_FILE!" echo build=!BUILD_NUMBER!
    >>"!MANIFEST_FILE!" echo last=!LAST_NAME!
    "!ZIP_APP!" "!MANIFEST_FILE!" "!MANIFEST_FILE!" > NUL

    set "MANIFEST_CRC="
    for /f "tokens=2 delims==" %%c in ('findstr /i "^manifest\.txt=" "!MANIFEST_FILE!"') do set "MANIFEST_CRC=%%c"
    if "!MANIFEST_CRC!"=="" ( echo Erro: CRC do manifesto falhou. & pause & exit /b 1 )
    echo !MANIFEST_CRC! > "!DPK_DIR!\manifest_crc.txt"

    :: Gerar .rc
    set "RC_FILE=!DPK_DIR!\RecursosSQL.rc"
    if exist "!RC_FILE!" del "!RC_FILE!"
    set "ZIP_REL_PATH=..\..\scripts\versoes"
    for %%f in ("!SCRIPTS_DIR!\*.zip") do (
        set "nome=SQL_%%~nf"
        echo !nome! RCDATA "!ZIP_REL_PATH!\%%~nxf" >> "!RC_FILE!"
    )
    echo MANIFEST RCDATA "manifest.txt" >> "!RC_FILE!"
    echo MANIFEST_CRC RCDATA "manifest_crc.txt" >> "!RC_FILE!"

    :: Compilar .rc -> .res
    "!BRCC32!" "!RC_FILE!" > NUL
    if errorlevel 1 (
        echo Falha ao compilar .rc: "!BRCC32!" "!RC_FILE!"  & pause & exit /b 1
    )

    :: Limpeza SQL_RES
    if exist "!TEMP_MANIFEST!" del "!TEMP_MANIFEST!"
    if exist "!OLD_SCRIPTS!" del "!OLD_SCRIPTS!"
    del "!MANIFEST_FILE:.txt=.zip!" /Q
    del "!SCRIPTS_DIR!\*.zip" >nul 2>&1

    echo Build SQL gerado: !BUILD_NUMBER!
)

:: =========================================================
:: 5. Gerar .res minimo se nao existir (Pacotes NORMAIS)
:: =========================================================
set "RES_FILE=!DPK_DIR!\!PKG_NAME!.res"
if not exist "!RES_FILE!" (
    if "!BUILD_TYPE!"=="NORMAL" (
        echo Gerando arquivo .res minimo para !PKG_NAME!...
        echo. > "!DPK_DIR!\!PKG_NAME!.rc"
        "!BRCC32!" "!DPK_DIR!\!PKG_NAME!.rc"
        if errorlevel 1 ( echo Erro ao gerar !RES_FILE! & exit /b 1 )
        del "!DPK_DIR!\!PKG_NAME!.rc" >nul
    )
)

:: =========================================================
:: 6. Compilacao do DPK
:: =========================================================
set "DPK_FILE=!DPK_DIR!\!PKG_NAME!.dpk"
if not exist "!DPK_FILE!" (
    echo Erro: Arquivo DPK nao encontrado: !DPK_FILE!
    pause & exit /b 1
)

:: Montar UNIT_DIR e INCLUDE_DIR usando as variaveis do config_paths.bat
set "UNIT_DIR=!UNIT_DIR!;!RADAR_BASE!"
set "UNIT_DIR=!UNIT_DIR!;!BORLAND_BASE!\Imports"
set "UNIT_DIR=!UNIT_DIR!;!BORLAND_BASE!\lib\Indy10"
:: set "UNIT_DIR=!FUNC_BASE!\EditMoeda;!FUNC_BASE!\EditHw;!FUNC_BASE!\enterHW;!FUNC_BASE!\rdprint\Delphi2006"
:: set "UNIT_DIR=!UNIT_DIR!;!BPL_DIR!"
:: set "UNIT_DIR=!UNIT_DIR!;!PROJETO_BASE!\dcp"
:: set "UNIT_DIR=!UNIT_DIR!;!PROJETO_BASE!\Ativos\fonte"
:: set "UNIT_DIR=!UNIT_DIR!;!PROJETO_BASE!\Fiscal Bpl\fonte"
:: set "UNIT_DIR=!UNIT_DIR!;!PROJETO_BASE!\Form Pag\fonte"

:: set "INCLUDE_DIR=!FUNC_BASE!\EditMoeda;!FUNC_BASE!\EditHw;!FUNC_BASE!\enterHW;!PROJETO_BASE!\dcu"

set DCC_PARAMS=-Q -B -I"!INCLUDE_DIR!" -U"!UNIT_DIR!"

echo Compilando pacote !DPK_FILE!...

"!DCC32!" !DCC_PARAMS! "!DPK_FILE!" > NUL

if errorlevel 1 (
    echo Erro de compilacao.
    set /p "OPCAO=Compilar novamente com o log ativo? (S/N): "

    if /i "!OPCAO!"=="S" (
        "!DCC32!" !DCC_PARAMS! "!DPK_FILE!"
    )
    exit /b 1
)

echo.
echo Processo concluido com sucesso para !PKG_NAME!
endlocal