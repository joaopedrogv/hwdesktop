unit PrintNFCeUseCase;

interface

uses
  UseCaseBase_45;

type
  TPrintNFCeUseCase = class(TUseCaseBase_45)
  public
    function Run(xmlAut, xmlCan: string): Boolean;
  end;

implementation

uses
  hw_win_utils,
  PrintModels,
  System.SysUtils,
  System.Classes;

{ TPrintNFCeUseCase }

function TPrintNFCeUseCase.Run(xmlAut, xmlCan: string): Boolean;
begin
  Result := False;

  try
    var agentId := paramsUC.Values['agentId'];
    var confName := paramsUC.Values['confName'];
    var nfceConfName := paramsUC.Values['nfceConfName'];
    var copies := StrToIntDef(paramsUC.Values['copies'], 1);
    var printParams := paramsUC.Values['printParams'];

    var posPrinterFileName := ExtractFilePath(ParamStr(0)) + confName + '.ini';
    if not FileExists(posPrinterFileName) then
      raise Exception.Create('Arquivo ini de configuração para impressora Nao Fiscal não existe na pasta do sistema' + sLineBreak + posPrinterFileName);

    var nfceIniFileName := ExtractFilePath(ParamStr(0)) + nfceConfName + '.ini';
    if not FileExists(nfceIniFileName) then
      raise Exception.Create('Arquivo ini de configuração de impressão da NFCe não existe na pasta do sistema' + sLineBreak + nfceIniFileName);

    if agentId.Trim.IsEmpty then
      raise Exception.Create('AgenteId não informado');

    var posPrinterFileText := TStringList.Create;
    posPrinterFileText.LoadFromFile(posPrinterFileName);

    var nfceIniFileText := TStringList.Create;
    nfceIniFileText.LoadFromFile(nfceIniFileName);

    var payload := TPrintNFCeModel.Create;
    payload.XMLAut := xmlAut;
    payload.XMLCan := xmlCan;
    payload.AgentId := agentId;
    payload.NumberCopies := copies;
    payload.PosprinterName := confName;
    payload.PosprinterValue := posPrinterFileText.Text;
    payload.NFCeConfigName := nfceConfName;
    payload.NFCeConfigValue := nfceIniFileText.Text;
    payload.PrintParams := printParams;

    Result := api.PostPrintNFCe(payload);

  except on E: Exception do
    begin
      LastError := e.Message;
      LogApp.Error('TPrintNFCeUseCase.Run ', [e.Message]);
    end;
  end;

end;

end.
