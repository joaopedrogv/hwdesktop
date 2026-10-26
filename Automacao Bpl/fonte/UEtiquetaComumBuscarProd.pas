unit UEtiquetaComumBuscarProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditHw, Grids, DBGrids, Buttons, ExtCtrls, 
  UClassesProdutos, UDtmProdutos, Menus;

type
  TfrmEtiquetaComumBuscarProd = class(TForm)
    pnEtiquetasTer: TPanel;
    GroupBox58: TGroupBox;
    btSelectAllEtiq: TSpeedButton;
    btUnSelectAllEtiq: TSpeedButton;
    PopupMenu1: TPopupMenu;
    SelecionartodosprodutosEtiq: TMenuItem;
    DesmarcatodosprodutosEtiq: TMenuItem;
    GroupBox59: TGroupBox;
    DBGrid19: TDBGrid;
    Panel1: TPanel;
    Label184: TLabel;
    SpeedButton20: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    EditFiscal2: TEditFiscal;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid18: TDBGrid;
    Label186: TLabel;
    ckUmEtiqCadaProd: TCheckBox;
    SpeedButtonSelTodos: TSpeedButton;
    SpeedButtonDesmarcarTodos: TSpeedButton;
    procedure SpeedButtonDesmarcarTodosClick(Sender: TObject);
    procedure SpeedButtonSelTodosClick(Sender: TObject);
    procedure ckUmEtiqCadaProdClick(Sender: TObject);
    procedure DesmarcatodosprodutosEtiqClick(Sender: TObject);
    procedure SelecionartodosprodutosEtiqClick(Sender: TObject);
    procedure btUnSelectAllEtiqClick(Sender: TObject);
    procedure btSelectAllEtiqClick(Sender: TObject);
    procedure DBGrid19CellClick(Column: TColumn);
    procedure DBGrid19DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure DBGrid19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure DBGrid18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditFiscal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditFiscal2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEtiquetaComumBuscarProd: TfrmEtiquetaComumBuscarProd;
  vEtiComum: TEtiquetasComum;
  TelaCadastro: Integer;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TfrmEtiquetaComumBuscarProd.btSelectAllEtiqClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
		vEtiComum._marcaTodosTemp(DBGrid19.DataSource.DataSet);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEtiquetaComumBuscarProd.btUnSelectAllEtiqClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
		vEtiComum._desmarcarTodosTemp(DBGrid19.DataSource.DataSet);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEtiquetaComumBuscarProd.ckUmEtiqCadaProdClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    if ckUmEtiqCadaProd.Visible  then
      vEtiComum.montarDataSetNF(ckUmEtiqCadaProd.Checked, TelaCadastro);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEtiquetaComumBuscarProd.DBGrid18KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_RETURN then
  begin
    if Label186.Caption <> 'PRODUTO NÃO ENCONTRADO' then
      vEtiComum.addItem(Trim(EditFiscal2.Text));
    if (Self.Enabled) and (Self.Visible) and (EditFiscal2.CanFocus) then
	    EditFiscal2.SetFocus;
  end
  else if Key = VK_TAB then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal2.CanFocus) then
	    EditFiscal2.SetFocus;
  end
  else if key = VK_F5 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid19.CanFocus) then
	    DBGrid19.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton20.Click
  else if key = VK_F7 then
    SpeedButton31.Click
  else if key = VK_ESCAPE then
    SpeedButton32.Click;
end;

procedure TfrmEtiquetaComumBuscarProd.DBGrid19CellClick(Column: TColumn);
begin
	if Column.FieldName = 'SEL' then
  	vEtiComum._marcaDesmarcaLinha(DBGrid19.DataSource.DataSet);
end;

procedure TfrmEtiquetaComumBuscarProd.DBGrid19DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;    
begin
	if (TDBGrid(sender).DataSource.DataSet.FieldByName('sel').AsString = 'S') then
    with TDBGrid(sender).canvas do
    begin
      Font.Color := clWindowText;
      if gdSelected in State then
        Brush.Color := clWindow
      else
        Brush.Color := clHighlight;
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

procedure TfrmEtiquetaComumBuscarProd.DBGrid19KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_SPACE then
    vEtiComum._marcaDesmarcaLinha(DBGrid19.DataSource.DataSet)
	else if Key = VK_DELETE then
    vEtiComum.deleteItem
  else if key = VK_F4 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal2.CanFocus) then
	    EditFiscal2.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton20.Click
  else if key = VK_F7 then
    SpeedButton31.Click
  else if key = VK_ESCAPE then
    SpeedButton32.Click;
end;

procedure TfrmEtiquetaComumBuscarProd.DesmarcatodosprodutosEtiqClick(
  Sender: TObject);
begin
	btUnSelectAllEtiqClick(Sender);
end;

procedure TfrmEtiquetaComumBuscarProd.EditFiscal2Exit(Sender: TObject);
begin
	if Trim(EditFiscal2.Text) =  'Código [F3 - Pesquisar]' then
  	exit;
    
	Label186.Caption := vEtiComum.existeProduto(Trim(EditFiscal2.Text));
  if Label186.Caption = 'PRODUTO NÃO ENCONTRADO' then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal2.CanFocus) then
	    EditFiscal2.SetFocus;
    exit;
  end;
end;

