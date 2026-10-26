unit UDtmBalanco;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBCustomDataSet, IBQuery,
  IBDatabase, RDprint, IBStoredProc;

type
  TdtmBalanco = class(TDataModule)
    qrBalanco: TIBQuery;
    dspBalanco: TDataSetProvider;
    cdsBalanco: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField9: TStringField;
    StringField23: TStringField;
    qrContadoBalanco: TIBQuery;
    dspContadoBalanco: TDataSetProvider;
    cdsContadoBalanco: TClientDataSet;
    cdsContadoBalancoGRUPO_PROD: TIntegerField;
    cdsContadoBalancoCOD_PROD: TStringField;
    cdsContadoBalancoCOD_EMPRESA: TIntegerField;
    cdsContadoBalancoCOD_BARRA: TStringField;
    cdsContadoBalancoQTDE_PROD: TFloatField;
    cdsContadoBalancoLOCACAO1_PROD: TStringField;
    cdsContadoBalancoLOCACAO2_PROD: TStringField;
    cdsContadoBalancoATIVO: TIntegerField;
    cdsContadoBalancoDATA_HORA_LEITURA: TDateTimeField;
    qrEstoqueINI: TIBQuery;
    dspEstoqueINI: TDataSetProvider;
    cdsEstoqueINI: TClientDataSet;
    cdsEstoqueINIGRUPO_PROD: TIntegerField;
    cdsEstoqueINICOD_PROD: TStringField;
    cdsEstoqueINIDATA_CADASTRO: TDateTimeField;
    cdsEstoqueINICOD_EMPRESA: TIntegerField;
    cdsEstoqueININUM_FAB_PROD: TStringField;
    cdsEstoqueINILOCACAO_PROD: TStringField;
    cdsEstoqueINILOCACAO_PROD_1: TStringField;
    cdsEstoqueINIQUANT_EST: TFloatField;
    cdsEstoqueINIQUANT_TRANS: TFloatField;
    cdsEstoqueINIQUANT_REQ: TFloatField;
    cdsEstoqueINIDATA_CONFIRM: TDateTimeField;
    cdsEstoqueINITIP_BAL: TStringField;
    cdsEstoqueINIQTD_DIF_BAL: TFloatField;
    cdsEstoqueINIATIVO: TIntegerField;
    cdsEstoqueINIPCUST_MC: TFloatField;
    qrGradeBalanco: TIBQuery;
    dspGradeBalanco: TDataSetProvider;
    cdsGradeBalanco: TClientDataSet;
    cdsGradeBalancoGRUPO_PROD: TIntegerField;
    cdsGradeBalancoCOD_PROD: TStringField;
    cdsGradeBalancoCOD_GRADE: TIntegerField;
    cdsGradeBalancoCOD_EMPRESA: TIntegerField;
    cdsGradeBalancoQTDE: TFloatField;
    cdsGradeBalancoATIVO: TIntegerField;
    cdsGradeBalancoQTD_ETIQUETAS: TIntegerField;
    qrGradeContBalanco: TIBQuery;
    dspGradeContBalanco: TDataSetProvider;
    cdsGradeContBalanco: TClientDataSet;
    qrEstoqueINIGrade: TIBQuery;
    dspEstoqueINIGrade: TDataSetProvider;
    cdsEstoqueINIGrade: TClientDataSet;
    qrVisGrade: TIBQuery;
    dspVisGrade: TDataSetProvider;
    cdsVisGrade: TClientDataSet;
    dsVisGrade: TDataSource;
    IBTransBalanco: TIBTransaction;
    cdsVisGradeCOD_GRADE: TIntegerField;
    cdsVisGradeDESCRICAO: TStringField;
    cdsVisGradeDESCRICAO1: TStringField;
    cdsVisGradeQTDE: TFloatField;
    cdsVisGradeCOD_PROD: TStringField;
    cdsVisGradeGRUPO_PROD: TIntegerField;
    qrProdutos: TIBQuery;
    cdsContadoBalancoPREC_CUSM_PROD: TFloatField;
    cdsContadoBalancoQTD_DIF_BAL: TFloatField;
    cdsEstoqueINIGradeGRUPO_PROD: TIntegerField;
    cdsEstoqueINIGradeCOD_PROD: TStringField;
    cdsEstoqueINIGradeCOD_GRADE: TIntegerField;
    cdsEstoqueINIGradeCOD_EMPRESA: TIntegerField;
    cdsEstoqueINIGradeNUM_FAB_PROD: TStringField;
    cdsEstoqueINIGradeLOCACAO_PROD: TStringField;
    cdsEstoqueINIGradeLOCACAO_PROD_1: TStringField;
    cdsEstoqueINIGradeQUANT_EST: TFloatField;
    cdsEstoqueINIGradeQUANT_TRANS: TFloatField;
    cdsEstoqueINIGradeQUANT_REQ: TFloatField;
    cdsEstoqueINIGradeDATA_CADASTRO: TDateTimeField;
    cdsEstoqueINIGradeDATA_CONFIRM: TDateTimeField;
    cdsEstoqueINIGradeATIVO: TIntegerField;
    qrZerados: TIBQuery;
    rdZerados: TRDprint;
    qrBuscas: TIBQuery;
    qrDiferenca: TIBQuery;
    qrTranfArqBal: TIBQuery;
    qrProdutosRel: TIBQuery;
    qrContRel: TIBQuery;
    rdRelCont: TRDprint;
    qrSomasProd: TIBQuery;
    cdsEstoqueINIQUANT_PRODUCAO: TFloatField;
    cdsContadoBalancoCODUSUARIO: TIntegerField;
    SpMovEst: TIBStoredProc;
    cdsBalancoNUM_FAB_PROD: TStringField;
    cdsBalancoPREC_CUSM_PROD: TFloatField;
    cdsBalancoDESCR_PROD: TStringField;
    cdsBalancoDESCR_PROD_RED: TStringField;
    cdsBalancoPREC_TAB_PROD: TFloatField;
    cdsBalancoPREC_PUBLICO: TFloatField;
    cdsBalancoNBM: TStringField;
    cdsBalancoCST_PROD: TStringField;
    cdsBalancoICM_PROD: TFloatField;
    cdsBalancoCODIGO_NOP: TFloatField;
    cdsBalancoMARCA_P: TStringField;
    cdsBalancoUNIDADE: TStringField;
    cdsBalancoEM_PROMOCAO: TStringField;
    cdsBalancoPRECO_PROMOCAO: TFloatField;
    cdsBalancoPREC_30_PROD: TFloatField;
    cdsBalancoPREC_60_PROD: TFloatField;
    cdsBalancoPREC_90_PROD: TFloatField;
    cdsBalancoESTOQUE_DISPONIVEL: TFloatField;
    cdsBalancoESTOQUE_PRODUZIR: TFloatField;
    qrBalancoDia: TIBQuery;
    dspBalancoDia: TDataSetProvider;
    cdsBalancoDia: TClientDataSet;
    cdsBalancoDiaDATA: TStringField;
    cdsBalancoDiaDATA_HORA_LEITURA: TLargeintField;
    cdsBalancoDiaCOD_EMPRESA: TIntegerField;
    dsBalancoDia: TDataSource;
    qrBalancoRegistro: TIBQuery;
    dspBalancoRegistro: TDataSetProvider;
    cdsBalancoRegistro: TClientDataSet;
    dsBalancoRegistro: TDataSource;
    cdsBalancoRegistroDATA_HORA_LEITURA: TDateTimeField;
    cdsBalancoRegistroGRUPO_PROD: TIntegerField;
    cdsBalancoRegistroCOD_PROD: TStringField;
    cdsBalancoRegistroCOD_BARRA: TStringField;
    cdsBalancoRegistroCOD_GRADE: TIntegerField;
    cdsBalancoRegistroDESCRICAO: TStringField;
    cdsBalancoRegistroDESCRICAO1: TStringField;
    cdsBalancoRegistroQTDE_CONT: TFloatField;
    cdsBalancoRegistroCOD_EMPRESA: TIntegerField;
    cdsBalancoRegistroDESCR_PROD: TStringField;
    procedure rdRelContNewPage(Sender: TObject; Pagina: Integer);
    procedure rdZeradosNewPage(Sender: TObject; Pagina: Integer);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsBalancoBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmBalanco: TdtmBalanco;

