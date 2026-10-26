unit NFePendentesSefazDataSet;

interface  

uses
  DataSetGrid, DB, uDataSet_OOP, FieldsConfigUnit, hw_audit_utils, hw_filters, EntityMetadataUnit;

type
  TNFePendentesSefazDataSet = class(TDataSetGrid)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder; Meta: EntityMetadata);
  end;

implementation

uses
  SysUtils, StrUtils,
  TipoComunsUnit, EValidacaoNegocioUnit, MasksConstsUnit, StatusResolucaoNFeSefEnumUnit;

{ TNFePendentesSefazDataSet }

constructor TNFePendentesSefazDataSet.Create;
begin
  inherited Create( 'CDS_NF_PEND_SEFAZ', 'NOTAFISCAL_PEND_SEFAZ' );

  SQLMaker.Build( TableName, 'sef',
    // 'select
    'sef.*, ' +
    'nc.num_nf num_nf_cont, nc.situacao_nfe situacao_cont, nc.data_lanc data_lanc_cont, ' +
    'np.num_nf num_nf_pend, np.situacao_nfe situacao_pend, np.data_lanc data_lanc_pend ',
    //'from notafiscal_pend_sefaz sef ' +
    'left join notafiscal nc on nc.cod_nf = sef.cod_nf and nc.cod_empresa = sef.cod_empresa ' +
    'left join notafiscal np on np.cod_nf = sef.cod_nf_pend and np.cod_empresa = sef.cod_empresa ',
    '',
    'dhemi desc'
  );
end;

procedure TNFePendentesSefazDataSet.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := ''
  else if Sender.FieldName = 'STATUS_RESOLUCAO' then
    Text := StatusResolucaoNFeSefEnumStr[StatusResolucaoNFeSefEnum(Sender.AsInteger)]
end;

procedure TNFePendentesSefazDataSet.Setup(const Builder: IFieldsConfigBuilder; Meta: EntityMetadata);
var
  S: string;
begin
  ConfigFields( Builder
    .Add('cod_empresa', fvInvisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('dhemi'))
    .AddPair( Meta.GetPairColumnAndDisplay('status_resolucao'), GetText)
    .AddPair( Meta.GetPairColumnAndDisplay('num_nf_cont'), fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('situacao_cont'), fvSempreVisivel).Width(100)
    .AddPair( Meta.GetPairColumnAndDisplay('data_lanc_cont'))
    .AddPair( Meta.GetPairColumnAndDisplay('num_nf_pend'), fvSempreVisivel)
    .AddPair( Meta.GetPairColumnAndDisplay('situacao_pend'), fvSempreVisivel).Width(100)
    .AddPair( Meta.GetPairColumnAndDisplay('data_lanc_pend'))
    .AddPair( Meta.GetPairColumnAndDisplay('cod_nf'))
    .AddPair( Meta.GetPairColumnAndDisplay('cod_nf_pend'))
    .ReorderAndSync( Self.GetSavedGrid().List )
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('cod_nf', True);

  S := SQLMaker.GetSQL();

  CreateFieldsBySQL( S );

  //CreateSelectionField('SEL');

  RunSQLMaker();
end;

end.
