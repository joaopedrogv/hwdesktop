unit opfiscal_model;

interface

uses
  basefb_class,
  hw_strings, Contnrs;

type
  TTributacao = (icm_00_20_51, icm_10_70, icm_30, icm_40, icm_41, icm_50, icm_60, icm_90_comICM_comST, icm_90_comICM_semST, icm_90_semICM_comST, icm_90_semICM_semST, icm_02, icm_15, icm_53, icm_61);
  /// TTipoCalculo -> Comportamento do preenchimento e calculo no sistema. Substitui o campo devolução
  ///  Completo: busca todas as aliquotas sempre e calcula tudo, até a base;
  ///  Parcial: Usuário preenche aliquotas, o sistema irá apenas calcular a base se nao informada
  ///  Nenhum; Usuário deve preencher tudo, até valores
  TTipoCalculo = (tcCompleto, tcParcial, tcNenhum);
  TTipoNotaFiscal = (tnffProdutos, tnffServicos, tnffVeiculosNovos, tnffVeiculosUsados, tnffOutras, tnffDespesas);
  TTipoTributo = (ttICMS, ttICMSST, ttICMSUFDest, ttPISCOFINS, ttIPI, ttISS, ttRetencoes);
  TRetencaoFederal = (rfSemRetencao, rfComRetencaoMin10, rfComRetencaoSemMin); // rfSemRetencao = Não tem retenção, rfComRetencaoMin10 = Sim retem minimo de 10 reais calculado, rfComRetencaoSemMin = Sim independentemente do valor calculado 
//  TCamposBaseCalculo = (cbcValor, cbc)

  TItemFiscal = record
    modeloDoc   : string;
    indiedest   : string;
    iddest      : string;
    consumoFinal: string;
    orig        : string;
    e_s         : string;
    dest_uf     : string;
    regimeCli   : string;
    idenItem    : string;
    conf_bcnf   : TStringIni;
    simples     : Boolean;
    tipoCalc    : TTipoCalculo;
    destCalcST  : Boolean;
    //atributos do item
    quantidade  : Double;
    valor       : Double;
    desconto    : Double;
    frete       : Double;
    seguro      : Double;
    outras      : Double;
    custo       : Double;
    ant_st      : Boolean;
    //tributos calculados
    vipi        : Double;
    vicms       : Double;
    vicmsst     : Double;
    vicmsant    : Double;
    vicmsdifal  : Double;
    vicmsdeson  : Double;
    vpisdeson   : Double;
    vcofinsdeson: Double;
    //bases do calculo parcial
    base        : Double;
    baseST      : Double;
    qtdebc      : Double;

    modbcST     : string;
    cprodanp    : string;
  end;

  TConfTributo = class(TStringIni)
  strict private
    function buildSectionStr(tributo: TTipoTributo; item: TItemFiscal): string;
    function getBCInternal(conf: TStringIni; section: string; item: TItemFiscal; base: Double; ADigit: Smallint): Double;
    function getBCInternalStr(conf: TStringIni; section: string; item: TItemFiscal; formula: Boolean): String;
  public
    function getBC(tributo: TTipoTributo; item: TItemFiscal; base: Double; ADigit: Smallint = -2): Double;
    function getBCEspelho(tributo: TTipoTributo; item: TItemFiscal; formula: Boolean): string;
    procedure setConfBC(tributo: TTipoTributo; ent_sai, modelo: string; section: string; conf: TStringIni);
    procedure WriteDefaultBC(tributo: TTipoTributo; section: string);
    class function GetSectionBC(tributo: TTipoTributo; ent_sai, modelo: string): string;
  end;

  TItemTributo_ICMS = class(TBaseFb_class)
  private
    Ficms_id       : Integer;
    Fconf_icm      : TConfTributo;
    Ftributacao    : Integer;
    Fmotdesicm     : Integer;
    Fcfop          : Integer;
    Faliq_icms     : Double;
    Faliq_fcp      : Double;
    Faliq_red_bc   : Double;
    Faliq_icms_dif : Double;
    Faliq_fcp_dif  : Double;
    Faliq_icms_st  : Double;
    Faliq_mva      : Double;
    Faliq_credsn   : Double;
    FadRemIcms     : Double;
    FadRemIcmsReten: Double;
    Fcsosn: string;
    function GetCst: TTributacao;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
    function calcularIcms: Boolean;
    function calcularIcmsSt: Boolean;
    function calcularReducaoBC: Boolean;
    function calcularDesoneracaoIcms: Boolean;
    property cst           : TTributacao  read GetCst;
  published
    property icms_id       : Integer      read Ficms_id        write Ficms_id;
    property conf_icm      : TConfTributo read Fconf_icm       write Fconf_icm;
    property tributacao    : Integer      read Ftributacao     write Ftributacao;
    property motdesicm     : Integer      read Fmotdesicm      write Fmotdesicm;
    property cfop          : Integer      read Fcfop           write Fcfop;
    property aliq_icms     : Double       read Faliq_icms      write Faliq_icms;
    property aliq_fcp      : Double       read Faliq_fcp       write Faliq_fcp;
    property aliq_red_bc   : Double       read Faliq_red_bc    write Faliq_red_bc;
    property aliq_icms_dif : Double       read Faliq_icms_dif  write Faliq_icms_dif;
    property aliq_fcp_dif  : Double       read Faliq_fcp_dif   write Faliq_fcp_dif;
    property aliq_intra    : Double       read Faliq_icms_st   write Faliq_icms_st;
    property aliq_mva      : Double       read Faliq_mva       write Faliq_mva;
    property aliq_credsn   : Double       read Faliq_credsn    write Faliq_credsn;
    property adRemIcms     : Double       read FadRemIcms      write FadRemIcms;
    property adRemIcmsReten: Double       read FadRemIcmsReten write FadRemIcmsReten;
    property csosn         : string       read Fcsosn          write Fcsosn;
  end;

  TItemTributo_PC = class(TBaseFb_class)
  private
    Fpiscofins_id: Integer;
    Fconf_pc     : TConfTributo;
    Fcst_pc      : string;
    Fmotdespc    : Integer;
    Faliq_pis    : Double;
    Faliq_cofins : Double;
    Fvaliq_pis   : Double;
    Fvaliq_cofins: Double;
    Fnat_rec     : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
    function calcularPisCofins: Boolean;
  published
    property piscofins_id : Integer      read Fpiscofins_id write Fpiscofins_id;
    property conf_pc      : TConfTributo read Fconf_pc      write Fconf_pc;
    property cst_pc       : string       read Fcst_pc       write Fcst_pc;
    property motdespc     : Integer      read Fmotdespc     write Fmotdespc;
    property aliq_pis     : Double       read Faliq_pis     write Faliq_pis;
    property aliq_cofins  : Double       read Faliq_cofins  write Faliq_cofins;
    property valiq_pis    : Double       read Fvaliq_pis    write Fvaliq_pis;
    property valiq_cofins : Double       read Fvaliq_cofins write Fvaliq_cofins;
    property nat_rec      : string       read Fnat_rec      write Fnat_rec;
  end;

  TItemTributo_Ret = class(TBaseFb_class)
  private
    Fret_id: Integer;
    Faliq_ret_pis: Double;
    Faliq_ret_cofins: Double;
    Faliq_ret_ir: Double;
    Faliq_ret_csll: Double;
    Fconf_ret: TConfTributo;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property ret_id         : Integer      read Fret_id          write Fret_id;
    property conf_ret       : TConfTributo read Fconf_ret        write Fconf_ret;
    property aliq_ret_ir    : Double       read Faliq_ret_ir     write Faliq_ret_ir;
    property aliq_ret_csll  : Double       read Faliq_ret_csll   write Faliq_ret_csll;
    property aliq_ret_pis   : Double       read Faliq_ret_pis    write Faliq_ret_pis;
    property aliq_ret_cofins: Double       read Faliq_ret_cofins write Faliq_ret_cofins;
  end;

  TItemTributo_IPI = class //(TBaseFb_class) no futuro se desenvolver para algum cliente que vai calcular ipi
  private
    Fcst: string;
    Fconf_ipi: TConfTributo;
    Faliq_ipi: Double;
  public
    constructor Create;
    destructor Destroy; override;
    function calcularIpi: Boolean;
  published
    property cst     : string       read Fcst      write Fcst;
    property conf_ipi: TConfTributo read Fconf_ipi write Fconf_ipi;
    property aliq_ipi: Double       read Faliq_ipi write Faliq_ipi;
  end;

  TItemTributo_ISSQN = class
  private
    Faliq_iss: Double;
    Fconf_iss: TConfTributo;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property conf_iss: TConfTributo read Fconf_iss write Fconf_iss;
    property aliq_iss: Double read Faliq_iss write Faliq_iss;
  end;

  {$REGION 'TOpFiscalValuess_Model = class(TBaseFbs_class)'}