implementation
             uses
             uDtmAtivo,Ubalanco, UClassesProdutos;
{$R *.dfm}

procedure TdtmBalanco.cdsBalancoBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;



procedure TdtmBalanco.DataModuleCreate(Sender: TObject);
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

procedure TdtmBalanco.rdRelContNewPage(Sender: TObject; Pagina: Integer);
begin
  RdRelCont.impF(_objBalanco._Linha_I, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
  RdZerados.impF(_objBalanco._Linha_I, 1, _objBalanco._vTituloRelatorio, [normal, negrito]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
  RdRelCont.impF(_objBalanco._Linha_I, 1, datetostr(vDadosIni.getDataBanco(qrBuscas)), [normal, negrito]);
  _objBalanco._Vpag_I := _objBalanco._Vpag_I + 1;
  RdRelCont.impF(_objBalanco._Linha_I, 110, 'PAG: ' + inttostr(_objBalanco._Vpag_I), [normal, negrito]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 2;
  RdRelCont.impF(_objBalanco._Linha_I, 2, 'CODIGO', [comp17]);
  RdRelCont.impF(_objBalanco._Linha_I, 15, 'DENOMINACAO', [comp17]);
  RdRelCont.impF(_objBalanco._Linha_I, 60, 'ESTOQUE', [comp17]);
  RdRelCont.impF(_objBalanco._Linha_I, 70, 'CONTADO', [comp17]);
  RdRelCont.impF(_objBalanco._Linha_I, 80, 'VL.UN VND', [comp17]);
  RdRelCont.impF(_objBalanco._Linha_I, 92, 'VL.TOT VND', [comp17]);
  RdRelCont.impF(_objBalanco._Linha_I, 103, 'VL.UN CST', [comp17]);
  RdRelCont.impF(_objBalanco._Linha_I, 114, 'VL.TOT CST', [comp17]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
  RdRelCont.impF(_objBalanco._Linha_I, 1, vDadosIni.replicate('-', 130), [comp17]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
end;

procedure TdtmBalanco.rdZeradosNewPage(Sender: TObject; Pagina: Integer);
begin
  RdZerados.impF(_objBalanco._Linha_I, 1, vDadosIni.vEmp.vnomeEmpresa, [normal]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
   RdZerados.impF(_objBalanco._Linha_I, 1, _objBalanco._vTituloRelatorio, [normal, negrito]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
  RdZerados.impF(_objBalanco._Linha_I, 4, datetostr(vDadosIni.getDataBanco(qrBuscas)), [normal, negrito]);
  _objBalanco._Vpag_I := _objBalanco._Vpag_I + 1;
  RdZerados.impF(_objBalanco._Linha_I, 110, 'PAG: ' + inttostr(_objBalanco._Vpag_I), [normal, negrito]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 2;
  RdZerados.impF(_objBalanco._Linha_I, 2, 'CODIGO', [comp17]);
  RdZerados.impF(_objBalanco._Linha_I, 16, 'DENOMINACAO', [comp17]);
  RdZerados.impD(_objBalanco._Linha_I, 72, 'ESTOQUE', [comp17]);
  RdZerados.impD(_objBalanco._Linha_I, 83, 'CONTADO', [comp17]);
  RdZerados.impF(_objBalanco._Linha_I, 85, 'ERRO', [comp17]);
  RdZerados.imp(_objBalanco._Linha_I, 100, 'NUM. FAB. PRODUTO');
  RdZerados.imp(_objBalanco._Linha_I, 120, 'LOCACAO');
  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
  RdZerados.impF(_objBalanco._Linha_I, 1, vDadosIni.Replicate('-', 130), [comp17]);
  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
end;

end.
