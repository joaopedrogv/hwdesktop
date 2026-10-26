unit uCadNFCe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DB, DBCtrls, uEditMoeda, uEditHw, uDataSet_OOP,
  Contnrs, CheckLst, uClassesNFConsumidor, MunicipioEtdUnit, OperacaoInternaEtdUnit,
  ComboBoxMunicipiosFrameUnit, ComboBoxOpInternasFrameUnit;

const
  msgNaoPermiteAlteracao = 'Não permite alterações';

type
  RDadosForm = record
    PesquisaData: Boolean;
    Campo, DataIni, DataFim, Conteudo, Condicao: string;
    EmCadastro{, EmEmissaoExterna}: Boolean;
    CodNFCeAtiva: Integer;
    AbaCadastr: TTabSheet;
  end;

  RPrint_Control = record
    QCNormal : Integer; //Qtde Caracteres fonte normal
    QCNegrito: Integer; //Qtde Caracteres fonte negrito
    QLinhas  : Integer; //Qtde de linhas
    QCRodape : Integer;
  end;

  RItem_Control_Aplicar_Desconto_Modalidade = (adProximoItem, adNFCeAtual, adSempre);

  RItem_Control_Aplicar_Desconto = record
    Modalidade: RItem_Control_Aplicar_Desconto_Modalidade;
    Percentual, Valor: Double;
    IdNFCe: Integer;
  end;

  RPagamento_Control = record
    Alteracao: Boolean;
    Valor: Double;
    IndPag, NumAutorizacao: string;
    Bandeira: Integer;
  end;

  RTotal_Control = record
    vprod, vdesc, vseg, vfrete, voutro, vnf: Double;
  end;

  CampoCalculo = (ccQtde, ccValorUnt, ccValorTot, ccUnidade, ccOutro);

  RItem_Control = record
    Alteracao: Boolean;
    Error    : string;
    Codigo   : string;
    Descricao: string;
    Qtde     : Double;
    ValorUn  : Double;
    ValorTot : Double;
    ValorDes : Double;
    PercDes  : Double;
    ValorLiq : Double;
    AplicaDes: RItem_Control_Aplicar_Desconto;
    Unidade  : string;
    Fator    : Double;
    UndsVnd  : TStrings;
  end;

  Tnfce_emitir_from_pedvenda = function (ANPed: Integer; ATipo: string): Boolean;

  THackWinControl = class(TWinControl);
  THackCustomGrid = class(TCustomGrid);
  TfrmCadNFCe = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    scrollCadastro: TScrollBox;
    pageDadosNFCe: TPageControl;
    tsCabecalho: TTabSheet;
    tsItens: TTabSheet;
    tsTotais: TTabSheet;
    tsInfCompl: TTabSheet;
    SpeedButton59: TSpeedButton;
    pnNFCeItens: TPanel;
    Label77: TLabel;
    pn03GridItens: TPanel;
    Panel21: TPanel;
    gridItens: TDBGrid;
    pn01CodDescricao: TPanel;
    Panel22: TPanel;
    pnCaptionProdServ: TPanel;
    Panel24: TPanel;
    Panel14: TPanel;
    Panel26: TPanel;
    pn04BotoeETotalLiq: TPanel;
    Label78: TLabel;
    Label79: TLabel;
    Panel31: TPanel;
    btExcluirItem: TBitBtn;
    pn02ValoresItens: TPanel;
    pnIT01Qtde: TPanel;
    Panel16: TPanel;
    pnIT03VlUn: TPanel;
    Panel37: TPanel;
    pnIT05VlTot: TPanel;
    Panel23: TPanel;
    pnIT07DescP: TPanel;
    Panel27: TPanel;
    pnIT09DescR: TPanel;
    Panel30: TPanel;
    pnIT12: TPanel;
    pnIT11TotLiq: TPanel;
    Panel39: TPanel;
    Panel44: TPanel;
    btSalvarItem: TBitBtn;
    edDescrProd: TEdit;
    edQtde: TEditHw;
    edVlUn: TEditHw;
    edVlTot: TEditHw;
    edDescP: TEditHw;
    edDescR: TEditHw;
    edVlLiq: TEditHw;
    edCodigo: TEditFiscal;
    btCancelarItem: TBitBtn;
    Panel15: TPanel;
    DBEdit51: TDBEdit;
    Panel17: TPanel;
    Label80: TLabel;
    DBEdit50: TDBEdit;
    Label81: TLabel;
    Label85: TLabel;
    DBEdit55: TDBEdit;
    Label86: TLabel;
    DBEdit56: TDBEdit;
    Label87: TLabel;
    DBEdit57: TDBEdit;
    Label88: TLabel;
    DBEdit58: TDBEdit;
    Label89: TLabel;
    DBEdit59: TDBEdit;
    Label90: TLabel;
    DBEdit60: TDBEdit;
    Label91: TLabel;
    Panel32: TPanel;
    DBEdit26: TDBEdit;
    btAtalhoItens: TBitBtn;
    btAtalhoCabecalho: TBitBtn;
    btAtalhoValores: TBitBtn;
    btAtalhoFechamento: TBitBtn;
    btAtalhoEmitir: TBitBtn;
    tsFechamento: TTabSheet;
    Panel18: TPanel;
    pn01Fechamento: TPanel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    pn02Fechamento: TPanel;
    Panel29: TPanel;
    Panel34: TPanel;
    gridPagamentos: TDBGrid;
    pnDadosPagamento: TPanel;
    lkCtrlFormPagamento: TDBLookupComboBox;
    Label97: TLabel;
    Label98: TLabel;
    edValorPagamento: TEditHw;
    btSalvarPagamento: TBitBtn;
    btCancelaPagamento: TBitBtn;
    Label99: TLabel;
    pnBotoesDadosPagamento: TPanel;
    Label100: TLabel;
    btAlterarItem: TBitBtn;
    Panel77: TPanel;
    tsOutrosFormsModal: TTabSheet;
    pageOutrosFormsModal: TPageControl;
    tsOFM_SelecionaProdutos: TTabSheet;
    tsOFM_SelecionaServicos: TTabSheet;
    pnSelecionaProduto: TPanel;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    Label36: TLabel;
    gridSelecionaProdutos: TDBGrid;
    pnSeqPreco: TPanel;
    Panel10: TPanel;
    DBLookupComboBox4: TDBLookupComboBox;
    pnSelecionaServico: TPanel;
    Label37: TLabel;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    Panel12: TPanel;
    btAssumeSelecionaServico: TBitBtn;
    Panel8: TPanel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    edDescontoTotal: TDBEdit;
    btDescontoCabecalhoDesabilitar: TSpeedButton;
    btDescontoCabecalhoHabilitar: TSpeedButton;
    Label38: TLabel;
    edNumAutorizacao: TEdit;
    btAlterarPagamento: TBitBtn;
    btExcluirPagamento: TBitBtn;
    lkBandeira: TDBLookupComboBox;
    Label39: TLabel;
    lbFormaPagamento: TLabel;
    lkFormaPagamento: TDBLookupComboBox;
    Panel20: TPanel;
    Panel25: TPanel;
    Panel28: TPanel;
    Label40: TLabel;
    DBMemo2: TDBMemo;
    DBMemo1: TDBMemo;
    Panel33: TPanel;
    Panel35: TPanel;
    DBEdit14: TDBEdit;
    Panel36: TPanel;
    edPagamentValorTotal: TEditHw;
    edValorQueFaltaPagamento: TEditHw;
    Panel38: TPanel;
    pnTopCadastro: TPanel;
    Panel40: TPanel;
    PopupMenu3: TPopupMenu;
    AtualizarDadosFiscaisdosItens1: TMenuItem;
    ReabirNFCparaCorrees1: TMenuItem;
    pnMenu: TPanel;
    Panel41: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Panel42: TPanel;
    Label48: TLabel;
    Panel43: TPanel;
    Panel45: TPanel;
    SpeedButton9: TSpeedButton;
    Panel46: TPanel;
    DBEdit25: TDBEdit;
    tsOutros: TTabSheet;
    pageOutros: TPageControl;
    tsImpressao: TTabSheet;
    pnEmissao: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Label49: TLabel;
    btEmissaoVoltar: TBitBtn;
    Panel51: TPanel;
    edEmissaoEmails: TEdit;
    Panel47: TPanel;
    ckEmissaoEnviarEmail: TCheckBox;
    BitBtn7: TBitBtn;
    Panel50: TPanel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Label52: TLabel;
    CheckBox2: TCheckBox;
    Panel52: TPanel;
    CheckBox6: TCheckBox;
    Panel53: TPanel;
    DBCheckBox1: TDBCheckBox;
    tsOFM_Destinatario: TTabSheet;
    pnDadosDest: TPanel;
    Label50: TLabel;
    DBEdit30: TDBEdit;
    Label51: TLabel;
    DBEdit31: TDBEdit;
    Label53: TLabel;
    DBEdit32: TDBEdit;
    Label54: TLabel;
    DBEdit33: TDBEdit;
    Label55: TLabel;
    DBEdit34: TDBEdit;
    Label56: TLabel;
    DBEdit35: TDBEdit;
    Label57: TLabel;
    DBEdit36: TDBEdit;
    Label58: TLabel;
    DBEdit37: TDBEdit;
    Label59: TLabel;
    DBEdit38: TDBEdit;
    Label60: TLabel;
    DBEdit39: TDBEdit;
    Label61: TLabel;
    DBEdit40: TDBEdit;
    tsOFM_dbgridLookUp: TTabSheet;
    dbgridLookUp: TDBGrid;
    Panel55: TPanel;
    BitBtn8: TBitBtn;
    btExcluirDest: TBitBtn;
    SpeedButton13: TSpeedButton;
    XML1: TMenuItem;
    NFCeAutorizacao1: TMenuItem;
    NFCeCancelamento1: TMenuItem;
    NFCeInutilizacao1: TMenuItem;
    NFCeAutorizacao1Visualizar1: TMenuItem;
    NFCeAutorizacao1Salvar1: TMenuItem;
    SaveDialog1: TSaveDialog;
    NFCeCancelamento1Visualizar1: TMenuItem;
    NFCeInutilizacao1Visualizar1: TMenuItem;
    NFCeCancelamento1Salvar1: TMenuItem;
    NFCeInutilizacao1Salvar1: TMenuItem;
    ckContingenciaPendentes: TCheckBox;
    Label62: TLabel;
    lkindpag: TDBLookupComboBox;
    ts_nfce_v2: TTabSheet;
    pn_v2: TPanel;
    GridPanel2: TGridPanel;
    pn_descr_v2: TPanel;
    Panel56: TPanel;
    lb_prod_serv_v2: TLabel;
    ed_codigo_v2: TEdit;
    Panel57: TPanel;
    GridPanel3: TGridPanel;
    Panel60: TPanel;
    Label64: TLabel;
    Panel61: TPanel;
    Panel59: TPanel;
    Label66: TLabel;
    GridPanel4: TGridPanel;
    Panel58: TPanel;
    Label65: TLabel;
    Panel62: TPanel;
    ed_qtde_v2: TPanel;
    ed_vlun_v2: TPanel;
    ed_vltot_v2: TPanel;
    pn_print_container: TPanel;
    ts_nfce_v2_container: TTabSheet;
    PageControl2: TPageControl;
    ts_v2_cupom: TTabSheet;
    pn_v2_cupom: TPanel;
    re_print_rdp: TRichEdit;
    re_print: TRichEdit;
    re_print_cab: TRichEdit;
    re_print_cab_padding: TPanel;
    re_print_rdp_padding: TPanel;
    re_print_padding: TPanel;
    ts_v2_cons_prod: TTabSheet;
    GridPanel6: TGridPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    edEstoqueDisp: TEditHw;
    pnGrade: TPanel;
    Panel9: TPanel;
    edGrade: TPanel;
    pnGrade1: TPanel;
    Panel11: TPanel;
    edGrade1: TPanel;
    btAssumeSelecionaProduto: TBitBtn;
    pn_v2_cons_prod: TPanel;
    Panel78: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    ed_v2_cons_prod_estoqeu: TPanel;
    Panel89: TPanel;
    pn_v2_cons_prod_grade: TPanel;
    pn_v2_cons_prod_grade_2: TPanel;
    pn_v2_cons_prod_grade_1: TPanel;
    Panel79: TPanel;
    grid_v2_cons_prod: TDBGrid;
    ts_v2_selecionar_item: TTabSheet;
    pn_v2_selecao_item: TPanel;
    Panel67: TPanel;
    Panel75: TPanel;
    grid_v2_selecao_item: TDBGrid;
    ts_v2_exclusao_item: TTabSheet;
    pn_v2_exclusao_item: TPanel;
    ts_v2_menus: TTabSheet;
    pn_v2_menus: TPanel;
    ScrollBox4: TScrollBox;
    ts_v2_alteracao_item: TTabSheet;
    ScrollBox5: TScrollBox;
    Panel66: TPanel;
    DBText14: TDBText;
    Panel68: TPanel;
    Panel69: TPanel;
    DBText15: TDBText;
    Panel70: TPanel;
    GridPanel8: TGridPanel;
    Panel71: TPanel;
    Panel73: TPanel;
    DBText17: TDBText;
    Panel74: TPanel;
    Panel76: TPanel;
    DBText18: TDBText;
    Panel80: TPanel;
    Panel83: TPanel;
    Panel84: TPanel;
    pn_v2_alteracao_item: TPanel;
    ScrollBox6: TScrollBox;
    ts_v2_desconto_item: TTabSheet;
    pn_v2_desconto_item: TPanel;
    ScrollBox7: TScrollBox;
    GridPanel11: TGridPanel;
    Panel100: TPanel;
    Panel90: TPanel;
    ed_v2_alt_item_codigo: TMaskEdit;
    ed_v2_alt_item_descricao: TMaskEdit;
    Panel96: TPanel;
    Panel98: TPanel;
    ed_v2_alt_item_vl_un: TEditHw;
    ed_v2_alt_item_vl_tot: TEditHw;
    Panel103: TPanel;
    Panel105: TPanel;
    Panel107: TPanel;
    ed_v2_alt_item_desc_perc: TEditHw;
    ed_v2_alt_item_desc_val: TEditHw;
    ed_v2_alt_item_tot_liq: TEditHw;
    bt_v2_alteracao_item_salvar: TBitBtn;
    bt_v2_alteracao_item_cancela: TBitBtn;
    GridPanel7: TGridPanel;
    Panel111: TPanel;
    bt_v2_desconto_item_salvar: TBitBtn;
    bt_v2_desconto_item_cancela: TBitBtn;
    Label104: TLabel;
    Panel82: TPanel;
    ed_v2_desconto_item_modal: TEdit;
    Panel118: TPanel;
    Panel120: TPanel;
    ed_v2_desconto_item_perc: TEditHw;
    ed_v2_desconto_item_val: TEditHw;
    ts_v2_cons_cliente: TTabSheet;
    pn_v2_cons_cliente: TPanel;
    ScrollBox8: TScrollBox;
    GridPanel9: TGridPanel;
    bt_v2_cons_cliente_consultar: TBitBtn;
    bt_v2_cons_cliente_cancela: TBitBtn;
    Label105: TLabel;
    ed_v2_cons_cliente_opcao: TEdit;
    Panel88: TPanel;
    ed_v2_cons_cliente_texto_consulta: TMaskEdit;
    ts_v2_cons_cliente_selecionar: TTabSheet;
    pn_v2_cons_cliente_selecionar: TPanel;
    Panel92: TPanel;
    Panel93: TPanel;
    grid_v2_cons_cliente_selecionar: TDBGrid;
    Panel95: TPanel;
    lb_v2_cons_cliente_nao_encontrado: TLabel;
    ts_v2_cliente_avulso: TTabSheet;
    pn_v2_cliente_avulso: TPanel;
    ScrollBox9: TScrollBox;
    ts_v2_valores: TTabSheet;
    pn_v2_valores: TPanel;
    ScrollBox10: TScrollBox;
    GridPanel12: TGridPanel;
    Label117: TLabel;
    ed_v2_valores_vprod: TEditHw;
    Label119: TLabel;
    ed_v2_valores_vdesc: TEditHw;
    Label122: TLabel;
    ed_v2_valores_vseg: TEditHw;
    Label123: TLabel;
    ed_v2_valores_voutro: TEditHw;
    Label124: TLabel;
    bt_v2_valores_salvar: TBitBtn;
    bt_v2_valores_cancela: TBitBtn;
    Label120: TLabel;
    ed_v2_valores_tipodesc: TMaskEdit;
    Panel91: TPanel;
    ed_v2_valores_vnf: TEditHw;
    ts_v2_pag: TTabSheet;
    pn_v2_pag: TPanel;
    pn_v2_pag_title: TPanel;
    GridPanel13: TGridPanel;
    Label126: TLabel;
    lb_v2_pag_vnf: TLabel;
    Label125: TLabel;
    lb_v2_pag_pgto: TLabel;
    lb_v2_pag_trocofalta: TLabel;
    lb_v2_pag_falta: TLabel;
    Panel101: TPanel;
    grid_v2_pag_ctrl: TDBGrid;
    pn_v2_pag_valores: TGridPanel;
    Label118: TLabel;
    lb_v2_pag_valores_indpag: TLabel;
    lb_v2_pag_valores_num_aut: TLabel;
    lb_v2_pag_valores_band: TLabel;
    ed_v2_pag_valores_valor: TEditHw;
    ed_v2_pag_valores_indpag: TMaskEdit;
    ed_v2_pag_valores_num_aut: TMaskEdit;
    ed_v2_pag_valores_band: TMaskEdit;
    grid_v2_pag_pgtos: TDBGrid;
    pn_v2_pag_concluido: TPanel;
    Panel97: TPanel;
    ts_v2_contingencia: TTabSheet;
    ModoSimplificado1: TMenuItem;
    GridPanel10: TGridPanel;
    Label106: TLabel;
    ed_v2_cliente_avulso_cpf: TMaskEdit;
    Label107: TLabel;
    ed_v2_cliente_avulso_nome: TMaskEdit;
    Label108: TLabel;
    ed_v2_cliente_avulso_email: TMaskEdit;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    ed_v2_cliente_avulso_logr: TMaskEdit;
    ed_v2_cliente_avulso_num: TMaskEdit;
    Label112: TLabel;
    Label113: TLabel;
    ed_v2_cliente_avulso_bairro: TMaskEdit;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    ed_v2_cliente_avulso_uf: TMaskEdit;
    ed_v2_cliente_avulso_fone: TMaskEdit;
    ed_v2_cliente_avulso_cep: TMaskEdit;
    ed_v2_cliente_avulso_complemento: TMaskEdit;
    bt_v2_cliente_avulso_salvar: TBitBtn;
    bt_v2_cliente_avulso_cancela: TBitBtn;
    ed_v2_cliente_avulso_cidade: TDBLookupComboBox;
    pn_v2_menus_pag_1: TGridPanel;
    Label121: TLabel;
    Label128: TLabel;
    Label130: TLabel;
    Label132: TLabel;
    Label134: TLabel;
    Label136: TLabel;
    Label138: TLabel;
    Label140: TLabel;
    Label142: TLabel;
    bt_v2_menu_novo: TBitBtn;
    bt_v2_menu_consulta_nfce: TBitBtn;
    bt_v2_menu_excluir: TBitBtn;
    bt_v2_menu_alterar: TBitBtn;
    bt_v2_menu_desconto_item: TBitBtn;
    bt_v2_menu_consulta_cliente: TBitBtn;
    bt_v2_menu_valores_nf: TBitBtn;
    bt_v2_menu_pagamento: TBitBtn;
    bt_v2_menu_modo_completo: TBitBtn;
    Label127: TLabel;
    Label129: TLabel;
    bt_v2_menu_voltar_page_1: TBitBtn;
    Panel81: TPanel;
    pn_v2_contingencia: TPanel;
    ScrollBox11: TScrollBox;
    ts_v2_log_messages: TTabSheet;
    pn_v2_log_messages: TPanel;
    ed_v2_log_messages: TMemo;
    Panel63: TPanel;
    Label68: TLabel;
    lb_descr_v2: TLabel;
    pn_v2_contingencia_: TPanel;
    gpn_v2_contingencia: TGridPanel;
    Label67: TLabel;
    ed_v2_contingencia: TMaskEdit;
    pn_v2_contingencia_msg: TPanel;
    ed_v2_contingencia_msg: TMemo;
    bt_outras_nf: TSpeedButton;
    pmOutros: TPopupMenu;
    CadastrodeEmissor1: TMenuItem;
    ConfiguraesWebService1: TMenuItem;
    MonitorStatusServico1: TMenuItem;
    ts_rejeicoes_mensagens: TTabSheet;
    Panel54: TPanel;
    ed_rejeicoes: TMemo;
    ts_v2_log_rejeicoes: TTabSheet;
    pn_v2_log_rejeicoes: TPanel;
    ed_v2_log_rejeicoes: TMemo;
    Panel65: TPanel;
    Label69: TLabel;
    N1: TMenuItem;
    CriaratalhoNFCenareadeTrabalho1: TMenuItem;
    Label70: TLabel;
    bt_v2_menu_usar_orcamento: TBitBtn;
    ts_v2_selecionar_orcamento: TTabSheet;
    pn_v2_selecionar_orcamento: TPanel;
    ScrollBox12: TScrollBox;
    GridPanel1: TGridPanel;
    Label63: TLabel;
    Panel99: TPanel;
    Panel102: TPanel;
    Panel64: TPanel;
    Panel104: TPanel;
    Label71: TLabel;
    ed_v2_exclusao_item_opcao: TEditFiscal;
    ts_v2_sangsup: TTabSheet;
    pn_v2_sangsup: TPanel;
    ScrollBox13: TScrollBox;
    GridPanel5: TGridPanel;
    Label72: TLabel;
    ed_v2_sangsup_valor: TEditHw;
    bt_v2_sangsup_salvar: TBitBtn;
    bt_v2_sangsup_cancela: TBitBtn;
    Label93: TLabel;
    ed_v2_sangsup_opcao: TMaskEdit;
    pn_v2_menus_pag_2: TGridPanel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label131: TLabel;
    Label133: TLabel;
    bt_v2_menu_goto_page_1: TBitBtn;
    Label135: TLabel;
    Label137: TLabel;
    bt_v2_menu_voltar_page_2: TBitBtn;
    Panel85: TPanel;
    Label139: TLabel;
    Label141: TLabel;
    Label143: TLabel;
    Panel106: TPanel;
    Panel108: TPanel;
    bt_v2_menu_modo_reimprimir: TBitBtn;
    bt_v2_menu_log_rejeicoes: TBitBtn;
    bt_v2_menu_log_messages: TBitBtn;
    bt_v2_menu_movimento_operador: TBitBtn;
    bt_v2_menu_sangsup: TBitBtn;
    bt_v2_menu_goto_page_2: TBitBtn;
    ts_v2_movimento_operador: TTabSheet;
    pn_v2_movimento_operador: TPanel;
    ScrollBox14: TScrollBox;
    GridPanel14: TGridPanel;
    lb_pn_v2_movimento_operador_title: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Panel112: TPanel;
    Label152: TLabel;
    Label154: TLabel;
    Panel110: TPanel;
    ed_v2_movimento_operador_sang: TEditHw;
    Panel113: TPanel;
    ed_v2_movimento_operador_sup: TEditHw;
    Panel114: TPanel;
    ed_v2_movimento_operador_nfce_din: TEditHw;
    Panel115: TPanel;
    ed_v2_movimento_operador_nfce_out: TEditHw;
    Panel121: TPanel;
    ed_v2_movimento_operador_dia: TMaskEdit;
    Panel109: TPanel;
    ed_v2_movimento_operador_liq_geral: TEditHw;
    Panel117: TPanel;
    ed_v2_movimento_operador_liq_din: TEditHw;
    N2: TMenuItem;
    Menudeoperaesrpidas1: TMenuItem;
    bt_v2_movimento_operador_relatorio: TBitBtn;
    bt_v2_movimento_operador_abrirDia: TBitBtn;
    bt_v2_movimento_operador_voltar: TBitBtn;
    stsbar_nfce: TStatusBar;
    pn_img_prod: TPanel;
    img_prod: TImage;
    UsarOramento1: TMenuItem;
    ed_v2_selecionar_orcamento_numero: TEditFiscal;
    ServioWindows1: TMenuItem;
    SelecionarImpressoraPadrao1: TMenuItem;
    N3: TMenuItem;
    AbrirGaveta1: TMenuItem;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    gr_status: TGroupBox;
    Panel116: TPanel;
    gb_status: TCheckListBox;
    gr_situacao: TGroupBox;
    Panel119: TPanel;
    gb_situacao: TCheckListBox;
    gr_adicional: TGroupBox;
    Label144: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label153: TLabel;
    ed_ad_campo: TComboBox;
    ed_ad_valor: TMaskEdit;
    ed_ad_datafim: TMaskEdit;
    ed_ad_dataini: TMaskEdit;
    ed_ad_condicao: TComboBox;
    TabSheet4: TTabSheet;
    pn_vnd_sem_emit: TPanel;
    Label155: TLabel;
    grid_vnd_sem_emit: TDBGrid;
    Label156: TLabel;
    Splitter3: TSplitter;
    grid_vnd_sem_emit_itens: TDBGrid;
    Panel122: TPanel;
    Label157: TLabel;
    ed_vnd_loc: TEdit;
    sp_vnd_sem_emit_diatual: TSpeedButton;
    sp_vnd_sem_emit_novodia: TSpeedButton;
    sp_vnd_sem_emit_isentos: TSpeedButton;
    sp_vnd_sem_emit_conrib: TSpeedButton;
    sp_vnd_sem_emit_selecionar: TSpeedButton;
    sp_vnd_sem_emit_voltar: TSpeedButton;
    lb_vnd_sem_emit_data: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    ts_v2_vendedor: TTabSheet;
    pn_v2_vendedor: TPanel;
    ScrollBox15: TScrollBox;
    GridPanel15: TGridPanel;
    Label158: TLabel;
    pn_v2_nomevendedor: TPanel;
    Panel125: TPanel;
    ed_v2_codvendedor: TEditFiscal;
    Panel126: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    timerAutorizarAuto: TTimer;
    bt_v2_menu_vendedor: TBitBtn;
    ScrollBox16: TScrollBox;
    Panel4: TPanel;
    pn01Cabecalho: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    pn02Cabecalho: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    SpeedButton10: TSpeedButton;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    pn03Cabecalho: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    lbOperacao: TLabel;
    Label28: TLabel;
    Label23: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label29: TLabel;
    DBText3: TDBText;
    Label30: TLabel;
    Label31: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label32: TLabel;
    Label159: TLabel;
    DBEdit12: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    edNaturezaOperacao: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    pn04Cabecalho: TPanel;
    Label6: TLabel;
    Label22: TLabel;
    Label34: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    Label33: TLabel;
    DBText8: TDBText;
    Label35: TLabel;
    Vendedor: TLabel;
    btAlterarVendedor: TSpeedButton;
    DBEdit13: TDBEdit;
    Panel13: TPanel;
    Label41: TLabel;
    DBEdit15: TDBEdit;
    lookupVendedor: TDBLookupComboBox;
    DBEdit29: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Label160: TLabel;
    LogSincronizaoNFCeoffline1: TMenuItem;
    POSVirtual1: TMenuItem;
    bt_tef: TSpeedButton;
    lb_nfcelocal: TLabel;
    pn_inf_nfce_local: TPanel;
    pn_inf_nfce_local_v2: TPanel;
    pnIT02Unid: TPanel;
    Panel124: TPanel;
    edUndVnd: TComboBox;
    Panel72: TPanel;
    Panel123: TPanel;
    Panel127: TPanel;
    DBText16: TDBText;
    Panel128: TPanel;
    DBText9: TDBText;
    Panel129: TPanel;
    GridPanel16: TGridPanel;
    Panel94: TPanel;
    ed_v2_alt_item_qtde: TEditHw;
    Panel130: TPanel;
    ed_v2_alt_item_und: TComboBox;
    Dadoscertificado1: TMenuItem;
    N4: TMenuItem;
    CriarNFCecomplementar1: TMenuItem;
    popItensNFCe: TPopupMenu;
    Copiar1: TMenuItem;
    Label7: TLabel;
    DBEdit43: TDBEdit;
    Label15: TLabel;
    DBEdit44: TDBEdit;
    Label161: TLabel;
    DBEdit45: TDBEdit;
    Label162: TLabel;
    DBEdit46: TDBEdit;
    Label163: TLabel;
    DBEdit47: TDBEdit;
    Label164: TLabel;
    DBEdit48: TDBEdit;
    Label165: TLabel;
    DBEdit49: TDBEdit;
    Label166: TLabel;
    DBEdit54: TDBEdit;
    Label167: TLabel;
    DBEdit62: TDBEdit;
    Label168: TLabel;
    DBEdit67: TDBEdit;
    Label169: TLabel;
    DBEdit68: TDBEdit;
    Label170: TLabel;
    DBEdit69: TDBEdit;
    Label171: TLabel;
    DBEdit70: TDBEdit;
    Label172: TLabel;
    DBEdit71: TDBEdit;
    Label173: TLabel;
    DBEdit72: TDBEdit;
    Label174: TLabel;
    DBEdit73: TDBEdit;
    Label175: TLabel;
    DBEdit74: TDBEdit;
    Label176: TLabel;
    DBEdit75: TDBEdit;
    Label177: TLabel;
    DBEdit76: TDBEdit;
    tsOF_Frete: TTabSheet;
    pnFrete: TPanel;
    Panel132: TPanel;
    BitBtn17: TBitBtn;
    Label25: TLabel;
    Label26: TLabel;
    Label92: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit61: TDBEdit;
    Label178: TLabel;
    ComboBoxMunicipiosFrame2: TComboBoxMunicipiosFrame;
    N5: TMenuItem;
    Frete1: TMenuItem;
    ckIgnorarTributosRTC: TDBCheckBox;
    ComboBoxOpInternasFrame1: TComboBoxOpInternasFrame;
    pnFreteCampos: TPanel;
    edMemoAlertasSefaz: TMemo;
    Label27: TLabel;
    Label179: TLabel;
    procedure pageDadosNFCeChange(Sender: TObject);
    procedure Frete1Click(Sender: TObject);
    procedure gr_adicionalExit(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure CriarNFCecomplementar1Click(Sender: TObject);
    procedure Dadoscertificado1Click(Sender: TObject);
    procedure ed_v2_alt_item_undEnter(Sender: TObject);
    procedure ed_v2_alt_item_undChange(Sender: TObject);
    procedure edUndVndEnter(Sender: TObject);
    procedure edUndVndChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_tefClick(Sender: TObject);
    procedure POSVirtual1Click(Sender: TObject);
    procedure LogSincronizaoNFCeoffline1Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure bt_v2_menu_vendedorClick(Sender: TObject);
    procedure ed_v2_codvendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_v2_codvendedorChange(Sender: TObject);
    procedure timerAutorizarAutoTimer(Sender: TObject);
    procedure grid_vnd_sem_emitDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure ed_vnd_locKeyPress(Sender: TObject; var Key: Char);
    procedure ed_vnd_locChange(Sender: TObject);
    procedure sp_vnd_sem_emit_novodiaClick(Sender: TObject);
    procedure sp_vnd_sem_emit_diatualClick(Sender: TObject);
    procedure sp_vnd_sem_emit_conribClick(Sender: TObject);
    procedure sp_vnd_sem_emit_isentosClick(Sender: TObject);
    procedure sp_vnd_sem_emit_selecionarClick(Sender: TObject);
    procedure grid_vnd_sem_emitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sp_vnd_sem_emit_voltarClick(Sender: TObject);
    procedure ed_ad_campoExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ed_ad_condicaoExit(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure AbrirGaveta1Click(Sender: TObject);
    procedure SelecionarImpressoraPadrao1Click(Sender: TObject);
    procedure ServioWindows1Click(Sender: TObject);
    procedure bt_v2_cliente_avulso_cancelaClick(Sender: TObject);
    procedure ed_v2_selecionar_orcamento_numeroKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ed_v2_selecionar_orcamento_numeroKeyPress(Sender: TObject;
      var Key: Char);
    procedure UsarOramento1Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure bt_v2_movimento_operador_voltarClick(Sender: TObject);
    procedure bt_v2_movimento_operador_abrirDiaClick(Sender: TObject);
    procedure bt_v2_movimento_operador_relatorioClick(Sender: TObject);
    procedure Menudeoperaesrpidas1Click(Sender: TObject);
    procedure bt_v2_menu_movimento_operadorClick(Sender: TObject);
    procedure ed_v2_sangsup_valorExit(Sender: TObject);
    procedure bt_v2_menu_sangsupClick(Sender: TObject);
    procedure bt_v2_menu_goto_page_1Click(Sender: TObject);
    procedure bt_v2_menu_goto_page_2Click(Sender: TObject);
    procedure bt_v2_sangsup_salvarClick(Sender: TObject);
    procedure bt_v2_sangsup_cancelaClick(Sender: TObject);
    procedure ed_v2_sangsup_opcaoKeyPress(Sender: TObject; var Key: Char);
    procedure ed_v2_exclusao_item_opcaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure bt_v2_menu_usar_orcamentoClick(Sender: TObject);
    procedure CriaratalhoNFCenareadeTrabalho1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure pageDadosNFCeDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure ed_v2_log_rejeicoesChange(Sender: TObject);
    procedure ed_rejeicoesChange(Sender: TObject);
    procedure bt_v2_menu_log_rejeicoesClick(Sender: TObject);
    procedure MonitorStatusServico1Click(Sender: TObject);
    procedure CadastrodeEmissor1Click(Sender: TObject);
    procedure ConfiguraesWebService1Click(Sender: TObject);
    procedure bt_outras_nfClick(Sender: TObject);
    procedure bt_v2_menu_log_messagesClick(Sender: TObject);
    procedure ed_v2_contingenciaKeyPress(Sender: TObject; var Key: Char);
    procedure bt_v2_menu_modo_reimprimirClick(Sender: TObject);
    procedure ed_v2_cliente_avulso_cepEnter(Sender: TObject);
    procedure ed_v2_cliente_avulso_cidadeExit(Sender: TObject);
    procedure ed_v2_cliente_avulso_cepExit(Sender: TObject);
    procedure ModoSimplificado1Click(Sender: TObject);
    procedure bt_v2_menu_modo_completoClick(Sender: TObject);
    procedure bt_v2_menu_novoClick(Sender: TObject);
    procedure bt_v2_menu_pagamentoClick(Sender: TObject);
    procedure bt_v2_menu_valores_nfClick(Sender: TObject);
    procedure bt_v2_menu_consulta_clienteClick(Sender: TObject);
    procedure bt_v2_menu_desconto_itemClick(Sender: TObject);
    procedure bt_v2_menu_alterarClick(Sender: TObject);
    procedure bt_v2_menu_excluirClick(Sender: TObject);
    procedure bt_v2_menu_voltar_page_1Click(Sender: TObject);
    procedure grid_v2_pag_ctrlKeyPress(Sender: TObject; var Key: Char);
    procedure lkCtrlFormPagamentoEnter(Sender: TObject);
    procedure grid_v2_pag_ctrlEnter(Sender: TObject);
    procedure ed_v2_pag_valores_indpagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_v2_pag_pgtosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_v2_pag_valores_bandKeyPress(Sender: TObject; var Key: Char);
    procedure ed_v2_pag_valores_indpagKeyPress(Sender: TObject; var Key: Char);
    procedure ed_v2_pag_valores_valorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_v2_pag_ctrlKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_v2_valores_voutroExit(Sender: TObject);
    procedure ed_v2_valores_vsegExit(Sender: TObject);
    procedure ed_v2_valores_vdescExit(Sender: TObject);
    procedure ed_v2_valores_tipodescKeyPress(Sender: TObject; var Key: Char);
    procedure bt_v2_valores_salvarClick(Sender: TObject);
    procedure bt_v2_valores_cancelaClick(Sender: TObject);
    procedure bt_v2_desconto_item_cancelaClick(Sender: TObject);
    procedure bt_v2_alteracao_item_cancelaClick(Sender: TObject);
    procedure bt_v2_cons_cliente_cancelaClick(Sender: TObject);
    procedure bt_v2_cliente_avulso_salvarClick(Sender: TObject);
    procedure bt_v2_cons_cliente_consultarClick(Sender: TObject);
    procedure bt_v2_desconto_item_salvarClick(Sender: TObject);
    procedure bt_v2_alteracao_item_salvarClick(Sender: TObject);
    procedure grid_v2_cons_cliente_selecionarKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure grid_v2_cons_cliente_selecionarDblClick(Sender: TObject);
    procedure grid_v2_cons_prodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_v2_cons_prodDblClick(Sender: TObject);
    procedure ed_v2_cons_cliente_opcaoKeyPress(Sender: TObject; var Key: Char);
    procedure bt_v2_menu_consulta_nfceClick(Sender: TObject);
    procedure ed_v2_desconto_item_modalKeyPress(Sender: TObject; var Key: Char);
    procedure ed_v2_desconto_item_valExit(Sender: TObject);
    procedure ed_v2_desconto_item_percExit(Sender: TObject);
    procedure ed_v2_alt_item_descricaoExit(Sender: TObject);
    procedure ed_v2_alt_item_tot_liqExit(Sender: TObject);
    procedure ed_v2_alt_item_desc_valExit(Sender: TObject);
    procedure ed_v2_alt_item_desc_percExit(Sender: TObject);
    procedure ed_v2_alt_item_vl_totExit(Sender: TObject);
    procedure ed_v2_alt_item_vl_unExit(Sender: TObject);
    procedure ed_v2_alt_item_qtdeExit(Sender: TObject);
    procedure ed_v2_alt_item_descricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pn_v2Enter(Sender: TObject);
    procedure ed_codigo_v2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBEdit29Exit(Sender: TObject);
    procedure btAlterarVendedorClick(Sender: TObject);
    procedure Panel15Enter(Sender: TObject);
    procedure NFCeInutilizacao1Salvar1Click(Sender: TObject);
    procedure NFCeCancelamento1Salvar1Click(Sender: TObject);
    procedure NFCeAutorizacao1Salvar1Click(Sender: TObject);
    procedure NFCeInutilizacao1Visualizar1Click(Sender: TObject);
    procedure NFCeCancelamento1Visualizar1Click(Sender: TObject);
    procedure NFCeAutorizacao1Visualizar1Click(Sender: TObject);
    procedure Panel18Exit(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure btExcluirDestClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure btAtalhoEmitirClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure pnMenuClick(Sender: TObject);
    procedure ReabirNFCparaCorrees1Click(Sender: TObject);
    procedure AtualizarDadosFiscaisdosItens1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure pnDadosPagamentoExit(Sender: TObject);
    procedure gridPagamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridPagamentosDblClick(Sender: TObject);
    procedure lkCtrlFormPagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lkCtrlFormPagamentoExit(Sender: TObject);
    procedure btCancelaPagamentoClick(Sender: TObject);
    procedure btAlterarPagamentoClick(Sender: TObject);
    procedure btExcluirPagamentoClick(Sender: TObject);
    procedure btSalvarPagamentoClick(Sender: TObject);
    procedure DBEdit66KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit66Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btDescontoCabecalhoHabilitarClick(Sender: TObject);
    procedure btDescontoCabecalhoDesabilitarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pn01CodDescricaoExit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure gridSelecionaProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridSelecionaProdutosDblClick(Sender: TObject);
    procedure btAlterarItemClick(Sender: TObject);
    procedure gridItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edQtdeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btAtalhoFechamentoClick(Sender: TObject);
    procedure btAtalhoValoresClick(Sender: TObject);
    procedure btAtalhoCabecalhoClick(Sender: TObject);
    procedure btAtalhoItensClick(Sender: TObject);
    procedure DBEdit51Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure Panel4Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure btCancelarItemClick(Sender: TObject);
    procedure gridItensDblClick(Sender: TObject);
    procedure btExcluirItemClick(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure edCodigoEnter(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edVlTotExit(Sender: TObject);
    procedure edVlUnExit(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
    procedure edVlLiqExit(Sender: TObject);
    procedure edDescRExit(Sender: TObject);
    procedure edDescPExit(Sender: TObject);
    procedure edDescPEnter(Sender: TObject);
    procedure btSalvarItemClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNaturezaOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;
  private
    { Private declarations }
    vCriou: Smallint;
    csdQtde, csdVrUn: Smallint;
    DescPercOld: Double;
    ReturnPressed: Boolean;
    StrFieldOld: string;
    DadosForm: RDadosForm;
    Flkindpag: TDadosLookUp_OOP;
    FlkCidadeIBGE: TDadosLookUp_OOP;
    lkIntermed: TDadosLookUp_OOP;
    print_control: RPrint_Control;
    current: RItem_Control;
    currtot: RTotal_Control;
    currpag: RPagamento_Control;
    TelaEmissaoRapidaAtivada: Boolean;
    LastCons: RLast_Cons;
    ModoNFCe: Boolean;
    FTimerMaximize: TTimer;
    FTimerStatusBar: TTimer;
    FTimeServiceLessModNFCe: TTimer;
    procedure montarComponentes;
    procedure EventoAfterScrollProdutos;
    procedure EventoChangeStatusNFC;
    procedure EventoAtualizarTotalPagamento;
    procedure EventoNFCeFieldChange(Sender: TField);

    procedure ComboBoxMunicipiosFrameChange(Sender: TObject; Municipio: MunicipioEtd);
    procedure ComboBoxOpInternasFrameChange(Sender: TObject; OpInterna: OperacaoInternaEtd);

    procedure statusBar(textoPadrao, hintControle: string); override;

    function CalcularValorVenda(valorVenda: Double; unds: TStrings; idx: Integer): Double;

    function nfce_check_Emissao_rapida: Boolean;

    procedure nfce_v2_log_rejeicao(Sender: TObject);
    procedure nfce_v2_log_message(Sender: TObject);
    procedure nfce_v2_novo(Sender: TObject);
    procedure nfce_v2_alterar(Sender: TObject);
    procedure nfce_v2_change_imagem_prod(Sender: TObject);
    //procedure nfce_v2_onget_dia_movimento(Sender: TObject);
    procedure print_cupom_resize(Sender: TObject);
    procedure print_cupom_redefinir;
    procedure print_cupom_cabecalho_change(Sender: TObject);
    procedure print_cupom_itens_change(Sender: TObject);
    procedure print_cupom_rodape_change(Sender: TObject);
    procedure v2_codigo_pesquisar(Codigo: string; PesquisaF3: Boolean = False);
    procedure v2_titulo_text(Mensagem: string);
    procedure v2_titulo_informacao(Mensagem: string);
    procedure v2_titulo_alerta(Mensagem: string); overload;
    procedure v2_titulo_alerta(Mensagem: string; const Args: array of const); overload;
    procedure v2_titulo_error(Mensagem: string);
    procedure v2_status_bar_build_cadastro;
    procedure v2_status_bar_build_consulta;
    procedure v2_emitir;

    procedure v2_panel_assign(var Sender: TPanel; SelectFirstControl: Boolean = True);
    procedure v2_print_reset;
    procedure v2_cupom_show;
    procedure v2_menus_show;
    procedure v2_cons_prod_show;
    procedure v2_selecao_item_show;
    procedure v2_exclusao_item_show;
    procedure v2_alteracao_item_show;
    procedure v2_desconto_item_show;
    procedure v2_cons_cliente_show;
    procedure v2_cons_cliente_selecionar_show;
    procedure v2_cliente_avulso_show;
    procedure v2_valores_nf_show;
    procedure v2_pagamento_show;
    procedure v2_contingencia_show;
    procedure v2_log_show;
    procedure v2_log_rejeicoes;
    procedure v2_cons_orcamento_show;
    procedure v2_movimento_operador_show;
    procedure v2_sangria_suprimento_show;
    procedure v2_vendedor_show;

    procedure current_reset;
    procedure current_from_item;
    procedure current_from_form_alt_item;
    procedure current_to_form_alt_item;
    procedure current_to_form_cupom;
    procedure current_desconto_modalidade_reset;

    procedure currtot_to_form_valores;

    procedure currpag_reset;
    procedure currpag_from_pagamento;
    procedure currpag_to_form_pagamento;
    procedure currpag_from_form_pagamento;

    function current_calc_use_desc_perc(Value: Double): Boolean;
    function current_calc_use_desc_val(Value: Double): Boolean;
    function current_calc_use_tot_liq(Value: Double): Boolean;
    function current_calc_use_qtde(Value: Double): Boolean;
    function current_calc_use_vl_un(Value: Double): Boolean;
    function current_calc_use_vl_tot(Value: Double): Boolean;
    function current_calc_use_unid(oldIdx, newIdx: Integer): Boolean;

    function current_from_select_prod: Boolean;
    function current_setproduto: Boolean;

    procedure v2_form_alt_item_configura;
    procedure v2_preparar_item_para_alterar_conf_prod(AlterarValor, AlterarDescricao: Boolean);
    procedure v2_form_pagamento_configura;

    //controle de navegacao
    procedure v2_bt_nav_negrito_enter(Sender: TObject);
    procedure v2_bt_nav_negrito_exit(Sender: TObject);
    procedure v2_bt_nav_botao_assign(BitBtns: array of TBitBtn);
    procedure v2_wc_nav_keydown(WinControls: array of TWinControl; Event: TKeyEvent);//wincontrol navigation keydown assign
    procedure v2_wc_click(WinControl: TWinControl; Event: TNotifyEvent); //wincontrol onclick assign

    //actions vinculados aos controles em tela
    procedure v2_action_wc_nav_updown_keydown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure v2_action_wc_nav_leftrigth_keydown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure v2_action_wc_escape_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure v2_action_bt_menus_pag_1_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure v2_action_bt_menus_pag_2_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure v2_actopm_wc_numpad_KeyPress(Sender: TObject; var Key: Char);
    procedure v2_action_cancela_and_show_cupom(Sender: TObject);
    procedure v2_action_excluir_item(Sender: TObject);
    procedure v2_action_excluir_item_grid_keydown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure v2_action_alterar_item(Sender: TObject);
    procedure v2_action_alterar_item_grid_keydown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure form_show_maximize(Sender: TObject);
    procedure status_barr_timer(Sender: TObject);
    procedure service_less_timer(Sender: TObject);
    procedure vendas_sem_emit_data_change(Sender: TObject);

    function consulta_sqladicional: string;
  public
    { Public declarations }
    procedure Btn_CancelaClick(Sender: TObject);
    procedure PanelLeft_Enter(Sender: TObject);
    procedure Form_Memoriza;
    procedure Form_Memoriza_Voltar;
    procedure Form_PreparaTela;
    procedure Form_PreparaTela_Voltar;

    procedure VisualizaXML(AXML: string);
    procedure SalvarXML(AXML: string; AFileName: string);
  end;

var
  frmCadNFCe: TfrmCadNFCe;
  vCodNF: Integer;

implementation

uses uDtmAtivo, {uClassesNFConsumidor, }uDtmNFConsumidor, DateUtils, uDadosIni,
  StrUtils, SHFolder, ShellAPI, leitura_balanca_peso, hw_utils, Math, RichEdit,
  hw_grid_utils, uCadNFCe_StatusServico, ShlObj, ActiveX, ComObj,
  uCadNFCe_MovOperador, uCadNFCe_ConfService, hw_win_utils,
  uCadNFCe_VendasSelect, UnidadeVenda_Model, uClassesNFConsumidor_ProdutoInput,
  TipoComunsUnit,
  hw_undconv_utils, Clipbrd, config_sistema_class, AlertasDFeUtils;

function cloud_agente_last_error: WideString; stdcall; external 'hw.utils.dx.dll';
function cloud_agente_open_drawer(params: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TfrmCadNFCe.btSalvarItemClick(Sender: TObject);
var
  payload: TSetProdutoInput;
  undVenda: TUnidadeVenda_Model;
begin
  inherited;

  edCodigo.Color := clWindow;
  edDescrProd.Color := clWindow;
  edQtde.Color := clWindow;
  edVlUn.Color := clWindow;
  edVlTot.Color := clWindow;
  edDescP.Color := clWindow;
  edDescR.Color := clWindow;
  edVlLiq.Color := clWindow;
  edUndVnd.Color := clWindow;

  if Trim(edCodigo.Text) = '' then
  begin
    edCodigo.Color := $009887F5;
    edDescrProd.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
      edCodigo.SetFocus;
    Exit;
  end;

  if Trim(edDescrProd.Text) = '' then
  begin
    edCodigo.Color := $009887F5;
    edDescrProd.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
      edCodigo.SetFocus;
    Exit;
  end;

  if edQtde.AsValue <= 0 then
  begin
    edQtde.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edQtde.CanFocus) then
      edQtde.SetFocus;
    Exit;
  end;

  if edVlUn.AsValue <= 0 then
  begin
    edVlUn.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edVlUn.CanFocus) then
      edVlUn.SetFocus;
    Exit;
  end;

  if edVlTot.AsValue <= 0 then
  begin
    edVlTot.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edVlTot.CanFocus) then
      edVlTot.SetFocus;
    Exit;
  end;

  if edDescP.AsValue < 0 then
  begin
    edDescP.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edDescP.CanFocus) then
      edDescP.SetFocus;
    Exit;
  end;

  if edDescR.AsValue < 0 then
  begin
    edDescR.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edDescR.CanFocus) then
      edDescR.SetFocus;
    Exit;
  end;

  if edVlLiq.AsValue <= 0 then
  begin
    edVlLiq.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edVlLiq.CanFocus) then
      edVlLiq.SetFocus;
    Exit;
  end;

  if edUndVnd.ItemIndex = -1 then
  begin
    edUndVnd.Color := $009887F5;
    if (Self.Enabled) and (Self.Visible) and (edUndVnd.CanFocus) then
      edUndVnd.SetFocus;
    Exit;
  end;

  if Trim(edDescrProd.Text) = '' then
    Exit;

  undVenda := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);

  payload := TSetProdutoInput.Create;
  payload.Alteracao := btCancelarItem.Visible;
  payload.Codigo := edCodigo.Text;
  payload.Descricao := edDescrProd.Text;

  payload.UndVenda := undVenda.unid_vnd;
  payload.UndFator := undVenda.fator;

  payload.QtdeVenda := edQtde.AsValue;
  payload.ValorUnVnd := edVlUn.AsValue;
  payload.ValorTot := edVlTot.AsValue;
  payload.Desconto := edDescR.AsValue;

  if pnCaptionProdServ.Caption = 'Código Produto' then
    {
    NFCe.Itens.SetProduto(btCancelarItem.Visible, edCodigo.Text, edDescrProd.Text, edQtde.AsValue,
      edVlUn.AsValue, edVlTot.AsValue, edDescR.AsValue)
      }                                                
    NFCe.Itens.SetProduto(payload)
  else if pnCaptionProdServ.Caption = 'Código Serviço' then
    NFCe.Itens.SetServico(btCancelarItem.Visible, edCodigo.Text, edDescrProd.Text, edQtde.AsValue,
      edVlUn.AsValue, edVlTot.AsValue, edDescR.AsValue);

  btCancelarItem.Click; // reset
