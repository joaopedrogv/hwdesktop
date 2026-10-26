unit UCadProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, udtmativo, uEditHw, uDataSet_OOP,
  UClassesProducao;

type
  THackWinControl = class(TWinControl);
  TfrmCadProducao = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    tsEscolhaProdutos: TTabSheet;
    pnEscolhaProdutos: TPanel;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    PopupMenu3: TPopupMenu;
    tsCadastroMateriasPrimasInsumos: TTabSheet;
    pnConsultaMateriasPrimasInsumos: TGroupBox;
    Panel8: TPanel;
    Panel9: TPanel;
    pnConsultaItensAcabados: TGroupBox;
    pnConsultaResultadoFinal: TPanel;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Panel7: TPanel;
    Panel6: TPanel;
    DBGrid4: TDBGrid;
    Panel12: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Panel11: TPanel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    CheckBox2: TCheckBox;
    bit: TPanel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn21: TBitBtn;
    Panel10: TPanel;
    Label35: TLabel;
    DBText10: TDBText;
    Panel15: TPanel;
    Label16: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label36: TLabel;
    DBText11: TDBText;
    Panel16: TPanel;
    Label15: TLabel;
    Label18: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    DBEdit21: TDBEdit;
    Panel17: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBText1: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    Label40: TLabel;
    DBText14: TDBText;
    tsEstoque: TTabSheet;
    pnEstoque: TGroupBox;
    Panel18: TPanel;
    Panel19: TPanel;
    DBGrid5: TDBGrid;
    Panel22: TPanel;
    BitBtn25: TBitBtn;
    BitBtn22: TBitBtn;
    Label41: TLabel;
    tsImportarPedido: TTabSheet;
    pnImportarPedido: TPanel;
    pnArquivoEletronico: TGroupBox;
    RadioGroup1: TRadioGroup;
    pnBancoDeDados: TGroupBox;
    Edit1: TEdit;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn26: TBitBtn;
    OpenDialog1: TOpenDialog;
    Panel20: TPanel;
    GroupBox5: TGroupBox;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    SpeedButton14: TSpeedButton;
    edDataIniPC: TMaskEdit;
    edDataFimPC: TMaskEdit;
    edNpedPC: TEditHw;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    Panel21: TPanel;
    GroupBox6: TGroupBox;
    Panel23: TPanel;
    Panel24: TPanel;
    DBGrid6: TDBGrid;
    Label42: TLabel;
    pnImportarPedido2: TPanel;
    GroupBox8: TGroupBox;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel28: TPanel;
    DBGrid7: TDBGrid;
    BitBtn30: TBitBtn;
    Panel27: TPanel;
    Label44: TLabel;
    DBEdit25: TDBEdit;
    Label45: TLabel;
    BitBtn31: TBitBtn;
    Label47: TLabel;
    Label48: TLabel;
    Panel29: TPanel;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    pn_mp_insumo: TPanel;
    ts_modais: TTabSheet;
    PageControl2: TPageControl;
    ts_acab: TTabSheet;
    ts_mp: TTabSheet;
    pn_it_mp: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    DBText9: TDBText;
    Label34: TLabel;
    Label17: TLabel;
    lb_grade_mp: TLabel;
    Panel14: TPanel;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn32: TBitBtn;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    lk_grade_mp: TDBLookupComboBox;
    pnCadastroResultadoFinal: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    DBText8: TDBText;
    Label13: TLabel;
    lb_grade_it: TLabel;
    Panel60: TPanel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn106: TBitBtn;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit22: TDBEdit;
    lk_grade_it: TDBLookupComboBox;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    bt_variacao: TBitBtn;
    ts_variacao: TTabSheet;
    pn_variacao: TPanel;
    pn_var_top: TPanel;
    pn_var_client: TPanel;
    pn_var_bottom: TPanel;
    tv_var: TTreeView;
    bt_variacao_voltar: TBitBtn;
    bt_variacao_save: TBitBtn;
    bt_variacao_todos: TBitBtn;
    Label43: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    SpeedButton59: TSpeedButton;
    BitBtn35: TBitBtn;
    ts_qtde_final: TTabSheet;
    pnQtdeFinalAcabado: TPanel;
    Label46: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    DBText18: TDBText;
    Label55: TLabel;
    Panel30: TPanel;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure PageControl3Enter(Sender: TObject);
    procedure bt_variacao_saveClick(Sender: TObject);
    procedure bt_variacao_voltarClick(Sender: TObject);
    procedure bt_variacao_todosClick(Sender: TObject);
    procedure bt_variacaoClick(Sender: TObject);
    procedure pn_it_mpEnter(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn106Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure DBGrid6DblClick(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn30Click(Sender: TObject);
    procedure pnImportarPedidoEnter(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup1Exit(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure DBGrid6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure pnEstoqueEnter(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit23Exit(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GroupBox4Enter(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure pnCadastroResultadoFinalExit(Sender: TObject);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit12Exit(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7Exit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Flk_grade: TDadosLookUp_OOP;
    Fvariacao: TProdVariacao;
    lkTipoConversao: TDadosLookUp_OOP;

    procedure validar_grades_indice(Sender: TObject);
    procedure variacoes_producao_make(Sender: TObject);
    procedure tipo_fomula_producao_change(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmCadProducao: TfrmCadProducao;

implementation

uses
  udtmProducao, DB, uDadosIni, UClassesClientes, produtos_pdc_var_class,
  produtos_pdc_var_it_class;

{$R *.dfm}

procedure TfrmCadProducao.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PPR001', 'CONSULTA', '', 'PRODUCAO', '',
    cadProducao.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not cadProducao.ConsultaCampos('PRODUCAO', ComboBox1.Text,
      cadProducao.dataSet.FieldByName('cod_producao').DisplayLabel, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      'PRODUCAO.*,CLIENTES.NOME_CLIENTE,CLIENTES.RAZAO',
      'LEFT JOIN CLIENTES ON PRODUCAO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES.COD_EMPRESA = PRODUCAO.COD_EMPRESA ', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus
  end
  else
    if cadProducao.ConsultaCampos('PRODUCAO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, cadProducao.dataSet.FieldByName('cod_producao').DisplayLabel, true, vDadosIni.codEmpresa,
      'PRODUCAO.*,CLIENTES.NOME_CLIENTE,CLIENTES.RAZAO',
      'LEFT JOIN CLIENTES ON PRODUCAO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES.COD_EMPRESA=PRODUCAO.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadProducao.BitBtn20Click(Sender: TObject);
begin
  inherited;
  {
  Panel6.Visible := True;
  Panel13.Visible := False;
  cadProducao.vItemIndice.dataSet.Cancel;
  cadProducao.vItemIndice._filtrarItemIndice(
    cadProducao.vItemAcabado.dataSet.FieldByName('nitem').AsInteger, CheckBox2.Checked);
  if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
    DBGrid4.SetFocus;
    }
end;

procedure TfrmCadProducao.BitBtn21Click(Sender: TObject);
begin
  inherited;

  if cadProducao.vItemIndice.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('PPR013', 'ALTERAR',
    ' GRUPO: ' + cadProducao.vItemIndice.dataSet.FieldByName('grupo_prod').AsString +
    ' CODIGO: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('cod_prod').AsString) +
    ' NUM FAB: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('num_fab_prod').AsString) +
    ' PERDA: ' + Format('%0.6f', [cadProducao.vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat]),
    'PRODUCAO_ITEM_INDICE', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    Exit;

  if cadProducao.vItemIndice.Edit then
  begin
    pn_it_mp.Tag := 3; //perda
    cadProducao.vItemIndice.vUltimoProcesso := 'PPR013';
    
    with cadProducao do
      Flk_grade.setDadosDataSet('cod_grade', 'descricao',
                                grades.getGradesDisponiveis(vItemIndice.f_int('grupo_prod'), vItemIndice.f_str('cod_prod'), vItemIndice.f_int('cod_grade')).dataSet,
                                lk_grade_mp);

    lk_grade_mp.Visible := not cadProducao.grades.dataSet.IsEmpty;
    lb_grade_mp.Visible := not cadProducao.grades.dataSet.IsEmpty;

    vDadosIni.abreForm('Matéria Prima / Insumo', pn_it_mp, opFormsDefCadEsc);
    if cadProducao.vItemIndice.dataSet.State in [DsEdit, dsInsert] then
      cadProducao.vItemIndice.Cancel;
      
    {
    Label32.Visible := True;
    Label33.Visible := True;
    DBEdit15.Visible := True;
    DBEdit24.Visible := True;

    Panel13.Visible := True;

    DBEdit12.Enabled := False;
    DBEdit14.Enabled := False;
    DBEdit23.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit15.CanFocus) then
      DBEdit15.SetFocus;

    Panel6.Visible := False;
    }
  end;
end;

procedure TfrmCadProducao.BitBtn22Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PPR037', 'CONFIRMAR', '', 'PRODUCAO',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    Exit;
  TForm(pnEstoque.Parent).ModalResult := IDOK;
end;

procedure TfrmCadProducao.BitBtn23Click(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
    
end;

procedure TfrmCadProducao.BitBtn24Click(Sender: TObject);
var
  vLista: TStringList;
begin
  inherited;
  if not FileExists(Trim(Edit1.Text)) then
  begin
    Application.MessageBox('Arquivo não encontrado', 'Atenção', 0 + 64 );
    Exit;
  end;

  vLista := TStringList.Create;
  vLista.LoadFromFile(Trim(Edit1.Text));

  if cadProducao._efetuarLeituraDeArquivo(vLista) then
    if cadProducao._abreFormImportacaoPedidoCompraConclusao then
      TForm(pnImportarPedido.Parent).ModalResult := IDOK;
end;

procedure TfrmCadProducao.BitBtn25Click(Sender: TObject);
begin
  inherited;
  TForm(pnEstoque.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadProducao.BitBtn26Click(Sender: TObject);
begin
  inherited;
  TForm(pnImportarPedido.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadProducao.BitBtn27Click(Sender: TObject);
begin
  inherited;
  if cadProducao.vPedCompra._pesquisaPedCompra(edNpedPC.AsInteger, edDataIniPC.Text, edDataFimPC.Text) then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
    	DBGrid6.SetFocus;
end;

procedure TfrmCadProducao.BitBtn28Click(Sender: TObject);
begin
  inherited;
  if cadProducao.vPedCompra._montaPedidoCompra then
    if cadProducao._efetuarLeituraDeArquivo(cadProducao.vPedCompra._getLista) then
      if cadProducao._abreFormImportacaoPedidoCompraConclusao then
        TForm(pnImportarPedido.Parent).ModalResult := IDOK;
end;

procedure TfrmCadProducao.BitBtn30Click(Sender: TObject);
begin
  inherited;
  TForm(pnImportarPedido2.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadProducao.BitBtn31Click(Sender: TObject);
begin
  inherited;
  if cadProducao._montarProducaoAPartirPedidoCompra then
    TForm(pnImportarPedido2.Parent).ModalResult := IDOK;
end;

procedure TfrmCadProducao.BitBtn32Click(Sender: TObject);
begin
  inherited;
  if not cadProducao.vItemIndice.IsEmpty then
    vDadosIni.abreFormImagensProduto(cadProducao.vItemIndice.dataSet.FieldByName('DESCR_PROD').AsString,
      cadProducao.vItemIndice.dataSet.FieldByName('GRUPO_PROD').AsString, cadProducao.vItemIndice.dataSet.FieldByName('COD_PROD').AsString,
      cadProducao.vItemIndice.dataSet.FieldByName('NUM_FAB_PROD').AsString,
      0, 0, cadProducao.buscas);
end;

procedure TfrmCadProducao.BitBtn35Click(Sender: TObject);
begin
  inherited;


  if not vDadosIni.PesqPros('PPR008', 'ALTERAR',
    ' GRUPO: ' + cadProducao.vItemAcabado.dataSet.FieldByName('grupo_prod').AsString +
    ' CODIGO: ' + trim(cadProducao.vItemAcabado.dataSet.FieldByName('cod_prod').AsString) +
    ' NUM FAB: ' + trim(cadProducao.vItemAcabado.dataSet.FieldByName('num_fab_prod').AsString) +
    ' QTDE: ' + Format('%0.6f', [cadProducao.vItemAcabado.dataSet.FieldByName('quantidade').AsFloat]),
    'PRODUCAO_ITEM', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, True) then
    Exit;

  if cadProducao.vItemAcabado.Edit then
  begin
    DBEdit7.Enabled := False;
    with cadProducao do
      Flk_grade.setDadosDataSet('cod_grade', 'descricao',
                                grades.getGradesDisponiveis(vItemAcabado.f_int('grupo_prod'), vItemAcabado.f_str('cod_prod'), vItemAcabado.f_int('cod_grade')).dataSet,
                                lk_grade_it);

    lk_grade_it.Visible := not cadProducao.grades.dataSet.IsEmpty;
    lb_grade_it.Visible := not cadProducao.grades.dataSet.IsEmpty;

    vDadosIni.abreForm('Item a produzir', pnQtdeFinalAcabado, opFormsDefCadEsc);
    if cadProducao.vItemAcabado.dataSet.State in [DsEdit, dsInsert] then
      cadProducao.vItemAcabado.Cancel;
  end;
end;

procedure TfrmCadProducao.BitBtn36Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('PPR040', 'SALVAR',
      ' GRUPO: ' + cadProducao.vItemAcabado.dataSet.FieldByName('grupo_prod').AsString +
      ' CODIGO: ' + trim(cadProducao.vItemAcabado.dataSet.FieldByName('cod_prod').AsString) +
      ' NUM FAB: ' + trim(cadProducao.vItemAcabado.dataSet.FieldByName('num_fab_prod').AsString),
      'PRODUCAO_ITEM', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString,
      cadProducao.buscas, True) then
      Exit;

    if cadProducao._salvarQtdeFinalItemAcabado() then
      BitBtn37.Click
    else
      setFocusCampoErro(cadProducao.vItemAcabado.vNomeCampoErro);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProducao.bt_variacao_saveClick(Sender: TObject);
begin
  inherited;
  if Fvariacao.SaveCurrent then
    bt_variacao_save.Visible := False;
end;

procedure TfrmCadProducao.bt_variacao_todosClick(Sender: TObject);
begin
  inherited;
  pn_var_top.Visible := False;
  bt_variacao_save.Visible := False;  
  tv_var.Items.Clear;
  variacoes_producao_make(Fvariacao);
end;

procedure TfrmCadProducao.BitBtn3Click(Sender: TObject);
begin
  try
    if not vDadosIni.PesqPros('PPR002', 'INCLUIR', '', 'PRODUCAO',
      '', cadProducao.buscas, True) then
      Exit;
    if cadProducao.Insert then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsCadastro;

      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        DBEdit3.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
    end;

  except
  on E: Exception do
  begin
    Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    vDadosIni.registraErro(e.Message);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    cadProducao.Cancel;
    cadProducao.RollBackTransacao;
  end;


  end;
end;

procedure TfrmCadProducao.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;

  if Application.MessageBox('Salvar dados da produção', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;  

  if not cadProducao.Post then
    setFocusCampoErro(cadProducao.vNomeCampoErro)
  else
    inherited;

end;

procedure TfrmCadProducao.BitBtn5Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PPR006', 'CANCELAR', '', 'PRODUCAO',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    Exit;

  inherited;
  cadProducao.Cancel;
  cadProducao.RollBackTransacao;
end;

procedure TfrmCadProducao.BitBtn7Click(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaProdutos.Parent).ModalResult := IDOK;
end;

procedure TfrmCadProducao.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaProdutos.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadProducao.BitBtn9Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('PPR007', 'INCLUIR', '', 'PRODUCAO_ITEM',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    Exit;

  if cadProducao.vItemAcabado.Insert then
  begin
    DBEdit7.Enabled := True;
    lk_grade_it.Visible := False;
    lb_grade_it.Visible := False;
    DBEdit7.OnExit := DBEdit7Exit;

    vDadosIni.abreForm('Item a produzir', pnCadastroResultadoFinal, opFormsDefCadEsc);
    if cadProducao.vItemAcabado.dataSet.State in [DsEdit, dsInsert] then
      cadProducao.vItemAcabado.Cancel;
    {
    pnCadastroResultadoFinal.Visible := True;

    try
      DBEdit7.OnExit := nil;

      DBEdit7.Enabled := True;
      if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
        DBEdit7.SetFocus;

    finally
      DBEdit7.OnExit := DBEdit7Exit;
    end;

    pnConsultaResultadoFinal.Visible := False;
    }
  end;

end;

procedure TfrmCadProducao.bt_variacaoClick(Sender: TObject);
begin
  inherited;

  if cadProducao.vItemAcabado.dataSet.IsEmpty then
    Exit;

  bt_variacao_save.Visible := False;

  Fvariacao := TProdVariacao.Create;
  try

    with cadProducao.vItemAcabado do
    begin
      Fvariacao.current := Fvariacao.makeVariacoes(fint('grupo_prod'), fstr('cod_prod'), fint('cod_grade')).
                                       getVariacao(fint('grupo_prod'), fstr('cod_prod'), fint('cod_grade'));

      if not Assigned(Fvariacao.current) then
      begin
        Fvariacao.current := Fvariacao.New;
        bt_variacao_save.Visible := True;
      end;

      with Fvariacao.current do
      begin
        grupo_prod  := fint('grupo_prod');
        cod_prod    := fstr('cod_prod');
        cod_grade   := fint('cod_grade');
        descricao   := fstr('descr_prod');
        cadProducao.vItemIndice.prepare_loop(Format('nitem = %d and cod_grade <> 0', [fint('nitem')]));
        try
          while not cadProducao.vItemIndice.dataSet.Eof do
          begin
            if not Assigned(itens.getVariacaoItem(cadProducao.vItemIndice.fint('grupo_prod'),
                                                  cadProducao.vItemIndice.fstr('cod_prod'),
                                                  cadProducao.vItemIndice.fint('cod_grade'))) then
              with itens.New do
              begin
                grupo_prod  := cadProducao.vItemIndice.fint('grupo_prod');
                cod_prod    := cadProducao.vItemIndice.fstr('cod_prod');
                cod_grade   := cadProducao.vItemIndice.fint('cod_grade');
                descricao   := cadProducao.vItemIndice.fstr('descr_prod');
                bt_variacao_save.Visible := True;
              end;
            cadProducao.vItemIndice.dataSet.Next;
          end;
        finally
          cadProducao.vItemIndice.prepare_loop_done;
        end;
      end;
    end;

    tv_var.Items.Clear;
    pn_var_top.Visible := True;
    pn_var_top.Caption := Format('[%d-%s] - %s', [Fvariacao.current.grupo_prod, Fvariacao.current.cod_prod, Fvariacao.current.descricao]);

    variacoes_producao_make(Fvariacao.current);

    vDadosIni.abreForm('Variações de produção pela Grade', pn_variacao, opFormsDefCad + [ofBISystemMenuOff]);

  finally
    FreeAndNil(Fvariacao);
  end;
end;

procedure TfrmCadProducao.bt_variacao_voltarClick(Sender: TObject);
begin
  inherited;
  tv_var.Items.Clear;
end;

procedure TfrmCadProducao.CheckBox2Click(Sender: TObject);
begin
  inherited;
  cadProducao.vItemIndice._filtrarItemIndice(
    cadProducao.vItemAcabado.dataSet.FieldByName('nitem').AsInteger, CheckBox2.Checked);
  BitBtn13.Enabled := CheckBox2.Checked;
  BitBtn14.Enabled := CheckBox2.Checked;
  BitBtn21.Enabled := CheckBox2.Checked;
end;

procedure TfrmCadProducao.BitBtn17Click(Sender: TObject);
begin
  inherited;
  {
  DBEdit7.OnExit := nil;
  cadProducao.vItemAcabado.Cancel;

  pnConsultaResultadoFinal.Visible := True;
  pnCadastroResultadoFinal.Visible := False;

  if (Self.Enabled) and (Self.Visible) and (BitBtn9.CanFocus) then
    BitBtn9.SetFocus
  }
end;

procedure TfrmCadProducao.BitBtn18Click(Sender: TObject);
begin
  inherited;
  TForm(pn_mp_insumo.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadProducao.BitBtn19Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('PPR015', 'SALVAR',
      ' GRUPO: ' + cadProducao.vItemIndice.dataSet.FieldByName('grupo_prod').AsString +
      ' CODIGO: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('cod_prod').AsString) +
      ' NUM FAB: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('num_fab_prod').AsString) ,
      'PRODUCAO_ITEM_INDICE', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString,
      cadProducao.buscas, True) then
      Exit;

    if (not Panel11.Visible) and (cadProducao._salvarItemIndice(True)) then
      TForm(pn_it_mp.Parent).ModalResult := IDOK
    else if (Panel11.Visible) and (cadProducao._salvarItemIndice) then
      TForm(pn_it_mp.Parent).ModalResult := IDOK
    else
      setFocusCampoErro(cadProducao.vItemIndice.vNomeCampoErro);
  finally
    cadProducao.vItemIndice._filtrarItemIndice(
      cadProducao.vItemAcabado.dataSet.FieldByName('nitem').AsInteger, CheckBox2.Checked);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProducao.BitBtn106Click(Sender: TObject);
begin
  inherited;
  if not cadProducao.vItemAcabado.IsEmpty then
    vDadosIni.abreFormImagensProduto(cadProducao.vItemAcabado.dataSet.FieldByName('DESCR_PROD').AsString,
      cadProducao.vItemAcabado.dataSet.FieldByName('GRUPO_PROD').AsString, cadProducao.vItemAcabado.dataSet.FieldByName('COD_PROD').AsString,
      cadProducao.vItemAcabado.dataSet.FieldByName('NUM_FAB_PROD').AsString,
      0, 0, cadProducao.buscas);
end;

procedure TfrmCadProducao.BitBtn10Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('PPR008', 'ALTERAR',
    ' GRUPO: ' + cadProducao.vItemAcabado.dataSet.FieldByName('grupo_prod').AsString +
    ' CODIGO: ' + trim(cadProducao.vItemAcabado.dataSet.FieldByName('cod_prod').AsString) +
    ' NUM FAB: ' + trim(cadProducao.vItemAcabado.dataSet.FieldByName('num_fab_prod').AsString) +
    ' QTDE: ' + Format('%0.6f', [cadProducao.vItemAcabado.dataSet.FieldByName('quantidade').AsFloat]),
    'PRODUCAO_ITEM', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, True) then
    Exit;

  if cadProducao.vItemAcabado.Edit then
  begin
    DBEdit7.Enabled := False;
    with cadProducao do
      Flk_grade.setDadosDataSet('cod_grade', 'descricao',
                                grades.getGradesDisponiveis(vItemAcabado.f_int('grupo_prod'), vItemAcabado.f_str('cod_prod'), vItemAcabado.f_int('cod_grade')).dataSet,
                                lk_grade_it);

    lk_grade_it.Visible := not cadProducao.grades.dataSet.IsEmpty;
    lb_grade_it.Visible := not cadProducao.grades.dataSet.IsEmpty;

    vDadosIni.abreForm('Item a produzir', pnCadastroResultadoFinal, opFormsDefCadEsc);
    if cadProducao.vItemAcabado.dataSet.State in [DsEdit, dsInsert] then
      cadProducao.vItemAcabado.Cancel;
    {
    pnCadastroResultadoFinal.Visible := True;

    DBEdit7.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus;

    pnConsultaResultadoFinal.Visible := False;
    }
  end;

end;

procedure TfrmCadProducao.BitBtn11Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('PPR012', 'EXCLUIR',
    ' GRUPO: ' + cadProducao.vItemIndice.dataSet.FieldByName('grupo_prod').AsString +
    ' CODIGO: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('cod_prod').AsString) +
    ' NUM FAB: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('num_fab_prod').AsString),
    'PRODUCAO_ITEM_INDICE', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, True) then
    Exit;

  cadProducao._apagaItem;
  
end;

procedure TfrmCadProducao.BitBtn12Click(Sender: TObject);
begin
  inherited;
  cadProducao.vItemIndice._filtrarItemIndice(
    cadProducao.vItemAcabado.dataSet.FieldByName('nitem').AsInteger, CheckBox2.Checked);
  BitBtn13.Enabled := CheckBox2.Checked;
  BitBtn14.Enabled := CheckBox2.Checked;
  BitBtn21.Enabled := CheckBox2.Checked;
  Panel6.Visible := True;
//  Panel13.Visible := False;
//  Panel13.Align := alClient;  
  vDadosIni.abreForm('Consulta de Matérias Primas / Insumos utilizadas na Produção', pn_mp_insumo, [ofAlignAllClientWinCtrl, ofBIMinimizeOff, ofStoreMaximized]);
end;

procedure TfrmCadProducao.BitBtn13Click(Sender: TObject);
begin
  inherited;

  if vDadosIni.vEmp.vUsarProducao = 'S' then
    if cadProducao.vItemAcabado.dataSet.IsEmpty then
      Exit;
  
  if not vDadosIni.PesqPros('PPR010', 'INCLUIR', '', 'PRODUCAO_ITEM_INDICE',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    Exit;

  if cadProducao.vItemIndice.Insert then
  begin
    pn_it_mp.Tag := 1; //incluir
    lk_grade_mp.Visible := False;
    lb_grade_mp.Visible := False;
    DBEdit12.OnExit := DBEdit12Exit;

    vDadosIni.abreForm('Matéria Prima / Insumo', pn_it_mp, opFormsDefCadEsc);
    if cadProducao.vItemIndice.dataSet.State in [DsEdit, dsInsert] then
      cadProducao.vItemIndice.Cancel;
    {
    Label32.Visible := False;
    Label33.Visible := False;
    DBEdit15.Visible := False;
    DBEdit24.Visible := False;

    Panel13.Visible := True;

    try
      DBEdit12.OnExit := nil;

      DBEdit14.Enabled := True;
      DBEdit23.Enabled := True;
      DBEdit12.Enabled := True;
      if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
        DBEdit12.SetFocus;

    finally
      DBEdit12.OnExit := DBEdit12Exit;
    end;

    Panel6.Visible := False;
    }
  end;

end;

procedure TfrmCadProducao.BitBtn14Click(Sender: TObject);
begin
  inherited;

  if cadProducao.vItemIndice.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('PPR011', 'ALTERAR',
    ' GRUPO: ' + cadProducao.vItemIndice.dataSet.FieldByName('grupo_prod').AsString +
    ' CODIGO: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('cod_prod').AsString) +
    ' NUM FAB: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('num_fab_prod').AsString) +
    ' QTDE UTILIZ: ' + Format('%0.6f', [cadProducao.vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat]),
    'PRODUCAO_ITEM_INDICE', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    Exit;

  if cadProducao.vItemIndice.Edit then
  begin
    pn_it_mp.Tag := 2; //alterar
    cadProducao.vItemIndice.vUltimoProcesso := 'PPR011';
    
    with cadProducao do
      Flk_grade.setDadosDataSet('cod_grade', 'descricao',
                                grades.getGradesDisponiveis(vItemIndice.f_int('grupo_prod'), vItemIndice.f_str('cod_prod'), vItemIndice.f_int('cod_grade')).dataSet,
                                lk_grade_mp);

    lk_grade_mp.Visible := not cadProducao.grades.dataSet.IsEmpty;
    lb_grade_mp.Visible := not cadProducao.grades.dataSet.IsEmpty;

    vDadosIni.abreForm('Matéria Prima / Insumo', pn_it_mp, opFormsDefCadEsc);
    if cadProducao.vItemIndice.dataSet.State in [DsEdit, dsInsert] then
      cadProducao.vItemIndice.Cancel;
  
    {
    Label32.Visible := False;
    Label33.Visible := False;
    DBEdit15.Visible := False;
    DBEdit24.Visible := False;

    Panel13.Visible := True;

    DBEdit14.Enabled := True;
    DBEdit23.Enabled := True;
    DBEdit12.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit14.CanFocus) then
      DBEdit14.SetFocus;

    Panel6.Visible := False;
    }
  end;
end;

procedure TfrmCadProducao.BitBtn15Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('PPR009', 'EXCLUIR',
    ' GRUPO: ' + cadProducao.vItemIndice.dataSet.FieldByName('grupo_prod').AsString +
    ' CODIGO: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('cod_prod').AsString) +
    ' NUM FAB: ' + trim(cadProducao.vItemIndice.dataSet.FieldByName('num_fab_prod').AsString),
    'PRODUCAO_ITEM', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString,
    cadProducao.buscas, True) then
    Exit;

  cadProducao.vItemIndice.Delete;
  cadProducao._somarPesoTotalIndice;
end;

procedure TfrmCadProducao.BitBtn16Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
               
    if not vDadosIni.PesqPros('PPR014', 'SALVAR',
      ' GRUPO: ' + cadProducao.vItemAcabado.dataSet.FieldByName('grupo_prod').AsString +
      ' CODIGO: ' + trim(cadProducao.vItemAcabado.dataSet.FieldByName('cod_prod').AsString) +
      ' NUM FAB: ' + trim(cadProducao.vItemAcabado.dataSet.FieldByName('num_fab_prod').AsString),
      'PRODUCAO_ITEM', cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString,
      cadProducao.buscas, True) then
      Exit;
                     
    cadProducao.onValidateGradesIndices := validar_grades_indice;

    if cadProducao._salvarItemAcabado then
      BitBtn17.Click
    else
      setFocusCampoErro(cadProducao.vItemAcabado.vNomeCampoErro);
  finally
    cadProducao.onValidateGradesIndices := nil;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProducao.DBEdit12Exit(Sender: TObject);
begin
  inherited;

  if TForm(pn_it_mp.Parent).ActiveControl = BitBtn20 then
    Exit;

  if cadProducao.vItemIndice._existeProduto(
    cadProducao.vItemIndice.dataSet.FieldByName('num_fab_prod').AsString) then
  begin
    with cadProducao do
      Flk_grade.setDadosDataSet('cod_grade', 'descricao',
                                grades.getGradesDisponiveis(vItemIndice.f_int('grupo_prod'), vItemIndice.f_str('cod_prod'), vItemIndice.f_int('cod_grade')).dataSet,
                                lk_grade_mp);

    lk_grade_mp.Visible := not cadProducao.grades.dataSet.IsEmpty;
    lb_grade_mp.Visible := not cadProducao.grades.dataSet.IsEmpty;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
    DBEdit12.SetFocus;
end;

procedure TfrmCadProducao.DBEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Key = VK_F3 then
    begin
      vDadosIni.vPesquisa := trim(vDadosIni.pesquisaRapida('PRODUTOS', '', 'Pesquisa de Matérias Primas ou Insumos'));
      if (Trim(vDadosIni.vPesquisa) <> '') and (Trim(vDadosIni.vPesquisa) <> '0') then
        if (cadProducao.vItemIndice.dataSet.State in [dsInsert, dsEdit]) then
        begin
          if cadProducao.vItemIndice._existeProduto(vDadosIni.vPesquisa) then
            if DBEdit9.CanFocus then
            begin
              try
                DBEdit7.OnExit := nil;
                if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
                	DBEdit9.SetFocus;
              finally
                DBEdit7.OnExit := DBEdit7Exit;
              end;
            end;
        end;
    end;      

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProducao.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  if (cadProducao.vItemIndice.dataSet.State in [dsInsert, dsEdit]) then
    if cadProducao.vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat > 0 then
      cadProducao.vItemIndice.dataSet.FieldByName('peso_util').AsFloat :=
        cadProducao.vItemIndice.dataSet.FieldByName('peso_un').AsFloat *
        cadProducao.vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat;
end;

procedure TfrmCadProducao.DBEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
    if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
      DBEdit12.SetFocus;
end;

procedure TfrmCadProducao.DBEdit15Exit(Sender: TObject);
begin
  inherited;
  if (cadProducao.vItemIndice.dataSet.State in [dsInsert, dsEdit]) then
    if cadProducao.vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat > 0 then
      cadProducao.vItemIndice.dataSet.FieldByName('peso_perda').AsFloat :=
        cadProducao.vItemIndice.dataSet.FieldByName('peso_un').AsFloat *
        cadProducao.vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat;
end;

procedure TfrmCadProducao.DBEdit22Exit(Sender: TObject);
begin
  inherited;
  if (cadProducao.vItemAcabado.dataSet.State in [dsInsert, dsEdit]) then
    if cadProducao.vItemAcabado.dataSet.FieldByName('peso_util').AsFloat > 0 then
      cadProducao.vItemAcabado.dataSet.FieldByName('quantidade').AsFloat :=
        cadProducao.vItemAcabado.dataSet.FieldByName('peso_util').AsFloat /
        cadProducao.vItemAcabado.dataSet.FieldByName('peso_un').AsFloat;
end;

procedure TfrmCadProducao.DBEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
    if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus;
end;

procedure TfrmCadProducao.DBEdit23Exit(Sender: TObject);
begin
  inherited;
  if (cadProducao.vItemIndice.dataSet.State in [dsInsert, dsEdit]) then
    if cadProducao.vItemIndice.dataSet.FieldByName('peso_util').AsFloat > 0 then
      cadProducao.vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat :=
        cadProducao.vItemIndice.dataSet.FieldByName('peso_util').AsFloat /
        cadProducao.vItemIndice.dataSet.FieldByName('peso_un').AsFloat;
end;

procedure TfrmCadProducao.DBEdit24Exit(Sender: TObject);
begin
  inherited;
  if (cadProducao.vItemIndice.dataSet.State in [dsInsert, dsEdit]) then
    if cadProducao.vItemIndice.dataSet.FieldByName('peso_perda').AsFloat > 0 then
      cadProducao.vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat :=
        cadProducao.vItemIndice.dataSet.FieldByName('peso_perda').AsFloat /
        cadProducao.vItemIndice.dataSet.FieldByName('peso_un').AsFloat;
end;

procedure TfrmCadProducao.DBEdit25Exit(Sender: TObject);
begin
  inherited;
  if DBEdit25.DataSource.DataSet.FieldByName(DBEdit25.DataField).AsFloat <= 0 then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
    	DBEdit25.SetFocus;
end;

procedure TfrmCadProducao.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if cadProducao._producaoFechada then
      exit;

    if cadProducao.vClientes._existeCliente(cadProducao.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
      cadProducao.vClientes._selecionaCliente(cadProducao.dataSet.FieldByName('COD_CLIENTE').AsInteger)
    else if cadProducao.dataSet.State in [dsEdit, dsInsert] then
      cadProducao.dataSet.FieldByName('COD_CLIENTE').Value := Null;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProducao.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if cadProducao._producaoFechada then
      exit;
    if Key = VK_F3 then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
      if (Trim(vDadosIni.vPesquisa) <> '') and (Trim(vDadosIni.vPesquisa) <> '0') then
        if cadProducao.vClientes._existeCliente(StrToInt(Trim(vDadosIni.vPesquisa))) then
        begin
          cadProducao.dataSet.FieldByName('COD_CLIENTE').AsString := Trim(vDadosIni.vPesquisa);
          cadProducao.vClientes._selecionaCliente(cadProducao.dataSet.FieldByName('COD_CLIENTE').AsInteger)
        end;
    end
    else if Key = VK_F4 then
    begin
      vCliente := TCadClientes.create;
      vCliente.CadCliente(1);
      if (Trim(vDadosIni.vPesquisa) <> '') and (Trim(vDadosIni.vPesquisa) <> '0') then
        cadProducao.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProducao.DBEdit7Exit(Sender: TObject);
begin
  inherited;

  if TForm(pnCadastroResultadoFinal.Parent).ActiveControl = BitBtn17 then
    Exit;

  if cadProducao.vItemAcabado._existeProduto(cadProducao.vItemAcabado.f_str('num_fab_prod')) then
  begin
    with cadProducao do
      Flk_grade.setDadosDataSet('cod_grade', 'descricao',
                                grades.getGradesDisponiveis(vItemAcabado.f_int('grupo_prod'), vItemAcabado.f_str('cod_prod'), vItemAcabado.f_int('cod_grade')).dataSet,
                                lk_grade_it);

    lk_grade_it.Visible := not cadProducao.grades.dataSet.IsEmpty;
    lb_grade_it.Visible := not cadProducao.grades.dataSet.IsEmpty;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
    DBEdit7.SetFocus;
end;

procedure TfrmCadProducao.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Key = VK_F3 then
    begin
      vDadosIni.vPesquisa := trim(vDadosIni.pesquisaRapida('PRODUTOS', ' and PRODUTOS.tipo_item = ''04'' ', 'Pesquisa de produto acabado'));
      if (Trim(vDadosIni.vPesquisa) <> '') and (Trim(vDadosIni.vPesquisa) <> '0') then
        if (cadProducao.vItemAcabado.dataSet.State in [dsInsert, dsEdit]) then
        begin
          if cadProducao.vItemAcabado._existeProduto(vDadosIni.vPesquisa) then
            if DBEdit9.CanFocus then
            begin
              try
                DBEdit7.OnExit := nil;
                if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
                	DBEdit9.SetFocus;
              finally
                DBEdit7.OnExit := DBEdit7Exit;
              end;
            end;
        end;
    end;      

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProducao.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  if (cadProducao.vItemAcabado.dataSet.State in [dsInsert, dsEdit]) then
    if cadProducao.vItemAcabado.dataSet.FieldByName('quantidade').AsFloat > 0 then
      cadProducao.vItemAcabado.dataSet.FieldByName('peso_util').AsFloat :=
        cadProducao.vItemAcabado.dataSet.FieldByName('peso_un').AsFloat *
        cadProducao.vItemAcabado.dataSet.FieldByName('quantidade').AsFloat;
end;

procedure TfrmCadProducao.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
    if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
      DBEdit7.SetFocus;    
end;

procedure TfrmCadProducao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadProducao.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn7.Click;
end;

procedure TfrmCadProducao.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(cadProducao.vItemIndice.dataSet.FieldByName('nitem').AsString) = '0') then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else if (Trim(cadProducao.vItemIndice.dataSet.FieldByName('solvente').AsString) = 'S') then
      TDBGrid(sender).canvas.brush.color := clHighlight
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
  end
  else if (Trim(cadProducao.vItemIndice.dataSet.FieldByName('sem_estoque').AsString) = 'S') then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := clRed;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadProducao.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if Panel11.Visible then
    begin
      CheckBox2.Checked := not CheckBox2.Checked;
      CheckBox2Click(CheckBox2);
    end;
  end
  else if key = VK_F2 then
  begin
    cadProducao.vItemIndice.prepare_loop('', loop_options_with_filter);
    try
      cadProducao._validarPendenciasEmEstoque;
    finally
      cadProducao.vItemIndice.prepare_loop_done;
    end;
  end
  else if Key = VK_ESCAPE then
    BitBtn18.Click;
end;

procedure TfrmCadProducao.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(cadProducao.vItemIndice.dataSet.FieldByName('sem_estoque').AsString) = 'S') then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := clRed;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadProducao.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn25.Click
  else if Key = VK_F3 then
    if Classes.ssShift in Shift then
      vDadosIni.pesquisaRapida('PRODUTOS');
end;

procedure TfrmCadProducao.DBGrid6CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    cadProducao.vPedCompra._marcaDesmarcaLinha;
end;

procedure TfrmCadProducao.DBGrid6DblClick(Sender: TObject);
begin
  inherited;
  cadProducao.vPedCompra._marcaDesmarcaLinha;
end;

procedure TfrmCadProducao.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (Trim(DBGrid6.DataSource.DataSet.FieldByName('cod_empresa').AsString) <> vDadosIni.codEmpresa) then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else if (Trim(DBGrid6.DataSource.DataSet.FieldByName('cod_empresa').AsString) = '0') then
      TDBGrid(sender).canvas.brush.color :=  $00B0FFB0
    else
      TDBGrid(sender).canvas.brush.color := $00EEDFD2;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid6.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid6.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadProducao.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    cadProducao.vPedCompra._marcaDesmarcaLinha;
end;

procedure TfrmCadProducao.DBGrid6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    cadProducao.vPedCompra._marcaDesmarcaLinha;
end;

procedure TfrmCadProducao.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(DBGrid7.DataSource.DataSet.FieldByName('cod_empresa').AsString) <> vDadosIni.codEmpresa) then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else if (Trim(DBGrid7.DataSource.DataSet.FieldByName('cod_empresa').AsString) = '0') then
      TDBGrid(sender).canvas.brush.color :=  $00B0FFB0
    else
      TDBGrid(sender).canvas.brush.color := $00EEDFD2;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if (Column.FieldName = 'NUM_FAB_PROD') and
    ( DBGrid7.DataSource.DataSet.FieldByName(Column.FieldName).AsString = '') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
end;

procedure TfrmCadProducao.DBGrid7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
    	DBEdit25.SetFocus;
  end
  else if Key = VK_F3 then
  begin
    cadProducao._alterarItemPedidoCompra;
  end
  else if Key = VK_F4 then
  begin
    cadProducao._alterarItemPedidoCompra(True);
  end;
end;

procedure TfrmCadProducao.DBLookupComboBox2Enter(Sender: TObject);
begin
  inherited;
  cadProducao.vFormula._selecionaTodasFormulas;
end;

procedure TfrmCadProducao.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn5 then
    Exit;
  
  if (ActiveControl <> DBEdit18) and (ActiveControl <> DBLookupComboBox2) and (ActiveControl <> DBEdit1) then
  begin
    cadProducao.vFormula._selecionaFormula(cadProducao.dataSet.FieldByName('cod_formula').AsInteger);
    if cadProducao.dataSet.FieldByName('cod_formula').AsInteger > 0 then
    begin
      if cadProducao._existeFormula then
      begin
        if DBEdit1.Enabled then
          vDadosIni.GravaAuditoria('PPR032', 'ALTERAR', ' NOVA QUANTIDADE ' + DBEdit1.Text + ' ' + DBEdit17.Text, 'PRODUCAO',
            cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas)
        else
          vDadosIni.GravaAuditoria('PPR033', 'ALTERAR', ' NOVA FORMULA ' + DBEdit18.Text + ' ' + DBEdit21.Text, 'PRODUCAO',
            cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas);

        DBEdit21.Visible := True;
        DBLookupComboBox2.Visible := False;
        DBEdit18.Enabled := False;
        DBEdit1.Enabled := cadProducao.dataSet.FieldByName('quantidadeprevista').AsFloat = 0;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
        DBEdit18.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        DBEdit1.SetFocus;
    end;
  end;
end;

procedure TfrmCadProducao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (cadProducao <> nil) then
    cadProducao.Cancel;
  cadProducao.free;

  if Assigned(Flk_grade) then
    FreeAndNil(Flk_grade);

  if Assigned(lkTipoConversao) then FreeAndNil(lkTipoConversao);

  Action := caFree;
  if (frmCadProducao <> nil) then
    frmCadProducao := nil;
end;

procedure TfrmCadProducao.FormCreate(Sender: TObject);
begin

  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  cadProducao := TProducao.create;
  cadProducao.onTipoFormulaChange := tipo_fomula_producao_change;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  tsEscolhaProdutos.TabVisible := False;
  tsCadastroMateriasPrimasInsumos.TabVisible := False;
  tsEstoque.TabVisible := False;
  tsImportarPedido.TabVisible := False;
  ts_modais.TabVisible := False;
  Flk_grade := TDadosLookUp_OOP.create;
  lkTipoConversao := TDadosLookUp_OOP.create;

  DBGrid1.DataSource := dtmProducao.dsProducao;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadProducao.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProducao.dsProducao;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

    pn_mp_insumo.Height                    := pnConsultaMateriasPrimasInsumos.Height;
    pn_mp_insumo.Width                     := pnConsultaMateriasPrimasInsumos.Width;
    pnConsultaMateriasPrimasInsumos.Parent := pn_mp_insumo;
    pnConsultaMateriasPrimasInsumos.Align  := alClient;
  end;

  if frmCadProducao = nil then
    frmCadProducao := TfrmCadProducao(Self);

  pnCadastroResultadoFinal.Align := alClient;
  pnCadastroResultadoFinal.Visible := False;
  DBEdit7.OnExit := nil;


  Label6.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
//  Label8.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Label9.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Label12.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Label13.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Label14.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Label17.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Label34.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Label35.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBEdit1.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
//  DBEdit17.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBEdit18.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBEdit21.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBEdit22.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBEdit23.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBEdit24.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBText8.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBText9.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBText10.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBLookupComboBox2.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  SpeedButton9.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  SpeedButton10.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  SpeedButton13.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Panel15.Visible := vDadosIni.vEmp.vUsarClienteNaProducao = 'S';
  DBGrid3.Columns[3].Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBGrid3.Columns[4].Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  Panel12.Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBGrid4.Columns[4].Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBGrid4.Columns[5].Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBGrid4.Columns[13].Visible := vDadosIni.vEmp.vUsarProducao = 'D';
  DBGrid4.Columns[14].Visible := vDadosIni.vEmp.vUsarProducao = 'D';


  if vDadosIni.vEmp.vUsarProducao = 'S' then
  begin
    Label18.Caption := 'Produção';
    pnConsultaItensAcabados.Caption := 'Resultado da Produção';
    BitBtn9.Caption := 'Adicionar Item a Produzir';
    Label26.Caption := 'Peso Receita:';
    Label39.Caption := 'Quantidade da Receita';
    DBText7.DataField := 'PESO_FORMULA';
    DBText13.DataField := 'QUANTIDADE_RECEITA';
    Panel8.Height := 56;
  end
  else
  begin
    Label18.Caption := 'Observação';
    pnConsultaItensAcabados.Caption := 'Resultado da Produção';
    BitBtn9.Caption := 'Adicionar Item a Embalar';
    Label26.Caption := 'Peso Teórico:';
    Label39.Caption := 'Quantidade Teórica:';
    DBText7.DataField := 'PESO_TEORICO';
    DBText13.DataField := 'QUANTIDADE_TEORICA';
    Panel8.Height := 85;
    lkTipoConversao.setDadosDataSet(['U', 'P'], ['U - Unidade', 'P - Peso'], DBLookupComboBox3);
  end;

  if Panel15.Visible then
    Panel8.Height := Panel8.Height + Panel15.Height;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;

  SpeedButton25.Visible := false;

  if Pos('PRODUCAO_FICHAPRODUTO|', vDadosIni.vPesquisa) > 0 then
  begin
    TelaCadastro := 2;
    cadProducao.montaSelect('select PRODUCAO.*,CLIENTES.NOME_CLIENTE,CLIENTES.RAZAO from PRODUCAO' +
      ' LEFT JOIN CLIENTES ON PRODUCAO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES.COD_EMPRESA = PRODUCAO.COD_EMPRESA ' +
      ' where producao.cod_producao = ' + IntToStr(StrToIntDef(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2), 0)) +
      ' and producao.cod_empresa = ' + vDadosIni.codEmpresa);
    if cadProducao.dataSet.IsEmpty then
    begin
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      Self.fechar := True;
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
    SpeedButton1Click(Sender);
  end;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadProducao.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  if vDadosIni.vEmp.vUsarProducao = 'D' then
  begin
    DBEdit18.Enabled := cadProducao.dataSet.FieldByName('cod_formula').AsInteger = 0;
    DBLookupComboBox2.Visible := cadProducao.dataSet.FieldByName('cod_formula').AsInteger = 0;
    DBEdit1.Enabled := cadProducao.dataSet.FieldByName('quantidadeprevista').AsFloat = 0;
    DBEdit21.Visible := not DBLookupComboBox2.Visible;
    tipo_fomula_producao_change(cadProducao);
  end;
end;

procedure TfrmCadProducao.PageControl3Enter(Sender: TObject);
begin
  inherited;
  bt_variacao.Visible := cadProducao._producaoFechada;
end;

procedure TfrmCadProducao.pnCadastroResultadoFinalExit(Sender: TObject);
begin
  inherited;
//  if (not pnConsultaResultadoFinal.Visible) and
//  (pnCadastroResultadoFinal.Visible) then
//  begin
//    application.messagebox('Salve ou Cancele o Item antes','Atenção',+0+64);
//  	if (Self.Enabled) and (Self.Visible) and (pnCadastroResultadoFinal.CanFocus) then
//	    pnCadastroResultadoFinal.SetFocus;
//  end;
end;

procedure TfrmCadProducao.pnEstoqueEnter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn22.CanFocus) then
    bitbtn22.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn25.CanFocus) then
    BitBtn25.SetFocus;  
end;

procedure TfrmCadProducao.pnImportarPedidoEnter(Sender: TObject);
begin
  inherited;
  pnArquivoEletronico.Enabled := RadioGroup1.ItemIndex = 0;
  pnBancoDeDados.Enabled := not pnArquivoEletronico.Enabled;
end;

procedure TfrmCadProducao.pn_it_mpEnter(Sender: TObject);
begin
  inherited;
  Label32.Visible := pn_it_mp.Tag = 3;
  Label33.Visible := pn_it_mp.Tag = 3;
  DBEdit15.Visible := pn_it_mp.Tag = 3;
  DBEdit24.Visible := pn_it_mp.Tag = 3;
  DBEdit12.Enabled := pn_it_mp.Tag <> 3;
  DBEdit14.Enabled := pn_it_mp.Tag <> 3;
  DBEdit23.Enabled := pn_it_mp.Tag <> 3;  
  lk_grade_mp.Enabled := pn_it_mp.Tag <> 3;  
  DBEdit12.Enabled := pn_it_mp.Tag = 1;

  with cadProducao do
    Flk_grade.setDadosDataSet('cod_grade', 'descricao',
                              grades.getGradesDisponiveis(vItemIndice.f_int('grupo_prod'), vItemIndice.f_str('cod_prod'), vItemIndice.f_int('cod_grade')).dataSet,
                              lk_grade_mp);

  lk_grade_mp.Visible := not cadProducao.grades.dataSet.IsEmpty;
  lb_grade_mp.Visible := not cadProducao.grades.dataSet.IsEmpty;

  THackWinControl(pn_it_mp).SelectFirst;
end;

procedure TfrmCadProducao.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  pnArquivoEletronico.Enabled := RadioGroup1.ItemIndex = 0;
  pnBancoDeDados.Enabled := not pnArquivoEletronico.Enabled;
end;

procedure TfrmCadProducao.RadioGroup1Exit(Sender: TObject);
begin
  inherited;
  pnArquivoEletronico.Enabled := RadioGroup1.ItemIndex = 0;
  pnBancoDeDados.Enabled := not pnArquivoEletronico.Enabled;
end;

procedure TfrmCadProducao.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadProducao.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  
  if not vDadosIni.PesqPros('PPR032', 'ALTERAR', ' QUANTIDADE ' + DBEdit1.Text + ' ' + DBEdit17.Text, 'PRODUCAO',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    exit;

  if Application.MessageBox('Ao modificar a quantidade da produção, as quantidades de matérias primas serão refeitas de acordo a Fórmula. Deseja continuar?',
    'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  DBEdit1.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus;
end;

procedure TfrmCadProducao.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PPR038', 'INCLUIR', '', 'PRODUCAO',
    '', cadProducao.buscas, true) then
    exit;
  if cadProducao._abreFormImportacaoPedidoCompra then
  begin
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;
  end;
end;

procedure TfrmCadProducao.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if cadProducao.dataSet.IsEmpty then
      Exit;
  if not vDadosIni.PesqPros('PPR039', 'RELATORIO', '', 'PRODUCAO',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    exit;
  if not cadProducao._producaoFechada then
  begin
    Application.MessageBox('Produção não fechada', 'Atenção', 0 + 64);
    Exit;
  end;
  cadProducao._imprimirCustoProducao;
end;

procedure TfrmCadProducao.SpeedButton13Click(Sender: TObject);
begin
  inherited;

  
  CheckBox2.Checked := False;
  Panel11.Visible := False;
  try
    cadProducao.vItemIndice._filtrarItemIndice(0, True);

    BitBtn13.Enabled := True;
    BitBtn14.Enabled := True;
    BitBtn21.Enabled := True;
    Panel6.Visible := True;
//    Panel13.Visible := False;
//    Panel13.Align := alClient;
    vDadosIni.abreForm('Consulta de Matérias Primas / Insumos utilizadas na Produção', pn_mp_insumo, [ofAlignAllClientWinCtrl, ofBIMinimizeOff, ofStoreMaximized]);
  finally
    Panel11.Visible := True;
  end;
end;

procedure TfrmCadProducao.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  edDataIniPC.Clear;
  edDataFimPC.Clear;
end;

procedure TfrmCadProducao.SpeedButton1Click(Sender: TObject);
begin
  try
    if cadProducao.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('PPR003', 'ALTERAR', '', 'PRODUCAO',
      cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
      exit;

    if cadProducao.Edit then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsCadastro;

      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        DBEdit3.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      cadProducao.Cancel;
      cadProducao.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadProducao.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
  	if cadProducao.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('PPR004', 'EXCLUIR', '', 'PRODUCAO',
      cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, false) then
      Exit;

    cadProducao.Delete;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      cadProducao.Cancel;
      cadProducao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadProducao.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('PPR036', 'IMPRIMIR', '', 'PRODUCAO',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    exit;

  cadProducao._imprimirFichaProducao;

end;

procedure TfrmCadProducao.SpeedButton59Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('producao_%', cadProducao.buscas);
end;

procedure TfrmCadProducao.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if cadProducao.dataSet.IsEmpty then
      Exit;
  if not vDadosIni.PesqPros('PPR016', 'ALTERAR', '', 'PRODUCAO',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    exit;

  if Application.MessageBox('Deseja Iniciar o processo de Produção?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  cadProducao._iniciarProcessoDeProducao;
end;

procedure TfrmCadProducao.SpeedButton7Click(Sender: TObject);
begin
  inherited;
	if cadProducao.dataSet.IsEmpty then
      Exit;
  if Application.MessageBox('Deseja realmente reabrir o Pedido de Produção?',
    'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  cadProducao._efetuarReaberturaDeProducao;
end;

procedure TfrmCadProducao.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if cadProducao.dataSet.IsEmpty then
      Exit;
  if Application.MessageBox('Deseja efetuar o fechamento do Pedido de Produção?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  cadProducao._efetuarFechamentoDeProducao;
end;

procedure TfrmCadProducao.SpeedButton9Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('PPR033', 'ALTERAR', ' FORMULA ' + DBEdit18.Text + ' ' + DBEdit21.Text, 'PRODUCAO',
    cadProducao.dataSet.FieldByName('COD_PRODUCAO').AsString, cadProducao.buscas, true) then
    exit;

  if Application.MessageBox('Ao modificar a produção, as matérias primas serão refeitas de acordo a Fórmula. Deseja continuar?',
    'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  DBEdit21.Visible := False;
  DBLookupComboBox2.Visible := True;
  DBEdit18.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
  	DBEdit18.SetFocus;
end;

procedure TfrmCadProducao.tipo_fomula_producao_change(Sender: TObject);
begin
  Label40.Visible  := cadProducao.fdif('tipo_conversao', 'U');
  DBText14.Visible := cadProducao.fdif('tipo_conversao', 'U');
  Panel12.Visible  := (vDadosIni.vEmp.vUsarProducao = 'D') and cadProducao.fdif('tipo_conversao', 'U');
end;

procedure TfrmCadProducao.validar_grades_indice(Sender: TObject);
var
  Acount: Integer;
begin
  {$REGION 'validando itens indice com grade'}
  cadProducao.vItemIndice.dataSet.First;
  cadProducao.vItemIndice.prepare_loop(Format('nitem = %d', [cadProducao.vItemAcabado.f_int('nitem')]));
  Acount := 0;
  try
    while not cadProducao.vItemIndice.validar_grades(False) do
      if cadProducao.vItemIndice.Edit then
      begin
        {$REGION 'abrindo item indice para correção da grade'}
        pn_it_mp.Tag := 2; //alterar
        cadProducao.vItemIndice.vUltimoProcesso := 'PPR011';
        cadProducao.vItemIndice.storeRecNo;
        try
          cadProducao.vItemIndice.dataSet.EnableControls;
          if not vDadosIni.abreForm('Por favor selecione a grade da Matéria Prima / Insumo para continuar', pn_it_mp, opFormsDefCadEsc) then
            Break
          else
          begin
            cadProducao.vItemIndice.filterStr('nitem = %d', [cadProducao.vItemAcabado.f_int('nitem')]);
            cadProducao.vItemIndice.dataSet.DisableControls;
            cadProducao.vItemIndice.restoreRecNo;
            Acount := Acount + 1;
            if Acount >= cadProducao.vItemIndice.dataSet.RecordCount then
              Break;            
          end;
        finally
          if cadProducao.vItemIndice.dataSet.State in [DsEdit, dsInsert] then
            cadProducao.vItemIndice.Cancel;
        end;            
        {$ENDREGION}
      end
      else
        Break;

  finally
    cadProducao.vItemIndice.prepare_loop_done;
  end;            
  {$ENDREGION}
end;

procedure TfrmCadProducao.variacoes_producao_make(Sender: TObject);
var
  Avariacoes: TProdVariacao;
  I: Integer;

  procedure variacao_make_item(Avariacao: TProdutos_pdc_var);
  var
    Alevel0, Alevel1: TTreeNode;
    Ai: Integer;
  begin
    with Avariacao do
    begin
      Alevel0 := tv_var.Items.AddChild(nil, Format('[%d-%s] - %s', [grupo_prod, cod_prod, descricao]));
      for Ai := 0 to Pred(itens.Count) do with itens.Items[Ai] do
        Alevel1 := tv_var.Items.AddChild(Alevel0, Format('[%d-%s] - %s', [grupo_prod, cod_prod, descricao]));
    end;

  end;
begin

  if not Assigned(Sender) then
    Exit;

  if Sender is TProdutos_pdc_var then
    variacao_make_item(TProdutos_pdc_var(Sender))
  else if Sender is TProdVariacao then
  begin
    Avariacoes := TProdVariacao(Sender);
    for I := 0 to Pred(Avariacoes.Count) do
      variacao_make_item(Avariacoes.Items[I]);
  end;

end;

initialization
  RegisterClass(TfrmCadProducao);
finalization
  UnRegisterClass(TfrmCadProducao);

end.

