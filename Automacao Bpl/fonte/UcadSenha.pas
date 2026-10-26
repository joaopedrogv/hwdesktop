unit UcadSenha;

interface

uses
  Windows, uClassesCadastrosBasicos, QRCtrls, QRMBCtrls, grimgctrl,
  QuickRpt, StdCtrls, ExtCtrls, DBCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, Controls, Mask, Forms, Classes, AppEvnts, Graphics, uCadPadraoModal,
  uEditHw;

type
  TfrmCadSenha = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBComboBox1: TDBComboBox;
    Label10: TLabel;
    Label12: TLabel;
    DBComboBox2: TDBComboBox;
    Label13: TLabel;
    Label14: TLabel;
    DBComboBox3: TDBComboBox;
    Label15: TLabel;
    DBComboBox4: TDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    TabSheet4: TTabSheet;
    DBComboBox5: TDBComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel2: TQRLabel;
    QRMBLabel1: TQRMBLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    tsSistemas: TTabSheet;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    tsMultiEmpresa: TTabSheet;
    pnMultiEmpresa: TPanel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Panel4: TPanel;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label11: TLabel;
    Label16: TLabel;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    Label17: TLabel;
    tsConsultasOLAP: TTabSheet;
    pnConsultasOLAP: TPanel;
    Panel5: TPanel;
    tvDB: TTreeView;
    Panel6: TPanel;
    Panel7: TPanel;
    tvUS: TTreeView;
    Splitter3: TSplitter;
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn13: TBitBtn;
    tsExcecoesProcessos: TTabSheet;
    Panel10: TPanel;
    BitBtn120: TBitBtn;
    BitBtn109: TBitBtn;
    GroupBox7: TGroupBox;
    DBGrid6: TDBGrid;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodasSenhasClick: TMenuItem;
    DesmarcarTodasSenhasClick: TMenuItem;
    Label18: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    tsAlterDadosLote: TTabSheet;
    pnAlteracaoEmLote: TPanel;
    GroupBoxAlteracaoEmLote: TGroupBox;
    pnDepartamento: TPanel;
    lbDepartamento: TLabel;
    ckDepartamento: TCheckBox;
    pnLiberarAcesso: TPanel;
    lbLiberarAcesso: TLabel;
    ckLiberarAcesso: TCheckBox;
    pnEstoqueNegativo: TPanel;
    lbEstoqueNegativo: TLabel;
    ckEstoqueNegativo: TCheckBox;
    pnAlterarImpressora: TPanel;
    lbAlterarImpressora: TLabel;
    cbAlterarImpressora: TComboBox;
    ckAlterarImpressora: TCheckBox;
    pnAlterarCabecalho: TPanel;
    lbAlterarCabecalho: TLabel;
    ckAlterarCabecalho: TCheckBox;
    pnNivelSenha: TPanel;
    lbNivelSenha: TLabel;
    cbNivelSenha: TComboBox;
    ckNivelSenha: TCheckBox;
    pnModoImpressao: TPanel;
    lbModoImpressao: TLabel;
    ckModoImpressao: TCheckBox;
    Panel21: TPanel;
    Panel11: TPanel;
    btnOKAlteracaoEmLote: TBitBtn;
    btnCancelarAlteracaoEmLote: TBitBtn;
    cbDepartamento: TComboBox;
    cbLiberarAcesso: TComboBox;
    cbEstoqueNegativo: TComboBox;
    cbModoImpressao: TComboBox;
    cbAlterarCabecalho: TComboBox;
    pnPerfilHorarioTrabalho: TPanel;
    lbPerfilHorarioTrabalho: TLabel;
    ckPerfilHorarioTrabalho: TCheckBox;
    DBLPerfilHorarioTrabalho: TDBLookupComboBox;
    tsAlterDadosProc: TTabSheet;
    Panel52: TPanel;
    btVoltarDadosProc: TBitBtn;
    GroupBox79: TGroupBox;
    DBText57: TDBText;
    DBText58: TDBText;
    Label450: TLabel;
    DBText59: TDBText;
    Label453: TLabel;
    Label19: TLabel;
    Panel128: TPanel;
    pnCenterAlterDadosProd: TPanel;
    SpeedButtonAlterarSenha: TSpeedButton;
    SpeedButtonAlterarSenha2: TSpeedButton;
    btExcluirRegistro: TSpeedButton;
    ckPermOpcaoMarcadas: TCheckBox;
    procedure ckPermOpcaoMarcadasClick(Sender: TObject);
    procedure SpeedButtonAlterarSenhaClick(Sender: TObject);
    procedure btnCancelarAlteracaoEmLoteClick(Sender: TObject);
    procedure btnOKAlteracaoEmLoteClick(Sender: TObject);
    procedure ckEstoqueNegativoClick(Sender: TObject);
    procedure ckPerfilHorarioTrabalhoClick(Sender: TObject);
    procedure ckNivelSenhaClick(Sender: TObject);
    procedure ckAlterarCabecalhoClick(Sender: TObject);
    procedure ckAlterarImpressoraClick(Sender: TObject);
    procedure ckModoImpressaoClick(Sender: TObject);
    procedure ckLiberarAcessoClick(Sender: TObject);
    procedure ckDepartamentoClick(Sender: TObject);
    procedure SpeedButtonAlterarSenha2Click(Sender: TObject);
    procedure btVoltarDadosProcClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure DesmarcarTodasSenhasClickClick(Sender: TObject);
    procedure MarcarTodasSenhasClickClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn120Click(Sender: TObject);
    procedure DBGrid6TitleClick(Column: TColumn);
    procedure BitBtn109Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure tvUSDblClick(Sender: TObject);
    procedure tvDBDblClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    vCriou: Smallint;
    FConsultasOLAP: TOLAP_ConsultasUsuario;
    procedure ChangeOLABDB(AList: TOLAP_GruposList);
    procedure ChangeOLABUS(AList: TOLAP_GruposList);
  public
    { Public declarations }
  end;

