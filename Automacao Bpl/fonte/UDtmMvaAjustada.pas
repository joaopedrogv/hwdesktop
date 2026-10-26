unit UDtmMvaAjustada;

interface

uses
  SysUtils, Classes, IBDatabase, IBCustomDataSet, IBQuery, DB, Provider,
  DBClient;

type
  TdtmMvaAjustada = class(TDataModule)
    cdsMvaAjustada: TClientDataSet;
    dspMvaAjustada: TDataSetProvider;
    dsMvaAjustada: TDataSource;
    qrMvaAjustada: TIBQuery;
    IBTransMvaAjustada: TIBTransaction;
    dsUF: TDataSource;
    qrUF: TIBQuery;
    cdsMvaAjustadaCOD_NCM: TStringField;
    cdsMvaAjustadaCODIGO_UF: TIntegerField;
    cdsMvaAjustadaALIQ_INTER: TFloatField;
    cdsMvaAjustadaALIQ_INTRA: TFloatField;
    cdsMvaAjustadaMVA_ST_ORIGINAL: TFloatField;
    cdsMvaAjustadaMVA_AJUSTADA: TFloatField;
    qrBuscas: TIBQuery;
    qrUFCODIGO_UF: TIntegerField;
    qrUFNOME_UF: TIBStringField;
    qrUFSIGLA_UF: TIBStringField;
    qrUFATIVO: TIntegerField;
    qrUFIBGE_CODIGO_UF: TIntegerField;
    procedure cdsMvaAjustadaBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMvaAjustada: TdtmMvaAjustada;

implementation

uses uDtmAtivo;



{$R *.dfm}

procedure TdtmMvaAjustada.cdsMvaAjustadaBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmMvaAjustada);
end;

procedure TdtmMvaAjustada.DataModuleCreate(Sender: TObject);
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
