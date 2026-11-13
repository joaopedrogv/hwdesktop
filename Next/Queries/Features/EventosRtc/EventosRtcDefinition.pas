unit EventosRtcDefinition;

interface

uses
  NextQueryDefinition, GridColumnDefinition, FilterDefinition, FilterCriterion;

// Monta a definicao de leitura de Eventos RTC para a empresa ativa, sempre
// restrita pela empresa. Sem criterios, preserva o SQL, a ordenacao e as colunas
// existentes.
function CreateEventosRtcDefinition(
  ACompanyCode: Integer): TNextQueryDefinition; overload;

// Monta a leitura com os criterios acumulados pela tela. Cada criterio vira uma
// condicao parametrizada com nome unico; campo, operador ou quantidade de valores
// fora do contrato interrompem a montagem em vez de serem ignorados.
function CreateEventosRtcDefinition(ACompanyCode: Integer;
  const ACriteria: TFilterCriteria): TNextQueryDefinition; overload;

// Monta a leitura com a opcao de autorizacao da tela. Quando verdadeira, a
// opcao acrescenta a existencia da NF-e autorizada e o parametro correspondente;
// os criterios continuam sendo traduzidos pelo montador compartilhado de filtros.
function CreateEventosRtcDefinition(ACompanyCode: Integer;
  const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): TNextQueryDefinition; overload;

function CreateEventosRtcColumns: TGridColumnDefinitions;
function CreateEventosRtcFilters: TFilterDefinition;

implementation

uses
  System.SysUtils, ParameterValueUnit, QueryFilterSqlBuilder;

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
  AuthorizedEventsSql =
    'and exists (select 1 from NOTAFISCAL NFA where NFA.CHAVE_NFE = ' +
    'NOTAFISCAL_EVENTO.CHNFE and NFA.COD_EMPRESA = ' +
    'NOTAFISCAL_EVENTO.COD_EMPRESA and NFA.SITUACAO_NFE = :AUTORIZADA)';
  InvalidCompanyCodeMessage =
    'O codigo da empresa deve ser maior que zero.';

function CreateEventosRtcDefinition(
  ACompanyCode: Integer): TNextQueryDefinition;
begin
  Result := CreateEventosRtcDefinition(ACompanyCode, nil, False);
end;

function CreateEventosRtcDefinition(ACompanyCode: Integer;
  const ACriteria: TFilterCriteria): TNextQueryDefinition;
begin
  Result := CreateEventosRtcDefinition(ACompanyCode, ACriteria, False);
end;

function CreateEventosRtcDefinition(ACompanyCode: Integer;
  const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): TNextQueryDefinition;
var
  Builder: IParametersBuilder;
  Parameters: ParametersValues;
  BaseSql: string;
  Query: TNextQueryDefinition;
begin
  if ACompanyCode <= 0 then
    raise Exception.Create(InvalidCompanyCodeMessage);

  Builder := ParametersBuilder.Create(2);
  Builder.ByName('COD_EMPRESA', ACompanyCode);

  if ASomenteNFeAutorizada then
  begin
    Builder.ByName('AUTORIZADA', 'Autorizada');
    BaseSql := StringReplace(EventosRtcBaseSql, AuthorizationMarker,
      AuthorizedEventsSql, []);
  end
  else
    BaseSql := StringReplace(EventosRtcBaseSql, AuthorizationMarker, '', []);

  Parameters := Builder.Build;
  Query := TQueryFilterSqlBuilder.Build(BaseSql, FilterMarker, Parameters,
    CreateEventosRtcFilters(), ACriteria);
  Query.Sql := Query.Sql + EventosRtcOrderSql;
  Result := Query;
end;

function CreateEventosRtcColumns: TGridColumnDefinitions;
begin
  Result := GridColumns([
    GridColumn('CHNFE', 'Chave da NF-e', 310),
    GridColumn('TPEVENTO', 'Tipo de evento', 120),
    GridColumn('DHEVENTO', 'Data/hora do evento', 160)
  ]);
end;

function CreateEventosRtcFilters: TFilterDefinition;
begin
  // A tela oferece todo o conjunto textual e de data/hora que a pesquisa SQL
  // executa. A definicao apenas declara os campos, sem restringir operadores.
  Result := FilterDefinitionOf([
    FilterField('CHNFE', 'Chave da NF-e', fftString,
      FilterDefaultOperators(fftString)),
    FilterField('DHEVENTO', 'Data/hora do evento', fftDateTime,
      FilterDefaultOperators(fftDateTime))
  ], True);
end;

end.
