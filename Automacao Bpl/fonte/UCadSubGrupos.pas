unit UCadSubGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, Menus, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  ComCtrls, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, DBCtrls, DB,
  QRCtrls, QuickRpt, AppEvnts;

type
  TFrmCadSubGrupos = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBLCBGrupo: TDBLookupComboBox;
    Label9: TLabel;
    DBComboBox1: TDBComboBox;
    TabSheet4: TTabSheet;
    qrpSubGrupos: TQuickRep;
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
    QRLabel6: TQRLabel;
    QRSysData3: TQRSysData;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosSubGrupoClick: TMenuItem;
    DesmarcarTodasSubGrupo: TMenuItem;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DesmarcarTodasSubGrupoClick(Sender: TObject);
    procedure MarcarTodosSubGrupoClickClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure qrpSubGruposPreview(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn6Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    //    TelaCadastro: integer;
        { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadSubGrupos: TFrmCadSubGrupos;
  SubGrupo: TSubGrupos;
  Grupo: TGrupos;
  Produto: TProdutos;

implementation

{$R *.dfm}

procedure TFrmCadSubGrupos.BitBtn1Click(Sender: TObject);
begin
	SpeedButton2.Hint := 'Enviar para Lixeira - [PRO068]';

  if vDadosIni.PesqPros('PRO064', 'PESQUISAR', '','SUB_GRUPO', '', SubGrupo.buscas, true) then
  begin
    inherited;
    if not Grupo.Active then
      Grupo.abreGrupos;
    if MaskEdit2.Visible then
    begin
      if not SubGrupo.ConsultaCampos('SUB_GRUPO', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        	combobox1.setfocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
    end
    else if not SubGrupo.ConsultaCampos('SUB_GRUPO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      	combobox1.setfocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end;
end;

procedure TFrmCadSubGrupos.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO065', 'INCLUIR', '', 'SUB_GRUPO', '', SubGrupo.buscas, true) then
  	Exit;

  if not SubGrupo.Insert then
  	Exit;

  inherited;

  if not Grupo.Active then
    Grupo.abreGrupos;

  if not SubGrupo.Active then
    SubGrupo.abreSubGrupos;

  DBEdit1.Enabled := True;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;

  SubGrupo.PreencheCampos;

  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TFrmCadSubGrupos.BitBtn4Click(Sender: TObject);
begin
  if not SubGrupo.post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if SubGrupo.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadSubGrupos.BitBtn5Click(Sender: TObject);
begin
  ActiveControl := BitBtn5;
  PageControl1.ActivePage := TabSheet2;
//  if vDadosIni.PesqPros('PRO072', '', '', Grupo.buscas, true) then
//  begin
    SubGrupo.Cancel;
    SubGrupo.RollBackTransacao;
    inherited;
//  end;
end;

procedure TFrmCadSubGrupos.BitBtn6Exit(Sender: TObject);
begin
  inherited;
  //  if PageControl3.ActivePage = TabSheet3 then
  //    if (Self.Enabled) and (Self.Visible) and (DbEdit1.CanFocus) then
  //      DbEdit1.SetFocus;
end;

procedure TFrmCadSubGrupos.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    SubGrupo._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadSubGrupos.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    SubGrupo._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadSubGrupos.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox1.Text, 0, 1) = 'S') or (copy(DBComboBox1.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      	DBComboBox1.SetFocus;
    end;
end;

procedure TFrmCadSubGrupos.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if not SubGrupo.VerificaSubGrupo then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      	DBEdit1.SetFocus;
  end;
end;

procedure TFrmCadSubGrupos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    SubGrupo._marcaDesmarcaLinha;
end;

procedure TFrmCadSubGrupos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmCadSubGrupos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {if (key = VK_RETURN) and (vDadosIni.vTipoForm = 1) then
  begin
    vDadosIni.vPesquisa := inttostr(SubGrupo.dataSet.FieldByName('CODIGO_SUBGR').AsInteger);
    FrmCadSubGrupos.Close;
  end
  else }
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not SubGrupo.dataSet.IsEmpty then
      SubGrupo._marcaDesmarcaLinha;
end;

procedure TFrmCadSubGrupos.DBLCBGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO017', 'PESQUISAR', '', 'SUB_GRUPO', '', SubGrupo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        // vDadosIni.vPesquisa := inttostr(SubGrupo.dataSet.FieldByName('COD_GRUPO').AsInteger);
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRUPOS');
        if vDadosIni.vPesquisa <> '' then
          SubGrupo.dataSet.FieldByName('COD_GRUPO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO023', 'INCLUIR', '', 'GRUPOS', '', SubGrupo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Produto.CadGrupos(1); //Parametro 1 serve para indicar um novo cadastro.
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadSubGrupos.DesmarcarTodasSubGrupoClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    SubGrupo._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadSubGrupos.FormActivate(Sender: TObject);
begin
  inherited;
  //  WindowState:=wsMaximized;
end;

procedure TFrmCadSubGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SubGrupo.Cancel;
  SubGrupo.RollBackTransacao;
  SubGrupo.Destroy;
  Action := caFree;
  FrmCadSubGrupos := nil;
end;

procedure TFrmCadSubGrupos.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  SubGrupo := TSubGrupos.Create;
  Grupo := TGrupos.Create;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadSubGrupos.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (SubGrupo.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TFrmCadSubGrupos.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := dtmProdutos.dsSubGrupo;
  TabSheet4.TabVisible := false;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadSubGrupos.MarcarTodosSubGrupoClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    SubGrupo._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadSubGrupos.qrpSubGruposPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'SubGrupos de Produtos');
end;

procedure TFrmCadSubGrupos.SpeedButton1Click(Sender: TObject);
begin
  if SubGrupo.dataSet.IsEmpty then
  	Exit;

  if SubGrupo.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
  begin
  	Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    Exit;
  end;

  if not vDadosIni.PesqPros('PRO066', 'EDITAR', '', 'SUB_GRUPO', SubGrupo.dataSet.FieldByName('CODIGO_SUBGR').AsString, SubGrupo.buscas, true) then
    Exit;

  if not SubGrupo.Edit then
    Exit;

  inherited;

  if not SubGrupo.Active then
    SubGrupo.abreSubGrupos;

  DBEdit1.Enabled := False;
  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;

  SubGrupo.PreencheCampos;

  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;  
end;

procedure TFrmCadSubGrupos.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO070', 'ABRIR', '', 'SUB_GRUPO', '', SubGrupo.buscas, true) then
  begin
    if not SubGrupo.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [PRO068]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO067]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadSubGrupos.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    SubGrupo.Delete;
    vStatusLixeira := SubGrupo.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      SubGrupo.Cancel;
      SubGrupo.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadSubGrupos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO074', 'EMITINDO RELATÓRIO', '','SUB_GRUPO', SubGrupo.dataSet.FieldByName('CODIGO_SUBGR').AsString, SubGrupo.buscas, true) then
//  if vDadosIni.PesqPros('PRO074', '', SubGrupo.buscas, true) then
    SubGrupo.imprimirRelatoriodeSubGrupo;
end;

procedure TFrmCadSubGrupos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not SubGrupo.RestaurarRegistro then
    Exit;

  if SubGrupo.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadSubGrupos.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if SubGrupo.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

procedure TFrmCadSubGrupos.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

end.

