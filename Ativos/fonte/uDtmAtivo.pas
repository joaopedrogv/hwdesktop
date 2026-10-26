unit uDtmAtivo;

interface

uses
  SysUtils, Classes, DB, IBDatabase, uDadosIni, DBClient, IBCustomDataSet,
  IBQuery, Provider, QRXMLSFilt, QRExport, QRWebFilt, QRPDFFilt, AppEvnts,
  dialogs, hw_const_types;

type
  TdtmAtivo = class(TDataModule)
    bancoHw: TIBDatabase;
    bancoHwF: TIBDatabase;
    bancoFiscal: TIBDatabase;
    BancoCCIA: TIBDatabase;
    DspConfigColunas: TDataSetProvider;
    CdsConfigColunas: TClientDataSet;
    CdsConfigColunasUSUARIO: TStringField;
    CdsConfigColunasCOMPONENTE: TStringField;
    CdsConfigColunasCAMPOS: TStringField;
    CdsConfigColunasVISIVEL: TIntegerField;
    CdsConfigColunasORDEM: TIntegerField;
    IbConfigColunas: TIBQuery;
    IbTransCol: TIBTransaction;
    QRRTFFilter1: TQRRTFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRTextFilter1: TQRTextFilter;
    QRXMLSFilter1: TQRXMLSFilter;
    BancoHWCX: TIBDatabase;
    ApplicationEventos: TApplicationEvents;
    IbBuscas: TIBQuery;
    CdsConfigColunasLARGURA_EXIBICAO: TIntegerField;
    BancoAuditoria: TIBDatabase;
    transacaoQueryHwauto: TIBTransaction;
    queryHwauto: TIBQuery;
    queryFuso: TIBQuery;
    qrAudit: TIBQuery;
    transacaoAudit: TIBTransaction;
    procedure CdsConfigColunasBeforeOpen(DataSet: TDataSet);
    procedure ApplicationEventosException(Sender: TObject; E: Exception);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure mudaSelect(DataSet: TClientDataSet; dtModule:TDataModule);
  end;

var
  dtmAtivo: TdtmAtivo;
  vDadosIni: TSingleton;

implementation

uses
  hw_utils, hw_grid_utils;

{$R *.dfm}   

procedure LiberarDTM;
begin
  if Assigned(dtmAtivo) then
    FreeAndNil(dtmAtivo);

  GridHandlerSingleton.ReleaseInstance();

  vDadosIni.ReleaseInstance();
end;

exports
  LiberarDTM;

procedure TdtmAtivo.ApplicationEventosException(Sender: TObject; E: Exception);
begin

  if E is ValidacaoException then
    ShowErro( e.Message )
  else
  begin
    ShowErro( E.Message );

    vDadosIni.registraErro(vdadosini.vSistema + ' ' + E.Message);
  end;
end;

procedure TdtmAtivo.CdsConfigColunasBeforeOpen(DataSet: TDataSet);
begin
  mudaSelect(TClientDataSet(DataSet), Self);
end;

procedure TdtmAtivo.DataModuleCreate(Sender: TObject);
begin
  vDadosIni :=  TSingleton.GetInstance;
  vDadosIni.queryHwAuto := queryHwauto;
  vDadosIni.dataSetCol:=TClientDataSet(CdsConfigColunas);
  vDadosIni.transacaoCol:=TIBTransaction(IbTransCol);
  vDadosIni.FusoInit(queryFuso);

end;

procedure TdtmAtivo.mudaSelect(DataSet: TClientDataSet; dtModule: TDataModule);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to dtModule.ComponentCount - 1 do
    begin
      if (dtModule.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(dtModule.Components[i]).Name) =
          UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(dtModule.Components[i]).DataSet).SQL.Text :=
            DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

end.
