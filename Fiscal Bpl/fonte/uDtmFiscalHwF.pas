unit uDtmFiscalHwF;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, Provider,
  DBClient, IBStoredProc;

type
  TDtmFiscalHwF = class(TDataModule)
    cdsColab: TClientDataSet;
    cdsColabCOD_VENDEDOR: TIntegerField;
    cdsColabCOD_EMPRESA: TIntegerField;
    cdsColabCODIGO_UF: TIntegerField;
    cdsColabCOD_FUNCAO: TIntegerField;
    cdsColabNOME_VENDEDOR: TStringField;
    cdsColabEND_VENDEDOR: TStringField;
    cdsColabBAIRRO_VENDEDOR: TStringField;
    cdsColabCIDADE_VENDEDOR: TStringField;
    cdsColabCEP_VENDEDOR: TStringField;
    cdsColabFONE_VENDEDOR: TStringField;
    cdsColabCPF_VENDEDOR: TStringField;
    cdsColabPC_VEND_SERV: TFloatField;
    cdsColabPC_VEND_PROD: TFloatField;
    cdsColabOBS_VENDEDOR: TMemoField;
    cdsColabDATA_MOD_COL: TDateTimeField;
    cdsColabDATA_CAD_COL: TDateTimeField;
    cdsColabDAT_NASC_COL: TDateTimeField;
    cdsColabNOME_ULT_EMP: TStringField;
    cdsColabENDERECO_ULT_EMP: TStringField;
    cdsColabFONE_ULT_EMP: TStringField;
    cdsColabCONT_ULT_EMP: TStringField;
    cdsColabULT_SAL_EMP: TFloatField;
    cdsColabDTENT_ULT_EMP: TDateTimeField;
    cdsColabDTSAI_ULT_EMP: TDateTimeField;
    cdsColabNOME_PLT_EMP: TStringField;
    cdsColabENDERECO_PLT_EMP: TStringField;
    cdsColabFONE_PLT_EMP: TStringField;
    cdsColabCONT_PLT_EMP: TStringField;
    cdsColabPLT_SAL_EMP: TFloatField;
    cdsColabDTENT_PLT_EMP: TDateTimeField;
    cdsColabDTSAI_PLT_EMP: TDateTimeField;
    cdsColabDT_ULT_FERIAS: TDateTimeField;
    cdsColabTMP_ULT_FERIAS: TIntegerField;
    cdsColabVL_ULT_FERIAS: TFloatField;
    cdsColabDTVND_ULT_FERIAS: TDateTimeField;
    cdsColabDT_13_SAL: TDateTimeField;
    cdsColabVL_13_SAL: TFloatField;
    cdsColabVL_SAL: TFloatField;
    cdsColabCOD_CIDADE: TSmallintField;
    cdsColabCOD_BAIRRO: TSmallintField;
    cdsColabSALARIO_REGISTRO: TFloatField;
    cdsColabVALOR_SALARIO: TFloatField;
    cdsColabQUANT_SAL_FAMILIA: TFloatField;
    cdsColabVALOR_SALARIO_FAMILIA: TFloatField;
    cdsColabPERC_PESO: TFloatField;
    cdsColabATIVO: TIntegerField;
    cdsColabEMAIL_COL: TStringField;
    cdsCodBarra: TClientDataSet;
    cdsCodBarraCOD_BARRA: TStringField;
    cdsCodBarraGRUPO_PROD: TIntegerField;
    cdsCodBarraCOD_PROD: TStringField;
    cdsCodBarraCOD_EMPRESA: TIntegerField;
    cdsCodBarraDAT_CAD_CDBAR: TDateTimeField;
    cdsCodBarraDAT_MOD_CDBAR: TDateTimeField;
    cdsCodBarraATIVO: TIntegerField;
    cdsServ: TClientDataSet;
    cdsServCOD_SERVICO: TIntegerField;
    cdsServDESC_SERVICO: TStringField;
    cdsServVALOR_SERVICO: TFloatField;
    cdsServSHONDA: TStringField;
    cdsServALTCOD: TStringField;
    cdsServDATA_CAD_TIPO: TDateTimeField;
    cdsServDATA_MOD_TIPO: TDateTimeField;
    cdsServSTIPO: TStringField;
    cdsServTMO: TFloatField;
    cdsServALIQ_ISS: TFloatField;
    cdsServATIVO: TIntegerField;
    cdsServCOD_ESPE_SEG: TIntegerField;
    cdsServCODIGO_NOP: TFloatField;
    cdsSenha: TClientDataSet;
    cdsSenhaCODIGO: TIntegerField;
    cdsSenhaUSUARIO: TStringField;
    cdsSenhaCOD_EMPRESA: TIntegerField;
    cdsSenhaSENHA: TStringField;
    cdsSenhaNOME_US: TStringField;
    cdsSenhaNIVEL_US: TIntegerField;
    cdsSenhaPROGS: TStringField;
    cdsSenhaSERIAL1: TStringField;
    cdsSenhaSERIAL2: TStringField;
    cdsSenhaCUPOM: TStringField;
    cdsSenhaQTD_CUPOM: TIntegerField;
    cdsSenhaESTOQ_NEG: TStringField;
    cdsSenhaGAVETA_CUPOM: TStringField;
    cdsSenhaCUPOM_SERV: TStringField;
    cdsSenhaCONTRA_SENHA: TStringField;
    cdsSenhaDEPART: TStringField;
    cdsSenhaIMAGENS_US: TStringField;
    cdsSenhaIMP_US: TStringField;
    cdsSenhaALT_CAB: TStringField;
    cdsSenhaALT_IMP: TStringField;
    cdsSenhaDATA_CAD_S: TDateTimeField;
    cdsSenhaDATA_MOD_S: TDateTimeField;
    cdsSenhaATIVO: TIntegerField;
    cdsProd: TClientDataSet;
    cdsEstado: TClientDataSet;
    cdsEstadoCODIGO_UF: TIntegerField;
    cdsEstadoNOME_UF: TStringField;
    cdsEstadoSIGLA_UF: TStringField;
    cdsEstadoATIVO: TIntegerField;
    cdsEmp: TClientDataSet;
    cdsEmpCOD_EMPRESA: TIntegerField;
    cdsEmpNOME_EMP: TStringField;
    cdsEmpENDERECO_EMP: TStringField;
    cdsEmpBAIRRO_EMP: TStringField;
    cdsEmpCIDADE_EMP: TStringField;
    cdsEmpCEP_EMP: TStringField;
    cdsEmpCNPJ_EMP: TStringField;
    cdsEmpIE_EMP: TStringField;
    cdsEmpIM_EMP: TStringField;
    cdsEmpTELEFONE_EMP: TStringField;
    cdsEmpNUMERO_END: TIntegerField;
    cdsEmpPROP_EMP: TStringField;
    cdsCliente: TClientDataSet;
    cdsClienteCOD_CLIENTE: TIntegerField;
    cdsClienteCOD_EMPRESA: TIntegerField;
    cdsClienteCODIGO_UF: TIntegerField;
    cdsClienteCODIGO_TIPO: TIntegerField;
    cdsClienteCODIGO_FATURAMENTO: TIntegerField;
    cdsClienteEST_CODIGO_UF: TIntegerField;
    cdsClienteCPFCGC: TStringField;
    cdsClienteNOME_CLIENTE: TStringField;
    cdsClienteRAZAO: TStringField;
    cdsClienteCIDADE: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteINSC_EST: TStringField;
    cdsClienteFAX: TStringField;
    cdsClienteCIDA_COBRANCA: TStringField;
    cdsClienteCEP_COBRANCA: TStringField;
    cdsClienteOBSERVACAO: TStringField;
    cdsClienteDATA_CADASTRO: TDateTimeField;
    cdsClienteLIMITE_CREDITO: TFloatField;
    cdsClienteCONTATO: TStringField;
    cdsClienteNATURALID: TStringField;
    cdsClienteCONJUGE: TStringField;
    cdsClienteLOC_TRAB: TStringField;
    cdsClienteEND_TRAB: TStringField;
    cdsClienteFONE_TRAB: TStringField;
    cdsClienteCARGO: TStringField;
    cdsClienteRG: TStringField;
    cdsClienteEXPEDIC: TDateTimeField;
    cdsClienteORG_EXPEDIC: TStringField;
    cdsClienteCTPS: TStringField;
    cdsClienteREF_BANC1: TStringField;
    cdsClienteFONE_BANC1: TStringField;
    cdsClienteREF_BANC2: TStringField;
    cdsClienteFONE_BANC2: TStringField;
    cdsClienteREF_COM1: TStringField;
    cdsClienteEND_COM1: TStringField;
    cdsClienteFONE_COM1: TStringField;
    cdsClienteINFORM: TStringField;
    cdsClientePRI_COMPR: TDateTimeField;
    cdsClienteULT_COMPR: TDateTimeField;
    cdsClienteCONCEITO: TStringField;
    cdsClienteREF_COM2: TStringField;
    cdsClienteEND_COM2: TStringField;
    cdsClienteFONE_COM2: TStringField;
    cdsClienteINFORM2: TStringField;
    cdsClientePRI_COMPR2: TDateTimeField;
    cdsClienteULT_COMPR2: TDateTimeField;
    cdsClienteCONCEITO2: TStringField;
    cdsClienteSPCL: TDateTimeField;
    cdsClienteSPCEST: TDateTimeField;
    cdsClienteREGSPC: TDateTimeField;
    cdsClienteREGSPCCH: TDateTimeField;
    cdsClienteUS_CAD_CLI: TIntegerField;
    cdsClienteFONE_CLIENTE: TStringField;
    cdsClienteENDERECO: TStringField;
    cdsClienteBAIRRO: TStringField;
    cdsClienteEND_COBRANCA: TStringField;
    cdsClienteBAIRRO_COBRANCA: TStringField;
    cdsClienteOBS_DIV: TMemoField;
    cdsClientePAI: TStringField;
    cdsClienteMAE: TStringField;
    cdsClienteDATA_NASC: TDateTimeField;
    cdsClienteEMAIL: TStringField;
    cdsClienteCOD_CONVENIO: TIntegerField;
    cdsClienteCONVENIADO: TStringField;
    cdsClienteDIA_VENC: TIntegerField;
    cdsClienteDATA_MOD_CAD: TDateTimeField;
    cdsClienteCODIGO_EMP: TIntegerField;
    cdsClienteCATEGORIA: TStringField;
    cdsClienteCLQTDCOMPRA: TStringField;
    cdsClienteCLSOMACOMPRA: TStringField;
    cdsClienteCLULTIMACOMPRA: TStringField;
    cdsClienteCLATRASOCOMPRA: TStringField;
    cdsClienteCLLUCROCLIENTE: TStringField;
    cdsClienteLUCROCLIENTE: TFloatField;
    cdsClienteTIPOCLIENTE: TStringField;
    cdsClienteCLQTDVEICULO: TStringField;
    cdsClienteCLSOMAVEICULO: TStringField;
    cdsClienteCLULTIMOVEICULO: TStringField;
    cdsClienteCLLUCROVEICULO: TStringField;
    cdsClienteLUCROCLIENTE_V: TFloatField;
    cdsClienteV_Q_VEICULO: TFloatField;
    cdsClienteM_Q_VEICULO: TFloatField;
    cdsClienteV_T_VEICULO: TFloatField;
    cdsClienteM_T_VEICULO: TFloatField;
    cdsClienteV_L_VEICULO: TFloatField;
    cdsClienteM_L_VEICULO: TFloatField;
    cdsClienteDATA_ULT_VENDA_V: TDateTimeField;
    cdsClienteMEDIA_FREQUENCIA_V: TFloatField;
    cdsClienteMEDIAFREQUENCIA: TFloatField;
    cdsClienteV_Q_COMPRA: TFloatField;
    cdsClienteM_Q_COMPRA: TFloatField;
    cdsClienteV_T_COMPRA: TFloatField;
    cdsClienteM_T_COMPRA: TFloatField;
    cdsClienteV_L_COMPRA: TFloatField;
    cdsClienteM_L_COMPRA: TFloatField;
    cdsClienteV_A_COMPRA: TFloatField;
    cdsClienteM_A_COMPRA: TFloatField;
    cdsClienteDATA_ULT_COMPRA: TDateTimeField;
    cdsClienteNEC_ACOMP: TStringField;
    cdsClienteDIAS_ACOMP: TIntegerField;
    cdsClienteSEXO: TStringField;
    cdsClienteRAMO_ATIVIDADE: TStringField;
    cdsClienteCOD_CIDADE: TSmallintField;
    cdsClienteCOD_BAIRRO: TSmallintField;
    cdsClienteCOD_CIDADE_COBRANCA: TSmallintField;
    cdsClienteCOD_BAIRRO_COBRANCA: TSmallintField;
    cdsClienteESTADO_CIVIL: TStringField;
    cdsClienteTIPVCLIENTE: TStringField;
    cdsClienteCAMP_PR_VENDA: TStringField;
    cdsClientePERC_DESC: TFloatField;
    dsCodBarra: TDataSource;
    dsProd: TDataSource;
    dsSenha: TDataSource;
    dsColab: TDataSource;
    dspFuncao: TDataSetProvider;
    dsEstado: TDataSource;
    dspServ: TDataSetProvider;
    dsEmp: TDataSource;
    qrFuncao: TIBQuery;
    dspSenha: TDataSetProvider;
    dsCliente: TDataSource;
    dspColab: TDataSetProvider;
    dsTipCl: TDataSource;
    qrServ: TIBQuery;
    qrSenha: TIBQuery;
    qrColab: TIBQuery;
    dspCodBarra: TDataSetProvider;
    dspProd: TDataSetProvider;
    qrCodBarra: TIBQuery;
    qrProd: TIBQuery;
    qrCliente: TIBQuery;
    dspCliente: TDataSetProvider;
    dspTipCl: TDataSetProvider;
    qrTipCl: TIBQuery;
    qrEstado: TIBQuery;
    qrEmp: TIBQuery;
    dspEstado: TDataSetProvider;
    dsFuncao: TDataSource;
    dspEmp: TDataSetProvider;
    dsServ: TDataSource;
    cdsTipCl: TClientDataSet;
    cdsTipClCODIGO_TIPO: TIntegerField;
    cdsTipClDESCRICAO_TIPO: TStringField;
    cdsTipClOBSERVACAO_T: TStringField;
    cdsTipClATIVO: TIntegerField;
    cdsFuncao: TClientDataSet;
    cdsFuncaoCOD_FUNCAO: TIntegerField;
    cdsFuncaoCOD_DEPTO: TIntegerField;
    cdsFuncaoDESC_FUNCAO: TStringField;
    cdsFuncaoTPDOCS_VND: TMemoField;
    cdsFuncaoATIVO: TIntegerField;
    transacaoHwF: TIBTransaction;
    qrBuscas: TIBQuery;
    spEstoqueReal: TIBStoredProc;
    cdsProdCODIGO: TStringField;
    cdsProdCOD_PROD: TStringField;
    cdsProdGRUPO_PROD: TIntegerField;
    cdsProdICM_PROD: TFloatField;
    cdsProdEST_F: TFloatField;
    cdsProdISENTO_PROD: TStringField;
    cdsProdN_INCIDENCIA_PROD: TStringField;
    cdsProdPREC_TAB_PROD: TFloatField;
    cdsProdPREC_30_PROD: TFloatField;
    cdsProdNUM_FAB_PROD: TStringField;
    cdsProdDESCR_PROD: TStringField;
    cdsProdDESCR_PROD_RED: TStringField;
    cdsProdUNIDADE: TStringField;
    cdsProdCSDECVLUNT: TStringField;
    cdsEmpSIGLA_UF: TStringField;
    dspCtrl: TDataSetProvider;
    qrCtrl: TIBQuery;
    dsCtrl: TDataSource;
    cdsCtrl: TClientDataSet;
    cdsClienteSIGLA_UF: TStringField;
    cdsProdALT_COD_CUPOM: TStringField;
    cdsProdALT_DESC_CUPOM: TStringField;
    cdsEmpAUT_SERV_CUPOM: TStringField;
    cdsProdARREDONDAR_TRUNCAR: TStringField;
    cdsProdTIPO_FAB: TStringField;
    cdsProdGTIN: TStringField;
    cdsProdSITTRIB: TStringField;
    cdsProdIAT: TStringField;
    cdsProdIPPT: TStringField;
    cdsServSERV_PROP_TERC: TStringField;
    cdsServISENTO_SERV: TStringField;
    cdsServN_INCIDENCIA_SERV: TStringField;
    cdsServARREDONDAR_TRUNCAR: TStringField;
    cdsServGTIN: TStringField;
    cdsServSITTRIB: TStringField;
    cdsServIAT: TStringField;
    cdsServIPPT: TStringField;
    cdsProdPREC_CUS_PROD: TFloatField;
    cdsProdPERC_TB_VARE: TFloatField;
    cdsEmpENDRECO_EMP: TStringField;
    cdsEmpCOPIAR_HWF_TERM_RET: TStringField;
    cdsProdTOT_ALIQ: TStringField;
    cdsProdTIPO_ITEM: TStringField;
    cdsProdEM_PROMOCAO: TStringField;
    cdsProdPRECO_PROMOCAO: TFloatField;
    cdsProdCODIGO_NOP: TFloatField;
    cdsProdCST_PROD: TStringField;
    cdsProdMAX_DESC_ITEM: TFloatField;
    cdsEmpVERSAO: TIntegerField;
    cdsClienteNUM_END_CLIENTE: TStringField;
    cdsProdNBM: TStringField;
    transacaoHw: TIBTransaction;
    qrBuscasHw: TIBQuery;
    cdsProdCST_PIS: TStringField;
    cdsServCST_PIS: TStringField;
    cdsProdALIQ_PIS_DIFERENCIADA: TFloatField;
    cdsProdALIQ_COFINS_DIFERENCIADA: TFloatField;
    cdsProdLISTA_IMAGENS: TBlobField;
    procedure cdsServCalcFields(DataSet: TDataSet);
    procedure cdsProdCalcFields(DataSet: TDataSet);
    procedure cdsEmpBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure mudaSelect(DataSet: TClientDataSet);
  public
    { Public declarations }
    procedure verificarConexao;
  end;

