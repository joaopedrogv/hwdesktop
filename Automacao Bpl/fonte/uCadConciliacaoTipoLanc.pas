unit uCadConciliacaoTipoLanc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, uEditHw;

type
  TfrmCadConciliacaoTipoLanc = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    tsAlterDadosTipoLanc: TTabSheet;
    Panel52: TPanel;
    btVoltarDadosTipoLanc: TBitBtn;
    GroupBox79: TGroupBox;
    DBText57: TDBText;
    DBText58: TDBText;
    Label450: TLabel;
    Label10: TLabel;
    Panel128: TPanel;
    pnCenterAlterDadosTipoLanc: TPanel;
    SpeedButtonAlterarCodAjuste: TSpeedButton;
    SpeedButtonAlterarCodAjuste2: TSpeedButton;
    btExcluirRegistro: TSpeedButton;
    ckPermOpcaoMarcadas: TCheckBox;
    tsAlterDadosLote: TTabSheet;
    pnAlteracaoEmLote: TPanel;
    GroupBoxAlteracaoEmLote: TGroupBox;
    pnNumContaE: TPanel;
    lbNumContaE: TLabel;
    EdNumContaE: TEditHw;
    DBLNumContaE: TDBLookupComboBox;
    ckNumContaE: TCheckBox;
    pnNumContaS: TPanel;
    lbNumContaS: TLabel;
    EdNumContaS: TEditHw;
    DBLNumContaS: TDBLookupComboBox;
    ckNumContaS: TCheckBox;
    Panel7: TPanel;
    btnOKAlteracaoEmLote: TBitBtn;
    btnCancelarAlteracaoEmLote: TBitBtn;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    DBMemo1: TDBMemo;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnCancelarAlteracaoEmLoteClick(Sender: TObject);
    procedure btnOKAlteracaoEmLoteClick(Sender: TObject);
    procedure DBLNumContaSExit(Sender: TObject);
    procedure DBLNumContaEExit(Sender: TObject);
    procedure EdNumContaSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumContaSExit(Sender: TObject);
    procedure EdNumContaEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumContaEExit(Sender: TObject);
    procedure ckNumContaSClick(Sender: TObject);
    procedure ckNumContaEClick(Sender: TObject);
    procedure SpeedButtonAlterarCodAjuste2Click(Sender: TObject);
    procedure btExcluirRegistroClick(Sender: TObject);
    procedure SpeedButtonAlterarCodAjusteClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btVoltarDadosTipoLancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConciliacaoTipoLanc: TfrmCadConciliacaoTipoLanc;

implementation

uses
  uDtmAtivo, UClassesCadastrosBasicos, UDtmCadastrosBasicos, uDadosIni;

{$R *.dfm}

procedure TfrmCadConciliacaoTipoLanc.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS453', 'CONSULTA', '', 'CONCILIACAO_TIPO_LANC', '',
    ConciliacaoTipoLanc.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not ConciliacaoTipoLanc.ConsultaCampos('CONCILIACAO_TIPO_LANC', ComboBox1.Text,
      'CONCILIACAO_TIPO_LANC.ID', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      'CONCILIACAO_TIPO_LANC.*, P_CONTAS_E.DESC_PLC AS DESC_PLC_E, P_CONTAS_S.DESC_PLC AS DESC_PLC_S ',
      'LEFT JOIN P_CONTAS P_CONTAS_E ON P_CONTAS_E.N_CONTA_PLC = CONCILIACAO_TIPO_LANC.N_CONTA_PLC_E ' +
      'LEFT JOIN P_CONTAS P_CONTAS_S ON P_CONTAS_S.N_CONTA_PLC = CONCILIACAO_TIPO_LANC.N_CONTA_PLC_S ',
      '') then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not ConciliacaoTipoLanc.ConsultaCampos('CONCILIACAO_TIPO_LANC', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, 'CONCILIACAO_TIPO_LANC.ID', true, vDadosIni.codEmpresa,
    'CONCILIACAO_TIPO_LANC.*, P_CONTAS_E.DESC_PLC AS DESC_PLC_E, P_CONTAS_S.DESC_PLC AS DESC_PLC_S ',
    'LEFT JOIN P_CONTAS P_CONTAS_E ON P_CONTAS_E.N_CONTA_PLC = CONCILIACAO_TIPO_LANC.N_CONTA_PLC_E ' +
    'LEFT JOIN P_CONTAS P_CONTAS_S ON P_CONTAS_S.N_CONTA_PLC = CONCILIACAO_TIPO_LANC.N_CONTA_PLC_S ',
    '') then
    	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton25.Visible := false;
  SpeedButton3.Visible := false;
  SpeedButton4.Visible := false;
  SpeedButton5.Visible := false;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadConciliacaoTipoLanc.BitBtn3Click(Sender: TObject);
