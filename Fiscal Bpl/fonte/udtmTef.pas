unit uDtmTef;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBCustomDataSet, IBQuery,
  IBDatabase,uDadosIni;

type
  TdtmTef = class(TDataModule)
    transacaoFiscal: TIBTransaction;
    qrTransTef: TIBQuery;
    dspTransTef: TDataSetProvider;
    cdsTransTef: TClientDataSet;
    dsTransTef: TDataSource;
    qrBuscas: TIBQuery;
    cdsTransTefDATATRANS: TStringField;
    cdsTransTefNSUTRANS: TStringField;
    cdsTransTefVALOR: TStringField;
    cdsTransTefHORA: TStringField;
    cdsTransTefREDETRANS: TStringField;
    cdsTransTefFINALIZACAO: TStringField;
    cdsTransTefDOCVINCULADO: TIntegerField;
    cdsTransTefTEFNAOCONFIRMADO: TStringField;
    cdsTransTefTIPOCONFIRMACAO: TStringField;
    qrTransacoes: TIBQuery;
    dspTransacoes: TDataSetProvider;
    cdsTransacoes: TClientDataSet;
    dsTransacoes: TDataSource;
    cdsTransacoesSEQID: TIntegerField;
    cdsTransacoesCOD_EMPRESA: TIntegerField;
    cdsTransacoesNUM_DOC: TStringField;
    cdsTransacoesVALOR_TOTAL: TFloatField;
    cdsTransacoesMOEDA: TStringField;
    cdsTransacoesSTATUS_TRANSACAO: TStringField;
    cdsTransacoesNOME_REDE: TStringField;
    cdsTransacoesTIPO_TRANSACAO: TStringField;
    cdsTransacoesNSU: TStringField;
    cdsTransacoesNUM_AUT: TStringField;
    cdsTransacoesDATA_HORA_HOST_TR: TDateTimeField;
    cdsTransacoesDATA_HORA_LOCAL_TR: TDateTimeField;
    cdsTransacoesQTDE_PARCELAS: TSmallintField;
    cdsTransacoesDATA_TRANSACAO: TDateTimeField;
    cdsTransacoesHORA_TRANSACAO: TStringField;
    cdsTransacoesNUMERO_CONTROLE: TStringField;
    cdsTransacoesBANDEIRA_CARTAO: TStringField;
    procedure cdsTransTefBeforeOpen(DataSet: TDataSet);
  private
    procedure mudaSelect(DataSet: TClientDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmTef: TdtmTef;

implementation

uses uDtmAtivo;

{$R *.dfm}


procedure TdtmTef.cdsTransTefBeforeOpen(DataSet: TDataSet);
begin
  mudaSelect(TClientDataSet(DataSet));
end;

procedure Tdtmtef.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to dtmTef.ComponentCount - 1 do
    begin
      if (dtmTef.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(dtmTef.Components[i]).Name) =
          UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(dtmTef.Components[i]).DataSet).SQL.Text :=
            DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;
end.
