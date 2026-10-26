unit uCadCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesProdutos, DBCtrls, uDadosIni;

type
  TfrmCadCategoria = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    pnCadCategoria: TPanel;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Panel103: TPanel;
    TreeViewCat: TTreeView;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    tsImpressao: TTabSheet;
    pnImpressao: TPanel;
    Panel25: TPanel;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    RadioGroup1: TRadioGroup;
    GroupBox5: TGroupBox;
    CheckBox10: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure pnCadCategoriaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
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
  frmCadCategoria: TfrmCadCategoria;
  CadCategorias: TCadCategorias;

implementation

uses
  uDtmAtivo, UDtmProdutos, uDataSet_OOP, DB;

{$R *.dfm}

procedure TfrmCadCategoria.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS413', 'CONSULTA', '', 'CATEGORIA', '',
    CadCategorias.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not CadCategorias.ConsultaCampos('CATEGORIA', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not CadCategorias.ConsultaCampos('CATEGORIA', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadCategoria.BitBtn20Click(Sender: TObject);
begin
	TForm(pnImpressao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadCategoria.BitBtn21Click(Sender: TObject);
begin
  TForm(pnImpressao.Parent).ModalResult := ID_CANCEL;
end;

procedure TfrmCadCategoria.BitBtn3Click(Sender: TObject);
begin
  try
    if not CadCategorias.Insert then
      exit;

    DBLookupComboBox1.KeyValue := 0;
    CadCategorias.montarTreeView(TreeViewCat);
    vDadosIni.abreForm('Categorias', pnCadCategoria, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadCategorias.Cancel;
      CadCategorias.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCategoria.BitBtn4Click(Sender: TObject);
begin
  if not CadCategorias.post then
  begin
    setFocusCampoErro(CadCategorias.vNomeCampoErro, CadCategorias.vMensagemErro);
    exit;
  end;
  TForm(pnCadCategoria.Parent).ModalResult := IDOK;
end;

procedure TfrmCadCategoria.BitBtn5Click(Sender: TObject);
begin
  inherited;
  CadCategorias.Cancel;
  CadCategorias.RollBackTransacao;
  TForm(pnCadCategoria.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadCategoria.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
  	CadCategorias._marcaDesmarcaLinha;
end;

procedure TfrmCadCategoria.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadCategoria.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    CadCategorias._marcaDesmarcaLinha;
end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if (CadCategorias <> nil) then
    CadCategorias.Cancel;

  CadCategorias.free;
  CadCategorias := nil;

  Action := caFree;
  if (frmCadCategoria <> nil) then
    frmCadCategoria := nil;
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadCategorias := TCadCategorias.create;
  tsCadastro.TabVisible := False;
  tsImpressao.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
//  TabSheet4.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCategoria.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (CadCategorias.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadCategoria.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsCadCategorias;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadCategoria.pnCadCategoriaEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    DBLookupComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TfrmCadCategoria.SpeedButton10Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CadCategorias._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadCategoria.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadCategorias.dataSet.IsEmpty then
      Exit;
      
    if not CadCategorias.Edit then
      Exit;

    CadCategorias.montarTreeView(TreeViewCat);
    vDadosIni.abreForm('Categorias', pnCadCategoria, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadCategorias.Cancel;
      CadCategorias.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCategoria.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('BAS416', 'EXCLUIR', '', 'CATEGORIA',
      CadCategorias.dataSet.FieldByName('COD_CATEGORIA').AsString, CadCategorias.buscas, false) then
      Exit;

    CadCategorias.Delete;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadCategorias.Cancel;
      CadCategorias.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCategoria.SpeedButton3Click(Sender: TObject);
begin
	if not vDadosIni.abreForm('Impressão', pnImpressao, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
  	Exit;

  if not CadCategorias._imprimirCategorias(RadioGroup1.ItemIndex = 1, CheckBox10.Checked) then
    exit;
end;

procedure TfrmCadCategoria.SpeedButton6Click(Sender: TObject);
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;
    frmCadCategoria.Enabled := false;
    DBGrid1.Visible := false;
  	if not CadCategorias.sincronizarCategoriasEmLote then
      exit;
  finally
  	frmCadCategoria.Enabled := true;
    DBGrid1.Visible := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadCategoria.SpeedButton9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CadCategorias._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