var
  frmCadSenha: TfrmCadSenha;
  obSenha: TSenha;

implementation

uses uDtmAtivo, UDtmCadastrosBasicos, SysUtils, DB, uDadosIni, funcoes, 
  Variants;

{$R *.dfm}

procedure TfrmCadSenha.BitBtn109Click(Sender: TObject);
begin
  Self.Caption := 'Senhas';
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadSenha.BitBtn10Click(Sender: TObject);
begin
  inherited;
  PageControl3.ActivePage := TabSheet3;
end;

procedure TfrmCadSenha.BitBtn11Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not obSenha.importarUsuarioOutraEmpresa then
      Exit;

    inherited BitBtn3Click(BitBtn3);

    PageControl1.ActivePage := TabSheet1;
    TabSheet3.TabVisible := True;
    //TabSheet3.Caption:= 'Cadastro Senha';
    PageControl3.ActivePage := TabSheet3;
    obSenha.vColaborador.abreColaborador;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;

    Edit1.Text := vDadosIni.decodifica(obSenha.dataSet.FieldByName('SENHA').AsString);
    Edit2.Text := vDadosIni.decodifica(obSenha.dataSet.FieldByName('CONTRA_SENHA').AsString);
    Edit1.Enabled := False;
    Edit2.Enabled := False;
    obSenha.vSenhas_erp.abreSenhas_erp(Trim(obSenha.dataSet.FieldByName('usuario').asString));
    DBEdit1.Enabled := False;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSenha.BitBtn120Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGrid6, GroupBox7.Caption);
end;

procedure TfrmCadSenha.BitBtn12Click(Sender: TObject);
begin
  inherited;
  obSenha.concluirImportacaoUsuarioOutraEmpresa;
  PageControl1.ActivePage := TabSheet2;
  SpeedButton6.Tag := 0;
  BitBtn1.Click;
end;

procedure TfrmCadSenha.BitBtn14Click(Sender: TObject);
begin
  try
    Screen.Cursor := 11;
    obSenha.vExcecoesProc.abreExcecoesProc(obSenha.dataSet.FieldByName('USUARIO').AsString);
  finally
    Screen.Cursor := 0;
  end;
end;

procedure TfrmCadSenha.BitBtn15Click(Sender: TObject);
begin
   try
    Screen.Cursor := 11;
    obSenha.vExcecoesProc.imprimirExcecoesProcesso(obSenha.dataSet.FieldByName('USUARIO').AsString);
  finally
    Screen.Cursor := 0;
  end;
end;

