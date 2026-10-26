unit uCadRegrasVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TFrmCadRegrasVendas = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    DBEdit3: TDBEdit;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    TabSheet5: TTabSheet;
    Label19: TLabel;
    DBEdit5: TDBEdit;
    Label20: TLabel;
    DBEdit9: TDBEdit;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    DBText1: TDBText;
    Label16: TLabel;
    Label17: TLabel;
    DBText2: TDBText;
    BitBtn65: TBitBtn;
    Panel6: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    BitBtn7: TBitBtn;
    Panel7: TPanel;
    DBText5: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    DBText6: TDBText;
    BitBtn8: TBitBtn;
    DBText3: TDBText;
    DBText4: TDBText;
    Panel8: TPanel;
    DBGrid3: TDBGrid;
    Panel9: TPanel;
    DBGrid4: TDBGrid;
    Panel28: TPanel;
    Panel11: TPanel;
    Panel13: TPanel;
    btSelectAllTipoVenda: TSpeedButton;
    btUnSelectAllTipoVenda: TSpeedButton;
    btSelectAllControle: TSpeedButton;
    btUnSelectAllControle: TSpeedButton;
    btSelectAllCondPag: TSpeedButton;
    btUnSelectAllCondPag: TSpeedButton;
    Label29: TLabel;
    DBEdit11: TDBEdit;
    TabSheet8: TTabSheet;
    Panel10: TPanel;
    Panel12: TPanel;
    DBText7: TDBText;
    Label30: TLabel;
    Label31: TLabel;
    DBText8: TDBText;
    btSelectAllTipo: TSpeedButton;
    btUnSelectAllTipo: TSpeedButton;
    BitBtn9: TBitBtn;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Label8: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    DBEdit6: TDBEdit;
    Label21: TLabel;
    DBEdit10: TDBEdit;
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure btUnSelectAllTipoClick(Sender: TObject);
    procedure btSelectAllTipoClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure btUnSelectAllCondPagClick(Sender: TObject);
    procedure btSelectAllCondPagClick(Sender: TObject);
    procedure btUnSelectAllControleClick(Sender: TObject);
    procedure btSelectAllControleClick(Sender: TObject);
    procedure btUnSelectAllTipoVendaClick(Sender: TObject);
    procedure btSelectAllTipoVendaClick(Sender: TObject);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn65Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
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
  FrmCadRegrasVendas: TFrmCadRegrasVendas;

implementation

uses
  uDtmAtivo, UClassesCadastrosBasicos, uDadosIni, UDtmCadastrosBasicos, DB,
  uDataSet_OOP;


{$R *.dfm}

procedure TFrmCadRegrasVendas.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS342]';
  if not vDadosIni.PesqPros('BAS339', 'PESQUISAR', '', 'REGRAS_VENDAS', '', obRegrasVND.buscas, true) then
    Exit;
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if MaskEdit2.Visible then
    begin
      if not obRegrasVND.ConsultaCampos('REGRAS_VENDAS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not obRegrasVND.ConsultaCampos('REGRAS_VENDAS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
  finally
    Screen.Cursor := crDefault;
    obRegrasVND.ultimasql := obRegrasVND.dataset.CommandText;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
//    if obRegrasVND.StatusLixeira then
//      SpeedButton25.Visible := true
//    else
//      SpeedButton25.Visible := false;
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadRegrasVendas.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS340', 'INSERINDO NOVO REGISTRO', '', 'REGRAS_VENDAS', '', obRegrasVND.buscas, true) then
  begin
    if obRegrasVND.Insert then
    begin
    	obRegrasVND._listarTipo;
//      obRegrasVND._ListaTipoVendas('REQ',DBLookupComboBox1);
      inherited;
      TabSheet3.Show;

      if obRegrasVND.dataSet.FieldByName('PESSOAFISICA').AsString = 'S' then
        DBComboBox2.ItemIndex := 0
      else if obRegrasVND.dataSet.FieldByName('PESSOAFISICA').AsString = 'N' then
        DBComboBox2.ItemIndex := 1
      else if obRegrasVND.dataSet.FieldByName('PESSOAFISICA').AsString = 'A' then
        DBComboBox2.ItemIndex := 2;

      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
    end;
  end;
end;


procedure TFrmCadRegrasVendas.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
		BitBtn4.SetFocus;
  if not obRegrasVND.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obRegrasVND.vNomeCampoErro,obRegrasVND.vMensagemErro);
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
      if obRegrasVND.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadRegrasVendas.BitBtn5Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS347', 'CANCELAR', '', 'REGRAS_VENDAS', obRegrasVND.dataSet.FieldByName('COD_REGRAVND').AsString, obRegrasVND.buscas, true) then
    exit;
  obRegrasVND.Cancel;
  obRegrasVND.RollBackTransacao;
  inherited;
