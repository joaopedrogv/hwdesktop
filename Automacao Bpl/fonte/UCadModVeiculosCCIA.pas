unit UCadModVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, Buttons, Grids, DBGrids, StdCtrls, Mask,
  ComCtrls, uDtmAtivo, uDtmVeiculosCCIA, DBCtrls, UClassesVeiculosCCIA, db, uDadosIni,
  AppEvnts;

type
  TFrmCadModVeiculosCCIA = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    TabSheet5: TTabSheet;
    ScrollBox5: TScrollBox;
    TabSheet6: TTabSheet;
    ScrollBox6: TScrollBox;
    tsCodigoFab: TTabSheet;
    ScrollBox7: TScrollBox;
    TabSheet7: TTabSheet;
    GroupBox8: TGroupBox;
    Panel5: TPanel;
    Label14: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label273: TLabel;
    Label274: TLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit27: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBComboBox6: TDBComboBox;
    DBEdit43: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBComboBox4: TDBComboBox;
    DBEdit46: TDBEdit;
    DBEdit188: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit18: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    DBComboBox5: TDBComboBox;
    DBEdit187: TDBEdit;
    DBEdit14: TDBEdit;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    GroupBox17: TGroupBox;
    BitBtn_Novo_Tab: TBitBtn;
    BitBtn_Alterar_Tab: TBitBtn;
    BitBtn_Salvar_Tab: TBitBtn;
    BitBtn_Cancelar_Tab: TBitBtn;
    BitBtn_Excluir_Tab: TBitBtn;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox9: TGroupBox;
    DBText27: TDBText;
    Label10: TLabel;
    ScrollBox8: TScrollBox;
    GroupBox10: TGroupBox;
    Panel8: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit21: TDBEdit;
    DBComboBox2: TDBComboBox;
    GroupBox11: TGroupBox;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    GroupBox6: TGroupBox;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    GroupBox7: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn11: TBitBtn;
    GroupBox12: TGroupBox;
    DBText1: TDBText;
    Label18: TLabel;
    SpeedButton9: TSpeedButton;
    Label24: TLabel;
    DBEdit22: TDBEdit;
    TabSheet8: TTabSheet;
    ScrollBox9: TScrollBox;
    GroupBox13: TGroupBox;
    pnServicosSugeridos: TPanel;
    Panel9: TPanel;
    Label211: TLabel;
    Label212: TLabel;
    DBGrid4: TDBGrid;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    SpeedButton40: TSpeedButton;
    procedure SpeedButton40Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btSelectAllClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure BitBtn_Excluir_TabClick(Sender: TObject);
    procedure BitBtn_Cancelar_TabClick(Sender: TObject);
    procedure BitBtn_Salvar_TabClick(Sender: TObject);
    procedure BitBtn_Alterar_TabClick(Sender: TObject);
    procedure BitBtn_Novo_TabClick(Sender: TObject);
    procedure DBEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit43KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit13KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit26KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit29KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit28KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit12KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit28Exit(Sender: TObject);
    procedure DBComboBox_ModeloRenavamKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox_EspecieRenavamKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string): Boolean;
    procedure _HabilitarCamposTabPreco;
    procedure _DesabilitarCamposTabPreco;
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  FrmCadModVeiculosCCIA: TFrmCadModVeiculosCCIA;
  ModVeiculo: TModVeiculoCCIA;

implementation

uses
  DBClient, UClassesCadastrosBasicos, uDataSet_OOP;

{$R *.dfm}

