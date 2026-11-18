unit OperacoesFiscaisIbsCbsQueryDefinition;

interface

uses
  IDataSetReaderUnit, QueryResultOperations, FilterCriterion, NextQueryDefinition,
  QueryColumnDefinition, ColumnLayoutPreferences;

type
  // Opcao da tela consultada a cada pesquisa: a marcacao do checkbox pertence a view e pode mudar enquanto a janela
  // permanece aberta.
  TLixeiraSearch = function: Boolean of object;

  // Identificacao da operacao escolhida na grade, com as descricoes ja apresentadas; o record e copiado por valor e
  // nenhum objeto precisa ser liberado.
  TOperacaoFiscalSelecionada = record
    Id: string;
    OperacaoInternaDescricao: string;
    GrupoFiscalDescricao: string;
    RegraFiscalDescricao: string;
  end;

  // Definicao de leitura das Operacoes Fiscais IBS/CBS. A tabela nao possui empresa: o unico predicado fixo e o estado
  // do registro, informado pela tela em cada pesquisa.
  TOperacoesFiscaisIbsCbsQueryDefinition = class(TNextQueryDefinitionBase,
    INextQueryDefinition<TOperacaoFiscalSelecionada>)
  private
    FLixeiraSearch: TLixeiraSearch;
    function BuildColumns: TQueryColumnDefinitions;
  protected
    procedure Configure(); override;
    function CreateQueryDefinition(const ACriteria: TFilterCriteria): TNextQueryDefinition; override;
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory; AOperation: IQueryResultOperations;
      ALayoutPreferences: IColumnLayoutPreferences; const ALixeiraSearch: TLixeiraSearch);
    function TryGetSelected(out ASelected: TOperacaoFiscalSelecionada): Boolean;
  end;

implementation

uses
  System.SysUtils, Data.DB, QueryResultUnit, ParameterValueUnit,
  QueryFilterSqlBuilder, GridColumnDefinition, FilterDefinition,
  StatusRegistroEnumUnit, TipoTributoFiscalEnumUnit;

const
  LayoutQueryId = 'operacoes.fiscais.ibscbs';
  FilterMarker = '/*FILTROS*/';
  ActiveParameterName = 'ATIVO';
  // Percentuais do diferimento com quatro casas, como no cadastro Modern. Sem a formatacao o proprio campo decidiria as
  // casas apresentadas na grade.
  PercentDisplayFormat = '#,###,##0.0000';
  OrderSql = sLineBreak + 'order by OP_DESCRICAO, R_DESCRICAO, G_DESCRICAO';

// O valor indefinido e os registros sem grupo fiscal permanecem nulos: a coluna vem do left join e a grade apresenta
// ambos vazios. Os literais vem apenas do array de exibicao; nenhum valor de usuario entra na montagem do SQL.
function TipoTributoDisplaySql: string;
var
  Value: TipoTributoFiscalEnum;
begin
  Result := 'case g.tipo_tributo';
  for Value := Low(TipoTributoFiscalEnum) to High(TipoTributoFiscalEnum) do
    if Trim(TipoTributoFiscalEnumDisplay[Value]) = '' then
      Result := Result + ' when ' + IntToStr(Ord(Value)) + ' then null'
    else
      Result := Result + ' when ' + IntToStr(Ord(Value)) + ' then ' + QuotedStr(TipoTributoFiscalEnumDisplay[Value]);
  Result := Result + ' end';
end;

