unit uClassesMigRegistros;

interface

uses
  Contnrs, Controls, Classes, basefb_class, PedVendaProd_Model, PedVendaServ_Model,
  PedVendaProdUndVenda_Model, hw_strings, boletas_class, formpagamento_class;

const
  TOLERANCIA_QUANT_DEVOLUCAO = 0.0001;

type

  TReg_PedVendaProd = class;
  TReg_PedVendaServ = class;

  TClasseBase = class(TObject)
//  private
//    FCamposDaTabela: TStringList;
//    FJaIncluso: Boolean;
//    procedure SetJaIncluso(const Value: Boolean);
  public
    function GetCamposDaTabela: TStringList; virtual;
//    property JaIncluso: Boolean read FJaIncluso write SetJaIncluso;
  end;

  TClasseBaseList = class(TObjectList)
//  private
//    FMax: Integer;
//    procedure SetMax(const Value: Integer);
  public
    function GetCamposDaTabela: TStringList; virtual;
//    property Max: Integer read FMax write SetMax;
  end;

  ///Classe usada no paf-ecf e futuramente na NFC-e para controlar em tempo de execução a situação do item
  ///  Será usada na opção do orçamento(pr vnd), o usuario informa o orçamento antes de abrir o cupom fiscal
  ///  e a medida que os itens vão sendo vendidos o valor do item será o do orçamento, isso se constar no orçamento o item
  ///  se um item é novo então o valor dele será o valor de tabela normal
  ///  Essa classe fica no item e é alimentada pelo paf ecf logo antes da venda do item
  TReg_PedVendaProd_AuxOrcCupom = class(TClasseBase)
  private
    FQtde_ParaUsar: Double;
    FDesc_Usar: Double;
    FDesc_Diponivel: Double;
    FQtde_Disponivel: Double;
    FAcres_Diponivel: Double;
    FAcres_Usar: Double;
  public
    procedure clear(AItem: TReg_PedVendaProd);

    property Qtde_Disponivel: Double read FQtde_Disponivel write FQtde_Disponivel;
    property Qtde_ParaUsar: Double read FQtde_ParaUsar write FQtde_ParaUsar;
    property Desc_Diponivel: Double read FDesc_Diponivel write FDesc_Diponivel;
    property Desc_Usar: Double read FDesc_Usar write FDesc_Usar;
    property Acres_Diponivel: Double read FAcres_Diponivel write FAcres_Diponivel;
    property Acres_Usar: Double read FAcres_Usar write FAcres_Usar;

  end;

  TReg_PedVendaServ = class(TPedVendaServ_Model)
	private
  public
  	destructor Destroy; override;
    constructor create;
  end;

  TReg_PedVendaProd = class(TPedVendaProdUndVenda_Model)
  private
    Faux_cp_orc: TReg_PedVendaProd_AuxOrcCupom;
  public
    destructor Destroy; override;
    constructor create;
    property aux_cp_orc      : TReg_PedVendaProd_AuxOrcCupom    read Faux_cp_orc write Faux_cp_orc;
  end;

  TReg_PedVendaProdList = class(TBaseFbs_class)
  private
    function GetItem(Index: integer): TReg_PedVendaProd;
    procedure SetItem(Index: integer; const Value: TReg_PedVendaProd);
  public
    function New: TReg_PedVendaProd;
    procedure SetNew(Value: TReg_PedVendaProd);
    function GetCamposDaTabela: TStringList; //override;
//    function GetCamposComUndVnd: TStringListHw;

    property Items[Index: integer]: TReg_PedVendaProd read GetItem write SetItem;
  end;

  TReg_PedVendaServList = class(TBaseFbs_class)
  private
    function GetItem(Index: integer): TReg_PedVendaServ;
    procedure SetItem(Index: integer; const Value: TReg_PedVendaServ);
  public
    function New: TReg_PedVendaServ;
    procedure SetNew(Value: TReg_PedVendaServ);
    function GetCamposDaTabela: TStringList; //override;