begin
  try
    if not ConciliacaoTipoLanc.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
      DBMemo1.SetFocus
  	else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      ConciliacaoTipoLanc.Cancel;
      ConciliacaoTipoLanc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not ConciliacaoTipoLanc.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(ConciliacaoTipoLanc.vNomeCampoErro, ConciliacaoTipoLanc.vMensagemErro);
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
      if ConciliacaoTipoLanc.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.BitBtn5Click(Sender: TObject);
begin
  inherited;
	ConciliacaoTipoLanc.Cancel;
  ConciliacaoTipoLanc.RollBackTransacao;
end;

procedure TfrmCadConciliacaoTipoLanc.btExcluirRegistroClick(Sender: TObject);
begin
  try
    ConciliacaoTipoLanc.Delete;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ConciliacaoTipoLanc.Cancel;
      ConciliacaoTipoLanc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.btnCancelarAlteracaoEmLoteClick(
  Sender: TObject);
begin
  TForm(pnAlteracaoEmLote.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadConciliacaoTipoLanc.btnOKAlteracaoEmLoteClick(Sender: TObject);
begin
  try
  	if (Self.Enabled) and (Self.Visible) and (btnOKAlteracaoEmLote.CanFocus) then
      btnOKAlteracaoEmLote.SetFocus;
    ConciliacaoTipoLanc.vNUM_CONTA_E := EdNumContaE.AsInteger;
    ConciliacaoTipoLanc.vNUM_CONTA_S := EdNumContaS.AsInteger;

    ConciliacaoTipoLanc.vHAB_NUM_CONTA_E := ckNumContaE.Checked;
    ConciliacaoTipoLanc.vHAB_NUM_CONTA_S := ckNumContaS.Checked;
    if not ConciliacaoTipoLanc.atualizarTipoLancEmLote then
    begin
    	setFocusCampoErro(ConciliacaoTipoLanc.vNomeCampoErro, ConciliacaoTipoLanc.vMensagemErro);
    	exit;
    end;

		TForm(pnAlteracaoEmLote.Parent).ModalResult := IDOK;
  finally
    _GravaConfiguracoesDouble(EdNumContaE.Name, EdNumContaE.AsValue);
    _GravaConfiguracoesDouble(EdNumContaS.Name, EdNumContaS.AsValue);

    _GravaConfiguracoesBoolean(ckNumContaE.Name, ckNumContaE.Checked);
    _GravaConfiguracoesBoolean(ckNumContaS.Name, ckNumContaS.Checked);
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ConciliacaoTipoLanc._marcarTodos(ConciliacaoTipoLanc.dataSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    ConciliacaoTipoLanc._desmarcarTodos(ConciliacaoTipoLanc.dataSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.btVoltarDadosTipoLancClick(
  Sender: TObject);
begin
  inherited;
	frmCadConciliacaoTipoLanc.Caption := 'Tipo de Lançamento (Conciliação Cartão)';

	Panel2.Visible := true;
	GroupBox3.Parent := TabSheet2;

	btVoltarDadosTipoLanc.Parent := Panel52;
  BitBtn2.Visible := True;
  BitBtn3.Visible := True;
  Panel1.Parent := TabSheet2;
  TelaCadastro := 0;

	PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadConciliacaoTipoLanc.ckNumContaEClick(Sender: TObject);
begin
  inherited;
	EdNumContaE.Enabled := ckNumContaE.Checked;
  DBLNumContaE.Enabled := ckNumContaE.Checked;
  if ckNumContaE.Checked then
  begin
  	pnNumContaE.ParentBackground := False;
		pnNumContaE.Color := clYellow;
  end
  else
  begin
  	pnNumContaE.ParentBackground := True;
  	pnNumContaE.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdNumContaE.CanFocus) then
  	EdNumContaE.SetFocus;
end;

procedure TfrmCadConciliacaoTipoLanc.ckNumContaSClick(Sender: TObject);
begin
  inherited;
	EdNumContaS.Enabled := ckNumContaS.Checked;
  DBLNumContaS.Enabled := ckNumContaS.Checked;
  if ckNumContaS.Checked then
  begin
  	pnNumContaS.ParentBackground := False;
		pnNumContaS.Color := clYellow;
  end
  else
  begin
  	pnNumContaS.ParentBackground := True;
  	pnNumContaS.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdNumContaS.CanFocus) then
  	EdNumContaS.SetFocus;
end;

procedure TfrmCadConciliacaoTipoLanc.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	ConciliacaoTipoLanc._marcaDesmarcaLinha(ConciliacaoTipoLanc.dataSet);
end;

procedure TfrmCadConciliacaoTipoLanc.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.dataSet.FieldByName('Sel').AsString = 'S' then
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
      Column.Field.DisplayWidth := 1;

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

procedure TfrmCadConciliacaoTipoLanc.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_F2) or (key = VK_SPACE) then
    ConciliacaoTipoLanc._marcaDesmarcaLinha(ConciliacaoTipoLanc.dataSet)
  else if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadConciliacaoTipoLanc.DBLNumContaEExit(Sender: TObject);