var
  DtmFiscalHwF: TDtmFiscalHwF;

implementation

uses uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TDtmFiscalHwF.cdsEmpBeforeOpen(DataSet: TDataSet);
begin
    mudaSelect(TClientDataSet(DataSet));
end;

procedure TDtmFiscalHwF.cdsProdCalcFields(DataSet: TDataSet);
begin
  cdsProdGTIN.AsString := vDadosIni.StrZero(cdsProdCODIGO.AsString,14);
  if cdsProdICM_PROD.AsFloat > 0 then
    cdsProdSITTRIB.AsString := 'T'+
      vDadosIni.StrZero( Trim(Format('%0.2f',[
     cdsProdicm_prod.AsFloat])),4)+'%'
  else if cdsProdISENTO_PROD.AsString = 'S' then //'ISENTO' then
    cdsProdSITTRIB.AsString:= 'I1'
  else if cdsProdN_INCIDENCIA_PROD.AsString = 'S' then //'NAOINCIDENCIA' then
    cdsProdSITTRIB.AsString:= 'N1'
  else //if cdsProdicm_prod.AsFloat = 0 then //'SUBTRIBUTARIA' then
    cdsProdSITTRIB.AsString:= 'F1';
  cdsProdIAT.AsString := cdsProdARREDONDAR_TRUNCAR.AsString;
  if cdsProdARREDONDAR_TRUNCAR.AsString <> 'A' then
    cdsProdIAT.AsString := 'T';
  cdsProdIPPT.AsString := cdsProdTIPO_FAB.AsString;
  if cdsProdTIPO_FAB.AsString <> 'P' then
    cdsProdIPPT.AsString := 'T';
