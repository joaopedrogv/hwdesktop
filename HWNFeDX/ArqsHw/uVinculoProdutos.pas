unit uVinculoProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, StrUtils,
  uClasseNFe, Vcl.Buttons, Vcl.Mask, Vcl.Menus, Vcl.DBCtrls;

type
  TfrmVinculoProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    tvProd: TTreeView;
    Splitter1: TSplitter;
    Panel6: TPanel;
    gridItensNF: TDBGrid;
    pnProd: TPanel;
    Panel8: TPanel;
    gridProd: TDBGrid;
    Splitter2: TSplitter;
    edTexto: TMaskEdit;
    btCampo: TSpeedButton;
    btCondicao: TSpeedButton;
    btConsultar: TBitBtn;
    btVincular: TBitBtn;
    btConcluir: TBitBtn;
    tvean: TTreeView;
    Label2: TLabel;
    Splitter3: TSplitter;
    Panel7: TPanel;
    btCampoTmp: TSpeedButton;
    btCondicaoTmp: TSpeedButton;
    edTextoTmp: TMaskEdit;
    btConsultarTmp: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel9: TPanel;
    Label1: TLabel;
    SpeedButton40: TSpeedButton;
    Panel11: TPanel;
    Label83: TLabel;
    btCadProdTemp: TBitBtn;
    btRemProdTemp: TBitBtn;
    Panel10: TPanel;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    VerProduto: TMenuItem;
    Verprodutocomomesmocdigoexistente1: TMenuItem;
    btOpcoesCad: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvProdDblClick(Sender: TObject);
    procedure btCampoClick(Sender: TObject);
    procedure btCondicaoClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btVincularClick(Sender: TObject);
    procedure gridItensNFDblClick(Sender: TObject);
    procedure edTextoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridProdDblClick(Sender: TObject);
    procedure gridItensNFDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btCampoTmpClick(Sender: TObject);
    procedure btCondicaoTmpClick(Sender: TObject);
    procedure btConsultarTmpClick(Sender: TObject);
    procedure edTextoTmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridItensNFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure gridItensNFCellClick(Column: TColumn);
    procedure SpeedButton40Click(Sender: TObject);
    procedure btCadProdTempClick(Sender: TObject);
    procedure btRemProdTempClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VerProdutoClick(Sender: TObject);
    procedure Verprodutocomomesmocdigoexistente1Click(Sender: TObject);
    procedure btOpcoesCadClick(Sender: TObject);
  private
    { Private declarations }
    FdsItemNF: TDataSource;
    FdsProd: TDataSource;
    FdataSet: TClientDataSet;
    FdataSetCodigoEAN: TClientDataSet;
    FdsCodigoEAN: TDataSource;
    FvincProd: TVinculoProdutos;
    FpopMenu: TPopupMenu;
    FpopMenuOpcao: TPopupMenu;
    FtvX, FtvY: Integer;
    FpopMenuOut: TPopupMenu;//Outras notas

    procedure tvProd_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvProd_MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure vinculo_options_remover(Sender: TObject);

    procedure nf_cadastrar_todos_itens(Sender: TObject);
    procedure nf_cadastrar_unico_produto_codigo(Sender: TObject);
    procedure nf_unidade_conversao_cadastrar(Sender: TObject);
    procedure nf_unidade_conversao_visualizar(Sender: TObject);
    procedure nf_unidades_selecionar_item(Sender: TObject);
    procedure nf_unidades_selecionar_todos(Sender: TObject);
    procedure nf_unidades_selecionar_todos_faltantes(Sender: TObject);
    procedure nf_unidades_selecionar_mesma_und_todos_faltantes(Sender: TObject);

    procedure FdataSetAfterScroll(DataSet: TDataSet);

    procedure montarDadosDataSet;
  public
    { Public declarations }
    property vincProd: TVinculoProdutos read FvincProd write FvincProd;
  end;

var
  frmVinculoProdutos: TfrmVinculoProdutos;

implementation

{$R *.dfm}

uses
  System.Math, uVinculoProdutosCodigoEANEmb, hw_undconv_utils, hw_utils;

  function hw_config_sistema_dx( pChaveIdent, pUsuario: WideString; pCodEmpresa, pNivel: Integer): Integer; stdcall; external 'cons40.dll';

procedure TfrmVinculoProdutos.btRemProdTempClick(Sender: TObject);
var
  vHabConcluir: boolean;
  vVisibleTvProd: boolean;
  vVisibleTvEan: boolean;
begin
  try
    vHabConcluir := btConcluir.Enabled;
    vVisibleTvProd := tvProd.Visible;
    vVisibleTvEan := tvean.Visible;

    btCampoTmp.Enabled := false;
    btCondicaoTmp.Enabled := false;
    btConsultarTmp.Enabled := false;
    SpeedButton1.Enabled := false;
    SpeedButton2.Enabled := false;
    btCadProdTemp.Enabled := false;
    btRemProdTemp.Enabled := false;
    btOpcoesCad.Enabled := false;
    btCampo.Enabled := false;
    btCondicao.Enabled := false;
    btConsultar.Enabled := false;
    btVincular.Enabled := false;
    btConcluir.Enabled := false;
    gridItensNF.Visible := false;
    tvProd.Visible := false;
    tvean.Visible := false;

    if not FvincProd.RemoverVinculoProdutoXML(FdataSet) then
      exit;

    ModalResult := mrRetry;
  finally
    btCampoTmp.Enabled := true;
    btCondicaoTmp.Enabled := true;
    btConsultarTmp.Enabled := true;
    SpeedButton1.Enabled := true;
    SpeedButton2.Enabled := true;
    btCadProdTemp.Enabled := true;
    btRemProdTemp.Enabled := true;
    btOpcoesCad.Enabled := true;
    btCampo.Enabled := true;
    btCondicao.Enabled := true;
    btConsultar.Enabled := true;
    btVincular.Enabled := true;
    if vHabConcluir then
      btConcluir.Enabled := true;
    if vVisibleTvProd then
      tvProd.Visible := true;
    if vVisibleTvEan then
      tvean.Visible := true;
    gridItensNF.Visible := true;
  end;
end;

procedure TfrmVinculoProdutos.btCadProdTempClick(Sender: TObject);
var
  vHabConcluir: boolean;
  vVisibleTvProd: boolean;
  vVisibleTvEan: boolean;
begin
  try
    vHabConcluir := btConcluir.Enabled;
    vVisibleTvProd := tvProd.Visible;
    vVisibleTvEan := tvean.Visible;

    btCampoTmp.Enabled := false;
    btCondicaoTmp.Enabled := false;
    btConsultarTmp.Enabled := false;
    SpeedButton1.Enabled := false;
    SpeedButton2.Enabled := false;
    btCadProdTemp.Enabled := false;
    btRemProdTemp.Enabled := false;
    btOpcoesCad.Enabled := false;
    btCampo.Enabled := false;
    btCondicao.Enabled := false;
    btConsultar.Enabled := false;
    btVincular.Enabled := false;
    btConcluir.Enabled := false;
    gridItensNF.Visible := false;
    tvProd.Visible := false;
    tvean.Visible := false;

    if not FvincProd.CadastrarProdutoXML(FdataSet, FdataSetCodigoEAN) then
      exit;

    ModalResult := mrYes;
  finally
    btCampoTmp.Enabled := true;
    btCondicaoTmp.Enabled := true;
    btConsultarTmp.Enabled := true;
    SpeedButton1.Enabled := true;
    SpeedButton2.Enabled := true;
    btCadProdTemp.Enabled := true;
    btRemProdTemp.Enabled := true;
    btOpcoesCad.Enabled := true;
    btCampo.Enabled := true;
    btCondicao.Enabled := true;
    btConsultar.Enabled := true;
    btVincular.Enabled := true;
    if vHabConcluir then
      btConcluir.Enabled := true;
    if vVisibleTvProd then
      tvProd.Visible := true;
    if vVisibleTvEan then
      tvean.Visible := true;
    gridItensNF.Visible := true;
  end;
end;

procedure TfrmVinculoProdutos.btCampoClick(Sender: TObject);
begin
  if string(btCampo.Caption).Equals('Descrição') then
    btCampo.Caption := 'Codigo'
  else
    btCampo.Caption := 'Descrição';
end;

procedure TfrmVinculoProdutos.btCampoTmpClick(Sender: TObject);
begin
  if string(btCampoTmp.Caption).Equals('Descrição') then
    btCampoTmp.Caption := 'Codigo'
  else
    btCampoTmp.Caption := 'Descrição';
end;

procedure TfrmVinculoProdutos.btCondicaoClick(Sender: TObject);
begin
  if string(btCondicao.Caption).Equals('Está contido') then
    btCondicao.Caption := 'Igual'
  else if string(btCondicao.Caption).Equals('Igual') then
    btCondicao.Caption := 'Começa'
  else
    btCondicao.Caption := 'Está contido';
end;

procedure TfrmVinculoProdutos.btCondicaoTmpClick(Sender: TObject);
begin
  if string(btCondicaoTmp.Caption).Equals('Está contido') then
    btCondicaoTmp.Caption := 'Igual'
  else if string(btCondicaoTmp.Caption).Equals('Igual') then
    btCondicaoTmp.Caption := 'Começa'
  else
    btCondicaoTmp.Caption := 'Está contido';
end;

