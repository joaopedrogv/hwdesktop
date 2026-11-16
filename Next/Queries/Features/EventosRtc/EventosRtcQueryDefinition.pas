unit EventosRtcQueryDefinition;

interface

uses
  IDataSetReaderUnit, QueryResultOperations, ISessionContextUnit, FilterCriterion,
  NextQueryDefinition;

type
  // Opcao da tela consultada a cada pesquisa: o checkbox pertence a view e pode
  // mudar enquanto a janela permanece aberta.
  TEventosRtcOnlyAuthorizedNFe = function: Boolean of object;

  // Definicao de leitura de Eventos RTC da empresa ativa. A fabrica e as
  // operacoes vem da composicao; a empresa e a opcao da tela sao consultadas em
  // cada pesquisa, porque a sessao e o checkbox vigentes podem mudar.
  TEventosRtcQueryDefinition = class(TNextQueryDefinitionBase)
  private
    FSession: ISessionContext;
    FOnlyAuthorizedNFe: TEventosRtcOnlyAuthorizedNFe;
  protected
    // Colunas e filtros fixos da tela; nao le sessao nem a opcao do checkbox.
    procedure Configure(); override;
    function CreateQueryDefinition(
      const ACriteria: TFilterCriteria): TNextQueryDefinition; override;
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory;
      AOperation: IQueryResultOperations; ASession: ISessionContext;
      const AOnlyAuthorizedNFe: TEventosRtcOnlyAuthorizedNFe);
  end;

implementation

uses
  System.SysUtils, ParameterValueUnit, QueryFilterSqlBuilder,
  GridColumnDefinition, FilterDefinition;

const
  AuthorizationMarker = '/*AUTORIZACAO*/';
  FilterMarker = '/*FILTROS*/';
  EventosRtcBaseSql =
    'select CHNFE, TPEVENTO, DHEVENTO' + sLineBreak +
    'from NOTAFISCAL_EVENTO' + sLineBreak +
    'where COD_EMPRESA = :COD_EMPRESA' + sLineBreak +
    AuthorizationMarker + sLineBreak +
    FilterMarker;
  EventosRtcOrderSql = sLineBreak +
    'order by DHEVENTO desc, CHNFE';
  // A opcao acrescenta a existencia da NF-e autorizada da mesma empresa.
  AuthorizedEventsSql =
    'and exists (select 1 from NOTAFISCAL NFA where NFA.CHAVE_NFE = ' +
    'NOTAFISCAL_EVENTO.CHNFE and NFA.COD_EMPRESA = ' +
    'NOTAFISCAL_EVENTO.COD_EMPRESA and NFA.SITUACAO_NFE = :AUTORIZADA)';
  MissingSessionMessage =
    'A sessão da consulta de Eventos RTC não foi informada.';
  MissingOptionMessage =
    'A opção da consulta de Eventos RTC não foi informada.';
  MissingCompanyMessage =
    'O contexto da empresa não foi informado.';

{ TEventosRtcQueryDefinition }

constructor TEventosRtcQueryDefinition.Create(
  AReaderFactory: ISqlDataSetReaderFactory; AOperation: IQueryResultOperations;
  ASession: ISessionContext;
  const AOnlyAuthorizedNFe: TEventosRtcOnlyAuthorizedNFe);
begin
  // A base valida a fabrica e as operacoes e monta colunas e filtros fixos.
  // Somente a pesquisa consulta a sessao e a opcao da tela.
  inherited Create(AReaderFactory, AOperation);

  if ASession = nil then
    raise Exception.Create(MissingSessionMessage);
  if not Assigned(AOnlyAuthorizedNFe) then
    raise Exception.Create(MissingOptionMessage);

  FSession := ASession;
  FOnlyAuthorizedNFe := AOnlyAuthorizedNFe;
end;

procedure TEventosRtcQueryDefinition.Configure();
begin
  FColumnsDef := GridColumns([
    GridColumn('CHNFE', 'Chave da NF-e', 310),
    GridColumn('TPEVENTO', 'Tipo de evento', 120),
    GridColumn('DHEVENTO', 'Data/hora do evento', 160)
  ]);
  // A tela oferece todo o conjunto textual e de data/hora que a pesquisa SQL
  // executa. A definicao apenas declara os campos, sem restringir operadores.
  FFiltersDef := FilterDefinitionOf([
    FilterField('CHNFE', 'Chave da NF-e', fftString,
      FilterDefaultOperators(fftString)),
    FilterField('DHEVENTO', 'Data/hora do evento', fftDateTime,
      FilterDefaultOperators(fftDateTime))
  ], True);
end;

function TEventosRtcQueryDefinition.CreateQueryDefinition(
  const ACriteria: TFilterCriteria): TNextQueryDefinition;
var
  Builder: IParametersBuilder;
  BaseSql: string;
  CompanyCode: Integer;
begin
  // A empresa e a opcao da tela sao lidas a cada pesquisa. A atualizacao do
  // resultado reusa o SQL e os parametros da ultima busca e nao passa por aqui.
  CompanyCode := FSession.EmpresaId;
  if CompanyCode <= 0 then
    raise Exception.Create(MissingCompanyMessage);

  Builder := ParametersBuilder.Create(2);
  Builder.ByName('COD_EMPRESA', CompanyCode);

  if FOnlyAuthorizedNFe() then
  begin
    Builder.ByName('AUTORIZADA', 'Autorizada');
    BaseSql := StringReplace(EventosRtcBaseSql, AuthorizationMarker,
      AuthorizedEventsSql, []);
  end
  else
    BaseSql := StringReplace(EventosRtcBaseSql, AuthorizationMarker, '', []);

  // Os criterios da tela viram condicoes parametrizadas; campo, operador ou
  // quantidade de valores fora do contrato interrompem a montagem.
  Result := TQueryFilterSqlBuilder.Build(BaseSql, FilterMarker, Builder.Build,
    FFiltersDef, ACriteria);
  Result.Sql := Result.Sql + EventosRtcOrderSql;
end;

end.
