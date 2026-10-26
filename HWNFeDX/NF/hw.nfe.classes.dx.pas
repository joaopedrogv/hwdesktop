unit hw.nfe.classes.dx;

interface

uses
  Contnrs,
  System.Classes,
  System.Generics.Collections,
  System.Character,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Controls,
  Vcl.Graphics,
  DB,
  uClasseConexao,
  empresa_nfe_class,
  notafiscal_class,
  notafiscal_item_class,
  notafiscal_item_veiculo_class,
  notafiscal_item_di_class,
  notafiscal_item_adi_class,
  notafiscal_item_detexport_class,
  notafiscal_item_exportind_class,
  notafiscal_sped_c111_class,
  notafiscal_sped_c113_class,
  notafiscal_sped_c114_class,
  notafiscal_sped_c115_class,
  notafiscal_coleta_entrega_class,
  notafiscal_obscont_class,
  notafiscal_pag_class,
  notafiscal_dup_class,
  notafiscal_carta_correcao_class,
  notafiscal_inut_class,
  notafiscal_defensivo_class,
  notafiscal_guiatransito_class,
  transportador_class,
  config_sistema_class,
  produtos_class,
  ACBrNFe,
  ACBrMail,
  ACBrNFeDANFeRLClass,
  ACBrNFeWebServices, TributoDFeContextEtdUnit, SituacaoNFeEnumUnit;

const
  stsAberta    = 'Aberta';
  stsFechada   = 'Fechada';
  stsCancelada = 'Cancelada';

  strEventoEPEC = 'EPE';
  strEventoCCe  = 'CCE';
  strEventoCan  = 'CAN';

  strCodEventoEPEC = '110140';
  strCodEventoCCe  = '110110';
  strCodEventoCan  = '110111';

  strDescEventoEPEC = 'EPEC - Emissão prévia em Contingência';
  strDescEventoCCe  = 'Carta de Correção';
  strDescEventoCan  = 'Cancelamento';

type
  SituacaoNFeHW = SituacaoNFeEnumUnit.SituacaoNFeEnum;
  DocumentoNFeHW  = (docNFe, docEPEC, docEventoCCe, docEventoCan, docInut);
  DocuemntosNFeHW = set of DocumentoNFeHW;
  RTagICMSSub = (tisSempre, tisQuandoPreenchido, tisSempreProducao, tisSempreHomologacao);
  FormatoBoletoDb = (faHtml, faPDF, faLink);

  THwAux                              = class;
  TNotafiscal_inut_class_hw           = class;
  TNotafiscal_item_adi_class_hw       = class;
  TNotafiscal_item_di_class_hw        = class;
  TNotafiscal_item_veiculo_class_hw   = class;
  TNotafiscal_item_exportind_class_hw = class;
  TNotafiscal_item_detexport_class_hw = class;
  TNotafiscal_item_class_hw           = class;
  TNotafiscal_sped_c111_class_hw      = class;
  TNotafiscal_sped_c113_class_hw      = class;
  TNotafiscal_sped_c114_class_hw      = class;
  TNotafiscal_sped_c115_class_hw      = class;
  TNotafiscal_pag_class_hw            = class;
  TNotafiscal_dup_class_hw            = class;
  TNotafiscal_carta_correcao_class_hw = class;
  TTransportador_class_hw             = class;
  TNotafiscal_class_hw                = class;
  TConfigCentralNFe_FCP               = class;
  TConfigCentralNFe                   = class;
  THwCentralNFe                       = class;

  THwAux = class
  public
    class function apenasNumeros(Atexto: string): string;
    class function StrToTStrings(AText: string; Aseparator: array of string; AdupIgnore: Boolean = True): TStrings;
    class function GetIni(Achave, Aident, ADefault: string; AIniText: TStrings): string;
    class function GetIniI(Achave, Aident: string; ADefault: Integer; AIniText: TStrings): Integer;
    class function GetIniB(Achave, Aident: string; ADefault: Boolean; AIniText: TStrings): Boolean;
    class function StrToSituacaoNFe(Value: string): SituacaoNFeHW;
    class function SituacaoNFeToStr(Value: SituacaoNFeHW): string;
    class function cStatToSituacaoNFeHW(cStat: Integer): SituacaoNFeHW;
    class function cStatToSituacaoEventoHW(cStat: Integer): SituacaoNFeHW;
    class function strEventoToDescEvento(AstrEvento: string): string;
    class function strEventoToDocumentoNFeHW(AstrEvento: string): DocumentoNFeHW;
    class procedure GerarLog(const Mensagem: String; var Tratado: Boolean);
    class function CreateProcessSimple(Acmd: string; Await: Boolean = False): Boolean;
  end;

  TAuxAudit = class
  private
    FMensagem: string;
    FCodigo: string;
    FProcesso: string;
    FId: Integer;
  public
    property Mensagem: string read FMensagem write FMensagem;
    property Codigo: string read FCodigo write FCodigo;
    property Processo: string read FProcesso write FProcesso;
    property Id: Integer read FId write FId;
  end;

  TNotafiscal_inut_class_hw = class(TNotafiscal_inut_class)
  end;

  TNotafiscal_item_exportind_class_hw = class(TNotafiscal_item_exportind_class)
  end;

  TNotafiscal_item_detexport_class_hw = class(TNotafiscal_item_detexport_class)
  private
    FexportInd: TNotafiscal_item_exportind_class_hw;
  public
    destructor Destroy; override;

    property exportInd: TNotafiscal_item_exportind_class_hw read FexportInd write FexportInd;
  end;

  TNotafiscal_item_adi_class_hw = class(TNotafiscal_item_adi_class)
  end;

  TNotafiscal_item_di_class_hw = class(TNotafiscal_item_di_class)
  private
    Fadi: TObjectList<TNotafiscal_item_adi_class_hw>;
  public
    destructor Destroy; override;

    property adi: TObjectList<TNotafiscal_item_adi_class_hw> read Fadi write Fadi;
  end;

  TNotafiscal_item_veiculo_class_hw = class(TNotafiscal_item_veiculo_class)
  private
    Flotacao       : string;
    Ftip_veiculo   : string;
    Fpesol         : Integer;
    Fcodcordenatram: Integer;
    Ftpcomb_m      : string;
    Fpesob         : Integer;
    Fdistanciaeixo : string;
    Fcmkg          : string;
    Fesprenavam    : string;
    Fpot           : string;
    FinfAdProd     : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); override;

    property codcordenatram: Integer read Fcodcordenatram write Fcodcordenatram;
    property cmkg          : string  read Fcmkg           write Fcmkg;
    property distanciaeixo : string  read Fdistanciaeixo  write Fdistanciaeixo;
    property tip_veiculo   : string  read Ftip_veiculo    write Ftip_veiculo;
    property esprenavam    : string  read Fesprenavam     write Fesprenavam;
    property pesol         : Integer read Fpesol          write Fpesol;
    property pesob         : Integer read Fpesob          write Fpesob;
    property lotacao       : string  read Flotacao        write Flotacao;
    property tpcomb_m      : string  read Ftpcomb_m       write Ftpcomb_m;
    property pot           : string  read Fpot            write Fpot;
    property infAdProd     : string  read FinfAdProd      write FinfAdProd;

  end;

  TNotafiscal_item_class_hw = class(TNotafiscal_item_class)
  private
    Fveic     : TNotafiscal_item_veiculo_class_hw;
    Fdi       : TObjectList<TNotafiscal_item_di_class_hw>;
    FdetExport: TObjectList<TNotafiscal_item_detexport_class_hw>;
    FnveList  : TStringList;
    FinfAdProd: string;
    FrepasseST: string;
    Fvuntrib: Double;
    FTributoRtc: TributoDFeContextEtd;
    function Get_cEAN: string;
    procedure SetTributoRtc(const Value: TributoDFeContextEtd);
  public
    destructor Destroy; override;
    procedure SetValuesFrom(ADataSet: TDataSet; nfOwner: TNotafiscal_class_hw; AcheckFields: Boolean = False);

    property veic      : TNotafiscal_item_veiculo_class_hw                read Fveic      write Fveic;
    property di        : TObjectList<TNotafiscal_item_di_class_hw>        read Fdi        write Fdi;
    property detExport : TObjectList<TNotafiscal_item_detexport_class_hw> read FdetExport write FdetExport;
    property nveList   : TStringList                                      read FnveList;
    property infAdProd : string                                           read FinfAdProd write FinfAdProd;
    property repasseST : string                                           read FrepasseST write FrepasseST;
    property vuntrib   : Double                                           read Fvuntrib;
    property TributoRtc: TributoDFeContextEtd                             read FTributoRtc write SetTributoRtc;
  end;

  //
  TNotafiscal_sped_c111_class_hw = class(TNotafiscal_sped_c111_class)
  end;

  //ref nf, nfe, nfce
  TNotafiscal_sped_c113_class_hw = class(TNotafiscal_sped_c113_class)
  end;

  // ref ecf
  TNotafiscal_sped_c114_class_hw = class(TNotafiscal_sped_c114_class)
  end;

  TNFRef = class
  private
    FrefNFe: TNotafiscal_sped_c113_class_hw;
    FrefECF: TNotafiscal_sped_c114_class_hw;
    FrefNF : TNotafiscal_sped_c113_class_hw;
  public
    destructor Destroy; override;

    property refNFe: TNotafiscal_sped_c113_class_hw read FrefNFe write FrefNFe;
    property refECF: TNotafiscal_sped_c114_class_hw read FrefECF write FrefECF;
    property refNF : TNotafiscal_sped_c113_class_hw read FrefNF  write FrefNF;
  end;

  //entrega e retirada
  TNotafiscal_sped_c115_class_hw = class(TNotafiscal_sped_c115_class)
  end;

  TNotafiscal_pag_class_hw = class(TNotafiscal_pag_class)
  end;

  TNotafiscal_dup_class_hw = class(TNotafiscal_dup_class)
  private
    FhtmlBoleto: TStrings;
    FArquivoPDF: string;
    FNossoNumero: string;
    FTipoArquivo: FormatoBoletoDb;
    FStringArquivo: string;
  public
    destructor Destroy; override;
    function GerarBoletoEmPDF(ApathPDF: string): Boolean;
    procedure HandleDadosBoleto(idIntegracao, linkDownload, dadosStr: string);

//    property htmlBoleto : TStrings        read FhtmlBoleto  write FhtmlBoleto;
//    property Base64Pdf  : TStrings        read FBase64Pdf   write FBase64Pdf;
    property NossoNumero: string          read FNossoNumero write FNossoNumero;
    property ArquivoPDF : string          read FArquivoPDF;
    property TipoArquivo: FormatoBoletoDb read FTipoArquivo write FTipoArquivo;
  end;

  TNotafiscal_carta_correcao_class_hw = class(TNotafiscal_carta_correcao_class)
  end;

  TNotafiscal_obscont_hw = class(TNotafiscal_obscont_class)
  end;

  TNotafiscal_defensivo = class(TNotafiscal_defensivo_class)
  end;

  TNotafiscal_guiatransito = class(TNotafiscal_guiatransito_class)
  end;

  TTransportador_class_hw = class(TTransportador_class)
  private
    Fsigla_uf: string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); override;

    property sigla_uf: string read Fsigla_uf write Fsigla_uf;
  end;

  TributosDFeDict = TDictionary<string, TributoDFeContextEtd>;

  TNotafiscal_class_hw = class(TNotafiscal_class)
  private
    Fnfref     : TObjectList<TNFRef>;
    Fretirada  : TNotafiscal_sped_c115_class_hw;
    Fentrega   : TNotafiscal_sped_c115_class_hw;
    FautXML    : TStringList;
    Fprod      : TObjectList<TNotafiscal_item_class_hw>;
    Ftransporta: TTransportador_class_hw;
    Fdup       : TObjectList<TNotafiscal_dup_class_hw>;
    Fpag       : TObjectList<TNotafiscal_pag_class_hw>;
    FprocRef   : TObjectList<TNotafiscal_sped_c111_class_hw>;
    FobsCont   : TObjectList<TNotafiscal_obscont_hw>;
    Fdefensivo : TObjectList<TNotafiscal_defensivo>;
    FguiaTrans : TNotafiscal_guiatransito;
    FeventoEPEC: TNotafiscal_carta_correcao_class_hw;
    FeventoCanc: TNotafiscal_carta_correcao_class_hw;
    FeventosCCe: TObjectList<TNotafiscal_carta_correcao_class_hw>;
    FretiradaV2: TNotafiscal_coleta_entrega_class;
    FentregaV2 : TNotafiscal_coleta_entrega_class;
    FTributos  : TributosDFeDict;
    function GetsitNFe: SituacaoNFeHW;
  public
    constructor Create(ATributos: TributoDFeContextEtdList);
    destructor Destroy; override;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); override;

    property nfref     : TObjectList<TNFRef>                              read Fnfref      write Fnfref;
    property retirada  : TNotafiscal_sped_c115_class_hw                   read Fretirada   write Fretirada;
    property entrega   : TNotafiscal_sped_c115_class_hw                   read Fentrega    write Fentrega;
    property retiradaV2: TNotafiscal_coleta_entrega_class                 read FretiradaV2 write FretiradaV2;
    property entregaV2 : TNotafiscal_coleta_entrega_class                 read FentregaV2  write FentregaV2;
    property autXML    : TStringList                                      read FautXML     write FautXML;
    property prod      : TObjectList<TNotafiscal_item_class_hw>           read Fprod       write Fprod;
    property transporta: TTransportador_class_hw                          read Ftransporta write Ftransporta;
    property dup       : TObjectList<TNotafiscal_dup_class_hw>            read Fdup        write Fdup;
    property pag       : TObjectList<TNotafiscal_pag_class_hw>            read Fpag        write Fpag;
    property procRef   : TObjectList<TNotafiscal_sped_c111_class_hw>      read FprocRef    write FprocRef;
    property obsCont   : TObjectList<TNotafiscal_obscont_hw>              read FobsCont    write FobsCont;
    property defensivo : TObjectList<TNotafiscal_defensivo>               read Fdefensivo  write Fdefensivo;
    property guiaTrans : TNotafiscal_guiatransito                         read FguiaTrans  write FguiaTrans;
    property eventoEPEC: TNotafiscal_carta_correcao_class_hw              read FeventoEPEC write FeventoEPEC;
    property eventoCanc: TNotafiscal_carta_correcao_class_hw              read FeventoCanc write FeventoCanc;
    property eventosCCe: TObjectList<TNotafiscal_carta_correcao_class_hw> read FeventosCCe write FeventosCCe;
    property sitNFe    : SituacaoNFeHW                                    read GetsitNFe;
    property Tributos  : TributosDFeDict                                  read FTributos;
  end;

  TConfigCentralNFe_FCP = class
  private
    FText_vICMSUFDest : string;
    FText_vFCPUFDest  : string;
    FText_vICMSUFRemet: string;
    FUsarQuebraDeLinha: Boolean;
  public
    property Text_vFCPUFDest  : string  read FText_vFCPUFDest   write FText_vFCPUFDest;
    property Text_vICMSUFDest : string  read FText_vICMSUFDest  write FText_vICMSUFDest;
    property Text_vICMSUFRemet: string  read FText_vICMSUFRemet write FText_vICMSUFRemet;
    property UsarQuebraDeLinha: Boolean read FUsarQuebraDeLinha write FUsarQuebraDeLinha;
  end;

  TConfigCentralNFe_DANFE = class(TConfig_sistema_class)
  private
    FLarguraCodProd               : Integer;
    FExibirEAN                    : Boolean;
    FCasasDecimais_qCom           : Integer;
    FCasasDecimais_vUnCom         : Integer;
    FEspacoEntreProdutos          : Integer;
    FProdutosPorPagina            :  Integer;
    FExibeCampoFatura             : Boolean;
    FAlternaCoresProdutos         : Boolean;
    FExibirBandInforAdicProduto   : Boolean;
    FImprimirDadosDocReferenciados: Boolean;
    FExibirResumoCanhoto          : Boolean;
    FImprimirCancelamentoNoDANFE  : Boolean;
    FImprimirIpiDevolEmCampoIPI   : boolean;
    FRemoverLineBreak: Boolean;
    FImprimeDetalhamentoEspecifico: Boolean;
  public
    property RemoverLineBreak             : Boolean read FRemoverLineBreak               write FRemoverLineBreak;
    property LarguraCodProd               : Integer read FLarguraCodProd                 write FLarguraCodProd;
    property ExibirEAN                    : Boolean read FExibirEAN                      write FExibirEAN;
    property CasasDecimais_qCom           : Integer read FCasasDecimais_qCom             write FCasasDecimais_qCom;
    property CasasDecimais_vUnCom         : Integer read FCasasDecimais_vUnCom           write FCasasDecimais_vUnCom;
    property ProdutosPorPagina            : Integer read FProdutosPorPagina              write FProdutosPorPagina;
    property ExibeCampoFatura             : Boolean read FExibeCampoFatura               write FExibeCampoFatura;
    property EspacoEntreProdutos          : Integer read FEspacoEntreProdutos            write FEspacoEntreProdutos;
    property AlternaCoresProdutos         : Boolean read FAlternaCoresProdutos           write FAlternaCoresProdutos;
    property ExibirBandInforAdicProduto   : Boolean read FExibirBandInforAdicProduto     write FExibirBandInforAdicProduto;
    property ImprimirDadosDocReferenciados: Boolean read FImprimirDadosDocReferenciados  write FImprimirDadosDocReferenciados;
    property ExibirResumoCanhoto          : Boolean read FExibirResumoCanhoto            write FExibirResumoCanhoto;
    property ImprimirCancelamentoNoDANFE  : Boolean read FImprimirCancelamentoNoDANFE    write FImprimirCancelamentoNoDANFE;
    property ImprimirIpiDevolEmCampoIPI   : boolean read FImprimirIpiDevolEmCampoIPI     write FImprimirIpiDevolEmCampoIPI;
    property ImprimeDetalhamentoEspecifico: Boolean read FImprimeDetalhamentoEspecifico write FImprimeDetalhamentoEspecifico;
  end;

  TConfigCentralNFe = class
  private
    FOwner    : THwCentralNFe;
    Ffcp      : TConfigCentralNFe_FCP;
    Fverproc  : string;
    Fdanfe    : TConfigCentralNFe_DANFE;
    FsoftHouse: string;
    FdupSequencial: Boolean;
    FhabStatusServ: Boolean;
    FanpRepasse: TStrings;
    FtagEANSemGTIN: Boolean;
    FTagICMSSubsti: RTagICMSSub;
    FNT_2018_005: Boolean;
    Fnfe_nt_2020_006_data: TDateTime;
    FnfeRefSigilosa: Boolean;
    Flote_sinc_1nfe: Boolean;
    FIdCSRT: string;
    FCSRT: string;
    FveicDetUsado: Boolean;
    function getConfSisList(const Achaves: array of string): TConfig_sistema_classList;
  public
    constructor Create(AOwner: THwCentralNFe);
    destructor Destroy; override;

    procedure ExecutarLeitura;

    property fcp          : TConfigCentralNFe_FCP   read Ffcp   write Ffcp;
    property danfe        : TConfigCentralNFe_DANFE read Fdanfe write Fdanfe;
    property verproc      : string                  read Fverproc;
    property softHouse    : string                  read FsoftHouse;
    property dupSequencial: Boolean                 read FdupSequencial;
    property habStatusServ: Boolean                 read FhabStatusServ;
    property anpRepasse   : TStrings                read FanpRepasse;
    property tagEANSemGTIN: Boolean                 read FtagEANSemGTIN;
    property TagICMSSubsti: RTagICMSSub             read FTagICMSSubsti;
    property NT_2018_005  : Boolean                 read FNT_2018_005;
    property nfe_nt_2020_006_data: TDateTime        read Fnfe_nt_2020_006_data;
    property nfeRefSigilosa: Boolean read FnfeRefSigilosa write FnfeRefSigilosa;
    property lote_sinc_1nfe: Boolean read Flote_sinc_1nfe write Flote_sinc_1nfe;
    property veicDetUsado  : Boolean read FveicDetUsado   write FveicDetUsado;
    property IdCSRT        : string  read FIdCSRT         write FIdCSRT;
    property CSRT          : string  read FCSRT           write FCSRT;
  end;

  THwNFe_mail_aux_docs = class
  private
    Finut: TObjectList<TNotafiscal_inut_class_hw>;
    Fnotas: TObjectList<TNotafiscal_class_hw>;
    FnfEvento: TNotafiscal_class_hw;
    Fevento: TNotafiscal_carta_correcao_class_hw;
  public
    property notas   : TObjectList<TNotafiscal_class_hw>      read Fnotas    write Fnotas;
    property nfEvento: TNotafiscal_class_hw                   read FnfEvento write FnfEvento;
    property evento  : TNotafiscal_carta_correcao_class_hw    read Fevento   write Fevento;
    property inut    : TObjectList<TNotafiscal_inut_class_hw> read Finut     write Finut;
  end;


  TBoletosSeparados = class
  private
    Fativo: Boolean;
    FfileName: string;
    Fassunto: string;
    Fcorpo: string;
  published
    property ativo: Boolean read Fativo write Fativo;
    property fileName: string read FfileName write FfileName;
    property assunto: string read Fassunto write Fassunto;
    property corpo: string read Fcorpo write Fcorpo;
  end;

  THwNFe_mail_aux = class
  private
    Femail   : string;
    FAssunto : string;
    FAnexos  : TStrings;
    FCCmails : TStrings;
    FMensagem: TStrings;
    FdocDFe  : DocumentoNFeHW;
    FpathPDF : string;
    FcomPDF: Boolean;
    FcomEventos: Boolean;
    Fdocs: THwNFe_mail_aux_docs;
    FemailUnico: Boolean;
    FcomBol: Boolean;
    FsepBoletos: TBoletosSeparados;
    procedure definirPathPDF;
    procedure Setemail(const Value: string);
  public
    constructor create; overload;
    constructor create(Adoc: DocumentoNFeHW; Aemail, Aanexos: string); overload;
    destructor Destroy; override;

    property email     : string               read Femail      write Setemail;
    property Assunto   : string               read FAssunto    write FAssunto;
    property Anexos    : TStrings             read FAnexos     write FAnexos;
    property CCmails   : TStrings             read FCCmails    write FCCmails;
    property Mensagem  : TStrings             read FMensagem   write FMensagem;
    property docDFe    : DocumentoNFeHW       read FdocDFe;
    property pathPDF   : string               read FpathPDF;
    property comEventos: Boolean              read FcomEventos write FcomEventos;
    property comPDF    : Boolean              read FcomPDF     write FcomPDF;
    property comBol    : Boolean              read FcomBol     write FcomBol;
    property docs      : THwNFe_mail_aux_docs read Fdocs       write Fdocs;
    property emailUnico: Boolean              read FemailUnico write FemailUnico;
    property sepBoletos: TBoletosSeparados    read FsepBoletos write FsepBoletos;
  end;

  TFormStatus = class(TForm)
  private
    panelContainer: TPanel;
    lbTituloSuperior: TLabel;
    lbStatusInferior: TLabel;
    Ftitulo: string;
    procedure SetTitulo(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure doStatus(Astatus: string);

    property titulo: string read Ftitulo write SetTitulo;
  end;

  THwNFe = class(TConexao)
  private
    Fcod_empresa: Integer;
    FdbName     : string;
    FUsuario    : string;
    FlistError  : TStrings;
  protected
    emp : TEmpresa_nfe_class;
    conf: TConfigCentralNFe;
    formStatus: TFormStatus;
    FlastError: string;

    function GetCodigo(Atabela: string): Integer;
    function GetEmpresa_nfe: TEmpresa_nfe_class;

    procedure GetNotaFiscal_eventoEPEC(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_eventoCanc(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_eventosCCe(var Anota: TNotafiscal_class_hw);

    procedure GetNotaFiscal_prod_veic(var Aprod: TNotafiscal_item_class_hw);
    procedure GetNotaFiscal_prod_di_adi(var _di: TNotafiscal_item_di_class_hw);
    procedure GetNotaFiscal_prod_di(var Aprod: TNotafiscal_item_class_hw);
    procedure GetNotaFiscal_prod_exportInd(var AdetExport: TNotafiscal_item_detexport_class_hw);
    procedure GetNotaFiscal_prod_detExport(var Aprod: TNotafiscal_item_class_hw);

    procedure GetNotaFiscal_nfref(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_retirada(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_entrega(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_autXML(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_defensivo(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_guiTransito(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_prod(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_dup(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_dup_html_bol(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_pag(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_obsCont(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_transporta(var Anota: TNotafiscal_class_hw);
    procedure GetNotaFiscal_procRef(var Anota: TNotafiscal_class_hw);
    function GetNotaFiscal(Acod_nf: Integer): TNotafiscal_class_hw;

    function GetInutilizacao(Aseqid: Integer): TNotafiscal_inut_class_hw; overload;
    function GetInutilizacao(Nota: TNotafiscal_class_hw): TNotafiscal_inut_class_hw; overload;
    function CriarNovaInutilizacao(Nota: TNotafiscal_class_hw): TNotafiscal_inut_class_hw;
    procedure CriarEventoCancelamento(var Nota: TNotafiscal_class_hw);

    function Save_situacao(Anota: TNotafiscal_class_hw; Acommit: Boolean): Boolean;
    function Save_rejeicao(Anota: TNotafiscal_class_hw; Acommit: Boolean): Boolean;
    function Save_pre_autorizacao(Anota: TNotafiscal_class_hw; Acommit: Boolean = True): Boolean;
    function Save_pre_autorizacao_epec(Anota: TNotafiscal_class_hw; Acommit: Boolean = True): Boolean;
    function Save_retorno_autorizacao(Anota: TNotafiscal_class_hw; Acommit: Boolean = True): Boolean;
    function Save_erro_na_autorizacao(Anota: TNotafiscal_class_hw; Acommit: Boolean = True): Boolean;
    function Save_retorno_autorizacao_epec(Anota: TNotafiscal_class_hw; Acommit: Boolean = True): Boolean;
    function Save_retorno_consulta(Anota: TNotafiscal_class_hw; Acommit: Boolean = True): Boolean;
    function Save_retorno_cancelamento(Anota: TNotafiscal_class_hw; Acommit: Boolean = True): Boolean;
    function Save_retorno_evento(Aevento: TNotafiscal_carta_correcao_class_hw; Acommit: Boolean = True): Boolean;
    function Save_retorno_inutilizacao(Ainut: TNotafiscal_inut_class_hw; Acommit: Boolean = True): Boolean;

    function Limpar_dados_envio(Anota: TNotafiscal_class_hw; Acommit: Boolean = True): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    property cod_empresa: Integer  read Fcod_empresa write Fcod_empresa;
    property dbName     : string   read FdbName      write FdbName;
    property Usuario    : string   read FUsuario     write FUsuario;
    property listError  : TStrings read FlistError   write FlistError;
  end;

  THwCentralNFe = class(THwNFe )
  private
    Fnfe  : TACBrNFe;
    Fdanfe: TACBrNFeDANFeRL;
    Fmail : TACBrMail;

    procedure acbr_StatusChange(Sender: TObject);

    procedure acbr_configurar(AmostrarVencendo: Boolean = False);
    function acbr_gerar_assinar_validar: Boolean;
    function acbr_add_notafiscal(Anf: TNotafiscal_class_hw): Boolean;
    function acbr_add_evento_epec(Anf: TNotafiscal_class_hw): Boolean;
    function acbr_nfe_consultar(var Anota: TNotafiscal_class_hw; Adocs: DocuemntosNFeHW = []): TNFeConsulta;
    function acbr_nfe_consultar_recibo(var Anota: TNotafiscal_class_hw): Boolean;
    function acbr_status_servico(AtpEmiss: string): Boolean;

    function acbr_def_send_mail(Amail: THwNFe_mail_aux): Boolean;

    function ConsultaSituacaoNFe(Nota: TNotafiscal_class_hw): SituacaoNFeHW;
    procedure ConsultarNFePendente(Nota: TNotafiscal_class_hw);
    procedure ProcessarAutorizacaoContingencia(Nota: TNotafiscal_class_hw);
    procedure ProcurarAtribuirProcNFe(Nota: TNotafiscal_class_hw; ACommit: Boolean = True);
    procedure EnviarInutilizacaoPendencia(Nota: TNotafiscal_class_hw);
    procedure EnviarCancelamentoSubstituicao(NotaPendente, NotaContingencia: TNotafiscal_class_hw);
    procedure NFeGerarLog(const ALogLine: string; var Tratado: Boolean);
  public
    function nfe_autorizar(Acod_nf: array of Integer): Boolean;
    function nfe_imprimir(Acod_nf: array of Integer; Aprint, AsavePDF: Boolean; ApathPDF: string; tipoDANFe: string): Boolean;
    function nfe_email(Acod_nf: array of Integer; AemailUnico, AcomEventos, AcomPDF, AcomBol: Boolean; Aemail, Aanexos: string): Boolean;
    function nfe_consultar(Acod_nf: array of Integer): Boolean;
    function nfe_status_servico(AtpEmiss: string): Boolean;
    function nfe_anexos(Acod_nf: array of Integer; AComPDF, AComEventos, AcomBol: Boolean): string;
    function nfe_converter_em_contingencia(CodigoNF: Integer): Boolean;
    function nfe_resolver_pendencia_sefaz(CodigoNF: Integer): Boolean;

    function nfe_inutilizacao_enviar(Aseqid: Integer): Boolean;
    function nfe_inutilizacao_imprimir(Aseqid: Integer; Aprint, AsavePDF: Boolean; ApathPDF: string): Boolean;
    function nfe_inutilizacao_email(Aseqid: array of Integer; Aemail, Aanexos: string): Boolean;

    function nfe_evento_enviar(Acod_nf, Alote: Integer): Boolean;
    function nfe_evento_imprimir(Acod_nf, Alote: Integer; Aprint, AsavePDF: Boolean; ApathPDF: string): Boolean;
    function nfe_evento_email(Acod_nf, Alote: Integer; Aemail, Aanexos: string): Boolean;

    function nfe_atualizar_valores_xml(codigos_nf: array of Integer): Integer;

    function dfe_dados_certificado(modelo: string): WideString;
  end;


implementation

uses
  System.SysUtils,
  System.Math,
  System.StrUtils,
  System.IniFiles,
  System.DateUtils,
  Winapi.Windows,
  Winapi.SHFolder,
  pcnAuxiliar,
  pcnConversaoNFe,
  pcnConversao,
  mimemess,
  ACBrDFeSSL,
  ACBrDFeWebService,
  ACBrDFeException,
  ACBrDFeDANFeReport,
  ACBrDFe.Conversao,
  ACBrNFe.Classes, ACBrDFe.RTC.Classes,
  ACBrDFeUtil,
  nf_xml_versao,
  hw_win_utils,
  hw_utils,
  HelperDFe, nfce_config_class, HelperTags,
  ContainerDFeUnit, TributosDFeFactoryUnit, SetupDFeUnit, DFeNTManageUnit,
  RegistradorAlertasDFeUtils, ITransactionUnit, IBXTransactionLegacyUnit, SetupUnit, FormatoImpressaoDANFeEnumUnit,
  NotaFiscalPendenciaSefEtdUnit, StatusResolucaoNFeSefEnumUnit, AvancarPendenciaSefazInputUnit;

type
  SituacoesNFeHW = set of SituacaoNFeHW;

function CompactarVariosArquivos_dx(ListaArquivos, Destino: WideString): Boolean; stdcall; external 'Compacta.dll';

function plugboleto_download_via_url(paramsList: WideString; api_urlboleto: string): WideString; stdcall; external 'hw.utils.dx.dll';

const
  SituacoesNFeFinalizadas: SituacoesNFeHW = [ stAutorizada, stCancelada, stDenegada, stInutilizada ];

{ THwNotaFiscal_Item }

destructor TNotafiscal_item_class_hw.Destroy;
begin
  if Assigned(Fveic) then
    FreeAndNil(Fveic);

  if Assigned(Fdi) then
    FreeAndNil(Fdi);

  if Assigned(FdetExport) then
    FreeAndNil(FdetExport);

  if Assigned(FTributoRtc) then
    FreeAndNil(FTributoRtc);
  inherited;
end;

function TNotafiscal_item_class_hw.Get_cEAN: string;
var
  sl_CodIni: string;
  il_SeqSom, il_Soma, il_TodNum: Integer;
  Achar: Char;

  function DUN14Valido: Boolean;
  var
    Codigo,converCalculo :string;
    imp2, imp1, imp3, imp4, imp5,imp6, imp7, par1, par2 ,par3, par4, par5,par6,TResult,Tamanho,TImpar, TPar, Calculo, Digito:integer;
  begin

    try
      Codigo := Copy(cean, 1, 13);

      imp1:= StrToInt(copy(Codigo,1,1));
      imp2:= StrToInt(copy(Codigo,3,1));
      imp3:= StrToInt(copy(Codigo,5,1));
      imp4:= StrToInt(copy(Codigo,7,1));
      imp5:= StrToInt(copy(Codigo,9,1));
      imp6:= StrToInt(copy(Codigo,11,1));
      imp7:= StrToInt(copy(Codigo,13,1));

      TImpar:= (imp1)+(imp2)+(imp3)+(imp4)+(imp5)+(imp6)+(imp7);
      TImpar:= TImpar * 3;

      par1:= StrToInt(copy(Codigo,2,1));
      par2:= StrToInt(copy(Codigo,4,1));
      par3:= StrToInt(copy(Codigo,6,1));
      par4:= StrToInt(copy(Codigo,8,1));
      par5:= StrToInt(copy(Codigo,10,1));
      par6:= StrToInt(copy(Codigo,12,1));

      TPar:= (par1)+(par2)+(par3)+(par4)+(par5)+(par6);

      Calculo:= TImpar + TPar;

      converCalculo:= IntToStr(Calculo);

      Tamanho:= length(converCalculo);

      case Tamanho of
      1 :begin
          TResult:= StrToInt(copy(converCalculo,1,1));
            if TResult= 0 then
             Digito:= 0
            else
             Digito:= TResult - 10;

            if Digito < 0 then
             Digito:= ABS(Digito);
         end;

      2 :begin
          TResult:= StrToInt(copy(converCalculo,2,1));
            if TResult = 0 then
             Digito:= 0
            else
             Digito:= 10 - TResult;

           if Digito < 0 then
             Digito:= ABS(Digito);
         end;

      3 :begin
          TResult:= StrToInt(copy(converCalculo,3,1));
            if TResult= 0 then
              Digito:= 0
            else
              Digito:= 10 -  TResult;

           if Digito < 0 then
             Digito:= ABS(Digito);
         end;
      end;

      Result := IntToStr(Digito) = Copy(cean, 14, 1);

    except
      Result := False;
    end;
  end;

begin
  Result := '';

  cean := cean.Trim;
  if not (cean.Length in [8, 12, 13, 14]) then
    Exit;

  for Achar in cean do
    if not Achar.IsNumber then
      Exit;

  if (Length(Trim(cean)) = 14) then
     Result := IfThen(DUN14Valido, cean)
  else
  begin
    sl_CodIni := cean.PadLeft(13, '0');

    sl_CodIni := Copy(Trim(sl_CodIni), 1, Length(sl_CodIni) - 1);
    il_Soma := 0;
    il_SeqSom := 1;

    // se for ean8 entao completa numeros
//    if Length(Trim(cean)) = 8 then
//      sl_CodIni := '00000' + sl_CodIni;

    // continua

    for il_TodNum := 1 to Length(sl_CodIni) do
    begin
      if il_SeqSom = 1 then
      begin
        il_Soma := il_Soma +
          (StrToInt(Copy(sl_CodIni, il_TodNum, 1)) * il_SeqSom);
        il_SeqSom := 3;
      end
      else
      begin
        il_Soma := il_Soma +
          (StrToInt(Copy(sl_CodIni, il_TodNum, 1)) * il_SeqSom);
        il_SeqSom := 1;
      end

    end;

    // calcula o restante

    // para numeros que nao sao zero no final
    if Copy(IntToStr(il_Soma), Length(IntToStr(il_Soma)), 1) <> '0' then
    begin
      if Copy(Trim(cean), Length(cean), 1) =
        IntToStr(10 - StrToInt(Copy(IntToStr(il_Soma),
        Length(IntToStr(il_Soma)), 1))) then
        Result := cean
      else
        Result := ''
    end
    else if StrToInt(Copy(Trim(cean), Length(cean), 1)) = 0 then
      Result := cean
    else
      Result := '';
  end;
end;

procedure TNotafiscal_item_class_hw.SetTributoRtc(const Value: TributoDFeContextEtd);
begin
  if FTributoRtc = Value then
    Exit;

  if Assigned(FTributoRtc) then
    FreeAndNil(FTributoRtc);

  FTributoRtc := Value;
end;

procedure TNotafiscal_item_class_hw.SetValuesFrom(ADataSet: TDataSet;
  nfOwner: TNotafiscal_class_hw;
  AcheckFields: Boolean);
var
  Anve: string;
begin
  inherited SetValuesFrom(ADataSet, AcheckFields);
  cean := Get_cEAN;
  if nfci.Trim.Length = 32 then
    nfci := nfci.Insert(08, '-').Insert(13, '-').Insert(18, '-').Insert(23, '-');

  FnveList := TStringList.Create;
  if not nve.IsEmpty then
  begin
    FnveList.Sorted     := True;
    FnveList.Duplicates := dupIgnore;
    for Anve in nve.Split(['|']) do
      if not Anve.Trim.IsEmpty then
        FnveList.Add(Anve);
  end;
  if tipo_item.Equals('O') then
  begin
    descricao_item := IfThen(descricao_item_outras.Count > 1, descricao_item_outras[0].Substring(0, 120), descricao_item_outras.Text);
    FinfAdProd     := descricao_item_outras.Text;
    if descricao_item.Length < descricao_item_outras.Text.Length then
      System.Delete(FinfAdProd, 1, descricao_item.Length)
    else
      FinfAdProd   := '';
  end
  else
  begin
    descricao_item := IfThen(tipo_item.Equals('O'), descricao_item_outras.Text.Substring(0  , 120), descricao_item);
    FinfAdProd     := IfThen(tipo_item.Equals('O'), descricao_item_outras.Text.Substring(120, 500), descricao_item_outras.Text.Substring(0, 500));
  end;

//  descricao_item := IfThen(tipo_item.Equals('O'), descricao_item_outras.Text.Substring(0  , 120), descricao_item);
//  FinfAdProd     := IfThen(tipo_item.Equals('O'), descricao_item_outras.Text.Substring(120, 500), descricao_item_outras.Text.Substring(0, 500));
  if (nfOwner.import_xml >= strDataVersion)
    and (not Self.unidade_nf.IsEmpty)
    and (Self.qtdembrec > 0)
    and (Self.vlrembnf > 0) then
  begin                      
    if (not utrib.IsEmpty) and (qtrib > 0) then
    begin
      utrib      := IfThen((not utrib.IsEmpty) and (qtrib > 0), utrib, unidade_nf);
      qtrib      := IfThen((not utrib.IsEmpty) and (qtrib > 0), qtrib, 1) * quantidade;
    end
    else
    begin                                                                                  
      utrib      := IfThen(utrib.IsEmpty, unidade_nf, utrib);
      qtrib      := IfThen(qtrib > 0, qtrib, 1) * qtdembrec;    
    end;
  end
  else
  begin
  utrib          := IfThen(utrib.IsEmpty, referencia, utrib);
  qtrib          := IfThen(qtrib > 0, qtrib, 1) * quantidade;
end;
  Fvuntrib       := valor_total / qtrib;
end;

{ TNotafiscal_item_di_class_hw }

destructor TNotafiscal_item_di_class_hw.Destroy;
begin
  if Assigned(Fadi) then
    FreeAndNil(Fadi);
  inherited;
end;

{ TNotafiscal_class_hw }

constructor TNotafiscal_class_hw.Create(ATributos: TributoDFeContextEtdList);
var
  trib: TributoDFeContextEtd;
begin
  inherited Create;
  Fprod := TObjectList<TNotafiscal_item_class_hw>.Create;
  Fpag  := TObjectList<TNotafiscal_pag_class_hw>.Create;

  if not Assigned(ATributos) then
    FTributos := TributosDFeDict.Create(0)
  else
  begin
    FTributos := TributosDFeDict.Create(ATributos.Count);
    while ATributos.Count > 0 do
    begin
      trib := TributoDFeContextEtd(ATributos.Items[0]);

      FTributos.Add(trib.Id, TributoDFeContextEtd(ATributos.Extract(trib)) );
    end;
  end;
end;

destructor TNotafiscal_class_hw.Destroy;
var
  I: Integer;
begin
  if Assigned(Fentrega) then
    FreeAndNil(Fentrega);
  if Assigned(Fretirada) then
    FreeAndNil(Fretirada);
  if Assigned(FautXML) then
    FreeAndNil(FautXML);
  if Assigned(Fnfref) then
    FreeAndNil(Fnfref);
  if Assigned(Fpag) then
    FreeAndNil(Fpag);
  if Assigned(FobsCont) then
    FreeAndNil(FobsCont);
  if Assigned(Fdefensivo) then
    FreeAndNil(Fdefensivo);
  if Assigned(FguiaTrans) then
    FreeAndNil(FguiaTrans);
  if Assigned(Fdup) then
    FreeAndNil(Fdup);
  if Assigned(Fprod) then
    FreeAndNil(Fprod);
  if Assigned(FeventoEPEC) then
    FreeAndNil(FeventoEPEC);

  for I := 0 to FTributos.Values.Count - 1 do
    FTributos.Values.Free();

  FTributos.Clear();

  FreeAndNil(FTributos);

  inherited;
end;

function TNotafiscal_class_hw.GetsitNFe: SituacaoNFeHW;
begin
  Result := THwAux.StrToSituacaoNFe(situacao_nfe);
end;

procedure TNotafiscal_class_hw.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  inherited;
  freteconta_tr := IfThen(freteconta_tr.Equals('0'), '2') +
                   IfThen(freteconta_tr.Equals('1'), '0') +
                   IfThen(freteconta_tr.Equals('2'), '1') +
                   IfThen(freteconta_tr.IndexOfAny(['3', '4', '9']) > -1, freteconta_tr);
end;

{ TNotafiscal_item_detexport_class_hw }

destructor TNotafiscal_item_detexport_class_hw.Destroy;
begin
  if Assigned(FexportInd) then
    FreeAndNil(FexportInd);
  inherited;
end;

{ TNFRef }

destructor TNFRef.Destroy;
begin
  if Assigned(FrefNFe) then
    FreeAndNil(FrefNFe);
  if Assigned(FrefECF) then
    FreeAndNil(FrefECF);
  if Assigned(FrefNF) then
    FreeAndNil(FrefNF);
  inherited;
end;

{ THwNFe }

constructor THwNFe.Create;
begin
  inherited Create;
  FlistError := TStringList.Create;
  conf := TConfigCentralNFe.Create(THwCentralNFe(Self));

  SetupDFeInitialize( Self.Banco );
end;

destructor THwNFe.Destroy;
begin
  if Assigned(FlistError) then
    FreeAndNil(FlistError);
  if Assigned(emp) then
    FreeAndNil(emp);
  if Assigned(conf) then
    FreeAndNil(conf);
  if Assigned(formStatus) then
    FreeAndNil(formStatus);

  SetupDFeShutDown();

  inherited;
end;

function THwNFe.GetCodigo(Atabela: string): Integer;
begin
  Result := SqlOpen('select cod from incrementa_codigo(' +
                    Fcod_empresa.ToString + ', ' +
                    Atabela.QuotedString  + ')').FieldByName('cod').AsInteger;
  if QrAux.Transaction.InTransaction then
    QrAux.Transaction.Commit;
end;

function THwNFe.GetEmpresa_nfe: TEmpresa_nfe_class;
begin
  if SqlOpen('select ' + TEmpresa_nfe_class.GetFieldsSql + ' from empresa' +
             ' where cod_empresa = ' + Fcod_empresa.ToString).IsEmpty then
    Exit;

  Result := TEmpresa_nfe_class.Create;
  Result.SetValuesFrom(QrAux);
end;

function THwNFe.GetInutilizacao(Nota: TNotafiscal_class_hw): TNotafiscal_inut_class_hw;
begin
  Result := nil;
  try
    if SqlOpen(
      'select * from notafiscal_inut' +
      ' where TPAMB = ''%s'' ' +
      ' and CNPJ = ''%s'' ' +
      ' and SERIE = %d ' +
      ' and NNFINI = %d ' +
      ' and NNFFIN = %d ' +
      ' and cod_empresa = %d',
      [Nota.nfe_tpamb, emp.cgc_emp, StrToInt(Nota.serie), Nota.num_nf, Nota.num_nf, cod_empresa]
    ).IsEmpty() then
      Exit;

    Result := TNotafiscal_inut_class_hw.Create;
    Result.SetValuesFrom(QrAux);

    QrAux.Close;

  except on E: Exception do
    begin
      FlistError.Append('GetInutilizacao: ' + e.Message);
      registraErro('THwNFe.GetInutilizacao ' + Nota.chave_nfe + ' ' + e.Message);
    end;
  end;
end;

function THwNFe.GetInutilizacao(Aseqid: Integer): TNotafiscal_inut_class_hw;
begin
  try
    if SqlOpen('select %s from notafiscal_inut' +
               ' where seqid = %d and cod_empresa = %d',
               [TNotafiscal_inut_class_hw.GetFieldsSql, Aseqid, cod_empresa]).IsEmpty then
      Exit;

    Result := TNotafiscal_inut_class_hw.Create;
    Result.SetValuesFrom(QrAux);

    QrAux.Close;

  except on E: Exception do
    begin
      FlistError.Append('GetInutilizacao: ' + e.Message);
      registraErro('THwNFe.GetInutilizacao ' + Aseqid.ToString + ' ' + e.Message);
    end;
  end;
end;

function THwNFe.GetNotaFiscal(Acod_nf: Integer): TNotafiscal_class_hw;
var
  Aprod    : TObjectList<TNotafiscal_item_class_hw>;
  Adup     : TObjectList<TNotafiscal_dup_class_hw>;
  Apag     : TObjectList<TNotafiscal_pag_class_hw>;
  Anfref   : TObjectList<TNFRef>;
  Aentrega : TNotafiscal_sped_c115_class_hw;
  Aretirada: TNotafiscal_sped_c115_class_hw;
  ATributos: TributoDFeContextEtdList;
begin
  Result := nil;
  try
    if SqlOpen('select %s from notafiscal' +
               ' where cod_nf = %d and cod_empresa = %d',
               [TNotafiscal_class_hw.GetFieldsSql, Acod_nf, cod_empresa]).IsEmpty then
      Exit;

    ATributos := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateListarTributosNFePorIdUseCase()
      .Executar( Acod_nf, cod_empresa );

    try
      Result := TNotafiscal_class_hw.Create(ATributos);

    finally
      ATributos.Free();
    end;

    Result.SetValuesFrom(QrAux);

    GetNotaFiscal_nfref(Result);
    GetNotaFiscal_retirada(Result);
    GetNotaFiscal_entrega(Result);
    GetNotaFiscal_autXML(Result);
    GetNotaFiscal_prod(Result);
    GetNotaFiscal_transporta(Result);
    GetNotaFiscal_dup(Result);
    GetNotaFiscal_pag(Result);
    GetNotaFiscal_procRef(Result);
    GetNotaFiscal_obsCont(Result);
    GetNotaFiscal_defensivo(Result);
    GetNotaFiscal_guiTransito(Result);
    GetNotaFiscal_eventoEPEC(Result);
    GetNotaFiscal_eventoCanc(Result);
    GetNotaFiscal_eventosCCe(Result);

    QrAux.Close;

    {$REGION 'NFRef Checagem para nao referenciar no Item e no cabeçalho'}
    // A Regra de validacao diz pra nao ter referencia nenhuma no cabeçalho
    for var ADet in Result.prod do
      if not ADet.chave_nfe_ref.IsEmpty() and Assigned(Result.nfref) then
        Result.nfref.Clear();
        { caso remover apenas a nota que esta referida no item
        for var iRef := Result.nfref.Count - 1 downto 0 do
          if Assigned(Result.nfref.Items[iRef].refNFe) and
            Result.nfref.Items[iRef].refNFe.chave_nfe_ref.Equals(ADet.chave_nfe_ref) then
          begin
            Result.nfref.Delete(iRef);
          end;
        }
    {$ENDREGION}

  except on E: Exception do
    begin
      FreeAndNil(Result);

      FlistError.Append('GetNotaFiscal: ' + e.Message);
      registraErro('THwNFe.GetNotaFiscal ' + Acod_nf.ToString + ' ' + e.Message);
    end;
  end;
end;

procedure THwNFe.GetNotaFiscal_autXML(var Anota: TNotafiscal_class_hw);
var
  AautXML, Alist: TStringList;
  Aaut: string;
begin
  SqlOpen('select NFE_AUTXML as valor from empresa' +
          ' where cod_empresa = ' + Anota.cod_empresa.ToString +
          ' union ' +
          ' select NFE_AUTXML as valor from clientes' +
          ' where cod_cliente = ' + Anota.cod_cliente.ToString +
          ' and cod_empresa = ' + Anota.cod_empresa.ToString).First;
  Alist := TStringList.Create;
  try
    Alist.Sorted := True;
    Alist.Duplicates := dupIgnore;
    while not QrAux.Eof do
    begin
      for Aaut in QrAux.FieldByName('valor').AsString.Trim.Split(['|', ',', ';', ' ']) do
        if not Aaut.Trim.IsEmpty then
          Alist.Add(Aaut);
      QrAux.Next;
    end;

    if Alist.Count > 0 then
    begin
      AautXML := TStringList.Create;
      AautXML.Sorted := True;
      AautXML.Duplicates := dupIgnore;

      for Aaut in Alist do
        AautXML.Add(Aaut);

      Anota.autXML := AautXML;
    end;
  finally
    FreeAndNil(Alist);
  end;
end;

procedure THwNFe.GetNotaFiscal_defensivo(var Anota: TNotafiscal_class_hw);
var
  Adefensivo: TNotafiscal_defensivo;
begin
  SqlOpen('select * from notafiscal_defensivo' +
          ' where cod_nf = ' + Anota.cod_nf.ToString +
          ' and cod_empresa = ' + Anota.cod_empresa.ToString +
          ' order by cpfresptec, nreceituario'
  ).First;
  while not QrAux.Eof do
  begin
    if not Assigned(Anota.defensivo) then
      Anota.defensivo := TObjectList<TNotafiscal_defensivo>.Create();

    Adefensivo := TNotafiscal_defensivo.Create;
    Adefensivo.CopyFrom(QrAux);

    Anota.defensivo.Add(Adefensivo);

    QrAux.Next;
  end;
end;

procedure THwNFe.GetNotaFiscal_dup(var Anota: TNotafiscal_class_hw);
var
  Adup: TNotafiscal_dup_class_hw;
begin
  SqlOpen('select %s from notafiscal_dup' +
          ' where cod_nf = %d and cod_empresa = %d' +
          ' order by %s',
          [TNotafiscal_dup_class.GetFieldsSql, Anota.cod_nf, Anota.cod_empresa,
           IfThen(conf.dupSequencial, 'ndup', 'dvenc')]).First;
  while not QrAux.Eof do
  begin
    if not Assigned(Anota.dup) then
      Anota.dup := TObjectList<TNotafiscal_dup_class_hw>.Create();

    Adup := TNotafiscal_dup_class_hw.Create;
    Adup.SetValuesFrom(QrAux);

    Anota.dup.Add(Adup);

    QrAux.Next;
  end;
end;

procedure THwNFe.GetNotaFiscal_dup_html_bol(var Anota: TNotafiscal_class_hw);
var
  I: Integer;
begin
  if Assigned(Anota.dup) then
    for I := 0 to Anota.dup.Count - 1 do
      if Anota.dup.Items[I].n_seq_bol > 0 then
      begin
        if not SqlOpen('select HTMLBOLETO, NOSSO_NUMERO_BANCO, API_IDINTEGRACAO, API_URLBOLETO from boletas' +
                       ' where n_seq_bol = ' + Anota.dup.Items[I].n_seq_bol.ToString +
                       ' and cod_empresa = ' + Anota.dup.Items[I].cod_empresa.ToString +
                       ' and ativo = 1').IsEmpty then
        begin
          {
          Anota.dup.Items[I].htmlBoleto := TStringList.Create;
          Anota.dup.Items[I].htmlBoleto.Text := QrAux.FieldByName('HTMLBOLETO').AsString;
          }
          Anota.dup.Items[I].HandleDadosBoleto(
            QrAux.FieldByName('API_IDINTEGRACAO').AsString,
            QrAux.FieldByName('API_URLBOLETO').AsString,
            QrAux.FieldByName('HTMLBOLETO').AsString);
        end;
        Anota.dup.Items[I].NossoNumero     := QrAux.FieldByName('NOSSO_NUMERO_BANCO').AsString.Trim;
      end;
end;

procedure THwNFe.GetNotaFiscal_entrega(var Anota: TNotafiscal_class_hw);
var
  Aentrega: TNotafiscal_sped_c115_class_hw;
  AentregaV2: TNotafiscal_coleta_entrega_class;
begin
  if not SqlOpen('select %s from notafiscal_coleta_entrega where cod_nf = %d and cod_empresa = %d and tipo = 1',
                 [TNotafiscal_coleta_entrega_class.GetFieldsSql(), Anota.cod_nf, Anota.cod_empresa]).IsEmpty then
  begin
    AentregaV2 := TNotafiscal_coleta_entrega_class.Create;
    AentregaV2.SetValuesFrom(QrAux);
    Anota.entregaV2 := AentregaV2;
    Exit;
  end;

  if SqlOpen('select first 1 %s from notafiscal_sped_c115' +
             ' where cod_nf = %d and cod_empresa = %d' +
             ' and coalesce(nfe_xlgr_entg, '''') <> ''''',
             [TNotafiscal_sped_c115_class_hw.GetFieldsSql, Anota.cod_nf, Anota.cod_empresa]
            ).FieldByName('nfe_xlgr_entg').AsString.Trim.IsEmpty then
    Exit;

  Aentrega := TNotafiscal_sped_c115_class_hw.Create;
  Aentrega.SetValuesFrom(QrAux);
  Anota.entrega := Aentrega;
end;

procedure THwNFe.GetNotaFiscal_eventoCanc(var Anota: TNotafiscal_class_hw);
var
  AeventoCanc: TNotafiscal_carta_correcao_class_hw;
begin
  if SqlOpen('select first 1 %s from notafiscal_carta_correcao' +
             ' where cod_nf = ' + Anota.cod_nf.ToString +
             ' and cod_empresa = ' + Anota.cod_empresa.ToString +
             ' and tipo_evento = ' + strEventoCan.QuotedString,
             [TNotafiscal_carta_correcao_class_hw.GetFieldsSql]).IsEmpty then
    Exit;

  AeventoCanc := TNotafiscal_carta_correcao_class_hw.Create;
  AeventoCanc.SetValuesFrom(QrAux);
  Anota.eventoCanc := AeventoCanc;
end;

procedure THwNFe.GetNotaFiscal_eventoEPEC(var Anota: TNotafiscal_class_hw);
var
  AeventoEPEC: TNotafiscal_carta_correcao_class_hw;
begin
  if SqlOpen('select first 1 %s from notafiscal_carta_correcao' +
             ' where cod_nf = ' + Anota.cod_nf.ToString +
             ' and cod_empresa = ' + Anota.cod_empresa.ToString +
             ' and nseqevento = 1 and tipo_evento = ' + strEventoEPEC.QuotedString,
             [TNotafiscal_carta_correcao_class_hw.GetFieldsSql]).IsEmpty then
    Exit;

  AeventoEPEC := TNotafiscal_carta_correcao_class_hw.Create;
  AeventoEPEC.SetValuesFrom(QrAux);
  Anota.eventoEPEC := AeventoEPEC;
end;

procedure THwNFe.GetNotaFiscal_eventosCCe(var Anota: TNotafiscal_class_hw);
var
  AeventoCCe : TNotafiscal_carta_correcao_class_hw;
begin
  if SqlOpen('select %s from notafiscal_carta_correcao' +
             ' where cod_nf = ' + Anota.cod_nf.ToString +
             ' and cod_empresa = ' + Anota.cod_empresa.ToString +
             ' and tipo_evento = ' + strEventoCCe.QuotedString +
             ' order by idlote',
             [TNotafiscal_carta_correcao_class_hw.GetFieldsSql]).IsEmpty then
    Exit;

  QrAux.First;
  while not QrAux.Eof do
  begin
    if not Assigned(Anota.eventosCCe) then
      Anota.eventosCCe := TObjectList<TNotafiscal_carta_correcao_class_hw>.Create;

    AeventoCCe := TNotafiscal_carta_correcao_class_hw.Create;
    AeventoCCe.SetValuesFrom(QrAux);

    Anota.eventosCCe.Add(AeventoCCe);

    QrAux.Next;
  end;
end;

procedure THwNFe.GetNotaFiscal_guiTransito(var Anota: TNotafiscal_class_hw);
var
  AguiaTransito: TNotafiscal_guiatransito;
begin
  SqlOpen('select * from notafiscal_guiatransito' +
          ' where cod_nf = ' + Anota.cod_nf.ToString +
          ' and cod_empresa = ' + Anota.cod_empresa.ToString
  ).First;

  if QrAux.RecordCount = 0 then
    Exit;

  Anota.guiaTrans := TNotafiscal_guiatransito.Create;
  Anota.guiaTrans.CopyFrom(QrAux);

  QrAux.Close;
end;

procedure THwNFe.GetNotaFiscal_nfref(var Anota: TNotafiscal_class_hw);
var
  Arefnf: TNFRef;
  Ac113: TNotafiscal_sped_c113_class_hw;
  AlistC113: TObjectList<TNotafiscal_sped_c113_class_hw>;
begin
  SqlOpen('select %s from notafiscal_sped_c113' +
          ' where cod_nf = ' + Anota.cod_nf.ToString +
          ' and cod_empresa = ' + Anota.cod_empresa.ToString,
          [TNotafiscal_sped_c113_class.GetFieldsSql]).First;
  if not QrAux.IsEmpty then
  begin
    AlistC113 := TObjectList<TNotafiscal_sped_c113_class_hw>.Create;

    while not QrAux.Eof do
    begin
      Ac113 := TNotafiscal_sped_c113_class_hw.Create();
      Ac113.SetValuesFrom(QrAux);
      AlistC113.Add(Ac113);
      QrAux.Next;
    end;

    for Ac113 in AlistC113 do
    begin
      if (Ac113.cod_nf_ref > 0) and (Ac113.chave_nfe_ref.Trim.IsEmpty) then
        if not SqlOpen('select nf.num_nf, nf.modelo_nf, nf.serie, coalesce(es.ibge_codigo_uf, es2.ibge_codigo_uf) cuf,' +
                       ' nf.data_contabil, coalesce(nf.cpfcgc, cl.cpfcgc) cpfcgc, nf.chave_nfe' +
                       ' from notafiscal nf' +
                       ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
                       ' left join estados es on es.sigla_uf = nf.dest_uf' +
                       ' left join estados es2 on es2.codigo_uf = cl.codigo_uf' +
                       ' where nf.cod_nf = ' + Ac113.cod_nf_ref.ToString +
                       ' and nf.cod_empresa = ' + Ac113.cod_empresa.ToString).IsEmpty then
          if not QrAux.FieldByName('chave_nfe').AsString.Trim.IsEmpty then
            Ac113.chave_nfe_ref := QrAux.FieldByName('chave_nfe').AsString.Trim
          else
          begin
            Ac113.chave_nfe_ref := '';
            Ac113.nnf           := QrAux.FieldByName('num_nf').AsInteger;
            Ac113.modelo        := StrToIntDef(QrAux.FieldByName('modelo_nf').AsString.Trim, 0);
            Ac113.serie         := StrToIntDef(QrAux.FieldByName('serie').AsString.Trim, 0);
            Ac113.cuf           := QrAux.FieldByName('cuf').AsInteger;
            Ac113.aamm          := FormatDateTime('YYMM', QrAux.FieldByName('data_contabil').AsDateTime);
            Ac113.cnpj          := QrAux.FieldByName('cpfcgc').AsString;
          end;
    end;
  end;

  if (Anota.num_nf_compl > 0) and (not Anota.serie_compl.IsEmpty) then
    if not  SqlOpen('select chave_nfe as valor from notafiscal' +
                    ' where serie = ' + Anota.serie_compl.QuotedString +
                    ' and cod_empresa = ' + Anota.cod_empresa.ToString +
                    ' and num_nf = ' + Anota.num_nf_compl.ToString).FieldByName('valor').AsString.Trim.IsEmpty then
    begin
      Ac113 := TNotafiscal_sped_c113_class_hw.Create;
      Ac113.chave_nfe_ref := QrAux.FieldByName('valor').AsString.Trim;
      if not Assigned(AlistC113) then
        AlistC113 := TObjectList<TNotafiscal_sped_c113_class_hw>.Create;
      AlistC113.Add(Ac113);
    end;

  if Assigned(AlistC113) then
    if AlistC113.Count > 0 then
    begin
      Anota.nfref := TObjectList<TNFRef>.Create();
      for Ac113 in AlistC113 do
      begin
        Arefnf := TNFRef.Create;
        if Ac113.chave_nfe_ref.Trim.IsEmpty then
          Arefnf.refNF := Ac113
        else
          Arefnf.refNFe := Ac113;
        Anota.nfref.Add(Arefnf);
      end;
    end;

  if not SqlOpen('select %s from notafiscal_sped_c114' +
                 ' where cod_nf = ' + Anota.cod_nf.ToString +
                 ' and cod_empresa = ' + Anota.cod_empresa.ToString,
                 [TNotafiscal_sped_c114_class.GetFieldsSql]).IsEmpty then
  begin
    if not Assigned(Anota.nfref) then
      Anota.nfref := TObjectList<TNFRef>.Create();

    QrAux.First;
    while not QrAux.Eof do
    begin
      Arefnf := TNFRef.Create;
      Arefnf.refECF := TNotafiscal_sped_c114_class_hw.Create;
      Arefnf.refECF.SetValuesFrom(QrAux);
      Anota.nfref.Add(Arefnf);

      QrAux.Next;
    end;
  end;
end;

procedure THwNFe.GetNotaFiscal_obsCont(var Anota: TNotafiscal_class_hw);
var
  AobsCont: TNotafiscal_obscont_hw;
begin
  SqlOpen('select %s from notafiscal_obscont' +
          ' where cod_nf = ' + Anota.cod_nf.ToString +
          ' and cod_empresa = ' + Anota.cod_empresa.ToString +
          ' order by seqid',
          [TNotafiscal_obscont_class.GetFieldsSql]).First;
  while not QrAux.Eof do
  begin
    if not Assigned(Anota.obsCont) then
      Anota.obsCont := TObjectList<TNotafiscal_obscont_hw>.Create();

    AobsCont := TNotafiscal_obscont_hw.Create;
    AobsCont.CopyFrom(QrAux);

    Anota.obsCont.Add(AobsCont);

    QrAux.Next;
  end;
end;

procedure THwNFe.GetNotaFiscal_pag(var Anota: TNotafiscal_class_hw);
var
  Apag: TNotafiscal_pag_class_hw;
begin
  SqlOpen('select np.*, c.nome_ctrl from notafiscal_pag np' +
          ' left join controles c on c.codigo_ctrl = np.cod_controle and c.codigo_emp = np.cod_empresa' +
          ' where np.cod_nf = ' + Anota.cod_nf.ToString +
          ' and np.cod_empresa = ' + Anota.cod_empresa.ToString +
          ' order by np.seqid').First;
  while not QrAux.Eof do
  begin
    Apag := TNotafiscal_pag_class_hw.Create;
    Apag.SetValuesFrom(QrAux, True);
    if Apag.xpag.Trim.IsEmpty  then
      Apag.xpag := QrAux.FieldByName('nome_ctrl').AsString;

    Anota.pag.Add(Apag);

    QrAux.Next;
  end;
end;

procedure THwNFe.GetNotaFiscal_procRef(var Anota: TNotafiscal_class_hw);
var
  Aprocref: TNotafiscal_sped_c111_class_hw;
begin
  SqlOpen('select %s from notafiscal_sped_c111' +
          ' where cod_nf = ' + Anota.cod_nf.ToString +
          ' and cod_empresa = ' + Anota.cod_empresa.ToString,
          [TNotafiscal_sped_c111_class.GetFieldsSql]).First;
  while not QrAux.Eof do
  begin
    if not Assigned(Anota.procRef) then
      Anota.procRef := TObjectList<TNotafiscal_sped_c111_class_hw>.Create();

    Aprocref := TNotafiscal_sped_c111_class_hw.Create;
    Aprocref.SetValuesFrom(QrAux);

    Anota.procRef.Add(Aprocref);

    QrAux.Next;
  end;
end;

procedure THwNFe.GetNotaFiscal_prod(var Anota: TNotafiscal_class_hw);
var
  Aprod: TNotafiscal_item_class_hw;
  I: Integer;
begin
  SqlOpen('select ' + TNotafiscal_item_class_hw.GetFieldsSql() + ' from notafiscal_item' +
          ' where cod_nf = ' + Anota.cod_nf.ToString +
          ' and cod_empresa = ' + Anota.cod_empresa.ToString +
          ' order by nitem').First;
  while not QrAux.Eof do
  begin
    Aprod := TNotafiscal_item_class_hw.Create;
    Aprod.SetValuesFrom(QrAux, Anota);

    if not Anota.nfe_tpamb.Equals('1') and (QrAux.RecNo = 1) then
      Aprod.descricao_item := 'NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';

    Aprod.repasseST := IfThen(Aprod.cst.Substring(1, 2).Equals('60') and
                              (conf.anpRepasse.IndexOf(Aprod.comb_cprodanp) >= 0),'rep');

    if not Aprod.dfe_trib_id.Trim().IsEmpty() then
      if Anota.Tributos.ContainsKey(Aprod.dfe_trib_id) then
      begin
        Aprod.TributoRtc := Anota.Tributos[Aprod.dfe_trib_id];
        Anota.Tributos.Remove(Aprod.dfe_trib_id);
      end;

    Anota.prod.Add(Aprod);

    QrAux.Next;
  end;

  for I := 0 to Anota.prod.Count - 1 do
  begin
    Aprod := Anota.prod.Items[I];
    GetNotaFiscal_prod_veic(Aprod);
    GetNotaFiscal_prod_di(Aprod);
    GetNotaFiscal_prod_detExport(Aprod);
  end;

end;

procedure THwNFe.GetNotaFiscal_prod_detExport(var Aprod: TNotafiscal_item_class_hw);
var
  AdetExport: TNotafiscal_item_detexport_class_hw;
  I: Integer;
begin
  SqlOpen('select * from notafiscal_item_detexport' +
          ' where cod_nf = ' + Aprod.cod_nf.ToString +
          ' and cod_empresa = ' + Aprod.cod_empresa.ToString +
          ' and nitem = ' + Aprod.nitem.ToString +
          ' order by nitem_det').First;
  while not QrAux.Eof do
  begin
    if not Assigned(Aprod.detExport) then
      Aprod.detExport:= TObjectList<TNotafiscal_item_detexport_class_hw>.Create();

    AdetExport := TNotafiscal_item_detexport_class_hw.Create;
    AdetExport.SetValuesFrom(QrAux);

    Aprod.detExport.Add(AdetExport);

    QrAux.Next;
  end;

  if Assigned(Aprod.detExport) then
    for I := 0 to Aprod.detExport.Count - 1 do
    begin
      AdetExport := Aprod.detExport.Items[I];
      GetNotaFiscal_prod_exportInd(AdetExport);
    end;
end;

procedure THwNFe.GetNotaFiscal_prod_di(var Aprod: TNotafiscal_item_class_hw);
var
  Adi: TNotafiscal_item_di_class_hw;
  I: Integer;
begin
  SqlOpen('select * from notafiscal_item_di' +
          ' where cod_nf = ' + Aprod.cod_nf.ToString +
          ' and cod_empresa = ' + Aprod.cod_empresa.ToString +
          ' and nitem = ' + Aprod.nitem.ToString +
          ' order by nitem_di').First;
  while not QrAux.Eof do
  begin
    if not Assigned(Aprod.di) then
      Aprod.di := TObjectList<TNotafiscal_item_di_class_hw>.Create();

    Adi := TNotafiscal_item_di_class_hw.Create;
    Adi.SetValuesFrom(QrAux);

    Aprod.di.Add(Adi);

    QrAux.Next;
  end;

  if Assigned(Aprod.di) then
    for I := 0 to Aprod.di.Count - 1 do
    begin
      Adi := Aprod.di.Items[I];
      GetNotaFiscal_prod_di_adi(Adi);
    end;
end;

procedure THwNFe.GetNotaFiscal_prod_di_adi(var _di: TNotafiscal_item_di_class_hw);
var
  Aadi: TNotafiscal_item_adi_class_hw;
begin
  SqlOpen('select * from notafiscal_item_adi' +
          ' where cod_nf = ' + _di.cod_nf.ToString +
          ' and cod_empresa = ' + _di.cod_empresa.ToString +
          ' and nitem = ' + _di.nitem.ToString +
          ' and nitem_di = ' + _di.nitem_di.ToString +
          ' order by nitem_adi').First;
  while not QrAux.Eof do
  begin
    if not Assigned(_di.adi) then
      _di.adi := TObjectList<TNotafiscal_item_adi_class_hw>.Create();

    Aadi := TNotafiscal_item_adi_class_hw.Create;
    Aadi.SetValuesFrom(QrAux);

    _di.adi.Add(Aadi);

    QrAux.Next;
  end;
end;

procedure THwNFe.GetNotaFiscal_prod_exportInd(var AdetExport: TNotafiscal_item_detexport_class_hw);
begin
  if not SqlOpen('select * from notafiscal_item_exportind' +
          ' where cod_nf = ' + AdetExport.cod_nf.ToString +
          ' and cod_empresa = ' + AdetExport.cod_empresa.ToString +
          ' and nitem = ' + AdetExport.nitem.ToString +
          ' and nitem_det = ' + AdetExport.nitem_det.ToString +
          ' order by nitem_exind').IsEmpty then
  begin
    if not Assigned(AdetExport.exportInd) then
      AdetExport.exportInd := TNotafiscal_item_exportind_class_hw.Create();

    AdetExport.exportInd.SetValuesFrom(QrAux);
  end;
end;

procedure THwNFe.GetNotaFiscal_prod_veic(var Aprod: TNotafiscal_item_class_hw);
var
  Aveic: TNotafiscal_item_veiculo_class_hw;
begin
  if SqlOpen('select first 1 ni.*, cf.codcordenatram,' +
             ' m.cmkg, m.distanciaeixo, m.tip_veiculo, m.esprenavam, m.pesol, m.pesob, m.tpcomb, m.lotacao, m.tpcomb as tpcomb_m' +
             ' from notafiscal_item_veiculo ni' +
             ' left join codigo_corfab cf on ni.cod_cor = cf.cod_cor' +
             ' left join tipmodelo m on m.codigo = ni.versao and m.cod_empresa = ni.cod_empresa' +
             ' where ni.cod_nf = ' + Aprod.cod_nf.ToString +
             ' and ni.cod_empresa = ' + Aprod.cod_empresa.ToString +
             ' and ni.nitem = ' + Aprod.nitem.ToString).IsEmpty then
    Exit;

  if QrAux.FieldByName('tipo_venda').AsString.Trim().Equals('U') and
    not conf.veicDetUsado then
    Exit();  

  Aveic := TNotafiscal_item_veiculo_class_hw.Create;
  Aveic.SetValuesFrom(QrAux);
  Aprod.infAdProd := Aveic.infAdProd;
  Aprod.veic      := Aveic;
end;

procedure THwNFe.GetNotaFiscal_retirada(var Anota: TNotafiscal_class_hw);
var
  Aretirada: TNotafiscal_sped_c115_class_hw;
  AretiradaV2: TNotafiscal_coleta_entrega_class;
begin
  if not SqlOpen('select %s from notafiscal_coleta_entrega where cod_nf = %d and cod_empresa = %d and tipo = 0',
                 [TNotafiscal_coleta_entrega_class.GetFieldsSql(), Anota.cod_nf, Anota.cod_empresa]).IsEmpty then
  begin
    AretiradaV2 := TNotafiscal_coleta_entrega_class.Create;
    AretiradaV2.SetValuesFrom(QrAux);
    Anota.retiradaV2 := AretiradaV2;
    Exit;
  end;

  if SqlOpen('select first 1 * from notafiscal_sped_c115' +
             ' where cod_nf = ' + Anota.cod_nf.ToString +
             ' and cod_empresa = ' + Anota.cod_empresa.ToString +
             ' and coalesce(nfe_xlgr_col, '''') <> ''''').FieldByName('nfe_xlgr_col').AsString.Trim.IsEmpty then
    Exit;

  Aretirada := TNotafiscal_sped_c115_class_hw.Create;
  Aretirada.SetValuesFrom(QrAux);
  Anota.retirada := Aretirada;
end;

procedure THwNFe.GetNotaFiscal_transporta(var Anota: TNotafiscal_class_hw);
var
  Atransporta: TTransportador_class_hw;
begin
  if Anota.codigo_tr <= 0 then
    Exit;

  if SqlOpen('select tr.*, es.sigla_uf from transportador tr' +
             ' left join estados es on es.codigo_uf = tr.uf_tr' +
             ' where codigo_tr = ' + Anota.codigo_tr.ToString +
             ' and cod_empresa = ' + Anota.cod_empresa.ToString).IsEmpty then
    Exit;

  Atransporta := TTransportador_class_hw.Create;
  Atransporta.SetValuesFrom(QrAux);
  Anota.transporta := Atransporta;
end;

function THwNFe.Limpar_dados_envio(Anota: TNotafiscal_class_hw;
  Acommit: Boolean): Boolean;
begin
  try
    SqlExec('update notafiscal set situacao_nfe = '   + Anota.situacao_nfe.QuotedString +
            ', descricaoerro = '+ Anota.descricaoerro.Substring(0, 50).QuotedString +
            IfThen(Anota.nfe_cmsg > 0        , ', nfe_cmsg = ' + Anota.nfe_cmsg.ToString) +
            IfThen(not Anota.nfe_xmsg.IsEmpty, ', nfe_xmsg = ' + Anota.nfe_xmsg.Substring(0, 200).QuotedString) +
            ' where cod_nf = '      + Anota.cod_nf.ToString +
            ' and cod_empresa = '   + Anota.cod_empresa.ToString);

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Limpar_dados_envio ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_erro_na_autorizacao(Anota: TNotafiscal_class_hw; Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text :=
      'update notafiscal set descricaoerro = ' + Anota.descricaoerro.Substring(0, 50).QuotedString +
      ' where cod_nf = '      + Anota.cod_nf.ToString +
      ' and cod_empresa = '   + Anota.cod_empresa.ToString;
    QrAux.ExecSQL;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_erro_na_autorizacao ' + e.Message);
    end;
  end;
end;

procedure THwNFe.CriarEventoCancelamento(var Nota: TNotafiscal_class_hw);
begin
  try
    QrAux.Close;
    QrAux.SQL.Text :=
      'insert into NOTAFISCAL_CARTA_CORRECAO ' +
      '(COD_NF, COD_EMPRESA, XCORRECAO, TIPO_EVENTO, NSEQEVENTO, IDLOTE) ' +
      'values (:COD_NF, :COD_EMPRESA, :XCORRECAO, :TIPO_EVENTO, ' +
      '  (coalesce((select max(NSEQEVENTO) from NOTAFISCAL_CARTA_CORRECAO' +
      '       where COD_NF = :COD_NF and COD_EMPRESA = :COD_EMPRESA and TIPO_EVENTO = :TIPO_EVENTO ' +
      '     ), 0) + 1 ' +
      '  ), ' +
      '  (select COD from INCREMENTA_CODIGO(:COD_EMPRESA, ''NOTAFISCAL_CARTA_CORRECAO'')) ' +
      ')';
    QrAux.ParamByName('COD_NF').AsInteger := Nota.cod_nf;
    QrAux.ParamByName('COD_EMPRESA').AsInteger := Nota.cod_empresa;
    QrAux.ParamByName('XCORRECAO').AsString := 'CANCELAMENTO POR SUBSTITUICAO POR NFE EM CONTINGENCIA';
    QrAux.ParamByName('TIPO_EVENTO').AsString := strEventoCan;
    QrAux.ExecSQL;

    GetNotaFiscal_eventoCanc(Nota);

  except on E: Exception do
    begin
      listError.Add('CriarEventoCancelamento ' + e.Message);
      registraErro('THwNFe.CriarEventoCancelamento ' + Nota.chave_nfe + ' ' + e.Message);
    end;
  end;
end;

function THwNFe.CriarNovaInutilizacao(Nota: TNotafiscal_class_hw): TNotafiscal_inut_class_hw;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text :=
      'insert into notafiscal_inut ' +
      ' (cod_empresa, tpamb, ano, cnpj, modelo, serie, nnfini, nnffin, xjust) ' +
      ' values (:cod_empresa, :tpamb, :ano, :cnpj, :modelo, :serie, :nnfini, :nnffin, :xjust)';
    QrAux.ParamByName('cod_empresa').AsInteger := Nota.cod_empresa;
    QrAux.ParamByName('tpamb').AsString := Nota.nfe_tpamb;
    QrAux.ParamByName('ano').AsInteger := StrToInt(YearOf(Date()).ToString().Substring(2));
    QrAux.ParamByName('cnpj').AsString := emp.cgc_emp;
    QrAux.ParamByName('modelo').AsString := Nota.modelo_nf;
    QrAux.ParamByName('serie').AsInteger := StrToInt(Nota.serie);
    QrAux.ParamByName('nnfini').AsInteger := Nota.num_nf;
    QrAux.ParamByName('nnffin').AsInteger := Nota.num_nf;
    QrAux.ParamByName('xjust').AsString := 'INUTILIZACAO POR SUBSTITUICAO EM CONTINGENCIA';
    QrAux.ExecSQL;

    Result := GetInutilizacao(Nota);

  except on E: Exception do
    begin
      listError.Add('Criar_nova_inutilizacao ' + e.Message);
      registraErro('THwNFe.Criar_nova_inutilizacao ' + Nota.chave_nfe + ' ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_pre_autorizacao(Anota: TNotafiscal_class_hw;
  Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text := 'update notafiscal set xml_nfe = :xml_nfe'   +
                      IfThen(Anota.lote_nfe > 0            , ', lote_nfe = '     + Anota.lote_nfe.ToString) +
                      IfThen(not Anota.situacao_nfe.IsEmpty, ', situacao_nfe = ' + Anota.situacao_nfe.QuotedString) +
                      IfThen(not Anota.chave_nfe.IsEmpty   , ', chave_nfe = '    + Anota.chave_nfe.QuotedString) +
                      ' where cod_nf = '      + Anota.cod_nf.ToString +
                      ' and cod_empresa = '   + Anota.cod_empresa.ToString;
    QrAux.ParamByName('xml_nfe').AsString := Anota.xml_nfe.Text;
    QrAux.ExecSQL;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_pre_autorizacao ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_pre_autorizacao_epec(Anota: TNotafiscal_class_hw;
  Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text := 'update notafiscal_carta_correcao set xml_nfe_epec = :xml_nfe_epec'   +
                      IfThen(Anota.eventoEPEC.lote_epec > 0       , ', lote_epec = ' + Anota.eventoEPEC.lote_epec.ToString) +
                      IfThen(not Anota.eventoEPEC.situacao.IsEmpty, ', situacao = '  + Anota.eventoEPEC.situacao.QuotedString) +
                      IfThen(not Anota.eventoEPEC.id_dfe.IsEmpty  , ', id_dfe = '    + Anota.eventoEPEC.id_dfe.Substring(0, 52).QuotedString) +
                      ' where cod_nf = '    + Anota.eventoEPEC.cod_nf.ToString +
                      ' and cod_empresa = ' + Anota.eventoEPEC.cod_empresa.ToString +
                      ' and idlote = '      + Anota.eventoEPEC.idlote.ToString +
                      ' and nseqevento = '  + Anota.eventoEPEC.nseqevento.ToString;
    QrAux.ParamByName('xml_nfe_epec').AsString := Anota.eventoEPEC.xml_nfe_epec.Text;
    QrAux.ExecSQL;

    if not Save_pre_autorizacao(Anota, False) then
      Exit;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_pre_autorizacao_epec ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_rejeicao(Anota: TNotafiscal_class_hw; Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text :=
      'update notafiscal set situacao_nfe = ' + Anota.situacao_nfe.QuotedString() +
      ', descricaoerro = ' + Anota.descricaoerro.Substring(0, 50).QuotedString() +
      ', nfe_cstat = '     + Anota.nfe_cstat.ToString() +
      ' where cod_nf = '      + Anota.cod_nf.ToString() +
      ' and cod_empresa = '   + Anota.cod_empresa.ToString();
    QrAux.ExecSQL;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_situacao ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_retorno_autorizacao(Anota: TNotafiscal_class_hw;
  Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text := 'update notafiscal set datahora_envio = :datahora_envio' +
                      ' ,situacao_nfe = ' + Anota.situacao_nfe.QuotedString +
                      IfThen(not Anota.hora_envio.IsEmpty   , ', hora_envio = '    + Anota.hora_envio.Substring(0, 08).QuotedString) +
                      IfThen(not Anota.nfe_recibo.IsEmpty   , ', nfe_recibo = '    + Anota.nfe_recibo.Substring(0, 20).QuotedString) +
                      IfThen(not Anota.protocolo.IsEmpty    , ', protocolo = '     + Anota.protocolo.Substring(0, 40).QuotedString) +
                      IfThen(not Anota.digest.IsEmpty       , ', digest = '        + Anota.digest.Substring(0, 40).QuotedString) +
                      IfThen(not Anota.descricaoerro.IsEmpty, ', descricaoerro = ' + Anota.descricaoerro.Substring(0, 50).QuotedString) +
                      IfThen(not Anota.nfe_xmsg.IsEmpty     , ', nfe_xmsg = '      + Anota.nfe_xmsg.Substring(0, 200).QuotedString) +
                      IfThen(Anota.nfe_cmsg > 0             , ', nfe_cmsg = '      + Anota.nfe_cmsg.ToString) +
                      IfThen(Anota.nfe_cstat > 0            , ', nfe_cstat = '     + Anota.nfe_cstat.ToString) +
                      IfThen(Anota.data_autorizacao > 0     , ', data_autorizacao = :data_autorizacao') +
                      IfThen(Anota.sitNFe in [stAutorizada, stDenegada], ', xml_nfe = :xml_nfe') +
                      ' where cod_nf = '      + Anota.cod_nf.ToString +
                      ' and cod_empresa = '   + Anota.cod_empresa.ToString;
    QrAux.ParamByName('datahora_envio').AsDateTime := Anota.datahora_envio;
    if Anota.data_autorizacao > 0 then
      QrAux.ParamByName('data_autorizacao').AsDateTime := Anota.data_autorizacao;
    if (Anota.sitNFe in [stAutorizada, stDenegada]) then
      QrAux.ParamByName('xml_nfe').AsString := Anota.xml_nfe.Text;
    QrAux.ExecSQL;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_retorno_autorizacao ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_retorno_autorizacao_epec(Anota: TNotafiscal_class_hw; Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    with  Anota.eventoEPEC do
    begin
      QrAux.SQL.Text := 'update notafiscal_carta_correcao set situacao = ' + situacao.QuotedString +
                        IfThen(cstat_proc > 0 , ', cstat_proc = '    + cstat_proc.ToString) +
                        IfThen(not xmotivo_proc.IsEmpty , ', xmotivo_proc = ' + xmotivo_proc.Substring(0, 255).QuotedString) +
                        IfThen(not cstat.IsEmpty        , ', cstat = '    + cstat.QuotedString) +
                        IfThen(not xmotivo.IsEmpty      , ', xmotivo = ' + xmotivo.Substring(0, 255).QuotedString) +
                        IfThen(not nprot.IsEmpty        , ', nprot = ' + nprot.Substring(0, 17).QuotedString) +
                        IfThen(not id_dfe.IsEmpty       , ', id_dfe = ' + id_dfe.Substring(0, 52).QuotedString) +
                        IfThen(dhevento > 0             , ', dhevento = :dhevento') +
                        IfThen(not xml_evento.Text.IsEmpty  , ', xml_evento = :xml_evento') +
                        IfThen(not xml_nfe_epec.Text.IsEmpty, ', xml_nfe_epec = :xml_nfe_epec') +
        ' where cod_nf = '    + cod_nf.ToString +
        ' and cod_empresa = ' + cod_empresa.ToString +
        ' and idlote = '      + idlote.ToString +
        ' and nseqevento = '  + nseqevento.ToString;
      if dhevento > 0 then
        QrAux.ParamByName('dhevento').AsDateTime := dhevento;
      if not xml_evento.Text.IsEmpty then
        QrAux.ParamByName('xml_evento').AsString := xml_evento.Text;
      if not xml_nfe_epec.Text.IsEmpty then
        QrAux.ParamByName('xml_nfe_epec').AsString := xml_nfe_epec.Text;
    end;
    QrAux.ExecSQL;

    if Anota.nfe_dpec_cstat > 0 then
      SqlExec('update notafiscal set tiponfe = ' + Anota.tiponfe.QuotedString +
              IfThen(not Anota.nfe_dpec_xmotivo.IsEmpty  , ', nfe_dpec_xmotivo = '  + Anota.nfe_dpec_xmotivo.Substring(0, 256).QuotedString) +
              IfThen(not Anota.nfe_dpec_nregdpec.IsEmpty , ', nfe_dpec_nregdpec = ' + Anota.nfe_dpec_nregdpec.Substring(0, 17).QuotedString) +
              IfThen(not Anota.situacao_nfe.IsEmpty      , ', situacao_nfe = '      + Anota.situacao_nfe.Substring(0, 40).QuotedString) +
              IfThen(not Anota.descricaoerro.IsEmpty     , ', descricaoerro = '      + Anota.descricaoerro.Substring(0, 50).QuotedString) +
              IfThen(Anota.nfe_dpec_cstat > 0            , ', nfe_dpec_cstat = '    + Anota.nfe_dpec_cstat.ToString) +
              ' where cod_nf = '      + Anota.cod_nf.ToString +
              ' and cod_empresa = '   + Anota.cod_empresa.ToString);

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_retorno_autorizacao ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_retorno_cancelamento(Anota: TNotafiscal_class_hw; Acommit: Boolean): Boolean;
begin
  try
    SqlExec('update notafiscal set situacao_nfe = ' + Anota.situacao_nfe.QuotedString +
            IfThen(not Anota.just_cancelamento.IsEmpty, ', just_cancelamento = '  + Anota.just_cancelamento.Replace(sLineBreak, ' ', [rfReplaceAll]).Substring(0, 60).QuotedString) +
            ' where cod_nf = '    + Anota.cod_nf.ToString +
            ' and cod_empresa = ' + Anota.cod_empresa.ToString);

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_retorno_cancelamento ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_retorno_consulta(Anota: TNotafiscal_class_hw;
  Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text := 'update notafiscal set situacao_nfe = ' + Anota.situacao_nfe.Substring(0, 40).QuotedString +
                      IfThen(not Anota.protocolo.IsEmpty    , ', protocolo = '     + Anota.protocolo.Substring(0, 40).QuotedString) +
                      IfThen(not Anota.digest.IsEmpty       , ', digest = '        + Anota.digest.Substring(0, 40).QuotedString) +
                      IfThen(not Anota.descricaoerro.IsEmpty, ', descricaoerro = ' + Anota.descricaoerro.Substring(0, 50).QuotedString) +
                      IfThen(Anota.nfe_cstat > 0            , ', nfe_cstat = '     + Anota.nfe_cstat.ToString) +
                      IfThen(Anota.data_autorizacao > 0     , ', data_autorizacao = :data_autorizacao') +
                      IfThen(Anota.sitNFe in [stAutorizada, stDenegada], ', xml_nfe = :xml_nfe') +
                      IfThen((Anota.sitNFe = stCancelada) and (not Anota.just_cancelamento.IsEmpty), ', just_cancelamento = ' + Anota.just_cancelamento.Replace(sLineBreak, ' ', [rfReplaceAll]).Substring(0, 60).QuotedString) +
                      ' where cod_nf = '      + Anota.cod_nf.ToString +
                      ' and cod_empresa = '   + Anota.cod_empresa.ToString;
    if Anota.data_autorizacao > 0 then
      QrAux.ParamByName('data_autorizacao').AsDateTime := Anota.data_autorizacao;
    if (Anota.sitNFe in [stAutorizada, stDenegada]) then
      QrAux.ParamByName('xml_nfe').AsString := Anota.xml_nfe.Text;
    QrAux.ExecSQL;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_retorno_consulta ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_retorno_evento(Aevento: TNotafiscal_carta_correcao_class_hw; Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    with Aevento do
    begin
      QrAux.SQL.Text := 'update notafiscal_carta_correcao set situacao = ' + situacao.QuotedString +
                        IfThen(cstat_proc > 0 , ', cstat_proc = '    + cstat_proc.ToString) +
                        IfThen(not xmotivo_proc.IsEmpty , ', xmotivo_proc = ' + xmotivo_proc.Substring(0, 255).QuotedString) +
                        IfThen(not cstat.IsEmpty        , ', cstat = '    + cstat.QuotedString) +
                        IfThen(not xmotivo.IsEmpty      , ', xmotivo = ' + xmotivo.Substring(0, 255).QuotedString) +
                        IfThen(not nprot.IsEmpty        , ', nprot = ' + nprot.Substring(0, 17).QuotedString) +
                        IfThen(not id_dfe.IsEmpty       , ', id_dfe = ' + id_dfe.Substring(0, 52).QuotedString) +
                        IfThen(dhevento > 0             , ', dhevento = :dhevento') +
                        IfThen(not xml_evento.Text.IsEmpty  , ', xml_evento = :xml_evento') +
                        IfThen(not xml_nfe_epec.Text.IsEmpty, ', xml_nfe_epec = :xml_nfe_epec') +
        ' where cod_nf = '    + cod_nf.ToString +
        ' and cod_empresa = ' + cod_empresa.ToString +
        ' and idlote = '      + idlote.ToString +
        ' and nseqevento = '  + nseqevento.ToString;
      if dhevento > 0 then
        QrAux.ParamByName('dhevento').AsDateTime := dhevento;
      if not xml_evento.Text.IsEmpty then
        QrAux.ParamByName('xml_evento').AsString := xml_evento.Text;
      if not xml_nfe_epec.Text.IsEmpty then
        QrAux.ParamByName('xml_nfe_epec').AsString := xml_nfe_epec.Text;
    end;
    QrAux.ExecSQL;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_retorno_evento ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_retorno_inutilizacao(Ainut: TNotafiscal_inut_class_hw; Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    with Ainut do
    begin
      QrAux.SQL.Text := 'update notafiscal_inut set cstat = '    + cstat.ToString +
                        IfThen(not xmotivo.IsEmpty       , ', xmotivo = ' + xmotivo.Substring(0, 255).QuotedString) +
                        IfThen(not nprot.IsEmpty         , ', nprot = '   + nprot.Substring(0, 17).QuotedString) +
                        IfThen(not id_dfe.IsEmpty        , ', id_dfe = '  + id_dfe.Substring(0, 42).QuotedString) +
                        IfThen(dhrecbto > 0              , ', dhrecbto = :dhrecbto') +
                        IfThen(not xml_inut.Text.IsEmpty , ', xml_inut = :xml_inut') +
        ' where seqid = '    + seqid.ToString +
        ' and cod_empresa = ' + cod_empresa.ToString;
      if dhrecbto > 0 then
        QrAux.ParamByName('dhrecbto').AsDateTime := dhrecbto;
      if not xml_inut.Text.IsEmpty then
        QrAux.ParamByName('xml_inut').AsString := xml_inut.Text;
    end;
    QrAux.ExecSQL;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_retorno_inutilizacao ' + e.Message);
    end;
  end;
end;

function THwNFe.Save_situacao(Anota: TNotafiscal_class_hw; Acommit: Boolean): Boolean;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text := 'update notafiscal set situacao_nfe = ' + Anota.situacao_nfe.QuotedString() +
                      ' where cod_nf = '      + Anota.cod_nf.ToString +
                      ' and cod_empresa = '   + Anota.cod_empresa.ToString;
    QrAux.ExecSQL;

    if Acommit then
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      listError.Add('Save_situacao ' + e.Message);
    end;
  end;
end;

{ THwCentralNFe }

function THwCentralNFe.nfe_anexos(Acod_nf: array of Integer; AComPDF, AComEventos, AcomBol: Boolean): string;
var
  Anota: TNotafiscal_class_hw;
  I, J, K: Integer;
  ArquivosGerados: TStringList;
  xmlPath, pdfPath, ApathPDF: string;
begin
  Result := '';
  listError.Clear;
  ArquivosGerados := TStringList.Create;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      // Inicializa componentes do ACBr
      Fnfe := TACBrNFe.Create(nil);
      Fdanfe := TACBrNFeDANFeRL.Create(Fnfe);
      Fdanfe.MostraPreview := False;
      Fdanfe.MostraSetup := False;
      Fdanfe.MostraStatus := False;

      Fnfe.DANFE := Fdanfe;
      acbr_configurar;

      // Define o caminho base para salvar os arquivos (usa o configurado ou a pasta do executável)
      ApathPDF := Fnfe.DANFE.PathPDF;
      if not DirectoryExists(ApathPDF) then
        ApathPDF := ExtractFilePath(ParamStr(0));

      // Garante que o caminho termine com a barra separadora
      ApathPDF := IncludeTrailingPathDelimiter(ApathPDF);
      Fnfe.DANFE.PathPDF := ApathPDF;

      // Processa cada nota fiscal
      for I := Low(Acod_nf) to High(Acod_nf) do
      begin
        Anota := GetNotaFiscal(Acod_nf[I]);
        if not Assigned(Anota) then
        begin
          listError.Add(Format('NF código %d não carregada do banco', [Acod_nf[I]]));
          Continue;
        end;

        if AcomBol and Assigned(Anota) and Anota.natureza_nf.Equals('S') then
          GetNotaFiscal_dup_html_bol(Anota);

        // 1. Gerar e salvar o arquivo XML
        xmlPath := ApathPDF + Anota.chave_nfe + '-nfe.xml';
        Anota.xml_nfe.SaveToFile(xmlPath);
        ArquivosGerados.Add(xmlPath);

        if AComEventos then
        begin
          if Assigned(Anota.eventoCanc) then
          begin
            xmlPath := ApathPDF + THwAux.apenasNumeros(Anota.eventoCanc.id_dfe) + '-procEventoNFe.xml';
            Anota.eventoCanc.xml_evento.SaveToFile(xmlPath);
            ArquivosGerados.Add(xmlPath);
          end;

          if Assigned(Anota.eventosCCe) then
            for K := Anota.eventosCCe.Count - 1 downto 0 do
              if Anota.eventosCCe.Items[K].situacao = 'Autorizada' then
              begin
                xmlPath := ApathPDF + THwAux.apenasNumeros(Anota.eventosCCe.Items[K].id_dfe) + '-procEventoNFe.xml';
                Anota.eventosCCe.Items[K].xml_evento.SaveToFile(xmlPath);
                ArquivosGerados.Add(xmlPath);
                Break;
              end;
        end;

        // 2. Gerar o PDF do DANFE se solicitado
        if AComPDF then
        begin
          Fnfe.NotasFiscais.Clear;
          if acbr_add_notafiscal(Anota) then
          begin
            // Aplica os mesmos ajustes de impressão utilizados no método nfe_imprimir
            for J := 0 to Pred(Fnfe.NotasFiscais.Count) do
            with Fnfe.NotasFiscais.Items[J].NFe do
            begin
              if Self.conf.danfe.ImprimirIpiDevolEmCampoIPI then
              begin
                for K := 0 to Pred(Det.Count) do
                begin
                  if Det.Items[K].vIPIDevol > 0 then
                  begin
                    Det.Items[K].Imposto.IPI.vIPI := Det.Items[K].vIPIDevol;
                    Det.Items[K].Imposto.IPI.pIPI := 0;
                  end;
                  var tmpInfAd := THelperDFe.GetInfAdicionalProdCombustiveis(Det.Items[K]);
                  if Length(tmpInfAd) > 0 then
                    Det.Items[K].infAdProd := Det.Items[K].infAdProd + IfThen(not Det.Items[K].infAdProd.Trim.IsEmpty, ';') + String.Join(';', tmpInfAd);
                end;
                if Total.ICMSTot.vIPIDevol > 0 then
                  Total.ICMSTot.vIPI := Total.ICMSTot.vIPIDevol;
              end;

              InfAdic.infAdFisco := ReverterFiltroTextoXML(InfAdic.infAdFisco);
              InfAdic.infCpl     := ReverterFiltroTextoXML(InfAdic.infCpl);

              var tmpDadosCmpl := THelperDFe.GetInfComplementarCombustiveis(Fnfe.NotasFiscais.Items[J].NFe);
              if Length(tmpDadosCmpl) > 0 then
                InfAdic.infCpl := InfAdic.infCpl + IfThen(not InfAdic.infCpl.Trim.IsEmpty, ';') + String.Join(';', tmpDadosCmpl);

              if conf.danfe.RemoverLineBreak then
              begin
                InfAdic.infAdFisco := InfAdic.infAdFisco.Replace(';', '.', [rfReplaceAll]);
                InfAdic.infCpl := InfAdic.infCpl.Replace(';', '.', [rfReplaceAll]);
              end;
            end;

            // Gera o PDF
            Fnfe.NotasFiscais.ImprimirPDF;
            pdfPath := Fnfe.DANFE.ArquivoPDF;

            if FileExists(pdfPath) then
              ArquivosGerados.Add(pdfPath)
            else
              listError.Add(Format('Falha ao gerar PDF para NF %d (Chave: %s)', [Anota.cod_nf, Anota.chave_nfe]));
          end
          else
          begin
            listError.Add(Format('NF %d número %d não pode ser processada para PDF. XML inválido ou falha no carregamento do ACBr', [Anota.cod_nf, Anota.num_nf]));
          end;
        end;

        if AcomBol and Assigned(Anota.dup) then
          for J := 0 to Anota.dup.Count - 1 do
            if Anota.dup.Items[J].GerarBoletoEmPDF(ApathPDF) then
            begin
              if FileExists(Anota.dup.Items[J].ArquivoPDF) then
                ArquivosGerados.Add(Anota.dup.Items[J].ArquivoPDF)
              else
                listError.Add(Format('Falha ao gerar boleto para NF %d duplicata %d', [Anota.cod_nf, J]));
            end;
      end;

      // Retorna a lista de caminhos separada por vírgulas
      Result := string.Join(';', ArquivosGerados.ToStringArray);//
      //Result := StringReplace(ArquivosGerados.CommaText, ',', ';', [rfReplaceAll]);

    finally
      desconectar;
      if Assigned(Fdanfe) then
        FreeAndNil(Fdanfe);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;
  finally
    FreeAndNil(ArquivosGerados);
  end;
end;

function THwCentralNFe.acbr_add_evento_epec(Anf: TNotafiscal_class_hw): Boolean;
var
  IdLast: Integer;
begin
  if acbr_add_notafiscal(Anf) then
  begin
    IdLast := Fnfe.NotasFiscais.Count - 1;
    Result := True;
    try
      if (not (THwAux.StrToSituacaoNFe(Anf.eventoEPEC.situacao) in [stVazio, stRejeitada])) and
        (not Anf.eventoEPEC.xml_evento.Text.IsEmpty) then
      begin
        Fnfe.EventoNFe.LerXMLFromString(Anf.eventoEPEC.xml_evento.Text);
        Exit;
      end;

      with Fnfe.EventoNFe.Evento.Add do
      begin
        with Fnfe.NotasFiscais.Items[Fnfe.NotasFiscais.Count - 1] do
        begin
//          if Fnfe.infNFe.ID.Trim.IsEmpty then
//            Fnfe.n.ger
          InfEvento.id                           := NFe.infNFe.ID;
          InfEvento.cOrgao                       := 91;
          InfEvento.tpAmb                        := NFe.Ide.tpAmb;
          InfEvento.CNPJ                         := NFe.Emit.CNPJCPF;
          InfEvento.chNFe                        := NumID;
          InfEvento.dhEvento                     := Now;
          InfEvento.tpEvento                     := teEPECNFe;
          InfEvento.nSeqEvento                   := 1;
          //InfEvento.versaoEvento               := '';
          //InfEvento.detEvento.versao           := '';
          InfEvento.detEvento.descEvento         := 'EPEC';
          InfEvento.detEvento.cOrgaoAutor        := NFe.Ide.cUF;
          InfEvento.detEvento.verAplic           := NFe.Ide.verProc;
          InfEvento.detEvento.dhEmi              := NFe.Ide.dEmi;
          InfEvento.detEvento.tpNF               := NFe.Ide.tpNF;
          InfEvento.detEvento.IE                 := NFe.Emit.IE;
          InfEvento.detEvento.dest.UF            := NFe.Dest.EnderDest.UF;
          InfEvento.detEvento.dest.CNPJCPF       := NFe.Dest.CNPJCPF;
          InfEvento.detEvento.dest.idEstrangeiro := NFe.Dest.idEstrangeiro;
          InfEvento.detEvento.dest.IE            := NFe.Dest.IE;
          InfEvento.detEvento.vNF                := NFe.Total.ICMSTot.vNF;
          InfEvento.detEvento.vICMS              := NFe.Total.ICMSTot.vICMS;
          InfEvento.detEvento.vST                := NFe.Total.ICMSTot.vST;
        end;
      end;
    except on E: Exception do
      begin
        Result := False;
        listError.Add(Format('Adicionar Evento a NF codigo %d numero %d Erro: %s', [Anf.cod_nf, Anf.num_nf, E.Message]));
      end;
    end;

    if (not Result) and (Fnfe.NotasFiscais.Count > 0) then
      Fnfe.NotasFiscais.Delete(Fnfe.NotasFiscais.Count - 1);
  end
  else
    Result := False;
end;

function THwCentralNFe.acbr_add_notafiscal(Anf: TNotafiscal_class_hw): Boolean;
var
  Aok       : Boolean;
  ArefNF    : TNFRef;
  Adet      : TNotafiscal_item_class_hw;
  A_di      : TNotafiscal_item_di_class_hw;
  A_adi     : TNotafiscal_item_adi_class_hw;
  AdetExport: TNotafiscal_item_detexport_class_hw;
  Adup      : TNotafiscal_dup_class_hw;
  Apag      : TNotafiscal_pag_class_hw;
  Aprocref  : TNotafiscal_sped_c111_class_hw;
  AobsCont  : TNotafiscal_obscont_hw;
  tmpIbsCbs : TIBSCBS;
  Astr      : string;
  I         : Integer;
  isSuframa : Boolean;
begin
  Result := True;
  try

    if not (Anf.sitNFe in [stVazio, stRejeitada, stEmContingenciaRejeitada]) then
    begin
      Fnfe.NotasFiscais.Add.LerXML(Anf.xml_nfe.Text);
      Exit;
    end;

    with Fnfe.NotasFiscais.Add.NFe do
    begin

      {$REGION 'ide'}
      with Ide do
      begin
        cUF       := emp.ibge_codigo_uf;
        cNF       := Anf.cnfe;
        natOp     := Anf.desc_natop.Substring(0, 60);
        modelo    := StrToIntDef(Anf.modelo_nf.Trim, 55);
        serie     := StrToIntDef(Anf.serie.Trim, -1);
        nNF       := Anf.num_nf;
        dEmi      := Anf.data_contabil + StrToTimeDef(anf.hora_emissao, Time);
        if Anf.data_ent_saida > 0 then
          if Anf.hora_ent_saida > 0 then
            dSaiEnt := Anf.data_ent_saida + Anf.hora_ent_saida
          else
            dSaiEnt := Anf.data_ent_saida + StrToTime('23:59:59');
        dPrevEntrega := Anf.dpreventrega;
        tpNF      := StrToTpNF(Anf.natureza_nf.Replace('E', '0').Replace('S', '1'));
        idDest    := StrToDestinoOperacao(AOk, Anf.nfe_iddest);
        cMunFG    := IfThen(Anf.cmunfg > 0, Anf.cmunfg, emp.ibge_cod_cidade);
        case FormatoImpressaoDANFeEnum(Anf.tpimp) of
          fidSemDANFe          : tpImp     := TpcnTipoImpressao.tiSemGeracao;
          fidRetrato           : tpImp     := TpcnTipoImpressao.tiRetrato;
          fidPaisagem          : tpImp     := TpcnTipoImpressao.tiPaisagem;
          fidSimplificado      : tpImp     := TpcnTipoImpressao.tiSimplificado;
          fidSimplificadoTipo2 : tpImp     := TpcnTipoImpressao.tiSimplificadoTipo2;
        end;

        tpEmis    := StrToTpEmis(AOk, Anf.nfe_tpemis);
        //cDV
        tpAmb     := StrToTpAmb(Aok, Anf.nfe_tpamb);
        finNFe    := StrToFinNFe(AOk, anf.tipo_emissao);
        indFinal  := StrToConsumidorFinal(Aok, Anf.consumidor_final.Replace('S', '1').Replace('N', '0'));
        indPres   := StrToPresencaComprador(AOk, Anf.nfe_indpres);
        procEmi   := peAplicativoContribuinte;
        verProc   := conf.verproc;
        dhCont    := IfThen(tpEmis <> teNormal, Anf.nfe_dhcont);
        xJust     := IfThen(tpEmis <> teNormal, Anf.nfe_xjust);
        indIntermed := TindIntermed(StrToIntDef(Anf.indintermed.Trim, -1) + 1);

        cMunFGIBS := IfThen(
          indPres = pcPresencialForaEstabelecimento, Anf.cmunfgibs, emp.ibge_cod_cidade
        );
        cIndOp    := Anf.cindop;

        {$REGION 'NFref'}
        if Assigned(Anf.nfref) then
          for ArefNF in Anf.nfref do
          begin

            {$REGION 'refNFe ou refNFeSig'}
            if Assigned(ArefNF.refNFe) then
              if conf.nfeRefSigilosa and (StrToFinNFe(AOk, anf.tipo_emissao) in [fnNormal, fnComplementar]) and (ArefNF.refNFe.chave_nfe_ref.Substring(20,2).Equals('55')) then
                NFref.Add.refNFeSig := ArefNF.refNFe.chave_nfe_ref.Substring(0, 35) + '00000000' + ArefNF.refNFe.chave_nfe_ref.Substring(43)
              else
                NFref.Add.refNFe := ArefNF.refNFe.chave_nfe_ref;
            {$ENDREGION}

            {$REGION 'refNF'}
            if Assigned(ArefNF.refNF) then
              with NFref.Add.RefNF do
              begin
                cUF    := ArefNF.refNF.cuf;
                AAMM   := ArefNF.refNF.aamm;
                CNPJ   := ArefNF.refNF.cnpj;
                modelo := ArefNF.refNF.modelo;
                serie  := ArefNF.refNF.serie;
                nNF    := ArefNF.refNF.nnf;
              end;
            {$ENDREGION}

            {$REGION 'refNFP - Não implementado'}

            {$ENDREGION}

            {$REGION 'refCTe - Não implementado'}

            {$ENDREGION}

            {$REGION 'refECF'}
            if Assigned(ArefNF.refECF) then
              with NFref.Add.RefECF do
              begin
                modelo := StrToECFModRef(Aok, ArefNF.refECF.cod_mod);
                nECF    := ArefNF.refECF.ecf_cx.ToString;
                nCOO    := ArefNF.refECF.num_doc.ToString;
              end;

            {$ENDREGION}

          end;
        {$ENDREGION}

      end;
      {$ENDREGION}

      {$REGION 'emit'}
      with Emit do
      begin
        CNPJCPF   := emp.cgc_emp;
        xNome     := emp.nome_emp;
        xFant     := IfThen(emp.fantasia_emp.Trim.IsEmpty, emp.nome_emp, emp.fantasia_emp);
        with EnderEmit do
        begin
          xLgr    := emp.endreco_emp;
          nro     := emp.numero_end.ToString;
          xCpl    := emp.complemento_emp;
          xBairro := emp.bairro_emp;
          cMun    := emp.ibge_cod_cidade;
          xMun    := emp.cidade_emp;
          UF      := emp.webserv_uf;
          CEP     := StrToInt64Def(emp.cep_emp.Trim.Replace('-', ''), 0);
          cPais   := 1058;
          xPais   := 'BRASIL';
          fone    := emp.telefone_emp;
        end;
        IE        := emp.ie_emp;
        if Ide.tpImp <> TpcnTipoImpressao.tiSimplificadoTipo2 then
          IEST    := Anf.inscricao_substituto;
        IM        := emp.im_emp;
        CNAE      := emp.cnae_fiscal;
        CRT       := StrToCRT(AOk, Anf.crt);
      end;
      {$ENDREGION}

      {$REGION 'dest'}
      with Dest do
      begin
        CNPJCPF       := Anf.cpfcgc;
        idEstrangeiro := Anf.dest_idestrangeiro;
        xNome         := IfThen(Anf.nfe_tpamb.Equals('1'), Anf.razao, 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL');

        if (Ide.tpImp <> TpcnTipoImpressao.tiSimplificadoTipo2) or not Anf.dest_xlgr.Trim().IsEmpty() then
          with EnderDest do
          begin
            xLgr    := Anf.dest_xlgr;
            nro     := Anf.dest_nro;
            xCpl    := Anf.dest_xcpl;
            xBairro := Anf.dest_xbairro;
            cMun    := Anf.dest_cmun;
            xMun    := Anf.dest_xmun;
            UF      := Anf.dest_uf;
            CEP     := StrToIntDef(Anf.dest_cep.Trim.Replace('-', ''), 0);
            cPais   := Anf.dest_cpais;
            xPais   := Anf.dest_xpais;
            fone    := Anf.dest_fone;
          end;
        indIEDest := StrToindIEDest(Anf.nfe_indiedest.ToString);
        IE        := Anf.insc_est.Replace('ISENTO', '');
        ISUF      := Anf.dest_isuf;
        IM        := Anf.dest_im;
        if not Anf.dest_email.IsEmpty then
          Email   := THwAux.StrToTStrings(Anf.dest_email, [',', ';', '|', sLineBreak, ' '])[0].Substring(0, 60);
        if (Anf.nfe_iddest.Equals('2')) or
           (Anf.nfe_iddest.Equals('1') and (not Anf.consumidor_final.Equals('S'))) then
          idEstrangeiro := '';

        if EnderDest.xLgr <> '' then
          Ide.cMunFGIBS := 0;

      end;
      {$ENDREGION}

      {$REGION 'retirada'}
      if Assigned(Anf.retiradaV2) then
      begin
        with Retirada do
        begin
          CNPJCPF := Anf.retiradaV2.cpfcnpj;
          xNome   := Anf.retiradaV2.xnome;
          xLgr    := Anf.retiradaV2.xlgr;
          nro     := Anf.retiradaV2.nro;
          xCpl    := Anf.retiradaV2.xcpl;
          xBairro := Anf.retiradaV2.xbairro;
          cMun    := Anf.retiradaV2.cmun;
          xMun    := Anf.retiradaV2.xmun;
          UF      := Anf.retiradaV2.uf;
          cep     := IfThen(Anf.retiradaV2.cep <> '', StrToIntDef(Anf.retiradaV2.cep, 0));
          cPais   := Anf.retiradaV2.cpais;
          xPais   := Anf.retiradaV2.xpais;
          fone    := Anf.retiradaV2.fone;
          Email   := Anf.retiradaV2.email;
          IE      := Anf.retiradaV2.ie;
        end;
      end
      else
      if Assigned(Anf.retirada) then
        with Retirada do
        begin
          CNPJCPF := IfThen(Anf.retirada.cnpj_col.IsEmpty, Anf.retirada.cpf_col, Anf.retirada.cnpj_col);
          xLgr    := Anf.retirada.nfe_xlgr_col;
          nro     := Anf.retirada.nfe_nro_col;
          xCpl    := Anf.retirada.nfe_xcpl_col;
          xBairro := Anf.retirada.nfe_xbairro_col;
          cMun    := Anf.retirada.cod_mun_col;
          xMun    := Anf.retirada.nfe_xmun_col;
          UF      := Anf.retirada.uf_col;
        end;
      {$ENDREGION}

      {$REGION 'entrega'}
      if Assigned(Anf.entregaV2) then
      begin
        with Entrega do
        begin
          CNPJCPF := Anf.entregaV2.cpfcnpj;
          xNome   := Anf.entregaV2.xnome;
          xLgr    := Anf.entregaV2.xlgr;
          nro     := Anf.entregaV2.nro;
          xCpl    := Anf.entregaV2.xcpl;
          xBairro := Anf.entregaV2.xbairro;
          cMun    := Anf.entregaV2.cmun;
          xMun    := Anf.entregaV2.xmun;
          UF      := Anf.entregaV2.uf;
          cep     := IfThen(Anf.entregaV2.cep <> '', StrToIntDef(Anf.entregaV2.cep, 0));
          cPais   := Anf.entregaV2.cpais;
          xPais   := Anf.entregaV2.xpais;
          fone    := Anf.entregaV2.fone;
          Email   := Anf.entregaV2.email;
          IE      := Anf.entregaV2.ie;
        end;

        if Entrega.xLgr <> '' then
          Ide.cMunFGIBS := 0;
      end
      else
      if Assigned(Anf.entrega) then
        with Entrega do
        begin
          CNPJCPF := IfThen(Anf.entrega.cnpj_entg.IsEmpty, Anf.entrega.cpf_entg, Anf.entrega.cnpj_entg);
          xLgr    := Anf.entrega.nfe_xlgr_entg;
          nro     := Anf.entrega.nfe_nro_entg;
          xCpl    := Anf.entrega.nfe_xcpl_entg;
          xBairro := Anf.entrega.nfe_xbairro_entg;
          cMun    := Anf.entrega.cod_mun_entg;
          xMun    := Anf.entrega.nfe_xmun_entg;
          UF      := Anf.entrega.uf_entg;
        end;
      {$ENDREGION}

      {$REGION 'autxml'}
      if Assigned(Anf.autXML) then
        for I := 0 to Anf.autXML.Count - 1 do
          if (not Anf.autXML[I].Trim().PadLeft(14, '0').Equals(Anf.cpfcgc.Trim().PadLeft(14, '0')))
            and (not Anf.autXML[I].Trim().PadLeft(14, '0').Equals(emp.cgc_emp.Trim().PadLeft(14, '0'))) then
            autXML.Add.CNPJCPF := Anf.autXML[I];
      {$ENDREGION}

      {$REGION 'defensivo'}
      if Assigned(Anf.defensivo) then
        for var aDefensivo in Anf.defensivo do
          with agropecuario.defensivo.Add do
          begin
            nReceituario := aDefensivo.nreceituario;
            CPFRespTec := aDefensivo.cpfresptec
          end;
      {$ENDREGION}

      {$REGION 'guiaTransito'}
      if Assigned(Anf.guiaTrans) then
        with agropecuario.guiaTransito do
        begin
          UFGuia := Anf.guiaTrans.ufguia;
          tpGuia := TtpGuia(Anf.guiaTrans.tpguia);
          serieGuia := Anf.guiaTrans.serieguia;
          nGuia := Anf.guiaTrans.nguia.ToString();
        end;

      {$ENDREGION}

      {$REGION 'det, prod, imposto impostoDevolv, inAdProd'}
      isSuframa := False;
      Anf.fcp_vfcpstret := 0;
      for Adet in Anf.prod do
        with Det.New do
        begin

          vItem := Adet.vitem;

          {$REGION 'prod'}
          with Prod do
          begin
            nItem         := Adet.nitem;
            cProd         := Adet.num_fab_prod;
            cEAN          := IfThen(Adet.cean.Trim.IsEmpty and conf.tagEANSemGTIN, 'SEM GTIN', Adet.cean) ;
            cBarra        := Adet.cbarra;
            xProd         := Adet.descricao_item.Trim.Substring(0, 120);
            NCM           := Adet.ncm;
            if Assigned(Adet.nveList) then
              for Astr in Adet.nveList do
                NVE.Add.NVE := Astr;
            CEST          := Adet.cest;
            indEscala     := StrToIndEscala(Aok, IfThen(Adet.nfe_indescala.IsEmpty, 'S', Adet.nfe_indescala));
            CNPJFab       := Adet.nfe_cnpjfab;
            cBenef        := Adet.nfe_cbenef;
            //EXTIPI   := ;
            CFOP          := Adet.codigo_nop.ToString.Substring(0, 4);
            vProd         := Adet.valor_total;

            if (Anf.import_xml >= strDataVersion)
              and (not Adet.unidade_nf.IsEmpty)
              and (Adet.qtdembrec > 0)
              and (Adet.vlrembnf > 0) then
            begin
              uCom          := Adet.unidade_nf;
              qCom          := Adet.qtdembrec;
            end
            else
            begin
              uCom          := Adet.referencia;
              qCom          := Adet.quantidade;
            end;

            vUnCom        := vProd / qCom;
            cEANTrib      := cEAN;
            cBarraTrib    := cBarra;
            uTrib         := Adet.utrib;
            qTrib         := Adet.qtrib;
            vUnTrib       := Adet.vuntrib;
            vFrete        := Adet.rateio_frete;
            vSeg          := Adet.rateio_seguro;
            vDesc         := Adet.rateio_desconto + Adet.vpisdeson + Adet.vcofinsdeson;
            vOutro        := Adet.rateio_outdesp;
            IndTot        := StrToindTot(Aok, Adet.indtot.ToString);

            {$REGION 'DI'}
            if Assigned(Adet.di) then
              for A_di in Adet.di do
                with DI.Add do
                begin
                  nDi          := A_di.ndi;
                  dDi          := A_di.ddi;
                  xLocDesemb   := a_di.xlocdesemb;
                  UFDesemb     := a_di.ufdesemb;
                  dDesemb      := a_di.ddesemb;
                  tpViaTransp  := StrToTipoViaTransp(Aok, a_di.tpviatransp.ToString);
                  vAFRMM       := a_di.vafrmm;
                  tpIntermedio := StrToTipoIntermedio(Aok, a_di.tpintermedio.ToString);
                  CNPJ         := a_di.cnpj;
                  UFTerceiro   := a_di.ufterceiro;
                  cExportador  := a_di.cexportador;

                  {$REGION 'adi'}
                  if Assigned(A_di.adi) then
                    for A_adi in A_di.adi do
                      with adi.Add do
                      begin
                        nAdicao     := A_adi.nadicao;
                        nSeqAdi     := A_adi.nseqadic;
                        cFabricante := A_adi.cfabricante;
                        vDescDI     := A_adi.vdescdi;
                        nDraw       := A_adi.ndraw;
                      end;
                  {$ENDREGION}

                end;

            {$ENDREGION}

            {$REGION 'detExport'}
            if Assigned(Adet.detExport) then
              for AdetExport in Adet.detExport do
                with detExport.Add do
                begin
                  nDraw := AdetExport.ndraw;

                  {$REGION 'exportInd'}
                  if Assigned(AdetExport.exportInd) then
                  begin
                    nRE     := AdetExport.exportInd.nre;
                    chNFe   := AdetExport.exportInd.chnfe;
                    qExport := AdetExport.exportInd.qexport;
                  end;
                  {$ENDREGION}

                end;
            {$ENDREGION}

            xPed     := Adet.xped_compra;
            nItemPed := IfThen(Adet.nitemped_compra > 0, Adet.nitemped_compra.ToString);
            nFCI     := Adet.nfci;

            {$REGION 'rastro - Não Implementado - talvez no futuro'}
            //nao tem, se implementar colocar aqui
            if not Adet.rastro_nlote.Trim.IsEmpty then
            begin
              with rastro.Add do
              begin
                nLote := Adet.rastro_nlote;
                qLote := Adet.rastro_qlote;
                dFab := Adet.rastro_dfab;
                dVal := Adet.rastro_dval;
              end;
            end;
            {$ENDREGION}

            {$REGION 'veicProd'}
            if Assigned(Adet.veic) then
              with veicProd do
              begin
                tpOP         := toVendaConcessionaria;
                chassi       := Adet.veic.chassi;
                cCor         := Adet.veic.cod_cor.ToString;
                xCor         := Adet.veic.cor;
                pot          := Adet.veic.pot;
                Cilin        := Int(Adet.veic.cilindrada).ToString.PadLeft(4, '0');
                pesoL        := Adet.veic.pesol.ToString;
                pesoB        := Adet.veic.pesob.ToString;
                nSerie       := Adet.veic.nserie;
                tpComb       := IfThen(Adet.veic.tpcomb.IsEmpty, Adet.veic.tpcomb_m, Adet.veic.tpcomb);
                nMotor       := Adet.veic.motor;
                CMT          := Adet.veic.cmkg;
                dist         := Adet.veic.distanciaeixo;
                anoMod       := Adet.veic.ano_mod;
                anoFab       := Adet.veic.ano_fab;
                tpPint       := Adet.veic.tip_pintura;
                tpVeic       := StrToIntDef(Adet.veic.tip_veiculo, -1);
                espVeic      := StrToIntDef(Adet.veic.esprenavam, -1);
                VIN          := 'N';
                condVeic     := StrTocondVeic(AOk, '1');
                cMod         := Adet.veic.renavam.Substring(0, 6);
                cCorDENATRAN := Adet.veic.codcordenatram.ToString;
                lota         := StrToIntDef(Adet.veic.lotacao, 0);
                tpRest       := StrToIntDef(Adet.veic.tprest, -1);
              end;
            {$ENDREGION}

            {$REGION 'med - Não implementado, nao trabalhamos com medicamentos'}
            if MatchText(Adet.ncm.Substring(0, 4), ['3001', '3002', '3003', '3004', '3005', '3006']) or
              (not Adet.med_cprodanvisa.Trim.IsEmpty)
            then
            begin
              with med.Add do
              begin
                cProdANVISA := IfThen(Adet.med_cprodanvisa.Trim.IsEmpty, 'ISENTO', Adet.med_cprodanvisa.Trim);
                vPMC := Adet.med_vpmc;
              end;
            end;

            // nao trabalhamos com medicamentos
            {$ENDREGION}

            {$REGION 'arma - Não implementado, nao trabalhamos com armamentos'}
            // nao trabalhamos com medicamentos
            {$ENDREGION}

            {$REGION 'comb'}
            if not Adet.comb_cprodanp.IsEmpty then
              with comb do
              begin
                cProdANP  := StrToInt64Def(Adet.comb_cprodanp, 0);
                descANP   := Adet.comb_descanp;
                pGLP      := Adet.comb_pglp;
                pGNn      := Adet.comb_pgnn;
                pGNi      := Adet.comb_pgni;
                vPart     := Adet.comb_vpart;
                CODIF     := Adet.comb_codif;
                qTemp     := Adet.comb_qtemp;
                UFcons    := IfThen(Adet.comb_ufcons.IsEmpty, Anf.dest_uf, Adet.comb_ufcons);

                {$REGION 'CIDE'}
                with CIDE do
                begin
                  qBCProd   := Adet.comb_cide_qbcprod;
                  vAliqProd := Adet.comb_cide_valiqprod;
                  vCIDE     := Adet.comb_cide_vcide;
                end;
                {$ENDREGION}

                {$REGION 'encerrante'}
                //nao necessario
                {$ENDREGION}

              end;


            {$ENDREGION}

            if Ide.tpImp <> TpcnTipoImpressao.tiSimplificadoTipo2 then
              nRECOPI  := Adet.nfe_nrecopi;
          end;
          {$ENDREGION}

          {$REGION 'imposto'}
          with Imposto do
          begin
            vTotTrib := Adet.vtottrib;

            {$REGION 'ICMS'}
            with ICMS do
            begin
              orig := StrToOrig(Adet.cst.Substring(0, 1));
              if Anf.crt.Equals('1') and (not Adet.csosn.Trim.IsEmpty) then
                CST   := cstVazio
              else
                CST := StrToCSTICMS(Adet.cst.Substring(1, 2) + Adet.repasseST);
              CSOSN       := StrToCSOSNIcms(IfThen(Anf.crt.Equals('1'), Adet.csosn));

              modBC       := StrTomodBC(Aok, Adet.modbc.ToString);
              pRedBC      := IfThen( CST in [cst00, cst10, cst20, cst51, cst70, cst90]                          , Adet.perc_red_prod);
              vBC         := IfThen((CST in [cst00, cst10, cst20, cst51, cst70, cst90]) or (CSOSN in [csosn900]), Adet.base_icm);
              pICMS       := IfThen((CST in [cst00, cst10, cst20, cst51, cst70, cst90]) or (CSOSN in [csosn900]), Adet.aliq_icm);
              vICMS       := IfThen((CST in [cst00, cst10, cst20, cst51, cst70, cst90]) or (CSOSN in [csosn900]), Adet.valor_icm);
//              Adet.vicme
              vICMSDeson  := IfThen((CST in [cst20, cst30, cst40, cst41, cst50, cst70, cst90]), Adet.vicmdeson);
              motDesICMS  := StrTomotDesICMS(Aok, Adet.ind_desoneracao.ToString);
//              indDeduzDeson := TIndicadorEx.
              if (not isSuframa) and (motDesICMS = mdiSuframa) then
                isSuframa := True;

              modBCST     := StrTomodBCST(Aok, Adet.modbcst.ToString);
              pMVAST      := IfThen((CST in [cst10, cst30, cst70, cst90]) or (CSOSN in [csosn201, csosn202, csosn203, csosn900]), Adet.mva);
              pRedBCST    := IfThen((CST in [cst10, cst30, cst70, cst90]) or (CSOSN in [csosn201, csosn202, csosn203, csosn900]), Adet.perc_red_prod_sub);
              vBCST       := IfThen((CST in [cst10, cst30, cst70, cst90]) or (CSOSN in [csosn201, csosn202, csosn203, csosn900]), Adet.base_icmsub);
              pICMSST     := IfThen((CST in [cst10, cst30, cst70, cst90]) or (CSOSN in [csosn201, csosn202, csosn203, csosn900]), Adet.aliq_icmsub);
              vICMSST     := IfThen((CST in [cst10, cst30, cst70, cst90]) or (CSOSN in [csosn201, csosn202, csosn203, csosn900]), Adet.valor_icmsub);
              //UFST
              //pBCOp
              vBCSTRet        := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500]), RoundTo(Adet.base_icmant_sub     * Adet.quantidade, -2));
              vICMSSTRet      := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500]), RoundTo(Adet.valor_icmant_sub    * Adet.quantidade, -2));
              if conf.NT_2018_005 then
              begin
                vICMSSubstituto := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500]), RoundTo(Adet.ant_vicmssubstituto * Adet.quantidade, -2));
                pST             := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500]), Adet.ant_pst);
              end;
              //motDesICMS
              pCredSN     := IfThen(CSOSN in [csosn101, csosn201, csosn900], Adet.aliq_icm_simples);
              vCredICMSSN := IfThen(CSOSN in [csosn101, csosn201, csosn900], Adet.valor_icm_simples);
              //vBCSTDest
              //vICMSSTDest
              //vICMSDeson
              //vICMSOp
              pDif         := IfThen(CST = cst51, Adet.pdif);
              vICMSDif     := IfThen(CST = cst51, Adet.vicmsdif);
              pFCPDif      := IfThen(CST = cst51, Adet.pfcpdif);
              vFCPDif      := IfThen(CST = cst51, Adet.vfcpdif);
              vICMSOp      := IfThen(CST = cst51, Adet.vicmsop_dif);
              vFCPEfet     := IfThen(CST = cst51, Adet.vfcpefet_dif);

              vBCFCP      := IfThen( CST in [       cst10, cst20, cst51, cst70, cst90]                                , Adet.fcp_vbcfcp);
              pFCP        := IfThen( CST in [cst00, cst10, cst20, cst51, cst70, cst90]                                , Adet.fcp_pfcp);
              vFCP        := IfThen( CST in [cst00, cst10, cst20, cst51, cst70, cst90]                                , Adet.fcp_vfcp);
              vBCFCPST    := IfThen((CST in [cst10, cst30, cst70, cst90]) or (CSOSN in [csosn201, csosn202, csosn203]), Adet.fcp_vbcfcpst);
              pFCPST      := IfThen((CST in [cst10, cst30, cst70, cst90]) or (CSOSN in [csosn201, csosn202, csosn203]), Adet.fcp_pfcpst);
              vFCPST      := IfThen((CST in [cst10, cst30, cst70, cst90]) or (CSOSN in [csosn201, csosn202, csosn203]), Adet.fcp_vfcpst);
              vBCFCPSTRet := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500])                               , RoundTo(Adet.fcp_vbcfcpstret * Adet.quantidade, -2));
              pFCPSTRet   := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500])                               , Adet.fcp_pfcpstret);
              vFCPSTRet   := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500])                               , RoundTo(Adet.fcp_vfcpstret   * Adet.quantidade, -2));
              pRedBCEfet  := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500]), Adet.predbcefet);
              vBCEfet     := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500]), Adet.vbcefet);
              pICMSEfet   := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500]), Adet.picmsefet);
              vICMSEfet   := IfThen((CST in [cst60, cstRep60]) or (CSOSN in [csosn500]), Adet.vicmsefet);

              qBCMono        := IfThen(CST in [cst02, cst15], Adet.qbcmono);
              adRemICMS      := IfThen(CST in [cst02, cst15], Adet.adremicms);
              vICMSMono      := IfThen(CST in [cst02, cst15], Adet.vicmsmono);
              qbcmonoreten   := IfThen(CST in [cst15], Adet.qbcmonoreten);
              adRemICMSReten := IfThen(CST in [cst15], Adet.adremicmsreten);
              vICMSMonoReten := IfThen(CST in [cst15], Adet.vicmsmonoreten);
              qBCMonoRet     := IfThen(CST in [cst61], Adet.qbcmonoret);
              adRemICMSRet   := IfThen(CST in [cst61], Adet.adremicmsret);
              vICMSMonoRet   := IfThen(CST in [cst61], Adet.vicmsmonoret);

              Anf.fcp_vfcpstret := Anf.fcp_vfcpstret + vFCPSTRet;
            end;
            {$ENDREGION}

            {$REGION 'IPI'}
            if Anf.tpimp <> Ord(fidSimplificadoTipo2) then
            begin
              with IPI do
              begin
                //CNPJProd
                cSelo    := Adet.ipi_cselo;
                qSelo    := Adet.ipi_qselo;
                cEnq     := IfThen(Adet.cenq_ipi_nfe.IsEmpty, '999', Adet.cenq_ipi_nfe);
                CST      := StrToCSTIPI(Aok, IfThen(Adet.cenq_ipi_nfe.IsEmpty, '99', Adet.cst_ipi));
                vBC      := Adet.base_ipi;
                //qUnid
                //vUnid
                pIPI     := Adet.aliq_ipi;
                vIPI     := Adet.valor_ipi;
              end;
            end;
            {$ENDREGION}

            {$REGION 'II - Imposto de Importação'}
            with II do
            begin
              vBc      := Adet.base_ii;
              vDespAdu := Adet.valor_despadu_ii;
              vII      := Adet.valor_ii;
              vIOF     := Adet.valor_iof_ii;
            end;
            {$ENDREGION}

            {$REGION 'ISSQN - Não Implementado'}
            {$ENDREGION}

            {$REGION 'PIS'}
            PIS.CST       := StrToCSTPIS(Adet.cst_pis);
            if not (PIS.CST = pis05) then
              with PIS do
              begin
                vBC       := Adet.base_pis;
                pPIS      := Adet.aliq_pis;
                vPIS      := Adet.valor_pis;
                qBCProd   := Adet.quant_bc_pis;
                vAliqProd := Adet.aliq_pis_quant;
              end;
            {$ENDREGION}

            {$REGION 'PISST'}
            if (PIS.CST = pis05) and (Adet.valor_pis > 0) then
              with PISST do
              begin
                vBC       := Adet.base_pis;
                pPIS      := Adet.aliq_pis;
                vPIS      := Adet.valor_pis;
                qBCProd   := Adet.quant_bc_pis;
                vAliqProd := Adet.aliq_pis_quant;
                indSomaPISST := StrToindSomaPISST(Aok, IntToStr(Adet.indsomapisst));
              end;
            {$ENDREGION}

            {$REGION 'COFINS'}
            COFINS.CST    := StrToCSTCOFINS(Adet.cst_cofins);
            if not (COFINS.CST = cof05) then
              with COFINS do
              begin
                CST       := StrToCSTCOFINS(Adet.cst_cofins);
                vBC       := Adet.base_cofins;
                pCOFINS   := Adet.aliq_cofins;
                vCOFINS   := Adet.valor_cofins;
                qBCProd   := Adet.quant_bc_cofins;
                vAliqProd := Adet.aliq_cofins_quant;
              end;
            {$ENDREGION}

            {$REGION 'COFINSST'}
            if (COFINS.CST = cof05) and (Adet.valor_cofins > 0) then
              with COFINSST do
              begin
                vBC       := Adet.base_cofins;
                pCOFINS   := Adet.aliq_cofins;
                vCOFINS   := Adet.valor_cofins;
                qBCProd   := Adet.quant_bc_cofins;
                vAliqProd := Adet.aliq_cofins_quant;
                indSomaCOFINSST := StrToindSomaCOFINSST(Aok, IntToStr(Adet.indsomacofinsst));
              end;
            {$ENDREGION}

            {$REGION 'ICMSUFDest'}
            with ICMSUFDest do
            begin
              vBCUFDest     := Adet.vbcufdest;
              vBCFCPUFDest  := Adet.fcp_vbcfcpufdest;
              pFCPUFDest    := Adet.pfcpufdest;
              pICMSUFDest   := Adet.picmsufdest;
              pICMSInter    := Adet.picmsinter;
              pICMSInterPart:= Adet.picmsinterpart;
              vFCPUFDest    := Adet.vfcpufdest;
              vICMSUFDest   := Adet.vicmsufdest;
              vICMSUFRemet  := Adet.vicmsufremet;
            end;
            {$ENDREGION}

            {$REGION 'IS'}

            {$ENDREGION}

            {$REGION 'IBS e CBS'}

            tmpIbsCbs := TributosDFeFactory.GetIBSCBS(Adet.TributoRtc);
            if tmpIbsCbs <> nil then
            begin
              //IBSCBS.Assign(tmpIbsCbs);
              //tmpIbsCbs.Free();
              IBSCBS := tmpIbsCbs;
              tmpIbsCbs := nil;

              //IBSCBS.gIBSCBS.gIBSUF.gDif.pDif
            end;

            {$ENDREGION}

          end;
          {$ENDREGION}

          {$REGION 'impostoDevol'}
          pDevol    := Adet.nfe_pdevol;
          vIPIDevol := Adet.nfe_vipidevol;
          {$ENDREGION}

          infAdProd    := Adet.infAdProd;

          {$REGION 'DFeReferenciado'}
          if not Adet.chave_nfe_ref.IsEmpty() then
          begin
            DFeReferenciado.chaveAcesso := Adet.chave_nfe_ref;
            DFeReferenciado.nItem := Adet.nitem_nfe_ref
          end;
          {$ENDREGION}
        end;



      if not isSuframa then
        Dest.ISUF := '';
      {$ENDREGION}

      {$REGION 'total'}
      with Total do
      begin

        {$REGION 'ICMSTot'}
        with ICMSTot do
        begin
          vBC          := Anf.base_icm;
          vICMS        := Anf.valor_icm;
          vICMSDeson   := Anf.vicmdeson;
          vFCPUFDest   := Anf.vfcpufdest;
          vICMSUFDest  := Anf.vicmsufdest;
          vICMSUFRemet := Anf.vicmsufremet;
          vFCP         := Anf.fcp_vfcp;
          vBCST        := Anf.base_icmsub;
          vST          := Anf.valor_icmsub;
          vFCPST       := Anf.fcp_vfcpst;
          vFCPSTRet    := Anf.fcp_vfcpstret;
          vProd        := Anf.valor_prod;
          vFrete       := Anf.valor_frete;
          vSeg         := Anf.valor_seguro;
          vDesc        := Anf.valor_desc + Anf.vpisdeson + Anf.vcofinsdeson;
          vII          := Anf.valor_ii;
          vIPI         := Anf.valor_ipi;
          vIPIDevol    := Anf.ipi_vipidevol;
          vPIS         := Anf.valor_pis;
          vCOFINS      := Anf.valor_cofins;
          vOutro       := Anf.valor_out_desp;
          vNF          := Anf.valor_total;
          vTotTrib     := Anf.vtottrib;
          qBCMono      := Anf.qbcmono;
          vICMSMono    := Anf.vicmsmono;
          qBCMonoReten   := Anf.qBCMonoReten;
          vICMSMonoReten := Anf.vICMSMonoReten;
          qBCMonoRet     := Anf.qBCMonoRet;
          vICMSMonoRet   := Anf.vICMSMonoRet;
        end;
        {$ENDREGION}

        {$REGION 'ISSQNtot - Não implementado'}
        {$ENDREGION}

        {$REGION 'retTrib - Não implementado'}
        with retTrib do
        begin
          vRetPIS := Anf.vretpis;
          vRetCOFINS := Anf.vretcofins;
          vRetCSLL := Anf.vretcsll;
          vBCIRRF := Anf.base_irrf;
          vIRRF := Anf.valor_irrf;
          vBCRetPrev := Anf.vbcretprev;
          vRetPrev := Anf.vretprev;
        end;
        {$ENDREGION}

        {$REGION 'IBSCBSTot'}

        with IBSCBSTot do
        begin
          vBCIBSCBS := Anf.vbcibscbs;

          {$REGION 'gIBS'}

          with gIBS do
          begin

            with gIBSUFTot do
            begin
              vDif := Anf.ibsuf_vdif;
              vDevTrib := Anf.ibsuf_vdevtrib;
              vIBSUF := Anf.vibsuf;
            end;

            with gIBSMunTot do
            begin
              vDif := Anf.ibsmun_vdif;
              vDevTrib := Anf.ibsmun_vdevtrib;
              vIBSMun := Anf.vibsmun;
            end;

            vIBS := Anf.vibs;
            vCredPres := Anf.ibs_vcredpres;
            vCredPresCondSus := Anf.ibs_vcredprescondsus;
          end;

          {$ENDREGION}

          {$REGION 'gCBS'}

          with gCBS do
          begin
            vDif := Anf.cbs_vdif;
            vDevTrib := Anf.cbs_vdevtrib;
            vCBS := Anf.vcbs;
            vCredPres := Anf.cbs_vcredpres;
            vCredPresCondSus := Anf.cbs_vcredprescondsus;
          end;

          {$ENDREGION}

          {$REGION 'gMono'}

          with gMono do
          begin
            vIBSMono := Anf.vibsmono;
            vCBSMono := Anf.vcbsmono;
            vIBSMonoReten := Anf.vibsmonoreten;
            vCBSMonoReten := Anf.vcbsmonoreten;
            vIBSMonoRet := Anf.vibsmonoret;
            vCBSMonoRet := Anf.vcbsmonoret;
          end;

          {$ENDREGION}

          {$REGION 'gEstornoCred'}

          with gEstornoCred do
          begin
            vIBSEstCred := Anf.vibsestcred;
            vCBSEstCred := Anf.vcbsestcred;
          end;

          {$ENDREGION}
        end;

        {$ENDREGION}

        vNFTot := Anf.vnftot;

      end;
      {$ENDREGION}

      {$REGION 'transp'}
      with Transp do
      begin
        modFrete := StrTomodFrete(Aok, Anf.freteconta_tr);

        {$REGION 'transporta'}
        if Assigned(Anf.transporta) then
          with Transporta do
          begin
            CNPJCPF := Anf.transporta.cnpj_tr;
            xNome   := Anf.transporta.nome_tr;
            IE      := IfThen(Anf.transporta.ie_tr.Equals('ISENTO'), '', Anf.transporta.ie_tr);
            xEnder  := Anf.transporta.end_tr;
            xMun    := Anf.transporta.municipio_tr;
            UF      := Anf.transporta.sigla_uf;
          end;
        {$ENDREGION}

        {$REGION 'retTransp - Não implementado'}
        {$ENDREGION}

        {$REGION 'veicTransp'}
        with veicTransp do
        begin
          placa := Anf.placa_tr;
          UF    := Anf.uf_placa_tr;
          RNTC  := Anf.tr_rntc;
        end;
        {$ENDREGION}

        //reboque
        //vagao
        //balsa

        {$REGION 'vol'}
        if not string.IsNullOrWhiteSpace(Anf.especie_tr)
          or not string.IsNullOrWhiteSpace(Anf.marca_tr)
          or not string.IsNullOrWhiteSpace(Anf.numero_tr)
          or (Anf.qtde_volumes_tr > 0)
          or (Anf.peso_l > 0)
          or (Anf.peso_b > 0)
        then
          with Vol.Add do
          begin
            qVol  := Anf.qtde_volumes_tr;
            esp   := Anf.especie_tr;
            marca := Anf.marca_tr;
            nVol  := Anf.numero_tr;
            pesoL := Anf.peso_l;
            pesoB := Anf.peso_b;
            //lacres
          end;
        {$ENDREGION}

        //Reboque  := ;
        //vagao    := ;
        //enbalsa  := ;
      end;
      {$ENDREGION}

      {$REGION 'cobr'}
      with Cobr do
      begin

        {$REGION 'dat'}
        with Fat do
        begin
          nFat  := Anf.fat_nfat;
          vOrig := Anf.fat_vorig;
          vDesc := Anf.fat_vdesc;
          vLiq  := Anf.fat_vliq;
        end;
        {$ENDREGION}

        {$REGION 'dup'}
        if Assigned(Anf.dup) then
          for Adup in Anf.dup do
            with Dup.Add do
            begin
              nDup  := Adup.ndup;//IfThen(conf.dupSequencial, Adup.ndup, Adup.ndoc);
              dVenc := Adup.dvenc;
              vDup  := Adup.vdup;
            end;
        {$ENDREGION}

      end;
      {$ENDREGION}

      {$REGION 'pag'}
      for Apag in Anf.pag do
        with pag.Add do
        begin

          {$REGION 'detpag'}
          indPag    := StrToIndpag(Aok, Apag.indpag);
          tPag      := StrToFormaPagamento(Aok, Apag.tpag.ToString.PadLeft(2, '0'));
          vPag      := Apag.vpag;
          xPag      := IfThen(tPag = TpcnFormaPagamento.fpOutro, Apag.xpag);

          {$REGION 'card'}
          tpIntegra := StrTotpIntegra(Apag.tpintegra);
          CNPJ      := Apag.cnpj;
          tBand     := StrToBandeiraCartao(Aok, Apag.tband.ToString);
          cAut      := Apag.caut;
          {$ENDREGION}

          {$ENDREGION}


        end;
      pag.vTroco    := Anf.pag_vtroco;
      {$ENDREGION}

      {$REGION 'infIntermed'}
      if Ide.indIntermed = iiOperacaoComIntermediador then
      begin
        infIntermed.CNPJ := Anf.infintermed_cnpj;
        infIntermed.idCadIntTran := Anf.infintermed_idcadinttran;
      end;
      {$ENDREGION}

      {$REGION 'infAdic'}
      with InfAdic do
      begin
        infAdFisco := Anf.dados_interesse_fisco.Text.Substring(0, 2000) +
                      IfThen(Anf.vfcpufdest > 0, Format(conf.fcp.Text_vFCPUFDest + '%n', [Anf.vfcpufdest])) +
                      IfThen(Anf.vfcpufdest > 0, IfThen(conf.fcp.UsarQuebraDeLinha, Fnfe.Configuracoes.WebServices.QuebradeLinha, ',' )) +
                      IfThen(Anf.vicmsufdest > 0, Format(conf.fcp.Text_vICMSUFDest + '%n', [Anf.vicmsufdest])) +
                      IfThen(Anf.vicmsufdest > 0, IfThen(conf.fcp.UsarQuebraDeLinha, Fnfe.Configuracoes.WebServices.QuebradeLinha, ',' )) +
                      IfThen(Anf.vicmsufremet > 0, Format(conf.fcp.Text_vICMSUFRemet + '%n', [Anf.vicmsufremet])) +
                      IfThen(Anf.vicmsufremet > 0, IfThen(conf.fcp.UsarQuebraDeLinha, Fnfe.Configuracoes.WebServices.QuebradeLinha, ',' ));
        infCpl     := Anf.obs.Text.Substring(0, 5000);
        infAdFisco := FiltrarTextoXML(True, infAdFisco, True, True, Fnfe.Configuracoes.WebServices.QuebradeLinha);
        infCpl     := FiltrarTextoXML(True, infCpl    , True, True, Fnfe.Configuracoes.WebServices.QuebradeLinha);

        {$REGION 'obsCont - Uso livre do contribuinte'}
        if Assigned(Anf.obsCont) then
          for AobsCont in Anf.obsCont do
            with obsCont.Add do
            begin
              xCampo := AobsCont.xcampo;
              xTexto := AobsCont.xtexto
            end;
        {$ENDREGION}

        {$REGION 'obsFiscao - Nao implementado, uso exclusivo do fisco'}
        {$ENDREGION}

        {$REGION 'procRef'}
        if Assigned(Anf.procRef) then
          for Aprocref in Anf.procRef do
            with procRef.Add do
            begin
              nProc   := Aprocref.num_proc;
              indProc := StrToindProc(Aok, Aprocref.ind_proc);
            end;
        {$ENDREGION}

      end;
      {$ENDREGION}

      {$REGION 'exporta'}
      if Anf.natureza_nf.Equals('S') and Anf.nfe_iddest.Equals('3') then
        with exporta do
        begin
          UFSaidaPais  := Anf.ufembarq;
          xLocExporta  := Anf.xlocembarq;
          xLocDespacho := Anf.xlocdespacho;
        end;
      {$ENDREGION}

      {$REGION 'compra - Nao implementado'}
      with compra do
      begin
        xNEmp := Anf.compra_xnemp;
        xPed := Anf.compra_xped;
        xCont := Anf.compra_xcont;
      end;
      {$ENDREGION}

      {$REGION 'cana - Nao implementado'}
      {$ENDREGION}

      {$REGION 'responsavel técnico'}
      if conf.NT_2018_005 then
        with infRespTec do
        begin
          CNPJ     := '03530705000109';
          xContato := 'HW SISTEMAS';
          email    := 'contato@hwsistemas.com.br';
          fone     := '3332725351';
          //idCSRT
          //hashCSRT
        end;
      {$ENDREGION}

    end;

  except on E: Exception do
    begin
      Result := False;
      listError.Add(Format('Adicionar NF codigo %d numero %d Erro: %s', [Anf.cod_nf, Anf.num_nf, E.Message]));
    end;
  end;
end;

procedure THwCentralNFe.acbr_configurar(AmostrarVencendo: Boolean);
var
  Aok: Boolean;
begin
  if not Assigned(emp) then
    emp := GetEmpresa_nfe;
  if not Assigned(emp) then
    raise Exception.Create('Objeto de configuração não carregado(Aemp)');

  if not Assigned(Fnfe) then
    Exit;

  if not Assigned(conf) then
    Exit;

  conf.ExecutarLeitura;

  Fnfe.Configuracoes.Certificados.ArquivoPFX         := '';
  Fnfe.Configuracoes.Certificados.Senha              := '';
  Fnfe.Configuracoes.Certificados.VerificarValidade := False;

  Fnfe.Configuracoes.Geral.ModeloDF                  := moNFe;
  Fnfe.Configuracoes.Geral.VersaoDF                  := ve400;
  Fnfe.Configuracoes.Geral.VersaoQRCode              := veqr300;
  Fnfe.Configuracoes.Geral.AtualizarXMLCancelado     := True;
  //nfe.Configuracoes.Geral.IdCSC
  //nfe.Configuracoes.Geral.CSC
  //nfe.Configuracoes.Geral.IncluirQRCodeXMLNFCe
  Fnfe.Configuracoes.Geral.FormaEmissao              := teNormal;
  Fnfe.Configuracoes.Geral.Salvar                    := True;
  Fnfe.Configuracoes.Geral.ExibirErroSchema          := True;
  Fnfe.Configuracoes.Geral.RetirarAcentos            := True;
  Fnfe.Configuracoes.Geral.ValidarDigest             := False;
  {
  Fnfe.Configuracoes.Geral.SSLLib                    := TSSLLib( IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 0, Integer(libCapicom)) +
                                                                 IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 1, Integer(libOpenSSL)) +
                                                                 IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 2, Integer(libWinCrypt)));//libCapicom;//libWinCrypt;//libCapicomDelphiSoap; //libCapicom;
  Fnfe.Configuracoes.Certificados.ArquivoPFX         := emp.nfe_caminho_cert;
  Fnfe.Configuracoes.Certificados.Senha              := emp.nfe_senha__cert;
  if Fnfe.Configuracoes.Geral.SSLLib <> libOpenSSL then
    Fnfe.Configuracoes.Certificados.NumeroSerie      := emp.nfe_numserie_cert;
  }

  var certData := TCertificateData.Create;
  certData.FileName := emp.nfe_caminho_cert;
  certData.SerialNumber := emp.nfe_numserie_cert;
  certData.Password := emp.nfe_senha__cert;
  certData.DaysWarning := emp.dias_aviso;
  certData.checkExpires := AmostrarVencendo;

  THelperDFe.Configure(Fnfe, EnumDfeType.enNFe, certData);

  Fnfe.Configuracoes.WebServices.UF                  := emp.webserv_uf;
  if emp.webserv_ambiente.Trim.Equals('Produção') then
    Fnfe.Configuracoes.WebServices.Ambiente          := taProducao
  else
    Fnfe.Configuracoes.WebServices.Ambiente          := taHomologacao;
  //nfe.Configuracoes.WebServices.ProxyHost
  //nfe.Configuracoes.WebServices.ProxyPort
  //nfe.Configuracoes.WebServices.ProxyUser
  //nfe.Configuracoes.WebServices.ProxyPass
  Fnfe.Configuracoes.WebServices.AguardarConsultaRet := IfThen(emp.nfe_tmpretornomil > 0, emp.nfe_tmpretornomil, Fnfe.Configuracoes.WebServices.AguardarConsultaRet);
  //nfe.Configuracoes.WebServices.Tentativas
  //nfe.Configuracoes.WebServices.IntervaloTentativas
  Fnfe.Configuracoes.WebServices.Salvar              := True;
  Fnfe.Configuracoes.WebServices.TimeOut             := Max(5000, emp.nfe_tmpretornomil);
  Fnfe.Configuracoes.WebServices.QuebradeLinha       := ';';
  Fnfe.Configuracoes.WebServices.Visualizar          := emp.webserv_visualizar.StartsWith('S');
  Fnfe.Configuracoes.Arquivos.PathSalvar             := emp.nfe_logpath;
  //nfe.Configuracoes.Arquivos.PathSchemas            := '';
  Fnfe.Configuracoes.Arquivos.AdicionarLiteral       := True;
  if emp.nfe_gravalog.StartsWith('S') then
    Fnfe.OnGerarLog := THwAux.GerarLog;

  if IniConf.ReadStr('MD', 'PathXmlPorCNPJ') <> '' then
  begin
    Fnfe.Configuracoes.Arquivos.PathSalvar := IncludeTrailingPathDelimiter(IniConf.ReadStr('MD', 'PathXmlPorCNPJ')) + 'DadosNFSe\';
    Fnfe.Configuracoes.Arquivos.SepararPorCNPJ := True;
    Fnfe.Configuracoes.Arquivos.SepararPorModelo := True;
  end;

  case conf.TagICMSSubsti of
    tisSempre            : Fnfe.Configuracoes.Geral.ForcarGerarTagRejeicao938 := fgtSempre;
    tisQuandoPreenchido  : Fnfe.Configuracoes.Geral.ForcarGerarTagRejeicao938 := fgtNunca;
    tisSempreProducao    : Fnfe.Configuracoes.Geral.ForcarGerarTagRejeicao938 := fgtSomenteProducao;
    tisSempreHomologacao : Fnfe.Configuracoes.Geral.ForcarGerarTagRejeicao938 := fgtSomenteHomologacao;
  end;

  Fnfe.OnStatusChange := acbr_StatusChange;

  if Assigned(Fnfe.MAIL) then
  begin
    with Fnfe.MAIL do
    begin
      Host                := emp.smtp_emp;
      Port                := emp.porta_smtp.ToString;
      Username            := emp.login_emp;
      Password            := emp.email_senha;
      From                := emp.email_emp;
      SetSSL              := emp.email_usassl.StartsWith('S');
      FromName            := emp.nome_emp;
      SetTLS              := emp.email_usatls.StartsWith('S');
      ReadingConfirmation := False;
      UseThread           := False;
    end;
  end;

  if Assigned(Fdanfe) then
  begin
    TACBrNFeDANFeRL(Fdanfe).LarguraCodProd                := conf.danfe.LarguraCodProd;
    TACBrNFeDANFeRL(Fdanfe).ExibeEAN                      := conf.danfe.ExibirEAN;
    TACBrNFeDANFeRL(Fdanfe).CasasDecimais.qCom            := conf.danfe.CasasDecimais_qCom;
    TACBrNFeDANFeRL(Fdanfe).CasasDecimais.vUnCom          := conf.danfe.CasasDecimais_vUnCom;
    //TACBrNFeDANFeRL(Fdanfe).ProdutosPorPagina             := conf.danfe.ProdutosPorPagina;
    TACBrNFeDANFeRL(Fdanfe).ExibeCampoFatura              := conf.danfe.ExibeCampoFatura;
    TACBrNFeDANFeRL(Fdanfe).EspacoEntreProdutos           := conf.danfe.EspacoEntreProdutos;
    TACBrNFeDANFeRL(Fdanfe).AlternaCoresProdutos          := conf.danfe.AlternaCoresProdutos;
    TACBrNFeDANFeRL(Fdanfe).ExibeInforAdicProduto         := TinfAdcProd(Ifthen(conf.danfe.ExibirBandInforAdicProduto, 1));
    TACBrNFeDANFeRL(Fdanfe).ExibeDadosDocReferenciados    := conf.danfe.ImprimirDadosDocReferenciados;
    TACBrNFeDANFeRL(Fdanfe).ExibeResumoCanhoto            := conf.danfe.ExibirResumoCanhoto;
    TACBrNFeDANFeRL(Fdanfe).ImprimeDetalhamentoEspecifico := conf.danfe.ImprimeDetalhamentoEspecifico;
    TACBrNFeDANFeRL(Fdanfe).ImprimeTotalLiquido           := emp.ms_val_liq_nfe.StartsWith('S');
    TACBrNFeDANFeRL(Fdanfe).Logo                          := emp.nfe_logomarca;
    TACBrNFeDANFeRL(Fdanfe).PathPDF                       := emp.nfe_enderecopdf;
    TACBrNFeDANFeRL(Fdanfe).CasasDecimais.MaskqCom        := '';
    TACBrNFeDANFeRL(Fdanfe).CasasDecimais.MaskvUnCom      := '';
    TACBrNFeDANFeRL(Fdanfe).Sistema                       := conf.softHouse;
    TACBrNFeDANFeRL(Fdanfe).TipoDANFE                     := StrToTpImp(IfThen(emp.nfe_danfe_tipo.Contains('Retrato'), '1', IfThen(emp.nfe_danfe_tipo.Contains('Simplificado'), '3',  '2')));
    TACBrNFeDANFeRL(Fdanfe).DetVeiculos                   := [];
    TACBrNFeDANFeRL(Fdanfe).ExibeDadosDocReferenciados    := False;
    TACBrNFeDANFeRL(Fdanfe).ExpandirDadosAdicionaisAuto   := conf.danfe.ReadInteger('DANFE', 'ExpandirDadosAdicionaisAuto', 0) = 1;
    Fdanfe.Fonte.TamanhoFonteRazaoSocial                  := conf.danfe.ReadInteger('DANFE', 'TamanhoFonteRazaoSocial', 8);
    Fdanfe.Fonte.TamanhoFonteEndereco                     := conf.danfe.ReadInteger('DANFE', 'TamanhoFonteEndereco', 8);
    Fdanfe.Fonte.TamanhoFonteInformacoesComplementares    := conf.danfe.ReadInteger('DANFE', 'TamanhoFonteInformacoesComplementares', 6);
    Fdanfe.Fonte.TamanhoFonteDemaisCampos                 := conf.danfe.ReadInteger('DANFE', 'TamanhoFonteDemaisCampos', 8);

    if conf.danfe.KesyChanges then
      conf.danfe.SaveConfDB(QrAux).Transaction.Commit;
  end;

  Fnfe.Configuracoes.RespTec.IdCSRT := StrToIntDef(conf.IdCSRT, 0);
  Fnfe.Configuracoes.RespTec.CSRT   := conf.CSRT;

  {
  if AmostrarVencendo then
    if Fnfe.Configuracoes.Certificados.NumeroSerie <> '' then
      if ((Fnfe.SSL.CertDataVenc - Date) <= emp.dias_aviso) then
        Application.MessageBox(PWideChar('Certificado selecionado vence em: '+ DateToStr(Fnfe.SSL.CertDataVenc)), 'Atenção', MB_ICONWARNING + MB_OK);
  }

end;

function THwCentralNFe.acbr_def_send_mail(Amail: THwNFe_mail_aux): Boolean;
var
  I, K: Integer;
  AxmlName: string;
  Adel, Aattach: TStrings;
  dadosAudit: TObjectList<TAuxAudit>;
  boletosSeparados: TArray<TBoletosSeparados>;

  function NewDadosAudit(id: Integer; processo, codigo, mensagem: string): TAuxAudit;
  var
    z: Integer;
  begin
    for z := 0 to dadosAudit.Count - 1 do
      //if (dadosAudit[z].Id = id) and (dadosAudit[z].Processo = processo) then
      if dadosAudit[z].Mensagem = mensagem then
      begin
        Result := dadosAudit[z];
        Exit;
      end;

    Result := TAuxAudit.Create;
    Result.Id := id;
    Result.Processo := processo;
    Result.Codigo := codigo;
    Result.Mensagem := mensagem;
  end;

  procedure send_mail_boletos_separados;
  var
    sendMail: TACBrMail;
  begin

    sendMail := TACBrMail.Create(nil);
    try

      try
        for var bol in boletosSeparados do
        begin
          sendMail.Clear;

          sendMail.Host                := emp.smtp_emp;
          sendMail.Port                := emp.porta_smtp.ToString;
          sendMail.Username            := emp.login_emp;
          sendMail.Password            := emp.email_senha;
          sendMail.From                := emp.email_emp;
          sendMail.SetSSL              := emp.email_usassl.StartsWith('S');
          sendMail.FromName            := emp.nome_emp;
          sendMail.SetTLS              := emp.email_usatls.StartsWith('S');
          sendMail.Priority            := MP_normal;
          sendMail.ReadingConfirmation := False;
          sendMail.UseThread           := False;

          sendMail.AddAddress(Amail.email);
          for var strmail in Amail.CCmails do
            sendMail.AddCC(strmail);

          sendMail.Subject := bol.assunto;
          sendMail.AltBody.Text := bol.corpo;
          sendMail.AddAttachment(bol.fileName);
          sendMail.Send;


        end;

      finally
        for var del in boletosSeparados do
          try DeleteFile(PWideChar(del.fileName)); except end;
      end;

    finally
      sendMail.Free;
    end;
  end;

  procedure processa_nota(Anf: TNotafiscal_class_hw);
  var
    Ai, Aj: Integer;
  begin
    AxmlName := Amail.pathPDF + '\' + Anf.chave_nfe + '-nfe.xml';
    Anf.xml_nfe.SaveToFile(AxmlName);
    Amail.Anexos.Add(AxmlName);
    Adel.Add(AxmlName);
    if Amail.comPDF then
    begin
      Fnfe.NotasFiscais.Clear;
      Fnfe.NotasFiscais.Add.LerXML(Anf.xml_nfe.Text);
      if Fnfe.NotasFiscais.Count > 0 then
      begin
        for Ai := 0 to Pred(Fnfe.NotasFiscais.Count) do with Fnfe.NotasFiscais.Items[Ai].NFe do
        begin
          if Self.conf.danfe.ImprimirIpiDevolEmCampoIPI then
          begin
            for Aj := 0 to Pred(Det.Count) do
            begin
              if Det.Items[Aj].vIPIDevol > 0 then
              begin
                Det.Items[Aj].Imposto.IPI.vIPI := Det.Items[Aj].vIPIDevol;
                Det.Items[Aj].Imposto.IPI.pIPI := 0;
              end;
              var tmpInfAd := THelperDFe.GetInfAdicionalProdCombustiveis(Det.Items[Aj]);
              if Length(tmpInfAd) > 0 then
                Det.Items[Aj].infAdProd := Det.Items[Aj].infAdProd + IfThen(not Det.Items[Aj].infAdProd.Trim.IsEmpty, ';') + String.Join(';', tmpInfAd);
            end;
            if Total.ICMSTot.vIPIDevol > 0 then
              Total.ICMSTot.vIPI := Total.ICMSTot.vIPIDevol;
          end;

          InfAdic.infAdFisco := ReverterFiltroTextoXML(InfAdic.infAdFisco);
          InfAdic.infCpl     := ReverterFiltroTextoXML(InfAdic.infCpl);

          var tmpDadosCmpl := THelperDFe.GetInfComplementarCombustiveis(Fnfe.NotasFiscais.Items[Ai].NFe);
          if Length(tmpDadosCmpl) > 0 then
            InfAdic.infCpl := InfAdic.infCpl + IfThen(not InfAdic.infCpl.Trim.IsEmpty, ';') + String.Join(';', tmpDadosCmpl);
        end;

        Fnfe.NotasFiscais.ImprimirPDF;
        Amail.Anexos.Add(Fnfe.DANFE.ArquivoPDF);
        Adel.Add(Fnfe.DANFE.ArquivoPDF);
      end;
      if Amail.comBol and (Assigned(Anf.dup)) then
        for Ai := 0 to Anf.dup.Count - 1 do
          if Anf.dup.Items[Ai].GerarBoletoEmPDF(Amail.pathPDF) then
          begin
            if Amail.sepBoletos.ativo then
            begin
              var bol := TBoletosSeparados.Create;
              bol.fileName := Anf.dup.Items[Ai].ArquivoPDF;

              var ndup := StrToIntDef(Anf.dup.Items[Ai].ndup.Trim, 0).ToString;
              ndup := IfThen(ndup.Equals('0'), Anf.dup.Items[Ai].ndup, ndup);

              bol.assunto  := Amail.sepBoletos.assunto
                .Replace('[@ndup]', ndup)
                .Replace('[@countdup]', Anf.dup.Count.ToString)
                .Replace('[@num_nf]', Anf.num_nf.ToString);

              bol.corpo  := Amail.sepBoletos.corpo
                .Replace('[@ndup]', ndup)
                .Replace('[@countdup]', Anf.dup.Count.ToString)
                .Replace('[@num_nf]', Anf.num_nf.ToString);

              boletosSeparados := boletosSeparados + [bol];
            end
            else
            begin
              Amail.Anexos.Add(Anf.dup.Items[Ai].ArquivoPDF);
              Adel.Add(Anf.dup.Items[Ai].ArquivoPDF);
            end;
          end
          else if (Anf.dup.Items[Ai].n_seq_bol > 0) and (not Anf.dup.Items[Ai].NossoNumero.Trim.IsEmpty) then // teste com nosso numero e sem boleto
            dadosAudit.Add(NewDadosAudit(Anf.cod_nf, 'NFE013', Anf.cod_nf.ToString, Format('NUM NF %d SEQ BOL %d', [Anf.cod_nf, Anf.dup.Items[Ai].n_seq_bol])))
          else if (Anf.dup.Items[Ai].n_seq_bol > 0) then
            dadosAudit.Add(NewDadosAudit(Anf.cod_nf, 'NFE012', Anf.cod_nf.ToString, Format('NUM NF %d SEQ BOL %d', [Anf.cod_nf, Anf.dup.Items[Ai].n_seq_bol])));
    end;
  end;

  procedure processa_evento(Aev: TNotafiscal_carta_correcao_class_hw);
  begin
    AxmlName := Amail.pathPDF + '\' + THwAux.apenasNumeros(Aev.id_dfe) + '-procEventoNFe.xml';
    Aev.xml_evento.SaveToFile(AxmlName);
    Amail.Anexos.Add(AxmlName);
    Adel.Add(AxmlName);
    if (Amail.comPDF) and (not Aev.tipo_evento.Equals(strEventoEPEC)) then
    begin
      Fnfe.EventoNFe.Evento.Clear;
      Fnfe.EventoNFe.LerXMLFromString(Aev.xml_evento.Text);
      if Fnfe.EventoNFe.Evento.Count > 0 then
      begin
        Fnfe.ImprimirEventoPDF;
        Amail.Anexos.Add(Fnfe.DANFE.ArquivoPDF);
        Adel.Add(Fnfe.DANFE.ArquivoPDF);
      end;
    end;
  end;

  function valida_email_boleto_sem_anexo(Anf: TNotafiscal_class_hw): Boolean;
  var
    z: Integer;
    nfe012, nfe013: Boolean;
  begin
    Result := True;
    nfe012 := False;
    nfe013 := False;
    Auditor.Validar;

    for z := 0 to dadosAudit.Count - 1 do
      if (not Assigned(Anf)) or (Anf.cod_nf = dadosAudit[z].Id) then
        with Auditor.listauditoria.New do
        begin
          cod_processo := dadosAudit[z].Processo;
          acao := 'VALIDAR';
          mensagem := dadosAudit[z].Mensagem;
          tabela := 'NOTAFISCAL';
          codigo := dadosAudit[z].Codigo;
        end;
    if Auditor.listauditoria.Count = 0 then
      Exit;

    Auditor.CodProcesso := '';
    Result := Auditor.Permitido;
  end;

  procedure HandleCompressFile;
  begin
    if not Amail.emailUnico or (Amail.docDFe <> docNFe) or Amail.comPDF or (Amail.Anexos.Count <= 3) then
      Exit;

    var FileTemp := IncludeTrailingPathDelimiter(Amail.pathPDF) + 'ArquivosNFe.zip';

    if CompactarVariosArquivos_dx(Amail.Anexos.Text, FileTemp) then
      if FileExists(FileTemp) then
      begin
        Adel.Add(FileTemp);
        Amail.Anexos.Clear;
        Amail.Anexos.Add(FileTemp);
      end;
  end;

begin
  Result := False;
  try
    try
      Aattach    := TStringList.Create;
      Adel       := TStringList.Create;
      Fnfe       := TACBrNFe.Create(nil);
      Fmail      := TACBrMail.Create(Fnfe);
      Fdanfe     := TACBrNFeDANFeRL.Create(Fnfe);
      Fnfe.MAIL  := Fmail;
      Fnfe.DANFE := Fdanfe;
      dadosAudit := TObjectList<TAuxAudit>.Create;

      acbr_configurar;
      InitAuditor(Usuario, cod_empresa);
      Fnfe.DANFE.PathPDF       := Amail.pathPDF;
      Fnfe.DANFE.MostraStatus  := False;
      Fnfe.DANFE.MostraPreview := False;

      case Amail.docDFe of
        docNFe:
        {$REGION 'montando envio da NFe e seus eventos'}
          begin
            if not Amail.emailUnico then
              for AxmlName in Amail.Anexos do
                Aattach.Add(AxmlName);

            for I := 0 to Amail.docs.notas.Count - 1 do
              if not Amail.docs.notas.Items[I].xml_nfe.Text.Trim.IsEmpty then
              begin
                processa_nota(Amail.docs.notas.Items[I]);

                if Amail.comEventos then
                begin

                  {$REGION 'eventos da nota'}
                  if Assigned(Amail.docs.notas.Items[I].eventoEPEC) then
                    if (Amail.docs.notas.Items[I].eventoEPEC.situacao = sitAutorizada) and
                      (not Amail.docs.notas.Items[I].eventoEPEC.xml_evento.Text.Trim.IsEmpty) then
                      processa_evento(Amail.docs.notas.Items[I].eventoEPEC);

                  if Assigned(Amail.docs.notas.Items[I].eventoCanc) then
                    if (Amail.docs.notas.Items[I].eventoCanc.situacao = sitAutorizada) and
                      (not Amail.docs.notas.Items[I].eventoCanc.xml_evento.Text.Trim.IsEmpty) then
                      processa_evento(Amail.docs.notas.Items[I].eventoCanc);

                  if Assigned(Amail.docs.notas.Items[I].eventosCCe) then
                    for K := Amail.docs.notas.Items[I].eventosCCe.Count - 1 downto 0 do
                      if (Amail.docs.notas.Items[I].eventosCCe.Items[K].situacao = sitAutorizada) and
                      (not Amail.docs.notas.Items[I].eventosCCe.Items[K].xml_evento.Text.Trim.IsEmpty) then
                      begin
                        processa_evento(Amail.docs.notas.Items[I].eventosCCe.Items[K]);
                        Break;
                      end;
                  {$ENDREGION}

                end;

                if not Amail.emailUnico then
                begin
                  Amail.CCmails.Clear;
                  Amail.email := Amail.docs.notas.Items[I].dest_email;

                  if valida_email_boleto_sem_anexo(Amail.docs.notas.Items[I]) then
                    Fnfe.EnviarEmail( Amail.email, Amail.Assunto, Amail.Mensagem, Amail.CCmails, Amail.Anexos, nil, '');

                  for AxmlName in Adel do try DeleteFile(PWideChar(AxmlName)); except end;
                  Adel.Clear;

                  Amail.Anexos.Clear;
                  for AxmlName in  Aattach do
                    Amail.Anexos.Add(AxmlName);
                end;
              end;
          end;
        {$ENDREGION}
        docEPEC, docEventoCCe, docEventoCan:
        {$REGION 'montando eventos EPEC CCe e Cancelamento'}
          begin
            processa_nota(Amail.docs.nfEvento);   //deixar nessa ordem
            processa_evento(Amail.docs.evento);
          end;
        {$ENDREGION}
        docInut:
        {$REGION 'montando inutilizacao'}
        begin
          for I := 0 to Amail.docs.inut.Count - 1 do
          begin
            AxmlName := Amail.pathPDF + '\' + THwAux.apenasNumeros(Amail.docs.inut.Items[I].id_dfe) + '-procInutNFe.xml';
            Amail.docs.inut.Items[I].xml_inut.SaveToFile(AxmlName);
            Amail.Anexos.Add(AxmlName);
            Adel.Add(AxmlName);
            if Amail.comPDF then
            begin
              Fnfe.InutNFe.LerXMLFromString(Amail.docs.inut.Items[I].xml_inut.Text);
              Fnfe.ImprimirInutilizacaoPDF;
              Amail.Anexos.Add(Fnfe.DANFE.ArquivoPDF);
              Adel.Add(Fnfe.DANFE.ArquivoPDF);
            end;
          end;
        end;
        {$ENDREGION}
      end;

      HandleCompressFile;

      if (Amail.emailUnico) or (Amail.docDFe <> docNFe) then
        if valida_email_boleto_sem_anexo(nil) then
          Fnfe.EnviarEmail( Amail.email, Amail.Assunto, Amail.Mensagem, Amail.CCmails, Amail.Anexos, nil, '');

      send_mail_boletos_separados;

    finally
      for AxmlName in Adel do
        try DeleteFile(PWideChar(AxmlName)); except end;

      if Assigned(Aattach) then
        FreeAndNil(Aattach);
      if Assigned(Adel) then
        FreeAndNil(Adel);
      if Assigned(Fmail) then
        FreeAndNil(Fmail);
      if Assigned(Fdanfe) then
        FreeAndNil(Fdanfe);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;
    Result := True;

  except on E: Exception do
    begin
      listError.Append('NFe_envio_email: ' + e.Message);
      registraErro('THwCentralNFe.acbr_def_send_mail ' + e.Message);
    end;
  end;
end;

function THwCentralNFe.acbr_gerar_assinar_validar: Boolean;
var
  Alog: TStrings;
  I: Integer;
begin
  Result := True;

  try
    Fnfe.NotasFiscais.GerarNFe;
  except on E: Exception do
    begin
      FlastError := 'GerarNFe -> ' + e.Message;
      listError.Add(FlastError);
      Result := False;
    end;
  end;

  Alog := TStringList.Create;
  try

    try
      for I := 0 to Fnfe.NotasFiscais.Count - 1 do
      begin
        Alog.Text := Fnfe.NotasFiscais.Items[I].XMLAssinado;
        Alog.SaveToFile(ExtractFilePath(Application.ExeName) + 'NFe_xml_' + IntToStrZero(I, 2) + '.log');
      end;
    except
    end;

  finally
    FreeAndNil(Alog);
  end;

  try
    if Result then
      Fnfe.NotasFiscais.Assinar;
  except on E: Exception do
    begin
      FlastError := 'Assinar -> ' + e.Message;
      listError.Add(FlastError);
      Result := False;
    end;
  end;

  try
    if Result then
      Fnfe.NotasFiscais.Validar;
  except
    on E: EACBrDFeException do
    begin
      FlastError := 'Validar -> ' + e.Message;
      listError.Add(FlastError);
      Result := False;
    end;
    on E: Exception do
    begin
      FlastError := 'Validar -> ' + e.Message;
      listError.Add(FlastError);
      Result := False;
    end;
  end;
end;

function THwCentralNFe.acbr_nfe_consultar(var Anota: TNotafiscal_class_hw;
  Adocs: DocuemntosNFeHW): TNFeConsulta;
var
  ArespAcbr: Boolean;
  Aevento: TNotafiscal_carta_correcao_class_hw;
  I, J, K, L: Integer;
  AXMLEventos: TStringList;
  a: TDFeWebService;
begin
  if not Assigned(Fnfe) then
    Exit;

  AXMLEventos := TStringList.Create;
  try
    Result := Fnfe.WebServices.Consulta;

    Fnfe.NotasFiscais.Clear;
    Fnfe.NotasFiscais.Add.LerXML(Anota.xml_nfe.Text);
    if Fnfe.NotasFiscais.Count > 0 then
    begin
      if Assigned(Anota.eventoCanc) then
        if not Anota.eventoCanc.xml_nfe_epec.Text.IsEmpty then
          AXMLEventos.Add(Anota.eventoCanc.xml_nfe_epec.Text);
      if Assigned(Anota.eventosCCe) then
        for Aevento in Anota.eventosCCe do
          if not Aevento.xml_nfe_epec.Text.IsEmpty then
            AXMLEventos.Add(Aevento.xml_nfe_epec.Text);
      if AXMLEventos.Count > 0 then
        Fnfe.EventoNFe.LerXMLFromString(AXMLEventos.Text);

      Fnfe.Configuracoes.Geral.FormaEmissao   := Fnfe.NotasFiscais.Items[Fnfe.NotasFiscais.Count - 1].NFe.Ide.tpEmis;
      Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[Fnfe.NotasFiscais.Count - 1].NFe.Ide.tpAmb;
      Fnfe.WebServices.Consulta.NFeChave      := Fnfe.NotasFiscais.Items[Fnfe.NotasFiscais.Count - 1].NumID;

      if not Fnfe.WebServices.Consulta.Executar then
      begin
        Anota.nfe_cstat     := Fnfe.WebServices.Consulta.cStat;
        Anota.descricaoerro := Fnfe.WebServices.Consulta.XMotivo;
        Anota.situacao_nfe  := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Anota.nfe_cstat));
      end
      else
      begin
        //talvez no caso de duplicidade, apos liberar a nota das requisicoes, liberar os campos de numero de nota , pensar em algo

        {$REGION 'dados do processamento da NFe'}
        for I := 0 to Fnfe.NotasFiscais.Count - 1 do
          if Anota.chave_nfe.Equals(Fnfe.NotasFiscais.Items[I].NumID) then
            if Assigned(Fnfe.NotasFiscais.Items[I].NFe.procNFe) then
              if Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat > 0 then
              begin
                Anota.data_autorizacao := Fnfe.NotasFiscais.Items[I].NFe.procNFe.dhRecbto;
                Anota.protocolo        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.nProt;
                Anota.digest           := Fnfe.NotasFiscais.Items[I].NFe.procNFe.digVal;
                Anota.nfe_cstat        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat;
                Anota.descricaoerro    := Fnfe.NotasFiscais.Items[I].NFe.procNFe.xMotivo;
                Anota.situacao_nfe     := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Anota.nfe_cstat));
                if Anota.sitNFe in [stAutorizada, stDenegada] then
                  Anota.xml_nfe.Text := Fnfe.NotasFiscais.Items[I].XMLOriginal
                else if (Anota.sitNFe = stCancelada) and (Assigned(Anota.eventoCanc)) and (Anota.just_cancelamento.IsEmpty) then
                  Anota.just_cancelamento := Anota.eventoCanc.xcorrecao.Text.Substring(0, 60);

                if docNFe in Adocs then
                  Save_retorno_consulta(Anota);

                RegistradorAlertasDFeUtil.ResolverAlertas(Fnfe.NotasFiscais.Items[I].NFe.procNFe);
              end;
        {$ENDREGION}

        {$REGION 'dados do processamento do Evento EPEC'}
        if Assigned(Anota.eventoEPEC) and
          (Anota.nfe_tpemis.Equals('4')) and
          (Anota.nfe_dpec_nregdpec.Equals('???????????????')) then
        begin
          for J := 0 to Fnfe.WebServices.Consulta.procEventoNFe.Count - 1 do
            for K := 0 to Fnfe.WebServices.Consulta.procEventoNFe.Items[J].RetEventoNFe.retEvento.Count - 1 do
              with Fnfe.WebServices.Consulta.procEventoNFe.Items[J].RetEventoNFe do
                if (retEvento.Items[K].RetInfEvento.tpEvento = teEPECNFe) and
                  (Anota.chave_nfe.Equals(retEvento.Items[K].RetInfEvento.chNFe)) and
                  (retEvento.Items[K].RetInfEvento.cStat = 136) then // evento autorizado
                begin
                  Anota.eventoEPEC.cstat           := retEvento.Items[K].RetInfEvento.cStat.ToString;
                  Anota.eventoEPEC.xmotivo         := retEvento.Items[K].RetInfEvento.xMotivo;
                  Anota.eventoEPEC.nprot           := retEvento.Items[K].RetInfEvento.nProt;
                  Anota.eventoEPEC.dhevento        := retEvento.Items[K].RetInfEvento.dhRegEvento;
                  Anota.eventoEPEC.xml_evento.Text := retEvento.Items[K].RetInfEvento.XML;
                  Anota.eventoEPEC.situacao        := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoEventoHW(retEvento.Items[K].RetInfEvento.cStat));

                  Anota.nfe_dpec_xmotivo  := retEvento.Items[K].RetInfEvento.xMotivo;
                  Anota.nfe_dpec_nregdpec := retEvento.Items[K].RetInfEvento.nProt.Substring(0, 17);
                  Anota.nfe_dpec_cstat    := retEvento.Items[K].RetInfEvento.cStat;
                  if docEPEC in Adocs then
                    Save_retorno_autorizacao_epec(Anota);
                end;
        end;

        {$ENDREGION}

        {$REGION 'dados do processamento de Eventos da NFe, falta ver o q fazer aquim, depois de implementar os eventos'}
        for I := 0 to Fnfe.WebServices.Consulta.procEventoNFe.Count - 1 do
          for J := 0 to Fnfe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Count - 1 do
            with Fnfe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Items[J] do
              if (Anota.chave_nfe.Equals(RetInfEvento.chNFe)) and
                (RetInfEvento.tpEvento in [teCCe, teCancelamento]) then
              begin
                Aevento := nil;
                if (RetInfEvento.tpEvento = teCancelamento) then
                begin
                  Aevento := Anota.eventoCanc;
                  if (Anota.sitNFe <> stCancelada ) then
                  begin
                    Anota.situacao_nfe      := sitCancelada;
                    if Assigned(Anota.eventoCanc) then
                      Anota.just_cancelamento := Anota.eventoCanc.xcorrecao.Text.Substring(0, 15);
                    if docEventoCan in Adocs then
                      Save_retorno_cancelamento(Anota);
                  end;
                end
                else if Assigned(Anota.eventosCCe) then
                begin
                  for L := 0 to Anota.eventosCCe.Count - 1 do
                    if Anota.eventosCCe.Items[L].nseqevento = RetInfEvento.nSeqEvento then
                    begin
                      Aevento := Anota.eventosCCe.Items[L];
                      Break;
                    end;
                end;

                if Assigned(Aevento) then
                  if Aevento.situacao <> sitAutorizada then
                  begin
                    Aevento.cstat           := RetInfEvento.cStat.ToString;
                    Aevento.xmotivo         := RetInfEvento.xMotivo;
                    Aevento.nprot           := RetInfEvento.nProt;
                    Aevento.dhevento        := RetInfEvento.dhRegEvento;
                    Aevento.xml_evento.Text := '<procEventoNFe versao="' + Fnfe.LerVersaoDeParams(LayNfeEvento) + '" xmlns="' + ACBRNFE_NAMESPACE + '">' +
                                               Aevento.xml_nfe_epec.Text +
                                               '<retEvento versao="' + Fnfe.LerVersaoDeParams(LayNfeEvento) + '">' +
                                               RetInfEvento.XML +
                                               '</retEvento>' +
                                               '</procEventoNFe>';
                    Aevento.situacao        := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoEventoHW(RetInfEvento.cStat));

                    if ((docEventoCan in Adocs) and (RetInfEvento.tpEvento = teCCe)) or
                       ((docEventoCan in Adocs) and (RetInfEvento.tpEvento = teCancelamento)) then
                      Save_retorno_evento(Aevento);
                  end;
              end;
        {$ENDREGION}

      end;
      Result := Fnfe.WebServices.Consulta;
    end;
  finally
    if Assigned(AXMLEventos) then
      FreeAndNil(AXMLEventos);
  end;
end;

function THwCentralNFe.acbr_nfe_consultar_recibo(var Anota: TNotafiscal_class_hw): Boolean;
var
  ArespAcbr: Boolean;
  I, J, K, L: Integer;
begin
  Result := False;
  if not Assigned(Fnfe) then
    Exit;

  {$REGION 'envio'}
  Fnfe.NotasFiscais.Clear;
  Fnfe.NotasFiscais.Add.LerXML(Anota.xml_nfe.Text);
  Fnfe.Configuracoes.Geral.FormaEmissao   := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpEmis;
  Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpAmb;

  try
    Fnfe.WebServices.Retorno.Recibo := Anota.nfe_recibo;
    Fnfe.WebServices.Retorno.Executar;
    Result := True;
  except on E: Exception do
    begin
      listError.Add(Format('Consulta recibo %s Lote  ' +
                    IfThen(Fnfe.WebServices.Retorno.cStat = 103, 'recebido') +
                    IfThen(Fnfe.WebServices.Retorno.cStat = 104, 'processado') +
                    IfThen(Fnfe.WebServices.Retorno.cStat = 105, 'em processamento') + #13 +
                    'Retorno %d - %s '  + #13 + #13 +
                    '%n' ,[Fnfe.WebServices.Retorno.Recibo, Fnfe.WebServices.Retorno.cStat, Fnfe.WebServices.Retorno.xMotivo, e.Message]));
    end;
  end;
  {$ENDREGION}

    if Assigned(Fnfe.WebServices.Retorno) then
      if Fnfe.WebServices.Retorno.cStat > 0 then
      begin

      {$REGION 'dados do lote'}
        Anota.nfe_cmsg      := Fnfe.WebServices.Retorno.cMsg;
        Anota.nfe_xmsg      := Fnfe.WebServices.Retorno.xMsg;
        Anota.nfe_cstat     := Fnfe.WebServices.Retorno.cStat;
        Anota.descricaoerro := Fnfe.WebServices.Retorno.xMotivo;
        Anota.situacao_nfe  := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Anota.nfe_cstat));
      {$ENDREGION}

      {$REGION 'dados do processamento da NFe'}
      for I := 0 to Fnfe.NotasFiscais.Count - 1 do
        if Anota.chave_nfe.Equals(Fnfe.NotasFiscais.Items[I].NumID) then
          if Assigned(Fnfe.NotasFiscais.Items[I].NFe.procNFe) then
            if Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat > 0 then
            begin
              Anota.data_autorizacao := Fnfe.NotasFiscais.Items[I].NFe.procNFe.dhRecbto;
              Anota.protocolo        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.nProt;
              Anota.digest           := Fnfe.NotasFiscais.Items[I].NFe.procNFe.digVal;
              Anota.nfe_cstat        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat;
              Anota.descricaoerro    := Fnfe.NotasFiscais.Items[I].NFe.procNFe.xMotivo;
              Anota.situacao_nfe     := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Anota.nfe_cstat));
              if Anota.sitNFe in [stAutorizada, stDenegada] then
                Anota.xml_nfe.Text   := Fnfe.NotasFiscais.Items[I].XMLOriginal;
              if (Anota.nfe_cstat = 468) and (not Anota.nfe_dpec_nregdpec.IsEmpty) then
                Anota.situacao_nfe := sitEmEPEC;

              RegistradorAlertasDFeUtil.ResolverAlertas(Fnfe.NotasFiscais.Items[I].NFe.procNFe);
            end;
      {$ENDREGION}

      if Anota.sitNFe in [stVazio, stDuplicidade, stRejeitada] then
        Anota.nfe_recibo := '';

      Save_retorno_autorizacao(Anota);

      {$REGION 'consulta apenas para apresentar a mensagem ao usuario'}
      Fnfe.Configuracoes.Geral.FormaEmissao   := Fnfe.NotasFiscais.Items[Fnfe.NotasFiscais.Count - 1].NFe.Ide.tpEmis;
      Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[Fnfe.NotasFiscais.Count - 1].NFe.Ide.tpAmb;
      Fnfe.WebServices.Consulta.NFeChave      := Fnfe.NotasFiscais.Items[Fnfe.NotasFiscais.Count - 1].NumID;

      Fnfe.WebServices.Consulta.Executar;
      {$ENDREGION}

    end;
end;

procedure THwCentralNFe.acbr_StatusChange(Sender: TObject);
begin
//  if not Assigned(formStatus) then
//    Exit;
  if Fnfe.Status <> stIdle then
    if not Assigned(formStatus) then
      Application.CreateForm(TFormStatus, formStatus);

  with formStatus do
    case Fnfe.Status of
    stIdle            : if Assigned(formStatus) then FreeAndNil(formStatus);
    stNFeStatusServico: doStatus('Verificando status do serviço...');
    stNFeRecepcao     : doStatus('Enviando lote de NF-e...');
    stNFeRetRecepcao  : doStatus('Recebendo resposta do lote da NF-e');
    stNFeConsulta     : doStatus('Consultando NF-e pela chave');
    stNFeCancelamento : doStatus('Cancelando NF-e');
    stNFeInutilizacao : doStatus('Enviando pedido de inutilização');
    stNFeRecibo       : doStatus('Consulta autorização do lote da NF-e');
    stNFeCadastro     : doStatus('Consultando cadastro');
    stNFeEmail        : doStatus('Enviando email');
    stNFeCCe          : doStatus('Enviando carta de correção');
    stNFeEvento       : doStatus('Enviando evento');
    stConsNFeDest     : doStatus('Consultando NFe destinadas');
    stDownloadNFe     : doStatus('Efetuando download de NFe''s');
    stAdmCSCNFCe      : doStatus('Consulta NFCe');
    stDistDFeInt      : doStatus('Consulta Distribuição DFe');
    stEnvioWebService : doStatus('Enviando dados para o webservice');
   end;
end;

function THwCentralNFe.acbr_status_servico(AtpEmiss: string): Boolean;
var
  AtpAmb: string;
  ArescTpEmiss, ArescTpAmb: string;
  Aok: Boolean;
begin
  Result := False;

  if AtpEmiss.Trim.IsEmpty then
  begin
    AtpEmiss := TpEmisToStr(Fnfe.Configuracoes.Geral.FormaEmissao) +
                TpAmbToStr(Fnfe.Configuracoes.WebServices.Ambiente);
  end;

  if AtpEmiss.Length > 1 then
    AtpAmb := AtpEmiss.Substring(1, 1);

  AtpEmiss := AtpEmiss.Substring(0, 1);
  if not AtpEmiss.Equals('1') then
    if not AtpEmiss.Equals('6') then
      if not AtpEmiss.Equals('7') then
        AtpEmiss := '1';
  if not AtpAmb.Equals('1') then
    if not AtpAmb.Equals('2') then
      AtpAmb := '1';

  ArescTpEmiss := TpEmisToStr(Fnfe.Configuracoes.Geral.FormaEmissao);
  ArescTpAmb   := TpAmbToStr(Fnfe.Configuracoes.WebServices.Ambiente);

  Fnfe.Configuracoes.Geral.FormaEmissao   := StrToTpEmis(Aok, AtpEmiss);
  Fnfe.Configuracoes.WebServices.Ambiente := StrToTpAmb(Aok , AtpAmb);
  try
    Fnfe.WebServices.StatusServico.Executar;

    Result := (Fnfe.WebServices.StatusServico.cStat = 107) or
              (Fnfe.WebServices.StatusServico.cStat = 113);
  finally
    Fnfe.Configuracoes.Geral.FormaEmissao   := StrToTpEmis(Aok, ArescTpEmiss);
    Fnfe.Configuracoes.WebServices.Ambiente := StrToTpAmb(Aok , ArescTpAmb);
  end;
end;

procedure THwCentralNFe.ConsultarNFePendente(Nota: TNotafiscal_class_hw);
//var
//  I: Integer;
//  Situacao: SituacaoNFeHW;
begin
  case Self.ConsultaSituacaoNFe(Nota) of
    stVazio:
      raise Exception.Create('Consulta NFe Pendente sem código de resposta da SEFAZ');

    stEmProcessamento:
      raise Exception.Create('Consulta NFe Pendente Em Processamento na SEFAZ, é necessário aguardar');

    stInutilizada: ;

    stRejeitada:
      begin
        Nota.situacao_nfe := SituacaoNFeEnumStr[stAInutilizar];
        Save_situacao(Nota, False);
      end;

    stAutorizada, stCancelada, stDenegada:
      ProcurarAtribuirProcNFe(Nota, False);

    else
      raise Exception.Create('Consulta NFe Pendente retornou um código não mapeado');
  end;

//  if not Assigned(Fnfe) then
//    Exit;
//
//  Fnfe.NotasFiscais.Clear;
//  Fnfe.NotasFiscais.Add.LerXML(Nota.xml_nfe.Text);
//
//  if Fnfe.NotasFiscais.Count = 0 then
//    Exit;
//
//  Fnfe.Configuracoes.Geral.FormaEmissao   := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpEmis;
//  Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpAmb;
//  Fnfe.WebServices.Consulta.NFeChave      := Fnfe.NotasFiscais.Items[0].NumID;
//
//  try
//    Fnfe.Consultar(Fnfe.WebServices.Consulta.NFeChave);
//  except
//    on E: Exception do
//      raise Exception.Create('Falha de comunicação na consulta: ' + E.Message);
//  end;
//
//  Situacao := THwAux.cStatToSituacaoNFeHW(Fnfe.WebServices.Consulta.cStat);
//
//  Nota.nfe_cstat    := Fnfe.WebServices.Consulta.cStat;
//
//  case Situacao of
//    stVazio:
//      raise Exception.Create('Consulta NFe Pendente sem código de resposta da SEFAZ');
//
//    stEmProcessamento:
//      raise Exception.Create('Consulta NFe Pendente Em Processamento na SEFAZ, é necessário aguardar');
//
//    stInutilizada: ;
//
//    stRejeitada:
//      begin
//        Nota.situacao_nfe := SituacaoNFeEnumStr[stAInutilizar];
//        Save_situacao(Nota, False);
//      end;
//
//    stAutorizada, stCancelada, stDenegada:
//      ProcurarAtribuirProcNFe(Nota, False);
//
//    else
//      raise Exception.Create('Consulta NFe Pendente retornou um código não mapeado');
//  end;
end;

function THwCentralNFe.ConsultaSituacaoNFe(Nota: TNotafiscal_class_hw): SituacaoNFeHW;
var
  I: Integer;
begin
  Fnfe.NotasFiscais.Clear;
  Fnfe.NotasFiscais.Add.LerXML(Nota.xml_nfe.Text);

  if Fnfe.NotasFiscais.Count = 0 then
    raise Exception.Create('NFe sem XML');

  Fnfe.Configuracoes.Geral.FormaEmissao   := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpEmis;
  Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpAmb;
  Fnfe.WebServices.Consulta.NFeChave      := Fnfe.NotasFiscais.Items[0].NumID;

  try
    Fnfe.Consultar('', True);
  except
    on E: Exception do
      raise Exception.Create('Falha de comunicação na consulta: ' + E.Message);
  end;

  Result := THwAux.cStatToSituacaoNFeHW(Fnfe.WebServices.Consulta.cStat);
end;

function THwCentralNFe.dfe_dados_certificado(modelo: string): WideString;
var
  certData: TCertificateData;
  confNfce: TNfce_config_class; // da erro se eu colocar um confNfce.free;
begin

  Result := '';
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    Fnfe := TACBrNFe.Create(nil);
    try
      emp := GetEmpresa_nfe;
      var usarEmp := False;

      if modelo = '65' then
      begin

        confNfce := TNfce_config_class.Create;

        confNfce.CopyFrom(queryCons
          .Table('nfce_config', ' cert_arquivopfx, cert_num_serie, cert_senha, cert_dadospfx')
          .Equals('cod_empresa', cod_empresa)
          .Open().query);

        if confNfce.usar_conf_nfe = 'S' then
          usarEmp := True
        else
        begin

          certData              := TCertificateData.Create;
          certData.FileName     := confNfce.cert_arquivopfx;
          certData.SerialNumber := confNfce.cert_num_serie;
          certData.Password     := confNfce.cert_senha;
          certData.Base64PFX    := confNfce.cert_dadospfx.Text;
        end;
      end;

      if usarEmp or MatchText(modelo.ToLower(), ['55', 'nfse', 'mdfe']) then
      begin
        certData              := TCertificateData.Create;
        certData.FileName     := emp.nfe_caminho_cert;
        certData.SerialNumber := emp.nfe_numserie_cert;
        certData.Password     := emp.nfe_senha__cert;
      end;

      if Assigned(certData) then
      begin
        certData.DaysWarning  := emp.dias_aviso;
        certData.checkExpires := True;

        var dados := THelperDFe.GetCertificateData(Fnfe, certData);
        try
          Result := dados.Text;

          try
            var sDescricao := 'CERTIFICADO DIGITAL VENCIMENTO';
            var fs := TFormatSettings.Create('pt-BR');
            var dtVenc := StrToDateTime(dados.Values['DataVencimento'], fs);

            queryCons.SQL(' insert into stats (dia, cod_e, descricao, quantidade, valor, tipo)' +
                          ' select (:dia - 3650), :cod_e, :descricao, 1, 0, 2' +
                          ' from rdb$database' +
                          ' left join stats s on dia = (:dia - 3650) and s.cod_e = :cod_e and descricao = :descricao' +
                          ' where s.dia is null')
            .ParamAsDateTime('dia', dtVenc)
            .ParamValue('cod_e', cod_empresa)
            .ParamValue('descricao', sDescricao)
            .ExecSQL()
            .query.Transaction.Commit();

          except on E: Exception do
          end;
        finally
          dados.Free;
        end;
      end;

    finally
      FreeAndNil(Fnfe);
      if Assigned(certData) then
        FreeAndNil(certData);
      desconectar;
    end;

  except on E: Exception do
    begin
      listError.Append('DFe_validar_vencimento: ' + e.Message);
      registraErro('THwCentralNFe.dfe_validar_vencimento' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_atualizar_valores_xml(
  codigos_nf: array of Integer): Integer;
var
  Anota       : TNotafiscal_class_hw;
  itemNF      : TNotafiscal_item_class_hw;
  cod_nf, I   : Integer;
  Amail       : THwNFe_mail_aux;
  xmlFile     : string;
  importver   : string;
begin
  /// *****************************************************************************************************************
  ///
  ///  SEMPRE QUE ATUALIZAR AQUI ATUALIZAR TAMBEM O ARQUIVO UClasseNFe > TClassNfVenda.AddNFeInDBFromXML
  ///
  /// *****************************************************************************************************************

  Result := 0;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try

      for cod_nf in codigos_nf do
      begin

        try

          if queryCons
            .Open('select %s from notafiscal' +
                  ' where cod_nf = %d and cod_empresa = %d',
                  [TNotafiscal_class_hw.GetFieldsSql, cod_nf, cod_empresa])
            .IsEmpty
          then
            raise Exception.Create(Format('Nota fical codigo %d não carregada do banco', [cod_nf]));

          Anota := TNotafiscal_class_hw.Create( nil );

          Anota.SetValuesFrom(queryCons.query);

          if Anota.import_xml < strDataVersion  then
          begin

            {$REGION 'validando e configurando'}

            importver := 'ErroEmissaoPropria';
            if Anota.emissao_propria = 'S' then
              raise Exception.Create(Format('Nota fical codigo %d não é de emissão de terceiros', [cod_nf]));

            importver := 'ErroSemArquivo';
            if Anota.xml_nfe.Text.Trim.IsEmpty then
              if not Anota.path_xml_import.IsEmpty then
              begin
                if not Assigned(emp) then
                  emp := GetEmpresa_nfe;

                xmlFile := IncludeTrailingPathDelimiter(emp.nfe_logpath) + 'entradas\' + ExtractFileName(Anota.path_xml_import);
                if not FileExists(xmlFile) then
                  raise Exception.Create(Format('Nota fical codigo %d e numero %d sem arquivo xml para obter os dados', [Anota.cod_nf, Anota.num_nf]));
              end
              else
                raise Exception.Create(Format('Nota fical codigo %d e numero %d sem xml para obter os dados', [Anota.cod_nf, Anota.num_nf]));
            {$ENDREGION}

            Fnfe := TACBrNFe.Create(nil);
            try
              importver := 'ErroNoArquivo';
              Fnfe.NotasFiscais.Clear;
              if not Anota.xml_nfe.Text.Trim.IsEmpty then
                Fnfe.NotasFiscais.LoadFromString(Anota.xml_nfe.Text)
              else
                Fnfe.NotasFiscais.LoadFromFile(xmlFile);

              importver := strDataVersion;

              {$REGION 'update nos items'}

              GetNotaFiscal_prod(Anota);

              QrAux.Close;
              QrAux.SQL.Text := Format('update notafiscal_item set' +
                                       ' nitem_xml = :nitem_xml, ucom = :ucom, qcom = :qcom, vuncom = :vuncom, icm_orig = :icm_orig,' +
                                       ' icm_cst = :icm_cst, icm_csosn = :icm_csosn, icm_pred = :icm_pred, icm_vbc = :icm_vbc,' +
                                       ' icm_picm = :icm_picm, icm_vicm = :icm_vicm, icm_vbcfcp = :icm_vbcfcp, icm_pfcp = :icm_pfcp,' +
                                       ' icm_vfcp = :icm_vfcp, icm_modbcst = :icm_modbcst, icm_pmvast = :icm_pmvast,' +
                                       ' icm_predbcst = :icm_predbcst, icm_vbcst = :icm_vbcst, icm_picmst = :icm_picmst,' +
                                       ' icm_vicmst = :icm_vicmst, icm_vbcfcpst = :icm_vbcfcpst,icm_pfcpst = :icm_pfcpst,' +
                                       ' icm_vfcpst = :icm_vfcpst, icm_vicmdeson = :icm_vicmdeson, icm_vbcstret = :icm_vbcstret,' +
                                       ' icm_pst = :icm_pst, icm_vicmssubstituto = :icm_vicmssubstituto, icm_vicmsstret = :icm_vicmsstret,' +
                                       ' icm_vbcfcpstret = :icm_vbcfcpstret, icm_pfcpstret = :icm_pfcpstret, icm_vfcpstret = :icm_vfcpstret' +
                                       ' where cod_nf = %d and cod_empresa = %d and nitem = :nitem', [cod_nf, cod_empresa]);

              if Fnfe.NotasFiscais.Count > 0 then
                for itemNF in Anota.prod do
                  if itemNF.import_xml = 'S' then
                    for I := 0 to Fnfe.NotasFiscais.Items[0].NFe.Det.Count - 1 do
                      with Fnfe.NotasFiscais.Items[0].NFe.Det.Items[I] do
                      begin
                        if (Prod.cProd = itemNF.num_fab_fornecedor) and
                           (((itemNF.nitem_xml = 0) and (Prod.nItem = itemNF.nitem)) or
                           ((itemNF.nitem_xml > 0) and (Prod.nItem = itemNF.nitem_xml))) then
                        begin

                          try
                            itemNF.nitem_xml := Prod.nItem;

                            itemNF.ucom                := Prod.uCom;
                            itemNF.qcom                := Prod.qCom;
                            itemNF.vuncom              := Prod.vUnCom;
                            itemNF.nitem_xml           := Prod.nItem;
                            with Imposto.ICMS do
                            begin
                              itemNF.icm_orig            := OrigToStr(orig);
                              itemNF.icm_cst             := IfThen(CSOSN  = csosnVazio, CSTICMSToStr(CST));
                              itemNF.icm_csosn           := IfThen(CSOSN <> csosnVazio, CSOSNIcmsToStr(CSOSN));
                              itemNF.icm_pred            := pRedBC;
                              itemNF.icm_vbc             := vBC;
                              itemNF.icm_picm            := IfThen(pICMS > 0, pICMS, pCredSN);
                              itemNF.icm_vicm            := IfThen(vICMS > 0, vICMS, vCredICMSSN);
                              itemNF.icm_vbcfcp          := vBCFCP;
                              itemNF.icm_pfcp            := pFCP;
                              itemNF.icm_vfcp            := vFCP;
                              itemNF.icm_modbcst         := modBCSTToStr(modBCST);
                              itemNF.icm_pmvast          := pMVAST;
                              itemNF.icm_predbcst        := pRedBCST;
                              itemNF.icm_vbcst           := vBCST;
                              itemNF.icm_picmst          := pICMSST;
                              itemNF.icm_vicmst          := vICMSST;
                              itemNF.icm_vbcfcpst        := vBCFCPST;
                              itemNF.icm_pfcpst          := pFCPST;
                              itemNF.icm_vfcpst          := vFCPST;
                              itemNF.icm_vicmdeson       := vICMSDeson;
                              itemNF.icm_vbcstret        := vBCSTRet;
                              itemNF.icm_pst             := pST;
                              itemNF.icm_vicmssubstituto := vICMSSubstituto;
                              itemNF.icm_vicmsstret      := vICMSSTRet;
                              itemNF.icm_vbcfcpstret     := vBCFCPSTRet;
                              itemNF.icm_pfcpstret       := pFCPSTRet;
                              itemNF.icm_vfcpstret       := vFCPSTRet;
                            end;

                            itemNF.SetValuesInParams(QrAux, True);
                            QrAux.ExecSQL;
                          except on E: Exception do
                            begin
                              importver := 'ErroNoItem';
                              listError.Append('ErroItem ' + e.Message);
                            end;
                          end;
                          Break;
                        end;
                      end;
              {$ENDREGION}

            finally
              Fnfe.Free;
            end;

            SqlExec('update notafiscal set import_xml = %s where cod_nf = %d and cod_empresa = %d',
                   [importver.Substring(0, 16).QuotedString, cod_nf, Fcod_empresa], QrAux);

            if QrAux.Transaction.InTransaction then
              QrAux.Transaction.Commit;

            Result := Result + 1;
          end;

        except on E: Exception do
          begin
            SqlExec('update notafiscal set import_xml = %s where cod_nf = %d and cod_empresa = %d',
                    [importver.Substring(0, 16).QuotedString, cod_nf, Fcod_empresa], QrAux);

            listError.Append(e.Message);
          end;
        end;
      end;

    finally
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

      desconectar;
      if Assigned(Anota) then
        FreeAndNil(Anota);
    end;

  except on E: Exception do
    begin
      listError.Append('NFe_atualizar_valores: ' + e.Message);
      registraErro('THwCentralNFe.nfe_atualizar_valores_xml' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_autorizar(Acod_nf: array of Integer): Boolean;
var
  AlistEnviar   : TObjectList<TNotafiscal_class_hw>;
  AlistConsultar: TObjectList<TNotafiscal_class_hw>;
  AlistRecibos  : TObjectList<TNotafiscal_class_hw>;
  AlistEPEC     : TObjectList<TNotafiscal_class_hw>;
  AlistEPEC_Dup : TObjectList<TNotafiscal_class_hw>;
  Arecibos      : TStringList;
  Anfhw, Anfhw2 : TNotafiscal_class_hw;
  ArespAcbr     : Boolean;
  Alote         : Integer;
  Astr, Astr2   : string;
  I, J, K       : Integer;
  IdLast        : Integer;
  AstatusServ   : string;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;
    try

      AlistEnviar         := TObjectList<TNotafiscal_class_hw>.Create;
      AlistConsultar      := TObjectList<TNotafiscal_class_hw>.Create;
      AlistRecibos        := TObjectList<TNotafiscal_class_hw>.Create;
      AlistEPEC           := TObjectList<TNotafiscal_class_hw>.Create;
      AlistEPEC_Dup       := TObjectList<TNotafiscal_class_hw>.Create;
      Arecibos            := TStringList.Create;
      Arecibos.Sorted     := True;
      Arecibos.Duplicates := dupIgnore;

      Fnfe := TACBrNFe.Create(nil);

      acbr_configurar(True);

      {$REGION 'criando lista de envio e consultas'}
      for I := Low(Acod_nf) to High(Acod_nf) do
      begin
        //talvez o teste do DPEC, ver antes como será
        Anfhw := GetNotaFiscal(Acod_nf[I]);
        if not Assigned(Anfhw) then
          listError.Add(Format('NF %d não carregada do banco', [Acod_nf[I]]))
        else if (not Anfhw.emissao_propria.Equals('S')) then
          listError.Add(Format('NF %d numero %d. Não é emissão própria', [Anfhw.cod_nf, Anfhw.num_nf]))
        else if (Anfhw.natureza_nf.Equals('E') and (not Anfhw.num_gerado.Equals('S'))) then
          listError.Add(Format('NF %d numero %d. Número ainda não gerado pelo sistema', [Anfhw.cod_nf, Anfhw.num_nf]))
        else if Anfhw.sitNFe in [stAutorizada, stDenegada, stCancelada, stInutilizada] then
          listError.Add(Format('NF %d numero %d. Já está %s', [Anfhw.cod_nf, Anfhw.num_nf, Anfhw.situacao_nfe]))
        else if (THwAux.StrToSituacaoNFe(Anfhw.situacao_nfe) in [stVazio, stRejeitada, stEmEPEC]) then
        begin
          if (Anfhw.nfe_tpemis = '4') then
          begin
            if Assigned(Anfhw.eventoEPEC) then
            begin
              if Anfhw.eventoEPEC.situacao = sitAutorizada then
                AlistEnviar.Add(Anfhw)
              else
                AlistEPEC.Add(Anfhw);
            end
            else
              listError.Add(Format('NF %d numero %d selecionada EPEC(tpsmis=4), porém não econtrou o evento no BD', [Anfhw.cod_nf, Anfhw.num_nf]))
          end
          else
            AlistEnviar.Add(Anfhw);
        end
        else if (THwAux.StrToSituacaoNFe(Anfhw.situacao_nfe) in [stEnviando, stEmProcessamento]) then
          if not Anfhw.nfe_recibo.IsEmpty then
          begin
            Arecibos.Add(Anfhw.nfe_recibo);
            AlistRecibos.Add(Anfhw);
          end
          else
            AlistConsultar.Add(Anfhw);
      end;
      {$ENDREGION}

      {$REGION 'validando listas'}
      if (AlistEnviar.Count = 0) and (AlistConsultar.Count = 0) and (AlistEPEC.Count = 0) and (Arecibos.Count = 0) then
        raise Exception.Create('Nenhuma nota fiscal carregada no banco de dados');

      if AlistEnviar.Count > 0 then
      begin
        Astr  := AlistEnviar.Items[0].nfe_tpemis;
        Astr2 := AlistEnviar.Items[0].nfe_tpamb;
        for Anfhw in AlistEnviar do
          if not Anfhw.nfe_tpemis.Equals(Astr) then
            raise Exception.Create('Lista de notas fiscais de envio com formas de Emissão(Normal, SVC) divergentes')
          else if not Anfhw.nfe_tpamb.Equals(Astr2) then
            raise Exception.Create('Lista de notas fiscais de envio com ambientes(Produção, Homologação) divergentes');
        if AlistEnviar.Count > 50 then
          raise Exception.Create(Format('Número de notas fiscais selecionadas (%d) para envio ultrapassa máximo (50) aceito pelo webservice', [AlistEnviar.Count]));
      end;

      if AlistEPEC.Count > 20 then
        raise Exception.Create(Format('Número de notas fiscais selecionadas (%d) para EPEC ultrapassa máximo (20) aceito pelo webservice', [AlistEPEC.Count]));
      {$ENDREGION}


      {$REGION 'consulta as notas com tentativa de envio em momento anterior, sem numero de recibo, portantanto será usada a chave da nf'}
      //for Anfhw in AlistConsultar do
      for I := AlistConsultar.Count - 1 downto 0 do
      begin
        Anfhw := AlistConsultar.Items[I];
        acbr_nfe_consultar(Anfhw, [docNFe]);
        if Anfhw.sitNFe in [stVazio, stRejeitada] then
        begin
          Anfhw2 := GetNotaFiscal(Anfhw.cod_nf);
          Anfhw2.situacao_nfe := Anfhw.situacao_nfe;

          if (Anfhw2.nfe_tpemis = '4') then
          begin
            if Assigned(Anfhw2.eventoEPEC) then
            begin
              if Anfhw2.eventoEPEC.situacao = sitAutorizada then
                AlistEnviar.Add(Anfhw2)
              else
                AlistEPEC.Add(Anfhw2);
            end
            else
              listError.Add(Format('NF %d numero %d selecionada EPEC(tpemis=4), porém não econtrou o evento no BD', [Anfhw2.cod_nf, Anfhw2.num_nf]))
          end
          else
            AlistEnviar.Add(Anfhw2);

          AlistConsultar.Delete(I);
        end;
      end;
      {$ENDREGION}

      {$REGION 'consulta recibo'}
      for Astr in Arecibos do
      begin

        {$REGION 'alimentando acbr e consultando'}
        Fnfe.NotasFiscais.Clear;
        for Anfhw in AlistRecibos do
          if Anfhw.nfe_recibo.Equals(Astr) then
          begin
            Fnfe.NotasFiscais.Add.LerXML(Anfhw.xml_nfe.Text);
            Fnfe.Configuracoes.Geral.FormaEmissao   := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpEmis;
            Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpAmb;
          end;

        try
          Fnfe.WebServices.Retorno.Recibo := Astr;
          Fnfe.WebServices.Retorno.Executar;
        except on E: Exception do
          begin
            if THwAux.cStatToSituacaoNFeHW(Fnfe.WebServices.Retorno.cStat) = stEmProcessamento then
              listError.Add(Format('Consulta recibo %s Lote  ' +
                            IfThen(Fnfe.WebServices.Retorno.cStat = 103, 'recebido') +
                            IfThen(Fnfe.WebServices.Retorno.cStat = 104, 'processado') +
                            IfThen(Fnfe.WebServices.Retorno.cStat = 105, 'em processamento') + #13 +
                            'Retorno %d - %s '  + #13 + #13 +
                            '%n' ,[Fnfe.WebServices.Retorno.Recibo, Fnfe.WebServices.Retorno.cStat, Fnfe.WebServices.Retorno.xMotivo, e.Message]));
          end;
        end;
        {$ENDREGION}

        for Anfhw in AlistRecibos do
          if Anfhw.nfe_recibo.Equals(Astr) then
          begin

            {$REGION 'dados do lote'}
            if Assigned(Fnfe.WebServices.Retorno) then
            begin
              Anfhw.nfe_cmsg      := Fnfe.WebServices.Retorno.cMsg;
              Anfhw.nfe_xmsg      := Fnfe.WebServices.Retorno.xMsg;
              Anfhw.nfe_cstat     := Fnfe.WebServices.Retorno.cStat;
              Anfhw.descricaoerro := Fnfe.WebServices.Retorno.xMotivo;
              Anfhw.situacao_nfe  := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Anfhw.nfe_cstat));
            end;
            {$ENDREGION}

            {$REGION 'dados do processamento da NFe'}
            for I := 0 to Fnfe.NotasFiscais.Count - 1 do
              if Anfhw.chave_nfe.Equals(Fnfe.NotasFiscais.Items[I].NumID) then
                if Assigned(Fnfe.NotasFiscais.Items[I].NFe.procNFe) then
                  if Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat > 0 then
                  begin
                    Anfhw.data_autorizacao := Fnfe.NotasFiscais.Items[I].NFe.procNFe.dhRecbto;
                    Anfhw.protocolo        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.nProt;
                    Anfhw.digest           := Fnfe.NotasFiscais.Items[I].NFe.procNFe.digVal;
                    Anfhw.nfe_cstat        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat;
                    Anfhw.descricaoerro    := Fnfe.NotasFiscais.Items[I].NFe.procNFe.xMotivo;
                    Anfhw.situacao_nfe     := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Anfhw.nfe_cstat));
                    if Anfhw.sitNFe in [stAutorizada, stDenegada] then
                      Anfhw.xml_nfe.Text   := Fnfe.NotasFiscais.Items[I].XMLOriginal;
                    if (Anfhw.nfe_cstat = 468) and (not Anfhw.nfe_dpec_nregdpec.IsEmpty) then
                      Anfhw.situacao_nfe := sitEmEPEC;

                    RegistradorAlertasDFeUtil.ResolverAlertas(Fnfe.NotasFiscais.Items[I].NFe.procNFe);
                  end;
            {$ENDREGION}

            if Anfhw.sitNFe in [stVazio, stDuplicidade, stRejeitada] then
              Anfhw.nfe_recibo := '';

            Save_retorno_autorizacao(Anfhw);

            if Anfhw.sitNFe in [stVazio, stRejeitada] then
            begin
              Anfhw2 := GetNotaFiscal(Anfhw.cod_nf);
              AlistEnviar.Add(Anfhw2);
            end
            else if (Anfhw.sitNFe in [stAutorizada, stDenegada, stDuplicidade, stCancelada]) and
              (Anfhw.nfe_dpec_nregdpec.Equals('???????????????')) and (Anfhw.nfe_dpec_cstat = 485) then
            begin
              Anfhw2 := GetNotaFiscal(Anfhw.cod_nf);
              AlistEPEC_Dup.Add(Anfhw2);
            end;
          end;
      end;
      {$ENDREGION}

      {$REGION 'enviando lista de notas fiscais'}
      if AlistEnviar.Count > 0 then
      begin
        AstatusServ := IfThen(conf.habStatusServ, 'aconsultar');
        {$REGION 'adicionando notas ao acbr'}
        Alote := 0;
        Fnfe.NotasFiscais.Clear;
        for Anfhw in AlistEnviar do
        begin

          ArespAcbr := True;
          if acbr_add_notafiscal(Anfhw) then
          begin
            IdLast := Fnfe.NotasFiscais.Count - 1;
            Fnfe.Configuracoes.Geral.FormaEmissao   := Fnfe.NotasFiscais.Items[IdLast].NFe.Ide.tpEmis;
            Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[IdLast].NFe.Ide.tpAmb;

            if AstatusServ.Equals('aconsultar') then
            begin
              if not acbr_status_servico('') then
                raise Exception.Create(Format('Falha na consulta de status serviço. %d - %s', [Fnfe.WebServices.StatusServico.cStat, Fnfe.WebServices.StatusServico.xMotivo]))
              else
                AstatusServ := 'emoperacao';
            end;

            {$REGION 'gerar, assinar, validar e salvar dados pre autorizacao'}
            ArespAcbr :=  acbr_gerar_assinar_validar;

            if ArespAcbr then
            begin
              if Alote = 0 then
                Alote := GetCodigo('LOTENFE');

              Anfhw.lote_nfe     := Alote;
              Anfhw.situacao_nfe := sitEnviando;
              Anfhw.chave_nfe    := Fnfe.NotasFiscais.Items[IdLast].NumID;
              Anfhw.xml_nfe.Text := Fnfe.NotasFiscais.Items[IdLast].XMLAssinado;

              ArespAcbr := Save_pre_autorizacao(Anfhw);
            end
            else//registrando a falha
            begin
              Anfhw.situacao_nfe := sitRejeitada;
              Anfhw.hora_envio := '';
              Anfhw.nfe_recibo := '';
              Anfhw.protocolo  := '';
              Anfhw.digest     := '';
              Anfhw.descricaoerro := FlastError;
              Anfhw.nfe_xmsg := '';
              Anfhw.nfe_cmsg := 0;
              Anfhw.nfe_cstat := 0;
              Anfhw.data_autorizacao := 0;
              Anfhw.chave_nfe    := Fnfe.NotasFiscais.Items[IdLast].NumID;
              Anfhw.xml_nfe.Text := Fnfe.NotasFiscais.Items[IdLast].XML;

              Save_retorno_autorizacao(Anfhw);
            end;
            {$ENDREGION}

            if (not ArespAcbr) and (Fnfe.NotasFiscais.Count > 0) then
              Fnfe.NotasFiscais.Delete(Fnfe.NotasFiscais.Count - 1);
          end
          else
            ArespAcbr := False;

          if not ArespAcbr then
          begin
            Anfhw.situacao_nfe  := sitVazio;
            if listError.Count > 0 then
              Anfhw.descricaoerro := listError[listError.Count - 1];
          end;
        end;
        {$ENDREGION}

        {$REGION 'enviando e tratando respostas'}
        if Fnfe.NotasFiscais.Count > 0 then
        begin
          try

            ArespAcbr := Fnfe.Enviar(Alote, False, conf.lote_sinc_1nfe and (Fnfe.NotasFiscais.Count = 1));

          except on E: Exception do
            begin
              listError.Add(Format('Envio WS - Lote %d ' +
                            IfThen(Fnfe.WebServices.Enviar.cStat = 103, 'recebido') +
                            IfThen(Fnfe.WebServices.Enviar.cStat = 104, 'processado') +
                            IfThen(Fnfe.WebServices.Enviar.cStat = 105, 'em processamento'), [Alote]));
              listError.Add(Format('Retorno Lote %d - %s '  + #13 + #13 +
                            '%s' ,[Fnfe.WebServices.Enviar.cStat, Fnfe.WebServices.Enviar.xMotivo, e.Message]));

              try
                for Anfhw in AlistEnviar do
                  for I := 0 to Fnfe.NotasFiscais.Count - 1 do
                    if Anfhw.chave_nfe.Equals(Fnfe.NotasFiscais.Items[I].NumID) then
                    begin
                      Anfhw.descricaoerro := e.Message;
                      Save_erro_na_autorizacao(Anfhw, False);
                      Break;
                    end;
              finally
                if QrAux.Transaction.InTransaction then
                  QrAux.Transaction.Commit();
              end;
            end;
          end;
        end;

        for Anfhw in AlistEnviar do
        begin
          if Anfhw.situacao_nfe.Equals(sitEnviando) then
          begin

            {$REGION 'dados do processamento do lote'}
            Anfhw.nfe_recibo     := Fnfe.WebServices.Enviar.Recibo.Trim;
            Anfhw.nfe_cstat      := Fnfe.WebServices.Enviar.cStat;
            Anfhw.descricaoerro  := Fnfe.WebServices.Enviar.xMotivo;
            Anfhw.datahora_envio := Fnfe.WebServices.Enviar.dhRecbto;
            Anfhw.hora_envio     := FormatDateTime('hh:nn:ss', Fnfe.WebServices.Enviar.dhRecbto);
            if Assigned(Fnfe.WebServices.Retorno) then
            begin
              Anfhw.nfe_cmsg     := Fnfe.WebServices.Retorno.cMsg;
              Anfhw.nfe_xmsg     := Fnfe.WebServices.Retorno.xMsg;
            end;

            if Anfhw.nfe_cstat > 0 then
              Anfhw.situacao_nfe := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Anfhw.nfe_cstat));
            {$ENDREGION}

            {$REGION 'dados do processamento da NFe'}
            for I := 0 to Fnfe.NotasFiscais.Count - 1 do
              if Anfhw.chave_nfe.Equals(Fnfe.NotasFiscais.Items[I].NumID) then
                if Assigned(Fnfe.NotasFiscais.Items[I].NFe.procNFe) then
                  if Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat > 0 then
                  begin
                    Anfhw.data_autorizacao := Fnfe.NotasFiscais.Items[I].NFe.procNFe.dhRecbto;
                    Anfhw.protocolo        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.nProt;
                    Anfhw.digest           := Fnfe.NotasFiscais.Items[I].NFe.procNFe.digVal;
                    Anfhw.nfe_cstat        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat;
                    Anfhw.descricaoerro    := Fnfe.NotasFiscais.Items[I].NFe.procNFe.xMotivo;
                    Anfhw.situacao_nfe     := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Anfhw.nfe_cstat));
                    if Anfhw.sitNFe in [stAutorizada, stDenegada] then
                      Anfhw.xml_nfe.Text := Fnfe.NotasFiscais.Items[I].XMLOriginal;
                    //if THwAux.cStatToSituacaoNFeHW(Anfhw.nfe_cstat) <> stAutorizada then
                    //  listError.Add(Format('%d-%s: %d - %s', [Anfhw.num_nf, Anfhw.situacao_nfe, Anfhw.nfe_cstat, Anfhw.descricaoerro]));

                    RegistradorAlertasDFeUtil.ResolverAlertas(Fnfe.NotasFiscais.Items[I].NFe.procNFe);
                  end;
            {$ENDREGION}

            //caso rejeicao o numero de recibo é limpo para nao consultar da proxima vez
            if Anfhw.sitNFe in [stVazio, stDuplicidade, stRejeitada] then
              Anfhw.nfe_recibo := '';

            Save_retorno_autorizacao(Anfhw);

            {$REGION 'verificando dados do EPEC'}
            if (Anfhw.sitNFe in [stAutorizada, stDenegada, stDuplicidade, stCancelada]) and
              (Anfhw.nfe_dpec_nregdpec.Equals('???????????????')) and (Anfhw.nfe_dpec_cstat = 485) then
            begin
              Anfhw2 := GetNotaFiscal(Anfhw.cod_nf);
              AlistEPEC_Dup.Add(Anfhw2);
            end;
            {$ENDREGION}

            //o que fazer no caso de duplicidade
            //??????????????????????????????????
          end
          else if Anfhw.situacao_nfe.Equals(sitVazio) then
            Limpar_dados_envio(Anfhw);
        end;
        {$ENDREGION}

      end;

      {$ENDREGION}

      {$REGION 'enviando lista de enventos EPEC'}
      if AlistEPEC.Count > 0 then
      begin

        {$REGION 'adicionando notas e eventos ao acbr'}
        Alote := 0;
        Fnfe.NotasFiscais.Clear;
        for Anfhw in AlistEPEC do
        begin
          ArespAcbr := True;
          if acbr_add_evento_epec(Anfhw) then
          begin
            IdLast := Fnfe.NotasFiscais.Count - 1;
            Fnfe.Configuracoes.Geral.FormaEmissao   := Fnfe.NotasFiscais.Items[IdLast].NFe.Ide.tpEmis;
            Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[IdLast].NFe.Ide.tpAmb;

            {$REGION 'gerar, assinar, validar e salvar dados pre envio do evento'}
            ArespAcbr := acbr_gerar_assinar_validar;

            try
              if ArespAcbr then              
                Fnfe.EventoNFe.GerarXML;
            except on E: Exception do
              begin
                FlastError := 'GerarEventoEPEC -> ' + e.Message;
                listError.Add(FlastError);
                ArespAcbr := False;
              end;
            end;
                //Fnfe.EventoNFe.Gerador.ArquivoFormatoXML;
            if ArespAcbr then
            begin
              if Alote = 0 then
                Alote := GetCodigo('LOTE_EPEC');

              Anfhw.situacao_nfe := sitEnviando;
              Anfhw.chave_nfe    := Fnfe.NotasFiscais.Items[IdLast].NumID;
              Anfhw.xml_nfe.Text := Fnfe.NotasFiscais.Items[IdLast].XMLAssinado;

              Anfhw.eventoEPEC.lote_epec         := Alote;
              Anfhw.eventoEPEC.situacao          := Anfhw.situacao_nfe;
              Anfhw.eventoEPEC.xml_nfe_epec.Text := Fnfe.NotasFiscais.Items[IdLast].XMLAssinado;
              Anfhw.eventoEPEC.id_dfe            := THwAux.apenasNumeros(Fnfe.EventoNFe.Evento.Items[IdLast].InfEvento.id);

              ArespAcbr := Save_pre_autorizacao_epec(Anfhw);
            end
            else
            begin
              Anfhw.situacao_nfe := sitRejeitada;
              Anfhw.hora_envio := '';
              Anfhw.nfe_recibo := '';
              Anfhw.protocolo  := '';
              Anfhw.digest     := '';
              Anfhw.descricaoerro := FlastError;
              Anfhw.nfe_xmsg := '';
              Anfhw.nfe_cmsg := 0;
              Anfhw.nfe_cstat := 0;
              Anfhw.data_autorizacao := 0;
              Anfhw.chave_nfe    := Fnfe.NotasFiscais.Items[IdLast].NumID;
              Anfhw.xml_nfe.Text := Fnfe.NotasFiscais.Items[IdLast].XML;

              Save_retorno_autorizacao(Anfhw);
            end;
            {$ENDREGION}

            if (not ArespAcbr) and (Fnfe.NotasFiscais.Count > 0) then
              Fnfe.NotasFiscais.Delete(Fnfe.NotasFiscais.Count - 1);

            if (not ArespAcbr) and (Fnfe.EventoNFe.Evento.Count > 0) then
              Fnfe.EventoNFe.Evento.Delete(Fnfe.EventoNFe.Evento.Count - 1);
          end
          else
            ArespAcbr := False;

          if not ArespAcbr then
          begin
            Anfhw.situacao_nfe  := sitVazio;
            if listError.Count > 0 then
              Anfhw.descricaoerro := listError[listError.Count - 1];
          end;
        end;
        {$ENDREGION}

        {$REGION 'envio do evento'}
        if Fnfe.EventoNFe.Evento.Count > 0 then
        begin
          Fnfe.Configuracoes.WebServices.Visualizar := False;
          try
            ArespAcbr := Fnfe.EnviarEvento(Alote);
          except on E: Exception do
            begin
              listError.Add(Format('Envio Evento WS - Lote %d ' +
                            IfThen(Fnfe.WebServices.EnvEvento.cStat = 128, 'processado'), [Alote]));
              listError.Add(Format('Retorno Lote %d - %s '  + #13 + #13 +
                            '%s' ,[Fnfe.WebServices.EnvEvento.cStat, Fnfe.WebServices.EnvEvento.xMotivo, e.Message]));
            end;
          end;
        end;
        {$ENDREGION}

        for Anfhw in AlistEPEC do
        begin

          {$REGION 'resposta do lote'}
          Anfhw.eventoEPEC.cstat_proc   := Fnfe.WebServices.EnvEvento.cStat;
          Anfhw.eventoEPEC.xmotivo_proc := Fnfe.WebServices.EnvEvento.xMotivo;
          if Anfhw.eventoEPEC.cstat_proc > 0 then
            Anfhw.eventoEPEC.situacao := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoEventoHW(Anfhw.eventoEPEC.cstat_proc));
          {$ENDREGION}

          {$REGION 'respostas dos eventos'}
          for I := 0 to Fnfe.WebServices.EnvEvento.EventoRetorno.retEvento.Count - 1 do
            with Fnfe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[I] do
              if (Anfhw.chave_nfe.Equals(RetInfEvento.chNFe)) and
                 (RetInfEvento.nSeqEvento = Anfhw.eventoEPEC.nseqevento) and
                 (RetInfEvento.tpEvento = teEPECNFe) then
              begin
                Anfhw.eventoEPEC.cstat           := RetInfEvento.cStat.ToString;
                Anfhw.eventoEPEC.xmotivo         := RetInfEvento.xMotivo;
                Anfhw.eventoEPEC.nprot           := RetInfEvento.nProt;
                Anfhw.eventoEPEC.dhevento        := RetInfEvento.dhRegEvento;
                Anfhw.eventoEPEC.xml_evento.Text := RetInfEvento.XML;
                Anfhw.eventoEPEC.situacao        := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoEventoHW(RetInfEvento.cStat));

                if (Anfhw.eventoEPEC.cstat = '136') or //autorizacao
                  (Anfhw.eventoEPEC.cstat = '485') then//duplicidade
                begin
                  Anfhw.nfe_dpec_cstat      := RetInfEvento.cStat;
                  Anfhw.nfe_dpec_xmotivo    := RetInfEvento.xMotivo;
                  Anfhw.nfe_dpec_nregdpec   := IfThen(RetInfEvento.cStat = 136, RetInfEvento.nProt, '???????????????');
                  Anfhw.situacao_nfe        := sitEmEPEC;
                  Anfhw.eventoEPEC.situacao := sitAutorizada;
                end
                else
                begin
                  Anfhw.situacao_nfe        := sitRejeitada;
                  Anfhw.descricaoerro       := Anfhw.eventoEPEC.xmotivo;
                  listError.Add(Format('Evento não Autorizado %s - %s ',[Anfhw.eventoEPEC.cstat, Anfhw.eventoEPEC.xmotivo]));
                end;
              end;
          {$ENDREGION}

          Save_retorno_autorizacao_epec(Anfhw);
        end;
      end;
      {$ENDREGION}

      {$REGION 'consulta do EPEC q antes deu duplicidade 485, agora na consulta os dados retornam'}
      if AlistEPEC_Dup.Count > 0 then
        for I:= 0 to AlistEPEC_Dup.Count - 1 do
        begin
          Anfhw := AlistEPEC_Dup.Items[I];
          Fnfe.EventoNFe.Evento.Clear;
          acbr_nfe_consultar(Anfhw);
        end;
        {$ENDREGION}

    finally
      desconectar;
      if Assigned(AlistEnviar) then
        FreeAndNil(AlistEnviar);
      if Assigned(AlistConsultar) then
        FreeAndNil(AlistConsultar);
      if Assigned(AlistRecibos) then
        FreeAndNil(AlistRecibos);
      if Assigned(AlistEPEC) then
        FreeAndNil(AlistEPEC);
      if Assigned(AlistEPEC_Dup) then
        FreeAndNil(AlistEPEC_Dup);
      if Assigned(Arecibos) then
        FreeAndNil(Arecibos);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_autorizar: ' + e.Message);
      registraErro('THwNFe.nfe_autorizar ' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_consultar(Acod_nf: array of Integer): Boolean;
var
  AlistConsultar, AlistRecibos: TObjectList<TNotafiscal_class_hw>;
  Anfhw, Anfhw2 : TNotafiscal_class_hw;
  I: Integer;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      AlistConsultar := TObjectList<TNotafiscal_class_hw>.Create;
      for I := Low(Acod_nf) to High(Acod_nf) do
      begin
        Anfhw := GetNotaFiscal(Acod_nf[I]);
        if not Assigned(Anfhw) then
          listError.Add(Format('NF %d não carregada do banco', [Acod_nf[I]]))
      else if (not Anfhw.emissao_propria.Equals('S')) or
              (not Anfhw.modelo_nf.Equals('55')) then
        listError.Add(Format('NF %d numero %d. Não é emissão própria ou modelo 55', [Anfhw.cod_nf, Anfhw.num_nf]))
      else if Anfhw.chave_nfe.IsEmpty then
        listError.Add(Format('NF %d numero %d. Sem chave ainda', [Anfhw.cod_nf, Anfhw.num_nf]))
      else
        AlistConsultar.Add(Anfhw);
      end;


      Fnfe := TACBrNFe.Create(nil);

      acbr_configurar;
      Fnfe.Configuracoes.WebServices.Visualizar := True;

      if AlistConsultar.Count = 1 then
      begin
        Anfhw := AlistConsultar.Items[0];
        if (Anfhw.sitNFe in [stEnviando, stEmProcessamento]) and
           (not Anfhw.nfe_recibo.IsEmpty) then
        begin
          acbr_nfe_consultar_recibo(Anfhw);
          Exit;
        end;
      end;

      {$REGION 'consulta as notas com tentativa de envio em momento anterior, sem numero de recibo, portantanto será usada a chave da nf'}
      for I := AlistConsultar.Count - 1 downto 0 do
      begin
        Anfhw := AlistConsultar.Items[I];
        acbr_nfe_consultar(Anfhw, [docNFe]);
      end;
      {$ENDREGION}

    finally
      desconectar;
      if Assigned(AlistConsultar) then
        FreeAndNil(AlistConsultar);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_consultar: ' + e.Message);
      registraErro('THwNFe.nfe_consultar' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_converter_em_contingencia(CodigoNF: Integer): Boolean;
var
  Transaction: ITransaction;
  Nota: TNotafiscal_class_hw;
begin
  Result := False;
  listError.Clear;

  if not conectar(dbName, False) then
    Exit;

  Fnfe := nil;
  Nota := nil;
  Transaction := IBXTransactionLegacy.Create(Self.GetTransaction);
  try try
    //IBXTransactionLegacy(Transaction).OnNeedTransaction := Self.GetTransaction;
    AppSetup.DatabaseConnection.UseTransaction( Transaction );

    ContainerDFe.GetInstance().DFeFeaturesFactory.CreateConverterNFeParaContingenciaUseCase()
      .Executar(CodigoNF, Self.cod_empresa);

    Nota := GetNotaFiscal(CodigoNF);

    Fnfe := TACBrNFe.Create(nil);

    acbr_configurar;

    Nota.situacao_nfe := SituacaoNFeEnumStr[stEmContingenciaRejeitada]; // Apenas para acbr_add_notafiscal criar o objeto com base na Nota e nao no XML
    if acbr_add_notafiscal(Nota)
      and acbr_gerar_assinar_validar() then
    begin
      Nota.situacao_nfe := SituacaoNFeEnumStr[stEmContingencia]; // Voltando para a situacao que tem de ficar
      Nota.chave_nfe    := Fnfe.NotasFiscais.Items[0].NumID;
      Nota.xml_nfe.Text := Fnfe.NotasFiscais.Items[0].XMLAssinado;

      Save_pre_autorizacao(Nota, False);
    end;

    if listError.Count > 0 then
      raise Exception.Create(listError.Text);

    Transaction.Commit();

    Result := True;

  except
    Transaction.Rollback();
    raise;
  end;
  finally
    Fnfe.Free();
    Nota.Free();
    desconectar();
    AppSetup.DatabaseConnection.ReleaseTransaction( Transaction.GetId() );
    Transaction.FreeTransaction();
  end;
end;

function THwCentralNFe.nfe_email(Acod_nf: array of Integer; AemailUnico, AcomEventos, AcomPDF, AcomBol: Boolean; Aemail, Aanexos: string): Boolean;
var
  Anotas: TObjectList<TNotafiscal_class_hw>;
  Alist : TObjectList<TNotafiscal_class_hw>;
  Anota : TNotafiscal_class_hw;
  I     : Integer;
  Amail : THwNFe_mail_aux;
  AaddNF: Boolean;
  entradas, saidas, terceiros: TArray<Integer>;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      Anotas := TObjectList<TNotafiscal_class_hw>.Create;
      Alist  := TObjectList<TNotafiscal_class_hw>.Create;
      entradas := [];
      saidas := [];
      terceiros := [];

      {$REGION 'validando e configurando'}
      if AemailUnico and Aemail.Trim.IsEmpty then
        raise Exception.Create('Email não informado');
      for I:= Low(Acod_nf) to High(Acod_nf) do
      begin
        AaddNF := False;
        Anota := GetNotaFiscal(Acod_nf[I]);
        if AcomBol and Assigned(Anota) and Anota.natureza_nf.Equals('S') then
          GetNotaFiscal_dup_html_bol(Anota);

        if not Assigned(Anota) then
          listError.Add(Format('NF %d não carregada do banco', [Acod_nf[I]]))
        else if (Anota.sitNFe in [stEnviando, stEmEPEC]) and (not Anota.nfe_dpec_nregdpec.IsEmpty) then
          AaddNF := True
        //else if Anota.emissao_propria.Equals('S') and (not Anota.status.Equals(stsFechada)) then
          //listError.Add(Format('NF %d numero %d de "Entrada" não pode ser enviada email. Status: %s', [Anota.cod_nf, Anota.num_nf, Anota.status]))
        else if Anota.emissao_propria.Equals('S') and (not (Anota.sitNFe in [stAutorizada, stDenegada, stCancelada, stInutilizada])) then
          listError.Add(Format('NF %d numero %d E/S "%s" não pode ser enviada email. Situação: %s', [Anota.cod_nf, Anota.num_nf, Anota.natureza_nf, Anota.situacao_nfe]))
        else if Anota.natureza_nf.Equals('E') and (not Anota.status.Equals(stsFechada)) then
          listError.Add(Format('NF %d numero %d de "Entrada" não pode ser enviada email. Status: %s', [Anota.cod_nf, Anota.num_nf, Anota.status]))
        else
          AaddNF := True;

        if AaddNF then
        begin
          if Anota.natureza_nf.Equals('E') then
            if (Length(saidas) > 0) then
            begin
              listError.Add(Format('NF %d numero %d de "Entrada" não pode ser enviada email. Email de notas de "Saída"', [Anota.cod_nf, Anota.num_nf]));
              AaddNF := False;
            end
            else
              entradas := entradas + [Anota.cod_nf];

            if not Anota.emissao_propria.Equals('S') then
              terceiros := terceiros + [Anota.cod_nf];

          if Anota.natureza_nf.Equals('S') then
            if (Length(entradas) > 0) then
            begin
              listError.Add(Format('NF %d numero %d de "Saída" não pode ser enviada email. Email de notas de "Entrada"', [Anota.cod_nf, Anota.num_nf]));
              AaddNF := False;
            end
            else if Anota.natureza_nf.Equals('S') then
              saidas := saidas + [Anota.cod_nf];
        end;

        if not AemailUnico then
          if AaddNF and Anota.dest_email.IsEmpty then
          begin
            listError.Add(Format('Email não encontrado para NF %d numero %d', [Anota.cod_nf, Anota.num_nf]));
            AaddNF := False;
          end;

        if AaddNF then
        begin
          if not AemailUnico then
            Anota.dest_email := StrDefault(queryCons.Table('clientes', 'email')
              .Equals('cod_cliente', Anota.cod_cliente)
              .Equals('cod_empresa', Anota.cod_empresa)
              .Scalar.AsString, Anota.dest_email);

          Anotas.Add(Anota);
        end;
      end;
      {$ENDREGION}


      {$REGION 'montado e enviando'}

      if Anotas.Count = 0 then
      begin
        Result := False;
        listError.Add('Nenhuma nota para enviar');
        Exit;
      end;

      if not Assigned(emp) then
        emp := GetEmpresa_nfe;

      var textEmail    := IfThen(Length(entradas) = 0, emp.mensagem_nfe.Text);
      var assuntoEmail := emp.assunto_nfe.Replace('XXXXXXXXXXXXXXXX', emp.nome_emp, [rfReplaceAll]);

      assuntoEmail := IfThen(Length(entradas) > 0, 'Notas Fiscais de Entrada ' + emp.nome_emp, assuntoEmail);

      Amail               := THwNFe_mail_aux.create(docNFe, Aemail, Aanexos);
      Amail.comEventos    := AcomEventos;
      Amail.comPDF        := AcomPDF and (Length(terceiros) = 0);
      Amail.Assunto       := assuntoEmail;//emp.assunto_nfe.Replace('XXXXXXXXXXXXXXXX', emp.nome_emp, [rfReplaceAll]);
      Amail.Mensagem.Text := textEmail;//emp.mensagem_nfe.Text;
      Amail.docs.notas    := Anotas;
      Amail.emailUnico    := AemailUnico;
      Amail.comBol        := AcomBol;

      with TConfig_sistema_class.getConf('emp_unico_anexo_por_email', Self.QrAux, cod_empresa) do
      begin
        Amail.sepBoletos.ativo   := ReadString('Conf_Boletos_NF', 'Ativo') = 'S';
        Amail.sepBoletos.assunto := ReadString('Conf_Boletos_NF', 'AssuntoEmail')
                                     .Replace('[@empresa]', IfThen(emp.fantasia_emp.Trim.IsEmpty, emp.nome_emp, emp.fantasia_emp));
        Amail.sepBoletos.corpo   := ReadString('Conf_Boletos_NF', 'CorpoEmail')
                                     .Replace('[@empresa]', IfThen(emp.fantasia_emp.Trim.IsEmpty, emp.nome_emp, emp.fantasia_emp))
                                     .Replace(';', sLineBreak);
      end;

      Result := acbr_def_send_mail(Amail);
      {$ENDREGION}

    finally
      desconectar;
      if Assigned(Anotas) then
        FreeAndNil(Anotas);
      if Assigned(Alist) then
        FreeAndNil(Alist);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_email: ' + e.Message);
      registraErro('THwCentralNFe.nfe_email' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_evento_email(Acod_nf, Alote: Integer; Aemail, Aanexos: string): Boolean;
var
  Anota       : TNotafiscal_class_hw;
  Aevento     : TNotafiscal_carta_correcao_class_hw;
  I           : Integer;
  Amail       : THwNFe_mail_aux;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      {$REGION 'validando e configurando'}
      Anota := GetNotaFiscal(Acod_nf);
      Aevento := nil;
      if not Assigned(Anota) then
        raise Exception.Create(Format('Nota fical codigo %d não carregada do banco', [Acod_nf]));

      if Assigned(Anota.eventoCanc) then
        if Anota.eventoCanc.idlote = Alote then
          Aevento := Anota.eventoCanc;

      if not Assigned(Aevento) then
        if Assigned(Anota.eventosCCe) then
          for I := 0 to Anota.eventosCCe.Count - 1 do
            if Anota.eventosCCe.Items[I].idlote = Alote then
            begin
              Aevento := Anota.eventosCCe.Items[I];
              Break;
            end;
      if not Assigned(Aevento) then
        raise Exception.Create(Format('Evento lote %d da Nota fical codigo %d e numero %d não localizado', [Alote, Anota.cod_nf, Anota.num_nf]))
      else if Aevento.situacao <> sitAutorizada then
        raise Exception.Create(Format('Evento lote %d da Nota fical codigo %d e numero %d não Autorizado. Situação: %s', [Alote, Anota.cod_nf, Anota.num_nf, Aevento.situacao]))
      else if Anota.xml_nfe.Text.Trim.IsEmpty then
        raise Exception.Create(Format('Nota fical codigo %d e numero %d sem xml para obter os dados', [Anota.cod_nf, Anota.num_nf]))
      else if Aevento.xml_evento.Text.Trim.IsEmpty then
        raise Exception.Create(Format('Evento lote %d da Nota fical codigo %d e numero %d sem xml para obter os dados', [Alote, Anota.cod_nf, Anota.num_nf]));
      {$ENDREGION}

      {$REGION 'montado e enviando'}
      if not Assigned(emp) then
        emp := GetEmpresa_nfe;

      if Aemail.Trim.IsEmpty then
        Aemail := Anota.dest_email;
      Amail := THwNFe_mail_aux.create(THwAux.strEventoToDocumentoNFeHW(Aevento.tipo_evento), Aemail, Aanexos);
      Amail.Assunto := Format('Evento %s registrado%s vinculado a NFe %s emitido por %s', [
                              THwAux.strEventoToDescEvento(Aevento.tipo_evento),
                              IfThen(Aevento.tipo_evento.Equals(strEventoEPEC), ', mas não', ' e '),
                              Anota.chave_nfe, emp.nome_emp]);
      Amail.Mensagem.Add(Amail.Assunto);
      Amail.Mensagem.Add(Format('Data: %s no valor de %f', [FormatDateTime('DD/MM/YYYY', Anota.data_contabil), Anota.valor_total]));
      Amail.docs.nfEvento := Anota;
      Amail.docs.evento   := Aevento;

      Result := acbr_def_send_mail(Amail);
      {$ENDREGION}

    finally
      desconectar;
      if Assigned(Anota) then
        FreeAndNil(Anota);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_evento_email: ' + e.Message);
      registraErro('THwCentralNFe.nfe_evento_email' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_evento_enviar(Acod_nf, Alote: Integer): Boolean;
var
  Anfhw  : TNotafiscal_class_hw;
  Aevento: TNotafiscal_carta_correcao_class_hw;
  Aok    : Boolean;
  Axml   : string;
  I      : Integer;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;
    try
      Anfhw := GetNotaFiscal(Acod_nf);

      {$REGION 'validacoes da NF e eventos'}
      if not Assigned(Anfhw) then
        raise Exception.Create(Format('Nota fical codigo: %d não carregada do banco', [Acod_nf]));

      if Assigned(Anfhw.eventoCanc) then
        if Anfhw.eventoCanc.idlote = Alote then
          Aevento := Anfhw.eventoCanc;

      if (Assigned(Anfhw.eventosCCe)) and (not Assigned(Aevento)) then
        for I := 0 to Anfhw.eventosCCe.Count - 1 do
          if Anfhw.eventosCCe.Items[I].idlote = Alote then
          begin
            Aevento := Anfhw.eventosCCe.Items[I];
            Break;
          end;

      if not Assigned(Aevento) then
        raise Exception.Create(Format('Nota fical codigo %d numero %d sem evento no banco', [Anfhw.cod_nf, Anfhw.num_nf]));

      if Aevento.situacao = sitAutorizada then
        raise Exception.Create(Format('Evento lote %d Nota fical codigo %d numero %d já Autorizado', [Alote, Anfhw.cod_nf, Anfhw.num_nf]));
      {$ENDREGION}

      Fnfe := TACBrNFe.Create(nil);

      acbr_configurar;

      {$REGION 'leitura do evento e envio'}
      Fnfe.NotasFiscais.Clear;
      Fnfe.EventoNFe.Evento.Clear;

      if not acbr_add_notafiscal(Anfhw) then
        Exit;

      if Aevento.tipo_evento = strEventoCCe then
        Fnfe.Configuracoes.Geral.FormaEmissao := TpcnTipoEmissao.teNormal
      else
        Fnfe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(AOk, IfThen(emp.nfe_danfe_foremiss.Equals('SVC'), '6', '1'));

      Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpAmb;

      with Fnfe.EventoNFe.Evento.Add do
      begin
        //notas autorizadas no svc pode ser cancelado no svc, talvez tentar nos 2 caso o normal nao de certo
        InfEvento.cOrgao := ExtrairUFChaveAcesso(Anfhw.chave_nfe);
        InfEvento.tpAmb  := Fnfe.NotasFiscais[0].NFe.Ide.tpAmb;
        InfEvento.CNPJ   := Fnfe.NotasFiscais[0].NFe.Emit.CNPJCPF;
        InfEvento.chNFe  := Anfhw.chave_nfe;
        InfEvento.dhEvento := Now + EncodeTime(0, 3, 0, 0);
        InfEvento.tpEvento := StrToTpEventoNFe(Aok, IfThen(Aevento.tipo_evento = strEventoCCe, strCodEventoCCe) +
                                                 IfThen(Aevento.tipo_evento = strEventoCan, strCodEventoCan));

        InfEvento.nSeqEvento := Aevento.nseqevento;
        InfEvento.detEvento.descEvento := IfThen(Aevento.tipo_evento = strEventoCCe, strDescEventoCCe) +
                                          IfThen(Aevento.tipo_evento = strEventoCan, strDescEventoCan);
        if Aevento.tipo_evento = strEventoCCe then
          InfEvento.detEvento.xCorrecao  := Aevento.xcorrecao.Text.Substring(0, 1000)
        else if Aevento.tipo_evento = strEventoCan then
        begin
          InfEvento.detEvento.nProt := Anfhw.protocolo.Substring(0, 17);
          InfEvento.detEvento.xJust := Aevento.xcorrecao.Text.Substring(0, 255);
        end;
      end;
      {$ENDREGION}

      {$REGION 'gerar xml e salvar no banco'}
      try
        Fnfe.EventoNFe.GerarXML;

        //Axml := Fnfe.EventoNFe.Gerador.ArquivoFormatoXML;
        Axml := Fnfe.EventoNFe.XmlEnvio;
        if (Pos('<evento ', Axml) > 0) and (Pos('</evento>', Axml) > 0) then
        begin
          Axml := Copy(Axml, Pos('<evento ', Axml), Axml.Length);
          Axml := Copy(Axml, 1, Pos('</evento>', Axml) + 8);
        end;
        Aevento.xml_nfe_epec.Text := Axml;
        Aevento.id_dfe            := THwAux.apenasNumeros(Fnfe.EventoNFe.Evento.Items[0].InfEvento.id);
        Save_retorno_evento(Aevento);
      except on E: Exception do
        raise Exception.Create('GerarEvento -> ' + e.Message);
      end;
      {$ENDREGION}

      {$REGION 'enviar e tratar retorno'}
      try
        Aok := Fnfe.EnviarEvento(Aevento.idlote);
      except on E: Exception do
        begin
          listError.Add(Format('Envio Evento WS - Lote %d ' +
                        IfThen(Fnfe.WebServices.EnvEvento.cStat = 128, 'processado'), [Alote]));
          listError.Add(Format('Retorno Lote %d - %s '  + #13 + #13 +
                        '%s' ,[Fnfe.WebServices.EnvEvento.cStat, Fnfe.WebServices.EnvEvento.xMotivo, e.Message]));
        end;
      end;

      {$REGION 'resposta do lote'}
      Aevento.cstat_proc   := Fnfe.WebServices.EnvEvento.cStat;
      Aevento.xmotivo_proc := Fnfe.WebServices.EnvEvento.xMotivo;
      if Aevento.cstat_proc > 0 then
        Aevento.situacao := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoEventoHW(Aevento.cstat_proc));
      {$ENDREGION}

      {$REGION 'retorno do evento'}
      for I := 0 to Fnfe.WebServices.EnvEvento.EventoRetorno.retEvento.Count - 1 do
        with Fnfe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[I] do
          if (Anfhw.chave_nfe.Equals(RetInfEvento.chNFe)) and
             (RetInfEvento.nSeqEvento = Aevento.nseqevento) and
             (RetInfEvento.tpEvento in [teCCe, teCancelamento]) then
          begin
            Aevento.cstat           := RetInfEvento.cStat.ToString;
            Aevento.xmotivo         := RetInfEvento.xMotivo;
            Aevento.nprot           := RetInfEvento.nProt;
            Aevento.dhevento        := RetInfEvento.dhRegEvento;
            Aevento.xml_evento.Text := RetInfEvento.XML;
            Aevento.situacao        := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoEventoHW(RetInfEvento.cStat));

            if (Aevento.situacao = sitAutorizada) and
              (RetInfEvento.tpEvento = teCancelamento) then
            begin
              Anfhw.situacao_nfe      := sitCancelada;
              Anfhw.just_cancelamento := Aevento.xcorrecao.Text.Substring(0, 60);
              Save_retorno_cancelamento(Anfhw, False);
            end;
            Save_retorno_evento(Aevento);

            if (RetInfEvento.cStat = 573) or// duplicidade ou
              (RetInfEvento.cStat = 580) then //nota ja cancelada
              acbr_nfe_consultar(Anfhw, [docEventoCCe, docEventoCan]);
          end;
      {$ENDREGION}

      {$ENDREGION}

    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
      desconectar;
      if Assigned(Anfhw) then
        FreeAndNil(Anfhw);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_enviar_evento: ' + e.Message);
      registraErro('THwNFe.nfe_enviar_evento ' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_imprimir(Acod_nf: array of Integer;
  Aprint, AsavePDF: Boolean; ApathPDF: string;
  tipoDANFe: string): Boolean;
var
  AlistPrint: TObjectList<TNotafiscal_class_hw>;
  Anota     : TNotafiscal_class_hw;
  I, J      : Integer;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    AlistPrint := TObjectList<TNotafiscal_class_hw>.Create;
    try

      for I := Low(Acod_nf) to High(Acod_nf) do
      begin
        Anota := GetNotaFiscal(Acod_nf[I]);
        if not Assigned(Anota) then
          listError.Add(Format('NF %d não carregada do banco', [Acod_nf[I]]))
        else if (Anota.sitNFe in [stEnviando, stEmEPEC]) and (not Anota.nfe_dpec_nregdpec.IsEmpty) then
          AlistPrint.Add(Anota)
        else if not (Anota.sitNFe in [stAutorizada, stDenegada, stCancelada, stInutilizada]) then
          listError.Add(Format('NF %d numero %d não pode ser impressa. Situação: %s', [Anota.cod_nf, Anota.num_nf, Anota.situacao_nfe]))
        else
          AlistPrint.Add(Anota);
      end;

      Fnfe       := TACBrNFe.Create(nil);
      Fdanfe     := TACBrNFeDANFeRL.Create(Fnfe);
      Fnfe.DANFE := Fdanfe;

      acbr_configurar;

      if tipoDANFe.ToLower.Contains('retrato') then
        Fdanfe.TipoDANFE := tiRetrato
      else if tipoDANFe.ToLower.Contains('paisagem') then
        Fdanfe.TipoDANFE := tiPaisagem
      else if tipoDANFe.ToLower.Contains('simplificado') then
        Fdanfe.TipoDANFE := tiSimplificado;

      Fnfe.NotasFiscais.Clear;

      for Anota in AlistPrint do
      begin
        if not acbr_add_notafiscal(Anota) then
          listError.Add(Format('NF %d numero %d não pode ser impressa. XML não carregado', [Anota.cod_nf, Anota.num_nf]))
        else
        begin
          if conf.danfe.ImprimirCancelamentoNoDANFE then
            if Assigned(Anota.eventoCanc) then
              if Anota.eventoCanc.situacao = sitAutorizada then
                Fnfe.NotasFiscais.Items[Fnfe.NotasFiscais.Count - 1].NFe.procNFe.cStat := 155;
          if (Anota.sitNFe in [stEnviando, stEmEPEC]) and (not Anota.nfe_dpec_nregdpec.IsEmpty) then
            if not Assigned(Anota.eventoEPEC) then
              Fnfe.DANFE.Protocolo := Anota.nfe_dpec_nregdpec
            else
              Fnfe.DANFE.Protocolo := Anota.nfe_dpec_nregdpec + ' ' + FormatDateTime('DD/MM/YYYY hh:nn:ss', Anota.eventoEPEC.dhevento)
        end;
      end;

      for I := 0 to Pred(Fnfe.NotasFiscais.Count) do with Fnfe.NotasFiscais.Items[I].NFe do
      begin
        if Self.conf.danfe.ImprimirIpiDevolEmCampoIPI then
        begin
          for J := 0 to Pred(Det.Count) do
          begin
            if Det.Items[J].vIPIDevol > 0 then
            begin
              Det.Items[J].Imposto.IPI.vIPI := Det.Items[J].vIPIDevol;
              Det.Items[J].Imposto.IPI.pIPI := 0;
            end;
            var tmpInfAd := THelperDFe.GetInfAdicionalProdCombustiveis(Det.Items[J]);
            if Length(tmpInfAd) > 0 then
              Det.Items[J].infAdProd := Det.Items[J].infAdProd + IfThen(not Det.Items[J].infAdProd.Trim.IsEmpty, ';') + String.Join(';', tmpInfAd);
          end;
          if Total.ICMSTot.vIPIDevol > 0 then
            Total.ICMSTot.vIPI := Total.ICMSTot.vIPIDevol;
        end;

        InfAdic.infAdFisco := ReverterFiltroTextoXML(InfAdic.infAdFisco);
        InfAdic.infCpl     := ReverterFiltroTextoXML(InfAdic.infCpl);

        var tmpDadosCmpl := THelperDFe.GetInfComplementarCombustiveis(Fnfe.NotasFiscais.Items[I].NFe);
        if Length(tmpDadosCmpl) > 0 then
          InfAdic.infCpl := InfAdic.infCpl + IfThen(not InfAdic.infCpl.Trim.IsEmpty, ';') + String.Join(';', tmpDadosCmpl);

        if conf.danfe.RemoverLineBreak then
        begin
          InfAdic.infAdFisco := InfAdic.infAdFisco.Replace(';', '.', [rfReplaceAll]);
          InfAdic.infCpl := InfAdic.infCpl.Replace(';', '.', [rfReplaceAll]);
        end;
      end;

      if Aprint then
        Fnfe.NotasFiscais.Imprimir;

      if AsavePDF then
      begin
        if not ApathPDF.IsEmpty then
          if not DirectoryExists(ApathPDF) then
            ApathPDF := Fnfe.DANFE.PathPDF;

        if not ApathPDF.IsEmpty then
          if not DirectoryExists(ApathPDF) then
            ApathPDF := ExtractFilePath(ParamStr(0));

        Fnfe.DANFE.PathPDF := ApathPDF;
        Fnfe.NotasFiscais.ImprimirPDF;
      end;

    finally
      desconectar;
      if Assigned(AlistPrint) then
        FreeAndNil(AlistPrint);
      if Assigned(Fdanfe) then
        FreeAndNil(Fdanfe);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_imprimir: ' + e.Message);
      registraErro('THwCentralNFe.nfe_imprimir ' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_inutilizacao_imprimir(Aseqid: Integer; Aprint, AsavePDF: Boolean; ApathPDF: string): Boolean;
var
  Ainut   : TNotafiscal_inut_class_hw;
  I       : Integer;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      Ainut := GetInutilizacao(Aseqid);

      if not Assigned(Ainut) then
        raise Exception.Create(Format('Inutilização codigo %d não carregada do banco', [Aseqid]));

      if not ((Ainut.cstat = 102) or (Ainut.cstat = 563)) then
        raise Exception.Create(Format('Inutilização codigo %d não homologado ' + #13 +
                                      'Modelo: %s' + #13 +
                                      'Serie: %d' + #13 +
                                      'Num Inicial: %d' + #13 +
                                      'Num Final: %d' + #13 +
                                      'Protocolo: %s' + #13 +
                                      'Retorno WS: %d - %s',
                                      [Aseqid, Ainut.modelo, Ainut.serie, Ainut.nnfini, Ainut.nnffin, Ainut.nprot, Ainut.cstat, Ainut.xmotivo]));

      Fnfe       := TACBrNFe.Create(nil);
      Fdanfe     := TACBrNFeDANFeRL.Create(Fnfe);
      Fnfe.DANFE := Fdanfe;

      acbr_configurar;

      Fnfe.InutNFe.LerXMLFromString(Ainut.xml_inut.Text);

      if Aprint then
        Fnfe.ImprimirInutilizacao;

      if AsavePDF then
      begin
        if not ApathPDF.IsEmpty then
          if not DirectoryExists(ApathPDF) then
            ApathPDF := Fnfe.DANFE.PathPDF;

        if not ApathPDF.IsEmpty then
          if not DirectoryExists(ApathPDF) then
            ApathPDF := ExtractFilePath(ParamStr(0));

        Fnfe.DANFE.PathPDF := ApathPDF;
        Fnfe.ImprimirInutilizacaoPDF;
      end;

    finally
      desconectar;
      if Assigned(Ainut) then
        FreeAndNil(Ainut);
      if Assigned(Fdanfe) then
        FreeAndNil(Fdanfe);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_inutilizacao_imprimir: ' + e.Message);
      registraErro('THwCentralNFe.nfe_inutilizacao_imprimir ' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_resolver_pendencia_sefaz(CodigoNF: Integer): Boolean;
var
  Pendencia: NotaFiscalPendenciaSefEtd;
  NotaContingencia, NotaPendente: TNotafiscal_class_hw;
  XMLOriginal: string;
  ConsultaNFe: TNFeConsulta;
  Transaction: ITransaction;
begin
  Result := False;
  listError.Clear;

  if not conectar(dbName, False) then
    Exit;

  NotaPendente     := nil;
  NotaContingencia := nil;

  Fnfe        := TACBrNFe.Create(nil);
  Transaction := IBXTransactionLegacy.Create(Self.GetTransaction);

  try try
    AppSetup.DatabaseConnection.UseTransaction(Transaction);

    // Obtém os dados da pendência e da NFe em contingência
    Pendencia := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateObterPendenciaNFeSefazUseCase().Executar(CodigoNF, Self.cod_empresa);
    if not Assigned(Pendencia) then
      raise Exception.Create('Pendência de SEFAZ não encontrada para a NFe de código ' + CodigoNF.ToString());

    NotaContingencia := GetNotaFiscal(CodigoNF);
    if not Assigned(NotaContingencia) then
      raise Exception.Create('NFe em contingência não encontrada no banco de dados com o código ' + CodigoNF.ToString());

    NotaPendente := GetNotaFiscal(Pendencia.CodNfPend);
    if NotaPendente = nil then
      raise Exception.Create('NFe com Pendencia na SEFAZ não encontrada no banco de dados com o código ' + Pendencia.CodNfPend.ToString());

    // VALIDACAO, SE TUDO OK
    if (Pendencia.StatusResolucao in [srsResolvida, srsResolvidaManual])
      and (NotaContingencia.sitNFe in SituacoesNFeFinalizadas)
      and (NotaPendente.sitNFe in SituacoesNFeFinalizadas) then
    begin
      Result := True;
      Exit;
    end;

    // Situação incompatível - TEM DE COLOCAR UM PROCESSO PARA ESSA TENTATIVA DE INUTILIZACAO
    if not (NotaContingencia.sitNFe in SituacoesNFeFinalizadas + [stEmContingencia, stEmContingenciaRejeitada]) then
      raise Exception.Create('Situação da NFe incompativel para resolução de pendências na SEFAZ');

    acbr_configurar;
    Fnfe.OnGerarLog := nil;

    // CONSULTA SITUACAO NOTA ORIGINAL QUE AINDA NAO FOI CONSULTADA NA SEFAZ
    if (NotaPendente.sitNFe = stAInutilizar) then
    begin
      // A nota Pendente so pode sair de AInutilizar para uma Situacao Finalizada
      ConsultarNFePendente(NotaPendente);

      if not (NotaPendente.sitNFe in (SituacoesNFeFinalizadas + [stAInutilizar] )) then// and not (SituacaoDaNFe = stAInutilizar) then
      begin
        NotaPendente.situacao_nfe := SituacaoNFeEnumStr[stAInutilizar];
        Save_situacao(NotaPendente, False);
      end;

      FreeAndNil(Pendencia);
      Pendencia := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateAvancarPendenciaSefazUseCase()
        .Executar(AvancarPendenciaSefazInput.Create(
          NotaContingencia.cod_nf,
          NotaPendente.cod_nf,
          NotaContingencia.cod_empresa,
          NotaPendente.sitNFe,
          NotaContingencia.sitNFe
        ));

      Transaction.Commit();

      if NotaPendente.sitNFe = stAutorizada then
      begin
        FreeAndNil(NotaPendente);
        NotaPendente := GetNotaFiscal(Pendencia.CodNfPend);
      end;
    end;

    // AUTORIZAR A NOTA EM CONTINGENCIA
    if NotaContingencia.sitNFe in [stEmContingencia, stEmContingenciaRejeitada] then
    begin
      ProcessarAutorizacaoContingencia(NotaContingencia);

      // A nota em contingencia so pode sair de Contingencia para uma Situacao Finalizada
      case NotaContingencia.sitNFe of
        stRejeitada:
          begin
            NotaContingencia.situacao_nfe := SituacaoNFeEnumStr[stEmContingenciaRejeitada];
            Save_rejeicao(NotaContingencia, True);
            Transaction.Commit();

            raise Exception.CreateFmt(
              'NFe em contingência rejeitada: %d - %s', [ NotaContingencia.nfe_cstat, NotaContingencia.descricaoerro]
            );
          end;

        stAutorizada, stCancelada, stDenegada, stInutilizada: ;
        stEmContingencia, stEmContingenciaRejeitada: ;

        else
        begin
          NotaContingencia.situacao_nfe := SituacaoNFeEnumStr[stEmContingencia];
          Save_situacao(NotaContingencia, False);
        end;
      end;

      Transaction.Commit();
    end;

    if not (NotaContingencia.sitNFe in SituacoesNFeFinalizadas) then
      raise Exception.Create(
        'NFe em contingência precisa estar "Autorizara", "Cancelada", "Inutilizada" ou "Denegada" para continuar.'
      );

    // RESOLUCAO NOTA PENDENTE ORIGINAL
    case NotaPendente.sitNFe of

      stDenegada, stCancelada: ;// Nada a fazer

      stAInutilizar: // Inutilizar numero
        EnviarInutilizacaoPendencia(NotaPendente);

      stAutorizada: // Precisa cancelar por substituição
        EnviarCancelamentoSubstituicao(NotaPendente, NotaContingencia);

      else
        raise Exception.CreateFmt(
          'NFe original pendente de resolução, situação atual: "%s".', [SituacaoNFeEnumStr[NotaPendente.sitNFe]]
        );
    end;

    FreeAndNil(Pendencia);
    Pendencia := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateAvancarPendenciaSefazUseCase()
      .Executar(AvancarPendenciaSefazInput.Create(
        NotaContingencia.cod_nf,
        NotaPendente.cod_nf,
        NotaContingencia.cod_empresa,
        NotaPendente.sitNFe,
        NotaContingencia.sitNFe
      ));

    Transaction.Commit();

    if not (NotaContingencia.sitNFe in SituacoesNFeFinalizadas) then
      listError.Add(
        Format('NFe em Contingência não pode ser resolvida, situação atual: "%s".', [NotaContingencia.situacao_nfe])
      );

    if not (NotaPendente.sitNFe in SituacoesNFeFinalizadas) then
      listError.Add(
        Format('NFe Pendente não pode ser resolvida, situação atual: "%s".', [NotaPendente.situacao_nfe])
      );

    if listError.Count > 0 then
      raise Exception.Create(listError.Text);

    Result := True;

  except
    Transaction.Rollback();
    raise;
  end;
  finally
    FreeAndNil(Fnfe);
    NotaContingencia.Free();
    NotaPendente.Free();
    Pendencia.Free();
  end;
end;

procedure THwCentralNFe.ProcessarAutorizacaoContingencia(Nota: TNotafiscal_class_hw);
var
  ArespAcbr: Boolean;
  I: Integer;
  Situacao: SituacaoNFeHW;
begin
  case Self.ConsultaSituacaoNFe(Nota) of
    stVazio:
      raise Exception.Create('Consulta NFe em Contingência sem código de resposta da SEFAZ');

    stEmProcessamento:
      raise Exception.Create('Consulta NFe em Contingência "Em Processamento" na SEFAZ, é necessário aguardar');

    stInutilizada, stRejeitada: ; // Inutilizada não é retornada na consulta, Rejeitada/Nao consta deve prosseguir

    stAutorizada, stCancelada, stDenegada:
      begin
        ProcurarAtribuirProcNFe(Nota, False);
        Exit;
      end

    else
      raise Exception.Create('Consulta NFe em Contingência retornou um código não mapeado');
  end;

  Fnfe.NotasFiscais.Clear;

  case Nota.sitNFe of
    stEmContingencia:
      Fnfe.NotasFiscais.LoadFromString(Nota.xml_nfe.Text);

    stEmContingenciaRejeitada:
      begin
        if not acbr_add_notafiscal(Nota) then
          raise Exception.Create('Falha ao adicionar NFe em Contingecia ao componente.');

        if not acbr_gerar_assinar_validar then
          raise Exception.Create('Falha ao gerar, assinar ou validar a NFe em Contingecia.');

        if Nota.lote_nfe = 0 then
          Nota.lote_nfe := GetCodigo('LOTENFE');
        //Nota.situacao_nfe := sitEnviando; // NAO, só vai para Autorizada ou Contigencia Rejeitada

        Nota.situacao_nfe := SituacaoNFeEnumStr[stEmContingencia];
        Nota.chave_nfe    := Fnfe.NotasFiscais.Items[0].NumID;
        Nota.xml_nfe.Text := Fnfe.NotasFiscais.Items[0].XMLAssinado;

        Save_pre_autorizacao(Nota, True); // Commit aqui
      end;

    else
      raise Exception.Create('NF não está com situação "Contingencia" ou "Contengencia Rejeitada"');
  end;

  Fnfe.Configuracoes.Geral.FormaEmissao   := TACBrTipoEmissao.teNormal;
  Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpAmb;

  Fnfe.OnGerarLog := NFeGerarLog;
  try try
    Fnfe.Enviar(Nota.lote_nfe.ToString(), False, True);
  except
    on E: Exception do
    begin
      Nota.descricaoerro := E.Message;

      Save_erro_na_autorizacao(Nota, True); // Commit aqui pelo erro

      raise Exception.Create('Falha de comunicação no envio: ' + E.Message);
    end;
  end;
  finally
    Fnfe.OnGerarLog := nil;
  end;

  Situacao          := THwAux.cStatToSituacaoNFeHW(Fnfe.WebServices.Enviar.cStat);
  Nota.nfe_cstat    := Fnfe.WebServices.Enviar.cStat;
  Nota.situacao_nfe := SituacaoNFeEnumStr[Situacao];

  if Situacao = stRejeitada then
    Nota.descricaoerro := Fnfe.WebServices.Enviar.xMotivo

  else if Situacao in SituacoesNFeFinalizadas then
    ProcurarAtribuirProcNFe(Nota, False);
end;

procedure THwCentralNFe.ProcurarAtribuirProcNFe(Nota: TNotafiscal_class_hw; ACommit: Boolean);
var
  I: Integer;
begin
  for I := 0 to Fnfe.NotasFiscais.Count - 1 do
  begin
    if Nota.chave_nfe.Equals(Fnfe.NotasFiscais.Items[I].NumID)
      and Assigned(Fnfe.NotasFiscais.Items[I].NFe.procNFe)
      and (Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat > 0) then
    begin
      Nota.data_autorizacao := Fnfe.NotasFiscais.Items[I].NFe.procNFe.dhRecbto;
      Nota.protocolo        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.nProt;
      Nota.digest           := Fnfe.NotasFiscais.Items[I].NFe.procNFe.digVal;
      Nota.nfe_cstat        := Fnfe.NotasFiscais.Items[I].NFe.procNFe.cStat;
      Nota.descricaoerro    := Fnfe.NotasFiscais.Items[I].NFe.procNFe.xMotivo;
      Nota.xml_nfe.Text     := Fnfe.NotasFiscais.Items[I].XMLOriginal;
      Nota.situacao_nfe     := THwAux.SituacaoNFeToStr(THwAux.cStatToSituacaoNFeHW(Nota.nfe_cstat));

      if Fnfe.NotasFiscais.Items[I].Cancelada then
      begin
        Nota.situacao_nfe := SituacaoNFeEnumStr[stCancelada];

        if Assigned(Nota.eventoCanc) and Nota.just_cancelamento.IsEmpty() then
          Nota.just_cancelamento := Nota.eventoCanc.xcorrecao.Text.Substring(0, 60);
      end;

      if Nota.sitNFe in [stVazio, stDuplicidade, stRejeitada] then
        Nota.nfe_recibo := '';

      RegistradorAlertasDFeUtil.ResolverAlertas(Fnfe.NotasFiscais.Items[I].NFe.procNFe);

      Save_retorno_consulta(Nota, ACommit);
    end;
  end;
end;

procedure THwCentralNFe.EnviarCancelamentoSubstituicao(NotaPendente, NotaContingencia: TNotafiscal_class_hw);
var
  I: Integer;
  Situacao: SituacaoNFeHW;
  EventoEnviado: Boolean;
begin
  // SE NAO CONSEGUIRCANCELAR, TEM DE CHAMAR O CASO DE USO QUE VAI COMPLETAR O REGISTRO DA NOTA NO BANCO DE DADOS?

  if not Assigned(NotaPendente.eventoCanc) then
    CriarEventoCancelamento(NotaPendente);

  if not Assigned(NotaPendente.eventoCanc) then
    raise Exception.Create('O sistema não conseguiu criar o evento para Cancelamento para a NFe Pendente.');

  Fnfe.EventoNFe.Evento.Clear();
  Fnfe.NotasFiscais.Clear;
  Fnfe.NotasFiscais.LoadFromString(NotaPendente.xml_nfe.Text);

  Fnfe.Configuracoes.Geral.FormaEmissao := teNormal;
  Fnfe.Configuracoes.WebServices.Ambiente := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpAmb;

  with Fnfe.EventoNFe.Evento.Add do
  begin
    InfEvento.cOrgao               := ACBrDFeUtil.ExtrairUFChaveAcesso(NotaPendente.chave_nfe);
    InfEvento.tpAmb                := Fnfe.NotasFiscais.Items[0].NFe.Ide.tpAmb;
    InfEvento.CNPJ                 := Fnfe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
    InfEvento.chNFe                := Fnfe.NotasFiscais.Items[0].NumID;
    InfEvento.dhEvento             := IncMinute(Now, -1);
    InfEvento.tpEvento             := teCancSubst; // Cancelamento por substituição
    InfEvento.nSeqEvento           := NotaPendente.eventoCanc.nseqevento;

    // ESTA DANDO ERRO 999 - Rejeicao: Erro nao catalogadO
    // TALVEZ NAO ESTEJA ACEITANDO O ENVENTO DE CANELAMENTO POR SUBSTITUICAO OU NAO SERÁ ASSIM
    // COM O TEMPO AVERIGUAR COMO SERÁ O PROCESSO

    InfEvento.detEvento.xJust       := NotaPendente.eventoCanc.xcorrecao.Text;
    InfEvento.detEvento.descEvento  := 'Cancelamento por substituicao';
    InfEvento.detEvento.nProt       := Fnfe.NotasFiscais.Items[0].NFe.procNFe.nProt;
    InfEvento.detEvento.verAplic    := Fnfe.NotasFiscais.Items[0].NFe.Ide.verProc;
    InfEvento.detEvento.cOrgaoAutor := InfEvento.cOrgao;
    InfEvento.detEvento.tpAutor     := TpcnTipoAutor.taEmpresaEmitente;
    InfEvento.detEvento.chNFeRef    := NotaContingencia.chave_nfe;
  end;

  Fnfe.EventoNFe.GerarXML;

  NotaPendente.eventoCanc.xml_nfe_epec.Text := Fnfe.EventoNFe.XmlEnvio;
  NotaPendente.eventoCanc.id_dfe := THwAux.apenasNumeros(Fnfe.EventoNFe.Evento.Items[0].InfEvento.id);

  Save_retorno_evento(NotaPendente.eventoCanc, True);

  Fnfe.OnGerarLog := NFeGerarLog;
  try try
    EventoEnviado := Fnfe.EnviarEvento(NotaPendente.eventoCanc.idlote);
    if not EventoEnviado then
    begin
      NotaPendente.eventoCanc.situacao := SituacaoNFeEnumStr[stRejeitada];
      NotaPendente.eventoCanc.cstat_proc := Fnfe.WebServices.EnvEvento.cStat;
      NotaPendente.eventoCanc.xmotivo_proc := Fnfe.WebServices.EnvEvento.xMotivo;

      Save_retorno_evento(NotaPendente.eventoCanc, True);
    end;

  except
    on E: Exception do
      raise Exception.Create('NFe Pendente teve Falha de comunicação do evento de cancelamento: ' + E.Message);
  end;
  finally
    Fnfe.OnGerarLog := nil;
  end;

  if not EventoEnviado then
    raise Exception.CreateFmt(
      'NFe Pendente teve Falha no envio do lote do evento de cancelamento por substituição: %d - %s',
      [Fnfe.WebServices.EnvEvento.cStat, Fnfe.WebServices.EnvEvento.xMotivo]
    );

  NotaPendente.eventoCanc.cstat_proc   := Fnfe.WebServices.EnvEvento.cStat;
  NotaPendente.eventoCanc.xmotivo_proc := Fnfe.WebServices.EnvEvento.xMotivo;

  for I := 0 to Fnfe.WebServices.EnvEvento.EventoRetorno.retEvento.Count - 1 do
  begin
    with Fnfe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[I] do
      if RetInfEvento.tpEvento = teCancSubst then
      begin
        Situacao := THwAux.cStatToSituacaoEventoHW(RetInfEvento.cStat);

        NotaPendente.eventoCanc.cstat := RetInfEvento.cStat.ToString;
        NotaPendente.eventoCanc.xmotivo := RetInfEvento.xMotivo;
        NotaPendente.eventoCanc.nprot := RetInfEvento.nProt;
        NotaPendente.eventoCanc.dhevento := RetInfEvento.dhRegEvento;
        NotaPendente.eventoCanc.xml_evento.Text := RetInfEvento.XML;
        NotaPendente.eventoCanc.situacao := SituacaoNFeEnumStr[Situacao];

        if Situacao = stAutorizada then
        begin
          NotaPendente.situacao_nfe      := SituacaoNFeEnumStr[stCancelada];
          NotaPendente.just_cancelamento := NotaPendente.eventoCanc.xcorrecao.Text.Substring(0, 60);

          Save_retorno_cancelamento(NotaPendente, False);
          Exit;
        end
        else
        begin
          Save_retorno_cancelamento(NotaPendente, True);

          case RetInfEvento.cStat of
            501, 573: // 501: Cancelamento fora do prazo, 573: Duplicidade do evento / Chama a consulta
              begin
                if ConsultaSituacaoNFe(NotaPendente) in SituacoesNFeFinalizadas then
                   ProcurarAtribuirProcNFe(NotaPendente, False);
                Exit;
              end;
          end;
        end;
      end;
  end;

  raise Exception.Create('Evento de cancelamento não foi autorizado e a situação da NFe não pode ser resolvida');
end;

procedure THwCentralNFe.EnviarInutilizacaoPendencia(Nota: TNotafiscal_class_hw);
var
  Inut: TNotafiscal_inut_class_hw;
  Situacao: SituacaoNFeHW;
  Aok: Boolean;
begin
  Inut := GetInutilizacao(Nota);
  try
    if listError.Count > 0 then
      raise Exception.Create(listError.Text);

    if Inut = nil then
    begin
      Inut := CriarNovaInutilizacao(Nota);
      if listError.Count > 0 then
        raise Exception.Create(listError.Text);
    end;

    Fnfe.Configuracoes.Geral.FormaEmissao := teNormal;
    Fnfe.Configuracoes.WebServices.Ambiente := StrToTpAmb(Aok, Inut.tpamb);

    with Fnfe.InutNFe do
    begin
      tpAmb := Fnfe.Configuracoes.WebServices.Ambiente;
      cUF := Fnfe.Configuracoes.WebServices.UFCodigo;
      ano := Inut.ano;
      CNPJ := Inut.cnpj;
      modelo := StrToIntDef(Inut.modelo, 55);
      serie := Inut.serie;
      nNFIni := Inut.nnfini;
      nNFFin := Inut.nnffin;
      xJust := Inut.xjust;
    end;

    Fnfe.InutNFe.GerarXML;

    Inut.id_dfe := THwAux.apenasNumeros(Fnfe.InutNFe.ID);

    Fnfe.OnGerarLog := NFeGerarLog;
    try try
      Fnfe.WebServices.Inutiliza(Inut.cnpj, Inut.xjust, Inut.ano, StrToIntDef(Inut.modelo, 55), Inut.serie, Inut.nnfini, Inut.nnffin);
    except
      on E: Exception do
        raise Exception.Create('NFe Pendente teve Falha de comunicação na inutilização: ' + E.Message);
    end;
    finally
      Fnfe.OnGerarLog := nil;
    end;

    if Fnfe.WebServices.Inutilizacao.cStat > 0 then
    begin
      Inut.cStat := Fnfe.WebServices.Inutilizacao.cStat;
      Inut.nProt := Fnfe.WebServices.Inutilizacao.Protocolo;
      Inut.xMotivo := Fnfe.WebServices.Inutilizacao.xMotivo;

      if Fnfe.WebServices.Inutilizacao.dhRecbto > 0 then
        Inut.dhRecbto := Fnfe.WebServices.Inutilizacao.dhRecbto;

      if (Inut.cstat = 563) and (Inut.nprot.IsEmpty) and (Inut.xmotivo.ToUpper().Contains('(NPROT:')) then
      begin
        Inut.cstat := 102;
        Inut.nprot := TagsHelper.Extract(Inut.xmotivo.ToUpper(), '(NPROT:', ')').Trim().Substring(0, 17);
        Inut.xMotivo := 'Inutilizacao de Numero homologado';
      end;

      if Inut.cstat = 102 then
        Inut.xml_inut.Text := Fnfe.WebServices.Inutilizacao.XML_ProcInutNFe;

      Situacao := THwAux.cStatToSituacaoNFeHW(Inut.cstat);

      Save_retorno_inutilizacao(Inut, Situacao <> stInutilizada); // Comitar somente senao inutilizou, la fora resolve
      if listError.Count > 0 then
        raise Exception.Create(listError.Text);

      if Situacao <> stInutilizada then
        raise Exception.Create('NFe Pendente teve a Inutilização rejeitada: ' + Inut.xMotivo);

      Nota.situacao_nfe := SituacaoNFeEnumStr[stInutilizada];

      Save_situacao(Nota, False);
    end;

  finally
    Inut.Free;
  end;
end;

procedure THwCentralNFe.NFeGerarLog(const ALogLine: string; var Tratado: Boolean);
begin
  // Metodo usado somente na resolução da contingência para não cair no raise por conta dos retornos do WS

  Tratado := True;

  if emp.nfe_gravalog.StartsWith('S') then
    THwAux.GerarLog(ALogLine, Tratado);
end;

function THwCentralNFe.nfe_status_servico(AtpEmiss: string): Boolean;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      Fnfe := TACBrNFe.Create(nil);

      acbr_configurar;
      Fnfe.Configuracoes.WebServices.Visualizar := True;

      Result := acbr_status_servico(AtpEmiss);

    finally
      desconectar;

      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_status_servico: ' + e.Message);
      registraErro('THwNFe.nfe_status_servico' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_inutilizacao_email(Aseqid: array of Integer; Aemail, Aanexos: string): Boolean;
var
  Ainuts: TObjectList<TNotafiscal_inut_class_hw>;
  Ainut : TNotafiscal_inut_class_hw;
  I     : Integer;
  Amail : THwNFe_mail_aux;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      Ainuts := TObjectList<TNotafiscal_inut_class_hw>.Create;
      {$REGION 'validando e configurando'}
      if Aemail.Trim.IsEmpty then
        raise Exception.Create('Email não informado');
      for I:= Low(Aseqid) to High(Aseqid) do
      begin
        Ainut := GetInutilizacao(Aseqid[I]);
        if not Assigned(Ainut) then
          listError.Add(Format('Nota fical codigo %d não carregada do banco', [Aseqid[I]]))
        else if (not ((Ainut.cstat = 102) or (Ainut.cstat = 563))) or (Ainut.xml_inut.Text.Trim.IsEmpty) then
          listError.Add(Format('Inutilização codigo %d %s ' + #13 +
                               'Modelo: %s' + #13 +
                               'Serie: %d' + #13 +
                               'Num Inicial: %d' + #13 +
                               'Num Final: %d' + #13 +
                               'Protocolo: %s' + #13 +
                               'Retorno WS: %d - %s',
                               [Ainut.seqid, IfThen(not ((Ainut.cstat = 102) or (Ainut.cstat = 563)), 'não homologado', 'sem xml para envio'),
                               Ainut.modelo, Ainut.serie, Ainut.nnfini, Ainut.nnffin, Ainut.nprot, Ainut.cstat, Ainut.xmotivo]))
        else
          Ainuts.Add(Ainut);

      end;
      {$ENDREGION}

      {$REGION 'montado e enviando'}
      if not Assigned(emp) then
        emp := GetEmpresa_nfe;

      Amail := THwNFe_mail_aux.create(docInut, Aemail, Aanexos);
      Amail.Assunto := Format('Inutilização realizada por %s', [emp.nome_emp]);
      Amail.Mensagem.Add(Amail.Assunto + sLineBreak);
      for Ainut in Ainuts do
        Amail.Mensagem.Add(Format('CNPJ %s - Ano %s - Modelo %s - Serie %d - Faixa Inicial %d - Faixa Final %d',[
                                  Ainut.cnpj,
                                  Ainut.ano.ToString.PadLeft(2, '0'),
                                  Ainut.modelo,
                                  Ainut.serie,
                                  Ainut.nnfini,
                                  Ainut.nnffin]));
      Amail.docs.inut := Ainuts;

      if Amail.docs.inut.Count > 0 then
        Result := acbr_def_send_mail(Amail);
      {$ENDREGION}

    finally
      desconectar;
      if Assigned(Ainut) then
        FreeAndNil(Ainut);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_inutilizacao_email: ' + e.Message);
      registraErro('THwCentralNFe.nfe_inutilizacao_email' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_inutilizacao_enviar(Aseqid: Integer): Boolean;
var
  Ainut: TNotafiscal_inut_class_hw;
  I    : Integer;
  Aok  : Boolean;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      Ainut := GetInutilizacao(Aseqid);

      {$REGION 'validacoes do eventoda NF e eventos'}
      if not Assigned(Ainut) then
        raise Exception.Create(Format('Inutilização codigo %d não carregada do banco', [Aseqid]));

      if Ainut.modelo <> '55' then
        raise Exception.Create(Format('Inutilização codigo %d com modelo diferente de 55', [Aseqid]));

      if (Ainut.cstat = 102) or (Ainut.cstat = 563) then
        raise Exception.Create(Format('Inutilização codigo %d já homologado ' + #13 +
                               'Modelo: %s' + #13 +
                               'Serie: %d' + #13 +
                               'Num Inicial: %d' + #13 +
                               'Num Final: %d' + #13 +
                               'Protocolo: %s' + #13 +
                               'Retorno WS: %d - %s',
                               [Aseqid, Ainut.modelo, Ainut.serie, Ainut.nnfini, Ainut.nnffin, Ainut.nprot, Ainut.cstat, Ainut.xmotivo]));
      {$ENDREGION}

      Fnfe := TACBrNFe.Create(nil);

      acbr_configurar;

      {$REGION 'leitura da inutilizacao e envio'}
      Fnfe.Configuracoes.Geral.FormaEmissao   := teNormal;
      Fnfe.Configuracoes.WebServices.Ambiente := StrToTpAmb(Aok, Ainut.tpamb);

      with Fnfe.InutNFe do
      begin
        tpAmb  := Fnfe.Configuracoes.WebServices.Ambiente;
        cUF    := Fnfe.Configuracoes.WebServices.UFCodigo;
        ano    := Ainut.ano;
        CNPJ   := Ainut.cnpj;
        modelo := StrToIntDef(Ainut.modelo, 55);
        serie  := Ainut.serie;
        nNFIni := Ainut.nnfini;
        nNFFin := Ainut.nnffin;
        xJust  := Ainut.xjust;
      end;
      Fnfe.InutNFe.GerarXML;//apenas para pergar o id e gravar
      Ainut.id_dfe := THwAux.apenasNumeros(Fnfe.InutNFe.ID);
      {$ENDREGION}

      {$REGION 'enviar e tratar retorno'}
      try
        Fnfe.WebServices.Inutiliza(Ainut.cnpj, Ainut.xjust, Ainut.ano, StrToIntDef(Ainut.modelo, 55),
                                   Ainut.serie, Ainut.nnfini, Ainut.nnffin);
      except on E: Exception do
        begin
          listError.Add(Format('Inutilização WS - ID %d ' +
                        IfThen(Fnfe.WebServices.Inutilizacao.cStat = 128, 'processado'), [Aseqid]));
          listError.Add(Format('Retorno inutilização %d - %s '  + #13 + #13 +
                        '%s' ,[Fnfe.WebServices.Inutilizacao.cStat, Fnfe.WebServices.Inutilizacao.xMotivo, e.Message]));
        end;
      end;

      {$REGION 'resposta do webservice'}
      if Fnfe.WebServices.Inutilizacao.cStat > 0 then
      begin
        Ainut.cStat         := Fnfe.WebServices.Inutilizacao.cStat;
        Ainut.nProt         := Fnfe.WebServices.Inutilizacao.Protocolo;
        Ainut.xMotivo       := Fnfe.WebServices.Inutilizacao.xMotivo;
        Ainut.dhRecbto      := Fnfe.WebServices.Inutilizacao.dhRecbto;
        Ainut.xml_inut.Text := Fnfe.WebServices.Inutilizacao.XML_ProcInutNFe;
        if (Ainut.cstat = 563) and (Ainut.nprot.IsEmpty) and (Ainut.xmotivo.ToUpper.Contains('[NPROT:')) then
          Ainut.nprot := TagsHelper.Extract( Ainut.xmotivo, '[NPROT:', ']').Substring(0, 17);

        Save_retorno_inutilizacao(Ainut);
      end;

      Result := (Fnfe.WebServices.Inutilizacao.cStat = 102) or
                (Fnfe.WebServices.Inutilizacao.cStat = 102);
      {$ENDREGION}

      {$ENDREGION}

    finally
      desconectar;
      if Assigned(Ainut) then
        FreeAndNil(Ainut);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;

  except on E: Exception do
    begin
      listError.Append('NFe_inutilizar: ' + e.Message);
      registraErro('THwCentralNFe.nfe_inutilizar ' + e.Message);
    end;
  end;
end;

function THwCentralNFe.nfe_evento_imprimir(Acod_nf, Alote: Integer; Aprint, AsavePDF: Boolean;
  ApathPDF: string): Boolean;
var
  Anota     : TNotafiscal_class_hw;
  Aevento   : TNotafiscal_carta_correcao_class_hw;
  I         : Integer;
begin
  Result := False;
  listError.Clear;
  try
    if not conectar(dbName, False) then
      Exit;

    try
      Anota := GetNotaFiscal(Acod_nf);
      Aevento := nil;
      if not Assigned(Anota) then
        raise Exception.Create(Format('Nota fical codigo %d não carregada do banco', [Acod_nf]))
      else if not (Anota.sitNFe in [stAutorizada, stCancelada]) then
        raise Exception.Create(Format('Nota fical codigo %d e numero %d não pode ser impressa. Situação: %s', [Anota.cod_nf, Anota.num_nf, Anota.situacao_nfe]));

      if Assigned(Anota.eventoCanc) then
        if Anota.eventoCanc.idlote = Alote then
          Aevento := Anota.eventoCanc;

      if not Assigned(Aevento) then
        if Assigned(Anota.eventosCCe) then
          for I := 0 to Anota.eventosCCe.Count - 1 do
            if Anota.eventosCCe.Items[I].idlote = Alote then
            begin
              Aevento := Anota.eventosCCe.Items[I];
              Break;
            end;
      if not Assigned(Aevento) then
        raise Exception.Create(Format('Evento lote %d da Nota fical codigo %d e numero %d não localizado', [Alote, Anota.cod_nf, Anota.num_nf]))
      else if Aevento.situacao <> sitAutorizada then
        raise Exception.Create(Format('Evento lote %d da Nota fical codigo %d e numero %d não Autorizado. Situação: %s', [Alote, Anota.cod_nf, Anota.num_nf, Aevento.situacao]));

      Fnfe       := TACBrNFe.Create(nil);
      Fdanfe     := TACBrNFeDANFeRL.Create(Fnfe);
      Fnfe.DANFE := Fdanfe;

      acbr_configurar;

      Fnfe.NotasFiscais.Clear;

      if not acbr_add_notafiscal(Anota) then
        raise Exception.Create(Format('Nota fical codigo: %d e numero %d não pode ser impressa. XML não carregado', [Anota.cod_nf, Anota.num_nf]))
      else
      begin
        Fnfe.EventoNFe.Evento.Clear;
        Fnfe.EventoNFe.LerXMLFromString(Aevento.xml_evento.Text);
      end;

      if Aprint then
        Fnfe.ImprimirEvento;

      if AsavePDF then
      begin
        if not ApathPDF.IsEmpty then
          if not DirectoryExists(ApathPDF) then
            ApathPDF := Fnfe.DANFE.PathPDF;

        if not ApathPDF.IsEmpty then
          if not DirectoryExists(ApathPDF) then
            ApathPDF := ExtractFilePath(ParamStr(0));

        Fnfe.DANFE.PathPDF := ApathPDF;
        Fnfe.ImprimirEventoPDF;
      end;

    finally
      desconectar;
      if Assigned(Anota) then
        FreeAndNil(Anota);
      if Assigned(Fdanfe) then
        FreeAndNil(Fdanfe);
      if Assigned(Fnfe) then
        FreeAndNil(Fnfe);
    end;

    Result := listError.Count = 0;

  except on E: Exception do
    begin
      listError.Append('NFe_imprimir_evento: ' + e.Message);
      registraErro('THwCentralNFe.nfe_imprimir_evento ' + e.Message);
    end;
  end;
end;

{ TNotafiscal_item_veiculo_class_hw }

procedure TNotafiscal_item_veiculo_class_hw.SetValuesFrom(ADataSet: TDataSet);
begin
  inherited SetValuesFrom(ADataSet);

  Fcodcordenatram := ADataSet.FieldByName('CODCORDENATRAM').AsInteger;
  Fcmkg           := Trim(ADataSet.FieldByName('CMKG').AsString);
  Fdistanciaeixo  := Trim(ADataSet.FieldByName('DISTANCIAEIXO').AsString);
  Ftip_veiculo    := Trim(ADataSet.FieldByName('TIP_VEICULO').AsString);
  Fesprenavam     := Trim(ADataSet.FieldByName('ESPRENAVAM').AsString);
  Fpesol          := ADataSet.FieldByName('PESOL').AsInteger;
  Fpesob          := ADataSet.FieldByName('PESOB').AsInteger;
  Flotacao        := Trim(ADataSet.FieldByName('LOTACAO').AsString);
  Ftpcomb_m       := Trim(ADataSet.FieldByName('TPCOMB_M').AsString);
  Fpot            := FloatToStr(ADataSet.FieldByName('HP').AsFloat);
  if Length(Fpot) > 4 then
  begin
    Fpot := Copy(Fpot, 1, 4);
    Fpot := FloatToStr(StrToFloat(Fpot));
  end;
  FinfAdProd := 'CHASSI: '          + chassi +
                ';LOTACAO: '        + lotacao + ' PASS.' +
                '; ANO FABRICACAO: '+ ano_fab.ToString +
                ', ANO MODELO: '    + ano_mod.ToString +
                '; CILINDROS: '     + cilindros.ToString +
                ' CONDIÇÃO: '       + IfThen(tipo_venda.Equals('U'), 'SEMI') + 'NOVA' +
                ', COR: '           + cor +
                '; CILINDRADAS: '   + Int(cilindrada).ToString.PadLeft(4, '0') +
                ', HP: '            + pot +
                '; COMBUSTÍVEL: '   + combustivel +
                '; PLACA VEICULO: ' + placa +
                '; MOTOR: '         + motor +
                '; RENAVAM: '       + renavam;
end;

{ TTransportador_class_hw }

procedure TTransportador_class_hw.SetValuesFrom(ADataSet: TDataSet);
begin
  inherited;
  Fsigla_uf := Trim(ADataSet.FieldByName('SIGLA_UF').AsString);
end;

{ TConfigCentralNFe }

constructor TConfigCentralNFe.Create(AOwner: THwCentralNFe);
begin
  FOwner := AOwner;
  Ffcp   := TConfigCentralNFe_FCP.Create;
  Ffcp.Text_vFCPUFDest   := 'ICMS relativo ao FCP da UF destino:';
  Ffcp.Text_vICMSUFDest  := 'ICMS Interestadual para UF destino, já considerando o FCP na UF Destino:';
  Ffcp.Text_vICMSUFRemet := 'ICMS Interestadual para a UF do remetente:';
  Ffcp.UsarQuebraDeLinha := False;

  Fdanfe := TConfigCentralNFe_DANFE.Create;
  FhabStatusServ := True;
  FanpRepasse := TStringList.Create;
  FtagEANSemGTIN := False;
  FNT_2018_005   := False;
  FTagICMSSubsti := tisQuandoPreenchido;

  //valores default obtidos direto do componente do danfe
end;

destructor TConfigCentralNFe.Destroy;
begin
  if Assigned(Ffcp) then
    FreeAndNil(Ffcp);
  if Assigned(Fdanfe) then
    FreeAndNil(Fdanfe);
  if Assigned(FanpRepasse) then
    FreeAndNil(FanpRepasse);
  inherited;
end;

procedure TConfigCentralNFe.ExecutarLeitura;
var
  AList: TConfig_sistema_classList;
  Aconf: TConfig_sistema_class;
  AconfDanfe: TConfig_sistema_class;
  I: Integer;
  Astr: string;
  Achar: Char;
  AstrConfs: array of string;
begin
  AList := TConfig_sistema_classList.Create;
  AList.AddKey('nfe_icms_partilha_textos')
       .AddKey('nfe_cfg_ad_danfe_largura_codprod')
       .AddKey('nfe_dup_sequencial')
       .AddKey('nfe_hab_status_servico')
       .AddKey('nfe_anp_repasse')
       .AddKey('nfe_tag_ean_semgtin')
       .AddKey('nfe_tag_icmssubstituto')
       .AddKey('nfe_tag_nt_2018_005')
       .AddKey('nfe_nt_2020_006_data')
       .AddKey('nfe_referencia_sigilosa')
       .AddKey('nfe_lote_1nfe_sincrono_data')
       .AddKey('nfe_nfce_csrt')
       .AddKey('nfe_veiculo_detalhe_usado');
  AList.MakeAll(FOwner.QrAux, FOwner.cod_empresa);

  Flote_sinc_1nfe := EncodeDate(2025, 09, 01) <= Date;
  FIdCSRT := '';
  FCSRT := '';
  FveicDetUsado := True;

  FanpRepasse.Clear;
  for I:= 0 to AList.Count - 1 do
  begin
    Aconf := AList.Items[I];
    if Aconf.chave.Equals('nfe_icms_partilha_textos') then
    begin
      with Ffcp do
      begin
        Text_vFCPUFDest   := THwAux.GetIni('Texto', 'FCPUFDest'        , Text_vFCPUFDest, Aconf.value1_b);
        Text_vICMSUFDest  := THwAux.GetIni('Texto', 'ICMSUFDest'       , Text_vICMSUFDest, Aconf.value1_b);
        Text_vICMSUFRemet := THwAux.GetIni('Texto', 'ICMSUFRemet'      , Text_vICMSUFRemet, Aconf.value1_b);
        UsarQuebraDeLinha := THwAux.GetIni('Texto', 'UsarQuebraDeLinha', IfThen(UsarQuebraDeLinha, 'S', 'N') , Aconf.value1_b) = 'S';
      end
    end
    else if Aconf.chave.Equals('nfe_dup_sequencial') then
      FdupSequencial := Aconf.value1_f = 1
    else if Aconf.chave.Equals('nfe_hab_status_servico') then
      FhabStatusServ := Aconf.value1_f = 1
    else if Aconf.chave.Equals('nfe_cfg_ad_danfe_largura_codprod') then
    begin
      AconfDanfe := Aconf;
    end
    else if Aconf.chave.Equals('nfe_anp_repasse') then
    begin
      for Astr in Aconf.value1_b.Text.Split([' ', ',', ';', sLineBreak]) do
        FanpRepasse.Add(Astr);
    end
    else if Aconf.chave.Equals('nfe_tag_ean_semgtin') then
      FtagEANSemGTIN := Aconf.value1_f = 1
    else if Aconf.chave.Equals('nfe_tag_nt_2018_005') then
      FNT_2018_005 := Date >= StrToDateDef(Aconf.value1_vc, EncodeDate(2019, 05, 07))
    else if Aconf.chave.Equals('nfe_nt_2020_006_data') then
      Fnfe_nt_2020_006_data := StrToDateDef(Aconf.value1_vc, EncodeDate(2021, 04, 05))
    else if Aconf.chave.Equals('nfe_referencia_sigilosa') then
      FnfeRefSigilosa := Aconf.value1_f = 1
    else if Aconf.chave.Equals('nfe_lote_1nfe_sincrono_data') then
      Flote_sinc_1nfe := StrToDateTimeDef(Aconf.value1_vc, EncodeDate(2025, 09, 01)) <= Date
    else if Aconf.chave.Equals('nfe_nfce_csrt') then
    begin
      FIdCSRT := Aconf.ReadString('NFe_' + FOwner.emp.webserv_uf, 'IdCSRT');
      FCSRT   := Aconf.ReadString('NFe_' + FOwner.emp.webserv_uf, 'CSRT');
    end
    else if Aconf.chave.Equals('nfe_veiculo_detalhe_usado') then
      FveicDetUsado := Aconf.value1_f = 1;
  end;

  Aconf := AList.GetConf('nfe_tag_icmssubstituto');
  if not FNT_2018_005 then
    FTagICMSSubsti := tisQuandoPreenchido
  else if Assigned(Aconf) then
  begin
    i := Aconf.ReadInteger('Conf', 'NFe_' + FOwner.emp.webserv_uf, -1);
    if (I > -1) and (I <= 3) then
      FTagICMSSubsti := RTagICMSSub(I)
    else
    begin
      FTagICMSSubsti := tisQuandoPreenchido;
      Aconf.WriteInteger('Conf', 'NFe_' + FOwner.emp.webserv_uf, Ord(FTagICMSSubsti));
      Aconf.value1_b.Insert(0, '# 0: Sempre; 1: Apenas quando possuir valor');
      if Aconf.SaveConfDB(FOwner.QrAux).Transaction.InTransaction then
        FOwner.QrAux.Transaction.Commit;
    end;
  end;

  {$REGION 'configuração do danfe'}
  if not Assigned(AconfDanfe) then
    AconfDanfe := TConfig_sistema_class.Create;
  if Assigned(FOwner.Fdanfe) then
    with Fdanfe do
    begin
      Fdanfe.value1_b.Text := AconfDanfe.value1_b.Text;
      Fdanfe.AtivarMapeamentoKeys;
      Fdanfe.chave := 'nfe_cfg_ad_danfe_largura_codprod';
      Fdanfe.display_ := 'Largura da coluna do código do produto para Impressão do DANFe';
      Fdanfe.type1_ := 'blob';
      Fdanfe.cod_empresa := FOwner.cod_empresa;

      LarguraCodProd                := Fdanfe.ReadInteger('DANFE', 'LarguraCodProd'           , TACBrNFeDANFeRL(FOwner.Fdanfe).LarguraCodProd);
      ExibirEAN                     := Fdanfe.ReadBool(   'DANFE', 'ExibirEAN'                , TACBrNFeDANFeRL(FOwner.Fdanfe).ExibeEAN);
      CasasDecimais_qCom            := Fdanfe.ReadInteger('DANFE', 'CasasDecimais_qCom'       , 3);
      CasasDecimais_vUnCom          := Fdanfe.ReadInteger('DANFE', 'CasasDecimais_vUnCom'     , FOwner.emp.casas_decimais);
      //ProdutosPorPagina             := Fdanfe.ReadInteger('DANFE', 'ProdutosPorPagina'          , TACBrNFeDANFeRL(FOwner.Fdanfe).ProdutosPorPagina);
      ExibeCampoFatura              := Fdanfe.ReadBool(   'DANFE', 'ExibeCampoFatura'             , TACBrNFeDANFeRL(FOwner.Fdanfe).ExibeCampoFatura);
      EspacoEntreProdutos           := Fdanfe.ReadInteger('DANFE', 'EspacoEntreProdutos'          , TACBrNFeDANFeRL(FOwner.Fdanfe).EspacoEntreProdutos);
      AlternaCoresProdutos          := Fdanfe.ReadBool(   'DANFE', 'AlternaCoresProdutos'         , TACBrNFeDANFeRL(FOwner.Fdanfe).AlternaCoresProdutos);
      ExibirBandInforAdicProduto    := Fdanfe.ReadBool(   'DANFE', 'ExibirBandInforAdicProduto'   , Ord(TACBrNFeDANFeRL(FOwner.Fdanfe).ExibeInforAdicProduto) <> 0);
      ImprimirDadosDocReferenciados := Fdanfe.ReadBool(   'DANFE', 'ImprimirDadosDocReferenciados', TACBrNFeDANFeRL(FOwner.Fdanfe).ExibeDadosDocReferenciados);
      ExibirResumoCanhoto           := Fdanfe.ReadBool(   'DANFE', 'ExibirResumoCanhoto'          , True);
      ImprimirCancelamentoNoDANFE   := Fdanfe.ReadBool(   'DANFE', 'ImprimirCancelamentoNoDANFE'  , True);
      ImprimirIpiDevolEmCampoIPI    := Fdanfe.ReadBool(   'DANFE', 'ImprimirIpiDevolEmCampoIPI'   , True);
      RemoverLineBreak              := Fdanfe.ReadBool(   'DANFE', 'RemoverQubrasDeLinha'         , False);
      ImprimeDetalhamentoEspecifico := Fdanfe.ReadBool(   'DANFE', 'ImprimeDetalhamentoEspecifico', False);
    end;
  {$ENDREGION}

  Astr := FOwner.SqlOpen('select VERSAO_INST from CONFIG_HWUPDATE' +
                         ' where COD_HWUPDATE = 1').FieldByName('VERSAO_INST').AsString.Replace('_', '');

  while Astr.Substring(0, 1).Equals('0') do
    Astr := Astr.Substring(1, Astr.Length);

  Fverproc := '';
  for Achar in Astr do
    Fverproc := Fverproc + Achar + '.';

  Fverproc := Fverproc.Substring(0, Fverproc.Length - 1);


  FsoftHouse := FOwner.SqlOpen('select first 1 nome_empdes from empdesvolv').FieldByName('nome_empdes').AsString.Trim;
end;

function TConfigCentralNFe.getConfSisList(const Achaves: array of string): TConfig_sistema_classList;
var
  I: Integer;
begin
  Result := TConfig_sistema_classList.Create;

  if Length(Achaves) <= 0 then
    Exit;

  FOwner.QrAux.Close;
  FOwner.QrAux.SQL.Clear;
  for I := Low(Achaves) to High(Achaves) do
    FOwner.QrAux.SQL.Add(IfThen(I > Low(Achaves), ' union ') +
      'select * from config_sistema' +
      ' where chave = ' + QuotedStr(AChaves[I]) + ' and cod_empresa = ' + FOwner.cod_empresa.ToString);
  FOwner.QrAux.Open;

  while not FOwner.QrAux.Eof do
  begin
    Result.New.SetValuesFrom(TDataSet(FOwner.QrAux));
    FOwner.QrAux.Next;
  end;
  FOwner.QrAux.Close;
end;

{ THwAux }

class function THwAux.apenasNumeros(Atexto: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to (Length(Atexto)) do
    if Pos(Atexto[I], '0123456789') > 0 then
      Result := Result + Atexto[I];
end;

class function THwAux.CreateProcessSimple(Acmd: string; Await: Boolean): Boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_SHOW;

  Result := CreateProcess(nil, PChar(Acmd), nil, nil, false, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo);

  if (Result) then
  begin
    if Await then
      WaitForSingleObject(ProcInfo.hProcess, INFINITE)
    else
      WaitForSingleObject(ProcInfo.hProcess, 0);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

class function THwAux.cStatToSituacaoEventoHW(cStat: Integer): SituacaoNFeHW;
begin
  case cStat of
    0                 : Result := stVazio;
    128               : Result := stEmProcessamento;
    485, 573          : Result := stDuplicidade;
    135, 136, 155     : Result := stAutorizada;
    else                Result := stRejeitada;
  end;
end;

class function THwAux.cStatToSituacaoNFeHW(cStat: Integer): SituacaoNFeHW;
begin
  case cStat of
    0                 : Result := stVazio;                 // Nao houve comunicacao com o ws
    103, 104, 105     : Result := stEmProcessamento;
    204               : Result := stDuplicidade;
    100, 120, 150     : Result := stAutorizada;
    110, 301, 302, 303: Result := stDenegada;
    101, 135, 151, 155: Result := stCancelada;
    102, 563          : Result := stInutilizada;
    468               : Result := stEmEPEC;
    else                Result := stRejeitada;
  end;
end;

class procedure THwAux.GerarLog(const Mensagem: String; var Tratado: Boolean);
var
  AFile: TextFile;
  AfileName: string;
begin
  AfileName := ExtractFilePath(ParamStr(0)) + 'NFe.log';
  AssignFile(AFile, AfileName);
  try
    if not FileExists(AfileName) then
      Rewrite(AFile)
    else
      Append(AFile);
    WriteLn(AFile, Mensagem);
  finally
    CloseFile(AFile);
  end;
end;

class function THwAux.GetIni(Achave, Aident, ADefault: string; AIniText: TStrings): string;
var
  ArqConfig: TMemIniFile;
begin
  Result := ADefault;
  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(AIniText);
    Result := ArqConfig.ReadString(Achave, Aident, ADefault);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

class function THwAux.GetIniB(Achave, Aident: string; ADefault: Boolean; AIniText: TStrings): Boolean;
var
  ArqConfig: TMemIniFile;
begin
  Result := ADefault;
  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(AIniText);
    Result := ArqConfig.ReadBool(Achave, Aident, ADefault);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

class function THwAux.GetIniI(Achave, Aident: string; ADefault: Integer; AIniText: TStrings): Integer;
var
  ArqConfig: TMemIniFile;
begin
  Result := ADefault;
  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(AIniText);
    Result := ArqConfig.ReadInteger(Achave, Aident, ADefault);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

class function THwAux.SituacaoNFeToStr(Value: SituacaoNFeHW): string;
begin
  Result := SituacaoNFeEnumStr[Value];
end;

class function THwAux.strEventoToDescEvento(AstrEvento: string): string;
begin
  if AstrEvento.Equals(strEventoEPEC) then
    Result := strDescEventoEPEC
  else if AstrEvento.Equals(strEventoCCe) then
    Result := strDescEventoCCe
  else if AstrEvento.Equals(strEventoCan) then
    Result := strDescEventoCan;
end;

class function THwAux.strEventoToDocumentoNFeHW(AstrEvento: string): DocumentoNFeHW;
begin
  if AstrEvento.Equals(strEventoEPEC) then
    Result := docEPEC
  else if AstrEvento.Equals(strEventoCCe) then
    Result := docEventoCCe
  else if AstrEvento.Equals(strEventoCan) then
    Result := docEventoCan;
end;

class function THwAux.StrToSituacaoNFe(Value: string): SituacaoNFeHW;
begin
  Result := SituacaoNFeToEnum(Value);
end;

class function THwAux.StrToTStrings(AText: string; Aseparator: array of string; AdupIgnore: Boolean): TStrings;
var
  Astr: string;
begin
  Result := TStringList.Create;
  for Astr in AText.Split(Aseparator) do
    if not Astr.Trim.IsEmpty then
      if not AdupIgnore  then
        Result.Add(Astr)
      else if Result.IndexOf(Astr.Trim) = -1 then
        Result.Add(Astr);
end;

{ THwNFe_mail_aux }

constructor THwNFe_mail_aux.create;
begin
  FAnexos     := TStringList.Create;
  FCCmails    := TStringList.Create;
  FMensagem   := TStringList.Create;
  Fdocs       := THwNFe_mail_aux_docs.Create;
  FcomPDF     := True;
  FcomEventos := True;
  FemailUnico := False;
  FcomBol     := False;
  FsepBoletos := TBoletosSeparados.Create;
  definirPathPDF;
end;

constructor THwNFe_mail_aux.create(Adoc: DocumentoNFeHW; Aemail, Aanexos: string);
begin
  create;
  FdocDFe  := Adoc;
  FAnexos  := THwAux.StrToTStrings(Aanexos, [',', ';', '|', sLineBreak]);
  Setemail(Aemail);
end;

procedure THwNFe_mail_aux.definirPathPDF;
const
   SHGFP_TYPE_CURRENT = 0;
var
  vPath: array[0..MAX_PATH] of char;
  AfileTest: TStrings;

  function run_path(Apath: string): Boolean;
  begin
    if not DirectoryExists(Apath) then
      CreateDir(Apath);
    Result := DirectoryExists(Apath);
  end;

  function test_path(Apath: string): Boolean;
  begin
    Result := True;
    AfileTest.Add(DateTimeToStr(Now));
    try
      AfileTest.SaveToFile(Apath + '\pdf.txt');
    except
      Result := False;
    end;
  end;

begin
  FpathPDF := '';
  AfileTest := TStringList.Create;
  try
    if SUCCEEDED(SHGetFolderPath(0, CSIDL_APPDATA, 0, SHGFP_TYPE_CURRENT, @vPath[0])) then
    begin
      FpathPDF := vPath + '\Hw Sistemas';
      run_path(FpathPDF);

      FpathPDF := FpathPDF + '\PDFTemp';

      if not run_path(FpathPDF) then
        FpathPDF := ''
      else if not test_path(FpathPDF) then
        FpathPDF := '';
    end;

    if FpathPDF = '' then
    begin
      FpathPDF := 'C:\WINDOWS\TEMP';
      if not run_path(FpathPDF) then
        FpathPDF := ''
      else if not test_path(FpathPDF) then
        FpathPDF := '';
    end;

    if FpathPDF = '' then
    begin
      FpathPDF := ExtractFilePath(ParamStr(0)) + 'PDFTemp';
      if not run_path(FpathPDF) then
        FpathPDF := ''
      else if not test_path(FpathPDF) then
        FpathPDF := ExtractFilePath(ParamStr(0));
    end;
  finally
    FreeAndNil(AfileTest);
  end;
end;

destructor THwNFe_mail_aux.Destroy;
begin
  if Assigned(FAnexos) then
    FreeAndNil(FAnexos);
  if Assigned(FCCmails) then
    FreeAndNil(FCCmails);
  if Assigned(FMensagem) then
    FreeAndNil(FMensagem);
  if Assigned(Fdocs) then
    FreeAndNil(Fdocs);
  FsepBoletos.Free;
  inherited;
end;

procedure THwNFe_mail_aux.Setemail(const Value: string);
var
  Alist: TStrings;
  Aemail: string;
begin
  if not Value.Trim.IsEmpty then
  begin
    Alist := THwAux.StrToTStrings(Value, [',', ';', '|', sLineBreak, ' ']);
    try
      Femail := Alist[0];
      Alist.Delete(0);

      for Aemail in Alist do
        if FCCmails.IndexOf(Aemail) = -1 then
          FCCmails.Add(Aemail);
    finally
      FreeAndNil(Alist);
    end;
  end
  else
    Femail := Value;
end;

{ TFormStatus }

constructor TFormStatus.Create(AOwner: TComponent);
begin
  inherited CreateNew(AOwner);

  Ftitulo := 'Serviços NF-e';

  {$REGION 'configuracao do form'}
  BorderStyle := bsNone;
  Caption     := 'Processamentos NF-e';
  Width       := 481;
  Height      := 42;
  Position    := poScreenCenter;
  Name        := 'FormStatus';
  {$ENDREGION}

  {$REGION 'configuracao do panel'}
  panelContainer := TPanel.Create(AOwner);
  with panelContainer do
  begin
    Parent           := Self;
    Align            := alClient;
    BevelOuter       := bvNone;
    BorderWidth      := 2;
    Color            := clBlack;
    ParentBackground := False;
    Name             := 'ApanelContainer';
  end;
  {$ENDREGION}

  {$REGION 'configurando label titulo'}
  lbTituloSuperior := TLabel.Create(AOwner);
  with lbTituloSuperior do
  begin
    Parent      := panelContainer;
    Align       := alTop;
    Color       := clSilver;
    Layout      := tlCenter;
    ParentColor := False;
    Font.Color  := clBlack;
    Font.Size   := 9;
    Font.Style  := [fsBold];
    Transparent := False;
    Caption     := Ftitulo;
    Name        := 'AlbTituloSuperior';
  end;
  {$ENDREGION}

  {$REGION 'configurando label status'}
  lbStatusInferior := TLabel.Create(AOwner);
  with lbStatusInferior do
  begin
    Parent      := panelContainer;
    Align       := alClient;
    Color       := clGray;
    Layout      := tlCenter;
    ParentColor := False;
    Font.Color  := clWhite;
    Font.Size   := 11;
    Font.Style  := [fsBold];
    Caption     := '';
    Name        := 'AlbStatusInferior';
  end;
  {$ENDREGION}

  Self.Hide;
end;

destructor TFormStatus.Destroy;
begin
  if Assigned(lbTituloSuperior) then
    FreeAndNil(lbTituloSuperior);
  if Assigned(lbStatusInferior) then
    FreeAndNil(lbStatusInferior);
  if Assigned(panelContainer) then
    FreeAndNil(panelContainer);
  inherited;
end;

procedure TFormStatus.doStatus(Astatus: string);
begin
  lbTituloSuperior.Caption := Ftitulo;
  lbStatusInferior.Caption := Astatus;
  if not Self.Visible then
    Self.Show;
  Self.BringToFront;
  Application.ProcessMessages;
end;

procedure TFormStatus.SetTitulo(const Value: string);
begin
  Ftitulo := Value;
end;

{ TNotafiscal_dup_class_hw }

destructor TNotafiscal_dup_class_hw.Destroy;
begin
  if Assigned(FhtmlBoleto) then
    FreeAndNil(FhtmlBoleto);

  inherited;
end;

function TNotafiscal_dup_class_hw.GerarBoletoEmPDF(ApathPDF: string): Boolean;
var
  AFileSettings: TStrings;
  AarquivoHtm, arquivoDonwload: string;
begin
  Result := False;
  try
    if (n_seq_bol = 0) then
      Exit;

    FArquivoPDF := ApathPDF + '\bol_' + n_seq_bol.ToString + '.pdf';

    if TipoArquivo = FormatoBoletoDb.faLink then
    begin

      if FStringArquivo.Trim.IsEmpty then
        Exit;

      if not DirectoryExists(ExtractFilePath(FArquivoPDF)) then
        ForceDirectories(ExtractFilePath(FArquivoPDF));

      arquivoDonwload := plugboleto_download_via_url(';empresaId=' + cod_empresa.ToString(), FStringArquivo);
      if not FileExists(arquivoDonwload) then
        Exit;

      if not RenameFile(arquivoDonwload, FArquivoPDF) then
        FArquivoPDF := arquivoDonwload;

      Result := FileExists(FArquivoPDF);
    end
    else if TipoArquivo = FormatoBoletoDb.faPDF then
    begin

      if FStringArquivo.Trim.IsEmpty then
        Exit;

      Base64Helper.DecodeFile(FStringArquivo, FArquivoPDF);

      Result := FileExists(FArquivoPDF);

    end
    else if TipoArquivo = FormatoBoletoDb.faHtml then
    begin

      if (not Assigned(FhtmlBoleto)) or FhtmlBoleto.Text.Trim.IsEmpty then
        Exit;

      AFileSettings := TStringList.Create;
      AFileSettings.Clear;

      try
        AFileSettings.Add('[Settings]');
        AFileSettings.Add('HTML=');
        AFileSettings.Add('PDF=');
        AFileSettings.Add('OpenAfterSave=0');

        AarquivoHtm := ApathPDF + '\bol_' + n_seq_bol.ToString + '.html';

        FhtmlBoleto.SaveToFile(AarquivoHtm);

        AFileSettings[1] := 'HTML=' + AarquivoHtm;
        AFileSettings[2] := 'PDF=' + FArquivoPDF;
        AFileSettings.SaveToFile(ExtractFilePath(Application.ExeName) + 'htm2pdf.ini');
        THwAux.CreateProcessSimple('htm2pdf.exe "' + AarquivoHtm + '" "' + FArquivoPDF + '" /silent', True);

        if FileExists(FArquivoPDF) then
          Result := True;
        DeleteFile(PWideChar(AarquivoHtm));

      finally
        FreeAndNil(AFileSettings);
      end;
    end;

  except on E: Exception do
    begin
      TConexao.registraErro('TNotafiscal_dup_class_hw.GerarBoletoEmPDF ' + e.Message);
    end;
  end;
end;

procedure TNotafiscal_dup_class_hw.HandleDadosBoleto(idIntegracao,
  linkDownload, dadosStr: string);
begin
  if (not dadosStr.IsEmpty) and
     (StartsText(idIntegracao + '|', dadosStr)) then
  begin
    FTipoArquivo := FormatoBoletoDb.faPDF;
    FStringArquivo := dadosStr.Substring(dadosStr.IndexOf('|') + 1);
  end
  else if not linkDownload.IsEmpty then
  begin
    FTipoArquivo := FormatoBoletoDb.faLink;
    FStringArquivo := linkDownload;
  end
  else if (not dadosStr.IsEmpty) then
  begin
    FTipoArquivo := FormatoBoletoDb.faHtml;
    FhtmlBoleto := TStringList.Create;
    FhtmlBoleto.Text := dadosStr;
  end;
end;

end.