procedure TfrmVinculoProdutos.btConsultarClick(Sender: TObject);
var
  I: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    if FvincProd.consultarProduto(btCampo.Caption, btCondicao.Caption, edTexto.Text) then
    begin
      for I := 0 to gridProd.Columns.Count - 1 do with gridProd.Columns[I] do
        Width := IfThen(FieldName.Equals('Num Fab')     , 89) +
                 IfThen(FieldName.Equals('Descrição')   , 253) +
                 IfThen(FieldName.Equals('Und')         , 23) +
                 IfThen(FieldName.Equals('Grupo')       , 64) +
                 IfThen(FieldName.Equals('Codigo')      , 40) +
                 IfThen(FieldName.Equals('NCM')         , 52) +
                 IfThen(FieldName.Equals('CST')         , 23) +
                 IfThen(FieldName.Equals('CFOP')        , 34) +
                 IfThen(FieldName.Equals('Marca')       , 64) +
                 IfThen(FieldName.Equals('Aplicação')   , 200) +
                 IfThen(FieldName.Equals('Preço tabela'), 64);

      if gridProd.CanFocus then
        gridProd.SetFocus;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVinculoProdutos.btConsultarTmpClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not FvincProd.consultarProdutoTmp(FdataSet, btCampoTmp.Caption, btCondicaoTmp.Caption, edTextoTmp.Text) then
      exit;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVinculoProdutos.btOpcoesCadClick(Sender: TObject);
var
  AmenuItem: TMenuItem;
begin
  inherited;
  if Assigned(FpopMenuOut) then
    FpopMenuOut.Free;

  begin
    FpopMenuOut := TPopupMenu.Create(Self);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := 'Cadastrar todos itens';
    AmenuItem.OnClick := nf_cadastrar_todos_itens;
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := 'Cadastrar único produto por código';
    AmenuItem.OnClick := nf_cadastrar_unico_produto_codigo;
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOpcao);
    AmenuItem.Caption := 'Selecionar 1 única unidade principal para todos produtos antes de cadastrar';
    AmenuItem.OnClick := nf_unidades_selecionar_todos;
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOpcao);
    AmenuItem.Caption := 'Selecionar 1 única unidade principal para todos produtos "sem preenchimento" antes de cadastrar';
    AmenuItem.OnClick := nf_unidades_selecionar_todos_faltantes;
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOpcao);
    AmenuItem.Caption := 'Selecionar a mesma unidade de medida do xml como principal para todos produtos "sem preenchimento" antes de cadastrar';
    AmenuItem.OnClick := nf_unidades_selecionar_mesma_und_todos_faltantes;
    FpopMenuOut.Items.Add(AmenuItem);

  end;
  FpopMenuOut.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmVinculoProdutos.btVincularClick(Sender: TObject);
var
  ArecNo: Integer;
begin
  ArecNo := FdataSet.RecNo;
  FdataSet.AfterScroll := nil;
  try
    FvincProd.Vincular(FdataSet.FieldByName('nitem').AsInteger);

    montarDadosDataSet;

  finally
    if (ArecNo > 0) and (ArecNo <= FdataSet.RecordCount) then
      FdataSet.RecNo := ArecNo;

    while not FdataSet.Eof do
    begin
      if FdataSet.FieldByName('num_fab_prod').AsString.Trim.IsEmpty then
      begin
        if edTexto.CanFocus then
          edTexto.SetFocus;
        Break;
      end;
      FdataSet.Next;
    end;
    FdataSet.AfterScroll := FdataSetAfterScroll;
    FdataSetAfterScroll(FdataSet);

    if not pnProd.Visible then
      if btConcluir.CanFocus then
        btConcluir.SetFocus;
  end;
end;

procedure TfrmVinculoProdutos.edTextoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btConsultar.Click;
end;

procedure TfrmVinculoProdutos.edTextoTmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
    btConsultarTmp.Click;
end;

procedure TfrmVinculoProdutos.FdataSetAfterScroll(DataSet: TDataSet);
var
  Anode, Anode2: TTreeNode;
  I: Integer;
begin
  tvProd.Items.Clear;
  tvean.Items.Clear;
  if DataSet.IsEmpty then
    Exit;

  if FdataSet.RecNo > FvincProd.detalhes.Count then
    Exit;

  if FdataSet.RecNo < 1 then
    Exit;

  if not Assigned(FvincProd.detalhes.Items[FdataSet.RecNo - 1].prod) then
  begin
    tvProd.Items.AddChild(nil, 'Produto não localizado');
    pnProd.Visible := True;
    Splitter2.Top := -1;
  end
  else
  begin
    with FvincProd.detalhes.Items[FdataSet.RecNo - 1].prod do
    begin
      Anode := tvProd.Items.AddChild(nil, descr_prod);
      tvProd.Items.AddChild(Anode, 'Num Fab: '      + num_fab_prod);
      tvProd.Items.AddChild(Anode, 'Unidade: '      + unidade);
      tvProd.Items.AddChild(Anode, 'Grupo: '        + grupo_prod.ToString);
      tvProd.Items.AddChild(Anode, 'Codigo: '       + cod_prod);
      tvProd.Items.AddChild(Anode, 'NCM: '          + nbm);
      tvProd.Items.AddChild(Anode, 'cst: '          + cst_prod);
      tvProd.Items.AddChild(Anode, 'CFOP: '         + codigo_nop.ToString);
      tvProd.Items.AddChild(Anode, 'Marca: '        + marca_p);
      tvProd.Items.AddChild(Anode, 'Aplicacao: '    + aplicacao_prod);
      tvProd.Items.AddChild(Anode, 'Preço tabela: ' + Format('%n', [prec_tab_prod]));
    end;

    if Assigned(FvincProd.detalhes.Items[FdataSet.RecNo - 1].outs) then
    begin
      Anode2 := tvProd.Items.AddChild(nil, Format('Total de %d produto(s) vinculado(s)', [FvincProd.detalhes.Items[FdataSet.RecNo - 1].outs.Count]));
      for I := 0 to FvincProd.detalhes.Items[FdataSet.RecNo - 1].outs.Count - 1 do
        with FvincProd.detalhes.Items[FdataSet.RecNo - 1].outs.Items[I] do
        begin
          Anode := tvProd.Items.AddChild(Anode2, Format('%s - %s', [num_fab_prod, descr_prod]));
          tvProd.Items.AddChild(Anode, 'Num Fab: '      + num_fab_prod);
          tvProd.Items.AddChild(Anode, 'Unidade: '      + unidade);
          tvProd.Items.AddChild(Anode, 'Grupo: '        + grupo_prod.ToString);
          tvProd.Items.AddChild(Anode, 'Codigo: '       + cod_prod);
          tvProd.Items.AddChild(Anode, 'NCM: '          + nbm);
          tvProd.Items.AddChild(Anode, 'cst: '          + cst_prod);
          tvProd.Items.AddChild(Anode, 'CFOP: '         + codigo_nop.ToString);
          tvProd.Items.AddChild(Anode, 'Marca: '        + marca_p);
          tvProd.Items.AddChild(Anode, 'Aplicacao: '    + aplicacao_prod);
          tvProd.Items.AddChild(Anode, 'Preço tabela: ' + Format('%n', [prec_tab_prod]));
        end;
    end;

    if Assigned(FvincProd.detalhes.Items[FdataSet.RecNo - 1].eans) then
      for I := 0 to FvincProd.detalhes.Items[FdataSet.RecNo - 1].eans.Count - 1 do
        with FvincProd.detalhes.Items[FdataSet.RecNo - 1].eans.Items[I] do
        begin
          Anode := tvean.Items.AddChild(nil, descr_prod);
          tvean.Items.AddChild(Anode, 'Num Fab: '      + num_fab_prod);
          tvean.Items.AddChild(Anode, 'Unidade: '      + unidade);
          tvean.Items.AddChild(Anode, 'Grupo: '        + grupo_prod.ToString);
          tvean.Items.AddChild(Anode, 'Codigo: '       + cod_prod);
          tvean.Items.AddChild(Anode, 'NCM: '          + nbm);
          tvean.Items.AddChild(Anode, 'cst: '          + cst_prod);
          tvean.Items.AddChild(Anode, 'CFOP: '         + codigo_nop.ToString);
          tvean.Items.AddChild(Anode, 'Marca: '        + marca_p);
          tvean.Items.AddChild(Anode, 'Aplicacao: '    + aplicacao_prod);
          tvean.Items.AddChild(Anode, 'Preço tabela: ' + Format('%n', [prec_tab_prod]));
        end;

    pnProd.Visible := False;
  end;
  for I := 0 to tvProd.Items.Count - 1 do
    if (tvProd.Items[I].Level = 0) and (tvProd.Items[I].Index = 1) then
      tvProd.Items[I].Expand(False);

  tvProd.Items[0].Selected := True;
  tvProd.Selected.Expand(True);

  if tvean.Items.Count > 0 then
  begin
    tvean.Items[0].Selected := True;
    tvean.Selected.Expand(True);
  end;
end;