procedure TFrmCadModVeiculosCCIA.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI094', 'APAGAR', 'CODIGO: ' + ModVeiculo.vCodFab.dataSet.FieldByName('CODIGO_FAB').AsString, 'TIPMODELO_CODIGOFAB', ModVeiculo.dataSet.FieldByName('CODIGO').AsString, ModVeiculo.buscas, true) then
    Exit;
  ModVeiculo.vCodFab.Delete;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI005', 'CONSULTA', '', 'TIPMODELO', '',
    ModVeiculo.buscas, true) then
    Exit;

  SpeedButton2.Hint := 'Enviar para Lixeira - [VEI015]';

  if MaskEdit2.Visible then
  begin
    if not ModVeiculo.ConsultaCampos('TIPMODELO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not ModVeiculo.ConsultaCampos('TIPMODELO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;
        
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if ModVeiculo.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
  ModVeiculo.ultimasql := ModVeiculo.dataset.CommandText;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
	if not vDadosIni.PesqPros('VEI013', 'INCLUIR', '', 'TIPMODELO', '', ModVeiculo.buscas, true) then
    exit;
  try
    Screen.Cursor := crHourGlass;
    if not ModVeiculo.Insert then
      Exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    ActiveControl := BitBtn3;
    inherited;

    SpeedButton9.Visible := false;
    DBEdit25.Enabled := true;
    label14.Visible := false;
    DBEdit1.Visible := false;
    TabSheet4.TabVisible := true;
    TabSheet5.TabVisible := false;
    tsCodigoFab.TabVisible := false;
    PageControl3.ActivePage := TabSheet4;
    TabSheet4Show(Sender);
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
  try
  	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    	BitBtn4.SetFocus;
    if not vDadosIni.PesqPros('VEI018', 'SALVAR', '', 'TIPMODELO',
      ModVeiculo.dataSet.FieldByName('CODIGO').AsString, ModVeiculo.buscas, true) then
      exit;
    Screen.Cursor := crHourGlass;
    if not ModVeiculo.Post then
    begin
      setFocusCampoErro(ModVeiculo.vNomeCampoErro, ModVeiculo.vMensagemErro);
      exit;
    end
    else
    begin
      if CheckCadSeq.Checked then
      begin
        if ModVeiculo.Insert then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
        MudaCor;
      end
      else
        inherited;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn5Click(Sender: TObject);
begin
  ActiveControl := BitBtn5;
  PageControl1.ActivePage := TabSheet2;
  ModVeiculo.Cancel;
  ModVeiculo.RollBackTransacao;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn7Click(Sender: TObject);
var
  vCodigoFab: string;
begin
  inherited;

  if not vDadosIni.PesqPros('VEI093', 'INCLUIR', '', 'TIPMODELO_CODIGOFAB', '', ModVeiculo.buscas, true) then
    Exit;
  vCodigoFab := '';
  if not InputQuery('Codigo do Fabricante', 'Informe o código do fabricante que vem no XML da NF-e', vCodigoFab) then
    Exit;

  if Trim(vCodigoFab) = '' then
    Exit;

  ModVeiculo.vCodFab.insereCodigoFab(ModVeiculo.dataSet.FieldByName('codigo').AsInteger, vCodigoFab);
  ModVeiculo.vCodFab.abreCodigo(ModVeiculo.dataSet.FieldByName('codigo').AsInteger);
end;

procedure TFrmCadModVeiculosCCIA.BitBtn_Alterar_TabClick(Sender: TObject);
begin
  inherited;
  if ModVeiculo.vTabPreco.dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VEI090', 'EDITAR', '', 'TABPRECO_VEICULO',
    ModVeiculo.dataSet.FieldByName('CODIGO').AsString, ModVeiculo.buscas, true) then
    Exit;
  if ModVeiculo.vTabPreco.Edit then
  begin
    _HabilitarCamposTabPreco;
    if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      DBEdit6.SetFocus;
  end;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn_Cancelar_TabClick(Sender: TObject);
begin
  inherited;
   ModVeiculo.vTabPreco.Cancel;
  _DesabilitarCamposTabPreco;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn_Excluir_TabClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI092', 'APAGAR', '', 'TABPRECO_VEICULO', '', ModVeiculo.buscas, true) then
    Exit;
  ModVeiculo.vTabPreco.Delete;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn_Novo_TabClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI091', 'INCLUIR', '', 'TABPRECO_VEICULO', '', ModVeiculo.buscas, true) then
    Exit;
  if ModVeiculo.vTabPreco.Insert(ModVeiculo) then
  begin
    _HabilitarCamposTabPreco;
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus;
  end;
end;

