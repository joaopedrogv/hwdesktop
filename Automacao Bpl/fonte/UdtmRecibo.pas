unit UdtmRecibo;

interface

uses
  SysUtils, Classes, IBDatabase, Provider, IBCustomDataSet, IBQuery, DB,
  DBClient, IBStoredProc;

type
  TdtmRecibo = class(TDataModule)
    cdsRecibo: TClientDataSet;
    dsRecibo: TDataSource;
    qrRecibo: TIBQuery;
    dspRecibo: TDataSetProvider;
    cdsHistRecibo: TClientDataSet;
    dsHistRecibo: TDataSource;
    qrHistRecibo: TIBQuery;
    dspHistRecibo: TDataSetProvider;
    IBTransRecibo: TIBTransaction;
    cdsReciboNRECIBO: TIntegerField;
    cdsReciboCOD_EMPRESA: TIntegerField;
    cdsReciboVALOR: TFloatField;
    cdsReciboREFERENCIA1: TStringField;
    cdsReciboREFERENCIA2: TStringField;
    cdsReciboREFERENCIA3: TStringField;
    cdsReciboREFERENCIA4: TStringField;
    cdsReciboBENEF_CLIENT: TStringField;
    cdsReciboNOME_DEV: TStringField;
    cdsReciboDATA_REC: TDateTimeField;
    cdsReciboLOCALDATA: TStringField;
    cdsReciboRECANT: TStringField;
    cdsReciboSTATUS_REC: TStringField;
    cdsReciboCOD_BENEF: TIntegerField;
    cdsReciboDEPREC: TStringField;
    cdsReciboNDOCANT: TIntegerField;
    cdsReciboDIA_CXL: TDateTimeField;
    cdsReciboN_MOV_CXL: TIntegerField;
    cdsReciboOBS_CXL_RQ: TStringField;
    cdsReciboSTATUS_CXL_RQ: TStringField;
    cdsReciboVL_RQ_PG_CXL: TFloatField;
    cdsReciboDATA_BAIXA: TDateTimeField;
    cdsReciboHISTORICO_REC: TStringField;
    cdsReciboCOD_PREP: TIntegerField;
    cdsReciboSELEC: TStringField;
    cdsReciboOP_CXL: TIntegerField;
    cdsReciboCOD_US: TIntegerField;
    cdsReciboATIVO: TIntegerField;
    cdsReciboCOD_DEVEDOR: TIntegerField;
    cdsHistReciboSEQCAD_REC: TIntegerField;
    cdsHistReciboCOD_EMPRESA: TIntegerField;
    cdsHistReciboNRECIBO: TIntegerField;
    cdsHistReciboVALOR_BAIXA: TFloatField;
    cdsHistReciboVALOR_RECIBO: TFloatField;
    cdsHistReciboDATA_REC: TDateTimeField;
    cdsHistReciboRECANT: TStringField;
    cdsHistReciboNDOCANT: TIntegerField;
    cdsHistReciboDATA_BAIXA: TDateTimeField;
    cdsHistReciboHISTORICO_REC: TStringField;
    cdsHistReciboATIVO: TIntegerField;
    cdsHistReciboCOD_US: TIntegerField;
    cdsHistReciboTP_DOC_BAIXA: TStringField;
    qrBuscas: TIBQuery;
    qrClientes: TIBQuery;
    dsClientes: TDataSource;
    qrDev: TIBQuery;
    dsDev: TDataSource;
    SpIncCodigo: TIBStoredProc;
    qrUF: TIBQuery;
    dsUF: TDataSource;
    qrDevCOD_CLIENTE: TIntegerField;
    qrDevNOME_CLIENTE: TIBStringField;
    qrDevCPFCGC: TIBStringField;
    qrDevFONE_CLIENTE: TIBStringField;
    qrDevENDERECO: TIBStringField;
    qrDevCEPCIDADEUF: TIBStringField;
    qrClRec: TIBQuery;
    dsClRec: TDataSource;
    cdsClrec: TClientDataSet;
    dspClRec: TDataSetProvider;
    qrClRecCOD_CLIENTE: TIntegerField;
    qrClRecNOME_CLIENTE: TIBStringField;
    qrClRecCPFCGC: TIBStringField;
    qrClRecFONE_CLIENTE: TIBStringField;
    qrClRecENDERECO: TIBStringField;
    qrClRecCEPCIDADEUF: TIBStringField;
    cdsClrecCOD_CLIENTE: TIntegerField;
    cdsClrecNOME_CLIENTE: TStringField;
    cdsClrecCPFCGC: TStringField;
    cdsClrecFONE_CLIENTE: TStringField;
    cdsClrecENDERECO: TStringField;
    cdsClrecCEPCIDADEUF: TStringField;
    qrClRecCIDADE: TIBStringField;
    cdsClrecCIDADE: TStringField;
    qrPrep: TIBQuery;
    dsPrep: TDataSource;
    qrPrepCOD_CLIENTE: TIntegerField;
    qrPrepNOME_CLIENTE: TIBStringField;
    cdsHistReciboTP_BAIXA: TStringField;
    qrColaborador: TIBQuery;
    dspColaborador: TDataSetProvider;
    cdsColaborador: TClientDataSet;
    dsColaborador: TDataSource;
    cdsColaboradorCOD_VENDEDOR: TIntegerField;
    cdsColaboradorNOME_VENDEDOR: TStringField;
    cdsReciboNUM_REC_DEP: TStringField;
    cdsReciboNOME_VENDEDOR: TStringField;
    cdsHistReciboNUM_REC_DEP: TStringField;
    cdsReciboATRAVES1: TStringField;
    cdsReciboATRAVES2: TStringField;
    cdsReciboATRAVES3: TStringField;
    cdsReciboOBSERVACAO1: TStringField;
    cdsReciboOBSERVACAO2: TStringField;
    cdsReciboOBSERVACAO3: TStringField;
    cdsReciboCOD_DEPTO: TIntegerField;
    cdsReciboNOME_DEPTO: TStringField;
    qrDepto: TIBQuery;
    dspDepto: TDataSetProvider;
    cdsDepto: TClientDataSet;
    dsDepto: TDataSource;
    cdsDeptoCOD_DEPTO: TIntegerField;
    cdsDeptoNOME_DEPTO: TStringField;
    cdsDeptoINICIAIS_DEPTO: TStringField;
    cdsReciboCOD_LOCACAO: TIntegerField;
    qrEmpresasUnificadas: TIBQuery;
    dspEmpresasUnificadas: TDataSetProvider;
    cdsEmpresasUnificadas: TClientDataSet;
    cdsEmpresasUnificadasCOD_EMPRESA: TIntegerField;
    cdsEmpresasUnificadasIDENTIFICACAO_EMP: TStringField;
    dsEmpresasUnificadas: TDataSource;
    DataSetProvider1: TDataSetProvider;
    cdsReciboCOD_EMP_MULT: TIntegerField;
    cdsReciboIDENTIFICACAO_EMP: TStringField;
    cdsReciboDATA_VENC: TDateTimeField;
    cdsReciboVALOR_ORIG: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsReciboBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRecibo: TdtmRecibo;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmRecibo.cdsReciboBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmRecibo);
end;

procedure TdtmRecibo.DataModuleCreate(Sender: TObject);
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
