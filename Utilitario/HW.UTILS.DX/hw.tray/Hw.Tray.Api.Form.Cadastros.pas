unit Hw.Tray.Api.Form.Cadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  uClasseConexao,
  Hw.Tray.Servicos,
  Hw.Tray.Api.Rest,
  Hw.Tray.Api.Brand,
  HW.Tray.Api.Category,
  HW.Tray.Api.Property_,
  HW.Tray.Api.Variant,
  HW.Tray.Api.Product,
  Hw.Tray.Api.Kit,
  Vcl.Mask,
  Vcl.OleCtrls,
  SHDocVw, Vcl.DBCtrls, IdComponent, IdAntiFreezeBase, IdAntiFreeze,
  IdBaseComponent, IdTCPConnection, IdTCPClient, IdHTTP;

const
  COLUMN_SIZE_ID = 64;
  COLUMN_SIZE_SHORT = 175;
  COLUMN_SIZE_STRING = 250;
  COLUMN_SIZE_LONGSTRING = 550;

type
  RParamsTray = record
    params: TArray<string>;
    tipo: string;
  end;

  RParamsHw = record
    onlySinc: Boolean;
    tipo: string;
    campo, condicao, texto: string;
  end;

  TFrmTrayCadastros = class(TForm)
    pn_principal: TPanel;
    pg_principal: TPageControl;
    ts_produtos: TTabSheet;
    ts_marcas: TTabSheet;
    ts_categorias: TTabSheet;
    sc_categorias: TScrollBox;
    pn_categ_top: TPanel;
    bt_categ_consulta_demanda: TBitBtn;
    pn_categ_grid_tray: TPanel;
    grid_categ_tray: TDBGrid;
    sc_marcas: TScrollBox;
    pn_marca_top: TPanel;
    bt_marca_consulta_demanda: TBitBtn;
    pn_marca_grid: TPanel;
    grid_marca: TDBGrid;
    ts_log: TTabSheet;
    ed_log: TMemo;
    ts_db_marcas: TTabSheet;
    pn_db_marcas: TPanel;
    ts_db_categorias: TTabSheet;
    ts_db_produtos: TTabSheet;
    pn_db_marcas_top: TPanel;
    pn_db_grid_marcas: TPanel;
    pn_db_marcas_bottom: TPanel;
    bt_marca_vinc_confirmar: TBitBtn;
    bt_marca_vinc_voltar: TBitBtn;
    grid_db_marca: TDBGrid;
    pn_db_categ: TPanel;
    pn_db_categ_top: TPanel;
    pn_db_grid_categ: TPanel;
    grid_db_categ: TDBGrid;
    pn_db_categ_bottom: TPanel;
    bt_categ_vinc_confirmar: TBitBtn;
    bt_categ_vinc_voltar: TBitBtn;
    pn_categ_grid_hw: TPanel;
    SplitterCateg: TSplitter;
    grid_categ_hw: TDBGrid;
    bt_categ_cad: TBitBtn;
    bt_sair_categ: TBitBtn;
    pn_categ_tray_top: TPanel;
    pn_categ_hw_top: TPanel;
    bt_marca_cad: TBitBtn;
    bt_sair_marca: TBitBtn;
    SplitterMarca: TSplitter;
    pn_marca_grid_hw: TPanel;
    grid_marca_hw: TDBGrid;
    pn_marca_hw_top: TPanel;
    pn_marca_tray_top: TPanel;
    bt_marca_vinc: TSpeedButton;
    bt_marca_vinc_remove: TSpeedButton;
    bt_marca_check_all: TSpeedButton;
    bt_marca_uncheck_all: TSpeedButton;
    bt_categ_check_all: TSpeedButton;
    bt_categ_uncheck_all: TSpeedButton;
    bt_categ_vinc: TSpeedButton;
    bt_categ_vinc_remove: TSpeedButton;
    sc_produtos: TScrollBox;
    pn_produto_top: TPanel;
    bt_produto_consulta_todos: TBitBtn;
    pn_db_produtos: TPanel;
    pn_db_produtos_top: TPanel;
    pn_db_grid_produtos: TPanel;
    grid_db_produto: TDBGrid;
    pn_db_produtos_bottom: TPanel;
    bt_produtos_conf: TBitBtn;
    bt_produtos_voltar: TBitBtn;
    bt_marca_produtos: TSpeedButton;
    SpeedButton1: TSpeedButton;
    bt_categ_produtos: TSpeedButton;
    ts_grades: TTabSheet;
    sc_grade: TScrollBox;
    spliterGrade: TSplitter;
    pn_grade_top: TPanel;
    bt_grade_consulta: TBitBtn;
    bt_grade_cad: TBitBtn;
    bt_grade_sair: TBitBtn;
    pn_grade_grid: TPanel;
    pn_grade_grid_hw: TPanel;
    grid_grade_hw: TDBGrid;
    pn_grade_hw_top: TPanel;
    bt_sair_produto: TBitBtn;
    pn_prod_grid_hw: TPanel;
    grid_produto_hw: TDBGrid;
    pn_produto_hw_top: TPanel;
    pn_prod_grid: TPanel;
    pn_produto_tray_top: TPanel;
    bt_produto_link: TSpeedButton;
    bt_produto_goto_sistema: TSpeedButton;
    bt_produto_imagens_tray: TSpeedButton;
    bt_grade_vinc1: TSpeedButton;
    bt_grade_vinc1_remove: TSpeedButton;
    bt_grade_vinc2: TSpeedButton;
    bt_grade_vinc2_remove: TSpeedButton;
    pn_produto_hw_consulta: TPanel;
    cb_campo_cons_produto: TComboBox;
    bt_produtocons_consulta_produto: TBitBtn;
    me_texto_cons_produto: TMaskEdit;
    cb_cond_cons_produto: TComboBox;
    lbCampoProduto: TLabel;
    lbCondicaoProduto: TLabel;
    lbConteudoProduto: TLabel;
    bt_prod_pag: TSpeedButton;
    bt_prod_pag_anterior: TSpeedButton;
    bt_prod_pag_proxima: TSpeedButton;
    bt_prod_pag_primeira: TSpeedButton;
    bt_prod_pag_ultima: TSpeedButton;
    bt_produto_consulta_demanda: TBitBtn;
    bt_produto_vinc: TSpeedButton;
    bt_produto_vinc_remove: TSpeedButton;
    grid_produto: TDBGrid;
    Label1: TLabel;
    bt_produto_cons_ec: TSpeedButton;
    bt_produto_cons_ec_vinc: TSpeedButton;
    bt_produto_cons_hab: TSpeedButton;
    ck_grade_dupla: TCheckBox;
    pn_grid_grade_simples: TPanel;
    grid_grade: TDBGrid;
    pn_grade_tray_top: TPanel;
    bt_grade_check_all: TSpeedButton;
    bt_grade_uncheck_all: TSpeedButton;
    pn_grade_grid_dupla: TPanel;
    grid_grade_dupla: TDBGrid;
    pn_grade_tray_top_dupla: TPanel;
    bt_grade_check_all_dupla: TSpeedButton;
    bt_grade_uncheck_all_dupla: TSpeedButton;
    spliter_grade_dupla: TSplitter;
    ts_browser: TTabSheet;
    Web: TWebBrowser;
    bt_produto_goto_tray: TSpeedButton;
    bt_produto_imagens_hw: TSpeedButton;
    pn_img_produto_top: TPanel;
    ts_grades_variacao_prod: TTabSheet;
    sc_variacoes_produtos: TScrollBox;
    SplitterVariacaoGrade: TSplitter;
    pn_varicao_grade_grid_tray: TPanel;
    grid_variacoes_produto_tray: TDBGrid;
    pn_variacoes_produto_tray_top: TPanel;
    pn_variacao_grade_grid_hw: TPanel;
    grid_variacoes_produto_hw: TDBGrid;
    pn_variacoes_produto_hw_top: TPanel;
    bt_produto_variacao_tray: TSpeedButton;
    groupbox_varicoes_produtos: TGroupBox;
    DBTextDesrTrayProduto: TDBText;
    lbCodProdTrayProduto: TLabel;
    DBTextIdTrayProduto: TDBText;
    imgInformation: TImage;
    imgInformation2: TImage;
    imgInformation3: TImage;
    imgInformation4: TImage;
    groupbox_img_produto: TGroupBox;
    DBTextDesrTray2: TDBText;
    lbCodProdTray2: TLabel;
    DBTextIdTray2: TDBText;
    Image1: TImage;
    bt_voltar_img_produto: TBitBtn;
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
    ts_kitprodutos: TTabSheet;
    sc_kitprodutos: TScrollBox;
    pn_kitsproduto_top: TPanel;
    Image2: TImage;
    bt_kitsproduto_consulta_todos: TBitBtn;
    bt_sair_kitsproduto: TBitBtn;
    bt_kitsproduto_consulta_demanda: TBitBtn;
    pn_kitprod_grid_hw: TPanel;
    grid_kitproduto_hw: TDBGrid;
    pn_kitproduto_hw_top: TPanel;
    bt_kitproduto_vinc: TSpeedButton;
    bt_kitproduto_vinc_remove: TSpeedButton;
    Label2: TLabel;
    bt_kitproduto_cons_ec: TSpeedButton;
    bt_kitproduto_cons_ec_vinc: TSpeedButton;
    bt_kitproduto_cons_hab: TSpeedButton;
    bt_kitproduto_goto_tray: TSpeedButton;
    bt_kitproduto_imagens_hw: TSpeedButton;
    pn_kitproduto_hw_consulta: TPanel;
    lbCampoKitProduto: TLabel;
    lbCondicaoKitProduto: TLabel;
    lbConteudoKitProduto: TLabel;
    cb_campo_cons_kitproduto: TComboBox;
    bt_kitsprodutocons_consulta_kitproduto: TBitBtn;
    me_texto_cons_kitproduto: TMaskEdit;
    cb_cond_cons_kitproduto: TComboBox;
    pn_kitprod_grid: TPanel;
    pn_kitproduto_tray_top: TPanel;
    bt_kitproduto_link: TSpeedButton;
    bt_kitproduto_goto_sistema: TSpeedButton;
    bt_kitproduto_imagens_tray: TSpeedButton;
    bt_kitprod_pag: TSpeedButton;
    bt_kitprod_pag_ultima: TSpeedButton;
    bt_kitprod_pag_anterior: TSpeedButton;
    bt_kitprod_pag_proxima: TSpeedButton;
    bt_kitprod_pag_primeira: TSpeedButton;
    grid_kitproduto: TDBGrid;
    bt_kitproduto_produtos: TSpeedButton;
    ts_db_kitprodutos: TTabSheet;
    pn_db_kitprodutos: TPanel;
    pn_db_kitprodutos_top: TPanel;
    pn_db_grid_kitprodutos: TPanel;
    grid_db_kitproduto: TDBGrid;
    pn_db_kitprodutos_bottom: TPanel;
    bt_kitprodutos_conf: TBitBtn;
    bt_kitprodutos_voltar: TBitBtn;
    ts_kits_produto_prod: TTabSheet;
    sc_produtos_kitprodutos: TScrollBox;
    SplitterProdKit: TSplitter;
    Panel4: TPanel;
    grid_produtos_kitproduto_tray: TDBGrid;
    pn_produtos_kitproduto_tray_top: TPanel;
    bt_produtos_kitprodutos_cad: TBitBtn;
    Panel10: TPanel;
    grid_produtos_kitproduto_hw: TDBGrid;
    pn_produtos_kitproduto_hw_top: TPanel;
    groupbox_produtos_kitprodutos: TGroupBox;
    DBTextDesrTrayKitProduto: TDBText;
    lbCodProdTrayKitProduto: TLabel;
    DBTextIdTrayKitProduto: TDBText;
    imgInformation6: TImage;
    bt_produtos_kitprodutos_voltar: TBitBtn;
    bt_produtokit_vinc: TSpeedButton;
    bt_produtokit_vinc_remove: TSpeedButton;
    bt_produtokit_goto_tray: TSpeedButton;
    pn_variacoes_produto_top: TPanel;
    bt_variacoes_produtos_cad: TBitBtn;
    bt_variacoes_produto_check_alll: TSpeedButton;
    bt_variacoes_produto_uncheck_all: TSpeedButton;
    bt_varicoes_produtos_voltar: TBitBtn;
    imgInformation5: TImage;
    bt_variacoes_produtos_adc: TBitBtn;
    groupbox_varicoes_produtoshw: TGroupBox;
    DBTextDesrProdutoHw: TDBText;
    Label3: TLabel;
    DBTextGrupoProdutoHw: TDBText;
    Label4: TLabel;
    DBTextCodigoProdutoHw: TDBText;
    ts_Imagens: TTabSheet;
    pnImagens: TPanel;
    Panel2: TPanel;
    RadioGroupOpcao: TRadioGroup;
    Panel8: TPanel;
    bitbtn_Imagens_confirmar: TBitBtn;
    bitbtn_Imagens_fechar: TBitBtn;
    pnDetImg: TPanel;
    lbQtdeImagem: TLabel;
    lblStatus: TLabel;
    lblDownloadEm: TLabel;
    Label5: TLabel;
    pbprogresso: TProgressBar;
    IdHTTP: TIdHTTP;
    IdAntiFreeze: TIdAntiFreeze;
    pnProdSemVincEC: TPanel;
    pnProdSemVincERP: TPanel;
    pnKitSemVincERP: TPanel;
    Panel11: TPanel;
    pnCatSemVincEC: TPanel;
    pnCatSemVincERP: TPanel;
    pnMarcaSemVincERP: TPanel;
    pnMarcaSemVincEC: TPanel;
    bt_marca_pag_primeira: TSpeedButton;
    bt_marca_pag_anterior: TSpeedButton;
    bt_marca_pag: TSpeedButton;
    bt_marca_pag_proxima: TSpeedButton;
    bt_marca_pag_ultima: TSpeedButton;
    bt_marca_consulta_todos: TBitBtn;
    bt_categ_consulta_todos: TBitBtn;
    bt_categ_pag_primeira: TSpeedButton;
    bt_categ_pag_anterior: TSpeedButton;
    bt_categ_pag: TSpeedButton;
    bt_categ_pag_proxima: TSpeedButton;
    bt_categ_pag_ultima: TSpeedButton;
    pn_marca_hw_consulta: TPanel;
    lbCampoMarca: TLabel;
    lbCondicaoMarca: TLabel;
    lbConteudoMarca: TLabel;
    cb_campo_cons_marca: TComboBox;
    bt_kitsprodutocons_consulta_marca: TBitBtn;
    me_texto_cons_marca: TMaskEdit;
    cb_cond_cons_marca: TComboBox;
    bt_marca_cons_hab: TSpeedButton;
    pn_categoria_hw_consulta: TPanel;
    lbCampoCategoria: TLabel;
    lbCondicaoCategoria: TLabel;
    lbConteudoCategoria: TLabel;
    cb_campo_cons_categoria: TComboBox;
    bt_kitsprodutocons_consulta_categoria: TBitBtn;
    me_texto_cons_categoria: TMaskEdit;
    cb_cond_cons_categoria: TComboBox;
    bt_categoria_cons_hab: TSpeedButton;
    bt_marca_cons_ec_vinc: TSpeedButton;
    bt_marca_cons_ec: TSpeedButton;
    bt_categoria_cons_ec_vinc: TSpeedButton;
    bt_categoria_cons_ec: TSpeedButton;
    bt_produtokit_goto_sistema: TSpeedButton;
    bt_marca_goto_sistema: TSpeedButton;
    bt_marca_goto_tray: TSpeedButton;
    bt_categ_goto_sistema: TSpeedButton;
    bt_categ_goto_tray: TSpeedButton;
    SplitterProd: TSplitter;
    SplitterKitProd: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_categ_consulta_demandaClick(Sender: TObject);
    procedure bt_marca_consulta_demandaClick(Sender: TObject);
    procedure rb_marca_semvincClick(Sender: TObject);
    procedure bt_marca_cadClick(Sender: TObject);
    procedure bt_marca_vinc_voltarClick(Sender: TObject);
    procedure bt_marca_vinc_confirmarClick(Sender: TObject);
    procedure bt_categ_cadClick(Sender: TObject);
    procedure rb_categ_todasClick(Sender: TObject);
    procedure bt_sair_marcaClick(Sender: TObject);
    procedure bt_categ_vinc_confirmarClick(Sender: TObject);
    procedure bt_categ_vinc_voltarClick(Sender: TObject);
    procedure grid_categ_trayDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_marca_vincClick(Sender: TObject);
    procedure bt_marca_vinc_removeClick(Sender: TObject);
    procedure bt_marca_check_allClick(Sender: TObject);
    procedure bt_marca_uncheck_allClick(Sender: TObject);
    procedure bt_categ_vincClick(Sender: TObject);
    procedure bt_categ_vinc_removeClick(Sender: TObject);
    procedure bt_categ_check_allClick(Sender: TObject);
    procedure bt_categ_uncheck_allClick(Sender: TObject);
    procedure bt_produto_consulta_todosClick(Sender: TObject);
    procedure rb_produto_vincClick(Sender: TObject);
    procedure bt_produtos_confClick(Sender: TObject);
    procedure bt_marca_produtosClick(Sender: TObject);
    procedure bt_categ_produtosClick(Sender: TObject);
    procedure bt_grade_consultaClick(Sender: TObject);
    procedure bt_sair_produtoClick(Sender: TObject);
    procedure bt_produto_vincClick(Sender: TObject);
    procedure bt_produto_vinc_removeClick(Sender: TObject);
    procedure bt_grade_cadClick(Sender: TObject);
    procedure bt_grade_check_allClick(Sender: TObject);
    procedure bt_grade_uncheck_allClick(Sender: TObject);
    procedure bt_grade_vinc1Click(Sender: TObject);
    procedure bt_grade_vinc1_removeClick(Sender: TObject);
    procedure bt_produtocons_consulta_produtoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bt_prod_pagClick(Sender: TObject);
    procedure bt_prod_pag_anteriorClick(Sender: TObject);
    procedure bt_prod_pag_ultimaClick(Sender: TObject);
    procedure bt_prod_pag_proximaClick(Sender: TObject);
    procedure bt_produto_consulta_demandaClick(Sender: TObject);
    procedure bt_produto_cons_ecClick(Sender: TObject);
    procedure grid_produtoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grid_produto_hwDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_produto_cons_habClick(Sender: TObject);
    procedure bt_prod_pag_primeiraClick(Sender: TObject);
    procedure ck_grade_duplaClick(Sender: TObject);
    procedure bt_grade_check_all_duplaClick(Sender: TObject);
    procedure bt_grade_uncheck_all_duplaClick(Sender: TObject);
    procedure bt_produto_linkClick(Sender: TObject);
    procedure bt_produto_imagens_trayClick(Sender: TObject);
    procedure bt_produto_goto_trayClick(Sender: TObject);
    procedure bt_produto_goto_sistemaClick(Sender: TObject);
    procedure bt_produto_imagens_hwClick(Sender: TObject);
    procedure bt_sair_categClick(Sender: TObject);
    procedure bt_voltar_img_produtoClick(Sender: TObject);
    procedure bt_varicoes_produtos_voltarClick(Sender: TObject);
    procedure bt_produto_variacao_trayClick(Sender: TObject);
    procedure bt_variacoes_produtos_cadClick(Sender: TObject);
    procedure bt_varicoes_produtos_cadClick(Sender: TObject);
    procedure grid_variacoes_produto_hwDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure bt_reenviar_img_produtoClick(Sender: TObject);
    procedure bt_gerarurlereenviar_img_produtoClick(Sender: TObject);
    procedure bt_kitsproduto_consulta_demandaClick(Sender: TObject);
    procedure bt_kitprod_pag_primeiraClick(Sender: TObject);
    procedure bt_kitprod_pag_anteriorClick(Sender: TObject);
    procedure bt_kitprod_pagClick(Sender: TObject);
    procedure bt_kitprod_pag_proximaClick(Sender: TObject);
    procedure bt_kitprod_pag_ultimaClick(Sender: TObject);
    procedure bt_kitproduto_cons_ecClick(Sender: TObject);
    procedure bt_kitproduto_cons_habClick(Sender: TObject);
    procedure bt_kitproduto_vincClick(Sender: TObject);
    procedure bt_kitprodutos_confClick(Sender: TObject);
    procedure bt_kitprodutos_voltarClick(Sender: TObject);
    procedure bt_produtos_voltarClick(Sender: TObject);
    procedure bt_produtos_kitprodutos_voltarClick(Sender: TObject);
    procedure bt_kitsprodutocons_consulta_kitprodutoClick(Sender: TObject);
    procedure bt_kitproduto_linkClick(Sender: TObject);
    procedure bt_kitproduto_goto_sistemaClick(Sender: TObject);
    procedure bt_kitproduto_imagens_trayClick(Sender: TObject);
    procedure bt_kitproduto_vinc_removeClick(Sender: TObject);
    procedure bt_kitproduto_imagens_hwClick(Sender: TObject);
    procedure bt_kitproduto_goto_trayClick(Sender: TObject);
    procedure bt_kitproduto_produtosClick(Sender: TObject);
    procedure bt_produtokit_vincClick(Sender: TObject);
    procedure bt_produtokit_vinc_removeClick(Sender: TObject);
    procedure grid_produtos_kitproduto_trayDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grid_produtos_kitproduto_hwDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure marcaDesmacarLinhaProduto;
    procedure marcaDesmacarLinhaKitProduto;
    procedure marcaDesmacarLinhaProdKitProduto;
    procedure grid_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_kitprodutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_produtos_kitproduto_trayKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure grid_produtos_kitproduto_trayCellClick(Column: TColumn);
    procedure grid_kitprodutoCellClick(Column: TColumn);
    procedure grid_produtoCellClick(Column: TColumn);
    procedure grid_kitprodutoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_produtokit_goto_trayClick(Sender: TObject);
    procedure bt_variacoes_produto_check_alllClick(Sender: TObject);
    procedure bt_variacoes_produto_uncheck_allClick(Sender: TObject);
    procedure grid_variacoes_produto_trayDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure bt_variacoes_produtos_adcClick(Sender: TObject);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure bitbtn_Imagens_confirmarClick(Sender: TObject);
    procedure bitbtn_Imagens_fecharClick(Sender: TObject);
    procedure grid_kitproduto_hwDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grid_marcaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grid_marca_hwDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grid_categ_hwDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grid_gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grid_grade_duplaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_marca_consulta_todosClick(Sender: TObject);
    procedure bt_marca_pag_primeiraClick(Sender: TObject);
    procedure bt_marca_pag_anteriorClick(Sender: TObject);
    procedure bt_marca_pagClick(Sender: TObject);
    procedure bt_marca_pag_proximaClick(Sender: TObject);
    procedure bt_marca_pag_ultimaClick(Sender: TObject);
    procedure bt_categ_pag_primeiraClick(Sender: TObject);
    procedure bt_categ_consulta_todosClick(Sender: TObject);
    procedure bt_categ_pag_anteriorClick(Sender: TObject);
    procedure bt_categ_pagClick(Sender: TObject);
    procedure bt_categ_pag_proximaClick(Sender: TObject);
    procedure bt_categ_pag_ultimaClick(Sender: TObject);
    procedure bt_kitsprodutocons_consulta_marcaClick(Sender: TObject);
    procedure bt_marca_cons_habClick(Sender: TObject);
    procedure bt_categoria_cons_habClick(Sender: TObject);
    procedure bt_kitsprodutocons_consulta_categoriaClick(Sender: TObject);
    procedure bt_marca_cons_ecClick(Sender: TObject);
    procedure bt_categoria_cons_ecClick(Sender: TObject);
    procedure bt_kitsproduto_consulta_todosClick(Sender: TObject);
    procedure bt_produtokit_goto_sistemaClick(Sender: TObject);
    procedure bt_marca_goto_sistemaClick(Sender: TObject);
    procedure bt_marca_goto_trayClick(Sender: TObject);
    procedure bt_categ_goto_sistemaClick(Sender: TObject);
    procedure bt_categ_goto_trayClick(Sender: TObject);
  private
    FCodEmpresa: Integer;
    FDataBasePath: string;
    FGrupoProd: Integer;
    FCodProd: string;

    servico: THwTrayServicos;

    //grades
    consultaGrade      : TTrayConsulta;
    paramsGradeTray    : RParamsTray;
    grade              : TArray<TPropertyWithValueHw>;
    grades             : TArray<TPropertyWithValueHw>;
    viewGrade          : TConexao_OOP;
    viewGradeDu        : TConexao_OOP;
    viewGradeHw        : TConexao_OOP;
    dbAllGrades        : TConexao_OOP;

    //variant
    consultaVariacao   : TTrayConsulta;
    paramsVariacaoTray : RParamsTray;
    variants           : TArray<TVariant>;
    viewVariant        : TConexao_OOP;
    viewVariantHw      : TConexao_OOP;
    dbAllVariants      : TConexao_OOP;

    //produtos
    paramsProdTray     : RParamsTray;
    paramsProdHw       : RParamsHw;
    consultaProd       : TTrayConsulta;
    produtos           : TArray<TProduct>;
    viewProduto        : TConexao_OOP;
    viewProdutoHw      : TConexao_OOP;
    dbAllProdutos      : TConexao_OOP;

    //kitprodutos
    paramsKitProdTray  : RParamsTray;
    paramsKitProdHw    : RParamsHw;
    consultaKitProd    : TTrayConsulta;
    kitprodutos        : TArray<TProduct>;
    viewKitProduto     : TConexao_OOP;
    viewKitProdutoHw   : TConexao_OOP;
    dbAllKitProdutos   : TConexao_OOP;

    //marcas
    paramsMarcaTray    : RParamsTray;
    paramsMarcaHw      : RParamsHw;
    consultaMarca      : TTrayConsulta;
    marcas             : TArray<TBrand>;
    viewMarca          : TConexao_OOP;
    viewMarcaHw        : TConexao_OOP;
    dbAllMarcas        : TConexao_OOP;

    //categorias
    paramsCategoriaTray: RParamsTray;
    paramsCategoriaHw  : RParamsHw;
    consultaCategoria  : TTrayConsulta;
    categorias         : TArray<TCategory>;
    viewCategoria      : TConexao_OOP;
    viewCategoriaHw    : TConexao_OOP;
    dbAllCategorias    : TConexao_OOP;

    //productkits
    consultaProdutosKit: TTrayConsulta;
    productskit        : TArray<TProductKit>;
    viewProductKit     : TConexao_OOP;
    viewProductKitHw   : TConexao_OOP;
    dbAllProductsKit   : TConexao_OOP;


    FUsuario: string;

    procedure Log(Text: string);
    procedure InitGridColumns(Index: Integer; grid: TDBGrid; client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string; alignment: TAlignment);
    procedure InitGridColumnsR(Index: Integer; grid: TDBGrid; client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string = '');
    procedure InitGridColumnsL(Index: Integer; grid: TDBGrid; client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string = '');
    procedure InitGridColumnsC(Index: Integer; grid: TDBGrid; client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string = '');

    procedure ResolverFiltroGrades;

    procedure ResolverFiltroVariacoes(idproduto: Integer;
      tipoec: string; tipoec1: string;
      tipoerp: string; tipoerp1: string);

    procedure ResolverFiltroProdutosKit;
    procedure VincularProdutos;

    procedure ResolverFiltroProdutos(pTipo: string = 'A');
    procedure ResolverFiltroProdutosTray();
    procedure ConsultaProdutoTray(all: Boolean; pag: Integer; pIds: string); overload;
    procedure ConsultaProdutoTray(pag: Integer = 1); overload;
    procedure ConsultaProdutoHw(pIds: string);

    procedure ResolverFiltroKitProdutos(pTipo: string = 'A');
    procedure ResolverFiltroKitProdutosTray();
    procedure ResolverFiltroKitProdutosHw();
    procedure ConsultaKitProdutoTray(all: Boolean; pag: Integer; pIds: string); overload;
    procedure ConsultaKitProdutoTray(pag: Integer = 1); overload;
    procedure ConsultaKitProdutoHw();

    procedure ResolverFiltroMarcas(pTipo: string = 'A');
    procedure ResolverFiltroMarcasTray();
    procedure ConsultaMarcaTray(all: Boolean; pag: Integer; pIds: string); overload;
    procedure ConsultaMarcaTray(pag: Integer = 1); overload;
    procedure ConsultaMarcaHw(pIds: string);

    procedure ResolverFiltroCategorias(pTipo: string = 'A');
    procedure ResolverFiltroCategoriasTray();
    procedure ConsultaCategoriaTray(all: Boolean; pag: Integer; pIds: string); overload;
    procedure ConsultaCategoriaTray(pag: Integer = 1); overload;
    procedure ConsultaCategoriaHw(pIds: string);

    procedure ExibirImagensProduto(produto: TProductHw);
    procedure ExibirImagensKitProduto(kitproduto: TKitsProdHw);

    function retornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    function retornaKiloBytes(ValorAtual: real): string;

    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; Adefault: Integer = 0) : Integer;
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);
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
  FrmTrayCadastros: TFrmTrayCadastros;

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
  HW.Tray.Api.Url,
  HW.Tray.Api.Image,