end;

procedure TfrmCadNFCe.btExcluirPagamentoClick(Sender: TObject);
begin
  inherited;
  if not NFCe.PermiteAlteracaoPagamento then
    Exit;

  NFCe.Pagamento.Delete;
  edPagamentValorTotal.AsValue := NFCe.Pagamento.ValorTotal;
end;

procedure TfrmCadNFCe.Btn_CancelaClick(Sender: TObject);
begin
  NFCe.StatusChange := nil;
  if NFCe.Pagamento <> nil then
    NFCe.Pagamento.PagamentoChange := nil;
  NFCe.FieldChangeEvnt := nil;

  NFCe.Cancel;
  NFCe.CancelUpdates;
  NFCe.Itens.Cancel;
  NFCe.Itens.CancelUpdates;
  NFCe.RollBackTransacao;

  TForm(PanelLeft.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNFCe.AbrirGaveta1Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NFC037', 'VALIDAR', '', 'NFCE', '', NFCe.buscas) then
    Exit;

  if not Assigned(DLLNFC) then
    DLLNFC := TNFCe_DLL.create;

  DLLNFC.LoadDLL;

  Screen.Cursor := crHourGlass;
  try

    if NFCe.ConfigNFCe.AgentValid then
    begin
      if not cloud_agente_open_drawer(WideString(NFCe.ConfigNFCe.GetAgentPrintParams)) then
        ShowAtencao(string(cloud_agente_last_error))
    end
    else
    begin
      DLLNFC.nfce_abrir_gaveta(WideString(NFCe.ConfigNFCe.GetDefaultPrintParams));
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.AtualizarDadosFiscaisdosItens1Click(Sender: TObject);
begin
  inherited;
  ed_rejeicoes.Lines.Clear;
  ed_v2_log_rejeicoes.Clear;
  NFCe.AtualizarInformacoesFiscaisItens();
  if ed_rejeicoes.Lines.Count > 0 then
    ShowAtencao(ed_rejeicoes.Lines.Text, MB_ICONEXCLAMATION);
end;

procedure TfrmCadNFCe.BitBtn1Click(Sender: TObject);
  {
  function SqlAdicional: string;
  begin
    if not NFCe.ConfigNFCe.ConsultaOutrosEmissores then
      Result := Format(' and nfce.cod_emissor = %d ', [vDadosIni.vNFConsumidor.CodEmissor])
    else
      Result := '';
  end;
  }
var
  SqlAdicional: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('NFC008', 'CONSULTA', '', 'NFCE', '', NFCe.buscas, False) then
      Exit;

    ManterGridAvancadoVisivel := True;
    inherited;

    if ckContingenciaPendentes.Checked then
      NFCe.ContingenciaVisualizar
    else
    begin
      SqlAdicional := consulta_sqladicional;
      if SqlAdicional = 'ERRO' then
      begin
      	if not SalvarValoresConsultaAvancada.Checked then
          CheckBox3.Checked := False;
        if not SalvarValoresConsultaAdicional.Checked then
        	CheckBox1.Checked := False;
        Exit;
      end;

      if MaskEdit2.Visible then
      begin
        if NFCe.ConsultaCampos('NFCE', ComboBox1.Text,
          'NFCE.COD_NFCE', maskedit1.text, maskedit2.text, SqlAdicional, vDadosIni.codEmpresa) then
        begin
          with LastCons do
          begin
            Campo    := ComboBox1.Text;
            Condicao := ComboBox3.Text;
            Conteudo := '';
            DataIni  := MaskEdit1.Text;
            DataFim  := MaskEdit2.Text;
            SqlAd    := SqlAdicional;
          end;
          NFCe.LastCons := LastCons;

        end
        else if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        	ComboBox1.setfocus;
      end
      else
        if NFCe.ConsultaCampos('NFCE', MaskEdit3.text, ComboBox1.Text,
          combobox3.Text, 'NFCE.COD_NFCE', SqlAdicional, true, vDadosIni.codEmpresa) then
        begin
          with LastCons do
          begin
            Campo    := ComboBox1.Text;
            Condicao := ComboBox3.Text;
            Conteudo := MaskEdit3.Text;
            DataIni  := '';
            DataFim  := '';
            SqlAd    := SqlAdicional;
          end;
          NFCe.LastCons := LastCons;

        end
        else if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
          ComboBox1.SetFocus;
    end;

    with NFCe.ValidacaoObjetosInternos do
      if not Permitido then
      begin
        ShowAtencao('Objetos Internos Ausentes(%s)', [Mensagem]);
        Exit;
      end;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  finally
  	gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
//PROCURA
end;

procedure TfrmCadNFCe.BitBtn3Click(Sender: TObject);
begin
  if TelaEmissaoRapidaAtivada then
  begin
    nfce_v2_novo(NFCe);
    Exit;
  end;

  if NFCe.ConfigNFCe.MovimentoOperador.Ativo then
    if not MovOperador.PermiteEmissao(0) then
    begin
      ShowErro(MovOperador.LastMessage);
      Exit;
    end;

  with NFCe.PendenciasVerificar do
    if not Permitido then
    begin
      ShowAtencao(Mensagem, MB_ICONEXCLAMATION);
      Exit;
    end;

  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('NFC028', 'HABILITAR', '',
      'NFCE', '', NFCe.buscas) then
      exit;

    if PageControl1.ActivePage = TabSheet2 then
      ActiveControl := BitBtn3;
    if not NFCe.Insert then
      exit;
    v2_status_bar_build_consulta;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    pageDadosNFCe.ActivePage := tsItens;
    montarComponentes;
    btAtalhoEmitir.Tag := 1; //1: novo, 0: alterar, quando = 1 limpa a tela e começa outra nfce

    if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
      edCodigo.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
//NOVO
end;

procedure TfrmCadNFCe.BitBtn4Click(Sender: TObject);
begin
  if not NFCe.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(NFCe.vNomeCampoErro);
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
      if NFCe.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
 //PK
end;

procedure TfrmCadNFCe.BitBtn5Click(Sender: TObject);
begin
  NFCe.StatusChange := nil;
  if NFCe.Pagamento <> nil then
    NFCe.Pagamento.PagamentoChange := nil;
  NFCe.FieldChangeEvnt := nil;

  NFCe.Cancel;
  NFCe.CancelUpdates;
  NFCe.Itens.Cancel;
  NFCe.Itens.CancelUpdates;
  NFCe.RollBackTransacao;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  with LastCons do if DataIni <> '' then
    NFCe.ConsultaCampos('NFCE', Campo, 'NFCE.COD_NFCE', DataIni, DataFim, SqlAd, vDadosIni.codEmpresa)
  else
    NFCe.ConsultaCampos('NFCE', Conteudo, Campo, Condicao, 'NFCE.COD_NFCE', SqlAd, True, vDadosIni.codEmpresa);
  //BitBtn1.Click;
  NFCe.LocateRegistroMemorizado;
  inherited;
  NFCe.EmissaoRapida := False;
  v2_status_bar_build_consulta;
end;

procedure TfrmCadNFCe.BitBtn7Click(Sender: TObject);
begin
  inherited;
//  ver parada das qtde de vias de impressao eom contingencia
end;

procedure TfrmCadNFCe.bt_v2_menu_goto_page_1Click(Sender: TObject);
begin
  inherited;
  pn_v2_menus_pag_2.Visible := False;
  pn_v2_menus_pag_1.Visible := True;
  THackWinControl(pn_v2_menus_pag_1
  ).SelectFirst;
end;

procedure TfrmCadNFCe.bt_v2_menu_log_messagesClick(Sender: TObject);
begin
  inherited;
  v2_log_show;
end;

procedure TfrmCadNFCe.bt_v2_menu_log_rejeicoesClick(Sender: TObject);
begin
  inherited;
  ed_rejeicoes.Lines.Clear;
  ed_v2_log_rejeicoes.Clear;

  NFCe.AtualizarInformacoesFiscaisItens();

  v2_log_rejeicoes;
end;

procedure TfrmCadNFCe.bt_outras_nfClick(Sender: TObject);
begin
  inherited;
  pmOutros.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNFCe.bt_tefClick(Sender: TObject);
{
var
  vTerminalAdm: string;
  vID: Integer;
begin
  inherited;
//  vDadosIni.operacaoPosVirtual(posCRT, 'Informe o valor da operação', '', 0, NFCe.buscas);
  if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
  begin
    Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
    Exit;
  end;
  if not vDadosIni.PesqPros('POSV001', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', NFCe.buscas, True) then
    Exit;
  if not vDadosIni.operacaoPosVirtual(posCRT, 'Informe o valor da operação', '', 0, NFCe.buscas) then
  begin
    vDadosIni.GravaAuditoria('POSV001', 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', NFCe.buscas);
    Exit;
  end;

  try

    if vDadosIni.vPOSV.retorno = retSucesso then
    begin
      vTerminalAdm := vDadosIni.getTerminalADM(NFCe.buscas);

      vID := vDadosIni.gravaTransacaoPosVirtual(0, 'AVL', vTerminalAdm, StrToIntDef(vDadosIni.vPOSV.numeroDocumento,0), 0, 0, NFCe.buscas);

      NFCe.buscas.Transaction.Commit;

      vDadosIni.GravaAuditoria('POSV001', 'INICIAR',
        'SUCESSO - AVL ' + vDadosIni.vPOSV.numeroDocumento + 'VL: ' + Format('%0.2n', [vDadosIni.vPOSV.valorOperacao]) +
        '-AUT:' + vDadosIni.vPOSV.retornoAUT + '-NSU:' + vDadosIni.vPOSV.retornoNSU, 'TRANSACAO_CARTAO', IntToStr(vID), NFCe.buscas);
    end
    else
      vDadosIni.GravaAuditoria('POSV001', 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', NFCe.buscas);

  except on E: Exception do
    begin
      NFCe.registraErro('Erro ao salvar transação cartão. Por favor contacte o suporte técnico' + sLineBreak + sLineBreak +
                        'Erro: ' + E.Message);
    end;
  end;
  }
var
  vTerminalAdm, tipoVenda, msgOperacao, idProcesso: string;
  vID, numVenda: Integer;
  valorOperacao, valorLimite: Double;
begin
  inherited;
//  vDadosIni.operacaoPosVirtual(posCRT, 'Informe o valor da operação', '', 0, NFCe.buscas);
  if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
  begin
    Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
    Exit;
  end;

  VendaDiaria := TNFCe_VendaDiaria.Create;
  try

    msgOperacao := 'Informe o valor da operação';
    tipoVenda := 'AVL';
    numVenda := 0;
    valorOperacao := 0;
    valorLimite := 0;
    idProcesso := 'POSV001';

    if NFCe.ConfigNFCe.Cartao.TransacaoAvulsaDeVendaHabilitada then
    begin

      Application.CreateForm(TfrmCadNFCe_VendasSelect, frmCadNFCe_VendasSelect);
      if (frmCadNFCe_VendasSelect.ShowModal = mrOk) and (VendaDiaria.fint('numero') > 0) then
      begin
        tipoVenda := VendaDiaria.fstr('tipo');
        numVenda := VendaDiaria.fint('numero');
        valorOperacao := 0;
        valorLimite := RoundTo(VendaDiaria.ffloat('valor_total') - VendaDiaria.GetValorJaRecebidoEmCartao, -2);
        msgOperacao := 'Recebimento em cartão para a ' + tipoVenda + ': ' + IntToStr(numVenda);
        idProcesso := 'POSV011';
      end
      else if not NFCe.ConfigNFCe.Cartao.TransacaoAvulsaDigitadaHabilitada then
      begin
        ShowWarning('Operação cancelada');
        Exit;
      end;

    end
    else if not NFCe.ConfigNFCe.Cartao.TransacaoAvulsaDigitadaHabilitada then
    begin
      ShowWarning('Nenhuma operação de transação cartão permitida');
      Exit;
    end;

  finally
    VendaDiaria.Free;
  end;

  if not vDadosIni.PesqPros(idProcesso, 'INICIAR', Format('%s - %s %d - %f', [vDadosIni.vNomeUsuario, tipoVenda, numVenda, valorOperacao]),
                            'TRANSACAO_CARTAO', '', NFCe.buscas, True) then
    Exit;

  //if not vDadosIni.operacaoPosVirtual(posCRT, 'Informe o valor da operação', '', 0, NFCe.buscas) then
  if not vDadosIni.operacaoPosVirtual(posCartaoMaisCarteiras, msgOperacao, IfThen(numVenda > 0, IntToStr(numVenda)), valorOperacao, NFCe.buscas, valorLimite) then
  begin
    vDadosIni.GravaAuditoria(idProcesso, 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', NFCe.buscas);
    Exit;
  end;

  try

    if vDadosIni.vPOSV.retorno = retSucesso then
    begin
      vTerminalAdm := '';
      if Trim(vDadosIni.vPOSV.idCarteiraDigital) = '' then
        if vDadosIni.vPOSV.terminalAdm <> '' then
          vTerminalAdm := vDadosIni.vPOSV.terminalAdm
        else
          vTerminalAdm := vDadosIni.getTerminalADM(NFCe.buscas);

      vID := vDadosIni.gravaTransacaoPosVirtual(0, tipoVenda, vTerminalAdm, StrToIntDef(vDadosIni.vPOSV.numeroDocumento, 0), 0, 0, NFCe.buscas);

      NFCe.buscas.Transaction.Commit;

      vDadosIni.GravaAuditoria(idProcesso, 'INICIAR',
        'SUCESSO - ' + tipoVenda + ' ' + vDadosIni.vPOSV.numeroDocumento + 'VL: ' + Format('%0.2n', [vDadosIni.vPOSV.valorOperacao]) +
        '-AUT:' + vDadosIni.vPOSV.retornoAUT + '-NSU:' + vDadosIni.vPOSV.retornoNSU, 'TRANSACAO_CARTAO', IntToStr(vID), NFCe.buscas);
    end
    else
      vDadosIni.GravaAuditoria(idProcesso, 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', NFCe.buscas);
                                         
  except on E: Exception do
    begin
      NFCe.registraErro('Erro ao salvar transação cartão. Por favor contacte o suporte técnico' + sLineBreak + sLineBreak +
                        'Erro: ' + E.Message);
    end;
  end;

end;

procedure TfrmCadNFCe.bt_v2_alteracao_item_cancelaClick(Sender: TObject);
begin
  inherited;
  v2_action_cancela_and_show_cupom(Sender);
end;

procedure TfrmCadNFCe.bt_v2_alteracao_item_salvarClick(Sender: TObject);
begin
  inherited;
  current_to_form_cupom;

  current_setproduto;

  v2_cupom_show;
end;

procedure TfrmCadNFCe.bt_v2_cliente_avulso_cancelaClick(Sender: TObject);
begin
  inherited;
  v2_action_cancela_and_show_cupom(Sender);
end;

procedure TfrmCadNFCe.bt_v2_cliente_avulso_salvarClick(Sender: TObject);
var
  Vazios, Preenchidos: Boolean;
begin
  inherited;
  if NFCe.dataSet.State in [dsEdit, dsInsert] then
  begin
    NFCe.dataSet.FieldByName('cod_cliente').Value := Null;

    with NFCe.Dest do
    begin
      if dataSet.IsEmpty then
      begin
        if not Insert then
          Exit;
      end
      else if not Edit then
        Exit;

      dataSet.FieldByName('cnpjcpf').AsString := ed_v2_cliente_avulso_cpf.Text;
      dataSet.FieldByName('xnome').AsString   := ed_v2_cliente_avulso_nome.Text;
      dataSet.FieldByName('email').AsString   := ed_v2_cliente_avulso_email.Text;
      dataSet.FieldByName('xlgr').AsString    := ed_v2_cliente_avulso_logr.Text;
      dataSet.FieldByName('nro').AsString     := ed_v2_cliente_avulso_num.Text;
      dataSet.FieldByName('xbairro').AsString := ed_v2_cliente_avulso_bairro.Text;
      dataSet.FieldByName('cmun').AsInteger   := VarToInt(ed_v2_cliente_avulso_cidade.KeyValue);
      dataSet.FieldByName('uf').AsString      := ed_v2_cliente_avulso_uf.Text;
      dataSet.FieldByName('fone').AsString    := ed_v2_cliente_avulso_fone.Text;
      dataSet.FieldByName('cep').AsString     := ed_v2_cliente_avulso_cep.Text;
      dataSet.FieldByName('xcpl').AsString    := ed_v2_cliente_avulso_complemento.Text;

      if not Post then
      begin
        dataSet.Cancel;
        v2_titulo_error(vMensagemErro);
        Exit;      
      end;
    end;

    print_cupom_cabecalho_change(NFCe);
    v2_cupom_show;
  end
  else
    v2_cupom_show;
end;

procedure TfrmCadNFCe.bt_v2_cons_cliente_cancelaClick(Sender: TObject);
begin
  inherited;
  v2_action_cancela_and_show_cupom(Sender);
end;

procedure TfrmCadNFCe.bt_v2_cons_cliente_consultarClick(Sender: TObject);
begin
  inherited;
  if (ed_v2_cons_cliente_opcao.Text[1] = '3') and (not (Length(Trim(ed_v2_cons_cliente_texto_consulta.Text)) in [11, 14])) then
  begin
    lb_v2_cons_cliente_nao_encontrado.Caption := 'CPF/CNPJ deve conter 11 ou 14 dígitos';
    lb_v2_cons_cliente_nao_encontrado.Visible := True;
  end
  else if (ed_v2_cons_cliente_opcao.Text[1] <> '3') and (Length(Trim(ed_v2_cons_cliente_texto_consulta.Text)) < 3) then
  begin
    lb_v2_cons_cliente_nao_encontrado.Caption := 'Informe pelo menos 3 dígitos para consultar';
    lb_v2_cons_cliente_nao_encontrado.Visible := True;
  end
  else if NFCe.ConsultaCliente.Consultar(StrToIntDef(ed_v2_cons_cliente_opcao.Text[1], 1),
                                         Trim(ed_v2_cons_cliente_texto_consulta.Text)).dataSet.RecordCount > 0 then
  begin
    lb_v2_cons_cliente_nao_encontrado.Visible := False;
    v2_cons_cliente_selecionar_show;
  end
  else
  begin
    lb_v2_cons_cliente_nao_encontrado.Caption := 'NENHUM CLIENTE ENCONTRADO';
    lb_v2_cons_cliente_nao_encontrado.Visible := True;
  end;
end;

procedure TfrmCadNFCe.bt_v2_desconto_item_cancelaClick(Sender: TObject);
begin
  inherited;
  v2_action_cancela_and_show_cupom(Sender);
end;

procedure TfrmCadNFCe.bt_v2_desconto_item_salvarClick(Sender: TObject);
begin
  inherited;
  current.AplicaDes.Percentual := ed_v2_desconto_item_perc.AsValue;
  current.AplicaDes.Valor      := ed_v2_desconto_item_val.AsValue;
  current.AplicaDes.Modalidade := RItem_Control_Aplicar_Desconto_Modalidade(StrToIntDef(ed_v2_desconto_item_modal.Text[1], 1) - 1);
  current.AplicaDes.IdNFCe     := IfThen(NFCe.dataSet.State in [dsEdit, dsInsert], NFCe.fint('cod_nfce'));

  v2_cupom_show;
end;

procedure TfrmCadNFCe.bt_v2_menu_alterarClick(Sender: TObject);
begin
  inherited;
  if NFCe.Itens.dataSet.RecordCount = 0 then
    v2_titulo_alerta('Sem itens para alterar')
  else
  begin
    NFCe.Itens.dataSet.FieldByName('sel').Visible := False;
    grid_v2_selecao_item.OnDblClick  := v2_action_alterar_item;
    grid_v2_selecao_item.OnKeyDown   := v2_action_alterar_item_grid_keydown;
    grid_v2_selecao_item.Hint        := 'Seleção de item para alteração';

    {
    v2_form_alt_item_configura;

    ed_v2_alt_item_vl_un.Enabled     := (NFCe.ConfigNFCe.Itens.Campos.ValorUnitario);
    ed_v2_alt_item_vl_tot.Enabled    := (NFCe.ConfigNFCe.Itens.Campos.ValorTotal);
    ed_v2_alt_item_desc_perc.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoPercentual) and (NFCe.fequals('desc_por_item', 'S'));
    ed_v2_alt_item_desc_val.Enabled  := (NFCe.ConfigNFCe.Itens.Campos.DescontoEmValor)    and (NFCe.fequals('desc_por_item', 'S'));
    ed_v2_alt_item_tot_liq.Enabled   := (NFCe.ConfigNFCe.Itens.Campos.ValorLiquido);

    current_from_item;

    current_to_form_alt_item;
    }
    v2_titulo_alerta('Alteração de Itens');

    v2_selecao_item_show;
  end;
end;

procedure TfrmCadNFCe.bt_v2_menu_consulta_clienteClick(Sender: TObject);
begin
  inherited;
  v2_titulo_alerta('Consulta Cliente');
  v2_cons_cliente_show;
end;

procedure TfrmCadNFCe.bt_v2_menu_consulta_nfceClick(Sender: TObject);
begin
  inherited;
  NFCe.Cancel;
  NFCe.CancelUpdates;
  NFCe.Itens.Cancel;
  NFCe.Itens.CancelUpdates;
  NFCe.RollBackTransacao;

  PageControl1.ActivePage := TabSheet2;
  THackWinControl(TabSheet2).SelectFirst;
  NFCe.EmissaoRapida := False;
end;

procedure TfrmCadNFCe.bt_v2_menu_desconto_itemClick(Sender: TObject);
begin
  inherited;
  if ((NFCe.fint('cod_nfce') = 0) and (not NFCe.ConfigNFCe.Regras.DescontoPadraoPorItem)) or
    ((NFCe.fint('cod_nfce') > 0) and (NFCe.fdif('desc_por_item', 'S'))) then
  begin
    v2_titulo_alerta('DESCONTO POR ITEM DESABILITADO');
    v2_cupom_show;
  end
  else
  begin
    v2_titulo_alerta('Concessão de Desconto no Item');
    v2_desconto_item_show;
  end;
end;

procedure TfrmCadNFCe.bt_v2_menu_excluirClick(Sender: TObject);
begin
  inherited;
  if NFCe.Itens.dataSet.RecordCount = 0 then
    v2_titulo_alerta('Sem itens para excluir')
  else
  begin
    NFCe.Itens.dataSet.FieldByName('sel').Visible := True;
    grid_v2_selecao_item.OnDblClick := v2_action_excluir_item;
    grid_v2_selecao_item.OnKeyDown  := v2_action_excluir_item_grid_keydown;
    grid_v2_selecao_item.Hint       := 'Seleção de item para exclusão';
    ed_v2_exclusao_item_opcao.SelectAll;
    v2_titulo_alerta('Exclusão de Itens');

    v2_selecao_item_show;
  end;
end;

procedure TfrmCadNFCe.bt_v2_menu_goto_page_2Click(Sender: TObject);
begin
  inherited;
  pn_v2_menus_pag_1.Visible := False;
  pn_v2_menus_pag_2.Visible := True;
  THackWinControl(pn_v2_menus_pag_2).SelectFirst;
end;

procedure TfrmCadNFCe.bt_v2_menu_modo_completoClick(Sender: TObject);
begin
  inherited;
  TelaEmissaoRapidaAtivada := False;
  NFCe.EmissaoRapida := TelaEmissaoRapidaAtivada;

  v2_status_bar_build_consulta;

  montarComponentes;

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsCadastro;
  pageDadosNFCe.ActivePage := tsItens;

  if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
    edCodigo.SetFocus;

  btAtalhoEmitir.Tag := 1; //1: novo, 0: alterar, quando = 1 limpa a tela e começa outra nfce
end;

procedure TfrmCadNFCe.bt_v2_menu_modo_reimprimirClick(Sender: TObject);
begin
  inherited;
  with NFCe.ValidacaoQualquerAlteracao do
    //if (Status = stsFechada) and (Situacao = sitAutorizada) then
    begin
      if NFCe.Imprimir then
        v2_cupom_show
      else
        v2_titulo_error(NFCe.LastMessage);
    end;
//      v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')]);
end;

procedure TfrmCadNFCe.bt_v2_menu_movimento_operadorClick(Sender: TObject);
begin
  inherited;
  v2_movimento_operador_show;
end;

procedure TfrmCadNFCe.bt_v2_menu_novoClick(Sender: TObject);
begin
  inherited;
  nfce_v2_novo(Sender);
end;

procedure TfrmCadNFCe.bt_v2_menu_pagamentoClick(Sender: TObject);
begin
  inherited;
  if NFCe.ffloat('vnf') = 0 then
    v2_titulo_alerta('Sem valor para pagar')
  else
  begin
    v2_titulo_alerta('Pagamentos');

    v2_pagamento_show;
  end;
end;

procedure TfrmCadNFCe.bt_v2_menu_sangsupClick(Sender: TObject);
begin
  inherited;
  if not NFCe.ConfigNFCe.MovimentoOperador.Ativo then
  begin
    v2_titulo_error('Movimento de Operador não configurado');
    Exit;
  end;
  
  v2_sangria_suprimento_show;
end;

procedure TfrmCadNFCe.bt_v2_menu_usar_orcamentoClick(Sender: TObject);
begin
  inherited;
  if NFCe.fint('norc') > 0 then
    v2_titulo_alerta('Orçamento Selecionado %d', [NFCe.fint('norc')])
  else
    v2_titulo_alerta('Selecionar Orçamento');
  v2_cons_orcamento_show;
end;

procedure TfrmCadNFCe.bt_v2_menu_valores_nfClick(Sender: TObject);
begin
  inherited;
  v2_titulo_alerta('Desconto no Total e Outros Valores');

  v2_valores_nf_show;
end;

procedure TfrmCadNFCe.bt_v2_menu_vendedorClick(Sender: TObject);
begin
  inherited;
  v2_titulo_alerta('Visualizar vendedor');
  v2_vendedor_show;
end;

procedure TfrmCadNFCe.bt_v2_menu_voltar_page_1Click(Sender: TObject);
begin
  inherited;
  v2_cupom_show;
end;

procedure TfrmCadNFCe.bt_v2_movimento_operador_abrirDiaClick(Sender: TObject);
begin
  inherited;
  
  if not NFCe.ConfigNFCe.MovimentoOperador.Ativo then
  begin
    v2_titulo_error('Movimento de Operador não configurado');
    Exit;
  end;

  try
    if UpperCase(bt_v2_movimento_operador_abrirDia.Caption) = 'ABRIR DIA DE MOVIMENTO' then
    begin
      if not MovOperador.AbrirDia then
        v2_titulo_error(MovOperador.LastMessage)
      else
      begin
        v2_titulo_informacao('DIA ABERTO - CAIXA LIVRE !!!');
        nfce_v2_novo(nfce);
      end;
    end
    else
    begin
      if not MovOperador.FecharDia(lb_pn_v2_movimento_operador_title.Tag) then
        v2_titulo_error(MovOperador.LastMessage)
      else
      begin
        v2_titulo_informacao('DIA FECHADO !!!');
        NFCe.AbreRegistros(0, True);
        v2_movimento_operador_show;
      end;
    end;
  finally
    v2_status_bar_build_cadastro;
  end;
end;

procedure TfrmCadNFCe.bt_v2_movimento_operador_relatorioClick(Sender: TObject);
begin
  inherited;
//  if MovOperador.RelatorioDoDia_PrintQuickRep then
  if MovOperador.RelatorioDoDia_PrintNaoFiscal then
    v2_cupom_show;
end;

procedure TfrmCadNFCe.bt_v2_movimento_operador_voltarClick(Sender: TObject);
begin
  inherited;
  v2_cupom_show;
end;

procedure TfrmCadNFCe.bt_v2_sangsup_cancelaClick(Sender: TObject);
begin
  inherited;
  v2_action_cancela_and_show_cupom(Sender);
end;

procedure TfrmCadNFCe.bt_v2_sangsup_salvarClick(Sender: TObject);
var
  Msg: string;
  ssOp: TSangSup;
begin
  inherited;

  if Copy(Trim(ed_v2_sangsup_opcao.Text), 1, 1) = '1' then
    ssOp := ssSangria
  else
    ssOp := ssSuprimento;

  Screen.Cursor := crHourGlass;
  try

    if not SangSup.Inserir(ed_v2_sangsup_valor.AsValue, ssOp, Msg) then
    begin
      if ContainsText(Msg, 'Dia de movimento fechado') then
      begin
        v2_titulo_informacao(Msg);
        v2_movimento_operador_show;
      end
      else if ContainsText(Msg, 'Valor deve ser maior que zero') then
      begin
        v2_titulo_error(Msg);
        if (Self.Enabled) and (Self.Visible) and (ed_v2_sangsup_valor.CanFocus) then
        	ed_v2_sangsup_valor.SetFocus;
      end
      else
        v2_titulo_error(Msg);
    end
    else
    begin
      v2_action_cancela_and_show_cupom(Sender);
      v2_titulo_informacao(Msg);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  //tem de chamar a abertura da gaveta
end;

procedure TfrmCadNFCe.bt_v2_valores_cancelaClick(Sender: TObject);
begin
  inherited;
  v2_action_cancela_and_show_cupom(Sender);
end;

procedure TfrmCadNFCe.bt_v2_valores_salvarClick(Sender: TObject);
begin
  inherited;
  with NFCe.ValidacaoQualquerAlteracao do
    if not Permitido then
    begin
      v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')]);
      Exit;
    end;

  if not (NFCe.dataSet.State in [dsInsert, dsEdit]) then
    if (NFCe.dataSet.State = dsBrowse) then
      NFCe.dataSet.Edit;

  NFCe.dataSet.FieldByName('vdesc').AsFloat          := currtot.vdesc;
  NFCe.dataSet.FieldByName('vfrete').AsFloat         := currtot.vfrete;
  NFCe.dataSet.FieldByName('vseg').AsFloat           := currtot.vseg;
  NFCe.dataSet.FieldByName('voutro').AsFloat         := currtot.voutro;
  NFCe.dataSet.FieldByName('vnf').AsFloat            := currtot.vnf;
  NFCe.dataSet.FieldByName('desc_por_item').AsString := IfThen(ed_v2_valores_tipodesc.Text[1] = '1', 'S', 'N');

  NFCe.AtualizarValorTotalLiquido;
  if NFCe.HouveAlteracao() then
    NFCe.SalvarECalcular(True);
  v2_action_cancela_and_show_cupom(Sender);
end;

procedure TfrmCadNFCe.CadastrodeEmissor1Click(Sender: TObject);
begin
  inherited;
  if Self.FormStyle = fsMDIChild then  
    vDadosIni.nfc_abreFormNFConsumidor('nfc_abreformEmissor', 0)
  else
    vDadosIni.nfc_abreFormNFConsumidor('nfc_abreformEmissor', 1);
end;


function TfrmCadNFCe.CalcularValorVenda(valorVenda: Double;
  unds: TStrings; idx: Integer): Double;
var
  undVenda: TUnidadeVenda_Model;
  vQtde, vUn, vTot, vLiq, vDesc: Double;
begin
  Result := valorVenda;

  if unds.Count = 0 then
  begin
    ShowAtencao('Sem unidades de venda cadastradas. Contacte o suporte por favor');
    Exit;
  end
  else if idx = -1 then
  begin
    ShowAtencao('Selecione uma unidade de venda por favor');
    Exit;
  end;

  undVenda := (unds.Objects[idx] as TUnidadeVenda_Model);
  if (undVenda.fator = 1) or (undVenda.unid_vnd = undVenda.unid_princ) then
    Exit;

  Result := valorVenda / undVenda.fator
end;

procedure TfrmCadNFCe.CheckBox1Click(Sender: TObject);
begin
  inherited;
  gr_adicional.Visible := CheckBox1.Checked;

  if trim(ed_ad_campo.Text) = '' then
  	ed_ad_campo.Text := ComboBox1.Text;

  if trim(ed_ad_condicao.Name) = '' then
  	ed_ad_condicao.Text := ComboBox3.Text;

  if (Self.Enabled) and (Self.Visible) and (ed_ad_campo.CanFocus) then
  	ed_ad_campo.SetFocus;
end;

procedure TfrmCadNFCe.CheckBox3Click(Sender: TObject);
begin
  inherited;
  gr_status.Visible   := CheckBox3.Checked;
  gr_situacao.Visible := CheckBox3.Checked;
end;

procedure TfrmCadNFCe.ed_ad_campoExit(Sender: TObject);
var
  I: Integer;
  ctrlNextFocus: string;
begin
  inherited;
  ed_ad_campo.Text := ed_ad_campo.Items[ed_ad_campo.ItemIndex];
  if ed_ad_campo.Text = '' then
  begin
    if (Self.Enabled) and (Self.Visible) and (ed_ad_campo.CanFocus) then
      ed_ad_campo.SetFocus;
    exit;
  end;

  ctrlNextFocus := '';
  if Assigned(ActiveControl) then
    ctrlNextFocus := ActiveControl.Name;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ed_ad_campo.Text then
      begin
        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          ed_ad_valor.Visible   := False;
          ed_ad_dataini.Visible := True;
          ed_ad_datafim.Visible := True;
          if ed_ad_dataini.Text = '  /  /    ' then
            ed_ad_dataini.Text := DateToStr(Date);
          if ed_ad_datafim.Text = '  /  /    ' then
            ed_ad_datafim.Text := DateToStr(Date);
        end
        else
        begin
          ed_ad_valor.Visible   := True;
          ed_ad_dataini.Visible := False;
          ed_ad_datafim.Visible := False;
        end;

        if (ActiveControl <> BitBtn1) and (ActiveControl <> BitBtn3) then
          if (ctrlNextFocus = ed_ad_valor.Name) and (not ed_ad_valor.CanFocus) then
          begin
            if (Self.Enabled) and (Self.Visible) and (ed_ad_dataini.CanFocus) then
              ed_ad_dataini.SetFocus;
          end
          else if (MatchStr(ctrlNextFocus,[ed_ad_dataini.Name, ed_ad_datafim.Name])) and (not ed_ad_dataini.CanFocus) then
            if (Self.Enabled) and (Self.Visible) and (ed_ad_valor.CanFocus) then
              ed_ad_valor.SetFocus;

        Break;
      end;
    end;
end;

procedure TfrmCadNFCe.ed_ad_condicaoExit(Sender: TObject);
begin
  inherited;
  TComboBox(Sender).Text := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex];
end;

procedure TfrmCadNFCe.ComboBoxMunicipiosFrameChange(Sender: TObject;
  Municipio: MunicipioEtd);
begin
  if Sender = ComboBoxMunicipiosFrame2 then
  begin
    if not NFCe.PermiteAlteracaoPagamento then
      Exit;

    NFCe.UnRegisterNotificationToField('CMUNFGIBS');
    try
      if Municipio = nil then
        NFCe.dataSet.FieldByName('cmunfgibs').Clear()
      else
        NFCe.dataSet.FieldByName('cmunfgibs').AsInteger := Municipio.Codigo;
    finally
      NFCe.RegisterNotificationToField('CMUNFGIBS');
    end;
  end;
end;

procedure TfrmCadNFCe.ComboBoxOpInternasFrameChange(Sender: TObject;
  OpInterna: OperacaoInternaEtd);
begin
  if Sender = ComboBoxOpInternasFrame1 then
  begin
    if not NFCe.PermiteAlteracaoPagamento then
      Exit;

    if OpInterna = nil then
      NFCe.dataSet.FieldByName('op_interna_id').Clear()
    else
      NFCe.dataSet.FieldByName('op_interna_id').AsString := OpInterna.Id;
  end;
end;

procedure TfrmCadNFCe.ConfiguraesWebService1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.nfc_abreFormNFConsumidor('nfc_abreformConfigNFCe', 1);
end;

function TfrmCadNFCe.consulta_sqladicional: string;
var
  Sql, Str, c, v: string;
  I, I2: Integer;
  F: TField;
  D: Double;
  D1, D2: TDate;
  SitNull: Boolean;
begin
  Result := '';
  if gr_status.Visible then
  begin
    Str := '';
    for I := 0 to gb_status.Items.Count - 1 do
      if gb_status.Checked[I] then
        Str := Str + IfThen(Str <> '', ',') + QuotedStr(gb_status.Items[I]);

    if Str <> '' then
      Sql := Format(' and nfce.status in (%s)', [Str]);

    Str := '';
    SitNull := False;
    for I := 0 to gb_situacao.Items.Count - 1 do
      if gb_situacao.Checked[I] then
        if gb_situacao.Items[I] = '[Sem Situação]' then
          SitNull := True
        else
          Str := Str + IfThen(Str <> '', ',') + QuotedStr(gb_situacao.Items[I]);

    if (Str <> '') and (SitNull) then
      Sql := Sql + Format(' and ((nfce.situacao_nfce in (%s)) or (nfce.situacao_nfce is null))', [Str])
    else if SitNull then
      Sql := Sql + Format(' and nfce.situacao_nfce is null', [Str])
    else if Str <> '' then
      Sql := Sql + Format(' and nfce.situacao_nfce in (%s)', [Str]);
  end;

  if gr_adicional.Visible then
  begin
    Str := '';
    for I := 0 to NFCe.dataSet.Fields.Count - 1 do
      if NFCe.dataSet.Fields[I].DisplayLabel = ed_ad_campo.Text then
      begin
        F := NFCe.dataSet.Fields[I];

        if (F.DataType in [ftInteger, ftSmallint]) and (not TryStrToInt(Trim(ed_ad_valor.Text), I2)) then
        begin
          Result := 'ERRO';
          ShowAtencao('Valor para consulta inválido. Informe um número inteiro sem casas decimais');
          Exit;
        end;

        if (F.DataType in [ftFloat, ftCurrency]) and (not TryStrToFloat(Trim(ed_ad_valor.Text), D)) then
        begin
          Result := 'ERRO';
          ShowAtencao('Valor para consulta inválido. Informe um número decimal válido');
          Exit;
        end;

        Str := Format('nfce.%s', [F.FieldName]);
        c   := Trim(ed_ad_condicao.Text);

        if F.DataType in [ftDate, ftDateTime, ftTime] then
        begin
          Str := Str +
                 ' >= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(ed_ad_dataini.Text))) +
                 ' and ' + Format('nfce.%s', [F.FieldName]) +
                 ' <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(ed_ad_datafim.Text)));
        end
        else
        begin
          v := Trim(ed_ad_valor.Text);
          if F.DataType in [ftFloat, ftCurrency] then
            v := NFCe.ffloat_fb(D);

          if c = 'Começa' then
            v := v + '%'
          else if c = 'Esta contido' then
            v := '%' + v + '%';

          if (F.DataType in [ftString, ftMemo, ftWideString, ftWideMemo]) or (ContainsText(v, '%')) then
            v := QuotedStr(v);

          c   := IfThen(c = 'Igual'         , ' = '   ) +
                 IfThen(c = 'Começa'        , ' like ') +
                 IfThen(c = 'Esta contido'  , ' like ') +
                 IfThen(c = 'Diferente'     , ' <> '  ) +
                 IfThen(c = 'Maior'         , ' > '   ) +
                 IfThen(c = 'Maior ou Igual', ' >= '  ) +
                 IfThen(c = 'Menor'         , ' < '   ) +
                 IfThen(c = 'Menor ou Igual', ' <= '  );
          Str := Str + c + v;
        end;
        Sql := Sql + ' and ' + Str;

        Break;
      end;
  end;
  if not NFCe.ConfigNFCe.ConsultaOutrosEmissores then
    Sql := Sql +  Format(' and nfce.cod_emissor = %d ', [vDadosIni.vNFConsumidor.CodEmissor]);

  Result := Sql;

end;

procedure TfrmCadNFCe.Copiar1Click(Sender: TObject);
begin
  inherited;
  if Assigned(gridItens.DataSource) then
    Clipboard.AsText := gridItens.DataSource.DataSet.FieldByName(gridItens.Columns[gridItens.SelectedIndex].FieldName).AsString;
end;

procedure TfrmCadNFCe.CriaratalhoNFCenareadeTrabalho1Click(Sender: TObject);
  procedure MakeShortCut(AshortCut, Adescription, Apath, Aarguments, AworkingDirectory: string);
  var
    ShellLink : IShellLink;
    PersistFile : IPersistFile;
    NomeLnk : WideString;
  begin
    ShellLink := CreateComObject(CLSID_ShellLink) as IShellLink;
    PersistFile := ShellLink as IPersistFile;
    with ShellLink do
    begin
      SetDescription(PChar(Adescription));
      SetPath(PChar(Apath));
      SetArguments(PChar(Aarguments));
      SetWorkingDirectory(PChar(AworkingDirectory));
    end;
    NomeLnk := AshortCut;
    PersistFile.Save(PWideChar(NomeLnk), False);
  end;

var
  FilePath: array [0..MAX_PATH] of Char;
  FileNameShortCut: string;

begin
  inherited;

  SHGetFolderPath(0, CSIDL_DESKTOP, 0, 0, FilePath);
  FileNameShortCut := IncludeTrailingPathDelimiter(string(FilePath));

  MakeShortCut(FileNameShortCut + 'HW NFC-e.lnk',
               'HW NFC-e',
               ExtractFilePath(Application.ExeName) + 'HwSistemas.exe',
               'pkAutomacao TfrmPrincipalS modonfce',
               ExtractFilePath(Application.ExeName));
end;

procedure TfrmCadNFCe.CriarNFCecomplementar1Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try

    NFCe.CriarComplementar;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.btAlterarPagamentoClick(Sender: TObject);
begin
  inherited;
  if not NFCe.PermiteAlteracaoPagamento then
    Exit;

  if NFCe.Pagamento.dataSet.IsEmpty then
    Exit;

  btCancelaPagamento.Visible := True;
  btSalvarPagamento.Top := 22;

  lkFormaPagamento.KeyValue := NFCe.Pagamento.dataSet.FieldByName('tpag').AsInteger;
  edValorPagamento.AsValue  := NFCe.Pagamento.dataSet.FieldByName('vpag').AsFloat;
  lkBandeira.KeyValue       := NFCe.Pagamento.dataSet.FieldByName('tband').AsInteger;
  edNumAutorizacao.Text     := NFCe.Pagamento.dataSet.FieldByName('caut').AsString;
  lkindpag.KeyValue         := NFCe.Pagamento.dataSet.FieldByName('indpag').AsString;

  if (Self.Enabled) and (Self.Visible) and (lkCtrlFormPagamento.CanFocus) then
    lkCtrlFormPagamento.SetFocus;

  NFCe.Pagamento.TipoPagamento.dataSet.Locate('codigo_ctrl;nfce_tpag', VarArrayOf([
    NFCe.Pagamento.dataSet.FieldByName('cod_controle').AsInteger, NFCe.Pagamento.dataSet.FieldByName('tpag').AsInteger]), []);
  lkCtrlFormPagamento.KeyValue := NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('ID').AsString;

  lkFormaPagamento.Visible := (NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('cartao_sped').AsInteger > 0) and
                              (NFCe.ConfigNFCe.Cartao.HabCampoAdicional);
  lbFormaPagamento.Visible := lkFormaPagamento.Visible;
  lkFormaPagamento.KeyValue := NFCe.Pagamento.dataSet.FieldByName('tpag').AsInteger;
  lkBandeira.Enabled       := Length(Trim(NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('cpfcgc').AsString)) = 14;
  edNumAutorizacao.Enabled := lkBandeira.Enabled;  

  gridPagamentos.Enabled := False;
end;

procedure TfrmCadNFCe.btAlterarVendedorClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NFC029', 'ALTERAR', NFCe.Audit_Dados + ' ANTES.COD.VEND: ' + NFCe.dataSet.FieldByName('COD_VENDEDOR').AsString ,
    'NFCE', NFCe.Audit_Codigo, NFCe.buscas) then
    exit;
  DBEdit29.Enabled       := True;
  lookupVendedor.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
  	DBEdit29.SetFocus;
end;

procedure TfrmCadNFCe.btSalvarPagamentoClick(Sender: TObject);
var
  Aindpag: string;
begin
  inherited;

  if not NFCe.PermiteAlteracaoPagamento then
    Exit;

  lkFormaPagamento.Color := clWindow;
  edValorPagamento.Color := clWindow;
  lkBandeira.Color := clWindow;
  edNumAutorizacao.Color := clWindow;

  if lkCtrlFormPagamento.KeyValue = Null then
    lkFormaPagamento.Color := $009887F5;

  if edValorPagamento.AsValue <= 0 then
    edValorPagamento.Color := $009887F5;

  if lkFormaPagamento.KeyValue = Null then
  begin
    lkFormaPagamento.Visible := True;
    lbFormaPagamento.Visible := lkFormaPagamento.Visible;
    lkFormaPagamento.Color := $009887F5;
  end;

//  if lkBandeira.Enabled then
//  begin
//    if lkBandeira.KeyValue = Null then
//      lkBandeira.Color := $009887F5;
//
//    if Trim(edNumAutorizacao.Text) = '' then
//      edNumAutorizacao.Color := $009887F5;
//  end;

  if (lkCtrlFormPagamento.KeyValue = Null) or
    (edValorPagamento.AsValue <= 0) or
    ((lkFormaPagamento.Visible) and (lkFormaPagamento.KeyValue = Null)) //or
//    ((lkBandeira.Enabled) and (lkBandeira.KeyValue = Null)) or
//    ((lkBandeira.Enabled) and (Trim(edNumAutorizacao.Text) = ''))
    then
  begin
    if (lkCtrlFormPagamento.KeyValue = Null) and (Self.Enabled) and (Self.Visible) and (lkCtrlFormPagamento.CanFocus) then
      lkCtrlFormPagamento.SetFocus
    else if (edValorPagamento.AsValue <= 0) and (Self.Enabled) and (Self.Visible) and (edValorPagamento.CanFocus) then
      edValorPagamento.SetFocus
    else if ((lkFormaPagamento.Visible) and (lkFormaPagamento.KeyValue = Null)) and (Self.Enabled) and (Self.Visible) and (lkFormaPagamento.CanFocus) then
      lkFormaPagamento.SetFocus
    else if ((lkBandeira.Enabled) and (lkBandeira.KeyValue = Null)) and (Self.Enabled) and (Self.Visible) and (lkBandeira.CanFocus) then
      lkBandeira.SetFocus
    else if ((lkBandeira.Enabled) and (Trim(edNumAutorizacao.Text) = '')) and (Self.Enabled) and (Self.Visible) and (edNumAutorizacao.CanFocus) then
      edNumAutorizacao.SetFocus;
    Exit;
  end;

  if lkindpag.KeyValue <> Null then
    Aindpag := lkindpag.KeyValue
  else
    Aindpag := '';

  if not NFCe.Pagamento.SetPagamento(btCancelaPagamento.Visible, NFCe.Pagamento.TipoPagamento.fint('codigo_ctrl'), lkBandeira.KeyValue,
                                     NFCe.Pagamento.TipoPagamento.fint('nfce_tpag'), edValorPagamento.AsValue,
                                     edNumAutorizacao.Text, Aindpag) then
    setFocusCampoErro(NFCe.Pagamento.vNomeCampoErro, NFCe.Pagamento.vMensagemErro)
  else
    btCancelaPagamento.Click; // reset

  //if not (NFCe.EmEmissaoEx and NFCe.ConfigNFCe.Pedido.AutorizarComPgtoAuto) then
    if (NFCe.Pagamento.ValorTotal >= NFCe.ffloat('vnf')) and (NFCe.ConfigNFCe.Regras.EmitirAposCompletarPagamentos) then
      btAtalhoEmitir.Click;
end;

procedure TfrmCadNFCe.btSelectAllClick(Sender: TObject);
begin
  inherited;
  NFCe.checkUnCheckAllRows(True);
end;

procedure TfrmCadNFCe.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  NFCe.checkUnCheckAllRows(False);
end;

procedure TfrmCadNFCe.v2_bt_nav_botao_assign(BitBtns: array of TBitBtn);
var
  I: Integer;
begin
  for I := Low(BitBtns) to High(BitBtns) do
  begin
    BitBtns[I].OnEnter := v2_bt_nav_negrito_enter;
    BitBtns[I].OnExit  := v2_bt_nav_negrito_exit;
    v2_bt_nav_negrito_exit(BitBtns[I]);
  end;
end;

procedure TfrmCadNFCe.v2_bt_nav_negrito_enter(Sender: TObject);
begin
  TBitBtn(Sender).Font.Style := TBitBtn(Sender).Font.Style + [fsBold];
  TBitBtn(Sender).Font.Size  := 11;
  TBitBtn(Sender).Font.Color := clMaroon;
  TBitBtn(Sender).Caption    := UpperCase(TBitBtn(Sender).Caption);
  TBitBtn(Sender).Caption    := StringReplace(TBitBtn(Sender).Caption, 'NFCE', 'NFCe', [rfIgnoreCase, rfReplaceAll]);
  TBitBtn(Sender).Caption    := StringReplace(TBitBtn(Sender).Caption, 'NFC-E', 'NFC-e', [rfIgnoreCase, rfReplaceAll]);
end;

procedure TfrmCadNFCe.v2_bt_nav_negrito_exit(Sender: TObject);
begin
  TBitBtn(Sender).Font.Style := TBitBtn(Sender).Font.Style - [fsBold];
  TBitBtn(Sender).Font.Size  := 10;
  TBitBtn(Sender).Font.Color := clWindowText;
  TBitBtn(Sender).Font.Name  := 'Verdana';//'Lucida console';
  TBitBtn(Sender).Caption    := TBitBtn(Sender).Caption[1] + Copy(LowerCase(TBitBtn(Sender).Caption), 2, Length(TBitBtn(Sender).Caption));
  TBitBtn(Sender).Caption    := StringReplace(TBitBtn(Sender).Caption, 'NFCE', 'NFCe', [rfIgnoreCase, rfReplaceAll]);
  TBitBtn(Sender).Caption    := StringReplace(TBitBtn(Sender).Caption, 'NFC-E', 'NFC-e', [rfIgnoreCase, rfReplaceAll]);
end;

procedure TfrmCadNFCe.btAlterarItemClick(Sender: TObject);
begin
  inherited;
  if not NFCe.PermiteAlteracaoItens then
    Exit;
  btSalvarItem.Font.Size := 8;
  btCancelarItem.Visible := True;
  edCodigo.Enabled       := False;

  edCodigo.Text          := NFCe.Itens.dataSet.FieldByName('num_fab_prod').AsString;
  edDescrProd.Text       := NFCe.Itens.dataSet.FieldByName('xprod').AsString;
  edQtde.AsValue         := NFCe.Itens.ffloat('qcom') * IfThen(NFCe.Itens.ffloat('uvnd_fator') > 0, NFCe.Itens.ffloat('uvnd_fator'), 1);
  edVlTot.AsValue        := NFCe.Itens.ffloat('vprod');
  edVlUn.AsValue         := NFCe.Itens.ffloat('vprod') / edQtde.AsValue;
  edDescR.AsValue        := NFCe.Itens.dataSet.FieldByName('vdesc').AsFloat;

  edUndVnd.Items         := NFCe.Itens.UndVenda;
  edUndVnd.ItemIndex     := 0;

  edDescRExit(edDescR);

  if (Self.Enabled) and (Self.Visible) and (edQtde.CanFocus) then
    edQtde.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (edVlUn.CanFocus) then
    edVlUn.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (edVlTot.CanFocus) then
    edVlTot.SetFocus;

  gridItens.Enabled := False;
end;

procedure TfrmCadNFCe.btAtalhoCabecalhoClick(Sender: TObject);
begin
  inherited;
  if (PageControl1.ActivePage = TabSheet1) and (PageControl3.ActivePage = tsCadastro) then
    if not (pageDadosNFCe.ActivePage = tsCabecalho) then
      pageDadosNFCe.ActivePage := tsCabecalho;
end;

procedure TfrmCadNFCe.btAtalhoEmitirClick(Sender: TObject);
var
  Retorno: Boolean;
begin
  inherited;
  try
    pageDadosNFCe.Enabled      := False;
    btAtalhoItens.Enabled      := False;
    btAtalhoCabecalho.Enabled  := False;
    btAtalhoValores.Enabled    := False;
    btAtalhoFechamento.Enabled := False;
    btAtalhoEmitir.Enabled     := False;

    with NFCe.ValidacaoQualquerAlteracao do
      if Situacao = sitAutorizada then
        Retorno := NFCe.Imprimir()
      else
        Retorno := NFCe.Emitir();
    
    if Retorno then
      if NFCe.EmEmissaoEx then
        TForm(PanelLeft.Parent).ModalResult := mrCancel
      else if btAtalhoEmitir.Tag = 1 then
      begin    
        pageDadosNFCe.Enabled      := True;
        BitBtn3.Click;
        if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
          edCodigo.SetFocus;
      end
      else
      begin
        PageControl1.ActivePage := TabSheet2;
        if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
          DBGrid1.SetFocus;
      end;
//    if vDadosIni.abreForm('Emissão NFC', pnEmissao, [ofAutoSize, ofAlignAllClientWinCtrl, ofEscapeExit]) then
//    begin
//      PageControl1.ActivePage := TabSheet2;
//      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//        DBGrid1.SetFocus;
//    end;

  finally
    pageDadosNFCe.Enabled      := True;
    btAtalhoItens.Enabled      := True;
    btAtalhoCabecalho.Enabled  := True;
    btAtalhoValores.Enabled    := True;
    btAtalhoFechamento.Enabled := True;
    btAtalhoEmitir.Enabled     := True;
    if not NFCe.EmEmissaoEx then
      montarComponentes;
  end;
end;

procedure TfrmCadNFCe.btAtalhoFechamentoClick(Sender: TObject);
begin
  inherited;
  if (PageControl1.ActivePage = TabSheet1) and (PageControl3.ActivePage = tsCadastro) then
    if not (pageDadosNFCe.ActivePage = tsFechamento) then
    begin
      pn01Fechamento.TabOrder := 99;
      pageDadosNFCe.ActivePage := tsFechamento;
      btCancelaPagamento.Click;
    end;
end;

procedure TfrmCadNFCe.btAtalhoItensClick(Sender: TObject);
begin
  inherited;
  if (PageControl1.ActivePage = TabSheet1) and (PageControl3.ActivePage = tsCadastro) then
    if not (pageDadosNFCe.ActivePage = tsItens) then
      pageDadosNFCe.ActivePage := tsItens
    else
    begin
      if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
        edCodigo.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (edQtde.CanFocus) then
        edQtde.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (edVlUn.CanFocus) then
        edVlUn.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (edVlTot.CanFocus) then
        edVlTot.SetFocus;
    end;
end;

procedure TfrmCadNFCe.btAtalhoValoresClick(Sender: TObject);
begin
  inherited;
  if (PageControl1.ActivePage = TabSheet1) and (PageControl3.ActivePage = tsCadastro) then
    if not (pageDadosNFCe.ActivePage = tsTotais) then
      pageDadosNFCe.ActivePage := tsTotais;
end;

procedure TfrmCadNFCe.btCancelaPagamentoClick(Sender: TObject);
begin

  lkCtrlFormPagamento.KeyValue := Null;
  lkFormaPagamento.KeyValue := Null;
  edValorPagamento.AsValue := 0;
  lkBandeira.KeyValue := Null;
  edNumAutorizacao.Clear;

  lkFormaPagamento.Color := clWindow;
  edValorPagamento.Color := clWindow;
  lkBandeira.Color       := clWindow;
  edNumAutorizacao.Color := clWindow;

  btCancelaPagamento.Visible := False;
  btSalvarPagamento.Top := 36;
  gridPagamentos.Enabled := True;
  edPagamentValorTotal.AsValue := NFCe.Pagamento.ValorTotal;

  if (Self.Enabled) and (Self.Visible) and (lkCtrlFormPagamento.CanFocus) then
    lkCtrlFormPagamento.SetFocus;
end;

procedure TfrmCadNFCe.btCancelarItemClick(Sender: TObject);
begin
  inherited;

  edCodigo.Clear;
  edDescrProd.Clear;
  edQtde.Clear;
  edVlUn.Clear;
  edVlTot.Clear;
  edDescP.Clear;
  edDescR.Clear;
  edVlLiq.Clear;
  edUndVnd.Items.Clear;
  edUndVnd.ItemIndex := -1;

  edCodigo.Color := clWindow;
  edDescrProd.Color := clWindow;
  edQtde.Color := clWindow;
  edVlUn.Color := clWindow;
  edVlTot.Color := clWindow;
  edDescP.Color := clWindow;
  edDescR.Color := clWindow;
  edVlLiq.Color := clWindow;
  edUndVnd.Color := clWindow;

  btSalvarItem.Font.Size := 12;
  btCancelarItem.Visible := False;
  edCodigo.Enabled := True;
  gridItens.Enabled := True;

  pnSeqPreco.Visible := (NFCe.Itens.dataSet.RecordCount = 0) and (NFCe.lkSeqPreco.dataSet.RecordCount > 0);

  if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
    edCodigo.SetFocus;
end;

procedure TfrmCadNFCe.btExcluirDestClick(Sender: TObject);
begin
  inherited;
  if not NFCe.PermiteAlteracaoPagamento then
    Exit;
  NFCe.Dest.Delete;
end;

procedure TfrmCadNFCe.btExcluirItemClick(Sender: TObject);
begin
  inherited;
  if not NFCe.PermiteAlteracaoItens then
    Exit;
  NFCe.Itens.Delete;
  pnSeqPreco.Visible := (NFCe.Itens.dataSet.RecordCount = 0) and (NFCe.lkSeqPreco.dataSet.RecordCount > 0);
end;

procedure TfrmCadNFCe.Dadoscertificado1Click(Sender: TObject);
begin
  inherited;
  ShowAtencao(StrReplace(NFCe.DadosCertificado.Text, [';'], sLineBreak));
end;

procedure TfrmCadNFCe.DBEdit11Exit(Sender: TObject);
var
  ClienteConsumidor: Boolean;
begin
  inherited;
  NFCe.SetCliente(False, ClienteConsumidor);
  DBEdit8.ReadOnly := not ClienteConsumidor;
  DBEdit9.ReadOnly := not ClienteConsumidor;
end;

procedure TfrmCadNFCe.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ClienteConsumidor: Boolean;
begin
  inherited;
  if Key = VK_F3 then
  begin
    NFCe.SetCliente(True, ClienteConsumidor);
    DBEdit8.ReadOnly := not ClienteConsumidor;
    DBEdit9.ReadOnly := not ClienteConsumidor;
  end;
end;

procedure TfrmCadNFCe.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  NFCe.SetTransportador(False);
end;

procedure TfrmCadNFCe.DBEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    NFCe.SetTransportador(True);
end;

procedure TfrmCadNFCe.edNaturezaOperacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    NFCe.SetNaturezaDeOperacao;
end;

procedure TfrmCadNFCe.DBEdit29Exit(Sender: TObject);
begin
  inherited;
  
  if not NFCe.lkVendedor.dataSet.Locate('COD_VENDEDOR', VarArrayOf([NFCe.dataSet.FieldByName('cod_vendedor').AsInteger]), [])then
  begin
    vDadosIni.ShowAtencao('Vendedor não encontrado');

    lookupVendedor.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (lookupVendedor.CanFocus) then
    	lookupVendedor.SetFocus;
  end;

  if (ActiveControl <> lookupVendedor) and
    (ActiveControl <> DBEdit29) then
  begin
    DBEdit29.Enabled       := False;
    lookupVendedor.Enabled := False;
    vDadosIni.GravaAuditoria('NFC029', 'ALTERAR', NFCe.Audit_Dados + ' DEPOIS.COD.VEND: ' + NFCe.dataSet.FieldByName('COD_VENDEDOR').AsString ,
      'NFCE', NFCe.Audit_Codigo, NFCe.buscas);
  end;
end;

procedure TfrmCadNFCe.DBEdit30Exit(Sender: TObject);
var
  AEdit: TDBEdit;
begin
  inherited;
  AEdit := TDBEdit(Sender);
  if Trim(AEdit.Text) = '' then
    Exit;

  if Length(Trim(AEdit.Text)) = 11 then
    if NFCe.Dest.Cpf(Trim(AEdit.Text)) then
      Exit;

  if Length(Trim(AEdit.Text)) = 14 then
    if NFCe.Dest.cgc(Trim(AEdit.Text)) then
      Exit;

  vDadosIni.ShowErro('CPF ou CNPJ informado inválido');
  if (Self.Enabled) and (Self.Visible) and (AEdit.CanFocus) then
  	AEdit.SetFocus;
end;

procedure TfrmCadNFCe.DBEdit51Exit(Sender: TObject);
begin
  inherited;
  NFCe.AtualizarValorTotalLiquido;
end;

procedure TfrmCadNFCe.DBEdit66Exit(Sender: TObject);
var
  ClienteConsumidor: Boolean;
begin
  inherited;
  NFCe.SetCliente(False, ClienteConsumidor);
  DBEdit63.ReadOnly := not ClienteConsumidor;
  DBEdit64.ReadOnly := not ClienteConsumidor;
end;

procedure TfrmCadNFCe.DBEdit66KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ClienteConsumidor: Boolean;
begin
  inherited;
  if Key = VK_F3 then
  begin
    NFCe.SetCliente(True, ClienteConsumidor);
    DBEdit63.ReadOnly := not ClienteConsumidor;
    DBEdit64.ReadOnly := not ClienteConsumidor;
  end;
end;

procedure TfrmCadNFCe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

  procedure Colorir(brushColor: TColor = clWindow; fontColor: TColor = clWindowText);
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := brushColor;
      TDBGrid(sender).canvas.Font.color := fontColor;
    end;
  end;

var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if NFCe.fequals('status', stsACancelar) and NFCe.fequals('situacao_nfce', sitAutorizada) then
    Colorir($00CECEFF)
  else if NFCe.fequals('status', stsACancelar) then       
    Colorir($00FFD2E9)
  else if NFCe.fequals('situacao_nfce', sitRejeitada) then
    Colorir($00D5FFFF);
//    Colorir($00E4E4F1);

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  {
  if Column.FieldName = 'SelecionaBoleto' then
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
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
  }
end;

procedure TfrmCadNFCe.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_F5 then
    NFCe.dataSet.Refresh;
end;

procedure TfrmCadNFCe.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  btAssumeSelecionaServico.Click;
end;

procedure TfrmCadNFCe.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btAssumeSelecionaServico.Click;
end;

procedure TfrmCadNFCe.grid_v2_cons_cliente_selecionarDblClick(Sender: TObject);
var
  ClienteConsumidor: Boolean;
  Status, Situacao: string;
begin
  inherited;
  if NFCe.dataSet.State in [dsEdit, dsInsert] then
  begin
    with NFCe.ValidacaoQualquerAlteracao do
      if Permitido then
      begin
        NFCe.dataSet.FieldByName('cod_cliente').AsInteger := NFCe.ConsultaCliente.fint('id');
        NFCe.SetCliente(False, ClienteConsumidor);
        print_cupom_cabecalho_change(NFCe);
        v2_cupom_show;
      end
      else
      begin
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')]);
        v2_cupom_show;
      end;
  end
  else
    v2_cupom_show;
end;

procedure TfrmCadNFCe.grid_v2_cons_cliente_selecionarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    grid_v2_cons_cliente_selecionarDblClick(grid_v2_cons_prod)
  else if Key = VK_ESCAPE then
  begin
    v2_cupom_show;
    ed_codigo_v2.SelectAll;
  end;
end;

procedure TfrmCadNFCe.grid_v2_cons_prodDblClick(Sender: TObject);
begin
  inherited;
  if current_from_select_prod then
  begin
    if (NFCe.Itens.Prod.fequals('alt_cod_cupom', 'S') or NFCe.Itens.Prod.fequals('alt_desc_cupom', 'S')) then
    begin
      ed_v2_alt_item_und.Items.Text := current.UndsVnd.Text;
      ed_v2_alt_item_und.ItemIndex := 0;

      v2_preparar_item_para_alterar_conf_prod(NFCe.Itens.Prod.fequals('alt_cod_cupom', 'S'), NFCe.Itens.Prod.fequals('alt_desc_cupom', 'S'));
      Exit;
    end;

    current_to_form_cupom;

    current_setproduto;
  end
  else
    v2_titulo_error(current.Error);

  v2_cupom_show;
end;

procedure TfrmCadNFCe.grid_v2_cons_prodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    grid_v2_cons_prodDblClick(grid_v2_cons_prod)
  else if Key = VK_ESCAPE then
  begin
    v2_cupom_show;
    v2_titulo_alerta('OPERAÇÃO CANCELADA PELO USUÁRIO');
    ed_codigo_v2.SelectAll;
  end;
end;

procedure TfrmCadNFCe.grid_v2_pag_ctrlEnter(Sender: TObject);
begin
  inherited;
  NFCe.Pagamento.TipoPagamento.filterStr('codigo_ctrl > 0');
end;

procedure TfrmCadNFCe.grid_v2_pag_ctrlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  troco: Double;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    with NFCe.ValidacaoQualquerAlteracao do
      if not Permitido then
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')])
      else if RoundTo(NFCe.Pagamento.ValorTotal, -2) >= NFCe.ffloat('vnf', -2) then
        v2_titulo_alerta('Valor dos pagamentos já atingiu o valor da NFC')
      else
      begin
        v2_titulo_alerta('Pagamentos [' + NFCe.Pagamento.TipoPagamento.fstr('nome_ctrl') + ']');
        currpag_reset;
        currpag.Valor := NFCe.ffloat('vnf') - NFCe.Pagamento.ValorTotal;
        currpag_to_form_pagamento;
        v2_form_pagamento_configura;
        THackWinControl(pn_v2_pag_valores).SelectFirst;
      end;
  end
  else if Key = VK_F4 then
  begin
    if NFCe.Pagamento.dataSet.IsEmpty then
      v2_titulo_alerta('Sem pagamentos')
    else
    begin
      pn_v2_pag_title.Caption   := '[Enter: Seleciona] [Del: Excluir] [ESC: Volta]';
      grid_v2_pag_ctrl.Visible  := False;
      grid_v2_pag_pgtos.Visible := True;
      if (Self.Enabled) and (Self.Visible) and (grid_v2_pag_pgtos.CanFocus) then
        grid_v2_pag_pgtos.SetFocus;
    end;
  end
  else if Key = VK_ESCAPE then
    v2_action_cancela_and_show_cupom(Sender)
  else if (Key = VK_F11) and (pn_v2_pag_concluido.Visible) then
  begin
    troco := NFCe.Pagamento.ValorTroco;
    if troco > 0 then
      v2_titulo_alerta('TROCO: %n', [troco]);
    v2_emitir;
  end;
end;

procedure TfrmCadNFCe.grid_v2_pag_ctrlKeyPress(Sender: TObject; var Key: Char);
var
  RecNo: Integer;
  VK: Word;
begin
  inherited;
  if Key in  ['1'..'9'] then
  begin
    RecNo := StrToInt(Key);
    if (grid_v2_pag_ctrl.DataSource.DataSet.RecordCount > 0) and (RecNo <= grid_v2_pag_ctrl.DataSource.DataSet.RecordCount) then
    begin
      VK := VK_RETURN;
      grid_v2_pag_ctrl.DataSource.DataSet.RecNo := RecNo;
      grid_v2_pag_ctrlKeyDown(grid_v2_pag_ctrl, VK, []);
    end;
  end;  
end;

procedure TfrmCadNFCe.grid_v2_pag_pgtosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    with NFCe.ValidacaoQualquerAlteracao do
      if not  Permitido then
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')])
      else
      begin
        if NFCe.Pagamento.fint('cod_controle') > 0 then
          NFCe.Pagamento.TipoPagamento.dataSet.Locate('codigo_ctrl', NFCe.Pagamento.fint('cod_controle'), [])
        else
          NFCe.Pagamento.TipoPagamento.dataSet.Locate('tpag', NFCe.Pagamento.fint('nfce_tpag'), []);
        currpag_from_pagamento;
        currpag_to_form_pagamento;
        v2_form_pagamento_configura;
        THackWinControl(pn_v2_pag_valores).SelectFirst;
      end;
  end
  else if Key = VK_ESCAPE then
    v2_pagamento_show
  else if Key = VK_DELETE then
  begin
    with NFCe.ValidacaoQualquerAlteracao do
      if not  Permitido then
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')])
      else
      begin
        v2_titulo_error(Format('%s - R$ %n', [NFCe.Pagamento.fstr('nome_ctrl'), NFCe.Pagamento.ffloat('vpag')]));
        NFCe.Pagamento.Delete;
        if NFCe.Pagamento.dataSet.RecordCount = 0 then
          v2_pagamento_show;
      end;
  end;
end;

procedure TfrmCadNFCe.grid_vnd_sem_emitDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Agrid: TDBGrid;
begin
  inherited;

  if Column.FieldName <> 'NUMERO' then
    Exit;

  Agrid := TDBGrid(Sender);

  if ContainsText(Agrid.DataSource.DataSet.FieldByName('NUMERO').AsString, Trim(ed_vnd_loc.Text)) then
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
end;

procedure TfrmCadNFCe.grid_vnd_sem_emitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F4     : if (Self.Enabled) and (Self.Visible) and (grid_vnd_sem_emit.CanFocus) then grid_vnd_sem_emit.SetFocus;
    VK_F5     : if (Self.Enabled) and (Self.Visible) and (ed_vnd_loc.CanFocus) then ed_vnd_loc.SetFocus;
    VK_F6     : sp_vnd_sem_emit_isentos.Click;
    VK_F7     : sp_vnd_sem_emit_conrib.Click;
    VK_F8     : sp_vnd_sem_emit_diatual.Click;
    VK_F9     : sp_vnd_sem_emit_novodia.Click;
    VK_F11    : sp_vnd_sem_emit_selecionar.Click;
    VK_ESCAPE : sp_vnd_sem_emit_voltar.Click;
    VK_RETURN : if (ActiveControl = ed_vnd_loc) and (Trim(ed_vnd_loc.Text) = VendasSemEmit.fstr('numero')) then sp_vnd_sem_emit_selecionar.Click;
  end;                                    
end;

procedure TfrmCadNFCe.gr_adicionalExit(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus; 
end;

procedure TfrmCadNFCe.DBLookupComboBox2Enter(Sender: TObject);
begin
  inherited;
  StrFieldOld := Trim(NFCe.dataSet.FieldByName('modfrete').AsString);
end;

procedure TfrmCadNFCe.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  NFCe.AtualizarInfFrete(StrFieldOld);
  DBEdit61.Enabled := Trim(NFCe.dataSet.FieldByName('modfrete').AsString) <> '9';
end;

procedure TfrmCadNFCe.gravaConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
  	for I := 0 to gb_situacao.Items.Count - 1 do
    	regSetConfBool(gb_situacao.Name + '_' + gb_situacao.Items[I], gb_situacao.Checked[I]);

  	for I := 0 to gb_status.Items.Count - 1 do
    	regSetConfBool(gb_status.Name + '_' + gb_status.Items[I], gb_status.Checked[I]);
  end;

	if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
  	regSetConfStr(ed_ad_campo.Name, ed_ad_campo.Text);
	  regSetConfStr(ed_ad_condicao.Name, ed_ad_condicao.Text);

    regSetConfStr(ed_ad_valor.Name, ed_ad_valor.Text);
    regSetConfStr(ed_ad_dataini.Name, ed_ad_dataini.Text);
    regSetConfStr(ed_ad_datafim.Name, ed_ad_datafim.Text);
  end;
end;

procedure TfrmCadNFCe.gridItensDblClick(Sender: TObject);
begin
  inherited;
  btAlterarItem.Click;
end;

procedure TfrmCadNFCe.gridItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    btExcluirItem.Click
  else if Key = VK_RETURN then
    btAlterarItem.Click;
end;

procedure TfrmCadNFCe.gridPagamentosDblClick(Sender: TObject);
begin
  inherited;
  btAlterarPagamento.Click;
end;

procedure TfrmCadNFCe.gridPagamentosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    btExcluirPagamento.Click
  else if Key = VK_RETURN then
    btAlterarPagamento.Click;
end;

procedure TfrmCadNFCe.gridSelecionaProdutosDblClick(Sender: TObject);
begin
  inherited;
  btAssumeSelecionaProduto.Click;
end;

procedure TfrmCadNFCe.gridSelecionaProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btAssumeSelecionaProduto.Click;
end;

procedure TfrmCadNFCe.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
	begin
  	for I := 0 to gb_situacao.Items.Count - 1 do
    	gb_situacao.Checked[I] := regGetConfBool(gb_situacao.Name + '_' + gb_situacao.Items[I], False);

    for I := 0 to gb_status.Items.Count - 1 do
    	gb_status.Checked[I] := regGetConfBool(gb_status.Name + '_' + gb_status.Items[I], False);
  end;

	if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
    CheckBox1Click(Self);
    if Trim(regGetConfStr(ed_ad_campo.Name, ComboBox1.Text)) <> '' then
    	ed_ad_campo.Text    := regGetConfStr(ed_ad_campo.Name, ComboBox1.Text);

    for I := 0 to ed_ad_campo.Items.Count - 1 do
    begin
      if trim(ed_ad_campo.Items[I]) = trim(ed_ad_campo.Text) then
      begin
        ed_ad_campo.ItemIndex := I;
        Break;
      end;
    end;

    ed_ad_campoExit(Self);
    if Trim(regGetConfStr(ed_ad_condicao.Name, ComboBox3.Text)) <> '' then
    	ed_ad_condicao.Text := regGetConfStr(ed_ad_condicao.Name, ComboBox3.Text);

    if Trim(regGetConfStr(ed_ad_valor.Name, MaskEdit3.Text)) <> '' then
    	ed_ad_valor.Text    := regGetConfStr(ed_ad_valor.Name, MaskEdit3.Text);
    if Trim(regGetConfStr(ed_ad_dataini.Name, MaskEdit1.Text)) <> '' then
  		ed_ad_dataini.Text  := regGetConfStr(ed_ad_dataini.Name, MaskEdit1.Text);
    if Trim(regGetConfStr(ed_ad_datafim.Name, MaskEdit2.Text)) <> '' then
	  	ed_ad_datafim.Text  := regGetConfStr(ed_ad_datafim.Name, MaskEdit2.Text);
  end;
end;

procedure TfrmCadNFCe.lkCtrlFormPagamentoEnter(Sender: TObject);
begin
  inherited;
  NFCe.Pagamento.TipoPagamento.filterClear;
end;

procedure TfrmCadNFCe.lkCtrlFormPagamentoExit(Sender: TObject);
begin
  inherited;
  lkFormaPagamento.Visible := (NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('cartao_sped').AsInteger > 0) and
                              (NFCe.ConfigNFCe.Cartao.HabCampoAdicional);
  lbFormaPagamento.Visible := lkFormaPagamento.Visible;
  if lkCtrlFormPagamento.KeyValue <> Null then
  begin
    lkFormaPagamento.KeyValue := NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('nfce_tpag').AsInteger;
    if edValorPagamento.AsValue = 0 then
      edValorPagamento.AsValue := edValorQueFaltaPagamento.AsValue;    
  end;
  lkBandeira.Enabled       := Length(Trim(NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('cpfcgc').AsString)) = 14;
  edNumAutorizacao.Enabled := lkBandeira.Enabled;
  if NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('codigo_ctrl').AsInteger > 0 then
    lkindpag.KeyValue := IfThen(NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('nat_ctrl').AsString = 'A', '0') +
                         IfThen(NFCe.Pagamento.TipoPagamento.dataSet.FieldByName('nat_ctrl').AsString = 'P', '1');
end;

procedure TfrmCadNFCe.lkCtrlFormPagamentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    btCancelaPagamento.Click;
end;

procedure TfrmCadNFCe.LogSincronizaoNFCeoffline1Click(Sender: TObject);
begin
  inherited;
  CreateProcessSimple(
    Format('%s%s LESS LOGSINCNFCE cnpj=%s empresaId=%d caixaId=%d',
          [ExtractFilePath(Application.ExeName), 'HWNFCServiceLess.exe',
           vDadosIni.vEmp.vCNPJ, vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor]));
end;

procedure TfrmCadNFCe.edCodigoEnter(Sender: TObject);
begin
  inherited;
  ReturnPressed := False;
end;

procedure TfrmCadNFCe.edCodigoExit(Sender: TObject);
var
  Qtde: Double;
  RecordCount: Integer;
  AleituraEAN13: string;
  Config: TConfig_sistema_class;
begin
  try
    inherited;

    if Trim(edCodigo.Text) = '' then
      ReturnPressed := False;

    if not ReturnPressed then
      Exit;

    if Pos('*', edCodigo.Text) > 1 then
    begin
      Qtde := StrToFloatDef(Trim(Copy(edCodigo.Text, 1, Pos('*', edCodigo.Text) - 1)), 0);
      edCodigo.Text := Copy(edCodigo.Text, Pos('*', edCodigo.Text) + 1, Length(edCodigo.Text));
      if Qtde > 0 then
        edQtde.AsValue := Qtde;
    end;

    if pnCaptionProdServ.Caption = 'Código Produto' then
    begin
      vDadosIni.vProduto.LeituraPesoBalanca.resetVals;
      AleituraEAN13 := NFCe.Itens.leituraEAN13_balanca(edCodigo.Text, RecordCount);

      if Copy(UpperCase(AleituraEAN13), 1, 4) = 'ERRO' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
        	edCodigo.SetFocus;
        Exit;
      end
      else if AleituraEAN13 = 'VALIDO' then
      begin
        edQtde.AsValue  := vDadosIni.vProduto.LeituraPesoBalanca.vals.peso;
        edVlTot.AsValue := vDadosIni.vProduto.LeituraPesoBalanca.vals.preco;
        edVlUn.AsValue  := edVlTot.AsValue / edQtde.AsValue;
      end
      else
      if not NFCe.Itens.buscaProduto(False, edCodigo.Text, RecordCount) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
        	edCodigo.SetFocus;
        Exit;
      end;

      if RecordCount > 1 then
      begin
        try
          NFCe.Itens.Prod.EventoAfterScroll := EventoAfterScrollProdutos;
          if not vDadosIni.abreForm('Escolha o produto', pnSelecionaProduto, [ofAutoSize, ofAlignAllClientWinCtrl, ofEscapeExit]) then
          begin
          	if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
            	edCodigo.SetFocus;
            Exit;
          end;
        finally
          NFCe.Itens.Prod.EventoAfterScroll := nil;
        end;
      end;

      if RecordCount > 0 then
      begin
        edUndVnd.Items := NFCe.Itens.Prod.UndVenda;
        edUndVnd.ItemIndex := 0;
      end;

      try
      	Config := TConfig_sistema_class.getConf('ped_vnd_identificacao_produto', NFCe.buscas, vDadosIni.cod_empresa);

        if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'NUMEROFABRICANTE') then
          edCodigo.Text := Trim(NFCe.Itens.Prod.dataSet.FieldByName('num_fab_prod').AsString)
        else if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'GRUPOCODIGO') then
        	edCodigo.Text := IntToStr(NFCe.Itens.Prod.dataSet.FieldByName('grupo_prod').AsInteger) + Trim(NFCe.Itens.Prod.dataSet.FieldByName('cod_prod').AsString)
        else if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'CODIGO') then
        	edCodigo.Text := Trim(NFCe.Itens.Prod.dataSet.FieldByName('cod_prod').AsString)
      	else
      		edCodigo.Text := Trim(NFCe.Itens.Prod.dataSet.FieldByName('cod_barra').AsString);
      finally
        if Assigned(Config) then
          FreeAndNil(Config);
      end;

      pnSeqPreco.Visible := False;

      edDescrProd.Text := IfThen(
        (NFCe.ConfigNFCe.Itens.DescricaoReduzida) and (Trim(NFCe.Itens.Prod.dataSet.FieldByName('descr_prod_red').AsString) <> ''),
        Trim(NFCe.Itens.Prod.dataSet.FieldByName('descr_prod_red').AsString),
        Trim(NFCe.Itens.Prod.dataSet.FieldByName('descr_prod').AsString)) +
        vDadosIni.IfThen( NFCe.Itens.Prod.dataSet.FieldByName('cod_grade').AsInteger > 0,
          vDadosIni.IfThen(NFCe.ConfigNFCe.Itens.Grades.CaracterSeparador <> '', NFCe.ConfigNFCe.Itens.Grades.CaracterSeparador, '-') +
          vDadosIni.IfThen(NFCe.ConfigNFCe.Itens.Grades.UsarDescricao1Ou2 <> '2',
            Trim(NFCe.Itens.Prod.dataSet.FieldByName('descricao').AsString),
            Trim(NFCe.Itens.Prod.dataSet.FieldByName('descricao1').AsString)
          ),
        '');

      if vDadosIni.vProduto.LeituraPesoBalanca.vals.preco = 0 then
      begin
        if edQtde.AsValue  = 0 then
          edQtde.AsValue := 1;
        edVlUn.AsValue := CalcularValorVenda(NFCe.Itens.Prod.ValorDeVenda, edUndVnd.Items, edUndVnd.ItemIndex);
        edVlTot.AsValue := edQtde.AsValue * edVlUn.AsValue;
      end;
      if edDescP.AsValue > 0 then
        edDescPExit(edDescP);
      edVlLiq.AsValue := edVlTot.AsValue - edDescR.AsValue;
    end
    else if pnCaptionProdServ.Caption = 'Código Serviço' then
    begin
      if not NFCe.Itens.buscaServico(False, edCodigo.Text, RecordCount) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
        	edCodigo.SetFocus;
        Exit;
      end;
      
      if RecordCount > 1 then
        if not vDadosIni.abreForm('Escolha o serviço', pnSelecionaServico, [ofAutoSize, ofAlignAllClientWinCtrl, ofEscapeExit]) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
          	edCodigo.SetFocus;
          Exit;
        end;

      edCodigo.Text := IntToStr(NFCe.Itens.Serv.dataSet.FieldByName('COD_SERVICO').AsInteger);
      edDescrProd.Text := Trim(NFCe.Itens.Serv.dataSet.FieldByName('DESC_SERVICO').AsString);
      if edQtde.AsValue  = 0 then
        edQtde.AsValue := 1;
      edVlUn.AsValue := NFCe.Itens.Serv.dataSet.FieldByName('VALOR_SERVICO').AsFloat;
      edVlTot.AsValue := edQtde.AsValue * edVlUn.AsValue;
      if edDescP.AsValue > 0 then
        edDescPExit(edDescP);
      edVlLiq.AsValue := edVlTot.AsValue - edDescR.AsValue;
    end;
  finally
    ReturnPressed := False;
  end;
end;

procedure TfrmCadNFCe.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  RecordCount: Integer;
  Config: TConfig_sistema_class;
begin
  inherited;
  if Key = VK_F3 then
  begin
    pnCaptionProdServ.Caption := 'Código Produto';
    if not NFCe.Itens.buscaProduto(True, edCodigo.Text, RecordCount) then
      Exit;

    if RecordCount > 0 then
    begin
      edUndVnd.Items := NFCe.Itens.Prod.UndVenda;
      edUndVnd.ItemIndex := 0;
    end;

    try
     	Config := TConfig_sistema_class.getConf('ped_vnd_identificacao_produto', NFCe.buscas, vDadosIni.cod_empresa);

      if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'NUMEROFABRICANTE') then
      	edCodigo.Text := Trim(NFCe.Itens.Prod.dataSet.FieldByName('num_fab_prod').AsString)
      else if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'GRUPOCODIGO') then
        edCodigo.Text := IntToStr(NFCe.Itens.Prod.dataSet.FieldByName('grupo_prod').AsInteger) + Trim(NFCe.Itens.Prod.dataSet.FieldByName('cod_prod').AsString)
      else if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'CODIGO') then
        edCodigo.Text := Trim(NFCe.Itens.Prod.dataSet.FieldByName('cod_prod').AsString)
      else
    		edCodigo.Text := Trim(NFCe.Itens.Prod.dataSet.FieldByName('num_fab_prod').AsString);
    finally
      if Assigned(Config) then
      	FreeAndNil(Config);
    end;
    edDescrProd.Text := vDadosIni.IfThen( NFCe.ConfigNFCe.Itens.DescricaoReduzida,
      Trim(NFCe.Itens.Prod.dataSet.FieldByName('descr_prod_red').AsString),
      Trim(NFCe.Itens.Prod.dataSet.FieldByName('descr_prod').AsString));
    if edQtde.AsValue  = 0 then
      edQtde.AsValue := 1;
    edVlUn.AsValue := CalcularValorVenda(NFCe.Itens.Prod.ValorDeVenda, edUndVnd.Items, edUndVnd.ItemIndex);
    edVlTot.AsValue := edQtde.AsValue * edVlUn.AsValue;
    if edDescP.AsValue > 0 then
      edDescPExit(edDescP);
    edVlLiq.AsValue := edVlTot.AsValue - edDescR.AsValue;
    if (Self.Enabled) and (Self.Visible) and (edQtde.CanFocus) then
      edQtde.SetFocus;
  end
  else if not (ssAlt in Shift) and not (ssShift in Shift) and (Key = VK_F4) then
  begin
    if not NFCe.ConfigNFCe.ISS.PermitirServicos then
    begin
      Application.MessageBox('Configuração da NFC-e não permite incluir serviços', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      Exit;
    end;
    pnCaptionProdServ.Caption := 'Código Serviço';
    if not NFCe.Itens.buscaServico(True, edCodigo.Text, RecordCount) then
      Exit;
    pnCaptionProdServ.Caption := 'Código Serviço';
    edCodigo.Text := IntToStr(NFCe.Itens.Serv.dataSet.FieldByName('COD_SERVICO').AsInteger);
    edDescrProd.Text := Trim(NFCe.Itens.Serv.dataSet.FieldByName('DESC_SERVICO').AsString);
    if edQtde.AsValue  = 0 then
      edQtde.AsValue := 1;
    edVlUn.AsValue := NFCe.Itens.Serv.dataSet.FieldByName('VALOR_SERVICO').AsFloat;
    edVlTot.AsValue := edQtde.AsValue * edVlUn.AsValue;
    if edDescP.AsValue > 0 then
      edDescPExit(edDescP);
    edVlLiq.AsValue := edVlTot.AsValue - edDescR.AsValue;
    if (Self.Enabled) and (Self.Visible) and (edQtde.CanFocus) then
      edQtde.SetFocus;
  end
  else if Key = VK_RETURN then
  begin
    ReturnPressed := True;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end
  else if Key = VK_ESCAPE then
  begin
    btCancelarItem.Click;
  end;
end;

procedure TfrmCadNFCe.edDescPEnter(Sender: TObject);
begin
  inherited;
  DescPercOld := edDescP.AsValue;
end;

procedure TfrmCadNFCe.edDescPExit(Sender: TObject);
var
  DescPercNew: Double;
begin
  inherited;
  if edVlTot.AsValue <= 0 then
    Exit;
  edDescP.AsValue := vDadosIni.IfThen( edDescP.AsValue < 0, 0.00, edDescP.AsValue);
  DescPercNew := edDescP.AsValue;
  if DescPercNew <> DescPercOld then
  begin
    edDescR.AsValue := edDescP.AsValue * edVlTot.AsValue / 100;
    edDescP.AsValue := edDescR.AsValue / edVlTot.AsValue * 100;
    edVlLiq.AsValue := edVlTot.AsValue - edDescR.AsValue;
  end;
end;

procedure TfrmCadNFCe.edDescRExit(Sender: TObject);
begin
  inherited;
  if edVlTot.AsValue <= 0 then
    Exit;
  edDescP.AsValue := edDescR.AsValue / edVlTot.AsValue * 100;
  edVlLiq.AsValue := edVlTot.AsValue - edDescR.AsValue;
end;

procedure TfrmCadNFCe.ed_v2_exclusao_item_opcaoKeyPress(Sender: TObject;
  var Key: Char);
var
  Mensagem, Status, Situacao: string;
  CountIntens: Integer;
begin
  inherited;
  //
  if Key = '1' then
  begin
    with NFCe.ValidacaoQualquerAlteracao do
      if not Permitido then
      begin
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')]);
        Exit;
      end;

    Mensagem    := Format('Exclusão R$ %n - %s %s', [NFCe.Itens.ffloat('vprod'),
                                                     IfThen(NFCe.Itens.str_empty('cean'), NFCe.Itens.fstr('num_fab_prod'), NFCe.Itens.fstr('cean')),
                                                     NFCe.Itens.fstr('xprod')]);
    CountIntens := NFCe.Itens.dataSet.RecordCount;

    if not NFCe.Itens.Delete then
      v2_titulo_error(NFCe.Itens.vMensagemErro);

    print_cupom_itens_change(NFCe);
    if CountIntens <> NFCe.Itens.dataSet.RecordCount then
      v2_titulo_alerta(Mensagem);

    v2_cupom_show;
  end
  else if Key = '2' then
    v2_action_cancela_and_show_cupom(Sender)
  else
    ed_v2_exclusao_item_opcao.Text := '      1: Sim - 2: Não      ';
  ed_v2_exclusao_item_opcao.SelectAll;
  Key := #0;
end;

procedure TfrmCadNFCe.edQtdeExit(Sender: TObject);
begin
  inherited;
  if edQtde.AsValue <= 0 then
    Exit;

  edQtde.AsValue := NFCe.helperConv.HandleUnidadeFracao(edUndVnd.Text, edQtde.AsValue);

  edQtde.AsValue := edQtde.AsValue;
  if pnIT05VlTot.Enabled then // valor total habilitado
  begin
    edVlTot.AsValue := edVlUn.AsValue * edQtde.AsValue;
    edVlUn.AsValue := edVlTot.AsValue / edQtde.AsValue;
  end
  else // valor unitario habilitado
  begin
    edVlTot.AsValue := edVlUn.AsValue * edQtde.AsValue;
    edVlUn.AsValue := edVlTot.AsValue / edQtde.AsValue;
  end;
  DescPercOld := edDescP.AsValue + 1;
  edDescPExit(edDescP);

  //mesma coisa
end;

procedure TfrmCadNFCe.edQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    btCancelarItem.Click;
end;

procedure TfrmCadNFCe.edUndVndChange(Sender: TObject);
var
  undVenda: TUnidadeVenda_Model;
  vlPrincipal: Double;
begin
  inherited;

  if edUndVnd.Items.Count = 0 then
    Exit;

  if (edUndVnd.ItemIndex = -1) or (edUndVnd.Tag = -1) then
    Exit;

  undVenda := (edUndVnd.Items.Objects[edUndVnd.Tag] as TUnidadeVenda_Model);
  vlPrincipal := edVlTot.AsValue * undVenda.fator;

  undVenda := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);
  edVlTot.AsValue := vlPrincipal / undVenda.fator;
  edVlUn.AsValue := edVlTot.AsValue / edQtde.AsValue;
  edUndVnd.Tag := edUndVnd.ItemIndex;

  DescPercOld := edDescP.AsValue + 1;
  edDescPExit(edDescP);
