unit UDtmArqsDig;

interface

uses
  SysUtils, Classes, DB, IBDatabase, DBClient, Provider,UDadosIni,
  IBCustomDataSet, IBQuery;

type
  TDtmArqsDig = class(TDataModule)
    CdsAdigProdutos: TClientDataSet;
    DspAdigProdutos: TDataSetProvider;
    IbAdigProdutos: TIBQuery;
    IbTransArqDigs: TIBTransaction;
    QrBuscas: TIBQuery;
    IbAdigEmpresa: TIBQuery;
    DspAdigEmpresa: TDataSetProvider;
    CdsAdigEmpresa: TClientDataSet;
    CdsAdigEmpresaCOD_EMPRESA: TIntegerField;
    CdsAdigEmpresaNOME_EMP: TStringField;
    CdsAdigEmpresaENDERECO_EMP: TStringField;
    CdsAdigEmpresaBAIRRO_EMP: TStringField;
    CdsAdigEmpresaCIDADE_EMP: TStringField;
    CdsAdigEmpresaCEP_EMP: TStringField;
    CdsAdigEmpresaUF_EMP: TIntegerField;
    CdsAdigEmpresaCNPJ_EMP: TStringField;
    CdsAdigEmpresaIE_EMP: TStringField;
    CdsAdigEmpresaIM_EMP: TStringField;
    CdsAdigEmpresaOBSERV_EMP: TStringField;
    CdsAdigEmpresaTELEFONE_EMP: TStringField;
    CdsAdigEmpresaPROP_EMP: TStringField;
    CdsAdigEmpresaCAIXA_INTEGRADO: TStringField;
    CdsAdigEmpresaFILIAL: TStringField;
    CdsAdigEmpresaG_CI: TIntegerField;
    CdsAdigEmpresaG_CDV: TIntegerField;
    CdsAdigEmpresaG_CDF: TIntegerField;
    CdsAdigEmpresaG_CRO: TIntegerField;
    CdsAdigEmpresaG_CSE: TIntegerField;
    CdsAdigEmpresaEM_NF: TStringField;
    CdsAdigEmpresaMOD_FAT: TStringField;
    CdsAdigEmpresaQT_SERV_NF: TIntegerField;
    CdsAdigEmpresaQT_PROD_NF: TIntegerField;
    CdsAdigEmpresaDEB_CRED: TStringField;
    CdsAdigEmpresaCONEXAO: TStringField;
    CdsAdigEmpresaN_PED: TStringField;
    CdsAdigEmpresaCONCESS: TStringField;
    CdsAdigEmpresaOBS_PAD_OS: TMemoField;
    CdsAdigEmpresaVND_AB_CUSTO: TStringField;
    CdsAdigEmpresaTX_JUROS: TFloatField;
    CdsAdigEmpresaMULTAS: TFloatField;
    CdsAdigEmpresaQTDE_ITENS_NF: TIntegerField;
    CdsAdigEmpresaNOTA_FISCAL: TIntegerField;
    CdsAdigEmpresaPORTA_IMPRESSAO: TStringField;
    CdsAdigEmpresaCALCULADORA: TStringField;
    CdsAdigEmpresaTAMANHOLETRA: TStringField;
    CdsAdigEmpresaQTDE_LINHASNF: TIntegerField;
    CdsAdigEmpresaISS_EMP: TFloatField;
    CdsAdigEmpresaQTMESSUG: TIntegerField;
    CdsAdigEmpresaCABREQ: TStringField;
    CdsAdigEmpresaCABOS: TStringField;
    CdsAdigEmpresaDADVAP: TStringField;
    CdsAdigEmpresaPASTA_FRENTE: TStringField;
    CdsAdigEmpresaNUMERO_END: TIntegerField;
    CdsAdigEmpresaALIQPADRAO: TFloatField;
    CdsAdigEmpresaTP_SUG: TIntegerField;
    CdsAdigEmpresaTE_SUG: TIntegerField;
    CdsAdigEmpresaTA_SUG: TIntegerField;
    CdsAdigEmpresaFP_SUG: TIntegerField;
    CdsAdigEmpresaMES_RET_SERV1: TIntegerField;
    CdsAdigEmpresaKM_RET_SERV1: TIntegerField;
    CdsAdigEmpresaMES_RET_SERV3: TIntegerField;
    CdsAdigEmpresaKM_RET_SERV3: TIntegerField;
    CdsAdigEmpresaINTERV_KM_SERV: TIntegerField;
    CdsAdigEmpresaEMAIL_EMP: TStringField;
    CdsAdigEmpresaSMTP_EMP: TStringField;
    CdsAdigEmpresaLOGIN_EMP: TStringField;
    CdsAdigEmpresaCOD_SERV_PADRAO: TIntegerField;
    CdsAdigEmpresaCPPADPROD: TStringField;
    CdsAdigEmpresaCPPADCL: TStringField;
    CdsAdigEmpresaCPPADVEI: TStringField;
    CdsAdigEmpresaLOCAL_PAG: TStringField;
    CdsAdigEmpresaTOTDESC_EMP: TFloatField;
    CdsAdigEmpresaUTIL_AUD: TStringField;
    CdsAdigEmpresaUTIL_PESQE: TStringField;
    CdsAdigEmpresaARREDOND: TStringField;
    CdsAdigEmpresaTOTDESC_EMPA: TFloatField;
    CdsAdigEmpresaMIN_MARGEM_V: TFloatField;
    CdsAdigEmpresaMIN_MARGEM_A: TFloatField;
    CdsAdigEmpresaALT_PERC_MARGEM: TStringField;
    CdsAdigEmpresaAPRES_ESTR: TStringField;
    CdsAdigEmpresaDIAS_DEMO_EMP: TIntegerField;
    CdsAdigEmpresaDIAS_RES_EMP: TIntegerField;
    CdsAdigEmpresaOBS_BOL: TStringField;
    CdsAdigEmpresaOBS_DECL_OS: TMemoField;
    CdsAdigEmpresaDECL_OBS_OS: TStringField;
    CdsAdigEmpresaG_CI_VEIC: TIntegerField;
    CdsAdigEmpresaG_CDV_VEIC: TIntegerField;
    CdsAdigEmpresaG_CDF_VEIC: TIntegerField;
    CdsAdigEmpresaG_CRO_VEIC: TIntegerField;
    CdsAdigEmpresaG_CSE_VEIC: TIntegerField;
    CdsAdigEmpresaG_CI_SERV: TIntegerField;
    CdsAdigEmpresaG_CDV_SERV: TIntegerField;
    CdsAdigEmpresaG_CDF_SERV: TIntegerField;
    CdsAdigEmpresaG_CRO_SERV: TIntegerField;
    CdsAdigEmpresaG_CSE_SERV: TIntegerField;
    CdsAdigEmpresaG_IR_ADM: TIntegerField;
    CdsAdigEmpresaG_CTRS_ADM: TIntegerField;
    CdsAdigEmpresaG_REM_ADM: TIntegerField;
    CdsAdigEmpresaG_REIV_ADM: TIntegerField;
    CdsAdigEmpresaG_DF_ADM: TIntegerField;
    CdsAdigEmpresaG_DV_ADM: TIntegerField;
    CdsAdigEmpresaCOFINS_EMP: TFloatField;
    CdsAdigEmpresaPIS_EMP: TFloatField;
    CdsAdigEmpresaCOMISS_PROD_EMP: TFloatField;
    CdsAdigEmpresaENC_SOBR_COM: TFloatField;
    CdsAdigEmpresaCUSTO_EST_EMP: TFloatField;
    CdsAdigEmpresaOUT_ENC_EMP: TFloatField;
    CdsAdigEmpresaDESP_FIXAS: TFloatField;
    CdsAdigEmpresaJR_CMP_EMP: TFloatField;
    CdsAdigEmpresaIMP_RENDA: TFloatField;
    CdsAdigEmpresaCONTR_S_EMP: TFloatField;
    CdsAdigEmpresaSIMPLES_EMP: TFloatField;
    CdsAdigEmpresaMIN_M_LQ_A: TFloatField;
    CdsAdigEmpresaMIN_M_LQ_V: TFloatField;
    CdsAdigEmpresaUS_MINM_PROD: TStringField;
    CdsAdigEmpresaCPMF_EMP: TFloatField;
    CdsAdigEmpresaN_CONC_ASS: TIntegerField;
    CdsAdigEmpresaCASAS_DECIMAIS: TIntegerField;
    CdsAdigEmpresaSEG_PROD_SERV: TStringField;
    CdsAdigEmpresaDIAS_PREC_TAB: TIntegerField;
    CdsAdigEmpresaPRAZO_MED_VND: TIntegerField;
    CdsAdigEmpresaCUSTO_BOLETA: TFloatField;
    CdsAdigEmpresaTX_CARTAO: TFloatField;
    CdsAdigEmpresaPERC_VND_CARTAO: TFloatField;
    CdsAdigEmpresaTX_CARTAO_PARC: TFloatField;
    CdsAdigEmpresaDIAS_REC_FIN: TIntegerField;
    CdsAdigEmpresaADIC_FIN: TFloatField;
    CdsAdigEmpresaVND_MIN_FIN: TFloatField;
    CdsAdigEmpresaVERSAO: TIntegerField;
    CdsAdigEmpresaARREDONDA_PRECO: TStringField;
    CdsAdigEmpresaMENSAGEM_EMP: TStringField;
    CdsAdigEmpresaMAXDESCPARC: TFloatField;
    CdsAdigEmpresaUS_ROMANEIO: TStringField;
    CdsAdigEmpresaALMOX: TStringField;
    CdsAdigEmpresaATIVO: TIntegerField;
    CdsAdigEmpresaUS_DECL_REQ: TStringField;
    CdsAdigEmpresaAT_PRECREP: TStringField;
    CdsAdigEmpresaUSPREVENDA: TStringField;
    CdsAdigEmpresaUSPREVENDA_OS: TStringField;
    CdsAdigEmpresaAUT_SERV_CUPOM: TStringField;
    CdsAdigEmpresaSUB_SERIE: TIntegerField;
    CdsAdigEmpresaSEQ_ARQ_REMESSA: TIntegerField;
    CdsAdigEmpresaRECIBO_HTML_BOLETO: TBlobField;
    CdsAdigEmpresaPROXIMO_NOSSO_NUMERO: TStringField;
    IbDavsEmt: TIBQuery;
    DspDavsEmitidos: TDataSetProvider;
    CdsDavsEmt: TClientDataSet;
    IbTerminalF: TIBQuery;
    DspTerminalF: TDataSetProvider;
    CdsTerminalF: TClientDataSet;
    CdsTerminalFCOD_TERMINAL: TIntegerField;
    CdsTerminalFCOD_EMPRESA: TIntegerField;
    CdsTerminalFNOME_TERMINAL: TStringField;
    CdsTerminalFEND_TERMINAL: TStringField;
    IbanexoVI: TIBQuery;
    DspAnexoVI: TDataSetProvider;
    CdsAnexoVI: TClientDataSet;
    DtTerminalF: TDataSource;
    CdsAdigProdutosTIPO: TStringField;
    CdsAdigProdutosCOD_PROD: TStringField;
    CdsAdigProdutosDESCR_PROD: TStringField;
    CdsAdigProdutosUNIDADE: TStringField;
    CdsAdigProdutosTIPO_FAB: TStringField;
    CdsAdigProdutosICM_PROD: TFloatField;
    CdsAdigProdutosISENTO_PROD: TStringField;
    CdsAdigProdutosN_INCIDENCIA_PROD: TStringField;
    CdsAdigProdutosPREC_TAB_PROD: TFloatField;
    CdsAdigProdutosEST_F: TFloatField;
    dsProdAdig: TDataSource;
    CdsAdigProdutosGRUPO_PROD: TIntegerField;
    CdsAdigProdutosGTIN: TStringField;
    qrBuscas2: TIBQuery;
    CdsAdigEmpresaCGC_EMP: TStringField;
    CdsAdigEmpresaENDRECO_EMP: TStringField;
    qrInventario: TIBQuery;
    qrBuscaInvet: TIBQuery;
    procedure CdsAdigProdutosCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure CdsAdigProdutosBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure mudaSelect(DataSet: TClientDataSet);
  public
    { Public declarations }
   function criaDtm: boolean;
  end;

