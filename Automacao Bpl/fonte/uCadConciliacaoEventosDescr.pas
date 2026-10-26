unit uCadConciliacaoEventosDescr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, uEditHw;

type
  TfrmCadConciliacaoEventosDescr = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    DBEdit4: TDBEdit;
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
    tsAlterDadosCodAjuste: TTabSheet;
    Panel52: TPanel;
    btVoltarDadosCodAjuste: TBitBtn;
    GroupBox79: TGroupBox;
    DBText57: TDBText;
    DBText58: TDBText;
    Label450: TLabel;
    Label10: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Panel128: TPanel;
    pnCenterAlterDadosCodAjuste: TPanel;
    SpeedButtonAlterarCodAjuste: TSpeedButton;
    SpeedButtonAlterarCodAjuste2: TSpeedButton;
    btExcluirRegistro: TSpeedButton;
    ckPermOpcaoMarcadas: TCheckBox;
    DBMemo1: TDBMemo;
    procedure btnCancelarAlteracaoEmLoteClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btVoltarDadosCodAjusteClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure btnOKAlteracaoEmLoteClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBLNumContaSExit(Sender: TObject);
    procedure DBLNumContaEExit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumContaSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumContaEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumContaSExit(Sender: TObject);
    procedure EdNumContaEExit(Sender: TObject);
    procedure ckNumContaSClick(Sender: TObject);
    procedure ckNumContaEClick(Sender: TObject);
    procedure SpeedButtonAlterarCodAjuste2Click(Sender: TObject);
    procedure SpeedButtonAlterarCodAjusteClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConciliacaoEventosDescr: TfrmCadConciliacaoEventosDescr;

implementation

uses
  uDtmAtivo, UClassesCadastrosBasicos, UDtmCadastrosBasicos, uDadosIni;

{$R *.dfm}

