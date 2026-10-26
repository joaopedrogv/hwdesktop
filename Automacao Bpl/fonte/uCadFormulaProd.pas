unit uCadFormulaProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, DB, QRCtrls, QuickRpt, uDataSet_OOP;

type
  TfrmCadFormulaProd = class(TfrmCadPadraoM)
    tscadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Panel8: TPanel;
    Label18: TLabel;
    DBEdit4: TDBEdit;
    Panel9: TPanel;
    GroupBox6: TGroupBox;
    pnConsultaItensFormula: TPanel;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    pnCadastroItensFormula: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Panel60: TPanel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    SpeedButton10: TSpeedButton;
    tsEscolhaReceita: TTabSheet;
    pnEscolhaReceita: TPanel;
    GroupBox7: TGroupBox;
    DBGrid5: TDBGrid;
    Panel4: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel6: TPanel;
    DBMemo2: TDBMemo;
    tsEscolhaProdutos: TTabSheet;
    pnEscolhaProdutos: TPanel;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    SpeedButton13: TSpeedButton;
    DBEdit2: TDBEdit;
    tsRelatorios: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData4: TQRSysData;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape4: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape5: TQRShape;
    QRLabel31: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel16: TQRLabel;
    DetailBand3: TQRBand;
    QRDBText14: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText18: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRBand4: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    Label8: TLabel;
    tsTextAdicional: TTabSheet;
    pnTextAdicional: TPanel;
    Panel11: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Splitter3: TSplitter;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton9: TSpeedButton;
    Label11: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure QRLabel3Print(sender: TObject; var Value: string);
    procedure QRLabel29Print(sender: TObject; var Value: string);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel2Print(sender: TObject; var Value: string);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DetailBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBCheckBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBCheckBox1Exit(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit7Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
  private
    { Private declarations }
    vTotalFormulas: Integer;
    vSomaItens: Double;
    lkTipoConversao: TDadosLookUp_OOP;
  public
    { Public declarations }
  end;

var
  frmCadFormulaProd: TfrmCadFormulaProd;

implementation

uses UDtmProducao, uClassesProducao, uDtmAtivo, hw_utils, Math, uDadosIni;

{$R *.dfm}

procedure TfrmCadFormulaProd.BitBtn10Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('PPR025', 'ALTERAR',
    ' GRUPO: ' + cadFormulaProducao.vItemFormula.dataSet.FieldByName('grupo_prod').AsString +
    ' CODIGO: ' + trim(cadFormulaProducao.vItemFormula.dataSet.FieldByName('cod_prod').AsString) +
    ' NUM FAB: ' + trim(cadFormulaProducao.vItemFormula.dataSet.FieldByName('num_fab_prod').AsString) +
    ' QTDE: ' + Format('%0.6f', [cadFormulaProducao.vItemFormula.dataSet.FieldByName('quantidade').AsFloat]),
    'FORMULA_PRODUCAO_PRODUTOS', cadFormulaProducao.dataSet.FieldByName('COD_FORMULA').AsString, cadFormulaProducao.buscas, True) then
    Exit;

  if not cadFormulaProducao.vItemFormula.Edit then
    Exit;
  pnCadastroItensFormula.Visible := True;
  DBEdit7.Enabled := False;

  if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
    DBEdit9.SetFocus;

  pnConsultaItensFormula.Visible := False;
end;

procedure TfrmCadFormulaProd.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PPR026', 'EXCLUIR',
    ' GRUPO: ' + cadFormulaProducao.vItemFormula.dataSet.FieldByName('grupo_prod').AsString +
    ' CODIGO: ' + trim(cadFormulaProducao.vItemFormula.dataSet.FieldByName('cod_prod').AsString) +
    ' NUM FAB: ' + trim(cadFormulaProducao.vItemFormula.dataSet.FieldByName('num_fab_prod').AsString),
    'FORMULA_PRODUCAO_PRODUTOS', cadFormulaProducao.dataSet.FieldByName('COD_FORMULA').AsString, cadFormulaProducao.buscas, True) then
    Exit;

  if cadFormulaProducao.vItemFormula.fequals('solvente', 'S') then
    cadFormulaProducao._apagarDadosSolvente
  else
  cadFormulaProducao.vItemFormula.Delete;
end;

procedure TfrmCadFormulaProd.BitBtn12Click(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaProdutos.Parent).ModalResult := IDOK;
end;

