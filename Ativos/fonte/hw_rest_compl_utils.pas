unit hw_rest_compl_utils;

interface

uses
  Contnrs,
  sped_lancamento_fiscal_class,
  uClasseConexao;

const
  field_vazio        = 1;
  field_calculado    = 2;
  field_base_icm     = 4;
  field_base_st      = 8;
  field_base_fcp     = 16;
  field_base_fcp_st  = 32;
  field_valor_icm    = 64;
  field_valor_icm_st = 128;
  field_valor_fcp    = 256;
  field_valor_fcp_st = 512;
  field_aliq_icm     = 1024;
  field_aliq_st      = 2048;
  field_aliq_fcp     = 4096;
  field_aliq_fcp_st  = 8192;

type

  TTipoConferenciaEstoque = (tceIgualOuAnterior, tceQualquerDia);

  TH030 = class
  private
    FVL_ICMS_OP: Double;
    FVL_BC_ICMS_ST: Double;
    FVL_ICMS_ST: Double;
    FVL_FCP: Double;
  public
    property VL_ICMS_OP: Double read FVL_ICMS_OP write FVL_ICMS_OP;
    property VL_BC_ICMS_ST: Double read FVL_BC_ICMS_ST write FVL_BC_ICMS_ST;
    property VL_ICMS_ST: Double read FVL_ICMS_ST write FVL_ICMS_ST;
    property VL_FCP: Double read FVL_FCP write FVL_FCP;
  end;

  TRestCompItem = class
  private
    FCOD_PROD: string;
    FNUM_ITEM: SmallInt;
    FCFOP: SmallInt;
    FGRUPO_PROD: Integer;
    FCST_ICMS: string;
    FQUANT_CONV: Double;
    FUNID: string;
  public
    property NUM_ITEM: SmallInt read FNUM_ITEM write FNUM_ITEM;
    property GRUPO_PROD: Integer read FGRUPO_PROD write FGRUPO_PROD;
    property COD_PROD: string read FCOD_PROD write FCOD_PROD;
    property CST_ICMS: string read FCST_ICMS write FCST_ICMS;
    property CFOP: SmallInt read FCFOP write FCFOP;
    property QUANT_CONV: Double read FQUANT_CONV write FQUANT_CONV;
    property UNID: string read FUNID write FUNID;
  end;

  TRestCompEntrada = class(TRestCompItem)
  private
    FCOD_RESP_RET: SmallInt;
    //FQUANT_CONV: Double;
    //FUNID: string;
    FVL_UNIT_CONV: Double;
    FVL_UNIT_ICMS_OP_CONV: Double;
    FVL_UNIT_BC_ICMS_ST_CONV: Double;
    FVL_UNIT_ICMS_ST_CONV: Double;
    FVL_UNIT_FCP_ST_CONV: Double;
    FCOD_DA: string;
    FNUM_DA: string;
    FUnidPrincipal: string;
    FQtdePrincipal: Double;
  public
    property COD_RESP_RET: SmallInt read FCOD_RESP_RET write FCOD_RESP_RET;
    //property QUANT_CONV: Double read FQUANT_CONV write FQUANT_CONV;
    //property UNID: string read FUNID write FUNID;
    property VL_UNIT_CONV: Double read FVL_UNIT_CONV write FVL_UNIT_CONV;
    property VL_UNIT_ICMS_OP_CONV: Double read FVL_UNIT_ICMS_OP_CONV write FVL_UNIT_ICMS_OP_CONV;
    property VL_UNIT_BC_ICMS_ST_CONV: Double read FVL_UNIT_BC_ICMS_ST_CONV write FVL_UNIT_BC_ICMS_ST_CONV;
    property VL_UNIT_ICMS_ST_CONV: Double read FVL_UNIT_ICMS_ST_CONV write FVL_UNIT_ICMS_ST_CONV;
    property VL_UNIT_FCP_ST_CONV: Double read FVL_UNIT_FCP_ST_CONV write FVL_UNIT_FCP_ST_CONV;
    property COD_DA: string read FCOD_DA write FCOD_DA;
    property NUM_DA: string read FNUM_DA write FNUM_DA;
    property UnidPrincipal: string read FUnidPrincipal write FUnidPrincipal;
    property QtdePrincipal: Double read FQtdePrincipal write FQtdePrincipal;
  end;

  TC180 = class(TRestCompEntrada);

  TRestCompSaida = class(TRestCompItem)
  private
    //FNUM_ITEM: SmallInt;
    //FGRUPO_PROD: Integer;
    //FCOD_PROD: string;
    //FCST_ICMS: string;
    //FCFOP: SmallInt;
    FCOD_MOT_REST_COMPL: string;
    //FQUANT_CONV: Double;
    //FUNID: string;
    FVL_UNIT_CONV: Double;
    FVL_UNIT_ICMS_NA_OPERACAO_CONV: Double;
    FVL_UNIT_ICMS_OP_CONV: Double;
    FVL_UNIT_ICMS_OP_ESTOQUE_CONV: Double;
    FVL_UNIT_ICMS_ST_ESTOQUE_CONV: Double;
    FVL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV: Double;
    FVL_UNIT_ICMS_ST_CONV_REST: Double;
    FVL_UNIT_FCP_ST_CONV_REST: Double;
    FVL_UNIT_ICMS_ST_CONV_COMPL: Double;
    FVL_UNIT_FCP_ST_CONV_COMPL: Double;
  public
    //property NUM_ITEM: SmallInt read FNUM_ITEM write FNUM_ITEM;
    //property GRUPO_PROD: Integer read FGRUPO_PROD write FGRUPO_PROD;
    //property COD_PROD: string read FCOD_PROD write FCOD_PROD;
    //property CST_ICMS: string read FCST_ICMS write FCST_ICMS;
    //property CFOP: SmallInt read FCFOP write FCFOP;
    property COD_MOT_REST_COMPL: string read FCOD_MOT_REST_COMPL write FCOD_MOT_REST_COMPL;
    //property QUANT_CONV: Double read FQUANT_CONV write FQUANT_CONV;
    //property UNID: string read FUNID write FUNID;
    property VL_UNIT_CONV: Double read FVL_UNIT_CONV write FVL_UNIT_CONV;
    property VL_UNIT_ICMS_NA_OPERACAO_CONV: Double read FVL_UNIT_ICMS_NA_OPERACAO_CONV write FVL_UNIT_ICMS_NA_OPERACAO_CONV;
    property VL_UNIT_ICMS_OP_CONV: Double read FVL_UNIT_ICMS_OP_CONV write FVL_UNIT_ICMS_OP_CONV;
    property VL_UNIT_ICMS_OP_ESTOQUE_CONV: Double read FVL_UNIT_ICMS_OP_ESTOQUE_CONV write FVL_UNIT_ICMS_OP_ESTOQUE_CONV;
    property VL_UNIT_ICMS_ST_ESTOQUE_CONV: Double read FVL_UNIT_ICMS_ST_ESTOQUE_CONV write FVL_UNIT_ICMS_ST_ESTOQUE_CONV;
    property VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV: Double read FVL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV write FVL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
    property VL_UNIT_ICMS_ST_CONV_REST: Double read FVL_UNIT_ICMS_ST_CONV_REST write FVL_UNIT_ICMS_ST_CONV_REST;
    property VL_UNIT_FCP_ST_CONV_REST: Double read FVL_UNIT_FCP_ST_CONV_REST write FVL_UNIT_FCP_ST_CONV_REST;
    property VL_UNIT_ICMS_ST_CONV_COMPL: Double read FVL_UNIT_ICMS_ST_CONV_COMPL write FVL_UNIT_ICMS_ST_CONV_COMPL;
    property VL_UNIT_FCP_ST_CONV_COMPL: Double read FVL_UNIT_FCP_ST_CONV_COMPL write FVL_UNIT_FCP_ST_CONV_COMPL;
  end;

  TDocumentoF = class
  private
    FModelo: string;
    FSerie: string;
    FNumECF: string;
    FNumDoc: string;
    FChvDFe: string;
    FDataDoc: TDateTime;
  public
    property Modelo: string read FModelo write FModelo;
    property Serie: string read FSerie write FSerie;
    property NumECF: string read FNumECF write FNumECF;
    property NumDoc: string read FNumDoc write FNumDoc;
    property ChvDFe: string read FChvDFe write FChvDFe;
    property DataDoc: TDateTime read FDataDoc write FDataDoc;
  end;

  TC181 = class(TRestCompSaida)
  private
    FDocFiscal: TDocumentoF;
  public
    property DocFiscal: TDocumentoF read FDocFiscal write FDocFiscal;
  end;

  TC186 = class(TRestCompEntrada)
  private
    FDocFiscal: TDocumentoF;
    FCOD_MOT_REST_COMPL: string;
  public
    property COD_MOT_REST_COMPL: string read FCOD_MOT_REST_COMPL write FCOD_MOT_REST_COMPL;
    property DocFiscal: TDocumentoF read FDocFiscal write FDocFiscal;
  end;

  /// <summary>
  ///   Arquivo contabil de produtos para importacao
  /// </summary>
  TArqContProd = class
  private
    FCD_NCM: string;
    FCD_EAN13: string;
    FDS_PRODMERC: string;
    FTP_UNIDADE: string;
    FQT_PROD_ST_COMP: Double;
    FVR_ICMS_ST_COMP: Double;
    FVR_FEM_ST_COMP: Double;
    FQT_PROD_ST_REST: Double;
    FVR_ICMS_ST_REST: Double;
    FVR_FEM_ST_REST: Double;
    FGrupo_prod: Integer;
    FCod_prod: string;
    function GetCD_SPED: string;
  public
    property Grupo_prod: Integer read FGrupo_prod write FGrupo_prod;
    property Cod_prod: string read FCod_prod write FCod_prod;
    property CD_SPED: string read GetCD_SPED;
    property CD_NCM: string read FCD_NCM write FCD_NCM;
    property CD_EAN13: string read FCD_EAN13 write FCD_EAN13;
    property DS_PRODMERC: string read FDS_PRODMERC write FDS_PRODMERC;
    property TP_UNIDADE: string read FTP_UNIDADE write FTP_UNIDADE;
    property QT_PROD_ST_COMP: Double read FQT_PROD_ST_COMP write FQT_PROD_ST_COMP;
    property VR_ICMS_ST_COMP: Double read FVR_ICMS_ST_COMP write FVR_ICMS_ST_COMP;
    property VR_FEM_ST_COMP: Double read FVR_FEM_ST_COMP write FVR_FEM_ST_COMP;
    property QT_PROD_ST_REST: Double read FQT_PROD_ST_REST write FQT_PROD_ST_REST;
    property VR_ICMS_ST_REST: Double read FVR_ICMS_ST_REST write FVR_ICMS_ST_REST;
    property VR_FEM_ST_REST: Double read FVR_FEM_ST_REST write FVR_FEM_ST_REST;
  end;

  TArqContProdList = class(TObjectList)
  private
    function GetItem(Index: Integer): TArqContProd; /// GetItem
    procedure SetItem(Index: Integer; const Value: TArqContProd); /// SetItem
  public
    function New(): TArqContProd;
    property Items[Index: Integer]: TArqContProd read GetItem write SetItem;
  end;

  TICMS_ST_rest_compl_Conf = class
  private
    FOwner           : TConexao;
    FUsarDataEmissao : Boolean;
    FCFOPs           : string;
    Faliq_fcp        : Double;
    Faliq_icm        : Double;
    Fregime          : string;
    //Fconsumidor_final: Boolean;
    FCSTs_S          : string;
    FCSTs_E          : string;
    FCodEmpresa      : Integer;
    FUsarUnidadeDoc    : Boolean;
    FFP_RestCodMotivo: string;
    FAQ_RestCodMotivo: string;
    FAQ_CompCodMotivo: string;
    FUsarReducaoInver: Boolean;