procedure TFrmCadModVeiculosCCIA.BitBtn_Salvar_TabClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI089', 'GRAVAR', '', 'TABPRECO_VEICULO', '', ModVeiculo.buscas, true) then
    Exit;
  if not ModVeiculo.vTabPreco.Post then
  begin
    setFocusCampoErro(ModVeiculo.vTabPreco.vNomeCampoErro, ModVeiculo.vTabPreco.vMensagemErro);
    exit;
  end;

  _DesabilitarCamposTabPreco;
   if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo_Tab.CanFocus) then
    BitBtn_Novo_Tab.SetFocus;
end;

procedure TFrmCadModVeiculosCCIA.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    ModVeiculo._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadModVeiculosCCIA.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    ModVeiculo._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadModVeiculosCCIA.DBComboBox_ModeloRenavamKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> '0') and (UpperCase(key) <> '2') and (UpperCase(key) <> '3')
    and (UpperCase(key) <> '3') and (UpperCase(key) <> '4') and (UpperCase(key) <> '5') then
    key := #0;
end;

procedure TFrmCadModVeiculosCCIA.DBComboBox_EspecieRenavamKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> '0') and (UpperCase(key) <> '1') and (UpperCase(key) <> '2') and (UpperCase(key) <> '3') then
    key := #0;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit12KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit13KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit14KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)  then
    Exit;
  
  if (not ModVeiculo.validaNCM) and (ModVeiculo.dataSet.State in [dsInsert, dsEdit]) then
  begin
    Application.MessageBox('NCM informado não encontrado no cadastro', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
    		DBEdit16.SetFocus;
  end;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      ModVeiculo.dataSet.FieldByName('NCMSH').AsString := Trim(vDadosIni.pesquisaRapida('NBM'));
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadModVeiculosCCIA.DBEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vMarcaVeic: TMarcas;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD',
        ' AND TIPO_MARCA =''V''', 'Consulta de Marcas');
      if vDadosIni.vPesquisa <> '' then
        ModVeiculo.dataSet.FieldByName('COD_MARCA').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadMarcas') then
      exit;
    ModVeiculo.AbrirMarca;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        ModVeiculo.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
        ModVeiculo.vMarcaVeic._AbreMarca;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit26KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit28Exit(Sender: TObject);
begin
  inherited;
  ModVeiculo.dataSet.FieldByName('PISCOFINS').AsCurrency := ModVeiculo.dataSet.FieldByName('VALOR_PIS').AsCurrency + ModVeiculo.dataSet.FieldByName('VALOR_COFINS').AsCurrency;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit28KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit29KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TFrmCadModVeiculosCCIA.DBEdit43KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      ModVeiculo.dataSet.FieldByName('COD_COMBUSTIVEL').AsString := vDadosIni.pesquisaRapida('TP_COMB_RENAVAM');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadCombustivel') then
      exit;
    ModVeiculo.AbrirCombustivel;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        ModVeiculo.dataSet.FieldByName('COD_COMBUSTIVEL').AsString := vDadosIni.vPesquisa;
        ModVeiculo.vCombustivelVeic.abreTipoCombustiveis;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TFrmCadModVeiculosCCIA.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    ModVeiculo._marcaDesmarcaLinha;
end;

procedure TFrmCadModVeiculosCCIA.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmCadModVeiculosCCIA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    if not ModVeiculo.dataSet.IsEmpty then
      ModVeiculo._marcaDesmarcaLinha;
end;

procedure TFrmCadModVeiculosCCIA.DBGrid4CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	if not ModVeiculo.vServicosSugeridos.dataSet.IsEmpty then
	   	ModVeiculo.vServicosSugeridos._marcaDesmarcaLinha;
end;

procedure TFrmCadModVeiculosCCIA.DBGrid4DblClick(Sender: TObject);
begin
  if not ModVeiculo.vServicosSugeridos.dataSet.IsEmpty then
   	ModVeiculo.vServicosSugeridos._marcaDesmarcaLinha;
end;

procedure TFrmCadModVeiculosCCIA.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
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

procedure TFrmCadModVeiculosCCIA.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
		ModVeiculo.vServicosSugeridos._marcaDesmarcaLinha
  else if Key = VK_F2 then
  	ModVeiculo.vServicosSugeridos._marcarLinha
  else if Key = VK_F3 then
  	ModVeiculo.vServicosSugeridos._desmarcarLinha;
end;