end;

procedure TFrmCadRegrasVendas.BitBtn65Click(Sender: TObject);
begin
  inherited;
  TabSheet2.Show;
end;

procedure TFrmCadRegrasVendas.btSelectAllCondPagClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;

    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;
    
		obRegrasVND._vincular_todos_condpag(false);
  finally
  	obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.btSelectAllControleClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

  	vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;
    
		obRegrasVND._vincular_todos_controles(false);
  finally
    obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;

    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.btSelectAllTipoClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;
    
		obRegrasVND._vincular_todos_tipo(false);
  finally
    obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.btSelectAllTipoVendaClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;
    
		obRegrasVND._vincular_todos_tipovndos(false);
  finally
    obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.btUnSelectAllCondPagClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;

    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;
    
		obRegrasVND._vincular_todos_condpag(true);
  finally
  	obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.btUnSelectAllControleClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;

    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;
    
		obRegrasVND._vincular_todos_controles(true);
  finally
  	obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.btUnSelectAllTipoClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;

		obRegrasVND._vincular_todos_tipo(true);
  finally
  	obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.btUnSelectAllTipoVendaClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;

		obRegrasVND._vincular_todos_tipovndos(true);
  finally
  	obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
//  Label19.Enabled := DBComboBox3.ItemIndex = 0;
//  DBEdit5.Enabled := DBComboBox3.ItemIndex = 0;
//  Label20.Enabled := DBComboBox3.ItemIndex = 0;
//  DBEdit9.Enabled := DBComboBox3.ItemIndex = 0;
//  Label15.Enabled := DBComboBox3.ItemIndex = 0;
//  DBEdit4.Enabled := DBComboBox3.ItemIndex = 0;
//
//  if DBComboBox3.ItemIndex = 1 then
//  begin
//  	obRegrasVND.dataSet.FieldByName('MAX_DESCPROD').AsFloat := 0;
//    obRegrasVND.dataSet.FieldByName('MAX_DESCSERV').AsFloat := 0;
//    obRegrasVND.dataSet.FieldByName('MAX_DESC').AsFloat := 0;
//  end;

//  obRegrasVND._ListaTipoVendas(trim(obRegrasVND.dataSet.FieldByName('TIPO').AsString),DBLookupComboBox1);

  if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
  	DBEdit5.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
  	DBEdit9.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TFrmCadRegrasVendas.DBComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	key := #0;
end;

procedure TFrmCadRegrasVendas.DBComboBox3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	key := #0;
end;

procedure TFrmCadRegrasVendas.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
//  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
//    DBLookupComboBox2.SetFocus;
end;

