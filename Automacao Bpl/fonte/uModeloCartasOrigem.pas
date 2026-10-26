unit uModeloCartasOrigem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClassesConfigWS, DBCtrls, CheckLst;

type
  TfrmModcartasOrigem = class(TfrmCadPadraoM)
    tsOrigemModarta: TTabSheet;
    pnOrigemModcarta: TPanel;
    ScrollBox5: TScrollBox;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    CheckListBoxModcartas: TCheckListBox;
    CheckListBoxOrigem: TCheckListBox;
    Panel5: TPanel;
    btnOrigemTipoContatoOK: TBitBtn;
    btnOrigemTipoContatoCancelar: TBitBtn;
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure btnOrigemTipoContatoCancelarClick(Sender: TObject);
    procedure btnOrigemTipoContatoOKClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModcartasOrigem: TfrmModcartasOrigem;
  MsgOrigemModCartas: TMsgOrigemModCartas;

implementation

uses
  UDtmConfig, uDtmAtivo, DB, uDataSet_OOP, hw_win_utils, ShellAPI, uDadosIni;

{$R *.dfm}

procedure TfrmModcartasOrigem.BitBtn1Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('CFG077', 'CONSULTA', '', 'MSG_ORIGEM_MODCARTAS', '',
    MsgOrigemModCartas.buscas, true) then
    Exit;

  inherited;

  MsgOrigemModCartas.rCons.vCampo := ComboBox1.Text;
  MsgOrigemModCartas.rCons.vCondicao := ComboBox3.Text;
  MsgOrigemModCartas.rCons.vDataIni := trim(MaskEdit1.Text);
  MsgOrigemModCartas.rCons.vDataFim := trim(MaskEdit2.Text);
  MsgOrigemModCartas.rCons.vValor := trim(MaskEdit3.Text);
  MsgOrigemModCartas._defineSqlAdicional;

  if MaskEdit2.Visible then
  begin
    if not MsgOrigemModCartas.ConsultaCampos('MSG_ORIGEM_MODCARTAS',
    	MsgOrigemModCartas.rCons.vCampo,
      'MSG_ORIGEM.DESCRICAO, MSG_APLICATIVO.APLICATIVO, MODCARTAS.DESCRICAO',
      MsgOrigemModCartas.rCons.vDataIni,
      MsgOrigemModCartas.rCons.vDataFim,
      vDadosIni.codEmpresa, 1,
      'MSG_ORIGEM_MODCARTAS.*, MSG_ORIGEM.DESCRICAO, MODCARTAS.DESCRICAO AS MODCARTA, MSG_APLICATIVO.APLICATIVO ',
      'LEFT JOIN MODCARTAS ON MODCARTAS.COD_CARTA = MSG_ORIGEM_MODCARTAS.COD_CARTA AND MODCARTAS.COD_EMPRESA = MSG_ORIGEM_MODCARTAS.COD_EMPRESA ' +
      'LEFT JOIN MSG_APLICATIVO ON MSG_APLICATIVO.ID = MODCARTAS.ID_MSG_APLICATIVO ' +
      'LEFT JOIN MSG_ORIGEM ON MSG_ORIGEM.ID = MSG_ORIGEM_MODCARTAS.ID_MSG_ORIGEM ',
      MsgOrigemModCartas.rCons.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not MsgOrigemModCartas.ConsultaCampos('MSG_ORIGEM_MODCARTAS',
  	MsgOrigemModCartas.rCons.vValor,
    MsgOrigemModCartas.rCons.vCampo,
    MsgOrigemModCartas.rCons.vCondicao,
    'MSG_ORIGEM.DESCRICAO, MSG_APLICATIVO.APLICATIVO, MODCARTAS.DESCRICAO',
    true, vDadosIni.codEmpresa,
    'MSG_ORIGEM_MODCARTAS.*, MSG_ORIGEM.DESCRICAO, MODCARTAS.DESCRICAO AS MODCARTA, MSG_APLICATIVO.APLICATIVO ',
    'LEFT JOIN MODCARTAS ON MODCARTAS.COD_CARTA = MSG_ORIGEM_MODCARTAS.COD_CARTA AND MODCARTAS.COD_EMPRESA = MSG_ORIGEM_MODCARTAS.COD_EMPRESA ' +
    'LEFT JOIN MSG_APLICATIVO ON MSG_APLICATIVO.ID = MODCARTAS.ID_MSG_APLICATIVO ' +
    'LEFT JOIN MSG_ORIGEM ON MSG_ORIGEM.ID = MSG_ORIGEM_MODCARTAS.ID_MSG_ORIGEM ',
    MsgOrigemModCartas.rCons.vSqlAdicional) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmModcartasOrigem.BitBtn3Click(Sender: TObject);
begin
  inherited;
  try
    if not MsgOrigemModCartas.Insert then
      exit;

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
      MsgOrigemModCartas.Cancel;
      MsgOrigemModCartas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmModcartasOrigem.BitBtn4Click(Sender: TObject);
begin
  if not MsgOrigemModCartas.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(MsgOrigemModCartas.vNomeCampoErro, MsgOrigemModCartas.vMensagemErro);
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
      if MsgOrigemModCartas.Insert then
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

procedure TfrmModcartasOrigem.BitBtn5Click(Sender: TObject);
begin
  inherited;
  MsgOrigemModCartas.Cancel;
  MsgOrigemModCartas.RollBackTransacao;
end;

procedure TfrmModcartasOrigem.btnOrigemTipoContatoCancelarClick(
  Sender: TObject);
begin
  inherited;
	TForm(pnOrigemModcarta.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmModcartasOrigem.btnOrigemTipoContatoOKClick(Sender: TObject);
var
	I: Integer;
  vSel: boolean;
begin
  vSel := False;
  for I := 0 to CheckListBoxModcartas.Count - 1 do
  	if CheckListBoxModcartas.Checked[I] then
    	vSel := True;

  if not vSel then
  begin
  	Application.MessageBox(pchar('Nenhum modelo de carta selecionado.'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  vSel := False;
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	if CheckListBoxOrigem.Checked[I] then
    	vSel := True;

  if not vSel then
  begin
  	Application.MessageBox(pchar('Nenhuma origem selecionada.'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;

  TForm(pnOrigemModcarta.Parent).ModalResult := IDOK;
end;

procedure TfrmModcartasOrigem.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	MsgOrigemModCartas._marcaDesmarcaLinha;
end;

procedure TfrmModcartasOrigem.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmModcartasOrigem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    MsgOrigemModCartas._marcaDesmarcaLinha;
end;

procedure TfrmModcartasOrigem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	if (MsgOrigemModCartas <> nil) then
    MsgOrigemModCartas.Cancel;

  MsgOrigemModCartas.free;
  MsgOrigemModCartas := nil;

  Action := caFree;
  if (frmModcartasOrigem <> nil) then
    frmModcartasOrigem := nil;
end;

procedure TfrmModcartasOrigem.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  MsgOrigemModCartas := TMsgOrigemModCartas.create;
  tsCadastro.TabVisible := False;
  tsOrigemModarta.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet3.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmModcartasOrigem.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (MsgOrigemModCartas.dataSet.State in [dsEdit, dsInsert]) then
    begin
    	ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmModcartasOrigem.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsMsgOrigemModCartas;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmModcartasOrigem.SpeedButton13Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxModcartas.Count - 1 do
  	CheckListBoxModcartas.Checked[I] := True;
end;

procedure TfrmModcartasOrigem.SpeedButton14Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxModcartas.Count - 1 do
  	CheckListBoxModcartas.Checked[I] := False;
end;

procedure TfrmModcartasOrigem.SpeedButton15Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	CheckListBoxOrigem.Checked[I] := True;
end;

procedure TfrmModcartasOrigem.SpeedButton16Click(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBoxOrigem.Count - 1 do
  	CheckListBoxOrigem.Checked[I] := False;
end;

procedure TfrmModcartasOrigem.SpeedButton1Click(Sender: TObject);
begin
  try
    if MsgOrigemModCartas.dataSet.IsEmpty then
      Exit;
      
    if not MsgOrigemModCartas.Edit then
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
      MsgOrigemModCartas.Cancel;
      MsgOrigemModCartas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmModcartasOrigem.SpeedButton2Click(Sender: TObject);
begin
  try
    MsgOrigemModCartas.Delete;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      MsgOrigemModCartas.Cancel;
      MsgOrigemModCartas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmModcartasOrigem.SpeedButton6Click(Sender: TObject);
begin
  if not MsgOrigemModCartas.abreFormMsgOrigemModCartasLote then
    Exit;
end;

end.
