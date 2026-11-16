unit OperacoesFiscaisIbsCbsQueryDefinition;

interface

uses
  IDataSetReaderUnit, QueryResultOperations, FilterCriterion, NextQueryDefinition;

type
  // Opcao da tela consultada a cada pesquisa: a marcacao do checkbox pertence a
  // view e pode mudar enquanto a janela permanece aberta.
  TLixeiraSearch = function: Boolean of object;

  // Definicao de leitura das Operacoes Fiscais IBS/CBS. A tabela nao possui
  // empresa: o unico predicado fixo e o estado do registro, informado pela tela
  // em cada pesquisa.
  TOperacoesFiscaisIbsCbsQueryDefinition = class(TNextQueryDefinitionBase)
  private
    FLixeiraSearch: TLixeiraSearch;
  protected
    // Colunas e filtros fixos da tela; nao le a opcao do checkbox.
    procedure Configure(); override;
    function CreateQueryDefinition(
      const ACriteria: TFilterCriteria): TNextQueryDefinition; override;
  public
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory;
      AOperation: IQueryResultOperations;
      const ALixeiraSearch: TLixeiraSearch);
  end;

implementation

uses
  System.SysUtils, ParameterValueUnit, QueryFilterSqlBuilder,
  GridColumnDefinition, FilterDefinition, StatusRegistroEnumUnit,
  TipoTributoFiscalEnumUnit;

const
  FilterMarker = '/*FILTROS*/';
  ActiveParameterName = 'ATIVO';
  // Percentuais do diferimento com quatro casas, como no cadastro Modern. Sem a
  // formatacao o proprio campo decidiria as casas apresentadas na grade.
  PercentDisplayFormat = '#,###,##0.0000';
  OrderSql = sLineBreak +
    'order by OP_DESCRICAO, R_DESCRICAO, G_DESCRICAO';
  MissingOptionMessage =
    'A opção da consulta de Operações Fiscais IBS/CBS não foi informada.';

// Gera o case que traduz o codigo do tipo de tributo para o rotulo de dominio.
// O valor indefinido e os registros sem grupo fiscal permanecem nulos: a coluna
// vem do left join e a grade apresenta ambos vazios. Os literais vem apenas do
// array de exibicao; nenhum valor de usuario entra na montagem do SQL.
function TipoTributoDisplaySql: string;
var
  Value: TipoTributoFiscalEnum;
begin
  Result := 'case g.tipo_tributo';
  for Value := Low(TipoTributoFiscalEnum) to High(TipoTributoFiscalEnum) do
    if Trim(TipoTributoFiscalEnumDisplay[Value]) = '' then
      Result := Result + ' when ' + IntToStr(Ord(Value)) + ' then null'
    else
      Result := Result + ' when ' + IntToStr(Ord(Value)) + ' then ' +
        QuotedStr(TipoTributoFiscalEnumDisplay[Value]);
  Result := Result + ' end';
end;

// Os aliases externos deixam os filtros da tela sem ambiguidade: as tres tabelas
// de origem possuem coluna de descricao propria. Os campos internos alimentam a
// linha corrente da grade e nao aparecem como coluna.
function OperacoesFiscaisSql: string;
begin
  Result :=
    'select ID, ATIVO, O_OP_INTERNA_ID, O_REGRA_FISCAL_ID, O_GRUPO_FISCAL_ID,' +
      sLineBreak +
    '       O_DATA_INI_VIGENCIA, O_DATA_FIM_VIGENCIA, OP_SEQID, OP_DESCRICAO,' +
      sLineBreak +
    '       G_SEQID, G_DESCRICAO, G_TIPO_TRIBUTO, R_DESCRICAO, R_CCLASSTRIB,' +
      sLineBreak +
    '       R_PDIFCBS, R_PDIFIBSUF, R_PDIFIBSMUN,' + sLineBreak +
    '       R_DATA_INI_VIGENCIA, R_DATA_FIM_VIGENCIA' + sLineBreak +
    'from (' + sLineBreak +
    '  select o.id ID, o.ativo ATIVO, o.op_interna_id O_OP_INTERNA_ID,' +
      sLineBreak +
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

{ TOperacoesFiscaisIbsCbsQueryDefinition }

constructor TOperacoesFiscaisIbsCbsQueryDefinition.Create(
  AReaderFactory: ISqlDataSetReaderFactory; AOperation: IQueryResultOperations;
  const ALixeiraSearch: TLixeiraSearch);
begin
  // A base valida a fabrica e as operacoes e monta colunas e filtros fixos.
  // Somente a pesquisa consulta a opcao do checkbox.
  inherited Create(AReaderFactory, AOperation);

  if not Assigned(ALixeiraSearch) then
    raise Exception.Create(MissingOptionMessage);

  FLixeiraSearch := ALixeiraSearch;
end;