//  TOpFiscalValuess_Model = class(TBaseFbs_class)
//  private
//    function GetItem(Index: Integer): TOpFiscalValues_Model;
//    procedure SetItem(Index: Integer; const Value: TOpFiscalValues_Model);
//  public
//    function New: TOpFiscalValues_Model;
//
//    property Items[Index: Integer]: TOpFiscalValues_Model read GetItem write SetItem;
//  end;
  {$ENDREGION}

  TItemTributos = class(TBaseFb_class)
  private
    Ficms            : TItemTributo_ICMS;
    Fpiscofins       : TItemTributo_PC;
    Fipi             : TItemTributo_IPI;
    Fiss             : TItemTributo_ISSQN;
    FretTrib         : TItemTributo_Ret;
    Fncm             : string;
    Ftipo_item       : string;
    Fcst_icms        : string;
    Fcst_piscofins   : string;
    Fconsumidor_final: string;
    Fpessoa          : string;
    Fuf              : string;
    Fcidade_ibge     : Integer;
    Ftipo_nota       : Integer;
    Ffinalidade_id   : Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
    function Clone(): TBaseFb_class; override;

    property icms     : TItemTributo_ICMS  read Ficms      write Ficms;
    property piscofins: TItemTributo_PC    read Fpiscofins write Fpiscofins;
    property retTrib  : TItemTributo_Ret   read FretTrib   write FretTrib;
    property ipi      : TItemTributo_IPI   read Fipi       write Fipi;
    property iss      : TItemTributo_ISSQN read Fiss       write Fiss;

  published

    property cidade_ibge     : Integer read Fcidade_ibge      write Fcidade_ibge;
    property consumidor_final: string  read Fconsumidor_final write Fconsumidor_final;
    property indiedest       : Integer read Fcidade_ibge      write Fcidade_ibge;
    property finalidade_id   : Integer read Ffinalidade_id    write Ffinalidade_id;
    property pessoa          : string  read Fpessoa           write Fpessoa;
    property tipo_nota       : Integer read Ftipo_nota        write Ftipo_nota;
    property uf              : string  read Fuf               write Fuf;
    property ncm             : string  read Fncm              write Fncm;
    property tipo_item       : string  read Ftipo_item        write Ftipo_item;
    property cst_icms        : string  read Fcst_icms         write Fcst_icms;
    property cst_piscofins   : string  read Fcst_piscofins    write Fcst_piscofins;
  end;

  TItemTributosList = class(TObjectList)
  private
    function GetItem(Index: Integer): TItemTributos;
    procedure SetItem(Index: Integer; const Value: TItemTributos);
  public
    function New: TItemTributos;
