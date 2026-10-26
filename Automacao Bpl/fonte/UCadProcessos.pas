unit UCadProcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, uClassesProcesso, DB, QRCtrls, grimgctrl, QuickRpt,
  AppEvnts;

type
  TfrmCadProcessos = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    tsRel: TTabSheet;
    tsEx: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Transportador: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    GroupBox4: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn10: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox68: TGroupBox;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    Label201: TLabel;
    Label202: TLabel;
    tsAlterDadosProc: TTabSheet;
    Panel52: TPanel;
    btVoltarDadosProd: TBitBtn;
    GroupBox79: TGroupBox;
    DBText56: TDBText;
    Label456: TLabel;
    DBText60: TDBText;
    btVoltarDadosProd2: TBitBtn;
    Label11: TLabel;
    DBText61: TDBText;
    pnCenterAlterDadosProd: TPanel;
    SpeedButtonAlterarProduto: TSpeedButton;
    SpeedButtonAlterarProduto2: TSpeedButton;
    btExcluirRegistro: TSpeedButton;
    btLixeiraVazia: TSpeedButton;
    btRestaurarRegistro: TSpeedButton;
    btLixeiraCheia: TSpeedButton;
    Panel128: TPanel;
    tsAlterDadosLote: TTabSheet;
    ScrollBoxAlterDadosLote: TScrollBox;
    GbAlterarProdLote: TGroupBox;
    Label473: TLabel;
    pnNivelProcesso: TPanel;
    lbNivelProcesso: TLabel;
    CheckBox23: TCheckBox;
    ckNivelProcesso: TCheckBox;
    pnSenhaGerente: TPanel;
    lbSenhaGerente: TLabel;
    ckSenhaGerente: TCheckBox;
    cbNivelProcesso: TComboBox;
    cbSenhaGerente: TComboBox;
    Panel119: TPanel;
    btSalvarProcLote: TBitBtn;
    btnCancProcLote: TBitBtn;
    btSairProcLote: TBitBtn;
    Selecionartodosprocessos1: TMenuItem;
    Desmarcatodosprocessos1: TMenuItem;
    pnFormularioProcesso: TPanel;
    lbFormularioProcesso: TLabel;
    EdFormularioProcesso: TEdit;
    ckFormularioProcesso: TCheckBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure cbNivelProcessoExit(Sender: TObject);
    procedure ckFormularioProcessoClick(Sender: TObject);
    procedure ckSenhaGerenteClick(Sender: TObject);
    procedure ckNivelProcessoClick(Sender: TObject);
    procedure Selecionartodosprocessos1Click(Sender: TObject);
    procedure Desmarcatodosprocessos1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton9Click(Sender: TObject);
    procedure btnCancProcLoteClick(Sender: TObject);
    procedure btSalvarProcLoteClick(Sender: TObject);
    procedure SpeedButtonAlterarProduto2Click(Sender: TObject);
    procedure btVoltarDadosProdClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure verificarBotaoLixeira;
  private
    { Private declarations }
  public
    { Public declarations }
    vCaptionLote: string;
  end;

var
  frmCadProcessos: TfrmCadProcessos;
  obProcesso: TProcesso;
implementation