//    function GetCamposComUndVnd: TStringListHw;

    property Items[Index: integer]: TReg_PedVendaServ read GetItem write SetItem;
  end;

  TReg_PedVendaClienteEndedecoCidade = class
  private
    FUF: string;
    FIBGE_Cidade: Integer;
    FIBGE_Estado: Integer;
    FNome: string;
    FEstado: string;
  public
    property Nome       : string  read FNome        write FNome;
    property IBGE_Cidade: Integer read FIBGE_Cidade write FIBGE_Cidade;
    property UF         : string  read FUF          write FUF;
    property Estado     : string  read FEstado      write FEstado;
    property IBGE_Estado: Integer read FIBGE_Estado write FIBGE_Estado;
  end;

  TReg_PedVendaClienteEndedeco = class
  private
    FLogradouro: string;
    FBairro: string;
    FCEP: string;
    FNumero: string;
    FComplemento: string;
    FCidade: TReg_PedVendaClienteEndedecoCidade;
  public
    constructor create;
    destructor Destroy; override;

    property Logradouro : string                             read FLogradouro  write FLogradouro;
    property Numero     : string                             read FNumero      write FNumero;
    property Complemento: string                             read FComplemento write FComplemento;
    property Bairro     : string                             read FBairro      write FBairro;
    property Cidade     : TReg_PedVendaClienteEndedecoCidade read FCidade      write FCidade;
    property CEP        : string                             read FCEP         write FCEP;
  end;

  TReg_PedVendaCliente = class
  private
    FCodigo: Integer;
    Fcpfcnpj: string;
    FRazaoSocial: string;
    FNomeFantasia: string;
    Fendereco: TReg_PedVendaClienteEndedeco;
    Ftelefone: string;
    Femail: string;
  public     
    constructor create;
    destructor Destroy; override;

    property Codigo      : Integer                      read FCodigo       write FCodigo;
    property NomeFantasia: string                       read FNomeFantasia write FNomeFantasia;
    property RazaoSocial : string                       read FRazaoSocial  write FRazaoSocial;
    property cpfcnpj     : string                       read Fcpfcnpj      write Fcpfcnpj;
    property endereco    : TReg_PedVendaClienteEndedeco read Fendereco     write Fendereco;
    property telefone    : string                       read Ftelefone     write Ftelefone;
    property email       : string                       read Femail        write Femail;
  end;

  TReg_PedVendaVendedor = class
  private
    FCodigo: Integer;
    FNome: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
  end;

  TReg_PedVendaPagamento_Controle = class
  private
    Fcodigo_ctrl: Integer;
    Fnfce_tpag: Integer;
    Fnome_ctrl: string;
    Fdocs: string;
    Fnfce_tband: Integer;
    FAdmCartao: TReg_PedVendaCliente;
  public
    constructor create;
    destructor Destroy; override;

    property codigo_ctrl: Integer              read Fcodigo_ctrl write Fcodigo_ctrl;
    property nome_ctrl  : string               read Fnome_ctrl   write Fnome_ctrl;
    property docs       : string               read Fdocs        write Fdocs;
    property nfce_tpag  : Integer              read Fnfce_tpag   write Fnfce_tpag;
    property nfce_tband : Integer              read Fnfce_tband  write Fnfce_tband;
    property AdmCartao  : TReg_PedVendaCliente read FAdmCartao   write FAdmCartao;
  end;

  TReg_PedVendaFormPagamentoList = class(TFormpagamento_classList);

  TReg_PedVendaBoletoList = class(TBoletas_classList);

  TReg_PedVendaPagamento = class
  private
    Fprcss: string;
    Fseqform: Integer;
    Fcod_empresa: Integer;
    Fnrequisicao: Integer;
    Ftipdoc: string;
    Fn_aut_cart: string;
    Fdata_mov: TDateTime;
    Fcod_cliente: Integer;
    Fcliente: string;
    Fcod_controle: Integer;
    FControle: TReg_PedVendaPagamento_Controle;
    Fndoc: string;
    Fvalordoc: Double;
    FguidTrCartao: string;
    FidTrCartao: Integer;
    Fhistorico: string;
    Ftpdocs: string;
  	Fop_cxl: Integer;
    Fcod_gerador: Integer;
    Fnparcela: Integer;
    Fqtde_parc: Integer;
  public
    constructor create;
    destructor Destroy; override;

    property seqform      : Integer                         read Fseqform      write Fseqform;
    property cod_empresa  : Integer                         read Fcod_empresa  write Fcod_empresa;
    property nrequisicao  : Integer                         read Fnrequisicao  write Fnrequisicao;
    property ndoc         : string                          read Fndoc         write Fndoc;
    property tipdoc       : string                          read Ftipdoc       write Ftipdoc;
    property valordoc     : Double                          read Fvalordoc     write Fvalordoc;
    property n_aut_cart   : string                          read Fn_aut_cart   write Fn_aut_cart;
    property data_mov     : TDateTime                       read Fdata_mov     write Fdata_mov;
    property cod_cliente  : Integer                         read Fcod_cliente  write Fcod_cliente;
    property cliente      : string                          read Fcliente      write Fcliente;
    property cod_controle : Integer                         read Fcod_controle write Fcod_controle;
    property prcss        : string                          read Fprcss        write Fprcss;
    property guidTrCartao : string                          read FguidTrCartao write FguidTrCartao;
    property idTrCartao   : Integer                         read FidTrCartao   write FidTrCartao;
    property historico    : string                          read Fhistorico    write Fhistorico;
    property tpdocs       : string                          read Ftpdocs       write Ftpdocs;
    property op_cxl       : Integer                         read Fop_cxl       write Fop_cxl;
    property cod_gerador  : Integer                         read Fcod_gerador  write Fcod_gerador;
    property nparcela     : Integer                         read Fnparcela     write Fnparcela;
    property qtde_parc    : Integer                         read Fqtde_parc    write Fqtde_parc;
    property Controle     : TReg_PedVendaPagamento_Controle read FControle     write FControle;
  end;

  TReg_PedVendaPagamentoList = class(TClasseBaseList)
  private
    function GetItem(Index: integer): TReg_PedVendaPagamento;
    procedure SetItem(Index: integer; const Value: TReg_PedVendaPagamento);
  public
    function New: TReg_PedVendaPagamento;
    property Items[Index: integer]: TReg_PedVendaPagamento read GetItem write SetItem;
    function GetCamposDaTabela: TStringList; //override;
  end;

  TReg_PedVenda = class(TClasseBase)
  private
    Fdata_libtrava: TDateTime;
    Facrescimo: Double;
    Fdesconto: Double;
    Fnprevenda: Integer;
    Fpafnumprevenda: Integer;
    Fdata_ped: TDateTime;
    Fvalor_total: Double;
    Fcpfcgc: string;
    Fsubtipo_os: string;
    Fhorafechamento: Integer;
    Fminfechamento: Integer;
    Fobs_ped: string;
    Fcod_cond_pag: Integer;
    Facresc_p_serv: Double;
    Flibtrava: string;
    Ftot_prod: Double;
    Ftot_serv: Double;
    Ftot_prod_terc: Double;
    Ftot_serv_terc: Double;
    Ftipor: string;
    Ftipv: string;
    Fdesc_p_serv: Double;
    Fcod_us_fech: Integer;
    Fdata_fech: TDateTime;
    Fnped: Integer;
    Fhoraabertura: Integer;
    Fcod_cliente: Integer;
    Facresc_p_prod: Double;
    Fvl_pago_cxl: Double;
    Fvl_entrada: Double;
    Fobs_cxl_rq: string;
    Fstatus_ped: string;
    Faprovada_gerente: string;
    Fhora_fech: string;
    Fcod_vendedor: Integer;
    Ftipo: string;
    Fcod_empresa: Integer;
    Fminabertura: Integer;
    Fdesc_p_prod: Double;
    FProd: TReg_PedVendaProdList;
    FServ: TReg_PedVendaServList;
    FVendedor: TReg_PedVendaVendedor;
    FCliente: TReg_PedVendaCliente;
    Fnome_cli_orc: string;
    Fmd5: string;
    Fsaveauto: string;
    Fdata_estoque: TDateTime;
    Fcalc: string;
    Fnome_clientedav: string;
    Fstatus_cxl_rq: string;
    Fcod_nfce: Integer;
    Fnum_nfce: Integer;
    FFormPagamento: TReg_PedVendaFormPagamentoList;
    FBoleto: TReg_PedVendaBoletoList;
    FPagamento: TReg_PedVendaPagamentoList;
    Fdia_cxl: TDateTime;
    Fop_cxl: Integer;
    FPagamentoNFCe: TReg_PedVendaPagamentoList;
    Fncupom: Integer;
    Ftp_gerar_pontos: string;
    Ftp_venda: string;
    Fvale_troca: string;
    Fgerar_nfs: string;
    Fgerar_nf: string;
    Fgerar_rec_loc: string;
    Fgerar_boleto: string;
    Fid_commerce: Integer;
    Fcod_equip: Integer;
    Faparelho_ped: string;
    Fcod_veiculo: Integer;
    Fchassi: string;
    Fplaca: string;
    Fstatus_contrato: string;
    Fobs_os: string;
    Fobs_livro_reg: string;
    Fobs_minuta: string;
    Fobs_tpvenda: string;
    Fh_ent: TDateTime;
    Ftipo_os: string;
    Fseq_fech: Integer;
    Fdatvenc: TDateTime;
    Fst_term_serv: string;
    Fativo: Integer;
    Fh_prometida: TDateTime;
    Fdt_prometida: TDateTime;
    Ftp_abord: string;
    Ffr_pagbosch: string;
    Fcod_cli_fat: Integer;
    Fcod_gerador: Integer;
    FDevolucaoExcedente: Boolean;
    function GetPagamentoNFCe: TReg_PedVendaPagamentoList;
  public
    destructor Destroy; override;
    constructor create;
    procedure CorrigirValores;
    function GetCamposDaTabela: TStringList; override;

    function TemDevolucao: Boolean;
    function TodosItensDevolvidos: Boolean;
    procedure ResetDevolucoes;

    property DevolucaoExcedente: Boolean read FDevolucaoExcedente write FDevolucaoExcedente;

    property nped            : Integer           read Fnped             write Fnped;
    property tipo            : string            read Ftipo             write Ftipo;
    property cod_empresa     : Integer           read Fcod_empresa      write Fcod_empresa;
    property cod_cliente     : Integer           read Fcod_cliente      write Fcod_cliente;
    property cod_vendedor    : Integer           read Fcod_vendedor     write Fcod_vendedor;
    property valor_total     : Double            read Fvalor_total      write Fvalor_total;
    property cod_cond_pag    : Integer           read Fcod_cond_pag     write Fcod_cond_pag;
    property data_ped        : TDateTime         read Fdata_ped         write Fdata_ped;
    property cod_us_fech     : Integer           read Fcod_us_fech      write Fcod_us_fech;
    property data_fech       : TDateTime         read Fdata_fech        write Fdata_fech;
    property hora_fech       : string            read Fhora_fech        write Fhora_fech;
    property desc_p_prod     : Double            read Fdesc_p_prod      write Fdesc_p_prod;
    property desc_p_serv     : Double            read Fdesc_p_serv      write Fdesc_p_serv;
    property desconto        : Double            read Fdesconto         write Fdesconto;
    property obs_ped         : string            read Fobs_ped          write Fobs_ped;
    property status_ped      : string            read Fstatus_ped       write Fstatus_ped;
    property tipv            : string            read Ftipv             write Ftipv;
    property obs_cxl_rq      : string            read Fobs_cxl_rq       write Fobs_cxl_rq;
    property vl_pago_cxl     : Double            read Fvl_pago_cxl      write Fvl_pago_cxl;
    property tipor           : string            read Ftipor            write Ftipor;
    property horaabertura    : Integer           read Fhoraabertura     write Fhoraabertura;
    property minabertura     : Integer           read Fminabertura      write Fminabertura;
    property horafechamento  : Integer           read Fhorafechamento   write Fhorafechamento;
    property minfechamento   : Integer           read Fminfechamento    write Fminfechamento;
    property vl_entrada      : Double            read Fvl_entrada       write Fvl_entrada;
    property nprevenda       : Integer           read Fnprevenda        write Fnprevenda;
    property pafnumprevenda  : Integer           read Fpafnumprevenda   write Fpafnumprevenda;
    property acresc_p_prod   : Double            read Facresc_p_prod    write Facresc_p_prod;
    property acresc_p_serv   : Double            read Facresc_p_serv    write Facresc_p_serv;
    property acrescimo       : Double            read Facrescimo        write Facrescimo;
    property tot_prod        : Double            read Ftot_prod         write Ftot_prod;
    property tot_serv        : Double            read Ftot_serv         write Ftot_serv;
    property tot_prod_terc   : Double            read Ftot_prod_terc    write Ftot_prod_terc;
    property tot_serv_terc   : Double            read Ftot_serv_terc    write Ftot_serv_terc;
    property cpfcgc          : string            read Fcpfcgc           write Fcpfcgc;
    property libtrava        : string            read Flibtrava         write Flibtrava;
    property subtipo_os      : string            read Fsubtipo_os       write Fsubtipo_os;
    property aprovada_gerente: string            read Faprovada_gerente write Faprovada_gerente;
    property nome_clientedav : string            read Fnome_clientedav  write Fnome_clientedav;
    property nome_cli_orc    : string            read Fnome_cli_orc     write Fnome_cli_orc;
    property data_libtrava   : TDateTime         read Fdata_libtrava    write Fdata_libtrava;
    property md5             : string            read Fmd5              write Fmd5;
    property saveauto        : string            read Fsaveauto         write Fsaveauto;
    property calc            : string            read Fcalc             write Fcalc;
    property data_estoque    : TDateTime         read Fdata_estoque     write Fdata_estoque;
    property status_cxl_rq   : string            read Fstatus_cxl_rq    write Fstatus_cxl_rq;
    property op_cxl          : Integer           read Fop_cxl           write Fop_cxl;
    property dia_cxl         : TDateTime         read Fdia_cxl          write Fdia_cxl;
    property cod_nfce        : Integer           read Fcod_nfce         write Fcod_nfce;
    property num_nfce        : Integer           read Fnum_nfce         write Fnum_nfce;
    property ncupom          : Integer           read Fncupom           write Fncupom;
    property tp_venda		     : string			       read Ftp_venda         write Ftp_venda;
    property tp_gerar_pontos : string            read Ftp_gerar_pontos  write Ftp_gerar_pontos;
    property vale_troca		   : string				     read Fvale_troca       write Fvale_troca;
    property gerar_nfs       : string            read Fgerar_nfs        write Fgerar_nfs;
    property gerar_nf        : string            read Fgerar_nf         write Fgerar_nf;
    property gerar_rec_loc   : string            read Fgerar_rec_loc    write Fgerar_rec_loc;
    property gerar_boleto    : string            read Fgerar_boleto     write Fgerar_boleto;
    property id_commerce     : Integer           read Fid_commerce      write Fid_commerce;
    property cod_equip       : Integer           read Fcod_equip        write Fcod_equip;
    property aparelho_ped    : string            read Faparelho_ped     write Faparelho_ped;
  	property cod_veiculo     : Integer           read Fcod_veiculo      write Fcod_veiculo;
    property chassi          : string            read Fchassi           write Fchassi;
    property placa           : string            read Fplaca            write Fplaca;
    property status_contrato : string            read Fstatus_contrato  write Fstatus_contrato;
    property obs_os          : string            read Fobs_os           write Fobs_os;
    property obs_livro_reg   : string            read Fobs_livro_reg    write Fobs_livro_reg;
    property obs_minuta      : string            read Fobs_minuta       write Fobs_minuta;
    property obs_tpvenda     : string            read Fobs_tpvenda      write Fobs_tpvenda;
    property h_ent           : TDateTime         read Fh_ent            write Fh_ent;
    property tipo_os         : string            read Ftipo_os          write Ftipo_os;
    property seq_fech        : Integer           read Fseq_fech         write Fseq_fech;
    property datvenc         : TDateTime         read Fdatvenc          write Fdatvenc;
    property st_term_serv    : string            read Fst_term_serv     write Fst_term_serv;
    property ativo           : Integer           read Fativo            write Fativo;
    property h_prometida     : TDateTime         read Fh_prometida      write Fh_prometida;
    property dt_prometida    : TDateTime         read Fdt_prometida     write Fdt_prometida;
    property tp_abord        : string            read Ftp_abord         write Ftp_abord;
    property fr_pagbosch     : string            read Ffr_pagbosch      write Ffr_pagbosch;
    property cod_cli_fat     : Integer           read Fcod_cli_fat      write Fcod_cli_fat;
    property cod_gerador     : Integer           read Fcod_gerador      write Fcod_gerador;
    property Vendedor        : TReg_PedVendaVendedor          read FVendedor         write FVendedor;
    property Cliente         : TReg_PedVendaCliente           read FCliente          write FCliente;
    property FormPagamento   : TReg_PedVendaFormPagamentoList read FFormPagamento    write FFormPagamento;
    property Boleto          : TReg_PedVendaBoletoList        read FBoleto           write FBoleto;
    property Prod            : TReg_PedVendaProdList          read FProd             write FProd;
    property Serv            : TReg_PedVendaServList          read FServ             write FServ;
    property Pagamento       : TReg_PedVendaPagamentoList     read FPagamento        write FPagamento;
    property PagamentoNFCe   : TReg_PedVendaPagamentoList     read GetPagamentoNFCe;
  end;

  TReg_PedVendaList = class(TClasseBaseList)
  private
    function GetItem(Index: integer): TReg_PedVenda;
    procedure SetItem(Index: integer; const Value: TReg_PedVenda);
  public
    function New: TReg_PedVenda;
    property Items[Index: integer]: TReg_PedVenda read GetItem write SetItem;
  end;