end;

procedure TDtmFiscalHwF.cdsServCalcFields(DataSet: TDataSet);
begin
cdsServGTIN.AsString := vDadosIni.StrZero(cdsServCOD_SERVICO.AsString,14);
  if cdsServALIQ_ISS.AsFloat > 0 then
    cdsServSITTRIB.AsString := 'S'+
      vDadosIni.StrZero( Trim(Format('%0.2f',[
     cdsServALIQ_ISS.AsFloat])),4)+'%'
  else if cdsServISENTO_SERV.AsString = 'S' then //'ISENTO' then
    cdsServSITTRIB.AsString:= 'IS1'
  else if cdsServN_INCIDENCIA_SERV.AsString = 'S' then //'NAOINCIDENCIA' then
    cdsServSITTRIB.AsString:= 'NS1'
  else //if cdsServALIQ_ISS.AsFloat = 0 then //'SUBTRIBUTARIA' then
    cdsServSITTRIB.AsString:= 'FS1';
  cdsServIAT.AsString := cdsServARREDONDAR_TRUNCAR.AsString;
  if cdsServARREDONDAR_TRUNCAR.AsString <> 'A' then
    cdsServIAT.AsString := 'T';
  cdsServIPPT.AsString := cdsServSERV_PROP_TERC.AsString;
  if cdsServSERV_PROP_TERC.AsString <> 'P' then
    cdsServIPPT.AsString := 'T';
