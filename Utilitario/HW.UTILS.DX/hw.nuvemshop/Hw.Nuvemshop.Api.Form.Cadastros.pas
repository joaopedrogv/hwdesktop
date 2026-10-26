unit Hw.Nuvemshop.Api.Form.Cadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  uClasseConexao,
  Hw.Nuvemshop.Servicos,
  Hw.Nuvemshop.Api.Rest,
  HW.Nuvemshop.Api.Category,
  HW.Nuvemshop.Api.Variant,
  HW.Nuvemshop.Api.Product,
  HW.Nuvemshop.Api.Image,
  Vcl.Mask,
  Vcl.OleCtrls,
  SHDocVw, Vcl.DBCtrls, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze;

const
  COLUMN_SIZE_ID = 64;
  COLUMN_SIZE_SHORT = 175;
  COLUMN_SIZE_STRING = 250;
  COLUMN_SIZE_LONGSTRING = 550;

type
  RParamsNuvemshop = record
    params: TArray<string>;
    tipo: string;
  end;

  RParamsHw = record
    onlySinc: Boolean;
    tipo: string;
    campo, condicao, texto: string;
  end;

  TFrmNuvemshopCadastros = class(TForm)
    pg_principal: TPageControl;
    ts_produtos: TTabSheet;
    sc_produtos: TScrollBox;
    pn_produto_top: TPanel;
    imgInformation: TImage;
    bt_produto_consulta_todos: TBitBtn;
    bt_sair_produto: TBitBtn;
    bt_produto_consulta_demanda: TBitBtn;
    pn_prod_grid_hw: TPanel;
    grid_produto_hw: TDBGrid;
    pn_produto_hw_top: TPanel;
    bt_produto_vinc: TSpeedButton;
    bt_produto_vinc_remove: TSpeedButton;
    Label1: TLabel;
    bt_produto_cons_ec: TSpeedButton;
    bt_produto_cons_ec_vinc: TSpeedButton;
    bt_produto_cons_hab: TSpeedButton;
    bt_produto_goto_tray: TSpeedButton;
    bt_produto_imagens_hw: TSpeedButton;
    pn_produto_hw_consulta: TPanel;
    lbCampoProduto: TLabel;
    lbCondicaoProduto: TLabel;
    lbConteudoProduto: TLabel;
    cb_campo_cons_produto: TComboBox;
    bt_produtocons_consulta_produto: TBitBtn;
    me_texto_cons_produto: TMaskEdit;
    cb_cond_cons_produto: TComboBox;
    pn_prod_grid: TPanel;
    pn_produto_tray_top: TPanel;
    bt_produto_link: TSpeedButton;
    bt_produto_goto_sistema: TSpeedButton;
    bt_produto_imagens_tray: TSpeedButton;
    bt_prod_pag: TSpeedButton;
    bt_prod_pag_ultima: TSpeedButton;
    bt_prod_pag_anterior: TSpeedButton;
    bt_prod_pag_proxima: TSpeedButton;
    bt_prod_pag_primeira: TSpeedButton;
    bt_produto_variacao_tray: TSpeedButton;
    grid_produto: TDBGrid;
    ts_categorias: TTabSheet;
    sc_categorias: TScrollBox;
    SplitterCateg: TSplitter;
    pn_categ_top: TPanel;
    imgInformation3: TImage;
    bt_categ_consulta_demanda: TBitBtn;
    bt_categ_cad: TBitBtn;
    bt_sair_categ: TBitBtn;
    pn_categ_grid_tray: TPanel;
    grid_categ_tray: TDBGrid;
    pn_categ_tray_top: TPanel;
    bt_categ_check_all: TSpeedButton;
    bt_categ_uncheck_all: TSpeedButton;
    bt_categ_produtos: TSpeedButton;
    pn_categ_grid_hw: TPanel;
    grid_categ_hw: TDBGrid;
    pn_cat_hw_top: TPanel;
    bt_categ_vinc: TSpeedButton;
    bt_categ_vinc_remove: TSpeedButton;
    ts_grades_variacao_prod: TTabSheet;
    sc_variacoes_produtos: TScrollBox;
    SplitterVariacaoGrade: TSplitter;
    pn_varicao_grade_grid_tray: TPanel;
    grid_variacoes_produto_tray: TDBGrid;
    pn_variacoes_produto_tray_top: TPanel;
    pn_variacao_grade_grid_hw: TPanel;
    grid_variacoes_produto_hw: TDBGrid;
    pn_variacoes_produto_hw_top: TPanel;
    groupbox_varicoes_produtos: TGroupBox;
    DBTextDesrTrayProduto: TDBText;
    lbCodProdTrayProduto: TLabel;
    DBTextIdTrayProduto: TDBText;
    ts_log: TTabSheet;
    ed_log: TMemo;
    ts_db_categorias: TTabSheet;
    pn_db_categ: TPanel;
    pn_db_categ_top: TPanel;
    pn_db_grid_categ: TPanel;
    grid_db_categ: TDBGrid;
    pn_db_categ_bottom: TPanel;
    bt_categ_vinc_confirmar: TBitBtn;
    bt_categ_vinc_voltar: TBitBtn;
    ts_db_produtos: TTabSheet;
    pn_db_produtos: TPanel;
    pn_db_produtos_top: TPanel;
    pn_db_grid_produtos: TPanel;
    grid_db_produto: TDBGrid;
    pn_db_produtos_bottom: TPanel;
    bt_produtos_conf: TBitBtn;
    bt_produtos_voltar: TBitBtn;
    ts_browser: TTabSheet;
    Web: TWebBrowser;
    pn_img_produto_top: TPanel;
    pnImgProduto: TPanel;
    Panel6: TPanel;
    lbImgSis: TLabel;
    lbQtdeImagensSis: TLabel;
    lbEnviadasLoja: TLabel;
    lbQtdeImgEnvLoja: TLabel;
    lbExibidaLoja: TLabel;
    lbQtdeExibidaLoja: TLabel;
    bt_reenviar_img_produto: TSpeedButton;
    bt_gerarurlereenviar_img_produto: TSpeedButton;
    groupbox_img_produto: TGroupBox;
    DBTextDesrTray2: TDBText;
    lbCodProdTray2: TLabel;
    DBTextIdTray2: TDBText;
    Image1: TImage;
    bt_voltar_img_produto: TBitBtn;
    pn_variacoes_produto_top1: TPanel;
    bt_variacoes_produtos_cad: TBitBtn;
    bt_variacoes_produto_check_alll: TSpeedButton;
    bt_variacoes_produto_uncheck_all: TSpeedButton;
    bt_varicoes_produtos_voltar: TBitBtn;
    imgInformation5: TImage;
    bt_variacoes_produtos_adc: TBitBtn;
    groupbox_varicoes_produtoshw: TGroupBox;
    DBTextDesrProdutoHw: TDBText;
    Label2: TLabel;
    DBTextGrupoProdutoHw: TDBText;
    Label3: TLabel;
    DBTextCodigoProdutoHw: TDBText;
    ts_Imagens: TTabSheet;
    pnImagens: TPanel;
    Panel2: TPanel;
    RadioGroupOpcao: TRadioGroup;
    Panel4: TPanel;
    bitbtn_Imagens_confirmar: TBitBtn;
    bitbtn_Imagens_fechar: TBitBtn;
    IdAntiFreeze: TIdAntiFreeze;
    IdHTTP: TIdHTTP;
    pnDetImg: TPanel;
    lbQtdeImagem: TLabel;
    lblStatus: TLabel;
    pbprogresso: TProgressBar;
    lblDownloadEm: TLabel;
    Label4: TLabel;
    pnProdSemVincEC: TPanel;
    pnProdSemVincERP: TPanel;
    pnCatSemVincEC: TPanel;
    pnCatSemVincERP: TPanel;
    bt_categ_pag_primeira: TSpeedButton;
    bt_categ_pag_anterior: TSpeedButton;
    bt_categ_pag: TSpeedButton;
    bt_categ_pag_proxima: TSpeedButton;
    bt_categ_pag_ultima: TSpeedButton;
    bt_categoria_cons_ec_vinc: TSpeedButton;
    bt_categoria_cons_ec: TSpeedButton;
    bt_categoria_cons_hab: TSpeedButton;
    bt_categ_consulta_todos: TBitBtn;
    pn_categoria_hw_consulta: TPanel;
    lbCampoCategoria: TLabel;
    lbCondicaoCategoria: TLabel;
    lbConteudoCategoria: TLabel;
    cb_campo_cons_categoria: TComboBox;
    bt_produtocons_consulta_categoria: TBitBtn;
    me_texto_cons_categoria: TMaskEdit;
    cb_cond_cons_categoria: TComboBox;
    bt_categ_goto_sistema: TSpeedButton;
    bt_categ_goto_tray: TSpeedButton;
    SplitterProd: TSplitter;
    procedure bt_categ_consulta_demandaClick(Sender: TObject);
    procedure bt_sair_categClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_sair_produtoClick(Sender: TObject);
    procedure bt_produto_consulta_demandaClick(Sender: TObject);
    procedure bt_produto_consulta_todosClick(Sender: TObject);
    procedure grid_categ_trayDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_categ_check_allClick(Sender: TObject);
    procedure bt_categ_uncheck_allClick(Sender: TObject);
    procedure grid_produtoCellClick(Column: TColumn);
    procedure grid_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_produtoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_categ_cadClick(Sender: TObject);
    procedure bt_prod_pag_primeiraClick(Sender: TObject);
    procedure bt_prod_pag_anteriorClick(Sender: TObject);
    procedure bt_prod_pag_proximaClick(Sender: TObject);
    procedure bt_prod_pag_ultimaClick(Sender: TObject);
    procedure bt_categ_vinc_removeClick(Sender: TObject);
    procedure bt_categ_vincClick(Sender: TObject);
    procedure bt_produto_linkClick(Sender: TObject);
    procedure bt_produto_goto_sistemaClick(Sender: TObject);
    procedure bt_produto_imagens_trayClick(Sender: TObject);
    procedure bt_produto_variacao_trayClick(Sender: TObject);
    procedure bt_voltar_img_produtoClick(Sender: TObject);
    procedure bt_reenviar_img_produtoClick(Sender: TObject);
    procedure bt_gerarurlereenviar_img_produtoClick(Sender: TObject);
    procedure bt_produto_cons_ecClick(Sender: TObject);
    procedure bt_produto_cons_habClick(Sender: TObject);
    procedure bt_produtocons_consulta_produtoClick(Sender: TObject);
    procedure bt_produto_vincClick(Sender: TObject);
    procedure bt_produto_vinc_removeClick(Sender: TObject);
    procedure bt_produto_goto_trayClick(Sender: TObject);
    procedure bt_produto_imagens_hwClick(Sender: TObject);
    procedure bt_varicoes_produtos_voltarClick(Sender: TObject);
    procedure grid_variacoes_produto_hwDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grid_produto_hwDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grid_variacoes_produto_trayDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure bt_variacoes_produtos_cadClick(Sender: TObject);
    procedure bt_variacoes_produto_check_alllClick(Sender: TObject);
    procedure bt_variacoes_produto_uncheck_allClick(Sender: TObject);
    procedure bt_variacoes_produtos_adcClick(Sender: TObject);
    procedure bitbtn_Imagens_confirmarClick(Sender: TObject);
    procedure bitbtn_Imagens_fecharClick(Sender: TObject);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure grid_categ_hwDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_categ_consulta_todosClick(Sender: TObject);
    procedure bt_categoria_cons_ecClick(Sender: TObject);
    procedure bt_categoria_cons_habClick(Sender: TObject);
    procedure bt_produtocons_consulta_categoriaClick(Sender: TObject);
    procedure bt_categ_pag_primeiraClick(Sender: TObject);
    procedure bt_categ_pag_anteriorClick(Sender: TObject);
    procedure bt_categ_pag_proximaClick(Sender: TObject);
    procedure bt_categ_pag_ultimaClick(Sender: TObject);
    procedure bt_prod_pagClick(Sender: TObject);
    procedure bt_categ_pagClick(Sender: TObject);
    procedure bt_produtos_confClick(Sender: TObject);
    procedure bt_categ_vinc_confirmarClick(Sender: TObject);
    procedure bt_categ_vinc_voltarClick(Sender: TObject);
    procedure bt_produtos_voltarClick(Sender: TObject);
    procedure bt_categ_goto_sistemaClick(Sender: TObject);
    procedure bt_categ_goto_trayClick(Sender: TObject);
  private
    { Private declarations }
    FCodEmpresa: Integer;
    FDataBasePath: string;
    FUsuario: string;
    FGrupoProd: Integer;
    FCodProd: string;

    servico: THwNuvemshopServicos;

    //categorias
    paramsCategoriaNuvemshop: RParamsNuvemshop;
    paramsCategoriaHw       : RParamsHw;
    consultaCategoria       : TNuvemshopConsulta;
    cat                     : TArray<TCategory>;
    categorias              : TArray<TCategory>;
    viewCategoria           : TConexao_OOP;
    viewCategoriaHw         : TConexao_OOP;
    dbAllCategorias         : TConexao_OOP;

    //produtos
    paramsProdNuvemshop: RParamsNuvemshop;
    paramsProdHw       : RParamsHw;
    consultaProd       : TNuvemshopConsulta;
    prod               : TArray<TProduct>;
    produtos           : TArray<TProduct>;
    viewProduto        : TConexao_OOP;
    viewProdutoHw      : TConexao_OOP;
    dbAllProdutos      : TConexao_OOP;

    //variacoes
    variantpag         : TArray<TVariant>;
    variants           : TArray<TVariant>;
    viewVariant        : TConexao_OOP;
    viewVariantHw      : TConexao_OOP;
    dbAllVariants      : TConexao_OOP;

    procedure Log(Text: string);
    procedure InitGridColumns(Index: Integer; grid: TDBGrid; client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string; alignment: TAlignment);
    procedure InitGridColumnsR(Index: Integer; grid: TDBGrid; client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string = '');
    procedure InitGridColumnsL(Index: Integer; grid: TDBGrid; client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string = '');
    procedure InitGridColumnsC(Index: Integer; grid: TDBGrid; client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string = '');

    procedure ResolverFiltroCategorias(pTipo: string = 'A');
    procedure ResolverFiltroCategoriasNuvemshop();
    procedure ConsultaCategoriaNuvemshop(all: Boolean; pag: Integer; pIds: string); overload;
    procedure ConsultaCategoriaNuvemshop(pag: Integer = 1); overload;
    procedure ConsultaCategoriaHw(pIds: string);

    procedure ResolverFiltroProdutos(pTipo: string = 'A');
    procedure ResolverFiltroProdutosNuvemshop();
    procedure ConsultaProdutoNuvemshop(all: Boolean; pag: Integer; pIds: string); overload;
    procedure ConsultaProdutoNuvemshop(pag: Integer = 1); overload;
    procedure ConsultaProdutoHw(pIds: string);

    procedure ResolverFiltroGrades;
    procedure ResolverFiltroVariacoes(idproduto: Integer; tipoec: string; tipoec1: string; tipoerp: string; tipoerp1: string);
    procedure VincularProdutos;

    procedure marcaDesmacarLinhaProduto;
    procedure marcaDesmacarLinhaCategoria;
    procedure marcaDesmacarLinhaVariacao;

    function retornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    function retornaKiloBytes(ValorAtual: real): string;

    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; Adefault: Integer = 0) : Integer;
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);

    procedure ExibirImagensProduto(produto: TProductHw);
  public
    { Public declarations }
    function baixarImagens(pDiretorio, pUrl: string): string;

    property DataBasePath: string read FDataBasePath write FDataBasePath;
    property CodEmpresa: Integer write FCodEmpresa;
    property Usuario: string  write FUsuario;
    property GrupoProd: Integer read FGrupoProd write FGrupoProd;
    property CodProd: string read FCodProd write FCodProd;

  end;