//    FUsarCampo11Saida: Boolean;
    FCriarArqsConfern: Boolean;
    FUsarCFOPPisCofin: Boolean;
    FUsarEstPeriodo  : Boolean;
    FFP_CamposST     : Boolean;
    FMicroEmpPeqPorte: Boolean;
    FAQ_DevEntCodMotivo: string;
    FAQ_DevSemRCCodMotivo: string;
    FAQ_DevEstRestCodMotivo: string;
    FAQ_DevEstCompCodMotivo: string;
    FUsarVL_UNIT_ICMS_OP_CONV: Boolean;
    FCFOPsTransf: string;
    FCSTs_SInterest: string;
//    FUsarVL_UNIT_ICMS_ST_ESTOQUE_CONV: string;
//    FAQ_DevRestCodMotivo: string;
//    FAQ_DevCompCodMotivo: string;
  public
    constructor Create(AOwner: TConexao; ACodEmpresa: Integer);

    procedure executar_leitura;
    //Caso feita a sugestão q usa data dos documento na apuração então setar a variavel como true
    property UsarDataEmissao : Boolean read FUsarDataEmissao  write FUsarDataEmissao;
    property UsarUnidadeDoc  : Boolean read FUsarUnidadeDoc   write FUsarUnidadeDoc;
    property UsarReducaoInver: Boolean read FUsarReducaoInver write FUsarReducaoInver;
