unit uDtmSpedNf;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBCustomDataSet, IBQuery;

type
  TdtmSpedNf = class(TDataModule)
    qrInfCompl: TIBQuery;
    dspInfCompl: TDataSetProvider;
    cdsInfCompl: TClientDataSet;
    dsInfCompl: TDataSource;
    cdsInfComplCOD_INF: TIntegerField;
    cdsInfComplCOD_EMPRESA: TIntegerField;
    cdsInfComplTXT: TStringField;
    cdsInfComplTXT_COMPL: TStringField;
    qrC110: TIBQuery;
    dspC110: TDataSetProvider;
    cdsC110: TClientDataSet;
    dsC110: TDataSource;
    cdsC110COD_NF: TIntegerField;
    cdsC110COD_EMPRESA: TIntegerField;
    cdsC110COD_INF: TIntegerField;
    cdsC110TXT_COMPL: TStringField;
    cdsC110TXT: TStringField;
    qrC111: TIBQuery;
    dspC111: TDataSetProvider;
    cdsC111: TClientDataSet;
    dsC111: TDataSource;
    cdsC111COD_NF: TIntegerField;
    cdsC111COD_EMPRESA: TIntegerField;
    cdsC111COD_INF: TIntegerField;
    cdsC111NUM_PROC: TStringField;
    cdsC111IND_PROC: TStringField;
    qrC112: TIBQuery;
    dspC112: TDataSetProvider;
    cdsC112: TClientDataSet;
    dsC112: TDataSource;
    cdsC112COD_NF: TIntegerField;
    cdsC112COD_EMPRESA: TIntegerField;
    cdsC112NITEM: TIntegerField;
    cdsC112COD_DA: TStringField;
    cdsC112UF: TStringField;
    cdsC112NUM_DA: TStringField;
    cdsC112COD_AUT: TStringField;
    cdsC112VL_DA: TFloatField;
    cdsC112DT_VCTO: TDateTimeField;
    cdsC112DT_PGTO: TDateTimeField;
    cdsC112COD_INF: TIntegerField;
    qrC113: TIBQuery;
    dspC113: TDataSetProvider;
    cdsC113: TClientDataSet;
    dsC113: TDataSource;
    qrNFSped: TIBQuery;
    dspNFSped: TDataSetProvider;
    cdsNFSped: TClientDataSet;
    cdsNFSpedCOD_NF: TIntegerField;
    cdsNFSpedNATUREZA_NF: TStringField;
    cdsNFSpedTIPO_NF: TStringField;
    cdsNFSpedNUM_NF: TIntegerField;
    cdsNFSpedSERIE: TStringField;
    cdsNFSpedMODELO_NF: TStringField;
    cdsNFSpedCOD_CLIENTE: TIntegerField;
    cdsNFSpedNOME_CLIENTE: TStringField;
    cdsC113COD_NF: TIntegerField;
    cdsC113COD_EMPRESA: TIntegerField;
    cdsC113COD_INF: TIntegerField;
    cdsC113COD_NF_REF: TIntegerField;
    qrC114: TIBQuery;
    dspC114: TDataSetProvider;
    cdsC114: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    dsC114: TDataSource;
    cdsC114ECF_FAB: TStringField;
    cdsC114NUM_DOC: TIntegerField;
    cdsC114DT_DOC: TDateTimeField;
    cdsC114ECF_CX: TIntegerField;
    cdsC114COD_MOD: TStringField;
    qrC120: TIBQuery;
    dspC120: TDataSetProvider;
    cdsC120: TClientDataSet;
    dsC120: TDataSource;
    cdsC120COD_NF: TIntegerField;
    cdsC120COD_EMPRESA: TIntegerField;
    cdsC120NUM_DOC_IMP: TStringField;
    cdsC120NUM_ACDRAW: TStringField;
    cdsC120COD_DOC_IMP: TStringField;
    cdsC120PIS_IMP: TFloatField;
    cdsC120COFINS_IMP: TFloatField;
    qrC115: TIBQuery;
    dspC115: TDataSetProvider;
    cdsC115: TClientDataSet;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    dsC115: TDataSource;
    cdsC115NITEM: TIntegerField;
    cdsC115IND_CARGA: TSmallintField;
    cdsC115CNPJ_COL: TStringField;
    cdsC115IE_COL: TStringField;
    cdsC115CPF_COL: TStringField;
    cdsC115COD_MUN_COL: TIntegerField;
    cdsC115UF_COL: TStringField;
    cdsC115NFE_XLGR_COL: TStringField;
    cdsC115NFE_NRO_COL: TStringField;
    cdsC115NFE_XCPL_COL: TStringField;
    cdsC115NFE_XBAIRRO_COL: TStringField;
    cdsC115NFE_XMUN_COL: TStringField;
    cdsC115CNPJ_ENTG: TStringField;
    cdsC115IE_ENTG: TStringField;
    cdsC115CPF_ENTG: TStringField;
    cdsC115COD_MUN_ENTG: TIntegerField;
    cdsC115UF_ENTG: TStringField;
    cdsC115NFE_XLGR_ENTG: TStringField;
    cdsC115NFE_NRO_ENTG: TStringField;
    cdsC115NFE_XCPL_ENTG: TStringField;
    cdsC115NFE_XBAIRRO_ENTG: TStringField;
    cdsC115NFE_XMUN_ENTG: TStringField;
    qrCidCol: TIBQuery;
    dspCidCol: TDataSetProvider;
    cdsCidCol: TClientDataSet;
    dsCidCol: TDataSource;
    cdsCidColCODIGO_UF_IBGE: TIntegerField;
    cdsCidColNOME_UF: TStringField;
    cdsCidColCODIGO_MUN_IBGE: TIntegerField;
    cdsCidColNOME_MUNICIPIO: TStringField;
    qrCidEnt: TIBQuery;
    dspCidEnt: TDataSetProvider;
    cdsCidEnt: TClientDataSet;
    dsCidEnt: TDataSource;
    cdsInfComplTIPO: TStringField;
    cdsC110TIPO: TStringField;
    qrC197: TIBQuery;
    dspC197: TDataSetProvider;
    cdsC197: TClientDataSet;
    dsC197: TDataSource;
    cdsC197COD_NF: TIntegerField;
    cdsC197COD_EMPRESA: TIntegerField;
    cdsC197NITEM: TIntegerField;
    cdsC197COD_AJ: TStringField;
    cdsC197DESCR_COMPL_AJ: TStringField;
    cdsC197VL_BC_ICMS: TFloatField;
    cdsC197ALIQ_ICMS: TFloatField;
    cdsC197VL_ICMS: TFloatField;
    cdsC197VL_OUTROS: TFloatField;
    qrLancF: TIBQuery;
    dspLancF: TDataSetProvider;
    cdsLancF: TClientDataSet;
    dsLancF: TDataSource;
    cdsLancFCOD_OBS: TIntegerField;
    cdsLancFCOD_EMPRESA: TIntegerField;
    cdsLancFTXT: TStringField;
    cdsC197COD_OBS: TIntegerField;
    cdsC197TXT_OBS: TStringField;
    cdsC111COD_ACAO_JUDICIAL: TIntegerField;
    cdsC111COD_ADM: TIntegerField;
    cdsLancFCOD_PADRAO_AJUSTE: TStringField;
    cdsNFSpedCHAVE_NFE_REF: TStringField;
    dsNFC113View: TDataSource;
    cdsC113CHAVE_NFE_REF: TStringField;
    cdsInfComplATIVO_EM_NFE: TStringField;
    cdsInfComplATIVO_EM_NFCE: TStringField;
    procedure cdsInfComplBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmSpedNf: TdtmSpedNf;

implementation

uses uDtmNF, uDtmAtivo;

{$R *.dfm}

procedure TdtmSpedNf.cdsInfComplBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

end.
