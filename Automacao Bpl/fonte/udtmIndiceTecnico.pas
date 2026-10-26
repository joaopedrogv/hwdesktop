unit udtmIndiceTecnico;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, Provider,
  DBClient;

type
  TdtmIndice = class(TDataModule)
    IBTransIndiceTec: TIBTransaction;
    qrBuscas: TIBQuery;
    dspIndiceTec: TDataSetProvider;
    qrIndiceTec: TIBQuery;
    dsIndiceTec: TDataSource;
    cdsIndiceTec: TClientDataSet;
    qrProduto: TIBQuery;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    cdsIndiceTecGRUPO_PROD_ACABADO: TIntegerField;
    cdsIndiceTecCOD_PROD_ACABADO: TStringField;
    cdsIndiceTecGRUPO_PROD_MPRIMA: TIntegerField;
    cdsIndiceTecCOD_PROD_MPRIMA: TStringField;
    cdsIndiceTecQUANT: TFloatField;
    cdsIndiceTecCOD_EMPRESA: TIntegerField;
    qrBuscas02: TIBQuery;
    cdsIndiceTecDESCR_PROD: TStringField;
    qrIndiceTecGRUPO_PROD_ACABADO: TIntegerField;
    qrIndiceTecCOD_PROD_ACABADO: TIBStringField;
    qrIndiceTecGRUPO_PROD_MPRIMA: TIntegerField;
    qrIndiceTecCOD_PROD_MPRIMA: TIBStringField;
    qrIndiceTecCOD_EMPRESA: TIntegerField;
    qrIndiceTecQUANT: TFloatField;
    qrIndiceTecDESCR_PROD: TIBStringField;
    procedure cdsIndiceTecBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmIndice: TdtmIndice;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TdtmIndice.cdsIndiceTecBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), dtmIndice);
end;

end.
