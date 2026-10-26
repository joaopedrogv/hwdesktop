unit UCadModVeiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, ExtCtrls, Menus, Buttons, Grids, DBGrids, StdCtrls, Mask,
  ComCtrls, uDtmAtivo, uDtmVeiculos, DBCtrls, UClassesVeiculos, db, uDadosIni,UCadPadraoModal,
  AppEvnts;

type
  TFrmCadModVeiculos = class(TfrmCadPadraoM)
    Panel4: TPanel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    Label19: TLabel;
    DBEdit18: TDBEdit;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    Label18: TLabel;
    DBEdit3: TDBEdit;
    Label24: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit19: TDBEdit;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    DBEdit17: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit13: TDBEdit;
    DBEdit11: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    DBComboBox1: TDBComboBox;
    Label61: TLabel;
    DBEdit50: TDBEdit;
    Label62: TLabel;
    DBComboBox5: TDBComboBox;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    Label67: TLabel;
    DBComboBox6: TDBComboBox;
    DBEdit23: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label30: TLabel;
    Label37: TLabel;
    DBEdit30: TDBEdit;
    Label35: TLabel;
    DBEdit28: TDBEdit;
    DBComboBox4: TDBComboBox;
    DBEdit29: TDBEdit;
    Label36: TLabel;
    Label31: TLabel;
    DBEdit9: TDBEdit;
    Label273: TLabel;
    Label274: TLabel;
    DBEdit187: TDBEdit;
    DBEdit188: TDBEdit;
    TabSheet4: TTabSheet;
    ScrollBox5: TScrollBox;
    GroupBox4: TGroupBox;
    DBText27: TDBText;
    Label32: TLabel;
    GroupBox17: TGroupBox;
    BitBtn_Novo_Tab: TBitBtn;
    BitBtn_Alterar_Tab: TBitBtn;
    BitBtn_Salvar_Tab: TBitBtn;
    BitBtn_Cancelar_Tab: TBitBtn;
    BitBtn_Excluir_Tab: TBitBtn;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    GroupBox5: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    TabSheet5: TTabSheet;
    ScrollBox4: TScrollBox;
    Panel6: TPanel;
    Label40: TLabel;
    DBEdit31: TDBEdit;
    Label41: TLabel;
    DBEdit32: TDBEdit;
    Label42: TLabel;
    DBEdit33: TDBEdit;
    Label43: TLabel;
    DBEdit34: TDBEdit;
    Label44: TLabel;
    DBEdit35: TDBEdit;
    tsCodigoFab: TTabSheet;
    ScrollBox6: TScrollBox;
    GroupBox6: TGroupBox;
    DBText1: TDBText;
    Label45: TLabel;
    GroupBox7: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn11: TBitBtn;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    TabSheet6: TTabSheet;
    ScrollBox7: TScrollBox;
    GroupBox8: TGroupBox;
    pnServicosSugeridos: TPanel;
    Panel8: TPanel;
    Label211: TLabel;
    Label212: TLabel;
    DBGrid4: TDBGrid;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosModVeiculosClick: TMenuItem;
    DesmarcarTodosModVeiculosClick: TMenuItem;
    SpeedButton40: TSpeedButton;
    procedure SpeedButton40Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DesmarcarTodosModVeiculosClickClick(Sender: TObject);
    procedure MarcarTodosModVeiculosClickClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn_Excluir_TabClick(Sender: TObject);
    procedure BitBtn_Salvar_TabClick(Sender: TObject);
    procedure BitBtn_Cancelar_TabClick(Sender: TObject);
    procedure BitBtn_Alterar_TabClick(Sender: TObject);
    procedure BitBtn_Novo_TabClick(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure DBEdit187KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit28Exit(Sender: TObject);
    procedure DBComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox6KeyPress(Sender: TObject; var Key: Char);
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
    procedure TabSheet3Show(Sender: TObject);
    procedure _HabilitarCamposTabPreco;
    procedure _DesabilitarCamposTabPreco;
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  FrmCadModVeiculos: TFrmCadModVeiculos;
  ModVeiculo: TModVeiculo;

implementation

{$R *.dfm}

procedure TFrmCadModVeiculos.BitBtn11Click(Sender: TObject);
begin
  inherited;
 if not vDadosIni.PesqPros('VEI094', 'APAGAR', 'CODIGO: ' + ModVeiculo.vCodFab.dataSet.FieldByName('CODIGO_FAB').AsString, 'TIPMODELO_CODIGOFAB', ModVeiculo.dataSet.FieldByName('CODIGO').AsString, ModVeiculo.buscas, true) then
    Exit;
  ModVeiculo.vCodFab.Delete;
end;

procedure TFrmCadModVeiculos.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira - [VEI015]';
  inherited;
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
  ModVeiculo.ultimasql := ModVeiculo.dataset.CommandText;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmCadModVeiculos.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.PesqPros('VEI013', 'INSERINDO NOVO REGISTRO', '', 'TIPMODELO', '', ModVeiculo.buscas, true) then
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
    TabSheet3.TabVisible := true;
    PageControl3.ActivePage := TabSheet3;
    TabSheet4.TabVisible := false;
    tsCodigoFab.TabVisible := false;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadModVeiculos.BitBtn4Click(Sender: TObject);
begin
  //  if not vDadosIni.PesqPros('VEI019', '', ModVeiculo.buscas, false) then
  //    exit;
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
  try
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
      else if TelaCadastro = 2 then
      begin
        TelaCadastro := 0;
        inherited;
        TelaCadastro := 2;
      end
      else
        inherited;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadModVeiculos.BitBtn5Click(Sender: TObject);
begin
  ActiveControl := BitBtn5;
  PageControl1.ActivePage := TabSheet2;
  ModVeiculo.Cancel;
  ModVeiculo.RollBackTransacao;
  if TelaCadastro <> 2 then
    inherited;
end;

procedure TFrmCadModVeiculos.BitBtn7Click(Sender: TObject);
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

procedure TFrmCadModVeiculos.BitBtn_Alterar_TabClick(Sender: TObject);
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
    if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
      DBEdit26.SetFocus;
  end;
end;

procedure TFrmCadModVeiculos.BitBtn_Cancelar_TabClick(Sender: TObject);
begin
  inherited;
   ModVeiculo.vTabPreco.Cancel;
  _DesabilitarCamposTabPreco;
end;

procedure TFrmCadModVeiculos.BitBtn_Excluir_TabClick(Sender: TObject);
begin
  inherited;
 if not vDadosIni.PesqPros('VEI092', 'APAGAR', '', 'TABPRECO_VEICULO', '', ModVeiculo.buscas, true) then
    Exit;
  ModVeiculo.vTabPreco.Delete;
end;

procedure TFrmCadModVeiculos.BitBtn_Novo_TabClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI091', 'INCLUIR', '', 'TABPRECO_VEICULO', '', ModVeiculo.buscas, true) then
    Exit;
  if ModVeiculo.vTabPreco.Insert(ModVeiculo) then
  begin
    _HabilitarCamposTabPreco;
    if (Self.Enabled) and (Self.Visible) and (DBEdit24.CanFocus) then
      DBEdit24.SetFocus;
  end;
end;

procedure TFrmCadModVeiculos.BitBtn_Salvar_TabClick(Sender: TObject);
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

procedure TFrmCadModVeiculos.btSelectAllClick(Sender: TObject);
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

procedure TFrmCadModVeiculos.btUnSelectAllClick(Sender: TObject);
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

procedure TFrmCadModVeiculos.DBComboBox5KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  TDBComboBox(sender).SelectAll;
//  if (UpperCase(key) <> '0') and (UpperCase(key) <> '2') and (UpperCase(key) <> '3')
//    and (UpperCase(key) <> '3') and (UpperCase(key) <> '4') and (UpperCase(key) <> '5') then
//    key := #0;
end;

procedure TFrmCadModVeiculos.DBComboBox6KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> '0') and (UpperCase(key) <> '1') and (UpperCase(key) <> '2') and (UpperCase(key) <> '3') then
    key := #0;
