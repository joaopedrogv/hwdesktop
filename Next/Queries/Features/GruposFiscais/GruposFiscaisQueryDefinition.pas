unit GruposFiscaisQueryDefinition;

interface

uses
  Data.DB, FilterCriterion, NextDatasetDefinition, NextQueryDefinition,
  GridColumnDefinition, FilterDefinition, IDataSetReaderUnit,
  DatasetResultOperations, ColumnLayoutPreferences;

type
  // Identificacao do grupo escolhido na grade, copiada por valor: nenhum objeto precisa ser liberado pela tela ou pelo
  // apresentador.
  TGrupoSelecionado = record
    Id: string;
    Descricao: string;
  end;

  TGruposFiscaisQueryDefinition = class(TNextQueryDefinition, INextDatasetDefinition<TGrupoSelecionado>)
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory; AOperation: IDataSetResultOperations;
      ALayoutPreferences: IColumnLayoutPreferences);
    function TryGetSelected(out ASelected: TGrupoSelecionado): Boolean;
  protected
    function CreateQueryDefinition(const ACriteria: TFilterCriteria): TNextSegmentQueryDefinition; override;
    procedure Configure(); override;
  end;

implementation

uses
  System.SysUtils, QueryResultUnit, ParameterValueUnit, QueryFilterSqlBuilder,
  StatusRegistroEnumUnit, TipoTributoFiscalEnumUnit, TipoComunsUnit,
  EntityMetadataUnit, GrupoFiscalMetadataUnit;

const
  LayoutDatasetId = 'grupos.fiscais';
  FilterMarker = '/*FILTROS*/';
  ActiveParameterName = 'ATIVO';

// Os literais vem apenas do array de exibicao; nenhum valor de usuario entra na montagem do SQL.
function TipoTributoDisplaySql: string;
var
  Value: TipoTributoFiscalEnum;
begin
  Result := 'case TIPO_TRIBUTO';
  for Value := Low(TipoTributoFiscalEnum) to High(TipoTributoFiscalEnum) do
    Result := Result + ' when ' + IntToStr(Ord(Value)) + ' then ' + QuotedStr(TipoTributoFiscalEnumDisplay[Value]);
  Result := Result + ' end';
end;

// Valor fora do dominio nao recebe rotulo e permanece vazio na grade.
function SistemaDisplaySql: string;
var
  Value: YesNoEnum;
begin
  Result := 'case GERIDO_SISTEMA';
  for Value := Low(YesNoEnum) to High(YesNoEnum) do
    Result := Result + ' when ' + IntToStr(Ord(Value)) + ' then ' + QuotedStr(YesNoEnumStr[Value]);
  Result := Result + ' end';
end;

constructor TGruposFiscaisQueryDefinition.Create(
  AReaderFactory: ISqlDataSetReaderFactory; AOperation: IDataSetResultOperations;
  ALayoutPreferences: IColumnLayoutPreferences);
begin
  inherited Create(AReaderFactory, AOperation, ALayoutPreferences);
end;

procedure TGruposFiscaisQueryDefinition.Configure();
var
  Metadata: EntityMetadata;
begin
  FDatasetId := LayoutDatasetId;
  // Os rotulos da grade e do filtro vem do metadata do grupo fiscal, o mesmo usado pelo validador na nomeacao dos
  // campos.
  Metadata := TGrupoFiscalMetadata.GetMetadata();

  FColumnsDef := GridColumns([
    GridColumn('DESCRICAO', Metadata.GetDisplayAttribute('Descricao'), 300),
    GridColumn('TIPO_TRIBUTO_DESCRICAO', Metadata.GetDisplayAttribute('TipoTributo'), 180),
    GridColumn('GERIDO_SISTEMA_DESCRICAO', 'Sistema', 90)
  ]);
  // Somente igualdade de descricao: o montador SQL traduz apenas igualdade e faixa, portanto outros operadores seriam
  // oferecidos sem funcionar.
  FFiltersDef := FilterDefinitionOf([
    FilterField('DESCRICAO', Metadata.GetDisplayAttribute('Descricao'), fftString, [foEquals])
  ], True);
end;

function TGruposFiscaisQueryDefinition.CreateQueryDefinition(const ACriteria: TFilterCriteria): TNextSegmentQueryDefinition;
var
  Builder: IParametersBuilder;
  BaseSql: string;
begin
  // O catalogo e global: o unico predicado fixo restringe aos registros ativos.
  Builder := ParametersBuilder.Create(1);
  Builder.ByName(ActiveParameterName, Ord(saAtivo));

  BaseSql := 'select ID, DESCRICAO, ' + TipoTributoDisplaySql +
    ' as TIPO_TRIBUTO_DESCRICAO, ' + SistemaDisplaySql + ' as GERIDO_SISTEMA_DESCRICAO' + sLineBreak +
    'from GRUPOS_FISCAIS' + sLineBreak + 'where ATIVO = :' + ActiveParameterName + sLineBreak + FilterMarker;

  Result := TQueryFilterSqlBuilder.Build(BaseSql, FilterMarker, Builder.Build, FFiltersDef, ACriteria);
  Result.Sql := Result.Sql + sLineBreak + 'order by SEQID';
end;

function TGruposFiscaisQueryDefinition.TryGetSelected(out ASelected: TGrupoSelecionado): Boolean;
var
  DataSet: TDataSet;
  Consulta: QueryResult;
begin
  ASelected := Default(TGrupoSelecionado);
  Result := False;

  DataSet := GetDataSet;
  if (DataSet = nil) or (not DataSet.Active) or DataSet.IsEmpty then
    Exit;

  // A grade fornece o dataset: o wrapper apenas le a linha corrente e nao participa da posse. O Id e a PK da tabela, e
  // vazio ainda e valor valido.
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