//    property UsarCampo11Saida: Boolean read FUsarCampo11Saida write FUsarCampo11Saida;
    property UsarCFOPPisCofin: Boolean read FUsarCFOPPisCofin write FUsarCFOPPisCofin;
    property UsarEstPeriodo  : Boolean read FUsarEstPeriodo   write FUsarEstPeriodo;
    property CriarArqsConfern: Boolean read FCriarArqsConfern write FCriarArqsConfern;
    property CFOPs           : string  read FCFOPs            write FCFOPs;
    property CFOPsTransf     : string  read FCFOPsTransf      write FCFOPsTransf;
    property CSTs_S          : string  read FCSTs_S           write FCSTs_S;
    property CSTs_E          : string  read FCSTs_E           write FCSTs_E;
    property CSTs_SInterest  : string  read FCSTs_SInterest   write FCSTs_SInterest;
    property regisme         : string  read Fregime           write Fregime;
    property aliq_icm        : Double  read Faliq_icm         write Faliq_icm;
    property aliq_fcp        : Double  read Faliq_fcp         write Faliq_fcp;
    //property consumidor_final: Boolean read Fconsumidor_final write Fconsumidor_final;
    property MicroEmpPeqPorte: Boolean read FMicroEmpPeqPorte write FMicroEmpPeqPorte;
    property FP_CamposST     : Boolean read FFP_CamposST      write FFP_CamposST;
    property FP_RestCodMotivo: string  read FFP_RestCodMotivo write FFP_RestCodMotivo;
    property AQ_RestCodMotivo: string  read FAQ_RestCodMotivo write FAQ_RestCodMotivo;
    property AQ_CompCodMotivo: string  read FAQ_CompCodMotivo write FAQ_CompCodMotivo;
    property AQ_DevEntCodMotivo: string read FAQ_DevEntCodMotivo write FAQ_DevEntCodMotivo;
    property AQ_DevSemRCCodMotivo: string read FAQ_DevSemRCCodMotivo write FAQ_DevSemRCCodMotivo;
    property AQ_DevEstRestCodMotivo: string read FAQ_DevEstRestCodMotivo write FAQ_DevEstRestCodMotivo;
    property AQ_DevEstCompCodMotivo: string read FAQ_DevEstCompCodMotivo write FAQ_DevEstCompCodMotivo;
    property UsarVL_UNIT_ICMS_OP_CONV: Boolean read FUsarVL_UNIT_ICMS_OP_CONV write FUsarVL_UNIT_ICMS_OP_CONV;
