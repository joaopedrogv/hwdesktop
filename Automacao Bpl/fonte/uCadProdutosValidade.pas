unit uCadProdutosValidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesProdutos, DBCtrls, FilterFR,
  FilterPadraoFR, DB;

type
  TfrmCadProdutosValidade = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEditCodGrade: TDBEdit;
    DBEditNumLote: TDBEdit;
    DBEditQtdeLote: TDBEdit;
    DBEditDataFabricante: TDBEdit;
    DBEditDataValidade: TDBEdit;
    DBEditQtdeCompra: TDBEdit;
    DBEditCodCliente: TDBEdit;
    GroupBoxDocFiscal: TGroupBox;
    Label14: TLabel;
    DBEditNumNF: TDBEdit;
    Label15: TLabel;
    DBEditSerieNF: TDBEdit;
    Label16: TLabel;
    DBEditDataLancNF: TDBEdit;
    Label17: TLabel;
    DBEditValorNF: TDBEdit;
    FilterFramePadrao1: TFilterFramePadrao;
    Label18: TLabel;
    DBEditGrupoProd: TDBEdit;
    Label19: TLabel;
    DBEditCodProd: TDBEdit;
    DBEditNumFabProd: TDBEdit;
    tsSelecionaGradeProd: TTabSheet;
    ScrollBox4: TScrollBox;
    pnSelecionaGradeProd: TPanel;
    GroupBox7: TGroupBox;
    Panel5: TPanel;
    Label201: TLabel;
    Label202: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    BitBtn8: TBitBtn;
    dsSelecionaGradeProd: TDataSource;
    DBEditDescricaoProduto: TDBEdit;
    DBEditDescricaoGrade: TDBEdit;
    DBEditNomeCliente: TDBEdit;
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBEditCodClienteExit(Sender: TObject);
    procedure DBEditCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditNumFabProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditNumFabProdExit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutosValidade: TfrmCadProdutosValidade;
  ProdutosRastro: TProdutosRastro;

implementation

uses UDtmProdutos, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadProdutosValidade.BitBtn1Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('BAS223', 'PESQUISAR', '', 'PRODUTOS_RASTRO', '', ProdutosRastro.buscas, true) then
    exit;

  inherited;