begin
  inherited;
	if DBLNumContaE.KeyValue = null then
  	EdNumContaE.AsValue := 0
  else
	  EdNumContaE.AsValue := DBLNumContaE.KeyValue;
end;

procedure TfrmCadConciliacaoTipoLanc.DBLNumContaSExit(Sender: TObject);
begin
  inherited;
	if DBLNumContaS.KeyValue = null then
  	EdNumContaS.AsValue := 0
  else
	  EdNumContaS.AsValue := DBLNumContaS.KeyValue;
end;

procedure TfrmCadConciliacaoTipoLanc.EdNumContaEExit(Sender: TObject);
begin
  inherited;
	if (ActiveControl = btnCancelarAlteracaoEmLote) then
    Exit;

  DBLNumContaE.KeyValue := EdNumContaE.AsInteger;

  if EdNumContaE.AsInteger <= 0 then
  	exit;

  if not ConciliacaoTipoLanc.ConciliacaoTipoLancPContasE.buscarNumConta(EdNumContaE.AsValue) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdNumContaE.CanFocus) then
    	EdNumContaE.SetFocus;
    exit;
  end;
  if not ConciliacaoTipoLanc.ConciliacaoTipoLancPContasE.buscarNumContaNatureza(EdNumContaE.AsValue) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não é de natureza entrada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdNumContaE.CanFocus) then
    	EdNumContaE.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.EdNumContaEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
  	vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('P_CONTAS', ' AND P_CONTAS.TIPO_PLC = ''E'' ', 'Consulta do Plano de Contas');
    if trim(vDadosIni.vPesquisa) <> '' then
      EdNumContaE.AsValue := StrToFloat(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.EdNumContaSExit(Sender: TObject);
begin
  inherited;
	if (ActiveControl = btnCancelarAlteracaoEmLote) then
    Exit;

  DBLNumContaS.KeyValue := EdNumContaS.AsInteger;

  if EdNumContaS.AsInteger <= 0 then
  	exit;

  if not ConciliacaoTipoLanc.ConciliacaoTipoLancPContasS.buscarNumConta(EdNumContaS.AsValue) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdNumContaS.CanFocus) then
    	EdNumContaS.SetFocus;
    exit;
  end;
  if not ConciliacaoTipoLanc.ConciliacaoTipoLancPContasS.buscarNumConta(EdNumContaS.AsValue) then
  begin
    Application.MessageBox('Nº da Conta (Saída) não é de natureza saída', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdNumContaS.CanFocus) then
    	EdNumContaS.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.EdNumContaSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
  	vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('P_CONTAS', ' AND P_CONTAS.TIPO_PLC = ''S'' ', 'Consulta do Plano de Contas');
    if trim(vDadosIni.vPesquisa) <> '' then
      EdNumContaS.AsValue := StrToFloat(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

	if (ConciliacaoTipoLanc <> nil) then
    ConciliacaoTipoLanc.Cancel;

  ConciliacaoTipoLanc.free;
  ConciliacaoTipoLanc := nil;

  Action := caFree;
  if (frmCadConciliacaoTipoLanc <> nil) then
    frmCadConciliacaoTipoLanc := nil;
end;

procedure TfrmCadConciliacaoTipoLanc.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ConciliacaoTipoLanc := TConciliacaoTipoLanc.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  tsCadastro.TabVisible := False;
  tsAlterDadosTipoLanc.TabVisible := False;
  tsAlterDadosLote.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadConciliacaoTipoLanc.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsConciliacaoTiposLancamentos;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Remover nº da conta (E / S) - [BAS527]';
  end;

  if TelaCadastro = 1 then
  	TelaCadastro := 0;

  SpeedButton1.Visible := true;
  SpeedButton25.Visible := false;
  SpeedButton3.Visible := false;
  SpeedButton4.Visible := false;
  SpeedButton5.Visible := false;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadConciliacaoTipoLanc.SpeedButton1Click(Sender: TObject);
begin
  try
    if ConciliacaoTipoLanc.dataSet.IsEmpty then
      Exit;
    if not ConciliacaoTipoLanc.Edit then
      Exit;
    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
      DBMemo1.SetFocus
  	else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      ConciliacaoTipoLanc.Cancel;
      ConciliacaoTipoLanc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.SpeedButton2Click(Sender: TObject);
begin
  try
    ConciliacaoTipoLanc.Delete;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ConciliacaoTipoLanc.Cancel;
      ConciliacaoTipoLanc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConciliacaoTipoLanc.SpeedButton6Click(Sender: TObject);
begin
  frmCadConciliacaoTipoLanc.Caption := 'Alteração Tipo de Lançamento em Lote';

  Panel52.Height := GroupBox3.Height;


  BitBtn2.Visible := False;
  BitBtn3.Visible := False;
  btVoltarDadosTipoLanc.Parent := GroupBox3;

  Panel1.Visible := true;
  Panel1.Parent := Panel128;
  Panel2.Visible := False;

  GroupBox3.Parent := Panel52;

  _LerConfiguracoesRegistroBoolean(ckPermOpcaoMarcadas.Name, False);

	PageControl1.ActivePage := tsAlterDadosTipoLanc;
end;

procedure TfrmCadConciliacaoTipoLanc.SpeedButtonAlterarCodAjuste2Click(
  Sender: TObject);
var
	vNumContaE: Integer;
  vNumContaS: Integer;
  vIndexFieldNames: string;
  vIndexName: string;
  vRecNo: Integer;
begin
  inherited;
	if not vDadosIni.PesqPros('BAS529', 'ABRIR', '', 'CONCILIACAO_TIPO_LANC', '', ConciliacaoTipoLanc.buscas, true) then
  	exit;


  vNumContaE := Trunc(_LerConfiguracoesRegistroDouble(EdNumContaE.Name));
	EdNumContaE.AsValue := vNumContaE;
  DBLNumContaE.KeyValue := vNumContaE;

  vNumContaS := Trunc(_LerConfiguracoesRegistroDouble(EdNumContaS.Name));
  EdNumContaS.AsValue := vNumContaS;
  DBLNumContaS.KeyValue := vNumContaS;

  if ckPermOpcaoMarcadas.Checked then
	  ckNumContaE.Checked := _LerConfiguracoesRegistroBoolean(ckNumContaE.Name)
  else
  	ckNumContaE.Checked := false;
  ckNumContaEClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	  ckNumContaS.Checked := _LerConfiguracoesRegistroBoolean(ckNumContaS.Name)
  else
  	ckNumContaS.Checked := false;
  ckNumContaSClick(Sender);


  try
  	vIndexFieldNames := ConciliacaoTipoLanc.dataSet.IndexFieldNames;
    vIndexName       := ConciliacaoTipoLanc.dataSet.IndexName;
    vRecNo           := ConciliacaoTipoLanc.dataSet.RecNo;

    ConciliacaoTipoLanc.dataSet.DisableControls;
    ConciliacaoTipoLanc.dataSet.Filtered := false;
    ConciliacaoTipoLanc.dataSet.Filter := 'sel = ''S'' ';
    ConciliacaoTipoLanc.dataSet.Filtered := true;

    if ConciliacaoTipoLanc.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum código de ajuste selecionado.', 'Atenção',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      ConciliacaoTipoLanc.dataSet.Refresh;
      exit;
    end;
  finally
  	ConciliacaoTipoLanc.dataSet.Filtered          := false;
    ConciliacaoTipoLanc.dataSet.IndexName         := vIndexName;
    if (trim(vIndexName) = '') and (trim(vIndexFieldNames) = '') then
    	ConciliacaoTipoLanc.dataSet.IndexFieldNames := 'ID'
    else
	    ConciliacaoTipoLanc.dataSet.IndexFieldNames := vIndexFieldNames;
    if ConciliacaoTipoLanc.dataSet.RecordCount >= vRecNo then
	    ConciliacaoTipoLanc.dataSet.RecNo           := vRecNo;
    ConciliacaoTipoLanc.dataSet.EnableControls;
  end;

  ConciliacaoTipoLanc.ConciliacaoTipoLancPContasE.abreConciliacaoTipoLancPContasE;
  ConciliacaoTipoLanc.ConciliacaoTipoLancPContasS.abreConciliacaoTipoLancPContasS;
  if not ConciliacaoTipoLanc._abreFormTipoLancEmLote then
  	exit;

  ConciliacaoTipoLanc.dataSet.Refresh;
end;

procedure TfrmCadConciliacaoTipoLanc.SpeedButtonAlterarCodAjusteClick(
  Sender: TObject);
begin
  inherited;
	TelaCadastro := 5;
  SpeedButton1Click(Sender);
end;

end.
