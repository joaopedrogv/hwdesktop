unit uDtmVendaPerdida;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBQuery, IBCustomDataSet,
  IBStoredProc, IBDatabase;

type
  TdtmVendaPerdida = class(TDataModule)
    transacao: TIBTransaction;
    SpIncCodigo: TIBStoredProc;
    qrBuscas: TIBQuery;
    dspVendaP: TDataSetProvider;
    cdsVendaP: TClientDataSet;
    dsVendaP: TDataSource;
    qrVendaP: TIBQuery;
    cdsVendaPGRUPO_PROD: TIntegerField;
    cdsVendaPCOD_PROD: TStringField;
    cdsVendaPCODIGO_VP: TIntegerField;
    cdsVendaPDATA_VNP: TDateTimeField;
    cdsVendaPCOD_EMPRESA: TIntegerField;
    cdsVendaPCOD_VENDEDOR: TIntegerField;
    cdsVendaPQUANT_PROD_VP: TFloatField;
    cdsVendaPATIVO: TIntegerField;
    dspTipVP: TDataSetProvider;
    cdsTipVP: TClientDataSet;
    dsTipVP: TDataSource;
    qrTipVp: TIBQuery;
    qrColaborador: TIBQuery;
    dspColaborador: TDataSetProvider;
    cdsColaborador: TClientDataSet;
    dsColaborador: TDataSource;
    dspProd: TDataSetProvider;
    qrProd: TIBQuery;
    cdsProd: TClientDataSet;
    DataSource1: TDataSource;
    dspBarra: TDataSetProvider;
    qrBarra: TIBQuery;
    cdsBarra: TClientDataSet;
    DataSource2: TDataSource;
    cdsColaboradorNOME_VENDEDOR: TStringField;
    cdsColaboradorCOD_VENDEDOR: TIntegerField;
    cdsBarraGRUPO_PROD: TIntegerField;
    cdsBarraCOD_PROD: TStringField;
    cdsProdGRUPO_PROD: TIntegerField;
    cdsProdCOD_PROD: TStringField;
    cdsProdNUM_FAB_PROD: TStringField;
    dspLocTpVp: TDataSetProvider;
    cdsLocTpVp: TClientDataSet;
    dsLocTpVp: TDataSource;
    qrLocTpVP: TIBQuery;
    cdsLocTpVpCODIGO_VP: TIntegerField;
    cdsLocTpVpDESCRICAO_VP: TStringField;
    cdsTipVPCODIGO_VP: TIntegerField;
    cdsTipVPCOD_EMPRESA: TIntegerField;
    cdsTipVPDESCRICAO_VP: TStringField;
    cdsTipVPENT_SUG_VP: TStringField;
    cdsTipVPBX_ENTR_NFE: TStringField;
    cdsTipVPATIVO: TIntegerField;
    transacao2: TIBTransaction;
    cdsProdDESCR_PROD: TStringField;
    cdsProdCONSUMO: TStringField;
    qrCliVP: TIBQuery;
    dspCliVP: TDataSetProvider;
    cdsCliVP: TClientDataSet;
    dsCliVP: TDataSource;
    cdsCliVPCOD_CLIENTE: TIntegerField;
    cdsCliVPNOME_CLIENTE: TStringField;
    cdsVendaPCOD_CLIENTE: TIntegerField;
    cdsVendaPNOME_CLIENTE: TStringField;
    cdsVendaPSEQVP: TIntegerField;
    cdsVendaPCOD_SERVICO: TIntegerField;
    cdsVendaPTIPOVP: TStringField;
    cdsProdCODIGO_NOP: TFloatField;
    cdsProdPREC_TAB_PROD: TFloatField;
    cdsProdPREC_PUBLICO: TFloatField;
    cdsProdUNIDADE: TStringField;
    cdsProdMARCA_P: TStringField;
    cdsProdNBM: TStringField;
    cdsProdCST_PROD: TStringField;
    cdsProdICM_PROD: TFloatField;
    cdsProdEM_PROMOCAO: TStringField;
    cdsProdPRECO_PROMOCAO: TFloatField;
    cdsProdPREC_30_PROD: TFloatField;
    cdsProdPREC_60_PROD: TFloatField;
    cdsProdPREC_90_PROD: TFloatField;
    cdsProdDESCR_PROD_RED: TStringField;
    cdsProdESTOQUE_DISPONIVEL: TFloatField;
    cdsProdESTOQUE_PRODUZIR: TFloatField;
    procedure cdsVendaPBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVendaPerdida: TdtmVendaPerdida;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmVendaPerdida.cdsVendaPBeforeOpen(DataSet: TDataSet);
begin
 dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmVendaPerdida.DataModuleCreate(Sender: TObject);
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
