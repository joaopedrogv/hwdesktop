unit uCadFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, UclassesColaborador, DBCtrls, QRCtrls, QuickRpt, AppEvnts,UCadPadraoModal;

type
  TfrmCadFuncoes = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    TabSheet4: TTabSheet;
    qrpFuncoes: TQuickRep;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRDBText13: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    lbEmpresa: TQRLabel;
    QRLabel7: TQRLabel;
    btUnSelectAll: TSpeedButton;
    btSelectAll: TSpeedButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrpFuncoesPreview(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncoes: TfrmCadFuncoes;
  obFuncoes: TFuncoes;

implementation

uses
  uDtmAtivo, uDtmColaborador, DB;

{$R *.dfm}

procedure TfrmCadFuncoes.BitBtn1Click(Sender: TObject);
var
	I: Integer;
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [COL021]';

  if vDadosIni.PesqPros('COL027', '', '', 'FUNCOES', '', obFuncoes.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not obFuncoes.ConsultaCampos('FUNCOES', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not obFuncoes.ConsultaCampos('FUNCOES', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if obFuncoes.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    obFuncoes.ultimasql := obFuncoes.dataSet.CommandText;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

    if obFuncoes.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[i].FieldName = 'TPDOCS_VND' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
  end;
end;

procedure TfrmCadFuncoes.BitBtn2Click(Sender: TObject);
begin
  obFuncoes.Cancel;
  inherited;
end;

procedure TfrmCadFuncoes.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('COL019', 'INSERINDO NOVO REGISTRO', '', 'FUNCOES', '', obFuncoes.buscas, true) then
  begin
    if not obFuncoes.Insert then
      exit;
    ActiveControl := BitBtn3;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end;
end;

procedure TfrmCadFuncoes.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not obFuncoes.Post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obFuncoes.vNomeCampoErro, obFuncoes.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obFuncoes.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadFuncoes.BitBtn5Click(Sender: TObject);
begin
//  if obFuncoes.dataSet.State = dsEdit then
//    vDadosIni.GravaAuditoria('COL026', 'CANCELAR ALTERAÇÃO', '', 'FUNCOES', obFuncoes.dataSet.FieldByName('COD_FUNCAO').Asstring, obFuncoes.buscas)
//  else
//    vDadosIni.GravaAuditoria('COL026', 'CANCELAR INCLUSÃO', '', 'FUNCOES', '', obFuncoes.buscas);
  obFuncoes.Cancel;
//  obFuncoes.RollBackTransacao;
  inherited;
end;

procedure TfrmCadFuncoes.btSelectAllClick(Sender: TObject);
begin
	inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obFuncoes._marcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadFuncoes.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obFuncoes._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadFuncoes.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  	obFuncoes._marcaDesmarcaLinha;
end;

procedure TfrmCadFuncoes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if obFuncoes.dataSet.FieldByName('SEL').AsString = 'S' then
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

procedure TfrmCadFuncoes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_SPACE) then
  	obFuncoes._marcaDesmarcaLinha
  else if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
end;

procedure TfrmCadFuncoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obFuncoes.Cancel;
  obFuncoes.RollBackTransacao;
  obFuncoes.free;
  Action := caFree;
  frmCadFuncoes := nil;
end;

procedure TfrmCadFuncoes.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  obFuncoes := TFuncoes.Create;
  //  obFuncoes.abreFuncoes;
  DBGrid1.DataSource := dtmColaborador.dsFuncao;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFuncoes.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (obFuncoes.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadFuncoes.FormShow(Sender: TObject);
begin
  TabSheet4.TabVisible := false;
  DBGrid1.DataSource := dtmColaborador.dsFuncao;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TfrmCadFuncoes.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadFuncoes.qrpFuncoesPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Funçoes Cadastradas');
end;

procedure TfrmCadFuncoes.SpeedButton1Click(Sender: TObject);
begin
  if (obFuncoes.dataSet.FieldByName('ATIVO').AsInteger <> 1) then
    exit;
  if vDadosIni.PesqPros('COL020', 'EDITANDO REGISTRO', '', 'FUNCOES', obFuncoes.dataSet.FieldByName('COD_FUNCAO').AsString, obFuncoes.buscas, true) then
  begin
    if obFuncoes.Edit then
    begin
      inherited;
      obFuncoes.dataSet.FieldByName('DESC_FUNCAO').AsString := trim(obFuncoes.dataSet.FieldByName('DESC_FUNCAO').AsString);
      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := TabSheet3;
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmCadFuncoes.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('COL023', 'ABRIR A LIXEIRA', '', 'FUNCOES', '', obFuncoes.buscas, true) then
  begin
    if not obFuncoes.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [COL021]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [COL021]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TfrmCadFuncoes.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
  try
    obFuncoes.Delete;
    vStatusLixeira := obFuncoes.StatusLixeira;
	  lixeiraVazia(not vStatusLixeira);
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obFuncoes.Cancel;
      obFuncoes.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadFuncoes.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('COL022', 'IMPRIMIR FUNÇÕES', '', 'FUNCOES', '', obFuncoes.buscas, true) then
  begin
    inherited;
    obFuncoes.RelatorioFuncoes;
  end;
end;

procedure TfrmCadFuncoes.SpeedButton5Click(Sender: TObject);
begin
  if not obFuncoes.RestaurarLixeira then
  	Exit;

  if obFuncoes.StatusLixeira then
  	lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

end.