procedure TFrmCadRegrasVendas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TFrmCadRegrasVendas.DBGrid2DblClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

  	vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;
    
    obRegrasVND._vincular_congpag(not obRegrasVND.dtSetCondPag.FieldByName('COD_REGRAVND').Isnull);
  finally
    obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('COD_REGRAVND').AsInteger = obRegrasVND.dataSet.FieldByName('COD_REGRAVND').AsInteger then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    	TDBGrid(sender).canvas.brush.color := TColor($00ACC891);
  end
  else if Column.Field.Dataset.FieldbyName('COD_REGRAVND').AsInteger > 0 then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    	TDBGrid(sender).canvas.brush.color := TColor($008C9A9A);
  end
  else
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := clWindow;// TColor($0084DAFF);
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadRegrasVendas.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  if (Key = VK_SPACE) then
  begin
  	try
    	Screen.Cursor := crHourGlass;

      vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
      vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
      vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
      vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;

      obRegrasVND._vincular_congpag(not obRegrasVND.dtSetCondPag.FieldByName('COD_REGRAVND').Isnull);
    finally
			obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
      obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
      obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
      obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;

      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadRegrasVendas.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  exit;
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TFrmCadRegrasVendas.DBGrid3DblClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

  	vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;
    
    obRegrasVND._vincular_controle(not obRegrasVND.dtSetControle.FieldByName('COD_REGRAVND').Isnull);
  finally
    obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('COD_REGRAVND').AsInteger = obRegrasVND.dataSet.FieldByName('COD_REGRAVND').AsInteger then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    	TDBGrid(sender).canvas.brush.color := TColor($00ACC891);
  end
  else if Column.Field.Dataset.FieldbyName('COD_REGRAVND').AsInteger > 0 then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    	TDBGrid(sender).canvas.brush.color := TColor($008C9A9A);
  end
  else
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := clWindow;// TColor($0084DAFF);
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadRegrasVendas.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
	if (Key = VK_SPACE) then
  begin
  	try
    	Screen.Cursor := crHourGlass;

  		vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
      vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
      vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
      vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;

      obRegrasVND._vincular_controle(not obRegrasVND.dtSetControle.FieldByName('COD_REGRAVND').Isnull);
    finally
    	obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
      obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
      obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
      obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;

      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadRegrasVendas.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
  exit;
	vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
end;

procedure TFrmCadRegrasVendas.DBGrid4DblClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;

    obRegrasVND._vincular_tipovndos(not obRegrasVND.dtSetTipoVendaOS.FieldByName('COD_REGRAVND').Isnull);
  finally
    obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;

    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('COD_REGRAVND').AsInteger = obRegrasVND.dataSet.FieldByName('COD_REGRAVND').AsInteger then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    	TDBGrid(sender).canvas.brush.color := TColor($00ACC891);
  end
  else if Column.Field.Dataset.FieldbyName('COD_REGRAVND').AsInteger > 0 then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    	TDBGrid(sender).canvas.brush.color := TColor($008C9A9A);
  end
  else
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := clWindow;// TColor($0084DAFF);
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadRegrasVendas.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  if (Key = VK_SPACE) then
  begin
  	try
    	Screen.Cursor := crHourGlass;

      vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
      vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
      vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
      vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;

      obRegrasVND._vincular_tipovndos(not obRegrasVND.dtSetTipoVendaOS.FieldByName('COD_REGRAVND').Isnull);
    finally
      obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
      obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
      obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
      obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;

      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadRegrasVendas.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
  exit;
	vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;

procedure TFrmCadRegrasVendas.DBGrid5DblClick(Sender: TObject);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;
    
    vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
    vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
    vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
    vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;

    obRegrasVND._vincular_tipo(not obRegrasVND.dtSetTipo.FieldByName('COD_REGRAVND').Isnull);
  finally
    obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
    obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
    obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
    obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasVendas.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('COD_REGRAVND').AsInteger = obRegrasVND.dataSet.FieldByName('COD_REGRAVND').AsInteger then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    	TDBGrid(sender).canvas.brush.color := TColor($00ACC891);
  end
  else if Column.Field.Dataset.FieldbyName('COD_REGRAVND').AsInteger > 0 then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    	TDBGrid(sender).canvas.brush.color := TColor($008C9A9A);
  end
  else
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := clWindow;// TColor($0084DAFF);
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadRegrasVendas.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	vRecnoTipo: Integer;
  vRecnoTpVnd: Integer;
  vRecnoCtrl: Integer;
  vRecnoCond: Integer;