//  HW.Tray.Api.Variant,
  System.Generics.Collections, System.Win.Registry;

{$R *.dfm}

procedure TFrmTrayCadastros.bt_marca_check_allClick(Sender: TObject);
begin
  viewMarca.CheckUnCheckAllRows(True);
end;

procedure TFrmTrayCadastros.bt_marca_uncheck_allClick(Sender: TObject);
begin
  viewMarca.CheckUnCheckAllRows(False);
end;

procedure TFrmTrayCadastros.bt_marca_cadClick(Sender: TObject);
var
  marca: TBrand;
  marcasCad: TArray<TBrand>;
  recno: Integer;
  Id: string;
begin

  if not grid_marca.Visible then
    Exit;

  if viewMarca.IsEmpty then
  begin
    ShowAtencao('Sem marcas para cadastrar');
    Exit;
  end;

  Id := viewMarca.fstr('id');
  viewMarca.prepare_loop('sel = ''S''');
  if viewMarca.IsEmpty then
  begin
    ShowAtencao('Nenhuma marca selecionada');
    Exit;
  end;

  try
    if viewMarca.IsEmpty then
      viewMarca.filterStr('id = %s', [Id.QuotedString]);

    marcasCad := [];
    while not viewMarca.DataSet.Eof do
    begin
      for marca in marcas do
        if viewMarca.fstr('id').Equals(marca.id.Trim) then
          marcasCad := marcasCad + [marca];
      viewMarca.DataSet.Next;
    end;

    with servico.Auditor.Inserir.Table(tbMarca).Processo('PRO388') do
      if not Permitido then
        Exit;

    if Length(marcasCad) > 0 then
      if servico.CadastrarMarca(marcasCad) then
        if paramsMarcaTray.tipo = 'Demanda' then
          bt_marca_consulta_demandaClick(Sender)
        else
          bt_marca_consulta_todosClick(Sender);


  finally
    viewMarca.prepare_loop_done();
    ResolverFiltroMarcas;
  end;
end;

procedure TFrmTrayCadastros.bt_marca_vinc_confirmarClick(Sender: TObject);
var
  marca: TBrand;
  recno: Integer;
begin

  if not grid_marca.Visible then
    Exit;

  viewMarca.prepare_loop('sel = ''S''');
  try

    for marca in marcas do
      if viewMarca.fstr('id').Equals(marca.id.Trim) then
        if servico.VincularMarca(marca, dbAllMarcas.fint('cod_marca')) then
        begin
          if paramsMarcaTray.tipo = 'Demanda' then
            bt_marca_consulta_demandaClick(Sender)
          else
            bt_marca_consulta_todosClick(Sender);
          pg_principal.ActivePage := ts_marcas;
          Break;
        end;

  finally
    viewMarca.prepare_loop_done();
    ResolverFiltroMarcas;
  end;
end;

procedure TFrmTrayCadastros.bt_marca_vinc_voltarClick(Sender: TObject);
begin
  pg_principal.ActivePage := ts_marcas;
end;

procedure TFrmTrayCadastros.bt_sair_categClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrayCadastros.bt_sair_marcaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrayCadastros.bt_sair_produtoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrayCadastros.bt_variacoes_produtos_adcClick(Sender: TObject);
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
      if not servico.AdicionarGradeVariacao(viewVariant, GrupoProd, CodProd) then
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

procedure TFrmTrayCadastros.bt_variacoes_produtos_cadClick(Sender: TObject);
begin
  if viewVariant.IsEmpty then
  begin
    ShowAtencao('Sem variações /grades produtos do produto da Loja');
    Exit;
  end;
end;

procedure TFrmTrayCadastros.bt_variacoes_produto_check_alllClick(
  Sender: TObject);
begin
  viewVariant.CheckUnCheckAllRows(True);
end;

procedure TFrmTrayCadastros.bt_variacoes_produto_uncheck_allClick(
  Sender: TObject);
begin
  viewVariant.CheckUnCheckAllRows(False);
end;

procedure TFrmTrayCadastros.bt_varicoes_produtos_cadClick(Sender: TObject);
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
      if not servico.CadastrarGradeVariacao(viewVariant) then
        exit;

     bt_produto_variacao_trayClick(Sender);
  finally
    viewVariant.prepare_loop_done();
    bt_produto_variacao_trayClick(Sender);
//    ResolverFiltroGrades;
  end;
end;

procedure TFrmTrayCadastros.bt_varicoes_produtos_voltarClick(Sender: TObject);
begin
  ts_produtos.TabVisible     := true;
  ts_kitprodutos.TabVisible  := true;
  ts_marcas.TabVisible       := true;
  ts_categorias.TabVisible   := true;
  ts_grades.TabVisible       := true;

  pg_principal.ActivePage := ts_produtos;
end;

procedure TFrmTrayCadastros.bt_voltar_img_produtoClick(Sender: TObject);
begin
  ts_produtos.TabVisible     := true;
  ts_kitprodutos.TabVisible  := true;
  ts_marcas.TabVisible       := true;
  ts_categorias.TabVisible   := true;
  ts_grades.TabVisible       := true;

  if groupbox_img_produto.Caption = 'Kit' then
    pg_principal.ActivePage := ts_kitprodutos
  else
    pg_principal.ActivePage := ts_produtos;
end;

procedure TFrmTrayCadastros.ck_grade_duplaClick(Sender: TObject);
begin
  pn_grade_grid_dupla.Visible   := ck_grade_dupla.Checked;
  spliter_grade_dupla.Visible   := pn_grade_grid_dupla.Visible;
  bt_grade_vinc2_remove.Enabled := pn_grade_grid_dupla.Visible;
  bt_grade_vinc2.Enabled        := pn_grade_grid_dupla.Visible;
  if pn_grade_grid_dupla.Visible then
    spliter_grade_dupla.Left := -999;
end;

procedure TFrmTrayCadastros.ConsultaCategoriaHw(pIds: string);
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
  ResolverFiltroCategoriasTray();
end;

procedure TFrmTrayCadastros.ConsultaCategoriaTray(all: Boolean; pag: Integer;
  pIds: string);
var
  limit, totalPag: Integer;
  vtotalpag: Integer;
