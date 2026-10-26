unit uTipoContatoOrigemPlataforma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClassesConfigWS, CheckLst, DBCtrls;

type
  TfrmTipoContatoOrigemPlataforma = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    tsOrigemTipoContratoPlataforma: TTabSheet;
    pnOrigemTipoContatoPlataforma: TPanel;
    ScrollBox5: TScrollBox;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    CheckListBoxOrigemTipoContrato: TCheckListBox;
    CheckListBoxPlataforma: TCheckListBox;
    Panel5: TPanel;
    btnOrigemTipoContatoPlataformaOK: TBitBtn;
    btnOrigemTipoContatoPlataformaCancelar: TBitBtn;
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
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnOrigemTipoContatoPlataformaCancelarClick(Sender: TObject);
    procedure btnOrigemTipoContatoPlataformaOKClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoContatoOrigemPlataforma: TfrmTipoContatoOrigemPlataforma;
  MsgTipoContatoOrigemPlataforma: TMsgTipoContatoOrigemPlataforma;

implementation

uses
  UDtmConfig, uDtmAtivo, DB, uDataSet_OOP, hw_win_utils, ShellAPI, uDadosIni;

{$R *.dfm}

procedure TfrmTipoContatoOrigemPlataforma.BitBtn1Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('CFG071', 'CONSULTA', '', 'MSG_TIPO_CONTATO_ORIGEM_PLAT', '',
    MsgTipoContatoOrigemPlataforma.buscas, true) then
    Exit;

  inherited;

  MsgTipoContatoOrigemPlataforma.rCons.vCampo := ComboBox1.Text;
  MsgTipoContatoOrigemPlataforma.rCons.vCondicao := ComboBox3.Text;
  MsgTipoContatoOrigemPlataforma.rCons.vDataIni := trim(MaskEdit1.Text);
  MsgTipoContatoOrigemPlataforma.rCons.vDataFim := trim(MaskEdit2.Text);
  MsgTipoContatoOrigemPlataforma.rCons.vValor := trim(MaskEdit3.Text);
  MsgTipoContatoOrigemPlataforma._defineSqlAdicional;

  if MaskEdit2.Visible then
  begin
    if not MsgTipoContatoOrigemPlataforma.ConsultaCampos('MSG_TIPO_CONTATO_ORIGEM_PLAT',
    	MsgTipoContatoOrigemPlataforma.rCons.vCampo,
      ' MSG_ORIGEM.DESCRICAO, MSG_APLICATIVO.APLICATIVO, ' +
      ' MSG_PLATAFORMA.PLATAFORMA, MSG_PLATAFORMA.IDENTIFICADOR_BOT, TIPO_CONTATO.TIPO ',
      MsgTipoContatoOrigemPlataforma.rCons.vDataIni,
      MsgTipoContatoOrigemPlataforma.rCons.vDataFim,
      vDadosIni.codEmpresa, 1,
      ' MSG_TIPO_CONTATO_ORIGEM_PLAT.*, MSG_APLICATIVO.APLICATIVO, ' +
      ' MSG_PLATAFORMA.PLATAFORMA, MSG_PLATAFORMA.IDENTIFICADOR_BOT, ' +
      ' TIPO_CONTATO.TIPO, MSG_ORIGEM.DESCRICAO ',
      'LEFT JOIN MSG_PLATAFORMA ON MSG_PLATAFORMA.ID = MSG_TIPO_CONTATO_ORIGEM_PLAT.ID_MSG_PLATAFORMA AND MSG_PLATAFORMA.COD_EMPRESA = MSG_TIPO_CONTATO_ORIGEM_PLAT.COD_EMPRESA ' +
      'LEFT JOIN MSG_APLICATIVO ON MSG_APLICATIVO.ID = MSG_PLATAFORMA.ID_MSG_APLICATIVO ' +
      'LEFT JOIN MSG_TIPO_CONTATO_ORIGEM ON MSG_TIPO_CONTATO_ORIGEM.ID = MSG_TIPO_CONTATO_ORIGEM_PLAT.ID_MSG_TIPO_CONTATO_ORIGEM AND MSG_TIPO_CONTATO_ORIGEM.COD_EMPRESA = MSG_TIPO_CONTATO_ORIGEM_PLAT.COD_EMPRESA ' +
      'LEFT JOIN MSG_ORIGEM ON MSG_ORIGEM.ID = MSG_TIPO_CONTATO_ORIGEM.ID_MSG_ORIGEM ' +
      'LEFT JOIN TIPO_CONTATO ON TIPO_CONTATO.ID = MSG_TIPO_CONTATO_ORIGEM.ID_TIPO_CONTATO AND TIPO_CONTATO.COD_EMPRESA = MSG_TIPO_CONTATO_ORIGEM.COD_EMPRESA ',
      MsgTipoContatoOrigemPlataforma.rCons.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not MsgTipoContatoOrigemPlataforma.ConsultaCampos('MSG_TIPO_CONTATO_ORIGEM_PLAT',
  	MsgTipoContatoOrigemPlataforma.rCons.vValor,
    MsgTipoContatoOrigemPlataforma.rCons.vCampo,
    MsgTipoContatoOrigemPlataforma.rCons.vCondicao,
    ' MSG_ORIGEM.DESCRICAO, MSG_APLICATIVO.APLICATIVO, ' +
    ' MSG_PLATAFORMA.PLATAFORMA, MSG_PLATAFORMA.IDENTIFICADOR_BOT, TIPO_CONTATO.TIPO ',
    true, vDadosIni.codEmpresa,
    ' MSG_TIPO_CONTATO_ORIGEM_PLAT.*, MSG_APLICATIVO.APLICATIVO, ' +
    ' MSG_PLATAFORMA.PLATAFORMA, MSG_PLATAFORMA.IDENTIFICADOR_BOT, ' +
    ' TIPO_CONTATO.TIPO, MSG_ORIGEM.DESCRICAO ',
    'LEFT JOIN MSG_PLATAFORMA ON MSG_PLATAFORMA.ID = MSG_TIPO_CONTATO_ORIGEM_PLAT.ID_MSG_PLATAFORMA AND MSG_PLATAFORMA.COD_EMPRESA = MSG_TIPO_CONTATO_ORIGEM_PLAT.COD_EMPRESA ' +
    'LEFT JOIN MSG_APLICATIVO ON MSG_APLICATIVO.ID = MSG_PLATAFORMA.ID_MSG_APLICATIVO ' +
    'LEFT JOIN MSG_TIPO_CONTATO_ORIGEM ON MSG_TIPO_CONTATO_ORIGEM.ID = MSG_TIPO_CONTATO_ORIGEM_PLAT.ID_MSG_TIPO_CONTATO_ORIGEM AND MSG_TIPO_CONTATO_ORIGEM.COD_EMPRESA = MSG_TIPO_CONTATO_ORIGEM_PLAT.COD_EMPRESA ' +
    'LEFT JOIN MSG_ORIGEM ON MSG_ORIGEM.ID = MSG_TIPO_CONTATO_ORIGEM.ID_MSG_ORIGEM ' +
    'LEFT JOIN TIPO_CONTATO ON TIPO_CONTATO.ID = MSG_TIPO_CONTATO_ORIGEM.ID_TIPO_CONTATO AND TIPO_CONTATO.COD_EMPRESA = MSG_TIPO_CONTATO_ORIGEM.COD_EMPRESA ',
      MsgTipoContatoOrigemPlataforma.rCons.vSqlAdicional) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmTipoContatoOrigemPlataforma.BitBtn3Click(Sender: TObject);
begin
  try
    if not MsgTipoContatoOrigemPlataforma.Insert then
      Exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    DBLookupComboBox1.Enabled := True;
    DBLookupComboBox2.Enabled := True;

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
      MsgTipoContatoOrigemPlataforma.Cancel;
      MsgTipoContatoOrigemPlataforma.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoContatoOrigemPlataforma.BitBtn4Click(Sender: TObject);
begin
  if not MsgTipoContatoOrigemPlataforma.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(MsgTipoContatoOrigemPlataforma.vNomeCampoErro, MsgTipoContatoOrigemPlataforma.vMensagemErro);
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
      if MsgTipoContatoOrigemPlataforma.Insert then
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

procedure TfrmTipoContatoOrigemPlataforma.BitBtn5Click(Sender: TObject);
begin
  inherited;
	MsgTipoContatoOrigemPlataforma.Cancel;
  MsgTipoContatoOrigemPlataforma.RollBackTransacao;
end;

procedure TfrmTipoContatoOrigemPlataforma.btnOrigemTipoContatoPlataformaCancelarClick(
  Sender: TObject);
begin
	inherited;
  TForm(pnOrigemTipoContatoPlataforma.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmTipoContatoOrigemPlataforma.btnOrigemTipoContatoPlataformaOKClick(
  Sender: TObject);
var
  I: Integer;
  vSel: boolean;
begin
  vSel := False;
  for I := 0 to CheckListBoxPlataforma.Count - 1 do
  	if CheckListBoxPlataforma.Checked[I] then
    	vSel := True;

  if not vSel then
  begin
  	Application.MessageBox(pchar('Nenhum plataforma selecionada.'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  vSel := False;
  for I := 0 to CheckListBoxOrigemTipoContrato.Count - 1 do
  	if CheckListBoxOrigemTipoContrato.Checked[I] then
    	vSel := True;

  if not vSel then
  begin
  	Application.MessageBox(pchar('Nenhuma origem por tipo de contato selecionada.'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  TForm(pnOrigemTipoContatoPlataforma.Parent).ModalResult := IDOK;
end;

procedure TfrmTipoContatoOrigemPlataforma.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	MsgTipoContatoOrigemPlataforma._marcaDesmarcaLinha;
end;

procedure TfrmTipoContatoOrigemPlataforma.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmTipoContatoOrigemPlataforma.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    MsgTipoContatoOrigemPlataforma._marcaDesmarcaLinha;
end;

procedure TfrmTipoContatoOrigemPlataforma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (MsgTipoContatoOrigemPlataforma <> nil) then
    MsgTipoContatoOrigemPlataforma.Cancel;

  MsgTipoContatoOrigemPlataforma.free;
  MsgTipoContatoOrigemPlataforma := nil;

  Action := caFree;
  if (frmTipoContatoOrigemPlataforma <> nil) then
    frmTipoContatoOrigemPlataforma := nil;
end;

procedure TfrmTipoContatoOrigemPlataforma.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  MsgTipoContatoOrigemPlataforma := TMsgTipoContatoOrigemPlataforma.create;
  tsCadastro.TabVisible := False;
  tsOrigemTipoContratoPlataforma.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet3.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmTipoContatoOrigemPlataforma.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (MsgTipoContatoOrigemPlataforma.dataSet.State in [dsEdit, dsInsert]) then
    begin
    	ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmTipoContatoOrigemPlataforma.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsMsgTipoContatoOrigemPlataforma;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton10Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    MsgTipoContatoOrigemPlataforma._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton13Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxPlataforma.Count - 1 do
  	CheckListBoxPlataforma.Checked[I] := True;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton14Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxPlataforma.Count - 1 do
  	CheckListBoxPlataforma.Checked[I] := False;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton15Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxOrigemTipoContrato.Count - 1 do
  	CheckListBoxOrigemTipoContrato.Checked[I] := True;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton16Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxOrigemTipoContrato.Count - 1 do
  	CheckListBoxOrigemTipoContrato.Checked[I] := False;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton1Click(Sender: TObject);
begin
  try
    if MsgTipoContatoOrigemPlataforma.dataSet.IsEmpty then
      Exit;

    if not MsgTipoContatoOrigemPlataforma.Edit then
      Exit;

    inherited;
    
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    DBLookupComboBox1.Enabled := False;
    DBLookupComboBox2.Enabled := False;

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
      MsgTipoContatoOrigemPlataforma.Cancel;
      MsgTipoContatoOrigemPlataforma.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    MsgTipoContatoOrigemPlataforma.Delete;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      MsgTipoContatoOrigemPlataforma.Cancel;
      MsgTipoContatoOrigemPlataforma.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not MsgTipoContatoOrigemPlataforma.abreFormMsgTipoContatoOrigemPlataformaLote then
    Exit;
end;

procedure TfrmTipoContatoOrigemPlataforma.SpeedButton9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    MsgTipoContatoOrigemPlataforma._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