//    function GetCest(Cest, Ncm, CST_Orig, Dest_UF: string; NFe_IdDest, Cest_Variante_Id, Ramo_Ativ_Id: Integer; AliqInter: Double;
//       pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM;
    property Items[Index: Integer]: TItemTributos read GetItem write SetItem;
  end;

  TCondicaoFiscal = record
    cidadeIbgeDest: Integer;
    indiedest: string;
    consumoFinal: string;
    icm_cst: string;
    piscofins_cst: string;
    finalidadeId: Integer;
    ncm: string;
    pessoa: string;
    tipoItem: string;
    tipoNF: TTipoNotaFiscal;
    ufDest: string;
  end;

  TIcmsTributavel_OP = class
  private
    Fmodbc          : string;
    Fvbc            : Double;
    Fpredbc         : Double;
    Fpicms          : Double;
    Fvicms          : Double;
    Fvbcfcp         : Double;
    Fpfcp           : Double;
    Fvfcp           : Double;
  public
    property modbc          : string read Fmodbc           write Fmodbc;
    property vbc            : Double read Fvbc             write Fvbc;
    property predbc         : Double read Fpredbc          write Fpredbc;
    property picms          : Double read Fpicms           write Fpicms;
    property vicms          : Double read Fvicms           write Fvicms;
    property vbcfcp         : Double read Fvbcfcp          write Fvbcfcp;
    property pfcp           : Double read Fpfcp            write Fpfcp;
    property vfcp           : Double read Fvfcp            write Fvfcp;
  end;

  TIcmsTributavel_SN = class
  private
    Fpcredsn        : Double;
    Fvbcsn          : Double;
    Fvcredicmssn    : Double;
  public
    property pcredsn        : Double read Fpcredsn         write Fpcredsn;
    property vbcsn          : Double read Fvbcsn           write Fvbcsn;
    property vcredicmssn    : Double read Fvcredicmssn     write Fvcredicmssn;
  end;

  TIcmsTributavel_ST = class
  private  
    Fmodbcst        : string;
    Fpmvast         : Double;
    Fpredbcst       : Double;
    Fvbcst          : Double;
    Fpicmsst        : Double;
    Fvicmsst        : Double;
    Fvicmsstdest    : Double;
    Fvbcfcpst       : Double;
    Fpfcpst         : Double;
    Fvfcpst         : Double;
  public
    property modbcst        : string read Fmodbcst         write Fmodbcst;
    property pmvast         : Double read Fpmvast          write Fpmvast;
    property predbcst       : Double read Fpredbcst        write Fpredbcst;
    property vbcst          : Double read Fvbcst           write Fvbcst;
    property picmsst        : Double read Fpicmsst         write Fpicmsst;
    property vicmsst        : Double read Fvicmsst         write Fvicmsst;
    property vicmsstdest    : Double read Fvicmsstdest     write Fvicmsstdest;
    property vbcfcpst       : Double read Fvbcfcpst        write Fvbcfcpst;
    property pfcpst         : Double read Fpfcpst          write Fpfcpst;
    property vfcpst         : Double read Fvfcpst          write Fvfcpst;
  end;

  TIcmsTributavel_STRetido = class
  private                    
    Fvbcstret       : Double;
    Fvicmsstret     : Double;
    Fvbcfcpstret    : Double;
    Fpfcpstret      : Double;
    Fvfcpstret      : Double;
    Fpst            : Double;
    Fvicmssubstituto: Double;
  public
    property vbcstret       : Double read Fvbcstret        write Fvbcstret;
    property vicmsstret     : Double read Fvicmsstret      write Fvicmsstret;
    property vbcfcpstret    : Double read Fvbcfcpstret     write Fvbcfcpstret;
    property pfcpstret      : Double read Fpfcpstret       write Fpfcpstret;
    property vfcpstret      : Double read Fvfcpstret       write Fvfcpstret;
    property pst            : Double read Fpst             write Fpst;
    property vicmssubstituto: Double read Fvicmssubstituto write Fvicmssubstituto;
  end;

  TIcmsTributavel_Deson = class
  private
    Fmotdesicms  : Integer;                        
    Fvicmsdeson  : Double;
    Fmotdesicmsst: Integer;
    Fvicmsstdeson: Double;
    Fpicmsdeson  : Double;
    Fpredbc      : Double;
    Fvbc         : Double;
  public
    property vbc         : Double  read Fvbc          write Fvbc;
    property picmsdeson  : Double  read Fpicmsdeson   write Fpicmsdeson;
    property motdesicms  : Integer read Fmotdesicms   write Fmotdesicms;
    property predbc      : Double  read Fpredbc       write Fpredbc;
    property vicmsdeson  : Double  read Fvicmsdeson   write Fvicmsdeson;
    property motdesicmsst: Integer read Fmotdesicmsst write Fmotdesicmsst; // nao esta calculando
    property vicmsstdeson: Double  read Fvicmsstdeson write Fvicmsstdeson; // nao esta calculando
  end;

  TIcmsTributavel_Diferimento = class
  private
    Fpdif           : Double;
    Fvicmsdif       : Double;
    Fpfcpdif        : Double;
    Fvfcpdif        : Double;
    Fvicmsop        : Double;
    Fvfcpefet       : Double;
  public
    property pdif           : Double read Fpdif            write Fpdif;
    property vicmsdif       : Double read Fvicmsdif        write Fvicmsdif;
    property pfcpdif        : Double read Fpfcpdif         write Fpfcpdif;
    property vfcpdif        : Double read Fvfcpdif         write Fvfcpdif;
    property vicmsop        : Double read Fvicmsop         write Fvicmsop;
    property vfcpefet       : Double read Fvfcpefet        write Fvfcpefet;//isso mesmo, no layout da nota esse campo é relacionado para operacao com diferimento,cst 51
  end;

  TIcmsTributavel_Efetivo = class
  private
    Fvbcefet        : Double;
    Fpredbcefet     : Double;
    Fpicmsefet      : Double;
    Fvicmsefet      : Double;
  public
    property vbcefet        : Double read Fvbcefet         write Fvbcefet;
    property predbcefet     : Double read Fpredbcefet      write Fpredbcefet;
    property picmsefet      : Double read Fpicmsefet       write Fpicmsefet;
    property vicmsefet      : Double read Fvicmsefet       write Fvicmsefet;
  end;

  TIcmsTributavel_Mono = class
  private
    Fvicmsmonoreten: Double;
    Fadremicms: Double;
    Fqbcmonoreten: Double;
    Fvicmsmono: Double;
    Fqbcmono: Double;
    Fadremicmsreten: Double;
  public
    property qbcmono       : Double read Fqbcmono        write Fqbcmono;
    property adremicms     : Double read Fadremicms      write Fadremicms;
    property vicmsmono     : Double read Fvicmsmono      write Fvicmsmono;
    property qbcmonoreten  : Double read Fqbcmonoreten   write Fqbcmonoreten;
    property adremicmsreten: Double read Fadremicmsreten write Fadremicmsreten;
    property vicmsmonoreten: Double read Fvicmsmonoreten write Fvicmsmonoreten;
  end;

  TPisCofinsTributavel_Aliq = class
  private       
    Fpaliqpis   : Double;
    Fpaliqcofins: Double;
    Fvbcouqtde  : Double;
  public
    property vbcouqtde  : Double read Fvbcouqtde   write Fvbcouqtde;
    property paliqpis   : Double read Fpaliqpis    write Fpaliqpis;
    property paliqcofins: Double read Fpaliqcofins write Fpaliqcofins;
  end;

  TPisCofinsTributavel_Deson = class
  private
    Fmotdespiscofins: string;
    Fvpiscofinsdeson: Double;
  public
    property motdespiscofins: string read Fmotdespiscofins write Fmotdespiscofins;
    property vpiscofinsdeson: Double read Fvpiscofinsdeson write Fvpiscofinsdeson;
  end;

  TTributavel_Tipo = class
  private
    Fpaliq: Double;
    Fvbc: Double;
  public
    property vbc: Double read Fvbc write Fvbc;
    property paliq: Double read Fpaliq write Fpaliq;
  end;

  TImpostoTributavel = class
  private
    FespelhoCalc: TStringFmt;
  public                         
    constructor Create;
    destructor Destroy; override;

    property espelhoCalc: TStringFmt read FespelhoCalc write FespelhoCalc;
  end;

  TIcmsTributavel = class(TImpostoTributavel)
  private
    Fcst  : string;
    Fcsosn: string;
    Fop   : TIcmsTributavel_OP;
    Fsn   : TIcmsTributavel_SN;
    Fst   : TIcmsTributavel_ST;
    FstRet: TIcmsTributavel_STRetido;
    Fdeson: TIcmsTributavel_Deson;
    Fdif  : TIcmsTributavel_Diferimento;
    Fefet : TIcmsTributavel_Efetivo;
    Fmono : TIcmsTributavel_Mono;
  public
    constructor Create;
    destructor Destroy; override;

    property cst  : string                      read Fcst   write Fcst;
    property csosn: string                      read Fcsosn write Fcsosn;
    property op   : TIcmsTributavel_OP          read Fop    write Fop;
    property sn   : TIcmsTributavel_SN          read Fsn    write Fsn;
    property st   : TIcmsTributavel_ST          read Fst    write Fst;
    property stRet: TIcmsTributavel_STRetido    read FstRet write FstRet;
    property deson: TIcmsTributavel_Deson       read Fdeson write Fdeson;
    property dif  : TIcmsTributavel_Diferimento read Fdif   write Fdif;
    property efet : TIcmsTributavel_Efetivo     read Fefet  write Fefet;
    property mono : TIcmsTributavel_Mono        read Fmono write Fmono;
  end;

  TPisCofinsTributavel = class(TImpostoTributavel)
  private
    Fcst         : string;
    Fmotdes      : Integer;
    Fnatrec      : string;
    Fpcaliq      : TPisCofinsTributavel_Aliq;
    Fpcqtde      : TPisCofinsTributavel_Aliq;
    //Fdeson       : TPisCofinsTributavel_Deson;
    Fvpis        : Double;
    Fvcofins     : Double;
    Fppisdeson   : Double;
    Fpcofinsdeson: Double;
    Fvpisdeson   : Double;
    Fvcofinsdeson: Double;
    Fvbcdeson    : Double;
  public
    constructor Create;
    destructor Destroy; override;

    property cst         : string                     read Fcst          write Fcst;
    property motdes      : Integer                    read Fmotdes       write Fmotdes;
    property natrec      : string                     read Fnatrec       write Fnatrec;
    property pcaliq      : TPisCofinsTributavel_Aliq  read Fpcaliq       write Fpcaliq;
    property pcqtde      : TPisCofinsTributavel_Aliq  read Fpcqtde       write Fpcqtde;
    //property deson       : TPisCofinsTributavel_Deson read Fdeson        write Fdeson;
    property vpis        : Double                     read Fvpis         write Fvpis;
    property vcofins     : Double                     read Fvcofins      write Fvcofins;
    property ppisdeson   : Double                     read Fppisdeson    write Fppisdeson;
    property pcofinsdeson: Double                     read Fpcofinsdeson write Fpcofinsdeson;
    property vbcdeson    : Double                     read Fvbcdeson     write Fvbcdeson;
    property vpisdeson   : Double                     read Fvpisdeson    write Fvpisdeson;
    property vcofinsdeson: Double                     read Fvcofinsdeson write Fvcofinsdeson;
  end;

  TRetencaoTributavel = class(TImpostoTributavel)
  private
    FpCsll    : Double;
    FvCsll    : Double;
    FpPis     : Double;
    FpCofins  : Double;
    FvPis     : Double;
    FvCofins  : Double;
    FpIr      : Double;
    FvBcRetFed: Double;
    FvIr      : Double;
  public
    property vBcRetFed: Double read FvBcRetFed write FvBcRetFed;
    property pIr      : Double read FpIr       write FpIr;
    property vIr      : Double read FvIr       write FvIr;
    property pCsll    : Double read FpCsll     write FpCsll;
    property vCsll    : Double read FvCsll     write FvCsll;
    property pPis     : Double read FpPis      write FpPis;
    property vPis     : Double read FvPis      write FvPis;
    property pCofins  : Double read FpCofins   write FpCofins;
    property vCofins  : Double read FvCofins   write FvCofins;
  end;

  TIPITributavel = class
  private
    Fcst : string;
    Faliq: TTributavel_Tipo;
    Fqtde: TTributavel_Tipo;
    Fvipi: Double;
  public
    constructor Create;
    destructor Destroy; override;

    property cst : string           read Fcst  write Fcst;
    property aliq: TTributavel_Tipo read Faliq write Faliq;
    property qtde: TTributavel_Tipo read Fqtde write Fqtde;
    property vipi: Double           read Fvipi write Fvipi;
  end;

  TIcmsUfDestTributavel = class
  private
    Fvbcufdest     : Double;
    Fpfcpufdest    : Double;
    Fpicmsufdest   : Double;
    Fpicmsinter    : Double;
    Fpicmsinterpart: Double;
    Fvfcpufdest    : Double;
    Fvicmsufdest   : Double;
    Fvicmsufremet  : Double;
    Fvbcfcpufdest  : Double;
  public
    property vbcufdest     : Double read Fvbcufdest      write Fvbcufdest;
    property pfcpufdest    : Double read Fpfcpufdest     write Fpfcpufdest;
    property picmsufdest   : Double read Fpicmsufdest    write Fpicmsufdest;
    property picmsinter    : Double read Fpicmsinter     write Fpicmsinter;
    property picmsinterpart: Double read Fpicmsinterpart write Fpicmsinterpart;
    property vfcpufdest    : Double read Fvfcpufdest     write Fvfcpufdest;
    property vicmsufdest   : Double read Fvicmsufdest    write Fvicmsufdest;
    property vicmsufremet  : Double read Fvicmsufremet   write Fvicmsufremet;
    property vbcfcpufdest  : Double read Fvbcfcpufdest   write Fvbcfcpufdest;
  end;

  TISSQNTributavel = class(TTributavel_Tipo)
  private
    Fvissqn: Double;
  public
    property vissqn: Double read Fvissqn write Fvissqn;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  Math,
  hw_utils,
  Classes;