procedure TfrmCadSenha.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira - [CFG027]';
  try
    if not vDadosIni.PesqPros('CFG022', 'PESQUISAR', '','SENHAS','', obSenha.buscas, true) then
     exit;
    Screen.Cursor := 11;
    if MaskEdit2.Visible then
    begin
      if not obSenha.ConsultaCampos('Senhas', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if not obSenha.ConsultaCampos('Senhas', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    SpeedButton12.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := 0;
  end;
end;

procedure TfrmCadSenha.BitBtn3Click(Sender: TObject);
begin
  try
    if not vDadosIni.PesqPros('CFG023', 'INCLUIR', '','SENHAS','', obSenha.buscas, true) then
     exit;
    Screen.Cursor := 11;
    if not obSenha.Insert then
      exit;

    ActiveControl := BitBtn3;
    inherited;

    PageControl1.ActivePage := TabSheet1;
    TabSheet3.TabVisible := True;
    //TabSheet3.Caption:= 'Cadastro Senha';
    PageControl3.ActivePage := TabSheet3;

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
    
    Edit1.Enabled := True;
    Edit2.Enabled := True;
    Edit1.Clear;
    Edit2.Clear;

    obSenha.vSenhas_erp.abreSenhas_erp(Trim(obSenha.dataSet.FieldByName('usuario').asString));
    DBEdit1.Enabled := True;
  finally
    Screen.Cursor := 0;
  end;
end;

procedure TfrmCadSenha.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CFG024', 'CONFIRMAR', '','SENHAS','', obSenha.buscas, true) then
   exit;
  obSenha.dataSet.FieldByName('SENHA').AsString := trim(Edit1.Text);
  obSenha.dataSet.FieldByName('CONTRA_SENHA').AsString := trim(Edit2.Text);

  if not obSenha.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obSenha.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
        	DBLookupComboBox1.SetFocus;
      MudaCor;
    end
    else
    begin
      inherited;
      if SpeedButton6.Tag = 1 then
      begin
        SpeedButton6.Tag := 0;
        BitBtn1.Click;
      end;
    end;
  end;
end;

procedure TfrmCadSenha.BitBtn5Click(Sender: TObject);
begin
  obSenha.Cancel;
  obSenha.RollBackTransacao;
  if SpeedButton6.Tag = 1 then
  begin
    SpeedButton6.Tag := 0;
    BitBtn1.Click;
  end;

  if (TelaCadastro = 5) then
  begin
  	PageControl1.ActivePage := tsAlterDadosProc;
    tsAlterDadosProc.Show;
    exit;
  end;
  inherited;
end;

procedure TfrmCadSenha.BitBtn7Click(Sender: TObject);
begin
  inherited;
  obSenha.vSenhas_erp.insert(obSenha);
  obSenha.vSenhas_erp.Post;
end;

procedure TfrmCadSenha.BitBtn8Click(Sender: TObject);
begin
  inherited;
  obSenha.vSenhas_erp.Delete;
end;

procedure TfrmCadSenha.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG025', 'SELECIONAR', '','SENHAS',
  obSenha.dataSet.FieldByName('usuario').AsString, obSenha.buscas, true) then
   exit;
  if trim(DBEdit1.Text) = '' then
  begin
    Application.MessageBox('Informe o usuário primeiro','Atenção',MB_OK+MB_ICONEXCLAMATION);
    exit;
  end;
  if (obSenha.dataSet.State = dsInsert) and (not obSenha.vSenhas_erp.dataSet.Active) then
    obSenha.vSenhas_erp.abreSenhas_erp(obSenha.dataSet.FieldByName('usuario').AsString);
  DBEdit1.Enabled := false;
  PageControl3.ActivePage := tsSistemas;
end;

procedure TfrmCadSenha.btnCancelarAlteracaoEmLoteClick(Sender: TObject);
begin
  inherited;
	TForm(pnAlteracaoEmLote.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadSenha.btnOKAlteracaoEmLoteClick(Sender: TObject);
begin
  inherited;
	try
  	if (Self.Enabled) and (Self.Visible) and (btnOKAlteracaoEmLote.CanFocus) then
      btnOKAlteracaoEmLote.SetFocus;

    obSenha.vDEPARTAMENTO := trim(cbDepartamento.Text);
    obSenha.vLIBERAR_ACESSO := trim(cbLiberarAcesso.Text);
    obSenha.vESTOQUE_NEGATIVO := trim(cbEstoqueNegativo.Text);
    obSenha.vMODO_IMPRESSAO := trim(cbModoImpressao.Text);
    obSenha.vALTERAR_IMPRESSORA := trim(cbAlterarImpressora.Text);
    obSenha.vALTERAR_CABECALHO := trim(cbAlterarCabecalho.Text);

    if trim(cbNivelSenha.Text) = '' then
    	obSenha.vNIVEL_SENHA := 0
    else
    	obSenha.vNIVEL_SENHA := StrToInt(trim(cbNivelSenha.Text));

    if DBLPerfilHorarioTrabalho.KeyValue = Null then
    	obSenha.vPERFIL_HORARIO_TRABALHO := 0
    else
    	obSenha.vPERFIL_HORARIO_TRABALHO := DBLPerfilHorarioTrabalho.KeyValue;

    obSenha.vHAB_DEPARTAMENTO := ckDepartamento.Checked;
    obSenha.vHAB_LIBERAR_ACESSO := ckLiberarAcesso.Checked;
    obSenha.vHAB_ESTOQUE_NEGATIVO := ckEstoqueNegativo.Checked;
  	obSenha.vHAB_MODO_IMPRESSAO := ckModoImpressao.Checked;
  	obSenha.vHAB_ALTERAR_IMPRESSORA := ckAlterarImpressora.Checked;
    obSenha.vHAB_ALTERAR_CABECALHO := ckAlterarCabecalho.Checked;
    obSenha.vHAB_NIVEL_SENHA := ckNivelSenha.Checked;
    obSenha.vHAB_PERFIL_HORARIO_TRABALHO := ckPerfilHorarioTrabalho.Checked;

    if not obSenha.atualizarSenhasEmLote then
    begin
    	setFocusCampoErro(obSenha.vNomeCampoErro, obSenha.vMensagemErro);
    	exit;
    end;

		TForm(pnAlteracaoEmLote.Parent).ModalResult := IDOK;
  finally
    _GravaConfiguracoesString(cbDepartamento.Name, trim(cbDepartamento.Text));
    _GravaConfiguracoesString(cbLiberarAcesso.Name, trim(cbLiberarAcesso.Text));
    _GravaConfiguracoesString(cbEstoqueNegativo.Name, trim(cbEstoqueNegativo.Text));
    _GravaConfiguracoesString(cbModoImpressao.Name, trim(cbModoImpressao.Text));
    _GravaConfiguracoesString(cbAlterarImpressora.Name, trim(cbAlterarImpressora.Text));
    _GravaConfiguracoesString(cbAlterarCabecalho.Name, trim(cbAlterarCabecalho.Text));

    if trim(cbNivelSenha.Text) = '' then
    	_GravaConfiguracoesString(cbNivelSenha.Name, '0')
    else
    	_GravaConfiguracoesString(cbNivelSenha.Name, trim(cbNivelSenha.Text));

    if DBLPerfilHorarioTrabalho.KeyValue = Null then
    	_GravaConfiguracoesInteger(DBLPerfilHorarioTrabalho.Name, 0)
    else
    	_GravaConfiguracoesInteger(DBLPerfilHorarioTrabalho.Name, DBLPerfilHorarioTrabalho.KeyValue);

    _GravaConfiguracoesBoolean(ckDepartamento.Name, ckDepartamento.Checked);
    _GravaConfiguracoesBoolean(ckLiberarAcesso.Name, ckLiberarAcesso.Checked);
    _GravaConfiguracoesBoolean(ckEstoqueNegativo.Name, ckEstoqueNegativo.Checked);
    _GravaConfiguracoesBoolean(ckModoImpressao.Name, ckModoImpressao.Checked);
    _GravaConfiguracoesBoolean(ckAlterarImpressora.Name, ckAlterarImpressora.Checked);
    _GravaConfiguracoesBoolean(ckAlterarCabecalho.Name, ckAlterarCabecalho.Checked);
    _GravaConfiguracoesBoolean(ckNivelSenha.Name, ckNivelSenha.Checked);
    _GravaConfiguracoesBoolean(ckPerfilHorarioTrabalho.Name, ckPerfilHorarioTrabalho.Checked);
  end;
end;

procedure TfrmCadSenha.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obSenha._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadSenha.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obSenha._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadSenha.btVoltarDadosProcClick(Sender: TObject);
begin
  inherited;
	frmCadSenha.Caption := 'Senhas';

	Panel2.Visible := true;
	GroupBox3.Parent := TabSheet2;
  
	btVoltarDadosProc.Parent := Panel52;
  BitBtn2.Visible := True;
  BitBtn3.Visible := True;
  Panel1.Parent := TabSheet2;
  TelaCadastro := 0;
  
	PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadSenha.ChangeOLABDB(AList: TOLAP_GruposList);
var
  I, J: Integer;
  Anode: TTreeNode;
begin
  tvDB.Items.Clear;
  for I := 0 to AList.Count - 1 do
  begin
    Anode := tvDB.Items.AddChild(nil, AList.Items[I].Grupo);
    for J := 0 to AList.Items[I].Consultas.Count - 1 do
      tvDB.Items.AddChild(Anode, AList.Items[I].Consultas.Items[J].nome);
  end;
end;

procedure TfrmCadSenha.ChangeOLABUS(AList: TOLAP_GruposList);
var
  I, J: Integer;
  Anode: TTreeNode;
begin
  tvUS.Items.Clear;
  for I := 0 to AList.Count - 1 do
  begin
    Anode := tvUS.Items.AddChild(nil, AList.Items[I].Grupo);
    for J := 0 to AList.Items[I].Consultas.Count - 1 do
      tvUS.Items.AddChild(Anode, AList.Items[I].Consultas.Items[J].nome);
  end;
end;

procedure TfrmCadSenha.ckAlterarCabecalhoClick(Sender: TObject);
begin
  inherited;
	cbAlterarCabecalho.Enabled := ckAlterarCabecalho.Checked;
  if ckAlterarCabecalho.Checked then
  begin
  	pnAlterarCabecalho.ParentBackground := False;
		pnAlterarCabecalho.Color := clYellow;
  end
  else
  begin
  	pnAlterarCabecalho.ParentBackground := True;
  	pnAlterarCabecalho.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbAlterarCabecalho.CanFocus) then
  	cbAlterarCabecalho.SetFocus;
end;

procedure TfrmCadSenha.ckAlterarImpressoraClick(Sender: TObject);
begin
  inherited;
	cbAlterarImpressora.Enabled := ckAlterarImpressora.Checked;
  if ckAlterarImpressora.Checked then
  begin
  	pnAlterarImpressora.ParentBackground := False;
		pnAlterarImpressora.Color := clYellow;
  end
  else
  begin
  	pnAlterarImpressora.ParentBackground := True;
  	pnAlterarImpressora.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbAlterarImpressora.CanFocus) then
  	cbAlterarImpressora.SetFocus;
