unit UDtmHwNFE;

interface

uses
  SysUtils, Classes, DB, IBX.IBDatabase, Provider, IBX.IBQuery,
  DBClient, IBX.IBStoredProc, IBX.IBCustomDataSet;

type
  TDtmNFEHW = class(TDataModule)
    IbTransNFe: TIBTransaction;
    IbConexaoNFe: TIBDatabase;
    IbNFe: TIBQuery;
    DspNFe: TDataSetProvider;
    CdsNFeVenda: TClientDataSet;
    IbBuscas: TIBQuery;
    DtNFe: TDataSource;
    QrClientesLook: TIBQuery;
    IbEmpresa: TIBQuery;
    DspEmpresa: TDataSetProvider;
    CdsEmpresa: TClientDataSet;
    IbItensNFvENDA: TIBQuery;
    DspitNfVenda: TDataSetProvider;
    CdsItNfVenda: TClientDataSet;
    CdsClientes: TClientDataSet;
    IbCliente: TIBQuery;
    DspCliente: TDataSetProvider;
    SpIncCodigo: TIBStoredProc;
    DtClienteForn: TDataSource;
    IbEstados: TIBQuery;
    CdsEstados: TClientDataSet;
    DspEstados: TDataSetProvider;
    CdsNFeVendaSEL_NFE: TIntegerField;
    CdsNFeVendaNUM_NF: TIntegerField;
    CdsNFeVendaCOD_EMPRESA: TIntegerField;
    CdsNFeVendaNATUREZA_NF: TWideStringField;
    CdsNFeVendaCOD_CLIENTE: TIntegerField;
    CdsNFeVendaDATA_CONTABIL: TDateTimeField;
    CdsNFeVendaSERIE: TWideStringField;
    CdsNFeVendaDATA_ENT_SAIDA: TDateTimeField;
    CdsNFeVendaCHAVE_NFE: TWideStringField;
    CdsNFeVendaRESULTADO_ENVIO: TWideStringField;
    CdsNFeVendaDATA_AUTORIZACAO: TDateTimeField;
    CdsNFeVendaSITUACAO_NFE: TWideStringField;
    CdsNFeVendaDIGEST: TWideStringField;
    CdsNFeVendaPROTOCOLO: TWideStringField;
    CdsNFeVendaCODIGOERRO: TWideStringField;
    CdsNFeVendaDESCRICAOERRO: TWideStringField;
    CdsNFeVendaTEMPORESPOSTA: TSmallintField;
    CdsNFeVendaHORA_ENVIO: TWideStringField;
    CdsNFeVendaTIPONFE: TWideStringField;
    CdsNFeVendaDANFEIMPRESSO: TWideStringField;
    CdsNFeVendaDATAHORA_ENVIO: TDateTimeField;
    CdsNFeVendaBASE_ICM: TFloatField;
    CdsNFeVendaVALOR_ICM: TFloatField;
    CdsNFeVendaVALOR_TOTAL: TFloatField;
    CdsNFeVendaVALOR_PROD: TFloatField;
    CdsNFeVendaBASE_ICMSUB: TFloatField;
    CdsNFeVendaVALOR_ICMSUB: TFloatField;
    CdsNFeVendaVALOR_FRETE: TFloatField;
    CdsNFeVendaVALOR_SEGURO: TFloatField;
    CdsNFeVendaVALOR_DESC: TFloatField;
    CdsNFeVendaVALOR_IPI: TFloatField;
    CdsNFeVendaVALOR_OUT_DESP: TFloatField;
    CdsNFeVendaVALOR_IRRF: TFloatField;
    CdsNFeVendaCODIGO_NOP: TFloatField;
    CdsNFeVendaDESC_NATOP: TWideStringField;
    CdsNFeVendaJUST_CANCELAMENTO: TWideStringField;
    CdsNFeVendaCOD_COND_PAG: TIntegerField;
    CdsNFeVendaNUM_NF_VNDANT: TIntegerField;
    CdsNFeVendaSUB_SERIEANT: TIntegerField;
    CdsNFeVendaOBS: TWideMemoField;
    CdsNFeVendaCODIGO_TR: TIntegerField;
    CdsNFeVendaPLACA_TR: TWideStringField;
    CdsNFeVendaFRETECONTA_TR: TWideStringField;
    CdsNFeVendaESPECIE_TR: TWideStringField;
    CdsNFeVendaMARCA_TR: TWideStringField;
    CdsNFeVendaNUMERO_TR: TWideStringField;
    CdsNFeVendaPESO_B: TFloatField;
    CdsNFeVendaPESO_L: TFloatField;
    CdsNFeVendaUF_PLACA_TR: TWideStringField;
    CdsNFeVendaTIPO_NF: TWideStringField;
    CdsNFeVendaNFE_DHCONT: TDateTimeField;
    CdsNFeVendaNFE_XJUST: TWideStringField;
    CdsNFeVendaNFE_DPEC_NREGDPEC: TWideStringField;
    CdsNFeVendaNFE_DPEC_XMOTIVO: TWideStringField;
    CdsNFeVendaDADOS_INTERESSE_FISCO: TWideMemoField;
    CdsNFeVendaTIPO_EMISSAO: TWideStringField;
    CdsNFeVendaNUM_NF_EMT: TIntegerField;
    CdsNFeVendaSERIE_EMT: TWideStringField;
    CdsNFeVendaHORA_ENT_SAIDA: TTimeField;
    CdsNFeVendaCRT: TWideStringField;
    CdsNFeVendaCOD_NF: TIntegerField;
    CdsNFeVendaQTDE_VOLUMES_TR: TIntegerField;
    CdsNFeVendaNFE_CMSG: TSmallintField;
    CdsNFeVendaNFE_XMSG: TWideStringField;
    CdsNFeVendaCNAE_FISCAL: TWideStringField;
    CdsNFeVendaINSCRICAO_SUBSTITUTO: TWideStringField;
    CdsNFeVendaIM_EMP: TWideStringField;
    CdsNFeVendaVALOR_SERV: TFloatField;
    CdsNFeVendaBASE_ISS: TFloatField;
    CdsNFeVendaVALOR_ISS: TFloatField;
    CdsNFeVendaALIQ_ISS: TFloatField;
    CdsNFeVendaSTATUS: TWideStringField;
    CdsNFeVendaLOTE_NFE: TIntegerField;
    CdsNFeVendaN_COMANDO: TIntegerField;
    CdsNFeVendaDATA_LANC: TDateTimeField;
    IbBuscasAdic: TIBQuery;
    IbNFSe: TIBQuery;
    DspNFSe: TDataSetProvider;
    CdsNFSe: TClientDataSet;
    DtNFSe: TDataSource;
    CdsNFSeNOME_CLIENTE: TWideStringField;
    CdsNFSeNPED: TIntegerField;
    CdsNFSeTIPO: TWideStringField;
    CdsNFSeALIQ_ISS: TFloatField;
    CdsNFSeNFS_SERVICO: TWideStringField;
    CdsNFSeCNAE_SERV: TIntegerField;
    CdsNFSeCIDADE: TWideStringField;
    CdsNFSeCOD_RPS: TIntegerField;
    CdsNFSeCOD_EMPRESA: TIntegerField;
    CdsNFSeDATA_FECH: TDateTimeField;
    CdsNFSeSTATUS_NFSE: TWideStringField;
    IbMontaNFSe: TIBQuery;
    DspMontaNFSe: TDataSetProvider;
    CdsMontaNFSe: TClientDataSet;
    DtIbBuscasAdic: TDataSource;
    CdsNFSeVALORNF: TFloatField;
    CdsNFeVendaVALOR_PIS: TFloatField;
    CdsNFeVendaVALOR_COFINS: TFloatField;
    CdsNFeVendaVALOR_II: TFloatField;
    CdsNFeVendaNFE_RECIBO: TWideStringField;
    CdsNFeVendaSTAT_NFERECIBO: TWideStringField;
    IbCCe: TIBQuery;
    DspCCe: TDataSetProvider;
    CdsCCe: TClientDataSet;
    CdsCCeCOD_NF: TIntegerField;
    CdsCCeCOD_EMPRESA: TIntegerField;
    CdsCCeIDLOTE: TIntegerField;
    CdsCCeNSEQEVENTO: TSmallintField;
    CdsCCeSITUACAO: TWideStringField;
    CdsCCeXCORRECAO: TWideMemoField;
    CdsCCeCSTAT: TWideStringField;
    CdsCCeXMOTIVO: TWideStringField;
    CdsCCeNPROT: TWideStringField;
    CdsCCeDHEVENTO: TDateTimeField;
    CdsCCeCSTAT_PROC: TIntegerField;
    CdsCCeXMOTIVO_PROC: TWideStringField;
    CdsNFeVendaUFEMBARQ: TWideStringField;
    CdsNFeVendaXLOCEMBARQ: TWideStringField;
    CdsCCeTIPO_EVENTO: TWideStringField;
    CdsNFeVendaSERIE_COMPL: TWideStringField;
    CdsNFeVendaNUM_NF_COMPL: TIntegerField;
    CdsNFDestinadas: TClientDataSet;
    IbNFDestinadas: TIBQuery;
    DspNFDestinadas: TDataSetProvider;
    CdsNFDestinadasCHAVE_NFE: TWideStringField;
    CdsNFDestinadasCOD_EMPRESA: TIntegerField;
    CdsNFDestinadasXNOME: TWideStringField;
    CdsNFDestinadasCNPJCPF: TWideStringField;
    CdsNFDestinadasIE: TWideStringField;
    CdsNFDestinadasDATA_EMISSAO: TDateTimeField;
    CdsNFDestinadasTPNF: TWideStringField;
    CdsNFDestinadasVNF: TFloatField;
    CdsNFDestinadasCSITNFE: TIntegerField;
    CdsNFDestinadasSTATUS_NFE: TWideStringField;
    CdsNFDestinadasCSITCONF: TIntegerField;
    CdsNFDestinadasMANIFESTACAO: TWideStringField;
    CdsNFDestinadasBAIXADA: TWideStringField;
    CdsNFDestinadasCCE_TEXTO: TWideStringField;
    CdsNFDestinadasPASTA_DOWNLOAD: TWideStringField;
    CdsNFDestinadasDATA_CANC: TDateTimeField;
    CdsNFDestinadasDATA_CCE: TDateTimeField;
    CdsNFDestinadasIDLOTE: TIntegerField;
    CdsNFDestinadasDATA_CIENCIA: TDateTimeField;
    CdsNFDestinadasDATA_CONFIRM: TDateTimeField;
    CdsNFDestinadasDATA_DESCONH: TDateTimeField;
    CdsNFDestinadasDATA_OPNAOREAL: TDateTimeField;
    CdsNFDestinadasCSITCONFPEDIDO: TIntegerField;
    CdsNFDestinadasCULTSTATUSMAN: TIntegerField;
    CdsNFDestinadasULTIMOMOTIVOMAN: TWideStringField;
    CdsNFDestinadasNUM_NF: TIntegerField;
    CdsNFDestinadasSERIE_NF: TIntegerField;
    CdsNFeVendaVTOTTRIB: TFloatField;
    cdsOsparaNFSe: TClientDataSet;
    cdsOsparaNFSeNPED: TIntegerField;
    cdsOsparaNFSeNOMECLIENTE: TWideStringField;
    IbNFSeCanceladas: TIBQuery;
    DtNFSECanceladas: TDataSource;
    IbMDFE: TIBQuery;
    DspMDFE: TDataSetProvider;
    cdsMDFE: TClientDataSet;
    CdsNFSeISS_RETIDO: TIntegerField;
    CdsNFSeCTISS: TWideStringField;
    CdsNFSeN_NF: TLargeintField;
    CdsNFDestinadasNSUDFE: TLargeintField;
    CdsNFeVendaNFE_INDPRES: TWideStringField;
    CdsNFeVendaNFE_IDDEST: TWideStringField;
    CdsNFeVendaHORA_EMISSAO: TWideStringField;
    CdsNFeVendaCONSUMIDOR_FINAL: TWideStringField;
    CdsNFeVendaXLOCDESPACHO: TWideStringField;
    CdsNFeVendaVFCPUFDEST: TFloatField;
    CdsNFeVendaVICMSUFDEST: TFloatField;
    CdsNFeVendaVICMSUFREMET: TFloatField;
    CdsNFeVendaNFE_INDIEDEST: TSmallintField;
    CdsCCeXML_EVENTO: TWideMemoField;
    CdsCCeXML_NFE_EPEC: TWideMemoField;
    CdsNFeVendaCNFE: TIntegerField;
    CdsNFDestinadasXJUST: TWideStringField;
    CdsNFSeVL_LIQ: TFloatField;
    CdsNFSeCTRIBNAC: TWideStringField;
    CdsNFSeCTRIBMUN: TWideStringField;
    CdsNFSeCNBS: TWideStringField;
    CdsNFSeNFSE_NACIONAL: TIntegerField;
    CdsNFSeMODELO_NFSE: TWideStringField;
    CdsNFSeEMISSAO_RPS: TDateTimeField;
    CdsNFSeCOD_CLIENTE: TIntegerField;
    CdsNFSeCODIGO_VERWSNFSE: TWideStringField;
    CdsNFSeIRRF_SERVICO: TFloatField;
    CdsNFSeISSRET_SERVICO: TFloatField;
    CdsNFSePISRF_SERVICO: TFloatField;
    CdsNFSeCOFINSRF_SERVICO: TFloatField;
    CdsNFSeCSSLRF_SERVICO: TFloatField;
    CdsNFSeBRUTO: TFloatField;
    procedure CdsNFSeAfterScroll(DataSet: TDataSet);
    procedure CdsNFeVendaAfterScroll(DataSet: TDataSet);
    procedure CdsNFeVendaBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure mudaSelect(DataSet: TClientDataSet);
  public
    { Public declarations }
  end;