end;

procedure TFrmCadModVeiculos.DBEdit187KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    if ModVeiculo.dataSet.State in [dsEdit, dsInsert] then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
      if vDadosIni.vPesquisa <> '' then
        TDBEdit(Sender).DataSource.DataSet.FieldByName(TDBEdit(Sender).DataField).AsString :=
          vDadosIni.vPesquisa;
    end;
end;

procedure TFrmCadModVeiculos.DBEdit28Exit(Sender: TObject);
begin
  inherited;
  ModVeiculo.dataSet.FieldByName('PISCOFINS').AsCurrency := ModVeiculo.dataSet.FieldByName('VALOR_PIS').AsCurrency + ModVeiculo.dataSet.FieldByName('VALOR_COFINS').AsCurrency;
end;

procedure TFrmCadModVeiculos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    ModVeiculo._marcaDesmarcaLinha;
end;

procedure TFrmCadModVeiculos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmCadModVeiculos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadModVeiculos.DBGrid4CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if not ModVeiculo.vServicosSugeridos.dataSet.IsEmpty then
      ModVeiculo.vServicosSugeridos._marcaDesmarcaLinha;
end;

procedure TFrmCadModVeiculos.DBGrid4DblClick(Sender: TObject);
begin
  if not ModVeiculo.vServicosSugeridos.dataSet.IsEmpty then
   	ModVeiculo.vServicosSugeridos._marcaDesmarcaLinha;