implementation

uses
  SysUtils, Math, hw_utils;

{ TReg_PedVendaProdList }

function TReg_PedVendaProdList.GetCamposDaTabela: TStringList;
var
  ACamposDaTabela: TStringList;
begin
  {
  ACamposDaTabela := TStringList.Create;
  ACamposDaTabela.Duplicates := dupError;

  ACamposDaTabela.Clear;
  ACamposDaTabela.Add('NPED');
  ACamposDaTabela.Add('TIPO');
  ACamposDaTabela.Add('GRUPO_PROD');
  ACamposDaTabela.Add('COD_PROD');
  ACamposDaTabela.Add('NITEM');
  ACamposDaTabela.Add('COD_EMPRESA');
  ACamposDaTabela.Add('COD_GRADE');
  ACamposDaTabela.Add('CODIGO_NOP');
  ACamposDaTabela.Add('NUM_FAB_PROD');
  ACamposDaTabela.Add('DESCR_PROD_PED');
  ACamposDaTabela.Add('QUANT_PED_ITEM');
  ACamposDaTabela.Add('VLUN_PED_ITEM');
  ACamposDaTabela.Add('VLTOT_PED_ITEM');
  ACamposDaTabela.Add('VLUN_ORIG');
  ACamposDaTabela.Add('VLUN_PED_NF');
  ACamposDaTabela.Add('RATEIO_DESC');
  ACamposDaTabela.Add('RATEIO_ACRESC');
  ACamposDaTabela.Add('RATDSAS');
  ACamposDaTabela.Add('COMISS_PROD');
  ACamposDaTabela.Add('COMISS_PROD_GER');
  ACamposDaTabela.Add('PCUST_C');
  ACamposDaTabela.Add('PCUST_MC');
  ACamposDaTabela.Add('TP_NF_PED');
  ACamposDaTabela.Add('SIT_ATD');
  ACamposDaTabela.Add('DESC_ITEM');
  ACamposDaTabela.Add('ACRESC_ITEM');
  ACamposDaTabela.Add('COD_VENDEDOR');
  ACamposDaTabela.Add('DATA_TRANSF');
  ACamposDaTabela.Add('NOME_VEND');
  ACamposDaTabela.Add('VLO_UNITARIO');
  ACamposDaTabela.Add('DATA_INCLUSAO');
  ACamposDaTabela.Add('TP_DESCACRES');
  ACamposDaTabela.Add('NAT_DESCACRES');
  ACamposDaTabela.Add('VALOR_DESCACRES');
  ACamposDaTabela.Add('NITEM_NF');
  ACamposDaTabela.Add('XPED_COMPRA');
  ACamposDaTabela.Add('NITEMPED_COMPRA');
  ACamposDaTabela.Add('VL_DESP_NF');
  ACamposDaTabela.Add('UNIDADE');
  ACamposDaTabela.Add('ICM_PROD');
  ACamposDaTabela.Add('SIT_TRIB');
  ACamposDaTabela.Add('MD5');
  ACamposDaTabela.Add('VLTOT_PED_NF');
  ACamposDaTabela.Add('TABPRATICADA');
  ACamposDaTabela.Add('PRECOPORQTDE');
  ACamposDaTabela.Add('COD_SUGESTAO');
  ACamposDaTabela.Add('COD_EMP_SUGESTAO');

  Result := ACamposDaTabela;
  }

  Result := NewStringList(true, StringReplace(TPedVendaProd_Model.GetFieldsSql(), ', ',',', [rfReplaceAll]), ',');
