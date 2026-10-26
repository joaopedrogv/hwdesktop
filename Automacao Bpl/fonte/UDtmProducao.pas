unit UDtmProducao;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBStoredProc, DBClient,
  Provider, IBQuery,Dialogs;

type
  TdtmProducao = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrProducao: TIBQuery;
    dspProducao: TDataSetProvider;
    cdsProducao: TClientDataSet;
    dsProducao: TDataSource;
    cdsProducaoCOD_PRODUCAO: TIntegerField;
    cdsProducaoCOD_CLIENTE: TIntegerField;
    cdsProducaoDATA: TDateTimeField;
    cdsProducaoSTATUS: TStringField;
    cdsProducaoCOD_EMPRESA: TIntegerField;
    qrBuscas: TIBQuery;
    qrClientes: TIBQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    cdsProducaoDESCRICAO: TStringField;
    dsItemAcab: TDataSource;
    cdsItemAcab: TClientDataSet;
    dspItemAcab: TDataSetProvider;
    qrItemAcab: TIBQuery;
    dsItemInd: TDataSource;
    cdsItemInd: TClientDataSet;
    dspItemInd: TDataSetProvider;
    qrItemInd: TIBQuery;
    cdsProducaoNOME_CLIENTE: TStringField;
    cdsProducaoRAZAO: TStringField;
    cdsProducaoDATA_FECHAMENTO: TDateTimeField;
    dsProd: TDataSource;
    cdsProd: TClientDataSet;
    dspProd: TDataSetProvider;
    qrProd: TIBQuery;
    dsCodBarra: TDataSource;
    cdsCodBarra: TClientDataSet;
    dspCodBarra: TDataSetProvider;
    qrCodBarra: TIBQuery;
    cdsItemAcabCOD_PRODUCAO: TIntegerField;
    cdsItemAcabCOD_EMPRESA: TIntegerField;
    cdsItemAcabNITEM: TIntegerField;
    cdsItemAcabCOD_GRADE: TIntegerField;
    cdsItemAcabCOD_PROD: TStringField;
    cdsItemAcabGRUPO_PROD: TIntegerField;
    cdsItemAcabNUM_FAB_PROD: TStringField;
    cdsItemAcabDESCR_PROD: TStringField;
    cdsItemAcabQUANTIDADE: TFloatField;
    cdsItemAcabPREC_CUSM_PROD: TFloatField;
    cdsItemAcabPREC_CUS_PROD: TFloatField;
    cdsClientesNOME_CLIENTE: TStringField;
    cdsClientesRAZAO: TStringField;
    cdsClientesCOD_CLIENTE: TIntegerField;
    cdsItemIndCOD_PRODUCAO: TIntegerField;
    cdsItemIndCOD_EMPRESA: TIntegerField;
    cdsItemIndNITEM: TIntegerField;
    cdsItemIndNITEM_IND: TIntegerField;
    cdsItemIndCOD_GRADE: TIntegerField;
    cdsItemIndGRUPO_PROD: TIntegerField;
    cdsItemIndCOD_PROD: TStringField;
    cdsItemIndNUM_FAB_PROD: TStringField;
    cdsItemIndDESCR_PROD: TStringField;
    cdsItemIndTIPO_ITEM: TStringField;
    cdsItemIndQUANTIDADE_RECEITA: TFloatField;
    cdsItemIndQUANTIDADE_UTILIZADA: TFloatField;
    cdsItemIndQUANTIDADE_PERDA: TFloatField;
    cdsItemIndPREC_CUSM_PROD: TFloatField;
    cdsItemIndTIPO_ITEM_DESC: TStringField;
    cdsProducaoDATA_INICIO: TDateTimeField;
    dsFormula: TDataSource;
    cdsFormula: TClientDataSet;
    dspFormula: TDataSetProvider;
    qrFormula: TIBQuery;
    cdsFormulaCOD_FORMULA: TIntegerField;
    cdsFormulaCOD_EMPRESA: TIntegerField;
    cdsFormulaPRODUTO: TStringField;
    cdsFormulaTIPO: TStringField;
    cdsFormulaPROCESSO: TMemoField;
    cdsFormulaUSAR_SOLVENTE: TStringField;
    cdsFormulaGRUPO_PROD_SOLV: TIntegerField;
    cdsFormulaCOD_PROD_SOLV: TStringField;
    cdsFormulaCOD_EMP_SOLV: TIntegerField;
    cdsFormulaGRUPO_PROD_SIMP: TIntegerField;
    cdsFormulaCOD_PROD_SIMP: TStringField;
    cdsFormulaCOD_EMP_SIMP: TIntegerField;
    cdsFormulaATIVO: TSmallintField;
    dsFrmlProd: TDataSource;
    cdsFrmlProd: TClientDataSet;
    dspFrmlProd: TDataSetProvider;
    qrFrmlProd: TIBQuery;
    cdsFrmlProdCOD_FORMULA: TIntegerField;
    cdsFrmlProdCOD_EMPRESA: TIntegerField;
    cdsFrmlProdGRUPO_PROD: TIntegerField;
    cdsFrmlProdCOD_PROD: TStringField;
    cdsFrmlProdQUANTIDADE: TFloatField;
    cdsFrmlProdSOLVENTE: TStringField;
    cdsFormulaPROD_SOLVENTE: TStringField;
    cdsFormulaPROD_FORMULA: TStringField;
    cdsFrmlProdDESCR_PROD: TStringField;
    cdsFrmlProdUNIDADE: TStringField;
    cdsFrmlProdNUM_FAB_PROD: TStringField;
    dsRec: TDataSource;
    cdsRec: TClientDataSet;
    dspRec: TDataSetProvider;
    qrRec: TIBQuery;
    cdsRecCOD_RECEITA: TIntegerField;
    cdsRecTITULO: TStringField;
    cdsRecPROCESSO_PRODUCAO: TMemoField;
    cdsFormulaPROD_SOLVENTE_C: TStringField;
    cdsFormulaNUM_FAB_PROD_S: TStringField;
    cdsFormulaNUM_FAB_PROD: TStringField;
    cdsProducaoNLOTE: TStringField;
    cdsProducaoQUANTIDADEPRODUCAO: TFloatField;
    cdsProducaoUNIDADE: TStringField;
    cdsProducaoCOD_FORMULA: TIntegerField;
    cdsProducaoCOD_EMP_FORM: TIntegerField;
    cdsItemAcabUNIDADE: TStringField;
    cdsItemIndUNIDADE: TStringField;
    cdsItemIndCOD_FORMULA: TIntegerField;
    dsFormCons: TDataSource;
    cdsFormCons: TClientDataSet;
    dspFormCons: TDataSetProvider;
    qrFormCons: TIBQuery;
    cdsItemAcabPESO_UN: TFloatField;
    cdsItemAcabPESO_UTIL: TFloatField;
    cdsItemIndPESO_UN: TFloatField;
    cdsItemIndPESO_UTIL: TFloatField;
    cdsProducaoQUANTIDADEPRODUZIDA: TFloatField;
    cdsItemIndPESO_FORMULA: TFloatField;
    cdsItemIndPESO_PERDA: TFloatField;
    cdsItemIndQUANTIDADE_TEORICA: TFloatField;
    cdsItemIndSOLVENTE: TStringField;
    cdsItemIndPESO_TEORICO: TFloatField;
    cdsProducaoQUANTIDADEPREVISTA: TFloatField;
    cdsFormulaTEXTO_IMPRESSAO1: TMemoField;
    cdsFormulaTEXTO_IMPRESSAO2: TMemoField;
    cdsItemAcabCUSTO_INDICE: TFloatField;
    cdsItemAcabCUSTO_RATEIO: TFloatField;
    cdsItemIndSEM_ESTOQUE: TStringField;
    dsPC: TDataSource;
    cdsPC: TClientDataSet;
    dspPC: TDataSetProvider;
    qrPC: TIBQuery;
    cdsPCNUM_PED: TIntegerField;
    cdsPCGRUPO_PROD: TIntegerField;
    cdsPCCOD_PROD: TStringField;
    cdsPCNUM_FAB_PROD: TStringField;
    cdsPCDESCR_PROD: TStringField;
    cdsPCQUANT_IT_PROD: TFloatField;
    cdsPCVAL_UNT_IT: TFloatField;
    cdsPCVAL_TOT_IT: TFloatField;
    cdsPCCOD_EMPRESA: TIntegerField;
    cdsPCCODIGO_F: TIntegerField;
    cdsPCDATA_ENV_PED: TDateTimeField;
    cdsPCVAL_TOT_PED: TFloatField;
    cdsPCNOME_EMP: TStringField;
    cdsPCCGC_EMP: TStringField;
    cdsPCCPFCGC: TStringField;
    cdsPCRAZAO: TStringField;
    cdsPCSEL: TStringField;
    cdsPCNITEM: TIntegerField;
    cdsTemp: TClientDataSet;
    cdsTempGRUPO_PROD: TIntegerField;
    cdsTempCOD_PROD: TStringField;
    cdsTempNUM_FAB_PROD: TStringField;
    cdsTempNUM_FAB_FORNECEDOR: TStringField;
    cdsTempDESCR_PROD: TStringField;
    cdsTempQUANTIDADE: TFloatField;
    cdsTempNUM_PED: TIntegerField;
    cdsTempCOD_EMPRESA: TIntegerField;
    cdsTempNOME_EMP: TStringField;
    cdsTempCGC_EMP: TStringField;
    dsTemp: TDataSource;
    cdsProducaoHORA_INICIO: TDateTimeField;
    cdsProducaoHORA_FECHAMENTO: TDateTimeField;
    cdsItemAcabSEQ: TIntegerField;
    cdsItemIndSEQ: TIntegerField;
    cdsItemIndSEQN: TIntegerField;
    cdsTempCOD_GRADE: TIntegerField;
    cdsPCCOD_GRADE: TIntegerField;
    cdsFormulaUNIDADE: TStringField;
    cdsFormulaTIPO_CONVERSAO: TStringField;
    cdsProducaoTIPO_CONVERSAO: TStringField;
    cdsProducaoGERACAO_AUT: TStringField;
    cdsItemAcabNPED: TIntegerField;
    cdsItemAcabTIPO: TStringField;
    cdsItemIndNPED: TIntegerField;
    cdsItemIndTIPO: TStringField;
    procedure cdsFormulaPROCESSOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsProducaoBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmProducao: TdtmProducao;

implementation
uses uDtmAtivo;
{$R *.dfm}

procedure TdtmProducao.cdsFormulaPROCESSOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:= Copy (StringReplace(Sender.AsString,''#$D#$A'',' | ',[rfReplaceAll, rfIgnoreCase]), 1, 128);
end;

procedure TdtmProducao.cdsProducaoBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmProducao.DataModuleCreate(Sender: TObject);
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
