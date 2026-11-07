unit EventosRtcDefinition;

interface

uses
  NextQueryDefinition;

// Monta a definicao de leitura de Eventos RTC para a empresa ativa. O SQL,
// o filtro, a ordenacao e as colunas preservam o comportamento existente.
function CreateEventosRtcDefinition(
  ACompanyCode: Integer): TNextQueryDefinition;

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
  Result.Columns := QueryColumns([
    QueryColumn('CHNFE', 'Chave da NF-e'),
    QueryColumn('TPEVENTO', 'Tipo de evento'),
    QueryColumn('DHEVENTO', 'Data/hora do evento')]);
end;

end.
