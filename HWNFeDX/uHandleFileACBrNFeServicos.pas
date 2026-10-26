unit uHandleFileACBrNFeServicos;

interface

procedure HandleFileACBrNFeServicos;

implementation

uses
  hw_win_utils,
  System.SysUtils,
  Vcl.forms;

procedure HandleFileACBrNFeServicos;

const KEY_ACBR_DATA = 'ACBrNFeServicos_20230307';

begin
  // Ha casos que precisamos enviar o arquivo "ACBrNFeServicos.ini" para corrigir alguma url, isso quando for impossivel compilar a dll
  // Sendo assim da proxima vez que for complilar a dll com as novas urls uma novo teste deve ser colocado aqui
  // O novo teste consiste em excluir o arquivo e gravar no config essa nova chave indicando que foi excluido
  // Caso no futuro precise do arquivo "ACBrNFeServicos.ini" novamente basta colocar o mesmo na pasta do sistema, o config ja foi
  //   setado que a exclusao foi feita e não irá excluir novamente até que modificado aqui para excluir
  //  Sempre substituir a data para a data de quando ocorrer o problema

  if not FileExists(ExtractFilePath(ParamStr(0)) + 'ACBrNFeServicos.ini') then
    Exit;

  // Quer dizer que ja foi excluido e por algum motivo precisou colocar o arquivo na pasta novamente para usar novas urls
  if IniConf.ReadStr(KEY_ACBR_DATA, 'Handled', '') = 'S'  then
    Exit;

  DeleteFile(ExtractFilePath(ParamStr(0)) + 'ACBrNFeServicos.ini');

  if not FileExists(ExtractFilePath(ParamStr(0)) + 'ACBrNFeServicos.ini') then
  begin
    IniConf.Write(KEY_ACBR_DATA, 'Handled', 'S');
    Exit;
  end;
end;

end.