var
  FrmNuvemshopCadastros: TFrmNuvemshopCadastros;

implementation

uses
  System.StrUtils,
  System.Math,
  Winapi.ShellAPI,
  hw_utils,
  hw_win_utils,
  hw_grid_utils,
  HW.Json,
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Rtti,
  System.Generics.Collections, Hw.Nuvemshop.Api.Url, System.Win.Registry;

{$R *.dfm}

function TFrmNuvemshopCadastros.baixarImagens(pDiretorio, pUrl: string): string;
var
  fileDownload : TFileStream;
  vtemp: string;
begin
  vtemp := pDiretorio + ExtractFileName(StringReplace(pUrl, '/', '\', [rfReplaceAll]));

  while FileExists(vtemp) do
  begin
    vtemp := StringReplace(vtemp, ExtractFileExt(pUrl), '', [rfReplaceAll]);

    vtemp := vtemp + '1' + ExtractFileExt(StringReplace(pUrl, '/', '\', [rfReplaceAll]));

    if not FileExists(vtemp) then
      break;
  end;

  Result := ExtractFileName(StringReplace(vtemp, '/', '\', [rfReplaceAll]));

  fileDownload := TFileStream.Create(vtemp, fmCreate);
  try
    pbprogresso.Visible := True;
    lblStatus.Visible   := True;
    IdHTTP.Get(pUrl, fileDownload);
  finally
    FreeAndNil(fileDownload);
  end;
end;

procedure TFrmNuvemshopCadastros.bitbtn_Imagens_confirmarClick(Sender: TObject);
begin
  if (RadioGroupOpcao.ItemIndex <> 0) and (RadioGroupOpcao.ItemIndex <> 1) then
  begin
    ShowAtencao('Selecione um opção: ' + #13 +
      'Imagens do E-Commerce' + #13 +
      'Imagens do ERP');
    if RadioGroupOpcao.CanFocus then
      RadioGroupOpcao.SetFocus;
    exit;
  end;

  TForm(pnImagens.Parent).ModalResult := IDOK;
end;

procedure TFrmNuvemshopCadastros.bitbtn_Imagens_fecharClick(Sender: TObject);
begin
  TForm(pnImagens.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmNuvemshopCadastros.bt_categoria_cons_ecClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsCategoriaHw.onlySinc := Sender = bt_categoria_cons_ec_vinc;
    paramsCategoriaHw.tipo     := IfThen(paramsCategoriaHw.onlySinc, 'Sincronizados', 'Com dados EC');
    paramsCategoriaHw.campo    := '';
    paramsCategoriaHw.condicao := '';
    paramsCategoriaHw.texto    := '';

    ConsultaCategoriaHw('');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_categoria_cons_habClick(Sender: TObject);
begin
  pn_categoria_hw_consulta.Visible := not pn_categoria_hw_consulta.Visible;
end;

procedure TFrmNuvemshopCadastros.bt_categ_cadClick(Sender: TObject);
var
  categoria: TCategory;
  categoriasCad: TArray<TCategory>;
  recno: Integer;
  Id: Integer;
begin

  if viewCategoria.Count = 0 then
    Exit;

  if viewCategoria.IsEmpty then
  begin
    ShowAtencao('Sem categorias para cadastrar');
    Exit;
  end;

  Id := viewCategoria.fint('id');
  viewCategoria.prepare_loop('sel = ''S''');
  if viewCategoria.IsEmpty then
  begin
    ShowAtencao('Nenhuma categoria selecionada');
    Exit;
  end;
  try
    categoriasCad := [];

    if viewCategoria.IsEmpty then
      viewCategoria.filterStr('id = %d', [Id]);

    while not viewCategoria.DataSet.Eof do
    begin

      for categoria in categorias do
        if viewCategoria.fint('id') = categoria.id then
          categoriasCad := categoriasCad + [categoria];

      viewCategoria.DataSet.Next;
    end;

    with servico.Auditor.Inserir.Table(tbCategoria).Processo('PRO392') do
      if not Permitido then
        Exit;

    if Length(categoriasCad) > 0 then
      if servico.CadastrarCategoria(categoriasCad) then
        dbAllCategorias := servico.GetCategorias();

  finally
    viewCategoria.prepare_loop_done();
    ResolverFiltroCategorias;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_categ_check_allClick(Sender: TObject);
begin
  viewCategoria.CheckUnCheckAllRows(True);
end;

procedure TFrmNuvemshopCadastros.bt_categ_consulta_demandaClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsCategoriaNuvemshop.params := [];
    paramsCategoriaNuvemshop.tipo := 'Demanda';

    ConsultaCategoriaNuvemshop();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_categ_consulta_todosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsCategoriaNuvemshop.params := [];
    paramsCategoriaNuvemshop.tipo := 'Todos';

    ConsultaCategoriaNuvemshop(True, 0, '');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_categ_goto_sistemaClick(Sender: TObject);
begin
  if viewCategoria.IsEmpty then
    Exit;

  if viewCategoriaHw.IsEmpty then
    Exit;

  if (viewCategoria.fint('cod_categoria') = 0) then
    Exit;

  viewCategoriaHw.DataSet.Locate('cod_categoria', VarArrayOf([viewCategoria.fint('cod_categoria')]), []);
end;

procedure TFrmNuvemshopCadastros.bt_categ_goto_trayClick(Sender: TObject);
begin
  if viewCategoria.IsEmpty then
    Exit;

  if viewCategoriaHw.IsEmpty then
    Exit;

  viewCategoria.DataSet.Locate('id', VarArrayOf([viewCategoriaHw.fstr('id_commerce')]), []);
end;

procedure TFrmNuvemshopCadastros.bt_categ_pagClick(Sender: TObject);
var
  pag: string;
  pagInt: Integer;
  totalPag: Int64;
begin
  if consultaCategoria = nil then
    Exit
  else if consultaCategoria.paging = nil then
    Exit;

  if consultaCategoria.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaCategoria.paging.total / consultaCategoria.paging.limit);

  if totalPag = 1 then
  begin
    ShowAtencao('Não existem mais páginas para consulta');
    Exit;
  end;

  pag := '1';

  if not InputQuery('Ir para a página', 'Informe o número da página para consulta', pag) then
    Exit;

  if TryStrToInt(pag, pagInt) then
  begin
    if pagInt > totalPag then
      ShowErro('Página inválida, informe de 1 até %d', [totalPag])
    else
      ConsultaCategoriaNuvemshop(pagInt);
  end
  else
    ShowErro('Página informada inválida');
end;

procedure TFrmNuvemshopCadastros.bt_categ_pag_anteriorClick(Sender: TObject);
begin
  if categorias = nil then
    Exit;

  if (servico.TotalPag = 0) or (servico.pag <= 1) then
    Exit;

  ConsultaCategoriaNuvemshop(servico.pag - 1);
end;

procedure TFrmNuvemshopCadastros.bt_categ_pag_primeiraClick(Sender: TObject);
begin
  ConsultaCategoriaNuvemshop();
end;

procedure TFrmNuvemshopCadastros.bt_categ_pag_proximaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if categorias = nil then
    Exit;

  if servico.TotalPag = 0 then
    Exit;

  totalPag := Ceil(servico.Registros / servico.limit);

  if (servico.pag + 1) > totalPag then
    Exit;

   ConsultaCategoriaNuvemshop(servico.pag + 1);
end;

procedure TFrmNuvemshopCadastros.bt_categ_pag_ultimaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if categorias = nil then
    Exit;

  if servico.TotalPag = 0 then
    Exit;

  totalPag := Ceil(servico.Registros / servico.limit);

  ConsultaCategoriaNuvemshop(totalPag);
end;

procedure TFrmNuvemshopCadastros.bt_categ_uncheck_allClick(Sender: TObject);
begin
  viewCategoria.CheckUnCheckAllRows(False);
end;

procedure TFrmNuvemshopCadastros.bt_categ_vincClick(Sender: TObject);
var
  Id: Integer;
  categ: TCategory;
  vincular: Boolean;
begin
  if viewCategoriaHw.IsEmpty then
  begin
    ShowAtencao('Sem categorias no banco de dados');
    Exit;
  end;

  try
    Id := viewCategoria.fint('id');
    if viewCategoria.prepare_loop('sel = ''S''').Count > 1 then
    begin
      ShowAtencao('Selecione 1 registro de cada vez para vincular');
      Exit;
    end
    else if viewCategoria.Count = 0 then
      if viewCategoria.prepare_loop_done().prepare_loop('id = ' + Id.ToString).Count <> 1 then
      begin
        ShowAtencao('Selecione pelo menos 1 registro para vincular');
        Exit;
      end
      else
        viewCategoria.CheckUnCheckRow();

    pn_db_categ_top.Caption := 'Vincular categoria Nuvemshop ' + viewCategoria.fstr('name_category');

  finally
    viewCategoria.prepare_loop_done();
  end;

  vincular := False;
  for categ in categorias do
    if TryCond(vincular, categ.id = Id) then
      Break;

  if viewCategoria.fint('cod_categoria') > 0 then
  begin
    ShowAtencao('Categoria do E-Commerce selecionada está vinculado a uma categoria do sistema.' +#13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  if viewCategoriaHw.fint('id_commerce') > 0 then
  begin
    ShowAtencao('Categoria do sistema está vinculada a uma categoria do E-Commerce.' + #13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  with servico.Auditor.Alterar.Table(tbCategoria).Processo('PRO393')
    .Key(viewCategoriaHw.fstr('cod_categoria'))
    .Msg('%d %s', [viewCategoriaHw.fint('cod_categoria'), viewCategoriaHw.fstr('descricao')]) do
    if not Permitido then
      Exit;

  if vincular and
    (ShowConfirmacao('Deseja mesmo vincular essa categoria?') = ID_YES) and
    (servico.VincularCategoria(categ, viewCategoriaHw.fint('cod_categoria'))) then
  begin
    if paramsCategoriaNuvemshop.tipo = 'Demanda' then
      bt_categ_consulta_demandaClick(Sender)
    else
      bt_categ_consulta_todosClick(Sender);
  end;
end;

procedure TFrmNuvemshopCadastros.bt_categ_vinc_confirmarClick(Sender: TObject);
var
  categ: TCategory;
begin

  if viewCategoria.Count = 0 then
    Exit;

  viewCategoria.prepare_loop('sel = ''S''');
  try

    for categ in categorias do
      if viewCategoria.fstr('id').Equals(categ.id.ToString.Trim) then
        if servico.VincularCategoria(categ, dbAllCategorias.fint('cod_categoria')) then
        begin
          if paramsCategoriaNuvemshop.tipo = 'Demanda' then
            bt_categ_consulta_demandaClick(Sender)
          else
            bt_categ_consulta_todosClick(Sender);
          pg_principal.ActivePage := ts_categorias;
          Break;
        end;

  finally
    viewCategoria.prepare_loop_done();
    ResolverFiltroCategorias;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_categ_vinc_removeClick(Sender: TObject);
begin
  if viewCategoriaHw.IsEmpty then
    Exit;

  if viewCategoriaHw.fint('id_commerce') = 0 then
  begin
    ShowAtencao('Não existe categoria vinculada do e-commerce para o registro selecionado');
    Exit;
  end;

  with servico.Auditor.Alterar.Table(tbCategoria).Processo('PRO394')
    .Key(viewCategoriaHw.fstr('cod_categoria'))
    .Msg('Sistema %d %s', [viewCategoriaHw.fint('cod_categoria'), viewCategoriaHw.fstr('descricao')]) do
    if not Permitido then
      Exit;

  if ShowConfirmacao('Deseja mesmo desvincular essa categoria?') = ID_YES then
    if servico.DesvincularCategoria(viewCategoriaHw.fint('cod_categoria')) then
    begin
      if paramsCategoriaNuvemshop.tipo = 'Demanda' then
        bt_categ_consulta_demandaClick(Sender)
      else
        bt_categ_consulta_todosClick(Sender);
    end;
end;

procedure TFrmNuvemshopCadastros.bt_categ_vinc_voltarClick(Sender: TObject);
begin
  pg_principal.ActivePage := ts_categorias;
end;

procedure TFrmNuvemshopCadastros.bt_gerarurlereenviar_img_produtoClick(
  Sender: TObject);
begin
  if trim(DBTextIdTray2.DataSource.DataSet.FieldByName(DBTextIdTray2.DataField).AsString) = '' then
    exit;

  if trim(DBTextIdTray2.DataSource.DataSet.FieldByName(DBTextIdTray2.DataField).AsString) <> '' then
     if (StrToInt(DBTextIdTray2.DataSource.DataSet.FieldByName(DBTextIdTray2.DataField).AsString) <= 0) then
       exit;

  if (ShowConfirmacao('Deseja gerar url e reenviar imagens do produto para o E-Commerce?') = ID_YES) then
    if not (servico.ReenviarImagensProduto(StrToInt(DBTextIdTray2.DataSource.DataSet.FieldByName(DBTextIdTray2.DataField).AsString), true)) then
      exit;
end;

procedure TFrmNuvemshopCadastros.bt_produtocons_consulta_categoriaClick(
  Sender: TObject);
begin
  paramsCategoriaHw.tipo     := 'Consulta';
  paramsCategoriaHw.campo    := cb_campo_cons_categoria.Items[cb_campo_cons_categoria.ItemIndex];
  paramsCategoriaHw.condicao := cb_cond_cons_categoria.Items[cb_cond_cons_categoria.ItemIndex];
  paramsCategoriaHw.texto    := me_texto_cons_categoria.Text;

  ConsultaCategoriaHw('');
end;

procedure TFrmNuvemshopCadastros.bt_produtocons_consulta_produtoClick(
  Sender: TObject);
begin
  paramsProdHw.tipo     := 'Consulta';
  paramsProdHw.campo    := cb_campo_cons_produto.Items[cb_campo_cons_produto.ItemIndex];
  paramsProdHw.condicao := cb_cond_cons_produto.Items[cb_cond_cons_produto.ItemIndex];
  paramsProdHw.texto    := me_texto_cons_produto.Text;

  ConsultaProdutoHw('');
end;

procedure TFrmNuvemshopCadastros.bt_produtos_confClick(Sender: TObject);
var
  produto: TProduct;
  recno: Integer;
begin

  if not grid_produto.Visible then
    Exit;

  viewProduto.prepare_loop('sel = ''S''');
  try

    for produto in produtos do
      if viewProduto.fstr('id').Equals(produto.id.ToString.Trim) then
        if servico.VincularProduto(produto,
          dbAllProdutos.fint('grupo_prod'),
          dbAllProdutos.fstr('cod_prod'),
          dbAllProdutos.ffloat('altura_prod'),
          dbAllProdutos.ffloat('comprimento_prod'),
          dbAllProdutos.ffloat('largura_prod'),
          dbAllProdutos.ffloat('peso_brut_prod'),
          dbAllProdutos.ffloat('peso_liq_prod')) then
        begin
          if paramsProdNuvemshop.tipo = 'Demanda' then
            bt_produto_consulta_demandaClick(Sender)
          else
            bt_produto_consulta_todosClick(Sender);
          pg_principal.ActivePage := ts_produtos;
          Break;
        end;

  finally
    viewProduto.prepare_loop_done();
    ResolverFiltroProdutos;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_produtos_voltarClick(Sender: TObject);
begin
  pg_principal.ActivePage := ts_produtos;
end;

procedure TFrmNuvemshopCadastros.bt_produto_consulta_demandaClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsProdNuvemshop.params := [];
    paramsProdNuvemshop.tipo := 'Demanda';

    ConsultaProdutoNuvemshop();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_produto_consulta_todosClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsProdNuvemshop.params := [];
    paramsProdNuvemshop.tipo := 'Todos';

    ConsultaProdutoNuvemshop(True, 0, '');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_produto_cons_ecClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsProdHw.onlySinc := Sender = bt_produto_cons_ec_vinc;
    paramsProdHw.tipo     := IfThen(paramsProdHw.onlySinc, 'Sincronizados', 'Com dados EC');
    paramsProdHw.campo    := '';
    paramsProdHw.condicao := '';
    paramsProdHw.texto    := '';

    ConsultaProdutoHw('');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_produto_cons_habClick(Sender: TObject);
begin
  pn_produto_hw_consulta.Visible := not pn_produto_hw_consulta.Visible;
end;

procedure TFrmNuvemshopCadastros.bt_produto_goto_sistemaClick(Sender: TObject);
begin
  if viewProduto.IsEmpty then
    Exit;

  if viewProdutoHw.IsEmpty then
    Exit;

  if (viewProduto.fint('grupo_prod') = 0) and
     (viewProduto.fempty('cod_prod')) then
    Exit;

  viewProdutoHw.DataSet.Locate('grupo_prod;cod_prod', VarArrayOf([viewProduto.fint('grupo_prod'), viewProduto.fstr('cod_prod')]), []);
end;

procedure TFrmNuvemshopCadastros.bt_produto_goto_trayClick(Sender: TObject);
begin
  if viewProduto.IsEmpty then
    Exit;

  if viewProdutoHw.IsEmpty then
    Exit;

  viewProduto.DataSet.Locate('id', VarArrayOf([viewProdutoHw.fstr('id_commerce')]), []);
end;

procedure TFrmNuvemshopCadastros.bt_produto_imagens_hwClick(Sender: TObject);
begin
  if viewProdutoHw.IsEmpty then
    Exit;

  DBTextDesrTray2.DataSource := viewProdutoHw.DataSourceOOP;
  DBTextDesrTray2.DataField := 'DESCR_PROD';

  DBTextIdTray2.DataSource := viewProdutoHw.DataSourceOOP;
  DBTextIdTray2.DataField := 'ID_COMMERCE';

  ExibirImagensProduto(servico.ResolverProdutoHw(viewProdutoHw, produtos));
end;

procedure TFrmNuvemshopCadastros.bt_produto_imagens_trayClick(Sender: TObject);
var
  id: Integer;
  prod: TProduct;
  prodHw: TProductHw;
begin
  if viewProduto.IsEmpty then
    Exit;

  id := viewProduto.fInt('id');

  for prod in produtos do
    if id = prod.id then
    begin
      groupbox_img_produto.Caption := 'Produto';
      pnImgProduto.Caption := 'Imagens do Produto no E-Commerce / Sistema';

      DBTextDesrTray2.DataSource := viewProduto.DataSourceOOP;
      DBTextDesrTray2.DataField := 'NAME_PRODUCT';

      DBTextIdTray2.DataSource := viewProduto.DataSourceOOP;
      DBTextIdTray2.DataField := 'ID';

      ExibirImagensProduto(servico.ResolverProduto(prod));
      Break;
    end;
end;

procedure TFrmNuvemshopCadastros.bt_produto_linkClick(Sender: TObject);
var
  id: Integer;
  prod: TProduct;
begin
  if viewProduto.IsEmpty then
    Exit;

  id := viewProduto.fInt('id');

  for prod in produtos do
    if id = prod.id then
    begin
      ShellExecute(Application.Handle, 'open', PWideChar(prod.canonical_url), '', '', 0);
      Break;
    end;
end;

procedure TFrmNuvemshopCadastros.bt_produto_variacao_trayClick(Sender: TObject);
var
  id: Integer;
  tipoEC, tipoEC1: string;
  tipoERP, tipoERP1: string;
  registros, limit, totalPag: Integer;
  vtotalpag: Integer;
  pag: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    if viewProduto.IsEmpty then
      Exit;

    if ((viewProduto.fint('grupo_prod') <= 0)
      and (viewProduto.fstr('cod_prod').Trim = '')
      and (viewProdutoHw.fint('grupo_prod') <= 0)
      and (viewProdutoHw.fstr('cod_prod').Trim = '')) then
    begin
      ShowAtencao('Produto selecionado sem vínculo com sistema.' +#13 + #13 +
        'Favor víncular antes de continuar');
      Exit;
    end;

    if viewProduto.fstr('has_variation') <> '1' then
    begin
      ShowAtencao('Produto selecionado sem variação/grade');
      Exit;
    end;

    with servico.Auditor.Inserir.Table(tbGrade).Processo('PRO400') do
      if not Permitido then
        Exit;

    id := viewProduto.fInt('id');

    variants := [];
    pag := 1;
    limit := 30;

    repeat
      registros := servico.GetCount<TVariant>('products/' + id.ToString + '/variants', 'Variants', ['per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);

      totalPag := Ceil(registros / limit);

      variantpag := servico.GetList<TVariant>('products/' + id.ToString + '/variants', 'Variants', ['per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);
      variants := variants + variantpag;

      pag := pag + 1;
    until
      (pag > totalPag);

    GrupoProd := 0;
    CodProd   := '';
    tipoEC    := '';
    tipoEC1   := '';
    tipoERP   := '';
    tipoERP1  := '';

    if viewProduto.fint('grupo_prod') > 0 then
    begin
      GrupoProd := viewProduto.fint('grupo_prod');
      CodProd   := viewProduto.fstr('cod_prod');
      tipoEC    := viewProduto.fstr('tipoec');
      tipoEC1   := viewProduto.fstr('tipoec1');
      tipoERP   := viewProduto.fstr('tipoec');
      tipoERP1  := viewProduto.fstr('tipoec1');
    end
    else if viewProdutoHw.fint('grupo_prod') > 0 then
    begin
      GrupoProd := viewProdutoHw.fint('grupo_prod');
      CodProd   := viewProdutoHw.fstr('cod_prod');
      tipoEC    := viewProduto.fstr('tipoec');
      tipoEC1   := viewProduto.fstr('tipoec1');
      tipoERP   := viewProdutoHw.fstr('tipo_ec');
      tipoERP1  := viewProdutoHw.fstr('tipo_ec1');
      if tipoERP.Trim = '' then
      begin
        tipoERP   := viewProduto.fstr('tipoec');
        tipoERP1  := viewProduto.fstr('tipoec1');
      end;
    end;

    dbAllVariants := servico.GetVariacoes(variants,
      GrupoProd,
      CodProd,
      tipoEC,
      tipoEC1,
      id);

    ResolverFiltroVariacoes(
      viewProduto.fInt('id'),
      tipoEC,
      tipoEC1,
      tipoERP,
      tipoERP1);

    ts_produtos.TabVisible     := false;
    ts_categorias.TabVisible   := false;

    pg_principal.ActivePage := ts_grades_variacao_prod;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_produto_vincClick(Sender: TObject);
var
  Id: Integer;
  produto: TProduct;
  vincular: Boolean;
begin
  if viewProdutoHw.IsEmpty then
  begin
    ShowAtencao('Sem produtos no banco de dados');
    Exit;
  end;

  try
    Id := viewProduto.fInt('id');
    if viewProduto.prepare_loop('sel = ''S''').Count > 1 then
    begin
      ShowAtencao('Selecione 1 registro de cada vez para vincular');
      Exit;
    end
    else if viewProduto.Count = 1 then
      Id := viewProduto.fInt('id');

  finally
    viewProduto.prepare_loop_done();
  end;

  vincular := False;
  for produto in produtos do
    if TryCond(vincular, produto.id = Id) then
      Break;

  if viewProduto.fint('grupo_prod') > 0 then
  begin
    ShowAtencao('Produto do E-Commerce selecionado está vinculado a um produto do sistema.' +#13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  if viewProdutoHw.fint('id_commerce') > 0 then
  begin
    ShowAtencao('Produto do sistema está vinculado a um produto do E-Commerce.' + #13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  RadioGroupOpcao.ItemIndex :=
    _LerConfiguracoesRegistroInteger(RadioGroupOpcao.Name, 0);

  if vincular and
    (ShowConfirmacao('Deseja mesmo vincular esse produto?') = ID_YES) and
    (servico.VincularProduto(produto,
      viewProdutoHw.fint('grupo_prod'),
      viewProdutoHw.fstr('cod_prod'),
      viewProdutoHw.ffloat('altura_prod'),
      viewProdutoHw.ffloat('comprimento_prod'),
      viewProdutoHw.ffloat('largura_prod'),
      viewProdutoHw.ffloat('peso_brut_prod'),
      viewProdutoHw.ffloat('peso_liq_prod'))) then
  begin
    ConsultaProdutoHw('');
    _GravaConfiguracoesInteger(
      RadioGroupOpcao.Name,
      RadioGroupOpcao.ItemIndex);
  end;
end;

procedure TFrmNuvemshopCadastros.bt_produto_vinc_removeClick(Sender: TObject);
begin
  if viewProdutoHw.IsEmpty then
    Exit;

  if viewProdutoHw.fint('id_commerce') = 0 then
  begin
    ShowAtencao('Não existe produto vinculado do e-commerce para o registro selecionado');
    Exit;
  end;

  if ShowConfirmacao('Deseja mesmo desvincular esse produto?') = ID_YES then
    if servico.DesvincularProduto(viewProdutoHw.fint('grupo_prod'), viewProdutoHw.fstr('cod_prod')) then
      ConsultaProdutoHw('');
end;

procedure TFrmNuvemshopCadastros.bt_prod_pagClick(Sender: TObject);
var
  pag: string;
  pagInt: Integer;
  totalPag: Int64;
begin
  if consultaProd = nil then
    Exit
  else if consultaProd.paging = nil then
    Exit;

  if consultaProd.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaProd.paging.total / consultaProd.paging.limit);

  if totalPag = 1 then
  begin
    ShowAtencao('Não existem mais páginas para consulta');
    Exit;
  end;

  pag := '1';

  if not InputQuery('Ir para a página', 'Informe o número da página para consulta', pag) then
    Exit;

  if TryStrToInt(pag, pagInt) then
  begin
    if pagInt > totalPag then
      ShowErro('Página inválida, informe de 1 até %d', [totalPag])
    else
      ConsultaProdutoNuvemshop(pagInt);
  end
  else
    ShowErro('Página informada inválida');
end;

procedure TFrmNuvemshopCadastros.bt_prod_pag_anteriorClick(Sender: TObject);
begin
  if produtos = nil then
    Exit;

  if (servico.TotalPag = 0) or (servico.pag <= 1) then
    Exit;

  ConsultaProdutoNuvemshop(servico.pag - 1);
end;

procedure TFrmNuvemshopCadastros.bt_prod_pag_primeiraClick(Sender: TObject);
begin
  ConsultaProdutoNuvemshop();
end;

procedure TFrmNuvemshopCadastros.bt_prod_pag_proximaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if produtos = nil then
    Exit;

  if servico.TotalPag = 0 then
    Exit;

  totalPag := Ceil(servico.Registros / servico.limit);

  if (servico.pag + 1) > totalPag then
    Exit;

  ConsultaProdutoNuvemshop(servico.pag + 1);
end;

procedure TFrmNuvemshopCadastros.bt_prod_pag_ultimaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if produtos = nil then
    Exit;

  if servico.TotalPag = 0 then
    Exit;

  totalPag := Ceil(servico.Registros / servico.limit);

  ConsultaProdutoNuvemshop(totalPag);
end;

procedure TFrmNuvemshopCadastros.bt_reenviar_img_produtoClick(Sender: TObject);
begin
  if trim(DBTextIdTray2.DataSource.DataSet.FieldByName(DBTextIdTray2.DataField).AsString) = '' then
    exit;

  if trim(DBTextIdTray2.DataSource.DataSet.FieldByName(DBTextIdTray2.DataField).AsString) <> '' then
     if (StrToInt(DBTextIdTray2.DataSource.DataSet.FieldByName(DBTextIdTray2.DataField).AsString) <= 0) then
       exit;

  if (ShowConfirmacao('Deseja reenviar imagens do produto para o E-Commerce?') = ID_YES) then
    if not (servico.ReenviarImagensProduto(StrToInt(DBTextIdTray2.DataSource.DataSet.FieldByName(DBTextIdTray2.DataField).AsString), false)) then
      exit;
end;

procedure TFrmNuvemshopCadastros.bt_sair_categClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNuvemshopCadastros.bt_sair_produtoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNuvemshopCadastros.bt_variacoes_produtos_adcClick(
  Sender: TObject);
begin
  if viewVariant.IsEmpty then
  begin
    ShowAtencao('Sem variações(grades) para cadastrar');
    Exit;
  end;

  viewVariant.prepare_loop('sel = ''S''');
  if viewVariant.IsEmpty then
  begin
    ShowAtencao('Nenhuma variação(grade) selecionada');
    Exit;
  end;

  try

    with servico.Auditor.Inserir.Table(tbGrade).Processo('PRO397') do
      if not Permitido then
        Exit;

    if not viewVariant.IsEmpty then
      if not servico.AdicionarGrade(viewVariant, GrupoProd, CodProd) then
      begin
        VincularProdutos;
        exit;
      end;

      VincularProdutos;
  finally
    viewVariant.prepare_loop_done();
    bt_produto_variacao_trayClick(Sender);
//    ResolverFiltroGrades;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_variacoes_produtos_cadClick(
  Sender: TObject);
var
  tipo_ec, descricao_ec, tipo_ec1, descricao_ec1: string;
begin

  if not grid_variacoes_produto_tray.Visible then
    Exit;

  if viewVariant.IsEmpty then
  begin
    ShowAtencao('Sem variações(grades) para cadastrar');
    Exit;
  end;

  viewVariant.prepare_loop('sel = ''S''');
  if viewVariant.IsEmpty then
  begin
    ShowAtencao('Nenhuma variação(grade) selecionada');
    Exit;
  end;

  try

    with servico.Auditor.Inserir.Table(tbGrade).Processo('PRO396') do
      if not Permitido then
        Exit;

    if not viewVariant.IsEmpty then
      if not servico.CadastrarGrade(viewVariant) then
        exit;
  finally
    viewVariant.prepare_loop_done();
    bt_produto_variacao_trayClick(Sender);
//    ResolverFiltroGrades;
  end;
end;

procedure TFrmNuvemshopCadastros.bt_variacoes_produto_check_alllClick(
  Sender: TObject);
begin
  viewVariant.CheckUnCheckAllRows(True);
end;

procedure TFrmNuvemshopCadastros.bt_variacoes_produto_uncheck_allClick(
  Sender: TObject);
begin
  viewVariant.CheckUnCheckAllRows(False);
end;

procedure TFrmNuvemshopCadastros.bt_varicoes_produtos_voltarClick(
  Sender: TObject);
begin
  ts_produtos.TabVisible     := true;
  ts_categorias.TabVisible   := true;

  pg_principal.ActivePage := ts_produtos;
end;

procedure TFrmNuvemshopCadastros.bt_voltar_img_produtoClick(Sender: TObject);
begin
  ts_produtos.TabVisible     := true;
  ts_categorias.TabVisible   := true;

  pg_principal.ActivePage := ts_produtos;
end;

procedure TFrmNuvemshopCadastros.ConsultaCategoriaHw(pIds: string);
begin
  with servico.Auditor.Visualizar.Table(tbCategoria).Processo('PRO391')
    .Msg('%s %s %s %s',[IfThen(paramsCategoriaHw.campo.Equals('') , IfThen(paramsCategoriaHw.onlySinc, 'Sinc', 'Dados EC'), 'Consulta'),
                                paramsCategoriaHw.campo, paramsCategoriaHw.condicao, paramsCategoriaHw.texto]) do
    if not Permitido then
      Exit;

  if trim(pIds) <> '' then
    dbAllCategorias := servico.GetCategorias(dbAllCategorias, pIds)
  else if paramsCategoriaHw.campo = '' then
    dbAllCategorias := servico.GetCategorias(dbAllCategorias, paramsCategoriaHw.onlySinc)
  else
    dbAllCategorias := servico.GetCategorias(dbAllCategorias, paramsCategoriaHw.campo, paramsCategoriaHw.condicao, paramsCategoriaHw.texto);

  ResolverFiltroCategorias('S');
  ResolverFiltroCategoriasNuvemshop();
end;

procedure TFrmNuvemshopCadastros.ConsultaCategoriaNuvemshop(all: Boolean;
  pag: Integer; pIds: string);
var
  registros, limit, totalPag: Integer;
  vtotalpag: Integer;
begin
  with servico.Auditor.Visualizar.Table(tbCategoria).Processo('PRO391')
    .Msg('%s Tipo %s %s', [IfThen(not all, ' Pag ' + pag.ToString), paramsCategoriaNuvemshop.tipo, System.string.Join(',', paramsCategoriaNuvemshop.params)]) do
    if not Permitido then
      Exit;

  Screen.Cursor := crHourGlass;
  sc_categorias.Enabled := False;
  try

    limit := 40;
    if trim(pIds) <> '' then
    begin
      categorias := servico.GetList<TCategory>('categories', 'Categories', [pIds]);
    end
    else if not all then
    begin
      servico.pag       := pag;
      servico.limit     := limit;
      servico.registros := servico.GetCount<TCategory>('categories', 'Categories', ['per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);

      totalPag := Ceil(servico.registros / limit);

      servico.TotalPag := totalPag;

      categorias := servico.GetList<TCategory>('categories', 'Categories', ['per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);
    end
    else
    begin
      categorias := [];
      totalPag := 0;
      pag      := 1;
      servico.pag := pag;

      bt_categ_pag.Caption := 'Página 1 de ?';

      repeat
        if totalPag > 0 then
          bt_categ_pag.Caption := Format('Página %d de %d', [pag, totalPag]);
        Application.ProcessMessages;

        servico.limit := limit;
        servico.registros := servico.GetCount<TCategory>('categories', 'Categories', ['per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);

        totalPag := Ceil(servico.registros / limit);

        servico.TotalPag := totalPag;

        cat := servico.GetList<TCategory>('categories', 'Categories', ['per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);

        categorias := categorias + cat;

        pag := pag + 1;
        servico.pag := pag;
      until
        (pag > totalPag);

      consultaCategoria := nil;
    end;

    ConsultaCategoriaHw(pIds);

    ResolverFiltroCategoriasNuvemshop();

  finally
    ResolverFiltroCategorias();
    bt_categ_goto_sistema.Enabled := (viewCategoria.Count > 0) and (viewCategoriaHw.Count > 0);
    bt_categ_goto_tray.Enabled    := (viewCategoria.Count > 0) and (viewCategoriaHw.Count > 0);
    sc_categorias.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.ConsultaCategoriaNuvemshop(pag: Integer);
begin
  ConsultaCategoriaNuvemshop(False, pag, '');
end;

procedure TFrmNuvemshopCadastros.ConsultaProdutoHw(pIds: string);
begin
  with servico.Auditor.Visualizar.Table(tbProduto).Processo('PRO415')
    .Msg('%s %s %s %s',[IfThen(paramsProdHw.campo.Equals('') , IfThen(paramsProdHw.onlySinc, 'Sinc', 'Dados EC'), 'Consulta'),
                                paramsProdHw.campo, paramsProdHw.condicao, paramsProdHw.texto]) do
    if not Permitido then
      Exit;

  if trim(pIds) <> '' then
    dbAllProdutos := servico.GetProdutos(dbAllProdutos, pIds)
  else if paramsProdHw.campo = '' then
    dbAllProdutos := servico.GetProdutos(dbAllProdutos, paramsProdHw.onlySinc)
  else
    dbAllProdutos := servico.GetProdutos(dbAllProdutos, paramsProdHw.campo, paramsProdHw.condicao, paramsProdHw.texto);

  ResolverFiltroProdutos('S');
  ResolverFiltroProdutosNuvemshop();
end;

procedure TFrmNuvemshopCadastros.ConsultaProdutoNuvemshop(all: Boolean; pag: Integer;
  pIds: string);
var
  registros, limit, totalPag: Integer;
  vtotalpag: Integer;
begin
  with servico.Auditor.Visualizar.Table(tbProduto).Processo('PRO383')
    .Msg('%s Tipo %s %s', [IfThen(not all, ' Pag ' + pag.ToString), paramsProdNuvemshop.tipo, System.string.Join(',', paramsProdNuvemshop.params)]) do
    if not Permitido then
      Exit;

  Screen.Cursor := crHourGlass;
  sc_produtos.Enabled := False;
  try

    limit := 40;
    if trim(pIds) <> '' then
    begin
      produtos := servico.GetList<TProduct>('products', 'Products', [pIds]);
    end
    else if not all then
    begin
      servico.pag       := pag;
      servico.limit     := limit;
      servico.registros := servico.GetCount<TProduct>('products', 'Products', ['sort_by|name-ascending|', 'per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);

      totalPag := Ceil(servico.registros / limit);

      servico.TotalPag := totalPag;

      produtos := servico.GetList<TProduct>('products', 'Products', ['sort_by|name-ascending|', 'per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);
    end
    else
    begin
      produtos := [];
      totalPag := 0;
      pag      := 1;
      servico.pag := pag;

      bt_prod_pag.Caption := 'Página 1 de ?';

      repeat
        if totalPag > 0 then
          bt_prod_pag.Caption := Format('Página %d de %d', [pag, totalPag]);
        Application.ProcessMessages;

        servico.limit := limit;
        servico.registros := servico.GetCount<TProduct>('products', 'Products', ['sort_by|name-ascending|', 'per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);

        totalPag := Ceil(servico.registros / limit);

        servico.TotalPag := totalPag;

        prod := servico.GetList<TProduct>('products', 'Products', ['sort_by|name-ascending|', 'per_page|' + limit.ToString + '|', 'page|' + pag.ToString + '|']);

        produtos := produtos + prod;

        pag := pag + 1;
        servico.pag := pag;
      until
        (pag > totalPag);

      consultaProd := nil;
    end;

//    if (Length(produtos) > 0) and (Length(categorias) = 0) then
//      bt_categ_consulta_todosClick(bt_categ_consulta_todos);

    ConsultaProdutoHw(pIds);

    ResolverFiltroProdutosNuvemshop();

  finally
    ResolverFiltroProdutos();
    bt_produto_goto_sistema.Enabled := (viewProduto.Count > 0) and (viewProdutoHw.Count > 0);
    bt_produto_goto_tray.Enabled    := (viewProduto.Count > 0) and (viewProdutoHw.Count > 0);
    sc_produtos.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmNuvemshopCadastros.ConsultaProdutoNuvemshop(pag: Integer);
begin
  ConsultaProdutoNuvemshop(False, pag, '');
end;

procedure TFrmNuvemshopCadastros.ExibirImagensProduto(produto: TProductHw);
var
  ADoccument: Variant;
  image: TImagesNuvemshop;
  html: string;
  url: turl;
begin

  if not Assigned(Web.Document) then
    Web.Navigate('about:blank');

  html := '<!DOCTYPE html><html><body>' +
          '<h2>Visualização de imagens</h2>';

  if Length(produto.Images) > 0 then
  begin
    html := html + '<h3>Imagens do E-commerce - Produto</h3>' +
                   '<p>';

    for image in produto.Images do

      html := html + Format('<img src="%s" width="300" height="300">', [image.src]);

    html := html + '</p>';
  end;

  if Length(produto.hw_image_local) > 0 then
  begin
    html := html + '<h3>Imagens Local do Sistema</h3>' +
                   '<p>';

    for url in produto.hw_image_local do

      html := html + Format('<img src="%s" width="300" height="300">', [url.http]);

    html := html + '</p>';
  end;

  if Length(produto.hw_image_url) > 0 then
  begin
    html := html + '<h3>Imagens do Sistema - Upload temporário</h3>' +
                   '<p>';

    for url in produto.hw_image_url do

      html := html + Format('<img src="%s" width="300" height="300">', [url.http]);

    html := html + '</p>';
  end;

  lbQtdeImagensSis.Caption := IntToStr(Length(produto.hw_image_local));
  lbQtdeImgEnvLoja.Caption := IntToStr(Length(produto.hw_image_url));
  lbQtdeExibidaLoja.Caption := IntToStr(Length(produto.Images));

  html := html + '</body></html>';

  ADoccument := Web.Document;
  ADoccument.Clear;
  ADoccument.Write(html);
  ADoccument.Close;

  ts_produtos.TabVisible     := false;
  ts_categorias.TabVisible   := false;

  groupbox_img_produto.Caption := 'Produto';
  pnImgProduto.Caption := 'Imagens do Produto no E-Commerce / Sistema';
  pg_principal.ActivePage := ts_browser;
end;

procedure TFrmNuvemshopCadastros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  servico.Free;

  //categorias

  //marcas

  //produtos

  Action := caFree;
  FrmNuvemshopCadastros := nil;
end;

procedure TFrmNuvemshopCadastros.FormCreate(Sender: TObject);
begin
  servico := THwNuvemshopServicos.Create(False);

  // categorias
  viewCategoria   := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TCategoryMescladaHw, True, Self));
  viewCategoriaHw := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TCategoriaHw, True, Self));

  // variacoes / grades
  viewVariant     := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TVariantHw2, True, Self));
  viewVariantHw   := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TVariantHw2, True, Self));

  // produtos
  viewProduto     := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TProductMescladaHw, True, Self));
  viewProdutoHw   := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TProductHw, True, Self));
end;

procedure TFrmNuvemshopCadastros.FormShow(Sender: TObject);
var
  I: Integer;
begin
  servico.DataBasePath := Self.DataBasePath;
  servico.CodEmpresa := Self.FCodEmpresa;
  servico.Usuario := Self.FUsuario;
  servico.OnLog := Log;
  servico.Inicializar;

  //categorias
  THwHack_DbGrid.Create(grid_categ_tray, true, True, True, False);
  grid_categ_tray.DataSource := viewCategoria.DataSourceOOP;
  for I := 0 to viewCategoria.DataSet.FieldCount - 1 do viewCategoria.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_categ_tray, viewCategoria.DataSet, 'sel'              , 18                , '..');
  InitGridColumnsR(1, grid_categ_tray, viewCategoria.DataSet, 'id'               , COLUMN_SIZE_ID    , 'Id');
  InitGridColumnsL(2, grid_categ_tray, viewCategoria.DataSet, 'name_category'    , COLUMN_SIZE_SHORT , 'Descrição');
  InitGridColumnsR(3, grid_categ_tray, viewCategoria.DataSet, 'parent'           , COLUMN_SIZE_ID    , 'Pai Id');
  InitGridColumnsR(4, grid_categ_tray, viewCategoria.DataSet, 'cod_categoria'    , COLUMN_SIZE_ID    , 'Hw Id');
  InitGridColumnsL(5, grid_categ_tray, viewCategoria.DataSet, 'descricao'        , COLUMN_SIZE_STRING, 'Hw Descrição');
  viewCategoria.DataSet.IndexFieldNames := 'id';

  grid_categ_hw.DataSource := viewCategoriaHw.DataSourceOOP;
  for I := 0 to viewCategoriaHw.DataSet.FieldCount - 1 do viewCategoriaHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_categ_hw, viewCategoriaHw.DataSet, 'cod_categoria'    , COLUMN_SIZE_ID    , 'Id');
  InitGridColumnsL(1, grid_categ_hw, viewCategoriaHw.DataSet, 'descricao'        , COLUMN_SIZE_SHORT , 'Descrição');
  InitGridColumnsL(2, grid_categ_hw, viewCategoriaHw.DataSet, 'cod_categoria_pai', COLUMN_SIZE_ID    , 'Pai Id');
  InitGridColumnsL(3, grid_categ_hw, viewCategoriaHw.DataSet, 'id_commerce'      , COLUMN_SIZE_ID +20,'E-commerce Id');
  InitGridColumnsL(4, grid_categ_hw, viewCategoriaHw.DataSet, 'name_commerce'    , COLUMN_SIZE_STRING, 'E-commerce Nome');
  ResolverFiltroCategorias;

  //variacao / grade produto
  THwHack_DbGrid.Create(grid_variacoes_produto_tray);
  grid_variacoes_produto_tray.DataSource := viewVariant.DataSourceOOP;
  for I := 0 to viewVariant.DataSet.FieldCount - 1 do viewVariant.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_variacoes_produto_tray, viewVariant.DataSet, 'sel'          , 18               , '..');
  InitGridColumnsR(1, grid_variacoes_produto_tray, viewVariant.DataSet, 'id'           , COLUMN_SIZE_ID   , 'Id');
  InitGridColumnsL(2, grid_variacoes_produto_tray, viewVariant.DataSet, 'tipo_ec'      , COLUMN_SIZE_ID   , 'ec Tipo 1');
  InitGridColumnsL(3, grid_variacoes_produto_tray, viewVariant.DataSet, 'descricao_ec' , COLUMN_SIZE_SHORT, 'E-ecommerce Valor 1');
  InitGridColumnsL(4, grid_variacoes_produto_tray, viewVariant.DataSet, 'tipo_ec1'     , COLUMN_SIZE_ID   , 'ec Tipo 2');
  InitGridColumnsL(5, grid_variacoes_produto_tray, viewVariant.DataSet, 'descricao_ec1', COLUMN_SIZE_SHORT, 'E-ecommerce Valor 2');
  InitGridColumnsR(6, grid_variacoes_produto_tray, viewVariant.DataSet, 'cod_grade'    , COLUMN_SIZE_ID   , 'Hw Id');
  InitGridColumnsL(7, grid_variacoes_produto_tray, viewVariant.DataSet, 'descricao'    , COLUMN_SIZE_SHORT, 'Hw Descrição Grade 1');
  InitGridColumnsL(8, grid_variacoes_produto_tray, viewVariant.DataSet, 'descricao1'   , COLUMN_SIZE_SHORT, 'Hw Descrição Grade 2');
  viewVariant.DataSet.IndexFieldNames := 'id';

  grid_variacoes_produto_hw.DataSource := viewVariantHw.DataSourceOOP;
  for I := 0 to viewVariantHw.DataSet.FieldCount - 1 do viewVariantHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'cod_grade'      , COLUMN_SIZE_ID -8   ,  'Id');
  InitGridColumnsR(1, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'descricao'      , COLUMN_SIZE_SHORT - 1, 'Descrição 1');
  InitGridColumnsR(2, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'descricao1'     , COLUMN_SIZE_SHORT - 1, 'Descrição 2');
  InitGridColumnsC(3, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'gr_adicionadas' , 24                  ,  'Adc');
  InitGridColumnsL(4, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'tipo_ec'        , COLUMN_SIZE_ID       , 'ec Tipo 1');
  InitGridColumnsL(5, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'descricao_ec'   , COLUMN_SIZE_SHORT - 1, 'E-ecommerce Valor 1');
  InitGridColumnsL(6, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'tipo_ec1'       , COLUMN_SIZE_ID      ,  'ec Tipo 2');
  InitGridColumnsL(7, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'descricao_ec1'  , COLUMN_SIZE_SHORT - 1, 'E-ecommerce Valor 2');
  InitGridColumnsL(8, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'id_commerce'    , COLUMN_SIZE_ID +20,    'E-commerce Id');
  ResolverFiltroVariacoes(0, '', '', '', '');

  //products
//  THwHack_DbGrid.Create(grid_produto, true, True, True, False);
  grid_produto.DataSource := viewProduto.DataSourceOOP;
  for I := 0 to viewProduto.DataSet.FieldCount - 1 do viewProduto.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_produto, viewProduto.DataSet, 'sel'              , 18                , '..');
  InitGridColumnsR(1, grid_produto, viewProduto.DataSet, 'id'               , COLUMN_SIZE_ID    , 'Id');
  InitGridColumnsL(2, grid_produto, viewProduto.DataSet, 'name_product'     , COLUMN_SIZE_STRING, 'Descrição');
  InitGridColumnsC(3, grid_produto, viewProduto.DataSet, 'has_variation'    , 44                , 'Tem Var');
  InitGridColumnsC(4, grid_produto, viewProduto.DataSet, 'has_image'        , 44                , 'Tem Img');
  InitGridColumnsR(5, grid_produto, viewProduto.DataSet, 'grupo_prod'       , COLUMN_SIZE_ID    , 'Hw Grupo');
  InitGridColumnsR(6, grid_produto, viewProduto.DataSet, 'cod_prod'         , COLUMN_SIZE_ID    , 'Hw Cod Prod');
  InitGridColumnsR(7, grid_produto, viewProduto.DataSet, 'num_fab_prod'     , COLUMN_SIZE_ID    , 'Hw Num Fab Prod');
  InitGridColumnsL(8, grid_produto, viewProduto.DataSet, 'descr_prod'       , COLUMN_SIZE_STRING, 'Hw Descrição');
  viewProduto.DataSet.IndexFieldNames := 'id';

  grid_produto_hw.DataSource := viewProdutoHw.DataSourceOOP;
  for I := 0 to viewProdutoHw.DataSet.FieldCount - 1 do viewProdutoHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_produto_hw, viewProdutoHw.DataSet, 'grupo_prod'       , COLUMN_SIZE_ID    , 'Grupo Prod');
  InitGridColumnsR(1, grid_produto_hw, viewProdutoHw.DataSet, 'cod_prod'         , COLUMN_SIZE_ID    , 'Cod Prod');
  InitGridColumnsR(2, grid_produto_hw, viewProdutoHw.DataSet, 'num_fab_prod'     , COLUMN_SIZE_ID    , 'Num Fab Prod');
  InitGridColumnsL(3, grid_produto_hw, viewProdutoHw.DataSet, 'descr_prod'       , COLUMN_SIZE_STRING, 'Descrição');
  InitGridColumnsC(4, grid_produto_hw, viewProdutoHw.DataSet, 'tem_grade'        , 44                , 'Grade');
  InitGridColumnsC(5, grid_produto_hw, viewProdutoHw.DataSet, 'hw_image'         , 44                , 'Imagem');
  InitGridColumnsL(6, grid_produto_hw, viewProdutoHw.DataSet, 'id_commerce'      , COLUMN_SIZE_ID +20, 'E-commerce Id');
  ResolverFiltroProdutos;

  DBTextDesrTrayProduto.DataSource := viewProduto.DataSourceOOP;
  DBTextDesrTrayProduto.DataField  := 'NAME_PRODUCT';

  DBTextDesrProdutoHw.DataSource   := viewProdutoHw.DataSourceOOP;
  DBTextDesrProdutoHw.DataField    := 'DESCR_PROD';

  DBTextGrupoProdutoHw.DataSource  := viewProdutoHw.DataSourceOOP;
  DBTextGrupoProdutoHw.DataField   := 'GRUPO_PROD';

  DBTextCodigoProdutoHw.DataSource := viewProdutoHw.DataSourceOOP;
  DBTextCodigoProdutoHw.DataField  := 'COD_PROD';

  DBTextIdTrayProduto.DataSource   := viewProduto.DataSourceOOP;
  DBTextIdTrayProduto.DataField    := 'ID';

  // produtos
  bt_produto_link.Enabled          := False;
  bt_produto_goto_sistema.Enabled  := False;
  bt_produto_imagens_tray.Enabled  := False;
  bt_produto_variacao_tray.Enabled := False;

  bt_prod_pag.Enabled             := False;
  bt_prod_pag_primeira.Enabled    := False;
  bt_prod_pag_anterior.Enabled    := False;
  bt_prod_pag_proxima.Enabled     := False;
  bt_prod_pag_ultima.Enabled      := False;

  bt_produto_vinc.Enabled         := False;
  bt_produto_vinc_remove.Enabled  := False;
  bt_produto_goto_tray.Enabled    := False;
  bt_produto_imagens_hw.Enabled   := False;

  // categorias
  bt_categ_check_all.Enabled       := False;
  bt_categ_uncheck_all.Enabled     := False;
  bt_categ_goto_sistema.Enabled    := False;

  bt_categ_pag.Enabled             := False;
  bt_categ_pag_primeira.Enabled    := False;
  bt_categ_pag_anterior.Enabled    := False;
  bt_categ_pag_proxima.Enabled     := False;
  bt_categ_pag_ultima.Enabled      := False;

  bt_categ_vinc.Enabled         := False;
  bt_categ_vinc_remove.Enabled  := False;
  bt_categ_goto_tray.Enabled       := False;

  ts_grades_variacao_prod.TabVisible := false;
  ts_log.TabVisible                  := false;
  ts_browser.TabVisible              := false;
  ts_db_categorias.TabVisible        := false;
  ts_db_produtos.TabVisible          := false;
  ts_Imagens.TabVisible              := false;

  me_texto_cons_produto.Clear;
  me_texto_cons_categoria.Clear;
  ts_produtos.Show;

  servico.ConcederPermissoesTabelasViews;
end;

procedure TFrmNuvemshopCadastros.grid_categ_hwDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  if not Assigned(Sender) then
    Exit;

  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.IsEmpty then
    Exit;

  if (Column.Field.Dataset.FieldbyName('ID_COMMERCE').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnCatSemVincERP.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmNuvemshopCadastros.grid_categ_trayDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  if not Assigned(Sender) then
    Exit;

  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.IsEmpty then
    Exit;

  if (Column.Field.Dataset.FieldbyName('COD_CATEGORIA').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnCatSemVincEC.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Agrid.DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      Agrid.Canvas.Brush.Color := clWindow;
      Agrid.Canvas.Font.Color  := clWindowText;
    end
    else
    begin
      Agrid.Canvas.Brush.Color := clHighlight;
      Agrid.Canvas.Font.Color  := clWhite;
    end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if UpperCase(Column.FieldName) = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end
end;

procedure TFrmNuvemshopCadastros.grid_produtoCellClick(Column: TColumn);
begin
  if UpperCase(Column.FieldName) = 'SEL' then
    marcaDesmacarLinhaProduto;
end;

procedure TFrmNuvemshopCadastros.grid_produtoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  if not Assigned(Sender) then
    Exit;

  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.IsEmpty then
    Exit;

  if (Column.Field.Dataset.FieldbyName('GRUPO_PROD').AsInteger <= 0)
    and (trim(Column.Field.Dataset.FieldbyName('COD_PROD').AsString) = '') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnProdSemVincEC.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Agrid.DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      Agrid.Canvas.Brush.Color := clWindow;
      Agrid.Canvas.Font.Color  := clWindowText;
    end
    else
    begin
      Agrid.Canvas.Brush.Color := clHighlight;
      Agrid.Canvas.Font.Color  := clWhite;
    end;

  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  if UpperCase(Column.FieldName) = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end
  else if LowerCase(Column.FieldName) = 'has_variation' then
  begin
    if Column.Width <> 24 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = '1' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end
  else if LowerCase(Column.FieldName) = 'has_image' then
  begin
    if Column.Width <> 24 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = '1' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmNuvemshopCadastros.grid_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    marcaDesmacarLinhaProduto;
end;

procedure TFrmNuvemshopCadastros.grid_produto_hwDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  if not Assigned(Sender) then
    Exit;

  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.IsEmpty then
    Exit;

  if (Column.Field.Dataset.FieldbyName('ID_COMMERCE').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnProdSemVincERP.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Agrid.DataSource.DataSet.FieldByName('hw_image').AsString = 'P' then
  begin
    if (gdFocused in State) then
      begin
        Agrid.Canvas.Brush.Color := clWindow;
        Agrid.Canvas.Font.Color  := clWindowText;
      end
      else
      begin
        //Agrid.Canvas.Brush.Color := clHighlight;
        Agrid.Canvas.Font.Color  := clRed;
      end;
  end;

  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if LowerCase(Column.FieldName) = 'tem_grade' then
  begin
    if Column.Width <> 24 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = '1' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if LowerCase(Column.FieldName) = 'hw_image' then
  begin
    if Column.Width <> 24 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString <> '' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmNuvemshopCadastros.grid_variacoes_produto_hwDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.IsEmpty then
    Exit;

  if Agrid.DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      Agrid.Canvas.Brush.Color := clWindow;
      Agrid.Canvas.Font.Color  := clWindowText;
    end
    else
    begin
      Agrid.Canvas.Brush.Color := clHighlight;
      Agrid.Canvas.Font.Color  := clWhite;
    end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if UpperCase(Column.FieldName) = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end
  else if LowerCase(Column.FieldName) = 'gr_adicionadas' then
  begin
    if Column.Width <> 24 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = '1' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmNuvemshopCadastros.grid_variacoes_produto_trayDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  if not Assigned(Sender) then
    Exit;

  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.IsEmpty then
    Exit;

  if Agrid.DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      Agrid.Canvas.Brush.Color := clWindow;
      Agrid.Canvas.Font.Color  := clWindowText;
    end
    else
    begin
      Agrid.Canvas.Brush.Color := clHighlight;
      Agrid.Canvas.Font.Color  := clWhite;
    end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if UpperCase(Column.FieldName) = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end
  else if LowerCase(Column.FieldName) = 'has_product' then
  begin
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = '1' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmNuvemshopCadastros.IdHTTPWork(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  pbprogresso.Position := AWorkCount;
  lblStatus.Caption    := 'Baixando ... ' + retornaKiloBytes(AWorkCount);
  lblDownloadEm.Caption := 'Download em ... ' + retornaPorcentagem(pbprogresso.Max, AWorkCount);
end;

procedure TFrmNuvemshopCadastros.IdHTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  pbprogresso.Max := AWorkCountMax;
end;

procedure TFrmNuvemshopCadastros.IdHTTPWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
//  pbprogresso.Position := 0;
  lblDownloadEm.Caption := 'Finalizado ...';
  lblStatus.Caption    := 'Download Finalizado ...';
//  pbprogresso.Visible  := false;

//  TForm(pnBaixarImagens.Parent).ModalResult := IDOK;
end;

procedure TFrmNuvemshopCadastros.InitGridColumns(Index: Integer; grid: TDBGrid;
  client: TClientDataSet; FieldName: string; Size: Integer;
  DisplayLabel: string; alignment: TAlignment);
var
  I: Integer;
begin
  client.FieldByName(FieldName).Alignment := alignment;
  client.FieldByName(FieldName).Visible := True;
  if not DisplayLabel.IsEmpty then
    client.FieldByName(FieldName).DisplayLabel := DisplayLabel;

  for I := 0 to grid.Columns.Count - 1 do
    if grid.Columns[I].FieldName = FieldName then
    begin
      grid.Columns[I].Width := Size;
      grid.Columns[I].Index := Index;
      //grid.Columns[I].Alignment := alignment;
    end;

end;

procedure TFrmNuvemshopCadastros.InitGridColumnsC(Index: Integer; grid: TDBGrid;
  client: TClientDataSet; FieldName: string; Size: Integer;
  DisplayLabel: string);
begin
  InitGridColumns(Index, grid, client, FieldName, Size, DisplayLabel, taCenter);
end;

procedure TFrmNuvemshopCadastros.InitGridColumnsL(Index: Integer; grid: TDBGrid;
  client: TClientDataSet; FieldName: string; Size: Integer;
  DisplayLabel: string);
begin
  InitGridColumns(Index, grid, client, FieldName, Size, DisplayLabel, taLeftJustify);
end;

procedure TFrmNuvemshopCadastros.InitGridColumnsR(Index: Integer; grid: TDBGrid;
  client: TClientDataSet; FieldName: string; Size: Integer;
  DisplayLabel: string);
begin
  InitGridColumns(Index, grid, client, FieldName, Size, DisplayLabel, taRightJustify);
end;

procedure TFrmNuvemshopCadastros.Log(Text: string);
begin
  ed_log.Lines.Add(Text);
end;

procedure TFrmNuvemshopCadastros.marcaDesmacarLinhaCategoria;
begin
  if grid_categ_tray.DataSource.dataSet.IsEmpty then
    exit;

  grid_categ_tray.DataSource.dataSet.Edit;
  if grid_categ_tray.DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    grid_categ_tray.DataSource.dataSet.FieldByName('SEL').AsString := ''
  else
    grid_categ_tray.DataSource.dataSet.FieldByName('SEL').AsString := 'S';
  grid_categ_tray.DataSource.dataSet.Post;
end;

procedure TFrmNuvemshopCadastros.marcaDesmacarLinhaProduto;
begin
  if grid_produto.DataSource.dataSet.IsEmpty then
    exit;

  grid_produto.DataSource.dataSet.Edit;
  if grid_produto.DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    grid_produto.DataSource.dataSet.FieldByName('SEL').AsString := ''
  else
    grid_produto.DataSource.dataSet.FieldByName('SEL').AsString := 'S';
  grid_produto.DataSource.dataSet.Post;
end;

procedure TFrmNuvemshopCadastros.marcaDesmacarLinhaVariacao;
begin
  if grid_variacoes_produto_hw.DataSource.dataSet.IsEmpty then
    exit;

  grid_variacoes_produto_hw.DataSource.dataSet.Edit;
  if grid_variacoes_produto_hw.DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    grid_variacoes_produto_hw.DataSource.dataSet.FieldByName('SEL').AsString := ''
  else
    grid_variacoes_produto_hw.DataSource.dataSet.FieldByName('SEL').AsString := 'S';
  grid_variacoes_produto_hw.DataSource.dataSet.Post;
end;

procedure TFrmNuvemshopCadastros.ResolverFiltroCategorias;
begin
  if (pTipo = 'E') or (pTipo = 'A') then
    pn_categ_tray_top.Caption := 'Lista de Categorias do E-commerce - [ Sem registros ]';
  if (pTipo = 'S') or (pTipo = 'A') then
    pn_produto_hw_top.Caption := 'Lista de Categorias do Sistema - [ Sem registros ]';

  if dbAllCategorias = nil then
    Exit;

  if not dbAllCategorias.Active then
    Exit;

  if (pTipo = 'E') or (pTipo = 'A') then
    viewCategoria.prepare_loop();
  if (pTipo = 'S') or (pTipo = 'A') then
    viewCategoriaHw.prepare_loop();
  try
    if (pTipo = 'E') or (pTipo = 'A') then
    begin
      viewCategoria.DataSet.EmptyDataSet;
      viewCategoria.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TCategoryMescladaHw>(servico.ResolverCategorias(categorias, '', 0, []) , viewCategoria.DataSet));
    end;

    if (pTipo = 'S') or (pTipo = 'A') then
    begin
      viewCategoriaHw.DataSet.EmptyDataSet;
      viewCategoriaHw.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TCategoriaHw>(servico.ResolverCategoriasHw(dbAllCategorias, categorias, 0, 0, []), viewCategoriaHw.DataSet));
    end;

  finally
    bt_categ_vinc.Enabled        := (viewCategoria.Count > 0) and (viewCategoriaHw.Count > 0);
    bt_categ_vinc_remove.Enabled := bt_categ_vinc.Enabled;
    bt_categ_cad.Enabled         := viewCategoria.Count > 0;
    bt_categ_check_all.Enabled   := bt_categ_cad.Enabled;
    bt_categ_uncheck_all.Enabled := bt_categ_cad.Enabled;
    bt_categ_produtos.Enabled    := bt_categ_cad.Enabled;

    if (pTipo = 'E') or (pTipo = 'A') then
      if viewCategoria.Count > 0 then
        pn_categ_tray_top.Caption := 'Lista de Categorias do E-commerce' + IfThen(Length(paramsCategoriaNuvemshop.params) > 0, ' - Filtro por ' + paramsCategoriaNuvemshop.tipo);

    if (pTipo = 'S') or (pTipo = 'A') then
      if viewCategoriaHw.Count > 0 then
        pn_produto_hw_top.Caption := 'Lista de Categorias do Sistema ' + paramsCategoriaHw.tipo;

    if (pTipo = 'E') or (pTipo = 'A') then
      viewCategoria.prepare_loop_done();
    if (pTipo = 'S') or (pTipo = 'A') then
      viewCategoriaHw.prepare_loop_done();
  end;
end;

procedure TFrmNuvemshopCadastros.ResolverFiltroCategoriasNuvemshop;
begin
   pn_categ_tray_top.Caption := 'Lista de Categorias do E-commerce - [ Sem registros ]';

  viewCategoria.prepare_loop();
  try
    viewCategoria.DataSet.EmptyDataSet;
    viewCategoria.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TCategoryMescladaHw>(servico.ResolverCategorias(categorias, '', 0, []), viewCategoria.DataSet));

  finally
    bt_categ_vinc.Enabled          := (viewCategoria.Count > 0) and (viewCategoriaHw.Count > 0);
    bt_categ_vinc_remove.Enabled   := bt_categ_vinc.Enabled;
    bt_categ_pag.Enabled              := (categorias <> nil) and (servico.Registros > 0) and (servico.Registros > Length(categorias));
    bt_categ_pag_primeira.Enabled     := (bt_categ_pag.Enabled) and (servico.Pag > 1);
    bt_categ_pag_anterior.Enabled     := (bt_categ_pag.Enabled) and (servico.Pag > 1);
    bt_categ_pag_proxima.Enabled      := (bt_categ_pag.Enabled) and (servico.Pag < Ceil(servico.Registros / servico.Limit));
    bt_categ_pag_ultima.Enabled       := (bt_categ_pag.Enabled) and (servico.Pag < Ceil(servico.Registros / servico.Limit));
    bt_produto_link.Enabled          := viewCategoria.Count > 0;
    bt_produto_imagens_tray.Enabled  := viewCategoria.Count > 0;
    bt_produto_variacao_tray.Enabled := viewCategoria.Count > 0;

    if bt_categ_pag.Enabled then
    begin
      if (servico.Pag = 1) and (Ceil(servico.Registros / servico.Limit) < 1) then
        bt_categ_pag.Caption := Format('Pag %d de %d', [servico.Pag, 1])
      else
        bt_categ_pag.Caption := Format('Pag %d de %d', [servico.Pag,
           Ceil(servico.Registros / servico.Limit)]);
    end
    else
      bt_categ_pag.Caption := '';

    if bt_categ_pag.Enabled then//(consultaProd <> nil) and (consultaProd.paging <> nil) then
      bt_categ_pag.Caption := Format('%d reg de %d', [Length(categorias), servico.Registros]) +
                             IfThen(bt_categ_pag.Caption <> '', sLineBreak + bt_categ_pag.Caption)
    else
      bt_categ_pag.Caption := Format('%d registro%s', [Length(categorias), IfThen(Length(categorias) > 1, 's')]) +
                             IfThen(bt_categ_pag.Caption <> '', sLineBreak + bt_categ_pag.Caption);

    if viewCategoria.Count > 0 then
      pn_categ_tray_top.Caption := 'Lista de Categorias do E-commerce' + IfThen(Length(paramsCategoriaNuvemshop.params) > 0, ' - Filtro por ' + paramsCategoriaNuvemshop.tipo);

    viewCategoria.prepare_loop_done();
  end;
end;

procedure TFrmNuvemshopCadastros.ResolverFiltroGrades;
begin
//var
//  grade: TProperty;
//  value: TPropertyValue;
//  propValue: TPropertyWithValueHw;
//  propValues: TArray<TPropertyWithValueHw>;
//  I: Integer;
//
//begin
//  pn_grade_tray_top.Caption       := 'Caracteristicas do E-commerce - [ Sem registros ]';
//  pn_grade_tray_top_dupla.Caption := 'Caracteristicas do E-commerce - [ Sem registros ]';
//  pn_grade_hw_top.Caption         := 'Grades do Sistema - [ Sem registros ]';
//
//  if dbAllGrades = nil then
//    Exit;
//
//  if not dbAllGrades.Active then
//    Exit;
//
//  viewGrade.prepare_loop();
//  viewGradeDu.prepare_loop();
//  viewGradeHw.prepare_loop();
//  try
//    viewGrade.DataSet.EmptyDataSet;
//    viewGradeDu.DataSet.EmptyDataSet;
//    viewGradeHw.DataSet.EmptyDataSet;
//
//    dbAllGrades.DataSet.First;
//    while not dbAllGrades.DataSet.Eof do
//    begin
//      viewGradeHw.DataSet.Append;
//      for I := 0 to viewGradeHw.DataSet.FieldCount - 1 do
//        viewGradeHw.DataSet.Fields[I].Value := dbAllGrades.DataSet.FieldByName(viewGradeHw.DataSet.Fields[I].FieldName).Value;
//
//      viewGradeHw.DataSet.Post;
//
//      dbAllGrades.DataSet.Next;
//    end;
//
//    viewGrade.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TPropertyWithValueHw>(grades, viewGrade.DataSet));
//    viewGradeDu.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TPropertyWithValueHw>(grades, viewGradeDu.DataSet));
//
//  finally
//    bt_grade_vinc1.Enabled        := (viewGrade.Count > 0) and (viewGradeHw.Count > 0);
//    bt_grade_vinc1_remove.Enabled := bt_grade_vinc1.Enabled;
//    bt_grade_vinc2.Enabled        := bt_grade_vinc1.Enabled and pn_grade_grid_dupla.Visible;
//    bt_grade_vinc2_remove.Enabled := bt_grade_vinc1.Enabled and pn_grade_grid_dupla.Visible;
//    bt_grade_cad.Enabled          := viewGrade.Count > 0;
//    bt_grade_check_all.Enabled    := bt_grade_cad.Enabled;
//    bt_grade_uncheck_all.Enabled  := bt_grade_cad.Enabled;
//
//    if viewGrade.Count > 0 then
//    begin
//      pn_grade_tray_top.Caption       := 'Caracteristicas do E-commerce';
//      pn_grade_tray_top_dupla.Caption := 'Caracteristicas do E-commerce';
//    end;
//    if viewGradeHw.Count > 0 then
//      pn_grade_hw_top.Caption := 'Grades do Sistema';
//
//    viewGrade.prepare_loop_done();
//    viewGradeDu.prepare_loop_done();
//    viewGradeHw.prepare_loop_done();
//  end;
end;

procedure TFrmNuvemshopCadastros.ResolverFiltroProdutos(pTipo: string);
begin
  if (pTipo = 'E') or (pTipo = 'A') then
    pn_produto_tray_top.Caption := 'Lista de Produtos do E-commerce - [ Sem registros ]';
  if (pTipo = 'S') or (pTipo = 'A') then
    pn_produto_hw_top.Caption   := 'Lista de Produtos do Sistema - [ Sem registros ]';

  if dbAllProdutos = nil then
    Exit;

  if not dbAllProdutos.Active then
    Exit;

  if (pTipo = 'E') or (pTipo = 'A') then
    viewProduto.prepare_loop();
  if (pTipo = 'S') or (pTipo = 'A') then
    viewProdutoHw.prepare_loop();
  try
    if (pTipo = 'E') or (pTipo = 'A') then
    begin
      viewProduto.DataSet.EmptyDataSet;
      viewProduto.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TProductHw>(servico.ResolverProdutos(produtos, categorias), viewProduto.DataSet));
    end;

    if (pTipo = 'S') or (pTipo = 'A') then
    begin
      viewProdutoHw.DataSet.EmptyDataSet;
      viewProdutoHw.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TProductHw>(servico.ResolverProdutosHw(dbAllProdutos, produtos), viewProdutoHw.DataSet));
    end;

  finally
    bt_produto_vinc.Enabled        := (viewProduto.Count > 0) and (viewProdutoHw.Count > 0);
    bt_produto_vinc_remove.Enabled := bt_produto_vinc.Enabled;
    bt_produto_imagens_hw.Enabled  := bt_produto_vinc.Enabled;

    if (pTipo = 'E') or (pTipo = 'A') then
      if viewProduto.Count > 0 then
        pn_produto_tray_top.Caption := 'Lista de Produtos do E-commerce' + IfThen(Length(paramsProdNuvemshop.params) > 0, ' - Filtro por ' + paramsProdNuvemshop.tipo);

    if (pTipo = 'S') or (pTipo = 'A') then
      if viewProdutoHw.Count > 0 then
        pn_produto_hw_top.Caption   := 'Lista de Produtos do Sistema ' + paramsProdHw.tipo;

    if (pTipo = 'E') or (pTipo = 'A') then
      viewProduto.prepare_loop_done();
    if (pTipo = 'S') or (pTipo = 'A') then
      viewProdutoHw.prepare_loop_done();
  end;
end;

procedure TFrmNuvemshopCadastros.ResolverFiltroProdutosNuvemshop;
begin
  pn_produto_tray_top.Caption := 'Lista de Produtos do E-commerce - [ Sem registros ]';

  viewProduto.prepare_loop();
  try
    viewProduto.DataSet.EmptyDataSet;
    viewProduto.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TProductHw>(servico.ResolverProdutos(produtos, categorias), viewProduto.DataSet));

  finally
    bt_produto_vinc.Enabled          := (viewProduto.Count > 0) and (viewProdutoHw.Count > 0);
    bt_produto_vinc_remove.Enabled   := bt_produto_vinc.Enabled;
    bt_prod_pag.Enabled              := (produtos <> nil) and (servico.Registros > 0) and (servico.Registros > Length(produtos));
    bt_prod_pag_primeira.Enabled     := (bt_prod_pag.Enabled) and (servico.Pag > 1);
    bt_prod_pag_anterior.Enabled     := (bt_prod_pag.Enabled) and (servico.Pag > 1);
    bt_prod_pag_proxima.Enabled      := (bt_prod_pag.Enabled) and (servico.Pag < Ceil(servico.Registros / servico.Limit));
    bt_prod_pag_ultima.Enabled       := (bt_prod_pag.Enabled) and (servico.Pag < Ceil(servico.Registros / servico.Limit));
    bt_produto_link.Enabled          := viewProduto.Count > 0;
    bt_produto_imagens_tray.Enabled  := viewProduto.Count > 0;
    bt_produto_variacao_tray.Enabled := viewProduto.Count > 0;

    if bt_prod_pag.Enabled then
    begin
      if (servico.Pag = 1) and (Ceil(servico.Registros / servico.Limit) < 1) then
        bt_prod_pag.Caption := Format('Pag %d de %d', [servico.Pag, 1])
      else
        bt_prod_pag.Caption := Format('Pag %d de %d', [servico.Pag,
           Ceil(servico.Registros / servico.Limit)]);
    end
    else
      bt_prod_pag.Caption := '';

    if bt_prod_pag.Enabled then//(consultaProd <> nil) and (consultaProd.paging <> nil) then
      bt_prod_pag.Caption := Format('%d reg de %d', [Length(produtos), servico.Registros]) +
                             IfThen(bt_prod_pag.Caption <> '', sLineBreak + bt_prod_pag.Caption)
    else
      bt_prod_pag.Caption := Format('%d registro%s', [Length(produtos), IfThen(Length(produtos) > 1, 's')]) +
                             IfThen(bt_prod_pag.Caption <> '', sLineBreak + bt_prod_pag.Caption);

    if viewProduto.Count > 0 then
      pn_produto_tray_top.Caption := 'Lista de Produtos do E-commerce' + IfThen(Length(paramsProdNuvemshop.params) > 0, ' - Filtro por ' + paramsProdNuvemshop.tipo);

    viewProduto.prepare_loop_done();
  end;
end;

procedure TFrmNuvemshopCadastros.ResolverFiltroVariacoes(idproduto: Integer;
  tipoec: string; tipoec1: string;
  tipoerp: string; tipoerp1: string);
var
  variant: TVariant;
//  sku: TSku;
  I: Integer;
begin
  pn_variacoes_produto_tray_top.Caption := 'Lista de Variações / Grades do Produto do E-commerce - [ Sem registros ]';
  pn_variacoes_produto_hw_top.Caption   := 'Lista de Variações / Grades do Produto do Sistema - [ Sem registros ]';

  if dbAllVariants = nil then
    Exit;

  if not dbAllVariants.Active then
    Exit;

  viewVariant.prepare_loop();
  viewVariantHw.prepare_loop();
  try
    viewVariant.DataSet.EmptyDataSet;
    viewVariantHw.DataSet.EmptyDataSet;

    viewVariant.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TVariantHw2>(servico.ResolverVariacoes(variants, tipoec, tipoec1), viewVariant.DataSet));
    viewVariantHw.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TVariantHw2>(servico.ResolverVariacoesHw(variants, tipoerp, tipoerp1), viewVariantHw.DataSet));

  finally
    bt_variacoes_produtos_cad.Enabled  := (viewVariant.Count > 0);
    bt_variacoes_produtos_adc.Enabled  := (viewVariant.Count > 0) or (viewVariantHw.Count > 0);

    if viewVariant.Count > 0 then
      pn_variacoes_produto_tray_top.Caption := 'Lista de Variações / Grades do Produto do E-commerce';
    if viewVariantHw.Count > 0 then
      pn_variacoes_produto_hw_top.Caption   := 'Lista de Variações / Grades do Produto do Sistema';

    viewVariant.prepare_loop_done();
    viewVariantHw.prepare_loop_done();
  end;
end;

function TFrmNuvemshopCadastros.retornaKiloBytes(ValorAtual: real): string;
var
  resultado : real;
begin
  resultado := ((ValorAtual / 1024) / 1024);
  Result    := FormatFloat('0.000 KBs', resultado);
end;

function TFrmNuvemshopCadastros.retornaPorcentagem(ValorMaximo,
  ValorAtual: real): string;
var
  resultado: Real;
begin
  resultado := ((ValorAtual * 100) / ValorMaximo);
  Result    := FormatFloat('0%', resultado);
end;

procedure TFrmNuvemshopCadastros.VincularProdutos;
var
  Id: Integer;
  vTodasGradesAdc: boolean;
  produto: TProduct;
begin
  vTodasGradesAdc := true;

  viewVariantHw.DataSet.First;
  while viewVariantHw.DataSet.Eof do
  begin
     if viewVariantHw.DataSet.FieldByName('gr_adicionadas').AsInteger <> 1 then
     begin
       vTodasGradesAdc := false;
       Break;
     end;

    viewVariantHw.DataSet.Next;
  end;

  if (vTodasGradesAdc)
    and (viewProduto.fint('grupo_prod') <= 0)
    and (viewProdutoHw.fint('id_commerce') <= 0) then
  begin
    if Trim(viewProduto.DataSet.FieldByName('sel').AsString) <> 'S' then
    begin
      viewProduto.DataSet.Edit;
      viewProduto.DataSet.FieldByName('sel').AsString := 'S';
      viewProduto.DataSet.Post;
    end;

    try
      Id := viewProduto.fInt('id');
      if viewProduto.prepare_loop('sel = ''S''').Count > 1 then
      begin
        ShowAtencao('Selecione 1 registro de cada vez para vincular');
        Exit;
      end
      else if viewProduto.Count = 1 then
        Id := viewProduto.fInt('id');

    finally
      viewProduto.prepare_loop_done();
    end;

    for produto in produtos do
      if produto.id = Id then
        Break;

    if (servico.VincularProduto(produto,
      viewProdutoHw.fint('grupo_prod'),
      viewProdutoHw.fstr('cod_prod'),
      viewProdutoHw.ffloat('altura_prod'),
      viewProdutoHw.ffloat('comprimento_prod'),
      viewProdutoHw.ffloat('largura_prod'),
      viewProdutoHw.ffloat('peso_brut_prod'),
      viewProdutoHw.ffloat('peso_liq_prod'))) then
        ConsultaProdutoHw('');
  end;
end;

procedure TFrmNuvemshopCadastros._GravaConfiguracoesInteger(
  NomeVariavel: string; Valor: Integer);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteInteger(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TFrmNuvemshopCadastros._LerConfiguracoesRegistroInteger(
  NomeVariavel: string; Adefault: Integer): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  try
    vTemp := Adefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadInteger(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

end.