end;

function TReg_PedVendaProdList.GetItem(Index: integer): TReg_PedVendaProd;
begin
	Result := TReg_PedVendaProd(inherited Items[Index]);
end;

function TReg_PedVendaProdList.New: TReg_PedVendaProd;
begin
  Result := TReg_PedVendaProd.create;
  Add(Result);
end;

procedure TReg_PedVendaProdList.SetItem(Index: integer; const Value: TReg_PedVendaProd);
begin
	Put(Index, Value);
end;

procedure TReg_PedVendaProdList.SetNew(Value: TReg_PedVendaProd);
begin
  Add(Value)
end;

{ TReg_PedVenda }

procedure TReg_PedVenda.CorrigirValores;
var
  AProd: TReg_PedVendaProd;
  I: Integer;
  ASumDesc, ASumAcresc, ASumTotal: Double;
begin
  Fvalor_total   := Abs(RoundTo(Fvalor_total  , -2));
  Fvl_pago_cxl   := Abs(RoundTo(Fvl_pago_cxl  , -2));
  Fvl_entrada    := Abs(RoundTo(Fvl_entrada   , -2));
  Ftot_serv      := Abs(RoundTo(Ftot_serv     , -2));
  Ftot_prod      := Abs(RoundTo(Ftot_prod     , -2));
  Ftot_prod_terc := Abs(RoundTo(Ftot_prod_terc, -2));
  Ftot_serv_terc := Abs(RoundTo(Ftot_serv_terc, -2));
  Fdesconto      := Abs(RoundTo(Fdesconto     , -2));
  Facrescimo     := Abs(RoundTo(Facrescimo    , -2));

  if Fvalor_total > (Ftot_prod + Ftot_serv) then
    Facrescimo := RoundTo(Fvalor_total - (Ftot_prod + Ftot_serv), -2)
  else if Fvalor_total < (Ftot_prod + Ftot_serv) then
    Fdesconto :=  RoundTo((Ftot_prod + Ftot_serv) - Fvalor_total, -2);


  ASumTotal := 0;
  for I := 0 to FProd.Count - 1 do
  begin
    FProd.Items[I].rateio_desc    := Abs(RoundTo(FProd.Items[I].rateio_desc   , -2));
    FProd.Items[I].rateio_acresc  := Abs(RoundTo(FProd.Items[I].rateio_acresc , -2));
    FProd.Items[I].vltot_ped_item := Abs(RoundTo(FProd.Items[I].vltot_ped_item, -2));
    FProd.Items[I].vlun_ped_item  := Abs(FProd.Items[I].vlun_ped_item);

    ASumTotal := RoundTo(ASumTotal + FProd.Items[I].vltot_ped_item + FProd.Items[I].rateio_acresc - FProd.Items[I].rateio_desc, -2);
  end;

  for I := 0 to FServ.Count - 1 do
  begin
    FServ.Items[I].rateio_desc    := Abs(RoundTo(FServ.Items[I].rateio_desc   , -2));
    FServ.Items[I].rateio_acresc  := Abs(RoundTo(FServ.Items[I].rateio_acresc , -2));
    FServ.Items[I].valor_tot_serv := Abs(RoundTo(FServ.Items[I].valor_tot_serv, -2));
    FServ.Items[I].valor_un_serv  := Abs(FServ.Items[I].valor_un_serv);

    ASumTotal := RoundTo(ASumTotal + FServ.Items[I].valor_tot_serv + FServ.Items[I].rateio_acresc - FServ.Items[I].rateio_desc, -2);
  end;


  if RoundTo(ASumTotal, -2) = RoundTo(Fvalor_total, 2) then
    Exit;

  ASumDesc := 0;
  ASumAcresc := 0;
  for I := 0 to FProd.Count - 1 do
  begin
    with FProd.Items[I] do
    begin
      rateio_desc     := 0;
      rateio_acresc   := 0;
      ratdsas         := 0;
      desc_item       := 0;
      acresc_item     := 0;
      valor_descacres := 0;

      if (Facrescimo > 0) or (Fdesconto > 0) then
        if Facrescimo > 0 then
        begin
          rateio_acresc := RoundTo((Facrescimo / (Ftot_prod + Ftot_serv) * vltot_ped_item) , -2);
          ASumAcresc := ASumAcresc + rateio_acresc;
        end
        else if Fdesconto > 0 then
        begin
          rateio_desc := RoundTo((Fdesconto / (Ftot_prod + Ftot_serv) * vltot_ped_item) , -2);
          ASumDesc := ASumDesc + rateio_desc;
        end;

      if I = FProd.Count - 1 then
        if Fdesconto <> ASumDesc then
          rateio_desc := rateio_desc + (Fdesconto - ASumDesc)
        else if Facrescimo <> ASumAcresc then
          rateio_acresc := rateio_acresc + (Facrescimo - ASumAcresc);
    end;
  end;

  ASumDesc := 0;
  ASumAcresc := 0;
  for I := 0 to FServ.Count - 1 do
  begin
    with FServ.Items[I] do
    begin
      rateio_desc     := 0;
      rateio_acresc   := 0;
      desc_item       := 0;
      acresc_item     := 0;

      if (Facrescimo > 0) or (Fdesconto > 0) then
        if Facrescimo > 0 then
        begin
          rateio_acresc := RoundTo((Facrescimo / (Ftot_prod + Ftot_serv) * valor_tot_serv) , -2);
          ASumAcresc := ASumAcresc + rateio_acresc;
        end
        else if Fdesconto > 0 then
        begin
          rateio_desc := RoundTo((Fdesconto / (Ftot_prod + Ftot_serv) * valor_tot_serv) , -2);
          ASumDesc := ASumDesc + rateio_desc;
        end;

      if I = FServ.Count - 1 then
        if Fdesconto <> ASumDesc then
          rateio_desc := rateio_desc + (Fdesconto - ASumDesc)
        else if Facrescimo <> ASumAcresc then
          rateio_acresc := rateio_acresc + (Facrescimo - ASumAcresc);
    end;
  end;
