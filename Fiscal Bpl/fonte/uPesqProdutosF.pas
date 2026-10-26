unit uPesqProdutosF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Menus, uEditHw;

type
  TfrmPesqProdutos = class(TfrmPadrao)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    Edit1: TEditFiscal;
    btCampo: TSpeedButton;
    btCondicao: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCondicaoClick(Sender: TObject);
    procedure btCampoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
    vUltTabPreco: string;
  public
    { Public declarations }
  end;

var
  frmPesqProdutos: TfrmPesqProdutos;

implementation

uses uDtmFiscalHwF, uPrincipalF, uDadosIniFiscal, uHwF, StrUtils;

{$R *.dfm}

procedure TfrmPesqProdutos.btCampoClick(Sender: TObject);
begin
  inherited;
  btCampo.Caption := IfThen(btCampo.Caption = 'Descrição do Produto', 'Código Barra', 'Descrição do Produto');
end;

procedure TfrmPesqProdutos.btCondicaoClick(Sender: TObject);
begin
  inherited;
  btCondicao.Caption := IfThen(btCondicao.Caption = 'Começa', 'Está contido', 'Começa');
end;

procedure TfrmPesqProdutos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV <> 'S' then
    SpeedButton2Click(Sender);
end;

procedure TfrmPesqProdutos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('em_promocao').AsString = 'S' then
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmPesqProdutos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV <> 'S' then
  begin
    if Key = VK_TAB then
      Edit1.SetFocus
    else if (key = VK_RETURN) or (key = vk_f3) then
      SpeedButton2Click(Sender);
  end;
end;

procedure TfrmPesqProdutos.Edit1Change(Sender: TObject);
begin
  inherited;
  obProd.FindNearest([Edit1.Text]);
  DBGrid1.SelectedRows.CurrentRowSelected := true;
end;