begin
  with servico.Auditor.Visualizar.Table(tbCategoria).Processo('PRO391')
    .Msg('%s Tipo %s %s', [IfThen(not all, ' Pag ' + pag.ToString), paramsCategoriaTray.tipo, System.string.Join(',', paramsCategoriaTray.params)]) do
    if not Permitido then
      Exit;

  Screen.Cursor := crHourGlass;
  sc_categorias.Enabled := False;
  try

    limit := 50;
    if trim(pIds) <> '' then
    begin
      consultaCategoria := servico.GetConsulta('categories', 'Categories', ['id=' + pIds]);

      if consultaCategoria = nil then
        Exit;

      categorias := TJsonHw.ToArrayObject<TCategory>(consultaCategoria.dadosDinamicos);
    end
    else if not all then
    begin
      consultaCategoria := servico.GetConsulta('categories', 'Categories', ['sort=name_asc', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsCategoriaTray.params);

      if consultaCategoria = nil then
        Exit;

      categorias := TJsonHw.ToArrayObject<TCategory>(consultaCategoria.dadosDinamicos);
    end
    else
    begin
      categorias := [];
      totalPag := 0;
      pag      := 1;

      bt_prod_pag.Caption := 'Página 1 de ?';

      repeat
        if totalPag > 0 then
          bt_prod_pag.Caption := Format('Página %d de %d', [pag, totalPag]);
        Application.ProcessMessages;

        consultaCategoria := servico.GetConsulta('categories', 'Categories', ['sort=name_asc', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsCategoriaTray.params);

        if consultaCategoria = nil then
          Exit;

        categorias :=  categorias + TJsonHw.ToArrayObject<TCategory>(consultaCategoria.dadosDinamicos);

        if consultaCategoria.paging = nil then
          Exit;

        totalPag := Ceil(consultaCategoria.paging.total / consultaCategoria.paging.limit);

        pag := pag + 1;
      until
        (pag > totalPag);

      consultaCategoria := nil;
    end;

    ConsultaCategoriaHw(pIds);

    ResolverFiltroCategoriasTray();

  finally
    ResolverFiltroCategorias();
    bt_categ_goto_sistema.Enabled := (viewCategoria.Count > 0) and (viewCategoriaHw.Count > 0);
    bt_categ_goto_tray.Enabled    := (viewCategoria.Count > 0) and (viewCategoriaHw.Count > 0);
    sc_categorias.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.ConsultaCategoriaTray(pag: Integer);
begin
  ConsultaCategoriaTray(False, pag, '');
end;

procedure TFrmTrayCadastros.ConsultaKitProdutoHw;
begin
  with servico.Auditor.Visualizar.Table(tbKitProduto).Processo('PRO415')
    .Msg('%s %s %s %s',[IfThen(paramsKitProdHw.campo.Equals('') , IfThen(paramsKitProdHw.onlySinc, 'Sinc', 'Dados EC'), 'Consulta'),
                                paramsKitProdHw.campo, paramsKitProdHw.condicao, paramsKitProdHw.texto]) do
    if not Permitido then
      Exit;

  if paramsKitProdHw.campo = '' then
    dbAllKitProdutos := servico.GetKitProdutos(dbAllKitProdutos, paramsKitProdHw.onlySinc)
  else
    dbAllKitProdutos := servico.GetKitProdutos(dbAllKitProdutos, paramsKitProdHw.campo, paramsKitProdHw.condicao, paramsKitProdHw.texto);

  ResolverFiltroKitProdutos('S');
  ResolverFiltroKitProdutosTray();
end;

procedure TFrmTrayCadastros.ConsultaKitProdutoTray(all: Boolean; pag: Integer; pIds: string);
var
  limit, totalPag: Integer;
  vtotalpag: Integer;
begin
  with servico.Auditor.Visualizar.Table(tbKitProduto).Processo('PRO414')
    .Msg('%s Tipo %s %s', [IfThen(not all, ' Pag ' + pag.ToString), paramsKitProdTray.tipo, System.string.Join(',', paramsKitProdTray.params)]) do
    if not Permitido then
      Exit;

  Screen.Cursor := crHourGlass;
  sc_kitprodutos.Enabled := False;
  try

    limit := 50;
    if trim(pIds) <> '' then
    begin
      consultaKitProd := servico.GetConsulta('products', 'Products', ['id=' + pIds]);

      if consultaKitProd = nil then
        Exit;

      kitprodutos := TJsonHw.ToArrayObject<TProduct>(consultaProd.dadosDinamicos);
    end
    else if not all then
    begin
      consultaKitProd := servico.GetConsulta('products', 'Products', ['sort=name_asc', 'is_kit=1', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsKitProdTray.params);

      if consultaKitProd = nil then
        Exit;

      kitprodutos := TJsonHw.ToArrayObject<TProduct>(consultaKitProd.dadosDinamicos);
    end
    else
    begin
      kitprodutos := [];
      totalPag := 0;
      pag      := 1;

      bt_kitprod_pag.Caption := 'Página 1 de ?';

      repeat
        if totalPag > 0 then
          bt_kitprod_pag.Caption := Format('Página %d de %d', [pag, totalPag]);
        Application.ProcessMessages;

        consultaKitProd := servico.GetConsulta('products', 'Products', ['sort=name_asc', 'is_kit=1', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsKitProdTray.params);

        if consultaKitProd = nil then
          Exit;

        kitprodutos :=  kitprodutos + TJsonHw.ToArrayObject<TProduct>(consultaKitProd.dadosDinamicos);

        if consultaKitProd.paging = nil then
          Exit;

        totalPag := Ceil(consultaKitProd.paging.total / consultaKitProd.paging.limit);

        pag := pag + 1;
      until
        (pag > totalPag);

      consultaKitProd := nil;
    end;

//    if (Length(kitprodutos) > 0) and (Length(categorias) = 0) then
//      bt_categ_consulta_todosClick(bt_categ_consulta_todos);

    ConsultaKitProdutoHw();

    ResolverFiltroKitProdutosTray();

  finally
    ResolverFiltroKitProdutos();
    bt_kitproduto_goto_sistema.Enabled := (viewKitProduto.Count > 0) and (viewKitProdutoHw.Count > 0);
    bt_kitproduto_goto_tray.Enabled    := (viewKitProduto.Count > 0) and (viewKitProdutoHw.Count > 0);
    sc_kitprodutos.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.ConsultaKitProdutoTray(pag: Integer);
begin
  ConsultaKitProdutoTray(False, pag, '');
end;

procedure TFrmTrayCadastros.ConsultaMarcaHw(pIds: string);
begin
  with servico.Auditor.Visualizar.Table(tbMarca).Processo('PRO387')
    .Msg('%s %s %s %s',[IfThen(paramsMarcaHw.campo.Equals('') , IfThen(paramsMarcaHw.onlySinc, 'Sinc', 'Dados EC'), 'Consulta'),
                                paramsMarcaHw.campo, paramsMarcaHw.condicao, paramsMarcaHw.texto]) do
    if not Permitido then
      Exit;

  if trim(pIds) <> '' then
    dbAllMarcas := servico.GetMarcas(dbAllMarcas, pIds)
  else if paramsMarcaHw.campo = '' then
    dbAllMarcas := servico.GetMarcas(dbAllMarcas, paramsMarcaHw.onlySinc)
  else
    dbAllMarcas := servico.GetMarcas(dbAllMarcas, paramsMarcaHw.campo, paramsMarcaHw.condicao, paramsMarcaHw.texto);

  ResolverFiltroMarcas('S');
  ResolverFiltroMarcasTray();
end;

procedure TFrmTrayCadastros.ConsultaMarcaTray(all: Boolean; pag: Integer;
  pIds: string);
var
  limit, totalPag: Integer;
  vtotalpag: Integer;
begin
  with servico.Auditor.Visualizar.Table(tbMarca).Processo('PRO387')
    .Msg('%s Tipo %s %s', [IfThen(not all, ' Pag ' + pag.ToString), paramsMarcaTray.tipo, System.string.Join(',', paramsMarcaTray.params)]) do
    if not Permitido then
      Exit;

  Screen.Cursor := crHourGlass;
  sc_marcas.Enabled := False;
  try

    limit := 50;
    if trim(pIds) <> '' then
    begin
      consultaMarca := servico.GetConsulta('brands', 'Brands', ['id=' + pIds]);

      if consultaMarca = nil then
        Exit;

      marcas := TJsonHw.ToArrayObject<TBrand>(consultaMarca.dadosDinamicos);
    end
    else if not all then
    begin
      consultaMarca := servico.GetConsulta('brands', 'Brands', ['sort=brand_asc', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsMarcaTray.params);

      if consultaMarca = nil then
        Exit;

      marcas := TJsonHw.ToArrayObject<TBrand>(consultaMarca.dadosDinamicos);
    end
    else
    begin
      marcas := [];
      totalPag := 0;
      pag      := 1;

      bt_prod_pag.Caption := 'Página 1 de ?';

      repeat
        if totalPag > 0 then
          bt_prod_pag.Caption := Format('Página %d de %d', [pag, totalPag]);
        Application.ProcessMessages;

        consultaMarca := servico.GetConsulta('brands', 'Brands', ['sort=brand_asc', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsMarcaTray.params);

        if consultaMarca = nil then
          Exit;

        marcas :=  marcas + TJsonHw.ToArrayObject<TBrand>(consultaMarca.dadosDinamicos);

        if consultaMarca.paging = nil then
          Exit;

        totalPag := Ceil(consultaMarca.paging.total / consultaMarca.paging.limit);

        pag := pag + 1;
      until
        (pag > totalPag);

      consultaMarca := nil;
    end;

    ConsultaMarcaHw(pIds);

    ResolverFiltroMarcasTray();

  finally
    ResolverFiltroMarcas();
    bt_marca_goto_sistema.Enabled := (viewMarca.Count > 0) and (viewMarcaHw.Count > 0);
    bt_marca_goto_tray.Enabled    := (viewMarca.Count > 0) and (viewMarcaHw.Count > 0);
    sc_marcas.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.ConsultaMarcaTray(pag: Integer);
begin
  ConsultaMarcaTray(False, pag, '');
end;

procedure TFrmTrayCadastros.ConsultaProdutoHw(pIds: string);
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
  ResolverFiltroProdutosTray();
end;

procedure TFrmTrayCadastros.ConsultaProdutoTray(pag: Integer);
begin
  ConsultaProdutoTray(False, pag, '');
end;

procedure TFrmTrayCadastros.ExibirImagensKitProduto(kitproduto: TKitsProdHw);
var
  ADoccument: Variant;
  variacao: TVariant;
  html: string;
  image: TImageTray;
  url: turl;
begin

  if not Assigned(Web.Document) then
    Web.Navigate('about:blank');

  html := '<!DOCTYPE html><html><body>' +
          '<h2>Visualização de imagens</h2>';

  if Length(kitproduto.ProductImage) > 0 then
  begin
    html := html + '<h3>Imagens do E-commerce - Kit de Produto</h3>' +
                   '<p>';

    for image in kitproduto.ProductImage do

      html := html + Format('<img src="%s" width="300" height="300">', [image.http]);

    html := html + '</p>';
  end;

  if Length(kitproduto.Variant) > 0 then
  begin
    html := html + '<h3>Imagens do E-commerce - Variações</h3>' +
                   '<p>';

    for variacao in kitproduto.Variant do
      for image in variacao.VariantImage do
        html := html + Format('<img src="%s" width="300" height="300">', [image.http]);

    html := html + '</p>';
  end;

  if Length(kitproduto.hw_image_local) > 0 then
  begin
    html := html + '<h3>Imagens Local do Sistema</h3>' +
                   '<p>';

    for url in kitproduto.hw_image_local do

      html := html + Format('<img src="%s" width="300" height="300">', [url.http]);

    html := html + '</p>';
  end;

  if Length(kitproduto.hw_image_url) > 0 then
  begin
    html := html + '<h3>Imagens do Sistema - Upload temporário</h3>' +
                   '<p>';

    for url in kitproduto.hw_image_url do

      html := html + Format('<img src="%s" width="300" height="300">', [url.http]);

    html := html + '</p>';
  end;

  lbQtdeImagensSis.Caption := IntToStr(Length(kitproduto.hw_image_local));
  lbQtdeImgEnvLoja.Caption := IntToStr(Length(kitproduto.hw_image_url));
  lbQtdeExibidaLoja.Caption := IntToStr(Length(kitproduto.ProductImage) + Length(kitproduto.Variant));

  html := html + '</body></html>';

  ADoccument := Web.Document;
  ADoccument.Clear;
  ADoccument.Write(html);
  ADoccument.Close;

  ts_produtos.TabVisible     := false;
  ts_kitprodutos.TabVisible  := false;
  ts_marcas.TabVisible       := false;
  ts_categorias.TabVisible   := false;
  ts_grades.TabVisible       := false;

  groupbox_img_produto.Caption := 'Kit';
  pnImgProduto.Caption := 'Imagens do Kit de Produto no E-Commerce / Sistema';
  pg_principal.ActivePage := ts_browser;
end;

procedure TFrmTrayCadastros.ExibirImagensProduto(produto: TProductHw);
var
  ADoccument: Variant;
  variacao: TVariant;
  html: string;
  image: TImageTray;
  url: turl;
begin

  if not Assigned(Web.Document) then
    Web.Navigate('about:blank');

  html := '<!DOCTYPE html><html><body>' +
          '<h2>Visualização de imagens</h2>';

  if Length(produto.ProductImage) > 0 then
  begin
    html := html + '<h3>Imagens do E-commerce - Produto</h3>' +
                   '<p>';

    for image in produto.ProductImage do

      html := html + Format('<img src="%s" width="300" height="300">', [image.http]);

    html := html + '</p>';
  end;

  if Length(produto.Variant) > 0 then
  begin
    html := html + '<h3>Imagens do E-commerce - Variações</h3>' +
                   '<p>';

    for variacao in produto.Variant do
      for image in variacao.VariantImage do
        html := html + Format('<img src="%s" width="300" height="300">', [image.http]);

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
  lbQtdeExibidaLoja.Caption := IntToStr(Length(produto.ProductImage) + Length(produto.Variant));

  html := html + '</body></html>';

  ADoccument := Web.Document;
  ADoccument.Clear;
  ADoccument.Write(html);
  ADoccument.Close;

  ts_produtos.TabVisible     := false;
  ts_kitprodutos.TabVisible  := false;
  ts_marcas.TabVisible       := false;
  ts_categorias.TabVisible   := false;
  ts_grades.TabVisible       := false;

  groupbox_img_produto.Caption := 'Produto';
  pnImgProduto.Caption := 'Imagens do Produto no E-Commerce / Sistema';
  pg_principal.ActivePage := ts_browser;
end;

procedure TFrmTrayCadastros.ConsultaProdutoTray(all: Boolean; pag: Integer; pIds: string);
var
  limit, totalPag: Integer;
  vtotalpag: Integer;
begin
  with servico.Auditor.Visualizar.Table(tbProduto).Processo('PRO383')
    .Msg('%s Tipo %s %s', [IfThen(not all, ' Pag ' + pag.ToString), paramsProdTray.tipo, System.string.Join(',', paramsProdTray.params)]) do
    if not Permitido then
      Exit;

  Screen.Cursor := crHourGlass;
  sc_produtos.Enabled := False;
  try

    limit := 50;
    if trim(pIds) <> '' then
    begin
      consultaProd := servico.GetConsulta('products', 'Products', ['id=' + pIds]);

      if consultaProd = nil then
        Exit;

      produtos := TJsonHw.ToArrayObject<TProduct>(consultaProd.dadosDinamicos);
    end
    else if not all then
    begin
      consultaProd := servico.GetConsulta('products', 'Products', ['sort=name_asc', 'is_kit=0', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsProdTray.params);

      if consultaProd = nil then
        Exit;

      produtos := TJsonHw.ToArrayObject<TProduct>(consultaProd.dadosDinamicos);
    end
    else
    begin
      produtos := [];
      totalPag := 0;
      pag      := 1;

      bt_prod_pag.Caption := 'Página 1 de ?';

      repeat
        if totalPag > 0 then
          bt_prod_pag.Caption := Format('Página %d de %d', [pag, totalPag]);
        Application.ProcessMessages;

        consultaProd := servico.GetConsulta('products', 'Products', ['sort=name_asc', 'is_kit=0', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsProdTray.params);

        if consultaProd = nil then
          Exit;

        produtos :=  produtos + TJsonHw.ToArrayObject<TProduct>(consultaProd.dadosDinamicos);

        if consultaProd.paging = nil then
          Exit;

        totalPag := Ceil(consultaProd.paging.total / consultaProd.paging.limit);

        pag := pag + 1;
      until
        (pag > totalPag);

      consultaProd := nil;
    end;

//    if (Length(produtos) > 0) and (Length(categorias) = 0) then
//      bt_categ_consulta_todosClick(bt_categ_consulta_todos);

    ConsultaProdutoHw(pIds);

    ResolverFiltroProdutosTray();

  finally
    ResolverFiltroProdutos();
    bt_produto_goto_sistema.Enabled := (viewProduto.Count > 0) and (viewProdutoHw.Count > 0);
    bt_produto_goto_tray.Enabled    := (viewProduto.Count > 0) and (viewProdutoHw.Count > 0);
    sc_produtos.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_produto_cons_ecClick(Sender: TObject);
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

function TFrmTrayCadastros.baixarImagens(pDiretorio, pUrl: string): string;
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

procedure TFrmTrayCadastros.bt_categ_consulta_todosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsCategoriaTray.params := [];
    paramsCategoriaTray.tipo := 'Todos';

    ConsultaCategoriaTray(True, 0, '');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_categ_goto_sistemaClick(Sender: TObject);
begin
  if viewCategoria.IsEmpty then
    Exit;

  if viewCategoriaHw.IsEmpty then
    Exit;

  if (viewCategoria.fint('cod_categoria') = 0) then
    Exit;

  viewCategoriaHw.DataSet.Locate('cod_categoria', VarArrayOf([viewCategoria.fint('cod_categoria')]), []);
end;

procedure TFrmTrayCadastros.bt_categ_goto_trayClick(Sender: TObject);
begin
  if viewCategoria.IsEmpty then
    Exit;

  if viewCategoriaHw.IsEmpty then
    Exit;

  viewCategoria.DataSet.Locate('id', VarArrayOf([viewCategoriaHw.fstr('id_commerce')]), []);
end;

procedure TFrmTrayCadastros.bitbtn_Imagens_confirmarClick(Sender: TObject);
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

procedure TFrmTrayCadastros.bitbtn_Imagens_fecharClick(Sender: TObject);
begin
  TForm(pnImagens.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmTrayCadastros.bt_categoria_cons_habClick(Sender: TObject);
begin
  pn_categoria_hw_consulta.Visible := not pn_categoria_hw_consulta.Visible;
end;

procedure TFrmTrayCadastros.bt_categ_cadClick(Sender: TObject);
var
  categoria: TCategory;
  categoriasCad: TArray<TCategory>;
  recno: Integer;
  Id: string;
begin

  if viewCategoria.Count = 0 then
    Exit;

  if viewCategoria.IsEmpty then
  begin
    ShowAtencao('Sem categorias para cadastrar');
    Exit;
  end;

  Id := viewCategoria.fstr('id');
  viewCategoria.prepare_loop('sel = ''S''');
  if viewCategoria.IsEmpty then
  begin
    ShowAtencao('Nenhuma categoria selecionada');
    Exit;
  end;
  try
    if viewCategoria.IsEmpty then
      viewCategoria.filterStr('id = %s', [Id.QuotedString]);

    categoriasCad := [];
    while not viewCategoria.DataSet.Eof do
    begin
      for categoria in categorias do
        if viewCategoria.fstr('id').Equals(categoria.id.Trim) then
          categoriasCad := categoriasCad + [categoria];

      viewCategoria.DataSet.Next;
    end;

    with servico.Auditor.Inserir.Table(tbCategoria).Processo('PRO392') do
      if not Permitido then
        Exit;

    if Length(categoriasCad) > 0 then
      if servico.CadastrarCategoria(categoriasCad) then
        if paramsCategoriaTray.tipo = 'Demanda' then
          bt_categ_consulta_demandaClick(Sender)
        else
          bt_categ_consulta_todosClick(Sender);

  finally
    viewCategoria.prepare_loop_done();
    ResolverFiltroCategorias;
  end;
end;

procedure TFrmTrayCadastros.bt_categ_check_allClick(Sender: TObject);
begin
  viewCategoria.CheckUnCheckAllRows(True);
end;

procedure TFrmTrayCadastros.bt_categ_consulta_demandaClick(Sender: TObject);
var
  registros, limit, totalPag: Integer;
  vtotalpag: Integer;
  pag: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    paramsCategoriaTray.params := [];
    paramsCategoriaTray.tipo := 'Demanda';

    ConsultaCategoriaTray();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_categ_produtosClick(Sender: TObject);
var
  id, ids: string;
begin
  id := viewCategoria.fstr('id');
  viewCategoria.prepare_loop('sel = ''S''');
  try
    ids := '';

    if viewCategoria.Count = 0 then
      viewCategoria.filterStr('id = %s', [id.QuotedString]);

    while not viewCategoria.DataSet.Eof do
    begin
      ids := ids + IfThen(viewCategoria.DataSet.RecNo = 1, 'category_id=', ',') + viewCategoria.fstr('id');

      viewCategoria.DataSet.Next;
    end;

  finally
    viewCategoria.prepare_loop_done();
  end;

  if ids.Trim.IsEmpty then
    Exit;

  //consulta de produtos com base nas categorias selecionadas
  paramsProdTray.params := [ids];
  paramsProdTray.tipo := 'Categoria';

  ConsultaProdutoTray(1);

//  produtos := servico.GetList<TProduct>('products', 'Products', ['sort=id_asc', ids]);

//  dbAllProdutos := servico.GetProdutos(False);

//  ResolverFiltroProdutosTray;

  if Length(produtos) > 0 then
    pg_principal.ActivePage := ts_produtos
  else
    ShowAtencao('Sem produtos para a seleção')
end;

procedure TFrmTrayCadastros.bt_categ_uncheck_allClick(Sender: TObject);
begin
  viewCategoria.CheckUnCheckAllRows(False);
end;

procedure TFrmTrayCadastros.bt_categ_vincClick(Sender: TObject);
var
  Id: string;
  categ: TCategory;
  vincular: Boolean;
begin
  if viewCategoriaHw.IsEmpty then
  begin
    ShowAtencao('Sem categorias no banco de dados');
    Exit;
  end;

  try
    Id := viewCategoria.fstr('id');
    if viewCategoria.prepare_loop('sel = ''S''').Count > 1 then
    begin
      ShowAtencao('Selecione 1 registro de cada vez para vincular');
      Exit;
    end
    else if viewCategoria.Count = 0 then
      if viewCategoria.prepare_loop_done().prepare_loop('id = ' + Id.QuotedString).Count <> 1 then
      begin
        ShowAtencao('Selecione pelo menos 1 registro para vincular');
        Exit;
      end
      else
        viewCategoria.CheckUnCheckRow();

    pn_db_categ_top.Caption := 'Vincular categoria Tray ' + viewCategoria.fstr('name');

  finally
    viewCategoria.prepare_loop_done();
  end;

  vincular := False;
  for categ in categorias do
    if TryCond(vincular, categ.id.Trim.Equals(Id)) then
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
    if paramsCategoriaTray.tipo = 'Demanda' then
      bt_categ_consulta_demandaClick(Sender)
    else
      bt_categ_consulta_todosClick(Sender);
  end;
end;

procedure TFrmTrayCadastros.bt_categ_vinc_confirmarClick(Sender: TObject);
var
  categ: TCategory;
begin

  if viewCategoria.Count = 0 then
    Exit;

  viewCategoria.prepare_loop('sel = ''S''');
  try

    for categ in categorias do
      if viewCategoria.fstr('id').Equals(categ.id.Trim) then
        if servico.VincularCategoria(categ, dbAllCategorias.fint('cod_categoria')) then
        begin
          if paramsCategoriaTray.tipo = 'Demanda' then
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

procedure TFrmTrayCadastros.bt_categ_vinc_removeClick(Sender: TObject);
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
      if paramsCategoriaTray.tipo = 'Demanda' then
        bt_categ_consulta_demandaClick(Sender)
      else
        bt_categ_consulta_todosClick(Sender);
    end;
end;

procedure TFrmTrayCadastros.bt_categ_vinc_voltarClick(Sender: TObject);
begin
  pg_principal.ActivePage := ts_categorias;
end;

procedure TFrmTrayCadastros.bt_categ_pagClick(Sender: TObject);
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
      ConsultaCategoriaTray(pagInt);
  end
  else
    ShowErro('Página informada inválida');
end;

procedure TFrmTrayCadastros.bt_categ_pag_anteriorClick(Sender: TObject);
begin
  if consultaCategoria = nil then
    Exit
  else if consultaCategoria.paging = nil then
    Exit;

  if (consultaCategoria.paging.total = 0) or (consultaCategoria.paging.page <= 1) then
    Exit;

  ConsultaCategoriaTray(consultaCategoria.paging.page - 1);
end;

procedure TFrmTrayCadastros.bt_categ_pag_primeiraClick(Sender: TObject);
begin
  ConsultaCategoriaTray();
end;

procedure TFrmTrayCadastros.bt_categ_pag_proximaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if consultaCategoria = nil then
    Exit
  else if consultaCategoria.paging = nil then
    Exit;

  if consultaCategoria.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaCategoria.paging.total / consultaCategoria.paging.limit);

  if (consultaCategoria.paging.page + 1) > totalPag then
    Exit;

  ConsultaCategoriaTray(consultaCategoria.paging.page + 1);
end;

procedure TFrmTrayCadastros.bt_categ_pag_ultimaClick(Sender: TObject);
var
  totalPag: Int64;
begin
 if consultaCategoria = nil then
    Exit
  else if consultaCategoria.paging = nil then
    Exit;

  if consultaCategoria.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaCategoria.paging.total / consultaCategoria.paging.limit);

  ConsultaCategoriaTray(totalPag);
end;

procedure TFrmTrayCadastros.bt_gerarurlereenviar_img_produtoClick(
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

procedure TFrmTrayCadastros.bt_grade_cadClick(Sender: TObject);
var
  grade: TPropertyWithValueHw;
  gradeCad1, gradeCad2: TArray<TPropertyWithValueHw>;
  recno: Integer;
  id1, valueId1, id2, valueId2: string;
begin

  if not grid_grade.Visible then
    Exit;

  if viewGrade.IsEmpty then
  begin
    ShowAtencao('Sem caracteristicas(grades) para cadastrar');
    Exit;
  end;

  id1      := viewGrade.fstr('id');
  valueId1 := viewGrade.fstr('value_id');
  id2      := viewGradeDu.fstr('id');
  valueId2 := viewGradeDu.fstr('value_id');
  viewGrade.prepare_loop('sel = ''S''');

  if viewGrade.IsEmpty then
  begin
    ShowAtencao('Nenhuma caracteristica(grade) selecionada');
    Exit;
  end;

  viewGradeDu.prepare_loop('sel = ''S''');
  try
    gradeCad1 := [];

    if viewGrade.IsEmpty then
      viewGrade.filterStr('id = %s and value_id = %s', [id1.QuotedString, valueId1.QuotedString]);

    while not viewGrade.DataSet.Eof do
    begin
      for grade in grades do
        if (viewGrade.fstr('id').Equals(grade.id.Trim)) and
           (viewGrade.fstr('value_id').Equals(grade.value_id.Trim)) then
          gradeCad1 := gradeCad1 + [grade];
      viewGrade.DataSet.Next;
    end;

    gradeCad2 := [];

    if viewGradeDu.IsEmpty and pn_grade_grid_dupla.Visible then
      viewGradeDu.filterStr('id = %s and value_id = %s', [id2.QuotedString, valueId2.QuotedString]);

    while not viewGradeDu.DataSet.Eof do
    begin
      for grade in grades do
        if (viewGradeDu.fstr('id').Equals(grade.id.Trim)) and
           (viewGradeDu.fstr('value_id').Equals(grade.value_id.Trim)) then
          gradeCad2 := gradeCad2 + [grade];
      viewGradeDu.DataSet.Next;
    end;

    with servico.Auditor.Inserir.Table(tbGrade).Processo('PRO396') do
      if not Permitido then
        Exit;

    if Length(gradeCad1) > 0 then
      if servico.CadastrarGrade(gradeCad1, gradeCad2) then
        dbAllGrades := servico.GetGrades();

  finally
    viewGrade.prepare_loop_done();
    viewGradeDu.prepare_loop_done();
    ResolverFiltroGrades;
  end;
end;

procedure TFrmTrayCadastros.bt_grade_check_allClick(Sender: TObject);
begin
  viewGrade.CheckUnCheckAllRows(True);
end;

procedure TFrmTrayCadastros.bt_grade_check_all_duplaClick(Sender: TObject);
begin
  viewGradeDu.CheckUnCheckAllRows(True);
end;

procedure TFrmTrayCadastros.bt_grade_consultaClick(Sender: TObject);
var
  gradesApi: TArray<TProperty>;
  grade: TProperty;
  value: TPropertyValue;
  propValue: TPropertyWithValueHw;
  registros, limit, totalPag: Integer;
  vtotalpag: Integer;
  pag: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    with servico.Auditor.Visualizar.Table(tbGrade).Processo('PRO395') do
      if not Permitido then
        Exit;

    grades := [];
    pag := 1;
    limit := 30;

    paramsGradeTray.params := [];
    paramsGradeTray.tipo := 'Demanda';
    repeat
      consultaGrade := servico.GetConsulta('products/properties', 'Properties', ['sort=name_asc', 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsGradeTray.params);

      if consultaGrade = nil then
        Exit;

      gradesApi := TJsonHw.ToArrayObject<TProperty>(consultaGrade.dadosDinamicos);

      if consultaGrade.paging = nil then
        Exit;

      for grade in gradesApi do
        for value in grade.PropertyValues do
        begin
          propValue := TPropertyWithValueHw.Create;
          RttiHwUtils.MesclarObjetos(TObject(propValue), grade);

          propValue.value_id := value.id;
          propValue.value_name := value.name;

          grades := grades + [propValue];
        end;

      totalPag := Ceil(consultaGrade.paging.total / consultaGrade.paging.limit);

      pag := pag + 1;
    until
      (pag > totalPag);

    dbAllGrades := servico.GetGrades();

    ResolverFiltroGrades;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_grade_uncheck_allClick(Sender: TObject);
begin
  viewGrade.CheckUnCheckAllRows(False);
end;

procedure TFrmTrayCadastros.bt_grade_uncheck_all_duplaClick(
  Sender: TObject);
begin
  viewGradeDu.CheckUnCheckAllRows(False);
end;

procedure TFrmTrayCadastros.bt_grade_vinc1Click(Sender: TObject);
var
  id, valueId: string;
  grade: TPropertyWithValueHw;
  vincular, primaria: Boolean;
  view: TConexao_OOP;
begin
  primaria := Sender = bt_grade_vinc1;
  if primaria then
    view := viewGrade
  else
    view := viewGradeDu;

  if viewGradeHw.IsEmpty then
  begin
    ShowAtencao('Sem grades no banco de dados');
    Exit;
  end;

  try
    id := view.fstr('id');
    valueId := view.fstr('value_id');
    if view.prepare_loop('sel = ''S''').Count > 1 then
    begin
      ShowAtencao('Selecione 1 registro de cada vez para vincular');
      Exit;
    end
    else if view.Count = 1 then
      Id := view.fstr('id');

  finally
    view.prepare_loop_done();
  end;

  vincular := False;
  for grade in grades do
    if TryCond(vincular, grade.id.Trim.Equals(Id) and grade.value_id.Trim.Equals(valueId)) then
      Break;

  with servico.Auditor.Alterar.Table(tbGrade).Processo('PRO397')
    .Key(viewGradeHw.fstr('cod_grade'))
    .Msg('Sistema %d %s %s %s', [viewGradeHw.fint('cod_grade'), viewGradeHw.fstr('descricao'), viewGradeHw.fstr('descricao1'),
         IfThen(primaria, 'Primaria', 'Secundaria')]) do
    if not Permitido then
      Exit;

  if vincular and
    (ShowConfirmacao('Deseja mesmo vincular essa caracteristica?') = ID_YES) and
    (servico.VincularGrade(grade, Sender = bt_grade_vinc1, viewGradeHw.fint('cod_grade'))) then
  begin
    dbAllGrades := servico.GetGrades();
    ResolverFiltroGrades;
  end;
end;

procedure TFrmTrayCadastros.bt_grade_vinc1_removeClick(Sender: TObject);
var
  primaria: Boolean;
  view: TConexao_OOP;
  s: string;
begin
  if viewGradeHw.IsEmpty then
    Exit;

  primaria := Sender = bt_grade_vinc1_remove;
  if primaria then
    view := viewGrade
  else
    view := viewGradeDu;

  if viewGradeHw.fempty('descricao_ec' + IfThen(not primaria, '1')) then
  begin
    ShowAtencao('Não existe caracteristica e-commerce vinculada a grade para o registro selecionado');
    Exit;
  end;

  s := IfThen(not primaria, '1');
  with servico.Auditor.Alterar.Table(tbGrade).Processo('PRO398')
    .Key(viewGradeHw.fstr('cod_grade'))
    .Msg('Sistema %d %s %s - %s %s %s', [viewGradeHw.fint('cod_grade'), viewGradeHw.fstr('descricao'), viewGradeHw.fstr('descricao1'),
      IfThen(primaria, 'Primaria', 'Secundaria'), viewGradeHw.fstr('tipo_ec' + s), viewGradeHw.fstr('descricao_ec' + s) ]) do
    if not Permitido then
      Exit;

  if ShowConfirmacao('Deseja mesmo desvincular essa caracteristica como %s?',
                     [IfThen(primaria, 'Primária', 'Secundária')]) = ID_YES then
    if servico.DesvincularGrade(primaria, viewGradeHw.fint('cod_grade')) then
    begin
      dbAllGrades := servico.GetGrades();
      ResolverFiltroGrades;
    end;
end;

procedure TFrmTrayCadastros.bt_kitprodutos_confClick(Sender: TObject);
var
  kitproduto: TProduct;
  recno: Integer;
begin

  if not grid_kitproduto.Visible then
    Exit;

  viewKitProduto.prepare_loop('sel = ''S''');
  try

    for kitproduto in kitprodutos do
      if viewKitProduto.fstr('id').Equals(kitproduto.id.Trim) then
        if servico.VincularKitProduto(kitproduto,
          dbAllKitProdutos.fint('codigo_kit')) then
        begin
          if paramsProdTray.tipo = 'Demanda' then
            bt_kitsproduto_consulta_demandaClick(Sender)
          else
            bt_kitsproduto_consulta_todosClick(Sender);
          pg_principal.ActivePage := ts_kitprodutos;
          Break;
        end;

  finally
    viewKitProduto.prepare_loop_done();
    ResolverFiltroKitProdutos;
  end;
end;

procedure TFrmTrayCadastros.bt_kitprodutos_voltarClick(Sender: TObject);
begin
  pg_principal.ActivePage := ts_kitprodutos;
end;

procedure TFrmTrayCadastros.bt_kitproduto_cons_ecClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsKitProdHw.onlySinc := Sender = bt_kitproduto_cons_ec_vinc;
    paramsKitProdHw.tipo     := IfThen(paramsKitProdHw.onlySinc, 'Sincronizados', 'Com dados EC');
    paramsKitProdHw.campo    := '';
    paramsKitProdHw.condicao := '';
    paramsKitProdHw.texto    := '';

    ConsultaKitProdutoHw();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_kitprod_pagClick(Sender: TObject);
var
  pag: string;
  pagInt: Integer;
  totalPag: Int64;
begin
  if consultaKitProd = nil then
    Exit
  else if consultaKitProd.paging = nil then
    Exit;

  if consultaKitProd.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaKitProd.paging.total / consultaKitProd.paging.limit);

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
      ConsultaKitProdutoTray(pagInt);
  end
  else
    ShowErro('Página informada inválida');
end;

procedure TFrmTrayCadastros.bt_kitprod_pag_anteriorClick(Sender: TObject);
begin
  if consultaKitProd = nil then
    Exit
  else if consultaKitProd.paging = nil then
    Exit;

  if (consultaKitProd.paging.total = 0) or (consultaKitProd.paging.page <= 1) then
    Exit;

  ConsultaKitProdutoTray(consultaKitProd.paging.page - 1);
end;

procedure TFrmTrayCadastros.bt_kitprod_pag_primeiraClick(Sender: TObject);
begin
  ConsultaKitProdutoTray();
end;

procedure TFrmTrayCadastros.bt_kitprod_pag_proximaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if consultaKitProd = nil then
    Exit
  else if consultaKitProd.paging = nil then
    Exit;

  if consultaKitProd.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaKitProd.paging.total / consultaKitProd.paging.limit);

  if (consultaKitProd.paging.page + 1) > totalPag then
    Exit;

  ConsultaKitProdutoTray(consultaKitProd.paging.page + 1);
end;

procedure TFrmTrayCadastros.bt_kitprod_pag_ultimaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if consultaKitProd = nil then
    Exit
  else if consultaKitProd.paging = nil then
    Exit;

  if consultaKitProd.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaKitProd.paging.total / consultaKitProd.paging.limit);

  ConsultaKitProdutoTray(totalPag);
end;

procedure TFrmTrayCadastros.bt_kitsprodutocons_consulta_categoriaClick(
  Sender: TObject);
begin
  paramsCategoriaHw.tipo     := 'Consulta';
  paramsCategoriaHw.campo    := cb_campo_cons_categoria.Items[cb_campo_cons_categoria.ItemIndex];
  paramsCategoriaHw.condicao := cb_cond_cons_categoria.Items[cb_cond_cons_categoria.ItemIndex];
  paramsCategoriaHw.texto    := me_texto_cons_categoria.Text;

  ConsultaCategoriaHw('');
end;

procedure TFrmTrayCadastros.bt_kitsprodutocons_consulta_kitprodutoClick(Sender: TObject);
begin
  paramsKitProdHw.tipo     := 'Consulta';
  paramsKitProdHw.campo    := cb_campo_cons_kitproduto.Items[cb_campo_cons_kitproduto.ItemIndex];
  paramsKitProdHw.condicao := cb_cond_cons_kitproduto.Items[cb_cond_cons_kitproduto.ItemIndex];
  paramsKitProdHw.texto    := me_texto_cons_kitproduto.Text;

  ConsultaKitProdutoHw();
end;

procedure TFrmTrayCadastros.bt_kitsprodutocons_consulta_marcaClick(
  Sender: TObject);
begin
  paramsMarcaHw.tipo     := 'Consulta';
  paramsMarcaHw.campo    := cb_campo_cons_marca.Items[cb_campo_cons_marca.ItemIndex];
  paramsMarcaHw.condicao := cb_cond_cons_marca.Items[cb_cond_cons_marca.ItemIndex];
  paramsMarcaHw.texto    := me_texto_cons_marca.Text;

  ConsultaMarcaHw('');
end;

procedure TFrmTrayCadastros.bt_kitsproduto_consulta_demandaClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsKitProdTray.params := [];
    paramsKitProdTray.tipo := 'Demanda';

    ConsultaKitProdutoTray();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_kitsproduto_consulta_todosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsKitProdTray.params := [];
    paramsKitProdTray.tipo := 'Todos';

    ConsultaKitProdutoTray(True, 0, '');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_kitproduto_cons_habClick(Sender: TObject);
begin
  pn_kitproduto_hw_consulta.Visible := not pn_kitproduto_hw_consulta.Visible;
end;

procedure TFrmTrayCadastros.bt_kitproduto_goto_sistemaClick(Sender: TObject);
begin
  if viewKitProduto.IsEmpty then
    Exit;

  if viewKitProdutoHw.IsEmpty then
    Exit;

  if (viewKitProduto.fint('codigo_kit') = 0) then
    Exit;

  viewKitProdutoHw.DataSet.Locate('codigo_kit', VarArrayOf([viewKitProduto.fint('codigo_kit')]), []);
end;

procedure TFrmTrayCadastros.bt_kitproduto_goto_trayClick(Sender: TObject);
begin
  if viewKitProduto.IsEmpty then
    Exit;

  if viewKitProdutoHw.IsEmpty then
    Exit;

  viewKitProduto.DataSet.Locate('id', VarArrayOf([viewKitProdutoHw.fstr('id_commerce')]), []);
end;

procedure TFrmTrayCadastros.bt_kitproduto_imagens_hwClick(Sender: TObject);
begin
  if viewKitProdutoHw.IsEmpty then
    Exit;

  DBTextDesrTray2.DataSource := viewKitProdutoHw.DataSourceOOP;
  DBTextDesrTray2.DataField := 'DESCRICAO_KIT';

  DBTextIdTray2.DataSource := viewKitProdutoHw.DataSourceOOP;
  DBTextIdTray2.DataField := 'ID_COMMERCE';

  ExibirImagensKitProduto(servico.ResolverKitProdutoHw(viewKitProdutoHw, kitprodutos));
end;

procedure TFrmTrayCadastros.bt_kitproduto_imagens_trayClick(Sender: TObject);
var
  id: string;
  kitprod: TProduct;
  kitprodHw: TKitsProdHw;
begin
  if viewKitProduto.IsEmpty then
    Exit;

  id := viewKitProduto.fstr('id');

  for kitprod in kitprodutos do
    if id = kitprod.id then
    begin
      groupbox_img_produto.Caption := 'Kit';
      pnImgProduto.Caption := 'Imagens do Kit de Produto no E-Commerce / Sistema';

      DBTextDesrTray2.DataSource := viewKitProduto.DataSourceOOP;
      DBTextDesrTray2.DataField := 'NAME';

      DBTextIdTray2.DataSource := viewKitProduto.DataSourceOOP;
      DBTextIdTray2.DataField := 'ID';

      ExibirImagensKitProduto(servico.ResolverKitProduto(kitprod));
      Break;
    end;
end;

procedure TFrmTrayCadastros.bt_kitproduto_linkClick(Sender: TObject);
var
  id: string;
  kitprod: TProduct;
begin
  if viewKitProduto.IsEmpty then
    Exit;

  id := viewKitProduto.fstr('id');

  for kitprod in kitprodutos do
    if id = kitprod.id then
    begin
      ShellExecute(Application.Handle, 'open', PWideChar(kitprod.url.https), '', '', 0);
      Break;
    end;
end;

procedure TFrmTrayCadastros.bt_kitproduto_produtosClick(Sender: TObject);
var
  I: Integer;
  id: string;
  codigo_kit: Integer;
  vIdsProd: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if viewKitProduto.IsEmpty then
      Exit;

    with servico.Auditor.Inserir.Table(tbProdutoKit).Processo('PRO420') do
      if not Permitido then
        Exit;

    id := viewKitProduto.fstr('id');

    codigo_kit := 0;
    if viewKitProduto.fint('codigo_kit') > 0 then
      codigo_kit := viewKitProduto.fint('codigo_kit')
    else if viewKitProdutoHw.fint('codigo_kit') > 0 then
      codigo_kit := viewKitProdutoHw.fint('codigo_kit');

    consultaProdutosKit := servico.GetConsulta('products/kits', 'ProductKits', ['product_parent_id=' + id]);

    if consultaProdutosKit = nil then
        Exit;

    productskit := TJsonHw.ToArrayObject<TProductKit>(consultaProdutosKit.dadosDinamicos);

    dbAllProductsKit := servico.GetProdutosKit(codigo_kit);

    if (Length(productskit) > 0) then
    begin
      vIdsProd := '';
      for I := 0 to Length(productskit) - 1 do
        vIdsProd := trim(IfThen(trim(vIdsProd) <> '', vIdsProd + ',', '') + productskit[I].product_id);

      if trim(vIdsProd) <> '' then
        ConsultaProdutoTray(False, 0, vIdsProd);
    end;

    ResolverFiltroProdutosKit;

    ts_produtos.TabVisible     := false;
    ts_kitprodutos.TabVisible  := false;
    ts_marcas.TabVisible       := false;
    ts_categorias.TabVisible   := false;
    ts_grades.TabVisible       := false;

    pg_principal.ActivePage := ts_kits_produto_prod;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_kitproduto_vincClick(Sender: TObject);
var
  Id: string;
  kitproduct: TProduct;
  vincular: Boolean;
begin
  if viewKitProdutoHw.IsEmpty then
  begin
    ShowAtencao('Sem kits de produto no banco de dados');
    Exit;
  end;

  try
    Id := viewKitProduto.fstr('id');
    if viewKitProduto.prepare_loop('sel = ''S''').Count > 1 then
    begin
      ShowAtencao('Selecione 1 registro de cada vez para vincular');
      Exit;
    end
    else if viewKitProduto.Count = 1 then
      Id := viewKitProduto.fstr('id');

  finally
    viewKitProduto.prepare_loop_done();
  end;

  vincular := False;
  for kitproduct in kitprodutos do
    if TryCond(vincular, kitproduct.id.Trim.Equals(Id)) then
      Break;

  if viewKitProduto.fint('codigo_kit') > 0 then
  begin
    ShowAtencao('Kit de Produto do E-Commerce selecionado está vinculado a um kit de produto do sistema.' +#13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  if viewKitProdutoHw.fint('id_commerce') > 0 then
  begin
    ShowAtencao('Kit de Produto do sistema está vinculado a um kit de produto do E-Commerce.' + #13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  RadioGroupOpcao.ItemIndex :=
    _LerConfiguracoesRegistroInteger(RadioGroupOpcao.Name, 0);

  if vincular and
    (ShowConfirmacao('Deseja mesmo vincular esse kit de produto?') = ID_YES) and
    (servico.VincularKitProduto(kitproduct,
      viewKitProdutoHw.fint('codigo_kit'))) then
  begin
    ConsultaKitProdutoHw();
    _GravaConfiguracoesInteger(
      RadioGroupOpcao.Name,
      RadioGroupOpcao.ItemIndex);
  end;
end;

procedure TFrmTrayCadastros.bt_kitproduto_vinc_removeClick(Sender: TObject);
begin
  if viewKitProdutoHw.IsEmpty then
    Exit;

  if viewKitProdutoHw.fint('id_commerce') = 0 then
  begin
    ShowAtencao('Não existe kit vinculado do e-commerce para o registro selecionado');
    Exit;
  end;

  if ShowConfirmacao('Deseja mesmo desvincular esse kit de produto?') = ID_YES then
    if servico.DesvincularKitProduto(viewKitProdutoHw.fint('codigo_kit')) then
      ConsultaKitProdutoHw();
//    begin
//      dbAllProdutos := servico.GetProdutos(False);
//      ResolverFiltroProdutos;
//    end;
end;

procedure TFrmTrayCadastros.bt_marca_consulta_demandaClick(Sender: TObject);
var
  registros, limit, totalPag: Integer;
  vtotalpag: Integer;
  pag: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    paramsMarcaTray.params := [];
    paramsMarcaTray.tipo := 'Demanda';

    ConsultaMarcaTray();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_marca_consulta_todosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsMarcaTray.params := [];
    paramsMarcaTray.tipo := 'Todos';

    ConsultaMarcaTray(True, 0, '');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_marca_cons_ecClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsMarcaHw.onlySinc := Sender = bt_marca_cons_ec_vinc;
    paramsMarcaHw.tipo     := IfThen(paramsMarcaHw.onlySinc, 'Sincronizados', 'Com dados EC');
    paramsMarcaHw.campo    := '';
    paramsMarcaHw.condicao := '';
    paramsMarcaHw.texto    := '';

    ConsultaMarcaHw('');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_marca_cons_habClick(Sender: TObject);
begin
  pn_marca_hw_consulta.Visible := not pn_marca_hw_consulta.Visible;
end;

procedure TFrmTrayCadastros.bt_marca_goto_sistemaClick(Sender: TObject);
begin
  if viewMarca.IsEmpty then
    Exit;

  if viewMarcaHw.IsEmpty then
    Exit;

  if (viewMarca.fint('cod_marca') = 0) then
    Exit;

  viewMarcaHw.DataSet.Locate('cod_marca', VarArrayOf([viewMarca.fint('cod_marca')]), []);
end;

procedure TFrmTrayCadastros.bt_marca_goto_trayClick(Sender: TObject);
begin
  if viewMarca.IsEmpty then
    Exit;

  if viewMarcaHw.IsEmpty then
    Exit;

  viewMarca.DataSet.Locate('id', VarArrayOf([viewMarcaHw.fstr('id_commerce')]), []);
end;

procedure TFrmTrayCadastros.bt_produtocons_consulta_produtoClick(Sender: TObject);
begin
  paramsProdHw.tipo     := 'Consulta';
  paramsProdHw.campo    := cb_campo_cons_produto.Items[cb_campo_cons_produto.ItemIndex];
  paramsProdHw.condicao := cb_cond_cons_produto.Items[cb_cond_cons_produto.ItemIndex];
  paramsProdHw.texto    := me_texto_cons_produto.Text;

  ConsultaProdutoHw('');
end;

procedure TFrmTrayCadastros.bt_produtokit_goto_sistemaClick(Sender: TObject);
begin
  if viewProductKit.IsEmpty then
    Exit;

  if viewProductKitHw.IsEmpty then
    Exit;

  if (viewProductKit.fint('grupo_prod') = 0) and
     (viewProductKit.fempty('cod_prod')) then
    Exit;

  viewProductKitHw.DataSet.Locate('grupo_prod;cod_prod', VarArrayOf([viewProductKit.fint('grupo_prod'), viewProductKit.fstr('cod_prod')]), []);
end;

procedure TFrmTrayCadastros.bt_produtokit_goto_trayClick(Sender: TObject);
begin
  if viewProductKit.IsEmpty then
    Exit;

  if viewProductKitHw.IsEmpty then
    Exit;

  viewProductKit.DataSet.Locate('id', VarArrayOf([viewProductKitHw.fstr('id_commerce')]), []);
end;

procedure TFrmTrayCadastros.bt_produtokit_vincClick(Sender: TObject);
var
  Id: string;
  productkit: TProductKit;
  vincular: Boolean;
begin
  if viewProductKitHw.IsEmpty then
  begin
    ShowAtencao('Sem produtos do kit no banco de dados');
    Exit;
  end;

  try
    Id := viewProductKit.fstr('id');
    if viewProductKit.prepare_loop('sel = ''S''').Count > 1 then
    begin
      ShowAtencao('Selecione 1 registro de cada vez para vincular');
      Exit;
    end
    else if viewProductKit.Count = 1 then
      Id := viewProductKit.fstr('id');

  finally
    viewProductKit.prepare_loop_done();
  end;

  vincular := False;
  for productkit in productskit do
    if TryCond(vincular, productkit.id.Trim.Equals(Id)) then
      Break;

  if viewProductKit.fint('grupo_prod') > 0 then
  begin
    ShowAtencao('Produto do kit E-Commerce selecionado está vinculado a um produto do kit do sistema.' +#13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  if viewProductKitHw.fint('id_commerce') > 0 then
  begin
    ShowAtencao('Produto do kit do sistema está vinculado a um produto do kit do E-Commerce.' + #13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  if (viewProductKit.fint('product_has_variation') > 0) and (viewProductKitHw.fint('tem_grade') = 0) then
  begin
    ShowAtencao('Produto do kit E-Commerce selecionado tem variação/grade e o produto do kit do sistema não tem variação/grade.' +#13 + #13 +
      'Favor verificar antes de continuar');
    Exit;
  end;

  if (viewProductKit.fint('product_has_variation') = 0) and (viewProductKitHw.fint('tem_grade') > 0) then
  begin
    ShowAtencao('Produto do kit E-Commerce selecionado não tem variação/grade e o produto do kit do sistema tem variação/grade.' +#13 + #13 +
      'Favor verificar antes de continuar');
    Exit;
  end;

  if vincular and
    (ShowConfirmacao('Deseja mesmo vincular esse produto do kit?') = ID_YES) and
    (servico.VincularProdutoKit(productkit,
      viewProductKitHw.fint('codigo_kit'),
      viewProductKitHw.fint('grupo_prod'),
      viewProductKitHw.fstr('cod_prod'))) then
    bt_kitproduto_produtosClick(Sender);
//  begin
//    dbAllKitProdutos := servico.GetKitProdutos(False);
//    ResolverFiltroKitProdutos;
//  end;
end;

procedure TFrmTrayCadastros.bt_produtokit_vinc_removeClick(Sender: TObject);
begin
  if viewProductKitHw.IsEmpty then
    Exit;

  if viewProductKitHw.fint('id_commerce') = 0 then
  begin
    ShowAtencao('Não existe produto do kit vinculado do e-commerce para o registro selecionado');
    Exit;
  end;

  if ShowConfirmacao('Deseja mesmo desvincular esse produto do kit?') = ID_YES then
    if servico.DesvincularProdutoKit(viewProductKitHw.fint('codigo_kit'),
      viewProductKitHw.fint('grupo_prod'),
      viewProductKitHw.fstr('cod_prod')) then
      bt_kitproduto_produtosClick(Sender);
//    begin
//      dbAllProdutos := servico.GetProdutos(False);
//      ResolverFiltroProdutos;
//    end;
end;

procedure TFrmTrayCadastros.bt_produtos_confClick(Sender: TObject);
var
  produto: TProduct;
  recno: Integer;
begin

  if not grid_produto.Visible then
    Exit;

  viewProduto.prepare_loop('sel = ''S''');
  try

    for produto in produtos do
      if viewProduto.fstr('id').Equals(produto.id.Trim) then
        if servico.VincularProduto(produto,
          dbAllProdutos.fint('grupo_prod'),
          dbAllProdutos.fstr('cod_prod'),
          dbAllProdutos.ffloat('altura_prod'),
          dbAllProdutos.ffloat('comprimento_prod'),
          dbAllProdutos.ffloat('largura_prod'),
          dbAllProdutos.ffloat('peso_brut_prod'),
          dbAllProdutos.ffloat('peso_liq_prod')) then
        begin
          if paramsProdTray.tipo = 'Demanda' then
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

procedure TFrmTrayCadastros.bt_produtos_kitprodutos_voltarClick(
  Sender: TObject);
begin
  ts_produtos.TabVisible     := true;
  ts_kitprodutos.TabVisible  := true;
  ts_marcas.TabVisible       := true;
  ts_categorias.TabVisible   := true;
  ts_grades.TabVisible       := true;

  pg_principal.ActivePage := ts_kitprodutos;
end;

procedure TFrmTrayCadastros.bt_produtos_voltarClick(Sender: TObject);
begin
  pg_principal.ActivePage := ts_produtos;
end;

procedure TFrmTrayCadastros.bt_produto_linkClick(Sender: TObject);
var
  id: string;
  prod: TProduct;
begin
  if viewProduto.IsEmpty then
    Exit;

  id := viewProduto.fstr('id');

  for prod in produtos do
    if id = prod.id then
    begin
      ShellExecute(Application.Handle, 'open', PWideChar(prod.url.https), '', '', 0);
      Break;
    end;
end;

procedure TFrmTrayCadastros.bt_produto_consulta_demandaClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsProdTray.params := [];
    paramsProdTray.tipo := 'Demanda';

    ConsultaProdutoTray();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_produto_consulta_todosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    paramsProdTray.params := [];
    paramsProdTray.tipo := 'Todos';

    ConsultaProdutoTray(True, 0, '');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_produto_cons_habClick(Sender: TObject);
begin
  pn_produto_hw_consulta.Visible := not pn_produto_hw_consulta.Visible;
end;

procedure TFrmTrayCadastros.bt_produto_goto_sistemaClick(Sender: TObject);
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

procedure TFrmTrayCadastros.bt_produto_goto_trayClick(Sender: TObject);
begin
  if viewProduto.IsEmpty then
    Exit;

  if viewProdutoHw.IsEmpty then
    Exit;

  viewProduto.DataSet.Locate('id', VarArrayOf([viewProdutoHw.fstr('id_commerce')]), []);
end;

procedure TFrmTrayCadastros.bt_produto_variacao_trayClick(Sender: TObject);
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

    if viewProduto.fstr('has_variation') = '0' then
    begin
      ShowAtencao('Produto selecionado sem variação/grade');
      Exit;
    end;

    with servico.Auditor.Inserir.Table(tbGrade).Processo('PRO400') do
      if not Permitido then
        Exit;

    id := viewProduto.fint('id');

    variants := [];
    pag   := 1;
    limit := 30;

    paramsVariacaoTray.params := [];
    paramsVariacaoTray.tipo := 'Demanda';
    repeat
      consultaVariacao := servico.GetConsulta('products/variants', 'Variants', ['product_id=' + id.ToString, 'limit=' + limit.ToString, 'page=' + pag.ToString] + paramsVariacaoTray.params);

      if consultaVariacao = nil then
        Exit;

      variants := variants + TJsonHw.ToArrayObject<TVariant>(consultaVariacao.dadosDinamicos);

      if consultaVariacao.paging = nil then
        Exit;

      totalPag := Ceil(consultaVariacao.paging.total / consultaVariacao.paging.limit);

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
      if (Length(variants) > 0) and (Length(variants[0].Sku) > 0) then
        tipoEC    := variants[0].Sku[0].type_;
      if (Length(variants) > 0) and (Length(variants[0].Sku) > 1) then
        tipoEC1   := variants[0].Sku[1].type_;
      if (Length(variants) > 0) and (Length(variants[0].Sku) > 0) then
        tipoERP   := variants[0].Sku[0].type_;
      if (Length(variants) > 0) and (Length(variants[0].Sku) > 1) then
        tipoERP1  := variants[0].Sku[1].type_;
    end
    else if viewProdutoHw.fint('grupo_prod') > 0 then
    begin
      GrupoProd := viewProdutoHw.fint('grupo_prod');
      CodProd   := viewProdutoHw.fstr('cod_prod');
      if (Length(variants) > 0) and (Length(variants[0].Sku) > 0) then
        tipoEC    := variants[0].Sku[0].type_;
      if (Length(variants) > 0) and (Length(variants[0].Sku) > 1) then
        tipoEC1   := variants[0].Sku[1].type_;
      tipoERP   := viewProdutoHw.fstr('tipo_ec');
      tipoERP1  := viewProdutoHw.fstr('tipo_ec1');
      if tipoERP.Trim = '' then
      begin
        if (Length(variants) > 0) and (Length(variants[0].Sku) > 0) then
          tipoERP   := variants[0].Sku[0].type_;
        if (Length(variants) > 0) and (Length(variants[0].Sku) > 1) then
          tipoERP1  := variants[0].Sku[1].type_;
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
    ts_kitprodutos.TabVisible  := false;
    ts_marcas.TabVisible       := false;
    ts_categorias.TabVisible   := false;
    ts_grades.TabVisible       := false;

    pg_principal.ActivePage := ts_grades_variacao_prod;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTrayCadastros.bt_produto_vincClick(Sender: TObject);
var
  Id: string;
  produto: TProduct;
  vincular: Boolean;
begin
  if viewProdutoHw.IsEmpty then
  begin
    ShowAtencao('Sem produtos no banco de dados');
    Exit;
  end;

  try
    Id := viewProduto.fstr('id');
    if viewProduto.prepare_loop('sel = ''S''').Count > 1 then
    begin
      ShowAtencao('Selecione 1 registro de cada vez para vincular');
      Exit;
    end
    else if viewProduto.Count = 1 then
      Id := viewProduto.fstr('id');

  finally
    viewProduto.prepare_loop_done();
  end;

  vincular := False;
  for produto in produtos do
    if TryCond(vincular, produto.id.Trim.Equals(Id)) then
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

procedure TFrmTrayCadastros.bt_produto_vinc_removeClick(Sender: TObject);
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
//    begin
//      dbAllProdutos := servico.GetProdutos(False);
//      ResolverFiltroProdutos;
//    end;
end;

procedure TFrmTrayCadastros.bt_prod_pagClick(Sender: TObject);
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
      ConsultaProdutoTray(pagInt);
  end
  else
    ShowErro('Página informada inválida');
end;

procedure TFrmTrayCadastros.bt_prod_pag_anteriorClick(Sender: TObject);
begin
  if consultaProd = nil then
    Exit
  else if consultaProd.paging = nil then
    Exit;

  if (consultaProd.paging.total = 0) or (consultaProd.paging.page <= 1) then
    Exit;

  ConsultaProdutoTray(consultaProd.paging.page - 1);
end;

procedure TFrmTrayCadastros.bt_prod_pag_primeiraClick(Sender: TObject);
begin
  ConsultaProdutoTray();
end;

procedure TFrmTrayCadastros.bt_prod_pag_proximaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if consultaProd = nil then
    Exit
  else if consultaProd.paging = nil then
    Exit;

  if consultaProd.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaProd.paging.total / consultaProd.paging.limit);

  if (consultaProd.paging.page + 1) > totalPag then
    Exit;

  ConsultaProdutoTray(consultaProd.paging.page + 1);
end;

procedure TFrmTrayCadastros.bt_prod_pag_ultimaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if consultaProd = nil then
    Exit
  else if consultaProd.paging = nil then
    Exit;

  if consultaProd.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaProd.paging.total / consultaProd.paging.limit);

  ConsultaProdutoTray(totalPag);
end;

procedure TFrmTrayCadastros.bt_reenviar_img_produtoClick(Sender: TObject);
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

procedure TFrmTrayCadastros.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  pbprogresso.Position := AWorkCount;
  lblStatus.Caption    := 'Baixando ... ' + retornaKiloBytes(AWorkCount);
  lblDownloadEm.Caption := 'Download em ... ' + retornaPorcentagem(pbprogresso.Max, AWorkCount);
end;

procedure TFrmTrayCadastros.IdHTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  pbprogresso.Max := AWorkCountMax;
end;

procedure TFrmTrayCadastros.IdHTTPWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
//  pbprogresso.Position := 0;
  lblDownloadEm.Caption := 'Finalizado ...';
  lblStatus.Caption    := 'Download Finalizado ...';
//  pbprogresso.Visible  := false;

//  TForm(pnBaixarImagens.Parent).ModalResult := IDOK;
end;

procedure TFrmTrayCadastros.InitGridColumns(Index: Integer; grid: TDBGrid;
  client: TClientDataSet; FieldName: string; Size: Integer; DisplayLabel: string;
  alignment: TAlignment);
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

procedure TFrmTrayCadastros.InitGridColumnsC(Index: Integer; grid: TDBGrid;
  client: TClientDataSet; FieldName: string; Size: Integer;
  DisplayLabel: string);
begin
  InitGridColumns(Index, grid, client, FieldName, Size, DisplayLabel, taCenter);
end;

procedure TFrmTrayCadastros.InitGridColumnsL(Index: Integer; grid: TDBGrid;
  client: TClientDataSet; FieldName: string; Size: Integer;
  DisplayLabel: string);
begin
  InitGridColumns(Index, grid, client, FieldName, Size, DisplayLabel, taLeftJustify);
end;

procedure TFrmTrayCadastros.InitGridColumnsR(Index: Integer; grid: TDBGrid;
  client: TClientDataSet; FieldName: string; Size: Integer;
  DisplayLabel: string);
begin
  InitGridColumns(Index, grid, client, FieldName, Size, DisplayLabel, taRightJustify);
end;

procedure TFrmTrayCadastros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  servico.Free;

  RegistroWin.Write(Self.ClassName, ck_grade_dupla.Name, ck_grade_dupla.Checked);

  //categorias

  //marcas

  //produtos

  Action := caFree;
  FrmTrayCadastros := nil;
end;

procedure TFrmTrayCadastros.FormCreate(Sender: TObject);
begin
  servico := THwTrayServicos.Create(False);

  // categorias
  viewCategoria   := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TCategoryMescladaHw, True, Self));
  viewCategoriaHw := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TCategoriaHw, True, Self));

  // marcas
  viewMarca       := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TBrandHw, True, Self));
  viewMarcaHw     := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TBrandHw, True, Self));

  // grades
  viewGrade       := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TPropertyWithValueHw, True, Self));
  viewGradeDu     := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TPropertyWithValueHw, True, Self));
  viewGradeHw     := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TGradeHw, True, Self));

  // variacoes / grades
  viewVariant     := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TVariantHw2, True, Self));
  viewVariantHw   := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TVariantHw2, True, Self));

  // produtos
  viewProduto     := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TProductHw, True, Self));
  viewProdutoHw   := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TProductHw, True, Self));

  // kits
  viewKitProduto  := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TKitsProdHw, True, Self));
  viewKitProdutoHw:= TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TKitsProdHw, True, Self));

  // produtos do kit
  viewProductKit  := TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TProductKitHw, True, Self));
  viewProductKitHw:= TConexao_OOP.NewMemory_OOP(THwDbConverter.ClassToDBClient(TProductKitHw, True, Self));
