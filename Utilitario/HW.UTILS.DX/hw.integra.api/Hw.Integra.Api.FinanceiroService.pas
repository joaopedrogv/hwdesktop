unit Hw.Integra.Api.FinanceiroService;

interface

uses
  Hw.Servicos,
  Hw.Integra.Api,
  Hw.Integra.Api.NotificacaoContasEmAberto;

type
  TFinanceiroService = class(THwIntegraApi)
  private
    FConsulta: THwServicosJSON;
  public
    function NotificacaoContasEmAberto: TNotificacaoContasEmAberto;

    property Consulta: THwServicosJSON read FConsulta write FConsulta;
  end;

implementation

uses
  Hw.Api.Rest,
  HW.Utils.Classes.Registros_DX,
  System.SysUtils;

{ TFinanceiroService }

function TFinanceiroService.NotificacaoContasEmAberto: TNotificacaoContasEmAberto;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := nil;
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('Financeiro/%s/NotificacaoContas', [CNPJ]);
      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
        Result := THwClassRegistros.FromJsonString<TNotificacaoContasEmAberto>(Api.JSONReponse)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter Contas em Aberto';
      FLastError.Local := 'TFinanceiroService.NotificacaoContasEmAberto';
      FLastError.Exception := e.Message;
    end;
  end;
end;

end.