// Os aliases externos deixam os filtros sem ambiguidade, porque as tres tabelas de origem possuem coluna de descricao
// propria. Os campos internos alimentam a linha corrente da grade e nao aparecem como coluna.
function OperacoesFiscaisSql: string;
begin
  Result := 'select ID, ATIVO, O_OP_INTERNA_ID, O_REGRA_FISCAL_ID, O_GRUPO_FISCAL_ID,' + sLineBreak +
    '       O_DATA_INI_VIGENCIA, O_DATA_FIM_VIGENCIA, OP_SEQID, OP_DESCRICAO,' + sLineBreak +
    '       G_SEQID, G_DESCRICAO, G_TIPO_TRIBUTO, R_DESCRICAO, R_CCLASSTRIB,' + sLineBreak +
    '       R_PDIFCBS, R_PDIFIBSUF, R_PDIFIBSMUN,' + sLineBreak +
    '       R_DATA_INI_VIGENCIA, R_DATA_FIM_VIGENCIA' + sLineBreak +
    'from (' + sLineBreak +
    '  select o.id ID, o.ativo ATIVO, o.op_interna_id O_OP_INTERNA_ID,' + sLineBreak +
    '         o.regra_fiscal_id O_REGRA_FISCAL_ID,' + sLineBreak +
    '         o.grupo_fiscal_id O_GRUPO_FISCAL_ID,' + sLineBreak +
    '         o.data_ini_vigencia O_DATA_INI_VIGENCIA,' + sLineBreak +
    '         o.data_fim_vigencia O_DATA_FIM_VIGENCIA,' + sLineBreak +
    '         op.seqid OP_SEQID, op.descricao OP_DESCRICAO,' + sLineBreak +
    '         g.seqid G_SEQID, g.descricao G_DESCRICAO,' + sLineBreak +
    '         ' + TipoTributoDisplaySql + ' G_TIPO_TRIBUTO,' + sLineBreak +
    '         r.descricao R_DESCRICAO, r.cclasstrib R_CCLASSTRIB,' + sLineBreak +
    '         r.pdifcbs R_PDIFCBS, r.pdifibsuf R_PDIFIBSUF,' + sLineBreak +
    '         r.pdifibsmun R_PDIFIBSMUN,' + sLineBreak +
    '         r.data_ini_vigencia R_DATA_INI_VIGENCIA,' + sLineBreak +
    '         r.data_fim_vigencia R_DATA_FIM_VIGENCIA' + sLineBreak +
    '  from op_fiscais_ibscbs o' + sLineBreak +
    '  inner join op_internas op on op.id = o.op_interna_id' + sLineBreak +
    '  inner join regras_fiscais_ibscbs r on r.id = o.regra_fiscal_id' + sLineBreak +
    '  left join grupos_fiscais g on g.id = o.grupo_fiscal_id' + sLineBreak +
    ') q' + sLineBreak +
    'where ATIVO = :' + ActiveParameterName + sLineBreak +
    FilterMarker;
end;

constructor TOperacoesFiscaisIbsCbsQueryDefinition.Create(
  AReaderFactory: ISqlDataSetReaderFactory; AOperation: IQueryResultOperations;
  ALayoutPreferences: IColumnLayoutPreferences;
  const ALixeiraSearch: TLixeiraSearch);
begin
  inherited Create(AReaderFactory, AOperation, ALayoutPreferences);

  if not Assigned(ALixeiraSearch) then
    raise Exception.Create('A opção da consulta de Operações Fiscais IBS/CBS não foi informada.');

  FLixeiraSearch := ALixeiraSearch;
end;

function TOperacoesFiscaisIbsCbsQueryDefinition.BuildColumns:
  TQueryColumnDefinitions;
