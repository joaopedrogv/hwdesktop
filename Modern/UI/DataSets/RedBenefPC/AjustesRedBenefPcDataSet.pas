unit AjustesRedBenefPcDataSet;

interface

uses
  DataSetGrid, DB, uDataSet_OOP, FieldsConfigUnit, hw_audit_utils, hw_filters, EntityMetadataUnit;

type
  TAjustesRedBenefPcDataSet = class(TDataSetGrid)
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder; Meta: EntityMetadata);
    function GetAuditorFill(const AProcesso: string; const Additional: string = ''): TAudit_OOP; override;
    procedure HandleFilterField(const Field: TFilterProps; var CondSet: FilterConditionEnumSet);
  end;

implementation

uses
  SysUtils, StrUtils,
  TipoComunsUnit, EValidacaoNegocioUnit, MasksConstsUnit;

{ TAjustesRedBenefPcDataSet }

function TAjustesRedBenefPcDataSet.GetAuditorFill(const AProcesso, Additional: string): TAudit_OOP;
begin
  Result := Auditor.Processo(
    AProcesso,
    Format('%s - %s', [ fstr('cst'), fstr('chave_dfe') ])
      + IfThen(Additional <> '', ' - ' + Additional),
    Format('%s - %s', [ fstr('cst'), fstr('chave_dfe') ])
  );
end;

procedure TAjustesRedBenefPcDataSet.HandleFilterField(const Field: TFilterProps; var CondSet: FilterConditionEnumSet);
begin
end;

constructor TAjustesRedBenefPcDataSet.Create;
begin
  inherited Create( 'CDS_AJ_REDBENEF', 'AJ_REDBENEF' );

  SQLMaker.Build( TableName, 'A',
    // 'select
    'A.ID, A.CHAVE_DFE, A.COD_EMPRESA, A.REGRA_ID, A.IND_AJ, A.COD_AJ, A.DATA_REF, A.CST, A.VBC, ' +
    'A.PPIS_AJ, A.VPIS_AJ, A.PCOFINS_AJ, A.VCOFINS_AJ, ' +
    'R.DESCR_AJ, R.INF_COMPL_AJ, R.COD_CTA ',
    'INNER JOIN REGRAS_REDBENEF_PC R ON R.ID = A.REGRA_ID ',
    '',
    '',
    'DATA_REF desc, CHAVE_DFE'
  );
end;

procedure TAjustesRedBenefPcDataSet.Setup(const Builder: IFieldsConfigBuilder; Meta: EntityMetadata);
var
  S: string;
begin
  ConfigFields( Builder
    .Add('ID,REGRA_ID,COD_EMPRESA', fvInvisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('DATA_REF'), fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('CHAVE_DFE'), fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('CST'), fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('VBC'), '', MSK_DEC_00, fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('PPIS_AJ'), '', MSK_DEC_0000)
    .AddPair( Meta.GetPairColumnAndDisplay('VPIS_AJ'), '', MSK_DEC_00, fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('PCOFINS_AJ'), '', MSK_DEC_0000)
    .AddPair( Meta.GetPairColumnAndDisplay('VCOFINS_AJ'), '', MSK_DEC_00, fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('DESCR_AJ'))
    .AddPair( Meta.GetPairColumnAndDisplay('INF_COMPL_AJ'))
    .AddPair( Meta.GetPairColumnAndDisplay('COD_CTA'))
    .AddPair( Meta.GetPairColumnAndDisplay('IND_AJ'))
    .AddPair( Meta.GetPairColumnAndDisplay('COD_AJ'))
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