procedure TfrmVinculoProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TAuxiliar.SetRegistry(Self.ClassName, btCampo.Name   , btCampo.Caption);
  TAuxiliar.SetRegistry(Self.ClassName, btCondicao.Name, btCondicao.Caption);
  TAuxiliar.SetRegistry(Self.ClassName, pnProd.Name    , pnProd.Height);
  TAuxiliar.SetRegistry(Self.ClassName, tvean.Name +'2', tvean.Height);

  if Assigned(FdsItemNF) then
    FreeAndNil(FdsItemNF);
  if Assigned(FdsCodigoEAN) then
    FreeAndNil(FdsCodigoEAN);
  if Assigned(FdataSet) then
    FreeAndNil(FdataSet);
  if Assigned(FdataSetCodigoEAN) then
    FreeAndNil(FdataSetCodigoEAN);
  if Assigned(FpopMenu) then
    FreeAndNil(FpopMenu);
  if Assigned(FpopMenuOpcao) then
    FreeAndNil(FpopMenuOpcao);
  if Assigned(FpopMenuOut) then
    FreeAndNil(FpopMenuOut);
end;

procedure TfrmVinculoProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    SpeedButton1Click(Sender)
  else if Key = VK_F4 then
    SpeedButton2Click(Sender);
end;

procedure TfrmVinculoProdutos.FormShow(Sender: TObject);
var
  I: Integer;
begin
  gridItensNF.OnCellClick      := nil;
  gridItensNF.OnDblClick       := nil;
  gridItensNF.OnDrawColumnCell := nil;
  gridItensNF.OnKeyDown        := nil;

  if not Assigned(FdsItemNF) then
    FdsItemNF := TDataSource.Create(Self);
  FdsItemNF.AutoEdit := False;

  if not Assigned(FdsCodigoEAN) then
    FdsCodigoEAN := TDataSource.Create(Self);
  FdsCodigoEAN.AutoEdit := False;

  if not Assigned(FdsProd) then
    FdsProd := TDataSource.Create(Self);
  FdsProd.AutoEdit := False;

  if not Assigned(FdataSet) then
    FdataSet := TClientDataSet.Create(Self);

  if not Assigned(FdataSetCodigoEAN) then
    FdataSetCodigoEAN := TClientDataSet.Create(Self);

  FdataSet.FieldDefs.Add('temp'              , ftString, 1);
  FdataSet.FieldDefs.Add('cod_empresa'       , ftSmallint  );
  FdataSet.FieldDefs.Add('sel'               , ftString, 1);
  FdataSet.FieldDefs.Add('opcao'             , ftString, 1);
  FdataSet.FieldDefs.Add('nitem'             , ftSmallint  );
  FdataSet.FieldDefs.Add('num_fab_fornecedor', ftString, 60);
  FdataSet.FieldDefs.Add('descricao_item'    , ftString, 75);
  FdataSet.FieldDefs.Add('ncm'               , ftString,  8);
  FdataSet.FieldDefs.Add('cst'               , ftString,  3);
  FdataSet.FieldDefs.Add('codigo_nop'        , ftInteger   );
  FdataSet.FieldDefs.Add('referencia'        , ftString,  6);
  FdataSet.FieldDefs.Add('unidade'           , ftString,  6);
  FdataSet.FieldDefs.Add('ucom'              , ftString,  6);
  FdataSet.FieldDefs.Add('unidade_princ'     , ftString,  6);
  FdataSet.FieldDefs.Add('quantidade'        , ftFloat     );
  FdataSet.FieldDefs.Add('valor_unitario'    , ftFloat     );
  FdataSet.FieldDefs.Add('valor_total'       , ftFloat     );
  FdataSet.FieldDefs.Add('grupo_prod'        , ftInteger   );
  FdataSet.FieldDefs.Add('cod_prod'          , ftString,  6);
  FdataSet.FieldDefs.Add('num_fab_prod'      , ftString, 20);
  FdataSet.FieldDefs.Add('cean'              , ftString, 14);
  FdataSet.FieldDefs.Add('cest'              , ftString,  7);
  FdataSet.FieldDefs.Add('csosn'             , ftString,  3);
  FdataSet.FieldDefs.Add('prec_cus_prod'     , ftFloat     );
  FdataSet.FieldDefs.Add('prec_cusm_prod'    , ftFloat     );
  FdataSet.FieldDefs.Add('cprod'             , ftString, 60);
  FdataSet.FieldDefs.Add('cnpj'              , ftString, 18);
  FdataSet.FieldDefs.Add('uf_dest'           , ftString, 2);
  FdataSet.FieldDefs.Add('chave_nfe'         , ftString, 60);
  FdataSet.FieldDefs.Add('prod_vinc'         , ftString, 1);
  FdataSet.FieldDefs.Add('prod_cad'          , ftString, 1);
  FdataSet.FieldDefs.Add('icms_orig'         , ftString, 1);
  FdataSet.FieldDefs.Add('cprod_existente'   , ftString, 1);
  FdataSet.FieldDefs.Add('cod_cliente'       , ftInteger);
  FdataSet.FieldDefs.Add('emb_prod'          , ftString, 10);
  FdataSet.FieldDefs.Add('qtdemb'            , ftFloat     );
  FdataSet.CreateDataSet;

  FdataSetCodigoEAN.FieldDefs.Add('nitem'             , ftSmallint  );
  FdataSetCodigoEAN.FieldDefs.Add('grupo_prod'        , ftSmallint  );
  FdataSetCodigoEAN.FieldDefs.Add('cod_prod'          , ftString,  6);
  FdataSetCodigoEAN.FieldDefs.Add('cod_empresa'       , ftSmallint  );
  FdataSetCodigoEAN.FieldDefs.Add('codigo_ean'        , ftString,  20);
  FdataSetCodigoEAN.FieldDefs.Add('unidade'           , ftString,  6);
  FdataSetCodigoEAN.FieldDefs.Add('quantidade'        , ftFloat     );
  FdataSetCodigoEAN.CreateDataSet;

  FdataSet.FieldByName('temp').DisplayWidth := 0;
  FdataSet.FieldByName('temp').DisplayLabel               := '';
  FdataSet.FieldByName('sel').DisplayLabel                := 'Sel';
  FdataSet.FieldByName('opcao').DisplayLabel              := 'Op';
  FdataSet.FieldByName('nitem').DisplayLabel              := 'Seq';
  FdataSet.FieldByName('num_fab_fornecedor').DisplayLabel := 'Codigo';
  FdataSet.FieldByName('descricao_item').DisplayLabel     := 'Descrição';
  FdataSet.FieldByName('ncm').DisplayLabel                := 'NCM';
  FdataSet.FieldByName('cst').DisplayLabel                := 'cst/csosn';
  FdataSet.FieldByName('csosn').DisplayLabel              := 'csosn';
  FdataSet.FieldByName('codigo_nop').DisplayLabel         := 'CFOP';
  FdataSet.FieldByName('referencia').DisplayLabel         := 'UND';
  FdataSet.FieldByName('quantidade').DisplayLabel         := 'Quantidade';
  FdataSet.FieldByName('valor_unitario').DisplayLabel     := 'Vl Unit';
  FdataSet.FieldByName('valor_total').DisplayLabel        := 'Vl Tot';
  FdataSet.FieldByName('grupo_prod').DisplayLabel         := 'Grupo';
  FdataSet.FieldByName('cod_prod').DisplayLabel           := 'Cod';
  FdataSet.FieldByName('num_fab_prod').DisplayLabel       := 'Num Fab';
  FdataSet.FieldByName('cean').DisplayLabel               := 'EAN';
  FdataSet.FieldByName('unidade_princ').DisplayLabel      := 'Und Princ';
  FdataSet.FieldByName('emb_prod').DisplayLabel           := 'Embalagem';
  FdataSet.FieldByName('qtdemb').DisplayLabel             := 'Qtde Emb';
  FdataSet.FieldByName('cod_empresa').Visible             := false;
  FdataSet.FieldByName('unidade').Visible                 := false;
  FdataSet.FieldByName('ucom').Visible                    := false;
  FdataSet.FieldByName('cest').Visible                    := false;
  FdataSet.FieldByName('csosn').Visible                   := false;
  FdataSet.FieldByName('prec_cus_prod').Visible           := false;
  FdataSet.FieldByName('prec_cusm_prod').Visible          := false;
  FdataSet.FieldByName('cnpj').Visible                    := false;
  FdataSet.FieldByName('uf_dest').Visible                 := false;
  FdataSet.FieldByName('cprod').Visible                   := false;
  FdataSet.FieldByName('chave_nfe').Visible               := false;
  FdataSet.FieldByName('prod_vinc').Visible               := false;
  FdataSet.FieldByName('prod_cad').Visible                := false;
  FdataSet.FieldByName('icms_orig').Visible               := false;
  FdataSet.FieldByName('cprod_existente').Visible         := false;
  FdataSet.FieldByName('cod_cliente').Visible             := false;
  FdataSet.FieldByName('emb_prod').Visible                := false;
  FdataSet.FieldByName('qtdemb').Visible                  := false;

  TFloatField(FdataSet.FieldByName('quantidade')).DisplayFormat     := '#0.000';
  TFloatField(FdataSet.FieldByName('valor_unitario')).DisplayFormat := '#0.00';
  TFloatField(FdataSet.FieldByName('valor_total')).DisplayFormat    := '#0.00';

  montarDadosDataSet;

  FdataSet.First;
  while not FdataSet.Eof do
  begin
    if FdataSet.FieldByName('num_fab_prod').AsString.Trim.IsEmpty then
      Break;
    FdataSet.Next;
  end;
  FdataSet.First;

  FdsItemNF.DataSet := FdataSet;
  FdsCodigoEAN.DataSet := FdataSetCodigoEAN;
  FdataSet.AfterScroll := FdataSetAfterScroll;
  FdataSetAfterScroll(FdataSet);
  gridItensNF.DataSource := FdsItemNF;
  for I := 0 to gridItensNF.Columns.Count - 1 do with gridItensNF.Columns[i] do
    Width := IfThen(FieldName.Equals('sel')               , 18) +
             IfThen(FieldName.Equals('opcao')             , 25) +
             IfThen(FieldName.Equals('nitem')             , 25) +
             IfThen(FieldName.Equals('num_fab_fornecedor'), 74) +
             IfThen(FieldName.Equals('descricao_item')    , 199) +
             IfThen(FieldName.Equals('ncm')               , 52) +
             IfThen(FieldName.Equals('cst')               , 49) +
             IfThen(FieldName.Equals('codigo_nop')        , 32) +
             IfThen(FieldName.Equals('referencia')        , 50) +
             IfThen(FieldName.Equals('quantidade')        , 64) +
             IfThen(FieldName.Equals('valor_unitario')    , 44) +
             IfThen(FieldName.Equals('valor_total')       , 46) +
             IfThen(FieldName.Equals('grupo_prod')        , 64) +
             IfThen(FieldName.Equals('cod_prod')          , 40) +
             IfThen(FieldName.Equals('num_fab_prod')      , 124) +
             IfThen(FieldName.Equals('cean')              , 74) +
             IfThen(FieldName.Equals('unidade_princ')     , 60);// +
