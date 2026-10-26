unit UDtmBalcao;

interface

uses
  SysUtils, Classes,uDadosIni, DB, IBDatabase, Provider, IBCustomDataSet,
  IBQuery, DBClient, IBStoredProc;

type
  TDtmBalcao = class(TDataModule)
    IbTransBalcao: TIBTransaction;
    QrPendBalcao: TIBQuery;
    DspPendBalcao: TDataSetProvider;
    CdsPendBalcao1: TClientDataSet;
    cdsBuscas: TClientDataSet;
    dspBuscas: TDataSetProvider;
    qrBuscas: TIBQuery;
    CdsPendBalcao1NREQ: TIntegerField;
    CdsPendBalcao1NOME_CLIENTE: TStringField;
    CdsPendBalcao1VALOR_TOTAL: TFloatField;
    CdsPendBalcao1DATA_REQ: TDateTimeField;
    CdsPendBalcao1DATA_C: TDateTimeField;
    CdsPendBalcao1OBS_CXL_RQ: TStringField;
    CdsPendBalcao1VL_RQ_PG_CXL: TFloatField;
    CdsPendBalcao1STATUS_CXL_RQ: TStringField;
    CdsPendBalcao1DIA_CXL: TDateTimeField;
    CdsPendBalcao1V_DESC: TFloatField;
    CdsPendBalcao1P_DESC: TFloatField;
    CdsPendBalcao1COD_CLIENTE: TIntegerField;
    CdsPendBalcao1COD_COND_PAG: TIntegerField;
    CdsPendBalcao1COD_VENDEDOR: TIntegerField;
    CdsPendBalcao1OP_CXL: TIntegerField;
    CdsPendBalcao1VL_ENTRADA: TFloatField;
    CdsPendBalcao1CODIGO_CTRL: TIntegerField;
    CdsPendBalcao1COD_EMPRESA: TIntegerField;
    CdsPendBalcao1NPREVENDA: TIntegerField;
    CdsPendBalcao1NCUPOM: TIntegerField;
    CdsPendBalcao1NSERIEECF: TStringField;
    CdsPendBalcao1OPERADOR: TIntegerField;
    QrFecDia: TIBQuery;
    DtPendReq: TDataSource;
    QrPendOS: TIBQuery;
    DspPendOS: TDataSetProvider;
    CdsPendOS1: TClientDataSet;
    DtPendOS: TDataSource;
    QrPendVeic: TIBQuery;
    DspPendVeic: TDataSetProvider;
    CdsPendVeic: TClientDataSet;
    CdsPendOS1N_OS: TIntegerField;
    CdsPendOS1NOME_CLIENTE: TStringField;
    CdsPendOS1VALOR_OS: TFloatField;
    CdsPendOS1DATA_OS: TDateTimeField;
    CdsPendOS1DATA_FEC_OS: TDateTimeField;
    CdsPendOS1OBS_CXL_OS: TStringField;
    CdsPendOS1VL_PAGO_CXL: TFloatField;
    CdsPendOS1STATUS_CXL_OS: TStringField;
    CdsPendOS1DIA_CXL: TDateTimeField;
    CdsPendOS1COD_CLIENTE: TIntegerField;
    CdsPendOS1DESC_VL_OS: TFloatField;
    CdsPendOS1DESC_P_PROD: TFloatField;
    CdsPendOS1DESC_P_SERV: TFloatField;
    CdsPendOS1TOT_PROD_OS: TFloatField;
    CdsPendOS1TOT_SERV_OS: TFloatField;
    CdsPendOS1COD_COND_PAG: TIntegerField;
    CdsPendOS1OBS_OS: TMemoField;
    CdsPendOS1COD_VENDEDOR: TIntegerField;
    CdsPendOS1OP_CXL: TIntegerField;
    CdsPendOS1COD_EMPRESA: TIntegerField;
    CdsPendOS1NPREVENDA: TIntegerField;
    CdsPendOS1NCUPOM: TIntegerField;
    CdsPendOS1NSERIEECF: TStringField;
    CdsPendOS1OPERADOR: TIntegerField;
    CdsPendVeicN_COMANDO: TIntegerField;
    CdsPendVeicNUM_NOTA_V: TIntegerField;
    CdsPendVeicCHASSIV: TStringField;
    CdsPendVeicNOME_RECEB: TStringField;
    CdsPendVeicFONE_RECEB: TStringField;
    CdsPendVeicVALOR_A_REC: TFloatField;
    CdsPendVeicCLIENTES_V: TIntegerField;
    CdsPendVeicCOVEND_V: TIntegerField;
    CdsPendVeicNATOP_V: TFloatField;
    CdsPendVeicDIA_CXL: TDateTimeField;
    CdsPendVeicSTATUS_CXL_RQ: TStringField;
    CdsPendVeicVL_RQ_PG_CXL: TFloatField;
    CdsPendVeicOP_CXL: TIntegerField;
    CdsPendVeicCONDPAG_V: TIntegerField;
    DtPendVeic: TDataSource;
    IbDbCCia: TIBDatabase;
    QrPendCCia: TIBQuery;
    IbTransCCia: TIBTransaction;
    QrPendRec: TIBQuery;
    DspPendRec: TDataSetProvider;
    CdsPendRec: TClientDataSet;
    CdsPendRecNRECIBO: TIntegerField;
    CdsPendRecCOD_EMPRESA: TIntegerField;
    CdsPendRecVALOR: TFloatField;
    CdsPendRecREFERENCIA1: TStringField;
    CdsPendRecREFERENCIA2: TStringField;
    CdsPendRecREFERENCIA3: TStringField;
    CdsPendRecREFERENCIA4: TStringField;
    CdsPendRecBENEF_CLIENT: TStringField;
    CdsPendRecNOME_DEV: TStringField;
    CdsPendRecDATA_REC: TDateTimeField;
    CdsPendRecLOCALDATA: TStringField;
    CdsPendRecRECANT: TStringField;
    CdsPendRecNDOCANT: TIntegerField;
    CdsPendRecDIA_CXL: TDateTimeField;
    CdsPendRecN_MOV_CXL: TIntegerField;
    CdsPendRecOBS_CXL_RQ: TStringField;
    CdsPendRecSTATUS_CXL_RQ: TStringField;
    CdsPendRecVL_RQ_PG_CXL: TFloatField;
    CdsPendRecHISTORICO_REC: TStringField;
    CdsPendRecOP_CXL: TIntegerField;
    CdsPendRecCOD_US: TIntegerField;
    DtPendRec: TDataSource;
    QrLancCXL: TIBQuery;
    DspLanccxl: TDataSetProvider;
    CdsLancCXL: TClientDataSet;
    DtLancCxl: TDataSource;
    CdsLancCXLCOD_LANCXL: TIntegerField;
    CdsLancCXLTIPO_DOC_CXL: TStringField;
    CdsLancCXLDATA_LC_CXL: TDateTimeField;
    CdsLancCXLN_DOC_CXL: TIntegerField;
    CdsLancCXLTIPO_LANC_CXL: TStringField;
    CdsLancCXLHISTORICO_CXL: TStringField;
    CdsLancCXLVALOR_CXL: TFloatField;
    CdsLancCXLSDD: TStringField;
    CdsLancCXLTR: TStringField;
    CdsLancCXLOP_CXL: TIntegerField;
    CdsLancCXLN_CONTA_PLC: TFloatField;
    CdsLancCXLCODIGO_EMP: TIntegerField;
    QrContrFormas: TIBQuery;
    DspContrFormas: TDataSetProvider;
    CdsContrFormas: TClientDataSet;
    CdsContrFormasNOME_CTRL: TStringField;
    CdsContrFormasSUM: TFloatField;
    CdsContrFormasCODIGO_CTRL: TIntegerField;
    QrDetalhesCtrl: TIBQuery;
    DtDetalhesCtrl: TDataSource;
    QrDetalhesCtrlDATA_MOV: TDateTimeField;
    QrDetalhesCtrlTPDOCS: TIBStringField;
    QrDetalhesCtrlNREQUISICAO: TIntegerField;
    QrDetalhesCtrlNDOC: TIBStringField;
    QrDetalhesCtrlCLIENTE: TIBStringField;
    QrDetalhesCtrlHISTORICO: TIBStringField;
    QrDetalhesCtrlVALORDOC: TFloatField;
    QrDetalhesCtrlDATA_VENC: TDateTimeField;
    QrDetalhesCtrlTERCEIROS: TIBStringField;
    QrDetalhesCtrlCOD_CONTROLE: TIntegerField;
    QrDetalhesCtrlSEQFORM: TIntegerField;
    DspFecdCxl: TDataSetProvider;
    CdsFecDia: TClientDataSet;
    CdsFecDiaN_MOV_CXL: TIntegerField;
    CdsFecDiaDIA_F_CXL: TDateTimeField;
    CdsFecDiaSTATUS_CXL: TStringField;
    CdsFecDiaOP_CXL: TIntegerField;
    CdsFecDiaCODIGO_EMP: TIntegerField;
    SpIncCodigoCxl: TIBStoredProc;
    DtFecDia: TDataSource;
    DtCtrlFormas: TDataSource;
    IbComandoPesq: TIBQuery;
    DtComandoPesq: TDataSource;
    IbComandoPesqN_COMANDO: TIntegerField;
    IbComandoPesqCOD_EMPRESA: TIntegerField;
    IbComandoPesqNUM_NOTA_V: TIntegerField;
    IbComandoPesqCHASSIV: TIBStringField;
    IbComandoPesqNAT_V: TIBStringField;
    IbComandoPesqNOME_RECEB: TIBStringField;
    IbComandoPesqFONE_RECEB: TIBStringField;
    IbComandoPesqVALOR_REAL: TFloatField;
    IbComandoPesqVALOR_A_REC: TFloatField;
    IbComandoPesqCODIGO_US: TIntegerField;
    IbComandoPesqTIPO_VENDA_V: TIBStringField;
    IbComandoPesqCLIENTES_V: TIntegerField;
    IbComandoPesqCOVEND_V: TIntegerField;
    IbComandoPesqCONDPAG_V: TIntegerField;
    IbComandoPesqNATOP_V: TFloatField;
    IbComandoPesqCODFISC_V: TIBStringField;
    IbComandoPesqPRVEN_V: TFloatField;
    IbComandoPesqFRETE_V: TFloatField;
    IbComandoPesqSEGURO_V: TFloatField;
    IbComandoPesqOUTDESP_V: TFloatField;
    IbComandoPesqALICM_V: TFloatField;
    IbComandoPesqREDB_V: TIBStringField;
    IbComandoPesqOBS_V: TMemoField;
    IbComandoPesqDESCONTO_V: TFloatField;
    IbComandoPesqINSCSUB_V: TIBStringField;
    IbComandoPesqVALTOT_V: TFloatField;
    IbComandoPesqDATA_VEN: TDateTimeField;
    IbComandoPesqSTATUS_V: TIBStringField;
    IbComandoPesqTIPO_V: TIBStringField;
    IbComandoPesqBICMSUB_V: TFloatField;
    IbComandoPesqVLICMSUB_V: TFloatField;
    IbComandoPesqVERSAO_V: TIntegerField;
    IbComandoPesqGRUPO_C_V: TIBStringField;
    IbComandoPesqINF_CORPO_V: TMemoField;
    IbComandoPesqDIA_CXL: TDateTimeField;
    IbComandoPesqN_MOV_CXL: TIntegerField;
    IbComandoPesqSTATUS_CXL_RQ: TIBStringField;
    IbComandoPesqVL_RQ_PG_CXL: TFloatField;
    IbComandoPesqVALOBS1: TFloatField;
    IbComandoPesqVALOBS2: TFloatField;
    IbComandoPesqVALOBS3: TFloatField;
    IbComandoPesqVALOBS4: TFloatField;
    IbComandoPesqVALOBS5: TFloatField;
    IbComandoPesqDADOS_V: TMemoField;
    IbComandoPesqCODIGO_TR: TIntegerField;
    IbComandoPesqBASE_ICM_V: TFloatField;
    IbComandoPesqICMS_V: TFloatField;
    IbComandoPesqCONFUS: TIBStringField;
    IbComandoPesqPEDRA_C_V: TIntegerField;
    IbComandoPesqPLACA_V_TR: TIBStringField;
    IbComandoPesqFRC_VND: TIBStringField;
    IbComandoPesqV_QUANT_VND: TIBStringField;
    IbComandoPesqESPECIE_VND: TIBStringField;
    IbComandoPesqMARCA_VND: TIBStringField;
    IbComandoPesqNUMERO_VND: TIBStringField;
    IbComandoPesqPESO_B_VND: TIBStringField;
    IbComandoPesqPESO_L_VND: TIBStringField;
    IbComandoPesqUF_PLACA_TR: TIBStringField;
    IbComandoPesqSITUACAO: TIBStringField;
    IbComandoPesqOBS1: TIBStringField;
    IbComandoPesqOBS2: TIBStringField;
    IbComandoPesqOBS3: TIBStringField;
    IbComandoPesqOBS4: TIBStringField;
    IbComandoPesqOBS5: TIBStringField;
    IbComandoPesqREC_ANT: TIntegerField;
    IbComandoPesqOP_CXL: TIntegerField;
    IbComandoPesqATIVO: TIntegerField;
    IbComandoPesqDTSITUACAO: TDateTimeField;
    IbComandoPesqDT_ENT_SAID: TDateTimeField;
    IBQuery1: TIBQuery;
    DataSetProvider1: TDataSetProvider;
    CdsPendOS: TClientDataSet;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField3: TDateTimeField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField5: TFloatField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    StringField4: TStringField;
    IntegerField10: TIntegerField;
    CdsPendOSNPED: TIntegerField;
    CdsPendOSDATA_PED: TDateTimeField;
    CdsPendOSDATA_FECH: TDateTimeField;
    CdsPendOSVL_PAGO_CXL: TFloatField;
    CdsPendOSDESCONTO: TFloatField;
    CdsPendOSDESC_P_PROD: TFloatField;
    CdsPendOSDESC_P_SERV: TFloatField;
    CdsPendBalcao: TClientDataSet;
    CdsPendBalcaoNPED: TIntegerField;
    IntegerField1: TIntegerField;
    StringField5: TStringField;
    FloatField2: TFloatField;
    CdsPendBalcaoDATA_PED: TDateTimeField;
    CdsPendBalcaoDATA_FECH: TDateTimeField;
    StringField6: TStringField;
    CdsPendBalcaoVL_PAGO_CXL: TFloatField;
    StringField7: TStringField;
    DateTimeField1: TDateTimeField;
    CdsPendBalcaoDESCONTO: TFloatField;
    CdsPendBalcaoDESC_P_PROD: TFloatField;
    CdsPendBalcaoDESC_P_SERV: TFloatField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    FloatField3: TFloatField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    StringField8: TStringField;
    IntegerField18: TIntegerField;
    CdsPendBalcaoTIPO: TStringField;
    CdsPendOSTIPO: TStringField;
    CdsPendRecVALOR_ORIG: TFloatField;
    CdsPendRecCOD_BENEF: TIntegerField;
    QrBuscasGeral: TIBQuery;
    CdsPendVeicMODELO_NF: TStringField;
    CdsPendVeicSITUACAO_NFE: TStringField;
    CdsPendVeicTIPO_VENDA_V: TStringField;
    CdsPendVeicCONFUS: TStringField;
    CdsPendVeicREC_ANT: TIntegerField;
    CdsPendVeicSUB_SERIE: TIntegerField;
    CdsPendRecCOD_DEVEDOR: TIntegerField;
    CdsPendVeicSERIE: TStringField;
    CdsPendVeicDATA_VEN: TDateTimeField;
    CdsPendVeicPROTOCOLO: TStringField;
    CdsPendVeicCODIGOERRO: TStringField;
    CdsPendVeicDESCRICAOERRO: TStringField;
    CdsPendVeicCHAVE_NFE: TStringField;
    CdsPendBalcaoNUM_NF: TIntegerField;
    CdsPendBalcaoDATA_NF: TDateTimeField;
    CdsPendBalcaoTIPO_OS: TStringField;
    CdsPendBalcaoCOD_CARGA: TIntegerField;
    qrBuscas2: TIBQuery;
    qrBuscas3: TIBQuery;
    CdsPendBalcaoVALOR_DESC_AVISTA: TFloatField;
    CdsPendBalcaoTOT_PROD: TFloatField;
    CdsPendVeicTIPONFE: TStringField;
    CdsPendBalcaoNUM_NFEEXT: TLargeintField;
    CdsPendVeicEMISSAO_PROPRIA: TStringField;
    CdsPendRecNUM_REC_DEP: TStringField;
    CdsPendRecATRAVES1: TStringField;
    CdsPendRecATRAVES2: TStringField;
    CdsPendRecATRAVES3: TStringField;
    CdsPendRecOBSERVACAO1: TStringField;
    CdsPendRecOBSERVACAO2: TStringField;
    CdsPendRecOBSERVACAO3: TStringField;
    QrDetalhesCtrlNUM_REC_DEP: TIBStringField;
    QrDetalhesCtrlNUM_REC_PARC: TIBStringField;
    CdsPendVeicDATA_FECH: TDateTimeField;
    CdsPendVeicHORA_FECH: TStringField;
    CdsPendVeicDESCONTO_V: TFloatField;
    CdsContrFormasVL_JUROS: TFloatField;
    CdsPendOSCOD_NFCE: TIntegerField;
    CdsPendBalcaoCOD_NFCE: TIntegerField;
    CdsPendRecCXL: TStringField;
    CdsPendBalcaoDIFCX: TStringField;
    CdsPendVeicDIFCX: TStringField;
    CdsPendBalcaoNUM_NFCE: TIntegerField;
    CdsPendOSNUM_NFCE: TIntegerField;
    CdsPendBalcaoOP_NFCE: TIntegerField;
    CdsPendBalcaoCX_NFCE: TIntegerField;
    CdsPendOSOP_NFCE: TIntegerField;
    CdsPendOSCX_NFCE: TIntegerField;
    CdsPendBalcaoLOCAL_VENDA: TStringField;
    CdsPendBalcaoID_COMMERCE: TLargeintField;
    CdsPendBalcaoNF_AC_CALCTRIB: TStringField;
    CdsPendBalcaoCOD_CLI_FAT: TIntegerField;
    procedure CdsPendBalcao1BeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure mudaSelect(DataSet: TClientDataSet);
  public
    { Public declarations }
    function criaDtm: boolean;
  end;