end;

procedure TFrmTrayCadastros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmTrayCadastros.FormShow(Sender: TObject);
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
  InitGridColumnsC(0, grid_categ_tray, viewCategoria.DataSet, 'sel'              , 18               , '..');
  InitGridColumnsR(1, grid_categ_tray, viewCategoria.DataSet, 'id'               , COLUMN_SIZE_ID   , 'Id');
  InitGridColumnsL(2, grid_categ_tray, viewCategoria.DataSet, 'name'             , COLUMN_SIZE_SHORT, 'Nome');
  InitGridColumnsL(3, grid_categ_tray, viewCategoria.DataSet, 'description'      , COLUMN_SIZE_SHORT, 'Descrição');
  InitGridColumnsL(4, grid_categ_tray, viewCategoria.DataSet, 'small_description', COLUMN_SIZE_SHORT, 'Desc. Reduz');
  InitGridColumnsC(5, grid_categ_tray, viewCategoria.DataSet, 'has_product'      , 36               , 'Tem Prod');
  InitGridColumnsR(6, grid_categ_tray, viewCategoria.DataSet, 'parent_id'        , COLUMN_SIZE_ID   , 'Pai Id');
  InitGridColumnsR(7, grid_categ_tray, viewCategoria.DataSet, 'cod_categoria'    , COLUMN_SIZE_ID   , 'Hw Id');
  InitGridColumnsL(8, grid_categ_tray, viewCategoria.DataSet, 'descricao'        , COLUMN_SIZE_SHORT, 'Hw Descrição');
  viewCategoria.DataSet.IndexFieldNames := 'index';

  //THwHack_DbGrid.Create(grid_categ_hw);
  grid_categ_hw.DataSource := viewCategoriaHw.DataSourceOOP;
  for I := 0 to viewCategoriaHw.DataSet.FieldCount - 1 do viewCategoriaHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_categ_hw, viewCategoriaHw.DataSet, 'cod_categoria'    , COLUMN_SIZE_ID   , 'Id');
  InitGridColumnsL(1, grid_categ_hw, viewCategoriaHw.DataSet, 'descricao'        , COLUMN_SIZE_SHORT, 'Descrição');
  InitGridColumnsL(2, grid_categ_hw, viewCategoriaHw.DataSet, 'cod_categoria_pai', COLUMN_SIZE_ID   , 'Pai Id');
  InitGridColumnsL(3, grid_categ_hw, viewCategoriaHw.DataSet, 'id_commerce'      , COLUMN_SIZE_ID +20,'E-commerce Id');
  InitGridColumnsL(4, grid_categ_hw, viewCategoriaHw.DataSet, 'name_commerce'    , COLUMN_SIZE_SHORT, 'E-commerce Nome');
  ResolverFiltroCategorias;

  //marcas
  THwHack_DbGrid.Create(grid_marca);
  grid_marca.DataSource := viewMarca.DataSourceOOP;
  for I := 0 to viewMarca.DataSet.FieldCount - 1 do viewMarca.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_marca, viewMarca.DataSet, 'sel'             , 18               , '..');
  InitGridColumnsR(1, grid_marca, viewMarca.DataSet, 'id'              , COLUMN_SIZE_ID   , 'Id');
  InitGridColumnsL(2, grid_marca, viewMarca.DataSet, 'brand'           , COLUMN_SIZE_SHORT, 'Marca');
  InitGridColumnsL(3, grid_marca, viewMarca.DataSet, 'slug'            , COLUMN_SIZE_SHORT, 'Slug');
  InitGridColumnsR(4, grid_marca, viewMarca.DataSet, 'cod_marca'       , COLUMN_SIZE_ID   , 'Hw Id');
  InitGridColumnsL(5, grid_marca, viewMarca.DataSet, 'descricao_marca' , COLUMN_SIZE_SHORT, 'Hw Marca');
  viewMarca.DataSet.IndexFieldNames := 'brand';

  grid_marca_hw.DataSource := viewMarcaHw.DataSourceOOP;
  for I := 0 to viewMarcaHw.DataSet.FieldCount - 1 do viewMarcaHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_marca_hw, viewMarcaHw.DataSet, 'cod_marca'      , COLUMN_SIZE_ID   , 'Id');
  InitGridColumnsL(1, grid_marca_hw, viewMarcaHw.DataSet, 'descricao_marca', COLUMN_SIZE_SHORT, 'Marca');
  InitGridColumnsL(2, grid_marca_hw, viewMarcaHw.DataSet, 'id_commerce'    , COLUMN_SIZE_SHORT, 'E-commerce Id');
  InitGridColumnsL(3, grid_marca_hw, viewMarcaHw.DataSet, 'brand'          , COLUMN_SIZE_SHORT, 'E-commerce Marca');
  ResolverFiltroMarcas;

  //grades
  // simples
  THwHack_DbGrid.Create(grid_grade, true, True, True, False);
  grid_grade.DataSource := viewGrade.DataSourceOOP;
  for I := 0 to viewGrade.DataSet.FieldCount - 1 do viewGrade.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_grade, viewGrade.DataSet, 'sel'             , 18               , '..');
  InitGridColumnsR(1, grid_grade, viewGrade.DataSet, 'id'              , COLUMN_SIZE_ID   , 'Id');
  InitGridColumnsL(2, grid_grade, viewGrade.DataSet, 'name'            , COLUMN_SIZE_SHORT, 'Tipo');
  InitGridColumnsL(3, grid_grade, viewGrade.DataSet, 'value_name'      , COLUMN_SIZE_SHORT, 'Valor');
  InitGridColumnsC(4, grid_grade, viewGrade.DataSet, 'has_product'     , 36               , 'Tem Prod');
  InitGridColumnsR(5, grid_grade, viewGrade.DataSet, 'value_id'        , COLUMN_SIZE_ID   , 'Valor Id');
  viewGrade.DataSet.IndexFieldNames := 'id;value_name';
  // dupla
  THwHack_DbGrid.Create(grid_grade_dupla, true, True, True, False);
  grid_grade_dupla.DataSource := viewGradeDu.DataSourceOOP;
  for I := 0 to viewGradeDu.DataSet.FieldCount - 1 do viewGradeDu.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_grade_dupla, viewGradeDu.DataSet, 'sel'             , 18               , '..');
  InitGridColumnsR(1, grid_grade_dupla, viewGradeDu.DataSet, 'id'              , COLUMN_SIZE_ID   , 'Id');
  InitGridColumnsL(2, grid_grade_dupla, viewGradeDu.DataSet, 'name'            , COLUMN_SIZE_SHORT, 'Tipo');
  InitGridColumnsL(3, grid_grade_dupla, viewGradeDu.DataSet, 'value_name'      , COLUMN_SIZE_SHORT, 'Valor');
  InitGridColumnsC(4, grid_grade_dupla, viewGradeDu.DataSet, 'has_product'     , 36               , 'Tem Prod');
  InitGridColumnsR(5, grid_grade_dupla, viewGradeDu.DataSet, 'value_id'        , COLUMN_SIZE_ID   , 'Valor Id');
  viewGradeDu.DataSet.IndexFieldNames := 'id;value_name';

  //hw
  grid_grade_hw.DataSource := viewGradeHw.DataSourceOOP;
  for I := 0 to viewGradeHw.DataSet.FieldCount - 1 do viewGradeHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_grade_hw, viewGradeHw.DataSet, 'cod_grade'    , COLUMN_SIZE_ID   , 'Id');
  InitGridColumnsL(1, grid_grade_hw, viewGradeHw.DataSet, 'descricao'    , COLUMN_SIZE_SHORT, 'Descrição 1');
  InitGridColumnsL(2, grid_grade_hw, viewGradeHw.DataSet, 'descricao1'   , COLUMN_SIZE_SHORT, 'Descrição 2');
  InitGridColumnsL(3, grid_grade_hw, viewGradeHw.DataSet, 'tipo_ec'      , COLUMN_SIZE_ID   , 'ec Tipo 1');
  InitGridColumnsL(4, grid_grade_hw, viewGradeHw.DataSet, 'descricao_ec' , COLUMN_SIZE_SHORT, 'E-ecommerce Valor 1');
  InitGridColumnsL(5, grid_grade_hw, viewGradeHw.DataSet, 'tipo_ec1'     , COLUMN_SIZE_ID   , 'ec Tipo 2');
  InitGridColumnsL(6, grid_grade_hw, viewGradeHw.DataSet, 'descricao_ec1', COLUMN_SIZE_SHORT, 'E-ecommerce Valor 2');
  ResolverFiltroGrades;

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
  InitGridColumnsR(0, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'cod_grade'      , COLUMN_SIZE_ID    , 'Id');
  InitGridColumnsR(1, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'descricao'      , COLUMN_SIZE_SHORT - 1, 'Descrição 1');
  InitGridColumnsR(2, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'descricao1'     , COLUMN_SIZE_SHORT - 1, 'Descrição 2');
  InitGridColumnsC(3, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'gr_adicionadas' , 24                  , 'Adc');
  InitGridColumnsL(4, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'tipo_ec'        , COLUMN_SIZE_ID       , 'ec Tipo 1');
  InitGridColumnsL(5, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'descricao_ec'   , COLUMN_SIZE_SHORT - 1, 'E-ecommerce Valor 1');
  InitGridColumnsL(6, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'tipo_ec1'       , COLUMN_SIZE_ID      , 'ec Tipo 2');
  InitGridColumnsL(7, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'descricao_ec1'  , COLUMN_SIZE_SHORT - 1, 'E-ecommerce Valor 2');
  InitGridColumnsL(8, grid_variacoes_produto_hw, viewVariantHw.DataSet, 'id_commerce'    , COLUMN_SIZE_ID +20,'E-commerce Id');
  ResolverFiltroVariacoes(0, '', '', '', '');

  //produtos
  //THwHack_DbGrid.Create(grid_produto);
  grid_produto.DataSource := viewProduto.DataSourceOOP;
  for I := 0 to viewProduto.DataSet.FieldCount - 1 do viewProduto.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_produto, viewProduto.DataSet, 'sel'           , 18                , '...');
  InitGridColumnsR(1, grid_produto, viewProduto.DataSet, 'id'            , COLUMN_SIZE_ID    , 'Id');
  InitGridColumnsL(2, grid_produto, viewProduto.DataSet, 'name'          , COLUMN_SIZE_STRING, 'Produto');
  InitGridColumnsL(3, grid_produto, viewProduto.DataSet, 'category_name' , COLUMN_SIZE_SHORT , 'Categoria');
  InitGridColumnsC(4, grid_produto, viewProduto.DataSet, 'has_variation' , 44                , 'Tem Var');
  InitGridColumnsC(5, grid_produto, viewProduto.DataSet, 'has_image'     , 44                , 'Tem Img');
  InitGridColumnsR(6, grid_produto, viewProduto.DataSet, 'grupo_prod'    , COLUMN_SIZE_ID    , 'Hw Grupo');
  InitGridColumnsR(7, grid_produto, viewProduto.DataSet, 'cod_prod'      , COLUMN_SIZE_ID    , 'Hw Cod');
  InitGridColumnsL(8, grid_produto, viewProduto.DataSet, 'num_fab_prod'  , COLUMN_SIZE_ID    , 'Hw Num Fab');
  InitGridColumnsL(9, grid_produto, viewProduto.DataSet, 'descr_prod'    , COLUMN_SIZE_STRING, 'Hw Produto');
  viewProduto.DataSet.IndexFieldNames := 'name';

  DBTextDesrTrayProduto.DataSource := viewProduto.DataSourceOOP;
  DBTextDesrTrayProduto.DataField := 'NAME';

  DBTextDesrProdutoHw.DataSource   := viewProdutoHw.DataSourceOOP;
  DBTextDesrProdutoHw.DataField    := 'DESCR_PROD';

  DBTextGrupoProdutoHw.DataSource  := viewProdutoHw.DataSourceOOP;
  DBTextGrupoProdutoHw.DataField   := 'GRUPO_PROD';

  DBTextCodigoProdutoHw.DataSource := viewProdutoHw.DataSourceOOP;
  DBTextCodigoProdutoHw.DataField  := 'COD_PROD';

  DBTextIdTrayProduto.DataSource   := viewProduto.DataSourceOOP;
  DBTextIdTrayProduto.DataField    := 'ID';

  grid_produto_hw.DataSource := viewProdutoHw.DataSourceOOP;
  for I := 0 to viewProdutoHw.DataSet.FieldCount - 1 do viewProdutoHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_produto_hw, viewProdutoHw.DataSet, 'grupo_prod'   , COLUMN_SIZE_ID    , 'Cod Grupo');
  InitGridColumnsR(1, grid_produto_hw, viewProdutoHw.DataSet, 'cod_prod'     , COLUMN_SIZE_ID    , 'Cod Prod');
  InitGridColumnsL(2, grid_produto_hw, viewProdutoHw.DataSet, 'num_fab_prod' , COLUMN_SIZE_ID    , 'Num Fab Prod');
  InitGridColumnsL(3, grid_produto_hw, viewProdutoHw.DataSet, 'descr_prod'   , COLUMN_SIZE_STRING, 'Produto');
  InitGridColumnsC(4, grid_produto_hw, viewProdutoHw.DataSet, 'tem_grade'    , 44                , 'Grade');
  InitGridColumnsC(5, grid_produto_hw, viewProdutoHw.DataSet, 'hw_image'     , 44                , 'Imagem');
  InitGridColumnsR(6, grid_produto_hw, viewProdutoHw.DataSet, 'id_commerce'  , COLUMN_SIZE_ID +20, 'E-commerce Id');
  //InitGridColumnsL(6, grid_produto_hw, viewProdutoHw.DataSet, 'cod_categoria', COLUMN_SIZE_ID   , 'Categoria');
  //ResolverFiltroProdutos;
  //ResolverFiltroProdutosTray();

  //kitprodutos
  //THwHack_DbGrid.Create(grid_kitproduto);
  grid_kitproduto.DataSource := viewKitProduto.DataSourceOOP;
  for I := 0 to viewKitProduto.DataSet.FieldCount - 1 do viewKitProduto.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_kitproduto, viewKitProduto.DataSet, 'sel'           , 18                , '...');
  InitGridColumnsR(1, grid_kitproduto, viewKitProduto.DataSet, 'id'            , COLUMN_SIZE_ID    , 'Id');
  InitGridColumnsL(2, grid_kitproduto, viewKitProduto.DataSet, 'name'          , COLUMN_SIZE_STRING, 'Kit');
  InitGridColumnsL(3, grid_kitproduto, viewKitProduto.DataSet, 'category_name' , COLUMN_SIZE_SHORT , 'Categoria');
  InitGridColumnsC(4, grid_kitproduto, viewKitProduto.DataSet, 'has_image'     , 44                , 'Tem Img');
  InitGridColumnsR(5, grid_kitproduto, viewKitProduto.DataSet, 'codigo_kit'    , COLUMN_SIZE_ID    , 'Hw Cod');
  InitGridColumnsL(6, grid_kitproduto, viewKitProduto.DataSet, 'descricao_kit' , COLUMN_SIZE_STRING, 'Hw Kit');
  //InitGridColumnsL(8, grid_kitproduto, viewKitProduto.DataSet, 'cod_categoria' , COLUMN_SIZE_ID + 4, 'Hw Categoria');
  viewKitProduto.DataSet.IndexFieldNames := 'name';

  DBTextDesrTrayKitProduto.DataSource := viewKitProduto.DataSourceOOP;
  DBTextDesrTrayKitProduto.DataField := 'NAME';

  DBTextIdTrayKitProduto.DataSource := viewKitProduto.DataSourceOOP;
  DBTextIdTrayKitProduto.DataField := 'ID';

  grid_kitproduto_hw.DataSource := viewKitProdutoHw.DataSourceOOP;
  for I := 0 to viewKitProdutoHw.DataSet.FieldCount - 1 do viewKitProdutoHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_kitproduto_hw, viewKitProdutoHw.DataSet, 'codigo_kit'   , COLUMN_SIZE_ID    , 'Cod Kit');
  InitGridColumnsL(1, grid_kitproduto_hw, viewKitProdutoHw.DataSet, 'descricao_kit', COLUMN_SIZE_SHORT , 'Kit');
  InitGridColumnsC(2, grid_kitproduto_hw, viewKitProdutoHw.DataSet, 'hw_image'     , 44                , 'Imagem');
  InitGridColumnsR(3, grid_kitproduto_hw, viewKitProdutoHw.DataSet, 'id_commerce'  , COLUMN_SIZE_ID +20, 'E-commerce Id');
  //InitGridColumnsL(6, grid_kitproduto_hw, viewKitProdutoHw.DataSet, 'cod_categoria', COLUMN_SIZE_ID   , 'Categoria');
  //ResolverFiltroKitProdutos;
  //ResolverFiltroKitProdutosTray();

  //produtos do kit