//    property UsarVL_UNIT_ICMS_ST_ESTOQUE_CONV: string read FUsarVL_UNIT_ICMS_ST_ESTOQUE_CONV write FUsarVL_UNIT_ICMS_ST_ESTOQUE_CONV;
//    property AQ_DevRestCodMotivo: string read FAQ_DevRestCodMotivo write FAQ_DevRestCodMotivo;
//    property AQ_DevCompCodMotivo: string read FAQ_DevCompCodMotivo write FAQ_DevCompCodMotivo;
  end;

  TEstoquePeriodo = class
  private
    FGrupo_Prod: Integer;
    FCod_Prod: string;
    FData: TDateTime;
    FQuantidade: Double;
    FQtdeJaUtil: Double;
  public
    property Grupo_Prod: Integer read FGrupo_Prod write FGrupo_Prod;
    property Cod_Prod: string read FCod_Prod write FCod_Prod;
    property Data: TDateTime read FData write FData;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property QtdeJaUtil: Double read FQtdeJaUtil write FQtdeJaUtil;
  end;



  TModeloC197 = class
  private
    Ftp_aj_doc_ou_It: string;
    Fdescr_compl_aj : string;
    Fcod_aj         : string;
    Ffields_aliq    : Smallint;
    Ffields_base    : Smallint;
    Ffields_valor   : Smallint;
    FBase: Double;
    FAliquota: Double;
    FValor: Double;
  public
    property cod_aj         : string   read Fcod_aj          write Fcod_aj;
    property descr_compl_aj : string   read Fdescr_compl_aj  write Fdescr_compl_aj;
    property tp_aj_doc_ou_It: string   read Ftp_aj_doc_ou_It write Ftp_aj_doc_ou_It;
    property fields_base    : Smallint read Ffields_base     write Ffields_base;//inteiro que armazena todas as configuracoes em binario
    property fields_aliq    : Smallint read Ffields_aliq     write Ffields_aliq;//inteiro que armazena todas as configuracoes em binario
    property fields_valor   : Smallint read Ffields_valor    write Ffields_valor;//inteiro que armazena todas as configuracoes em binario
    property Base           : Double   read FBase            write FBase;
    property Aliquota       : Double   read FAliquota        write FAliquota;
    property Valor          : Double   read FValor           write FValor;
  end;

  TModelosC197 = class(TObjectList)
  private
    function GetItem(Index: Integer): TModeloC197;
    procedure SetItem(Index: Integer; const Value: TModeloC197);
  public
    function New(): TModeloC197;
    property Items[Index: Integer]: TModeloC197 read GetItem write SetItem;

    class function Modelos(tipoLanc195: Integer): TModelosC197;
  end;

  TModeloC195 = class
  private
    FObs: string;
    FTxtCompl: string;
    FTipo: Integer;
    FLancC197: TModelosC197;
  public
    constructor Create;
    destructor Destroy; override;

    property Tipo: Integer read FTipo write FTipo;
    property Obs: string read FObs write FObs;
    property TxtCompl: string read FTxtCompl write FTxtCompl;
    property LancC197: TModelosC197 read FLancC197 write FLancC197;
  end;

  TModelosC195 = class(TObjectList)
  private
    function GetItem(Index: Integer): TModeloC195;
    procedure SetItem(Index: Integer; const Value: TModeloC195);
  public
    function New(): TModeloC195;
    property Items[Index: Integer]: TModeloC195 read GetItem write SetItem;

    class function Modelos(tipoEmiss: Integer): TModelosC195;
  end;

  TModeloEmissao = class
  private
    FCFOP: Integer;
    FNaturezaOp: string;
    FLinhaProdICMS: string;
    FLinhaProdST: string;
    FLinhaProdFCP: string;
    FDadosAdExpressao: string;
    FDadosAdPeriodo: string;
    FTipo: Integer;
    FLancC195: TModelosC195;
    FEmissaoPropria: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    property Tipo: Integer read FTipo write FTipo;
    property CFOP: Integer read FCFOP write FCFOP;
    property NaturezaOp: string read FNaturezaOp write FNaturezaOp;
    property LinhaProdICMS: string read FLinhaProdICMS write FLinhaProdICMS;
    property LinhaProdST: string read FLinhaProdST write FLinhaProdST;
    property LinhaProdFCP: string read FLinhaProdFCP write FLinhaProdFCP;
    property DadosAdExpressao: string read FDadosAdExpressao write FDadosAdExpressao;
    property DadosAdPeriodo: string read FDadosAdPeriodo write FDadosAdPeriodo;
    property EmissaoPropria: Boolean read FEmissaoPropria write FEmissaoPropria;

    property LancC195: TModelosC195 read FLancC195 write FLancC195;
  end;

  TModelosEmissao = class(TObjectList)
  private
    function GetItem(Index: Integer): TModeloEmissao;
    procedure SetItem(Index: Integer; const Value: TModeloEmissao);
  public
    function New: TModeloEmissao;
    function Modelos(tipoRestCompl: Integer): TModelosEmissao; // 1:AQ Restituicao - 2: FP Restituicao - 3: AQ Complementacao

    property Items[Index: Integer]: TModeloEmissao read GetItem write SetItem;
  end;

implementation

uses
  config_sistema_class,
  hw_utils,
  SysUtils,
  StrUtils;

{ TICMS_ST_rest_compl_Conf }

constructor TICMS_ST_rest_compl_Conf.Create(AOwner: TConexao;
  ACodEmpresa: Integer);
begin
  FOwner := AOwner;
  FCodEmpresa := ACodEmpresa;
end;

procedure TICMS_ST_rest_compl_Conf.executar_leitura;
var
  Aconf: TConfig_sistema_class;
  AcfopS, AcfopE, AcfopTE, Astr: string;
  Achange: Boolean;

  procedure WriteConf;
  begin
    with Aconf do
    begin
      value1_b.Clear;
      //WriteString('Conf', 'ApenasOperacaoConsumidorFinal', IfThen( 'S');
      WriteString('Conf', 'CFOP_ENTRADA', AcfopE);
      WriteString('Conf', 'CFOP_SAIDA', AcfopS);
      WriteString('Conf', 'CSTs_ENTRADA', FCSTs_E);
      WriteString('Conf', 'CSTs_SAIDA', FCSTs_S);
      WriteString('Conf', 'CSTs_SAIDA_INTERESTADUAL', FCSTs_SInterest);
      WriteString('Conf', 'CFOP_ENTRADA_TRANSFERENCIA', AcfopTE);
      value1_b.Add('#');
      value1_b.Add('# Informar o CFOP de ICMS(2 digitos) ou CSOSN(3 digitos)  que deseja para a apuração');
      value1_b.Add('');
      WriteString('EFD_ICMS_IPI', 'UsarUnidadeDocFiscal', IfThen(UsarUnidadeDoc, 'S', 'N'));
//      WriteString('EFD_ICMS_IPI', 'UsarCampo11Saida', IfThen(UsarCampo11Saida, 'S', 'N'));
      WriteString('EFD_ICMS_IPI', 'UsarCfopApuracaoPisCofins', IfThen(UsarCFOPPisCofin, 'S', 'N'));
      WriteString('EFD_ICMS_IPI', 'CriarArquivosConferencia', IfThen(CriarArqsConfern, 'S', 'N'));
      WriteString('EFD_ICMS_IPI', 'MicroEmpresaOuPequenoPorte', IfThen(MicroEmpPeqPorte, 'S', 'N'));
      WriteString('EFD_ICMS_IPI', 'UsarVL_UNIT_ICMS_OP_CONV', IfThen(UsarVL_UNIT_ICMS_OP_CONV, 'S', 'N'));      
