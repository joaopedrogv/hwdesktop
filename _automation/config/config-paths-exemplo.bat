@echo off
:: Esse arquivo é apenas um exemplo, crie uma cópia e renomeie para "config_paths.bat"
:: =========================================================
:: Arquivo de Configuracao de Caminhos (config_paths.bat)
:: Altere as variaveis abaixo conforme o ambiente (XP ou Win 11)
:: =========================================================
:: --- Windows 11 ---
set "BORLAND_BASE=C:\Program Files (x86)\Borland\BDS\4.0"
set "RADAR_BASE=C:\Program Files (x86)\RadarSoft\HierCube\D10\lib"
set "PROJETO_BASE=..\..\"
set "FUNC_BASE=D:\func"
set "BPL_DIR=%USERPROFILE%\Documents\Borland Studio Projects\Bpl"

:: --- Windows XP (Descomente as linhas abaixo e comente as do Win 11 se necessario) ---
:: set "BORLAND_BASE=C:\Arquivos de programas\Borland\BDS\4.0"
:: set "PROJETO_BASE=C:\Projeto_Fiscal40"
:: set "RADAR_BASE=C:\Arquivos de programas\RadarSoft\HierCube\D10\lib"
:: set "FUNC_BASE=C:\func"
:: set "BPL_DIR=%USERPROFILE%\Meus documentos\Borland Studio Projects\Bpl"