uses UDtmConfig, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadProcessos.BitBtn10Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadProcessos.BitBtn1Click(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    
    SpeedButton2.Hint := 'Enviar para Lixeira -  [PRC005]';
    btExcluirRegistro.Hint := 'Enviar para Lixeira -  [PRC005]';

    if not vDadosIni.PesqPros('PRC001', 'PESQUISAR', '','TABELA_PROCESSOS','', obProcesso.buscas, true) then
      exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not obProcesso.ConsultaCampos('TABELA_PROCESSOS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if not obProcesso.ConsultaCampos('TABELA_PROCESSOS', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    SpeedButton6.Visible := true;
    SpeedButton8.Visible := true;
  
    SpeedButtonAlterarProduto.Visible := true;
    btRestaurarRegistro.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  finally
  	Screen.Cursor := crDefault;
    obProcesso.ultimasql := obProcesso.dataSet.CommandText;
  end;
end;

procedure TfrmCadProcessos.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRC002', 'INCLUIR', '','TABELA_PROCESSOS','', obProcesso.buscas, true) then
    exit;

  if not obProcesso.Insert then
    exit;

  ActiveControl := BitBtn3;
  inherited;

  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := True;
  TabSheet3.Caption := 'Cadastro de Processo';
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus;
end;

procedure TfrmCadProcessos.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not vDadosIni.PesqPros('PRC003', 'CONFIRMAR', '','TABELA_PROCESSOS',obProcesso.dataSet.FieldByName('COD_PROCESSO').AsString, obProcesso.buscas, true) then
    exit;
  if not obProcesso.Post then
  begin
     PageControl3.ActivePage := TabSheet3;
     setFocusCampoErro(obProcesso.vNomeCampoErro, obProcesso.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obProcesso.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      MudaCor;
    end
    else begin
      inherited;
      TabSheet3.TabVisible := false;
    end;
  end;
end;

procedure TfrmCadProcessos.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obProcesso.Cancel;
  TabSheet3.TabVisible := false;
end;

procedure TfrmCadProcessos.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRC010', 'INCLUIR', '','TABELA_PROCESSOS',
  obProcesso.dataSet.FieldByName('COD_PROCESSO').AsString+'-'+
  obProcesso.vUsuario.buscas.FieldByName('usuario').AsString, obProcesso.buscas, true) then
    exit;
  if obProcesso.incluirExecaoUsuario then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
    	DBGrid3.SetFocus;
end;

procedure TfrmCadProcessos.BitBtn8Click(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('PRC011', 'EXCLUIR', '','TABELA_PROCESSOS',
  obProcesso.dataSet.FieldByName('COD_PROCESSO').AsString+'-'+
  obProcesso.vExcecao.dataSet.FieldByName('usuario').AsString, obProcesso.buscas, true) then
    exit;
  if obProcesso.vExcecao.Delete then
  begin
    obProcesso.vUsuario.abreUsuario;
    if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
    	DBGrid2.SetFocus;
  end;
end;

procedure TfrmCadProcessos.btnCancProcLoteClick(Sender: TObject);
begin
  inherited;
	obProcesso.Cancel;
  obProcesso.CancelUpdates;
  obProcesso.RollBackTransacao;

  PageControl1.ActivePage := tsAlterDadosProc;
  tsAlterDadosProc.Show;
end;

procedure TfrmCadProcessos.btSalvarProcLoteClick(Sender: TObject);
begin
  inherited;
	try
  	obProcesso.vAtualizarProc.vHabNivelProcesso := ckNivelProcesso.Checked;
  	obProcesso.vAtualizarProc.vNivelProcesso    := trim(cbNivelProcesso.Text);
    obProcesso.vAtualizarProc.vHabSenhaGerente  := ckSenhaGerente.Checked;
    if cbSenhaGerente.ItemIndex = 0 then
    	obProcesso.vAtualizarProc.vSenhaGerente   := cbSenhaGerente.Items[cbSenhaGerente.ItemIndex]
    else if cbSenhaGerente.ItemIndex = 1 then
    	obProcesso.vAtualizarProc.vSenhaGerente   := cbSenhaGerente.Items[cbSenhaGerente.ItemIndex]
  	else
	    obProcesso.vAtualizarProc.vSenhaGerente   := trim(cbSenhaGerente.Text);
    obProcesso.vAtualizarProc.vHabFormulario    := ckFormularioProcesso.Checked;
    obProcesso.vAtualizarProc.vFormulario       := trim(EdFormularioProcesso.Text);

  	if not obProcesso.AtualizarProcessoEmLote then
    begin
      setFocusCampoErro(obProcesso.vNomeCampoErro, obProcesso.vMensagemErro);
      exit;
    end;

    PageControl1.ActivePage := tsAlterDadosProc;
	  tsAlterDadosProc.Show;
  finally
  	_GravaConfiguracoesBoolean(ckNivelProcesso.Name, ckNivelProcesso.Checked);
   	_GravaConfiguracoesString(cbNivelProcesso.Name, trim(cbNivelProcesso.Text));
    _GravaConfiguracoesBoolean(ckSenhaGerente.Name, ckSenhaGerente.Checked);
    _GravaConfiguracoesInteger(cbSenhaGerente.Name, cbSenhaGerente.ItemIndex);
    _GravaConfiguracoesBoolean(ckFormularioProcesso.Name, ckFormularioProcesso.Checked);
    _GravaConfiguracoesString(EdFormularioProcesso.Name, trim(EdFormularioProcesso.Text));
  end;
end;

procedure TfrmCadProcessos.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obProcesso._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadProcessos.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obProcesso._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadProcessos.btVoltarDadosProdClick(Sender: TObject);
begin
  inherited;
  frmCadProcessos.Caption := 'Cadastro de Processos';

  Panel2.Visible := true;

  GroupBox3.Parent := TabSheet2;

	btVoltarDadosProd.Parent := Panel52;
  Panel1.Parent := TabSheet2;

  BitBtn3.Visible := True;

  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadProcessos.cbNivelProcessoExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> btnCancProcLote) and (activecontrol <> btSairProcLote) then
	begin
    if trim(cbNivelProcesso.Text) <> '' then
    begin
      try
        StrToInt(cbNivelProcesso.Text);
      except
        Application.MessageBox(pchar('Nível do processo inválido, informe somente números'), 'Erro',
          MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (cbNivelProcesso.CanFocus) then
          cbNivelProcesso.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadProcessos.ckFormularioProcessoClick(Sender: TObject);
begin
  inherited;
  EdFormularioProcesso.Enabled := ckFormularioProcesso.Checked;
  if (Self.Enabled) and (Self.Visible) and (EdFormularioProcesso.CanFocus) then
  	EdFormularioProcesso.SetFocus;
end;

procedure TfrmCadProcessos.ckNivelProcessoClick(Sender: TObject);
begin
  inherited;
	cbNivelProcesso.Enabled := ckNivelProcesso.Checked;
  if (Self.Enabled) and (Self.Visible) and (cbNivelProcesso.CanFocus) then
  	cbNivelProcesso.SetFocus;
end;

procedure TfrmCadProcessos.ckSenhaGerenteClick(Sender: TObject);
begin
  inherited;
  cbSenhaGerente.Enabled := ckSenhaGerente.Checked;
  if (Self.Enabled) and (Self.Visible) and (cbSenhaGerente.CanFocus) then
  	cbSenhaGerente.SetFocus;
end;

procedure TfrmCadProcessos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    obProcesso._marcaDesmarcaLinha;
end;

procedure TfrmCadProcessos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
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

procedure TfrmCadProcessos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if (key = VK_SPACE) then
    obProcesso._marcaDesmarcaLinha;
end;

procedure TfrmCadProcessos.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    BitBtn8Click(Sender);
end;

procedure TfrmCadProcessos.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn7Click(Sender);
end;

procedure TfrmCadProcessos.Desmarcatodosprocessos1Click(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obProcesso._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadProcessos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (obProcesso <> nil) then
    obProcesso.Cancel;
  obProcesso.Free;

  Action := caFree;
  if (frmCadProcessos <> nil) then
  	frmCadProcessos := nil;
end;

procedure TfrmCadProcessos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
	vExibirPergFechar: Boolean;
begin
	try
  	vExibirPergFechar := Self.exibirPergFechar;
    if (PageControl1.ActivePage = tsAlterDadosProc) or (PageControl1.ActivePage = tsAlterDadosLote) or (Self.Caption = vCaptionLote) then
    begin
      Self.exibirPergFechar := False;
      btVoltarDadosProdClick(Sender);
    end;
    inherited;
  finally
    Self.exibirPergFechar := vExibirPergFechar;
  end;
end;

procedure TfrmCadProcessos.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  obProcesso := TProcesso.create;

  tsEx.TabVisible := false;
  tsRel.TabVisible := false;
  tsAlterDadosProc.TabVisible := false;
  tsAlterDadosLote.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadProcessos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn5Click(sender);

  if (key = VK_INSERT ) and (PageControl1.ActivePage = TabSheet2)then
    BitBtn3Click(sender);
end;

procedure TfrmCadProcessos.FormShow(Sender: TObject);
var
  I: Integer;
begin
	if not Self.Enabled then
    Exit;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsProcessos;
    inherited;
    verificarBotaoLixeira;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [PRC012]';
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
      TDBEdit(Components[I]).CharCase := ecUpperCase;
    if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;

  if obProcesso.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCadProcessos.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relação de Processos');
end;

procedure TfrmCadProcessos.Selecionartodosprocessos1Click(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obProcesso._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadProcessos.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRC004', 'EDITAR', '','TABELA_PROCESSOS',obProcesso.dataSet.FieldByName('COD_PROCESSO').AsString, obProcesso.buscas, true) then
    exit;

  if obProcesso.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  inherited;
  if not obProcesso.Edit then
    exit;

  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := True;
  TabSheet3.Caption := 'Alterando Processo';
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus;
end;

procedure TfrmCadProcessos.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRC007', 'ACESSAR', '','TABELA_PROCESSOS','', obProcesso.buscas, true) then
    exit;
  if not obProcesso.abrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [PRC012]';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    SpeedButton6.Visible := true;
    SpeedButton8.Visible := true;
    
    SpeedButtonAlterarProduto.Visible := true;
    btRestaurarRegistro.Visible := false;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [PRC012]';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
    SpeedButton6.Visible := false;
    SpeedButton8.Visible := false;

    SpeedButtonAlterarProduto.Visible := false;
    btRestaurarRegistro.Visible := true;
  end;
end;

procedure TfrmCadProcessos.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
  if not vDadosIni.PesqPros('PRC005', 'EXCLUIR', '','TABELA_PROCESSOS',obProcesso.dataSet.FieldByName('COD_PROCESSO').AsString, obProcesso.buscas, true) then
    exit;

  try
    obProcesso.Delete;
    vStatusLixeira := obProcesso.StatusLixeira;
    btLixeiraCheia.Visible := vStatusLixeira;
    lixeiraVazia(not vStatusLixeira);

    if not vStatusLixeira then
    begin  
    	SpeedButton6.Visible := true;
      
    	btLixeiraCheia.Visible := false;
    	btRestaurarRegistro.Visible := false;
    	SpeedButtonAlterarProduto.Visible := true;
    end
    else
    	btLixeiraCheia.Visible := true;
      
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obProcesso.Cancel;
      obProcesso.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadProcessos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRC006', 'IMPRIMIR', '','TABELA_PROCESSOS','', obProcesso.buscas, true) then
    exit;
  QuickRep1.Preview;
end;

procedure TfrmCadProcessos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRC008', 'RESTAURAR', '','TABELA_PROCESSOS',obProcesso.dataSet.FieldByName('COD_PROCESSO').AsString, obProcesso.buscas, true) then
    exit;
  if obProcesso.restaurarLixeira then
  begin
    if obProcesso.StatusLixeira then
    begin
      lixeiraVazia(false);

      btLixeiraCheia.Visible := true;
    end
    else 
    begin
      lixeiraVazia(true);

      SpeedButton6.Visible := true;
      
      btLixeiraCheia.Visible := false;
    	btRestaurarRegistro.Visible := false;
      SpeedButtonAlterarProduto.Visible := true;

      obProcesso.montaSelect(obProcesso.ultimasql);
    end;
  end;
end;

procedure TfrmCadProcessos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRC009', 'DEFINIR', '','TABELA_PROCESSOS',obProcesso.dataSet.FieldByName('COD_PROCESSO').AsString, obProcesso.buscas, true) then
    exit;
  if obProcesso.vUsuario.abreUsuario then
    if obProcesso.vExcecao.abreExcecao(obProcesso.dataSet.FieldByName('cod_processo').AsString) then
      PageControl1.ActivePage := tsEx;
end;

procedure TfrmCadProcessos.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  vCaptionLote := 'Alteração Processos em Lote';
  frmCadProcessos.Caption := vCaptionLote;

  GroupBox3.Parent := Panel52;
  btVoltarDadosProd.Parent := GroupBox3;

  Panel1.Visible := True;
  Panel1.Parent  := Panel128;
  Panel2.Visible := False;

  BitBtn3.Visible := False;

  PageControl1.ActivePage := tsAlterDadosProc;
  tsAlterDadosProc.Show;
end;

procedure TfrmCadProcessos.SpeedButton9Click(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obProcesso._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadProcessos.SpeedButtonAlterarProduto2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRC015', 'ALTERAR', '', 'TABELA_PROCESSOS', '', obProcesso.buscas, true) then
	 	Exit;

  ckNivelProcesso.Checked      := _LerConfiguracoesRegistroBoolean(ckNivelProcesso.Name);
 	cbNivelProcesso.Text         :=	_LerConfiguracoesRegistroString(cbNivelProcesso.Name);
  ckSenhaGerente.Checked       := _LerConfiguracoesRegistroBoolean(ckSenhaGerente.Name);
  cbSenhaGerente.ItemIndex     := _LerConfiguracoesRegistroInteger(cbSenhaGerente.Name);
  ckFormularioProcesso.Checked := _LerConfiguracoesRegistroBoolean(ckFormularioProcesso.Name);
  EdFormularioProcesso.Text    := _LerConfiguracoesRegistroString(EdFormularioProcesso.Name);

  ckNivelProcesso.Checked := _LerConfiguracoesRegistroBoolean(ckNivelProcesso.Name);
  ckNivelProcessoClick(Sender);
  ckSenhaGerente.Checked := _LerConfiguracoesRegistroBoolean(ckSenhaGerente.Name);
  ckSenhaGerenteClick(Sender);
  ckFormularioProcesso.Checked := _LerConfiguracoesRegistroBoolean(ckFormularioProcesso.Name);
  ckFormularioProcessoClick(Sender);


  PageControl1.ActivePage := tsAlterDadosLote;
  tsAlterDadosLote.Show;
end;

procedure TfrmCadProcessos.verificarBotaoLixeira;
begin
	if obProcesso.StatusLixeira then
  begin
    SpeedButton25.Visible := true;
    btLixeiraCheia.Visible := true;
  end
  else
  begin
    SpeedButton25.Visible := false;
    btLixeiraCheia.Visible := false;
  end;
end;

end.

