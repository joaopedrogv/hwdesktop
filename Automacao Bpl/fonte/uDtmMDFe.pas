unit uDtmMDFe;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBCustomDataSet, IBQuery, IBDatabase, IBStoredProc;

type
  TdtmMDFe = class(TDataModule)
    qrMDFe: TIBQuery;
    dspMDFe: TDataSetProvider;
    cdsMDFe: TClientDataSet;
    dsMDFe: TDataSource;
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    qrBuscas2: TIBQuery;
    qrBuscas3: TIBQuery;
    qrMDFeDes: TIBQuery;
    dspMDFeDes: TDataSetProvider;
    cdsMDFeDes: TClientDataSet;
    dsMDFeDes: TDataSource;
    dsMDFeDesNFe: TDataSource;
    qrMDFeCar: TIBQuery;
    dspMDFeCar: TDataSetProvider;
    cdsMDFeCar: TClientDataSet;
    dsMDFeCar: TDataSource;
    cdsMDFeCOD_MDFE: TIntegerField;
    cdsMDFeCOD_EMPRESA: TIntegerField;
    cdsMDFeCOD_VEIC: TIntegerField;
    cdsMDFeCOD_VEIC_REBOQUE_1: TIntegerField;
    cdsMDFeCOD_VEIC_REBOQUE_2: TIntegerField;
    cdsMDFeCOD_VEIC_REBOQUE_3: TIntegerField;
    cdsMDFeTPAMB: TSmallintField;
    cdsMDFeTPEMIT: TSmallintField;
    cdsMDFeMODELO: TSmallintField;
    cdsMDFeSERIE: TSmallintField;
    cdsMDFeNMDF: TIntegerField;
    cdsMDFeMODAL: TSmallintField;
    cdsMDFeDHEMI: TDateTimeField;
    cdsMDFeTPEMIS: TSmallintField;
    cdsMDFeUFINI: TStringField;
    cdsMDFeUFFIM: TStringField;
    cdsMDFeINFADFISCO: TMemoField;
    cdsMDFeINFCPL: TMemoField;
    cdsMDFeRNTRC: TIntegerField;
    cdsMDFeCIOT: TIntegerField;
    cdsMDFeQNFE: TSmallintField;
    cdsMDFeVCARGA: TFloatField;
    cdsMDFeCUNID: TSmallintField;
    cdsMDFeQCARGA: TFloatField;
    cdsMDFeXNOME_CONDUTOR: TStringField;
    cdsMDFeCPF_CONDUTOR: TStringField;
    cdsMDFeTERCEIRO_CONDUTOR: TStringField;
    cdsMDFeDATA_CADASTRO: TDateTimeField;
    cdsMDFeATIVO: TSmallintField;
    qrVeic: TIBQuery;
    dspVeic: TDataSetProvider;
    cdsVeic: TClientDataSet;
    dsVeic: TDataSource;
    cdsVeicCOD_VEIC: TIntegerField;
    cdsVeicCOD_EMPRESA: TIntegerField;
    cdsVeicPLACA: TStringField;
    cdsVeicMODELO: TStringField;
    cdsVeicREBOQUE: TStringField;
    cdsMDFeCarCOD_MDFE: TIntegerField;
    cdsMDFeCarCOD_EMPRESA: TIntegerField;
    cdsMDFeCarCMUNCARREGA: TIntegerField;
    cdsMDFeCarXMUNCARREGA: TStringField;
    cdsMDFeDesCOD_MDFE: TIntegerField;
    cdsMDFeDesCOD_EMPRESA: TIntegerField;
    cdsMDFeDesCMUNDESCARGA: TIntegerField;
    cdsMDFeDesXMUNDESCARGA: TStringField;
    qrMDFeCond: TIBQuery;
    dspMDFeCond: TDataSetProvider;
    cdsMDFeCond: TClientDataSet;
    dsMDFeCond: TDataSource;
    cdsMDFeCondCOD_MDFE: TIntegerField;
    cdsMDFeCondCOD_EMPRESA: TIntegerField;
    cdsMDFeCondCPF: TStringField;
    cdsMDFeCondXNOME: TStringField;
    cdsMDFeCondTERCEIRO: TStringField;
    cdsMDFeDATA_AUTORIZACAO: TDateTimeField;
    cdsMDFeSITUACAO_MDFE: TStringField;
    cdsMDFeDIGEST: TStringField;
    cdsMDFePROTOCOLO: TStringField;
    cdsMDFeCODIGOERRO: TStringField;
    cdsMDFeDESCRICAOERRO: TStringField;
    cdsMDFeTEMPORESPOSTA: TSmallintField;
    cdsMDFeHORA_ENVIO: TStringField;
    cdsMDFeDATAHORA_ENVIO: TDateTimeField;
    cdsMDFeCHAVE_MDFE: TStringField;
    cdsMDFeNFE_DHCONT: TDateTimeField;
    cdsMDFeNFE_RECIBO: TStringField;
    cdsMDFeLOTE_MDFE: TIntegerField;
    cdsMDFeTIPOMDFE: TStringField;
    cdsMDFeLOTEMDFE_CONSULTA: TIntegerField;
    cdsMDFeCSTAT_EVENTO: TStringField;
    cdsMDFeXMOTIVO_EVENTO: TStringField;
    cdsMDFeNPROT_EVENTO: TStringField;
    cdsMDFeDH_EVENTO: TDateTimeField;
    cdsMDFeTIPO_EVENTO: TStringField;
    cdsMDFeJUSTIFICATIVA: TStringField;
    cdsMDFeSITUACAO_EVENTO: TStringField;
    cdsMDFeRESULTADO_ENVIO: TStringField;
    cdsMDFeMDFE_CMSG: TSmallintField;
    cdsMDFeMDFE_XMSG: TStringField;
    cdsMDFeSEL: TStringField;
    qrMDFeDesNFe: TIBQuery;
    dspMDFeDesNFe: TDataSetProvider;
    cdsMDFeDesNFe: TClientDataSet;
    cdsMDFeDesNFeCOD_MDFE: TIntegerField;
    cdsMDFeDesNFeCOD_EMPRESA: TIntegerField;
    cdsMDFeDesNFeCMUNDESCARGA: TIntegerField;
    cdsMDFeDesNFeCOD_NF: TIntegerField;
    cdsMDFeDesNFeCHNFE: TStringField;
    cdsMDFeDesNFeSEGCODBARRA: TStringField;
    cdsMDFeDesNFePESO_BRUTO_NF: TFloatField;
    cdsMDFeDesNFeVALOR_TOTAL_NF: TFloatField;
    cdsMDFeDesNFeDATA_LANC: TDateTimeField;
    cdsMDFeDesNFeNUM_NF: TIntegerField;
    cdsMDFeDesNFeCOD_CLIENTE: TIntegerField;
    cdsMDFeDesNFeRAZAO: TStringField;
    cdsMDFeDesNFeCPFCGC: TStringField;
    cdsMDFeDesNFeNOME_MUNICIPIO: TStringField;
    qrMDFeDesNFeCOD_MDFE: TIntegerField;
    qrMDFeDesNFeCOD_EMPRESA: TIntegerField;
    qrMDFeDesNFeCMUNDESCARGA: TIntegerField;
    qrMDFeDesNFeCOD_NF: TIntegerField;
    qrMDFeDesNFeCHNFE: TIBStringField;
    qrMDFeDesNFeSEGCODBARRA: TIBStringField;
    qrMDFeDesNFePESO_BRUTO_NF: TFloatField;
    qrMDFeDesNFeVALOR_TOTAL_NF: TFloatField;
    qrMDFeDesNFeDATA_LANC: TDateTimeField;
    qrMDFeDesNFeNUM_NF: TIntegerField;
    qrMDFeDesNFeCOD_CLIENTE: TIntegerField;
    qrMDFeDesNFeRAZAO: TIBStringField;
    qrMDFeDesNFeCPFCGC: TIBStringField;
    qrMDFeDesNFeNOME_MUNICIPIO: TIBStringField;
    cdsMDFeCOD_CARGA: TIntegerField;
    cdsMDFeUFPER: TStringField;
    qrMDFeDesNFeINDREENTREGA: TSmallintField;
    cdsMDFeDesNFeINDREENTREGA: TSmallintField;
    cdsMDFeVERSAO: TSmallintField;
    cdsMDFeDesNFeID: TIntegerField;
    qrMDFeDesNFeID: TIntegerField;
    procedure cdsMDFeBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMDFe: TdtmMDFe;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmMDFe.cdsMDFeBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), dtmMDFe);
end;

end.