//  if MaskEdit2.Visible then
//  begin
//    if not ProdutosRastro.ConsultaCampos('PRODUTOS_RASTRO', ComboBox1.Text,
//      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
//      ' PRODUTOS_RASTRO.GRUPO_PROD, PRODUTOS_RASTRO.COD_PROD, PRODUTOS_RASTRO.COD_GRADE, PRODUTOS_RASTRO.COD_EMPRESA, ' +
//      ' PRODUTOS_RASTRO.NLOTE, PRODUTOS_RASTRO.QLOTE, PRODUTOS_RASTRO.DFAB, PRODUTOS_RASTRO.DVAL, ' +
//      ' CASE WHEN (PRODUTOS_RASTRO.COD_NF > 0) THEN NOTAFISCAL.COD_CLIENTE ELSE PRODUTOS_RASTRO.COD_CLIENTE END COD_CLIENTE, ' +
//      ' CASE WHEN (PRODUTOS_RASTRO.COD_NF > 0) THEN SP_PRODUTOS_RASTRO_NF.QTDE_COMPRA ELSE PRODUTOS_RASTRO.QTDE_COMPRA END QTDE_COMPRA, ' +
//      ' PRODUTOS_RASTRO.COD_NF, ' +
//    	' CASE WHEN (COD_GRADE_PROD.COD_GRADE > 0) THEN ' +
//      '        COALESCE(COD_GRADE_PROD.QTDE, 0) ' +
//      '      ELSE ' +
//      '        COALESCE(PRODUTOS.EST_F, 0) ' +
//      ' END ESTOQUE, ' +
//      ' PRODUTOS.NUM_FAB_PROD, PRODUTOS.DESCR_PROD,' +
//      ' GRUPOS.DESCRICAO GRUPO, ' +
//      ' SUB_GRUPO.DESCRICAO SUBGRUPO, ' +
//      ' MARCA_PROD.DESCRICAO_MARCA MARCA, ' +
//      ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO RAZAO_CLIENTE, CLIENTES.CPFCGC CPFCGC_CLIENTE, ' +
//      ' NOTAFISCAL.NUM_NF, NOTAFISCAL.SERIE, NOTAFISCAL.DATA_LANC, NOTAFISCAL.VALOR_TOTAL ',
//      ' INNER JOIN PRODUTOS ON PRODUTOS_RASTRO.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND PRODUTOS_RASTRO.COD_PROD = PRODUTOS.COD_PROD AND PRODUTOS_RASTRO.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
//			' LEFT JOIN COD_GRADE_PROD ON COD_GRADE_PROD.GRUPO_PROD = PRODUTOS_RASTRO.GRUPO_PROD AND COD_GRADE_PROD.COD_PROD = PRODUTOS_RASTRO.COD_PROD AND COD_GRADE_PROD.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA ' +
//      ' LEFT JOIN NOTAFISCAL ON NOTAFISCAL.COD_NF = PRODUTOS_RASTRO.COD_NF AND NOTAFISCAL.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA ' +
//      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = CASE WHEN (PRODUTOS_RASTRO.COD_NF > 0) THEN NOTAFISCAL.COD_CLIENTE ELSE PRODUTOS_RASTRO.COD_CLIENTE END AND CLIENTES.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA ' +
//      ' LEFT JOIN SP_PRODUTOS_RASTRO_NF (PRODUTOS_RASTRO.GRUPO_PROD, PRODUTOS_RASTRO.COD_PROD, PRODUTOS_RASTRO.COD_GRADE, PRODUTOS_RASTRO.COD_EMPRESA, PRODUTOS_RASTRO.COD_NF) ON 1 = 1 ' +
//			' LEFT JOIN GRUPOS ON GRUPOS.CODIGO_GRUP = PRODUTOS.GRUPO_PROD ' +
//      ' LEFT JOIN SUB_GRUPO ON SUB_GRUPO.CODIGO_SUBGR = PRODUTOS.SUB_G_PROD ' +
//      ' LEFT JOIN MARCA_PROD ON MARCA_PROD.COD_MARCA = PRODUTOS.COD_MARCA ', '') then
//				if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
//        	combobox1.setfocus;
//  end
//  else if ProdutosRastro.ConsultaCampos('PRODUTOS_RASTRO', MaskEdit3.text, ComboBox1.Text,
//    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
//     ' PRODUTOS_RASTRO.GRUPO_PROD, PRODUTOS_RASTRO.COD_PROD, PRODUTOS_RASTRO.COD_GRADE, PRODUTOS_RASTRO.COD_EMPRESA, ' +
//     ' PRODUTOS_RASTRO.NLOTE, PRODUTOS_RASTRO.QLOTE, PRODUTOS_RASTRO.DFAB, PRODUTOS_RASTRO.DVAL, ' +
//     ' CASE WHEN (PRODUTOS_RASTRO.COD_NF > 0) THEN NOTAFISCAL.COD_CLIENTE ELSE PRODUTOS_RASTRO.COD_CLIENTE END COD_CLIENTE, ' +
//     ' CASE WHEN (PRODUTOS_RASTRO.COD_NF > 0) THEN SP_PRODUTOS_RASTRO_NF.QTDE_COMPRA ELSE PRODUTOS_RASTRO.QTDE_COMPRA END QTDE_COMPRA, ' +
//     ' PRODUTOS_RASTRO.COD_NF, ' +
//     ' CASE WHEN (COD_GRADE_PROD.COD_GRADE > 0) THEN ' +
//     '        COALESCE(COD_GRADE_PROD.QTDE, 0) ' +
//     '      ELSE ' +
//     '        COALESCE(PRODUTOS.EST_F, 0) ' +
//     ' END ESTOQUE, ' +
//     ' PRODUTOS.NUM_FAB_PROD, PRODUTOS.DESCR_PROD,' +
//     ' GRUPOS.DESCRICAO GRUPO, ' +
//     ' SUB_GRUPO.DESCRICAO SUBGRUPO, ' +
//     ' MARCA_PROD.DESCRICAO_MARCA MARCA, ' +
//     ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO RAZAO_CLIENTE, CLIENTES.CPFCGC CPFCGC_CLIENTE, ' +
//     ' NOTAFISCAL.NUM_NF, NOTAFISCAL.SERIE, NOTAFISCAL.DATA_LANC, NOTAFISCAL.VALOR_TOTAL ',
//     ' INNER JOIN PRODUTOS ON PRODUTOS_RASTRO.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND PRODUTOS_RASTRO.COD_PROD = PRODUTOS.COD_PROD AND PRODUTOS_RASTRO.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
//     ' LEFT JOIN COD_GRADE_PROD ON COD_GRADE_PROD.GRUPO_PROD = PRODUTOS_RASTRO.GRUPO_PROD AND COD_GRADE_PROD.COD_PROD = PRODUTOS_RASTRO.COD_PROD AND COD_GRADE_PROD.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA ' +
//     ' LEFT JOIN NOTAFISCAL ON NOTAFISCAL.COD_NF = PRODUTOS_RASTRO.COD_NF AND NOTAFISCAL.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA ' +
//     ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = CASE WHEN (PRODUTOS_RASTRO.COD_NF > 0) THEN NOTAFISCAL.COD_CLIENTE ELSE PRODUTOS_RASTRO.COD_CLIENTE END AND CLIENTES.COD_EMPRESA = PRODUTOS_RASTRO.COD_EMPRESA ' +
//     ' LEFT JOIN SP_PRODUTOS_RASTRO_NF (PRODUTOS_RASTRO.GRUPO_PROD, PRODUTOS_RASTRO.COD_PROD, PRODUTOS_RASTRO.COD_GRADE, PRODUTOS_RASTRO.COD_EMPRESA, PRODUTOS_RASTRO.COD_NF) ON 1 = 1 ' +
//     ' LEFT JOIN GRUPOS ON GRUPOS.CODIGO_GRUP = PRODUTOS.GRUPO_PROD ' +
//     ' LEFT JOIN SUB_GRUPO ON SUB_GRUPO.CODIGO_SUBGR = PRODUTOS.SUB_G_PROD ' +
//     ' LEFT JOIN MARCA_PROD ON MARCA_PROD.COD_MARCA = PRODUTOS.COD_MARCA ', '') then
//       if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
//       	ComboBox1.SetFocus;

