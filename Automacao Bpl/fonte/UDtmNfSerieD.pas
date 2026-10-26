unit UDtmNfSerieD;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBStoredProc, IBCustomDataSet,
  IBQuery, IBDatabase;

type
  TdtmNfSerieD = class(TDataModule)
    IBTransNfSerieD: TIBTransaction;
    qrBuscas: TIBQuery;
    SpIncCodigo: TIBStoredProc;
    qrNFSD: TIBQuery;
    dspNFSD: TDataSetProvider;
    cdsNFSD: TClientDataSet;
    dsNFSD: TDataSource;
    qrItNFSD: TIBQuery;
    dspItNFSD: TDataSetProvider;
    cdsItNFSD: TClientDataSet;
    dsItNFSD: TDataSource;
    cdsNFSDNUMERONOTA: TIntegerField;
    cdsNFSDCOD_CLIENTE: TIntegerField;
    cdsNFSDDATAEMISSAO: TDateTimeField;
    cdsNFSDCOD_VENDEDOR: TIntegerField;
    cdsNFSDSERIE: TStringField;
    cdsNFSDSUBSERIE: TStringField;
    cdsNFSDVALOR_GERAL: TFloatField;
    cdsNFSDB_CALC_ICMS: TFloatField;
    cdsNFSDVALOR_ICMS: TFloatField;
    cdsNFSDISENTA_N_TRIB: TFloatField;
    cdsNFSDOUTRAS: TFloatField;
    cdsNFSDALIQUOTA: TFloatField;
    cdsNFSDCOD_EMPRESA: TIntegerField;
    cdsNFSDATIVO: TIntegerField;
    cdsNFSDMODELO: TStringField;
    cdsNFSDDATAENTRADA: TDateTimeField;
    cdsItNFSDNUMERONOTA: TIntegerField;
    cdsItNFSDGRUPO_PROD: TIntegerField;
    cdsItNFSDCOD_PROD: TStringField;
    cdsItNFSDCOD_EMPRESA: TIntegerField;
    cdsItNFSDNUM_FAB_PROD: TStringField;
    cdsItNFSDQUANTID_ITEM: TFloatField;
    cdsItNFSDVL_UN_ITEM: TFloatField;
    cdsItNFSDVL_TOT_ITEM: TFloatField;
    cdsItNFSDALIQUOTA: TFloatField;
    cdsItNFSDATIVO: TIntegerField;
    cdsItNFSDDESC_PROD: TStringField;
    cdsItNFSDISENTO: TStringField;
    qrClientes: TIBQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientesCOD_CLIENTE: TIntegerField;
    cdsClientesNOME_CLIENTE: TStringField;
    cdsClientesLIMITE_CREDITO: TFloatField;
    cdsClientesENDERECO: TStringField;
    cdsClientesCODIGO_FATURAMENTO: TIntegerField;
    cdsClientesTIPVCLIENTE: TStringField;
    cdsClientesCAMP_PR_VENDA: TStringField;
    cdsClientesCPFCGC: TStringField;
    cdsClientesRAZAO: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesCIDADE: TStringField;
    cdsClientesCODIGO_UF: TIntegerField;
    cdsClientesCEP: TStringField;
    cdsClientesINSC_EST: TStringField;
    cdsClientesFONE_CLIENTE: TStringField;
    cdsClientesDATA_ULT_COMPRA: TDateTimeField;
    cdsClientesTIPOCLIENTE: TStringField;
    cdsClientesCOD_EMPRESA: TIntegerField;
    dsClientes: TDataSource;
    qrColaborador: TIBQuery;
    dspColaborador: TDataSetProvider;
    cdsColaborador: TClientDataSet;
    cdsColaboradorCOD_VENDEDOR: TIntegerField;
    cdsColaboradorCOD_EMPRESA: TIntegerField;
    cdsColaboradorCODIGO_UF: TIntegerField;
    cdsColaboradorCOD_FUNCAO: TIntegerField;
    cdsColaboradorNOME_VENDEDOR: TStringField;
    cdsColaboradorEND_VENDEDOR: TStringField;
    cdsColaboradorBAIRRO_VENDEDOR: TStringField;
    cdsColaboradorCIDADE_VENDEDOR: TStringField;
    cdsColaboradorCEP_VENDEDOR: TStringField;
    cdsColaboradorFONE_VENDEDOR: TStringField;
    cdsColaboradorCPF_VENDEDOR: TStringField;
    cdsColaboradorPC_VEND_SERV: TFloatField;
    cdsColaboradorPC_VEND_PROD: TFloatField;
    cdsColaboradorOBS_VENDEDOR: TMemoField;
    cdsColaboradorDATA_MOD_COL: TDateTimeField;
    cdsColaboradorDATA_CAD_COL: TDateTimeField;
    cdsColaboradorDAT_NASC_COL: TDateTimeField;
    cdsColaboradorNOME_ULT_EMP: TStringField;
    cdsColaboradorENDERECO_ULT_EMP: TStringField;
    cdsColaboradorFONE_ULT_EMP: TStringField;
    cdsColaboradorCONT_ULT_EMP: TStringField;
    cdsColaboradorULT_SAL_EMP: TFloatField;
    cdsColaboradorDTENT_ULT_EMP: TDateTimeField;
    cdsColaboradorDTSAI_ULT_EMP: TDateTimeField;
    cdsColaboradorNOME_PLT_EMP: TStringField;
    cdsColaboradorENDERECO_PLT_EMP: TStringField;
    cdsColaboradorFONE_PLT_EMP: TStringField;
    cdsColaboradorCONT_PLT_EMP: TStringField;
    cdsColaboradorPLT_SAL_EMP: TFloatField;
    cdsColaboradorDTENT_PLT_EMP: TDateTimeField;
    cdsColaboradorDTSAI_PLT_EMP: TDateTimeField;
    cdsColaboradorDT_ULT_FERIAS: TDateTimeField;
    cdsColaboradorTMP_ULT_FERIAS: TIntegerField;
    cdsColaboradorVL_ULT_FERIAS: TFloatField;
    cdsColaboradorDTVND_ULT_FERIAS: TDateTimeField;
    cdsColaboradorDT_13_SAL: TDateTimeField;
    cdsColaboradorVL_13_SAL: TFloatField;
    cdsColaboradorVL_SAL: TFloatField;
    cdsColaboradorCOD_CIDADE: TSmallintField;
    cdsColaboradorCOD_BAIRRO: TSmallintField;
    cdsColaboradorSALARIO_REGISTRO: TFloatField;
    cdsColaboradorVALOR_SALARIO: TFloatField;
    cdsColaboradorQUANT_SAL_FAMILIA: TFloatField;
    cdsColaboradorVALOR_SALARIO_FAMILIA: TFloatField;
    cdsColaboradorPERC_PESO: TFloatField;
    cdsColaboradorATIVO: TIntegerField;
    cdsColaboradorEMAIL: TStringField;
    cdsColaboradorSITE: TStringField;
    cdsColaboradorFONE_CONTATO: TStringField;
    cdsColaboradorDESC_FUNCAO: TStringField;
    cdsColaboradorTPDOCS_VND: TMemoField;
    dsColaborador: TDataSource;
    dspEmpresa: TDataSetProvider;
    qrEmpresa: TIBQuery;
    cdsEmpresa: TClientDataSet;
    cdsEmpresaEM_NF: TStringField;
    cdsEmpresaUSPREVENDA: TStringField;
    cdsEmpresaUSPREVENDA_OS: TStringField;
    cdsEmpresaSEG_PROD_SERV: TStringField;
    cdsEmpresaMENSAGEM_EMP: TStringField;
    cdsEmpresaOBS_DECL_OS: TMemoField;
    cdsEmpresaCONCESS: TStringField;
    cdsEmpresaCASAS_DECIMAIS: TIntegerField;
    cdsEmpresaCFOP_PAD_PROD: TFloatField;
    cdsEmpresaARREDOND: TStringField;
    cdsEmpresaMIN_MARGEM_V: TFloatField;
    cdsEmpresaMIN_MARGEM_A: TFloatField;
    cdsEmpresaAPRES_ESTR: TStringField;
    cdsEmpresaUS_MINM_PROD: TStringField;
    cdsEmpresaTELEFONE_EMP: TStringField;
    cdsEmpresaNOME_EMP: TStringField;
    cdsEmpresaMOD_FAT: TStringField;
    cdsEmpresaUS_DECL_REQ: TStringField;
    cdsEmpresaAUT_SERV_CUPOM: TStringField;
    cdsEmpresaCGC_EMP: TStringField;
    cdsEmpresaOBS_PAD_OS: TMemoField;
    cdsEmpresaDADVAP: TStringField;
    cdsEmpresaALMOX: TStringField;
    dspBarra: TDataSetProvider;
    qrBarra: TIBQuery;
    cdsBarra: TClientDataSet;
    cdsBarraCOD_BARRA: TStringField;
    cdsBarraGRUPO_PROD: TIntegerField;
    cdsBarraCOD_PROD: TStringField;
    dspProd: TDataSetProvider;
    qrProd: TIBQuery;
    cdsProd: TClientDataSet;
    cdsProdPERC_TB_ATAC: TFloatField;
    cdsProdPERC_TB_VARE: TFloatField;
    cdsProdPREC_CUS_PROD: TFloatField;
    cdsProdPREC_TAB_PROD: TFloatField;
    cdsProdPREC_30_PROD: TFloatField;
    cdsProdPREC_60_PROD: TFloatField;
    cdsProdPREC_90_PROD: TFloatField;
    cdsProdPERMITIR_DESCONTO: TStringField;
    cdsProdEM_PROMOCAO: TStringField;
    cdsProdPRECO_PROMOCAO: TFloatField;
    cdsProdGRUPO_PROD: TIntegerField;
    cdsProdCOD_PROD: TStringField;
    cdsProdCODIGO_NOP: TFloatField;
    cdsProdDESCR_PROD: TStringField;
    cdsProdICM_PROD: TFloatField;
    cdsProdNUM_FAB_PROD: TStringField;
    cdsProdPREC_PUBLICO: TFloatField;
    cdsProdPREC_CUSR_PROD: TFloatField;
    cdsProdPREC_CUS_MNF: TFloatField;
    cdsProdPREC_CUSM_PROD: TFloatField;
    cdsProdPREC_CUSMR_PROD: TFloatField;
    cdsProdICMANT_SUB: TFloatField;
    cdsProdPREC_CUSR_MNF: TFloatField;
    cdsProdEST_F: TFloatField;
    cdsProdDESCR_PROD_RED: TStringField;
    cdsProdCSDECQTDE: TStringField;
    cdsProdCSDECVLUNT: TStringField;
    cdsProdCONSUMO: TStringField;
    cdsProdPESO_BRUT_PROD: TFloatField;
    cdsNFSDSTATUS: TStringField;
    cdsProdISENTO_PROD: TStringField;
    cdsItNFSDNITEM: TIntegerField;
    IBTransaction1: TIBTransaction;
    cdsItNFSDMARCA: TStringField;
    cdsItNFSDMODELO: TStringField;
    cdsItNFSDTIPO: TStringField;
    cdsItNFSDESPECIE: TStringField;
    cdsItNFSDQUALIDADE: TStringField;
    cdsItNFSDBASE_ICM: TFloatField;
    cdsItNFSDVALOR_ICM: TFloatField;
    cdsProdPERC_RED_PROD: TFloatField;
    qrBuscasPAF: TIBQuery;
    cdsItNFSDPREC_CUSM_PROD: TFloatField;
    SpIncCodigo2: TIBStoredProc;
    cdsNFSDNPED: TIntegerField;
    cdsNFSDTIPO_PED: TStringField;
    cdsItNFSDNPED: TIntegerField;
    cdsItNFSDTIPO_PED: TStringField;
    cdsItNFSDNITEM_PED: TIntegerField;
    cdsProdESTOQUE_DISPONIVEL: TFloatField;
    cdsProdESTOQUE_PRODUZIR: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsNFSDBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure mudarDataBases;
  end;

