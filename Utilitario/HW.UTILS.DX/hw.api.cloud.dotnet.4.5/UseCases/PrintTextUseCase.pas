unit PrintTextUseCase;

interface

uses
  UseCaseBase_45;

type
  TPrintTextUseCase = class(TUseCaseBase_45)
  public
    function Run(text: string): Boolean;
  end;

implementation

uses
  hw_win_utils,
  PrintModels,
  System.SysUtils,
  System.Classes;

{ TPrintTextUseCase }

function TPrintTextUseCase.Run(text: string): Boolean;
begin
  Result := False;

  try

    var confName := paramsUC.Values['confName'];
    var agentId := paramsUC.Values['agentId'];
    var copies := StrToIntDef(paramsUC.Values['copies'], 1);

    var fileName := ExtractFilePath(ParamStr(0)) + confName + '.ini';
    if not FileExists(fileName) then
      raise Exception.Create('Arquivo ini de configuração não existe na pasta do sistema' + sLineBreak + fileName);

    if agentId.Trim.IsEmpty then
      raise Exception.Create('AgenteId não informado');

    var fileText := TStringList.Create;
    fileText.LoadFromFile(fileName);

    var print := TPrintTextModel.Create;
    print.Text := text;
    print.AgentId := agentId;
    print.NumberCopies := copies;
    print.PosprinterName := confName;
    print.PosprinterValue := fileText.Text;

    Result := api.PostPrintText(print);

  except on E: Exception do
    begin
      LastError := e.Message;
      LogApp.Error('TPrintTextUseCase.Run ', [e.Message]);
    end;
  end;

end;

end.