{ TItemFiscal_ICMS }

function TItemTributo_ICMS.calcularDesoneracaoIcms: Boolean;
begin
  Result := (cst in [icm_40, icm_41, icm_50, icm_90_comICM_comST, icm_90_comICM_semST, icm_90_semICM_comST, icm_90_semICM_semST]) and (motdesicm > 0);
end;

function TItemTributo_ICMS.calcularIcms: Boolean;
begin
  // o 60 esta no teste para calcular o icms efetivo quando for o caso
  Result := (cst in [icm_00_20_51, icm_10_70, icm_30, icm_60, icm_90_comICM_comST,  icm_90_comICM_semST, icm_90_semICM_comST]) or
            ((cst in [icm_40, icm_41, icm_50]) and (motdesicm > 0));
end;

function TItemTributo_ICMS.calcularIcmsSt: Boolean;
begin
  Result := (cst in [icm_10_70, icm_30, icm_90_comICM_comST,  icm_90_semICM_comST]);
end;

function TItemTributo_ICMS.calcularReducaoBC: Boolean;
begin
  Result := (cst in [ icm_00_20_51, icm_10_70, icm_30, icm_90_comICM_comST, icm_90_comICM_semST, icm_90_semICM_comST ]);
end;

constructor TItemTributo_ICMS.Create;
begin
  InitializeObjects;