var
  DtmNFEHW: TDtmNFEHW;

implementation

{$R *.dfm}

procedure TDtmNFEHW.CdsNFeVendaAfterScroll(DataSet: TDataSet);
begin
  IbCliente.close;
  IbCliente.sql.text:='SELECT * FROM CLIENTES WHERE COD_CLIENTE = '+CdsNFeVendaCOD_CLIENTE.asstring+
  ' AND COD_EMPRESA = '+CdsNFeVendaCOD_EMPRESA.AsString;
  IbCliente.open;
end;

procedure TDtmNFEHW.CdsNFeVendaBeforeOpen(DataSet: TDataSet);
begin
 mudaSelect(TClientDataSet(DataSet));
end;

procedure TDtmNFEHW.CdsNFSeAfterScroll(DataSet: TDataSet);
begin
{  IbCliente.close;
  IbCliente.sql.text:='SELECT * FROM CLIENTES WHERE COD_CLIENTE = '+CdsNFeVendaCOD_CLIENTE.asstring+
  ' AND COD_EMPRESA = '+CdsNFeVendaCOD_EMPRESA.AsString;
  IbCliente.open;}
end;

procedure TDtmNFEHW.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to DtmNFEHW.ComponentCount - 1 do
    begin
      if (DtmNFEHW.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(DtmNFEHW.Components[i]).Name) = UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(DtmNFEHW.Components[i]).DataSet).SQL.Text := DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

end.
