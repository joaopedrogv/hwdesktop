unit OperacoesFiscaisIbsCbsDataSet;

interface

uses
  DataSetGrid, DB, uDataSet_OOP, FieldsConfigUnit, hw_audit_utils;

type
  TOperacoesFiscaisIbsCbsDataSet = class(TDataSetGrid)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder);
    function GetAuditorFill(const AProcesso: string; const Additional: string = ''): TAudit_OOP; override;
  end;

implementation

uses
  SysUtils, hw_utils, TipoTributoFiscalEnumUnit;

{ TOperacoesFiscaisIbsCbsDataSet }

constructor TOperacoesFiscaisIbsCbsDataSet.Create;
begin
  inherited Create('cds_op_fiscais_ibscbs', 'OP_FISCAIS_IBSCBS');

  SQLMaker.Build(
    TableName, 'o',
    '  o.id,  ' +
    '  o.op_interna_id o_op_interna_id, ' +
    '  o.regra_fiscal_id o_regra_fiscal_id, ' +
    '  o.grupo_fiscal_id o_grupo_fiscal_id, ' +
    '  o.data_ini_vigencia o_data_ini_vigencia, ' +
    '  o.data_fim_vigencia o_data_fim_vigencia, ' +
    '  o.ativo, ' +
    '  op.seqid op_seqid, ' +
    '  op.descricao op_descricao, ' +
    '  g.seqid g_seqid, ' +
    '  g.descricao g_descricao, ' +
    '  g.tipo_tributo g_tipo_tributo, ' +
    '  r.descricao r_descricao, ' +
    '  r.cclasstrib r_cclasstrib, ' +
    '  r.pdifcbs r_pdifcbs, ' +
    '  r.pdifibsuf r_pdifibsuf, ' +
    '  r.pdifibsmun r_pdifibsmun, ' +
    '  r.data_ini_vigencia r_data_ini_vigencia, ' +
    '  r.data_fim_vigencia r_data_fim_vigencia ',
    'inner join op_internas op on op.id = o.op_interna_id ' +
    'inner join regras_fiscais_ibscbs r on r.id = o.regra_fiscal_id ' +
    'left join grupos_fiscais g on g.id = o.grupo_fiscal_id ',
    '', 'op.descricao, r.descricao, g.descricao'
  );
end;

procedure TOperacoesFiscaisIbsCbsDataSet.Setup(const Builder: IFieldsConfigBuilder);
var
  S: string;
begin
  ConfigFields(
    Builder
      .Add('id,ativo,o_op_interna_id,o_regra_fiscal_id,o_grupo_fiscal_id', fvInvisivel)
      .Add('o_data_ini_vigencia', 'Inicio Vigencia')
      .Add('o_data_fim_vigencia', 'Fim Vigencia')
      .Add('op_seqid', 'Cod. Op Interna')
      .Add('op_descricao', 'Operação Interna', fvSempreVisivel)
      .Add('g_seqid', 'Cod. Grupo Fiscal')
      .Add('g_descricao', 'Grupo Fiscal', fvSempreVisivel)
      .Add('g_tipo_tributo', 'Tipo Tributo', GetText)
      .Add('r_descricao', 'Regra Fiscal', fvSempreVisivel)
      .Add('r_cclasstrib', 'CClass Trib', fvSempreVisivel)
      .Add('r_pdifcbs', 'Perc Diferimento CBS', '', DisplayNumber(4))
      .Add('r_pdifibsuf', 'Perc Diferimento IBS UF', '', DisplayNumber(4))
      .Add('r_pdifibsmun', 'Perc Diferimento IBS Municipio', '', DisplayNumber(4))
      .Add('r_data_ini_vigencia', 'Inicio Vigencia Regra Fiscal')
      .Add('r_data_fim_vigencia', 'Fim Vigencia Regra Fiscal')
      .ReorderAndSync(Self.GetSavedGrid().List)
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('id', True);

  S := SQLMaker.GetSQL();

  CreateFieldsBySQL(S);

  RunSQLMaker();
end;

procedure TOperacoesFiscaisIbsCbsDataSet.GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'G_TIPO_TRIBUTO') then
    Text := TipoTributoFiscalEnumDisplay[TipoTributoFiscalEnum(Sender.AsInteger)];
end;

function TOperacoesFiscaisIbsCbsDataSet.GetAuditorFill(const AProcesso: string;
  const Additional: string): TAudit_OOP;
var
  Mensagem: string;
begin
  Mensagem := '';

  if not fempty('op_seqid') then
    Mensagem := Mensagem + Format(' OP: %d', [fint('op_seqid')]);

  if not fempty('op_seqid') then
    Mensagem := Mensagem + Format(' GF: %d', [fint('g_seqid')]);

  if not fempty('op_seqid') then
    Mensagem := Mensagem + Format(' RF: %s - %s', [
      fstr('r_cclasstrib'), fstr('r_descricao')
    ]);

  Mensagem := Trim(Mensagem);

  if Additional <> '' then
    Mensagem := Mensagem + ' - ' + Additional;

  Result := Auditor.Processo(AProcesso, Mensagem, '');
end;

end.