//  THwHack_DbGrid.Create(grid_produtos_kitproduto_tray);
  grid_produtos_kitproduto_tray.DataSource := viewProductKit.DataSourceOOP;
  for I := 0 to viewProductKit.DataSet.FieldCount - 1 do viewProductKit.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsC(0, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'sel'                   , 18                , '..');
  InitGridColumnsR(1, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'id'                    , COLUMN_SIZE_ID    , 'Id');
  InitGridColumnsR(2, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'product_id'            , COLUMN_SIZE_ID    , 'Id Prod');
  InitGridColumnsL(3, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'product_name'          , COLUMN_SIZE_SHORT, 'Produto');
  InitGridColumnsC(4, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'product_has_variation' , 44                , 'Tem Var');
  InitGridColumnsR(5, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'grupo_prod'            , COLUMN_SIZE_ID    , 'Hw Grupo');
  InitGridColumnsR(6, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'cod_prod'              , COLUMN_SIZE_ID    , 'Hw Cod');
  InitGridColumnsL(7, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'num_fab_prod'          , COLUMN_SIZE_ID    , 'Hw Num Fab');
  InitGridColumnsL(8, grid_produtos_kitproduto_tray, viewProductKit.DataSet, 'descr_prod'            , COLUMN_SIZE_STRING, 'Hw Prod');
  viewProductKit.DataSet.IndexFieldNames := 'id';

  grid_produtos_kitproduto_hw.DataSource := viewProductKitHw.DataSourceOOP;
  for I := 0 to viewProductKitHw.DataSet.FieldCount - 1 do viewProductKitHw.DataSet.Fields[I].Visible :=  False;
  InitGridColumnsR(0, grid_produtos_kitproduto_hw, viewProductKitHw.DataSet, 'grupo_prod'      , COLUMN_SIZE_ID    , 'Cod Grupo');
  InitGridColumnsR(1, grid_produtos_kitproduto_hw, viewProductKitHw.DataSet, 'cod_prod'        , COLUMN_SIZE_ID    , 'Cod Prod');
  InitGridColumnsL(2, grid_produtos_kitproduto_hw, viewProductKitHw.DataSet, 'num_fab_prod'    , COLUMN_SIZE_ID +20, 'Num Fab');
  InitGridColumnsL(3, grid_produtos_kitproduto_hw, viewProductKitHw.DataSet, 'descr_prod'      , COLUMN_SIZE_SHORT , 'Produto');
  InitGridColumnsC(4, grid_produtos_kitproduto_hw, viewProductKitHw.DataSet, 'tem_grade'       , 44                , 'Grade');
  InitGridColumnsL(5, grid_produtos_kitproduto_hw, viewProductKitHw.DataSet, 'id_commerce'     , COLUMN_SIZE_ID +20, 'E-commerce Id');
  InitGridColumnsL(6, grid_produtos_kitproduto_hw, viewProductKitHw.DataSet, 'id_commerce_prod', COLUMN_SIZE_ID +28, 'E-commerce Id Prod');
