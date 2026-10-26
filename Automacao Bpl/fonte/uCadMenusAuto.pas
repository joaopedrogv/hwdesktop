unit uCadMenusAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, UClassesConfig, DBCtrls, AppEvnts;

type
  TfrmMenusAuto = class(TfrmCadPadraoM)
    PopupMenu3: TPopupMenu;
    HabilitarMenu1: TMenuItem;
    DesabilitarMenu1: TMenuItem;
    MenuVisvel1: TMenuItem;
    MenuInvisvel1: TMenuItem;
    tsMenus: TTabSheet;
    GroupBox4: TGroupBox;
    PopupMenu4: TPopupMenu;
    DefinirNveldeUsurio1: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    ApagarMenu1: TMenuItem;
    Habilitar1: TMenuItem;
    Desabilitar1: TMenuItem;
    Visvel1: TMenuItem;
    Invisvel1: TMenuItem;
    SemNvel1: TMenuItem;
    Label10: TLabel;
    HabilitarMenusSelecionados1: TMenuItem;
    DesabilitarMenusSelecionados1: TMenuItem;
    MenusVisveisSelecionados1: TMenuItem;
    MenuInvisvelSelecionados1: TMenuItem;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Panel4: TPanel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton9: TSpeedButton;
    BitBtn7: TBitBtn;
    ScrollBox4: TScrollBox;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    GroupBox5: TGroupBox;
    DBGrid3: TDBGrid;
    Panel6: TPanel;
    Label8: TLabel;
    Edit2: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure MenuInvisvelSelecionados1Click(Sender: TObject);
    procedure MenusVisveisSelecionados1Click(Sender: TObject);
    procedure DesabilitarMenusSelecionados1Click(Sender: TObject);
    procedure HabilitarMenusSelecionados1Click(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Invisvel1Click(Sender: TObject);
    procedure Visvel1Click(Sender: TObject);
    procedure Desabilitar1Click(Sender: TObject);
    procedure Habilitar1Click(Sender: TObject);
    procedure ApagarMenu1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MenuInvisvel1Click(Sender: TObject);
    procedure MenuVisvel1Click(Sender: TObject);
    procedure DesabilitarMenu1Click(Sender: TObject);
    procedure HabilitarMenu1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenusAuto: TfrmMenusAuto;
  obMenu: TMenusAuto;

implementation

uses uDtmAtivo, UDtmConfig, uDataSet_OOP;

{$R *.dfm}

procedure TfrmMenusAuto.ApagarMenu1Click(Sender: TObject);
begin
  inherited;
  obMenu.vMnSis.delMenu;
end;

procedure TfrmMenusAuto.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [CFG002]';
  inherited;
  if not vDadosIni.PesqPros('CFG001', 'PESQUISAR', '','MENUS_AUTO','', obMenu.buscas, true) then
    exit;
//  if not vDadosIni.PesqPros('CFG001', '', obMenu.buscas, true) then
//    Exit;
  if MaskEdit2.Visible then
  begin
    if not obMenu.ConsultaCampos('MENUS_AUTO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, ' AND MENUS_AUTO.COD_MENU > 500',
      vDadosIni.codEmpresa) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      	combobox1.setfocus;
    end;
  end
  else if obMenu.ConsultaCampos('MENUS_AUTO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, ' AND MENUS_AUTO.COD_MENU > 500', True, vDadosIni.codEmpresa) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    	ComboBox1.SetFocus;
  end;
  SpeedButton1.Visible := true;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmMenusAuto.BitBtn2Click(Sender: TObject);
begin
  inherited;
  obMenu.vMnSis.vERP.Close;
end;

procedure TfrmMenusAuto.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if obMenu.vMnSis.salvarAlteracoes then
  begin
    obMenu.vMnSis.vERP.Close;
    PageControl1.ActivePage := TabSheet2;
    BitBtn1.Click;
  end;
end;

procedure TfrmMenusAuto.btSelectAllClick(Sender: TObject);
begin
  inherited;
  obMenu._marcarTodos;
end;

procedure TfrmMenusAuto.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  obMenu._desmarcarTodos;
end;

procedure TfrmMenusAuto.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    obMenu._marcaDesmarcaLinha;
end;

procedure TfrmMenusAuto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if obMenu.dataSet.FieldByName('sel').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmMenusAuto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    if not obMenu.dataSet.IsEmpty then
      obMenu._marcaDesmarcaLinha;
end;

procedure TfrmMenusAuto.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    obMenu._marcaDesmarcaLinha;
end;

procedure TfrmMenusAuto.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    obMenu.vMnSis.buscarPalavraOuFrase(Edit1.Text, false);
    Edit1.SelectAll;
  end
  else if Key = VK_INSERT then
    obMenu.vMnSis.addMenu;
end;

procedure TfrmMenusAuto.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    obMenu.vMnSis.buscarPalavraOuFrase(Edit2.Text, true);
    Edit2.SelectAll;
  end
  else if Key = VK_DELETE then
    obMenu.vMnSis.delMenu
  else if (Key = 72) and (TDBGrid(Sender).Name = DBGrid3.Name) then
    obMenu.vMnSis.habilitaMenu
  else if (Key = 68) and (TDBGrid(Sender).Name = DBGrid3.Name) then
    obMenu.vMnSis.desabilitaMenu
  else if (Key = 86) and (TDBGrid(Sender).Name = DBGrid3.Name) then
    obMenu.vMnSis.setMenuVisivel
  else if (Key = 73) and (TDBGrid(Sender).Name = DBGrid3.Name) then
    obMenu.vMnSis.setMenuInvisivel;
end;

procedure TfrmMenusAuto.Desabilitar1Click(Sender: TObject);
begin
  inherited;
  obMenu.vMnSis.desabilitaMenu;
end;

procedure TfrmMenusAuto.DesabilitarMenu1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG007', 'DESHABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.setMenuDesabilitado;
end;

procedure TfrmMenusAuto.DesabilitarMenusSelecionados1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG007', 'DESHABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.setMenuDesabilitado(True);
end;

procedure TfrmMenusAuto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obMenu.Free;
  obMenu := nil;
  Action := caFree;
  frmMenusAuto := nil;
end;

procedure TfrmMenusAuto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PageControl1.ActivePage = tsMenus then
  begin
    if Key = VK_F2 then
    begin
      if TEdit(ActiveControl).Name = Edit1.Name then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
        	DBGrid2.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
        Edit1.SetFocus;
    end
    else if Key = VK_F4 then
    begin
      if TEdit(ActiveControl).Name = Edit2.Name then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
        	DBGrid3.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
        Edit2.SetFocus;
    end
    else if Key = VK_F5 then
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      	DBLookupComboBox1.SetFocus;
  end;
end;

procedure TfrmMenusAuto.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    inherited;
    obMenu := TMenusAuto.create;
    tsMenus.TabVisible := false;
    DBGrid1.DataSource := dtmConfig.dsMenus;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    configuraShow;
    SpeedButton1.Enabled := false;
    //  SpeedButton2.Enabled := false;
    SpeedButton3.Enabled := false;
    //  SpeedButton25.Enabled := false;
    //  SpeedButton5.Enabled := false;
    BitBtn3.Enabled := false;
    CheckBox3.Enabled := false;
    CheckBox1.Enabled := false;
    //  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    //  	DBGrid1.SetFocus;
    statusBar('[Alt+P: Pesquisa ]   [Alt+S: Sair]   [Del: Delete]   [Botão Direito Mouse: Configurar]',
      DBGrid1.Hint);
    BitBtn1Click(Sender);
  end;
end;

procedure TfrmMenusAuto.Habilitar1Click(Sender: TObject);
begin
  inherited;
  obMenu.vMnSis.habilitaMenu;
end;

procedure TfrmMenusAuto.HabilitarMenu1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG006', 'HABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.setMenuHabilitado;
end;

procedure TfrmMenusAuto.HabilitarMenusSelecionados1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG006', 'HABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.setMenuHabilitado(True);
end;

procedure TfrmMenusAuto.Invisvel1Click(Sender: TObject);
begin
  inherited;
  obMenu.vMnSis.setMenuInvisivel;
end;

procedure TfrmMenusAuto.MenuInvisvel1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG009', 'DESHABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.setMenuInvisivel;
end;

procedure TfrmMenusAuto.MenuInvisvelSelecionados1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG009', 'DESHABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.setMenuInvisivel(True);
end;

procedure TfrmMenusAuto.MenusVisveisSelecionados1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG008', 'HABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.setMenuVisivel(True);
end;

procedure TfrmMenusAuto.MenuVisvel1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG008', 'HABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.setMenuVisivel;
end;

procedure TfrmMenusAuto.N11Click(Sender: TObject);
begin
  inherited;
  obMenu.vMnSis.setNivelUsuario(TMenuItem(Sender).Tag);
end;

procedure TfrmMenusAuto.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG003', 'ACESSAR', '','MENUS_AUTO',
  '', obMenu.buscas, true) then
    exit;
//  if not vDadosIni.PesqPros('CFG003', '', obMenu.buscas, true) then
//    Exit;
  try
    Screen.Cursor := crHourGlass;
    inherited;
    if not obMenu.abrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [CFG002]';
      //      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
     SpeedButton2.Hint := 'Excluir registro permanentemente -  [CFG002]';
      //      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMenusAuto.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG002', 'EXCLUIR', '','MENUS_AUTO',
  obMenu.dataSet.FieldByName('COD_MENU').AsString, obMenu.buscas, true) then
    exit;