end;

procedure TfrmCadNFCe.edUndVndEnter(Sender: TObject);
begin
  inherited;
  edUndVnd.Tag := edUndVnd.ItemIndex;
end;

procedure TfrmCadNFCe.edVlLiqExit(Sender: TObject);
begin
  inherited;
  if edVlTot.AsValue <= 0 then
    Exit;
  if edVlLiq.AsValue > edVlTot.AsValue then
    edVlLiq.AsValue := edVlTot.AsValue;
  edDescR.AsValue := edVlTot.AsValue - edVlLiq.AsValue;
  edDescP.AsValue := edDescR.AsValue / edVlTot.AsValue * 100;
end;

procedure TfrmCadNFCe.edVlTotExit(Sender: TObject);
begin
  inherited;
  if edQtde.AsValue <= 0 then
    Exit;
  edVlUn.AsValue := edVlTot.AsValue / edQtde.AsValue;

  DescPercOld := edDescP.AsValue + 1;
  edDescPExit(edDescP);
end;

procedure TfrmCadNFCe.edVlUnExit(Sender: TObject);
begin
  inherited;
  edVlTot.AsValue := edVlUn.AsValue * edQtde.AsValue;

  DescPercOld := edDescP.AsValue + 1;
  edDescPExit(edDescP);
  
