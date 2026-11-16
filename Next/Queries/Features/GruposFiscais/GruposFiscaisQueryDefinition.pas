unit GruposFiscaisQueryDefinition;

interface

uses
  Data.DB, FilterCriterion, NextQueryDefinition, GridColumnDefinition,
  FilterDefinition;

type
  // Identificacao do grupo fiscal escolhido na grade. O record e copiado por
  // valor; nenhum objeto precisa ser liberado pela tela ou pelo apresentador.
  TGrupoSelecionado = record
    Id: string;
    Descricao: string;
  end;

  TGruposFiscaisQueryDefinition = class(TNextQueryDefinitionBase,
    INextQueryDefinition<TGrupoSelecionado>)
  protected
    function CreateQueryDefinition(
      const ACriteria: TFilterCriteria): TNextQueryDefinition; override;
    procedure Configure(); override;
  public
    function TryGetSelected(out ASelected: TGrupoSelecionado): Boolean;
  end;

implementation

uses
  System.SysUtils, QueryResultUnit, ParameterValueUnit, QueryFilterSqlBuilder,
  StatusRegistroEnumUnit, TipoTributoFiscalEnumUnit, TipoComunsUnit,
  EntityMetadataUnit, GrupoFiscalMetadataUnit;

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

{ TGruposFiscaisQueryDefinition }

procedure TGruposFiscaisQueryDefinition.Configure();
var
  Metadata: EntityMetadata;
begin
  // Os rotulos da grade e do filtro vem do metadata do grupo fiscal, o mesmo
  // usado pelo validador na nomeacao dos campos.
  Metadata := TGrupoFiscalMetadata.GetMetadata();

  FColumnsDef := GridColumns([
    GridColumn('DESCRICAO', Metadata.GetDisplayAttribute('Descricao'), 300),
    GridColumn('TIPO_TRIBUTO_DESCRICAO', Metadata.GetDisplayAttribute('TipoTributo'), 180),
    GridColumn('GERIDO_SISTEMA_DESCRICAO', 'Sistema', 90)
  ]);
  // Somente igualdade de descricao: o montador SQL traduz apenas igualdade e
  // faixa, portanto outros operadores seriam oferecidos sem funcionar.
  FFiltersDef := FilterDefinitionOf([
    FilterField('DESCRICAO', Metadata.GetDisplayAttribute('Descricao'), fftString, [foEquals])
  ], True);
end;

function TGruposFiscaisQueryDefinition.CreateQueryDefinition(
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
    FFiltersDef, ACriteria);
  Result.Sql := Result.Sql + sLineBreak + 'order by SEQID';
end;

function TGruposFiscaisQueryDefinition.TryGetSelected(
  out ASelected: TGrupoSelecionado): Boolean;
var
  DataSet: TDataSet;
  Consulta: QueryResult;
begin
  ASelected := Default(TGrupoSelecionado);
  Result := False;

  // Sem pesquisa concluida, sem resultado ou com a linha corrente invalida nao
  // existe grupo a enviar para a lixeira.
  DataSet := GetDataSet;
  if (DataSet = nil) or (not DataSet.Active) or DataSet.IsEmpty then
    Exit;

  // A grade fornece o dataset: o wrapper apenas le a linha corrente e nao
  // participa da posse do dataset.
  // O campo Id é a PK da tabela consultada, se vazio ainda e um valor valido.
  Consulta := QueryResult.Create(DataSet, '', False);
  try
    ASelected.Id := Consulta.FieldAsString('ID');
    ASelected.Descricao := Consulta.FieldAsString('DESCRICAO');
    Result := True;
  finally
    Consulta.Free;
  end;
end;

end.