//      WriteString('EFD_ICMS_IPI', 'UsarVL_UNIT_ICMS_ST_ESTOQUE_CONV', IfThen(UsarVL_UNIT_ICMS_ST_ESTOQUE_CONV, 'S', 'N'));            
      value1_b.Add('#');
      value1_b.Add('# A criterio de cada UF o campo 11(VL_UNIT_ICMS_OP_CONV) nas saídas deve ou não ser preechido');
      value1_b.Add('# MicroEmpresaOuPequenoPorte vai definir se o sistema irá efetuar a restituição conforme Anexo XV RICMS 2002 2 Parte 1 Cap III Sec II');
      value1_b.Add('#  * Subsec IV Art. 23 § 6º (Restituição Fato Presumido Não Realizado)');
      value1_b.Add('#  * Subsec IV-A Art. 31-A Parágrafo único (Complemento Aspecto Quantitativo)');
      value1_b.Add('#  * Subsec IV-A Art. 31-C § 3º  (Restituição Aspecto Quantitativo)');
      value1_b.Add('');
      WriteString('FatoPresumidoNaoRealizado', 'PreencherCamposST'      , IfThen(FP_CamposST, 'S', 'N'));
      WriteString('FatoPresumidoNaoRealizado', 'CodigoMotivoRestituicao', FP_RestCodMotivo);
      WriteString('AspectoQuantitativo'      , 'CodigoMotivoRestituicao', AQ_RestCodMotivo);
      WriteString('AspectoQuantitativo'      , 'CodigoMotivoComplemento', AQ_CompCodMotivo);
      WriteString('AspectoQuantitativo'      , 'CodigoMotivoDevolucaoEntrada', AQ_DevEntCodMotivo);
      WriteString('AspectoQuantitativo'      , 'CodigoMotivoDevolucaoSaidaSemRestComp', AQ_DevSemRCCodMotivo);
      WriteString('AspectoQuantitativo'      , 'CodigoMotivoDevolucaoSaidaEstornoRest', AQ_DevEstRestCodMotivo);
      WriteString('AspectoQuantitativo'      , 'CodigoMotivoDevolucaoSaidaEstornoComp', AQ_DevEstCompCodMotivo);
      value1_b.Add('#Caso as configurações de código não forem preenchidas o sistema não irá usar os dados relacionados');
    end;
  end;

begin
  Achange := False;
  Aconf := TConfig_sistema_class.Create;
  try
    FCFOPs  := '';
    FCSTs_E := '10,30,60,70,90';
    FCSTs_S := '10,30,60,70,90';
    FCSTs_SInterest := '00';
    FCFOPsTransf := '';

    FOwner.SqlOpen('select es.aliq_intra, es.pfcp, e.regime, e.usar_reducao_invertida' +
                   ' from empresa e' +
                   ' inner join estados es on es.codigo_uf = e.uf_emp' +
                   ' where e.cod_empresa = %d', [FcodEmpresa]);
    Faliq_icm        := FOwner.QrAux.FieldByName('aliq_intra').AsFloat;
    Faliq_fcp        := FOwner.QrAux.FieldByName('pfcp').AsFloat;
    Fregime          := Trim(FOwner.QrAux.FieldByName('regime').AsString);
    UsarReducaoInver := Trim(FOwner.QrAux.FieldByName('usar_reducao_invertida').AsString) = 'S';

    AcfopE := '';
    AcfopS := '';
    if Pos('SIMPLES', Fregime) = 1 then
    begin
      FOwner.SqlOpen('select codigo_nop from nat_op where CREDITO_PIS_COFINS = ''S'' and CODIGO_NOP < 4000').First;
      while not FOwner.QrAux.Eof do
      begin
        AcfopE := AcfopE + IfThen(FOwner.QrAux.RecNo > 1, ',') +  IntToStr(Trunc(FOwner.QrAux.FieldByName('codigo_nop').AsFloat));
        FOwner.QrAux.Next;
      end;

      FOwner.SqlOpen('select codigo_nop from nat_op where RECEITA_PIS_COFINS = ''S'' and CODIGO_NOP > 4999').First;
      while not FOwner.QrAux.Eof do
      begin
        AcfopS := AcfopS + IfThen(FOwner.QrAux.RecNo > 1, ',') + IntToStr(Trunc(FOwner.QrAux.FieldByName('codigo_nop').AsFloat));
        FOwner.QrAux.Next;
      end;
    end;

    AcfopE := IfThen(AcfopE = '', '1102,1403,2102,2403', AcfopE);
    AcfopS := IfThen(AcfopS = '', '5102,5405,6102,6403', AcfopS);
    AcfopTE := IfThen(AcfopTE = '', '1409,1152,2409,2152', AcfopE);

    with Aconf.SetValuesFrom(FOwner.SqlOpen('select * from config_sistema where chave = ''icms_st_rest_comp'' and cod_empresa = %d', [FCodEmpresa])) do
      if chave = ''  then
      begin
        ativo := 1;
        chave := 'icms_st_rest_comp';
        cod_empresa := FcodEmpresa;
        display_ := 'Configuração para Complemento/Ressarcimento do ICMS ST';
        tag := ';icmsst;icms;st;ressarcimento;complemento;restituicao;';
        type1_ := typeBlob;
        {WriteString('Conf', 'ApenasOperacaoConsumidorFinal', 'S');
        WriteString('Conf', 'CFOP_ENTRADA', AcfopE);
        WriteString('Conf', 'CFOP_SAIDA', AcfopS);
        value1_b.Add('');
        //WriteString('EFD_ICMS_IPI', 'UsarDataEmissao', 'N');
        WriteString('EFD_ICMS_IPI', 'UsarUnidadeDocFiscal', 'S');
        WriteString('EFD_ICMS_IPI', 'UsarCampo11Saida', 'N');
        WriteString('EFD_ICMS_IPI', 'UsarCfopApuracaoPisCofins', 'S');
        WriteString('EFD_ICMS_IPI', 'CriarArquivosConferencia', 'S');
        WriteString('EFD_ICMS_IPI', 'MicroEmpresaOuPequenoPorte', 'N');
        value1_b.Add('# MicroEmpresaOuPequenoPorte vai definir se o sistema irá efetuar a restituição conforme Anexo XV RICMS 2002 2 Parte 1 Cap III Sec II');
        value1_b.Add('#  * Subsec IV Art. 23 § 6º (Restituição Fato Presumido Não Realizado)');
        value1_b.Add('#  * Subsec IV-A Art. 31-A Parágrafo único (Complemento Aspecto Quantitativo)');
        value1_b.Add('#  * Subsec IV-A Art. 31-C § 3º  (Restituição Aspecto Quantitativo)');
        value1_b.Add('');
        value1_b.Add('#A criterio de cada UF o campo 11(VL_UNIT_ICMS_OP_CONV) nas saídas deve ou não ser preechido');
        value1_b.Add('');
        WriteString('FatoPresumidoNaoRealizado', 'PreencherCamposST'      , 'S');
        WriteString('FatoPresumidoNaoRealizado', 'CodigoMotivoRestituicao', '200');
        WriteString('AspectoQuantitativo'      , 'CodigoMotivoRestituicao', '100');
        WriteString('AspectoQuantitativo'      , 'CodigoMotivoComplemento', '300');
        value1_b.Add('#Caso as configurações de código não forem preenchidas o sistema não irá usar os dados relacionados');}

        Achange := True;
      end;
    Aconf.AtivarMapeamentoKeys;

    //Fconsumidor_final := Trim(Aconf.ReadString('Conf', 'ApenasOperacaoConsumidorFinal', 'S')) = 'S';

    Astr := Trim(Aconf.ReadString('Conf', 'CFOP_ENTRADA', ''));
    if Astr = ''  then
    begin
      Aconf.WriteString('Conf', 'CFOP_ENTRADA', AcfopE);
      Achange := True;
    end
    else
      AcfopE := Astr;

    Astr := Trim(Aconf.ReadString('Conf', 'CFOP_SAIDA', ''));
    if Astr = '' then
    begin
      Aconf.WriteString('Conf', 'CFOP_SAIDA', AcfopS);
      Achange := True;
    end
    else
      AcfopS := Astr;

    Astr := Trim(Aconf.ReadString('Conf', 'CFOP_ENTRADA_TRANSFERENCIA', ''));
    if Astr = '' then
    begin
      Aconf.WriteString('Conf', 'CFOP_ENTRADA_TRANSFERENCIA', AcfopTE);
      Achange := True;
    end
    else
      AcfopTE := Astr;

    FCFOPs := AcfopE + ',' + AcfopS;

    FCSTs_E := Trim(Aconf.ReadString('Conf', 'CSTs_ENTRADA', FCSTs_E));
    FCSTs_S := Trim(Aconf.ReadString('Conf', 'CSTs_SAIDA', FCSTs_S));
    FCSTs_SInterest := Trim(Aconf.ReadString('Conf', 'CSTs_SAIDA_INTERESTADUAL', FCSTs_SInterest));

    FCFOPsTransf := AcfopTE;

    UsarDataEmissao  := Aconf.ReadString('EFD_ICMS_IPI', 'UsarDataEmissao', 'N') = 'S';
    UsarUnidadeDoc   := Aconf.ReadString('EFD_ICMS_IPI', 'UsarUnidadeDocFiscal', 'S') = 'S';