end;

procedure TFrmCadModVeiculos.DBGrid4DrawColumnCell(Sender: TObject;
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

procedure TFrmCadModVeiculos.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
		ModVeiculo.vServicosSugeridos._marcaDesmarcaLinha
  else if Key = VK_F2 then
  	ModVeiculo.vServicosSugeridos._marcarLinha
  else if Key = VK_F3 then
  	ModVeiculo.vServicosSugeridos._desmarcarLinha;
end;

procedure TFrmCadModVeiculos.DesmarcarTodosModVeiculosClickClick(
  Sender: TObject);
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

procedure TFrmCadModVeiculos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  {if ModVeiculo.dataSet.State = dsEdit then
  begin
    ModVeiculo.Post;
    if ModVeiculo.confirmaAlteracao then
    begin
      if ModVeiculo.Apply then
        ModVeiculo.CommitaTransacao;
    end
    else if ModVeiculo.emTransacao then
    begin
      ModVeiculo.Cancel;
      ModVeiculo.RollBackTransacao;
    end;
  end
  else
  begin
    ModVeiculo.Cancel;
    ModVeiculo.RollBackTransacao;
  end;
  }
  ModVeiculo.Cancel;
  ModVeiculo.RollBackTransacao;
//  if TelaCadastro = 0 then
  ModVeiculo.Destroy;
  ModVeiculo:=nil;
  Action := caFree;
  FrmCadModVeiculos := nil;
end;

procedure TFrmCadModVeiculos.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  inherited;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := (vDadosIni.vEmp.vUsarAparelho <> 'S') and (vDadosIni.vSugServico.vHabilitarSug);
  TelaCadastro := vDadosIni.vTipoForm;
  ModVeiculo := TModVeiculo.create;
  ModVeiculo.montaSelect('SELECT * FROM TIPMODELO where 1=0');
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadModVeiculos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadModVeiculos.FormResize(Sender: TObject);
begin
  inherited;
  if (ScrollBox3.Height >= alturaForm) and (ScrollBox3.Width >= larguraForm) then
  begin
    panel4.Align := alClient;
  end
  else
  begin
    if ScrollBox3.Height <= alturaForm then
    begin
      panel4.Align := alNone;
      panel4.Height := alturaDefault;
    end;
    if ScrollBox3.Width <= larguraForm then
    begin
      begin
        panel4.Align := alNone;
        panel4.Width := larguraDefault;
      end;
    end;
  end;
end;

procedure TFrmCadModVeiculos.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;
    
  DBGrid1.DataSource := DtmVeiculos.dsModVeiculos;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
  if vCriou = 0 then
  begin
  	inherited;
  	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "BAS407" PERMITIR INCLUIR/ALTERAR MODVEICULOS SEM INFORMAR SERVICO';

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadModVeiculos.MarcarTodosModVeiculosClickClick(Sender: TObject);
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

procedure TFrmCadModVeiculos.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if PageControl3.ActivePage = TabSheet4 then
  begin
    if ModVeiculo.dataSet.State = dsEdit then
    begin
      ModVeiculo.vTabPreco._AbreTabPrecoVeic(ModVeiculo);
      _DesabilitarCamposTabPreco;

      if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo_Tab.CanFocus) then
        BitBtn_Novo_Tab.SetFocus;
    end;
  end;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TFrmCadModVeiculos.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if ModVeiculo.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('VEI014', 'EDITANDO REGISTRO', '', 'TIPMODELO', ModVeiculo.dataSet.FieldByName('CODIGO').AsString, ModVeiculo.buscas, true) then
    Exit;

  try
    Screen.Cursor := crHourGlass;

    if not ModVeiculo.Edit then
      Exit;

    inherited;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    PageControl1.ActivePage := TabSheet1;
    TabSheet3.TabVisible := true;
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.Show;
    TabSheet4.TabVisible := true;
    tsCodigoFab.TabVisible := true;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
    
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadModVeiculos.SpeedButton25Click(Sender: TObject);
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

