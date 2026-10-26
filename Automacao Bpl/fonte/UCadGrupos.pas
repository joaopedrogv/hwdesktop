unit UCadGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, Menus, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  ComCtrls, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, DBCtrls, DB,
  QRCtrls, QuickRpt, AppEvnts;

type
  TFrmCadGrupos = class(TfrmCadPadraoM)
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    TabSheet4: TTabSheet;
    qrpGrupos: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    lbEmpresa: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure qrpGruposPreview(Sender: TObject);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadGrupos: TFrmCadGrupos;
  Grupo: TGrupos;
implementation

{$R *.dfm}

procedure TFrmCadGrupos.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira - [PRO045]';

  if not vDadosIni.PesqPros('PRO041', 'PESQUISAR', '',
  	'GRUPOS', '', Grupo.buscas, true) then
    	Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not Grupo.ConsultaCampos('GRUPOS', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          combobox1.setfocus;
  end
  else if Grupo.ConsultaCampos('GRUPOS', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        ComboBox1.SetFocus;
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    DBGrid1.SetFocus;
end;

procedure TFrmCadGrupos.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO042', 'INCLUIR', '', 'GRUPOS', '', Grupo.buscas, true) then
  	Exit;

  if not Grupo.Insert then
  	Exit;

  inherited;

  DBEdit1.Enabled := True;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;

  Grupo.PreencheCampos;

  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TFrmCadGrupos.BitBtn4Click(Sender: TObject);
begin
  if not Grupo.post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if Grupo.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadGrupos.BitBtn5Click(Sender: TObject);
begin
  ActiveControl := BitBtn5;
  PageControl1.ActivePage := TabSheet2;
//  if vDadosIni.PesqPros('PRO049', 'CANCELAR', '',
//  'GRUPOS', '', Grupo.buscas, true) then
//  if vDadosIni.PesqPros('PRO049', '', Grupo.buscas, true) then
//  begin
    Grupo.Cancel;
    Grupo.RollBackTransacao;
//  end;
  inherited;
end;

procedure TFrmCadGrupos.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Grupo._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadGrupos.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Grupo._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadGrupos.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not Grupo.VerificaGrupo then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      	DBEdit1.SetFocus;
end;

procedure TFrmCadGrupos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    Grupo._marcaDesmarcaLinha;
end;

procedure TFrmCadGrupos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFrmCadGrupos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {if (key = VK_RETURN) and (TelaCadastro = 1) then
  begin
    vDadosIni.vPesquisa := inttostr(Grupo.dataSet.FieldByName('CODIGO_GRUP').AsInteger);
    FrmCadGrupos.Close;
  end
  else }
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not Grupo.dataSet.IsEmpty then
      Grupo._marcaDesmarcaLinha;
end;

procedure TFrmCadGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Grupo.Cancel;
  Grupo.RollBackTransacao;
  //  Grupo.abreGrupos;
  if Self.TelaCadastro = 0 then
    Grupo.free;
  Action := caFree;
  FrmCadGrupos := nil;
end;

procedure TFrmCadGrupos.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Grupo := TGrupos.Create;
  Grupo.abreGrupos;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadGrupos.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (Grupo.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TFrmCadGrupos.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := dtmProdutos.dsGrupos;
  TabSheet4.TabVisible := false;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadGrupos.qrpGruposPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Grupos de Produtos');
end;

procedure TFrmCadGrupos.SpeedButton1Click(Sender: TObject);
begin
  if Grupo.dataSet.IsEmpty then
  	Exit;

  if Grupo.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
  begin
  	Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    Exit;
  end;

  if not vDadosIni.PesqPros('PRO043', 'EDITAR', '', 'GRUPOS', Grupo.dataSet.FieldByName('CODIGO_GRUP').AsString, Grupo.buscas, true) then
  	Exit;

  if not Grupo.Edit then
    Exit;

  inherited;

  DBEdit1.Enabled := False;
  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;

  Grupo.PreencheCampos;

  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TFrmCadGrupos.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO047', 'ABRIR', '', 'GRUPOS', '', Grupo.buscas, true) then
  begin
    if not Grupo.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [PRO045]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO044]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadGrupos.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    Grupo.Delete;
    vStatusLixeira := Grupo.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      Grupo.Cancel;
      Grupo.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadGrupos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO073', 'IMPRIMINDO REGISTROS', '',
  'GRUPOS', Grupo.dataSet.FieldByName('CODIGO_GRUP').AsString, Grupo.buscas, true) then
//  vDadosIni.PesqPros('PRO073', '', Grupo.buscas, true) then
    Grupo.imprimirRelatoriodeGrupo;
end;

procedure TFrmCadGrupos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not Grupo.RestaurarRegistro then
    Exit;

  if Grupo.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadGrupos.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if Grupo.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

procedure TFrmCadGrupos.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

end.