procedure TfrmPesqProdutos.Edit1Enter(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vModoConsulta <> 'A' then
  begin
    Edit1.OnChange := nil;
  end
  else
  begin
    Edit1.OnChange := Edit1Change;
  end;
end;

procedure TfrmPesqProdutos.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
    ActiveControl := DBGrid1
  else if key = VK_UP then
  begin
    obProd.Prior;
    DBGrid1.SelectedRows.CurrentRowSelected := true;
  end
  else if key = VK_DOWN then
  begin
    obProd.Next;
    DBGrid1.SelectedRows.CurrentRowSelected := true;
  end
  else if (key = VK_RETURN) and (vDadosIniF.vModoConsulta <> 'A') then
  begin
    obProd.CommitaTransacao;
    //if obProd.selecionaProduto(Edit1.Text, RadioButton1.Checked) then
    if obProd.selecionaProduto(IfThen((btCondicao.Caption = 'Está contido') and (btCampo.Caption <> 'Código Barra'), '%') +
                               Edit1.Text,
                               btCampo.Caption = 'Código Barra') then
      DBGrid1.SetFocus
    else
      Edit1.SetFocus;
  end
  else if (key = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure TfrmPesqProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  _GravaConfiguracoesString(btCampo.Name, btCampo.Caption);
  _GravaConfiguracoesString(btCondicao.Name, btCondicao.Caption);
end;

procedure TfrmPesqProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vModoConsulta <> 'A' then
    Edit1.OnChange := nil;
end;

procedure TfrmPesqProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    if Key = VK_ESCAPE then
      ModalResult := mrCancel
    else if (key = 13) then
      ModalResult := mrOk
    else if key = 79 then
    begin
      if ActiveControl = DBGrid1 then
        Edit1.SetFocus
      else
        DBGrid1.SetFocus;
    end
    else if key = 66 then
      vDadosIniF.PostKeyEx32(66, [ssShift], false)
    else if key = 67 then
      vDadosIniF.MenuFiscal;
  end
  else
  begin
    if (key = VK_F3) then //or ((key = VK_RETURN) and (vDadosIniF.vModoConsulta = 'A')) then
      ModalResult := mrOk
    else if key = VK_ESCAPE then
      ModalResult := mrCancel
    else if key = VK_F7 then
    begin
      btCampo.Click;
//      RadioButton1.Checked := not RadioButton1.Checked;
//      RadioButton2.Checked := not RadioButton1.Checked;
      Edit1.SetFocus;
    end
    else if key = VK_F8 then
    begin
      btCondicao.Click;
      Edit1.SetFocus;
    end
    else if Key = VK_F2 then
    begin
      if ActiveControl = DBGrid1 then
        Edit1.SetFocus
      else
        DBGrid1.SetFocus;
    end;
  end;
end;

procedure TfrmPesqProdutos.FormShow(Sender: TObject);
begin
  inherited;                         
  btCampo.Enabled := True;
  btCondicao.Enabled := True;
  btCampo.Caption := _LerConfiguracoesRegistroString(btCampo.Name, btCampo.Caption);
  btCondicao.Caption := _LerConfiguracoesRegistroString(btCondicao.Name, btCondicao.Caption);
  if (vDadosIniF.vImpressaoCodigoCupom = 'GC') and
    (vDadosIniF.vUsaCodigoBarras <> 'S') then
    dbGrid1.Columns[0].FieldName := 'CODIGO'
  else
    dbGrid1.Columns[0].FieldName := 'NUM_FAB_PROD';
    
  {if vDadosIniF.vUsaCodigoBarras <> 'S' then
  begin
    DBGrid1.Columns[0].Title.CAPTION := 'Código';
    dbGrid1.Columns[0].FieldName := 'CODIGO';
    RadioButton1.Caption := 'Código';
  end;}
  obProd.IndexFieldNames := 'DESCR_PROD';
  if not obProd.dataSet.IsEmpty then
    obProd.dataSet.Refresh;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    GroupBox2.Caption := 'Produtos               Pressione enter para escolher';
    GroupBox1.Caption :=
      'Informe o codigo de barras do produto - Aperte a tecla Prod para ir para grade';
//    RadioButton1.Checked := true;
//    RadioButton2.Enabled := false;
    btCampo.Caption := 'Código Barra';
    btCampo.Enabled := False;
    btCondicao.Caption := 'Começa';
    btCondicao.Enabled := False;
  end
  else
  begin
    obProd.abreUltimaConsulta;
    Edit1.Clear;
    Edit1.SetFocus;
  end;
  if vUltTabPreco <> obProd.tabelaPrecoCaption then
    DBGrid1.DataSource.DataSet.Close;
  vUltTabPreco := obProd.tabelaPrecoCaption;
  Self.Caption := 'Consultade Produto - ' + obProd.tabelaPrecoCaption;
end;

procedure TfrmPesqProdutos.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

procedure TfrmPesqProdutos.RadioButton1Click(Sender: TObject);
begin
  inherited;
  Edit1.Clear;
  Edit1.SetFocus;
  if vDadosIniF.vUsaCodigoBarras <> 'S' then
    obProd.IndexFieldNames := 'CODIGO'
  else
    obProd.IndexFieldNames := 'NUM_FAB_PROD';
end;

procedure TfrmPesqProdutos.RadioButton2Click(Sender: TObject);
begin
  inherited;
  Edit1.Clear;
  Edit1.SetFocus;
  obProd.IndexFieldNames := 'DESCR_PROD';
end;

procedure TfrmPesqProdutos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmPesqProdutos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vPesquisa = 'BUSCA_ESTOQUE_PARCIAL' then
    vDadosIniF.vPesquisa :=
      IntToStr(obProd.dataSet.FieldByName('grupo_prod').AsInteger) + '|' +
      Trim(obProd.dataSet.FieldByName('cod_prod').AsString) + '|' +
      Trim(obProd.dataSet.FieldByName('num_fab_prod').AsString) + '|' +
      Trim(obProd.dataSet.FieldByName('descr_prod').AsString) + '|';
  ModalResult := mrOk;
end;

initialization
  RegisterClass(TfrmPesqProdutos);
finalization
  UnRegisterClass(TfrmPesqProdutos);

end.