//  edVlLiqExit
end;

procedure TfrmCadNFCe.ed_codigo_v2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  RecordCount: Integer;
  AleituraEAN13: string;
  SaveItem: Boolean;
begin
  inherited;
  if Key = VK_RETURN then
    v2_codigo_pesquisar(ed_codigo_v2.Text)
  else if Key = VK_F3 then
    v2_codigo_pesquisar(ed_codigo_v2.Text, True);
  {
  begin
    SaveItem := False;

    if Trim(ed_codigo_v2.Text) = '' then
      Exit;

    try
      if (NFCe.fint('cod_nfce') <> current.AplicaDes.IdNFCe) and (current.AplicaDes.Modalidade = adNFCeAtual)  then
        current_desconto_modalidade_reset;

      current_reset;
      current.Codigo := ed_codigo_v2.Text;

//      current.Alteracao := False;
//      current.Qtde      := 0;
//      current.ValorUn   := 0;
//      current.ValorTot  := 0;
//      current.ValorDes  := 0;
//      current.Codigo    := ed_codigo_v2.Text;
//      current.Descricao := '';

      if Pos('*', ed_codigo_v2.Text) > 1 then
      begin
        current.Qtde   := StrToFloatDef(Trim(Copy(ed_codigo_v2.Text, 1, Pos('*', ed_codigo_v2.Text) - 1)), 0);
        current.Codigo := Copy(current.Codigo, Pos('*', current.Codigo) + 1, Length(current.Codigo));
      end;

      //ed_qtde_v2.Caption := StrNumber(current.Qtde, csdQtde);

      if lb_prod_serv_v2.Caption = 'Código Produto' then
      begin
        vDadosIni.vProduto.LeituraPesoBalanca.resetVals;
        AleituraEAN13 := NFCe.Itens.leituraEAN13_balanca(ed_codigo_v2.Text, RecordCount);

        if Copy(UpperCase(AleituraEAN13), 1, 4) = 'ERRO' then
        begin
          v2_titulo_error(vDadosIni.vProduto.LeituraPesoBalanca.vals.msg);
          Exit;
        end
        else if AleituraEAN13 = 'VALIDO' then
        begin
          current.Qtde     := vDadosIni.vProduto.LeituraPesoBalanca.vals.peso;
          current_calc_use_vl_tot(vDadosIni.vProduto.LeituraPesoBalanca.vals.preco);
//          current.ValorTot := vDadosIni.vProduto.LeituraPesoBalanca.vals.preco;

//          current.ValorUn  := vDadosIni.vProduto.LeituraPesoBalanca.vals.preco / vDadosIni.vProduto.LeituraPesoBalanca.vals.peso;
//          current.Qtde     := RoundTo(current.Qtde   , 0 - csdQtde);
//          current.ValorUn  := RoundTo(current.ValorUn, 0 - csdVrUn);
        end
        else if not NFCe.Itens.buscaProduto(False, current.Codigo, RecordCount) then
        begin
          v2_titulo_error('PRODUTO NÃO ENCONTRADO');
          Exit;
        end;

        if RecordCount > 1 then
        begin
          v2_cons_prod_show;
          Exit;
        end;

        if current_from_select_prod then
          SaveItem := True
        else
          v2_titulo_error(current.Error);

        if SaveItem and (NFCe.Itens.Prod.fequals('alt_cod_cupom', 'S') or NFCe.Itens.Prod.fequals('alt_desc_cupom', 'S')) then
        begin
          SaveItem := False;
          v2_preparar_item_para_alterar_conf_prod(NFCe.Itens.Prod.fequals('alt_cod_cupom', 'S'), NFCe.Itens.Prod.fequals('alt_desc_cupom', 'S'));
          Exit;
        end;
      end
      else if lb_prod_serv_v2.Caption = 'Código Serviço' then
      begin
        if not NFCe.Itens.buscaServico(False, ed_codigo_v2.Text, RecordCount) then
          Exit;
      
//        if RecordCount > 1 then
//          if not vDadosIni.abreForm('Escolha o serviço', pnSelecionaServico, [ofAutoSize, ofAlignAllClientWinCtrl, ofEscapeExit]) then
//          begin
//            if (Self.Enabled) and (Self.Visible) and (ed_codigo_v2.CanFocus) then
//              ed_codigo_v2.SetFocus;
//            Exit;
//          end;

        //ed_codigo_v2.Text   := NFCe.Itens.Serv.fstr('COD_SERVICO');
        v2_titulo_informacao(NFCe.Itens.Serv.fstr('DESC_SERVICO'));
        current.Qtde        := IfThen(current.Qtde = 0, 1, current.Qtde);
        current.ValorUn     := NFCe.Itens.Serv.ffloat('VALOR_SERVICO');
        current.ValorTot    := current.Qtde * current.ValorUn;
        SaveItem := True;
      end;
    finally
      if SaveItem then
      begin
//        current.Qtde     := RoundTo(current.Qtde   , 0 - csdQtde);
//        current.ValorUn  := RoundTo(current.ValorUn, 0 - csdVrUn);
//        current.ValorTot := RoundTo(current.Qtde * current.ValorUn, -2);

        current_to_form_cupom;

//        ed_qtde_v2.Caption  := StrNumber(current.Qtde   , csdQtde);
//        ed_vlun_v2.Caption  := StrNumber(current.ValorUn, csdVrUn);
//        ed_vltot_v2.Caption := StrNumber(current.ValorTot);
//        pn_descr_v2.Caption := current.Descricao;

        if SaveItem then
          if lb_prod_serv_v2.Caption = 'Código Produto' then
            current_setproduto
          else if lb_prod_serv_v2.Caption = 'Código Serviço' then
            NFCe.Itens.SetServico(current.Alteracao, current.Codigo, current.Descricao, current.Qtde, current.ValorUn, current.ValorTot, current.ValorDes);

        print_cupom_itens_change(NFCe);
        if NFCe.Itens.dataSet.RecordCount = 1 then
          print_cupom_cabecalho_change(NFCe);
        print_cupom_rodape_change(NFCe);
        ed_codigo_v2.SelectAll;
      end;
    end;
  end;
  }
end;

procedure TfrmCadNFCe.ed_rejeicoesChange(Sender: TObject);
begin
  inherited;
  if ed_rejeicoes.Lines.Count <= 0 then
     ts_rejeicoes_mensagens.Caption    := 'Rejeições / Mensagens SEFAZ    '
  else
     ts_rejeicoes_mensagens.Caption    := IntToStr(ed_rejeicoes.Lines.Count) +  ' Rejeições / Mensagens SEFAZ';
end;

procedure TfrmCadNFCe.ed_v2_alt_item_descricaoExit(Sender: TObject);
begin
  inherited;
  current.Descricao := Trim(ed_v2_alt_item_descricao.Text);
end;

procedure TfrmCadNFCe.ed_v2_alt_item_descricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
    Perform(WM_NEXTDLGCTL, 0, 1)
  else if Key = VK_DOWN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadNFCe.ed_v2_alt_item_desc_percExit(Sender: TObject);
begin
  inherited;
  current_calc_use_desc_perc(ed_v2_alt_item_desc_perc.AsValue);
  current_to_form_alt_item;
end;

procedure TfrmCadNFCe.ed_v2_alt_item_desc_valExit(Sender: TObject);
begin
  inherited;
  current_calc_use_desc_val(ed_v2_alt_item_desc_val.AsValue);
  current_to_form_alt_item;
end;

procedure TfrmCadNFCe.ed_v2_alt_item_qtdeExit(Sender: TObject);
begin
  inherited;

  ed_v2_alt_item_qtde.AsValue := NFCe.helperConv.HandleUnidadeFracao(ed_v2_alt_item_und.Text, ed_v2_alt_item_qtde.AsValue);

  current_calc_use_qtde(ed_v2_alt_item_qtde.AsValue);
  current_to_form_alt_item;
end;

procedure TfrmCadNFCe.ed_v2_alt_item_tot_liqExit(Sender: TObject);
begin
  inherited;
  current_calc_use_tot_liq(ed_v2_alt_item_tot_liq.AsValue);
  current_to_form_alt_item;
end;

procedure TfrmCadNFCe.ed_v2_alt_item_undChange(Sender: TObject);
begin
  inherited;
  if ed_v2_alt_item_und.Items.Count = 0 then
    Exit;

  if (ed_v2_alt_item_und.ItemIndex = -1) or (ed_v2_alt_item_und.Tag = -1) then
    Exit;

  current_calc_use_unid(ed_v2_alt_item_und.Tag, ed_v2_alt_item_und.ItemIndex);
  current_to_form_alt_item;

  ed_v2_alt_item_und.Tag := ed_v2_alt_item_und.ItemIndex;

end;

procedure TfrmCadNFCe.ed_v2_alt_item_undEnter(Sender: TObject);
begin
  inherited;
  ed_v2_alt_item_und.Tag := ed_v2_alt_item_und.ItemIndex;
end;

procedure TfrmCadNFCe.ed_v2_alt_item_vl_totExit(Sender: TObject);
begin
  inherited;
  current_calc_use_vl_tot(ed_v2_alt_item_vl_tot.AsValue);
  current_to_form_alt_item;
end;

procedure TfrmCadNFCe.ed_v2_alt_item_vl_unExit(Sender: TObject);
begin
  inherited;
  current_calc_use_vl_un(ed_v2_alt_item_vl_un.AsValue);
  current_to_form_alt_item;
end;

procedure TfrmCadNFCe.ed_v2_cliente_avulso_cepEnter(Sender: TObject);
begin
  inherited;
  StrFieldOld := Trim(ed_v2_cliente_avulso_cep.Text);
end;

procedure TfrmCadNFCe.ed_v2_cliente_avulso_cepExit(Sender: TObject);
var
  ConsultaCEP: TDataSet_OOP;
begin
  inherited;

  if StrEquals(StrFieldOld, ed_v2_cliente_avulso_cep.Text) then
    Exit;

  if StrLength(ed_v2_cliente_avulso_cep.Text) <> 8 then
    Exit;

  ConsultaCEP := NFCe.Dest.ConsultaCEP(ed_v2_cliente_avulso_cep.Text);
  try
    with ConsultaCEP do if fequals('cep', ed_v2_cliente_avulso_cep.Text) then
    begin
      ed_v2_cliente_avulso_logr.Text        := fstr('xlgr');
      ed_v2_cliente_avulso_bairro.Text      := fstr('xbairro');
      ed_v2_cliente_avulso_cidade.KeyValue  := fint('cmun');
      ed_v2_cliente_avulso_uf.Text          := fstr('uf');
      ed_v2_cliente_avulso_cep.Text         := fstr('cep');
    end;
  finally
    FreeAndNil(ConsultaCEP);
  end;

end;

procedure TfrmCadNFCe.ed_v2_cliente_avulso_cidadeExit(Sender: TObject);
begin
  inherited;
  ed_v2_cliente_avulso_uf.Text := FlkCidadeIBGE.dataSet.FieldByName('uf').AsString;
//  if (NFCe.Dest.dataSet.State in [dsEdint, dsInsert]) and (VarToInt(ed_v2_cliente_avulso_cidade.KeyValue) > 0) then
//    NFCe.Dest.dataSet.FieldByName('xmun').AsString := FlkCidadeIBGE.dataSet.FieldByName('xmun').AsString;
end;

procedure TfrmCadNFCe.ed_v2_codvendedorChange(Sender: TObject);
var
  codigo: Integer;
begin
  inherited;
  codigo := 0;

  TryStrToInt(trim(ed_v2_codvendedor.Text), codigo);

  if not NFCe.lkVendedor.dataSet.Locate('COD_VENDEDOR', VarArrayOf([codigo]), [])then
    pn_v2_nomevendedor.Caption := 'Colaborador não encontrado ou não é vendedor'
  else
    pn_v2_nomevendedor.Caption := NFCe.lkVendedor.dataSet.FieldByName('nome_vendedor').AsString;
  pn_v2_nomevendedor.Color := IfThen(pn_v2_nomevendedor.Color = clNavy, clMaroon, clNavy)
end;

