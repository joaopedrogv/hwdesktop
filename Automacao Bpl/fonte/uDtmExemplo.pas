unit uDtmExemplo;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBDatabase, IBCustomDataSet,
  IBQuery;

type
  TdtmExemplo = class(TDataModule)
    dspFornec: TDataSetProvider;
    cdsFornec: TClientDataSet;
    dsFornec: TDataSource;
    DataSetProvider2: TDataSetProvider;
    cdsColunas: TClientDataSet;
    qrFornec: TIBQuery;
    IBQuery2: TIBQuery;
    IBTransaction1: TIBTransaction;
    cdsColunasUSUARIO: TStringField;
    cdsColunasCOMPONENTE: TStringField;
    cdsColunasCAMPOS: TStringField;
    cdsColunasVISIVEL: TIntegerField;
    cdsColunasORDEM: TIntegerField;
    IBTransaction2: TIBTransaction;
    cdsFornecCODIGO_F: TIntegerField;
    cdsFornecCOD_EMPRESA: TIntegerField;
    cdsFornecCODIGO_T_F: TIntegerField;
    cdsFornecCODIGO_UF: TIntegerField;
    cdsFornecGRUPO_PROD: TIntegerField;
    cdsFornecCOD_PROD: TStringField;
    cdsFornecCPF_CGC_F: TStringField;
    cdsFornecNOME: TStringField;
    cdsFornecIE_F: TStringField;
    cdsFornecEND_F: TStringField;
    cdsFornecBAIRF: TStringField;
    cdsFornecCIDA_F: TStringField;
    cdsFornecCEP_F: TStringField;
    cdsFornecFONE_F: TStringField;
    cdsFornecRAMAL_F: TStringField;
    cdsFornecCONTATO_F: TStringField;
    cdsFornecTEL_RES_CF: TStringField;
    cdsFornecOBS_F: TMemoField;
    cdsFornecINSC_SUB_F: TStringField;
    cdsFornecEMAIL_F: TStringField;
    cdsFornecFAX_F: TStringField;
    cdsFornecDATA_CADASTRO: TDateTimeField;
    cdsFornecCOD_CIDADE: TSmallintField;
    cdsFornecCOD_BAIRRO: TSmallintField;
    cdsFornecCDMICROEPP: TStringField;
    cdsFornecATIVO: TIntegerField;
    procedure cdsFornecBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmExemplo: TdtmExemplo;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmExemplo.cdsFornecBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),Self);
end;

procedure TdtmExemplo.DataModuleCreate(Sender: TObject);
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