end;

procedure TfrmCadSenha.ckDepartamentoClick(Sender: TObject);
begin
  inherited;
	cbDepartamento.Enabled := ckDepartamento.Checked;
  if ckDepartamento.Checked then
  begin
  	pnDepartamento.ParentBackground := False;
		pnDepartamento.Color := clYellow;
  end
  else
  begin
  	pnDepartamento.ParentBackground := True;
  	pnDepartamento.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbDepartamento.CanFocus) then
  	cbDepartamento.SetFocus;
end;

procedure TfrmCadSenha.ckEstoqueNegativoClick(Sender: TObject);
begin
  inherited;
	cbEstoqueNegativo.Enabled := ckEstoqueNegativo.Checked;
  if ckEstoqueNegativo.Checked then
  begin
  	pnEstoqueNegativo.ParentBackground := False;
		pnEstoqueNegativo.Color := clYellow;
  end
  else
  begin
  	pnEstoqueNegativo.ParentBackground := True;
  	pnEstoqueNegativo.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbEstoqueNegativo.CanFocus) then
  	cbEstoqueNegativo.SetFocus;
end;

procedure TfrmCadSenha.ckLiberarAcessoClick(Sender: TObject);
begin
  inherited;
  cbLiberarAcesso.Enabled := ckLiberarAcesso.Checked;
  if ckLiberarAcesso.Checked then
  begin
  	pnLiberarAcesso.ParentBackground := False;
		pnLiberarAcesso.Color := clYellow;
  end
  else
  begin
  	pnLiberarAcesso.ParentBackground := True;
  	pnLiberarAcesso.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbLiberarAcesso.CanFocus) then
  	cbLiberarAcesso.SetFocus;