var
  DtmArqsDig: TDtmArqsDig;

implementation

uses
 Dialogs, uDtmAtivo;

{$R *.dfm}

{ TDtmArqsDig }

procedure TDtmArqsDig.CdsAdigProdutosBeforeOpen(DataSet: TDataSet);
begin
 mudaSelect(TClientDataSet(DataSet));
end;

procedure TDtmArqsDig.CdsAdigProdutosCalcFields(DataSet: TDataSet);
begin
  CdsAdigProdutosGTIN.AsString :=
    vDadosIni.StrZero(CdsAdigProdutosGRUPO_PROD.AsString+
      Trim(CdsAdigProdutosCOD_PROD.AsString),14);
end;

function TDtmArqsDig.criaDtm: boolean;
begin
  vdadosini.LerConfigini;
  try
    if vDadosIni.vSistema <> 'Fiscal' then
      vDadosIni.conectaBanco(dtmAtivo.bancoHw,vDadosIni.GetBaseDados('Banco', 'HW'),true);
    Result := true;
  except
    MessageDlg('A base de dados Hw.fdb não se encontra no caminho especificado:'
      + #13 + vDadosIni.GetBaseDados('Banco', 'HW'), mtInformation, [mbOK], 0);
    //DbArqsDig.Connected := False;
    Result := false;
  end;
end;

procedure TDtmArqsDig.DataModuleDestroy(Sender: TObject);
begin
  DtmArqsDig:=nil;
end;

procedure TDtmArqsDig.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to DtmArqsDig.ComponentCount - 1 do
    begin
      if (DtmArqsDig.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(DtmArqsDig.Components[i]).Name) = UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(DtmArqsDig.Components[i]).DataSet).SQL.Text := DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

end.
