unit uDtmConfigF;

interface

uses
  SysUtils, Classes, IBDatabase, DB, Provider, IBCustomDataSet, IBQuery,
  DBClient, IBStoredProc, uCadastrosF, uDadosIni;

type
  TDtmConfigF = class(TDataModule)
    cdsConfImp: TClientDataSet;
    cdsConfImpNUM_SERIE_ECF: TStringField;
    cdsConfImpMODELO_IMPRESSORA: TStringField;
    cdsConfImpPORTA_IMPRESSORA: TSmallintField;
    cdsConfImpNUM_EQUIP: TStringField;
    cdsConfImpCOD_TERMINAL: TSmallintField;
    cdsConfImpQTDE_DIG_DAV: TSmallintField;
    cdsConfImpPORTA_LEITOR: TSmallintField;
    cdsConfImpQT_VIAS_NAOFISCAIS: TSmallintField;
    cdsConfImpOBSERVACAO_CUPOM: TStringField;
    cdsConfImpMODELO_BALANCA: TStringField;
    cdsConfImpCONTADOR_REINICIO: TIntegerField;
    cdsConfImpALIQ_ISS: TFloatField;
    cdsConfImpMAX_DESC_ITEM: TFloatField;
    cdsConfImpMODELO_DOCF: TStringField;
    cdsConfImpARREDONDAR_TRUNCAR: TStringField;
    cdsConfImpTECLADO_PDV: TStringField;
    cdsConfImpUSAR_TEF: TStringField;
    cdsConfImpLEITURA_SUP: TStringField;
    cdsConfImpVALOR_UNIT_3DIG: TStringField;
    cdsConfImpLEITURA_MEM_FISCAL: TStringField;
    cdsConfImpABRIR_GAVETA: TStringField;
    cdsConfImpUSAR_CODBARRA: TStringField;
    cdsConfImpCONFERIR_ESTOQUE: TStringField;
    cdsConfImpLEITOR_SERIAL: TStringField;
    cdsConfImpVERIFICAR_PAPEL: TStringField;
    cdsConfImpCOD_EMPRESA: TIntegerField;
    cdsFinaliz: TClientDataSet;
    cdsFinalizCOD_FINALIZADOR: TSmallintField;
    cdsFinalizDESCRICAO: TStringField;
    cdsFinalizVERIFICAR_DEBITO: TStringField;
    cdsFinalizVERIFICAR_CREDITO: TStringField;
    cdsFinalizTIPO_FINALIZADOR: TSmallintField;
    cdsFinalizTECLA_PDV: TSmallintField;
    cdsFinalizCOD_EMPRESA: TIntegerField;
    cdsProcessos: TClientDataSet;
    cdsProcessosCOD_PROCESSO: TStringField;
    cdsProcessosCOD_EMPRESA: TIntegerField;
    cdsProcessosNOME_PROCESSO: TStringField;
    cdsProcessosNIVEL_PROCESSO: TIntegerField;
    cdsProcessosFORM: TStringField;
    cdsProcessosSENHA_GERENTE: TStringField;
    cdsTeclado: TClientDataSet;
    cdsTecladoTECLA: TIntegerField;
    cdsTecladoPROCESSO: TIntegerField;
    cdsTecladoDESCRICAO: TStringField;
    qrProcesso: TIBQuery;
    qrTeclado: TIBQuery;
    qrFinaliz: TIBQuery;
    qrConfImp: TIBQuery;
    dspProcesso: TDataSetProvider;
    dsProcesso: TDataSource;
    dspTeclado: TDataSetProvider;
    dsTeclado: TDataSource;
    dspFinaliz: TDataSetProvider;
    dsFinaliz: TDataSource;
    dspConfImp: TDataSetProvider;
    dsConfImp: TDataSource;
    transacaoFiscal: TIBTransaction;
    qrBuscas: TIBQuery;
    SpIncCodigo: TIBStoredProc;
    cdsConfImpDIAABERTO: TDateTimeField;
    cdsConfImpDIAFECHADO: TDateTimeField;
    cdsConfImpUSPOLPREC: TStringField;
    cdsAliquota: TClientDataSet;
    qrAliquota: TIBQuery;
    dspAliquota: TDataSetProvider;
    dsAliquota: TDataSource;
    cdsAliquotaSEQUENCIA: TStringField;
    cdsAliquotaALIQ: TFloatField;
    cdsAliquotaCOD_TERMINAL: TIntegerField;
    cdsAliquotaCOD_EMPRESA: TIntegerField;
    cdsAliquotaSERVICO: TStringField;
    cdsAliquotaNSERIEECF: TStringField;
    cdsConfImpVALOR_GT: TStringField;
    cdsAliquotaINDICE: TIntegerField;
    cdsFinalizCOD_TERMINAL: TIntegerField;
    cdsFinalizNSERIEECF: TStringField;
    cdsConfImpENDERECO_HWF: TStringField;
    cdsConfImpDATA_HWF: TDateTimeField;
    cdsFinalizPRAZO: TStringField;
    cdsConfImpUSAR_MOV_OP: TStringField;
    cdsConfImpIMPRIMIR_DAV_ECF: TStringField;
    cdsConfImpTAB_PRECO_AD: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsConfImpBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure mudaSelect(DataSet: TClientDataSet);
  public
    { Public declarations }
  end;

var
  DtmConfigF: TDtmConfigF;

implementation

uses uDtmAtivo;

{$R *.dfm}

{ TDtmFiscal }

procedure TDtmConfigF.cdsConfImpBeforeOpen(DataSet: TDataSet);
begin
  mudaSelect(TClientDataSet(DataSet));
end;

procedure TDtmConfigF.DataModuleCreate(Sender: TObject);
begin
   vDadosIni := TSingleton.GetInstance;
end;

procedure TDtmConfigF.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to DtmConfigF.ComponentCount - 1 do
    begin
      if (DtmConfigF.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(DtmConfigF.Components[i]).Name) =
          UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(DtmConfigF.Components[i]).DataSet).SQL.Text :=
            DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

end.