end;

procedure TfrmCadSenha.ckModoImpressaoClick(Sender: TObject);
begin
  inherited;
	cbModoImpressao.Enabled := ckModoImpressao.Checked;
  if ckModoImpressao.Checked then
  begin
  	pnModoImpressao.ParentBackground := False;
		pnModoImpressao.Color := clYellow;
  end
  else
  begin
  	pnModoImpressao.ParentBackground := True;
  	pnModoImpressao.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbModoImpressao.CanFocus) then
  	cbModoImpressao.SetFocus;
end;

procedure TfrmCadSenha.ckNivelSenhaClick(Sender: TObject);
begin
  inherited;
	cbNivelSenha.Enabled := ckNivelSenha.Checked;
  if ckNivelSenha.Checked then
  begin
  	pnNivelSenha.ParentBackground := False;
		pnNivelSenha.Color := clYellow;
  end
  else
  begin
  	pnNivelSenha.ParentBackground := True;
  	pnNivelSenha.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbNivelSenha.CanFocus) then
  	cbNivelSenha.SetFocus;
end;

procedure TfrmCadSenha.ckPerfilHorarioTrabalhoClick(Sender: TObject);
begin
  inherited;
	DBLPerfilHorarioTrabalho.Enabled := ckPerfilHorarioTrabalho.Checked;
  if ckPerfilHorarioTrabalho.Checked then
  begin
  	pnPerfilHorarioTrabalho.ParentBackground := False;
		pnPerfilHorarioTrabalho.Color := clYellow;
  end
  else
  begin
  	pnPerfilHorarioTrabalho.ParentBackground := True;
  	pnPerfilHorarioTrabalho.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLPerfilHorarioTrabalho.CanFocus) then
  	DBLPerfilHorarioTrabalho.SetFocus;
end;

procedure TfrmCadSenha.ckPermOpcaoMarcadasClick(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesBoolean(ckPermOpcaoMarcadas.Name, ckPermOpcaoMarcadas.Checked);
end;

procedure TfrmCadSenha.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadSenha.DBComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TfrmCadSenha.DBComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadSenha.DBComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadSenha.DBComboBox5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadSenha.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if DBEdit1.Text = '' then
    exit;
  if obSenha.verificaCadastrado(DBEdit1.Text) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
    raise exception.Create('Usuário já cadastrado');
  end;
end;

procedure TfrmCadSenha.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    obSenha._marcaDesmarcaLinha;
end;

procedure TfrmCadSenha.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadSenha.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not obSenha.dataSet.IsEmpty then
      obSenha._marcaDesmarcaLinha;
end;

procedure TfrmCadSenha.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  BitBtn7Click(Sender);
end;

procedure TfrmCadSenha.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn7Click(Sender);
end;

procedure TfrmCadSenha.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
  BitBtn8Click(Sender);

end;

procedure TfrmCadSenha.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn8Click(Sender);
end;

procedure TfrmCadSenha.DBGrid6TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid6, Column);
end;

procedure TfrmCadSenha.DesmarcarTodasSenhasClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obSenha._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmCadSenha := nil;
end;

procedure TfrmCadSenha.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  obSenha := TSenha.create;

  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if Key = VK_ESCAPE then
//    BitBtn5Click(sender);
  if PageControl1.ActivePage = TabSheet2 then
  begin
    if key = VK_INSERT then
      BitBtn3Click(sender);
  end
  else if PageControl1.ActivePage = tsExcecoesProcessos then
  begin
     if Key = VK_F5 then
       BitBtn14Click(sender)
     else if Key = VK_ESCAPE then
       BitBtn109Click(Sender);
  end;
end;