begin
  if (Key = VK_SPACE) then
  begin
  	try
    	Screen.Cursor := crHourGlass;

      vRecnoTipo  := obRegrasVND.dtSetTipo.RecNo;
      vRecnoTpVnd := obRegrasVND.dtSetTipoVendaOS.RecNo;
      vRecnoCtrl  := obRegrasVND.dtSetControle.RecNo;
      vRecnoCond  := obRegrasVND.dtSetCondPag.RecNo;

      obRegrasVND._vincular_tipo(not obRegrasVND.dtSetTipo.FieldByName('COD_REGRAVND').Isnull);
    finally
      obRegrasVND.dtSetTipo.RecNo        := vRecnoTipo;
      obRegrasVND.dtSetTipoVendaOS.RecNo := vRecnoTpVnd;
      obRegrasVND.dtSetControle.RecNo    := vRecnoCtrl;
      obRegrasVND.dtSetCondPag.RecNo     := vRecnoCond;

      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadRegrasVendas.DBGrid5TitleClick(Column: TColumn);
begin
  inherited;
	exit;
	vDadosIni.DBGridOnTitleClick(DBGrid5, Column);
end;

procedure TFrmCadRegrasVendas.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
//  if trim(DBLookupComboBox2.Text)='' then
//    if not obRegrasVND._validaCtrl then
//      if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
//        DBEdit6.SetFocus;
end;

procedure TFrmCadRegrasVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (obRegrasVND <> nil) then
  begin
    obRegrasVND.Cancel;
    obRegrasVND.free;
    obRegrasVND := nil;
  end;
  Action := caFree;
  FrmCadRegrasVendas := nil;
end;

procedure TFrmCadRegrasVendas.FormCreate(Sender: TObject);
var
  i:integer;
begin
  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  DBGrid1.DataSource := DtmCadBasicos.dsRegraVND;
  obRegrasVND := TRegrasVendas.create;
  PageControl1.ActivePage := TabSheet2;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadRegrasVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if obRegrasVND.dataSet.State in [dsInsert, dsEdit] then
      exit;
    if PageControl1.ActivePage = TabSheet2 then
    begin
    	if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
      	BitBtn3.SetFocus;
      BitBtn3Click(Sender);
    end;
  end
  else if key = VK_ESCAPE then
  begin
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end
end;

procedure TFrmCadRegrasVendas.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS342]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not obRegrasVND._lixeiraCheia);
  end;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
  	'Processo "BAS350" VINCULAR COND PAG AS REGRAS DE VENDA'+ #13 +
    'Processo "BAS508" VINCULAR TIPO VND AS REGRAS DE VENDA'+ #13 +
    'Processo "BAS510" VINCULAR CONTROLE AS REGRAS DE VENDA';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadRegrasVendas.SpeedButton1Click(Sender: TObject);
begin
  if obRegrasVND.Edit then
  begin
//    obRegrasVND._ListaTipoVendas(trim(obRegrasVND.dataSet.FieldByName('TIPO').AsString),DBLookupComboBox1);
//    obRegrasVND._ListaControles(DBLookupComboBox2);
    inherited;
    TabSheet3.Show;

    if obRegrasVND.dataSet.FieldByName('PESSOAFISICA').AsString = 'S' then
    	DBComboBox2.ItemIndex := 0
    else if obRegrasVND.dataSet.FieldByName('PESSOAFISICA').AsString = 'N' then
    	DBComboBox2.ItemIndex := 1
    else if obRegrasVND.dataSet.FieldByName('PESSOAFISICA').AsString = 'A' then
    	DBComboBox2.ItemIndex := 2;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end;
end;

procedure TFrmCadRegrasVendas.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not obRegrasVND._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS342]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS343]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TFrmCadRegrasVendas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obRegrasVND.Delete then
  begin
    lixeiraVazia(not obRegrasVND._lixeiraCheia);
    if not obRegrasVND._lixeiraCheia then
      obRegrasVND.montaSelect(obRegrasVND.ultimasql);
  end;
end;

procedure TFrmCadRegrasVendas.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if obRegrasVND._restauraRegistro then
  begin
    lixeiraVazia(not obRegrasVND._lixeiraCheia);
    if not obRegrasVND._lixeiraCheia then
      obRegrasVND.montaSelect(obRegrasVND.ultimasql);
  end;
end;

procedure TFrmCadRegrasVendas.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not obRegrasVND._listarTipo then
  	exit;  

  if not obRegrasVND._listarTipoVndOS then
  	exit;

  if not obRegrasVND._listarControle then
  	exit;

  if not obRegrasVND._listarCondPag then
  	exit;

  TabSheet4.Show;
  TabSheet8.Show;
end;

end.
