unit faturamento_hw_class;

interface

uses
  Contnrs,
  IBQuery,
  DB,
  Classes,
  boletas_class,         
  CestVarianteMvaNcmUf_Model,         
  cod_barra_class,
  cond_pag_class,
  controles_class,
  conferencia_cega_class,
  config_sistema_class,
  clientes_class,
  estoque_ajuste_itens_class,
  formpagamento_class,
  hw_erro_class,
  hw_auditoria_class,
  hw_desoneracao_class,
  hw_prod_trib_ad_class,
  ibpt_class,
  mva_ajustada_ncm_class,
  nat_op_class,
  nbm_estado_class,
  nbm_class,
  notafiscal_class,
  notafiscal_item_class,
  notafiscal_pag_class,
  notafiscal_dup_class,
  notafiscal_sped_c110_class,
  notafiscal_sped_c113_class,
  notafiscal_sped_c114_class,
  notafiscal_sped_c195_c197_class,
  plano_pag_class,
  produtos_class,
  produtos_tmp_class,
  pedvenda_class,
  pedvenda_prod_class,
  pedvenda_serv_class,
  pedvenda_serv_terc_class,
  pedvenda_prod_terc_class,
  pedvenda_volumes_class,
  reducao_class,
  sped_informacao_complementar_class,
  tabela_processos_class,
  tipo_servico_class,
  tipo_vendas_class,
  tipo88_icmsst_periodo_class,
  vw_clientes_dest_class,
  opfiscal_confs,    
  opfiscal_model,  
  opfiscal_hw,
  hw_strings,
  uClasseConexao,
  uDadosIni,
  ConfigGlobalNF_RTC,
  SituacaoNFeEnumUnit,
  TributosDFeInMemoryHandler,
  TributoDFeContextEtdUnit,
  TributoDFeIbsCbsEtdUnit,
  TributoDFeImpostoSeletivoEtdUnit;

const
  pv_stsFechada   = 'FECHADA';
  pv_stsCancelado = 'CANCELADO';
  pv_stsAberta    = '';

  pv_orc   = 'ORC';
  pv_req   = 'REQ';
  pv_os    = 'OS';

  nf_natEntrada         = 'E';
  nf_natSaida           = 'S';

  nf_stsVazio           = '';
  nf_stsAberta          = 'Aberta';
  nf_stsFechada         = 'Fechada';
  nf_stsCancelada       = 'Cancelada';
  nf_stsPreNota         = 'Pre Nota';

  nf_strVerVazio = '';
  nf_strVer310   = '3.10';
  nf_strVer400   = '4.00';

  reg_sn    = 'SIMPLES';
  reg_sn_ex = 'SIMPLES / EXCESSO';
  reg_real  = 'LUCRO REAL';
  reg_pres  = 'LUCRO PRESUMIDO';

  tb_nf         = 'NOTAFISCAL';
  tb_nf_it      = 'NOTAFISCAL_ITEM';
  tb_nf_pag     = 'NOTAFISCAL_PAG';
  tb_nf_dup     = 'NOTAFISCAL_DUP';
  tb_nf_inf     = 'NOTAFISCAL_SPED_C110';
  tb_nf_ref_nf  = 'NOTAFISCAL_SPED_C113';
  tb_nf_ref_cp  = 'NOTAFISCAL_SPED_C114';
  tb_nf_ent_ret = 'NOTAFISCAL_SPED_C115';
  tb_nf_lanc_aj = 'NOTAFISCAL_SPED_C195_C197';
  tb_form_pag   = 'FORMPAGAMENTO';
  tb_boletos    = 'BOLETAS';

  sql_gencod = 'select cod from incrementa_codigo(%d, %s)';
  sql_n_nf_prod = 'NF_VENDA';
  sql_n_nf_hom  = 'NF_VENDA_HOM';

type
  NF_operacaoFrete = (nf_op_fr_conta_terc, nf_op_fr_conta_emit, nf_op_fr_conta_dest, nf_op_fr_sem_frete, nf_op_fr_nenhum);


  THw_pedvenda_class     = class;
  THw_pedvendas_class    = class;
  THw_notafiscal_class   = class;
  THw_notasfiscais_class = class;
  THw_faturamento        = class;

  THw_fbcon = class(TConexao)
  private
    Fbuscas: TIBQuery;
  public
    constructor Create;
    destructor Destroy; override;
    function sql_insert_build(Atable, Afields: string; AignoreFields: TStringList): string;

    property buscas: TIBQuery read Fbuscas write Fbuscas;
  end;

  THW_tabela_processos_classList = class(TTabela_processos_classList)
  private
    Fcon: THw_fbcon;
    procedure build_processos(const Aprocessos: array of string);
  public
    constructor Create(Acon: THw_fbcon; const Aprocessos: array of string);
    procedure build_processos_todos;
    function GetProcesso(Acod_processo: string): TTabela_processos_class;
  end;

  THw_ibpt_class = class(TIbpt_classList)
  public
    function get_ibpt(Ancm, Auf: string; Aex: Integer): TIbpt_class;
  end;

  THw_nbm_class = class(TNbm_classList)
  public
    function get_ncm(Ancm: string): TNbm_class;
  end;

  THw_mva_ajustada_ncm_class = class(TMva_ajustada_ncm_classList)
  public
    function get_mva_ajustada(Ancm: string): TMva_ajustada_ncm_class;
  end;

  THw_nbm_estado_class = class(TNbm_estado_classList)
  public
    function get_ncm_estado(Ancm: string): TNbm_estado_class;
  end;

  THw_nat_op_classList = class(TNat_op_classList)
  public
    function get_nat_op(Acfop: Double): TNat_op_class;
  end;

  THw_cod_barra_classList = class(TCod_barra_classList)
  public
    function GetEAN(Agrupo_prod: Integer; Acod_prod, prefixosInvalidosConfs: string): TCod_barra_class;
  end;

  THw_produtos_classList = class(TProdutos_classList)
  public
    function GetProduto(Agrupo_prod: Integer; Acod_prod: string): TProdutos_class;
    function ExisteProduto(grupo_prod: Integer; cod_prod: string): Boolean;
  end;

  THw_tipo_servico_classList = class(TTipo_servico_classList)
  public
    function GetServico(Acod_servico: Integer): TTipo_servico_class;
    function ExisteServico(cod_servico: Integer): Boolean;
  end;

  THw_produtos_tmp_classList = class(TProdutos_tmp_classList)
  public
    function GetProduto_tmp(Agrupo_prod: Integer; Acod_prod: string): TProdutos_tmp_class;
    function ExisteItem(grupo_prod: Integer; cod_prod: string): Boolean;
    procedure AddItem(grupo_prod: Integer; cod_prod, id_tmp: string; seqid, cod_empresa: Integer);
  end;

  THw_boletas_classList = class(TBoletas_classList)
  public
    class function GetFieldsSql(Aalias: string = ''): string;
  end;

  TConfigGlobalNF = class(TConfigGlobalNotaFiscal)
  private
    Fbuscas      : TIBQuery;
    procedure nf_s_lote_faturamento_check; override;

  public
    constructor Create(Abuscas: TIBQuery; Anatureza_nf: string);
    destructor Destroy; override;

    procedure ExecutarLeitura(Anatureza_nf: string = 'S');
    procedure ExecutarConferenciaVariaveis;
  end;

  THw_dados_uf_class = class(TObject)
  private
    Fpfcp          : Double;
    Faliq_intra    : Double;
    Fibge_codigo_uf: Integer;
    Finscricao     : string;
    Ficm_ext_c     : Double;
    Ficm_ext_nc    : Double;
    Fnatop_ext_c   : Double;
    Fnatop_ext_nc  : Double;
    Fnatop_int_c   : Double;
    Fnatop_int_nc  : Double;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function Clone: THw_dados_uf_class; virtual;

    property pfcp          : Double  read Fpfcp           write Fpfcp;
    property aliq_intra    : Double  read Faliq_intra     write Faliq_intra;
    property ibge_codigo_uf: Integer read Fibge_codigo_uf write Fibge_codigo_uf;
    property inscricao     : string  read Finscricao      write Finscricao;
    property icm_ext_c     : Double  read Ficm_ext_c      write Ficm_ext_c;
    property icm_ext_nc    : Double  read Ficm_ext_nc     write Ficm_ext_nc;
    property natop_ext_c   : Double  read Fnatop_ext_c    write Fnatop_ext_c;
    property natop_ext_nc  : Double  read Fnatop_ext_nc   write Fnatop_ext_nc;
    property natop_int_c   : Double  read Fnatop_int_c    write Fnatop_int_c;
    property natop_int_nc  : Double  read Fnatop_int_nc   write Fnatop_int_nc;
  end;

  THw_inf_compl = class(TSped_informacao_complementar_classList)
  public
    function get_sped_inf_compl(Atipo: string): TSped_informacao_complementar_class;
  end;

  THw_Controles = class(TControles_classList)
  public
    function get_controle(Acodigo_ctrl: Integer): TControles_class;
  end;  

  THw_nf_inf_compl = class(TNotafiscal_sped_c110_classList)
  public
    function New(Acod_inf: Integer): TNotafiscal_sped_c110_class; overload;
  end;

  THw_ref_nfce = class(TNotafiscal_sped_c113_classList)
  public
    function New(Achave_nfe_ref: string): TNotafiscal_sped_c113_class; overload;
  end;

  THw_ref_cupom_fiscal = class(TNotafiscal_sped_c114_classList)
  public
    function New(Aecf_fab, Acod_mod: string; Anum_doc, Aecf_cx: Integer; Adt_doc: TDateTime): TNotafiscal_sped_c114_class; overload;
  end;

  THw_notafiscal_pag = class(TNotafiscal_pag_classList)
  public
    function New(Apag: TNotafiscal_pag_class): TNotafiscal_pag_class; overload;
  end;

  THw_notafiscal_dup = class(TNotafiscal_dup_classList)
  end;

  THw_notafiscal_lan_aj = class(TNotafiscal_sped_c195_c197_classList)
  end;

  THw_notafiscal_item_desoneracao = class
  private
    Fpercentual_adicional_custeio: Double;
    Fvalor_adicional_custeio: Double;
  public
    property percentual_adicional_custeio: Double read Fpercentual_adicional_custeio write Fpercentual_adicional_custeio;
    property valor_adicional_custeio: Double read Fvalor_adicional_custeio write Fvalor_adicional_custeio;
  end;

  NotaFiscalItemImpostoSeletivo = class(TNotafiscal_item_class)
  end;

  THw_notafiscal_item_class = class(TNotafiscal_item_class)
  strict private
    itemTrib  : TItemTributos;
    itemFiscal: TItemFiscal;
    condFiscal: TCondicaoFiscal;
    tribIcms  : TIcmsTributavel;
    conf_bcnf : TStringIni;
    function ExecutarAjusteMVA(mvaValue, aliqInterValue, aliqIntraValue: Double): Double;
    function isMercHandleable(): Boolean;
    procedure HandleItemTribCreate;
  private
    FOwnerNF: THw_notafiscal_class;
    Fmerc   : TProdutos_class;
    Fserv   : TTipo_servico_class;
    Fpreco_compra_veiculo: Double;
    Fid_origem: string;
    FdadosDeson: THw_notafiscal_item_desoneracao;
    Ftipo_venda_veiculo: string;
//    FsaveUserAliqs: Boolean;
    FcalcIcmsActive: Boolean;
    FcalcIPIActive: Boolean;
    FcalcIcmsUfDestActive: Boolean;
    FcalcPISCOFINSActive: Boolean;
    FcalcISSActive: Boolean;
    FmanterRateio: Boolean;
    FcalcRetTribActive: Boolean;
    FtributosRTC: TributoDFeContextEtd;

    procedure SetTributosRTC(const Value: TributoDFeContextEtd);
    function frete_strto_operacao_frete: NF_operacaoFrete;
    function frete_usar_na_base_icms: Boolean;
    function operacao_interestadual_com_partilha_icms: Boolean;
  public
    constructor Create(AOwnerNF: THw_notafiscal_class);
    destructor Destroy; override;

    function get_cfop(Acfop: Double): Double;
    function get_reducao: Double;
    function get_tributacao_adicional: THw_prod_trib_ad_class;
    function get_tributacao_adicional_cliente: THw_prod_trib_ad_class;
    function get_desoneracao: THw_desoneracao_class;
    function get_csosn_ajutstado_por_cst: string;
    function get_cst_ajutstado_por_csosn: string;
    function get_itemFiscal: TItemFiscal;

    function obter_dados_prod(Amerc: TProdutos_class): Boolean;
    function obter_dados_serv(Aserv: TTipo_servico_class): Boolean;

    function dados_desoneracao_embutida_pedido: Boolean;

    function obter_dados_geral: Boolean;
    function obter_dados_cadastro: Boolean;
    function obter_dados_saida_prod: Boolean;
    function obter_dados_saida_serv: Boolean;
    function obter_dados_saida_veic: Boolean;
    function obter_dados_saida_outr: Boolean;
    function obter_dados_piscofins: Boolean;

    procedure calculo_ipi_executar;
    procedure calculo_piscofins_executar;
    procedure calculo_retencoes_executar;
    procedure calculo_icms_executar;
    procedure calculo_icms_dest_executar;
    procedure calculo_fcp_executar;
    procedure calculo_iss_executar;
    procedure calculo_tributos_executar;
    procedure calculo_tributos_rtc_executar;

    function validar_dados: Boolean;
    function validar_dados_saida: Boolean;
    function validar_dados_entrada: Boolean;
    procedure Totalizar();

    property operacao_frete      : NF_operacaoFrete                read frete_strto_operacao_frete;
    property preco_compra_veiculo: Double                          read Fpreco_compra_veiculo write Fpreco_compra_veiculo;
    property tipo_venda_veiculo  : string                          read Ftipo_venda_veiculo   write Ftipo_venda_veiculo;
    property id_origem           : string                          read Fid_origem            write Fid_origem;
    property merc                : TProdutos_class                 read Fmerc                 write Fmerc;
    property dadosDeson          : THw_notafiscal_item_desoneracao read FdadosDeson;
    property calcIcmsActive      : Boolean                         read FcalcIcmsActive       write FcalcIcmsActive;
    property calcIcmsUfDestActive: Boolean                         read FcalcIcmsUfDestActive write FcalcIcmsUfDestActive;
    property calcIPIActive       : Boolean                         read FcalcIPIActive        write FcalcIPIActive;
    property calcPISCOFINSActive : Boolean                         read FcalcPISCOFINSActive  write FcalcPISCOFINSActive;
    property calcISSActive       : Boolean                         read FcalcISSActive        write FcalcISSActive;
    property calcRetTribActive   : Boolean                         read FcalcRetTribActive    write FcalcRetTribActive;
    property manterRateio        : Boolean                         read FmanterRateio         write FmanterRateio;
    property tributosRTC         : TributoDFeContextEtd            read FtributosRTC          write SetTributosRTC;
  end;

  THw_notafiscal_itens_class = class(TObjectList)
  private
    FOwnerNF: THw_notafiscal_class;
    function GetItem(Index: Integer): THw_notafiscal_item_class;
    procedure SetItem(Index: Integer; const Value: THw_notafiscal_item_class);
  public
    constructor Create(AOwnerNF: THw_notafiscal_class);

    function New: THw_notafiscal_item_class; overload;
    function New(Aproduto: TProdutos_class): THw_notafiscal_item_class; overload;
    function getCfopItens: arrayInt;

    property Items[Index: Integer]: THw_notafiscal_item_class read GetItem write SetItem;
  end;

  THw_notafiscal_class = class(TNotafiscal_class)
  private
    FOwnerPV     : THw_pedvenda_class;
    FfreeCon     : Boolean;
    FOwnerFat    : THw_faturamento;
    Fcon         : THw_fbcon;
    Ferros       : THw_erro_classList;
    Fauditoria   : THw_auditoria_classList;
    Fcliente     : TClientes_class;
    Fdest_nf     : TVw_clientes_dest_class;
    Fitens       : THw_notafiscal_itens_class;
    Fcad_merc    : THw_produtos_classList;
    Fcad_cbarra  : THw_cod_barra_classList;
    Fdados_uf    : THw_dados_uf_class;
    Fcad_redu    : TReducao_classList;
    Fcad_trib    : THw_prod_trib_ad_classList;
    Fcad_deson   : THw_desoneracao_classList;
    Fcad_cfop    : THw_nat_op_classList;
    Fconf_nf     : TConfigGlobalNF;
    Fcad_ncm_dest: THw_nbm_estado_class;
    Fcad_ncm_loc : THw_nbm_class;
    Fcad_mva_aj  : THw_mva_ajustada_ncm_class;
    Fcad_serv    : THw_tipo_servico_classList;
    Fcad_ibpt    : THw_ibpt_class;
    Fcad_cest    : TCestsM;
    Fref_cp      : THw_ref_cupom_fiscal;
    Fref_nfce    : THw_ref_nfce;
    Finf_compl   : THw_nf_inf_compl;
    Fcad_inf_cpl : THw_inf_compl;
    Fdup         : THw_notafiscal_dup;
    Fpag         : THw_notafiscal_pag;
    Flog         : TConexao;
    Fvolumes_ped : TPedvenda_volumes_classList;
    Flanc_aj     : THw_notafiscal_lan_aj;
    Fcad_opfiscal: TCadItensTributos;
    ConfTripPC   : TConfTributo;  
    FTributos    : ITributosHandler;
    function GetUf_Operacao: string;
    procedure validacoes_nfe;

    function sql_fields_ignored_get(Atable: string): TStringList;

    procedure dados_obter_cliente(updateFields: Boolean = True);
    procedure dados_obter_ecommerce();
    procedure dados_obter_servicos(Aid_tmp: string; clearList: Boolean = False);//falta implementar
    procedure dados_obter_produtos(Aid_tmp: string; clearList: Boolean = False);
    procedure dados_obter_codbarra(Aid_tmp: string; clearList: Boolean = False);
    procedure dados_obter_reducaodebase(Aid_tmp: string; clearList: Boolean = False);
    procedure dados_obter_trib_adicional(Aid_tmp: string; Acod_cliente, Adest_seqid: Integer; clearList: Boolean = False);
    procedure dados_obter_desoneracao(Aid_tmp: string; clearList: Boolean = False);                           
    procedure dados_obter_nat_op(Aid_tmp: string; clearList: Boolean = False); overload;
    procedure dados_obter_nat_op(Aid_tmp: string; cfopsItens: array of Integer; clearList: Boolean = False); overload;
    procedure dados_obter_ncm_estado(Aid_tmp: string; clearList: Boolean = False);
    procedure dados_obter_mva_ajustada(Aid_tmp: string; clearList: Boolean = False);
    procedure dados_obter_ncm(Aid_tmp: string; clearList: Boolean = False);
    procedure dados_obter_ibpt(Aid_tmp: string; clearList: Boolean = False);
    procedure dados_obter_cest(Aid_tmp: string; clearList: Boolean = False);
    procedure dados_obter_opfiscal(Aid_tmp: string; clearList: Boolean = False);

    function NewInformacanComplementar(Atipo: string): TSped_informacao_complementar_class;
    function GetDhFatoGerador(): TDateTime;
    function GetAnoFatoGerador(): SmallInt;
  protected
    procedure build_nf_campos;
  public
    constructor Create(AOwner: THw_faturamento); overload;
    constructor Create(AOwner: THw_faturamento; AOwnerPedvenda: THw_pedvenda_class); overload;
    destructor Destroy; override;

    function pedvenda_montar(var Apedvenda: THw_pedvenda_class): Boolean;
    function pedvenda_atualizar(var Apedvenda: THw_pedvenda_class): Boolean;
    function notafiscal_calcular_item_individual(var Aitem: THw_notafiscal_item_class): THw_notafiscal_class;
    function notafiscal_calcular_completa_obterdados(id_tmp: string; prodsTmp: THw_produtos_tmp_classList; cfops: array of Integer; forceGetData: Boolean): THw_notafiscal_class;
    function ajuste_estoque_montar(Aid_tmp, Acst_icms: string; Aitens: TEstoque_ajuste_itens_classList): THw_notafiscal_class;
    function complemento_restituicao_montar(Aid_tmp: string): THw_notafiscal_class;
    procedure AtualizarOperacaoInternaIdPorTipoVenda(const TipoVenda, TipoSigla: string);

    function totais_somar: THw_notafiscal_class;
    function salvar(Acommit: Boolean = True): Boolean;
    function rateio_executar: THw_notafiscal_class;

    procedure restore_frete_conta_tr;

    //objetos auxiliares de mantenção e acesso a dados da classe
    property con       : THw_fbcon                     read Fcon        write Fcon;
    property erros     : THw_erro_classList            read Ferros      write Ferros;
    property conf_nf   : TConfigGlobalNF               read Fconf_nf    write Fconf_nf;

    //tabelas e views de referencia com a nota
    property cliente     : TClientes_class               read Fcliente      write Fcliente;
    property dest_nf     : TVw_clientes_dest_class       read Fdest_nf      write Fdest_nf;
    property itens       : THw_notafiscal_itens_class    read Fitens        write Fitens;
    property inf_compl   : THw_nf_inf_compl              read Finf_compl    write Finf_compl;
    property ref_cp      : THw_ref_cupom_fiscal          read Fref_cp       write Fref_cp;
    property ref_nfce    : THw_ref_nfce                  read Fref_nfce     write Fref_nfce;
    property pag         : THw_notafiscal_pag            read Fpag          write Fpag;
    property dup         : THw_notafiscal_dup            read Fdup          write Fdup;
    property lanc_aj     : THw_notafiscal_lan_aj         read Flanc_aj      write Flanc_aj;
    property cad_merc    : THw_produtos_classList        read Fcad_merc     write Fcad_merc;
    property cad_cbarra  : THw_cod_barra_classList       read Fcad_cbarra   write Fcad_cbarra;
    property cad_serv    : THw_tipo_servico_classList    read Fcad_serv     write Fcad_serv;
    property cad_redu    : TReducao_classList            read Fcad_redu     write Fcad_redu;
    property cad_trib    : THw_prod_trib_ad_classList    read Fcad_trib     write Fcad_trib;
    property cad_deson   : THw_desoneracao_classList     read Fcad_deson    write Fcad_deson;
    property cad_cfop    : THw_nat_op_classList          read Fcad_cfop     write Fcad_cfop;
    property cad_ncm_dest: THw_nbm_estado_class          read Fcad_ncm_dest write Fcad_ncm_dest;
    property cad_mva_aj  : THw_mva_ajustada_ncm_class    read Fcad_mva_aj   write Fcad_mva_aj;
    property cad_ncm_loc : THw_nbm_class                 read Fcad_ncm_loc  write Fcad_ncm_loc;
    property cad_ibpt    : THw_ibpt_class                read Fcad_ibpt     write Fcad_ibpt;
    property cad_inf_cpl : THw_inf_compl                 read Fcad_inf_cpl  write Fcad_inf_cpl;
    property cad_cest    : TCestsM                       read Fcad_cest     write Fcad_cest;
    property cad_opfiscal: TCadItensTributos             read Fcad_opfiscal write Fcad_opfiscal;
    property volumes_ped : TPedvenda_volumes_classList   read Fvolumes_ped  write Fvolumes_ped;

    //objetos montados para calcular
    property dados_uf  : THw_dados_uf_class            read Fdados_uf   write Fdados_uf;

    //outros
    property uf_operacao: string read GetUf_Operacao;
  end;

  THw_notasfiscais_class = class(TObjectList)
  private
    FOwner: THw_faturamento;
    Fconf_nf: TConfigGlobalNF;
    function GetItem(Index: Integer): THw_notafiscal_class;
    procedure SetItem(Index: Integer; const Value: THw_notafiscal_class);
  public
    constructor Create(AOwner: THw_faturamento);
    destructor Destroy; override;

    function New: THw_notafiscal_class; overload;
    function New(AOwnerPedvenda: THw_pedvenda_class): THw_notafiscal_class; overload;

    property Items[Index: Integer]: THw_notafiscal_class read GetItem  write SetItem;
    property conf_nf              : TConfigGlobalNF      read Fconf_nf write Fconf_nf;
  end;

  THw_pedvenda_class = class(TPedvenda_class)
  private
    FfreeCon  : Boolean;
    FOwner    : THw_pedvendas_class;
    FOwnerFat : THw_faturamento;
    Fcon      : THw_fbcon;
    Fauditoria: THw_auditoria_classList;
    Ferros    : THw_erro_classList;
    Fcliente  : TClientes_class;
    Ftipovenda: TTipo_vendas_class;
    Fconf_cega: TConferencia_cega_class;
    Fprod     : TPedvenda_prod_classList;
    Fserv     : TPedvenda_serv_classList;
    Ftprod    : TPedvenda_prod_terc_classList;
    Ftserv    : TPedvenda_serv_terc_classList;
    Fcad_merc : THw_produtos_classList;
    Fpag      : TPlano_pag_classList;
    Fformas   : TFormpagamento_classList;
    Fnf_base  : THw_notafiscal_class;
    FemMemoria: Boolean;
    Fboletos  : THw_boletas_classList;

    procedure validacao_permite_fechamento;
    procedure validacao_mobile_envio_pendente;
    procedure validacao_calculo_pendente;
    procedure validacao_aprova_gerencia_pendente;
    procedure validacao_aprova_fianceiro_pendente;
    procedure validacao_conferencia_cega_pendente;
    procedure validacao_almoxarifado_atendimento;
    procedure validacao_atualizar_dados_mercadorias;
    procedure validacao_formas_pagamento;
    procedure validacao_tributos_nf_obter;

  public
    constructor Create(AOwnerFat: THw_faturamento; AOwnerPV: THw_pedvendas_class);
    destructor Destroy; override;

    function validacao_atualizar_totais_itens(AsomarDespNF: Boolean = True): THw_pedvenda_class;

    function pedvenda_fechamento_validar: THw_pedvenda_class; //deve ser chamado antes de "pedvenda_fechamento_executar", caso Ferros.Count > 0 nao fechar; caso Fauditoria.Count > 0, validar na tela e socontinuar se for autorizado
    function pedvenda_fechamento_executar(Acommit: Boolean = True): THw_pedvenda_class;
    function pedvenda_dados_obter(Anped: Integer; Atipo: string; Acompletos: Boolean): THw_pedvenda_class; overload;
    function pedvenda_dados_obter(AdataPed, AdataProd: TDataSet): THw_pedvenda_class; overload;
    function pedvenda_dados_atualizar(AdataPed, AdataProd: TDataSet): THw_pedvenda_class; overload;
    function pedvenda_dados_nf_salvar(Acommit: Boolean = False): THw_pedvenda_class;

    property cliente  : TClientes_class                read Fcliente   write Fcliente;
    property tipovenda: TTipo_vendas_class             read Ftipovenda write Ftipovenda;
    property conf_cega: TConferencia_cega_class        read Fconf_cega write Fconf_cega;
    property prod     : TPedvenda_prod_classList       read Fprod      write Fprod;
    property serv     : TPedvenda_serv_classList       read Fserv      write Fserv;
    property tserv    : TPedvenda_serv_terc_classList  read Ftserv     write Ftserv;
    property tprod    : TPedvenda_prod_terc_classList  read Ftprod     write Ftprod;
    property pag      : TPlano_pag_classList           read Fpag       write Fpag;
    property formas   : TFormpagamento_classList       read Fformas    write Fformas;
    property boletos  : THw_boletas_classList          read Fboletos   write Fboletos;
    property erros    : THw_erro_classList             read Ferros     write Ferros;
    property cad_merc : THw_produtos_classList         read Fcad_merc  write Fcad_merc;
    property nf_base  : THw_notafiscal_class           read Fnf_base   write Fnf_base;
    property emMemoria: Boolean                        read FemMemoria write FemMemoria;
  end;

  THw_pedvendas_class = class(TObjectList)
  private
    FOwnerFat : THw_faturamento;
  public
    function GetItem(Index: Integer): THw_pedvenda_class;
    procedure SetItem(Index: Integer; const Value: THw_pedvenda_class);
  public
    constructor Create(AOwnerFat: THw_faturamento);
    destructor Destroy; override;
    function New: THw_pedvenda_class;

    property Items[Index: Integer]: THw_pedvenda_class read GetItem write SetItem;
  end;

  THw_faturamento = class(THw_fbcon)
  private
    Fpedidos  : THw_pedvendas_class;
    Fnotas    : THw_notasfiscais_class;
    Fauditoria: THw_auditoria_classList;
    Ferros    : THw_erro_classList;
    Fprocessos: THW_tabela_processos_classList;
    Floteprcs : Integer;

  public
    destructor Destroy; override;
    constructor Create;
    procedure gerar_lote_faturamento;
    procedure volumes_pedido_recalcular;

    function notafiscal_adicionar(Apedido: THw_pedvenda_class): THw_notafiscal_class;
    

    property pedidos  : THw_pedvendas_class            read Fpedidos   write Fpedidos;
    property notas    : THw_notasfiscais_class         read Fnotas     write Fnotas;
    property auditoria: THw_auditoria_classList        read Fauditoria write Fauditoria;
    property erros    : THw_erro_classList             read Ferros     write Ferros;
    property processos: THW_tabela_processos_classList read Fprocessos write Fprocessos;
    property loteprcs : Integer                        read Floteprcs  write Floteprcs;

  end;

implementation

uses
  SysUtils,
  uDtmAtivo,
  Math,
  StrUtils,
  DateUtils,
  funcoes,
  Windows,
  base_class,
  cest_mva_class,
  hw_utils,
  hw_pedido_cliente,
  gs1prefix,
  ContainerUnit,
  ResolverRegraFiscalIbsCbsTypesUnit,
  RegraFiscalIbsCbsEtdUnit,
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit,
  CalcularBaseCalculoModelUnit,
  ROCDomainUnit,
  EstadosServiceUnit,
  TributosDFeSerivceUnit,
  TributosDFeServiceTypes,
  TipoRegraTributoDFeEnumUnit,
  TributoDFeOrigemEnumUnit,
  TipoComunsUnit,
  ErpFeaturesFactoryUnit,
  OpInternaComTpVendaEtdUnit,
  StringNullableUnit, DFeEnums, FormatoImpressaoDANFeEnumUnit, CriadorCompraGovernamentalUtilsUnit, DFeTypesUnit;

function hw_ibpt_produtos_get( Banco, Usuario, Senha: WideString; CodEmpresa: Integer;
  cnpj, ncm, uf: WideString; ex: Integer): Integer; stdcall; external 'hw.utils.dx.dll';

{ THw_pedvendas_class }

constructor THw_pedvendas_class.Create(AOwnerFat: THw_faturamento);
begin
  inherited Create;
  FOwnerFat  := AOwnerFat;
end;

destructor THw_pedvendas_class.Destroy;
begin
  
  inherited;
end;

function THw_pedvendas_class.GetItem(Index: Integer): THw_pedvenda_class;
begin
  Result := THw_pedvenda_class(inherited Items[Index]);
end;

function THw_pedvendas_class.New: THw_pedvenda_class;
begin
  Result := THw_pedvenda_class.Create(FOwnerFat, Self);
  Add(Result);
end;

procedure THw_pedvendas_class.SetItem(Index: Integer; const Value: THw_pedvenda_class);
begin
  Put(Index, Value);
end;

{ THw_pedvenda_class }

function THw_pedvenda_class.pedvenda_dados_atualizar(AdataPed,
  AdataProd: TDataSet): THw_pedvenda_class;
var
  Atext: string;
  I: Integer;
  Atmpprod: THw_produtos_tmp_classList;
begin
  Result := Self;
  try
    Atext := Self.tipo + IfThen(Self.tipo = 'OS', Ftipovenda.tipo_os, IfThen(Self.tipo = 'ORC', Self.tipo_orc, Self.tipv));
    SetValuesFrom(AdataPed, True);

    if AdataPed.IsEmpty then
    begin
      Ferros.New('Sem registro nos parametros informados');
      Exit;
    end;

    if Fcliente.cod_cliente <> Self.cod_cliente then
      Fcliente.SetValuesFrom(Fcon.SqlOpen('select %s from clientes' +
                                          ' where cod_cliente = %d and cod_empresa = %s',
                                          [TClientes_class.GetFieldsSql(), cod_cliente, vDadosIni.codEmpresa]));

    Fprod.Clear;
    Fprod.SetValuesFrom(AdataProd, True);

    if (Atext <> Self.tipo + IfThen(Self.tipo = 'OS', Ftipovenda.tipo_os, IfThen(Self.tipo = 'ORC', Self.tipo_orc, Self.tipv))) then
      Ftipovenda.SetValuesFrom(Fcon.SqlOpen('select %s from tipo_vendas' +
                                            ' where tipo = %s and %s = %s',
                                            [TTipo_vendas_class.GetFieldsSql(), QuotedStr(tipo),
                                            IfThen(tipo = 'OS', 'tipo_os', 'sigla'),
                                            QuotedStr(IfThen(tipo = 'OS', tipo_os, IfThen(tipo = 'ORC', tipo_orc, tipv)))]));

    FemMemoria := True;
    Fcon.SqlExec('delete from produtos_tmp where id_tmp = %s', [QuotedStr(tipo + IntToStr(nped))]);

    Atmpprod := THw_produtos_tmp_classList.Create;
    for I := 0 to Pred(Fprod.Count) do if Fprod.Items[I].status <> pv_stsCancelado then
      if not Assigned(cad_merc.GetProduto(Fprod.Items[I].grupo_prod, Fprod.Items[I].cod_prod)) then
        with Atmpprod.New do
        begin
          id_tmp      := tipo + IntToStr(nped);
          seqid       := Succ(I); //Fprod.Items[I].nitem;
          cod_empresa := Fprod.Items[I].cod_empresa;
          grupo_prod  := Fprod.Items[I].grupo_prod;
          cod_prod    := Fprod.Items[I].cod_prod;
        end;
    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build('PRODUTOS_TMP',  TProdutos_tmp_class.GetFieldsSql(), nil);
    for I := 0 to Pred(Atmpprod.Count) do with Atmpprod.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Atmpprod.Items[I].SetValuesInParams(QrAux).ExecSQL;
    end;

    if Atmpprod.Count > 0 then
      Fcad_merc.SetValuesFrom(
        Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                     ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                     ' where pvp.id_tmp = %s',
                     [TProdutos_class.GetFieldsSql('pr'), QuotedStr(tipo + IntToStr(nped))]));

    for I := 0 to Pred(Fprod.Count) do with Fprod.Items[I] do
    begin
      rateio_desc := 0;
      rateio_acresc := 0;
    end;

    //validacao_atualizar_totais_itens;

  finally
    Fcon.QrAux.Close;
    if Assigned(Atmpprod) then FreeAndNil(Atmpprod);
  end;
end;

function THw_pedvenda_class.pedvenda_dados_nf_salvar(
  Acommit: Boolean): THw_pedvenda_class;
var
  I: Integer;
begin
  Result := Self;

  if tipo = pv_orc then Exit;

  if Ferros.Count > 0 then
    Exit;

  if not Assigned(nf_base) then
    Exit;
         
  if nf_base.erros.Count > 0 then
    Exit;

  try

    if num_nf = 0 then with Fcon do
    begin
      cont_alt := IfThen(cont_alt < 9999, cont_alt) + 1;
      SqlExec('update pedvenda set num_nf = %d, serie_nf = %s, data_nf = %s, valor_nf = %s' +
              ' where nped = %d and tipo = %s and cod_empresa = %d and coalesce(num_nf, 0) = 0',
              [nf_base.num_nf, QuotedStr(nf_base.serie), QuotedStr(FormatDateTime('mm/dd/yyyy', nf_base.data_lanc)),
              StringReplace(Format('%0.2f', [nf_base.valor_total]), ',', '.', []),
              nped, QuotedStr(tipo), cod_empresa]);
      if cont_alt <>  Fcon.SqlOpen('select cont_alt from pedvenda where nped = %d and tipo = %s and cod_empresa = %d',
                                   [nped, QuotedStr(tipo), cod_empresa]
                                   ).FieldByName('cont_alt').AsInteger then
      Ferros.New('Registro alterado por outro usuário').detalhe := 'Ao atribuir os dados da nota fiscal o sistema verificou que os dados do pedido foram alterados por outro usuário';
    end;

    for I := 0 to Pred(nf_base.itens.Count) do
      if (nf_base.itens.Items[I].nped > 0) and (nf_base.itens.Items[I].tipo_ped <> '') and (nf_base.itens.Items[I].tipo_item = 'P') and
         (nf_base.itens.Items[I].nped = Self.nped) and (nf_base.itens.Items[I].tipo_ped = Self.tipo) then with Fcon do
        SqlExec('update pedvenda_prod set n_nf = %d, serie = %s' +
                ' where nped = %d and tipo = %s and grupo_prod = %d and cod_prod = %s and nitem = %d' +
                ' and cod_grade = %d and cod_empresa = %d and codigo_nop = %d and n_nf is null',
                [nf_base.num_nf, QuotedStr(nf_base.serie), nf_base.itens.Items[I].nped, QuotedStr(nf_base.itens.Items[I].tipo_ped),
                 nf_base.itens.Items[I].grupo_prod, QuotedStr(nf_base.itens.Items[I].cod_prod),
                 nf_base.itens.Items[I].nitem_ped, nf_base.itens.Items[I].cod_grade, nf_base.itens.Items[I].cod_empresa,
                 Trunc(nf_base.itens.Items[I].codigo_nop)]);

    with Fcon do
    begin
      SqlExec('update formpagamento fp set' +
        ' fp.num_nota = %d , fp.sub_serie = %s, fp.tip_cnt = ''C'' '+
        ' where  ((fp.nrequisicao = %d and fp.tpdocs = %s) or' +
        '         (fp.rec_numvend = %d and fp.tpdocs <> ''LCS'' and fp.rec_tipvend = %s))' +
        ' and fp.cod_empresa = %d and fp.ativo = 1',
        [nf_base.num_nf, Trim(nf_base.serie), Self.nped, QuotedStr(Self.tipo),
         Self.nped, QuotedStr(Self.tipo), Self.cod_empresa]);

      SqlExec('update formpagamento fp set fp.ndoc = %s ' +
              '||substring(fp.ndoc from 7 for (char_length(fp.ndoc) - 6 ) )' +
              ' where  fp.nrequisicao = %d and fp.tpdocs = %s and fp.cod_empresa = %d' +
              ' and fp.ativo = 1 and fp.tipdoc = ''S2''' +
              ' and char_length(fp.ndoc) > 5',
              [QuotedStr(vDadosIni.StrZero(nf_base.num_nf, 6)), Self.nped,
               QuotedStr(Trim(Self.tipo)), Self.cod_empresa]);


      SqlOpen('select n_processamento from formpagamento fp'+
              ' where fp.nrequisicao = %d and fp.tpdocs = %s and fp.cod_empresa = %d' +
              ' and fp.ativo = 1 and fp.tipdoc = ''S2'' and fp.n_processamento > 0',
              [Self.nped, QuotedStr(Trim(Self.tipo)), Self.cod_empresa], buscas);
      while not buscas.Eof do
      begin
        SqlExec('update controle_creditos cc set cc.n_doc_c = %s ' +
                '||substring(cc.n_doc_c from 7 for (char_length(cc.n_doc_c) - 6 ) )' +
                ' where cc.cod_cred = %d and cc.%s = %d and char_length(cc.n_doc_c) > 5',
                [QuotedStr(vDadosIni.StrZero(nf_base.num_nf, 6)),
                 buscas.FieldByName('n_processamento').AsInteger,
                 IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP'),
                 Self.cod_empresa]);
        buscas.Next;
      end;
    end;

    if Acommit then
      if Fcon.Transacao.InTransaction then
        Fcon.Transacao.Commit;

  except on E: Exception do
    begin
      if Acommit then
        if Fcon.Transacao.InTransaction then
          Fcon.Transacao.Rollback;

      Ferros.New('Erro ao salvar dados da nf no pedido %d', [nped]).detalhe := E.Message;
      vDadosIni.registraErro('THw_pedvenda_class.pedvenda_dados_nf_salvar ' + e.Message);
    end;
  end;
end;

function THw_pedvenda_class.pedvenda_dados_obter(AdataPed,
  AdataProd: TDataSet): THw_pedvenda_class;
var
  Asql: string;
  Atbprod: THw_produtos_classList;
  I: Integer;
  Atmpprod: THw_produtos_tmp_classList;
begin
  Result := Self;
  try
    Fprod.Clear;
    Fserv.Clear;
    Ftprod.Clear;
    Ftserv.Clear;
    Fpag.Clear;
    Fformas.Clear;
    Fboletos.Clear;
    Fcad_merc.Clear;
    if Assigned(Fconf_cega) then
      FreeAndNil(Fconf_cega);
    Fconf_cega := TConferencia_cega_class.Create;

    SetValuesFrom(AdataPed, True);

    if AdataPed.IsEmpty then
    begin
      Ferros.New('Sem registro nos parametros informados');
      Exit;
    end;
    
//    if tipo <> 'REQ' then
//    begin
//      Ferros.New('Procedimento permitido apenas com pedidos. Tipo = "REQ"');
//      Exit;
//    end;

    Fcliente.SetValuesFrom(Fcon.SqlOpen('select %s from clientes' +
                                        ' where cod_cliente = %d and cod_empresa = %s',
                                        [TClientes_class.GetFieldsSql(), cod_cliente, vDadosIni.codEmpresa]));

    Fprod.SetValuesFrom(AdataProd, True);

    Ftipovenda.SetValuesFrom(Fcon.SqlOpen('select %s from tipo_vendas' +
                                          ' where tipo = %s and %s = %s',
                                          [TTipo_vendas_class.GetFieldsSql(), QuotedStr(tipo),
                                          IfThen(tipo = 'OS', 'tipo_os', 'sigla'),
                                          QuotedStr(IfThen(tipo = 'OS', tipo_os, IfThen(tipo = 'ORC', tipo_orc, tipv)))]));

    FemMemoria := True;
    if FemMemoria then
    begin
      Fcon.SqlExec('delete from produtos_tmp where id_tmp = %s', [QuotedStr(tipo + IntToStr(nped))]);

      Atmpprod := THw_produtos_tmp_classList.Create;
      for I := 0 to Pred(Fprod.Count) do if Fprod.Items[I].status <> pv_stsCancelado then
        if not Assigned(Atmpprod.GetProduto_tmp(Fprod.Items[I].grupo_prod, Fprod.Items[I].cod_prod)) then
          with Atmpprod.New do
          begin
            id_tmp      := tipo + IntToStr(nped);
            seqid       := Succ(I); //Fprod.Items[I].nitem;
            cod_empresa := Fprod.Items[I].cod_empresa;
            grupo_prod  := Fprod.Items[I].grupo_prod;
            cod_prod    := Fprod.Items[I].cod_prod;
          end;
      Fcon.QrAux.SQL.Text := Fcon.sql_insert_build('PRODUTOS_TMP',  TProdutos_tmp_class.GetFieldsSql(), nil);
      for I := 0 to Pred(Atmpprod.Count) do with Atmpprod.Items[I] do with Fcon do
      begin
        if not QrAux.Prepared then QrAux.Prepare;

        Atmpprod.Items[I].SetValuesInParams(QrAux).ExecSQL;
      end;

      Fcad_merc.SetValuesFrom(
        Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                     ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                     ' where pvp.id_tmp = %s',
                     [TProdutos_class.GetFieldsSql('pr'), QuotedStr(tipo + IntToStr(nped))]))
    end
    else
    begin
      Asql := '';
      Atbprod := THw_produtos_classList.Create;
      for I := 0 to Pred(Fprod.Count) do if Fprod.Items[I].status <> pv_stsCancelado then
        if not Assigned(Atbprod.GetProduto(Fprod.Items[I].grupo_prod, Fprod.Items[I].cod_prod)) then
        begin
          with Atbprod.New do
          begin
            grupo_prod := Fprod.Items[I].grupo_prod;
            cod_prod   := Fprod.Items[I].cod_prod;
          end;
          Asql := IfThen(Asql <> '', Asql + sLineBreak + ' union ' + sLineBreak) +
                  Format('select %s from produtos where grupo_prod = %d and cod_prod = %s and cod_empresa = %d',
                         [TProdutos_class.GetFieldsSql, grupo_prod, QuotedStr(cod_prod), cod_empresa]);
        end;
      if Asql <> '' then
        Fcad_merc.SetValuesFrom(Fcon.SqlOpen(Asql));
    end;

    if tipo = 'REQ' then
      if not Fcon.SqlOpen('select %s from conferencia_cega where tipo_conferencia = %s and num_doc = %d and cod_empresa = %d',
                          [TConferencia_cega_class.GetFieldsSql(), QuotedStr('PEDV'), nped, cod_empresa]).IsEmpty then
      Fconf_cega.SetValuesFrom(Fcon.QrAux);

    for I := 0 to Pred(Fprod.Count) do with Fprod.Items[I] do
    begin
      rateio_desc := 0;
      rateio_acresc := 0;
    end;

    validacao_atualizar_totais_itens;

  finally
    Fcon.QrAux.Close;
    if Assigned(Atbprod) then FreeAndNil(Atbprod);
    if Assigned(Atmpprod) then FreeAndNil(Atmpprod);    
  end;
end;

function THw_pedvenda_class.pedvenda_dados_obter(Anped: Integer;
  Atipo: string; Acompletos: Boolean): THw_pedvenda_class;
begin
  Result := Self;

  if (Atipo <> 'REQ') and (Atipo <> 'OS') then
  begin
    Ferros.New('Procedimento permitido apenas com pedidos. Tipo = "REQ"/"OS"');
    Exit;
  end;

  try
    Fprod.Clear;
    Fserv.Clear;
    Ftprod.Clear;
    Ftserv.Clear;
    Fpag.Clear;
    Fformas.Clear;
    Fboletos.Clear;
    Fcad_merc.Clear;
    if Assigned(Fconf_cega) then
      FreeAndNil(Fconf_cega);
    Fconf_cega := TConferencia_cega_class.Create;

    SetValuesFrom(Fcon.SqlOpen('select %s from pedvenda' +
                               ' where nped = %d and tipo = %s and cod_empresa = %s',
                               [TPedvenda_class.GetFieldsSql(), Anped, QuotedStr(Atipo), vDadosIni.codEmpresa]));

    if nped = 0 then
    begin
      Ferros.New('Sem registro com os parametros informados numero %d e tipo %s', [Anped, Atipo]);
      Exit;
    end;

    Fcliente.SetValuesFrom(Fcon.SqlOpen('select %s from clientes' +
                                        ' where cod_cliente = %d and cod_empresa = %s',
                                        [TClientes_class.GetFieldsSql(), cod_cliente, vDadosIni.codEmpresa]));

    if not Acompletos then
      Exit;

    Fprod.SetValuesFrom(Fcon.SqlOpen('select %s from pedvenda_prod' +
                                     ' where nped = %d and tipo = %s and cod_empresa = %s and coalesce(status, '''') <> %s order by nitem',
                                     [TPedvenda_prod_class.GetFieldsSql(), Anped, QuotedStr(Atipo), vDadosIni.codEmpresa, QuotedStr(pv_stsCancelado)]));

    Fserv.SetValuesFrom(Fcon.SqlOpen('select %s from pedvenda_serv' +
                                     ' where nped = %d and tipo = %s and cod_empresa = %s and coalesce(status, '''') <> %s order by nitem',
                                     [TPedvenda_serv_class.GetFieldsSql(), Anped, QuotedStr(Atipo), vDadosIni.codEmpresa, QuotedStr(pv_stsCancelado)]));

    Ftprod.SetValuesFrom(Fcon.SqlOpen('select %s from pedvenda_prod_terc' +
                                      ' where nped = %d and tipo = %s and cod_empresa = %s',
                                      [TPedvenda_prod_terc_class.GetFieldsSql(), Anped, QuotedStr(Atipo), vDadosIni.codEmpresa]));

    Ftserv.SetValuesFrom(Fcon.SqlOpen('select %s from pedvenda_serv_terc' +
                                      ' where nped = %d and tipo = %s and cod_empresa = %s',
                                      [TPedvenda_serv_terc_class.GetFieldsSql(), Anped, QuotedStr(Atipo), vDadosIni.codEmpresa]));          

    Ftipovenda.SetValuesFrom(Fcon.SqlOpen('select %s from tipo_vendas' +
                                          ' where tipo = %s and %s = %s',
                                          [TTipo_vendas_class.GetFieldsSql(), QuotedStr(tipo),
                                          IfThen(tipo = 'OS', 'tipo_os', 'sigla'),
                                          QuotedStr(IfThen(tipo = 'OS', tipo_os, IfThen(tipo = 'ORC', tipo_orc, tipv)))]));

    Fcad_merc.SetValuesFrom(
      Fcon.SqlOpen('select distinct %s from pedvenda pv' +
                   ' inner join pedvenda_prod pvp on (pv.nped = pvp.nped) and (pv.tipo = pvp.tipo) and (pv.cod_empresa = pvp.cod_empresa)' +
                   ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                   ' where pv.nped = %d and pv.tipo = %s and pv.cod_empresa = %d',
                   [TProdutos_class.GetFieldsSql('pr'), nped, QuotedStr(tipo), cod_empresa]));

    if tipo = 'REQ' then
      if not Fcon.SqlOpen('select %s from conferencia_cega where tipo_conferencia = %s and num_doc = %d and cod_empresa = %d',
                          [TConferencia_cega_class.GetFieldsSql(), QuotedStr('PEDV'), nped, cod_empresa]).IsEmpty then
      Fconf_cega.SetValuesFrom(Fcon.QrAux);

  finally          
    Fcon.QrAux.Close;
  end;
end;

function THw_pedvenda_class.pedvenda_fechamento_executar(
  Acommit: Boolean): THw_pedvenda_class;
  {$REGION 'consts com os campos ignorados'}
const 
  Aignore_fp: string = 'cod_banco,terceiros,n_conta_plc,prcss,agencia,conta,banco,cod_cli_terc,op_cxl,codigo_func,n_aut_cart,plano,' +
                       'ativo,nosso_numero_banco,recibo,ncoo_ecf,cod_terminal,nserieecf,registro,rec_tipvend,rec_numvend,n_processamento,' +
                       'ref_frete,cod_banco_str,vl_baixa_comissao,vl_baixa_comissao_ger,n_docnsu_adm,cod_terminal_adm,alterado,tef,nfce_tband,' +
                       'cod_gerador,ndoc_ant,cod_nfce,prg_fid';
  {$ENDREGION}
var
  I: Integer;
  Astr: string;
  ApvUpdate: TPedvenda_class;
begin
  Result := Self;

  if tipo = pv_orc then Exit;

  if Ferros.Count > 0 then
    Exit;

  try

    {$REGION 'atualizando dados do cliente, tipo de venda'}
    if not vDadosIni.strIn(IfThen(tipo = 'REQ', 'P', 'S'), vDadosIni.SplitA(Fcliente.tipocliente, ['|'])) then    
      Fcon.SqlExec('update clientes set tipocliente = %s where cod_cliente = %d and cod_empresa = %d and tipocliente = %s',
                   [QuotedStr('P|' + Fcliente.tipocliente), cod_cliente, cod_empresa, QuotedStr(Fcliente.tipocliente)]);
    {$ENDREGION}

    {$REGION 'procedimentos dos itens, custo, estoque, etc.'}
    Fcon.QrAux.Close;
    Fcon.QrAux.SQL.Text := 'update pedvenda_prod set rateio_desc = :rateio_desc, rateio_acresc = :rateio_acresc,' +
                           ' comiss_prod = :comiss_prod, comiss_prod_ger = :comiss_prod_ger, pcust_c = :pcust_c,' +
                           ' pcust_r = :pcust_r, pcust_mc = :pcust_mc, pcust_mr = :pcust_mr, icmant_sub = :icmant_sub' +
                           IfThen(Self.nf_ac_calctrib <> '', ', vl_desp_nf = :vl_desp_nf, nf_dc_despnf = :nf_dc_despnf') +
                           ' where nped = :nped and tipo = :tipo and grupo_prod = :grupo_prod and cod_prod = :cod_prod' +
                           ' and nitem = :nitem and cod_grade = :cod_grade and cod_empresa = :cod_empresa and codigo_nop = :codigo_nop';
    Fcon.buscas.Close;
    Fcon.buscas.SQL.Text := format('execute procedure movimenta_estoque(:grupo_prod, :cod_prod, %d, :cod_grade, 0, :saida, 1)', [cod_empresa]);
    for I := 0 to Pred(Fprod.Count) do if Fprod.Items[I].status <> pv_stsCancelado then with Fcon do
      if (Fprod.Items[I].status <> pv_stsCancelado) then
      begin
//        if not QrAux.Prepared then QrAux.Prepare;
//        Fprod.Items[I].SetValuesInParams(QrAux, True);
//          QrAux.ExecSQL;
        with Fprod.Items[I].SQLMotor() do
        begin
          Options.FieldsInInsertUpdate := fsNewDifOld;
          if HasChanges then
            Fcon.SqlExec(SQLUpdate, QrAux);
        end;

        {
        AitUpdate := TPedvenda_prod_class.Create;
        try
          AitUpdate.beginChanges;
          AitUpdate.nped            := Self.nped;
          AitUpdate.tipo            := Self.tipo;
          AitUpdate.cod_empresa     := Self.cod_empresa;
          AitUpdate.grupo_prod      := Fprod.Items[I].grupo_prod;
          AitUpdate.cod_prod        := Fprod.Items[I].cod_prod;
          AitUpdate.nitem           := Fprod.Items[I].nitem;
          AitUpdate.cod_grade       := Fprod.Items[I].cod_grade;
          AitUpdate.codigo_nop      := Fprod.Items[I].codigo_nop;

          AitUpdate.rateio_desc     := Fprod.Items[I].rateio_desc;
          AitUpdate.rateio_acresc   := Fprod.Items[I].rateio_acresc;
          AitUpdate.comiss_prod     := Fprod.Items[I].comiss_prod;
          AitUpdate.comiss_prod_ger := Fprod.Items[I].comiss_prod_ger;
          AitUpdate.pcust_c         := Fprod.Items[I].pcust_c;
          AitUpdate.pcust_r         := Fprod.Items[I].pcust_r;
          AitUpdate.pcust_mc        := Fprod.Items[I].pcust_mc;
          AitUpdate.pcust_mr        := Fprod.Items[I].pcust_mr;
          AitUpdate.icmant_sub      := Fprod.Items[I].icmant_sub;

          if Self.nf_ac_calctrib <> '' then
          begin
            AitUpdate.vl_desp_nf    := Fprod.Items[I].vl_desp_nf;
            AitUpdate.nf_dc_despnf  := Fprod.Items[I].nf_dc_despnf;
          end;

          with AitUpdate.SQLMotor() do
          begin
            Options.UpdateChangedOnly := True;
            SqlExec(Update);
          end;


        finally
          FreeAndNil(AitUpdate);
        end;
        }

        buscas.ParamByName('grupo_prod').AsInteger := Fprod.Items[I].grupo_prod;
        buscas.ParamByName('cod_prod').AsString    := Fprod.Items[I].cod_prod;
        buscas.ParamByName('cod_grade').AsInteger  := Fprod.Items[I].cod_grade;
        buscas.ParamByName('saida').AsFloat        := Fprod.Items[I].quant_ped_item;
        
        if not buscas.Prepared then buscas.Prepare;
        buscas.ExecSQL;
      end;
    {$ENDREGION}       

    {$REGION 'gravando as formas de pagamento'}
    if Fformas.Count > 0 then
    begin
      Astr := Format(sql_gencod, [cod_empresa, QuotedStr(tb_form_pag)]);
      for I := 0 to Pred(Fformas.Count) do with Fformas.Items[I] do with Fcon do
        seqform := SqlOpen(Astr).FieldByName('cod').AsInteger;

      Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_form_pag, TFormpagamento_class.GetFieldsSql(), vDadosIni.NewStringList(False, Aignore_fp, ','));
    end;

    for I := 0 to Pred(Fformas.Count) do with Fformas.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Fformas.Items[I].SetValuesInParams(Fcon.QrAux, True);
      SetParamVal('ndoc'     , ndoc, 20);
      SetParamVal('data_venc', data_venc, True);
      SetParamVal('tip_cnt'  , tip_cnt, 1);
      SetParamVal('num_nota' , num_nota);
      SetParamVal('nparcela' , nparcela);
      Fcon.QrAux.ExecSQL;
    end;


    {$ENDREGION}

    {$REGION 'gravando os boletos'}
    if Fboletos.Count > 0 then
    begin
      Astr := Format(sql_gencod, [cod_empresa, QuotedStr(tb_boletos)]);
      Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_boletos, THw_boletas_classList.GetFieldsSql(), nil);
      Fcon.QrAux.SQL.Text := StringReplace(Fcon.QrAux.SQL.Text, ':n_seq_bol', '(' + Astr + ')', [rfIgnoreCase]);
    end;

    for I := 0 to Pred(Fboletos.Count) do with Fboletos.Items[I] do with Fcon do
      if Assigned(Fformas) and (seqform <= Pred(Fformas.Count)) and (seqform >= 0) then
        seqform := Fformas.Items[seqform].seqform;

    for I := 0 to Pred(Fboletos.Count) do with Fboletos.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Fboletos.Items[I].SetValuesInParams(Fcon.QrAux, True);
      SetParamVal('cod_carga'      , cod_carga);
      SetParamVal('cod_controle_cx', cod_controle_cx);
      Fcon.QrAux.ExecSQL;
    end;
    {$ENDREGION}

    {$REGION 'efetuando o fechamento do pedido'}
    cont_alt := cont_alt + 1;
    vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(Fcon.buscas);

    ApvUpdate                  := TPedvenda_class.Create;
    ApvUpdate.beginChanges(True);
    ApvUpdate.nped             := Self.nped;
    ApvUpdate.tipo             := Self.tipo;
    ApvUpdate.cod_empresa      := Self.cod_empresa;

    if Self.nf_ac_calctrib <> '' then
    begin
      ApvUpdate.nf_ac_calctrib   := Self.nf_ac_calctrib;
      ApvUpdate.nf_ac_ipi        := Self.nf_ac_ipi;
      ApvUpdate.nf_ac_icmsst     := Self.nf_ac_icmsst;
      ApvUpdate.nf_ac_fcpst      := Self.nf_ac_fcpst;
      ApvUpdate.nf_ac_imposto_ii := Self.nf_ac_imposto_ii;
      ApvUpdate.nf_dc_vicmdeson  := Self.nf_dc_vicmdeson;
      ApvUpdate.nf_ac_vicmdeson  := Self.nf_ac_vicmdeson;
      ApvUpdate.desconto         := Self.desconto;
      ApvUpdate.acrescimo        := Self.acrescimo;
      ApvUpdate.acresc_p_prod    := Self.acresc_p_prod;
      ApvUpdate.valor_total      := Self.valor_total;
    end;

    ApvUpdate.status_ped       := pv_stsFechada;
    ApvUpdate.data_fech        := DateOf(vDadosIni.vDataHora);
    ApvUpdate.horafechamento   := HourOf(vDadosIni.vDataHora);
    ApvUpdate.minfechamento    := MinuteOf(vDadosIni.vDataHora);
    ApvUpdate.stat_req         := '';
    with ApvUpdate.SQLMotor() do
    begin
      Options.FieldsInInsertUpdate := fsNewdifOldAndPropertySet;// [muModified];//.UpdateChangedOnly := True;
      Fcon.SqlExec(SQLUpdate);
    end;

    {
    Fcon.QrAux.Close;
    Fcon.QrAux.SQL.Text := Format('update pedvenda set data_fech = :data_fech, status_ped = %s,' +
                                  ' horafechamento = %d, minfechamento = %d, stat_req = %s' +
                                  ' where nped = %d and tipo = %s and cod_empresa = %d',
                                  [QuotedStr(pv_stsFechada), HourOf(vDadosIni.vDataHora), MinuteOf(vDadosIni.vDataHora),
                                   QuotedStr(''), nped, QuotedStr(tipo), cod_empresa]);
    Fcon.QrAux.ParamByName('data_fech').AsDate := DateOf(vDadosIni.vDataHora);
    if not Fcon.QrAux.Prepared then Fcon.QrAux.Prepare;
    Fcon.QrAux.ExecSQL;
    }

    if cont_alt <>  Fcon.SqlOpen('select cont_alt from pedvenda where nped = %d and tipo = %s and cod_empresa = %d',
                                  [nped, QuotedStr(tipo), cod_empresa]
                                 ).FieldByName('cont_alt').AsInteger then
      Ferros.New('Registro alterado por outro usuário').detalhe := 'Durante o processo o sistema verificou que os dados do pedido foram alterados por outro usuário';
    {$ENDREGION}

    vDadosIni.informarSituacaoPedido(nped, tipo, 'PEDIDO', 'Finalizado', '', Fcon.QrAux, False, False);

    {$REGION 'programa fidelidade'}
    if not vDadosIni.setarPontosProgFidelidade(Self.nped, Self.tipo, Fcon.QrAux, False, 0, '', False, False) then
      Ferros.New('Erro ao atribuir pontos (ndoc: %d tipo: %s)', [Self.nped, Self.tipo]);
    {$ENDREGION}

    if Acommit then
      if Fcon.Transacao.InTransaction then
      begin
        Fcon.Transacao.Commit;

        status_ped     := pv_stsFechada;
        data_fech      := DayOf(vDadosIni.vDataHora);
        horafechamento := HourOf(vDadosIni.vDataHora);
        minfechamento  := MinuteOf(vDadosIni.vDataHora);
        stat_req       := '';

        vDadosIni.GravaAuditoria('VND060', 'CONFIRMAR', Format('CONFIRMAR REQUISICAO - CONFIRMADA %s Nº %d', [tipo, nped]),
                            'PEDVENDA', IntToStr(nped), Fcon.QrAux);
      end;

  except on E: Exception do
    begin
      if Acommit then
        if Fcon.Transacao.InTransaction then
          Fcon.Transacao.Rollback;

      Ferros.New('Erro na confirmação do pedido %d', [nped]).detalhe := E.Message;
      vDadosIni.registraErro('THw_pedvenda_class.salvar ' + e.Message);
    end;
  end;
end;

function THw_pedvenda_class.pedvenda_fechamento_validar: THw_pedvenda_class;
begin
  Result := Self;

  Ferros.Clear;
  try
    if tipo = pv_orc then
      raise Exception.Create('Orçamento não é confirmado');

    if tipo = pv_os then
      raise Exception.Create('Ordem de serviço não é confirmada por aqui');

    if Ftipovenda.configfechvnd = 'F' then
      raise Exception.Create('Tipo de venda configurado para não fechar');

    if vDadosIni.strIn(vDadosIni.vUsarPlano, ['S', '2']) then
      raise Exception.Create('Empresa utiliza plano de pagamento. Processo não pode continuar');

    with Fauditoria.New do
    begin
      cod_processo := 'VND060';
      acao         := 'CONFIRMAR';
      mensagem     := Format('CONFIRMAR %s Nº %d', [tipo, nped]);
      tabela       := 'PEDVENDA';
      codigo       := IntToStr(nped);
      gravar       := True;
    end;

    if FOwnerFat.processos.Count = 0 then
      FOwnerFat.processos.build_processos_todos;

    validacao_permite_fechamento;

    validacao_mobile_envio_pendente;

    validacao_calculo_pendente;

    validacao_aprova_gerencia_pendente;

    validacao_aprova_fianceiro_pendente;

    validacao_conferencia_cega_pendente;

    validacao_almoxarifado_atendimento;

    validacao_atualizar_dados_mercadorias;

    validacao_tributos_nf_obter;

    validacao_atualizar_totais_itens;

    validacao_formas_pagamento;

  except on E: Exception do
    begin
      Ferros.New('Validacao sem sucesso').detalhe := 'Motivo/Erro: ' + e.Message;
    end;
  end;
end;

procedure THw_pedvenda_class.validacao_atualizar_dados_mercadorias;
var
  I: Integer;
  Amerc: TProdutos_class;
  Aitem: TPedvenda_prod_class;
  Aproc: TTabela_processos_class;
begin
  for I := 0 to Fprod.Count - 1 do if Fprod.Items[I].status <> pv_stsCancelado then
  begin
    Aitem := Fprod.Items[I];
    Amerc := Fcad_merc.GetProduto(Aitem.grupo_prod, Aitem.cod_prod);
    Aitem.beginChanges;

    if Assigned(Amerc) then
    begin
      if (Amerc.comissao_prod = 0) then
      begin
        Aproc := FOwnerFat.processos.GetProcesso('VND158');

        if not Assigned(Aproc) then
        begin
          Ferros.New.erro := 'Processo VND158 não definido na tabela de processos';
          Exit;
        end
        else if Aproc.nivel_processo > vDadosIni.vNivel then
          with Fauditoria.New do
          begin
            cod_processo := 'VND159';
            acao         := 'VALIDAR';
            mensagem     := Format('%s - %d - Item: %d - PERMITIR VND DE PROD SEM PERC. DE COMISSAO: %s', [tipo, nped, Aitem.nitem, Aitem.descr_prod_ped]);
            tabela       := 'PEDVENDA';
            codigo       := Format('%d/%d', [Aitem.nped, Aitem.nitem]);
            gravar       := True;
          end;
      end;

      if (Amerc.comissao_prod > 0) or (Amerc.comissao_prod_ger > 0) then
      begin
        Aitem.comiss_prod := IfThen(Amerc.comissao_prod > 0,
                                    (Aitem.vltot_ped_item + Aitem.rateio_acresc - Aitem.rateio_desc - Aitem.vl_desp_nf) * Amerc.comissao_prod / 100);
        Aitem.comiss_prod_ger := IfThen(Amerc.comissao_prod_ger > 0,
                                        (Aitem.vltot_ped_item + Aitem.rateio_acresc - Aitem.rateio_desc - Aitem.vl_desp_nf) * Amerc.comissao_prod_ger / 100);
      end;

      Aitem.pcust_c    := Amerc.prec_cus_prod;
      Aitem.pcust_r    := Amerc.prec_cusr_prod;
      Aitem.pcust_mc   := Amerc.prec_cusm_prod;
      Aitem.pcust_mr   := Amerc.prec_cusmr_prod;
      Aitem.icmant_sub := Amerc.icmant_sub
    end;
  end;
end;

function THw_pedvenda_class.validacao_atualizar_totais_itens(AsomarDespNF: Boolean): THw_pedvenda_class;
var
  I, J: Integer;
  Amerc: TProdutos_class;

  Asum_prod_desc_item  , Asum_serv_desc_item: Double;
  Asum_prod_acresc_item, Asum_serv_acresc_item: Double;
  Asum_prod, Asum_serv , Asum_tprod, Asum_tserv: Double;
  Asum_prod_perm_desc: Double;

  Acalc_prod_acresc, Acalc_serv_acresc: Double;
  Acalc_prod_desc, Acalc_serv_desc: Double;

  Arat_prod_desc, Arat_serv_desc: Double;
  Arat_prod_acres, Arat_serv_acres: Double;

  Asum_prod_desc_rat, Asum_serv_desc_rat: Double;
  Asum_prod_acresc_rat, Asum_serv_acresc_rat: Double;

  Avalor, Adesconto, Adiferenca: Double;

  AlastIdx, AlastIdxA: Integer;
  Ait: TPedvenda_prod_class;
begin
  Result := Self;

  {$REGION 'somando, calculando'}

  Asum_prod_desc_item   := 0;
  Asum_prod_acresc_item := 0;
  Asum_prod             := 0;
  Asum_prod_perm_desc   := 0;

  for I := 0 to Fprod.Count - 1 do with Fprod.Items[I] do
    if status <> pv_stsCancelado then
    begin
      Amerc := Fcad_merc.GetProduto(grupo_prod, cod_prod);
      if not Assigned(Amerc) then
        Amerc := TProdutos_class.Create;

      Asum_prod_desc_item   := Asum_prod_desc_item   + desc_item;
      Asum_prod_acresc_item := Asum_prod_acresc_item + acresc_item;
      Asum_prod             := Asum_prod             + vltot_ped_item;

      if (Amerc.permitir_desconto <> 'N') and
        (Amerc.em_promocao <> 'S') and
        ((vDadosIni.strIn(tabpraticada, ['P', 'T', 'Q']) and (max_desc_tab > 0)) or
        (not vDadosIni.strIn(tabpraticada, ['P', 'T', 'Q']))) then
        Asum_prod_perm_desc := Asum_prod_perm_desc + vltot_ped_item;
    end;

  Asum_serv_desc_item   := 0;
  Asum_serv_acresc_item := 0;
  Asum_serv             := 0;
  for I := 0 to Fserv.Count - 1 do with Fserv.Items[I] do
    if status <> pv_stsCancelado then
    begin
      Asum_serv_desc_item   := Asum_serv_desc_item   + desc_item;
      Asum_serv_acresc_item := Asum_serv_acresc_item + acresc_item;
      Asum_serv             := Asum_serv             + valor_tot_serv;
    end;
  Asum_serv             := IfThen(Asum_serv = 0, tot_serv, Asum_serv);

  Acalc_prod_acresc := RoundTo( acresc_p_prod * Asum_prod / 100, -2);
  Acalc_serv_acresc := RoundTo( acresc_p_serv * Asum_serv / 100, -2);

  Acalc_prod_desc := RoundTo( desc_p_prod * Asum_prod_perm_desc / 100, -2);
  Acalc_serv_desc := RoundTo( desc_p_serv * Asum_serv           / 100, -2);

  if (Asum_prod_perm_desc + Asum_serv) > 0 then
  begin
    Avalor := desconto - nf_dc_vicmdeson;//valor real do desconto concedido fora o imposto;
    Arat_prod_desc := RoundTo( Asum_prod_perm_desc / (Asum_prod_perm_desc + Asum_serv) * Avalor, -2);
    Arat_serv_desc := RoundTo( Avalor - Arat_prod_desc, -2);
  end
  else
  begin
    Arat_prod_desc := 0;
    Arat_serv_desc := 0;
  end;

  if (Asum_prod + Asum_serv) > 0 then
  begin
    Avalor := acrescimo - (//nf_ac_seguro +
                           //nf_ac_outras +
                           //nf_ac_frete +
                           nf_ac_ipi +
                           nf_ac_icmsst +
                           nf_ac_fcpst +
                           nf_ac_imposto_ii +
                           nf_ac_vicmdeson);
    Arat_prod_acres := RoundTo( Asum_prod / (Asum_prod + Asum_serv) * Avalor, -2);
    Arat_serv_acres := RoundTo( Avalor - Arat_prod_acres, -2);
  end;

  {$ENDREGION}

  {$REGION 'validando valores'}

  Avalor    := Asum_prod_perm_desc + Asum_serv;
  Adesconto := Asum_prod_desc_item + Asum_serv_desc_item + Acalc_prod_desc + Acalc_serv_desc + (desconto - nf_dc_vicmdeson);

  if (Adesconto > 0) and ((Avalor) <= (Adesconto)) then
    Ferros.New('Desconto total maior ou igual que o permitido').
      detalhe := Format('Total de produtos que permitem desconto: %n', [Asum_prod_perm_desc]) + sLineBreak +
                 Format('Total de serviços: %n'      , [Asum_serv]) + sLineBreak +
                 Format('Total dos descontos: %n', [Asum_prod_desc_item + Asum_serv_desc_item +
                                                    Acalc_prod_desc + Acalc_serv_desc +
                                                    desconto]);

  Adesconto := Asum_prod_desc_item + Acalc_prod_desc + Arat_prod_desc;
  if (Adesconto > 0) and (Asum_prod > 0) and (Asum_prod_perm_desc <= ( Adesconto )) then
    Ferros.New('Desconto em produtos maior ou igual que o permitido').
      detalhe := Format('Total de produtos: %n', [Asum_prod_perm_desc]) + sLineBreak +
                 Format('Total que permitem desconto: %n', [Asum_prod_perm_desc]) + sLineBreak +
                 IfThen(Asum_prod_desc_item > 0, Format('Total de descontos por item: %n', [Asum_prod_desc_item]) + sLineBreak) +
                 IfThen(Acalc_prod_desc     > 0, Format('Total de descontos no cabeçalho em percentual: %n', [Acalc_prod_desc]) + sLineBreak) +
                 IfThen(Arat_prod_desc      > 0, Format('Total de descontos no cabeçalho em valor: %n', [Arat_prod_desc]) + sLineBreak) +
                 Format('Total de descontos: %n', [Asum_prod_desc_item + Acalc_prod_desc + Arat_prod_desc]);

  Adesconto := Asum_serv_desc_item + Acalc_serv_desc + Arat_serv_desc;
  if (Adesconto > 0) and (Asum_serv > 0) and (Asum_serv <= ( Adesconto )) then
    Ferros.New('Desconto em serviços maior ou igual que o permitido').
      detalhe := Format('Total de serviços: %n', [Asum_serv]) + sLineBreak +
                 IfThen(Asum_serv_desc_item > 0, Format('Total de descontos por item: %n', [Asum_serv_desc_item]) + sLineBreak) +
                 IfThen(Acalc_serv_desc     > 0, Format('Total de descontos no cabeçalho em percentual: %n', [Acalc_serv_desc]) + sLineBreak) +
                 IfThen(Arat_serv_desc      > 0, Format('Total de descontos no cabeçalho em valor: %n', [Arat_serv_desc]) + sLineBreak) +
                 Format('Total de descontos: %n', [Asum_serv_desc_item + Acalc_serv_desc + Arat_serv_desc]);

  {$ENDREGION}

  {$REGION 'aplicando valores '}

  tot_prod      := Asum_prod;
  tot_serv      := Asum_serv;
  tot_prod_terc := Asum_tprod;
  tot_serv_terc := Asum_tserv;

  valor_total := (tot_prod + tot_serv + tot_prod_terc + tot_prod_terc) +
                 (Asum_prod_acresc_item + Asum_serv_acresc_item + Acalc_prod_acresc + Acalc_serv_acresc + acrescimo) -
                 (Asum_prod_desc_item   + Asum_serv_desc_item   + Acalc_prod_desc   + Acalc_serv_desc   + desconto);

  Asum_prod_desc_rat   := 0;
  Asum_prod_acresc_rat := 0;
  for I := 0 to Fprod.Count - 1 do with Fprod.Items[I] do
    if status <> pv_stsCancelado then
    begin
      Amerc := Fcad_merc.GetProduto(grupo_prod, cod_prod);
      Ait := Fprod.Items[I];
      if not Assigned(Amerc) then
        Amerc := TProdutos_class.Create;

      rateio_desc := 0;
      if (Amerc.permitir_desconto <> 'N') and
        (Amerc.em_promocao <> 'S') and
        ((vDadosIni.strIn(tabpraticada, ['P', 'T', 'Q']) and (max_desc_tab > 0)) or
        (not vDadosIni.strIn(tabpraticada, ['P', 'T', 'Q']))) then
        begin
          AlastIdx := I;
          rateio_desc      := RoundTo( (Arat_prod_desc + Acalc_prod_desc  ) / Asum_prod_perm_desc * vltot_ped_item, -2);
        end;

      rateio_acresc        := RoundTo( (Arat_prod_acres + Acalc_prod_acresc) / Asum_prod * vltot_ped_item, -2);
      Asum_prod_desc_rat   := Asum_prod_desc_rat   + rateio_desc;
      Asum_prod_acresc_rat := Asum_prod_acresc_rat + rateio_acresc;

      rateio_desc   := rateio_desc   + desc_item   + IfThen(AsomarDespNF, nf_dc_despnf);
      rateio_acresc := rateio_acresc + acresc_item + IfThen(AsomarDespNF, vl_desp_nf);

      AlastIdxA := I;
    end;

   if (RoundTo(Arat_prod_desc  + Acalc_prod_desc  , -2) <> RoundTo(Asum_prod_desc_rat  , -2)) then
   begin
     Adiferenca := RoundTo(Arat_prod_desc + Acalc_prod_desc, -2) - RoundTo(Asum_prod_desc_rat, -2);
     //for I := Pred(Fprod.Count) downto 0 do with Fprod.Items[I] do if rateio_desc > 0 then
     for I := 0 to Pred(Fprod.Count) do with Fprod.Items[I] do if rateio_desc > 0 then
       begin

         if (Adiferenca + rateio_desc) < 0 then
         begin
           Adiferenca := Adiferenca + rateio_desc;
           rateio_desc := 0;
         end
         else
         begin
           rateio_desc := rateio_desc + Adiferenca;
           Adiferenca := 0;
         end;
         if Adiferenca = 0 then
           Break;
       end;
   end;

   if (RoundTo(Arat_prod_acres + Acalc_prod_acresc, -2) <> RoundTo(Asum_prod_acresc_rat, -2)) then
   begin
     Adiferenca := RoundTo(Arat_prod_acres + Acalc_prod_acresc, -2) - RoundTo(Asum_prod_acresc_rat, -2);
     //for I := Pred(Fprod.Count) downto 0 do with Fprod.Items[I] do if rateio_acresc > 0 then
     for I := 0 to Pred(Fprod.Count) do with Fprod.Items[I] do if rateio_acresc > 0 then
       begin

         if (Adiferenca + rateio_acresc) < 0 then
         begin
           Adiferenca := Adiferenca + rateio_acresc;
           rateio_acresc := 0;
         end
         else
         begin
           rateio_acresc := rateio_acresc + Adiferenca;
           Adiferenca := 0;
         end;
         if Adiferenca = 0 then
           Break;
       end;
   end;

//   if (RoundTo(Arat_prod_desc  + Acalc_prod_desc  , -2) <> RoundTo(Asum_prod_desc_rat  , -2)) then with Fprod.Items[AlastIdx] do
//     rateio_desc := rateio_desc + (RoundTo(Arat_prod_desc  + Acalc_prod_desc  , -2) - RoundTo(Asum_prod_desc_rat  , -2));
//   if (RoundTo(Arat_prod_acres  + Acalc_prod_acresc  , -2) <> RoundTo(Asum_prod_acresc_rat  , -2)) then with Fprod.Items[AlastIdx] do
//     rateio_acresc := rateio_acresc + (RoundTo(Arat_prod_acres  + Acalc_prod_acresc  , -2) - RoundTo(Asum_prod_acresc_rat  , -2));

  Asum_serv_desc_rat   := 0;
  Asum_serv_acresc_rat := 0;
  for I := 0 to Fserv.Count - 1 do with Fserv.Items[I] do
    if status <> pv_stsCancelado then
    begin
      rateio_desc          := RoundTo( (Arat_serv_desc  + Acalc_serv_desc  ) / Asum_serv * valor_tot_serv, -2);
      rateio_acresc        := RoundTo( (Arat_serv_acres + Acalc_serv_acresc) / Asum_serv * valor_tot_serv, -2);
      Asum_serv_desc_rat   := Asum_serv_desc_rat   + rateio_desc;
      Asum_serv_acresc_rat := Asum_serv_acresc_rat + rateio_acresc;
    end;

   if (RoundTo(Arat_serv_desc  + Acalc_serv_desc  , -2) <> RoundTo(Asum_serv_desc_rat  , -2)) then 
   begin
     Adiferenca := RoundTo(Arat_serv_desc + Acalc_serv_desc, -2) - RoundTo(Asum_serv_desc_rat, -2);
     //for I := Pred(Fserv.Count) downto 0 do with Fserv.Items[I] do if rateio_desc > 0 then
     for I := 0 to Pred(Fserv.Count) do with Fserv.Items[I] do if rateio_desc > 0 then
       begin

         if (Adiferenca + rateio_desc) < 0 then
         begin
           Adiferenca := Adiferenca + rateio_desc;
           rateio_desc := 0;
         end
         else
         begin
           rateio_desc := rateio_desc + Adiferenca;
           Adiferenca := 0;
         end;
         if Adiferenca = 0 then
           Break;
       end;
   end;

   if (RoundTo(Arat_serv_acres + Acalc_serv_acresc, -2) <> RoundTo(Asum_serv_acresc_rat, -2)) then 
   begin
     Adiferenca := RoundTo(Arat_serv_acres + Acalc_serv_acresc, -2) - RoundTo(Asum_serv_acresc_rat, -2);
     //for I := Pred(Fserv.Count) downto 0 do with Fserv.Items[I] do if rateio_acresc > 0 then
     for I := 0 to Pred(Fserv.Count) do with Fserv.Items[I] do if rateio_acresc > 0 then
       begin

         if (Adiferenca + rateio_acresc) < 0 then
         begin
           Adiferenca := Adiferenca + rateio_acresc;
           rateio_acresc := 0;
         end
         else
         begin
           rateio_acresc := rateio_acresc + Adiferenca;
           Adiferenca := 0;
         end;
         if Adiferenca = 0 then
           Break;
       end;
   end;
//   if (RoundTo(Arat_serv_desc  + Acalc_serv_desc  , -2) <> RoundTo(Asum_serv_desc_rat  , -2)) then with Fserv.Items[AlastIdx] do
//     rateio_desc := rateio_desc - (RoundTo(Arat_serv_desc  + Acalc_serv_desc  , -2) - RoundTo(Asum_serv_desc_rat  , -2));
//   if (RoundTo(Arat_serv_acres + Acalc_serv_acresc, -2) <> RoundTo(Asum_serv_acresc_rat, -2)) then with Fserv.Items[AlastIdx] do
//     rateio_acresc := rateio_acresc - (RoundTo(Arat_serv_acres + Acalc_serv_acresc, -2) - RoundTo(Asum_serv_acresc_rat, -2));

  {$ENDREGION}

end;

constructor THw_pedvenda_class.Create(AOwnerFat: THw_faturamento; AOwnerPV: THw_pedvendas_class);
begin
  inherited Create;
  FfreeCon := not Assigned(AOwnerFat);
  if Assigned(AOwnerFat) then
  begin
    Fcon       := AOwnerFat;
    FOwnerFat  := AOwnerFat;
    Fauditoria := FOwnerFat.auditoria;
    Ferros     := THw_erro_classList.Create(FOwnerFat.erros);
  end
  else
  begin
    Fcon       := THw_fbcon.Create;
    Fauditoria := THw_auditoria_classList.Create;
    Ferros     := THw_erro_classList.Create;
  end;
  FOwner     := AOwnerPV;
  Fcliente   := TClientes_class.Create;
  Ftipovenda := TTipo_vendas_class.Create;
  Fprod      := TPedvenda_prod_classList.Create;
  Fserv      := TPedvenda_serv_classList.Create;
  Ftprod     := TPedvenda_prod_terc_classList.Create;
  Ftserv     := TPedvenda_serv_terc_classList.Create;
  Fpag       := TPlano_pag_classList.Create;
  Fformas    := TFormpagamento_classList.Create;
  Fboletos   := THw_boletas_classList.Create;

  Fcad_merc  := THw_produtos_classList.Create;
  FemMemoria := False;
end;

destructor THw_pedvenda_class.Destroy;
begin
  if (FfreeCon) then 
  begin
    if Assigned(Fauditoria) then FreeAndNil(Fauditoria);
    if Assigned(Fcon)       then FreeAndNil(Fcon);
    if Assigned(Ferros)     then FreeAndNil(Ferros);
  end;
  if Assigned(Fcliente)   then FreeAndNil(Fcliente);
  if Assigned(Ftipovenda) then FreeAndNil(Ftipovenda);
  if Assigned(Fconf_cega) then FreeAndNil(Fconf_cega);
  if Assigned(Fprod)      then FreeAndNil(Fprod);
  if Assigned(Fserv)      then FreeAndNil(Fserv);
  if Assigned(Ftprod)     then FreeAndNil(Ftprod);
  if Assigned(Ftserv)     then FreeAndNil(Ftserv);    
  if Assigned(Fpag)       then FreeAndNil(Fpag); 
  if Assigned(Fformas)    then FreeAndNil(Fformas);
  if Assigned(Fboletos)   then FreeAndNil(Fboletos);
  if Assigned(Fcad_merc)  then FreeAndNil(Fcad_merc);
  inherited;
end;

procedure THw_pedvenda_class.validacao_almoxarifado_atendimento;
var
  I: Integer;
  Adoit: Boolean;
begin
  if tipo <> pv_req then Exit;

  if vDadosIni.vEmp.vAlmox <> 'S1' then Exit;

  Adoit := False;
  for I := 0 to Pred(Fprod.Count) do with Fprod.Items[I] do
    if Adoit then
      Break
    else
      Adoit := (Fprod.Items[I].status <> 'CANCELADO') and (sit_atd = 'NT');

  if Adoit then
    with Ferros.New('Atenção! Existe(m) produto(s) sem antendimento') do
      for I := 0 to Pred(Fprod.Count) do with Fprod.Items[I] do
        if (status <> 'CANCELADO') and (sit_atd = 'NT') then
          detalhe := detalhe +
                     Format('%d-%s-%s %s - QTDE: %n', [grupo_prod, cod_prod, num_fab_prod, descr_prod_ped, quant_ped_item]) + sLineBreak;
end;

procedure THw_pedvenda_class.validacao_aprova_fianceiro_pendente;
begin
  if tipo <> pv_req then Exit;

  if (Fcliente.usar_liberacao_financeiro = 'S') or (Ftipovenda.usar_liberacao_financeiro = 'S') then
    if autorizado_financeiro <> 'S' then
      Ferros.New('Aguardando autorização do Financeiro');
end;

procedure THw_pedvenda_class.validacao_aprova_gerencia_pendente;
begin
  if tipo <> pv_req then Exit;

  if vDadosIni.vEmp.vVnd_AprovacaoGerente = 'S' then
    if (Ftipovenda.usar_liberacao_gerente = 'S') and (aprovada_gerente <> 'S') then
      Ferros.New('Aguardando autorização da Gerencia');
end;

procedure THw_pedvenda_class.validacao_calculo_pendente;
begin
  if (saveauto <> 'S') or
     (calc = 'N') then
    Exit;

  if us_edit > 0 then
    Ferros.New('Registro está sendo alterado por outro usuário');
end;

procedure THw_pedvenda_class.validacao_conferencia_cega_pendente;
begin
  if Fconf_cega.cod_conferencia = 0 then
    Exit;

  if Fconf_cega.status <> pv_stsFechada then
    Ferros.New('Conferência cega ABERTA');
end;

procedure THw_pedvenda_class.validacao_formas_pagamento;
var
  Adouble: Double;
  I: Integer;  
  Aformas, Acondpag: string;
  Acpg: TCond_pag_class;
  Apag: TPlano_pag_class;
  Actrls: THw_Controles;
  Actrl : TControles_class;
  Acond_pag_montar_parcelamento: Tcond_pag_montar_parcelamento;
  Aparcelas: RParcelamentos;
  Afp: TFormpagamento_class;
  J: Integer;
  Andoc_bol: Smallint;
  Aproc: TTabela_processos_class;
  Abol: TBoletas_class;
  AgerarBol: Boolean;
begin
  Fformas.Clear;
  if vDadosIni.vEmp.vModoFaturamento = 'S' then  Exit;

  try

    Fpag.Clear;
    Fpag.SetValuesFrom(Fcon.SqlOpen('select %s from plano_pag' +
                                    ' where nrequisicao = %d and tpdocs = %s and cod_empresa = %d order by seqplano',
                                     [TPlano_pag_class.GetFieldsSql(), nped, QuotedStr(tipo), cod_empresa]));

    Actrls := THw_Controles.Create;
    Actrls.Clear;    

    vDadosIni.vDataBanco := vDadosIni.getDataBanco(Fcon.buscas);

    if Fpag.Count > 0 then
      Actrls.SetValuesFrom(Fcon.SqlOpen('select %s from plano_pag pg' +
                                        ' inner join controles ct on ct.codigo_ctrl = pg.cod_controle and ct.codigo_emp = pg.cod_empresa' +
                                        ' where pg.nrequisicao = %d and pg.tpdocs = %s and pg.cod_empresa = %d',
                                        [TControles_class.GetFieldsSql('ct'), nped, QuotedStr(tipo), cod_empresa]))
    else if (cod_controle > 0) then
    begin
      Actrls.SetValuesFrom(Fcon.SqlOpen('select %s from controles where codigo_ctrl = %d  and codigo_emp = %d',
                                        [TControles_class.GetFieldsSql(''), cod_controle, cod_empresa]));
      Actrl := Actrls.get_controle(Self.cod_controle);
      if not Assigned(Actrl) then
        Ferros.New('Forma de pagamento %d informada na venda não encontrada no cadastro', [Self.cod_controle]);
      
      with Fpag.New do
      begin
        cod_controle := Self.cod_controle;
        valordoc     := Self.valor_total;
        if Assigned(Actrl) then
          if Actrl.docs = 'S1' then          
            data_venc    := Self.data_fech + 2;
        //configuracao aqui pra cheques ou
      end;
    end;

    {$REGION 'validação dos controles permitidos'}
    Aformas  := vDadosIni.ReplaceMult(Fcliente.controles_fp, [' ', '(', ')'], ',');
    Acondpag := vDadosIni.ReplaceMult(Fcliente.cond_pag_vnd, [' ', '(', ')'], ',');
    Adouble := 0;
    if Fpag.Count > 0 then
      for I := 0 to Pred(Fpag.Count) do
      begin
        Apag := Fpag.Items[I];

        Adouble := Adouble + Apag.valordoc;

        if Trim(Aformas) <> '' then
          if not vDadosIni.strIn(IntToStr(Apag.cod_controle), vDadosIni.SplitA(Aformas, [',' , '(', ')'])) then
            Ferros.New('Controle %d não permitido para o cliente', [Apag.cod_controle]).detalhe := Format('Permitidos: %s', [Fcliente.controles_fp]);
      end;    
    {$ENDREGION}
                       
    if Ferros.Count > 0 then
      Exit;

    Andoc_bol := 0;
    for I := 0 to Pred(Fpag.Count) do 
    begin
      Apag := Fpag.Items[I];
      SetLength(Aparcelas, 0);

      Actrl := Actrls.get_controle(Apag.cod_controle);
      if Assigned(Actrl) then
      begin
        if vDadosIni.strIn(Actrl.docs, ['N', 'S1']) then
        begin
          SetLength(Aparcelas, 1);
          Aparcelas[High(Aparcelas)].ValorParcela   := Apag.valordoc;
          Aparcelas[High(Aparcelas)].DataVencimento := Apag.data_venc;
        end
        else //S2
        begin                      
          {$REGION 'obtendo o parcelamento'}
          if vDadosIni.vCadBasicos.AHandle = 0 then
            CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);

          if vDadosIni.vCadBasicos.AHandle = 0 then
            Ferros.New('Pacote de Cadastros básicos não carregado').detalhe := 'Para montar o parcelamento este pacote deve ser carregado';
                 
          @Acond_pag_montar_parcelamento := GetProcAddress(vDadosIni.vCadBasicos.AHandle, PChar('cond_pag_montar_parcelamento'));
          if Assigned(Acond_pag_montar_parcelamento) then
            Aparcelas := Acond_pag_montar_parcelamento(cod_cond_pag, '', Apag.valordoc, IntToStr(IfThen(num_nf > 0, num_nf, nped)), '', '', '', '',
                                                       cod_cliente, 0, 0, Apag.cod_controle, 0, True)
          else
            SetLength(Aparcelas, 0);
          //Ferros.New('apenas para testar acima').detalhe := 'Testar o modo silent do metodo e o dia de vencimento';

          if Actrl.usar_boleto = 'S' then
            for J := Low(Aparcelas) to High(Aparcelas) do
            begin
              Andoc_bol := Andoc_bol + 1;
              AParcelas[J].NumeroDocumento := vDadosIni.StrZero(IfThen(num_nf > 0, num_nf, nped), 6) + '-' + IntToStr(Andoc_bol);
            end;

          if Length(Aparcelas) <= 0 then
          begin
            Acpg := TCond_pag_class.Create;
            try
              Acpg.SetValuesFrom(Fcon.SqlOpen('select %s from cond_pag where cod_cond_pag = %d',
                                              [TCond_pag_class.GetFieldsSql(), cod_cond_pag]));
              Ferros.New('Controle %d deve gerar documentos(S2). A condição %d - %s não gerou nenhuma parcela',
                         [Apag.cod_controle, Acpg.cod_cond_pag, Acpg.desc_cond_pag]);
            finally
              if Assigned(Acpg) then FreeAndNil(Acpg);
            end;
          end;
          {$ENDREGION}
        end;

        {$REGION 'criando as formas de pagamento'}

        {$REGION 'validando geracao de boletos'}
        AgerarBol := False;
        if (Actrl.usar_boleto = 'S') and (vDadosIni.vEmp.vImprimirBoletoOS = 'S') then
          if Fcon.SqlOpen('select n_seq_bol from boletas' +
                          ' where num_nf_vnd = %d and tipo_emissao = %s and cod_cliente = %d and cod_empresa = %d',
                          [Self.nped, QuotedStr(Self.tipo), Self.cod_cliente, Self.cod_empresa]).IsEmpty then
          begin
            Aproc := FOwnerFat.processos.GetProcesso('FPG036');
            if not Assigned(Aproc) then
            begin
              Ferros.New.erro := 'Processo FPG036 não definido na tabela de processos';
              Exit;
            end
            else if (Length(Aparcelas) > 0) and (Aproc.nivel_processo <= vDadosIni.vNivel) then
            begin
              AgerarBol := Aproc.nivel_processo <= vDadosIni.vNivel;
              with Fauditoria.New do
              begin
                cod_processo := 'FPG036';
                acao         := 'VALIDAR';
                mensagem     := Format('NDOC: %d TP: %s', [Self.nped, Self.tipo]);
                tabela       := 'FORMPAGAMENTO';
                gravar       := True;
              end;
            end;
          end;
        {$ENDREGION}

        for J := Low(Aparcelas) to High(Aparcelas) do
        begin
          Afp                  := Fformas.New;
          Afp.cod_empresa      := cod_empresa;
          Afp.nrequisicao      := nped;
          Afp.ndoc             := IfThen(Actrl.docs = 'S2', Aparcelas[J].NumeroDocumento);
          Afp.tipdoc           := Actrl.docs;
          Afp.cod_controle     := Apag.cod_controle;
          Afp.cliente          := Fcliente.nome_cliente;
          Afp.cod_cliente      := cod_cliente;
          Afp.historico        := Format('CRÉDITOS A RECEBER CONFORME REQ Nº %d', [nped]);
          Afp.data_mov         := vDadosIni.vDataBanco;
          Afp.valordoc         := Aparcelas[J].ValorParcela;
          Afp.tpdocs           := tipo;
          Afp.data_venc        := Aparcelas[J].DataVencimento;
          Afp.operador         := cod_vendedor;
          Afp.tip_cnt          := IfThen(num_nf > 0, 'C');
          Afp.num_nota         := num_nf;
          Afp.sub_serie        := StrToIntDef(serie_nf, 0);
          Afp.secao            := I + 1;
          Afp.valor_contabil   := Afp.valordoc;
          Afp.us_cad           := vDadosIni.vCodUsuario;
          Afp.nparcela         := IfThen(Afp.tipdoc = 'S2', J + 1);
          Afp.nao_gera_finan   := IfThen(Actrl.nao_gera_finan = 'S', 'S', 'N');
          Afp.baixa_automatica := IfThen(Actrl.baixa_automatica = 'S', 'S', 'N');
          Afp.md5              := 'SISTEMA';

          {$REGION 'criando boletos'}
          if (Actrl.usar_boleto = 'S') and (AgerarBol) then
          begin
            Abol                 := Fboletos.New;
            Abol.cod_empresa     := Self.cod_empresa;
            Abol.num_nf_vnd      := Self.nped;
            Abol.tipo_emissao    := Self.tipo;
            Abol.cod_carga       := Self.cod_carga;
            Abol.sub_serie       := 0;
            Abol.obs_bol1        := Format('%s %d', [Self.tipo, Self.nped]);
            Abol.cod_cliente     := Self.cod_cliente;
            Abol.data_em_bol     := vDadosIni.vDataBanco;
            Abol.data_ven_bol    := Afp.data_venc;
            Abol.n_doc_bol       := Afp.ndoc;
            Abol.vl_doc_bol      := Afp.valordoc;
            Abol.cod_controle_cx := Afp.cod_controle;
            Abol.seqform         := Pred(Fformas.Count);
          end;
          {$ENDREGION}
        end;
        {$ENDREGION}
      end;
    end;
    
  finally
    if Assigned(Actrls) then
    begin
      Actrls.Clear;
      FreeAndNil(Actrls);
    end;
  end;
end;

procedure THw_pedvenda_class.validacao_mobile_envio_pendente;
begin
  if (tipo <> pv_req) or
     (idmobile = 0) or
     (env_mobile = 'S') or
     (status_ped = pv_stsFechada) or
     (status_ped = pv_stsCancelado) then
    Exit;

  with Fauditoria.New do
  begin
    cod_processo := 'VND173';
    acao         := 'VALIDAR';
    mensagem     := Format('MOBILE %d ENVIO %s', [idmobile, env_mobile]);
    tabela       := 'PEDVENDA';
    gravar       := True;
  end;
end;

procedure THw_pedvenda_class.validacao_permite_fechamento;
begin
  if status_ped <> pv_stsAberta then
    Ferros.New('Pedido está %s', [status_ped]);
end;

procedure THw_pedvenda_class.validacao_tributos_nf_obter;
var
  Anota: THw_notafiscal_class;
  I, J: Integer;
  Aitped: TPedvenda_prod_class;
  Aitnf: THw_notafiscal_item_class;
begin
  if Self.nf_ac_calctrib = '' then
    Exit;

  Anota := THw_notafiscal_class.Create(FOwnerFat, Self);
  try
    Anota.totais_somar;

    if Self.nf_ac_calctrib = 'N' then
      Self.nf_ac_calctrib := 'S'; 

    Self.nf_ac_ipi        := Anota.valor_ipi;
    Self.nf_ac_icmsst     := Anota.valor_icmsub;
    Self.nf_ac_fcpst      := Anota.fcp_vfcpst;
    Self.nf_ac_imposto_ii := Anota.valor_ii;
    Self.nf_dc_vicmdeson  := Anota.vicmdeson + Anota.vpisdeson + Anota.vcofinsdeson;
    Self.nf_ac_vicmdeson  := 0;

    for I := 0 to Self.prod.Count - 1 do
    begin
      Aitped               := Self.prod.Items[I];
      Aitped.beginChanges;
      Aitped.vl_desp_nf    := 0;
      Aitped.nf_dc_despnf  := 0;
      for J := 0 to Anota.itens.Count - 1 do
      begin
        Aitnf := Anota.itens.Items[J];

        if (Aitnf.nped = Aitped.nped) and (Aitnf.nitem_ped = Aitped.nitem) then
        begin
          Self.nf_ac_vicmdeson := Self.nf_ac_vicmdeson + RoundTo(Aitnf.dadosDeson.valor_adicional_custeio, -2);
          Aitped.vl_desp_nf    := Aitnf.valor_ipi + Aitnf.valor_icmsub + Aitnf.fcp_vfcpst + Aitnf.valor_ii + RoundTo(Aitnf.dadosDeson.valor_adicional_custeio , -2);
          Aitped.nf_dc_despnf  := Aitnf.vicmdeson + Aitnf.vpisdeson + Aitnf.vcofinsdeson;
          Aitped.nf_ac_des_emb := Aitnf.dadosDeson.valor_adicional_custeio;
        end;
      end;
    end;

    Self.acrescimo := Self.nf_ac_seguro +
                      Self.nf_ac_outras +
                      Self.nf_ac_frete +
                      Self.nf_ac_ipi +
                      Self.nf_ac_icmsst +
                      Self.nf_ac_fcpst +
                      Self.nf_ac_imposto_ii +
                      Self.nf_ac_vicmdeson;

    Self.acresc_p_prod := 0;
    Self.desconto      := Self.nf_dc_desconto + Self.nf_dc_vicmdeson;

  finally
    FreeAndNil(Anota);
    Self.nf_base := nil; // isso daqui pois causa erro no fechamento em lote, lembrando que este metodo apenas será chamando
                         // durante a requisicao aberta e ao fechar a requisição pela tela do lote
  end;
end;

{ THw_faturamento }

constructor THw_faturamento.Create;
begin
  inherited Create;

  Fpedidos   := THw_pedvendas_class.Create(Self);
  Fnotas     := THw_notasfiscais_class.Create(Self);
  Fauditoria := THw_auditoria_classList.Create;
  Ferros     := THw_erro_classList.Create;
  Fprocessos := THW_tabela_processos_classList.Create(Self, []);
end;

destructor THw_faturamento.Destroy;
begin
  if Assigned(Fpedidos) then
  begin
    Fpedidos.Clear;
    FreeAndNil(Fpedidos);
  end;

  if Assigned(Fnotas) then
  begin
    Fnotas.Clear;
    FreeAndNil(Fnotas);
  end;

  if Assigned(Fauditoria) then
  begin
    Fauditoria.Clear;
    FreeAndNil(Fauditoria);
  end;

  if Assigned(Ferros) then
  begin
    Ferros.Clear;
    FreeAndNil(Ferros);
  end;

  if Assigned(Fprocessos) then
  begin
    Fprocessos.Clear;
    FreeAndNil(Fprocessos);
  end;

  inherited;
end;

procedure THw_faturamento.gerar_lote_faturamento;
begin
  try
    Floteprcs := SqlOpen(sql_gencod, [StrToInt(vDadosIni.codEmpresa), QuotedStr('NOTAFISCAL_LOTE_FAT')]).FieldByName('COD').AsInteger;
  finally
    if Transacao.InTransaction then
      Transacao.Commit;
  end;
end;

function THw_faturamento.notafiscal_adicionar(
  Apedido: THw_pedvenda_class): THw_notafiscal_class;
var
  I: Integer;
begin
  if not Fnotas.conf_nf.inicializado then
    Fnotas.conf_nf.ExecutarLeitura;

  if (vDadosIni.vEmp.vUsarUmaVendaPorNF = 'S') then
    Fnotas.conf_nf.Conf_Lote.agrupar_por_cliente := False;

  for I := 0 to Pred(Fnotas.Count) do with Fnotas.Items[I] do
    if ((nped = Apedido.nped) and (tipo_ped = Apedido.tipo)) or //mesmo pedido
       ((Fnotas.conf_nf.Conf_Lote.agrupar_por_cliente) and (cod_cliente = Apedido.cod_cliente) and (dest_seqid = Apedido.dest_seqid)) then //mesmo cliente e config ativa
    begin
      Result := Fnotas.Items[I];
      Result.pedvenda_montar(Apedido);
      Exit;
    end;

  Result := Fnotas.New(Apedido);
end;

procedure THw_faturamento.volumes_pedido_recalcular;
var
  Anped: Integer;
  Atipo: string;
  I, K: Integer;
begin
  for I := 0 to Pred(Fnotas.Count) do
    for K := 0 to Pred(Fnotas.Items[I].volumes_ped.Count) do with Fnotas.Items[I].volumes_ped.Items[K] do
    begin
      Anped := nped;
      Atipo := tipo;

      SetValuesFrom(SqlOpen('select first 1 %s from pedvenda_volumes' +
                            ' where nped = %d and tipo = %s and cod_empresa = %s',
                            [TPedvenda_volumes_class.GetFieldsSql(), Anped, QuotedStr(Atipo), vDadosIni.codEmpresa]));
      nped := Anped;
      tipo := Atipo;
    end;

  for I := 0 to Pred(Fnotas.Count) do with Fnotas.Items[I] do
  begin
    qtde_volumes_tr := 0;
    especie_tr      := '';
    marca_tr        := '';
    numero_tr       := '';
    peso_b          := 0;
    peso_l          := 0;

    for K := Pred(volumes_ped.Count) downto 0 do with Fnotas.Items[I].Fvolumes_ped.Items[K] do
      if qvol > 0 then      
      begin
        qtde_volumes_tr := qtde_volumes_tr + qvol;
        especie_tr      := esp;
        marca_tr        := marca;
        numero_tr       := nvol;
        peso_b          := peso_b + pesob;
        peso_l          := peso_l + pesol;
      end;

    if qtde_volumes_tr = 0 then
      for K := 0 to Pred(itens.Count) do
      begin
        peso_b := itens.Items[K].peso_b * itens.Items[K].quantidade;
        peso_l := itens.Items[K].peso_l * itens.Items[K].quantidade;
      end;
  end;
end;

{ THW_tabela_processos_classList }

procedure THW_tabela_processos_classList.build_processos(
  const Aprocessos: array of string);
var
  Acod_processo: string;
  Aprcss: TStrings;
  I: Integer;
  //Aok: Boolean;
begin
  Aprcss := vDadosIni.NewStringList(True);
  try
    for Acod_processo in Aprocessos do
      if not Assigned(GetProcesso(Acod_processo)) then
        Aprcss.Add(Acod_processo);

    if Aprcss.Count = 0 then
      Exit;

    Acod_processo := '';
    for I := 0 to Pred(Aprcss.Count) do
      Acod_processo := Acod_processo + QuotedStr(Aprcss[I]) + IfThen( I < Pred(Aprcss.Count), ',');

    Self.SetValuesFrom(Fcon.SqlOpen('select %s from tabela_processos where cod_processo in (%s) and cod_empresa = %s',
                                    [TTabela_processos_class.GetFieldsSql(), Acod_processo, vDadosIni.codEmpresa], Fcon.buscas));        

  finally
    FreeAndNil(Aprcss);
  end;
end;

procedure THW_tabela_processos_classList.build_processos_todos;
begin
  build_processos(['NF0120', 'VND158', 'FPG036']);
end;

constructor THW_tabela_processos_classList.Create(Acon: THw_fbcon; const Aprocessos: array of string);
begin
  inherited Create;
  Fcon := Acon;
  build_processos(Aprocessos);
end;

function THW_tabela_processos_classList.GetProcesso(
  Acod_processo: string): TTabela_processos_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Self.Count - 1 do
    if Self.Items[I].cod_processo = Acod_processo then
    begin
      Result := Self.Items[I];//.Clone;
      Exit;
    end;
end;

{ THw_produtos_classList }

function THw_produtos_classList.ExisteProduto(grupo_prod: Integer;
  cod_prod: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].grupo_prod = grupo_prod) and (Trim(Self.Items[I].cod_prod) = Trim(cod_prod)) then
    begin
      Result := True;
      Exit;
    end;
end;

function THw_produtos_classList.GetProduto(Agrupo_prod: Integer;
  Acod_prod: string): TProdutos_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].grupo_prod = Agrupo_prod) and (Trim(Self.Items[I].cod_prod) = Trim(Acod_prod)) then
    begin
      Result := Self.Items[I];//.Clone;
      Exit;
    end;
end;

{ THw_notafiscal_class }

function THw_notafiscal_class.pedvenda_atualizar(
  var Apedvenda: THw_pedvenda_class): Boolean;
var
  I: Integer;
  AchangeProd: Boolean;
  Aid_tmp: string;
  Amerc: TProdutos_class;
  Ait: THw_notafiscal_item_class;
  Aconf: TConfig_sistema_class;
begin
  Result := False;
  if not Assigned(Apedvenda) then
    Exit;

  Flog := TConexao.Create;
  Flog.logs_sl('-- atualizando', 'calcnf');

  FOwnerPV := Apedvenda;
  Aid_tmp := FOwnerPV.tipo + IntToStr(FOwnerPV.nped);

  if Self.cod_empresa = 0 then
  begin
    if not Assigned(Fconf_nf) then
      if Assigned(FOwnerFat) then
        Fconf_nf := FOwnerFat.notas.conf_nf;
    if not Assigned(Fconf_nf) then
      Fconf_nf := TConfigGlobalNF.Create(FOwnerFat.buscas, 'S');
    if not Fconf_nf.inicializado then
      Fconf_nf.ExecutarLeitura;
    build_nf_campos;
  end
  else
  begin
    Aconf := TCfg_sis.getConf('nf_icmsst_cest_v2', FOwnerFat.buscas,  vDadosIni.cod_empresa);
    try
      Fconf_nf.Conf_ICMS.nf_icmsst_cest_v2.Configura(Aconf);
    finally
      FreeAndNil(Aconf);
    end;
  end;

  tipo_nf    := 'P';
  modelo_nf  := vDadosIni.vEmp.vNfe.modeloNF;
  serie      := IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal);
  codigo_nop := vDadosIni.vEmp.vCfopPadraoProd;
  lote_fat   := FOwnerFat.loteprcs;
  dfe_trib_ignorar := IfThen( not Fconf_nf.Conf_RTC.EmVigencia(vDadosIni.vEmp.vRegime), 1);
  AtualizarOperacaoInternaIdPorTipoVenda( Apedvenda.tipo,
      IfThen(Apedvenda.tipo = 'OS' , Apedvenda.tipo_os, Apedvenda.tipv)
  );

  {$REGION 'obtendo cliente/destinatarios/uf/empresa, e atribuindo dados'}
  if (FOwnerPV.cod_cliente  <> Self.cod_cliente) or
     (FOwnerPV.dest_seqid   <> Self.dest_seqid)  or
     (FOwnerPV.finalidadeid <> Self.finalidadeid) then
  begin
    Self.cod_cliente := IfThen(FOwnerPV.cod_cli_fat > 0, FOwnerPV.cod_cli_fat, FOwnerPV.cod_cliente);
    Self.cod_cli_ped := IfThen(FOwnerPV.cod_cli_fat > 0, FOwnerPV.cod_cliente, FOwnerPV.cod_cli_fat);

    Self.dest_seqid  := FOwnerPV.dest_seqid;
    Self.consumidor_final := '';
    Self.nfe_iddest := '';

    dados_obter_cliente;
  end;

  if FOwnerPV.finalidadeid > 0 then
    Self.finalidadeid := FOwnerPV.finalidadeid;
  {$ENDREGION}

  AchangeProd := False;

  {$REGION 'produtos'}
  if not Assigned(Fcad_merc) then
    Fcad_merc := THw_produtos_classList.Create;
  if Self.cad_merc.Count = 0 then
  begin
    dados_obter_produtos(Aid_tmp);
    AchangeProd := True;
  end
  else
  begin
    for I := 0 to Pred(FOwnerPV.cad_merc.Count) do with FOwnerPV.cad_merc.Items[I] do
      if not Assigned(Self.cad_merc.GetProduto(grupo_prod, cod_prod)) then
      begin
        Self.cad_merc.Add(FOwnerPV.cad_merc.Items[I].Clone);
        AchangeProd := True;
      end;
    Flog.logs_elapsed_time('produtos');
  end;

  {$REGION 'demais vinculos do produto'}
  if AchangeProd then
  begin
    dados_obter_codbarra(Aid_tmp);
    dados_obter_reducaodebase(Aid_tmp);
    dados_obter_trib_adicional(Aid_tmp, cod_cliente, dest_seqid);
    dados_obter_desoneracao(Aid_tmp);
    dados_obter_nat_op(Aid_tmp);
    dados_obter_ncm_estado(Aid_tmp);
    dados_obter_mva_ajustada(Aid_tmp);
    dados_obter_ncm(Aid_tmp);
    dados_obter_ibpt(Aid_tmp);
    dados_obter_cest(Aid_tmp);
    dados_obter_opfiscal(Aid_tmp);
  end;
  {$ENDREGION}

  {$ENDREGION}

  {$REGION 'usando dados do pedido para nf'}
  cod_cond_pag   := FOwnerPV.cod_cond_pag;
  cod_vendedor   := FOwnerPV.cod_vendedor;
  cod_carga      := FOwnerPV.cod_carga;
  nped           := FOwnerPV.nped;
  tipo_ped       := FOwnerPV.tipo;
  valor_seguro   := FOwnerPV.nf_ac_seguro;
  valor_out_desp := FOwnerPV.nf_ac_outras;
  valor_frete    := FOwnerPV.nf_ac_frete;

  if valor_frete > 0 then
    freteconta_tr := IfThen(FOwnerPV.nf_freteconta = 'T', '0',
                            IfThen(FOwnerPV.nf_freteconta = 'E', '1', '2'))
  else
    freteconta_tr := '9';
  {$ENDREGION}

  {$REGION 'montando itens da nota fiscal'}
  Flog.logs_elapsed_time('montando itens start');
  for I := 0 to FOwnerPV.prod.Count - 1 do with FOwnerPV.prod.Items[I] do
//    if n_nf > 0 then
//      Ferros.New('Item %d já possui nf %d emitida', [nitem, n_nf]).detalhe := Format('%s Qtde %0.3n', [descr_prod_ped, quant_ped_item])
//    else
    begin
      Amerc := Fcad_merc.GetProduto(grupo_prod, cod_prod);
      Ait := Fitens.New(Amerc);

      Ait.cod_nf          := Self.cod_nf;
      Ait.cod_empresa     := Self.cod_empresa;
      Ait.nitem           := Fitens.Count;
      Ait.num_fab_prod    := num_fab_prod;
      Ait.descricao_item  := descr_prod_ped;
      Ait.cod_grade       := cod_grade;
      Ait.valor_total     := RoundTo(vltot_ped_item + acresc_item, -2);
      Ait.quantidade      := quant_ped_item;
      Ait.valor_unitario  := Ait.valor_total / Ait.quantidade;
      Ait.rateio_desconto := RoundTo(rateio_desc, -2);//IfThen(Ait.permitir_desconto = 'N', 0, rateio_desc);
      Ait.perc_desconto   := Ait.rateio_desconto / Ait.valor_total * 100;
      Ait.nped            := nped;
      Ait.tipo_ped        := tipo;
      Ait.nitem_ped       := nitem;
      Ait.ncupom          := FOwnerPV.ncupom;
      Ait.terminal        := FOwnerPV.operador;
      Ait.nserieecf       := FOwnerPV.nserieecf;
      Ait.cod_nfce        := FOwnerPV.cod_nfce;
      Ait.xped_compra     := xped_compra;
      Ait.nitemped_compra := nitemped_compra;
      Ait.prec_cusm_prod  := pcust_mc;
      Ait.data_cupom      := IfThen(Ait.ncupom > 0, FOwnerPV.data_cupom);
      Ait.codigo_nop      := Ait.get_cfop(IfThen((Ait.ncupom > 0) or (Ait.cod_nfce > 0), 5929, Ait.codigo_nop));

//      Self.valor_out_desp := Self.valor_out_desp + acresc_item;
    end;
  Flog.logs_elapsed_time('montando itens fim');

  if Assigned(FOwnerPV) then
    if (FOwnerPV.nf_ac_calctrib = 'S') and (FOwnerPV.nf_cf_deson_emb = 'S') then// (FOwnerPV.status_ped = pv_stsAberta) then
    begin
      rateio_executar;

      for I := 0 to Fitens.Count - 1 do
      begin
        Fitens.Items[I].obter_dados_geral;
        Fitens.Items[I].dados_desoneracao_embutida_pedido;
      end;
    end;

  rateio_executar;

  Flog.logs_elapsed_time('montando itens rateio');

  for I := 0 to Pred(Fitens.Count) do
  begin
    Ait := Fitens.Items[I];

    Ait.obter_dados_geral;

    Ait.espelho_calc.Clear;
    Ait.calculo_ipi_executar;
    Ait.calculo_piscofins_executar;
    Ait.calculo_icms_executar;
    Ait.calculo_icms_dest_executar;
    Ait.calculo_fcp_executar;
    Ait.calculo_iss_executar;
    Ait.calculo_tributos_executar;
    Ait.calculo_retencoes_executar;
    Ait.calculo_tributos_rtc_executar;

    Ait.validar_dados;
    Ait.validar_dados_saida;
    Ait.Totalizar();

    FTributos.SetItem(Ait.dfe_trib_id, Ait.tributosRTC);;
  end;

  Flog.logs_elapsed_time('montando itens calculo');

  conf_piscofins := 'C';

  FOwnerPV.nf_base := Self;
  {$ENDREGION}

  if Assigned(Flog) then FreeAndNil(Flog);
end;

function THw_notafiscal_class.pedvenda_montar(
  var Apedvenda: THw_pedvenda_class): Boolean;
var
  I, J: Integer;
  Amerc: TProdutos_class;
  Ait: THw_notafiscal_item_class;
  Asql, Aaux_sql, Astr, Aid_tmp: string;
  Asped_inf: TSped_informacao_complementar_class;
  Avol: TPedvenda_volumes_class;
  Ainf_cpl_tipos, Ainf_cpl_nat_op, Ainf_cpl_ncm, Ainf_cpl_cst, Ainf_cpl_cod, Ancms, Alist: TStringList;
  Apag: TNotafiscal_pag_class;
  Atmpprod: THw_produtos_tmp_classList;
  Abool: Boolean;
  Adouble: Double;
begin
  //colocar este metodo como montar_do_pedvenda
  if not Assigned(Apedvenda) then
    Exit;

  Flog := TConexao.Create;

  try

    Flog.logs_sl('--', 'calcnf');

    FOwnerPV := Apedvenda;
    Ferros.identificador := Format('%s %d', [FOwnerPV.tipo, FOwnerPV.nped]);

    {$REGION 'criacao de objetos auxiliares'}
    Ainf_cpl_tipos  := vDadosIni.NewStringList(True);
    Ainf_cpl_nat_op := vDadosIni.NewStringList(True);
    Ainf_cpl_ncm    := vDadosIni.NewStringList(True);
    Ainf_cpl_cod    := vDadosIni.NewStringList(True);
    Ainf_cpl_cst    := vDadosIni.NewStringList(True);
    {$ENDREGION}

    {$REGION 'obtendo processos'}
    if FOwnerFat.processos.Count = 0 then
      FOwnerFat.processos.build_processos_todos;
    {$ENDREGION}

    {$REGION 'iniciando dados da nota'}
    if not Assigned(Fconf_nf) then
      if Assigned(FOwnerFat) then
        Fconf_nf := FOwnerFat.notas.conf_nf;
    if not Assigned(Fconf_nf) then
      Fconf_nf := TConfigGlobalNF.Create(FOwnerFat.buscas, 'S');
    if not Fconf_nf.inicializado then
      Fconf_nf.ExecutarLeitura;

    FTributos.Clear();

    build_nf_campos;

    tipo_nf    := 'P';
    modelo_nf  := vDadosIni.vEmp.vNfe.modeloNF;
    serie      := IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal);
    codigo_nop := vDadosIni.vEmp.vCfopPadraoProd;
    lote_fat   := FOwnerFat.loteprcs;
    tipo_desconto := 'I';
    dfe_trib_ignorar := IfThen( not Fconf_nf.Conf_RTC.EmVigencia(vDadosIni.vEmp.vRegime), 1);
    AtualizarOperacaoInternaIdPorTipoVenda( Apedvenda.tipo,
      IfThen(Apedvenda.tipo = 'OS' , Apedvenda.tipo_os, Apedvenda.tipv)
    );

    {$ENDREGION}

    {$REGION 'obtendo cliente/destinatarios/uf/empresa, e atribuindo dados'}
    Self.cod_cliente := IfThen(FOwnerPV.cod_cli_fat > 0, FOwnerPV.cod_cli_fat, FOwnerPV.cod_cliente);
    Self.cod_cli_ped := IfThen(FOwnerPV.cod_cli_fat > 0, FOwnerPV.cod_cliente, FOwnerPV.cod_cli_fat);
    Self.dest_seqid  := FOwnerPV.dest_seqid;
    Self.consumidor_final := '';
    Self.nfe_iddest := '';

    dados_obter_cliente;
    dados_obter_ecommerce;

    if FOwnerPV.finalidadeid > 0 then
      Self.finalidadeid := FOwnerPV.finalidadeid;
    {$ENDREGION}

    {$REGION 'obtendo cadastros com base no pedido'}
    Aid_tmp := FOwnerPV.tipo + IntToStr(FOwnerPV.nped);
    Fcon.SqlExec('delete from produtos_tmp where id_tmp = %s', [QuotedStr(Aid_tmp)]);

    Atmpprod := THw_produtos_tmp_classList.Create;
    for I := 0 to Pred(FOwnerPV.prod.Count) do
      if not Assigned(Atmpprod.GetProduto_tmp(FOwnerPV.prod.Items[I].grupo_prod, FOwnerPV.prod.Items[I].cod_prod)) then
        with Atmpprod.New do
        begin
          id_tmp      := Aid_tmp;
          seqid       := Succ(I);
          cod_empresa := FOwnerPV.prod.Items[I].cod_empresa;
          grupo_prod  := FOwnerPV.prod.Items[I].grupo_prod;
          cod_prod    := FOwnerPV.prod.Items[I].cod_prod;
        end;
    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build('PRODUTOS_TMP',  TProdutos_tmp_class.GetFieldsSql(), nil);
    for I := 0 to Pred(Atmpprod.Count) do with Atmpprod.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Atmpprod.Items[I].SetValuesInParams(QrAux).ExecSQL;
    end;

    dados_obter_produtos(Aid_tmp);

    dados_obter_codbarra(Aid_tmp);

    dados_obter_reducaodebase(Aid_tmp);

    dados_obter_trib_adicional(Aid_tmp, cod_cliente, dest_seqid);

    dados_obter_desoneracao(Aid_tmp);

    dados_obter_nat_op(Aid_tmp);

    dados_obter_ncm_estado(Aid_tmp);

    dados_obter_mva_ajustada(Aid_tmp);

    dados_obter_ncm(Aid_tmp);

    dados_obter_ibpt(Aid_tmp);

    dados_obter_cest(Aid_tmp);

    dados_obter_opfiscal(Aid_tmp);

    if not Assigned(Fcad_inf_cpl) then
      Fcad_inf_cpl := THw_inf_compl.Create; //  apos a montagem da nota que este objeto é populado
    {$ENDREGION}

    {$REGION 'usando dados do pedido para nf'}
    cod_cond_pag   := FOwnerPV.cod_cond_pag;
    cod_vendedor   := FOwnerPV.cod_vendedor;
    cod_carga      := FOwnerPV.cod_carga;
    nped           := FOwnerPV.nped;
    tipo_ped       := FOwnerPV.tipo;
    valor_seguro   := FOwnerPV.nf_ac_seguro;
    valor_out_desp := FOwnerPV.nf_ac_outras;
    valor_frete    := FOwnerPV.nf_ac_frete;

    if valor_frete > 0 then
      freteconta_tr := IfThen(FOwnerPV.nf_freteconta = 'T', '0',
                              IfThen(FOwnerPV.nf_freteconta = 'E', '1', '2'))
    else
      freteconta_tr := '9';

    if Fconf_nf.Conf_Lote.usar_obs_pedido then
      obs.Text     := Trim(FOwnerPV.obs_ped)
    else
      obs.Text     := Trim(vDadosIni.vEmp.vMensagem);
    obs.Add(FOwnerPV.obs_os.Text);

    {$REGION 'obtendo volumes'}
    Avol := Fvolumes_ped.New;
    Avol.SetValuesFrom(Fcon.SqlOpen('select first 1 %s from pedvenda_volumes' +
                                    ' where nped = %d and tipo = %s and cod_empresa = %d',
                                    [TPedvenda_volumes_class.GetFieldsSql(), FOwnerPV.nped, QuotedStr(FOwnerPV.tipo), FOwnerPV.cod_empresa]));
    Avol.nped := FOwnerPV.nped;
    Avol.tipo := FOwnerPV.tipo;

    qtde_volumes_tr := qtde_volumes_tr + Avol.qvol;
    especie_tr      := Avol.esp;
    marca_tr        := Avol.marca;
    numero_tr       := Avol.nvol;
    peso_b          := peso_b + Avol.pesob;
    peso_l          := peso_l + Avol.pesol;
    {$ENDREGION}
    {$ENDREGION}

    {$REGION 'auditoria'}
    with Fauditoria.New do
    begin
      cod_processo := 'NF0007';
      acao         := 'INCLUIR';
      mensagem     := Format('LOTE FAT %d PEDIDO %s %d', [lote_fat, tipo_ped, nped]);
      tabela       := 'NOTAFISCAL';
      codigo       := IntToStr(FOwnerFat.loteprcs);
      gravar       := True;
    end;

    with Fauditoria.New do
    begin
      cod_processo := 'NF0068';
      acao         := 'INCLUIR';
      mensagem     := Format('LOTE FAT %d PEDIDO %s %d', [lote_fat, tipo_ped, nped]);
      tabela       := 'NOTAFISCAL';
      codigo       := IntToStr(FOwnerFat.loteprcs);
      gravar       := True;
    end;
    {$ENDREGION}

    {$REGION 'montando itens da nota fiscal'}
    Flog.logs_elapsed_time('montando itens start');
    for I := 0 to Apedvenda.prod.Count - 1 do with Apedvenda.prod.Items[I] do
    if n_nf > 0 then
      Ferros.New('Item %d já possui nf %d emitida', [nitem, n_nf]).detalhe := Format('%s Qtde %0.3n', [descr_prod_ped, quant_ped_item])
    else if Apedvenda.prod.Items[I].status <> pv_stsCancelado then
    begin
      Amerc := Fcad_merc.GetProduto(grupo_prod, cod_prod);
      Ait := Fitens.New(Amerc);

      Ait.cod_nf          := Self.cod_nf;
      Ait.cod_empresa     := Self.cod_empresa;
      Ait.nitem           := Fitens.Count;
      Ait.num_fab_prod    := num_fab_prod;
      Ait.descricao_item  := descr_prod_ped;
      Ait.cod_grade       := cod_grade;
      Ait.valor_total     := RoundTo(vltot_ped_item + acresc_item + IfThen(FOwnerPV.status_ped = pv_stsFechada, nf_ac_des_emb), -2);
      Ait.quantidade      := quant_ped_item;
      Ait.valor_unitario  := Ait.valor_total / Ait.quantidade;
      Ait.rateio_desconto := RoundTo(rateio_desc - nf_dc_despnf, -2);//IfThen(Ait.permitir_desconto = 'N', 0, rateio_desc);
      Ait.perc_desconto   := Ait.rateio_desconto / Ait.valor_total * 100;
      Ait.nped            := nped;
      Ait.tipo_ped        := tipo;
      Ait.nitem_ped       := nitem;
      Ait.ncupom          := FOwnerPV.ncupom;
      Ait.terminal        := FOwnerPV.operador;
      Ait.nserieecf       := FOwnerPV.nserieecf;
      Ait.cod_nfce        := FOwnerPV.cod_nfce;
      Ait.xped_compra     := xped_compra;
      Ait.nitemped_compra := nitemped_compra;
      Ait.prec_cusm_prod  := pcust_mc;
      Ait.data_cupom      := IfThen(Ait.ncupom > 0, FOwnerPV.data_cupom);
      Ait.codigo_nop      := Ait.get_cfop(IfThen((Ait.ncupom > 0) or (Ait.cod_nfce > 0), 5929, Ait.codigo_nop));

      //Self.valor_out_desp := Self.valor_out_desp + acresc_item;
    end;
    Flog.logs_elapsed_time('montando itens fim');

    if (FOwnerPV.nf_ac_calctrib = 'S') and (FOwnerPV.nf_cf_deson_emb = 'S') and (FOwnerPV.status_ped = pv_stsAberta) then
    begin
      rateio_executar;

      for I := 0 to Fitens.Count - 1 do
      begin
        Fitens.Items[I].obter_dados_geral;
        Fitens.Items[I].dados_desoneracao_embutida_pedido;
      end;
    end;

    rateio_executar;

    Flog.logs_elapsed_time('montando itens rateio');

    for I := 0 to Pred(Fitens.Count) do
    begin
      Ait := Fitens.Items[I];

      Ait.obter_dados_geral;

      Ait.espelho_calc.Clear;
      Ait.calculo_ipi_executar;
      Ait.calculo_piscofins_executar;
      Ait.calculo_icms_executar;
      Ait.calculo_icms_dest_executar;
      Ait.calculo_fcp_executar;
      Ait.calculo_iss_executar;
      Ait.calculo_tributos_executar;
      Ait.calculo_retencoes_executar;
      Ait.calculo_tributos_rtc_executar;

      Ait.validar_dados;
      Ait.validar_dados_saida;
      Ait.Totalizar();

      Ainf_cpl_nat_op.Add(IntToStr(Trunc(Ait.codigo_nop)));
      if Trim(Ait.ncm) <> '' then
        Ainf_cpl_ncm.Add(Ait.ncm);
      if Ait.merc.cod_inf > 0 then
        Ainf_cpl_cod.Add(IntToStr(Ait.merc.cod_inf));
      Ainf_cpl_cst.Add(IfThen(Self.crt = '1', Ait.csosn, Copy(Ait.cst, 2, 2)));

      FTributos.SetItem(Ait.dfe_trib_id, Ait.tributosRTC);;
    end;

    Flog.logs_elapsed_time('montando itens calculo');

    conf_piscofins := 'C';

    FOwnerPV.nf_base := Self;
    {$ENDREGION}

    {$REGION 'montando cobranca, formas de pagamento e duplicatas'}
    Fcon.SqlOpen('select fp.seqform, coalesce(co.nfce_tpag, 99) tpag, fp.data_venc dvenc, fp.valordoc vpag, fp.valordoc vdup,' +
                 ' cl.cpfcgc cnpj, 0 tband, fp.n_aut_cart caut, fp.cod_controle, %d tpintegra, ''S'' origem_ped,' +
                 ' case when co.nat_ctrl = ''A'' then 0' +
                 '      when co.nat_ctrl = ''P'' then 1' +
                 '      else null' +
                 ' end indpag,' +
                 ' coalesce(co.usar_boleto, ''N'') isdup, fp.ndoc, fp.cod_empresa, bol.n_seq_bol' +
                 ' from formpagamento fp' +
                 ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa' +
                 ' left join boletas bol on bol.seqform = fp.seqform and bol.cod_empresa = fp.cod_empresa' +
                 ' left join clientes CL on cl.cod_cliente = co.cartao_sped_part and cl.cod_empresa = co.codigo_emp and co.nfce_tpag in (3,4)' +
                 ' where fp.tpdocs = %s and fp.nrequisicao = %d and fp.cod_empresa = %d' +
                 ' order by isdup, dvenc, tpag, fp.seqform',
                 [Fconf_nf.Conf_Geral.nfe_pag_carta_tpintegra_padrao, QuotedStr(FOwnerPV.tipo), FOwnerPV.nped, FOwnerPV.cod_empresa]).First;
    while not Fcon.QrAux.Eof do
    begin
      Apag := TNotafiscal_pag_class.Create;
      Apag.SetValuesFrom(Fcon.QrAux, True);
      Apag.tpintegra := IfThen(Apag.tpag in [3,4], Apag.tpintegra);
      Fpag.New(Apag);

      if Fcon.QrAux.FieldByName('isdup').AsString = 'S' then
        Fdup.New.SetValuesFrom(Fcon.QrAux, True);

      Fcon.QrAux.Next;
    end;
    Abool := False;
    for I := 0 to Pred(Fdup.Count) do
    begin
      Fdup.Items[I].ndup := vDadosIni.StrZero(I + 1, 3);
      if Fdup.Items[I].n_seq_bol = 0 then
        Abool := True;
    end;

    if Abool then
      if not Assigned(FOwnerFat.processos.GetProcesso('NF0120')) then
      begin
        Ferros.New.erro := 'Processo NF0120 não definido na tabela de processos';
        Exit;
      end;

    Flog.logs_elapsed_time('cobranca');
    {$ENDREGION}

    {$REGION 'montando referencias, cupom fiscal e nfce'}
    if FOwnerPV.ncupom > 0 then
      Fref_cp.New(FOwnerPV.nserieecf, '2D', FOwnerPV.ncupom, FOwnerPV.operador, FOwnerPV.data_cupom).cod_empresa := cod_empresa;

    if FOwnerPV.cod_nfce > 0 then
      if not Fcon.SqlOpen('select chave_nfce from nfce where cod_nfce = %d and cod_empresa = %d and situacao_nfce = ''Autorizada''',
                          [FOwnerPV.cod_nfce, cod_empresa]).IsEmpty then
        Fref_nfce.New(Fcon.QrAux.FieldByName('chave_nfce').AsString).cod_empresa := Self.cod_empresa;
    Flog.logs_elapsed_time('referencias');
    {$ENDREGION}

    {$REGION 'somatorios, troco, etc'}
    totais_somar;

    Flog.logs_elapsed_time('somatorio nf');

    Adouble := 0;
    for I := 0 to Pred(Fpag.Count) do
      Adouble := Adouble + Fpag.Items[i].vpag;

    if Adouble < valor_total then 
    begin
      Apag := TNotafiscal_pag_class.Create;
      Apag.cod_empresa := cod_empresa;
      Apag.tpag := 99;
      Apag.vpag := valor_total - Adouble;
      Fpag.New(Apag);
      Adouble := 0;
    end;

    pag_vtroco := IfThen(Adouble > valor_total, Adouble - valor_total);
    if Fdup.Count > 0 then
    begin
      Adouble := 0;
      for I := 0 to Pred(Fdup.Count) do
        Adouble := Adouble + Fdup.Items[i].vdup;
      fat_vorig := Adouble;
      fat_vliq  := Adouble;
      fat_vdesc := 0;
      if Apedvenda.tipo = 'REQ' then
        if RoundTo(Adouble, -2) > RoundTo(valor_total, -2) then
          Ferros.New('Total das faturas maior que o valor total da nota').detalhe := Format('Valor da nota: %0.2n. Valor das faturas: %0.2n',[valor_total, Adouble]);
      obs_bol1 := Trim(Fconf_nf.Conf_Geral.nf_s_obs_pad_bol);
    end;
    {$ENDREGION}

    {$REGION 'montando informacoes complementares'}
    Asql := '';

    if (vtottrib > 0) and (consumidor_final = 'S') then
      Ainf_cpl_tipos.Add('DE OLHO NO IMPOSTO');

    if Copy(vDadosIni.vEmp.vRegime, 1, 7) = 'SIMPLES' then
      Ainf_cpl_tipos.Add(vDadosIni.vEmp.vRegime);

    if (Fref_cp.Count > 0) or (Fref_nfce.Count > 0) then
      Ainf_cpl_tipos.Add('CUPOM');             

    if (vicmdeson > 0) then
      Ainf_cpl_tipos.Add('DESONERACAO');

    Asql := '';
    if Ainf_cpl_tipos.Count > 0 then
    begin
      for I := 0 to Pred(Ainf_cpl_tipos.Count) do if Trim(Ainf_cpl_tipos[I]) <> '' then
        Asql := IfThen(Asql <> '', Asql + sLineBreak + ' union ' + sLineBreak) +
                Format('select first 1 %s from sped_informacao_complementar sp where sp.tipo = %s and sp.cod_empresa = %d and sp.ativo = 1',
                       [TSped_informacao_complementar_class.GetFieldsSql('sp'), QuotedStr(Ainf_cpl_tipos[I]), cod_empresa]);
    end;

    if Ainf_cpl_nat_op.Count > 0 then
    begin
      Aaux_sql := '';
      for I := 0 to Pred(Ainf_cpl_nat_op.Count) do if Trim(Ainf_cpl_nat_op[I]) <> '' then
        Aaux_sql := Aaux_sql + IfThen(I = 0, '(') + Ainf_cpl_nat_op[I] + IfThen(Pred(Ainf_cpl_nat_op.Count) = I, ')', ',');

      if Aaux_sql <> '' then
        Asql := IfThen(Asql <> '', Asql + sLineBreak + ' union ' + sLineBreak) +
                Format('select %s from nat_op nop' +
                       ' inner join sped_informacao_complementar sp on sp.cod_inf = nop.cod_inf and sp.cod_empresa = %d and sp.ativo = 1' +
                       ' where nop.codigo_nop in %s',
                       [TSped_informacao_complementar_class.GetFieldsSql('sp'), cod_empresa, Aaux_sql]) ;
    end;

    if Ainf_cpl_ncm.Count > 0 then
    begin
      Aaux_sql := '';
      for I := 0 to Pred(Ainf_cpl_ncm.Count) do if Trim(Ainf_cpl_ncm[I]) <> '' then
        Aaux_sql := Aaux_sql + IfThen(I = 0, '(') + QuotedStr(Ainf_cpl_ncm[I]) + IfThen(Pred(Ainf_cpl_ncm.Count) = I, ')', ',');

      if Aaux_sql <> '' then
        Asql := IfThen(Asql <> '', Asql + sLineBreak + ' union ' + sLineBreak) +
                Format('select %s from nbm ncm' +
                       ' inner join sped_informacao_complementar sp on sp.cod_inf = ncm.cod_inf and sp.cod_empresa = %d and sp.ativo = 1' +
                       ' where ncm.cod_ncm in %s',
                       [TSped_informacao_complementar_class.GetFieldsSql('sp'), cod_empresa, Aaux_sql]) ;
    end;

    if Ainf_cpl_cst.Count > 0 then
    begin
      Aaux_sql := '';
      for I := 0 to Pred(Ainf_cpl_cst.Count) do if Trim(Ainf_cpl_cst[I]) <> '' then
        Aaux_sql := Aaux_sql + IfThen(I = 0, '(') + QuotedStr(Ainf_cpl_cst[I]) + IfThen(Pred(Ainf_cpl_cst.Count) = I, ')', ',');

      if Aaux_sql <> '' then
        Asql := IfThen(Asql <> '', Asql + sLineBreak + ' union ' + sLineBreak) +
                Format('select %s from cst_icms_inf_cpl cst' +
                       ' inner join sped_informacao_complementar sp on sp.cod_inf = cst.cod_inf and sp.cod_empresa = cst.cod_empresa and sp.ativo = 1' +
                       ' where cst.cst_csosn in %s and cst.cod_empresa = %d',
                       [TSped_informacao_complementar_class.GetFieldsSql('sp'), Aaux_sql, cod_empresa]) ;
    end;

    if Fconf_nf.Conf_Geral.nfe_inf_compl_op_interna_dest_outra_uf > 0 then
      Ainf_cpl_cod.Add(IntToStr(Fconf_nf.Conf_Geral.nfe_inf_compl_op_interna_dest_outra_uf));

    if Ainf_cpl_cod.Count > 0 then
    begin
      Aaux_sql := '';
      for I := 0 to Pred(Ainf_cpl_cod.Count) do if Trim(Ainf_cpl_cod[I]) <> '' then
        Aaux_sql := IfThen(I = 0, '(') + Ainf_cpl_cod[I] + IfThen(Pred(Ainf_cpl_cod.Count) = I, ')', ',');

      if Aaux_sql <> '' then
        Asql := IfThen(Asql <> '', Asql + sLineBreak + ' union ' + sLineBreak) +
                Format('select %s from sped_informacao_complementar sp where sp.cod_inf in %s and sp.cod_empresa = %d and sp.ativo = 1',
                       [TSped_informacao_complementar_class.GetFieldsSql('sp'), Aaux_sql, cod_empresa]);
    end;

    if Asql <> '' then
    begin
      Fcad_inf_cpl.SetValuesFrom(Fcon.SqlOpen(Asql));

      if (Fref_cp.Count > 0) or (Fref_nfce.Count > 0) then
        Asped_inf := Fcad_inf_cpl.get_sped_inf_compl('CUPOM');
                                                                                                                                      
      if (Fref_cp.Count > 0) then
        if not Assigned(Asped_inf) then
          Ferros.New('Informação complementar de cupons fiscais/NFC-e não encontrada no cadastro').detalhe := 'Existem cupons ficais referenciados'
        else
          for I := 0 to Pred(Fref_cp.Count) do
            Fref_cp.Items[I].cod_inf := Asped_inf.cod_inf;

      if (Fref_nfce.Count > 0) then
        if not Assigned(Asped_inf) then
          Ferros.New('Informação complementar de cupons fiscais/NFC-e não encontrada no cadastro').detalhe := 'Existem NFC-e''s referenciadas'
        else
          for I := 0 to Pred(Fref_nfce.Count) do
            Fref_nfce.Items[I].cod_inf := Asped_inf.cod_inf;
    end;

    if (vicmdeson > 0) then
      if not Assigned(Fcad_inf_cpl.get_sped_inf_compl('DESONERACAO')) then
        Fcad_inf_cpl.Add(NewInformacanComplementar('DESONERACAO'));

    for I := 0 to Pred(Fcad_inf_cpl.Count) do
      with Finf_compl.New(Fcad_inf_cpl.Items[I].cod_inf) do
      begin
        cod_inf := Fcad_inf_cpl.Items[I].cod_inf;
        tipo    := Fcad_inf_cpl.Items[I].tipo;

        if tipo = 'DE OLHO NO IMPOSTO' then
          txt_compl := Format('Val Aprox Tributos R$ %0.2n (%0.2f)%%) Fonte: IBPT', [vtottrib, vtottrib / Max(valor_total, 1) * 100])
        else if (tipo = 'SIMPLES') and (nfe_indiedest = 1) then
          txt_compl := Format('%s PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS NO VALOR DE R$ %0.2n CORRESPONDENTE À ALÍQUOTA DE %0.2n%%, NOS TERMOS DO ART.23 DA LC 123/2006',
                              [Fcad_inf_cpl.Items[I].txt, valor_icm_simples, aliq_icm_simples])
        else if tipo = 'CUPOM' then
        begin
          for J := 0 to Pred(Fref_cp.Count) do
            txt_compl := IfThen(I = 0, 'Conforme cupons fiscais: ') +
                         Format('ECF: %s COO: %d', [Fref_cp.Items[J].ecf_fab, Fref_cp.Items[J].num_doc]) +
                         IfThen(Pred(Ainf_cpl_cod.Count) = I, '', ',');

          for J := 0 to Pred(Fref_nfce.Count) do
            txt_compl := IfThen(I = 0, 'Conforme NFC-e(s): ') +
                         Fref_nfce.Items[J].chave_nfe_ref +
                         IfThen(Pred(Ainf_cpl_cod.Count) = I, '', ',');
        end
        else if (tipo = 'DESONERACAO') and (vicmdeson > 0) then
        begin
          txt_compl := StringReplace(Fcad_inf_cpl.Items[I].txt_compl, '[@VICMDESON]',
                                     Format('%n', [vicmdeson]), [rfReplaceAll, rfIgnoreCase])
        end;
        txt_compl := IfThen(txt_compl = '', Fcad_inf_cpl.Items[I].txt, txt_compl);
      end;

    dados_interesse_fisco.Clear;
    for I:= 0 to Pred(Finf_compl.Count) do with Finf_compl.Items[I] do
      dados_interesse_fisco.Text := dados_interesse_fisco.Text +
                                    IfThen(dados_interesse_fisco.Text <> '', '.') +
                                    StringReplace(txt_compl, sLineBreak, '', [rfReplaceAll, rfIgnoreCase]);

    for I := Pred(dados_interesse_fisco.Count) downto 0 do
      if Trim(dados_interesse_fisco[I]) = '' then
        dados_interesse_fisco.Delete(I);
    dados_interesse_fisco.LineBreak := '';

    for I := 0 to Pred(Finf_compl.Count) do Finf_compl.Items[I].cod_empresa := cod_empresa;
    Flog.logs_elapsed_time('build inf compl');
    {$ENDREGION}

    {$REGION 'validacao de dados do cabeçalho'}
    if nfe_iddest = '3' then
      Ferros.New('Para exportação os detalhes devem ser preenchidos diretamente na nota fiscal');

    if Fitens.Count = 0 then
      Ferros.New('Nota fiscal sem itens')
    else
    begin
      codigo_nop := Fitens.Items[0].get_cfop(codigo_nop);
      Abool := True;
      for I := 0 to Pred(Fitens.Count) do
        if Fitens.Items[I].codigo_nop = codigo_nop then
        begin
          Break;
        end;
      if Abool then
        codigo_nop := Fitens.Items[0].codigo_nop;

      desc_natop := Fcad_cfop.get_nat_op(codigo_nop).descricao_nop;
    end;

    if modelo_nf = '55' then
    begin
      if vDadosIni.vEmp.vNfe.ibgeCodEstado = 0 then
        Ferros.New('Código IBGE do estado do emitente não configurado').detalhe := 'Acesse o cadastro da empresa e configure na aba NF-e';

      if vDadosIni.vEmp.vNfe.ibgeCodCidade = 0 then
        Ferros.New('Código IBGE da cidade do emitente não configurado').detalhe := 'Acesse o cadastro da empresa e configure na aba NF-e';

      if Trim(vDadosIni.vEmp.vNfe.certificadonumSerie) = '' then
        Ferros.New('Nf-e: Certificado Transmissor inválido').detalhe := 'Acesse o cadastro da empresa e preencha o numero de serie do certificado na aba NF-e';

      if dest_cmun = 0 then
        Ferros.New('Código IBGE da cidade do destinatário não infomado').detalhe := 'Acesso no endereço do cliente a cidade ibge corretamente';

      if dest_uf  = '' then
        Ferros.New('Nf-e: Sigla do estado não infomado para o destinatário');

      if (cpfcgc = '') and (dest_cmun <> 9999999) then
        Ferros.New('Nf-e: CPF/CNPJ do destinatário não informado');

      if Trim(vDadosIni.vEmp.vCNPJ) = '' then
        Ferros.New('Nf-e: CNPJ emitente não informado');

      if Trim(vDadosIni.vEmp.vIE) = '' then
        Ferros.New('Nf-e: IE do emitente não informada');
    end;
    Flog.logs_elapsed_time('validacoes');
    {$ENDREGION}

    {$REGION 'validacoes adicionais e auditoria'}
    with Fauditoria.New do
    begin
      cod_processo := 'NF0031';
      acao         := 'SALVAR';
      mensagem     := Format('SALVAR NF LOTE FAT %d PEDIDO %s %d', [lote_fat, tipo_ped, nped]);
      tabela       := 'NOTAFISCAL';
      codigo       := IntToStr(lote_fat);
      gravar       := True;
    end;

    with Fauditoria.New do
    begin
      cod_processo := 'NF0033';
      acao         := 'EDITAR';
      mensagem     := Format('CONFIRMAR NF LOTE FAT %d PEDIDO %s %d', [lote_fat, tipo_ped, nped]);
      tabela       := 'NOTAFISCAL';
      codigo       := IntToStr(lote_fat);
      gravar       := True;
    end;
    Flog.logs_elapsed_time('valid ad e audit');
    {$ENDREGION}

    if (Ferros.Count = 0) then
      status := nf_stsFechada;

    Flog.logs_elapsed_time('fim');
  finally
    {$REGION 'liberando objetos temporarios'}
    if Assigned(Ainf_cpl_nat_op) then FreeAndNil(Ainf_cpl_nat_op);
    if Assigned(Ainf_cpl_tipos ) then FreeAndNil(Ainf_cpl_tipos);
    if Assigned(Ainf_cpl_ncm   ) then FreeAndNil(Ainf_cpl_ncm);
    if Assigned(Ainf_cpl_cod   ) then FreeAndNil(Ainf_cpl_cod);
    if Assigned(Ainf_cpl_cst   ) then FreeAndNil(Ainf_cpl_cst);
    if Assigned(Asped_inf      ) then FreeAndNil(Asped_inf);
    if Assigned(Atmpprod       ) then FreeAndNil(Atmpprod);
    if Assigned(Flog           ) then FreeAndNil(Flog);
    {$ENDREGION}
  end;
end;

function THw_notafiscal_class.rateio_executar: THw_notafiscal_class;
var
  Ait: THw_notafiscal_item_class;
  Asum_seguro, Asum_frete, Asum_outras: Double;
  Adiferenca: Double;
  I: Integer;
begin
  Result := Self;
  Asum_seguro := 0;
  Asum_frete  := 0;
  Asum_outras := 0;
  totais_somar;

  for I := 0 to Pred(Fitens.Count) do if Fitens.Items[I].indtot = 1 then
  begin
    Ait := Fitens.Items[I];

    if Self.tipo_seguro = 'R' then
      Ait.rateio_seguro  := 0;

    if Self.tipo_frete = 'R' then
      Ait.rateio_frete   := 0;

    if Self.tipo_outdesp = 'R' then
      Ait.rateio_outdesp := 0;

    if Self.tipo_seguro = 'R' then
      if Self.valor_seguro > 0 then
      begin
        Ait.rateio_seguro := RoundTo((Self.valor_seguro / Self.valor_prod) * Ait.valor_total, -2);
        Asum_seguro       := Asum_seguro + Ait.rateio_seguro;
      end;

    if Self.tipo_frete = 'R' then
      if Self.valor_frete > 0 then
      begin
        Ait.rateio_frete := RoundTo((Self.valor_frete / Self.valor_prod) * Ait.valor_total, -2);
        Asum_frete       := Asum_frete + Ait.rateio_frete;
      end;

    if Self.tipo_outdesp = 'R' then
      if Self.valor_out_desp > 0 then
      begin
        Ait.rateio_outdesp := RoundTo((Self.valor_out_desp / Self.valor_prod) * Ait.valor_total, -2);
        Asum_outras       := Asum_outras + Ait.rateio_outdesp;
      end;
  end;

  if Self.tipo_seguro = 'R' then
    if (RoundTo(Self.valor_seguro, -2) <> RoundTo(Asum_seguro, -2)) then
    begin
      Adiferenca := RoundTo(Self.valor_seguro, -2) - RoundTo(Asum_seguro, -2);
      for I := Pred(Fitens.Count) downto 0 do with Fitens.Items[I] do if rateio_seguro > 0 then
      begin
        if (Adiferenca + rateio_seguro) < 0 then
        begin
          Adiferenca := Adiferenca + rateio_seguro;
          rateio_seguro := 0;
        end
        else
        begin
          rateio_seguro := rateio_seguro + Adiferenca;
          Adiferenca := 0;
        end;
        if Adiferenca = 0 then
          Break;
      end;
    end;

  if Self.tipo_frete = 'R' then
    if (RoundTo(Self.valor_frete, -2) <> RoundTo(Asum_frete, -2)) then
    begin
      Adiferenca := RoundTo(Self.valor_frete, -2) - RoundTo(Asum_frete, -2);
      for I := Pred(Fitens.Count) downto 0 do with Fitens.Items[I] do if rateio_frete > 0 then
      begin
        if (Adiferenca + rateio_frete) < 0 then
        begin
          Adiferenca := Adiferenca + rateio_frete;
          rateio_frete := 0;
        end
        else
        begin
          rateio_frete := rateio_frete + Adiferenca;
          Adiferenca := 0;
        end;
        if Adiferenca = 0 then
          Break;
      end;
    end;

  if Self.tipo_outdesp = 'R' then
    if (RoundTo(Self.valor_out_desp, -2) <> RoundTo(Asum_outras, -2)) then
    begin
      Adiferenca := RoundTo(Self.valor_out_desp, -2) - RoundTo(Asum_outras, -2);
      for I := Pred(Fitens.Count) downto 0 do with Fitens.Items[I] do if rateio_outdesp > 0 then
      begin
        if (Adiferenca + rateio_outdesp) < 0 then
        begin
          Adiferenca := Adiferenca + rateio_outdesp;
          rateio_outdesp := 0;
        end
        else
        begin
          rateio_outdesp := rateio_outdesp + Adiferenca;
          Adiferenca := 0;
        end;
        if Adiferenca = 0 then
          Break;
      end;
    end;

end;

procedure THw_notafiscal_class.restore_frete_conta_tr;
begin
  if (valor_frete > 0) and (Assigned(FOwnerPV)) then
    freteconta_tr := IfThen(FOwnerPV.nf_freteconta = 'T', '0',
                            IfThen(FOwnerPV.nf_freteconta = 'E', '1', '2'))
  else
    freteconta_tr := '9';
end;

function THw_notafiscal_class.salvar(Acommit: Boolean = True): Boolean;
var
  I: Integer;
  Astr: string;
  Aproc: TTabela_processos_class;
  Adup: TNotafiscal_dup_class;
  Abol: TBoletas_class;
  Abols: THw_boletas_classList;
  oPedsCliente: TPedidoCompraCliente;
begin
  Result := True;

  try
    if natureza_nf = 'S' then
      if status <> nf_stsFechada then
        Exit;

    {$REGION 'verificando codigo e numeros'}
    if cod_nf = 0 then
    begin
      cod_nf := Fcon.SqlOpen(sql_gencod, [cod_empresa, QuotedStr(tb_nf)]).FieldByName('cod').AsInteger;
      for I := 0 to Pred(Fitens.Count)     do Fitens.Items[I].cod_nf     := cod_nf;
      for I := 0 to Pred(Fpag.Count)       do Fpag.Items[I].cod_nf       := cod_nf;
      for I := 0 to Pred(Fdup.Count)       do Fdup.Items[I].cod_nf       := cod_nf;
      for I := 0 to Pred(Finf_compl.Count) do Finf_compl.Items[I].cod_nf := cod_nf;
      for I := 0 to Pred(Fref_nfce.Count)  do Fref_nfce.Items[I].cod_nf  := cod_nf;
      for I := 0 to Pred(Fref_cp.Count)    do Fref_cp.Items[I].cod_nf    := cod_nf;
      for I := 0 to Pred(Flanc_aj.Count)   do Flanc_aj.Items[I].cod_nf   := cod_nf;
    end;

    if (num_nf = 0) and (emissao_propria = 'S') then
    begin
      num_nf := Fcon.SqlOpen(sql_gencod, [cod_empresa, QuotedStr(IfThen(nfe_tpamb = '1', sql_n_nf_prod, sql_n_nf_hom))]).FieldByName('cod').AsInteger;
      num_gerado := 'S';
      if Fdup.Count > 0 then
        fat_nfat := vDadosIni.StrZero(num_nf, 6);
      for I := 0 to Pred(Fdup.Count) do
        if Pos(vDadosIni.StrZero(num_nf, 6), Fdup.Items[I].ndoc) = 0 then
          Fdup.Items[I].ndoc := vDadosIni.StrZero(num_nf, 6) + Copy(Fdup.Items[I].ndoc, Pos('-', Fdup.Items[I].ndoc), Length(Fdup.Items[I].ndoc))
        else
          Fdup.Items[I].ndoc := vDadosIni.StrZero(num_nf, 6);
    end;

    if cnfe = 0 then
    begin
      Randomize;
      while cnfe = 0 do
        cnfe := Random(99999999);
    end;
    {$ENDREGION}

    Fcon.QrAux.Close;

    {$REGION 'nota fiscal'}
    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_nf,  TNotafiscal_class.GetFieldsSql(), sql_fields_ignored_get(tipo_nf));
    with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;
      
      Self.SetValuesInParams(Fcon.QrAux, True);
      SetParamVal('data_ent_saida', data_ent_saida, True);
      SetParamVal('hora_ent_saida', hora_ent_saida, True);
      SetParamVal('nfe_dhcont'    , nfe_dhcont, True);
      SetParamVal('nfe_xjust'     , nfe_xjust, 256);
      SetParamVal('cod_carga'     , cod_carga);
      SetParamVal('fat_nfat'      , fat_nfat, 60);
      SetParamVal('situacao_nfe'  , situacao_nfe, 60);
      SetParamVal('codigo_tr'     , codigo_tr);
      SetParamVal('cod_cond_pag'  , cod_cond_pag);
      SetParamVal('lote_fat'      , lote_fat);
      SetParamVal('id_ajuste'     , id_ajuste);
      SetParamVal('efdrestcomplicms_id', efdrestcomplicms_id);
      SetParamVal('cod_cli_ped'   , cod_cli_ped);
      {$REGION 'formatando mensagem dos boletos'}
      if (obs_bol1 <> '') and (num_nf > 0) and (Pos('[@', obs_bol1) > 0) then
      begin
        for I := 0 to Pred(QrAux.Params.Count) do
          if Pos('[@' + UpperCase(QrAux.Params[I].Name) + ']', UpperCase(obs_bol1)) > 0 then
            obs_bol1 := StringReplace(obs_bol1, '[@' + UpperCase(QrAux.Params[I].Name) + ']',
                                      QrAux.Params[I].Text, [rfReplaceAll, rfIgnoreCase]);        
        QrAux.Close;
      end;      
      {$ENDREGION}  
      SetParamVal('obs_bol1'      , obs_bol1, 45);
      SetParamVal('op_interna_id' , op_interna_id, 36, True);

      QrAux.ExecSQL;
    end;    
    {$ENDREGION}

    {$REGION 'itens nf'}
    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_nf_it,  TNotafiscal_item_class.GetFieldsSql(), sql_fields_ignored_get(tb_nf_it));
    for I := 0 to Pred(Fitens.Count) do with Fitens.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Fitens.Items[I].SetValuesInParams(Fcon.QrAux, True);
      SetParamVal('grupo_prod'           , grupo_prod, True);
      SetParamVal('cod_prod'             , cod_prod, 6, True);
      SetParamVal('data_cupom'           , data_cupom, True);
      SetParamVal('descricao_item_outras', descricao_item_outras.Text, Length(descricao_item_outras.Text), True, False);
      SetParamVal('nat_rec'              , nat_rec, 3);
      SetParamVal('xped_compra'          , xped_compra, 15);
      SetParamVal('nitemped_compra'      , nitemped_compra);
      SetParamVal('opf_icms_id'          , opf_icms_id);
      SetParamVal('opf_pc_id'            , opf_pc_id);
      SetParamVal('opf_ret_id'           , opf_ret_id);
      SetParamVal('op_interna_id'        , op_interna_id, 36, True);
      SetParamVal('dfe_trib_id'          , dfe_trib_id, 36, True);
      Fcon.QrAux.ExecSQL;
    end;
    {$ENDREGION}

    {$REGION 'pag nf'}
    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_nf_pag,  TNotafiscal_pag_class.GetFieldsSql(), sql_fields_ignored_get(tb_nf_pag));
    for I := 0 to Pred(Fpag.Count) do with Fpag.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Fpag.Items[I].SetValuesInParams(QrAux);
      SetParamVal('cnpj'        , cnpj, 14);
      SetParamVal('tband'       , tband);
      SetParamVal('caut'        , caut, 20);
      SetParamVal('cod_controle', cod_controle);
      SetParamVal('tpintegra'   , tpintegra, 1);
      SetParamVal('origem_ped'  , origem_ped, 1);
      SetParamVal('indpag'      , indpag, 1);
      QrAux.ExecSQL;
    end;
    {$ENDREGION}

    {$REGION 'dup nf'}

    {$REGION 'salvando registro de boletos caso configurado'}
    Aproc := FOwnerFat.processos.GetProcesso('NF0120');
    if Assigned(Aproc) then
      if Aproc.nivel_processo <= vDadosIni.vNivel then
      begin
        Abols := THw_boletas_classList.Create;
        try
          Astr := Format(sql_gencod, [cod_empresa, QuotedStr(tb_boletos)]);
          for I := 0 to Pred(Fdup.Count) do if Fdup.Items[I].n_seq_bol = 0 then with Fcon do
          begin
            Adup := Fdup.Items[I];

            Abol                 := Abols.New;
            Abol.n_seq_bol       := SqlOpen(Astr).FieldByName('cod').AsInteger;
            Abol.cod_empresa     := Adup.cod_empresa;
            Abol.num_nf_vnd      := Self.num_nf;
            Abol.sub_serie       := StrToIntDef(Self.serie, 0);
            Abol.obs_bol1        := Copy(Self.obs_bol1, 1, 45);
            Abol.cod_cliente     := Self.cod_cliente;
            Abol.data_em_bol     := Self.data_lanc;
            Abol.data_ven_bol    := Adup.dvenc;
            Abol.n_doc_bol       := Adup.ndoc;
            Abol.vl_doc_bol      := Adup.vdup;
            Abol.cod_controle_cx := Adup.cod_controle;
            Abol.cod_carga       := Self.cod_carga;
            Abol.cod_nf          := Self.cod_nf;
            Abol.tipo_emissao    := 'NF';

            Adup.n_seq_bol := Abol.n_seq_bol;
          end;

          Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_boletos,  THw_boletas_classList.GetFieldsSql(), nil);
          for I := 0 to Pred(Abols.Count) do with Abols.Items[I] do with Fcon do
          begin
            if not QrAux.Prepared then QrAux.Prepare;

            Abols.Items[I].SetValuesInParams(QrAux, True);
            SetParamVal('cod_carga'      , cod_carga);
            SetParamVal('cod_controle_cx', cod_controle_cx);
            QrAux.ExecSQL;
          end;
        finally
          if Assigned(Abols) then FreeAndNil(Abols);          
        end;
      end;


    {$ENDREGION}

    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_nf_dup,  TNotafiscal_dup_class.GetFieldsSql(), sql_fields_ignored_get(tb_nf_dup));
    for I := 0 to Pred(Fdup.Count) do with Fdup.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Fdup.Items[I].SetValuesInParams(QrAux);
      SetParamVal('seqform'  , seqform);
      SetParamVal('n_seq_bol', n_seq_bol);
      QrAux.ExecSQL;
    end;
    {$ENDREGION}

    {$REGION 'inf complementar c110'}
    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_nf_inf,  TNotafiscal_sped_c110_class.GetFieldsSql(), sql_fields_ignored_get(tb_nf_inf));
    for I := 0 to Pred(Finf_compl.Count) do with Finf_compl.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Finf_compl.Items[I].SetValuesInParams(QrAux);
      SetParamVal('tipo', tipo, 20);
      QrAux.ExecSQL;
    end;
    {$ENDREGION}

    {$REGION 'ref nf c113'}
    Fcon.buscas.SQL.Text := Fcon.sql_insert_build(tb_nf_ref_nf,  TNotafiscal_sped_c113_class.GetFieldsSql(), sql_fields_ignored_get(tb_nf_ref_nf));
    for I := 0 to Pred(Fref_nfce.Count) do with Fref_nfce.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Fref_nfce.Items[I].SetValuesInParams(QrAux);
      SetParamVal('chave_nfe_ref', chave_nfe_ref, 44);
      SetParamVal('nnf'          , nnf);
      SetParamVal('modelo'       , modelo);
      SetParamVal('serie'        , serie);
      SetParamVal('cuf'          , cuf);
      SetParamVal('aamm'         , aamm, 4);
      SetParamVal('cnpj'         , cnpj, 14);
      QrAux.ExecSQL;
    end;
    {$ENDREGION}

    {$REGION 'ref cp c114'}
    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build(tb_nf_ref_cp,  TNotafiscal_sped_c114_class.GetFieldsSql(), sql_fields_ignored_get(tb_nf_ref_cp));
    for I := 0 to Pred(Fref_cp.Count) do with Fref_cp.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Fref_cp.Items[I].SetValuesInParams(QrAux).ExecSQL;
    end;
    {$ENDREGION}

    {$REGION 'ajustes'}
    for I := 0 to Pred(Flanc_aj.Count) do with Flanc_aj.Items[I] do with SQLMotor() do
    begin
      Options.FieldsInInsertUpdate := fsAllFields;// [muAllFields];
      Fcon.SqlExec(SQLUpdateOrInsert);
    end;
    {$ENDREGION}

    {$REGION 'volumes'}
    if Fvolumes_ped.Count > 0 then
    begin

    end;
    {$ENDREGION}

    {$REGION 'atualizando pedvenda'}
    {if (nped > 0) and (tipo_ped <> '') then
      with Fcon do
      begin
        SqlExec('update pedvenda set num_nf = %d, serie_nf = %s, data_nf = %s, valor_nf = %s' +
                ' where nped = %d and tipo = %s and cod_empresa = %d and coalesce(num_nf, 0) = 0',
                [num_nf, QuotedStr(serie), QuotedStr(FormatDateTime('mm/dd/yyyy', data_lanc)),
                StringReplace(Format('%0.2f', [valor_total]), ',', '.', []),
                nped, QuotedStr(tipo_ped), cod_empresa]);
        for I := 0 to Pred(Fitens.Count) do
          if (Fitens.Items[I].nped > 0) and (Fitens.Items[I].tipo_ped <> '') and (Fitens.Items[I].tipo_item = 'P') then
            SqlExec('update pedvenda_prod set n_nf = %d, serie = %s' +
                    ' where nped = %d and tipo = %s and grupo_prod = %d and cod_prod = %s and nitem = %d' +
                    ' and cod_grade = %d and cod_empresa = %d and codigo_nop = %d and n_nf is null',
                    [num_nf, QuotedStr(serie), Fitens.Items[I].nped, QuotedStr(Fitens.Items[I].tipo_ped),
                     Fitens.Items[I].grupo_prod, QuotedStr(Fitens.Items[I].cod_prod),
                     Fitens.Items[I].nitem_ped, Fitens.Items[I].cod_grade, Fitens.Items[I].cod_empresa,
                     Trunc(Fitens.Items[I].codigo_nop)]);
      end;}
    {$ENDREGION}

    {$REGION 'pedido compra cliente'}
    oPedsCliente := TPedidoCompraCliente.Create(FOwnerFat.queryCons);
    try
      oPedsCliente.AutoPreencheItemsNf(Self.cod_nf);
    finally
      oPedsCliente.Free;
    end;

    {$ENDREGION}

    FTributos.Apply();

    if Acommit then
      if Fcon.Transacao.InTransaction then
        Fcon.Transacao.Commit;

  except on E: Exception do
    begin
      Result := False;

      if Acommit then
        if Fcon.Transacao.InTransaction then
          Fcon.Transacao.Rollback;

      Ferros.New('Erro ao salvar no banco').detalhe := e.Message;
      vDadosIni.registraErro('THw_notafiscal_class.salvar ' + e.Message);
    end;
  end;
end;

function THw_notafiscal_class.ajuste_estoque_montar(Aid_tmp, Acst_icms: string;
  Aitens: TEstoque_ajuste_itens_classList): THw_notafiscal_class;
var
  Atmpprod: THw_produtos_tmp_classList;
  Amerc: TProdutos_class;
  Ait: THw_notafiscal_item_class;
  Ainf_cpl_tipos, Ainf_cpl_nat_op: TStringList;
  I, ArescueCFOP: Integer;
  Asql, Aaux_sql: string;
  Abool: Boolean;
begin
  Result := Self;

  Flog := TConexao.Create;

  try

    Flog.logs_sl('--', 'nfajuste');
    Ferros.identificador := Aid_tmp;

    {$REGION 'criacao de objetos auxiliares'}
    Ainf_cpl_tipos  := vDadosIni.NewStringList(True);
    Ainf_cpl_nat_op := vDadosIni.NewStringList(True);
    {$ENDREGION}

    {$REGION 'obtendo processos'}
    //if FOwnerFat.processos.Count = 0 then
      //FOwnerFat.processos.build_processos_todos;
    {$ENDREGION}

    {$REGION 'iniciando dados da nota'}
    if not Assigned(Fconf_nf) then
      if Assigned(FOwnerFat) then
        Fconf_nf := FOwnerFat.notas.conf_nf;
    if not Assigned(Fconf_nf) then
      Fconf_nf := TConfigGlobalNF.Create(FOwnerFat.buscas, natureza_nf);
    if not Fconf_nf.inicializado then
      Fconf_nf.ExecutarLeitura;

    tipo_nf     := 'P';
    modelo_nf   := vDadosIni.vEmp.vNfe.modeloNF;
    serie       := IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal);
    {$ENDREGION}

    {$REGION 'obtendo cliente/destinatarios/uf/empresa, e atribuindo dados'}
    ArescueCFOP        := Trunc(Self.codigo_nop);
    dados_obter_cliente;
    Self.codigo_nop    := ArescueCFOP;
    consumidor_final   := 'N';
    verificar_mud_cfop := 'N';
    {$ENDREGION}

    {$REGION 'obtendo cadastros com base no pedido'}
    Fcon.SqlExec('delete from produtos_tmp where id_tmp = %s', [QuotedStr(Aid_tmp)]);

    Atmpprod := THw_produtos_tmp_classList.Create;
    for I := 0 to Pred(Aitens.Count) do
      if not Assigned(Atmpprod.GetProduto_tmp(Aitens.Items[I].grupo_prod, Aitens.Items[I].cod_prod)) then
        with Atmpprod.New do
        begin
          id_tmp      := Aid_tmp;
          seqid       := Succ(I);
          cod_empresa := Aitens.Items[I].cod_empresa;
          grupo_prod  := Aitens.Items[I].grupo_prod;
          cod_prod    := Aitens.Items[I].cod_prod;
        end;
    Fcon.QrAux.SQL.Text := Fcon.sql_insert_build('PRODUTOS_TMP',  TProdutos_tmp_class.GetFieldsSql(), nil);
    for I := 0 to Pred(Atmpprod.Count) do with Atmpprod.Items[I] do with Fcon do
    begin
      if not QrAux.Prepared then QrAux.Prepare;

      Atmpprod.Items[I].SetValuesInParams(QrAux).ExecSQL;
    end;

    dados_obter_produtos(Aid_tmp);

    dados_obter_codbarra(Aid_tmp);

    dados_obter_reducaodebase(Aid_tmp);

    dados_obter_trib_adicional(Aid_tmp, cod_cliente, dest_seqid);

    dados_obter_desoneracao(Aid_tmp);

    dados_obter_nat_op(Aid_tmp);
    Fcad_cfop.SetValuesFrom(Fcon.SqlOpen('select distinct %s from nat_op nt where nt.codigo_nop = %d', [TNat_op_class.GetFieldsSql('nt'), Trunc(Self.codigo_nop)]));

    dados_obter_ncm_estado(Aid_tmp);

    dados_obter_mva_ajustada(Aid_tmp);

    dados_obter_ncm(Aid_tmp);

    dados_obter_ibpt(Aid_tmp);

    dados_obter_cest(Aid_tmp);

    dados_obter_opfiscal(Aid_tmp);

    if not Assigned(Fcad_inf_cpl) then
      Fcad_inf_cpl := THw_inf_compl.Create; //  apos a montagem da nota que este objeto é populado
    {$ENDREGION}

    {$REGION 'montando itens da nota fiscal'}
    Flog.logs_elapsed_time('montando itens start');
    for I := 0 to Aitens.Count - 1 do with Aitens.Items[I] do
    if cod_nf > 0 then
      Ferros.New('Item %d já possui nf %d emitida', [Aitens.Items[I].nitem, Aitens.Items[I].cod_nf]).
        detalhe := Format('%d-%s Qtde %0.3n', [Aitens.Items[I].grupo_prod, Aitens.Items[I].cod_prod, Aitens.Items[I].quantidade])
    else
    begin
      Amerc := Fcad_merc.GetProduto(grupo_prod, cod_prod);
      Ait := Fitens.New(Amerc);

      Ait.cod_nf          := Self.cod_nf;
      Ait.cod_empresa     := Self.cod_empresa;
      Ait.nitem           := Fitens.Count;
      Ait.num_fab_prod    := Amerc.num_fab_prod;
      Ait.descricao_item  := Amerc.descr_prod;
      Ait.cod_grade       := Aitens.Items[I].cod_grade;
      Ait.valor_total     := Abs(RoundTo(Aitens.Items[I].custo_tot_aj, -2));
      Ait.quantidade      := Abs(Aitens.Items[I].quantidade);
      Ait.valor_unitario  := Abs(Ait.valor_total / Ait.quantidade);
      Ait.prec_cusm_prod  := Ait.valor_unitario;
      Ait.codigo_nop      := Ait.get_cfop(Self.codigo_nop);
      Ait.id_origem       := IntToStr(Aitens.Items[I].id_it);
      Ait.tipo_calc       := Ord(tcNenhum);
      Ait.tipo_calc_pc    := Ord(tcNenhum);
    end;
    Flog.logs_elapsed_time('montando itens fim');

    Flog.logs_elapsed_time('montando itens rateio');

    for I := 0 to Pred(Fitens.Count) do
    begin
      Ait := Fitens.Items[I];

      Ait.obter_dados_geral;
      Ait.cst        := IfThen((Self.natureza_nf = 'S') or (Acst_icms <> '99'), Copy(Ait.cst, 1, 1) + Acst_icms, Ait.cst);
      Ait.codigo_nop := Self.codigo_nop;
      Ait.cst_pis    := '99';
      Ait.cst_cofins := '99';
      if (vDadosIni.vEmp.vRegime = 'SIMPLES') then
        Ait.csosn := Ait.get_csosn_ajutstado_por_cst;

      Ait.espelho_calc.Clear;
      Ait.calculo_ipi_executar;
      Ait.calculo_piscofins_executar;
      Ait.calculo_icms_executar;
      Ait.calculo_icms_dest_executar;
      Ait.calculo_fcp_executar;
      Ait.calculo_iss_executar;
      Ait.calculo_tributos_executar;
      Ait.calculo_retencoes_executar;
      Ait.calculo_tributos_rtc_executar;

      Ait.validar_dados;
      Ait.validar_dados_saida;
      Ait.Totalizar();

      Ainf_cpl_nat_op.Add(IntToStr(Trunc(Ait.codigo_nop)));

      FTributos.SetItem(Ait.dfe_trib_id, Ait.tributosRTC);;
    end;

    Flog.logs_elapsed_time('montando itens calculo');

    conf_piscofins := 'C';
    //devolucao      := 'SIM';

    {$ENDREGION}

    {$REGION 'somatorios, etc'}
    totais_somar;

    Flog.logs_elapsed_time('somatorio nf');

    {$ENDREGION}

    {$REGION 'montando informacoes complementares'}
    Asql := '';

    if Copy(vDadosIni.vEmp.vRegime, 1, 7) = 'SIMPLES' then
      Ainf_cpl_tipos.Add(vDadosIni.vEmp.vRegime);

    Asql := '';
    if Ainf_cpl_tipos.Count > 0 then
    begin
      for I := 0 to Pred(Ainf_cpl_tipos.Count) do if Trim(Ainf_cpl_tipos[I]) <> '' then
        Asql := IfThen(Asql <> '', Asql + sLineBreak + ' union ' + sLineBreak) +
                Format('select first 1 %s from sped_informacao_complementar sp where sp.tipo = %s and sp.cod_empresa = %d and sp.ativo = 1',
                       [TSped_informacao_complementar_class.GetFieldsSql('sp'), QuotedStr(Ainf_cpl_tipos[I]), cod_empresa]);
    end;

    if Ainf_cpl_nat_op.Count > 0 then
    begin
      Aaux_sql := '';
      for I := 0 to Pred(Ainf_cpl_nat_op.Count) do if Trim(Ainf_cpl_nat_op[I]) <> '' then
        Aaux_sql := Aaux_sql + IfThen(I = 0, '(') + Ainf_cpl_nat_op[I] + IfThen(Pred(Ainf_cpl_nat_op.Count) = I, ')', ',');

      if Aaux_sql <> '' then
        Asql := IfThen(Asql <> '', Asql + sLineBreak + ' union ' + sLineBreak) +
                Format('select %s from nat_op nop' +
                       ' inner join sped_informacao_complementar sp on sp.cod_inf = nop.cod_inf and sp.cod_empresa = %d and sp.ativo = 1' +
                       ' where nop.codigo_nop in %s',
                       [TSped_informacao_complementar_class.GetFieldsSql('sp'), cod_empresa, Aaux_sql]) ;
    end;

    if Asql <> '' then
      Fcad_inf_cpl.SetValuesFrom(Fcon.SqlOpen(Asql));

    for I := 0 to Pred(Fcad_inf_cpl.Count) do
      with Finf_compl.New(Fcad_inf_cpl.Items[I].cod_inf) do
      begin
        cod_inf := Fcad_inf_cpl.Items[I].cod_inf;
        tipo    := Fcad_inf_cpl.Items[I].tipo;

        if (tipo = 'SIMPLES') and (nfe_indiedest = 1) then
          txt_compl := Format('%s PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS NO VALOR DE R$ %0.2n CORRESPONDENTE À ALÍQUOTA DE %0.2n%, NOS TERMOS DO ART.23 DA LC 123/2006',
                              [Fcad_inf_cpl.Items[I].txt, valor_icm_simples, aliq_icm_simples]);
        txt_compl := IfThen(txt_compl = '', Fcad_inf_cpl.Items[I].txt, txt_compl);
      end;

    dados_interesse_fisco.Clear;
    for I:= 0 to Pred(Finf_compl.Count) do with Finf_compl.Items[I] do
      dados_interesse_fisco.Text := dados_interesse_fisco.Text +
                                    IfThen(dados_interesse_fisco.Text <> '', '.') +
                                    StringReplace(txt_compl, sLineBreak, '', [rfReplaceAll, rfIgnoreCase]);

    for I := Pred(dados_interesse_fisco.Count) downto 0 do
      if Trim(dados_interesse_fisco[I]) = '' then
        dados_interesse_fisco.Delete(I);
    dados_interesse_fisco.LineBreak := '';

    for I := 0 to Pred(Finf_compl.Count) do Finf_compl.Items[I].cod_empresa := cod_empresa;
    Flog.logs_elapsed_time('build inf compl');
    {$ENDREGION}

    {$REGION 'validacao de dados do cabeçalho'}
    if nfe_iddest = '3' then
      Ferros.New('Para exportação os detalhes devem ser preenchidos diretamente na nota fiscal');

    if Fitens.Count = 0 then
      Ferros.New('Nota fiscal sem itens')
    else
    begin
      codigo_nop := Fitens.Items[0].get_cfop(codigo_nop);
      Abool := True;
      for I := 0 to Pred(Fitens.Count) do
        if Fitens.Items[I].codigo_nop = codigo_nop then
        begin
          Break;
        end;
      if Abool then
        codigo_nop := Fitens.Items[0].codigo_nop;

      desc_natop := Fcad_cfop.get_nat_op(codigo_nop).descricao_nop;
    end;

    if modelo_nf = '55' then
    begin
      if vDadosIni.vEmp.vNfe.ibgeCodEstado = 0 then
        Ferros.New('Código IBGE do estado do emitente não configurado').detalhe := 'Acesse o cadastro da empresa e configure na aba NF-e';

      if vDadosIni.vEmp.vNfe.ibgeCodCidade = 0 then
        Ferros.New('Código IBGE da cidade do emitente não configurado').detalhe := 'Acesse o cadastro da empresa e configure na aba NF-e';

      if Trim(vDadosIni.vEmp.vNfe.certificadonumSerie) = '' then
        Ferros.New('Nf-e: Certificado Transmissor inválido').detalhe := 'Acesse o cadastro da empresa e preencha o numero de serie do certificado na aba NF-e';

      if dest_cmun = 0 then
        Ferros.New('Código IBGE da cidade do destinatário não infomado').detalhe := 'Acesso no endereço do cliente a cidade ibge corretamente';

      if dest_uf  = '' then
        Ferros.New('Nf-e: Sigla do estado não infomado para o destinatário');

      if (cpfcgc = '') and (dest_cmun <> 9999999) then
        Ferros.New('Nf-e: CPF/CNPJ do destinatário não informado');

      if Trim(vDadosIni.vEmp.vCNPJ) = '' then
        Ferros.New('Nf-e: CNPJ emitente não informado');

      if Trim(vDadosIni.vEmp.vIE) = '' then
        Ferros.New('Nf-e: IE do emitente não informada');
    end;
    Flog.logs_elapsed_time('validacoes');
    {$ENDREGION}

    if (Ferros.Count = 0) then
      status := IfThen( natureza_nf = 'S', nf_stsFechada, status);

    Flog.logs_elapsed_time('fim');
  finally
    if Assigned(Ainf_cpl_nat_op) then FreeAndNil(Ainf_cpl_nat_op);
    if Assigned(Ainf_cpl_tipos ) then FreeAndNil(Ainf_cpl_tipos);
    if Assigned(Flog           ) then FreeAndNil(Flog);
    if Assigned(Atmpprod       ) then FreeAndNil(Atmpprod);
  end;
end;

procedure THw_notafiscal_class.build_nf_campos;
begin
  vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(con.buscas);

  cod_nf                   := 0;
  num_nf                   := 0;
  status                   := nf_stsAberta;
  serie                    := IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal);
  modelo_nf                := vDadosIni.vEmp.vNfe.modeloNF;
  cod_empresa              := StrToInt(vDadosIni.codEmpresa);
  data_contabil            := DateOf(vDadosIni.vDataHora);
  hora_emissao             := FormatDateTime('HH:MM:SS', Timeof(vDadosIni.vDataHora));
  data_lanc                := data_contabil;
  cod_vendedor             := vDadosIni.vCodUsuario;
  cod_usuario              := vDadosIni.vCodUsuario;
  natureza_nf              := 'S';
  emissao_propria          := 'S';
  freteconta_tr            := '9';
  da                       := 'N';
  frete_f_nfe              := 'N';
  frete_base_ipi           := 'N';
  frete_base_icm           := 'N';
  ipi_base_icm             := 'N';
  tipo_desconto            := 'R';
  tipo_seguro              := 'R';
  tipo_outdesp             := 'R';
  tipo_frete               := 'R';
  tipo_emissao             := '1';
  verificar_mud_cfop       := 'S';
  nfe_indpres              := Fconf_nf.Conf_Geral.nf_campos_default_indicadordepresenca(natureza_nf);
  tem_piscofins_st         := 'N';
  add_piscofins_st_totalnf := 'N';
  num_gerado               := 'N';
  com_prod                 := 'N';
  com_serv                 := 'N';
  extemporaneo             := 'N';
  complementar_ent         := 'N';
  serie_emt                := '0';         
  totais_com_deson         := IfThen(natureza_nf = 'S', 'S');
  nfe_indpres              := Fconf_nf.Conf_Geral.nf_campos_default_indicadordepresenca(natureza_nf);
  indintermed              := '0';
  import_xml               := 'Ver002';
  nfe_versao               := nf_strVer400;
  nfe_tpemis               := IfThen(vDadosIni.vEmp.vNfe.danfeFormaEmissao = 'SVC', '6', '1');
  nfe_tpamb                := IfThen(vDadosIni.vEmp.vNfe.webServiceAmbiente = 'Produção', '1', '2');
  nfe_dhcont               := IfThen(nfe_tpemis[1] in ['4','6'], vDadosIni		.vEmp.vNfe.nfe_dhcont);
  nfe_xjust                := IfThen(nfe_tpemis[1] in ['4','6'], vDadosIni.vEmp.vNfe.nfe_xjust);

  tpimp := IndexText(vDadosIni.vEmp.vNfe.danfeTipo, FormatoImpressaoDANFeEnumStr); // Obtem o indice correspondente
  tpimp := IfThen( tpimp = -1, Ord(fidRetrato));                // Caso valor seja inválido

  crt := IfThen(vDadosIni.vEmp.vRegime = reg_sn, '1') +
         IfThen(vDadosIni.vEmp.vRegime = reg_sn_ex, '2') +
         IfThen(not vDadosIni.strIn(vDadosIni.vEmp.vRegime,[reg_sn, reg_sn_ex]), '3');
  if crt = '1' then
    aliq_icm_simples := vDadosIni.vEmp.vAliqSimplesICM;
end;

function THw_notafiscal_class.complemento_restituicao_montar(Aid_tmp: string): THw_notafiscal_class;
var
  Ait: THw_notafiscal_item_class;
  I: Integer;
  Apag: TNotafiscal_pag_class;
begin
  Result := Self;

  Flog := TConexao.Create;

  try

    Flog.logs_sl('--', 'nfcomplrest_icmsst');
    Ferros.identificador := Aid_tmp;

    {$REGION 'obtendo processos'}
    //if FOwnerFat.processos.Count = 0 then
      //FOwnerFat.processos.build_processos_todos;
    {$ENDREGION}

    {$REGION 'iniciando dados da nota'}
    if not Assigned(Fconf_nf) then
      if Assigned(FOwnerFat) then
        Fconf_nf := FOwnerFat.notas.conf_nf;
    if not Assigned(Fconf_nf) then
      Fconf_nf := TConfigGlobalNF.Create(FOwnerFat.buscas, natureza_nf);
    if not Fconf_nf.inicializado then
      Fconf_nf.ExecutarLeitura;

    tipo_nf     := 'O';
    modelo_nf   := vDadosIni.vEmp.vNfe.modeloNF;
    serie       := IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal);
    {$ENDREGION}

    {$REGION 'obtendo cliente/destinatarios/uf/empresa, e atribuindo dados'}
    dados_obter_cliente;
    cod_cond_pag := Fcliente.cod_cond_pag;
    consumidor_final   := 'N';
    verificar_mud_cfop := 'N';
    tipo_emissao       := '3';
    {$ENDREGION}

    {$REGION 'chamando metodos para criar objetos'}
    if not Assigned(Fcad_cfop) then
      Fcad_cfop := THw_nat_op_classList.Create;
    if not Assigned(Fcad_ncm_loc) then
      Fcad_ncm_loc := THw_nbm_class.Create;
    Ait := Fitens.Items[0];
    Fcad_cfop.SetValuesFrom(Fcon.SqlOpen('select distinct %s from nat_op nt where nt.codigo_nop = %d', [TNat_op_class.GetFieldsSql('nt'), Trunc(Ait.codigo_nop)]));
    {$ENDREGION}

    if not Assigned(Fcad_inf_cpl) then
      Fcad_inf_cpl := THw_inf_compl.Create; //  apos a montagem da nota que este objeto é populado

    {$REGION 'montando itens da nota fiscal'}
    Flog.logs_elapsed_time('montando itens start');
    Ait.cod_nf                     := Self.cod_nf;
    Ait.cod_empresa                := Self.cod_empresa;
    Ait.nitem                      := Fitens.Count;
    Ait.tipo_calc                  := Ord(tcNenhum);
    Ait.tipo_calc_pc               := Ord(tcNenhum);
    Self.codigo_nop                := Ait.codigo_nop;
    Self.desc_natop                := Ait.desc_natop;

    Flog.logs_elapsed_time('montando itens fim');

    Flog.logs_elapsed_time('montando itens rateio');

    for I := 0 to Pred(Fitens.Count) do
    begin
      Ait := Fitens.Items[I];

      Ait.obter_dados_geral;
      Ait.codigo_nop := Self.codigo_nop;
      if (vDadosIni.vEmp.vRegime = 'SIMPLES') then
      begin
        Ait.cst        := '000';
        Ait.cst        := Ait.get_cst_ajutstado_por_csosn;
        Ait.cst_pis    := '99';
        Ait.cst_cofins := '99';
      end
      else
        Ait.csosn := '';

      Ait.espelho_calc.Clear;
      Ait.calculo_ipi_executar;
      Ait.calculo_piscofins_executar;
      Ait.calculo_icms_executar;
      Ait.calculo_icms_dest_executar;
      Ait.calculo_fcp_executar;
      Ait.calculo_iss_executar;
      Ait.calculo_tributos_executar;
      Ait.calculo_retencoes_executar;
      Ait.calculo_tributos_rtc_executar;

      Ait.validar_dados;
      Ait.validar_dados_saida;
      Ait.Totalizar();

      FTributos.SetItem(Ait.dfe_trib_id, Ait.tributosRTC);;
    end;

    Flog.logs_elapsed_time('montando itens calculo');

    conf_piscofins := 'C';
    //devolucao      := 'SIM';
    {$ENDREGION}

    {$REGION 'pagamentos'}
    Apag := Fpag.New();
    Apag.tpag := 90;
    Apag.cod_nf := Self.cod_nf;
    Apag.cod_empresa := Self.cod_empresa;
//    Apag.tpag := 9;
//    Apag.cod_empresa :=
//    with Apag do
//    begin
//      tpag := 90;
//      cod_nf
//    end;

    if cod_cond_pag = 0 then
      cod_cond_pag := FOwnerFat.SqlOpen('select first 1 cod_cond_pag from cond_pag order by cod_cond_pag').FieldByName('cod_cond_pag').AsInteger;
    {$ENDREGION}

    {$REGION 'somatorios, etc'}
    totais_somar;

    Flog.logs_elapsed_time('somatorio nf');

    {$ENDREGION}

    {$REGION 'validacao de dados do cabeçalho'}
    if nfe_iddest = '3' then
      Ferros.New('Para exportação os detalhes devem ser preenchidos diretamente na nota fiscal');

    if Fitens.Count = 0 then
      Ferros.New('Nota fiscal sem itens');

    validacoes_nfe;
    Flog.logs_elapsed_time('validacoes');
    {$ENDREGION}

    if (Ferros.Count = 0) then
      status := IfThen( natureza_nf = 'S', nf_stsFechada, status);

    Flog.logs_elapsed_time('fim');
  finally
    if Assigned(Flog) then FreeAndNil(Flog);
  end;
end;

function THw_notafiscal_class.sql_fields_ignored_get(
  Atable: string): TStringList;
begin
  Result               := TStringList.Create;
  Result.LineBreak     := ',';
  if Atable = tb_nf then
    Result.Text := 'n_comando,cod_cons,tp_ligacao,cod_grupo_tensao,cst_despesa,tp_assinante,dados_lancamento_fiscal,nfe_cmsg,nfe_xmsg,' +
                   'nfe_dpec_cstat,nfe_dpec_xmotivo,nfe_dpec_nregdpec,n_caixa,inf_corpo_v,lote_nfe,path_xml_import,cod_devolucao,cod_nf_rem_vfe,' +
                   'nfe_recibo,stat_nferecibo,ufembarq,xlocembarq,sem_serie,cod_nf_transf,cod_emp_transf,dup_xml_entrada,somenserv,mod_des_bh,' +
                   'chave_nfse,motivo_nao_retencao,tipo_rec_issqn,local_incidencia,lote_conferencia,xlocdespacho,data_estoque,xml_nfe,chave_nfe,' +
                   'tr_rntc,nfe_cstat,cl_clultimacompra,cl_status_f,codigo_tr,num_nfem,data_ent_saida,hora_ent_saida,qtde_volumes_tr,' +
                   'data_autorizacao,codigoerro,tiponfe,datahora_envio,sel_nfe,n_form_seguranca,num_nf_vndant,sub_serieant,subserie,id_modelo21,' +
                   'num_ped,antec_trib,devolucao,benef_fiscal,conf_ent,tp_nf,mnf,cod_nf_ref,num_nf_compl,serie_compl,temporesposta,hora_envio,' +
                   'danfeimpresso,just_cancelamento,inutilnfant,cod_producao_mp,resultado_envio,digest,protocolo,descricaoerro'
  else if Atable = tb_nf_it then
    Result.Text := 'cod_servico,chassi,data_validade,cod_nf_dev,nitem_dev,nitem_rem_vfe,ean13,' +
                   'cod_cred_ret_fin,cod_estmoto,espelho_calc_st,mnf,red_lucro,import_xml,bx_retorno_fin';
end;

procedure THw_notafiscal_class.dados_obter_cest(Aid_tmp: string;
  clearList: Boolean);
var
  list: TCestsM;
  I: Integer;
begin
  list := TCest_Builder.GetCest(Aid_tmp, vDadosIni.vEmp.vSiglaUF, Self.dest_uf, TConexao(Self.con), vDadosIni.codEmpresa);

  if not Assigned(Fcad_cest) then
    Fcad_cest := TCestsM.Create;

  if clearList then
    Fcad_cest.Clear;

  for I := 0 to list.Count - 1 do
    Fcad_cest.Add(list.Items[I]);

  if Assigned(Flog) then Flog.logs_elapsed_time('cest');
end;

procedure THw_notafiscal_class.dados_obter_cliente(updateFields: Boolean);
var
  Astr: string;
  Alist: TStringList;
  I: Integer;
begin
  //changedClient := (Fcliente.cod_cliente > 0) and (Fcliente.cod_cliente <> cod_cliente);

  Fcliente.SetValuesFrom(con.SqlOpen('select %s from clientes where cod_cliente = %d and cod_empresa = %d',
                                     [TClientes_class.GetFieldsSql(), Self.cod_cliente, Self.cod_empresa]));

  Fdest_nf.SetValuesFrom(con.SqlOpen('select %s from vw_clientes_dest where cod_cliente = %d and cod_empresa = %d and dest_seqid = %d',
                                     [TVw_clientes_dest_class.GetFieldsSql(), Self.cod_cliente, Self.cod_empresa, Self.dest_seqid]));


  Fdados_uf.SetValuesFrom(con.SqlOpen('select e.pfcp, e.aliq_intra, e.ibge_codigo_uf, es.inscricao,' +
                                      ' cm.icm_ext_c, cm.icm_ext_nc,' +
                                      ' coalesce(cm.natop_ext_c, 6102) natop_ext_c,' +
                                      ' coalesce(cm.natop_ext_nc, 6102) natop_ext_nc,' +
                                      ' coalesce(cm.natop_int_c, 5102) natop_int_c   ,' +
                                      ' coalesce(cm.natop_int_nc, 5102) natop_int_nc' +
                                      ' from estados e' +
                                      ' left join empresa em on em.cod_empresa = %d' +
                                      ' left join empresa_substituto es on es.cod_empresa = em.cod_empresa and e.sigla_uf = es.sigla_uf' +
                                      ' left join cfop_mud cm on cm.codigo_uf = em.uf_emp and cm.uf_destino = e.codigo_uf' +
                                      ' where e.sigla_uf = %s', [Self.cod_empresa, QuotedStr(Fdest_nf.uf)]));

  if not updateFields then
    Exit;

  cod_cliente          := Fcliente.cod_cliente;
  nome_cliente         := Fcliente.nome_cliente;
  razao                := Fcliente.razao;
  cpfcgc               := Fcliente.cpfcgc;
  finalidadeid         := Fcliente.finalidadeid;
  ret_fed              := Fcliente.ret_fed;
  dest_idestrangeiro   := Fdest_nf.idestrangeiro;
  dest_isuf            := Fdest_nf.isuf;
  dest_im              := Fdest_nf.im;
  dest_email           := Fdest_nf.email;
  dest_xlgr            := Fdest_nf.logradouro;
  dest_nro             := Fdest_nf.numero;
  dest_xcpl            := Fdest_nf.complemento;
  dest_xbairro         := Fdest_nf.bairro;
  dest_cmun            := Fdest_nf.cmun;
  dest_xmun            := Fdest_nf.cidade;
  dest_uf              := Fdest_nf.uf;
  dest_cep             := Fdest_nf.cep;
  dest_cpais           := Fdest_nf.cpais;
  dest_xpais           := Fdest_nf.xpais;
  dest_fone            := Fdest_nf.telefone;
  insc_est             := Fdest_nf.insc_est;
  dest_seqid           := Fdest_nf.dest_seqid;
  inscricao_substituto := Fdados_uf.inscricao;
  cmunfgibs            := Fdest_nf.cmun;

  if (consumidor_final = '') //or (changedClient)
    then
    consumidor_final   := IfThen(Fcliente.consumidor_final <> '', Fcliente.consumidor_final, 'S');

  if (nfe_iddest = '') //or (changedClient)
    then
    nfe_iddest         := IfThen(vDadosIni.vEmp.vSiglaUF = dest_uf, '1', IfThen(dest_uf = 'EX', '3', '2'));

  nfe_indiedest        := IfThen(Fdest_nf.indiedest > 0, Fdest_nf.indiedest, IfThen(vDadosIni.strIn(insc_est, ['', 'ISENTO']), 9, 1));
  //se o produto é tributado pelo icms, a partir 01/01/2016 o webservice nao aceita mais aliquota superior a 12 ou 7 depedendo do estado
  aliq_icm             := IfThen(nfe_iddest = '1', Fdados_uf.aliq_intra, Fdados_uf.icm_ext_c);
                                 //IfThen((nfe_indiedest <> 1) or (consumidor_final = 'S'), Fdados_uf.icm_ext_nc, Fdados_uf.icm_ext_c));
  aliq_icm             := IfThen(aliq_icm > 0, aliq_icm, vDadosIni.vEmp.vAliqPadrao);
  aliq_icm             := IfThen(aliq_icm > 0, aliq_icm, 18);
  aliq_icm_simples     := IfThen(crt = '1', vDadosIni.vEmp.vAliqSimplesICM);
  codigo_nop           := IfThen(nfe_iddest = '1',
                                 IfThen((nfe_indiedest <> 1) or (consumidor_final = 'S'), Fdados_uf.natop_int_nc, Fdados_uf.natop_int_c),
                                 IfThen((nfe_indiedest <> 1) or (consumidor_final = 'S'), Fdados_uf.natop_ext_nc, Fdados_uf.natop_ext_c));
  {$REGION 'validando o email'}
  Astr := '';  
  Alist := TStringList(vDadosIni.StrToTStrings(dest_email, [',', ';', '|', sLineBreak, ' ']));
  for I := 0 to Alist.Count - 1 do
    if Length(Astr +  IfThen(Astr <> '', ',') + Alist[I]) > 60 then
      Break
    else
      Astr := Astr + IfThen(Astr <> '', ',') + Alist[I];
  dest_email := Astr;
  FreeAndNil(Alist);
  {$ENDREGION}
  if Assigned(Flog) then Flog.logs_elapsed_time('clientes');
end;

constructor THw_notafiscal_class.Create(AOwner: THw_faturamento; AOwnerPedvenda: THw_pedvenda_class);
begin
  FOwnerPV := AOwnerPedvenda;
  Create(AOwner);

  pedvenda_montar(FOwnerPV);
end;

procedure THw_notafiscal_class.dados_obter_codbarra(Aid_tmp: string;
  clearList: Boolean);
begin
  if not Assigned(Fcad_cbarra) then
    Fcad_cbarra := THw_cod_barra_classList.Create;

  if clearList then
    Fcad_cbarra.Clear;

  Fcad_cbarra.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                 ' inner join cod_barra cb on (pvp.grupo_prod = cb.grupo_prod) and (pvp.cod_prod = cb.cod_prod) and (pvp.cod_empresa = cb.cod_empresa)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TCod_barra_class.GetFieldsSql('cb'), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('codbarra');
end;

procedure THw_notafiscal_class.dados_obter_desoneracao(Aid_tmp: string;
  clearList: Boolean);
begin
  if not Assigned(Fcad_deson) then
    Fcad_deson := THw_desoneracao_classList.Create;

  if clearList then
    Fcad_deson.Clear;

  Fcad_deson.SetValuesFrom(
    Fcon.SqlOpen(' select distinct pr.nbm ncm,' +
                 '   case when de.desoneracaoid is null then d.ind_desoneracao else 0 end ind_desoneracao, dr.csts' +
                 ' from produtos_tmp prt' +
                 ' inner join produtos pr on (prt.grupo_prod = pr.grupo_prod) and (prt.cod_prod = pr.cod_prod) and (prt.cod_empresa = pr.cod_empresa)' +
                 ' inner join desoneracao d on d.cod_empresa = pr.cod_empresa' +
                 ' inner join desoneracao_regras dr on dr.desoneracaoid = d.id and dr.cod_empresa = d.cod_empresa' +
                 '   and dr.sigla_uf like %s and dr.contribuinte like %s and dr.pessoa like %s and dr.consumidor_final like %s' +
                 '   and coalesce(dr.finalidadeid, %d) = %d' +
                 ' left join desoneracao_excecoes de on de.desoneracaoid = d.id and de.cod_empresa = d.cod_empresa' +
                 '   and de.ncm = pr.nbm' +
                 ' where prt.id_tmp = %s and prt.cod_empresa = %d',
                 [QuotedStr('%' + Self.dest_uf + '|%'),
                  QuotedStr('%' + IntToStr(Self.nfe_indiedest) + '|%'),
                  QuotedStr('%' + IfThen(Length(Self.cpfcgc)   =  14, '1', '0') + '|%'),
                  QuotedStr('%' + IfThen(Self.consumidor_final = 'S', '1', '0') + '|%'),
                  Self.finalidadeid, Self.finalidadeid, QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('desoneracao');
end;

procedure THw_notafiscal_class.dados_obter_ecommerce();
begin
  if FOwnerPV.id_commerce = 0 then
    Exit;

  if not Fcon.SqlOpen('select pv.id_commerce, pv.local_venda, ct.nome_ctrl, cl.nome_cliente, cl.cpfcgc from pedvenda pv' +
                 ' left join intermediador_controle_ec i on i.local_venda = pv.local_venda and i.cod_empresa = pv.cod_empresa' +
                 ' left join controles ct on ct.codigo_ctrl = i.codigo_ctrl and ct.codigo_emp = i.cod_empresa' +
                 ' left join clientes cl on cl.cod_cliente = ct.cartao_sped_part and cl.cod_empresa = ct.codigo_emp' +
                 ' where pv.nped = %d and pv.tipo = %s and pv.cod_empresa = %d and pv.id_commerce > 0',
                 [FOwnerPV.nped, QuotedStr(FOwnerPV.tipo), Self.cod_empresa]).IsEmpty then
  begin
    nfe_indpres := '2';
    if Trim(Fcon.buscas.FieldByName('cpfcgc').AsString) = vDadosIni.vEmp.vCNPJ then
      indintermed := '0'
    else if Trim(Fcon.buscas.FieldByName('cpfcgc').AsString) <> '' then
    begin
      indintermed := '1';
      infintermed_cnpj := Trim(Fcon.buscas.FieldByName('cpfcgc').AsString);
      infintermed_idcadinttran := Trim(Fcon.buscas.FieldByName('nome_cliente').AsString);
    end
    else if vDadosIni.vDataHora >= EncodeDate(2021, 09, 01) then
    begin
      Ferros.New('Venda do ecommerce e não foi encontrado a ligação entre o Intermediador/Marketplace dessa venda com o cadastro de clientes/fornecedor' + sLineBreak +
                 'O vínculo é feito com o Controle, e no seu cadastro existe o campo usado para vincular as operações de pagamento(cartão e ecommerce)' + sLineBreak + sLineBreak +
                 'Informação do ecommerce: %s' + sLineBreak + sLineBreak +
                 'Por favor faça as configurações para evitar rejeições do Webservice da Sefaz', [Fcon.buscas.FieldByName('local_venda').AsString]);
      indintermed := '1';
    end;
  end;
end;

procedure THw_notafiscal_class.dados_obter_ibpt(Aid_tmp: string;
  clearList: Boolean);
var
  Ancms: TStringList;
  I: Integer;
begin
  if not Assigned(Fcad_ibpt) then
    Fcad_ibpt := THw_ibpt_class.Create;

  if clearList then
    Fcad_ibpt.Clear;

  Fcad_ibpt.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                 ' inner join ibpt on (ibpt.codigo = pr.nbm) and (ibpt.ex = 0) and (ibpt.uf = %s)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TIbpt_class.GetFieldsSql('ibpt'), QuotedStr(dest_uf), QuotedStr(Aid_tmp), Self.cod_empresa]));

  Ancms := vDadosIni.NewStringList(True);
  for I := 0 to Pred(Fcad_ibpt.Count) do with Fcad_ibpt.Items[I] do
    if (Date > vigenciafim) and (Length(codigo) = 8) then
      Ancms.Add(codigo);

  for I := 0 to Pred(Fcad_merc.Count) do with Fcad_merc.Items[I] do
    if (not Assigned(Fcad_ibpt.get_ibpt(nbm, dest_uf, 0))) and (Length(nbm) = 8) then
      Ancms.Add(nbm);

  if Fconf_nf.Conf_Geral.nf_ibpt_consulta_tributos.AsBoolean then
    for I := 0 to Pred(Ancms.Count) do
    hw_ibpt_produtos_get(vDadosIni.vBancoHW, vDadosIni.fdbUsuario, vDadosIni.fdbSenha, StrToInt(vDadosIni.codEmpresa),
      '03530705000109', Ancms[I], vDadosIni.vEmp.vSiglaUF, 0);

  if Ancms.Count > 0 then
  begin
    Fcad_ibpt.Clear;
    Fcad_ibpt.SetValuesFrom(Fcon.SqlOpen(Fcon.QrAux.SQL.Text));
  end;

  if Assigned(Ancms) then FreeAndNil(Ancms);
  if Assigned(Flog) then Flog.logs_elapsed_time('ibpt');
end;

procedure THw_notafiscal_class.dados_obter_mva_ajustada(Aid_tmp: string;
  clearList: Boolean);
begin
  if not Assigned(Fcad_mva_aj) then
    Fcad_mva_aj := THw_mva_ajustada_ncm_class.Create;

  if clearList then
    Fcad_mva_aj.Clear;

  Fcad_mva_aj.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                 ' inner join estados es on (es.sigla_uf = %s)' +
                 ' inner join mva_ajustada_ncm ma on (ma.cod_ncm = pr.nbm) and (ma.codigo_uf = es.codigo_uf)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TMva_ajustada_ncm_class.GetFieldsSql('ma'), QuotedStr(Self.dest_uf), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('mva_ajustado');
end;

procedure THw_notafiscal_class.dados_obter_nat_op(Aid_tmp: string;
  cfopsItens: array of Integer; clearList: Boolean);
var
  strCfops: string;
  I: Integer;
  cfops: arrayInt;
begin
  if not Assigned(Fcad_cfop) then
    Fcad_cfop := THw_nat_op_classList.Create;

  if clearList then
    Fcad_cfop.Clear;

  cfops := Fitens.getCfopItens;
  for I := Low(cfopsItens) to High(cfopsItens) do
  begin
    SetLength(cfops, Length(cfops) + 1);
    cfops[High(cfops)] := cfopsItens[I];
  end;    

  strCfops := '';
  for I := Low(cfops) to High(cfops) do
    strCfops := strCfops + IfThen(strCfops <> '', ',') + IntToStr(cfops[I]);
  if strCfops = '' then
    strCfops := '0';

  Fcad_cfop.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from nat_op where (codigo_nop in (%s))' +
                 ' union' +
                 ' select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                 ' left  join cfop_mud cm on (cm.ativo = 1)' +
                 ' inner join nat_op nt on ((nt.codigo_nop = pr.codigo_nop) or (nt.codigo_nop = pr.cfop_inter_n_cont) or' +
                 '                          (nt.codigo_nop = cm.natop_int_nc) or (nt.codigo_nop = cm.natop_int_c) or' +
                 '                          (nt.codigo_nop = cm.natop_ext_nc) or (nt.codigo_nop = cm.natop_ext_c))' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d' +
                 ' union' +
                 ' select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos_trib_ad ad on (ad.grupo_prod = pvp.grupo_prod) and (ad.cod_prod = pvp.cod_prod) and (ad.cod_empresa = pvp.cod_empresa)' +
                 ' inner join produtos_trib_pf pf on (pf.cod_trib_pf = ad.cod_trib_pf) and (pf.cod_empresa = ad.cod_empresa) and (pf.ativo = 1)' +
                 ' inner join nat_op nt on (nt.codigo_nop = pf.codigo_nop)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TNat_op_class.GetFieldsSql(), strCfops,
                  TNat_op_class.GetFieldsSql('nt'), QuotedStr(Aid_tmp), Self.cod_empresa,
                  TNat_op_class.GetFieldsSql('nt'), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('natop');
end;

procedure THw_notafiscal_class.dados_obter_nat_op(Aid_tmp: string;
  clearList: Boolean);
var
  strCfops: string;
  I: Integer;
  cfops: arrayInt;
begin
  if not Assigned(Fcad_cfop) then
    Fcad_cfop := THw_nat_op_classList.Create;

  if clearList then
    Fcad_cfop.Clear;

  cfops := Fitens.getCfopItens;

  strCfops := '';
  for I := Low(cfops) to High(cfops) do
    strCfops := strCfops + IfThen(strCfops <> '', ',') + IntToStr(cfops[I]);
  if strCfops = '' then
    strCfops := '0';

  Fcad_cfop.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from nat_op where (codigo_nop in (%s))' +
                 ' union' +
                 ' select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                 ' left  join cfop_mud cm on (cm.ativo = 1)' +
                 ' inner join nat_op nt on ((nt.codigo_nop = pr.codigo_nop) or (nt.codigo_nop = pr.cfop_inter_n_cont) or' +
                 '                          (nt.codigo_nop = cm.natop_int_nc) or (nt.codigo_nop = cm.natop_int_c) or' +
                 '                          (nt.codigo_nop = cm.natop_ext_nc) or (nt.codigo_nop = cm.natop_ext_c))' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d' +
                 ' union' +
                 ' select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos_trib_ad ad on (ad.grupo_prod = pvp.grupo_prod) and (ad.cod_prod = pvp.cod_prod) and (ad.cod_empresa = pvp.cod_empresa)' +
                 ' inner join produtos_trib_pf pf on (pf.cod_trib_pf = ad.cod_trib_pf) and (pf.cod_empresa = ad.cod_empresa) and (pf.ativo = 1)' +
                 ' inner join nat_op nt on (nt.codigo_nop = pf.codigo_nop)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TNat_op_class.GetFieldsSql(), strCfops, 
                  TNat_op_class.GetFieldsSql('nt'), QuotedStr(Aid_tmp), Self.cod_empresa,
                  TNat_op_class.GetFieldsSql('nt'), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('natop');
end;

procedure THw_notafiscal_class.dados_obter_ncm(Aid_tmp: string;
  clearList: Boolean);
begin
  if not Assigned(Fcad_ncm_loc) then
    Fcad_ncm_loc := THw_nbm_class.Create;

  if clearList then
    Fcad_ncm_loc.Clear;

  Fcad_ncm_loc.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                 ' inner join nbm ncm on (ncm.cod_ncm = pr.nbm)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TNbm_class.GetFieldsSql('ncm'), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('ncms');
end;

procedure THw_notafiscal_class.dados_obter_ncm_estado(Aid_tmp: string;
  clearList: Boolean);
begin
  if not Assigned(Fcad_ncm_dest) then
    Fcad_ncm_dest := THw_nbm_estado_class.Create;

  if clearList then
    Fcad_ncm_dest.Clear;

  Fcad_ncm_dest.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                 ' inner join estados es on (es.sigla_uf = %s)' +
                 ' inner join nbm_estado ne on (rtrim(ne.cod_nbm) = pr.nbm) and (ne.codigo_uf = es.codigo_uf)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TNbm_estado_class.GetFieldsSql('ne'), QuotedStr(Self.dest_uf), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('nbm_estados');
end;

procedure THw_notafiscal_class.dados_obter_opfiscal(Aid_tmp: string;
  clearList: Boolean);
var
  condNota: TCondicaoFiscal;
  list: TCadItensTributos;
  I: Integer;
begin
  condNota.cidadeIbgeDest := Self.dest_cmun;
  condNota.indiedest      := IntToStr(Self.nfe_indiedest);
  condNota.consumoFinal   := Self.consumidor_final;
  condNota.finalidadeId   := Self.finalidadeid;
  condNota.pessoa         := IfThen(Length(Self.cpfcgc) = 14, 'PJ', 'PF');
  condNota.ufDest         := Self.uf_operacao;
  condNota.tipoNF         := TTipoNotaFiscal(IfThen(Self.tipo_nf = 'S', 1) +
                                             IfThen(Self.tipo_nf = 'O', 4) +
                                             IfThen(Self.tipo_nf = 'D', 5));

  list := OpFiscal.GetOperacoes(Aid_tmp, condNota, vDadosIni.cod_empresa, TConexao(Self.con));

  if not Assigned(Fcad_opfiscal) then
    Fcad_opfiscal := TCadItensTributos.Create;

  if clearList then
    Fcad_opfiscal.Clear;

  for I := 0 to list.Count - 1 do
    Fcad_opfiscal.Add(list.Items[I]);

  if Assigned(Flog) then Flog.logs_elapsed_time('opfiscal');
end;

procedure THw_notafiscal_class.dados_obter_produtos(Aid_tmp: string;
  clearList: Boolean);
begin
  if not Assigned(Fcad_merc) then
    Fcad_merc := THw_produtos_classList.Create;

  if clearList then
    Fcad_merc.Clear;

  Fcad_merc.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TProdutos_class.GetFieldsSql('pr'), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('produtos');
end;

procedure THw_notafiscal_class.dados_obter_reducaodebase(Aid_tmp: string;
  clearList: Boolean);
begin
  if not Assigned(Fcad_redu) then
    Fcad_redu := TReducao_classList.Create;

  if clearList then
    Fcad_redu.Clear;

  Fcad_redu.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                 ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                 ' inner join reducao re on (pr.grupo_prod = re.grupo_prod) and (pr.cod_prod = re.cod_prod) and (pr.cod_empresa = re.cod_empresa)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TReducao_class.GetFieldsSql('re'), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('redbase');
end;

procedure THw_notafiscal_class.dados_obter_servicos(Aid_tmp: string;
  clearList: Boolean);
begin
  if not Assigned(Fcad_serv) then
    Fcad_serv := THw_tipo_servico_classList.Create;

  if clearList then
    Fcad_serv.Clear;

  Fcad_serv.SetValuesFrom(
    Fcon.SqlOpen('select distinct %s from produtos_tmp pvp' +
                 ' inner join tipo_servico ts on (ts.cod_servico = pvp.grupo_prod) and (''SERV'' = pvp.cod_prod)' +
                 ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
                 [TTipo_servico_class.GetFieldsSql('ts'), QuotedStr(Aid_tmp), Self.cod_empresa]));
  if Assigned(Flog) then Flog.logs_elapsed_time('servicos');
end;

procedure THw_notafiscal_class.dados_obter_trib_adicional(Aid_tmp: string;
  Acod_cliente, Adest_seqid: Integer; clearList: Boolean);
begin
  if not Assigned(Fcad_trib) then
    Fcad_trib := THw_prod_trib_ad_classList.Create;

  if clearList then
    Fcad_trib.Clear;

  Fcad_trib.SetValuesFrom(
    Fcon.SqlOpen(
      Format('select distinct pvp.grupo_prod,  pvp.cod_prod,' +
             ' pf.cod_trib_pf, pf.cod_empresa, pf.descricao_pf, pf.sigla_uf, pf.contribuinte, pf.pessoa, pf.cst_icms, pf.codigo_nop,' +
             ' pf.aliq_intra, pf.aliq_inter, pf.mva, pf.perc_red_prod, pf.reducao_cad_produto, pf.ativo, pf.consumidor_final, pf.fcp_aliq,' +
             ' 0 cod_cliente, 0 dest_seqid, pf.ind_desoneracao, pf.finalidadeid, pf.usar_mva_anexoxv' +
             ' from produtos_tmp pvp' +
             ' inner join produtos_trib_ad ad on (ad.grupo_prod = pvp.grupo_prod) and (ad.cod_prod = pvp.cod_prod) and (ad.cod_empresa = pvp.cod_empresa)' +
             ' inner join produtos_trib_pf pf on (pf.cod_trib_pf = ad.cod_trib_pf) and (pf.cod_empresa = ad.cod_empresa) and (pf.ativo = 1) and coalesce(pf.finalidadeid, %d) = %d' +
             ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
             [Self.finalidadeid, Self.finalidadeid, QuotedStr(Aid_tmp), Self.cod_empresa]) +
      Format(' union' +
             ' select distinct pvp.grupo_prod,  pvp.cod_prod,' +
             ' pf.cod_trib_pf, pf.cod_empresa, pf.descricao_pf, pf.sigla_uf, pf.contribuinte, pf.pessoa, pf.cst_icms, pf.codigo_nop,' +
             ' pf.aliq_intra, pf.aliq_inter, pf.mva, pf.perc_red_prod, pf.reducao_cad_produto, pf.ativo, pf.consumidor_final, pf.fcp_aliq,' +
             ' ct.cod_cliente, ct.end_doc_add_seqid dest_seqid, pf.ind_desoneracao, pf.finalidadeid, pf.usar_mva_anexoxv'+
             ' from produtos_tmp pvp' +
             ' inner join produtos_trib_ad ad on (ad.grupo_prod = pvp.grupo_prod) and (ad.cod_prod = pvp.cod_prod) and (ad.cod_empresa = pvp.cod_empresa)' +
             ' inner join produtos_trib_pf pf on (pf.cod_trib_pf = ad.cod_trib_pf) and (pf.cod_empresa = ad.cod_empresa) and (pf.ativo = 1) and coalesce(pf.finalidadeid, %d) = %d' +
             ' inner join clientes_trib_ad ct on ct.cod_cliente = %d and ct.cod_empresa = ad.cod_empresa and' +
             '   ct.end_doc_add_seqid = %d and ct.cod_trib_pf = ad.cod_trib_pf' +
             ' where pvp.id_tmp = %s and pvp.cod_empresa = %d',
             [Self.finalidadeid, Self.finalidadeid, Acod_cliente, Adest_seqid, QuotedStr(Aid_tmp), Self.cod_empresa])));
  if Assigned(Flog) then Flog.logs_elapsed_time('tribadicional');
end;

constructor THw_notafiscal_class.Create(AOwner: THw_faturamento);
begin
  inherited Create;
  FfreeCon := not Assigned(AOwner);
  if Assigned(AOwner) then
  begin
    Fcon       := AOwner;
    FOwnerFat  := AOwner;
    Fauditoria := FOwnerFat.auditoria;
    Ferros     := THw_erro_classList.Create(FOwnerFat.erros);
  end
  else
  begin
    Fcon       := THw_fbcon.Create;
    Fauditoria := THw_auditoria_classList.Create;
    Ferros     := THw_erro_classList.Create;
  end;
  Fcliente   := TClientes_class.Create;
  Fdest_nf   := TVw_clientes_dest_class.Create;
  Fitens     := THw_notafiscal_itens_class.Create(Self);
  Fdados_uf  := THw_dados_uf_class.Create;
  Finf_compl := THw_nf_inf_compl.Create;
  Fref_cp    := THw_ref_cupom_fiscal.Create;
  Fref_nfce  := THw_ref_nfce.Create;
  Fpag       := THw_notafiscal_pag.Create;
  Fdup       := THw_notafiscal_dup.Create;
  Fvolumes_ped := TPedvenda_volumes_classList.Create;
  Flanc_aj   := THw_notafiscal_lan_aj.Create;
  ConfTripPC :=  TConfTributo.Create();

  FTributos  := TributosHandler.Create( Fcon.Transacao, tdfoNotaFiscal );
  //Fcad_merc := THw_produtos_classList.Create;
  //Fcad_redu := TReducao_classList.Create;
  //Fcad_trib := THw_prod_trib_ad_classList.Create;
end;

destructor THw_notafiscal_class.Destroy;
begin
  if (FfreeCon) then
  begin
    if Assigned(Fauditoria) then FreeAndNil(Fauditoria);
    if Assigned(Fcon)       then FreeAndNil(Fcon);
    if Assigned(Ferros)     then FreeAndNil(Ferros);
  end;
  if Assigned(Fcad_inf_cpl)  then FreeAndNil(Fcad_inf_cpl);
  if Assigned(Fcad_ibpt)     then FreeAndNil(Fcad_ibpt);
  if Assigned(Fcad_ncm_loc)  then FreeAndNil(Fcad_ncm_loc);
  if Assigned(Fcad_mva_aj)   then FreeAndNil(Fcad_mva_aj);
  if Assigned(Fcad_ncm_dest) then FreeAndNil(Fcad_ncm_dest);
  if Assigned(Fcad_cfop)     then FreeAndNil(Fcad_cfop);
  if Assigned(Fcad_trib)     then FreeAndNil(Fcad_trib);
  if Assigned(Fcad_deson)    then FreeAndNil(Fcad_deson);
  if Assigned(Fcad_redu)     then FreeAndNil(Fcad_redu);
  if Assigned(Fcad_serv)     then FreeAndNil(Fcad_serv);
  if Assigned(Fcad_cbarra)   then FreeAndNil(Fcad_cbarra);
  if Assigned(Fcad_merc)     then FreeAndNil(Fcad_merc);
  if Assigned(Fcad_cest)     then FreeAndNil(Fcad_cest);
  if Assigned(Fcad_opfiscal) then FreeAndNil(Fcad_opfiscal);
  if Assigned(Fdup)          then FreeAndNil(Fdup);
  if Assigned(Fpag)          then FreeAndNil(Fpag);
  if Assigned(Fref_nfce)     then FreeAndNil(Fref_nfce);
  if Assigned(Fref_cp)       then FreeAndNil(Fref_cp);
  if Assigned(Finf_compl)    then FreeAndNil(Finf_compl);
  if Assigned(Fdados_uf)     then FreeAndNil(Fdados_uf);
  if Assigned(Fitens)        then FreeAndNil(Fitens);
  if Assigned(Fdest_nf)      then FreeAndNil(Fdest_nf);
  if Assigned(Fcliente)      then FreeAndNil(Fcliente);
  if Assigned(Ferros)        then FreeAndNil(Ferros);
  if Assigned(Fvolumes_ped)  then FreeAndNil(Fvolumes_ped);
  if Assigned(Flanc_aj)      then FreeAndNil(Flanc_aj);
  if Assigned(ConfTripPC)    then FreeAndNil(ConfTripPC);
  if (FfreeCon) and (Assigned(Fcon)) then FreeAndNil(Fcon);
  FTributos.FreeSafe();
  inherited;
end;

function THw_notafiscal_class.GetAnoFatoGerador: SmallInt;
begin
  Result := YearOf(GetDhFatoGerador());
end;

function THw_notafiscal_class.GetDhFatoGerador: TDateTime;
begin
  if Self.dpreventrega > 0 then
    Result := Self.dpreventrega

  else if Self.data_ent_saida > 0 then
    Result := Self.data_ent_saida

  else if Self.data_lanc > 0 then
    Result := Self.data_lanc

  else
    Result := Now();
end;

function THw_notafiscal_class.GetUf_Operacao: string;
begin
  if (Self.emissao_propria = 'N') or (MatchStr(Self.nfe_iddest, ['2','3'])) then // Operação interestadual ou exterior
    Result := Self.dest_uf
  else
    Result := vDadosIni.vEmp.vSiglaUF;
end;

function THw_notafiscal_class.NewInformacanComplementar(
  Atipo: string): TSped_informacao_complementar_class;
var
  Acon: TConexao;
begin                                      
  Result := TSped_informacao_complementar_class.Create;
  Acon := TConexao.Create(FOwnerFat.Banco);
  try
    Result.SetValuesFrom(Acon.SqlOpen('select %s from %s where cod_empresa = %d and tipo = %s',
                                      [Result._tb.GetFieldsSql(), Result._tb.name, Self.cod_empresa, QuotedStr(Atipo)]));

    if Result.cod_inf = 0 then
    begin
      Result.beginChanges(True);
      Result.cod_empresa := Self.cod_empresa;
      Result.tipo        := Atipo;
      //Result.txt         := ''; 
      if Atipo = 'DESONERACAO' then
        Result.txt_compl := 'Desconto no valor de R$[@VICMDESON] ref. ICMS desonerado conf. convenio de ICMS 100/97 e ajuste SINIEF 10/2012';
      with Result.SQLMotor('cod_inf') do
      begin
        Options.FieldsInInsertUpdate := fsNewDifOld;// [muCheckModified];
        Result.cod_inf := Acon.SqlInsertID(SQLInsertAutoInc, autoIncField);
        if Acon.Transacao.InTransaction then
          Acon.Transacao.Commit;
      end;
    end;

  finally
    FreeAndNil(Acon);
  end;
end;

function THw_notafiscal_class.notafiscal_calcular_completa_obterdados(
  id_tmp: string; prodsTmp: THw_produtos_tmp_classList;
  cfops: array of Integer;
  forceGetData: Boolean): THw_notafiscal_class;
var
  I: Integer;
  section: string;
begin
  Result := Self;

  try
    Flog := TConexao.Create;
    try
      Flog.logs_sl('-- notafiscal_calcular_completa', 'calcnf');

      if not Assigned(Fconf_nf) then
        if Assigned(FOwnerFat) then
          Fconf_nf := FOwnerFat.notas.conf_nf;
      if not Assigned(Fconf_nf) then
        Fconf_nf := TConfigGlobalNF.Create(FOwnerFat.buscas, 'S');
      if not Fconf_nf.inicializado then
        Fconf_nf.ExecutarLeitura(natureza_nf);
      if Trim(ConfTripPC.Text) = '' then
      begin
        {$REGION 'Conf BC PISCOFINS'}
        section := TConfTributo.GetSectionBC(ttPISCOFINS, Self.natureza_nf, Self.modelo_nf);
        if not Fconf_nf.Conf_PIS.nf_piscofins_bases.value1_b.ini.SectionExists(section) then // se nao existir o padrao completo procura pelo padrao curto
          section := ReplaceText(section, 'Composicao_BC_PISCOFINS_', '');

        if Fconf_nf.Conf_PIS.nf_piscofins_bases.value1_b.ini.SectionExists(section) then
        begin
          Fconf_nf.Conf_PIS.nf_piscofins_bases.value1_b.WriteBool(section, 'Habilitado', True);
          ConfTripPC.setConfBC(ttPISCOFINS, Self.natureza_nf, Self.modelo_nf, section, Fconf_nf.Conf_PIS.nf_piscofins_bases.value1_b);
        end;
        {$ENDREGION}
      end;

      if forceGetData then
      begin

        Fcon.SqlExec('delete from produtos_tmp where id_tmp = %s', [QuotedStr(id_tmp)]);
        Fcon.QrAux.SQL.Text := Fcon.sql_insert_build('PRODUTOS_TMP',  TProdutos_tmp_class.GetFieldsSql(), nil);
        if not Fcon.QrAux.Prepared then Fcon.QrAux.Prepare;
        for I := 0 to Pred(prodsTmp.Count) do
          prodsTmp.Items[I].SetValuesInParams(Fcon.QrAux).ExecSQL;

        if Assigned(Fcad_inf_cpl)  then Fcad_inf_cpl.Clear;

        dados_obter_cliente(False);
        dados_obter_servicos(id_tmp, True);
        dados_obter_produtos(id_tmp, True);
        dados_obter_codbarra(id_tmp, True);
        dados_obter_reducaodebase(id_tmp, True);
        dados_obter_trib_adicional(id_tmp, cod_cliente, dest_seqid, True);
        dados_obter_desoneracao(id_tmp, True);
        dados_obter_nat_op(id_tmp, cfops, True);
        dados_obter_ncm_estado(id_tmp, True);
        dados_obter_mva_ajustada(id_tmp, True);
        dados_obter_ncm(id_tmp, True);
        dados_obter_ibpt(id_tmp, True);
        dados_obter_cest(id_tmp, True);
        dados_obter_opfiscal(id_tmp, True);

      end;

      Flog.logs_elapsed_time('obtendo dados do banco fim');

    finally
      if Assigned(Flog) then FreeAndNil(Flog);
    end;

  except on E: Exception do
    begin
      Ferros.New('Erro ao calcular compl. ver.: 2').detalhe := E.Message;
      vDadosIni.registraErro('THw_notafiscal_class.notafiscal_calcular_completa ' + e.Message);
    end;
  end;
end;

function THw_notafiscal_class.notafiscal_calcular_item_individual(
  var Aitem: THw_notafiscal_item_class): THw_notafiscal_class;
var
  id_tmp, section: string;
  prodTmp: TProdutos_tmp_class;
  obterDados: Boolean;
begin
  Result := Self;
  if not Assigned(Aitem) then
  begin
    Ferros.New('Item não passado como parametro');
    Exit;
  end;

  try
    Aitem.cod_empresa := IfThen(Aitem.cod_empresa > 0, Aitem.cod_empresa, StrToInt(vDadosIni.codEmpresa));

    Flog := TConexao.Create;
    try
      //Flog.logs_sl('-- notafiscal_calcular_item_individual', 'calcnf');

      if Aitem.tipo_item = 'P' then
      begin
        if not Assigned(cad_merc) then
          obterDados := True
        else if (Aitem.grupo_prod = 0) and (Aitem.cod_prod = '') then
        begin
          //Ferros.New('Item ainda não vinculado'); 
          exit;        
        end 
        else
          obterDados := not cad_merc.ExisteProduto(Aitem.grupo_prod, Aitem.cod_prod)
      end
      else if Aitem.tipo_item = 'S' then
      begin
        if not Assigned(cad_serv) then
          obterDados := True
        else
          obterDados := not cad_serv.ExisteServico(Aitem.grupo_prod)
      end
      else if Aitem.tipo_item = 'V' then
        obterDados := True
      else
        obterDados := False;

      //if not Aonlycalc then
      if obterDados and (MatchText(Aitem.tipo_item, ['P', 'S', 'V'])) then
      begin
        Randomize;
        id_tmp := 'NF' + OnlyNumber(DateTimeToStr(Now)) + IntToStr(Random(999999999));

        if not Assigned(Fconf_nf) then
          if Assigned(FOwnerFat) then
            Fconf_nf := FOwnerFat.notas.conf_nf;
        if not Assigned(Fconf_nf) then
          Fconf_nf := TConfigGlobalNF.Create(FOwnerFat.buscas, 'S');
        if not Fconf_nf.inicializado then
          Fconf_nf.ExecutarLeitura(natureza_nf);
        if Trim(ConfTripPC.Text) = '' then
        begin
          {$REGION 'Conf BC PISCOFINS'}
          section := TConfTributo.GetSectionBC(ttPISCOFINS, Self.natureza_nf, Self.modelo_nf);
          if not Fconf_nf.Conf_PIS.nf_piscofins_bases.value1_b.ini.SectionExists(section) then // se nao existir o padrao completo procura pelo padrao curto
            section := ReplaceText(section, 'Composicao_BC_PISCOFINS_', '');

          if Fconf_nf.Conf_PIS.nf_piscofins_bases.value1_b.ini.SectionExists(section) then
          begin
            Fconf_nf.Conf_PIS.nf_piscofins_bases.value1_b.WriteBool(section, 'Habilitado', True);
            ConfTripPC.setConfBC(ttPISCOFINS, Self.natureza_nf, Self.modelo_nf, section, Fconf_nf.Conf_PIS.nf_piscofins_bases.value1_b);
          end;
          {$ENDREGION}
        end;

        prodTmp             := TProdutos_tmp_class.Create;
        //try
        prodTmp.id_tmp      := id_tmp;
        prodTmp.seqid       := 0;
        prodTmp.cod_empresa := Aitem.cod_empresa;
        if Aitem.tipo_item = 'P' then
        begin
          prodTmp.grupo_prod  := Aitem.grupo_prod;
          prodTmp.cod_prod    := Aitem.cod_prod;
        end
        else if Aitem.tipo_item = 'S' then
        begin
          prodTmp.grupo_prod  := Aitem.cod_servico;
          prodTmp.cod_prod    := 'SERV';
        end
        else if Aitem.tipo_item = 'V' then
        begin              
          prodTmp.grupo_prod  := Aitem.nitem;
          prodTmp.cod_prod    := 'VEIC';
        end;

        Fcon.SqlExec('delete from produtos_tmp where id_tmp = %s', [QuotedStr(id_tmp)]);
        Fcon.QrAux.SQL.Text := Fcon.sql_insert_build('PRODUTOS_TMP',  TProdutos_tmp_class.GetFieldsSql(), nil);
        Flog.logs(Fcon.QrAux.SQL.Text, Self.ClassName + '.notafiscal_calcular_item_individual');
        if not Fcon.QrAux.Prepared then Fcon.QrAux.Prepare;
        prodTmp.SetValuesInParams(Fcon.QrAux).ExecSQL;
        Flog.logs_elapsed_time();
        //finally
        //  if Assigned(prodTmp) then FreeAndNil(prodTmp);
        //end;

        Flog.logs_sl('-- notafiscal_calcular_item_individual', 'calcnf');

        if Assigned(Fcad_inf_cpl)  then Fcad_inf_cpl.Clear;
      end;

      if (Self.cod_cliente <> Fcliente.cod_cliente) then
        dados_obter_cliente(False);

      if obterDados and (Aitem.tipo_item = 'S') then
      begin
        dados_obter_servicos(id_tmp, True);
        dados_obter_nat_op(id_tmp, [Trunc(Aitem.codigo_nop)]);
      end

      else if obterDados and (Aitem.tipo_item = 'V') then
      begin
        dados_obter_nat_op(id_tmp, [Trunc(Aitem.codigo_nop)]);
      end

      else if obterDados and (Aitem.tipo_item = 'P') then
      begin
        dados_obter_produtos(id_tmp);
        dados_obter_codbarra(id_tmp);
        dados_obter_reducaodebase(id_tmp);
        dados_obter_trib_adicional(id_tmp, cod_cliente, dest_seqid);
        dados_obter_desoneracao(id_tmp);
        dados_obter_nat_op(id_tmp, [Trunc(Aitem.codigo_nop)]);
        dados_obter_ncm_estado(id_tmp);
        dados_obter_mva_ajustada(id_tmp);
        dados_obter_ncm(id_tmp);
        dados_obter_ibpt(id_tmp);
        dados_obter_cest(id_tmp);
        dados_obter_opfiscal(id_tmp);
      end;

      if not Assigned(Fcad_opfiscal) then
        Fcad_opfiscal := TCadItensTributos.Create;

      if not Assigned(Fcad_ncm_loc) then
        Fcad_ncm_loc := THw_nbm_class.Create;

      if not Assigned(Fcad_ibpt) then
        Fcad_ibpt := THw_ibpt_class.Create;

      Flog.logs_elapsed_time('montando item start');

      if (Aitem.tipo_item = 'P') then
        Aitem.merc := Fcad_merc.GetProduto(Aitem.grupo_prod, Aitem.cod_prod);

      {$REGION 'rateio de valores'}

      if not Aitem.manterRateio then
      begin
        if Self.tipo_seguro = 'R' then
        begin
          Aitem.rateio_seguro := 0;
          if Self.valor_seguro > 0 then
            Aitem.rateio_seguro := RoundTo((Self.valor_seguro / Self.valor_prod) * Aitem.valor_total, -2);
        end;

        if Self.tipo_frete = 'R' then
        begin
          Aitem.rateio_frete := 0;
          if Self.valor_frete > 0 then
            Aitem.rateio_frete := RoundTo((Self.valor_frete / Self.valor_prod) * Aitem.valor_total, -2);
        end;

        if Self.tipo_outdesp = 'R' then
        begin
          Aitem.rateio_outdesp := 0;
          if Self.valor_out_desp > 0 then
            Aitem.rateio_outdesp := RoundTo((Self.valor_out_desp / Self.valor_prod) * Aitem.valor_total, -2);
        end;

        if Self.tipo_desconto = 'R' then
        begin
          Aitem.rateio_desconto := 0;
          if (Aitem.permitir_desconto <> 'N') and (Self.valor_desc > 0) then
            Aitem.rateio_desconto := RoundTo((Self.valor_desc / Self.valor_prod) * Aitem.valor_total, -2);
        end;
      end;
      {$ENDREGION}

      Flog.logs_elapsed_time('montando itens rateio');

      if (vDadosIni.vEmp.vRegime = 'SIMPLES') and (Aitem.tipo_item = 'V') then
        Aitem.csosn := Aitem.get_csosn_ajutstado_por_cst;

      Aitem.obter_dados_geral;

      {$REGION 'atualizando dados quando produtos'}
      {
      if (Aitem.tipo_item = 'P') and Assigned(Aitem.merc) then
        if (Aitem.grupo_prod     = Aitem.merc.grupo_prod) and
           (Trim(Aitem.cod_prod) = Trim(Aitem.merc.cod_prod)) then
        begin
          Aitem.prctb_item        := Aitem.merc.perc_tb_prod;
          Aitem.prctb_itema       := Aitem.merc.perc_tb_proda;
          Aitem.peso_b            := Aitem.merc.peso_brut_prod;
          Aitem.peso_l            := Aitem.merc.peso_liq_prod;
          Aitem.consumo           := Aitem.merc.consumo;
          Aitem.utrib             := Aitem.merc.nfe_utrib;
          Aitem.qtrib             := Aitem.merc.nfe_qtrib;
          if Self.natureza_nf = 'S' then
          begin
            Aitem.nfe_indescala := Aitem.merc.nfe_indescala;
            Aitem.nfe_cnpjfab   := Aitem.merc.nfe_cnpjfab;
          end;
          Aitem.permitir_desconto := 'S';
          if (Self.natureza_nf = 'S') and (Self.devolucao <> 'SIM') then
            Aitem.permitir_desconto := Aitem.merc.permitir_desconto;
        end;
       }
      {$ENDREGION}

      Aitem.espelho_calc.Clear;
      Aitem.calculo_ipi_executar;
      Aitem.calculo_piscofins_executar;
      Aitem.calculo_icms_executar;
      Aitem.calculo_icms_dest_executar;
      Aitem.calculo_fcp_executar;
      Aitem.calculo_iss_executar;
      Aitem.calculo_tributos_executar;
      Aitem.calculo_retencoes_executar;
      Aitem.calculo_tributos_rtc_executar;

      Aitem.validar_dados;
      Aitem.validar_dados_saida;
      Aitem.Totalizar();

      Flog.logs_elapsed_time('montando itens calculo');

    finally
      if Assigned(Flog) then FreeAndNil(Flog);
    end;

  except on E: Exception do
    begin
      Ferros.New('Erro ao calcular. ver.: 2').detalhe := E.Message;
      vDadosIni.registraErro('THw_notafiscal_class.notafiscal_calcular_item_individual ' + e.Message);
    end;
  end;
end;
procedure THw_notafiscal_class.AtualizarOperacaoInternaIdPorTipoVenda(const TipoVenda, TipoSigla: string);
var
  opInternas: OpInternasComTpVendasEtd;
begin
  op_interna_id := '';
  with Container.GetInstance().ErpFeaturesFactory.CreateListarOpInternasComTpVendasPorVendaUseCase() do
  try
    opInternas := Executar(
      TipoVenda,
      TipoSigla,
      Self.cod_empresa
    );
  finally
    FreeSafe();
  end;
  try

    if opInternas.Count = 0 then
      Exit;

    op_interna_id := (opInternas.Items[0] as OpInternaComTpVendaEtd).OperacaoInternaId;
  finally
    opInternas.Free();
  end;
end;

function THw_notafiscal_class.totais_somar: THw_notafiscal_class;
var
  I: Integer;
  Ait: THw_notafiscal_item_class;
begin
  Result := Self;
  valor_total := 0;

  {$REGION 'Novos Campos RTC'}
  
  vnftot := 0.00;
  vbcibscbs := 0.00;
  ibsuf_vdif := 0.00;
  ibsuf_vdevtrib := 0.00;
  vibsuf := 0.00;
  ibsmun_vdif := 0.00;
  ibsmun_vdevtrib := 0.00;
  vibsmun := 0.00;
  vibs := 0.00;
  ibs_vcredpres := 0.00;
  ibs_vcredprescondsus := 0.00;
  cbs_vdif := 0.00;
  cbs_vdevtrib := 0.00;
  vcbs := 0.00;
  cbs_vcredpres := 0.00;
  cbs_vcredprescondsus := 0.00;
  vibsmono := 0.00;
  vcbsmono := 0.00;
  vibsmonoreten := 0.00;
  vcbsmonoreten := 0.00;
  vibsmonoret := 0.00;
  vcbsmonoret := 0.00;
  vibsestcred := 0.00;
  vcbsestcred := 0.00;
  vis := 0.00;

  {$ENDREGION}

  for I := 0 to Pred(Fitens.Count) do
  begin
    Ait := Fitens.Items[I];

    valor_desc_p      := IfThen(I > 0, valor_desc_p     ) + IfThen((Ait.indtot = 1) and (Ait.tipo_item <> 'S'), Ait.rateio_desconto);
    valor_desc_s      := IfThen(I > 0, valor_desc_s     ) + IfThen((Ait.indtot = 1) and (Ait.tipo_item  = 'S'), Ait.rateio_desconto);
    valor_desc        := IfThen(I > 0, valor_desc       ) + IfThen(Ait.indtot = 1, Ait.rateio_desconto);
    base_icm          := IfThen(I > 0, base_icm         ) + IfThen(Ait.indtot = 1, Ait.base_icm);
    base_icmsub       := IfThen(I > 0, base_icmsub      ) + IfThen(Ait.indtot = 1, Ait.base_icmsub);
    base_ipi          := IfThen(I > 0, base_ipi         ) + IfThen(Ait.indtot = 1, Ait.base_ipi);
    base_iss          := IfThen(I > 0, base_iss         ) + IfThen(Ait.indtot = 1, Ait.base_iss);
    valor_icm         := IfThen(I > 0, valor_icm        ) + IfThen(Ait.indtot = 1, Ait.valor_icm);
    vicmdeson         := IfThen(I > 0, vicmdeson        ) + IfThen(Ait.indtot = 1, Ait.vicmdeson);
    valor_icmsub      := IfThen(I > 0, valor_icmsub     ) + IfThen(Ait.indtot = 1, Ait.valor_icmsub);
    valor_ipi         := IfThen(I > 0, valor_ipi        ) + IfThen(Ait.indtot = 1, Ait.valor_ipi);
    valor_iss         := IfThen(I > 0, valor_iss        ) + IfThen(Ait.indtot = 1, Ait.valor_iss);
    valor_prod        := IfThen(I > 0, valor_prod       ) + IfThen((Ait.indtot = 1) and (Ait.tipo_item <> 'S'), Ait.valor_total);
    valor_serv        := IfThen(I > 0, valor_serv       ) + IfThen((Ait.indtot = 1) and (Ait.tipo_item = 'S'), Ait.valor_total);
    base_icm_simples  := IfThen(I > 0, base_icm_simples ) + IfThen(Ait.indtot = 1, Ait.base_icm_simples);
    valor_icm_simples := IfThen(I > 0, valor_icm_simples) + IfThen(Ait.indtot = 1, Ait.valor_icm_simples);
    valor_pis         := IfThen(I > 0, valor_pis        ) + IfThen(Ait.indtot = 1, Ait.valor_pis);
    valor_cofins      := IfThen(I > 0, valor_cofins     ) + IfThen(Ait.indtot = 1, Ait.valor_cofins);
    vpisdeson         := IfThen(I > 0, vpisdeson        ) + IfThen(Ait.indtot = 1, Ait.vpisdeson);
    vcofinsdeson      := IfThen(I > 0, vcofinsdeson     ) + IfThen(Ait.indtot = 1, Ait.vcofinsdeson);
    valor_ii          := IfThen(I > 0, valor_ii         ) + IfThen(Ait.indtot = 1, Ait.valor_ii);
    vfcpufdest        := IfThen(I > 0, vfcpufdest       ) + IfThen(Ait.indtot = 1, Ait.vfcpufdest);
    vicmsufdest       := IfThen(I > 0, vicmsufdest      ) + IfThen(Ait.indtot = 1, Ait.vicmsufdest);
    vicmsufremet      := IfThen(I > 0, vicmsufremet     ) + IfThen(Ait.indtot = 1, Ait.vicmsufremet);
    fcp_vfcp          := IfThen(I > 0, fcp_vfcp         ) + IfThen(Ait.indtot = 1, Ait.fcp_vfcp);
    fcp_vfcpst        := IfThen(I > 0, fcp_vfcpst       ) + IfThen(Ait.indtot = 1, Ait.fcp_vfcpst);
    fcp_vfcpstret     := IfThen(I > 0, fcp_vfcpstret    ) + IfThen(Ait.indtot = 1, RoundTo(Ait.fcp_vfcpstret * Ait.quantidade, -2));
    ipi_vipidevol     := IfThen(I > 0, ipi_vipidevol    ) + IfThen(Ait.indtot = 1, Ait.nfe_vipidevol);
    vtottrib          := IfThen(I > 0, vtottrib         ) + IfThen(Ait.indtot = 1, Ait.vtottrib);
    base_irrf         := IfThen(I > 0, base_irrf        ) + IfThen(Ait.indtot = 1, Ait.vbcretfed);
    valor_irrf        := IfThen(I > 0, valor_irrf       ) + IfThen(Ait.indtot = 1, Ait.vretir);
    vretcsll          := IfThen(I > 0, vretcsll         ) + IfThen(Ait.indtot = 1, Ait.vretcsll);
    vretpis           := IfThen(I > 0, vretpis          ) + IfThen(Ait.indtot = 1, Ait.vretpis);
    vretcofins        := IfThen(I > 0, vretcofins       ) + IfThen(Ait.indtot = 1, Ait.vretcofins);

    if not Fconf_nf.Conf_Geral.nf_s_hab_digitacao_peso then
    begin
      peso_b          := IfThen(I > 0, peso_b) + (Ait.peso_b * Ait.quantidade);
      peso_l          := IfThen(I > 0, peso_l) + (Ait.peso_l * Ait.quantidade);
    end;

    {$REGION 'Novos Campos RTC'}

    if (Ait.indtot = 1) and (Ait.tributosRTC <> nil) then
    begin
      if (Ait.tributosRTC.IbsCbs <> nil)
        and (Ait.tributosRTC.IbsCbs <> nil)
      then
      begin
        if (Ait.tributosRTC.IbsCbs.GIbsCbs <> nil) then
        begin
          vbcibscbs := vbcibscbs +
            Ait.tributosRTC.IbsCbs.GIbsCbs.VBc;
          //IBS
          ibsuf_vdif      := ibsuf_vdif      + Ait.tributosRTC.IbsCbs.GIbsCbs.IbsUfVdif.Value;
          ibsuf_vdevtrib  := ibsuf_vdevtrib  + Ait.tributosRTC.IbsCbs.GIbsCbs.IbsUfVDevTrib.Value;
          vibsuf          := vibsuf          + Ait.tributosRTC.IbsCbs.GIbsCbs.VIbsUf;
          ibsmun_vdif     := ibsmun_vdif     + Ait.tributosRTC.IbsCbs.GIbsCbs.IbsMunVdif.Value;
          ibsmun_vdevtrib := ibsmun_vdevtrib + Ait.tributosRTC.IbsCbs.GIbsCbs.IbsMunVDevTrib.Value;
          vibsmun         := vibsmun         + Ait.tributosRTC.IbsCbs.GIbsCbs.VIbsmun;
          vibs            := vibs            + Ait.tributosRTC.IbsCbs.GIbsCbs.VIbs;
          //CBS
          cbs_vdif        := cbs_vdif        + Ait.tributosRTC.IbsCbs.GIbsCbs.CbsVdif.Value;
          cbs_vdevtrib    := cbs_vdevtrib    + Ait.tributosRTC.IbsCbs.GIbsCbs.CbsVDevTrib.Value;
          vcbs            := vcbs            + Ait.tributosRTC.IbsCbs.GIbsCbs.vcbs;
        end;

        //Credito  Presumido
        if (Ait.tributosRTC.IbsCbs.CredPresOp <> nil) then
        begin
          ibs_vcredpres        := ibs_vcredpres + Ait.tributosRTC.IbsCbs.CredPresOp.IbsVcredpres.Value;
          ibs_vcredprescondsus := ibs_vcredprescondsus + Ait.tributosRTC.IbsCbs.CredPresOp.IbsVcredprescondsus.Value;

          cbs_vcredpres        := cbs_vcredpres + Ait.tributosRTC.IbsCbs.CredPresOp.CbsVcredpres.Value;
          cbs_vcredprescondsus := cbs_vcredprescondsus + Ait.tributosRTC.IbsCbs.CredPresOp.CbsVcredprescondsus.Value;
        end;

        //Monofasia
        if (Ait.tributosRTC.IbsCbs.Monofasia <> nil) then
        begin
          vibsmono      := vibsmono      + Ait.tributosRTC.IbsCbs.Monofasia.Vibsmono.Value;
          vcbsmono      := vcbsmono      + Ait.tributosRTC.IbsCbs.Monofasia.Vcbsmono.Value;
          vibsmonoreten := vibsmonoreten + Ait.tributosRTC.IbsCbs.Monofasia.Vibsmonoreten.Value;
          vcbsmonoreten := vcbsmonoreten + Ait.tributosRTC.IbsCbs.Monofasia.Vcbsmonoreten.Value;
          vibsmonoret   := vibsmonoret   + Ait.tributosRTC.IbsCbs.Monofasia.Vibsmonoret.Value;
          vcbsmonoret   := vcbsmonoret   + Ait.tributosRTC.IbsCbs.Monofasia.Vcbsmonoret.Value;
        end;

        //Estorno de credito
        vibsestcred := vibsestcred + Ait.tributosRTC.IbsCbs.VIbsEstCred.Value;
        vcbsestcred := vcbsestcred + Ait.tributosRTC.IbsCbs.VCbsEstCred.Value;
      end;
      if (Ait.tributosRTC.ImpostoSeletivo <> nil)
        and (Ait.tributosRTC.ImpostoSeletivo <> nil)
      then
      begin
        vis := vis + Ait.tributosRTC.ImpostoSeletivo.Vis.Value;
      end;
    end;

    if Ait.indtot = 1 then
      vnftot := vnftot + Ait.vitem;

    {$ENDREGION}           
  end;

  valor_total := valor_prod +
                 valor_serv +
                 valor_icmsub +
                 valor_ipi +
                 ipi_vipidevol  +
                 valor_seguro +
                 valor_out_desp +
                 valor_ii +
                 fcp_vfcpst +
                 IfThen(frete_f_nfe <> 'S', valor_frete) -
                 (valor_desc + vicmdeson + vpisdeson + vcofinsdeson);
end;

procedure THw_notafiscal_class.validacoes_nfe;
begin
  if modelo_nf = '55' then
  begin
    if vDadosIni.vEmp.vNfe.ibgeCodEstado = 0 then
      Ferros.New('Código IBGE do estado do emitente não configurado').detalhe := 'Acesse o cadastro da empresa e configure na aba NF-e';

    if vDadosIni.vEmp.vNfe.ibgeCodCidade = 0 then
      Ferros.New('Código IBGE da cidade do emitente não configurado').detalhe := 'Acesse o cadastro da empresa e configure na aba NF-e';

    if Trim(vDadosIni.vEmp.vNfe.certificadonumSerie) = '' then
      Ferros.New('Nf-e: Certificado Transmissor inválido').detalhe := 'Acesse o cadastro da empresa e preencha o numero de serie do certificado na aba NF-e';

    if dest_cmun = 0 then
      Ferros.New('Código IBGE da cidade do destinatário não infomado').detalhe := 'Acesso no endereço do cliente a cidade ibge corretamente';

    if dest_uf  = '' then
      Ferros.New('Nf-e: Sigla do estado não infomado para o destinatário');

    if (cpfcgc = '') and (dest_cmun <> 9999999) then
      Ferros.New('Nf-e: CPF/CNPJ do destinatário não informado');

    if Trim(vDadosIni.vEmp.vCNPJ) = '' then
      Ferros.New('Nf-e: CNPJ emitente não informado');

    if Trim(vDadosIni.vEmp.vIE) = '' then
      Ferros.New('Nf-e: IE do emitente não informada');
  end;
end;

{ THw_fbcon }

constructor THw_fbcon.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  Fbuscas             := TIBQuery.Create(dtmAtivo);
  Fbuscas.Database    := Banco;
  Fbuscas.Transaction := Transacao;
end;

destructor THw_fbcon.Destroy;
begin
  if Assigned(Fbuscas) then FreeAndNil(Fbuscas);
  inherited;
end;

function THw_fbcon.sql_insert_build(Atable, Afields: string;
  AignoreFields: TStringList): string;
var
  AList: TStringList;
  Aparams: string;
  I: Integer;
begin
  AList := TStringList.Create;
  try
    AList.CaseSensitive := False;
    AList.LineBreak     := ',';
    AList.Text          := StringReplace(Afields, ' ', '', [rfReplaceAll]);

    if Assigned(AignoreFields) then
      for Aparams in AignoreFields do
        if AList.IndexOf(Aparams) >= 0 then
          AList.Delete(AList.IndexOf(Aparams));

    Aparams := '';
    Afields := '';
    for I := 0 to Pred(AList.Count) do
    begin
      Afields := Afields + IfThen(I > 0, ', ') + Trim(AList[I]);
      Aparams := Aparams + IfThen(I > 0, ', :', ':') + Trim(AList[I]);
    end;

    Result := Format('insert into %s (%s) values (%s);', [Atable, Afields, Aparams]);
  finally
    FreeAndNil(AList);
  end;
end;

{ THw_notafiscal_itens_class }

constructor THw_notafiscal_itens_class.Create(AOwnerNF: THw_notafiscal_class);
begin
  inherited Create;
  FOwnerNF := AOwnerNF;
end;

function THw_notafiscal_itens_class.getCfopItens: arrayInt;
var
  I, J: Integer;
  addit: Boolean;
begin
  SetLength(Result, 0);

  for I := 0 to Self.Count - 1 do
  begin
    addit := True;
    for J := Low(Result) to High(Result) do
      if not addit then
        Break
      else if Result[J] = Trunc(Self.Items[I].codigo_nop) then
        addit := False;

    if addit then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Trunc(Self.Items[I].codigo_nop);
    end;
  end;
end;

function THw_notafiscal_itens_class.GetItem(
  Index: Integer): THw_notafiscal_item_class;
begin
  Result := THw_notafiscal_item_class(inherited Items[Index]);
end;

function THw_notafiscal_itens_class.New: THw_notafiscal_item_class;
begin
  Result := THw_notafiscal_item_class.Create(FOwnerNF);
  Add(Result);
end;

function THw_notafiscal_itens_class.New(
  Aproduto: TProdutos_class): THw_notafiscal_item_class;
begin
  Result := New;
  Result.obter_dados_prod(Aproduto);
  FOwnerNF.com_prod := 'S';
  {with Result do
  begin
    merc              := Aproduto;
    tipo_item         := 'P';
    grupo_prod        := Aproduto.grupo_prod;
    cod_prod          := Aproduto.cod_prod;
    descricao_item    := Aproduto.descr_prod;
    ncm               := Aproduto.nbm;
    cst               := Aproduto.cst_prod;
    referencia        := Aproduto.unidade;
    num_fab_prod      := Aproduto.num_fab_prod;
    aliq_ipi          := Aproduto.ipi_prod;
    prctb_item        := Aproduto.perc_tb_prod;
    prctb_itema       := Aproduto.perc_tb_proda;
    qtdemb            := Aproduto.qtdemb;
    codigo_nop        := Aproduto.codigo_nop;
    permitir_desconto := Aproduto.permitir_desconto;
    peso_b            := Aproduto.peso_brut_prod;
    peso_l            := Aproduto.peso_liq_prod;
    consumo           := Aproduto.consumo;
    //prec_cus_cnt    := Aproduto.prec_cus_prod;
    prec_cusm_prod    := Aproduto.prec_cusm_prod;
    nfe_indescala     := Aproduto.nfe_indescala;
    nfe_cnpjfab       := Aproduto.nfe_cnpjfab;
    utrib             := Aproduto.nfe_utrib;
    qtrib             := Aproduto.nfe_qtrib;
    ecf               := Aproduto.ecf;
    comb_cprodanp     := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Aproduto.comb_cprodanp);
    comb_codif        := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Aproduto.comb_codif);
    comb_pmixgn       := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Aproduto.comb_pmixgn);
    comb_descanp      := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Aproduto.comb_descanp);
    comb_pglp         := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Aproduto.comb_pglp);
    comb_pgnn         := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Aproduto.comb_pgnn);
    comb_pgni         := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Aproduto.comb_pgni);
    comb_vpart        := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Aproduto.comb_vpart);
    nfci              := Aproduto.nfci;
    nfe_nrecopi       := Aproduto.nfe_nrecopi;
    cenq_ipi_nfe      := Aproduto.cenq_ipi_nfe;
    cest              := Aproduto.cest;
  end;}
end;

procedure THw_notafiscal_itens_class.SetItem(Index: Integer;
  const Value: THw_notafiscal_item_class);
begin
  Put(Index, Value);
end;

{ THw_notafiscal_item_class }

procedure THw_notafiscal_item_class.calculo_fcp_executar;
//var
//  Abase: Double;
begin
  if TTipoCalculo(tipo_calc) = tcNenhum then
    Exit;

 {
  Result := False;
  if (FOwnerNF.natureza_nf = 'S') and (not FOwnerNF.conf_nf.Conf_FCP.CalcularFCP) then
  begin
    fcp_pfcp         := 0;
    fcp_vfcp         := 0;
    fcp_vbcfcp       := 0;
    fcp_vbcfcpst     := 0;
    fcp_pfcpst       := 0;
    fcp_vfcpst       := 0;
    fcp_pst          := 0;
    fcp_vbcfcpstret  := 0;
    fcp_pfcpstret    := 0;
    fcp_vfcpstret    := 0;
    Exit;
  end;

  Abase := valor_total +
           rateio_seguro +
           rateio_outdesp -
           rateio_desconto +
           IfThen(frete_usar_na_base_icms, rateio_frete) +
           IfThen(FOwnerNF.ipi_base_icm = 'S', valor_ipi + nfe_vipidevol);

  if cst[2] in ['1', '2', '7', '9'] then
    fcp_vbcfcp := RoundTo(IfThen(base_icm > 0, base_icm), -2);

  if cst[2] in ['0', '1', '2', '7', '9'] then
    fcp_vfcp := RoundTo(IfThen(base_icm > 0, base_icm) * fcp_pfcp / 100, -2);

  if Copy(cst, 2, 2) = '51' then
  begin
    fcp_vbcfcp := Abase;
    fcp_vfcp   := RoundTo(fcp_vbcfcp * fcp_pfcp / 100, -2);
  end;

  if (cst[2] in ['1' , '3' , '7' , '9']) or
     (vDadosIni.strIn(csosn, ['201', '202', '203', '900'])) then
    fcp_vbcfcpst := RoundTo(IfThen(base_icmsub > 0, base_icmsub), -2);

  if (cst[2] in ['1' , '3' , '7' , '9']) or
     (vDadosIni.strIn(csosn, ['201', '202', '203', '900'])) then
    fcp_vfcpst := RoundTo(IfThen(fcp_vbcfcpst> 0, fcp_vbcfcpst) * fcp_pfcpst / 100, -2);

  if not (cst[2] in ['1', '2', '7', '9']) then
    fcp_vbcfcp := 0;

  if not (cst[2] in ['0', '1', '2', '7', '9']) then
  begin
    fcp_pfcp := 0;
    fcp_vfcp := 0;
  end;

  if ((not (cst[2] in ['1' , '3' , '7' , '9'])) and (Trim(csosn) =  '')) or
     ((not vDadosIni.strIn(csosn, ['201', '202', '203', '900'])) and (Trim(csosn) <> '')) then
  begin
    fcp_vbcfcpst := 0;
    fcp_pfcpst   := 0;
    fcp_vfcpst   := 0;
  end;

  if ((cst[2] <> '6'  ) and (Trim(csosn) =  '')) or
     ((csosn  <> '500') and (Trim(csosn) <> '')) then
  begin
    fcp_pst         := 0;
    fcp_vbcfcpstret := 0;
    fcp_pfcpstret   := 0;
    fcp_vfcpstret   := 0;
  end;

  if fcp_pfcp <= 0 then
  begin
    fcp_pfcp   := 0;
    fcp_vbcfcp := 0;
    fcp_vfcp   := 0;
  end;

  if fcp_pfcpst <= 0 then
  begin
    fcp_pfcpst   := 0;
    fcp_vbcfcpst := 0;
    fcp_vfcpst   := 0;
  end;       

  if (FOwnerNF.nfe_iddest       = '2') and
     (FOwnerNF.nfe_indiedest    =  9 ) and
     (FOwnerNF.consumidor_final = 'S') then
  begin
    fcp_pfcp   := 0;
    fcp_vbcfcp := 0;
    fcp_vfcp   := 0;
  end;
  }
end;

procedure THw_notafiscal_item_class.calculo_icms_dest_executar;
var
  trib: TIcmsUfDestTributavel;
begin
  HandleItemTribCreate;

  try
    if TTipoCalculo(tipo_calc) = tcNenhum then
      Exit
    else if (TTipoCalculo(tipo_calc) = tcParcial) and (not calcIcmsUfDestActive) then
      Exit;
  finally
    calcIcmsUfDestActive := False;
  end;

  if itemTrib.icms.icms_id = 0 then
  begin
    itemTrib.icms.aliq_fcp := pfcpufdest;
    itemTrib.icms.aliq_intra := picmsufdest;
    itemTrib.icms.aliq_icms  := picmsinter;
  end;

  // as aliquotas ja foram setadas anteriormente
  itemFiscal.tipoCalc := TTipoCalculo(tipo_calc);
  itemFiscal.base     := vbcufdest;
  itemFiscal.baseST   := 0;

  if not Assigned(tribIcms)  then
  begin
    tribIcms := TIcmsTributavel.Create;
    tribIcms.cst := Copy(Self.cst, 2, 2);
    tribIcms.op := TIcmsTributavel_OP.Create;
    tribIcms.op.vbc := Self.base_icm;
  end;

  trib                  := OpFiscalMotor.CalcularICMSUfDest(itemFiscal, itemTrib.icms, FOwnerNF.conf_nf, tribIcms);
  Self.vbcufdest        := trib.vbcufdest;
  Self.pfcpufdest       := trib.pfcpufdest;
  Self.picmsufdest      := trib.picmsufdest;
  Self.picmsinter       := trib.picmsinter;
  Self.picmsinterpart   := trib.picmsinterpart;
  Self.vfcpufdest       := trib.vfcpufdest;
  Self.vicmsufdest      := trib.vicmsufdest;
  Self.vicmsufremet     := trib.vicmsufremet;
  Self.fcp_vbcfcpufdest := trib.vbcfcpufdest;

  if Self.vicmsufdest > 0 then
  begin
    Self.fcp_vfcp := 0;
    Self.fcp_pfcp := 0;
    Self.fcp_vbcfcp := 0;
  end;

  {
  Result := False;
  //vItem.vrDadosItem.vbcufdest := 0;
  if (FOwnerNF.devolucao <> 'SIM') and (operacao_interestadual_com_partilha_icms) then
  begin
    //não será mais usado da forma proposta na nota tecnico 2015/003 v1.40
    //base unica conforme noticia da sefaz SC
    //http://www.sef.sc.gov.br/noticias/aten%C3%A7%C3%A3o-contribuinte-delibera%C3%A7%C3%B5es-do-confaz-estendem-prazos-e-simplificam-gest%C3%A3o-tribut%C3%A1ria
    //verificar tambem se o IPI vai compor esta base de calculo

    //fazendo o calculo interestadual
    // base inter = valor da operacao / ( 1 - aliquota) --  aliq: 0,04  0,07   0,12
    //vItem.vrDadosItem.vbcufdest := vDadosIni.StrToFloatFormat(vValorBaseICMTemp / ( 1 - ( vItem.vrDadosItem.picmsinter / 100 )), 2);
    vbcufdest        := RoundTo(valor_total +
                                rateio_seguro +
                                rateio_outdesp -
                                rateio_desconto +
                                IfThen(frete_usar_na_base_icms, rateio_frete) +
                                IfThen(FOwnerNF.ipi_base_icm = 'S', valor_ipi + nfe_vipidevol), -2);
    //icms interestadual = base inter * aliqinter / 100
    vicmsufremet     := RoundTo(vbcufdest * picmsinter / 100, -2);
    //fazendo o calculo uf destino
    // base destino = valor da operacao / ( 1 - (aliqintra + aliqFCP)) --  aliq: 0,18   0,25   etc
    //vItem.vrDadosItem.vbcufdest := vDadosIni.StrToFloatFormat(vValorBaseICMTemp / ( 1 - ( (vItem.vrDadosItem.picmsufdest + vItem.vrDadosItem.pfcpufdest ) / 100 )),2);
    //icms uf destinho = base dest * aliqintra / 100
    vicmsufdest      := RoundTo(vbcufdest * picmsufdest / 100, -2);
    //FCP: Fundo de combate a pobreza
    fcp_vbcfcpufdest := vbcufdest;
    vfcpufdest       := RoundTo(fcp_vbcfcpufdest * pfcpufdest / 100, -2);
    //calculando o DIFAL: Diferencial de aliquota
    vicmsufdest      := vicmsufdest - vicmsufremet;
    //definindo a participacao da uf destino, 40% em 2016, 60% em 2017, 80% em 2018, 100% a partir de 2019
    vicmsufremet     := RoundTo(vicmsufdest * (100 - picmsinterpart) / 100, -2);
    vicmsufdest      := RoundTo(vicmsufdest - vicmsufremet, -2);
    if vDadosIni.vEmp.vRegime = 'SIMPLES' then
      vicmsufremet   := 0;
  end;

  if ((vDadosIni.vEmp.vRegime = 'SIMPLES') and (Pos('|' + csosn           + '|', FOwnerNF.conf_nf.Conf_ICMS.CSTCSOSNNaoCalcularICMSInterestadual) > 0 )) or
    ((vDadosIni.vEmp.vRegime <> 'SIMPLES') and (Pos('|' + Copy(cst, 2, 2) + '|', FOwnerNF.conf_nf.Conf_ICMS.CSTCSOSNNaoCalcularICMSInterestadual) > 0 )) or
    ((vbcufdest = 0) and (FOwnerNF.devolucao <> 'SIM')) then
  begin
    vbcufdest        := 0;
    pfcpufdest       := 0;
    picmsufdest      := 0;
    picmsinter       := 0;
    picmsinterpart   := 0;
    vfcpufdest       := 0;
    vicmsufdest      := 0;
    vicmsufremet     := 0;
    fcp_vbcfcpufdest := 0;
  end;
  }
end;

procedure THw_notafiscal_item_class.calculo_icms_executar;

  {$REGION 'CheckValoresInvalidos'}
  procedure CheckValoresInvalidos;
  begin
    if Copy(cst, 2, 2) <> '60' then
    begin
      ant_pst             := 0;
      ant_vicmssubstituto := 0;
      fcp_vbcfcpstret     := 0;
      fcp_pfcpstret       := 0;
      fcp_vfcpstret       := 0;
      base_icmant_sub     := 0;
      valor_icmant_sub    := 0;
    end;
    if Copy(cst, 2, 2) <> '61' then
    begin
      qbcmonoret   := 0;
      vicmsmonoret := 0;
      adremicmsret := 0;
    end;

    if (FOwnerNF.emissao_propria = 'S')
      and (FOwnerNF.devolucao <> 'SIM')
      and (FOwnerNF.nfe_indiedest <> 1)
      and MatchText(csosn, ['101', '201']) then
    begin
      csosn := Copy(csosn, 1, 2) + '2';     
      aliq_icm_simples  := 0;
      base_icm_simples  := 0;
      valor_icm_simples := 0;
    end;

    if (FOwnerNF.verificar_mud_cfop = 'S')
      and (FOwnerNF.natureza_nf = 'S')
      and (ind_desoneracao = 7)
      and (vicmdeson > 0)
      and (MatchStr(FOwnerNF.nfe_iddest, ['1', '2'])) then //suframa
    begin
      if (tipo_item = 'P') and (Assigned(Fmerc)) then
        codigo_nop := StrToInt( IfThen(FOwnerNF.nfe_iddest = '1', '5', '6') +
                                IfThen(MatchStr(Fmerc.tipo_item, ['01', '02', '03', '04', '05', '06', '10']), '109', '110'))
      else
        codigo_nop := StrToInt( IfThen(FOwnerNF.nfe_iddest = '1', '5', '6') + '110');
    end;
  end;
  {$ENDREGION}

begin
  HandleItemTribCreate;
  try

    opf_icms_id := itemTrib.icms.icms_id;

    if (TTipoCalculo(tipo_calc) = tcNenhum) or
       ((TTipoCalculo(tipo_calc) = tcParcial) and (not calcIcmsActive)) then
    begin
      CheckValoresInvalidos;
      Exit;
    end;

    itemFiscal.ant_st     := (FOwnerNF.natureza_nf = 'E') and (antec_trib = 'S') and (ant_calc <> 'D') and (Copy(cst, 2, 2) = '60');

    if itemTrib.icms.icms_id = 0 then
    begin
      itemTrib.icms.motdesicm      := ind_desoneracao;
      itemTrib.icms.tributacao     := Ord(OpFiscal.CstIcmsToTributacao(Copy(Self.cst, 2, 2), aliq_icm, aliq_icmsub));
      itemTrib.icms.cfop           := Trunc(codigo_nop);
      itemTrib.icms.aliq_icms      := IfThen(aliq_icm > 0, aliq_icm, IfThen(ind_desoneracao > 0, FOwnerNF.aliq_icm));
      itemTrib.icms.aliq_fcp       := fcp_pfcp;
      itemTrib.icms.aliq_red_bc    := perc_red_prod;
      itemTrib.icms.aliq_icms_dif  := pdif;
      itemTrib.icms.aliq_fcp_dif   := pfcpdif;
      itemTrib.icms.aliq_intra     := aliq_icmsub;
      itemTrib.icms.aliq_mva       := mva;
      itemTrib.icms.aliq_credsn    := aliq_icm_simples;
      itemTrib.icms.csosn          := csosn;
      itemTrib.icms.adRemIcms      := adremicms;
      itemTrib.icms.adRemIcmsReten := adremicmsreten;
    end
    else
      codigo_nop := itemTrib.icms.cfop;

    itemFiscal.tipoCalc := TTipoCalculo(tipo_calc);
    itemFiscal.base     := base_icm;
    itemFiscal.baseST   := base_icmsub;
    itemFiscal.qtdebc   := IfThen(qbcmono > 0, qbcmono, qbcmonoreten);

    if Assigned(tribIcms) then
      tribIcms.Free;

    tribIcms           := OpFiscalMotor.CalcularICMS(itemFiscal, itemTrib.icms, FOwnerNF.conf_nf);
    Self.cst           := itemFiscal.orig + tribIcms.cst;
    Self.csosn         := tribIcms.csosn;
    //Result.modbc       := StrToIntDef(tribIcms.op.modbc, 3);
    Self.aliq_icm      := tribIcms.op.picms;
    Self.base_icm      := tribIcms.op.vbc;
    Self.perc_red_prod := tribIcms.op.predbc;
    Self.valor_icm     := tribIcms.op.vicms;
    Self.fcp_pfcp      := tribIcms.op.pfcp;
    Self.fcp_vbcfcp    := tribIcms.op.vbcfcp;
    Self.fcp_vfcp      := tribIcms.op.vfcp;

    Self.aliq_icm_simples  := tribIcms.sn.pcredsn;
    Self.base_icm_simples  := tribIcms.sn.vbcsn;
    Self.valor_icm_simples := tribIcms.sn.vcredicmssn;

    Self.modbcst           := StrToIntDef(tribIcms.st.modbcst, 4);
    Self.mva               := tribIcms.st.pmvast;
    Self.base_icmsub       := tribIcms.st.vbcst;
    Self.perc_red_prod_sub := tribIcms.st.predbcst;
    Self.aliq_icmsub       := tribIcms.st.picmsst;
    Self.valor_icmsub      := tribIcms.st.vicmsst;
    Self.valor_icm_stdes   := tribIcms.st.vicmsstdest;
    Self.fcp_pfcpst        := tribIcms.st.pfcpst;
    Self.fcp_vbcfcpst      := tribIcms.st.vbcfcpst;
    Self.fcp_vfcpst        := tribIcms.st.vfcpst;

    Self.ind_desoneracao := tribIcms.deson.motdesicms;
    Self.vicmdeson       := tribIcms.deson.vicmsdeson;
    Self.picmsdeson      := tribIcms.deson.picmsdeson;

    Self.pdif         := tribIcms.dif.pdif;
    Self.vicmsdif     := tribIcms.dif.vicmsdif;
    Self.pfcpdif      := tribIcms.dif.pfcpdif;
    Self.vfcpdif      := tribIcms.dif.vfcpdif;
    Self.vicmsop_dif  := tribIcms.dif.vicmsop;
    Self.vfcpefet_dif := tribIcms.dif.vfcpefet;

    Self.predbcefet := tribIcms.efet.predbcefet;
    Self.vbcefet    := tribIcms.efet.vbcefet;
    Self.picmsefet  := tribIcms.efet.picmsefet;
    Self.vicmsefet  := tribIcms.efet.vicmsefet;

    Self.qbcmono        := tribIcms.mono.qbcmono;
    Self.adremicms      := tribIcms.mono.adremicms;
    Self.vicmsmono      := tribIcms.mono.vicmsmono;
    Self.qbcmonoreten   := tribIcms.mono.qbcmonoreten;
    Self.adremicmsreten := tribIcms.mono.adremicmsreten;
    Self.vicmsmonoreten := tribIcms.mono.vicmsmonoreten;

    Self.espelho_calc.Text := Self.espelho_calc.Text + tribIcms.espelhoCalc.Text;

    CheckValoresInvalidos;     

  finally
    calcIcmsActive        := False;
    itemFiscal.vicmsdeson := vicmdeson;
  end;
  (*
  Result := False;
  Abase := valor_total +
           rateio_seguro +
           rateio_outdesp -
           rateio_desconto +
           IfThen(frete_usar_na_base_icms, rateio_frete);
  AbaseST := Abase + valor_ipi + nfe_vipidevol;
  Abase   := Abase + IfThen(FOwnerNF.ipi_base_icm = 'S', valor_ipi + nfe_vipidevol);

  if perc_red_prod <= 0 then
    perc_red_prod := 0;

  if perc_red_prod_sub <= 0 then
    perc_red_prod_sub := 0;

  if tipo_item = 'S' then
  begin
    aliq_icm    := 0;
    aliq_icmsub := 0;
  end;

  {$REGION 'calculo icms normal lucro real e presumido'}

  if (FOwnerNF.natureza_nf = 'E') and (import_xml = 'S') then
  begin
    // na importação do xml o sistema deixa como esta
  end
  else
  begin
    if (cst[2] in ['0', '1', '2', '3', '7', '9']) then// or ((cst[2] = '9') and (aliq_icm > 0)) then
      if (FOwnerNF.devolucao <> 'SIM') and (FOwnerNF.natureza_nf = 'S') and (aliq_icm > 0) and (tipo_item = 'V') and (red_lucro = 'S') then
      begin
        base_icm  := RoundTo(Abase - preco_compra_veiculo, -2);
        base_icm  := RoundTo(base_icm * (100 - perc_red_prod) / 100, -2);
        base_icm  := IfThen(base_icm > 0, base_icm);
        valor_icm := RoundTo(base_icm * aliq_icm / 100 , -2);
        vicmdeson := RoundTo(Abase * aliq_icm / 100, -2) - valor_icm;
      end
      else if (FOwnerNF.devolucao <> 'SIM') and (FOwnerNF.natureza_nf = 'S') and (aliq_icm > 0) then//and (tipo_item = 'P') then
      begin
        base_icm  := RoundTo(Abase * IfThen(perc_red_prod > 0, (100 - perc_red_prod) / 100, 1), -2);
        valor_icm := RoundTo(base_icm * aliq_icm / 100 , -2);
        vicmdeson := RoundTo(Abase * aliq_icm / 100, -2) - valor_icm;
      end
      else if aliq_icm > 0 then
      begin
        if (valor_icm = 0) and (base_icm = 0) then
        begin
          base_icm  := RoundTo(Abase - IfThen(perc_red_prod > 0, Abase * (100 - perc_red_prod) / 100), -2);
          valor_icm := RoundTo(base_icm * aliq_icm / 100 , -2);
        end
        else if (valor_icm = 0) and (base_icm > 0) then
          valor_icm := RoundTo(base_icm * aliq_icm / 100 , -2);
        vicmdeson := RoundTo(Abase * aliq_icm / 100, -2) - valor_icm;
      end;

    if aliq_icm <= 0 then
    begin
      aliq_icm      := 0;
      base_icm      := 0;
      valor_icm     := 0;
      perc_red_prod := 0;
    end;
  end;

  {$ENDREGION}

  {$REGION 'calculo icms normal simples nacional'}

  if (vDadosIni.strIn(csosn, ['101', '201', '900'])) and (FOwnerNF.natureza_nf = 'S') and (aliq_icm_simples > 0) then
  begin
    base_icm_simples  := RoundTo(Abase, -2);
    valor_icm_simples := RoundTo(base_icm_simples * aliq_icm_simples / 100, -2);
  end
  else
  begin
    aliq_icm_simples  := 0;
    base_icm_simples  := 0;
    valor_icm_simples := 0;
  end;

  {$ENDREGION}

  {$REGION 'calculo icms st'}

  Acalc_icm_val := 0;
  if (FOwnerNF.natureza_nf = 'E') and (import_xml = 'S') then
  begin
    mva               := 0;
    perc_red_prod_sub := 0;
  end
  else
  begin
    if (cst[2] in ['1', '3', '7', '9']) or
      //((cst[2] = '9') and (aliq_icmsub > 0) and (FOwnerNF.natureza_nf = 'S')) or
      ((cst[2] = '6') and (FOwnerNF.emissao_propria = 'N') and (FOwnerNF.conf_nf.Conf_ICMS.nf_e_hab_cst_60_calculo_st_icms)) then
    begin

      {$REGION 'credito de icms, calculando caso nao tenha calculado anteriormente'}
      if valor_icm > 0 then
        Acalc_icm_val := valor_icm
      else
      begin
        if (FOwnerNF.nfe_indiedest = 2) and (Copy(cst, 1, 1)[1] in ['1', '2', '3']) then
          Acalc_icm_aliq := 4
        else
          Acalc_icm_aliq := IfThen((FOwnerNF.nfe_indiedest = 1) and (FOwnerNF.nfe_iddest <> '1'), FOwnerNF.dados_uf.icm_ext_c, FOwnerNF.dados_uf.aliq_intra);
        Acalc_icm_val := RoundTo(Abase * Acalc_icm_aliq / 100, -2);
      end;
      {$ENDREGION}

      if (FOwnerNF.devolucao <> 'SIM') and (FOwnerNF.natureza_nf = 'S') and (aliq_icmsub > 0) then
      begin
        if modbcst = 4 then
        begin
          base_icmsub := RoundTo( AbaseST + (AbaseST * mva / 100), -2);
          base_icmsub := RoundTo( base_icmsub * IfThen(perc_red_prod_sub > 0, (100 - perc_red_prod_sub) / 100, 1), -2);
        end;
        valor_icm_stdes := RoundTo(base_icmsub * aliq_icmsub / 100, -2);
        valor_icmsub    := RoundTo(valor_icm_stdes - Acalc_icm_val, -2);
      end
      else if (aliq_icmsub > 0) then
      begin
        if (mva > 0) and (base_icmsub = 0) then
        begin
          modbcst     := 4;
          base_icmsub := RoundTo( AbaseST + (AbaseST * mva / 100), -2);
          base_icmsub := RoundTo( base_icmsub * IfThen(perc_red_prod_sub > 0, (100 - perc_red_prod_sub) / 100, 1), -2);
        end
        else if (mva <= 0) and (base_icmsub > 0) then
        begin
          mva     := 0;
          modbcst := 0;
        end;
        valor_icm_stdes := RoundTo(base_icmsub * aliq_icmsub / 100, -2);
        valor_icmsub    := RoundTo(valor_icm_stdes - Acalc_icm_val, -2);
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'icms desonerado caso nao tenha calculado acima e validacoes'}
  if (ind_desoneracao = 0) or (not MatchStr(Copy(cst, 2, 2), ['20', '30', '40', '41', '50', '70', '90'])) then
  begin
    vicmdeson := 0;
    ind_desoneracao := 0;
  end
  else if (ind_desoneracao > 0) and (MatchStr(Copy(cst, 2, 2), ['30', '40', '41', '50']) or ((cst[2] = '9') and (vicmdeson = 0))) then
  begin
    if (FOwnerNF.nfe_indiedest = 2) and (Copy(cst, 1, 1)[1] in ['1', '2', '3']) then
      Acalc_icm_aliq := 4
    else
      Acalc_icm_aliq := IfThen(FOwnerNF.nfe_iddest = '1', FOwnerNF.dados_uf.aliq_intra, FOwnerNF.dados_uf.icm_ext_c);
    vicmdeson := RoundTo(Abase * Acalc_icm_aliq / 100, -2);
  end;
  {$ENDREGION}

  {$REGION 'icms efetivo'}

  if (picmsefet > 0) and (cst[1] = '6') and (FOwnerNF.emissao_propria = 'S') and (FOwnerNF.consumidor_final = 'S') and
    (vDadosIni.strIn(FOwnerNF.dest_uf, FOwnerNF.conf_nf.Conf_ICMS.icms_efetivo_ufs)) and
    ((FOwnerNF.natureza_nf = 'S') or (FOwnerNF.conf_nf.Conf_ICMS.icms_efetivo_calc_entrada)) then
  begin
    if predbcefet > 0 then
      vbcefet    := RoundTo(((Abase) * (100 - predbcefet) / 100), -2)
    else
    begin
      vbcefet    := RoundTo(Abase, -2);
      predbcefet := 0;
    end;
    vicmsefet    := RoundTo(vbcefet * picmsefet / 100, -2);
  end
  else
  begin
    predbcefet := 0;
    picmsefet  := 0;
    vbcefet    := 0;
    vicmsefet  := 0;
  end;
  
  {$ENDREGION}

  {$REGION 'fcp'}
  
  {$ENDREGION}

  {$REGION 'validando campos negativos e setando outros valores'}

  {$REGION 'dados do icms normal'}
  if cst[2] = '3' then
    aliq_icm := 0;
  if ((vDadosIni.vEmp.vRegime <> 'SIMPLES') and
      (not (cst[2] in ['0', '1', '2', '7', '9']))) or
     (aliq_icm <= 0) or (valor_icm <= 0) then
  if aliq_icm <= 0 then
  begin
    aliq_icm          := 0;
    base_icm          := 0;
    valor_icm         := 0;
    perc_red_prod     := 0;
    aliq_icm_simples  := 0;
    base_icm_simples  := 0;
    valor_icm_simples := 0;
  end
  else if vDadosIni.vEmp.vRegime = 'SIMPLES' then
  begin
    aliq_icm      := 0;
    base_icm      := 0;
    valor_icm     := 0;
    perc_red_prod := 0;
  end;
  {$ENDREGION}

  {$REGION 'dados do cims st'}

  if valor_icmsub < 0 then
  begin
    with FOwnerNF.erros.New do
    begin
      erro    := 'Cálculo do ST menor que zero. Verifique os dados do Item';
      detalhe := Format('Item %d - %s'    , [nitem, descricao_item]) + sLineBreak +
                 //Format('Valor total: %n' , [valor_total]) + sLineBreak +
                 Format('Red ICMS: %n'    , [perc_red_prod        ]) + sLineBreak +
                 Format('Base ICMS: %n'   , [base_icm             ]) + sLineBreak +
                 Format('Aliq ICMS: %n'   , [aliq_icm             ]) + sLineBreak +
                 Format('Valor ICMS: %n'  , [valor_icm            ]) + sLineBreak +
                        '----------------'                           + sLineBreak +
                 Format('Modalidade: %d'  , [modbcst              ]) + sLineBreak +
                 Format('MVA: %n'         , [mva                  ]) + sLineBreak +
                 Format('Red ST: %n'      , [perc_red_prod_sub    ]) + sLineBreak +
                 Format('Base ST: %n'     , [AbaseST              ]) + sLineBreak +
                 Format('Aliq ST: %n'     , [aliq_icmsub          ]) + sLineBreak +
                 Format('Valor STDES: %n' , [valor_icm_stdes      ]) + sLineBreak +
                 Format('Credito ICMS: %n', [Acalc_icm_val        ]) + sLineBreak +
                        '----------------'                           + sLineBreak +
                 Format('Valor ST: %n'    , [valor_icmsub         ]) + sLineBreak;
    end;
  end;

  if (not ((cst[2] in ['1', '3', '7', '9']) or
     ((cst[2] = '6') and (FOwnerNF.emissao_propria = 'N') and (FOwnerNF.conf_nf.Conf_ICMS.nf_e_hab_cst_60_calculo_st_icms)))) or
     (aliq_icmsub  <= 0) or
     (valor_icmsub <= 0) then
  begin
    aliq_icmsub       := 0;
    base_icmsub       := 0;
    valor_icmsub      := 0;
    valor_icm_stdes   := 0;
    perc_red_prod_sub := 0;
    mva               := 0;
  end;
  {$ENDREGION}

  {$REGION 'dados antecipacao tributária'}
  if cst[2] <> '6' then
  begin
    base_icmant_sub  := 0;
    valor_icmant_sub := 0;
  end;
  {$ENDREGION}

  {$REGION 'calculando campos do sintegra, valores isentos, outras e nao trib'}
  Abase := valor_total +
           rateio_seguro +
           rateio_outdesp -
           rateio_desconto +
           IfThen(FOwnerNF.frete_f_nfe <> 'S', rateio_frete) +
           valor_ipi +
           nfe_vipidevol;

  if (cst[2] in ['2', '7', '9']) then
    vlisento := IfThen(Abase > base_icm, Abase - base_icm)
  else
    vlisento := IfThen(vDadosIni.strIn(Copy(cst, 2, 2), ['30', '40']), Abase);
  vln_trib := IfThen(Copy(cst, 2, 2) = '41', Abase);
  vloutras := IfThen( (Abase - base_icm - vlisento - vln_trib) > 0, Abase - base_icm - vlisento - vln_trib);
  {$ENDREGION}

  {$ENDREGION}

  *)
end;

procedure THw_notafiscal_item_class.calculo_ipi_executar;
var
  //Abase: Double;
  trib: TIpiTributavel;
begin
  HandleItemTribCreate;
  try
    if (TTipoCalculo(tipo_calc) = tcNenhum) or
       ((TTipoCalculo(tipo_calc) = tcParcial) and (not calcIPIActive)) then
      Exit;

    itemFiscal.tipoCalc := TTipoCalculo(tipo_calc);
    itemFiscal.base     := base_ipi;
    itemFiscal.baseST   := 0;

    itemTrib.ipi.cst      := cst_ipi;
    itemTrib.ipi.aliq_ipi := aliq_ipi;

    trib    := OpFiscalMotor.CalcularIPI(itemFiscal, itemTrib.ipi, FOwnerNF.conf_nf);

    cst_ipi := trib.cst;
    //ipi_qunid := trib.qtde.vbc;
    //ipi_vunid := trib.qtde.paliq;
    
    if (FOwnerNF.emissao_propria = 'S') and (FOwnerNF.modelo_nf = '55')
      and (FOwnerNF.tpimp = Ord(fidSimplificadoTipo2)) then
    begin                    
      aliq_ipi  := 0;
      base_ipi  := 0;
      valor_ipi := 0;
    end
    else
    begin
      aliq_ipi  := trib.aliq.paliq;
      base_ipi  := trib.aliq.vbc;
      valor_ipi := trib.vipi;
    end;

  finally
    calcIPIActive   := False;
    itemFiscal.vipi := valor_ipi + nfe_vipidevol;
  end;
  {
  Result := False;
  Abase := valor_total +
           rateio_seguro +
           rateio_outdesp -
           rateio_desconto;

  if perc_red_ipi <= 0 then
    perc_red_ipi := 0;

  if tipo_item = 'S' then
    aliq_ipi := 0;

  if (FOwnerNF.devolucao <> 'SIM') and (FOwnerNF.natureza_nf = 'S') and (aliq_ipi > 0) and (not (tipo_item[1] in ['O', 'D'])) then
  begin
    base_ipi  := RoundTo(Abase - IfThen(perc_red_ipi > 0, Abase * perc_red_ipi / 100), -2);
    valor_ipi := RoundTo(base_ipi * aliq_ipi / 100 , -2);
  end
  else if aliq_ipi > 0 then
  begin
    if (valor_ipi = 0) and (base_ipi = 0) then
    begin
      base_ipi  := RoundTo(Abase - IfThen(perc_red_ipi > 0, Abase * perc_red_ipi / 100), -2);
      valor_ipi := RoundTo(base_ipi * aliq_ipi / 100 , -2);
    end
    else if (valor_ipi = 0) and (base_ipi > 0) then
      valor_ipi := RoundTo(base_ipi * aliq_ipi / 100 , -2);
  end
  else
  begin
    aliq_ipi     := 0;
    base_ipi     := 0;
    valor_ipi    := 0;
    perc_red_ipi := 0;
  end;
  cst_ipi := IfThen(FOwnerNF.natureza_nf = 'S', '5', '0') + IfThen(valor_ipi > 0, '0', '2');
  cst_ipi := IfThen((Pos('SIMPLES', vDadosIni.vEmp.vRegime) > 0) or (vDadosIni.vEmp.vContribuinteDeIPI <> 'S'), '99', cst_ipi);
  }
end;

procedure THw_notafiscal_item_class.calculo_iss_executar;
var
  trib: TISSQNTributavel;
begin
  try

    if (TTipoCalculo(tipo_calc) = tcNenhum) or
       ((TTipoCalculo(tipo_calc) = tcParcial) and (not calcISSActive)) then
      Exit;

    itemFiscal.tipoCalc := TTipoCalculo(tipo_calc);
    itemFiscal.base     := base_iss;
    itemFiscal.baseST   := 0;

    itemTrib.iss.aliq_iss := aliq_iss;

    trib           := OpFiscalMotor.CalcularISSQN(itemFiscal, itemTrib.iss, FOwnerNF.conf_nf);
    Self.aliq_iss  := trib.paliq;
    Self.base_iss  := trib.vbc;
    Self.valor_iss := trib.vissqn;

  finally
    calcISSActive := False;
  end;
end;

procedure THw_notafiscal_item_class.calculo_piscofins_executar;
var
  difalTrib: TIcmsUfDestTributavel;
  trib: TPisCofinsTributavel;
  valorIcmsTmp, valorIcmsStTmp, valorIcmsAntTmp, valorIcmsDifalTmp: Double;
begin
  HandleItemTribCreate;
  try
    opf_pc_id := itemTrib.piscofins.piscofins_id;

    if (TTipoCalculo(tipo_calc_pc) = tcNenhum) or
       ((TTipoCalculo(tipo_calc_pc) = tcParcial) and (not calcPISCOFINSActive)) then
      Exit;

    {$REGION 'obtendo valor do icms, pois o piscofins é feito antes por conta da desoneracao'}
    valorIcmsTmp := 0;
    valorIcmsStTmp := 0;
    valorIcmsAntTmp := 0;
    valorIcmsDifalTmp := 0;
    if (TTipoCalculo(tipo_calc) = tcNenhum) or
       ((TTipoCalculo(tipo_calc) = tcParcial) and (not calcIcmsActive)) then
    begin
      valorIcmsTmp := valor_icm + vicmsmono;
      valorIcmsStTmp := valor_icmsub; // st destacado ou antecipado (antec_trib = S ou D)
      // valorIcmsAntTmp := ?; // caso precise implemntar obter o valor de onde?
      valorIcmsDifalTmp := vicmsufdest;// IfThen(MatchText(antec_trib, ['S', 'D'], valor_icmsub);
    end
    else
    begin
      if itemTrib.icms.icms_id = 0 then
      begin
        itemTrib.icms.motdesicm      := ind_desoneracao;
        itemTrib.icms.tributacao     := Ord(OpFiscal.CstIcmsToTributacao(Copy(Self.cst, 2, 2), aliq_icm, aliq_icmsub));
        itemTrib.icms.cfop           := Trunc(codigo_nop);
        itemTrib.icms.aliq_icms      := IfThen(aliq_icm > 0, aliq_icm, IfThen(ind_desoneracao > 0, FOwnerNF.aliq_icm));
        itemTrib.icms.aliq_fcp       := fcp_pfcp;
        itemTrib.icms.aliq_red_bc    := perc_red_prod;
        itemTrib.icms.aliq_icms_dif  := pdif;
        itemTrib.icms.aliq_fcp_dif   := pfcpdif;
        itemTrib.icms.aliq_intra     := aliq_icmsub;
        itemTrib.icms.aliq_mva       := mva;
        itemTrib.icms.aliq_credsn    := aliq_icm_simples;
        itemTrib.icms.adRemIcms      := adremicms;
        itemTrib.icms.adRemIcmsReten := adremicmsreten;
      end;
      itemFiscal.tipoCalc := TTipoCalculo(tipo_calc);
      itemFiscal.base     := base_icm;
      itemFiscal.baseST   := base_icmsub;
      itemFiscal.qtdebc   := IfThen(qbcmono > 0, qbcmono, qbcmonoreten);

      with OpFiscalMotor.CalcularICMS(itemFiscal, itemTrib.icms, FOwnerNF.conf_nf) do
      begin
        valorIcmsTmp        := op.vicms + mono.vicmsmono;
        valorIcmsStTmp := st.vicmsst;
        // valorIcmsAntTmp := ?; // caso precise implemntar obter o valor de onde?
        Free;
      end;

      if not Assigned(tribIcms)  then
      begin
        tribIcms := TIcmsTributavel.Create;
        tribIcms.cst := Copy(Self.cst, 2, 2);
        tribIcms.op := TIcmsTributavel_OP.Create;
        tribIcms.op.vbc := Self.base_icm;
      end;

      difalTrib := OpFiscalMotor.CalcularICMSUfDest(itemFiscal, itemTrib.icms, FOwnerNF.conf_nf, tribIcms);
      valorIcmsDifalTmp := difalTrib.vicmsufdest;
      difalTrib.Free;

      itemFiscal.qtdebc   := 0;
    end;
    {$ENDREGION}

    itemFiscal.tipoCalc   := TTipoCalculo(tipo_calc_pc);
    itemFiscal.base       := IfThen(cst_pis = '03', quant_bc_pis, base_pis);
    itemFiscal.baseST     := 0;
    itemFiscal.vicms      := valorIcmsTmp;
    itemFiscal.vicmsst    := valorIcmsStTmp;
    itemFiscal.vicmsant   := valorIcmsAntTmp;
    itemFiscal.vicmsdifal := valorIcmsDifalTmp;

    if itemTrib.piscofins.piscofins_id = 0 then
    begin
      itemTrib.piscofins.cst_pc       := IfThen(cst_pis = '', IfThen(FOwnerNF.natureza_nf = 'E', '50', '01'), cst_pis);
      itemTrib.piscofins.aliq_pis     := IfThen(itemTrib.piscofins.cst_pc <> '03', aliq_pis);
      itemTrib.piscofins.aliq_cofins  := IfThen(itemTrib.piscofins.cst_pc <> '03', aliq_cofins);
      itemTrib.piscofins.valiq_pis    := IfThen(itemTrib.piscofins.cst_pc = '03', aliq_pis_quant);
      itemTrib.piscofins.valiq_cofins := IfThen(itemTrib.piscofins.cst_pc = '03', aliq_cofins_quant);
      itemTrib.piscofins.motdespc     := motdes_pc;
      itemTrib.piscofins.nat_rec      := nat_rec;
    end;
    itemTrib.piscofins.conf_pc.Text := FOwnerNF.ConfTripPC.Text;

    trib                   := OpFiscalMotor.CalcularPISCOFINS(itemFiscal, itemTrib.piscofins, FOwnerNF.conf_nf);
    Self.cst_pis           := trib.cst;
    Self.cst_cofins        := trib.cst;
    Self.quant_bc_pis      := trib.pcqtde.vbcouqtde;
    Self.quant_bc_cofins   := trib.pcqtde.vbcouqtde;
    Self.aliq_pis_quant    := trib.pcqtde.paliqpis;
    Self.aliq_cofins_quant := trib.pcqtde.paliqcofins;
    Self.base_pis          := trib.pcaliq.vbcouqtde;
    Self.base_cofins       := trib.pcaliq.vbcouqtde;
    Self.aliq_pis          := trib.pcaliq.paliqpis;
    Self.aliq_cofins       := trib.pcaliq.paliqcofins;
    Self.valor_pis         := trib.vpis;
    Self.valor_cofins      := trib.vcofins;
    Self.nat_rec           := trib.natrec;

    if// (FOwnerNF.emissao_propria = 'S') and
      (MatchText(Self.cst_pis, ['05', '75'])) and (Self.valor_pis > 0) then
    begin
      Self.valor_pis_st    := Self.valor_pis;
      Self.valor_cofins_st := Self.valor_cofins;
    end
    else
    begin                                       
      Self.valor_pis_st    := 0;
      Self.valor_cofins_st := 0;
    end;

    Self.motdes_pc    := trib.motdes;
    Self.vpisdeson    := trib.vpisdeson;
    Self.vcofinsdeson := trib.vcofinsdeson;
    Self.ppisdeson    := trib.ppisdeson;
    Self.pcofinsdeson := trib.pcofinsdeson;

    Self.espelho_calc.Text := Self.espelho_calc.Text + trib.espelhoCalc.Text;

  finally
    calcPISCOFINSActive     := False;
    itemFiscal.vpisdeson    := vpisdeson;
    itemFiscal.vcofinsdeson := vcofinsdeson;
  end;
  {
  Result := False;
  //apenas saida para a criação de notas em lote do pedido, pois confirmando pela tela ja existe calculo
  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
  begin
    aliq_pis_quant    := 0;
    aliq_cofins_quant := 0;
    aliq_pis          := 0;
    aliq_cofins       := 0;
    base_pis          := 0;
    base_cofins       := 0;
    valor_pis         := 0;
    valor_cofins      := 0;
    quant_bc_pis      := 0;
    quant_bc_cofins   := 0;
    cst_pis           := '99';
    cst_cofins        := '99';
  end
  else
  begin
    if (cst_pis = '03') and (aliq_pis_quant > 0) then
    begin
      quant_bc_pis    := quantidade;
      quant_bc_cofins := quantidade;
      valor_pis       := RoundTo(quant_bc_pis    * aliq_pis_quant   , -2);
      valor_cofins    := RoundTo(quant_bc_cofins * aliq_cofins_quant, -2);
      aliq_pis        := 0;
      aliq_cofins     := 0;
      base_pis        := 0;
      base_cofins     := 0;
    end
    else if aliq_pis > 0 then
    begin
      cf     := FOwnerNF.conf_nf.Conf_PIS.nf_piscofins_bases;
      strmod := PadL(StrToIntDef(FOwnerNF.modelo_nf, 0), 2);
      strmod := IfThen(strmod = '00', FOwnerNF.modelo_nf, strmod);
      strmod := Format('%s_Modelo_%s', [IfThen(FOwnerNF.natureza_nf = 'E', 'Entrada', 'Saida'), strmod]);

      base_pis          := valor_total +
                        IfThen((cf.ReadString(strmod, 'Campo_Seguro'  , 'S') = 'S'), rateio_seguro) +
                        IfThen((cf.ReadString(strmod, 'Campo_Outras'  , 'S') = 'S'), rateio_outdesp) -
                        IfThen((cf.ReadString(strmod, 'Campo_Desconto', 'S') = 'S'), rateio_desconto) +
                        IfThen((cf.ReadString(strmod, 'Campo_Frete'   , 'S') = 'S') and (FOwnerNF.frete_f_nfe <> 'S'), rateio_frete) +
                        IfThen((cf.ReadString(strmod, 'Campo_ValorIPI', IfThen(FOwnerNF.natureza_nf = 'E', 'S')) = 'S'), valor_ipi + nfe_vipidevol);

      base_cofins       := base_pis;
      valor_pis         := RoundTo(base_pis    * aliq_pis    / 100, -2);
      valor_cofins      := RoundTo(base_cofins * aliq_cofins / 100, -2);
      aliq_pis_quant    := 0;
      aliq_cofins_quant := 0;
      quant_bc_pis      := 0;
      quant_bc_cofins   := 0;
    end
    else
    begin
      aliq_pis_quant    := 0;
      aliq_cofins_quant := 0;
      aliq_pis          := 0;
      aliq_cofins       := 0;
      base_pis          := 0;
      base_cofins       := 0;
      valor_pis         := 0;
      valor_cofins      := 0;
      quant_bc_pis      := 0;
      quant_bc_cofins   := 0;
    end;
  end;
  }
end;

procedure THw_notafiscal_item_class.calculo_retencoes_executar;
var
  //Abase: Double;
  trib: TRetencaoTributavel;
begin
  HandleItemTribCreate;

  opf_ret_id := itemTrib.retTrib.ret_id;

  if FOwnerNF.ret_fed = Ord(rfSemRetencao) then
  begin
    vbcretfed  := 0;
    pretir     := 0;
    vretir     := 0;
    pretcsll   := 0;
    vretcsll   := 0;
    pretpis    := 0;
    vretpis    := 0;
    pretcofins := 0;
    vretcofins := 0;

    Exit;
  end;

  if (TTipoCalculo(tipo_calc_retfed) = tcNenhum) or
     ((TTipoCalculo(tipo_calc_retfed) = tcParcial) and (not calcRetTribActive)) then
    Exit;

  try

    itemFiscal.tipoCalc := TTipoCalculo(tipo_calc_retfed);

    if TTipoCalculo(tipo_calc_retfed) = tcParcial then // Vem do front
    begin
      itemFiscal.base                  := vbcretfed;

      itemTrib.retTrib.aliq_ret_ir     := pretir;
      itemTrib.retTrib.aliq_ret_csll   := pretcsll;
      itemTrib.retTrib.aliq_ret_pis    := pretpis;
      itemTrib.retTrib.aliq_ret_cofins := pretcofins;
    end;

    trib := OpFiscalMotor.CalcularRetencaoTributos(itemFiscal, itemTrib.retTrib, FOwnerNF.conf_nf);

    vbcretfed  := trib.vBcRetFed;
    pretir     := trib.pIr;
    vretir     := trib.vIr;
    pretcsll   := trib.pCsll;
    vretcsll   := trib.vCsll;
    pretpis    := trib.pPis;
    vretpis    := trib.vPis;
    pretcofins := trib.pCofins;
    vretcofins := trib.vCofins;

    Self.espelho_calc.Text := Self.espelho_calc.Text + trib.espelhoCalc.Text;

  finally
    calcRetTribActive := False;
  end;
end;

procedure THw_notafiscal_item_class.calculo_tributos_executar;
var
  Ancm_loc : TNbm_class;
  Aibpt    : TIbpt_class;
begin
  if (FOwnerNF.consumidor_final <> 'S') or (FOwnerNF.natureza_nf <> 'S') then
    vtottrib := 0;

  if TTipoCalculo(tipo_calc) = tcNenhum then
    Exit;

  {$REGION 'obtendo dados dos totais de tributos ibpt'}
  vtottrib := 0;
  if (FOwnerNF.consumidor_final = 'S') and (FOwnerNF.natureza_nf = 'S') then
  begin
    Ancm_loc := FOwnerNF.cad_ncm_loc.get_ncm(ncm);
    Aibpt    := FOwnerNF.cad_ibpt.get_ibpt(ncm, FOwnerNF.dest_uf, 0);

    if Assigned(Aibpt) then
      vtottrib := IfThen(cst[1] in ['0', '3', '4', '5', '8'], Aibpt.nacional, Aibpt.importado) + Aibpt.estadual + Aibpt.municipal
    else if Assigned(Ancm_loc) then
      vtottrib := IfThen(cst[1] in ['0', '3', '4', '5', '8'], Ancm_loc.aliqnac, Ancm_loc.aliqimp);
    vtottrib   := RoundTo(IfThen(vtottrib <= 0, vDadosIni.vEmp.vAliqPadraoDeOlhoImpostoProduto, vtottrib) * valor_total / 100, -2);
  end;
  {$ENDREGION}
end;

procedure THw_notafiscal_item_class.calculo_tributos_rtc_executar;
var
  I: Integer;
  grupoFiscalId: string;
  regraFiscalId: string;
  regraFiscal  : RegraFiscalIbsCbsEtd;
  rfTribRegular: RegraFiscalIbsCbsEtd;
  itensInput   : ItensCalculoInput;
  calcInput    : ItemCalculoInput;
  impSelInput  : ImpostoSeletivoInput;
  tribRegInput : TributacaoRegularInput;
  bcCbsIbs     : Currency;
  bcImpSeletivo: Currency;
  rocResult    : ROCDomain;
  indDoacao    : Boolean;
  tipoRegra    : TipoRegraTributoDFeEnum;
  TpEnteGov    : TipoEnteGovEnum;
  TpOperGov    : TipoOperEnteGovNFeEnum;
begin
  if YesNoEnum(FOwnerNF.dfe_trib_ignorar) = ynYes then
  begin
    tributosRTC := nil;
    Exit;
  end
  else if (FtributosRTC <> nil) and (FtributosRTC.IbsCbs <> nil) then
  begin
    tipoRegra := FtributosRTC.IbsCbs.TipoRegra;
    regraFiscalId := FtributosRTC.IbsCbs.RegraFiscalId.Value;
  end
  else
  begin
    tipoRegra := tctAutomatica; //**Pend** Entrada deveria ser tctNenhum
    regraFiscalId := '';
  end;

  // 1: Encontrando a regra fiscal
  case tipoRegra of
    tctAutomatica:
      begin
        if tipo_item = 'P' then
          grupoFiscalId := Fmerc.grupo_fiscal_ibscbs
        else
          grupoFiscalid := '';

        with Container.GetInstance().ErpFeaturesFactory.CreateResolverRegraFiscalIbsCbsUseCase() do
        try
          regraFiscal := Executar(
              ResolverRegraFiscalIbsCbsInput.Create(
                StrDefault( op_interna_id, FOwnerNF.op_interna_id),
                grupoFiscalid,
                vDadosIni.cod_empresa, FOwnerNF.data_contabil
              )
            );
        finally
          FreeSafe();
        end;
      end;

    tctManual:
      with Container.GetInstance().ErpFeaturesFactory.CreateObterRegraFiscalIbsCbsPorIdUseCase() do
      try
        regraFiscal := Executar( regraFiscalId );
      finally
        FreeSafe();
      end;

    tctNenhuma:
      begin
        if Trim(dfe_trib_id) = '' then
          dfe_trib_id := NewGuid();

        if Assigned(FtributosRTC) and (FtributosRTC.Id = '') then
          FtributosRTC.Id := dfe_trib_id;

        Exit;
      end;
  end;

  // Falta definir se teremos um processo e onde teremos para o preenchimento dos campos da RTC
  if regraFiscal = nil then
  begin
    FOwnerNF.erros.New('Regra fiscal do IBS e CBS não encontrada | Item %s - %s', [num_fab_prod, descricao_item]);
    Exit;
  end;

  // Ente governamental, quando implementar basta ajustar
  {
  if FOwnerNF.EnteGov <> nil then
  begin
    //TpOperGov := FOwnerNF.EnteGov.TpOperGov;
    //TpEnteGov := FOwnerNF.EnteGov.TpEnteGov;
  end
  else
  }
  begin
    TpOperGov := togNenhum;
    TpEnteGov := tgvNenhum;
  end;
  
  // 2: Criando inputs e Calculando Base de calculo ImpostoSeletivo, CBS e IBS
  rocResult := nil;
  try
    // Falta implentar como configura o Imposto Seletivo, é pra 2027 ainda
    if True then 
    begin
      impSelInput := ImpostoSeletivoInput.NullInstance();
      bcImpSeletivo := 0;
    end
    else
    begin
      bcImpSeletivo := Container.GetInstance().FiscalCalculosFactory.CreateCalcularBCImpostoSeletivoUseCase()
        .Executar(
            BaseCalculoISMercadoriasModel.Create(
              {AnoFatoGerador} FOwnerNF.GetAnoFatoGerador(),
              {ValorBem} valor_total,
              {AjusteAcrescimos} ( rateio_seguro + rateio_outdesp ),
              {Juros} 0,
              {Multas} 0,
              {Encargos} 0,
              {FreteCobrado} IfThen(FOwnerNF.frete_f_nfe <> 'S', rateio_frete),
              {OutrosTributos} 0,
              {DemaisImportancias} 0,
              {ICMS}   valor_icm,    // ICMS ST ainda nao definido como fica
              {ISS}    valor_iss,
              {IPI}    valor_ipi,
              {DescontoIncondicional} rateio_desconto,
              {Bonificacao} 0,
              {DevolucaoVendas} 0
          ));

      impSelInput := ImpostoSeletivoInput.Create( 
        {Cst} '', 
        {CClassTrib} '', 
        {BaseCalculo} bcImpSeletivo, 
        {Quantidade} 0, 
        {Unidade} '' ,
        {ImpostoInformado} 0  // É necessario verificar se esse valor Digitado ou é calculado ou ret
      );
    end;

    rfTribRegular := nil;
    if not regraFiscal.RegraFiscalTribRegularId.IsNull then
      with Container.GetInstance().ErpFeaturesFactory.CreateObterRegraFiscalIbsCbsPorIdUseCase() do
      try
        rfTribRegular := Executar( regraFiscal.RegraFiscalTribRegularId.Value );
      finally
        FreeSafe();
      end;

    if rfTribRegular = nil then
      tribRegInput := TributacaoRegularInput.NullInstance()
    else
    begin
      try
        tribRegInput := TributacaoRegularInput.Create(
          Copy(rfTribRegular.CClassTrib, 1, 3),
          rfTribRegular.CClassTrib
        );
      finally
        rfTribRegular.Free();
      end;
    end;

    bcCbsIbs := Container.GetInstance().FiscalCalculosFactory.CreateCalcularBCIbsCbsUseCase()
      .Executar(
          BaseCalculoIbsCbsModel.Create(
            {AnoFatoGerador} FOwnerNF.GetAnoFatoGerador(),
            {ValorBem} valor_total,
            {AjusteAcrescimos} ( rateio_seguro + rateio_outdesp ),
            {Juros} 0,
            {Multas} 0,
            {Encargos} 0,
            {FreteCobrado} IfThen(FOwnerNF.frete_f_nfe <> 'S', rateio_frete),
            {OutrosTributos} 0,
            {ImpostoSeletivo} 0,
            {DemaisImportancias} 0,
            {ICMS}   valor_icm,    // ICMS ST ainda nao definido como fica
            {ISS}    valor_iss,
            {PIS}    valor_pis,    // PIS ST?
            {COFINS} valor_cofins,  // COFINS ST?
            {IPI} valor_ipi,
            {DescontoIncondicional} rateio_desconto
        ));

    calcInput := ItemCalculoInput.Create(
      nitem,
      IfThen(tipo_item = 'S', nbs, ncm),
      regraFiscal.CClassTrib,
      Copy(regraFiscal.CClassTrib, 1, 3),
      impSelInput,
      tribRegInput,
      bcCbsIbs,
      quantidade,
      referencia
    );
    SetLength(itensInput, 1);
    itensInput[0] := calcInput;                           

    // 3: Chamada do calculo dos tributos     
    with Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase() do
    try
      rocResult := Executar(
        CalcularTributoInput.Create(
          FOwnerNF.data_contabil,
          FOwnerNF.cmunfgibs,
          EstadosService.MunicipioIbgeToUF(FOwnerNF.cmunfgibs),
          itensInput,
          CriadorCompraGovernamentalUtils.CriarCompraGovernamentalInput(TpEnteGov, TpOperGov)
        )
      );
    finally
      FreeSafe();
    end;

    if not rocResult.Validacoes.IsValid() then
    begin
      for I := Low(rocResult.Validacoes.Validacoes) to High(rocResult.Validacoes.Validacoes) do
        FOwnerNF.erros.New( rocResult.Validacoes.Validacoes[I].Detalhe ); // a mensagem passou a ser traduzida no caso de uso do calculo e no servico diretamente
    end
    else
    begin
      if Trim(dfe_trib_id) = '' then
        dfe_trib_id := NewGuid();

      indDoacao := (FtributosRTC <> nil) and (FtributosRTC.IbsCbs <> nil) and FtributosRTC.IbsCbs.Inddoacao;

      FreeAndNil( FtributosRTC );
      FtributosRTC := TributosDFeSerivce.Create(
        TributoDFeContextInput.Create( dfe_trib_id, StringNullable.Create(regraFiscal.Id), tipoRegra, indDoacao, tdfoNotaFiscal),
        rocResult.Objetos[0]
      );
    end;

  finally
    regraFiscal.Free();
    rocResult.Free();
  end;
end;

constructor THw_notafiscal_item_class.Create(AOwnerNF: THw_notafiscal_class);
begin
  inherited Create;
  FOwnerNF    := AOwnerNF;
  FdadosDeson := THw_notafiscal_item_desoneracao.Create;
  quantidade  := 1;
  modbc       := 3;
  modbcst     := 4;
  indtot      := 1;
  indsomapisst := 1;
  indsomacofinsst := 1;
  camp_entest := 'L';
  altera_estoque_cfop := 'S';
  altera_custo_cfop   := 'S';
  conf_bcnf   := TStringIni.Create;
//  FsaveUserAliqs := False;
  FcalcIcmsActive := False;
  FcalcIcmsUfDestActive := False;
  FcalcIPIActive := False;
end;

function THw_notafiscal_item_class.dados_desoneracao_embutida_pedido: Boolean;
var
  Abase, Acalc_icm_aliq: Double;
begin
  Result := False;

  obter_dados_geral;

  itemFiscal.tipoCalc := TTipoCalculo(tipo_calc_pc);
  itemFiscal.base     := IfThen(cst_pis = '03', quant_bc_pis, base_pis);
  itemFiscal.baseST   := 0;

  if itemTrib.piscofins.piscofins_id = 0 then
  begin
    itemTrib.piscofins.cst_pc       := IfThen(cst_pis = '', IfThen(FOwnerNF.natureza_nf = 'E', '50', '01'), cst_pis);
    itemTrib.piscofins.aliq_pis     := IfThen(itemTrib.piscofins.cst_pc <> '03', aliq_pis);
    itemTrib.piscofins.aliq_cofins  := IfThen(itemTrib.piscofins.cst_pc <> '03', aliq_cofins);
    itemTrib.piscofins.valiq_pis    := IfThen(itemTrib.piscofins.cst_pc = '03', aliq_pis_quant);
    itemTrib.piscofins.valiq_cofins := IfThen(itemTrib.piscofins.cst_pc = '03', aliq_cofins_quant);
    itemTrib.piscofins.motdespc     := motdes_pc;
  end;

  if itemTrib.icms.icms_id = 0 then
  begin
    itemTrib.icms.motdesicm      := ind_desoneracao;
    itemTrib.icms.tributacao     := Ord(OpFiscal.CstIcmsToTributacao(Copy(Self.cst, 2, 2), aliq_icm, aliq_icmsub));
    itemTrib.icms.cfop           := Trunc(codigo_nop);
    itemTrib.icms.aliq_icms      := IfThen(aliq_icm > 0, aliq_icm, IfThen(ind_desoneracao > 0, FOwnerNF.aliq_icm));
    itemTrib.icms.aliq_fcp       := fcp_pfcp;
    itemTrib.icms.aliq_red_bc    := perc_red_prod;
    itemTrib.icms.aliq_icms_dif  := pdif;
    itemTrib.icms.aliq_fcp_dif   := pfcpdif;
    itemTrib.icms.aliq_intra     := aliq_icmsub;
    itemTrib.icms.aliq_mva       := mva;
    itemTrib.icms.aliq_credsn    := aliq_icm_simples;
    itemTrib.icms.adRemIcms      := adremicms;
    itemTrib.icms.adRemIcmsReten := adremicmsreten;
  end;

  itemFiscal.tipoCalc := TTipoCalculo(tipo_calc);
  itemFiscal.base     := base_icm;
  itemFiscal.baseST   := base_icmsub;
  itemFiscal.qtdebc   := IfThen(qbcmono > 0, qbcmono, qbcmonoreten);

  FdadosDeson.valor_adicional_custeio := OpFiscalMotor.CalcularAdicionalDesoneracaoTotal(itemFiscal, itemTrib, FOwnerNF.conf_nf);
  
  Self.valor_total     := Self.valor_total + FdadosDeson.valor_adicional_custeio;
  Self.valor_unitario  := Self.valor_total / Self.quantidade;
  Self.perc_desconto   := Self.rateio_desconto / Self.valor_total * 100;
  Exit;




  Abase := valor_total +
           rateio_seguro +
           rateio_outdesp -
           rateio_desconto +
           IfThen(frete_usar_na_base_icms, rateio_frete);
  //Abase   := Abase + IfThen(FOwnerNF.ipi_base_icm = 'S', valor_ipi + nfe_vipidevol);

  FdadosDeson.percentual_adicional_custeio := 0;
  FdadosDeson.valor_adicional_custeio      := 0;
  if (ind_desoneracao = 0) or (not MatchStr(Copy(cst, 2, 2), ['20', '30', '40', '41', '50', '70', '90'])) then
  else if (ind_desoneracao > 0) and (MatchStr(Copy(cst, 2, 2), ['30', '40', '41', '50']) or ((cst[2] = '9') and (aliq_icm = 0))) then
  begin
    if (FOwnerNF.nfe_indiedest = 2) and (Copy(cst, 1, 1)[1] in ['1', '2', '3']) then
      Acalc_icm_aliq := 4
    else
      Acalc_icm_aliq := IfThen(FOwnerNF.nfe_iddest = '1', FOwnerNF.dados_uf.aliq_intra, FOwnerNF.dados_uf.icm_ext_c);
//    vicmdeson := RoundTo(Abase * Acalc_icm_aliq / 100, -2);

    FdadosDeson.percentual_adicional_custeio := Acalc_icm_aliq - ((1 - (perc_red_prod / 100)) * Acalc_icm_aliq);
    FdadosDeson.percentual_adicional_custeio := IfThen(FdadosDeson.percentual_adicional_custeio > 0, FdadosDeson.percentual_adicional_custeio, Acalc_icm_aliq);
    FdadosDeson.valor_adicional_custeio      := RoundTo(Abase / (1 - (FdadosDeson.percentual_adicional_custeio / 100)), -2);
    FdadosDeson.valor_adicional_custeio      := FdadosDeson.valor_adicional_custeio - Abase;
  end
  else if (ind_desoneracao > 0) and (aliq_icm > 0) then
  begin
    FdadosDeson.percentual_adicional_custeio := aliq_icm - ((1 - (perc_red_prod / 100)) * aliq_icm);
    FdadosDeson.percentual_adicional_custeio := IfThen(FdadosDeson.percentual_adicional_custeio > 0, FdadosDeson.percentual_adicional_custeio, aliq_icm);
    FdadosDeson.valor_adicional_custeio      := RoundTo(Abase / (1 - (FdadosDeson.percentual_adicional_custeio / 100)), -2);
    FdadosDeson.valor_adicional_custeio      := FdadosDeson.valor_adicional_custeio - Abase;
  end;
  FdadosDeson.valor_adicional_custeio        := RoundTo(FdadosDeson.valor_adicional_custeio, -2);

  Self.valor_total     := Self.valor_total + FdadosDeson.valor_adicional_custeio;
  Self.valor_unitario  := Self.valor_total / Self.quantidade;
  Self.perc_desconto   := Self.rateio_desconto / Self.valor_total * 100;
end;

destructor THw_notafiscal_item_class.Destroy;
begin
  FreeAndNil(FdadosDeson);
  conf_bcnf.Free;

  if Assigned(FtributosRTC) then
    FreeAndNil(FtributosRTC);

  if Assigned(tribIcms) then
    FreeAndNil(tribIcms);

  inherited;
end;

function THw_notafiscal_item_class.ExecutarAjusteMVA(mvaValue, aliqInterValue,
  aliqIntraValue: Double): Double;
begin
  if (aliqIntraValue <= aliqInterValue) or (mvaValue <= 0) or (aliqInterValue <= 0) or (aliqIntraValue <= 0) then
    Result := mvaValue
  else if ((FOwnerNF.natureza_nf = 'E') and (FOwnerNF.cliente.regime = reg_sn)) or
          ((FOwnerNF.natureza_nf = 'S') and (vDadosIni.vEmp.vRegime = reg_sn)) then
    Result := mvaValue
  else
    Result := (( (1 + (mvaValue / 100)) * ((1 - (aliqInterValue / 100)) / (1 - (aliqIntraValue / 100))) ) - 1 ) * 100;
end;

function THw_notafiscal_item_class.get_cfop(Acfop: Double): Double;
var
  Astr: string;
begin
  if FOwnerNF.natureza_nf = 'E' then
  begin
    Astr := Copy(FloatToStr(Acfop), 1, 1);
    if vDadosIni.strIn(Astr, ['1', '5', '6']) then
      Astr := IfThen(FOwnerNF.nfe_iddest <> '1', '2', '1');
  end
  else
  begin
    if FOwnerNF.dest_uf = 'EX' then
      Astr := IfThen(FOwnerNF.nfe_iddest = '3', '7') +
              IfThen(FOwnerNF.nfe_iddest = '2', '6') +
              IfThen(FOwnerNF.nfe_iddest = '1', '5')
    else
      Astr := IfThen(FOwnerNF.nfe_iddest <> '1', '6', '5');
  end;
  Result := StrToFloatDef(Astr + vDadosIni.StrZero(Copy(FloatToStr(Acfop), 2, 3), 3), 0);
end;

function THw_notafiscal_item_class.get_csosn_ajutstado_por_cst: string;
var
  Acsosn, Acst, Aorig, Adig: string;
  I: Integer;
begin
  Aorig := Copy(cst, 1, 1);
  Acst  := Copy(cst, 2, 2);

  Acsosn := '';
  for I := 0 to Pred(FOwnerNF.conf_nf.Conf_ICMS.prod_cad_relacao_cst_csosn.Count) do
  begin
    if Acst = vDadosIni.getValue(FOwnerNF.conf_nf.Conf_ICMS.prod_cad_relacao_cst_csosn[I], 1) then //por padrao vai utilizar o primeiro Acsosn que encontrar
      Acsosn := Copy( FOwnerNF.conf_nf.Conf_ICMS.prod_cad_relacao_cst_csosn[I], 4, Length(FOwnerNF.conf_nf.Conf_ICMS.prod_cad_relacao_cst_csosn[I]));
    if Acsosn <> '' then
    begin
      if (Trim(csosn) <> '') and (Pos('|' + csosn + '|',  Acsosn) > 0) then
        Acsosn := csosn
      else
        Acsosn := vDadosIni.getValue(Acsosn, 1);
      Break;
    end;
  end;

  if not vDadosIni.strIn(Acsosn, ['101', '102', '103', '201', '202', '203', '300', '400', '500', '900']) then
    Acsosn := '';

  try
    if Acsosn = '' then // caso nao tenha configuracao o padrao é este abaixo
    begin
      Adig   := IfThen(Acst[1] in ['0', '2', '1', '7'], IfThen(FOwnerNF.nfe_indiedest = 1, '1', '2'));
      Acsosn := IfThen(Acst[1] in ['0', '2'], '10' ) +
                IfThen(Acst[1] in ['1', '7'], '20' ) +
                IfThen(Acst = '30'          , '203') +
                IfThen(Acst = '40'          , '103') +
                IfThen(Acst = '41'          , IfThen(vDadosIni.vUsarCSOSN300Para041 = 'S', '300', '400')) +
                IfThen(Acst = '50'          , '103') +
                IfThen(Acst = '51'          , '900') +
                IfThen(Acst = '60'          , '500') +
                IfThen(Acst = '90'          , '900') +
                Adig;
    end;
    { Não vai mais ajustar quando contribuinte, pois a contabilidade da Bellanona é muito chata, a conf global prod_cad_relacao_cst_csosn é a regra que vai prevalecer
    else if ((FOwnerNF.emissao_propria = 'S') and (FOwnerNF.devolucao <> 'SIM')) then
      if vDadosIni.strIn(Acsosn, ['101', '102', '201', '202']) then
        Acsosn := Copy(Acsosn, 1, 2) + IfThen(FOwnerNF.nfe_indiedest = 1, '1', '2');
    }
  finally
    Result := Acsosn;
  end;
end;

function THw_notafiscal_item_class.get_cst_ajutstado_por_csosn: string;
var
  Aorig, Acst: string;
begin
  Aorig := copy(Trim(cst), 1, 1);

  if vDadosIni.strIn(csosn, ['101', '102']) then
    Acst := '00'
  else if vDadosIni.strIn(csosn, ['103']) then
    Acst := '40'
  else if vDadosIni.strIn(csosn, ['201', '202']) then
    Acst := '10'
  else if vDadosIni.strIn(csosn, ['203']) then
    Acst := '30'
  else if vDadosIni.strIn(csosn, ['300', '400']) then
    Acst := '41'
  else if vDadosIni.strIn(csosn, ['500']) then
    Acst := '60'
  else if vDadosIni.strIn(csosn, ['900']) then
    Acst := '90';

  Result := Aorig + Acst;;
end;

function THw_notafiscal_item_class.get_desoneracao: THw_desoneracao_class;
var
  I: Integer;
begin
  Result := nil;
  if FOwnerNF.crt = '1' then
    Exit;

  for I := 0 to Pred(FOwnerNF.cad_deson.Count) do
    if (FOwnerNF.cad_deson.Items[I].ncm = ncm) and (Pos(Copy(cst, 2, 2) + '|', FOwnerNF.cad_deson.Items[I].csts) > 0) then
    begin
      Result := FOwnerNF.cad_deson.Items[I];
      Break;
    end;
end;

function THw_notafiscal_item_class.get_itemFiscal: TItemFiscal;
begin

  // Sempre que alterar esse metodo alterar também o OpFiscal.GetItemFiscal

  conf_bcnf.Text          := FOwnerNF.conf_bc.Text;
  itemFiscal.tipoCalc     := TTipoCalculo(tipo_calc);
  itemFiscal.modeloDoc    := FOwnerNF.modelo_nf;
  itemFiscal.indiedest    := IntToStr(FOwnerNF.nfe_indiedest);
  itemFiscal.iddest       := FOwnerNF.nfe_iddest;
  itemFiscal.e_s          := FOwnerNF.natureza_nf;
  itemFiscal.dest_uf      := FOwnerNF.dest_uf;
  itemFiscal.consumofinal := FOwnerNF.consumidor_final;
  itemFiscal.destCalcST   := (FOwnerNF.natureza_nf = 'E') or (FOwnerNF.cliente.calcular_st_nf_saida <> 'N');
  itemFiscal.regimeCli    := FOwnerNF.cliente.regime;
  itemFiscal.conf_bcnf    := conf_bcnf;
  itemFiscal.simples      := vDadosIni.vEmp.vRegime = 'SIMPLES';
  itemFiscal.orig         := IfThen(cst <> '', Copy(cst, 1, 1), '0');
  itemFiscal.modbcST      := IntToStr(modbcst);
  itemFiscal.cprodanp     := comb_cprodanp;

  itemFiscal.valor        := RoundTo(IfThen(Self.valor_total > 0, Self.valor_total, Self.valor_unitario * Self.quantidade), -2);
  itemFiscal.desconto     := rateio_desconto;
  itemFiscal.frete        := IfThen((FOwnerNF.frete_f_nfe <> 'S') and (FOwnerNF.freteconta_tr <> '9'), rateio_frete);
  itemFiscal.seguro       := rateio_seguro;
  itemFiscal.outras       := rateio_outdesp;
  itemFiscal.custo        := IfThen(tipo_item = 'V', preco_compra_veiculo, prec_cusm_prod);
  itemFiscal.quantidade   := quantidade;

  itemFiscal.idenItem := Format('Num %d: %s', [nitem, descricao_item]);

  Result := itemFiscal;

  // Sempre que alterar esse metodo alterar também o OpFiscal.GetItemFiscal

  //Result := OpFiscal.GetItemFiscal();
end;

function THw_notafiscal_item_class.frete_strto_operacao_frete: NF_operacaoFrete;
begin
  if (FOwnerNF.freteconta_tr = '0') then
    Result := nf_op_fr_conta_terc
  else if (FOwnerNF.freteconta_tr = '1') then
    Result := nf_op_fr_conta_emit
  else if (FOwnerNF.freteconta_tr = '2') then
    Result := nf_op_fr_conta_dest
  else if (FOwnerNF.freteconta_tr = '9') then
    Result := nf_op_fr_sem_frete
  else
    Result := nf_op_fr_nenhum;
end;

function THw_notafiscal_item_class.frete_usar_na_base_icms: Boolean;
begin
  Result := False;
  if (FOwnerNF.frete_f_nfe = 'S') then
    Exit;

  if (FOwnerNF.natureza_nf = 'E') and (FOwnerNF.frete_base_icm = 'S') then
  begin
    Result := True;
    Exit;
  end;

  case frete_strto_operacao_frete of
    nf_op_fr_conta_terc : Result := FOwnerNF.conf_nf.Conf_Frete.Entra_base_icm_quando_conta_terceiros;
    nf_op_fr_conta_emit : Result := FOwnerNF.conf_nf.Conf_Frete.Entra_base_icm_quando_conta_emitente;
    nf_op_fr_conta_dest : Result := FOwnerNF.conf_nf.Conf_Frete.Entra_base_icm_quando_conta_destinatario;
    nf_op_fr_sem_frete  : Exit;
  end;
end;

function THw_notafiscal_item_class.get_reducao: Double;
var
  I: Integer;
  Adentro, Aisento: Integer;
begin
  Result := -1;

  Adentro := IfThen(FOwnerNF.nfe_iddest = '1', 1);
  Aisento := IfThen(vDadosIni.strIn(FOwnerNF.insc_est, ['', 'isento']), 1);
  for I := 0 to Pred(FOwnerNF.cad_redu.Count) do
    if (FOwnerNF.cad_redu.Items[I].grupo_prod = grupo_prod) and
      (Trim(FOwnerNF.cad_redu.Items[I].cod_prod) = Trim(cod_prod)) and
      (FOwnerNF.cad_redu.Items[I].dentro_est = Adentro) and
      (FOwnerNF.cad_redu.Items[I].isento = Aisento) and
      (FOwnerNF.cad_redu.Items[I].aliquota = aliq_icm) then
    begin
      Result := FOwnerNF.cad_redu.Items[I].percentual;
      Break;
    end;

  if (Result = -1) and (Assigned(Fmerc)) then
    Result := Fmerc.perc_red_prod;

  if Result < 0 then
    Result := 0;

  if (Result > 0) and (vDadosIni.vEmp.vUsarReducaoInvertida = 'S') then
    Result := 100 - Result;
end;

function THw_notafiscal_item_class.get_tributacao_adicional: THw_prod_trib_ad_class;
var
  I, AfinalIdInt: Integer;
  Acontribuinte, APessoa, AconsFinal, AfinalidadeId: array[1..2] of string;
begin
  Result := nil;

  Acontribuinte[1] := 'Ambos';
  Acontribuinte[2] := IfThen(MatchText(FOwnerNF.insc_est, ['', 'ISENTO']), 'Nao', IfThen(FOwnerNF.nfe_indiedest = 1, 'Sim', 'Nao'));

  APessoa[1] := 'Ambos';
  APessoa[2] := IfThen(Length(Trim(FOwnerNF.cpfcgc)) = 14, 'PJ', 'PF');

  AconsFinal[1] := 'Ambos';
  AconsFinal[2] := IfThen(FOwnerNF.consumidor_final = 'S', 'Sim', 'Nao');

  AfinalIdInt := FOwnerNF.finalidadeid;

  for I := 0 to Pred(FOwnerNF.cad_trib.Count) do
    if (FOwnerNF.cad_trib.Items[I].grupo_prod = grupo_prod) and
      (Trim(FOwnerNF.cad_trib.Items[I].cod_prod) = Trim(cod_prod)) and
      (Pos(FOwnerNF.dest_uf + '|', FOwnerNF.cad_trib.Items[I].sigla_uf) > 0) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].contribuinte, Acontribuinte)) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].pessoa, APessoa)) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].consumidor_final, AconsFinal)) and
      (FOwnerNF.cad_trib.Items[I].finalidadeid = AfinalIdInt) then
    begin
      Result := FOwnerNF.cad_trib.Items[I];
      Break;
    end;

  if (Result <> nil) or (AfinalIdInt = 0) then
    Exit;

  for I := 0 to Pred(FOwnerNF.cad_trib.Count) do
    if (FOwnerNF.cad_trib.Items[I].grupo_prod = grupo_prod) and
      (Trim(FOwnerNF.cad_trib.Items[I].cod_prod) = Trim(cod_prod)) and
      (Pos(FOwnerNF.dest_uf + '|', FOwnerNF.cad_trib.Items[I].sigla_uf) > 0) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].contribuinte, Acontribuinte)) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].pessoa, APessoa)) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].consumidor_final, AconsFinal)) and
      (FOwnerNF.cad_trib.Items[I].finalidadeid = 0) then
    begin
      Result := FOwnerNF.cad_trib.Items[I];
      Break;
    end;                                          
end;

function THw_notafiscal_item_class.get_tributacao_adicional_cliente: THw_prod_trib_ad_class;
var
  I, AfinalIdInt: Integer;
  Acontribuinte, APessoa, AconsFinal, AfinalidadeId: array[1..2] of string;
begin
  Result := nil;

  Acontribuinte[1] := 'Ambos';
  Acontribuinte[2] := IfThen(MatchText(FOwnerNF.insc_est, ['', 'ISENTO']), 'Nao', IfThen(FOwnerNF.nfe_indiedest = 1, 'Sim', 'Nao'));

  APessoa[1] := 'Ambos';
  APessoa[2] := IfThen(Length(Trim(FOwnerNF.cpfcgc)) = 14, 'PJ', 'PF');

  AconsFinal[1] := 'Ambos';
  AconsFinal[2] := IfThen(FOwnerNF.consumidor_final = 'S', 'Sim', 'Nao');

  AfinalIdInt := FOwnerNF.finalidadeid;

  for I := 0 to Pred(FOwnerNF.cad_trib.Count) do
    if (FOwnerNF.cad_trib.Items[I].grupo_prod = grupo_prod) and
      (Trim(FOwnerNF.cad_trib.Items[I].cod_prod) = Trim(cod_prod)) and
      (FOwnerNF.cod_cliente = FOwnerNF.cad_trib.Items[I].cod_cliente) and
      (FOwnerNF.dest_seqid = FOwnerNF.cad_trib.Items[I].dest_seqid) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].contribuinte, Acontribuinte)) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].pessoa, APessoa)) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].consumidor_final, AconsFinal)) and
      (FOwnerNF.cad_trib.Items[I].finalidadeid = AfinalIdInt) then
    begin
      Result := FOwnerNF.cad_trib.Items[I];
      Break;
    end;

  if (Result <> nil) or (AfinalIdInt = 0) then
    Exit;

  for I := 0 to Pred(FOwnerNF.cad_trib.Count) do
    if (FOwnerNF.cad_trib.Items[I].grupo_prod = grupo_prod) and
      (Trim(FOwnerNF.cad_trib.Items[I].cod_prod) = Trim(cod_prod)) and
      (FOwnerNF.cod_cliente = FOwnerNF.cad_trib.Items[I].cod_cliente) and
      (FOwnerNF.dest_seqid = FOwnerNF.cad_trib.Items[I].dest_seqid) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].contribuinte, Acontribuinte)) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].pessoa, APessoa)) and
      (vDadosIni.strIn(FOwnerNF.cad_trib.Items[I].consumidor_final, AconsFinal)) and
      (FOwnerNF.cad_trib.Items[I].finalidadeid = 0) then
    begin
      Result := FOwnerNF.cad_trib.Items[I];
      Break;
    end;
end;

procedure THw_notafiscal_item_class.HandleItemTribCreate;
begin
  if Assigned(itemTrib) then
    Exit;

  itemTrib           := TItemTributos.Create;
  itemTrib.icms      := TItemTributo_ICMS.Create();
  itemTrib.piscofins := TItemTributo_PC.Create();
  itemTrib.retTrib   := TItemTributo_Ret.Create();
  itemTrib.ipi       := TItemTributo_IPI.Create();
  itemTrib.iss       := TItemTributo_ISSQN.Create();
end;

function THw_notafiscal_item_class.isMercHandleable: Boolean;
begin
  if not Assigned(Fmerc) then
  begin
    Fmerc := FOwnerNF.cad_merc.GetProduto(grupo_prod, cod_prod);
    Result := Assigned(Fmerc);
  end
  else if (Fmerc.grupo_prod <> grupo_prod) or (Fmerc.cod_prod <> cod_prod) then
  begin
    Fmerc := FOwnerNF.cad_merc.GetProduto(grupo_prod, cod_prod);
    Result := Assigned(Fmerc);
  end
  else
    Result := True;
end;

function THw_notafiscal_item_class.obter_dados_cadastro: Boolean;
var
  Acodbarra : TCod_barra_class;
begin
  Result := False;
  if tipo_item <> 'P' then
    Exit;

  if not Assigned(Fmerc) then
    Fmerc := FOwnerNF.cad_merc.GetProduto(grupo_prod, cod_prod)
  else if (Fmerc.grupo_prod <> grupo_prod) or (Fmerc.cod_prod <> cod_prod) then
    Fmerc := FOwnerNF.cad_merc.GetProduto(grupo_prod, cod_prod);

  prctb_item        := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_prod);
  prctb_itema       := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_proda);
  prctb_item3       := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_prod3);
  prctb_item6       := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_prod6);
  prctb_item9       := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_prod9);
  {
  prctb_item3       := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (not FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_tb_prod3);
  prctb_item6       := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (not FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_tb_prod6);
  prctb_item9       := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (not FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_tb_prod9);
  perc_ad_30        := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_ad_30);
  perc_ad_60        := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_ad_60);
  perc_ad_90        := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_ad_90);
  }                                                                                                                              
  ecf               := Fmerc.ecf;
  peso_b            := Fmerc.peso_brut_prod;
  peso_l            := Fmerc.peso_liq_prod;
  consumo           := Fmerc.consumo;
  utrib             := Fmerc.nfe_utrib;
  qtrib             := Fmerc.nfe_qtrib;
  ncm               := IfThen(((FOwnerNF.natureza_nf = 'S') and (FOwnerNF.tipo_emissao = '1')) or (ncm  = ''), Fmerc.nbm , ncm);
  cest              := IfThen(((FOwnerNF.natureza_nf = 'S') and (FOwnerNF.tipo_emissao = '1')) or (cest = ''), Fmerc.cest, cest);
  permitir_desconto := 'S';
  if (FOwnerNF.natureza_nf = 'S') and (FOwnerNF.devolucao <> 'SIM') then
    permitir_desconto := Fmerc.permitir_desconto;
        
  if (FOwnerNF.natureza_nf = 'S') then
  begin
    if (cean = '') and (vDadosIni.ValidaEAN(TGS1Prefix.GetEanValido(num_fab_prod, FOwnerNF.conf_nf.Conf_Geral.prod_ean_prefixos_invalidos))) then
      cean := num_fab_prod
    else if (cean = '') then
    begin
      Acodbarra := FOwnerNF.cad_cbarra.GetEAN(grupo_prod, cod_prod, FOwnerNF.conf_nf.Conf_Geral.prod_ean_prefixos_invalidos);
      if Assigned(Acodbarra) then
        cean := Acodbarra.cod_barra;
    end;

    nfe_indescala       := Fmerc.nfe_indescala;
    nfe_cnpjfab         := Fmerc.nfe_cnpjfab;

    if (TTipoCalculo(tipo_calc) <> tcNenhum) then
    begin
      ant_pst             := Fmerc.ant_pst;
      ant_vicmssubstituto := Fmerc.ant_vicmssubstituto;
      fcp_vbcfcpstret     := Fmerc.fcp_vbcfcpstret;
      fcp_pfcpstret       := Fmerc.fcp_pfcpstret;
      fcp_vfcpstret       := Fmerc.fcp_vfcpstret;
      base_icmant_sub     := Fmerc.baseicmant_sub;

      if (Fmerc.vicmsmonoret > 0) and (Fmerc.adremicmsret > 0) then
      begin
        qbcmonoret        := IfThen(qbcmonoret > 0, qbcmonoret, quantidade);
        vicmsmonoret      := Fmerc.vicmsmonoret * qbcmonoret;
        adremicmsret      := Fmerc.adremicmsret;
      end
      else
      begin
        qbcmonoret        := 0;
        vicmsmonoret      := 0;
        adremicmsret      := 0;
      end;
    end;
  end;
end;

function THw_notafiscal_item_class.obter_dados_prod(Amerc: TProdutos_class): Boolean;
begin
  Result := False;

  if Assigned(Amerc) then
    Fmerc := Amerc;

  tipo_item         := 'P';
  grupo_prod        := Fmerc.grupo_prod;
  cod_prod          := Fmerc.cod_prod;
  descricao_item    := Fmerc.descr_prod;
  ncm               := IfThen(ncm = '', Fmerc.nbm, ncm);
  cst               := Fmerc.cst_prod;
  referencia        := Fmerc.unidade;
  num_fab_prod      := Fmerc.num_fab_prod;
  aliq_ipi          := Fmerc.ipi_prod;
  ecf               := Fmerc.ecf;
  prctb_item        := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_prod);
  prctb_itema       := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_proda);
  prctb_item3       := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_prod3);
  prctb_item6       := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_prod6);
  prctb_item9       := IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, Fmerc.perc_tb_prod9);
  {
  prctb_item3       := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (not FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_tb_prod3);
  prctb_item6       := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (not FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_tb_prod6);
  prctb_item9       := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (not FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_tb_prod9);
  perc_ad_30        := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_ad_30);
  perc_ad_60        := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_ad_60);
  perc_ad_90        := IfThen(FOwnerNF.conf_nf.Conf_Preco.AlteraPrecoNaEntrada and (FOwnerNF.conf_nf.Conf_Preco.UsarPerc30ParaVarejo), Fmerc.perc_ad_90);
  }
  qtdemb            := Fmerc.qtdemb;
  codigo_nop        := Fmerc.codigo_nop;

  peso_b            := Fmerc.peso_brut_prod;
  peso_l            := Fmerc.peso_liq_prod;
  consumo           := Fmerc.consumo;
  //prec_cus_cnt    := Fmerc.prec_cus_prod;
  prec_cusm_prod    := Fmerc.prec_cusm_prod;
  nfe_indescala     := Fmerc.nfe_indescala;
  nfe_cnpjfab       := Fmerc.nfe_cnpjfab;
  utrib             := Fmerc.nfe_utrib;
  qtrib             := Fmerc.nfe_qtrib;
  ecf               := Fmerc.ecf;
  nfci              := Fmerc.nfci;
  nfe_nrecopi       := Fmerc.nfe_nrecopi;
  cenq_ipi_nfe      := Fmerc.cenq_ipi_nfe;
  cest              := Fmerc.cest;
  comb_cprodanp     := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Fmerc.comb_cprodanp);
  comb_codif        := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Fmerc.comb_codif);
  comb_pmixgn       := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Fmerc.comb_pmixgn);
  comb_descanp      := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Fmerc.comb_descanp);
  comb_pglp         := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Fmerc.comb_pglp);
  comb_pgnn         := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Fmerc.comb_pgnn);
  comb_pgni         := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Fmerc.comb_pgni);
  comb_vpart        := IfThen(vDadosIni.vEmp.vCombProduto = 'S', Fmerc.comb_vpart);
  permitir_desconto := IfThen((FOwnerNF.natureza_nf = 'S') or (FOwnerNF.devolucao <> 'SIM'), Fmerc.permitir_desconto, 'S');

end;

function THw_notafiscal_item_class.obter_dados_geral: Boolean;
var
  Ancm_dest: TNbm_estado_class;
  Ancm_loc : TNbm_class;
begin
  Result := False;

  opf_icms_id := IfThen(TTipoCalculo(tipo_calc       ) = tcCompleto, opf_icms_id);
  opf_pc_id   := IfThen(TTipoCalculo(tipo_calc_pc    ) = tcCompleto, opf_pc_id);
  opf_ret_id  := IfThen(TTipoCalculo(tipo_calc_retfed) = tcCompleto, opf_ret_id);

  // metodo usado para operacao de saida quando nao é devolução

  Ancm_loc := FOwnerNF.cad_ncm_loc.get_ncm(ncm);
  if Assigned(Ancm_loc) then
  begin
    nve     := Ancm_loc.nve;
    nat_rec := IfThen(nat_rec = '', Ancm_loc.nat_rec, nat_rec);
  end;

  {$REGION 'indTot = 0, nao totalizar no total da nota e impostos'}
  if indtot = 0 then
  begin
    aliq_ipi          := 0;
    base_ipi          := 0;
    valor_ipi         := 0;
    perc_red_ipi      := 0;
    aliq_icm_simples  := 0;
    base_icm_simples  := 0;
    valor_icm_simples := 0;
    aliq_icm          := 0;
    base_icm          := 0;
    valor_icm         := 0;
    vlisento          := 0;
    vln_trib          := 0;
    vloutras          := valor_total;
    aliq_icmsub       := 0;
    base_icmsub       := 0;
    valor_icmsub      := 0;
    valor_icm_stdes   := 0;
    perc_red_prod_sub := 0;
    mva               := 0;
    picmsufdest       := 0;
    picmsinter        := 0;
    picmsinterpart    := 0;
    pfcpufdest        := 0;
    vicmsufremet      := 0;
    vicmsufdest       := 0;
    fcp_vbcfcpufdest  := 0;
    fcp_pfcp          := 0;
    fcp_vfcp          := 0;
    fcp_vbcfcp        := 0;
    fcp_vbcfcpst      := 0;
    fcp_pfcpst        := 0;
    fcp_vfcpst        := 0;
    fcp_pst           := 0;
    fcp_vbcfcpstret   := 0;
    fcp_pfcpstret     := 0;
    fcp_vfcpstret     := 0;
    predbcefet        := 0;
    picmsefet         := 0;
    vbcefet           := 0;
    vicmsefet         := 0;
    vicmsmonoret      := 0;
    adremicmsret      := 0;
    vbcretfed         := 0;
    pretir            := 0;
    pretcsll          := 0;
    pretpis           := 0;
    pretcofins        := 0;
    vretir            := 0;
    vretcsll          := 0;
    vretpis           := 0;
    vretcofins        := 0;

    Exit;
  end;
  {$ENDREGION}

  if TTipoCalculo(tipo_calc) = tcParcial then
  begin
    itemTrib           := TItemTributos.Create;
    itemTrib.icms      := TItemTributo_ICMS.Create();
    itemTrib.piscofins := TItemTributo_PC.Create();
    itemTrib.retTrib   := TItemTributo_Ret.Create();
    itemTrib.ipi       := TItemTributo_IPI.Create();
    itemTrib.iss       := TItemTributo_ISSQN.Create();
  end;

  obter_dados_cadastro;

  if TTipoCalculo(tipo_calc) = tcCompleto then
  begin

    {$REGION 'dados condicao opfiscal'}
    condFiscal.cidadeIbgeDest := FOwnerNF.dest_cmun;
    condFiscal.indIEDest      := IntToStr(FOwnerNF.nfe_indiedest);
    condFiscal.consumoFinal   := FOwnerNF.consumidor_final;
    condFiscal.finalidadeId   := FOwnerNF.finalidadeid;
    condFiscal.ufDest         := FOwnerNF.uf_operacao;
    condFiscal.pessoa         := IfThen(Length(FOwnerNF.cpfcgc) = 14, 'PJ', 'PF');
    condFiscal.ncm            := ncm;
    condFiscal.tipoNF         := TTipoNotaFiscal(IfThen(tipo_item = 'S', 1) +
                                                 IfThen(tipo_item + tipo_venda_veiculo = 'VN', 2) +
                                                 IfThen(tipo_item + tipo_venda_veiculo = 'VU', 3) +
                                                 IfThen(tipo_item = 'O', 4) +
                                                 IfThen(tipo_item = 'D', 5));
    {$ENDREGION}

    {$REGION 'dados fcp'}
    if (FOwnerNF.natureza_nf = 'S') then
    begin
      if FOwnerNF.conf_nf.Conf_FCP.CalcularFCP then
      begin
        if FOwnerNF.conf_nf.Conf_FCP.UsarFCPdoEstado then
          fcp_pfcp := FOwnerNF.dados_uf.pfcp;

        if FOwnerNF.conf_nf.Conf_FCP.UsarFCPdoNCM then
        begin

          if Assigned(Ancm_loc) then
            fcp_pfcp := Ancm_loc.fcp_aliq;
        end;
        fcp_pfcpst := fcp_pfcp;
      end;
    end;
    {$ENDREGION}

    {$REGION 'obtendo operacao fiscal'}
    condFiscal.ncm           := ncm;
    if tipo_item = 'P' then
    begin
      condFiscal.icm_cst       := Copy(Fmerc.cst_prod, 2, 2);
      condFiscal.tipoItem      := Fmerc.tipo_item;
      condFiscal.piscofins_cst := IfThen(FOwnerNF.natureza_nf = 'S', Fmerc.cst_pis) + IfThen(FOwnerNF.natureza_nf = 'E', Fmerc.cst_pis_ent);
    end;
    itemTrib                        := FOwnerNF.cad_opfiscal.GetOperacao(condFiscal.ncm, condFiscal.tipoItem, condFiscal.icm_cst, condFiscal.piscofins_cst);
    itemTrib.piscofins.piscofins_id := IfThen(TTipoCalculo(tipo_calc_pc) = tcCompleto, itemTrib.piscofins.piscofins_id);
    {$ENDREGION}

    obter_dados_saida_prod;
    obter_dados_saida_serv;
    obter_dados_saida_veic;
    obter_dados_saida_outr;

    if TTipoCalculo(tipo_calc_pc) = tcCompleto then
      obter_dados_piscofins;

    {$REGION 'obtendo dados para calculo do icms interestadual de partilha'}
    if MatchText(tipo_item, ['P', 'O']) and (FOwnerNF.nfe_iddest = '2') and (operacao_interestadual_com_partilha_icms) then
    begin
      Ancm_dest := FOwnerNF.cad_ncm_dest.get_ncm_estado(ncm); // tabela nbm_estado, ninguem deve usar isso, passivel de remocao
      if Assigned(Ancm_dest) then
      begin
        pfcpufdest  := Ancm_dest.pfcp;
        picmsufdest := Ancm_dest.aliq;
      end
      else//caso nao tenha definido nada no estado de destino usa o padrao da tabela estados
      begin
        pfcpufdest  := FOwnerNF.dados_uf.pfcp;
        picmsufdest := FOwnerNF.dados_uf.aliq_intra;
      end;
      picmsinter     := IfThen(Copy(cst, 1, 1)[1] in ['1', '2', '3'], 4, FOwnerNF.dados_uf.icm_ext_c);
      picmsinterpart := IfThen(FOwnerNF.data_contabil > StrToDate('01/01/2019'), 100, 80);
    end;
    {$ENDREGION}

  end
  else if TTipoCalculo(tipo_calc_pc) = tcCompleto then
  begin

    {$REGION 'obtendo operacao fiscal'}
    condFiscal.ncm           := ncm;
    if tipo_item = 'P' then
    begin
      condFiscal.icm_cst       := Copy(Fmerc.cst_prod, 2, 2);
      condFiscal.tipoItem      := Fmerc.tipo_item;
      condFiscal.piscofins_cst := IfThen(FOwnerNF.natureza_nf = 'S', Fmerc.cst_pis) + IfThen(FOwnerNF.natureza_nf = 'E', Fmerc.cst_pis_ent);
    end;
    itemTrib                   := FOwnerNF.cad_opfiscal.GetOperacao(condFiscal.ncm, condFiscal.tipoItem, condFiscal.icm_cst, condFiscal.piscofins_cst);
    itemTrib.icms.icms_id      := 0;
    {$ENDREGION}

    obter_dados_piscofins;

  end;


  {$REGION 'dados do item opfiscal'}
  itemFiscal := get_itemFiscal;
  {$ENDREGION}

end;

function THw_notafiscal_item_class.obter_dados_saida_outr: Boolean;
begin
  Result := False;

  if tipo_item <> 'O' then
    Exit;

  itemTrib := OpFiscal.GetOperacao(condFiscal, vDadosIni.cod_empresa, TConexao(FOwnerNF.con));
end;

function THw_notafiscal_item_class.obter_dados_piscofins: Boolean;
var                
  Aconf_ad: THw_conf_piscofins_ad_class;
  Anat_op : TNat_op_class;
  cst_merc: string;
begin

  if itemTrib.piscofins.piscofins_id > 0 then
    Exit;

  if tipo_item = 'P' then
  begin
    //    cst_pis           := itemTrib.piscofins.cst;
    //    aliq_pis          := IfThen(cst_pis <> '03', itemTrib.piscofins.aliq_pis);
    //    aliq_cofins       := IfThen(cst_pis <> '03', itemTrib.piscofins.aliq_cofins);
    //    aliq_pis_quant    := IfThen(cst_pis  = '03', itemTrib.piscofins.aliq_pis);
    //    aliq_cofins_quant := IfThen(cst_pis  = '03', itemTrib.piscofins.aliq_cofins);
    //    motdes_pc         := StrToIntDef(itemTrib.piscofins.motdespc, 0);

    cst_merc   := IfThen(FOwnerNF.natureza_nf = 'S', Fmerc.cst_pis, Fmerc.cst_pis_ent);
    cst_pis    := IfThen(cst_merc <> '', cst_merc, IfThen(FOwnerNF.natureza_nf = 'S', '01', '50'));
    cst_cofins := cst_pis;
    nat_rec    := IfThen((not MatchStr(cst_pis, ['01', '02', '03', '05'])) and (not MatchStr(Copy(cst_pis, 1, 1), ['5', '6'])), Fmerc.nat_rec);

    if MatchStr(cst_pis, ['02', '03', '05']) then
    begin
      aliq_pis          := IfThen(cst_pis <> '03', Fmerc.aliq_pis_diferenciada);
      aliq_cofins       := IfThen(cst_pis <> '03', Fmerc.aliq_cofins_diferenciada);
      aliq_pis_quant    := IfThen(cst_pis =  '03', Fmerc.aliq_pis_diferenciada);
      aliq_cofins_quant := IfThen(cst_pis =  '03', Fmerc.aliq_cofins_diferenciada);
      aliq_pis_st    := 0;
      aliq_cofins_st := 0;
    end
    else if MatchStr(Copy(cst_pis, 1, 1), ['5', '6']) then
    begin
      aliq_pis          := IfThen(Fmerc.aliq_cred_pis > 0, Fmerc.aliq_cred_pis, vDadosIni.vEmp.vAliqPIS);
      aliq_cofins       := IfThen(Fmerc.aliq_cred_cofins > 0, Fmerc.aliq_cred_cofins, vDadosIni.vEmp.vAliqCOFINS);
      aliq_pis_quant    := 0;
      aliq_cofins_quant := 0;
      aliq_pis_st    := 0;
      aliq_cofins_st := 0;
    end
    else
    begin
      aliq_pis          := IfThen((cst_pis = '01') or MatchStr(Copy(cst_pis, 1, 1), ['5', '6']), vDadosIni.vEmp.vAliqPIS);
      aliq_cofins       := IfThen((cst_pis = '01') or MatchStr(Copy(cst_pis, 1, 1), ['5', '6']), vDadosIni.vEmp.vAliqCOFINS);
      aliq_pis_quant    := 0;
      aliq_cofins_quant := 0;  
      aliq_pis_st    := 0;
      aliq_cofins_st := 0;
    end;
  end
  else if tipo_item = 'V' then
  begin
    if tipo_venda_veiculo = 'VU' then
    begin
      cst_pis     := IfThen(FOwnerNF.natureza_nf = 'S', '01', '50');
      cst_cofins  := cst_pis;
      aliq_pis    := IfThen((cst_pis = '01') or MatchStr(Copy(cst_pis, 1, 1), ['5', '6']), vDadosIni.vEmp.vAliqPIS);
      aliq_cofins := IfThen((cst_pis = '01') or MatchStr(Copy(cst_pis, 1, 1), ['5', '6']), vDadosIni.vEmp.vAliqCOFINS);
      aliq_pis_st    := 0;
      aliq_cofins_st := 0;
    end
    else
    begin
      cst_pis        := IfThen(FOwnerNF.natureza_nf = 'S', '05', '75');
      cst_cofins     := cst_pis;
      aliq_pis_st    := IfThen(cst_pis = '75', 0.65);
      aliq_cofins_st := IfThen(cst_pis = '75', 3.00);
    //falta pegar a aliquota correta do cadastro de ncm
    end;
  end
  else
  begin
    cst_pis           := IfThen(FOwnerNF.natureza_nf = 'S', '01', '50');
    cst_cofins        := cst_pis;
    aliq_pis          := vDadosIni.vEmp.vAliqPIS;
    aliq_cofins       := vDadosIni.vEmp.vAliqCOFINS;
    aliq_pis_quant    := 0;
    aliq_cofins_quant := 0;  
    aliq_pis_st       := 0;
    aliq_cofins_st    := 0;
  end;

  Anat_op := FOwnerNF.cad_cfop.get_nat_op(codigo_nop);
  if not Assigned(Anat_op) then
  begin
    FOwnerNF.erros.New('Item %d - CFOP %d não encontrado no cadastro', [nitem, Trunc(codigo_nop)]);
    Anat_op := TNat_op_class.Create;
    Anat_op.codigo_nop := codigo_nop;
  end;

  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
  begin
    cst_pis    := '99';
    cst_cofins := cst_pis;
  end
  else if Anat_op.devolucao_sped = 'S'  then
  begin
    //deixei como esta no Sped
    if (vDadosIni.vEmp.vRegime = 'LUCRO REAL') and (FOwnerNF.natureza_nf = 'S') then
      cst_pis := '49'
    else if (vDadosIni.vEmp.vRegime = 'LUCRO PRESUMIDO') and (FOwnerNF.natureza_nf = 'E') then
      cst_pis := '99';
    //cst_pis := IfThen(FOwnerNF.natureza_nf = 'S', '99', '49');
    cst_cofins := cst_pis;
  end;

  motdes_pc := 0;
  if (aliq_pis > 0) and (FOwnerNF.dest_nf.zfm_alc = 'S') and
     (FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'UsarCidadesConfiguradas') = 'S') and
     (NewStringList(FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'QuandoCstsPisCofinsContidoNaLista'), ',').IndexOf(cst_pis) >= 0) then
  begin
    if (FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'ConfirmarConferenciaInscricaoSuframa') = 'S') then
      motdes_pc := IfThen(MatchStr(FOwnerNF.conf_isuf, ['', 'A']), 7)
    else
      motdes_pc := 7;
    if motdes_pc > 0 then
    begin
      nat_rec    := IfThen(nat_rec <> '', nat_rec, FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'UsarNaturezaDaReceita'));
      if FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'ConverterCstPisCofinsQuandoIgual_' + cst_pis) <> '' then
        cst_pis  := FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'ConverterCstPisCofinsQuandoIgual_' + cst_pis);
      cst_cofins := cst_pis;
    end;
  end;

  if (cst_pis <> '49') then
  begin
    Aconf_ad := FOwnerNF.conf_nf.Conf_PIS.dados_ncm_cfop.get_by_ncm_cfop(ncm, Trunc(codigo_nop));
    if Assigned(Aconf_ad) then
    begin
      cst_pis           := IfThen(Aconf_ad.cst <> '', Aconf_ad.cst, cst_pis);
      cst_cofins        := cst_pis;
      nat_rec           := IfThen(Aconf_ad.nat_rec <> '', Aconf_ad.nat_rec, nat_rec);
      aliq_pis          := IfThen(cst_pis <> '03', IfThen(Aconf_ad.aliq_pis      <> '', StrToIntDef(Aconf_ad.aliq_pis     , 0), aliq_pis));
      aliq_cofins       := IfThen(cst_pis <> '03', IfThen(Aconf_ad.aliq_cofins   <> '', StrToIntDef(Aconf_ad.aliq_cofins  , 0), aliq_cofins));
      aliq_pis_quant    := IfThen(cst_pis =  '03', IfThen(Aconf_ad.aliq_r_pis    <> '', StrToIntDef(Aconf_ad.aliq_r_pis   , 0), aliq_pis_quant));
      aliq_cofins_quant := IfThen(cst_pis =  '03', IfThen(Aconf_ad.aliq_r_cofins <> '', StrToIntDef(Aconf_ad.aliq_r_cofins, 0), aliq_cofins_quant)); 
      aliq_pis_st    := 0;
      aliq_cofins_st := 0;
    end;
  end;
end;

function THw_notafiscal_item_class.obter_dados_saida_prod: Boolean;
var
  AtribAd   : THw_prod_trib_ad_class;
  Anat_op   : TNat_op_class;
  Amva_aj   : TMva_ajustada_ncm_class;
  Ancm_loc  : TNbm_class;
  Adeson    : THw_desoneracao_class;
  Acest     : TCestM;
  Aliquota  : Double;
  QuatroPerc: Boolean;
  PodeCalcularST: Boolean;
begin
  Result := False;
  if tipo_item <> 'P' then
    Exit;

  if not Assigned(Fmerc) then
    Fmerc := FOwnerNF.cad_merc.GetProduto(grupo_prod, cod_prod)
  else if (Fmerc.grupo_prod <> grupo_prod) or (Fmerc.cod_prod <> cod_prod) then
    Fmerc := FOwnerNF.cad_merc.GetProduto(grupo_prod, cod_prod);

  {$REGION 'obtendo dados para calculo de icms normal e icms st'}

  QuatroPerc := (FOwnerNF.nfe_iddest <> '1') and (vDadosIni.vEmp.vRegime <> 'SIMPLES') and (Copy(cst, 1, 1)[1] in ['1', '2', '3']);

  AtribAd := get_tributacao_adicional_cliente;
  if not Assigned(AtribAd) then
    AtribAd := get_tributacao_adicional;
  {

  condFiscal.ncm           := ncm;//Fmerc.nbm;
  condFiscal.icm_cst       := Copy(Fmerc.cst_prod, 2, 2);
  condFiscal.tipoItem      := Fmerc.tipo_item;
  condFiscal.piscofins_cst := IfThen(FOwnerNF.natureza_nf = 'S', Fmerc.cst_pis) + IfThen(FOwnerNF.natureza_nf = 'E', Fmerc.cst_pis_ent);
  itemTrib                 := FOwnerNF.cad_opfiscal.GetOperacao(condFiscal.ncm, condFiscal.tipoItem, condFiscal.icm_cst, condFiscal.piscofins_cst);

  }

  //se tem trbutacao adicional não vai usar a operação fiscal
  if Assigned(AtribAd) then
    itemTrib.icms.icms_id := 0;

  PodeCalcularST := (FOwnerNF.natureza_nf = 'E')    // entrada para calcular antecipacao
    or (
      (FOwnerNF.cliente.calcular_st_nf_saida <> 'N') //  saida so se o cliente permite e != danfe simplificado tipo 2
      and (FOwnerNF.tpimp <> Ord(fidSimplificadoTipo2))
    );

  if Assigned(AtribAd) then
  begin
    if AtribAd.reducao_cad_produto = 'S' then
      perc_red_prod   := get_reducao
    else
      perc_red_prod   := AtribAd.perc_red_prod;
    perc_red_prod_sub := perc_red_prod;

    cst               := Copy(cst, 1, 1) + AtribAd.cst_icms;
    codigo_nop        := AtribAd.codigo_nop;
    aliq_icm          := AtribAd.aliq_inter;
    aliq_icmsub       := IfThen(PodeCalcularST, AtribAd.aliq_intra);
    mva               := IfThen(PodeCalcularST, AtribAd.mva);
    picmsefet         := AtribAd.aliq_inter;
    predbcefet        := AtribAd.perc_red_prod;
    if (FOwnerNF.natureza_nf = 'S') and (FOwnerNF.conf_nf.Conf_FCP.CalcularFCP) and (FOwnerNF.conf_nf.Conf_FCP.UsarFCPTribAdProd) then
    begin
      fcp_pfcp        := AtribAd.fcp_aliq;
      fcp_pfcpst      := fcp_pfcp;
    end;
    if (AtribAd.usar_mva_anexoxv = 'S') and PodeCalcularST then
    begin
      Acest := FOwnerNF.cad_cest.GetCestV2(cest, ncm, Copy(cst, 1, 1),
                                           IfThen(FOwnerNF.natureza_nf = 'S', FOwnerNF.dest_uf, vDadosIni.vEmp.vSiglaUF),
                                           StrToIntDef(FOwnerNF.nfe_iddest, 0), Fmerc.cest_variante_id,
                                           FOwnerNF.conf_nf.Conf_ICMS.nf_icmsst_cest_v2.RamoAtividade, aliq_icm, dtmAtivo.bancoHw, vDadosIni.codEmpresa);
      if (Acest.cest = cest) and (Acest.MVAs.Count > 0) then
        if Acest.MVAs.First.mva > 0 then
        begin
          mva := Acest.MVAs.First.mva;
          if (FOwnerNF.nfe_iddest = '2') and (FOwnerNF.conf_nf.Conf_ICMS.nf_icmsst_cest_v2.AjustarMVA) and
             (AtribAd.aliq_inter > 0) and (AtribAd.aliq_intra > 0) and (AtribAd.aliq_intra > AtribAd.aliq_inter) and
             (TTipo_Variante_Cest_MVA(VarToInt(Acest.MVAs.First.Variante.tipo)) <> tvOrigem) then// Quando tipo Origem então o MVA já tem a definição da operacao interestadual ou interna
            mva := ExecutarAjusteMVA(mva, AtribAd.aliq_inter, AtribAd.aliq_intra);
        end;
    end;
    if mva = 0 then
      aliq_icmsub := 0;
    ind_desoneracao   := AtribAd.ind_desoneracao;
  end
  else if itemTrib.icms.icms_id > 0 then
  begin
//    ind_desoneracao  := StrToIntDef(itemTrib.icms.motdesicm, 0);
//    codigo_nop       := itemTrib.icms.cfop;
//    aliq_icm         := itemTrib.icms.aliq_icms;
//    aliq_icmsub      := itemTrib.icms.aliq_intra;
//    fcp_pfcp         := itemTrib.icms.aliq_fcp;
//    perc_red_prod    := itemTrib.icms.aliq_red_bc;
//    pdif             := itemTrib.icms.aliq_icms_dif;
//    pfcpdif          := itemTrib.icms.aliq_fcp_dif;
//    aliq_icm_simples := itemTrib.icms.aliq_credsn;
//    mva              := 0;

    if (FOwnerNF.nfe_indiedest = 1) and PodeCalcularST and (itemTrib.icms.calcularIcmsSt) then
    begin
      Acest := FOwnerNF.cad_cest.GetCestV2(cest, ncm, Copy(cst, 1, 1),
                                           IfThen(FOwnerNF.natureza_nf = 'S', FOwnerNF.dest_uf, vDadosIni.vEmp.vSiglaUF),
                                           StrToIntDef(FOwnerNF.nfe_iddest, 0), Fmerc.cest_variante_id,
                                           FOwnerNF.conf_nf.Conf_ICMS.nf_icmsst_cest_v2.RamoAtividade,
                                           aliq_icm, dtmAtivo.bancoHw, vDadosIni.codEmpresa);
      if (Acest.cest = cest) and (Acest.MVAs.Count > 0) then
      begin
        itemTrib.icms.aliq_mva := Acest.MVAs.First.mva;
        if (itemTrib.icms.aliq_mva > 0) and (FOwnerNF.nfe_iddest = '2') and (FOwnerNF.conf_nf.Conf_ICMS.nf_icmsst_cest_v2.AjustarMVA) and
           (TTipo_Variante_Cest_MVA(VarToInt(Acest.MVAs.First.Variante.tipo)) <> tvOrigem) then// Quando tipo Origem então o MVA já tem a definição da operacao interestadual ou interna
          itemTrib.icms.aliq_mva := ExecutarAjusteMVA(itemTrib.icms.aliq_mva, itemTrib.icms.aliq_icms, itemTrib.icms.aliq_intra);
      end;
    end;

  end
  else
  begin
    cst               := Fmerc.cst_prod;
    perc_red_prod     := get_reducao;
    perc_red_prod_sub := perc_red_prod;

    //se o produto é tributado pelo icms, a partir 01/01/2016 o webservice nao aceita mais aliquota superior a 12 ou 7 depedendo do estado
    aliq_icm          := IfThen(FOwnerNF.nfe_iddest = '1', Fmerc.icm_prod, FOwnerNF.dados_uf.icm_ext_c);
    {
    if ((FOwnerNF.nfe_indiedest <> 1) or (FOwnerNF.consumidor_final = 'S')) and (Fmerc.icm_prod = 0) then
      aliq_icm        := 0;
    }
    if (Fmerc.icm_prod = 0) and (not FOwnerNF.conf_nf.Conf_ICMS.nf_s_icms_interestadual.Destacar(FOwnerNF.uf_operacao, FOwnerNF.nfe_iddest, FOwnerNF.consumidor_final)) then
      aliq_icm := 0;    
//    aliq_icm          := IfThen((FOwnerNF.nfe_indiedest = 1) and
//                                (FOwnerNF.nfe_iddest <> '1'), FOwnerNF.dados_uf.icm_ext_c, Fmerc.icm_prod);

    if FOwnerNF.verificar_mud_cfop = 'S' then
    begin
      if (FOwnerNF.tpimp = Ord(fidRetrato)) and (Fmerc.cfop_nfce > 0) then
        codigo_nop := Fmerc.cfop_nfce
      else if FOwnerNF.nfe_iddest = '1' then
        codigo_nop := Fmerc.codigo_nop
      else if (FOwnerNF.nfe_indiedest <> 1) or (FOwnerNF.consumidor_final = 'S') then
        codigo_nop := IfThen(Fmerc.cfop_inter_n_cont > 0, Fmerc.cfop_inter_n_cont, FOwnerNF.dados_uf.natop_ext_nc)
      else
        codigo_nop := FOwnerNF.dados_uf.natop_ext_nc;
      codigo_nop   := get_cfop(codigo_nop);
    end;
    picmsefet         := FOwnerNF.dados_uf.icm_ext_c;
    predbcefet        := perc_red_prod;

    {$REGION 'obtendo dados icms st nas tabelas mva_ajustada e de ncm'}
    aliq_icmsub := 0;
    mva         := 0;
    if (FOwnerNF.nfe_indiedest = 1) and PodeCalcularST and
       (( not FOwnerNF.conf_nf.Conf_ICMS.emp_us_cfg_cst_saida_nfst ) or
        ( vDadosIni.strIn(Copy(cst, 2, 2), ['10', '30', '70']))
       ) then
    begin
      Amva_aj  := nil;
      Ancm_loc := FOwnerNF.cad_ncm_loc.get_ncm(ncm);
      if not Assigned(Ancm_loc) then
        Ancm_loc := TNbm_class.Create;

      if FOwnerNF.conf_nf.Conf_ICMS.nf_icmsst_cest_v2.Ativa and FOwnerNF.conf_nf.Conf_ICMS.nf_icmsst_cest_v2.CalcularSTSaida then
      begin
        if aliq_icm > 0 then
          Aliquota := aliq_icm
        else
          Aliquota := IfThen(FOwnerNF.nfe_iddest = '1',
                             IfThen(Fmerc.icm_prod <= 0, Ancm_loc.aliq_intra, Fmerc.icm_prod),
                             FOwnerNF.dados_uf.icm_ext_c);

        if (Aliquota = 0) and (FOwnerNF.aliq_icm > 0) and (FOwnerNF.natureza_nf = 'S') then
          //if ((FOwnerNF.devolucao  = 'SIM') and (Copy(cst, 2, 2) = '30')) or ((FOwnerNF.devolucao <> 'SIM') and (Trim(csosn) <> '')) then
          if ((FOwnerNF.tipo_emissao  = '4') and (Copy(cst, 2, 2) = '30')) or ((FOwnerNF.tipo_emissao <> '4') and (Trim(csosn) <> '')) then
            Aliquota := FOwnerNF.aliq_icm;

        if FOwnerNF.nfe_iddest = '1' then
        begin
          aliq_icm    := IfThen(aliq_icm <= 0, Aliquota, aliq_icm);
          aliq_icmsub := aliq_icm;
        end
        else if FOwnerNF.nfe_iddest = '2' then
        begin
          Aliquota    := IfThen((Aliquota > 0) and QuatroPerc, 4, Aliquota);
          aliq_icmsub := FOwnerNF.dados_uf.aliq_intra;
        end;

        Acest := FOwnerNF.cad_cest.GetCestV2(cest, ncm, Copy(cst, 1, 1),
                                             IfThen(FOwnerNF.natureza_nf = 'S', FOwnerNF.dest_uf, vDadosIni.vEmp.vSiglaUF),
                                             StrToIntDef(FOwnerNF.nfe_iddest, 0), Fmerc.cest_variante_id,
                                             FOwnerNF.conf_nf.Conf_ICMS.nf_icmsst_cest_v2.RamoAtividade, Aliquota, dtmAtivo.bancoHw, vDadosIni.codEmpresa);
        if (Acest.cest = cest) and (Acest.MVAs.Count > 0) then
        begin
          mva := Acest.MVAs.First.mva;
          if (mva > 0) and (FOwnerNF.nfe_iddest = '2') and (FOwnerNF.conf_nf.Conf_ICMS.nf_icmsst_cest_v2.AjustarMVA) and
             (TTipo_Variante_Cest_MVA(VarToInt(Acest.MVAs.First.Variante.tipo)) <> tvOrigem) then// Quando tipo Origem então o MVA já tem a definição da operacao interestadual ou interna
            mva := ExecutarAjusteMVA(mva, Aliquota, aliq_icmsub);
//            mva :=(( (1 + (mva / 100)) * ((1 - (Aliquota / 100)) / (1 - (aliq_icmsub / 100))) ) - 1 ) * 100;
        end
        else
          mva := 0;
        if mva = 0 then
          aliq_icmsub := 0;
      end
      else if PodeCalcularST then
      begin
        if FOwnerNF.nfe_iddest <> '1' then //1: operacao interna
          Amva_aj := FOwnerNF.cad_mva_aj.get_mva_ajustada(ncm);
        if Assigned(Amva_aj) and (Ancm_loc.calc_st_saida = 'S') then
        begin
          base_icmsub := 0;
          aliq_icmsub := Amva_aj.aliq_intra;
          mva         := Amva_aj.mva_ajustada;
          aliq_icm    := Amva_aj.aliq_inter;
        end
        else if (Ancm_loc.calc_st_saida = 'S') then
        begin
          if (Ancm_loc.vlbcst > 0) and (Ancm_loc.modbcst = 0) then
          begin
            base_icmsub := Ancm_loc.vlbcst;
            mva         := 0;
          end
          else
          begin
            base_icmsub := 0;
            mva         := IfThen((Ancm_loc.mva_inter > 0) and (FOwnerNF.nfe_iddest <> '1'), Ancm_loc.mva_inter, Ancm_loc.mva);
          end;
        
          if FOwnerNF.nfe_iddest = '1' then
          begin
            aliq_icmsub := IfThen(Ancm_loc.aliq_intra <= 0, aliq_icm, Ancm_loc.aliq_intra);
            aliq_icm    := IfThen(aliq_icm <= 0, Ancm_loc.aliq_intra, aliq_icm);
          end
          else if FOwnerNF.nfe_iddest = '2' then
            aliq_icmsub := FOwnerNF.dados_uf.aliq_intra;

          if (mva = 0) and (base_icmsub = 0) then
            aliq_icmsub := 0;
        end;
      end;
      modbcst := IfThen(mva > 0, 4, 0);

      if aliq_icmsub = 0 then
      begin
        modbcst     := 0;
        mva         := 0;
        base_icmsub := 0;
      end;
    end;

    {$ENDREGION}

    if ((Fmerc.isento_prod = 'S') or (Fmerc.n_incidencia_prod = 'S')) and
       ((Copy(cst, 2, 2) <> '30') or (aliq_icmsub <= 0)) then
    begin
      aliq_icm    := 0;
      aliq_icmsub := 0;
      mva         := 0;
      cst         := Copy(cst, 1, 1) + IfThen(Fmerc.isento_prod = 'S', '40', '41');
    end;

    ind_desoneracao := 0;
    Adeson          := get_desoneracao;
    if Assigned(Adeson) then
      ind_desoneracao := Adeson.ind_desoneracao;

    if (ind_desoneracao = 0) and (aliq_icm > 0) and (FOwnerNF.dest_nf.zfm_alc = 'S') and
       (FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('ICMS', 'UsarCidadesConfiguradas') = 'S') and
       (NewStringList(FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('ICMS', 'QuandoCstsIcmsContidoNaLista'), ',').IndexOf(Copy(cst, 2, 2)) >= 0) then
    begin
      if (FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('ICMS', 'ConfirmarConferenciaInscricaoSuframa') = 'S') then
        ind_desoneracao := IfThen(MatchStr(FOwnerNF.conf_isuf, ['', 'A']), 7)
      else
        ind_desoneracao := 7;
      if (ind_desoneracao > 0) and   (FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('ICMS', 'ConverterCstIcmsQuandoIgual_' + Copy(cst, 2, 2)) <> '') then
        cst := Copy(cst, 1, 1) + Copy(FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('ICMS', 'ConverterCstIcmsQuandoIgual_' + Copy(cst, 2, 2)), 1, 2);
    end;
  end;

  codigo_nop := get_cfop(codigo_nop);
  mva        := IfThen(PodeCalcularST, mva);

  Anat_op := FOwnerNF.cad_cfop.get_nat_op(codigo_nop);
  if not Assigned(Anat_op) then
  begin
    FOwnerNF.erros.New('Item %d - CFOP %d não encontrado no cadastro', [nitem, Trunc(codigo_nop)]);
    Anat_op := TNat_op_class.Create;
    Anat_op.codigo_nop := codigo_nop;
  end
  else if (Trunc(codigo_nop) = 5000) or (Trunc(codigo_nop) = 6000) then
    FOwnerNF.erros.New('Item %d - CFOP inválido para emissão de nota fiscal', [nitem]);

  if Anat_op.sem_imposto = 'S' then
  begin
    aliq_icm         := 0;
    aliq_icm_simples := 0;
    aliq_icmsub      := 0;
  end
  else if (vDadosIni.vEmp.vRegime = 'SIMPLES') and (aliq_icm > 0) then
    aliq_icm_simples := vDadosIni.vEmp.vAliqSimplesICM;

  if Trim(cst) = '' then
  begin
    FOwnerNF.erros.New('Item %d - Sem CST de ICMS', [nitem])
  end
  else
  if aliq_icm > 0 then
  begin
    if (ind_desoneracao = 7) and (mva = 0) then // nao vai fazer nada para prevalecer a configuracao do suframa
      cst := cst
    else if ((mva > 0) or (base_icmsub > 0)) and (Copy(cst, 2, 1)[1] in ['4', '3']) then
      cst := Copy(cst, 1, 1) + '30'
    else if ((mva > 0) or (base_icmsub > 0)) and (perc_red_prod > 0) then
      cst := Copy(cst, 1, 1) + '70'
    else if ((mva > 0) or (base_icmsub >0)) then
      cst := Copy(cst, 1, 1) + '10'
    else if (perc_red_prod > 0) then
      cst := Copy(cst, 1, 1) + '20'
    else
      cst := Copy(cst, 1, 1) + '00';
  end
  else if (Copy(cst, 2, 1)[1] in ['0', '1', '2', '7']) and (Anat_op.sem_imposto <> 'S') then
    cst := Copy(cst, 1, 1) + '60';

  {Aplicada a exoneracao direto nas condicoes anteriores
  if (FOwnerNF.devolucao <> 'SIM')  then
  begin
    ind_desoneracao := 0;

    Adeson := get_desoneracao;
    if Assigned(Adeson) then
      ind_desoneracao := Adeson.ind_desoneracao;

    if Assigned(AtribAd) then
      ind_desoneracao   := IfThen((AtribAd.ind_desoneracao > 0) and (FOwnerNF.crt <> '1'), AtribAd.ind_desoneracao, ind_desoneracao);
  end;
  }

  if (vDadosIni.vEmp.vRegime = 'SIMPLES') then
    csosn := get_csosn_ajutstado_por_cst;

  {
  if (aliq_icm = 0) and (FOwnerNF.aliq_icm > 0) and (FOwnerNF.natureza_nf = 'S') then
  begin
    if (FOwnerNF.devolucao = 'SIM') and (Copy(cst, 2, 2) = '30') then
      aliq_icm := FOwnerNF.aliq_icm
    else if (Trim(csosn) <> '') and (FOwnerNF.devolucao <> 'SIM') then
      aliq_icm := FOwnerNF.aliq_icm;
  end;
  }

  aliq_icm := IfThen((aliq_icm > 0) and QuatroPerc, 4, aliq_icm);

  {$ENDREGION}

  {$REGION 'obtendo dados para calculo do pis/cofins'}
  {
  if itemTrib.piscofins.piscofins_id > 0 then
  begin
//    cst_pis           := itemTrib.piscofins.cst;
//    aliq_pis          := IfThen(cst_pis <> '03', itemTrib.piscofins.aliq_pis);
//    aliq_cofins       := IfThen(cst_pis <> '03', itemTrib.piscofins.aliq_cofins);
//    aliq_pis_quant    := IfThen(cst_pis  = '03', itemTrib.piscofins.aliq_pis);
//    aliq_cofins_quant := IfThen(cst_pis  = '03', itemTrib.piscofins.aliq_cofins);
//    motdes_pc         := StrToIntDef(itemTrib.piscofins.motdespc, 0);
  end
  else
  begin
    cst_pis    := IfThen(Fmerc.cst_pis <> '', Fmerc.cst_pis, '01');
    cst_cofins := cst_pis;
    nat_rec    := Fmerc.nat_rec;

    if vDadosIni.strIn(cst_pis, ['02', '03', '05']) then
    begin
      aliq_pis          := IfThen(cst_pis <> '03', Fmerc.aliq_pis_diferenciada);
      aliq_cofins       := IfThen(cst_pis <> '03', Fmerc.aliq_cofins_diferenciada);
      aliq_pis_quant    := IfThen(cst_pis =  '03', Fmerc.aliq_pis_diferenciada);
      aliq_cofins_quant := IfThen(cst_pis =  '03', Fmerc.aliq_cofins_diferenciada);
    end
    else
    begin
      aliq_pis          := IfThen(cst_pis = '01', vDadosIni.vEmp.vAliqPIS);
      aliq_cofins       := IfThen(cst_pis = '01', vDadosIni.vEmp.vAliqCOFINS);
      aliq_pis_quant    := 0;
      aliq_cofins_quant := 0;
    end;

    if vDadosIni.vEmp.vRegime = 'SIMPLES' then
    begin
      cst_pis    := '99';
      cst_cofins := cst_pis;
    end
    else if Anat_op.devolucao_sped = 'S'  then
    begin
      cst_pis    := IfThen(FOwnerNF.natureza_nf = 'S', '99', '49');
      cst_cofins := cst_pis;
    end;

    motdes_pc := 0;
    if (aliq_pis > 0) and (FOwnerNF.dest_nf.zfm_alc = 'S') and
       (FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'UsarCidadesConfiguradas') = 'S') and
       (NewStringList(FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'QuandoCstsPisCofinsContidoNaLista'), ',').IndexOf(cst_pis) >= 0) then
    begin
      if (FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'ConfirmarConferenciaInscricaoSuframa') = 'S') then
        motdes_pc := IfThen(MatchStr(FOwnerNF.conf_isuf, ['', 'A']), 7)
      else
        motdes_pc := 7;
      if motdes_pc > 0 then
      begin
        nat_rec    := IfThen(nat_rec <> '', nat_rec, FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'UsarNaturezaDaReceita'));
        if FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'ConverterCstPisCofinsQuandoIgual_' + cst_pis) <> '' then
          cst_pis  := FOwnerNF.conf_nf.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'ConverterCstPisCofinsQuandoIgual_' + cst_pis);
        cst_cofins := cst_pis;
      end;
    end;

  end;
  }
  {$ENDREGION}

  {$REGION 'obtendo dados de antecipacao tributária, icms e fcp'}
  base_icmant_sub  := Fmerc.baseicmant_sub;
  valor_icmant_sub := Fmerc.icmant_sub;
  fcp_pst          := Fmerc.fcp_pst;
  fcp_vbcfcpstret  := Fmerc.fcp_vbcfcpstret;
  fcp_pfcpstret    := Fmerc.fcp_pfcpstret;
  fcp_vfcpstret    := Fmerc.fcp_vfcpstret;
  if (Fmerc.vicmsmonoret > 0) and (Fmerc.adremicmsret > 0) then
  begin
    qbcmonoret     := IfThen(qbcmonoret > 0, qbcmonoret, quantidade);
    vicmsmonoret   := Fmerc.vicmsmonoret * qbcmonoret;
    adremicmsret   := Fmerc.adremicmsret;
  end
  else
  begin
    qbcmonoret     := 0;
    vicmsmonoret   := 0;
    adremicmsret   := 0;
  end;
  {$ENDREGION}

end;

function THw_notafiscal_item_class.obter_dados_saida_serv: Boolean;
begin
  Result := False;

  if tipo_item <> 'S' then
    Exit;

  itemTrib := FOwnerNF.cad_opfiscal.GetOperacao(condFiscal.ncm, condFiscal.tipoItem, condFiscal.icm_cst, condFiscal.piscofins_cst);

  if not Assigned(Fserv) then
    Fserv := FOwnerNF.cad_serv.GetServico(cod_servico)
  else if (Fserv.cod_servico <> cod_servico) then
    Fserv := FOwnerNF.cad_serv.GetServico(cod_servico);

  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
    aliq_iss := vDadosIni.vEmp.vAliqSimplesISS;

  if (Trim(nbs) = '') and Assigned(Fserv) then // Ainda nao sei se isso está bom
    nbs := Fserv.cnbs;

  if (Fserv.isento_serv = 'S') or (Fserv.n_incidencia_serv = 'S') then
  begin
    vlisento  := valor_total - rateio_desconto;
    vloutras  := 0;
    vln_trib  := 0;
    aliq_iss  := 0;
    base_iss  := 0;
    valor_iss := 0;
  end
  else
    aliq_iss := Fserv.aliq_iss;
  if aliq_iss > 0 then
  begin
    vlisento  := 0;
    vloutras  := 0;
    vln_trib  := 0;
    base_iss  := valor_total - rateio_desconto;
    valor_iss := RoundTo(base_iss * aliq_iss / 100, -2);
  end;
end;

function THw_notafiscal_item_class.obter_dados_saida_veic: Boolean;
begin 
  Result := False;

  if tipo_item <> 'V' then
    Exit;

  // aqui vai no banco novamente, pois o tipo de item veiculo usado ou novo nao deu para prever para obter antes.
  itemTrib := OpFiscal.GetOperacao(condFiscal, vDadosIni.cod_empresa, TConexao(FOwnerNF.con));
end;

function THw_notafiscal_item_class.obter_dados_serv(
  Aserv: TTipo_servico_class): Boolean;
begin
  Result := False;

  if Assigned(Aserv) then
    Fserv := Aserv;
              
  tipo_item      := 'S';
  cod_servico    := Fserv.cod_servico;
  descricao_item := Trim(Fserv.desc_servico);
  codigo_nop     := Fserv.codigo_nop;
  num_fab_prod   := IntToStr(cod_servico);
  referencia     := IfThen(Fserv.unidade <> '', Fserv.unidade, 'UN');
  ncm            := '00';
  quantidade     := 1;
end;

function THw_notafiscal_item_class.operacao_interestadual_com_partilha_icms: Boolean;
var
  Aretorno: Boolean;
begin
  Aretorno := False;
  try
    with FOwnerNF do
     nfe_indiedest := IfThen(nfe_indiedest = 0, IfThen(vDadosIni.strIn(insc_est, ['', 'isento']), 9, 1), nfe_indiedest);

    Aretorno := (FOwnerNF.nfe_indiedest = 9) and
                (FOwnerNF.consumidor_final = 'S') and
                (FOwnerNF.nfe_iddest = '2');

    if Aretorno then    
      case Trunc(codigo_nop) of
        1414, 1415, 1451, 1452, 1554, 1664, 1902, 1903, 1904, 1906, 1907, 1909, 1913,
        1914, 1916, 1921, 1925,
        2414, 2415, 2554, 2664, 2902, 2903, 2904, 2906, 2907, 2909, 2913, 2914, 2916,
        2921, 2925,
        5664, 5665, 5902, 5903, 5906, 5907, 5909, 5913, 5916, 5925,
        6664, 6665, 6902, 6903, 6906, 6907, 6909, 6913, 6916, 6925 : Aretorno := False;
      end;

    if Aretorno then
      case Trunc(codigo_nop) of
        5414, 5415, 5451, 5501, 5502, 5504, 5505, 5554, 5657, 5663, 5666, 5901, 5904,
        5905, 5908, 5910, 5911, 5912, 5914, 5915, 5917, 5920, 5923, 5924, 5934,
        6414, 6415, 6501, 6502, 6504, 6505, 6554, 6657, 6663, 6666, 6901, 6904, 6905,
        6908, 6910, 6911, 6912, 6914, 6915, 6917, 6920, 6923, 6924, 6934 : Aretorno := False;
      end;

    if (Aretorno) and (Trim(comb_cprodanp) <> '') then
      if Assigned(FOwnerNF.conf_nf.Conf_ICMS.nf_exececoes_codigo_anp) then
        Aretorno := FOwnerNF.conf_nf.Conf_ICMS.nf_exececoes_codigo_anp.IndexOf(comb_cprodanp) < 0;

  finally
    Result := Aretorno;
  end;
end;

procedure THw_notafiscal_item_class.SetTributosRTC(
  const Value: TributoDFeContextEtd);
begin
  if FtributosRTC = Value then
    Exit;

  if Assigned(FtributosRTC) then
    FreeAndNil(FtributosRTC);

  FtributosRTC := Value;
end;

procedure THw_notafiscal_item_class.Totalizar;
begin
  if (indtot <> 1)
    or (YesNoEnum(FOwnerNF.dfe_trib_ignorar) = ynYes)
    or (tributosRTC = nil) or (tributosRTC.IbsCbs = nil) // Nao gerado o rtc, registro antigo ou manual pelo usuario
  then
    vitem := 0.00
    
  else
  begin
    vitem := valor_total
        - rateio_desconto
        - IfThen(FOwnerNF.totais_com_deson <> 'N', vicmdeson)
        + valor_icmsub
        + vicmsmonoreten
        + fcp_vfcpst
        + IfThen(FOwnerNF.frete_f_nfe <> 'S', rateio_frete)
        + rateio_seguro
        + rateio_outdesp
        + valor_ii
        + valor_ipi
        + nfe_vipidevol
        + IfThen(indsomapisst = 1, valor_pis_st)
        + IfThen(indsomacofinsst = 1, valor_cofins_st)
        ;

    if (FOwnerNF.data_contabil >= EncodeDate(2027, 01, 01)) then
      //if Assigned(tributosRTC) then
      begin                   
        if Assigned(tributosRTC.IbsCbs) then
        begin
          if Assigned(tributosRTC.IbsCbs.GIbsCbs) then
            vitem := vitem
              + tributosRTC.IbsCbs.GIbsCbs.VIbs
              + tributosRTC.IbsCbs.GIbsCbs.VCbs;

          if Assigned(tributosRTC.IbsCbs.Monofasia) then
            vitem  := vitem
              + tributosRTC.IbsCbs.Monofasia.Vtotibsmonoitem
              + tributosRTC.IbsCbs.Monofasia.Vtotcbsmonoitem;
        end;                                

        if Assigned(tributosRTC.ImpostoSeletivo) then       
            vitem := vitem
              + tributosRTC.ImpostoSeletivo.Vis.Value;
      end;

    vitem := RoundTo(vitem, -2);
  end;
end;

function THw_notafiscal_item_class.validar_dados: Boolean;
begin
  Result := False;

  indtot           := IfThen(indtot = 1, 1, 0);
  indsomapisst     := IfThen(indsomapisst = 1, 1, 0);
  indsomacofinsst  := IfThen(indsomacofinsst = 1, 1, 0);
  base_ii          := IfThen(FloatToStr(codigo_nop)[1] = '3', base_ii);
  valor_despadu_ii := IfThen(FloatToStr(codigo_nop)[1] = '3', valor_despadu_ii);
  valor_ii         := IfThen(FloatToStr(codigo_nop)[1] = '3', valor_ii);
  valor_iof_ii     := IfThen(FloatToStr(codigo_nop)[1] = '3', valor_iof_ii);
  xped_compra      := IfThen((xped_compra <> '') and (nitemped_compra > 0), xped_compra);
  nitemped_compra  := IfThen((xped_compra <> ''), nitemped_compra);
  nfe_pdevol       := IfThen(FOwnerNF.tipo_emissao = '4', nfe_pdevol);
  nfe_vipidevol    := IfThen(FOwnerNF.tipo_emissao = '4', nfe_vipidevol);
end;

function THw_notafiscal_item_class.validar_dados_entrada: Boolean;
begin
  Result := False;

  if (ant_calc = 'D') and (base_icmsub = 0) then
  begin
    base_icmsub  := RoundTo(base_icmsub_ant  * quantidade, -2);
    valor_icmsub := RoundTo(valor_icmsub_ant * quantidade, -2);
  end
  else if (antec_trib = 'S') and (base_icmsub > 0) then
  begin
    base_icmsub_ant  := RoundTo(base_icmsub  / quantidade, -2);
    valor_icmsub_ant := RoundTo(valor_icmsub / quantidade, -2);
  end
  else if antec_trib <> 'S' then
  begin
    base_icmsub_ant  := 0;
    valor_icmsub_ant := 0;
  end;
end;

function THw_notafiscal_item_class.validar_dados_saida: Boolean;
var
  Anat_op: TNat_op_class;
begin
  try
    if (tipo_item = 'O') and (descricao_item_outras.Count > 0) then
      descricao_item := descricao_item_outras[0];

    if descricao_item = '' then
      FOwnerNF.erros.New('Item %d - Descrição não informada', [nitem]);

    if MatchStr(FOwnerNF.tipo_emissao, ['1', '4']) then//(FOwnerNF.tipo_emissao <> '2') and (FOwnerNF.complementar_ent <> 'S') and (FOwnerNF.tipo_nf <> 'O') then
    begin
      if quantidade <= 0 then
        FOwnerNF.erros.New('Quantidade deve ser informada | Item %s - %s', [num_fab_prod, descricao_item]);

      if valor_unitario <= 0 then
        FOwnerNF.erros.New('Valor unitário deve ser informado | Item %s - %s', [num_fab_prod, descricao_item]);
    end;

    if (FOwnerNF.emissao_propria = 'S') and (FOwnerNF.modelo_nf = '55') then
    begin
      case Trunc(codigo_nop) of
        1651, 1652, 1653, 1658, 1659, 1660, 1661,
        1662, 1663, 1664, 2651, 2652, 2653, 2658, 2659,
        2660, 2661, 2662, 2663, 2664, 3651, 3652, 3653,
        5651, 5652, 5653, 5654, 5655, 5656, 5657, 5658,
        5659, 5660, 5661, 5662, 5663, 5664, 5665, 5666,
        5667, 6651, 6652, 6653, 6654, 6655, 6656, 6657,
        6658, 6659, 6660, 6661, 6662, 6663, 6664, 6665,
        6666, 6667, 7651, 7654, 7667 :
        begin
          if comb_cprodanp = '' then
            FOwnerNF.erros.New('Código ANP deve ser informado | Item %s - %s', [num_fab_prod, descricao_item]);
          if comb_descanp = '' then
            FOwnerNF.erros.New('Descrição ANP deve ser informada | Item %s - %s', [num_fab_prod, descricao_item]);

          if (comb_cide_valiqprod > 0) or (comb_cide_qbcprod > 0) or (comb_cide_vcide > 0) then
          begin
            if comb_cide_valiqprod <= 0 then
              FOwnerNF.erros.New('CIDE - Aliquota deve ser informada | Item %s - %s', [num_fab_prod, descricao_item]);
            if comb_cide_qbcprod <= 0 then
              FOwnerNF.erros.New('CIDE - Base deve ser informada | Item %s - %s', [num_fab_prod, descricao_item]);
            if comb_cide_vcide <= 0 then
              FOwnerNF.erros.New('CIDE - Valor deve ser informado | Item %s - %s', [num_fab_prod, descricao_item]);
          end;
        end;
      end;

      if (Length(Trim(ncm)) <> 8) and (tipo_item <> 'S') then
        FOwnerNF.erros.New('Obrigatória a informação do NCM completo [%s] | Item %s - %s', [ncm, num_fab_prod, descricao_item]);
    end;

    Anat_op := FOwnerNF.cad_cfop.get_nat_op(codigo_nop);
    if Assigned(Anat_op) then
    begin
      altera_estoque_cfop := IfThen((Anat_op.tipv_veiculo = 'A') or (indtot = 0), 'N', Anat_op.alt_est);
      altera_custo_cfop   := IfThen((altera_estoque_cfop = 'N'), 'N', Anat_op.calc_custo);
      tipv_veiculo        := Anat_op.tipv_veiculo;
    end
    else
      FOwnerNF.erros.New('CFOP [%d] não encontrado | Item %s - %s', [Trunc(codigo_nop), num_fab_prod, descricao_item]);

    if (rastro_dval > 0) and (rastro_dval >= EncodeDate(2100, 1, 1)) then
      FOwnerNF.erros.New('Ano da data de validade (%d) tem de ser menor que 2100 | Item %d - %s - %s', [YearOf(rastro_dval), nitem, num_fab_prod, descricao_item]);

    if (rastro_dfab > 0) and (rastro_dfab >= EncodeDate(2100, 1, 1)) then
      FOwnerNF.erros.New('Ano da data de fabricação (%d) tem de ser menor que 2100 | Item %d - %s - %s', [YearOf(rastro_dfab), nitem, num_fab_prod, descricao_item]);    

    if (ncupom > 0) or (cod_nfce > 0) then
    begin
      codigo_nop := StrToFloat(FloatToStr(codigo_nop)[1] + '929');
      //aliq_icm := 0; 
    end;
  finally
    Result := FOwnerNF.erros.Count = 0;
  end;
end;

{ THw_dados_uf_class }

function THw_dados_uf_class.Clone: THw_dados_uf_class;
begin
  Result                := THw_dados_uf_class.Create;
  Result.pfcp           := Self.pfcp;
  Result.aliq_intra     := Self.aliq_intra;
  Result.ibge_codigo_uf := Self.ibge_codigo_uf;
  Result.inscricao      := Self.inscricao;
  Result.icm_ext_c      := Self.icm_ext_c;
  Result.icm_ext_nc     := Self.icm_ext_nc;
  Result.natop_ext_c    := Self.natop_ext_c;
  Result.natop_ext_nc   := Self.natop_ext_nc;
  Result.natop_int_c    := Self.natop_int_c;
  Result.natop_int_nc   := Self.natop_int_nc;
end;

procedure THw_dados_uf_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fpfcp           := ADataSet.FieldByName('PFCP').AsFloat;
    Faliq_intra     := ADataSet.FieldByName('ALIQ_INTRA').AsFloat;
    Fibge_codigo_uf := ADataSet.FieldByName('IBGE_CODIGO_UF').AsInteger;
    Finscricao      := Trim(ADataSet.FieldByName('INSCRICAO').AsString);
    Ficm_ext_c      := ADataSet.FieldByName('ICM_EXT_C').AsFloat;
    Ficm_ext_nc     := ADataSet.FieldByName('ICM_EXT_NC').AsFloat;
    Fnatop_ext_c    := ADataSet.FieldByName('NATOP_EXT_C').AsFloat;
    Fnatop_ext_nc   := ADataSet.FieldByName('NATOP_EXT_NC').AsFloat;
    Fnatop_int_c    := ADataSet.FieldByName('NATOP_INT_C').AsFloat;
    Fnatop_int_nc   := ADataSet.FieldByName('NATOP_INT_NC').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('PFCP'          )) then Fpfcp           := ADataSet.FieldByName('PFCP').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_INTRA'    )) then Faliq_intra     := ADataSet.FieldByName('ALIQ_INTRA').AsFloat;
    if Assigned(ADataSet.FindField('IBGE_CODIGO_UF')) then Fibge_codigo_uf := ADataSet.FieldByName('IBGE_CODIGO_UF').AsInteger;
    if Assigned(ADataSet.FindField('INSCRICAO'     )) then Finscricao      := Trim(ADataSet.FieldByName('INSCRICAO').AsString);
    if Assigned(ADataSet.FindField('ICM_EXT_C'     )) then Ficm_ext_c      := ADataSet.FieldByName('ICM_EXT_C').AsFloat;
    if Assigned(ADataSet.FindField('ICM_EXT_NC'    )) then Ficm_ext_nc     := ADataSet.FieldByName('ICM_EXT_NC').AsFloat;
    if Assigned(ADataSet.FindField('NATOP_EXT_C'   )) then Fnatop_ext_c    := ADataSet.FieldByName('NATOP_EXT_C').AsFloat;
    if Assigned(ADataSet.FindField('NATOP_EXT_NC'  )) then Fnatop_ext_nc   := ADataSet.FieldByName('NATOP_EXT_NC').AsFloat;
    if Assigned(ADataSet.FindField('NATOP_INT_C'   )) then Fnatop_int_c    := ADataSet.FieldByName('NATOP_INT_C').AsFloat;
    if Assigned(ADataSet.FindField('NATOP_INT_NC'  )) then Fnatop_int_nc   := ADataSet.FieldByName('NATOP_INT_NC').AsFloat;
  end;
end;

{ TCest_v2_st }
{
function TCest_v2_st.Configura(Conf: TConfig_sistema_Class): TCest_v2_st;
begin
  Self.value1_b.Text   := Conf.value1_b.Text;
  Self.Ativa           := Conf.value1_f = 1;
  Self.CalcularSTSaida := Conf.ReadString( 'Conf', 'CalcularSTSaida', 'S') = 'S';
  Self.AjustarMVA      := Conf.ReadString( 'Conf', 'AjustarMVA'     , 'S') = 'S';
  Self.RamoAtividade   := Conf.ReadInteger('Conf', 'RamoAtividade'  , 3);
end;

function TCest_v2_st.GetRamoAtividade(natureza_nf, cnpj: string): Integer;
begin
  if natureza_nf = 'S' then
    Result := RamoAtividade
  else
  begin
    Result := ReadInteger('Conf', 'RamoAtividade_' + cnpj, -1);
    if Result = -1 then
      Result := ReadInteger('Conf', 'RamoAtividade_Fornecedor' + cnpj, 3);
  end;
end;}

{ TConfigGlobalNF }

//function TConfigGlobalNF.AsTrueValue(Avalue: Double): Boolean;
//begin
//  Result := Avalue = 1;
//end;

constructor TConfigGlobalNF.Create(Abuscas: TIBQuery; Anatureza_nf: string);
begin
//  Finicializado                              := False;
  reset;
  Fnatureza_nf                               := Anatureza_nf;
  Fbuscas                                    := TIBQuery(Abuscas);
  FConf_FCP                                  := TConfigGlobalNF_FCP.create;
  FConf_Frete                                := TConfigGlobalNF_Frete.Create;
  FConf_ICMS                                 := TConfigGlobalNF_ICMS.Create;
  FConf_PIS                                  := TConfigGlobalNF_PISCOFINS.Create;
  FConf_Lote                                 := TConfigGlobalNF_Lote.Create;
  FConf_Geral                                := TConfigGlobalNF_Geral.Create;
  //FConf_Preco                                := TConfigGlobalNF_AltPreco.Create;
  FConf_Custo                                := TConfigGlobalNF_Custos.Create;
end;

destructor TConfigGlobalNF.Destroy;
begin
  if Assigned(FConf_FCP  ) then FreeAndNil(FConf_FCP);
  if Assigned(FConf_Frete) then FreeAndNil(FConf_Frete);
  if Assigned(FConf_ICMS ) then FreeAndNil(FConf_ICMS);
  if Assigned(FConf_PIS  ) then FreeAndNil(FConf_PIS);
  if Assigned(FConf_Geral) then FreeAndNil(FConf_Geral);
  if Assigned(FConf_Lote)  then FreeAndNil(FConf_Lote);
  //if Assigned(FConf_Preco) then FreeAndNil(FConf_Preco);
  if Assigned(FConf_Custo)  then FreeAndNil(FConf_Custo);
  inherited;
end;

procedure TConfigGlobalNF.ExecutarConferenciaVariaveis;
begin
  nf_s_lote_faturamento_check;
end;

procedure TConfigGlobalNF.ExecutarLeitura(Anatureza_nf: string);
var
  AconfList: TConfig_sistema_classList;
  Aconf: TConfig_sistema_class;
  Alist: TStrings;
  I, J: Integer;
  AstrConfs: array of string;

  procedure addConf(AconfName: string);
  begin
    SetLength(AstrConfs, Length(AstrConfs) + 1);
    AstrConfs[High(AstrConfs)] := AconfName;
  end;

  procedure addArrayConf(const AconfsName: array of string);
  var
    Acont: Integer;
  begin
    for Acont := Low(AconfsName) to High(AconfsName) do
      addConf(AconfsName[Acont]);
  end;

begin
  SetLength(AstrConfs, 0);

  Fversao_calc := 1;
  Fnatureza_nf := IfThen(Anatureza_nf[1] in ['S', 'E'], Anatureza_nf[1], Fnatureza_nf);
  FConf_ICMS.emp_us_cfg_cst_saida_nfst       := False;
  FConf_ICMS.UsarCSOSN300Para041             := vDadosIni.vUsarCSOSN300Para041 = 'S';
  FConf_ICMS.UFsBaseDupla                    := '';
  FConf_Geral.nfe_pag_carta_tpintegra_padrao := 1;
  FConf_Geral.nf_s_obs_pad_bol               := '';
  FConf_Geral.prod_ean_prefixos_invalidos    := '';
  FConf_Custo                                := TConfigGlobalNF_Custos.Create;

  addArrayConf(['nf_mudanca_cfop_com_opcoes',
                'nf_hab_digitacao_valor_total',
                'nf_s_hab_dadosadicionais_digitacao_fech',
                'nf_s_hab_digitacao_peso',
                'nf_s_obs_pad_bol',
                'nfe_pag_carta_tpintegra_padrao',
                'nf_conf_ncm_cfop_piscofins',
                'nf_ibpt_consulta_tributos',
                'nf_campos_default',
                'nf_icmsst_cest_v2',
                'prod_ean_prefixos_invalidos',
                'nf_piscofins_bases',
                'nf_e_excecao_anp_cims_inter_nao_contri',
                'nf_desoneracao_zfm_alc',
                'nf_inf_pedido_compra',
                'nfe_nt_2020_006_data',
                'nf_s_difal_base_dupla',
                'rtc_config',
                'hw_cloud_ia_conf']);

  if Fnatureza_nf = 'S' then
    addArrayConf(['nf_s_conf_fcp',
                  'nf_s_config_frete',
                  'nf_zerar_icms_interestadual_cst_csosn',
                  'nf_habilitar_fat_usar_valor_ped',
                  'nf_s_icms_efetivo',
                  'nf_s_lote_faturamento',
                  'nf_piscofins_cst_05_revenda_base_zero',
                  'nfe_info_complementar_op_interna_dest_outra_uf',
                  'nf_s_calculo_versao',
                  'nf_s_icms_interestadual',
                  'nfs_devolucao_referencia_por_item'])
  else //entradas
    addArrayConf(['nf_e_add_calc_recomposicao_ao_custo',
                  'nf_e_hab_conversao_embalagem_produto',
                  'nf_e_hab_validacao_alternativa_modelo',
                  'nf_hab_validacao_antecipacao_st',
                  'nf_hab_alerta_calc_ant_st_itens_por_cst',
                  'nf_hab_antecipacao_st_usar_icms_xml',
                  'nf_e_hab_cst_60_calculo_st_icms',               
                  'nf_e_cnpj_import_xml',
                  'nf_e_alteracao_preco',
                  'prod_precos',
                  'nf_e_custos',
                  'nf_e_compra_conferencia']);

//  if (vDadosIni.vEmp.vRegime = 'SIMPLES') then // estava causando erro na devolução qiamdp regime era igual simples excesso
    addConf('prod_cad_relacao_cst_csosn');

  //FConf_Preco.AlteraPrecoNaEntrada := vDadosIni.vAlteraPrecoVendaEntradaNF = 'S';
  //FConf_Preco.UsarPercAdicional := vDadosIni.vUsarPerADnaEntrada = 'S';
  FConf_PIS.nf_piscofins_cst_05_revenda_base_zero := True;

  AconfList := vDadosIni.getConfSisList(Fbuscas, AstrConfs);

  for I := 0 to AconfList.Count - 1 do
  begin
    Aconf := AconfList.Items[I];
    if Aconf.chave = 'nf_s_conf_fcp' then
    begin
      FConf_FCP.CalcularFCP       := vDadosIni.GetIni('FCP', 'CalcularFCP'                 , 'N', Aconf.value1_b) = 'S';
      FConf_FCP.UsarFCPdoNCM      := vDadosIni.GetIni('FCP', 'UsarFCPdoNCM'                , 'N', Aconf.value1_b) = 'S';
      FConf_FCP.UsarFCPdoProduto  := vDadosIni.GetIni('FCP', 'UsarFCPdoProduto'            , 'N', Aconf.value1_b) = 'S';
      FConf_FCP.UsarFCPdoEstado   := vDadosIni.GetIni('FCP', 'UsarFCPdoEstado'             , 'S', Aconf.value1_b) = 'S';
      FConf_FCP.UsarFCPTribAdProd := vDadosIni.GetIni('FCP', 'UsarFCPdaTributacaoAdiciona' , 'S', Aconf.value1_b) = 'S';
    end
    else if Aconf.chave = 'nf_s_config_frete' then
    begin
      if not Assigned(FConf_Frete) then
        FConf_Frete := TConfigGlobalNF_Frete.Create;

      FConf_Frete.Somar_despesa_pedvenda_quando_conta_emitente     := vDadosIni.GetIni('Configuracao', 'Somar_despesa_pedvenda_quando_conta_emitente'    , 'N', Aconf.value1_b) = 'S';
      FConf_Frete.Somar_despesa_pedvenda_quando_conta_destinatario := vDadosIni.GetIni('Configuracao', 'Somar_despesa_pedvenda_quando_conta_destinatario', 'N', Aconf.value1_b) = 'S';
      FConf_Frete.Somar_despesa_pedvenda_quando_conta_terceiros    := vDadosIni.GetIni('Configuracao', 'Somar_despesa_pedvenda_quando_conta_terceiros'   , 'N', Aconf.value1_b) = 'S';
      FConf_Frete.Entra_base_icm_quando_conta_emitente             := vDadosIni.GetIni('Configuracao', 'Entra_base_icm_quando_conta_emitente'            , 'N', Aconf.value1_b) = 'S';
      FConf_Frete.Entra_base_icm_quando_conta_destinatario         := vDadosIni.GetIni('Configuracao', 'Entra_base_icm_quando_conta_destinatario'        , 'N', Aconf.value1_b) = 'S';
      FConf_Frete.Entra_base_icm_quando_conta_terceiros            := vDadosIni.GetIni('Configuracao', 'Entra_base_icm_quando_conta_terceiros'           , 'N', Aconf.value1_b) = 'S';
    end
    else if Aconf.chave = 'nf_s_icms_efetivo' then
    begin
      SetLength(FConf_ICMS.icms_efetivo_ufs, 0);
      FConf_ICMS.icms_efetivo_calc_entrada := vDadosIni.GetIni('Texto', 'CalcularNotaEntradav', 'S', Aconf.value1_b) = 'S';
      Alist := vDadosIni.SplitS(vDadosIni.GetIni('Texto', 'UFs', '', Aconf.value1_b), [',', ';', '|', ' ', '.']);
      for J := 0 to Alist.Count - 1 do
        if Trim(Alist[J]) <> '' then
          if (vDadosIni.strIn(Trim(Alist[J]), Const_UF)) or (Trim(Alist[J]) = 'EX') then
          begin
            SetLength(FConf_ICMS.icms_efetivo_ufs, Length(Conf_ICMS.icms_efetivo_ufs) + 1);
            FConf_ICMS.icms_efetivo_ufs[High(FConf_ICMS.icms_efetivo_ufs)] := Trim(Alist[J]);
          end;
      if Assigned(Alist) then
        FreeAndNil(Alist);
    end
    else if Aconf.chave = 'nf_s_lote_faturamento' then
    begin
      if not Assigned(FConf_Lote) then
        FConf_Lote := TConfigGlobalNF_Lote.Create;
      FConf_Lote.agrupar_por_cliente := vDadosIni.GetIni('Conf', 'AgruparNFmesmosClientes', 'N', Aconf.value1_b) = 'S';
      FConf_Lote.usar_obs_pedido     := Aconf.ConfActive('Conf', 'UsarObsPedido', 'N', 'S');
    end
    else if Aconf.chave = 'nf_e_custos' then
    begin
      FConf_Custo.AbaterCreditoIcms      := Aconf.ReadString('Diminuir', 'CreditoICMS') = 'S';
      FConf_Custo.AbaterCreditoPisCofins := Aconf.ReadString('Diminuir', 'CreditoPISCOFINS') = 'S';
    end
    else if Aconf.chave = 'nf_zerar_icms_interestadual_cst_csosn' then
      FConf_ICMS.CSTCSOSNNaoCalcularICMSInterestadual := '|' + Aconf.value1_vc + '|'
    else if Aconf.chave = 'nf_mudanca_cfop_com_opcoes' then
      FConf_Geral.nf_mudanca_cfop_com_opcoes := Trunc(Aconf.value1_f) = 1
    else if Aconf.chave = 'nf_e_add_calc_recomposicao_ao_custo' then
      FConf_Geral.nf_e_add_calc_recomposicao_ao_custo := AsTrueValue(Aconf.value1_f)
    else if Aconf.chave = 'nf_e_hab_conversao_embalagem_produto' then
      FConf_Geral.nf_e_hab_conversao_embalagem_produto := AsTrueValue(Aconf.value1_f)
    else if Aconf.chave = 'nf_hab_digitacao_valor_total' then
      FConf_Geral.nf_hab_digitacao_valor_total:= AsTrueValue(Aconf.value1_f)
    else if Aconf.chave = 'nf_habilitar_fat_usar_valor_ped' then
      FConf_Geral.nf_habilitar_fat_usar_valor_ped:= AsTrueValue(Aconf.value1_f)
    else if Aconf.chave = 'nf_e_hab_validacao_alternativa_modelo' then
      FConf_Geral.nf_e_hab_validacao_alternativa_modelo := Aconf
    else if Aconf.chave = 'nf_hab_validacao_antecipacao_st' then
      FConf_Geral.nf_hab_validacao_antecipacao_st := Aconf
    else if Aconf.chave = 'nf_hab_alerta_calc_ant_st_itens_por_cst' then
      FConf_Geral.nf_hab_alerta_calc_ant_st_itens_por_cst := Aconf
    else if Aconf.chave = 'nf_s_hab_dadosadicionais_digitacao_fech' then
      FConf_Geral.nf_s_hab_dadosadicionais_digitacao_fech:= AsTrueValue(Aconf.value1_f)
    else if Aconf.chave = 'nf_s_hab_digitacao_peso' then
      FConf_Geral.nf_s_hab_digitacao_peso:= AsTrueValue(Aconf.value1_f)
    else if Aconf.chave = 'nf_s_obs_pad_bol' then
      FConf_Geral.nf_s_obs_pad_bol:= Trim(Aconf.value1_vc)
    else if Aconf.chave = 'prod_ean_prefixos_invalidos' then
      FConf_Geral.prod_ean_prefixos_invalidos:= Trim(Aconf.value1_b.Text)
    else if Aconf.chave = 'nf_hab_antecipacao_st_usar_icms_xml' then
      FConf_Geral.nf_hab_antecipacao_st_usar_icms_xml:= AsTrueValue(Aconf.value1_f)
    else if Aconf.chave = 'nfe_pag_carta_tpintegra_padrao' then
      FConf_Geral.nfe_pag_carta_tpintegra_padrao := IfThen( (Trunc(Aconf.value1_f) = 1) or (Trunc(Aconf.value1_f) = 2), Trunc(Aconf.value1_f), 1)
    else if Aconf.chave = 'nfe_nt_2020_006_data' then
      FConf_Geral.nfe_nt_2020_006_data := StrToDateDef(Aconf.value1_vc, EncodeDate(2021, 04, 05))
    else if Aconf.chave = 'nf_e_excecao_anp_cims_inter_nao_contri' then
    begin
      if not Assigned(FConf_ICMS.nf_exececoes_codigo_anp) then
        FConf_ICMS.nf_exececoes_codigo_anp := vDadosIni.NewStringList(True);

      Aconf.value1_b.Text := StringReplace(Aconf.value1_b.Text, Aconf.value1_b.LineBreak, '|', [rfReplaceAll]);
      FConf_ICMS.nf_exececoes_codigo_anp.Text := vDadosIni.SplitS('|' + Aconf.value1_b.Text + '|', ['|', ',', ';', '.', ' ']).Text;

      for J := Pred(FConf_ICMS.nf_exececoes_codigo_anp.Count) downto 0 do
        if Trim(FConf_ICMS.nf_exececoes_codigo_anp[J]) = '' then
          FConf_ICMS.nf_exececoes_codigo_anp.Delete(J);

    end
    else if Aconf.chave = 'prod_cad_relacao_cst_csosn' then
    begin
      if not Assigned(FConf_ICMS.prod_cad_relacao_cst_csosn) then
        FConf_ICMS.prod_cad_relacao_cst_csosn := vDadosIni.NewStringList(True);
      FConf_ICMS.prod_cad_relacao_cst_csosn.Text := Aconf.value1_b.Text
    end
    else if Aconf.chave = 'nf_e_hab_cst_60_calculo_st_icms' then
      FConf_ICMS.nf_e_hab_cst_60_calculo_st_icms := AsTrueValue(Aconf.value1_f)
    else if Aconf.chave = 'nf_conf_ncm_cfop_piscofins' then
      FConf_PIS.dados_ncm_cfop.Make(Aconf.value1_b)
    else if Aconf.chave = 'nf_ibpt_consulta_tributos' then
    begin                                                       
      Self.Conf_Geral.nf_ibpt_consulta_tributos.Free;
      Self.Conf_Geral.nf_ibpt_consulta_tributos := TCfg_sis(Aconf.Clone);
    end
    else if Aconf.chave = 'nf_s_calculo_versao' then
      Fversao_calc := IfThen(Trunc(Aconf.value1_f) = 2, 2, 1)
    else if Aconf.chave = 'nf_icmsst_cest_v2' then
    begin
      Self.Conf_ICMS.nf_icmsst_cest_v2  := TCest_v2_st.Create;
      Self.Conf_ICMS.nf_icmsst_cest_v2.Configura(Aconf);
    end
    else if Aconf.chave = 'nf_s_difal_base_dupla' then
      Self.Conf_ICMS.UFsBaseDupla := '|' + StrReplace(Aconf.value1_vc, [',', ';', ' ', '.'], '|') + '|'
    else if Aconf.chave = 'nf_campos_default' then
      Self.Conf_Geral.nf_campos_default := Aconf.Clone
    else if Aconf.chave = 'nf_piscofins_bases' then
    begin
      Self.Conf_PIS.nf_piscofins_bases.Free;
      Self.Conf_PIS.nf_piscofins_bases := TCfg_sis(Aconf.Clone);
    end
    else if Aconf.chave = 'nf_piscofins_cst_05_revenda_base_zero' then
      Self.Conf_PIS.nf_piscofins_cst_05_revenda_base_zero := Aconf.value1_f = 1
    else if Aconf.chave = 'nf_desoneracao_zfm_alc' then
      Self.Conf_Geral.nf_desoneracao_zfm_alc.value1_b.Text := Aconf.value1_b.Text
    else if Aconf.chave = 'nfe_info_complementar_op_interna_dest_outra_uf' then
      Self.Conf_Geral.nfe_inf_compl_op_interna_dest_outra_uf := Aconf.AsInteger
    else if Aconf.chave = 'nf_inf_pedido_compra' then
    begin
      Self.Conf_Geral.nf_inf_pedido_compra.Free;
      Self.Conf_Geral.nf_inf_pedido_compra := Aconf.Clone;
    end
    else if Aconf.chave = 'nf_e_cnpj_import_xml' then
    begin
      Self.Conf_Geral.nf_e_cnpj_import_xml.Free;
      Self.Conf_Geral.nf_e_cnpj_import_xml := Aconf.Clone;
    end
    else if Aconf.chave = 'nf_s_icms_interestadual' then
    begin
      Self.Conf_ICMS.nf_s_icms_interestadual.Free;
      Self.Conf_ICMS.nf_s_icms_interestadual := Tnf_s_icms_interestadual(Aconf.Clone);
    end
    else if Aconf.chave = 'nf_e_compra_conferencia' then
      Self.Conf_Geral.nf_e_compra_conferencia := Aconf.Clone
    else if Aconf.chave = 'nfs_devolucao_referencia_por_item' then
      Self.Conf_Geral.nfs_devolucao_referencia_por_item := Aconf.AsBoolean
    else if Aconf.chave = 'rtc_config' then
      Self.Conf_RTC := TConfigGlobalNF_RTC.Create(
        StrToDateDef(Aconf.ReadString('Config', 'ExigirNovosCamposAPartirDe'), Now + 30),
        UpperCase(Copy(Trim(Aconf.ReadString('Config', 'SimplesNacionalOptanteRegimeRegular')), 1, 1)) = 'S'
      )
    else if Aconf.chave = 'hw_cloud_ia_conf' then
      Self.Conf_Geral.UsarMensageriaAI := UpperCase(Trim(
        Copy(Aconf.ReadString('Configuracao', 'UsarServicoMensageria', 'N'), 1, 1)
      )) = 'S'
    {
    else if Aconf.chave ='nf_e_alteracao_preco' then
    begin
      if Aconf.AsBoolean then
        if vDadosIni.PesqPros('NF0223', 'HABILITAR', '', 'NOTAFISCAL', '', Fbuscas, True, False, True) then
        begin
          Self.Conf_Preco.AlteraPrecoNaEntrada := Aconf.ReadString('Conf', 'AlterarPrecoAutomaticoVendaEntradaNF') = 'S';
          Self.Conf_Preco.UsarPercAdicional := Aconf.ReadString('Conf', 'UsarPercentualAdicinalProdEntrada') = 'S';
        end
        else
        begin
          Self.Conf_Preco.AlteraPrecoNaEntrada := False;
          Self.Conf_Preco.UsarPercAdicional := False;
        end;
    end
    }
    else if Aconf.chave ='prod_precos' then
    begin
      vDadosIni.vProduto.Precos.ConfigViaNF(Aconf, vDadosIni.PesqPros('NF0223', 'HABILITAR', '', 'NOTAFISCAL', '', Fbuscas, True, False, True));
      {
      if Aconf.AsBoolean then
        if vDadosIni.PesqPros('NF0223', 'HABILITAR', '', 'NOTAFISCAL', '', Fbuscas, True, False, True) then
        begin
          Self.Conf_Preco.AlteraPrecoNaEntrada := Aconf.ReadString('EntradaNF', 'CalcularAlterarPrecosAoConfirmarNF') = 'S';
          Self.Conf_Preco.UsarPercAdicional    := Aconf.ReadString('EntradaNF', 'PreferirCalcularPreco30_60e90DiasUsandoPercentualAdcicional') = 'S';
          Self.Conf_Preco.UsarPerc30ParaVarejo := Aconf.ReadString('EntradaNF', 'PreferirCalcularPrecoVarejoUsandoPreco30Dias') = 'S';
          Self.Conf_Preco.CalcUsandoMagem      := Aconf.ReadString('Conf'     , 'PreferirGerenciarCampoMargemAoMarkup') = 'S';
        end
        else
        begin
          Self.Conf_Preco.AlteraPrecoNaEntrada := False;
          Self.Conf_Preco.UsarPercAdicional := False;
          Self.Conf_Preco.UsarPerc30ParaVarejo := False;
          Self.Conf_Preco.CalcUsandoMagem := False;
    end;
      }
    end;
  end;
  FConf_ICMS.emp_us_cfg_cst_saida_nfst := vDadosIni.SqlOpen('select us_cfg_cst_saida_nfst from empresa where cod_empresa = %s',
                                                             [vDadosIni.codEmpresa], Fbuscas).FieldByName('us_cfg_cst_saida_nfst').AsString = 'S';
  Fbuscas.Close;
  Finicializado := True;
end;

procedure TConfigGlobalNF.nf_s_lote_faturamento_check;
var
  Aconf: TConfig_sistema_class;
begin
  Aconf := TConfig_sistema_class.getConf('nf_s_lote_faturamento', Fbuscas, StrToInt(vDadosIni.codEmpresa));
  try
    if not Aconf.GetIniFile.ValueExists('Conf', 'ICMSDesoneradoEmbutido') then
      if Aconf.InsertLineConf('Conf', 'UsarObsPedido', 'N') then
        if Aconf.SaveConfDB(Fbuscas).Transaction.InTransaction then
          Fbuscas.Transaction.Commit;
  finally
    FreeAndNil(Aconf);
  end;
end;

//procedure TConfigGlobalNF.reset;
//begin
//  Finicializado := False;
//end;

{ THw_tipo_servico_classList }

function THw_tipo_servico_classList.ExisteServico(
  cod_servico: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].cod_servico = cod_servico) then
    begin
      Result := True;
      Exit;
    end;
end;

function THw_tipo_servico_classList.GetServico(
  Acod_servico: Integer): TTipo_servico_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].cod_servico = Acod_servico) then
    begin
      Result := Self.Items[I];//.Clone;
      Exit;
    end;
end;

{ THw_conf_piscofins_ad_classList }

{function THw_conf_piscofins_ad_classList.GetItem(Index: Integer): THw_conf_piscofins_ad_class;
begin
  Result := THw_conf_piscofins_ad_class(inherited Items[Index]);
end;

function THw_conf_piscofins_ad_classList.get_by_ncm_cfop(Ancm: string;
  Acfop: Integer): THw_conf_piscofins_ad_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Pred(Self.Count) do
    if ((Self.Items[I].ncm = '99999999') or (Self.Items[I].ncm = Ancm)) and
        (Self.Items[I].cfop = Acfop) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

procedure THw_conf_piscofins_ad_classList.Make(AlistConf: TStrings);
var
  Aitem: THw_conf_piscofins_ad_class;
  Astr: string;
begin
  Self.Clear;
  for Astr in AlistConf do
    if Length(vDadosIni.apenasNumeros(vDadosIni.getValue(Astr, 1))) = 8 then
    begin
      Aitem               := THw_conf_piscofins_ad_class.Create;
      Aitem.ncm           := vDadosIni.apenasNumeros(vDadosIni.getValue(Astr, 1));
      Aitem.cfop          := StrToIntDef(vDadosIni.getValue(Astr, 2), -1);
      Aitem.cst           := vDadosIni.apenasNumeros(vDadosIni.getValue(Astr, 3));
      Aitem.nat_rec       := vDadosIni.apenasNumeros(vDadosIni.getValue(Astr, 4));
      Aitem.aliq_pis      := Trim(vDadosIni.getValue(Astr, 5));
      Aitem.aliq_cofins   := Trim(vDadosIni.getValue(Astr, 6));
      Aitem.aliq_r_pis    := Trim(vDadosIni.getValue(Astr, 7));
      Aitem.aliq_r_cofins := Trim(vDadosIni.getValue(Astr, 8));

      Self.Add(Aitem);
    end;
end;

procedure THw_conf_piscofins_ad_classList.SetItem(Index: Integer; const Value: THw_conf_piscofins_ad_class);
begin
  Put(Index, Value);
end;}

{ TConfigGlobalNF_PISCOFINS }

{constructor TConfigGlobalNF_PISCOFINS.Create;
begin
  Fdados_ncm_cfop := THw_conf_piscofins_ad_classList.Create;
  Fnf_piscofins_bases := TCfg_sis.Create;
end;

destructor TConfigGlobalNF_PISCOFINS.Destroy;
begin
  if Assigned(Fdados_ncm_cfop) then
  begin
    Fdados_ncm_cfop.Clear;
    FreeAndNil(Fdados_ncm_cfop);
  end;
  if Assigned(Fnf_piscofins_bases) then
    Fnf_piscofins_bases.Free;

  inherited;
end;}

{ THw_cod_barra_classList }

function THw_cod_barra_classList.GetEAN(Agrupo_prod: Integer;
  Acod_prod, prefixosInvalidosConfs: string): TCod_barra_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].grupo_prod = Agrupo_prod) and (Trim(Self.Items[I].cod_prod) = Trim(Acod_prod)) then
      if vDadosIni.ValidaEAN(TGS1Prefix.GetEanValido(Self.Items[I].cod_barra, prefixosInvalidosConfs)) then
      begin
        Result := Self.Items[I];
        Exit;
      end;
end;

{ THw_nat_op_classList }

function THw_nat_op_classList.get_nat_op(Acfop: Double): TNat_op_class;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].codigo_nop = Acfop) then
    begin
      Result := Self.Items[I];
      Result.alt_est    := IfThen(Result.alt_est = 'N'   , 'N', 'S');
      Result.calc_custo := IfThen(Result.calc_custo = 'N', 'N', 'S');
      Break;
    end;

  if Result = nil then
  begin
    Result := TNat_op_class.Create;
    Result.codigo_nop := Acfop;
    Result.descricao_nop := IfThen(Acfop = 5929, 'Nota Fiscal referente a Cupom fiscal ou NFCe', FloatToStr(Acfop));
    Self.Add(Result);
  end;
end;

{ THw_nbm_estado_class }

function THw_nbm_estado_class.get_ncm_estado(Ancm: string): TNbm_estado_class;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].cod_nbm = Ancm) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

{ THw_mva_ajustada_ncm_class }

function THw_mva_ajustada_ncm_class.get_mva_ajustada(
  Ancm: string): TMva_ajustada_ncm_class;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].cod_ncm = Ancm) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

{ THw_nbm_class }

function THw_nbm_class.get_ncm(Ancm: string): TNbm_class;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].cod_ncm = Ancm) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

{ THw_ibpt_class }

function THw_ibpt_class.get_ibpt(Ancm, Auf: string; Aex: Integer): TIbpt_class;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].codigo = Ancm) and (Self.Items[I].uf = Auf) and (Self.Items[I].ex = Aex) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

{ THw_ref_cupom_fiscal }

function THw_ref_cupom_fiscal.New(Aecf_fab, Acod_mod: string; Anum_doc,
  Aecf_cx: Integer; Adt_doc: TDateTime): TNotafiscal_sped_c114_class;
var
  I: Integer;
begin
  for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    if (ecf_fab = Aecf_fab) and (cod_mod = Acod_mod) and (num_doc = Anum_doc) and (ecf_cx = Aecf_cx) and (dt_doc = Adt_doc) then
    begin
      Result := Self.Items[I];
      Exit;
    end;

  Result := New;
  with Result do
  begin
    ecf_fab := Aecf_fab;
    num_doc := Anum_doc;
    dt_doc  := Adt_doc;
    ecf_cx  := Aecf_cx;
    cod_mod := Acod_mod;
  end;
end;

{ THw_ref_nfce }

function THw_ref_nfce.New(Achave_nfe_ref: string): TNotafiscal_sped_c113_class;
var
  I: Integer;
begin
  for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    if (chave_nfe_ref = Achave_nfe_ref) then
    begin
      Result := Self.Items[I];
      Exit;
    end;

  Result := New;
  with Result do
    chave_nfe_ref := Achave_nfe_ref;
end;

{ THw_nf_inf_compl }

function THw_nf_inf_compl.New(Acod_inf: Integer): TNotafiscal_sped_c110_class;
var
  I: Integer;
begin
  for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    if (cod_inf = Acod_inf) then
    begin
      Result := Self.Items[I];
      Exit;
    end;

  Result := New;
  with Result do
    cod_inf := Acod_inf;
end;

{ THw_inf_compl }

function THw_inf_compl.get_sped_inf_compl(
  Atipo: string): TSped_informacao_complementar_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    if (tipo = Atipo) then
    begin
      Result := Self.Items[I];
      Exit;
    end;
end;

{ THw_notafiscal_pag }

function THw_notafiscal_pag.New(
  Apag: TNotafiscal_pag_class): TNotafiscal_pag_class;
var
  I: Integer;
begin
  for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    if (Apag.tpag = tpag) and (Apag.cod_controle = cod_controle) and // mesmo controle e tipo de pagamento
       ( (not (Apag.tpag in [3, 4])) or                              // quando nao é cartão ja é o suficiente para somar
         (Apag.tpag in [3, 4]) and (Apag.caut = Apag.caut)) then     // se for cartao somente soma com o numero da autorizacao igual
      begin
        Self.Items[I].vpag := Self.Items[I].vpag + Apag.vpag; 
        Result := Self.Items[I];
        Exit;
      end;

  Result := Apag.Clone;
  Self.Add(Result);
end;

{ THw_notasfiscais_class }

constructor THw_notasfiscais_class.Create(AOwner: THw_faturamento);
begin
  inherited Create;
  FOwner := AOwner;
  Fconf_nf := TConfigGlobalNF.Create(FOwner.buscas, 'S');
end;

destructor THw_notasfiscais_class.Destroy;
begin
  if Assigned(Fconf_nf) then FreeAndNil(Fconf_nf);  
  inherited;
end;

function THw_notasfiscais_class.GetItem(Index: Integer): THw_notafiscal_class;
begin
  Result := THw_notafiscal_class(inherited Items[Index]);
end;

function THw_notasfiscais_class.New: THw_notafiscal_class;
begin
  Result := THw_notafiscal_class.Create(FOwner);
  Add(Result);
end;

function THw_notasfiscais_class.New(
  AOwnerPedvenda: THw_pedvenda_class): THw_notafiscal_class;
begin
  Result := THw_notafiscal_class.Create(FOwner, AOwnerPedvenda);
  Add(Result);
end;

procedure THw_notasfiscais_class.SetItem(Index: Integer;
  const Value: THw_notafiscal_class);
begin
  Put(Index, Value);
end;

{ THw_Controles }

function THw_Controles.get_controle(Acodigo_ctrl: Integer): TControles_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    if (codigo_ctrl = Acodigo_ctrl) then
    begin
      Result := Self.Items[I];
      Exit;
    end;
end;

{ THw_produtos_tmp_classList }

procedure THw_produtos_tmp_classList.AddItem(grupo_prod: Integer; cod_prod,
  id_tmp: string; seqid, cod_empresa: Integer);
var
  item: TProdutos_tmp_class;
begin
  if not ExisteItem(grupo_prod, cod_prod) then
  begin
    item             := TProdutos_tmp_class.Create;
    item.grupo_prod  := grupo_prod;
    item.cod_prod    := cod_prod;
    item.id_tmp      := id_tmp;
    item.seqid       := seqid;
    item.cod_empresa := cod_empresa;
    Self.Add(item);
  end;
end;

function THw_produtos_tmp_classList.ExisteItem(grupo_prod: Integer;
  cod_prod: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].grupo_prod = grupo_prod) and (Trim(Self.Items[I].cod_prod) = Trim(cod_prod)) then
    begin
      Result := True;
      Exit;
    end;
end;

function THw_produtos_tmp_classList.GetProduto_tmp(Agrupo_prod: Integer;
  Acod_prod: string): TProdutos_tmp_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].grupo_prod = Agrupo_prod) and (Trim(Self.Items[I].cod_prod) = Trim(Acod_prod)) then
    begin
      Result := Self.Items[I];//.Clone;
      Exit;
    end;
end;

{ THw_boletas_classList }

class function THw_boletas_classList.GetFieldsSql(Aalias: string): string;
begin
  Result := '@n_seq_bol, @cod_empresa, @num_nf_vnd, @data_em_bol, @data_ven_bol, @n_doc_bol, @vl_doc_bol, @cod_nf,' +
            ' @obs_bol, @cod_cliente, @obs_bol1, @sub_serie, @cod_controle_cx, @tipo_emissao, @cod_carga, @seqform';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

{ TConfigGlobalNF_Geral }
{
function TConfigGlobalNF_Geral.nf_campos_default_indicadordepresenca(
  natureza: string): string;
var
  indpres: Integer;
begin
  Result := '9';
  if not Assigned(Fnf_campos_default) then
    Exit;

  indpres := Fnf_campos_default.ReadInteger(IfThen(natureza = 'E', 'Entrada', 'Saida'), 'IndicadorDePresenca', 9);
  case indpres of
    0, 1, 2, 3, 5, 9 : Result := IntToStr(indpres);
    else Result := '9';
  end;
end;  }

//initialization
//  if not Assigned(vDadosIni) then vDadosIni := TSingleton.GetInstance;

end.
