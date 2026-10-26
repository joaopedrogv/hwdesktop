unit uCadGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, UClassesProdutos, AppEvnts;

type
  TfrmCadGrade = class(TfrmCadPadraoM)
    pnGradeEC: TPanel;
    GroupBoxEC: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit4: TDBEdit;
    pnBotoesEC: TPanel;
    LabelSeqEC: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    CheckCadSeqEC: TCheckBox;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    btEditarGrade: TSpeedButton;
    Label11: TLabel;
    DBComboBox2: TDBComboBox;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    btOpcoes: TSpeedButton;
    lbVariacaoSimples: TLabel;
    lbVariacaoComposta: TLabel;
    ckGradeDupla: TCheckBox;
    lbGradeDupla: TLabel;
    tsAlterDadosProc: TTabSheet;
    Panel52: TPanel;
    btVoltarDadosProc: TBitBtn;
    GroupBox79: TGroupBox;
    DBText57: TDBText;
    DBText58: TDBText;
    Label450: TLabel;
    Label456: TLabel;
    DBText60: TDBText;
    Label13: TLabel;
    Panel128: TPanel;
    pnCenterAlterDadosProd: TPanel;
    SpeedButtonAlterarProduto: TSpeedButton;
    SpeedButtonAlterarProduto2: TSpeedButton;
    btExcluirRegistro: TSpeedButton;
    ckPermOpcaoMarcadas: TCheckBox;
    Label14: TLabel;
    DBText61: TDBText;
    Label15: TLabel;
    DBText59: TDBText;
    tsAlterDadosLote: TTabSheet;
    pnAlteracaoEmLote: TPanel;
    GroupBoxAlteracaoEmLote: TGroupBox;
    pnTipo1: TPanel;
    lbTipo1: TLabel;
    cbTipo1: TComboBox;
    ckTipo1: TCheckBox;
    Panel21: TPanel;
    Panel22: TPanel;
    pnTipo2: TPanel;
    lbTipo2: TLabel;
    cbTipo2: TComboBox;
    ckTipo2: TCheckBox;
    Panel23: TPanel;
    Panel7: TPanel;
    btnOKAlteracaoEmLote: TBitBtn;
    btnCancelarAlteracaoEmLote: TBitBtn;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodasGradesClick: TMenuItem;
    DesmarcarTodasGradesClick: TMenuItem;
    btLixeiraCheia: TSpeedButton;
    btRestaurarRegistro: TSpeedButton;
    ckLixeira: TCheckBox;
    btSincronizarServicos: TSpeedButton;
    SpeedBSelTodos: TSpeedButton;
    SpeedBDesmarcarTodos: TSpeedButton;
    procedure btSincronizarServicosClick(Sender: TObject);
    procedure SpeedBDesmarcarTodosClick(Sender: TObject);
    procedure SpeedBSelTodosClick(Sender: TObject);
    procedure ckLixeiraClick(Sender: TObject);
    procedure DesmarcarTodasGradesClickClick(Sender: TObject);
    procedure MarcarTodasGradesClickClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ckPermOpcaoMarcadasClick(Sender: TObject);
    procedure SpeedButtonAlterarProduto2Click(Sender: TObject);
    procedure SpeedButtonAlterarProdutoClick(Sender: TObject);
    procedure btnCancelarAlteracaoEmLoteClick(Sender: TObject);
    procedure btVoltarDadosProcClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnOKAlteracaoEmLoteClick(Sender: TObject);
    procedure ckTipo2Click(Sender: TObject);
    procedure ckTipo1Click(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure ckGradeDuplaClick(Sender: TObject);
    procedure btOpcoesClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure btEditarGradeClick(Sender: TObject);
    procedure CheckCadSeqECClick(Sender: TObject);
    procedure LabelSeqECClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure pnGradeECEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGradeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure tipo_grade_add(Sender: TObject);
    procedure tipo_grade_edit(Sender: TObject);
    procedure tipo_grade_del(Sender: TObject);
    procedure AtualizarListaTipoGrade(pFocar: boolean = true);
  end;

var
  frmCadGrade: TfrmCadGrade;
  pop_menu_tipo_grade: TPopupMenu;
  obGrade: TGrade;
  vfocar: boolean;

implementation

uses uDtmProdutos, uDtmAtivo, DB, uDadosIni, uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadGrade.AtualizarListaTipoGrade(pFocar: boolean);
var
	vtipoEC: string;
  I: Integer;
begin
  vDadosIni.montarDBComboboxTipoGradeEC(obGrade.buscas, DBComboBox1);
  vDadosIni.montarDBComboboxTipoGradeEC(obGrade.buscas, DBComboBox2);
  vDadosIni.montarDBComboboxTipoGradeEC(obGrade.buscas, cbTipo1);
  vDadosIni.montarDBComboboxTipoGradeEC(obGrade.buscas, cbTipo2);

  if pFocar then
  begin
    vtipoEC := trim(obGrade.dataset.FieldByName('TIPO_EC').AsString);
    for i := 0 to DBComboBox1.Items.Count - 1 do
    begin
      if vtipoEC = trim(DBComboBox1.Items[i]) then
      begin
        dbcombobox1.ItemIndex := i;
        break;
      end;
    end;

    vtipoEC := trim(obGrade.dataset.FieldByName('TIPO_EC1').AsString);
    for i := 0 to DBComboBox2.Items.Count - 1 do
    begin
      if vtipoEC = trim(DBComboBox2.Items[i]) then
      begin
        DBComboBox2.ItemIndex := i;
        break;
      end;
    end;

    vtipoEC := trim(obGrade.dataset.FieldByName('TIPO_EC').AsString);
    for i := 0 to cbTipo1.Items.Count - 1 do
    begin
      if vtipoEC = trim(cbTipo1.Items[i]) then
      begin
        cbTipo1.ItemIndex := i;
        break;
      end;
    end;

    vtipoEC := trim(obGrade.dataset.FieldByName('TIPO_EC').AsString);
    for i := 0 to cbTipo2.Items.Count - 1 do
    begin
      if vtipoEC = trim(cbTipo2.Items[i]) then
      begin
        cbTipo2.ItemIndex := i;
        break;
      end;
    end;
  end;
end;

procedure TfrmCadGrade.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO099]';
  if not vDadosIni.PesqPros('PRO095', 'PESQUISAR', '', 'GRADE', '', obGrade.buscas, true) then
    Exit;
  inherited;
  if MaskEdit2.Visible then
  begin
    if (ckLixeira.Checked) and (ckLixeira.Visible) then
    begin
      if not obGrade.ConsultaCamposLixeira('GRADE', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
           if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus;
    end
    else
    begin
      if not obGrade.ConsultaCampos('GRADE', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
           if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus;
    end;
  end
  else
  begin
    if (ckLixeira.Checked) and (ckLixeira.Visible) then
    begin
      if not obGrade.ConsultaCamposLixeira('GRADE', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
             ComboBox1.SetFocus;
    end
    else
    begin
      if not obGrade.ConsultaCampos('GRADE', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
             ComboBox1.SetFocus;
    end;
  end;

  if ckLixeira.Checked then
  begin
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
    SpeedButton6.Visible := false;
  end
  else
  begin
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    SpeedButton6.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
  end;

  obGrade.ultimasql := obGrade.dataSet.CommandText;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadGrade.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('GRADES', 'I', obGrade.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO096', 'INCLUIR', '', 'GRADE', '', obGrade.buscas, true) then
//  if not vDadosIni.PesqPros('PRO096', '', obGrade.buscas, true) then
    exit;
  if not obGrade.Insert then
    exit;
  ActiveControl := BitBtn3;
  GroupBoxEC.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
  pnBotoesEC.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
  btEditarGrade.Visible := false;
  btEditarGrade.Enabled := false;
  DBComboBox1.Enabled := true;
  Label11.Enabled := false;
  Label12.Enabled := false;
  DBComboBox2.Enabled := false;
  DBEdit5.Enabled := false;
  vfocar := true;
  if vDadosIni.vEcommerce.vHabilitarEcommerce then
  begin
    lbGradeDupla.Visible := true;
	  ckGradeDupla.Visible := true;
    ckGradeDupla.Checked := false;
    pnGradeEC.Align := alNone;
    pnGradeEC.Height := 254;
    pnGradeEC.Width := 771;
    CheckCadSeqEC.Enabled := true;
    CheckCadSeqEC.Visible := true;
    CheckCadSeqEC.Checked := false;
    LabelSeqEC.Enabled := true;
    LabelSeqEC.Visible := true;
    DBComboBox1.ItemIndex := -1;
    DBComboBox2.ItemIndex := -1;
    vDadosIni.abreForm('Grade', pnGradeEC, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
  end
  else
  begin
    inherited;
    pnGradeEC.Align := alClient;
    PageControl3.ActivePage := TabSheet3;
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end;
end;

procedure TfrmCadGrade.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO102', 'CONFIRMAR', '', 'GRADE', '', obGrade.buscas, true) then
//  if not vDadosIni.PesqPros('PRO102', '', obGrade.buscas, true) then
    exit;
  if not obGrade.Post then
    setFocusCampoErro(obGrade.vNomeCampoErro, obGrade.vMensagemErro)
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obGrade.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadGrade.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('PRO160','CANCELAR', '','GRADE',obGrade.dataSet.FieldByName('COD_GRADE').AsString, obGrade.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    obGrade.Cancel;
    obGrade.RollBackTransacao;
    inherited;
//  end;
end;

procedure TfrmCadGrade.BitBtn7Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO102', 'CONFIRMAR', '', 'GRADE', '', obGrade.buscas, true) then
//  if not vDadosIni.PesqPros('PRO102', '', obGrade.buscas, true) then
    exit;

	if (Self.Enabled) and (Self.Visible) and (BitBtn7.CanFocus) then
		BitBtn7.SetFocus;
  if not obGrade.Post then
    setFocusCampoErro(obGrade.vNomeCampoErro, obGrade.vMensagemErro)
  else
  begin
    if CheckCadSeqEC.Checked then
    begin
      TForm(pnGradeEC.Parent).ModalResult := IDOK;
      DBComboBox1.ItemIndex := -1;
      DBComboBox2.ItemIndex := -1;
      if obGrade.Insert then
        vDadosIni.abreForm('Grade', pnGradeEC, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
    end
    else
      TForm(pnGradeEC.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmCadGrade.BitBtn8Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('PRO160','CANCELAR', '','GRADE',obGrade.dataSet.FieldByName('COD_GRADE').AsString, obGrade.buscas, true) then
//  begin
   obGrade.Cancel;
   obGrade.RollBackTransacao;
   TForm(pnGradeEC.Parent).ModalResult := IDCANCEL;
//  end;
end;

procedure TfrmCadGrade.btEditarGradeClick(Sender: TObject);
var
  vtipoEC: string;
  I: Integer;
begin
 if Application.MessageBox(PChar('Deseja alterar o tipo da grade?' + #13 +
 	'Caso altere, todas as informações das grades/variação do e-commerce serão reenviadas novamente.'),
  'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYES then
    exit;

 if not vDadosIni.PesqPros('PRO313', 'ALTERAR', '', 'GRADE', '', obGrade.buscas, true) then
   exit;

 DBComboBox1.Enabled := true;
 if ckGradeDupla.Checked then
	 DBComboBox2.Enabled := true;	
 btEditarGrade.Enabled := false;
 if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
   DBComboBox1.SetFocus;
end;

procedure TfrmCadGrade.btnCancelarAlteracaoEmLoteClick(Sender: TObject);
begin
  inherited;
	TForm(pnAlteracaoEmLote.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadGrade.btnOKAlteracaoEmLoteClick(Sender: TObject);
begin
  inherited;
	try
  	if (Self.Enabled) and (Self.Visible) and (btnOKAlteracaoEmLote.CanFocus) then
      btnOKAlteracaoEmLote.SetFocus;
    obGrade.vAtualizarGrade.vTipo1 := trim(cbTipo1.Text);
    obGrade.vAtualizarGrade.vTipo2 := trim(cbTipo2.Text);

    obGrade.vAtualizarGrade.vHabTipo1 := ckTipo1.Checked;
    obGrade.vAtualizarGrade.vHabTipo2 := ckTipo2.Checked;

    if not obGrade.atualizarGradesEmLote then
    begin
    	setFocusCampoErro(obGrade.vNomeCampoErro, obGrade.vMensagemErro);
    	exit;
    end;

		TForm(pnAlteracaoEmLote.Parent).ModalResult := IDOK;
  finally
    _GravaConfiguracoesString(cbTipo1.Name, cbTipo1.Text);
    _GravaConfiguracoesString(cbTipo2.Name, cbTipo2.Text);

    _GravaConfiguracoesBoolean(ckTipo1.Name, ckTipo1.Checked);
    _GravaConfiguracoesBoolean(ckTipo2.Name, ckTipo2.Checked);
  end;
end;

procedure TfrmCadGrade.btOpcoesClick(Sender: TObject);
var
	MenuItem: TMenuItem;
begin
  inherited;

  if Assigned(pop_menu_tipo_grade) then
  	FreeAndNil(pop_menu_tipo_grade);

  pop_menu_tipo_grade := TPopupMenu.Create(Self);

  MenuItem := TMenuItem.Create(pop_menu_tipo_grade);
  MenuItem.Caption := 'Novo Tipo de Grade - [PRO372]';
  MenuItem.OnClick := tipo_grade_add;
  pop_menu_tipo_grade.Items.Add(MenuItem);

  MenuItem := TMenuItem.Create(pop_menu_tipo_grade);
  MenuItem.Caption := 'Alterar Tipo de Grade - [PRO373]';
  MenuItem.OnClick := tipo_grade_edit;
  pop_menu_tipo_grade.Items.Add(MenuItem);

  MenuItem := TMenuItem.Create(pop_menu_tipo_grade);
  MenuItem.Caption := 'Excluir Tipo de Grade - [PRO374]';
  MenuItem.OnClick := tipo_grade_del;
  pop_menu_tipo_grade.Items.Add(MenuItem);

  pop_menu_tipo_grade.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadGrade.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obGrade._marcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadGrade.btSincronizarServicosClick(Sender: TObject);
begin
  inherited;
  try
  	 Screen.Cursor := crHourGlass;
    frmCadGrade.Enabled := false;
    DBGrid1.Visible := false;
  	 if not obGrade.sincronizarGradesEmLote then
      exit;
  finally
  	 frmCadGrade.Enabled := true;
    DBGrid1.Visible := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadGrade.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obGrade._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadGrade.btVoltarDadosProcClick(Sender: TObject);
begin
  frmCadGrade.Caption := 'Grades de Estoque';

	Panel2.Visible := true;
	GroupBox3.Parent := TabSheet2;
  
	btVoltarDadosProc.Parent := Panel52;
  BitBtn2.Visible := True;
  BitBtn3.Visible := True;
  Panel1.Parent := TabSheet2;
  TelaCadastro := 0;
  
	PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadGrade.CheckCadSeqECClick(Sender: TObject);
begin
  if CheckCadSeqEC.Checked then
  begin
    LabelSeqEC.Font.Color := clRed;
    CheckCadSeqEC.Font.Color := clRed;
  end
  else
  begin
    LabelSeqEC.Font.Color := clTeal;
    CheckCadSeqEC.Font.Color := clTeal;
  end;
end;

procedure TfrmCadGrade.ckGradeDuplaClick(Sender: TObject);
begin
  inherited;
  if ckGradeDupla.Checked then
    if not vDadosIni.PesqPros('PRO425', 'HABILITAR', '', 'GRADE', '', obGrade.buscas, true) then
    begin
      ckGradeDupla.Checked := false;
      exit;
    end;

  Label11.Enabled := ckGradeDupla.Checked;
	Label12.Enabled := ckGradeDupla.Checked;
  if not btEditarGrade.Visible then
		DBComboBox2.Enabled := ckGradeDupla.Checked
  else if not btEditarGrade.Enabled then
  	DBComboBox2.Enabled := ckGradeDupla.Checked;
  DBEdit5.Enabled := ckGradeDupla.Checked;

  if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
  	DBComboBox2.SetFocus;
end;

procedure TfrmCadGrade.ckLixeiraClick(Sender: TObject);
begin
  inherited;
  if not ckLixeira.Visible then
    exit;

  if not ckLixeira.Enabled then
  begin
  	 if ckLixeira.Checked then
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO098]';
      btExcluirRegistro.Hint := 'Excluir registro permanentemente - [PRO098]';
    end
    else
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [PRO099]';
      btExcluirRegistro.Hint := 'Enviar para Lixeira - [PRO099]';
    end;
  	exit;
  end;

  if ckLixeira.Checked then
  	 SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO098]'
  else
 	 SpeedButton2.Hint := 'Enviar para Lixeira - [PRO099]';

  if (PageControl1.ActivePage = tsAlterDadosProc) then
  begin
    if ckLixeira.Checked then
      frmCadGrade.Caption := 'Alteração Grades de Estoque em Lote (Lixeira)'
    else
      frmCadGrade.Caption := 'Alteração Grades de Estoque em Lote';
  end
  else
  begin
    if ckLixeira.Checked then
    	frmCadGrade.Caption := 'Grades de Estoque (Lixeira)'
    else
      frmCadGrade.Caption := 'Grades de Estoque';
  end;
  BitBtn1Click(Sender);
end;

procedure TfrmCadGrade.ckPermOpcaoMarcadasClick(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesBoolean(ckPermOpcaoMarcadas.Name, ckPermOpcaoMarcadas.Checked);
end;

procedure TfrmCadGrade.ckTipo1Click(Sender: TObject);
begin
  inherited;
	cbTipo1.Enabled := ckTipo1.Checked;
  if ckTipo1.Checked then
  begin
  	pnTipo1.ParentBackground := False;
		pnTipo1.Color := clYellow;
  end
  else
  begin
  	pnTipo1.ParentBackground := True;
  	pnTipo1.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbTipo1.CanFocus) then
  	cbTipo1.SetFocus;
end;

procedure TfrmCadGrade.ckTipo2Click(Sender: TObject);
begin
  inherited;
	cbTipo2.Enabled := ckTipo2.Checked;
  if ckTipo2.Checked then
  begin
  	pnTipo2.ParentBackground := False;
		pnTipo2.Color := clYellow;
  end
  else
  begin
  	pnTipo2.ParentBackground := True;
  	pnTipo2.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbTipo2.CanFocus) then
  	cbTipo2.SetFocus;
end;

procedure TfrmCadGrade.tipo_grade_add(Sender: TObject);
var
  Descricao: string;
begin
  with obGrade.FTipoGrade do
    if not Auditor.Processo('PRO372').Inserir.Permitido then
      Exit;
  //form_modal_configure([bt_modal_assume, bt_mo);
  if not InputQuery('Novo tipo de grade', 'Informe a descrição do tipo de grade', Descricao) then
    Exit;

  Descricao := Trim(Descricao);

  obGrade.buscas.Close;
  obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	' where descricao = ' + QuotedStr(Descricao) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  obGrade.buscas.Open;

  if (obGrade.buscas.IsEmpty) and (trim(Descricao) = 'COR') then
  begin
    obGrade.buscas.Close;
 		obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	  ' where descricao = ' + QuotedStr('CORES') +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
 		obGrade.buscas.Open;
  end
  else if (obGrade.buscas.IsEmpty) and (trim(Descricao) = 'GÊNERO') then
  begin
    obGrade.buscas.Close;
 		obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	  ' where descricao = ' + QuotedStr('GÊNEROS') +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
 		obGrade.buscas.Open;
  end
  else if (obGrade.buscas.IsEmpty) and (trim(Descricao) = 'TAMANHO') then
  begin
    obGrade.buscas.Close;
 		obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	  ' where descricao = ' + QuotedStr('GÊNEROS') +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
 		obGrade.buscas.Open;
  end
  else if (obGrade.buscas.IsEmpty) and (trim(Descricao) = 'VOLTAGEM') then
  begin
    obGrade.buscas.Close;
 		obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	  ' where descricao = ' + QuotedStr('GÊNEROS') +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
 		obGrade.buscas.Open;
  end;

  if not obGrade.buscas.IsEmpty then
  begin
  	Application.MessageBox(Pchar('Tipo de grade já existe: ' + #13 + #13 +
    	'GRADE' + #13 +
      'Descrição: ' + trim(Descricao)), 'Atenção', MB_ICONWARNING + MB_OK);
    exit;
  end;

  obGrade.FTipoGrade.Insert;
  obGrade.FTipoGrade.fdata('descricao').Put(Descricao);
  if not obGrade.FTipoGrade.Post then
  	exit;

 	AtualizarListaTipoGrade;
end;

procedure TfrmCadGrade.tipo_grade_del(Sender: TObject);
begin
	bt_modal_assume.Caption := 'Excluir';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  obGrade.FTipoGrade.dataSet.First;
  grid_modal.DataSource := obGrade.FTipoGrade._dataSourceOOP;

  if not vDadosIni.abreForm('Selecione o tipo de grade que deseja excluir', pn_modal, opFormsDefCad) then
    Exit;

  with obGrade.FTipoGrade do
    if not Auditor.Processo('PRO374', fstr('descricao'), fstr('cod_tipo')).Excluir.Permitido then
      Exit;

  if not obGrade.FTipoGrade.Delete then
  	exit;

  AtualizarListaTipoGrade;
end;

procedure TfrmCadGrade.tipo_grade_edit(Sender: TObject);
var
  Descricao: string;
begin
  bt_modal_assume.Caption := 'Selecionar';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  obGrade.FTipoGrade.dataSet.First;
  grid_modal.DataSource := obGrade.FTipoGrade._dataSourceOOP;

  if not vDadosIni.abreForm('Selecione o tipo de grade que deseja alterar', pn_modal, opFormsDefCad) then
    Exit;

  with obGrade.FTipoGrade do
    if not Auditor.Processo('PRO373', fstr('descricao'), fstr('cod_tipo')).Alterar.Permitido then
      Exit;

  Descricao := obGrade.FTipoGrade.fstr('descricao');

  if not InputQuery('Alterar tipo de contato', 'Informe o tipo de contato', Descricao) then
    Exit;

  if not obGrade.FTipoGrade.Edit then
    Exit;

  Descricao := Trim(Descricao);

  obGrade.buscas.Close;
  obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	' where descricao = ' + QuotedStr(Descricao) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  obGrade.buscas.Open;

  if (obGrade.buscas.IsEmpty) and (trim(Descricao) = 'COR') then
  begin
    obGrade.buscas.Close;
 		obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	  ' where descricao = ' + QuotedStr('CORES') +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
 		obGrade.buscas.Open;
  end
  else if (obGrade.buscas.IsEmpty) and (trim(Descricao) = 'GÊNERO') then
  begin
    obGrade.buscas.Close;
 		obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	  ' where descricao = ' + QuotedStr('GÊNEROS') +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
 		obGrade.buscas.Open;
  end
  else if (obGrade.buscas.IsEmpty) and (trim(Descricao) = 'TAMANHO') then
  begin
    obGrade.buscas.Close;
 		obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	  ' where descricao = ' + QuotedStr('GÊNEROS') +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
 		obGrade.buscas.Open;
  end
  else if (obGrade.buscas.IsEmpty) and (trim(Descricao) = 'VOLTAGEM') then
  begin
    obGrade.buscas.Close;
 		obGrade.buscas.SQL.Text := ' select * from tipo_grade_ec ' +
  	  ' where descricao = ' + QuotedStr('GÊNEROS') +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
 		obGrade.buscas.Open;
  end;

  if not obGrade.buscas.IsEmpty then
  begin
  	Application.MessageBox(Pchar('Tipo de grade já existe: ' + #13 + #13 +
    	'GRADE' + #13 +
      'Descrição: ' + trim(Descricao)), 'Atenção', MB_ICONWARNING + MB_OK);
    exit;
  end;

  obGrade.FTipoGrade.fdata('descricao').Put(Descricao);
  if not obGrade.FTipoGrade.Post then
  	exit;

  AtualizarListaTipoGrade;
end;

procedure TfrmCadGrade.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (trim(obGrade.dataSet.FieldByName('TIPO_EC').AsString) <> '') then
    if trim(obGrade.dataSet.FieldByName('DESCRICAO_EC').AsString) = '' then
     obGrade.dataSet.FieldByName('DESCRICAO_EC').AsString :=
      vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(obGrade.dataSet.FieldByName('DESCRICAO').AsString));
end;

procedure TfrmCadGrade.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
	if (trim(obGrade.dataSet.FieldByName('TIPO_EC1').AsString) <> '') then
    if trim(obGrade.dataSet.FieldByName('DESCRICAO_EC1').AsString) = '' then
       obGrade.dataSet.FieldByName('DESCRICAO_EC1').AsString :=
        vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(obGrade.dataSet.FieldByName('DESCRICAO1').AsString));
end;

procedure TfrmCadGrade.DBEdit2Exit(Sender: TObject);
begin
//	if trim(obGrade.dataSet.FieldByName('DESCRICAO1').AsString) = '' then
//   obGrade.dataSet.FieldByName('DESCRICAO1').AsString :=
//    trim(obGrade.dataSet.FieldByName('DESCRICAO').AsString);
//
//  if trim(obGrade.dataSet.FieldByName('DESCRICAO_EC').AsString) = '' then
//   obGrade.dataSet.FieldByName('DESCRICAO_EC').AsString :=
//    vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(obGrade.dataSet.FieldByName('DESCRICAO').AsString));
end;

procedure TfrmCadGrade.DBEdit3Exit(Sender: TObject);
begin
  inherited;
//	if trim(obGrade.dataSet.FieldByName('DESCRICAO_EC1').AsString) = '' then
//   obGrade.dataSet.FieldByName('DESCRICAO_EC1').AsString :=
//    vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(obGrade.dataSet.FieldByName('DESCRICAO1').AsString));
end;

procedure TfrmCadGrade.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  	obGrade._marcaDesmarcaLinha;
end;

procedure TfrmCadGrade.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if obGrade.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadGrade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_SPACE) then
  	obGrade._marcaDesmarcaLinha
  else if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadGrade.DesmarcarTodasGradesClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obGrade._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obGrade.Cancel;
  obGrade.RollBackTransacao;
  if Self.TelaCadastro = 0 then
    obGrade.free;
  Action := caFree;
  FrmCadGrade := nil;
end;

procedure TfrmCadGrade.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obGrade := TGrade.Create;
  obGrade.montaSelect('SELECT * FROM GRADE WHERE 1=0');

  tsAlterDadosProc.TabVisible := False;
  tsAlterDadosLote.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadGrade.FormGradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_ESCAPE then
 begin
   if (obGrade.dataSet.State in [dsEdit, dsInsert]) then
   begin
     ActiveControl := BitBtn8;
     BitBtn8Click(Sender);
   end;
 end
 else if (key = vk_f2) and CheckCadSeqEC.Enabled then
 begin
   CheckCadSeqEC.Checked := not CheckCadSeqEC.Checked;
   if CheckCadSeqEC.Checked then
   begin
     CheckCadSeqEC.Font.Color := clRed;
     LabelSeqEC.Font.Color := clRed;
   end
   else
   begin
     LabelSeqEC.Font.Color := clTeal;
     CheckCadSeqEC.Font.Color := clTeal;
   end;
 end
end;

procedure TfrmCadGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (obGrade.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadGrade.FormShow(Sender: TObject);
begin
	if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsGrade;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;

  AtualizarListaTipoGrade(false);
  obGrade.FTipoGrade.Abrir;

  DBComboBox2.Text := DBComboBox1.Text;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  lixeiraVazia(not obGrade.StatusLixeira);
end;

procedure TfrmCadGrade.LabelSeqECClick(Sender: TObject);
begin
  if CheckCadSeqEC.Tag = 0 then
  begin
    CheckCadSeqEC.Checked := not CheckCadSeqEC.Checked;
    if CheckCadSeqEC.Checked then
    begin
      CheckCadSeqEC.Font.Color := clRed;
      LabelSeqEC.Font.Color := clRed
    end
    else
    begin
      LabelSeqEC.Font.Color := clTeal;
      CheckCadSeqEC.Font.Color := clTeal;
    end;
  end;
end;

procedure TfrmCadGrade.MarcarTodasGradesClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obGrade._marcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadGrade.pnGradeECEnter(Sender: TObject);
begin
  if not vfocar then
    exit;
    
  if not vDadosIni.vEcommerce.vHabilitarEcommerce then
    exit;

  vfocar := false;
  TForm(pnGradeEC).OnKeyDown := FormGradeKeyDown;  
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TfrmCadGrade.SpeedBDesmarcarTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obGrade._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadGrade.SpeedBSelTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obGrade._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadGrade.SpeedButton1Click(Sender: TObject);
var
 vtipoEC: string;
 i: Integer;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('GRADES', 'A', obGrade.buscas) then
    Exit;
  if obGrade.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    Exit;
  if not vDadosIni.PesqPros('PRO097', 'EDITAR', '', 'GRADE', obGrade.dataSet.FieldByName('cod_grade').AsString, obGrade.buscas, true) then
//  if not vDadosIni.PesqPros('PRO097', obGrade.dataSet.FieldByName('cod_grade').AsString, obGrade.buscas, true) then
    exit;

  lbGradeDupla.Visible := true;
	ckGradeDupla.Visible := true;
  ckGradeDupla.Checked := false;
  GroupBoxEC.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce);
  pnBotoesEC.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce);
  btEditarGrade.Visible := trim(obGrade.dataSet.FieldByName('TIPO_EC').AsString) <> '';
  btEditarGrade.Enabled := trim(obGrade.dataSet.FieldByName('TIPO_EC').AsString) <> '';
  DBComboBox1.Enabled := (trim(obGrade.dataSet.FieldByName('TIPO_EC').AsString) = '')
  	and (trim(obGrade.dataSet.FieldByName('TIPO_EC1').AsString) = '');

  Label11.Enabled := (trim(obGrade.dataSet.FieldByName('TIPO_EC1').AsString) <> '');
  Label12.Enabled := (trim(obGrade.dataSet.FieldByName('TIPO_EC1').AsString) <> '');
	DBComboBox2.Enabled := false;
	DBEdit5.Enabled := false;
  vfocar := true;

  if (vDadosIni.vEcommerce.vHabilitarEcommerce) then
  begin
    pnGradeEC.Align := alNone;
    pnGradeEC.Height := 254;
    pnGradeEC.Width := 771;
    CheckCadSeqEC.Enabled := false;
    CheckCadSeqEC.Visible := false;
    CheckCadSeqEC.Checked := false;
    LabelSeqEC.Enabled := false;
    LabelSeqEC.Visible := false;

    vtipoEC := trim(obGrade.dataset.FieldByName('TIPO_EC').AsString);
    for i := 0 to DBComboBox1.Items.Count - 1 do
    begin
      if vtipoEC = trim(DBComboBox1.Items[i]) then
      begin
        dbcombobox1.ItemIndex := i;
        break;
      end;
    end;

    vtipoEC := trim(obGrade.dataset.FieldByName('TIPO_EC1').AsString);
    for i := 0 to DBComboBox2.Items.Count - 1 do
    begin
      if vtipoEC = trim(DBComboBox2.Items[i]) then
      begin
        DBComboBox2.ItemIndex := i;
        break;
      end;
    end;

    if not obGrade.Edit then
      exit;

    if (trim(obGrade.dataSet.FieldByName('TIPO_EC').AsString) <> '') then
      if trim(obGrade.dataSet.FieldByName('DESCRICAO_EC').AsString) = '' then
         obGrade.dataSet.FieldByName('DESCRICAO_EC').AsString :=
          vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(obGrade.dataSet.FieldByName('DESCRICAO').AsString));

  	if (trim(obGrade.dataSet.FieldByName('TIPO_EC1').AsString) <> '') then
      if trim(obGrade.dataSet.FieldByName('DESCRICAO_EC1').AsString) = '' then
         obGrade.dataSet.FieldByName('DESCRICAO_EC1').AsString :=
          vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(obGrade.dataSet.FieldByName('DESCRICAO1').AsString));

    vDadosIni.abreForm('Grade', pnGradeEC, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
  end
  else
  begin
    inherited;
    pnGradeEC.Align := alClient;
    TabSheet3.Show;
    if obGrade.Edit then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
  end;
end;

procedure TfrmCadGrade.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO100', 'ABRIR', '', 'GRADE', '', obGrade.buscas, true) then
//  if vDadosIni.PesqPros('PRO100', 'ABRIR A LIXEIRA', '', 'GRADE', '', obGrade.buscas, true) then
  begin
    inherited;
    try
      Screen.Cursor := crHourGlass;
      if not obGrade.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira - [PRO099]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
        SpeedButton6.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;

        ckLixeira.Enabled := false;
        ckLixeira.Checked := false;
        ckLixeira.Enabled := true;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO098]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
        SpeedButton6.Visible := false;

        ckLixeira.Enabled := false;
        ckLixeira.Checked := true;
        ckLixeira.Enabled := true;
      end;
      obGrade.ultimasql := obGrade.dataSet.CommandText;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadGrade.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('GRADES', 'E', obGrade.buscas) then
    Exit;

  try
    obGrade.Delete;
    vStatusLixeira := obGrade.StatusLixeira;
	  lixeiraVazia(not vStatusLixeira);
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obGrade.Cancel;
      obGrade.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadGrade.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('GRADES', 'A', obGrade.buscas) then
    Exit;

  if not obGrade.RestaurarRegistro then
  	Exit;

  if obGrade.StatusLixeira then
  	 lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCadGrade.SpeedButton6Click(Sender: TObject);
begin
  inherited;
	frmCadGrade.Caption := 'Alteração Grade em Lote';

  Panel52.Height := GroupBox3.Height;
 

  BitBtn2.Visible := False;
  BitBtn3.Visible := False;
  btVoltarDadosProc.Parent := GroupBox3;

  Panel1.Visible := true;
  Panel1.Parent := Panel128;
  Panel2.Visible := False;

  GroupBox3.Parent := Panel52;

  _LerConfiguracoesRegistroBoolean(ckPermOpcaoMarcadas.Name, False);
  
	PageControl1.ActivePage := tsAlterDadosProc;
end;

procedure TfrmCadGrade.SpeedButtonAlterarProduto2Click(Sender: TObject);
var
  vTipo1, vTipo2: string;
  vCodControle: Integer;
	vCodVendedor: Integer;
  I: Integer;
  vIndexFieldNames: string;
  vIndexName: string;
  vRecNo: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('PRO453', 'ABRIR', '', 'GRADE', '', obGrade.buscas, true) then
  	exit;

  vTipo1 := _LerConfiguracoesRegistroString(cbTipo1.Name);
  for I := 0 to cbTipo1.Items.Count - 1 do
  	if cbTipo1.Items[I] = vTipo1 then
    begin
      cbTipo1.ItemIndex := I;
      Break;
    end;

  vTipo2 := _LerConfiguracoesRegistroString(cbTipo2.Name);
  for I := 0 to cbTipo2.Items.Count - 1 do
  	if cbTipo2.Items[I] = vTipo2 then
    begin
      cbTipo2.ItemIndex := I;
      Break;
    end;

  if ckPermOpcaoMarcadas.Checked then
	  ckTipo1.Checked := _LerConfiguracoesRegistroBoolean(ckTipo1.Name)
  else
  	ckTipo1.Checked := false;
  ckTipo1Click(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckTipo2.Checked := _LerConfiguracoesRegistroBoolean(ckTipo2.Name)
  else
  	ckTipo2.Checked := false;
  ckTipo2Click(Sender);

  try
  	vIndexFieldNames := obGrade.dataSet.IndexFieldNames;
    vIndexName       := obGrade.dataSet.IndexName;
    vRecNo           := obGrade.dataSet.RecNo;

    obGrade.dataSet.DisableControls;
    obGrade.dataSet.Filtered := false;
    obGrade.dataSet.Filter := 'sel = ''S'' ';
    obGrade.dataSet.Filtered := true;

    if obGrade.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum contrato selecionado.', 'Atenção',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      obGrade.dataSet.Refresh;
      exit;
    end;
  finally
  	obGrade.dataSet.Filtered          := false;
    obGrade.dataSet.IndexName         := vIndexName;
    if (trim(vIndexName) = '') and (trim(vIndexFieldNames) = '') then
    	obGrade.dataSet.IndexFieldNames := 'COD_GRADE'
    else
	    obGrade.dataSet.IndexFieldNames := vIndexFieldNames;
    if obGrade.dataSet.RecordCount >= vRecNo then
	    obGrade.dataSet.RecNo           := vRecNo;
    obGrade.dataSet.EnableControls;
  end;

  if not obGrade._abreFormGradesAlteracaoEmLote then
  	exit;

  obGrade.dataSet.Refresh;
end;

procedure TfrmCadGrade.SpeedButtonAlterarProdutoClick(Sender: TObject);
begin
  inherited;
  TelaCadastro := 5;
  if (obGrade.dataSet.State in [dsInsert, dsEdit]) then
  begin
  	 if obGrade.dataSet.FieldByName('ativo').AsInteger <> 1 then
     	obGrade.dataSet.FieldByName('ativo').AsInteger := 1;
  end;
  SpeedButton1Click(Sender);
end;

end.

