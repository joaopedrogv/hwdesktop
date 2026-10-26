unit uDtmSPED;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBQuery, IBDatabase,
  IBCustomDataSet, IBStoredProc;

type
  TdtmSPED = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    dsBuscas: TDataSource;
    qrBuscas2: TIBQuery;
    qrInfCompl: TIBQuery;
    dspInfCompl: TDataSetProvider;
    cdsInfCompl: TClientDataSet;
    dsInfCompl: TDataSource;
    cdsInfComplCOD_INF: TIntegerField;
    cdsInfComplCOD_EMPRESA: TIntegerField;
    cdsInfComplTXT: TStringField;
    cdsInfComplTXT_COMPL: TStringField;
    cdsInfComplTIPO: TStringField;
    cdsInfComplATIVO: TSmallintField;
    qrAcaoJud: TIBQuery;
    dspAcaoJud: TDataSetProvider;
    cdsAcaoJud: TClientDataSet;
    dsAcaoJud: TDataSource;
    qrProcAdm: TIBQuery;
    dspProcAdm: TDataSetProvider;
    cdsProcAdm: TClientDataSet;
    dsProcAdm: TDataSource;
    cdsAcaoJudCOD_ACAO_JUDICIAL: TIntegerField;
    cdsAcaoJudNUM_PROC: TStringField;
    cdsAcaoJudID_SEC_JUD: TStringField;
    cdsAcaoJudID_VARA: TStringField;
    cdsAcaoJudIND_NAT_ACAO: TStringField;
    cdsAcaoJudDESC_DEC_JUD: TStringField;
    cdsAcaoJudDT_SENT_JUD: TDateTimeField;
    cdsAcaoJudDATA_LANC: TDateTimeField;
    cdsProcAdmCOD_ADM: TIntegerField;
    cdsProcAdmNUM_PROC: TStringField;
    cdsProcAdmIND_NAT_ACAO: TStringField;
    cdsProcAdmDT_DEC_ADM: TDateTimeField;
    cdsProcAdmDATA_LANC: TDateTimeField;
    qrOutRecCred: TIBQuery;
    dspOutRecCred: TDataSetProvider;
    cdsOutRecCred: TClientDataSet;
    dsOutRecCred: TDataSource;
    cdsOutRecCredCOD_REC_CRED: TIntegerField;
    cdsOutRecCredCOD_EMPRESA: TIntegerField;
    cdsOutRecCredIND_OPER: TIntegerField;
    cdsOutRecCredCOD_CLIENTE: TIntegerField;
    cdsOutRecCredCOD_ITEM: TStringField;
    cdsOutRecCredDESCR_ITEM: TStringField;
    cdsOutRecCredDT_OPER: TDateTimeField;
    cdsOutRecCredDATA_LANC: TDateTimeField;
    cdsOutRecCredVL_OPER: TFloatField;
    cdsOutRecCredCST_PIS: TStringField;
    cdsOutRecCredVL_BC_PIS: TFloatField;
    cdsOutRecCredALIQ_PIS: TFloatField;
    cdsOutRecCredVL_PIS: TFloatField;
    cdsOutRecCredCST_COFINS: TStringField;
    cdsOutRecCredVL_BC_COFINS: TFloatField;
    cdsOutRecCredALIQ_COFINS: TFloatField;
    cdsOutRecCredVL_COFINS: TFloatField;
    cdsOutRecCredNAT_BC_CRED: TStringField;
    cdsOutRecCredIND_ORIG_CRED: TStringField;
    cdsOutRecCredCOD_CTA: TStringField;
    cdsOutRecCredCOD_CCUS: TStringField;
    cdsOutRecCredDESC_DOC_OPER: TMemoField;
    cdsOutRecCredPROCESSOS_REF: TMemoField;
    cdsOutRecCredATIVO: TIntegerField;
    qrCredDepr: TIBQuery;
    dspCredDepr: TDataSetProvider;
    cdsCredDepr: TClientDataSet;
    dsCredDepr: TDataSource;
    cdsCredDeprCOD_DEPREC: TIntegerField;
    cdsCredDeprCOD_EMPRESA: TIntegerField;
    cdsCredDeprNAT_BC_CRED: TStringField;
    cdsCredDeprIDENT_BEM_IMOB: TStringField;
    cdsCredDeprIND_ORIG_CRED: TSmallintField;
    cdsCredDeprIND_UTIL_BEM_IMOB: TSmallintField;
    cdsCredDeprVL_OPER_DEP: TFloatField;
    cdsCredDeprPARC_OPER_NAO_BC_CRED: TFloatField;
    cdsCredDeprDATA_OPERACAO: TDateTimeField;
    cdsCredDeprDATA_LANC: TDateTimeField;
    cdsCredDeprCST_PIS: TStringField;
    cdsCredDeprVL_BC_PIS: TFloatField;
    cdsCredDeprALIQ_PIS: TFloatField;
    cdsCredDeprVL_PIS: TFloatField;
    cdsCredDeprCST_COFINS: TStringField;
    cdsCredDeprVL_BC_COFINS: TFloatField;
    cdsCredDeprALIQ_COFINS: TFloatField;
    cdsCredDeprVL_COFINS: TFloatField;
    cdsCredDeprCOD_CTA: TStringField;
    cdsCredDeprCOD_CCUS: TStringField;
    cdsCredDeprDESC_BEM_IMOB: TMemoField;
    cdsCredDeprPROCESSOS_REF: TMemoField;
    cdsCredDeprATIVO: TIntegerField;
    qrAqBem: TIBQuery;
    dspAqBem: TDataSetProvider;
    cdsAqBem: TClientDataSet;
    dsAqBem: TDataSource;
    cdsAqBemCOD_AQUISICAO: TIntegerField;
    cdsAqBemCOD_EMPRESA: TIntegerField;
    cdsAqBemNAT_BC_CRED: TStringField;
    cdsAqBemIDENT_BEM_IMOB: TStringField;
    cdsAqBemIND_ORIG_CRED: TSmallintField;
    cdsAqBemIND_UTIL_BEM_IMOB: TSmallintField;
    cdsAqBemMES_OPER_AQUIS: TDateTimeField;
    cdsAqBemVL_OPER_AQUIS: TFloatField;
    cdsAqBemPARC_OPER_NAO_BC_CRED: TFloatField;
    cdsAqBemVL_BC_CRED: TFloatField;
    cdsAqBemIND_NR_PARC: TSmallintField;
    cdsAqBemQTDE_PARCELAS: TSmallintField;
    cdsAqBemDATA_INICIAL: TDateTimeField;
    cdsAqBemDATA_FINAL: TDateTimeField;
    cdsAqBemDATA_LANC: TDateTimeField;
    cdsAqBemCST_PIS: TStringField;
    cdsAqBemVL_BC_PIS: TFloatField;
    cdsAqBemALIQ_PIS: TFloatField;
    cdsAqBemVL_PIS: TFloatField;
    cdsAqBemCST_COFINS: TStringField;
    cdsAqBemVL_BC_COFINS: TFloatField;
    cdsAqBemALIQ_COFINS: TFloatField;
    cdsAqBemVL_COFINS: TFloatField;
    cdsAqBemCOD_CTA: TStringField;
    cdsAqBemCOD_CCUS: TStringField;
    cdsAqBemDESC_BEM_IMOB: TMemoField;
    cdsAqBemPROCESSOS_REF: TMemoField;
    cdsAqBemATIVO: TIntegerField;
    qrEstAb: TIBQuery;
    dspEstAb: TDataSetProvider;
    dsEstAb: TDataSource;
    cdsEstAb: TClientDataSet;
    cdsEstAbNAT_BC_CRED: TStringField;
    cdsEstAbDATA_INICIAL: TDateTimeField;
    cdsEstAbDATA_FINAL: TDateTimeField;
    cdsEstAbDATA_LANC: TDateTimeField;
    cdsEstAbCST_PIS: TStringField;
    cdsEstAbALIQ_PIS: TFloatField;
    cdsEstAbVL_PIS: TFloatField;
    cdsEstAbCST_COFINS: TStringField;
    cdsEstAbALIQ_COFINS: TFloatField;
    cdsEstAbVL_COFINS: TFloatField;
    cdsEstAbCOD_CTA: TStringField;
    cdsEstAbCOD_EMPRESA: TIntegerField;
    cdsEstAbATIVO: TIntegerField;
    cdsEstAbCOD_ESTOQUE: TIntegerField;
    cdsEstAbVL_TOT_EST: TFloatField;
    cdsEstAbEST_IMP: TFloatField;
    cdsEstAbVL_BC_EST: TFloatField;
    cdsEstAbVL_BC_MEN_EST: TFloatField;
    cdsEstAbDESC_EST: TStringField;
    qrLancF: TIBQuery;
    dspLancF: TDataSetProvider;
    dsLancF: TDataSource;
    cdsLancF: TClientDataSet;
    cdsLancFCOD_OBS: TIntegerField;
    cdsLancFCOD_EMPRESA: TIntegerField;
    cdsLancFTXT: TStringField;
    cdsLancFCOD_PADRAO_AJUSTE: TStringField;
    qrICMInterAJ: TIBQuery;
    dspICMInterAJ: TDataSetProvider;
    dsICMInterAJ: TDataSource;
    cdsICMInterAJ: TClientDataSet;
    cdsICMInterAJSEQID: TIntegerField;
    cdsICMInterAJCOD_EMPRESA: TIntegerField;
    cdsICMInterAJCOD_AJ_APUR: TStringField;
    cdsICMInterAJDESCR_COMPL_AJ: TStringField;
    cdsICMInterAJVL_AJ_APUR: TFloatField;
    qrICMInterAJ_Inf: TIBQuery;
    dspICMInterAJ_Inf: TDataSetProvider;
    dsICMInterAJ_Inf: TDataSource;
    cdsICMInterAJ_Inf: TClientDataSet;
    cdsICMInterAJ_InfSEQID: TIntegerField;
    cdsICMInterAJ_InfCOD_EMPRESA: TIntegerField;
    cdsICMInterAJ_InfSEQID_AJ: TIntegerField;
    cdsICMInterAJ_InfNUM_DA: TStringField;
    cdsICMInterAJ_InfNUM_PROC: TStringField;
    cdsICMInterAJ_InfIND_PROC: TSmallintField;
    cdsICMInterAJ_InfPROC: TMemoField;
    cdsICMInterAJ_InfTXT_COMPL: TMemoField;
    dsICMInterAJ_DocV: TDataSource;
    cdsICMInterAJ_DocV: TClientDataSet;
    cdsICMInterAJ_DocVCOD_NF: TIntegerField;
    cdsICMInterAJ_DocVNITEM_NF: TIntegerField;
    cdsICMInterAJ_DocVVL_AJ_ITEM: TFloatField;
    cdsICMInterAJ_DocVCOD_CLIENTE: TIntegerField;
    cdsICMInterAJ_DocVMODELO_NF: TStringField;
    cdsICMInterAJ_DocVSERIE: TStringField;
    cdsICMInterAJ_DocVSUBSERIE: TStringField;
    cdsICMInterAJ_DocVNUM_NF: TIntegerField;
    cdsICMInterAJ_DocVCHAVE_NFE: TStringField;
    cdsICMInterAJ_DocVDATA_LANC: TDateTimeField;
    cdsICMInterAJ_DocVTIPO_ITEM: TStringField;
    cdsICMInterAJ_DocVNUM_FAB_PROD: TStringField;
    cdsICMInterAJ_DocVNOME_CLIENTE: TStringField;
    cdsICMInterAJ_DocVRAZAO: TStringField;
    qrICMInterAJ_Doc: TIBQuery;
    dspICMInterAJ_Doc: TDataSetProvider;
    dsICMInterAJ_Doc: TDataSource;
    cdsICMInterAJ_Doc: TClientDataSet;
    cdsICMInterAJ_DocSEQID: TIntegerField;
    cdsICMInterAJ_DocCOD_EMPRESA: TIntegerField;
    cdsICMInterAJ_DocSEQID_AJ: TIntegerField;
    cdsICMInterAJ_DocCOD_NF: TIntegerField;
    cdsICMInterAJ_DocNITEM_NF: TIntegerField;
    cdsICMInterAJ_DocVL_AJ_ITEM: TFloatField;
    cdsICMInterAJ_DocVDESCRICAO_ITEM: TStringField;
    cdsICMInterAJUF: TStringField;
    cdsICMInterAJDATA_LANC: TDateTimeField;
    cdsICMInterAJDATA_CAD: TDateTimeField;
    cdsICMInterAJ_DocVSEQID: TIntegerField;
    qrICMInterOb: TIBQuery;
    dspICMInterOb: TDataSetProvider;
    dsICMInterOb: TDataSource;
    cdsICMInterOb: TClientDataSet;
    cdsICMInterObSEQID: TIntegerField;
    cdsICMInterObCOD_EMPRESA: TIntegerField;
    cdsICMInterObCOD_OR: TStringField;
    cdsICMInterObVL_OR: TFloatField;
    cdsICMInterObDT_VCTO: TDateTimeField;
    cdsICMInterObCOD_REC: TStringField;
    cdsICMInterObNUM_PROC: TStringField;
    cdsICMInterObIND_PROC: TSmallintField;
    cdsICMInterObPROC: TMemoField;
    cdsICMInterObTXT_COMPL: TMemoField;
    cdsICMInterObANO_REF: TSmallintField;
    cdsICMInterObMES_REF: TSmallintField;
    cdsICMInterObDATA_LANC: TDateTimeField;
    cdsICMInterObDATA_CAD: TDateTimeField;
    cdsICMInterObUF: TStringField;
    cdsICMInterObCOD_NF: TIntegerField;
    cdsICMInterObTPOB: TStringField;
    qrManutInv: TIBQuery;
    dspManutInv: TDataSetProvider;
    dsManutInv: TDataSource;
    cdsManutInv: TClientDataSet;
    cdsManutInvDATA_INV: TDateTimeField;
    cdsManutInvCOD_EMPRESA: TIntegerField;
    cdsManutInvGRUPO_PROD: TIntegerField;
    cdsManutInvCOD_PROD: TStringField;
    cdsManutInvNUM_FAB_PROD: TStringField;
    cdsManutInvDESCR_PROD: TStringField;
    cdsManutInvQUANTIDADE: TFloatField;
    cdsManutInvVALOR_PROD: TFloatField;
    cdsManutInvTP_ARQ_FISCAL: TStringField;
    cdsManutInvH020_CST: TStringField;
    cdsManutInvH020_BC_ICMS: TFloatField;
    cdsManutInvH020_VL_ICMS: TFloatField;
    cdsManutInvCUSTO_TOTAL: TFloatField;
    cdsManutInvSEL: TStringField;
    cdsManutInvNCM: TStringField;
    cdsInfComplATIVO_EM_NFE: TStringField;
    cdsInfComplATIVO_EM_NFCE: TStringField;
    procedure cdsOutRecCredPROCESSOS_REFGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsInfComplBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmSPED: TdtmSPED;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TdtmSPED.cdsInfComplBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), dtmSPED);
end;

procedure TdtmSPED.cdsOutRecCredPROCESSOS_REFGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:= 'Clique aqui para ver o conteúdo';//StringReplace(TField(Sender).AsString,''#$D#$A'',' | ',[rfReplaceAll, rfIgnoreCase]);
end;

procedure TdtmSPED.DataModuleCreate(Sender: TObject);
var
  J, I: Integer;
begin
  for J := 0 to Self.ComponentCount - 1 do
    if (Self.Components[J] is TClientDataSet) and (TClientDataSet(Self.Components[J]).Tag = 1) then
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