//             IfThen(FieldName.Equals('emb_prod')          , 60) +
//             IfThen(FieldName.Equals('qtdemb')            , 60);

  FdsProd.DataSet := FvincProd.consProd;
  gridProd.DataSource := FdsProd;

  tvean.Height := 184;

  btCampoTmp.Caption    := TAuxiliar.GetRegistry(Self.ClassName, btCampoTmp.Name, btCampoTmp.Caption);
  btCondicaoTmp.Caption := TAuxiliar.GetRegistry(Self.ClassName, btCondicaoTmp.Name, btCondicaoTmp.Caption);

  btCampo.Caption       := TAuxiliar.GetRegistry(Self.ClassName, btCampo.Name, btCampo.Caption);
  btCondicao.Caption    := TAuxiliar.GetRegistry(Self.ClassName, btCondicao.Name, btCondicao.Caption);
  pnProd.Height         := Min(195, TAuxiliar.GetRegistry(Self.ClassName, pnProd.Name, pnProd.Height));
  tvean.Height          := TAuxiliar.GetRegistry(Self.ClassName, tvean.Name +'2', tvean.Height);

  tvProd.OnMouseDown    := tvProd_MouseDown;
  tvProd.OnMouseMove    := tvProd_MouseMove;

  edTextoTmp.Clear;
  edTextoTmp.CharCase   := ecUpperCase;
  edTexto.Clear;
  edTexto.CharCase      := ecUpperCase;

  gridItensNF.OnDblClick       := gridItensNFDblClick;
  gridItensNF.OnDrawColumnCell := gridItensNFDrawColumnCell;
  gridItensNF.OnKeyDown        := gridItensNFKeyDown;
  gridItensNF.OnCellClick      := gridItensNFCellClick;

  if edTexto.CanFocus then
    edTexto.SetFocus;
end;

procedure TfrmVinculoProdutos.gridItensNFCellClick(Column: TColumn);
var
  AmenuItem: TMenuItem;
begin
  if (UpperCase(Column.FieldName) = 'SEL') then
	  FvincProd._marcaDesmarcaLinhaProdutoXML(gridItensNF.DataSource.DataSet)
  else if (UpperCase(Column.FieldName) = 'OPCAO') then
  begin

    if Assigned(FpopMenuOpcao) then
      FpopMenuOpcao.Free;

    begin
      FpopMenuOpcao := TPopupMenu.Create(Self);

      AmenuItem := TMenuItem.Create(FpopMenuOpcao);
      AmenuItem.Caption := 'Cadastrar conversão para unidade de medida da NF';
      AmenuItem.OnClick := nf_unidade_conversao_cadastrar;
      FpopMenuOpcao.Items.Add(AmenuItem);

      AmenuItem := TMenuItem.Create(FpopMenuOpcao);
      AmenuItem.Caption := 'Visualizar conversões cadastradas';
      AmenuItem.OnClick := nf_unidade_conversao_visualizar;
      FpopMenuOpcao.Items.Add(AmenuItem);

      if not Assigned(FvincProd.detalhes.Items[FdataSet.RecNo - 1].prod) then
      begin
        AmenuItem := TMenuItem.Create(FpopMenuOpcao);
        AmenuItem.Caption := 'Selecionar unidade principal antes de cadastrar';
        AmenuItem.OnClick := nf_unidades_selecionar_item;
        FpopMenuOpcao.Items.Add(AmenuItem);
      end;

    end;
    FpopMenuOpcao.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

procedure TfrmVinculoProdutos.gridItensNFDblClick(Sender: TObject);
begin
  pnProd.Visible := True;
  Splitter2.Top := -1;
  if edTexto.CanFocus then
    edTexto.SetFocus;
end;

procedure TfrmVinculoProdutos.gridItensNFDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  R: TRect;
  SCapt : string;
  I: Integer;
  Astr1, Astr2: string;
  Button: Integer;
  Check: Integer;
  vProdCad: boolean;
  vCProdExist: boolean;
begin
  vProdCad := false;
  vCProdExist := false;

  if (Column.FieldName = 'descricao_item')
    and (trim(FdataSet.FieldByName('cod_prod').AsString) = '')
    and (FdataSet.FieldByName('prod_cad').AsString = 'S') then
  begin
    vProdCad := true;
    TDBGrid(sender).Canvas.Brush.Color := Panel10.Color;
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  if (Column.FieldName = 'num_fab_fornecedor')
    and (FdataSet.FieldByName('cprod_existente').AsString = 'S') then
  begin
    vCProdExist := true;
    TDBGrid(sender).Canvas.Brush.Color := Panel11.Color;
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if ((not vProdCad) and (not vCProdExist)) then
    if FdataSet.FieldByName('num_fab_prod').AsString.Trim.IsEmpty then
    begin
      TDBGrid(sender).Canvas.Brush.Color := TColor($00C6C6FF);
      TDBGrid(sender).Canvas.Font.Color := clWindowText;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else if Column.FieldName.ToLower.Equals('referencia') then
    begin
      for I := 0 to FvincProd.detalhes.Count - 1 do
        if FvincProd.detalhes.Items[I].item.nitem = FdataSet.FieldByName('nitem').AsInteger then
          if Assigned(FvincProd.detalhes.Items[I].prod) then
            if FvincProd.detalhes.Items[I].prod.unidade <> Column.Field.AsString then
            begin
              TDBGrid(sender).Canvas.Brush.Color := TColor($00C6C6FF);
              TDBGrid(sender).Canvas.Font.Color  := clWindowText;
              TDBGrid(sender).Canvas.FillRect(Rect);
              TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
            end;
    end
    else if Column.FieldName.ToLower.Equals('ncm') then
    begin
      for I := 0 to FvincProd.detalhes.Count - 1 do
        if FvincProd.detalhes.Items[I].item.nitem = FdataSet.FieldByName('nitem').AsInteger then
          if Assigned(FvincProd.detalhes.Items[I].prod) then
            if FvincProd.detalhes.Items[I].prod.nbm <> Column.Field.AsString then
            begin
              TDBGrid(sender).Canvas.Brush.Color := TColor($00C6C6FF);
              TDBGrid(sender).Canvas.Font.Color  := clWindowText;
              TDBGrid(sender).Canvas.FillRect(Rect);
              TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
            end;
    end
    else if Column.FieldName.ToLower.Equals('descricao_item') then
    begin
      for I := 0 to FvincProd.detalhes.Count - 1 do
        if FvincProd.detalhes.Items[I].item.nitem = FdataSet.FieldByName('nitem').AsInteger then
          if Assigned(FvincProd.detalhes.Items[I].prod) then
          begin
            for Astr1 in FvincProd.detalhes.Items[I].prod.descr_prod.ToUpper.Split([' ']) do
              for Astr2 in Column.Field.AsString.ToUpper.Split([' ']) do
                if (not TAuxiliar.apenasLetras(Astr1).IsEmpty) and (not TAuxiliar.apenasLetras(Astr2).IsEmpty) then
                  if (Astr1.Length > 1) and (Astr2.Length > 1) then
                    if Astr1.Equals(Astr2) then
                      Exit;

            TDBGrid(sender).Canvas.Brush.Color := TColor($00C6C6FF);
            TDBGrid(sender).Canvas.Font.Color  := clWindowText;
            TDBGrid(sender).Canvas.FillRect(Rect);
            TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
          end;
    end;

  if UpperCase(Column.FieldName) = 'SEL' then
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
  if UpperCase(Column.FieldName) = 'OPCAO' then
  begin
    if Column.Index <> 2 then
      Column.Index := 2;
    if Column.Width <> 18 then
      Column.Width := 18;