//  InitGridColumnsL(4, grid_produtos_kitproduto_hw, viewProductKitHw.DataSet, 'name'          , COLUMN_SIZE_SHORT, 'E-commerce Nome');
  ResolverFiltroProdutosKit;

  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
    'Processo "PRO399" HABILITAR GRADE/VARIACAO DUPLA TRAY/SISTEMA';

  imgInformation2.Hint := imgInformation.Hint;
  imgInformation3.Hint := imgInformation.Hint;
  imgInformation4.Hint := imgInformation.Hint;
  imgInformation5.Hint := imgInformation.Hint;
  imgInformation6.Hint := imgInformation.Hint;

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

  //marcas
  bt_marca_check_all.Enabled       := False;
  bt_marca_uncheck_all.Enabled     := False;
  bt_marca_goto_sistema.Enabled    := False;

  bt_marca_pag.Enabled             := False;
  bt_marca_pag_primeira.Enabled    := False;
  bt_marca_pag_anterior.Enabled    := False;
  bt_marca_pag_proxima.Enabled     := False;
  bt_marca_pag_ultima.Enabled      := False;

  bt_marca_vinc.Enabled            := False;
  bt_marca_vinc_remove.Enabled     := False;
  bt_marca_goto_tray.Enabled       := False;

  //categoria
  bt_categ_check_all.Enabled       := False;
  bt_categ_uncheck_all.Enabled     := False;
  bt_categ_goto_sistema.Enabled    := False;

  bt_categ_pag.Enabled             := False;
  bt_categ_pag_primeira.Enabled    := False;
  bt_categ_pag_anterior.Enabled    := False;
  bt_categ_pag_proxima.Enabled     := False;
  bt_categ_pag_ultima.Enabled      := False;

  bt_categ_vinc.Enabled            := False;
  bt_categ_vinc_remove.Enabled     := False;
  bt_categ_goto_tray.Enabled       := False;

  // kitprodutos
  bt_kitproduto_link.Enabled          := False;
  bt_kitproduto_goto_sistema.Enabled  := False;
  bt_kitproduto_imagens_tray.Enabled  := False;
  bt_kitproduto_produtos.Enabled      := False;

  bt_kitprod_pag.Enabled             := False;
  bt_kitprod_pag_primeira.Enabled    := False;
  bt_kitprod_pag_anterior.Enabled    := False;
  bt_kitprod_pag_proxima.Enabled     := False;
  bt_kitprod_pag_ultima.Enabled      := False;

  bt_kitproduto_vinc.Enabled         := False;
  bt_kitproduto_vinc_remove.Enabled  := False;
  bt_kitproduto_goto_tray.Enabled    := False;
  bt_kitproduto_imagens_hw.Enabled   := False;

  // grades
  bt_grade_check_all.Enabled         := False;
  bt_grade_uncheck_all.Enabled       := False;
  bt_grade_check_all_dupla.Enabled   := False;
  bt_grade_uncheck_all_dupla.Enabled := False;

  bt_grade_vinc1.Enabled             := False;
  bt_grade_vinc1_remove.Enabled      := False;

  ck_grade_dupla.Enabled             := servico.Auditor.Habilitar.Table(tbGrade).InibirMensagens.InibirAuditoria.Processo('PRO399').Permitido;

  ck_grade_dupla.Checked             := RegistroWin.Read(Self.ClassName, ck_grade_dupla.Name, ck_grade_dupla.Checked and ck_grade_dupla.Enabled);
  pn_grade_grid_dupla.Visible        := ck_grade_dupla.Checked;

  ts_grades_variacao_prod.TabVisible := false;
  ts_kits_produto_prod.TabVisible    := false;
  ts_log.TabVisible                  := false;
  ts_browser.TabVisible              := false;
  ts_db_marcas.TabVisible            := false;
  ts_db_categorias.TabVisible        := false;
  ts_db_produtos.TabVisible          := false;
  ts_db_kitprodutos.TabVisible       := false;
  ts_Imagens.TabVisible              := false;

  me_texto_cons_produto.Clear;
  me_texto_cons_kitproduto.Clear;
  me_texto_cons_marca.Clear;
  me_texto_cons_categoria.Clear;

  ts_produtos.Show;

  servico.ConcederPermissoesTabelasViews;