procedure TfrmCadNFCe.ed_v2_codvendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  codigo: Integer;
begin
  inherited;

  if key = VK_ESCAPE then
    v2_cupom_show
  else if key = VK_RETURN then
  begin
    with NFCe.ValidacaoQualquerAlteracao do
      if not Permitido then
      begin
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')]);
        Exit;
      end;

    if not vDadosIni.PesqPros('NFC029', 'ALTERAR', NFCe.Audit_Dados + ' ANTES.COD.VEND: ' + NFCe.dataSet.FieldByName('COD_VENDEDOR').AsString ,
      'NFCE', NFCe.Audit_Codigo, NFCe.buscas) then
      exit;

    if not (NFCe.dataSet.State in [dsInsert, dsEdit]) then
      if (NFCe.dataSet.State = dsBrowse) then
        NFCe.dataSet.Edit;

    codigo := 0;
    TryStrToInt(trim(ed_v2_codvendedor.Text), codigo);

    if not NFCe.lkVendedor.dataSet.Locate('COD_VENDEDOR', VarArrayOf([codigo]), [])then
    begin
      pn_v2_nomevendedor.Caption := 'Colaborador não encontrado ou não é vendedor';
      pn_v2_nomevendedor.Color := IfThen(pn_v2_nomevendedor.Color = clNavy, clMaroon, clNavy)
    end
    else
    begin
      NFCe.fdata('cod_vendedor').Put(codigo);
      v2_titulo_alerta('Selecionado: ' + Trim(NFCe.lkVendedor.dataSet.FieldByName('nome_vendedor').AsString));

      if NFCe.HouveAlteracao() then
        NFCe.SalvarECalcular(True);

      v2_cupom_show;
    end;
  end;
end;

procedure TfrmCadNFCe.ed_v2_cons_cliente_opcaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //Consulta (1 - Nome; 2 - Razão Social; 3 - CPF/CNPJ; 4 - Avulso)
  if key = '1' then
    ed_v2_cons_cliente_opcao.Text := '1 - Nome'
  else if key = '2' then
    ed_v2_cons_cliente_opcao.Text := '2 - Razão Social'
  else if key = '3' then
    ed_v2_cons_cliente_opcao.Text := '3 - CPF/CNPJ'
  else if key = '4' then
  begin
    with NFCe.ValidacaoQualquerAlteracao do
      if Permitido then
      begin
        if not Assigned(FlkCidadeIBGE) then
          FlkCidadeIBGE := TDadosLookUp_OOP.create;

        FlkCidadeIBGE.setDadosDataSet('CMUN', 'XMUN;UF',
          NFCe.SqlOpen('select cid.codigo_mun_ibge cmun, cid.nome_municipio xmun, cid.nome_uf, es.sigla_uf uf from cidades_ibge cid' +
                       ' left join estados es on es.ibge_codigo_uf = cid.codigo_uf_ibge order by cid.nome_municipio'), ed_v2_cliente_avulso_cidade);

        v2_cliente_avulso_show;
      end
      else
      begin
        lb_v2_cons_cliente_nao_encontrado.Caption := msgNaoPermiteAlteracao;// 'NFC não permite alteração';
        lb_v2_cons_cliente_nao_encontrado.Visible := True;
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')])
      end;
  end;
  if ContainsText('123', Key) then
    _GravaConfiguracoesString(ed_v2_cons_cliente_opcao.Name, ed_v2_cons_cliente_opcao.Text);
  
  Key := #0;
  ed_v2_cons_cliente_opcao.SelectAll;
end;

procedure TfrmCadNFCe.ed_v2_contingenciaKeyPress(Sender: TObject;
  var Key: Char);
var
  K: Word;
begin
  inherited;
  if Key = '1' then
  begin
    if NFCe.Emitir(True) then
    begin
      nfce_v2_novo(nfce);
      re_print.WordWrap   := True;
      re_print.Lines.Text := NFCe.LastMessage;
    end
    else
      v2_action_cancela_and_show_cupom(Sender);
  end
  else if Key = '2' then
  begin
    K := VK_ESCAPE;
    v2_action_wc_escape_KeyDown(ed_v2_contingencia, K, []);
  end;
  Key := #0;
end;

procedure TfrmCadNFCe.ed_v2_desconto_item_modalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '1' then
    ed_v2_desconto_item_modal.Text := '1 - Próximo item'
  else if key = '2' then
    ed_v2_desconto_item_modal.Text := '2 - NFC-e atual'
  else if key = '3' then
    ed_v2_desconto_item_modal.Text := '3 - Todas NFC-e''s';
  Key := #0;
  ed_v2_desconto_item_modal.SelectAll;
end;

procedure TfrmCadNFCe.ed_v2_desconto_item_percExit(Sender: TObject);
begin
  inherited;
  if (ed_v2_desconto_item_perc.AsValue > 0) and (ed_v2_desconto_item_perc.AsValue < 99.98) then
    ed_v2_desconto_item_val.AsValue := 0
  else
    ed_v2_desconto_item_perc.AsValue := 0;
end;

procedure TfrmCadNFCe.ed_v2_desconto_item_valExit(Sender: TObject);
begin
  inherited;
  if ed_v2_desconto_item_val.AsValue > 0 then
  begin
    ed_v2_desconto_item_perc.AsValue  := 0;
    ed_v2_desconto_item_modal.Text    := '1 - Próximo item';
    ed_v2_desconto_item_modal.Enabled := False;
  end
  else
    ed_v2_desconto_item_modal.Enabled   := True;
end;

procedure TfrmCadNFCe.ed_v2_log_rejeicoesChange(Sender: TObject);
begin
  inherited;
  if ed_v2_log_rejeicoes.Lines.Count <= 0 then
     bt_v2_menu_log_rejeicoes.Caption    := 'LOG DE REJEICOES'
  else
     bt_v2_menu_log_rejeicoes.Caption    := 'LOG DE REJEICOES (' +IntToStr(ed_v2_log_rejeicoes.Lines.Count) +  ')';
end;

procedure TfrmCadNFCe.ed_v2_pag_valores_bandKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '0' then
    ed_v2_pag_valores_band.Text := '  '
  else if key = '1' then
    ed_v2_pag_valores_band.Text := ' 1 - Visa'
  else if key = '2' then
    ed_v2_pag_valores_band.Text := ' 2 - Mastercard'
  else if key = '3' then
    ed_v2_pag_valores_band.Text := ' 3 - American Express'
  else if key = '4' then
    ed_v2_pag_valores_band.Text := ' 4 - Sorocred'
  else if key = '5' then
    ed_v2_pag_valores_band.Text := ' 5 - Diners Club'
  else if key = '6' then
    ed_v2_pag_valores_band.Text := ' 6 - Elo'
  else if key = '7' then
    ed_v2_pag_valores_band.Text := ' 7 - Hipercard'
  else if key = '8' then
    ed_v2_pag_valores_band.Text := ' 8 - Aura'
  else if key = '9' then
    ed_v2_pag_valores_band.Text := ' 9 - Outros';
  Key := #0;
//  ed_v2_pag_valores_band.SelectAll;
end;

procedure TfrmCadNFCe.ed_v2_pag_valores_indpagKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    v2_pagamento_show;
end;

procedure TfrmCadNFCe.ed_v2_pag_valores_indpagKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '0' then
    ed_v2_pag_valores_indpag.Text := '  '
  else if key = '1' then
    ed_v2_pag_valores_indpag.Text := ' 1 - A vista'
  else if key = '2' then
    ed_v2_pag_valores_indpag.Text := ' 2 - A prazo';
  Key := #0;
//  ed_v2_pag_valores_indpag.SelectAll;
end;

procedure TfrmCadNFCe.ed_v2_pag_valores_valorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Indpag, Mensagem: string;
  Band   : Variant;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    ed_v2_pag_valores_valor.AsValue := ed_v2_pag_valores_valor.AsValue;
    currpag_from_form_pagamento;

    if currpag.Bandeira > 0 then
      Band := currpag.Bandeira
    else
      Band := Null;

    Indpag := IfThen(currpag.IndPag = '1', '0') + IfThen(currpag.IndPag = '2', '1');
    Mensagem := Format('%s - R$ %n', [NFCe.Pagamento.TipoPagamento.fstr('DISPLAYV2'), currpag.Valor]);

    if not NFCe.Pagamento.SetPagamento(currpag.Alteracao, NFCe.Pagamento.TipoPagamento.fint('codigo_ctrl'),
                                       Band, NFCe.Pagamento.TipoPagamento.fint('nfce_tpag'),
                                       currpag.Valor, currpag.NumAutorizacao, IndPag) then
      v2_titulo_error(NFCe.Pagamento.vMensagemErro)
    else
    begin
      if NFCe.Pagamento.ValorTotal >= NFCe.ffloat('vnf') then
      begin
        if NFCe.ConfigNFCe.Regras.EmitirAposCompletarPagamentos then
          v2_emitir
        else
        begin
          v2_titulo_alerta('[F11 - Finalizar] - Pagamento Concluído');
          v2_pagamento_show;
        end;
      end
      else
      begin
        v2_titulo_alerta(Mensagem);
        v2_pagamento_show;
      end;
    end;
  end
  else if Key = VK_ESCAPE then
  begin
    v2_pagamento_show;
    v2_titulo_alerta('Pagamentos');
  end;
end;

procedure TfrmCadNFCe.ed_v2_selecionar_orcamento_numeroKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Mensagem: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if NFCe.Orcamento_getOrcamento(StrToInt64Def(ed_v2_selecionar_orcamento_numero.Text, -1), Mensagem) then
      v2_cupom_show
    else
      ed_v2_selecionar_orcamento_numero.SelectAll;
    v2_titulo_informacao(Mensagem);
    //lb_v2_selecionar_orcamento_nao_encontrado.Caption := Mensagem;
  end
  else if Key = VK_ESCAPE then
    v2_cupom_show;
end;

procedure TfrmCadNFCe.ed_v2_selecionar_orcamento_numeroKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (not ContainsText('0123456789', Key)) and (Key <> #8) then
    Key := #0;
end;

procedure TfrmCadNFCe.ed_v2_valores_tipodescKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '1' then
    ed_v2_valores_tipodesc.Text := '1 - Por item'
  else if key = '2' then
    ed_v2_valores_tipodesc.Text := '2 - No Total';

  if Key in ['1', '2'] then
    ed_v2_valores_vdesc.Enabled  := Key = '2';

  Key := #0;
  ed_v2_valores_tipodesc.SelectAll;
end;

procedure TfrmCadNFCe.ed_v2_valores_vdescExit(Sender: TObject);
begin
  inherited;
  currtot.vdesc := ed_v2_valores_vdesc.AsValue;
  currtot.vnf   := currtot.vprod + currtot.vseg + currtot.voutro + currtot.vfrete - currtot.vdesc;
  currtot_to_form_valores;
end;

procedure TfrmCadNFCe.ed_v2_valores_voutroExit(Sender: TObject);
begin
  inherited;
  currtot.voutro := ed_v2_valores_voutro.AsValue;
  currtot.vnf    := currtot.vprod + currtot.vseg + currtot.voutro + currtot.vfrete - currtot.vdesc;
  currtot_to_form_valores;
end;

procedure TfrmCadNFCe.ed_v2_valores_vsegExit(Sender: TObject);
begin
  inherited;
  currtot.vseg := ed_v2_valores_vseg.AsValue;
  currtot.vnf   := currtot.vprod + currtot.vseg + currtot.voutro + currtot.vfrete - currtot.vdesc;
  currtot_to_form_valores;
end;

procedure TfrmCadNFCe.ed_vnd_locChange(Sender: TObject);
var
  Numero: Integer;
begin
  inherited;
  if ed_vnd_loc.Text = '' then
  begin
    grid_vnd_sem_emit.Repaint;
    Exit;
  end;

  if not TryStrToInt(ed_vnd_loc.Text, Numero) then
  begin
    ShowErro('Número digitado inválido');
    Exit;
  end;

  VendasSemEmit.dataSet.Locate('NUMERO', Numero, [loPartialKey]);
  grid_vnd_sem_emit.Repaint;

end;

procedure TfrmCadNFCe.EventoAfterScrollProdutos;
begin
  if NFCe.EmissaoRapida then
  begin
    ed_v2_cons_prod_estoqeu.Caption := StrNumber(NFCe.Itens.Prod.EstoqueDisponivel, 3);

    pn_v2_cons_prod_grade.Visible := NFCe.Itens.Prod.fint('cod_grade') > 0;
    if pnGrade.Visible then
    begin
      pn_v2_cons_prod_grade_1.Caption := NFCe.Itens.Prod.fstr('descricao');
      pn_v2_cons_prod_grade_2.Caption := NFCe.Itens.Prod.fstr('descricao1');
    end;
  end
  else
  begin
    edEstoqueDisp.AsValue := NFCe.Itens.Prod.EstoqueDisponivel;

    pnGrade.Visible := NFCe.Itens.Prod.dataSet.FieldByName('cod_grade').AsInteger > 0;
    pnGrade1.Visible := pnGrade.Visible;
    if pnGrade.Visible then
    begin
      edGrade.Caption := NFCe.Itens.Prod.dataSet.FieldByName('descricao').AsString;
      edGrade1.Caption := NFCe.Itens.Prod.dataSet.FieldByName('descricao1').AsString;
    end;
  end;
end;

procedure TfrmCadNFCe.EventoAtualizarTotalPagamento;
begin
  if NFCe.EmissaoRapida then
  begin
    lb_v2_pag_vnf.Caption        := StrNumber(NFCe.ffloat('vnf'));
    lb_v2_pag_pgto.Caption       := StrNumber(NFCe.Pagamento.ValorTotal);
    lb_v2_pag_falta.Caption      := StrNumber(Abs(NFCe.Pagamento.ValorTotal - NFCe.ffloat('vnf')));
    lb_v2_pag_trocofalta.Caption := IfThen(NFCe.Pagamento.ValorTotal > NFCe.ffloat('vnf'), 'Troco  ', 'Falta  ');
    pn_v2_pag_concluido.Visible  := (RoundTo(NFCe.Pagamento.ValorTotal, -2) >= NFCe.ffloat('vnf', -2)) and (NFCe.fdif('situacao_nfce', sitAutorizada));
    pn_v2_pag_concluido.Top      := -1;
  end
  else
  begin
    edPagamentValorTotal.AsValue := NFCe.Pagamento.ValorTotal;
    edValorQueFaltaPagamento.AsValue := Abs(NFCe.dataSet.FieldByName('vnf').AsFloat - edPagamentValorTotal.AsValue);
    Panel38.Caption := IfThen((NFCe.dataSet.FieldByName('vnf').AsFloat - edPagamentValorTotal.AsValue) < 0, 'Troco', 'Falta');
  end;
end;

procedure TfrmCadNFCe.EventoChangeStatusNFC;
var
  APermiteAlteracaoItens    : Boolean;
  APermiteAlteracaoPagamento: Boolean;
begin

  APermiteAlteracaoItens                 := NFCe.PermiteAlteracaoItens;
  pn01CodDescricao.Enabled               := APermiteAlteracaoItens;
  pn02ValoresItens.Enabled               := APermiteAlteracaoItens;
  pn04BotoeETotalLiq.Enabled             := APermiteAlteracaoItens;
  btExcluirItem.Enabled                  := APermiteAlteracaoItens;
  btAlterarItem.Enabled                  := APermiteAlteracaoItens;
  btSalvarItem.Enabled                   := APermiteAlteracaoItens;

  btDescontoCabecalhoDesabilitar.Enabled := APermiteAlteracaoItens;
  btDescontoCabecalhoHabilitar.Enabled   := APermiteAlteracaoItens;
  if APermiteAlteracaoItens then
  begin
    edDescontoTotal.Enabled := not (NFCe.dataSet.FieldByName('DESC_POR_ITEM').AsString = 'S');
    btDescontoCabecalhoHabilitar.Visible := not edDescontoTotal.Enabled;
    btDescontoCabecalhoDesabilitar.Visible := edDescontoTotal.Enabled;
    btDescontoCabecalhoHabilitar.Left := btDescontoCabecalhoDesabilitar.Left;
  end
  else
    edDescontoTotal.Enabled := False;

  APermiteAlteracaoPagamento     := NFCe.PermiteAlteracaoPagamento;
  pnDadosPagamento.Enabled       := APermiteAlteracaoPagamento;
  pnBotoesDadosPagamento.Enabled := APermiteAlteracaoPagamento;
  btExcluirPagamento.Enabled     := APermiteAlteracaoPagamento;
  btAlterarPagamento.Enabled     := APermiteAlteracaoPagamento;
  btSalvarPagamento.Enabled      := APermiteAlteracaoPagamento;

  btAtalhoEmitir.Enabled         := True;//NFCe.PermiteEmissao;
end;

procedure TfrmCadNFCe.EventoNFCeFieldChange(Sender: TField);
begin
  if Sender.FieldName = 'CMUNFGIBS' then
    ComboBoxMunicipiosFrame2.SetCodigoIBGE( Sender.AsInteger )
  else if Sender.FieldName = 'DFE_TRIB_IGNORAR' then
  begin
    if (YesNoEnum(NFCe.fint('dfe_trib_ignorar')) = ynNo) and NFCe.fempty('op_interna_id') then
      ShowAtencao('Operação interna padrão não configurada. Por favor acesse o cadastro de Operações Internas e configure');
  end;
end;

procedure TfrmCadNFCe.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  inherited;

  gravaConfiguracoesFormRegistro;

  if Self.ModoNFCe then
  begin
    _GravaConfiguracoesInteger('ModoNFCe_H', Self.Height - IfThen(Self.WindowState = wsMaximized, 10) );
    _GravaConfiguracoesInteger('ModoNFCe_W', Self.Width - IfThen(Self.WindowState = wsMaximized, 10) );
    _GravaConfiguracoesBoolean('ModoNFCe_M', Self.WindowState = wsMaximized );
  end;


  if Assigned(lkIntermed)    then FreeAndNil(lkIntermed);
  if Assigned(Flkindpag)     then FreeAndNil(Flkindpag);
  if Assigned(FlkCidadeIBGE) then FreeAndNil(FlkCidadeIBGE);
  if Assigned(NFCe)          then FreeAndNil(NFCe);
  if Assigned(SangSup)       then FreeAndNil(SangSup);
  if Assigned(MovOperador)   then FreeAndNil(MovOperador);

  Action := caFree;
  frmCadNFCe := nil;
end;

procedure TfrmCadNFCe.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Resposta: Integer;
begin
	if (PageControl1.ActivePage = TabSheet1) and (PageControl3.ActivePage = tsCadastro) and (TelaCadastro = 0) then
    if NFCe.dataSet.FieldByName('cod_nfce').AsInteger = 0 then
    begin
      Resposta := Application.MessageBox('Existem dados não salvos. Deseja salvar os dados e sair?', 'Atenção',
        MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON3);

      if Resposta = IDYES then
      begin
        CanClose := True;
        if NFCe.SetCodigoInterno then
          Application.MessageBox('Dados salvos com sucesso', 'Atenção', 0 + 64)
        else
          CanClose := False;
      end
      else if Resposta = ID_NO then
      begin
        NFCe.Cancel;
        NFCe.CancelUpdates;
        NFCe.Itens.Cancel;
        NFCe.Itens.CancelUpdates;
        NFCe.RollBackTransacao;
        CanClose := True
      end
      else
        CanClose := False;
    end;
  if not CanClose then
    Exit;

  NFCe.EmissaoRapida := NFCe.ConfigNFCe.Regras.ModoSimplificadoAtivo;

  inherited;
end;

procedure TfrmCadNFCe.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  ModoNFCe := False;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  if NFCe = nil then
    NFCe := TNFCe.create;

  if not Assigned(SangSup) then
    SangSup := TNFCe_SangSup.Create;

  if not Assigned(MovOperador) then
    MovOperador := TNFCe_MovimentoOperador.Create;

  if Pos('NFC_FICHAPRODUTO|', vDadosIni.vPesquisa) > 0 then
  begin
     if frmCadNFCe = nil then
	     frmCadNFCe := TfrmCadNFCe(Self);
     vCodNF := StrToIntDef(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2), 0);
     vDadosIni.vTipoForm := 10;
     vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  ts_nfce_v2.TabVisible := False;
  ts_nfce_v2_container.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
  ReturnPressed := False;
//  DadosForm.EmEmissaoExterna := False;
  with LastCons do
  begin
    Campo    := NFCe.dataSet.FieldByName('data_lanc').DisplayLabel;
    Condicao := 'Igual';
    Conteudo := '';
    DataIni  := FormatDateTime('dd/mm/yyyy', Date);
    DataFim  := DataIni;
    SqlAd    := IfThen(not NFCe.ConfigNFCe.ConsultaOutrosEmissores, Format(' and nfce.cod_emissor = %d ', [vDadosIni.vNFConsumidor.CodEmissor]))
  end;

  ComboBoxMunicipiosFrame2.OnMunicipioChange := ComboBoxMunicipiosFrameChange;
  ComboBoxOpInternasFrame1.OnOpInternaChange := ComboBoxOpInternasFrameChange;

  ComboBoxOpInternasFrame1.Left := edNaturezaOperacao.Left;
  ComboBoxOpInternasFrame1.Top := edNaturezaOperacao.Top;
  ComboBoxOpInternasFrame1.Width := edNaturezaOperacao.Width;
  ComboBoxOpInternasFrame1.Height := edNaturezaOperacao.Height;
  ComboBoxOpInternasFrame1.Visible := False;

//CREATE
end;

procedure TfrmCadNFCe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  point: TPoint;
begin
  inherited;
  if (PageControl1.ActivePage = TabSheet1) and (PageControl3.ActivePage = tsCadastro) then
  begin
    if (Key = VK_F2) and (pageDadosNFCe.ActivePage = tsItens) then
    begin
      if not NFCe.ConfigNFCe.ISS.PermitirServicos then
        Application.MessageBox('Configuração da NFC-e não permite incluir serviços', 'Atenção', MB_ICONEXCLAMATION + MB_OK)
      else
        pnCaptionProdServ.Caption := vDadosIni.IfThen(pnCaptionProdServ.Caption = 'Código Produto', 'Código Serviço', 'Código Produto' );
    end
    else if (Key = VK_F5) and (pageDadosNFCe.ActivePage <> tsItens) then
      btAtalhoItens.Click
    else if (Key = VK_F6) and (pageDadosNFCe.ActivePage <> tsCabecalho) then
      btAtalhoCabecalho.Click
    else if (Key = VK_F7) and (pageDadosNFCe.ActivePage <> tsTotais) then
      btAtalhoValores.Click
    else if (Key = VK_F8) and (pageDadosNFCe.ActivePage <> tsFechamento) then
      btAtalhoFechamento.Click
    else if (Key = VK_F9) then
    begin
      if btAtalhoEmitir.Enabled then
        btAtalhoEmitir.Click;
    end
    else if (Key = VK_F10) then
      ModoSimplificado1.Click
    else if (Key = VK_F11) then
    begin
      point := pnMenu.ClientToScreen(point);
      point.X := point.X + pnMenu.Width - 3;
      point.Y := point.Y + pnMenu.Height - 3;
      PopupMenu3.Popup(point.X, point.Y);
    end
    else if (Key = VK_F12) and (pageDadosNFCe.ActivePage = tsItens) and (pnSeqPreco.Visible) then
      NFCe.SetSeqPreco();
  end
  else if PageControl1.ActivePage = ts_nfce_v2 then
  begin
    //atalhos
    if Key = VK_F2 then
      v2_menus_show
//    else if Key = VK_F3 then
//      ShowAtencao(ActiveControl.Name)
    else if Key = VK_F8 then
      bt_v2_menu_vendedor.Click
    else if Key = VK_F9 then
      bt_v2_menu_consulta_nfce.Click
    else if Key = VK_F10 then
      bt_v2_menu_modo_completo.Click
    else if (Key = VK_F11) and (pn_print_container <> pn_v2_pag.Parent) then
      bt_v2_menu_pagamento.Click
    else if (Key = VK_F12) and (pn_print_container <> pn_v2_pag.Parent) then
      bt_v2_menu_consulta_cliente.Click
    else if Key = VK_ESCAPE then
    begin
      if pn_print_container = pn_v2_menus.Parent then
        v2_cupom_show;
    end;

  end;
  if Key = VK_INSERT then
    if PageControl1.ActivePage = TabSheet2 then
    begin
      if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
        BitBtn3.SetFocus;
      BitBtn3.Click;
    end;
end;

procedure TfrmCadNFCe.FormResize(Sender: TObject);
begin
  inherited;
//  Caption := IntToStr(Self.Height);
  if WindowState =  wsMaximized then
    pageDadosNFCe.Align := alClient
  else
  begin
    pageDadosNFCe.Align := alTop;
    pageDadosNFCe.Height := tsCadastro.Height - pnTopCadastro.Height - IfThen(pn_inf_nfce_local.Visible, pn_inf_nfce_local.Height);
  end;
  if pn_v2_cupom.Parent = pn_print_container then
    print_cupom_resize(pn_v2_cupom);
end;

procedure TfrmCadNFCe.FormShow(Sender: TObject);
var
  I: Integer;
begin
	if not Self.Enabled then
    Exit;

  if vShow <> 1 then
  begin
    //grid exclusao itens v2
    if vDadosIni.GetIni('MD', 'NCEIL', 'N') = 'S' then //NF COnsumidor Excluir Itens em Lote
    	if vCriou = 0 then
      	THwHack_DbGrid.Create(grid_v2_selecao_item);
//    grid_v2_selecao_item.DataSource := dtmNFConsumidor.dsNFCe_It;

    //grid principal
    if vCriou = 0 then
    	THwHack_DbGrid.Create(DBGrid1);
      
    DBGrid1.DataSource := dtmNFConsumidor.dsNFCe;
    inherited;
    if vCriou = 0 then
    	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

    imgInformation.Hint := imgInformation.Hint + #13 + #13 +
      'NFC007 - ABRIR CADASTRO DE NFCE' + #13 +
      'NFC017 - INCLUIR PRODUTO NFCE' + #13 +
      'NFC021 - ALTERAR SERVICO NFCE' + #13 +
      'NFC023 - ALTERAR SEQUENCIA DE PRECO NFCE' + #13 +
      'NFC025 - INCLUIR PAGAMENTO NFCE' + #13 +
      'NFC028 - EMITIR NFCE AVULSA' + #13 +
      'NFC029 - ALTERAR VENDEDOR DA NFCE' + sLineBreak +
      'NFC031 - HAB VISUALIZR NFCE TODOS EMISSORES' + sLineBreak +
      'NFC032 - BT ABRIR DIA DE MOVIMENTO NFCE' + sLineBreak +
      'NFC033 - BT FECHAR DIA DE MOVIMENTO NFCE' + sLineBreak +
      'NFC034 - ALTERAR NFCE MOV.OP. FECHADO' + sLineBreak +
      'NFC035 - HABILITAR PESQUISA DIVERSA MOV.OP' + sLineBreak +
      'NFC036 - HABILITAR ALTERAR LIB SSL';
    pageDadosNFCe.Tag := 500;
    tsOutros.TabVisible := False;
    PageControl1.ActivePage := TabSheet2;

    statusBar('', '');
  end;

  //Height := 630;
  Height := 662;
  Caption := 'Nota Fiscal Consumidor - Emissor(Caixa) ' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3) +
             IfThen(vDadosIni.vNFConsumidor.NFCeOffline = noClient, '   >>>>>>>>>> NFCe LOCAL <<<<<<<<<<');
  lb_nfcelocal.Visible := vDadosIni.vNFConsumidor.NFCeOffline = noClient;
  CriarNFCecomplementar1.Visible := vDadosIni.vNFConsumidor.NFCeOffline <> noClient;
             {
  pn_inf_nfce_local.Visible := vDadosIni.vNFConsumidor.NFCeOffline = noClient;
  pn_inf_nfce_local_v2.Visible := vDadosIni.vNFConsumidor.NFCeOffline = noClient;
  }

  pn_inf_nfce_local.Caption := '';
  pn_inf_nfce_local_v2.Caption := '';
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    pn_inf_nfce_local.Caption := 'NFCe LOCAL';
    pn_inf_nfce_local_v2.Caption := 'NFCe LOCAL';
  end;

  if NFCe.DadosCertificado.Values['Vencendo'] <> '' then
  begin
    pn_inf_nfce_local.Caption := pn_inf_nfce_local.Caption + IfThen(pn_inf_nfce_local.Caption <> '', ' | ') +
      NFCe.DadosCertificado.Values['Vencendo'];
    pn_inf_nfce_local_v2.Caption := pn_inf_nfce_local_v2.Caption + IfThen(pn_inf_nfce_local_v2.Caption <> '', ' | ') +
      NFCe.DadosCertificado.Values['Vencendo'];
  end;

//  lb_nfcelocal.Visible := True;
  pn_inf_nfce_local.Visible := pn_inf_nfce_local.Caption <> '';
  pn_inf_nfce_local_v2.Visible := pn_inf_nfce_local.Caption <> '';

  if (TelaCadastro = 10) then
  begin
    NFCe.AbreRegistros(vCodNF);
    if NFCe.dataSet.IsEmpty then
    begin
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      Self.fechar := True;
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
    SpeedButton1Click(Sender);
  end;

  bt_tef.Visible := vDadosIni.GetIni('TEF', 'POSVirtual', 'N') = 'S';

  ed_ad_campo.Items    := ComboBox1.Items;
  ed_ad_condicao.Items := ComboBox3.Items;

  if ed_ad_campo.Items.IndexOf('Todos') > -1 then
    ed_ad_campo.Items.Delete(ed_ad_campo.Items.IndexOf('Todos'));

  leConfiguracoesFormRegistro;
  ed_ad_campoExit(ed_ad_campo);

  ed_codigo_v2.Clear;
  if NFCe.EmissaoRapida then
  begin
    TelaEmissaoRapidaAtivada := True;
    re_print_cab.Font.Size := re_print_cab.Font.Size + 2;
    re_print.Font.Size     := re_print_cab.Font.Size;
    re_print_rdp.Font.Size := re_print_cab.Font.Size + 4;

    nfce_v2_novo(NFCe);

    TelaCadastro := 0;
    for I := 0 to ParamCount do
      if ModoNFCe then
        Break
      else
        ModoNFCe := LowerCase(ParamStr(I)) = 'modonfce';

    Self.Height := Self.Height + 10;
    Self.Height := Self.Height - 10;

    if Self.ModoNFCe then
    begin
      if _LerConfiguracoesRegistroBoolean('ModoNFCe_M') then
      begin
        FTimerMaximize := TTimer.Create(Self);
        FTimerMaximize.OnTimer := form_show_maximize;
        FTimerMaximize.Interval := 100;
        FTimerMaximize.Enabled := True;
      end
      else
      begin
        Self.Height := _LerConfiguracoesRegistroInteger('ModoNFCe_H', Self.Height);
        Self.Width  := _LerConfiguracoesRegistroInteger('ModoNFCe_W', Self.Width);
        if Self.Height < 500 then Self.Height := 500;
        if Self.Width < 700 then Self.Width := 700;
      end;
    end;
  end;
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    FTimerStatusBar := TTimer.Create(Self);
    FTimerStatusBar.Enabled := False;
    FTimerStatusBar.Interval := 1000 * 60;
    FTimerStatusBar.OnTimer := status_barr_timer;
    FTimerStatusBar.Enabled := True;
  end;
  if ModoNFCe then
  begin
    service_less_timer(Self);
    FTimeServiceLessModNFCe := TTimer.Create(Self);
    FTimeServiceLessModNFCe.Enabled := False;
    FTimeServiceLessModNFCe.Interval := 1000 * 60;
    FTimeServiceLessModNFCe.OnTimer := service_less_timer;
    FTimeServiceLessModNFCe.Enabled := True;
  end;

//  pageDadosNFCe.Height := pageDadosNFCe.Tag - pnTopCadastro.Height;
//  if WindowState =  wsMaximized then
//    pageDadosNFCe.Align := alClient
//  else
//  begin
//    pageDadosNFCe.Align := alTop;
//    pageDadosNFCe.Height := tsCadastro.Height;
//  end;

  Panel1.Visible := True;

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
//SHOW
end;

procedure TfrmCadNFCe.Form_Memoriza;
begin
  DadosForm.Campo        := ComboBox1.Text;
  DadosForm.PesquisaData := MaskEdit2.Visible;
  DadosForm.DataIni      := MaskEdit1.Text;
  DadosForm.DataFim      := MaskEdit2.Text;
  DadosForm.Conteudo     := MaskEdit3.Text;
  DadosForm.Condicao     := ComboBox3.Text;
  DadosForm.EmCadastro   := (PageControl1.ActivePage = TabSheet1) or (PageControl1.ActivePage = ts_nfce_v2);
  DadosForm.AbaCadastr   := pageDadosNFCe.ActivePage;

  DadosForm.CodNFCeAtiva := 0;
  if Assigned(NFCe) then
    if NFCe.dataSet.Active then
      DadosForm.CodNFCeAtiva := NFCe.dataSet.FieldByName('cod_nfce').AsInteger;
end;

procedure TfrmCadNFCe.Form_Memoriza_Voltar;
begin
  if Assigned(NFCe) then
  begin
    BitBtn5.ModalResult := mrNone;
    if DadosForm.PesquisaData then
      NFCe.ConsultaCampos('NFCE', DadosForm.Campo, 'NFCE.COD_NFCE', DadosForm.DataIni, DadosForm.DataFim, vDadosIni.codEmpresa)
    else
      NFCe.ConsultaCampos('NFCE', DadosForm.Conteudo, DadosForm.Campo, DadosForm.Condicao, 'NFCE.COD_NFCE', True, vDadosIni.codEmpresa);

    if DadosForm.CodNFCeAtiva > 0 then
    begin
      NFCe.dataSet.Locate('COD_NFCE', VarArrayOf([DadosForm.CodNFCeAtiva]), []);
      if NFCe.dataSet.FieldByName('COD_NFCE').AsInteger = DadosForm.CodNFCeAtiva then
        if DadosForm.EmCadastro then
        begin
          NFCe.Edit;
          montarComponentes;
          PageControl1.ActivePage := TabSheet1;
          pageDadosNFCe.ActivePage := DadosForm.AbaCadastr;
        end;
    end;
  end;
end;

procedure TfrmCadNFCe.Form_PreparaTela;
begin
  TelaEmissaoRapidaAtivada      := False;
  tsOutrosFormsModal.TabVisible := False;

  PanelLeft.Align := alNone;
  PanelLeft.Height := 570;
  PanelLeft.Width  := 795;
  PanelLeft.OnEnter := PanelLeft_Enter;

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage  := tsCadastro;
  pageDadosNFCe.ActivePage := tsFechamento;
  BitBtn5.OnClick := Btn_CancelaClick;

  montarComponentes;

//  DadosForm.EmEmissaoExterna := True;
end;

procedure TfrmCadNFCe.Form_PreparaTela_Voltar;
begin
  BitBtn5.OnClick := BitBtn5Click;

  PanelLeft.Align := alClient;
  PanelLeft.OnEnter := nil;

//  DadosForm.EmEmissaoExterna := False;
end;

procedure TfrmCadNFCe.form_show_maximize(Sender: TObject);
var
  Texto: string;
begin
  if not Assigned(FTimerMaximize) then
    Exit;

  Texto := re_print.Text;

  FTimerMaximize.Enabled := False;
  Self.WindowState := wsMaximized;

  re_print.WordWrap   := True;
  re_print.Font.Style := [];
  re_print.DefAttributes.Style := [];
  re_print.Text       := Texto;
end;

procedure TfrmCadNFCe.Frete1Click(Sender: TObject);
begin
  inherited;

  pnFreteCampos.Enabled :=
    (NFCe.dataSet.State in [dsInsert, dsEdit])
    and
    NFCe.PermiteAlteracaoPagamento;

  vDadosIni.abreForm('Dados do Frete', pnFrete, opFormsDefCad);

  if pnFreteCampos.Enabled then
    if NFCe.HouveAlteracao() then
      NFCe.SalvarECalcular(True);
end;

procedure TfrmCadNFCe.ed_v2_sangsup_opcaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = '1' then
    ed_v2_sangsup_opcao.Text := '  1 - Sangria'
  else if key = '2' then
    ed_v2_sangsup_opcao.Text := '  2 - Suprimento';
  Key := #0;
  ed_v2_sangsup_opcao.SelectAll;
end;

procedure TfrmCadNFCe.ed_v2_sangsup_valorExit(Sender: TObject);
begin
  inherited;
  ed_v2_sangsup_valor.AsValue := ed_v2_sangsup_valor.AsValue;
end;

procedure TfrmCadNFCe.MaskEdit5Exit(Sender: TObject);
var
  Data, Hora: string;
begin
  inherited;
  try
    Data := MaskEdit5.Text;
    Hora := MaskEdit6.Text;
    NFCe.SetDataEmissao(Data, Hora);
  finally
    MaskEdit5.Text := Data;
    MaskEdit6.Text := Hora;
  end;
end;

procedure TfrmCadNFCe.Menudeoperaesrpidas1Click(Sender: TObject);
begin
  inherited;

  NFCe.Cancel;
  NFCe.CancelUpdates;
  NFCe.Itens.Cancel;
  NFCe.Itens.CancelUpdates;
  NFCe.Pagamento.Cancel;
  NFCe.Pagamento.CancelUpdates;
  NFCe.Dest.Cancel;
  NFCe.Dest.CancelUpdates;
  NFCe.RollBackTransacao;
  
  PageControl1.ActivePage := ts_nfce_v2;

  montarComponentes;
  
  if NFCe.ConfigNFCe.MovimentoOperador.Ativo then
    if not MovOperador.PermiteEmissao(0) then
    begin
      NFCe.AbreRegistros(0, True);

      current_reset;
      current_to_form_cupom;

      v2_cupom_show;

      v2_titulo_error(MovOperador.LastMessage);

      Exit;
    end;

  print_cupom_redefinir;
  print_cupom_cabecalho_change(Sender);
  print_cupom_rodape_change(Sender);
  print_cupom_itens_change(Sender);

  v2_menus_show;
end;

procedure TfrmCadNFCe.ModoSimplificado1Click(Sender: TObject);
begin
  inherited;
  TelaEmissaoRapidaAtivada := True;
  NFCe.EmissaoRapida := TelaEmissaoRapidaAtivada;

  montarComponentes;

  print_cupom_redefinir;
  print_cupom_cabecalho_change(Sender);
  print_cupom_rodape_change(Sender);
  print_cupom_itens_change(Sender);

  PageControl1.ActivePage := ts_nfce_v2;

  if (Self.Enabled) and (Self.Visible) and (ed_codigo_v2.CanFocus) then
    ed_codigo_v2.SetFocus;

  Exit;
end;

procedure TfrmCadNFCe.MonitorStatusServico1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadNFCe_StatusServico, frmCadNFCe_StatusServico);
  frmCadNFCe_StatusServico.ShowModal;
end;

procedure TfrmCadNFCe.montarComponentes;
var
  List1, List2: TStrings;
  I: Integer;
  S: string;
