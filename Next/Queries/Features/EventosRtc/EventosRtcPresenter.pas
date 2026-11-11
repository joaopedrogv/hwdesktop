unit EventosRtcPresenter;

interface

uses
  FilterCriterion, IDatabaseReaderUnit, ISessionContextUnit, EventosRtcQuery;

type
  // Apresentador da consulta de Eventos RTC. Le a empresa atual da sessao a cada
  // pesquisa e delega a montagem do leitor. Nao possui dataset nem leitor.
  TEventosRtcPresenter = class
  private
    FSession: ISessionContext;
    FQuery: IEventosRtcQuery;
  public
    constructor Create(ASession: ISessionContext; AQuery: IEventosRtcQuery);
    function CriarLeitor(const ACriteria: TFilterCriteria;
      ASomenteNFeAutorizada: Boolean): IDatabaseReader;
  end;

implementation

uses
  System.SysUtils;

const
  MissingSessionMessage =
    'A sessao da consulta de Eventos RTC nao foi informada.';
  MissingQueryMessage =
    'A consulta de Eventos RTC nao foi informada.';
  MissingCompanyMessage =
    'O contexto da empresa nao foi informado.';

{ TEventosRtcPresenter }

constructor TEventosRtcPresenter.Create(ASession: ISessionContext;
  AQuery: IEventosRtcQuery);
begin
  inherited Create;
  if ASession = nil then
    raise Exception.Create(MissingSessionMessage);
  if AQuery = nil then
    raise Exception.Create(MissingQueryMessage);

  FSession := ASession;
  FQuery := AQuery;
end;

function TEventosRtcPresenter.CriarLeitor(const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): IDatabaseReader;
var
  CompanyCode: Integer;
begin
  // A empresa e lida novamente a cada pesquisa; a sessao pode mudar enquanto a
  // janela permanece no host. Valor vazio ou invalido interrompe a leitura.
  CompanyCode := FSession.EmpresaId;
  if CompanyCode <= 0 then
    raise Exception.Create(MissingCompanyMessage);

  Result := FQuery.CriarLeitor(CompanyCode, ACriteria, ASomenteNFeAutorizada);
end;

end.
