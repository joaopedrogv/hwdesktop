unit uDtmAlmoxarifado;

interface

uses
  SysUtils, Classes, IBStoredProc, IBDatabase, IBCustomDataSet, IBQuery, DB,
  DBClient, Provider;

type
  TdtmAlmoxarifado = class(TDataModule)
    dspAlmox: TDataSetProvider;
    cdsAlmox: TClientDataSet;
    qrAlmox: TIBQuery;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    SpIncCodigo: TIBStoredProc;
    cdsAlmoxNPED: TIntegerField;
    cdsAlmoxNUM_FAB_PROD: TStringField;
    cdsAlmoxDESCR_PROD_PED: TStringField;
    cdsAlmoxLOCACAO_PROD: TStringField;
    cdsAlmoxLOCACAO_PROD_1: TStringField;
    cdsAlmoxSIT_ATD: TStringField;
    cdsAlmoxDATA_ATD: TDateTimeField;
    cdsAlmoxHORA_ATD: TStringField;
    cdsAlmoxQUANT_PED_ITEM: TFloatField;
    cdsAlmoxGRUPO_PROD: TIntegerField;
    cdsAlmoxCOD_PROD: TStringField;
    cdsAlmoxSTATUS_PED: TStringField;
    cdsAlmoxEST_F: TFloatField;
    qrRelMovProd: TIBQuery;
    qrRelMovProdGRUP_COD: TIBStringField;
    qrRelMovProdNUM_FAB_PROD: TIBStringField;
    qrRelMovProdDESCR_PROD_PED: TIBStringField;
    qrRelMovProdLOCACAO_PROD: TIBStringField;
    qrRelMovProdLOCACAO_PROD_1: TIBStringField;
    qrRelMovProdGRUPO_PROD: TIntegerField;
    qrRelMovProdCOD_PROD: TIBStringField;
    qrRelMovProdATEND: TFloatField;
    qrRelMovProdNAOATEND: TFloatField;
    qrRelMovProdCOMPRAS: TFloatField;
    qrRelMovProdEST_F: TFloatField;
    qrRelMovProdEST_R: TFloatField;
    qrRelMovProdPEND: TFloatField;
    qrRelRelaAten: TIBQuery;
    qrRelRelaAtenTIPO: TIBStringField;
    qrRelRelaAtenNUM_FAB_PROD: TIBStringField;
    qrRelRelaAtenDESCR_PROD_PED: TIBStringField;
    qrRelRelaAtenGRUPO_PROD: TIntegerField;
    qrRelRelaAtenCOD_PROD: TIBStringField;
    qrRelRelaAtenQUANT_PED_ITEM: TFloatField;
    qrRelRelaAtenSIT_ATD: TIBStringField;
    qrRelRelaAtenDATA_ATD: TDateTimeField;
    qrRelRelaAtenHORA_ATD: TIBStringField;
    qrRelRelaAtenNPED: TIntegerField;
    qrRelRelaAtenNOME_VENDEDOR: TIBStringField;
    qrRelRelaAtenLOCACAO_PROD: TIBStringField;
    qrRelRelaAtenLOCACAO_PROD_1: TIBStringField;
    dsAlmox: TDataSource;
    cdsAlmoxSTAT_REQ: TStringField;
    cdsAlmoxTIPO: TStringField;
    cdsAlmoxNITEM: TIntegerField;
    qrBuscas2: TIBQuery;
    procedure cdsAlmoxBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmAlmoxarifado: TdtmAlmoxarifado;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmAlmoxarifado.cdsAlmoxBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmAlmoxarifado.DataModuleCreate(Sender: TObject);
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