end;

destructor TItemTributo_ICMS.Destroy;
begin
  if Assigned(Fconf_icm) then
    FreeAndNil(Fconf_icm);
  inherited;
end;

function TItemTributo_ICMS.GetCst: TTributacao;
begin
  Result := TTributacao(Ftributacao);
end;

procedure TItemTributo_ICMS.InitializeObjects;
begin
  Fconf_icm := TConfTributo.Create;
  HasNoTable := True;
end;

{ TItemTributo_PC }

function TItemTributo_PC.calcularPisCofins: Boolean;
begin
  Result := (MatchStr(Self.cst_pc, ['01', '02', '03', '05', '49', '75'])) or
            (MatchStr(Self.cst_pc[1], ['5', '6', '9'])) or (Self.motdespc > 0);
end;

constructor TItemTributo_PC.Create;
begin
  InitializeObjects;
end;

destructor TItemTributo_PC.Destroy;
begin
  if Assigned(Fconf_pc) then
    FreeAndNil(Fconf_pc);
  inherited;
end;

procedure TItemTributo_PC.InitializeObjects;
begin
  //inherited;
  Fconf_pc := TConfTributo.Create;
  HasNoTable := True;
end;

{ TConfTributo }

function TConfTributo.getBCInternal(
  conf: TStringIni;
  section: string;
  item: TItemFiscal;
  base: Double;
  ADigit: Smallint): Double;
begin
  if (item.tipoCalc = tcParcial) and (base > 0) then
    Result := base
  else
    Result := + IfThen((conf.ReadString(section, 'Campo_Valor'             , 'S') = 'S'), item.valor)
              + IfThen((conf.ReadString(section, 'Campo_Seguro'            , 'S') = 'S'), item.seguro)
              + IfThen((conf.ReadString(section, 'Campo_Outras'            , 'S') = 'S'), item.outras)
              + IfThen((conf.ReadString(section, 'Campo_Frete'             , 'S') = 'S'), item.frete)
              + IfThen((conf.ReadString(section, 'Campo_ValorIPI'          , 'S') = 'S'), item.vipi)
              - IfThen((conf.ReadString(section, 'Campo_ValorICMS'         , 'S') = 'S'), item.vicms)
              - IfThen((conf.ReadString(section, 'Campo_ValorICMSST'       , 'S') = 'S'), item.vicmsst)
              - IfThen((conf.ReadString(section, 'Campo_ValorICMSANT'      , 'S') = 'S'), item.vicmsant)
              - IfThen((conf.ReadString(section, 'Campo_ValorICMSDIFAL'    , 'S') = 'S'), item.vicmsdifal)
              - IfThen((conf.ReadString(section, 'Campo_Desconto'          , 'S') = 'S'), item.desconto)
              - IfThen((conf.ReadString(section, 'Campo_Custo'             , 'S') = 'S'), item.custo)
              - IfThen((conf.ReadString(section, 'Campo_Desoneracao_ICMS'  , 'S') = 'S'), item.vicmsdeson)
              - IfThen((conf.ReadString(section, 'Campo_Desoneracao_PIS'   , 'S') = 'S'), item.vpisdeson)
              - IfThen((conf.ReadString(section, 'Campo_Desoneracao_COFINS', 'S') = 'S'), item.vcofinsdeson);
  Result := RoundTo(Result, ADigit);
end;