end;

procedure TFrmTrayCadastros.grid_categ_hwDrawColumnCell(Sender: TObject;
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

procedure TFrmTrayCadastros.grid_categ_trayDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure TFrmTrayCadastros.grid_gradeDrawColumnCell(Sender: TObject;
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
  end;
end;

procedure TFrmTrayCadastros.grid_grade_duplaDrawColumnCell(Sender: TObject;
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

procedure TFrmTrayCadastros.grid_kitprodutoCellClick(Column: TColumn);
begin
  if UpperCase(Column.FieldName) = 'SEL' then
    marcaDesmacarLinhaKitProduto;
end;

procedure TFrmTrayCadastros.grid_kitprodutoDrawColumnCell(Sender: TObject;
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

  if (Column.Field.Dataset.FieldbyName('CODIGO_KIT').AsInteger <= 0) then
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

procedure TFrmTrayCadastros.grid_kitprodutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    marcaDesmacarLinhaKitProduto;
end;

procedure TFrmTrayCadastros.grid_kitproduto_hwDrawColumnCell(Sender: TObject;
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

procedure TFrmTrayCadastros.grid_marcaDrawColumnCell(Sender: TObject;
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

  if (Column.Field.Dataset.FieldbyName('COD_MARCA').AsInteger <= 0) then
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

  if (Column.Field.Dataset.FieldbyName('COD_MARCA').AsInteger <= 0) then
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
end;

procedure TFrmTrayCadastros.grid_marca_hwDrawColumnCell(Sender: TObject;
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
      TDBGrid(sender).canvas.brush.color := pnCatSemVincEC.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if (Column.Field.Dataset.FieldbyName('ID_COMMERCE').AsInteger <= 0) then
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
end;

procedure TFrmTrayCadastros.grid_produtoCellClick(Column: TColumn);
begin
  if UpperCase(Column.FieldName) = 'SEL' then
    marcaDesmacarLinhaProduto;
end;

procedure TFrmTrayCadastros.grid_produtoDrawColumnCell(Sender: TObject;
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

procedure TFrmTrayCadastros.grid_produtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    marcaDesmacarLinhaProduto;
end;

procedure TFrmTrayCadastros.grid_produtos_kitproduto_hwDrawColumnCell(
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
end;

procedure TFrmTrayCadastros.grid_produtos_kitproduto_trayCellClick(
  Column: TColumn);
begin
  if UpperCase(Column.FieldName) = 'SEL' then
    marcaDesmacarLinhaProdKitProduto;
end;

procedure TFrmTrayCadastros.grid_produtos_kitproduto_trayDrawColumnCell(Sender: TObject;
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
  else if LowerCase(Column.FieldName) = 'product_has_variation' then
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

procedure TFrmTrayCadastros.grid_produtos_kitproduto_trayKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    marcaDesmacarLinhaProdKitProduto;
end;

procedure TFrmTrayCadastros.grid_produto_hwDrawColumnCell(Sender: TObject;
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

procedure TFrmTrayCadastros.grid_variacoes_produto_hwDrawColumnCell(
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

  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  if LowerCase(Column.FieldName) = 'gr_adicionadas' then
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

procedure TFrmTrayCadastros.grid_variacoes_produto_trayDrawColumnCell(
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

procedure TFrmTrayCadastros.Log(Text: string);
begin
  ed_log.Lines.Add(Text);
end;

procedure TFrmTrayCadastros.marcaDesmacarLinhaKitProduto;
begin
  if grid_kitproduto.DataSource.dataSet.IsEmpty then
    exit;

  grid_kitproduto.DataSource.dataSet.Edit;
  if grid_kitproduto.DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    grid_kitproduto.DataSource.dataSet.FieldByName('SEL').AsString := ''
  else
    grid_kitproduto.DataSource.dataSet.FieldByName('SEL').AsString := 'S';
  grid_kitproduto.DataSource.dataSet.Post;
end;

procedure TFrmTrayCadastros.marcaDesmacarLinhaProduto;
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

procedure TFrmTrayCadastros.marcaDesmacarLinhaProdKitProduto;
begin
  if grid_produtos_kitproduto_tray.DataSource.dataSet.IsEmpty then
    exit;

  grid_produtos_kitproduto_tray.DataSource.dataSet.Edit;
  if grid_produtos_kitproduto_tray.DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    grid_produtos_kitproduto_tray.DataSource.dataSet.FieldByName('SEL').AsString := ''
  else
    grid_produtos_kitproduto_tray.DataSource.dataSet.FieldByName('SEL').AsString := 'S';
  grid_produtos_kitproduto_tray.DataSource.dataSet.Post;
end;

procedure TFrmTrayCadastros.rb_categ_todasClick(Sender: TObject);
begin
  ResolverFiltroCategorias;
end;

procedure TFrmTrayCadastros.rb_marca_semvincClick(Sender: TObject);
begin
  ResolverFiltroMarcas;
end;

procedure TFrmTrayCadastros.ResolverFiltroCategorias(pTipo: string);
begin
  if (pTipo = 'S') or (pTipo = 'A') then
    pn_categ_tray_top.Caption := 'Lista de Categorias do E-commerce - [ Sem registros ]';

  if (pTipo = 'S') or (pTipo = 'A') then
    pn_categ_hw_top.Caption   := 'Lista de Categorias do Sistema - [ Sem registros ]';

  if dbAllCategorias = nil then
    Exit;

  if not dbAllCategorias.Active then
    Exit;

  if (pTipo = 'S') or (pTipo = 'A') then
    viewCategoria.prepare_loop();
  if (pTipo = 'S') or (pTipo = 'A') then
    viewCategoriaHw.prepare_loop();
  try
    if (pTipo = 'S') or (pTipo = 'A') then
    begin
      viewCategoria.DataSet.EmptyDataSet;
      viewCategoria.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TCategoryMescladaHw>(servico.ResolverCategorias(categorias, '', 0, []), viewCategoria.DataSet));
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

    if (pTipo = 'S') or (pTipo = 'A') then
      if viewCategoria.Count > 0 then
        pn_categ_tray_top.Caption := 'Lista de Categorias do E-commerce ' + IfThen(Length(paramsCategoriaTray.params) > 0, ' - Filtro por ' + paramsCategoriaTray.tipo);;

    if (pTipo = 'S') or (pTipo = 'A') then
      if viewCategoriaHw.Count > 0 then
        pn_categ_hw_top.Caption   := 'Lista de Categorias do Sistema ' + paramsCategoriaHw.tipo;

    if (pTipo = 'S') or (pTipo = 'A') then
      viewCategoria.prepare_loop_done();

    if (pTipo = 'S') or (pTipo = 'A') then
      viewCategoriaHw.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.ResolverFiltroCategoriasTray;
begin
  pn_categ_tray_top.Caption := 'Lista de Categorias do E-commerce - [ Sem registros ]';

  viewCategoria.prepare_loop();
  try
    viewCategoria.DataSet.EmptyDataSet;
    viewCategoria.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TCategoryMescladaHw>(servico.ResolverCategorias(categorias, '', 0, []), viewCategoria.DataSet));

  finally
    bt_categ_check_all.Enabled        := (viewCategoria.Count > 0);
    bt_categ_check_all.Enabled        := (viewCategoria.Count > 0);
    bt_categ_vinc.Enabled             := (viewCategoria.Count > 0) and (viewCategoriaHw.Count > 0);
    bt_categ_vinc_remove.Enabled      := bt_categ_vinc.Enabled;
    bt_categ_pag.Enabled              := (consultaCategoria <> nil) and (consultaCategoria.paging <> nil) and (consultaCategoria.paging.total > 0) and (consultaCategoria.paging.total > Length(categorias));
    bt_categ_pag_primeira.Enabled     := (bt_categ_pag.Enabled) and (consultaCategoria.paging.page > 1);
    bt_categ_pag_anterior.Enabled     := (bt_categ_pag.Enabled) and (consultaCategoria.paging.page > 1);
    bt_categ_pag_proxima.Enabled      := (bt_categ_pag.Enabled) and (consultaCategoria.paging.page < Ceil(consultaCategoria.paging.total / consultaCategoria.paging.limit));
    bt_categ_pag_ultima.Enabled       := (bt_categ_pag.Enabled) and (consultaCategoria.paging.page < Ceil(consultaCategoria.paging.total / consultaCategoria.paging.limit));

    if bt_categ_pag.Enabled then
    begin
      if (consultaCategoria.paging.page = 1) and (Ceil(consultaCategoria.paging.total / consultaCategoria.paging.limit) < 1) then
        bt_categ_pag.Caption := Format('Pag %d de %d', [consultaCategoria.paging.page, 1])
      else
        bt_categ_pag.Caption := Format('Pag %d de %d', [consultaCategoria.paging.page,
           Ceil(consultaCategoria.paging.total / consultaCategoria.paging.limit)]);
    end
    else
      bt_categ_pag.Caption := '';

    if bt_categ_pag.Enabled then//(consultaCategoria <> nil) and (consultaCategoria.paging <> nil) then
      bt_categ_pag.Caption := Format('%d reg de %d', [Length(categorias), consultaCategoria.paging.total]) +
                             IfThen(bt_categ_pag.Caption <> '', sLineBreak + bt_categ_pag.Caption)
    else
      bt_categ_pag.Caption := Format('%d registro%s', [Length(categorias), IfThen(Length(categorias) > 1, 's')]) +
                             IfThen(bt_categ_pag.Caption <> '', sLineBreak + bt_categ_pag.Caption);

    if viewCategoria.Count > 0 then
      pn_categ_tray_top.Caption := 'Lista de Categorias do E-commerce' + IfThen(Length(paramsCategoriaTray.params) > 0, ' - Filtro por ' + paramsCategoriaTray.tipo);

    viewCategoria.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.ResolverFiltroGrades;
var
  grade: TProperty;
  value: TPropertyValue;
  propValue: TPropertyWithValueHw;
  propValues: TArray<TPropertyWithValueHw>;
  I: Integer;

begin
  pn_grade_tray_top.Caption       := 'Lista de Caracteristicas do E-commerce - [ Sem registros ]';
  pn_grade_tray_top_dupla.Caption := 'Lista de Caracteristicas do E-commerce - [ Sem registros ]';
  pn_grade_hw_top.Caption         := 'Lista de Grades do Sistema - [ Sem registros ]';

  if dbAllGrades = nil then
    Exit;

  if not dbAllGrades.Active then
    Exit;

  viewGrade.prepare_loop();
  viewGradeDu.prepare_loop();
  viewGradeHw.prepare_loop();
  try
    viewGrade.DataSet.EmptyDataSet;
    viewGradeDu.DataSet.EmptyDataSet;
    viewGradeHw.DataSet.EmptyDataSet;

    dbAllGrades.DataSet.First;
    while not dbAllGrades.DataSet.Eof do
    begin
      viewGradeHw.DataSet.Append;
      for I := 0 to viewGradeHw.DataSet.FieldCount - 1 do
        viewGradeHw.DataSet.Fields[I].Value := dbAllGrades.DataSet.FieldByName(viewGradeHw.DataSet.Fields[I].FieldName).Value;

      viewGradeHw.DataSet.Post;

      dbAllGrades.DataSet.Next;
    end;

    viewGrade.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TPropertyWithValueHw>(grades, viewGrade.DataSet));
    viewGradeDu.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TPropertyWithValueHw>(grades, viewGradeDu.DataSet));

  finally
    bt_grade_vinc1.Enabled             := (viewGrade.Count > 0) and (viewGradeHw.Count > 0);
    bt_grade_vinc1_remove.Enabled      := bt_grade_vinc1.Enabled;
    bt_grade_vinc2.Enabled             := bt_grade_vinc1.Enabled and pn_grade_grid_dupla.Visible;
    bt_grade_vinc2_remove.Enabled      := bt_grade_vinc1.Enabled and pn_grade_grid_dupla.Visible;
    bt_grade_cad.Enabled               := viewGrade.Count > 0;
    bt_grade_check_all.Enabled         := bt_grade_cad.Enabled;
    bt_grade_uncheck_all.Enabled       := bt_grade_cad.Enabled;
    bt_grade_check_all_dupla.Enabled   := bt_grade_cad.Enabled;
    bt_grade_uncheck_all_dupla.Enabled := bt_grade_cad.Enabled;

    if viewGrade.Count > 0 then
    begin
      pn_grade_tray_top.Caption       := 'Lista de Caracteristicas do E-commerce';
      pn_grade_tray_top_dupla.Caption := 'Lista de Caracteristicas do E-commerce';
    end;
    if viewGradeHw.Count > 0 then
      pn_grade_hw_top.Caption         := 'Lista de Grades do Sistema';

    viewGrade.prepare_loop_done();
    viewGradeDu.prepare_loop_done();
    viewGradeHw.prepare_loop_done();
  end;
end;



procedure TFrmTrayCadastros.ResolverFiltroKitProdutos(pTipo: string);
begin
  if (pTipo = 'E') or (pTipo = 'A') then
    pn_kitproduto_tray_top.Caption := 'Lista de Kits de Produto do E-commerce - [ Sem registros ]';
  if (pTipo = 'S') or (pTipo = 'A') then
    pn_kitproduto_hw_top.Caption   := 'Lista de Kits de Produto do Sistema - [ Sem registros ]';

  if dbAllKitProdutos = nil then
    Exit;

  if not dbAllKitProdutos.Active then
    Exit;

  if (pTipo = 'E') or (pTipo = 'A') then
    viewKitProduto.prepare_loop();
  if (pTipo = 'S') or (pTipo = 'A') then
    viewKitProdutoHw.prepare_loop();
  try
    if (pTipo = 'E') or (pTipo = 'A') then
    begin
      viewKitProduto.DataSet.EmptyDataSet;
      viewKitProduto.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TKitsProdHw>(servico.ResolverKitProdutos(kitprodutos, categorias) , viewKitProduto.DataSet));
    end;

    if (pTipo = 'S') or (pTipo = 'A') then
    begin
      viewKitProdutoHw.DataSet.EmptyDataSet;
      viewKitProdutoHw.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TKitsProdHw>(servico.ResolverKitProdutosHw(dbAllKitProdutos, kitprodutos), viewKitProdutoHw.DataSet));
    end;

  finally
    bt_kitproduto_vinc.Enabled        := (viewKitProduto.Count > 0) and (viewKitProdutoHw.Count > 0);
    bt_kitproduto_vinc_remove.Enabled := bt_kitproduto_vinc.Enabled;
    bt_kitproduto_imagens_hw.Enabled  := bt_kitproduto_vinc.Enabled;

    if (pTipo = 'E') or (pTipo = 'A') then
      if viewKitProduto.Count > 0 then
        pn_kitproduto_tray_top.Caption := 'Lista de Kits de Produto do E-commerce' + IfThen(Length(paramsKitProdTray.params) > 0, ' - Filtro por ' + paramsKitProdTray.tipo);

    if (pTipo = 'S') or (pTipo = 'A') then
      if viewKitProdutoHw.Count > 0 then
        pn_kitproduto_hw_top.Caption   := 'Lista de Kits de Produto do Sistema ' + paramsKitProdHw.tipo;

    if (pTipo = 'E') or (pTipo = 'A') then
      viewKitProduto.prepare_loop_done();
    if (pTipo = 'S') or (pTipo = 'A') then
      viewKitProdutoHw.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.ResolverFiltroKitProdutosHw;
begin

end;

procedure TFrmTrayCadastros.ResolverFiltroKitProdutosTray;
begin
  pn_kitproduto_tray_top.Caption := 'Lista de Kits de Produto do E-commerce - [ Sem registros ]';

  viewKitProduto.prepare_loop();
  try
    viewKitProduto.DataSet.EmptyDataSet;
    viewKitProduto.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TKitsProdHw>(servico.ResolverKitProdutos(kitprodutos, categorias), viewKitProduto.DataSet));

  finally
    bt_kitproduto_vinc.Enabled          := (viewKitProduto.Count > 0) and (viewKitProdutoHw.Count > 0);
    bt_kitproduto_vinc_remove.Enabled   := bt_kitproduto_vinc.Enabled;
    bt_kitprod_pag.Enabled              := (consultaKitProd <> nil) and (consultaKitProd.paging <> nil) and (consultaKitProd.paging.total > 0) and (consultaKitProd.paging.total > Length(kitprodutos));
    bt_kitprod_pag_primeira.Enabled     := (bt_kitprod_pag.Enabled) and (consultaKitProd.paging.page > 1);
    bt_kitprod_pag_anterior.Enabled     := (bt_kitprod_pag.Enabled) and (consultaKitProd.paging.page > 1);
    bt_kitprod_pag_proxima.Enabled      := (bt_kitprod_pag.Enabled) and (consultaKitProd.paging.page < Ceil(consultaKitProd.paging.total / consultaKitProd.paging.limit));
    bt_kitprod_pag_ultima.Enabled       := (bt_kitprod_pag.Enabled) and (consultaKitProd.paging.page < Ceil(consultaKitProd.paging.total / consultaKitProd.paging.limit));
    bt_kitproduto_link.Enabled          := viewKitProduto.Count > 0;
    bt_kitproduto_imagens_tray.Enabled  := viewKitProduto.Count > 0;
    bt_kitproduto_produtos.Enabled      := viewKitProduto.Count > 0;

    if bt_kitprod_pag.Enabled then
    begin
      if (consultaKitProd.paging.page = 1) and (Ceil(consultaKitProd.paging.total / consultaKitProd.paging.limit) < 1) then
        bt_kitprod_pag.Caption := Format('Pag %d de %d', [consultaKitProd.paging.page, 1])
      else
        bt_kitprod_pag.Caption := Format('Pag %d de %d', [consultaKitProd.paging.page,
           Ceil(consultaKitProd.paging.total / consultaKitProd.paging.limit)]);
    end
    else
      bt_kitprod_pag.Caption := '';

    if bt_kitprod_pag.Enabled then//(consultaKitProd <> nil) and (consultaKitProd.paging <> nil) then
      bt_kitprod_pag.Caption := Format('%d reg de %d', [Length(kitprodutos), consultaKitProd.paging.total]) +
                             IfThen(bt_kitprod_pag.Caption <> '', sLineBreak + bt_kitprod_pag.Caption)
    else
      bt_kitprod_pag.Caption := Format('%d registro%s', [Length(kitprodutos), IfThen(Length(kitprodutos) > 1, 's')]) +
                             IfThen(bt_kitprod_pag.Caption <> '', sLineBreak + bt_kitprod_pag.Caption);

    if viewKitProduto.Count > 0 then
      pn_kitproduto_tray_top.Caption := 'Lista de Kits de Produto do E-commerce' + IfThen(Length(paramsKitProdTray.params) > 0, ' - Filtro por ' + paramsKitProdTray.tipo);

    viewKitProduto.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.rb_produto_vincClick(Sender: TObject);
begin
  ResolverFiltroProdutos;
end;

procedure TFrmTrayCadastros.ResolverFiltroMarcas(pTipo: string);
begin
  if (pTipo = 'S') or (pTipo = 'A') then
    pn_marca_tray_top.Caption := 'Lista de Marcas do E-commerce - [ Sem registros ]';

  if (pTipo = 'S') or (pTipo = 'A') then
    pn_marca_hw_top.Caption   := 'Lista de Marcas do Sistema - [ Sem registros ]';

  if dbAllMarcas = nil then
    Exit;

  if not dbAllMarcas.Active then
    Exit;

  if (pTipo = 'S') or (pTipo = 'A') then
    viewMarca.prepare_loop();
  if (pTipo = 'S') or (pTipo = 'A') then
    viewMarcaHw.prepare_loop();
  try
    if (pTipo = 'S') or (pTipo = 'A') then
    begin
      viewMarca.DataSet.EmptyDataSet;
      viewMarca.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TBrandHw>(servico.ResolverMarcas(marcas), viewMarca.DataSet));
    end;

    if (pTipo = 'S') or (pTipo = 'A') then
    begin
      viewMarcaHw.DataSet.EmptyDataSet;
      viewMarcaHw.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TBrandHw>(servico.ResolverMarcasHw(dbAllMarcas, marcas), viewMarcaHw.DataSet));
    end;

  finally
    bt_marca_vinc.Enabled        := (viewMarca.Count > 0) and (viewMarcaHw.Count > 0);
    bt_marca_vinc_remove.Enabled := bt_marca_vinc.Enabled;
    bt_marca_cad.Enabled         := viewMarca.Count > 0;
    bt_marca_check_all.Enabled   := bt_marca_cad.Enabled;
    bt_marca_uncheck_all.Enabled := bt_marca_cad.Enabled;
    bt_marca_produtos.Enabled    := bt_marca_cad.Enabled;

    if (pTipo = 'S') or (pTipo = 'A') then
      if viewMarca.Count > 0 then
        pn_marca_tray_top.Caption := 'Lista de Marcas do E-commerce' + IfThen(Length(paramsMarcaTray.params) > 0, ' - Filtro por ' + paramsMarcaTray.tipo);

    if (pTipo = 'S') or (pTipo = 'A') then
      if viewMarcaHw.Count > 0 then
        pn_marca_hw_top.Caption   := 'Lista de Marcas do Sistema ' + paramsMarcaHw.tipo;

    if (pTipo = 'S') or (pTipo = 'A') then
      viewMarca.prepare_loop_done();

    if (pTipo = 'S') or (pTipo = 'A') then
      viewMarcaHw.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.ResolverFiltroMarcasTray;
begin
  pn_marca_tray_top.Caption := 'Lista de Marcas do E-commerce - [ Sem registros ]';

  viewMarca.prepare_loop();
  try
    viewMarca.DataSet.EmptyDataSet;
    viewMarca.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TBrandHw>(servico.ResolverMarcas(marcas), viewMarca.DataSet));

  finally
    bt_marca_check_all.Enabled        := (viewMarca.Count > 0);
    bt_marca_check_all.Enabled        := (viewMarca.Count > 0);
    bt_marca_vinc.Enabled             := (viewMarca.Count > 0) and (viewMarcaHw.Count > 0);
    bt_marca_vinc_remove.Enabled      := bt_marca_vinc.Enabled;
    bt_marca_pag.Enabled              := (consultaMarca <> nil) and (consultaMarca.paging <> nil) and (consultaMarca.paging.total > 0) and (consultaMarca.paging.total > Length(marcas));
    bt_marca_pag_primeira.Enabled     := (bt_marca_pag.Enabled) and (consultaMarca.paging.page > 1);
    bt_marca_pag_anterior.Enabled     := (bt_marca_pag.Enabled) and (consultaMarca.paging.page > 1);
    bt_marca_pag_proxima.Enabled      := (bt_marca_pag.Enabled) and (consultaMarca.paging.page < Ceil(consultaMarca.paging.total / consultaMarca.paging.limit));
    bt_marca_pag_ultima.Enabled       := (bt_marca_pag.Enabled) and (consultaMarca.paging.page < Ceil(consultaMarca.paging.total / consultaMarca.paging.limit));

    if bt_marca_pag.Enabled then
    begin
      if (consultaMarca.paging.page = 1) and (Ceil(consultaMarca.paging.total / consultaMarca.paging.limit) < 1) then
        bt_marca_pag.Caption := Format('Pag %d de %d', [consultaMarca.paging.page, 1])
      else
        bt_marca_pag.Caption := Format('Pag %d de %d', [consultaMarca.paging.page,
           Ceil(consultaMarca.paging.total / consultaMarca.paging.limit)]);
    end
    else
      bt_marca_pag.Caption := '';

    if bt_marca_pag.Enabled then//(consultaMarca <> nil) and (consultaMarca.paging <> nil) then
      bt_marca_pag.Caption := Format('%d reg de %d', [Length(marcas), consultaMarca.paging.total]) +
                             IfThen(bt_marca_pag.Caption <> '', sLineBreak + bt_marca_pag.Caption)
    else
      bt_marca_pag.Caption := Format('%d registro%s', [Length(marcas), IfThen(Length(marcas) > 1, 's')]) +
                             IfThen(bt_marca_pag.Caption <> '', sLineBreak + bt_marca_pag.Caption);

    if viewMarca.Count > 0 then
      pn_marca_tray_top.Caption := 'Lista de Marcas do E-commerce' + IfThen(Length(paramsMarcaTray.params) > 0, ' - Filtro por ' + paramsMarcaTray.tipo);

    viewMarca.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.bt_marca_vincClick(Sender: TObject);
var
  Id: string;
  marca: TBrand;
  vincular: Boolean;
begin
  if viewMarcaHw.IsEmpty then
  begin
    ShowAtencao('Sem marcas no banco de dados');
    Exit;
  end;

  try
    Id := viewMarca.fstr('id');
    if viewMarca.prepare_loop('sel = ''S''').Count > 1 then
    begin
      ShowAtencao('Selecione 1 registro de cada vez para vincular');
      Exit;
    end
    else if viewMarca.Count = 1 then
      Id := viewMarca.fstr('id');

  finally
    viewMarca.prepare_loop_done();
  end;

  vincular := False;
  for marca in marcas do
    if TryCond(vincular, marca.id.Trim.Equals(Id)) then
      Break;

  with servico.Auditor.Alterar.Table(tbMarca).Processo('PRO389')
    .Key(viewMarcaHw.fstr('cod_marca'))
    .Msg('%d %s', [viewMarcaHw.fint('cod_marca'), viewMarcaHw.fstr('descricao_marca')]) do
    if not Permitido then
      Exit;

  if viewMarca.fint('cod_marca') > 0 then
  begin
    ShowAtencao('Categoria do E-Commerce selecionada está vinculado a uma categoria do sistema.' +#13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  if viewMarcaHw.fint('id_commerce') > 0 then
  begin
    ShowAtencao('Categoria do sistema está vinculada a uma categoria do E-Commerce.' + #13 + #13 +
      'Favor remover o vínculo antes de continuar');
    Exit;
  end;

  if vincular and
    (ShowConfirmacao('Deseja mesmo vincular essa marca?') = ID_YES) and
    (servico.VincularMarca(marca, viewMarcaHw.fint('cod_marca'))) then
  begin
    if paramsMarcaTray.tipo = 'Demanda' then
      bt_marca_consulta_demandaClick(Sender)
    else
      bt_marca_consulta_todosClick(Sender);
  end;
end;

procedure TFrmTrayCadastros.bt_marca_vinc_removeClick(Sender: TObject);
begin
  if viewMarcaHw.IsEmpty then
    Exit;

  if viewMarcaHw.fint('id_commerce') = 0 then
  begin
    ShowAtencao('Não existe marca vinculada do e-commerce para o registro selecionado');
    Exit;
  end;

  with servico.Auditor.Alterar.Table(tbMarca).Processo('PRO390')
    .Key(viewMarcaHw.fstr('cod_marca'))
    .Msg('Sistema %d %s', [viewMarcaHw.fint('cod_marca'), viewMarcaHw.fstr('descricao_marca')]) do
    if not Permitido then
      Exit;

  if ShowConfirmacao('Deseja mesmo desvincular essa marca?') = ID_YES then
    if servico.DesvincularMarca(viewMarcaHw.fint('cod_marca')) then
    begin
      if paramsMarcaTray.tipo = 'Demanda' then
        bt_marca_consulta_demandaClick(Sender)
      else
        bt_marca_consulta_todosClick(Sender);
    end;
end;

procedure TFrmTrayCadastros.ResolverFiltroProdutos(pTipo: string);
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
        pn_produto_tray_top.Caption := 'Lista de Produtos do E-commerce' + IfThen(Length(paramsProdTray.params) > 0, ' - Filtro por ' + paramsProdTray.tipo);

    if (pTipo = 'S') or (pTipo = 'A') then
      if viewProdutoHw.Count > 0 then
        pn_produto_hw_top.Caption   := 'Lista de Produtos do Sistema ' + paramsProdHw.tipo;

    if (pTipo = 'E') or (pTipo = 'A') then
      viewProduto.prepare_loop_done();

    if (pTipo = 'S') or (pTipo = 'A') then
      viewProdutoHw.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.ResolverFiltroProdutosKit;
var
  productkit: TProductKit;
  I: Integer;
begin
  pn_produtos_kitproduto_tray_top.Caption := 'Lista de Produtos do Kit do E-commerce - [ Sem registros ]';
  pn_produtos_kitproduto_hw_top.Caption   := 'Lista de Produtos do Kit do Sistema - [ Sem registros ]';

  if dbAllProductsKit = nil then
    Exit;

  if not dbAllProductsKit.Active then
    Exit;

  viewProductKit.prepare_loop();
  viewProductKitHw.prepare_loop();
  try
    viewProductKit.DataSet.EmptyDataSet;
    viewProductKitHw.DataSet.EmptyDataSet;

    viewProductKit.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TProductKitHw>(servico.ResolverProdutosKits(productskit, produtos), viewProductKit.DataSet));
    viewProductKitHw.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TProductKitHw>(servico.ResolverProdutosKitsHw(productskit), viewProductKitHw.DataSet));

  finally
    bt_produtos_kitprodutos_cad.Enabled  := false;//(viewProductKit.Count > 0);

    if viewProductKit.Count > 0 then
      pn_produtos_kitproduto_tray_top.Caption := 'Lista de Produtos do Kit do E-commerce';
    if viewProductKitHw.Count > 0 then
      pn_produtos_kitproduto_hw_top.Caption   := 'Lista de Produtos do Kit do Sistema';

    viewProductKit.prepare_loop_done();
    viewProductKitHw.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.ResolverFiltroProdutosTray;
begin
  pn_produto_tray_top.Caption := 'Lista de Produtos do E-commerce - [ Sem registros ]';

  viewProduto.prepare_loop();
  try
    viewProduto.DataSet.EmptyDataSet;
    viewProduto.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TProductHw>(servico.ResolverProdutos(produtos, categorias), viewProduto.DataSet));

  finally
    bt_produto_vinc.Enabled          := (viewProduto.Count > 0) and (viewProdutoHw.Count > 0);
    bt_produto_vinc_remove.Enabled   := bt_produto_vinc.Enabled;
    bt_prod_pag.Enabled              := (consultaProd <> nil) and (consultaProd.paging <> nil) and (consultaProd.paging.total > 0) and (consultaProd.paging.total > Length(produtos));
    bt_prod_pag_primeira.Enabled     := (bt_prod_pag.Enabled) and (consultaProd.paging.page > 1);
    bt_prod_pag_anterior.Enabled     := (bt_prod_pag.Enabled) and (consultaProd.paging.page > 1);
    bt_prod_pag_proxima.Enabled      := (bt_prod_pag.Enabled) and (consultaProd.paging.page < Ceil(consultaProd.paging.total / consultaProd.paging.limit));
    bt_prod_pag_ultima.Enabled       := (bt_prod_pag.Enabled) and (consultaProd.paging.page < Ceil(consultaProd.paging.total / consultaProd.paging.limit));
    bt_produto_link.Enabled          := viewProduto.Count > 0;
    bt_produto_imagens_tray.Enabled  := viewProduto.Count > 0;
    bt_produto_variacao_tray.Enabled := viewProduto.Count > 0;

    if bt_prod_pag.Enabled then                               
    begin  
      if (consultaProd.paging.page = 1) and (Ceil(consultaProd.paging.total / consultaProd.paging.limit) < 1) then
        bt_prod_pag.Caption := Format('Pag %d de %d', [consultaProd.paging.page, 1])
      else
        bt_prod_pag.Caption := Format('Pag %d de %d', [consultaProd.paging.page,
           Ceil(consultaProd.paging.total / consultaProd.paging.limit)]);
    end
    else
      bt_prod_pag.Caption := '';

    if bt_prod_pag.Enabled then//(consultaProd <> nil) and (consultaProd.paging <> nil) then
      bt_prod_pag.Caption := Format('%d reg de %d', [Length(produtos), consultaProd.paging.total]) +
                             IfThen(bt_prod_pag.Caption <> '', sLineBreak + bt_prod_pag.Caption)
    else
      bt_prod_pag.Caption := Format('%d registro%s', [Length(produtos), IfThen(Length(produtos) > 1, 's')]) +
                             IfThen(bt_prod_pag.Caption <> '', sLineBreak + bt_prod_pag.Caption);

    if viewProduto.Count > 0 then
      pn_produto_tray_top.Caption := 'Lista de Produtos do E-commerce' + IfThen(Length(paramsProdTray.params) > 0, ' - Filtro por ' + paramsProdTray.tipo);

    viewProduto.prepare_loop_done();
  end;
end;

procedure TFrmTrayCadastros.ResolverFiltroVariacoes(idproduto: Integer;
  tipoec: string; tipoec1: string;
  tipoerp: string; tipoerp1: string);
var
  variant: TVariant2;
  sku: TSku;
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

    viewVariant.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TVariantHw2>(servico.ResolverVariacoes(variants) , viewVariant.DataSet));
    viewVariantHw.DataSet := TClientDataSet(THwDbConverter.ObjectToDataSet<TVariantHw2>(servico.ResolverVariacoesHw(variants, tipoec, tipoec1), viewVariantHw.DataSet));

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