procedure TFrmCadModVeiculos.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;
    if not ModVeiculo.Delete then
      Exit;

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

procedure TFrmCadModVeiculos.SpeedButton40Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('vei_%', ModVeiculo.buscas);
end;

procedure TFrmCadModVeiculos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not ModVeiculo.restaurarRegistro then
  	Exit;

  if ModVeiculo.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadModVeiculos.TabSheet2Show(Sender: TObject);
begin
  inherited;
	if ModVeiculo.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

procedure TFrmCadModVeiculos.TabSheet3Show(Sender: TObject);
begin
  inherited;
  //  panel4.Align := alClient;
  if ModVeiculo.dataset.state = dsEdit then
    TabSheet3.Caption := 'Alterando Modelo de Veículo'
  else
    TabSheet3.Caption := 'Cadastrando Modelo de Veículo';
end;

procedure TFrmCadModVeiculos._DesabilitarCamposTabPreco;
begin
  BitBtn_Novo_Tab.Enabled := true;
  BitBtn_Alterar_Tab.Enabled := true;
  BitBtn_Excluir_Tab.Enabled := true;
  BitBtn_Salvar_Tab.Enabled := false;
  BitBtn_Cancelar_Tab.Enabled := false;

  DBEdit24.Enabled := false;
  DBEdit25.Enabled := false;
  DBEdit26.Enabled := false;
  DBEdit27.Enabled := false;
  Label34.Enabled := true;
  Label38.Enabled := true;
end;

procedure TFrmCadModVeiculos._HabilitarCamposTabPreco;
begin
  BitBtn_Salvar_Tab.Enabled := true;
  BitBtn_Cancelar_Tab.Enabled := true;
  BitBtn_Novo_Tab.Enabled := false;
  BitBtn_Alterar_Tab.Enabled := false;
  BitBtn_Excluir_Tab.Enabled := false;

  DBEdit24.Enabled := not (ModVeiculo.vTabPreco.dataSet.State = dsEdit);
  DBEdit25.Enabled := not (ModVeiculo.vTabPreco.dataSet.State = dsEdit);
  DBEdit26.Enabled := true;
  DBEdit27.Enabled := true;
  Label34.Enabled := not (ModVeiculo.vTabPreco.dataSet.State = dsEdit);
  Label38.Enabled := not (ModVeiculo.vTabPreco.dataSet.State = dsEdit);
end;

end.

