unit UcadTransportador;

interface

uses
  Windows, uClassesCadastrosBasicos, QRCtrls, grimgctrl, QuickRpt,
  DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids, Controls,
  StdCtrls, Mask, Forms, Classes, AppEvnts, Graphics, uDataSet_OOP,
  uCadPadraoModal;

type
  TfrmCadTransportador = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Transportador: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    lkCidadesIbge: TDBLookupComboBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosTransportadorClick: TMenuItem;
    DesmarcarTodosTransportadorClick: TMenuItem;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DesmarcarTodosTransportadorClickClick(Sender: TObject);
    procedure MarcarTodosTransportadorClickClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure lkCidadesIbgeExit(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    cidadeIBGE: TDadosLookUp_OOP;
  public
    { Public declarations }
  end;

var
  frmCadTransportador: TfrmCadTransportador;
  obTransportador: TTransportador;

implementation

uses
  UdtmCadastrosBasicos, uDtmAtivo, uDtmConsultas, DB, hw_utils, SysUtils;

{$R *.dfm}

procedure TfrmCadTransportador.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS100]';
  if MaskEdit2.Visible then
  begin
    if not obTransportador.ConsultaCampos('Transportador', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not obTransportador.ConsultaCampos('Transportador', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  obTransportador.ultimasql := obTransportador.dataset.CommandText;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadTransportador.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS098', 'INSERINDO NOVO REGISTRO', '', 'TRANSPORTADOR', '', obTransportador.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if obTransportador.Insert then
      begin
        cidadeIBGE.setDadosDataSet('id', 'cidade;estado', obTransportador.GetCidadesIbgeDS(1), lkCidadesIbge);

        TabSheet3.Caption := 'Cadastro Transportador';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;
        if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        	DBEdit3.SetFocus;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadTransportador.BitBtn4Click(Sender: TObject);
begin
  ActiveControl := BitBtn4;
  if not obTransportador.Post then
    setFocusCampoErro(obTransportador.vNomeCampoErro, obTransportador.vMensagemErro)
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obTransportador.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        	DBEdit3.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadTransportador.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS104', 'CANCELAR', '', 'TRANSPORTADOR', '', obTransportador.buscas, true) then
//  if vDadosIni.PesqPros('BAS104', '', obTransportador.buscas, true) then
//  begin
//    try
//      Screen.Cursor := crHourGlass;
      inherited;
      PageControl1.ActivePage := TabSheet2;
      obTransportador.Cancel;
      obTransportador.RollBackTransacao;
//    finally
//      Screen.Cursor := crDefault;
//    end;
//  end;
end;

procedure TfrmCadTransportador.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obTransportador._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadTransportador.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obTransportador._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadTransportador.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadTransportador.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    obTransportador._marcaDesmarcaLinha;
end;

procedure TfrmCadTransportador.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCadTransportador.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    if not obTransportador.dataSet.IsEmpty then
      obTransportador._marcaDesmarcaLinha;
end;

procedure TfrmCadTransportador.DesmarcarTodosTransportadorClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obTransportador._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadTransportador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cidadeIBGE.Free;
  Action := caFree;
  frmCadTransportador := nil;
end;

procedure TfrmCadTransportador.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obTransportador := TTransportador.create;
  TabSheet4.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  obTransportador.abreTransportador;
  cidadeIBGE := TDadosLookUp_OOP.create;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadTransportador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn5Click(sender);

  if key = VK_INSERT then
    BitBtn3Click(sender);
end;

procedure TfrmCadTransportador.FormShow(Sender: TObject);
var
  I: integer;
begin
	if vShow <> 1 then
  begin
  	DBGrid1.DataSource := DtmCadBasicos.dsTransportador;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).CharCase := ecUpperCase;

    if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;

  if obTransportador.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadTransportador.lkCidadesIbgeExit(Sender: TObject);
begin
  inherited;
  obTransportador.HandleUF;
  if obTransportador.LastError <> '' then
    ShowAtencao(obTransportador.LastError);  
end;

procedure TfrmCadTransportador.MarcarTodosTransportadorClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obTransportador._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadTransportador.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relação de transportadores');
end;

procedure TfrmCadTransportador.SpeedButton1Click(Sender: TObject);
begin
  if obTransportador.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  if not obTransportador.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BAS099', 'EDITANDO REGISTRO', '', 'TRANSPORTADOR', obTransportador.dataSet.FieldByName('CODIGO_TR').AsString, obTransportador.buscas, true) then
    begin
      inherited;
      if not obTransportador.Edit then
        exit;

      if obTransportador.LastError <> '' then
        ShowAtencao(obTransportador.LastError);

        cidadeIBGE.setDadosDataSet('id', 'cidade;estado', obTransportador.GetCidadesIbgeDS(1), lkCidadesIbge);

      PageControl1.ActivePage := TabSheet1;
      TabSheet3.TabVisible := True;
      TabSheet3.Caption := 'Alterando Transportador';
      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      	DBEdit3.SetFocus;
      obTransportador.vUF.abreUF;
    end;
end;

procedure TfrmCadTransportador.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS101', 'ABRIR A LIXEIRA', '', 'TRANSPORTADOR', '', obTransportador.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not obTransportador.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS100]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS100]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
      obTransportador.ultimasql := obTransportador.dataset.CommandText;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadTransportador.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;
    if not obTransportador.Delete then
      Exit;

    vStatusLixeira := obTransportador.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
      
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obTransportador.Cancel;
      obTransportador.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadTransportador.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS105', 'IMPRIMIR', '', 'TRANSPORTADOR', '', obTransportador.buscas, true) then
  begin
    inherited;
    QuickRep1.Preview;
  end;
end;

procedure TfrmCadTransportador.SpeedButton5Click(Sender: TObject);
begin
  if not obTransportador.restaurarRegistro then
  	Exit;

  if obTransportador.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

end.