//	BitBtn3.Enabled := True;

  ProdutosRastro.SQLMaker.FilterMk.FreeFilters.Add('cod_empresa', vDadosIni.cod_empresa);
//  ProdutosRastro.SQLMaker.FilterMk.FreeFilters.Add('estoque', 0, '>');
  ProdutosRastro.SQLMaker.FilterMk.FreeFilters.Add(FilterFramePadrao1.GetFiltros);
  ProdutosRastro.RunSQLMaker;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadProdutosValidade.BitBtn3Click(Sender: TObject);
begin
  try
    if not ProdutosRastro.Insert then
      exit;

    inherited;

    ProdutosRastro.vNumFabProd := '';

    BitBtn4.Enabled                := True;

    DBEditNumFabProd.Enabled       := True;
    DBEditCodCliente.Enabled       := True;
    
    DBEditNumLote.Enabled          := True;
    DBEditQtdeLote.Enabled         := True;
    DBEditDataFabricante.Enabled   := True;
    DBEditDataValidade.Enabled     := True;
    DBEditQtdeCompra.Enabled       := True;

    GroupBoxDocFiscal.Visible      := False;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEditNumFabProd.CanFocus) then
      DBEditNumFabProd.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      ProdutosRastro.Cancel;
      ProdutosRastro.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadProdutosValidade.BitBtn4Click(Sender: TObject);
begin
  if not ProdutosRastro.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(ProdutosRastro.vNomeCampoErro, ProdutosRastro.vMensagemErro);
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
      if ProdutosRastro.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEditNumFabProd.CanFocus) then
          DBEditNumFabProd.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadProdutosValidade.BitBtn5Click(Sender: TObject);
begin
  inherited;
	ProdutosRastro.Cancel;
  ProdutosRastro.RollBackTransacao;
end;

procedure TfrmCadProdutosValidade.BitBtn8Click(Sender: TObject);
begin
  inherited;
	TForm(pnSelecionaGradeProd.Parent).ModalResult := IDOK;
end;

procedure TfrmCadProdutosValidade.btSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ProdutosRastro._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProdutosValidade.btUnSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ProdutosRastro._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProdutosValidade.DBEditCodClienteExit(Sender: TObject);
begin
  if (activecontrol = bitbtn4) or (activecontrol = bitbtn5) or (activecontrol = bitbtn6) then
    exit;

  if trim(TDBEdit(Sender).Text) = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      if ProdutosRastro.dataSet.State in [dsInsert, dsEdit] then
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ', 'Consulta de Fornecedores');
        if vDadosIni.vPesquisa <> '' then
        begin
        	ProdutosRastro.dataSet.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.vPesquisa);

          ProdutosRastro.buscaCliente(ProdutosRastro.dataSet.FieldByName('COD_CLIENTE').AsInteger);
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).setfocus;
    end;
  end
  else
  begin
    if not ProdutosRastro.buscaCliente(ProdutosRastro.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    begin
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).SetFocus;
      Exit;
    end;
  end;