//    TDBGrid(sender).Canvas.FillRect(Rect);
//    BUTTON := 0;
//    R := Rect;
//    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
//    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, BUTTON, BUTTON or BUTTON);
    TDBGrid(sender).Canvas.FillRect(Rect);
    BUTTON := 0;
    R:=Rect;
    SCapt := '...';
    InflateRect(R,-2,-2); //Diminue o tamanho do Botão
    DrawFrameControl(TDBGrid(sender).Canvas.Handle,R,BUTTON, BUTTON or BUTTON);
    with TDBGrid(sender).Canvas do
    begin
      Brush.Style := bsClear;
      Font.Color := clBtnText;
      TextRect(Rect, (Rect.Left + Rect.Right - TextWidth(SCapt)) div 2, (Rect.Top + Rect.Bottom - TextHeight(SCapt)) div 2, SCapt);
    end;
  end;
end;

procedure TfrmVinculoProdutos.gridItensNFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    FvincProd._marcaDesmarcaLinhaProdutoXML(gridItensNF.DataSource.DataSet);
end;

procedure TfrmVinculoProdutos.gridProdDblClick(Sender: TObject);
var
  Aln: string;
  I: Integer;
begin

  Aln := '';
  for I := 0 to gridProd.Columns.Count - 1 do
    Aln := Aln + gridProd.Columns[I].FieldName + ' - ' + gridProd.Columns[I].Width.ToString + sLineBreak;


  ShowMessage( Aln );

  btVincular.Click;
end;

procedure TfrmVinculoProdutos.gridProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btVincular.Click;
end;

procedure TfrmVinculoProdutos.montarDadosDataSet;
var
  I: Integer;
begin
  FdataSet.EmptyDataSet;
  FdataSetCodigoEAN.EmptyDataSet;
  btConcluir.Enabled := True;

  for I := 0 to FvincProd.detalhes.Count - 1 do
  begin
    FdataSet.Append;
    FdataSet.FieldByName('opcao').AsString              := 'S';
    FdataSet.FieldByName('cod_empresa').AsInteger       := FvincProd.cod_empresa;
    FdataSet.FieldByName('nitem').AsInteger             := FvincProd.detalhes.Items[I].item.nitem;
    FdataSet.FieldByName('num_fab_fornecedor').AsString := FvincProd.detalhes.Items[I].item.num_fab_fornecedor;
    FdataSet.FieldByName('descricao_item').AsString     := FvincProd.detalhes.Items[I].item.descricao_item;
    FdataSet.FieldByName('ncm').AsString                := FvincProd.detalhes.Items[I].item.ncm;
    FdataSet.FieldByName('cst').AsString                := FvincProd.detalhes.Items[I].item.cst;
    FdataSet.FieldByName('codigo_nop').AsInteger        := Trunc(FvincProd.detalhes.Items[I].item.codigo_nop);
    FdataSet.FieldByName('referencia').AsString         := FvincProd.detalhes.Items[I].item.referencia;
    FdataSet.FieldByName('unidade').AsString            := FvincProd.detalhes.Items[I].item.unidade_nf;
    FdataSet.FieldByName('ucom').AsString               := FvincProd.detalhes.Items[I].item.ucom;
    FdataSet.FieldByName('unidade_princ').AsString      := FvincProd.detalhes.Items[I].unid_prin;
    FdataSet.FieldByName('quantidade').AsFloat          := FvincProd.detalhes.Items[I].item.quantidade;
    FdataSet.FieldByName('valor_unitario').AsFloat      := FvincProd.detalhes.Items[I].item.valor_unitario;
    FdataSet.FieldByName('valor_total').AsFloat         := FvincProd.detalhes.Items[I].item.valor_total;
    FdataSet.FieldByName('cean').AsString               := FvincProd.detalhes.Items[I].item.cean;
    FdataSet.FieldByName('prec_cus_prod').AsFloat       := FvincProd.detalhes.Items[I].item.prec_cus_cnt;
    FdataSet.FieldByName('prec_cusm_prod').AsFloat      := FvincProd.detalhes.Items[I].item.prec_cus_cnt;
    FdataSet.FieldByName('cest').AsString               := FvincProd.detalhes.Items[I].item.cest;
    FdataSet.FieldByName('cnpj').AsString               := FvincProd.vCNPJ;
    FdataSet.FieldByName('uf_dest').AsString            := FvincProd.vUFDest;
    FdataSet.FieldByName('cprod').AsString              := FvincProd.detalhes.Items[I].cprod;
    FdataSet.FieldByName('chave_nfe').AsString          := FvincProd.detalhes.Items[I].chave_nfe;
    FdataSet.FieldByName('icms_orig').AsString          := FvincProd.detalhes.Items[I].icms_orig;
    if FvincProd.vSimplesNacional then
      FdataSet.FieldByName('csosn').AsString            := FvincProd.detalhes.Items[I].item.csosn;

    if trim(FvincProd.detalhes.Items[I].item.cod_prod) = '' then
    begin
      FvincProd.buscasTmp.Close;
      FvincProd.buscasTmp.SQL.Text := ' select cd.cod_barra, cd.grupo_prod, cd.cod_prod, cd.cod_empresa from cod_barra cd ' +
        ' inner join produtos pr on pr.grupo_prod = cd.grupo_prod and pr.cod_prod = cd.cod_prod and pr.cod_empresa = cd.cod_empresa and pr.ativo <> 99 ' +
        ' where pr.grupo_prod > 0 ' +
        ' and cd.cod_barra = ' + QuotedStr(trim(FvincProd.detalhes.Items[I].item.num_fab_fornecedor)) +
        ' and cd.cod_empresa = ' + IntToStr(FvincProd.cod_empresa) +
        ' and cd.ativo <> 99 ';
      FvincProd.buscasTmp.Open;

      if not FvincProd.buscasTmp.IsEmpty then
        FdataSet.FieldByName('cprod_existente').AsString  := 'S'
      else
        FdataSet.FieldByName('cprod_existente').AsString  := 'N';
    end
    else
      FdataSet.FieldByName('cprod_existente').AsString  := 'N';

    if Assigned(FvincProd.detalhes.Items[I].prod) then
    begin
      FdataSet.FieldByName('sel').AsString              := '';
      FdataSet.FieldByName('grupo_prod').AsInteger      := FvincProd.detalhes.Items[I].item.grupo_prod;
      FdataSet.FieldByName('cod_prod').AsString         := FvincProd.detalhes.Items[I].item.cod_prod;
      FdataSet.FieldByName('num_fab_prod').AsString     := FvincProd.detalhes.Items[I].item.num_fab_prod;
      FdataSet.FieldByName('prod_vinc').AsString        := 'S';
      FdataSet.FieldByName('prod_cad').AsString         := 'S';
    end
    else
    begin
      FdataSet.FieldByName('sel').AsString              := 'S';
      FdataSet.FieldByName('prod_vinc').AsString        := 'N';

      FvincProd.buscasTmp.Close;
      FvincProd.buscasTmp.SQL.Text := ' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa from produtos pr ' +
        ' where pr.grupo_prod > 0 ' +
        ' and pr.chave_nfe = ' + QuotedStr(trim(FvincProd.detalhes.Items[I].chave_nfe)) +
        ' and pr.cprod_xml = ' + QuotedStr(trim(FvincProd.detalhes.Items[I].item.num_fab_fornecedor)) +
        ' and pr.cod_empresa = ' + IntToStr(FvincProd.cod_empresa) +
        ' and pr.ativo <> 99 ';
      FvincProd.buscasTmp.Open;

      if FvincProd.buscasTmp.IsEmpty then
      begin
        FvincProd.buscasTmp.Close;
        FvincProd.buscasTmp.SQL.Text := ' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa from produtos pr ' +
          ' where pr.grupo_prod > 0 ' +
          ' and substring(pr.chave_nfe from 7 for 14) ' +
          '   in (select cl.cpfcgc from clientes cl ' +
          '       where cl.cod_cliente = '+ IntToStr(FvincProd.vCodCliente) +
          '       and cl.cod_empresa = ' + IntToStr(FvincProd.cod_empresa) + ') ' +
          ' and pr.cprod_xml = ' + QuotedStr(trim(FvincProd.detalhes.Items[I].item.num_fab_fornecedor)) +
          ' and pr.cod_empresa = ' + IntToStr(FvincProd.cod_empresa) +
          ' and pr.ativo <> 99 ';
        FvincProd.buscasTmp.Open;
      end;

      if not FvincProd.buscasTmp.IsEmpty then
        FdataSet.FieldByName('prod_cad').AsString       := 'S'
      else
        FdataSet.FieldByName('prod_cad').AsString       := 'N';
      btConcluir.Enabled := False;
    end;
    FdataSet.Post;
  end;
end;

procedure TfrmVinculoProdutos.nf_unidade_conversao_cadastrar(
  Sender: TObject);
var
  payload: TConvUnidadeCriarInput;