end;

constructor TReg_PedVenda.create;
begin
  Ftipo := 'REQ';
  Ftipor := 'V';
  Flibtrava := 'N';
  Fsubtipo_os := 'NORMAL';
  Faprovada_gerente := 'N';
  Fmd5 := 'sistema';
  Fsaveauto := 'N';
  Fcalc := 'S';
  FDevolucaoExcedente := False;

  FProd := TReg_PedVendaProdList.Create;
  FServ := TReg_PedVendaServList.Create;
  FVendedor := TReg_PedVendaVendedor.Create;
  FCliente := TReg_PedVendaCliente.Create;
  FFormPagamento := TReg_PedVendaFormPagamentoList.Create;
  FBoleto := TReg_PedVendaBoletoList.Create;
  FPagamento := TReg_PedVendaPagamentoList.Create;
end;

destructor TReg_PedVenda.Destroy;
begin
  FreeAndNil(FProd);
  FreeAndNil(FServ);
  FreeAndNil(FVendedor);
  FreeAndNil(FCliente);
  FreeAndNil(FFormPagamento);
  FreeAndNil(FBoleto);
  FreeAndNil(FPagamento);
  //FreeAndNil(FPagamentoNFCe);
  inherited;
end;

function TReg_PedVenda.TemDevolucao: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to FProd.Count - 1 do
    if FProd.Items[I].Quant_Devolvida > TOLERANCIA_QUANT_DEVOLUCAO then
    begin
      Result := True;
      Break;
    end;
