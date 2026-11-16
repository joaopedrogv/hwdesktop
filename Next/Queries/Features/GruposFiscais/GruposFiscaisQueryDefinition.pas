unit GruposFiscaisQueryDefinition;

interface

uses
  IDataSetReaderUnit, FilterCriterion, NextQueryDefinition, GridColumnDefinition, FilterDefinition, QueryResultOperations;

type
  TGrupoSelecionado = class
  private
    FId: string;
    FDescricao: string;
  public
    property Id: string read FId;
    property Descricao: string read FDescricao;
  end;

  TGruposFiscaisQueryDefinition = class(TNextQueryDefinitionBase, INextQueryDefinition<TGrupoSelecionado>)
  private
    function CreateGruposFiscaisDefinition(const ACriteria: TFilterCriteria): TNextQueryDefinition;
    procedure Configure(); override;
  public
    function CreateReader(const ACriteria: TFilterCriteria): IDataSetReader;
    function GetSelected(): TGrupoSelecionado;
  end;

implementation

uses
  System.SysUtils, ParameterValueUnit, QueryFilterSqlBuilder, StatusRegistroEnumUnit,
  TipoTributoFiscalEnumUnit, TipoComunsUnit, QueryResultUnit;

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
begin
  FColumnsDef := GridColumns([
    GridColumn('DESCRICAO', 'Descri'#231#227'o', 300),
    GridColumn('TIPO_TRIBUTO_DESCRICAO', 'Tipo Tributo', 180),
    GridColumn('GERIDO_SISTEMA_DESCRICAO', 'Sistema', 90)
  ]);
  // Somente igualdade de descricao: o montador SQL traduz apenas igualdade e
  // faixa, portanto outros operadores seriam oferecidos sem funcionar.
  FFiltersDef := FilterDefinitionOf([
    FilterField('DESCRICAO', 'Descri'#231#227'o', fftString, [foEquals])
  ], True);
end;

function TGruposFiscaisQueryDefinition.CreateGruposFiscaisDefinition(
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

  Result := TQueryFilterSqlBuilder.Build(BaseSql, FilterMarker, Builder.Build, FFiltersDef, ACriteria);
  Result.Sql := Result.Sql + sLineBreak + 'order by SEQID';
end;

function TGruposFiscaisQueryDefinition.CreateReader(const ACriteria: TFilterCriteria): IDataSetReader;
var
  Definition: TNextQueryDefinition;
begin
  // A definicao monta SQL e parametros; a fabrica apenas cria o leitor.
  Definition := CreateGruposFiscaisDefinition(ACriteria);
  FReader := FReaderFactory.CreateReader(Definition.Sql, Definition.Parameters);

  Result := FReader;
end;

function TGruposFiscaisQueryDefinition.GetSelected: TGrupoSelecionado;
begin
  with QueryResult.Create(FReader.DataSet, '', False) do
  try
    if IsEmpty then
    begin
      Result := nil;
      exit;
    end;

    Result := TGrupoSelecionado.Create();
    try
      Result.FId := FieldAsString('ID');
      Result.FDescricao := FieldAsString('DESCRICAO');
    except
      Result.Free();
      raise;
    end;
  finally
    FreeQueryResult();
  end;
end;

end.