//    UsarCampo11Saida := Aconf.ReadString('EFD_ICMS_IPI', 'UsarCampo11Saida', 'N') = 'S';
    UsarCFOPPisCofin := Aconf.ReadString('EFD_ICMS_IPI', 'UsarCfopApuracaoPisCofins', 'S') = 'S';
    CriarArqsConfern := Aconf.ReadString('EFD_ICMS_IPI', 'CriarArquivosConferencia', 'S') = 'S';
    MicroEmpPeqPorte := Aconf.ReadString('EFD_ICMS_IPI', 'MicroEmpresaOuPequenoPorte', 'N') = 'S';
    UsarVL_UNIT_ICMS_OP_CONV := Aconf.ReadString('EFD_ICMS_IPI', 'UsarVL_UNIT_ICMS_OP_CONV', 'N') = 'S';
//    UsarVL_UNIT_ICMS_ST_ESTOQUE_CONV := Aconf.ReadString('EFD_ICMS_IPI', 'UsarVL_UNIT_ICMS_ST_ESTOQUE_CONV', 'S') = 'S';
    FP_CamposST      := Aconf.ReadString('FatoPresumidoNaoRealizado', 'PreencherCamposST', 'S') = 'S';
    FP_RestCodMotivo := Aconf.ReadString('FatoPresumidoNaoRealizado', 'CodigoMotivoRestituicao', '200');
    AQ_RestCodMotivo := Aconf.ReadString('AspectoQuantitativo'      , 'CodigoMotivoRestituicao', '100');
    AQ_CompCodMotivo := Aconf.ReadString('AspectoQuantitativo'      , 'CodigoMotivoComplemento', '300');
    AQ_DevEntCodMotivo     := Aconf.ReadString('AspectoQuantitativo', 'CodigoMotivoDevolucaoEntrada', '400');
    AQ_DevSemRCCodMotivo   := Aconf.ReadString('AspectoQuantitativo', 'CodigoMotivoDevolucaoSaidaSemRestComp', '500');
    AQ_DevEstRestCodMotivo := Aconf.ReadString('AspectoQuantitativo', 'CodigoMotivoDevolucaoSaidaEstornoRest', '600');
    AQ_DevEstCompCodMotivo := Aconf.ReadString('AspectoQuantitativo', 'CodigoMotivoDevolucaoSaidaEstornoComp', '800');

    if Achange or Aconf.KesyChanges then
    begin
      WriteConf;
      if Aconf.SaveConfDB(FOwner.QrAux).Transaction.InTransaction then
        FOwner.QrAux.Transaction.Commit;
    end;

  finally
    FreeAndNil(Aconf);
  end;
end;

{ TArqContProd }

function TArqContProd.GetCD_SPED: string;
begin
  Result := 'P' + PadL(IntToStr(Grupo_prod) + Trim(Cod_prod), 16, '0');
end;

{ TArqContProdList }

function TArqContProdList.GetItem(Index: Integer): TArqContProd;
begin
  Result := TArqContProd(Inherited Items[Index]);
end;

function TArqContProdList.New: TArqContProd;
begin
  Result := TArqContProd.Create();
  Add(Result);
end;

procedure TArqContProdList.SetItem(Index: Integer;
  const Value: TArqContProd);
begin
  Put(Index, Value);
end;

{ TModelosC197 }

function TModelosC197.GetItem(Index: Integer): TModeloC197;
begin
  Result := TModeloC197(Inherited Items[Index]);
end;

