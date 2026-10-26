unit uDtmAssistente;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBStoredProc, DBClient, Provider,
  IBCustomDataSet, IBQuery;

type
  TdtmAssistente = class(TDataModule)
    qrF: TIBQuery;
    dspF: TDataSetProvider;
    cdsF: TClientDataSet;
    dsF: TDataSource;
    transHw: TIBTransaction;
    SpIncCodigo: TIBStoredProc;
    qrBuscas: TIBQuery;
    bdF: TIBDatabase;
    bdHw: TIBDatabase;
    transF: TIBTransaction;
    qrHw: TIBQuery;
    dspHw: TDataSetProvider;
    cdsHw: TClientDataSet;
    dsHw: TDataSource;
    qrCNIEE: TIBQuery;
    dsCNIEE: TDataSource;
    qrCNIEEIDENTIFICACAO: TIBStringField;
    qrCNIEETIPO_ECF: TIBStringField;
    qrCNIEEMARCA_ECF: TIBStringField;
    qrCNIEEMODELO_ECF: TIBStringField;
    qrCNIEEVERSAOSB: TIBStringField;
    qrCNIEEQTDELACRESEXTSL: TIntegerField;
    qrCNIEEQTDELACRESEXTFAB: TIntegerField;
    qrCNIEETEMFD: TIBStringField;
    qrCNIEELACREMFD: TIBStringField;
    qrCNIEEATO_APROVACAO: TIBStringField;
    qrCNIEEATIVO: TIntegerField;
    procedure cdsFBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmAssistente: TdtmAssistente;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmAssistente.cdsFBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),Self);
end;

end.