end;

procedure TDtmFiscalHwF.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to DtmFiscalHwF.ComponentCount - 1 do
    begin
      if (DtmFiscalHwF.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(DtmFiscalHwF.Components[i]).Name) =
          UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(DtmFiscalHwF.Components[i]).DataSet).SQL.Text :=
            DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

procedure TDtmFiscalHwF.verificarConexao;
var
  I: Integer;
begin
  vDadosIni.LerConfigini;
  if vDadosIni.vSistema = 'Fiscal' then
    if vDadosIni.vTipoConexao = 'off' then
    begin
      for I := 0 to DtmFiscalHwF.ComponentCount - 1 do
        if DtmFiscalHwF.Components[i].Tag <> 99 then
        begin
          if (DtmFiscalHwF.Components[i] is TIBTransaction) then
            TIBTransaction(DtmFiscalHwF.Components[i]).DefaultDatabase := dtmAtivo.bancoHwF
          else if (DtmFiscalHwF.Components[i] is TIBQuery) then
            TIBQuery(DtmFiscalHwF.Components[i]).Database := dtmAtivo.bancoHwF
          else if (DtmFiscalHwF.Components[i] is TIBStoredProc) then
            TIBStoredProc(DtmFiscalHwF.Components[i]).Database := dtmAtivo.bancoHwF;
        end;
    end;
end;

end.