end;

procedure TfrmCadProdutosValidade.DBEditCodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  try
    if key = VK_F3 then
    begin
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ', 'Consulta de Fornecedores');
      if (Trim(vDadosIni.vPesquisa) <> '') then
      begin
        ProdutosRastro.dataSet.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.vPesquisa);

      	ProdutosRastro.buscaCliente(ProdutosRastro.dataSet.FieldByName('COD_CLIENTE').AsInteger);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadProdutosValidade.DBEditNumFabProdExit(Sender: TObject);
begin
  inherited;
	if (activecontrol = bitbtn4) or (activecontrol = bitbtn5) or (activecontrol = bitbtn6) then
    exit;

  if trim(TDBEdit(Sender).Text) = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      if ProdutosRastro.dataSet.State in [dsInsert, dsEdit] then
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
        begin
        	if (trim(vDadosIni.vPesquisaGrupo_prod) <> '') and (trim(vDadosIni.vPesquisaCod_prod) <> '') then
          begin
          	ProdutosRastro.dataSet.FieldByName('GRUPO_PROD').AsInteger := StrToInt(vDadosIni.vPesquisaGrupo_prod);
          	ProdutosRastro.dataSet.FieldByName('COD_PROD').AsString := trim(vDadosIni.vPesquisaCod_prod);
            ProdutosRastro.dataSet.FieldByName('COD_GRADE').AsInteger := 0;
          end;

          ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString := vDadosIni.vPesquisa;
          ProdutosRastro.buscaProduto(
          	ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString,
            ProdutosRastro.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            ProdutosRastro.dataSet.FieldByName('COD_PROD').AsString,
            0,
            true);

          ProdutosRastro.vNumFabProd := ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).setfocus;
    end;
  end
  else
  begin
    if not ProdutosRastro.buscaProduto(
    	ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').asstring,
      vDadosIni.IfThen(trim(ProdutosRastro.vNumFabProd) = trim(ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString),
      	ProdutosRastro.dataSet.FieldByName('GRUPO_PROD').AsInteger, 0),
      vDadosIni.IfThen(trim(ProdutosRastro.vNumFabProd) = trim(ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString),
      	ProdutosRastro.dataSet.FieldByName('COD_PROD').AsString, ''),
      vDadosIni.IfThen(trim(ProdutosRastro.vNumFabProd) = trim(ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString),
      	ProdutosRastro.dataSet.FieldByName('COD_GRADE').AsInteger, 0),
      true) then
    begin
    	ProdutosRastro.vNumFabProd := '';
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).SetFocus;
      Exit;
    end
    else
    	ProdutosRastro.vNumFabProd := ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString;
  end;
end;

procedure TfrmCadProdutosValidade.DBEditNumFabProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
  	try
      Screen.Cursor := crHourGlass;
      if ProdutosRastro.dataSet.State in [dsInsert, dsEdit] then
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
        begin
          if (trim(vDadosIni.vPesquisaGrupo_prod) <> '') and  (trim(vDadosIni.vPesquisaCod_prod) <> '') then
          begin
            ProdutosRastro.dataSet.FieldByName('GRUPO_PROD').AsInteger := StrToInt(vDadosIni.vPesquisaGrupo_prod);
            ProdutosRastro.dataSet.FieldByName('COD_PROD').AsString := trim(vDadosIni.vPesquisaCod_prod);
            ProdutosRastro.dataSet.FieldByName('COD_GRADE').AsInteger := 0;
          end;

          ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.vPesquisa;
          ProdutosRastro.buscaProduto(
            ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD').AsString,
            ProdutosRastro.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            ProdutosRastro.dataSet.FieldByName('COD_PROD').AsString,
            0,
            true);

          ProdutosRastro.vNumFabProd := ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadProdutosValidade.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    ProdutosRastro._marcaDesmarcaLinha;
end;

procedure TfrmCadProdutosValidade.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S') then
  begin
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
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

	if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

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

procedure TfrmCadProdutosValidade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
  	SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
  	BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    ProdutosRastro._marcaDesmarcaLinha;
end;

procedure TfrmCadProdutosValidade.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
	BitBtn8Click(Sender) ;
end;

procedure TfrmCadProdutosValidade.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    BitBtn8Click(Sender)
  else if key = VK_TAB then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
    	BitBtn8.SetFocus;
end;