class function TConfTributo.GetSectionBC(tributo: TTipoTributo; ent_sai,
  modelo: string): string;
var
  section, modelof: string;
begin
  case tributo of
    ttICMS      : section := 'ICMS';
    ttICMSST    : section := 'ICMSST';
    ttICMSUFDest: section := 'ICMSUFDest';
    ttPISCOFINS : section := 'PISCOFINS';
    ttIPI       : section := 'IPI';
    ttISS       : section := 'ISSQN';
    ttRetencoes : section := 'RETTRIB';
  end;

  modelof := PadL(Trim(modelo), 2, '0');
  modelof := IfThen(modelof = '00', Trim(modelo), modelof);

  Result := Format('Composicao_BC_%s_%s_Modelo_%s', [section, IfThen(ent_sai = 'E', 'Entrada', 'Saida'), modelof]);
end;

function TConfTributo.buildSectionStr(tributo: TTipoTributo;
  item: TItemFiscal): string;
var
  section, modelo: string;
begin
  case tributo of
    ttICMS      : section := 'ICMS';
    ttICMSST    : section := 'ICMSST';
    ttICMSUFDest: section := 'ICMSUFDest';
    ttPISCOFINS : section := 'PISCOFINS';
    ttIPI       : section := 'IPI';
    ttISS       : section := 'ISSQN';
    ttRetencoes : section := 'RETTRIB';
  end;

  modelo := PadL(Trim(item.modeloDoc), 2, '0');
  modelo := IfThen(modelo = '00', Trim(item.modeloDoc), modelo);

  Result := Format('Composicao_BC_%s_%s_Modelo_%s',
                   [section, IfThen(item.e_s = 'E', 'Entrada', 'Saida'), modelo]);
end;                                                                                 

function TConfTributo.getBC(tributo: TTipoTributo; item: TItemFiscal;
  base: Double; ADigit: Smallint): Double;
var
  section: string;
begin
  //section := buildSectionStr(tributo, item);
  section := TConfTributo.GetSectionBC(tributo, item.e_s, item.modeloDoc);

  if Assigned(item.conf_bcnf) and item.conf_bcnf.ini.SectionExists(section) and item.conf_bcnf.ReadBool(section, 'Habilitado') then
    Result := getBCInternal(item.conf_bcnf, section, item, base, ADigit)
  else if Self.ini.SectionExists(section) and Self.ReadBool(section, 'Habilitado') then
    Result := getBCInternal(Self, section, item, base, ADigit)
  else if (item.tipoCalc = tcParcial) and (base > 0) then
    Result := RoundTo(base, ADigit)
  else
    case tributo of
      ttICMS,
      ttICMSUFDest,
      ttIPI,
      ttRetencoes,
      ttISS:
        Result := item.valor - item.desconto + item.seguro + item.outras + item.frete;
      ttICMSST:
        Result := item.valor - item.desconto + item.seguro + item.outras + item.frete + item.vipi - item.vicmsdeson - item.vpisdeson - item.vcofinsdeson;
      ttPISCOFINS:
        Result := item.valor - item.desconto + item.seguro + item.outras + item.frete + IfThen(item.e_s = 'E', item.vipi) - item.vicms;
        //Result := item.valor - item.desconto + item.seguro + item.outras + item.frete + IfThen(item.e_s = 'E', item.vipi) - item.vicms4 - item.vicmsst - item.vicmsdifal; Esse seria o padrao partir de 12/2024?
    end;
end;

function TConfTributo.getBCEspelho(tributo: TTipoTributo; item: TItemFiscal;
  formula: Boolean): string;
var
  section: string;
begin
  section := TConfTributo.GetSectionBC(tributo, item.e_s, item.modeloDoc);

  if Assigned(item.conf_bcnf) and item.conf_bcnf.ini.SectionExists(section) and item.conf_bcnf.ReadBool(section, 'Habilitado') then
    Result := getBCInternalStr(item.conf_bcnf, section, item, formula)
  else if Self.ini.SectionExists(section) and Self.ReadBool(section, 'Habilitado') then
    Result := getBCInternalStr(Self, section, item, formula)

  else
    case tributo of
      ttICMS,
      ttICMSUFDest,
      ttIPI,
      ttRetencoes,
      ttISS:
        Result := IfThen(formula, 'VALOR+SEGURO+OUTRAS+FRETE-DESCONTO',
                                  Format('%0.2n+%0.2n+%0.2n+%0.2n-%0.2n',
                                         [item.valor, item.seguro, item.outras, item.frete, item.desconto]));
      ttICMSST:
        Result := IfThen(formula, 'VALOR+SEGURO+OUTRAS+FRETE+IPI-DESCONTO-ICMSDESON-PISDESON-COFINSDESON',
                                  Format('%0.2n+%0.2n+%0.2n+%0.2n+%0.2n-%0.2n-%0.2n-%0.2n-%0.2n',
                                         [item.valor, item.seguro, item.outras, item.frete, item.vipi, item.desconto, item.vicmsdeson, item.vpisdeson, item.vcofinsdeson]));
      ttPISCOFINS:
        Result := IfThen(formula, Format('VALOR+SEGURO+OUTRAS+FRETE%s-DESCONTO-ICMS', [IfThen(item.e_s = 'E', 'IPI')]),
                                  Format('%0.2n+%0.2n+%0.2n+%0.2n%s-%0.2n-%0.2n',
                                         [item.valor, item.seguro, item.outras, item.frete, IfThen(item.e_s = 'E', Format('%0.2n', [item.vipi])), item.desconto, item.vicms]));
    end;
end;

function TConfTributo.getBCInternalStr(conf: TStringIni; section: string;
  item: TItemFiscal; formula: Boolean): String;