end;

function TReg_PedVenda.TodosItensDevolvidos: Boolean;
var
  I: Integer;
  ATemItemPositivo: Boolean;
begin
  Result := False;
  ATemItemPositivo := False;

  for I := 0 to FProd.Count - 1 do
    if FProd.Items[I].quant_ped_item > TOLERANCIA_QUANT_DEVOLUCAO then
    begin
      ATemItemPositivo := True;
      if FProd.Items[I].Quant_Devolvida <
         (FProd.Items[I].quant_ped_item - TOLERANCIA_QUANT_DEVOLUCAO) then
        Exit;
    end;

  Result := ATemItemPositivo;
end;

procedure TReg_PedVenda.ResetDevolucoes;
var
  I: Integer;
begin
  FDevolucaoExcedente := False;
  for I := 0 to FProd.Count - 1 do
    FProd.Items[I].Quant_Devolvida := 0;
end;

function TReg_PedVenda.GetCamposDaTabela: TStringList;
var
  ACamposDaTabela: TStringList;
begin
  ACamposDaTabela := TStringList.Create;
  ACamposDaTabela.Duplicates := dupError;

  ACamposDaTabela.Clear;
  ACamposDaTabela.Add('NPED');
  ACamposDaTabela.Add('TIPO');
  ACamposDaTabela.Add('COD_EMPRESA');
  ACamposDaTabela.Add('COD_CLIENTE');
  ACamposDaTabela.Add('COD_VENDEDOR');
  ACamposDaTabela.Add('VALOR_TOTAL');
  ACamposDaTabela.Add('COD_COND_PAG');
  ACamposDaTabela.Add('DATA_PED');
  ACamposDaTabela.Add('COD_US_FECH');
  ACamposDaTabela.Add('DATA_FECH');
  ACamposDaTabela.Add('HORA_FECH');
  ACamposDaTabela.Add('DESC_P_PROD');
  ACamposDaTabela.Add('DESC_P_SERV');
  ACamposDaTabela.Add('DESCONTO');
  ACamposDaTabela.Add('STATUS_PED');
  ACamposDaTabela.Add('TIPV');
  ACamposDaTabela.Add('OBS_PED');
  ACamposDaTabela.Add('OBS_OS');
  ACamposDaTabela.Add('OBS_CXL_RQ');
  ACamposDaTabela.Add('OBS_LIVRO_REG');
  ACamposDaTabela.Add('OBS_MINUTA');
  ACamposDaTabela.Add('OBS_TPVENDA');
  ACamposDaTabela.Add('VL_PAGO_CXL');
  ACamposDaTabela.Add('TIPOR');
  ACamposDaTabela.Add('HORAABERTURA');
  ACamposDaTabela.Add('MINABERTURA');
  ACamposDaTabela.Add('HORAFECHAMENTO');
  ACamposDaTabela.Add('MINFECHAMENTO');
  ACamposDaTabela.Add('VL_ENTRADA');
  ACamposDaTabela.Add('NPREVENDA');
  ACamposDaTabela.Add('PAF_NUM_PREVENDA');
  ACamposDaTabela.Add('ACRESC_P_PROD');
  ACamposDaTabela.Add('ACRESC_P_SERV');
  ACamposDaTabela.Add('ACRESCIMO');
  ACamposDaTabela.Add('TOT_PROD');
  ACamposDaTabela.Add('TOT_SERV');
  ACamposDaTabela.Add('TOT_PROD_TERC');
  ACamposDaTabela.Add('TOT_SERV_TERC');
  ACamposDaTabela.Add('CPFCGC');
  ACamposDaTabela.Add('LIBTRAVA');
  ACamposDaTabela.Add('SUBTIPO_OS');
  ACamposDaTabela.Add('APROVADA_GERENTE');
  ACamposDaTabela.Add('DATA_LIBTRAVA');
  ACamposDaTabela.Add('NOME_CLIENTEDAV');
  ACamposDaTabela.Add('NOME_CLI_ORC');
  ACamposDaTabela.Add('MD5');
  ACamposDaTabela.Add('SAVEAUTO');
  ACamposDaTabela.Add('CALC');
  ACamposDaTabela.Add('DATA_ESTOQUE');
  ACamposDaTabela.Add('STATUS_CXL_RQ');
  ACamposDaTabela.Add('OP_CXL');
  ACamposDaTabela.Add('DIA_CXL');
  ACamposDaTabela.Add('COD_NFCE');
  ACamposDaTabela.Add('NUM_NFCE');
  ACamposDaTabela.Add('NCUPOM');
  ACamposDaTabela.Add('TP_VENDA');
  ACamposDaTabela.Add('TP_GERAR_PONTOS');
  ACamposDaTabela.Add('VALE_TROCA');
  ACamposDaTabela.Add('GERAR_NFS');
  ACamposDaTabela.Add('GERAR_NF');
  ACamposDaTabela.Add('GERAR_REC_LOC');
  ACamposDaTabela.Add('GERAR_BOLETO');
  ACamposDaTabela.Add('ID_COMMERCE');
  ACamposDaTabela.Add('COD_EQUIP');
  ACamposDaTabela.Add('APARELHO_PED');
  ACamposDaTabela.Add('COD_VEICULO');
  ACamposDaTabela.Add('CHASSI');
  ACamposDaTabela.Add('PLACA');
  ACamposDaTabela.Add('STATUS_CONTRATO');
  ACamposDaTabela.Add('H_ENT');
  ACamposDaTabela.Add('DT_PROMETIDA');
  ACamposDaTabela.Add('H_PROMETIDA');
  ACamposDaTabela.Add('TIPO_OS');
  ACamposDaTabela.Add('SEQ_FECH');
  ACamposDaTabela.Add('DATVENC');
  ACamposDaTabela.Add('ST_TERM_SERV');
  ACamposDaTabela.Add('ATIVO');
  ACamposDaTabela.Add('TP_ABORD');
  ACamposDaTabela.Add('FR_PAGBOSCH');
  ACamposDaTabela.Add('COD_CLI_FAT');
  ACamposDaTabela.Add('COD_GERADOR');

  Result := ACamposDaTabela;
