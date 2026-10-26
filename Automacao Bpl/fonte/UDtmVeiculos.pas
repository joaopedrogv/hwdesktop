unit UDtmVeiculos;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBCustomDataSet, IBQuery,
  IBDatabase, RDprint, IBStoredProc;

type
  TDtmVeiculos = class(TDataModule)
    IBTransVeiculos: TIBTransaction;
    qrVeiculos: TIBQuery;
    qrBuscasV: TIBQuery;
    dspVeiculos: TDataSetProvider;
    CdsVeiculos: TClientDataSet;
    dsVeiculos: TDataSource;
    CdsVeiculosPLACA: TStringField;
    CdsVeiculosCHASSI: TStringField;
    CdsVeiculosCODIGO: TIntegerField;
    CdsVeiculosCOD_EMPRESA: TIntegerField;
    CdsVeiculosCOD_CLIENTE: TIntegerField;
    CdsVeiculosESPECIE: TStringField;
    CdsVeiculosMARCA_V: TStringField;
    CdsVeiculosMODELO: TIntegerField;
    CdsVeiculosDESCMODELO: TStringField;
    CdsVeiculosMOTOR: TStringField;
    CdsVeiculosCOR: TStringField;
    CdsVeiculosANOFAB: TIntegerField;
    CdsVeiculosANOMOD: TIntegerField;
    CdsVeiculosCILINDROS: TIntegerField;
    CdsVeiculosCOMBUSTIVEL: TStringField;
    CdsVeiculosCILINDRADA: TFloatField;
    CdsVeiculosLOTACAO: TStringField;
    CdsVeiculosDATA_VENDA: TDateTimeField;
    CdsVeiculosOBS: TStringField;
    CdsVeiculosDATA_CAD: TDateTimeField;
    CdsVeiculosUS_CAD: TIntegerField;
    CdsVeiculosHP: TFloatField;
    CdsVeiculosATIVO: TIntegerField;
    CdsVeiculosCOD_ESPE_SEG: TIntegerField;
    RdpCadastros: TRDprint;
    SpIncCodigoV: TIBStoredProc;
    qrModVeiculos: TIBQuery;
    qrBuscasMV: TIBQuery;
    dspModVeiculos: TDataSetProvider;
    cdsModVeiculos: TClientDataSet;
    dsModVeiculos: TDataSource;
    IBTransModVeiculos: TIBTransaction;
    qrTabelaFipe: TIBQuery;
    dsTabelaFipe: TDataSource;
    cdsModVeiculosCODIGO: TIntegerField;
    cdsModVeiculosCOD_EMPRESA: TIntegerField;
    cdsModVeiculosDESCRICAO: TStringField;
    cdsModVeiculosCILINDRADA: TIntegerField;
    cdsModVeiculosCODIGOFAB: TStringField;
    cdsModVeiculosCILINDROS: TIntegerField;
    cdsModVeiculosCOMBUSTIVEL: TStringField;
    cdsModVeiculosHP: TFloatField;
    cdsModVeiculosLOTACAO: TStringField;
    cdsModVeiculosTIPO: TStringField;
    cdsModVeiculosRENAVAM: TStringField;
    cdsModVeiculosAFATURAR: TIntegerField;
    cdsModVeiculosVNDESTOQUE: TStringField;
    cdsModVeiculosVALTAB: TFloatField;
    cdsModVeiculosVLBICMSUB: TFloatField;
    cdsModVeiculosVLICMSUB: TFloatField;
    cdsModVeiculosANO1: TIntegerField;
    cdsModVeiculosMODELO1: TIntegerField;
    cdsModVeiculosINICHASSI1: TStringField;
    cdsModVeiculosANO2: TIntegerField;
    cdsModVeiculosMODELO2: TIntegerField;
    cdsModVeiculosINICHASSI2: TStringField;
    cdsModVeiculosORDTIPO: TIntegerField;
    cdsModVeiculosPISCOFINS: TFloatField;
    cdsModVeiculosCOD_FIPE: TStringField;
    cdsModVeiculosATIVO: TIntegerField;
    cdsModVeiculosNOME_PLAN: TStringField;
    qrTabelaFipeCOD_FIPE: TIBStringField;
    qrTabelaFipeMARCA_MOD: TIBStringField;
    qrTabelaFipeDESC_MOD: TIBStringField;
    qrTabelaFipeATIVO: TIntegerField;
    SpIncCodigoMV: TIBStoredProc;
    qrLocClientes: TIBQuery;
    dsLocClientes: TDataSource;
    qrLocClientesCOD_CLIENTE: TIntegerField;
    qrLocClientesNOME_CLIENTE: TIBStringField;
    qrEspecieVeiculo: TIBQuery;
    dsEspecieVeiculo: TDataSource;
    qrEspecieVeiculoCODIGO_ESP: TIntegerField;
    qrEspecieVeiculoDESCRICAO_ESP: TIBStringField;
    qrEspecieVeiculoOBSERVACAO_ESP: TIBStringField;
    qrLocColaborador: TIBQuery;
    dsLocColaborador: TDataSource;
    qrLocColaboradorCOD_VENDEDOR: TIntegerField;
    qrLocColaboradorNOME_VENDEDOR: TIBStringField;
    qrLocModV: TIBQuery;
    dspLocModV: TDataSetProvider;
    cdsLocModVeiculos: TClientDataSet;
    dsLocModV: TDataSource;
    cdsLocModVeiculosCODIGO: TIntegerField;
    cdsLocModVeiculosDESCRICAO: TStringField;
    cdsModVeiculosTIP_VEICULO: TStringField;
    cdsModVeiculosCMKG: TStringField;
    cdsModVeiculosDISTANCIAEIXO: TStringField;
    cdsModVeiculosPESOL: TIntegerField;
    cdsModVeiculosPESOB: TIntegerField;
    cdsModVeiculosVL_UNITARIO_NF: TFloatField;
    cdsModVeiculosESPRENAVAM: TStringField;
    cdsModVeiculosNCMSH: TStringField;
    cdsModVeiculosTPCOMB: TStringField;
    cdsModVeiculosVALOR_PIS: TFloatField;
    cdsModVeiculosVALOR_COFINS: TFloatField;
    cdsModVeiculosURL_HONDA: TStringField;
    qrAbreTPComb: TIBQuery;
    qrAbreTPCombCODIGO_TPCOMB: TIntegerField;
    qrAbreTPCombDESCR_COMB: TIBStringField;
    IBTransPesquisa: TIBTransaction;
    dsLocTPComb: TDataSource;
    cdsModVeiculosSITE: TStringField;
    cdsModVeiculosMES_RET_SERV1: TIntegerField;
    cdsModVeiculosKM_RET_SERV1: TIntegerField;
    cdsModVeiculosMES_RET_SERV3: TIntegerField;
    cdsModVeiculosKM_RET_SERV3: TIntegerField;
    cdsModVeiculosINTERV_KM_SERV: TIntegerField;
    cdsModVeiculosMARCA_DESC: TStringField;
    cdsModVeiculosCOD_CTA_EST_VEIC: TStringField;
    cdsModVeiculosCOD_CTA_EST_SEMI: TStringField;
    CdsVeiculosTIPO_OS: TStringField;
    cdsModVeiculosDESFAB: TStringField;
    qrTabPrecoVeic: TIBQuery;
    dspTabPrecoVeic: TDataSetProvider;
    cdsTabPrecoVeic: TClientDataSet;
    cdsTabPrecoVeicCOD_VEICULO: TIntegerField;
    cdsTabPrecoVeicANO_FAB: TIntegerField;
    cdsTabPrecoVeicANO_MOD: TIntegerField;
    cdsTabPrecoVeicCOD_EMPRESA: TIntegerField;
    cdsTabPrecoVeicPREC_TAB: TFloatField;
    cdsTabPrecoVeicPREC_MIN: TFloatField;
    cdsTabPrecoVeicATIVO: TIntegerField;
    dsTabPrecoVeic: TDataSource;
    qrModVCorF: TIBQuery;
    dspModVCorF: TDataSetProvider;
    cdsModVCorF: TClientDataSet;
    dsModVCorF: TDataSource;
    cdsModVCorFCODIGO: TIntegerField;
    cdsModVCorFCOD_EMPRESA: TIntegerField;
    cdsModVCorFCODIGO_FAB: TStringField;
    cdsModVCorFDATA_CAD: TDateTimeField;
    CdsVeiculosRENAVAM: TStringField;
    qrServicosSugeridos: TIBQuery;
    dspServicosSugeridos: TDataSetProvider;
    cdsServicosSugeridos: TClientDataSet;
    StringField143: TStringField;
    cdsServicosSugeridosCODIGO: TIntegerField;
    cdsServicosSugeridosDESCRICAO: TStringField;
    dsServicosSugeridos: TDataSource;
    CdsVeiculosKM_V: TIntegerField;
    cdsServicosSugeridosMES_RET_SERV1: TIntegerField;
    cdsServicosSugeridosMES_RET_SERV2: TIntegerField;
    cdsServicosSugeridosINTERV_MES_SERV: TIntegerField;
    cdsServicosSugeridosKM_RET_SERV1: TIntegerField;
    cdsServicosSugeridosKM_RET_SERV2: TIntegerField;
    cdsServicosSugeridosINTERV_KM_SERV: TIntegerField;
    CdsVeiculosNOME_CLIENTE: TStringField;
    CdsVeiculosRAZAO: TStringField;
    CdsVeiculosENDERECO: TStringField;
    CdsVeiculosFONE_CLIENTE: TStringField;
    CdsVeiculosFONE_CELULAR: TStringField;
    CdsVeiculosEMAIL: TStringField;
    CdsVeiculosNOME_CIDADE: TStringField;
    CdsVeiculosLOCALIDADE: TStringField;
    CdsVeiculosSETOR: TStringField;
    CdsVeiculosSIGLA_UF: TStringField;
    CdsVeiculosNOME_BAIRRO: TStringField;
    CdsVeiculosCEP: TStringField;
    CdsVeiculosNUM_END_CLIENTE: TStringField;
    CdsVeiculosSEL: TStringField;
    cdsModVeiculosSEL: TStringField;
    procedure CdsVeiculosBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmVeiculos: TDtmVeiculos;

implementation
uses uDtmAtivo;

{$R *.dfm}


procedure TDtmVeiculos.CdsVeiculosBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmVeiculos.DataModuleCreate(Sender: TObject);
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