procedure TfrmEtiquetaComumBuscarProd.EditFiscal2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    DBGrid18.Columns[3].Showing;
    if (Self.Enabled) and (Self.Visible) and (DBGrid18.CanFocus) then
	    DBGrid18.SetFocus;
    DBGrid18.Columns[3].Showing;
  end
  else if key = VK_F5 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid19.CanFocus) then
	    DBGrid19.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton20.Click
  else if key = VK_F7 then
    SpeedButton31.Click
  else if key = VK_ESCAPE then
    SpeedButton32.Click
  else if key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if Trim(vDadosIni.vPesquisa) <> '' then
      EditFiscal2.Text := vEtiComum.getCodigo(Trim(vDadosIni.vPesquisa));
  end;
end;

procedure TfrmEtiquetaComumBuscarProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	vEtiComum.Destroy;
	Action := caFree;
  frmEtiquetaComumBuscarProd := nil;
end;

procedure TfrmEtiquetaComumBuscarProd.FormCreate(Sender: TObject);
begin
	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ETICOMUM' then
  begin
		if not Assigned(frmEtiquetaComumBuscarProd) then
			frmEtiquetaComumBuscarProd := TfrmEtiquetaComumBuscarProd(self);
  end;

	TelaCadastro := vDadosIni.vTipoForm;
  
	vEtiComum := TEtiquetasComum.Create;
end;

procedure TfrmEtiquetaComumBuscarProd.FormShow(Sender: TObject);
var
	I: Integer;
begin
	try
    DBGrid19.DataSource.DataSet.DisableControls;
    DBGrid19.DataSource.DataSet.First;
    while not DBGrid19.DataSource.DataSet.Eof do
    begin
      DBGrid19.DataSource.DataSet.Edit;
      DBGrid19.DataSource.DataSet.FieldByName('SEL').Value := Null;
      DBGrid19.DataSource.DataSet.Post;

      DBGrid19.DataSource.DataSet.Next;
    end;
  finally
    DBGrid19.DataSource.DataSet.First;
    DBGrid19.DataSource.DataSet.EnableControls;
  end;

  for I := 0 to DBGrid19.Columns.Count - 1 do
	  if DBGrid19.Columns[I].FieldName = 'COMB_CODIF' then
	  	DBGrid19.Columns[I].Visible := False
    else if DBGrid19.Columns[I].FieldName = 'COMB_CPRODANP' then
    	DBGrid19.Columns[I].Visible := False;

	for I := 0 to DBGrid19.Columns.Count - 1 do
  	if DBGrid19.Columns[I].FieldName = 'SEL' then
    begin
      if DBGrid19.Columns[I].Index <> 0 then
        DBGrid19.Columns[I].Index := 0;
      if DBGrid19.Columns[I].Width <> 18 then
        DBGrid19.Columns[I].Width := 18;
      Break;
    end;

    for I := 0 to DBGrid19.Columns.Count - 1 do
	    if DBGrid19.Columns[I].FieldName = 'BARCODE' then
      begin
  	    DBGrid19.Columns[I].Index := 1;
        Break;
      end;

    for I := 0 to DBGrid19.Columns.Count - 1 do
	    if DBGrid19.Columns[I].FieldName = 'BARCODE_EAN' then
      begin
  	    DBGrid19.Columns[I].Index := 2;
        Break;
      end;

    for I := 0 to DBGrid19.Columns.Count - 1 do
    	if DBGrid19.Columns[I].FieldName = 'QTDE' then
      begin
      	DBGrid19.Columns[I].Index := 3;
        Break;
      end;
      
	vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmEtiquetaComumBuscarProd.SelecionartodosprodutosEtiqClick(
  Sender: TObject);
begin
	btSelectAllEtiqClick(Sender);
end;

procedure TfrmEtiquetaComumBuscarProd.SpeedButton20Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
begin
	DBGrid19.DataSource.DataSet.DisableControls;
  try
  	Screen.Cursor := crHourGlass;

    ARescueOptions := DBGrid19.Options;
    DBGrid19.Options := DBGrid19.Options + [dgMultiSelect];

    DBGrid19.DataSource.DataSet.First;
    while not DBGrid19.DataSource.DataSet.Eof do
    begin
    	if (DBGrid19.SelectedRows.CurrentRowSelected) and (DBGrid19.DataSource.DataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	DBGrid19.DataSource.DataSet.Edit;
      	DBGrid19.DataSource.DataSet.FieldByName('sel').AsString := 'S';
        DBGrid19.DataSource.DataSet.Post;
      end
    	else if DBGrid19.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid19.SelectedRows.CurrentRowSelected := DBGrid19.DataSource.DataSet.FieldByName('sel').AsString = 'S';
      DBGrid19.DataSource.DataSet.Next;
    end;

    if vDadosIni.PesqPros('PRO152', 'IMPRIMIR', '', 'PRODUTOS', '', vEtiComum.buscas, true) then
      vEtiComum.ImprimirEtiquetasQRP('PRODUTOS', 'Etiqueta de Produtos', DBGrid19, true, false);
  finally
  	DBGrid19.Options := ARescueOptions;
    DBGrid19.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEtiquetaComumBuscarProd.SpeedButton31Click(Sender: TObject);
begin
	vEtiComum.deleteTodas;
end;

procedure TfrmEtiquetaComumBuscarProd.SpeedButton32Click(Sender: TObject);
begin
	if vDadosIni.vTipoForm <> 6 then
		vEtiComum.salvaDados;
	Close;
end;

procedure TfrmEtiquetaComumBuscarProd.SpeedButtonDesmarcarTodosClick(
  Sender: TObject);
begin
	btUnSelectAllEtiqClick(Sender);
end;

procedure TfrmEtiquetaComumBuscarProd.SpeedButtonSelTodosClick(Sender: TObject);
begin
	btSelectAllEtiqClick(Sender);
end;

end.