procedure TFrmCadModVeiculosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ModVeiculo.Cancel;
  ModVeiculo.RollBackTransacao;
  Action := caFree;
  FrmCadModVeiculosCCIA := nil;
end;

procedure TFrmCadModVeiculosCCIA.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'MODVEICULO' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    FrmCadModVeiculosCCIA := TFrmCadModVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'MODVEICULOSCAD' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
    FrmCadModVeiculosCCIA := TFrmCadModVeiculosCCIA(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  ModVeiculo := TModVeiculoCCIA.create;
  ModVeiculo.abreModelos(0);
  PageControl3.TabIndex := 1;
  TabSheet6.TabVisible := false;
  TabSheet4.TabVisible := False;
  TabSheet7.TabVisible := vDadosIni.vEmp.vInfRedLucro = 'S';
	TabSheet8.TabVisible := (vDadosIni.vEmp.vUsarAparelho <> 'S') and (vDadosIni.vSugServico.vHabilitarSug);
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadModVeiculosCCIA.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (ModVeiculo.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TFrmCadModVeiculosCCIA.FormResize(Sender: TObject);
begin
  inherited;
//  if (ScrollBox3.Height >= alturaForm) and (ScrollBox3.Width >= larguraForm) then
//  begin
//    panel5.Align := alClient;
//  end
//  else
//  begin
//    if ScrollBox3.Height <= alturaForm then
//    begin
//      panel5.Align := alNone;
//      panel5.Height := alturaDefault;
//    end;
//    if ScrollBox3.Width <= larguraForm then
//    begin
//      begin
//        panel5.Align := alNone;
//        panel5.Width := larguraDefault;
//      end;
//    end;
//  end;
end;

procedure TFrmCadModVeiculosCCIA.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;
    
	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'MODVEICULO' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    FrmCadModVeiculosCCIA := TFrmCadModVeiculosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'MODVEICULOSCAD' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
    FrmCadModVeiculosCCIA := TFrmCadModVeiculosCCIA(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmVeiculosCCIA.dsModVeiculos;
    if vCriou = 0 then
    begin
      inherited;
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    end;
  end;

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else if (TelaCadastro = 6) then
    BitBtn3Click(Sender)
  else if (TelaCadastro = 7) then
  begin
    BitBtn3Click(Sender);
    if ModVeiculo.dataSet.State in [dsInsert, dsEdit] then
      ModVeiculo.buscarModelo(StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3)), StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4)));
  end;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "BAS407" PERMITIR INCLUIR/ALTERAR MODVEICULOS SEM INFORMAR SERVICO';

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadModVeiculosCCIA.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if PageControl3.ActivePage = TabSheet5 then
  begin
    if ModVeiculo.dataSet.State = dsEdit then
    begin
      ModVeiculo.vTabPreco._AbreTabPrecoVeic(ModVeiculo);
      _DesabilitarCamposTabPreco;

      if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo_Tab.CanFocus) then
      	if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo_Tab.CanFocus) then
        	BitBtn_Novo_Tab.SetFocus;
    end;
  end;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TFrmCadModVeiculosCCIA.SpeedButton1Click(Sender: TObject);
var
  VendaEstoque, EspecieRenavam: char;
  ModeloRenavam: string;
  I: Integer;