//  if not vDadosIni.PesqPros('CFG002', '', obMenu.buscas, true) then
//    Exit;
  obMenu.Delete;
end;

procedure TfrmMenusAuto.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG004', 'RESTAURAR', '','MENUS_AUTO',
  obmenu.dataSet.FieldByName('COD_MENU').AsString, obMenu.buscas, true) then
    exit;
//  if not vDadosIni.PesqPros('CFG004', '', obMenu.buscas, true) then
//    Exit;
  obMenu.restaurarRegistro;
end;

procedure TfrmMenusAuto.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG005', 'HABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.criaMenus;
end;

procedure TfrmMenusAuto.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG011', 'INCLUIR', '','MENUS_AUTO','', obMenu.buscas, true) then
    exit;
//  if not vDadosIni.PesqPros('CFG011', '', obMenu.buscas, true) then
//    Exit;
  PageControl1.ActivePage := tsMenus;
  obMenu.vMnSis.vERP.abreERP;
  obMenu.vMnSis.abreMenusSistema;
  DBLookupComboBox1.KeyValue := obMenu.vMnSis.vERP.dataSet.FieldByName('cod_aplicativo').AsInteger;
end;

procedure TfrmMenusAuto.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG010', 'HABILITAR', '', 'MENUS_AUTO', '', obMenu.buscas, true) then
    Exit;
  obMenu.configurarMenus(vDadosIni.vDpto);
end;

procedure TfrmMenusAuto.SpeedButton9Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
//    DBGrid2.Visible := False;
    DBGrid3.Visible := False;

    vDadosIni.abreStatusProcessamento('', 'Aguarde! Incluindo menus');
                                              
    obMenu.vMnSis.vMenusAtuais.DisableControls;
    obMenu.vMnSis.vMenusAtuais.First;
    while not obMenu.vMnSis.vMenusAtuais.Eof do
    begin
      Application.ProcessMessages;
      obMenu.vMnSis.addMenu;
      obMenu.vMnSis.vMenusAtuais.Next;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
    DBGrid2.Visible := True;
    DBGrid3.Visible := True;
    obMenu.vMnSis.vMenusAtuais.EnableControls;
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmMenusAuto.Visvel1Click(Sender: TObject);
begin
  inherited;
  obMenu.vMnSis.setMenuVisivel;
end;

end.