begin
  Result :=   IfThen((conf.ReadString(section, 'Campo_Valor'             , 'S') = 'S'), '+' + IfThen(formula, 'VALOR'      , Format('%0.2n', [item.valor])))
            + IfThen((conf.ReadString(section, 'Campo_Seguro'            , 'S') = 'S'), '+' + IfThen(formula, 'SEGURO'     , Format('%0.2n', [item.seguro])))
            + IfThen((conf.ReadString(section, 'Campo_Outras'            , 'S') = 'S'), '+' + IfThen(formula, 'OUTRAS'     , Format('%0.2n', [item.outras])))
            + IfThen((conf.ReadString(section, 'Campo_Frete'             , 'S') = 'S'), '+' + IfThen(formula, 'FRETE'      , Format('%0.2n', [item.frete])))
            + IfThen((conf.ReadString(section, 'Campo_ValorIPI'          , 'S') = 'S'), '+' + IfThen(formula, 'IPI'        , Format('%0.2n', [item.vipi])))
            + IfThen((conf.ReadString(section, 'Campo_ValorICMS'         , 'S') = 'S'), '-' + IfThen(formula, 'ICMS'       , Format('%0.2n', [item.vicms])))
            + IfThen((conf.ReadString(section, 'Campo_ValorICMSST'       , 'S') = 'S'), '-' + IfThen(formula, 'ICMSST'     , Format('%0.2n', [item.vicmsst])))
            + IfThen((conf.ReadString(section, 'Campo_ValorICMSANT'      , 'S') = 'S'), '-' + IfThen(formula, 'ICMSANT'    , Format('%0.2n', [item.vicmsant])))
            + IfThen((conf.ReadString(section, 'Campo_ValorICMSDIFAL'    , 'S') = 'S'), '-' + IfThen(formula, 'ICMSDIFAL'  , Format('%0.2n', [item.vicmsdifal])))
            + IfThen((conf.ReadString(section, 'Campo_Desconto'          , 'S') = 'S'), '-' + IfThen(formula, 'DESCONTO'   , Format('%0.2n', [item.desconto])))
            + IfThen((conf.ReadString(section, 'Campo_Custo'             , 'S') = 'S'), '-' + IfThen(formula, 'CUSTO'      , Format('%0.2n', [item.custo])))
            + IfThen((conf.ReadString(section, 'Campo_Desoneracao_ICMS'  , 'S') = 'S'), '-' + IfThen(formula, 'ICMSDESON'  , Format('%0.2n', [item.vicmsdeson])))
            + IfThen((conf.ReadString(section, 'Campo_Desoneracao_PIS'   , 'S') = 'S'), '-' + IfThen(formula, 'PISDESON'   , Format('%0.2n', [item.vpisdeson])))
            + IfThen((conf.ReadString(section, 'Campo_Desoneracao_COFINS', 'S') = 'S'), '-' + IfThen(formula, 'COFINSDESON', Format('%0.2n', [item.vcofinsdeson])));

  Result := Copy(Result, 2, Length(Result));
end;

procedure TConfTributo.setConfBC(tributo: TTipoTributo;
  ent_sai, modelo: string; section: string; conf: TStringIni);
var
  str: string;
begin
  if conf.ini.SectionExists(section) then
  begin
    //str := buildSectionStr(tributo, item);
    str := TConfTributo.GetSectionBC(tributo, ent_sai, modelo);
    Self.WriteBool(  str, 'Habilitado'             , conf.ReadBool(  section, 'Habilitado'));
    Self.WriteString(str, 'Campo_Valor'            , conf.ReadString(section, 'Campo_Valor', 'S'));
    Self.WriteString(str, 'Campo_Seguro'           , conf.ReadString(section, 'Campo_Seguro', 'S'));
    Self.WriteString(str, 'Campo_Outras'           , conf.ReadString(section, 'Campo_Outras', 'S'));
    Self.WriteString(str, 'Campo_Desconto'         , conf.ReadString(section, 'Campo_Desconto', 'S'));
    Self.WriteString(str, 'Campo_Frete'            , conf.ReadString(section, 'Campo_Frete', 'S'));
    Self.WriteString(str, 'Campo_ValorIPI'         , conf.ReadString(section, 'Campo_ValorIPI'));
    Self.WriteString(str, 'Campo_ValorICMS'        , conf.ReadString(section, 'Campo_ValorICMS', IfThen(tributo = ttPISCOFINS, 'S')));
    Self.WriteString(str, 'Campo_ValorICMSST'      , conf.ReadString(section, 'Campo_ValorICMSST'{, IfThen(tributo = ttPISCOFINS, 'S')}));
    Self.WriteString(str, 'Campo_ValorICMSANT'     , conf.ReadString(section, 'Campo_ValorICMSANT'{, IfThen(tributo = ttPISCOFINS, 'S')}));
    Self.WriteString(str, 'Campo_ValorICMSDIFAL'   , conf.ReadString(section, 'Campo_ValorICMSDIFAL'{, IfThen(tributo = ttPISCOFINS, 'S')}));
    Self.WriteString(str, 'Campo_Custo'            , conf.ReadString(section, 'Campo_Custo'));
    Self.WriteString(str, 'Campo_DesoneracaoICMS'  , conf.ReadString(section, 'Campo_DesoneracaoICMS'));
    Self.WriteString(str, 'Campo_DesoneracaoPIS'   , conf.ReadString(section, 'Campo_DesoneracaoPIS'));
    Self.WriteString(str, 'Campo_DesoneracaoCOFINS', conf.ReadString(section, 'Campo_DesoneracaoCOFINS'));
  end;
end;

procedure TConfTributo.WriteDefaultBC(tributo: TTipoTributo; section: string);
begin
  Self.WriteString(section, 'Campo_Valor'            , 'S');
  Self.WriteString(section, 'Campo_Seguro'           , 'S');
  Self.WriteString(section, 'Campo_Outras'           , 'S');
  Self.WriteString(section, 'Campo_Desconto'         , 'S');
  Self.WriteString(section, 'Campo_Frete'            , 'S');
  Self.WriteString(section, 'Campo_ValorIPI'         , IfThen((tributo = ttICMSST) or ((tributo = ttPISCOFINS) and ContainsText(section, 'Entrada')), 'S', 'N'));
  Self.WriteString(section, 'Campo_ValorICMS'        , IfThen(tributo = ttPISCOFINS, 'S', 'N'));
  Self.WriteString(section, 'Campo_ValorICMSST'      , 'N'{IfThen(tributo = ttPISCOFINS, 'S', 'N')});
  Self.WriteString(section, 'Campo_ValorICMSANT'     , 'N'{IfThen(tributo = ttPISCOFINS, 'S', 'N')});
  Self.WriteString(section, 'Campo_ValorICMSDIFAL'   , 'N'{IfThen(tributo = ttPISCOFINS, 'S', 'N')});
  Self.WriteString(section, 'Campo_Custo'            , 'N');
  Self.WriteString(section, 'Campo_DesoneracaoICMS'  , IfThen(tributo = ttICMSST, 'S', 'N'));
  Self.WriteString(section, 'Campo_DesoneracaoPIS'   , IfThen(tributo = ttICMSST, 'S', 'N'));
  Self.WriteString(section, 'Campo_DesoneracaoCOFINS', IfThen(tributo = ttICMSST, 'S', 'N'));  