begin             

  NFCe.EmissaoRapida := TelaEmissaoRapidaAtivada;
  Caption := 'Nota Fiscal Consumidor - Emissor(Caixa) ' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3) +
             IfThen(vDadosIni.vNFConsumidor.NFCeOffline = noClient, '   >>>>>>>>>> NFCe LOCAL <<<<<<<<<<');

  v2_status_bar_build_cadastro;

  NFCe.lkVendedor.setDadosDataSet('COD_VENDEDOR', 'NOME_VENDEDOR',
                                  NFCe.SqlOpen('select c.cod_vendedor, c.nome_vendedor from colaborador c' +
                                  ' inner join funcoes f on f.cod_funcao  = c.cod_funcao' +
                                  ' where c.cod_empresa = ' + vDadosIni.codEmpresa +
                                  ' and c.ativo = 1 ' +
                                  ' and c.cod_vendedor <> ' + IntToStr(NFCe.dataSet.FieldByName('cod_vendedor').AsInteger) +
                                  ' and f.desc_funcao like ' + QuotedStr('%VEND%') +
                                  ' union' +
                                  ' select c.cod_vendedor, c.nome_vendedor from colaborador c' +
                                  ' where c.cod_empresa = ' + vDadosIni.codEmpresa +
                                  ' and c.cod_vendedor = ' + IntToStr(NFCe.dataSet.FieldByName('cod_vendedor').AsInteger) +
                                  ' order by 2'), lookupVendedor);

  if TelaEmissaoRapidaAtivada then
  begin
    if NFCe.ConfigNFCe.MovimentoOperador.Ativo then
    begin
      if MovOperador.fnull('dia_fech') then
        v2_titulo_informacao('CAIXA LIVRE')
      else
        v2_titulo_error('CAIXA FECHADO !!');

    end
    else
      v2_titulo_informacao('CAIXA LIVRE');

    NFCe.OnLogMessage := nfce_v2_log_message;

    ed_codigo_v2.Text      := '';
    ed_qtde_v2.Caption     := StrNumber(0, csdQtde);
    ed_vlun_v2.Caption     := StrNumber(0, csdVrUn);
    ed_vltot_v2.Caption    := StrNumber(0);

    vDadosIni.enterTela.AddExclusion(ed_codigo_v2);
//    ed_codigo_v2.OnEnter            := v2_edit_enter_desativa_event;
//    ed_codigo_v2.OnExit             := v2_edit_enter_ativa_event;
//    ed_v2_pag_valores_valor.OnEnter := v2_edit_enter_desativa_event;
//    ed_v2_pag_valores_valor.OnExit  := v2_edit_enter_ativa_event;

    ed_v2_pag_valores_indpag.Visible := NFCe.ConfigNFCe.Cartao.HabCampoAdicional and
                                       (IndexText(NFCe.fstr('NFE_VERSAO'), [strVerVazio, strVer310]) >= 0);
    lb_v2_pag_valores_indpag.Visible := ed_v2_pag_valores_indpag.Visible;

    csdQtde := NFCe.ConfigNFCe.Itens.CasasDecimaisQtde;
    csdVrUn := vDadosIni.vEmp.vCasasDecimais;

    EventoAtualizarTotalPagamento;

    v2_cupom_show;
  end
  else
  begin
    NFCe.OnLogMessage := nil;

    DBCheckBox1.OnClick := nil;
    DBCheckBox1.OnExit  := nil;

    tsOutrosFormsModal.TabVisible := False;
    NFCe.lkTipoImpressao.setDadosDataSet(['4', '5'],
        ['4: DANFE NFC-e',
         '5: DANFE NFC-e envio eletrônico'], DBLookupComboBox3);
    NFCe.lkIndPresenca.setDadosDataSet(['1', '4', '5'],
        ['1: Operação presencial',
         '4: Entrega domicílio',
         '5 - Operação presencial, fora do estabelecimento'], DBLookupComboBox1);
    NFCe.lkModFrete.setDadosDataSet(['0', '1', '2', '9'],
        ['0: Por conta do emitente',
         '1: Por conta do destinatário',
         '2: Por conta de terceiros',
         '9: Sem frete'], DBLookupComboBox2);
  
    MaskEdit5.Text := DateToStr(DateOf(NFCe.dataSet.FieldByName('dhemi').AsDateTime));
    MaskEdit6.Text := TimeToStr(TimeOf(NFCe.dataSet.FieldByName('dhemi').AsDateTime));

    edQtde.FormatSize := '0.' + IntToStr(NFCe.ConfigNFCe.Itens.CasasDecimaisQtde);
    edVlUn.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    edVlTot.FormatSize := '0.2';
    edDescP.FormatSize := '0.6';
    edDescR.FormatSize := '0.2';
    edVlLiq.FormatSize := '0.2';

    edCodigo.Clear;
    edDescrProd.Clear;  
    edQtde.Clear;
    edVlUn.Clear;
    edVlTot.Clear;
    edDescP.Clear;
    edDescR.Clear;
    edVlLiq.Clear;

    DBEdit61.Enabled := Trim(NFCe.dataSet.FieldByName('modfrete').AsString) = '1';

    edVlUn.Enabled  := (NFCe.ConfigNFCe.Itens.Campos.ValorUnitario);
    edVlTot.Enabled := (NFCe.ConfigNFCe.Itens.Campos.ValorTotal);
    edDescP.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoPercentual) and (NFCe.dataSet.FieldByName('desc_por_item').AsString = 'S');
    edDescR.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoEmValor)    and (NFCe.dataSet.FieldByName('desc_por_item').AsString = 'S');
    edVlLiq.Enabled := (NFCe.ConfigNFCe.Itens.Campos.ValorLiquido);
    edUndVnd.Enabled := NFCe.ConfigNFCe.Itens.Campos.UnidadeVenda;

    NFCe.Dest.lkCidades.Sql := 'select cid.codigo_mun_ibge cmun, cid.nome_municipio xmun, es.sigla_uf uf, es.nome_uf estado from cidades_ibge cid' +
                               ' left join estados es on es.ibge_codigo_uf = cid.codigo_uf_ibge';
    NFCe.Dest.lkCidades.setDadosDataSet(['CMUN', 'XMUN', 'UF'], ['CMUN', '%XMUN', 'UF'],
    ['Cod', 'Cidade IBGE', 'Sigla UF'],
        NFCe.Dest.buscas, DBEdit37, dbgridLookUp, True);

  //  Cliente.vLKBairro.Sql := 'select cod_bairro, nome_bairro from bairros where ativo = 1 order by nome_bairro';
  //    Cliente.vLKBairro.setDadosDataSet(['COD_BAIRRO', 'BAIRRO'], ['COD_BAIRRO', '%NOME_BAIRRO'], [] , Cliente.buscas, DBEdit118, dbgridLookUp, False, 0, 0, 0, 300);

    NFCe.lkSeqPreco.setDadosDataSet(
        vDadosIni.convertStrinsToArray(NFCe.ConfigNFCe.ListSeqPreco, 1),
        vDadosIni.convertStrinsToArray(NFCe.ConfigNFCe.ListSeqPreco, 2), DBLookupComboBox4);

    pnSeqPreco.Visible := (NFCe.Itens.dataSet.RecordCount = 0) and (NFCe.lkSeqPreco.dataSet.RecordCount > 0);

  //  edDescontoTotal.Enabled := not (NFCe.dataSet.FieldByName('DESC_POR_ITEM').AsString = 'S');
  //  btDescontoCabecalhoHabilitar.Visible := not edDescontoTotal.Enabled;
  //  btDescontoCabecalhoDesabilitar.Visible := edDescontoTotal.Enabled;
  //  btDescontoCabecalhoHabilitar.Left := btDescontoCabecalhoDesabilitar.Left;

    btCancelaPagamento.Click;
    {
    NFCe.Pagamento.lkTipoPagamento.setDadosDataSet([
      '1','2','3','4','5','10','11','12','13','99'], [
      '01 - Dinheiro', '02 - Cheque', '03 - Cartão de Crédito', '04 - Cartão de Débito',
      '05 - Crédito Loja', '10 - Vale Alimentação', '11 - Vale Refeição',
      '12 - Vale Presente', '13 - Vale Combustível', '99 - Outros'], lkFormaPagamento);
    }
    NFCe.Pagamento.lkTipoPagamento.setDadosDataSet('tpag', 'descricao',
      NFCe.SqlOpen('select s.tpag, (lpad(s.tpag,2,''0'')  || '' - '' || s.descricao) as descricao from sp_nfe_meios_pag s' +
                   ' where s.tpag not in (15 %s)',
                   [IfThen(NFCe.fdate('dhemi') < EncodeDate(2021, 09, 01), ', 99')]),
                   lkFormaPagamento);
    NFCe.Pagamento.lkBandeira.setDadosDataSet([
      '1','2','3','4', '5', '6', '7', '8', '9', '99'], [
      '01 - Visa', '02 - Mastercard', '03 - American Express', '04 - Sorocred',
      '05 - Diners Club', '06 - Elo', '07 - Hipercard', '08 - Aura', '09 - Cabal',
      '99 - Outros'], lkBandeira);

    if not Assigned(Flkindpag) then
      Flkindpag := TDadosLookUp_OOP.create;

    Flkindpag.setDadosDataSet([
      '','0','1'], [
      '', '0 - A vista', '1 - A prazo'], lkindpag);

    if not Assigned(lkIntermed) then
      lkIntermed := TDadosLookUp_OOP.create;
    lkIntermed.setDadosDataSet(['', '0', '1'], ['Não se aplica', '0 - Operação "Sem" intermediador', '1 - Operação "Com" intermediador'], DBLookupComboBox5);

    lkFormaPagamento.Visible := NFCe.ConfigNFCe.Cartao.HabCampoAdicional;
    lbFormaPagamento.Visible := lkFormaPagamento.Visible;
    lkBandeira.Enabled       := False;
    edNumAutorizacao.Enabled := lkBandeira.Enabled;
    edNumAutorizacao.Clear;
    lkindpag.Visible         := NFCe.ConfigNFCe.Cartao.HabCampoAdicional and
                                (not vDadosIni.strIn(NFCe.dataSet.FieldByName('NFE_VERSAO').AsString, [strVerVazio, strVer310]));

    lkCtrlFormPagamento.KeyValue := Null;

//    gridItens.Columns[10].Visible := True;//not(vDadosIni.vEmp.vRegime = 'SIMPLES');
//    gridItens.Columns[11].Visible :=    (vDadosIni.vEmp.vRegime = 'SIMPLES');

    EventoChangeStatusNFC;
    EventoAtualizarTotalPagamento;

    ckIgnorarTributosRTC.Enabled := NFCe.Auditor.Habilitar.InibirMensagens.Processo('NFC046', 'NUM NF '+ NFCe.fstr('NUM_NF'), NFCe.fstr('COD_NFCE')).Permitido;

    ComboBoxMunicipiosFrame2.Setup( TSetupComboBoxMunicipiosFrame.Create(
      NFCe.fint('cmunfgibs'), False, True
    ));

    ComboBoxOpInternasFrame1.Visible := not NFCe.fnull('dfe_trib_ignorar') and (YesNoEnum(NFCe.fint('dfe_trib_ignorar')) = ynNo);
    edNaturezaOperacao.Visible := not ComboBoxOpInternasFrame1.Visible;
    lbOperacao.Caption := IfThen(edNaturezaOperacao.Visible, 'Natureza de Operação', 'Operação Interna');

    if ComboBoxOpInternasFrame1.Visible then
      ComboBoxOpInternasFrame1.Setup( TSetupComboBoxOpInternasFrame.Create(
        NFCe.fstr('op_interna_id'), False, True
      ));

    ComboBoxOpInternasFrame1.Enabled := NFCe.PermiteAlteracaoItens;
    ComboBoxMunicipiosFrame2.Enabled := ComboBoxOpInternasFrame1.Enabled;

    if WindowState =  wsMaximized then
      pageDadosNFCe.Align := alClient
    else
    begin
      pageDadosNFCe.Align := alTop;
      pageDadosNFCe.Height := tsCadastro.Height - pnTopCadastro.Height - IfThen(pn_inf_nfce_local.Visible, pn_inf_nfce_local.Height);
    end;

    if Assigned(NFCe) then
      NFCe.StatusChange := EventoChangeStatusNFC;
  end;
  NFCe.OnLogRejeicao := nfce_v2_log_rejeicao;
  ed_rejeicoes.Lines.Clear;
  ed_v2_log_rejeicoes.Lines.Clear;
  ts_rejeicoes_mensagens.Caption    := 'Rejeições / Mensagens SEFAZ    ';
  bt_v2_menu_log_rejeicoes.Caption := 'LOG DE REJEICOES';

  if AlertasDFeUtil.TryObterAlertasFormatado(NFCe.fstr('chave_nfce'), S) then
    edMemoAlertasSefaz.Lines.Text := S
  else
    edMemoAlertasSefaz.Lines.Text := '';

  if Assigned(NFCe) then
  begin
    if Assigned(NFCe.Pagamento) then
      NFCe.Pagamento.PagamentoChange := EventoAtualizarTotalPagamento;

    NFCe.FieldChangeEvnt := EventoNFCeFieldChange;
    NFCe.RegisterNotificationToField('CMUNFGIBS');
    NFCe.RegisterNotificationToField('DFE_TRIB_IGNORAR');
  end;
end;

procedure TfrmCadNFCe.NFCeAutorizacao1Salvar1Click(Sender: TObject);
begin
  inherited;
  SalvarXML(NFCe.GetXML(opAutorizacao), NFCe.dataSet.FieldByName('chave_nfce').AsString + '-nfe.xml');
end;

procedure TfrmCadNFCe.NFCeAutorizacao1Visualizar1Click(Sender: TObject);
begin
  inherited;
  VisualizaXML(NFCe.GetXML(opAutorizacao));
end;

procedure TfrmCadNFCe.NFCeCancelamento1Salvar1Click(Sender: TObject);
begin
  inherited;
  SalvarXML(NFCe.GetXML(opCancelamento), NFCe.dataSet.FieldByName('chave_nfce').AsString + '-canc.xml');
end;

procedure TfrmCadNFCe.NFCeCancelamento1Visualizar1Click(Sender: TObject);
begin
  inherited;
  VisualizaXML(NFCe.GetXML(opCancelamento));
end;

procedure TfrmCadNFCe.NFCeInutilizacao1Salvar1Click(Sender: TObject);
begin
  inherited;
  SalvarXML(NFCe.GetXML(opInutilizacao),
    IfThen( Trim(NFCe.dataSet.FieldByName('chave_nfce').AsString) <> '',
            NFCe.dataSet.FieldByName('chave_nfce').AsString) +
    IfThen( Trim(NFCe.dataSet.FieldByName('chave_nfce').AsString) = '',
            IntToStr(YearOf(NFCe.dataSet.FieldByName('inut_dhrecbto').AsDateTime)) + '_' +
            vDadosIni.StrZero(NFCe.dataSet.FieldByName('modelo').AsInteger, 2) + '_' +
            vDadosIni.StrZero(NFCe.dataSet.FieldByName('serie').AsInteger, 3) + '_' +
            vDadosIni.StrZero(NFCe.dataSet.FieldByName('num_nf').AsInteger, 9)) +
    '-inut.xml');
end;

procedure TfrmCadNFCe.NFCeInutilizacao1Visualizar1Click(Sender: TObject);
begin
  inherited;
  VisualizaXML(NFCe.GetXML(opInutilizacao));
end;

procedure TfrmCadNFCe.print_cupom_cabecalho_change(Sender: TObject);
var
  S1, S2, S3, NS: string;
  Q1, Q2, Q3, NQ: Integer;
  D: Double;

  procedure LineSpaceRichEdit(RichEdit :TRichEdit);
  var
    ParaFormat: TParaFormat2;
  begin
    RichEdit.SelectAll;
    ParaFormat.cbSize           := SizeOf(ParaFormat);
    ParaFormat.dwMask           := PFM_LINESPACING or PFM_SPACEAFTER;
    ParaFormat.dyLineSpacing    := 1;
    ParaFormat.bLineSpacingRule := 1;

    SendMessage(RichEdit.handle, EM_SETPARAFORMAT, 0, LongInt(@ParaFormat));

    RichEdit.SelStart := 0;
    RichEdit.SelLength := 0;
  end;

begin
  if NFCe.Itens.dataSet.RecordCount = 0 then
  begin
    re_print_cab.Visible := False;
    re_print_cab_padding.Visible := False;
    Exit;
  end;

  re_print_cab.Lines.Clear;
  re_print_cab.Visible             := True;
  re_print_cab_padding.Visible     := True;
  re_print_cab.Top                 := 0;
  re_print_cab_padding.Top         := 0;
  re_print_cab.Font.Size           := re_print_cab.Font.Size;

  re_print_cab.SelAttributes.Style := [];
  re_print_cab.Lines.Add(PadR('-', print_control.QCNormal));
  if NFCe.Dest.str_empty('cnpjcpf') or NFCe.Dest.str_empty('xnome') then
  begin
    S1 := ' CLIENTE NÃO IDENTIFICADO';
    S2 := 'CX: ' + NFCe.fstr('cod_emissor');
    Q2 := Length(S2);
    Q1 := print_control.QCNormal - Q2;
    re_print_cab.Lines.Add(PadR(S1, Q1) + S2);
  end
  else
  begin
    S1 := Format(' CLIENTE: %s - %s', [NFCe.Dest.fstr('cnpjcpf'), NFCe.Dest.fstr('xnome')]);
    S2 := 'CX: ' + NFCe.fstr('cod_emissor');
    Q2 := Length(S2);
    Q1 := print_control.QCNormal - Q2;
    re_print_cab.Lines.Add(PadR(S1, Q1) + S2);
  end;
  re_print_cab.Lines.Delete(0);

  S2 := NFCe.fstr('situacao_nfce') + IfThen(NFCe.fequals('tpemis', '9'), ' EMITIDA EM CONTINGENCIA');
//  if NFCe.fstrin('situacao_nfce', [sitAutorizada, sitCancelada, sitDenegada, sitInutilizada]) then
//    S2 := NFCe.fstr('situacao_nfce')
//  else if NFCe.fequals('tpemis', '9') then
//    S2 := NFCe.fstr('situacao_nfce')
//

  if S2 <> '' then
  begin
    S2 := ' NFCe ' + S2;
    re_print_cab.SelAttributes.Style := [];
    //S2 := 'EMITDA EM CONTINGENCIA';
    Q2 := Length(S2);
    Q1 := Trunc((print_control.QCNormal - Q2) / 2);
    Q3 := print_control.QCNormal - Q2 - Q1;
    S1 := PadL('*', Q1, '*');
    S3 := PadL('*', Q3, '*');
    re_print_cab.Lines.Add(S1 + S2 + S3);
  end;

  S1 := ' ' + FormatDateTime('DD/MM/YYYY', NFCe.fdate('data_lanc'));
  S2 := 'NOTA FISCAL CONSUMIDOR';
  S3 := 'ID: ' + NFCe.fstr('cod_nfce') + '   ';

  Q2 := Length(S2);
  Q1 := Trunc( (print_control.QCNormal - Q2) / 2);
  Q3 := print_control.QCNormal - Q1 - Q2;
  re_print_cab.Lines.Add(PadR(S1, Q1) + S2 + PadL(S3, Q3));
  NS := S2;
  NQ := Q2;

  S1 := 'Qtde UN';
  S2 := 'Valor UN Sit';
  s3 := 'Valor Total';

  Q1 := Trunc(print_control.QCNegrito / 3);
  Q2 := Q1;
  Q3 := print_control.QCNegrito - (Q1 + Q2);

  re_print_cab.SelAttributes.Style := [fsBold];
  re_print_cab.Lines.Add(' Item' + PadL(S1, Q1 - 5) + PadL(S2, Q2) + PadL(S3 + ' ', Q3));

  Canvas.Font.Assign(re_print_cab.Font);
  re_print_cab.Tag := re_print_cab.Height;
  re_print_cab.Tag := re_print_cab.ClientHeight;
  d := Canvas.TextHeight('3,999 UN');

  LineSpaceRichEdit(re_print_cab);
  re_print_cab.ClientHeight := Trunc((Canvas.TextHeight('3,999 UN') + 2) * (re_print_cab.Lines.Count + 1));

  re_print_cab.SelStart  := Pos(NS, re_print_cab.Lines.Text) - 1;
  re_print_cab.SelLength := NQ;
  re_print_cab.SelAttributes.Style := [fsBold];
end;

procedure TfrmCadNFCe.v2_cliente_avulso_show;
begin
  v2_print_reset;

  v2_bt_nav_botao_assign(bt_v2_cliente_avulso_salvar);
  v2_bt_nav_botao_assign(bt_v2_cliente_avulso_cancela);

  v2_wc_nav_keydown([ed_v2_cliente_avulso_cpf,
                     ed_v2_cliente_avulso_nome,
                     ed_v2_cliente_avulso_email,
                     ed_v2_cliente_avulso_logr,
                     ed_v2_cliente_avulso_num,
                     ed_v2_cliente_avulso_bairro,
                     ed_v2_cliente_avulso_uf,
                     ed_v2_cliente_avulso_fone,
                     ed_v2_cliente_avulso_cep,
                     ed_v2_cliente_avulso_complemento], v2_action_wc_nav_updown_keydown);
                     
  v2_wc_nav_keydown([ed_v2_cliente_avulso_cidade], v2_action_wc_nav_leftrigth_keydown);

  v2_wc_nav_keydown([bt_v2_cliente_avulso_salvar,
                     bt_v2_cliente_avulso_cancela], v2_action_wc_escape_KeyDown);

  ed_v2_cliente_avulso_cpf.Text         := NFCe.Dest.fstr('cnpjcpf');
  ed_v2_cliente_avulso_nome.Text        := NFCe.Dest.fstr('xnome');
  ed_v2_cliente_avulso_email.Text       := NFCe.Dest.fstr('email');
  ed_v2_cliente_avulso_logr.Text        := NFCe.Dest.fstr('xlgr');
  ed_v2_cliente_avulso_num.Text         := NFCe.Dest.fstr('nro');
  ed_v2_cliente_avulso_bairro.Text      := NFCe.Dest.fstr('xbairro');
  ed_v2_cliente_avulso_cidade.KeyValue  := NFCe.Dest.fint('cmun');
  ed_v2_cliente_avulso_uf.Text          := NFCe.Dest.fstr('uf');
  ed_v2_cliente_avulso_fone.Text        := NFCe.Dest.fstr('fone');
  ed_v2_cliente_avulso_cep.Text         := NFCe.Dest.fstr('cep');
  ed_v2_cliente_avulso_complemento.Text := NFCe.Dest.fstr('xcpl');

  v2_panel_assign(pn_v2_cliente_avulso);
end;

procedure TfrmCadNFCe.v2_codigo_pesquisar(Codigo: string; PesquisaF3: Boolean);
var
  RecordCount: Integer;
  AleituraEAN13: string;
  SaveItem: Boolean;
begin
  inherited;
  SaveItem := False;
  
  Codigo := Trim(Codigo);

  if not PesquisaF3 then  
    if Codigo = '' then
      Exit;

  try
    if (NFCe.fint('cod_nfce') <> current.AplicaDes.IdNFCe) and (current.AplicaDes.Modalidade = adNFCeAtual)  then
      current_desconto_modalidade_reset;

    current_reset;
    current.Codigo := Codigo;

    if Pos('*', Codigo) > 1 then
    begin
      current.Qtde   := StrToFloatDef(Copy(Codigo, 1, Pos('*', ed_codigo_v2.Text) - 1), 0);
      current.Codigo := Copy(current.Codigo, Pos('*', current.Codigo) + 1, Length(current.Codigo));
    end;

    if lb_prod_serv_v2.Caption = 'Código Produto' then
    begin
      vDadosIni.vProduto.LeituraPesoBalanca.resetVals;
      AleituraEAN13 := NFCe.Itens.leituraEAN13_balanca(Codigo, RecordCount);

      if Copy(UpperCase(AleituraEAN13), 1, 4) = 'ERRO' then
      begin
        v2_titulo_error(vDadosIni.vProduto.LeituraPesoBalanca.vals.msg);
        Exit;
      end
      else if AleituraEAN13 = 'VALIDO' then
      begin
        current.Qtde     := vDadosIni.vProduto.LeituraPesoBalanca.vals.peso;
        current_calc_use_vl_tot(vDadosIni.vProduto.LeituraPesoBalanca.vals.preco);
      end
      else if not NFCe.Itens.buscaProduto(PesquisaF3, current.Codigo, RecordCount) then
      begin
        if PesquisaF3 then
          v2_titulo_alerta('Operação cancelada')
        else
          v2_titulo_error('PRODUTO NÃO ENCONTRADO');
        Exit;
      end;

      if RecordCount > 1 then
      begin
        v2_cons_prod_show;
        Exit;
      end;

      if current_from_select_prod then
        SaveItem := True
      else
        v2_titulo_error(current.Error);

      if SaveItem and (NFCe.Itens.Prod.fequals('alt_cod_cupom', 'S') or NFCe.Itens.Prod.fequals('alt_desc_cupom', 'S')) then
      begin
        SaveItem := False;
        ed_v2_alt_item_und.Items.Text := current.UndsVnd.Text;
        ed_v2_alt_item_und.ItemIndex := 0;

        v2_preparar_item_para_alterar_conf_prod(NFCe.Itens.Prod.fequals('alt_cod_cupom', 'S'), NFCe.Itens.Prod.fequals('alt_desc_cupom', 'S'));
        Exit;
      end;
    end
    else if lb_prod_serv_v2.Caption = 'Código Serviço' then
    begin
      if not NFCe.Itens.buscaServico(False, Codigo, RecordCount) then
        Exit;
      
//        if RecordCount > 1 then
//          if not vDadosIni.abreForm('Escolha o serviço', pnSelecionaServico, [ofAutoSize, ofAlignAllClientWinCtrl, ofEscapeExit]) then
//          begin
//            if (Self.Enabled) and (Self.Visible) and (ed_codigo_v2).CanFocus then 
//              ed_codigo_v2.SetFocus;
//            Exit;
//          end;

      //ed_codigo_v2.Text   := NFCe.Itens.Serv.fstr('COD_SERVICO');
      v2_titulo_informacao(NFCe.Itens.Serv.fstr('DESC_SERVICO'));
      current.Qtde        := IfThen(current.Qtde = 0, 1, current.Qtde);
      current.ValorUn     := NFCe.Itens.Serv.ffloat('VALOR_SERVICO');
      current.ValorTot    := current.Qtde * current.ValorUn;
      SaveItem := True;
    end;
  finally
    if SaveItem then
    begin
      current_to_form_cupom;

      if SaveItem then
        if lb_prod_serv_v2.Caption = 'Código Produto' then
          current_setproduto
        else if lb_prod_serv_v2.Caption = 'Código Serviço' then
          NFCe.Itens.SetServico(current.Alteracao, current.Codigo, current.Descricao, current.Qtde, current.ValorUn, current.ValorTot, current.ValorDes);

      if NFCe.Itens.dataSet.RecordCount = 1 then
        print_cupom_cabecalho_change(NFCe);
      print_cupom_rodape_change(NFCe);
      if NFCe.Itens.dataSet.RecordCount = 1 then
        print_cupom_redefinir;
      print_cupom_itens_change(NFCe);
      ed_codigo_v2.SelectAll;
    end;
  end;
end;

procedure TfrmCadNFCe.v2_cons_cliente_selecionar_show;
begin
  v2_print_reset;

  v2_bt_nav_botao_assign([bt_v2_cons_cliente_consultar,
                          bt_v2_cons_cliente_cancela]);

  grid_v2_cons_cliente_selecionar.DataSource   := NFCe.ConsultaCliente._dataSourceOOP;

  v2_panel_assign(pn_v2_cons_cliente_selecionar);
end;

procedure TfrmCadNFCe.v2_cons_cliente_show;
begin
  v2_print_reset;

  v2_bt_nav_botao_assign([bt_v2_cons_cliente_consultar,
                          bt_v2_cons_cliente_cancela]);

  v2_wc_nav_keydown([bt_v2_cons_cliente_consultar,
                     bt_v2_cons_cliente_cancela], v2_action_wc_escape_KeyDown);

  v2_wc_nav_keydown([ed_v2_cons_cliente_opcao,
                     ed_v2_cons_cliente_texto_consulta], v2_action_wc_nav_updown_keydown);

  lb_v2_cons_cliente_nao_encontrado.Visible := False;
  ed_v2_cons_cliente_opcao.Text := _LerConfiguracoesRegistroString(ed_v2_cons_cliente_opcao.Name, '1 - Nome');
  //ed_v2_cons_cliente_opcao.Text := '1 - Nome';

  v2_panel_assign(pn_v2_cons_cliente);
end;

procedure TfrmCadNFCe.v2_cons_orcamento_show;
begin
  v2_print_reset;

  {
  v2_bt_nav_botao_assign([bt_v2_cons_cliente_consultar,
                          bt_v2_cons_cliente_cancela]);

  v2_wc_nav_keydown([bt_v2_cons_cliente_consultar,
                     bt_v2_cons_cliente_cancela], v2_action_wc_escape_KeyDown);

  v2_wc_nav_keydown([ed_v2_cons_cliente_opcao,
                     ed_v2_cons_cliente_texto_consulta], v2_action_wc_nav_updown_keydown);

  lb_v2_cons_cliente_nao_encontrado.Visible := False;
  ed_v2_cons_cliente_opcao.Text := '1 - Nome';
  }

  v2_panel_assign(pn_v2_selecionar_orcamento);
end;

procedure TfrmCadNFCe.v2_cons_prod_show;
begin
  v2_print_reset;

  NFCe.Itens.Prod.EventoAfterScroll := EventoAfterScrollProdutos;
  grid_v2_cons_prod.DataSource   := dtmNFConsumidor.dsProd;
  //grid_v2_cons_prod.OnDblClick   := v2_action_consulta_prod_selecionar;
//  grid_v2_cons_prod.OnKeyDown    := v2_action_consulta_prod_grid_keydown;

  v2_panel_assign(pn_v2_cons_prod);
end;

procedure TfrmCadNFCe.v2_contingencia_show;
begin
  v2_print_reset;

  v2_wc_nav_keydown([ed_v2_contingencia], v2_action_wc_escape_KeyDown);

  ed_v2_contingencia_msg.Lines.Text := NFCe.SoliticacaoContingencia.Mensagem;
  ed_v2_contingencia.Text           := 'Selecione a opção desejada';
  ed_v2_contingencia.SelectAll;

  v2_titulo_informacao('Contingência');
  v2_panel_assign(pn_v2_contingencia);

  pn_v2_contingencia_.Height := pn_v2_contingencia.ClientHeight - (pn_v2_contingencia.BorderWidth * 2);
  pn_v2_contingencia_msg.Height := pn_v2_contingencia_.ClientHeight - gpn_v2_contingencia.Height - 2;
end;

procedure TfrmCadNFCe.v2_cupom_show;
begin
	if not Self.Enabled then
    Exit
  else if not Self.Visible then
    Exit;

  v2_print_reset;
  v2_panel_assign(pn_v2_cupom, False);

  if not NFCe.ConfigNFCe.MovimentoOperador.Ativo then
    ed_codigo_v2.Enabled := True
  else if (MovOperador.Cod_nfce_liberada > 0) and (MovOperador.Cod_nfce_liberada = NFCe.fint('cod_nfce')) then
    ed_codigo_v2.Enabled := True
  else
    ed_codigo_v2.Enabled := MovOperador.DiaEstaAberto;

  if (Self.Enabled) and (Self.Visible) and (ed_codigo_v2.Enabled) and (ed_codigo_v2.CanFocus) then
    ed_codigo_v2.SetFocus;

  print_cupom_cabecalho_change(NFCe);
  print_cupom_rodape_change(NFCe);
  print_cupom_itens_change(NFCe);
end;

procedure TfrmCadNFCe.v2_desconto_item_show;
begin
  v2_print_reset;

  v2_bt_nav_botao_assign([bt_v2_desconto_item_salvar,
                          bt_v2_desconto_item_cancela]);

  v2_wc_nav_keydown([bt_v2_desconto_item_salvar,
                     bt_v2_desconto_item_cancela], v2_action_wc_escape_KeyDown);

  v2_wc_nav_keydown([ed_v2_desconto_item_modal,
                     ed_v2_desconto_item_perc,
                     ed_v2_desconto_item_val], v2_action_wc_nav_updown_keydown);

  ed_v2_desconto_item_perc.AsValue    := current.AplicaDes.Percentual;
  ed_v2_desconto_item_val.AsValue     := current.AplicaDes.Valor;
  ed_v2_desconto_item_modal.Text      := IfThen(current.AplicaDes.Modalidade = adProximoItem, '1 - Próximo item') +
                                         IfThen(current.AplicaDes.Modalidade = adNFCeAtual  , '2 - NFC-e atual') +
                                         IfThen(current.AplicaDes.Modalidade = adSempre     , '3 - Todas NFC-e''s');

  v2_panel_assign(pn_v2_desconto_item);
end;

procedure TfrmCadNFCe.v2_emitir;
var
  Um: Char;
begin
  NFCe.AtualizarInformacoesFiscaisItens(True);
  if NFCe.Emitir then //caso
  begin
    nfce_v2_novo(nfce);
  end
  else if (NFCe.SoliticacaoContingencia.Codigo = NFCe.fint('cod_nfce')) and (NFCe.SoliticacaoContingencia.Solicitar) then
  begin
    Um := '1';
    if NFCe.ConfigNFCe.Regras.ConverterEmContingencia then
      ed_v2_contingenciaKeyPress(ed_v2_contingencia, Um)
    else
      v2_contingencia_show;
  end
  else
  begin
    v2_action_cancela_and_show_cupom(nil);

    re_print.WordWrap  := True;
    re_print.Lines.Add(NFCe.LastMessage);
  end;
end;

procedure TfrmCadNFCe.v2_exclusao_item_show;
begin
  v2_print_reset;

//  v2_bt_nav_botao_assign([bt_v2_exclusao_sim,
//                          bt_v2_exclusao_nao]);

//  v2_wc_nav_keydown([bt_v2_exclusao_sim,
//                     bt_v2_exclusao_nao], v2_action_wc_escape_KeyDown);

  v2_panel_assign(pn_v2_exclusao_item);
end;

procedure TfrmCadNFCe.v2_form_alt_item_configura;
begin
  ed_v2_alt_item_qtde.FormatSize      := '0.' + IntToStr(NFCe.ConfigNFCe.Itens.CasasDecimaisQtde);
  ed_v2_alt_item_vl_un.FormatSize     := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  ed_v2_alt_item_vl_tot.FormatSize    := '0.2';
  ed_v2_alt_item_desc_perc.FormatSize := '0.6';
  ed_v2_alt_item_desc_val.FormatSize  := '0.2';
  ed_v2_alt_item_tot_liq.FormatSize   := '0.2';
end;

procedure TfrmCadNFCe.v2_form_pagamento_configura;
begin
  pn_v2_pag_title.Caption           := '[Enter: Confirma] [ESC: Cancelar]';

  grid_v2_pag_ctrl.Visible          := False;
  grid_v2_pag_pgtos.Visible         := False;
  pn_v2_pag_valores.Visible         := True;
  ed_v2_pag_valores_band.Visible    := Length(NFCe.Pagamento.TipoPagamento.fstr('cpfcgc')) = 14;
  ed_v2_pag_valores_num_aut.Visible := ed_v2_pag_valores_band.Visible;
  lb_v2_pag_valores_band.Visible    := ed_v2_pag_valores_band.Visible;
  lb_v2_pag_valores_num_aut.Visible := ed_v2_pag_valores_num_aut.Visible;

  vDadosIni.enterTela.DeleteExclusion(ed_v2_pag_valores_valor);
  vDadosIni.enterTela.DeleteExclusion(ed_v2_pag_valores_band);
//  ed_v2_pag_valores_valor.OnEnter    := nil;
//  ed_v2_pag_valores_valor.OnKeyDown  := nil;
//  ed_v2_pag_valores_band.OnKeyDown   := nil;

  if ed_v2_pag_valores_band.Visible then
  begin
    ed_v2_pag_valores_band.OnKeyDown  := ed_v2_pag_valores_valorKeyDown;
    ed_v2_pag_valores_valor.OnKeyDown := ed_v2_pag_valores_indpagKeyDown;
    vDadosIni.enterTela.AddExclusion(ed_v2_pag_valores_band);
  end
  else
  begin
    ed_v2_pag_valores_band.OnKeyDown  := ed_v2_pag_valores_indpagKeyDown;
    ed_v2_pag_valores_valor.OnKeyDown := ed_v2_pag_valores_valorKeyDown;
    vDadosIni.enterTela.AddExclusion(ed_v2_pag_valores_valor);
  end;
//  if Assigned(ed_v2_pag_valores_valor.OnKeyDown) then
//    ed_v2_pag_valores_valor.OnEnter := v2_edit_enter_desativa_event;
end;

procedure TfrmCadNFCe.v2_log_rejeicoes;
begin
  v2_print_reset;

  v2_wc_nav_keydown([ed_v2_log_rejeicoes], v2_action_wc_escape_KeyDown);
  if ed_v2_log_rejeicoes.Text <> '' then
    ed_v2_log_rejeicoes.SelStart := Length(ed_v2_log_rejeicoes.Text);

  v2_titulo_informacao('Log de Rejeições');
  v2_panel_assign(pn_v2_log_rejeicoes);
end;

procedure TfrmCadNFCe.v2_log_show;
begin
  v2_print_reset;

  v2_wc_nav_keydown([ed_v2_log_messages], v2_action_wc_escape_KeyDown);
  if ed_v2_log_messages.Text <> '' then
    ed_v2_log_messages.SelStart := Length(ed_v2_log_messages.Text);

  v2_titulo_informacao('Log de Mensagens');
  v2_panel_assign(pn_v2_log_messages);
end;

procedure TfrmCadNFCe.v2_menus_show;
begin
  v2_print_reset;

  v2_bt_nav_botao_assign([bt_v2_menu_novo,
                          bt_v2_menu_excluir,
                          bt_v2_menu_alterar,
                          bt_v2_menu_desconto_item,
                          bt_v2_menu_valores_nf,
                          bt_v2_menu_usar_orcamento,
                          bt_v2_menu_movimento_operador,
                          bt_v2_menu_sangsup,
                          bt_v2_menu_consulta_nfce,
                          bt_v2_menu_modo_completo,
                          bt_v2_menu_pagamento,
                          bt_v2_menu_consulta_cliente,
                          bt_v2_menu_consulta_cliente,
                          bt_v2_menu_goto_page_2,
                          bt_v2_menu_voltar_page_1,

                          bt_v2_menu_goto_page_1,
                          bt_v2_menu_modo_reimprimir,
                          bt_v2_menu_log_rejeicoes,
                          bt_v2_menu_log_messages,
                          bt_v2_menu_voltar_page_2
                         ]);

  v2_wc_nav_keydown([bt_v2_menu_novo,
                     bt_v2_menu_excluir,
                     bt_v2_menu_alterar,
                     bt_v2_menu_desconto_item,   
                     bt_v2_menu_valores_nf,
                     bt_v2_menu_usar_orcamento,     
                     bt_v2_menu_movimento_operador,
                     bt_v2_menu_sangsup,
                     bt_v2_menu_consulta_nfce,
                     bt_v2_menu_modo_completo,
                     bt_v2_menu_pagamento,
                     bt_v2_menu_consulta_cliente,
                     bt_v2_menu_goto_page_2,
                     bt_v2_menu_voltar_page_1
                    ], v2_action_bt_menus_pag_1_KeyDown);

  v2_wc_nav_keydown([bt_v2_menu_goto_page_1,
                     bt_v2_menu_modo_reimprimir,
                     bt_v2_menu_log_messages,
                     bt_v2_menu_log_rejeicoes,
                     bt_v2_menu_voltar_page_2
                    ], v2_action_bt_menus_pag_2_KeyDown);

  pn_v2_menus_pag_1.Visible := True;
  pn_v2_menus_pag_2.Visible := False;

  v2_panel_assign(pn_v2_menus);
