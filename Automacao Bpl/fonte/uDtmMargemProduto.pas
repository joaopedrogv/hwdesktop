unit uDtmMargemProduto;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBDatabase, IBCustomDataSet,
  IBQuery, xhHierCube;

type
  TdtmMargemProd = class(TDataModule)
    cdsEmpMargProd: TClientDataSet;
    qrBuscas: TIBQuery;
    transacaoMargProd: TIBTransaction;
    qrProd: TIBQuery;
    dspProd: TDataSetProvider;
    cdsProd: TClientDataSet;
    qrEmpresa: TIBQuery;
    dspEmpresa: TDataSetProvider;
    dspBarra: TDataSetProvider;
    qrBarra: TIBQuery;
    cdsBarra: TClientDataSet;
    cdsBarraCOD_BARRA: TStringField;
    cdsBarraGRUPO_PROD: TIntegerField;
    cdsBarraCOD_PROD: TStringField;
    dsProd: TDataSource;
    cdsSugestaoVendaCompra: TClientDataSet;
    DtGrupos: TDataSource;
    IbGrupos: TIBQuery;
    HieranalVenda: THierCube;
    Ibvendageralprodutos: TIBQuery;
    cdsItensVenda: TClientDataSet;
    dsItensVenda: TDataSource;
    cdsItensVendaGRUPO_PROD: TIntegerField;
    cdsItensVendaCOD_PROD: TStringField;
    cdsItensVendaNITEM: TIntegerField;
    cdsItensVendaNUM_FAB_PROD: TStringField;
    cdsItensVendaDESCR_PROD_PED: TStringField;
    cdsItensVendaQUANT_PED_ITEM: TFloatField;
    cdsItensVendaVLUN_PED_ITEM: TFloatField;
    cdsItensVendaVLTOT_PED_ITEM: TFloatField;
    cdsItensVendaRATEIO_DESC: TFloatField;
    cdsItensVendaRATEIO_ACRESC: TFloatField;
    cdsItensVendaPCUST_C: TFloatField;
    cdsItensVendaSTATUS: TStringField;
    cdsItensVendaCV: TFloatField;
    cdsItensVendaCT: TFloatField;
    cdsItensVendaLUCROLIQ: TFloatField;
    cdsItensVendaMARKUP: TFloatField;
    cdsItensVendaPE: TFloatField;
    cdsItensVendaCOD_GRADE: TIntegerField;
    cdsItensVendaTIPV: TStringField;
    cdsItensVendaCMV: TCurrencyField;
    cdsItensVendaCF: TCurrencyField;
    cdsVenda: TClientDataSet;
    dsVenda: TDataSource;
    cdsVendaNPED: TIntegerField;
    cdsVendaTIPO: TStringField;
    cdsVendaDATA_PED: TSQLTimeStampField;
    cdsVendaDATA_FECH: TSQLTimeStampField;
    cdsVendaVALOR_TOTAL: TCurrencyField;
    cdsVendaTIPV: TStringField;
    cdsVendaTOT_PROD: TCurrencyField;
    cdsVendaNOME_CLIENTE: TStringField;
    cdsVendaNOME_VENDEDOR: TStringField;
    cdsVendaCMV: TCurrencyField;
    cdsVendaCF: TCurrencyField;
    cdsVendaCV: TFloatField;
    cdsVendaCT: TFloatField;
    cdsVendaLUCROLIQ: TFloatField;
    cdsVendaMARKUP: TFloatField;
    cdsVendaPE: TFloatField;
    cdsItensVendaCMVPERC: TFloatField;
    cdsItensVendaCFPERC: TFloatField;
    cdsItensVendaCTPERC: TFloatField;
    cdsItensVendaLUCROLIQPERC: TFloatField;
    cdsItensVendaCVPERC: TFloatField;
    cdsItensVendaVLUN_LIQUIDO: TCurrencyField;
    cdsVendaCMVPERC: TFloatField;
    cdsVendaCFPERC: TFloatField;
    cdsVendaCVPERC: TFloatField;
    cdsVendaCTPERC: TFloatField;
    cdsVendaLUCROLIQPERC: TFloatField;
    cdsItensVendaRATEIO_DESC_UNITARIO: TCurrencyField;
    cdsItensVendaRATEIO_ACRESC_UNITARIO: TCurrencyField;
    cdsItensVendaPE_TOTAL: TCurrencyField;
    cdsItensVendaVLUN_PED_ITEM_TOTAL: TCurrencyField;
    cdsItensVendaVLUN_LIQUIDO_TOTAL: TCurrencyField;
    cdsItensVendaCMV_TOTAL: TCurrencyField;
    cdsItensVendaCF_TOTAL: TCurrencyField;
    cdsItensVendaCV_TOTAL: TCurrencyField;
    cdsItensVendaCT_TOTAL: TCurrencyField;
    cdsItensVendaLUCROLIQ_TOTAL: TCurrencyField;
    cdsItensVendaCFPERC_TOTAL: TFloatField;
    cdsItensVendaCTPERC_TOTAL: TFloatField;
    cdsItensVendaLUCROLIQPERC_TOTAL: TFloatField;
    cdsItensVendaCMVPERC_TOTAL: TFloatField;
    cdsItensVendaPERMITIR_DESCONTO: TStringField;
    cdsItensVendaTABPRATICADA: TStringField;
    cdsItensVendaEM_PROMOCAO: TStringField;
    cdsItensVendaIRRF_ITEM: TCurrencyField;
    cdsItensVendaIRRF_PERC: TFloatField;
    cdsItensVendaIRRF_TOTAL: TCurrencyField;
    cdsItensVendaADIRRF_ITEM: TCurrencyField;
    cdsItensVendaADIRRF_PERC: TFloatField;
    cdsItensVendaADIRRF_TOTAL: TCurrencyField;
    cdsVendaIRRF: TCurrencyField;
    cdsVendaIRRF_PERC: TFloatField;
    cdsVendaADIRRF: TCurrencyField;
    cdsVendaADIRRF_PERC: TFloatField;
    cdsVendaCSLL: TFloatField;
    cdsVendaCSLL_PERC: TFloatField;
    cdsItensVendaCSLL_ITEM: TFloatField;
    cdsItensVendaCSLL_PERC: TFloatField;
    cdsItensVendaCSLL_TOTAL: TFloatField;
    cdsVendaLUCRORETIDO: TFloatField;
    cdsVendaLUCRORETIDO_PERC: TFloatField;
    cdsItensVendaLUCRORETIDO_ITEM: TFloatField;
    cdsItensVendaLUCRORETIDO_PERC: TFloatField;
    cdsItensVendaLUCRORETIDO_TOTAL: TFloatField;
    cdsItensVendaUNIDADE_CONV: TStringField;
    cdsItensVendaQUANT_PED_ITEM2: TFloatField;
    cdsItensVendaVLUN_PED_ITEM2: TFloatField;
    cdsItensVendaUNIDADE: TStringField;
    cdsItensVendaOPERACAO_CONV: TStringField;
    cdsItensVendaFATOR_CONV: TFloatField;
    cdsItensVendaFATOR_CONV_TEMP: TStringField;
    procedure cdsEmpMargProdBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMargemProd: TdtmMargemProd;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

{ TdtmMargemProd }

procedure TdtmMargemProd.cdsEmpMargProdBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmMargemProd);
end;

end.
