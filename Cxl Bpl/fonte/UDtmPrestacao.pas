unit UDtmPrestacao;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBCustomDataSet, IBQuery,
  uDadosIni, IBDatabase, IBStoredProc, RDprint;

type
  TDtmPrestacao = class(TDataModule)
    IBTransPrestacao: TIBTransaction;
    QrPendPrestacao: TIBQuery;
    CdsPendPrestacao: TClientDataSet;
    DspPendPrestacao: TDataSetProvider;
    CdsBuscas: TClientDataSet;
    DspBuscas: TDataSetProvider;
    QrBuscas: TIBQuery;
    DtPendPrestacao: TDataSource;
    CdsPendPrestacaoSELEC: TStringField;
    CdsPendPrestacaoCOD_CRED: TIntegerField;
    CdsPendPrestacaoN_DOC_C: TStringField;
    CdsPendPrestacaoCOD_CLIENTE: TIntegerField;
    CdsPendPrestacaoNOME_C: TStringField;
    CdsPendPrestacaoVALOR_C: TFloatField;
    CdsPendPrestacaoDATA_VENC_C: TDateTimeField;
    CdsPendPrestacaoVL_RQ_PG_CXL: TFloatField;
    CdsPendPrestacaoSTATUS_CXL_RQ: TStringField;
    CdsPendPrestacaoDIA_CXL: TDateTimeField;
    CdsPendPrestacaoOP_CXL: TIntegerField;
    CdsPendPrestacaoVALOR_CORR: TFloatField;
    CdsPendPrestacaoVALOR_DESC: TFloatField;
    CdsPendPrestacaoLOTE_CXL: TIntegerField;
    CdsPendPrestacaoTP_REC_CXL: TStringField;
    CdsPendPrestacaoCPFCGC: TStringField;
    CdsPendPrestacaoJUROS_COB: TFloatField;
    CdsPendPrestacaoTP_DOC_V: TStringField;
    CdsPendPrestacaoN_DOC_V: TIntegerField;
    CdsPendPrestacaoCODIGO_EMP: TIntegerField;
    CdsPendPrestacaoCOD_EMP_MULT: TIntegerField;
    CdsPendPrestacaoCODIGO_CTRL: TIntegerField;
    CdsPendPrestacaoCOONAOFISCAL: TIntegerField;
    CdsPendPrestacaoUS_CANCELOU: TStringField;
    CdsPendPrestacaoDT_US_CANCELOU: TDateTimeField;
    CdsPendPrestacaoOBS_PARACREDITO: TStringField;
    SpIncCodigoCxl: TIBStoredProc;
    RdImpRec: TRDprint;
    CdsPendPrestacaoCODIGO_VEND: TIntegerField;
    QrPendPrestacaoSELEC: TIBStringField;
    QrPendPrestacaoCOD_CRED: TIntegerField;
    QrPendPrestacaoN_DOC_C: TIBStringField;
    QrPendPrestacaoCOD_CLIENTE: TIntegerField;
    QrPendPrestacaoNOME_C: TIBStringField;
    QrPendPrestacaoVALOR_C: TFloatField;
    QrPendPrestacaoDATA_VENC_C: TDateTimeField;
    QrPendPrestacaoVL_RQ_PG_CXL: TFloatField;
    QrPendPrestacaoSTATUS_CXL_RQ: TIBStringField;
    QrPendPrestacaoDIA_CXL: TDateTimeField;
    QrPendPrestacaoOP_CXL: TIntegerField;
    QrPendPrestacaoVALOR_CORR: TFloatField;
    QrPendPrestacaoVALOR_DESC: TFloatField;
    QrPendPrestacaoLOTE_CXL: TIntegerField;
    QrPendPrestacaoTP_REC_CXL: TIBStringField;
    QrPendPrestacaoCPFCGC: TIBStringField;
    QrPendPrestacaoJUROS_COB: TFloatField;
    QrPendPrestacaoTP_DOC_V: TIBStringField;
    QrPendPrestacaoN_DOC_V: TIntegerField;
    QrPendPrestacaoCODIGO_EMP: TIntegerField;
    QrPendPrestacaoCOD_EMP_MULT: TIntegerField;
    QrPendPrestacaoCODIGO_CTRL: TIntegerField;
    QrPendPrestacaoCOONAOFISCAL: TIntegerField;
    QrPendPrestacaoUS_CANCELOU: TIBStringField;
    QrPendPrestacaoDT_US_CANCELOU: TDateTimeField;
    QrPendPrestacaoOBS_PARACREDITO: TIBStringField;
    QrPendPrestacaoCODIGO_VEND: TIntegerField;
    QrPendPrestacaoTIP_CNT: TIBStringField;
    QrPendPrestacaoNSERIEECF: TIBStringField;
    QrPendPrestacaoCOD_TERMINAL: TIntegerField;
    CdsPendPrestacaoTIP_CNT: TStringField;
    CdsPendPrestacaoNSERIEECF: TStringField;
    CdsPendPrestacaoCOD_TERMINAL: TIntegerField;
    CdsPendPrestacaoDIF: TStringField;
    CdsPendPrestacaoTIPO_DOC_C: TStringField;
    QrPendPrestacaoDATA_VENDA: TDateTimeField;
    QrPendPrestacaoTIPO_DOC_C: TStringField;
    CdsPendPrestacaoDATA_VENDA: TDateTimeField;
    QrPendPrestacaoVALOR_ACRESC: TFloatField;
    CdsPendPrestacaoVALOR_ACRESC: TFloatField;
    QrPendPrestacaoOP_CX: TIntegerField;
    CdsPendPrestacaoOP_CX: TIntegerField;
    CdsPendPrestacaoNOME_CTRL: TStringField;
    QrPendPrestacaoNOME_CTRL: TStringField;
    procedure CdsPendPrestacaoBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure mudaSelect(DataSet: TClientDataSet);
  public
    { Public declarations }
    function criaDtm: boolean;
  end;

var
  DtmPrestacao: TDtmPrestacao;

implementation

uses uDtmAtivo;

{$R *.dfm}

{ TDtmPrestacao }

procedure TDtmPrestacao.CdsPendPrestacaoBeforeOpen(DataSet: TDataSet);
begin
  mudaSelect(TClientDataSet(DataSet));
end;

function TDtmPrestacao.criaDtm: boolean;
begin

end;

procedure TDtmPrestacao.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to DtmPrestacao.ComponentCount - 1 do
    begin
      if (DtmPrestacao.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(DtmPrestacao.Components[i]).Name) = UpperCase(DataSet.ProviderName) then
        begin
          TIBQuery(TDataSetProvider(DtmPrestacao.Components[i]).DataSet).SQL.Text := DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

end.