procedure TfrmCadFormulaProd.BitBtn13Click(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaProdutos.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadFormulaProd.BitBtn14Click(Sender: TObject);
begin
  inherited;
  TForm(pnTextAdicional.Parent).ModalResult := IDOK;
end;

procedure TfrmCadFormulaProd.BitBtn15Click(Sender: TObject);
begin
  inherited;
  TForm(pnTextAdicional.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadFormulaProd.BitBtn16Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
               
    if not vDadosIni.PesqPros('PPR027', 'INCLUIR',
      ' GRUPO: ' + cadFormulaProducao.vItemFormula.dataSet.FieldByName('grupo_prod').AsString +
      ' CODIGO: ' + trim(cadFormulaProducao.vItemFormula.dataSet.FieldByName('cod_prod').AsString) +
      ' NUM FAB: ' + trim(cadFormulaProducao.vItemFormula.dataSet.FieldByName('num_fab_prod').AsString),
      'FORMULA_PRODUCAO', cadFormulaProducao.dataSet.FieldByName('COD_FORMULA').AsString,
      cadFormulaProducao.buscas, True) then
      Exit;

    if cadFormulaProducao._salvarItemFormula then
      BitBtn17.Click
    else
      setFocusCampoErro(cadFormulaProducao.vItemFormula.vNomeCampoErro);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadFormulaProd.BitBtn17Click(Sender: TObject);
begin
  inherited;                              
  pnConsultaItensFormula.Visible := True;
  pnCadastroItensFormula.Visible := False;
  cadFormulaProducao.vItemFormula.Cancel;
end;

procedure TfrmCadFormulaProd.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [PPR020]';
  
  if not vDadosIni.PesqPros('PPR017', 'CONSULTA', '', 'FORMULA_PRODUCAO', '',
    cadFormulaProducao.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not cadFormulaProducao.ConsultaCampos('FORMULA_PRODUCAO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      'FORMULA_PRODUCAO.*, PL.DESCR_PROD PROD_SOLVENTE, PS.DESCR_PROD PROD_FORMULA, PL.NUM_FAB_PROD',
      ' LEFT JOIN PRODUTOS PL ON PL.GRUPO_PROD = FORMULA_PRODUCAO.GRUPO_PROD_SOLV AND PL.COD_PROD = FORMULA_PRODUCAO.COD_PROD_SOLV' +
      ' AND PL.COD_EMPRESA = FORMULA_PRODUCAO.COD_EMP_SOLV' +
      ' LEFT JOIN PRODUTOS PS ON PS.GRUPO_PROD = FORMULA_PRODUCAO.GRUPO_PROD_SOLV AND PS.COD_PROD = FORMULA_PRODUCAO.COD_PROD_SOLV' +
      ' AND PS.COD_EMPRESA = FORMULA_PRODUCAO.COD_EMP_SOLV', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus
  end
  else
    if cadFormulaProducao.ConsultaCampos('FORMULA_PRODUCAO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
      'FORMULA_PRODUCAO.*, PL.DESCR_PROD PROD_SOLVENTE, PS.DESCR_PROD PROD_FORMULA, PL.NUM_FAB_PROD',
      ' LEFT JOIN PRODUTOS PL ON PL.GRUPO_PROD = FORMULA_PRODUCAO.GRUPO_PROD_SOLV AND PL.COD_PROD = FORMULA_PRODUCAO.COD_PROD_SOLV' +
      ' AND PL.COD_EMPRESA = FORMULA_PRODUCAO.COD_EMP_SOLV' +
      ' LEFT JOIN PRODUTOS PS ON PS.GRUPO_PROD = FORMULA_PRODUCAO.GRUPO_PROD_SOLV AND PS.COD_PROD = FORMULA_PRODUCAO.COD_PROD_SOLV' +
      ' AND PS.COD_EMPRESA = FORMULA_PRODUCAO.COD_EMP_SOLV', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;

  for I := 0 to DBGrid1.Columns.Count - 1 do
    if (DBGrid1.Columns[i].FieldName = 'PROCESSO') or (DBGrid1.Columns[i].FieldName = 'TEXTO_IMPRESSAO1') or (DBGrid1.Columns[i].FieldName = 'TEXTO_IMPRESSAO2') then
      DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadFormulaProd.BitBtn3Click(Sender: TObject);
begin

  try
    if not vDadosIni.PesqPros('PPR018', 'INCLUIR', '', 'FORMULA_PRODUCAO',
      '', cadFormulaProducao.buscas, True) then
      Exit;
    if not cadFormulaProducao.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      cadFormulaProducao.Cancel;
      cadFormulaProducao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadFormulaProd.BitBtn4Click(Sender: TObject);
begin
  if not cadFormulaProducao.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(cadFormulaProducao.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if cadFormulaProducao.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        	DBEdit4.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadFormulaProd.BitBtn5Click(Sender: TObject);
begin
  inherited;
  cadFormulaProducao.Cancel;
  cadFormulaProducao.RollBackTransacao;
end;

procedure TfrmCadFormulaProd.BitBtn7Click(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaReceita.Parent).ModalResult := IDOK;
end;

procedure TfrmCadFormulaProd.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaReceita.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadFormulaProd.BitBtn9Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('PPR024', 'INCLUIR', '', 'FORMULA_PRODUCAO_PRODUTOS',
    cadFormulaProducao.dataSet.FieldByName('COD_FORMULA').AsString, cadFormulaProducao.buscas, true) then
    Exit;

  if not cadFormulaProducao.vItemFormula.Insert then
    Exit;
  pnCadastroItensFormula.Visible := True;
  DBEdit7.Enabled := True;

  if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
    DBEdit7.SetFocus;

  pnConsultaItensFormula.Visible := False;
end;

procedure TfrmCadFormulaProd.DBCheckBox1Exit(Sender: TObject);
begin
  inherited;
//  DBEdit2.Enabled := cadFormulaProducao.dataSet.FieldByName('usar_solvente').AsString = 'S';
end;

procedure TfrmCadFormulaProd.DBCheckBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
//  DBEdit2.Enabled := cadFormulaProducao.dataSet.FieldByName('usar_solvente').AsString = 'S';
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
    DBMemo1.SetFocus;
end;

procedure TfrmCadFormulaProd.DBEdit2Exit(Sender: TObject);
var
  Qtde: Double;
begin
  inherited;

  if ActiveControl = BitBtn5 then
    Exit;

  Qtde := cadFormulaProducao.vItemFormula.filterStr('solvente = ''S''').ffloat('quantidade');
  Qtde := IfThen(Qtde > 0, Qtde, 1);
  cadFormulaProducao.vItemFormula.filterClear;

  cadFormulaProducao._existeSolvente(cadFormulaProducao.fstr('num_fab_prod_s'), Qtde);
end;

procedure TfrmCadFormulaProd.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Qtde: Double;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Key = VK_F3 then
    begin
      vDadosIni.vPesquisa := trim(vDadosIni.pesquisaRapida('PRODUTOS', '', 'Pesquisa de Solvente'));
      if (Trim(vDadosIni.vPesquisa) <> '') and (Trim(vDadosIni.vPesquisa) <> '0') then
        if (cadFormulaProducao.dataSet.State in [dsInsert, dsEdit]) then
        begin
          Qtde := cadFormulaProducao.vItemFormula.filterStr('solvente = ''S''').ffloat('quantidade');
          Qtde := IfThen(Qtde > 0, Qtde, 1);
          cadFormulaProducao.vItemFormula.filterClear;

          cadFormulaProducao._existeSolvente(vDadosIni.vPesquisa, Qtde);
        end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFormulaProd.DBEdit7Exit(Sender: TObject);
begin
  inherited;

  if ActiveControl = BitBtn17 then
    Exit;


  cadFormulaProducao.vItemFormula._existeProduto(
    cadFormulaProducao.vItemFormula.dataSet.FieldByName('num_fab_prod').AsString);
end;

procedure TfrmCadFormulaProd.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;
      if cadFormulaProducao.vItemFormula.dataSet.State in [dsInsert, dsEdit] then
        cadFormulaProducao.vItemFormula.dataSet.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadFormulaProd.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadFormulaProd.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn12.Click;
end;

procedure TfrmCadFormulaProd.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(cadFormulaProducao.vItemFormula.dataSet.FieldByName('solvente').AsString) = 'S') then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadFormulaProd.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn7.Click;
end;

procedure TfrmCadFormulaProd.DetailBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  cadFormulaProducao.vItemFormula._abreItemFormula(cadFormulaProducao.dataSet.FieldByName('cod_formula').AsInteger);
  Inc(vTotalFormulas);
  vSomaItens := 0;
end;

procedure TfrmCadFormulaProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (cadFormulaProducao <> nil) then
    cadFormulaProducao.Cancel;

  if Assigned(lkTipoConversao) then FreeAndNil(lkTipoConversao);
    
  cadFormulaProducao.free;
  cadFormulaProducao := nil;

  Action := caFree;
  frmCadFormulaProd := nil;
end;

procedure TfrmCadFormulaProd.FormCreate(Sender: TObject);
begin

  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  cadFormulaProducao := TFormulaProducao.create;
  tscadastro.TabVisible := False;
  tsEscolhaReceita.TabVisible := False;
  tsEscolhaProdutos.TabVisible := False;
  tsRelatorios.TabVisible := False;
  tsTextAdicional.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  lkTipoConversao := TDadosLookUp_OOP.create;

  DBGrid1.DataSource := dtmProducao.dsFormula;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFormulaProd.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    DBGrid1.DataSource := dtmProducao.dsFormula;

  end;

  lkTipoConversao.setDadosDataSet(['U', 'P'], ['U - Unidade', 'P - Peso'], DBLookupComboBox1);

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;

  SpeedButton25.Visible := false;
  lixeiraVazia(not cadFormulaProducao._lixeiraCheia);

  vDadosIni.fechaStatusProcessamento;

end;

procedure TfrmCadFormulaProd.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  pnCadastroItensFormula.Visible := False;
  pnConsultaItensFormula.Visible := True;
  pnCadastroItensFormula.Align := alClient;
  pnConsultaItensFormula.Align := alClient;
  //DBEdit2.Enabled := cadFormulaProducao.dataSet.FieldByName('usar_solvente').AsString = 'S';
  //DBCheckBox1.Checked := cadFormulaProducao.dataSet.FieldByName('usar_solvente').AsString = 'S';

end;

procedure TfrmCadFormulaProd.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel16.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadFormulaProd.QRLabel29Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := IntToStr(vTotalFormulas);
end;

procedure TfrmCadFormulaProd.QRLabel2Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := cadFormulaProducao.dataSet.FieldByName('processo').AsString;
end;

procedure TfrmCadFormulaProd.QRLabel3Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := Format('%0.6f', [vSomaItens]);
end;

procedure TfrmCadFormulaProd.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  vSomaItens := vSomaItens + cadFormulaProducao.vItemFormula.dataSet.FieldByName('quantidade').AsFloat;
end;

procedure TfrmCadFormulaProd.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  vTotalFormulas := 0;
end;

procedure TfrmCadFormulaProd.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, QuickRep1.ReportTitle);
end;

procedure TfrmCadFormulaProd.SpeedButton10Click(Sender: TObject);
var
  Str: string;
begin
  inherited;
  if not InputQuery('Pesquisar', 'Informe parte do processo de produtção' , Str) then
    Exit;

  if cadFormulaProducao.dataSet.State in [dsInsert, dsEdit] then
    if cadFormulaProducao.vReceita._pesquisaReceita(Str) then
    begin
      if vDadosIni.abreForm('Escolha o Processo de Podução', pnEscolhaReceita, opFormsDefCad) then
      begin
        cadFormulaProducao.dataSet.FieldByName('processo').AsString := cadFormulaProducao.vReceita.fstr('processo_producao');
        if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
          DBMemo1.SetFocus;
      end;
    end;
end;

procedure TfrmCadFormulaProd.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  cadFormulaProducao._apagarDadosSolvente;
end;

procedure TfrmCadFormulaProd.SpeedButton1Click(Sender: TObject);
begin
  try
    if cadFormulaProducao.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('PPR019', 'ALTERAR', '', 'FORMULA_PRODUCAO',
      cadFormulaProducao.dataSet.FieldByName('COD_FORMULA').AsString, cadFormulaProducao.buscas, true) then
      exit;

    if not cadFormulaProducao.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      cadFormulaProducao.Cancel;
      cadFormulaProducao.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadFormulaProd.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PPR031', 'ABRIR A LIXEIRA', '', 'FORMULA_PRODUCAO',
    '', cadFormulaProducao.buscas, true) then
  Exit;

  inherited;

  if not cadFormulaProducao._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [PPR020]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [PPR021]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadFormulaProd.SpeedButton2Click(Sender: TObject);
begin
  try

    cadFormulaProducao.Delete;

    cadFormulaProducao.Refresh;

    lixeiraVazia(not cadFormulaProducao._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      cadFormulaProducao.Cancel;
      cadFormulaProducao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadFormulaProd.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  QuickRep1.Preview;
end;

procedure TfrmCadFormulaProd.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PPR022', '', '', 'FORMULA_PRODUCAO', '', cadFormulaProducao.buscas, false) then
    if cadFormulaProducao._restauraLixeira then
      lixeiraVazia(not cadFormulaProducao._lixeiraCheia);
end;

procedure TfrmCadFormulaProd.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if cadFormulaProducao.dataSet.IsEmpty then
    Exit;
  if not vDadosIni.PesqPros('PPR019', 'ALTERAR', '', 'FORMULA_PRODUCAO',
    cadFormulaProducao.dataSet.FieldByName('COD_FORMULA').AsString, cadFormulaProducao.buscas, true) then
    exit;

  if not cadFormulaProducao._alterarTextoAdicional then
    Exit;

end;

procedure TfrmCadFormulaProd.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  ShowAtencao('O tipo de conversão diz como as matérias primas serão convertidas' + sLineBreak + sLineBreak +
              'U - Unidade: Na produção para cada item da composição o sistema multiplica a' +
              ' quantidade do item da fórmula pela quantidade prevista a produzir' + sLineBreak + sLineBreak +
              'P - Peso: Na produção o sistema soma o peso dos itens da fórmula para saber' +
              ' a proporção em relação a quantidade prevista a produzir, sendo assim a' +
              ' quantidade do item atribuida na produção será baseada no peso');
end;

end.
