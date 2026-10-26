unit uDtmEstoqueFechado;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBStoredProc, IBCustomDataSet,
  IBQuery, IBDatabase, RDprint;

type
  TdtmEstoqueFechado = class(TDataModule)
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    SpIncCodigo: TIBStoredProc;
    dspEstoqueFechado: TDataSetProvider;
    cdsEstoqueFechado: TClientDataSet;
    qrEstoqueFechado: TIBQuery;
    dsEstoqueFechado: TDataSource;
    qrUsuario: TIBQuery;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    dsUsuario: TDataSource;
    cdsUsuarioCOD_VENDEDOR: TIntegerField;
    cdsUsuarioNOME_VENDEDOR: TStringField;
    cdsUsuarioDESC_FUNCAO: TStringField;
    qrCondPagamento: TIBQuery;
    dspCondPagamento: TDataSetProvider;
    cdsCondPagamento: TClientDataSet;
    dsCondPagamento: TDataSource;
    cdsCondPagamentoCOD_COND_PAG: TIntegerField;
    cdsCondPagamentoDESC_COND_PAG: TStringField;
    cdsEstoqueFechadoCOD_PEDIDO: TIntegerField;
    cdsEstoqueFechadoCOD_EMPRESA: TIntegerField;
    cdsEstoqueFechadoTIPV: TStringField;
    cdsEstoqueFechadoCOD_COND_PAG: TIntegerField;
    cdsEstoqueFechadoCOD_VENDEDOR: TIntegerField;
    cdsEstoqueFechadoDATA_PEDIDO: TDateTimeField;
    cdsEstoqueFechadoHORA_PEDIDO: TTimeField;
    cdsEstoqueFechadoGRUPO_PROD: TIntegerField;
    cdsEstoqueFechadoCOD_PROD: TStringField;
    cdsEstoqueFechadoNUM_FAB_PROD: TStringField;
    cdsEstoqueFechadoSIT_ATD: TStringField;
    cdsEstoqueFechadoCOD_VENDEDOR1: TIntegerField;
    cdsEstoqueFechadoDATA_ATD: TDateTimeField;
    cdsEstoqueFechadoHORA_ATD: TTimeField;
    cdsEstoqueFechadoFILTRO: TStringField;
    qrTipoVenda: TIBQuery;
    dspTipoVenda: TDataSetProvider;
    cdsTipoVenda: TClientDataSet;
    dsTipoVenda: TDataSource;
    cdsTipoVendaSIGLA: TStringField;
    cdsTipoVendaDESCRICAO: TStringField;
    cdsTipoVendaCOD_TIPO: TIntegerField;
    cdsEstoqueFechadoDESC_COND_PAG: TStringField;
    cdsEstoqueFechadoCOD_GRADE: TIntegerField;
    cdsEstoqueFechadoDESCR_PROD: TStringField;
    qrPedVendaTemp: TIBQuery;
    dspPedVendaTemp: TDataSetProvider;
    cdsPedVendaTemp: TClientDataSet;
    dsPedVendaTemp: TDataSource;
    qrPedProdTemp: TIBQuery;
    dspPedProdTemp: TDataSetProvider;
    cdsPedProdTemp: TClientDataSet;
    dsPedProdTemp: TDataSource;
    cdsEstoqueFechadoSEL: TStringField;
    cdsEstoqueFechadoQUANT: TFloatField;
    cdsEstoqueFechadoVLUN: TFloatField;
    cdsEstoqueFechadoVLTOT: TFloatField;
    cdsEstoqueFechadoCODIGO_NOP: TFloatField;
    qrPedColaborador: TIBQuery;
    dspPedColaborador: TDataSetProvider;
    cdsPedColaborador: TClientDataSet;
    dsPedColaborador: TDataSource;
    qrRelRelaAten: TIBQuery;
    qrRelRelaAtenTIPO: TIBStringField;
    qrRelRelaAtenNUM_FAB_PROD: TIBStringField;
    qrRelRelaAtenDESCR_PROD_PED: TIBStringField;
    qrRelRelaAtenGRUPO_PROD: TIntegerField;
    qrRelRelaAtenCOD_PROD: TIBStringField;
    qrRelRelaAtenQUANT_PED_ITEM: TFloatField;
    qrRelRelaAtenSIT_ATD: TIBStringField;
    qrRelRelaAtenDATA_ATD: TDateTimeField;
    qrRelRelaAtenHORA_ATD: TIBStringField;
    qrRelRelaAtenNPED: TIntegerField;
    qrRelRelaAtenNOME_VENDEDOR: TIBStringField;
    qrRelRelaAtenLOCACAO_PROD: TIBStringField;
    qrRelRelaAtenLOCACAO_PROD_1: TIBStringField;
    qrRelMovProd: TIBQuery;
    qrRelMovProdGRUP_COD: TIBStringField;
    qrRelMovProdNUM_FAB_PROD: TIBStringField;
    qrRelMovProdDESCR_PROD_PED: TIBStringField;
    qrRelMovProdLOCACAO_PROD: TIBStringField;
    qrRelMovProdLOCACAO_PROD_1: TIBStringField;
    qrRelMovProdGRUPO_PROD: TIntegerField;
    qrRelMovProdCOD_PROD: TIBStringField;
    qrRelMovProdATEND: TFloatField;
    qrRelMovProdNAOATEND: TFloatField;
    qrRelMovProdCOMPRAS: TFloatField;
    qrRelMovProdEST_F: TFloatField;
    qrRelMovProdEST_R: TFloatField;
    qrRelMovProdPEND: TFloatField;
    rdPedido: TRDprint;
    qrMecanico: TIBQuery;
    dspMecanico: TDataSetProvider;
    cdsMecanico: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    dsMecanico: TDataSource;
    qrProdutos: TIBQuery;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    cdsEstoqueFechadoLOCACAO_PROD: TStringField;
    cdsEstoqueFechadoLOCACAO_PROD_1: TStringField;
    cdsEstoqueFechadoNITEM: TIntegerField;
    cdsCondPagamentoSEQPRECO: TStringField;
    qrPedCond: TIBQuery;
    dspPedCond: TDataSetProvider;
    cdsPedCond: TClientDataSet;
    dsPedCond: TDataSource;
    cdsPedCondCOD_COND_PAG: TIntegerField;
    cdsPedCondDESC_COND_PAG: TStringField;
    cdsPedCondSEQPRECO: TStringField;
    dsProd: TDataSource;
    cdsProd: TClientDataSet;
    dspProd: TDataSetProvider;
    qrProd: TIBQuery;
    dsCodBarra: TDataSource;
    cdsCodBarra: TClientDataSet;
    dspCodBarra: TDataSetProvider;
    qrCodBarra: TIBQuery;
    cdsEstoqueFechadoNDOC: TIntegerField;
    cdsEstoqueFechadoTPDOC: TStringField;
    qrCliente: TIBQuery;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    dsCliente: TDataSource;
    cdsClienteCOD_CLIENTE: TIntegerField;
    cdsClienteNOME_CLIENTE: TStringField;
    cdsClienteTIPVCLIENTE: TStringField;
    cdsEstoqueFechadoNOME_CLIENTE: TStringField;
    qrPedCliente: TIBQuery;
    dspPedCliente: TDataSetProvider;
    cdsPedCliente: TClientDataSet;
    dsPedCliente: TDataSource;
    cdsPedClienteCOD_CLIENTE: TIntegerField;
    cdsPedClienteNOME_CLIENTE: TStringField;
    cdsPedClienteTIPVCLIENTE: TStringField;
    cdsPedClienteCOD_LOCALIDADE: TIntegerField;
    cdsPedClienteCOD_CIDADE: TSmallintField;
    cdsClienteCOD_LOCALIDADE: TIntegerField;
    cdsClienteCOD_CIDADE: TSmallintField;
    cdsClienteCAMP_PR_VENDA: TStringField;
    cdsPedClienteCAMP_PR_VENDA: TStringField;
    cdsEstoqueFechadoCOD_CLIENTE: TIntegerField;
    cdsClienteCOD_TAB_PRECO: TIntegerField;
    cdsPedClienteCOD_TAB_PRECO: TIntegerField;
    cdsEstoqueFechadoDATA_LIBTRAVA: TDateTimeField;
    cdsEstoqueFechadoLIBTRAVA: TStringField;
    dspReserva: TDataSetProvider;
    cdsReserva: TClientDataSet;
    qrReserva: TIBQuery;
    dsReserva: TDataSource;
    dspReservaItens: TDataSetProvider;
    cdsReservaItens: TClientDataSet;
    qrReservaItens: TIBQuery;
    dsReservaItens: TDataSource;
    cdsReservaCODIGO: TIntegerField;
    cdsReservaCOD_VENDEDOR: TIntegerField;
    cdsReservaCOD_EMPRESA: TIntegerField;
    cdsReservaDATA: TDateTimeField;
    cdsReservaHORA: TStringField;
    cdsReservaItensCODIGO: TIntegerField;
    cdsReservaItensCOD_VENDEDOR: TIntegerField;
    cdsReservaItensCOD_EMPRESA: TIntegerField;
    cdsReservaItensGRUPO_PROD: TIntegerField;
    cdsReservaItensCOD_PROD: TStringField;
    cdsReservaItensNUM_FAB_PROD: TStringField;
    cdsReservaItensDESCR_PROD: TStringField;
    cdsReservaItensCOD_GRADE: TIntegerField;
    cdsReservaItensQUANT: TFloatField;
    cdsReservaItensDATA: TDateTimeField;
    cdsReservaItensHORA: TStringField;
    cdsReservaDESCRICAO: TStringField;
    cdsReservaATIVO: TIntegerField;
    cdsEstoqueFechadoCOD_RESERVA: TIntegerField;
    cdsReservaItensNITEM: TIntegerField;
    cdsReservaItensORDEM: TIntegerField;
    cdsReservaItensTIPV: TStringField;
    cdsEstoqueFechadoQTDE_LIBTRAVA: TIntegerField;
    cdsEstoqueFechadoVALOR_DESCACRES: TFloatField;
    cdsEstoqueFechadoDESC_ITEM: TFloatField;
    cdsEstoqueFechadoTABPRATICADA: TStringField;
    cdsEstoqueFechadoPRECOPORQTDE: TStringField;
    procedure cdsVendedorBeforeOpen(DataSet: TDataSet);
    procedure cdsPedColaboradorBeforeOpen(DataSet: TDataSet);
    procedure cdsPedProdTempBeforeOpen(DataSet: TDataSet);
    procedure cdsPedVendaTempBeforeOpen(DataSet: TDataSet);
    procedure cdsItemProdTempBeforeOpen(DataSet: TDataSet);
    procedure cdsTipoVendaBeforeOpen(DataSet: TDataSet);
    procedure cdsCondPagamentoBeforeOpen(DataSet: TDataSet);
    procedure cdsUsuarioBeforeOpen(DataSet: TDataSet);
    procedure cdsEstoqueFechadoBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmEstoqueFechado: TdtmEstoqueFechado;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TdtmEstoqueFechado.cdsCondPagamentoBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.cdsEstoqueFechadoBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.cdsItemProdTempBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.cdsPedColaboradorBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.cdsPedProdTempBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.cdsPedVendaTempBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.cdsTipoVendaBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.cdsUsuarioBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.cdsVendedorBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmEstoqueFechado.DataModuleCreate(Sender: TObject);
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