var
  DtmBalcao: TDtmBalcao;

implementation

uses
  Dialogs, uDtmAtivo;

{$R *.dfm}

procedure TDtmBalcao.DataModuleCreate(Sender: TObject);
begin
  try
    vDadosIni := TSingleton.GetInstance;
    vDadosIni.codEmpresa:='1';
    vDadosIni.vCodOpCxl:=1;
    vDadosIni.diaFCxl:=strtodate('25/10/2008');
    // vDadosIniEnt.setDadosConfig(vDadosIniFP);chamar este metodo logo apos a criacao deste dtm
    criaDtm; //chamar este metodo tambem para conectar ao banco
  except
  end;
end;

procedure TDtmBalcao.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to DtmBalcao.ComponentCount - 1 do
    begin
      if (DtmBalcao.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(DtmBalcao.Components[i]).Name) = UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(DtmBalcao.Components[i]).DataSet).SQL.Text := DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

procedure TDtmBalcao.CdsPendBalcao1BeforeOpen(DataSet: TDataSet);
begin
 mudaSelect(TClientDataSet(DataSet));
end;

function TDtmBalcao.criaDtm: boolean;
begin
  vDadosIni.LerConfigini;
  try
    vDadosIni.conectaBanco(dtmAtivo.bancoHw,vDadosIni.GetBaseDados('Banco', 'HW'),true);
    Result := true;
  except
    MessageDlg('A base de dados Hw.fdb não se encontra no caminho especificado:'
      + #13 + vDadosIni.GetBaseDados('Banco', 'HW'), mtInformation, [mbOK], 0);
    Result := false;
  end;
end;


end.
