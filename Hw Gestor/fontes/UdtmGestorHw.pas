unit UdtmGestorHw;

interface

uses
  SysUtils, Classes, IBDatabase,uDtmAtivo, Provider, DBClient, DB,
  IBCustomDataSet, IBQuery, IBStoredProc, DBTables, RDprint;

type
  TDtmGestorHw = class(TDataModule)
    IbTransHwGestor: TIBTransaction;
    IbEmpresas: TIBQuery;
    CdsEmpresas: TClientDataSet;
    DspEmpresas: TDataSetProvider;
    QrBuscas: TIBQuery;
    IbDepto: TIBQuery;
    DspDepto: TDataSetProvider;
    CdsDpto: TClientDataSet;
    CdsDptoCOD_DEP: TIntegerField;
    CdsDptoDESC_DEP: TStringField;
    CdsDptoPERC_DEP: TFloatField;
    CdsDptoTP_DEP: TStringField;
    DtDepto: TDataSource;
    CdsDptoTIPOFAT: TStringField;
    CdsDptoTIPDEVDEP: TStringField;
    IbVendasGestor: TIBQuery;
    DspVendasGestor: TDataSetProvider;
    CdsVendasGestor: TClientDataSet;
    IbCubeGeral: TIBQuery;
    DtCubeGeral: TDataSource;
    IbMapaFinan: TIBQuery;
    DspMapaFinan: TDataSetProvider;
    CdsMapaFinan: TClientDataSet;
    IbControles: TIBQuery;
    DspControles: TDataSetProvider;
    CdsControles: TClientDataSet;
    IbCreditos: TIBQuery;
    DspCreditos: TDataSetProvider;
    CdsCreditos: TClientDataSet;
    CdsIndicadoresDRE: TClientDataSet;
    CdsIndicadoresDREMES: TIntegerField;
    CdsIndicadoresDREANO: TIntegerField;
    CdsIndicadoresDREVALOR: TFloatField;
    DsIndicadores: TDataSource;
    CdsIndicadoresDRETIPOINDICADORES: TStringField;
    CdsIndicadoresDRESequencia: TIntegerField;
    IbTiposRateio: TIBQuery;
    DtTiposRateio: TDataSource;
    CdsRateioMes: TClientDataSet;
    DtRateioMes: TDataSource;
    CdsRateioMesDEPARTOR: TStringField;
    CdsRateioMesDEPARTDEST: TStringField;
    CdsRateioMesTIPRAT: TStringField;
    CdsRateioMesMEDQTDRATFAT: TIntegerField;
    CdsRateioMesRATEM: TStringField;
    CdsRateioMesMES: TIntegerField;
    CdsRateioMesANO: TIntegerField;
    CdsRateioMesVALOROR: TCurrencyField;
    CdsRateioMesVALORDEST: TCurrencyField;
    CdsRateioMesPERCRAT: TFloatField;
    CdsRateioMesCOD_DEP: TIntegerField;
    CdsRateioMesCOD_DEPRAT: TIntegerField;
    CdsRateioMesValorDespDep: TCurrencyField;
    CdsRateioMesVALORRATEADO: TCurrencyField;
    IbApuracaoDep: TIBQuery;
    DspApuracaoDep: TDataSetProvider;
    CdsApuracaoDep: TClientDataSet;
    CdsApuracaoDepCOD_DEP: TIntegerField;
    CdsApuracaoDepMES: TIntegerField;
    CdsApuracaoDepANO: TIntegerField;
    CdsApuracaoDepTPDESP: TStringField;
    CdsApuracaoDepCOD_EMPRESA: TIntegerField;
    CdsApuracaoDepVALOR: TFloatField;
    CdsApuracaoDepPE: TFloatField;
    CdsApuracaoDepATIVO: TIntegerField;
    CdsApuracaoDepDNADEP: TStringField;
    CdsDadosBalanco: TClientDataSet;
    DspDadosBalanco: TDataSetProvider;
    IbDadosBalanco: TIBQuery;
    CdsDadosBalancoCODSEQ_BALANCO: TIntegerField;
    CdsDadosBalancoTIPO_BALANCO: TStringField;
    CdsDadosBalancoCODIGO_INT_BAL: TStringField;
    CdsDadosBalancoDESC_BALANCO: TStringField;
    CdsDadosBalancoATIVO: TIntegerField;
    CdsDadosBalancoSUBTIPO: TStringField;
    CdsDadosBalancoSINAL: TStringField;
    CdsDadosBalancoPRAZOINICIAL: TIntegerField;
    CdsDadosBalancoPRAZOFINAL: TIntegerField;
    IbBuscasBalanco: TIBQuery;
    CdsEstoques: TClientDataSet;
    DspEstoques: TDataSetProvider;
    IbEstoques: TIBQuery;
    CdsIndicesBalanco: TClientDataSet;
    IbIndicesBalanco: TIBQuery;
    DspIndicesBalanco: TDataSetProvider;
    CdsIndicesBalancoNOME_INDICE: TStringField;
    CdsIndicesBalancoMES: TIntegerField;
    CdsIndicesBalancoANO: TIntegerField;
    CdsIndicesBalancoCOD_EMPRESA: TIntegerField;
    CdsIndicesBalancoVALOR: TFloatField;
    DtIndicesBalanco: TDataSource;
    CdsApuracaoBalanco: TClientDataSet;
    DspApuracaoBalanco: TDataSetProvider;
    IBApuracaoBalanco: TIBQuery;
    CdsEstoqueHW: TClientDataSet;
    DspEstoqueHW: TDataSetProvider;
    IbEstoqueHw: TIBQuery;
    CdsCotacao: TClientDataSet;
    Dspcotacao: TDataSetProvider;
    IBCotacao: TIBQuery;
    SpIncCodigo: TIBStoredProc;
    CdsApuracaoDepDATACAD_AP: TDateTimeField;
    CdsApuracaoDepPERC_VALOR: TFloatField;
    CdsApuracaoDepVALOR_DINHEIRO: TFloatField;
    CdsApuracaoDepVALOR_FATURADO: TFloatField;
    CdsRateioMesCODDRE: TIntegerField;
    IbcotacaoItens: TIBQuery;
    DspcotacaoItens: TDataSetProvider;
    CdscotacaoItens: TClientDataSet;
    IbProdutos: TIBQuery;
    cdsProdutos: TClientDataSet;
    DspProdutos: TDataSetProvider;
    CdsApuracaoDepMARGMIN: TFloatField;
    CdsApuracaoDepMARKUPMIN: TFloatField;
    CdsCotacaoCOD_COTACAO: TIntegerField;
    CdsCotacaoTIPOOP: TStringField;
    CdsCotacaoCOD_EMPRESA: TIntegerField;
    CdsCotacaoDATA_COTACAO: TDateTimeField;
    CdsCotacaoCOD_VENDEDOR: TIntegerField;
    CdsCotacaoHORA: TTimeField;
    CdscotacaoItensCOD_COTACAO: TIntegerField;
    CdscotacaoItensTIPOOP: TStringField;
    CdscotacaoItensCOD_EMPRESA: TIntegerField;
    CdscotacaoItensCODSEQ_ITEM: TIntegerField;
    CdscotacaoItensGRUPO: TIntegerField;
    CdscotacaoItensCOD_PROD: TStringField;
    CdscotacaoItensNUM_FAB_PROD: TStringField;
    CdscotacaoItensDESCR_PROD: TStringField;
    CdscotacaoItensCURVA: TStringField;
    CdscotacaoItensQTDE_VENDIDA: TFloatField;
    CdscotacaoItensQTDE_SIMULADA: TFloatField;
    CdscotacaoItensVALOR_MEDIO_VENDA: TFloatField;
    CdscotacaoItensVALOR_VENDA_SIM: TFloatField;
    CdscotacaoItensQTDE_EQUILIBRIO: TFloatField;
    CdscotacaoItensVALOR_EQUILIBRIO: TFloatField;
    CdscotacaoItensCMV_PRODUTO: TFloatField;
    CdscotacaoItensCUSTO_FIXO_PROP: TFloatField;
    CdscotacaoItensCUSTO_VARIAVEL: TFloatField;
    CdscotacaoItensPERC_DESC: TFloatField;
    CdscotacaoItensDESCONTO_VALOR: TFloatField;
    CdscotacaoItensLUCRO_APURADO: TFloatField;
    CdscotacaoItensMARKUP_PRATICADO: TFloatField;
    CdscotacaoItensMARKUP_SIMULADO: TFloatField;
    CdscotacaoItensMARGEM_PRATICADA: TFloatField;
    CdscotacaoItensMARGEM_SIMULADA: TFloatField;
    CdscotacaoItensQTDE_VENDA_DIARIA: TFloatField;
    CdscotacaoItensVALOR_VENDA_DIARIA: TFloatField;
    CdscotacaoItensCLASS_FREQ: TStringField;
    CdscotacaoItensCLASS_AT: TStringField;
    CdscotacaoItensPME: TFloatField;
    CdscotacaoItensQTDE_VENDA_PMEMES: TFloatField;
    CdscotacaoItensVALOR_VENDA_PMEMES: TFloatField;
    CdscotacaoItensESTOQUE: TFloatField;
    CdscotacaoItensESTOQUE_DISP: TFloatField;
    CdscotacaoItensTIPVENDA: TStringField;
    CdscotacaoItensCMV_VENDIDA: TFloatField;
    DtCotacao: TDataSource;
    DtcotacaoItens: TDataSource;
    CdscotacaoItensTIPODEP: TStringField;
    CdsCotacaoFATURAMENTO: TFloatField;
    CdsCotacaoCF: TFloatField;
    CdsCotacaoCMV: TFloatField;
    CdsCotacaoOCV: TFloatField;
    CdsCotacaoLUCRO: TFloatField;
    CdsCotacaoAUMENTO_FAT: TFloatField;
    CdsCotacaoVARIACAO_LUCRO: TFloatField;
    CdsCotacaoMESAPURACAO: TIntegerField;
    CdsCotacaoANOAPURACAO: TIntegerField;
    CdsCotacaoPE: TFloatField;
    CdsCotacaoQTDE_DIAS_DISP: TIntegerField;
    CdscotacaoItensCUSTO_UN_SIM: TFloatField;
    CdscotacaoItensCUSTO_UN_VENDA: TFloatField;
    CdscotacaoItensCOD_FORNECEDOR: TIntegerField;
    CdscotacaoItensFRETE_SIM: TFloatField;
    CdscotacaoItensIPI_SIM: TFloatField;
    CdscotacaoItensMVA_SIM: TFloatField;
    CdscotacaoItensICM_ENTRADA: TFloatField;
    CdscotacaoItensICM_SAIDA: TFloatField;
    CdscotacaoItensOUTRAS_DESP_SIM: TFloatField;
    CdscotacaoItensVALOR_SIM_FORN: TFloatField;
    Ibcolaborador: TIBQuery;
    CdsColaborador: TClientDataSet;
    DspColaborador: TDataSetProvider;
    CdsColaboradorNOME_VENDEDOR: TStringField;
    CdsColaboradorCOD_VENDEDOR: TIntegerField;
    Dtcolaborador: TDataSource;
    IbFornecedor: TIBQuery;
    CdsFornecedor: TClientDataSet;
    DspFornecedor: TDataSetProvider;
    DtFornecedor: TDataSource;
    CdscotacaoItensVALOR_UN_VENDA_SIM: TFloatField;
    CdsCotacaoTIPODEP: TStringField;
    CdsCotacaoDATA_ALT_COTACAO: TDateTimeField;
    CdsCotacaoATIVO: TIntegerField;
    DtApuracaoDep: TDataSource;
    QrVinculacaoDPTO: TQuery;
    CdsIndicesBalancoSEQ_INDICE: TIntegerField;
    qrListaCotacao: TIBQuery;
    dspListaCotacao: TDataSetProvider;
    cdsListaCotacao: TClientDataSet;
    dsListaCotacao: TDataSource;
    cdsListaCotacaoCOD_LISTA: TIntegerField;
    cdsListaCotacaoCOD_EMPRESA: TIntegerField;
    cdsListaCotacaoDESCRICAO_LISTA: TStringField;
    cdsListaCotacaoOBS: TMemoField;
    cdsListaCotacaoATIVO: TIntegerField;
    qrListaCotacaoItens: TIBQuery;
    dspListaCotacaoItens: TDataSetProvider;
    cdsListaCotacaoItens: TClientDataSet;
    dsListaCotacaoItens: TDataSource;
    cdsListaCotacaoItensCOD_LISTA: TIntegerField;
    cdsListaCotacaoItensGRUPO_PROD: TIntegerField;
    cdsListaCotacaoItensCOD_PROD: TStringField;
    cdsListaCotacaoItensCOD_GRADE: TIntegerField;
    cdsListaCotacaoItensCOD_EMPRESA: TIntegerField;
    cdsListaCotacaoItensNUM_FAB_PROD: TStringField;
    cdsListaCotacaoItensDESCR_PROD: TStringField;
    cdsListaCotacaoItensQUANT_PROD: TFloatField;
    cdsListaCotacaoNUM_PED: TIntegerField;
    cdsListaCotacaoItensNUM_PED: TIntegerField;
    cdsListaCotacaoDATA: TDateTimeField;
    CdsCotacaoCOD_LISTA: TIntegerField;
    CdscotacaoItensCOD_LISTA: TIntegerField;
    QrBuscas2: TIBQuery;
    CdscotacaoItensCOD_COND_PAG: TIntegerField;
    IbCondPag: TIBQuery;
    DtCondPag: TDataSource;
    CdsCondPag: TClientDataSet;
    DspCondPag: TDataSetProvider;
    CdsCondPagCOD_COND_PAG: TIntegerField;
    CdsCondPagDESC_COND_PAG: TStringField;
    CdsCondPagSEQPRECO: TStringField;
    CdsCondPagMAX_DESC: TFloatField;
    CdsCondPagATIVO: TIntegerField;
    CdsCondPagFINALIZADOR_CUPOM: TIntegerField;
    CdsCondPagNATUREZA_CP: TStringField;
    CdscotacaoItensPRAZO_MEDIO_ENT: TFloatField;
    CdscotacaoItensPRAZO_MEDIO_PAG: TFloatField;
    CdsFornecedorCOD_CLIENTE: TIntegerField;
    CdsFornecedorNOME_CLIENTE: TStringField;
    CdsFornecedorCOD_COND_PAG: TIntegerField;
    CdsFornecedorPRAZO_MEDIO_ENT: TFloatField;
    CdsFornecedorPRAZO_MEDIO_PAG: TFloatField;
    cdsListaCotacaoCOD_COTACAO: TIntegerField;
    cdsListaCotacaoItensCOD_COTACAO: TIntegerField;
    qrAtributos: TIBQuery;
    dspAtributos: TDataSetProvider;
    cdsAtributos: TClientDataSet;
    dsAtributos: TDataSource;
    cdsAtributosCOD_ATRIBUTO: TIntegerField;
    cdsAtributosCOD_EMPRESA: TIntegerField;
    cdsAtributosDESCRICAO_ATRIBUTO: TStringField;
    cdsAtributosDATA: TDateTimeField;
    cdsAtributosATIVO: TIntegerField;
    RDprintGestor: TRDprint;
    CdsDptoTIPDEVDEPCNT: TStringField;
    CdsDptoTIPOFATCNT: TStringField;
    CdsApuracaoDepAPURACAO_CONTABIL: TStringField;
    CdsApuracaoDepAPURACAO_MEDIA: TStringField;
    CdsApuracaoDepAPURACAO_MEDIA_MESES: TSmallintField;
    CdscotacaoItensIRRF: TFloatField;
    CdscotacaoItensADIRRF: TFloatField;
    CdscotacaoItensCSLL: TFloatField;
    CdscotacaoItensLUCRORETIDO: TFloatField;
    IbTiposRateioDEPARTOR: TIBStringField;
    IbTiposRateioDEPARTDEST: TIBStringField;
    IbTiposRateioTPRAT: TIBStringField;
    IbTiposRateioMEDQTDRATFAT: TIntegerField;
    IbTiposRateioRATEM: TIBStringField;
    IbTiposRateioCOD_DEP: TIntegerField;
    IbTiposRateioCOD_DEPRAT: TIntegerField;
    IbTiposRateioTPRATCNT: TIBStringField;
    IbTiposRateioRATEMCNT: TIBStringField;
    cdsListaCotacaoItensCOD_EMP_MULT: TIntegerField;
    cdsListaCotacaoItensPESO_LIQ_PROD: TFloatField;
    cdsListaCotacaoItensPESO_BRUT_PROD: TFloatField;
    cdsListaCotacaoItensLOCACAO_PROD: TStringField;
    cdsListaCotacaoItensLOCACAO_PROD_1: TStringField;
    procedure cdsListaCotacaoOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure CdsEmpresasBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmGestorHw: TDtmGestorHw;

implementation


{$R *.dfm}

procedure TDtmGestorHw.CdsEmpresasBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmGestorHw.cdsListaCotacaoOBSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if not cdsListaCotacaoOBS.IsNull then
    Text := Copy(cdsListaCotacaoOBS.AsString, 1, 7) + '...';
end;

procedure TDtmGestorHw.DataModuleCreate(Sender: TObject);
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
