unit uTipoTarefaOrigem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClassesConfigWS, CheckLst, DBCtrls;

type
  TfrmTipoTarefaOrigem = class(TfrmCadPadraoM)
    tsOrigemTipoTarefa: TTabSheet;
    pnOrigemTipoTarefa: TPanel;
    ScrollBox5: TScrollBox;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    CheckListBoxTipoTarefa: TCheckListBox;
    CheckListBoxOrigem: TCheckListBox;
    Panel5: TPanel;
    btnOrigemTipoTarefaOK: TBitBtn;
    btnOrigemTipoTarefaCancelar: TBitBtn;
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnOrigemTipoTarefaCancelarClick(Sender: TObject);
    procedure btnOrigemTipoTarefaOKClick(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoTarefaOrigem: TfrmTipoTarefaOrigem;
  MsgTipoTarefaOrigem: TMsgTipoTarefaOrigem;

implementation

uses
  UDtmConfig, uDtmAtivo, DB, uDataSet_OOP, hw_win_utils, ShellAPI, uDadosIni;

{$R *.dfm}

procedure TfrmTipoTarefaOrigem.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG083', 'CONSULTA', '', 'MSG_TIPO_TAREFA_ORIGEM', '',
    MsgTipoTarefaOrigem.buscas, true) then
    Exit;

  inherited;

  MsgTipoTarefaOrigem.rCons.vCampo := ComboBox1.Text;
  MsgTipoTarefaOrigem.rCons.vCondicao := ComboBox3.Text;
  MsgTipoTarefaOrigem.rCons.vDataIni := trim(MaskEdit1.Text);
  MsgTipoTarefaOrigem.rCons.vDataFim := trim(MaskEdit2.Text);
  MsgTipoTarefaOrigem.rCons.vValor := trim(MaskEdit3.Text);
  MsgTipoTarefaOrigem._defineSqlAdicional;

  if MaskEdit2.Visible then
  begin
    if not MsgTipoTarefaOrigem.ConsultaCampos('MSG_TIPO_TAREFA_ORIGEM',
    	MsgTipoTarefaOrigem.rCons.vCampo,
      'MSG_ORIGEM.DESCRICAO, MSG_TIPO_TAREFA.TIPO, MSG_TIPO_TAREFA.DESCRICAO_REDUZIDA ',
      MsgTipoTarefaOrigem.rCons.vDataIni,
      MsgTipoTarefaOrigem.rCons.vDataFim,
      vDadosIni.codEmpresa, 1,
      'MSG_TIPO_TAREFA_ORIGEM.*, MSG_ORIGEM.DESCRICAO, MSG_TIPO_TAREFA.TIPO, MSG_TIPO_TAREFA.DESCRICAO_REDUZIDA ',
      'LEFT JOIN MSG_TIPO_TAREFA ON MSG_TIPO_TAREFA.ID = MSG_TIPO_TAREFA_ORIGEM.ID_MSG_TIPO_TAREFA ' +
      'LEFT JOIN MSG_ORIGEM ON MSG_ORIGEM.ID = MSG_TIPO_TAREFA_ORIGEM.ID_MSG_ORIGEM ',
      MsgTipoTarefaOrigem.rCons.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not MsgTipoTarefaOrigem.ConsultaCampos('MSG_TIPO_TAREFA_ORIGEM',
  	MsgTipoTarefaOrigem.rCons.vValor,
    MsgTipoTarefaOrigem.rCons.vCampo,
    MsgTipoTarefaOrigem.rCons.vCondicao,
    'MSG_ORIGEM.DESCRICAO, MSG_TIPO_TAREFA.TIPO, MSG_TIPO_TAREFA.DESCRICAO_REDUZIDA ',
    true, vDadosIni.codEmpresa,
    'MSG_TIPO_TAREFA_ORIGEM.*, MSG_ORIGEM.DESCRICAO, MSG_TIPO_TAREFA.TIPO, MSG_TIPO_TAREFA.DESCRICAO_REDUZIDA ',
    'LEFT JOIN MSG_TIPO_TAREFA ON MSG_TIPO_TAREFA.ID = MSG_TIPO_TAREFA_ORIGEM.ID_MSG_TIPO_TAREFA ' +
    'LEFT JOIN MSG_ORIGEM ON MSG_ORIGEM.ID = MSG_TIPO_TAREFA_ORIGEM.ID_MSG_ORIGEM ',
    MsgTipoTarefaOrigem.rCons.vSqlAdicional) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmTipoTarefaOrigem.BitBtn3Click(Sender: TObject);
begin
  try
    if not MsgTipoTarefaOrigem.Insert then
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
      MsgTipoTarefaOrigem.Cancel;
      MsgTipoTarefaOrigem.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoTarefaOrigem.BitBtn4Click(Sender: TObject);
begin
  if not MsgTipoTarefaOrigem.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(MsgTipoTarefaOrigem.vNomeCampoErro, MsgTipoTarefaOrigem.vMensagemErro);
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
      if MsgTipoTarefaOrigem.Insert then
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

procedure TfrmTipoTarefaOrigem.BitBtn5Click(Sender: TObject);
begin
  inherited;
  MsgTipoTarefaOrigem.Cancel;
  MsgTipoTarefaOrigem.RollBackTransacao;
end;

procedure TfrmTipoTarefaOrigem.btnOrigemTipoTarefaCancelarClick(
  Sender: TObject);
begin
  inherited;
  TForm(pnOrigemTipoTarefa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmTipoTarefaOrigem.btnOrigemTipoTarefaOKClick(Sender: TObject);
var
  I: Integer;
  vSel: boolean;
begin
  vSel := False;
  for I := 0 to CheckListBoxTipoTarefa.Count - 1 do
  	if CheckListBoxTipoTarefa.Checked[I] then
    	vSel := True;

  if not vSel then
  begin
  	Application.MessageBox(pchar('Nenhum tipo de tarefa selecionado.'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  vSel := False;
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	if CheckListBoxOrigem.Checked[I] then
    	vSel := True;

  if not vSel then
  begin
  	Application.MessageBox(pchar('Nenhuma origem selecionada.'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  TForm(pnOrigemTipoTarefa.Parent).ModalResult := IDOK;
end;

procedure TfrmTipoTarefaOrigem.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  	MsgTipoTarefaOrigem._marcaDesmarcaLinha;
end;

procedure TfrmTipoTarefaOrigem.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmTipoTarefaOrigem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    MsgTipoTarefaOrigem._marcaDesmarcaLinha;
end;

procedure TfrmTipoTarefaOrigem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (MsgTipoTarefaOrigem <> nil) then
    MsgTipoTarefaOrigem.Cancel;

  MsgTipoTarefaOrigem.free;
  MsgTipoTarefaOrigem := nil;

  Action := caFree;
  if (frmTipoTarefaOrigem <> nil) then
    frmTipoTarefaOrigem := nil;
end;

procedure TfrmTipoTarefaOrigem.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  MsgTipoTarefaOrigem := TMsgTipoTarefaOrigem.create;
  tsCadastro.TabVisible := False;
  tsOrigemTipoTarefa.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet3.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmTipoTarefaOrigem.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (MsgTipoTarefaOrigem.dataSet.State in [dsEdit, dsInsert]) then
    begin
    	ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmTipoTarefaOrigem.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsMsgTipoTarefaOrigem;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton10Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    MsgTipoTarefaOrigem._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton13Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxTipoTarefa.Count - 1 do
  	CheckListBoxTipoTarefa.Checked[I] := True;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton14Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxTipoTarefa.Count - 1 do
  	CheckListBoxTipoTarefa.Checked[I] := False;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton15Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	CheckListBoxOrigem.Checked[I] := True;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton16Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	CheckListBoxOrigem.Checked[I] := False;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton1Click(Sender: TObject);
begin
  try
    if MsgTipoTarefaOrigem.dataSet.IsEmpty then
      Exit;

    if not MsgTipoTarefaOrigem.Edit then
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
      MsgTipoTarefaOrigem.Cancel;
      MsgTipoTarefaOrigem.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton2Click(Sender: TObject);
begin
  try
    MsgTipoTarefaOrigem.Delete;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      MsgTipoTarefaOrigem.Cancel;
      MsgTipoTarefaOrigem.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton6Click(Sender: TObject);
begin
  if not MsgTipoTarefaOrigem.abreFormMsgTipoTarefaLote then
    Exit;
end;

procedure TfrmTipoTarefaOrigem.SpeedButton9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    MsgTipoTarefaOrigem._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
