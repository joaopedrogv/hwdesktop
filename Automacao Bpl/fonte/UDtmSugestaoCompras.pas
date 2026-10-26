unit UDtmSugestaoCompras;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBQuery, IBDatabase,
  IBCustomDataSet, IBStoredProc, RDprint;

type
  TdtmSugestaoCompras = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    IBTransSugestao: TIBTransaction;
    qrPedidoCompra: TIBQuery;
    dspPedidoCompra: TDataSetProvider;
    CdsPedidoCompra: TClientDataSet;
    dsPedidoCompra: TDataSource;
    IBTransPedido: TIBTransaction;
    CdsPedidoCompraNUM_PED: TIntegerField;
    CdsPedidoCompraCOD_EMPRESA: TIntegerField;
    CdsPedidoCompraCODIGO_F: TIntegerField;
    CdsPedidoCompraCOD_VENDEDOR: TIntegerField;
    CdsPedidoCompraDATA_ENV_PED: TDateTimeField;
    CdsPedidoCompraTIPO_PED: TStringField;
    CdsPedidoCompraSTATUS_PED: TStringField;
    CdsPedidoCompraDATA_CHG_PED: TDateTimeField;
    CdsPedidoCompraVAL_TOT_PED: TFloatField;
    CdsPedidoCompraATIVO: TIntegerField;
    qrItensPedido: TIBQuery;
    dspItensPedido: TDataSetProvider;
    CdsItensPedido: TClientDataSet;
    dsItensPedido: TDataSource;
    CdsItensPedidoGRUPO_PROD: TIntegerField;
    CdsItensPedidoCOD_PROD: TStringField;
    CdsItensPedidoCOD_EMPRESA: TIntegerField;
    CdsItensPedidoQUANT_IT_PROD: TFloatField;
    CdsItensPedidoQUANT_PEN_IT: TFloatField;
    CdsItensPedidoQUANT_MIN_IT: TFloatField;
    CdsItensPedidoVAL_UNT_IT: TFloatField;
    CdsItensPedidoVAL_TOT_IT: TFloatField;
    CdsItensPedidoVL_V_EMP: TFloatField;
    CdsItensPedidoVL_V_HONDA: TFloatField;
    CdsItensPedidoATIVO: TIntegerField;
    dsLocVendedor: TDataSource;
    qrLocVendedor: TIBQuery;
    qrLocVendedorCOD_VENDEDOR: TIntegerField;
    qrLocVendedorNOME_VENDEDOR: TIBStringField;
    dsLocFornecedor: TDataSource;
    qrLocFornecedor: TIBQuery;
    qrLocFornecedorCOD_CLIENTE: TIntegerField;
    qrLocFornecedorNOME_CLIENTE: TIBStringField;
    qrBuscasPedido: TIBQuery;
    qrBuscasItemPedido: TIBQuery;
    qrBuscasClasses2: TIBQuery;
    IBTransGravaClasse: TIBTransaction;
    qrBuscasClasses1: TIBQuery;
    IBTransBuscaClasse: TIBTransaction;
    qrBuscasSugestao: TIBQuery;
    qrLocItensPedido: TIBQuery;
    qrLocItensPedidoNUM_PED: TIntegerField;
    qrLocItensPedidoGRUPO_PROD: TIntegerField;
    qrLocItensPedidoCOD_PROD: TIBStringField;
    qrLocItensPedidoQUANT_IT_PROD: TFloatField;
    qrLocItensPedidoQUANT_PEN_IT: TFloatField;
    qrLocItensPedidoQUANT_MIN_IT: TFloatField;
    qrLocItensPedidoVAL_UNT_IT: TFloatField;
    qrLocItensPedidoVAL_TOT_IT: TFloatField;
    qrLocItensPedidoDESCR_PROD: TIBStringField;
    qrLocItensPedidoNUM_FAB_PROD: TIBStringField;
    qrLocItensPedidoVL_V_EMP: TFloatField;
    qrLocItensPedidoVL_V_HONDA: TFloatField;
    qrLocItensPedidoCOD_EMPRESA: TIntegerField;
    dsLocItensPedido: TDataSource;
    CdsItensPedidoNUM_FAB_PROD: TStringField;
    qrItensPedidoNUM_FAB_PROD: TIBStringField;
    qrItensPedidoNUM_PED: TIntegerField;
    qrItensPedidoGRUPO_PROD: TIntegerField;
    qrItensPedidoCOD_PROD: TIBStringField;
    qrItensPedidoCOD_EMPRESA: TIntegerField;
    qrItensPedidoQUANT_IT_PROD: TFloatField;
    qrItensPedidoQUANT_PEN_IT: TFloatField;
    qrItensPedidoQUANT_MIN_IT: TFloatField;
    qrItensPedidoVAL_UNT_IT: TFloatField;
    qrItensPedidoVAL_TOT_IT: TFloatField;
    qrItensPedidoVL_V_EMP: TFloatField;
    qrItensPedidoVL_V_HONDA: TFloatField;
    qrItensPedidoATIVO: TIntegerField;
    CdsItensPedidoNUM_PED: TIntegerField;
    qrSugestao: TIBQuery;
    dspSugestao: TDataSetProvider;
    cdsSugestao: TClientDataSet;
    dsSugestao: TDataSource;
    dsLocGradeIni: TDataSource;
    qrLocGradeIni: TIBQuery;
    qrLocGradeIniCOD_GRADE: TIntegerField;
    qrLocGradeIniDESCRICAO: TIBStringField;
    qrLocGradeIniDESCRICAO1: TIBStringField;
    dsLocGradeFim: TDataSource;
    qrLocGradeFim: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    dsLocGrupoIni: TDataSource;
    qrLocGrupoIni: TIBQuery;
    qrLocGrupoIniCODIGO_GRUP: TIntegerField;
    qrLocGrupoIniDESCRICAO: TIBStringField;
    dsLocSubGIni: TDataSource;
    qrLocSubGIni: TIBQuery;
    dsLocMarcas: TDataSource;
    qrLocMarcas: TIBQuery;
    qrLocSubGIniCODIGO_SUBGR: TIntegerField;
    qrLocSubGIniDESCRICAO: TIBStringField;
    dsLocSubGFim: TDataSource;
    qrLocSubGFim: TIBQuery;
    IntegerField2: TIntegerField;
    IBStringField3: TIBStringField;
    qrLocMarcasCOD_MARCA: TIntegerField;
    qrLocMarcasDESCRICAO_MARCA: TIBStringField;
    dsLocGrupoFim: TDataSource;
    qrLocGrupoFim: TIBQuery;
    IntegerField3: TIntegerField;
    IBStringField4: TIBStringField;
    IBTransDefClasse: TIBTransaction;
    qrBuscasDefClasse: TIBQuery;
    qrSugestaoItem: TIBQuery;
    dspSugestaoItem: TDataSetProvider;
    cdsSugestaoItem: TClientDataSet;
    dsSugestaoItem: TDataSource;
    qrSugestaoItemCOD_SUGESTAO: TIntegerField;
    qrSugestaoItemCOD_EMPRESA: TIntegerField;
    qrSugestaoItemGRUPO_PROD: TIntegerField;
    qrSugestaoItemCOD_PROD: TIBStringField;
    qrSugestaoItemCOD_GRADE: TIntegerField;
    qrSugestaoItemSUGESTAOCOMPRA: TFloatField;
    qrSugestaoItemESTOQUE_ATUAL: TFloatField;
    qrSugestaoItemQTD_PEND: TFloatField;
    qrSugestaoItemCLASSESPROD: TIBStringField;
    qrSugestaoItemMEDIAMES: TFloatField;
    qrSugestaoItemATIVO: TSmallintField;
    qrSugestaoItemDESCR_PROD: TIBStringField;
    qrSugestaoItemDESCRICAO: TIBStringField;
    qrSugestaoItemDESCRICAO1: TIBStringField;
    cdsSugestaoItemCOD_SUGESTAO: TIntegerField;
    cdsSugestaoItemCOD_EMPRESA: TIntegerField;
    cdsSugestaoItemGRUPO_PROD: TIntegerField;
    cdsSugestaoItemCOD_PROD: TStringField;
    cdsSugestaoItemCOD_GRADE: TIntegerField;
    cdsSugestaoItemSUGESTAOCOMPRA: TFloatField;
    cdsSugestaoItemESTOQUE_ATUAL: TFloatField;
    cdsSugestaoItemQTD_PEND: TFloatField;
    cdsSugestaoItemCLASSESPROD: TStringField;
    cdsSugestaoItemMEDIAMES: TFloatField;
    cdsSugestaoItemATIVO: TSmallintField;
    cdsSugestaoItemDESCR_PROD: TStringField;
    cdsSugestaoItemDESCRICAO: TStringField;
    cdsSugestaoItemDESCRICAO1: TStringField;
    cdsSugestaoCOD_SUGESTAO: TIntegerField;
    cdsSugestaoCOD_EMPRESA: TIntegerField;
    cdsSugestaoDT_SUGESTAO: TDateTimeField;
    cdsSugestaoATIVO: TSmallintField;
    qrBuscasSugestao1: TIBQuery;
    RDprintSugestao: TRDprint;
    cdsSugestaoUSODEGRADE: TStringField;
    dsBuscasSugestao1: TDataSource;
    cdsSugestaoQTDMESSUG: TSmallintField;
    dsBuscasClasses1: TDataSource;
    cdsSugestaoHS_SUGESTAO: TTimeField;
    cdsSugestaoTP_SUG: TIntegerField;
    cdsSugestaoTE_SUG: TIntegerField;
    cdsSugestaoTA_SUG: TIntegerField;
    cdsSugestaoFP_SUG: TIntegerField;
    cdsSugestaoES_SUG: TIntegerField;
    qrItensPedidoCOD_GRADE: TIntegerField;
    qrItensPedidoNITEM: TIntegerField;
    CdsItensPedidoCOD_GRADE: TIntegerField;
    CdsItensPedidoNITEM: TIntegerField;
    CdsItensPedidoDESCR_PROD: TStringField;
    qrItensPedidoDESCR_PROD: TIBStringField;
    qrItensPedidoDESCRICAO: TIBStringField;
    CdsItensPedidoDESCRICAO: TStringField;
    CdsPedidoCompraADD_PRODUCAO: TStringField;
    CdsPedidoCompraSTATUS_PRODUCAO: TStringField;
    CdsPedidoCompraNUM_PRODUCAO: TIntegerField;
    CdsPedidoCompraCOD_EMPRESA_PRODUCAO: TIntegerField;
    qrItensPedidoMVA: TFloatField;
    qrItensPedidoIPI: TFloatField;
    qrItensPedidoFRETE: TFloatField;
    CdsItensPedidoMVA: TFloatField;
    CdsItensPedidoIPI: TFloatField;
    CdsItensPedidoFRETE: TFloatField;
    CdsPedidoCompraCOD_COND_PAG: TIntegerField;
    qrCondPag: TIBQuery;
    dspCondPag: TDataSetProvider;
    cdsCondPag: TClientDataSet;
    cdsCondPagCOD_COND_PAG: TIntegerField;
    cdsCondPagDESC_COND_PAG: TStringField;
    cdsCondPagSEQPRECO: TStringField;
    cdsCondPagMAX_DESC: TFloatField;
    cdsCondPagATIVO: TIntegerField;
    cdsCondPagFINALIZADOR_CUPOM: TIntegerField;
    dsCondPag: TDataSource;
    CdsPedidoCompraFORMPAG: TBlobField;
    CdsPedidoCompraVLFORMPAG: TBlobField;
    qrItensPedidoVALOR_ICMSUB: TFloatField;
    CdsItensPedidoVALOR_ICMSUB: TFloatField;
    qrItensPedidoPERC_IPI: TFloatField;
    qrItensPedidoPERC_FRETE: TFloatField;
    CdsItensPedidoPERC_IPI: TFloatField;
    CdsItensPedidoPERC_FRETE: TFloatField;
    CdsPedidoCompraFRETE_BASE_IPI: TStringField;
    CdsPedidoCompraIPI_BASE_ICM: TStringField;
    CdsPedidoCompraNUM_COTACAO: TIntegerField;
    qrItensPedidoNUM_COTACAO: TIntegerField;
    CdsItensPedidoNUM_COTACAO: TIntegerField;
    qrPendPed: TIBQuery;
    dspPendPed: TDataSetProvider;
    cdsPendPed: TClientDataSet;
    dsPendPed: TDataSource;
    qrItensPedidoVL_ULT_COMPRA: TFloatField;
    CdsItensPedidoVL_ULT_COMPRA: TFloatField;
    CdsPedidoCompraOBS: TMemoField;
    CdsPedidoCompraDATA_PED: TDateTimeField;
    CdsPedidoCompraNOME_CLIENTE: TStringField;
    CdsPedidoCompraRAZAO: TStringField;
    CdsPedidoCompraFONE_CLIENTE: TStringField;
    CdsPedidoCompraENDERECO: TStringField;
    CdsPedidoCompraEMAIL: TStringField;
    CdsPedidoCompraNOME_CIDADE: TStringField;
    CdsPedidoCompraLOCALIDADE: TStringField;
    CdsPedidoCompraSETOR: TStringField;
    qrSugestaoEmpresa: TIBQuery;
    dspSugestaoEmpresa: TDataSetProvider;
    cdsSugestaoEmpresa: TClientDataSet;
    dsSugestaoEmpresa: TDataSource;
    cdsSugestaoEmpresaCOD_EMPRESA: TIntegerField;
    cdsSugestaoEmpresaIDENTIFICACAO_EMP: TStringField;
    cdsSugestaoEmpresaSEL: TStringField;
    qrCustosProd: TIBQuery;
    dspCustosProd: TDataSetProvider;
    cdsCustosProd: TClientDataSet;
    dsCustosProd: TDataSource;
    cdsCustosProdGRUPO_PROD: TIntegerField;
    cdsCustosProdCOD_PROD: TStringField;
    cdsCustosProdCOD_EMPRESA: TIntegerField;
    cdsCustosProdCOD_NF: TIntegerField;
    cdsCustosProdNUM_NOTA_NFE: TIntegerField;
    cdsCustosProdSERIE: TStringField;
    cdsCustosProdFORNEC: TIntegerField;
    cdsCustosProdDATA: TDateTimeField;
    cdsCustosProdPREC_CUS_MED: TFloatField;
    cdsCustosProdPR_CUSC_PROD: TFloatField;
    cdsCustosProdVALOR: TFloatField;
    cdsCustosProdNOME_CLIENTE: TStringField;
    qrEmpresa: TIBQuery;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dsEmpresa: TDataSource;
    cdsEmpresaCOD_EMPRESA: TIntegerField;
    cdsEmpresaIDENTIFICACAO_EMP: TStringField;
    qrFornec: TIBQuery;
    dspFornec: TDataSetProvider;
    cdsFornec: TClientDataSet;
    dsFornec: TDataSource;
    cdsFornecCOD_CLIENTE: TIntegerField;
    cdsFornecNOME_CLIENTE: TStringField;
    cdsFornecCOD_EMPRESA: TIntegerField;
    qrVendedor: TIBQuery;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    dsVendedor: TDataSource;
    cdsVendedorCOD_VENDEDOR: TIntegerField;
    cdsVendedorCOD_EMPRESA: TIntegerField;
    cdsVendedorNOME_VENDEDOR: TStringField;
    qrCondPagPed: TIBQuery;
    dspCondPagPed: TDataSetProvider;
    cdsCondPagPed: TClientDataSet;
    dsCondPagPed: TDataSource;
    cdsCondPagPedCOD_COND_PAG: TIntegerField;
    cdsCondPagPedDESC_COND_PAG: TStringField;
    cdsCustosProdRAZAO: TStringField;
    cdsCustosProdCPFCGC: TStringField;
    qrItensPedidoCOD_SUGESTAO: TIntegerField;
    qrItensPedidoCOD_EMP_MULT: TIntegerField;
    CdsItensPedidoCOD_SUGESTAO: TIntegerField;
    CdsItensPedidoCOD_EMP_MULT: TIntegerField;
    cdsFornecTIPO: TStringField;
    qrCliente: TIBQuery;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    dsCliente: TDataSource;
    qrVendedor2: TIBQuery;
    dspVendedor2: TDataSetProvider;
    cdsVendedor2: TClientDataSet;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField3: TStringField;
    dsVendedor2: TDataSource;
    cdsSugestaoEXIBIR_TRANSF: TStringField;
    cdsSugestaoEmpresaEMP_FIS: TIntegerField;
    qrItensPedidoPESO_LIQ_PROD: TFloatField;
    qrItensPedidoPESO_BRUT_PROD: TFloatField;
    qrItensPedidoLOCACAO_PROD: TIBStringField;
    qrItensPedidoLOCACAO_PROD_1: TIBStringField;
    CdsItensPedidoPESO_LIQ_PROD: TFloatField;
    CdsItensPedidoPESO_BRUT_PROD: TFloatField;
    CdsItensPedidoLOCACAO_PROD: TStringField;
    CdsItensPedidoLOCACAO_PROD_1: TStringField;
    procedure CdsPedidoCompraOBSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure CdsPedidoCompraBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmSugestaoCompras: TdtmSugestaoCompras;

implementation
uses uDtmAtivo;

{$R *.dfm}

procedure TdtmSugestaoCompras.CdsPedidoCompraBeforeOpen(DataSet: TDataSet);
begin
 dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmSugestaoCompras.CdsPedidoCompraOBSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
if not CdsPedidoCompraOBS.IsNull then
    Text := Copy(CdsPedidoCompraOBS.AsString, 1, 7) + '...';
end;

procedure TdtmSugestaoCompras.DataModuleCreate(Sender: TObject);
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