procedure TOperacoesFiscaisIbsCbsQueryDefinition.Configure();
begin
  FColumnsDef := GridColumns([
    GridColumn('O_DATA_INI_VIGENCIA', 'Inicio Vigencia', 110),
    GridColumn('O_DATA_FIM_VIGENCIA', 'Fim Vigencia', 110),
    GridColumn('OP_SEQID', 'Cod. Op Interna', 90),
    GridColumn('OP_DESCRICAO', 'Operação Interna', 200, qcaDefault,
      gcbAlwaysVisible),
    GridColumn('G_SEQID', 'Cod. Grupo Fiscal', 90),
    GridColumn('G_DESCRICAO', 'Grupo Fiscal', 180, qcaDefault, gcbAlwaysVisible),
    GridColumn('G_TIPO_TRIBUTO', 'Tipo Tributo', 110),
    GridColumn('R_DESCRICAO', 'Regra Fiscal', 180, qcaDefault, gcbAlwaysVisible),
    GridColumn('R_CCLASSTRIB', 'CClass Trib', 90, qcaDefault, gcbAlwaysVisible),
    GridColumn('R_PDIFCBS', 'Perc Diferimento CBS', 130, qcaDefault,
      gcbConfigurableVisible, PercentDisplayFormat),
    GridColumn('R_PDIFIBSUF', 'Perc Diferimento IBS UF', 140, qcaDefault,
      gcbConfigurableVisible, PercentDisplayFormat),
    GridColumn('R_PDIFIBSMUN', 'Perc Diferimento IBS Municipio', 150, qcaDefault,
      gcbConfigurableVisible, PercentDisplayFormat),
    GridColumn('R_DATA_INI_VIGENCIA', 'Inicio Vigencia Regra Fiscal', 140),
    GridColumn('R_DATA_FIM_VIGENCIA', 'Fim Vigencia Regra Fiscal', 140)
  ]);
  // Os filtros usam os aliases externos. O estado do registro nao esta aqui: o
  // checkbox da tela escolhe entre ativos e lixeira em cada pesquisa.
  FFiltersDef := FilterDefinitionOf([
    FilterField('OP_DESCRICAO', 'Operação Interna', fftString,
      FilterDefaultOperators(fftString)),
    FilterField('G_DESCRICAO', 'Grupo Fiscal', fftString,
      FilterDefaultOperators(fftString)),
    FilterField('R_DESCRICAO', 'Regra Fiscal', fftString,
      FilterDefaultOperators(fftString)),
    FilterField('R_CCLASSTRIB', 'CClass Trib', fftString,
      FilterDefaultOperators(fftString)),
    FilterField('G_TIPO_TRIBUTO', 'Tipo Tributo', fftString,
      FilterDefaultOperators(fftString)),
    FilterField('OP_SEQID', 'Cod. Op Interna', fftInteger,
      FilterDefaultOperators(fftInteger)),
    FilterField('G_SEQID', 'Cod. Grupo Fiscal', fftInteger,
      FilterDefaultOperators(fftInteger)),
    FilterField('O_DATA_INI_VIGENCIA', 'Inicio Vigencia', fftDateTime,
      FilterDefaultOperators(fftDateTime)),
    FilterField('O_DATA_FIM_VIGENCIA', 'Fim Vigencia', fftDateTime,
      FilterDefaultOperators(fftDateTime)),
    FilterField('R_DATA_INI_VIGENCIA', 'Inicio Vigencia Regra Fiscal',
      fftDateTime, FilterDefaultOperators(fftDateTime)),
    FilterField('R_DATA_FIM_VIGENCIA', 'Fim Vigencia Regra Fiscal',
      fftDateTime, FilterDefaultOperators(fftDateTime)),
    FilterField('R_PDIFCBS', 'Perc Diferimento CBS', fftCurrency,
      FilterDefaultOperators(fftCurrency)),
    FilterField('R_PDIFIBSUF', 'Perc Diferimento IBS UF', fftCurrency,
      FilterDefaultOperators(fftCurrency)),
    FilterField('R_PDIFIBSMUN', 'Perc Diferimento IBS Municipio', fftCurrency,
      FilterDefaultOperators(fftCurrency))
  ], True);
end;

function TOperacoesFiscaisIbsCbsQueryDefinition.CreateQueryDefinition(
  const ACriteria: TFilterCriteria): TNextQueryDefinition;
var
  Builder: IParametersBuilder;
  StatusPesquisa: StatusRegistroEnum;
begin
  // A opcao da tela e lida a cada pesquisa: desmarcada consulta os ativos e
  // marcada consulta a lixeira. A atualizacao do resultado reusa o SQL e os
  // parametros desta busca e nao passa por aqui.
  if FLixeiraSearch() then
    StatusPesquisa := saLixeira
  else
    StatusPesquisa := saAtivo;

  Builder := ParametersBuilder.Create(1);
  Builder.ByName(ActiveParameterName, Ord(StatusPesquisa));

  // Os criterios da tela viram condicoes parametrizadas; campo, operador ou
  // quantidade de valores fora do contrato interrompem a montagem.
  Result := TQueryFilterSqlBuilder.Build(OperacoesFiscaisSql, FilterMarker,
    Builder.Build, FFiltersDef, ACriteria);
  Result.Sql := Result.Sql + OrderSql;
end;

end.
