unit uDtmLancamentos;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBQuery, IBDatabase,
  IBCustomDataSet, IBStoredProc, RDprint;

type
  TdtmLancamentos = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    qrBuscas2: TIBQuery;
    qrLancamentos: TIBQuery;
    dspLancamentos: TDataSetProvider;
    cdsLancamentos: TClientDataSet;
    dsLancamentos: TDataSource;
    cdsLancamentosCOD_LANC: TIntegerField;
    cdsLancamentosN_CONTA_PLC: TFloatField;
    cdsLancamentosCODIGO_CTRL: TIntegerField;
    cdsLancamentosDIA_FCD: TDateTimeField;
    cdsLancamentosNMOV: TIntegerField;
    cdsLancamentosTIPO_L: TStringField;
    cdsLancamentosDATA: TDateTimeField;
    cdsLancamentosNDOC_L: TStringField;
    cdsLancamentosHISTORICO_L: TStringField;
    cdsLancamentosVALOR_L: TFloatField;
    cdsLancamentosSTATUS_L: TStringField;
    cdsLancamentosDATQ_L: TDateTimeField;
    cdsLancamentosNATL: TStringField;
    cdsLancamentosLOTE: TIntegerField;
    cdsLancamentosTIP_CNT: TStringField;
    cdsLancamentosDATA_CXL: TDateTimeField;
    cdsLancamentosLANC_VENDA: TStringField;
    cdsLancamentosDATA_REM_REC: TDateTimeField;
    cdsLancamentosTP_MOD: TStringField;
    cdsLancamentosCOD_TERM: TIntegerField;
    cdsLancamentosDT_COMPENSADO: TDateTimeField;
    cdsLancamentosNOMINAL_L: TStringField;
    cdsLancamentosN_CHEQ_L: TStringField;
    cdsLancamentosVL_CONTABIL: TFloatField;
    cdsLancamentosLOTE_ENT: TIntegerField;
    cdsLancamentosCODIGO_EMP: TIntegerField;
    cdsLancamentosCOD_EMP_MULT: TIntegerField;
    cdsLancamentosOP_CXL: TIntegerField;
    cdsLancamentosDTREFERENCIA: TDateTimeField;
    cdsLancamentosNOME_CTRL: TStringField;
    qrPCont: TIBQuery;
    dspPcont: TDataSetProvider;
    cdsPCont: TClientDataSet;
    dsPCont: TDataSource;
    qrCtrl: TIBQuery;
    dspCtrl: TDataSetProvider;
    cdsCtrl: TClientDataSet;
    dsCtrl: TDataSource;
    dsBuscas: TDataSource;
    dsBuscas2: TDataSource;
    cdsLancamentosCOD_OCORRENCIA: TIntegerField;
    cdsLancamentosDATA_OCORRENCIA: TDateTimeField;
    cdsLancamentosLOTE_QUIT: TIntegerField;
    RDprint1: TRDprint;
    IbQrResumo: TIBQuery;
    IbQrSlCtrl: TIBQuery;
    IbQrBoletim: TIBQuery;
    IbSaldoCtrl: TIBQuery;
    DspSaldoCtrl: TDataSetProvider;
    CdsSaldoCtrl: TClientDataSet;
    IbFechDia: TIBQuery;
    DspFechDia: TDataSetProvider;
    CdsFechDia: TClientDataSet;
    DsFechDia: TDataSource;
    qrSaldoCtrl: TIBQuery;
    dsSaldoCtrl: TDataSource;
    qrBuscasGerais: TIBQuery;
    cdsLancamentosCOD_ADM: TIntegerField;
    qrEmpresasUnificadas: TIBQuery;
    dspEmpresasUnificadas: TDataSetProvider;
    cdsEmpresasUnificadas: TClientDataSet;
    dsEmpresasUnificadas: TDataSource;
    cdsEmpresasUnificadasIDENTIFICACAO_EMP: TStringField;
    cdsEmpresasUnificadasCOD_EMPRESA: TIntegerField;
    cdsLancamentosCOD_DESPESA: TIntegerField;
    cdsLancamentosIDENTIFICACAO_EMP: TStringField;
    cdsLancamentosCOD_CONTRAPARTIDA: TIntegerField;
    qrAcompens: TIBQuery;
    dspAcompens: TDataSetProvider;
    cdsAcompens: TClientDataSet;
    dsAcompens: TDataSource;
    cdsAcompensTipoPag: TStringField;
    cdsAcompensNumConta: TFloatField;
    cdsAcompensNumDoc: TStringField;
    cdsAcompensNumCheque: TStringField;
    cdsAcompensHistrico: TStringField;
    cdsAcompensValor: TFloatField;
    cdsAcompensDataCompensao: TDateTimeField;
    cdsAcompensDiaConciliao: TDateTimeField;
    cdsAcompensCodLancamento: TIntegerField;
    cdsAcompensTipoLanamento: TStringField;
    cdsAcompensDataLanamento: TDateTimeField;
    cdsAcompensSEL: TStringField;
    qrControles: TIBQuery;
    dspControles: TDataSetProvider;
    cdsControles: TClientDataSet;
    dsControles: TDataSource;
    cdsControlesCodControle: TIntegerField;
    cdsControlesFluxodeCaixa: TStringField;
    cdsControlesNumdoBanco: TStringField;
    cdsControlesNomedoControleBanco: TStringField;
    cdsControlesNumContaBanco: TStringField;
    cdsControlesControleBancrio: TStringField;
    cdsControlesFonedoBanco: TStringField;
    cdsAcompensCodUnificada: TIntegerField;
    cdsAcompensUnificada: TStringField;
    qrRecibosEstornar: TIBQuery;
    dspRecibosEstornar: TDataSetProvider;
    cdsRecibosEstornar: TClientDataSet;
    dsRecibosEstornar: TDataSource;
    cdsRecibosEstornarNRECIBO: TIntegerField;
    cdsRecibosEstornarCOD_EMPRESA: TIntegerField;
    cdsRecibosEstornarVALOR: TFloatField;
    cdsRecibosEstornarREFERENCIA1: TStringField;
    cdsRecibosEstornarREFERENCIA2: TStringField;
    cdsRecibosEstornarREFERENCIA3: TStringField;
    cdsRecibosEstornarREFERENCIA4: TStringField;
    cdsRecibosEstornarBENEF_CLIENT: TStringField;
    cdsRecibosEstornarNOME_DEV: TStringField;
    cdsRecibosEstornarDATA_REC: TDateTimeField;
    cdsRecibosEstornarLOCALDATA: TStringField;
    cdsRecibosEstornarRECANT: TStringField;
    cdsRecibosEstornarSTATUS_REC: TStringField;
    cdsRecibosEstornarCOD_BENEF: TIntegerField;
    cdsRecibosEstornarDEPREC: TStringField;
    cdsRecibosEstornarNDOCANT: TIntegerField;
    cdsRecibosEstornarDIA_CXL: TDateTimeField;
    cdsRecibosEstornarN_MOV_CXL: TIntegerField;
    cdsRecibosEstornarOBS_CXL_RQ: TStringField;
    cdsRecibosEstornarSTATUS_CXL_RQ: TStringField;
    cdsRecibosEstornarVL_RQ_PG_CXL: TFloatField;
    cdsRecibosEstornarDATA_BAIXA: TDateTimeField;
    cdsRecibosEstornarHISTORICO_REC: TStringField;
    cdsRecibosEstornarCOD_PREP: TIntegerField;
    cdsRecibosEstornarSELEC: TStringField;
    cdsRecibosEstornarOP_CXL: TIntegerField;
    cdsRecibosEstornarCOD_US: TIntegerField;
    cdsRecibosEstornarATIVO: TIntegerField;
    cdsRecibosEstornarCOD_DEVEDOR: TIntegerField;
    cdsRecibosEstornarVALOR_ORIG: TFloatField;
    cdsRecibosEstornarNUM_NF: TIntegerField;
    cdsRecibosEstornarSERIE_NF: TStringField;
    cdsRecibosEstornarDEVOLUCAO: TStringField;
    cdsRecibosEstornarNUM_REC_DEP: TStringField;
    cdsRecibosEstornarATRAVES1: TStringField;
    cdsRecibosEstornarATRAVES2: TStringField;
    cdsRecibosEstornarATRAVES3: TStringField;
    cdsRecibosEstornarOBSERVACAO1: TStringField;
    cdsRecibosEstornarOBSERVACAO2: TStringField;
    cdsRecibosEstornarOBSERVACAO3: TStringField;
    cdsRecibosEstornarCOD_DEPTO: TIntegerField;
    cdsRecibosEstornarCOD_NF: TIntegerField;
    cdsRecibosEstornarPRG_FID: TStringField;
    cdsRecibosEstornarCOD_LOCACAO: TIntegerField;
    cdsRecibosEstornarVALOR_ESTORNADO: TFloatField;
    cdsRecibosEstornarSEL: TStringField;
    cdsRecibosEstornarFORMAS: TIntegerField;
    cdsLancamentosLANC_AVULSO: TStringField;
    cdsLancamentosCOD_CONTRAPARTIDA_CTP: TIntegerField;
    cdsLancamentosDATA_VENC_CHEQ_L: TDateTimeField;
    cdsAcompensDataVencimento: TDateTimeField;
    cdsLancamentosID_FINANC_CONFERE: TIntegerField;
    cdsLancamentosDESC_PLC: TStringField;
    cdsLancamentosDESC_GR: TStringField;
    cdsLancamentosDESC_DEP: TStringField;
    cdsLancamentosNOME_CTA: TStringField;
    cdsLancamentosCOD_CTA_CONTABIL: TStringField;
    cdsLancamentosARQ_EXTRATO_ADM: TStringField;
    cdsLancamentosDATA_ARQUIVO: TDateTimeField;
    qrLancFP: TIBQuery;
    dspLancFP: TDataSetProvider;
    cdsLancFP: TClientDataSet;
    dsLancFP: TDataSource;
    cdsLancFPSEQFORM: TIntegerField;
    cdsLancFPN_PROCESSAMENTO: TIntegerField;
    cdsLancFPNREQUISICAO: TIntegerField;
    cdsLancFPNDOC: TStringField;
    cdsLancFPTPDOCS: TStringField;
    cdsLancFPCOD_CONTROLE: TIntegerField;
    cdsLancFPNOME_CTRL: TStringField;
    cdsLancFPDATA_MOV: TDateTimeField;
    cdsLancFPDATA_VENC: TDateTimeField;
    cdsLancFPVALORDOC: TFloatField;
    cdsLancFPCOD_CLIENTE: TIntegerField;
    cdsLancFPCPFCGC: TStringField;
    cdsLancFPNOME_CLIENTE: TStringField;
    cdsLancFPRAZAO: TStringField;
    cdsLancFPSEQTIPO: TStringField;
    cdsLancFPSTATUS: TStringField;
    cdsLancFPDATQ: TDateTimeField;
    qrDocSendoRec: TIBQuery;
    dspDocSendoRec: TDataSetProvider;
    cdsDocSendoRec: TClientDataSet;
    dsDocSendoRec: TDataSource;
    cdsDocSendoRecSEQTIPO: TStringField;
    cdsDocSendoRecCOD_CRED: TIntegerField;
    cdsDocSendoRecN_DOC_V: TIntegerField;
    cdsDocSendoRecN_DOC_C: TStringField;
    cdsDocSendoRecTP_DOC_V: TStringField;
    cdsDocSendoRecCODIGO_CTRL: TIntegerField;
    cdsDocSendoRecNOME_CTRL: TStringField;
    cdsDocSendoRecDATA_REC_C: TDateTimeField;
    cdsDocSendoRecDATA_VENC_C: TDateTimeField;
    cdsDocSendoRecVALOR_C: TFloatField;
    cdsDocSendoRecSTATUS_C: TStringField;
    cdsDocSendoRecDATQ_C: TDateTimeField;
    cdsDocSendoRecSTATUS_CX: TStringField;
    cdsDocSendoRecCOD_CLIENTE: TIntegerField;
    cdsDocSendoRecCPFCGC: TStringField;
    cdsDocSendoRecNOME_CLIENTE: TStringField;
    cdsDocSendoRecRAZAO: TStringField;
    cdsDocSendoRecSEL: TStringField;
    cdsDocSendoRecCODIGO_EMP: TIntegerField;
    cdsDocSendoRecOP_CX: TIntegerField;
    cdsDocSendoRecN_CH: TStringField;
    cdsLancFPVALOR_CORR: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsLancamentosBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmLancamentos: TdtmLancamentos;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TdtmLancamentos.cdsLancamentosBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmLancamentos);
end;

procedure TdtmLancamentos.DataModuleCreate(Sender: TObject);
var
  J, I: Integer;
begin
  for J := 0 to Self.ComponentCount - 1 do
    if Self.Components[J] is TClientDataSet then
      for I := 0 to TClientDataSet(Self.Components[J]).FieldCount - 1 do
      begin
        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXA' +
          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
          TClientDataSet(Self.Components[J]).Fields[I].FieldName, []);
        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXD' +
          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
          TClientDataSet(Self.Components[J]).Fields[I].FieldName, [ixDescending]);
      end;
end;

end.