begin
  if FdataSet.IsEmpty then
    exit;

  if (FdataSet.FieldByName('grupo_prod').AsInteger = 0)
    or (FdataSet.FieldByName('cod_prod').AsString.Trim.IsEmpty) then
  begin
    ShowAtencao('Produto ainda não vinculado');
    Exit;
  end;

  payload := TConvUnidadeCriarInput.Create;
  try

    payload.grupo_prod  := FdataSet.FieldByName('grupo_prod').AsInteger;
    payload.cod_prod    := FdataSet.FieldByName('cod_prod').AsString.Trim;
    payload.uvnd        := FdataSet.FieldByName('ucom').AsString.Trim;
    payload.ean         := FdataSet.FieldByName('cean').AsString.Trim;
    payload.cod_empresa := FvincProd.cod_empresa;
    payload.usuario     := FvincProd.vUsuario;

    ConversaoUnidadeUtils.Criar(FvincProd.consProd.Database, payload);

  finally
    payload.Free;
  end;
  Exit;


  try
    FdataSetCodigoEAN.Filtered := false;
    if (FdataSet.FieldByName('grupo_prod').AsInteger > 0) and (trim(FdataSet.FieldByName('cod_prod').AsString) <> '') then
      FdataSetCodigoEAN.Filter := ' grupo_prod = ' + IntToStr(FdataSet.FieldByName('grupo_prod').AsInteger) +
        ' and cod_prod = ' + QuotedStr(FdataSet.FieldByName('cod_prod').AsString) +
        ' and cod_empresa = ' + IntToStr(FvincProd.cod_empresa)
    else
      FdataSetCodigoEAN.Filter := ' nitem = ' + IntToStr(FdataSet.FieldByName('nitem').AsInteger);
    FdataSetCodigoEAN.Filtered := true;

    Application.CreateForm(TfrmVinculoProdutosCodigoEANEmb, frmVinculoProdutosCodigoEANEmb);
    if (FdataSet.FieldByName('grupo_prod').AsInteger > 0)
      and (trim(FdataSet.FieldByName('cod_prod').AsString) <> '')
      and (trim(FdataSet.FieldByName('cean').AsString) <> '') then
        frmVinculoProdutosCodigoEANEmb.Caption := 'Código EAN / Embalagem - ' + trim(FdataSet.FieldByName('cean').AsString) +
          ' (Grupo: ' + IntToStr(FdataSet.FieldByName('grupo_prod').AsInteger) +
          ' - Código: ' + trim(FdataSet.FieldByName('cod_prod').AsString) +
          ' - Num Fabr: ' + trim(FdataSet.FieldByName('num_fab_prod').AsString) + ')'
    else if (FdataSet.FieldByName('grupo_prod').AsInteger > 0)
      and (trim(FdataSet.FieldByName('cod_prod').AsString) <> '') then
        frmVinculoProdutosCodigoEANEmb.Caption := 'Código EAN / Embalagem - (Grupo: ' + IntToStr(FdataSet.FieldByName('grupo_prod').AsInteger) +
          ' - Código: ' + trim(FdataSet.FieldByName('cod_prod').AsString) +
          ' - Num Fabr: ' + trim(FdataSet.FieldByName('num_fab_prod').AsString) + ')'
    else if trim(FdataSet.FieldByName('cean').AsString) <> '' then
        frmVinculoProdutosCodigoEANEmb.Caption := 'Código EAN / Embalagem - ' + trim(FdataSet.FieldByName('cean').AsString)
    else
        frmVinculoProdutosCodigoEANEmb.Caption := 'Código EAN / Embalagem';
    frmVinculoProdutosCodigoEANEmb.gridCodigoEANUnid.DataSource           := FdsCodigoEAN;
    frmVinculoProdutosCodigoEANEmb.vGrupoProd                             := FdataSet.FieldByName('grupo_prod').AsInteger;
    frmVinculoProdutosCodigoEANEmb.vCodProd                               := FdataSet.FieldByName('cod_prod').AsString;
    frmVinculoProdutosCodigoEANEmb.vCodEmpresa                            := FvincProd.cod_empresa;
    frmVinculoProdutosCodigoEANEmb.vbuscas                                := FvincProd.buscasTmp;
    frmVinculoProdutosCodigoEANEmb.vdataSet                               := FdataSet;
    frmVinculoProdutosCodigoEANEmb.vdataSetCodigoEANEmb                   := FdataSetCodigoEAN;

    frmVinculoProdutosCodigoEANEmb.DBEditEmbalagem.DataSource             := FdsItemNF;
    frmVinculoProdutosCodigoEANEmb.DBEditQuantidadeEmbalagem.DataSource   := FdsItemNF;
    frmVinculoProdutosCodigoEANEmb.DBEditUnidadePrinc.DataSource          := FdsItemNF;
    frmVinculoProdutosCodigoEANEmb.DBEditUnidadePrinc2.DataSource         := FdsItemNF;

    frmVinculoProdutosCodigoEANEmb.DBEditCodigoEAN.DataSource             := FdsCodigoEAN;
    frmVinculoProdutosCodigoEANEmb.DBEditUnidadeEmb.DataSource            := FdsCodigoEAN;
    frmVinculoProdutosCodigoEANEmb.DBEditQtdeEmb.DataSource               := FdsCodigoEAN;
    frmVinculoProdutosCodigoEANEmb.PageControlCodigoEANUnid.ActivePage    := frmVinculoProdutosCodigoEANEmb.TabSheet1;

    frmVinculoProdutosCodigoEANEmb.btAlterarUnd.Visible                   :=
      (FdataSet.FieldByName('grupo_prod').AsInteger > 0) and (trim(FdataSet.FieldByName('cod_prod').AsString) <> '');

    frmVinculoProdutosCodigoEANEmb.btAlterarUnd2.Visible                  :=
      (FdataSet.FieldByName('grupo_prod').AsInteger > 0) and (trim(FdataSet.FieldByName('cod_prod').AsString) <> '');

    frmVinculoProdutosCodigoEANEmb.DBEditUnidadePrinc.Enabled             :=
      (FdataSet.FieldByName('grupo_prod').AsInteger <= 0) and (trim(FdataSet.FieldByName('cod_prod').AsString) <> '');

    frmVinculoProdutosCodigoEANEmb.DBEditUnidadePrinc2.Enabled            :=
      (FdataSet.FieldByName('grupo_prod').AsInteger <= 0) and (trim(FdataSet.FieldByName('cod_prod').AsString) <> '');

    frmVinculoProdutosCodigoEANEmb.TabSheet1.Show;
    frmVinculoProdutosCodigoEANEmb.ShowModal;
  finally
    FdataSetCodigoEAN.Filtered := false;
  end;
end;

procedure TfrmVinculoProdutos.nf_cadastrar_todos_itens(Sender: TObject);
var
  vHabConcluir: boolean;
  vVisibleTvProd: boolean;
  vVisibleTvEan: boolean;
begin
  try
    vHabConcluir := btConcluir.Enabled;
    vVisibleTvProd := tvProd.Visible;
    vVisibleTvEan := tvean.Visible;

    btCampoTmp.Enabled := false;
    btCondicaoTmp.Enabled := false;
    btConsultarTmp.Enabled := false;
    SpeedButton1.Enabled := false;
    SpeedButton2.Enabled := false;
    btCadProdTemp.Enabled := false;
    btRemProdTemp.Enabled := false;
    btOpcoesCad.Enabled := false;
    btCampo.Enabled := false;
    btCondicao.Enabled := false;
    btConsultar.Enabled := false;
    btVincular.Enabled := false;
    btConcluir.Enabled := false;
    gridItensNF.Visible := false;
    tvProd.Visible := false;
    tvean.Visible := false;

    if not FvincProd.CadastrarProdutoXML(FdataSet, FdataSetCodigoEAN, true) then
      exit;

    ModalResult := mrYes;
  finally
    btCampoTmp.Enabled := true;
    btCondicaoTmp.Enabled := true;
    btConsultarTmp.Enabled := true;
    SpeedButton1.Enabled := true;
    SpeedButton2.Enabled := true;
    btCadProdTemp.Enabled := true;
    btRemProdTemp.Enabled := true;
    btOpcoesCad.Enabled := true;
    btCampo.Enabled := true;
    btCondicao.Enabled := true;
    btConsultar.Enabled := true;
    btVincular.Enabled := true;
    if vHabConcluir then
      btConcluir.Enabled := true;
    if vVisibleTvProd then
      tvProd.Visible := true;
    if vVisibleTvEan then
      tvean.Visible := true;
    gridItensNF.Visible := true;
  end;
end;

procedure TfrmVinculoProdutos.nf_cadastrar_unico_produto_codigo(
  Sender: TObject);
var
  vHabConcluir: boolean;
  vVisibleTvProd: boolean;
  vVisibleTvEan: boolean;
begin
  try
    vHabConcluir := btConcluir.Enabled;
    vVisibleTvProd := tvProd.Visible;
    vVisibleTvEan := tvean.Visible;

    btCampoTmp.Enabled := false;
    btCondicaoTmp.Enabled := false;
    btConsultarTmp.Enabled := false;
    SpeedButton1.Enabled := false;
    SpeedButton2.Enabled := false;
    btCadProdTemp.Enabled := false;
    btRemProdTemp.Enabled := false;
    btOpcoesCad.Enabled := false;
    btCampo.Enabled := false;
    btCondicao.Enabled := false;
    btConsultar.Enabled := false;
    btVincular.Enabled := false;
    btConcluir.Enabled := false;
    gridItensNF.Visible := false;
    tvProd.Visible := false;
    tvean.Visible := false;

    if not FvincProd.CadastrarProdutoXML(FdataSet, FdataSetCodigoEAN, false, true) then
      exit;

    ModalResult := mrYes;
  finally
    btCampoTmp.Enabled := true;
    btCondicaoTmp.Enabled := true;
    btConsultarTmp.Enabled := true;
    SpeedButton1.Enabled := true;
    SpeedButton2.Enabled := true;
    btCadProdTemp.Enabled := true;
    btRemProdTemp.Enabled := true;
    btOpcoesCad.Enabled := true;
    btCampo.Enabled := true;
    btCondicao.Enabled := true;
    btConsultar.Enabled := true;
    btVincular.Enabled := true;
    if vHabConcluir then
      btConcluir.Enabled := true;
    if vVisibleTvProd then
      tvProd.Visible := true;
    if vVisibleTvEan then
      tvean.Visible := true;
    gridItensNF.Visible := true;
  end;
