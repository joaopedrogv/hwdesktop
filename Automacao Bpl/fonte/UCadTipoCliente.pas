unit UCadTipoCliente;

interface

uses
  Windows, uCadPadrao, DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, Controls, StdCtrls, Mask, Forms, Classes, UClassesClientes, AppEvnts,UcadPadraoModal,
  Graphics;

type
  TFrmCadTipoCliente = class(TfrmCadPadraoM)
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
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
  FrmCadTipoCliente: TFrmCadTipoCliente;
  TipoCli: TTipoCliente;

implementation

uses UDtmClientes, uDtmAtivo, uDadosIni, hw_utils, SysUtils;

{$R *.dfm}

procedure TFrmCadTipoCliente.BitBtn1Click(Sender: TObject);
begin
SpeedButton2.Hint := 'Enviar para Lixeira -  [CLI094]';
  if vDadosIni.PesqPros('CLI090', 'PESQUISAR', '', 'TIPOS_CLIENTES', '', TipoCli.buscas, true) then
//  if vDadosIni.PesqPros('CLI090', '', TipoCli.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not TipoCli.ConsultaCampos('TIPOS_CLIENTES', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	combobox1.setfocus;
    end
    else if not TipoCli.ConsultaCampos('TIPOS_CLIENTES', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          combobox1.setfocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    TipoCli.ultimasql := TipoCli.dataSet.CommandText;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadTipoCliente.BitBtn3Click(Sender: TObject);
begin      
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;

  if vDadosIni.PesqPros('CLI091', 'INCLUINDO TIPO CLIENTE', '', 'TIPOS_CLIENTES', '', TipoCli.buscas, true) then
//  if vDadosIni.PesqPros('CLI091', '', TipoCli.buscas, true) then
  begin
    inherited;
    if not TipoCli.Insert then
      Exit;

    TipoCli.PreencheCampos;
    TabSheet3.Caption := 'Cadastrar Tipos de Clientes / Fornecedores';
    TabSheet3.TabVisible := true;
    TabSheet3.Show;
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end;
end;

procedure TFrmCadTipoCliente.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not TipoCli.Post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(TipoCli.vNomeCampoErro, TipoCli.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if TipoCli.Insert then
      begin
        TipoCli.PreencheCampos;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end
      else
      begin
        CheckCadSeq.Checked := false;
        TipoCli.Cancel;
        inherited;
        exit;
      end;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadTipoCliente.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('CLI098', 'CANCELAR DITIGACAO', '', 'TIPOS_CLIENTES',TipoCli.dataSet.FieldByName('CODIGO_TIPO').AsString, TipoCli.buscas, true) then
//  if vDadosIni.PesqPros('CLI098', TipoCli.dataSet.FieldByName('CODIGO_TIPO').AsString, TipoCli.buscas, true) then
//  begin
    TipoCli.Cancel;
    TipoCli.RollBackTransacao;
    TabSheet2.show;
    inherited;
//  end;
end;

procedure TFrmCadTipoCliente.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    TipoCli._marcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoCliente.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    TipoCli._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoCliente.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	TipoCli._marcaDesmarcaLinha;
end;

procedure TFrmCadTipoCliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TipoCli.dataSet.FieldByName('SEL').AsString = 'S' then
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

procedure TFrmCadTipoCliente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_SPACE) then
  	TipoCli._marcaDesmarcaLinha
  else if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TFrmCadTipoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipoCli.Cancel;
  TipoCli.RollBackTransacao;
  TipoCli.free;
  Action := caFree;
  FrmCadTipoCliente := nil;
end;

procedure TFrmCadTipoCliente.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  TipoCli := TTipoCliente.Create;
  TipoCli.abreTipoCliente;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadTipoCliente.FormKeyDown(Sender: TObject; var Key: Word;
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
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end
end;

procedure TFrmCadTipoCliente.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmClientes.dsTipoCliente;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadTipoCliente.SpeedButton1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI092', 'EDITANDO TIPO CLIENTE', '', 'TIPOS_CLIENTES', TipoCli.dataSet.FieldByName('CODIGO_TIPO').AsString, TipoCli.buscas, true) then
//  if vDadosIni.PesqPros('CLI092', TipoCli.dataSet.FieldByName('CODIGO_TIPO').AsString, TipoCli.buscas, true) then
  begin
    inherited;
    if not TipoCli.dataSet.IsEmpty then
    begin
      if TipoCli.dataSet.FieldByName('ATIVO').AsInteger = 1 then
      begin
      	if not TipoCli.Edit then
          Exit;

        TipoCli.dataSet.FieldByName('DESCRICAO_TIPO').AsString := trim(TipoCli.dataSet.FieldByName('DESCRICAO_TIPO').AsString);
        TipoCli.dataSet.FieldByName('OBSERVACAO_T').AsString := trim(TipoCli.dataSet.FieldByName('OBSERVACAO_T').AsString);
        TipoCli.PreencheCampos;

        PageControl1.ActivePage := TabSheet1;
        TabSheet1.Show;
        TabSheet3.Caption := 'Alterar Tipos de Clientes / Fornecedores';
        TabSheet3.TabVisible := true;
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
       	  DBEdit2.SetFocus;
      end
      else
        Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

procedure TFrmCadTipoCliente.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI096', 'ABRIR A LIXEIRA', '', 'TIPOS_CLIENTES', '', TipoCli.buscas, true) then
  begin
    inherited;
    if not TipoCli.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [CLI094]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [CLI093]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadTipoCliente.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
  try
    TipoCli.Delete;
    vStatusLixeira := TipoCli.StatusLixeira;
	  lixeiraVazia(not vStatusLixeira);
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      TipoCli.Cancel;
      TipoCli.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadTipoCliente.SpeedButton5Click(Sender: TObject);
begin
  if not TipoCli.RestaurarRegistro then
  	Exit;

  if TipoCli.StatusLixeira then
  	lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadTipoCliente.TabSheet2Show(Sender: TObject);
begin
  inherited;
//  if TipoCli.StatusLixeira(false) then
//    SpeedButton25.Visible := true
//  else
//    SpeedButton25.Visible := false;
  SpeedButton25.Visible := TipoCli.StatusLixeira;
end;

end.

