unit uDtmSincF;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase,
  Provider, DBClient;

type
  TdtmSincF = class(TDataModule)
    transacaoFiscal: TIBTransaction;
    qrBuscas: TIBQuery;
    cdsSincF: TClientDataSet;
    qrSincF: TIBQuery;
    dspSincF: TDataSetProvider;
    dsSincF: TDataSource;
    cdsSinc2F: TClientDataSet;
    qrSinc2F: TIBQuery;
    dspSinc2F: TDataSetProvider;
    dsSinc2F: TDataSource;
    transacaoBancoHw: TIBTransaction;
    qrBuscas2: TIBQuery;
    ibqrExec: TIBQuery;
    ibqrTemp: TIBQuery;
    ibqrTemp2: TIBQuery;
    ibqrTemp3: TIBQuery;
    procedure cdsSincFBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmSincF: TdtmSincF;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmSincF.cdsSincFBeforeOpen(DataSet: TDataSet);
begin
  DtmAtivo.mudaSelect(TClientDataSet(DataSet),Self);
end;

end.