end;

procedure TfrmVinculoProdutos.nf_unidades_selecionar_item(Sender: TObject);
var
  payload: TConvUnidadeSelecionarInput;
  recNo: Integer;
begin
  if FdataSet.IsEmpty then
    exit;

  if (FdataSet.FieldByName('grupo_prod').AsInteger > 0)
    or (not FdataSet.FieldByName('cod_prod').AsString.Trim.IsEmpty) then
  begin
    ShowAtencao('Produto já cadastrado e vinculado');
    Exit;
  end;

  payload := TConvUnidadeSelecionarInput.Create;
  try

    payload.cod_empresa := FvincProd.cod_empresa;
    payload.usuario     := FvincProd.vUsuario;

    if ConversaoUnidadeUtils.SelecionarUnidade(FvincProd.consProd.Database, payload) then
    begin

      recNo := FdataSet.RecNo;
      FdataSet.AfterScroll := nil;
      try
        FvincProd.SetarUnidadePrincipal(FdataSet.FieldByName('nitem').AsInteger, payload.undSelect);

        montarDadosDataSet;

      finally
        FdataSet.RecNo := recNo;
        FdataSet.AfterScroll := FdataSetAfterScroll;
        FdataSetAfterScroll(FdataSet);
      end;

    end;

  finally
    payload.Free;
  end;
end;

procedure TfrmVinculoProdutos.nf_unidades_selecionar_mesma_und_todos_faltantes(
  Sender: TObject);
var
  payload: TConvUnidadeSelecionarInput;
  recNo: Integer;
begin
  if FdataSet.IsEmpty then
    exit;

  recNo := FdataSet.RecNo;
  FdataSet.AfterScroll := nil;
  try
    FvincProd.SetarUnidadePrincipalTodosFaltantesMesmaXml;

    montarDadosDataSet;

  finally
    FdataSet.RecNo := recNo;
    FdataSet.AfterScroll := FdataSetAfterScroll;
    FdataSetAfterScroll(FdataSet);
  end;

end;

procedure TfrmVinculoProdutos.nf_unidades_selecionar_todos(Sender: TObject);
var
  payload: TConvUnidadeSelecionarInput;
  recNo: Integer;
begin
  if FdataSet.IsEmpty then
    exit;

  payload := TConvUnidadeSelecionarInput.Create;
  try

    payload.cod_empresa := FvincProd.cod_empresa;
    payload.usuario     := FvincProd.vUsuario;

    if ConversaoUnidadeUtils.SelecionarUnidade(FvincProd.consProd.Database, payload) then
    begin

      recNo := FdataSet.RecNo;
      FdataSet.AfterScroll := nil;
      try
        FvincProd.SetarUnidadePrincipalParaTodos(payload.undSelect);

        montarDadosDataSet;

      finally
        FdataSet.RecNo := recNo;
        FdataSet.AfterScroll := FdataSetAfterScroll;
        FdataSetAfterScroll(FdataSet);
      end;

    end;

  finally
    payload.Free;
  end;
end;

procedure TfrmVinculoProdutos.nf_unidades_selecionar_todos_faltantes(
  Sender: TObject);
var
  payload: TConvUnidadeSelecionarInput;
  recNo: Integer;
begin
  if FdataSet.IsEmpty then
    exit;

  payload := TConvUnidadeSelecionarInput.Create;
  try

    payload.cod_empresa := FvincProd.cod_empresa;
    payload.usuario     := FvincProd.vUsuario;

    if ConversaoUnidadeUtils.SelecionarUnidade(FvincProd.consProd.Database, payload) then
    begin

      recNo := FdataSet.RecNo;
      FdataSet.AfterScroll := nil;
      try
        FvincProd.SetarUnidadePrincipalTodosFaltantes(payload.undSelect);

        montarDadosDataSet;

      finally
        FdataSet.RecNo := recNo;
        FdataSet.AfterScroll := FdataSetAfterScroll;
        FdataSetAfterScroll(FdataSet);
      end;

    end;

  finally
    payload.Free;
  end;
end;

procedure TfrmVinculoProdutos.nf_unidade_conversao_visualizar(Sender: TObject);
var
  payload: TConvUnidadeVincCriarInput;
begin
  if FdataSet.IsEmpty then
    exit;

  if (FdataSet.FieldByName('grupo_prod').AsInteger = 0)
    or (FdataSet.FieldByName('cod_prod').AsString.Trim.IsEmpty) then
  begin
    ShowAtencao('Produto ainda não vinculado');
    Exit;
  end;

  payload := TConvUnidadeVincCriarInput.Create;
  try

    payload.grupo_prod  := FdataSet.FieldByName('grupo_prod').AsInteger;
    payload.cod_prod    := FdataSet.FieldByName('cod_prod').AsString.Trim;
    payload.uvnd        := FdataSet.FieldByName('ucom').AsString.Trim;
    payload.ucomXml     := FdataSet.FieldByName('ucom').AsString.Trim;
    payload.ean         := FdataSet.FieldByName('cean').AsString.Trim;
    payload.cod_empresa := FvincProd.cod_empresa;
    payload.usuario     := FvincProd.vUsuario;

    ConversaoUnidadeUtils.ShowConversoes(FvincProd.consProd.Database, payload);

  finally
    payload.Free;
  end;
end;

procedure TfrmVinculoProdutos.SpeedButton1Click(Sender: TObject);
var
  vHabConcluir: boolean;
  vVisibleTvProd: boolean;
  vVisibleTvEan: boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    vHabConcluir := btConcluir.Enabled;
    vVisibleTvProd := tvProd.Visible;
    vVisibleTvEan := tvean.Visible;

    btCampoTmp.Enabled := false;
    btCondicaoTmp.Enabled := false;
    btConsultarTmp.Enabled := false;
    SpeedButton1.Enabled := false;
    SpeedButton2.Enabled := false;
    btCadProdTemp.Enabled := false;
    btRemProdTemp.Enabled := false;
    btOpcoesCad.Enabled := false;
    btCampo.Enabled := false;
    btCondicao.Enabled := false;
    btConsultar.Enabled := false;
    btVincular.Enabled := false;
    btConcluir.Enabled := false;
    gridItensNF.Visible := false;
    tvProd.Visible := false;
    tvean.Visible := false;

    vincProd._marcaDesmarcaTodosProdutosXML(gridItensNF.DataSource.DataSet);
  finally
    btCampoTmp.Enabled := true;
    btCondicaoTmp.Enabled := true;
    btConsultarTmp.Enabled := true;
    SpeedButton1.Enabled := true;
    SpeedButton2.Enabled := true;
    btCadProdTemp.Enabled := true;
    btRemProdTemp.Enabled := true;
    btOpcoesCad.Enabled := true;
    btCampo.Enabled := true;
    btCondicao.Enabled := true;
    btConsultar.Enabled := true;
    btVincular.Enabled := true;
    if vHabConcluir then
      btConcluir.Enabled := true;
    if vVisibleTvProd then
      tvProd.Visible := true;
    if vVisibleTvEan then
      tvean.Visible := true;

    gridItensNF.Visible := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVinculoProdutos.SpeedButton2Click(Sender: TObject);
var
  vHabConcluir: boolean;
  vVisibleTvProd: boolean;
  vVisibleTvEan: boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    vHabConcluir := btConcluir.Enabled;
    vVisibleTvProd := tvProd.Visible;
    vVisibleTvEan := tvean.Visible;

    btCampoTmp.Enabled := false;
    btCondicaoTmp.Enabled := false;
    btConsultarTmp.Enabled := false;
    SpeedButton1.Enabled := false;
    SpeedButton2.Enabled := false;
    btCadProdTemp.Enabled := false;
    btRemProdTemp.Enabled := false;
    btOpcoesCad.Enabled := false;
    btCampo.Enabled := false;
    btCondicao.Enabled := false;
    btConsultar.Enabled := false;
    btVincular.Enabled := false;
    btConcluir.Enabled := false;
    gridItensNF.Visible := false;
    tvProd.Visible := false;
    tvean.Visible := false;

    vincProd._marcaDesmarcaTodosProdutosXML(gridItensNF.DataSource.DataSet, false);
  finally
    btCampoTmp.Enabled := true;
    btCondicaoTmp.Enabled := true;
    btConsultarTmp.Enabled := true;
    SpeedButton1.Enabled := true;
    SpeedButton2.Enabled := true;
    btCadProdTemp.Enabled := true;
    btRemProdTemp.Enabled := true;
    btOpcoesCad.Enabled := true;
    btCampo.Enabled := true;
    btCondicao.Enabled := true;
    btConsultar.Enabled := true;
    btVincular.Enabled := true;
    if vHabConcluir then
      btConcluir.Enabled := true;
    if vVisibleTvProd then
      tvProd.Visible := true;
    if vVisibleTvEan then
      tvean.Visible := true;
    gridItensNF.Visible := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVinculoProdutos.SpeedButton40Click(Sender: TObject);
