unit UdtmConsGeral;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, DBClient,
  Provider;

type
  TDtmConsGeral = class(TDataModule)
    IbDtbConsGeral: TIBDatabase;
    IbTransConsGeral: TIBTransaction;
    IbQueryGeral: TIBQuery;
    DspConsGeral: TDataSetProvider;
    CdsConsGeral: TClientDataSet;
    IbCadConsGeral: TIBQuery;
    QrBuscas: TIBQuery;
    DspcadconsGeral: TDataSetProvider;
    CdsCadConsGeral: TClientDataSet;
    IbSenhas: TIBQuery;
    Dtsenhas: TDataSource;
    IbSenhaVinc: TIBQuery;
    CdsSenhasVinc: TClientDataSet;
    DspSenhasvinc: TDataSetProvider;
    CdsSenhasVincCOD_CONSULTA: TIntegerField;
    CdsSenhasVincUSUARIO: TStringField;
    CdsSenhasVincCOD_USUARIO: TIntegerField;
    CdsSenhasVincCOD_EMPRESA: TIntegerField;
    DtSenhavinc: TDataSource;
    Qrbuscas1: TIBQuery;
    CdsConsultaus: TClientDataSet;
    CdsConsultausNOME_CAMPO: TStringField;
    CdsConsultausSEQINT: TIntegerField;
    CdsConsultausTIPO_CAMPO: TStringField;
    procedure CdsSenhasVincBeforeOpen(DataSet: TDataSet);
    procedure CdsConsGeralBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmConsGeral: TDtmConsGeral;

implementation

{$R *.dfm}

procedure TDtmConsGeral.CdsConsGeralBeforeOpen(DataSet: TDataSet);
begin
 IbQueryGeral.SQL.Text:=CdsConsGeral.CommandText;
end;

procedure TDtmConsGeral.CdsSenhasVincBeforeOpen(DataSet: TDataSet);
begin
  IbSenhaVinc.SQL.Text:=CdsSenhasVinc.CommandText;
end;

end.