procedure TfrmCadConciliacaoEventosDescr.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS453', 'CONSULTA', '', 'CONCILIACAO_COD_AJUSTE', '',
    ConciliacaoCodAjuste.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not ConciliacaoCodAjuste.ConsultaCampos('CONCILIACAO_COD_AJUSTE', ComboBox1.Text,
      'CONCILIACAO_COD_AJUSTE.ID', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      'CONCILIACAO_COD_AJUSTE.*, P_CONTAS_E.DESC_PLC AS DESC_PLC_E, P_CONTAS_S.DESC_PLC AS DESC_PLC_S ',
      'LEFT JOIN P_CONTAS P_CONTAS_E ON P_CONTAS_E.N_CONTA_PLC = CONCILIACAO_COD_AJUSTE.N_CONTA_PLC_E ' +
      'LEFT JOIN P_CONTAS P_CONTAS_S ON P_CONTAS_S.N_CONTA_PLC = CONCILIACAO_COD_AJUSTE.N_CONTA_PLC_S ',
      '') then
        if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not ConciliacaoCodAjuste.ConsultaCampos('CONCILIACAO_COD_AJUSTE', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, 'CONCILIACAO_COD_AJUSTE.ID', true, vDadosIni.codEmpresa,
    'CONCILIACAO_COD_AJUSTE.*, P_CONTAS_E.DESC_PLC AS DESC_PLC_E, P_CONTAS_S.DESC_PLC AS DESC_PLC_S ',
    'LEFT JOIN P_CONTAS P_CONTAS_E ON P_CONTAS_E.N_CONTA_PLC = CONCILIACAO_COD_AJUSTE.N_CONTA_PLC_E ' +
    'LEFT JOIN P_CONTAS P_CONTAS_S ON P_CONTAS_S.N_CONTA_PLC = CONCILIACAO_COD_AJUSTE.N_CONTA_PLC_S ',
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

procedure TfrmCadConciliacaoEventosDescr.BitBtn3Click(Sender: TObject);
begin
  try
    if not ConciliacaoCodAjuste.Insert then
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
      ConciliacaoCodAjuste.Cancel;
      ConciliacaoCodAjuste.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
		BitBtn4.SetFocus;
  if not ConciliacaoCodAjuste.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(ConciliacaoCodAjuste.vNomeCampoErro, ConciliacaoCodAjuste.vMensagemErro);
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
      if ConciliacaoCodAjuste.Insert then
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

procedure TfrmCadConciliacaoEventosDescr.BitBtn5Click(Sender: TObject);
begin
  inherited;
	ConciliacaoCodAjuste.Cancel;
  ConciliacaoCodAjuste.RollBackTransacao;
end;

procedure TfrmCadConciliacaoEventosDescr.btnCancelarAlteracaoEmLoteClick(
  Sender: TObject);
begin
  TForm(pnAlteracaoEmLote.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadConciliacaoEventosDescr.btnOKAlteracaoEmLoteClick(
  Sender: TObject);
begin
  try
  	if (Self.Enabled) and (Self.Visible) and (btnOKAlteracaoEmLote.CanFocus) then
      btnOKAlteracaoEmLote.SetFocus;
    ConciliacaoCodAjuste.vNUM_CONTA_E := EdNumContaE.AsInteger;
    ConciliacaoCodAjuste.vNUM_CONTA_S := EdNumContaS.AsInteger;

    ConciliacaoCodAjuste.vHAB_NUM_CONTA_E := ckNumContaE.Checked;
    ConciliacaoCodAjuste.vHAB_NUM_CONTA_S := ckNumContaS.Checked;
    if not ConciliacaoCodAjuste.atualizarCodAjusteEmLote then
    begin
    	setFocusCampoErro(ConciliacaoCodAjuste.vNomeCampoErro, ConciliacaoCodAjuste.vMensagemErro);
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

procedure TfrmCadConciliacaoEventosDescr.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    ConciliacaoCodAjuste._marcarTodos(ConciliacaoCodAjuste.dataSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    ConciliacaoCodAjuste._desmarcarTodos(ConciliacaoCodAjuste.dataSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.btVoltarDadosCodAjusteClick(
  Sender: TObject);
begin
  frmCadConciliacaoEventosDescr.Caption := 'Códigos de Ajuste (Conciliação Cartão)';

	Panel2.Visible := true;
	GroupBox3.Parent := TabSheet2;

	btVoltarDadosCodAjuste.Parent := Panel52;
  BitBtn2.Visible := True;
  BitBtn3.Visible := True;
  Panel1.Parent := TabSheet2;
  TelaCadastro := 0;
  
	PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadConciliacaoEventosDescr.ckNumContaEClick(Sender: TObject);
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

procedure TfrmCadConciliacaoEventosDescr.ckNumContaSClick(Sender: TObject);
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

procedure TfrmCadConciliacaoEventosDescr.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
//  if (ConciliacaoCodAjuste.dataSet.FieldByName('NATUREZA').AsString = 'E')
//  	or (ConciliacaoCodAjuste.dataSet.FieldByName('NATUREZA').AsString = 'S') then
//    ConciliacaoCodAjuste.ConciliacaoCodAjustePContasE.abreConciliacaoDescrTipoLancamentos(
//      ConciliacaoCodAjuste.dataSet.FieldByName('NATUREZA').AsString);
end;

procedure TfrmCadConciliacaoEventosDescr.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) then
  	Exit;

  if DBEdit2.Field.AsFloat <= 0 then
    Exit;
    
	if not ConciliacaoCodAjuste.ConciliacaoCodAjustePContasE.buscarNumConta(DBEdit2.Field.AsFloat) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
    exit;
  end;
  if not ConciliacaoCodAjuste.ConciliacaoCodAjustePContasE.buscarNumContaNatureza(DBEdit2.Field.AsFloat) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não é de natureza entrada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.DBEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
  	vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('P_CONTAS', ' AND P_CONTAS.TIPO_PLC = ''E'' ', 'Consulta do Plano de Contas');
    if trim(vDadosIni.vPesquisa) <> '' then
      DBEdit2.Field.AsFloat := StrToFloat(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) then
  	Exit;

  if DBEdit3.Field.AsFloat <= 0 then
    Exit;

	if not ConciliacaoCodAjuste.ConciliacaoCodAjustePContasS.buscarNumConta(DBEdit3.Field.AsFloat) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;
    exit;
  end;
  if not ConciliacaoCodAjuste.ConciliacaoCodAjustePContasS.buscarNumContaNatureza(DBEdit3.Field.AsFloat) then
  begin
    Application.MessageBox('Nº da Conta (Saída) não é de natureza saída', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.DBEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
  	vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('P_CONTAS', ' AND P_CONTAS.TIPO_PLC = ''S'' ', 'Consulta do Plano de Contas');
    if trim(vDadosIni.vPesquisa) <> '' then
      DBEdit3.Field.AsFloat := StrToFloat(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
  	ConciliacaoCodAjuste._marcaDesmarcaLinha(ConciliacaoCodAjuste.dataSet);
end;

procedure TfrmCadConciliacaoEventosDescr.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCadConciliacaoEventosDescr.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_F2) or (key = VK_SPACE) then
    ConciliacaoCodAjuste._marcaDesmarcaLinha(ConciliacaoCodAjuste.dataSet)
  else if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadConciliacaoEventosDescr.DBLNumContaEExit(Sender: TObject);
begin
  inherited;
	if DBLNumContaE.KeyValue = null then
  	EdNumContaE.AsValue := 0
  else
	  EdNumContaE.AsValue := DBLNumContaE.KeyValue;
end;

procedure TfrmCadConciliacaoEventosDescr.DBLNumContaSExit(Sender: TObject);
begin
  inherited;
  if DBLNumContaS.KeyValue = null then
  	EdNumContaS.AsValue := 0
  else
	  EdNumContaS.AsValue := DBLNumContaS.KeyValue;
end;

procedure TfrmCadConciliacaoEventosDescr.EdNumContaEExit(Sender: TObject);
begin
  inherited;
	if (ActiveControl = btnCancelarAlteracaoEmLote) then
    Exit;

  DBLNumContaE.KeyValue := EdNumContaE.AsInteger;

  if EdNumContaE.AsInteger <= 0 then
  	exit;

  if not ConciliacaoCodAjuste.ConciliacaoCodAjustePContasE.buscarNumConta(EdNumContaE.AsValue) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdNumContaE.CanFocus) then
    	EdNumContaE.SetFocus;
    exit;
  end;
  if not ConciliacaoCodAjuste.ConciliacaoCodAjustePContasE.buscarNumContaNatureza(EdNumContaE.AsValue) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não é de natureza entrada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdNumContaE.CanFocus) then
    	EdNumContaE.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.EdNumContaEKeyDown(Sender: TObject;
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

procedure TfrmCadConciliacaoEventosDescr.EdNumContaSExit(Sender: TObject);
begin
  inherited;
	if (ActiveControl = btnCancelarAlteracaoEmLote) then
    Exit;

  DBLNumContaS.KeyValue := EdNumContaS.AsInteger;

  if EdNumContaS.AsInteger <= 0 then
  	exit;

  if not ConciliacaoCodAjuste.ConciliacaoCodAjustePContasS.buscarNumConta(EdNumContaS.AsValue) then
  begin
    Application.MessageBox('Nº da Conta (Entrada) não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdNumContaS.CanFocus) then
    	EdNumContaS.SetFocus;
    exit;
  end;
  if not ConciliacaoCodAjuste.ConciliacaoCodAjustePContasS.buscarNumConta(EdNumContaS.AsValue) then
  begin
    Application.MessageBox('Nº da Conta (Saída) não é de natureza saída', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdNumContaS.CanFocus) then
    	EdNumContaS.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.EdNumContaSKeyDown(Sender: TObject;
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

procedure TfrmCadConciliacaoEventosDescr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	inherited;
  
  if (ConciliacaoCodAjuste <> nil) then
    ConciliacaoCodAjuste.Cancel;

  ConciliacaoCodAjuste.free;
  ConciliacaoCodAjuste := nil;

  Action := caFree;
  if (frmCadConciliacaoEventosDescr <> nil) then
    frmCadConciliacaoEventosDescr := nil;

end;

procedure TfrmCadConciliacaoEventosDescr.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ConciliacaoCodAjuste := TConciliacaoCodAjuste.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  tsCadastro.TabVisible := False;
  tsAlterDadosCodAjuste.TabVisible := False;
  tsAlterDadosLote.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadConciliacaoEventosDescr.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsConciliacaoCodAjuste;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Remover nº da conta (E / S) - [BAS455]';
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

procedure TfrmCadConciliacaoEventosDescr.SpeedButton1Click(Sender: TObject);
begin
  try
    if ConciliacaoCodAjuste.dataSet.IsEmpty then
      Exit;
    if not ConciliacaoCodAjuste.Edit then
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
      ConciliacaoCodAjuste.Cancel;
      ConciliacaoCodAjuste.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.SpeedButton2Click(Sender: TObject);
begin
  try
    ConciliacaoCodAjuste.Delete;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ConciliacaoCodAjuste.Cancel;
      ConciliacaoCodAjuste.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConciliacaoEventosDescr.SpeedButton6Click(Sender: TObject);
begin
  frmCadConciliacaoEventosDescr.Caption := 'Alteração Códigos de Ajuste em Lote';

  Panel52.Height := GroupBox3.Height;
 

  BitBtn2.Visible := False;
  BitBtn3.Visible := False;
  btVoltarDadosCodAjuste.Parent := GroupBox3;

  Panel1.Visible := true;
  Panel1.Parent := Panel128;
  Panel2.Visible := False;

  GroupBox3.Parent := Panel52;

  _LerConfiguracoesRegistroBoolean(ckPermOpcaoMarcadas.Name, False);

	PageControl1.ActivePage := tsAlterDadosCodAjuste;
end;

procedure TfrmCadConciliacaoEventosDescr.SpeedButtonAlterarCodAjuste2Click(
  Sender: TObject);
var
	vNumContaE: Integer;
  vNumContaS: Integer;
  vIndexFieldNames: string;
  vIndexName: string;
  vRecNo: Integer;
begin
  inherited;
	if not vDadosIni.PesqPros('BAS517', 'ABRIR', '', 'CONCILIACAO_COD_AJUSTE', '', ConciliacaoCodAjuste.buscas, true) then
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
  	vIndexFieldNames := ConciliacaoCodAjuste.dataSet.IndexFieldNames;
    vIndexName       := ConciliacaoCodAjuste.dataSet.IndexName;
    vRecNo           := ConciliacaoCodAjuste.dataSet.RecNo;

    ConciliacaoCodAjuste.dataSet.DisableControls;
    ConciliacaoCodAjuste.dataSet.Filtered := false;
    ConciliacaoCodAjuste.dataSet.Filter := 'sel = ''S'' ';
    ConciliacaoCodAjuste.dataSet.Filtered := true;

    if ConciliacaoCodAjuste.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum código de ajuste selecionado.', 'Atenção',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      ConciliacaoCodAjuste.dataSet.Refresh;
      exit;
    end;
  finally
  	ConciliacaoCodAjuste.dataSet.Filtered          := false;
    ConciliacaoCodAjuste.dataSet.IndexName         := vIndexName;
    if (trim(vIndexName) = '') and (trim(vIndexFieldNames) = '') then
    	ConciliacaoCodAjuste.dataSet.IndexFieldNames := 'ID'
    else
	    ConciliacaoCodAjuste.dataSet.IndexFieldNames := vIndexFieldNames;
    if ConciliacaoCodAjuste.dataSet.RecordCount >= vRecNo then
	    ConciliacaoCodAjuste.dataSet.RecNo           := vRecNo;
    ConciliacaoCodAjuste.dataSet.EnableControls;
  end;

  ConciliacaoCodAjuste.ConciliacaoCodAjustePContasE.abreConciliacaoCodAjustePContasE;
  ConciliacaoCodAjuste.ConciliacaoCodAjustePContasS.abreConciliacaoCodAjustePContasS;
  if not ConciliacaoCodAjuste._abreFormCodAjusteEmLote then
  	exit;

  ConciliacaoCodAjuste.dataSet.Refresh;
end;

procedure TfrmCadConciliacaoEventosDescr.SpeedButtonAlterarCodAjusteClick(
  Sender: TObject);
begin
  inherited;
	TelaCadastro := 5;
  SpeedButton1Click(Sender);
end;

end.