begin
	if ModVeiculo.dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VEI014', 'EDITAR', '', 'TIPMODELO',
    ModVeiculo.dataSet.FieldByName('CODIGO').AsString, ModVeiculo.buscas, true) then
    exit;

  try
    Screen.Cursor := crHourGlass;

    if not ModVeiculo.Edit then
      exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    inherited;
    SpeedButton9.Visible := true;
    DBEdit25.Enabled := false;
    PageControl1.ActivePage := TabSheet1;
    TabSheet4.TabVisible := true;
    TabSheet5.TabVisible := true;
    tsCodigoFab.TabVisible := true;
    PageControl3.ActivePage := TabSheet4;
    DBEdit1.Visible := true;
    label14.Visible := true;
    TabSheet4Show(Sender);
    if not (ModVeiculo.dataSet.FieldByName('LOTACAO').isNull) then
      DBComboBox4.ItemIndex := DBComboBox4.Items.IndexOf(trim(ModVeiculo.dataSet.FieldByName('LOTACAO').AsString));

    if trim(ModVeiculo.dataSet.FieldByName('VNDESTOQUE').AsString) <> '' then
    begin
      VendaEstoque := ModVeiculo.dataSet.FieldByName('VNDESTOQUE').asstring[1];
      case VendaEstoque of
        'S': DBComboBox1.ItemIndex := 0;
        'N': DBComboBox1.ItemIndex := 1;
      end;
    end;
    if (Length(trim(ModVeiculo.dataSet.FieldByName('TIP_VEICULO').AsString)) = 2) then
    begin
      ModeloRenavam := ModVeiculo.dataSet.FieldByName('TIP_VEICULO').asstring;
      if (trim(ModeloRenavam)) = '02' then DBComboBox5.ItemIndex := 0
      else if (trim(ModeloRenavam)) = '03' then DBComboBox5.ItemIndex := 1
      else if (trim(ModeloRenavam)) = '04' then DBComboBox5.ItemIndex := 2
      else if (trim(ModeloRenavam)) = '05' then DBComboBox5.ItemIndex := 3
      else if (trim(ModeloRenavam)) = '06' then DBComboBox5.ItemIndex := 4
      else if (trim(ModeloRenavam)) = '07' then DBComboBox5.ItemIndex := 5
      else if (trim(ModeloRenavam)) = '08' then DBComboBox5.ItemIndex := 6
      else if (trim(ModeloRenavam)) = '10' then DBComboBox5.ItemIndex := 7
      else if (trim(ModeloRenavam)) = '11' then DBComboBox5.ItemIndex := 8
      else if (trim(ModeloRenavam)) = '13' then DBComboBox5.ItemIndex := 9
      else if (trim(ModeloRenavam)) = '14' then DBComboBox5.ItemIndex := 10
      else if (trim(ModeloRenavam)) = '17' then DBComboBox5.ItemIndex := 11
      else if (trim(ModeloRenavam)) = '18' then DBComboBox5.ItemIndex := 12
      else if (trim(ModeloRenavam)) = '19' then DBComboBox5.ItemIndex := 13
      else if (trim(ModeloRenavam)) = '20' then DBComboBox5.ItemIndex := 14
      else if (trim(ModeloRenavam)) = '21' then DBComboBox5.ItemIndex := 15
      else if (trim(ModeloRenavam)) = '22' then DBComboBox5.ItemIndex := 16
      else if (trim(ModeloRenavam)) = '23' then DBComboBox5.ItemIndex := 17
      else if (trim(ModeloRenavam)) = '25' then DBComboBox5.ItemIndex := 18
      else if (trim(ModeloRenavam)) = '26' then DBComboBox5.ItemIndex := 19;
    end;
    if (Length(trim(ModVeiculo.dataSet.FieldByName('ESPRENAVAM').AsString)) = 2) then
    begin
      EspecieRenavam := ModVeiculo.dataSet.FieldByName('ESPRENAVAM').asstring[2];
      case EspecieRenavam of
        '1': DBComboBox6.ItemIndex := 0;
        '2': DBComboBox6.ItemIndex := 1;
        '3': DBComboBox6.ItemIndex := 2;
        '4': DBComboBox6.ItemIndex := 3;
        '5': DBComboBox6.ItemIndex := 4;
        '6': DBComboBox6.ItemIndex := 5;
      end;
    end;
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadModVeiculosCCIA.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('VEI016', 'ABRIR A LIXEIRA', '', 'TIPMODELO', '', ModVeiculo.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not ModVeiculo.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira - [VEI015]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente - [VEI019]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadModVeiculosCCIA.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  try
    inherited;
    if not ModVeiculo.Delete then
      exit;
      
    vStatusLixeira := ModVeiculo.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    ModVeiculo.Cancel;
    ModVeiculo.RollBackTransacao;
  end;
end;

procedure TFrmCadModVeiculosCCIA.SpeedButton40Click(Sender: TObject);
begin
  vDadosIni.configurarSistema('vei_%', ModVeiculo.buscas);
end;

procedure TFrmCadModVeiculosCCIA.SpeedButton5Click(Sender: TObject);
begin
  if not ModVeiculo.restaurarRegistro then
  	Exit;

  if ModVeiculo.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadModVeiculosCCIA.SpeedButton9Click(Sender: TObject);
var
 vOrdem, vOrdemOld: string;
begin
   if not vDadosIni.PesqPros('VEI164', 'ALTERAR', '', 'TIPMODELO', ModVeiculo.dataSet.FieldByName('CODIGO').AsString,
      ModVeiculo.buscas, true) then
     exit;

   vOrdemOld := ModVeiculo.dataSet.FieldByName('ORDTIPO').AsString;
   vOrdem := ModVeiculo.dataSet.FieldByName('ORDTIPO').AsString;

   if InputQuery('Informe um Valor', 'Informe a Ordem de Impressão', vOrdem) then
   begin
      try
        StrToInt(vOrdem)
      except
        Application.MessageBox('Ordem de Impressão Inválida', 'Atenção', 0 + 64);
        Exit;
      end;

      if StrToFloat(vOrdem) < 0 then
      begin
        Application.MessageBox('Ordem de Impressão não informado', 'Atenção', 0 + 64);
        Exit;
      end;
   end
   else
   begin
     Application.MessageBox('Ordem de Impressão não informado', 'Atenção', 0 + 64);
     Exit;
   end;

   if ModVeiculo.dataSet.State in [dsInsert, dsEdit] then
     ModVeiculo.dataSet.FieldByName('ORDTIPO').AsString := vOrdem;

   vDadosIni.GravaAuditoria('VEI164', 'ALTERAR', 'ANT: ' + vOrdemOld + ' NOVA: ' + vOrdem,
     'EST_MOTO', ModVeiculo.dataSet.FieldByName('CODIGO').AsString, ModVeiculo.buscas);

//   ModVeiculo.alterarOrdemImpressao(StrToInt(vOrdem));
end;

procedure TFrmCadModVeiculosCCIA.TabSheet2Show(Sender: TObject);
begin
  inherited;
	if ModVeiculo.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

procedure TFrmCadModVeiculosCCIA.TabSheet4Show(Sender: TObject);
begin
  inherited;
  //  panel5.Align := alClient;
  if ModVeiculo.dataset.state = dsEdit then
    TabSheet4.Caption := 'Alterando Modelo de Veículo'
  else
    TabSheet4.Caption := 'Cadastrando Modelo de Veículo';
end;

procedure TFrmCadModVeiculosCCIA._DesabilitarCamposTabPreco;
begin
  BitBtn_Novo_Tab.Enabled := true;
  BitBtn_Alterar_Tab.Enabled := true;
  BitBtn_Excluir_Tab.Enabled := true;
  BitBtn_Salvar_Tab.Enabled := false;
  BitBtn_Cancelar_Tab.Enabled := false;

  DBEdit3.Enabled := false;
  DBEdit5.Enabled := false;
  DBEdit6.Enabled := false;
  DBEdit7.Enabled := false;
  Label7.Enabled := true;
  Label8.Enabled := true;
end;

procedure TFrmCadModVeiculosCCIA._HabilitarCamposTabPreco;
begin
  BitBtn_Salvar_Tab.Enabled := true;
  BitBtn_Cancelar_Tab.Enabled := true;
  BitBtn_Novo_Tab.Enabled := false;
  BitBtn_Alterar_Tab.Enabled := false;
  BitBtn_Excluir_Tab.Enabled := false;

  DBEdit3.Enabled := not (ModVeiculo.vTabPreco.dataSet.State = dsEdit);
  DBEdit5.Enabled := not (ModVeiculo.vTabPreco.dataSet.State = dsEdit);
  DBEdit6.Enabled := true;
  DBEdit7.Enabled := true;

  Label7.Enabled := not (ModVeiculo.vTabPreco.dataSet.State = dsEdit);
  Label8.Enabled := not (ModVeiculo.vTabPreco.dataSet.State = dsEdit);
end;

function TFrmCadModVeiculosCCIA._mdiAberto(pNomeFormMDI: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

initialization
  RegisterClass(TFrmCadModVeiculosCCIA);
finalization
  UnRegisterClass(TFrmCadModVeiculosCCIA);

end.