end;

procedure TfrmCadNFCe.v2_movimento_operador_show;
begin
  v2_print_reset;

  ed_v2_movimento_operador_dia.Clear;

  MovOperador.GetDiaAtualDoEmissor;

  if MovOperador.dataSet.IsEmpty then
  begin                                                                                    
    lb_pn_v2_movimento_operador_title.Tag     := 0;
    lb_pn_v2_movimento_operador_title.Caption := '[Movimento do Operador - Sem movimento]';
  end
  else
  begin
    lb_pn_v2_movimento_operador_title.Tag     := MovOperador.fint('id');
    lb_pn_v2_movimento_operador_title.Caption := Format('[ID: %s Movimento do Operador %s - Dia %s]',
                                                        [PadL(MovOperador.fint('id'), 3), PadL(MovOperador.fint('operador'), 3),
                                                         IfThen(MovOperador.fnull('dia_fech'), 'Aberto', 'Fechado')]);
  end;

  if not MovOperador.dataSet.IsEmpty then
    ed_v2_movimento_operador_dia.Text := FormatDateTime('    dd/MM/yyyy', MovOperador.fdate('dia_mov'));

  with MovOperador.TotaisDoDia do
  begin
    ed_v2_movimento_operador_sang.AsValue := Sangria;
    ed_v2_movimento_operador_sup.AsValue := Suprimento;
    ed_v2_movimento_operador_nfce_din.AsValue := NFCe_Dinheiro;
    ed_v2_movimento_operador_nfce_out.AsValue := NFCe_Outros;
    ed_v2_movimento_operador_liq_din.AsValue := NFCe_Dinheiro + Suprimento - Sangria;
    ed_v2_movimento_operador_liq_geral.AsValue := NFCe_Dinheiro + NFCe_Outros + Suprimento - Sangria;
  end;

  v2_bt_nav_botao_assign([bt_v2_movimento_operador_relatorio,
                          bt_v2_movimento_operador_abrirDia,
                          bt_v2_movimento_operador_voltar
                         ]);

  v2_wc_nav_keydown([bt_v2_movimento_operador_relatorio,
                     bt_v2_movimento_operador_abrirDia,
                     bt_v2_movimento_operador_voltar
                    ], v2_action_wc_escape_KeyDown);

  bt_v2_movimento_operador_abrirDia.Caption := IfThen(MovOperador.DiaEstaAberto, 'Fechar dia de Movimento', 'Abrir dia de Movimento');

  v2_panel_assign(pn_v2_movimento_operador);
end;

procedure TfrmCadNFCe.print_cupom_redefinir;
const
  Str10 = '1234567890';
var
  Margins: Integer;
  Proporcao: Double;
begin                                         
  re_print.Font.Name      := 'Courier New';
  re_print_cab.Font.Name  := 'Courier New';
  re_print_rdp.Font.Name  := 'Courier New';
  {
  re_print.Font.Name      := 'Lucida Console';
  re_print_cab.Font.Name  := 'Lucida Console';
  re_print_rdp.Font.Name  := 'Lucida Console';
  }
  Margins                 := re_print.Perform(EM_GETMARGINS, 0, 0);
  Margins                 := LongRec(Margins).Lo + LongRec(Margins).Hi;

  re_print.Font.Style     := [];
  re_print.WordWrap       := False;
  Canvas.Font.Assign(re_print.Font);
  Proporcao               := (re_print.ClientWidth - Margins - 1) / Canvas.TextWidth(Str10);//Proporcao para 10 caracteres
  print_control.QCNormal  := Trunc(Proporcao * 10);

  re_print.Font.Style     := [fsBold];
  Canvas.Font.Assign(re_print.Font);
  Proporcao               := (re_print.ClientWidth - Margins - 1) / Canvas.TextWidth(Str10);//Proporcao para 10 caracteres
  print_control.QCNegrito := Trunc(Proporcao * 10);

  print_control.QLinhas   := Trunc((re_print.ClientHeight - Margins) / (Canvas.TextHeight('3,999 UN')));

  //re_print_cab.ClientHeight := Trunc(Canvas.TextHeight('3,999 UN') * 2);

  re_print_rdp.Font.Style := [fsBold];
  Canvas.Font.Assign(re_print_rdp.Font);
  Proporcao               := (re_print_rdp.ClientWidth - Margins - 1) / Canvas.TextWidth(Str10);//Proporcao para 10 caracteres
  print_control.QCRodape  := Trunc(Proporcao * 10);
  re_print.Font.Style     := [];
  re_print.WordWrap       := True;
end;

procedure TfrmCadNFCe.print_cupom_resize(Sender: TObject);
var
  bkp: RPrint_Control;
begin
  inherited;
  if not Assigned(NFCe) then
    Exit;

  if (NFCe.EmissaoRapida) and (NFCe.dataSet.Active) and (NFCe.Itens.dataSet.Active) then
  begin
    bkp.QCNormal  := print_control.QCNormal;
    bkp.QCNegrito := print_control.QCNegrito;
    bkp.QLinhas   := print_control.QLinhas;

    print_cupom_redefinir;

    if (bkp.QCNormal  <> print_control.QCNormal) or
       (bkp.QCNegrito <> print_control.QCNegrito) or
       (bkp.QLinhas   <> print_control.QLinhas) then
    begin
      print_cupom_cabecalho_change(NFCe);
      print_cupom_rodape_change(NFCe);
      print_cupom_itens_change(NFCe);
    end;
  end;
end;

procedure TfrmCadNFCe.v2_pagamento_show;
begin
  v2_print_reset;

  grid_v2_pag_ctrl.Align  := alClient;
  pn_v2_pag_valores.Align := alClient;
  grid_v2_pag_pgtos.Align := alClient;

  grid_v2_pag_ctrl.Visible  := True;
  pn_v2_pag_valores.Visible := False;
  grid_v2_pag_pgtos.Visible := False;

  pn_v2_pag_title.Caption   := '[Enter: Selecionar] [F4: Pagamentos] [ESC: Cancelar]';

  ed_v2_pag_valores_num_aut.Visible := NFCe.ConfigNFCe.Cartao.HabCampoAdicional and
                                       (not vDadosIni.strIn(NFCe.fstr('NFE_VERSAO'), [strVerVazio, strVer310]));
  lb_v2_pag_valores_num_aut.Visible := ed_v2_pag_valores_num_aut.Visible;

  v2_panel_assign(pn_v2_pag);
end;

procedure TfrmCadNFCe.v2_panel_assign(var Sender: TPanel;
  SelectFirstControl: Boolean);
begin
  Sender.Parent               := pn_print_container;
  vDadosIni.enterTela.Enabled := True;
  if SelectFirstControl then
    THackWinControl(Sender).SelectFirst;
end;

procedure TfrmCadNFCe.v2_preparar_item_para_alterar_conf_prod(AlterarValor,
  AlterarDescricao: Boolean);
begin
  v2_form_alt_item_configura;

  ed_v2_alt_item_descricao.Enabled := AlterarDescricao;
  ed_v2_alt_item_vl_un.Enabled     := (NFCe.ConfigNFCe.Itens.Campos.ValorUnitario) or AlterarValor;
  ed_v2_alt_item_vl_tot.Enabled    := (NFCe.ConfigNFCe.Itens.Campos.ValorTotal);
  ed_v2_alt_item_desc_perc.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoPercentual) and (NFCe.fequals('desc_por_item', 'S'));
  ed_v2_alt_item_desc_val.Enabled  := (NFCe.ConfigNFCe.Itens.Campos.DescontoEmValor)    and (NFCe.fequals('desc_por_item', 'S'));
  ed_v2_alt_item_tot_liq.Enabled   := (NFCe.ConfigNFCe.Itens.Campos.ValorLiquido);
  ed_v2_alt_item_und.Enabled       := NFCe.ConfigNFCe.Itens.Campos.UnidadeVenda;

  v2_wc_nav_keydown([ed_v2_alt_item_descricao,
                     ed_v2_alt_item_qtde,
                     ed_v2_alt_item_und,
                     ed_v2_alt_item_vl_un,
                     ed_v2_alt_item_vl_tot,
                     ed_v2_alt_item_desc_perc,
                     ed_v2_alt_item_desc_val,
                     ed_v2_alt_item_tot_liq], v2_action_wc_nav_updown_keydown);

  current_to_form_alt_item;

  v2_alteracao_item_show;
end;

procedure TfrmCadNFCe.v2_print_reset;
begin
  ed_codigo_v2.Enabled                 := False;
  pn_v2_menus.Parent                   := ts_v2_menus;
  pn_v2_cupom.Parent                   := ts_v2_menus;
  pn_v2_cons_prod.Parent               := ts_v2_menus;
  pn_v2_selecao_item.Parent            := ts_v2_menus;
  pn_v2_exclusao_item.Parent           := ts_v2_menus;
  pn_v2_alteracao_item.Parent          := ts_v2_menus;
  pn_v2_desconto_item.Parent           := ts_v2_menus;
  pn_v2_cons_cliente.Parent            := ts_v2_menus;
  pn_v2_cons_cliente_selecionar.Parent := ts_v2_menus;
  pn_v2_cliente_avulso.Parent          := ts_v2_menus;
  pn_v2_valores.Parent                 := ts_v2_menus;
  pn_v2_pag.Parent                     := ts_v2_menus;
  pn_v2_selecionar_orcamento.Parent    := ts_v2_menus;
  pn_v2_sangsup.Parent                 := ts_v2_menus;
  pn_v2_movimento_operador.Parent      := ts_v2_menus;
  pn_v2_log_messages.Parent            := ts_v2_menus;
  pn_v2_log_rejeicoes.Parent           := ts_v2_menus;

  NFCe.Itens.Prod.EventoAfterScroll    := nil;
  grid_v2_cons_prod.DataSource         := nil;
end;

procedure TfrmCadNFCe.v2_sangria_suprimento_show;
begin
  v2_print_reset;

    v2_bt_nav_botao_assign([bt_v2_sangsup_salvar,
                          bt_v2_sangsup_cancela]);

  v2_wc_nav_keydown([bt_v2_sangsup_salvar,
                     bt_v2_sangsup_cancela], v2_action_wc_escape_KeyDown);

  v2_wc_nav_keydown([ed_v2_sangsup_opcao,
                     ed_v2_sangsup_valor], v2_action_wc_nav_updown_keydown);

  ed_v2_sangsup_opcao.Text  := '  1 - Sangria';
  ed_v2_sangsup_opcao.SelectAll;
  ed_v2_sangsup_valor.AsValue := 0;

  v2_panel_assign(pn_v2_sangsup);
end;

procedure TfrmCadNFCe.v2_selecao_item_show;
begin
  v2_print_reset;
//  pn_v2_selecao_item.Parent := pn_print_container;
//  if (Self.Enabled) and (Self.Visible) and (grid_v2_selecao_item.CanFocus) then
//    grid_v2_selecao_item.SetFocus;
  v2_panel_assign(pn_v2_selecao_item);
end;

procedure TfrmCadNFCe.v2_status_bar_build_cadastro;
var
  DataEmissor: TDateTime;
  barr: TStatusBar;
begin
  StatusBar1.Visible  := not TelaEmissaoRapidaAtivada;
  stsbar_nfce.Visible := TelaEmissaoRapidaAtivada;

  if StatusBar1.Visible then
    barr := StatusBar1
  else
    barr := stsbar_nfce;

//  if not TelaEmissaoRapidaAtivada then
//    Exit;

  barr.Panels.Clear;

  if NFCe.DadosCertificado.Values['Error'] <> '' then
    with barr.Panels.Add do
    begin
      Text := 'Erro leitura certificado!';
      Width := 120;
    end;

  if NFCe.DadosCertificado.Values['DataVencimento'] <> '' then
    with barr.Panels.Add do
    begin
      Text := 'Cert venc: ' + NFCe.DadosCertificado.Values['DataVencimento'];
      Width := 125;
    end;

  with barr.Panels.Add do
  begin
    Text := 'Caixa: ' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3);
    Width := 100;
  end;

  if NFCe.ConfigNFCe.MovimentoOperador.Ativo then
  begin
    if not MovOperador.dataSet.Active then
      MovOperador.GetDiaAtualDoEmissor;

    with barr.Panels.Add do
    begin
      with MovOperador.GetDiaAtualDoEmissor do
        if fnull('dia_mov') then
          Text := 'Movimento: 00/00/0000'
        else
          Text := 'Movimento: ' + FormatDateTime('dd/MM/yyyy', fdate('dia_mov'));
      Width := 140;
    end;

    with barr.Panels.Add do
    begin
      Text := 'Status: ' + IfThen(MovOperador.fnull('dia_fech'), 'Aberto', 'Fechado');
      Width := 120;
    end;
    {if MovOperador.fnull('dia_fech') then
      v2_titulo_informacao('CAIXA LIVRE')
    else
      v2_titulo_error('CAIXA FECHADO !!')};
  end
  {else
    v2_titulo_informacao('CAIXA LIVRE')};

  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    NFCe.GetDatasApi;
    with barr.Panels.Add do
    begin
      if vDadosIni.vNFConsumidor.DataApiOnline > 0 then
        Text := 'Api Online: ' + FormatDateTime('dd/MM hh:mm', vDadosIni.vNFConsumidor.DataApiOnline)
      else
        Text := 'Api Online: ';
      Width := 130;
    end;

    with barr.Panels.Add do
    begin
      if vDadosIni.vNFConsumidor.DataApiError > 0 then
        Text := 'Api Erro: ' + FormatDateTime('dd/MM hh:mm', vDadosIni.vNFConsumidor.DataApiError)
      else
        Text := 'Api Erro: ';
      Width := 120;
    end;
  end;

  with barr.Panels.Add do
  begin
    Text := 'Operador: ' + PadL(vDadosIni.vCodUsuario, 3) + ' - ' + vDadosIni.vNomeFuncionario;
    Width := 400;
  end;
end;

procedure TfrmCadNFCe.v2_status_bar_build_consulta;
begin
  if not Assigned(NFCe) then
    Exit;

  StatusBar1.Panels.Clear;

  if NFCe.DadosCertificado.Values['Error'] <> '' then
    with StatusBar1.Panels.Add do
    begin
      Text := 'Erro leitura certificado!';
      Width := 120;
    end;

  if NFCe.DadosCertificado.Values['DataVencimento'] <> '' then
    with StatusBar1.Panels.Add do
    begin
      Text := 'Cert venc: ' + NFCe.DadosCertificado.Values['DataVencimento'];
      Width := 125;
    end;

  if TextoPadraoStatusBar <> '' then
    with StatusBar1.Panels.Add do
    begin
      Text := TextoPadraoStatusBar;
      Width := 345;
    end;

//  with StatusBar1.Panels.Add do
//  begin
//    Text := panelCadastro;
//    Width := 345;
//  end;
end;

procedure TfrmCadNFCe.v2_titulo_alerta(Mensagem: string);
var
  Cor: TColor;
  FontName: string;
begin
  Cor      := clGreen;
  FontName := 'Verdana';
  if lb_descr_v2.Caption = Mensagem then
    if lb_descr_v2.Font.Color = Cor then
    begin
      Cor := clTeal;
      FontName := 'Tahoma';
    end;

  pn_descr_v2.Font.Color := Cor;
  pn_descr_v2.Font.Name  := FontName;
  v2_titulo_text(Mensagem);
end;

procedure TfrmCadNFCe.v2_titulo_alerta(Mensagem: string;
  const Args: array of const);
begin
  v2_titulo_alerta(Format(Mensagem, Args));
end;

procedure TfrmCadNFCe.v2_titulo_error(Mensagem: string);
var
  Cor: TColor;
  FontName: string;
begin
  Cor := clRed;
  FontName := 'Verdana';
  if lb_descr_v2.Caption = Mensagem then
    if lb_descr_v2.Font.Color = clRed then
    begin
      Cor      := clMaroon;
      FontName := 'Tahoma';
    end;

  pn_descr_v2.Font.Color := Cor;
  pn_descr_v2.Font.Name  := FontName;
  v2_titulo_text(Mensagem);
end;

procedure TfrmCadNFCe.v2_titulo_informacao(Mensagem: string);
var
  Cor: TColor;
  FontName: string;
begin
  Cor      := clNavy;
  FontName := 'Verdana';
  if lb_descr_v2.Caption = Mensagem then
    if lb_descr_v2.Font.Color = Cor then
    begin
      Cor := clPurple;
      FontName := 'Tahoma';
    end;

  pn_descr_v2.Font.Color := Cor;
  pn_descr_v2.Font.Name  := FontName;
  v2_titulo_text(Mensagem);
end;

procedure TfrmCadNFCe.v2_titulo_text(Mensagem: string);
var
  Prop: Double;

begin
  Canvas.Font.Assign(lb_descr_v2.Font);
  Prop := Canvas.TextWidth(Mensagem) / lb_descr_v2.Width;
  pn_descr_v2.Hint := FloatToStr(Prop);
  if Prop > 1 then
  begin
//    Mensagem := '[*F2->7]' + StringReplace(Mensagem, sLineBreak, ' ', [rfReplaceAll]);
    lb_descr_v2.WordWrap  := False;
    lb_descr_v2.Alignment := taLeftJustify;
  end
  else
  begin
    lb_descr_v2.WordWrap  := True;
    lb_descr_v2.Alignment := taCenter;
  end;
  lb_descr_v2.Caption := StringReplace(Mensagem, sLineBreak, ' ', [rfReplaceAll]);//Mensagem;
end;

procedure TfrmCadNFCe.v2_valores_nf_show;
begin
  v2_print_reset;

  v2_bt_nav_botao_assign([bt_v2_valores_salvar,
                          bt_v2_valores_cancela]);
  v2_wc_nav_keydown([bt_v2_valores_salvar,
                     bt_v2_valores_cancela], v2_action_wc_escape_KeyDown);

  v2_wc_nav_keydown([ed_v2_valores_vprod,
                     ed_v2_valores_vdesc,
                     ed_v2_valores_vseg,
                     ed_v2_valores_voutro,
                     ed_v2_valores_vnf], v2_action_wc_nav_updown_keydown);

  currtot.vprod  := NFCe.ffloat('vprod');
  currtot.vdesc  := NFCe.ffloat('vdesc');
  currtot.vfrete := NFCe.ffloat('vfrete');
  currtot.vseg   := NFCe.ffloat('vseg');
  currtot.voutro := NFCe.ffloat('voutro');
  currtot.vnf    := NFCe.ffloat('vnf');

  currtot_to_form_valores;

  ed_v2_valores_vdesc.Enabled  := NFCe.fdif('desc_por_item', 'S');
  ed_v2_valores_tipodesc.Text  := IfThen(ed_v2_valores_vdesc.Enabled, '2 - No Total', '1 - Por item');

  v2_panel_assign(pn_v2_valores);
end;

procedure TfrmCadNFCe.v2_vendedor_show;
begin
  v2_print_reset;

  ed_v2_codvendedor.Text := NFCe.fstr('cod_vendedor');

  ed_v2_codvendedorChange(ed_v2_codvendedor);
  {
  try
    NFCe.lkVendedor.dataSet.Filter := 'cod_vendedor = ' + IntToStr(NFCe.fint('cod_vendedor'));
    NFCe.lkVendedor.dataSet.Filtered := True;
    if NFCe.lkVendedor.dataSet.FieldByName('nome_vendedor').AsString = '' then
    begin
      pn_v2_nomevendedor.Caption := 'Colaborador não encontrado ou não é vendedor';
      ed_v2_codvendedor.Text := 0;
    end
    else
    begin
      pn_v2_nomevendedor.Caption := NFCe.lkVendedor.dataSet.FieldByName('nome_vendedor').AsString;
      ed_v2_codvendedor.Text := NFCe.fstr('cod_vendedor');
    end;
  finally
    NFCe.lkVendedor.dataSet.Filtered := False;
    NFCe.lkVendedor.dataSet.Filter := '';
  end;                            }

  v2_panel_assign(pn_v2_vendedor);
end;

procedure TfrmCadNFCe.v2_wc_click(WinControl: TWinControl; Event: TNotifyEvent);
begin
  THackWinControl(WinControl).OnClick := Event;
end;

procedure TfrmCadNFCe.v2_wc_nav_keydown(WinControls: array of TWinControl;
  Event: TKeyEvent);
var
  I: Integer;
begin
  for I := Low(WinControls) to High(WinControls) do
    THackWinControl(WinControls[I]).OnKeyDown := Event;
end;

procedure TfrmCadNFCe.vendas_sem_emit_data_change(Sender: TObject);
begin
  lb_vnd_sem_emit_data.Caption := FormatDateTime('dd/MM/yyyy', VendasSemEmit.Dia);
  sp_vnd_sem_emit_isentos.Font.Style := [];
  sp_vnd_sem_emit_conrib.Font.Style  := [];
  sp_vnd_sem_emit_diatual.Font.Style := [];

  if VendasSemEmit.TipoDest = tdNaoContribuinte then
  begin
    sp_vnd_sem_emit_isentos.Font.Style := [fsBold];
    sp_vnd_sem_emit_conrib.Font.Style  := [];
  end
  else
  begin
    sp_vnd_sem_emit_isentos.Font.Style := [];
    sp_vnd_sem_emit_conrib.Font.Style  := [fsBold];
  end;
  if FormatDateTime('dd/MM/yyyy', Date) = lb_vnd_sem_emit_data.Caption then
    sp_vnd_sem_emit_diatual.Font.Style := [fsBold];
end;

procedure TfrmCadNFCe.print_cupom_rodape_change(Sender: TObject);
var
  S1, S2, S3, S4: string;
  Q1, Q2, Q3: Integer;
  D, A: Double;
begin

  if NFCe.Itens.dataSet.RecordCount = 0 then
  begin
    re_print_rdp.Visible         := False;
    re_print_rdp_padding.Visible := False;
    Exit;
  end;

  re_print_rdp.Lines.Clear;
  re_print_rdp_padding.Visible := True;
  re_print_rdp.Visible         := True;
  re_print_rdp_padding.Top     := 0;

  //s1 = total
  //s2 = desconto
  //s3 = acrescimos
  //s4 = subtotal 

  A  := NFCe.ffloat('vfrete') + NFCe.ffloat('voutro') + NFCe.ffloat('vseg');
  D  := NFCe.ffloat('vdesc');

  S1 := StrNumber(NFCe.ffloat('vprod'));    
  S3 := IfThen(A > 0, ' + ' + StrNumber(A));
  S2 := IfThen(D > 0, ' - ' + StrNumber(D));
  S4 := ' TOTAL ' + StrNumber(NFCe.ffloat('vnf'));

  Q3 := Length(S4);//tamanho sublinahdo

  while (Length(S1 + S2 + S3 + S4) + 1{final alinhamento}) > print_control.QCRodape do
  begin
    if S1 <> '' then
      S1 := ''
    else if (S2 <> '')  or (S3 <> '') then
    begin
      S2 := '';
      S3 := '';
    end
    else
      Break;
  end;

  if (S2 = '') and (S3 = '') then
    S1 := ''
  else
    S1 := S1 + S2 + S3;

  Q2 := Length(S4);
  Q1 := print_control.QCRodape - Q2;
  re_print_rdp.DefAttributes.Style := [fsBold];
  re_print_rdp.Lines.Add(PadR('', print_control.QCRodape - Q3 - 1) + PadR('_', Q3, '_'));
  re_print_rdp.DefAttributes.Style := [fsBold];
  re_print_rdp.Lines.Add(PadR(S1, Q1 - 1) + S4);//PadL( S2 + ' ', print_control.QCRodape - Length(S1)));

  Canvas.Font.Assign(re_print_rdp.Font);
  re_print_rdp.ClientHeight := Trunc((Canvas.TextHeight('3,999 UN') + 3) * (re_print_rdp.Lines.Count));
end;

procedure TfrmCadNFCe.print_cupom_itens_change(Sender: TObject);
var
  Linha1, Linha2, Linha3: string;
  T1e2, T3, StartIndex, CapacidadeProd: Integer;
  SitTrib, StrCodigo, StrProduto: string;
begin
  re_print.Lines.Clear;
  if (NFCe.Itens.dataSet.RecordCount = 0) or (not NFCe.Itens.dataSet.Active) then
    Exit;

  T1e2 := Trunc(print_control.QCNegrito / 3);
  T3   := print_control.QCNegrito - (T1e2 * 2);

  if (NFCe.Itens.dataSet.RecordCount * 3) <= print_control.QLinhas  then
    CapacidadeProd := NFCe.Itens.dataSet.RecordCount
  else
    CapacidadeProd := Trunc( print_control.QLinhas / 3) + 1;

  StartIndex := Trunc(NFCe.Itens.dataSet.RecordCount - CapacidadeProd);
  StartIndex := IfThen(StartIndex < 0, 0, StartIndex);

  re_print.SelAttributes.Color := clWindowText;
 
  NFCe.Itens.prepare_loop('nitem >= ' + IntToStr(StartIndex + 1));
  try
    while not NFCe.Itens.dataSet.Eof do
    begin
      if not NFCe.Itens.str_empty('ICM_CSOSN') then
        SitTrib := NFCe.Itens.fstr('ICM_CSOSN')
      else
        SitTrib := NFCe.Itens.fstr('ICM_CST');

      if not NFCe.Itens.str_empty('ICM_CSOSN') then
        SitTrib := IfThen(IndexStr(SitTrib, ['101', '102', '201', '202' ]) >= 0, 'T',
                                   IfThen(IndexStr(SitTrib, ['103', '203', '300' ]) >= 0, 'I',
                                                       IfThen(IndexStr(SitTrib, ['400']) >= 0, 'N',
                                                              'F')))
      else
        SitTrib := IfThen(IndexStr(SitTrib, ['00', '10', '20', '70' ]) >= 0, 'T',
                                   IfThen(IndexStr(SitTrib, ['30', '40', '50', '51']) >= 0, 'I',
                                                       IfThen(IndexStr(SitTrib, ['41']) >= 0, 'N',
                                                              'F')));
      StrCodigo := IfThen(NFCe.Itens.str_empty('cean'), NFCe.Itens.fstr('num_fab_prod'), NFCe.Itens.fstr('cean'));

      Linha1 := ' ' + PadL(NFCe.Itens.fint('nitem'), 3) + ' ' + StrCodigo + ' ' + NFCe.Itens.fstr('xprod');//, 1, print_control.QCNormal);
      Linha2 := PadL(StrNumber(NFCe.Itens.ffloat('qvnd'  ), csdQtde) + ' ' + NFCe.Itens.ftext('uvnd'), T1e2) +
                PadL(StrNumber(NFCe.Itens.ffloat('vvnd'), csdVrUn) + ' ' + SitTrib                , T1e2) +
                PadL(StrNumber(NFCe.Itens.ffloat('vprod' )) + ' ', T3);//,  Integer(print_control.QCNegrito - (2 * TamanhoN))), 1, print_control.QCNegrito);
      if NFCe.fdif('desc_por_item', 'S') or (NFCe.Itens.ffloat('vdesc') = 0) then
        Linha3 := ''
      else
        Linha3 := PadL('desconto', T1e2) +
                  PadL(StrNumber(NFCe.Itens.ffloat('vdesc'), csdVrUn) + '  ', T1e2) +
                  PadL(StrNumber(NFCe.Itens.ffloat('vprod') - NFCe.Itens.ffloat('vdesc')) + ' ', T3);//,  Integer(print_control.QCNegrito -

      if re_print.Lines.Count > 0 then
      begin
        re_print.SelAttributes.Style := [];
        re_print.Lines.Add('');
      end;
      re_print.SelAttributes.Style := [];
      re_print.Lines.Add(Linha1);
      re_print.SelAttributes.Style := [fsBold];
      re_print.Lines.Add(Linha2);

      if Linha3 <> '' then
      begin
        re_print.SelAttributes.Style := [fsBold];
        re_print.Lines.Add(Linha3);
      end;

      NFCe.Itens.dataSet.Next;
    end;
    if NFCe.fequals('situacao_nfce', sitRejeitada) then
    begin
      re_print.SelAttributes.Style := [fsBold];
      re_print.SelAttributes.Color := clRed;
      re_print.Lines.Add(NFCe.fstr('msgretorno'));
      if ContainsText(NFCe.fstr('msgretorno'), 'NFCe já rejeitada e sem correções para enviar novamente') then
        re_print.Lines.Add(NFCe.fstr('xmotivo'));
      re_print.SelAttributes.Color := clWindowText;
    end
    else if ed_v2_log_rejeicoes.Lines.Count > 0 then
    begin
      re_print.SelAttributes.Style := [fsBold];
      re_print.SelAttributes.Color := clRed;
      re_print.Lines.Add('*** Qtde Rejeições: ' + IntToStr(ed_v2_log_rejeicoes.Lines.Count) + ' ***');
      re_print.SelAttributes.Color := clWindowText;
    end
    else
      re_print.SelAttributes.Color := clWindowText;

    if (print_control.QLinhas > 0) and (re_print.Lines.Count > 0) then
      while re_print.Lines.Count > print_control.QLinhas do
        re_print.Lines.Delete(0);
  finally
    NFCe.Itens.prepare_loop_done;
  end;
end;

procedure TfrmCadNFCe.nfce_v2_log_rejeicao(Sender: TObject);
begin
  if Trim(NFCe.LastRejeicao) <> '' then
  begin
    ed_rejeicoes.Lines.Add(NFCe.LastRejeicao);
    ed_v2_log_rejeicoes.Lines.Add(NFCe.LastRejeicao);
  end;
end;

function TfrmCadNFCe.nfce_check_Emissao_rapida: Boolean;
begin
  Result := PageControl1.ActivePage = ts_nfce_v2;
end;

procedure TfrmCadNFCe.nfce_v2_alterar(Sender: TObject);
begin
  PageControl1.ActivePage := ts_nfce_v2;

  nfce_v2_change_imagem_prod(nil);

  if not NFCe.Edit then
    exit;

  montarComponentes;

  print_cupom_redefinir;
  print_cupom_cabecalho_change(Sender);
  print_cupom_rodape_change(Sender);
  print_cupom_itens_change(Sender);

  with NFCe.ValidacaoQualquerAlteracao do
    if not Permitido then
      v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')])
    else if NFCe.Pagamento.ValorTotal > 0 then
    begin
      v2_pagamento_show;
      if NFCe.Pagamento.PagamentoConcluido then
        v2_titulo_alerta('[F11 - Finalizar] - Pagamento Concluído')
      else
        v2_titulo_alerta('Pagamento Pendente');
    end
    else if NFCe.Itens.dataSet.RecordCount > 0 then
    begin
      NFCe.Itens.dataSet.Last;
      current_from_item;
      current_to_form_cupom;
    end
    else
      v2_titulo_alerta('Venda em andamento');          

  if (Self.Enabled) and (Self.Visible) and (ed_codigo_v2.CanFocus) then
    ed_codigo_v2.SetFocus;
end;

procedure TfrmCadNFCe.nfce_v2_change_imagem_prod(Sender: TObject);
var
  FileName: string;
begin
  if not Assigned(Sender) then
    FileName := NFCe.Itens.Prod.ImagemProd.FileLogo
  else
    FileName := NFCe.Itens.Prod.ImagemProd.FileName;

  if FileName <> '' then
    img_prod.Picture.LoadFromFile(FileName);
end;

procedure TfrmCadNFCe.nfce_v2_log_message(Sender: TObject);
var
  I: Integer;
begin
  if NFCe.LastMessageType = 'Erro' then
    v2_titulo_error(NFCe.LastMessage)
  else
    v2_titulo_alerta(NFCe.LastMessage);

  ed_v2_log_messages.Lines.Add(PadR('-', 48, '-'));
  ed_v2_log_messages.Lines.Add(Format('%s - %s', [NFCe.LastMessageType, NFCe.LastMessage]));
  if ed_v2_log_messages.Lines.Count > 1000 then
    for I := 0 to 50 do
       ed_v2_log_messages.Lines.Delete(I);
end;

procedure TfrmCadNFCe.nfce_v2_novo(Sender: TObject);
var
  Continuar: Boolean;
begin
  if not vDadosIni.PesqPros('NFC028', 'HABILITAR', '',
      'NFCE', '', NFCe.buscas) then
    exit;

  nfce_v2_change_imagem_prod(nil);

  NFCe.Cancel;
  NFCe.CancelUpdates;
  NFCe.Itens.Cancel;
  NFCe.Itens.CancelUpdates;
  NFCe.Pagamento.Cancel;
  NFCe.Pagamento.CancelUpdates;
  NFCe.Dest.Cancel;
  NFCe.Dest.CancelUpdates;
  NFCe.RollBackTransacao;

  with NFCe.PendenciasVerificar do
    if not Permitido then
    begin
      ShowAtencao(Mensagem, MB_ICONEXCLAMATION);
      bt_v2_menu_consulta_nfce.Click;
      Exit;
    end;

  PageControl1.ActivePage := ts_nfce_v2;

  {$REGION 'validando movimento, caso nao permitido apenas a mensagem fica disponivel'}
  //talvez desabilitar os botoes em algum evento assim que valida a permissao

  if NFCe.ConfigNFCe.MovimentoOperador.Ativo then
    if not MovOperador.PermiteEmissao(0) then
    begin
      NFCe.AbreRegistros(0, True);

      current_reset;
      current_to_form_cupom;

      v2_status_bar_build_cadastro;

      v2_cupom_show;

      v2_titulo_error(MovOperador.LastMessage);

      Exit;
    end;

  {$ENDREGION}


  if not NFCe.Insert then
    Exit;

  montarComponentes;

  print_cupom_redefinir;
  print_cupom_cabecalho_change(Sender);
  print_cupom_rodape_change(Sender);
  print_cupom_itens_change(Sender);

  v2_cupom_show;

  {
  with NFCe.PendenciasVerificar do
    if not Permitido then
    begin
      re_print.WordWrap   := True;
      re_print.Font.Style := [];
//      Canvas.Font.Assign(re_print.Font);
      re_print.DefAttributes.Style := [];
//      re_print.Lines.Add(Linha1);
      re_print.Text       := Mensagem;
//      re_print.Lines.Add(Mensagem)
    end;
    }
end;

procedure TfrmCadNFCe.PageControl1Change(Sender: TObject);
begin
  inherited;
  NFCe.EmissaoRapida := PageControl1.ActivePage = ts_nfce_v2;
end;

procedure TfrmCadNFCe.pageDadosNFCeChange(Sender: TObject);
begin
  inherited;
  if pageDadosNFCe.ActivePage.Name = tsCabecalho.Name then
  begin
    ComboBoxOpInternasFrame1.Visible := not NFCe.fnull('dfe_trib_ignorar') and (YesNoEnum(NFCe.fint('dfe_trib_ignorar')) = ynNo);
    edNaturezaOperacao.Visible := not ComboBoxOpInternasFrame1.Visible;
    lbOperacao.Caption := IfThen(edNaturezaOperacao.Visible, 'Natureza de Operação', 'Operação Interna');

    if ComboBoxOpInternasFrame1.Visible then
      ComboBoxOpInternasFrame1.Setup( TSetupComboBoxOpInternasFrame.Create(
        NFCe.fstr('op_interna_id'), False, True
      ));
  end;  
end;

procedure TfrmCadNFCe.pageDadosNFCeDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  inherited;

  if not pageDadosNFCe.Pages[TabIndex].TabVisible then
    Exit;

  if TabIndex = ts_rejeicoes_mensagens.PageIndex then
  begin
    if ed_rejeicoes.Lines.Count <= 0 then
       Control.Canvas.Font.Color := clWindowText
    else
       Control.Canvas.Font.Color := clRed;
       
    pageDadosNFCe.Canvas.FillRect(Rect);
    Control.Canvas.TextOut(Rect.left + 5, Rect.top + 3, pageDadosNFCe.Pages[TabIndex].Caption);
    // pinta a parte interna (tabsheet)
    //pageDadosNFCe.Pages[TabIndex].brush.Color := Control.Canvas.brush.Color;
    pageDadosNFCe.Pages[TabIndex].Repaint;

  end
  else
  begin
    pageDadosNFCe.Canvas.FillRect(Rect);
    Control.Canvas.TextOut(Rect.left + 5, Rect.top + 3, pageDadosNFCe.Pages[TabIndex].Caption);
  end;
end;

procedure TfrmCadNFCe.pnDadosPagamentoExit(Sender: TObject);
begin
  inherited;
  if btCancelaPagamento.Visible then
    btCancelaPagamento.Click;
end;

procedure TfrmCadNFCe.pn_v2Enter(Sender: TObject);
begin
  inherited;
  pn_v2_cupom.OnResize := print_cupom_resize;
end;

procedure TfrmCadNFCe.POSVirtual1Click(Sender: TObject);
begin
  inherited;

  if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
  begin
    Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
    Exit;
  end;

  if not vDadosIni.PesqPros('POSV003', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', NFCe.buscas, True) then
    Exit;
  try
    vDadosIni.abreHistoricoTransacoesPOSVirtual;
  finally
  end;
end;

procedure TfrmCadNFCe.ReabirNFCparaCorrees1Click(Sender: TObject);
begin
  inherited;
  NFCe.ReabrirNFC;
  montarComponentes;
end;

procedure TfrmCadNFCe.Panel15Enter(Sender: TObject);
begin
  inherited;
  DBCheckBox1.OnClick := DBEdit51Exit;
  DBCheckBox1.OnExit  := DBEdit51Exit;
end;

procedure TfrmCadNFCe.Panel18Exit(Sender: TObject);
begin
  inherited;
  pn01Fechamento.TabOrder := 0;
end;

procedure TfrmCadNFCe.pnMenuClick(Sender: TObject);
var
  vPointer: TPoint;
begin
  inherited;
  GetCursorPos(vPointer);
  PopupMenu3.Popup(vPointer.X, vPointer.Y);
end;

procedure TfrmCadNFCe.Panel4Exit(Sender: TObject);
begin
  inherited;
  
  DBCheckBox1.OnClick := nil;
  DBCheckBox1.OnExit  := nil;

  if NFCe.HouveAlteracao() then
    NFCe.SalvarECalcular(True);
end;

procedure TfrmCadNFCe.PanelLeft_Enter(Sender: TObject);
begin
  TForm(PanelLeft.Parent).OnKeyDown := frmCadNFCe.FormKeyDown;
//  if NFCe.ConfigNFCe.Pedido.AutorizarComPgtoAuto and ((nfce.Pagamento.ValorTotal > 0) and (NFCe.Pagamento.PagamentoConcluido)) then
//    timerAutorizarAuto.Enabled := True;
end;

procedure TfrmCadNFCe.pn01CodDescricaoExit(Sender: TObject);
begin
  inherited;
  if btCancelarItem.Visible then
    btCancelarItem.Click;
end;

procedure TfrmCadNFCe.btDescontoCabecalhoHabilitarClick(Sender: TObject);
begin
  inherited;
  NFCe.SetDescontoNoCabecalho(True);
  edDescontoTotal.Enabled := not (NFCe.dataSet.FieldByName('DESC_POR_ITEM').AsString = 'S');
  btDescontoCabecalhoHabilitar.Visible := not edDescontoTotal.Enabled;
  btDescontoCabecalhoDesabilitar.Visible := edDescontoTotal.Enabled; 
  edDescP.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoPercentual) and (NFCe.dataSet.FieldByName('desc_por_item').AsString = 'S');
  edDescR.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoEmValor)    and (NFCe.dataSet.FieldByName('desc_por_item').AsString = 'S');