class function TModelosC197.Modelos(tipoLanc195: Integer): TModelosC197;
begin
  Result := TModelosC197.Create;

  if (tipoLanc195 = 99) or (tipoLanc195 = 1) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG91990011';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_icm_st) + Ord(field_valor_fcp_st);
    end;

  //Entrada
  if (tipoLanc195 = 99) or (tipoLanc195 = 2) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG11900011';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_fcp_st);
    end;
  //
    //Entrada
  if (tipoLanc195 = 99) or (tipoLanc195 = 3) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG91000218';
      descr_compl_aj  := 'Restituição FEM – Substituição Tributária (Ressarcimento)';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_fcp_st);
    end;

  if (tipoLanc195 = 99) or (tipoLanc195 = 4) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG11000012';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_icm_st);
    end;

  if (tipoLanc195 = 99) or (tipoLanc195 = 5) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG91000218';
      descr_compl_aj  := 'Restituição FEM – Substituição Tributária (Abatimento)';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_fcp_st);
    end;

  if (tipoLanc195 = 99) or (tipoLanc195 = 6) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG10000013';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_icm_st);
    end;

  if (tipoLanc195 = 99) or (tipoLanc195 = 7) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG91000218';
      descr_compl_aj  := 'Restituição FEM – Substituição Tributária (Creditamento)';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_fcp_st);
    end;

  if (tipoLanc195 = 99) or (tipoLanc195 = 8) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG10000014';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_icm);
    end;

    //Aspecto Quantitativo

  if (tipoLanc195 = 99) or (tipoLanc195 = 9) then
  begin
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG41000015';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_icm_st) + Ord(field_valor_fcp_st);
    end;

    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG21000018';
      descr_compl_aj  := 'Estorno do FEM - adicionado ao ICMS ST';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_fcp_st);
    end;

    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG91000018';
      descr_compl_aj  := 'Débito do FEM - adicionado ao ICMS ST';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_fcp_st);
    end;
  end;


  if (tipoLanc195 = 99) or (tipoLanc195 = 10) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG71010010';
      descr_compl_aj  := 'Complemento do ICMS ST – Aspecto Quantitativo – Extemporâneo';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_icm_st);
    end;

  if (tipoLanc195 = 99) or (tipoLanc195 = 11) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG71010020';
      descr_compl_aj  := 'Complemento do FEM – Aspecto Quantitativo – Extemporâneo';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_fcp_st);
    end;

  if (tipoLanc195 = 99) or (tipoLanc195 = 12) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG11000015';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_icm_st);
    end;

  if (tipoLanc195 = 99) or (tipoLanc195 = 13) then
    with Result.New do
    begin
      tp_aj_doc_ou_It := 'doc';
      cod_aj          := 'MG91000218';
      descr_compl_aj  := 'Restituição FEM – Substituição Tributária (Aspecto quantitativo)';
      fields_base     := Ord(field_vazio);
      fields_aliq     := Ord(field_vazio);
      fields_valor    := Ord(field_valor_fcp_st);
    end;
end;

function TModelosC197.New: TModeloC197;
begin
  Result := TModeloC197.Create();
  Add(Result);
end;

procedure TModelosC197.SetItem(Index: Integer; const Value: TModeloC197);
begin
  Put(Index, Value);
end;

{ TModelosC195 }

function TModelosC195.GetItem(Index: Integer): TModeloC195;
begin
  Result := TModeloC195(Inherited Items[Index]);
end;

class function TModelosC195.Modelos(tipoEmiss: Integer): TModelosC195;
begin
  Result := TModelosC195.Create;

  if (tipoEmiss = 99) or (tipoEmiss = 1) then
  begin
    with Result.New do
    begin
      Tipo := 1;
      Obs := 'Restituição de ICMS ST + FEM – Ressarcimento junto a sujeito passivo por substituição';
      TxtCompl := 'Refêrente ao período de %s a %s';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;

    with Result.New do
    begin
      Tipo := 2;
      Obs := 'Restituição de ICMS ST – Ressarcimento';
      TxtCompl := 'Informar a Data da Autorização dada pela DF';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;

    with Result.New do
    begin
      Tipo := 3;
      Obs := 'Restituição de Fundo de Erradicação da Miséria – FEM';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;
  end;

  if (tipoEmiss = 99) or (tipoEmiss = 2) then
  begin
    with Result.New do
    begin
      Tipo := 4;
      Obs := 'Restituição de ICMS ST – Abatimento';
      TxtCompl := 'Refêrente ao período de %s a %s';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;

    with Result.New do
    begin
      Tipo := 5;
      Obs := 'Restituição de Fundo de Erradicação da Miséria – FEM';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;
  end;

  if (tipoEmiss = 99) or (tipoEmiss = 3) then
  begin
    with Result.New do
    begin
      Tipo := 6;
      Obs := 'Restituição de ICMS ST – Creditamento';
      TxtCompl := 'Refêrente ao período de %s a %s';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;

    with Result.New do
    begin
      Tipo := 7;
      Obs := 'Restituição de Fundo de Erradicação da Miséria – FEM';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;
  end;

  if (tipoEmiss = 99) or (tipoEmiss = 4) then
  begin
    with Result.New do
    begin
      Tipo := 8;
      Obs := 'Creditamento ICMS OP - § 10 do art. 66 do RICMS';
      TxtCompl := 'Refêrente ao período de %s a %s';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;
  end;

    //Aspecto Quantitativo
  if (tipoEmiss = 99) or (tipoEmiss = 5) then
  begin
    with Result.New do
    begin
      Tipo := 9;
      Obs := 'Complemento de ICMS ST + FEM – Aspecto quantitativo';
      TxtCompl := 'Refêrente ao período de %s a %s';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;

    with Result.New do
    begin
      Tipo := 10;
      Obs := 'Complemento de ICMS ST – Aspecto quantitativo – Lançamento Extemporâneo';
      TxtCompl := 'Refêrente ao período de %s a %s';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;

    with Result.New do
    begin
      Tipo := 11;
      Obs := 'Complemento de FEM – Aspecto quantitativo – Lançamento Extemporâneo';
      TxtCompl := 'Refêrente ao período de %s a %s';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;
  end;

  if (tipoEmiss = 99) or (tipoEmiss = 6) then
  begin
    with Result.New do
    begin
      Tipo := 12;
      Obs := 'Restituição de ICMS ST – Aspecto quantitativo';
      TxtCompl := 'Refêrente ao período de %s a %s';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;

    with Result.New do
    begin
      Tipo := 13;
      Obs := 'Restituição de Fundo de Erradicação da Miséria – FEM';
      //LancC197 := TModelosC197.Modelos(Tipo);
    end;
  end;