end;

{ TIcmsTributavel }

constructor TIcmsTributavel.Create;
begin
  inherited Create;
  Fop    := TIcmsTributavel_OP.Create;
  Fsn    := TIcmsTributavel_SN.Create;
  Fst    := TIcmsTributavel_ST.Create;
  FstRet := TIcmsTributavel_STRetido.Create;
  Fdeson := TIcmsTributavel_Deson.Create;
  Fdif   := TIcmsTributavel_Diferimento.Create;
  Fefet  := TIcmsTributavel_Efetivo.Create;
  Fmono  := TIcmsTributavel_Mono.Create;
end;

destructor TIcmsTributavel.Destroy;
begin
  Fop.Free;
  Fsn.Free;
  Fst.Free;
  FstRet.Free;
  Fdeson.Free;
  Fdif.Free;
  Fefet.Free;
  Fmono.Free;
  inherited;
end;

{ TItemTributo_IPI }

function TItemTributo_IPI.calcularIpi: Boolean;
begin
  Result := (MatchStr(Self.cst, ['00', '49', '50', '99']));
end;

constructor TItemTributo_IPI.Create;
begin
  Fconf_ipi := TConfTributo.Create;
//  HasNoTable := True;
end;

destructor TItemTributo_IPI.Destroy;
begin
  Fconf_ipi.Free;
  inherited;
end;

{ TItemTributo_ISSQN }

constructor TItemTributo_ISSQN.Create;
begin
  Fconf_iss := TConfTributo.Create;
//  HasNoTable := True;
end;

destructor TItemTributo_ISSQN.Destroy;
begin
  Fconf_iss.Free;
  inherited;
end;

{ TPisCofinsTributavel }

constructor TPisCofinsTributavel.Create;
begin
  inherited Create;
  Fpcaliq := TPisCofinsTributavel_Aliq.Create;
  Fpcqtde := TPisCofinsTributavel_Aliq.Create;
  //Fdeson  := TPisCofinsTributavel_Deson.Create;
end;

destructor TPisCofinsTributavel.Destroy;
begin
  Fpcaliq.Free;
  Fpcqtde.Free;
//  Fdeson.Free;
  inherited;
end;

{ TIPITributavel }

constructor TIPITributavel.Create;
begin
  Faliq := TTributavel_Tipo.Create;
  Fqtde := TTributavel_Tipo.Create;
end;

destructor TIPITributavel.Destroy;
begin
  Faliq.Free;
  Fqtde.Free;
  inherited;
end;

{ TItemTributosList }

function TItemTributosList.GetItem(Index: Integer): TItemTributos;
begin
  Result := TItemTributos(inherited Items[Index]);
end;

function TItemTributosList.New: TItemTributos;
begin
  Result           := TItemTributos.Create;
  Add(Result);
end;

procedure TItemTributosList.SetItem(Index: Integer; const Value: TItemTributos);
begin
  Put(Index, Value);
end;

{ TItemTributos }

function TItemTributos.Clone: TBaseFb_class;
var
  myClone: TItemTributos;
begin

  myClone           := (inherited Clone()) as TItemTributos;
  myClone.icms      := (Self.icms.Clone() as TItemTributo_ICMS);
  myClone.piscofins := (Self.piscofins.Clone() as TItemTributo_PC);
  myClone.retTrib   := (Self.retTrib.Clone() as TItemTributo_Ret);
//  myClone.ipi       := TItemTributo_IPI.Create;
//  myClone.iss       := TItemTributo_ISSQN.Create;

  Result := myClone;

end;

constructor TItemTributos.Create;
begin
  InitializeObjects;  
end;

destructor TItemTributos.Destroy;
begin
  Ficms.Free;     
  Fpiscofins.Free;
  FretTrib.Free;
  Fipi.Free;      
  Fiss.Free;       
  inherited;
end;

procedure TItemTributos.InitializeObjects;
begin
  HasNoTable := True;
  Ficms      := TItemTributo_ICMS.Create();
  Fpiscofins := TItemTributo_PC.Create();
  FretTrib   := TItemTributo_Ret.Create();
  Fipi       := TItemTributo_IPI.Create();
  Fiss       := TItemTributo_ISSQN.Create();
end;

{ TImpostoTributavel }

constructor TImpostoTributavel.Create;
begin
  FespelhoCalc := TStringFmt.Create;
end;

destructor TImpostoTributavel.Destroy;
begin
  FespelhoCalc.Free;
  inherited;
end;

{ TItemTributo_Ret }

constructor TItemTributo_Ret.Create;
begin
  InitializeObjects;
end;

destructor TItemTributo_Ret.Destroy;
begin
  if Assigned(Fconf_ret) then
    FreeAndNil(Fconf_ret);
  inherited;
end;

procedure TItemTributo_Ret.InitializeObjects;
begin
//  inherited;
  Fconf_ret := TConfTributo.Create;
  HasNoTable := True;
end;

initialization
  RegisterClass(TItemTributo_ICMS);
  RegisterClass(TItemTributo_Ret);
  RegisterClass(TItemTributo_PC);
  RegisterClass(TItemTributos);

finalization
  UnRegisterClass(TItemTributo_ICMS);
  UnRegisterClass(TItemTributo_Ret);
  UnRegisterClass(TItemTributo_PC);
  UnRegisterClass(TItemTributos);

end.
