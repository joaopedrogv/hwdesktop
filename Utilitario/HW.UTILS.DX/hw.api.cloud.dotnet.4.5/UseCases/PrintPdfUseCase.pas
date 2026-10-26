unit PrintPdfUseCase;

interface

uses
  UseCaseBase_45;

type
  TPrintPdfUseCase = class(TUseCaseBase_45)
  public
    function Run(text: string): Boolean;
  end;

implementation

uses
  hw_win_utils,
  PrintModels,
  System.SysUtils,
  System.Classes;

{ TPrintPdfUseCase }

function TPrintPdfUseCase.Run(text: string): Boolean;
begin
  Result := False;

  try

    var nameFile := paramsUC.Values['name'];
    var agentId := paramsUC.Values['agentId'];

    if agentId.Trim.IsEmpty then
      raise Exception.Create('AgenteId não informado');

    var print := TPrintPDFModel.Create;
    print.printName := nameFile;
    print.pdfBase64 := text;
    print.AgentId := agentId;

    Result := api.PostPrintPdf(print);

  except on E: Exception do
    begin
      LastError := e.Message;
      LogApp.Error('TPrintPdfUseCase.Run ', [e.Message]);
    end;
  end;
end;

end.