procedure TfrmCadProdutosValidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (ProdutosRastro <> nil) then
    ProdutosRastro.Cancel;

  ProdutosRastro.free;
  ProdutosRastro := nil;

  Action := caFree;
  if (frmCadProdutosValidade <> nil) then
    frmCadProdutosValidade := nil;
end;

procedure TfrmCadProdutosValidade.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ProdutosRastro := TProdutosRastro.create;
  ProdutosRastro.abreProdutosRastro;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  tsSelecionaGradeProd.TabVisible := false;

  SpeedButton25.Visible := false;
  SpeedButton5.Visible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadProdutosValidade.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsProdutosRastro;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira - [BAS226]';
  end;

//  BitBtn3.Enabled := False;
  FilterFramePadrao1.TodosToggle(True).FillForm(ProdutosRastro.dataSet, nil, 'Todos');
  FilterFramePadrao1.FillForm(ProdutosRastro.dataSet, nil);

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadProdutosValidade.SpeedButton1Click(Sender: TObject);
begin
  try
    if ProdutosRastro.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('BAS225', 'ALTERAR', '', 'PRODUTOS_RASTRO',
      ProdutosRastro.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
      ProdutosRastro.dataSet.FieldByName('COD_PROD').AsString + '-' +
      ProdutosRastro.dataSet.FieldByName('COD_GRADE').AsString + '-' +
      ProdutosRastro.dataSet.FieldByName('NLOTE').AsString,
      ProdutosRastro.buscas, true) then
      	exit;

    if not ProdutosRastro.Edit then
      Exit;
    inherited;

    ProdutosRastro.vNumFabProd := ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD').AsString;

    BitBtn4.Enabled                := False;

    DBEditNumFabProd.Enabled       := False;
    DBEditCodCliente.Enabled       := False;

    DBEditNumLote.Enabled          := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger <= 0;
    DBEditQtdeLote.Enabled         := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger <= 0;
    DBEditDataFabricante.Enabled   := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger <= 0;
    DBEditDataValidade.Enabled     := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger <= 0;
    DBEditQtdeCompra.Enabled       := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger <= 0;

    GroupBoxDocFiscal.Visible      := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger > 0;
    DBEditNumNF.Enabled            := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger > 0;
    DBEditSerieNF.Enabled          := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger > 0;
    DBEditDataLancNF.Enabled       := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger > 0;
    DBEditValorNF.Enabled          := ProdutosRastro.dataSet.FieldByName('COD_NF').AsInteger > 0;

    ProdutosRastro.dataSet.FieldByName('DESCR_PROD_CALC').AsString :=
    	ProdutosRastro.dataSet.FieldByName('DESCR_PROD').AsString;
    ProdutosRastro.dataSet.FieldByName('GRADE_CALC').AsString :=
    	ProdutosRastro.dataSet.FieldByName('GRADE').AsString;
    ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD_CALC').AsString :=
    	ProdutosRastro.dataSet.FieldByName('NUM_FAB_PROD').AsString;
      
    ProdutosRastro.dataSet.FieldByName('NOME_CLIENTE_CALC').AsString :=
    	ProdutosRastro.dataSet.FieldByName('NOME_CLIENTE').AsString;
    ProdutosRastro.dataSet.FieldByName('RAZAO_CLIENTE_CALC').AsString :=
    	ProdutosRastro.dataSet.FieldByName('RAZAO_CLIENTE').AsString;
    ProdutosRastro.dataSet.FieldByName('CPFCGC_CLIENTE_CALC').AsString :=
    	ProdutosRastro.dataSet.FieldByName('CPFCGC_CLIENTE').AsString;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEditQtdeLote.CanFocus) then
      DBEditQtdeLote.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      ProdutosRastro.Cancel;
      ProdutosRastro.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadProdutosValidade.SpeedButton2Click(Sender: TObject);
begin
  inherited;
	try
    if not vDadosIni.PesqPros('BAS226', 'EXCLUIR', '', 'PRODUTOS_RASTRO',
      ProdutosRastro.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
      ProdutosRastro.dataSet.FieldByName('COD_PROD').AsString + '-' +
      ProdutosRastro.dataSet.FieldByName('COD_GRADE').AsString + '-' +
      ProdutosRastro.dataSet.FieldByName('NLOTE').AsString,
      ProdutosRastro.buscas, false) then
      	Exit;

    ProdutosRastro.Delete;

    SpeedButton25.Visible := false;
    SpeedButton5.Visible := false;
    
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ProdutosRastro.Cancel;
      ProdutosRastro.RollBackTransacao;
    end;
  end;
end;

end.