var
  dtmNfSerieD: TdtmNfSerieD;

implementation

uses UDtmAtivo;

{$R *.dfm}

procedure TdtmNfSerieD.cdsNFSDBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),Self);
end;

procedure TdtmNfSerieD.DataModuleCreate(Sender: TObject);
var
  J, I: Integer;
begin
  if vDadosIni.vSistema = 'Fiscal' then
  begin
    IBTransNfSerieD.DefaultDatabase := dtmAtivo.bancoFiscal;
    qrNFSD.Database := dtmAtivo.bancoFiscal;
    qrItNFSD.Database := dtmAtivo.bancoFiscal;
    qrBuscasPAF.Database := dtmAtivo.bancoFiscal;
  end;
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

procedure TdtmNfSerieD.mudarDataBases;
var
  I: Integer;
begin
  if vDadosIni.vSistema = 'Fiscal' then
    if vDadosIni.bancoConectado = 'local' then
    begin
      for I := 0 to dtmNfSerieD.ComponentCount - 1 do
        if dtmNfSerieD.Components[i].Tag = 99 then
        begin
          if (dtmNfSerieD.Components[i] is TIBTransaction) then
            TIBTransaction(dtmNfSerieD.Components[i]).DefaultDatabase := dtmAtivo.bancoHwF
          else if (dtmNfSerieD.Components[i] is TIBQuery) then
            TIBQuery(dtmNfSerieD.Components[i]).Database := dtmAtivo.bancoHwF
          else if (dtmNfSerieD.Components[i] is TIBStoredProc) then
            TIBStoredProc(dtmNfSerieD.Components[i]).Database := dtmAtivo.bancoHwF;
        end
        else if dtmNfSerieD.Components[i].Tag = 100 then
        begin
          if (dtmNfSerieD.Components[i] is TIBTransaction) then
            TIBTransaction(dtmNfSerieD.Components[i]).DefaultDatabase := dtmAtivo.bancoFiscal
          else if (dtmNfSerieD.Components[i] is TIBQuery) then
            TIBQuery(dtmNfSerieD.Components[i]).Database := dtmAtivo.bancoFiscal
          else if (dtmNfSerieD.Components[i] is TIBStoredProc) then
            TIBStoredProc(dtmNfSerieD.Components[i]).Database := dtmAtivo.bancoFiscal;
        end;
    end;
end;

end.