end;

function TReg_PedVenda.GetPagamentoNFCe: TReg_PedVendaPagamentoList;
var
  I, J: Integer;
  ANewPagamentoNFCe: Boolean;
begin
  if not Assigned(FPagamentoNFCe) then
  begin
    FPagamentoNFCe := TReg_PedVendaPagamentoList.Create;

    for I := 0 to FPagamento.Count - 1 do
    begin
      ANewPagamentoNFCe := True;
      for J := 0 to FPagamentoNFCe.Count - 1 do
        if (FPagamento.Items[I].Controle.codigo_ctrl = FPagamentoNFCe.Items[J].Controle.codigo_ctrl) and
          (FPagamento.Items[I].Controle.nfce_tpag = FPagamentoNFCe.Items[J].Controle.nfce_tpag) and
          (FPagamento.Items[I].Controle.nfce_tband = FPagamentoNFCe.Items[J].Controle.nfce_tband) and
          (FPagamento.Items[I].idTrCartao = FPagamentoNFCe.Items[J].idTrCartao) and
          (FPagamento.Items[I].guidTrCartao = FPagamentoNFCe.Items[J].guidTrCartao) then
        begin
          ANewPagamentoNFCe := False;
          FPagamentoNFCe.Items[J].valordoc := FPagamentoNFCe.Items[J].valordoc + FPagamento.Items[I].valordoc;
          Break;
        end;

      if ANewPagamentoNFCe  then
        with FPagamentoNFCe.New do
        begin
          seqform    := 0;
          ndoc       := '';
          tipdoc     := '';
          valordoc   := FPagamento.Items[I].valordoc;
          n_aut_cart := FPagamento.Items[I].n_aut_cart;
          data_mov   := FPagamento.Items[I].data_mov;
          prcss      := FPagamento.Items[I].prcss;
          idTrCartao := FPagamento.Items[I].idTrCartao;
          guidTrCartao := FPagamento.Items[I].guidTrCartao;
          Controle   := FPagamento.Items[I].Controle;
        end;
    end;

  end;
  Result := FPagamentoNFCe;
