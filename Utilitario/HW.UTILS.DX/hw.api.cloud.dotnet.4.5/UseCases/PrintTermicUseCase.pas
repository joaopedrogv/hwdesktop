unit PrintTermicUseCase;

interface

uses
  UseCaseBase_45;

type
  TPrintTermicUseCase = class(TUseCaseBase_45)
  public
    function Run(text: string): Boolean;
  end;

implementation

uses
  hw_win_utils,
  PrintModels,
  System.SysUtils,
  System.Classes;

{ TPrintTermicUseCase }

function TPrintTermicUseCase.Run(text: string): Boolean;
begin
  Result := False;

  try

    var nameFile := paramsUC.Values['name'];
    var agentId := paramsUC.Values['agentId'];

    if agentId.Trim.IsEmpty then
      raise Exception.Create('AgenteId não informado');

    var print := TPrintTermicModel.Create;
    print.text := text;
    print.name := nameFile;
    print.AgentId := agentId;

    Result := api.PostPrintTermic(print);

  except on E: Exception do
    begin
      LastError := e.Message;
      LogApp.Error('TPrintTermicUseCase.Run ', [e.Message]);
    end;
  end;
end;

end.