end;

function TModelosC195.New: TModeloC195;
begin
  Result := TModeloC195.Create();
  Add(Result);
end;

procedure TModelosC195.SetItem(Index: Integer; const Value: TModeloC195);
begin
  Put(Index, Value);
end;

{ TModelosEmissao }

function TModelosEmissao.GetItem(Index: Integer): TModeloEmissao;
begin
  Result := TModeloEmissao(inherited Items[Index]);
end;

function TModelosEmissao.Modelos(tipoRestCompl: Integer): TModelosEmissao;
begin
  Result := Self;
  // 1:AQ Restituicao - 2: FP Restituicao - 3: AQ Complementacao
  Self.Clear;
  if (tipoRestCompl = 9) or (tipoRestCompl = 2) then
  begin
    with New do
    begin
      Tipo := 1;
      CFOP := 5603;
      NaturezaOp := 'Ressarcimento de ICMS/ST';
      LinhaProdST := 'Valor da Restituição de ICMS ST %n';
      LinhaProdFCP := 'Valor da Restituição de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM %n';
      DadosAdExpressao := 'Ressarcimento de ICMS/ST - art. 27 da Parte 1 do Anexo XV do RICMS';
      DadosAdPeriodo := 'Refêrente ao período de %s a %s';
      //LancC195 := TModelosC195.Modelos(Tipo);
    end;

    with New do
    begin
      Tipo := 2;
      CFOP := 1603;
      NaturezaOp := 'Restituição de ICMS/ST - Abatimento';
      LinhaProdST := 'Valor da Restituição de ICMS ST %n';
      LinhaProdFCP := 'Valor da Restituição de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM %n';
      DadosAdExpressao := 'Restituição de ICMS/ST- art. 28 da Parte 1 do Anexo XV do RICMS';
      DadosAdPeriodo := 'Refêrente ao período de %s a %s';
      //LancC195 := TModelosC195.Modelos(Tipo);
    end;

    with New do
    begin
      Tipo := 3;
      CFOP := 1603;
      NaturezaOp := 'Restituição de ICMS/ST- Creditamento';
      LinhaProdST := 'Valor da Restituição de ICMS ST %n';
      LinhaProdFCP := 'Valor da Restituição de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM %n';
      DadosAdExpressao := 'Restituição de ICMS/ST - art. 29 da Parte 1 do Anexo XV do RICMS';
      DadosAdPeriodo := 'Refêrente ao período de %s a %s';
      //LancC195 := TModelosC195.Modelos(Tipo);
    end;

    with New do
    begin
      Tipo := 4;
      CFOP := 1949;
      NaturezaOp := 'Restituição de ICMS OP';
      LinhaProdICMS := 'Valor da Restituição de ICMS Operação Própria %n';
      DadosAdExpressao := 'Creditamento de ICMS OP - § 10-A do art. 66 do RICMS';
      DadosAdPeriodo := 'Refêrente ao período de %s a %s';
      //LancC195 := TModelosC195.Modelos(Tipo);
    end;
  end;

  if (tipoRestCompl = 9) or (tipoRestCompl = 3) then
    with New do
    begin
      Tipo := 5;
      CFOP := 5949;
      NaturezaOp := 'Complemento de ICMS ST – Aspecto quantitativo';
      LinhaProdST := 'Valor da Complementação de ICMS ST %n';
      LinhaProdFCP := 'Valor da Complementação de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM %n';
      DadosAdPeriodo := 'Refêrente ao período de %s a %s';
      //LancC195 := TModelosC195.Modelos(Tipo);
    end;

  if (tipoRestCompl = 9) or (tipoRestCompl = 1) then
    with New do
    begin
      Tipo := 6;
      CFOP := 1603;
      NaturezaOp := 'Restituição de ICMS ST – Aspecto quantitativo';
      LinhaProdST := 'Valor da Restituição de ICMS ST %n';
      LinhaProdFCP := 'Valor da Restituição de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM %n';
      DadosAdPeriodo := 'Refêrente ao período de %s a %s';
      //LancC195 := TModelosC195.Modelos(Tipo);
    end;

//  with New do
//  begin
//    CFOP := 9999;
//    NaturezaOp := 'Modelo personalizado - Restituição ou Complemento de ICMS ST';
//    LinhaProdST := 'Valor da Restituição/Complementação de ICMS ST %n';
//    LinhaProdFCP := 'Valor da Restituição/Complementação de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM %n';
//    LinhaProdICMS := 'Valor da Restituição/Complementação de ICMS Operação Própria %n';
//    DadosAdExpressao := 'Expressão dos dados adicionais';
//    DadosAdPeriodo := 'Refêrente ao período de %s a %s';
//  end;

end;

function TModelosEmissao.New: TModeloEmissao;
begin
  Result := TModeloEmissao.Create;
  Add(Result);
end;

procedure TModelosEmissao.SetItem(Index: Integer;
  const Value: TModeloEmissao);
begin
  Put(Index, Value);
end;

{ TModeloEmissao }

constructor TModeloEmissao.Create;
begin
  FLancC195 := TModelosC195.Create;
end;

destructor TModeloEmissao.Destroy;
begin
  FLancC195.Clear;
  FLancC195.Free;
  inherited;
end;

{ TModeloC195 }

constructor TModeloC195.Create;
begin
  FLancC197 := TModelosC197.Create;
end;

destructor TModeloC195.Destroy;
begin
  FLancC197.Clear;
  FLancC197.Free;
  inherited;
end;

end.
