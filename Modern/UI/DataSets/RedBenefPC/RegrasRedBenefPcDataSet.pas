unit RegrasRedBenefPcDataSet;

interface

uses
  DataSetGrid, DB, uDataSet_OOP, FieldsConfigUnit, hw_audit_utils, hw_filters, EntityMetadataUnit;

type
  TRegrasRedBenefPcDataSet = class(TDataSetGrid)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder; Meta: EntityMetadata);
    procedure HandleFilterField(const Field: TFilterProps; var CondSet: FilterConditionEnumSet);
  end;

implementation

uses
  SysUtils, StrUtils,
  TipoComunsUnit, EValidacaoNegocioUnit, MasksConstsUnit;

{ TRegrasRedBenefPcDataSet }

procedure TRegrasRedBenefPcDataSet.GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := ''
  else if MatchText(Sender.FieldName, ['EMPRESAS', 'NAT_REC', 'RESTRICOES_NCM']) then
    Text := Sender.AsString;
end;

procedure TRegrasRedBenefPcDataSet.HandleFilterField(const Field: TFilterProps; var CondSet: FilterConditionEnumSet);
begin
  if Field.field = 'ORDENS_SERVICO' then
    CondSet := [ feEquals, feBetween ];
end;

constructor TRegrasRedBenefPcDataSet.Create;
begin
  inherited Create( 'CDS_REGRA_AJ_PCLC214', 'REGRAS_REDBENEF_PC' );

  SQLMaker.Build( TableName, 'r',
    // 'select
    'r.id, r.seqid, r.cst, r.descricao, r.pred, r.ind_aj, r.cod_aj, r.descr_aj, r.inf_compl_aj, ' +
    'r.data_ini_vigencia, r.data_fim_vigencia, r.ativo, ' +
    '(select list(e.cod_empresa) from REGRAS_REDBENEF_PC_EMP e where e.regra_id = r.id) empresas, ' +
    '(select list(r1.nat_rec) from REGRAS_REDBENEF_PC_NAT_REC r1 where r1.regra_id = r.id) nat_rec, ' +
    '(select list(r2.ncm) from REGRAS_REDBENEF_PC_NCM_EXC r2 where r2.regra_id = r.id) restricoes_ncm ',
    //'from aj_pc_regras r ' +
    '',
    '',
    'id, cst'
  );

end;

procedure TRegrasRedBenefPcDataSet.Setup(const Builder: IFieldsConfigBuilder; Meta: EntityMetadata);
var
  S: string;
begin
  ConfigFields( Builder
    .Add('id,ativo', fvInvisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('seqid'), fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('cst'), fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('descricao'), fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('pred'), MSK_DEC_0000 )
    .AddPair( Meta.GetPairColumnAndDisplay('ind_aj') )
    .AddPair( Meta.GetPairColumnAndDisplay('cod_aj') )
    .AddPair( Meta.GetPairColumnAndDisplay('descr_aj') )
    .AddPair( Meta.GetPairColumnAndDisplay('inf_compl_aj') )
    .AddPair( Meta.GetPairColumnAndDisplay('empresas'), GetText )
    .AddPair( Meta.GetPairColumnAndDisplay('nat_rec'), GetText)
    .AddPair( Meta.GetPairColumnAndDisplay('restricoes_ncm'), GetText)
    .ReorderAndSync( Self.GetSavedGrid().List )
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('id', True);

  S := SQLMaker.GetSQL();

  CreateFieldsBySQL( S );

  //CreateSelectionField('SEL');

  RunSQLMaker();
end;

end.
