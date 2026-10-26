unit UCadVeiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, Buttons, Grids, DBGrids, StdCtrls, Mask,
  ComCtrls, DBCtrls, uDtmAtivo, uDtmVeiculos, UClassesVeiculos, db, uDadosIni, UClassesClientes,
  AppEvnts;

type
  TFrmCadVeiculos = class(TfrmCadPadraoM)
    Panel4: TPanel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label11: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label9: TLabel;
    Label26: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit20: TDBEdit;
    DBEdit16: TDBEdit;
    Label16: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    Label25: TLabel;
    DBEdit22: TDBEdit;
    Label27: TLabel;
    DBEdit25: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    DBComboBox1: TDBComboBox;
    Label30: TLabel;
    DBEdit5: TDBEdit;
    btAlterarChassiPlaca: TSpeedButton;
    SpeedButton40: TSpeedButton;
    MarcarTodosVeiculosClick: TMenuItem;
    DesmarcarTodosVeiculosClick: TMenuItem;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DesmarcarTodosVeiculosClickClick(Sender: TObject);
    procedure MarcarTodosVeiculosClickClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton40Click(Sender: TObject);
    procedure btAlterarChassiPlacaClick(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBLookupComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  FrmCadVeiculos: TFrmCadVeiculos;
  Veiculo: TVeiculos;

implementation

{$R *.dfm}

procedure TFrmCadVeiculos.BitBtn1Click(Sender: TObject);
begin
	try
    inherited;
    if not vDadosIni.PesqPros('VEI025', 'CONSULTA', '', 'VEICULOS', '',
      Veiculo.buscas, true) then
        Exit;

    SpeedButton2.Hint := 'Enviar para Lixeira - [VEI008]';

    Screen.Cursor := crHourGlass;
    Veiculo.vCons.campo := ComboBox1.Text;
    Veiculo.vCons.ordem := ComboBox2.Text;
    Veiculo.vCons.condicao := ComboBox3.Text;
    Veiculo.vCons.valor := MaskEdit3.Text;
    Veiculo.vCons.dataIni := MaskEdit1.Text;
    Veiculo.vCons.dataFim := MaskEdit2.Text;
    Veiculo.vCons.porData := MaskEdit1.Visible;
    Veiculo.consulta;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if not Veiculo.IsEmpty then
      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculos.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  if vDadosIni.PesqPros('VEI006', 'INCLUINDO VEICULOS', '', 'VEICULOS', '', veiculo.buscas, true) then
//  if vDadosIni.PesqPros('VEI006', '', Veiculo.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;

      if not Veiculo.Insert then
      	exit;

      inherited;

      Veiculo.verificatipovenda(1, DBComboBox1, 'OS', '');

      for I := 0 to ComponentCount - 1 do
        if (Components[I] is TScrollBox) then
          TScrollBox(Components[I]).VertScrollBar.Position := 0;

      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      TabSheet3.Show;
      TabSheet3.Caption := 'Cadastrando um novo Veículo';
      Label30.Visible := (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S');
      DBEdit5.Visible := (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S');

      Label14.Enabled := true;
      DBEdit3.Enabled := true;
      Label18.Enabled := true;
      DBEdit2.Enabled := true;
      btAlterarChassiPlaca.Visible := false;

      if vDadosIni.vVeic.vDesabilitarChassi then
      begin
        Label14.Visible := false;
        DBEdit3.Visible := false;
      end
      else
      begin
        Label14.Visible := true;
        DBEdit3.Visible := true;
      end;

      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
	      DBEdit3.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
      	DBEdit8.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadVeiculos.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VEI011', 'CONFIRMAR INCLUSÃO', '', 'VEICULOS', '', veiculo.buscas, true) then
//  if not vDadosIni.PesqPros('VEI011', '', Veiculo.buscas, false) then
    exit;
  try
    Screen.Cursor := crHourGlass;
    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    	BitBtn4.SetFocus;
    if veiculo.dataSet.FieldByName('COD_CLIENTE').OldValue <> veiculo.dataSet.FieldByName('COD_CLIENTE').NewValue then
      veiculo.dataSet.FieldByName('TIPO_OS').AsString:=''; 
    if not Veiculo.Post then
      setFocusCampoErro(Veiculo.vNomeCampoErro, Veiculo.vMensagemErro)
    else
    begin
      if CheckCadSeq.Checked then
      begin
        if Veiculo.Insert then
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

procedure TFrmCadVeiculos.BitBtn5Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn5.CanFocus) then
  	BitBtn5.SetFocus;

  if TelaCadastro <> 2 then
    inherited;
  PageControl1.ActivePage := TabSheet2;
  Veiculo.Cancel;
  Veiculo.RollBackTransacao;
  Veiculo.Refresh;
end;

procedure TFrmCadVeiculos.btAlterarChassiPlacaClick(Sender: TObject);
var
  vChassi: string;
  vPlaca: string;
  vCodigo: Integer;
begin
  inherited;
  vCodigo := Veiculo.dataset.FieldByName('CODIGO').AsInteger;
  vChassi := trim(Veiculo.dataset.FieldByName('CHASSI').AsString);
  vPlaca  := trim(Veiculo.dataset.FieldByName('PLACA').AsString);

	if not vDadosIni.AtualizarChassiPlaca(vChassi, vPlaca, Veiculo.buscas) then
  	exit;

  Veiculo.abreVeiculos(vPlaca, vChassi, vCodigo);
  if not (Veiculo.dataset.State in [dsEdit, dsInsert]) then
	 	Veiculo.dataset.Edit;
end;

procedure TFrmCadVeiculos.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Veiculo._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadVeiculos.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Veiculo._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadVeiculos.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  //DBComboBox1.Text := DBComboBox1.Items[DBComboBox1.ItemIndex];
  if (DBComboBox1.text <> '') and (ActiveControl <> bitbtn5) then
   if not Veiculo.verificatipovenda(2, DBComboBox1, 'OS', DBComboBox1.text) then
     if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
     	 DBComboBox1.setfocus;
end;

procedure TFrmCadVeiculos.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
  if Veiculo.verificajacad(2) then
  begin
   if Application.MessageBox('Veiculo já cadastrado, Deseja alterar seus dados?',
            'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
   begin
     Veiculo.abreVeiculos;
     if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
     	 DBEdit2.setfocus;
   end
   else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
     DBEdit2.SetFocus;
  end;
end;

procedure TFrmCadVeiculos.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if Veiculo.verificajacad(1) then
  begin
   if Application.MessageBox('Veiculo já cadastrado, Deseja alterar seus dados?',
            'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
   begin
     Veiculo.abreVeiculos;
     if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
     	 dbedit3.setfocus;
   end
   else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
     DBEdit3.SetFocus;
  end;
end;

procedure TFrmCadVeiculos.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if not Veiculo.LocCliente.abreClientes(Veiculo.dataSet.FieldByName('COD_CLIENTE').asinteger) then
  begin
    Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
            MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    	DBEdit4.SetFocus;        
  end;
end;

procedure TFrmCadVeiculos.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Cliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('VEI001', 'PESQUISAR', '', 'VEICULOS', '', veiculo.buscas, true) then
//    if vDadosIni.PesqPros('VEI001', '', Veiculo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
        if vDadosIni.vPesquisa <> '' then
          Veiculo.dataSet.FieldByName('COD_CLIENTE').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('VEI002', 'INCLUIR', '', 'VEICULOS', '', veiculo.buscas, true) then
//    if vDadosIni.PesqPros('VEI002', '', Veiculo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := inttostr(Veiculo.dataSet.FieldByName('COD_CLIENTE').AsInteger);
        Cliente.CadCliente(1);
        if vDadosIni.vPesquisa <> '' then
        begin
          Veiculo.dataSet.FieldByName('COD_CLIENTE').asinteger := strtoint(vDadosIni.vPesquisa);
          Veiculo.LocCliente.abreClientes(Veiculo.dataSet.FieldByName('COD_CLIENTE').asinteger);
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadVeiculos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    Veiculo._marcaDesmarcaLinha;
end;

procedure TFrmCadVeiculos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmCadVeiculos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    if not Veiculo.dataSet.IsEmpty then
      Veiculo._marcaDesmarcaLinha;
end;

procedure TFrmCadVeiculos.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  if (trim(Veiculo.dataSet.FieldByName('DESCMODELO').AsString) = '') and
    (trim(DBLookupComboBox3.Text) <> '') then
    Veiculo.dataSet.FieldByName('DESCMODELO').AsString := trim(DBLookupComboBox3.Text);
end;

procedure TFrmCadVeiculos.DBLookupComboBox3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('VEI003', 'PESQUISAR', '', 'VEICULOS', '', veiculo.buscas, true) then
//    if vDadosIni.PesqPros('VEI003', '', Veiculo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('TIPMODELO');
        if vDadosIni.vPesquisa <> '' then
          Veiculo.dataSet.FieldByName('MODELO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('VEI004', 'INCLUIR', '', 'VEICULOS', '', veiculo.buscas, true) then
//    if vDadosIni.PesqPros('VEI004', '', Veiculo.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Veiculo.vModVei.CadModVeiculos(1);
        Veiculo.vModVei.abreModVeiculos;
        if vDadosIni.vPesquisa <> '' then
          Veiculo.dataSet.FieldByName('MODELO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

end;

procedure TFrmCadVeiculos.DesmarcarTodosVeiculosClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Veiculo._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadVeiculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Veiculo.dataSet.State = dsEdit then
  begin
    Veiculo.Post;
    if Veiculo.confirmaAlteracao then
    begin
      if Veiculo.Apply then
        Veiculo.CommitaTransacao;
    end
    else if Veiculo.emTransacao then
    begin
      Veiculo.Cancel;
      Veiculo.RollBackTransacao;
    end;
  end
  else
  begin
    Veiculo.Cancel;
    Veiculo.RollBackTransacao;
  end;
  Veiculo.Destroy;
  Action := caFree;
  FrmCadVeiculos := nil;
end;

procedure TFrmCadVeiculos.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Veiculo := TVeiculos.create;
  Veiculo.abreVeiculos('');
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
//  alturaForm := TabSheet3.ClientHeight;
//  larguraForm := TabSheet3.ClientWidth;
//  alturaDefault := panel4.Height;
//  larguraDefault := panel4.Width;
end;

procedure TFrmCadVeiculos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end;
end;

procedure TFrmCadVeiculos.FormResize(Sender: TObject);
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

procedure TFrmCadVeiculos.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;
    
  DBGrid1.DataSource := DtmVeiculos.dsVeiculos;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;

  if vCriou = 0 then
  begin
  	inherited;
  	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadVeiculos.MarcarTodosVeiculosClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Veiculo._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadVeiculos.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.PesqPros('VEI007', 'INCLUIR', '', 'VEICULOS', Veiculo.dataSet.FieldByName('CODIGO').AsString, veiculo.buscas, true) then
//  if not vDadosIni.PesqPros('VEI007', Veiculo.dataSet.FieldByName('CODIGO').AsString,
//    Veiculo.buscas, true) then
    exit;
  try
    Screen.Cursor := crHourGlass;

    if not Veiculo.Edit then
      exit;

    inherited;

    Veiculo.verificatipovenda(1, DBComboBox1, 'OS', '');

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    TabSheet3.TabVisible := true;
    PageControl3.ActivePage := TabSheet3;
	  TabSheet3.Show;
    TabSheet3.Caption := 'Alterando dados do Veículo';
    Label30.Visible := (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S');
    DBEdit5.Visible := (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S');

    Label14.Enabled := false;
    DBEdit3.Enabled := false;
    Label18.Enabled := false;
    DBEdit2.Enabled := false;
    btAlterarChassiPlaca.Visible := true;

    if vDadosIni.vVeic.vDesabilitarChassi then
    begin
      Label14.Visible := false;
      DBEdit3.Visible := false;
    end
    else
    begin
      Label14.Visible := true;
      DBEdit3.Visible := true;
    end;

    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
	    DBEdit3.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
     	DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
    	DBEdit8.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadVeiculos.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('VEI009', 'ACESSAR', '', 'VEICULOS', '', veiculo.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not Veiculo.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira - [VEI008]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente - [VEI012]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadVeiculos.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  try
    inherited;
    if not Veiculo.Delete then
      exit;

    vStatusLixeira := Veiculo.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Veiculo.Cancel;
    Veiculo.RollBackTransacao;
  end;
end;

procedure TFrmCadVeiculos.SpeedButton40Click(Sender: TObject);
begin
  vDadosIni.configurarSistema('vei_%', Veiculo.buscas);
end;

procedure TFrmCadVeiculos.SpeedButton5Click(Sender: TObject);
begin
	inherited;
  if not Veiculo.restaurarRegistro then
  	Exit;

  if Veiculo.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadVeiculos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('VEI005', 'ACESSAR', '', 'VEICULOS', '', veiculo.buscas, true) then
//  if vDadosIni.PesqPros('VEI005', '', Veiculo.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      Veiculo.vModVei.CadModVeiculos(0);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadVeiculos.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if Veiculo.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

initialization
  RegisterClass(TFrmCadVeiculos);
finalization
  UnRegisterClass(TFrmCadVeiculos);

end.