procedure TfrmCadSenha.FormShow(Sender: TObject);
var
  I: integer;
begin

  obSenha.abreSenha;
  obSenha.vSenhas_erp.vERP.abreErp;

  TabSheet4.TabVisible := false;
  tsSistemas.TabVisible := false;
  TabSheet3.TabVisible := false;
  tsExcecoesProcessos.TabVisible := false;
  tsMultiEmpresa.TabVisible := false;
  tsConsultasOLAP.TabVisible := false;
  tsAlterDadosProc.TabVisible := false;
  tsAlterDadosLote.TabVisible := false;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsSenha;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  if obSenha.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);

  if vCriou = 0 then
  begin
  	DBComboBox1.Clear;
    cbDepartamento.Clear;

    obSenha.vDpto.AbreDepto;
    obSenha.vDpto.buscas.First;
    while not obSenha.vDpto.buscas.Eof do
    begin
      DBComboBox1.Items.Add(trim(obSenha.vDpto.buscas.FieldByName('NOME_DEPTO').AsString));
      cbDepartamento.Items.Add(trim(obSenha.vDpto.buscas.FieldByName('NOME_DEPTO').AsString));

      obSenha.vDpto.buscas.Next;
    end;
  end;

  Label16.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
  DBComboBox6.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';

  if vCriou = 0 then
  	vCriou := 1;
end;

