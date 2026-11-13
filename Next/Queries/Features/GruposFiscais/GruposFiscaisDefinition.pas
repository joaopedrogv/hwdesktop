unit GruposFiscaisDefinition;

interface

uses
  NextQueryDefinition, GridColumnDefinition, FilterDefinition, FilterCriterion;

// Monta a leitura dos grupos fiscais ativos. O filtro e opcional; sem criterios,
// preserva o SQL, a ordenacao e as colunas definidas aqui.
function CreateGruposFiscaisDefinition(
  const ACriteria: TFilterCriteria): TNextQueryDefinition;

function CreateGruposFiscaisColumns: TGridColumnDefinitions;
function CreateGruposFiscaisFilters: TFilterDefinition;

implementation

uses
  System.SysUtils, ParameterValueUnit, QueryFilterSqlBuilder,
  TipoTributoFiscalEnumUnit, TipoComunsUnit, StatusRegistroEnumUnit;

const
  FilterMarker = '/*FILTROS*/';
  ActiveParameterName = 'ATIVO';

// Gera o case que traduz o codigo do tipo de tributo para o rotulo de dominio.
// Os literais vem apenas do array de exibicao; nenhum valor de usuario entra
// na montagem do SQL.
function TipoTributoDisplaySql: string;
var
  Value: TipoTributoFiscalEnum;
begin
  Result := 'case TIPO_TRIBUTO';
  for Value := Low(TipoTributoFiscalEnum) to High(TipoTributoFiscalEnum) do
    Result := Result + ' when ' + IntToStr(Ord(Value)) + ' then ' +
      QuotedStr(TipoTributoFiscalEnumDisplay[Value]);
  Result := Result + ' end';
end;

// Gera o case do indicador de registro gerido pelo sistema. Valor fora do
// dominio nao recebe rotulo e permanece vazio na grade.
function SistemaDisplaySql: string;
var
  Value: YesNoEnum;
begin
  Result := 'case GERIDO_SISTEMA';
  for Value := Low(YesNoEnum) to High(YesNoEnum) do
    Result := Result + ' when ' + IntToStr(Ord(Value)) + ' then ' +
      QuotedStr(YesNoEnumStr[Value]);
  Result := Result + ' end';
end;

function CreateGruposFiscaisDefinition(
  const ACriteria: TFilterCriteria): TNextQueryDefinition;
var
  Builder: IParametersBuilder;
  BaseSql: string;
begin
  // O catalogo e global: o unico predicado fixo restringe aos registros ativos.
  Builder := ParametersBuilder.Create(1);
  Builder.ByName(ActiveParameterName, Ord(saAtivo));

  BaseSql := 'select ID, DESCRICAO, ' + TipoTributoDisplaySql +
    ' as TIPO_TRIBUTO_DESCRICAO, ' + SistemaDisplaySql +
    ' as GERIDO_SISTEMA_DESCRICAO' + sLineBreak +
    'from GRUPOS_FISCAIS' + sLineBreak +
    'where ATIVO = :' + ActiveParameterName + sLineBreak +
    FilterMarker;

  Result := TQueryFilterSqlBuilder.Build(BaseSql, FilterMarker, Builder.Build,
    CreateGruposFiscaisFilters, ACriteria);
  Result.Sql := Result.Sql + sLineBreak + 'order by SEQID';
end;

function CreateGruposFiscaisColumns: TGridColumnDefinitions;
begin
  Result := GridColumns([
    GridColumn('DESCRICAO', 'Descri'#231#227'o', 300),
    GridColumn('TIPO_TRIBUTO_DESCRICAO', 'Tipo Tributo', 180),
    GridColumn('GERIDO_SISTEMA_DESCRICAO', 'Sistema', 90)
  ]);
end;

function CreateGruposFiscaisFilters: TFilterDefinition;
begin
  // Somente igualdade de descricao: o montador SQL traduz apenas igualdade e
  // faixa, portanto outros operadores seriam oferecidos sem funcionar.
  Result := FilterDefinitionOf([
    FilterField('DESCRICAO', 'Descri'#231#227'o', fftString, [foEquals])
  ], True);
end;

end.