begin
  hw_config_sistema_dx(WideString('importacao_xml_%'), WideString(FvincProd.vUsuario), FvincProd.cod_empresa, FvincProd.vNivel);
end;

procedure TfrmVinculoProdutos.tvProdDblClick(Sender: TObject);
begin
  if tvProd.Items.Count = 0 then
    Exit;


  if tvProd.Items[0].Text.Equals('Produto não localizado') then
  begin


  end;
end;

procedure TfrmVinculoProdutos.tvProd_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  AmenuItem: TMenuItem;
  node: TTreeNode;
begin
  if Button = mbRight then
  begin
    if not Assigned(FpopMenu) then
    begin
      FpopMenu := TPopupMenu.Create(Self);

      AmenuItem := TMenuItem.Create(FpopMenu);
      AmenuItem.Caption := 'Remover vinculo';
      AmenuItem.OnClick := vinculo_options_remover;
      FpopMenu.Items.Add(AmenuItem);
    end;

    node := tvProd.GetNodeAt(FtvX, FtvY);
    if Assigned(node) then
    begin
      node.Selected := True;

      if (not Assigned(node)) or (not Assigned(node.Parent)) then
        Exit;

      if (node.Level <> 1) or (node.Parent.Index <> 1) then
        Exit;

      FpopMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
    end;

  end;
end;

procedure TfrmVinculoProdutos.tvProd_MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TTreeView then
  begin
    FtvX := X;
    FtvY := Y;
  end;
end;

procedure TfrmVinculoProdutos.VerProdutoClick(Sender: TObject);
var
  vtemp: string;
begin
  if (trim(gridItensNF.DataSource.DataSet.FieldByName('COD_PROD').AsString) = '')
    and (gridItensNF.DataSource.DataSet.FieldByName('PROD_CAD').AsString = 'S') then
  begin
    FvincProd.buscasTmp.Close;
    FvincProd.buscasTmp.SQL.Text := ' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, pr.descr_prod, pr.dat_cad_prod from produtos pr ' +
      ' where pr.chave_nfe = ' + QuotedStr(trim(gridItensNF.DataSource.DataSet.FieldByName('CHAVE_NFE').AsString)) +
      ' and pr.cprod_xml = ' + QuotedStr(trim(gridItensNF.DataSource.DataSet.FieldByName('CPROD').AsString)) +
      ' and pr.cod_empresa = ' + IntToStr(FvincProd.cod_empresa) +
      ' and pr.ativo <> 99 ';
    FvincProd.buscasTmp.Open;
    FvincProd.buscasTmp.FetchAll;

    if FvincProd.buscasTmp.IsEmpty then
    begin
      FvincProd.buscasTmp.Close;
      FvincProd.buscasTmp.SQL.Text := ' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, pr.descr_prod, pr.dat_cad_prod from produtos pr ' +
        ' where substring(pr.chave_nfe from 7 for 14) ' +
        '   in (select cl.cpfcgc from clientes cl ' +
        '       where cl.cod_cliente = '+ IntToStr(FvincProd.vCodCliente) +
        '       and cl.cod_empresa = ' + IntToStr(FvincProd.cod_empresa) + ') ' +
        ' and pr.cprod_xml = ' + QuotedStr(trim(gridItensNF.DataSource.DataSet.FieldByName('CPROD').AsString)) +
        ' and pr.cod_empresa = ' + IntToStr(FvincProd.cod_empresa) +
        ' and pr.ativo <> 99 ';
      FvincProd.buscasTmp.Open;
      FvincProd.buscasTmp.FetchAll;
    end;

    if not FvincProd.buscasTmp.IsEmpty then
    begin
      vtemp := '';
      FvincProd.buscasTmp.First;
      while not FvincProd.buscasTmp.Eof do
      begin
        if FvincProd.buscasTmp.RecNo >= 3 then
        begin
          vtemp := vtemp + StrUtils.IfThen(trim(vtemp) <> '', #13 + #13, '') + '...';
          break;
        end;

        vtemp := vtemp + StrUtils.IfThen(trim(vtemp) <> '', #13 + #13, '') +
          'Código: ' + trim(gridItensNF.DataSource.DataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString) + #13 +
          'Grupo Prod: ' + IntToStr(FvincProd.buscasTmp.FieldByName('GRUPO_PROD').AsInteger) + #13 +
          'Cod Prod: ' + trim(FvincProd.buscasTmp.FieldByName('COD_PROD').AsString) + #13 +
          'Descrição: ' + trim(FvincProd.buscasTmp.FieldByName('DESCR_PROD').AsString) +
          StrUtils.IfThen(not FvincProd.buscasTmp.FieldByName('DAT_CAD_PROD').IsNull,
            #13 + 'Data Cad: ' + FormatDateTime('dd/MM/yyyy', FvincProd.buscasTmp.FieldByName('DAT_CAD_PROD').AsDateTime));

        FvincProd.buscasTmp.Next;
      end;
      Application.MessageBox(PChar(
        'PRODUTOS CADASTRADOS SEM VÍNCULO: ' + #13 + #13 + vtemp), 'Atenção',
        MB_ICONINFORMATION + MB_OK);
    end;
  end;
end;


procedure TfrmVinculoProdutos.Verprodutocomomesmocdigoexistente1Click(
  Sender: TObject);
var
  vtemp: string;
begin
  if (trim(gridItensNF.DataSource.DataSet.FieldByName('COD_PROD').AsString) = '')
    and (gridItensNF.DataSource.DataSet.FieldByName('CPROD_EXISTENTE').AsString = 'S') then
  begin
    FvincProd.buscasTmp.Close;
    FvincProd.buscasTmp.SQL.Text := ' select cd.cod_barra, ' +
      ' cd.grupo_prod, cd.cod_prod, cd.cod_empresa, pr.descr_prod, pr.dat_cad_prod from cod_barra cd ' +
      ' inner join produtos pr on pr.grupo_prod = cd.grupo_prod and pr.cod_prod = cd.cod_prod and pr.cod_empresa = cd.cod_empresa and pr.ativo <> 99 ' +
      ' where cd.cod_barra = ' + QuotedStr(trim(gridItensNF.DataSource.DataSet.FieldByName('num_fab_fornecedor').AsString)) +
      ' and cd.cod_empresa = ' + IntToStr(FvincProd.cod_empresa) +
      ' and cd.ativo <> 99 ';
    FvincProd.buscasTmp.Open;
    FvincProd.buscasTmp.FetchAll;

    if not FvincProd.buscasTmp.IsEmpty then
    begin
      vtemp := '';
      FvincProd.buscasTmp.First;
      while not FvincProd.buscasTmp.Eof do
      begin
        if FvincProd.buscasTmp.RecNo >= 3 then
        begin
          vtemp := vtemp + StrUtils.IfThen(trim(vtemp) <> '', #13 + #13, '') + '...';
          break;
        end;

        vtemp := vtemp + StrUtils.IfThen(trim(vtemp) <> '', #13 + #13, '') +
          'Código: ' + trim(gridItensNF.DataSource.DataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString) + #13 +
          'Grupo Prod: ' + IntToStr(FvincProd.buscasTmp.FieldByName('GRUPO_PROD').AsInteger) + #13 +
          'Cod Prod: ' + trim(FvincProd.buscasTmp.FieldByName('COD_PROD').AsString) + #13 +
          'Descrição: ' + trim(FvincProd.buscasTmp.FieldByName('DESCR_PROD').AsString) +
          StrUtils.IfThen(not FvincProd.buscasTmp.FieldByName('DAT_CAD_PROD').IsNull,
            #13 + 'Data Cad: ' + FormatDateTime('dd/MM/yyyy', FvincProd.buscasTmp.FieldByName('DAT_CAD_PROD').AsDateTime));

        FvincProd.buscasTmp.Next;
      end;
      Application.MessageBox(PChar(
        'PRODUTO CADASTRADO COM MESMO CÓDIGO: ' + trim(gridItensNF.DataSource.DataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString) + #13 + #13 + vtemp), 'Atenção',
        MB_ICONINFORMATION + MB_OK);
    end;
  end;
end;

procedure TfrmVinculoProdutos.vinculo_options_remover(Sender: TObject);
var
  ArecNo: Integer;
begin
  if not Assigned(tvProd.Selected) then
    Exit;

  ArecNo := FdataSet.RecNo;
  FdataSet.AfterScroll := nil;
  try
    FvincProd.DesVincular(FdataSet.FieldByName('nitem').AsInteger, tvProd.Selected.Index);

    montarDadosDataSet;

  finally
    if (ArecNo > 0) and (ArecNo <= FdataSet.RecordCount) then
      FdataSet.RecNo := ArecNo;

    while not FdataSet.Eof do
    begin
      if FdataSet.FieldByName('num_fab_prod').AsString.Trim.IsEmpty then
      begin
        if edTexto.CanFocus then
          edTexto.SetFocus;
        Break;
      end;
      FdataSet.Next;
    end;
    FdataSet.AfterScroll := FdataSetAfterScroll;
    FdataSetAfterScroll(FdataSet);

    if not pnProd.Visible then
      if btConcluir.CanFocus then
        btConcluir.SetFocus;
  end;
end;

end.