function TFrmTrayCadastros.retornaKiloBytes(ValorAtual: real): string;
var
  resultado : real;
begin
  resultado := ((ValorAtual / 1024) / 1024);
  Result    := FormatFloat('0.000 KBs', resultado);
end;

function TFrmTrayCadastros.retornaPorcentagem(ValorMaximo,
  ValorAtual: real): string;
var
  resultado: Real;
begin
  resultado := ((ValorAtual * 100) / ValorMaximo);
  Result    := FormatFloat('0%', resultado);
end;

procedure TFrmTrayCadastros.bt_categoria_cons_ecClick(Sender: TObject);
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

procedure TFrmTrayCadastros.VincularProdutos;
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
      if produto.id = Id.ToString then
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

procedure TFrmTrayCadastros._GravaConfiguracoesInteger(NomeVariavel: string;
  Valor: Integer);
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

function TFrmTrayCadastros._LerConfiguracoesRegistroInteger(
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

procedure TFrmTrayCadastros.bt_produto_imagens_hwClick(Sender: TObject);
begin
  if viewProdutoHw.IsEmpty then
    Exit;

  DBTextDesrTray2.DataSource := viewProdutoHw.DataSourceOOP;
  DBTextDesrTray2.DataField := 'DESCR_PROD';

  DBTextIdTray2.DataSource := viewProdutoHw.DataSourceOOP;
  DBTextIdTray2.DataField := 'ID_COMMERCE';

  ExibirImagensProduto(servico.ResolverProdutoHw(viewProdutoHw, produtos));
end;

procedure TFrmTrayCadastros.bt_produto_imagens_trayClick(Sender: TObject);
var
  id: string;
  prod: TProduct;
  prodHw: TProductHw;
begin
  if viewProduto.IsEmpty then
    Exit;

  id := viewProduto.fstr('id');

  for prod in produtos do
    if id = prod.id then
    begin
      groupbox_img_produto.Caption := 'Produto';
      pnImgProduto.Caption := 'Imagens do Produto no E-Commerce / Sistema';

      DBTextDesrTray2.DataSource := viewProduto.DataSourceOOP;
      DBTextDesrTray2.DataField := 'NAME';

      DBTextIdTray2.DataSource := viewProduto.DataSourceOOP;
      DBTextIdTray2.DataField := 'ID';

      ExibirImagensProduto(servico.ResolverProduto(prod));
      Break;
    end;
end;

procedure TFrmTrayCadastros.bt_marca_pagClick(Sender: TObject);
var
  pag: string;
  pagInt: Integer;
  totalPag: Int64;
begin
  if consultaMarca = nil then
    Exit
  else if consultaMarca.paging = nil then
    Exit;

  if consultaMarca.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaMarca.paging.total / consultaMarca.paging.limit);

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
      ConsultaMarcaTray(pagInt);
  end
  else
    ShowErro('Página informada inválida');
end;

procedure TFrmTrayCadastros.bt_marca_pag_anteriorClick(Sender: TObject);
begin
  if consultaMarca = nil then
    Exit
  else if consultaMarca.paging = nil then
    Exit;

  if (consultaMarca.paging.total = 0) or (consultaMarca.paging.page <= 1) then
    Exit;

  ConsultaMarcaTray(consultaMarca.paging.page - 1);
end;

procedure TFrmTrayCadastros.bt_marca_pag_primeiraClick(Sender: TObject);
begin
  ConsultaMarcaTray();
end;

procedure TFrmTrayCadastros.bt_marca_pag_proximaClick(Sender: TObject);
var
  totalPag: Int64;
begin
  if consultaMarca = nil then
    Exit
  else if consultaMarca.paging = nil then
    Exit;

  if consultaMarca.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaMarca.paging.total / consultaMarca.paging.limit);

  if (consultaMarca.paging.page + 1) > totalPag then
    Exit;

  ConsultaMarcaTray(consultaMarca.paging.page + 1);
end;

procedure TFrmTrayCadastros.bt_marca_pag_ultimaClick(Sender: TObject);
var
  totalPag: Int64;
begin
 if consultaMarca = nil then
    Exit
  else if consultaMarca.paging = nil then
    Exit;

  if consultaMarca.paging.total = 0 then
    Exit;

  totalPag := Ceil(consultaMarca.paging.total / consultaMarca.paging.limit);

  ConsultaMarcaTray(totalPag);
end;

procedure TFrmTrayCadastros.bt_marca_produtosClick(Sender: TObject);
var
  id, ids: string;
begin
  id := viewMarca.fstr('id');
  viewMarca.prepare_loop('sel = ''S''');
  try
    ids := '';

    if viewMarca.Count = 0 then
      viewMarca.filterStr('id = %s', [id.QuotedString]);

    while not viewMarca.DataSet.Eof do
    begin
      ids := ids + IfThen(viewMarca.DataSet.RecNo = 1, 'brand_id=', ',') + viewMarca.fstr('id');

      viewMarca.DataSet.Next;
    end;

  finally
    viewMarca.prepare_loop_done();
  end;

  if ids.Trim.IsEmpty then
    Exit;

  //consulta de produtos com base nas marcas selecionadas
  paramsProdTray.params := [ids];
  paramsProdTray.tipo := 'Marca';

  ConsultaProdutoTray(1);
//  produtos := servico.GetList<TProduct>('products', 'Products', ['sort=id_asc', ids]);

//  dbAllProdutos := servico.GetProdutos(False);

//  ResolverFiltroProdutos;

  if Length(produtos) > 0 then
    pg_principal.ActivePage := ts_produtos
  else
    ShowAtencao('Sem produtos para a seleção')
end;

end.




