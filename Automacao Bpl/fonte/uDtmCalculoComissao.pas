unit uDtmCalculoComissao;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBQuery, IBDatabase,
  IBCustomDataSet, IBStoredProc;

type
  TdtmCalculoComissao = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    qrPerfCom: TIBQuery;
    dspPerfCom: TDataSetProvider;
    cdsPerfCom: TClientDataSet;
    dsPerfCom: TDataSource;
    cdsPerfComCODIGO_PERFIL: TIntegerField;
    cdsPerfComNOME_PERFIL: TStringField;
    cdsPerfComTIPO_PERFIL: TStringField;
    cdsPerfComABRANG_PERFIL: TStringField;
    cdsPerfComEM_CIMA_PERFIL: TStringField;
    cdsPerfComTIPO_SERV_PROD: TStringField;
    cdsPerfComFLAG_SERV_PROD: TStringField;
    cdsPerfComCONTEUDO_FLAG: TMemoField;
    cdsPerfComTABELAS_PERFIL: TMemoField;
    cdsPerfComDATA_CADASTRO: TDateTimeField;
    cdsPerfComPERC_PESO: TFloatField;
    cdsPerfComATIVO: TIntegerField;
    qrMetasCom: TIBQuery;
    dspMetasCom: TDataSetProvider;
    cdsMetasCom: TClientDataSet;
    dsMetasCom: TDataSource;
    cdsMetasComCODIGO_META: TIntegerField;
    cdsMetasComCOD_EMPRESA: TIntegerField;
    cdsMetasComDESCRICAO_META: TStringField;
    cdsMetasComVALOR_META: TFloatField;
    cdsMetasComVALOR_META1: TFloatField;
    cdsMetasComCOMISSAO_META: TFloatField;
    cdsMetasComMES_META: TIntegerField;
    cdsMetasComANO_META: TIntegerField;
    cdsMetasComTIPO_META: TStringField;
    cdsMetasComDATA_CADASTRO: TDateTimeField;
    cdsMetasComATIVO: TIntegerField;
    cdsMetasComCODIGO_PERFIL: TIntegerField;
    qrColabCom: TIBQuery;
    dspColabCom: TDataSetProvider;
    cdsColabCom: TClientDataSet;
    dsColabCom: TDataSource;
    cdsColabComCOD_VENDEDOR: TIntegerField;
    cdsColabComNOME_VENDEDOR: TStringField;
    cdsColabComCOD_FUNCAO: TIntegerField;
    cdsColabComPERC_PESO: TFloatField;
    cdsColabComCOD_DEPTO: TIntegerField;
    cdsCalcComissao: TClientDataSet;
    cdsCalcComissaoCODIGO_PERFIL: TStringField;
    cdsCalcComissaoVALORLIQMO: TFloatField;
    cdsCalcComissaoVALORLIQPC: TFloatField;
    cdsCalcComissaoVALORLUCROMO: TFloatField;
    cdsCalcComissaoVALORLUCROPC: TFloatField;
    cdsCalcComissaoVALORRECDIN: TFloatField;
    cdsCalcComissaoVALORRECPRAZO: TFloatField;
    cdsCalcComissaoVALORCOMISSPROD: TFloatField;
    cdsCalcComissaoABRANG_PERFIL: TStringField;
    cdsCalcComissaoTIPO_SERV_PROD: TStringField;
    cdsCalcComissaoEM_CIMA_PERFIL: TStringField;
    cdsCalcComissaoPERCENTUALMETA: TStringField;
    cdsCalcComissaoQTDEOSABERTAS: TStringField;
    cdsCalcComissaoVALORCOMISSAO: TFloatField;
    dsCalcComissao: TDataSource;
    cdsCalcComissaoNOME_PERFIL: TStringField;
    cdsCalcComissaoTIPO_PERFIL: TStringField;
    procedure cdsPerfComBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmCalculoComissao: TdtmCalculoComissao;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TdtmCalculoComissao.cdsPerfComBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmCalculoComissao);
end;

end.