end;

{ TReg_PedVendaList }

function TReg_PedVendaList.GetItem(Index: integer): TReg_PedVenda;
begin
	Result := TReg_PedVenda(inherited Items[Index]);
end;

function TReg_PedVendaList.New: TReg_PedVenda;
begin
  Result := TReg_PedVenda.create;
  Add(Result);
end;

procedure TReg_PedVendaList.SetItem(Index: integer; const Value: TReg_PedVenda);
begin
	Put(Index, Value);
end;

{ TReg_PedVendaProd }

constructor TReg_PedVendaProd.create;
begin
  inherited;
//  Ftp_descacres := 'DESCONTO';
//  Fnat_descacres := 'PERCENTUAL';
  tp_nf_ped := '2';
  sit_atd := 'NT';
  md5 := 'sistema';
  precoporqtde := 'N';
  tabpraticada := 'N';
  Faux_cp_orc := TReg_PedVendaProd_AuxOrcCupom.Create;
end;

destructor TReg_PedVendaProd.Destroy;
begin
  if Assigned(Faux_cp_orc) then
    FreeAndNil(Faux_cp_orc);
  inherited;
end;

{ TClasseBaseList }

function TClasseBaseList.GetCamposDaTabela: TStringList;
begin
  raise Exception.Create('Implementação do método não feita');
end;

{ TClasseBase }

function TClasseBase.GetCamposDaTabela: TStringList;
begin
  raise Exception.Create('Implementação do método não feita');
end;

{ TReg_PedVendaPagamentoList }

function TReg_PedVendaPagamentoList.GetCamposDaTabela: TStringList;
var
  ACamposDaTabela: TStringList;
begin
	Result := NewStringList(true, StringReplace(TFormpagamento_class.GetFieldsSql(), ', ',',', [rfReplaceAll]), ',');
end;

function TReg_PedVendaPagamentoList.GetItem(
  Index: integer): TReg_PedVendaPagamento;
begin
	Result := TReg_PedVendaPagamento(inherited Items[Index]);
end;

function TReg_PedVendaPagamentoList.New: TReg_PedVendaPagamento;
begin
  Result := TReg_PedVendaPagamento.create;
  Add(Result);
end;

procedure TReg_PedVendaPagamentoList.SetItem(Index: integer;
  const Value: TReg_PedVendaPagamento);
begin
	Put(Index, Value);
end;

{ TReg_PedVendaPagamento }

constructor TReg_PedVendaPagamento.create;
begin
 FControle := TReg_PedVendaPagamento_Controle.Create;
end;

destructor TReg_PedVendaPagamento.Destroy;
begin
	if Assigned(FControle) then
    FreeAndNil(FControle);
  inherited;
end;

{ TReg_PedVendaPagamento_Controle }

constructor TReg_PedVendaPagamento_Controle.create;
begin
  FAdmCartao := TReg_PedVendaCliente.Create;
end;

destructor TReg_PedVendaPagamento_Controle.Destroy;
begin
  if Assigned(FAdmCartao) then
    FreeAndNil(FAdmCartao);
  inherited;
end;

{ TReg_PedVendaClienteEndedeco }

constructor TReg_PedVendaClienteEndedeco.create;
begin
  FCidade := TReg_PedVendaClienteEndedecoCidade.Create;
end;

destructor TReg_PedVendaClienteEndedeco.Destroy;
begin
  if Assigned(FCidade) then
    FreeAndNil(FCidade);
  inherited;
end;

{ TReg_PedVendaCliente }

constructor TReg_PedVendaCliente.create;
begin
  Fendereco := TReg_PedVendaClienteEndedeco.create;
end;

destructor TReg_PedVendaCliente.Destroy;
begin
  if Assigned(Fendereco) then
    FreeAndNil(Fendereco);
  inherited;
end;

{ TReg_PedVendaProd_AuxOrcCupom }

procedure TReg_PedVendaProd_AuxOrcCupom.clear(AItem: TReg_PedVendaProd);
begin
  FQtde_Disponivel := AItem.quant_ped_item;
  FQtde_ParaUsar   := 0;
  FDesc_Diponivel  := IfThen(AItem.rateio_desc > AItem.rateio_acresc, AItem.rateio_desc - AItem.rateio_acresc);
  FDesc_Usar       := 0;
  FAcres_Diponivel := IfThen(AItem.rateio_acresc > AItem.rateio_desc, AItem.rateio_acresc - AItem.rateio_desc);
  FAcres_Usar      := 0;
end;

{ TReg_PedVendaServList }

function TReg_PedVendaServList.GetCamposDaTabela: TStringList;
var
  ACamposDaTabela: TStringList;
begin
  Result := NewStringList(true, StringReplace(TPedVendaServ_Model.GetFieldsSql(), ', ',',', [rfReplaceAll]), ',');
end;

function TReg_PedVendaServList.GetItem(Index: integer): TReg_PedVendaServ;
begin
	Result := TReg_PedVendaServ(inherited Items[Index]);
end;

function TReg_PedVendaServList.New: TReg_PedVendaServ;
begin
	Result := TReg_PedVendaServ.create;
  Add(Result);
end;

procedure TReg_PedVendaServList.SetItem(Index: integer;
  const Value: TReg_PedVendaServ);
begin
	Put(Index, Value);
end;

procedure TReg_PedVendaServList.SetNew(Value: TReg_PedVendaServ);
begin
	Add(Value)
end;

{ TReg_PedVendaServ }

constructor TReg_PedVendaServ.create;
begin
	inherited;
end;

destructor TReg_PedVendaServ.Destroy;
begin
  inherited;
end;

end.