end;

procedure TfrmCadNFCe.SalvarXML(AXML, AFileName: string);
var
  AFileXML: TStrings;
begin
  if Trim(AXML) = '' then
  begin
    vDadosIni.ShowErro('XML vazio ou inexistente');
    Exit;
  end;
  SaveDialog1.FileName := AFileName;
  if not SaveDialog1.Execute then
    Exit;

  AFileXML := TStringList.Create;
  try
    AFileXML.Text := AXML;
    AFileXML.SaveToFile(SaveDialog1.FileName);
  finally
    FreeAndNil(AFileXML);
  end;
end;

procedure TfrmCadNFCe.SelecionarImpressoraPadrao1Click(Sender: TObject);
var
  Impressora: string;
begin
  inherited;
  //
  if not Assigned(DLLNFC) then
    DLLNFC := TNFCe_DLL.create;

  DLLNFC.LoadDLL;
  listGrid.Items.Text := DLLNFC.nfce_print_list;
  form_memo_botoes_ok_voltar_habilitar();

  Impressora := NFCe.ObterImpressoraPadrao;
  if listGrid.Items.IndexOf(Impressora) > -1 then
    listGrid.ItemIndex := listGrid.Items.IndexOf(Impressora);

  if vDadosIni.abreForm('Seleção da Impressora', pnMemo, opFormsDefCadEsc) then
  begin
    if listGrid.ItemIndex > -1 then
      NFCe.ConfigurarImpressoraPadrao(listGrid.Items[listGrid.ItemIndex]);
  end;

  form_memo_botoes_restore;
end;

procedure TfrmCadNFCe.service_less_timer(Sender: TObject);
begin
  if (Trim(vDadosIni.vNFConsumidor.token) <> '') and
     ((not vDadosIni.vNFConsumidor.UsaServidorAutorizacao) or
      (vDadosIni.vNFConsumidor.NFCeOffline = noClient))
    then
      vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'HWNFCServiceLess.exe ' +
        Format('LESS cnpj=%s empresaId=%d caixaId=%d', [vDadosIni.vEmp.vCNPJ, vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor]));
end;

procedure TfrmCadNFCe.ServioWindows1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadNFCe_ConfService, frmCadNFCe_ConfService);
  frmCadNFCe_ConfService.ShowModal;
end;

procedure TfrmCadNFCe.current_reset;
begin
  current.Alteracao := False;
  current.Error     := '';
  current.Codigo    := '';
  current.Descricao := '';
  current.Unidade   := '';
  current.Qtde      := 0;
  current.ValorUn   := 0;
  current.ValorTot  := 0;
  current.ValorDes  := 0;
  current.PercDes   := 0;
  current.ValorLiq  := 0;
  current.Fator     := 0;
end;

function TfrmCadNFCe.current_setproduto: Boolean;
var
  IdNFCe: Integer;
  payload: TSetProdutoInput;
begin
  nfce_v2_change_imagem_prod(NFCe.Itens.Prod.ImagemProd);

  IdNFCe := NFCe.fint('cod_nfce');

  payload := TSetProdutoInput.Create;
  payload.Alteracao := current.Alteracao;
  payload.Codigo := current.Codigo;
  payload.Descricao := current.Descricao;

  payload.UndVenda := current.Unidade;
  payload.UndFator := current.Fator;

  payload.QtdeVenda := current.Qtde;
  payload.ValorUnVnd := current.ValorUn;
  payload.ValorTot := current.ValorTot;
  payload.Desconto := current.ValorDes;

//  Result := NFCe.Itens.SetProduto(current.Alteracao, current.Codigo, current.Descricao, current.Qtde, current.ValorUn, current.ValorTot, current.ValorDes);
  Result := NFCe.Itens.SetProduto(payload);

  payload.Free;

  if Result and (not current.Alteracao) then
  begin
    if current.AplicaDes.Modalidade = adProximoItem then
      current_desconto_modalidade_reset
    else if current.AplicaDes.Modalidade = adNFCeAtual then
    begin
      if IdNFCe = 0 then
        current.AplicaDes.IdNFCe := NFCe.fint('cod_nfce');
    end;
  end;
end;

procedure TfrmCadNFCe.current_to_form_alt_item;
begin
  ed_v2_alt_item_codigo.Text       := current.Codigo;
  ed_v2_alt_item_descricao.Text    := current.Descricao;
  ed_v2_alt_item_qtde.AsValue      := current.Qtde;
  ed_v2_alt_item_vl_un.AsValue     := current.ValorUn;
  ed_v2_alt_item_vl_tot.AsValue    := current.ValorTot;
  ed_v2_alt_item_desc_val.AsValue  := current.ValorDes;
  ed_v2_alt_item_desc_perc.AsValue := current.PercDes;
  ed_v2_alt_item_tot_liq.AsValue   := current.ValorLiq;
end;

procedure TfrmCadNFCe.current_to_form_cupom;
begin
 	ed_qtde_v2.Caption  := StrNumber(current.Qtde   , csdQtde);
  ed_vlun_v2.Caption  := StrNumber(current.ValorUn, csdVrUn);
  ed_vltot_v2.Caption := StrNumber(current.ValorTot);
  v2_titulo_informacao(current.Descricao);
end;

procedure TfrmCadNFCe.currpag_from_form_pagamento;
begin
  currpag.Valor          := ed_v2_pag_valores_valor.AsValue;
  currpag.NumAutorizacao := ed_v2_pag_valores_num_aut.Text;
  currpag.Bandeira       := IfThen(ed_v2_pag_valores_band.Visible, StrToIntDef(ed_v2_pag_valores_band.Text[2], 0));
  currpag.IndPag         := IfThen(ed_v2_pag_valores_indpag.Visible, ed_v2_pag_valores_indpag.Text[2], '0');
end;

procedure TfrmCadNFCe.currpag_from_pagamento;
begin
  currpag.Alteracao      := True;
  currpag.Valor          := NFCe.Pagamento.ffloat('vpag');
  currpag.IndPag         := NFCe.Pagamento.fstr('indpag');
  currpag.NumAutorizacao := NFCe.Pagamento.fstr('caut');
  currpag.Bandeira       := NFCe.Pagamento.fint('tband');
end;

procedure TfrmCadNFCe.currpag_reset;
begin
  currpag.Alteracao      := False;
  currpag.Valor          := 0;
  currpag.IndPag         := '';
  currpag.NumAutorizacao := '';
  currpag.Bandeira       := 0;
end;

procedure TfrmCadNFCe.currpag_to_form_pagamento;
var
  Key: Char;
begin

  ed_v2_pag_valores_valor.AsValue := currpag.Valor;
  ed_v2_pag_valores_num_aut.Text  := currpag.NumAutorizacao;

  Key := IntToStr(currpag.Bandeira)[1];
  ed_v2_pag_valores_bandKeyPress(ed_v2_pag_valores_band,  Key);

  Key := IfThen(Trim(currpag.IndPag) = '', '0', currpag.IndPag)[1];
  ed_v2_pag_valores_indpagKeyPress(ed_v2_pag_valores_indpag, Key);
end;

procedure TfrmCadNFCe.currtot_to_form_valores;
begin
  ed_v2_valores_vprod.AsValue  := currtot.vprod;
  ed_v2_valores_vdesc.AsValue  := currtot.vdesc;
  ed_v2_valores_vseg.AsValue   := currtot.vseg;
  ed_v2_valores_voutro.AsValue := currtot.voutro;
  ed_v2_valores_vnf.AsValue    := currtot.vnf;
end;

function TfrmCadNFCe.current_calc_use_desc_perc(Value: Double): Boolean;
begin
  Result := False;
  if Value < 0 then
    Exit;
  current.Qtde     := RoundTo(current.Qtde   , 0 - csdQtde);
  current.ValorUn  := RoundTo(current.ValorUn, 0 - csdVrUn);
  current.ValorTot := RoundTo(current.Qtde * current.ValorUn, -2);

  Value := RoundTo(IfThen(Value > 0, Value * current.ValorTot / 100), -2);
  Result := current_calc_use_desc_val(Value);

//  current.ValorDes := RoundTo(IfThen(Value > 0, Value * current.ValorTot / 100), -2);
//  current.ValorLiq := current.ValorTot - current.ValorDes;
end;

function TfrmCadNFCe.current_calc_use_desc_val(Value: Double): Boolean;
begin
  Result := False;
  if Value < 0 then
    Exit;
  current.Qtde     := RoundTo(current.Qtde   , 0 - csdQtde);
  current.ValorUn  := RoundTo(current.ValorUn, 0 - csdVrUn);
  current.ValorTot := RoundTo(current.Qtde * current.ValorUn, -2);
  current.ValorDes := Value;
  current.PercDes  := RoundTo(IfThen(current.ValorTot > 0, current.ValorDes / current.ValorTot * 100), -6);
  current.ValorLiq := current.ValorTot - current.ValorDes;
  Result := True;
end;

function TfrmCadNFCe.current_calc_use_qtde(Value: Double): Boolean;
begin
  Result := False;
  Value := RoundTo(Value, 0 - csdQtde);
  if Value < 0 then
    Exit;
  current.Qtde := Value;
  Result       := current_calc_use_desc_perc(current.PercDes);
end;

function TfrmCadNFCe.current_calc_use_tot_liq(Value: Double): Boolean;
begin
  Result := False;
  if Value <= 0 then
    Exit;
  if Value > current.ValorTot then
    Value := current.ValorTot;

  Value  := current.ValorTot - Value;
  Result := current_calc_use_desc_val(current.ValorDes);

//  current.ValorDes := current.ValorTot - Value;
//  current_calc_use_desc_val;
end;

function TfrmCadNFCe.current_calc_use_unid(oldIdx, newIdx: Integer): Boolean;
var
  undVenda: TUnidadeVenda_Model;
  vlPrincipal: Double;
begin
  inherited;

  undVenda := (current.UndsVnd.Objects[oldIdx] as TUnidadeVenda_Model);
  vlPrincipal := current.ValorTot * undVenda.fator;

  undVenda := (current.UndsVnd.Objects[newIdx] as TUnidadeVenda_Model);
  current.ValorTot := vlPrincipal / undVenda.fator;
  current.ValorUn  := current.ValorTot / current.Qtde;
  current.Unidade  := undVenda.unid_vnd;
  current.Fator    := undVenda.fator;

  // esse result tá furado
  Result           := current_calc_use_desc_perc(current.PercDes);

end;

function TfrmCadNFCe.current_calc_use_vl_tot(Value: Double): Boolean;
begin
  Result := False;
  RoundTo(Value, -2);
  if Value < 0 then
    Exit;
  current.ValorTot:= Value;
  current.ValorUn := current.ValorTot / current.Qtde;
  Result          := current_calc_use_desc_perc(current.PercDes);
end;

function TfrmCadNFCe.current_calc_use_vl_un(Value: Double): Boolean;
begin
  Result := False;
  RoundTo(Value, 0 - csdVrUn);
  if Value < 0 then
    Exit;
  current.ValorUn := Value;
  Result          := current_calc_use_desc_perc(current.PercDes);
end;

procedure TfrmCadNFCe.current_desconto_modalidade_reset;
begin
  current.AplicaDes.Modalidade := adProximoItem;
  current.AplicaDes.Percentual := 0;
  current.AplicaDes.Valor      := 0;
  current.AplicaDes.IdNFCe     := 0;
end;

procedure TfrmCadNFCe.current_from_form_alt_item;
begin
  current.Descricao := ed_v2_alt_item_descricao.Text;
  current.Qtde      := ed_v2_alt_item_qtde.AsValue;
  current.ValorUn   := ed_v2_alt_item_vl_un.AsValue;
  current.ValorTot  := ed_v2_alt_item_vl_tot.AsValue;
  current.ValorDes  := ed_v2_alt_item_desc_val.AsValue;
  // nao precisa setar codigo, pois nao será alterado,
  // não precisa setar o perc desc e valor liquido pos nao tem campo no banco para alterar
end;

procedure TfrmCadNFCe.current_from_item;
begin                    
  current.Alteracao := True;
  current.Error     := '';
  current.Codigo    := NFCe.Itens.fstr('num_fab_prod');
  current.Descricao := NFCe.Itens.fstr('xprod');
  current.Unidade   := NFCe.Itens.fstr('uvnd');
  current.Qtde      := NFCe.Itens.ffloat('qvnd');
  current.ValorUn   := NFCe.Itens.ffloat('vvnd');
  current.ValorTot  := NFCe.Itens.ffloat('vprod');
  current.ValorDes  := NFCe.Itens.ffloat('vdesc');
  current.Fator     := NFCe.Itens.ffloat('uvnd_fator');
  current.UndsVnd   := NFCe.Itens.UndVenda;

  current_calc_use_desc_val(current.ValorDes);
end;

function TfrmCadNFCe.current_from_select_prod: Boolean;
var
  undVenda: TUnidadeVenda_Model;
  Config: TConfig_sistema_class;
begin
  Result := False;

  if NFCe.Itens.Prod.dataSet.IsEmpty then
    Exit;

  try

    with NFCe.Itens.Prod do
    begin
    	try
      	Config := TConfig_sistema_class.getConf('ped_vnd_identificacao_produto', buscas, vDadosIni.cod_empresa);

        if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'NUMEROFABRICANTE') then
        	current.Codigo := fstr('num_fab_prod')
        else if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'GRUPOCODIGO') then
        	current.Codigo := IntToStr(fint('grupo_prod')) + fstr('cod_prod')
        else if (trim(UpperCase(Config.ReadString('Conf', 'Identificar'))) = 'CODIGO') then
        	current.Codigo := fstr('cod_prod')
        else
	      	current.Codigo := IfThen(str_empty('cod_barra'), fstr('num_fab_prod'), fstr('cod_barra'));
      finally
        if Assigned(Config) then
        	FreeAndNil(Config);
      end;
    end;

    current.Descricao := IfThen((NFCe.ConfigNFCe.Itens.DescricaoReduzida) and (not NFCe.Itens.Prod.str_empty('descr_prod_red')),
                              NFCe.Itens.Prod.fstr('descr_prod_red'),
                              NFCe.Itens.Prod.fstr('descr_prod')) +
                              IfThen(NFCe.Itens.Prod.fint('cod_grade') > 0,
                                     IfThen(NFCe.ConfigNFCe.Itens.Grades.CaracterSeparador <> '', NFCe.ConfigNFCe.Itens.Grades.CaracterSeparador, '-') +
                                     IfThen(NFCe.ConfigNFCe.Itens.Grades.UsarDescricao1Ou2 <> '2',
                                            NFCe.Itens.Prod.fstr('descricao'),
                                            NFCe.Itens.Prod.fstr('descricao1')), '');

    current.UndsVnd := NFCe.Itens.Prod.UndVenda;

    undVenda        := (current.UndsVnd.Objects[0] as TUnidadeVenda_Model);
    current.Unidade := undVenda.unid_vnd;
    current.Fator   := undVenda.fator;

    if vDadosIni.vProduto.LeituraPesoBalanca.vals.preco = 0 then
    begin
      current.Qtde     := NFCe.helperConv.HandleUnidadeFracao(undVenda.unid_vnd, IfThen(current.Qtde = 0, 1, current.Qtde));

      current.ValorUn  := CalcularValorVenda(NFCe.Itens.Prod.ValorDeVenda, current.UndsVnd, 0);
      if current.AplicaDes.Percentual > 0 then
        Result := current_calc_use_desc_perc(current.AplicaDes.Percentual)
      else if (current.AplicaDes.Valor > 0) and (current.AplicaDes.Valor < current.ValorUn) then
        Result := current_calc_use_desc_val(current.AplicaDes.Valor)
      else
        Result := current_calc_use_vl_un(current.ValorUn);
//      current.ValorUn  := NFCe.Itens.Prod.ValorDeVenda;
//      current.Qtde     := RoundTo(current.Qtde   , 0 - csdQtde);
//      current.ValorUn  := RoundTo(current.ValorUn, 0 - csdVrUn);

//      current.ValorTot := RoundTo(current.Qtde * current.ValorUn, -2);
    end
    else
      Result := True;
  except on E: Exception do
    begin
      current.Error := 'ERRO NA SELEÇÃO DE PRODUTOS';
      vDadosIni.registraErro('TfrmCadNFCe.current_select_prod_to ' + E.Message);
    end;
  end;
end;

procedure TfrmCadNFCe.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if not (NFCe.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if NFCe.Dest.dataSet.IsEmpty then
  begin
    if not NFCe.Dest.Insert then
      Exit;
  end
  else if not NFCe.Dest.Edit then
    Exit;

  if not NFCe.PermiteAlteracaoPagamento then
    NFCe.Dest.Cancel;

  vDadosIni.abreForm('Dados do Destinatário', pnDadosDest, opFormsDefCad);

  NFCe.Dest.Post;
end;

procedure TfrmCadNFCe.SpeedButton11Click(Sender: TObject);
var
  ANumPed: Integer;
  ATipoPed: string;
  Aformpag_pedvenda_detalhesforma: Tformpag_pedvenda_detalhesforma;
begin
  inherited;
  if NFCe.dataSet.FieldByName('ped_origem_num').AsInteger > 0 then
  begin
    ANumPed  :=      NFCe.dataSet.FieldByName('ped_origem_num').AsInteger;
    ATipoPed := Trim(NFCe.dataSet.FieldByName('ped_origem_tip').AsString);
  end
  else if NFCe.dataSet.FieldByName('ped_destino_num').AsInteger > 0 then
  begin
    ANumPed :=       NFCe.dataSet.FieldByName('ped_destino_num').AsInteger;
    ATipoPed := Trim(NFCe.dataSet.FieldByName('ped_destino_tip').AsString);
  end
  else
    Exit;

  if not vDadosIni.PesqPros('VND095', 'CONSULTAR DETALHES FORMA DE PAGAMENTO',
    ATipoPed + '-' + IntToStr(ANumPed), 'PEDVENDA', IntToStr(ANumPed), NFCe.buscas) then
    Exit;

  try
    Screen.Cursor := crHourGlass;

    if vDadosIni.vFormPag.AHandle = 0 then
      vDadosIni.LoadPackage('pkFormPag', vDadosIni.vFormPag.AHandle);

    @Aformpag_pedvenda_detalhesforma := GetProcAddress(vDadosIni.vFormPag.AHandle, PChar('formpag_pedvenda_detalhesforma'));
    if Assigned(Aformpag_pedvenda_detalhesforma) then
      Aformpag_pedvenda_detalhesforma(ANumPed, ATipoPed);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    NFCe.ContingenciaVerificar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton14Click(Sender: TObject);
var
  nfce_emitir_from_pedvenda: Tnfce_emitir_from_pedvenda;
  NovoDia: TDateTime;
begin
  inherited;
  VendasSemEmit := TNFCe_VendasSemEmit.Create;
  try
    ed_vnd_loc.Clear;
    vDadosIni.enterTela.AddExclusion(ed_vnd_loc);
    grid_vnd_sem_emit.DataSource       := VendasSemEmit._dataSourceOOP;
    grid_vnd_sem_emit_itens.DataSource := VendasSemEmit.Itens._dataSourceOOP;
    VendasSemEmit.OnDiaChange          := vendas_sem_emit_data_change;

    if regGetConfStr('vnd_nao_emit_last_click', 'DiaAtual') = 'NovoDia' then
      if TryStrToDate(regGetConfStr('vnd_nao_emit_last_click.data', ''), NovoDia) then
        VendasSemEmit.Dia := NovoDia;

    VendasSemEmit.ShowDay();
    if vDadosIni.abreForm('Emissão de NFCe a partir de Vendas', pn_vnd_sem_emit, opFormsDefCad) then
    begin
      @nfce_emitir_from_pedvenda := GetProcAddress(vDadosIni.vNFConsumidor.AHandle, 'nfce_emitir_from_pedvenda');
      if Assigned(nfce_emitir_from_pedvenda) then
        nfce_emitir_from_pedvenda(VendasSemEmit.fint('numero'), VendasSemEmit.fstr('tipo'));
    end;
  finally
    vDadosIni.enterTela.DeleteExclusion(ed_vnd_loc);
    grid_vnd_sem_emit.DataSource       := nil;
    grid_vnd_sem_emit_itens.DataSource := nil;
    PageControl1.ActivePage            := TabSheet2;
    FreeAndNil(VendasSemEmit);
  end;
end;

procedure TfrmCadNFCe.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  VendasSemEmit.ShowDay(-1);
end;

procedure TfrmCadNFCe.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  VendasSemEmit.ShowDay(1);
end;

procedure TfrmCadNFCe.sp_vnd_sem_emit_conribClick(Sender: TObject);
begin
  inherited;
  VendasSemEmit.TipoDest := tdContribuinte;
  VendasSemEmit.ShowDay();
end;

procedure TfrmCadNFCe.sp_vnd_sem_emit_diatualClick(Sender: TObject);
begin
  inherited;
  VendasSemEmit.Dia    := Date;
  VendasSemEmit.ShowDay();

  regSetConfStr('vnd_nao_emit_last_click', 'DiaAtual');
end;

procedure TfrmCadNFCe.sp_vnd_sem_emit_isentosClick(Sender: TObject);
begin
  inherited;
  VendasSemEmit.TipoDest := tdNaoContribuinte;
  VendasSemEmit.ShowDay();
end;

procedure TfrmCadNFCe.sp_vnd_sem_emit_novodiaClick(Sender: TObject);
var
  NovoDia: string;
  NewDay: TDateTime;
begin
  inherited;
  NovoDia := FormatDateTime('dd/M/yyyy', VendasSemEmit.Dia);
  if not InputQuery('Novo dia', 'Informe o novo dia no formato "DD/MM/AAAA"', NovoDia) then
    Exit;

  if not TryStrToDate(NovoDia, NewDay) then
  begin
    ShowErro('Data informada inválida');
    Exit;
  end;

  VendasSemEmit.Dia    := NewDay;
  VendasSemEmit.ShowDay();

  regSetConfStr('vnd_nao_emit_last_click'     , 'NovoDia');
  regSetConfStr('vnd_nao_emit_last_click.data', NovoDia);
end;

procedure TfrmCadNFCe.sp_vnd_sem_emit_selecionarClick(Sender: TObject);
begin
  inherited;
  TForm(pn_vnd_sem_emit.Parent).ModalResult := mrOk;
end;

procedure TfrmCadNFCe.sp_vnd_sem_emit_voltarClick(Sender: TObject);
begin
  inherited;
  TForm(pn_vnd_sem_emit.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNFCe.statusBar(textoPadrao, hintControle: string);
begin
  inherited;

  v2_status_bar_build_consulta;
end;

procedure TfrmCadNFCe.status_barr_timer(Sender: TObject);
var
  I: Integer;
  barr: TStatusBar;
begin
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    NFCe.GetDatasApi;
    
    if StatusBar1.Visible then
      barr := StatusBar1
    else
      barr := stsbar_nfce;

    for I := 0 to barr.Panels.Count - 1 do
      if StartsText('Api Online:', barr.Panels[I].Text) and
        (vDadosIni.vNFConsumidor.DataApiOnline > 0) then
      else if StartsText('Api Erro:', barr.Panels[I].Text) and
        (vDadosIni.vNFConsumidor.DataApiError > 0) then
        barr.Panels[I].Text := 'Api Erro: ' + FormatDateTime('dd/MM hh:mm', vDadosIni.vNFConsumidor.DataApiError);
  end;
end;

procedure TfrmCadNFCe.timerAutorizarAutoTimer(Sender: TObject);
begin
  inherited;
  timerAutorizarAuto.Enabled := False;
  btAtalhoEmitir.Click;
end;

procedure TfrmCadNFCe.SpeedButton1Click(Sender: TObject);
var
  Continuar: Boolean;
begin
  try
    Screen.Cursor := crHourGlass;


  {$REGION 'validando movimento, caso nao permitido apenas a mensagem fica disponivel'}
  //talvez desabilitar os botoes em algum evento assim que valida a permissao
  if not NFCe.fstrin('situacao_nfce', [sitAutorizada, sitCancelada, sitInutilizada, sitDenegada]) then
    if NFCe.ConfigNFCe.MovimentoOperador.Ativo then
      if not MovOperador.PermiteEmissao(NFCe.fint('mov_id')) then
      begin
        if ContainsText(MovOperador.LastMessage, 'DIA DE MOVIMENTO FECHADO') then
          Continuar := vDadosIni.PesqPros('NFC034', 'VALIDAR', NFCe.Audit_Dados, 'NFCE', NFCE.Audit_Codigo, NFCe.buscas)
        else
          Continuar := False;

        if not continuar then
        begin
          ShowErro(MovOperador.LastMessage);
          Exit;
        end
        else
          MovOperador.Cod_nfce_liberada := NFCe.fint('cod_nfce');
      end;
  {$ENDREGION}


    if TelaEmissaoRapidaAtivada then
    begin
      nfce_v2_alterar(Sender);
      Exit;
    end;
    
    if not NFCe.Edit then
      exit;

    v2_status_bar_build_consulta;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    pageDadosNFCe.ActivePage := tsItens;
    montarComponentes;

    btAtalhoEmitir.Tag := 0;
    if (Self.Enabled) and (Self.Visible) and (edCodigo.CanFocus) then
      edCodigo.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (gridItens.CanFocus) then
      gridItens.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    NFCe.EmitirRejeitadas;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadNFCe_MovOperador, frmCadNFCe_MovOperador);
  frmCadNFCe_MovOperador.ShowModal;
end;

procedure TfrmCadNFCe.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    NFCe.CancelarInutilizarLote;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    NFCe.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    NFCe.Imprimir;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('nfc_%', NFCe.buscas);
  NFCe.LerConfigNFCe;
end;

procedure TfrmCadNFCe.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    NFCe.EnviarEmail;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    NFCe.Inutilizar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    NFCe.Cancelar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCe.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  Application.MessageBox( PChar(NFCe.fstr('msgretorno') +
                                IfThen(ContainsText(NFCe.fstr('msgretorno'), 'NFCe já rejeitada e sem correções para enviar novamente'),
                                       sLineBreak + NFCe.fstr('xmotivo'))), 'Atenção', 0 + 64);
end;

procedure TfrmCadNFCe.UsarOramento1Click(Sender: TObject);
var
  Orcamento, Mensagem: string;
begin
  inherited;

  if not InputQuery('Seleção de Orçamento', 'Informe o numero do orçamento, ou "0" para remover a seleção',  Orcamento) then
    Exit;

  if StrToIntDef(Orcamento, -1) = 1 then
  begin
    ShowErro('Numero informado inválido');
    Exit;
  end;

  Mensagem := '';
  NFCe.Orcamento_getOrcamento(StrToInt64Def(Orcamento, -1), Mensagem);

  if Mensagem <> '' then
    ShowAtencao(Mensagem);
end;

procedure TfrmCadNFCe.v2_action_alterar_item(Sender: TObject);
begin
  v2_form_alt_item_configura;

  ed_v2_alt_item_vl_un.Enabled     := (NFCe.ConfigNFCe.Itens.Campos.ValorUnitario);
  ed_v2_alt_item_vl_tot.Enabled    := (NFCe.ConfigNFCe.Itens.Campos.ValorTotal);
  ed_v2_alt_item_desc_perc.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoPercentual) and (NFCe.fequals('desc_por_item', 'S'));
  ed_v2_alt_item_desc_val.Enabled  := (NFCe.ConfigNFCe.Itens.Campos.DescontoEmValor)    and (NFCe.fequals('desc_por_item', 'S'));
  ed_v2_alt_item_tot_liq.Enabled   := (NFCe.ConfigNFCe.Itens.Campos.ValorLiquido);
  ed_v2_alt_item_und.Enabled       := NFCe.ConfigNFCe.Itens.Campos.UnidadeVenda;

  current_from_item;

  ed_v2_alt_item_und.Items.Text := current.UndsVnd.Text;
  ed_v2_alt_item_und.ItemIndex := 0;

  current_to_form_alt_item;

  v2_alteracao_item_show;
end;

procedure TfrmCadNFCe.v2_action_wc_escape_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    v2_cupom_show;
end;

procedure TfrmCadNFCe.v2_action_cancela_and_show_cupom(Sender: TObject);
begin
  v2_cupom_show;
end;

procedure TfrmCadNFCe.v2_action_wc_nav_leftrigth_keydown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ParentControl: TWinControl;
begin
  if Key = VK_LEFT then
  begin
    if Assigned(ActiveControl.Parent) then
      ParentControl := ActiveControl.Parent;
    Perform(WM_NEXTDLGCTL, 1, 0);
    if ParentControl <> ActiveControl.Parent then
      THackWinControl(ParentControl).SelectFirst;
  end
  else if Key = VK_RIGHT then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadNFCe.v2_action_wc_nav_updown_keydown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ParentControl: TWinControl;
begin
  if Key = VK_UP then
  begin
    if Assigned(ActiveControl.Parent) then
      ParentControl := ActiveControl.Parent;
    Perform(WM_NEXTDLGCTL, 1, 0);
    if ParentControl <> ActiveControl.Parent then
      THackWinControl(ParentControl).SelectFirst;
  end
  else if Key = VK_DOWN then
    Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_ESCAPE then
  begin
    if pn_print_container = pn_v2_alteracao_item.Parent then
      bt_v2_alteracao_item_cancela.Click
    else if pn_print_container = pn_v2_desconto_item.Parent then
      bt_v2_desconto_item_cancela.Click
    else if pn_print_container = pn_v2_cons_cliente.Parent then
      bt_v2_cons_cliente_cancela.Click
    else if pn_print_container = pn_v2_cliente_avulso.Parent then
      bt_v2_cliente_avulso_cancela.Click
    else if pn_print_container = pn_v2_valores.Parent then
      bt_v2_valores_cancela.Click
    else if pn_print_container = pn_v2_sangsup.Parent then
      bt_v2_sangsup_cancela.Click;    
  end;
end;

procedure TfrmCadNFCe.v2_action_bt_menus_pag_1_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
const
  VK_KEY_0 = 48;
  VK_KEY_1 = 49;
  VK_KEY_2 = 50;
  VK_KEY_3 = 51;
  VK_KEY_4 = 52;
  VK_KEY_5 = 53;
  VK_KEY_6 = 54;
  VK_KEY_7 = 55;
  VK_KEY_8 = 56;
  VK_KEY_9 = 57;
begin
  //if (not ssShift in Shift) and (not ssAlt in Shift) and (not ssCtrl in Shift) then
  //if pn_v2_menus.Parent = pn_print_container then
    case Key of
      VK_NUMPAD1, VK_KEY_1 : bt_v2_menu_novo.Click;
      VK_NUMPAD2, VK_KEY_2 : bt_v2_menu_excluir.Click;
      VK_NUMPAD3, VK_KEY_3 : bt_v2_menu_alterar.Click;
      VK_NUMPAD4, VK_KEY_4 : bt_v2_menu_desconto_item.Click;
      VK_NUMPAD5, VK_KEY_5 : bt_v2_menu_valores_nf.Click;
      VK_NUMPAD6, VK_KEY_6 : bt_v2_menu_usar_orcamento.Click;
      VK_NUMPAD7, VK_KEY_7 : bt_v2_menu_movimento_operador.Click;
      VK_NUMPAD8, VK_KEY_8 : bt_v2_menu_sangsup.Click;
      VK_NUMPAD9, VK_KEY_9 : bt_v2_menu_goto_page_2.Click;
      VK_ESCAPE  : bt_v2_menu_voltar_page_1.Click;
    end;
end;

procedure TfrmCadNFCe.v2_action_bt_menus_pag_2_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
const
  VK_KEY_0 = 48;
  VK_KEY_1 = 49;
  VK_KEY_2 = 50;
  VK_KEY_3 = 51;
  VK_KEY_4 = 52;
  VK_KEY_5 = 53;
  VK_KEY_6 = 54;
  VK_KEY_7 = 55;
  VK_KEY_8 = 56;
  VK_KEY_9 = 57;
begin
  //if (not ssShift in Shift) and (not ssAlt in Shift) and (not ssCtrl in Shift) then
  //if pn_v2_menus.Parent = pn_print_container then
    case Key of
      VK_NUMPAD0, VK_KEY_0 : bt_v2_menu_goto_page_1.Click;
      VK_NUMPAD1, VK_KEY_1 : bt_v2_menu_modo_reimprimir.Click;
      VK_NUMPAD2, VK_KEY_2 : bt_v2_menu_log_rejeicoes.Click;
      VK_NUMPAD3, VK_KEY_3 : bt_v2_menu_log_messages.Click;
//      VK_NUMPAD4, VK_KEY_4 : bt_v2_menu_desconto_item.Click;
//      VK_NUMPAD5, VK_KEY_5 : bt_v2_menu_valores_nf.Click;
//      VK_NUMPAD6, VK_KEY_6 : bt_v2_menu_modo_reimprimir.Click;
//      VK_NUMPAD7, VK_KEY_7 : bt_v2_menu_usar_orcamento.Click;
//      VK_NUMPAD8, VK_KEY_8 : bt_v2_menu_log_rejeicoes.Click;
//      VK_NUMPAD9, VK_KEY_9 : bt_v2_menu_log_messages.Click;
//      VK_NUMPAD0, VK_KEY_0 : bt_v2_menu_modo_completo.Click;
//      VK_F11               : bt_v2_menu_pagamento.Click;
      VK_ESCAPE  : bt_v2_menu_voltar_page_2.Click;
    end;
end;

procedure TfrmCadNFCe.v2_actopm_wc_numpad_KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0'..'9']) then
  begin
    case StrToInt(Key) of
      1 : bt_v2_menu_novo.Click;
      2 : bt_v2_menu_consulta_nfce.Click;
      3 : bt_v2_menu_excluir.Click;
      4 : bt_v2_menu_alterar.Click;
      5 : bt_v2_menu_desconto_item.Click;
      6 : bt_v2_menu_consulta_cliente.Click;
      7 : bt_v2_menu_valores_nf.Click;
      8 : bt_v2_menu_pagamento.Click;
      9 : bt_v2_menu_novo.Click;
      0 : bt_v2_menu_novo.Click;
    end;

  end;
end;

procedure TfrmCadNFCe.v2_action_excluir_item(Sender: TObject);
begin
  v2_exclusao_item_show;
end;

procedure TfrmCadNFCe.v2_action_alterar_item_grid_keydown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    v2_cupom_show
  else if Key = VK_RETURN then
    with NFCe.ValidacaoQualquerAlteracao do
      if Permitido then
        v2_action_alterar_item(grid_v2_selecao_item)
      else
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')]);
end;

procedure TfrmCadNFCe.v2_action_excluir_item_grid_keydown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    NFCe.Itens.checkUnCheckRow()
  else if Key = VK_ESCAPE then
    v2_cupom_show
  else if Key = VK_RETURN then
    with NFCe.ValidacaoQualquerAlteracao do
      if Permitido then
        v2_action_excluir_item(grid_v2_selecao_item)
      else
        v2_titulo_alerta('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')]);
end;

procedure TfrmCadNFCe.v2_alteracao_item_show;
begin
  v2_print_reset;

  v2_bt_nav_botao_assign([bt_v2_alteracao_item_salvar,
                          bt_v2_alteracao_item_cancela]);

  v2_wc_nav_keydown([bt_v2_alteracao_item_salvar,
                     bt_v2_alteracao_item_cancela], v2_action_wc_escape_KeyDown);

  v2_wc_nav_keydown([ed_v2_alt_item_codigo,
                     ed_v2_alt_item_descricao,
                     ed_v2_alt_item_qtde,
                     ed_v2_alt_item_vl_un,
                     ed_v2_alt_item_vl_tot,
                     ed_v2_alt_item_desc_perc,
                     ed_v2_alt_item_desc_val,
                     ed_v2_alt_item_tot_liq], v2_action_wc_nav_updown_keydown);

  v2_panel_assign(pn_v2_alteracao_item);
end;

procedure TfrmCadNFCe.VisualizaXML(AXML: string);
var
  AFileName: string;
  AFileXML: TStrings;
begin
  if Trim(AXML) = '' then
  begin
    vDadosIni.ShowErro('XML vazio ou inexistente');
    Exit;
  end;

  AFileName := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas';
  if not DirectoryExists(AFileName) then
    if not CreateDir(AFileName) then
    begin
      vDadosIni.ShowErro('Erro ao criar diretório temporário. TfrmCadNFCe.VisualizaXML');
      Exit;
    end;

  AFileName := AFileName + '\temp.xml';

  AFileXML := TStringList.Create;
  try
    AFileXML.Text := AXML;
    AFileXML.SaveToFile(AFileName);
  finally
    FreeAndNil(AFileXML);
  end;

  ShellExecute(Application.Handle, 'open', PAnsiChar(AFileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmCadNFCe.btDescontoCabecalhoDesabilitarClick(Sender: TObject);
begin
  inherited;
  NFCe.SetDescontoNoCabecalho(False);
  edDescontoTotal.Enabled := not (NFCe.dataSet.FieldByName('DESC_POR_ITEM').AsString = 'S');
  btDescontoCabecalhoHabilitar.Visible := not edDescontoTotal.Enabled;
  btDescontoCabecalhoDesabilitar.Visible := edDescontoTotal.Enabled;
  edDescP.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoPercentual) and (NFCe.dataSet.FieldByName('desc_por_item').AsString = 'S');
  edDescR.Enabled := (NFCe.ConfigNFCe.Itens.Campos.DescontoEmValor)    and (NFCe.dataSet.FieldByName('desc_por_item').AsString = 'S');
end;

procedure TfrmCadNFCe.ed_vnd_locKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not ContainsText('0123456789', Key)) and (Key <> #8) then
    Key := #0;
end;

initialization
  RegisterClass(TfrmCadNFCe);
finalization
  UnRegisterClass(TfrmCadNFCe);

end.