procedure TfrmCadSenha.GroupBox1Enter(Sender: TObject);
begin
  inherited;
  if (obSenha.dataSet.FieldByName('emp_padrao').AsInteger > 0) and (obSenha.dataSet.FieldByName('emp_padrao').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
  begin
    Label11.Caption := 'Usuário padrão da empresa: ' + vDadosIni.StrZero(obSenha.dataSet.FieldByName('emp_padrao').AsInteger, 3);
    Label11.Visible := True;
    Edit1.Enabled := False;
    Edit2.Enabled := False;
  end
  else
  begin
    Label11.Visible := False;
    Edit1.Enabled := True;
    Edit2.Enabled := True;
  end;
end;

procedure TfrmCadSenha.MarcarTodasSenhasClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obSenha._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadSenha.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relação de Usuários do Sistema');
end;

procedure TfrmCadSenha.SpeedButton11Click(Sender: TObject);
var
  CadPerfilHorasTrabalho: TCadPerfilHorasTrabalho;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    CadPerfilHorasTrabalho._cadPerfilHorasTrabalho(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSenha.SpeedButton12Click(Sender: TObject);
begin
  inherited;
	frmCadSenha.Caption := 'Alteração Senhas em Lote';

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

procedure TfrmCadSenha.SpeedButton1Click(Sender: TObject);
begin
  try
    if not vDadosIni.PesqPros('CFG026', 'EDITAR', '','SENHAS',
    obSenha.dataSet.FieldByName('usuario').AsString, obSenha.buscas, true) then
     exit;
    Screen.Cursor := 11;
    if obSenha.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
      exit;

    inherited;
    if not obSenha.Edit then
      exit;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.TabVisible := True;
    //TabSheet3.Caption:= 'Alterando Senha';

    edit1.Clear;
    edit2.Clear;
    Edit1.Text := vDadosIni.decodifica(obSenha.dataSet.FieldByName('SENHA').AsString);
    Edit2.Text := vDadosIni.decodifica(obSenha.dataSet.FieldByName('CONTRA_SENHA').AsString);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
    obSenha.vSenhas_erp.abreSenhas_erp(Trim(obSenha.dataSet.FieldByName('usuario').asString));
    DBEdit1.Enabled := false;
  finally
    Screen.Cursor := 0;
  end;
end;

procedure TfrmCadSenha.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CFG029', 'ACESSAR', '','SENHAS', '', obSenha.buscas, true) then
  begin
    inherited;
    if not obSenha.abrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [CFG027]';

      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      SpeedButton12.Visible := true;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [CFG031]';

      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
      SpeedButton12.Visible := false;
    end;
  end;
end;

procedure TfrmCadSenha.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;
    if not obSenha.Delete then
      Exit;

    vStatusLixeira := obSenha.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obSenha.Cancel;
      obSenha.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadSenha.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('CFG028', 'EMITIR', '','SENHAS','',obSenha.buscas, true) then
     exit;
    Screen.Cursor := 11;
    QuickRep1.Preview;
  finally
    Screen.Cursor := 0;
  end;
end;

procedure TfrmCadSenha.SpeedButton5Click(Sender: TObject);
begin
  if not obSenha.restaurarLixeira then
  	Exit;

  if obSenha.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCadSenha.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  
  if not vDadosIni.PesqPros('CFG045', 'IMPORTAR', '','SENHAS',
    obSenha.dataSet.FieldByName('usuario').AsString, obSenha.buscas, true) then
     exit;
  if obSenha.iniciarImportacaoUsuarioOutraEmpresa then
  begin
    PageControl1.ActivePage := tsMultiEmpresa;
    SpeedButton6.Tag := 1;
  end;
end;

procedure TfrmCadSenha.SpeedButton7Click(Sender: TObject);
begin
  if obSenha.dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('CFG052', 'VISUALIZAR', '','SENHAS',
    obSenha.dataSet.FieldByName('usuario').AsString, obSenha.buscas, true) then
     exit;

  obSenha.vExcecoesProc.abreExcecoesProc(obSenha.dataSet.FieldByName('USUARIO').AsString);
  GroupBox7.Caption := 'Exceções de Processos usuário: ' + trim(obSenha.dataSet.FieldByName('USUARIO').AsString);
  Self.Caption := 'Exceções de Processos por usuário';
  PageControl1.ActivePage := tsExcecoesProcessos;
end;

procedure TfrmCadSenha.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if obSenha.dataSet.IsEmpty then
  begin
    vDadosIni.ShowAtencao('Nenhum usuário selecionado');
    Exit;
  end;

  if not vDadosIni.PesqPros('GES042', 'CONFIGURAR', obSenha.dataSet.FieldByName('usuario').AsString, 'SENHAS', '', obSenha.buscas ) then
    Exit;

  FConsultasOLAP := TOLAP_ConsultasUsuario.Create(obSenha);
  try
    Panel5.Width := Trunc(Panel7.Width / 2);
    FConsultasOLAP.OnChangeOLAPDB := ChangeOLABDB;
    FConsultasOLAP.OnChangeOLAPUS := ChangeOLABUS;

    FConsultasOLAP.Iniciar;

    vDadosIni.abreForm('Consultas OLAP do Usuário: ' + obSenha.dataSet.FieldByName('usuario').AsString,
      pnConsultasOLAP, opFormsDefCad + [ofEscapeExit]);
      
    FConsultasOLAP.OnChangeOLAPDB := nil;
    FConsultasOLAP.OnChangeOLAPUS := nil;

  finally
    FreeAndNil(FConsultasOLAP);
  end;
end;

procedure TfrmCadSenha.SpeedButtonAlterarSenha2Click(Sender: TObject);
var
	vDepartamento: string;
  vLiberarAcesso: string;
  vEstoqueNegativo: string;
  vModoImpressao: string;
  vAlterarImpressora: string;
  vAlterarCabecalho: string;
  vNivelSenha: string;
  vPerfilHorarioTrabalho: Integer;
  vIndexFieldNames: string;
  vIndexName: string;
  vRecNo: Integer;
  I: Integer;
begin
  inherited;
	if not vDadosIni.PesqPros('CFG056', 'ABRIR', '', 'SENHAS', '', obSenha.buscas, true) then
  	exit;

  vDepartamento := _LerConfiguracoesRegistroString(cbDepartamento.Name);
  for I := 0 to cbDepartamento.Items.Count - 1 do
  	if trim(cbDepartamento.Items[I]) = trim(vDepartamento) then
    begin
    	cbDepartamento.ItemIndex := I;
      Break;
    end;

  vLiberarAcesso := _LerConfiguracoesRegistroString(cbLiberarAcesso.Name);
  for I := 0 to cbLiberarAcesso.Items.Count - 1 do
  	if trim(cbLiberarAcesso.Items[I]) = trim(vLiberarAcesso) then
    begin
      cbLiberarAcesso.ItemIndex := I;
      Break;
    end;

  vEstoqueNegativo := _LerConfiguracoesRegistroString(cbEstoqueNegativo.Name);
  for I := 0 to cbEstoqueNegativo.Items.Count - 1 do
  	if trim(cbEstoqueNegativo.Items[I]) = trim(vEstoqueNegativo) then
    begin
      cbEstoqueNegativo.ItemIndex := I;
      Break;
    end;

  vModoImpressao := _LerConfiguracoesRegistroString(cbModoImpressao.Name);
  for I := 0 to cbModoImpressao.Items.Count - 1 do
  	if trim(cbModoImpressao.Items[I]) = trim(vModoImpressao) then
    begin
      cbModoImpressao.ItemIndex := I;
      Break;
    end;

  vAlterarImpressora := _LerConfiguracoesRegistroString(cbAlterarImpressora.Name);
  for I := 0 to cbAlterarImpressora.Items.Count - 1 do
  	if trim(cbAlterarImpressora.Items[I]) = trim(vAlterarImpressora) then
    begin
      cbAlterarImpressora.ItemIndex := I;
      Break;
    end;

  vAlterarCabecalho := _LerConfiguracoesRegistroString(cbAlterarCabecalho.Name);
  for I := 0 to cbAlterarCabecalho.Items.Count - 1 do
  	if trim(cbAlterarCabecalho.Items[I]) = trim(vAlterarCabecalho) then
    begin
      cbAlterarCabecalho.ItemIndex := I;
      Break;
    end;

  vNivelSenha := _LerConfiguracoesRegistroString(cbNivelSenha.Name);
  for I := 0 to cbNivelSenha.Items.Count - 1 do
  	if trim(cbNivelSenha.Items[I]) = trim(vNivelSenha) then
    begin
      cbNivelSenha.ItemIndex := I;
      Break;
    end;

  vPerfilHorarioTrabalho := _LerConfiguracoesRegistroInteger(DBLPerfilHorarioTrabalho.Name);
  if vPerfilHorarioTrabalho > 0 then
  	DBLPerfilHorarioTrabalho.KeyValue := vPerfilHorarioTrabalho;

  if ckPermOpcaoMarcadas.Checked then
	  ckDepartamento.Checked := _LerConfiguracoesRegistroBoolean(ckDepartamento.Name)
  else
  	ckDepartamento.Checked := false;
  ckDepartamentoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckLiberarAcesso.Checked := _LerConfiguracoesRegistroBoolean(ckLiberarAcesso.Name)
  else
  	ckLiberarAcesso.Checked := false;
  ckLiberarAcessoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckEstoqueNegativo.Checked := _LerConfiguracoesRegistroBoolean(ckEstoqueNegativo.Name)
  else
  	ckEstoqueNegativo.Checked := false;
  ckEstoqueNegativoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckModoImpressao.Checked := _LerConfiguracoesRegistroBoolean(ckModoImpressao.Name)
  else
  	ckModoImpressao.Checked := false;
  ckModoImpressaoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckAlterarImpressora.Checked := _LerConfiguracoesRegistroBoolean(ckAlterarImpressora.Name)
  else
  	ckAlterarImpressora.Checked := false;
  ckAlterarImpressoraClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckAlterarCabecalho.Checked := _LerConfiguracoesRegistroBoolean(cbAlterarCabecalho.Name)
  else
  	ckAlterarCabecalho.Checked := false;
  ckAlterarCabecalhoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckNivelSenha.Checked := _LerConfiguracoesRegistroBoolean(cbNivelSenha.Name)
  else
  	ckNivelSenha.Checked := false;
  ckNivelSenhaClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckPerfilHorarioTrabalho.Checked := _LerConfiguracoesRegistroBoolean(DBLPerfilHorarioTrabalho.Name)
  else
  	ckPerfilHorarioTrabalho.Checked := false;
  ckPerfilHorarioTrabalhoClick(Sender);

  try
  	vIndexFieldNames := obSenha.dataSet.IndexFieldNames;
    vIndexName       := obSenha.dataSet.IndexName;
    vRecNo           := obSenha.dataSet.RecNo;

    obSenha.dataSet.DisableControls;
    obSenha.dataSet.Filtered := false;
    obSenha.dataSet.Filter := 'sel = ''S'' ';
    obSenha.dataSet.Filtered := true;

    if obSenha.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhuma senha selecionada.', 'Atenção',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      obSenha.dataSet.Refresh;
      exit;
    end;
  finally
  	obSenha.dataSet.Filtered          := false;
    obSenha.dataSet.IndexName         := vIndexName;
    if (trim(vIndexName) = '') and (trim(vIndexFieldNames) = '') then
    	obSenha.dataSet.IndexFieldNames := 'CODIGO'
    else
	    obSenha.dataSet.IndexFieldNames := vIndexFieldNames;
    if obSenha.dataSet.RecordCount >= vRecNo then
	    obSenha.dataSet.RecNo           := vRecNo;
    obSenha.dataSet.EnableControls;
  end;

  obSenha.vPerfilHorasTrabalho.abrePerfilHorasTrabalho;

  if not obSenha._abreFormSenhasAlteracaoEmLote then
  	exit;

  obSenha.dataSet.Refresh;
end;

procedure TfrmCadSenha.SpeedButtonAlterarSenhaClick(Sender: TObject);
begin
  inherited;
	TelaCadastro := 5;
  SpeedButton1Click(Sender);
end;

procedure TfrmCadSenha.tvDBDblClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if not Assigned(tvDB.Selected) then
    Exit;

  if not Assigned(tvDB.Selected.Parent) then
    Exit;

  if Assigned(FConsultasOLAP) then
    FConsultasOLAP.Inserir(tvDB.Selected.Parent.Index, tvDB.Selected.Index);

  for I := 0 to tvUS.Items.Count - 1 do
    if tvUS.Items[I].Text = tvDB.Selected.Text then
      tvUS.Items[I].Selected := True;
end;

procedure TfrmCadSenha.tvUSDblClick(Sender: TObject);
var
  AIndexParent, AIndexChild: Integer;
  I, J: Integer;
  ATitulo: string;
begin
  inherited;
  if not Assigned(tvUS.Selected) then
    Exit;

  if not Assigned(tvUS.Selected.Parent) then
    Exit;

  AIndexParent := tvUS.Selected.Parent.Index;
  AIndexChild  := tvUS.Selected.Index;
  ATitulo      := tvUS.Selected.Parent.Text;

  if Assigned(FConsultasOLAP) then
    FConsultasOLAP.Delete(tvUS.Selected.Parent.Index, tvUS.Selected.Index);

  for I := 0 to tvUS.Items.Count - 1 do
    if tvUS.Items[I].Text = ATitulo then
      tvUS.Items[I].getFirstChild.Selected := True;
end;

end.