begin
  // Cada coluna e declarada uma vez, com o tipo do filtro e o comportamento da grade. As colunas sempre visiveis
  // continuam filtraveis.
  Result := QueryColumns([
    QueryColumn('O_DATA_INI_VIGENCIA', 'Inicio Vigencia', fftDateTime, 110),
    QueryColumn('O_DATA_FIM_VIGENCIA', 'Fim Vigencia', fftDateTime, 110),
    QueryColumn('OP_SEQID', 'Cod. Op Interna', fftInteger, 90),
    QueryColumn('OP_DESCRICAO', 'Operação Interna', fftString, 200, qcaDefault, gcbAlwaysVisible),
    QueryColumn('G_SEQID', 'Cod. Grupo Fiscal', fftInteger, 90),
    QueryColumn('G_DESCRICAO', 'Grupo Fiscal', fftString, 180, qcaDefault, gcbAlwaysVisible),
    QueryColumn('G_TIPO_TRIBUTO', 'Tipo Tributo', fftString, 110),
    QueryColumn('R_DESCRICAO', 'Regra Fiscal', fftString, 180, qcaDefault, gcbAlwaysVisible),
    QueryColumn('R_CCLASSTRIB', 'CClass Trib', fftString, 90, qcaDefault, gcbAlwaysVisible),
    QueryColumn('R_PDIFCBS', 'Perc Diferimento CBS', fftCurrency, 130,
      qcaDefault, gcbConfigurableVisible, PercentDisplayFormat),
    QueryColumn('R_PDIFIBSUF', 'Perc Diferimento IBS UF', fftCurrency, 140,
      qcaDefault, gcbConfigurableVisible, PercentDisplayFormat),
    QueryColumn('R_PDIFIBSMUN', 'Perc Diferimento IBS Municipio', fftCurrency,
      150, qcaDefault, gcbConfigurableVisible, PercentDisplayFormat),
    QueryColumn('R_DATA_INI_VIGENCIA', 'Inicio Vigencia Regra Fiscal', fftDateTime, 140),
    QueryColumn('R_DATA_FIM_VIGENCIA', 'Fim Vigencia Regra Fiscal', fftDateTime, 140)
  ]);
end;

procedure TOperacoesFiscaisIbsCbsQueryDefinition.Configure();
var
  Columns: TQueryColumnDefinitions;
begin
  FQueryId := LayoutQueryId;

  Columns := BuildColumns;
  FColumnsDef := BuildGridColumns(Columns);
  // Os filtros usam os aliases externos da mesma declaracao, na ordem das colunas. O estado do registro nao esta aqui:
  // o checkbox da tela escolhe entre ativos e lixeira em cada pesquisa.
  FFiltersDef := BuildFilterDefinition(Columns, True);
end;

function TOperacoesFiscaisIbsCbsQueryDefinition.CreateQueryDefinition(
  const ACriteria: TFilterCriteria): TNextQueryDefinition;
var
  Builder: IParametersBuilder;
  StatusPesquisa: StatusRegistroEnum;
begin
  // A opcao da tela e lida a cada pesquisa: desmarcada consulta os ativos e marcada consulta a lixeira. A atualizacao
  // do resultado reusa o SQL e os parametros desta busca e nao passa por aqui.
  if FLixeiraSearch() then
    StatusPesquisa := saLixeira
  else
    StatusPesquisa := saAtivo;

  Builder := ParametersBuilder.Create(1);
  Builder.ByName(ActiveParameterName, Ord(StatusPesquisa));

  // Os criterios da tela viram condicoes parametrizadas; campo, operador ou quantidade de valores fora do contrato
  // interrompem a montagem.
  Result := TQueryFilterSqlBuilder.Build(OperacoesFiscaisSql, FilterMarker, Builder.Build, FFiltersDef, ACriteria);
  Result.Sql := Result.Sql + OrderSql;
end;

function TOperacoesFiscaisIbsCbsQueryDefinition.TryGetSelected(out ASelected: TOperacaoFiscalSelecionada): Boolean;
var
  DataSet: TDataSet;
  Consulta: QueryResult;
begin
  ASelected := Default(TOperacaoFiscalSelecionada);
  Result := False;

  DataSet := GetDataSet;
  if (DataSet = nil) or (not DataSet.Active) or DataSet.IsEmpty then
    Exit;

  // A grade fornece o dataset: o wrapper apenas le a linha corrente e nao participa da posse. O grupo fiscal vem do
  // left join e o nulo aparece como texto vazio; o Id e a PK da tabela, e vazio ainda e valor valido.
  Consulta := QueryResult.Create(DataSet, '', False);
  try
    ASelected.Id := Consulta.FieldAsString('ID');
    ASelected.OperacaoInternaDescricao := Consulta.FieldAsString('OP_DESCRICAO');
    ASelected.GrupoFiscalDescricao := Consulta.FieldAsStringNullable('G_DESCRICAO').ToText('');
    ASelected.RegraFiscalDescricao := Consulta.FieldAsString('R_DESCRICAO');
    Result := True;
  finally
    Consulta.Free;
  end;
end;

end.
