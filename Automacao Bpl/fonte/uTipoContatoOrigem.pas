unit uTipoContatoOrigem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClassesConfigWS, DBCtrls, CheckLst;

type
  TfrmTipoContatoOrigem = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    tsOrigemTipoContrato: TTabSheet;
    pnOrigemTipoContato: TPanel;
    ScrollBox5: TScrollBox;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    CheckListBoxTipoContrato: TCheckListBox;
    CheckListBoxOrigem: TCheckListBox;
    Panel5: TPanel;
    btnOrigemTipoContatoOK: TBitBtn;
    btnOrigemTipoContatoCancelar: TBitBtn;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure pnOrigemTipoContatoEnter(Sender: TObject);
    procedure btnOrigemTipoContatoCancelarClick(Sender: TObject);
    procedure btnOrigemTipoContatoOKClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoContatoOrigem: TfrmTipoContatoOrigem;
  MsgTipoContatoOrigem: TMsgTipoContatoOrigem;

implementation

uses
  UDtmConfig, uDtmAtivo, DB, uDataSet_OOP, hw_win_utils, ShellAPI, uDadosIni;

{$R *.dfm}

procedure TfrmTipoContatoOrigem.BitBtn1Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('CFG065', 'CONSULTA', '', 'MSG_TIPO_CONTATO_ORIGEM', '',
    MsgTipoContatoOrigem.buscas, true) then
    Exit;

  inherited;

  MsgTipoContatoOrigem.rCons.vCampo := ComboBox1.Text;
  MsgTipoContatoOrigem.rCons.vCondicao := ComboBox3.Text;
  MsgTipoContatoOrigem.rCons.vDataIni := trim(MaskEdit1.Text);
  MsgTipoContatoOrigem.rCons.vDataFim := trim(MaskEdit2.Text);
  MsgTipoContatoOrigem.rCons.vValor := trim(MaskEdit3.Text);
  MsgTipoContatoOrigem._defineSqlAdicional;

  if MaskEdit2.Visible then
  begin
    if not MsgTipoContatoOrigem.ConsultaCampos('MSG_TIPO_CONTATO_ORIGEM',
    	MsgTipoContatoOrigem.rCons.vCampo,
      'MSG_ORIGEM.DESCRICAO, TIPO_CONTATO.TIPO',
      MsgTipoContatoOrigem.rCons.vDataIni,
      MsgTipoContatoOrigem.rCons.vDataFim,
      vDadosIni.codEmpresa, 1,
      'MSG_TIPO_CONTATO_ORIGEM.*, MSG_ORIGEM.DESCRICAO, TIPO_CONTATO.TIPO ',
      'LEFT JOIN TIPO_CONTATO ON TIPO_CONTATO.ID = MSG_TIPO_CONTATO_ORIGEM.ID_TIPO_CONTATO AND TIPO_CONTATO.COD_EMPRESA = MSG_TIPO_CONTATO_ORIGEM.COD_EMPRESA ' +
      'LEFT JOIN MSG_ORIGEM ON MSG_ORIGEM.ID = MSG_TIPO_CONTATO_ORIGEM.ID_MSG_ORIGEM ',
      MsgTipoContatoOrigem.rCons.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not MsgTipoContatoOrigem.ConsultaCampos('MSG_TIPO_CONTATO_ORIGEM',
  	MsgTipoContatoOrigem.rCons.vValor,
    MsgTipoContatoOrigem.rCons.vCampo,
    MsgTipoContatoOrigem.rCons.vCondicao,
    'MSG_ORIGEM.DESCRICAO, TIPO_CONTATO.TIPO',
    true, vDadosIni.codEmpresa,
    'MSG_TIPO_CONTATO_ORIGEM.*, MSG_ORIGEM.DESCRICAO, TIPO_CONTATO.TIPO ',
    'LEFT JOIN TIPO_CONTATO ON TIPO_CONTATO.ID = MSG_TIPO_CONTATO_ORIGEM.ID_TIPO_CONTATO AND TIPO_CONTATO.COD_EMPRESA = MSG_TIPO_CONTATO_ORIGEM.COD_EMPRESA ' +
    'LEFT JOIN MSG_ORIGEM ON MSG_ORIGEM.ID = MSG_TIPO_CONTATO_ORIGEM.ID_MSG_ORIGEM ',
    MsgTipoContatoOrigem.rCons.vSqlAdicional) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmTipoContatoOrigem.btnOrigemTipoContatoCancelarClick(Sender: TObject);
begin
  inherited;
  TForm(pnOrigemTipoContato.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmTipoContatoOrigem.BitBtn3Click(Sender: TObject);
begin
  try
    if not MsgTipoContatoOrigem.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      DBLookupComboBox1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      MsgTipoContatoOrigem.Cancel;
      MsgTipoContatoOrigem.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoContatoOrigem.BitBtn4Click(Sender: TObject);
begin
  if not MsgTipoContatoOrigem.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(MsgTipoContatoOrigem.vNomeCampoErro, MsgTipoContatoOrigem.vMensagemErro);
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
      if MsgTipoContatoOrigem.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
        	DBLookupComboBox1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmTipoContatoOrigem.BitBtn5Click(Sender: TObject);
begin
  inherited;
	MsgTipoContatoOrigem.Cancel;
  MsgTipoContatoOrigem.RollBackTransacao;
end;

procedure TfrmTipoContatoOrigem.btnOrigemTipoContatoOKClick(Sender: TObject);
var
	I: Integer;
  vSel: boolean;
begin
  vSel := False;
  for I := 0 to CheckListBoxTipoContrato.Count - 1 do
  	if CheckListBoxTipoContrato.Checked[I] then
    	vSel := True;

  if not vSel then
  begin
  	Application.MessageBox(pchar('Nenhum tipo de contato selecionado.'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  vSel := False;
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	if CheckListBoxOrigem.Checked[I] then
    	vSel := True;

  if not vSel then
  begin
  	Application.MessageBox(pchar('Nenhuma origem selecionada.'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  TForm(pnOrigemTipoContato.Parent).ModalResult := IDOK;
end;

procedure TfrmTipoContatoOrigem.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	MsgTipoContatoOrigem._marcaDesmarcaLinha;
end;

procedure TfrmTipoContatoOrigem.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmTipoContatoOrigem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    MsgTipoContatoOrigem._marcaDesmarcaLinha;
end;

procedure TfrmTipoContatoOrigem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (MsgTipoContatoOrigem <> nil) then
    MsgTipoContatoOrigem.Cancel;

  MsgTipoContatoOrigem.free;
  MsgTipoContatoOrigem := nil;

  Action := caFree;
  if (frmTipoContatoOrigem <> nil) then
    frmTipoContatoOrigem := nil;
end;

procedure TfrmTipoContatoOrigem.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  MsgTipoContatoOrigem := TMsgTipoContatoOrigem.create;
  tsCadastro.TabVisible := False;
  tsOrigemTipoContrato.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet3.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmTipoContatoOrigem.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (MsgTipoContatoOrigem.dataSet.State in [dsEdit, dsInsert]) then
    begin
    	ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmTipoContatoOrigem.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsMsgTipoContatoOrigem;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmTipoContatoOrigem.pnOrigemTipoContatoEnter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (CheckListBoxTipoContrato.CanFocus) then
  	CheckListBoxTipoContrato.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (CheckListBoxOrigem.CanFocus) then
  	CheckListBoxOrigem.SetFocus;
end;

procedure TfrmTipoContatoOrigem.SpeedButton10Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    MsgTipoContatoOrigem._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmTipoContatoOrigem.SpeedButton13Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxTipoContrato.Count - 1 do
  	CheckListBoxTipoContrato.Checked[I] := True;
end;

procedure TfrmTipoContatoOrigem.SpeedButton14Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxTipoContrato.Count - 1 do
  	CheckListBoxTipoContrato.Checked[I] := False;
end;

procedure TfrmTipoContatoOrigem.SpeedButton15Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	CheckListBoxOrigem.Checked[I] := True;
end;

procedure TfrmTipoContatoOrigem.SpeedButton16Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	CheckListBoxOrigem.Checked[I] := False;
end;

procedure TfrmTipoContatoOrigem.SpeedButton1Click(Sender: TObject);
begin
  try
    if MsgTipoContatoOrigem.dataSet.IsEmpty then
      Exit;

    if not MsgTipoContatoOrigem.Edit then
      Exit;

    inherited;
    
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      DBLookupComboBox1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      MsgTipoContatoOrigem.Cancel;
      MsgTipoContatoOrigem.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoContatoOrigem.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    MsgTipoContatoOrigem.Delete;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      MsgTipoContatoOrigem.Cancel;
      MsgTipoContatoOrigem.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoContatoOrigem.SpeedButton6Click(Sender: TObject);
begin
  if not MsgTipoContatoOrigem.abreFormMsgTipoContatoLote then
    Exit;
end;

procedure TfrmTipoContatoOrigem.SpeedButton9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    MsgTipoContatoOrigem._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
