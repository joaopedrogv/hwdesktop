unit EventosRtcDefinition;

interface

uses
  NextQueryDefinition, GridColumnDefinition, FilterDefinition, FilterCriterion;

//type
//  TEventosRtcDefinition = class
//  public
//    class function Query(): TNextQueryDefinition;
//    class function Filters(): TFilterDefinition;
//    class function Columns(): TGridColumnDefinitions;
//  end;

// Monta a definicao de leitura de Eventos RTC para a empresa ativa. O SQL,
// o filtro, a ordenacao e as colunas preservam o comportamento existente.
function CreateEventosRtcDefinition(
  ACompanyCode: Integer): TNextQueryDefinition;
function CreateEventosRtcColumns: TGridColumnDefinitions;
function CreateEventosRtcFilters: TFilterDefinition;

implementation

uses
  System.SysUtils, ParameterValueUnit;

const
  EventosRtcSql =
    'select CHNFE, TPEVENTO, DHEVENTO' + sLineBreak +
    'from NOTAFISCAL_EVENTO' + sLineBreak +
    'where COD_EMPRESA = :COD_EMPRESA' + sLineBreak +
    'order by DHEVENTO desc, CHNFE';

function CreateEventosRtcDefinition(
  ACompanyCode: Integer): TNextQueryDefinition;
begin
  if ACompanyCode <= 0 then
    raise Exception.Create('O codigo da empresa deve ser maior que zero.');

  Result.Sql := EventosRtcSql;
  Result.Parameters := ParametersBuilder.Create
    .ByName('COD_EMPRESA', ACompanyCode)
    .Build;
//  Result.Columns := QueryColumns([
//    QueryColumn('CHNFE', 'Chave da NF-e'),
//    QueryColumn('TPEVENTO', 'Tipo de evento'),
//    QueryColumn('DHEVENTO', 'Data/hora do evento')]);
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
  Result := FilterDefinitionOf([
    FilterField('CHNFE', 'Chave da NF-e', fftString, [foEquals]),
    FilterField('DHEVENTO', 'Data/hora do evento', fftDateTime, [foRange])
  ], True);
end;

end.
