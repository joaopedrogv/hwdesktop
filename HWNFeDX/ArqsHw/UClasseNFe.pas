unit UClasseNFe;

interface
 uses Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
   Datasnap.DBClient, IBX.IBDatabase, IBX.IBQuery, Data.DB,
  IdHashMessageDigest,
  Vcl.ComCtrls, Vcl.DBGrids, dateutils, IniFiles, uDataSet_OOP_DX,
  ACBrNFe,Vcl.dialogs,pcnconversao,comobj,xmldoc, xmlintf,ACBrMDFe,
  ACBrMDFeDAMDFeRLClass, ACBrMDFeDAMDFeRL, ufrmStatus,
  Classes, ACBrNFSeDANFSeRL,
  notafiscal_item_class,
  produtos_class,
  System.Generics.Collections, System.Contnrs, CestVarianteMvaNcmUf_Model,
  ACBrNFe.Classes,
  {$IFDEF USE_NFSEX}
//  ACBrNFSeX,
//  ACBrNFSeXConversao,
//  ACBrNFSeXDANFSeRLClass,
  blcksock,
  {$ELSE}
//  ACBrNFSe,
//  pnfsNFSe,
//  pnfsConversao,
//  ACBrNFSeDANFSeRLClass,
  {$ENDIF}
  sigiss_ws,
  MidasLib;

type

//  ArrayBi = array of array of shortstring;

  EComponente = (FlexDocs, ACbr);
  EMetodoNFSe = (Envio, ConsutaNota, ConsultaLote); //talvez precisa de um ConsultaSituacao aqui
  TipoManifestacao = (tmSemManifestacao, tmConfirmacaoOperacao, tmDesconhecimentoOperacao, tmOperacaoNaoRealizada, tmCienciaOperacao);
  TipoResumoDFe = (trNFe, trEvento);

  Record_exportInd = record // versao 3.1
    nRE, chNFe, qExport: string;
  end;

  Record_detExport = record // versao 3.1
    nCountExportInd: integer;
    nItem_Det, nDraw: string;
    vExportInd: array of Record_exportInd;
  end;

  Record_ADI = record
    nAdicao, nSeqAdic, cFabricante, vDescDI: string;
    nDraw: string; //versao 3.1
  end;

  Record_DI = record
    nCountADI: Integer;
    nItemDI, nDI, dDI, xLocDesemb, UFDesemb, dDesemb, cExportador: string;
    tpViaTransp, vAFRMM, tpIntermedio, CNPJ, UFTerceiro: string; //versao 3.1
    vADI: array of Record_ADI;
  end;

  Record_Item_DI = record
    nCountDI, nCountDetExport: Integer;
    vDI: array of Record_DI;
    vDetExport: array of Record_detExport;
  end;

  //TClassNfSe = class;
  TClassNfVenda = class;

  TAuxiliar = class
  public
    class function GetParam(AParam: string; AList: TStrings): string;
    class function ConvertStrToDateTime(Value: string; AFormat: string): TDateTime;
    class function GetRegistry(Aclass, Aname, Adefault: string): string; overload;
    class function apenasLetras(Atexto: string; ACaseSensitive: Boolean = True): string;
    class procedure SetRegistry(Aclass, Aname, Avalue: string);  overload;
    class function GetRegistry(Aclass, Aname: string; Adefault: Integer): Integer; overload;
    class procedure SetRegistry(Aclass, Aname: string; Avalue: Integer); overload;
  end;

  TClassItNfGeral= class(TDataSet_OOP_DX)
  private
  public
//    constructor create;
//    destructor destroy; override;
    function Abreitems(nnf: integer;codempresa: integer;serie: string;comveic: string): boolean; virtual; abstract;//serie = cod_nf
    function proximoitem(comveic: string): boolean; virtual; abstract;
    var
      vitem: string;
      vcfopit: string;
      vcodit: string;
      vdescprod: string;
      vqtde: string;
      vunid: string;
      vvaltotit: string;
      vvaluntit: string;
      vqtdtrib: string;
      vunidtrib: string;
      vluntrib: string;
      vinfAdicionalit: string;
      vcst: string;
      vmoddet: string;
      valiqit: string;
      valicmsit: string;
      valbaseicmsit: string;
      valipiit: string;
      vbaseipi,valiqipi,vcstipi: string;
      vBICMSUB_VND: string;
      vICMSUB_VND: string;
      vPERC_RED_PROD: string;
      vDESCONTO_PROD: string;
      vNCM: string;
      vPERC_SUBSTTR_IT: string; // Este campo deverá ter uma tabela a parte por estado
      vFRETE_IT: string;
      vSEGURO_IT: string;
      vO_DESP_IT: string;
      vALIQ_ICMSUB: string; //  Esta aliquota estou considerando que é a usada para operações interna do estado de destino
      vBASEICMANT_SUB_IT: string;
      vICMANT_SUB_IT: string;
      vchassi: string;
      vccor: string; // Código da Cor pelo RENAVAM
      vxcor: string;
      vpot: string;
      vcm3: string;
      vpesol: string;
      vpesob: string;
      vnserie: string;
      vtpcomb: string;
      vnmotor: string;
      vcmkg: string;
      vdist: string;
      vrenavam: string;
      vanomod: string;
      vanofab: string;
      vtppint: string;
      vtpveic: string;
      vespecie: string;
      vvin: string;
      vcondveic: string;
      vcmod: string;
      vdemo: string;
      vmtusadas: string;
      vncomando: string;
      vCSOSN: string;
      vorig: string;
      vmodBCST,vpCredSN,vvCredICMSSN: string;
      vpRedBCST: string;
      vLotacao,vtprest: string;
      vINDTOT,vcodcordenatran: string;
      vtipitem,vcodservlc116,vcodtrib: string;
      vcstpis,vbcpis,vppis,vpis,vqbcprodpis,vvaliqpropis: string;
      vcstcofins,vbccofins,vpcofins,vcofins,vqbcprodcofins,vvaliqcofins: string;
      vDI_Item: Record_Item_DI;
      vBC_II, vDespAdu_II, vII_II, vIOF_II: string;
      vcProdANP, vCODIF, vqTemp, vUFCons, vCIDE_qBCProd, vCIDE_vAliqProd, vCIDE_vCIDE, vSiglaUFCliente: string;
      cEAN: string;
      vTotTrib: string;
      xped_compra, nitemped_compra: string;
      nfci: string;
      vNFE_PDEVOL, vNFE_VIPIDEVOL, vCOMB_PMIXGN, vNFE_NRECOPI, vNVE: string; // versao 3.1
      vCENQ, vCEST, vVBCUFDEST, vPFCPUFDEST, vPICMSUFDEST, vPICMSINTER, vPICMSINTERPART,
        vVFCPUFDEST, vVICMSUFDEST, vVICMSUFREMET: string;

//    function abrevazio: boolean; override;
//    function limpadadosnfe: boolean; override;
  end;

  Testado = class(TDataSet_OOP_DX)
  public
    constructor create;
    destructor destroy; override;
    procedure abrirestados(vuf: string);
  end;

  TClassItNfVenda= class(TClassItNfGeral)
  private
    function ValidaEAN(CodBar: string): Boolean;
    procedure getDadosExportacaoImportacao;
  public
    constructor create;
    destructor destroy; override;
    function Abreitems(nnf: integer;codempresa: integer;serie: string;comveic: string): boolean; override; // seire = cod_nf
    function proximoitem(comveic: string): boolean; override;
//    function abrevazio: boolean; override;
//    function limpadadosnfe: boolean; override;
  end;

  TClassGClFOR = class(TDataSet_OOP_DX)
  private
  public
//    constructor create;
//    destructor destroy; override;
    function BuscaClifor(CodClifor: integer;codempresa: integer): boolean; virtual; abstract;
    var
     vcod_estado: string;
     vcod_cidade: string;
     vcnpj: string;
     vcep: string;
     vlogr: string;
     vnumero: string;
     vcompl: string;
     vbairro: string;
     vdesccidade: string;
     vdescuf: string;
     vfone: string;
     vie: string;
     vrazao: string;
     vcodpais: string;
     vdescpais: string;
     vemail: string;
     vnomecampodataset: string;
     vSiglaEstado: string;
     // versao 3.1
     vNFE_AUTXML: string;
     vNFE_INDIEDEST: string;
     vNFE_IDESTRANGEIRO: string;

//      tDest[12] := '1058'; //<Codigo Pais>
//      tDest[13] := 'Brasil'; //<Pais>

//    function abrevazio: boolean; override;
//    function limpadadosnfe: boolean; override;
  end;


  TClassEvento = class(TDataSet_OOP_DX)
  private
    FAOwer: TObject;
  public
    constructor create(AOwer: TObject);
//    destructor destroy; override;
    function GravaRetornoEvento(vAcbrNFE: TACBrNFe;idlote: Integer;vflagevento: integer): boolean; overload;
    function GravaRetornoEvento(ATRetEventoNFe, ANotaFiscal: TObject; AShowRetorno: Boolean): Boolean; overload;
    function buscaEvento(idlote: Integer;cod_empresa: integer): boolean;
    function ImprimirEventoEPEC(ACodNF, ACodEmpresa: integer; ATACBrNFe: TComponent): boolean;
    function GerarPDFEventoEPEC(ATACBrNFe: TComponent; APath: string): Boolean;
    var
     chavenfe,vserie,vprotocolo,vnumnf: string;
     TipoEvento,vnseqevento: Integer;
     codigoEvento: string;


  end;

  TClssEmpresa = class(TDataSet_OOP_DX)
  public
   constructor create;
   destructor destroy; override;
   function dadosGNfe: boolean;
   function registraultimoNSU(vultnsu:string): boolean;
   function Gravacontingencia(vmotivo,vtipemiss: string): boolean;
   function TpEmisUFToStr(pUF: string): TpcnTipoEmissao;
   var
    codempresa: integer;
    vNFE_CAMINHO_CERT: string;
    vNFE_SENHA__CERT: string;
    vNFE_NUMSERIE_CERT: string;
    vNFE_DANFE_TIPO: string;
    vNFE_DANFE_FOREMISS: string;
    vNFE_LOGOMARCA: string;
    vNFE_LOGPATH: string;
    vWEBSERV_UF: string;
    vWEBSERV_AMBIENTE: string;
    vWEBSERV_VISUALIZAR: string;
    vDIAS_AVISO: integer;
    vNFE_ENDRELRAVE: string;
    vNFE_ENDERECOPDF: string;
    vPORTA_SMTP: integer;
    vENVIAEMAILNFE: string;
    vASSUNTO_NFE: string;
    vEMAIL_USASSL: string;
    vEMAIL_USATLS: string;
    vEMAIL_SENHA: string;
    vMENSAGEM_NFE: AnsiString;
    vIBGE_COD_CIDADE: integer;
    vIBGE_CODIGO_UF: integer;
    vMODELO_NF: string;
    vSERIE_SCAN: integer;
    vSMTP_EMP: string;
    vLOGIN_EMP: string;
    VSUB_SERIE: string;
    vSIGLA_UFemp: string;
    vSIGLA_UF: string;
    vxJust,vdhCont: string;
    vqtdenfpend: string;
    vqtdependemdias: string;
    vusdataserv: string;
    vSISTEMA: string;
  end;

  TClassNfe = class(TDataSet_OOP_DX)
  private
    itx: integer;
    para: string;
    FSendMail: Boolean;
    FErrorSendEmail: Boolean;
    FSilentMode: Boolean;
    FSendBoleto: Boolean;
    FImprimir: Boolean;
//    auxstrc: ANSIstring;
//    vtipo: array[1..14] of integer;
//    vquant: array[1..14] of integer;
//    auxstr: string[126];
//    vcst: array of array of shortstring;
//    function StrZero(Num, Tam: Integer): string;
//    function TZero(valor: currency; tam: integer): string;
//  vtpopServ: string;
    procedure lerConfigIni;
  protected
    function getini(Asection, Aident, Adefault: string): string;
  public
    constructor create;
    destructor destroy; override;
    function Space(Tam: integer): string;
    procedure ExecSQL(SQL: string; Query: TIbQuery);
//    function conectaBanco: boolean;
//    function DesconectaBanco: boolean;
    function CancelaNFEint(nnf: integer;vjust: string): boolean; virtual; abstract;
    function GravaRetNFE(vAcbrNFE: TACBrNFe;vtipo: smallint;vlote: Integer): boolean;
    function abrevazio: boolean; virtual; abstract;
    function limpadadosnfe: boolean; virtual;abstract;
    function ObterItens(vnumnota: integer;codempresa: integer;serie: string;vcomveic: string): boolean; virtual;abstract;
    function proximaNF: boolean; virtual; abstract;
    function pesquisaNF(vnum: integer;codempresa: integer;vsub: string): boolean; virtual; abstract;
    function obtemdadostotaisnf: boolean; virtual; abstract;
    function inutilizaNFe(vnumnfini: integer;vnumnffin: integer;codempresa: integer;nsubserie: string): boolean;virtual;abstract;
    function mudarNFSCANouSVC(pTipo:string): boolean;virtual;abstract;
    function marcaSel: boolean; virtual; abstract;
    function obtemlote: integer;
    function obtemnumeroNF: boolean;virtual;abstract;
    function ConsultaCamposNF(tabela, valorConsulta, Campo, condicao, ordem: string; constante:
      boolean; codemp: string): boolean; overload; virtual; abstract;
    function ConsultaCamposNF(tabela, Campo, ordem, dataIni, dataFim: string; codemp: string):
      boolean; overload; virtual;abstract;
    function PesqPros(vGravarAuditoria: boolean;vprocesso: string;vdados: string): boolean;
    procedure MontaLinha(Pos: Integer; const Dado: string);
    procedure limpaLinha(const dado: string);
    function verificabol: boolean; virtual;abstract;
    function verificanfepend: boolean;
    function validarEnvioComandoFechado: Boolean;
    function verlocalretent: boolean; virtual;abstract;
    function verificacuponsref: boolean;virtual;abstract;
    function verificadestemail(vtp: integer;vdadosnf: string): boolean; overload;
    function verificadestemail(vtp: integer;vdadosnf: string; var AComBoletos: Boolean): boolean; overload;
    function enviaEmail(vacbrNFEemail: TACBrNFe;vtipo: smallint;vitx: integer;vnumdpec: string; AAnexos: TStrings = nil) : boolean;
    function GetListaEmails(Aemails: string): TStrings;
    function getArquivosBoletoParaAnexos(AidDoc: Integer = 0): TStrings; virtual; abstract;

    procedure GravarNFDestinadas(vacbrNFEDestinadas: TACBrNFe; indice, codempresa: Integer; vtpop: TipoResumoDFe);
    function buscaNFDestinada(vidlote: integer;codempresa: integer;vchave: PWideChar): boolean;
    function GravarRetornoConsultaSEFAZ(vacbrNFEDestinadas: TACBrNFe): boolean;
    function GravarRetornoEnvioEvento(vacbrNFEDestinadas: TACBrNFe; ALoteId: Integer): boolean;
    function TipoEventoToTipoManifestacao(ATipoEventoDFe:TpcnTpEvento): TipoManifestacao;
    function sitconftotpevento(vsitconf: integer): TpcnTpEvento;

    function AddNotaFiscalToACBrNFe(CodNF, ATpEmis: Integer; ANFe: TACBrNFe): Boolean; virtual; abstract;

    property SilentMode: Boolean read FSilentMode write FSilentMode default False;
    property SendMail: Boolean read FSendMail write FSendMail default True;
    property SendBoleto: Boolean read FSendBoleto write FSendBoleto default True;
    property Imprimir: Boolean read FImprimir write FImprimir default True;
    property ErrorSendEmail: Boolean read FErrorSendEmail write FErrorSendEmail;
//    function
    var
     cadempresa:TClssEmpresa;
     caditens: TClassItNfGeral;
     cadclfor: TClassGClFOR;
     cadCCe: TClassEvento;
     datasetnfdest: TClientDataSet;
     vfversao,dtini, DtFinal,dtinv: string;
     vcanc: integer;
     vccomveic: string;

//     vtransacao: TIBTransaction;
     vprogresso: TProgressBar;
     vtipoacao, vtiporegistro: TLabel;
     vqtdig,vcodifica: string;
     // dados do retorno da NFe
     vRESULTADO_ENVIO: string;
     vDATA_AUTORIZACAO: Tdate;
     vSITUACAO_NFE: string;
     vDIGEST: string;
     vPROTOCOLO: string;
     vCODIGOERRO: string;
     vDESCRICAOERRO: string;
     vTEMPORESPOSTA: integer;
     vHORA_ENVIO: Ttime;
     vTIPONFE:	string;
     vDANFEIMPRESSO: string;
     vDATAHORA_ENVIO: TdateTime;
     vCHAVE_NFE: string;
     vN_FORM_SEGURANCA: integer;
     vfinNFE:string;
     vrefNFE: string;
     vListRefNFe: array of shortstring;
     vqtdprod: string;
     vbasicm: string;
     vvalicm: string;
     vvalnota: string;
     vvalprod: string;
     vIRRF_VND: string;
     vBCST: string;
     vST: string;
     vFrete: string;
     vSeg: string;
     vDesc: string;
     vIPI: string;
     vOutro: string;
     vNatop: string;
     vDescNatop: string;
     VNUMNOTA: string;
     VCNFE: string;
     vJUST_CANCELAMENTO: string;
     vCondicaoPAG: string;
     vtemveic: string;
     vnatNF: string;
     VCODCLIFOR: integer;
     vinfadc: String;
     AuxStrP: Ansistring;
     // Dados do Transportador...
     vtransRazao: string;
     vtransantt: string;
     vtransPlacaVeic: string;
     vtransUF: string;
     vtranscnpj: string;
     vtransendereco: string;
     vtransmunicipio: string;
     vtransuftrans: string;
     vtransIE: string;
     vtransQvol: string;
     vtransEspecie: string;
     vtransMarca: string;
     vtransNVol: string;
     vtransPesoB: string;
     vtranspesoL: string;
     vtranspfrc: string;
     vndoc: array of string;
     vndtvenc: array of Tdate;
     vnval: array of string;
     vdataensaid: string;
     vdatemiss: string;
     vnivelus: integer;
     vusuario: string;
     vcmsg,vxmsg: string;
     vtpnfe: string;
     vxJust,vdhCont: string;
     vmodecf: array of string;
     vnumecf: array of string;
     vcooecf: array of string;
     vbcserv,vserv,valiqiss: string;
     vpis,vcofins: string;
     vII_II: string;
     vExporta_UFEmbarq: string;
     vExporta_xLocEmbarq: string;
     vExporta_xLocDespacho: string;
     vTotTrib: string;

     //versao 3.1
     vNFE_INDPRES: string;
     vNFE_IDDEST: string;
     vIndFinal: string;
     vFCPUFDest, vICMSUFDest, vICMSUFRemet: string;
//    vsrec, vlVnd, vlrec: Currency;
//    qtdvnd: Integer;

//    vHistRec: THistRec;
  end;


  TClassCliente = class(TClassGClFOR)
  public
    constructor create;
    destructor destroy; override;
    function BuscaClifor(CodClifor: integer;codempresa: integer): boolean; override;
  end;

//  TClassFornecedor = class(TClassGClFOR)
//  public
//    constructor create;
//    destructor destroy; override;
//    function BuscaClifor(CodClifor: integer;codempresa: integer): boolean; override;
//  end;
  TDetImportaItem = class
  private
    Fitem: TNotafiscal_item_class;
    Fprod: TProdutos_class;
    Feans: TProdutos_classList;
    Fouts: TProdutos_classList;
    Fcprod: string;
    Fchave_nfe: string;
    Fprod_vinc: string;
    Ficms_orig: string;
    Funid_prin: string;
  public
    destructor Destroy; override;

    property item: TNotafiscal_item_class read Fitem write Fitem;
    property prod: TProdutos_class        read Fprod write Fprod;
    property eans: TProdutos_classList    read Feans write Feans;
    property outs: TProdutos_classList    read Fouts write Fouts;
    property cprod: string                read Fcprod write Fcprod;
    property chave_nfe: string            read Fchave_nfe write Fchave_nfe;
    property prod_vinc: string            read Fprod_vinc write Fprod_vinc;
    property icms_orig: string            read Ficms_orig write Ficms_orig;
    property unid_prin: string            read Funid_prin write Funid_prin;
  end;

  TVinculoProdutos = class
  private
    FOwner: TClassNfVenda;

    Fcod_empresa: Integer;
    Fcod_cliente: Integer;
    Fcpfcgc: string;
    FbuscaNoProd: Boolean;
    Fdetalhes: TObjectList<TDetImportaItem>;
    FconsProd: TIBQuery;

    procedure checarEstrutura;

  public
    buscasTmp: TIBQuery;
    constructor Create(AOwner: TClassNfVenda);
    destructor Destroy; override;

    function NewDetItem(Acprod, Acean: string): TDetImportaItem;
    function ValidarVinculos(pClassNfVenda: TClassNfVenda; pDigitosProd: Integer;
      pUsarCodigoSequencialProduto: string; pCadProdAberto: string;
      pAUsuario: string;  pNivel: Integer; pCodCliente: Integer; pCNPJ: string;
      pUFDest: string; pSimplesNacional: boolean; pChaveAcesso: string): string;
    function consultarProduto(Acampo, Acondicao, Atexto: string): Boolean;
    function Vincular(Anitem: Integer): Boolean;
    function SetarUnidadePrincipal(Anitem: Integer; undSel: string): Boolean;
    function SetarUnidadePrincipalParaTodos(undSel: string): Boolean;
    function SetarUnidadePrincipalTodosFaltantes(undSel: string): Boolean;
    function SetarUnidadePrincipalTodosFaltantesMesmaXml(): Boolean;
    function DesVincular(Anitem, AindexProd: Integer): Boolean;
    function CadastrarProdutoXML(vdataset: TClientDataSet; vdatasetCodigoEAN: TClientDataSet;
      pCadTodosItens: Boolean = False; pCadUnicoProdCodigo: Boolean = False): boolean;
    function RemoverVinculoProdutoXML(vdataset: TClientDataSet): boolean;
    procedure MostrarMensagem(vmens: string);

    function consultarProdutoXML(ADtSet: TDataSet; Acampo, Atexto: string): Boolean;
    function consultarProdutoTmp(ADtSet: TDataSet; Acampo, Acondicao, Atexto: string): Boolean;
    procedure _marcaDesmarcaLinhaProdutoXML(ADtSet: TDataSet);
    procedure _marcaDesmarcaTodosProdutosXML(ADtSet: TDataSet; pMarcar: boolean = true);

    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property cpfcgc: string read Fcpfcgc write Fcpfcgc;
    property buscaNoProd: Boolean read FbuscaNoProd write FbuscaNoProd;
    property detalhes: TObjectList<TDetImportaItem> read Fdetalhes write Fdetalhes;
    property consProd: TIBQuery read FconsProd write FconsProd;
  var
    vDigitosProd: Integer;
    vUsarCodigoSequencialProduto: string;
    vCadProdAberto: string;
    vUsuario: string;
    vNivel: Integer;
    vCodCliente: Integer;
    vCNPJ: string;
    vUFDest: string;
    vSimplesNacional: boolean;
    vClassNfVenda: TClassNfe;
  end;

  TClassNfVenda = class(TClassNfe)
  private
    buscaadc: TIBQuery;

    procedure CopiarQuery(var AQuery, ACopia: TIBQuery);
    function Split(AValue: string; ASeparator: string; AIgnoreEmpty, AIgnoreDuplicates: Boolean): TStrings;
    function GetNotasReferenciadas(ACodNF, ANumNFCompl: Integer; ASerieNFCompl: string): TObjectList;
    function GetDest(AValue: TObject; ACodCliente: Integer): TObject;
    function GetRetirada(AValue: TObject; ACodNF: Integer): TObject;
    function GetEntrega(AValue: TObject; ACodNF: Integer): TObject;
    function GetAutXML(ACodCliente: Integer): TObjectList;
    function GetDet(ACodNF, ACRT: Integer; var AWriteIcmsUFDest: Boolean; ACombUFCons: string): TObjectList;
    function GetDI(ACodNF, ANItem: Integer): TObjectList;
    function GetADI(ACodNF, ANItem, ANitemDI: Integer): TObjectList;
    function GetdetExport(ACodNF, ANItem: Integer): TObjectList;
    function GetveicProd(AValue: TObject; ACodNF, ANItem: Integer; var AinfAdProdVeic, AxProd: string): TObject;
    function GetTransporta(AValue: TObject; ACodTransporta: Integer): TObject;
    function GetDup(ACodNF: Integer): TObjectList;
  public
    constructor create;
    destructor destroy; override;
    function CancelaNFEint(nnf: integer;vjust: string): boolean; override;
    function abrevazio: boolean; override;
    function limpadadosnfe: boolean; override;
    function ObterItens(vnumnota: integer;codempresa: integer;serie: string;vcomveic: string): boolean; override;
    function proximaNF: boolean; override;
    function pesquisaNF(vnum: integer;codempresa: integer;vsub: string): boolean; override;
    function obtemdadostotaisnf: boolean; override;
    function mudarNFSCANouSVC(pTipo:string): boolean;override;
    function marcaSel: boolean; override;
    function inutilizaNFe(vnumnfini: integer;vnumnffin: integer;codempresa: integer;nsubserie: string): boolean;override;
    function obtemnumeroNF: boolean;override;
    function verificabol: boolean; override;
    function getArquivosBoletoParaAnexos(AidDoc: Integer = 0): TStrings; override;
    function verlocalretent: boolean; override;
    function verificacuponsref: Boolean; override;

    function CalcularBCICMSSimplesNacional(DetItem: TDetCollectionItem): Currency;
    function GetVersaoProc: string;
    function AddNotaFiscalToACBrNFe(CodNF, ATpEmis: Integer; ANFe: TACBrNFe): Boolean; override;
    function AddNFeInDBFromXML(AListParams: string): string;
    function AddNFeInDBFromXMLSaida(AListParams: string): string;
  end;
  (*
  TClasstribcid = class
  private
    Ok : Boolean;
    fPathSh, fPathSis : string;
    FibgeId: string;
    function getMd5File(AFileName: string): string;
    function GetPathSchemas: string;
  protected
    vRemoverEnterOBS_OS: Boolean;
    procedure localizarArquivos(pPath, pFilter: string; pLista: TStrings);

    property PathSh: string read fPathSh write fPathSh;
  public
    constructor create;
    destructor destroy; override;
    procedure copiarschemas(tpAmb: string); virtual;
    function montartxtrps(vnotanfs: TClassNfe): string; virtual; abstract;
    function montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;vnotanfs: TClassNfe): boolean; virtual;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; virtual; abstract;
    procedure HandleValuesBeforePrint(var nfse:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ; nfs: TClassNfe); virtual;

    property ibgeId: string read FibgeId write FibgeId;
    property PathSchemas: string read GetPathSchemas;
//   var
//    vden: AnsiString;
  end;

  TClasstribcidGV = class(TClasstribcid)
  private
    procedure copiarschemas(tpAmb: string); override;
  public
    constructor create;
    destructor destroy; override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
  end;

  TClasstribcidBH = class(TClasstribcid)
  private
    procedure copiarschemas(tpAmb: string); override;
  public
    constructor create;
    destructor destroy; override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
  end;

  TClasstribcidTO = class(TClasstribcid)
  private
    procedure copiarschemas(tpAmb: string); override;
  public
    constructor create;
    destructor destroy; override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
  end;

  TClassNFSeAbaco = class(TClasstribcid)
  private
    procedure copiarschemas(tpAmb: string); override;
  public
    constructor create;
    destructor destroy; override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
  end;

  TClassNFSeDefault = class(TClasstribcid)
  public
    constructor create(_ibgeId: string);
    destructor destroy; override;
    procedure copiarschemas(tpAmb: string); override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
    procedure HandleValuesBeforePrint(var nfse:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ; nfs: TClassNfe); override;
  end;

  TAuxItensRateio = class
  private
    Fcod_empresa   : Integer;
    Fvalor_b_nfse  : Extended;
    Fvalor_nfse    : Extended;
    Fissret_servico: Extended;
    Fcod_servico   : Integer;
    Fnitem         : Integer;
    Fnped          : Integer;
    Ftipo          : string;
    Fcodigo_nop    : Double;
    Faliq_iss      : Extended;
    Fbase_rateio   : Double;
  public
    property nped            : Integer  read Fnped             write Fnped;
    property tipo            : string   read Ftipo             write Ftipo;
    property cod_servico     : Integer  read Fcod_servico      write Fcod_servico;
    property nitem           : Integer  read Fnitem            write Fnitem;
    property cod_empresa     : Integer  read Fcod_empresa      write Fcod_empresa;
    property codigo_nop      : Double   read Fcodigo_nop       write Fcodigo_nop;
    property base_rateio     : Double   read Fbase_rateio      write Fbase_rateio;
    property valor_b_nfse    : Extended read Fvalor_b_nfse     write Fvalor_b_nfse;
    property aliq_iss        : Extended read Faliq_iss         write Faliq_iss;
    property valor_nfse      : Extended read Fvalor_nfse       write Fvalor_nfse;
    property issret_servico  : Extended read Fissret_servico   write Fissret_servico;
  end;

  TCollection_DocNFSe = class
  private
    Frps: tcDescricaoRps;
    Fcan_ret: tcRetornoNota;
    Faut_nfse: tcDadosNota;
    Faut_ret: tcRetornoNota;
    Fcan_nfse: tcDadosNota;
    Frps_resc: tcDescricaoRps;
    Famb_prod: Boolean;
    Fdhenvio: string;
    Fsit_orig: string;
  public
    property amb_prod: Boolean        read Famb_prod write Famb_prod default False;
    property dhenvio : string         read Fdhenvio  write Fdhenvio;
    property sit_orig: string         read Fsit_orig write Fsit_orig;

    property rps     : tcDescricaoRps read Frps      write Frps;
    property rps_resc: tcDescricaoRps read Frps_resc write Frps_resc;//rescue
    property aut_ret : tcRetornoNota  read Faut_ret  write Faut_ret;
    property aut_nfse: tcDadosNota    read Faut_nfse write Faut_nfse;
    property can_ret : tcRetornoNota  read Fcan_ret  write Fcan_ret;
    property can_nfse: tcDadosNota    read Fcan_nfse write Fcan_nfse;
  end;

  TClassNfSe = class(TClassNfe)
  private
   buscaadc: TIBQuery;
   buscanfscanc: TIBQuery;
   FArquivo: AnsiString;
   FGrupo: AnsiString;
   vdados: Ansistring;
   nomearq: string;
   nrloterps: string;
   Fprotoloco: string;
   Fdatacanc,FdataEnvio: Tdate;
   FListaErros: widestring;
   FnumeroNFSe: string;
   Fcodigover: string;
   Fdiscrimina: string;
   FDataEmissaoNFSe: TDateTime;
   Foutrasinf: WideString;
   FCodigoCnae: string;
   FRpsNFSe: string;
   nroLote: string;
   vosNFSe: integer;
   vcoderro: string;
   vvalNFSe: string;
   FdataRPS: TDateTime;
   vcidadegertxt: TClasstribcid;
   Fpis,Fcofins,Finss,Fir,Fcsll,FoutrasRet,Fdeducoes,Fdescadc,FdescCond,
   FbaseCalc,Faliq,Fiss,Fissretido,FvalorLiq,Fvalorbruto: real;
   vcodgar: integer;
   listaMensagemAlertaRetorno,listanfse,ListaMensagemRetorno: Widestring;
   listaMensagemRetornoLote: WideString;
   Fnomecliente: String;
   ACBrNFSeDANFSeQR1: {$IFDEF USE_NFSEX} TACBrNFSeXDANFSeRL {$ELSE} TACBrNFSeDANFSeRL {$ENDIF};
   ACBrNFSe1: {$IFDEF USE_NFSEX} TACBrNFSeX {$ELSE} TACBrNFSe {$ENDIF};

   FdocsNFSe: TCollection_DocNFSe;

    procedure NFSeGerarLog(const ALogLine: string; var Tratado: Boolean);
    procedure verificarCaracteresNFSe;
    procedure ClearErrosNFSe();
    function GetErrosNFSe(): string;
    function loadXMLdoBanco(Aid: string): Boolean;
    function GetXMLBanco(id: string): string;
    function GetXmlRPS(rpsId: Integer): string;
    function GetXmlNFSe(nfseId: Integer): string;
    function PostXmlBanco(id, xml: string; query: TIBQuery = nil): Boolean;
    function PostXmlRPS(rpsId: Integer; xml: string; query: TIBQuery = nil): Boolean;
    function PostXmlNFSe(nfseId: Integer; xml: string; query: TIBQuery = nil): Boolean;
  public
    constructor create;
    destructor destroy; override;
    function abrevazio: boolean; override;
    function rExtrai(const nivel: integer; const TagInicio: string; TagFim: string = ''; const item: integer = 1): AnsiString;
    function montarRPSEnv(vos: integer;valiq: real;vnfs_servico: string;vcnae_serv: integer): boolean; overload;
    function montarRPSEnv(vos: string;valiq: real;vnfs_servico: string;vcnae_serv: integer): boolean; overload;
    function montaRPSos(vos: integer;valiq: real;vnfs_servico: string;vcnae_serv: integer): Boolean;
    function validardadosRPS: boolean;
    function iniciaNFSE: boolean;
    function EnviarNFSEAC: boolean;
    function VerificaRetornoAC(metodo: EMetodoNFSe): boolean;
    function sigiss_EnviarNFSE: Boolean;
    function sigiss_CancelarNFSE(ANota: Integer): Boolean;
    function sigiss_ConsultarNFSE(ANota: Integer): Boolean;
    function sigiss_GravarDocEletronico: Boolean;
    function sigiss_LoadDocEletronico(Arps: Integer): TCollection_DocNFSe;
    function sigiss_getUrlWS: string; overload;
    function sigiss_getUrlWS(Aamb_prod: Boolean): string; overload;
    function sigiss_setNFetoACBr(Anfs:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ): Boolean;
    function sigiss_retearDadosRecebidosNFSe(ADadosNota: tcDadosNota; Arps: Integer): Boolean;
    function sigiss_getListRepErrosWS(ADescricaoErros: tcDescricaoErros): TStrings;

    // Métodos para uso da DLL Flexdocs tiveram que ser adaptados para aceitar acbrnfse com o parâmetro vflag
    function enviarRPS(vos: integer): boolean;
    function montarTXT(vflag: integer): boolean;
    function GerarRPS(): boolean;
    Function EnviaWebService(): boolean;
    function VerificaRetornoWs(vmsg: Widestring): boolean;
    function gravaRetornoWs(AXML: string = ''): boolean;
    function gravaProtocoloWs: boolean;

    function verificarerros(componente: EComponente): boolean;
    function Deixarapenasumnivel(venv: string): Widestring;
    function ConsultaDireta(vflag: integer): boolean;
    function ConsultadiretaporRPS(): boolean;
    function consultaPorRPS: Widestring;
    function ConsultaNFSe: WideString;
    function verloteexist: boolean;
    function salvarxmlNFSe: boolean;
    function DetalhesRPS(vtp: integer): boolean;
    function abrirRPSDireto: boolean;
    procedure mostrarmensagem(vmens: string);
    function imprimedireto(vflag: integer): boolean;
    procedure imprimirRPSNFSe(vtp: integer);
    procedure acrescentaendACimp;
    function NFSeregimetrib(vregime: integer): string;
    function NFSNatop(vnatop: integer): string;
    function NFSSimples(vtipo: integer): string;
    function pesqOsNFSe(vnos: integer): boolean;
    function pesqprot(vnos: integer): boolean;
    procedure retirarnprot;
    function salvarPDF: boolean;
    function getArquivosBoletoParaAnexos(AidDoc: Integer = 0): TStrings; override;
    function enviaemailNFSe(vflag: integer; AAnexos: TStrings = nil; AloadXML: Boolean = False): boolean;
    function verificarGARANTIA(vos: integer; pUsarGravado: Boolean = True): boolean;
    procedure zerarAtributos;
    procedure pegadadosRPS;
    function cancelaNFSe(): boolean;
    function cancelawebservice(): boolean;
    function verificapendRPS: boolean;
    function StrTonumero(var ok: boolean; const s: string; const AString:array of string; const AEnumerados: array of variant): variant;
    function trocaPontoporVirgula(valor: string): string;
    function buscaSiglaest(vcodest: integer): string;
    function rCampo(const Tipo: string; TAG: string): variant;
    function TZero(valor: currency; tam: integer): string;
    procedure FrStatusShowNFSe(Sender: TObject); virtual;
    procedure vercidadeNFSe;
    function getDiscriminacaoServicos(ACodRps: Integer; Acodtpservico: string; AValorNF: Double): string;

    property Arquivo: Ansistring read FArquivo write FArquivo;
    property Grupo: Ansistring read FGrupo write FGrupo;
    property protoloco: string read Fprotoloco write Fprotoloco;
    property dataEnvio: Tdate read FdataEnvio write FdataEnvio;
    property datacanc: Tdate read Fdatacanc write Fdatacanc;
    property ListaErros: Widestring read FListaErros write FListaErros;
    property numeroNFSe: string read FnumeroNFSe write FnumeroNFSe;
    property codigover: string read Fcodigover write Fcodigover;
    property discrimina: string read Fdiscrimina write Fdiscrimina;
    property DataEmissaoNFSe: TdateTime read FDataEmissaoNFSe write FDataEmissaoNFSe;
    property outrasinf: Widestring read Foutrasinf write Foutrasinf;
    property CodigoCnae: string read FCodigoCnae write FCodigoCnae;
    property RpsNFSe: string read FRpsNFSe write FRpsNFSe;
    property nomecliente: string read Fnomecliente write Fnomecliente;
    var
     vospesq,vcodigocancnfse,vdesccancnfse: String;
     osselec: TClientDataSet;
     BuscasMnt: TClientDataSet;
     vden: string;
  end;
  *)

  TClassMDFeTipoOperacao = (opMDFeNenhum, opMDFeEnviar, opMDFeImprimir);
  TClassMDFeTipoRetorno = (reMDFeNenhum, reMDFeEnvio, reMDFeConsulta);
  TClassMDFeTipoEmail = (emMDFeNenhum, emMDFeEnvioDoc, emMDFeConultaDoc, emMDFeEvento);

  TClassMDFe = class(TDataSet_OOP_DX)
  private
    itx: integer;
    para: string;
    buscaadc: TIBQuery;
  public
    constructor create;
    destructor destroy; override;
//     procedure ExecSQL(SQL: string; Query: TIbQuery);
//    function conectaBanco: boolean; // pode ficar na classe pai
//    function DesconectaBanco: boolean; // pode ficar na classe pai
    function buscaMDFE(vnumMDF: integer;vnumLOTEMDF: integer): boolean; //O campo vnumlote se fornecido fara a DLL Pesquisar um lote de MDFe
    function buscaMDFECONSULTA(vnumMDF: integer;vnumLOTEMDF: integer): boolean; //O campo vnumlote se fornecido fara a DLL Pesquisar um lote de MDFe
    function IniciaMDFE: boolean; // Inicia configurações do MDFE para todas as operações
    function EnviarMDFE(vnumMDF: integer;codempresa: integer;vnumlote: integer; AOperacao: TClassMDFeTipoOperacao): string; // O campo vnumlote se fornecido fara a DLL enviar um lote de MDFe
    function GravaRetMDFE(vAcbrMDFE: TACBrMDFe; ATipoRetorno: TClassMDFeTipoRetorno; vlote: Integer): boolean;
    function ConsultarMDFE(vnummdfe,vnumlote: integer): boolean; // Consulta será feita pelo carregamento do xml
    function EnviaEventoMDFEint(nmdfe: integer;vnumlote: integer): boolean; // O Código do Evento define o tipo de evento(CANCELAMENTO/ENCERRAMENTO)
    function GravaRetornoEventoMDFE(vAcbrMDFE: TACBrMDFe;idlote: Integer): boolean;
    function EncerrarPorRejeicao609(): Boolean;
    function ImprimirMDFE(vchaveMDFE: string): boolean;
    function ImprimirEventoMDFE(vnmdfe: integer): boolean; // Acrescentar na frente da chave para os evento: procEventoMDFe
    function verificarStatusWeb(verresultado: PWideChar): string;
//    function abrevazio: boolean;
    function verificaMDFepend: boolean;
    function verificadestemail(vtp: integer;vdadosnf: string): boolean;
    function enviaEmailMDFE(vAcbrMDFEemail: TACBrMDFe; ATipoEmail: TClassMDFeTipoEmail; vitx: integer; ACodigoEvento: string) : boolean;
    var
     cadempresa:TClssEmpresa;
     cadclfor: TClassGClFOR;

     vfversao,dtini, DtFinal,dtinv: string;
     vcanc: integer;
     vccomveic,vcaminho: string;
//     vbanco: Tibdatabase;
//     vtransacao: TIBTransaction;
     vprogresso: TProgressBar;
     vtipoacao, vtiporegistro: TLabel;
     vqtdig,vcodifica: string;
     VCODCLIFOR: integer;
     vok: boolean;
     vcmsg,vxmsg: string;
     vSITUACAO_MDFE: string;
     vTIPONFE: string;
     vDESCRICAOERRO: string;
     vflagevento: integer;
     vcodevento: string;
     vusuario: string;
     ACBrMDFe1: TACBrMDFe;
     DAMDFE: TACBrMDFeDAMDFeRL;
     vseqevento: string;
     vrespevento: boolean;
     vchaveimp: string;
  end;



implementation

uses
  SysUtils, UDtmHwNFE, Windows, ACBrNFeWebServices, ACBrNFeNotasFiscais,
  uPesPros, UstatusNFSe, ACBrMDFe.Conversao,
  UmostrarErros,
  {pcnRetEnvEventoNFe, pcnEventoNFe,}
  Variants, ACBrMDFeWebServices, ACBrMDFeManifestos,
  ACBrMDFeConfiguracoes, {pmdfeRetConsSitMDFe, pmdfeRetEnvEventoMDFe,}
  pnfsEnvLoteRpsResposta, ACBrNFSeWebServices,
  ACBrNFSeNotasFiscais, pnfsCancNfseResposta,
  pcnRetDistDFeInt, Math, ACBrMail, ACBrNFeConfiguracoes, ACBrDFeConfiguracoes, pcnConversaoNFe, pnfsLerListaNFSe,
  ACBrDFe, ACBrDFeSSL, ACBRUtil, MD5, {pmdfeEventoMDFe, }ACBrNFeDANFeRLClass,
  {pcnEnvEventoNFe, }StrUtils, pcnAuxiliar, REST.Json, uEmail, System.Win.Registry,
  uVinculoProdutos, ACBrDFeDANFeReport, System.TypInfo, config_sistema_class, hw_utils, hw_win_utils,
  {$IFDEF USE_NFSEX}
   ACBrNFSeXWebserviceBase,
   ACBrNFSeXWebservicesResponse,
   ACBrNFSeXProviderManager,
   BHISS.GravarXml,
  {$ENDIF}
  HelperDFe,
  ACBrNFe.RetEnvEvento, TributosDFePersistentHandler, ContainerDFeUnit, TributoDFeContextEtdUnit,
  TributosDFeFactoryUnit, TributoDFeOrigemEnumUnit, SetupDFeUnit;

const
  TipoManifestacaoStr: array[TipoManifestacao] of string = (
    'Sem manifestação do Destinatário',
    'Confirmada Operação',
    'Desconhecida',
    'Operação não Realizada',
    'Ciência');

function gravarAuditoria(usuario, usuariogerenteliberou,
  processo, acao, mensagem, tabela, codigotabmov, cod_empresa: pchar): boolean; stdcall; external 'auditoria.dll';

{ TClassNfe }
(*
function TClassNFSe.cancelaNFSe(): boolean;
var
 valornfse: currency;
 vcodver: string;
 ASize, ANumOS: Integer;
 ADataEmissaoNFSe: TDateTime;
 buscasTemp: TIBQuery;
  AFinanceiroUnificado: Boolean;
  AnumeroNFSe: string;
begin
  Result := True;
  try
    if not cancelawebservice() then
      Exit;
    try

      IniciaTransacao;
      mostrarmensagem('Gravando dados do Cancelamento: '+dataSet.FieldByName('NOME_CLIENTE').AsString);
      buscas.close;
      buscas.SQL.Text:='INSERT INTO NFSE_CANCELADAS(NUM_NFSE,COD_RPS,COD_EMPRESA,NOME_CLIENTE,DATA_CANC,'+
      'VALOR_NFSE,SERIE,SUB_SERIE,N_OS,MOTIVO_CANCELAMENTO,EMISSAO_NFSE,COD_CLIENTE,CNAE,CTISS,'+
      'ALIQ_ISS,NFS_SERVICO,ISS_RETIDO,CODIGO_VERWSNFSE) '+
      'VALUES(:NUM,:RPS,:COD_EMPRESA,:NOME_CLIENTE,:DATA_CANC,:VALOR_NFSE,:NSERIE,:SUB_SERIE,:N_OS,'+
      ':MOTIVO_CANCELAMENTO,:EMISSAO_NFSE,:COD_CLIENTE,:CNAE,:CTISS,'+
      ':ALIQ_ISS,:NFS_SERVICO,:ISS_RETIDO,:CODIGO_VERWSNFSE)';
      buscas.ParamByName('NUM').AsString:=dataSet.FieldByName('N_NF').AsString;
      buscas.ParamByName('RPS').AsInteger:=dataSet.FieldByName('COD_RPS').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger:=cadempresa.codempresa;
      buscas.ParamByName('NOME_CLIENTE').AsString:=dataSet.FieldByName('NOME_CLIENTE').AsString;
      if datacanc = 0 then
        buscas.ParamByName('DATA_CANC').AsDate:=Date
      else
        buscas.ParamByName('DATA_CANC').AsDate:=datacanc;
      buscas.ParamByName('NSERIE').AsInteger:=cadempresa.dataSet.FieldByName('SERIE_SERV_NFE').AsInteger;
      buscas.ParamByName('SUB_SERIE').AsInteger:=0;
      buscas.ParamByName('N_OS').AsInteger:=dataSet.FieldByName('NPED').AsInteger;
      ANumOS := dataSet.FieldByName('NPED').AsInteger;

      buscaadc.close;
      buscaadc.sql.text:='SELECT IT.emissao_NFSE,PD.COD_CLIENTE,IT.valor_nfse,IT.CODIGO_VERWSNFSE FROM PEDVENDA_SERV IT INNER JOIN PEDVENDA PD ON IT.NPED = '+
      'PD.NPED AND IT.TIPO = PD.TIPO AND IT.COD_EMPRESA = PD.COD_EMPRESA WHERE IT.COD_RPS = '+
      dataSet.FieldByName('COD_RPS').AsString+' AND IT.COD_EMPRESA = '+
      inttostr(cadempresa.codempresa)+' AND COALESCE(IT.STATUS,'''') <> ''CANCELADO''';
      buscaadc.open;
      buscas.ParamByName('MOTIVO_CANCELAMENTO').asstring:=vdesccancnfse;
      buscas.ParamByName('EMISSAO_NFSE').asstring:=buscaadc.FieldByName('EMISSAO_NFSE').AsString;
      ADataEmissaoNFSe := buscaadc.FieldByName('EMISSAO_NFSE').AsDateTime;
      buscas.ParamByName('COD_CLIENTE').asstring:=buscaadc.FieldByName('COD_CLIENTE').AsString;
      vcodver:=buscaadc.FieldByName('CODIGO_VERWSNFSE').AsString;
      buscaadc.First;
      valornfse:=0;
      while not buscaadc.eof do
      begin
        valornfse:=valornfse+buscaadc.FieldByName('VALOR_NFSE').AsCurrency;
        buscaadc.next;
      end;
      buscas.ParamByName('VALOR_NFSE').AsCurrency:=valornfse;
      //dataSet.FieldByName('valorNF').AsCurrency;
      buscaadc.close;
      buscas.ParamByName('CNAE').asstring:=dataSet.FieldByName('CNAE_SERV').AsString;
      buscas.ParamByName('CTISS').asstring:=dataSet.FieldByName('CTISS').AsString;
      buscas.ParamByName('ALIQ_ISS').asstring:=trocaVirgulaPorPonto(dataSet.FieldByName('ALIQ_ISS').AsString);
      buscas.ParamByName('NFS_SERVICO').asstring:=dataSet.FieldByName('NFS_SERVICO').AsString;
      buscas.ParamByName('ISS_RETIDO').asstring:=dataSet.FieldByName('ISS_RETIDO').AsString;
      buscas.ParamByName('CODIGO_VERWSNFSE').asstring:=vcodver;
      buscas.Prepare;
      buscas.ExecSQL;

      //formas de pagamento e creditos
      try
        AnumeroNFSe := Trim(dataSet.FieldByName('N_NF').AsString);
        if StrToIntDef(AnumeroNFSe, -1) = -1 then
          System.Delete(AnumeroNFSe, 1, Length(AnumeroNFSe) - 6);
        if Length(AnumeroNFSe) > 6 then
          ASize := Length(AnumeroNFSe)
        else
          ASize := 6;

        buscaadc.Close;
        buscaadc.SQL.Text := 'update formpagamento fp set' +
          ' fp.num_nota = null' +
          ', fp.sub_serie = null' +
          ', fp.tip_cnt = ''C'' '+
          ', fp.ndoc = ' +QuotedStr(StrZero(ANumOS, 6))+
          '||substring(fp.ndoc from ' + IntToStr(ASize + 1) + ' for (char_length(fp.ndoc) - ' + IntToStr(ASize) + ' ) )'+
          ' where  (((fp.nrequisicao = ' + dataSet.FieldByName('NPED').AsString +
          ') and fp.tpdocs = ' + QuotedStr('OS') +
          ') or ((fp.rec_numvend = ' + dataSet.FieldByName('NPED').AsString +
          ' and fp.tpdocs <> ''LCS'' and fp.rec_tipvend = ' +
          QuotedStr('OS') +
          '))) and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1' +
          ' and fp.num_nota = :num_nota' + //IntToStr(dataSet.FieldByName('N_NF').AsInteger) +
          ' and fp.sub_serie = ' + IntToStr(YearOf(ADataEmissaoNFSe));
        buscaadc.ParamByName('num_nota').AsInteger := StrToIntDef(AnumeroNFSe, -1);
        buscaadc.ExecSQL;

        if buscaadc.RowsAffected >  0then
        begin
          buscaadc.Close;
          buscaadc.SQL.Text :=
            'select FINANCEIRO_UNIFICADO from empresa'+
            ' where cod_empresa = ' + IntToStr(cadempresa.codEmpresa);
          buscaadc.Open;

          AFinanceiroUnificado := Trim(buscaadc.FieldByName('FINANCEIRO_UNIFICADO').AsString) = 'S';

          buscasTemp := TIBQuery.Create(Application);
          buscasTemp.Database := buscaadc.Database;
          buscasTemp.Transaction := buscaadc.Transaction;
          try
            buscasTemp.Close;
            buscasTemp.SQL.Text :=
              'select n_processamento from formpagamento fp'+
              ' where  fp.nrequisicao = ' + dataSet.FieldByName('NPED').AsString +
              ' and fp.tpdocs = ' + QuotedStr('OS') +
              ' and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1 and fp.tipdoc = ''S2'' and fp.n_processamento > 0';
            buscasTemp.Open;

            while not buscasTemp.Eof do
            begin
              buscaadc.Close;
              buscaadc.SQL.Text :=
                'update controle_creditos cc set cc.n_doc_c = '+QuotedStr(StrZero(ANumOS,6))+
                '||substring(cc.n_doc_c from ' + IntToStr(ASize + 1) + ' for (char_length(cc.n_doc_c) - ' + IntToStr(ASize) + ' ) )' +
                ' where cc.cod_cred = ' + IntToStr(buscasTemp.FieldByName('n_processamento').AsInteger) +
                ' and cc.' + StrUtils.IfThen(AFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + IntToStr(cadempresa.codEmpresa) +
                ' and char_length(cc.n_doc_c) > 5';
              buscaadc.ExecSQL;

              buscasTemp.Next;
            end;
          finally
            FreeAndNil(buscasTemp);
          end;
        end;
      except
      end;
      /// fim das formas de pagamento e update nos creditos

      buscas.close;
      buscas.sql.text:='UPDATE PEDVENDA_SERV SET STATUS_NFSE = NULL,NPROTNFSE = '+
      'NULL,EMISSAO_NFSE = NULL,LOTE_NFSE = NULL,N_NF = NULL,COD_RPS = NULL WHERE COD_RPS = '+
      dataSet.FieldByName('COD_RPS').AsString+' AND COD_EMPRESA = '+inttostr(cadempresa.codempresa)+' AND COALESCE(STATUS,'''') <> ''CANCELADO''';
      buscas.Prepare;
      buscas.ExecSQL;
      buscas.close;
      buscas.sql.text:='UPDATE OS_ITEM_SERV SET STATUS_NFSE = NULL,NPROTNFSE = '+
      'NULL,EMISSAO_NFSE = NULL,LOTE_NFSE = NULL,N_NF = NULL,COD_RPS = NULL WHERE COD_RPS = '+
      dataSet.FieldByName('COD_RPS').AsString+' AND COD_EMPRESA = '+inttostr(cadempresa.codempresa);
      buscas.Prepare;
      buscas.ExecSQL;
      buscaadc.Close;
      {buscaadc.SQL.text:='UPDATE ordem_serv set NUM_NFEEXT=NULL,VALOR_NFEXT=NULL,DATA_NFEXT=NULL'+
      ' where n_os = '+dataset.FieldByName('NPED').AsString+
      ' and cod_empresa = '+IntToStr(cadempresa.codempresa);
      buscaadc.Prepare;
      buscaadc.ExecSQL;}
      buscaadc.Close;
      buscaadc.SQL.text:='UPDATE pedvenda set NUM_NFEEXT=null,VALOR_NFEXT=null,DATA_NFEXT=null'+
      ' where nped = '+dataset.FieldByName('NPED').AsString+
      ' and tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa);
      buscaadc.Prepare;
      buscaadc.ExecSQL;
      CommitaTransacao;

      mostrarmensagem('');

      ShowAtencao('Cancelamento efetuado com sucesso');

    except
      on e: exception do
      begin
        RollBackTransacao;
        mostrarmensagem('');
        Result := False;
        if application.messagebox('Erro ao cancelar o NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
      end;
    end;


  finally
    mostrarmensagem('');
  end;
end;

function TClassNfSe.cancelawebservice(): boolean;
var
  Util: OleVariant;
  msgDados, msgRetWS, msgResultado,  certificado, licenca, usuario, senha, proxy: Widestring;
  ambiente, cResultado: integer;
  versao,cMunicipio, CNPJPrestador, IMPrestador: Widestring;
  NumeroNFSe, CodigoCancelamento, MotivoCancelamento, codigoMunicipio, dataHoraCancelamento, sucesso: Widestring;
  msg:string;
  nfseCancelamento: WideString;
  SoapMsgTx: WideString;
  SoapMsgRx: WideString;
  venv: string;
  varq: string;
  i: integer;
  Aok: Boolean;
  {$IFDEF USE_NFSEX}
    InfCancelamento: TInfCancelamento;
  {$ENDIF}
begin

  Result := False;

  if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
  begin
    sigiss_LoadDocEletronico(dataSet.FieldByName('cod_rps').AsInteger);
    Result := sigiss_CancelarNFSE(dataSet.FieldByName('N_NF').AsInteger);
  end
  else
  begin

    Aok := loadXMLdoBanco('NFSe_RPS' + dataset.FieldByName('cod_rps').AsString.Trim);
    if not Aok then
    begin
      varq := cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe\NFSe\'+trim(dataSet.FieldByName('N_NF').AsString)+ '-nfse.xml';
      if FileExists(Varq) then
      begin
        ACBrNFSe1.NotasFiscais.Clear;
        ACBrNFSe1.NotasFiscais.LoadFromFile(varq);
        Aok := True;
      end;
    end;
    if Aok then
    begin
      try

        {$IFDEF USE_NFSEX}
        ClearErrosNFSe;

        InfCancelamento := TInfCancelamento.Create;
        with InfCancelamento do
        begin
          NumeroNFSe      := ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero;
          SerieNFSe       := ACBrNFSe1.NotasFiscais.Items[0].NFSe.SeriePrestacao;
          ChaveNFSe       := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ChaveAcesso;
          CodCancelamento := vcodigocancnfse;
          //MotCancelamento := Motivo;
          //NumeroLote      := ACBrNFSe1.NotasFiscais.Items[0].NFSe.NumeroLote;
          //NumeroRps       := ACBrNFSe1.NotasFiscais.Items[0].NFSe.rpnuStrToIntDef(NumRps, 0);
          //SerieRps        := SerRps;
          //ValorNFSe       := StrToFloatDef(ValNFSe, 0);
          //CodVerificacao  := CodVerif;
        end;

        ACBrNFSe1.CancelarNFSe(InfCancelamento);

        var errows := GetErrosNFSe().Trim;

        if not errows.IsEmpty then
          raise Exception.Create(errows);

        Result := ACBrNFSe1.WebService.CancelaNFSe.RetCancelamento.Pedido.IdentificacaoNfse.Numero = fstr('N_NF');

//        if not ACBrNFSe1.WebService.CancelaNFSe.Sucesso then
//          raise Exception.Create('Pedido de cancelamento sem sucesso');

//        Result := True;

        {$ELSE}

        ACBrNFSe1.CancelarNFSe(vcodigocancnfse);
        if ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.Pedido.IdentificacaoNfse.Numero = dataSet.FieldByName('N_NF').AsString then
        //    Sucesso <> '1' then
          result:=true
        else
          Result := False;
        {$ENDIF}


      except on E: Exception do
        begin
          {$IFDEF USE_NFSEX}

          if ACBrNFSe1.WebService.CancelaNFSe.Erros.Count > 0 then
          begin
            if MatchText(ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Codigo, ['GOV46']) then
            begin
              ShowAtencao(StrConcat(['Atenção!!!', sLineBreak, sLineBreak,
                                     'Retorno da Prefeitura', sLineBreak, sLineBreak,
                                     'Codigo:', ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Codigo, sLineBreak,
                                     'Mensagem:', ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Descricao, sLineBreak,
                                     'Correção:', ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Correcao]));
              if Application.MessageBox('Atenção, a nota fiscal está cancelada na prefeitura?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) <> IDYES then
                Exit(False)
              else if Application.MessageBox('Deseja mesmo cancelar a nota fiscal no sistema?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                Exit(True)
              else
                Exit(False);
            end
            else if MatchText(ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Codigo, ['E906', 'E79']) then
              Exit(ShowConfirmacao('Atenção, Esta NFSe já está cancelada na PREFEITURA. Deseja proceder com o cancelamento no sistema?') = IDYES);

          end;

          if ShowConfirmacao('Deseja Mostrar Erro?', MB_YESNO + MB_DEFBUTTON2) = IDYES then
             ShowErro(E.Message);

          Result := False;

          {$ELSE}

          if (ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[i].Codigo = 'E906') or
          (ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[i].Codigo = 'E79') then
          begin
           if application.messagebox('Atenção, Esta NFSe já está cancelada na PREFEITURA. Deseja proceder com o cancelamento no sistema?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            result:=true
           else
            Result := False;
          end
          else if (ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[i].Codigo = 'GOV46') then//and
          //        (ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[i].Correcao =
          //        'Este municipio nao permite cancelamento direto de nota fiscal, por favor solicite o cancelamento a fiscalizacao atraves do site') then
          begin
            Application.MessageBox(PChar('Atenção!!!' + #13 + #13 +
              'Retorno da Prefeitura' + #13 + #13 +
              'Codigo:' + ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[i].Codigo + #13 +
              'Mensagem:' + ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[i].Mensagem + #13 +
              'Correção:' + ACBrNFSe1.WebServices.CancNfse.RetCancNFSe.InfCanc.MsgRetorno.Items[i].Correcao), 'Atenção',
              MB_ICONWARNING + MB_OK);
           if Application.MessageBox('Atenção, a nota fiscal está cancelada na prefeitura?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) <> IDYES then
            Result := False
           else if Application.MessageBox('Deseja mesmo cancelar a nota fiscal no sistema?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
             Result := True
           else
             Result := False;
          end
          else
          begin
           if application.messagebox('Deseja Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
             Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
           Result := False;
          end;
        {$ENDIF}
        end;
      end;
    end
    else
     Application.MessageBox(PWideChar('Arquivo XML da NFSe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
  end;
end;
*)

function TClassNfe.buscaNFDestinada(vidlote: integer;codempresa: integer;vchave: PWideChar): boolean;
begin
  Result := False;
  datasetnfdest.Close;
  if vidlote <> 0 then
   datasetnfdest.CommandText:='SELECT * FROM NF_DESTINADAS WHERE COD_EMPRESA = '+inttostr(codempresa)+
   ' and idlote = '+IntToStr(vidlote)
  else
   datasetnfdest.CommandText:='SELECT * FROM NF_DESTINADAS WHERE COD_EMPRESA = '+inttostr(codempresa)+
   ' and chave_nfe = '''+vchave+'''';

  datasetnfdest.Open;
  result:=(not datasetnfdest.IsEmpty);
end;

{function TClassNfe.conectaBanco: boolean;
var
  vPw, vUs: string;
begin
 try
    vUs := string(__getUsuarioFDB);
    vPw := string(__getSenhaFDB);
    vbanco.Connected := false;
    if (Trim(vUs) <> '') then
      vbanco.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
    if (Trim(vPw) <> '') then
      vbanco.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
    vbanco.DatabaseName := vcaminhobanco;
    try
      vbanco.Connected := true;
    except on e: exception do
      begin
        if application.messagebox('Erro ao conectar banco. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(PWideChar(E.Message),Pchar('Error'), MB_OK);
      end;
    end;
  finally
    Result := vbanco.Connected;
  end;
end;}

constructor TClassNfe.create;
begin
vbanco:=TIBDatabase(DtmNFEHW.IbConexaoNFe);
CadEmpresa:=TClssEmpresa.create;
cadCCe:=TClassEvento.create(Self);
datasetnfdest:=TClientDataSet(DtmNFEHW.CdsNFDestinadas);
//cadempresa.dadosGNfe;
//AuxStr := space(126);
//auxstrc := space(144);
vcmsg:='';
vxmsg:='';
lerConfigIni;

  FSilentMode := False;
  FSendMail   := True;
  FSendBoleto := True;
  FImprimir   := True;
end;

{function TClassNfe.DesconectaBanco: boolean;
begin
   try
    vbanco.Connected := false;
  finally
    Result := not vbanco.Connected;
  end;
end;}

destructor TClassNfe.destroy;
begin
//  DesconectaBanco;
  //inherited;
  if vbanco.Connected then
    vbanco.Connected := False;

  if Assigned(CadEmpresa) then
    FreeAndNil(cadempresa);
  if Assigned(cadCCe) then
    FreeAndNil(cadCCe);
end;

function TClassNfe.enviaEmail(vacbrNFEemail:TACBrNFe;vtipo: smallint;vitx: integer;vnumdpec: string;
  AAnexos: TStrings): boolean;
var
 varqc,varq: string;
 mememail: Tmemo;
 vanexomail,Evento: TStringList;
 vusassl: boolean;
 vnum: integer;
 vdadosemail,vtipoEvento,vSeqEvento,vArquivoTeste, AFileName: string;
 vListaDestinat, AXMLFile: TStringList;
  vExisteArquivo, AOk: Boolean;
  I: Integer;
  ACBrMail1: TACBrMail;
  AEmailValido: Boolean;
  AAnexosEnv: TStrings;

  procedure verificarDestinatarios(pDestinatarios: string);
  var
    vTemp: string;
  begin
    vTemp := StringReplace(pDestinatarios, ',', ';', [rfReplaceAll]);

    if vListaDestinat = nil then
      vListaDestinat := TStringList.Create;

    vListaDestinat.Clear;

    if Pos(';', vTemp) = 0 then
      vListaDestinat.Add(Trim(vTemp))
    else
    begin
      while Pos(';', vTemp) > 0 do
      begin
        if Trim(Copy(vTemp, 1, Pos(';', vTemp) - 1)) <> '' then
          vListaDestinat.Add(Trim(Copy(vTemp, 1, Pos(';', vTemp) - 1)));
        vTemp := Copy(vTemp, Pos(';', vTemp) + 1, Length(vTemp));
      end;
      if Trim(vTemp) <> '' then
        vListaDestinat.Add(Trim(vTemp));
    end;
  end;

begin
//Herbert 2.0
  ACBrMail1 := TACBrMail.Create(Application);
    Result := True;
    para:='';
    try
      if vtipo = 1 then
      begin
       try
         vnum:=vacbrNFEemail.NotasFiscais.Items[vitx].NFe.Ide.cNF;
       except
        on e: exception do
        begin
         if application.messagebox('Erro ao obter o numero da NFe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
         vnum:=0;
        end;
       end;
       vdadosemail:='NF: '+strzero(vnum,6)+'-'+vacbrNFEemail.NotasFiscais.Items[vitx].NFe.Dest.xNome;
       para:=vacbrNFEemail.NotasFiscais.Items[vitx].NFe.Dest.Email;
      end
      else
       vdadosemail:='';

      if FSendBoleto then
        if not Assigned(AAnexos) then
          FSendBoleto := False
        else
          FSendBoleto := AAnexos.Count > 0;

      AEmailValido := verificadestemail(vtipo,vdadosemail, FSendBoleto);
      if FSendBoleto then
        AAnexosEnv := AAnexos;

      if AEmailValido then
      begin
        para:=cadclfor.vemail;
        if vtipo = 1 then
        begin
    //      vacbrNFE.NotasFiscais.Clear;
    //      varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
    //      '\Autorizado\'+dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
          //if FileExists(Varq) then
          begin
    //        vacbrNFE.NotasFiscais.LoadFromFile(varq);
            if cadempresa.vEMAIL_USASSL = 'S' then
             vusassl:=true
            else
             vusassl:=false;
    //        if mememail = nil then
             mememail:=tmemo.Create(application);
            Mememail.Text:=cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
        //    Tstrings('Nota Fiscal Eletrônica emitida pela empresa: '+CadNfevenda.cadempresa.dataSet.FieldByName('NOME_EMP').AsString)
            if vnumdpec <> '0' then
              vacbrNFEemail.DANFE.Protocolo := vnumdpec;

            vacbrNFEemail.MAIL := ACBrMail1;
            ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
            ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
            ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
            ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
            ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
            ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
            ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
            ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
            ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
            ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
            verificarDestinatarios(para);
            para := vListaDestinat[0];
            vListaDestinat.Delete(0);
            vacbrNFEemail.NotasFiscais.Items[vitx].EnviarEmail( Para, trim(cadempresa.vASSUNTO_NFE),
              Mememail.Lines
              , True  // Enviar PDF junto
              , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
              , AAnexosEnv); // Lista de anexos - TStrings

//            for I := 0 to vListaDestinat.Count - 1 do
//            vacbrNFEemail.NotasFiscais.Items[vitx].EnviarEmail(trim(cadempresa.vSMTP_EMP),
//            inttostr(cadempresa.vPORTA_SMTP),trim(cadempresa.vLOGIN_EMP),
//            trim(cadempresa.vEMAIL_SENHA),trim(cadempresa.vLOGIN_EMP), vListaDestinat[I],
//            trim(cadempresa.vASSUNTO_NFE),Mememail.Lines,vusassl,true,nil,nil,False,true,cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
            Application.MessageBox(PWideChar('Email de enviado com sucesso'),PWideChar('Aviso'), MB_OK);
            mememail.Free;
            Result := True;
          end;
    //      else
    //       Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
        end
        else
        begin
          if vtipo = 2 then
          begin
            vacbrNFEemail.NotasFiscais.Clear;
            varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
            '\Autorizado\'+dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
            varqc:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\'+dataSet.FieldByName('CHAVE_NFE').AsString+'-ProcCancNFe.xml';
            if not FileExists(Varqc) then
            begin
              Application.MessageBox(PWideChar('Arquivo XML do cancelamento da NFe não encontrado no caminho: '+#13+varqc),PWideChar('Error'), MB_OK);
              Exit;
            end;
            if FileExists(Varq) then
            begin
              vacbrNFEemail.NotasFiscais.LoadFromFile(varq);
              if cadempresa.vEMAIL_USASSL = 'S' then
               vusassl:=true
              else
               vusassl:=false;
      //        if mememail = nil then
               mememail:=tmemo.Create(application);
      //        if vanexomail = nil then
              vanexomail:=TStringList.create;
              vanexomail.Add(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\'+
              dataSet.FieldByName('CHAVE_NFE').AsString+'-ProcCancNFe.xml');
              Mememail.Text:='Relação de NFe(s) Canceladas em anexo...';
      //        cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
          //    Tstrings('Nota Fiscal Eletrônica emitida pela empresa: '+CadNfevenda.cadempresa.dataSet.FieldByName('NOME_EMP').AsString)
              vacbrNFEemail.MAIL := ACBrMail1;
              ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
              ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
              ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
              ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
              ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
              ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
              ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
              ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
              ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
              ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
              verificarDestinatarios(para);
              para := vListaDestinat[0];
              vListaDestinat.Delete(0);
              vacbrNFEemail.NotasFiscais.Items[0].EnviarEmail( Para, trim('NFe(s) Cancelada(s)'),
                Mememail.Lines
                , True  // Enviar PDF junto
                , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                , AAnexosEnv); // Lista de anexos - TStrings

//              for I := 0 to vListaDestinat.Count - 1 do
//              vacbrNFEemail.NotasFiscais.Items[0].EnviarEmail(trim(cadempresa.vSMTP_EMP),
//              inttostr(cadempresa.vPORTA_SMTP),trim(cadempresa.vLOGIN_EMP),
//              trim(cadempresa.vEMAIL_SENHA),trim(cadempresa.vLOGIN_EMP), vListaDestinat[I],
//              trim('NFe(s) Cancelada(s)'),Mememail.Lines,vusassl,False,nil,vanexomail,False,true,cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
              Application.MessageBox(PWideChar('Email de enviado com sucesso'),PWideChar('Aviso'), MB_OK);
              mememail.Free;
              vanexomail.free;
              Result := True;
            end
            else
             Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
          end
          else
          begin
           if vtipo = 3 then
           begin

  //          obtemnumeroNF;
  //          cadclfor.BuscaClifor(VCODCLIFOR,cadempresa.codempresa);
            vacbrNFEemail.NotasFiscais.Clear;
            if vnumdpec <> '0' then
            begin
              vacbrNFEemail.DANFE.Protocolo := vnumdpec;
              varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
              '\'+dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
            end
            else
            varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
            '\Autorizado\'+dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
            if FileExists(Varq) then
            begin
              vacbrNFEemail.NotasFiscais.LoadFromFile(varq);
              if cadempresa.vEMAIL_USASSL = 'S' then
               vusassl:=true
              else
               vusassl:=false;
      //        if mememail = nil then
               mememail:=tmemo.Create(application);
              Mememail.Text:=cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
          //    Tstrings('Nota Fiscal Eletrônica emitida pela empresa: '+CadNfevenda.cadempresa.dataSet.FieldByName('NOME_EMP').AsString)
              vacbrNFEemail.MAIL := ACBrMail1;
              ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
              ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
              ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
              ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
              ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
              ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
              ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
              ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
              ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
              ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
              verificarDestinatarios(para);
              para := vListaDestinat[0];
              vListaDestinat.Delete(0);
              vacbrNFEemail.NotasFiscais.Items[0].EnviarEmail( Para, trim(cadempresa.vASSUNTO_NFE),
                Mememail.Lines
                , True  // Enviar PDF junto
                , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                , AAnexosEnv); // Lista de anexos - TStrings

//              verificarDestinatarios(para);
//              for I := 0 to vListaDestinat.Count - 1 do
//              vacbrNFEemail.NotasFiscais.Items[0].EnviarEmail(trim(cadempresa.vSMTP_EMP),
//              inttostr(cadempresa.vPORTA_SMTP),trim(cadempresa.vLOGIN_EMP),
//              trim(cadempresa.vEMAIL_SENHA),trim(cadempresa.vLOGIN_EMP), vListaDestinat[I],
//              trim(cadempresa.vASSUNTO_NFE),Mememail.Lines,vusassl,true,nil,nil,False,true,cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
              Application.MessageBox(PWideChar('Email de enviado com sucesso'),PWideChar('Aviso'), MB_OK);
              mememail.Free;
              Result := True;
            end
            else
             Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
           end
           else
           begin
            if vtipo = 4 then
            begin
              dataSet.first;
              mememail:=tmemo.Create(application);
              while not dataSet.eof do
              begin
                if dataSet.FieldByName('SEL_NFE').Value = 1 then
                begin
                  vacbrNFEemail.NotasFiscais.Clear;
                  varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
                  '\Autorizado\'+dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
                  if FileExists(Varq) then
                  begin
                    vacbrNFEemail.NotasFiscais.LoadFromFile(varq);
                    if cadempresa.vEMAIL_USASSL = 'S' then
                     vusassl:=true
                    else
                     vusassl:=false;
            //        if mememail = nil then

                    Mememail.Text:='NFe: '+StrZero(vacbrNFEemail.NotasFiscais.Items[0].NFe.Ide.nNF,9)+' DE: '+
                    datetostr(vacbrNFEemail.NotasFiscais.Items[0].NFe.Ide.dEmi)+' VALOR: '+
                    Format('%n',[vacbrNFEemail.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF]);
                //    Tstrings('Nota Fiscal Eletrônica emitida pela empresa: '+CadNfevenda.cadempresa.dataSet.FieldByName('NOME_EMP').AsString)
                    vacbrNFEemail.MAIL := ACBrMail1;
                    ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
                    ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
                    ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
                    ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
                    ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
                    ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
                    ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
                    ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
                    ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
                    ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
                    verificarDestinatarios(para);
                    para := vListaDestinat[0];
                    vListaDestinat.Delete(0);
                    vacbrNFEemail.NotasFiscais.Items[0].EnviarEmail( Para, trim('NFe(s) da Empresa: '+cadempresa.dataset.fieldbyname('NOME_EMP').asstring),
                      Mememail.Lines
                      , True  // Enviar PDF junto
                      , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                      , AAnexosEnv); // Lista de anexos - TStrings

//                    verificarDestinatarios(para);
//                    for I := 0 to vListaDestinat.Count - 1 do
//                    vacbrNFEemail.NotasFiscais.Items[0].EnviarEmail(trim(cadempresa.vSMTP_EMP),
//                    inttostr(cadempresa.vPORTA_SMTP),trim(cadempresa.vLOGIN_EMP),
//                    trim(cadempresa.vEMAIL_SENHA),trim(cadempresa.vLOGIN_EMP), vListaDestinat[I],
//                    trim('NFe(s) da Empresa: '+cadempresa.dataset.fieldbyname('NOME_EMP').asstring),Mememail.Lines,vusassl,false,nil,nil,False,true,cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
                  end
                  else
                   Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
                  marcaSel;
                end;
                dataSet.next;
              end;
              Application.MessageBox(PWideChar('Email(s) de enviado(s) com sucesso'),PWideChar('Aviso'), MB_OK);
              mememail.Free;
              Result := True;
            end
            else
            begin
             if vtipo = 5 then
             begin
               vacbrNFEemail.NotasFiscais.Clear;
               try
                if vnumdpec = '110110' then
                  vtipoEvento:='CARTA DE CORREÇÃO';
                if vnumdpec = '110111' then
                  vtipoEvento:='CANCELAMENTO'
                else if vnumdpec = '110140' then
                  vtipoEvento:='EPEC';

                if vtipoEvento = 'EPEC' then
                  AOk := Trim(cadCCe.dataSet.FieldByName('situacao').AsString) = 'Autorizada'
                else
                  AOk := FileExists(vacbrNFEemail.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml');

                if AOk then
                begin
                 if vtipoEvento = 'EPEC' then
                   vacbrNFEemail.NotasFiscais.LoadFromString(Trim(cadCCe.dataSet.FieldByName('xml_nfe_epec').AsString))
                 else
                   vacbrNFEemail.NotasFiscais.LoadFromFile(vacbrNFEemail.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml');
                 vacbrNFEemail.EventoNFe.Evento.Clear;
                 vSeqEvento := IntToStr(vitx);
                 vArquivoTeste := vacbrNFEemail.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + dataSet.FieldByName('CHAVE_NFE').AsString+vnumdpec+vSeqEvento+
                  '-ProcEventoNFe.xml';
                 vExisteArquivo:= FileExists(vArquivoTeste);
                 if (not vExisteArquivo) and (Length(Trim(vSeqEvento)) = 1) then
                 begin
                   vSeqEvento := '0' + Trim(vSeqEvento);
                   vArquivoTeste := vacbrNFEemail.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + dataSet.FieldByName('CHAVE_NFE').AsString+vnumdpec+vSeqEvento+
                     '-ProcEventoNFe.xml';
                   vExisteArquivo:= FileExists(vArquivoTeste);
                 end;
                 if (not vExisteArquivo) then
                 begin
                   vSeqEvento := StrZero(Trim(vSeqEvento),2);
                   vArquivoTeste := vacbrNFEemail.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + vnumdpec+dataSet.FieldByName('CHAVE_NFE').AsString+vSeqEvento+
                     '-ProcEventoNFe.xml';
                   vExisteArquivo:= FileExists(vArquivoTeste);
                 end;
                 if (not vExisteArquivo) and (vtipoEvento = 'EPEC') then
                   if Trim(cadCCe.dataSet.FieldByName('xml_evento').AsString) <> '' then
                   begin
                     AXMLFile := TStringList.Create;
                     AXMLFile.Text := Trim(cadCCe.dataSet.FieldByName('xml_evento').AsString);
                     AXMLFile.SaveToFile(vArquivoTeste);
                     vExisteArquivo:= FileExists(vArquivoTeste);
                     FreeAndNil(AXMLFile);
                   end;
                 
                 if vExisteArquivo then
                 begin
                  vacbrNFEemail.EventoNFe.LerXML(vArquivoTeste) ;
                  if cadempresa.vEMAIL_USASSL = 'S' then
                   vusassl:=true
                  else
                   vusassl:=false;
                   mememail:=tmemo.Create(application);
                   Evento := TStringList.Create;
                   Evento.Clear;
                   Evento.Add(vArquivoTeste);
                   if vtipoEvento = 'EPEC' then
                   begin
                     cadCCe.GerarPDFEventoEPEC(vacbrNFEemail, cadempresa.vNFE_ENDERECOPDF);
                     AFileName := IncludeTrailingPathDelimiter(cadempresa.vNFE_ENDERECOPDF) +
                                  vacbrNFEemail.NotasFiscais.Items[0].NumID + '-nfe.pdf';
                     if FileExists(AFileName) then
                       Evento.Add(AFileName);
                   end;

                   if vtipoEvento = 'EPEC' then
                     Mememail.Text:='Evento '+vtipoEvento+' referente à NFe: '+StrZero(vacbrNFEemail.NotasFiscais.Items[0].NFe.Ide.nNF,9)+' DE: '+
                       datetostr(vacbrNFEemail.NotasFiscais.Items[0].NFe.Ide.dEmi)+' VALOR: '+
                       Format('%n',[vacbrNFEemail.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF])
                   else
                     Mememail.Text:='Evento '+vtipoEvento+' anexado à NFe: '+StrZero(vacbrNFEemail.NotasFiscais.Items[0].NFe.Ide.nNF,9)+' DE: '+
                       datetostr(vacbrNFEemail.NotasFiscais.Items[0].NFe.Ide.dEmi)+' VALOR: '+
                       Format('%n',[vacbrNFEemail.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF]);

                    vacbrNFEemail.EventoNFe.LerXML(vArquivoTeste);
                    vacbrNFEemail.MAIL := ACBrMail1;
                    ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
                    ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
                    ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
                    ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
                    ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
                    ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
                    ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
                    ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
                    ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
                    ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
                    verificarDestinatarios(para);
                    para := vListaDestinat[0];
                    vListaDestinat.Delete(0);

                    if vtipoEvento = 'EPEC' then
                    begin
                      ACBrMail1.AddAddress(para);
                      ACBrMail1.Subject :=
                        Trim('Evento ' + vtipoEvento + ' da NFe: '+StrZero(vacbrNFEemail.NotasFiscais.Items[0].NFe.Ide.nNF, 9) +
                        ' emitida pela Empresa: ' + cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
                      ACBrMail1.AltBody.Text := mememail.Lines.Text;
                      for I := 0 to Evento.Count - 1 do ACBrMail1.AddAttachment(Evento[I]);
                      for I := 0 to vListaDestinat.Count - 1 do ACBrMail1.AddAddress(vListaDestinat[I]);
                      ACBrMail1.Send;
                    end
                    else
                    vacbrNFEemail.EnviarEmailEvento(Para, trim('Evento '+vtipoEvento+' da NFe: '+StrZero(vacbrNFEemail.NotasFiscais.Items[0].NFe.Ide.nNF,9)+' emitida pela Empresa: '+cadempresa.dataset.fieldbyname('NOME_EMP').asstring),
                      Mememail.Lines
                      , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                      , Evento); // Lista de anexos - TStrings
                    Evento.Free;
                 end
                 else
                  application.messagebox('Evento Não Autorizado, Impressão não permitida', 'Confirmação', MB_OK);
                end
                else
                 application.messagebox('NF-e Não Autorizada, Impressão não permitida', 'Confirmação', MB_OK);
                result:=True;
              except
               on E: Exception do
               begin
                showmessage(E.message);
                Result := False;
               end;
              end;
              Result := true;
             end;
            end;
           end;
          end;
        end;
      end;
    except
     on e: exception do
     begin
      if application.messagebox('Erro ao enviar e-mail. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
       Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
     end;
    end;
//    memo1.Free;
end;

procedure TClassNfe.ExecSQL(SQL: string; Query: TIbQuery);
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Text := SQL;
  Query.Open;
end;

function TClassNfe.getini(Asection, Aident, Adefault: string): string;
var
  ArqIni: string;
  ArqConfig: TIniFile;
begin
  try
    try
      ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
      if not FileExists(ArqIni) then
        ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
      ArqConfig := TIniFile.Create(ArqIni);
      Result := ArqConfig.ReadString(Asection, Aident, Adefault);
    finally
//      ArqConfig.Free;
      FreeAndNil(ArqConfig);
    end;
  except
    Result := Adefault;
  end;
end;

function TClassNfe.GetListaEmails(Aemails: string): TStrings;
var
  AList: TStrings;
  I: Integer;
begin
  Aemails := Aemails.Replace(',', ';', [rfReplaceAll]).Replace(' ', '', [rfReplaceAll]);

  AList := TStringList.Create;
  AList.LineBreak := ';';
  AList.Text := Aemails;
  for I := AList.Count - 1  downto 0 do
    if AList[I].Trim.IsEmpty then
      AList.Delete(I);
  if AList.Count = 0 then
    AList.Add('');
  Result := AList;
end;

function TClassNfe.GravarRetornoConsultaSEFAZ(vacbrNFEDestinadas: TACBrNFe): boolean;
var
  codigoTipoEventoStr: string;
  I: integer;
begin
  Result := True;
  IniciaTransacao;
  try
    datasetnfdest.edit;
    codigoTipoEventoStr := '';

    for i := 0 to vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Count - 1 do
    begin
      var retornoEv := vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe;

      if (retornoEv.InfEvento.tpEvento in [teManifDestConfirmacao, teManifDestCiencia, teManifDestDesconhecimento, teManifDestOperNaoRealizada]) then
      begin
        datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger := retornoEv.cStat;
        datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString := retornoEv.xMotivo;

        if (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.cStat = 135) or
           (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.cStat = 155) then
        begin

          datasetnfdest.FieldByName('CSITCONF').AsInteger := Ord( TipoEventoToTipoManifestacao(retornoEv.InfEvento.tpEvento) );
          datasetnfdest.FieldByName('MANIFESTACAO').AsString := TipoManifestacaoStr[TipoManifestacao(datasetnfdest.FieldByName('CSITCONF').AsInteger)];//tpeventotositconf(vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i]. RetEventoNFe.InfEvento.tpEvento),vok);

          case TipoManifestacao(datasetnfdest.FieldByName('CSITCONF').AsInteger) of
            tmSemManifestacao,
            tmConfirmacaoOperacao    : datasetnfdest.FieldByName('DATA_CONFIRM').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
            tmDesconhecimentoOperacao: datasetnfdest.FieldByName('DATA_DESCONH').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
            tmOperacaoNaoRealizada   : datasetnfdest.FieldByName('DATA_OPNAOREAL').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
            tmCienciaOperacao        : datasetnfdest.FieldByName('DATA_CIENCIA').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
          end;

          Result := True;
          break;
        end;

        codigoTipoEventoStr := TpEventoToStr(retornoEv.InfEvento.tpEvento);
      end;
    end;

    datasetnfdest.post;
    datasetnfdest.ApplyUpdates(-1);

    CommitaTransacao;

    case datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger of
      135, 573, 155:
        begin
          try
           var vseqevento := '1';
           var vteste := vacbrNFEDestinadas.Configuracoes.Arquivos.PathSalvar +
             datasetnfdest.FieldByName('CHAVE_NFE').AsString + codigoTipoEventoStr + vseqevento + '-ProcEventoNFe.xml';

           var vteste1 := vacbrNFEDestinadas.Configuracoes.Arquivos.PathSalvar + 'Autorizado\' +
             datasetnfdest.FieldByName('CHAVE_NFE').AsString + codigoTipoEventoStr + vseqevento + '-ProcEventoNFe.xml';

           if CopyFile(PWideChar(vteste), PWideChar(vteste1), true) then
             DeleteFile(PWideChar(vteste));

          except
            on e: exception do
            begin
             if application.messagebox('Erro ao copiar arquivo de evento para pasta Autorizado. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
              ShowErro(E.Message);
              Result := False;
            end;
          end;
        end;
    end;

  except
   on e: exception do
   begin
     RollBackTransacao;
     if application.messagebox('Erro ao gravar retorno da CC-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
       ShowErro(E.Message);
       Result := False;
    end;
  end;
end;

function TClassNfe.GravarRetornoEnvioEvento(vacbrNFEDestinadas: TACBrNFe; ALoteId: Integer): boolean;
var
  codigoTipoEventoStr: string;
  I: integer;
begin
  Result := True;
  IniciaTransacao;
  try
    datasetnfdest.edit;
    codigoTipoEventoStr := '';

    for i := 0 to vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Count - 1 do
    begin
      var retornoEv := vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe;

      if (retornoEv.InfEvento.tpEvento in [teManifDestConfirmacao, teManifDestCiencia, teManifDestDesconhecimento, teManifDestOperNaoRealizada]) then
      begin
        datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger := retornoEv.cStat;
        datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString := retornoEv.xMotivo;

        if (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.cStat = 135) or
           (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.cStat = 155) then
        begin

          datasetnfdest.FieldByName('CSITCONF').AsInteger := Ord( TipoEventoToTipoManifestacao(retornoEv.InfEvento.tpEvento) );
          datasetnfdest.FieldByName('MANIFESTACAO').AsString := TipoManifestacaoStr[TipoManifestacao(datasetnfdest.FieldByName('CSITCONF').AsInteger)];//tpeventotositconf(vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i]. RetEventoNFe.InfEvento.tpEvento),vok);

          case TipoManifestacao(datasetnfdest.FieldByName('CSITCONF').AsInteger) of
            tmSemManifestacao,
            tmConfirmacaoOperacao    : datasetnfdest.FieldByName('DATA_CONFIRM').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
            tmDesconhecimentoOperacao: datasetnfdest.FieldByName('DATA_DESCONH').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
            tmOperacaoNaoRealizada   : datasetnfdest.FieldByName('DATA_OPNAOREAL').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
            tmCienciaOperacao        : datasetnfdest.FieldByName('DATA_CIENCIA').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
          end;

          Result := True;
          break;
        end;

        codigoTipoEventoStr := TpEventoToStr(retornoEv.InfEvento.tpEvento);
      end;
    end;

    if vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.cStat = 128 then
    begin
      var retornoEv := vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno;

      case retornoEv.cStat of

        135,155:
          begin
            datasetnfdest.FieldByName('CSITCONF').AsInteger := Ord( TipoEventoToTipoManifestacao(retornoEv.retEvento.Items[0].RetInfEvento.tpEvento) );
            datasetnfdest.FieldByName('MANIFESTACAO').AsString := TipoManifestacaoStr[TipoManifestacao(datasetnfdest.FieldByName('CSITCONF').AsInteger)];//tpeventotositconf(vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i]. RetEventoNFe.InfEvento.tpEvento),vok);
            datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger := retornoEv.retEvento.Items[0].RetInfEvento.cStat;
            datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString := retornoEv.retEvento.Items[0].RetInfEvento.xMotivo;

            case TipoManifestacao(datasetnfdest.FieldByName('CSITCONF').AsInteger) of
              tmSemManifestacao,
              tmConfirmacaoOperacao    : datasetnfdest.FieldByName('DATA_CONFIRM').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
              tmDesconhecimentoOperacao: datasetnfdest.FieldByName('DATA_DESCONH').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
              tmOperacaoNaoRealizada   : datasetnfdest.FieldByName('DATA_OPNAOREAL').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
              tmCienciaOperacao        : datasetnfdest.FieldByName('DATA_CIENCIA').AsDateTime := retornoEv.retEvento.Items[0].RetInfEvento.dhRegEvento;
            end;


            Result := True;
          end;

        573:
          begin
            if datasetnfdest.FieldByName('CULTSTATUSMAN').AsString = '' then
            begin
              datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger := retornoEv.retEvento.Items[0].RetInfEvento.cStat;
              datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString := retornoEv.retEvento.Items[0].RetInfEvento.xMotivo;
            end;
            result := True;
          end;

        else
          begin
            Result := False;
            datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger := retornoEv.retEvento.Items[0].RetInfEvento.cStat;
            datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString := retornoEv.retEvento.Items[0].RetInfEvento.xMotivo;
          end;

      end;

      codigoTipoEventoStr := TpEventoToStr(retornoEv.retEvento.Items[0].RetInfEvento.tpEvento);

    end;

    datasetnfdest.Post;
    datasetnfdest.ApplyUpdates(-1);

    CommitaTransacao;

    case datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger of
      135, 573, 155:
        begin
          try
           var vseqevento := '1';
           var vteste := vacbrNFEDestinadas.Configuracoes.Arquivos.PathSalvar +
             datasetnfdest.FieldByName('CHAVE_NFE').AsString + codigoTipoEventoStr + vseqevento + '-ProcEventoNFe.xml';

           var vteste1 := vacbrNFEDestinadas.Configuracoes.Arquivos.PathSalvar + 'Autorizado\' +
             datasetnfdest.FieldByName('CHAVE_NFE').AsString + codigoTipoEventoStr + vseqevento + '-ProcEventoNFe.xml';

           if CopyFile(PWideChar(vteste), PWideChar(vteste1), true) then
             DeleteFile(PWideChar(vteste));

          except
            on e: exception do
            begin
             if application.messagebox('Erro ao copiar arquivo de evento para pasta Autorizado. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
              ShowErro(E.Message);
              Result := False;
            end;
          end;
        end;
    end;

  except
   on e: exception do
   begin
     RollBackTransacao;
     if application.messagebox('Erro ao gravar retorno da CC-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
       ShowErro(E.Message);
       Result := False;
    end;
  end;
end;
{
function TClassNfe.gravaretmanifest(vacbrNFEDestinadas: TACBrNFe;
  vidlote: integer;tpop: integer): boolean;
  var
  vteste,vteste1,vseqevento,vdadosevento: string;
  vretorno,i: integer;
  vok: boolean;
begin
 result:=true;
 IniciaTransacao;
 try
  datasetnfdest.edit;
  vdadosevento:='';
  if tpop = 2 then
  begin
    for i:=0 to vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Count-1 do
    begin
     if (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].
     RetEventoNFe.InfEvento.tpEvento in [teManifDestConfirmacao,teManifDestCiencia,teManifDestDesconhecimento,teManifDestOperNaoRealizada]) then
     begin
       datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger:=vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.cStat;
       datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString:=vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.xMotivo;
       if (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.cStat = 135) or
       (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.cStat = 155) then
       begin
         if (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.InfEvento.tpEvento = teManifDestConfirmacao) then
          datasetnfdest.FieldByName('DATA_CONFIRM').AsDateTime:=
          vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.retEvento.Items[0].RetInfEvento.dhRegEvento;

         if (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.InfEvento.tpEvento = teManifDestCiencia) then
          datasetnfdest.FieldByName('DATA_CIENCIA').AsDateTime:=
          vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.retEvento.Items[0].RetInfEvento.dhRegEvento;

         if (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.InfEvento.tpEvento = teManifDestDesconhecimento) then
          datasetnfdest.FieldByName('DATA_DESCONH').AsDateTime:=
          vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.retEvento.Items[0].RetInfEvento.dhRegEvento;

         if (vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.InfEvento.tpEvento = teManifDestOperNaoRealizada) then
           datasetnfdest.FieldByName('DATA_OPNAOREAL').AsDateTime:=
           vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.retEvento.Items[0].RetInfEvento.dhRegEvento;

         datasetnfdest.FieldByName('CSITCONF').AsString:=tpeventotositconf(vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].
         RetEventoNFe.InfEvento.tpEvento);
         datasetnfdest.FieldByName('MANIFESTACAO').AsString:=tipomanifestacao(tpeventotositconf(vacbrNFEDestinadas.WebServices.Consulta.procEventoNFe.Items[i].
         RetEventoNFe.InfEvento.tpEvento),vok);
         result:=true;
         break;
       end;
       vdadosevento:=TpEventoToStr(vacbrNFEDestinadas.WebServices.
       Consulta.procEventoNFe.Items[i].RetEventoNFe.InfEvento.tpEvento);
     end;
    end;
  end
  else
  begin
    if vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.cStat = 128 then
    begin
       if (vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135) or
       (vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 155) then
       begin
         if (vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpEvento = teManifDestConfirmacao) then
           datasetnfdest.FieldByName('DATA_CONFIRM').AsDateTime:=vacbrNFEDestinadas.WebServices.
           EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
         if (vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpEvento = teManifDestCiencia) then
           datasetnfdest.FieldByName('DATA_CIENCIA').AsDateTime:=vacbrNFEDestinadas.WebServices.
           EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
         if (vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpEvento = teManifDestDesconhecimento) then
           datasetnfdest.FieldByName('DATA_DESCONH').AsDateTime:=vacbrNFEDestinadas.WebServices.
           EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
         if (vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpEvento = teManifDestOperNaoRealizada) then
           datasetnfdest.FieldByName('DATA_OPNAOREAL').AsDateTime:=vacbrNFEDestinadas.WebServices.
           EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
         datasetnfdest.FieldByName('CSITCONF').AsString:=tpeventotositconf(vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpEvento);
         datasetnfdest.FieldByName('MANIFESTACAO').AsString:=tipomanifestacao(tpeventotositconf(vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpEvento),vok);
         datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger:=vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
         datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString:=vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;

  //       vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xEvento;
         result:=true;
       end
       else
       begin
         if vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 573 then // Testar se o evento já foi anexado....
         begin
          if datasetnfdest.FieldByName('CULTSTATUSMAN').AsString = '' then
          begin
           datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger:=vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
           datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString:=vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
          end;
          result:=true
         end
         else
         begin
          result:=false;
          datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger:=vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
          datasetnfdest.FieldByName('ULTIMOMOTIVOMAN').AsString:=vacbrNFEDestinadas.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
         end;
       end;
       vdadosevento:=TpEventoToStr(vacbrNFEDestinadas.WebServices.EnvEvento.
       EventoRetorno.retEvento.Items[0].RetInfEvento.tpEvento);
    end;
  end;
  vretorno:=datasetnfdest.FieldByName('CULTSTATUSMAN').AsInteger;
  datasetnfdest.post;
  datasetnfdest.ApplyUpdates(-1);
  CommitaTransacao;
  //
  vseqevento:='1';
  if (vretorno = 135) or (vretorno = 573) or (vretorno = 155) then
  begin
    try
     vteste:=vacbrNFEDestinadas.Configuracoes.Arquivos.PathSalvar+
     datasetnfdest.FieldByName('CHAVE_NFE').AsString+vdadosevento+vseqevento+'-ProcEventoNFe.xml';
     vteste1:=vacbrNFEDestinadas.Configuracoes.Arquivos.PathSalvar + 'Autorizado\'+datasetnfdest.
     FieldByName('CHAVE_NFE').AsString+vdadosevento+vseqevento+'-ProcEventoNFe.xml';
     if CopyFile(PWideChar(vteste),
      PWideChar(vteste1), true) then
      DeleteFile(PWideChar(vteste));
    except
      on e: exception do
      begin
       if application.messagebox('Erro ao copiar arquivo de evento para pasta Autorizado. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
        result:=false;
      end;
    end;
  end;
 except
  on e: exception do
  begin
   RollBackTransacao;
   if application.messagebox('Erro ao gravar retorno da CC-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
    result:=false;
  end;
 end;
//
end;
}
function TClassNfe.GravaRetNFE(vAcbrNFE: TACBrNFe; vtipo: smallint;vlote: Integer): boolean;
var
 i: integer;
 ix: integer;
 vflg: integer;
 vflgdanfe: integer;
 vteste: string;
 vteste1: string;
  vteste2: string;
 AarrayCodNF: array of Integer;
 Aanexos: TStrings;
begin
(*
//if FNFeRetorno.CStat = 104 then

  //            ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec+'-pro-rec.xml';
  //            ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec+'-ped-rec.xml';
 IF vtipo = 1 then
  dataset.first;
 vcmsg:='';
 vxmsg:='';
// IniciaTransacao;
 if vAcbrNFE.WebServices.Retorno.xMsg <> '' then
 begin
  vcmsg:=inttostr(vAcbrNFE.WebServices.Retorno.cMsg);
  vxmsg:=vAcbrNFE.WebServices.Retorno.xMsg;
 end;

 SetLength(AarrayCodNF, vAcbrNFE.NotasFiscais.Count);

 while Not dataSet.Eof do
 begin
  if dataSet.fieldbyname('SEL_NFE').value = 1 then
  begin
   obtemnumeroNF;
   vflg:=1;
   for ix := 0 to vAcbrNFE.NotasFiscais.Count-1 do

    if vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.nNF = strtoint(VNUMNOTA) then
//    dataSet.FieldByName('NUM_NF_VND').AsInteger then
    begin
      AarrayCodNF[ix] := dataSet.fieldbyname('cod_nf').AsInteger;
      vflg:=0;
      break;
    end;
     //  ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID
     {
     if vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.tpEmis = teDPEC then
     begin
       IniciaTransacao;
       try
        dataSet.Edit;
        dataSet.FieldByName('NFE_DHCONT').AsDateTime:=vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.dhCont;
        dataSet.FieldByName('NFE_XJUST').AsString:=vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.xJust;
        //nao existe mais DPEC
//        dataSet.FieldByName('NFE_DPEC_XMOTIVO').AsString:=vAcbrNFE.WebServices.EnviarDPEC.xMotivo+' '+
//        DateTimeToStr(vAcbrNFE.WebServices.EnviarDPEC.DhRegDPEC);
//        dataSet.FieldByName('NFE_DPEC_NREGDPEC').asstring:=vAcbrNFE.WebServices.EnviarDPEC.nRegDPEC;
//        dataSet.FieldByName('CHAVE_NFE').AsString:=vAcbrNFE.WebServices.EnviarDPEC.NFeChave;
        dataSet.fieldbyname('TIPONFE').value:='DPEC';
        dataSet.fieldbyname('SEL_NFE').value:=0;
        dataSet.fieldbyname('LOTE_NFE').value:=vlote;
        dataSet.post;
        Apply;
        CommitaTransacao;
        vflgdanfe:=0;
        try
//         vACBrNFe.DANFE.ProtocoloNFe:=vACBrNFe.WebServices.EnviarDPEC.nRegDPEC+' '+
//                                  DateTimeToStr(vACBrNFe.WebServices.EnviarDPEC.DhRegDPEC);
//         if vACBrNFe.WebServices.EnviarDPEC.nRegDPEC <> '' then
//           vACBrNFe.NotasFiscais.Items[ix].Imprimir;
         vDANFEIMPRESSO:='SIM';
        except
          on e: exception do
          begin
           if application.messagebox('Erro ao Imprimir DANFE. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
            vflgdanfe:=1;
          end;
        end;
       except
        on e: exception do
        begin
         RollBackTransacao;
         if application.messagebox('Erro ao gravar retorno da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
        end;
       end;
     end
     else
     }
     begin
       if vtipo = 2 then
       begin
        if vflg = 0 then
        begin
          if vAcbrNFE.WebServices.Consulta.cStat = 100 then
          begin
           IniciaTransacao;
           try
            dataSet.Edit;
            dataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime:=vAcbrNFE.WebServices.Consulta.DhRecbto;
            vDATA_AUTORIZACAO:=vAcbrNFE.WebServices.Consulta.DhRecbto;
            dataSet.FieldByName('SITUACAO_NFE').asstring:='Autorizada';
            vSITUACAO_NFE:='Autorizada';
  //          dataSet.FieldByName('DIGEST').asstring:=vAcbrNFE.WebServices.Consulta.digVal; // Mudança 2.0 Herbert.
  //          vDIGEST:=vAcbrNFE.WebServices.Consulta.digVal;
            dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrNFE.WebServices.Consulta.Protocolo;
            vPROTOCOLO:=vAcbrNFE.WebServices.Consulta.Protocolo;
            dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrNFE.WebServices.Consulta.cStat;
            vCODIGOERRO:=inttostr(vAcbrNFE.WebServices.Consulta.cStat);
            dataSet.FieldByName('DESCRICAOERRO').AsString:=vAcbrNFE.WebServices.Consulta.XMotivo;
            vDESCRICAOERRO:=vAcbrNFE.WebServices.Consulta.XMotivo;
            dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(ttime(vAcbrNFE.WebServices.Consulta.DhRecbto));
            vHORA_ENVIO:=ttime(vAcbrNFE.WebServices.Consulta.DhRecbto);
//            dataSet.FieldByName('TIPONFE').AsString:=vTIPONFE;
            dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrNFE.WebServices.Enviar.TMed;
    //           :
            dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrNFE.WebServices.Consulta.DhRecbto;
            vDATAHORA_ENVIO:=vAcbrNFE.WebServices.Consulta.DhRecbto;
            dataSet.FieldByName('CHAVE_NFE').AsString:=vAcbrNFE.WebServices.Consulta.NFeChave;
            dataSet.FieldByName('STAT_NFERECIBO').AsString:='OK';
            if Trim(dataSet.FieldByName('TIPONFE').AsString) <> 'DPEC' then
              if vAcbrNFE.Configuracoes.Geral.FormaEmissao = teNormal then
                dataSet.FieldByName('TIPONFE').AsString := 'NORMAL'
              else if vAcbrNFE.Configuracoes.Geral.FormaEmissao in [teSVCAN, teSVCRS] then
                dataSet.FieldByName('TIPONFE').AsString := 'SVC';
            vCHAVE_NFE:=vAcbrNFE.WebServices.Consulta.NFeChave;
            dataSet.fieldbyname('SEL_NFE').value:=0;
            dataSet.post;
            Apply;
            CommitaTransacao;
            vflgdanfe:=0;
            try
            vteste:=vACBrNFe.Configuracoes.Arquivos.PathSalvar+
             vAcbrNFE.WebServices.Consulta.NFeChave+'-nfe.xml';
             vteste1:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + 'Autorizado\'+vAcbrNFE.WebServices.Consulta.NFeChave+'-nfe.xml';
             vteste2:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + 'Veic\'+vAcbrNFE.WebServices.Consulta.NFeChave+'-nfe.xml';
  //          Application.MessageBox(PWideChar(vteste), 'Erro', MB_ICONERROR +
  //                MB_OK);
  //          Application.MessageBox(PWideChar(vteste1), 'Erro', MB_ICONERROR +
  //                MB_OK);
            if CopyFile(PWideChar(vteste),
             PWideChar(vteste1), true) then
              DeleteFile(PWideChar(vteste));
            if Trim(vAcbrNFE.NotasFiscais.Items[ix].NFe.Det.Items[0].Prod.veicProd.chassi) <> '' then
              if DirectoryExists(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'Veic') then
                if FileExists(vteste1) then
                  CopyFile(PWideChar(vteste1),
                    PWideChar(vteste2), true);

  {           CopyFile(PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'\'+
             vAcbrNFE.WebServices.Consulta.NFeChave+'-nfe.xml'),
             PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Autorizado\'+vAcbrNFE.WebServices.Consulta.NFeChave+'-nfe.xml'), true);}
    //                   Danfe.ProtocoloNFe:=WebServices.Retorno.NFeRetorno.ProtNFe.Items[i].nProt;
             if FImprimir then
               vACBrNFe.NotasFiscais.Items[ix].Imprimir;
             vDANFEIMPRESSO:='SIM';
            except
              on e: exception do
              begin
               if application.messagebox('Erro ao Imprimir DANFE. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
                vflgdanfe:=1;
              end;
            end;
           except
            on e: exception do
            begin
             RollBackTransacao;
             if application.messagebox('Erro ao gravar retorno da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
              Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
            end;
           end;
          // vteste:=vAcbrNFE.WebServices.Consulta.XMotivo+vAcbrNFE.WebServices.Consulta.digVal;
          end
          else if (vAcbrNFE.WebServices.Consulta.cStat = 301) or (vAcbrNFE.WebServices.Consulta.cStat = 302) then
          begin
           IniciaTransacao;
           try
            dataSet.Edit;
            dataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime:=vAcbrNFE.WebServices.Consulta.DhRecbto;
            vDATA_AUTORIZACAO:=vAcbrNFE.WebServices.Consulta.DhRecbto;
            dataSet.FieldByName('SITUACAO_NFE').asstring:='Denegada';
            vSITUACAO_NFE:='Denegada';
            dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrNFE.WebServices.Consulta.Protocolo;
            vPROTOCOLO:=vAcbrNFE.WebServices.Consulta.Protocolo;
            dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrNFE.WebServices.Consulta.cStat;
            vCODIGOERRO:=inttostr(vAcbrNFE.WebServices.Consulta.cStat);
            dataSet.FieldByName('DESCRICAOERRO').AsString:=vAcbrNFE.WebServices.Consulta.XMotivo;
            vDESCRICAOERRO:=vAcbrNFE.WebServices.Consulta.XMotivo;
            dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(ttime(vAcbrNFE.WebServices.Consulta.DhRecbto));
            vHORA_ENVIO:=ttime(vAcbrNFE.WebServices.Consulta.DhRecbto);
            dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrNFE.WebServices.Enviar.TMed;
            dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrNFE.WebServices.Consulta.DhRecbto;
            vDATAHORA_ENVIO:=vAcbrNFE.WebServices.Consulta.DhRecbto;
            dataSet.FieldByName('CHAVE_NFE').AsString:=vAcbrNFE.WebServices.Consulta.NFeChave;
            dataSet.FieldByName('STAT_NFERECIBO').AsString:='OK';
            if Trim(dataSet.FieldByName('TIPONFE').AsString) <> 'DPEC' then
              if vAcbrNFE.Configuracoes.Geral.FormaEmissao = teNormal then
                dataSet.FieldByName('TIPONFE').AsString := 'NORMAL'
              else if vAcbrNFE.Configuracoes.Geral.FormaEmissao in [teSVCAN, teSVCRS] then
                dataSet.FieldByName('TIPONFE').AsString := 'SVC';
            vCHAVE_NFE:=vAcbrNFE.WebServices.Consulta.NFeChave;
            dataSet.fieldbyname('SEL_NFE').value:=0;
            dataSet.post;
            Apply;
            CommitaTransacao;
            vflgdanfe:=0;
            try
            vteste:=vACBrNFe.Configuracoes.Arquivos.PathSalvar+
             vAcbrNFE.WebServices.Consulta.NFeChave+'-nfe.xml';
             vteste1:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + 'Autorizado\'+vAcbrNFE.WebServices.Consulta.NFeChave+'-nfe.xml';
             vteste2:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + 'Veic\'+vAcbrNFE.WebServices.Consulta.NFeChave+'-nfe.xml';
            if CopyFile(PWideChar(vteste),
             PWideChar(vteste1), true) then
              DeleteFile(PWideChar(vteste));
            if Trim(vAcbrNFE.NotasFiscais.Items[ix].NFe.Det.Items[0].Prod.veicProd.chassi) <> '' then
              if DirectoryExists(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'Veic') then
                if FileExists(vteste1) then
                  CopyFile(PWideChar(vteste1),
                    PWideChar(vteste2), true);

//             vACBrNFe.NotasFiscais.Items[ix].Imprimir;
             vDANFEIMPRESSO:='SIM';
            except
              on e: exception do
              begin
               if application.messagebox('Erro ao Imprimir DANFE. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
                vflgdanfe:=1;
              end;
            end;
           except
            on e: exception do
            begin
             RollBackTransacao;
             if application.messagebox('Erro ao gravar retorno da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
              Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
            end;
           end;
          // vteste:=vAcbrNFE.WebServices.Consulta.XMotivo+vAcbrNFE.WebServices.Consulta.digVal;
          end;
        end;
       end
       else
       begin
          if vflg = 0 then
          begin

          if (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat = 301) or (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat = 302) then
          begin
           IniciaTransacao;
           try
            dataSet.Edit;
            dataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
            vDATA_AUTORIZACAO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
            dataSet.FieldByName('SITUACAO_NFE').asstring:='Denegada';
            vSITUACAO_NFE:='Denegada';
            dataSet.FieldByName('DIGEST').asstring:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.digVal;
            vDIGEST:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.digVal;
            dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
            vPROTOCOLO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
            dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat;
            vCODIGOERRO:=inttostr(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat);
            dataSet.FieldByName('DESCRICAOERRO').AsString:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo;
            vDESCRICAOERRO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo;
            dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto));
            vHORA_ENVIO:=ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto);
            case vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.tpEmis of
              teNormal         : dataSet.FieldByName('TIPONFE').AsString := 'NORMAL';
              teDPEC           : dataSet.FieldByName('TIPONFE').AsString := 'DPEC';
              teSVCAN, teSVCRS : dataSet.FieldByName('TIPONFE').AsString := 'SVC';
              else if Trim(dataSet.FieldByName('TIPONFE').AsString) <> 'DPEC' then
              dataSet.FieldByName('TIPONFE').AsString := vTIPONFE;
            end;
            dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrNFE.WebServices.Enviar.TMed;
            dataSet.FieldByName('NFE_RECIBO').AsString:=vAcbrNFE.WebServices.Enviar.Recibo;
            dataSet.FieldByName('STAT_NFERECIBO').AsString:='OK';
            dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
            vDATAHORA_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
            dataSet.FieldByName('CHAVE_NFE').AsString:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe;
            vCHAVE_NFE:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe;
            dataSet.FieldByName('NFE_CMSG').AsInteger:=vAcbrNFE.WebServices.Retorno.cMsg;
            dataSet.FieldByName('NFE_XMSG').AsString:=vAcbrNFE.WebServices.Retorno.xMsg;
            dataSet.fieldbyname('SEL_NFE').value:=0;
            dataSet.fieldbyname('LOTE_NFE').value:=vlote;
            dataSet.post;
            Apply;
            CommitaTransacao;
            vflgdanfe:=0;
            try
             vteste1:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Autorizado\'+ vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml';
             vteste2:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Veic\'+ vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml';
             if CopyFile(PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'\'+vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml'),
             PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Autorizado\'+
             vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml'), true) then
                DeleteFile(PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'\'+
             vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml'));
             if Trim(vAcbrNFE.NotasFiscais.Items[ix].NFe.Det.Items[0].Prod.veicProd.chassi) <> '' then
               if DirectoryExists(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'Veic') then
                 if DirectoryExists(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'Veic') then
                   if FileExists(vteste1) then
                     CopyFile(PWideChar(vteste1),
                       PWideChar(vteste2), true);
//             vACBrNFe.NotasFiscais.Items[ix].Imprimir;
             vDANFEIMPRESSO:='SIM';
            except
              on e: exception do
              begin
               if application.messagebox('Erro ao Imprimir DANFE. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
                vflgdanfe:=1;
              end;
            end;
           except
            on e: exception do
            begin
             RollBackTransacao;
             if application.messagebox('Erro ao gravar retorno da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
              Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
            end;
           end;
          // vteste:=vAcbrNFE.WebServices.Consulta.XMotivo+vAcbrNFE.WebServices.Consulta.digVal;
          end
          else
          if (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat <> 100) and (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat <> 104) then
//            (vAcbrNFE.WebServices.Retorno.cStat <> 100) and (vAcbrNFE.WebServices.Retorno.cStat <> 104) then
  //          (vAcbrNFE.WebServices.Retorno.cStat = 105) or (vAcbrNFE.WebServices.Retorno.cStat = 103) then
            begin
             IniciaTransacao;
             try
              dataSet.Edit;
              if vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo <> '' then
               dataSet.FieldByName('RESULTADO_ENVIO').asstring:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo
              else
              dataSet.FieldByName('RESULTADO_ENVIO').asstring:=vAcbrNFE.WebServices.Retorno.xMotivo;
              vRESULTADO_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo;
//              vAcbrNFE.WebServices.Retorno.xMotivo;
              if vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat <> 0 then
               dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat
              else
                dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrNFE.WebServices.Retorno.cStat;
              dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
//              vAcbrNFE.WebServices.Retorno.Protocolo;
              vPROTOCOLO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
              //vAcbrNFE.WebServices.Retorno.Protocolo;
              dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrNFE.WebServices.Enviar.TMed;
              dataSet.FieldByName('NFE_RECIBO').AsString:=vAcbrNFE.WebServices.Enviar.Recibo;
              vTEMPORESPOSTA:=vAcbrNFE.WebServices.Enviar.TMed;
              IF (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat = 204) or
              //vAcbrNFE.WebServices.Retorno.cStat = 204) or
              (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat = 105) or (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat = 103)
               then
              begin
               dataSet.FieldByName('SITUACAO_NFE').AsString:='Em Processamento';
               dataSet.FieldByName('STAT_NFERECIBO').AsString:='PENDENTE';
               vSITUACAO_NFE:='Em Processamento';
              end
              else
              begin
                if vAcbrNFE.WebServices.Retorno.cStat = 105 then
                begin
                 dataSet.FieldByName('SITUACAO_NFE').AsString:='Em Processamento';
                 dataSet.FieldByName('STAT_NFERECIBO').AsString:='PENDENTE';
                 vSITUACAO_NFE:='Em Processamento';
                end;
              end;
              case vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.tpEmis of
                teNormal         : dataSet.FieldByName('TIPONFE').AsString := 'NORMAL';
                teDPEC           : dataSet.FieldByName('TIPONFE').AsString := 'DPEC';
                teSVCAN, teSVCRS : dataSet.FieldByName('TIPONFE').AsString := 'SVC';
                else if Trim(dataSet.FieldByName('TIPONFE').AsString) <> 'DPEC' then
                dataSet.FieldByName('TIPONFE').AsString := vTIPONFE;
              end;
              dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(Ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto));
//              vAcbrNFE.WebServices.Enviar.dhRecbto));
              vHORA_ENVIO:=Ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto);
//              vAcbrNFE.WebServices.Enviar.dhRecbto);
              dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
//              vAcbrNFE.WebServices.Enviar.dhRecbto;
              vDATAHORA_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
//              vAcbrNFE.WebServices.Enviar.dhRecbto;
              if vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe <> '' then
               vCHAVE_NFE:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe
              else
               vCHAVE_NFE:=copy(vAcbrNFE.NotasFiscais.Items[ix].NFe.infNFe.ID, (length(vAcbrNFE.NotasFiscais.Items[ix].NFe.infNFe.ID)-44)+1, 44);
//              copy(vAcbrNFE.NotasFiscais.Items[ix].NFe.infNFe.ID,4,Length(vAcbrNFE.NotasFiscais.Items[ix].NFe.infNFe.ID)-3);
              dataSet.FieldByName('CHAVE_NFE').AsString:=vCHAVE_NFE;
              dataSet.FieldByName('NFE_CMSG').AsInteger:=vAcbrNFE.WebServices.Retorno.cMsg;
              dataSet.FieldByName('NFE_XMSG').AsString:=vAcbrNFE.WebServices.Retorno.xMsg;
  //            vAcbrNFE.NotasFiscais.Items[ix].NFe.infNFe.ID;
              dataSet.fieldbyname('SEL_NFE').value:=0;
              dataSet.fieldbyname('LOTE_NFE').value:=vlote;
              dataSet.Post;
              Apply;
              CommitaTransacao;
             except
              on e: exception do
              begin
               RollBackTransacao;
               if application.messagebox('Erro ao gravar retorno da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
              end;
             end;
            end
            else
            begin
              //   vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].
              IF (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat = 100) or (vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat = 104) then
//              vACBrNFe.WebServices.Retorno.cStat = 100) or (vACBrNFe.WebServices.Retorno.cStat = 104) then
              begin
                if vACBrNFe.NotasFiscais.Items[ix].Confirmada then
                begin
                 IniciaTransacao;
                 try
                  dataSet.Edit;
                  dataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto;
                  vDATA_AUTORIZACAO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
                  //vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto;
                  dataSet.FieldByName('SITUACAO_NFE').asstring:='Autorizada';
                  vSITUACAO_NFE:='Autorizada';
                  dataSet.FieldByName('DIGEST').asstring:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.digVal;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].digVal;
                  vDIGEST:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.digVal;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].digVal;
                  dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].nProt;
                  vPROTOCOLO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].nProt;
                  dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].cStat;
                  vCODIGOERRO:=inttostr(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat);
                  dataSet.FieldByName('DESCRICAOERRO').AsString:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].xMotivo;
                  vDESCRICAOERRO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].xMotivo;
                  dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto));
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto));
                  vHORA_ENVIO:=ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto);
                  //vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto);
                  case vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.tpEmis of
                    teNormal         : dataSet.FieldByName('TIPONFE').AsString := 'NORMAL';
                    teDPEC           : dataSet.FieldByName('TIPONFE').AsString := 'DPEC';
                    teSVCAN, teSVCRS : dataSet.FieldByName('TIPONFE').AsString := 'SVC';
                    else if Trim(dataSet.FieldByName('TIPONFE').AsString) <> 'DPEC' then
                    dataSet.FieldByName('TIPONFE').AsString := vTIPONFE;
                  end;
                  dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrNFE.WebServices.Enviar.TMed;
                  dataSet.FieldByName('NFE_RECIBO').AsString:=vAcbrNFE.WebServices.Enviar.Recibo;
                  dataSet.FieldByName('STAT_NFERECIBO').AsString:='OK';
      //           :
                  dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto;
                  vDATAHORA_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto;
                  dataSet.FieldByName('CHAVE_NFE').AsString:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].chNFe;
                  vCHAVE_NFE:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].chNFe;
                  dataSet.FieldByName('NFE_CMSG').AsInteger:=vAcbrNFE.WebServices.Retorno.cMsg;
                  dataSet.FieldByName('NFE_XMSG').AsString:=vAcbrNFE.WebServices.Retorno.xMsg;
                  dataSet.fieldbyname('SEL_NFE').value:=0;
                  dataSet.fieldbyname('LOTE_NFE').value:=vlote;
                  dataSet.post;
                  Apply;
                  CommitaTransacao;
                  vflgdanfe:=0;
                  try
                   {if CopyFile(PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'\'+
                   vACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].chNFe+'-nfe.xml'),
                   PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Autorizado\'+vACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].chNFe+'-nfe.xml'), true) then
                      DeleteFile(PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'\'+
                   vACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].chNFe+'-nfe.xml'));}
      //                   Danfe.ProtocoloNFe:=WebServices.Retorno.NFeRetorno.ProtNFe.Items[i].nProt;
                   vteste1:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Autorizado\'+ vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml';
                   vteste2:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Veic\'+ vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml';
                   if CopyFile(PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'\'+vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml'),
                   PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Autorizado\'+
                   vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml'), true) then
                      DeleteFile(PWideChar(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'\'+
                   vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-nfe.xml'));
                   if Trim(vAcbrNFE.NotasFiscais.Items[ix].NFe.Det.Items[0].Prod.veicProd.chassi) <> '' then
                     if DirectoryExists(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'Veic') then
                       if DirectoryExists(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'Veic') then
                         if FileExists(vteste1) then
                           CopyFile(PWideChar(vteste1),
                             PWideChar(vteste2), true);
                   if FImprimir then
                     vACBrNFe.NotasFiscais.Items[ix].Imprimir;
                   vDANFEIMPRESSO:='SIM';
                  except
                    on e: exception do
                    begin
                     if application.messagebox('Erro ao Imprimir DANFE. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                      Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
                      vflgdanfe:=1;
                    end;
                  end;
                 except
                  on e: exception do
                  begin
                   RollBackTransacao;
                   if application.messagebox('Erro ao gravar retorno da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
                  end;
                 end;
                end
                else
                 vSITUACAO_NFE:='Rejeitada';
              end
              else
               vSITUACAO_NFE:='Rejeitada';
              if vSITUACAO_NFE = 'Rejeitada' then
              begin
                IniciaTransacao;
                 try
                  dataSet.Edit;
                  dataSet.FieldByName('SITUACAO_NFE').asstring:=vSITUACAO_NFE;
                  dataSet.FieldByName('DIGEST').asstring:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.digVal;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].digVal;
                  vDIGEST:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.digVal;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].digVal;
                  dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].nProt;
                  vPROTOCOLO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
                  //vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].nProt;
                  dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].cStat;
                  vCODIGOERRO:=inttostr(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat);
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].cStat);
                  dataSet.FieldByName('DESCRICAOERRO').AsString:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].xMotivo;
                  vDESCRICAOERRO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].xMotivo;
                  dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto));
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto));
                  vHORA_ENVIO:=ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto);
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto);
                  case vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.tpEmis of
                    teNormal         : dataSet.FieldByName('TIPONFE').AsString := 'NORMAL';
                    teDPEC           : dataSet.FieldByName('TIPONFE').AsString := 'DPEC';
                    teSVCAN, teSVCRS : dataSet.FieldByName('TIPONFE').AsString := 'SVC';
                    else if Trim(dataSet.FieldByName('TIPONFE').AsString) <> 'DPEC' then
                    dataSet.FieldByName('TIPONFE').AsString := vTIPONFE;
                  end;
                  dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrNFE.WebServices.Enviar.TMed;
      //           :
                  dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto;
                  vDATAHORA_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].dhRecbto;
                  dataSet.FieldByName('CHAVE_NFE').AsString:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].chNFe;
                  vCHAVE_NFE:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe;
//                  vAcbrNFE.WebServices.Retorno.NFeRetorno.ProtNFe.Items[ix].chNFe;
                  dataSet.FieldByName('NFE_CMSG').AsInteger:=vAcbrNFE.WebServices.Retorno.cMsg;
                  dataSet.FieldByName('NFE_XMSG').AsString:=vAcbrNFE.WebServices.Retorno.xMsg;
                  dataSet.fieldbyname('SEL_NFE').value:=0;
                  dataSet.fieldbyname('LOTE_NFE').value:=vlote;
                  dataSet.post;
                  Apply;
                  CommitaTransacao;
                 except
                  on e: exception do
                  begin
                   RollBackTransacao;
                   if application.messagebox('Erro ao gravar retorno da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
                  end;
                 end;
              end;
           end;
          end
          else
          begin
           // Colocar status não enviado...
           vDESCRICAOERRO:='Nf não enviada';
          end;
       end;
     end;
  end;
  if (vtipo <> 2) and (vtipo <> 3) then
   Next
  else
   break;
 end;

  if (cadempresa.vENVIAEMAILNFE = 'S') and (FSendMail) then
  begin
    for ix := 0 to vAcbrNFE.NotasFiscais.Count-1 do
    begin
      if vACBrNFe.NotasFiscais.Items[ix].Confirmada then
      begin
        //     if vAcbrNFE.NotasFiscais.Items[ix].NFe.Ide.tpEmis = teDPEC then
        //      enviaEmail(vAcbrNFE,1,ix,vAcbrNFE.WebServices.EnviarDPEC.nRegDPEC)
        //     else
        Aanexos := getArquivosBoletoParaAnexos(AarrayCodNF[ix]);
        enviaEmail(vAcbrNFE,1,ix,'0', Aanexos);

        if Assigned(Aanexos) then
          for I := 0 to Aanexos.Count - 1  do
          DeleteFile(PWideChar(Aanexos[I]));
      end;
    end;
  end;
*)
end;

procedure TClassNfe.GravarNFDestinadas(vacbrNFEDestinadas: TACBrNFe; indice, codempresa: Integer; vtpop: TipoResumoDFe);
var
 ok: boolean;
 tipoM: TipoManifestacao;
begin

  var chvNFe := '';
  case vtpop of
    trNFe   : chvNFe := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resDFe.chDFe;
    trEvento: chvNFe := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resEvento.chDFe;
  end;

  datasetnfdest.Close;
  datasetnfdest.CommandText:='SELECT * FROM NF_DESTINADAS WHERE COD_EMPRESA = '+inttostr(codempresa)+' AND CHAVE_NFE = '''+ chvNFe + '''';
  datasetnfdest.open;

  case vtpop of
    trNFe:
      begin
        IniciaTransacao;
        try

          if not datasetnfdest.IsEmpty then
            Exit;

          datasetnfdest.Append;
          datasetnfdest.FieldByName('CHAVE_NFE').AsString := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resDFe.chDFe;
          datasetnfdest.FieldByName('COD_EMPRESA').AsInteger := codempresa;
          datasetnfdest.FieldByName('XNOME').AsString := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resDFe.xNome;
          datasetnfdest.FieldByName('CNPJCPF').AsString := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resDFe.CNPJCPF;
          datasetnfdest.FieldByName('IE').AsString := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resDFe.IE;
          datasetnfdest.FieldByName('DATA_EMISSAO').AsDateTime := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resDFe.dhEmi;
          if vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resDFe.tpNF = tnEntrada then
            datasetnfdest.FieldByName('TPNF').AsString:='Entrada'
          else
            datasetnfdest.FieldByName('TPNF').AsString:='Saída';
          datasetnfdest.FieldByName('VNF').AsCurrency:=vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resDFe.vNF;
          datasetnfdest.FieldByName('SERIE_NF').AsInteger:=StrToInt(copy(datasetnfdest.FieldByName('CHAVE_NFE').AsString, 23, 3));
          datasetnfdest.FieldByName('NUM_NF').AsInteger:=StrToInt(copy(datasetnfdest.FieldByName('CHAVE_NFE').AsString, 26, 9));
          datasetnfdest.FieldByName('NSUDFE').AsString := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].NSU;
          datasetnfdest.post;
          datasetnfdest.ApplyUpdates(-1);
          CommitaTransacao;
        except
        on e: exception do
          begin
            RollBackTransacao;

            registraErro('GravarNFDestinadas ' + e.Message);

            if application.messagebox('Erro ao gravar retorno da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
              Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
          end;
        end;
        datasetnfdest.close;
      end;

    trEvento:
      begin

        if datasetnfdest.IsEmpty then
          Exit;

        datasetnfdest.Edit;

        var tpEv := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resEvento.tpEvento;

        case tpEv of
          teCancelamento:
            begin
              datasetnfdest.FieldByName('DATA_CANC').AsDateTime := vacbrNFEDestinadas.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[indice].resEvento.dhEvento;
              datasetnfdest.FieldByName('STATUS_NFE').AsString:='Cancelada';
            end;

          teManifDestConfirmacao, teManifDestCiencia, teManifDestDesconhecimento, teManifDestOperNaoRealizada:
            begin
              datasetnfdest.FieldByName('CSITCONF').AsInteger := Ord( TipoEventoToTipoManifestacao(tpEv) );
              datasetnfdest.FieldByName('MANIFESTACAO').AsString := TipoManifestacaoStr[TipoManifestacao(datasetnfdest.FieldByName('CSITCONF').AsInteger)];
            end
        end;

        datasetnfdest.post;
        datasetnfdest.ApplyUpdates(-1);
        CommitaTransacao;
      end;
  end;
end;

procedure TClassNfe.lerConfigIni;
var
  ArqIni: string;
  ArqConfig: TIniFile;
begin
try
  ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
  if not FileExists(ArqIni) then
    ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
  ArqConfig := TIniFile.Create(ArqIni);
  vqtdig := ArqConfig.ReadString('Automacao', 'DigitosProd', '');
  if vqtdig = '' then
    vqtdig := ArqConfig.ReadString('DigProd', 'Dados', '5');
  finally
    ArqConfig.Free;
  end;
end;

procedure TClassNfe.limpaLinha(const dado: string);
var
  i: integer;
  car: string;
begin
  i := 1;
  while i <= length(Dado) do
  begin
    car := ' ';
//    AuxStr[i] := car[1];
    inc(i);
  end;
end;

procedure TClassNfe.MontaLinha(Pos: Integer; const Dado: string);
var
  i: integer;
  //byte;
  car: string[1];
begin
  i := 1;
  while i <= length(Dado) do
  begin
    car := Copy(dado, i, 1);
    AuxStrP[(i - 1) + pos] := car[1];
    inc(i);
  end;
end;

function TClassNfe.obtemlote: integer;
begin
Result:=Gencodigo('LOTENFE',
        DtmNFEHW.SpIncCodigo,IntToStr(cadempresa.codempresa));
end;

function TClassNfe.PesqPros(vGravarAuditoria: boolean;vprocesso: string;vdados: string): boolean;
var
  Arq: TextFile;
  NomeArq, Ausuario, Agerente: string;
  vnivelproc: integer;
begin
  Ausuario := vusuario;
  Agerente := '';
  try
      buscas.Close;
      buscas.SQL.Text := 'select NIVEL_US, USUARIO from SENHAS where USUARIO = ''' +
      vusuario+ ''' AND COD_EMPRESA = ''' +inttostr(cadempresa.codempresa)+ ''' AND ATIVO = 1 ';
      buscas.Open;
      if not buscas.IsEmpty then
      begin
       vnivelus:=buscas.FieldByName('NIVEL_US').AsInteger;
       vusuario:=buscas.FieldByName('USUARIO').AsString;
      end;
      buscas.Close;
      buscas.SQL.Text :=
        'select * from TABELA_PROCESSOS where COD_PROCESSO = ' +
        quotedstr(vprocesso) +
        ' AND COD_EMPRESA = ' + inttostr(cadempresa.codempresa)+ ' AND ATIVO = 1';
      buscas.open;
      if not buscas.IsEmpty then
      begin
        if buscas.FieldByName('NIVEL_PROCESSO').AsInteger > vnivelus then
        begin
          if buscas.FieldByName('SENHA_GERENTE').ASSTRING = 'S' then
          begin
            Application.CreateForm(TFRMPesqPros, FRMPesqPros);
            FRMPesqPros.ShowModal;
            if FRMPesqPros.ModalResult = mrOk then
            begin
              try
                vnivelproc:=buscas.FieldByName('NIVEL_PROCESSO').AsInteger;
                buscas.Close;
                buscas.SQL.Text := 'select NIVEL_US, USUARIO from SENHAS where USUARIO = ''' +
                  FRMPesqPros.Edit1.Text + ''' and SENHA = ''' + codifica(FRMPesqPros.Edit2.Text) +
                  ''' AND COD_EMPRESA = ''' +inttostr(cadempresa.codempresa)+ ''' AND ATIVO = 1 ';
                buscas.Open;
                if buscas.IsEmpty then
                begin
                  Application.MessageBox(PWideChar('Senha inválida para o usuário!'), 'Erro', MB_ICONERROR +
                    MB_OK);
                  PesqPros := false;
                end
                else
                begin
                  vnivelus:=buscas.FieldByName('NIVEL_US').AsInteger;
                  vusuario:=buscas.FieldByName('USUARIO').AsString;
                  Agerente:= vusuario;
                  if vnivelproc > vnivelus then
                  begin
                    buscas.Close;
                    buscas.SQL.Text := ' SELECT 1 FIRST FROM TABELA_PROCESSOS T ' +
                      ' LEFT JOIN TABELA_PROCESSOS_USUARIOS TU ON TU.COD_PROCESSO = T.COD_PROCESSO ' +
                      ' AND TU.COD_EMPRESA = T.COD_EMPRESA ' +
                      ' WHERE T.COD_EMPRESA = ' + inttostr(cadempresa.codempresa)+ ' AND T.ATIVO = 1 ' +
                      ' AND TU.USUARIO= ' + QuotedStr(vusuario) +
                      ' AND T.COD_PROCESSO = ' + QuotedStr(vProcesso);
                    buscas.Open;

                    if not buscas.IsEmpty then
                      PesqPros := true
                    else
                    begin
                      Application.MessageBox(PWideChar('Processo ' + vprocesso + ' não Permitido para o usuário'), 'Erro', MB_ICONERROR +
                      MB_OK);
                      PesqPros := false;
                    end;
                  end
                  else
                   PesqPros := true;
                end;
              except
                 PesqPros := false;
              end;
            end
            else
             PesqPros := false;
          end
          else
          begin
            buscas.Close;
            buscas.SQL.Text := ' SELECT 1 FIRST FROM TABELA_PROCESSOS T ' +
              ' LEFT JOIN TABELA_PROCESSOS_USUARIOS TU ON TU.COD_PROCESSO = T.COD_PROCESSO ' +
              ' AND TU.COD_EMPRESA = T.COD_EMPRESA ' +
              ' WHERE T.COD_EMPRESA = ' + inttostr(cadempresa.codempresa)+ ' AND T.ATIVO = 1 ' +
              ' AND TU.USUARIO= ' + QuotedStr(vusuario) +
              ' AND T.COD_PROCESSO = ' + QuotedStr(vProcesso);
            buscas.Open;

            if not buscas.IsEmpty then
              PesqPros := True
            else
            begin
              Application.MessageBox(PWideChar('Processo ' + vprocesso + ' não Permitido para o usuário'), 'Erro', MB_ICONERROR +
              MB_OK);
              PesqPros := false;
            end;
          end;
        end
        else
        begin
          if vGravarAuditoria then
          begin
            gravarAuditoria(Pchar(copy(Ausuario,1,20)),Pchar(copy(Agerente,1,20)),Pchar(buscas.FieldByName('COD_PROCESSO').AsString),
            Pchar(trim(buscas.FieldByName('NOME_PROCESSO').AsString)),Pchar(vdados),
            Pchar(buscas.FieldByName('FORM').AsString),Pchar('NFe2.0'),Pchar(inttostr(cadempresa.codempresa)));
          end;
          PesqPros := true;
        end;
      end
      else
      begin
        Application.MessageBox(PWideChar('Processo ' + vprocesso+ ' não definido na tabela de processos.'), 'Erro', MB_ICONERROR +
         MB_OK);
        PesqPros := false;
      end;


      try

      finally
        FRMPesqPros.Free;
        FRMPesqPros := nil;
      end;


  finally
    vusuario := Ausuario;
  end;
end;

function TClassNfe.sitconftotpevento(vsitconf: integer): TpcnTpEvento;
begin

  if (vsitconf = 2) then
   Result:=teManifDestDesconhecimento
  else
   if vsitconf = 3 then
    result:=teManifDestOperNaoRealizada
   else
    if vsitconf = 4 then
     result:=teManifDestCiencia
    else
     Result:=teManifDestConfirmacao;

end;

function TClassNfe.Space(Tam: integer): string;
var
  res: string;
  i: integer;
begin
  res := '';
  i := 1;
  while i <= tam do
  begin
    res := res + ' ';
    inc(i);
  end;
  result := res;
end;

function TClassNfe.TipoEventoToTipoManifestacao(ATipoEventoDFe: TpcnTpEvento): TipoManifestacao;
begin
  case ATipoEventoDFe of
    teManifDestConfirmacao     : Result := tmConfirmacaoOperacao;
    teManifDestDesconhecimento : Result := tmDesconhecimentoOperacao;
    teManifDestOperNaoRealizada: Result := tmOperacaoNaoRealizada;
    teManifDestCiencia         : Result := tmCienciaOperacao;
    else                         Result := tmSemManifestacao;
  end;
end;

function TClassNfe.validarEnvioComandoFechado: Boolean;
begin
  Result := True;
  if (Trim(dataSet.FieldByName('tipo_nf').AsString) <> 'V') or
   (dataSet.FieldByName('natureza_nf').AsString <> 'S') then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select VERSAO_VEICULO from empresa where cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
  buscas.Open;

  if Trim(buscas.FieldByName('VERSAO_VEICULO').AsString) <> '4' then
    Exit;

  if (dataSet.FieldByName('N_COMANDO').AsInteger > 0) then
  begin
    buscas.Close;
    buscas.Sql.Text := 'select n_comando, status_v, data_ven from com_fat'+
      ' where n_comando = ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
      ' and cod_empresa = '+ IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
    buscas.Open;
    if not buscas.IsEmpty then
      if Trim(buscas.FieldByName('STATUS_V').AsString) <> 'FECHADO' then
      begin
        Result := False;
        Application.MessageBox(PWideChar('Documento de Venda Nº ' +
         IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) + ', não se encontra "FECHADO".'), 'Atenção', 0 + 64);

        if not PesqPros( True, 'NF0180', 'PERMITIR - NOTAFISCAL') then
        begin
          raise Exception.Create('Documento de Venda Nº ' +
            IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) + ', não se encontra "FECHADO".');
        end
        else
          Result := True;
      end;
  end;
end;

function TClassNfe.verificadestemail(vtp: integer;vdadosnf: string): boolean;
//var
// para: string;
begin
    Result := False;
    if (vtp <> 1) then
    begin
     obtemnumeroNF;
     cadclfor.BuscaClifor(VCODCLIFOR,cadempresa.codempresa);
     para:=cadclfor.vemail;
    end;
    if vtp = 4 then
    begin
      buscas.SQL.Clear;
      buscas.sql.text:='SELECT C.EMAIL_CONT FROM EMPRESA E,CONTADOR C WHERE '+
      'E.COD_CONTADOR = C.COD_CONTADOR AND C.ATIVO = 1';
      buscas.Open;
      if not buscas.IsEmpty then
       para:=buscas.FieldByName('EMAIL_CONT').asstring
      else
       para:='';
      buscas.close;
    end;
    if para = ''  then
     Application.MessageBox(PWideChar('Cliente não tem o email cadastrado'),PWideChar('Error'), MB_OK);
    if InputQuery(vdadosnf, 'Email de destino', Para) then
    begin
      if para = '' then
      begin
       Application.MessageBox(PWideChar('Email de destino precisa ser preenchida'),PWideChar('Error'), MB_OK);
       Result := False;
      end
      else
      begin
       cadclfor.vemail:=para;
       Result := True;
      end;
    end;
end;


function TClassNfe.verificadestemail(vtp: integer; vdadosnf: string; var AComBoletos: Boolean): boolean;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  if (not AComBoletos) or (vtp = 4) then
  begin
    Result := verificadestemail(vtp, vdadosnf);
    Exit;
  end;

  Result := false;
  if (vtp <> 1) then
  begin
   obtemnumeroNF;
   cadclfor.BuscaClifor(VCODCLIFOR,cadempresa.codempresa);
   para:=cadclfor.vemail;
  end;


  Application.CreateForm(TfrmEmail, frmEmail);

  Registro := TRegistry.Create;
  try
    Registro.OpenKey(Conf + frmEmail.ClassName, True);

    if Registro.ValueExists(frmEmail.CheckBox1.Name) then
      frmEmail.CheckBox1.Checked := Registro.ReadBool(frmEmail.CheckBox1.Name)
    else
      frmEmail.CheckBox1.Checked := True;

    frmEmail.Caption := vdadosnf;
    frmEmail.Label1.Caption := 'Email de destino';
    frmEmail.MaskEdit1.Text := para;

    if Trim(para) = ''  then
      Application.MessageBox(PWideChar('Cliente não tem o email cadastrado'),PWideChar('Error'), MB_OK);

    if frmEmail.ShowModal = mrOk then
    begin
      if para = '' then
      begin
       Application.MessageBox(PWideChar('Email de destino precisa ser preenchida'),PWideChar('Error'), MB_OK);
       result := false;
      end
      else
      begin
        cadclfor.vemail := para;
        Result := true;
        AComBoletos := frmEmail.CheckBox1.Checked;
      end;
    end;
  finally
    Registro.WriteBool(frmEmail.CheckBox1.Name, frmEmail.CheckBox1.Checked);
    Registro.CloseKey;
    Registro.Free;
  end;
  FreeAndNil(frmEmail);
end;

function TClassNfe.verificanfepend: boolean;
var
 vdtmin: Tdate;
begin
 Result := True;
 if cadempresa.vqtdenfpend <> '' then
 begin
   if cadempresa.vqtdenfpend <> '0' then
   begin
     buscas.Close;
     buscas.sql.text:='select count( * ) as valor from notafiscal where modelo_nf = ''55'' and '+
     '((situacao_nfe <> ''Cancelada'' and situacao_nfe <> ''Inutilizada'' and situacao_nfe <> ''Autorizada'' and situacao_nfe = ''Em Processamento'') '+
     'or situacao_nfe is null) and emissao_propria = ''S'' and cod_empresa = '+
     inttostr(cadempresa.codempresa)+' and ativo = 1 ';
     buscas.open;
     if buscas.FieldByName('valor').AsInteger > StrToInt(cadempresa.vqtdenfpend) then
     begin
       Application.MessageBox(PWideChar('Qtde de notas pendentes acima do limite permitido na '+#13+
       'configuração, Verifique as notas no Formulário de consulta de notas opção ''não autorizadas'''),PWideChar('Error'), MB_OK);
       Result := False;
       buscas.close;
       exit;
     end;
   end;
 end;
 if cadempresa.vqtdependemdias <> '' then
 begin
   if cadempresa.vqtdependemdias <> '0' then
   begin
     buscas.Close;
     buscas.sql.text:='select min(data_contabil) as dataemissao from notafiscal where modelo_nf = ''55'' and '+
     '((situacao_nfe <> ''Cancelada'' and situacao_nfe <> ''Inutilizada'' and situacao_nfe <> ''Autorizada'' and situacao_nfe = ''Em Processamento'') '+
     'or situacao_nfe is null) and emissao_propria = ''S'' and cod_empresa = '+
     inttostr(cadempresa.codempresa)+' and ativo = 1 ';
     buscas.open;
     if not buscas.IsEmpty then
     begin
       vdtmin:=buscas.FieldByName('dataemissao').AsDateTime;
       if (getDataBanco(buscas,cadempresa.vusdataserv)-vdtmin) >
       StrToInt(cadempresa.vqtdependemdias) then
       begin
         Application.MessageBox(PWideChar('Existem notas pendentes com data emissao acima de '+#13+
         cadempresa.vqtdependemdias+' dias definidos na configuração, '+
         'Verifique as notas no Formulário de consulta de notas opção ''não autorizadas'''),PWideChar('Error'), MB_OK);
         Result := False;
         buscas.close;
         exit;
       end;
     end;
   end;
 end;
end;

{ TClassNfVenda }

function TClassNfVenda.abrevazio: boolean;
begin
  montaSelect('select * from notafiscal where NUM_NF = 0');
end;

function TClassNfVenda.AddNotaFiscalToACBrNFe(CodNF, ATpEmis: Integer;
  ANFe: TACBrNFe): Boolean;
var
  AOk, AWriteIcmsUFDest: Boolean;
  ABuscas: TIBQuery;
begin
  Result := False;
  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    try
      ABuscas.Close;
      ABuscas.SQL.Text :=
        'select notafiscal.*,' +
        ' cond_pag.desc_cond_pag' +
        ' from notafiscal' +
        ' left join cond_pag on cond_pag.cod_cond_pag = notafiscal.cod_cond_pag' +
        ' where cod_nf = ' + IntToStr(CodNF) + ' and cod_empresa = ' + IntToStr(cadempresa.codempresa);
      ABuscas.Open;
      if ABuscas.IsEmpty then
        raise Exception.Create('Nenhuma nota fiscal encontrada');

      with ANFe.NotasFiscais.Add.NFe do
      begin
        with Ide do
        begin
          cUF       := cadempresa.dataSet.fieldbyname('ibge_codigo_uf').AsInteger;
          cNF       := Math.IfThen(ABuscas.FieldByName('cnfe').AsInteger > 0,
                                   ABuscas.FieldByName('cnfe').AsInteger,
                                   ABuscas.FieldByName('num_nf').AsInteger);
          natOp     := Trim(ABuscas.FieldByName('desc_natop').AsString);
          if Pos('VISTA', UpperCase(ABuscas.FieldByName('desc_cond_pag').AsString)) > 0 then
            indPag    := TpcnIndicadorPagamento.ipVista
          else if Pos('PRAZO', UpperCase(ABuscas.FieldByName('desc_cond_pag').AsString)) > 0 then
            indPag    := TpcnIndicadorPagamento.ipPrazo
          else
            indPag    := TpcnIndicadorPagamento.ipOutras;
          modelo    := StrToIntDef(Trim(ABuscas.FieldByName('modelo_nf').AsString), 55);
          serie     := ABuscas.FieldByName('serie').AsInteger;
          nNF       := ABuscas.FieldByName('num_nf').AsInteger;
          dEmi      := ABuscas.FieldByName('data_contabil').AsDateTime + StrToTimeDef(ABuscas.FieldByName('hora_emissao').AsString, Time);
          if not ABuscas.FieldByName('data_ent_saida').IsNull then
            dSaiEnt := ABuscas.FieldByName('data_ent_saida').AsDateTime + StrToTimeDef(ABuscas.FieldByName('hora_ent_saida').AsString, StrToTime('23:59:59'));
          if Trim(ABuscas.FieldByName('natureza_nf').AsString) = 'E' then
            tpNF    := tnEntrada
          else
            tpNF    := tnSaida;
          idDest    := StrToDestinoOperacao(AOk, ABuscas.FieldByName('nfe_iddest').AsString);
          cMunFG    := cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsInteger;
          NFref     := ACBrNFe.Classes.TNFrefCollection(
                                        GetNotasReferenciadas(CodNF,
                                          ABuscas.FieldByName('num_nf_compl').AsInteger,
                                          ABuscas.FieldByName('serie_compl').AsString)
                                        );
          tpImp     := tiRetrato;
          tpEmis    := StrToTpEmis(AOk, IntToStr(ATpEmis));
          //cDV       :=
          if cadempresa.dataSet.FieldByName('webserv_ambiente').AsString = 'Produção' then
            tpAmb   := taProducao
          else
            tpAmb   := taHomologacao;
          finNFe    := StrToFinNFe(AOk, ABuscas.FieldByName('tipo_emissao').AsString);
          if ABuscas.FieldByName('consumidor_final').AsString = 'S' then
            indFinal:= cfConsumidorFinal
          else
            indFinal:= cfNao;
          indPres   := StrToPresencaComprador(AOk, ABuscas.FieldByName('NFE_INDPRES').AsString);
          procEmi   := peAplicativoContribuinte;
          verProc   := GetVersaoProc;
          if (Trim(ABuscas.FieldByName('nfe_xjust').AsString) <> '') and
            (not ABuscas.FieldByName('nfe_dhcont').IsNull) then
          begin
            dhCont  := ABuscas.FieldByName('nfe_dhcont').AsDateTime;
            xJust   := ABuscas.FieldByName('nfe_xjust').AsString;
          end
          else if ATpEmis <> 1 then
          begin
            dhCont  := StrToDateTimeDef(cadempresa.vdhCont, Now);
            xJust   := cadempresa.vxJust;
          end;
             
        end; //Ide

        with Emit do
        begin
         CNPJCPF   := Trim(cadempresa.dataSet.FieldByName('cgc_emp').AsString);
         xNome     := Trim(cadempresa.dataSet.FieldByName('nome_emp').AsString);
         xFant     := Trim(cadempresa.dataSet.FieldByName('fantasia_emp').AsString);
          if Trim(xFant) = '' then
            xFant := xNome;
          with EnderEmit do
          begin
            xLgr    := cadempresa.dataSet.FieldByName('endreco_emp').AsString;//<logradouro>
            nro     := cadempresa.dataSet.FieldByName('numero_end').AsString;//<numero>
            xCpl    := cadempresa.dataSet.FieldByName('complemento_emp').AsString;//<complementos>
            xBairro := cadempresa.dataSet.FieldByName('bairro_emp').AsString;//<Bairro>
            cMun    := cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsInteger;
            xMun    := cadempresa.dataSet.FieldByName('cidade_emp').AsString;//<Cidade>
            UF      := cadempresa.dataSet.FieldByName('webserv_uf').AsString;//<Estado>
            CEP     := StrToInt64Def(Trim(cadempresa.dataSet.FieldByName('cep_emp').AsString), 0);
            cPais   := 1058;
            xPais   := 'BRASIL';
            fone    := cadempresa.dataSet.FieldByName('TELEFONE_EMP').AsString;
          end;
          IE        := Trim(cadempresa.dataSet.FieldByName('ie_emp').AsString);
          IEST      := Trim(ABuscas.FieldByName('inscricao_substituto').AsString);
          IM        := Trim(ABuscas.FieldByName('im_emp').AsString);
          CNAE      := Trim(ABuscas.FieldByName('cnae_fiscal').AsString);
          CRT       := StrToCRT(AOk, ABuscas.FieldByName('CRT').AsString);
        end; //Emit

        Dest := ACBrNFe.Classes.TDest(GetDest(Dest, ABuscas.FieldByName('cod_cliente').AsInteger));

        Retirada := ACBrNFe.Classes.TRetirada(GetRetirada(Retirada, CodNF));

        Entrega := ACBrNFe.Classes.TEntrega(GetEntrega(Entrega, CodNF));

        autXML := ACBrNFe.Classes.TautXMLCollection(GetAutXML(ABuscas.FieldByName('cod_cliente').AsInteger));

        AWriteIcmsUFDest := (Ide.idDest = doInterestadual) and (Ide.indFinal = cfConsumidorFinal) and (Dest.indIEDest = inNaoContribuinte);

        Det := ACBrNFe.Classes.TDetCollection(GetDet(CodNF, ABuscas.FieldByName('CRT').AsInteger, AWriteIcmsUFDest, Dest.EnderDest.UF));

        with Total do
        begin
          with ICMSTot do
          begin
            vBC          := ABuscas.FieldByName('base_icm').AsFloat;
            vICMS        := ABuscas.FieldByName('valor_icm').AsFloat;
            //vICMSDeson   := ;
            if AWriteIcmsUFDest then
            begin
              vFCPUFDest   := ABuscas.FieldByName('vfcpufdest').AsFloat;
              vICMSUFDest  := ABuscas.FieldByName('vicmsufdest').AsFloat;
              vICMSUFRemet := ABuscas.FieldByName('vicmsufremet').AsFloat;
            end;
            vBCST        := ABuscas.FieldByName('base_icmsub').AsFloat;
            vST          := ABuscas.FieldByName('valor_icmsub').AsFloat;
            vProd        := ABuscas.FieldByName('valor_prod').AsFloat;
            vFrete       := ABuscas.FieldByName('valor_frete').AsFloat;
            vSeg         := ABuscas.FieldByName('valor_seguro').AsFloat;
            vDesc        := ABuscas.FieldByName('valor_desc').AsFloat;
            vII          := ABuscas.FieldByName('valor_ii').AsFloat;
            vIPI         := ABuscas.FieldByName('valor_ipi').AsFloat;
            vPIS         := ABuscas.FieldByName('valor_pis').AsFloat;
            vCOFINS      := ABuscas.FieldByName('valor_cofins').AsFloat;
            vOutro       := ABuscas.FieldByName('valor_out_desp').AsFloat;
            vNF          := ABuscas.FieldByName('valor_total').AsFloat;
            vTotTrib     := ABuscas.FieldByName('vtottrib').AsFloat;
          end; //ICMSTot

          with ISSQNtot do
          begin

          end;//ISSQNtot
          //retTrib
        end;//Total

        with Transp do
        begin
          case StrToIntDef( Trim(ABuscas.FieldByName('freteconta_tr').AsString), -1) of
            0 : modFrete := mfContaTerceiros;
            1 : modFrete := mfContaEmitente;
            2 : modFrete := mfContaDestinatario;
            9 : modFrete := mfSemFrete;
          end;

          if ABuscas.FieldByName('codigo_tr').AsInteger > 0 then
            Transporta := ACBrNFe.Classes.TTransporta(GetTransporta(Transporta, ABuscas.FieldByName('codigo_tr').AsInteger));
          //retTransp  := ;
          with veicTransp do
          begin
            placa := Trim(ABuscas.FieldByName('placa_tr').AsString);
            UF    := Trim(ABuscas.FieldByName('uf_placa_tr').AsString);
            //RNTC  := ;
          end;//veicTransp

          if ABuscas.FieldByName('qtde_volumes_tr').AsInteger > 0 then
            with Vol.Add do
            begin
              qVol := ABuscas.FieldByName('qtde_volumes_tr').AsInteger;
              esp  := Trim(ABuscas.FieldByName('especie_tr').AsString);
              marca := Trim(ABuscas.FieldByName('marca_tr').AsString);
              nVol := Trim(ABuscas.FieldByName('numero_tr').AsString);
              pesoL := ABuscas.FieldByName('peso_l').AsFloat;
              pesoB := ABuscas.FieldByName('peso_b').AsFloat;
              //Lacres
            end;//Vol.Add

          //Reboque  := ;
          //vagao    := ;
          //enbalsa  := ;
        end;//Transp

        with Cobr do
        begin
          //Fat := ;
          Dup := ACBrNFe.Classes.TDupCollection(GetDup(CodNF));
        end;
        //pag := ; NFCe
        with InfAdic do
        begin
          //infAdFisco := ;
          infCpl := Copy(ABuscas.FieldByName('obs').AsString, 1, 2500) + #13 +
                    Copy(ABuscas.FieldByName('dados_interesse_fisco').AsString, 1, 2500);
          if (AWriteIcmsUFDest) and (Pos('Valor ICMS relativo ao FCP da UF', infCpl) = 0) then
             infCpl := infCpl + ';' +
               'Valor ICMS relativo ao FCP da UF destino: ' + Format('%n', [Total.ICMSTot.vFCPUFDest]) + ';' +
               'Valor ICMS Interestadual para UF destino, já considerando o valor ICMS relativo ao FCP na UF Destino: ' + Format('%n', [Total.ICMSTot.vICMSUFDest]) + ';' +
               'Valor ICMS Interestadual para a UF do remetente: ' + Format('%n', [Total.ICMSTot.vICMSUFRemet]);
          infCpl := FiltrarTextoXML(True, infCpl);
        end;//InfAdic

        if (ABuscas.FieldByName('natureza_nf').AsString = 'S') and
          (ABuscas.FieldByName('nfe_iddest').AsString = '3') then
          with exporta do
          begin
            //UFembarq     := ;
            //xLocEmbarq   := ;
            UFSaidaPais  := Trim(ABuscas.FieldByName('ufembarq').AsString);
            xLocExporta  := Trim(ABuscas.FieldByName('xlocembarq').AsString);
            xLocDespacho := Trim(ABuscas.FieldByName('xlocdespacho').AsString);
          end;//exporta
          //compra
          //cana
          //infNFeSupl
      end;

      Result := True;
    except on E: Exception do
      begin
        registraErro('TClassNfVenda.AddNotaFiscalToACBrNFe Erro: ' + e.Message);
        Application.MessageBox(PWideChar('Erro ao montar XML. Erro: ' + e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.CalcularBCICMSSimplesNacional(DetItem: TDetCollectionItem): Currency;
var
  cIcms: Currency;
begin
  cIcms := RoundTo( (DetItem.Prod.vProd - DetItem.Prod.vDesc) * DetItem.Imposto.ICMS.pCredSN / 100, -2);

  if cIcms = DetItem.Imposto.ICMS.vCredICMSSN then
    Result := DetItem.Prod.vProd - DetItem.Prod.vDesc
  else
    Result := RoundTo((DetItem.Imposto.ICMS.vCredICMSSN * 100) / DetItem.Imposto.ICMS.pCredSN, -2);
end;

function TClassNfVenda.CancelaNFEint(nnf: integer;vjust: string): boolean;
begin
try
 IniciaTransacao;
 edit;
 dataSet.fieldbyname('SITUACAO_NFE').AsString:='Cancelada';
 dataSet.fieldbyname('JUST_CANCELAMENTO').AsString:=vjust;
 dataset.FieldByName('SEL_NFE').Value:=0;
 Post;
 Apply;
 CommitaTransacao;
except
  on e: exception do
  begin
   RollBackTransacao;
   if application.messagebox('Erro ao gravar Justificativa de cancelamento da NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
  end;
end;
end;

procedure TClassNfVenda.CopiarQuery(var AQuery, ACopia: TIBQuery);
begin
  if ACopia = nil then
    ACopia := TIBQuery.Create(AQuery.Owner);
  ACopia.Database    := AQuery.Database;
  ACopia.Transaction := AQuery.Transaction;
end;

//function TClassNfVenda.ConsultaCamposNF(tabela, valorConsulta, Campo, condicao,
//  ordem: string; constante: boolean; codemp: string): boolean;
//begin
//end;
//
//function TClassNfVenda.ConsultaCamposNF(tabela, Campo, ordem, dataIni, dataFim,
//  codemp: string): boolean;
//begin
//
//end;

constructor TClassNfVenda.create;
begin
 inherited;
 dataSet:=TClientDataSet(DtmNFEHW.CdsNFeVenda);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
 buscaadc:=TIBQuery(DtmNFEHW.IbBuscasAdic);
 cadclfor:=TClassCliente.create;
 caditens:=TClassItNfVenda.create;
// vtemveic:='N';
 DtmNFEHW.DtNFe.DataSet:=DtmNFEHW.CdsNFeVenda;

 SetupDFeInitialize( buscas.Database );
end;

destructor TClassNfVenda.destroy;
begin
  dataSet.close;
  FreeAndNil(cadclfor);
  FreeAndNil(caditens);

  SetupDFeShutDown();

  inherited;
end;

function TClassNfVenda.GetADI(ACodNF, ANItem,
  ANitemDI: Integer): TObjectList;
var
  A_ADI: TAdiCollection;
  AOk: Boolean;
  ABuscas: TIBQuery;
begin
  A_ADI := TAdiCollection.Create;
  Result := TObjectList(A_ADI);

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.sql.text := 'select * from NOTAFISCAL_ITEM_ADI' +
     ' where cod_nf = ' + IntToStr(ACodNF) +
     ' and nitem = ' + IntToStr(ANItem) +
     ' and nitem_di = ' + IntToStr(ANitemDI) +
     ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
     ' order by nitem, nitem_di, nitem_adi';
    ABuscas.Open;

    ABuscas.First;
    while not ABuscas.Eof do
    begin
      with A_ADI.Add do
      begin
         nAdicao     := ABuscas.FieldByName('nadicao').AsInteger;
         nSeqAdi     := ABuscas.FieldByName('nseqadic').AsInteger;
         cFabricante := Trim(ABuscas.FieldByName('cfabricante').AsString);
         vDescDI     := ABuscas.FieldByName('vdescdi').AsFloat;
         nDraw       := Trim(ABuscas.FieldByName('ndraw').AsString);
      end;
      ABuscas.Next;
    end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.getArquivosBoletoParaAnexos(AidDoc: Integer): TStrings;
var
  AFileHtml: TStrings;
  AFileSettings: TStrings;
  ANameHtml, ANamePDF: string;
begin
  if not FSendBoleto then
    Exit;

  if AidDoc = 0 then
    AidDoc := dataSet.fieldbyname('COD_NF').AsInteger;

  Result := TStringList.Create;
  AFileHtml := TStringList.Create;
  AFileSettings := TStringList.Create;
  AFileSettings.Clear;

  try
    AFileSettings.Add('[Settings]');
    AFileSettings.Add('HTML=');
    AFileSettings.Add('PDF=');
    AFileSettings.Add('OpenAfterSave=0');

    buscaadc.Close;
    buscaadc.SQL.Text := 'select n_seq_bol, htmlboleto from boletas' +
                         ' where cod_nf = ' + AidDoc.ToString +
                         ' and tipo_emissao = ''NF'''+
                         ' and cod_empresa = '+ cadempresa.codempresa.ToString +
                         ' and ativo = 1' +
                         ' order by DATA_VEN_BOL';
    buscaadc.Open;
    while not buscaadc.Eof do
    begin
      AFileHtml.Text := buscaadc.FieldByName('htmlboleto').AsString;
      if AFileHtml.Count > 0 then
      begin
        ANameHtml := ExtractFilePath(Application.ExeName) + 'bol_' + buscaadc.FieldByName('n_seq_bol').AsInteger.ToString + '.html';
        ANamePDF  := ExtractFilePath(Application.ExeName) + 'bol_' + buscaadc.FieldByName('n_seq_bol').AsInteger.ToString + '.pdf';

        AFileHtml.SaveToFile(ANameHtml);

        AFileSettings[1] := 'HTML=' + ANameHtml;
        AFileSettings[2] := 'PDF=' + ANamePDF;
        AFileSettings.SaveToFile(ExtractFilePath(Application.ExeName) + 'htm2pdf.ini');
        CreateProcessSimple('htm2pdf.exe "' + ANameHtml + '" "' + ANamePDF + '" /silent', True);

        if FileExists(ANamePDF) then
          Result.Add(ANamePDF);
        DeleteFile(PWideChar(ANameHtml));
      end;

      buscaadc.Next;
    end;

    buscaadc.Close;
  finally
    FreeAndNil(AFileHtml);
    FreeAndNil(AFileSettings);
  end;
end;

function TClassNfVenda.GetAutXML(ACodCliente: Integer): TObjectList;
var
  AAutXML: TautXMLCollection;
  I: Integer;
  AFound: Boolean;
  AList, AListValid: TStringList;
  J: Integer;
  ABuscas: TIBQuery;
begin
  AAutXML := TautXMLCollection.Create;
  Result := TObjectList(AAutXML);

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    AList := TStringList.Create;
    AList.LineBreak := '|';
    AListValid := TStringList.Create;
    AListValid.Sorted := True;
    AListValid.Duplicates := dupIgnore;

    ABuscas.Close;
    ABuscas.SQL.Text := 'select NFE_AUTXML as valor from empresa' +
      ' where cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' union ' +
      ' select NFE_AUTXML as valor from clientes' +
      ' where cod_cliente = ' + IntToStr(ACodCliente) +
      ' and cod_empresa = ' + IntToStr(cadempresa.codempresa);
    ABuscas.Open;
    ABuscas.First;
    while not ABuscas.Eof do
    begin
      AList.Text := ABuscas.FieldByName('valor').AsString;
      for I := 0 to AList.Count - 1 do
        if Trim(AList[I]) <> '' then
          AListValid.Add(Trim(AList[I]));
      ABuscas.Next;
    end;

    for J := 0 to AListValid.Count - 1 do
    begin
      AFound := False;
      for I := 0 to AAutXML.Count - 1 do
        if AAutXML.Items[I].CNPJCPF = AListValid[J] then
          AFound := True;
      if not AFound then
        with AAutXML.Add do
          CNPJCPF := AListValid[J];
    end;
    AList.Free;
    AListValid.Free;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetDup(ACodNF: Integer): TObjectList;
var
  ADup: TDupCollection;
  AOk: Boolean;
  ABuscas: TIBQuery;
begin
  ADup := TDupCollection.Create;
  Result := TObjectList(ADup);

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.sql.text := 'select * from boletas' +
      ' where cod_nf = ' + IntToStr(ACodNF) +
      ' and tipo_emissao = ''NF''' +
      ' and cod_empresa = ' + IntToStr(cadempresa.codempresa);
    ABuscas.Open;

    ABuscas.First;
    while not ABuscas.Eof do
    begin
      with ADup.Add do
      begin
        nDup  := Trim(ABuscas.FieldByName('n_doc_bol').AsString);
        dVenc := ABuscas.FieldByName('data_ven_bol').AsDateTime;
        vDup  := ABuscas.FieldByName('VL_DOC_BOL').AsFloat;
      end;
      ABuscas.Next;
    end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetDest(AValue: TObject;
  ACodCliente: Integer): TObject;
var
  ADest: TDest;
  AOk: Boolean;
  ABuscas: TIBQuery;
begin
  ADest := TDest(AValue);
  Result := AValue;

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.SQL.Text :=
      'select clientes.cpfcgc, clientes.razao, clientes.endereco, clientes.num_end_cliente,' +
      ' clientes.complemento, clientes.bairro, cidades.ibge_cod_cidade, cidades.nome_cidade,' +
      ' estados.sigla_uf, clientes.cep, clientes.cod_pais, paises.nome_pais, clientes.fone_cliente,' +
      ' clientes.insc_est, clientes.email, clientes.nfe_idestrangeiro, clientes.nfe_indiedest ' +
      ' from clientes' +
      ' left join cidades on cidades.cod_cidade = clientes.cod_cidade' +
      ' left join estados on estados.codigo_uf = clientes.codigo_uf' +
      ' left join paises on paises.cod_pais = clientes.cod_pais' +
      ' where clientes.cod_cliente = ' + IntToStr(ACodCliente) +
      ' and clientes.cod_empresa = ' + IntToStr(cadempresa.codempresa);
    ABuscas.Open;

    ADest.CNPJCPF           := Trim(ABuscas.FieldByName('cpfcgc').AsString);
    ADest.idEstrangeiro     := Trim(ABuscas.FieldByName('nfe_idestrangeiro').AsString);
    //ADest.ISUF              := '';
    ADest.xNome             := Trim(ABuscas.FieldByName('razao').AsString);
    with ADest.EnderDest do
    begin
      xLgr    := Trim(ABuscas.FieldByName('endereco').AsString);
      nro     := Trim(ABuscas.FieldByName('num_end_cliente').AsString);
      xCpl    := Trim(ABuscas.FieldByName('complemento').AsString);
      xBairro := Trim(ABuscas.FieldByName('bairro').AsString);
      cMun    := ABuscas.FieldByName('ibge_cod_cidade').AsInteger;
      xMun    := Trim(ABuscas.FieldByName('nome_cidade').AsString);
      UF      := Trim(ABuscas.FieldByName('sigla_uf').AsString);
      CEP     := StrToIntDef(Trim(ABuscas.FieldByName('cep').AsString), 0);
      cPais   := ABuscas.FieldByName('cod_pais').AsInteger;
      xPais   := Trim(ABuscas.FieldByName('nome_pais').AsString);
      fone    := Trim(ABuscas.FieldByName('fone_cliente').AsString);
      if cPais = 0 then
      begin
        cPais := 1058;
        xPais := 'BRASIL';
      end;
    end;
    if Trim(ABuscas.fieldbyname('insc_est').AsString) <> 'ISENTO' then
      ADest.IE := Trim(ABuscas.fieldbyname('insc_est').AsString);

    if ABuscas.fieldbyname('nfe_indiedest').AsInteger = 0 then
    begin
      if ADest.IE = '' then
        ADest.indIEDest := inNaoContribuinte
      else
        ADest.indIEDest := inContribuinte;
    end
    else
      ADest.indIEDest := StrToindIEDest(AOk, IntToStr(ABuscas.fieldbyname('nfe_indiedest').AsInteger));
    //ADest.IM              :=
    ADest.Email := GetListaEmails(ABuscas.fieldbyname('email').AsString.Trim)[0].Substring(0, 60);
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetDet(ACodNF,
  ACRT: Integer; var AWriteIcmsUFDest: Boolean;
  ACombUFCons: string): TObjectList;
  
  function GetEAN(AGrupo: Integer; ACodigo: string): string;
  var
    ARetorno: string;
    ABuscasT: TIBQuery;
  begin
    ARetorno := '';

    ABuscasT := nil;
    CopiarQuery(buscaadc, ABuscasT);
    try
      ABuscasT.Close;
      ABuscasT.SQL.Text := 'select cod_barra from cod_barra' +
        ' where grupo_prod = ' + IntToStr(AGrupo) +
        ' and cod_prod = ' + QuotedStr(ACodigo) +
        ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
        ' order by cod_barra';
      ABuscasT.Open;
      ABuscasT.First;
      while not ABuscasT.Eof do
      begin
        if (Length(Trim(ABuscasT.FieldByName('cod_barra').AsString)) = 8) or
          (Length(Trim(ABuscasT.FieldByName('cod_barra').AsString)) = 12) or
          (Length(Trim(ABuscasT.FieldByName('cod_barra').AsString)) = 13) or
          (Length(Trim(ABuscasT.FieldByName('cod_barra').AsString)) = 14) then
        begin
          try
            if TClassItNfVenda(caditens).ValidaEAN(apenasNumeros(ABuscasT.FieldByName('cod_barra').AsString)) then
              ARetorno := Trim(ABuscasT.FieldByName('cod_barra').AsString);
          except
          end;
          Break;
        end;
        ABuscasT.Next;
      end;
    finally
      Result := ARetorno;
      FreeAndNil(ABuscasT);
    end;
  end;

var
  ADet: TDetCollection;
  ANVEList: TStrings;
  I: Integer;
  AOrigem, ACST, ACSOSN, AinfAdProdVeic, AxProd: string;
  AOk, AFoundIcmsUFDest: Boolean;
  ABuscas: TIBQuery;
begin
  ADet := TDetCollection.Create;
  Result := TObjectList(ADet);
  AFoundIcmsUFDest := False;

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.SQL.Text := 'select * from notafiscal_item' +
      ' where cod_nf = ' + IntToStr(ACodNF) +
      ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' order by nitem';
    ABuscas.Open;

    ABuscas.First;
    while not ABuscas.Eof do
    begin
      AinfAdProdVeic := '';
      AxProd         := '';
      with ADet.Add do
      begin
        with Prod do
        begin
          cProd    := Trim(ABuscas.FieldByName('num_fab_prod').AsString);
          nItem    := ABuscas.FieldByName('nitem').AsInteger;
          cEAN     := GetEAN(ABuscas.FieldByName('grupo_prod').AsInteger, ABuscas.FieldByName('cod_prod').AsString);
          if cEAN.Trim.IsEmpty then
            if TClassItNfVenda(Self.caditens).ValidaEAN(apenasNumeros(cProd)) then
              cEAN := cProd;
          if ABuscas.FieldByName('descricao_item_outras').AsString <> '' then
            xProd  := Trim(ABuscas.FieldByName('descricao_item_outras').AsString)
          else
            xProd  := Trim(ABuscas.FieldByName('descricao_item').AsString);
          NCM      := Trim(ABuscas.FieldByName('ncm').AsString);
          ANVEList := Split(Trim(ABuscas.FieldByName('nve').AsString), '|', True, True);
          if Assigned(ANVEList) then
            for I := 0 to ANVEList.Count - 1 do
              NVE.Add.NVE := ANVEList[I];
          //EXTIPI   := ;
          CFOP     := Trim(ABuscas.FieldByName('codigo_nop').AsString);
          uCom     := Trim(ABuscas.FieldByName('referencia').AsString);
          qCom     := ABuscas.FieldByName('quantidade').AsFloat;
          vUnCom   := ABuscas.FieldByName('valor_unitario').AsFloat;
          vProd    := ABuscas.FieldByName('valor_total').AsFloat;
          cEANTrib := cEAN;
          uTrib    := uCom;
          qTrib    := qCom;
          vUnTrib  := vUnCom;
          vFrete   := ABuscas.FieldByName('rateio_frete').AsFloat;
          vSeg     := ABuscas.FieldByName('rateio_seguro').AsFloat;
          vDesc    := ABuscas.FieldByName('rateio_desconto').AsFloat;
          vOutro   := ABuscas.FieldByName('rateio_outdesp').AsFloat;

          if ABuscas.FieldByName('indtot').AsString = '0' then
            IndTot := itNaoSomaTotalNFe
          else
            IndTot := itSomaTotalNFe;
          DI       := TDICollection(GetDI(ACodNF, nItem));
          xPed     := Trim(ABuscas.FieldByName('xped_compra').AsString);
          nItemPed := Trim(ABuscas.FieldByName('nitemped_compra').AsString);
          detExport:= TdetExportCollection(GetdetExport(ACodNF, nItem));
          veicProd := TveicProd(GetveicProd(veicProd, ACodNF, nItem, AinfAdProdVeic, AxProd));
          if AxProd <> '' then
            xProd := AxProd;
          if AinfAdProdVeic <> '' then
            infAdProd := AinfAdProdVeic;
          //med      :=
          //arma     :=
          with comb do
          begin
            cProdANP  := StrToInt64Def(ABuscas.FieldByName('comb_cprodanp').AsString, 0);
            pMixGN    := ABuscas.FieldByName('comb_pmixgn').AsFloat;
            CODIF     := Trim(ABuscas.FieldByName('comb_codif').AsString);
            qTemp     := ABuscas.FieldByName('comb_qtemp').AsFloat;
            if cProdANP > 0 then
              if Trim(ABuscas.FieldByName('comb_ufcons').AsString) <> '' then
                UFcons := ABuscas.FieldByName('comb_ufcons').AsString
              else
                UFcons := ACombUFCons;
            with CIDE do
            begin
              qBCProd   := ABuscas.FieldByName('comb_cide_qbcprod').AsFloat;
              vAliqProd := ABuscas.FieldByName('comb_cide_valiqprod').AsFloat;
              vCIDE     := ABuscas.FieldByName('comb_cide_vcide').AsFloat;
            end;
            //ICMS      := ;
            //ICMSInter := ;
            //ICMSCons  := ;
            //encerrante:= ;
          end;
          nRECOPI  := Trim(ABuscas.FieldByName('nfe_nrecopi').AsString);
          nFCI     := Trim(ABuscas.FieldByName('nfci').AsString);
          if nFCI.Trim.Length = 32 then
            nFCI := nFCI.Insert(08, '-').Insert(13, '-').Insert(18, '-').Insert(23, '-');

          CEST     := Trim(ABuscas.FieldByName('cest').AsString);
        end; //Prod
      
        pDevol    := ABuscas.FieldByName('nfe_pdevol').AsFloat;
        vIPIDevol := ABuscas.FieldByName('nfe_vipidevol').AsFloat;

        if ABuscas.FieldByName('tipo_item').AsString = 'V' then
          infAdProd := AinfAdProdVeic;

        with Imposto do
        begin
          vTotTrib := ABuscas.FieldByName('vtottrib').AsFloat;
          AOrigem := Copy(Trim(ABuscas.FieldByName('cst').AsString), 1, 1);
          ACST := Copy(Trim(ABuscas.FieldByName('cst').AsString), 2, 2);
          ACSOSN := Trim(ABuscas.FieldByName('csosn').AsString);
          with ICMS do
          begin
            orig := StrToOrig(AOk, AOrigem);
            if ACRT = 1 then
            begin
              CSOSN := StrToCSOSNIcms(AOk, ACSOSN);
              CST   := cstVazio;
            end
            else
            begin
              CST := StrToCSTICMS(AOk, ACST);
              CSOSN := csosnVazio;
            end;
          
            if CST in [cst00, cst10, cst20, cst51, cst70, cst90] then
              modBC      := StrTomodBC(AOk, Trim(ABuscas.FieldByName('modbc').AsString));
            if CST in [cst20, cst51, cst70, cst90] then
              pRedBC     := ABuscas.FieldByName('perc_red_prod').AsFloat;
            if (CST in [cst00, cst10, cst20, cst51, cst70, cst90]) or
              (CSOSN in [csosn900]) then
            begin
              vBC        := ABuscas.FieldByName('base_icm').AsFloat;
              pICMS      := ABuscas.FieldByName('aliq_icm').AsFloat;
              vICMS      := ABuscas.FieldByName('valor_icm').AsFloat;
            end;
            if (CST in [cst10, cst30, cst70, cst90]) or
                (CSOSN in [csosn201, csosn202, csosn203, csosn900]) then
            begin
              modBCST    := StrTomodBCST(AOk, Trim(ABuscas.FieldByName('modbcst').AsString));
              pMVAST     := ABuscas.FieldByName('mva').AsFloat;
              pRedBCST   := ABuscas.FieldByName('perc_red_prod_sub').AsFloat;
              vBCST      := ABuscas.FieldByName('base_icmsub').AsFloat;
              pICMSST    := ABuscas.FieldByName('aliq_icmsub').AsFloat;
              vICMSST    := ABuscas.FieldByName('valor_icmsub').AsFloat;
            end;
            if (CST in [cst60]) or
              (CSOSN in [csosn500]) then
            begin
              vBCSTRet   := ABuscas.FieldByName('base_icmant_sub').AsFloat;
              vICMSSTRet := ABuscas.FieldByName('valor_icmant_sub').AsFloat;
            end;

            if CSOSN in [csosn101, csosn201, csosn900] then
            begin
              pCredSN     := ABuscas.FieldByName('aliq_icm_simples').AsFloat;
              vCredICMSSN := ABuscas.FieldByName('valor_icm_simples').AsFloat;
            end;
          end; //ICMS

          with IPI do
          begin
            cEnq := Trim(ABuscas.FieldByName('cenq_ipi_nfe').AsString);
            vBC  := ABuscas.FieldByName('base_ipi').AsFloat;
            pIPI := ABuscas.FieldByName('aliq_ipi').AsFloat;
            vIPI := ABuscas.FieldByName('valor_ipi').AsFloat;
            if Trim(cEnq) = '' then
            begin
              cEnq := '999';
              CST  := ipi99;
            end
            else
              CST := StrToCSTIPI(AOk, ABuscas.FieldByName('cst_ipi').AsString);
          end;

          with II do
          begin
            vBc      := ABuscas.FieldByName('base_ii').AsFloat;
            vDespAdu := ABuscas.FieldByName('valor_despadu_ii').AsFloat;
            vII      := ABuscas.FieldByName('valor_ii').AsFloat;
            vIOF     := ABuscas.FieldByName('valor_iof_ii').AsFloat;
          end;

          with PIS do
          begin
            CST       := StrToCSTPIS(AOk, ABuscas.FieldByName('cst_pis').AsString);
            if CST = pis05 then
              CST     := pis99;
            vBC       := ABuscas.FieldByName('base_pis').AsFloat;
            pPIS      := ABuscas.FieldByName('aliq_pis').AsFloat;
            vPIS      := ABuscas.FieldByName('valor_pis').AsFloat;
            qBCProd   := ABuscas.FieldByName('quant_bc_pis').AsFloat;
            vAliqProd := ABuscas.FieldByName('aliq_pis_quant').AsFloat;
          end;

          with PISST do
          begin
            //vBc       := ;
            //pPis      := ;
            //qBCProd   := ;
            //vAliqProd := ;
            //vPIS      := ;
          end;

          with COFINS do
          begin
            CST       := StrToCSTCOFINS(AOk, ABuscas.FieldByName('cst_cofins').AsString);
            if CST = cof05 then
              CST     := cof99;
            vBC       := ABuscas.FieldByName('base_cofins').AsFloat;
            pCOFINS   := ABuscas.FieldByName('aliq_cofins').AsFloat;
            vCOFINS   := ABuscas.FieldByName('valor_cofins').AsFloat;
            qBCProd   := ABuscas.FieldByName('quant_bc_cofins').AsFloat;
            vAliqProd := ABuscas.FieldByName('aliq_cofins_quant').AsFloat;
          end;
          with COFINSST do
          begin
            //vBc       := ;
            //pPis      := ;
            //qBCProd   := ;
            //vAliqProd := ;
            //vPIS      := ;
          end;

          //ISSQN

          with ICMSUFDest do
          begin
            vBCUFDest     := ABuscas.FieldByName('vbcufdest').AsFloat;
            pFCPUFDest    := ABuscas.FieldByName('pfcpufdest').AsFloat;
            pICMSUFDest   := ABuscas.FieldByName('picmsufdest').AsFloat;
            pICMSInter    := ABuscas.FieldByName('picmsinter').AsFloat;
            pICMSInterPart:= ABuscas.FieldByName('picmsinterpart').AsFloat;
            vFCPUFDest    := ABuscas.FieldByName('vfcpufdest').AsFloat;
            vICMSUFDest   := ABuscas.FieldByName('vicmsufdest').AsFloat;
            vICMSUFRemet  := ABuscas.FieldByName('vicmsufremet').AsFloat;

            if (vBCUFDest > 0)  or (pFCPUFDest > 0)     or (pICMSUFDest > 0) or
              (pICMSInter > 0)  or (pICMSInterPart > 0) or (vFCPUFDest > 0) or
              (vICMSUFDest > 0) or (vICMSUFRemet > 0) then
              AFoundIcmsUFDest := True;
          end; //ICMSUFDest
        end; //Imposto

      end;


      ABuscas.Next;
    end;
    // case tenha gravado os valores nos itens aqui irá retornar os valores para os totais da nf
    AWriteIcmsUFDest := AFoundIcmsUFDest;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetdetExport(ACodNF, ANItem: Integer): TObjectList;
var
  AdetExport: TdetExportCollection;
  AOk: Boolean;
  ABuscas: TIBQuery;
begin
  AdetExport := TdetExportCollection.Create;
  Result := TObjectList(AdetExport);

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.sql.text := 'select exp.ndraw, expi.nre, expi.chnfe, expi.qexport ' +
      ' from NOTAFISCAL_ITEM_DETEXPORT exp' +
      ' left join NOTAFISCAL_ITEM_EXPORTIND expi on expi.cod_nf = exp.cod_nf' +
      ' and expi.cod_empresa = exp.cod_empresa and expi.nitem = exp.nitem' +
      ' and expi.nitem_det = exp.nitem_det' +
      ' where exp.cod_nf = ' + IntToStr(ACodNF) +
      ' and exp.nitem = ' + IntToStr(ANItem) +
      ' and exp.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' order by exp.nitem, exp.nitem_det';
    ABuscas.Open;

    ABuscas.First;
    while not ABuscas.Eof do
    begin
      with AdetExport.Add do
      begin
        nDraw   := Trim(ABuscas.FieldByName('ndraw').AsString);
        nRE     := Trim(ABuscas.FieldByName('nre').AsString);
        chNFe   := Trim(ABuscas.FieldByName('chnfe').AsString);
        qExport := ABuscas.FieldByName('qexport').AsFloat;
      end;
      ABuscas.Next;
    end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetDI(ACodNF,
  ANItem: Integer): TObjectList;
var
  A_DI: TDICollection;
  AOk: Boolean;
  ABuscas: TIBQuery;
begin
  A_DI := TDICollection.Create;
  Result := TObjectList(A_DI);

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.sql.text := 'select * from NOTAFISCAL_ITEM_DI' +
     ' where cod_nf = ' + IntToStr(ACodNF) +
     ' and nitem = ' + IntToStr(ANItem) +
     ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
     ' order by nitem, nitem_di';
    ABuscas.Open;

    ABuscas.First;
    while not ABuscas.Eof do
    begin
      with A_DI.Add do
      begin
        nDi         := Trim(ABuscas.FieldByName('ndi').AsString);
        dDi         := ABuscas.FieldByName('ddi').AsDateTime;
        xLocDesemb  := Trim(ABuscas.FieldByName('xlocdesemb').AsString);
        UFDesemb    := Trim(ABuscas.FieldByName('ufdesemb').AsString);
        dDesemb     := ABuscas.FieldByName('ddesemb').AsDateTime;
        tpViaTransp := StrToTipoViaTransp(AOk, Trim(ABuscas.FieldByName('tpviatransp').AsString));
        vAFRMM      := ABuscas.FieldByName('vafrmm').AsFloat;
        tpIntermedio:= StrToTipoIntermedio(AOk, Trim(ABuscas.FieldByName('tpintermedio').AsString));
        CNPJ        := Trim(ABuscas.FieldByName('cnpj').AsString);
        UFTerceiro  := Trim(ABuscas.FieldByName('ufterceiro').AsString);
        cExportador := Trim(ABuscas.FieldByName('cexportador').AsString);
        adi         := TAdiCollection(GetADI(ACodNF, ANItem, ABuscas.FieldByName('nitem_di').AsInteger));
      end;
      ABuscas.Next;
    end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetEntrega(AValue: TObject;
  ACodNF: Integer): TObject;
var
  AEntrega: TEntrega;
  AOk: Boolean;
  ABuscas: TIBQuery;
begin
  AEntrega := TEntrega(AValue);
  Result := AValue;

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.sql.text := 'select first 1 * from notafiscal_sped_c115' +
     ' where cod_nf = ' + IntToStr(ACodNF) +
     ' and cod_empresa = ' + IntToStr(cadempresa.codempresa);
    ABuscas.Open;
    if not ABuscas.IsEmpty then
      if ABuscas.FieldByName('nfe_xlgr_entg').AsString <> '' then
        with AEntrega do
        begin
          CNPJCPF := Trim(ABuscas.FieldByName('cnpj_entg').AsString);
          if CNPJCPF = '' then
            CNPJCPF := Trim(ABuscas.FieldByName('cpf_entg').AsString);
          xLgr    := Trim(ABuscas.FieldByName('nfe_xlgr_entg').AsString);
          nro     := Trim(ABuscas.FieldByName('nfe_nro_entg').AsString);
          xCpl    := Trim(ABuscas.FieldByName('nfe_xcpl_entg').AsString);
          xBairro := Trim(ABuscas.FieldByName('nfe_xbairro_entg').AsString);
          cMun    := ABuscas.FieldByName('cod_mun_entg').AsInteger;
          xMun    := Trim(ABuscas.FieldByName('nfe_xmun_entg').AsString);
          UF      := Trim(ABuscas.FieldByName('uf_entg').AsString);
        end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetNotasReferenciadas(
  ACodNF, ANumNFCompl: Integer; ASerieNFCompl: string): TObjectList;
var
  ARef: TNFrefCollection;
  I: Integer;
  AFound, AOK: Boolean;
  ABuscas: TIBQuery;
begin
  ARef := TNFrefCollection.Create;
  Result := TObjectList(ARef);

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    if (ANumNFCompl > 0) and (Trim(ASerieNFCompl) <> '') then
    begin
      ABuscas.Close;
      ABuscas.SQL.Text := 'select chave_nfe as valor from notafiscal' +
        ' where serie = ' + QuotedStr(ASerieNFCompl) +
        ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
        ' and num_nf = ' + IntToStr(ANumNFCompl);
      ABuscas.Open;
      if Trim(ABuscas.FieldByName('valor').AsString) <> '' then
        with ARef.Add do
          refNFe := Trim(ABuscas.FieldByName('valor').AsString);
    end;

    ABuscas.close;
    ABuscas.sql.text:=
      'select nf.chave_nfe as valor from NOTAFISCAL_SPED_C113 nr' +
      ' inner join notafiscal nf on nf.cod_nf = nr.cod_nf_ref and nf.cod_empresa = nr.cod_empresa and coalesce(nf.chave_nfe,'''') <> ''''' +
      ' where nr.cod_nf = ' + IntToStr(ACodNF) +
      ' and nr.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' union ' +
      ' select nr.chave_nfe_ref as valor from NOTAFISCAL_SPED_C113 nr' +
      ' where nr.cod_nf = ' + IntToStr(ACodNF) +
      ' and nr.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' and cod_nf_ref < 0';
    ABuscas.Open;
    ABuscas.First;
    while not ABuscas.Eof do
    begin
      AFound := False;
      for I := 0 to ARef.Count - 1 do
        if ARef.Items[I].refNFe = Trim(ABuscas.FieldByName('valor').AsString) then
          AFound := True;
      if not AFound then
        with ARef.Add do
          refNFe := Trim(ABuscas.FieldByName('valor').AsString);
     ABuscas.Next;
    end;

    ABuscas.close;
    ABuscas.sql.text:=
      'select distinct nf.chave_nfe as valor from notafiscal_item nfi' +
      ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf_dev and nf.cod_empresa = nfi.cod_empresa and coalesce(nf.chave_nfe,'''') <> ''''' +
      ' where nfi.cod_nf = ' + IntToStr(ACodNF) +
      ' and nfi.cod_empresa = ' + IntToStr(cadempresa.codempresa);
    ABuscas.Open;
    ABuscas.First;
    while not ABuscas.Eof do
    begin
      AFound := False;
      for I := 0 to ARef.Count - 1 do
        if ARef.Items[I].refNFe = Trim(ABuscas.FieldByName('valor').AsString) then
          AFound := True;
      if not AFound then
        with ARef.Add do
          refNFe := Trim(ABuscas.FieldByName('valor').AsString);
     ABuscas.Next;
    end;

    ABuscas.Close;
    ABuscas.SQL.Text := 'select e.ibge_codigo_uf, nf.data_contabil, cl.cpfcgc, ''01'' modelo_nf, nf.serie, nf.num_nf from NOTAFISCAL_SPED_C113 nr' +
     ' inner join notafiscal nf on nf.cod_nf = nr.cod_nf_ref and nf.cod_empresa = nr.cod_empresa and nf.modelo_nf in (''1'', ''01'', ''001'', ''1A'', ''01A'', ''1/A'', ''1-A'')' +
     ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
     ' inner join estados e on e.codigo_uf = cl.codigo_uf' +
     ' where nr.cod_nf = :cod_nf' +
     ' and nr.cod_empresa = :cod_empresa' +
     ' union' +
     ' select e.ibge_codigo_uf, nf.data_contabil, cl.cpfcgc, ''01'' modelo_nf, nf.serie, nf.num_nf from notafiscal_item nfi' +
     ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf_dev and nf.cod_empresa = nfi.cod_empresa and nf.modelo_nf in (''1'', ''01'', ''001'', ''1A'', ''01A'', ''1/A'', ''1-A'')' +
     ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
     ' inner join estados e on e.codigo_uf = cl.codigo_uf' +
     ' where nfi.cod_nf = :cod_nf' +
     ' and nfi.cod_empresa = :cod_empresa';
    ABuscas.ParamByName('cod_nf').AsInteger := ACodNF;
    ABuscas.ParamByName('cod_empresa').AsInteger := cadempresa.codempresa;
    ABuscas.Open;

    ABuscas.First;
    while not ABuscas.Eof do
    begin
      if (ABuscas.FieldByName('ibge_codigo_uf').AsInteger > 0) and
        (ABuscas.FieldByName('num_nf').AsInteger > 0) and
        (Length(Trim(ABuscas.FieldByName('cpfcgc').AsString)) = 14) then
      begin
        AFound := False;
        for I := 0 to ARef.Count - 1 do
          if(ARef.Items[I].RefNF.cUF = ABuscas.FieldByName('ibge_codigo_uf').AsInteger) and
            (ARef.Items[I].RefNF.AAMM = Copy( IntToStr(YearOf(ABuscas.FieldByName('data_contabil').AsDateTime)) , 3, 2) + StrZero( MonthOf(ABuscas.FieldByName('data_contabil').AsDateTime) ,2)) and
            (ARef.Items[I].RefNF.CNPJ = Trim(ABuscas.FieldByName('cpfcgc').AsString)) and
            (ARef.Items[I].RefNF.modelo = StrToIntDef(Trim(ABuscas.FieldByName('modelo_nf').AsString),1)) and
            (ARef.Items[I].RefNF.serie = StrToIntDef(Trim(ABuscas.FieldByName('serie').AsString),0)) and
            (ARef.Items[I].RefNF.nNF = ABuscas.FieldByName('num_nf').AsInteger) then
          AFound := True;
        if not AFound then
          with ARef.Add do
          begin
            RefNF.cUF    := ABuscas.FieldByName('ibge_codigo_uf').AsInteger;
            //RefNF.AAMM   := Copy( IntToStr(YearOf(ABuscas.FieldByName('data_contabil').AsDateTime)) , 3, 2) + StrZero( MonthOf(ABuscas.FieldByName('data_contabil').AsDateTime) ,2));
            RefNF.AAMM   := FormatDateTime('YYMM', ABuscas.FieldByName('data_contabil').AsDateTime);
            RefNF.CNPJ   := Trim(ABuscas.FieldByName('cpfcgc').AsString);
            RefNF.modelo := StrToIntDef(Trim(ABuscas.FieldByName('modelo_nf').AsString),1);
            RefNF.serie  := StrToIntDef(Trim(ABuscas.FieldByName('serie').AsString),0);
            RefNF.nNF    := ABuscas.FieldByName('num_nf').AsInteger;
          end;
      end;
      ABuscas.Next;
    end;
    ABuscas.Close;
    ABuscas.sql.text:= 'select * from notafiscal_sped_c114' +
      ' where cod_nf = ' + IntToStr(ACodNF) +
      ' and cod_empresa = ' + IntToStr(cadempresa.codempresa);
    ABuscas.Open;
    ABuscas.First;
    while not ABuscas.Eof do
    begin  
      AFound := False;
      for I := 0 to ARef.Count - 1 do
        if(ARef.Items[I].RefECF.modelo = StrToECFModRef(AOK, ABuscas.FieldByName('cod_mod').AsString)) and
          (ARef.Items[I].RefECF.nECF = IntToStr(ABuscas.FieldByName('ecf_cx').AsInteger)) and
          (ARef.Items[I].RefECF.nCOO = IntToStr(ABuscas.FieldByName('num_doc').AsInteger)) then
        AFound := True;
      if not AFound then
        with ARef.Add do
        begin
          RefECF.modelo := StrToECFModRef(AOK, ABuscas.FieldByName('cod_mod').AsString);
          RefECF.nECF   := IntToStr(ABuscas.FieldByName('ecf_cx').AsInteger);
          RefECF.nCOO   := IntToStr(ABuscas.FieldByName('num_doc').AsInteger);
        end;
      ABuscas.Next;
    end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetRetirada(AValue: TObject;
  ACodNF: Integer): TObject;
var
  ARetirada: TRetirada;
  AOk: Boolean;
  ABuscas: TIBQuery;
begin
  ARetirada := TRetirada(AValue);
  Result := AValue;

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.sql.text := 'select first 1 * from notafiscal_sped_c115' +
     ' where cod_nf = ' + IntToStr(ACodNF) +
     ' and cod_empresa = ' + IntToStr(cadempresa.codempresa);
    ABuscas.Open;
    if not ABuscas.IsEmpty then
      if ABuscas.FieldByName('nfe_xlgr_col').AsString <> '' then
        with ARetirada do
        begin
          CNPJCPF := Trim(ABuscas.FieldByName('cnpj_col').AsString);
          if CNPJCPF = '' then
            CNPJCPF := Trim(ABuscas.FieldByName('cpf_col').AsString);
          xLgr    := Trim(ABuscas.FieldByName('nfe_xlgr_col').AsString);
          nro     := Trim(ABuscas.FieldByName('nfe_nro_col').AsString);
          xCpl    := Trim(ABuscas.FieldByName('nfe_xcpl_col').AsString);
          xBairro := Trim(ABuscas.FieldByName('nfe_xbairro_col').AsString);
          cMun    := ABuscas.FieldByName('cod_mun_col').AsInteger;
          xMun    := Trim(ABuscas.FieldByName('nfe_xmun_col').AsString);
          UF      := Trim(ABuscas.FieldByName('uf_col').AsString);
        end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.AddNFeInDBFromXML(AListParams: string): string;
var
  //Parametros
  ASisAuto, ASisVeic, AUsarCorFabDenatran, ABuscaCodNoProduto: Boolean;
  ACodEmpresa, ACodNF, ACodUsuario, ANivel: Integer;
  AUsuario, ACNPJ, AFileName: string;
  //fim parametros
  ANFe: TACBrNFe;
  //ADelimiter: string;
  AStrCondicao: string;
  ACodBairro, ACodCidade, ACodUF, ACodCliente, ACodTransporta, I: Integer;
  ADataHoraDB: TDateTime;
  AVeicVersao: Integer;
  AList: TStrings;
  AExecSql: TIBQuery;
  AvincProd: TVinculoProdutos;
  ADigitosProd: Integer;
  AUsarCodigoSequencialProduto: string;
  ACadProdAberto: string;
  AUFDest: string;
  AxmlNfe: string;
  vValidarVinculos, tipoNF_P_V_O: string;
  cnpjsNF, cnpjsCadProd: TStrings;
  tributoHandler: ITributosPersistentHandler;
  tribDFe: TributoDFeContextEtd;
begin
  AList := TStringList.Create;
  AList.Delimiter := ',';
  try
    AList.Text                    := AListParams;
    ASisAuto                      := TAuxiliar.GetParam('ASisAuto', AList).ToBoolean;
    ASisVeic                      := TAuxiliar.GetParam('ASisVeic', AList).ToBoolean;
    AUsarCorFabDenatran           := TAuxiliar.GetParam('AUsarCorFabDenatran', AList).ToBoolean;
    ACodEmpresa                   := TAuxiliar.GetParam('ACodEmpresa', AList).ToInteger;
    ACodUsuario                   := TAuxiliar.GetParam('ACodUsuario', AList).ToInteger;
    ACodNF                        := TAuxiliar.GetParam('ACodNF', AList).ToInteger;
    AUsuario                      := TAuxiliar.GetParam('AUsuario', AList).Trim;
    ANivel                        := TAuxiliar.GetParam('ANivel', AList).ToInteger;
    ACNPJ                         := TAuxiliar.GetParam('ACNPJ', AList).Trim;
    AUFDest                       := TAuxiliar.GetParam('AUFDest', AList).Trim;
    AFileName                     := TAuxiliar.GetParam('AFileName', AList).Trim;
    vcaminhobanco                 := TAuxiliar.GetParam('ADabaseName', AList).Trim;
    ABuscaCodNoProduto            := TAuxiliar.GetParam('ABuscaCodNoProduto', AList).ToBoolean;
    ADigitosProd                  := TAuxiliar.GetParam('ADigitosProd', AList).ToInteger;
    AUsarCodigoSequencialProduto  := TAuxiliar.GetParam('AUsarCodigoSequencialProduto', AList).Trim;
    ACadProdAberto                := TAuxiliar.GetParam('ACadProdAberto', AList).Trim;
    cnpjsNF                       := NewStringList(AList.Values['CNPJsEntrada'], ',');
    cnpjsCadProd                  := NewStringList(AList.Values['CNPJsCadastroProduto'], ',');
    if TAuxiliar.GetParam('ANatureza', AList) = 'S' then
      Exit(AddNFeInDBFromXMLSaida(AListParams));
  finally
    FreeAndNil(AList);
  end;

  if not FileExists(AFileName) then
    Exit('ERRO|Arquivo não existe');

  if not conectaBanco then
    Exit('ERRO|Não foi possível conectar ao banco de dados');

  ANFe                 := TACBrNFe.Create(Application);
  AExecSql             := TIBQuery.Create(buscas.Owner);
  AExecSql.Database    := buscas.Database;
  AExecSql.Transaction := buscas.Transaction;
  AList                := TStringList.Create;

  tributoHandler := TributosPersistentHandler.Create(
    AExecSql.Transaction,
    ContainerDFe.GetInstance().DFeFeaturesFactory.CreateSalvarTributoDFeUseCase(),
    nil
  );

  try
    try
      AList.LoadFromFile(AFileName);
      if AList.Text.ToLower.Contains('<nfeproc xmlns=''') and
         AList.Text.ToLower.Contains('<infnfe versao=''') and
         AList.Text.ToLower.Contains('<det nitem=''') then
      ANFe.NotasFiscais.LoadFromString( UTF8ToString( AList.Text ))
      else
      ANFe.NotasFiscais.LoadFromString( UTF8ToString( AList.Text.
        Replace('<?xml version=''1.0'' encoding=''utf-8''?>', '<?xml version="1.0" encoding="utf-8"?>', [rfIgnoreCase]).
        Replace('<nfeProc versao=''3.10''', '<nfeProc versao="3.10"', [rfIgnoreCase]).
        Replace('<nfeProc xmlns=''http://www.portalfiscal.inf.br/nfe''', '<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe"', [rfIgnoreCase]).
        Replace('<nfeProc versao="3.10" xmlns=''http://www.portalfiscal.inf.br/nfe''>', '<nfeProc versao="3.10" xmlns="http://www.portalfiscal.inf.br/nfe">', []).
        Replace('<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe" versao=''3.10''>', '<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe" versao="3.10">', [])
      ));
      AxmlNfe := AList.Text;
      AList.Clear;
      //ANFe.NotasFiscais.LoadFromFile(AFileName);
      if ANFe.NotasFiscais.Count = 0 then
        Exit('Erro|Não existem notas fiscais no arquivo XML informado: ' + AFileName);

      with ANFe.NotasFiscais.Items[0].NFe do
      begin
        {$REGION 'Pré validações'}
        tipoNF_P_V_O := 'P';
        if det.Items[0].Prod.veicProd.chassi <> '' then
        begin
          tipoNF_P_V_O := 'V';
          if not ASisVeic then
          begin
            tipoNF_P_V_O := 'O';
            if ShowConfirmacao('Usuário não pode importar Notas fiscais de veículos para entrada em estoque.' + sLineBreak +
                               'Você pode continuar com a entrada, o tipo da nota será "Outros" assim pode ser ' +
                               'usada para entrada no ativo imobilizado ou apenas para registrar nos arquivos fiscais' + sLineBreak + sLineBreak +
                               'Prosseguir?') <> IDYES then
              Exit('ERRO|Usuário não pode importar Notas fiscais de veículos para entrada no estoque. ' + #13 +
                'Favor configurar a senha do mesmo');
          end;
        end
        else if not ASisAuto then
          Exit('ERRO|Usuário não pode importar Notas fiscais de Produtos. ' + #13 +
              'Favor configurar a senha do mesmo');

        var cnpjEntradaPermitido := True;
        var cnpjCadProdPermitido := True;

        if (not Dest.CNPJCPF.Trim.IsEmpty) and
          (Emit.CNPJCPF.Trim <> ACNPJ.Trim) then
          if (Dest.CNPJCPF.Trim <> ACNPJ.Trim) then
          begin
            {
            Exit('ERRO|CNPJ do Destinatario difere do CNPJ da Empresa' + #13 +
              'CNPJ Destinatario: ' + Dest.CNPJCPF.Trim + #13 +
              'CNPJ Empresa: ' + ACNPJ);
            }
            cnpjEntradaPermitido := (cnpjsNF.IndexOf(Dest.CNPJCPF) >= 0) or (cnpjsNF.IndexOf(Emit.CNPJCPF) >= 0);
            cnpjCadProdPermitido := (cnpjsCadProd.IndexOf(Dest.CNPJCPF) >= 0) or (cnpjsCadProd.IndexOf(Emit.CNPJCPF) >= 0);
            if (not cnpjEntradaPermitido) and (not cnpjCadProdPermitido) then
              Exit('ERRO|CNPJ do Destinatario difere do CNPJ da Empresa ou dos configurados' + #13 +
                'CNPJ Destinatario: ' + Dest.CNPJCPF.Trim + #13 +
                'CNPJ Empresa: ' + ACNPJ);
          end;
        {$ENDREGION}

        {$REGION 'Cadastro de bairros'}
        buscas.Close;
        buscas.SQL.Text := 'select cod_bairro from bairros where NOME_BAIRRO like ' + QuotedStr('%' +
          Emit.EnderEmit.xBairro.Trim.ToUpper.Substring( 0, 30) + '%');
        buscas.Open;
        if not buscas.IsEmpty then
          ACodBairro := buscas.FieldByName('cod_bairro').AsInteger
        else
        begin
          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into bairros (nome_bairro, cod_usuario, cod_usuario_alt) values ' +
            '(:nome_bairro, :cod_usuario, :cod_usuario_alt)';
          AExecSql.ParamByName('nome_bairro').AsString := Emit.EnderEmit.xBairro.ToUpper.Substring( 0, 30);
          AExecSql.ParamByName('cod_usuario').AsInteger := ACodUsuario;
          AExecSql.ParamByName('cod_usuario_alt').AsInteger := ACodUsuario;
          AExecSql.ExecSQL;

          buscas.Close;
          buscas.Open;
          if not buscas.IsEmpty then
            ACodBairro := buscas.FieldByName('cod_bairro').AsInteger
          else
            Exit('ERRO|Bairro do emitente não pode ser cadastrado');
        end;

        {$ENDREGION}

        {$REGION 'Cadastro de cidades'}
        buscas.Close;
        buscas.SQL.Text := 'select cod_cidade from cidades where ibge_cod_cidade = ' +
          Emit.EnderEmit.cMun.ToString;
        buscas.Open;
        if not buscas.IsEmpty then
          ACodCidade := buscas.FieldByName('cod_cidade').AsInteger
        else
        begin
          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into cidades(nome_cidade, cod_usuario,cod_usuario_alt,ibge_cod_cidade) values ' +
            '(:nome_cidade, :cod_usuario, :cod_usuario_alt,:ibge_cod_cidade)';
          AExecSql.ParamByName('nome_cidade').AsString := Emit.EnderEmit.xMun.ToUpper.Substring( 0, 30);
          AExecSql.ParamByName('cod_usuario').AsInteger := ACodUsuario;
          AExecSql.ParamByName('cod_usuario_alt').AsInteger := ACodUsuario;
          AExecSql.ParamByName('ibge_cod_cidade').AsInteger := Emit.EnderEmit.cMun;
          AExecSql.ExecSQL;

          buscas.Close;
          buscas.Open;
          if not buscas.IsEmpty then
            ACodCidade := buscas.FieldByName('cod_cidade').AsInteger
          else
            Exit('ERRO|Cidade não pode ser cadastrada');
        end;
        {$ENDREGION}

        {$REGION 'Obtendo estado'}
        buscas.Close;
        buscas.SQL.Text := 'select codigo_uf from estados where IBGE_CODIGO_UF = ' +
          Emit.EnderEmit.cMun.ToString.Substring( 0, 2);
        buscas.Open;
        if not buscas.IsEmpty then
          ACodUF := buscas.FieldByName('codigo_uf').AsInteger
        else
          Exit('ERRO|Estado não encontrado. UF IBGE: ' + Emit.EnderEmit.cMun.ToString.Substring( 0, 2));
        {$ENDREGION}

        {$REGION 'Cadastro de clientes'}
        buscas.Close;
        buscas.SQL.Text := 'select cod_cliente, tipo from clientes where CPFCGC = ' + QuotedStr(trim(Emit.CNPJCPF)) +
          ' and cod_empresa = ' + ACodEmpresa.ToString;
        buscas.Open;
        if not buscas.IsEmpty then
        begin
          ACodCliente := buscas.FieldByName('cod_cliente').AsInteger;

          if (buscas.FieldByName('tipo').AsString <> 'F') and
            (buscas.FieldByName('tipo').AsString <> 'A') then
          begin
            AExecSql.Close;
            AExecSql.SQL.Text := 'update clientes set tipo = ''A''' +
              ' where cod_cliente = ' + ACodCliente.ToString +
              ' and cod_empresa = ' + ACodEmpresa.ToString;
            AExecSql.Prepare;
            AExecSql.ExecSQL;
          end;
        end
        else if Application.MessageBox('O forncedor/emitente não cadastrado.' + #13 +
                                       'Deseja cadastrar?',
                                       'Cadastrar Fornecedor/Emitente.', MB_YESNO + MB_ICONQUESTION) = idYes then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select cod, (select current_ts from sp_current_ts(' + ACodEmpresa.ToString + ')) as dh_db' +
                             ' from incrementa_codigo( ' + ACodEmpresa.ToString + ', ''CLIENTES'')';
          buscas.Open;
          ACodCliente := buscas.FieldByName('cod').AsInteger;
          ADataHoraDB := buscas.FieldByName('dh_db').AsDateTime;

          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into clientes (COD_CLIENTE, COD_EMPRESA, CODIGO_TIPO, EST_CODIGO_UF, CODIGO_UF, CPFCGC, NOME_CLIENTE, RAZAO, INSC_EST, ENDERECO, END_COBRANCA,' +
            ' NUM_END_CLIENTE, COD_BAIRRO, COD_BAIRRO_COBRANCA, BAIRRO, BAIRRO_COBRANCA, CEP, CEP_COBRANCA, COD_CIDADE, COD_CIDADE_COBRANCA, CIDADE, CIDA_COBRANCA, FONE_CLIENTE, TIPO,' +
            ' INSC_SUB_F,TIPVCLIENTE,DATA_CADASTRO, COD_PAIS, REP_INT_ACTIVE)' +
            ' VALUES (:COD_CLIENTE, :COD_EMPRESA, :CODIGO_TIPO, :EST_CODIGO_UF, :CODIGO_UF, :CPFCGC, :NOME_CLIENTE, :RAZAO, :INSC_EST, :ENDERECO, :END_COBRANCA,' +
            ' :NUM_END_CLIENTE, :COD_BAIRRO, :COD_BAIRRO_COBRANCA, :BAIRRO, :BAIRRO_COBRANCA, :CEP, :CEP_COBRANCA, :COD_CIDADE, :COD_CIDADE_COBRANCA, :CIDADE, :CIDA_COBRANCA, :FONE_CLIENTE, :TIPO,' +
            ' :INSC_SUB_F,:TIPVCLIENTE,:DATA_CADASTRO, :COD_PAIS, :REP_INT_ACTIVE)';

          AExecSql.ParamByName('COD_CLIENTE').AsInteger := ACodCliente;
          AExecSql.ParamByName('COD_EMPRESA').AsInteger := ACodEmpresa;
          AExecSql.ParamByName('CODIGO_TIPO').AsInteger := 2;
          AExecSql.ParamByName('EST_CODIGO_UF').AsInteger := ACodUF;
          AExecSql.ParamByName('CODIGO_UF').AsInteger := ACodUF;
          AExecSql.ParamByName('CPFCGC').AsString := Emit.CNPJCPF;
          AExecSql.ParamByName('NOME_CLIENTE').AsString := Emit.xNome.ToUpper.Substring( 0, 35);
          AExecSql.ParamByName('RAZAO').AsString := Emit.xNome.ToUpper.Substring( 0, 60);
          AExecSql.ParamByName('INSC_EST').AsString := Emit.IE;
          AExecSql.ParamByName('ENDERECO').AsString := Emit.EnderEmit.xLgr.ToUpper.Substring( 0, 50);
          AExecSql.ParamByName('END_COBRANCA').AsString := string(Emit.EnderEmit.xLgr.ToUpper + ', ' + Emit.EnderEmit.nro).Substring( 0, 50);
          AExecSql.ParamByName('NUM_END_CLIENTE').AsString := Emit.EnderEmit.nro;
          AExecSql.ParamByName('Cod_BAIRRO').AsInteger := ACodBairro;
          AExecSql.ParamByName('COD_BAIRRO_COBRANCA').AsInteger := ACodBairro;
          AExecSql.ParamByName('BAIRRO').AsString := Emit.EnderEmit.xBairro.ToUpper.Substring( 0, 35);
          AExecSql.ParamByName('BAIRRO_COBRANCA').AsString := Emit.EnderEmit.xBairro.ToUpper.Substring( 0, 35);
          AExecSql.ParamByName('CEP').AsString := Emit.EnderEmit.Cep.ToString.PadLeft(8, '0');
          AExecSql.ParamByName('CEP_COBRANCA').AsInteger := Emit.EnderEmit.Cep;
          AExecSql.ParamByName('COD_CIDADE').AsInteger := ACodCidade;
          AExecSql.ParamByName('COD_CIDADE_COBRANCA').AsInteger := ACodCidade;
          AExecSql.ParamByName('CIDADE').AsString := Emit.EnderEmit.xMun.ToUpper.Substring( 0, 30);
          AExecSql.ParamByName('CIDA_COBRANCA').AsString := Emit.EnderEmit.xMun.ToUpper.Substring( 0, 30);
          AExecSql.ParamByName('COD_PAIS').AsInteger := Emit.EnderEmit.cPais;
          AExecSql.ParamByName('FONE_CLIENTE').AsString := Emit.EnderEmit.fone.Replace('(', '',[rfReplaceAll]).
                                                                             Replace(')', '',[rfReplaceAll]).
                                                                             Replace('-', '',[rfReplaceAll]).
                                                                             Replace(' ', '',[rfReplaceAll]).
                                                                             Substring( 0, 13).Trim;
          AExecSql.ParamByName('TIPO').AsString := 'A';
          AExecSql.ParamByName('INSC_SUB_F').AsString := Emit.IEST;
          AExecSql.ParamByName('TIPVCLIENTE').AsString := 'V';
          AExecSql.ParamByName('DATA_CADASTRO').AsDate := DateOf(ADataHoraDB);
          AExecSql.ParamByName('REP_INT_ACTIVE').AsInteger := 1;
          AExecSql.ExecSQL;
        end
        else
          Exit('ERRO|Operação cancelada pelo usuário');
        {$ENDREGION}

        {$REGION 'Validando existencia da nota fiscal'}
        buscas.Close;
        buscas.SQL.Text := 'select cod_nf, status, ativo, cod_nf from notafiscal' +
          ' where cod_empresa = ' + ACodEmpresa.ToString +
          ' and natureza_nf = ''E''' +
          ' and num_nf = ' + Ide.nNF.ToString +
          ' and serie = ' + Ide.serie.ToString.QuotedString +
          ' and cod_cliente = ' + ACodCliente.ToString +
          ' and modelo_nf = ''55''' +
          ' and cod_nf <> ' + ACodNF.ToString;
        buscas.Open;
        // ImportaXML = Somente o cabeçalho, então OK, pode continuar
        // PreNotaXML = Já importou, aqui vou excluir e importar novamente
        buscas.First;
        while not buscas.Eof do
        begin
          if buscas.FieldByName('status').AsString.Equals('ImportaXML') or
             buscas.FieldByName('status').AsString.Equals('PreNotaXML') then
          begin
            AExecSql.Close;
            AExecSql.SQL.Text := 'delete from notafiscal' +
              ' where cod_nf = ' + ACodNF.ToString +
              ' and cod_empresa = ' + ACodEmpresa.ToString +
              ' and status = ' + buscas.FieldByName('status').AsString.QuotedString;
            AExecSql.ExecSQL;
          end
          else if not buscas.FieldByName('status').AsString.Trim.IsEmpty then
            Exit('ERRO|Já existe uma nota fiscal no banco de dados com estes dados' + #13 +
                 'Número: ' +Ide.nNF.ToString + #13 +
                 'Série: ' +Ide.serie.ToString + #13 +
                 'Modelo: 55' + #13 + #13 +
                 'Código: ' + buscas.FieldByName('cod_nf').AsInteger.ToString + #13 +
                 'Ativo: ' + buscas.FieldByName('ativo').AsInteger.ToString + #13 +
                 'Status: ' + buscas.FieldByName('status').AsString);
          buscas.Next;
        end;
        {$ENDREGION}

        {$REGION 'Cadastro de transportador'}
        if Transp.Transporta.CNPJCPF.Trim.IsEmpty then
          ACodTransporta := 0
        else
        begin
          buscas.Close;
          buscas.SQL.Text := 'select CODIGO_TR from transportador' +
            ' where CNPJ_TR = ' + Transp.Transporta.CNPJCPF.QuotedString +
            ' and cod_empresa = ' + ACodEmpresa.ToString;
          buscas.Open;

          if not buscas.IsEmpty then
            ACodTransporta := buscas.FieldByName('CODIGO_TR').AsInteger
          else if Application.MessageBox('O transportador não esta cadastrado.' + #13 +
                                         'Deseja cadastrar?',
                                         'Cadastrar Transportador', MB_YESNO + MB_ICONQUESTION) = idYes then
          begin
            AExecSql.Close;
            AExecSql.SQL.Text := 'select CODIGO_UF from estados' +
              ' where SIGLA_UF = ' + Transp.Transporta.UF.QuotedString;
            AExecSql.Open;
            ACodUF := AExecSql.FieldByName('CODIGO_UF').AsInteger;

            AExecSql.Close;
            AExecSql.SQL.Text := 'select cod from incrementa_codigo( ' + ACodEmpresa.ToString + ', ''TRANSPORTADOR'')';
            AExecSql.Open;
            ACodTransporta := AExecSql.FieldByName('cod').AsInteger;

            AExecSql.Close;
            AExecSql.SQL.Text := 'insert into transportador(CODIGO_TR, COD_EMPRESA, NOME_TR, CNPJ_TR, END_TR, MUNICIPIO_TR, UF_TR, IE_TR) values ' +
              '(:CODIGO_TR,:COD_EMPRESA,:NOME_TR,:CNPJ_TR, :END_TR, :MUNICIPIO_TR, :UF_TR, :IE_TR)';
            AExecSql.ParamByName('CODIGO_TR').AsInteger := ACodTransporta;
            AExecSql.ParamByName('COD_EMPRESA').AsInteger := ACodEmpresa;
            AExecSql.ParamByName('NOME_TR').AsString := Transp.Transporta.xNome.ToUpper.Substring( 0, 60);
            AExecSql.ParamByName('CNPJ_TR').AsString := Transp.Transporta.CNPJCPF;
            AExecSql.ParamByName('END_TR').AsString := Transp.Transporta.xEnder.ToUpper.Substring( 0, 40);
            AExecSql.ParamByName('MUNICIPIO_TR').AsString := Transp.Transporta.xMun.ToUpper.Substring( 0, 25);
            AExecSql.ParamByName('UF_TR').AsInteger := ACodUF;
            AExecSql.ParamByName('IE_TR').AsString := Transp.Transporta.IE;
            AExecSql.ExecSQL;
          end
          else
            Exit('ERRO|Operação cancelada pelo usuário');
        end;
        {$ENDREGION}

        {$REGION 'Importando cabeçalho'}
        AExecSql.Close;
        AExecSql.SQL.Text := 'update notafiscal set ' +
          ' path_xml_import = :path_xml_import, tipo_nf = :tipo_nf, num_nf = :num_nf, serie = :serie,' +
          ' desc_natop = :desc_natop, cod_cliente = :cod_cliente,' +
          ' cod_cond_pag = :cod_cond_pag, cod_vendedor = :cod_vendedor, data_contabil = :data_contabil,' +
          ' hora_emissao = :hora_emissao, valor_total = :valor_total, valor_prod= :valor_prod,' +
          ' valor_serv = :valor_serv, valor_desc = :valor_desc, base_icmsub = :base_icmsub,' +
          ' valor_icmsub = :valor_icmsub, valor_ipi = :valor_ipi, valor_frete = :valor_frete,' +
          ' valor_seguro = :valor_seguro, valor_out_desp = :valor_out_desp, obs = :obs,' +
          ' placa_tr = :placa_tr, uf_placa_tr = :uf_placa_tr, chave_nfe = :chave_nfe, modelo_nf = :modelo_nf,' +
          ' cod_usuario = :cod_usuario, inscricao_substituto = :inscricao_substituto,' +
          ' dup_xml_entrada = :dup_xml_entrada, tipo_desconto = :tipo_desconto,' +
          ' aliq_icm = :aliq_icm, base_icm = :base_icm, valor_icm = :valor_icm, status = :status, xml_nfe = :xml_nfe,' +
          ' fcp_vfcp = :fcp_vfcp, fcp_vfcpst = :fcp_vfcpst, fcp_vfcpstret = :fcp_vfcpstret,' +
          ' ipi_vipidevol = :ipi_vipidevol, pag_vtroco = :pag_vtroco, fat_nfat = :fat_nfat,' +
          ' fat_vorig = :fat_vorig, fat_vdesc = :fat_vdesc, fat_vliq = :fat_vliq, vicmdeson = :vicmdeson ' +
          StrUtils.IfThen(Transp.modFrete in [mfContaEmitente, mfContaDestinatario, mfContaTerceiros, mfSemFrete],
            ', freteconta_tr = :freteconta_tr') +
          StrUtils.IfThen(ACodTransporta > 0, ', codigo_tr = :codigo_tr') +
          StrUtils.IfThen(Transp.Vol.Count > 0,
            ', qtde_volumes_tr = :qtde_volumes_tr, especie_tr = :especie_tr, marca_tr = :marca_tr,' +
            ' numero_tr = :numero_tr, peso_b = :peso_b, peso_l = :peso_l') +
          ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa';

        AExecSql.ParamByName('status').AsString               := 'PreNotaXML';
        AExecSql.ParamByName('cod_nf').AsInteger              := ACodNF;
        AExecSql.ParamByName('cod_empresa').AsInteger         := ACodEmpresa;
        AExecSql.ParamByName('path_xml_import').AsString      := AFileName.Substring( 0, 256);
        AExecSql.ParamByName('tipo_nf').AsString              := tipoNF_P_V_O;
        AExecSql.ParamByName('num_nf').AsInteger              := Ide.nNF;
        AExecSql.ParamByName('serie').AsString                := Ide.serie.ToString;
        AExecSql.ParamByName('desc_natop').AsString           := Ide.natOp.Substring( 0, 128);
        AExecSql.ParamByName('cod_cliente').AsInteger         := ACodCliente;
        AExecSql.ParamByName('cod_vendedor').AsInteger        := ACodUsuario;
        AExecSql.ParamByName('data_contabil').AsDateTime      := DateOf(Ide.dEmi);
        AExecSql.ParamByName('hora_emissao').AsString         := FormatDateTime('HH:MM:SS', TimeOf(Ide.dEmi));
        AExecSql.ParamByName('valor_total').AsFloat           := Total.ICMSTot.vNF;
        AExecSql.ParamByName('valor_prod').AsFloat            := Total.ICMSTot.vProd;
        AExecSql.ParamByName('valor_serv').AsFloat            := Total.ISSQNtot.vServ;
        AExecSql.ParamByName('valor_desc').AsFloat            := Total.ICMSTot.vDesc;
        AExecSql.ParamByName('base_icmsub').AsFloat           := Total.ICMSTot.vBCST;
        AExecSql.ParamByName('valor_icmsub').AsFloat          := Total.ICMSTot.vST;
        AExecSql.ParamByName('valor_ipi').Asfloat             := Total.ICMSTot.vIPI;
        AExecSql.ParamByName('valor_frete').Asfloat           := Total.ICMSTot.vFrete;
        AExecSql.ParamByName('valor_seguro').AsFloat          := Total.ICMSTot.vSeg;
        AExecSql.ParamByName('valor_out_desp').AsFloat        := Total.ICMSTot.vOutro;
        AExecSql.ParamByName('vicmdeson').AsFloat             := Total.ICMSTot.vICMSDeson;
        AExecSql.ParamByName('obs').AsString                  := InfAdic.infCpl + #13 + InfAdic.infAdFisco;
        AExecSql.ParamByName('chave_nfe').AsString            := infNFe.ID.Replace('NFE', '', [rfReplaceAll, rfIgnoreCase]).Substring( 0, 44);
        AExecSql.ParamByName('modelo_nf').AsString            := '55';
        AExecSql.ParamByName('cod_usuario').AsInteger         := ACodUsuario;
        AExecSql.ParamByName('inscricao_substituto').AsString := Emit.IEST.Substring( 0, 18);
        AExecSql.ParamByName('placa_tr').AsString             := Transp.veicTransp.placa.ToUpper.Substring( 0, 7);
        AExecSql.ParamByName('uf_placa_tr').AsString          := Transp.veicTransp.UF.ToUpper.Substring( 0, 2);
        AExecSql.ParamByName('base_icm').AsFloat              := Total.ICMSTot.vBC;
        AExecSql.ParamByName('valor_icm').AsFloat             := Total.ICMSTot.vICMS;
        if Total.ICMSTot.vBC > 0 then
          AExecSql.ParamByName('aliq_icm').Asfloat            := RoundTo((Total.ICMSTot.vICMS / Total.ICMSTot.vBC) * 100, -2);

        if ACodTransporta > 0 then
          AExecSql.ParamByName('codigo_tr').AsInteger           := ACodTransporta;
        if Transp.Vol.Count > 0 then
        begin
          AExecSql.ParamByName('qtde_volumes_tr').AsInteger   := Transp.Vol.Items[0].qVol;
          AExecSql.ParamByName('especie_tr').AsString         := Transp.Vol.Items[0].esp.ToUpper.Substring( 0, 15);
          AExecSql.ParamByName('marca_tr').AsString           := Transp.Vol.Items[0].marca.ToUpper.Substring( 0, 15);
          AExecSql.ParamByName('numero_tr').AsString          := Transp.Vol.Items[0].nVol.ToUpper.Substring( 0, 15);
          AExecSql.ParamByName('peso_b').Asfloat              := Transp.Vol.Items[0].pesoB;
          AExecSql.ParamByName('peso_l').Asfloat              := Transp.Vol.Items[0].pesoL;
        end;
        case Transp.modFrete of
          mfContaEmitente    : AExecSql.ParamByName('freteconta_tr').AsString := '1';
          mfContaDestinatario: AExecSql.ParamByName('freteconta_tr').AsString := '2';
          mfContaTerceiros   : AExecSql.ParamByName('freteconta_tr').AsString := '0';
          mfSemFrete         : AExecSql.ParamByName('freteconta_tr').AsString := '9';
        end;
        AExecSql.ParamByName('xml_nfe').AsString      := AxmlNfe;
        AExecSql.ParamByName('fcp_vfcp').AsFloat      := Total.ICMSTot.vFCP;
        AExecSql.ParamByName('fcp_vfcpst').AsFloat    := Total.ICMSTot.vFCPST;
        AExecSql.ParamByName('fcp_vfcpstret').AsFloat := Total.ICMSTot.vFCPSTRet;
        AExecSql.ParamByName('ipi_vipidevol').AsFloat := Total.ICMSTot.vIPIDevol;
        AExecSql.ParamByName('pag_vtroco').AsFloat    := pag.vTroco;
        AExecSql.ParamByName('fat_nfat').AsString     := Cobr.Fat.nFat;
        AExecSql.ParamByName('fat_vorig').AsFloat     := Cobr.Fat.vOrig;
        AExecSql.ParamByName('fat_vdesc').AsFloat     := Cobr.Fat.vDesc;
        AExecSql.ParamByName('fat_vliq').AsFloat      := Cobr.Fat.vLiq;

        AList.Clear;
        AStrCondicao := '';
        for I := 0 to Cobr.Dup.Count - 1 do
          if (Cobr.Dup.Items[I].dVenc > 0) and (Cobr.Dup.Items[I].vDup > 0) then
          begin
            AList.Add(
              Cobr.Dup.Items[I].nDup + '|' +
              DateToStr(Cobr.Dup.Items[I].dVenc) + '|' +
              FloatToStr(Cobr.Dup.Items[I].vDup) + '|'
              );
            AStrCondicao := AStrCondicao + IntToStr(Trunc(Cobr.Dup.Items[I].dVenc - Ide.dEmi)) + '/';
          end;
        if AList.Count > 0 then
        begin
          AExecSql.ParamByName('DUP_XML_ENTRADA').AsString := AList.Text;
          if Length(AStrCondicao) > 0 then
            AStrCondicao := Copy(AStrCondicao, 1, Length(AStrCondicao) - 1);
          buscas.Close;
          buscas.SQL.Text := 'select COD_COND_PAG from COND_PAG' +
            ' where coalesce(NATUREZA_CP,'''') <> ''V''' +
            ' and DESC_COND_PAG like ' + QuotedStr(AStrCondicao + '%') ;
          buscas.Open;
          if buscas.FieldByName('cod_cond_pag').AsInteger > 0 then
            AExecSql.ParamByName('cod_cond_pag').AsInteger := buscas.FieldByName('cod_cond_pag').AsInteger
          else
          begin
            buscas.Close;
            buscas.SQL.Text := 'select COD_COND_PAG from COND_PAG' +
              ' where coalesce(NATUREZA_CP,'''') <> ''V''' +
              ' and RTRIM(UPPER(DESC_COND_PAG)) = ' + QuotedStr(IntToStr(AList.Count) + 'X') ;
            buscas.Open;
            if buscas.FieldByName('cod_cond_pag').AsInteger > 0 then
              AExecSql.ParamByName('cod_cond_pag').AsInteger := buscas.FieldByName('cod_cond_pag').AsInteger;
          end;
        end;

        for I := 0 to Det.Count - 1 do
          with Det.Items[I] do
            if Prod.vDesc > 0 then
            begin
              AExecSql.ParamByName('TIPO_DESCONTO').AsString := 'I';
              Break;
            end;

        AExecSql.ExecSQL;
        {$ENDREGION}

        {$REGION 'Importando itens'}
        if Det.Items[0].Prod.veicProd.chassi.IsEmpty then
        begin
          AvincProd := TVinculoProdutos.Create(Self);
          AvincProd.cod_empresa := ACodEmpresa;
          AvincProd.cod_cliente := ACodCliente;
          AvincProd.cpfcgc      := Emit.CNPJCPF;
          AvincProd.buscaNoProd := ABuscaCodNoProduto;
          for I := 0 to Det.Count - 1 do with Det.Items[I] do
            if Det.Items[I].Prod.veicProd.chassi.Trim.IsEmpty then
              with AvincProd.NewDetItem(Det.Items[I].Prod.cProd, Det.Items[I].Prod.cEAN) do
              begin
                item.nitem              := Det.Items[I].Prod.nItem;
                item.codigo_nop         := StrToFloatDef(Det.Items[I].Prod.CFOP, 0);
                item.referencia         := Det.Items[I].Prod.uCom.ToUpper();
                item.ucom               := Det.Items[I].Prod.uCoM.ToUpper();
                item.unidade_nf         := Det.Items[I].Prod.uCom.ToUpper();
                item.num_fab_fornecedor := Det.Items[I].Prod.cProd;
                item.descricao_item     := Det.Items[I].Prod.xProd;
                item.ncm                := Det.Items[I].Prod.NCM;
                if Emit.CRT = crtSimplesNacional then
                begin
                  item.cst              := CSOSNIcmsToStr(Det.Items[I].Imposto.ICMS.CSOSN);
                  item.csosn            := CSOSNIcmsToStr(Det.Items[I].Imposto.ICMS.CSOSN);
                end
                else
                  item.cst              := OrigToStr(Det.Items[I].Imposto.ICMS.orig) + CSTICMSToStr(Det.Items[I].Imposto.ICMS.CST);
                item.quantidade         := Det.Items[I].Prod.qCom;
                item.valor_unitario     := Det.Items[I].Prod.vUnCom;
                item.valor_total        := Det.Items[I].Prod.vProd;
                item.cest               := Det.Items[I].Prod.CEST;
                item.prec_cus_cnt       := ((Det.Items[I].Prod.vProd + Det.Items[I].Prod.vFrete
                  + Det.Items[I].Prod.vSeg + Det.Items[I].Prod.vOutro
                  + Det.Items[I].Imposto.IPI.vIPI + Det.Items[I].Imposto.ICMS.vICMSST
                  + Det.Items[I].vIPIDevol + Det.Items[I].Imposto.II.vII
                  - Det.Items[I].Prod.vDesc - Det.Items[I].Imposto.ICMS.vICMSDeson) / Det.Items[I].Prod.qCom);
                item.cean               := Det.Items[I].Prod.cEAN;
                cprod                   := Det.Items[I].Prod.cProd;
                chave_nfe               := apenasNumeros(infNFe.ID);
                icms_orig               := OrigToStr(Det.Items[I].Imposto.ICMS.orig);
              end;

          vValidarVinculos := AvincProd.ValidarVinculos(Self, ADigitosProd, AUsarCodigoSequencialProduto, ACadProdAberto,
            AUsuario, ANivel, ACodCliente, ACNPJ, AUFDest, Emit.CRT = crtSimplesNacional, apenasNumeros(infNFe.ID));
          if vValidarVinculos = 'CADASTRARPROD' then
            exit('CADASTRARPROD|' + apenasNumeros(infNFe.ID))
          else if vValidarVinculos = 'REMOVERVINCPROD' then
            exit('REMOVERVINCPROD|')
          else if vValidarVinculos <> 'OK' then
            if Application.MessageBox('Vinculo dos itens da nota fiscal não concluídos. Continuar',
                                      'Confirmação',
                                       MB_ICONQUESTION + MB_YESNO) <> IDYES then
              Exit('ERRO|Vinculo dos itens da nota fiscal não concluídos. Abortado pelo usuário');
        end;

        for I := 0 to Det.Count - 1 do with Det.Items[I] do
        begin
          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into notafiscal_item (' +
            ' cod_nf, cod_empresa, nitem, descricao_item, import_xml, tipo_item, num_fab_prod, cst, perc_red_prod,' +
            ' modbc, base_icm, aliq_icm, valor_icm, aliq_icm_xml, valor_icm_xml, modbcst, mva, perc_red_prod_sub,' +
            ' base_icmsub, aliq_icmsub, valor_icmsub, ncm, cest, codigo_nop, altera_estoque_cfop, altera_custo_cfop,' +
            ' tipv_veiculo, valor_total, unidade_nf, qtdembrec, ean13, referencia, quantidade, valor_unitario,' +
            ' qtdemb, vlrembnf, rateio_desconto, perc_desconto, valor_icm_stdes, camp_entest, indtot,' +
            ' base_ipi, aliq_ipi, valor_ipi, aliq_pis_st, base_pis_st, valor_pis_st, aliq_cofins_st, base_cofins_st,' +
            ' valor_cofins_st, nfci, num_fab_fornecedor, fcp_pfcp, fcp_vfcp, fcp_vbcfcp, fcp_vbcfcpst, fcp_pfcpst,' +
            ' fcp_vfcpst, fcp_pst, fcp_vbcfcpstret, fcp_pfcpstret, fcp_vfcpstret, nfe_indescala, vicmdeson,' +
            ' nfe_cnpjfab, nfe_cbenef, ipi_cnpjprod, ipi_cselo, ipi_qselo, cean, predbcefet, vbcefet, picmsefet,' +
            ' vicmsefet, icm_orig, icm_cst, icm_csosn, icm_pred, icm_vbc, icm_picm, icm_vicm, icm_vbcfcp, icm_pfcp, ' +
            ' icm_vfcp, icm_modbcst, icm_pmvast, icm_predbcst, icm_vbcst, icm_picmst, icm_vicmst, icm_vbcfcpst,' +
            ' icm_pfcpst, icm_vfcpst, icm_vicmdeson, icm_vbcstret, icm_pst, icm_vicmssubstituto, icm_vicmsstret,' +
            ' icm_vbcfcpstret, icm_pfcpstret, icm_vfcpstret, rateio_seguro, rateio_outdesp, rateio_frete,' +
            ' ucom, qcom, vuncom, valor_pis, valor_cofins, icm_pdif, icm_vicmsdif, nitem_xml, cbarra, ' +
            ' indsomapisst, indsomacofinsst, qbcmono, adremicms, vicmsmono, qbcmonoreten, adremicmsreten,' +
            ' vicmsmonoreten, qbcmonoret, adremicmsret, vicmsmonoret, icm_qbcmono, icm_adremicms, icm_vicmsmono,' +
            ' icm_qbcmonoreten, icm_adremicmsreten, icm_vicmsmonoreten, icm_qbcmonoret, icm_adremicmsret,' +
            ' icm_vicmsmonoret, xped_compra, nitemped_compra, dfe_trib_id, dfe_trib_id_xml ' +
            //' icm_pfcpdif, icm_vfcpdif, icm_vicmsop_dif, icm_vfcpefet_dif,' +
            StrUtils.IfThen(tipoNF_P_V_O.Equals('P'),// Prod.veicProd.chassi.Trim.IsEmpty,
              ', cod_prod, grupo_prod, consumo, ecf, cod_grade',
              StrUtils.IfThen(tipoNF_P_V_O.Equals('V'),', chassi')
              ) +
            StrUtils.IfThen(Imposto.ICMS.CSOSN <> csosnVazio, ', csosn') +
            ') values (' +
            ' :cod_nf, :cod_empresa, :nitem, :descricao_item, :import_xml, :tipo_item, :num_fab_prod, :cst,' +
            ' :perc_red_prod, :modbc, :base_icm, :aliq_icm, :valor_icm, :aliq_icm_xml, :valor_icm_xml, :modbcst, :mva,' +
            ' :perc_red_prod_sub, :base_icmsub, :aliq_icmsub, :valor_icmsub, :ncm, :cest, :codigo_nop,' +
            ' :altera_estoque_cfop, :altera_custo_cfop, :tipv_veiculo, :valor_total, :unidade_nf, :qtdembrec, :ean13,' +
            ' :referencia, :quantidade, :valor_unitario, :qtdemb, :vlrembnf, :rateio_desconto,' +
            ' :perc_desconto, :valor_icm_stdes, :camp_entest, :indtot, :base_ipi, :aliq_ipi, :valor_ipi, :aliq_pis_st,' +
            ' :base_pis_st, :valor_pis_st, :aliq_cofins_st, :base_cofins_st, :valor_cofins_st,' +
            ' :nfci, :num_fab_fornecedor, :fcp_pfcp, :fcp_vfcp, :fcp_vbcfcp, :fcp_vbcfcpst, :fcp_pfcpst, :fcp_vfcpst,' +
            ' :fcp_pst, :fcp_vbcfcpstret, :fcp_pfcpstret, :fcp_vfcpstret, :nfe_indescala, :icm_vicmdeson,' +
            ' :nfe_cnpjfab, :nfe_cbenef, :ipi_cnpjprod, :ipi_cselo, :ipi_qselo, :cean, :predbcefet, :vbcefet, :picmsefet,' +
            ' :vicmsefet, :icm_orig, :icm_cst, :icm_csosn, :icm_pred, :icm_vbc, :icm_picm, :icm_vicm, :icm_vbcfcp,' +
            ' :icm_pfcp, :icm_vfcp, :icm_modbcst, :icm_pmvast, :icm_predbcst, :icm_vbcst, :icm_picmst, :icm_vicmst,' +
            ' :icm_vbcfcpst, :icm_pfcpst, :icm_vfcpst, :icm_vicmdeson, :icm_vbcstret, :icm_pst, :icm_vicmssubstituto,' +
            ' :icm_vicmsstret, :icm_vbcfcpstret, :icm_pfcpstret, :icm_vfcpstret, :rateio_seguro, :rateio_outdesp, :rateio_frete,' +
            ' :ucom, :qcom, :vuncom, :valor_pis, :valor_cofins, :icm_pdif, :icm_vicmsdif, :nitem_xml, :cbarra, ' +
            ' :indsomapisst, :indsomacofinsst, :qbcmono, :adremicms, :vicmsmono, :qbcmonoreten, :adremicmsreten,' +
            ' :vicmsmonoreten, :qbcmonoret, :adremicmsret, :vicmsmonoret, :icm_qbcmono, :icm_adremicms, :icm_vicmsmono,' +
            ' :icm_qbcmonoreten, :icm_adremicmsreten, :icm_vicmsmonoreten, :icm_qbcmonoret, :icm_adremicmsret,' +
            ' :icm_vicmsmonoret, :xped_compra, :nitemped_compra, :dfe_trib_id, :dfe_trib_id_xml ' +
            //' :icm_pfcpdif, :icm_vfcpdif, :icm_vicmsop_dif, :icm_vfcpefet_dif,' +
            StrUtils.IfThen(tipoNF_P_V_O.Equals('P'),// Prod.veicProd.chassi.Trim.IsEmpty,
              ', :cod_prod, :grupo_prod, :consumo, :ecf, :cod_grade',
              StrUtils.IfThen(tipoNF_P_V_O.Equals('V'), ', :chassi')
              ) +
            StrUtils.IfThen(Imposto.ICMS.CSOSN <> csosnVazio, ', :csosn') +
            ')';

          /// *****************************************************************************************************************
          ///
          ///  SEMPRE QUE ATUALIZAR AQUI ATUALIZAR TAMBEM O ARQUIVO hw.nfe.classes.dx > THwCentralNFe.nfe_atualizar_valores_xml
          ///
          /// *****************************************************************************************************************

          AExecSql.ParamByName('cod_nf').AsInteger            := ACodNF;
          AExecSql.ParamByName('cod_empresa').AsInteger       := ACodEmpresa;
          AExecSql.ParamByName('nitem').AsInteger             := Prod.nItem;
          AExecSql.ParamByName('descricao_item').AsString     := Prod.xProd.ToUpper.Substring( 0, 75);
          AExecSql.ParamByName('import_xml').AsString         := 'S';
          AExecSql.ParamByName('tipo_item').AsString          := StrUtils.IfThen((not Prod.veicProd.chassi.Trim.IsEmpty) and tipoNF_P_V_O.Equals('V'), 'V', tipoNF_P_V_O);
          AExecSql.ParamByName('num_fab_fornecedor').AsString := Prod.cProd.Substring(0 , 60);
          AExecSql.ParamByName('ncm').AsString                := Prod.NCM;
          AExecSql.ParamByName('cest').AsString               := IfThen((Imposto.ICMS.CST in [cst10, cst30, cst60, cst70, cst90]) or (Imposto.ICMS.CSOSN in [csosn201, csosn202, csosn203, csosn500, csosn900]), Prod.CEST);
          AExecSql.ParamByName('valor_total').Asfloat         := Prod.vProd;
          AExecSql.ParamByName('unidade_nf').AsString         := Prod.uCom.Substring(0, 6).ToUpper();
          AExecSql.ParamByName('qtdembrec').Asfloat           := Prod.qCom;
          AExecSql.ParamByName('ean13').AsString              := Prod.cEAN.Substring( 0, 13);
          AExecSql.ParamByName('num_fab_prod').AsString       := Prod.cEAN.Substring( 0, 14);
          AExecSql.ParamByName('referencia').AsString         := Prod.uCom.Substring(0, 6).ToUpper();
          AExecSql.ParamByName('quantidade').AsFloat          := Prod.qCom;
          AExecSql.ParamByName('valor_unitario').AsFloat      := Prod.vUnCom;
          AExecSql.ParamByName('qtdemb').AsFloat              := 0;
          AExecSql.ParamByName('vlrembnf').AsFloat            := Prod.vUnCom;
          AExecSql.ParamByName('rateio_desconto').Asfloat     := Prod.vDesc;
          if Prod.vProd > 0 then
            AExecSql.ParamByName('perc_desconto').AsFloat     := Math.IfThen(Prod.vDesc > 0, Prod.vDesc / (Prod.vProd / 100))
          else
            AExecSql.ParamByName('perc_desconto').AsFloat     := 0;
          AExecSql.ParamByName('valor_icm_stdes').Asfloat     := Imposto.ICMS.vICMSSTDest;
          AExecSql.ParamByName('camp_entest').AsString        := 'L';
          AExecSql.ParamByName('indtot').AsInteger            := StrToIntDef(indTotToStr(Prod.IndTot), 1);
          AExecSql.ParamByName('rateio_desconto').Asfloat     := Prod.vDesc;
          AExecSql.ParamByName('rateio_seguro').Asfloat       := Prod.vSeg;
          AExecSql.ParamByName('rateio_outdesp').Asfloat      := Prod.vOutro;
          AExecSql.ParamByName('rateio_frete').Asfloat        := Prod.vFrete;
          AExecSql.ParamByName('nfci').AsString               := Prod.nFCI.Trim.Substring( 0, 36);
          AExecSql.ParamByName('codigo_nop').AsFloat          := Prod.CFOP.ToInteger;
          AExecSql.ParamByName('nfe_indescala').AsString      := IndEscalaToStr(Prod.indEscala).Substring(0, 1);
          AExecSql.ParamByName('nfe_cnpjfab').AsString        := Prod.CNPJFab;
          AExecSql.ParamByName('nfe_cbenef').AsString         := Prod.cBenef.Substring(0, 10);
          AExecSql.ParamByName('cean').AsString               := Prod.cEAN.Substring(0, 14);
          AExecSql.ParamByName('xped_compra').AsString        := Prod.xPed.Substring(0, 15);
          AExecSql.ParamByName('nitemped_compra').AsInteger   := StrToIntDef(Prod.nItemPed, 0);

          if tipoNF_P_V_O.Equals('V') then //if not Prod.veicProd.chassi.Trim.IsEmpty then
            AExecSql.ParamByName('chassi').AsString := Prod.veicProd.chassi
          else if tipoNF_P_V_O.Equals('O') then
            AExecSql.ParamByName('num_fab_prod').AsString := Prod.veicProd.chassi;

//          buscas.Close;
//          buscas.SQL.Text := 'select n.cfop_conv, n2.alt_est, n2.calc_custo, n2.tipv_veiculo from nat_op n' +
//            ' left join nat_op n2 on n2.codigo_nop = n.cfop_conv ' +
//            ' where n.codigo_nop = :codigo_nop';
//          buscas.ParamByName('codigo_nop').AsFloat := Prod.CFOP.ToInteger;
//          buscas.Open;
//          AExecSql.ParamByName('codigo_nop').AsFloat := buscas.FieldByName('cfop_conv').AsFloat;
//          AExecSql.ParamByName('altera_estoque_cfop').AsString := buscas.FieldByName('alt_est').AsString;
//          AExecSql.ParamByName('altera_custo_cfop').AsString := buscas.FieldByName('calc_custo').AsString;
//          AExecSql.ParamByName('tipv_veiculo').AsString := buscas.FieldByName('tipv_veiculo').AsString;

          with Imposto.ICMS do
          begin
            if (CSOSN = csosnVazio) then//or ((CST <> cstICMSSN) and (CST <> cstVazio)) then
            begin
              AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + CSTICMSToStr(CST);
              //if CST in [cst00, cst10, cst20, cst70, cst90] then
              begin
                if CST in [cst20, cst70, cst90] then
                  AExecSql.ParamByName('perc_red_prod').Asfloat := pRedBC;
                AExecSql.ParamByName('modbc').AsString := modBCToStr(modBC);
                AExecSql.ParamByName('base_icm').AsFloat := vBC;
                AExecSql.ParamByName('aliq_icm').AsFloat := picms;
                AExecSql.ParamByName('valor_icm').AsFloat := vICMS;
                AExecSql.ParamByName('aliq_icm_xml').AsFloat := picms;
                AExecSql.ParamByName('valor_icm_xml').AsFloat := vICMS;
              end;
              //if CST in [cst10, cst30, cst70, cst90] then
              begin
                //AExecSql.ParamByName('modbcst').AsString := StrUtils.IfThen(pMVAST > 0, modBCSTToStr(modBCST), '0');
                AExecSql.ParamByName('modbcst').AsString := '0';
                AExecSql.ParamByName('mva').Asfloat := pMVAST;
                AExecSql.ParamByName('perc_red_prod_sub').Asfloat := pRedBCST;
                AExecSql.ParamByName('base_icmsub').AsFloat := vBCST;
                AExecSql.ParamByName('aliq_icmsub').Asfloat := pICMSST;
                AExecSql.ParamByName('valor_icmsub').Asfloat := vICMSST;
              end;
              AExecSql.ParamByName('qbcmono').Asfloat := qBCMono;
              AExecSql.ParamByName('adremicms').Asfloat := adRemICMS;
              AExecSql.ParamByName('vicmsmono').Asfloat := vICMSMono;
              AExecSql.ParamByName('qbcmonoreten').Asfloat := qBCMonoReten;
              AExecSql.ParamByName('adremicmsreten').Asfloat := adRemICMSReten;
              AExecSql.ParamByName('vicmsmonoreten').Asfloat := vICMSMonoReten;
              AExecSql.ParamByName('qbcmonoret').Asfloat := qBCMonoRet;
              AExecSql.ParamByName('adremicmsret').Asfloat := adRemICMSRet;
              AExecSql.ParamByName('vicmsmonoret').Asfloat := vICMSMonoRet;
            end
            else if CSOSN <> csosnVazio then
            begin
              AExecSql.ParamByName('csosn').AsString := CSOSNIcmsToStr(CSOSN);
              //if CSOSN in [csosn101, csosn201, csosn900] then
              begin
                AExecSql.ParamByName('aliq_icm').AsFloat := pCredSN;
                AExecSql.ParamByName('valor_icm').AsFloat := vCredICMSSN;
                if pCredSN > 0 then
                  AExecSql.ParamByName('base_icm').AsFloat := CalcularBCICMSSimplesNacional(Det.Items[I]) //(vCredICMSSN * 100) / pCredSN
                else
                  AExecSql.ParamByName('base_icm').AsFloat := 0;
              end;
              //if CSOSN in [csosn201, csosn202, csosn203, csosn900] then
              begin
                AExecSql.ParamByName('modbcst').AsString := '0';
                AExecSql.ParamByName('mva').Asfloat := pMVAST;
                AExecSql.ParamByName('perc_red_prod_sub').Asfloat := pRedBCST;
                AExecSql.ParamByName('base_icmsub').AsFloat := vBCST;
                AExecSql.ParamByName('aliq_icmsub').Asfloat := pICMSST;
                AExecSql.ParamByName('valor_icmsub').Asfloat := vICMSST;
              end;
              case CSOSN of
                csosn101, csosn102, csosn300: AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '00';
                csosn103                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '40';
                csosn201, csosn202          : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '10';
                csosn203                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '30';
                csosn400                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '41';
                csosn500                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '60';
                csosn900                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '90';
              end;
            end;
            AExecSql.ParamByName('fcp_pfcp').AsFloat        := pFCP;
            AExecSql.ParamByName('fcp_vfcp').AsFloat        := vFCP;
            AExecSql.ParamByName('fcp_vbcfcp').AsFloat      := vBCFCP;
            AExecSql.ParamByName('fcp_vbcfcpst').AsFloat    := vBCFCPST;
            AExecSql.ParamByName('fcp_pfcpst').AsFloat      := pFCPST;
            AExecSql.ParamByName('fcp_vfcpst').AsFloat      := vFCPST;
            AExecSql.ParamByName('fcp_pst').AsFloat         := pST;
            AExecSql.ParamByName('fcp_vbcfcpstret').AsFloat := vBCFCPSTRet;
            AExecSql.ParamByName('fcp_pfcpstret').AsFloat   := pFCPSTRet;
            AExecSql.ParamByName('fcp_vfcpstret').AsFloat   := vFCPSTRet;
            AExecSql.ParamByName('predbcefet').AsFloat      := pRedBCEfet;
            AExecSql.ParamByName('vbcefet').AsFloat         := vBCEfet;
            AExecSql.ParamByName('picmsefet').AsFloat       := pICMSEfet;
            AExecSql.ParamByName('vicmsefet').AsFloat       := vICMSEfet;

            {$REGION 'Campos originais do xml, que o sistema nunca altera'}
            AExecSql.ParamByName('ucom').AsString               := Prod.uCom.ToUpper();
            AExecSql.ParamByName('qcom').AsFloat                := Prod.qCom;
            AExecSql.ParamByName('vuncom').AsFloat              := Prod.vUnCom;
            AExecSql.ParamByName('nitem_xml').AsFloat           := Prod.nItem;
            AExecSql.ParamByName('icm_orig').AsString           := OrigToStr(orig);
            AExecSql.ParamByName('icm_cst').AsString            := IfThen(CSOSN  = csosnVazio, CSTICMSToStr(CST));
            AExecSql.ParamByName('icm_csosn').AsString          := IfThen(CSOSN <> csosnVazio, CSOSNIcmsToStr(CSOSN));
            AExecSql.ParamByName('icm_pred').AsFloat            := pRedBC;
            AExecSql.ParamByName('icm_vbc').AsFloat             := vBC;
            AExecSql.ParamByName('icm_picm').AsFloat            := IfThen(pICMS > 0, pICMS, pCredSN);
            AExecSql.ParamByName('icm_vicm').AsFloat            := IfThen(vICMS > 0, vICMS, vCredICMSSN);
            AExecSql.ParamByName('icm_vbcfcp').AsFloat          := vBCFCP;
            AExecSql.ParamByName('icm_pfcp').AsFloat            := pFCP;
            AExecSql.ParamByName('icm_vfcp').AsFloat            := vFCP;
            AExecSql.ParamByName('icm_modbcst').AsString        := modBCSTToStr(modBCST);
            AExecSql.ParamByName('icm_pmvast').AsFloat          := pMVAST;
            AExecSql.ParamByName('icm_predbcst').AsFloat        := pRedBCST;
            AExecSql.ParamByName('icm_vbcst').AsFloat           := vBCST;
            AExecSql.ParamByName('icm_picmst').AsFloat          := pICMSST;
            AExecSql.ParamByName('icm_vicmst').AsFloat          := vICMSST;
            AExecSql.ParamByName('icm_vbcfcpst').AsFloat        := vBCFCPST;
            AExecSql.ParamByName('icm_pfcpst').AsFloat          := pFCPST;
            AExecSql.ParamByName('icm_vfcpst').AsFloat          := vFCPST;
            AExecSql.ParamByName('icm_vicmdeson').AsFloat       := vICMSDeson;
            AExecSql.ParamByName('icm_vbcstret').AsFloat        := vBCSTRet;
            AExecSql.ParamByName('icm_pst').AsFloat             := pST;
            AExecSql.ParamByName('icm_vicmssubstituto').AsFloat := vICMSSubstituto;
            AExecSql.ParamByName('icm_vicmsstret').AsFloat      := vICMSSTRet;
            AExecSql.ParamByName('icm_vbcfcpstret').AsFloat     := vBCFCPSTRet;
            AExecSql.ParamByName('icm_pfcpstret').AsFloat       := pFCPSTRet;
            AExecSql.ParamByName('icm_vfcpstret').AsFloat       := vFCPSTRet;
            AExecSql.ParamByName('icm_pdif').AsFloat            := pdif;
            AExecSql.ParamByName('icm_vicmsdif').AsFloat        := vICMSDif;
            //AExecSql.ParamByName('icm_pfcpdif').AsFloat         := pfcpdif;
            //AExecSql.ParamByName('icm_vfcpdif').AsFloat         := vfcpdif;
            //AExecSql.ParamByName('icm_vicmsop_dif').AsFloat     := vicmsop_dif;
            //AExecSql.ParamByName('icm_vfcpefet_dif').AsFloat    := vfcpefet_dif;
            AExecSql.ParamByName('icm_qbcmono').AsFloat         := qBCMono;
            AExecSql.ParamByName('icm_vicmsmono').AsFloat       := vICMSMono;
            AExecSql.ParamByName('icm_adremicms').AsFloat       := adRemICMS;
            AExecSql.ParamByName('icm_qbcmonoreten').AsFloat    := qBCMonoReten;
            AExecSql.ParamByName('icm_vicmsmonoreten').AsFloat  := vICMSMonoReten;
            AExecSql.ParamByName('icm_adremicmsreten').AsFloat  := adRemICMSReten;
            AExecSql.ParamByName('icm_qbcmonoret').AsFloat      := qBCMonoRet;
            AExecSql.ParamByName('icm_vicmsmonoret').AsFloat    := vICMSMonoRet;
            AExecSql.ParamByName('icm_adremicmsret').AsFloat    := adRemICMSRet;
            {$ENDREGION}
          end;

          AExecSql.ParamByName('valor_ipi').AsFloat := 0;
          AExecSql.ParamByName('base_ipi').AsFloat  := 0;
          AExecSql.ParamByName('aliq_ipi').AsFloat  := 0;
          with Imposto.IPI do
          begin
            AExecSql.ParamByName('ipi_cnpjprod').AsString := CNPJProd.Substring(0, 14);
            AExecSql.ParamByName('ipi_cselo').AsString    := cSelo.Substring(0, 60);
            AExecSql.ParamByName('ipi_qselo').AsInteger   := qSelo;
            AExecSql.ParamByName('valor_ipi').AsFloat     := vIPI;
            if vBC > 0 then
              AExecSql.ParamByName('base_ipi').AsFloat := vBC
            else if pIPI > 0 then
              AExecSql.ParamByName('base_ipi').AsFloat := RoundTo( (vIPI * 100) / pIPI, -2)
            else if vIPI > 0 then
              AExecSql.ParamByName('base_ipi').AsFloat := Prod.vProd - Prod.vDesc;

            if pIPI > 0 then
              AExecSql.ParamByName('aliq_ipi').AsFloat := pIPI
            else if vBC > 0 then
              AExecSql.ParamByName('aliq_ipi').AsFloat := RoundTo( (vIPI / vBC) * 100, -2);
          end;

          AExecSql.ParamByName('valor_pis').AsFloat := Imposto.PIS.vPIS;
          AExecSql.ParamByName('valor_cofins').AsFloat := Imposto.COFINS.vCOFINS;

          with Imposto.PISST do
          begin
            AExecSql.ParamByName('aliq_pis_st').AsFloat := pPis;
            AExecSql.ParamByName('base_pis_st').AsFloat := vBc;
            AExecSql.ParamByName('valor_pis_st').AsFloat := vPIS;
            AExecSql.ParamByName('indSomaPISST').AsInteger := IfThen(indSomaPISST in [ispPISSTNaoCompoe, ispPISSTCompoe], Ord(indSomaPISST), Ord(ispPISSTCompoe)) - 1;
          end;
          with Imposto.COFINSST do
          begin
            AExecSql.ParamByName('aliq_cofins_st').AsFloat := pCOFINS;
            AExecSql.ParamByName('base_cofins_st').AsFloat := vBC;
            AExecSql.ParamByName('valor_cofins_st').AsFloat := vCOFINS;
            AExecSql.ParamByName('indSomaCOFINSST').AsInteger := IfThen(indSomaCOFINSST in [iscCOFINSSTNaoCompoe, iscCOFINSSTCompoe], Ord(indSomaCOFINSST), Ord(iscCOFINSSTCompoe)) - 1;
          end;

          tribDFe := TributosDFeFactory.GetTributoDFe( TributoDFeOrigemEnum.tdfoNotaFiscal, Imposto );
          try

            if tribDFe <> nil then
            begin
              AExecSql.ParamByName('dfe_trib_id').AsString := tribDFe.Id;

              tributoHandler.SetItem( tribDFe, tdfoNotaFiscal );


              tribDFe.Id := NewGuid();
              AExecSql.ParamByName('dfe_trib_id_xml').AsString := tribDFe.Id;

              tributoHandler.SetItem( tribDFe, tdfoNFeXmlEntrada );
            end
            else
            begin
              AExecSql.ParamByName('dfe_trib_id').Clear();
              AExecSql.ParamByName('dfe_trib_id_xml').Clear();
            end;

          finally
            tribDFe.Free();
          end;

          AExecSql.ExecSQL;

        end;
        {$ENDREGION}

        {$REGION 'Validando novamente o CNPJ'}
        if (not cnpjEntradaPermitido) and (cnpjCadProdPermitido) then
          Exit('ERRO|CNPJ do Destinatario difere do CNPJ da Empresa. Permissão apenas para cadastro de produtos' + #13 +
            'CNPJ Destinatario: ' + Dest.CNPJCPF.Trim + #13 +
            'CNPJ Empresa: ' + ACNPJ);
        {$ENDREGION}

        {$REGION 'Importando itens / veiculo'}
        for I := 0 to Det.Count - 1 do with Det.Items[I].Prod do
        if tipoNF_P_V_O.Equals('V') and (not veicProd.chassi.Trim.IsEmpty) then

        begin
          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into notafiscal_item_veiculo (' +
            ' cod_nf, cod_empresa, nitem, chassi, tipo_venda, tprest, cor, ano_fab, ano_mod, motor, versao,' +
            ' cod_cor' +
//            ' versao, DESCRICAO_VERSAO, CILINDROS, CILINDRADA, LOTACAO, RENAVAM, PRECO_TAB, NSERIE,' +
//            ' TIP_PINTURA, COMBUSTIVEL, TPCOMB, Tipo, MARCA, COD_COMBUSTIVEL, COD_MARCA, COD_TIPO_ESP
            ') values (' +
            ' :cod_nf, :cod_empresa, :nitem, :chassi, :tipo_venda, :tprest, :cor, :ano_fab, :ano_mod, :motor, :versao,' +
            ' :cod_cor' +
            ')';

          AVeicVersao := 0;
          if CFOP = '5409' then
          begin
            buscas.Close;
            buscas.SQL.Text := 'select VERSAO from NOTAFISCAL_ITEM_VEICULO' +
              ' where CHASSI = ' + veicProd.chassi.QuotedString +
              ' order by cod_nf desc';
            buscas.Open;
            AVeicVersao := buscas.FieldByName('versao').AsInteger;

            buscas.Close;
            buscas.SQL.Text := 'select codigo from tipmodelo' +
              ' where codigo = ' + AVeicVersao.ToString +
              ' and cod_empresa = ' + ACodEmpresa.ToString +
              ' and vndestoque = ''S'' and ativo = 1';
            buscas.open;
            AVeicVersao := buscas.FieldByName('codigo').AsInteger;
          end
          else
          begin
            buscas.Close;
            buscas.SQL.Text := 'select codigo from tipmodelo' +
              ' where codigofab like ''%' + cProd + '%''' +
              ' and cod_empresa = ' + ACodEmpresa.ToString +
              ' and vndestoque = ''S'' and ativo = 1';
            buscas.open;
            AVeicVersao := buscas.FieldByName('codigo').AsInteger;

            if buscas.IsEmpty then
            begin
              buscas.Close;
              buscas.SQL.text := 'select tm.* from tipmodelo_codigofab t' +
                ' inner join tipmodelo tm on tm.codigo = t.codigo and tm.cod_empresa = t.cod_empresa' +
                ' where t.codigo_fab = ' +cProd.QuotedString +
                ' and t.cod_empresa = ' + ACodEmpresa.ToString +
                ' and tm.ativo = 1  and tm.vndestoque = ''S'' ';
              buscas.open;
              AVeicVersao := buscas.FieldByName('codigo').AsInteger;
            end;
          end;

          AExecSql.ParamByName('cod_nf').AsInteger      := ACodNF;
          AExecSql.ParamByName('cod_empresa').AsInteger := ACodEmpresa;
          AExecSql.ParamByName('nitem').AsInteger       := nItem;
          AExecSql.ParamByName('versao').AsInteger      := AVeicVersao;
          with veicProd do
          begin
            AExecSql.ParamByName('chassi').AsString     := chassi.Substring( 0, 17);
            AExecSql.ParamByName('tipo_venda').AsString := 'N';
            AExecSql.ParamByName('tprest').AsString     := '0';
            AExecSql.ParamByName('cor').AsString        := xCor.Substring( 0, 30);
            AExecSql.ParamByName('ano_fab').AsInteger   := anoFab;
            AExecSql.ParamByName('ano_mod').AsInteger   := anoMod;
            AExecSql.ParamByName('motor').AsString      := nMotor.Substring( 0, 21);
            AExecSql.ParamByName('cod_cor').AsString  := IfThen(AUsarCorFabDenatran, cCorDENATRAN, cCor);
          end;
          AExecSql.ExecSQL;
        end;
        {$ENDREGION}

      end;

      if AExecSql.Transaction.InTransaction then
        AExecSql.Transaction.Commit;

      Result := 'OK';

    except on E: Exception do
      begin
        Result := 'ERRO|' + E.Message;
      end;
    end;
  finally
    if AExecSql.Transaction.InTransaction then
      AExecSql.Transaction.Rollback;
    DesconectaBanco;
    if Assigned(AvincProd) then
      FreeAndNil(AvincProd);
    FreeAndNil(ANFe);
    FreeAndNil(AExecSql);
    FreeAndNil(AList);
  end;
end;

function TClassNfVenda.AddNFeInDBFromXMLSaida(AListParams: string): string;
var
  //Parametros
  ASisAuto, ASisVeic, AUsarCorFabDenatran, ABuscaCodNoProduto: Boolean;
  ACodEmpresa, ACodNF, ACodUsuario: Integer;
  ACNPJ, AFileName, entSai: string;
  //fim parametros
  ANFe: TACBrNFe;
  //ADelimiter: string;
  AStrCondicao: string;
  ACodBairro, ACodCidade, ACodUF, ACodCliente, ACodTransporta, I: Integer;
  ADataHoraDB: TDateTime;
  AVeicVersao: Integer;
  AList: TStrings;
  AExecSql: TIBQuery;
  AvincProd: TVinculoProdutos;
  AxmlNfe: string;
  vListProdSemVinculo: TStringList;
  iCondPag: Integer;
  tributoHandler: ITributosPersistentHandler;
  tribDFe: TributoDFeContextEtd;
begin
  AList := TStringList.Create;
  AList.Delimiter := ',';
  try
    AList.Text              := AListParams;
    ASisAuto                := TAuxiliar.GetParam('ASisAuto', AList).ToBoolean;
    ASisVeic                := TAuxiliar.GetParam('ASisVeic', AList).ToBoolean;
    AUsarCorFabDenatran     := TAuxiliar.GetParam('AUsarCorFabDenatran', AList).ToBoolean;
    ACodEmpresa             := TAuxiliar.GetParam('ACodEmpresa', AList).ToInteger;
    ACodUsuario             := TAuxiliar.GetParam('ACodUsuario', AList).ToInteger;
    ACodNF                  := TAuxiliar.GetParam('ACodNF', AList).ToInteger;
    ACNPJ                   := TAuxiliar.GetParam('ACNPJ', AList).Trim;
    AFileName               := TAuxiliar.GetParam('AFileName', AList).Trim;
    vcaminhobanco           := TAuxiliar.GetParam('ADabaseName', AList).Trim;
    ABuscaCodNoProduto      := TAuxiliar.GetParam('ABuscaCodNoProduto', AList).ToBoolean;
    entSai                  := AList.Values['EntradaOuSaida'];
  finally
    FreeAndNil(AList);
  end;

  if not FileExists(AFileName) then
    Exit('ERRO|Arquivo não existe');

  if not conectaBanco then
    Exit('ERRO|Não foi possível conectar ao banco de dados');

  ANFe                 := TACBrNFe.Create(Application);
  AExecSql             := TIBQuery.Create(buscas.Owner);
  AExecSql.Database    := buscas.Database;
  AExecSql.Transaction := buscas.Transaction;
  AList                := TStringList.Create;

  vListProdSemVinculo := TStringList.Create;
  vListProdSemVinculo.Clear;
  vListProdSemVinculo.Sorted := True;
  vListProdSemVinculo.Duplicates := dupIgnore;

  tributoHandler := TributosPersistentHandler.Create(
    AExecSql.Transaction,
    ContainerDFe.GetInstance().DFeFeaturesFactory.CreateSalvarTributoDFeUseCase(),
    nil
  );

  try
    try
      AList.LoadFromFile(AFileName);
      if AList.Text.ToLower.Contains('<nfeproc xmlns=''') and
         AList.Text.ToLower.Contains('<infnfe versao=''') and
         AList.Text.ToLower.Contains('<det nitem=''') then
      ANFe.NotasFiscais.LoadFromString( UTF8ToString( AList.Text ))
      else
      ANFe.NotasFiscais.LoadFromString( UTF8ToString( AList.Text.
        Replace('<?xml version=''1.0'' encoding=''utf-8''?>', '<?xml version="1.0" encoding="utf-8"?>', [rfIgnoreCase]).
        Replace('<nfeProc versao=''3.10''', '<nfeProc versao="3.10"', [rfIgnoreCase]).
        Replace('<nfeProc xmlns=''http://www.portalfiscal.inf.br/nfe''', '<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe"', [rfIgnoreCase]).
        Replace('<nfeProc versao="3.10" xmlns=''http://www.portalfiscal.inf.br/nfe''>', '<nfeProc versao="3.10" xmlns="http://www.portalfiscal.inf.br/nfe">', []).
        Replace('<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe" versao=''3.10''>', '<nfeProc xmlns="http://www.portalfiscal.inf.br/nfe" versao="3.10">', [])
      ));
      AxmlNfe := AList.Text;
      AList.Clear;
      //ANFe.NotasFiscais.LoadFromFile(AFileName);
      if ANFe.NotasFiscais.Count = 0 then
        Exit('Erro|Não existem notas fiscais no arquivo XML informado: ' + AFileName);

      with ANFe.NotasFiscais.Items[0].NFe do
      begin
        {$REGION 'Pré validações'}
        if det.Items[0].Prod.veicProd.chassi <> '' then
        begin
          Exit('ERRO|Opção não disponível para nota fical de veículos');
          if not ASisVeic then
            Exit('ERRO|Usuário não pode importar Notas fiscais de veículos. ' + #13 +
              'Favor configurar a senha do mesmo');
        end
        else if not ASisAuto then
          Exit('ERRO|Usuário não pode importar Notas fiscais de Produtos. ' + #13 +
              'Favor configurar a senha do mesmo');

        if (not Dest.CNPJCPF.Trim.IsEmpty) and
          (Emit.CNPJCPF.Trim <> ACNPJ.Trim) then
          if (Dest.CNPJCPF.Trim <> ACNPJ.Trim) then
            Exit('ERRO|CNPJ do Destinatario difere do CNPJ da Empresa' + #13 +
              'CNPJ Destinatario: ' + Dest.CNPJCPF.Trim + #13 +
              'CNPJ Empresa: ' + ACNPJ);
        {$ENDREGION}

        {$REGION 'Testar nota'}
         // Liberando para notas emissão propria entrada
         {
         if Ide.tpNF <> tnSaida then
          Exit('ERRO|Nota fiscal informada é de entrada, nº ' + IntToStr(Ide.nNF));
          }

        // Importar somente nf emitida pela própria empresa
        if trim(Emit.CNPJCPF) <> trim(ACNPJ) then
          Exit('ERRO|Nota fiscal informada não foi emitida pela a própria empresa, nº ' + IntToStr(Ide.nNF) +
            #13 + 'CNPJ NF: ' + trim(Emit.CNPJCPF) + #13 + 'CNPJ Emp: ' + trim(ACNPJ));

        if not Det.Items[0].Prod.veicProd.chassi.IsEmpty then
          Exit('ERRO|Importação não disponível para nota fiscal de veículos, nº ' + IntToStr(Ide.nNF));

        // Verificar se nota já foi importada
        AExecSql.Close;
        AExecSql.SQL.Text := ' select cod_nf, cod_empresa from notafiscal ' +
          ' where chave_nfe = :chave_nfe and cod_empresa = :cod_empresa  ';
        AExecSql.ParamByName('chave_nfe').AsString := apenasNumeros(infNFe.ID);
        AExecSql.ParamByName('cod_empresa').AsInteger := ACodEmpresa;
        AExecSql.Open;

        if not AExecSql.IsEmpty then
          Exit('ERRO|Nota fiscal nº ' + IntToStr(Ide.nNF) + ' já importada');
        {$ENDREGION}

        {$REGION 'Testando itens'}
        if Det.Items[0].Prod.veicProd.chassi.IsEmpty then
        begin
          for I := 0 to Det.Count - 1 do with Det.Items[I] do
          begin
            AExecSql.Close;

            var sEANPesquisa := Det.Items[I].Prod.cEAN;
            sEANPesquisa := IfThen(sEANPesquisa <> 'SEM GTIN', sEANPesquisa);

            if sEANPesquisa <> '' then
            begin
              AExecSql.SQL.Text := ' select p.grupo_prod, p.cod_prod, p.num_fab_prod num_fab_fornecedor, 0 cod_grade, ' +
                ' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from produtos p ' +
                ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
                ' where p.cod_empresa = :cod_empresa ' +
                ' and cb.cod_barra = :cod_barra and p.ativo = 1 ' ;
              AExecSql.ParamByName('cod_barra').AsString := Det.Items[I].Prod.cEAN;
              AExecSql.ParamByName('cod_empresa').AsInteger := ACodEmpresa;
              AExecSql.Open;
            end;

            if AExecSql.IsEmpty then
            begin
              AExecSql.Close;
              AExecSql.SQL.Text := ' select p.grupo_prod, p.cod_prod, p.num_fab_prod num_fab_fornecedor, 0 cod_grade, ' +
                ' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from produtos p ' +
                ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
                ' where p.cod_empresa = :cod_empresa ' +
                ' and cb.cod_barra = :cod_barra and p.ativo = 1 ' ;
              AExecSql.ParamByName('cod_barra').AsString := Det.Items[I].Prod.cProd;
              AExecSql.ParamByName('cod_empresa').AsinTeger := ACodEmpresa;
              AExecSql.Open;

              if AExecSql.IsEmpty then
                vListProdSemVinculo.Add('COD: ' + Det.Items[I].Prod.cProd + ' ' +
                  ' EAN: ' + Det.Items[I].Prod.cEAN + ' DESCR: ' + Det.Items[I].Prod.xProd);
            end;
          end;
          if vListProdSemVinculo.Count > 0 then
            Exit('ERRO|Produto(s) não encontrado(s) no cadastro, nota fiscal nº ' + IntToStr(Ide.nNF) + ':' +
              sLineBreak + sLineBreak + vListProdSemVinculo.Text + sLineBreak + 'Favor realizar o cadastro');
        end;
        {$ENDREGION}

        {$REGION 'Cadastro de bairros'}
        buscas.Close;
        buscas.SQL.Text := 'select cod_bairro from bairros where NOME_BAIRRO like ' + QuotedStr('%' +
          Dest.EnderDest.xBairro.Trim.ToUpper.Substring( 0, 30) + '%');
        buscas.Open;
        if not buscas.IsEmpty then
          ACodBairro := buscas.FieldByName('cod_bairro').AsInteger
        else
        begin
          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into bairros (nome_bairro, cod_usuario, cod_usuario_alt) values ' +
            '(:nome_bairro, :cod_usuario, :cod_usuario_alt)';
          AExecSql.ParamByName('nome_bairro').AsString := Dest.EnderDest.xBairro.ToUpper.Substring( 0, 30);
          AExecSql.ParamByName('cod_usuario').AsInteger := ACodUsuario;
          AExecSql.ParamByName('cod_usuario_alt').AsInteger := ACodUsuario;
          AExecSql.ExecSQL;

          buscas.Close;
          buscas.Open;
          if not buscas.IsEmpty then
            ACodBairro := buscas.FieldByName('cod_bairro').AsInteger
          else
            Exit('ERRO|Bairro do emitente não pode ser cadastrado');
        end;

        {$ENDREGION}

        {$REGION 'Cadastro de cidades'}
        buscas.Close;
        buscas.SQL.Text := 'select cod_cidade from cidades where ibge_cod_cidade = ' +
          Dest.EnderDest.cMun.ToString;
        buscas.Open;
        if not buscas.IsEmpty then
          ACodCidade := buscas.FieldByName('cod_cidade').AsInteger
        else
        begin
          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into cidades(nome_cidade, cod_usuario,cod_usuario_alt,ibge_cod_cidade) values ' +
            '(:nome_cidade, :cod_usuario, :cod_usuario_alt,:ibge_cod_cidade)';
          AExecSql.ParamByName('nome_cidade').AsString := Dest.EnderDest.xMun.ToUpper.Substring( 0, 30);
          AExecSql.ParamByName('cod_usuario').AsInteger := ACodUsuario;
          AExecSql.ParamByName('cod_usuario_alt').AsInteger := ACodUsuario;
          AExecSql.ParamByName('ibge_cod_cidade').AsInteger := Dest.EnderDest.cMun;
          AExecSql.ExecSQL;

          buscas.Close;
          buscas.Open;
          if not buscas.IsEmpty then
            ACodCidade := buscas.FieldByName('cod_cidade').AsInteger
          else
            Exit('ERRO|Cidade não pode ser cadastrada');
        end;
        {$ENDREGION}

        {$REGION 'Obtendo estado'}
        buscas.Close;
        buscas.SQL.Text := 'select codigo_uf from estados where IBGE_CODIGO_UF = ' +
          Dest.EnderDest.cMun.ToString.Substring( 0, 2);
        buscas.Open;
        if not buscas.IsEmpty then
          ACodUF := buscas.FieldByName('codigo_uf').AsInteger
        else
          Exit('ERRO|Estado não encontrado. UF IBGE: ' + Dest.EnderDest.cMun.ToString.Substring( 0, 2));
        {$ENDREGION}

        {$REGION 'Cadastro de clientes'}
        buscas.Close;
        buscas.SQL.Text := 'select cod_cliente, tipo from clientes where CPFCGC = ' + QuotedStr(trim(Dest.CNPJCPF)) +
          ' and cod_empresa = ' + ACodEmpresa.ToString;
        buscas.Open;
        if not buscas.IsEmpty then
        begin
          ACodCliente := buscas.FieldByName('cod_cliente').AsInteger;

          if (buscas.FieldByName('tipo').AsString <> 'C') and
            (buscas.FieldByName('tipo').AsString <> 'A') then
          begin
            AExecSql.Close;
            AExecSql.SQL.Text := 'update clientes set tipo = ''A''' +
              ' where cod_cliente = ' + ACodCliente.ToString +
              ' and cod_empresa = ' + ACodEmpresa.ToString;
            AExecSql.Prepare;
            AExecSql.ExecSQL;
          end;
        end
        else //if Application.MessageBox('O cliente/destinatário não cadastrado.' + #13 +  'Deseja cadastrar?', 'Cadastrar Cliente/Destinatário.', MB_YESNO + MB_ICONQUESTION) = idYes then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select cod, (select current_ts from sp_current_ts(' + ACodEmpresa.ToString + ')) as dh_db' +
                             ' from incrementa_codigo( ' + ACodEmpresa.ToString + ', ''CLIENTES'')';
          buscas.Open;
          ACodCliente := buscas.FieldByName('cod').AsInteger;
          ADataHoraDB := buscas.FieldByName('dh_db').AsDateTime;

          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into clientes (COD_CLIENTE, COD_EMPRESA, CODIGO_TIPO, EST_CODIGO_UF, CODIGO_UF, CPFCGC, NOME_CLIENTE, RAZAO, INSC_EST, ENDERECO, END_COBRANCA,' +
            ' NUM_END_CLIENTE, COD_BAIRRO, COD_BAIRRO_COBRANCA, BAIRRO, BAIRRO_COBRANCA, CEP, CEP_COBRANCA, COD_CIDADE, COD_CIDADE_COBRANCA, CIDADE, CIDA_COBRANCA, FONE_CLIENTE, TIPO, INSC_SUB_F,TIPVCLIENTE,DATA_CADASTRO, REP_INT_ACTIVE)' +
            ' values (:COD_CLIENTE, :COD_EMPRESA, :CODIGO_TIPO, :EST_CODIGO_UF, :CODIGO_UF, :CPFCGC, :NOME_CLIENTE, :RAZAO, :INSC_EST, :ENDERECO, :END_COBRANCA,' +
            ' :NUM_END_CLIENTE, :COD_BAIRRO, :COD_BAIRRO_COBRANCA, :BAIRRO, :BAIRRO_COBRANCA, :CEP, :CEP_COBRANCA, :COD_CIDADE, :COD_CIDADE_COBRANCA, :CIDADE, :CIDA_COBRANCA, :FONE_CLIENTE, :TIPO, :INSC_SUB_F,:TIPVCLIENTE,:DATA_CADASTRO, :REP_INT_ACTIVE)';

          AExecSql.ParamByName('COD_CLIENTE').AsInteger := ACodCliente;
          AExecSql.ParamByName('COD_EMPRESA').AsInteger := ACodEmpresa;
          AExecSql.ParamByName('CODIGO_TIPO').AsInteger := 2;
          AExecSql.ParamByName('EST_CODIGO_UF').AsInteger := ACodUF;
          AExecSql.ParamByName('CODIGO_UF').AsInteger := ACodUF;
          AExecSql.ParamByName('CPFCGC').AsString := Dest.CNPJCPF;
          AExecSql.ParamByName('NOME_CLIENTE').AsString := Dest.xNome.ToUpper.Substring( 0, 35);
          AExecSql.ParamByName('RAZAO').AsString := Dest.xNome.ToUpper.Substring( 0, 60);
          AExecSql.ParamByName('INSC_EST').AsString := Dest.IE;
          AExecSql.ParamByName('ENDERECO').AsString := Dest.EnderDest.xLgr.ToUpper.Substring( 0, 50);
          AExecSql.ParamByName('END_COBRANCA').AsString := string(Dest.EnderDest.xLgr.ToUpper + ', ' + Dest.EnderDest.nro).Substring( 0, 50);
          AExecSql.ParamByName('NUM_END_CLIENTE').AsString := Dest.EnderDest.nro;
          AExecSql.ParamByName('Cod_BAIRRO').AsInteger := ACodBairro;
          AExecSql.ParamByName('COD_BAIRRO_COBRANCA').AsInteger := ACodBairro;
          AExecSql.ParamByName('BAIRRO').AsString := Dest.EnderDest.xBairro.ToUpper.Substring( 0, 35);
          AExecSql.ParamByName('BAIRRO_COBRANCA').AsString := Dest.EnderDest.xBairro.ToUpper.Substring( 0, 35);
          AExecSql.ParamByName('CEP').AsString := Dest.EnderDest.Cep.ToString.PadLeft(8, '0');
          AExecSql.ParamByName('CEP_COBRANCA').AsInteger := Dest.EnderDest.Cep;
          AExecSql.ParamByName('COD_CIDADE').AsInteger := ACodCidade;
          AExecSql.ParamByName('COD_CIDADE_COBRANCA').AsInteger := ACodCidade;
          AExecSql.ParamByName('CIDADE').AsString := Dest.EnderDest.xMun.ToUpper.Substring( 0, 30);
          AExecSql.ParamByName('CIDA_COBRANCA').AsString := Dest.EnderDest.xMun.ToUpper.Substring( 0, 30);
          AExecSql.ParamByName('FONE_CLIENTE').AsString := Dest.EnderDest.fone.Replace('(', '',[rfReplaceAll]).
                                                                             Replace(')', '',[rfReplaceAll]).
                                                                             Replace('-', '',[rfReplaceAll]).
                                                                             Replace(' ', '',[rfReplaceAll]).
                                                                             Substring( 0, 13).Trim;
          AExecSql.ParamByName('TIPO').AsString := 'C';
          //AExecSql.ParamByName('INSC_SUB_F').AsString := Dest.IEST;
          AExecSql.ParamByName('TIPVCLIENTE').AsString := 'V';
          AExecSql.ParamByName('DATA_CADASTRO').AsDate := DateOf(ADataHoraDB);
          AExecSql.ParamByName('REP_INT_ACTIVE').AsInteger := 1;
          AExecSql.ExecSQL;
        end;
//        else
//          Exit('ERRO|Operação cancelada pelo usuário');
        {$ENDREGION}

        {$REGION 'Validando existencia da nota fiscal'}
        buscas.Close;
        buscas.SQL.Text := 'select cod_nf, status, ativo, cod_nf from notafiscal' +
          ' where cod_empresa = ' + ACodEmpresa.ToString +
          ' and natureza_nf = ' + entSai.QuotedString() +
          ' and num_nf = ' + Ide.nNF.ToString +
          ' and serie = ' + Ide.serie.ToString.QuotedString +
          ' and cod_cliente = ' + ACodCliente.ToString +
          ' and modelo_nf = ''55''' +
          ' and cod_nf <> ' + ACodNF.ToString;
        buscas.Open;
        // ImportaXML = Somente o cabeçalho, então OK, pode continuar
        // PreNotaXML = Já importou, aqui vou excluir e importar novamente
        buscas.First;
        while not buscas.Eof do
        begin
          if buscas.FieldByName('status').AsString.Equals('ImportaXML') or
             buscas.FieldByName('status').AsString.Equals('PreNotaXML') then
          begin
            AExecSql.Close;
            AExecSql.SQL.Text := 'delete from notafiscal' +
              ' where cod_nf = ' + ACodNF.ToString +
              ' and cod_empresa = ' + ACodEmpresa.ToString +
              ' and status = ' + buscas.FieldByName('status').AsString.QuotedString;
            AExecSql.ExecSQL;
          end
          else if not buscas.FieldByName('status').AsString.Trim.IsEmpty then
            Exit('ERRO|Já existe uma nota fiscal no banco de dados com estes dados' + #13 +
                 'Número: ' +Ide.nNF.ToString + #13 +
                 'Série: ' +Ide.serie.ToString + #13 +
                 'Modelo: 55' + #13 + #13 +
                 'Código: ' + buscas.FieldByName('cod_nf').AsInteger.ToString + #13 +
                 'Ativo: ' + buscas.FieldByName('ativo').AsInteger.ToString + #13 +
                 'Status: ' + buscas.FieldByName('status').AsString);
          buscas.Next;
        end;
        {$ENDREGION}

        {$REGION 'Cadastro de transportador'}
        if Transp.Transporta.CNPJCPF.Trim.IsEmpty then
          ACodTransporta := 0
        else
        begin
          buscas.Close;
          buscas.SQL.Text := 'select CODIGO_TR from transportador' +
            ' where CNPJ_TR = ' + Transp.Transporta.CNPJCPF.QuotedString +
            ' and cod_empresa = ' + ACodEmpresa.ToString;
          buscas.Open;

          if not buscas.IsEmpty then
            ACodTransporta := buscas.FieldByName('CODIGO_TR').AsInteger
          else if Application.MessageBox('O transportador não esta cadastrado.' + #13 +
                                         'Deseja cadastrar?',
                                         'Cadastrar Transportador', MB_YESNO + MB_ICONQUESTION) = idYes then
          begin
            AExecSql.Close;
            AExecSql.SQL.Text := 'select CODIGO_UF from estados' +
              ' where SIGLA_UF = ' + Transp.Transporta.UF.QuotedString;
            AExecSql.Open;
            ACodUF := AExecSql.FieldByName('CODIGO_UF').AsInteger;

            AExecSql.Close;
            AExecSql.SQL.Text := 'select cod from incrementa_codigo( ' + ACodEmpresa.ToString + ', ''TRANSPORTADOR'')';
            AExecSql.Open;
            ACodTransporta := AExecSql.FieldByName('cod').AsInteger;

            AExecSql.Close;
            AExecSql.SQL.Text := 'insert into transportador(CODIGO_TR, COD_EMPRESA, NOME_TR, CNPJ_TR, END_TR, MUNICIPIO_TR, UF_TR, IE_TR) values ' +
              '(:CODIGO_TR,:COD_EMPRESA,:NOME_TR,:CNPJ_TR, :END_TR, :MUNICIPIO_TR, :UF_TR, :IE_TR)';
            AExecSql.ParamByName('CODIGO_TR').AsInteger := ACodTransporta;
            AExecSql.ParamByName('COD_EMPRESA').AsInteger := ACodEmpresa;
            AExecSql.ParamByName('NOME_TR').AsString := Transp.Transporta.xNome.ToUpper.Substring( 0, 60);
            AExecSql.ParamByName('CNPJ_TR').AsString := Transp.Transporta.CNPJCPF;
            AExecSql.ParamByName('END_TR').AsString := Transp.Transporta.xEnder.ToUpper.Substring( 0, 40);
            AExecSql.ParamByName('MUNICIPIO_TR').AsString := Transp.Transporta.xMun.ToUpper.Substring( 0, 25);
            AExecSql.ParamByName('UF_TR').AsInteger := ACodUF;
            AExecSql.ParamByName('IE_TR').AsString := Transp.Transporta.IE;
            AExecSql.ExecSQL;
          end
          else
            Exit('ERRO|Operação cancelada pelo usuário');
        end;
        {$ENDREGION}

        {$REGION 'Condição de pagamento'}
        iCondPag :=
          SqlOpen('select first 1 cp.cod_cond_pag, 0 ordem from cond_pag cp' +
                  ' where cp.desc_cond_pag like ''%ISTA%''' +
                  ' union distinct' +
                  ' select first 1 cp.cod_cond_pag, 1 ordem from cond_pag cp' +
                  ' where cp.desc_cond_pag like ''%PRAZO%''' +
                  ' union distinct' +
                  ' select first 1 cp.cod_cond_pag, 2 ordem from cond_pag cp').FieldByName('cod_cond_pag').AsInteger;

        {$ENDREGION}

        {$REGION 'Importando cabeçalho'}
        AExecSql.Close;
        AExecSql.SQL.Text := 'update notafiscal set ' +
          ' path_xml_import = :path_xml_import, tipo_nf = :tipo_nf, num_nf = :num_nf, serie = :serie,' +
          ' desc_natop = :desc_natop, cod_cliente = :cod_cliente, nome_cliente = :nome_cliente, razao = :razao, ' +
          ' cod_cond_pag = :cod_cond_pag, cod_vendedor = :cod_vendedor, data_contabil = :data_contabil,' +
          ' hora_emissao = :hora_emissao, valor_total = :valor_total, valor_prod= :valor_prod,' +
          ' valor_serv = :valor_serv, valor_desc = :valor_desc, base_icmsub = :base_icmsub,' +
          ' valor_icmsub = :valor_icmsub, valor_ipi = :valor_ipi, valor_frete = :valor_frete,' +
          ' valor_seguro = :valor_seguro, valor_out_desp = :valor_out_desp, obs = :obs,' +
          ' placa_tr = :placa_tr, uf_placa_tr = :uf_placa_tr, chave_nfe = :chave_nfe, modelo_nf = :modelo_nf,' +
          ' cod_usuario = :cod_usuario, inscricao_substituto = :inscricao_substituto,' +
          ' dup_xml_entrada = :dup_xml_entrada, tipo_desconto = :tipo_desconto,' +
          ' aliq_icm = :aliq_icm, base_icm = :base_icm, valor_icm = :valor_icm, status = :status, xml_nfe = :xml_nfe,' +
          ' fcp_vfcp = :fcp_vfcp, fcp_vfcpst = :fcp_vfcpst, fcp_vfcpstret = :fcp_vfcpstret,' +
          ' ipi_vipidevol = :ipi_vipidevol, pag_vtroco = :pag_vtroco, fat_nfat = :fat_nfat, codigo_nop = :codigo_nop, ' +
          ' fat_vorig = :fat_vorig, fat_vdesc = :fat_vdesc, fat_vliq = :fat_vliq, vfcpufdest = :vfcpufdest,' +
          ' vicmsufdest = :vicmsufdest, qbcmono = :qbcmono, vicmsmono = :vicmsmono, qBCMonoReten = :qBCMonoReten,' +
          ' vICMSMonoReten = :vICMSMonoReten, qBCMonoRet = :qBCMonoRet, vICMSMonoRet = :vICMSMonoRet' +
          StrUtils.IfThen(Transp.modFrete in [mfContaEmitente, mfContaDestinatario, mfContaTerceiros, mfSemFrete],
            ', freteconta_tr = :freteconta_tr') +
          StrUtils.IfThen(ACodTransporta > 0, ', codigo_tr = :codigo_tr') +
          StrUtils.IfThen(Transp.Vol.Count > 0,
            ', qtde_volumes_tr = :qtde_volumes_tr, especie_tr = :especie_tr, marca_tr = :marca_tr,' +
            ' numero_tr = :numero_tr, peso_b = :peso_b, peso_l = :peso_l') +
          ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa';
        AExecSql.ParamByName('status').AsString               := 'PreNotaXML';
        AExecSql.ParamByName('cod_nf').AsInteger              := ACodNF;
        AExecSql.ParamByName('cod_empresa').AsInteger         := ACodEmpresa;
        AExecSql.ParamByName('path_xml_import').AsString      := AFileName.Substring( 0, 256);
        AExecSql.ParamByName('tipo_nf').AsString              := StrUtils.IfThen(Det.Items[0].Prod.veicProd.chassi.IsEmpty, 'P', 'V');
        AExecSql.ParamByName('num_nf').AsInteger              := Ide.nNF;
        AExecSql.ParamByName('serie').AsString                := Ide.serie.ToString;
        AExecSql.ParamByName('desc_natop').AsString           := Ide.natOp.Substring( 0, 128);
        AExecSql.ParamByName('cod_cliente').AsInteger         := ACodCliente;
        AExecSql.ParamByName('codigo_nop').AsInteger          := StrToIntDef(Det.Items[0].Prod.CFOP, 0);
        AExecSql.ParamByName('nome_cliente').AsString         := Dest.xNome.ToUpper.Substring( 0, 35);
        AExecSql.ParamByName('razao').AsString                := Dest.xNome.ToUpper.Substring( 0, 60);
        AExecSql.ParamByName('cod_vendedor').AsInteger        := ACodUsuario;
        AExecSql.ParamByName('data_contabil').AsDateTime      := DateOf(Ide.dEmi);
        AExecSql.ParamByName('hora_emissao').AsString         := FormatDateTime('HH:MM:SS', TimeOf(Ide.dEmi));
        AExecSql.ParamByName('valor_total').AsFloat           := Total.ICMSTot.vNF;
        AExecSql.ParamByName('valor_prod').AsFloat            := Total.ICMSTot.vProd;
        AExecSql.ParamByName('valor_serv').AsFloat            := Total.ISSQNtot.vServ;
        AExecSql.ParamByName('valor_desc').AsFloat            := Total.ICMSTot.vDesc;
        AExecSql.ParamByName('base_icmsub').AsFloat           := Total.ICMSTot.vBCST;
        AExecSql.ParamByName('valor_icmsub').AsFloat          := Total.ICMSTot.vST;
        AExecSql.ParamByName('valor_ipi').Asfloat             := Total.ICMSTot.vIPI;
        AExecSql.ParamByName('valor_frete').Asfloat           := Total.ICMSTot.vFrete;
        AExecSql.ParamByName('valor_seguro').AsFloat          := Total.ICMSTot.vSeg;
        AExecSql.ParamByName('valor_out_desp').AsFloat        := Total.ICMSTot.vOutro;
        AExecSql.ParamByName('vfcpufdest').AsFloat            := Total.ICMSTot.vFCPUFDest;
        AExecSql.ParamByName('vicmsufdest').AsFloat           := Total.ICMSTot.vICMSUFDest;
        AExecSql.ParamByName('qbcmono').AsFloat               := Total.ICMSTot.qBCMono;
        AExecSql.ParamByName('vicmsmono').AsFloat             := Total.ICMSTot.vICMSMono;
        AExecSql.ParamByName('qBCMonoReten').AsFloat          := Total.ICMSTot.qBCMonoReten;
        AExecSql.ParamByName('vICMSMonoReten').AsFloat        := Total.ICMSTot.vICMSMonoReten;
        AExecSql.ParamByName('qBCMonoRet').AsFloat            := Total.ICMSTot.qBCMonoRet;
        AExecSql.ParamByName('vICMSMonoRet').AsFloat          := Total.ICMSTot.vICMSMonoRet;
        AExecSql.ParamByName('obs').AsString                  := InfAdic.infCpl + #13 + InfAdic.infAdFisco;
        AExecSql.ParamByName('chave_nfe').AsString            := infNFe.ID.Replace('NFE', '', [rfReplaceAll, rfIgnoreCase]).Substring( 0, 44);
        AExecSql.ParamByName('modelo_nf').AsString            := '55';
        AExecSql.ParamByName('cod_usuario').AsInteger         := ACodUsuario;
        //AExecSql.ParamByName('inscricao_substituto').AsString := Dest.IEST.Substring( 0, 18);
        AExecSql.ParamByName('placa_tr').AsString             := Transp.veicTransp.placa.ToUpper.Substring( 0, 7);
        AExecSql.ParamByName('uf_placa_tr').AsString          := Transp.veicTransp.UF.ToUpper.Substring( 0, 2);
        AExecSql.ParamByName('base_icm').AsFloat              := Total.ICMSTot.vBC;
        AExecSql.ParamByName('valor_icm').AsFloat             := Total.ICMSTot.vICMS;
        if Total.ICMSTot.vBC > 0 then
          AExecSql.ParamByName('aliq_icm').Asfloat            := RoundTo((Total.ICMSTot.vICMS / Total.ICMSTot.vBC) * 100, -2);

        if ACodTransporta > 0 then
          AExecSql.ParamByName('codigo_tr').AsInteger         := ACodTransporta;

        if iCondPag > 0 then
          AExecSql.ParamByName('cod_cond_pag').AsInteger      := iCondPag;

        if Transp.Vol.Count > 0 then
        begin
          AExecSql.ParamByName('qtde_volumes_tr').AsInteger   := Transp.Vol.Items[0].qVol;
          AExecSql.ParamByName('especie_tr').AsString         := Transp.Vol.Items[0].esp.ToUpper.Substring( 0, 15);
          AExecSql.ParamByName('marca_tr').AsString           := Transp.Vol.Items[0].marca.ToUpper.Substring( 0, 15);
          AExecSql.ParamByName('numero_tr').AsString          := Transp.Vol.Items[0].nVol.ToUpper.Substring( 0, 15);
          AExecSql.ParamByName('peso_b').Asfloat              := Transp.Vol.Items[0].pesoB;
          AExecSql.ParamByName('peso_l').Asfloat              := Transp.Vol.Items[0].pesoL;
        end;
        case Transp.modFrete of
          mfContaEmitente    : AExecSql.ParamByName('freteconta_tr').AsString := '1';
          mfContaDestinatario: AExecSql.ParamByName('freteconta_tr').AsString := '2';
          mfContaTerceiros   : AExecSql.ParamByName('freteconta_tr').AsString := '0';
          mfSemFrete         : AExecSql.ParamByName('freteconta_tr').AsString := '9';
        end;
        AExecSql.ParamByName('xml_nfe').AsString      := AxmlNfe;
        AExecSql.ParamByName('fcp_vfcp').AsFloat      := Total.ICMSTot.vFCP;
        AExecSql.ParamByName('fcp_vfcpst').AsFloat    := Total.ICMSTot.vFCPST;
        AExecSql.ParamByName('fcp_vfcpstret').AsFloat := Total.ICMSTot.vFCPSTRet;
        AExecSql.ParamByName('ipi_vipidevol').AsFloat := Total.ICMSTot.vIPIDevol;
        AExecSql.ParamByName('pag_vtroco').AsFloat    := pag.vTroco;
        AExecSql.ParamByName('fat_nfat').AsString     := Cobr.Fat.nFat;
        AExecSql.ParamByName('fat_vorig').AsFloat     := Cobr.Fat.vOrig;
        AExecSql.ParamByName('fat_vdesc').AsFloat     := Cobr.Fat.vDesc;
        AExecSql.ParamByName('fat_vliq').AsFloat      := Cobr.Fat.vLiq;

        AList.Clear;
        AStrCondicao := '';
        for I := 0 to Cobr.Dup.Count - 1 do
          if (Cobr.Dup.Items[I].dVenc > 0) and (Cobr.Dup.Items[I].vDup > 0) then
          begin
            AList.Add(
              Cobr.Dup.Items[I].nDup + '|' +
              DateToStr(Cobr.Dup.Items[I].dVenc) + '|' +
              FloatToStr(Cobr.Dup.Items[I].vDup) + '|'
              );
            AStrCondicao := AStrCondicao + IntToStr(Trunc(Cobr.Dup.Items[I].dVenc - Ide.dEmi)) + '/';
          end;
        if AList.Count > 0 then
        begin
          AExecSql.ParamByName('DUP_XML_ENTRADA').AsString := AList.Text;
          if Length(AStrCondicao) > 0 then
            AStrCondicao := Copy(AStrCondicao, 1, Length(AStrCondicao) - 1);
          buscas.Close;
          buscas.SQL.Text := 'select COD_COND_PAG from COND_PAG' +
            ' where coalesce(NATUREZA_CP,'''') <> ''V''' +
            ' and DESC_COND_PAG like ' + QuotedStr(AStrCondicao + '%') ;
          buscas.Open;
          if buscas.FieldByName('cod_cond_pag').AsInteger > 0 then
            AExecSql.ParamByName('cod_cond_pag').AsInteger := buscas.FieldByName('cod_cond_pag').AsInteger
          else
          begin
            buscas.Close;
            buscas.SQL.Text := 'select COD_COND_PAG from COND_PAG' +
              ' where coalesce(NATUREZA_CP,'''') <> ''V''' +
              ' and RTRIM(UPPER(DESC_COND_PAG)) = ' + QuotedStr(IntToStr(AList.Count) + 'X') ;
            buscas.Open;
            if buscas.FieldByName('cod_cond_pag').AsInteger > 0 then
              AExecSql.ParamByName('cod_cond_pag').AsInteger := buscas.FieldByName('cod_cond_pag').AsInteger;
          end;
        end;

        if (AExecSql.ParamByName('cod_cond_pag').IsNull) and (iCondPag > 0) then
          AExecSql.ParamByName('cod_cond_pag').AsInteger := iCondPag;

        for I := 0 to Det.Count - 1 do
          with Det.Items[I] do
            if Prod.vDesc > 0 then
            begin
              AExecSql.ParamByName('TIPO_DESCONTO').AsString := 'I';
              Break;
            end;

        AExecSql.ExecSQL;
        {$ENDREGION}

        {$REGION 'Importando itens'}
        if Det.Items[0].Prod.veicProd.chassi.IsEmpty then
        begin
          AvincProd := TVinculoProdutos.Create(Self);
          AvincProd.cod_empresa := ACodEmpresa;
          AvincProd.cod_cliente := ACodCliente;
          AvincProd.buscaNoProd := ABuscaCodNoProduto;
          for I := 0 to Det.Count - 1 do with Det.Items[I] do
            if Det.Items[I].Prod.veicProd.chassi.Trim.IsEmpty then
              with AvincProd.NewDetItem(Det.Items[I].Prod.cProd, Det.Items[I].Prod.cEAN).item do
              begin
                nitem              := Det.Items[I].Prod.nItem;
                codigo_nop         := StrToFloatDef(Det.Items[I].Prod.CFOP, 0);
                referencia         := Det.Items[I].Prod.uCom.ToUpper();
                num_fab_fornecedor := Det.Items[I].Prod.cProd;
                descricao_item     := Det.Items[I].Prod.xProd;
                ncm                := Det.Items[I].Prod.NCM;
                if Emit.CRT = crtSimplesNacional then
                  cst              := CSOSNIcmsToStr(Det.Items[I].Imposto.ICMS.CSOSN)
                else
                  cst              := OrigToStr(Det.Items[I].Imposto.ICMS.orig) + CSTICMSToStr(Det.Items[I].Imposto.ICMS.CST);
                quantidade         := Det.Items[I].Prod.qCom;
                valor_unitario     := Det.Items[I].Prod.vUnCom;
                valor_total        := Det.Items[I].Prod.vProd;
                cean               := Det.Items[I].Prod.cEAN;
              end;

//          if not AvincProd.ValidarVinculos then
//            if Application.MessageBox('Vinculo dos itens da nota fiscal não concluídos. Continuar',
//                                      'Confirmação',
//                                       MB_ICONQUESTION + MB_YESNO) <> IDYES then
//              Exit('ERRO|Vinculo dos itens da nota fiscal não concluídos. Abortado pelo usuário');
        end;

        for I := 0 to Det.Count - 1 do with Det.Items[I] do
        begin
          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into notafiscal_item (' +
            ' cod_nf, cod_empresa, nitem, descricao_item, import_xml, tipo_item, num_fab_prod, cst, perc_red_prod,' +
            ' modbc, base_icm, aliq_icm, valor_icm, aliq_icm_xml, valor_icm_xml, modbcst, mva, perc_red_prod_sub,' +
            ' base_icmsub, aliq_icmsub, valor_icmsub, ncm, cest, codigo_nop, altera_estoque_cfop, altera_custo_cfop,' +
            ' tipv_veiculo, valor_total, unidade_nf, qtdembrec, ean13, referencia, quantidade, valor_unitario,' +
            ' qtdemb, vlrembnf, rateio_desconto, perc_desconto, valor_icm_stdes, camp_entest, indtot,' +
            ' base_ipi, aliq_ipi, valor_ipi, aliq_pis_st, base_pis_st, valor_pis_st, aliq_cofins_st, base_cofins_st,' +
            ' valor_cofins_st, nfci, num_fab_fornecedor, fcp_pfcp, fcp_vfcp, fcp_vbcfcp, fcp_vbcfcpst, fcp_pfcpst,' +
            ' fcp_vfcpst, fcp_pst, fcp_vbcfcpstret, fcp_pfcpstret, fcp_vfcpstret, nfe_indescala,' +
            ' nfe_cnpjfab, nfe_cbenef, ipi_cnpjprod, ipi_cselo, ipi_qselo, cean, predbcefet, vbcefet, picmsefet,' +
            ' vicmsefet, icm_orig, icm_cst, icm_csosn, icm_pred, icm_vbc, icm_picm, icm_vicm, icm_vbcfcp, icm_pfcp, ' +
            ' icm_vfcp, icm_modbcst, icm_pmvast, icm_predbcst, icm_vbcst, icm_picmst, icm_vicmst, icm_vbcfcpst,' +
            ' icm_pfcpst, icm_vfcpst, icm_vicmdeson, icm_vbcstret, icm_pst, icm_vicmssubstituto, icm_vicmsstret,' +
            ' icm_vbcfcpstret, icm_pfcpstret, icm_vfcpstret, rateio_seguro, rateio_outdesp, rateio_frete,' +
            ' qbcmono, adremicms, vicmsmono, qbcmonoreten, adremicmsreten, vicmsmonoreten, qbcmonoret, adremicmsret, vicmsmonoret,' +
            ' vbcufdest, fcp_vbcfcpufdest, pfcpufdest, picmsufdest, picmsinter, picmsinterpart, vfcpufdest, vicmsufdest, vicmsufremet, ' +
            ' dfe_trib_id ' +
            StrUtils.IfThen(Prod.veicProd.chassi.Trim.IsEmpty,
              ', cod_prod, grupo_prod, consumo, ecf, cod_grade', ', chassi') +
            StrUtils.IfThen(Imposto.ICMS.CSOSN <> csosnVazio, ', csosn') +
            ') values (' +
            ' :cod_nf, :cod_empresa, :nitem, :descricao_item, :import_xml, :tipo_item, :num_fab_prod, :cst,' +
            ' :perc_red_prod, :modbc, :base_icm, :aliq_icm, :valor_icm, :aliq_icm_xml, :valor_icm_xml, :modbcst, :mva,' +
            ' :perc_red_prod_sub, :base_icmsub, :aliq_icmsub, :valor_icmsub, :ncm, :cest, :codigo_nop,' +
            ' :altera_estoque_cfop, :altera_custo_cfop, :tipv_veiculo, :valor_total, :unidade_nf, :qtdembrec, :ean13,' +
            ' :referencia, :quantidade, :valor_unitario, :qtdemb, :vlrembnf, :rateio_desconto,' +
            ' :perc_desconto, :valor_icm_stdes, :camp_entest, :indtot, :base_ipi, :aliq_ipi, :valor_ipi, :aliq_pis_st,' +
            ' :base_pis_st, :valor_pis_st, :aliq_cofins_st, :base_cofins_st, :valor_cofins_st,' +
            ' :nfci, :num_fab_fornecedor, :fcp_pfcp, :fcp_vfcp, :fcp_vbcfcp, :fcp_vbcfcpst, :fcp_pfcpst, :fcp_vfcpst,' +
            ' :fcp_pst, :fcp_vbcfcpstret, :fcp_pfcpstret, :fcp_vfcpstret, :nfe_indescala,' +
            ' :nfe_cnpjfab, :nfe_cbenef, :ipi_cnpjprod, :ipi_cselo, :ipi_qselo, :cean, :predbcefet, :vbcefet, :picmsefet,' +
            ' :vicmsefet, :icm_orig, :icm_cst, :icm_csosn, :icm_pred, :icm_vbc, :icm_picm, :icm_vicm, :icm_vbcfcp,' +
            ' :icm_pfcp, :icm_vfcp, :icm_modbcst, :icm_pmvast, :icm_predbcst, :icm_vbcst, :icm_picmst, :icm_vicmst,' +
            ' :icm_vbcfcpst, :icm_pfcpst, :icm_vfcpst, :icm_vicmdeson, :icm_vbcstret, :icm_pst, :icm_vicmssubstituto,' +
            ' :icm_vicmsstret, :icm_vbcfcpstret, :icm_pfcpstret, :icm_vfcpstret, :rateio_seguro, :rateio_outdesp, :rateio_frete,' +
            ' :qbcmono, :adremicms, :vicmsmono, :qbcmonoreten, :adremicmsreten, :vicmsmonoreten, :qbcmonoret, :adremicmsret, :vicmsmonoret,' +
            ' :vbcufdest, :fcp_vbcfcpufdest, :pfcpufdest, :picmsufdest, :picmsinter, :picmsinterpart, :vfcpufdest, :vicmsufdest, :vicmsufremet, ' +
            ' :dfe_trib_id ' +
            StrUtils.IfThen(Prod.veicProd.chassi.Trim.IsEmpty,
              ', :cod_prod, :grupo_prod, :consumo, :ecf, :cod_grade', ', :chassi') +
            StrUtils.IfThen(Imposto.ICMS.CSOSN <> csosnVazio, ', :csosn') +
            ')';

          AExecSql.ParamByName('cod_nf').AsInteger            := ACodNF;
          AExecSql.ParamByName('cod_empresa').AsInteger       := ACodEmpresa;
          AExecSql.ParamByName('nitem').AsInteger             := Prod.nItem;
          AExecSql.ParamByName('descricao_item').AsString     := Prod.xProd.ToUpper.Substring( 0, 75);
          AExecSql.ParamByName('import_xml').AsString         := 'S';
          AExecSql.ParamByName('tipo_item').AsString          := StrUtils.IfThen(Prod.veicProd.chassi.Trim.IsEmpty, 'P', 'V');
          AExecSql.ParamByName('num_fab_fornecedor').AsString := Prod.cProd.Substring(0 , 60);
          AExecSql.ParamByName('ncm').AsString                := Prod.NCM;
          AExecSql.ParamByName('cest').AsString               := Prod.CEST;
          AExecSql.ParamByName('valor_total').Asfloat         := Prod.vProd;
          AExecSql.ParamByName('unidade_nf').AsString         := Prod.uCom.Substring(0, 6).ToUpper();
          AExecSql.ParamByName('qtdembrec').Asfloat           := Prod.qCom;
          AExecSql.ParamByName('ean13').AsString              := Prod.cEAN.Substring( 0, 13);
          AExecSql.ParamByName('num_fab_prod').AsString       := Prod.cEAN.Substring( 0, 14);
          AExecSql.ParamByName('referencia').AsString         := Prod.uCom.Substring(0, 6).ToUpper();
          AExecSql.ParamByName('quantidade').AsFloat          := Prod.qCom;
          AExecSql.ParamByName('valor_unitario').AsFloat      := Prod.vUnCom;
          AExecSql.ParamByName('qtdemb').AsFloat              := 0;
          AExecSql.ParamByName('vlrembnf').AsFloat            := Prod.vUnCom;
          AExecSql.ParamByName('rateio_desconto').Asfloat     := Prod.vDesc;
          if Prod.vProd > 0 then
            AExecSql.ParamByName('perc_desconto').AsFloat     := Math.IfThen(Prod.vDesc > 0, Prod.vDesc / (Prod.vProd / 100))
          else
            AExecSql.ParamByName('perc_desconto').AsFloat     := 0;
          AExecSql.ParamByName('valor_icm_stdes').Asfloat     := Imposto.ICMS.vICMSSTDest;
          AExecSql.ParamByName('camp_entest').AsString        := 'L';
          AExecSql.ParamByName('indtot').AsInteger            := StrToIntDef(indTotToStr(Prod.IndTot), 1);
          AExecSql.ParamByName('rateio_desconto').Asfloat     := Prod.vDesc;
          AExecSql.ParamByName('rateio_seguro').Asfloat       := Prod.vSeg;
          AExecSql.ParamByName('rateio_outdesp').Asfloat      := Prod.vOutro;
          AExecSql.ParamByName('rateio_frete').Asfloat        := Prod.vFrete;
          AExecSql.ParamByName('nfci').AsString               := Prod.nFCI.Trim.Substring( 0, 36);
          AExecSql.ParamByName('codigo_nop').AsFloat          := Prod.CFOP.ToInteger;
          AExecSql.ParamByName('nfe_indescala').AsString      := IndEscalaToStr(Prod.indEscala).Substring(0, 1);
          AExecSql.ParamByName('nfe_cnpjfab').AsString        := Prod.CNPJFab;
          AExecSql.ParamByName('nfe_cbenef').AsString         := Prod.cBenef.Substring(0, 10);
          AExecSql.ParamByName('cean').AsString               := Prod.cEAN.Substring(0, 14);

          if not Prod.veicProd.chassi.Trim.IsEmpty then
            AExecSql.ParamByName('chassi').AsString := Prod.veicProd.chassi;

//          buscas.Close;
//          buscas.SQL.Text := 'select n.cfop_conv, n2.alt_est, n2.calc_custo, n2.tipv_veiculo from nat_op n' +
//            ' left join nat_op n2 on n2.codigo_nop = n.cfop_conv ' +
//            ' where n.codigo_nop = :codigo_nop';
//          buscas.ParamByName('codigo_nop').AsFloat := Prod.CFOP.ToInteger;
//          buscas.Open;
//          AExecSql.ParamByName('codigo_nop').AsFloat := buscas.FieldByName('cfop_conv').AsFloat;
//          AExecSql.ParamByName('altera_estoque_cfop').AsString := buscas.FieldByName('alt_est').AsString;
//          AExecSql.ParamByName('altera_custo_cfop').AsString := buscas.FieldByName('calc_custo').AsString;
//          AExecSql.ParamByName('tipv_veiculo').AsString := buscas.FieldByName('tipv_veiculo').AsString;

          with Imposto.ICMS do
          begin
            if (CSOSN = csosnVazio) then//or ((CST <> cstICMSSN) and (CST <> cstVazio)) then
            begin
              AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + CSTICMSToStr(CST);
              //if CST in [cst00, cst10, cst20, cst70, cst90] then
              begin
                if CST in [cst20, cst70, cst90] then
                  AExecSql.ParamByName('perc_red_prod').Asfloat := pRedBC;
                AExecSql.ParamByName('modbc').AsString := modBCToStr(modBC);
                AExecSql.ParamByName('base_icm').AsFloat := vBC;
                AExecSql.ParamByName('aliq_icm').AsFloat := picms;
                AExecSql.ParamByName('valor_icm').AsFloat := vICMS;
                AExecSql.ParamByName('aliq_icm_xml').AsFloat := picms;
                AExecSql.ParamByName('valor_icm_xml').AsFloat := vICMS;
              end;
              //if CST in [cst10, cst30, cst70, cst90] then
              begin
                //AExecSql.ParamByName('modbcst').AsString := StrUtils.IfThen(pMVAST > 0, modBCSTToStr(modBCST), '0');
                AExecSql.ParamByName('modbcst').AsString := '0';
                AExecSql.ParamByName('mva').Asfloat := pMVAST;
                AExecSql.ParamByName('perc_red_prod_sub').Asfloat := pRedBCST;
                AExecSql.ParamByName('base_icmsub').AsFloat := vBCST;
                AExecSql.ParamByName('aliq_icmsub').Asfloat := pICMSST;
                AExecSql.ParamByName('valor_icmsub').Asfloat := vICMSST;
              end;
            end
            else if CSOSN <> csosnVazio then
            begin
              AExecSql.ParamByName('csosn').AsString := CSOSNIcmsToStr(CSOSN);
              //if CSOSN in [csosn101, csosn201, csosn900] then
              begin
                AExecSql.ParamByName('aliq_icm').AsFloat := pCredSN;
                AExecSql.ParamByName('valor_icm').AsFloat := vCredICMSSN;
                if pCredSN > 0 then
                  AExecSql.ParamByName('base_icm').AsFloat := (vCredICMSSN * 100) / pCredSN
                else
                  AExecSql.ParamByName('base_icm').AsFloat := 0;
              end;
              //if CSOSN in [csosn201, csosn202, csosn203, csosn900] then
              begin
                AExecSql.ParamByName('modbcst').AsString := '0';
                AExecSql.ParamByName('mva').Asfloat := pMVAST;
                AExecSql.ParamByName('perc_red_prod_sub').Asfloat := pRedBCST;
                AExecSql.ParamByName('base_icmsub').AsFloat := vBCST;
                AExecSql.ParamByName('aliq_icmsub').Asfloat := pICMSST;
                AExecSql.ParamByName('valor_icmsub').Asfloat := vICMSST;
              end;
              case CSOSN of
                csosn101, csosn102, csosn300: AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '00';
                csosn103                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '40';
                csosn201, csosn202          : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '10';
                csosn203                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '30';
                csosn400                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '41';
                csosn500                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '60';
                csosn900                    : AExecSql.ParamByName('cst').AsString := OrigToStr(orig) + '90';
              end;
            end;
            AExecSql.ParamByName('fcp_pfcp').AsFloat        := pFCP;
            AExecSql.ParamByName('fcp_vfcp').AsFloat        := vFCP;
            AExecSql.ParamByName('fcp_vbcfcp').AsFloat      := vBCFCP;
            AExecSql.ParamByName('fcp_vbcfcpst').AsFloat    := vBCFCPST;
            AExecSql.ParamByName('fcp_pfcpst').AsFloat      := pFCPST;
            AExecSql.ParamByName('fcp_vfcpst').AsFloat      := vFCPST;
            AExecSql.ParamByName('fcp_pst').AsFloat         := pST;
            AExecSql.ParamByName('fcp_vbcfcpstret').AsFloat := vBCFCPSTRet;
            AExecSql.ParamByName('fcp_pfcpstret').AsFloat   := pFCPSTRet;
            AExecSql.ParamByName('fcp_vfcpstret').AsFloat   := vFCPSTRet;
            AExecSql.ParamByName('predbcefet').AsFloat      := pRedBCEfet;
            AExecSql.ParamByName('vbcefet').AsFloat         := vBCEfet;
            AExecSql.ParamByName('picmsefet').AsFloat       := pICMSEfet;
            AExecSql.ParamByName('vicmsefet').AsFloat       := vICMSEfet;

            AExecSql.ParamByName('icm_orig').AsString           := OrigToStr(orig);
            AExecSql.ParamByName('icm_cst').AsString            := IfThen(CSOSN  = csosnVazio, CSTICMSToStr(CST));
            AExecSql.ParamByName('icm_csosn').AsString          := IfThen(CSOSN <> csosnVazio, CSOSNIcmsToStr(CSOSN));
            AExecSql.ParamByName('icm_pred').AsFloat            := pRedBC;
            AExecSql.ParamByName('icm_vbc').AsFloat             := vBC;
            AExecSql.ParamByName('icm_picm').AsFloat            := IfThen(pICMS > 0, pICMS, pCredSN);
            AExecSql.ParamByName('icm_vicm').AsFloat            := IfThen(vICMS > 0, vICMS, vCredICMSSN);
            AExecSql.ParamByName('icm_vbcfcp').AsFloat          := vBCFCP;
            AExecSql.ParamByName('icm_pfcp').AsFloat            := pFCP;
            AExecSql.ParamByName('icm_vfcp').AsFloat            := vFCP;
            AExecSql.ParamByName('icm_modbcst').AsString        := modBCSTToStr(modBCST);
            AExecSql.ParamByName('icm_pmvast').AsFloat          := pMVAST;
            AExecSql.ParamByName('icm_predbcst').AsFloat        := pRedBCST;
            AExecSql.ParamByName('icm_vbcst').AsFloat           := vBCST;
            AExecSql.ParamByName('icm_picmst').AsFloat          := pICMSST;
            AExecSql.ParamByName('icm_vicmst').AsFloat          := vICMSST;
            AExecSql.ParamByName('icm_vbcfcpst').AsFloat        := vBCFCPST;
            AExecSql.ParamByName('icm_pfcpst').AsFloat          := pFCPST;
            AExecSql.ParamByName('icm_vfcpst').AsFloat          := vFCPST;
            AExecSql.ParamByName('icm_vicmdeson').AsFloat       := vICMSDeson;
            AExecSql.ParamByName('icm_vbcstret').AsFloat        := vBCSTRet;
            AExecSql.ParamByName('icm_pst').AsFloat             := pST;
            AExecSql.ParamByName('icm_vicmssubstituto').AsFloat := vICMSSubstituto;
            AExecSql.ParamByName('icm_vicmsstret').AsFloat      := vICMSSTRet;
            AExecSql.ParamByName('icm_vbcfcpstret').AsFloat     := vBCFCPSTRet;
            AExecSql.ParamByName('icm_pfcpstret').AsFloat       := pFCPSTRet;
            AExecSql.ParamByName('icm_vfcpstret').AsFloat       := vFCPSTRet;
            AExecSql.ParamByName('qbcmono').Asfloat             := qBCMono;
            AExecSql.ParamByName('adremicms').Asfloat           := adRemICMS;
            AExecSql.ParamByName('vicmsmono').Asfloat           := vICMSMono;
            AExecSql.ParamByName('qbcmonoreten').Asfloat        := qBCMonoReten;
            AExecSql.ParamByName('adremicmsreten').Asfloat      := adRemICMSReten;
            AExecSql.ParamByName('vicmsmonoreten').Asfloat      := vicmsmonoreten;
            AExecSql.ParamByName('qbcmonoret').Asfloat          := qbcmonoret;
            AExecSql.ParamByName('adremicmsret').Asfloat        := adremicmsret;
            AExecSql.ParamByName('vicmsmonoret').Asfloat        := vicmsmonoret;
          end;

          with Imposto.ICMSUFDest do
          begin
            AExecSql.ParamByName('vbcufdest').Asfloat           := vBCUFDest;
            AExecSql.ParamByName('fcp_vbcfcpufdest').Asfloat    := vBCFCPUFDest;
            AExecSql.ParamByName('pfcpufdest').Asfloat          := pFCPUFDest;
            AExecSql.ParamByName('picmsufdest').Asfloat         := pICMSUFDest;
            AExecSql.ParamByName('picmsinter').Asfloat          := pICMSInter;
            AExecSql.ParamByName('picmsinterpart').Asfloat      := pICMSInterPart;
            AExecSql.ParamByName('vfcpufdest').Asfloat          := vFCPUFDest;
            AExecSql.ParamByName('vicmsufdest').Asfloat         := vICMSUFDest;
            AExecSql.ParamByName('vicmsufremet').Asfloat        := vICMSUFRemet;
          end;

          AExecSql.ParamByName('valor_ipi').AsFloat := 0;
          AExecSql.ParamByName('base_ipi').AsFloat  := 0;
          AExecSql.ParamByName('aliq_ipi').AsFloat  := 0;
          with Imposto.IPI do
          begin
            AExecSql.ParamByName('ipi_cnpjprod').AsString := CNPJProd.Substring(0, 14);
            AExecSql.ParamByName('ipi_cselo').AsString    := cSelo.Substring(0, 60);
            AExecSql.ParamByName('ipi_qselo').AsInteger   := qSelo;
            AExecSql.ParamByName('valor_ipi').AsFloat     := vIPI;
            if vBC > 0 then
              AExecSql.ParamByName('base_ipi').AsFloat := vBC
            else if pIPI > 0 then
              AExecSql.ParamByName('base_ipi').AsFloat := RoundTo( (vIPI * 100) / pIPI, -2)
            else if vIPI > 0 then
              AExecSql.ParamByName('base_ipi').AsFloat := Prod.vProd - Prod.vDesc;

            if pIPI > 0 then
              AExecSql.ParamByName('aliq_ipi').AsFloat := pIPI
            else if vBC > 0 then
              AExecSql.ParamByName('aliq_ipi').AsFloat := RoundTo( (vIPI / vBC) * 100, -2);
          end;

          with Imposto.PISST do
          begin
            AExecSql.ParamByName('aliq_pis_st').AsFloat := pPis;
            AExecSql.ParamByName('base_pis_st').AsFloat := vBc;
            AExecSql.ParamByName('valor_pis_st').AsFloat := vPIS;
          end;
          with Imposto.COFINSST do
          begin
            AExecSql.ParamByName('aliq_cofins_st').AsFloat := pCOFINS;
            AExecSql.ParamByName('base_cofins_st').AsFloat := vBC;
            AExecSql.ParamByName('valor_cofins_st').AsFloat := vCOFINS;
          end;

          tribDFe := TributosDFeFactory.GetTributoDFe( TributoDFeOrigemEnum.tdfoNotaFiscal, Imposto );
          try

            if tribDFe <> nil then
            begin
              AExecSql.ParamByName('dfe_trib_id').AsString := tribDFe.Id;

              tributoHandler.SetItem( tribDFe, tdfoNotaFiscal );
            end
            else
              AExecSql.ParamByName('dfe_trib_id').Clear();

          finally
            tribDFe.Free();
          end;

          AExecSql.ExecSQL;

        end;
        {$ENDREGION}

        {$REGION 'Importando itens / veiculo'}
        for I := 0 to Det.Count - 1 do with Det.Items[I].Prod do if not veicProd.chassi.Trim.IsEmpty  then

        begin
          AExecSql.Close;
          AExecSql.SQL.Text := 'insert into notafiscal_item_veiculo (' +
            ' cod_nf, cod_empresa, nitem, chassi, tipo_venda, tprest, cor, ano_fab, ano_mod, motor, versao,' +
            ' cod_cor' +
//            ' versao, DESCRICAO_VERSAO, CILINDROS, CILINDRADA, LOTACAO, RENAVAM, PRECO_TAB, NSERIE,' +
//            ' TIP_PINTURA, COMBUSTIVEL, TPCOMB, Tipo, MARCA, COD_COMBUSTIVEL, COD_MARCA, COD_TIPO_ESP
            ') values (' +
            ' :cod_nf, :cod_empresa, :nitem, :chassi, :tipo_venda, :tprest, :cor, :ano_fab, :ano_mod, :motor, :versao,' +
            ' :cod_cor' +
            ')';

          AVeicVersao := 0;
          if CFOP = '5409' then
          begin
            buscas.Close;
            buscas.SQL.Text := 'select VERSAO from NOTAFISCAL_ITEM_VEICULO' +
              ' where CHASSI = ' + veicProd.chassi.QuotedString +
              ' order by cod_nf desc';
            buscas.Open;
            AVeicVersao := buscas.FieldByName('versao').AsInteger;

            buscas.Close;
            buscas.SQL.Text := 'select codigo from tipmodelo' +
              ' where codigo = ' + AVeicVersao.ToString +
              ' and cod_empresa = ' + ACodEmpresa.ToString +
              ' and vndestoque = ''S'' and ativo = 1';
            buscas.open;
            AVeicVersao := buscas.FieldByName('codigo').AsInteger;
          end
          else
          begin
            buscas.Close;
            buscas.SQL.Text := 'select codigo from tipmodelo' +
              ' where codigofab like ''%' + cProd + '%''' +
              ' and cod_empresa = ' + ACodEmpresa.ToString +
              ' and vndestoque = ''S'' and ativo = 1';
            buscas.open;
            AVeicVersao := buscas.FieldByName('codigo').AsInteger;

            if buscas.IsEmpty then
            begin
              buscas.Close;
              buscas.SQL.text := 'select tm.* from tipmodelo_codigofab t' +
                ' inner join tipmodelo tm on tm.codigo = t.codigo and tm.cod_empresa = t.cod_empresa' +
                ' where t.codigo_fab = ' +cProd.QuotedString +
                ' and t.cod_empresa = ' + ACodEmpresa.ToString +
                ' and tm.ativo = 1  and tm.vndestoque = ''S'' ';
              buscas.open;
              AVeicVersao := buscas.FieldByName('codigo').AsInteger;
            end;
          end;

          AExecSql.ParamByName('cod_nf').AsInteger      := ACodNF;
          AExecSql.ParamByName('cod_empresa').AsInteger := ACodEmpresa;
          AExecSql.ParamByName('nitem').AsInteger       := nItem;
          AExecSql.ParamByName('versao').AsInteger      := AVeicVersao;
          with veicProd do
          begin
            AExecSql.ParamByName('chassi').AsString     := chassi.Substring( 0, 17);
            AExecSql.ParamByName('tipo_venda').AsString := 'N';
            AExecSql.ParamByName('tprest').AsString     := '0';
            AExecSql.ParamByName('cor').AsString        := xCor.Substring( 0, 30);
            AExecSql.ParamByName('ano_fab').AsInteger   := anoFab;
            AExecSql.ParamByName('ano_mod').AsInteger   := anoMod;
            AExecSql.ParamByName('motor').AsString      := nMotor.Substring( 0, 21);
            AExecSql.ParamByName('cod_cor').AsString  := IfThen(AUsarCorFabDenatran, cCorDENATRAN, cCor);
          end;
          AExecSql.ExecSQL;
        end;
        {$ENDREGION}
      end;

      if AExecSql.Transaction.InTransaction then
        AExecSql.Transaction.Commit;

      Result := 'OK';

    except on E: Exception do
      begin
        Result := 'ERRO|' + E.Message;
      end;
    end;
  finally
    if AExecSql.Transaction.InTransaction then
      AExecSql.Transaction.Rollback;
    DesconectaBanco;
    if Assigned(AvincProd) then
      FreeAndNil(AvincProd);
    FreeAndNil(ANFe);
    FreeAndNil(AExecSql);
    FreeAndNil(AList);
  end;
end;

function TClassNfVenda.GetTransporta(AValue: TObject;
  ACodTransporta: Integer): TObject;
var
  ATransporta: TTransporta;
  AOk: Boolean;
  ABuscas: TIBQuery;
begin
  ATransporta := TTransporta(AValue);
  Result := AValue;

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.sql.text := 'select tr.cnpj_tr, tr.nome_tr, tr.ie_tr, tr.end_tr,' +
      ' tr.municipio_tr, es.sigla_uf from TRANSPORTADOR tr' +
     ' left join estados es on es.codigo_uf = tr.uf_tr' +
     ' where tr.codigo_tr = ' + IntToStr(ACodTransporta) +
     ' and tr.cod_empresa = ' + IntToStr(cadempresa.codempresa);
    ABuscas.Open;
    if not ABuscas.IsEmpty then
        with ATransporta do
        begin
          CNPJCPF := Trim(ABuscas.FieldByName('cnpj_tr').AsString);
          xNome   := Trim(ABuscas.FieldByName('nome_tr').AsString);
          IE      := Trim(ABuscas.FieldByName('ie_tr').AsString);
          if Trim(IE) = 'ISENTO' then
            IE := '';
          xEnder  := Trim(ABuscas.FieldByName('end_tr').AsString);
          xMun    := Trim(ABuscas.FieldByName('municipio_tr').AsString);
          UF      := Trim(ABuscas.FieldByName('sigla_uf').AsString);
        end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetveicProd(AValue: TObject; ACodNF,
  ANItem: Integer; var AinfAdProdVeic, AxProd: string): TObject;
var
  AveicProd: TveicProd;
  AOk: Boolean;
  ABuscas: TIBQuery;
  ACondVeiculo, Apot: string;
begin
  AveicProd := TveicProd(AValue);
  Result := AValue;

  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.sql.text := 'select first 1 ni.*, cf.codcordenatram,' +
      ' m.cmkg, m.distanciaeixo, m.tip_veiculo, m.esprenavam, m.pesol, m.pesob, m.tpcomb, m.lotacao, m.tpcomb as tpcomb_m' +
      ' from NOTAFISCAL_ITEM_VEICULO ni' +
      ' left join CODIGO_CORFAB cf on ni.cod_cor = cf.cod_cor' +
      ' left join TIPMODELO m on m.codigo = ni.versao and m.cod_empresa = ni.cod_empresa' +
      ' where ni.cod_nf = ' + IntToStr(ACodNF) +
      ' and ni.nitem = ' + IntToStr(ANItem) +
      ' and ni.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' order by ni.nitem';
    ABuscas.Open;

    if not ABuscas.IsEmpty then
    begin
      AxProd :=
        ABuscas.FieldByName('tipo').AsString + ': ' +
        ABuscas.FieldByName('marca').AsString + ' MODELO: ' +
        ABuscas.FieldByName('descricao_versao').AsString;

      if Trim(ABuscas.FieldByName('tipo_venda').AsString) = 'U' then
        ACondVeiculo := 'SEMINOVA'
      else
        ACondVeiculo := 'NOVA';

      Apot := FloatToStr(ABuscas.FieldByName('hp').AsFloat);
      if Length(Apot) > 4 then
      begin
        Apot := Copy(Apot, 1, 4);
        Apot := FloatToStr(StrToFloat(Apot));
      end;

      AinfAdProdVeic :=
        'CHASSI: '          + Trim(ABuscas.FieldByName('chassi').AsString) +
        ';LOTACAO: '        + Trim(ABuscas.FieldByName('lotacao').AsString) + ' PASS.' +
        '; ANO FABRICACAO: '+ ABuscas.FieldByName('ano_fab').AsString +
        ', ANO MODELO: '    + ABuscas.FieldByName('ano_mod').AsString +
        '; CILINDROS: '     + ABuscas.FieldByName('cilindros').AsString +
        ' CONDIÇÃO: '       + ACondVeiculo +
        ', COR: '           + ABuscas.FieldByName('cor').AsString +
        '; CILINDRADAS: '   + StrZero(ABuscas.FieldByName('cilindrada').AsInteger, 4) +
        ', HP: '            + Apot +
        '; COMBUSTÍVEL: '   + ABuscas.FieldByName('combustivel').AsString +
        '; PLACA VEICULO: ' + ABuscas.FieldByName('placa').AsString +
        '; MOTOR: '         + ABuscas.FieldByName('motor').AsString +
        '; RENAVAM: '       + ABuscas.FieldByName('renavam').AsString;

      if Trim(ABuscas.FieldByName('tipo_venda').AsString) = 'N' then
        with AveicProd do
        begin
          tpOP         := toVendaConcessionaria;
          chassi       := Trim(ABuscas.FieldByName('chassi').AsString);
          cCor         := Trim(ABuscas.FieldByName('cod_cor').AsString);
          xCor         := Trim(ABuscas.FieldByName('cor').AsString);
          pot          := Apot;
          Cilin        := StrZero(ABuscas.FieldByName('cilindrada').AsInteger, 4);
          pesoL        := Trim(ABuscas.FieldByName('pesol').AsString);
          pesoB        := Trim(ABuscas.FieldByName('pesob').AsString);
          nSerie       := Trim(ABuscas.FieldByName('nserie').AsString);
          tpComb       := Trim(ABuscas.FieldByName('tpcomb').AsString);
          if tpComb = '' then
            tpComb     := Trim(ABuscas.FieldByName('tpcomb_m').AsString);
          nMotor       := Trim(ABuscas.FieldByName('motor').AsString);
          CMT          := Trim(ABuscas.FieldByName('cmkg').AsString);
          dist         := Trim(ABuscas.FieldByName('distanciaeixo').AsString);
          anoMod       := ABuscas.FieldByName('ano_mod').AsInteger;
          anoFab       := ABuscas.FieldByName('ano_fab').AsInteger;
          tpPint       := Trim(ABuscas.FieldByName('tip_pintura').AsString);
          tpVeic       := ABuscas.FieldByName('tip_veiculo').AsInteger;
          espVeic      := ABuscas.FieldByName('esprenavam').AsInteger;
          VIN          := 'N';
          condVeic     := StrTocondVeic(AOk, '1');
          cMod         := Trim(ABuscas.FieldByName('renavam').AsString);
          cCorDENATRAN := Trim(ABuscas.FieldByName('codcordenatram').AsString);
          lota         := StrToIntDef(Trim(ABuscas.FieldByName('lotacao').AsString), 0);
          tpRest       := ABuscas.FieldByName('tprest').AsInteger;
        end;
    end;
  finally
    FreeAndNil(ABuscas);
  end;
end;

function TClassNfVenda.GetVersaoProc: string;
var
  vVer, vVer2: string;
  I: Integer;
  ABuscas: TIBQuery;
begin
  ABuscas := nil;
  CopiarQuery(buscaadc, ABuscas);
  try
    ABuscas.Close;
    ABuscas.SQL.Text := 'select VERSAO_INST from CONFIG_HWUPDATE' +
      ' where COD_HWUPDATE = 1';
    ABuscas.Open;

    vVer := StringReplace(ABuscas.FieldByName('versao_inst').AsString, '_', '',[rfReplaceAll]);
    while Copy(vVer, 1, 1) = '0' do
      System.Delete(vVer, 1, 1);
    vVer2 := '';
    while Length(Trim(vVer)) > 0   do
    begin
      vVer2 := vVer2 + Copy(vVer, 1, 1) + '.';
      vVer := Copy(vVer, 2, Length(Trim(vVer)));
    end;
    Result := Copy(vVer2,1, Length(Trim(vVer2)) - 1 );
  finally
    FreeAndNil(ABuscas);
  end;
end;

//function TClassNfVenda.GravaRetNFE(vAcbrNFE: TACBrNFe;vtipo: smallint): boolean;
//begin
//end;

function TClassNfVenda.inutilizaNFe(vnumnfini: integer;vnumnffin: integer;codempresa: integer;nsubserie: string): boolean;
begin
 montaSelect('SELECT * FROM NOTAFISCAL WHERE NUM_NF >= '+inttostr(vnumnfini)+
 ' AND NUM_NF <= '+inttostr(vnumnffin)+' AND COD_EMPRESA = '+inttostr(codempresa)+' AND SERIE = '''+nsubserie+''' AND ((NATUREZA_NF = ''S'') OR ((EMISSAO_PROPRIA = ''S'') AND (NUM_GERADO = ''S'')))');
 try
  IniciaTransacao;
  while not dataSet.eof do
  begin
   dataSet.edit;
   dataSet.fieldbyname('SITUACAO_NFE').AsString:='Inutilizada';
   dataSet.Post;
   Apply;
   dataSet.next;
  end;
  CommitaTransacao;
 except
  on e: exception do
  begin
   RollBackTransacao;
   if application.messagebox('Erro ao gravar Situação Inutilizada das NF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
  end;
 end;
end;

function TClassNfVenda.limpadadosnfe: boolean;
begin
end;

function TClassNfVenda.marcaSel: boolean;
begin
  Edit;
  if dataSet.fieldbyname('SEL_NFE').Value = 1 then
   dataSet.fieldbyname('SEL_NFE').Value:=0
  else
   dataSet.fieldbyname('SEL_NFE').Value:=1;
  Post;
end;

function TClassNfVenda.mudarNFSCANouSVC(pTipo:string): boolean;
var
  fExec: TIBQuery;
  vCodNF, vNumNF: Integer;
  vSerieNF: string;

  procedure montaSQL(pTabela: string);
  var
    I: Integer;
    vSqlInsert, vSqlValues: string;
  begin
    for I := 0 to buscas.FieldCount - 1 do
    begin
      vSqlInsert := vSqlInsert + ', ' + buscas.Fields[i].FieldName;
      vSqlValues := vSqlValues + ', :' + buscas.Fields[i].FieldName;
    end;
    vSqlInsert := Copy(vSqlInsert, 3, Length(vSqlInsert));
    vSqlValues := Copy(vSqlValues, 3, Length(vSqlValues));

    fExec.SQL.Text := 'insert into ' + pTabela + ' (' + vSqlInsert + ') values (' + vSqlValues + ')';

  end;

  procedure atribuiParametros(pTabela: string = '');
  var
    I: Integer;
  begin
    for I := 0 to buscas.FieldCount - 1 do
      fExec.ParamByName(buscas.Fields[i].FieldName).Value :=
        buscas.FieldByName(buscas.Fields[i].FieldName).Value;

    if buscas.FindField('COD_NF') <> nil then
      fExec.ParamByName('COD_NF').AsInteger := vCodNF;

    if pTabela = 'NOTAFISCAL' then
    begin
      fExec.ParamByName('NUM_NF').AsInteger := vNumNF;
      fExec.ParamByName('SERIE').AsString := vSerieNF;
      fExec.ParamByName('TIPONFE').AsString := '';
      fExec.ParamByName('SEL_NFE').AsString := '0';
      fExec.ParamByName('SITUACAO_NFE').AsString := 'A Inutilizar';
    end
    else if pTabela = 'NOTAFISCAL_ITEM' then
    begin
      fExec.ParamByName('NPED').Value := Null;
      fExec.ParamByName('TIPO_PED').Value := Null;
      fExec.ParamByName('NITEM_PED').Value := Null;
    end

  end;

  procedure gerarNovaNF;
  var
    vLista: TStringList;
    J: Integer;
  begin
    try
      fExec := TIBQuery.Create(Application);
      fExec.Database := buscas.Database;
      fExec.Transaction := buscas.Transaction;
      vLista := TStringList.Create;
      vLista.Clear;
      vLista.Add('NOTAFISCAL');
      vLista.Add('NOTAFISCAL_ITEM');
      vLista.Add('NOTAFISCAL_ITEM_VEICULO');
      vLista.Add('NOTAFISCAL_ITEM_ECF');
      vLista.Add('NOTAFISCAL_CARTA_CORRECAO');
      vLista.Add('NOTAFISCAL_ITEM_DI');
      vLista.Add('NOTAFISCAL_ITEM_ADI');
      vLista.Add('NOTAFISCAL_ITEM_VFE');
      vLista.Add('NOTAFISCAL_SPED_C110');
      vLista.Add('NOTAFISCAL_SPED_C111');
      vLista.Add('NOTAFISCAL_SPED_C112');
      vLista.Add('NOTAFISCAL_SPED_C113');
      vLista.Add('NOTAFISCAL_SPED_C114');
      vLista.Add('NOTAFISCAL_SPED_C115');
      vLista.Add('NOTAFISCAL_SPED_C120');
      vLista.Add('NOTAFISCAL_SPED_C195_C197');

      vCodNF := Gencodigo('NOTAFISCAL', DtmNFEHW.SpIncCodigo, dataSet.FieldByName('COD_EMPRESA').AsString);

      for J := 0 to vLista.Count - 1 do
      begin
        buscas.Close;
        buscas.SQL.Text := 'select * from ' + vLista[J] +
          ' where cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
          ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
        buscas.open;

        buscas.First;
        while not buscas.Eof do
        begin

          fExec.Close;
          montaSQL(vLista[J]);
          atribuiParametros(vLista[J]);
          fExec.ExecSQL;

          buscas.Next;
        end;
      end;
      buscas.Close;
    finally
      fExec.Free;
      fExec := nil;
    end;
  end;
begin
  try
    Result := True;
    IniciaTransacao;
    dataSet.Edit;
    vNumNF := dataset.FieldByName('NUM_NF').AsInteger;
    vSerieNF := dataset.FieldByName('SERIE').AsString;
    dataset.FieldByName('NUM_NF_VNDANT').Value:=dataset.FieldByName('NUM_NF').asinteger;
    dataset.FieldByName('SUB_SERIEANT').asinteger:=dataset.FieldByName('SERIE').asinteger;
    if pTipo = 'SCAN' then
    begin
      dataset.FieldByName('NUM_NF').asinteger:=Gencodigo('NF_VENDASCAN', DtmNFEHW.SpIncCodigo,dataSet.FieldByName('COD_EMPRESA').AsString);
      dataSet.FieldByName('SERIE').AsInteger:=cadempresa.vSERIE_SCAN;
      dataSet.FieldByName('TIPONFE').AsString:='SCAN';
    end
    else
    begin
      dataset.FieldByName('NUM_NF').asinteger:=Gencodigo('NF_VENDA', DtmNFEHW.SpIncCodigo,dataSet.FieldByName('COD_EMPRESA').AsString);
      dataSet.FieldByName('SERIE').AsString:=cadempresa.VSUB_SERIE;
      dataSet.FieldByName('TIPONFE').AsString:='SVC';
    end;
    dataSet.Post;
    if not Apply then
      raise Exception.Create('Erro ao mudar NF para ' + pTipo);
    gerarNovaNF;
    // Mudança de boleta para o SCAN ou SVC
     buscas.Close;
     buscas.SQL.text:='UPDATE BOLETAS SET NUM_NF_VND = '+
     dataset.FieldByName('NUM_NF').AsString+',SUB_SERIE = '+
     dataset.FieldByName('SERIE').AsString+' WHERE NUM_NF_VND = '+
     dataset.FieldByName('NUM_NF_VNDANT').AsString+' AND SUB_SERIE = ' +
     dataset.FieldByName('SUB_SERIEANT').AsString+
     ' AND COD_EMPRESA = '+dataSet.FieldByName('COD_EMPRESA').AsString;
     buscas.ExecSQL;
     buscas.Close;
     
    // Mudança de Numero de Nota para Pre-Nota
     buscas.Close;
     buscas.SQL.text:='UPDATE notafiscal SET NUM_NF = ' + dataset.FieldByName('NUM_NF').AsString+
     ', SERIE = ' + dataset.FieldByName('SERIE').AsString +
     ' WHERE COD_NF_TRANSF = ' + IntToStr(dataset.FieldByName('COD_NF').AsInteger)+
     ' AND COD_EMP_TRANSF = '+IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger);
     buscas.ExecSQL;
     buscas.Close;
     //
    // COM_FAT
    if vtemveic = 'S' then
    begin
     if dataset.FieldByName('NATUREZA_NF').AsString <> 'E' then
     begin
       buscas.Close;
       buscas.SQL.text:='UPDATE COM_FAT SET NUM_NOTA_V = '+
       dataset.FieldByName('NUM_NF').AsString+',SUB_SERIE = '+
       dataset.FieldByName('SERIE').AsString+',SERIE = '+dataset.FieldByName('SERIE').AsString+' WHERE N_COMANDO = '+
       dataSet.FieldByName('N_COMANDO').AsString+' AND ' +
       ' COD_EMPRESA = '+dataSet.FieldByName('COD_EMPRESA').AsString;
       buscas.ExecSQL;
       buscas.Close;
       buscas.SQL.text:='UPDATE MOT_VEN SET NUM_NOTA_V = '+
       dataset.FieldByName('NUM_NF').AsString+',SUB_SERIE = '+
       dataset.FieldByName('SERIE').AsString+',SERIE = '+dataset.FieldByName('SERIE').AsString+' WHERE N_COMANDO = '+
       dataSet.FieldByName('N_COMANDO').AsString+' AND ' +
       ' COD_EMPRESA = '+dataSet.FieldByName('COD_EMPRESA').AsString;
       buscas.ExecSQL;
     end;
    end
    else
    begin
     buscaadc.close;
     buscaadc.SQL.Text:='SELECT * FROM NOTAFISCAL_ITEM WHERE COD_NF = '+dataSet.FieldByName('COD_NF').AsString+' AND COD_EMPRESA = '+
     dataSet.FieldByName('COD_EMPRESA').AsString + ' order by nitem';
     buscaadc.open;
     while not buscaadc.eof do
     begin
      if (buscaadc.FieldByName('nped').AsInteger > 0) and
        (buscaadc.FieldByName('tipo_ped').AsString <> '') and
        (buscaadc.FieldByName('nitem_ped').AsInteger > 0) then
      begin
        ExecutaComandosSqlExec(
          'update pedvenda set num_nf = ' + dataSet.FieldByName('num_nf').AsString +
          ', serie_nf = ' + QuotedStr(dataSet.FieldByName('serie').AsString) +
          ', data_nf = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',
          dataSet.FieldByName('DATA_LANC').AsDateTime)) +
          ', valor_nf = ' + trocaVirgulaPorPonto(Format('%0.2f',
          [dataSet.FieldByName('valor_total').AsFloat])) +
          ' where nped = ' + buscaadc.FieldByName('nped').AsString +
          ' and tipo = ' + QuotedStr(Trim(buscaadc.FieldByName('tipo_ped').AsString)) +
          ' and cod_empresa = ' + dataSet.FieldByName('COD_EMPRESA').asstring+
          ' and ((not seq_fech is null) or (tipo = ''REQ'') )');
          // and (num_nf is null or num_nf = 0)');
        if Trim(buscaadc.FieldByName('tipo_ped').AsString) = 'OS' then
          ExecutaComandosSqlExec(
            'update ordem_serv set num_nf = ' + dataSet.FieldByName('num_nf').AsString +
            ', serie_nf = ' + QuotedStr(dataSet.FieldByName('serie').AsString) +
            ', data_nf = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',
            dataSet.FieldByName('DATA_LANC').AsDateTime)) +
            ', valor_nf = ' + trocaVirgulaPorPonto(Format('%0.2f',
            [dataSet.FieldByName('valor_total').AsFloat])) +
            ' where n_os = ' +buscaadc.FieldByName('nped').AsString +
            ' and cod_empresa = ' + dataSet.FieldByName('COD_EMPRESA').asstring)
//            ' and (not seq_fech is null) and (num_nf is null or num_nf = 0)') // and data_nf is null' +
          //' and (valor_nf is null or valor_nf = 0)')
        else if Trim(buscaadc.FieldByName('tipo_ped').AsString) = 'REQ' then
          ExecutaComandosSqlExec(
            'update reqvenda set num_nf = ' + dataSet.FieldByName('num_nf').AsString +
            ', serie_nf = ' + QuotedStr(dataSet.FieldByName('serie').AsString) +
            ', data_nf = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',
            dataSet.FieldByName('DATA_LANC').AsDateTime)) +
            ', valor_nf = ' +trocaVirgulaPorPonto(Format('%0.2f',
            [dataSet.FieldByName('valor_total').AsFloat])) +
            ' where nreq = ' + buscaadc.FieldByName('nped').AsString +
            ' and cod_empresa = ' +dataSet.FieldByName('COD_EMPRESA').AsString);
//            ' and (num_nf is null or num_nf = 0)'); // and data_nf is null' +
        //' and (valor_nf is null or valor_nf = 0)')
        if buscaadc.FieldByName('tipo_item').AsString = 'P' then
        begin
          ExecutaComandosSqlExec(
            'update pedvenda_prod pvp' +
            ' set pvp.n_nf = ' + dataSet.FieldByName('num_nf').AsString +
            ', pvp.Serie = ' + QuotedStr(dataSet.FieldByName('serie').AsString) +
            ' where pvp.nped = ' + buscaadc.FieldByName('nped').AsString +
            ' and pvp.tipo = ' + QuotedStr(buscaadc.FieldByName('tipo_ped').AsString) +
            ' and pvp.grupo_prod = ' + buscaadc.FieldByName('grupo_prod').AsString +
            ' and pvp.cod_prod = ' + QuotedStr(buscaadc.FieldByName('cod_prod').AsString) +
            ' and pvp.nitem = ' +buscaadc.FieldByName('nitem_ped').AsString +
            ' and pvp.cod_empresa = ' + dataSet.FieldByName('COD_EMPRESA').AsString);
//            ' and pvp.n_nf is null');
          if Trim(buscaadc.FieldByName('tipo_ped').AsString) = 'REQ' then
            ExecutaComandosSqlExec(
              'update reqvenda_itens pvp' +
              ' set pvp.n_nf = ' + dataSet.FieldByName('num_nf').AsString +
              ', pvp.Serie = ' + QuotedStr(dataSet.FieldByName('serie').AsString) +
              ' where pvp.nreq = ' + buscaadc.FieldByName('nped').AsString +
              ' and pvp.grupo_prod = ' +buscaadc.FieldByName('grupo_prod').AsString +
              ' and pvp.cod_prod = ' + QuotedStr(buscaadc.FieldByName('cod_prod').AsString) +
              ' and pvp.cod_empresa = ' + dataSet.FieldByName('COD_EMPRESA').AsString)
//              ' and pvp.n_nf is null')
          else if Trim(buscaadc.FieldByName('tipo_ped').AsString) = 'OS' then
            ExecutaComandosSqlExec(
              'update os_item_prod pvp' +
              ' set pvp.n_nf = ' + dataSet.FieldByName('num_nf').AsString +
              ', pvp.Serie = ' + QuotedStr(dataSet.FieldByName('serie').AsString) +
              ' where pvp.n_os = ' + buscaadc.FieldByName('nped').AsString +
              ' and pvp.grupo_prod = ' +buscaadc.FieldByName('grupo_prod').AsString +
              ' and pvp.cod_prod = ' + QuotedStr(buscaadc.FieldByName('cod_prod').AsString) +
              ' and pvp.cod_empresa = ' + dataset.FieldByName('COD_EMPRESA').AsString);
//              ' and pvp.n_nf is null');
        end
        else if buscaadc.FieldByName('tipo_item').AsString = 'S' then
        begin
          ExecutaComandosSqlExec(
            'update pedvenda_serv pvs' +
            ' set pvs.n_nf = ' + dataSet.FieldByName('num_nf').AsString +
            ', pvs.serie = ' + QuotedStr(dataSet.FieldByName('serie').AsString) +
            ' where pvs.nped = ' + buscaadc.FieldByName('nped').AsString +
            ' and pvs.tipo = ' + QuotedStr(buscaadc.FieldByName('tipo_ped').AsString) +
            ' and pvs.cod_servico = ' + buscaadc.FieldByName('cod_servico').AsString +
            ' and pvs.nitem = ' + buscaadc.FieldByName('nitem_ped').AsString +
            ' and pvs.cod_empresa = ' + dataSet.FieldByName('COD_EMPRESA').AsString);
//            ' and coalesce(pvs.status,'''') <> ''CANCELADO''');
//            ' and pvs.n_nf is null');
          ExecutaComandosSqlExec(
            'update os_item_serv pvs' +
            ' set pvs.n_nf = ' + dataSet.FieldByName('num_nf').AsString +
            ', pvs.serie = ' + QuotedStr(dataSet.FieldByName('serie').AsString) +
            ' where pvs.n_os = ' + buscaadc.FieldByName('nped').AsString +
            ' and pvs.cod_servico = ' + buscaadc.FieldByName('cod_servico').AsString +
            ' and pvs.cod_empresa = ' + dataSet.FieldByName('COD_EMPRESA').AsString);
//            ' and pvs.n_nf is null');
        end;
        ExecutaComandosSqlExec('update formpagamento fp set' +
          ' fp.num_nota = ' + dataSet.FieldByName('num_nf').AsString +
          ', fp.sub_serie = ' + Trim(dataSet.FieldByName('serie').AsString) +
          ' where  (((fp.nrequisicao = ' + buscaadc.FieldByName('nped').AsString +
          ') and fp.tpdocs = ' + QuotedStr(Trim(buscaadc.FieldByName('tipo_ped').AsString)) +
          ') or ((fp.rec_numvend = ' +buscaadc.FieldByName('nped').AsString +
          ' and fp.tpdocs <> ''LCS'' and fp.rec_tipvend = ' +
          QuotedStr(Trim(buscaadc.FieldByName('tipo_ped').AsString)) +
          '))) and fp.cod_empresa = ' + dataset.FieldByName('COD_EMPRESA').AsString + ' and fp.ativo = 1');

          if dataSet.FieldByName('NUM_NF_VNDANT').AsString <> '' then
          begin
           ExecutaComandosSqlExec('update formpagamento fp set' +
           ' fp.nrequisicao = ' + dataSet.FieldByName('num_nf').AsString +
 //          ', fp.sub_serie = ' + Trim(dataSet.FieldByName('serie').AsString) +
           ' where  fp.nrequisicao = ' + dataSet.FieldByName('NUM_NF_VNDANT').AsString +
           ' and fp.tpdocs = ''NF''  and fp.cod_empresa = ' +
           dataset.FieldByName('COD_EMPRESA').AsString + ' and fp.ativo = 1');
          end;

      end;
       buscaadc.next;
     end;
    end;
    CommitaTransacao;
  except
    on e: exception do
  begin
      Result := False;
      RollBackTransacao;
      if Application.MessageBox(PWideChar('Erro tentar mudar para ' + pTipo+ ' a NF. Mostrar Erro?'), 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
    end;
  end;
end;

function TClassNfVenda.obtemdadostotaisnf: boolean;
var
  vListaRefNFE: TStringList;
  I: Integer;
begin
 vbasicm:=FPontoFlutuante(dataSet.FieldByName('BASE_ICM').AsCurrency,2);
 vvalicm:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICM').AsCurrency,2);
 vvalnota:=FPontoFlutuante(dataSet.FieldByName('VALOR_TOTAL').AsCurrency,2);
 vvalprod:=FPontoFlutuante(dataSet.FieldByName('VALOR_PROD').AsCurrency+dataSet.FieldByName('VALOR_SERV').AsCurrency,2);
 vBCST:=FPontoFlutuante(dataSet.FieldByName('BASE_ICMSUB').AsCurrency,2);
 vST:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICMSUB').AsCurrency,2);
 vFrete:=FPontoFlutuante(dataSet.FieldByName('VALOR_FRETE').AsCurrency,2);
 vSeg:=FPontoFlutuante(dataSet.FieldByName('VALOR_SEGURO').AsCurrency,2);
 vDesc:=FPontoFlutuante(dataSet.FieldByName('VALOR_DESC').AsCurrency,2);
 vIPI:=FPontoFlutuante(dataSet.FieldByName('VALOR_IPI').AsCurrency,2);
 vOutro:=FPontoFlutuante(dataSet.FieldByName('VALOR_OUT_DESP').AsCurrency,2);
 vIRRF_VND:=FPontoFlutuante(dataSet.FieldByName('VALOR_IRRF').AsCurrency,2);
 vbcserv:=FPontoFlutuante(dataSet.FieldByName('BASE_ISS').AsCurrency,2);
 vserv:=FPontoFlutuante(dataSet.FieldByName('VALOR_ISS').AsCurrency,2);
 valiqiss:=FPontoFlutuante(dataSet.FieldByName('VALOR_SERV').AsCurrency,2);
 vpis:=FPontoFlutuante(dataSet.FieldByName('VALOR_PIS').AsCurrency,2);
 vcofins:=FPontoFlutuante(dataSet.FieldByName('VALOR_COFINS').AsCurrency,2);
 vNatop:=dataSet.FieldByName('CODIGO_NOP').AsString;
 vDescNatop:=dataSet.FieldByName('DESC_NATOP').AsString;
 VNUMNOTA:=dataSet.FieldByName('NUM_NF').AsString;
 VCNFE:=StrUtils.IfThen(dataSet.FieldByName('CNFE').AsInteger > 0, dataSet.FieldByName('CNFE').AsString, VNUMNOTA) ;
 VCODCLIFOR:=dataSet.FieldByName('COD_CLIENTE').AsInteger;
 vinfadc:=copy(dataSet.FieldByName('OBS').AsString,1,2500)+#13+
 copy(dataSet.FieldByName('DADOS_INTERESSE_FISCO').AsString,1,2500);
// vdatemiss:=datetostr(dataSet.FieldByName('DATA_CONTABIL').value);
 vdatemiss:=FormatDateTime( 'DD/MM/YYYY HH:MM:SS', (dataSet.FieldByName('DATA_CONTABIL').AsDateTime + StrToTimeDef(dataSet.FieldByName('HORA_EMISSAO').AsString, Time))); // versao 3.1
 if dataSet.FieldByName('NATUREZA_NF').AsString = 'S' then
   vnatNF:='Saida'
 else
   vnatNF:='Entrada';
 if not dataSet.FieldByName('DATA_ENT_SAIDA').IsNull then
//  vdataensaid:=datetostr(dataSet.FieldByName('DATA_ENT_SAIDA').Value)
  vdataensaid:=FormatDateTime( 'DD/MM/YYYY HH:MM:SS', dataSet.FieldByName('DATA_ENT_SAIDA').AsDateTime + StrToTimeDef(dataSet.FieldByName('HORA_ENT_SAIDA').AsString, StrToTime('23:59:59')))
 else
  vdataensaid:='';
 vII_II := FPontoFlutuante(dataSet.FieldByName('valor_ii').AsCurrency,2);

 // Quando a nfe for complementar....
 vfinNFE:=dataSet.FieldByName('TIPO_EMISSAO').AsString;
 vListaRefNFE := TStringList.Create;
 vListaRefNFE.Clear;
 vListaRefNFE.Sorted := True;
 vListaRefNFE.Sort;
 vListaRefNFE.Duplicates := dupIgnore;
 if dataSet.FieldByName('TIPO_EMISSAO').AsString = '2' then
 begin
    vrefNFE :=
    retornaValor('select chave_nfe AS VALOR from notafiscal where serie = '''+
    dataSet.FieldByName('serie_compl').AsString+''' and cod_empresa = '+
    dataSet.FieldByName('cod_empresa').AsString+' and chave_nfe <> '+QuotedStr('')+' and '+
    'NUM_NF = '+dataSet.FieldByName('num_nf_compl').AsString);
  if trim(vrefNFE)<>'' then
  begin
    vfinNFE := '2';
    vListaRefNFE.Add(vrefNFE);
  end;
 end;
//else
 begin
//   vrefNFE :=
//     Trim(retornaValor(
   buscas.close;
   buscas.sql.text:=
     'select nf.chave_nfe as valor from NOTAFISCAL_SPED_C113 nr' +
      ' inner join notafiscal nf on nf.cod_nf = nr.cod_nf_ref and nf.cod_empresa = nr.cod_empresa and coalesce(nf.chave_nfe,'''') <> ''''' +
      ' where nr.cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
      ' and nr.cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger) +
      ' union ' +
      ' select nr.chave_nfe_ref as valor from NOTAFISCAL_SPED_C113 nr' +
      ' where nr.cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
      ' and nr.cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger) +
      ' and cod_nf_ref < 0';//));
   buscas.open;
   buscas.First;
   while not buscas.Eof do
   begin
     vListaRefNFE.Add(buscas.FieldByName('valor').AsString);
     buscas.Next;
   end;
   
   buscas.close;
   buscas.sql.text:=
     'select distinct nf.chave_nfe as valor from notafiscal_item nfi' +
      ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf_dev and nf.cod_empresa = nfi.cod_empresa and coalesce(nf.chave_nfe,'''') <> ''''' +
      ' where nfi.cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
      ' and nfi.cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);//));
   buscas.open;
   buscas.First;
   while not buscas.Eof do
   begin
     vListaRefNFE.Add(buscas.FieldByName('valor').AsString);
     buscas.Next;
   end;

   buscas.Close;
   buscas.SQL.Text := 'select e.ibge_codigo_uf, nf.data_contabil, cl.cpfcgc, ''01'' modelo_nf, nf.serie, nf.num_nf from NOTAFISCAL_SPED_C113 nr' +
     ' inner join notafiscal nf on nf.cod_nf = nr.cod_nf_ref and nf.cod_empresa = nr.cod_empresa and nf.modelo_nf in (''1'', ''01'', ''001'', ''1A'', ''01A'', ''1/A'', ''1-A'')' +
     ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
     ' inner join estados e on e.codigo_uf = cl.codigo_uf' +
     ' where nr.cod_nf = :cod_nf' +
     ' and nr.cod_empresa = :cod_empresa' +
     ' union' +
     ' select e.ibge_codigo_uf, nf.data_contabil, cl.cpfcgc, ''01'' modelo_nf, nf.serie, nf.num_nf from notafiscal_item nfi' +
     ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf_dev and nf.cod_empresa = nfi.cod_empresa and nf.modelo_nf in (''1'', ''01'', ''001'', ''1A'', ''01A'', ''1/A'', ''1-A'')' +
     ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
     ' inner join estados e on e.codigo_uf = cl.codigo_uf' +
     ' where nfi.cod_nf = :cod_nf' +
     ' and nfi.cod_empresa = :cod_empresa';
   buscas.ParamByName('cod_nf').AsInteger := dataSet.FieldByName('cod_nf').AsInteger;
   buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
   buscas.Open;

   buscas.First;
   while not buscas.Eof do
   begin
     if (buscas.FieldByName('ibge_codigo_uf').AsInteger > 0) and
       (buscas.FieldByName('num_nf').AsInteger > 0) and
       (Length(Trim(buscas.FieldByName('cpfcgc').AsString)) = 14) then
       vListaRefNFE.Add('MOD01|' +
         IntToStr(buscas.FieldByName('ibge_codigo_uf').AsInteger) + '|' +
         Copy( IntToStr(YearOf(buscas.FieldByName('data_contabil').AsDateTime)) , 3, 2) + StrZero( MonthOf(buscas.FieldByName('data_contabil').AsDateTime) ,2) + '|' +
         Trim(buscas.FieldByName('cpfcgc').AsString) + '|' +
         Trim(buscas.FieldByName('modelo_nf').AsString) + '|' +
         StrZero(Trim(buscas.FieldByName('serie').AsString), 3) + '|' +
         IntToStr(buscas.FieldByName('num_nf').AsInteger) + '|'
       );
     buscas.Next;
   end;


 end;
 SetLength(vListRefNFe,vListaRefNFE.Count);
 for I := 0 to vListaRefNFE.Count - 1 do
   vListRefNFe[I] := vListaRefNFE[I];



 if trim(dataSet.FieldByName('CODIGO_TR').AsString) <> '' then
 begin
  buscas.close;
  buscas.sql.text:='SELECT TR.*,UF.SIGLA_UF FROM TRANSPORTADOR TR,ESTADOS UF WHERE TR.CODIGO_TR = '+dataSet.FieldByName('CODIGO_TR').AsString+
  ' AND TR.UF_TR = UF.CODIGO_UF AND TR.COD_EMPRESA = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger);
  buscas.Open;
  vtransRazao:=buscas.FieldByName('NOME_TR').AsString;
  vtransantt:=buscas.FieldByName('CODIGOANTT').AsString;
  vtranscnpj:=buscas.FieldByName('CNPJ_TR').AsString;
  vtransendereco:=buscas.FieldByName('END_TR').AsString;
  vtransmunicipio:=buscas.FieldByName('MUNICIPIO_TR').AsString;
  vtransuftrans:=buscas.FieldByName('SIGLA_UF').AsString;
  vtransIE:=buscas.FieldByName('IE_TR').AsString;
  if Trim(vtransIE) = 'ISENTO' then
    vtransIE := '';

  vtransPlacaVeic:=dataSet.FieldByName('PLACA_TR').AsString;
  vtransUF:=dataSet.FieldByName('UF_PLACA_TR').AsString;
  try
   vtransQvol:=trim(dataSet.FieldByName('QTDE_VOLUMES_TR').asstring);
  except
   vtransQvol:='0';
  end;
  vtransEspecie:=dataSet.FieldByName('ESPECIE_TR').AsString;
  vtransMarca:=dataSet.FieldByName('MARCA_TR').AsString;
  vtransNVol:=dataSet.FieldByName('NUMERO_TR').AsString;
  try
   vtransPesoB:=CurrToStr(dataSet.FieldByName('PESO_B').ascurrency);
   vtranspesoL:=CurrToStr(dataSet.FieldByName('PESO_L').AsCurrency);
  except
   vtransPesoB:='0';
   vtranspesoL:='0';
  end;
 end;
 vtranspfrc:=dataSet.FieldByName('FRETECONTA_TR').AsString;
 if (dataSet.FieldByName('NATUREZA_NF').AsString = 'S') and (dataSet.FieldByName('NFE_IDDEST').AsString = '3') then
 begin
   vExporta_UFEmbarq := dataSet.FieldByName('UFEMBARQ').AsString;
   vExporta_xLocEmbarq := dataSet.FieldByName('XLOCEMBARQ').AsString;
   vExporta_xLocDespacho := dataSet.FieldByName('XLOCDESPACHO').AsString;
 end
 else
 begin
   vExporta_UFEmbarq := '';
   vExporta_xLocEmbarq := '';
   vExporta_xLocDespacho := '';
 end;
 vTotTrib := FPontoFlutuante(dataSet.FieldByName('VTOTTRIB').AsCurrency,2);
 buscas.close;
 buscas.sql.text:='SELECT * FROM COND_PAG WHERE COD_COND_PAG = '+dataSet.FieldByName('COD_COND_PAG').AsString;
 buscas.Open;
 vCondicaoPAG:=buscas.FieldByName('DESC_COND_PAG').AsString;
 buscas.close;
 try // versao 3.1
   FormatDateTime('HH:MM:SS', dataSet.FieldByName('HORA_EMISSAO').AsDateTime);
   vNFE_INDPRES := dataSet.FieldByName('NFE_INDPRES').AsString;
   vNFE_IDDEST := dataSet.FieldByName('NFE_IDDEST').AsString;
   if Trim(dataSet.FieldByName('CONSUMIDOR_FINAL').AsString) = 'S' then
     vIndFinal := '1' else vIndFinal := '0';
 except
 end;
 vFCPUFDest := FPontoFlutuante(dataSet.FieldByName('vFCPUFDest').AsFloat, 2);
 vICMSUFDest := FPontoFlutuante(dataSet.FieldByName('vICMSUFDest').AsFloat, 2);
 vICMSUFRemet := FPontoFlutuante(dataSet.FieldByName('vICMSUFRemet').AsFloat, 2);
end;


function TClassNfVenda.obtemnumeroNF: boolean;
begin
 VNUMNOTA:=dataSet.FieldByName('NUM_NF').AsString;
 VCODCLIFOR:=dataSet.FieldByName('COD_CLIENTE').AsInteger;
end;

function TClassNfVenda.ObterItens(vnumnota: integer;codempresa: integer;serie: string;vcomveic: string): boolean;
begin
// O sistema deverá enviar para esta DLL apenas os produto e não serviços. Visto que o
// serviço não está homologado ainda.
//  vbasicm:=FPontoFlutuante(dataSet.fieldbyname('BASE_ICM_VND').AsCurrency,2);
//  vvalicm:=FPontoFlutuante(dataSet.fieldbyname('VALOR_ICMS').AsCurrency,2);
//  vvalnota:=FPontoFlutuante(dataSet.fieldbyname('VL_TOT_VND').AsCurrency,2);
//  vvalprod:=FPontoFlutuante(dataSet.fieldbyname('VL_PROD_VND').AsCurrency,2);
  Result := True;
  if not caditens.Abreitems(vnumnota,codempresa,serie,vcomveic) then
    Result := False;
end;

function TClassNfVenda.pesquisaNF(vnum, codempresa: integer;vsub: string): boolean;
begin
 montaSelect('SELECT * FROM NOTAFISCAL WHERE NUM_NF = '+inttostr(vnum)+
 ' AND COD_EMPRESA = '+inttostr(codempresa)+' AND SERIE = '''+vsub+''' AND EMISSAO_PROPRIA = ''S'' and MODELO_NF = ''55'' and ativo = 1'+
 ' AND ((NATUREZA_NF = ''S'') OR (NUM_GERADO = ''S''))' +
 ' and coalesce(nfe_versao,'''') = '''' ');
end;

function TClassNfVenda.proximaNF: boolean;
begin
 Next;
 obtemdadostotaisnf;
end;


function TClassNfVenda.Split(AValue, ASeparator: string; AIgnoreEmpty,
  AIgnoreDuplicates: Boolean): TStrings;
var
  AList, AListValid: TStringList;
  I: Integer;
begin
  AList := TStringList.Create;
  AListValid := TStringList.Create;
  Result := AListValid;

  if AIgnoreDuplicates then
  begin
    AListValid.Sorted := True;
    AListValid.Duplicates := dupIgnore;
  end;

  AList.LineBreak := ASeparator;
  AList.Text := AValue;

  for I := 0 to AList.Count - 1 do
    if not AIgnoreEmpty then
      AListValid.Add(AList[I])
    else if (Trim(AList[I]) <> '') then
      AListValid.Add(AList[I]);
end;

function TClassNfVenda.verificabol: boolean;
var
 i: integer;
begin
  buscas.Close;
  buscas.sql.text:='select * from boletas where cod_nf = ' + IntToStr(dataSet.fieldbyname('COD_NF').AsInteger) + ' and tipo_emissao = ''NF'''+
  ' and cod_empresa = '+dataSet.fieldbyname('COD_EMPRESA').AsString;
  buscas.Open;
  SetLength(vndoc,1); //Dados Duplicata
  SetLength(vndtvenc,1); //Dados Duplicata
  SetLength(vnval,1); //Dados Duplicata
  for i:=0 to 0 do
  begin
    vndoc[i]:='';
    vndtvenc[i]:=now;
    vnval[i]:='';
  end;
  i:=0;
  while not buscas.eof do
  begin
    vndoc[i]:=buscas.FieldByName('N_DOC_BOL').AsString;
    vndtvenc[i]:=buscas.FieldByName('DATA_VEN_BOL').AsDateTime;
    vnval[i]:=FPontoFlutuante(buscas.FieldByName('VL_DOC_BOL').AsCurrency,2);
    buscas.next;
    if not buscas.eof then
    begin
     i:=i+1;
     SetLength(vndoc, i+1); //Produto num. 4 são digitos
     SetLength(vndtvenc, i+1); //Produto num. 4 são digitos
     SetLength(vnval, i+1); //Produto num. 4 são digitos
    end;
  end;
  buscas.close;
end;

function TClassNfVenda.verificacuponsref: Boolean;
var
i: integer;
begin
  buscas.Close;
  buscas.sql.text:='select * from notafiscal_sped_c114 where cod_nf = '+dataSet.fieldbyname('cod_nf').AsString+
  ' and cod_empresa = '+dataSet.fieldbyname('COD_EMPRESA').AsString;
  buscas.Open;
  SetLength(vmodecf,1); //Dados do ECF
  SetLength(vnumecf,1);
  SetLength(vcooecf,1);
  for i:=0 to 0 do
  begin
    vmodecf[i]:='';
    vnumecf[i]:='';
    vcooecf[i]:='';
  end;
  i:=0;
  while not buscas.eof do
  begin
    vmodecf[i]:=buscas.FieldByName('COD_MOD').AsString;
    vnumecf[i]:=buscas.FieldByName('ECF_CX').AsString;
    vcooecf[i]:=buscas.FieldByName('NUM_DOC').AsString;
    buscas.next;
    if not buscas.eof then
    begin
     i:=i+1;
     SetLength(vmodecf, i+1); //Adição automática para os dados
     SetLength(vnumecf, i+1);
     SetLength(vcooecf, i+1);
    end;
  end;
  buscas.close;
end;

function TClassNfVenda.verlocalretent: boolean;
begin
 buscas.Close;
 buscas.sql.text:='select first 1 * from notafiscal_sped_c115 where cod_nf = '+
 dataset.FieldByName('cod_nf').AsString+' and cod_empresa = '+
 dataSet.FieldByName('cod_empresa').AsString;
 buscas.Open;
 if buscas.IsEmpty then
   Result := False
 else
  Result := True;
end;

{ TClssEmpresa }

constructor TClssEmpresa.create;
begin
 dataSet:=TClientDataSet(DtmNFEHW.CdsEmpresa);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
end;

function TClssEmpresa.dadosGNfe: boolean;
begin
  montaSelect('SELECT empresa.*, estados.sigla_uf from empresa' +
              ' inner join estados on estados.codigo_uf = empresa.uf_emp' +
              ' where cod_empresa = '+inttostr(codempresa));
  vNFE_CAMINHO_CERT:=dataSet.fieldbyname('NFE_CAMINHO_CERT').AsString;
  vNFE_SENHA__CERT:=dataSet.fieldbyname('NFE_SENHA__CERT').AsString;
  vNFE_NUMSERIE_CERT:=dataSet.fieldbyname('NFE_NUMSERIE_CERT').AsString;
  vNFE_DANFE_TIPO:=dataSet.fieldbyname('NFE_DANFE_TIPO').AsString;
  vNFE_DANFE_FOREMISS:=dataSet.fieldbyname('NFE_DANFE_FOREMISS').AsString;
  vNFE_LOGOMARCA:=dataSet.fieldbyname('NFE_LOGOMARCA').AsString;
  vNFE_LOGOMARCA:=copy(vNFE_LOGOMARCA,1,length(trim(vNFE_LOGOMARCA))-3)+'JPG';
  vNFE_LOGPATH:=dataSet.fieldbyname('NFE_LOGPATH').AsString;
  vWEBSERV_UF:=dataSet.fieldbyname('WEBSERV_UF').AsString;
  vWEBSERV_AMBIENTE:=dataSet.fieldbyname('WEBSERV_AMBIENTE').AsString;
  vWEBSERV_VISUALIZAR:=dataSet.fieldbyname('WEBSERV_VISUALIZAR').AsString;
  vDIAS_AVISO:=dataSet.fieldbyname('DIAS_AVISO').Asinteger;
  vNFE_ENDRELRAVE:=dataSet.fieldbyname('NFE_ENDRELRAVE').AsString;
  vNFE_ENDERECOPDF:=dataSet.fieldbyname('NFE_ENDERECOPDF').AsString;
  vPORTA_SMTP:=dataSet.fieldbyname('PORTA_SMTP').AsInteger;
  vENVIAEMAILNFE:=dataSet.fieldbyname('ENVIAEMAILNFE').AsString;
  vASSUNTO_NFE:=dataSet.fieldbyname('ASSUNTO_NFE').AsString;
  vEMAIL_USASSL:=dataSet.fieldbyname('EMAIL_USASSL').AsString;
  vEMAIL_USATLS:=dataSet.fieldbyname('EMAIL_USATLS').AsString;
  vEMAIL_SENHA:=dataSet.fieldbyname('EMAIL_SENHA').AsString;
  vMENSAGEM_NFE:=dataSet.fieldbyname('MENSAGEM_NFE').AsString;
  vIBGE_COD_CIDADE:=dataSet.fieldbyname('IBGE_COD_CIDADE').AsInteger;
  vIBGE_CODIGO_UF:=dataSet.fieldbyname('IBGE_CODIGO_UF').AsInteger;
  vMODELO_NF:=dataSet.fieldbyname('MODELO_NF').AsString;
  vSERIE_SCAN:=dataSet.fieldbyname('SERIE_SCAN').AsInteger;
  vSMTP_EMP:=dataSet.fieldbyname('SMTP_EMP').AsString;
  vLOGIN_EMP:=dataSet.fieldbyname('LOGIN_EMP').AsString;
  VSUB_SERIE:=dataset.fieldbyname('SUB_SERIE').ASSTRING;
  vSIGLA_UFemp:=dataset.fieldbyname('UF_EMP').ASSTRING;
  vSIGLA_UF :=dataset.fieldbyname('SIGLA_UF').ASSTRING;
  vxJust:=dataset.fieldbyname('NFE_XJUST').ASSTRING;
  vdhCont:=dataset.fieldbyname('NFE_DHCONT').ASSTRING;
  vqtdenfpend:=dataSet.FieldByName('NFE_QTDELIMITENFPEND').AsString;
  vqtdependemdias:=dataSet.FieldByName('NFEPENDEMDIAS').AsString;
  vusdataserv:=dataSet.FieldByName('ATRIBUIR_DATA_SERVIDOR').AsString;
  buscas.Close;
  buscas.SQL.text:='SELECT FIRST 1 NOME_EMPDES FROM EMPDESVOLV';
  buscas.open;
  vSISTEMA:=buscas.FieldByName('NOME_EMPDES').AsString;
  if vqtdenfpend = '' then
   vqtdenfpend:='0';
  if vqtdependemdias = '' then
    vqtdependemdias:='0';
end;

destructor TClssEmpresa.destroy;
begin
  dataSet.close;
  inherited;
end;

function TClssEmpresa.Gravacontingencia(vmotivo, vtipemiss: string): boolean;
begin
  Result := True;
  dadosGNfe;
  IniciaTransacao;
  try

   SqlExec( Format('update empresa set' +
                   ' NFE_XJUST = ''%s'', NFE_DHCONT = %s, NFE_DANFE_FOREMISS = ''%s''' +
                   ' where cod_empresa = %d',
                   [ vmotivo.Substring(0, 256), datet_fb(Now), vtipemiss, codempresa]));
   {
   dataSet.Edit;
   dataset.FieldByName('NFE_XJUST').AsString:=vmotivo;
   dataset.FieldByName('NFE_DHCONT').AsDateTime:=now;
   dataSet.FieldByName('NFE_DANFE_FOREMISS').AsString:=vtipemiss;
   dataSet.Post;
   dataSet.ApplyUpdates(-1);
   }
   CommitaTransacao;
   dataSet.Refresh;
  except
    on e: exception do
    begin
      RollBackTransacao;
      if application.messagebox('Erro ao Gravar no banco de dados. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
      Result := False;
    end;
  end;
  dadosGNfe;
end;

function TClssEmpresa.registraultimoNSU(vultnsu: string): boolean;
begin
  Result := True;
  dadosGNfe;
  IniciaTransacao;
  try
    SqlExec( Format('update empresa set ULTIMONSUNFDEST = ''%s''' +
                    ' where cod_empresa = %d',
                    [ vultnsu.Substring(0, 15), codempresa]));
   {
   dataSet.Edit;
   dataset.FieldByName('ULTIMONSUNFDEST').asstring:=vultnsu;
   dataSet.Post;
   dataSet.ApplyUpdates(-1);
   }
   CommitaTransacao;
   dataSet.Refresh;
  except
    on e: exception do
    begin
      RollBackTransacao;
      if application.messagebox('Erro ao Gravar ultimo NSU no banco de dados. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
      Result := False;
    end;
  end;
  dadosGNfe;
end;

function TClssEmpresa.TpEmisUFToStr(pUF: string): TpcnTipoEmissao;
begin
  if pos('|' + puf + '|', '|AC|AL|AP|MG|PB|RJ|RS|RO|RR|SC|SE|SP|TO|DF|') > 0 then
    Result := teSVCAN
  else if pos('|' + puf + '|', '|AM|BA|CE|ES|GO|MA|MT|MS|PA|PE|PI|PR|RN|') > 0 then
    Result := teSVCRS;
end;

{ TClassCliente }

function TClassCliente.BuscaClifor(CodClifor, codempresa: integer): boolean;
begin
  Result := True;
  montaSelect('SELECT cl.*,est.*,C.IBGE_COD_CIDADE FROM CLIENTES cl, ESTADOS est, CIDADES C WHERE cl.COD_CLIENTE = '+IntToStr(CodClifor)+' AND '+
  ' COD_EMPRESA = '+IntToStr(codempresa)+' AND cl.CODIGO_UF = est.CODIGO_UF '+
  'AND cl.COD_CIDADE = c.COD_CIDADE AND CL.ativo = 1' );
  if not dataset.IsEmpty then
  begin
    if  dataset.fieldbyname('IBGE_CODIGO_UF').AsString = '' then
    begin
      Application.MessageBox(PWideChar('Estado do cliente/Fornecedor está sem o código IBGE'),PWideChar('Error'), MB_OK);
      Result := False;
    end;
    if dataset.fieldbyname('IBGE_COD_CIDADE').AsString  = '' then
    begin
      Application.MessageBox(PWideChar('Cidade do cliente/Fornecedor está sem o código IBGE'),PWideChar('Error'), MB_OK);
      Result := False;
    end;
    vcod_estado:=dataset.fieldbyname('IBGE_CODIGO_UF').AsString;
    vcod_cidade:=dataset.fieldbyname('IBGE_COD_CIDADE').AsString;
    vcnpj:=dataset.fieldbyname('CPFCGC').AsString;
    if trim(dataset.fieldbyname('CEP').AsString) = '' then
    begin
      Application.MessageBox(PWideChar('Cliente sem Cep'),PWideChar('Error'), MB_OK);
      Result := False;
    end;
    try
    strtoint(trim(dataset.fieldbyname('CEP').AsString));
    except
      Application.MessageBox(PWideChar('Cep Inválido'),PWideChar('Error'), MB_OK);
      Result := False;
    end;
    vcep:=trim(dataset.fieldbyname('CEP').AsString);
    vlogr:=dataSet.fieldbyname('ENDERECO').AsString;
    if dataSet.FieldByName('NUM_END_CLIENTE').AsString  = '' then
    begin
      Application.MessageBox(PWideChar('Numero do endereço do cliente invalido'),PWideChar('Error'), MB_OK);
      Result := False;
    end;
    vnumero:=dataSet.FieldByName('NUM_END_CLIENTE').AsString;
//    '1';// Criar este Campo
    vcompl:=dataSet.FieldByName('COMPLEMENTO').AsString;
    vbairro:=dataset.fieldbyname('BAIRRO').AsString;
    vdesccidade:=dataset.fieldbyname('CIDADE').AsString;
    vdescuf:=dataset.fieldbyname('SIGLA_UF').AsString;
    vfone:=dataset.fieldbyname('FONE_CLIENTE').AsString;
    vie:=dataset.fieldbyname('INSC_EST').AsString;
    vrazao:=dataset.fieldbyname('RAZAO').AsString;
    vcodpais:='';
    try
      if (dataSet.FieldByName('cod_pais').AsInteger <> 1058) and (dataSet.FieldByName('cod_pais').AsInteger <> 0) then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select * from paises where cod_pais = ' + IntToStr(dataSet.FieldByName('cod_pais').AsInteger)+
          ' and cod_pais <> 1058';
        buscas.Open;
        if not buscas.IsEmpty then
        begin
          vcodpais := buscas.FieldByName('cod_pais').AsString;
          vdescpais := buscas.FieldByName('nome_pais').AsString;
          vdesccidade := 'EXTERIOR';
          vdescuf := 'EX';
        end;
      end;
    except
    end;
    if vcodpais = '' then
    begin
    vcodpais:='1058'; //<Codigo Pais>
    vdescpais:='BRASIL';
    end;
    vemail:=trim(dataset.fieldbyname('EMAIL').AsString);
    vSiglaEstado:=dataset.fieldbyname('SIGLA_UF').AsString;
    // versao 3.1
    if Trim(vie) = 'ISENTO' then
      vie := '';
    vNFE_AUTXML := Trim(dataset.fieldbyname('NFE_AUTXML').AsString);
    vNFE_INDIEDEST := IntToStr(dataset.fieldbyname('NFE_INDIEDEST').AsInteger);
    if Trim(vNFE_INDIEDEST) = '0' then
      if vie = '' then
        vNFE_INDIEDEST := '9'//
      else
       vNFE_INDIEDEST := '1';
    vNFE_IDESTRANGEIRO := Trim(dataset.fieldbyname('NFE_IDESTRANGEIRO').AsString);
  end
  else
  begin
   Application.MessageBox(PWideChar('Cliente Não Encontrado no cadastro'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
end;

constructor TClassCliente.create;
begin
 dataSet:=TClientDataSet(DtmNFEHW.CdsClientes);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
 DtmNFEHW.IbCliente.Close;
 DtmNFEHW.IbCliente.SQL.text:='SELECT * FROM CLIENTES';
 DtmNFEHW.DtClienteForn.DataSet:=DtmNFEHW.IbCliente;
 vnomecampodataset:='NOME_CLIENTE';
end;

destructor TClassCliente.destroy;
begin
  dataSet.Close;
  inherited;
end;

{ TClassItNfVenda }

function TClassItNfVenda.Abreitems(nnf, codempresa: integer;serie: string;comveic: string): boolean;
var
 vcondveic: string;
 vtpversao: string;
  I: Integer;
  K: Integer;
begin
 Result := True;
 montaSelect('SELECT * FROM NOTAFISCAL_ITEM WHERE COD_NF = '+serie+' AND COD_EMPRESA = '+IntToStr(codempresa)+
 ' AND ATIVO = 1 order by nitem');
 vitem:='1';
 vtipitem:=trim(dataSet.FieldByName('TIPO_ITEM').AsString);
 vNCM := trim(dataSet.FieldByName('NCM').AsString);
 vcfopit:=dataSet.fieldbyname('CODIGO_NOP').AsString;
 vcodit:=dataSet.FieldByName('NUM_FAB_PROD').AsString;
 if dataSet.FieldByName('DESCRICAO_ITEM_OUTRAS').AsString <> '' then
  vdescprod:=dataSet.FieldByName('DESCRICAO_ITEM_OUTRAS').AsString
 else
  vdescprod:=dataSet.FieldByName('DESCRICAO_ITEM').AsString;
 vqtde:=FPontoFlutuante(dataSet.FieldByName('QUANTIDADE').AsCurrency,4);
 vunid:=dataSet.FieldByName('REFERENCIA').AsString;
 vvaltotit:=FPontoFlutuante(dataSet.FieldByName('VALOR_TOTAL').AsCurrency,2);
 vvaluntit:=FPontoFlutuante(dataSet.FieldByName('VALOR_UNITARIO').AsCurrency,10);
 vqtdtrib:=FPontoFlutuante(dataSet.FieldByName('QUANTIDADE').AsCurrency,4);
 vunidtrib:=dataSet.FieldByName('REFERENCIA').AsString;
 vluntrib:=FPontoFlutuante(dataSet.FieldByName('VALOR_UNITARIO').AsCurrency,10);
 vinfAdicionalit:='';
 if trim(dataSet.FieldByName('CSOSN').AsString) <> '' then
 begin
   vCSOSN:=dataSet.FieldByName('CSOSN').AsString;
   vpCredSN:=FPontoFlutuante(dataSet.FieldByName('ALIQ_ICM_SIMPLES').AsCurrency,2);
   vvCredICMSSN:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICM_SIMPLES').AsCurrency,2);
   vcst:=dataSet.FieldByName('CST').AsString;
 end
 else
  vcst:=dataSet.FieldByName('CST').AsString;
 vorig:=copy(dataSet.FieldByName('CST').AsString,1,1);
 vmoddet:=dataSet.FieldByName('MODBC').AsString;
 vmodBCST:=dataSet.FieldByName('MODBCST').AsString;
 vBASEICMANT_SUB_IT:=FPontoFlutuante(dataSet.FieldByName('BASE_ICMANT_SUB').AsCurrency,2);//vBCSTRet
 vICMANT_SUB_IT:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICMANT_SUB').AsCurrency,2);//vICMSSTRet
 vALIQ_ICMSUB:=dataSet.FieldByName('ALIQ_ICMSUB').AsString;
 vcodservlc116:='';
 vcodtrib:='';
 if vtipitem = 'S' then
 begin
  valiqit:=dataSet.FieldByName('ALIQ_ISS').AsString;
  valicmsit:=FPontoFlutuante(dataSet.FieldByName('VALOR_ISS').ascurrency,2);
  valbaseicmsit:=FPontoFlutuante(dataSet.FieldByName('BASE_ISS').AsCurrency,2);
  buscas.close;
  buscas.SQL.text:='SELECT * FROM TIPO_SERVICO WHERE COD_SERVICO = '+vcodit+' AND ATIVO = 1';
  buscas.open;
  vcodservlc116:=buscas.FieldByName('COD_SERV_LEICOMPLEMENTAR_166').AsString;
  vcodtrib:=buscas.FieldByName('CODIGO_TRIBUTACAO').AsString;
 end
 else
 begin
  valiqit:=dataSet.FieldByName('ALIQ_ICM').AsString;
  valicmsit:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICM').ascurrency,2);
  valbaseicmsit:=FPontoFlutuante(dataSet.FieldByName('BASE_ICM').AsCurrency,2);
 end;

 vbaseipi:=FPontoFlutuante(dataSet.FieldByName('BASE_IPI').AsCurrency,2);
 valiqipi:=FPontoFlutuante(dataSet.FieldByName('ALIQ_IPI').AsCurrency,2);
 valipiit:=FPontoFlutuante(dataSet.FieldByName('VALOR_IPI').AsCurrency,2);
 vcstipi:=dataSet.FieldByName('CST_IPI').AsString;

 vBICMSUB_VND:=FPontoFlutuante(dataSet.FieldByName('BASE_ICMSUB').AsCurrency,2);
 vICMSUB_VND:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICMSUB').AsCurrency,2);
 vpRedBCST:=FPontoFlutuante(dataSet.FieldByName('PERC_RED_PROD_SUB').AsCurrency,2);
 vPERC_RED_PROD:=dataSet.FieldByName('PERC_RED_PROD').AsString;
 vDESCONTO_PROD:=FPontoFlutuante(dataSet.FieldByName('RATEIO_DESCONTO').AsCurrency,2);
 vPERC_SUBSTTR_IT:=dataSet.FieldByName('MVA').AsString; // pMVAST
 vFRETE_IT:=FPontoFlutuante(dataSet.FieldByName('RATEIO_FRETE').AsCurrency,2);
 vSEGURO_IT:=FPontoFlutuante(dataSet.FieldByName('RATEIO_SEGURO').AsCurrency,2);
 vO_DESP_IT:=FPontoFlutuante(dataSet.FieldByName('RATEIO_OUTDESP').AsCurrency,2);
 vINDTOT:=dataSet.FieldByName('INDTOT').AsString;
 // Impostos Federais...
 vcstpis:=dataSet.FieldByName('CST_PIS').AsString;
 if vcstpis = '05' then
  vcstpis := '99';
 vbcpis:=FPontoFlutuante(dataSet.FieldByName('BASE_PIS').AsCurrency,2);
 vppis:=FPontoFlutuante(dataSet.FieldByName('ALIQ_PIS').AsCurrency,2);
 vpis:=FPontoFlutuante(dataSet.FieldByName('VALOR_PIS').AsCurrency,2);
 vqbcprodpis:=FPontoFlutuante(dataSet.FieldByName('QUANT_BC_PIS').AsCurrency,4);
 vvaliqpropis:=FPontoFlutuante(dataSet.FieldByName('ALIQ_PIS_QUANT').AsCurrency,4);
 vcstcofins:=dataSet.FieldByName('CST_COFINS').AsString;
 if vcstcofins = '05' then
  vcstcofins := '99';
 vbccofins:=FPontoFlutuante(dataSet.FieldByName('BASE_COFINS').AsCurrency,2);
 vpcofins:=FPontoFlutuante(dataSet.FieldByName('ALIQ_COFINS').AsCurrency,2);
 vcofins:=FPontoFlutuante(dataSet.FieldByName('VALOR_COFINS').AsCurrency,2);
 vqbcprodcofins:=FPontoFlutuante(dataSet.FieldByName('QUANT_BC_COFINS').AsCurrency,4);
 vvaliqcofins:=FPontoFlutuante(dataSet.FieldByName('ALIQ_COFINS_QUANT').AsCurrency,4);

 vBC_II := FPontoFlutuante(dataSet.FieldByName('base_ii').AsCurrency,2);
 vDespAdu_II := FPontoFlutuante(dataSet.FieldByName('valor_despadu_ii').AsCurrency,2);
 vII_II := FPontoFlutuante(dataSet.FieldByName('valor_ii').AsCurrency,2);
 vIOF_II := FPontoFlutuante(dataSet.FieldByName('valor_iof_ii').AsCurrency,2);

 //Pedido de Compra do Cliente
 xped_compra := Trim(dataSet.FieldByName('xped_compra').AsString);
 nitemped_compra := IntToStr(dataSet.FieldByName('nitemped_compra').AsInteger);
 //FCI
 nfci := Trim(dataSet.FieldByName('nfci').AsString);
 try //campos novos, por isso o try
   vCENQ := Trim(dataSet.FieldByName('cenq_ipi_nfe').AsString);
 except
   vCENQ := '';
 end;
 vCEST := Trim(dataSet.FieldByName('CEST').AsString);
 vVBCUFDEST := FPontoFlutuante(dataSet.FieldByName('VBCUFDEST').AsFloat, 2);
 vPFCPUFDEST := FPontoFlutuante(dataSet.FieldByName('PFCPUFDEST').AsFloat, 4);
 vPICMSUFDEST := FPontoFlutuante(dataSet.FieldByName('PICMSUFDEST').AsFloat, 4);
 vPICMSINTER := FPontoFlutuante(dataSet.FieldByName('PICMSINTER').AsFloat, 4);
 vPICMSINTERPART := FPontoFlutuante(dataSet.FieldByName('PICMSINTERPART').AsFloat, 4);
 vVFCPUFDEST := FPontoFlutuante(dataSet.FieldByName('VFCPUFDEST').AsFloat, 2);
 vVICMSUFDEST := FPontoFlutuante(dataSet.FieldByName('VICMSUFDEST').AsFloat, 2);
 vVICMSUFREMET := FPontoFlutuante(dataSet.FieldByName('VICMSUFREMET').AsFloat, 2);

 //Combustiveis

  if (Trim(dataSet.FieldByName('COMB_CPRODANP').AsString) <> '') and
    (Trim(dataSet.FieldByName('COMB_CPRODANP').AsString) <> '0') then
  begin
    vcProdANP := Trim(dataSet.FieldByName('COMB_CPRODANP').AsString);
    if Trim(dataSet.FieldByName('COMB_CODIF').AsString) <> '' then
      vCODIF := Trim(dataSet.FieldByName('COMB_CODIF').AsString);
    if Trim(dataSet.FieldByName('COMB_QTEMP').AsString) <> '' then
      vqTemp := FPontoFlutuante(dataSet.FieldByName('COMB_QTEMP').AsCurrency,2);

    if Trim(dataSet.FieldByName('COMB_UFCONS').AsString) = '' then
      vUFCons := vSiglaUFCliente
    else
      vUFCons := Trim(dataSet.FieldByName('COMB_UFCONS').AsString);
      
    try // versao 3.1
      if dataSet.FieldByName('COMB_PMIXGN').AsFloat > 0 then
        vCOMB_PMIXGN := FPontoFlutuante(dataSet.FieldByName('COMB_PMIXGN').AsFloat, 2);
    except
    end;

    if Trim(dataSet.FieldByName('COMB_CIDE_QBCPROD').AsString) <> '' then
      vCIDE_qBCProd := FPontoFlutuante(dataSet.FieldByName('COMB_CIDE_QBCPROD').AsCurrency,2);
    if Trim(dataSet.FieldByName('COMB_CIDE_VALIQPROD').AsString) <> '' then
      vCIDE_vAliqProd := FPontoFlutuante(dataSet.FieldByName('COMB_CIDE_VALIQPROD').AsCurrency,2);
    if Trim(dataSet.FieldByName('COMB_CIDE_VCIDE').AsString) <> '' then
      vCIDE_vCIDE := FPontoFlutuante(dataSet.FieldByName('COMB_CIDE_VCIDE').AsCurrency,2);
   end
  else
  begin
    vcProdANP := '';
    vCODIF := '';
    vqTemp := '';
    vUFCons := '';
    vCIDE_qBCProd := '';
    vCIDE_vAliqProd := '';
    vCIDE_vCIDE := '';
  end;

  vTotTrib := FPontoFlutuante(dataSet.FieldByName('VTOTTRIB').AsCurrency,2);
  // cEAN
  cEAN := '';
  if Trim(dataSet.FieldByName('TIPO_ITEM').AsString) = 'P' then
  begin
//    if ((Length(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)) = 8) or
//      (Length(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)) = 12) or
//      (Length(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)) = 13) or
//      (Length(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)) = 14)) and
//      (Copy(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString),1,3) = '789') then
//      cEAN := Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)
//    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select cod_barra from cod_barra' +
        ' where grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and cod_prod = ' + QuotedStr(Trim(dataSet.FieldByName('cod_prod').AsString)) +
        ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin
        if (Length(Trim(buscas.FieldByName('cod_barra').AsString)) = 8) or
          (Length(Trim(buscas.FieldByName('cod_barra').AsString)) = 12) or
          (Length(Trim(buscas.FieldByName('cod_barra').AsString)) = 13) or
          (Length(Trim(buscas.FieldByName('cod_barra').AsString)) = 14) then
        begin
          try
            if ValidaEAN(apenasNumeros(buscas.FieldByName('cod_barra').AsString)) then
              cEAN := Trim(buscas.FieldByName('cod_barra').AsString);
          except
          end;
          Break;
        end;

        buscas.Next;
      end;
    end;
  end
  else if ValidaEAN(apenasNumeros(vcodit)) then
    cEAN := vcodit;

   getDadosExportacaoImportacao;

 if comveic = 'S' then
 begin
  buscas.close;
  buscas.SQL.text:='SELECT IT.*,C.CODCORDENATRAM FROM NOTAFISCAL_ITEM_VEICULO IT,CODIGO_CORFAB C WHERE COD_NF = '+dataset.FieldByName('COD_NF').AsString+' AND COD_EMPRESA = '+
  dataset.FieldByName('COD_EMPRESA').AsString+'AND IT.COD_COR = C.COD_COR AND IT.ATIVO = 1';
  buscas.open;
  if trim(buscas.FieldByName('TIPO_VENDA').AsString) = 'U' then
  begin
    vmtusadas:='S';
    vcondveic:='SEMINOVA';
  end
  else
  begin
   vmtusadas:='N';
   vcondveic:='NOVA';
  end;
//  vcodit:=dataSet.FieldByName('RENAVAMV').AsString;
  vdescprod:=buscas.FieldByName('TIPO').AsString+': '+buscas.FieldByName('MARCA').AsString+
   ' MODELO: '+buscas.FieldByName('DESCRICAO_VERSAO').AsString;
   vqtde:='1';
   vqtdtrib:='1';
   vunid:='UN';
   vunidtrib:='UN';
   vpot:=FloatToStr(buscas.fieldbyname('HP').AsFloat);
   if Length(vpot) > 4 then
   begin
     vpot := Copy(vpot, 1, 4);
     vpot := FloatToStr(StrToFloat(vpot));
   end;
   vcm3:=StrZero(buscas.fieldbyname('CILINDRADA').AsInteger,4);
//   vcm3:=FloatToStr(buscas.fieldbyname('CILINDRADA').AsFloat);
//   if Length(vcm3) > 4 then
//   begin
//     vcm3 := Copy(vcm3, 1, 4);
//     vcm3 := FloatToStr(StrToFloat(vcm3));
//   end;
   vinfAdicionalit:='CHASSI: '+buscas.FieldByName('CHASSI').AsString+';LOTACAO: '+trim(buscas.FieldByName('LOTACAO').AsString)+' PASS.'+'; ANO FABRICACAO: '+
   buscas.FieldByName('ANO_FAB').AsString+', ANO MODELO: '+buscas.FieldByName('ANO_MOD').AsString+
   '; CILINDROS: '+buscas.fieldbyname('CILINDROS').AsString+' CONDIÇÃO: '+vcondveic+', COR: '+buscas.FieldByName('COR').AsString+
   '; CILINDRADAS: '+vcm3+', HP: '+vpot+
   '; COMBUSTÍVEL: '+buscas.FieldByName('COMBUSTIVEL').AsString+'; PLACA VEICULO: '+buscas.FieldByName('PLACA').AsString+'; '+
   'MOTOR: '+buscas.fieldbyname('MOTOR').AsString+
   '; RENAVAM: ' + buscas.fieldbyname('renavam').AsString;
   // Colocar os dados do veículo no detalhamento...
   vchassi:=buscas.FieldByName('CHASSI').AsString;
   vccor:=buscas.fieldbyname('COD_COR').AsString;
   vxcor:=buscas.fieldbyname('COR').AsString;
   vnserie:=buscas.fieldbyname('NSERIE').AsString;
   vnmotor:=buscas.fieldbyname('MOTOR').AsString;
   vrenavam:='';
   vcmod:=buscas.fieldbyname('RENAVAM').AsString;
   vanomod:=buscas.fieldbyname('ANO_MOD').AsString;
   vanofab:=buscas.fieldbyname('ANO_FAB').AsString;
   vtppint:=buscas.fieldbyname('TIP_PINTURA').AsString;
   vtprest:=buscas.FieldByName('TPREST').AsString;
   vcodcordenatran:=buscas.FieldByName('CODCORDENATRAM').AsString;
   vvin:='N';
   vcondveic:='1';
   vtpversao:= IntToStr(buscas.FieldByName('VERSAO').AsInteger);
   buscas.Close;
   buscas.sql.text:='select * from tipmodelo where codigo = '+vtpversao+
   ' and cod_empresa = '+dataSet.FieldByName('COD_EMPRESA').AsString;
   buscas.open;
   vcmkg:=buscas.fieldbyname('CMKG').AsString;
   vdist:=buscas.fieldbyname('DISTANCIAEIXO').AsString;
   vtpveic:=buscas.fieldbyname('TIP_VEICULO').AsString;
   vespecie:=buscas.fieldbyname('ESPRENAVAM').AsString;
   vpesol:=buscas.fieldbyname('PESOL').AsString;
   vpesob:=buscas.fieldbyname('PESOB').AsString;
   vtpcomb:=buscas.fieldbyname('TPCOMB').AsString;
   //
   vLotacao:=trim(buscas.fieldbyname('LOTACAO').AsString);
{ if (dataSet.FieldByName('NATOP_V').asinteger = 5912) or
 (dataSet.FieldByName('NATOP_V').asinteger = 6912) then
 begin
   caditens.vdemo:='S';
   caditens.vchassi:=dataSet.FieldByName('CHASSIV').AsString;
   caditens.vncomando:=dataSet.FieldByName('N_COMANDO').AsString;
 end
 else
   caditens.vdemo:='N';
 if not caditens.Abreitems(vnumnota,codempresa,serie) then
   Result := False;
  //Pendente}

  if (vpesol = '') or (vpesol = '0') then
  begin
   Application.MessageBox(PWideChar('Peso Líquido do Veículo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
  if (vpesob = '') or (vpesob = '0') then
  begin
   Application.MessageBox(PWideChar('Peso Bruto do Veículo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
  if (vtppint = '') then
  begin
   Application.MessageBox(PWideChar('Tipo de pintura não informado, verifique na tabela Estoque Veículos'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
  if (vnserie = '') then
  begin
   Application.MessageBox(PWideChar('N. série não informado, verifique na tabela Estoque Veículos'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
  if (vcmkg = '') then
  begin
   Application.MessageBox(PWideChar('CMKG não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
  if (vdist = '') then
  begin
   Application.MessageBox(PWideChar('Distância entre eixo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
  if (vtpveic = '') then
  begin
   Application.MessageBox(PWideChar('Tipo Renavam Veículo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
  if (vespecie = '') then
  begin
   Application.MessageBox(PWideChar('Espécie Renavam Veículo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
  if (vccor = '') then
  begin
   Application.MessageBox(PWideChar('Código da Cor Veículo não informado, verifique na Estoque de veículo'),PWideChar('Error'), MB_OK);
   Result := False;
  end;
 end;

 // versao 3.1
 try
   vNFE_PDEVOL := FPontoFlutuante(dataSet.FieldByName('NFE_PDEVOL').AsCurrency, 2);
   vNFE_VIPIDEVOL := FPontoFlutuante(dataSet.FieldByName('NFE_VIPIDEVOL').AsCurrency, 2);
   vNFE_NRECOPI := Trim(dataSet.FieldByName('NFE_NRECOPI').AsString);
   vNVE := Trim(dataSet.FieldByName('NVE').AsString);
 except
 end;
 
 if (vNCM = '') then
 begin
  Application.MessageBox(PWideChar('NCM não informado para o Produto '+vcodit+'. Dado Obrigatório!'),PWideChar('Error'), MB_OK);
  Result := False;
 end;
end;

constructor TClassItNfVenda.create;
begin
 dataSet:=TClientDataSet(DtmNFEHW.CdsItNfVenda);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
end;

destructor TClassItNfVenda.destroy;
begin
  dataSet.close;
  inherited;
end;

procedure TClassItNfVenda.getDadosExportacaoImportacao;
var
  I, K: Integer;
begin
  //DI

   if copy(vcfopit,1,1) = '3' then
   begin
    buscas.Close;
    buscas.SQL.Text := 'select * from notafiscal_item_di' +
      ' where cod_nf = ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
      ' and cod_empresa = ' + dataset.FieldByName('COD_EMPRESA').AsString +
      ' and nitem = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger);
    buscas.Open;
    buscas.FetchAll;

    SetLength(vDI_Item.vDI, buscas.RecordCount);
    vDI_Item.nCountDI := buscas.RecordCount;
    I:= 0;

    buscas.First;
    while not buscas.Eof do
    begin

      vDI_Item.vDI[I].nItemDI := IntToStr(buscas.FieldByName('NITEM_DI').AsInteger);
      vDI_Item.vDI[I].nDI := buscas.FieldByName('nDI').AsString;
      vDI_Item.vDI[I].dDI := DateToStr(buscas.FieldByName('dDI').AsDateTime);
      vDI_Item.vDI[I].xLocDesemb := buscas.FieldByName('xLocDesemb').AsString;
      vDI_Item.vDI[I].UFDesemb := buscas.FieldByName('UFDesemb').AsString;
      vDI_Item.vDI[I].dDesemb := DateToStr(buscas.FieldByName('dDesemb').AsDateTime);
      vDI_Item.vDI[I].cExportador := buscas.FieldByName('cExportador').AsString;
      try //versao 3.1
        vDI_Item.vDI[I].tpViaTransp := IntToStr(buscas.FieldByName('tpViaTransp').AsInteger);
        if buscas.FieldByName('vAFRMM').AsFloat > 0 then
          vDI_Item.vDI[I].vAFRMM := FPontoFlutuante(buscas.FieldByName('vAFRMM').AsFloat, 2)
        else
          vDI_Item.vDI[I].vAFRMM := '';
        vDI_Item.vDI[I].tpIntermedio := IntToStr(buscas.FieldByName('tpIntermedio').AsInteger);
        vDI_Item.vDI[I].CNPJ := Trim(buscas.FieldByName('CNPJ').AsString);
        vDI_Item.vDI[I].UFTerceiro := Trim(buscas.FieldByName('UFTerceiro').AsString);
      except
      end;

      Inc(I);
      buscas.Next;
    end;


    for I := 0 to vDI_Item.nCountDI - 1 do
    begin
      buscas.Close;
      buscas.SQL.Text := 'select * from notafiscal_item_adi' +
        ' where cod_nf = ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
        ' and cod_empresa = ' + dataset.FieldByName('COD_EMPRESA').AsString +
        ' and nitem = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger) +
        ' and nitem_di = ' + vDI_Item.vDI[I].nItemDI;
      buscas.Open;
      buscas.FetchAll;

      SetLength(vDI_Item.vDI[I].vADI, buscas.RecordCount);
      vDI_Item.vDI[I].nCountADI := buscas.RecordCount;
      K := 0;

      buscas.First;
      while not buscas.Eof do
      begin

        vDI_Item.vDI[I].vADI[K].nAdicao := IntToStr(buscas.FieldByName('nAdicao').AsInteger);
        vDI_Item.vDI[I].vADI[K].nSeqAdic := IntToStr(buscas.FieldByName('nSeqAdic').AsInteger);
        vDI_Item.vDI[I].vADI[K].cFabricante := buscas.FieldByName('cFabricante').AsString;
        vDI_Item.vDI[I].vADI[K].vDescDI := FPontoFlutuante(buscas.FieldByName('vDescDI').AsCurrency,2);
        try // versao 3.1
          vDI_Item.vDI[I].vADI[K].nDraw := Trim(buscas.FieldByName('nDraw').AsString);
        except
        end;

        Inc(K);
        buscas.Next;
      end;

    end;
   end;
   
   //Exportacao
  if (copy(vcfopit,1,1) = '3') or (copy(vcfopit,1,1) = '7') then 
  begin
    buscas.Close;
    buscas.SQL.Text := 'select * from NOTAFISCAL_ITEM_DETEXPORT' +
      ' where cod_nf = ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
      ' and cod_empresa = ' + dataset.FieldByName('COD_EMPRESA').AsString +
      ' and nitem = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger);
    buscas.Open;
    buscas.FetchAll;

    SetLength(vDI_Item.vDetExport, buscas.RecordCount);
    vDI_Item.nCountDetExport := buscas.RecordCount;
    I:= 0;

    buscas.First;
    while not buscas.Eof do
    begin
      vDI_Item.vDetExport[I].nItem_Det := IntToStr(buscas.FieldByName('nItem_Det').AsInteger);
      vDI_Item.vDetExport[I].nDraw := Trim(buscas.FieldByName('nDraw').AsString);

      Inc(I);
      buscas.Next;
    end;

    for I := 0 to vDI_Item.nCountDetExport - 1 do
    begin
      buscas.Close;
      buscas.SQL.Text := 'select * from NOTAFISCAL_ITEM_EXPORTIND' +
        ' where cod_nf = ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
        ' and cod_empresa = ' + dataset.FieldByName('COD_EMPRESA').AsString +
        ' and nitem = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger) +
        ' and NITEM_DET = ' + vDI_Item.vDetExport[I].nItem_Det;
      buscas.Open;
      buscas.FetchAll;

      SetLength(vDI_Item.vDetExport[I].vExportInd, buscas.RecordCount);
      vDI_Item.vDetExport[I].nCountExportInd := buscas.RecordCount;
      K := 0;

      buscas.First;
      while not buscas.Eof do
      begin
        vDI_Item.vDetExport[I].vExportInd[K].nRE := buscas.FieldByName('nRE').AsString;
        vDI_Item.vDetExport[I].vExportInd[K].chNFe := Trim(buscas.FieldByName('chNFe').AsString);
        vDI_Item.vDetExport[I].vExportInd[K].qExport := FPontoFlutuante(buscas.FieldByName('qExport').AsFloat, 4);
        Inc(K);
        buscas.Next;
      end;
    end;
  
  end;
end;

function TClassItNfVenda.proximoitem(comveic: string): boolean;
var
 vtpversao: string;
  I: Integer;
  K: Integer;
begin
 Next;
 if not eof then
 begin
   vitem:=inttostr(strtoint(vitem)+1);
   vtipitem:=trim(dataSet.FieldByName('TIPO_ITEM').AsString);
   vNCM := trim(dataSet.FieldByName('NCM').AsString);
   vcfopit:=dataSet.fieldbyname('CODIGO_NOP').AsString;
   vcodit:=dataSet.FieldByName('NUM_FAB_PROD').AsString;
   if dataSet.FieldByName('DESCRICAO_ITEM_OUTRAS').AsString <> '' then
    vdescprod:=dataSet.FieldByName('DESCRICAO_ITEM_OUTRAS').AsString
   else
    vdescprod:=dataSet.FieldByName('DESCRICAO_ITEM').AsString;
//   vdescprod:=dataSet.FieldByName('DESCRICAO_ITEM').AsString;
   vqtde:=FPontoFlutuante(dataSet.FieldByName('QUANTIDADE').AsCurrency,4);
   vunid:=dataSet.FieldByName('REFERENCIA').AsString;
   vvaltotit:=FPontoFlutuante(dataSet.FieldByName('VALOR_TOTAL').AsCurrency,2);
   vvaluntit:=FPontoFlutuante(dataSet.FieldByName('VALOR_UNITARIO').AsCurrency,10);
   vqtdtrib:=FPontoFlutuante(dataSet.FieldByName('QUANTIDADE').AsCurrency,4);
   vunidtrib:=dataSet.FieldByName('REFERENCIA').AsString;
   vluntrib:=FPontoFlutuante(dataSet.FieldByName('VALOR_UNITARIO').AsCurrency,10);
   vinfAdicionalit:='';
   if trim(dataSet.FieldByName('CSOSN').AsString) <> '' then
   begin
     vCSOSN:=dataSet.FieldByName('CSOSN').AsString;
     vpCredSN:=FPontoFlutuante(dataSet.FieldByName('ALIQ_ICM_SIMPLES').AsCurrency,2);
     vvCredICMSSN:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICM_SIMPLES').AsCurrency,2);
     vcst:=dataSet.FieldByName('CST').AsString;
   end
   else
    vcst:=dataSet.FieldByName('CST').AsString;
   vorig:=copy(dataSet.FieldByName('CST').AsString,1,1);
   vmoddet:=dataSet.FieldByName('MODBC').AsString;
   vmodBCST:=dataSet.FieldByName('MODBCST').AsString;
   vBASEICMANT_SUB_IT:=FPontoFlutuante(dataSet.FieldByName('BASE_ICMANT_SUB').AsCurrency,2);//vBCSTRet
   vICMANT_SUB_IT:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICMANT_SUB').AsCurrency,2);//vICMSSTRet
   vALIQ_ICMSUB:=dataSet.FieldByName('ALIQ_ICMSUB').AsString;
   vcodservlc116:='';
   vcodtrib:='';
   if vtipitem = 'S' then
   begin
    valiqit:=dataSet.FieldByName('ALIQ_ISS').AsString;
    valicmsit:=FPontoFlutuante(dataSet.FieldByName('VALOR_ISS').ascurrency,2);
    valbaseicmsit:=FPontoFlutuante(dataSet.FieldByName('BASE_ISS').AsCurrency,2);
    buscas.close;
    buscas.SQL.text:='SELECT * FROM TIPO_SERVICO WHERE COD_SERVICO = '+vcodit+' AND ATIVO = 1';
    buscas.open;
    vcodservlc116:=buscas.FieldByName('COD_SERV_LEICOMPLEMENTAR_166').AsString;
    vcodtrib:=buscas.FieldByName('CODIGO_TRIBUTACAO').AsString;
   end
   else
   begin
    valiqit:=dataSet.FieldByName('ALIQ_ICM').AsString;
    valicmsit:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICM').ascurrency,2);
    valbaseicmsit:=FPontoFlutuante(dataSet.FieldByName('BASE_ICM').AsCurrency,2);
   end;

   vbaseipi:=FPontoFlutuante(dataSet.FieldByName('BASE_IPI').AsCurrency,2);
   valiqipi:=FPontoFlutuante(dataSet.FieldByName('ALIQ_IPI').AsCurrency,2);
   valipiit:=FPontoFlutuante(dataSet.FieldByName('VALOR_IPI').AsCurrency,2);
   vcstipi:=dataSet.FieldByName('CST_IPI').AsString;

   vBICMSUB_VND:=FPontoFlutuante(dataSet.FieldByName('BASE_ICMSUB').AsCurrency,2);
   vICMSUB_VND:=FPontoFlutuante(dataSet.FieldByName('VALOR_ICMSUB').AsCurrency,2);
   vpRedBCST:=FPontoFlutuante(dataSet.FieldByName('PERC_RED_PROD_SUB').AsCurrency,2);
   vPERC_RED_PROD:=dataSet.FieldByName('PERC_RED_PROD').AsString;
   vDESCONTO_PROD:=FPontoFlutuante(dataSet.FieldByName('RATEIO_DESCONTO').AsCurrency,2);
   vPERC_SUBSTTR_IT:=dataSet.FieldByName('MVA').AsString; // pMVAST
   vFRETE_IT:=FPontoFlutuante(dataSet.FieldByName('RATEIO_FRETE').AsCurrency,2);
   vSEGURO_IT:=FPontoFlutuante(dataSet.FieldByName('RATEIO_SEGURO').AsCurrency,2);
   vO_DESP_IT:=FPontoFlutuante(dataSet.FieldByName('RATEIO_OUTDESP').AsCurrency,2);
   vINDTOT:=dataSet.FieldByName('INDTOT').AsString;
   // Impostos Federais....
   vcstpis:=dataSet.FieldByName('CST_PIS').AsString;
   if vcstpis = '05' then
     vcstpis := '99';
   vbcpis:=FPontoFlutuante(dataSet.FieldByName('BASE_PIS').AsCurrency,2);
   vppis:=FPontoFlutuante(dataSet.FieldByName('ALIQ_PIS').AsCurrency,2);
   vpis:=FPontoFlutuante(dataSet.FieldByName('VALOR_PIS').AsCurrency,2);
   vqbcprodpis:=FPontoFlutuante(dataSet.FieldByName('QUANT_BC_PIS').AsCurrency,4);
   vvaliqpropis:=FPontoFlutuante(dataSet.FieldByName('ALIQ_PIS_QUANT').AsCurrency,4);
   vcstcofins:=dataSet.FieldByName('CST_COFINS').AsString;
   if vcstcofins = '05' then
     vcstcofins := '99';
   vbccofins:=FPontoFlutuante(dataSet.FieldByName('BASE_COFINS').AsCurrency,2);
   vpcofins:=FPontoFlutuante(dataSet.FieldByName('ALIQ_COFINS').AsCurrency,2);
   vcofins:=FPontoFlutuante(dataSet.FieldByName('VALOR_COFINS').AsCurrency,2);
   vqbcprodcofins:=FPontoFlutuante(dataSet.FieldByName('QUANT_BC_COFINS').AsCurrency,4);
   vvaliqcofins:=FPontoFlutuante(dataSet.FieldByName('ALIQ_COFINS_QUANT').AsCurrency,4);

   vBC_II := FPontoFlutuante(dataSet.FieldByName('base_ii').AsCurrency,2);
   vDespAdu_II := FPontoFlutuante(dataSet.FieldByName('valor_despadu_ii').AsCurrency,2);
   vII_II := FPontoFlutuante(dataSet.FieldByName('valor_ii').AsCurrency,2);
   vIOF_II := FPontoFlutuante(dataSet.FieldByName('valor_iof_ii').AsCurrency,2);

   //Pedido de Compra do Cliente
   xped_compra := Trim(dataSet.FieldByName('xped_compra').AsString);
   nitemped_compra := IntToStr(dataSet.FieldByName('nitemped_compra').AsInteger);
   //FCI
   nfci := Trim(dataSet.FieldByName('nfci').AsString);
   try //campos novos, por isso o try
     vCENQ := Trim(dataSet.FieldByName('cenq_ipi_nfe').AsString);
   except
     vCENQ := '';
   end;
   vCEST := Trim(dataSet.FieldByName('CEST').AsString);
   vVBCUFDEST := FPontoFlutuante(dataSet.FieldByName('VBCUFDEST').AsFloat, 2);
   vPFCPUFDEST := FPontoFlutuante(dataSet.FieldByName('PFCPUFDEST').AsFloat, 4);
   vPICMSUFDEST := FPontoFlutuante(dataSet.FieldByName('PICMSUFDEST').AsFloat, 4);
   vPICMSINTER := FPontoFlutuante(dataSet.FieldByName('PICMSINTER').AsFloat, 4);
   vPICMSINTERPART := FPontoFlutuante(dataSet.FieldByName('PICMSINTERPART').AsFloat, 4);
   vVFCPUFDEST := FPontoFlutuante(dataSet.FieldByName('VFCPUFDEST').AsFloat, 2);
   vVICMSUFDEST := FPontoFlutuante(dataSet.FieldByName('VICMSUFDEST').AsFloat, 2);
   vVICMSUFREMET := FPontoFlutuante(dataSet.FieldByName('VICMSUFREMET').AsFloat, 2);

 //Combustiveis

  if (Trim(dataSet.FieldByName('COMB_CPRODANP').AsString) <> '') and
    (Trim(dataSet.FieldByName('COMB_CPRODANP').AsString) <> '0') then
  begin
    vcProdANP := Trim(dataSet.FieldByName('COMB_CPRODANP').AsString);
    if Trim(dataSet.FieldByName('COMB_CODIF').AsString) <> '' then
      vCODIF := Trim(dataSet.FieldByName('COMB_CODIF').AsString);
    if Trim(dataSet.FieldByName('COMB_QTEMP').AsString) <> '' then
      vqTemp := FPontoFlutuante(dataSet.FieldByName('COMB_QTEMP').AsCurrency,2);

    if Trim(dataSet.FieldByName('COMB_UFCONS').AsString) = '' then
      vUFCons := vSiglaUFCliente
    else
      vUFCons := Trim(dataSet.FieldByName('COMB_UFCONS').AsString);
      
    try // versao 3.1
      if dataSet.FieldByName('COMB_PMIXGN').AsFloat > 0 then
        vCOMB_PMIXGN := FPontoFlutuante(dataSet.FieldByName('COMB_PMIXGN').AsFloat, 2);
    except
    end;

    if Trim(dataSet.FieldByName('COMB_CIDE_QBCPROD').AsString) <> '' then
      vCIDE_qBCProd := FPontoFlutuante(dataSet.FieldByName('COMB_CIDE_QBCPROD').AsCurrency,2);
    if Trim(dataSet.FieldByName('COMB_CIDE_VALIQPROD').AsString) <> '' then
      vCIDE_vAliqProd := FPontoFlutuante(dataSet.FieldByName('COMB_CIDE_VALIQPROD').AsCurrency,2);
    if Trim(dataSet.FieldByName('COMB_CIDE_VCIDE').AsString) <> '' then
      vCIDE_vCIDE := FPontoFlutuante(dataSet.FieldByName('COMB_CIDE_VCIDE').AsCurrency,2);
   end
  else
  begin
    vcProdANP := '';
    vCODIF := '';
    vqTemp := '';
    vUFCons := '';
    vCIDE_qBCProd := '';
    vCIDE_vAliqProd := '';
    vCIDE_vCIDE := '';
  end;

  vTotTrib := FPontoFlutuante(dataSet.FieldByName('VTOTTRIB').AsCurrency,2);
  // cEAN
  cEAN := '';
  if Trim(dataSet.FieldByName('TIPO_ITEM').AsString) = 'P' then
  begin
//    if ((Length(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)) = 8) or
//      (Length(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)) = 12) or
//      (Length(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)) = 13) or
//      (Length(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)) = 14)) and
//      (Copy(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString),1,3) = '789') then
//      cEAN := Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)
//    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select cod_barra from cod_barra' +
        ' where grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and cod_prod = ' + QuotedStr(Trim(dataSet.FieldByName('cod_prod').AsString)) +
        ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin
        if (Length(Trim(buscas.FieldByName('cod_barra').AsString)) = 8) or
          (Length(Trim(buscas.FieldByName('cod_barra').AsString)) = 12) or
          (Length(Trim(buscas.FieldByName('cod_barra').AsString)) = 13) or
          (Length(Trim(buscas.FieldByName('cod_barra').AsString)) = 14) then
        begin
          try
            if ValidaEAN(apenasNumeros(buscas.FieldByName('cod_barra').AsString)) then
              cEAN := Trim(buscas.FieldByName('cod_barra').AsString);
          except
          end;
          Break;
        end;

        buscas.Next;
      end;
    end;
  end
  else if ValidaEAN(apenasNumeros(vcodit)) then
    cEAN := vcodit;

   getDadosExportacaoImportacao;

   if comveic = 'S' then
   begin
    buscas.close;
    buscas.SQL.text:='SELECT IT.*,C.CODCORDENATRAM FROM NOTAFISCAL_ITEM_VEICULO IT,CODIGO_CORFAB C WHERE COD_NF = '+dataset.FieldByName('COD_NF').AsString+' AND COD_EMPRESA = '+
    dataset.FieldByName('COD_EMPRESA').AsString+'AND IT.COD_COR = C.COD_COR AND IT.ATIVO = 1';
    buscas.open;
    if buscas.FieldByName('TIPO_VENDA').AsString = 'U' then
    begin
      vmtusadas:='S';
      vcondveic:='SEMINOVA';
    end
    else
    begin
     vmtusadas:='N';
     vcondveic:='NOVA';
    end;
  //  vcodit:=dataSet.FieldByName('RENAVAMV').AsString;
    vdescprod:=buscas.FieldByName('TIPO').AsString+' MARCA: '+buscas.FieldByName('MARCA').AsString+
     ' MODELO: '+buscas.FieldByName('DESCRICAO_VERSAO').AsString;
     vqtde:='1';
     vqtdtrib:='1';
     vunid:='UN';
     vunidtrib:='UN';                          
     vpot:=FloatToStr(buscas.fieldbyname('HP').AsFloat);
     if Length(vpot) > 4 then
     begin
       vpot := Copy(vpot, 1, 4);
       vpot := FloatToStr(StrToFloat(vpot));
     end;
     vcm3:=StrZero(buscas.fieldbyname('CILINDRADA').AsInteger,4);
//     vcm3:=FloatToStr(buscas.fieldbyname('CILINDRADA').AsFloat);
//     if Length(vcm3) > 4 then
//     begin
//       vcm3 := Copy(vcm3, 1, 4);
//       vcm3 := FloatToStr(StrToFloat(vcm3));
//     end;
     vinfAdicionalit:=buscas.FieldByName('LOTACAO').AsString+' PASS.,'+' ANO FABRICACAO: '+
     buscas.FieldByName('ANO_FAB').AsString+', ANO MODELO: '+buscas.FieldByName('ANO_MOD').AsString+
     ', CILINDROS: '+buscas.fieldbyname('CILINDROS').AsString+', '+vcondveic+', COR: '+buscas.FieldByName('COR').AsString+
     ', CILINDRADAS: '+vcm3+', HP: '+vpot+
     ', COMBUSTÍVEL: '+buscas.FieldByName('COMBUSTIVEL').AsString+', CHASSI NUMERO: '+
     buscas.FieldByName('CHASSI').AsString+', PLACA VEICULO: '+buscas.FieldByName('PLACA').AsString+', '+
     'MOTOR: '+buscas.fieldbyname('MOTOR').AsString+
     ', RENAVAM: ' + buscas.fieldbyname('renavam').AsString;
     // Colocar os dados do veículo no detalhamento...
     vchassi:=buscas.FieldByName('CHASSI').AsString;
     vccor:=buscas.fieldbyname('COD_COR').AsString;
     vxcor:=buscas.fieldbyname('COR').AsString;
     vnserie:=buscas.fieldbyname('NSERIE').AsString;
     vnmotor:=buscas.fieldbyname('MOTOR').AsString;
     vrenavam:='';
     vcmod:=buscas.fieldbyname('RENAVAM').AsString;
     vanomod:=buscas.fieldbyname('ANO_MOD').AsString;
     vanofab:=buscas.fieldbyname('ANO_FAB').AsString;
     vtppint:=buscas.fieldbyname('TIP_PINTURA').AsString;
     vtprest:=buscas.FieldByName('TPREST').AsString;
     vcodcordenatran:=buscas.FieldByName('CODCORDENATRAM').AsString;
     vvin:='N';
     vcondveic:='1';
     vtpversao:=buscas.FieldByName('VERSAO').AsString;
     buscas.Close;
     buscas.sql.text:='select * from tipmodelo where codigo = '+vtpversao+
     ' and cod_empresa = '+dataSet.FieldByName('COD_EMPRESA').AsString;
     buscas.open;
     vcmkg:=buscas.fieldbyname('CMKG').AsString;
     vdist:=buscas.fieldbyname('DISTANCIAEIXO').AsString;
     vtpveic:=buscas.fieldbyname('TIP_VEICULO').AsString;
     vespecie:=buscas.fieldbyname('ESPRENAVAM').AsString;
     vpesol:=buscas.fieldbyname('PESOL').AsString;
     vpesob:=buscas.fieldbyname('PESOB').AsString;
     vtpcomb:=buscas.fieldbyname('TPCOMB').AsString;
     //
     vLotacao:=buscas.fieldbyname('LOTACAO').AsString;
  { if (dataSet.FieldByName('NATOP_V').asinteger = 5912) or
   (dataSet.FieldByName('NATOP_V').asinteger = 6912) then
   begin
     caditens.vdemo:='S';
     caditens.vchassi:=dataSet.FieldByName('CHASSIV').AsString;
     caditens.vncomando:=dataSet.FieldByName('N_COMANDO').AsString;
   end
   else
     caditens.vdemo:='N';
   if not caditens.Abreitems(vnumnota,codempresa,serie) then
     Result := False;
    //Pendente}

    if (vpesol = '') or (vpesol = '0') then
    begin
     Application.MessageBox(PWideChar('Peso Líquido do Veículo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
    if (vpesob = '') or (vpesob = '0') then
    begin
     Application.MessageBox(PWideChar('Peso Bruto do Veículo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
    if (vtppint = '') then
    begin
     Application.MessageBox(PWideChar('Tipo de pintura não informado, verifique na tabela Estoque Veículos'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
    if (vnserie = '') then
    begin
     Application.MessageBox(PWideChar('N. série não informado, verifique na tabela Estoque Veículos'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
    if (vcmkg = '') then
    begin
     Application.MessageBox(PWideChar('CMKG não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
    if (vdist = '') then
    begin
     Application.MessageBox(PWideChar('Distância entre eixo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
    if (vtpveic = '') then
    begin
     Application.MessageBox(PWideChar('Tipo Renavam Veículo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
    if (vespecie = '') then
    begin
     Application.MessageBox(PWideChar('Espécie Renavam Veículo não informado, verifique na tabela Modelos'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
    if (vccor = '') then
    begin
     Application.MessageBox(PWideChar('Código da Cor Veículo não informado, verifique na Estoque de veículo'),PWideChar('Error'), MB_OK);
     Result := False;
    end;
   end;
     //pendente
 end; 

 // versao 3.1
 try
   vNFE_PDEVOL := FPontoFlutuante(dataSet.FieldByName('NFE_PDEVOL').AsCurrency, 2);
   vNFE_VIPIDEVOL := FPontoFlutuante(dataSet.FieldByName('NFE_VIPIDEVOL').AsCurrency, 2);
   vNFE_NRECOPI := Trim(dataSet.FieldByName('NFE_NRECOPI').AsString);
   vNVE := Trim(dataSet.FieldByName('NVE').AsString);
 except
 end;
 
end;

function TClassItNfVenda.ValidaEAN(CodBar: string): Boolean;
var
  sl_CodIni: string;
  il_SeqSom, il_Soma, il_TodNum: Integer;

  function DUN14Valido: Boolean;
  var
    Codigo,converCalculo :string;
    imp2, imp1, imp3, imp4, imp5,imp6, imp7, par1, par2 ,par3, par4, par5,par6,TResult,Tamanho,TImpar, TPar, Calculo, Digito:integer;
  begin

    try
      Codigo := Copy(CodBar, 1, 13);

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

      Result := IntToStr(Digito) = Copy(CodBar, 14, 1);

    except
      Result := False;
    end;
  end;

begin
  Result := False;

  CodBar := Trim(CodBar);
  if CodBar <> apenasNumeros(CodBar) then
    Exit;

  if not (Length(CodBar) in [8, 12, 13, 14]) then
    Exit;

  if (Length(Trim(CodBar)) = 14) then
     Result := DUN14Valido
    // se codigo eh certo, entao continua
  else
  begin
    sl_CodIni := PadL(CodBar, 13, '0');

    sl_CodIni := Copy(Trim(sl_CodIni), 1, Length(sl_CodIni) - 1);
    il_Soma := 0;
    il_SeqSom := 1;

    // se for ean8 entao completa numeros
//    if Length(Trim(CodBar)) = 8 then
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
      if Copy(Trim(CodBar), Length(CodBar), 1) =
        IntToStr(10 - StrToInt(Copy(IntToStr(il_Soma),
        Length(IntToStr(il_Soma)), 1))) then
        Result := TRUE
      else
        Result := FALSE
    end
    else if StrToInt(Copy(Trim(CodBar), Length(CodBar), 1)) = 0 then
      Result := TRUE
    else
      Result := FALSE;
  end;
end;

{ Testado }

procedure Testado.abrirestados(vuf: string);
begin
 montaSelect('select * from estados where ativo = 1');
 dataSet.Locate('CODIGO_UF',strtoint(vuf),[]);
end;

constructor Testado.create;
begin
 dataSet:=TClientDataSet(DtmNFEHW.Cdsestados);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
end;

destructor Testado.destroy;
begin
  Close;
  inherited;
end;
(*
{ TClassNfSe }

function TClassNfSe.abrevazio: boolean;
begin
montaSelect('SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,tipo_servico.aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
          'sum(pedvenda_serv.valor_tot_serv-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
          'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
          'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
          'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
          'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
          'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
          'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
          'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
          'where pedvenda.data_fech = ''01/01/1901'' and coalesce(pedvenda_serv.status,'''') <> ''CANCELADO'' '+
          'group by nome_cliente,nped,tipo,aliq_iss,nfs_servico,'+
          'cnae_serv,cidade,cod_rps,n_nf,cod_empresa,data_fech,status_nfse,iss_retido,ctiss');
end;

function TClassNfSe.abrirRPSDireto: boolean;
begin
   result:=true;
   vcodgar:=0;
   BuscasMnt.Close;
   if verificarGARANTIA(dataSet.FieldByName('NPED').AsInteger) then
   begin
    BuscasMnt.CommandText:='SELECT emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,cl.insc_est,cl.fax,cl.nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.NPED,it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cl.cidade,it.ctiss,'+
    'sum(VALOR_NFSE) as valor,sum(it.irrf_servico) as irrf_servico,SUM(it.ISSRET_SERVICO) as ISSRET_SERVICO,sum(it.VALOR_B_NFSE) AS bruto '+
    'FROM PEDVENDA_SERV it inner join pedvenda on it.nped = pedvenda.nped and '+
    'it.tipo = pedvenda.tipo and it.cod_empresa = pedvenda.cod_empresa '+
    'inner join clientes cl on cl.cod_cliente = '+IntToStr(vcodgar)+' and pedvenda.cod_empresa = cl.cod_empresa '+
    'inner join empresa emp on it.cod_empresa = emp.cod_empresa inner join cidades cid on cl.cod_cidade = cid.cod_cidade '+
    'inner join estados est on cl.codigo_uf = est.codigo_uf '+
    'where it.cod_rps = '+dataSet.FieldByName('COD_RPS').AsString+' and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and coalesce(it.status,'''') <> ''CANCELADO'' '+
    ' group by emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,insc_est,fax,nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.NPED,it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cidade,ctiss';
   end
   else
   begin
    BuscasMnt.CommandText:='SELECT emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,cl.insc_est,cl.fax,cl.nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.NPED,it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cl.cidade,it.ctiss,'+
    'sum(VALOR_NFSE) as valor,sum(it.irrf_servico) as irrf_servico,SUM(it.ISSRET_SERVICO) as ISSRET_SERVICO,sum(it.VALOR_B_NFSE) AS bruto '+
    'FROM PEDVENDA_SERV it inner join pedvenda on it.nped = pedvenda.nped and '+
    'it.tipo = pedvenda.tipo and it.cod_empresa = pedvenda.cod_empresa '+
    'inner join clientes cl on pedvenda.cod_cliente = cl.cod_cliente and pedvenda.cod_empresa = cl.cod_empresa '+
    'inner join empresa emp on it.cod_empresa = emp.cod_empresa inner join cidades cid on cl.cod_cidade = cid.cod_cidade '+
    'inner join estados est on cl.codigo_uf = est.codigo_uf '+
    'where it.cod_rps = '+dataSet.FieldByName('COD_RPS').AsString+' and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and coalesce(it.status,'''') <> ''CANCELADO'' '+
    ' group by emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,insc_est,fax,nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.NPED,it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cidade,ctiss';
   end;
    buscasmnt.Open;
end;

procedure TClassNfSe.acrescentaendACimp;
begin
  {$IFDEF USE_NFSEX}

  with ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador do
    RazaoSocial := cadempresa.fstr('NOME_EMP');

  with ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.Endereco do
  begin
    Endereco       := cadempresa.fstrNotEsp('ENDRECO_EMP');
    Numero         := cadempresa.fstrNotEsp('NUMERO_END');
    Complemento    := cadempresa.fstrNotEsp('COMPLEMENTO_EMP');
    Bairro         := cadempresa.fstrNotEsp('BAIRRO_EMP');
    CodigoMunicipio:= cadempresa.fstrNotEsp('IBGE_COD_CIDADE');
    xMunicipio     := cadempresa.fstrNotEsp('CIDADE_EMP');
    UF             := cadempresa.fstrNotEsp('SIGLA_UF');
    CEP            := cadempresa.fstrNotEsp('CEP_EMP');
  end;
  with ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.Contato do
  begin
    Telefone:= cadempresa.fstrNotEsp('TELEFONE_EMP');
    Email   := cadempresa.fstrNotEsp('EMAIL_EMP');
  end;

  if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
    ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota*100;

  {$ELSE}

  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.RazaoSocial:=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Endereco:=cadempresa.dataSet.FieldByName('ENDRECO_EMP').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Numero:=cadempresa.dataSet.FieldByName('NUMERO_END').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Complemento:=cadempresa.dataSet.FieldByName('COMPLEMENTO_EMP').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Bairro:=cadempresa.dataSet.FieldByName('BAIRRO_EMP').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio:=cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.xMunicipio:=cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.UF:=buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').AsInteger);
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CEP:=cadempresa.dataSet.FieldByName('CEP_EMP').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.Telefone:=cadempresa.dataSet.FieldByName('TELEFONE_EMP').AsString;
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.Email:=cadempresa.dataSet.FieldByName('EMAIL_EMP').AsString;
  if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
    ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota*100;

  {$ENDIF}

end;

function TClassNfSe.buscaSiglaest(vcodest: integer): string;
begin
 buscaadc.close;
 buscaadc.sql.Text:='select sigla_uf from estados where codigo_uf = '+inttostr(vcodest);
 buscaadc.Open;
 result:=buscaadc.FieldByName('SIGLA_UF').AsString;
end;

procedure TClassNfSe.ClearErrosNFSe;
begin
  ACBrNFSe1.WebService.Emite.Erros.Clear;
  ACBrNFSe1.WebService.ConsultaSituacao.Erros.Clear;
  ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Clear;
  ACBrNFSe1.WebService.ConsultaNFSeporRps.Erros.Clear;
  ACBrNFSe1.WebService.CancelaNFSe.Erros.Clear;
end;

function TClassNfSe.ConsultaDireta(vflag: integer): boolean;
var
  vlotenfse: string;
  vteste: string;
begin
  result:=true;
  IF dataSet.FieldByName('COD_RPS').AsInteger <> 0 then
  begin
    buscas.Close;
    buscas.sql.text:='SELECT * FROM PEDVENDA_SERV WHERE COD_RPS = '+
    dataSet.FieldByName('COD_RPS').AsString+' AND COD_EMPRESA = '+
    inttostr(cadempresa.codempresa);
    buscas.open;
    if buscas.FieldByName('nprotNFSe').AsString = '' then
    begin
      Application.MessageBox(PWideChar('RPS sem protocolo. Favor buscar a NFSe por RPS!'),PWideChar('Aviso'), MB_OK);
      Result := False;
    end
    else
    begin
      Fprotoloco:=buscas.FieldByName('nprotNFSe').AsString;
      vlotenfse:=buscas.FieldByName('lote_nfse').AsString;
      mostrarmensagem('Abrindo Tabela O.S....');
      abrirRPSDireto;
      if vflag = 1 then
        VerificaRetornoWs(ConsultaNFSe)
      else
      begin
        mostrarmensagem('');
        try
          ACBrNFSe1.NotasFiscais.Clear;

          {$IFDEF USE_NFSEX}
          ClearErrosNFSe;

          ACBrNFSe1.ConsultarLoteRps(Fprotoloco, vlotenfse);

          var errows := GetErrosNFSe().Trim;

          if not errows.IsEmpty then
            raise Exception.Create(errows);

          {$ELSE}
          with ACBrNFSe1.NotasFiscais.Add do
          begin
            NFSe.Prestador.Cnpj := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
            NFSe.Prestador.InscricaoMunicipal := cadempresa.dataSet.FieldByName('IM_EMP').AsString;
            NFSe.IdentificacaoRps.Numero := dataSet.FieldByName('COD_RPS').AsString;
          end;
          ACBrNFSe1.ConsultarLoteRps(vlotenfse, Fprotoloco);
          {$ENDIF}

          //      vteste := 'AP0176061V15732224K7mUSG';
          //      if InputQuery('Consulta Producao', 'Consulta situacao Lote Protocolo: ', vteste) then
          //      begin
          //        AP0176061V15732224K7mUSG
          //        ACBrNFSe1.Configuracoes.WebServices.Ambiente := taProducao;
          //
          //        ACBrNFSe1.ConsultarSituacao(cadempresa.dataSet.FieldByName('CGC_EMP').AsString, cadempresa.dataSet.FieldByName('IM_EMP').AsString, Fprotoloco, '');
          //      end
          //      else
          begin
          //      ACBrNFSe1.Configuracoes.WebServices.Ambiente := taHomologacao;
          //      ACBrNFSe1.ConsultarSituacao(cadempresa.dataSet.FieldByName('CGC_EMP').AsString, cadempresa.dataSet.FieldByName('IM_EMP').AsString, Fprotoloco, vlotenfse);
          end;
        except
          on e: exception do
          begin
            Result := False;
            if application.messagebox('Erro ao Consultar Lote RPS. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
              Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
          end;
        end;
       if result then
        if not VerificaRetornoAC(EMetodoNFSe.ConsultaLote) then
         Result := False;
      end;
    end;
  end
  else
  begin
    Application.MessageBox(PWideChar('Serviço sem RPS. Favor enviar o serviço para gerar um RPS!'),PWideChar('Aviso'), MB_OK);
    Result := False;
  end;

end;

function TClassNfSe.ConsultadiretaporRPS(): boolean;
begin
  Result := True;

  if fint('COD_RPS') = 0 then
  begin
    ShowErro('Serviço sem RPS. Favor enviar o serviço para gerar um RPS!');
    Exit(False);
  end;

  mostrarmensagem('Abrindo Tabela O.S....');
  try

    abrirRPSDireto;

//    if vflag = 1 then
//    begin
//      VerificaRetornoWs(consultaPorRPS);
//    end
//    else

    if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
    begin
      if dataSet.FieldByName('n_nf').AsInteger <= 0 then
      begin
        Application.MessageBox(PWideChar('Serviço sem numero de NF. Não é possível fazer a consulta no webservice sigiss!'), 'Aviso', MB_OK);
        Exit;
        //     sigiss com problema, começou a retornar notas antigas, comentando essa linha para o cliente conseguir consultar
        //     a nota correta quando o webservice for corrigido
        //     end
        //     else if dataSet.FieldByName('status_nfse').AsString.Trim = 'Autorizada' then
        //     begin
        //       Application.MessageBox(PWideChar('NFS-e já autorizada. Consulta não é necessária!'), 'Aviso', MB_OK);
        //       Exit;
      end;
      FdocsNFSe := sigiss_LoadDocEletronico(dataSet.FieldByName('COD_RPS').AsInteger);
      Result := sigiss_ConsultarNFSE(dataSet.FieldByName('n_nf').AsInteger);
      Exit;
    end;

    ACBrNFSe1.NotasFiscais.Clear;

    var xmlLoaded := False;

    var xmlRPS := GetXmlRPS(fint('COD_RPS'));
    var fileName := '';

    if xmlRPS.IsEmpty then
    begin
      fileName := StrConcat([ACBrNFSe1.Configuracoes.Arquivos.PathRPS, '\', fstr('COD_RPS'), '1-Rps.xml']);
      if not FileExists(fileName) then
      begin
        ShowErro(StrConcat(['Arquivo XML do RPS não encontrado no caminho: ', sLineBreak, fileName]));
        Exit(False);
      end;

      ACBrNFSe1.NotasFiscais.LoadFromFile(fileName);
    end
    else
      ACBrNFSe1.NotasFiscais.LoadFromString(xmlRPS);

    if ACBrNFSe1.NotasFiscais.Count = 0 then
    begin
      ShowErro('Nenhuma nota encontrada no xml');
      Exit(False);
    end;

    try
      ClearErrosNFSe;

      ACBrNFSe1.ConsultarNFSeporRps(dataSet.FieldByName('COD_RPS').AsString,
                                    cadempresa.dataSet.FieldByName('serie_serv_nfe').AsString,
                                    '1');

      {$IFDEF USE_NFSEX}
      var errows := GetErrosNFSe().Trim;

      if not errows.IsEmpty then
        raise Exception.Create(errows);
      {$ENDIF}

      Result := True;

    except on e: exception do
      begin
        Result := False;
        if ShowConfirmacao('Erro ao Consultar Lote RPS. Mostrar Erro?', mb_yesno + MB_DEFBUTTON2) = IDYES then
          ShowErro(E.Message);
      end;
    end;

    if Result then
      if not VerificaRetornoAC(EMetodoNFSe.ConsutaNota) then
        Result := False;

  finally
    mostrarmensagem('');
  end;
end;

function TClassNfSe.ConsultaNFSe: WideString;
var
  Util: OleVariant;
  msgDados, msgRetWS, msgResultado, certificado, licenca, usuario, senha, proxy: Widestring;
  ambiente, cResultado: integer;
  versao,cMunicipio, CNPJPrestador, IMPrestador, protocolo: Widestring;
  msg:string;
  it: integer;
  situacao,SoapMsgTx,SoapMsgRx: WideString;
//  ListaMensagemRetorno
begin
//
//  demo do uso da funcionalidade ConsultarLoteRPS
//
//  Consulta Lote de RPS
//
//
// Códigos de retorno
// ==========================================================================
// 5000 - Web Service consumido com sucesso, analise a mensagem de resposta do Web Service.
// 5001 - Erro: Falha na conexão: [{0:0}] (Causa provável: o certificado cliente: 1.não é ICP-Brasil (o certificado da associação não serve para consumir os WS); 2.fora do prazo de validade; 3.revogado; 4.certificado cliente não confiável para o Web Service acessado, contatar a SEFAZ)
// 5002 - Erro: Falha na conexão: [{0:0}] (Causa provável: a cadeia de certificação do Web Service acessado ou do certificado cliente inexistente no repositório de certificados do usuário corrente do Windows)
// 5003 - Erro: Falha na conexão: [{0:0}] (Causa provável: serviço inexistente, verifique se o nome do serviço da url acessada está correto no arquivo ws2.xml ou wsSCAN.xml se estiver utilizando a versão 1.x)
// 5004 - Erro: Falha na conexão: [{0:0}] (Causa provável: método não permitido)
// 5005 - Erro: Falha na conexão: [{0:0}] (Causa provável: a url não encontrada, verifique se o nome do domínio da url acessada está correto no arquivo ws2.xml ou wsSCAN.xml se estiver utilizando a versão 1.x)
// 5006 - Erro: Falha na conexão: [{0:0}] (Causa provável: Time-Out, o WS não respondeu a solicitação no tempo estabelecido: [{1:0}])
// 5007 - Erro: Falha na conexão: [{0:0}] (Causa provável: mensagem maior que a permitida)
// 5008 - Erro: Falha na conexão: [{0:0}] (Causa provável: Servidor com problemas)
// 5009 - Erro: Falha na conexão: [{0:0}] (Causa provável: Serviço não implementado)
// 5010 - Erro: Falha na conexão: [{0:0}] (Causa provável: Serviço temporariamente indisponível, servidor sem recursos para atender a solicitação)
// 5011 - Erro: Falha na conexão: [{0:0}] (Causa provável: Causa provável da falha na conexão: Rede indisponível)
// 5012 - Erro: Falha na conexão: [{0:0}] (Causa provável: Versão do SOAP não suportada)
// 5013 - Erro: Falha na conexão: [{0:0}] (Causa provável: Web Service não consumido, não houve nenhum retorno ou resposta)
// 5014 - Erro: Falha na conexão: [{0:0}] (Causa provável: Web Service não consumido, falha desconhecida, veja a mensagem de erro)
// 5015 - Erro: Falha na conexão: Tempo limite de time-out alcançado [{0:0} ms] - [{1:0}]
// 5016 - Erro: Falha na conexão: Falha da Biblioteca Criptografica: [{0:0}]
// 5017 - Erro: Falha ao tratar o XML de retorno do WS: [{0:0}]
// 5018 - Erro: Web Service não devolveu nehuma mensagem de resposta.
// 5019 - Erro: O município: [{0:0}] não oferece o WS: [{1:0}].
// 5101 - Erro: A mensagem de retorno do WS não é um XML válido: [{0:0}]
// 5102 - Erro: Tag cStat inexistente na mensagem de retorno  [{0:0}]
// 5103 - Erro: Tag xMotivo inexistente na mensagem de retorno  [{0:0}]
// 5104 - Erro: Tag [{0:0}] inexistente na mensagem de retorno  [{1:0}]
// 5105 - Erro: O WS não devolveu nenhum resultado
// 5201 - Erro: O código do tipo de ambiente [{0:0}]  informado diferente de 1 - produção e 2 - homologação
// 5202 - Erro: Ocorreu um erro de validação do XML do arquivo WSNFSE.xml: [{0:0}]
// 5203 - Erro: Inexiste url para o município [{0:0}] informada no ambiente [{1:0}]  desejado, verifique se existe atualização do arquivo WSNFSE.xml disponível.
// 5204 - Erro: Arquivo WSNFSE.XML com a URL do WS não localizado em {0:0}
// 5205 - Erro: Ocorreu um erro inesperado no processamento da URL do município [{0:0}] : [{1:0}]
// 5601 - Erro: O parâmetro cMuncipio não foi informado
// 5602 - Erro: A DLL ainda não foi customizada para o município: [{0:0}], contate a FlexDocs para verificar a possibilidade de customizar a DLL para o município desejado pelo canal www.flexdocs.com.br/suporte
// 5603 - Erro: O código da UF do parâmetro cMunicipio: [{0:0}] é inválido.
// 5604 - Erro: O DV do parâmetro cMunicipio: [{0:0}] é inválido.
// 5605 - Erro: O parâmetro CNPJPrestador não foi informado.
// 5606 - Erro: O parâmetro CNPJPrestador: [{0:0}] não é um CNPJ válido.
// 5701 - Erro: O lote não é um XML válido: [{0:0}]
// 5702 - Erro: A tag Cnpj do lote não localizado: [{0:0}]
// 5703 - Erro: Falha ao acessar o conteúdo da tag Cnpj
//
//  Declaração do parâmetros da DLL
//
//
// =============================================================================================================================================
//                                                  Inicialização dos parâmetros de chamada da DLL
// =============================================================================================================================================

// recomendamos o uso de variável global ou uso de tabela para manter a informação como licenca, ambiente, certificado, proxy, usario, senha, etc.


//  IMPORTANTE: todas as variáveis utilizadas como parâmetro da DLL devem ser inicialiadas

proxy :='';
usuario :='';
senha :='';

// informar licenca de uso para ambiente de produção
mostrarmensagem('Verificando Retorno WebService NFSe: '+nomecliente);
licenca :=cadempresa.dataSet.FieldByName('LICENCANFSE').AsString;
//'b06ccea9f950a4e62c2be9540efc61c3943736496e217adfff0ad7e925d84ec5bb9c21671ea91562dcc3419e99532c5725a23e3b3cfcc4c18c03e57c368e173a';

// informar com o assunto da certificado digital
// Ex.: "CN=NFe - Associacao NF-e:99999090910270, C=BR, L=PORTO ALEGRE, O=Teste Projeto NFe RS, OU=Teste Projeto NFe RS, S=RS"

// aproveitando o nome certificado que está armazenado no txCertificado
certificado := cadempresa.dataSet.FieldByName('NFS_CERT').AsString;


// inicializa parâmetro do ambiente


If cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Produção' then
 ambiente := 1
else
 ambiente := 2;


msgDados := '';
cResultado := 0;
msgRetWS :='';
versao := '1';        // versão do XML, necessário informar para consumir o WS da prefeitura de SP
msgResultado :='';
ListaMensagemRetorno :='';
protocolo := '';
listaMensagemAlertaRetorno:='';
listanfse:='';
ListaMensagemRetorno:='';
listaMensagemRetornoLote:='';
situacao:='';

// pega o CNPJ do emissor

CNPJPrestador := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;

// pega código do município do IBGE
// If cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Produção' then
 cMunicipio :=cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;

//   As prefeituras de SP/SP, Campo Grande/MS, Belem/PA, Campinas/SP, Nova Iguacu/RJ, Teresina/PI e Uberlandia/MG não oferecem a consulta situação do lote,

IMPrestador := cadempresa.dataSet.FieldByName('IM_EMP').AsString;

protocolo := Fprotoloco;

// instancia a DLL
Util := CreateOleObject('NFSe_Util.util');


it:=0;

if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').asinteger = 2 then
begin
  if cadempresa.dataSet.FieldByName('USARENVRPSSINCRONO').AsString = 'S' then
  begin
    msgRetWS := Util.ConsultaLoteRPS_v2(cMunicipio, certificado, ambiente, versao, msgDados, cResultado, msgResultado, CNPJPrestador, IMPrestador,
    protocolo, situacao,listaNFSe,listaMensagemAlertaRetorno,listaMensagemRetorno,listaMensagemRetornoLote,SoapMsgTx,SoapMsgRx, proxy, usuario, senha, licenca);
    if ListaMensagemRetorno <> ''  then
    Messagebox(0,PWideChar('Problemas com o Lote!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
  end
  else
  begin
    while it <= 10 do
    begin
     mostrarmensagem('Verificando Retorno por RPS WebService NFSe: '+nomecliente);
     Screen.cursor := crHourglass;
     msgRetWS := Util.ConsultaLoteRPS_v2(cMunicipio, certificado, ambiente, versao, msgDados, cResultado, msgResultado, CNPJPrestador, IMPrestador,
     protocolo, situacao,listaNFSe,listaMensagemAlertaRetorno,listaMensagemRetorno,listaMensagemRetornoLote,SoapMsgTx,SoapMsgRx, proxy, usuario, senha, licenca);
     Screen.cursor := crDefault;
     Arquivo:=msgRetWS;
     if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarLoteRpsResposta') <> '' then
     begin
      if pos('S50',Grupo) > 0 then
       it:=it+1
      else
       break;
     end
     else
      it:=it+1;
     mostrarmensagem('');
     Sleep(3000);
    end;
    if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarLoteRpsResposta') <> '' then
    begin
      if pos('S50',Grupo) > 0 then
      begin
        Messagebox(0,PWideChar('Lote em Processamento. Consulte mais tarde!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
        vcoderro:='S50';
      end;
    end;
  end;
end
else
begin
  while it <= 10 do
  begin
   mostrarmensagem('Verificando Retorno WebService NFSe: '+nomecliente);
   Screen.cursor := crHourglass;
   msgRetWS := Util.ConsultaLoteRPS(cMunicipio, certificado, ambiente, versao, msgDados, cResultado, msgResultado, CNPJPrestador, IMPrestador, protocolo, listaMensagemRetorno, proxy, usuario, senha, licenca);
   Screen.cursor := crDefault;
   Arquivo:=msgRetWS;
   if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarLoteRpsResposta') <> '' then
   begin
    if pos('S50',Grupo) > 0 then
     it:=it+1
    else
     break;
   end
   else
    it:=it+1;
   mostrarmensagem('');
   Sleep(3000);
  end;
  if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarLoteRpsResposta') <> '' then
  begin
    if pos('S50',Grupo) > 0 then
    begin
      Messagebox(0,PWideChar('Lote em Processamento. Consulte mais tarde!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
      vcoderro:='S50';
    end;
  end;
end;
result:=msgRetWS;
end;

function TClassNfSe.consultaPorRPS: widestring;
var
  Util: OleVariant;
  msgDados, msgRetWS, msgResultado, certificado, licenca, usuario, senha, proxy: Widestring;
  ambiente, cResultado: integer;
  versao,cMunicipio, CNPJPrestador, IMPrestador, protocolo: Widestring;
  msg:string;
  NumeroRPS, SerieRPS, TipoRPS: Widestring;
  SoapMsgTx,SoapMsgRx: WideString;

  it: integer;
//  ListaMensagemRetorno
begin
//
//  demo do uso da funcionalidade ConsultarLoteRPS
//
//  Consulta Lote de RPS
//
//
// Códigos de retorno
// ==========================================================================
// 5000 - Web Service consumido com sucesso, analise a mensagem de resposta do Web Service.
// 5001 - Erro: Falha na conexão: [{0:0}] (Causa provável: o certificado cliente: 1.não é ICP-Brasil (o certificado da associação não serve para consumir os WS); 2.fora do prazo de validade; 3.revogado; 4.certificado cliente não confiável para o Web Service acessado, contatar a SEFAZ)
// 5002 - Erro: Falha na conexão: [{0:0}] (Causa provável: a cadeia de certificação do Web Service acessado ou do certificado cliente inexistente no repositório de certificados do usuário corrente do Windows)
// 5003 - Erro: Falha na conexão: [{0:0}] (Causa provável: serviço inexistente, verifique se o nome do serviço da url acessada está correto no arquivo ws2.xml ou wsSCAN.xml se estiver utilizando a versão 1.x)
// 5004 - Erro: Falha na conexão: [{0:0}] (Causa provável: método não permitido)
// 5005 - Erro: Falha na conexão: [{0:0}] (Causa provável: a url não encontrada, verifique se o nome do domínio da url acessada está correto no arquivo ws2.xml ou wsSCAN.xml se estiver utilizando a versão 1.x)
// 5006 - Erro: Falha na conexão: [{0:0}] (Causa provável: Time-Out, o WS não respondeu a solicitação no tempo estabelecido: [{1:0}])
// 5007 - Erro: Falha na conexão: [{0:0}] (Causa provável: mensagem maior que a permitida)
// 5008 - Erro: Falha na conexão: [{0:0}] (Causa provável: Servidor com problemas)
// 5009 - Erro: Falha na conexão: [{0:0}] (Causa provável: Serviço não implementado)
// 5010 - Erro: Falha na conexão: [{0:0}] (Causa provável: Serviço temporariamente indisponível, servidor sem recursos para atender a solicitação)
// 5011 - Erro: Falha na conexão: [{0:0}] (Causa provável: Causa provável da falha na conexão: Rede indisponível)
// 5012 - Erro: Falha na conexão: [{0:0}] (Causa provável: Versão do SOAP não suportada)
// 5013 - Erro: Falha na conexão: [{0:0}] (Causa provável: Web Service não consumido, não houve nenhum retorno ou resposta)
// 5014 - Erro: Falha na conexão: [{0:0}] (Causa provável: Web Service não consumido, falha desconhecida, veja a mensagem de erro)
// 5015 - Erro: Falha na conexão: Tempo limite de time-out alcançado [{0:0} ms] - [{1:0}]
// 5016 - Erro: Falha na conexão: Falha da Biblioteca Criptografica: [{0:0}]
// 5017 - Erro: Falha ao tratar o XML de retorno do WS: [{0:0}]
// 5018 - Erro: Web Service não devolveu nehuma mensagem de resposta.
// 5019 - Erro: O município: [{0:0}] não oferece o WS: [{1:0}].
// 5101 - Erro: A mensagem de retorno do WS não é um XML válido: [{0:0}]
// 5102 - Erro: Tag cStat inexistente na mensagem de retorno  [{0:0}]
// 5103 - Erro: Tag xMotivo inexistente na mensagem de retorno  [{0:0}]
// 5104 - Erro: Tag [{0:0}] inexistente na mensagem de retorno  [{1:0}]
// 5105 - Erro: O WS não devolveu nenhum resultado
// 5201 - Erro: O código do tipo de ambiente [{0:0}]  informado diferente de 1 - produção e 2 - homologação
// 5202 - Erro: Ocorreu um erro de validação do XML do arquivo WSNFSE.xml: [{0:0}]
// 5203 - Erro: Inexiste url para o município [{0:0}] informada no ambiente [{1:0}]  desejado, verifique se existe atualização do arquivo WSNFSE.xml disponível.
// 5204 - Erro: Arquivo WSNFSE.XML com a URL do WS não localizado em {0:0}
// 5205 - Erro: Ocorreu um erro inesperado no processamento da URL do município [{0:0}] : [{1:0}]
// 5601 - Erro: O parâmetro cMuncipio não foi informado
// 5602 - Erro: A DLL ainda não foi customizada para o município: [{0:0}], contate a FlexDocs para verificar a possibilidade de customizar a DLL para o município desejado pelo canal www.flexdocs.com.br/suporte
// 5603 - Erro: O código da UF do parâmetro cMunicipio: [{0:0}] é inválido.
// 5604 - Erro: O DV do parâmetro cMunicipio: [{0:0}] é inválido.
// 5605 - Erro: O parâmetro CNPJPrestador não foi informado.
// 5606 - Erro: O parâmetro CNPJPrestador: [{0:0}] não é um CNPJ válido.
// 5701 - Erro: O lote não é um XML válido: [{0:0}]
// 5702 - Erro: A tag Cnpj do lote não localizado: [{0:0}]
// 5703 - Erro: Falha ao acessar o conteúdo da tag Cnpj
//
//  Declaração do parâmetros da DLL
//
//
// =============================================================================================================================================
//                                                  Inicialização dos parâmetros de chamada da DLL
// =============================================================================================================================================

// recomendamos o uso de variável global ou uso de tabela para manter a informação como licenca, ambiente, certificado, proxy, usario, senha, etc.


//  IMPORTANTE: todas as variáveis utilizadas como parâmetro da DLL devem ser inicialiadas

proxy :='';
usuario :='';
senha :='';

// informar licenca de uso para ambiente de produção
mostrarmensagem('Verificando Retorno WebService NFSe: '+nomecliente);
licenca :=cadempresa.dataSet.FieldByName('LICENCANFSE').AsString;
//'b06ccea9f950a4e62c2be9540efc61c3943736496e217adfff0ad7e925d84ec5bb9c21671ea91562dcc3419e99532c5725a23e3b3cfcc4c18c03e57c368e173a';

// informar com o assunto da certificado digital
// Ex.: "CN=NFe - Associacao NF-e:99999090910270, C=BR, L=PORTO ALEGRE, O=Teste Projeto NFe RS, OU=Teste Projeto NFe RS, S=RS"

// aproveitando o nome certificado que está armazenado no txCertificado

certificado := cadempresa.dataSet.FieldByName('NFS_CERT').AsString;


// inicializa parâmetro do ambiente

If cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Produção' then
 ambiente := 1
else
 ambiente := 2;


msgDados := '';
cResultado := 0;
msgRetWS :='';
versao := '1';        // versão do XML, necessário informar para consumir o WS da prefeitura de SP
msgResultado :='';
ListaMensagemRetorno :='';
protocolo := '';
listaMensagemAlertaRetorno:='';
listanfse:='';
ListaMensagemRetorno:='';
SoapMsgTx:='';
SoapMsgRx:='';

// pega o CNPJ do emissor

CNPJPrestador := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;

// pega código do município do IBGE

 cMunicipio :=cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;
 //cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;



// limpa text box

//   As prefeituras de SP/SP, Campo Grande/MS, Belem/PA, Campinas/SP, Nova Iguacu/RJ, Teresina/PI e Uberlandia/MG não oferecem a consulta situação do lote,



IMPrestador := cadempresa.dataSet.FieldByName('IM_EMP').AsString;
if dataSet.FieldByName('COD_RPS').AsString <> '' then
 NumeroRPS   := dataSet.FieldByName('COD_RPS').AsString
else
 NumeroRPS   := BuscasMnt.FieldByName('COD_RPS').AsString;

SerieRPS    := cadempresa.dataSet.FieldByName('serie_serv_nfe').AsString;

TipoRPS     :='1';



Util := CreateOleObject('NFSe_Util.util');

it:=0;

if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').asinteger = 2 then
begin
  if cadempresa.dataSet.FieldByName('USARENVRPSSINCRONO').AsString = 'S' then
  begin
   msgRetWS := Util.ConsultaNFSeRPS_v2(cMunicipio, certificado, ambiente, versao, msgDados, cResultado,
   msgResultado, CNPJPrestador, IMPrestador, NumeroRPS, SerieRPS, TipoRPS,listaNFSe, listaMensagemRetorno,SoapMsgTx,SoapMsgRx, proxy, usuario, senha, licenca);
   if ListaMensagemRetorno <> ''  then
    Messagebox(0,PWideChar('Problemas com o Lote!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
  end
  else
  begin
    while it <= 10 do
    begin
     mostrarmensagem('Verificando Retorno por RPS WebService NFSe: '+nomecliente);
     Screen.cursor := crHourglass;
     msgRetWS := Util.ConsultaNFSeRPS_v2(cMunicipio, certificado, ambiente, versao, msgDados, cResultado,
     msgResultado, CNPJPrestador, IMPrestador, NumeroRPS, SerieRPS, TipoRPS,listaNFSe, listaMensagemRetorno,SoapMsgTx,SoapMsgRx, proxy, usuario, senha, licenca);
     Screen.cursor := crDefault;
     Arquivo:=msgRetWS;
     if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarNfseRpsResposta') <> '' then
     begin
      if pos('S50',Grupo) > 0 then
       it:=it+1
      else
       break;
     end
     else
      it:=it+1;
     mostrarmensagem('');
     Sleep(3000);
    end;
    if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarNfseRpsResposta') <> '' then
    begin
      if pos('S50',Grupo) > 0 then
      begin
        Messagebox(0,PWideChar('Lote em Processamento. Consulte mais tarde!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
        vcoderro:='S50';
      end;
    end;
  end;
end
else
begin
  while it <= 10 do
  begin
   mostrarmensagem('Verificando Retorno por RPS WebService NFSe: '+nomecliente);
   Screen.cursor := crHourglass;
   msgRetWS := Util.ConsultaNfseRPS(cMunicipio, certificado, ambiente, versao, msgDados, cResultado, msgResultado, CNPJPrestador, IMPrestador, NumeroRPS, SerieRPS, TipoRPS, listaMensagemRetorno, proxy, usuario, senha, licenca);
   Screen.cursor := crDefault;
   Arquivo:=msgRetWS;
   if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarNfseRpsResposta') <> '' then
   begin
    if pos('S50',Grupo) > 0 then
     it:=it+1
    else
     break;
   end
   else
    it:=it+1;
   mostrarmensagem('');
   Sleep(3000);
  end;
  if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarNfseRpsResposta') <> '' then
  begin
    if pos('S50',Grupo) > 0 then
    begin
      Messagebox(0,PWideChar('Lote em Processamento. Consulte mais tarde!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
      vcoderro:='S50';
    end;
  end;
end;
result:=msgRetWS;
end;

function TClassNfSe.sigiss_CancelarNFSE(ANota: Integer): Boolean;
var
  AwsSigISS: WebService_SigISSPortType;
  ARetornoNota: tcRetornoNota;
  ADadosCancelaNota: tcDadosCancelaNota;
  ADescricaoErros: tcDescricaoErros;
  I: Integer;
  Afs: TFormatSettings;
begin
  Result := False;
  AwsSigISS := GetWebService_SigISSPortType(False, sigiss_getUrlWS(FdocsNFSe.amb_prod));
  try
    ADadosCancelaNota := tcDadosCancelaNota.Create;
    try
      with ADadosCancelaNota do
      begin
        ccm  := StrToIntDef(cadempresa.dataSet.FieldByName('IM_EMP').AsString.Replace('.', '', [rfReplaceAll]).Replace('-', '', [rfReplaceAll]), 0);
        cnpj := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
        senha := decodifica(cadempresa.dataSet.FieldByName('LICENCANFSE').AsString);
        nota := ANota;
        motivo := vdesccancnfse;
        if Assigned(FdocsNFSe.aut_nfse) then
          email := FdocsNFSe.aut_nfse.email_tomador;
      end;

    except on E: Exception do
      begin
        Result := False;
        if not FSilentMode then
          if Application.MessageBox('Erro ao Cancelar NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar('Erro ao obter dados do prestador: ' = e.Message), PWideChar('Error'), MB_OK);
      end;
    end;

    ARetornoNota := tcRetornoNota.Create;
    try
      AwsSigISS.CancelarNota(ADadosCancelaNota, ARetornoNota, ADescricaoErros);

      if Assigned(ARetornoNota) then
      begin
        if ARetornoNota.Resultado = 1 then
        begin
          FdocsNFSe.can_ret := ARetornoNota;
          sigiss_GravarDocEletronico;

          Result := sigiss_ConsultarNFSE(ANota);
        end
        else
        begin
          for I := Low(ADescricaoErros) to High(ADescricaoErros) do
            if Assigned(ADescricaoErros[I]) then
              if ADescricaoErros[I].DescricaoErro.ToUpper.StartsWith('E48') then //Nota fiscal já se econtra cancelada
              begin
                if Assigned(FdocsNFSe.rps_resc) then
                FdocsNFSe.rps := FdocsNFSe.rps_resc;
                Result := sigiss_ConsultarNFSE(ANota);
              end;

          if not Result then
            raise Exception.Create('Erro ao cancelar nota no webservice da Prefeitura SIGISS');

        end;
      end
      else
        raise Exception.Create('Erro ao cancelar nota no webservice da Prefeitura SIGISS. Sem retorno do WS');

    except on E: Exception do
      begin
        Result := False;
        if not FSilentMode then
          if Application.MessageBox('Erro ao Cancelar NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar(E.Message + #13 + sigiss_getListRepErrosWS(ADescricaoErros).Text), PWideChar('Error'), MB_OK);
      end;
    end;
  finally
    AwsSigISS := nil;
  end;
end;

function TClassNfSe.sigiss_ConsultarNFSE(ANota: Integer): Boolean;
var
  AwsSigISS: WebService_SigISSPortType;
  ADadosNota: tcDadosNota;
  ADadosPrestador: tcDadosPrestador;
  ADescricaoErros: tcDescricaoErros;
  I: Integer;
  Afs: TFormatSettings;
begin
  Result := False;
  AwsSigISS := GetWebService_SigISSPortType(False, sigiss_getUrlWS(FdocsNFSe.amb_prod));
  try
    ADadosPrestador := tcDadosPrestador.Create;
    try
      with ADadosPrestador do
      begin
        ccm              := StrToIntDef(cadempresa.dataSet.FieldByName('IM_EMP').AsString.Replace('.', '', [rfReplaceAll]).Replace('-', '', [rfReplaceAll]), 0);
        cnpj             := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
        senha            := decodifica(cadempresa.dataSet.FieldByName('LICENCANFSE').AsString);
        aliquota_simples := Format('%0.2f', [cadempresa.dataSet.FieldByName('aliq_simples_iss').AsFloat]);

        SqlOpen('select contador.crc, estados.sigla_uf from contador' +
                ' left join estados on estados.codigo_uf = contador.codigo_uf' +
                ' where contador.cod_contador = ' + cadempresa.dataSet.FieldByName('cod_contador').AsInteger.ToString +
                ' and contador.cod_empresa = ' + cadempresa.codempresa.ToString);

        crc              := apenasNumeros(buscas.FieldByName('crc').AsString.Trim);//, 0);
        crc_estado       := buscas.FieldByName('sigla_uf').AsString.Trim;
      end;

    except on E: Exception do
      begin
        Result := False;
        if not FSilentMode then
          if Application.MessageBox('Erro ao Consultar NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar('Erro ao obter dados do prestador: ' = e.Message), PWideChar('Error'), MB_OK);
      end;
    end;

    ADadosNota := tcDadosNota.Create;
    try
      AwsSigISS.ConsultarNotaPrestador(ADadosPrestador, ANota, ADadosNota, ADescricaoErros);

      if Assigned(ADadosNota) then
      begin
        ADadosNota.valor              := ADadosNota.valor.Replace('.', '', [rfReplaceAll]);
        ADadosNota.base               := ADadosNota.base.Replace('.', '', [rfReplaceAll]);
        ADadosNota.aliquota_atividade := ADadosNota.aliquota_atividade.Replace('.', '', [rfReplaceAll]);
        ADadosNota.iss                := ADadosNota.iss.Replace('.', '', [rfReplaceAll]);
        ADadosNota.ISSRetido          := IfThen((not FdocsNFSe.amb_prod) and (FdocsNFSe.sit_orig = 'tt'),
                                                'SIM', ADadosNota.ISSRetido);//remover essa linha depois dos testes

        if ADadosNota.StatusNFe.Trim.ToUpper.Equals('ATIVA') then
          FdocsNFSe.aut_nfse := ADadosNota
        else
          FdocsNFSe.can_nfse := ADadosNota;

        sigiss_GravarDocEletronico;

        if ADadosNota.StatusNFe.Trim.ToUpper.Equals('ATIVA') then
        begin
            //Verificar aqui o retorno do webservice
          FnumeroNFSe      := ADadosNota.nota.ToString;
          Fcodigover       := ADadosNota.autenticidade;
          Fdiscrimina      := ADadosNota.descricao;
          Foutrasinf       := ADadosNota.LinkImpressao;
          FCodigoCnae      := '';
          FRpsNFSe         := ADadosNota.id_sis_legado;
          vvalNFSe         := Format('%0.2f', [StrToFloat(ADadosNota.valor)]).Replace(',','.', [rfReplaceAll]);

          Afs := TFormatSettings.Create();
          Afs.DateSeparator := '-';
          Afs.TimeSeparator := ':';
          Afs.ShortDateFormat := 'YYYY-MM-DD';
          Afs.ShortTimeFormat := 'hh:nn:ss';

          FDataEmissaoNFSe := StrToDateTimeDef(ADadosNota.dt_conversao, now, Afs);
          gravaRetornoWs;

          Result := True;
          sigiss_retearDadosRecebidosNFSe(ADadosNota, StrToIntDef(FdocsNFSe.rps.id_sis_legado, 0))
        end;

        Result := True;
      end
      else
        raise Exception.Create('Erro ao consultar nota no webservice da Prefeitura SIGISS. Sem retorno do WS');

    except on E: Exception do
      begin
        Result := False;
        if not FSilentMode then
          if Application.MessageBox('Erro ao Consultar NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar(E.Message + #13 + sigiss_getListRepErrosWS(ADescricaoErros).Text), PWideChar('Error'), MB_OK);
      end;
    end;
  finally
    AwsSigISS := nil;
  end;
end;

constructor TClassNfSe.create;
begin
  inherited;
 dataSet:=TClientDataSet(DtmNFEHW.CdsNFSe);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
 buscaadc:=TIBQuery(DtmNFEHW.IbBuscasAdic);
 buscanfscanc:=TIBQuery(DtmNFEHW.IbNFSeCanceladas);
 osselec:=TClientDataSet(DtmNFEHW.cdsOsparaNFSe);
 BuscasMnt:=TClientDataSet(DtmNFEHW.CdsMontaNFSe);
 //FrmRelRPSNFSe:=TFrmRelRPSNFSe.create(Application);
 vospesq:='0';
 nomecliente:='';
// cadempresa.dadosGNfe;
// iniciaNFSE;
// cadclfor:=TClassCliente.create;
// caditens:=TClassItNfVenda.create;
  FSilentMode := False;
  FSendMail   := True;
  FSendBoleto := True;
  FImprimir   := True;
end;

function TClassNfSe.Deixarapenasumnivel(venv: string): WideString;
var
 vtemp: string;
begin
 vtemp:=Arquivo;
 if rExtrai(1,venv+'OrgaoGerador') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 if rExtrai(1,venv+'PrestadorServico') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 if rExtrai(1,venv+'IntermediarioServico') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 if rExtrai(1,venv+'TomadorServico') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 if rExtrai(1,venv+'IdentificacaoRps') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 Result:=vtemp;
end;

destructor TClassNfSe.destroy;
begin
  dataSet.close;
  buscaadc.Close;
  buscanfscanc.close;
  inherited;
end;


function TClassNfSe.DetalhesRPS(vtp: integer): boolean;
begin
 if vtp = 1 then
 begin
   Result := True;
   if not dataSet.IsEmpty then
   begin
     buscanfscanc.close;
     buscanfscanc.sql.text:='select NUM_NFSE as Num_NFSe,COD_RPS as Cod_Rps,N_OS as Num_OrdemServico,COD_CLIENTE as Cod_cliente,'+
     'NOME_CLIENTE as Nome_Cliente,DATA_CANC as DataCancelamento,VALOR_NFSE as Valor_NFSe,SERIE as Numero_Serie,'+
     'SUB_SERIE as Numero_SubSerie,motivo_cancelamento,EMISSAO_NFSE as DataEmissao_NFSE,'+
     'CNAE,CTISS as Cod_Trib_Municipio,ALIQ_ISS as Aliq_Iss,nfs_servico as codigo_serv_nfse,iss_retido,'+
     'CODIGO_VERWSNFSE as Codigo_verificacao from NFSE_CANCELADAS where n_os = '+dataSet.FieldByName('NPED').AsString+
     ' and cod_empresa = '+inttostr(cadempresa.codempresa)+' order by n_os,num_nfse';
     buscanfscanc.open;
     TFloatField(buscanfscanc.FieldByName('VALOR_NFSE')).DisplayFormat:='#,##0.00';
     if dataSet.FieldByName('COD_RPS').AsInteger <> 0  then
     begin
       buscaadc.close;
       buscaadc.sql.text:='select tipo,nped as N_OrdemServico,cod_rps as codigo_rps,'+
       'nfs_servico as codigo_serv_nfse,cnae_serv as cnae_servico,emissao_rps as data_emissao_rps,' +
       'NPROTNFSE as N_ProtocoloRPS,ISS_RETIDO as Iss_retido,LOTE_NFSE as LoteNFSe,RESP_WS_NFSE as Resposta_WS,' +
       'CODIGO_VERWSNFSE as Cod_Verificacao,OUTRAS_INFNFSE as outras_informacoes,emissao_nfse as Data_NFSe,'+
       'IRRF_SERVICO as IRRF,ALIQ_ISS as Aliq_Iss,CTISS as Cod_Trib_Municipio from pedvenda_serv '+
       'where tipo = ''OS'' and cod_rps = '+dataSet.FieldByName('COD_RPS').AsString+
       ' and cod_empresa = '+inttostr(cadempresa.codempresa)+' and coalesce(status,'''') <> ''CANCELADO''';
       buscaadc.Open;
     end
     else
     begin
       if buscanfscanc.IsEmpty then
       begin
        Application.MessageBox(PWideChar('O.S. sem RPS e não possui cancelamentos para visualizações. Favor Enviar a RPS!'),PWideChar('Aviso'), MB_OK);
        Result := False;
       end;
     end;
   end;
 end
 else
  buscaadc.close;
end;

function TClassNfSe.enviaemailNFSe(vflag: integer;
  AAnexos: TStrings; AloadXML: Boolean): boolean;
var
 Util: OleVariant; // declarar a interface da DLL
 resultado :integer;
 eMailRemetente, nomeRemetente, emailDestinatario, emailBCC, assunto, mensagem, arquivos:widestring;
 smtpCliente, smtpPorta, smtpUsuario, smtpSenha, msgResultado,usassl,varq: widestring;
 para: string;
 vendarq: string;
 vusassl: boolean;
 mememail: TStrings;
 vListaDestinat: TStringList;
 I: Integer;
 ACBrMail1: TACBrMail;

 procedure verificarDestinatarios(pDestinatarios: string);
  var
    vTemp: string;
  begin
    vTemp := StringReplace(pDestinatarios, ',', ';', [rfReplaceAll]);

    if vListaDestinat = nil then
      vListaDestinat := TStringList.Create;

    vListaDestinat.Clear;

    if Pos(';', vTemp) = 0 then
      vListaDestinat.Add(Trim(vTemp))
    else
    begin
      while Pos(';', vTemp) > 0 do
      begin
        if Trim(Copy(vTemp, 1, Pos(';', vTemp) - 1)) <> '' then
          vListaDestinat.Add(Trim(Copy(vTemp, 1, Pos(';', vTemp) - 1)));
        vTemp := Copy(vTemp, Pos(';', vTemp) + 1, Length(vTemp));
      end;
      if Trim(vTemp) <> '' then
        vListaDestinat.Add(Trim(vTemp));
    end;
  end;

begin
  Result := true;
  FErrorSendEmail := False;
  if not FSendMail then
    Exit;

  if (BuscasMnt.FieldByName('COD_RPS').AsInteger = 0) then
  begin
    if not FSilentMode then
      Application.MessageBox(PWideChar('O.S. sem RPS e sem NF. Envie o RPS ou Consulte o WS por RPS'),PWideChar('Aviso'), MB_OK);
    Exit(false);
  end;

  para := BuscasMnt.FieldByName('email').AsString;
  if FSilentMode then
  begin
    if para.Trim.IsEmpty then
      Exit(False);
  end
  else
  begin
    if para.Trim.IsEmpty  then
      Application.MessageBox(PWideChar('Cliente não tem o email cadastrado'), PWideChar('Error'), MB_OK);

    if not InputQuery(strzero(BuscasMnt.FieldByName('COD_RPS').AsInteger,6)+'-'+BuscasMnt.FieldByName('RAZAO').AsString, 'Email de destino', Para) then
      Exit(False);

    if para.Trim.IsEmpty then
    begin
      Application.MessageBox(PWideChar('Email de destino precisa ser preenchida'),PWideChar('Error'), MB_OK);
      Exit(False);
    end;
  end;

  if vflag = 1 then // Flexdocs
  begin
    if result then
    begin
     zerarAtributos;
     pegadadosRPS;
     imprimirRPSNFSe(2);
     if numeroNFSe <> '' then
      vendarq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe\NFSe'+numeroNFSe+'.PDF'
     else
      vendarq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').
      AsString+'\NFSe\PDFNFSe\RPS'+strzero(buscasmnt.FieldByName('COD_RPS').AsInteger,14)+'.PDF';
     if FileExists(vendarq) then
     begin
       Util := CreateOleObject('NFSe_Util.util'); // instancia a DLL
       eMailRemetente :=trim(cadempresa.vLOGIN_EMP);
       //cadempresa.dataSet.FieldByName('EMAIL_EMP').AsString;
       nomeRemetente :=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
       emailDestinatario := para; // destinatários separados por , ou ; se existir mais de um
       //emailBCC := 'contato@gmail.com.br'; // conta bcc;
       assunto := trim(cadempresa.vASSUNTO_NFE)+'(NFSe)'; // assunto
       mensagem := cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
       arquivos := vendarq; // anexos, com o caminho completo separados por , ou ; se existir mais de um
       smtpCliente := trim(cadempresa.vSMTP_EMP);
       smtpPorta :=cadempresa.dataSet.FieldByName('PORTA_SMTPTSL').AsString;
       if cadempresa.dataset.FieldByName('EMAIL_USASSL').AsString = 'S' then
         usassl:='1'
       else
         usassl:='0';
       //'587'; // porta do smtp
       smtpUsuario := trim(cadempresa.vLOGIN_EMP); // usuário do smtp
       smtpSenha := trim(cadempresa.vEMAIL_SENHA); // senha
       msgResultado := '';
       mostrarmensagem('Enviando email: '+nomecliente);
  //     resultado := util.EnvEmail(eMailRemetente, nomeRemetente, emailDestinatario, emailBCC, assunto,
  //     mensagem, arquivos, smtpCliente, smtpPorta,usassl, smtpUsuario, smtpSenha, msgResultado);
       resultado :=util.EnvEmail2(eMailRemetente, nomeRemetente, emailDestinatario, emailBCC, assunto,
       mensagem, arquivos, smtpCliente, smtpPorta,usassl, smtpUsuario, smtpSenha,'0','0', msgResultado);

       mostrarmensagem('');
       if not FSilentMode then
         if numeroNFSe <> '' then
           MessageDlg( 'NF Resultado do envio:'#13+#13+msgResultado, mtInformation, [mbOk], 0)
         else
           MessageDlg( 'RPS Resultado do envio:'#13+#13+msgResultado, mtInformation, [mbOk], 0);
     end;
    end;
  end;

  ACBrMail1 := TACBrMail.Create(Application);
  try

    if  (vflag = 2) or (vflag = 3) then
    begin

      if (dataSet.FieldByName('N_NF').AsInteger > 0) and
        (BuscasMnt.FieldByName('emissao_rps').AsDateTime >= EncodeDate(2018, 04, 02)) and
        (cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701') then //valadares sistema sigiss
        vflag := 4;// para nao carregar o xml, nota sigiss

      if vflag = 3 then // Nota não carregada ACBRNFSE
      begin
        if not loadXMLdoBanco('NFSe_RPS' + dataset.FieldByName('cod_rps').AsString.Trim) then
        begin
          ACBrNFSe1.NotasFiscais.Clear;
          varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe\NFSe\'+trim(dataset.FieldByName('N_NF').AsString)+
          '-nfse.xml';
          if FileExists(Varq) then
          begin
            ACBrNFSe1.NotasFiscais.LoadFromFile(varq);
            acrescentaendACimp;
            vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
          end
          else
            Application.MessageBox(PWideChar('Arquivo XML da NFSe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
        end
        else
          vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
      end;
      if result then
      begin
        assunto:=trim(cadempresa.vASSUNTO_NFE)+'(NFSe)';
        mensagem := cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
        mememail:=TStringList.Create;
        Mememail.Text:=cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
        if vflag = 4 then
        begin
          Mememail.Add('');
          Mememail.Add('Atenção -- O xml contido neste email não é da NFS-e, o XML da NFS-e é enviado pela própria prefeitura de Governador Valadares');
        end;

        if cadempresa.vEMAIL_USASSL = 'S' then
         vusassl:=true
        else
         vusassl:=false;
        nomeRemetente :=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
        eMailRemetente :=trim(cadempresa.vLOGIN_EMP);

        ACBrNFSe1.MAIL := ACBrMail1;
        ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
        ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
        ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
        ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
        ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
        ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
        ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
        ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
        ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
        ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
        verificarDestinatarios(para);
        para := vListaDestinat[0];
        vListaDestinat.Delete(0);

        if vflag = 4 then
        begin
          FdocsNFSe := sigiss_LoadDocEletronico(dataSet.FieldByName('cod_rps').AsInteger);
          sigiss_setNFetoACBr(ACBrNFSe1);
        end;

        begin
        try
        ACBrNFSe1.NotasFiscais.Items[0].EnviarEmail(Para, assunto,
          Mememail
          , True  // Enviar PDF junto
          , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
          , AAnexos); // Lista de anexos - TStringsACBrMail1
        except on E: Exception do
          begin
            FErrorSendEmail := True;
            raise Exception.Create(e.Message);
          end
        end;
        end;
  //      verificarDestinatarios(para);
  //      for I := 0 to vListaDestinat.Count - 1 do
  //      ACBrNFSe1.NotasFiscais.Items[0].EnviarEmail(trim(cadempresa.vSMTP_EMP),
  //                                                 inttostr(cadempresa.vPORTA_SMTP),
  //                                                 trim(cadempresa.vLOGIN_EMP),
  //                                                 trim(cadempresa.vEMAIL_SENHA),
  //                                                 eMailRemetente,
  //                                                 vListaDestinat[I],                 // e-mail do destinatário
  //                                                 assunto, // Assunto
  //                                                 Mememail.Lines,     // Mensagem
  //                                                 vusassl,   // SSL
  //                                                 True,                 // Enviar em PDF
  //                                                 nil,                  // sCC
  //                                                 nil,                  // Anexos
  //                                                 True,                 // Pede Confirmação de Recebimento
  //                                                 True,                 // Aguarda o Envio
  //                                                 nomeremetente,    // Nome do remetente
  //                                                 True,                 // TLS
  //                                                 True);                // Usar Thread
        FreeAndNil(mememail);
        if not FSilentMode then
          Application.MessageBox(PWideChar('Email enviado com sucesso'),PWideChar('Aviso'), MB_OK);
      end;
    end;
  finally
    if Assigned(ACBrMail1) then
      FreeAndNil(ACBrMail1);
  end;
end;

function TClassNfSe.EnviarNFSEAC: boolean;
var
  Aerrows: string;
begin
  Result := True;

  var metodoNFSe := EMetodoNFSe.Envio;

  try
    verificarCaracteresNFSe;

    {$IFDEF USE_NFSEX}
    ClearErrosNFSe;

    ACBrNFSe1.Emitir(nroLote, meAutomatico, False);

    Aerrows := GetErrosNFSe().Trim;

    if not Aerrows.IsEmpty then
      raise Exception.Create(Aerrows);

//    if ACBrNFSe1.WebService.Emite.Erros.Count > 0 then // os erros serão montados no try except
//      raise Exception.Create('');

    ClearErrosNFSe;

    var raiseErroConsulta := False;

    if (ACBrNFSe1.WebService.Emite.NumeroNota.Trim.IsEmpty) and
       (not ACBrNFSe1.Provider.ConfigGeral.ConsultaSitLote) and
       (ACBrNFSe1.Provider.ConfigGeral.ConsultaLote) and
       (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero.Trim.IsEmpty) then
    begin
      var tentativasAtuais := 0;
      Sleep(ACBrNFSe1.Configuracoes.WebServices.AguardarConsultaRet);

      while (tentativasAtuais < ACBrNFSe1.Configuracoes.WebServices.Tentativas) do
      begin

        ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Clear;
        ACBrNFSe1.ConsultarLoteRps(ACBrNFSe1.WebService.Emite.Protocolo, ACBrNFSe1.WebService.Emite.Lote);

        if not ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero.Trim.IsEmpty then
        begin
          raiseErroConsulta := False;
          metodoNFSe := EMetodoNFSe.ConsultaLote;
          Break;
        end
        else if ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count > 0 then // os erros serão montados no try except
          raiseErroConsulta := True;

        Inc(tentativasAtuais);
        Sleep(ACBrNFSe1.Configuracoes.WebServices.IntervaloTentativas);
      end;

    end;

    if raiseErroConsulta then
    begin
      Aerrows := GetErrosNFSe().Trim;

      if Aerrows.IsEmpty then
        raise Exception.Create(Aerrows);
    end;

    {$ELSE}

    if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
      ACBrNFSe1.EnviarSincrono(nroLote, False)
    else
    begin
      ACBrNFSe1.Enviar(nroLote, false);
    end;

    {$ENDIF}

  except
    on e: exception do
    begin

      Result := False;

      if not FSilentMode then
      begin
        Aerrows := e.Message.Trim;

        {$IFDEF USE_NFSEX}
            {
        if ACBrNFSe1.WebService.Emite.Erros.Count > 0 then
          Aerrows := StrConcat([Aerrows, sLineBreak, ACBrNFSe1.WebService.Emite.Erros.Items[0].Descricao]);

        if (ACBrNFSe1.Configuracoes.Geral.ConsultaLoteAposEnvio) and
           (ACBrNFSe1.WebService.Emite.Protocolo <> '') then
        begin

           if (ACBrNFSe1.Provider.ConfigGeral.ConsultaSitLote) and
              (ACBrNFSe1.WebService.ConsultaSituacao.Erros.Count > 0) then
             Aerrows := StrConcat([Aerrows, sLineBreak, ACBrNFSe1.WebService.ConsultaSituacao.Erros.Items[0].Descricao]);

          if (ACBrNFSe1.Provider.ConfigGeral.ConsultaLote) and
             (ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count > 0) then
            Aerrows := StrConcat([Aerrows, sLineBreak, ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Items[0].Descricao]);
        end;
        }

        if ShowConfirmacao('Erro ao Enviar o NFSe. Mostrar Erro?', MB_YESNO + MB_DEFBUTTON2) = IDYES then
           ShowErro(Aerrows);

        {$ELSE}

        if (Aerrows.IsEmpty) and
           (cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2) and
           (Assigned(ACBrNFSe1.WebServices.EnviarSincrono)) and
           (not ACBrNFSe1.WebServices.EnviarSincrono.Msg.Trim.IsEmpty) then
           Aerrows := ACBrNFSe1.WebServices.EnviarSincrono.Msg.Trim
        else if (Aerrows.IsEmpty) and
           (cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger <> 2) and
           (Assigned(ACBrNFSe1.WebServices.ConsLote)) and
           (not ACBrNFSe1.WebServices.ConsLote.Msg.Trim.IsEmpty) then
           Aerrows := ACBrNFSe1.WebServices.ConsLote.Msg.Trim
        else if (Aerrows.IsEmpty) then
          Aerrows := 'Falha com internet ou Erro interno do WebService da prefeitura' + sLineBreak +
                     'Se o erro persistir por favor contacte o suporte técnico';
        if application.messagebox('Erro ao Enviar o NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
           Application.MessageBox(PWideChar(Aerrows), PWideChar('Error'), MB_OK);

        {$ENDIF}
      end;
    end;
  end;

  if (not result) and (cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger <> 2) then
  begin
    try
      {$IFDEF USE_NFSEX}

      if not MatchText(ACBrNFSe1.WebService.ConsultaLoteRps.Protocolo.Trim, ['0', '']) then
      begin
        Fprotoloco := ACBrNFSe1.WebService.ConsultaLoteRps.Protocolo.Trim;
        gravaProtocoloWs;
      end;

      {$ELSE}

      if (Trim(ACBrNFSe1.WebServices.ConsLote.Protocolo) <> '0') and (Trim(ACBrNFSe1.WebServices.ConsLote.Protocolo) <> '') then
      begin
        Fprotoloco:=ACBrNFSe1.WebServices.ConsLote.Protocolo;
        gravaProtocoloWs;
      end;

      {$ENDIF}
    except
    end;
  end;

  if result then
    if not VerificaRetornoAC(metodoNFSe) then
      Result := False;
end;

function TClassNfSe.sigiss_EnviarNFSE: Boolean;
var
  AwsSigISS: WebService_SigISSPortType;
  ARetornoNota: tcRetornoNota;
  ADescricaoErros: tcDescricaoErros;
  I: Integer;
  AlastErro: TStrings;
  NumeroNota: Integer;
  NumeroNotaMensagemErro: string;
begin
  Result := False;
  FdocsNFSe.amb_prod := cadempresa.dataSet.FieldByName('webserv_ambiente').AsString = 'Produção';
  FdocsNFSe.dhenvio  := FormatDateTime('DD/MM/YYYY hh:nn:ss', Now);

  AwsSigISS := GetWebService_SigISSPortType(False, sigiss_getUrlWS(FdocsNFSe.amb_prod));
  try
    ARetornoNota := tcRetornoNota.Create;
    try
      FdocsNFSe.sit_orig     := FdocsNFSe.rps.situacao;
      FdocsNFSe.rps.situacao := IfThen(not FdocsNFSe.amb_prod, 'tp', FdocsNFSe.rps.situacao);//aqui sempre envia como tp., pois o ambiente de homologacao nao aceita tt

      AwsSigISS.GerarNota(FdocsNFSe.rps, ARetornoNota, ADescricaoErros);
      if Assigned(ARetornoNota) then
      begin
        if ARetornoNota.Resultado = 1 then
        begin
          FdocsNFSe.aut_ret  := ARetornoNota;
          sigiss_GravarDocEletronico;

          SqlExec('update pedvenda_serv set codigo_verwsnfse = ' + ARetornoNota.autenticidade.QuotedString +
                  ', modelo_NFSe = ''55'', n_nf = ' + ARetornoNota.Nota.ToString +
                  ' where tipo = ''OS'' and cod_empresa = ' + cadempresa.codempresa.ToString +
                  ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                  ' and coalesce(status,'''') <> ''CANCELADO''').Transaction.Commit;

          Result := sigiss_ConsultarNFSE(ARetornoNota.Nota);
        end
        else
        begin
          for I := Low(ADescricaoErros) to High(ADescricaoErros) do
            if Assigned(ADescricaoErros[I]) then
              if ADescricaoErros[I].DescricaoErro.ToUpper.StartsWith('E38') then //id já utilizado, no caso COD_RPS
              begin
                NumeroNota := SqlOpen('select distinct n_nf from pedvenda_serv' +
                                      ' where tipo = ''OS'' and cod_empresa = '+cadempresa.codempresa.ToString  +
                                      ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                                      ' and coalesce(status,'''') <> ''CANCELADO''').FieldByName('n_nf').AsInteger;
                if NumeroNota <= 0 then
                begin
                  NumeroNotaMensagemErro := ADescricaoErros[I].DescricaoErro;
                  NumeroNotaMensagemErro := NumeroNotaMensagemErro.Substring(NumeroNotaMensagemErro.IndexOf('o da NF-e') + 9,
                                                                             NumeroNotaMensagemErro.Length).Trim;
                  NumeroNotaMensagemErro := NumeroNotaMensagemErro.Substring(0 , NumeroNotaMensagemErro.IndexOf('na data')).Trim;
                  NumeroNota             := StrToIntDef(NumeroNotaMensagemErro, 0);
                end;

                if Assigned(FdocsNFSe.rps_resc) then
                  FdocsNFSe.rps := FdocsNFSe.rps_resc;
                Result := sigiss_ConsultarNFSE( NumeroNota );
              end;

          if not Result then
            raise Exception.Create('Erro ao gerar nota no webservice da Prefeitura SIGISS');
        end;

        if Result then
          if not FSilentMode then
            if sigiss_setNFetoACBr(ACBrNFSe1) then
              ACBrNFSe1.NotasFiscais.Imprimir;
      end
      else
        raise Exception.Create('Erro ao gerar nota no webservice da Prefeitura SIGISS. Sem retorno do WS');

    except on E: Exception do
      begin
        Result := False;
        if not FSilentMode then
          if Application.MessageBox('Erro ao Enviar o NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          begin
            Application.MessageBox(PWideChar(E.Message + #13 + sigiss_getListRepErrosWS(ADescricaoErros).Text), PWideChar('Error'), MB_OK);
            if Assigned(FdocsNFSe) then
            begin
              AlastErro := TStringList.Create;
              try
                AlastErro.Add(TJson.JsonEncode(TJson.ObjectToJsonObject(FdocsNFSe)));
                AlastErro.SaveToFile(ExtractFilePath(Application.ExeName) + 'erro_obs_nfse.log');
              finally
                FreeAndNil(AlastErro);
      end;
    end;
          end;
      end;
    end;
  finally
    AwsSigISS := nil;
  end;
end;

function TClassNfSe.sigiss_getListRepErrosWS(ADescricaoErros: tcDescricaoErros): TStrings;
var
  I: Integer;
begin
  Result := TStringList.Create;

  for I := Low(ADescricaoErros) to High(ADescricaoErros) do
    if Assigned(ADescricaoErros[I]) then
      Result.Add('ID: '           + ADescricaoErros[I].id.ToString +
                 ' - Processo: '  + ADescricaoErros[I].DescricaoProcesso +
                 ' - Descrição: ' + UTF8ToString(ADescricaoErros[I].DescricaoErro));
end;

function TClassNfSe.sigiss_getUrlWS(Aamb_prod: Boolean): string;
begin
  Result := IfThen( Aamb_prod, 'https://valadares.sigiss.com.br:443/valadares/ws/sigiss_ws.php',
                               'https://testevaladares.sigiss.com.br:443/testevaladares/ws/sigiss_ws.php');
end;

function TClassNfSe.sigiss_getUrlWS: string;
begin
  Result := sigiss_getUrlWS(cadempresa.dataSet.FieldByName('webserv_ambiente').AsString = 'Produção');
end;

function TClassNfSe.sigiss_GravarDocEletronico: Boolean;
var
  AIDDoc_e: string;
  Aseqid: Integer;
begin
  AIDDoc_e := 'RPS' + FdocsNFSe.rps.id_sis_legado;
  try
    Aseqid := SqlOpen('select count(seqid) seqid from DOC_ELETRONICO' +
                      ' where ID_DOC = ' + AIDDoc_e.QuotedString +
                      ' and COD_EMPRESA = ' + cadempresa.codempresa.ToString).FieldByName('seqid').AsInteger;
    buscas.Close;
    buscas.SQL.Text := IfThen(Aseqid > 0,
                              'update DOC_ELETRONICO set DOC = :doc' +
                              ' where ID_DOC = :id_doc' +
                              ' and COD_EMPRESA = :cod_empresa',
                              'INSERT INTO DOC_ELETRONICO (COD_EMPRESA, ID_DOC, DOC)' +
                              ' VALUES (:cod_empresa, :id_doc, :doc)');
    buscas.ParamByName('cod_empresa').AsInteger := cadempresa.codempresa;
    buscas.ParamByName('id_doc').AsString       := AIDDoc_e;
    buscas.ParamByName('doc').AsString          := TJson.JsonEncode(TJson.ObjectToJsonObject(FdocsNFSe));
    buscas.Prepare;
    buscas.ExecSQL;
    buscas.Transaction.Commit;
    Result := True;

  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TClassNfSe.sigiss_LoadDocEletronico(Arps: Integer): TCollection_DocNFSe;
var
  AIDDoc_e: string;
  Ajson: string;
begin
  try
    if Assigned(FdocsNFSe) then
      FreeAndNil(FdocsNFSe);

    AIDDoc_e := 'RPS' + Arps.ToString;
    try
      Ajson     := SqlOpen('select DOC from DOC_ELETRONICO ' +
                           ' where ID_DOC = ' + AIDDoc_e.QuotedString +
                           ' and COD_EMPRESA = ' + cadempresa.codempresa.ToString).FieldByName('doc').AsString.Trim;
      buscas.Close;

      if not Ajson.IsEmpty then
        FdocsNFSe := TJson.JsonToObject<TCollection_DocNFSe>(Ajson);

      if not Assigned(FdocsNFSe) then
        FdocsNFSe := TCollection_DocNFSe.Create;

    except on E: Exception do
      begin
        if not Assigned(FdocsNFSe) then
          FdocsNFSe := TCollection_DocNFSe.Create;
      end;
    end;
  finally
    Result := FdocsNFSe;
  end;
end;

function TClassNfSe.sigiss_retearDadosRecebidosNFSe(ADadosNota: tcDadosNota; Arps: Integer): Boolean;
var
  Aitens: TObjectList<TAuxItensRateio>;
  Aitem: TAuxItensRateio;
  Avalor_b_nfse, Avalor_nfse, Aissret_servico: Extended;

  AchangeAliqISS: Boolean;

  procedure sumItens;
  var
    Ait: TAuxItensRateio;
  begin
    Avalor_b_nfse   := 0;
    Avalor_nfse     := 0;
    Aissret_servico := 0;
    AchangeAliqISS  := False;
    for Ait in Aitens do
    begin
      Avalor_b_nfse     := Avalor_b_nfse     + Ait.valor_b_nfse;
      Avalor_nfse       := Avalor_nfse       + Ait.valor_nfse;
      Aissret_servico   := Aissret_servico   + Ait.issret_servico;

      if RoundTo(Ait.aliq_iss, -2) <> RoundTo(StrToFloatDef(ADadosNota.aliquota_atividade, 0), -2) then
        AchangeAliqISS  := True;
    end;
  end;

begin
  if ADadosNota.OpcaoSimples.Trim.ToUpper.Substring(0, 1).Equals('S') then
    Exit;

  /// Este metodo tinha o objetivo de atualizar os valores que a própria prefeitura calculou, visto que o webservice
  ///  recusa a nota quando enviado a retenção e o cliente não aceita la na prefeitura, então achei melhor deixar como está
  ///  o valor que a prefeitura calcula é a base enviada no rps e a aliquota também enviada quando simples nacional,
  ///  o retorno da prefeitura vem informando apenas se a nota tem a retenção de iss ou nao, o valor liquido não é alterado, nem existe no retorno
  ///  as outras retenções também nao existem no retorno, mesmo enviando no rps o retorno nao existem os campos,
  ///  o sistema entao armazena as retenções como de costume e faz o calculo do valor liquido subtraindo as retenções

  try
    Aitens := TObjectList<TAuxItensRateio>.Create;
    try
      SqlOpen( 'select nped, tipo, cod_servico, nitem, cod_empresa, codigo_nop, valor_b_nfse, valor_nfse, issret_servico, aliq_iss' +
               ' from pedvenda_serv' +
               ' where tipo = ''OS''' +
               ' and cod_empresa = ' + cadempresa.codempresa.ToString +
               ' and cod_rps = ' + Arps.ToString +
               ' and coalesce(status, '''') <> ''CANCELADO''').First;

      while not buscas.Eof do
      begin
        Aitem := TAuxItensRateio.Create;
        with Aitem do
        begin
          nped             := buscas.FieldByName('nped').AsInteger;
          tipo             := buscas.FieldByName('tipo').AsString;
          cod_servico      := buscas.FieldByName('cod_servico').AsInteger;
          nitem            := buscas.FieldByName('nitem').AsInteger;
          cod_empresa      := buscas.FieldByName('cod_empresa').AsInteger;
          codigo_nop       := buscas.FieldByName('codigo_nop').AsFloat;
          base_rateio      := buscas.FieldByName('valor_b_nfse').AsFloat;
          valor_b_nfse     := buscas.FieldByName('valor_b_nfse').AsFloat;
          aliq_iss         := buscas.FieldByName('aliq_iss').AsFloat;
          valor_nfse       := buscas.FieldByName('valor_nfse').AsFloat;
          issret_servico   := buscas.FieldByName('issret_servico').AsFloat;
        end;
        Aitens.Add(Aitem);

        buscas.Next;
      end;

      sumItens;

      if (RoundTo(StrToFloatDef(ADadosNota.base, 0), -2) <> RoundTo(Avalor_b_nfse, -2)) or
         (RoundTo(StrToFloatDef(ADadosNota.valor, 0), -2) <> RoundTo(Avalor_nfse, -2)) or
         (AchangeAliqISS) or
         ((ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) and //retencao de iss com valor diferente
          (RoundTo(StrToFloatDef(ADadosNota.iss, 0), -2) <> RoundTo(Aissret_servico, -2)))or
         ((not ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) and//sem retencao de iss com valor retido no sistema
          (Aissret_servico > 0)) then
      begin
        for Aitem in Aitens do
        begin
          if RoundTo(StrToFloatDef(ADadosNota.base, 0), -2) <> RoundTo(Avalor_b_nfse, -2) then
            Aitem.valor_b_nfse := RoundTo( StrToFloatDef(ADadosNota.base, 0) / Avalor_b_nfse * Aitem.base_rateio , -2);

          if RoundTo(StrToFloatDef(ADadosNota.valor, 0), -2) <> RoundTo(Avalor_nfse, -2) then
            Aitem.valor_nfse := RoundTo( StrToFloatDef(ADadosNota.valor, 0) / Avalor_b_nfse * Aitem.base_rateio , -2);

          if AchangeAliqISS then
            Aitem.aliq_iss := StrToFloatDef(ADadosNota.aliquota_atividade, 0);

          if ((ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) and
            (RoundTo(StrToFloatDef(ADadosNota.iss, 0), -2) <> RoundTo(Aissret_servico, -2))) then
            Aitem.issret_servico := RoundTo( StrToFloatDef(ADadosNota.iss, 0) / Avalor_b_nfse * Aitem.base_rateio , -2);

          if (not ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) then
            Aitem.issret_servico := 0;
        end;
      end;

      sumItens;

      if (RoundTo(StrToFloatDef(ADadosNota.base, 0), -2) <> RoundTo(Avalor_b_nfse, -2)) then
        Aitens.First.valor_b_nfse := Aitens.First.valor_b_nfse + (StrToFloatDef(ADadosNota.base, 0) - Avalor_b_nfse);

      if (RoundTo(StrToFloatDef(ADadosNota.valor, 0), -2) <> RoundTo(Avalor_nfse, -2)) then
        Aitens.First.valor_nfse := Aitens.First.valor_nfse + (StrToFloatDef(ADadosNota.valor, 0) - Avalor_nfse);

      if ((ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) and
         (RoundTo(StrToFloatDef(ADadosNota.iss, 0), -2) <> RoundTo(Aissret_servico, -2))) then
        Aitens.First.issret_servico := Aitens.First.issret_servico + (StrToFloatDef(ADadosNota.iss, 0) - Aissret_servico);

      buscas.Close;
      buscas.SQL.Text := ' update pedvenda_serv set' +
                         ' valor_b_nfse = :valor_b_nfse,' +
                         ' valor_nfse = :valor_nfse - (:issret_servico +' +
                         '   coalesce(irrf_servico, 0) + coalesce(pisrf_servico, 0) + coalesce(cofinsrf_servico, 0) + coalesce(csslrf_servico, 0) ) ,' +
                         ' aliq_iss = :aliq_iss,' +
                         ' issret_servico = :issret_servico,' +
                         ' iss_retido = ' + IfThen(ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S'), '1', '2') +
                         ' where nped = :nped' +
                         ' and tipo = :tipo' +
                         ' and cod_servico = :cod_servico' +
                         ' and nitem = :nitem' +
                         ' and cod_empresa = :cod_empresa' +
                         ' and codigo_nop = :codigo_nop';
      for Aitem in Aitens do
      begin
        buscas.ParamByName('nped').AsInteger         := Aitem.nped;
        buscas.ParamByName('tipo').AsString          := Aitem.tipo;
        buscas.ParamByName('cod_servico').AsInteger  := Aitem.cod_servico;
        buscas.ParamByName('nitem').AsInteger        := Aitem.nitem;
        buscas.ParamByName('cod_empresa').AsInteger  := Aitem.cod_empresa;
        buscas.ParamByName('codigo_nop').AsFloat     := Aitem.codigo_nop;
        buscas.ParamByName('issret_servico').AsFloat := Aitem.issret_servico;
        buscas.ParamByName('valor_b_nfse').AsFloat   := Aitem.valor_b_nfse;
        buscas.ParamByName('aliq_iss').AsFloat       := Aitem.aliq_iss;
        buscas.ParamByName('valor_nfse').AsFloat     := Aitem.valor_nfse;
        if not buscas.Prepared then
          buscas.Prepare;
        buscas.ExecSQL;
      end;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

    finally
      FreeAndNil(Aitens);
    end;

  except on E: Exception do
    begin
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
    end;
  end;
end;

function TClassNfSe.sigiss_setNFetoACBr(Anfs:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ): Boolean;
var
  ok: Boolean;
  Anota: tcDadosNota;
begin

  Result := False;
  if not Assigned(FdocsNFSe) then
    Exit;

  if not Assigned(FdocsNFSe.can_nfse) then
    if not Assigned(FdocsNFSe.aut_nfse) then
      Exit;

  if not Assigned(FdocsNFSe.rps) then
    Exit;

  if Assigned(FdocsNFSe.can_nfse) then
    Anota :=  FdocsNFSe.can_nfse
  else
    Anota := FdocsNFSe.aut_nfse;

  Anfs.Configuracoes.WebServices.QuebradeLinha := ';';
  Anfs.NotasFiscais.Clear;

  {$IFDEF USE_NFSEX}
  with Anfs.NotasFiscais.New.NFSe do
  {$ELSE}
  with Anfs.NotasFiscais.Add.NFSe do
  {$ENDIF}
  begin
    //IdentificacaoRps.Numero := FdocsNFSe.rps.id_sis_legado;
    IdentificacaoRps.Serie  := Anota.serie_rps;
    IdentificacaoRps.Tipo := trRPS;
    DataEmissao     := TAuxiliar.ConvertStrToDateTime(Anota.dt_conversao, 'YYYY-MM-DD hh:nn:ss');
    DataEmissaoNFSe := DataEmissao;
    DataEmissaoRps  := EncodeDate(FdocsNFSe.rps.rps_ano, FdocsNFSe.rps.rps_mes, FdocsNFSe.rps.rps_dia);
    NaturezaOperacao := no1;
    RegimeEspecialTributacao := Anfs.Provider.
    StrToRegimeEspecialTributacao(ok, StrZero(cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger, 1));
    if (Anota.OpcaoSimples = '1') or (Anota.OpcaoSimples.Substring(0, 1) = 'S') then
      OptanteSimplesNacional := snSim
    else
      OptanteSimplesNacional := Anfs.Provider.
      StrToSimNao(Ok, IfThen(Anota.OpcaoSimples = 'SIM', '1', '2'));
    IncentivadorCultural := Anfs.Provider.
    StrToSimNao(ok, StrZero(cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger, 1));
    if FdocsNFSe.amb_prod then Producao := snSim else Producao := snNao;
    StatusRps := srNormal;
    OutrasInformacoes := '';

    Servico.Valores.ValorServicos  := StrToFloat(Anota.valor);
    servico.Valores.ValorIss       := StrToFloat(Anota.iss);
    servico.valores.Aliquota       := StrToFloat(Anota.aliquota_atividade);
    servico.valores.BaseCalculo    := StrToFloat(Anota.base);
    Servico.Valores.ValorDeducoes  := 0.00;
    Servico.Valores.ValorPis       := StrToFloat(FdocsNFSe.rps.pis);
    Servico.Valores.ValorCofins    := StrToFloat(FdocsNFSe.rps.cofins);
    Servico.Valores.ValorInss      := 0.00;
    Servico.Valores.ValorIr        := StrToFloat(FdocsNFSe.rps.irrf);
    Servico.Valores.ValorCsll      := StrToFloat(FdocsNFSe.rps.csll);
    Servico.Valores.IssRetido      := Anfs.Provider.
    StrToSituacaoTributaria(ok, IfThen(Anota.iSSRetido.Substring(0, 1).Equals('S'), '1', '2'));
    Servico.Valores.ValorIssRetido := StrToFloat(IfThen(Anota.iSSRetido.Substring(0, 1).Equals('S'), Anota.iss, '0'));
    Servico.Valores.OutrasRetencoes        := 0.00;
    Servico.Valores.DescontoIncondicionado := 0.00;
    Servico.Valores.DescontoCondicionado   := 0.00;
    Servico.ItemListaServico               := Anota.servico.ToString.PadLeft(4, '0').Insert(2, '.');
    {$IFDEF USE_NFSEX}
    Servico.xItemListaServico              := OnlyNumber(Servico.ItemListaServico);
    {$ELSE}
    Servico.xItemListaServico              := CodigoToDesc(OnlyNumber(Servico.ItemListaServico));
    {$ENDIF}
    servico.CodigoCnae                     := buscasmnt.FieldByName('cnae_serv').AsInteger.ToString.PadLeft(7, '0');
    Servico.CodigoTributacaoMunicipio      := buscasmnt.FieldByName('CTISS').AsString;
    Servico.Discriminacao                  := Anota.descricao;
    Servico.CodigoMunicipio                := cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger.ToString.PadLeft(7, '0');
    Servico.ExigibilidadeISS               := exiExigivel;
    Servico.MunicipioIncidencia            := StrToIntDef(Servico.CodigoMunicipio, 0) ;

    {$IFDEF USE_NFSEX}
    Prestador.IdentificacaoPrestador.Cnpj               := FdocsNFSe.rps.cnpj;
    Prestador.IdentificacaoPrestador.InscricaoMunicipal := IfThen(FdocsNFSe.rps.ccm.Trim.IsEmpty, cadempresa.dataSet.FieldByName('im_emp').AsString, FdocsNFSe.rps.ccm) ;
    Prestador.IdentificacaoPrestador.InscricaoEstadual  := cadempresa.dataSet.FieldByName('ie_emp').AsString.Trim;

    Prestador.RazaoSocial                 := RetiraCarEsp(Anota.prestador_razao);
    Prestador.NomeFantasia                := cadempresa.fstrNotEsp('fantasia_emp');
    Prestador.Endereco.TipoLogradouro     := '';
    Prestador.Endereco.Endereco           := RetiraCarEsp(Anota.prestador_endereco);
    Prestador.Endereco.Numero             := RetiraCarEsp(IfThen(Anota.prestador_numero.Trim.IsEmpty, cadempresa.fstr('numero_end'), Anota.prestador_numero));
    Prestador.Endereco.Complemento        := RetiraCarEsp(Anota.prestador_complemento);
    Prestador.Endereco.TipoBairro         := '';
    Prestador.Endereco.Bairro             := RetiraCarEsp(Anota.prestador_bairro);
    Prestador.Endereco.CodigoMunicipio    := RetiraCarEsp(Servico.CodigoMunicipio);
    Prestador.Endereco.UF                 := RetiraCarEsp(Anota.prestador_estado);
    Prestador.Endereco.CEP                := RetiraCarEsp(Anota.prestador_cep);
    Prestador.Endereco.xMunicipio         := RetiraCarEsp(Anota.prestador_cidade);
    Prestador.Endereco.CodigoPais         := 1058;
    Prestador.Endereco.xPais              := 'Brasil';

    Prestador.Contato.Telefone := cadempresa.fstrNotEsp('telefone_emp');
    Prestador.Contato.Email := cadempresa.fstrNotEsp('login_emp');

    {$ELSE}
    Prestador.Cnpj               := FdocsNFSe.rps.cnpj;
    Prestador.InscricaoMunicipal := IfThen(FdocsNFSe.rps.ccm.Trim.IsEmpty, cadempresa.dataSet.FieldByName('im_emp').AsString, FdocsNFSe.rps.ccm) ;
    Prestador.InscricaoEstadual  := cadempresa.dataSet.FieldByName('ie_emp').AsString.Trim;

    PrestadorServico.IdentificacaoPrestador.Cnpj               := Prestador.Cnpj;
    PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal := Prestador.InscricaoMunicipal;
    PrestadorServico.IdentificacaoPrestador.InscricaoEstadual  := Prestador.InscricaoEstadual;

    PrestadorServico.RazaoSocial                 := Anota.prestador_razao;
    PrestadorServico.NomeFantasia                := cadempresa.dataSet.FieldByName('fantasia_emp').AsString;
    PrestadorServico.Endereco.TipoLogradouro     := '';
    PrestadorServico.Endereco.Endereco           := Anota.prestador_endereco;
    PrestadorServico.Endereco.Numero             := IfThen(Anota.prestador_numero.Trim.IsEmpty, cadempresa.dataSet.FieldByName('numero_end').AsString, Anota.prestador_numero);
    PrestadorServico.Endereco.Complemento        := Anota.prestador_complemento;
    PrestadorServico.Endereco.TipoBairro         := '';
    PrestadorServico.Endereco.Bairro             := Anota.prestador_bairro;
    PrestadorServico.Endereco.CodigoMunicipio    := Servico.CodigoMunicipio;
    PrestadorServico.Endereco.UF                 := Anota.prestador_estado;
    PrestadorServico.Endereco.CEP                := Anota.prestador_cep;
    PrestadorServico.Endereco.xMunicipio         := Anota.prestador_cidade;
    PrestadorServico.Endereco.CodigoPais         := 1058;
    PrestadorServico.Endereco.xPais              := 'Brasil';

    PrestadorServico.Contato.Telefone := cadempresa.dataSet.FieldByName('telefone_emp').AsString;
    PrestadorServico.Contato.Email := cadempresa.dataSet.FieldByName('login_emp').AsString;
    {$ENDIF}

    Tomador.IdentificacaoTomador.CpfCnpj            := Anota.cnpj_tomador;
    Tomador.IdentificacaoTomador.InscricaoMunicipal := FdocsNFSe.rps.tomador_im;
    Tomador.IdentificacaoTomador.InscricaoEstadual  := FdocsNFSe.rps.tomador_ie;

    Tomador.RazaoSocial              := Anota.razao_tomador;
    Tomador.Endereco.Endereco        := Anota.endereco_tomador;
    Tomador.Endereco.Numero          := Anota.numero_tomador;
    Tomador.Endereco.Complemento     := Anota.complemento_tomador;
    Tomador.Endereco.Bairro          := Anota.bairro_tomador;
    Tomador.Endereco.CodigoMunicipio := FdocsNFSe.rps.tomador_cod_cidade;
    Tomador.Endereco.xMunicipio      := Anota.cidade_tomador;
    Tomador.Endereco.UF              := Anota.estado_tomador;
    Tomador.Endereco.CEP             := Anota.cep_tomador;
    Tomador.Endereco.xPais           := 'BRASIL';
    Tomador.Contato.Telefone         := FdocsNFSe.rps.tomador_fone;
    Tomador.Contato.Email            := Anota.email_tomador;

    ValoresNfse.ValorLiquidoNfse     := StrToFloat(Anota.valor);
    ValoresNfse.ValorIss             := StrToFloat(Anota.iss);
    ValoresNfse.Aliquota             := StrToFloat(Anota.aliquota_atividade);
    ValoresNfse.BaseCalculo          := StrToFloat(Anota.base);

    ValoresNfse.ValorLiquidoNfse     := ValoresNfse.ValorLiquidoNfse -
                                        Servico.Valores.DescontoIncondicionado -
                                        Servico.Valores.DescontoCondicionado -
                                        Servico.Valores.ValorPis -
                                        Servico.Valores.ValorCofins -
                                        Servico.Valores.ValorInss -
                                        Servico.Valores.ValorIr -
                                        Servico.Valores.ValorCsll -
                                        Servico.Valores.OutrasRetencoes -
                                        Servico.Valores.ValorIssRetido;

    Servico.Valores.ValorLiquidoNfse := ValoresNfse.ValorLiquidoNfse;

    {$IFDEF USE_NFSEX}
    Competencia       := DataEmissaoNFSe;
    {$ELSE}
    Competencia       := FormatDateTime('YYYY-MM-DD', DataEmissaoNFSe);
    {$ENDIF}
    Numero            := Anota.nota.ToString;
    numeroNFSe        := Anota.nota.ToString;
    CodigoVerificacao := Anota.autenticidade;

    if Anota.StatusNFe.Trim.ToUpper.Equals('CANCELADA') then
      NfseCancelamento.DataHora := DataEmissaoNFSe;

  end;
  Result := True;
end;

function TClassNfSe.enviarRPS(vos: integer): boolean;
begin
  Result := False;

  if vcidadegertxt = nil then
  begin
    ShowAtencao('Cidade do Webservice não Instanciada. Verifique compatibilidade com a cidade em questão');
    exit;
  end;

  mostrarmensagem('Abrindo Tabela O.S: '+nomecliente);

  vcodgar := 0;
  BuscasMnt.Close;

  if verificarGARANTIA(vos) then
  begin
    BuscasMnt.CommandText:='SELECT emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,cl.insc_est,cl.fax,cl.nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cl.cidade,it.ctiss,'+
    'sum(it.VALOR_NFSE) as valor,SUM(it.irrf_servico) as IRRF_SERVICO,SUM(it.ISSRET_SERVICO) as ISSRET_SERVICO,sum(it.VALOR_B_NFSE) AS bruto,'+
    'SUM(IT.PISRF_SERVICO) AS PISRF_SERVICO, SUM(IT.COFINSRF_SERVICO) AS COFINSRF_SERVICO, SUM(CSSLRF_SERVICO) AS CSSLRF_SERVICO ' +
    'FROM PEDVENDA_SERV it inner join pedvenda on it.nped = pedvenda.nped and '+
    'it.tipo = pedvenda.tipo and it.cod_empresa = pedvenda.cod_empresa '+
    'inner join clientes cl on cl.cod_cliente = '+inttostr(vcodgar)+' and pedvenda.cod_empresa = cl.cod_empresa '+
    'inner join empresa emp on it.cod_empresa = emp.cod_empresa inner join cidades cid on cl.cod_cidade = cid.cod_cidade '+
    'inner join estados est on cl.codigo_uf = est.codigo_uf '+
    'where it.nped in ('+vospesq+') and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and coalesce(it.status,'''') <> ''CANCELADO'' '+
    ' and (it.n_nf is null or it.n_nf <> 0)  group by emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,insc_est,fax,nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cidade,it.ctiss ';
  end
  else
  begin
    BuscasMnt.CommandText:='SELECT emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,cl.insc_est,cl.fax,cl.nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cl.cidade,it.ctiss,'+
    'sum(IT.VALOR_NFSE) as valor,SUM(it.irrf_servico) as IRRF_SERVICO,sum(it.ISSRET_SERVICO) as ISSRET_SERVICO,sum(it.VALOR_B_NFSE) AS bruto,'+
    'SUM(IT.PISRF_SERVICO) AS PISRF_SERVICO, SUM(IT.COFINSRF_SERVICO) AS COFINSRF_SERVICO, SUM(CSSLRF_SERVICO) AS CSSLRF_SERVICO ' +
    'FROM PEDVENDA_SERV it inner join pedvenda on it.nped = pedvenda.nped and '+
    'it.tipo = pedvenda.tipo and it.cod_empresa = pedvenda.cod_empresa '+
    'inner join clientes cl on pedvenda.cod_cliente = cl.cod_cliente and pedvenda.cod_empresa = cl.cod_empresa '+
    'inner join empresa emp on it.cod_empresa = emp.cod_empresa inner join cidades cid on cl.cod_cidade = cid.cod_cidade '+
    'inner join estados est on cl.codigo_uf = est.codigo_uf '+
    'where it.nped in ('+vospesq+') and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and coalesce(it.status,'''') <> ''CANCELADO'' '+
    ' and (it.n_nf is null or it.n_nf <> 0)  group by emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,insc_est,fax,nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cidade,it.ctiss ';
  end;

  buscasmnt.Open;
  if BuscasMnt.IsEmpty then
  begin
    Application.MessageBox(PWideChar('Problemas ao localizar dados da O.S. '+#13+'Verifique a Cidade e estado do cliente ou se a O.S. já tem NF'),PWideChar('Aviso'), MB_OK);
    BuscasMnt.close;
    mostrarmensagem('');
    exit;
  end;

  mostrarmensagem('Validando Dados e Montando RPS: '+nomecliente);
  try

    BuscasMnt.First;
    while not BuscasMnt.eof do
    begin
      if (BuscasMnt.FieldByName('VALOR').ascurrency > 0) and
         (validardadosRPS) then
      begin

        try
          var autorizada := False;

          if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
          begin
            sigiss_LoadDocEletronico(buscasmnt.FieldByName('COD_RPS').AsInteger);
            FdocsNFSe.rps_resc := FdocsNFSe.rps;//rescue, caso ja tenha sido enviado uma vez e autorizado sem resposta do ws
            FdocsNFSe.rps      := vcidadegertxt.sigiss_getRPS(Self);

            autorizada := sigiss_EnviarNFSE
          end
          else
          begin
            if ACBrNFSe1.Configuracoes.WebServices.Ambiente = taProducao then
              vcidadegertxt.copiarschemas('P')
            else
              vcidadegertxt.copiarschemas('H');

            var xmlRPS := GetXmlRPS(buscasmnt.FieldByName('COD_RPS').AsInteger);

            if not xmlRPS.IsEmpty then
            begin
              ACBrNFSe1.NotasFiscais.Clear;
              ACBrNFSe1.NotasFiscais.LoadFromString(xmlRPS);

              var nprot := SqlOpen(Format('select nprotNFSe from pedvenda_serv' +
                                          ' where cod_rps = %d and cod_empresa = %d',
                                          [buscasmnt.FieldByName('COD_RPS').AsInteger, cadempresa.codempresa]))
                                          .FieldByName('nprotNFSe').AsString.Trim();

              try

                if not nprot.IsEmpty then
                begin
                  ACBrNFSe1.ConsultarLoteRps(nprot);

                  if ACBrNFSe1.WebService.ConsultaLoteRps.Sucesso then
                    autorizada := VerificaRetornoAC(EMetodoNFSe.ConsultaLote);
                end
                else
                begin
                  ACBrNFSe1.ConsultarNFSeporRps(buscasmnt.FieldByName('COD_RPS').AsString,
                                                cadempresa.fstr('serie_serv_nfe'), '1');

                  if ACBrNFSe1.WebService.ConsultaNFSeporRps.Sucesso then
                    autorizada := VerificaRetornoAC(EMetodoNFSe.ConsutaNota);
                end;

              except on E: Exception do
                LogApp.Error('TClassNfSe.enviarRPS. Consulta antes de autorizar NPROT %s - RPS %d', [nprot, buscasmnt.FieldByName('COD_RPS').AsInteger]);
              end;

            end;

            if not autorizada then
            begin
              vcidadegertxt.montarRPSAC(ACBrNFSe1, Self);

              if GerarRPS() then
                autorizada := EnviarNFSEAC;
            end;

          end;

          Result := autorizada;

        except on e: exception do
          begin
            if ShowConfirmacao('Erro ao Gerar RPS. Mostrar Erro?', MB_YESNO + MB_DEFBUTTON2) = IDYES then
              ShowErro(E.Message);
          end;
        end;

      end;

      BuscasMnt.next;
    end;

  finally
    mostrarmensagem('');
  end;
end;

function TClassNfSe.EnviaWebService(): boolean;
begin
  Result := False;

  mostrarmensagem('');

  if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
    Result := sigiss_EnviarNFSE
  else
    Result := EnviarNFSEAC;

end;

procedure TClassNfSe.FrStatusShowNFSe(Sender: TObject);
begin
 case ACBrNFSe1.Status of
  stNFSeIdle : begin
            if ( frmStatus <> nil ) then frmStatus.Hide;
           end;
  stNFSeRecepcao : begin
                   if ( frmStatus = nil )
                    then frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Enviando dados da NFSe...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                  end;
  stNFSeConsulta : begin
                   if ( frmStatus = nil )
                    then frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Consultando...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                  end;
  stNFSeCancelamento : begin
                       if ( frmStatus = nil )
                        then frmStatus := TfrmStatus.Create(Application);
                       frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFSe...';
                       frmStatus.Show;
                       frmStatus.BringToFront;
                      end;
  stNFSeEmail : begin
                if ( frmStatus = nil )
                 then frmStatus := TfrmStatus.Create(Application);
                frmStatus.lblStatus.Caption := 'Enviando Email...';
                frmStatus.Show;
                frmStatus.BringToFront;
               end;
 end;
 Application.ProcessMessages;
end;

function TClassNfSe.GerarRPS(): boolean;
var
  Fentrada:File;
  NumRead,i, cResultado:integer;
  buf: char;
  S: string;
  Util: OleVariant;
  LoteRPSTXT, certificado, LoteRPSXML, cMunicipio, msgResultado, Erros, licenca: Widestring;
  msg:string;
  vstringlist: TStringList;
begin
  result := False;

  nroLote :='1';

  try
    IniciaTransacao;

    nroLote := inttostr(Gencodigo('LOTENFSe', DtmNFEHW.SpIncCodigo,IntToStr(cadempresa.codempresa)));

    buscaadc.Close;
    buscaadc.SQL.text:='UPDATE pedvenda_serv set lote_NFSe = '+nroLote+' where tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString+' and coalesce(status,'''') <> ''CANCELADO''';
    buscaadc.Prepare;
    buscaadc.ExecSQL;

    buscaadc.Close;
    buscaadc.SQL.text:='UPDATE os_item_serv set lote_NFSe = '+nroLote+' where cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString;
    buscaadc.Prepare;
    buscaadc.ExecSQL;

    ACBrNFSe1.NotasFiscais.GerarNFSe;

//    PostXmlRPS(buscasmnt.FieldByName('COD_RPS').AsInteger, ACBrNFSe1.NotasFiscais.Items[0].XMLOriginal, buscaadc);
    PostXmlRPS(buscasmnt.FieldByName('COD_RPS').AsInteger, ACBrNFSe1.NotasFiscais.Items[0].XmlRps, buscaadc);

    CommitaTransacao;

    Result := True;

  except on E: exception do
    begin
      RollBackTransacao;
      if not FSilentMode then
        if ShowConfirmacao('Erro ao Gerar LOTE de RPS. Mostrar Erro?', mb_yesno + MB_DEFBUTTON2) = IDYES then
          ShowErro(E.Message);
    end;
  end;
end;

function TClassNfSe.gravaRetornoWs(AXML: string): boolean;
var
  buscasTemp: TIBQuery;
  AFinanceiroUnificado: Boolean;
  AnumeroNFSe: string;
  Aid: string;
begin
  try
    IniciaTransacao;

    buscaadc.Close;

    Result := TRUE;

    mostrarmensagem('Gravando Retorno WebService NFSe: '+nomecliente);

    Fdiscrimina := Fdiscrimina.Replace('''', '''''' , [rfReplaceAll]);

    if Trim(AXML) <> '' then
    begin
      Aid := 'NFSe_RPS' + BuscasMnt.FieldByName('cod_rps').AsString.Trim;
      if SqlOpen('select id_doc from DOC_ELETRONICO where id_doc = ' + QuotedStr(Aid) +
                 ' and cod_empresa = ' +IntToStr(cadempresa.codempresa), buscaadc).IsEmpty then
        SqlExec('insert into DOC_ELETRONICO (id_doc, cod_empresa, doc)' +
                ' values (' + QuotedStr(Aid) + ', ' + IntToStr(cadempresa.codempresa) + ', ' + QuotedStr(AXML) +')', buscaadc);
    end;

    if Fprotoloco <> '' then
    begin
      buscaadc.SQL.text:='UPDATE pedvenda_serv set NPROTNFSE = '''+Fprotoloco+''',modelo_NFSe = ''55'' '+
      ' where tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+
      buscasmnt.FieldByName('COD_RPS').AsString+' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
      buscaadc.Close;
      buscaadc.SQL.text:='UPDATE os_item_serv set NPROTNFSE = '''+Fprotoloco+''',modelo_NFSe = ''55'' '+
      ' where cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString;
      buscaadc.Prepare;
      buscaadc.ExecSQL;
    end;

    if FListaErros <> '' then
    begin
      buscaadc.SQL.text:='UPDATE pedvenda_serv set resp_ws_NFSe= '''+copy(FListaErros,1,1000)+''',modelo_NFSe = ''55'' '+
      ' where tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+
      buscasmnt.FieldByName('COD_RPS').AsString+' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
      buscaadc.Close;
      buscaadc.SQL.text:='UPDATE os_item_serv set resp_ws_NFSe = '''+copy(FListaErros,1,1000)+''',modelo_NFSe = ''55'' '+
      ' where cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString;
      buscaadc.Prepare;
      buscaadc.ExecSQL;
    end;

    if Fcodigover <> '' then
    begin
      buscaadc.SQL.text:='UPDATE pedvenda_serv set codigo_verWSNFSe= '''+Fcodigover+''', '+
      'n_nf = '+FnumeroNFSe+',outras_infNFSe= '''+copy(Foutrasinf,1,400)+''',modelo_NFSe = ''55'','+
      'status_nfse= ''Autorizada'',desc_servico_RPS = '''+copy(Fdiscrimina,1,2000)+''','+
      'cnae_respNFSe = '''+FCodigoCnae+''',emissao_NFSE = '+
      QuotedStr(FormatDateTime('mm/dd/yyyy',DataEmissaoNFSe))+'  where tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa)+
      ' and cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString+
      ' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
      buscaadc.Close;

      buscas.close;
      buscas.sql.text:='select distinct its.nped from pedvenda_serv its where its.cod_empresa = '+IntToStr(cadempresa.codempresa)+' and its.cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString;
      buscas.Open;
      while not buscas.eof do
      begin
        buscaadc.Close;
        buscaadc.SQL.text:='UPDATE pedvenda set NUM_NFEEXT ='+FnumeroNFSe+',VALOR_NFEXT = '+vvalNFSe+',DATA_NFEXT = '+
        QuotedStr(FormatDateTime('mm/dd/yyyy',FDataEmissaoNFSe))+' where tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa)+
        ' and nped = '+buscas.FieldByName('NPED').AsString;

        buscaadc.Prepare;
        buscaadc.ExecSQL;
        //formas de pagamento e creditos
        try
          AnumeroNFSe := Trim(FnumeroNFSe);
          if StrToIntDef(AnumeroNFSe, -1) = -1 then
            System.Delete(AnumeroNFSe, 1, Length(AnumeroNFSe) - 6);
          buscaadc.Close;
          buscaadc.SQL.Text := 'update formpagamento fp set' +
            ' fp.num_nota = ' + AnumeroNFSe +
            ', fp.sub_serie = ' + IntToStr(YearOf(DataEmissaoNFSe)) +
            ', fp.tip_cnt = ''C'' '+
            ' where  (((fp.nrequisicao = ' + buscas.FieldByName('NPED').AsString +
            ') and fp.tpdocs = ' + QuotedStr('OS') +
            ') or ((fp.rec_numvend = ' + buscas.FieldByName('NPED').AsString +
            ' and fp.tpdocs <> ''LCS'' and fp.rec_tipvend = ' +
            QuotedStr('OS') +
            '))) and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1' +
            ' and fp.num_nota is null';
          buscaadc.ExecSQL;
          buscaadc.Close;
          buscaadc.SQL.Text :=
            'update formpagamento fp set fp.ndoc = ' +QuotedStr(StrZero(StrToInt(AnumeroNFSe), 6))+
              '||substring(fp.ndoc from 7 for (char_length(fp.ndoc) - 6 ) )'+
              ' where  fp.nrequisicao = ' + buscas.FieldByName('NPED').AsString +
              ' and fp.tpdocs = ' + QuotedStr('OS') +
              ' and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1 and fp.tipdoc = ''S2''' +
              ' and char_length(fp.ndoc) > 5' +
              ' and fp.num_nota = ' + AnumeroNFSe +
              ' and fp.sub_serie = ' + IntToStr(YearOf(DataEmissaoNFSe));
          buscaadc.ExecSQL;

          if buscaadc.RowsAffected >  0then
          begin
            buscaadc.Close;
            buscaadc.SQL.Text :=
              'select FINANCEIRO_UNIFICADO from empresa'+
                ' where cod_empresa = ' + IntToStr(cadempresa.codEmpresa);
            buscaadc.Open;

            AFinanceiroUnificado := Trim(buscaadc.FieldByName('FINANCEIRO_UNIFICADO').AsString) = 'S';

            buscasTemp := TIBQuery.Create(Application);
            buscasTemp.Database := buscaadc.Database;
            buscasTemp.Transaction := buscaadc.Transaction;
            try
              buscasTemp.Close;
              buscasTemp.SQL.Text :=
                'select n_processamento from formpagamento fp'+
                  ' where  fp.nrequisicao = ' + buscas.FieldByName('NPED').AsString +
                  ' and fp.tpdocs = ' + QuotedStr('OS') +
                  ' and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1 and fp.tipdoc = ''S2'' and fp.n_processamento > 0';
              buscasTemp.Open;

              while not buscasTemp.Eof do
              begin
                buscaadc.Close;
                buscaadc.SQL.Text :=
                  'update controle_creditos cc set cc.n_doc_c = '+QuotedStr(StrZero(StrToInt(AnumeroNFSe),6))+
                  '||substring(cc.n_doc_c from 7 for (char_length(cc.n_doc_c) - 6 ) )' +
                  ' where cc.cod_cred = ' + IntToStr(buscasTemp.FieldByName('n_processamento').AsInteger) +
                  ' and cc.' + StrUtils.IfThen(AFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + IntToStr(cadempresa.codEmpresa) +
                  ' and char_length(cc.n_doc_c) > 5';
                buscaadc.ExecSQL;

                buscasTemp.Next;
              end;
            finally
              FreeAndNil(buscasTemp);
            end;
          end;
        except
        end;
        /// fim das formas de pagamento e update nos creditos

        buscas.next;
      end;
      buscas.close;
    end;

    if vcoderro = 'S50' then
    begin
      buscaadc.SQL.text:='UPDATE pedvenda_serv set status_nfse= ''Em Processamento'''+
      ' where tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+
      buscasmnt.FieldByName('COD_RPS').AsString+' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
      buscaadc.Close;
      buscaadc.SQL.text:='UPDATE os_item_serv set status_nfse= ''Em Processamento'''+
      ' where cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString;
      buscaadc.Prepare;
      buscaadc.ExecSQL;
    end;

    CommitaTransacao;

    mostrarmensagem('');

  except on E: exception do
    begin
      RollBackTransacao;
      if application.messagebox('Erro ao Gravar Retorno WS NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message+' - '+buscaadc.SQL.Text),PWideChar('Error'), MB_OK);
      result := false;
    end;
  end;
end;

function TClassNfSe.getArquivosBoletoParaAnexos(AidDoc: Integer): TStrings;
var
  AFileHtml: TStrings;
  AFileSettings: TStrings;
  ANameHtml, ANamePDF: string;
begin
  if not FSendBoleto then
    Exit;

  Result := TStringList.Create;
  AFileHtml := TStringList.Create;
  AFileSettings := TStringList.Create;
  AFileSettings.Clear;

  try
    AFileSettings.Add('[Settings]');
    AFileSettings.Add('HTML=');
    AFileSettings.Add('PDF=');
    AFileSettings.Add('OpenAfterSave=0');

    buscaadc.Close;
    buscaadc.SQL.Text := 'select n_seq_bol, htmlboleto from boletas' +
                         ' where NUM_NF_VND = ' + dataSet.FieldByName('nped').AsInteger.ToString +
                         ' and TIPO_EMISSAO = ''OS''' +
                         ' and cod_empresa = ' + cadempresa.codempresa.ToString +
                         ' and ativo = 1' +
                         ' order by DATA_VEN_BOL';
    buscaadc.Open;
    while not buscaadc.Eof do
    begin
      AFileHtml.Text := buscaadc.FieldByName('htmlboleto').AsString;
      if AFileHtml.Count > 0 then
      begin
        ANameHtml := ExtractFilePath(Application.ExeName) + 'bol_' + buscaadc.FieldByName('n_seq_bol').AsInteger.ToString + '.html';
        ANamePDF  := ExtractFilePath(Application.ExeName) + 'bol_' + buscaadc.FieldByName('n_seq_bol').AsInteger.ToString + '.pdf';

        AFileHtml.SaveToFile(ANameHtml);

        AFileSettings[1] := 'HTML=' + ANameHtml;
        AFileSettings[2] := 'PDF=' + ANamePDF;
        AFileSettings.SaveToFile(ExtractFilePath(Application.ExeName) + 'htm2pdf.ini');
        CreateProcessSimple('htm2pdf.exe "' + ANameHtml + '" "' + ANamePDF + '" /silent', True);

        if FileExists(ANamePDF) then
          Result.Add(ANamePDF);
        DeleteFile(PWideChar(ANameHtml));
      end;

      buscaadc.Next;
    end;

    buscaadc.Close;
  finally
    FreeAndNil(AFileHtml);
    FreeAndNil(AFileSettings);
  end;
end;

function TClassNfSe.getDiscriminacaoServicos(ACodRps: Integer; Acodtpservico: string;
  AValorNF: Double): string;
var
  vRemoverEnterOBS_OS: Boolean;
  vobsos: string;
  vunidades: string;
  vquantserv: Extended;
begin
  vRemoverEnterOBS_OS := False;
  Result := '';

  buscaadc.close;
  buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+cadempresa.codempresa.ToString;
  buscaadc.open;
  vRemoverEnterOBS_OS := buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString.Trim.Equals('S');

  buscaadc.close;
  buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA' +
                     ' WHERE NPED in ('+vospesq+ ') ' +
                     ' and tipo = ''OS'' ' +
                     ' AND cod_empresa = '+cadempresa.codempresa.ToString;
  buscaadc.open;
  while not buscaadc.eof do
  begin
    if not buscaadc.FieldByName('OBS_OS').AsString.Trim.IsEmpty then
      vobsos := vobsos + buscaadc.FieldByName('OBS_OS').AsString + IfThen(vRemoverEnterOBS_OS, '#* , ', ' ;-;');
//     if vRemoverEnterOBS_OS then
//      vobsos := vobsos + buscaadc.FieldByName('OBS_OS').AsString + '#* , '
//    else
//      vobsos := vobsos + buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
    buscaadc.next;
  end;
  if vRemoverEnterOBS_OS then
  begin
    vobsos := vobsos.Replace(#13#10+'#*', '', [rfReplaceAll]);
    vobsos := vobsos.Replace('#*', '', [rfReplaceAll]);
    if Copy(vobsos, Length(vobsos), 1) = ',' then
      System.Delete(vobsos, Length(vobsos), 1);
  end;

  buscaadc.close;
  buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT' +
                     ' WHERE it.tipo = ''OS'' '+
                     ' AND it.cod_empresa = ' + cadempresa.codempresa.ToString +
                     ' and cod_rps = ' + ACodRps.ToString;
  buscaadc.open;
  vobsos := vobsos.Replace(#13#10, ';', [rfReplaceAll]);
  vden:='';

  vunidades := '';
  while not buscaadc.eof do
  begin
   vquantserv := buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
   if vquantserv = 0 then
     vquantserv:=1;

   vunidades := format('%n',[vquantserv])+ ' X '+
                format('%n',[buscaadc.FieldByName('VALOR_NFSE').AsFloat / vquantserv] )+ '=';
   vden := vden + RetiraCarEsp(buscaadc.FieldByName('DESC_SERV_PED').AsString) + ' - ' +
           vunidades + format('%n',[buscaadc.FieldByName('VALOR_NFSE').AsFloat]);
   vden := vden + '(O.S.: ' + StrZero(buscaadc.FieldByName('NPED').AsInteger, 6)+')';
   if pos(',', vospesq) > 0 then
     vden := vden+',';

   buscaadc.next;
  end;

  vden := vden +';';
  vden := vden +'----------------;';
  vden := vden + vobsos;
  vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
  if Pos('Fonte: IBPT', vden) = 0 then
  begin
   buscaadc.close;
   buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + Acodtpservico.QuotedString;
   buscaadc.Open;
   if buscaadc.FieldByName('aliqnac').AsFloat > 0 then
     vden := vden + IfThen(vRemoverEnterOBS_OS, ',', ';') +
       'Val Aprox Tributos R$' + Format('%0.2n', [AValorNF * buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
       ' (' + Format('%0.2f', [buscaadc.FieldByName('aliqnac').AsFloat]) + '%) Fonte: IBPT';
  end;
  Result := vden;
end;

function TClassNfSe.GetErrosNFSe: string;
var
  I : Integer;
  itemErro: TNFSeEventoCollectionItem;
begin
  Result := '';

  for I := 0 to ACBrNFSe1.WebService.Emite.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.Emite.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Emissao', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao]);

  end;

  for I := 0 to ACBrNFSe1.WebService.ConsultaSituacao.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.ConsultaSituacao.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Consulta Situacao', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao]);

  end;

  for I := 0 to ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Consulta Lote Rps', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao]);

  end;

  for I := 0 to ACBrNFSe1.WebService.ConsultaNFSeporRps.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.ConsultaNFSeporRps.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Consulta NFSe por Rps', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao]);

  end;

  for I := 0 to ACBrNFSe1.WebService.CancelaNFSe.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.CancelaNFSe.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Consulta NFSe por Rps', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao]);

  end;

end;

function TClassNfSe.GetXMLBanco(id: string): string;
begin
  try

    Result := SqlOpen('select doc from DOC_ELETRONICO where id_doc = ' + QuotedStr(id) +
                      ' and cod_empresa = ' +IntToStr(cadempresa.codempresa), buscaadc).FieldByName('doc').AsString.Trim;

  except on E: Exception do
    begin
      Result := '';
      registraErro('TClassNfSe.GetXMLBanco Erro: ' + e.Message);
    end;
  end;
end;

function TClassNfSe.GetXmlNFSe(nfseId: Integer): string;
begin
  Result := GetXMLBanco(Format('NFSe_RPS%d', [nfseId]));
end;

function TClassNfSe.GetXmlRPS(rpsId: Integer): string;
begin
  Result := GetXMLBanco(Format('RPS%d', [rpsId]));
end;

function TClassNfSe.gravaProtocoloWs: boolean;
begin
  try
    IniciaTransacao;
    buscaadc.Close;
    Result:=TRUE;
    mostrarmensagem('Gravando Retorno WebService NFSe: '+nomecliente);
    if Fprotoloco <> '' then
    begin
      buscaadc.SQL.text:='UPDATE pedvenda_serv set NPROTNFSE = '''+Fprotoloco+''',modelo_NFSe = ''55'' '+
        ' where tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+
      buscasmnt.FieldByName('COD_RPS').AsString+' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
      buscaadc.Close;
      buscaadc.SQL.text:='UPDATE os_item_serv set NPROTNFSE = '''+Fprotoloco+''',modelo_NFSe = ''55'' '+
        ' where cod_empresa = '+IntToStr(cadempresa.codempresa)+' and cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString;
      buscaadc.Prepare;
      buscaadc.ExecSQL;
    end;
    CommitaTransacao;
    mostrarmensagem('');
  except on e: exception do
    begin
      RollBackTransacao;
      if application.messagebox('Erro ao Gravar Protocolo NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message+' - '+buscaadc.SQL.Text),PWideChar('Error'), MB_OK);
      Result := False;
      exit;
    end;
  end;
end;

function TClassNfSe.imprimedireto(vflag: integer): boolean;
var
 varq: string;
 vt: currency;
begin
 Result := True;
 if (dataSet.FieldByName('N_NF').AsInteger <> 0) or (dataSet.FieldByName('COD_RPS').AsInteger <> 0) then
 begin
   abrirRPSDireto;
  if vflag = 1 then
  begin
   zerarAtributos;
   pegadadosRPS;
   imprimirRPSNFSe(1);
  end
  else if (dataSet.FieldByName('N_NF').AsInteger > 0) and
    (BuscasMnt.FieldByName('emissao_rps').AsDateTime >= EncodeDate(2018, 04, 02)) and
    (cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701') then //valadares sistema sigiss
  begin
    FdocsNFSe := sigiss_LoadDocEletronico(dataSet.FieldByName('COD_RPS').AsInteger);
    if sigiss_setNFetoACBr(ACBrNFSe1) then
      ACBrNFSe1.NotasFiscais.Imprimir;
  end
  else
  begin
    if loadXMLdoBanco('NFSe_RPS' + dataset.FieldByName('cod_rps').AsString.Trim) then
    begin
      try
        vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
        ACBrNFSe1.NotasFiscais.Imprimir;
      except
        Result := False
      end;
      Exit;
    end;

   varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe\NFSe\'+trim(dataSet.fieldbyname('N_NF').AsString)+
   '-nfse.xml';
   if FileExists(Varq) then
   begin
    ACBrNFSe1.NotasFiscais.Clear;
    ACBrNFSe1.NotasFiscais.LoadFromFile(varq);
    if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
    begin
//      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
//        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota*100;
//      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Tomador.Contato.Email:=buscasmnt.FieldByName('email').AsString;
// O pessoal da Actcon corrigiu o problema da aliquota
//     if ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo > 0 then
//     begin
//       if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.Aliquota > 0 then
//         ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:= ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.Aliquota / 100
//       else
//       if ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss > 0 then
//        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
//        (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss/ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo);
//     end;
       if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse > 0 then
        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;
       if (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido = stRetencao) and
         (ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss > 0) then
        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss;
    end;
    try
      acrescentaendACimp;
      vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
      ACBrNFSe1.NotasFiscais.Imprimir;
    except
      Result := False;
    end;
   end
   else
    Application.MessageBox(PWideChar('Arquivo XML da NFSe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
  end;
 end
 else
 begin
  Application.MessageBox(PWideChar('O.S. sem RPS e sem NF. Envie o RPS ou Consulte o WS por RPS'),PWideChar('Aviso'), MB_OK);
  Result := False;
 end;
end;

procedure TClassNfSe.imprimirRPSNFSe(vtp: integer);

begin
{
 with FrmRelRPSNFSe do
 begin
//  qrpNFS_RPS:=TQuickRep.create(Application);
  try
   QRImage1.Picture.LoadFromFile(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\logocid.jpg'); //ou bmp,jpg,jpeg
   QRImage3.Picture.LoadFromFile(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\logoemp.jpg');
  except
    on e: exception do
    begin
      if application.messagebox('Erro ao carrega imagens da logomarca. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
    end;
  end;
  QRLabel1.Caption:='PREFEITURA MUNICIPAL DE '+cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString;
  QRLabel11.Caption:='Secretaria Municipal de Finanças';
  QRLabel12.Caption:='Integração ISS';
  QRLabel13.Caption:=cadempresa.dataSet.FieldByName('endereco_pref').AsString+' - '+
  cadempresa.dataSet.FieldByName('bairro_pref').AsString;
  QRLabel14.Caption:=cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString+' - '+
  buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').asinteger)+' - '+
  cadempresa.dataSet.FieldByName('cep_pref').AsString;
  if numeroNFSe <> '' then
  begin
//    QRLabel15.Caption:=inttostr(YearOf(DataEmissaoNFSe))+'000';
    QRLabel15.Caption:='';
    QRLabel16.Caption:=strzero(numeroNFSe,15);
    QRLabel102.Caption:='RPS '+strzero(buscasmnt.FieldByName('COD_RPS').AsInteger,14)+' Série: '+
    buscasmnt.FieldByName('serie_serv_nfe').asstring+' emitido em '+buscasmnt.FieldByName('emissao_rps').asstring;
    QRLabel17.Caption:=UpperCase(codigover);
    Qrlabel10.Caption:='Código de verificação';
    Qrlabel9.Caption:='Nota:';
    QRLabel111.Caption:='Código QR';
    QRLabel2.Caption:='NOTA FISCAL ELETRÔNICA';
    QRLabel16.Font.Size:=9;
    QRLabel23.Caption:=DateTimeToStr(DataEmissaoNFSe);
    QRLabel24.Caption:=strzero(MonthOf(DataEmissaoNFSe),2)+'/'+inttostr(YearOf(DataEmissaoNFSe));
    QRLabel7.Caption:='VALOR LIQUIDO DA NOTA = '+Format('%n',[FvalorLiq]);
    QRLabel100.Caption:='VALOR TOTAL DA NOTA = '+Format('%n',[BuscasMnt.FieldByName('BRUTO').AsCurrency]);
    QRLabel101.Caption:='Codigo QR';
  end
  else
  begin
    Qrlabel10.Caption:='Código de verificação';
    Qrlabel9.Caption:='RPS:';
    QRLabel15.Caption:=StrZero(BuscasMnt.FieldByName('cod_rps').asinteger,7);
    QRLabel16.Font.Size:=10;
    QRLabel16.Caption:=DateTimeToStr(FdataRPS);
    QRLabel102.Caption:='';
    QRLabel17.Caption:=buscasmnt.FieldByName('serie_serv_nfe').asstring+'/1';
    Qrlabel10.Caption:='SERIE/TIPO RPS';
    QRLabel111.Caption:='';
    QRLabel2.Caption:='RECIBO PROVISÓRIO DE SERVIÇO - RPS';
    QRLabel23.Caption:='';
    QRLabel24.Caption:='';
    QRLabel7.Caption:='VALOR LIQUIDO DO RPS = '+Format('%n',[FvalorLiq]);
    QRLabel100.Caption:='VALOR TOTAL DO RPS = '+Format('%n',[BuscasMnt.FieldByName('BRUTO').AsCurrency]);
    QRLabel101.Caption:='';
  end;
  //QRLabel101.Caption:='Codigo QR';
  //qrLabels Nota Fiscal
  QRLabel25.Caption:=cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString+' - '+
  buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').asinteger);
  QRLabel26.Caption:=NFSeregimetrib(cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger);
  QRLabel27.Caption:=NFSNatop(cadempresa.dataSet.FieldByName('NFs_natop').AsInteger);
  //qrLabels prestador
  QRLabel33.Caption:=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  QRLabel34.Caption:='';
  QRLabel35.Caption:=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  QRLabel36.Caption:=NFSSimples(cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger);
  QRLabel37.Caption:=NFSSimples(cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger);
  QRLabel43.Caption:=copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,1,2)+'.'+
                      copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,3,3)+'.'+
                      copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,6,3)+'/'+
                      copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,9,4)+'-'+
                      copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,13,2);}
{   if length(trim(dtm02.QRYempresaCGC_EMP.value)) = 11 then
  QRLabel47.caption:=copy(dtm02.QRYempresaCGC_EMP.value,1,3)+'.'+
                      copy(dtm02.QRYempresaCGC_EMP.value,4,3)+'.'+
                      copy(dtm02.QRYempresaCGC_EMP.value,7,3)+'-'+
                      copy(dtm02.QRYempresaCGC_EMP.value,10,2)    }{
//  QRLabel44.Caption:='Incentivador SIM';
  QRLabel45.Caption:=cadempresa.dataSet.FieldByName('IM_EMP').AsString;
//  QRLabel46.Caption:='Incentivador SIM';
  QRLabel47.Caption:=cadempresa.dataSet.FieldByName('IE_EMP').AsString;
  QRLabel48.Caption:=trim(cadempresa.dataSet.FieldByName('ENDRECO_EMP').AsString)+', '+
  cadempresa.dataSet.FieldByName('NUMERO_END').AsString+' '+
  cadempresa.dataSet.FieldByName('BAIRRO_EMP').AsString+' '+
  cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString+' - '+
  buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').asinteger);
  QRLabel50.Caption:=cadempresa.dataSet.FieldByName('EMAIL_EMP').AsString;
  QRLabel52.Caption:=cadempresa.dataSet.FieldByName('TELEFONE_EMP').AsString;
  //tomador de serviços
  QRLabel56.Caption:=buscasmnt.FieldByName('razao').AsString;
  QRLabel58.Caption:=buscasmnt.FieldByName('razao').AsString;
  if length(trim(buscasmnt.FieldByName('cpfcgc').AsString)) = 11 then
     QRLabel65.Caption:=copy(buscasmnt.FieldByName('cpfcgc').AsString,1,3)+'.'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,4,3)+'.'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,7,3)+'-'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,10,2)
  else
   QRLabel65.Caption:=copy(buscasmnt.FieldByName('cpfcgc').AsString,1,2)+'.'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,3,3)+'.'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,6,3)+'/'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,9,4)+'-'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,13,2);
  QRLabel66.Caption:=buscasmnt.FieldByName('Insc_municipal').AsString;
  QRLabel67.Caption:='';
  QRLabel70.Caption:=trim(buscasmnt.FieldByName('email').AsString);
  QRLabel68.Caption:=buscasmnt.FieldByName('endereco').AsString+', '+
  buscasmnt.FieldByName('NUM_END_CLIENTE').AsString+' '+
  buscasmnt.FieldByName('COMPLEMENTO').AsString+' '+buscasmnt.FieldByName('BAIRRO').AsString+' '+
  buscasmnt.FieldByName('CIDADE').AsString+'-'+buscasmnt.FieldByName('SIGLA_UF').AsString;
  QRLabel72.Caption:=buscasmnt.FieldByName('fone_cliente').AsString;
  //dados complementares
  buscaadc.close;
  buscaadc.sql.text:='select DESC_TPSERVICO from TIPOSERVICONFSE where '+
  'COD_TPSERVICO = '''+buscasmnt.FieldByName('nfs_servico').AsString+''' and ativo = 1';
  buscaadc.open;
  QRLabel54.Caption:=buscasmnt.FieldByName('nfs_servico').AsString+' - '+
  buscaadc.FieldByName('DESC_TPSERVICO').AsString;
  buscaadc.close;
  if trim(cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString) <> trim(BuscasMnt.FieldByName('CTISS').asstring)  then
  begin
    buscaadc.sql.text:='select first 1 DESC_CNAE from CNAEFISCAL where '+
   'COD_CNAE like '''+trim(BuscasMnt.FieldByName('CTISS').asstring)+'%'' and ativo = 1';
    buscaadc.open;
    QRLabel53.Caption:='CTISS: ';
    FCodigoCnae:=BuscasMnt.FieldByName('CTISS').asstring;
  end
  else
  begin
   QRLabel53.Caption:='CNAE: ';
   buscaadc.sql.text:='select first 1 DESC_CNAE from CNAEFISCAL where '+
   'COD_CNAE like '''+FCodigoCnae+'%'' and ativo = 1';
   buscaadc.open;
  end;
  QRLabel55.Caption:=FCodigoCnae+' - '+buscaadc.FieldByName('DESC_CNAE').AsString;
  buscaadc.close;
  QRLabel79.Caption:='';
  QRLabel66.Caption:='';
  QRLabel73.Caption:='';
  QRLabel76.Caption:='';
  QRLabel75.Caption:='';

  //Discriminação dos serviços
  QRMemo1.Lines.Clear;
//  Fdiscrimina:=StringReplace(Fdiscrimina, '||',#$D#$A, [rfReplaceAll]);
//  Fdiscrimina:=StringReplace(Fdiscrimina, '|',#10, [rfReplaceAll]);

  buscaadc.close;
  buscaadc.sql.text:='SELECT FIRST 1 IT.DESC_SERVICO_RPS FROM PEDVENDA_SERV IT WHERE cod_rps = '+
  buscasmnt.FieldByName('COD_RPS').AsString+' and it.cod_empresa = '+inttostr(cadempresa.codempresa);
  buscaadc.open;
  Fdiscrimina:=buscaadc.FieldByName('DESC_SERVICO_RPS').AsString;
  qrMemo1.Lines.Add(Fdiscrimina);

  //Valor total da nota
  QRLabel84.Caption:=Format('%n',[Fpis]);
  QRLabel85.Caption:=Format('%n',[Fcofins]);
  QRLabel86.Caption:=Format('%n',[Finss]);
  QRLabel87.Caption:=Format('%n',[Fir]);
  QRLabel88.Caption:=Format('%n',[Fcsll]);
  QRLabel89.Caption:=Format('%n',[FoutrasRet]);
  QRLabel91.Caption:=Format('%n',[Fdeducoes]);
  QRLabel92.Caption:=Format('%n',[Fdescadc]);
  QRLabel95.Caption:=Format('%n',[FdescCond]);
  QRLabel96.Caption:=Format('%n',[FbaseCalc]);
  QRLabel99.Caption:=Format('%n',[Faliq]);
  QRLabel108.Caption:=Format('%n',[Fiss]);
  QRLabel111.Caption:=Format('%n',[Fissretido]);
  QRLabel112.Caption:=Format('%n',[FvalorLiq]);
  QRMemo2.Lines.clear;
  qrmemo2.Lines.Add(outrasinf);
  if numeroNFSe <> '' then
   QRMemo3.Lines.Clear
  else
  begin
   QRMemo3.Lines.Clear;
   QRMemo3.Lines.Add('Este RPS é emitido em caráter provisório, não tem validade fiscal '+
   'e deverá ser convertido, pelo prestador do serviço, em Nota Fiscal de Serviço Eletrônica, '+
   'no prazo de 10 dias. A utilização da mesma numeração de RPS para outro serviço prestado '+
   'constitui infração vigente.');
  end;
  if vtp = 1 then
   FrmRelRPSNFSe.qrpNFS_RPS.Preview
  else
  begin
   if numeroNFSe <> '' then
    FrmRelRPSNFSe.gerarPDF(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe\NFSe'+numeroNFSe+'.PDF')
   else
    FrmRelRPSNFSe.gerarPDF(cadempresa.dataSet.FieldByName('NFE_LOGPATH').
    AsString+'\NFSe\PDFNFSe\RPS'+strzero(buscasmnt.FieldByName('COD_RPS').AsInteger,14)+'.PDF');
  end;
  //Outras informacoes
 end;
// FrmRelRPSNFSe.Free;
}
end;

function TClassNfSe.iniciaNFSE: boolean;
var
  libNFSe: Integer;
begin
  if ACBrNFSeDANFSeQR1 = nil then
    ACBrNFSeDANFSeQR1 := {$IFDEF USE_NFSEX} TACBrNFSeXDANFSeRL {$ELSE} TACBrNFSeDANFSeRL {$ENDIF} .Create(nil);

  if ACBrNFSe1 = nil then
  begin
    ACBrNFSe1 := {$IFDEF USE_NFSEX} TACBrNFSeX {$ELSE} TACBrNFSe {$ENDIF} .Create(nil);

    ACBrNFSe1.DANFSe := ACBrNFSeDANFSeQR1;
    ACBrNFSe1.OnGerarLog := NFSeGerarLog;
  end;

  var sectionCidade := Format('NFSe_%s', [vcidadegertxt.ibgeId]);

  libNFSe := IniConf.ReadInt('Sistema', 'libNFe', -1);
//  libNFSe := IfThen((libNFSe < 0) or (libNFSe > 2), Integer(libOpenSSL), libNFSe);
  libNFSe := IfThen( TSSLLib(libNFSe) in [TSSLLib.libOpenSSL, TSSLLib.libWinCrypt] , libNFSe, Integer(libOpenSSL));

  if not DirectoryExists(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe') then
    CreateDir(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe');
  if not DirectoryExists(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe') then
    CreateDir(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe');

  {$IFDEF USE_NFSEX}
  {
  // parece que pra usar o metodo LerIni seja necessario setar o SessaoIni, eu nao sei, debuga pra ver
  //if FileExists(ExtractFilePath(Application.ExeName) + 'NFSeConf.ini') then
    //ACBrNFSe1.Configuracoes.LerIni(ExtractFilePath(Application.ExeName) + 'NFSeConf.ini');
  if TSSLLib(libNFSe) <> libOpenSSL then
    ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := CadEmpresa.fstr('NFE_NUMSERIE_CERT');
  ACBrNFSe1.Configuracoes.Certificados.ArquivoPFX  := CadEmpresa.fstr('NFE_CAMINHO_CERT');
  ACBrNFSe1.Configuracoes.Certificados.Senha       := AnsiString(CadEmpresa.fstr('NFE_SENHA__CERT'));

   try
    ACBrNFSe1.SSL.DescarregarCertificado;
    ACBrNFSe1.Configuracoes.Geral.SSLLib := libWinCrypt;

    if ((ACBrNFSe1.SSL.CertDataVenc - date) <= CadEmpresa.fint('DIAS_AVISO')) then
      ShowAtencao('Certificado selecionado vence em: ' + DateToStr(ACBrNFSe1.SSL.CertDataVenc));

  except
    try
      ACBrNFSe1.SSL.DescarregarCertificado;
      ACBrNFSe1.Configuracoes.Geral.SSLLib := libCapicom;

      if ((ACBrNFSe1.SSL.CertDataVenc - date) <= CadEmpresa.fint('DIAS_AVISO')) then
        ShowAtencao('Certificado selecionado vence em: ' + DateToStr(ACBrNFSe1.SSL.CertDataVenc));
    except
    end;
  end;

  ACBrNFSe1.SSL.DescarregarCertificado;
  }

  THelperDFe.Configure(ACBrNFSe1, EnumDfeType.tNFSe, cadempresa, True);

  with ACBrNFSe1.Configuracoes.Geral do
  begin
    {
    SSLLib        := TSSLLib(libNFSe);

    if IniConf.ReadInt('SSLib', 'SSLCryptLib', -1) >= 0 then
      SSLCryptLib   := TSSLCryptLib(IniConf.ReadInt('SSLib', 'SSLCryptLib'));
    if IniConf.ReadInt('SSLib', 'SSLHttpLib', -1) >= 0 then
      SSLHttpLib    := TSSLHttpLib(IniConf.ReadInt('SSLib', 'SSLHttpLib'));
    if IniConf.ReadInt('SSLib', 'SSLXmlSignLib', -1) >= 0 then
      SSLXmlSignLib := TSSLXmlSignLib(IniConf.ReadInt('SSLib', 'SSLXmlSignLib'));
    }

    Salvar           := True;
    ExibirErroSchema := True;
    RetirarAcentos   := True;
    //FormatoAlerta    := ;
    FormaEmissao     := teNormal;

    ConsultaLoteAposEnvio := True;
    ConsultaAposCancelar  := True;
    MontarPathSchema      := False;

    //CNPJPrefeitura := ;

    Emitente.CNPJ           := cadempresa.fstr('cgc_emp');
    Emitente.InscMun        := cadempresa.fstr('im_emp');
    Emitente.RazSocial      := cadempresa.fstr('nome_emp');

    Emitente.DadosEmitente.NomeFantasia      := cadempresa.fstr('fantasia_emp');
    Emitente.DadosEmitente.InscricaoEstadual := cadempresa.fstr('ie_emp');
    Emitente.DadosEmitente.Endereco          := cadempresa.fstr('endreco_emp');
    Emitente.DadosEmitente.Numero            := cadempresa.fstr('numero_end');
    Emitente.DadosEmitente.CEP               := cadempresa.fstr('cep_emp');
    Emitente.DadosEmitente.Bairro            := cadempresa.fstr('bairro_emp');
    Emitente.DadosEmitente.Complemento       := cadempresa.fstr('complemento_emp');
    Emitente.DadosEmitente.Municipio         := cadempresa.fstr('cidade_emp');
    Emitente.DadosEmitente.UF                := cadempresa.fstr('sigla_uf');
    Emitente.DadosEmitente.CodigoMunicipio   := cadempresa.fstr('ibge_cod_cidade');
    Emitente.DadosEmitente.Telefone          := cadempresa.fstr('telefone_emp');
    Emitente.DadosEmitente.Email             := cadempresa.fstr('email_emp');

    if IniConf.FileReadStr('Cidades', cadempresa.fstr('ibge_cod_cidade'), 'Provedor').ToLower.Trim.Equals('issdigital') then
    begin
      Emitente.WSFraseSecr                   := cadempresa.fstr('nfs_cert');
      Emitente.WSSenha                       := decodifica(cadempresa.fstr('licencanfse'));
    end;
    //Emitente.WSUser         := ;
    //Emitente.WSSenha        := ;
    //Emitente.WSFraseSecr    := ;
    //Emitente.WSChaveAcesso  := ;
    //Emitente.WSChaveAutoriz := ;

    {
      Para o provedor ADM, utilizar as seguintes propriedades de configurações:
      WSChaveAcesso  para o Key
      WSChaveAutoriz para o Auth
      WSUser         para o RequestId

      Essas 3 propriedades são geradas pelo provedor quando o emitente se cadastra
    }
  end;

  with ACBrNFSe1.Configuracoes.WebServices do
  begin
    Ambiente   := TpcnTipoAmbiente(IfThen(cadempresa.fequals('webserv_ambiente', 'Produção'), Ord(taProducao), Ord(taHomologacao)));
    Visualizar := cadempresa.fequals('webserv_visualizar', 'SIM');
    Salvar     := True;
    UF         := buscaSiglaest(cadempresa.fint('UF_EMP'));

    // Usar o retorno do tempo medio de resposta do lote e ajusta para aguardar conforme
    AjustaAguardaConsultaRet := False;
    if (IniConf.ReadInt(sectionCidade, 'AguardarConsultaRet', 0) > 0) then
      AguardarConsultaRet := IniConf.ReadInt(sectionCidade, 'AguardarConsultaRet', 0);
    if (IniConf.ReadInt(sectionCidade, 'Tentativas', 0) > 0) then
      Tentativas := IniConf.ReadInt(sectionCidade, 'Tentativas', 0);
    if (IniConf.ReadInt(sectionCidade, 'IntervaloTentativas', 0) > 0) then
      IntervaloTentativas := IniConf.ReadInt(sectionCidade, 'IntervaloTentativas', 0);

    TimeOut    := IniConf.ReadInt(sectionCidade, 'TimeOut', 5) * 1000;
    //ProxyHost := ?.Text;
    //ProxyPort := ?.Text;
    //ProxyUser := ?.Text;
    //ProxyPass := ?.Text;
  end;
  {
  if IniConf.ReadInt('SSLib', 'SSLType', -1) >= 0 then
    ACBrNFSe1.SSL.SSLType := TSSLType(IniConf.ReadInt('SSLib', 'SSLType'));
  }

  with ACBrNFSe1.Configuracoes.Arquivos do
  begin
    NomeLongoNFSe    := False;
    Salvar           := True;
    SepararPorMes    := False;
    AdicionarLiteral := True;
    EmissaoPathNFSe  := True;
    SepararPorCNPJ   := False;
    //PathGer          := ;
    //PathMensal       := ;
    //PathCan          := ;
    PathSalvar       := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\DadosNFSe';
    PathRPS          := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\DadosNFSe\RPS';
    PathNFSe         := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\DadosNFSe\NFSe';
    if (vcidadegertxt is TClassNFSeDefault) and
       (not vcidadegertxt.PathSchemas.IsEmpty()) then
    begin
      {
      if IniConf.ReadStr(Format('NFSe_%s', [vcidadegertxt.ibgeId]), 'PathSchemas') = '' then
        ShowWarning('Diretório dos schemas da NFSe não configurado. Arquivo "Config.Ini"' + sLineBreak +
                    Format('[NFSe_%s]', [vcidadegertxt.ibgeId]) + sLineBreak +
                    'PathSchemas=');
      }
      //ACBrNFSe1.Configuracoes.Geral.PathIniCidades  := IniConf.ReadStr('Sistema', 'NFSe_PathIniCidades' , ExtractFilePath(Application.ExeName));
      //ACBrNFSe1.Configuracoes.Geral.PathIniProvedor := IniConf.ReadStr('Sistema', 'NFSe_PathIniProvedor', ExtractFilePath(Application.ExeName));
      PathSchemas  := vcidadegertxt.PathSchemas;
    end
    else
      PathSchemas    := ExtractFilePath(Application.Exename) + 'schemasNFSe';
  end;

  if ACBrNFSe1.DANFSe <> nil then
  begin
    // TTipoDANFSE = ( tpPadrao, tpIssDSF, tpFiorilli );
    ACBrNFSe1.DANFSe.TipoDANFSE := tpPadrao;
    ACBrNFSe1.DANFSe.Logo       := cadempresa.fstr('nfe_logpath') + '\NFSe\logocid.jpg';
    ACBrNFSe1.DANFSe.Prefeitura := StrConcat(['PREFEITURA MUNICIPAL DE ', cadempresa.fstr('CIDADE_EMP'), ';',
                                              'Integração ISS', ';', cadempresa.fstr('endereco_pref'), ' - ',
                                              cadempresa.fstr('bairro_pref'), ';',
                                              cadempresa.fstr('cidade_emp'), ' - ',
                                              ACBrNFSe1.Configuracoes.WebServices.UF, ' - ',
                                              cadempresa.fstr('cep_pref')]);

    ACBrNFSe1.DANFSe.PathPDF    := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\PDFNFSe';

    ACBrNFSe1.DANFSe.Prestador.Logo := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\logoemp.jpg';

    ACBrNFSe1.DANFSe.MargemDireita  := 5;
    ACBrNFSe1.DANFSe.MargemEsquerda := 5;
    ACBrNFSe1.DANFSe.MargemSuperior := 5;
    ACBrNFSe1.DANFSe.MargemInferior := 5;
  end;

  {
  with ACBrNFSe1.MAIL do
  begin
    Host      := edtSmtpHost.Text;
    Port      := edtSmtpPort.Text;
    Username  := edtSmtpUser.Text;
    Password  := edtSmtpPass.Text;
    From      := edtEmailRemetente.Text;
    FromName  := edtEmitRazao.Text;
    SetTLS    := cbEmailTLS.Checked;
    SetSSL    := cbEmailSSL.Checked;
    UseThread := False;

    ReadingConfirmation := False;
  end;
  }

  // A propriedade CodigoMunicipio tem que ser a ultima a receber o seu valor
  // Pois ela se utiliza das demais configurações
  var idibge := cadempresa.fint('IBGE_COD_CIDADE');
  ACBrNFSe1.LerCidades;
  ACBrNFSe1.Configuracoes.Geral.CodigoMunicipio := idibge;

  {$ELSE}

  ACBrNFSe1.Configuracoes.WebServices.UF := buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').asinteger);
  ACBrNFSe1.Configuracoes.Geral.Emitente.CNPJ := cadempresa.dataSet.FieldByName('cgc_emp').AsString;
  ACBrNFSe1.Configuracoes.Geral.Emitente.InscMun := cadempresa.dataset.FieldByName('im_emp').AsString;
  ACBrNFSe1.Configuracoes.Geral.Emitente.RazSocial := cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  ACBrNFSe1.Configuracoes.Geral.SSLLib := TSSLLib(libNFSe);
  if IniConf.ReadInt('Sistema', 'SSLXmlSignLib', -1) >= 0 then
    ACBrNFSe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(IniConf.ReadInt('Sistema', 'SSLXmlSignLib', -1));//xsMsXML;
  //  LibXml2Path := 'C:\Windows\SysWOW64';

  ACBrNFSe1.Configuracoes.Certificados.ArquivoPFX := CadEmpresa.dataset.fieldbyname('NFE_CAMINHO_CERT').AsString;
  ACBrNFSe1.Configuracoes.Certificados.Senha := CadEmpresa.dataset.fieldbyname('NFE_SENHA__CERT').AsString;

  if TSSLLib(libNFSe) <> libOpenSSL then
  begin
    ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString;

    if ACBrNFSe1.Configuracoes.Certificados.NumeroSerie <> '' then
    begin
      if ((ACBrNFSe1.SSL.CertDataVenc-date) <=
        CadEmpresa.dataset.fieldbyname('DIAS_AVISO').asinteger) then
          ShowWarning('Certificado selecionado vence em: '+ datetostr(ACBrNFSe1.SSL.CertDataVenc));
    end;
  end;

  {
  {$IFNDEF ACBrNFeCAPICOM}
    ACBrNFSe1.Configuracoes.Certificados.ArquivoPFX:= CadEmpresa.dataset.fieldbyname('NFE_CAMINHO_CERT').AsString;
    ACBrNFSe1.Configuracoes.Certificados.Senha := CadEmpresa.dataset.fieldbyname('NFE_SENHA__CERT').AsString;
    ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString;
  {$ELSE}
    if CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString = '' then
    begin
      Application.MessageBox('Informe o número de série do certificado', 'Atenção', MB_ICONWARNING + MB_OK);
      ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := ACBrNFSe1.SSL.SelecionarCertificado;
    end
    else
      ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString;

    if ACBrNFSe1.Configuracoes.Certificados.NumeroSerie <> '' then
    begin
      if ((ACBrNFSe1.SSL.CertDataVenc-date) <=
        CadEmpresa.dataset.fieldbyname('DIAS_AVISO').asinteger) then
          Application.MessageBox(PWideChar('Certificado selecionado vence em: '+
          datetostr(ACBrNFSe1.SSL.CertDataVenc)), 'Atenção', MB_ICONWARNING + MB_OK);
    end;
  {$ENDIF}
  }

  // ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := cadempresa.dataSet.fieldbyname('NFE_NUMSERIE_CERT').AsString;
  // ACBrNFSe1.Configuracoes.Certificados.Senha := cadempresa.dataSet.fieldbyname('NFE_SENHA__CERT').AsString;
  ACBrNFSe1.Configuracoes.Arquivos.AdicionarLiteral:=True;
  ACBrNFSe1.Configuracoes.Arquivos.EmissaoPathNFSe:=True;
  // ACBrNFSe1.Configuracoes.Arquivos.PastaMensal:=True;
  ACBrNFSe1.Configuracoes.Arquivos.PathCan:=cadempresa.dataSet.fieldbyname('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe';
  ACBrNFSe1.Configuracoes.Arquivos.PathNFSe:=cadempresa.dataSet.fieldbyname('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe';
  ACBrNFSe1.Configuracoes.Arquivos.Salvar:=True;
  ACBrNFSe1.Configuracoes.Arquivos.SepararPorMes :=false;

  // PathMensal:=ACBrNFSe1.Configuracoes.Arquivos.GetPathNFSe(0);
  if not DirectoryExists(ExtractFilePath(Application.Exename)+'schemasNFSe') then
    CreateDir(ExtractFilePath(Application.Exename)+'schemasNFSe');

  if vcidadegertxt is TClassNFSeDefault then
  begin
    if IniConf.ReadStr(Format('NFSe_%s', [vcidadegertxt.ibgeId]), 'PathSchemas') = '' then
      ShowWarning('Diretório dos schemas da NFSe não configurado. Arquivo "Config.Ini"' + sLineBreak +
                  Format('[NFSe_%s]', [vcidadegertxt.ibgeId]) + sLineBreak +
                  'PathSchemas=');
    ACBrNFSe1.Configuracoes.Geral.PathIniCidades  := IniConf.ReadStr('Sistema', 'NFSe_PathIniCidades' , ExtractFilePath(Application.ExeName));
    ACBrNFSe1.Configuracoes.Geral.PathIniProvedor := IniConf.ReadStr('Sistema', 'NFSe_PathIniProvedor', ExtractFilePath(Application.ExeName));
    ACBrNFSe1.Configuracoes.Arquivos.PathSchemas  := IniConf.ReadStr(Format('NFSe_%s', [vcidadegertxt.ibgeId]), 'PathSchemas');
  end
  else
    ACBrNFSe1.Configuracoes.Arquivos.PathSchemas := ExtractFilePath(Application.Exename)+'schemasNFSe';

  ACBrNFSe1.Configuracoes.Geral.Salvar      := true;
  ACBrNFSe1.Configuracoes.Geral.ConsultaLoteAposEnvio := True;
  ACBrNFSe1.Configuracoes.Arquivos.PathSalvar  := cadempresa.dataSet.fieldbyname('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe';
  ACBrNFSe1.Configuracoes.Geral.CodigoMunicipio := cadempresa.dataSet.fieldbyname('IBGE_COD_CIDADE').AsInteger;
  if cadempresa.dataSet.fieldbyname('WEBSERV_AMBIENTE').AsString = 'Homologação' then
    ACBrNFSe1.Configuracoes.WebServices.Ambiente:=taHomologacao
  else
    ACBrNFSe1.Configuracoes.WebServices.Ambiente:=taProducao;
  // ..StrToTpAmb(Ok, IntToStr(rgTipoAmb.ItemIndex+1));
  if cadempresa.dataSet.FieldByName('WEBSERV_VISUALIZAR').AsString = 'SIM' then
    ACBrNFSe1.Configuracoes.WebServices.Visualizar:= true
  else
    ACBrNFSe1.Configuracoes.WebServices.Visualizar:= false;
  ACBrNFSe1.Configuracoes.WebServices.Salvar:=true;

  // ACBrNFSe1.Configuracoes.Certificados.AssinaRPS:=true;
  // ACBrNFSe1.Configuracoes.Certificados.AssinaLote:=true;
  // ACBrNFSe1.Configuracoes.WebServices.SenhaWeb        := edtSenhaWeb.Text;
  // ACBrNFSe1.Configuracoes.WebServices.UserWeb         := edtUserWeb.Text;
  // ACBrNFSe1.Configuracoes.WebServices.Salvar          := ckSalvarSoap.Checked;
  // ACBrNFSe1.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
  // ACBrNFSe1.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
  // ACBrNFSe1.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
  // ACBrNFSe1.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

  ACBrNFSe1.Configuracoes.Geral.SetConfigMunicipio;//arquivo ini das cidades

  if ACBrNFSe1.DANFSe <> nil then
  begin
    ACBrNFSe1.DANFSe.Logo          :=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\logocid.jpg';
    ACBrNFSe1.DANFSe.PrestLogo     :=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\logoemp.jpg';
    ACBrNFSe1.DANFSe.Prefeitura    :='PREFEITURA MUNICIPAL DE '+cadempresa.dataset.FieldByName('CIDADE_EMP').AsString+';'+
                                   'Integração ISS;'+cadempresa.dataSet.FieldByName('endereco_pref').AsString+' - '+
                                   cadempresa.dataSet.FieldByName('bairro_pref').AsString+';'+
                                   cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString+' - '+
                                   buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').asinteger)+' - '+
                                   cadempresa.dataSet.FieldByName('cep_pref').AsString;
    ACBrNFSe1.DANFSe.ImprimeCanhoto:=true;
    ACBrNFSe1.DANFSe.PathPDF       :=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe';
    buscas.Close;
    buscas.SQL.text:='SELECT FIRST 1 NOME_EMPDES FROM EMPDESVOLV';
    buscas.open;
    ACBrNFSe1.DANFSe.Sistema:=buscas.FieldByName('NOME_EMPDES').AsString;
    buscas.close;
  end;

  {$ENDIF}

  if not FSilentMode then
    ACBrNFSe1.OnStatusChange:=FrStatusShowNFSe;
end;

function TClassNfSe.loadXMLdoBanco(Aid: string): Boolean;
var
  AXML: string;
begin
  try
    ACBrNFSe1.NotasFiscais.Clear;

    AXML := SqlOpen('select doc from DOC_ELETRONICO where id_doc = ' + QuotedStr(Aid) +
                    ' and cod_empresa = ' +IntToStr(cadempresa.codempresa), buscaadc).FieldByName('doc').AsString.Trim;

    if AXML <> '' then
    begin
      ACBrNFSe1.NotasFiscais.LoadFromString(AXML);
      acrescentaendACimp;
      //vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self); como chama em outros lugares então fica chamando duas vezes

      if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
      begin
        if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse > 0 then
          ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;
        if (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido = stRetencao) and
          (ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss > 0) then
          ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss;
      end;
    end;

    Result := ACBrNFSe1.NotasFiscais.Count > 0;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TClassNfSe.loadXMLdoBanco Erro: ' + e.Message);
    end;
  end;
end;

function TClassNfSe.montaRPSos(vos: integer; valiq: real; vnfs_servico: string; vcnae_serv: integer): boolean;
var
  valiqint: real;
  vnfs_servicoint: string;
  ctissint: string;
  vcnae_tpserv: string;
  vretissint: integer;
  vrps: integer;
  vdatadia: TDateTime;
  vratservt, vltotserv, vvalservt, vvalissret: real;
  vretiss: integer;
  vArrayRPSRetencao: array of integer;
  vCountArray: Integer;
  I: Integer;
  vValorTmp, vRetencaoIRRF, vTotRetencaoIRRF, vSumRetencaoIRRF, vRetencaoContribPIS, vRetencaoContribCOFINS, vRetencaoContribCSSL, vTotRetencaoContribPIS, vTotRetencaoContribCOFINS, vTotRetencaoContribCSSL, vSumRetencaoContribPIS, vSumRetencaoContribCOFINS, vSumRetencaoContribCSSL: Currency;
  vStrRetencaoIRRF, vStrRetencaoContrib: string;
  vRetencaoCliente, vJaTestouGarantia: Boolean;
  ADiscriminacaoServico: string;

  function reterRPSparaCliente(pRPS, pOS: Integer; pvospesq: string): Boolean;
  var
    vMensagem: string;
    vSql: string;
  begin
    // No regime normal para normal vai haver a retencao (Lucro real e presumido)
    //Quando o simples nacional estiver envolvido não vai haver retenção
    Result := false;
    vSql := 'pv.cod_cliente';
    if (pOS > 0) and (not vJaTestouGarantia) then
    begin
      if verificarGARANTIA(pOS, False) then
        vSql := IntToStr(vcodgar);
      vJaTestouGarantia := True;
    end
    else if vJaTestouGarantia then
      vSql := IntToStr(vcodgar);

    buscaadc.Close;
    buscaadc.SQL.Text := 'select first 1 cl.cod_cliente, cl.cpfcgc, cl.regime, cl.nome_cliente, cl.razao, e.regime regime_empresa from pedvenda pv' + ' inner join clientes cl on cl.cod_cliente = ' + vSql + ' and cl.cod_empresa = pv.cod_empresa' + ' inner join empresa e on e.cod_empresa = cl.cod_empresa' + ' inner join pedvenda_serv ps on ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa' + ' where pv.nped in (' + pvospesq + ')' + ' and pv.tipo = ''OS''' + ' and pv.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and ps.cod_rps = ' + IntToStr(pRPS);
    buscaadc.Open;

    if (Trim(buscaadc.FieldByName('regime_empresa').AsString) = 'LUCRO REAL') or (Trim(buscaadc.FieldByName('regime_empresa').AsString) = 'LUCRO PRESUMIDO') then
      Result := True;

    if Result then
      Result := Length(Trim(buscaadc.FieldByName('cpfcgc').AsString)) = 14;

    if (Result) and (Trim(buscaadc.FieldByName('regime').AsString) = '') then
    begin
      vMensagem := 'Cadastro de cliente incompleto para emissão da NFS-e' + #13 + 'Cliente: ' + IntToStr(buscaadc.FieldByName('cod_cliente').AsInteger) + #13 + '         ' + Trim(buscaadc.FieldByName('nome_cliente').AsString) + #13 + '         ' + Trim(buscaadc.FieldByName('razao').AsString) + #13 + #13 + 'Por favor preencha no cadastro o campo Regime Federal, o sistema necessita da informação para reter ou não valores' + ' de IRRF/PIS/COFINS/CSSL';
      Application.MessageBox(PWideChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
      buscaadc.sql.Text := '';
      raise Exception.Create(vMensagem);
    end;

    if (Result) and ((Trim(buscaadc.FieldByName('regime').AsString) = 'SIMPLES') or (Trim(buscaadc.FieldByName('regime').AsString) = 'MEI')) then
      Result := False;

  end;

begin
  try
// a retenção do IRRF e da Contribuicao esta sendo efetuada no final do metodo
    result := true;
    IniciaTransacao;
    vdatadia := getDatahoraBanco(buscas, cadempresa.vusdataserv);
    vvalservt := 0;
    vltotserv := 0;
    vvalissret := 0;
//Soma todos os serviços da O.S.
    buscaadc.close;
    buscaadc.sql.text := 'select sum(valor_tot_serv-rateio_desc) as valor from ' + 'pedvenda_serv where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and coalesce(status,'''') <> ''CANCELADO''';
//buscaadc.sql.text:='select sum(valor_tot_serv-rateio_desc) as valor from '+
//'pedvenda_serv where nped = '+inttostr(vos)+' and tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa);
    buscaadc.open;
    vltotserv := buscaadc.FieldByName('VALOR').AsCurrency;
// busca Serviço de terceiro...
    buscaadc.close;
    buscaadc.sql.text := 'select sum(VL_SERVT) as valor from ' + 'PEDVENDA_SERV_TERC where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa);

//buscaadc.sql.text:='select sum(VL_SERVT) as valor from '+
//'PEDVENDA_SERV_TERC where nped = '+inttostr(vos)+' and tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa);
    buscaadc.open;
    vvalservt := buscaadc.FieldByName('VALOR').AsCurrency;
//Faz a proporcionalidade do Serviço em relação ao Serviço de terceiro...
    BuscasMnt.close;
    BuscasMnt.CommandText := 'select it.* from pedvenda_serv it where ' + 'it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.status_nfse is null or it.status_nfse = '''') ' + ' and coalesce(it.status,'''') <> ''CANCELADO''';
    BuscasMnt.Open;
    while not BuscasMnt.eof do
    begin
      vretiss := 0;
      BuscasMnt.edit;
      vratservt := 0;
      if vvalservt <> 0 then
      begin
        if vltotserv <> 0 then
        begin
          vratservt := (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency) / vltotserv) * vvalservt);
        end;
      end;
      buscaadc.close;
      buscaadc.sql.Text := 'select coalesce(iss_retido,0) as iss_retido from clientes where cod_cliente = ' + '(select cod_cliente from pedvenda where nped = ' + BuscasMnt.FieldByName('NPED').AsString + ' and tipo = ''' + BuscasMnt.FieldByName('TIPO').AsString + ''' and cod_empresa = ' + BuscasMnt.FieldByName('COD_EMPRESA').AsString + ') and cod_empresa = ' + BuscasMnt.FieldByName('COD_EMPRESA').AsString;
      buscaadc.Open;
      if buscaadc.FieldByName('iss_retido').AsInteger <> 0 then
        vretiss := buscaadc.FieldByName('iss_retido').AsInteger;
      buscaadc.close;
      buscaadc.sql.text := 'select irrf_servico,VL_TETO_IRRF,aliq_iss,iss_retido from ' + 'TIPO_SERVICO where cod_servico = ' + trocaVirgulaPorPonto(BuscasMnt.FieldByName('COD_SERVICO').AsString);
      buscaadc.open;
      if (vretiss = 0) then
      begin
        if buscaadc.FieldByName('ISS_RETIDO').AsInteger <> 0 then
          vretiss := buscaadc.FieldByName('ISS_RETIDO').AsInteger
        else
          vretiss := 2;
      end;
      BuscasMnt.FieldByName('VALOR_B_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;

      if buscaadc.FieldByName('irrf_servico').AsCurrency <> 0 then
      begin
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;
        if BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency >= buscaadc.FieldByName('VL_TETO_IRRF').AsCurrency then
        begin
          BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := ((BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency * buscaadc.FieldByName('irrf_servico').AsCurrency) / 100);
          BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency - ((BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency * buscaadc.FieldByName('irrf_servico').AsCurrency) / 100);
        end
        else
        begin
          BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := 0;
          BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency := 0;
        end;
      end
      else
      begin
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;
        BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := 0;
        BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency := 0;
      end;
      if vretiss = 1 then
      begin
        vvalissret := (BuscasMnt.FieldByName('VALOR_B_NFSE').AsCurrency * (buscaadc.FieldByName('ALIQ_ISS').AsFloat / 100));
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency - vvalissret;
//    (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency-BuscasMnt.FieldByName('rateio_desc').AsCurrency)+vratservt)*
//    (buscaadc.FieldByName('ALIQ_ISS').AsFloat/100));
        BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency := vvalissret;
//    (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency-BuscasMnt.FieldByName('rateio_desc').AsCurrency)+vratservt)*
//    (buscaadc.FieldByName('ALIQ_ISS').AsFloat/100));
      end;
      BuscasMnt.FieldByName('iss_retido').AsInteger := vretiss;
      BuscasMnt.Post;
      BuscasMnt.ApplyUpdates(-1);
      BuscasMnt.next;
    end;
//
    BuscasMnt.close;
    BuscasMnt.CommandText := 'select it.* from os_item_serv it where ' + 'it.n_os in (' + vospesq + ') and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.status_nfse is null or it.status_nfse = '''')';

//BuscasMnt.CommandText:='select it.* from os_item_serv it where '+
//'it.n_os = '+inttostr(vos)+' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+' and (it.status_nfse is null or it.status_nfse = '''')';
    BuscasMnt.Open;
    while not BuscasMnt.eof do
    begin
      vretiss := 2;
      BuscasMnt.edit;
      vratservt := 0;
      if vvalservt <> 0 then
      begin
        if vltotserv <> 0 then
        begin
          vratservt := (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency) / vltotserv) * vvalservt);
        end;
      end;
      buscaadc.close;
      buscaadc.sql.text := 'select irrf_servico,VL_TETO_IRRF,aliq_iss from ' + 'TIPO_SERVICO where cod_servico = ' + trocaVirgulaPorPonto(BuscasMnt.FieldByName('COD_SERVICO').AsString);
      buscaadc.open;
      if buscaadc.FieldByName('irrf_servico').AsCurrency <> 0 then
      begin
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;
        if BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency >= buscaadc.FieldByName('VL_TETO_IRRF').AsCurrency then
        begin
          BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := ((BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency * buscaadc.FieldByName('irrf_servico').AsCurrency) / 100);
          BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency - ((BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency * buscaadc.FieldByName('irrf_servico').AsCurrency) / 100);
        end
        else
          BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := 0;
      end
      else
      begin
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;
        BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := 0;
      end;
{  BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency:=(BuscasMnt.FieldByName('valor_tot_serv').AsCurrency-
  BuscasMnt.FieldByName('rateio_desc').AsCurrency)+vratservt;}
      BuscasMnt.Post;
      BuscasMnt.ApplyUpdates(-1);
      BuscasMnt.next;
    end;
    CommitaTransacao;
    Sleep(1000);
    IniciaTransacao;
    buscaadc.close;
    buscaadc.sql.text := 'select tp.ctiss,tp.aliq_iss,tp.nfs_servico,tp.cnae_serv,it.iss_retido,tp.irrf_servico,it.cod_servico,' + 'it.nped,it.cod_rps,(it.valor_tot_serv-it.rateio_desc) as valor  from ' + 'tipo_servico tp inner join pedvenda_serv it on tp.cod_servico = it.cod_servico and ' + 'it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.n_nf is null or it.n_nf = 0) ' + ' and coalesce(it.status,'''') <> ''CANCELADO'' order by 1,2,3,4,5';
//'inner join pedvenda pd on it.nped = pd.nped and it.tipo = pd.tipo and it.cod_empresa = pd.cod_empresa '+
//'inner join clientes cl on pd.cod_cliente = cl.cod_cliente and pd.cod_empresa = cl.cod_empresa ';

//buscaadc.sql.text:='select tp.aliq_iss,tp.nfs_servico,tp.cnae_serv,tp.iss_retido,tp.irrf_servico,it.cod_servico,'+
//'it.nped,it.cod_rps,(it.valor_tot_serv-it.rateio_desc) as valor from '+
//'tipo_servico tp inner join pedvenda_serv it on tp.cod_servico = it.cod_servico and '+
//'it.nped = '+inttostr(vos)+' and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
//' and (it.n_nf is null or it.n_nf = 0) ';
    buscaadc.open;
    valiqint := 0;
    vnfs_servicoint := '';
    ctissint := '';
    vcnae_tpserv := '';
    vretissint := 0;
    vosNFSe := vos;
    while not buscaadc.eof do
    begin
      if buscaadc.FieldByName('valor').AsCurrency > 0 then
      begin
        if (valiqint <> buscaadc.fieldbyname('aliq_iss').AsFloat) or (buscaadc.fieldbyname('nfs_servico').AsString <> vnfs_servicoint) or (ctissint <> buscaadc.fieldbyname('ctiss').AsString) or (vretissint <> buscaadc.fieldbyname('iss_retido').AsInteger) or (vcnae_tpserv <> buscaadc.fieldbyname('cnae_serv').AsString) then
        begin
          if buscaadc.FieldByName('COD_RPS').AsInteger = 0 then
            vrps := Gencodigo('RPS', DtmNFEHW.SpIncCodigo, IntToStr(cadempresa.codempresa))
          else
            vrps := buscaadc.FieldByName('COD_RPS').AsInteger;
          valiqint := buscaadc.fieldbyname('aliq_iss').AsFloat;
          vnfs_servicoint := buscaadc.fieldbyname('nfs_servico').AsString;
          ctissint := buscaadc.fieldbyname('ctiss').AsString;
          vretissint := buscaadc.fieldbyname('iss_retido').AsInteger;
          vcnae_tpserv := buscaadc.fieldbyname('cnae_serv').AsString;
        end;
        if buscaadc.FieldByName('COD_RPS').AsInteger = 0 then
        begin
          buscas.close;
          buscas.sql.text := 'UPDATE PEDVENDA_SERV SET aliq_iss=' + trocaVirgulaPorPonto(buscaadc.fieldbyname('aliq_iss').AsString) + ',nfs_servico = ''' + buscaadc.fieldbyname('nfs_servico').AsString + ''',cnae_serv=' + buscaadc.fieldbyname('cnae_serv').AsString + ',iss_retido=' + buscaadc.fieldbyname('iss_retido').AsString + ',cod_rps = ' + inttostr(vrps) + ', emissao_rps = ' + QuotedStr(FormatDateTime('mm/dd/yyyy hh:nn:ss', vdatadia)) + ',ctiss=''' + buscaadc.fieldbyname('ctiss').AsString + ''' ' + ' where nped = ' + buscaadc.fieldbyname('nped').AsString + ' and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and cod_servico = ' + buscaadc.fieldbyname('cod_servico').AsString + ' and coalesce(status,'''') <> ''CANCELADO''';
          buscas.Prepare;
          buscas.ExecSQL;

          buscas.sql.text := 'UPDATE OS_ITEM_SERV SET aliq_iss=' + trocaVirgulaPorPonto(buscaadc.fieldbyname('aliq_iss').AsString) + ',nfs_servico = ''' + buscaadc.fieldbyname('nfs_servico').AsString + ''',cnae_serv=' + buscaadc.fieldbyname('cnae_serv').AsString + ',iss_retido=' + buscaadc.fieldbyname('iss_retido').AsString + ',cod_rps = ' + inttostr(vrps) + ',emissao_rps = ' + QuotedStr(FormatDateTime('mm/dd/yyyy hh:nn:ss', vdatadia)) + ' where N_OS = ' + buscaadc.fieldbyname('nped').AsString + ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and cod_servico = ' + buscaadc.fieldbyname('cod_servico').AsString;
          buscas.Prepare;
          buscas.ExecSQL;
        end
        else
        begin
          buscas.close;
          buscas.sql.text := 'UPDATE PEDVENDA_SERV SET aliq_iss=' + trocaVirgulaPorPonto(buscaadc.fieldbyname('aliq_iss').AsString) + ',nfs_servico = ''' + buscaadc.fieldbyname('nfs_servico').AsString + ''',cnae_serv=' + buscaadc.fieldbyname('cnae_serv').AsString + ',iss_retido=' + buscaadc.fieldbyname('iss_retido').AsString + ',ctiss=''' + buscaadc.fieldbyname('ctiss').AsString + ''' ' + ' where nped = ' + buscaadc.fieldbyname('nped').AsString + ' and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and cod_servico = ' + buscaadc.fieldbyname('cod_servico').AsString + ' and coalesce(status,'''') <> ''CANCELADO''';
          buscas.Prepare;
          buscas.ExecSQL;

          buscas.sql.text := 'UPDATE OS_ITEM_SERV SET aliq_iss=' + trocaVirgulaPorPonto(buscaadc.fieldbyname('aliq_iss').AsString) + ',nfs_servico = ''' + buscaadc.fieldbyname('nfs_servico').AsString + ''',cnae_serv=' + buscaadc.fieldbyname('cnae_serv').AsString + ',iss_retido=' + buscaadc.fieldbyname('iss_retido').AsString + ' where N_OS = ' + buscaadc.fieldbyname('nped').AsString + ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and cod_servico = ' + buscaadc.fieldbyname('cod_servico').AsString;
          buscas.Prepare;
          buscas.ExecSQL;
        end;
      end;
      buscaadc.next;
    end;

  //Efetuando as retenções se for o caso
 //Soma todos os serviços da O.S.
    buscaadc.close;
    buscaadc.sql.text := 'select sum(valor_tot_serv-rateio_desc) as valor from ' + 'pedvenda_serv where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and coalesce(status,'''') <> ''CANCELADO''';
    buscaadc.open;
    vltotserv := buscaadc.FieldByName('VALOR').AsCurrency;
  // busca Serviço de terceiro...
    buscaadc.close;
    buscaadc.sql.text := 'select sum(VL_SERVT) as valor from ' + 'PEDVENDA_SERV_TERC where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa);
    buscaadc.open;
    vvalservt := buscaadc.FieldByName('VALOR').AsCurrency;

  //soma dos valores totais por rps
    BuscasMnt.close;
    BuscasMnt.CommandText := 'select it.nfs_servico, it.cod_rps, sum(coalesce(it.valor_tot_serv,0) - coalesce(it.rateio_desc,0)) valor_total' + ' from pedvenda_serv it where ' + 'it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.status_nfse is null or it.status_nfse = '''') ' + ' and coalesce(it.status,'''') <> ''CANCELADO''' + ' group by 1,2';
    BuscasMnt.Open;

    vCountArray := 0;
    vStrRetencaoIRRF := '';
    vStrRetencaoContrib := '';
    vRetencaoCliente := False;
    SetLength(vArrayRPSRetencao, 0);
    vJaTestouGarantia := False;
    BuscasMnt.First;
    while not BuscasMnt.Eof do // testa o valor de cada rps para ver se passou o teto para efetuar a retencao logo depois
    begin
      buscas.Close;
      buscas.SQL.Text := 'select IRRF_SERVICO, VL_TETO_IRRF, VL_TETO_CONTRIB,' + ' ALIQ_PIS_RET, ALIQ_COFINS_RET, ALIQ_CSSL_RET from TIPOSERVICONFSE' + ' where COD_TPSERVICO = ' + QuotedStr(BuscasMnt.FieldByName('nfs_servico').AsString);
      buscas.Open;

      if (vvalservt > 0) and (vltotserv > 0) then
        vratservt := (BuscasMnt.FieldByName('valor_total').AsCurrency / vltotserv) * vvalservt
      else
        vratservt := 0;
      vValorTmp := BuscasMnt.FieldByName('valor_total').AsFloat + vratservt;
      vValorTmp := StrToFloat(Format('%0.2f', [vValorTmp]));

      if (vValorTmp > buscas.FieldByName('VL_TETO_CONTRIB').AsFloat) and ((buscas.FieldByName('ALIQ_PIS_RET').AsFloat > 0) or (buscas.FieldByName('ALIQ_COFINS_RET').AsFloat > 0) or (buscas.FieldByName('ALIQ_CSSL_RET').AsFloat > 0)) then
      begin
        vRetencaoCliente := reterRPSparaCliente(BuscasMnt.FieldByName('cod_rps').AsInteger, vos, vospesq);
        if vRetencaoCliente then
        begin
          vCountArray := vCountArray + 1;
          SetLength(vArrayRPSRetencao, vCountArray);
          vArrayRPSRetencao[vCountArray - 1] := BuscasMnt.FieldByName('cod_rps').AsInteger;
        end;
      end
      else if (vValorTmp > buscas.FieldByName('VL_TETO_IRRF').AsFloat) and (buscas.FieldByName('IRRF_SERVICO').AsFloat > 0) then
      begin
        vRetencaoCliente := reterRPSparaCliente(BuscasMnt.FieldByName('cod_rps').AsInteger, vos, vospesq);
        if vRetencaoCliente then
        begin
          vCountArray := vCountArray + 1;
          SetLength(vArrayRPSRetencao, vCountArray);
          vArrayRPSRetencao[vCountArray - 1] := BuscasMnt.FieldByName('cod_rps').AsInteger;
        end;
      end;
      if (vRetencaoCliente) and (vValorTmp > buscas.FieldByName('VL_TETO_IRRF').AsFloat) and (buscas.FieldByName('IRRF_SERVICO').AsFloat > 0) then
        vStrRetencaoIRRF := vStrRetencaoIRRF + '|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|';

      if (vRetencaoCliente) and (vValorTmp > buscas.FieldByName('VL_TETO_CONTRIB').AsFloat) and ((buscas.FieldByName('ALIQ_PIS_RET').AsFloat > 0) or (buscas.FieldByName('ALIQ_COFINS_RET').AsFloat > 0) or (buscas.FieldByName('ALIQ_CSSL_RET').AsFloat > 0)) then
        vStrRetencaoContrib := vStrRetencaoContrib + '|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|';
      BuscasMnt.Next;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select cod_rps, nfs_servico, sum(valor_tot_serv - rateio_desc) as valor' +
                       ' from pedvenda_serv' +
                       ' where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and coalesce(status,'''') <> ''CANCELADO''' +
                       ' group by 1,2';
    buscas.open;
    buscas.First;

    while not buscas.Eof do
    begin
    
      ADiscriminacaoServico := getDiscriminacaoServicos(buscas.FieldByName('cod_rps').AsInteger,
                                                        buscas.FieldByName('nfs_servico').AsString,
                                                        buscas.FieldByName('valor').AsFloat);
      if ADiscriminacaoServico.Trim.Length > 2000 then
      begin
        buscas.sql.Text := '';
        raise Exception.Create('Discriminação dos serviços excede 2000 caracteres aceitos pelo webservice.' + #13 +
                               'Por favor selecione menos O.S.''s ou diminua as observações' + #13 + 
                               'Total de caracteres: ' + ADiscriminacaoServico.Trim.Length.ToString);
      end;
      buscas.Next;
    end;  

    if (not vRetencaoCliente) or (Length(vArrayRPSRetencao) = 0) then // casno não haja retenção a fazer o sistema comita e continua o processamento
    begin
      buscas.Close;
      buscas.SQL.Text := 'update pedvenda_serv it set it.IRRF_SERVICO = 0,' + ' it.PISRF_SERVICO = 0, it.COFINSRF_SERVICO = 0, it.CSSLRF_SERVICO = 0,' + ' it.VALOR_NFSE = coalesce(VALOR_B_NFSE, 0) - coalesce(ISSRET_SERVICO, 0)' + ' where it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.status_nfse is null or it.status_nfse = '''') ' + ' and coalesce(it.status,'''') <> ''CANCELADO''';
      buscas.ExecSQL;
      CommitaTransacao;
      Exit;
    end;

  //confirmei com a Adryele da Tonziro, a retenção deve olhar o valor da nota fiscal, e nao do servico em si. Pois se
  // varias O.S formarem uma unica nota fiscal o valor total da nota deve ser considerado para decidir se vai reter
  //Confirmei tambem que a retenção será apenas de empresa normal para empresa normal, quando for simples nacional não
  // vai reter

    for I := 0 to Length(vArrayRPSRetencao) - 1 do // percorre cada rps para fazer a retenção
    begin
      vTotRetencaoIRRF := 0;
      vTotRetencaoContribPIS := 0;
      vTotRetencaoContribCOFINS := 0;
      vTotRetencaoContribCSSL := 0;

    // salvando a retenção total para conferir no final
      BuscasMnt.close;
      BuscasMnt.CommandText := 'select it.nfs_servico, it.cod_rps, sum(coalesce(it.valor_tot_serv,0) - coalesce(it.rateio_desc,0)) valor_total' + ' from pedvenda_serv it where ' + 'it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.status_nfse is null or it.status_nfse = '''') ' + ' and coalesce(it.status,'''') <> ''CANCELADO''' + ' and it.cod_rps = ' + IntToStr(vArrayRPSRetencao[i]) + ' group by 1,2';
      BuscasMnt.Open;
      if (vvalservt > 0) and (vltotserv > 0) then
        vratservt := (BuscasMnt.FieldByName('valor_total').AsCurrency / vltotserv) * vvalservt
      else
        vratservt := 0;
      vValorTmp := BuscasMnt.FieldByName('valor_total').AsFloat + vratservt;
      vValorTmp := StrToFloat(Format('%0.2f', [vValorTmp]));

      buscaadc.Close;
      buscaadc.SQL.Text := 'select IRRF_SERVICO, VL_TETO_IRRF, VL_TETO_CONTRIB,' + ' ALIQ_PIS_RET, ALIQ_COFINS_RET, ALIQ_CSSL_RET from TIPOSERVICONFSE' + ' where COD_TPSERVICO = ' + QuotedStr(BuscasMnt.FieldByName('nfs_servico').AsString);
      buscaadc.Open;

      if Pos('|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|', vStrRetencaoIRRF) > 0 then
      begin// salva o valor da retencao do IRRF total
        vTotRetencaoIRRF := (vValorTmp) * buscaadc.FieldByName('IRRF_SERVICO').AsFloat / 100;
        vTotRetencaoIRRF := StrToFloat(Format('%0.2f', [vTotRetencaoIRRF]));
      end;
      if Pos('|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|', vStrRetencaoContrib) > 0 then
      begin// salva o valor da retencao da Contribuição total
        vTotRetencaoContribPIS := (vValorTmp) * buscaadc.FieldByName('ALIQ_PIS_RET').AsFloat / 100;
        vTotRetencaoContribPIS := StrToFloat(Format('%0.2f', [vTotRetencaoContribPIS]));

        vTotRetencaoContribCOFINS := (vValorTmp) * buscaadc.FieldByName('ALIQ_COFINS_RET').AsFloat / 100;
        vTotRetencaoContribCOFINS := StrToFloat(Format('%0.2f', [vTotRetencaoContribCOFINS]));

        vTotRetencaoContribCSSL := (vValorTmp) * buscaadc.FieldByName('ALIQ_CSSL_RET').AsFloat / 100;
        vTotRetencaoContribCSSL := StrToFloat(Format('%0.2f', [vTotRetencaoContribCSSL]));
      end;

    //inicio onde vai aplicar a retanção item a item
      BuscasMnt.close;
      BuscasMnt.CommandText := 'select it.* from pedvenda_serv it where ' + 'it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.status_nfse is null or it.status_nfse = '''') ' + ' and coalesce(it.status,'''') <> ''CANCELADO''' + ' and cod_rps = ' + inttostr(vArrayRPSRetencao[i]);
      BuscasMnt.Open;

      vSumRetencaoIRRF := 0; // variavel onde vai acumulado o valor da retenção
      vSumRetencaoContribPIS := 0; // variavel onde vai acumulado o valor da retenção
      vSumRetencaoContribCOFINS := 0; // variavel onde vai acumulado o valor da retenção
      vSumRetencaoContribCSSL := 0; // variavel onde vai acumulado o valor da retenção
      BuscasMnt.First;
      while not BuscasMnt.Eof do
      begin
      //obtendo o valor liquido do item
        if (vvalservt > 0) and (vltotserv > 0) then
          vratservt := (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency) / vltotserv) * vvalservt)
        else
          vratservt := 0;
        vValorTmp := BuscasMnt.FieldByName('valor_tot_serv').AsCurrency - BuscasMnt.FieldByName('rateio_desc').AsCurrency + vratservt;
        vValorTmp := StrToFloat(Format('%0.2f', [vValorTmp]));

        vRetencaoIRRF := 0;
        if Pos('|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|', vStrRetencaoIRRF) > 0 then
        begin//caso a retenção do IRRF deva ser aplicada vai ter o codigo do rps na variavel testada
          vRetencaoIRRF := (vValorTmp) * buscaadc.FieldByName('IRRF_SERVICO').AsFloat / 100;
          vRetencaoIRRF := StrToFloat(Format('%0.2f', [vRetencaoIRRF]));
          vSumRetencaoIRRF := vSumRetencaoIRRF + vRetencaoIRRF;
        end;

        vRetencaoContribPIS := 0;
        vRetencaoContribCOFINS := 0;
        vRetencaoContribCSSL := 0;
        if Pos('|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|', vStrRetencaoContrib) > 0 then
        begin//caso a retenção da contribuicao deva ser aplicada vai ter o codigo do rps na variavel testada
          vRetencaoContribPIS := (vValorTmp) * buscaadc.FieldByName('ALIQ_PIS_RET').AsFloat / 100;
          vRetencaoContribPIS := StrToFloat(Format('%0.2f', [vRetencaoContribPIS]));
          vSumRetencaoContribPIS := vSumRetencaoContribPIS + vRetencaoContribPIS;

          vRetencaoContribCOFINS := (vValorTmp) * buscaadc.FieldByName('ALIQ_COFINS_RET').AsFloat / 100;
          vRetencaoContribCOFINS := StrToFloat(Format('%0.2f', [vRetencaoContribCOFINS]));
          vSumRetencaoContribCOFINS := vSumRetencaoContribCOFINS + vRetencaoContribCOFINS;

          vRetencaoContribCSSL := (vValorTmp) * buscaadc.FieldByName('ALIQ_CSSL_RET').AsFloat / 100;
          vRetencaoContribCSSL := StrToFloat(Format('%0.2f', [vRetencaoContribCSSL]));
          vSumRetencaoContribCSSL := vSumRetencaoContribCSSL + vRetencaoContribCSSL;
        end;

      //update no item com o valor calculado da retenção e no valor da NFS
        buscas.Close;
        buscas.SQL.Text := 'update pedvenda_serv set IRRF_SERVICO = :IRRF_SERVICO,' + ' PISRF_SERVICO = :PISRF_SERVICO, COFINSRF_SERVICO = :COFINSRF_SERVICO, CSSLRF_SERVICO = :CSSLRF_SERVICO,' + ' VALOR_NFSE = :VALOR_NFSE' + ' where NPED = ' + IntToStr(BuscasMnt.FieldByName('NPED').AsInteger) + ' AND TIPO = ' + QuotedStr(Trim(BuscasMnt.FieldByName('TIPO').AsString)) + ' AND COD_EMPRESA = ' + IntToStr(BuscasMnt.FieldByName('COD_EMPRESA').AsInteger) + ' AND NITEM = ' + IntToStr(BuscasMnt.FieldByName('NITEM').AsInteger) + ' AND COD_SERVICO = ' + IntToStr(BuscasMnt.FieldByName('COD_SERVICO').AsInteger);
        buscas.ParamByName('IRRF_SERVICO').AsFloat := vRetencaoIRRF;

        buscas.ParamByName('PISRF_SERVICO').AsFloat := vRetencaoContribPIS;
        buscas.ParamByName('COFINSRF_SERVICO').AsFloat := vRetencaoContribCOFINS;
        buscas.ParamByName('CSSLRF_SERVICO').AsFloat := vRetencaoContribCSSL;

        buscas.ParamByName('VALOR_NFSE').AsFloat := BuscasMnt.FieldByName('VALOR_B_NFSE').AsFloat - BuscasMnt.FieldByName('ISSRET_SERVICO').AsFloat - buscas.ParamByName('IRRF_SERVICO').AsFloat - buscas.ParamByName('PISRF_SERVICO').AsFloat - buscas.ParamByName('COFINSRF_SERVICO').AsFloat - buscas.ParamByName('CSSLRF_SERVICO').AsFloat;
        BuscasMnt.Next;

        if BuscasMnt.Eof then
        begin//case seja o ultimo registro aqui o sistema joga a diferenca do valor calculado no inicio com o acumulado, para evitar divergencia quando for somar os valores dos itens
          if (buscas.ParamByName('IRRF_SERVICO').AsFloat + (vTotRetencaoIRRF - vSumRetencaoIRRF)) > 0 then
            buscas.ParamByName('IRRF_SERVICO').AsFloat := buscas.ParamByName('IRRF_SERVICO').AsFloat + (vTotRetencaoIRRF - vSumRetencaoIRRF);

          if (buscas.ParamByName('PISRF_SERVICO').AsFloat + (vTotRetencaoContribPIS - vSumRetencaoContribPIS)) > 0 then
            buscas.ParamByName('PISRF_SERVICO').AsFloat := buscas.ParamByName('PISRF_SERVICO').AsFloat + (vTotRetencaoContribPIS - vSumRetencaoContribPIS);
          if (buscas.ParamByName('COFINSRF_SERVICO').AsFloat + (vTotRetencaoContribCOFINS - vSumRetencaoContribCOFINS)) > 0 then
            buscas.ParamByName('COFINSRF_SERVICO').AsFloat := buscas.ParamByName('COFINSRF_SERVICO').AsFloat + (vTotRetencaoContribCOFINS - vSumRetencaoContribCOFINS);
          if (buscas.ParamByName('CSSLRF_SERVICO').AsFloat + (vTotRetencaoContribCSSL - vSumRetencaoContribCSSL)) > 0 then
            buscas.ParamByName('CSSLRF_SERVICO').AsFloat := buscas.ParamByName('CSSLRF_SERVICO').AsFloat + (vTotRetencaoContribCSSL - vSumRetencaoContribCSSL);

          buscas.ParamByName('VALOR_NFSE').AsFloat := BuscasMnt.FieldByName('VALOR_B_NFSE').AsFloat - BuscasMnt.FieldByName('ISSRET_SERVICO').AsFloat - buscas.ParamByName('IRRF_SERVICO').AsFloat - buscas.ParamByName('PISRF_SERVICO').AsFloat - buscas.ParamByName('COFINSRF_SERVICO').AsFloat - buscas.ParamByName('CSSLRF_SERVICO').AsFloat;
        end;
        buscas.ExecSQL;
      end;
    end;      

    CommitaTransacao;
  except
    on e: exception do
    begin
      RollBackTransacao;
      Result := false;
      if application.messagebox('Erro ao Gerar RPS. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message + ' - ' + buscas.sql.Text), PWideChar('Error'), MB_OK);
    end;
  end;
end;

function TClassNfSe.montarRPSEnv(vos: integer; valiq: real;
  vnfs_servico: string; vcnae_serv: integer): boolean;
var
 vstatus: string;
begin
  Result := False;

  if trim(cadempresa.dataSet.FieldByName('MODELO_NF_SERV').AsString) <> '55' then
  begin
    Application.MessageBox(PWideChar('NFSe não configurada para esta empresa'),PWideChar('Aviso'), MB_OK);
    Exit;
  end;

  if not FSilentMode then
    if not verificapendRPS then
      if not PesqPros(true,'NFS006','') then
        exit;

  if dataSet.FieldByName('COD_RPS').AsString <> '' then
  begin
    buscaadc.close;
    buscaadc.sql.text := 'select first 1 status_nfse from pedvenda_serv where cod_rps = '+
      dataSet.FieldByName('COD_RPS').AsString+' and cod_empresa = '+inttostr(cadempresa.codempresa);
    buscaadc.open;
    vstatus := buscaadc.FieldByName('status_nfse').AsString;
  end
  else
    vstatus:=dataSet.FieldByName('status_nfse').AsString;

  if (vstatus <> '') and (vstatus <> 'Em Processamento') then
  begin
    if not FSilentMode then
    begin
      Application.MessageBox(PWideChar('RPS já Enviado e Autorizado'),PWideChar('Aviso'), MB_OK);
      result := false;
    end
    else
      Result := True;
  end
  else
  begin
    zerarAtributos;
    vospesq := IntToStr(vos);
    if montaRPSos(vos, valiq, vnfs_servico, vcnae_serv) then
      Result := enviarRPS(vos);
  end;


end;

function TClassNfSe.montarRPSEnv(vos: string; valiq: real;
  vnfs_servico: string; vcnae_serv: integer): boolean;
var
 vstatus: string;
begin
result:=true;
  if trim(cadempresa.dataSet.FieldByName('MODELO_NF_SERV').AsString) <> '55' then
  begin
    Application.MessageBox(PWideChar('NFSe não configurada para esta empresa'),PWideChar('Aviso'), MB_OK);
    Result := False;
  end
  else
  begin
    if not verificapendRPS then
    begin
     if not PesqPros(true,'NFS006','') then
     begin
      Result := False;
      exit;
     end;
    end;
    zerarAtributos;
    vospesq:=vos;
    if montaRPSos(0,valiq,vnfs_servico,vcnae_serv) then
    begin
     enviarRPS(0);
    end;
  end;
end;

function TClassNfSe.montarTXT(vflag: integer): boolean;
var
 Arq: TextFile;
begin

  Result := False;

  begin
    if vcidadegertxt = nil then
    begin
      ShowAtencao('Cidade do Webservice não Instanciada. Verifique compatibilidade com a cidade em questão');
      exit;
    end;

    try
      if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
      begin
        sigiss_LoadDocEletronico(buscasmnt.FieldByName('COD_RPS').AsInteger);
        FdocsNFSe.rps_resc := FdocsNFSe.rps;//rescue, caso ja tenha sido enviado uma vez e autorizado sem resposta do ws
        FdocsNFSe.rps      := vcidadegertxt.sigiss_getRPS(Self);
      end
      else
      begin
        if ACBrNFSe1.Configuracoes.WebServices.Ambiente = taProducao then
          vcidadegertxt.copiarschemas('P')
        else
          vcidadegertxt.copiarschemas('H');
        vcidadegertxt.montarRPSAC(ACBrNFSe1,Self);
      end;

      Result := True;

    except on e: exception do
      begin
        if ShowConfirmacao('Erro ao Gerar RPS. Mostrar Erro?', MB_YESNO + MB_DEFBUTTON2) = IDYES then
          ShowErro(E.Message);
      end;
    end;
  end;
end;

procedure TClassNfSe.mostrarmensagem(vmens: string);
begin
if FrmStatusNFSe = nil then
begin
 FrmStatusNFSe :=TFrmStatusNFSe.Create(Application);
 FrmStatusNFSe.BorderStyle := bsDialog;
 FrmStatusNFSe.Caption := 'Status';
 FrmStatusNFSe.Position := poScreenCenter;
 FrmStatusNFSe.Width := 489;
 FrmStatusNFSe.Height := 72;
end;
if ( FrmStatusNFSe <> nil ) then
begin
  if vmens = '' then
  begin
   FrmStatusNFSe.Hide;
   application.ProcessMessages;
  end
  else
  begin
   FrmStatusNFSe.lblStatus.Caption := vmens;
   FrmStatusNFSe.Show;
   FrmStatusNFSe.BringToFront;
   application.ProcessMessages;
  end;
end;
end;

procedure TClassNfSe.NFSeGerarLog(const ALogLine: string;
  var Tratado: Boolean);
var
  ArquivoTexto: TextFile;
  NomeArquivo: string;
begin
  NomeArquivo := ExtractFilePath(ParamStr(0)) + 'NFSe.log';
  try
    AssignFile(ArquivoTexto, NomeArquivo);
    try
      if not FileExists(NomeArquivo) then
        Rewrite(ArquivoTexto)
      else
        append(ArquivoTexto);
      WriteLn(ArquivoTexto, ALogLine);
    finally
      closeFile(ArquivoTexto);
    end;
  except
  end;
end;

function TClassNfSe.NFSeregimetrib(vregime: integer): string;
var
 vok: boolean;
begin
  vok:=true;
  result := StrTonumero(vok, inttostr(vregime), ['1', '2', '3','4','0','5','6'], ['Microempresa Municipal', 'Estimativa','Sociedade de Profissionais','Cooperativa','NENHUM','Microempresário Individual (MEI)','Microempresário e Empresa de Pequeno Porte (ME EPP)']);
end;


function TClassNfSe.NFSNatop(vnatop: integer): string;
var
 vok: boolean;
begin
  vok:=true;
  result := StrTonumero(vok, inttostr(vnatop), ['1', '2', '3','4','5','6'], ['Tributação no município', 'Tributação fora do município','Isenção','Imune','Exigibilidade suspensa por decisão judicial','Exigibilidade suspensa por procedimento administrativo']);
end;

function TClassNfSe.NFSSimples(vtipo: integer): string;
var
 vok: boolean;
begin
  vok:=true;
  result := StrTonumero(vok, inttostr(vtipo), ['1', '2'], ['SIM', 'NÃO']);
end;

procedure TClassNfSe.pegadadosRPS;
var
 vcodrps: string;
begin
   try
    vcodrps:=BuscasMnt.FieldByName('COD_RPS').AsString;
   except
    vcodrps:=dataset.FieldByName('COD_RPS').AsString;
   end;
   buscaadc.close;
   buscaadc.sql.text:='select * from pedvenda_serv where cod_rps = '+
   vcodrps+' and cod_empresa = '+
   dataSet.FieldByName('COD_EMPRESA').AsString+' and ativo = 1';
   buscaadc.open;
   nrloterps:='';
   //buscaadc.FieldByName('LOTE_NFSE').AsString;
   Fprotoloco:=buscaadc.FieldByName('NPROTNFSE').AsString;
   FListaErros:=buscaadc.FieldByName('RESP_WS_NFSE').AsString;
   FnumeroNFSe:=buscaadc.FieldByName('N_NF').AsString;
   Fcodigover:=buscaadc.FieldByName('CODIGO_VERWSNFSE').AsString;
   Fdiscrimina:=buscaadc.FieldByName('DESC_SERVICO_RPS').AsString;
   Foutrasinf:=buscaadc.FieldByName('OUTRAS_INFNFSE').AsString;
   FCodigoCnae:=buscaadc.FieldByName('cnae_respNFSe').AsString;
   FRpsNFSe:=buscaadc.FieldByName('COD_RPS').AsString;
   nroLote:=buscaadc.FieldByName('LOTE_NFSE').AsString;
   vosNFSe:=buscaadc.FieldByName('NPED').AsInteger;
   FDataEmissaoNFSe:=buscaadc.FieldByName('emissao_NFSE').AsDateTime;
   FdataRPS:=buscaadc.FieldByName('EMISSAO_RPS').AsDateTime;
   vcoderro:='';
   Faliq:=buscaadc.FieldByName('aliq_iss').AsCurrency;
   buscaadc.close;
   buscaadc.sql.text:='select sum(valor_nfse) as valor,sum(valor_b_nfse) as bruto,'+
   'sum((valor_b_nfse)*(aliq_iss/100)) as iss,sum(irrf_servico) as irrf_servico,sum(ISSRET_SERVICO) as ISSRET_SERVICO from pedvenda_serv where cod_rps = '+
   vcodrps+' and cod_empresa = '+
   dataSet.FieldByName('COD_EMPRESA').AsString+' and ativo = 1';
   buscaadc.open;
   if cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger <> 1 then
    Fiss:=buscaadc.FieldByName('iss').AsCurrency
   else
   begin
//    FbaseCalc:=0;
//    FvalorLiq:=0;
    Fiss:=0;
    Faliq:=0;
   end;
   Fir:=buscaadc.FieldByName('IRRF_SERVICO').Ascurrency;
   FbaseCalc:=buscaadc.FieldByName('bruto').AsCurrency;
   //buscaadc.FieldByName('valor').AsCurrency+buscaadc.FieldByName('IRRF_SERVICO').Ascurrency;
   FvalorLiq:=buscaadc.FieldByName('valor').AsCurrency;
   Fvalorbruto:=buscaadc.FieldByName('bruto').AsCurrency;
   vvalNFSe:=buscaadc.FieldByName('valor').AsString;
   Fpis:=0;
   Fcofins:=0;
   Finss:=0;
//   Fir:=0;
   Fcsll:=0;
   FoutrasRet:=0;
   Fdeducoes:=0;
   Fdescadc:=0;
   FdescCond:=0;
   if buscaadc.FieldByName('ISSRET_SERVICO').Ascurrency <> 0 then
   begin
     Fissretido:=buscaadc.FieldByName('ISSRET_SERVICO').Ascurrency;
     Fiss:=0;
   end
   else
    Fissretido:=0;
end;

function TClassNfSe.pesqOsNFSe(vnos: integer): boolean;
begin
 result:=true;
 dataset.close;
 DataSet.CommandText :=
        'SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,tipo_servico.aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
        'sum(pedvenda_serv.valor_tot_serv-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
        'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
        'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
        'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
        'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
        'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
        'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
        'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
        'where pedvenda_serv.nped = '+inttostr(vnos)+' and pedvenda_serv.tipo = ''OS'' and pedvenda_serv.valor_tot_serv <> 0 and pedvenda.ativo = 1 and '+
        ' pedvenda.cod_empresa = ' + inttostr(cadempresa.codempresa)+
        ' and pedvenda.status_ped = ''FECHADA'' ' +
        ' and coalesce(pedvenda_serv.status,'''') <> ''CANCELADO'' '+
        ' group by nome_cliente,nped,tipo,aliq_iss,nfs_servico,cnae_serv,cidade,cod_rps,n_nf,cod_empresa,data_fech,status_nfse,iss_retido,ctiss ';
 dataset.Open;
 if dataset.IsEmpty then
 begin
   Application.MessageBox(PWideChar('O.S. sem serviço ou não Fechada. Não será enviada para a PREFEITURA'),PWideChar('Aviso'), MB_OK);
   Result := False;
 end;
end;

function TClassNfSe.pesqprot(vnos: integer): boolean;
begin
 buscaadc.close;
 buscaadc.sql.Text:='select NPROTNFSE,coalesce(N_NF,0) as N_NF FROM PEDVENDA_SERV WHERE NPED = '+inttostr(vnos)+
 ' and TIPO = ''OS'' and cod_empresa = '+inttostr(cadempresa.codempresa);
 buscaadc.open;
 if buscaadc.isempty then
  Result := False
 else
 begin
   if (buscaadc.FieldByName('NPROTNFSE').AsString <> '') and
   (buscaadc.FieldByName('N_NF').AsString = '0') then
    Result := False
   else
    result:=true;
 end;
 buscaadc.close;
end;

function TClassNfSe.PostXmlBanco(id, xml: string;
  query: TIBQuery): Boolean;
var
  seqIdDoc: Integer;
begin
  try
    if query = nil then
      query := buscas;

    query.Close;
    query.SQL.Text := Format(' update or insert into doc_eletronico' +
                              ' (cod_empresa, id_doc, doc)' +
                              ' values (%d, ''%s'', :doc)' +
                              ' matching (id_doc, cod_empresa)', [cadempresa.codempresa, id]);
    query.ParamByName('doc').AsString := xml;
    query.Prepare;
    query.ExecSQL;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TClassNfSe.PostXmlNFSe(nfseId: Integer; xml: string;
  query: TIBQuery): Boolean;
begin
  Result := PostXmlBanco(Format('NFSe_RPS%d', [nfseId]), xml, query);
end;

function TClassNfSe.PostXmlRPS(rpsId: Integer; xml: string;
  query: TIBQuery): Boolean;
begin
  Result := PostXmlBanco(Format('RPS%d', [rpsId]), xml, query);
end;

function TClassNfSe.rCampo(const Tipo: string; TAG: string): variant;
var
  ConteudoTag: string;
  inicio, fim: integer;
  vt: string;
begin
  Tag := UpperCase(Trim(TAG));
  inicio := pos('<' + Tag + '>', UpperCase(FGrupo));
  if inicio = 0 then
    ConteudoTag := ''
  else
  begin
    inicio := inicio + Length(Tag) + 2;
    fim := pos('</' + Tag + '>', UpperCase(FGrupo)) - inicio;
    ConteudoTag := trim(copy(FGrupo, inicio, fim));
  end;
  if tipo = 'C' then
   result:=ConteudoTag;
  if tipo = 'D' then
  begin
   vt:=copy(ConteudoTag, 01, 4)+copy(ConteudoTag, 06, 2)+
   copy(ConteudoTag, 09, 2)+copy(ConteudoTag, 12, 2)+copy(ConteudoTag, 15, 2)+copy(ConteudoTag, 18, 2);
   result:=EncodeDate(StrToInt(copy(ConteudoTag, 01, 4)), StrToInt(copy(ConteudoTag, 06, 2)), StrToInt(copy(ConteudoTag, 09, 2))) +
                      EncodeTime(StrToInt(copy(ConteudoTag, 12, 2)), StrToInt(copy(ConteudoTag, 15, 2)), StrToInt(copy(ConteudoTag, 18, 2)), 0);
  end;
  if tipo = 'F' then
   result:=strtofloat(ConteudoTag);
  if tipo = 'I' then
   result:=strtoint(ConteudoTag);
end;

procedure TClassNfSe.retirarnprot;
begin
 buscaadc.close;
 buscaadc.sql.Text:='update PEDVENDA_SERV SET NPROTNFSE=NULL WHERE NPED = '+dataset.FieldByName('NPED').AsString+
 ' and TIPO = ''OS'' and cod_empresa = '+inttostr(cadempresa.codempresa)+' AND coalesce(NPROTNFSE,'''') <> '''' and coalesce(n_nf,0) = 0' ;
 buscaadc.Prepare;
 buscaadc.ExecSQL;
end;

function TClassNfSe.rExtrai(const nivel: integer; const TagInicio: string; TagFim: string = ''; const item: integer = 1): AnsiString;
var
  Texto: AnsiString;
  i,j: integer;
  FNivel: TStringList;

begin
  //NOTA: Extrai um grupo de dentro do nivel informado
  FNivel := TStringList.Create;
  for i := 1 to 10 do
    FNivel.add('');

  FNivel.strings[0] := FArquivo;
  if Trim(TagFim) = '' then
    TagFim := TagInicio;
  Texto := FNivel.Strings[nivel - 1];
  Result := '';
  FGrupo := '';
  for i := 1 to item do
    if i < item then
      Texto := copy(Texto, pos('</' + Trim(TagFim) + '>', Texto) + length(Trim(TagFim)) + 3, maxInt);
  i := pos('<' + Trim(TagInicio) + '>', Texto);
  if i = 0 then
    i := pos('<' + Trim(TagInicio) + ' ', Texto);
  if i = 0 then
    i := pos('<' + Trim(TagInicio) + ':', Texto); //correção para webservice do Ceará
  if i = 0 then
    exit;
  Texto := copy(Texto, i, maxInt);
  j:=pos('</' + Trim(TagFim) + '>',Texto);
  if j=0 then
   j:=pos('</' + Trim(TagFim) + ':',Texto); //correção para webservice do Ceará
  Result := TrimRight(copy(Texto, 1, j - 1));
  FNivel.strings[nivel] := Result;
  FGrupo := result;
end;

function TClassNfSe.salvarPDF: boolean;
begin

end;

function TClassNfSe.salvarxmlNFSe: boolean;
var
 vstringlist: TStringList;
begin
  if trim(numeroNFSe) <> '' then
  begin
   if not FileExists(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\RetNFSe\NFSe'+numeroNFSe+'.XML') then
   begin
    vstringlist:=TStringList.create;
    vstringlist.Add(Arquivo);
    vstringlist.SaveToFile(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\RetNFSe\NFSe'+numeroNFSe+'.XML');
    vstringlist.free;
    mostrarmensagem('');
   end;
  end;
end;

function TClassNfSe.TZero(valor: currency; tam: integer): string;
var
  vl: string;
begin
  vl := format('%n', [valor]);
  while (pos('.', vl) > 0) do
  begin
    vl := copy(vl, 1, pos('.', vl) - 1) + copy(vl, pos('.', vl) + 1, (length(vl) - pos('.', vl) + 1));
  end;
  while (pos(',', vl)) > 0 do
  begin
    vl := copy(vl, 1, pos(',', vl) - 1) + copy(vl, pos(',', vl) + 1, (length(vl) - pos(',', vl) + 1));
  end;
  try
    result := strzero(strtoint64(vl), tam);
  except
    result := strzero(strtoint('0'), tam);
  end;
end;

function TClassNfSe.validardadosRPS: boolean;
begin
  result:=true;

  if buscasmnt.FieldByName('valor').AsFloat <> 0 then
  begin
    if buscasmnt.FieldByName('aliq_iss').AsFloat = 0 then
    begin
      Application.MessageBox(PWideChar('Aliquota ISS não definida para o serviço'),PWideChar('Aviso'), MB_OK);
      Result := False;
    end;
    if buscasmnt.FieldByName('iss_retido').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('ISS Retido no cadastro de serviço/cliente não definido'),PWideChar('Aviso'), MB_OK);
      Result := False;
    end;
    if cadempresa.dataSet.FieldByName('NFs_natop').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('Natureza de operação no cadastro de empresa não definido'),PWideChar('Aviso'), MB_OK);
      Result := False;
    end;
    { if cadempresa.dataSet.FieldByName('NFs_regimeTrib').asinteger = 0 then
    begin
    Application.MessageBox(PWideChar('Regime de tributação no cadastro de empresa não definido'),PWideChar('Aviso'), MB_OK);
    Result := False;
    end;}
    if buscasmnt.FieldByName('serie_serv_nfe').asstring = '' then
    begin
      Application.MessageBox(PWideChar('Série de Serviço no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
      Result := False;
    end;
    if buscasmnt.FieldByName('cnae_serv').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('CNAE de Serviço no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
      Result := False;
    end;
    if cadempresa.dataSet.FieldByName('NFs_optanteSimples').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('Optante Simples no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
      Result := False;
    end;
    if cadempresa.dataSet.FieldByName('incentivadorCult').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('Incentivador Cultural no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
      Result := False;
    end;
  //   if cadempresa.dataSet.FieldByName('NFs_cert').asstring = '' then
  //   begin
  //    Application.MessageBox(PWideChar('Endereço Certificado ISS no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
  //    Result := False;
  //   end;
  //   if cadempresa.dataSet.FieldByName('env_NFSe').asstring  = '' then
  //   begin
  //    Application.MessageBox(PWideChar('String de Envelopamento XML(ex.: ii:) no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
  //    Result := False;
  //   end;
  end;
  // Testar também a licenca para uso da DLL FlexDocs
end;

procedure TClassNfSe.vercidadeNFSe;
begin
 var ibgeId := cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;

 if cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString = '3127701' then
  vcidadegertxt:=TClasstribcidGV.create
// else if cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString = '3106200' then
//  vcidadegertxt:=TClasstribcidBH.create
// else if cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString = '3168606' then
//  vcidadegertxt:=TClasstribcidTO.create
 else if MatchStr(cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString, ['1302603']) then
   vcidadegertxt := TClassNFSeAbaco.create
 else
   vcidadegertxt := TClassNFSeDefault.create(ibgeId);
end;

function TClassNfSe.verificapendRPS: boolean;
begin
 result:=true;
if cadempresa.dataSet.FieldByName('NFEPENDEMDIAS').AsString <> '' then
 begin
   if cadempresa.vqtdependemdias <> '0' then
   begin
     buscaadc.Close;
     buscaadc.sql.text:='select min(emissao_rps) as dataemissao from pedvenda_serv where '+
     ' (n_nf is null or n_nf = 0) and ((not cod_rps is null) and cod_rps <> 0) and '+
     '(not emissao_rps is null) and (valor_tot_serv <> 0) and cod_empresa = '+inttostr(cadempresa.codempresa)+' and ativo = 1 and modelo_NFSe = ''55'' '+
     ' and coalesce(status,'''') <> ''CANCELADO''';
     buscaadc.open;
     if not buscaadc.IsEmpty then
     begin
       if not buscaadc.FieldByName('dataemissao').IsNull then
       begin
         if (getDataBanco(buscas,cadempresa.vusdataserv)-buscaadc.FieldByName('dataemissao').AsDateTime) >
         StrToInt(cadempresa.vqtdependemdias) then
         begin
           Application.MessageBox(PWideChar('Existem RPSs pendentes com data emissao acima de '+#13+
           cadempresa.vqtdependemdias+' dias definidos na configuração, '+
           'Verifique estes RPS  no Formulário de consulta de NFSe opção ''não autorizadas'''),PWideChar('Error'), MB_OK);
           Result := False;
           buscaadc.close;
           exit;
         end;
       end;
     end;
   end;
 end;
end;

procedure TClassNfSe.verificarCaracteresNFSe;
var
  I: Integer;
  Alog: TStrings;
begin
  try
    if getini('NFSe', 'LogXML', 'N') = 'S' then
    begin
      Alog := TStringList.Create;
      {$IFDEF USE_NFSEX}
      ACBrNFSe1.NotasFiscais.GerarNFSe();
      {$ELSE}
      ACBrNFSe1.NotasFiscais.Assinar(ACBrNFSe1.Configuracoes.Geral.ConfigAssinar.RPS);
      {$ENDIF}
    end;

    for I := 0 to ACBrNFSe1.NotasFiscais.Count - 1 do
      with ACBrNFSe1.NotasFiscais.Items[I].NFSe do
      begin
        if Assigned(Alog) then
        begin
//          Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XMLOriginal;
          Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XmlRps;
          Alog.SaveToFile(Format('%s01_xml_original_%s.xml', [ExtractFilePath(Application.ExeName),
                                                            ACBrNFSe1.NotasFiscais.Items[I].NFSe.IdentificacaoRps.Numero]));
          {$IFDEF USE_NFSEX}
//          Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XMLAssinado;
//          Alog.SaveToFile(Format('%s01_xml_assinado_%s.xml', [ExtractFilePath(Application.ExeName),
//                                                              ACBrNFSe1.NotasFiscais.Items[I].NFSe.IdentificacaoRps.Numero]));
          {$ENDIF}
        end;

        Servico.Discriminacao        := RetiraCarEsp(Servico.Discriminacao);

        {$IFNDEF USE_NFSEX}
        PrestadorServico.RazaoSocial := RetiraCarEsp(PrestadorServico.RazaoSocial);
        PrestadorServico.Endereco.TipoLogradouro := RetiraCarEsp(PrestadorServico.Endereco.TipoLogradouro);
        PrestadorServico.Endereco.Endereco       := RetiraCarEsp(PrestadorServico.Endereco.Endereco);
        PrestadorServico.Endereco.Numero         := RetiraCarEsp(PrestadorServico.Endereco.Numero);
        PrestadorServico.Endereco.Complemento    := RetiraCarEsp(PrestadorServico.Endereco.Complemento);
        PrestadorServico.Endereco.TipoBairro     := RetiraCarEsp(PrestadorServico.Endereco.TipoBairro);
        PrestadorServico.Endereco.Bairro         := RetiraCarEsp(PrestadorServico.Endereco.Bairro);
        PrestadorServico.Endereco.xMunicipio     := RetiraCarEsp(PrestadorServico.Endereco.xMunicipio);
        PrestadorServico.Endereco.xPais          := RetiraCarEsp(PrestadorServico.Endereco.xPais);
        PrestadorServico.Endereco.xPais          := RetiraCarEsp(PrestadorServico.Endereco.xPais);
       {$ENDIF}

        Tomador.RazaoSocial          := RetiraCarEsp(Tomador.RazaoSocial);
        Tomador.Contato.Email        := RetiraCarEsp(Tomador.Contato.Email);
        Tomador.Endereco.TipoLogradouro := RetiraCarEsp(Tomador.Endereco.TipoLogradouro);
        Tomador.Endereco.Endereco       := RetiraCarEsp(Tomador.Endereco.Endereco);
        Tomador.Endereco.Numero         := RetiraCarEsp(Tomador.Endereco.Numero);
        Tomador.Endereco.Complemento    := RetiraCarEsp(Tomador.Endereco.Complemento);
        Tomador.Endereco.TipoBairro     := RetiraCarEsp(Tomador.Endereco.TipoBairro);
        Tomador.Endereco.Bairro         := RetiraCarEsp(Tomador.Endereco.Bairro);
        Tomador.Endereco.xMunicipio     := RetiraCarEsp(Tomador.Endereco.xMunicipio);
        Tomador.Endereco.xPais          := RetiraCarEsp(Tomador.Endereco.xPais);
        Tomador.Endereco.xPais          := RetiraCarEsp(Tomador.Endereco.xPais);

  //      Tomador.Endereco.TipoLogradouro := RetiraCarEsp(Tomador.Endereco.TipoLogradouro);
  //      Tomador.Endereco.Endereco := RetiraCarEsp(Tomador.Endereco.Endereco);
  //      Tomador.Endereco.Numero := RetiraCarEsp(Tomador.Endereco.Numero);
  //      Tomador.Endereco.Complemento := RetiraCarEsp(Tomador.Endereco.Complemento);
  //      Tomador.Endereco.TipoBairro := RetiraCarEsp(Tomador.Endereco.TipoBairro);
  //      Tomador.Endereco.Bairro := RetiraCarEsp(Tomador.Endereco.Bairro);
  //      Tomador.Endereco.xMunicipio := RetiraCarEsp(Tomador.Endereco.xMunicipio);
  //      Tomador.Endereco.xPais := RetiraCarEsp(Tomador.Endereco.xPais);
  //      Tomador.Endereco.xPais := RetiraCarEsp(Tomador.Endereco.xPais);

      end;

      
      if Assigned(Alog) then
      begin
        {$IFDEF USE_NFSEX}
        ACBrNFSe1.NotasFiscais.GerarNFSe();
        {$ELSE}
        ACBrNFSe1.NotasFiscais.Assinar(ACBrNFSe1.Configuracoes.Geral.ConfigAssinar.RPS);
        {$ENDIF}
        for I := 0 to ACBrNFSe1.NotasFiscais.Count - 1 do
          with ACBrNFSe1.NotasFiscais.Items[I].NFSe do
          begin
            if Assigned(Alog) then
            begin
//              Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XMLOriginal;
              Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XmlRps;
              Alog.SaveToFile(Format('%s02_xml_original_%s.xml', [ExtractFilePath(Application.ExeName),
                                                                ACBrNFSe1.NotasFiscais.Items[I].NFSe.IdentificacaoRps.Numero]));
              {$IFDEF USE_NFSEX}
//              Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XMLAssinado;
//              Alog.SaveToFile(Format('%s02_xml_assinado_%s.xml', [ExtractFilePath(Application.ExeName),
//                                                                  ACBrNFSe1.NotasFiscais.Items[I].NFSe.IdentificacaoRps.Numero]));
              {$ENDIF}
            end;
          end;
      end;
            
      
  finally
    if Assigned(Alog) then
      FreeAndNil(Alog);
  end;
end;

function TClassNfSe.verificarerros(componente: EComponente): boolean;
var
 i: integer;
begin
 result:=true;
 FListaErros:='';
 if componente = EComponente.FlexDocs then // Verifica erros no retorno do envio FLEXDOCS
 begin
   if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
   begin
     if ListaMensagemRetorno <> '' then
       FListaErros:=ListaMensagemRetorno;
   end
   else
   begin
    if ((rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ListaMensagemRetorno') <> '')
    or (rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ListaMensagemRetornoLote') <> '')) then
    begin
       FListaErros:=Grupo;
    end;
   end;
   if FListaErros <> '' then
   begin
     Application.CreateForm(TFrmMostrarErros, FrmMostrarErros);
    //FrmMostrarErros:=TFrmMostrarErros.create(Application);
    FrmMostrarErros.Memo1.Lines.Add(FListaErros);
    FrmMostrarErros.ShowModal;
    FrmMostrarErros.free;
  //  Application.MessageBox(PWideChar('Erros no WS: '+#13+FListaErros) , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
    Result := False;
   end;
 end;

  if componente = EComponente.ACbr then // Verificar erros no Retorno de envio de NFSe(SINCRONO E ASSINCRONO ACBRNFSE)
  begin


    {$IFDEF USE_NFSEX}

    for i := 0 to ACBrNFSe1.WebService.Emite.Erros.Count - 1 do with ACBrNFSe1.WebService.Emite.Erros[I] do
      if not MatchText(Codigo, ['L000', 'A0000']) then
        FListaErros := StrConcat([FListaErros, 'Código Erro : ', Codigo, '-', 'Mensagem... : ', Descricao, '-', 'Correção... : ', Correcao, '/']);

    if (ACBrNFSe1.Configuracoes.Geral.ConsultaLoteAposEnvio) and
       (ACBrNFSe1.WebService.Emite.Protocolo <> '') then
    begin
      if (ACBrNFSe1.Provider.ConfigGeral.ConsultaSitLote) and
        (ACBrNFSe1.WebService.ConsultaSituacao.Erros.Count > 0) then
        for i := 0 to ACBrNFSe1.WebService.ConsultaSituacao.Erros.Count - 1 do with ACBrNFSe1.WebService.ConsultaSituacao.Erros[I] do
          if not MatchText(Codigo, ['L000', 'A0000']) then
            FListaErros := StrConcat([FListaErros, 'Código Erro : ', Codigo, '-', 'Mensagem... : ', Descricao, '-', 'Correção... : ', Correcao, '/']);

      if (ACBrNFSe1.Provider.ConfigGeral.ConsultaLote) and
         (ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count > 0) then
        for i := 0 to ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count - 1 do with ACBrNFSe1.WebService.ConsultaLoteRps.Erros[I] do
          if not MatchText(Codigo, ['L000', 'A0000']) then
            FListaErros := StrConcat([FListaErros, 'Código Erro : ', Codigo, '-', 'Mensagem... : ', Descricao, '-', 'Correção... : ', Correcao, '/']);
    end;

    {$ELSE}
    if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
    begin
      for i:=0 to ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.MsgRetorno.Count - 1 do
      begin
        if (ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Codigo <> 'L000') and
           (ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Codigo <> 'A0000') then
        begin
          //FListaErros:= FListaErros+ ACBrNFSe1.WebServices.EnviarSincrono.NFSeRetorno.ListaNfse.MsgRetorno.Items[i].Mensagem + IfThen(FMsg = '', '', ' / ');
          FListaErros := FListaErros + 'Código Erro : ' + ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Codigo + '-' +
                                       'Mensagem... : ' + ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Mensagem + '-'+
                                       'Correção... : ' + ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Correcao + '/';

        end;
      end;
    end
    else
    begin
      if Assigned(ACBrNFSe1.WebServices.EnvioWebService) and
         Assigned(ACBrNFSe1.WebServices.EnvioWebService.RetornoNFSe) and
         Assigned(ACBrNFSe1.WebServices.EnvioWebService.RetornoNFSe.ListaNFSe) and
         Assigned(ACBrNFSe1.WebServices.EnvioWebService.RetornoNFSe.ListaNFSe.MsgRetorno) then
      for i:=0 to ACBrNFSe1.WebServices.EnvioWebService.RetornoNFSe.ListaNFSe.MsgRetorno.Count -1 do
      begin
         //FListaErros:= FListaErros+ ACBrNFSe1.WebServices.EnviarSincrono.NFSeRetorno.ListaNfse.MsgRetorno.Items[i].Mensagem + IfThen(FMsg = '', '', ' / ');
         FListaErros := FListaErros + 'Código Erro : ' + ACBrNFSe1.WebServices.EnvioWebService.RetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Codigo + '-' +
                                      'Mensagem... : ' + ACBrNFSe1.WebServices.EnvioWebService.RetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Mensagem + '-'+
                                      'Correção... : ' + ACBrNFSe1.WebServices.EnvioWebService.RetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Correcao + '/';

       end;
    end;
    {$ENDIF}

    if FListaErros <> '' then
     result := false;
  end;
  {
  if vflag = 3 then // Verifica Erros do no retorno da consulta por LOTE ACBRNFSE
  begin
    for i:=0 to ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.MsgRetorno.Count - 1 do
    begin
      if (ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Codigo <> 'L000') then
      begin
        FListaErros:= FListaErros + 'Código Erro : ' + ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Codigo + '-' +
                                    'Mensagem... : ' + ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Mensagem + '-'+
                                    'Correção... : ' + ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Correcao + '/';

      end;
    end;
    if FListaErros <> '' then
      Result := False;
  end;

  if vflag = 4 then // Verifica Erros do no retorno da consulta por RPS ACBRNFSE
  begin
    for i:=0 to ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.MsgRetorno.Count - 1 do
    begin
      if (ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Codigo <> 'L000') then
      begin
        FListaErros:= FListaErros + 'Código Erro : ' + ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Codigo + '-' +
                                    'Mensagem... : ' + ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Mensagem + '-'+
                                    'Correção... : ' + ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.MsgRetorno.Items[i].Correcao + '/';

      end;
    end;

    if FListaErros <> '' then
     Result := False;
  end;
  }
end;

function TClassNfSe.VerificaRetornoAC(metodo: EMetodoNFSe): boolean;
var
  varq: string;
  vt: currency;
  AXML: string;
begin
  result := true;
  Fcodigover := '';
  FnumeroNFSe := '';
  Fdiscrimina := '';
  Foutrasinf := '';
  FCodigoCnae := '';
  FRpsNFSe := '';
  vvalNFSe := trocaVirgulaPorPonto(BuscasMnt.FieldByName('valor').AsString);
  Fprotoloco := '';
  FListaErros := '';
  AXML := '';
  //FDataEmissaoNFSe:='';
  //vvalNFSe:='';

  {$IFDEF USE_NFSEX}

  case metodo of
    EMetodoNFSe.Envio:
      begin
        if verificarerros(EComponente.ACbr) and
           ACBrNFSe1.WebService.Emite.Sucesso then
        begin
          with ACBrNFSe1.WebService do
          begin
            Fprotoloco  := Emite.Protocolo.Trim;
            FnumeroNFSe := Emite.NumeroNota;
          end;

          with ACBrNFSe1.NotasFiscais.Items[0] do
          begin
            FnumeroNFSe      := IfThen(FnumeroNFSe.IsEmpty, NFSe.Numero, FnumeroNFSe);
            Fcodigover       := NFSe.CodigoVerificacao;
            Fdiscrimina      := NFSe.Servico.Discriminacao;
            Foutrasinf       := NFSe.OutrasInformacoes;
            FCodigoCnae      := NFSe.Servico.CodigoCnae;
            FRpsNFSe         := NFSe.IdentificacaoRps.Numero;
            FDataEmissaoNFSe := NFSe.DataEmissao;
            vt               := NFSe.ValoresNfse.ValorLiquidoNfse;
            //AXML             := StrUtils.IfThen(not string.IsNullOrWhiteSpace(XMLNFSe), XMLNFSe, XMLOriginal).Trim;
            AXML             := XmlNfse;
          end;
        end;
      end;

    EMetodoNFSe.ConsutaNota:
      begin

        if ACBrNFSe1.WebService.ConsultaNFSeporRps.Sucesso then
        begin
          with ACBrNFSe1.WebService do
          begin
            Fprotoloco  := ConsultaNFSeporRps.Protocolo;
            FnumeroNFSe := ConsultaNFSeporRps.NumeroNota.Trim;
          end;

          with ACBrNFSe1.NotasFiscais.Items[0] do
          begin
            FnumeroNFSe      := IfThen(FnumeroNFSe.IsEmpty, NFSe.Numero, FnumeroNFSe);
            Fcodigover       := NFSe.CodigoVerificacao;
            Fdiscrimina      := NFSe.Servico.Discriminacao;
            Foutrasinf       := NFSe.OutrasInformacoes;
            FCodigoCnae      := NFSe.Servico.CodigoCnae;
            FRpsNFSe         := NFSe.IdentificacaoRps.Numero;
            FDataEmissaoNFSe := NFSe.DataEmissao;
            vt               := NFSe.ValoresNfse.ValorLiquidoNfse;
            //AXML             := StrUtils.IfThen(not string.IsNullOrWhiteSpace(XMLNFSe), XMLNFSe, XMLOriginal).Trim;
            AXML             := XmlNfse;
          end;
        end;

      end;

    EMetodoNFSe.ConsultaLote:
      begin

        if ACBrNFSe1.WebService.ConsultaLoteRps.Sucesso then
        begin
          with ACBrNFSe1.WebService do
          begin
            Fprotoloco  := ConsultaLoteRps.Protocolo;
            FnumeroNFSe := ConsultaLoteRps.NumeroNota.Trim;
          end;

          with ACBrNFSe1.NotasFiscais.Items[0] do
          begin
            FnumeroNFSe      := IfThen(FnumeroNFSe.IsEmpty, NFSe.Numero, FnumeroNFSe);
            Fcodigover       := NFSe.CodigoVerificacao;
            Fdiscrimina      := NFSe.Servico.Discriminacao;
            Foutrasinf       := NFSe.OutrasInformacoes;
            FCodigoCnae      := NFSe.Servico.CodigoCnae;
            FRpsNFSe         := NFSe.IdentificacaoRps.Numero;
            FDataEmissaoNFSe := NFSe.DataEmissao;
            vt               := NFSe.ValoresNfse.ValorLiquidoNfse;
            //AXML             := StrUtils.IfThen(not string.IsNullOrWhiteSpace(XMLNFSe), XMLNFSe, XMLOriginal).Trim;
            AXML             := XmlNfse;
          end;
        end;

      end;
  end;

  {$ELSE}
  if vflag = 1 then // Envio de NFSe
  begin
    if verificarerros(EComponente.ACbr) then
    begin
      if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
      begin
        Fprotoloco := ACBrNFSe1.WebServices.EnviarSincrono.Protocolo;
        Fcodigover := ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.CodigoVerificacao;
        FnumeroNFSe := ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Numero;
        Fdiscrimina := ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Servico.Discriminacao;
        Foutrasinf := ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.OutrasInformacoes;
        FCodigoCnae := ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Servico.CodigoCnae;
        FRpsNFSe := ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.IdentificacaoRps.Numero;
        FDataEmissaoNFSe := ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.DataEmissao;
        vt := ACBrNFSe1.WebServices.EnviarSincrono.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.ValoresNfse.ValorLiquidoNfse;
        //vvalNFSe:=trocaVirgulaPorPonto(FloatToStr(ACBrNFSe1.WebServices.EnviarSincrono.NFSeRetorno.
        //ListaNfse.CompNfse.Items[0].Nfse.ValoresNfse.ValorLiquidoNfse));

        //ACBrNFSe1.WebServices.EnviarSincrono.NFSeRetorno.
        //ListaNfse.CompNfse.Items[0].Nfse.ValoresNfse.ValorLiquidoNfse
        //vvalNFSe:=
      end
      else
      begin
        //Fprotoloco:=ACBrNFSe1.NotasFiscais.Items[0].NFSe.Protocolo;
        Fprotoloco := ACBrNFSe1.WebServices.ConsLote.Protocolo;
        Fdiscrimina := ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Discriminacao;
        Foutrasinf := ACBrNFSe1.NotasFiscais.Items[0].NFSe.OutrasInformacoes;
        FCodigoCnae := ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.CodigoCnae;
        FRpsNFSe := ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero;
        FDataEmissaoNFSe := ACBrNFSe1.NotasFiscais.Items[0].NFSe.DataEmissao;
        //vvalNFSe:=trocaVirgulaPorPonto(FloatToStr(ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse));
        if trim(ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero) <> '' then
          FnumeroNFSe := ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero;
        if trim(ACBrNFSe1.NotasFiscais.Items[0].NFSe.CodigoVerificacao) <> '' then
          Fcodigover := ACBrNFSe1.NotasFiscais.Items[0].NFSe.CodigoVerificacao;
      end;
      AXML := ACBrNFSe1.NotasFiscais.Items[0].XMLNFSe.Trim;
    end;
  end;

  if vflag = 2 then // Consulta por NFSe por RPS
  begin
    if (ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Numero <> '') then
    begin
      FnumeroNFSe := ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Numero;
      Fcodigover := ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.CodigoVerificacao;
      Fdiscrimina := ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Servico.Discriminacao;
      Foutrasinf := ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.OutrasInformacoes;
      FCodigoCnae := ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Servico.CodigoCnae;
      FRpsNFSe := ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.IdentificacaoRps.Numero;
      FDataEmissaoNFSe := ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.DataEmissao;
      AXML := Trim(ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.XML);
      //vvalNFSe:=trocaVirgulaPorPonto(FloatToStr(ACBrNFSe1.WebServices.ConsNfseRps.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.ValoresNfse.ValorLiquidoNfse));
    end
    else
      result := false;
  end;

  if vflag = 3 then // Consulta por RPS
  begin
    if (ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Numero <> '') then
    begin
      FnumeroNFSe := ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Numero;
      Fcodigover := ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.CodigoVerificacao;
      Fdiscrimina := ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Servico.Discriminacao;
      Foutrasinf := ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.OutrasInformacoes;
      FCodigoCnae := ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.Servico.CodigoCnae;
      FRpsNFSe := ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.IdentificacaoRps.Numero;
      FDataEmissaoNFSe := ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.DataEmissao;
      //vvalNFSe:=trocaVirgulaPorPonto(FloatToStr(ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.ValoresNfse.ValorLiquidoNfse));
      AXML := Trim(ACBrNFSe1.WebServices.ConsLote.RetornoNFSe.ListaNfse.CompNfse.Items[0].Nfse.XML);
    end
    else
      result := false;
  end;
  {$ENDIF}

  Result := gravaRetornoWs(AXML);

  if (Fcodigover <> '') and (not FSilentMode) then
  begin
    ACBrNFSe1.NotasFiscais.Clear;

    if loadXMLdoBanco('NFSe_RPS' + BuscasMnt.FieldByName('cod_rps').AsString.Trim) then
    begin
      acrescentaendACimp;
      vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);

      ACBrNFSe1.NotasFiscais.Items[0].Imprimir;
      if cadempresa.vENVIAEMAILNFE = 'S' then
        enviaemailNFSe(2);

      Exit;
    end;

    varq := cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString + '\NFSe\DadosNFSe\NFSe\' + trim(FnumeroNFSe) + '-nfse.xml';
    if FileExists(Varq) then
    begin
      ACBrNFSe1.NotasFiscais.LoadFromFile(varq);
      acrescentaendACimp;
      vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
      if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
      begin
        //      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
        //        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota*100;
        // O pessoal da Actcon corrigiu o problema da aliquota
        //     if ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo > 0 then
        //     begin
        //       if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.Aliquota > 0 then
        //         ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:= ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.Aliquota / 100
        //       else if ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss > 0 then
        //        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
        //        (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss/ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo);
        //     end;
        if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse > 0 then
          ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;
      end;

      ACBrNFSe1.NotasFiscais.Items[0].Imprimir;
      if cadempresa.vENVIAEMAILNFE = 'S' then
      begin
        enviaemailNFSe(2);
      end;
    end
    else
      Application.MessageBox(PWideChar('Arquivo XML da NFSe não encontrado no caminho: ' + #13 + varq), PWideChar('Error'), MB_OK);
  end;
end;

function TClassNfSe.VerificaRetornoWs(vmsg: Widestring): boolean;
var
 venv: string;
 vobsos: AnsiString;
 vtemp:string;
begin
// Testar os padrões aqui: Abrasf, etc...
 mostrarmensagem('Verificando Retorno WebService NFSe: '+nomecliente);
 result:=true;
 venv:=trim(cadempresa.dataSet.FieldByName('ENV_NFSE').asstring);
 Arquivo:=vmsg;
 Fcodigover:='';
 FnumeroNFSe:='';
 Fdiscrimina:='';
 Foutrasinf:='';
 FCodigoCnae:='';
 FRpsNFSe:='';
 vvalNFSe:='';
 Fprotoloco:='';
 FListaErros:='';
 if verificarerros(EComponente.ACbr) then
 begin
  if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
  begin
    if cadempresa.dataSet.FieldByName('USARENVRPSSINCRONO').AsString = 'S' then
    begin
      if rExtrai(1,venv+'EnviarLoteRpsSincronoResposta') <> '' then
      begin
        Fprotoloco:=rCampo('C', venv+'Protocolo');
        if verloteexist then
        begin
         gravaRetornoWs;
         vcoderro:='';
  //       Sleep(3000);
  //       vmsg:=ConsultaNFSe;
  //       if vcoderro = 'S50' then
  //        Result := False;
        end
        else
        begin
         mostrarmensagem('Preparando para Verificar RPS no WebService NFSe...');
         Sleep(3000);
         consultaPorRPS;
    //     FListaErros:='Problemas no Envio Tente mais tarde...';
         Fprotoloco:='';
        end;
      end;
    end
    else
    begin
      if rExtrai(1,venv+'EnviarLoteRpsResposta') <> '' then
      begin
        Fprotoloco:=rCampo('C', venv+'Protocolo');
    //    FdataEnvio:=rCampo('D', venv+'DataRecebimento');
        if verloteexist then
        begin
         gravaRetornoWs;
         vcoderro:='';
         Sleep(3000);
         vmsg:=ConsultaNFSe;
         if vcoderro = 'S50' then
          Result := False;
        end
        else
        begin
         mostrarmensagem('Preparando para Verificar RPS no WebService NFSe...');
         Sleep(3000);
         consultaPorRPS;
    //     FListaErros:='Problemas no Envio Tente mais tarde...';
         Fprotoloco:='';
        end;
      end;
    end;
  end
  else
  begin
    if rExtrai(1,venv+'EnviarLoteRpsResposta') <> '' then
    begin
      Fprotoloco:=rCampo('C', venv+'Protocolo');
  //    FdataEnvio:=rCampo('D', venv+'DataRecebimento');
      if verloteexist then
      begin
       gravaRetornoWs;
       vcoderro:='';
       Sleep(3000);
       vmsg:=ConsultaNFSe;
       if vcoderro = 'S50' then
        Result := False;
      end
      else
      begin
       mostrarmensagem('Preparando para Verificar RPS no WebService NFSe...');
       Sleep(3000);
       consultaPorRPS;
  //     FListaErros:='Problemas no Envio Tente mais tarde...';
       Fprotoloco:='';
      end;
    end;
  end;

 //if FListaErros <> 'Problemas no Envio Tente mais tarde...' then
  if verificarerros(EComponente.ACbr) then
  begin
   if rExtrai(1,venv+'InfNfse') <> '' then
   begin
      Grupo:=Deixarapenasumnivel(venv);
      FnumeroNFSe:=rCampo('C', venv+'Numero');
      salvarxmlNFSe;
      Fcodigover:=rCampo('C', venv+'CodigoVerificacao');
      Fdiscrimina:=rCampo('C', venv+'Discriminacao');
      if Fdiscrimina = '' then
      begin
//       buscaadc.close;
//       buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED = '+
//       buscasmnt.FieldByName('NPED').AsString+' and tipo = '''+buscasmnt.FieldByName('TIPO').AsString+
//       ''' AND cod_empresa = '+inttostr(cadempresa.codempresa);
//       buscaadc.open;
//       vobsos:=buscaadc.FieldByName('OBS_OS').AsString;}
//       buscaadc.close;
//       buscaadc.sql.text:='SELECT FIRST 1 IT.DESC_SERVICO_RPS FROM PEDVENDA_SERV IT WHERE cod_rps = '+
//       buscasmnt.FieldByName('COD_RPS').AsString+' and it.cod_empresa = '+inttostr(cadempresa.codempresa);
//       buscaadc.open;
//       vobsos:=StringReplace(vobsos, #13, ' ', [rfReplaceAll]);
//       vobsos:=StringReplace(vobsos, #10, ' ', [rfReplaceAll]);
//       vden:=RetiraCarEsp(vobsos);
//       'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
//       while not buscaadc.eof do
//       begin
//         vden:=vden+', '+RetiraCarEsp(buscaadc.FieldByName('DESC_SERV_PED').AsString);
//         buscaadc.next;
//       end;
//       buscaadc.Close;
       Fdiscrimina:=vden;
//       buscaadc.FieldByName('DESC_SERVICO_RPS').AsString;
       //vden;
      end;
      FDataEmissaoNFSe:=rCampo('D', venv+'DataEmissao');
      Foutrasinf:=rCampo('C', venv+'OutrasInformacoes');
      FCodigoCnae:=rCampo('C', venv+'CodigoCnae');
      if FCodigoCnae = ''  then
        FCodigoCnae:=BuscasMnt.FieldByName('cnae_serv').AsString;
      if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
       vvalNFSe:=rCampo('C', venv+'ValorLiquidoNfse')
      else
       vvalNFSe:=rCampo('C', venv+'ValorServicos');
      buscaadc.close;
      buscaadc.sql.text:='SELECT SUM(IT.ISSRET_SERVICO) AS ISSRET_SERVICO,SUM(IT.VALOR_B_NFSE) as BRUTO,'+
      'SUM(IT.VALOR_NFSE) AS VALOR_NFSE FROM PEDVENDA_SERV IT '+
      ' WHERE IT.cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString+' AND it.cod_empresa = '+inttostr(cadempresa.codempresa);
      buscaadc.open;
      FbaseCalc:=buscaadc.FieldByName('BRUTO').AsCurrency;
      //BuscasMnt.FieldByName('valor').AsCurrency+buscasmnt.FieldByName('IRRF_SERVICO').Ascurrency;
      Fir:=buscasmnt.FieldByName('IRRF_SERVICO').Ascurrency;
      if BuscasMnt.FieldByName('ISS_RETIDO').AsInteger = 1 then
      begin
       Fissretido:=buscaadc.FieldByName('ISSRET_SERVICO').Ascurrency;
      end
      else
       Fissretido:=0;
//      buscasmnt.FieldByName('IRRF_SERVICO').Ascurrency;
      if cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger <> 1 then
      begin
       Faliq:=BuscasMnt.FieldByName('aliq_iss').AsCurrency;
       if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
       begin
         try
          Fiss:=strtocurr(trocaPontoporVirgula(rCampo('C', venv+'ValorIss')));
          Faliq:=strtocurr(trocaPontoporVirgula(rCampo('C', venv+'Aliquota')));
         except
          Fiss:=(FbaseCalc*(Faliq/100));
         end;
       end
       else
        Fiss:=(FbaseCalc*(Faliq/100));
      end
      else
      begin
       Faliq:=0;
//       FbaseCalc:=0;
       Fiss:=0;
      end;
      if rExtrai(1,venv+'IdentificacaoRps') <> '' then
       FRpsNFSe:=rCampo('C', venv+'Numero');
      FvalorLiq:=buscaadc.FieldByName('VALOR_NFSE').Ascurrency;
      //FbaseCalc-buscasmnt.FieldByName('IRRF_SERVICO').Ascurrency;
//      buscasmnt.FieldByName('ISSRET_SERVICO').Ascurrency);
      buscaadc.close;
   end;
  end;
 end;
 Result:=gravaRetornoWs;
 if Fcodigover <> '' then
 begin
  imprimirRPSNFSe(1);
  if cadempresa.vENVIAEMAILNFE = 'S' then
  begin
    enviaemailNFSe(1);
  end;
 end;
 mostrarmensagem('');
end;

function TClassNfSe.verificarGARANTIA(vos: integer; pUsarGravado: Boolean): boolean;
//quando "pUsarGravado=False" vai pedir que o usuario informe o cliente e sera gravado o cliente escolhido,
//  antes de fazer a retenção o metodo será chamado
//quando "pUsarGravado=True" o cliente ja foi definido e gravado no banco de dados, a retenção ja foi definida
var
 vcdgar: string;
begin
result:=true;
buscaadc.close;
buscaadc.sql.text:='select tipo_os, cod_cliente_nfserv from pedvenda where nped = '+inttostr(vos)+
//buscaadc.sql.text:='select tipo_os from pedvenda where nped = '+inttostr(vos)+
' and cod_empresa = '+inttostr(cadempresa.codempresa)+' and tipo = ''OS'' ';
buscaadc.open;
if trim(buscaadc.FieldByName('TIPO_OS').AsString) = 'GARANTIA' then
begin
  while true do
  begin
    if (pUsarGravado) and (buscaadc.FieldByName('cod_cliente_nfserv').AsInteger > 0) then
    begin
      vcdgar := IntToStr(buscaadc.FieldByName('cod_cliente_nfserv').AsInteger);
      vcodgar:=StrToInt(vcdgar);
      buscaadc.close;
      buscaadc.sql.text:='select nome_cliente from clientes where cod_cliente = '+trim(vcdgar)+' and cod_empresa = '+
        inttostr(cadempresa.codempresa);
      buscaadc.open;
      if not buscaadc.IsEmpty then
      begin
        Result := True;
        Break;
      end;
    end;

   if InputQuery('Código do Fabricante', 'Entre com o Cód. Fabricante', vcdgar) then
   begin
     try
      vcodgar:=StrToInt(vcdgar);
      buscaadc.close;
      buscaadc.sql.text:='select nome_cliente from clientes where cod_cliente = '+trim(vcdgar)+' and cod_empresa = '+
      inttostr(cadempresa.codempresa);
      buscaadc.open;
      if buscaadc.IsEmpty then
      begin
       messagedlg('Cliente não encontrado',mtinformation,[mbOK],0);
      end
      else
      begin
       if Application.MessageBox(PWideChar('Atenção, a NFSe será emitida em nome de '+buscaadc.FieldByName('NOME_CLIENTE').asstring+
       '. Continua?'), 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
       begin          
         buscaadc.close;
         buscaadc.sql.text:='update pedvenda set cod_cliente_nfserv = ' + IntToStr(vcodgar) +
           ' where nped = '+inttostr(vos)+
           ' and cod_empresa = '+inttostr(cadempresa.codempresa)+' and tipo = ''OS'' ';
         buscaadc.ExecSQL;
         Result := True;
         break;
       end;
      end;
     except
      messagedlg('Problemas de conversão do código',mtinformation,[mbOK],0);
     end;
   end;
  end;
end
else
 Result := False;
end;

function TClassNfSe.verloteexist: boolean;
begin
 result:=true;
 buscaadc.close;
 buscaadc.sql.text:='select nprotNFSe,nped from pedvenda_serv where nprotNFSe = '''+Fprotoloco+
 ''' and cod_empresa = '+inttostr(cadempresa.codempresa);
 buscaadc.open;
 if not buscaadc.isempty then
 begin
   if (BuscasMnt.FieldByName('nped').asinteger = buscaadc.FieldByName('nped').asinteger)  then
    result:=true
   else
    Result := False;
 end;
end;

procedure TClassNfSe.zerarAtributos;
begin
//   nrloterps:=0;
   Fprotoloco:='';
   FListaErros:='';
   FnumeroNFSe:='';
   Fcodigover:='';
   Fdiscrimina:='';
   Foutrasinf:='';
   FCodigoCnae:='';
   FRpsNFSe:='';
   nroLote:='';
   vosNFSe:=0;
   vcoderro:='';
   vvalNFSe:='';
   Fpis:=0;
   Fcofins:=0;
   Finss:=0;
   Fir:=0;
   Fcsll:=0;
   FoutrasRet:=0;
   Fdeducoes:=0;
   Fdescadc:=0;
   FdescCond:=0;
   FbaseCalc:=0;
   Faliq:=0;
   Fiss:=0;
   Fissretido:=0;
   FvalorLiq:=0;
   Fvalorbruto:=0;
end;

function TClassNfSe.StrTonumero(var ok: boolean; const s: string; const AString:
  array of string; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := -1;
  for i := Low(AString) to High(AString) do
    if AnsiSameText(s, AString[i]) then
      result := AEnumerados[i];
  ok := result <> '';
  if not ok then
    result := AEnumerados[0];
end;

function TClassNfSe.trocaPontoporVirgula(valor: string): string;
begin
  Result := StringReplace(valor, '.', ',', [rfReplaceAll, rfIgnoreCase]);
end;
*)

{ TClassEvento }

function TClassEvento.buscaEvento(idlote: Integer;cod_empresa: integer): boolean;
var
 vtp: string;
begin
 dataset.Close;
 dataset.CommandText:='select c.* from NOTAFISCAL_CARTA_CORRECAO c,notafiscal nf where c.idlote = '+
 inttostr(idlote)+' and c.cod_nf = nf.cod_nf and c.cod_empresa = nf.cod_empresa and c.cod_empresa = '+
 inttostr(cod_empresa);
 dataset.open;
 if dataset.isempty then
 begin
   messagedlg('Evento:'+vtp+' não encontrada para o envio',mtinformation,[mbOK],0);
   Result := False;
 end
 else
 begin
   buscas.Close;
   buscas.sql.text:='select chave_nfe,SERIE,PROTOCOLO,num_nf from notafiscal where cod_nf = '+dataset.FieldByName('COD_NF').AsString+' and cod_empresa = '+
   dataSet.FieldByName('cod_empresa').AsString;
   buscas.Open;
   chavenfe:=buscas.FieldByName('CHAVE_NFE').AsString;
   vserie:=buscas.FieldByName('SERIE').AsString;
   vprotocolo:=buscas.FieldByName('PROTOCOLO').AsString;
   vnumnf:=buscas.FieldByName('NUM_NF').AsString;
   vnseqevento:=dataset.FieldByName('NSEQEVENTO').AsInteger;
   if dataset.FieldByName('TIPO_EVENTO').AsString = 'CCE' then
   begin
     TipoEvento:=1;
     codigoEvento:='110110';
   end;
   if dataset.FieldByName('TIPO_EVENTO').AsString = 'CAN' then
   begin
     TipoEvento:=2;
     codigoEvento:='110111';
   end;
   if dataset.FieldByName('TIPO_EVENTO').AsString = 'EPE' then
   begin
     TipoEvento:=3;
     codigoEvento:='110140';
   end;
   buscas.close;
   result:=true;
 end;
end;

constructor TClassEvento.create(AOwer: TObject);
begin
  if Assigned(AOwer) then
    FAOwer := AOwer;
 dataSet:=TClientDataSet(DtmNFEHW.CdsCCe);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
end;

function TClassEvento.GerarPDFEventoEPEC(ATACBrNFe: TComponent;
  APath: string): Boolean;
var
 vtp: string;
 ANFe: TACBrNFe;
 ADANFeFortes: TACBrNFeDANFeRL;
begin
 buscas.Close;
 buscas.SQL.Text:=
   ' select c.*, e.nfe_logomarca from NOTAFISCAL_CARTA_CORRECAO c,notafiscal nf' +
   ' left join empresa e on e.cod_empresa = nf.cod_empresa' +
   ' where c.cod_nf = '+ inttostr(dataSet.FieldByName('cod_nf').AsInteger)+
   ' and c.tipo_evento = ''EPE'' and c.nseqevento = 1 and c.cod_nf = nf.cod_nf' +
   ' and c.cod_empresa = nf.cod_empresa and c.cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
 buscas.open;
 if buscas.isempty then
 begin
   messagedlg('Evento: EPEC não encontrada para o Impressao',mtinformation,[mbOK],0);
   Result := False;
 end
 else
 begin
   ANFe := TACBrNFe(ATACBrNFe);
   ADANFeFortes := TACBrNFeDANFeRL.Create(ANFe);
   ANFe.DANFE := ADANFeFortes;
   //ANFe.DANFE.ExibirResumoCanhoto := True;
   ANFe.NotasFiscais.Clear;
   ANFe.NotasFiscais.LoadFromString(buscas.FieldByName('xml_nfe_epec').AsString);
   ANFe.EventoNFe.LerXMLFromString(buscas.FieldByName('xml_evento').AsString);
   if ANFe.NotasFiscais.Count > 0 then
     if ANFe.EventoNFe.Evento.Count > 0 then
     begin
       ANFe.DANFE.ExibeInforAdicProduto := infNenhum;
//       if ANFe.NotasFiscais.Items[0].NFe.Det.Count > 0 then
//         if Trim(ANFe.NotasFiscais.Items[0].NFe.Det.Items[0].Prod.veicProd.chassi) <> '' then
//           ANFe.DANFE.ImprimirDetalhamentoEspecifico := True;
       ANFe.DANFE.Logo := buscas.FieldByName('nfe_logomarca').AsString;
       ANFe.DANFE.Protocolo :=
         ANFe.EventoNFe.Evento.Items[0].RetInfEvento.nProt + ' ' +
         FormatDateTime('DD/MM/YYYY hh:nn:ss',ANFe.EventoNFe.Evento.Items[0].RetInfEvento.dhRegEvento);
       ANFe.DANFE.PathPDF := APath;
       ANFe.DANFE.ImprimirDANFEPDF();
     end;
   buscas.Close;
   result:=true;
 end;
end;

function TClassEvento.GravaRetornoEvento(ATRetEventoNFe, ANotaFiscal: TObject; AShowRetorno: Boolean): Boolean;
var
  ARetorno: TRetEventoNFe;
  ANFe: ACBrNFeNotasFiscais.NotaFiscal;
  AMessage: string;
  AFile: TStrings;
  AEmp: TClssEmpresa;
begin
  try
    ARetorno:= TRetEventoNFe(ATRetEventoNFe);
    ANFe := ACBrNFeNotasFiscais.NotaFiscal(ANotaFiscal);
    AMessage := '';
    AEmp := TClssEmpresa( TClassNfVenda(FAOwer).cadempresa );

    with ARetorno do
    begin
      if AShowRetorno then
        AMessage := 'Envio do Lote ' + IntToStr(idLote) + #13 +
                    IntToStr(cStat) + ' - ' + xMotivo + #13 + #13;
      if retEvento.Count > 0 then
      begin
        buscas.Close;
        buscas.SQL.Text := 'update NOTAFISCAL_CARTA_CORRECAO' +
          ' set situacao = :situacao, cstat_proc = :cstat_proc, xmotivo_proc = :xmotivo_proc,' +
          ' cstat = :cstat, xmotivo = :xmotivo, nprot = :nprot, dhevento = :dhevento,' +
          ' xml_evento = :xml_evento, xml_nfe_epec = :xml_nfe_epec' +
          ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa' +
          ' and idlote = :idlote and nseqevento = :nseqevento';
        buscas.ParamByName('cod_nf').AsInteger      := dataSet.FieldByName('cod_nf').AsInteger;
        buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
        buscas.ParamByName('idlote').AsInteger      := dataSet.FieldByName('idlote').AsInteger;
        buscas.ParamByName('nseqevento').AsInteger  := dataSet.FieldByName('nseqevento').AsInteger;
        buscas.ParamByName('cstat_proc').AsInteger  := cStat;
        buscas.ParamByName('xmotivo_proc').AsString := xMotivo;
        buscas.ParamByName('xml_nfe_epec').AsString := ANFe.XMLAssinado;
        with retEvento.Items[0] do
        begin
          if AShowRetorno then
            AMessage := AMessage + 'Evento' + #13 +
                                   IntToStr(RetInfEvento.cStat) + ' - ' + RetInfEvento.xMotivo;

          buscas.ParamByName('cstat').AsInteger     := RetInfEvento.cStat;
          buscas.ParamByName('xmotivo').AsString    := RetInfEvento.xMotivo;
          buscas.ParamByName('nprot').AsString      := RetInfEvento.nProt;
          buscas.ParamByName('dhevento').AsDateTime := RetInfEvento.dhRegEvento;
          buscas.ParamByName('xml_evento').AsString := RetInfEvento.XML;
          case RetInfEvento.cStat of
            135, 136, 155 : buscas.ParamByName('situacao').AsString := 'Autorizada';
            else            buscas.ParamByName('situacao').AsString := 'Rejeitada';
          end;
        end;
        buscas.ExecSQL;

        case retEvento.Items[0].RetInfEvento.cStat of
            135, 136, 155 :
              begin
                AFile := TStringList.Create;
                try
                  with retEvento.Items[0] do
                  begin
                    AFile.Text := RetInfEvento.XML;
                    AFile.SaveToFile(
                      IncludeTrailingPathDelimiter(AEmp.vNFE_LOGPATH) + 'Autorizado\'+
                      TpEventoToStr(RetInfEvento.tpEvento) + RetInfEvento.chNFe +
                      StrZero(RetInfEvento.nSeqEvento, 2) +
                      '-ProcEventoNFe.xml'
                    );
                  end;
                finally
                  FreeAndNil(AFile);
                end;
                if AShowRetorno then
                  AMessage := 'Evento Autorizado' + #13 + #13 + AMessage;
                buscas.SQL.Text := 'update NOTAFISCAL' +
                  ' set nfe_dhcont = :nfe_dhcont, nfe_xjust = :nfe_xjust, tiponfe = :tiponfe,' +
                  ' nfe_dpec_xmotivo = :nfe_dpec_xmotivo, nfe_dpec_nregdpec = :nfe_dpec_nregdpec,' +
                  ' nfe_dpec_cstat = :nfe_dpec_cstat, chave_nfe = :chave_nfe' +
                  ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa';
                buscas.ParamByName('cod_nf').AsInteger            := dataSet.FieldByName('cod_nf').AsInteger;
                buscas.ParamByName('cod_empresa').AsInteger       := dataSet.FieldByName('cod_empresa').AsInteger;
                buscas.ParamByName('nfe_dhcont').AsDateTime       := ANFe.NFe.Ide.dhCont;
                buscas.ParamByName('nfe_xjust').AsString          := ANFe.NFe.Ide.xJust;
                buscas.ParamByName('tiponfe').AsString           := 'DPEC';
                buscas.ParamByName('nfe_dpec_xmotivo').AsString   := retEvento.Items[0].RetInfEvento.xMotivo;
                buscas.ParamByName('nfe_dpec_nregdpec').AsString  := Copy(retEvento.Items[0].RetInfEvento.nProt, 1, 17);
                buscas.ParamByName('nfe_dpec_cstat').AsInteger    := retEvento.Items[0].RetInfEvento.cStat;
                buscas.ParamByName('chave_nfe').AsString          := retEvento.Items[0].RetInfEvento.chNFe;
                buscas.ExecSQL;
              end;
            else if AShowRetorno then
              AMessage := 'Rejeição do Evento' + #13 + #13 + AMessage;
        end;

        if buscas.Transaction.InTransaction then
          buscas.Transaction.Commit;
      end
      else if AShowRetorno then
        AMessage := 'Rejeição do Lote de Eventos' + #13 + #13 + AMessage;
    end;

    if AShowRetorno then
      Application.MessageBox(PWideChar(AMessage), 'Atenção', 0 + 64);

  except on E: Exception do
    begin
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
      if application.messagebox('Erro ao gravar retorno do Evento. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
    end;
  end;
end;

function TClassEvento.ImprimirEventoEPEC(ACodNF, ACodEmpresa: integer;
  ATACBrNFe: TComponent): boolean;
var
 vtp: string;
 ANFe: TACBrNFe;
 ADANFeFortes: TACBrNFeDANFeRL;
begin
 buscas.Close;
 buscas.SQL.Text:=
   ' select c.*, e.nfe_logomarca from NOTAFISCAL_CARTA_CORRECAO c,notafiscal nf' +
   ' left join empresa e on e.cod_empresa = nf.cod_empresa' +
   ' where c.cod_nf = '+ inttostr(ACodNF)+
   ' and c.tipo_evento = ''EPE'' and c.nseqevento = 1 and c.cod_nf = nf.cod_nf' +
   ' and c.cod_empresa = nf.cod_empresa and c.cod_empresa = ' + IntToStr(ACodEmpresa);
 buscas.open;
 if buscas.isempty then
 begin
   messagedlg('Evento: EPEC não encontrada para o Impressao',mtinformation,[mbOK],0);
   Result := False;
 end
 else
 begin
   ANFe := TACBrNFe(ATACBrNFe);
   ADANFeFortes := TACBrNFeDANFeRL.Create(ANFe);
   ANFe.DANFE := ADANFeFortes;
   ANFe.NotasFiscais.Clear;
   ANFe.NotasFiscais.LoadFromString(buscas.FieldByName('xml_nfe_epec').AsString);
   ANFe.EventoNFe.LerXMLFromString(buscas.FieldByName('xml_evento').AsString);
   if ANFe.NotasFiscais.Count > 0 then
     if ANFe.EventoNFe.Evento.Count > 0 then
     begin
       ANFe.DANFE.ExibeInforAdicProduto := infNenhum;
//       if ANFe.NotasFiscais.Items[0].NFe.Det.Count > 0 then
//         if Trim(ANFe.NotasFiscais.Items[0].NFe.Det.Items[0].Prod.veicProd.chassi) <> '' then
//           ANFe.DANFE.ImprimirDetalhamentoEspecifico := True;
       ANFe.DANFE.Logo := buscas.FieldByName('nfe_logomarca').AsString;
       ANFe.DANFE.Protocolo :=
         ANFe.EventoNFe.Evento.Items[0].RetInfEvento.nProt + ' ' +
         FormatDateTime('DD/MM/YYYY hh:nn:ss',ANFe.EventoNFe.Evento.Items[0].RetInfEvento.dhRegEvento);
       ANFe.DANFE.ImprimirDANFE();
     end;
   buscas.Close;
   result:=true;
 end;
end;

function TClassEvento.GravaRetornoEvento(vAcbrNFE: TACBrNFe;
  idlote: Integer;vflagevento: integer): boolean;
  var
  vteste,vteste1,vseqevento: string;
  vretorno: integer;
  vArquivoExiste: Boolean;
begin
 result:=true;
 IniciaTransacao;
 try
  edit;
  if vflagevento >= 0 then
  begin

    dataset.FieldByName('CSTAT_PROC').AsInteger:=vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.cStat;
    dataset.FieldByName('XMOTIVO_PROC').AsString:=vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.xMotivo;
    if (vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.cStat = 135) or
    (vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.cStat = 155) then
    begin
     dataset.FieldByName('CSTAT').AsInteger:=vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.retEvento.Items[0].RetInfEvento.cStat;
//     vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.cStat;
     //vAcbrNFE.WebServices.Retorno.NFeRetorno.
//     NFeRetorno.procEventoNFe.Items[I].RetEventoNFe.InfEvento.DetEvento.cstat;
//     vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.cStat;
     dataset.FieldByName('XMOTIVO').AsString:=vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.retEvento.Items[0].RetInfEvento.xMotivo;
     //vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.xMotivo;
     dataset.FieldByName('NPROT').AsString:=vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.retEvento.Items[0].RetInfEvento.nProt;
//     vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.InfEvento.detEvento.nProt;
     dataset.FieldByName('DHEVENTO').AsDateTime:=vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.retEvento.Items[0].RetInfEvento.dhRegEvento;
     //vAcbrNFE.WebServices.Consulta.procEventoNFe.Items[vflagevento].RetEventoNFe.InfEvento.dhEvento;
     //vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
     dataset.FieldByName('SITUACAO').AsString:='Autorizada';
     result:=true;
    end;
  end
  else
  begin
    if vAcbrNFE.WebServices.EnvEvento.EventoRetorno.cStat = 128 then
  //  CartaCorrecao.CCeRetorno.cStat = 128 then
    begin
      dataset.FieldByName('CSTAT_PROC').AsInteger:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.cStat;
      //vAcbrNFE.WebServices.CartaCorrecao.CCeRetorno.cStat;
      dataset.FieldByName('XMOTIVO_PROC').AsString:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.xMotivo;
  //    CartaCorrecao.CCeRetorno.xMotivo;
      //vAcbrNFE.WebServices.CartaCorrecao.CCeRetorno.xMotivo;
      if (vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135) or
      (vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 155) then
      //CartaCorrecao.CCeRetorno.retEvento.Items[0].RetInfEvento.cStat = 135 then
      begin
       dataset.FieldByName('CSTAT').AsInteger:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
  //     //vAcbrNFE.WebServices.CartaCorrecao.CCeRetorno.retEvento.Items[0].RetInfEvento.cStat;
       dataset.FieldByName('XMOTIVO').AsString:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
       dataset.FieldByName('NPROT').AsString:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
       dataset.FieldByName('DHEVENTO').AsDateTime:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
       dataset.FieldByName('SITUACAO').AsString:='Autorizada';
       result:=true;
     end
     else
     begin
       if vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 573 then // Testar se o evento já foi anexado....
       begin
        if dataset.FieldByName('CSTAT').AsString = '' then
        begin
         dataset.FieldByName('CSTAT').AsInteger:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
         dataset.FieldByName('XMOTIVO').AsString:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
        end;
        result:=true
       end
       else
       begin
        Result := False;
        dataset.FieldByName('CSTAT').AsInteger:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
        dataset.FieldByName('XMOTIVO').AsString:=vAcbrNFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
       end;
     end;
    end;
  end;
  vretorno:=dataset.FieldByName('CSTAT').AsInteger;
  post;
  Apply;
  CommitaTransacao;
  //
  vseqevento:=inttostr(dataset.FieldByName('NSEQEVENTO').AsInteger);
  if (vretorno = 135) or (vretorno = 573) or (vretorno = 155) then
  begin
    try
     vteste:=vACBrNFe.Configuracoes.Arquivos.PathSalvar+chavenfe+codigoEvento+vseqevento+
     '-ProcEventoNFe.xml';
     vArquivoExiste := FileExists(vteste);
     if (not vArquivoExiste) and (Length(Trim(vseqevento)) = 1) then
     begin
       vseqevento := '0' + Trim(vseqevento);
       vteste:=vACBrNFe.Configuracoes.Arquivos.PathSalvar+chavenfe+codigoEvento+vseqevento+
         '-ProcEventoNFe.xml';
     end;
     vArquivoExiste := FileExists(vteste);
     if (not vArquivoExiste) then
     begin
       vseqevento := StrZero(Trim(vseqevento),2);
       vteste:= vACBrNFe.Configuracoes.Arquivos.PathSalvar + codigoEvento + chavenfe + vseqevento + '-ProcEventoNFe.xml';
     end;
     vteste1:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + 'Autorizado\'+codigoEvento+chavenfe+vseqevento+
     '-ProcEventoNFe.xml';
     if CopyFile(PWideChar(vteste),
      PWideChar(vteste1), true) then
      DeleteFile(PWideChar(vteste));
    except
      on e: exception do
      begin
       if application.messagebox('Erro ao copiar arquivo de evento para pasta Autorizado. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
        Result := False;
      end;
    end;
  end;
 except
  on e: exception do
  begin
   RollBackTransacao;
   if application.messagebox('Erro ao gravar retorno da CC-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
    Result := False;
  end;
 end;
end;



{ TClassMDFe }

(*function TClassMDFe.abrevazio: boolean;
begin

end;*)

function TClassMDFe.buscaMDFE(vnumMDF, vnumLOTEMDF: integer): boolean;
begin
 dataset.close;
 if vnumLOTEMDF <> 0 then
  dataset.CommandText:='select * from MDFE where LOTE_MDFE = '+IntToStr(vnumLOTEMDF)+
  ' and cod_empresa = '+cadempresa.dataSet.FieldByName('COD_EMPRESA').AsString
 else
  dataset.CommandText:='select * from MDFE where NMDF = '+IntToStr(vnumMDF)+
  ' and cod_empresa = '+cadempresa.dataSet.FieldByName('COD_EMPRESA').AsString;
 dataSet.open;
end;

function TClassMDFe.buscaMDFECONSULTA(vnumMDF, vnumLOTEMDF: integer): boolean;
begin
 dataset.close;
 if vnumLOTEMDF <> 0 then
  dataset.CommandText:='select * from MDFE where LOTEMDFE_CONSULTA = '+IntToStr(vnumLOTEMDF)+
  ' and cod_empresa = '+cadempresa.dataSet.FieldByName('COD_EMPRESA').AsString
 else
  dataset.CommandText:='select * from MDFE where NMDF = '+IntToStr(vnumMDF)+
  ' and cod_empresa = '+cadempresa.dataSet.FieldByName('COD_EMPRESA').AsString;
 dataSet.open;

end;

function TClassMDFe.EnviaEventoMDFEint(nmdfe: integer;vnumlote: integer): boolean;
var
 i: integer;
 vstenvemail: string;
begin
 Result := False;
 buscaMDFE(nmdfe,0);
 if dataset.FieldByName('TIPO_EVENTO').AsString = 'CAN' then
   vcodevento:='110111'
 else
  vcodevento:='110112';
 vrespevento:=false;
 if not dataSet.IsEmpty then
 begin
  if dataset.FieldByName('TIPOMDFE').AsString = 'NORMAL' then
  begin
    (*if vcodevento = TpEventoToStr(teCancelamento) then
    begin
      if not (InputQuery('WebServices Cancelamento MDFe', 'Justificativa', vjust)) then
      begin
        Result := False;
        exit;
      end;
      if vjust = '' then
      begin
       Application.MessageBox(PWideChar('Justificativa precisa ser preenchida'),PWideChar('Error'), MB_OK);
       Result := False;
       exit;
      end;
    end;*)
    vstenvemail:=cadempresa.vENVIAEMAILNFE;
    cadempresa.vENVIAEMAILNFE:='N';
    if ConsultarMDFE(nmdfe,vnumlote) then
    begin
       vflagevento:=-1;
       if ACBrMDFe1.WebServices.Consulta.procEventoMDFe.Count > 0 then
       for i:=0 to ACBrMDFe1.WebServices.Consulta.procEventoMDFe.Count-1 do
       begin
         if (ACBrMDFe1.WebServices.Consulta.procEventoMDFe.Items[i].RetEventoMDFe.InfEvento.tpEvento in [teCancelamento, teEncerramento]) then
         begin
          vflagevento:=i;
          break;
         end;
       end;
       if vflagevento = -1 then
       begin
        ACBrMDFe1.Manifestos.Clear;

        if not dataSet.FieldByName('xml_mdfe').AsString.IsEmpty() then
          ACBrMDFe1.Manifestos.LoadFromString(dataSet.FieldByName('xml_mdfe').AsString)

        else
          ACBrMDFe1.Manifestos.LoadFromFile(ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
          'Autorizado\'+dataSet.FieldByName('CHAVE_MDFE').AsString+'-mdfe.xml');

        with ACBrMDFe1.EventoMDFe.Evento.Add do
        begin
         infEvento.chMDFe   := dataSet.FieldByName('CHAVE_MDFE').AsString;
         infEvento.CNPJCPF  := cadempresa.dataSet.FieldByName('cgc_emp').AsString;
         infEvento.dhEvento := now;

         infEvento.tpEvento   := StrToTpEventoMDFe(vok, vcodevento);
//         teCancelamento;
         infEvento.nSeqEvento := 1;
         vseqevento:='1';

         infEvento.detEvento.nProt := ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.nProt;
         if vcodevento = TpEventoToStr(teCancelamento) then
          infEvento.detEvento.xJust :=trim(dataSet.FieldByName('JUSTIFICATIVA').AsString)
          //trim(vjust)
         else
         begin
           infEvento.detEvento.dtEnc := Date;
           infEvento.detEvento.cUF   := StrToInt(Copy(IntToStr(ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[0].cMunDescarga),1,2));
           infEvento.detEvento.cMun  := ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[0].cMunDescarga;
         end;
        end;
        try
          vrespevento:=ACBrMDFe1.EnviarEvento( vnumlote ); // 1 = Numero do Lote
        except on E: Exception do
          begin

            if (StrToTpEventoMDFe(vok, vcodevento) = TpcnTpEvento.teEncerramento) and  Assigned(ACBrMDFe1.WebServices.EnvEvento)
              and (ACBrMDFe1.WebServices.EnvEvento.cStat = 609) then
                if EncerrarPorRejeicao609() then
                  Exit();

            Result := False;
            if Application.MessageBox('Erro ao enviar envento MDF-e. Mostrar erro?', 'Erro', MB_ICONQUESTION + MB_YESNO) = IDYES then
              Application.MessageBox(PWideChar(E.Message), 'Erro', MB_ICONERROR + MB_OK);
            Exit;
          end;
        end;
       end;
       if not GravaRetornoEventoMDFE(ACBrMDFe1,vnumlote) then
       begin
        Application.MessageBox(PWideChar('Retorno do Evento: '+dataset.FieldByName('CSTAT_EVENTO').AsString+
        ' '+dataset.FieldByName('XMOTIVO_EVENTO').AsString),PWideChar('Advertência'), MB_OK);
        Result := False;
       end
       else
        result:=true;
    end;
    cadempresa.vENVIAEMAILNFE:=vstenvemail;
  end
  else
   Application.MessageBox(PWideChar('MDFe Emitido em Contigência, não permitido cancelamento'),PWideChar('Error'), MB_OK);
 end
 else
  Application.MessageBox(PWideChar('MDFe não encontrado, não permitido cancelamento'),PWideChar('Error'), MB_OK);
end;

function TClassMDFe.ConsultarMDFE(vnummdfe,vnumlote: integer): boolean;
var
 vstatatual: boolean;
 varq: string;
 OpenDialog1: TOpenDialog;
begin
  result:=true;
  buscaMDFECONSULTA(vnummdfe,vnumlote);
  if not dataSet.IsEmpty then
  begin
    dataSet.first;
    while not dataset.Eof do
    begin
      if (dataSet.FieldByName('SITUACAO_MDFE').AsString = 'Autorizada')
      or (dataSet.FieldByName('SITUACAO_MDFE').AsString = 'Cancelada') then
      begin
        vstatatual:=ACBrMDFe1.Configuracoes.WebServices.Visualizar;
        ACBrMDFe1.Configuracoes.WebServices.Visualizar:=true;
        try
          ACBrMDFe1.Manifestos.Clear;

          if not dataSet.FieldByName('xml_mdfe').AsString.IsEmpty() then
            ACBrMDFe1.Manifestos.LoadFromString(dataSet.FieldByName('xml_mdfe').AsString)

          else
          begin
            varq:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
              '\Autorizado\'+dataSet.FieldByName('CHAVE_MDFE').AsString+'-mdfe.xml';

            if not FileExists(Varq) then
            begin
             Application.MessageBox(PWideChar('Arquivo XML do MDFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
             Result := False;
            end;

            ACBrMDFe1.Manifestos.LoadFromFile(varq);
          end;

           ACBrMDFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
           try

            ACBrMDFe1.Consultar;
            if cadempresa.vENVIAEMAILNFE = 'S' then
             enviaEmailMDFE(ACBrMDFe1,TClassMDFeTipoEmail.emMDFeEnvioDoc,0,'0');
           except
             on e: exception do
             begin
              Application.MessageBox(PWideChar('6832 ' + E.Message),PWideChar('Error'), MB_OK);
              Result := False;
             end;
           end;

        finally
          ACBrMDFe1.Configuracoes.WebServices.Visualizar:=vstatatual;
//          ACBrMDFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
        end;
      end
      else
      begin
        vstatatual:=ACBrMDFe1.Configuracoes.WebServices.Visualizar;
        ACBrMDFe1.Configuracoes.WebServices.Visualizar:=true;
        try
          ACBrMDFe1.Configuracoes.Geral.FormaEmissao := teNormal;

          if not dataSet.FieldByName('xml_mdfe').AsString.IsEmpty() then
          begin
            ACBrMDFe1.Manifestos.Clear;
            ACBrMDFe1.Manifestos.LoadFromString(dataSet.FieldByName('xml_mdfe').AsString);
            ACBrMDFe1.Consultar;
            GravaRetMDFE(ACBrMDFe1, TClassMDFeTipoRetorno.reMDFeConsulta,0);
            if vxmsg <> '' then
              Application.MessageBox(PWideChar('Mensagem da SEFAZ Cod.: '+#13+vcmsg+' Mensagem: '+vxmsg),PWideChar('Advertência'), MB_OK);
          end

          else
          begin
            varq:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
            dataSet.FieldByName('CHAVE_MDFE').AsString+'-mdfe.xml';
            if FileExists(Varq) then
            begin
             ACBrMDFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
             ACBrMDFe1.Manifestos.Clear;
             ACBrMDFe1.Manifestos.LoadFromFile(varq);
             ACBrMDFe1.Consultar;
             GravaRetMDFE(ACBrMDFe1, TClassMDFeTipoRetorno.reMDFeConsulta,0);
             if vxmsg <> '' then
              Application.MessageBox(PWideChar('Mensagem da SEFAZ Cod.: '+#13+vcmsg+' Mensagem: '+vxmsg),PWideChar('Advertência'), MB_OK);
            end
            else
            begin
             Application.MessageBox(PWideChar('Arquivo XML do MDFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
             if application.messagebox('Deseja buscar pelo arquivo XML?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
             begin
               try
                OpenDialog1:=TOpenDialog.Create(nil);
                OpenDialog1.Title := 'Selecione o MDFe';
                OpenDialog1.DefaultExt := '*-mdfe.XML';
                OpenDialog1.Filter := 'Arquivos NFE (*-mdfe.XML)|*-mdfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
                OpenDialog1.InitialDir :=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar;
                if OpenDialog1.Execute then
                begin
                 varq:=ExtractFilePath(OpenDialog1.FileName)+extractfilename(opendialog1.filename);

                 ACBrMDFe1.Manifestos.Clear;
                 ACBrMDFe1.Manifestos.LoadFromFile(varq);
                 ACBrMDFe1.Consultar;
                 GravaRetMDFE(ACBrMDFe1,TClassMDFeTipoRetorno.reMDFeConsulta,0);
                 if vxmsg <> '' then
                   Application.MessageBox(PWideChar('Mensagem da SEFAZ Cod.: '+#13+vcmsg+' Mensagem: '+vxmsg),PWideChar('Advertência'), MB_OK);
                end;
               except
                 on e: exception do
                 begin
                  Application.MessageBox(PWideChar('6832 ' + E.Message),PWideChar('Error'), MB_OK);
                  Result := False;
                 end;
               end;
             end;
            end;
          end;

        finally
         ACBrMDFe1.Configuracoes.WebServices.Visualizar:=vstatatual;
         ACBrMDFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
        end;
      end;
     dataSet.next;
    end;
  end;
end;

constructor TClassMDFe.create;
begin
 vbanco:=TIBDatabase(DtmNFEHW.IbConexaoNFe);
 CadEmpresa:=TClssEmpresa.create;
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
 buscaadc:=TIBQuery(DtmNFEHW.IbBuscasAdic);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 cadclfor:=TClassCliente.create;
 dataSet:=TClientDataSet(DtmNFEHW.cdsMDFE);
end;

destructor TClassMDFe.destroy;
begin
  inherited;
  cadempresa.dataSet.close;
end;


function TClassMDFe.EncerrarPorRejeicao609: Boolean;
begin
  result := false;
  IniciaTransacao;
  dataSet.edit;

  try
    edit;
    dataset.FieldByName('SITUACAO_EVENTO').AsString := 'Encerrado';
    dataset.FieldByName('CSTAT_EVENTO').AsInteger := 609;
    dataset.FieldByName('XMOTIVO_EVENTO').AsString := 'MDF-e já está encerrado na base de dados da SEFAZ';

    post;
    Apply;
    CommitaTransacao;

    Result := True;

  except
    on e: exception do
    begin
      RollBackTransacao;
      if application.messagebox('Erro ao gravar retorno do MDF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
      Result := False;
    end;
  end;
end;

function TClassMDFe.enviaEmailMDFE(vAcbrMDFEemail: TACBrMDFe; ATipoEmail: TClassMDFeTipoEmail;
  vitx: integer; ACodigoEvento: string): boolean;
var
 varqc,varq: string;
 msg: TStrings;
 vanexomail: TStringList;
 vusassl: boolean;
 vnum: integer;
 vdadosemail,vtipoEvento, vArquivoTeste: string;
 vListaDestinat: TStringList;
 I: Integer;
 vExisteArq: Boolean;
 vStrSqEvento: string;
 ACBrMail1: TACBrMail;

  procedure verificarDestinatarios(pDestinatarios: string);
  var
    vTemp: string;
  begin
    vTemp := StringReplace(pDestinatarios, ',', ';', [rfReplaceAll]);

    if vListaDestinat = nil then
      vListaDestinat := TStringList.Create;

    vListaDestinat.Clear;

    if Pos(';', vTemp) = 0 then
      vListaDestinat.Add(Trim(vTemp))
    else
    begin
      while Pos(';', vTemp) > 0 do
      begin
        if Trim(Copy(vTemp, 1, Pos(';', vTemp) - 1)) <> '' then
          vListaDestinat.Add(Trim(Copy(vTemp, 1, Pos(';', vTemp) - 1)));
        vTemp := Copy(vTemp, Pos(';', vTemp) + 1, Length(vTemp));
      end;
      if Trim(vTemp) <> '' then
        vListaDestinat.Add(Trim(vTemp));
    end;
  end;
begin

  msg := TStringList.Create();
  try
    Result := True;
    ACBrMail1 := TACBrMail.Create(Application);
    para:='';

    try
      if ATipoEmail = TClassMDFeTipoEmail.emMDFeEnvioDoc then
      begin
       try
         vnum:=vAcbrMDFEemail.Manifestos.Items[vitx].MDFe.Ide.cMDF;
       except
        on e: exception do
        begin
         if application.messagebox('Erro ao obter o numero da MDFe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
         vnum:=0;
        end;
       end;
       vdadosemail:='MDFe: '+strzero(vnum,6)+'-'+vAcbrMDFEemail.Manifestos.Items[vitx].MDFe.emit.xNome;
       para:='';
      end
      else
       vdadosemail:='';

      Result := False;

      if not verificadestemail(-1{vtipo},vdadosemail) then
        Exit();

      para:=cadclfor.vemail;
      if ATipoEmail = TClassMDFeTipoEmail.emMDFeEnvioDoc then
      begin
        if cadempresa.vEMAIL_USASSL = 'S' then
         vusassl:=true
        else
         vusassl:=false;

        msg.Text := 'Em anexo, o MDFe Emitido pela Empresa: '+cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  //            if vnumdpec <> '0' then
  //              vacbrNFEemail.DANFE.ProtocoloNFe:=vnumdpec;

        vAcbrMDFEemail.MAIL := ACBrMail1;
        ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
        ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
        ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
        ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
        ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
        ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
        ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
        ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
        ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
        ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
        verificarDestinatarios(para);
        para := vListaDestinat[0];
        vListaDestinat.Delete(0);
        vAcbrMDFEemail.Manifestos.Items[vitx].EnviarEmail( Para, trim('MDFe Emitido pela Empresa: '+cadempresa.dataSet.FieldByName('NOME_EMP').AsString),
          msg
          , True  // Enviar PDF junto
          , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
          , nil); // Lista de anexos - TStrings

  //            verificarDestinatarios(para);
  //            for I := 0 to vListaDestinat.Count - 1 do
  //            vAcbrMDFEemail.Manifestos.Items[vitx].EnviarEmail(trim(cadempresa.vSMTP_EMP),
  //            inttostr(cadempresa.vPORTA_SMTP),trim(cadempresa.vLOGIN_EMP),
  //            trim(cadempresa.vEMAIL_SENHA),trim(cadempresa.vLOGIN_EMP), vListaDestinat[I],
  //            trim('MDFe Emitido pela Empresa: '+cadempresa.dataSet.FieldByName('NOME_EMP').AsString),Mememail.Lines,vusassl,true,nil,nil,False,true,cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
        Application.MessageBox(PWideChar('Email de enviado com sucesso'),PWideChar('Aviso'), MB_OK);
        Result := True;
      end

      else if ATipoEmail = TClassMDFeTipoEmail.emMDFeConultaDoc then // Consulta
      begin
        vAcbrMDFEemail.Manifestos.Clear;
  //            if vnumdpec <> '0' then
  //            begin
  //              vacbrNFEemail.DANFE.ProtocoloNFe:=vnumdpec;
  //              varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
  //              '\'+dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
  //            end
  //            else
        if not dataSet.FieldByName('xml_mdfe').AsString.IsEmpty then
          vAcbrMDFEemail.Manifestos.LoadFromString(dataSet.FieldByName('xml_mdfe').AsString)

        else
        begin
          varq:=vAcbrMDFEemail.Configuracoes.Arquivos.PathSalvar +
            'Autorizado\'+dataSet.FieldByName('CHAVE_MDFE').AsString+'-mdfe.xml';
          if not FileExists(Varq) then
          begin
            Application.MessageBox(PWideChar('Arquivo XML do MDFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
            Exit();
          end;
          vAcbrMDFEemail.Manifestos.LoadFromFile(varq);
        end;

        if cadempresa.vEMAIL_USASSL = 'S' then
         vusassl:=true
        else
         vusassl:=false;

        msg.Text:='Em anexo, o MDFe Emitido pela Empresa: '+cadempresa.dataSet.FieldByName('NOME_EMP').AsString;

        vAcbrMDFEemail.MAIL := ACBrMail1;
        ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
        ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
        ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
        ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
        ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
        ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
        ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
        ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
        ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
        ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
        verificarDestinatarios(para);
        para := vListaDestinat[0];
        vListaDestinat.Delete(0);
        vAcbrMDFEemail.Manifestos.Items[0].EnviarEmail( Para, trim('MDFe Emitido pela Empresa: '+cadempresa.dataSet.FieldByName('NOME_EMP').AsString),
          msg
          , True  // Enviar PDF junto
          , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
          , nil); // Lista de anexos - TStrings

        Application.MessageBox(PWideChar('Email de enviado com sucesso'),PWideChar('Aviso'), MB_OK);

        Result := True;
      end

      else if ATipoEmail = TClassMDFeTipoEmail.emMDFeEvento then
      begin
        vAcbrMDFEemail.Manifestos.Clear;
        try
          if not dataSet.FieldByName('xml_mdfe').AsString.IsEmpty() then
            ACBrMDFe1.Manifestos.LoadFromString(dataSet.FieldByName('xml_mdfe').AsString)

          else
          begin
            varq := vAcbrMDFEemail.Configuracoes.Arquivos.PathSalvar + 'Autorizado\' + dataSet.FieldByName('CHAVE_MDFE').AsString+'-mdfe.XML';

            if not FileExists(varq) then
            begin
              Result := False;
              ShowAtencao('XML MDF-e não encontrado, impossível enviar email');
              Exit();
            end;

            vAcbrMDFEemail.Manifestos.LoadFromFile(varq);
          end;

          vAcbrMDFEemail.EventoMDFe.Evento.Clear;

          if not dataSet.FieldByName('EVE_XML_MDFE').AsString.IsEmpty() then
            ACBrMDFe1.EventoMDFe.LerXMLFromString(dataSet.FieldByName('EVE_XML_MDFE').AsString)

          else
          begin
             if ACodigoEvento = '110112' then
              vtipoEvento:='ENCERRAMENTO';
            if ACodigoEvento = '110111' then
              vtipoEvento:='CANCELAMENTO';

             vStrSqEvento := IntToStr(vitx);
             vArquivoTeste := vAcbrMDFEemail.Configuracoes.Arquivos.PathSalvar + 'Autorizado\' + dataSet.FieldByName('CHAVE_MDFE').AsString+ACodigoEvento+
               Trim(vStrSqEvento)+'-procEventoMDFe.XML';
             if not FileExists(vArquivoTeste) then
             begin
               vStrSqEvento := StrZero(vStrSqEvento, 2);
               vArquivoTeste := vAcbrMDFEemail.Configuracoes.Arquivos.PathSalvar + 'Autorizado\' + dataSet.FieldByName('CHAVE_MDFE').AsString+ACodigoEvento+
               Trim(vStrSqEvento)+'-procEventoMDFe.XML';
             end;
             if not FileExists(vArquivoTeste) then
             begin
               vStrSqEvento := StrZero(vStrSqEvento, 2);
               vArquivoTeste := vAcbrMDFEemail.Configuracoes.Arquivos.PathSalvar + 'Autorizado\' + ACodigoEvento+dataSet.FieldByName('CHAVE_MDFE').AsString+
               Trim(vStrSqEvento)+'-procEventoMDFe.XML';
             end;

            if not FileExists(vArquivoTeste) then
            begin
              Result := False;
              ShowAtencao('XML do EVENTO MDF-e não encontrado, impossível enviar email');
              Exit();
            end;

            vAcbrMDFEemail.EventoMDFe.LerXML(vArquivoTeste) ;
          end;

          if cadempresa.vEMAIL_USASSL = 'S' then
           vusassl:=true
          else
           vusassl:=false;

           msg.Text:='Evento '+vtipoEvento+' anexado ao MDFe: '+StrZero(vAcbrMDFEemail.Manifestos.Items[0].MDFe.Ide.nMDF,9)+' DE: '+
           datetostr(vAcbrMDFEemail.Manifestos.Items[0].MDFe.Ide.dhEmi)+' VALOR: '+
           Format('%n',[vAcbrMDFEemail.Manifestos.Items[0].MDFe.tot.vCarga]);

          vAcbrMDFEemail.MAIL := ACBrMail1;
          ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
          ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
          ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
          ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
          ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
          ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
          ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
          ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
          ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
          ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
          verificarDestinatarios(para);
          para := vListaDestinat[0];
          vListaDestinat.Delete(0);


          vAcbrMDFEemail.EnviarEmailEvento(
            Para, trim('Evento '+vtipoEvento+' do MDFe: '+StrZero(vAcbrMDFEemail.Manifestos.Items[0].MDFe.Ide.nMDF,9)+
            ' emitido pela Empresa: '+cadempresa.dataset.fieldbyname('NOME_EMP').asstring),
            msg, vListaDestinat
          );

          Application.MessageBox(PWideChar('Email de enviado com sucesso'),PWideChar('Aviso'), MB_OK);

          result:=True;
        except
          on E: Exception do
          begin
           showmessage(E.message);
           Result := False;
          end;
        end;
        Result := true;
      end
      else
       raise Exception.Create('Tipo de Email não programado - MDFE');

    except
      on e: exception do
      begin
       if application.messagebox('Erro ao enviar e-mail. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
         Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
      end;
    end;

  finally
    msg.Free;
  end;
end;

function TClassMDFe.EnviarMDFE(vnumMDF, codempresa, vnumlote: integer;
  AOperacao: TClassMDFeTipoOperacao): string;
var
 vcmun: integer;
  AListUFPer: TStrings;
  AUFPer: string;
  ABuscasAd1, ABuscasAd2: TIBQuery;
  AOK: Boolean;
  ALacres: TStrings;
  I: Integer;
begin
  // colocar aqui a pesquisa por lote ou por numero do MDFe
  result:='';
  ABuscasAd1 := nil;
  ABuscasAd2 := nil;
  CopyQuery(buscaadc, ABuscasAd1);
  CopyQuery(buscaadc, ABuscasAd2);
  ALacres := TStringList.Create;
  ALacres.LineBreak := ',';
  try
    buscaMDFE(vnumMDF,vnumlote);
    while not dataset.eof do
    begin
      with ACBrMDFe1.Manifestos.Add.MDFe do
      begin
        //
        // Dados de Identificação do MDF-e
        //
        Ide.cUF := cadempresa.dataSet.FieldByName('IBGE_CODIGO_UF').AsInteger;

        // TpcnTipoAmbiente = (taProducao, taHomologacao);
        if pos('Homologação', cadempresa.vWEBSERV_AMBIENTE) > 0 then
          ide.tpAmb := taHomologacao;
        if pos('Produção', cadempresa.vWEBSERV_AMBIENTE) > 0 then
          ide.tpAmb := taProducao;

        // TMDFeTpEmitente = ( teTransportadora, teTranspCargaPropria );

        Ide.tpEmit  := StrToTpEmitente(vok,dataSet.FieldByName('TPEMIT').AsString);

        Ide.modelo  := dataSet.FieldByName('MODELO').AsString;
        Ide.serie   := dataSet.FieldByName('SERIE').AsInteger;
        Ide.nMDF    := StrToIntDef(dataSet.FieldByName('NMDF').AsString, 0);
        Ide.cMDF    := StrToIntDef(dataSet.FieldByName('NMDF').AsString, 0);
        Ide.modal   := StrToModal(vok,dataSet.FieldByName('MODAL').AsString);
        Ide.dhEmi   := dataSet.FieldByName('DHEMI').AsDateTime;
         if cadempresa.dataSet.FieldByName('TIPOMDFE').AsString = 'NORMAL' then
           Ide.tpEmis  := teNormal
         else
          Ide.tpEmis  := teContingencia;
        Ide.procEmi := peAplicativoContribuinte;
        Ide.verProc := '4.0'; // Depois deveria olhar a versao


        Ide.UFIni   := dataSet.FieldByName('UFINI').AsString;
        Ide.UFFim   := dataSet.FieldByName('UFFIM').AsString;

        AListUFPer := TStringList.Create();
        try
          AListUFPer.LineBreak := ',';
          AListUFPer.Text := dataSet.FieldByName('UFPER').AsString;
          for AUFPer in AListUFPer do
            with Ide.infPercurso.Add do
              UFPer := AUFPer;

        finally
          FreeAndNil(AListUFPer);
        end;

        SqlOpen('SELECT CMUNCARREGA, XMUNCARREGA from MDFE_CARREGA' +
                ' where COD_MDFE = ' + dataset.FieldByName('COD_MDFE').AsString +
                ' AND COD_EMPRESA = ' + dataset.FieldByName('COD_EMPRESA').AsString, buscas);

        with Ide.infMunCarrega.Add do
        begin
         cMunCarrega := buscas.FieldByName('CMUNCARREGA').AsInteger;
         xMunCarrega := buscas.FieldByName('XMUNCARREGA').AsString;
         //     'GOVERNADOR VALADARES';
        end;

        //
        // Dados do Emitente
        //
        Emit.CNPJCPF := cadempresa.dataset.FieldByName('CGC_EMP').AsString;
        Emit.IE      := cadempresa.dataset.FieldByName('IE_EMP').AsString;
        Emit.xNome   := cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
        Emit.xFant   := cadempresa.dataSet.FieldByName('FANTASIA_EMP').AsString;

        Emit.EnderEmit.xLgr    := cadempresa.dataSet.FieldByName('ENDRECO_EMP').AsString;
        Emit.EnderEmit.nro     := cadempresa.dataSet.FieldByName('NUMERO_END').AsString;
        Emit.EnderEmit.xCpl    := '.';
        Emit.EnderEmit.xBairro := cadempresa.dataSet.FieldByName('BAIRRO_EMP').AsString;//<Bairro>
        Emit.EnderEmit.cMun    := cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;
        Emit.EnderEmit.xMun    := cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString;
        Emit.EnderEmit.CEP     := strtoint(trim(cadempresa.dataSet.FieldByName('CEP_EMP').AsString));
        Emit.EnderEmit.UF      := cadempresa.dataSet.FieldByName('WEBSERV_UF').AsString;
        Emit.EnderEmit.fone    := cadempresa.dataSet.FieldByName('TELEFONE_EMP').AsString;//<fone>
        Emit.enderEmit.email   := cadempresa.dataSet.FieldByName('EMAIL_EMP').AsString;//<fone>

        if dataset.FieldByName('RNTRC').AsInteger <> 0 then
          rodo.RNTRC :=StrZero(dataset.FieldByName('RNTRC').AsInteger,8);
        if dataset.FieldByName('CIOT').AsInteger <> 0 then
          rodo.CIOT :=dataset.FieldByName('CIOT').AsString;
        buscas.close;
        buscas.sql.text:='SELECT VTR.*,CL.CPFCGC,CL.NOME_CLIENTE,'+
        'CL.INSC_EST,EST.SIGLA_UF FROM VEICULOS_TRANSPORTE VTR LEFT JOIN CLIENTES CL '+
        'ON VTR.COD_PROP_TERCEIRO = CL.COD_CLIENTE AND VTR.COD_EMPRESA = CL.COD_EMPRESA '+
        'LEFT JOIN ESTADOS EST ON CL.CODIGO_UF = EST.CODIGO_UF WHERE VTR.COD_VEIC = '+
        dataSet.FieldByName('COD_VEIC').AsString+' AND VTR.COD_EMPRESA = '+
        dataSet.FieldByName('COD_EMPRESA').AsString;
        buscas.open;
        if not buscas.isempty then
        begin
         rodo.veicTracao.cInt  := buscas.FieldByName('COD_VEIC').AsString;
         rodo.veicTracao.placa := buscas.FieldByName('PLACA').AsString;
         rodo.veicTracao.tara  := buscas.FieldByName('TARA').AsInteger;
         rodo.veicTracao.capKG := buscas.FieldByName('PESO_MAXIMO').AsInteger;
         rodo.veicTracao.capM3 := buscas.FieldByName('CAPM3').AsInteger;
         rodo.veicTracao.UF:=buscas.FieldByName('UF_LICENCIADO').AsString;
         rodo.veicTracao.tpRod:=StrToTpRodado(vok,StrZero(buscas.FieldByName('TPROD').AsInteger,2));
         rodo.veicTracao.tpCar:=StrToTpCarroceria(vok,StrZero(buscas.FieldByName('TPCAR').AsInteger,2));
         if buscas.FieldByName('TERCEIRO').AsString = 'S' then
         begin
           rodo.veicTracao.prop.CNPJCPF:=buscas.FieldByName('CPFCGC').AsString;
           rodo.veicTracao.prop.RNTRC:=StrZero(buscas.FieldByName('RNTRC_TERCEIRO').AsInteger,8);
           rodo.veicTracao.prop.xNome:=buscas.FieldByName('NOME_CLIENTE').AsString;
           rodo.veicTracao.prop.IE:=buscas.FieldByName('INSC_EST').AsString;
           rodo.veicTracao.prop.UF:=buscas.FieldByName('SIGLA_UF').AsString;
           rodo.veicTracao.prop.tpProp:=StrToTpProp(vok,buscas.FieldByName('TPPROP_TERCEIRO').AsString);
         end;
         with rodo.veicTracao.condutor.Add do
         begin
           xNome :=dataset.FieldByName('XNOME_CONDUTOR').AsString;
           CPF   := dataset.FieldByName('CPF_CONDUTOR').AsString;
         end;
         buscas.close;
         if dataset.FieldByName('COD_VEIC_REBOQUE_1').AsInteger <> 0 then
         begin
           buscas.sql.text:='SELECT VTR.*,CL.CPFCGC,CL.NOME_CLIENTE,'+
           'CL.INSC_EST,EST.SIGLA_UF FROM VEICULOS_TRANSPORTE VTR LEFT JOIN CLIENTES CL '+
           'ON VTR.COD_PROP_TERCEIRO = CL.COD_CLIENTE AND VTR.COD_EMPRESA = CL.COD_EMPRESA '+
           'LEFT JOIN ESTADOS EST ON CL.CODIGO_UF = EST.CODIGO_UF WHERE VTR.COD_VEIC = '+
           dataSet.FieldByName('COD_VEIC_REBOQUE_1').AsString+' AND VTR.COD_EMPRESA = '+
           dataSet.FieldByName('COD_EMPRESA').AsString;
           buscas.Open;
           with rodo.veicReboque.Add do
            begin
             cInt  := dataset.FieldByName('COD_VEIC_REBOQUE_1').AsString;
             placa := buscas.FieldByName('PLACA').AsString;
             tara  := buscas.FieldByName('TARA').AsInteger;
             capKG := buscas.FieldByName('PESO_MAXIMO').AsInteger;
             capM3 := buscas.FieldByName('CAPM3').AsInteger;
             UF:=buscas.FieldByName('UF_LICENCIADO').AsString;
             tpCar:=StrToTpCarroceria(vok,StrZero(buscas.FieldByName('TPCAR').AsInteger,2));
             if buscas.FieldByName('TERCEIRO').AsString = 'S' then
             begin
               prop.CNPJCPF:=buscas.FieldByName('CPFCGC').AsString;
               prop.RNTRC:=StrZero(buscas.FieldByName('RNTRC_TERCEIRO').AsInteger,8);
               prop.xNome:=buscas.FieldByName('NOME_CLIENTE').AsString;
               prop.IE:=buscas.FieldByName('INSC_EST').AsString;
               prop.UF:=buscas.FieldByName('SIGLA_UF').AsString;
               prop.tpProp:=StrToTpProp(vok,buscas.FieldByName('TPPROP_TERCEIRO').AsString);
             end;
            end;
            buscas.close;
         end;
         if dataset.FieldByName('COD_VEIC_REBOQUE_2').AsInteger <> 0 then
         begin
           buscas.sql.text:='SELECT VTR.*,CL.CPFCGC,CL.NOME_CLIENTE,'+
           'CL.INSC_EST,EST.SIGLA_UF FROM VEICULOS_TRANSPORTE VTR LEFT JOIN CLIENTES CL '+
           'ON VTR.COD_PROP_TERCEIRO = CL.COD_CLIENTE AND VTR.COD_EMPRESA = CL.COD_EMPRESA '+
           'LEFT JOIN ESTADOS EST ON CL.CODIGO_UF = EST.CODIGO_UF WHERE VTR.COD_VEIC = '+
           dataSet.FieldByName('COD_VEIC_REBOQUE_2').AsString+' AND VTR.COD_EMPRESA = '+
           dataSet.FieldByName('COD_EMPRESA').AsString;
           buscas.Open;
           with rodo.veicReboque.Add do
            begin
             cInt  := dataset.FieldByName('COD_VEIC_REBOQUE_2').AsString;
             placa := buscas.FieldByName('PLACA').AsString;
             tara  := buscas.FieldByName('TARA').AsInteger;
             capKG := buscas.FieldByName('PESO_MAXIMO').AsInteger;
             capM3 := buscas.FieldByName('CAPM3').AsInteger;
             UF:=buscas.FieldByName('UF_LICENCIADO').AsString;
             tpCar:=StrToTpCarroceria(vok,StrZero(buscas.FieldByName('TPCAR').AsInteger,2));
             if buscas.FieldByName('TERCEIRO').AsString = 'S' then
             begin
               prop.CNPJCPF:=buscas.FieldByName('CPFCGC').AsString;
               prop.RNTRC:=StrZero(buscas.FieldByName('RNTRC_TERCEIRO').AsInteger,8);
               prop.xNome:=buscas.FieldByName('NOME_CLIENTE').AsString;
               prop.IE:=buscas.FieldByName('INSC_EST').AsString;
               prop.UF:=buscas.FieldByName('SIGLA_UF').AsString;
               prop.tpProp:=StrToTpProp(vok,buscas.FieldByName('TPPROP_TERCEIRO').AsString);
             end;
            end;
            buscas.close;
         end;
         if dataset.FieldByName('COD_VEIC_REBOQUE_3').AsInteger <> 0 then
         begin
           buscas.sql.text:='SELECT VTR.*,CL.CPFCGC,CL.NOME_CLIENTE,'+
           'CL.INSC_EST,EST.SIGLA_UF FROM VEICULOS_TRANSPORTE VTR LEFT JOIN CLIENTES CL '+
           'ON VTR.COD_PROP_TERCEIRO = CL.COD_CLIENTE AND VTR.COD_EMPRESA = CL.COD_EMPRESA '+
           'LEFT JOIN ESTADOS EST ON CL.CODIGO_UF = EST.CODIGO_UF WHERE VTR.COD_VEIC = '+
           dataSet.FieldByName('COD_VEIC_REBOQUE_3').AsString+' AND VTR.COD_EMPRESA = '+
           dataSet.FieldByName('COD_EMPRESA').AsString;
           buscas.Open;
           with rodo.veicReboque.Add do
            begin
             cInt  := dataset.FieldByName('COD_VEIC_REBOQUE_3').AsString;
             placa := buscas.FieldByName('PLACA').AsString;
             tara  := buscas.FieldByName('TARA').AsInteger;
             capKG := buscas.FieldByName('PESO_MAXIMO').AsInteger;
             capM3 := buscas.FieldByName('CAPM3').AsInteger;
             UF:=buscas.FieldByName('UF_LICENCIADO').AsString;
             tpCar:=StrToTpCarroceria(vok,StrZero(buscas.FieldByName('TPCAR').AsInteger,2));
             if buscas.FieldByName('TERCEIRO').AsString = 'S' then
             begin
               prop.CNPJCPF:=buscas.FieldByName('CPFCGC').AsString;
               prop.RNTRC:=StrZero(buscas.FieldByName('RNTRC_TERCEIRO').AsInteger,8);
               prop.xNome:=buscas.FieldByName('NOME_CLIENTE').AsString;
               prop.IE:=buscas.FieldByName('INSC_EST').AsString;
               prop.UF:=buscas.FieldByName('SIGLA_UF').AsString;
               prop.tpProp:=StrToTpProp(vok,buscas.FieldByName('TPPROP_TERCEIRO').AsString);
             end;
            end;
            buscas.close;
         end;
        end
        else
        begin
         Application.MessageBox(PWideChar('SEM MODAL DE TRANSPORTE'), 'Atenção', MB_ICONWARNING + MB_OK);
         result:='SEM MODAL DE TRANSPORTE';
         exit;
        end;

        {   with rodo.valePed.disp.Add do
        begin
         CNPJForn := '12345678000199';
         CNPJPg   := '21543876000188';
         nCompra  := '789';
        end;}
        buscas.close;
        (*buscas.sql.text:='SELECT MDFD.CMUNDESCARGA,MDFD.XMUNDESCARGA,MDFDNF.CHAVENFE,'+
        'MDFDNF.SEGCODBARRA FROM MDFE MDF INNER JOIN MDFE_DESCARGA MDFD ON MDF.COD_MDFE = '+
        'MDFD.COD_MDFE AND MDF.COD_EMPRESA = MDFD.COD_EMPRESA INNER JOIN MDFE_DESCARGA_NFE MDFDNF '+
        'ON MDFD.COD_MDFE = MDFDNF.COD_MDFE AND MDFD.COD_EMPRESA = MDFDNF.COD_EMPRESA AND '+
        'MDFD.CMUNDESCARGA = MDFDNF.CMUNDESCARGA WHERE MDF.COD_MDFE = '+
        dataset.FieldByName('COD_MDFE').AsString+' ORDER BY MDFD.CMUNDESCARGA,MDFDNF.CHAVENFE';*)

        buscas.sql.text:='SELECT MDF.COD_MDFE,MDFD.CMUNDESCARGA,MDFD.XMUNDESCARGA '+
        'FROM MDFE MDF INNER JOIN MDFE_DESCARGA MDFD ON MDF.COD_MDFE = '+
        'MDFD.COD_MDFE AND MDF.COD_EMPRESA = MDFD.COD_EMPRESA WHERE MDF.COD_MDFE = '+
        dataset.FieldByName('COD_MDFE').AsString+' AND MDF.COD_EMPRESA = '+dataset.FieldByName('COD_EMPRESA').AsString+' ORDER BY MDFD.CMUNDESCARGA';
        buscas.open;
        if not buscas.IsEmpty then
        begin
          while not buscas.eof do
          begin
            with infDoc.infMunDescarga.Add do
            begin
              cMunDescarga := buscas.FieldByName('CMUNDESCARGA').AsInteger;
              xMunDescarga := buscas.FieldByName('XMUNDESCARGA').AsString;
              buscaadc.close;
              buscaadc.sql.text:='SELECT MDFDNF.COD_NF, MDFDNF.CHNFE,MDFDNF.SEGCODBARRA, MDFDNF.INDREENTREGA, MDFDNF.ID FROM '+
                ' VW_MDFE_DESCARGA_NFE MDFDNF WHERE MDFDNF.COD_MDFE = '+dataset.FieldByName('COD_MDFE').AsString+
                ' AND MDFDNF.COD_EMPRESA = '+dataset.FieldByName('COD_EMPRESA').AsString+' AND '+
                'MDFDNF.CMUNDESCARGA = '+buscas.FieldByName('CMUNDESCARGA').AsString+
                ' ORDER BY MDFDNF.CHNFE';
              buscaadc.open;

              if  not buscaadc.IsEmpty then
              begin
                while not buscaadc.eof do
                begin
                  with infNFe.add do
                  begin
                    chNFe:=buscaadc.FieldByName('CHNFE').AsString;
                    SegCodBarra:=buscaadc.FieldByName('SEGCODBARRA').AsString;
                    indReentrega := IfThen(buscaadc.FieldByName('INDREENTREGA').AsInteger = 1, '1');

                    ABuscasAd1.Close;
                    ABuscasAd1.SQL.Text := 'select * from VW_MDFE_DESCARGA_NFE_UN_TR' +
                      ' where cod_mdfe = ' + IntToStr(dataset.FieldByName('COD_MDFE').AsInteger) +
                      ' and cod_empresa = ' + IntToStr(dataset.FieldByName('COD_EMPRESA').AsInteger) +
                      ' and cmundescarga = ' + IntToStr(buscas.FieldByName('CMUNDESCARGA').AsInteger) +
                      ' and coalesce(cod_nf, 0) = ' + IntToStr(buscaadc.FieldByName('COD_NF').AsInteger) +
                      ' and coalesce(descarga_id, 0) = ' + IntToStr(buscaadc.FieldByName('ID').AsInteger) +
                      ' order by seqid, id';
                    ABuscasAd1.Open;
                    while not ABuscasAd1.Eof do
                    begin
                      var undTr := infUnidTransp.Add;
                      undTr.tpUnidTransp := StrToUnidTransp(AOK, IntToStr(ABuscasAd1.FieldByName('TPUNIDTRANSP').AsInteger));
                      undTr.idUnidTransp := ABuscasAd1.FieldByName('IDUNIDTRANSP').AsString;
                      ALacres.Text := ABuscasAd1.FieldByName('LACUNIDTRANSP_LACRES').AsString;
                      for I := 0 to ALacres.Count - 1 do
                        undTr.lacUnidTransp.Add.nLacre := ALacres[I];
                      undTr.qtdRat := ABuscasAd1.FieldByName('QTDRAT').AsFloat;

                       ABuscasAd2.Close;
                       ABuscasAd2.SQL.Text := 'select * from VW_MDFE_DESCARGA_NFE_UN_TR_CRG' +
                         ' where cod_mdfe = ' + IntToStr(dataset.FieldByName('COD_MDFE').AsInteger) +
                         ' and cod_empresa = ' + IntToStr(dataset.FieldByName('COD_EMPRESA').AsInteger) +
                         ' and cmundescarga = ' + IntToStr(buscas.FieldByName('CMUNDESCARGA').AsInteger) +
                         ' and coalesce(cod_nf, 0) = ' + IntToStr(buscaadc.FieldByName('COD_NF').AsInteger) +
                         ' and coalesce(seqid, 0) = ' + IntToStr(ABuscasAd1.FieldByName('SEQID').AsInteger) +
                         ' and coalesce(untr_id, 0) = ' + IntToStr(ABuscasAd1.FieldByName('ID').AsInteger) +
                         ' order by seqid_carga, id';
                       ABuscasAd2.Open;
                       while not ABuscasAd2.Eof do
                       begin
                         var unidCarga := undTr.infUnidCarga.Add;
                         unidCarga.tpUnidCarga := StrToUnidCarga(AOK, IntToStr(ABuscasAd2.FieldByName('TPUNIDCARGA').AsInteger));
                         unidCarga.idUnidCarga := ABuscasAd2.FieldByName('IDUNIDCARGA').AsString;
                         ALacres.Text := ABuscasAd2.FieldByName('LACUNIDCARGA_LACRES').AsString;
                         for I := 0 to ALacres.Count - 1 do
                           unidCarga.lacUnidCarga.Add.nLacre := ALacres[I];
                         unidCarga.qtdRat := ABuscasAd2.FieldByName('QTDRAT').AsFloat;

                         ABuscasAd2.Next;
                       end;

                      ABuscasAd1.Next;
                    end;

                  end;
                  buscaadc.next;
                end;
              end
              else
              begin
                Application.MessageBox(PWideChar('SEM CHAVES NFE PARA MUNICIPIO('+buscas.FieldByName('XMUNDESCARGA').AsString+') DESCARGA'), 'Atenção', MB_ICONWARNING + MB_OK);
                result:='SEM CHAVES NFE PARA MUNICIPIO('+buscas.FieldByName('XMUNDESCARGA').AsString+') DESCARGA';
                exit;
              end;
            end;
            buscas.Next;
          end;
        end
        else
        begin
          Application.MessageBox(PWideChar('SEM MUNICIPIO(S) DESCARGA'), 'Atenção', MB_ICONWARNING + MB_OK);
          result:='SEM MUNICIPIO(S) DESCARGA';
          exit;
        end;
        buscas.close;
        buscaadc.close;
        //   tot.qCTe := 2;
        //   tot.qCT  := 1;
        tot.qNFe:=dataSet.FieldByName('QNFE').AsInteger;
        tot.vCarga :=dataSet.FieldByName('VCARGA').AsCurrency;
        // UnidMed = (uM3,uKG, uTON, uUNIDADE, uLITROS);
        tot.cUnid  :=  StrToUnidMed(vok,StrZero(dataSet.FieldByName('CUNID').AsInteger,2));
        tot.qCarga :=dataSet.FieldByName('QCARGA').AsFloat;
        {   with lacres.Add do
        begin
         nLacre := '123';
        end;}
        infAdic.infCpl     :=dataSet.FieldByName('INFCPL').AsString;
        infAdic.infAdFisco := dataSet.FieldByName('INFADFISCO').AsString;
      end;
      dataset.Next;
    end;
    if AOperacao = TClassMDFeTipoOperacao.opMDFeEnviar then
    begin
      try
        ACBrMDFe1.Enviar(vnumlote, False, True);
      except on E: Exception do
        begin
          Result:= e.Message;
          if Application.MessageBox('Erro ao enviar MDF-e. Mostrar erro?', 'Erro', MB_ICONQUESTION + MB_YESNO) = IDYES then
            Application.MessageBox(PWideChar(E.Message), 'Erro', MB_ICONERROR + MB_OK);
          Exit;
        end;
      end;
    end
    else if AOperacao = TClassMDFeTipoOperacao.opMDFeImprimir then
    begin
      ACBrMDFe1.Manifestos.Items[0].GravarXML('');
      vchaveimp:=copy(ACBrMDFe1.Manifestos.Items[0].MDFe.infMDFe.ID,
             (length(ACBrMDFe1.Manifestos.Items[0].MDFe.infMDFe.ID)-44)+1, 44);
    end
    else
      raise Exception.Create('Operação não definida para o MDFe');
    result:='OK';
  finally
    FreeAndNil(ABuscasAd1);
    FreeAndNil(ABuscasAd2);
    FreeAndNil(ALacres);
  end;
end;

(*procedure TClassMDFe.ExecSQL(SQL: string; Query: TIbQuery);
begin

end;*)

function TClassMDFe.GravaRetMDFE(vAcbrMDFE: TACBrMDFe; ATipoRetorno: TClassMDFeTipoRetorno;
  vlote: Integer): boolean;
var
 i: integer;
 ix: integer;
 vflg: integer;
 vflgdanfe: integer;
 vteste: string;
 vteste1: string;
 vteste2: string;
begin
 IF ATipoRetorno = TClassMDFeTipoRetorno.reMDFeEnvio then
  dataset.first;
 vcmsg:='';
 vxmsg:='';
 vTIPONFE:=cadempresa.dataSet.FieldByName('TIPOMDFE').AsString;
// IniciaTransacao;
 if vAcbrMDFE.WebServices.Retorno.xMsg <> '' then
 begin
  vcmsg:=inttostr(vAcbrMDFE.WebServices.Retorno.cMsg);
  vxmsg:=vAcbrMDFE.WebServices.Retorno.xMsg;
 end;
 while Not dataSet.Eof do
 begin
   vflg:=1;
   for ix := 0 to vAcbrMDFE.Manifestos.Count-1 do
    if vAcbrMDFE.Manifestos.Items[ix].MDFe.Ide.nMDF = dataSet.fieldbyname('NMDF').AsInteger then
    begin
      vflg:=0;
      break;
    end;

   if ATipoRetorno = TClassMDFeTipoRetorno.reMDFeConsulta then
   begin
    if vflg = 0 then
    begin
      if vAcbrMDFE.WebServices.Consulta.cStat = 100 then
      begin
       IniciaTransacao;
       try
        dataSet.Edit;
        dataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime:=vAcbrMDFE.WebServices.Consulta.DhRecbto;
//        vDATA_AUTORIZACAO:=vAcbrNFE.WebServices.Consulta.DhRecbto;
        dataSet.FieldByName('SITUACAO_MDFE').asstring:='Autorizada';
        vSITUACAO_MDFE:='Autorizada';
        dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrMDFE.WebServices.Consulta.Protocolo;
//        vPROTOCOLO:=vAcbrNFE.WebServices.Consulta.Protocolo;
        dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrMDFE.WebServices.Consulta.cStat;
//        vCODIGOERRO:=inttostr(vAcbrNFE.WebServices.Consulta.cStat);
        dataSet.FieldByName('DESCRICAOERRO').AsString:=vAcbrMDFE.WebServices.Consulta.XMotivo;
        vDESCRICAOERRO:=vAcbrMDFE.WebServices.Consulta.XMotivo;
        dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(ttime(vAcbrMDFE.WebServices.Consulta.DhRecbto));
//        vHORA_ENVIO:=ttime(vAcbrNFE.WebServices.Consulta.DhRecbto);
//            dataSet.FieldByName('TIPONFE').AsString:=vTIPONFE;
//        dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrMDFE.WebServices.Consulta.
//        Enviar.TMed;
        dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrMDFE.WebServices.Consulta.DhRecbto;
//        vDATAHORA_ENVIO:=vAcbrNFE.WebServices.Consulta.DhRecbto;
        dataSet.FieldByName('CHAVE_MDFE').AsString:=vAcbrMDFE.WebServices.Consulta.MDFeChave;
        dataSet.FieldByName('TIPOMDFE').AsString:='NORMAL';
//        dataSet.FieldByName('STAT_NFERECIBO').AsString:='OK';
  //      vCHAVE_NFE:=vAcbrNFE.WebServices.Consulta.NFeChave;
        dataSet.FieldByName('XML_MDFE').AsString:=vAcbrMDFE.Manifestos.Items[0].GerarXML();
        dataSet.FieldByName('XML_MDFE').AsString:=vAcbrMDFE.Manifestos.Items[0].XML; // Sempre carrega no objeto antes de consultar
        dataSet.post;
        Apply;
        CommitaTransacao;
        vflgdanfe:=0;
        try
        vteste:=vAcbrMDFE.Configuracoes.Arquivos.PathSalvar+
         vAcbrMDFE.WebServices.Consulta.MDFeChave+'-mdfe.xml';
         vteste1:=vAcbrMDFE.Configuracoes.Arquivos.PathSalvar + 'Autorizado\'+vAcbrMDFE.WebServices.Consulta.MDFeChave+'-mdfe.xml';

        if CopyFile(PWideChar(vteste),
         PWideChar(vteste1), true) then
          DeleteFile(PWideChar(vteste));
         vAcbrMDFE.Manifestos.Items[ix].Imprimir;
//         vDANFEIMPRESSO:='SIM';
        except
          on e: exception do
          begin
           if application.messagebox('Erro ao Imprimir DAMDFE. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
            vflgdanfe:=1;
          end;
        end;
       except
        on e: exception do
        begin
         RollBackTransacao;
         if application.messagebox('Erro ao gravar retorno do MDF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
        end;
       end;
      end;
    end;
   end

   else if ATipoRetorno = TClassMDFeTipoRetorno.reMDFeEnvio then
   begin
      if vflg = 0 then
      begin
        if (vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat <> 100) and (vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat <> 104) then
        begin
         IniciaTransacao;
         try
          dataSet.Edit;
          if vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.xMotivo <> '' then
           dataSet.FieldByName('RESULTADO_ENVIO').asstring:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.xMotivo
          else
          dataSet.FieldByName('RESULTADO_ENVIO').asstring:=vAcbrMDFE.WebServices.Retorno.xMotivo;
//          vRESULTADO_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.xMotivo;
          if vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat <> 0 then
           dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat
          else
            dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrMDFE.WebServices.Retorno.cStat;
          dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.nProt;
//          vPROTOCOLO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
          dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrMDFE.WebServices.Enviar.TMed;
          dataSet.FieldByName('NFE_RECIBO').AsString:=vAcbrMDFE.WebServices.Enviar.Recibo;
//          vTEMPORESPOSTA:=vAcbrNFE.WebServices.Enviar.TMed;
          IF (vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat = 204) or
          //vAcbrNFE.WebServices.Retorno.cStat = 204) or
          (vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat = 105) or (vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat = 103)
           then
          begin
           dataSet.FieldByName('SITUACAO_MDFE').AsString:='Em Processamento';
//           dataSet.FieldByName('STAT_NFERECIBO').AsString:='PENDENTE';
           vSITUACAO_MDFE:='Em Processamento';
          end
          else
          begin
            if vAcbrMDFE.WebServices.Retorno.cStat = 105 then
            begin
             dataSet.FieldByName('SITUACAO_MDFE').AsString:='Em Processamento';
//             dataSet.FieldByName('STAT_NFERECIBO').AsString:='PENDENTE';
             vSITUACAO_MDFE:='Em Processamento';
            end;
          end;

//          dataSet.FieldByName('TIPONFE').AsString:=vTIPONFE;
          dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(Ttime(vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.dhRecbto));
//          vHORA_ENVIO:=Ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto);
          dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.dhRecbto;
//          vDATAHORA_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
          if vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.chDFe <> '' then
           dataSet.FieldByName('CHAVE_MDFE').AsString:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.chDFe
          else
           dataSet.FieldByName('CHAVE_MDFE').AsString:=copy(vAcbrMDFE.Manifestos.Items[ix].MDFe.infMDFe.ID,
           (length(vAcbrMDFE.Manifestos.Items[ix].MDFe.infMDFe.ID)-44)+1, 44);

          dataSet.FieldByName('MDFE_CMSG').AsInteger:=vAcbrMDFE.WebServices.Retorno.cMsg;
          dataSet.FieldByName('MDFE_XMSG').AsString:=vAcbrMDFE.WebServices.Retorno.xMsg;
//          dataSet.fieldbyname('LOTE_NFE').value:=vlote;
          dataSet.FieldByName('XML_MDFE').AsString:=vAcbrMDFE.Manifestos.Items[ix].XMLAssinado;
          dataSet.Post;
          Apply;
          CommitaTransacao;
         except
          on e: exception do
          begin
           RollBackTransacao;
           if application.messagebox('Erro ao gravar retorno da MDF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
          end;
         end;
        end
        else
        begin
          IF (vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat = 100) or (vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat = 104) then
          begin
            if vAcbrMDFE.Manifestos.Items[ix].Confirmado then
            begin
             IniciaTransacao;
             try
              dataSet.Edit;
              dataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.dhRecbto;
//              vDATA_AUTORIZACAO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
              dataSet.FieldByName('SITUACAO_MDFE').asstring:='Autorizada';
              vSITUACAO_MDFE:='Autorizada';
              dataSet.FieldByName('DIGEST').asstring:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.digVal;
//              vDIGEST:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.digVal;
              dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.nProt;
//              vPROTOCOLO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
              dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat;
//              vCODIGOERRO:=inttostr(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat);
              dataSet.FieldByName('DESCRICAOERRO').AsString:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.xMotivo;
              vDESCRICAOERRO:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.xMotivo;
              dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(ttime(vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.dhRecbto));
//              vHORA_ENVIO:=ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto);
//              dataSet.FieldByName('TIPONFE').AsString:=vTIPONFE;
              dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrMDFE.WebServices.Enviar.TMed;
              dataSet.FieldByName('NFE_RECIBO').AsString:=vAcbrMDFE.WebServices.Enviar.Recibo;
//              dataSet.FieldByName('STAT_NFERECIBO').AsString:='OK';
              dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.dhRecbto;
//              vDATAHORA_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
              dataSet.FieldByName('CHAVE_MDFE').AsString:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.chDFe;
//              vCHAVE_NFE:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe;
              dataSet.FieldByName('MDFE_CMSG').AsInteger:=vAcbrMDFE.WebServices.Retorno.cMsg;
              dataSet.FieldByName('MDFE_XMSG').AsString:=vAcbrMDFE.WebServices.Retorno.xMsg;
              dataSet.FieldByName('TIPOMDFE').AsString:='NORMAL';
//              dataSet.fieldbyname('SEL_NFE').value:=0;
//              dataSet.fieldbyname('LOTE_NFE').value:=vlote;
              dataSet.FieldByName('XML_MDFE').AsString:=vAcbrMDFE.Manifestos.Items[ix].XML;
              dataSet.post;
              Apply;
              CommitaTransacao;
              vflgdanfe:=0;
              try
               vteste1:=vAcbrMDFE.Configuracoes.Arquivos.PathSalvar + 'Autorizado\'+ vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.chDFe+'-mdfe.xml';
//               vteste2:=vACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Veic\'+ vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe+'-mdfe.xml';
               if CopyFile(PWideChar(vAcbrMDFE.Configuracoes.Arquivos.PathSalvar+vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.chDFe+'-mdfe.xml'),
               PWideChar(vAcbrMDFE.Configuracoes.Arquivos.PathSalvar + 'Autorizado\'+
               vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.chDFe+'-mdfe.xml'), true) then
                  DeleteFile(PWideChar(vAcbrMDFE.Configuracoes.Arquivos.PathSalvar+'\'+
               vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.chDFe+'-mdfe.xml'));

//               if Trim(vAcbrNFE.NotasFiscais.Items[ix].NFe.Det.Items[0].Prod.veicProd.chassi) <> '' then
//                 if DirectoryExists(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'Veic') then
//                   if DirectoryExists(vACBrNFe.Configuracoes.Arquivos.PathSalvar+'Veic') then
//                     if FileExists(vteste1) then
//                       CopyFile(PWideChar(vteste1),
//                         PWideChar(vteste2), true);
               vAcbrMDFE.Manifestos.Items[ix].Imprimir;
//               vDANFEIMPRESSO:='SIM';
              except
                on e: exception do
                begin
                 if application.messagebox('Erro ao Imprimir DAMDFE. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                  Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
                  vflgdanfe:=1;
                end;
              end;
             except
              on e: exception do
              begin
               RollBackTransacao;
               if application.messagebox('Erro ao gravar retorno da MDF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
              end;
             end;
            end
            else
             vSITUACAO_MDFE:='Rejeitada';
          end
          else
           vSITUACAO_MDFE:='Rejeitada';

          if vSITUACAO_MDFE = 'Rejeitada' then
          begin
            IniciaTransacao;
             try
              dataSet.Edit;
              dataSet.FieldByName('SITUACAO_MDFE').asstring:=vSITUACAO_MDFE;
              dataSet.FieldByName('DIGEST').asstring:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.digVal;
//              vDIGEST:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.digVal;
              dataSet.FieldByName('PROTOCOLO').asstring:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.nProt;
//              vPROTOCOLO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.nProt;
              dataSet.FieldByName('CODIGOERRO').AsInteger:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.cStat;
//              vCODIGOERRO:=inttostr(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.cStat);
              dataSet.FieldByName('DESCRICAOERRO').AsString:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.xMotivo;
              vDESCRICAOERRO:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.xMotivo;
              dataSet.FieldByName('HORA_ENVIO').AsString:=TimeToStr(ttime(vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.dhRecbto));
//              vHORA_ENVIO:=ttime(vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto);
              dataSet.FieldByName('TIPONFE').AsString:=vTIPONFE;
              dataSet.FieldByName('TEMPORESPOSTA').asinteger:=vAcbrMDFE.WebServices.Enviar.TMed;
              dataSet.FieldByName('DATAHORA_ENVIO').AsDateTime:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.dhRecbto;
//              vDATAHORA_ENVIO:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.dhRecbto;
              dataSet.FieldByName('CHAVE_MDFE').AsString:=vAcbrMDFE.Manifestos.Items[ix].MDFe.procMDFe.chDFe;
//              vCHAVE_NFE:=vAcbrNFE.NotasFiscais.Items[ix].NFe.procNFe.chNFe;
              dataSet.FieldByName('MDFE_CMSG').AsInteger:=vAcbrMDFE.WebServices.Retorno.cMsg;
              dataSet.FieldByName('MDFE_XMSG').AsString:=vAcbrMDFE.WebServices.Retorno.xMsg;
//              dataSet.fieldbyname('SEL_NFE').value:=0;
//              dataSet.fieldbyname('LOTE_NFE').value:=vlote;
              dataSet.post;
              Apply;
              CommitaTransacao;
             except
              on e: exception do
              begin
               RollBackTransacao;
               if application.messagebox('Erro ao gravar retorno da MDF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
              end;
             end;
          end;
       end;
      end
      else
      begin
       // Colocar status não enviado...
       vDESCRICAOERRO:='Nf não enviada';
      end;
   end
   else
     raise Exception.Create('Tipo de Retorno do evento não programado - MDFe');

   if ATipoRetorno = TClassMDFeTipoRetorno.reMDFeEnvio then
    Next
   else
    break;
 end;
 if cadempresa.vENVIAEMAILNFE = 'S' then
 begin
  for ix := 0 to vAcbrMDFE.Manifestos.Count-1 do
  begin
   if vAcbrMDFE.Manifestos.Items[ix].Confirmado then
   begin
//     if vAcbrMDFE.Manifestos.Items[ix].MDFe.Ide.tpEmis = teContingencia then
//      enviaEmail(vAcbrNFE,1,ix,vAcbrNFE.WebServices.EnviarDPEC.nRegDPEC)
//     else
      enviaEmailMDFE(vAcbrMDFE, TClassMDFeTipoEmail.emMDFeEnvioDoc, ix,'0');
   end;
  end;
 end;
end;

function TClassMDFe.GravaRetornoEventoMDFE(vAcbrMDFE: TACBrMDFe;
  idlote: Integer): boolean;
  var
  vteste,vteste1: string;
  vretorno: integer;
begin
 Result := False;
 IniciaTransacao;
 dataSet.edit;
 dataset.FieldByName('CSTAT_EVENTO').AsInteger:=0;
 try
  edit;
  if vflagevento >= 0 then
  begin
//    dataset.FieldByName('CSTAT_PROC_EVENTO').AsInteger:=vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.cStat;
//    dataset.FieldByName('XMOTIVO_PROC_EVENTO').AsString:=vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.xMotivo;
//    ACBrMDFe1.WebServices.Consulta.procEventoMDFe.Items[i].RetEventoMDFe.InfEvento.tpEvento = teCancelamento
    if (vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.retEvento.Items[vflagevento].RetInfEvento.cStat = 135) or
    (vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.retEvento.Items[vflagevento].RetInfEvento.cStat = 155) then
    begin
//    FprocEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.cStat
     dataset.FieldByName('CSTAT_EVENTO').AsInteger:=vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.retEvento.Items[0].RetInfEvento.cStat;
     dataset.FieldByName('XMOTIVO_EVENTO').AsString:=vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.retEvento.Items[0].RetInfEvento.xMotivo;
     dataset.FieldByName('NPROT_EVENTO').AsString:=vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.retEvento.Items[0].RetInfEvento.nProt;
     dataset.FieldByName('DH_EVENTO').AsDateTime:=vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.retEvento.Items[0].RetInfEvento.dhRegEvento;
     if vcodevento = TpEventoToStr(teCancelamento) then
      dataset.FieldByName('SITUACAO_EVENTO').AsString:='Cancelado'
     else
      dataset.FieldByName('SITUACAO_EVENTO').AsString:='Encerrado';
     dataset.FieldByName('EVE_XML_MDFE').AsString := vAcbrMDFE.WebServices.Consulta.procEventoMDFe.Items[vflagevento].RetEventoMDFe.XML;
     result:=true;
    end;
  end
  else
  begin
    if vrespevento then
    //(vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.cStat = 101) and (vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.cStat = 132) then
    begin

//      dataset.FieldByName('CSTAT_PROC_EVENTO').AsInteger:=vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.cStat;
//          FEvento.Evento.Items[i].RetInfEvento.cStat
//      dataset.FieldByName('XMOTIVO_PROC_EVENTO').AsString:=vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.xMotivo;
      if (vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135) or
      (vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 155) then
      begin
       dataset.FieldByName('CSTAT_EVENTO').AsInteger:=vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
       dataset.FieldByName('XMOTIVO_EVENTO').AsString:=vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
       dataset.FieldByName('NPROT_EVENTO').AsString:=vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
       dataset.FieldByName('DH_EVENTO').AsDateTime:=vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
       if vcodevento = TpEventoToStr(teCancelamento) then
        dataset.FieldByName('SITUACAO_EVENTO').AsString:='Cancelado'
       else
        dataset.FieldByName('SITUACAO_EVENTO').AsString:='Encerrado';
       dataset.FieldByName('EVE_XML_MDFE').AsString := vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML;
       result:=true;
      end
      else
      begin
        Result := False;
        dataset.FieldByName('CSTAT_EVENTO').AsInteger:=vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
        dataset.FieldByName('XMOTIVO_EVENTO').AsString:=vAcbrMDFE.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
      end;
    end;
  end;
  vretorno:=dataset.FieldByName('CSTAT_EVENTO').AsInteger;
  post;
  Apply;
  CommitaTransacao;
  //
//  vseqevento:=inttostr(dataset.FieldByName('NSEQEVENTO').AsInteger);
  if (vretorno = 135) then
  //or (vretorno = 573) or (vretorno = 155) then
  begin
    try

     vteste:=vAcbrMDFE.Configuracoes.Arquivos.PathSalvar+dataSet.FieldByName('CHAVE_MDFE').asstring+vcodevento+vseqevento+
     '-procEventoMDFe.xml';
     if (not FileExists(vteste)) and (Length(vseqevento) = 1) then
     begin
       vseqevento := StrZero(vseqevento,2);
       vteste:=vAcbrMDFE.Configuracoes.Arquivos.PathSalvar+dataSet.FieldByName('CHAVE_MDFE').asstring+vcodevento+vseqevento+
       '-procEventoMDFe.xml';
     end;
     if (not FileExists(vteste)) then
     begin
       vseqevento := StrZero(vseqevento,2);
       vteste:=vAcbrMDFE.Configuracoes.Arquivos.PathSalvar+vcodevento+dataSet.FieldByName('CHAVE_MDFE').asstring+vseqevento+
       '-procEventoMDFe.xml';
     end;

     vteste1:=vAcbrMDFE.Configuracoes.Arquivos.PathSalvar + 'Autorizado\'+vcodevento+dataSet.FieldByName('CHAVE_MDFE').asstring+vseqevento+
     '-procEventoMDFe.xml';

     if not dataset.FieldByName('EVE_XML_MDFE').AsString.IsEmpty() then
     begin
       var fFile := TStringList.Create();
       try
         fFile.Text := dataset.FieldByName('EVE_XML_MDFE').AsString;
         fFile.SaveToFile(vteste1);
       finally
         fFile.Free();
       end;
     end
     else
     begin
       if not FileExists(vteste) then
         raise exception.create('Arquivo XML não encontrado'+#13+vteste);

       if CopyFile(PWideChar(vteste),
        PWideChar(vteste1), true) then
        DeleteFile(PWideChar(vteste));
     end;

    except
      on e: exception do
      begin
       if application.messagebox('Erro ao copiar arquivo de evento para pasta Autorizado. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
        Result := False;
      end;
    end;
  end;
 except
  on e: exception do
  begin
   RollBackTransacao;
   if application.messagebox('Erro ao gravar retorno do MDF-e. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
    Result := False;
  end;
 end;
end;

function TClassMDFe.ImprimirEventoMDFE(vnmdfe: integer): boolean;
var
 varq,varqev: string;
begin
   Result := False;
   buscaMDFE(vnmdfe,0);
   if not dataSet.IsEmpty then
   begin
     ACBrMDFe1.Manifestos.Clear;

     if not dataSet.FieldByName('xml_mdfe').AsString.IsEmpty() then
       ACBrMDFe1.Manifestos.LoadFromString(dataSet.FieldByName('xml_mdfe').AsString)

     else
     begin
       varq:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
         'Autorizado\'+dataSet.FieldByName('CHAVE_MDFE').AsString+'-mdfe.xml';

       if not FileExists(varq) then
       begin
         Application.MessageBox(PWideChar('XML do MDFE Não encontrado para impressão'),PWideChar('Error'), MB_OK);
         Result := False;
       end;
     end;

     ACBrMDFe1.EventoMDFe.Evento.Clear;

     if not dataSet.FieldByName('EVE_XML_MDFE').AsString.IsEmpty() then
       ACBrMDFe1.EventoMDFe.LerXMLFromString(dataSet.FieldByName('EVE_XML_MDFE').AsString)

     else
     begin
       if dataSet.FieldByName('TIPO_EVENTO').AsString = 'CAN' then
       begin
         varqev:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
        'Autorizado\'+dataSet.FieldByName('CHAVE_MDFE').AsString+TpEventoToStr(teCancelamento)+'1-procEventoMDFe.xml';
        if not FileExists(varqev) then
          varqev:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
            'Autorizado\'+dataSet.FieldByName('CHAVE_MDFE').AsString+TpEventoToStr(teCancelamento)+'01-procEventoMDFe.xml';
        if not FileExists(varqev) then
          varqev:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
            'Autorizado\'+TpEventoToStr(teCancelamento)+dataSet.FieldByName('CHAVE_MDFE').AsString+'01-procEventoMDFe.xml';
       end
       else
       begin
         varqev:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
        'Autorizado\'+dataSet.FieldByName('CHAVE_MDFE').AsString+TpEventoToStr(teEncerramento)+'1-procEventoMDFe.xml';
         if not FileExists(varqev) then
           varqev:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
             'Autorizado\'+dataSet.FieldByName('CHAVE_MDFE').AsString+TpEventoToStr(teEncerramento)+'01-procEventoMDFe.xml';
         if not FileExists(varqev) then
           varqev:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
             'Autorizado\'+TpEventoToStr(teEncerramento)+dataSet.FieldByName('CHAVE_MDFE').AsString+'01-procEventoMDFe.xml';
       end;

       if not FileExists(varqev) then
       begin
         Application.MessageBox(PWideChar('XML do EVENTO MDFE Não encontrado para impressão'),PWideChar('Error'), MB_OK);
         Result := False;
       end;

       ACBrMDFe1.EventoMDFe.LerXML(varqev);
     end;

     ACBrMDFe1.ImprimirEvento;
     result:=true;

   end
   else
   begin
    Application.MessageBox(PWideChar('MDFe Não encontrado para impressão'),PWideChar('Error'), MB_OK);
    Result := False;
   end;
end;

function TClassMDFe.ImprimirMDFE(vchaveMDFE: string): boolean;
var
 varq: string;
begin
   Result := False;
   ACBrMDFe1.Manifestos.Clear;

   if (dataSet.FieldByName('CHAVE_MDFE').AsString = vchaveMDFE) and
     not dataSet.FieldByName('XML_MDFE').AsString.IsEmpty()
   then
   begin
     ACBrMDFe1.Manifestos.LoadFromString(dataSet.FieldByName('XML_MDFE').AsString);

     if (ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.nProt = '') then
       ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.tpEmis:=teContingencia;

     ACBrMDFe1.Manifestos.Imprimir;

     Exit();
   end;

   varq:=ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
   'Autorizado\'+vchaveMDFE+'-mdfe.xml';
   if FileExists(varq) then
   begin
     ACBrMDFe1.Manifestos.LoadFromFile(varq);
     ACBrMDFe1.Manifestos.Imprimir;
     result:=true;
   end
   else
   begin
     if FileExists(ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
     ''+vchaveMDFE+'-mdfe.xml') then
     begin
      ACBrMDFe1.Manifestos.LoadFromFile(ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+
     ''+vchaveMDFE+'-mdfe.xml');
     if (ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.nProt = '') then
       ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.tpEmis:=teContingencia;
      ACBrMDFe1.Manifestos.Imprimir;
      result:=true;
     end
     else
     begin
       Application.MessageBox(PWideChar('XML do MDFE Não encontrado para impressão'),PWideChar('Error'), MB_OK);
       Result := False;
     end;
   end;
end;

function TClassMDFe.IniciaMDFE: boolean;
var
  libNFSe: Integer;
begin
  if DAMDFE = nil then
    DAMDFE:=TACBrMDFeDAMDFeRL.Create(nil);

  if ACBrMDFe1 = nil then
  begin
    ACBrMDFe1 := TACBrMDFe.Create(nil);

    THelperDFe.Configure(ACBrMDFe1, EnumDfeType.enMDFe, cadempresa, True);

    {
    libNFSe := IniConf.ReadInt('Sistema', 'libNFe', -1);
    libNFSe := IfThen( TSSLLib(libNFSe) in [TSSLLib.libOpenSSL, TSSLLib.libCapicom, TSSLLib.libWinCrypt] , libNFSe, Integer(libWinCrypt));

    if TSSLLib(libNFSe) <> libOpenSSL then
      ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := CadEmpresa.fstr('NFE_NUMSERIE_CERT');
    ACBrNFSe1.Configuracoes.Certificados.ArquivoPFX  := CadEmpresa.fstr('NFE_CAMINHO_CERT');
    ACBrNFSe1.Configuracoes.Certificados.Senha       := AnsiString(CadEmpresa.fstr('NFE_SENHA__CERT'));

    try
      ACBrNFSe1.SSL.DescarregarCertificado;
      ACBrNFSe1.Configuracoes.Geral.SSLLib := libWinCrypt;

      if ((ACBrNFSe1.SSL.CertDataVenc - date) <= CadEmpresa.fint('DIAS_AVISO')) then
        ShowAtencao('Certificado selecionado vence em: ' + DateToStr(ACBrNFSe1.SSL.CertDataVenc));

    except
      try
        ACBrNFSe1.SSL.DescarregarCertificado;
        ACBrNFSe1.Configuracoes.Geral.SSLLib := libCapicom;

        if ((ACBrNFSe1.SSL.CertDataVenc - date) <= CadEmpresa.fint('DIAS_AVISO')) then
          ShowAtencao('Certificado selecionado vence em: ' + DateToStr(ACBrNFSe1.SSL.CertDataVenc));
      except
      end;
    end;

    ACBrNFSe1.SSL.DescarregarCertificado;
    ACBrNFSe1.Configuracoes.Geral.SSLLib        := TSSLLib(libNFSe);
    if IniConf.ReadInt('SSLib', 'SSLCryptLib', -1) >= 0 then
      ACBrNFSe1.Configuracoes.Geral.SSLCryptLib   := TSSLCryptLib(IniConf.ReadInt('SSLib', 'SSLCryptLib'));
    if IniConf.ReadInt('SSLib', 'SSLHttpLib', -1) >= 0 then
      ACBrNFSe1.Configuracoes.Geral.SSLHttpLib    := TSSLHttpLib(IniConf.ReadInt('SSLib', 'SSLHttpLib'));
    if IniConf.ReadInt('SSLib', 'SSLXmlSignLib', -1) >= 0 then
      ACBrNFSe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(IniConf.ReadInt('SSLib', 'SSLXmlSignLib'));
    if IniConf.ReadInt('SSLib', 'SSLType', -1) >= 0 then
      ACBrNFSe1.SSL.SSLType := TSSLType(IniConf.ReadInt('SSLib', 'SSLType'));

    {
    ACBrMDFe1.Configuracoes.Geral.SSLLib := TSSLLib(IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 0, Integer(libCapicom)) +
                                                   IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 1, Integer(libOpenSSL)) +
                                                   IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 2, Integer(libWinCrypt)));//libCapicom;// libCapicomDelphiSoap;
    }

    // colocar isso na unit UfuncoesDLL que chamará os métodos desta classe...
    ACBrMDFe1.DAMDFe:=DAMDFE;
  end;

 DAMDFE.PathPDF:=cadempresa.dataSet.FieldByName('NFE_ENDERECOPDF').AsString+'\MDFE';
 DAMDFE.Logo:=StringReplace(cadempresa.dataSet.FieldByName('NFE_LOGOMARCA').AsString,'.BMP','.JPG',[rfIgnoreCase,rfReplaceAll]);
 DAMDFE.Sistema:=cadempresa.vSISTEMA;
 if cadempresa.dataSet.FieldByName('TIPOMDFE').AsString <> 'NORMAL' then
   ACBrMDFe1.Configuracoes.Geral.FormaEmissao:=teContingencia
 else
  ACBrMDFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
  ACBrMDFe1.Configuracoes.Geral.Salvar:=true;
  if cadempresa.dataSet.FieldByName('NFE_TMPRETORNOMIL').AsString <> '' then
   ACBrMDFe1.Configuracoes.WebServices.AguardarConsultaRet:=
   StrToInt(cadempresa.dataSet.FieldByName('NFE_TMPRETORNOMIL').AsString);
  ACBrMDFe1.Configuracoes.Arquivos.PathSalvar:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\MDFE';
  vcaminho := ACBrMDFe1.Configuracoes.Arquivos.PathSalvar;
  ACBrMDFe1.Configuracoes.WebServices.UF:=cadempresa.dataSet.FieldByName('WEBSERV_UF').AsString;//<uf>
  if cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
   ACBrMDFe1.Configuracoes.WebServices.Ambiente := tahomologacao;
  if cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Produção' then
   ACBrMDFe1.Configuracoes.WebServices.Ambiente := taproducao;
  if cadempresa.dataSet.FieldByName('WEBSERV_VISUALIZAR').AsString = 'SIM' then
   ACBrMDFe1.Configuracoes.WebServices.Visualizar := TRUE
  else
   ACBrMDFe1.Configuracoes.WebServices.Visualizar := FALSE;
  ACBrMDFe1.Configuracoes.Arquivos.SepararPorMes      := FALSE;
  ACBrMDFe1.Configuracoes.Geral.VersaoDF := TVersaoMDFe.ve300;
  (*
 {$IFNDEF ACBrNFeCAPICOM}
  ACBrMDFe1.Configuracoes.Certificados.NumeroSerie:= CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString;
  ACBrMDFe1.Configuracoes.Certificados.Senha := CadEmpresa.dataset.fieldbyname('NFE_SENHA__CERT').AsString;
 {$ELSE}
{   if vescolhacert = 'S' then
   begin
    ACBrNFe1.Configuracoes.Certificados.NumeroSerie := ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;
    Result:=PWideChar(ACBrNFe1.Configuracoes.Certificados.NumeroSerie);
   end
   else
   begin}
   if CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString = '' then
   begin
      Application.MessageBox('Informe o número de série do certificado', 'Atenção', MB_ICONWARNING + MB_OK);
      ACBrMDFe1.Configuracoes.Certificados.NumeroSerie := ACBrMDFe1.SSL.SelecionarCertificado;
   end
   else
    ACBrMDFe1.Configuracoes.Certificados.NumeroSerie :=
    CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString;
   //end;

   if ACBrMDFe1.Configuracoes.Certificados.NumeroSerie <> '' then
   begin
     if ((ACBrMDFe1.SSL.CertDataVenc-date) <=
        CadEmpresa.dataset.fieldbyname('DIAS_AVISO').asinteger) then
         Application.MessageBox(PWideChar('Certificado selecionado vence em: '+
         datetostr(ACBrMDFe1.SSL.CertDataVenc)), 'Atenção', MB_ICONWARNING + MB_OK);
   end;

  {$ENDIF}
  *)

//  ACBrMDFe1.Configuracoes.Certificados.ArquivoPFX := CadEmpresa.dataset.fieldbyname('NFE_CAMINHO_CERT').AsString;
//  ACBrMDFe1.Configuracoes.Certificados.Senha := CadEmpresa.dataset.fieldbyname('NFE_SENHA__CERT').AsString;
//
//  if ACBrMDFe1.Configuracoes.Geral.SSLLib <> libOpenSSL then
//  begin
//    ACBrMDFe1.Configuracoes.Certificados.NumeroSerie := CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString;
//
//    if ACBrMDFe1.Configuracoes.Certificados.NumeroSerie <> '' then
//    begin
//      if ((ACBrMDFe1.SSL.CertDataVenc-date) <=
//        CadEmpresa.dataset.fieldbyname('DIAS_AVISO').asinteger) then
//          ShowWarning('Certificado selecionado vence em: '+ datetostr(ACBrMDFe1.SSL.CertDataVenc));
//    end;
//  end;

   if not DirectoryExists(ACBrMDFe1.Configuracoes.Arquivos.PathSalvar) then
     CreateDir(ACBrMDFe1.Configuracoes.Arquivos.PathSalvar);
   if not DirectoryExists(ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+'Autorizado') then
     CreateDir(ACBrMDFe1.Configuracoes.Arquivos.PathSalvar+'Autorizado');
end;



function TClassMDFe.verificadestemail(vtp: integer; vdadosnf: string): boolean;
begin
    Result := False;
    para:='';
{    if vtp = 4 then
    begin
      buscas.SQL.Clear;
      buscas.sql.text:='SELECT C.EMAIL_CONT FROM EMPRESA E,CONTADOR C WHERE '+
      'E.COD_CONTADOR = C.COD_CONTADOR AND C.ATIVO = 1';
      buscas.Open;
      if not buscas.IsEmpty then
       para:=buscas.FieldByName('EMAIL_CONT').asstring
      else
       para:='';
      buscas.close;
    end;}
//    if para = ''  then
//     Application.MessageBox(PWideChar('Cliente não tem o email cadastrado'),PWideChar('Error'), MB_OK);
    if InputQuery(vdadosnf, 'Email de destino', Para) then
    begin
      if para = '' then
      begin
       Application.MessageBox(PWideChar('Email de destino precisa ser preenchida'),PWideChar('Error'), MB_OK);
       Result := False;
      end
      else
      begin
       cadclfor.vemail:=para;
       Result := True;
      end;
    end;
end;

function TClassMDFe.verificaMDFepend: boolean;
var
 vdtmin: Tdate;
begin
 Result := True;
 if cadempresa.vqtdenfpend <> '' then
 begin
   if cadempresa.vqtdenfpend <> '0' then
   begin
     buscas.Close;
     buscas.sql.text:='select count(*) as valor from MDFE where modelo = ''58'' and '+
     '((SITUACAO_MDFE <> ''Cancelada'' and SITUACAO_MDFE <> ''Inutilizada'' and SITUACAO_MDFE <> ''Autorizada'' and SITUACAO_MDFE = ''Em Processamento'') '+
     'or SITUACAO_MDFE is null) and cod_empresa = '+inttostr(cadempresa.codempresa)+' and ativo = 1 ';
     buscas.open;
     if buscas.FieldByName('valor').AsInteger > StrToInt(cadempresa.vqtdenfpend) then
     begin
       Application.MessageBox(PWideChar('Qtde de MDFe(s) Pendente(s) acima do limite permitido na '+#13+
       'configuração, Verifique o(s) MDFe(s) no Formulário de consulta de MDFe opção ''não autorizados'''),PWideChar('Error'), MB_OK);
       Result := False;
       buscas.close;
       exit;
     end;
   end;
 end;
 if cadempresa.vqtdependemdias <> '' then
 begin
   if cadempresa.vqtdependemdias <> '0' then
   begin
     buscas.Close;
     buscas.sql.text:='select min(DHEMI) as dataemissao from MDFE where modelo_nf = ''58'' and '+
     '((SITUACAO_MDFE <> ''Cancelada'' and SITUACAO_MDFE <> ''Inutilizada'' and SITUACAO_MDFE <> ''Autorizada'' and SITUACAO_MDFE = ''Em Processamento'') '+
     'or SITUACAO_MDFE is null) and cod_empresa = '+inttostr(cadempresa.codempresa)+' and ativo = 1 ';
     buscas.open;
     if not buscas.IsEmpty then
     begin
       vdtmin:=buscas.FieldByName('dataemissao').AsDateTime;
       if (getDataBanco(buscas,cadempresa.vusdataserv)-vdtmin) >
       StrToInt(cadempresa.vqtdependemdias) then
       begin
         Application.MessageBox(PWideChar('Existem MDFe(s) pendentes com data emissao acima de '+#13+
         cadempresa.vqtdependemdias+' dias definidos na configuração, '+
         'Verifique o(s) MDFe(s) no Formulário de consulta de MDFe opção ''não autorizados'''),PWideChar('Error'), MB_OK);
         Result := False;
         buscas.close;
         exit;
       end;
     end;
   end;
 end;
end;

function TClassMDFe.verificarStatusWeb(verresultado: PWideChar): string;
var
  voriginal: TpcnTipoEmissao;
  atvis: Boolean;
  vrespservico: boolean;
begin
  voriginal:=ACBrMDFe1.Configuracoes.Geral.FormaEmissao;
  ACBrMDFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
  try
    if IniConf.ReadStr('MDFe', 'StatusServico', '') = 'N' then
      Exit('OK');

    if verresultado = 'S' then
    begin
      atvis:=ACBrMDFe1.Configuracoes.WebServices.Visualizar;
      ACBrMDFe1.Configuracoes.WebServices.Visualizar:=true;
    end;

    vrespservico:=ACBrMDFe1.WebServices.StatusServico.Executar;

    if verresultado = 'S' then
    begin
      ACBrMDFe1.Configuracoes.WebServices.Visualizar:=atvis;
    end;

  except
  on e: exception do
    begin
      Application.MessageBox(PWideChar('7964 ' + E.Message),PWideChar('Error'), MB_OK);
      result:='ERRO';
    end;
  end;
  ACBrMDFe1.Configuracoes.Geral.FormaEmissao:=voriginal;

  IF not vrespservico then
  begin
    Application.MessageBox(PWideChar(inttostr(ACBrMDFe1.WebServices.Retorno.cStat)+' '+ACBrMDFe1.WebServices.Retorno.xMotivo+' Mensagem Fisco: '+
    ACBrMDFe1.WebServices.Retorno.xMsg),PWideChar('Error'), MB_OK);
    result:='ERRO';
  end
  else
  begin
    result:='OK';
  end;
end;
(*
{ TClasstribcid }

procedure TClasstribcid.copiarschemas(tpAmb: string);
var
  vListaArquivos: TStrings;
  I: Integer;
begin
  if fPathSh = '' then
    Exit;

  vListaArquivos := TStringList.Create;

  localizarArquivos(fPathSh, '*.xsd', vListaArquivos);

  fPathSis := ExtractFilePath(Application.ExeName) + 'schemasNFSe\';

  for I := 0 to vListaArquivos.Count - 1 do
    //if UpperCase(MD5Print(MD5File(vListaArquivos[i]))) <> UpperCase(MD5Print(MD5File(fPathSis + ExtractFileName(vListaArquivos[i]))))   then
    if UpperCase(getMd5File(vListaArquivos[i])) <> UpperCase(getMd5File(fPathSis + ExtractFileName(vListaArquivos[i]))) then
      CopyFile(PWideChar(vListaArquivos[i]), PWideChar( fPathSis + ExtractFileName(vListaArquivos[i])), False);
end;

constructor TClasstribcid.create;
begin

end;

destructor TClasstribcid.destroy;
begin

  inherited;
end;


function TClasstribcid.getMd5File(AFileName: string): string;
var
  IdMD5: TIdHashMessageDigest5;
  FS: TFileStream;
begin
  if not FileExists(AFileName) then
    Exit('');
  IdMD5 := nil;
  FS := nil;
  try
    IdMD5 := TIdHashMessageDigest5.Create;
    FS := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
    Result := IdMD5.HashStreamAsHex(FS);
  finally
    FS.Free;
    IdMD5.Free;
  end;
end;

function TClasstribcid.GetPathSchemas: string;
begin
  Result := IniConf.ReadStr(Format('NFSe_%s', [Self.ibgeId]), 'PathSchemas').Trim();
end;

procedure TClasstribcid.HandleValuesBeforePrint(var nfse:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;
  nfs: TClassNfe);
begin

end;

procedure TClasstribcid.localizarArquivos(pPath, pFilter: string; pLista: TStrings);
var
   Rec  : TSearchRec;
   Path : string;
begin
  Path := IncludeTrailingBackslash(pPath);
  if FindFirst(Path + pFilter, faAnyFile - faDirectory, Rec) = 0 then
   try
     repeat
       pLista.Add(Path + Rec.Name);
     until FindNext(Rec) <> 0;
   finally
     SysUtils.FindClose(Rec);
   end;

// recursivo   
//  if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
//   try
//     repeat
//      if ((Rec.Attr and faDirectory) <> 0)  and (Rec.Name<>'.') and (Rec.Name<>'..') then
//       localizarArquivos(Path + Rec.Name, pFilter, pLista);
//     until FindNext(Rec) <> 0;
//   finally
//     SysUtils.FindClose(Rec);
//   end;
end;

function TClasstribcid.montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;
  vnotanfs: TClassNfe): boolean;
var
 vobsos: AnsiString;
 vden: String;
 vunidades: string;
 vquantserv, vlTmpValorISS: currency;
  vRoundMode: TFPURoundingMode;
begin
  //igual a de TO
  vacbrnfse1.NotasFiscais.Clear;
  with vacbrnfse1 do
  begin
    NotasFiscais.NumeroLote:='1';
    NotasFiscais.Transacao := True;

    {$IFDEF USE_NFSEX}
    with NotasFiscais.New.NFSe do
    {$ELSE}
    with NotasFiscais.Add.NFSe do
    {$ENDIF}
    begin
      IdentificacaoRps.Numero := FormatFloat('#########0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger);
      IdentificacaoRps.Serie := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring;
      IdentificacaoRps.Tipo := trRPS;

      DataEmissao := Now;
      Competencia := DataEmissao;
      NaturezaOperacao := no1;//noTributacaoNoMunicipio;
      RegimeEspecialTributacao := vacbrnfse1.Provider.
      StrToRegimeEspecialTributacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
      OptanteSimplesNacional := vacbrnfse1.Provider.
      StrToSimNao(Ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));
      IncentivadorCultural := vacbrnfse1.Provider.
      StrToSimNao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));
      if (vacbrnfse1.Configuracoes.WebServices.Ambiente = taProducao) then
       Producao := snSim
      else
       Producao :=snNao;
      StatusRps := srNormal;
      OutrasInformacoes := 'Pagamento a Vista';
      Servico.Valores.ValorServicos          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

      Servico.Valores.ValorServicos := StrToFloatDef(  FormatFloat('0.00', Servico.Valores.ValorServicos), Servico.Valores.ValorServicos);
      vlTmpValorISS := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;

      try

      vRoundMode := GetRoundMode;
      SetRoundMode(rmUp);

      servico.Valores.ValorIss               := SimpleRoundTo(vlTmpValorISS, -2);
      servico.valores.Aliquota               :=(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat;

      finally
       SetRoundMode(vRoundMode);
      end;
      Servico.Valores.ValorDeducoes          := 0.00;
      Servico.Valores.ValorPis               := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency;
      Servico.Valores.ValorCofins            := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency;
      Servico.Valores.ValorInss              := 0.00;
      Servico.Valores.ValorIr                := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency;
      Servico.Valores.ValorCsll              := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

      Servico.Valores.IssRetido:=
      vacbrnfse1.Provider.
      StrToSituacaoTributaria(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
      if Servico.Valores.IssRetido = stRetencao then
       Servico.Valores.ValorIssRetido:=(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency
      else
       Servico.Valores.ValorIssRetido:= 0.00;

      Servico.Valores.OutrasRetencoes        := 0.00;
      Servico.Valores.DescontoIncondicionado := 0.00;
      Servico.Valores.DescontoCondicionado   := 0.00;
      Servico.ItemListaServico         := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString;
      servico.CodigoCnae               := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7);

      Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString;
      vobsos:='';

      vRemoverEnterOBS_OS := False;
      try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
      except
       vRemoverEnterOBS_OS := False;
      end;

      (vnotanfs as TClassNfSe).buscaadc.close;
      (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
      ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
      ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
      (vnotanfs as TClassNfSe).buscaadc.open;
      while not (vnotanfs as TClassNfSe).buscaadc.eof do
      begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
      (vnotanfs as TClassNfSe).buscaadc.next;
      end;
      if vRemoverEnterOBS_OS then
      begin
       vobsos:=Trim(StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]));
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos), 1) = ',' then
         System.Delete(vobsos, Length(vobsos), 1);
      end;
      (vnotanfs as TClassNfSe).buscaadc.close;
      (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
      ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
      (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
      (vnotanfs as TClassNfSe).buscaadc.open;
      vobsos:=StringReplace(vobsos, #13#10, ';', [rfReplaceAll]);
      vden:='';
      vunidades:='';
      while not (vnotanfs as TClassNfSe).buscaadc.eof do
      begin
       vquantserv:=(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
       if vquantserv = 0 then
         vquantserv:=1;
       vunidades:=format('%n',[vquantserv])+' X '+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/vquantserv])+
       '=';
       vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
       vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
       vden:=vden+'(O.S.: '+(vnotanfs as TClassNfSe).StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
       if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
        vden:=vden+',';
       (vnotanfs as TClassNfSe).buscaadc.next;
      end;
      vden:=vden+';';
      vden:=vden+'----------------;';
      vden:=vden+vobsos;
      vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      if Pos('Fonte: IBPT', vden) = 0 then
      begin
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + QuotedStr(Servico.ItemListaServico);
       (vnotanfs as TClassNfSe).buscaadc.Open;
       if (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat > 0 then
       begin
         if vRemoverEnterOBS_OS then
           vden := vden + ','
         else
           vden := vden + ';';
         vden := vden + 'Val Aprox Tributos R$' + Format('%0.2n', [Servico.Valores.ValorServicos *
           (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
           ' (' + Format('%0.2f', [(vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat]) +
           '%) Fonte: IBPT';
       end;
      end;

      (vnotanfs as TClassNfSe).vden:=vden;
      Servico.Discriminacao             := vden;
      Servico.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);
      Servico.ExigibilidadeISS := exiExigivel;
      Servico.MunicipioIncidencia := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;
      {$IFDEF USE_NFSEX}
      Prestador.IdentificacaoPrestador.Cnpj               := vnotanfs.cadempresa.fstrNotEsp('CGC_EMP');
      Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
      Prestador.Endereco.CodigoMunicipio                  := vnotanfs.strzero(vnotanfs.cadempresa.fint('IBGE_COD_CIDADE'), 7);
      Prestador.RazaoSocial                               := StringReplace(vnotanfs.cadempresa.fstrNotEsp('NOME_EMP'), '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      {$ELSE}
      Prestador.Cnpj               := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
      Prestador.InscricaoMunicipal := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IM_EMP').AsString;
      PrestadorServico.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);
      PrestadorServico.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NOME_EMP').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      {$ENDIF}

      Tomador.IdentificacaoTomador.CpfCnpj            := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString;
      if trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString) <> '' then
      Tomador.IdentificacaoTomador.InscricaoMunicipal := trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);

      Tomador.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

      Tomador.Endereco.Endereco        := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Numero          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Complemento     := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Bairro          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString;
      Tomador.Endereco.UF              := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString;
      Tomador.Endereco.CEP             := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString;
      Tomador.Endereco.xPais           := 'BRASIL';
      Tomador.Contato.Telefone := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString;
      Tomador.Contato.Email    := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

      if (vacbrnfse1.Configuracoes.Geral.Provedor = proBHISS)
       then // de acordo consulta da LUZ BH com a Prefeitura de Belo Horizonte o correto de uma aliquota de 5% é 0.05 conforme manual da prefeitura
       if (not TNFSeW_BHISS.Create(TACBrNFSeXProviderManager.GetProvider(vacbrnfse1)).DivAliq100) then
         raise Exception.Create('Provedor BHISS exige aliquota no formato divido por 100. Atualmente não está configurado. Contacte a HW Sistemas para correção');
    end;
  end;
end;

{ TClasstribcidGV }

procedure TClasstribcidGV.copiarschemas(tpAmb: string);
var
  vListaArquivos: TStrings;
  vPathSh, vPathSis : string;
  I: Integer;
begin
  if Copy(tpAmb, 1, 1) = 'H' then
    vPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Actcon\valadares\hom'
  else if Copy(tpAmb, 1, 1) = 'P' then
    vPathSis := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Actcon\valadares\pro';

  inherited;
end;

constructor TClasstribcidGV.create;
begin

  inherited;
end;

destructor TClasstribcidGV.destroy;
begin

  inherited;
end;



function TClasstribcidGV.sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps;
var
  vden: string;
  AValor: Double;
  Aemails: TStrings;
begin
  Result := tcDescricaoRps.Create;

  with Result do
  begin
    ccm                 := Anfs.cadempresa.dataSet.FieldByName('IM_EMP').AsString.
                             Replace('.', '', [rfReplaceAll]).
                             Replace('-', '', [rfReplaceAll]);
    cnpj                := Anfs.cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
    senha               := Anfs.decodifica(Anfs.cadempresa.dataSet.FieldByName('LICENCANFSE').AsString);

    Anfs.SqlOpen('select contador.crc, estados.sigla_uf from contador' +
                 ' left join estados on estados.codigo_uf = contador.codigo_uf' +
                 ' where contador.cod_contador = ' + Anfs.cadempresa.dataSet.FieldByName('cod_contador').AsInteger.ToString +
                 ' and contador.cod_empresa = ' + Anfs.cadempresa.codempresa.ToString);

    crc              := Anfs.apenasNumeros(Anfs.buscas.FieldByName('crc').AsString.Trim);//, 0);
    crc_estado       := Anfs.buscas.FieldByName('sigla_uf').AsString.Trim;

    aliquota_simples    := IfThen(Anfs.cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger <> 1,
                                  '', Format('%0.2f', [Anfs.buscasmnt.FieldByName('ALIQ_ISS').AsFloat]));

    id_sis_legado       := Anfs.buscasmnt.FieldByName('COD_RPS').AsInteger.ToString;
    servico             := StrToIntDef(Anfs.buscasmnt.FieldByName('nfs_servico').AsString.Replace('.', '', [rfReplaceAll]), 0);
    situacao            := IfThen(Anfs.buscasmnt.FieldByName('ISS_RETIDO').AsInteger = 1, 'tt', 'tp');
    AValor              := Anfs.BuscasMnt.FieldByName('VALOR').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;
    valor               := Format('%0.2f', [AValor]);
    base                := valor;
    descricaoNF         := Anfs.getDiscriminacaoServicos(StrToInt(id_sis_legado), Anfs.buscasmnt.FieldByName('nfs_servico').AsString, AValor);
    tomador_tipo        := IfThen( Length(Anfs.buscasmnt.FieldByName('cpfcgc').AsString.Trim) = 11, 2) +
                           IfThen( Length(Anfs.buscasmnt.FieldByName('cpfcgc').AsString.Trim) = 14,
                                   IfThen( Anfs.cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsInteger = Anfs.buscasmnt.FieldByName('ibge_cod_cidade').AsInteger,
                                           3, 4)
                                 );
    Aemails             := Anfs.GetListaEmails(Anfs.buscasmnt.FieldByName('email').AsString.Trim);
    if Assigned(Aemails) then
      if Aemails.Count > 0 then
        tomador_email   := Aemails[0];

    tomador_cnpj        := Anfs.buscasmnt.FieldByName('cpfcgc').AsString.Trim;
    tomador_ie          := Anfs.buscasmnt.FieldByName('insc_est').AsString.Trim;
    tomador_im          := Anfs.buscasmnt.FieldByName('insc_municipal').AsString.Trim;
    tomador_razao       := Anfs.buscasmnt.FieldByName('razao').AsString.Trim;
    tomador_fantasia    := Anfs.buscasmnt.FieldByName('nome_cliente').AsString.Trim;
    tomador_endereco    := Anfs.buscasmnt.FieldByName('endereco').AsString.Trim;
    tomador_numero      := Anfs.buscasmnt.FieldByName('num_end_cliente').AsString.Trim;
    tomador_complemento := Anfs.buscasmnt.FieldByName('complemento').AsString.Trim;
    tomador_bairro      := Anfs.buscasmnt.FieldByName('bairro').AsString.Trim;
    tomador_CEP         := Anfs.buscasmnt.FieldByName('cep').AsString.Trim;
    tomador_cod_cidade  := Anfs.buscasmnt.FieldByName('ibge_cod_cidade').AsString.Trim;
    tomador_fone        := Anfs.buscasmnt.FieldByName('fone_cliente').AsString.Trim;
    tomador_ramal       := '';
    tomador_fax         := Anfs.buscasmnt.FieldByName('fax').AsString.Trim;
    //rps_num             := Anfs.buscasmnt.FieldByName('cod_rps').AsInteger;//o webservice não aceita
    rps_serie           := Anfs.cadempresa.dataSet.FieldByName('serie_serv_nfe').AsInteger.ToString;
    rps_dia             := DayOf(Now);
    rps_mes             := MonthOf(Now);
    rps_ano             := YearOf(Now);
    //outro_municipio     :=
    //cod_outro_municipio :=
    retencao_iss        := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('issret_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    pis                 := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('pisrf_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    cofins              := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('cofinsrf_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    inss                := Format('%0.02f', [0.00]).Replace('.', ',', [rfReplaceAll]);
    irrf                := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('irrf_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    csll                := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('csslrf_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    tipo_obra           := IfThen(servico = 702, Anfs.BuscasMnt.FieldByName('tipo_obra_nfse').AsInteger);
    //dia_emissao         :=;
    //mes_emissao         :=;
    //ano_emissao         :=;
  end;
end;

function TClasstribcidGV.montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;vnotanfs: TClassNfe): boolean;
var
 vobsos: AnsiString;
 vden: String;
 vunidades: string;
 vquantserv: currency;
  vRoundMode: TFPURoundingMode;
 vlTmpValorISS: Double;
begin
 vacbrnfse1.NotasFiscais.Clear;
 with vacbrnfse1 do
  begin
   NotasFiscais.NumeroLote:='1';
   NotasFiscais.Transacao := True;
//  for i := 0 to 1 do
  begin

    {$IFDEF USE_NFSEX}
    with NotasFiscais.New.NFSe do
    {$ELSE}
    with NotasFiscais.Add.NFSe do
    {$ENDIF}
    begin
     IdentificacaoRps.Numero := FormatFloat('#########0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger);
//      IdentificacaoRps.Numero := FormatFloat('#########0', i+1);

     // Para o provedor ISS.NET em ambiente de Homologação mudar a série para '8'
     IdentificacaoRps.Serie := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring;

     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     IdentificacaoRps.Tipo := trRPS;

     DataEmissao := Now;

     // TnfseNaturezaOperacao = ( noTributacaoNoMunicipio, noTributacaoForaMunicipio, noIsencao, noImune, noSuspensaDecisaoJudicial, noSuspensaProcedimentoAdministrativo );

     NaturezaOperacao := no1;//noTributacaoNoMunicipio;
//     NaturezaOperacao := noTributacaoNoMunicipio51;

     // TnfseRegimeEspecialTributacao = ( retNenhum, retMicroempresaMunicipal, retEstimativa, retSociedadeProfissionais, retCooperativa, retMicroempresarioIndividual, retMicroempresarioEmpresaPP );
//     RegimeEspecialTributacao := retNenhum;
     RegimeEspecialTributacao := vacbrnfse1.Provider.
     StrToRegimeEspecialTributacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
     //retMicroempresarioEmpresaPP;

     // TnfseSimNao = ( snSim, snNao );
     OptanteSimplesNacional := vacbrnfse1.Provider.
     StrToSimNao(Ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));

     // TnfseSimNao = ( snSim, snNao );
     IncentivadorCultural := vacbrnfse1.Provider.
     StrToSimNao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));

     // TnfseSimNao = ( snSim, snNao );
     // snSim = Ambiente de Produção
     // snNao = Ambiente de Homologação
     if (vacbrnfse1.Configuracoes.WebServices.Ambiente = taProducao) then
       Producao := snSim
     else
       Producao :=snNao;

     // TnfseStatusRPS = ( srNormal, srCancelado );
     StatusRps := srNormal;

     // Somente Os provedores Betha, FISSLex e SimplISS permitem incluir no RPS
     // a TAG: OutrasInformacoes os demais essa TAG é gerada e preenchida pelo
     // WebService do provedor.
     OutrasInformacoes := 'Pagamento a Vista';

     { Usando quando o RPS for substituir outro
     RpsSubstituido.Numero := FormatFloat('#########0', i);
     RpsSubstituido.Serie  := 'UNICA';
     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     RpsSubstituido.Tipo   := trRPS;
     }

     Servico.Valores.ValorServicos          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

     Servico.Valores.ValorServicos := StrToFloatDef(  FormatFloat('0.00', Servico.Valores.ValorServicos), Servico.Valores.ValorServicos);
     vlTmpValorISS := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;

     try

//     vRoundMode := GetRoundMode;
//     SetRoundMode(rmUp);

     servico.Valores.ValorIss               := SimpleRoundTo(vlTmpValorISS, -2);
//     servico.Valores.ValorIss               := StrToFloatDef(  FormatFloat('0.00', vlTmpValorISS), vlTmpValorISS);
//     servico.Valores.ValorIss               := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;
     servico.valores.Aliquota               :=(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat/100;

     finally
//       SetRoundMode(vRoundMode);
     end;
     Servico.Valores.ValorDeducoes          := 0.00;
     Servico.Valores.ValorPis               := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency;
     Servico.Valores.ValorCofins            := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency;
     Servico.Valores.ValorInss              := 0.00;
     Servico.Valores.ValorIr                := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency;
     //0.00;
     Servico.Valores.ValorCsll              := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

     // TnfseSituacaoTributaria = ( stRetencao, stNormal, stSubstituicao );
     // stRetencao = snSim
     // stNormal   = snNao

     // Neste exemplo não temos ISS Retido ( stNormal = Não )
     // Logo o valor do ISS Retido é igual a zero.
     Servico.Valores.IssRetido:= vacbrnfse1.Provider.
     StrToSituacaoTributaria(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
     if Servico.Valores.IssRetido = stRetencao then
       Servico.Valores.ValorIssRetido:=(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency
       //servico.Valores.ValorIss
     else
       Servico.Valores.ValorIssRetido:= 0.00;

     Servico.Valores.OutrasRetencoes        := 0.00;
     Servico.Valores.DescontoIncondicionado := 0.00;
     Servico.Valores.DescontoCondicionado   := 0.00;

//     Servico.Valores.BaseCalculo := Servico.Valores.ValorServicos -
//                                    Servico.Valores.ValorDeducoes -
//                                    Servico.Valores.DescontoIncondicionado;

     // No caso do provedor Ginfes devemos informar a aliquota já dividida por 100
     // para outros provedores devemos informar por exemplo 3, mas ao fazer o calculo
     // do valor do ISS devemos dividir por 100

{    Servico.Valores.Aliquota    := 2;}

     // Valor do ISS calculado multiplicando-se a base de calculo pela aliquota
{    ValorISS := Servico.Valores.BaseCalculo * Servico.Valores.Aliquota;}

     // A função RoundTo5 é usada para arredondar valores, sendo que o segundo
     // parametro se refere ao numero de casas decimais.
     // exemplos: RoundTo5(50.532, -2) ==> 50.53
     // exemplos: RoundTo5(50.535, -2) ==> 50.54
     // exemplos: RoundTo5(50.536, -2) ==> 50.54

{    Servico.Valores.ValorIss       := RoundTo5(ValorISS, -2);

     Servico.Valores.ValorLiquidoNfse := Servico.Valores.ValorServicos -
                                         Servico.Valores.ValorPis -
                                         Servico.Valores.ValorCofins -
                                         Servico.Valores.ValorInss -
                                         Servico.Valores.ValorIr -
                                         Servico.Valores.ValorCsll -
                                         Servico.Valores.OutrasRetencoes -
                                         Servico.Valores.ValorIssRetido -
                                         Servico.Valores.DescontoIncondicionado -
                                         Servico.Valores.DescontoCondicionado;}


     Servico.ItemListaServico         := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString;
     servico.CodigoCnae               := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7);

     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo CNAE tem que ser '6511102'
     // Servico.CodigoCnae                := '123'; // Informação Opcional
     Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString;
     vobsos:='';
                             
     vden := (vnotanfs as TClassNfSe).getDiscriminacaoServicos(StrToInt(IdentificacaoRps.Numero), Servico.ItemListaServico, Servico.Valores.ValorServicos);
     {
     vRemoverEnterOBS_OS := False;
     try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
     except
       vRemoverEnterOBS_OS := False;
     end;

     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
     ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
     (vnotanfs as TClassNfSe).buscaadc.open;
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
      (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     if vRemoverEnterOBS_OS then
     begin
       vobsos:=Trim(StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]));
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos), 1) = ',' then
         System.Delete(vobsos, Length(vobsos), 1);
     end;
     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
     (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
     (vnotanfs as TClassNfSe).buscaadc.open;
     vobsos:=StringReplace(vobsos, #13#10, ';', [rfReplaceAll]);
//       vobsos:=StringReplace(vobsos, #10, '|', [rfReplaceAll]);
       //vden:=RetiraCarEsp(vobsos);
     vden:='';
     //'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
     vunidades:='';
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       vquantserv:=(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
       if vquantserv = 0 then
         vquantserv:=1;
       vunidades:=format('%n',[vquantserv])+' X '+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/vquantserv])+
       '=';
       vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
       vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
//         if pos(',',vospesq) > 0 then
//         begin
       vden:=vden+'(O.S.: '+(vnotanfs as TClassNfSe).StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
       if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
        vden:=vden+',';
//         end;
       (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     vden:=vden+';';
     vden:=vden+'----------------;';
     vden:=vden+vobsos;
     vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     if Pos('Fonte: IBPT', vden) = 0 then
     begin
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + QuotedStr(Servico.ItemListaServico);
       (vnotanfs as TClassNfSe).buscaadc.Open;
       if (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat > 0 then
       begin
         if vRemoverEnterOBS_OS then
           vden := vden + ','
         else
           vden := vden + ';';
         vden := vden + 'Val Aprox Tributos R$' + Format('%0.2n', [Servico.Valores.ValorServicos *
           (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
           ' (' + Format('%0.2f', [(vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat]) +
           '%) Fonte: IBPT';
       end;
     end;
     }

     (vnotanfs as TClassNfSe).vden:=vden;
//     vden:=StringReplace(vden ,';', #13#10, [rfReplaceAll,rfIgnoreCase] );
     Servico.Discriminacao             := vden;


     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo do Municipio tem que ser '999'
     Servico.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);

     // Informar A Exigibilidade ISS para fintelISS [1/2/3/4/5/6/7]
     Servico.ExigibilidadeISS := exiExigivel;

     // Informar para Saatri
{     Servico.CodigoPais := 1058; // Brasil}
     Servico.MunicipioIncidencia := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;

    // Somente o provedor SimplISS permite infomar mais de 1 serviço
//     with Servico.ItemServico.Add do
//      begin
//       Descricao     := 'SERVICO 1';
//       Quantidade    := 1;
//       ValorUnitario := 1.50;
//      end;

      {$IFDEF USE_NFSEX}
      Prestador.IdentificacaoPrestador.Cnpj               := vnotanfs.cadempresa.fstrNotEsp('CGC_EMP');
      Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
      Prestador.Endereco.CodigoMunicipio                  := vnotanfs.strzero(vnotanfs.cadempresa.fint('IBGE_COD_CIDADE'), 7);
      Prestador.RazaoSocial                               := StringReplace(vnotanfs.cadempresa.fstrNotEsp('NOME_EMP'), '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      {$ELSE}
      Prestador.Cnpj               := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
      Prestador.InscricaoMunicipal := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IM_EMP').AsString;
      PrestadorServico.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);
      PrestadorServico.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NOME_EMP').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      {$ENDIF}

     Tomador.IdentificacaoTomador.CpfCnpj            := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString;
     if trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString) <> '' then
     Tomador.IdentificacaoTomador.InscricaoMunicipal := trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);

     Tomador.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

     Tomador.Endereco.Endereco        := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Numero          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Complemento     := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Bairro          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString;
     Tomador.Endereco.UF              := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString;
     Tomador.Endereco.CEP             := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString;
     //edtEmitCEP.Text;
	 //Provedor Equiplano é obrigatório o pais e IE
     Tomador.Endereco.xPais           := 'BRASIL';
//     Tomador.IdentificacaoTomador.InscricaoEstadual := 'ISENTO';

     Tomador.Contato.Telefone := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString;
     Tomador.Contato.Email    := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

     {(*} Usando quando houver um intermediario na prestação do serviço
     IntermediarioServico.RazaoSocial        := 'razao';
     IntermediarioServico.CpfCnpj            := '00000000000';
     IntermediarioServico.InscricaoMunicipal := '12547478';
     }

     { Usando quando o serviço for uma obra
     ConstrucaoCivil.CodigoObra := '88888';
     ConstrucaoCivil.Art        := '433';
     }
    end;

  end;
 end;

end;

function TClasstribcidGV.montartxtrps(vnotanfs: TClassNfe): string;
var
  vobsos: AnsiString;
  vden: String;
  vunidades: string;
begin
   // Governador Valadares ABRASF 2.0
   with vnotanfs do
   begin
       montalinha(0001,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger,15));
       montalinha(0016,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring);
       montalinha(0021,'1');
//       montalinha(0022,FormatDateTime('yyyy-mm-dd"T"hh:nn:ss',buscasmnt.FieldByName('emissao_rps').AsDateTime));
       montalinha(0022,FormatDateTime('yyyy-mm-dd"T"00:00:00',(vnotanfs as TClassNfSe).buscasmnt.FieldByName('emissao_rps').AsDateTime)); // preciso verificar se o padrão será sem data e hora...
       montalinha(0041,'1');
       montalinha(0063,FormatDateTime('yyyy-mm-dd',(vnotanfs as TClassNfSe).buscasmnt.FieldByName('emissao_rps').AsDateTime));
       montalinha(0073,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency,15));
       montalinha(0088,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0103,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0118,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0133,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0148,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency,15));
       montalinha(0163,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0178,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0193,(vnotanfs as TClassNfSe).Tzero(0,15));
//       if BuscasMnt.FieldByName('IBGE_COD_CIDADE').AsString <> cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString then
       if ((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger = 1) and ((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger = 1) then
        montalinha(0208,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency,3)+'00')
       else
        montalinha(0208,(vnotanfs as TClassNfSe).Tzero(0,5));

        //Tzero(0,5));
//       else
//       begin
         // if cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger <> 1 then then
        // Testar aqui se o emitente é optante de simplesnacional e retem o issqn, pois se for deverá
        // o mesmo destacar o issqn
  //       montalinha(0208,Tzero(buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100,3)+'00');
//       end;
       montalinha(0213,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0228,(vnotanfs as TClassNfSe).Tzero(0,15));
//       montalinha(0243,strzero(2,1));
       montalinha(0243,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
       if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger = 1 then
         montalinha(0244,strzero(1,1));// Colocar um teste aqui para quando for retido
       montalinha(0245,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString);
       montalinha(0250,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7));
  //     if cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
  //      montalinha(0295,'4320453')
  //     else
        montalinha(0257,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString);
       //montalinha(0257,cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString);
       vobsos:='';
//       if pos(',',(vnotanfs as TClassNfSe).vospesq) <= 0 then
       begin

         vRemoverEnterOBS_OS := False;
         try
           (vnotanfs as TClassNfSe).buscaadc.close;
           (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
           (vnotanfs as TClassNfSe).buscaadc.open;
           vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
         except
           vRemoverEnterOBS_OS := False;
         end;

         (vnotanfs as TClassNfSe).buscaadc.close;
         (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
         ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
         ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
         (vnotanfs as TClassNfSe).buscaadc.open;
         while not (vnotanfs as TClassNfSe).buscaadc.eof do
         begin
           if vRemoverEnterOBS_OS then
             vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
          else
          vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ||-||';
          (vnotanfs as TClassNfSe).buscaadc.next;
         end;
       end;
       if vRemoverEnterOBS_OS then
       begin
         vobsos:=StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]);
         vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
         if Copy(vobsos, Length(vobsos) - 1 , 1) = ',' then
           System.Delete(vobsos, Length(vobsos) - 1, 1);
       end;
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
       ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
       (vnotanfs as TClassNfSe).buscaadc.open;
       vobsos:=StringReplace(vobsos, #13, '|', [rfReplaceAll]);
       vobsos:=StringReplace(vobsos, #10, '|', [rfReplaceAll]);
       //vden:=RetiraCarEsp(vobsos);
       vden:='';
       vunidades:='';
       //'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
       while not (vnotanfs as TClassNfSe).buscaadc.eof do
       begin
         vunidades:=format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency])+' X '+
         format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency])+
         '=';

         vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
         vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
//         if pos(',',vospesq) > 0 then
//         begin
         vden:=vden+'(O.S.: '+StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
         if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
          vden:=vden+',';
//         end;
         (vnotanfs as TClassNfSe).buscaadc.next;
       end;
       vden:=vden+'||';
       vden:=vden+'----------------||';
       vden:=vden+vobsos;
       (vnotanfs as TClassNfSe).vden:=vden;
       montalinha(0277,copy(vden,1,2000));
  //     if cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
  //      montalinha(2315,'4320453')
  //     else
       montalinha(2277,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7));
       montalinha(2284,strzero(0,4));
       montalinha(2288,strzero(1,1)); // Olhar este campo de exigibilidade...
       montalinha(2289,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7));
       montalinha(2326,(vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('CGC_EMP').AsString);
       montalinha(2340,(vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IM_EMP').AsString);
       if Length(trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString)) <= 11 then
         montalinha(2355,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString)
       else
         montalinha(2366,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString);
       montalinha(2380,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);
       montalinha(2395,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString));
       montalinha(2545,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString));
       montalinha(2670,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString);
       montalinha(2680,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString));
       montalinha(2740,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString));
       montalinha(2800,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString);
       montalinha(2807,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString);
       montalinha(2813,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString);
       montalinha(2821,'0'+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString);
       montalinha(2841,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString);
       montalinha(3141,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
       montalinha(3142,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));
       montalinha(3143,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));
   end;
end;

{ TClasstribcidBH }

procedure TClasstribcidBH.copiarschemas(tpAmb: string);
begin
  fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\BHISS';
  inherited;
end;

constructor TClasstribcidBH.create;
begin

end;

destructor TClasstribcidBH.destroy;
begin

  inherited;
end;

function TClasstribcidBH.sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps;
begin
  raise Exception.Create('Nao disponível para esta cidade');
end;

function TClasstribcidBH.montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;
  vnotanfs: TClassNfe): boolean;
var
 vobsos: AnsiString;
 vden: String;
 vunidades: string;
 vquantserv: currency;
begin
 vacbrnfse1.NotasFiscais.Clear;
 with vacbrnfse1 do
  begin
   NotasFiscais.NumeroLote:='1';
   NotasFiscais.Transacao := True;
//  for i := 0 to 1 do
  begin

    {$IFDEF USE_NFSEX}
    with NotasFiscais.New.NFSe do
    {$ELSE}
    with NotasFiscais.Add.NFSe do
    {$ENDIF}
    begin
     IdentificacaoRps.Numero := FormatFloat('#########0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger);
//      IdentificacaoRps.Numero := FormatFloat('#########0', i+1);

     // Para o provedor ISS.NET em ambiente de Homologação mudar a série para '8'
     IdentificacaoRps.Serie := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring;

     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     IdentificacaoRps.Tipo := trRPS;

     DataEmissao := Now;

     // TnfseNaturezaOperacao = ( noTributacaoNoMunicipio, noTributacaoForaMunicipio, noIsencao, noImune, noSuspensaDecisaoJudicial, noSuspensaProcedimentoAdministrativo );

     NaturezaOperacao :=StrToNaturezaOperacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_natop').AsInteger,1));
//     noTributacaoNoMunicipio;
//     NaturezaOperacao := noTributacaoNoMunicipio51;

     // TnfseRegimeEspecialTributacao = ( retNenhum, retMicroempresaMunicipal, retEstimativa, retSociedadeProfissionais, retCooperativa, retMicroempresarioIndividual, retMicroempresarioEmpresaPP );
//     RegimeEspecialTributacao := retNenhum;
     RegimeEspecialTributacao := vacbrnfse1.Provider.
     StrToRegimeEspecialTributacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
     //retMicroempresarioEmpresaPP;

     // TnfseSimNao = ( snSim, snNao );
     OptanteSimplesNacional := vacbrnfse1.Provider.
     StrToSimNao(Ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));

     // TnfseSimNao = ( snSim, snNao );
     IncentivadorCultural := vacbrnfse1.Provider.
     StrToSimNao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));

     // TnfseSimNao = ( snSim, snNao );
     // snSim = Ambiente de Produção
     // snNao = Ambiente de Homologação
     if (vacbrnfse1.Configuracoes.WebServices.Ambiente = taProducao) then
       Producao := snSim
     else
       Producao :=snNao;

     // TnfseStatusRPS = ( srNormal, srCancelado );
     StatusRps := srNormal;

     // Somente Os provedores Betha, FISSLex e SimplISS permitem incluir no RPS
     // a TAG: OutrasInformacoes os demais essa TAG é gerada e preenchida pelo
     // WebService do provedor.
     OutrasInformacoes := 'Pagamento a Vista';

     { Usando quando o RPS for substituir outro
     RpsSubstituido.Numero := FormatFloat('#########0', i);
     RpsSubstituido.Serie  := 'UNICA';
     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     RpsSubstituido.Tipo   := trRPS;
     }

     Servico.Valores.ValorServicos          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;
     Servico.Valores.BaseCalculo            := Servico.Valores.ValorServicos;
     //(vnotanfs as TClassNfSe).buscasmnt.FieldByName('valor').Ascurrency;
     servico.Valores.ValorIss               := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;
     //vnotanfs as TClassNfSe).buscasmnt.FieldByName('valor').Ascurrency*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100
//     Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;
     servico.valores.Aliquota               := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat;// atualizacao do acbr já envia com a aliquota correta / 100; //de acordo consulta da LUZ BH com a Prefeitura de Belo Horizonte o correto de uma aliquota de 5% é 0.05 conforme manual da prefeitura
     Servico.Valores.ValorDeducoes          := 0.00;
     Servico.Valores.ValorPis               := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency;
     Servico.Valores.ValorCofins            := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency;
     Servico.Valores.ValorInss              := 0.00;
     Servico.Valores.ValorIr                := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency;
     //0.00;
     Servico.Valores.ValorCsll              := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

     // TnfseSituacaoTributaria = ( stRetencao, stNormal, stSubstituicao );
     // stRetencao = snSim
     // stNormal   = snNao

     // Neste exemplo não temos ISS Retido ( stNormal = Não )
     // Logo o valor do ISS Retido é igual a zero.
     Servico.Valores.IssRetido:= vacbrnfse1.Provider.
     StrToSituacaoTributaria(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
     if Servico.Valores.IssRetido = stRetencao then
       Servico.Valores.ValorIssRetido:=(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency
       //servico.Valores.ValorIss
     else
       Servico.Valores.ValorIssRetido:= 0.00;

     Servico.Valores.OutrasRetencoes        := 0.00;
     Servico.Valores.DescontoIncondicionado := 0.00;
     Servico.Valores.DescontoCondicionado   := 0.00;


//                                    Servico.Valores.ValorDeducoes -
//                                    Servico.Valores.DescontoIncondicionado;

     // No caso do provedor Ginfes devemos informar a aliquota já dividida por 100
     // para outros provedores devemos informar por exemplo 3, mas ao fazer o calculo
     // do valor do ISS devemos dividir por 100

{    Servico.Valores.Aliquota    := 2;}

     // Valor do ISS calculado multiplicando-se a base de calculo pela aliquota
{    ValorISS := Servico.Valores.BaseCalculo * Servico.Valores.Aliquota;}

     // A função RoundTo5 é usada para arredondar valores, sendo que o segundo
     // parametro se refere ao numero de casas decimais.
     // exemplos: RoundTo5(50.532, -2) ==> 50.53
     // exemplos: RoundTo5(50.535, -2) ==> 50.54
     // exemplos: RoundTo5(50.536, -2) ==> 50.54

{    Servico.Valores.ValorIss       := RoundTo5(ValorISS, -2);

     Servico.Valores.ValorLiquidoNfse := Servico.Valores.ValorServicos -
                                         Servico.Valores.ValorPis -
                                         Servico.Valores.ValorCofins -
                                         Servico.Valores.ValorInss -
                                         Servico.Valores.ValorIr -
                                         Servico.Valores.ValorCsll -
                                         Servico.Valores.OutrasRetencoes -
                                         Servico.Valores.ValorIssRetido -
                                         Servico.Valores.DescontoIncondicionado -
                                         Servico.Valores.DescontoCondicionado;}


     Servico.ItemListaServico         := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString;
     servico.CodigoCnae               := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7);

     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo CNAE tem que ser '6511102'
     // Servico.CodigoCnae                := '123'; // Informação Opcional
     Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString;
     vobsos:='';

     vRemoverEnterOBS_OS := False;
     try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
     except
       vRemoverEnterOBS_OS := False;
     end;

     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
     ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
     (vnotanfs as TClassNfSe).buscaadc.open;
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
      (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     if vRemoverEnterOBS_OS then
     begin
       vobsos:=Trim(StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]));
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos), 1) = ',' then
         System.Delete(vobsos, Length(vobsos), 1);
     end;
     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
     (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
     (vnotanfs as TClassNfSe).buscaadc.open;
     vobsos:=StringReplace(vobsos, #13#10, ';', [rfReplaceAll]);
//       vobsos:=StringReplace(vobsos, #10, '|', [rfReplaceAll]);
       //vden:=RetiraCarEsp(vobsos);
     vden:='';
     vunidades:='';
     //'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       vquantserv:=(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
       if vquantserv = 0 then
         vquantserv:=1;
       vunidades:=format('%n',[vquantserv])+' X '+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/vquantserv])+
       '=';
       vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
       vunidades+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
//         if pos(',',vospesq) > 0 then
//         begin
       vden:=vden+'(O.S.: '+(vnotanfs as TClassNfSe).StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
       if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
        vden:=vden+',';
//         end;
       (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     vden:=vden+';';
     vden:=vden+'----------------;';
     vden:=vden+vobsos;
     vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     if Pos('Fonte: IBPT', vden) = 0 then
     begin
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + QuotedStr(Servico.ItemListaServico);
       (vnotanfs as TClassNfSe).buscaadc.Open;
       if (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat > 0 then
       begin
         if vRemoverEnterOBS_OS then
           vden := vden + ','
         else
           vden := vden + ';';
         vden := vden + 'Val Aprox Tributos R$' + Format('%0.2n', [Servico.Valores.ValorServicos *
           (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
           ' (' + Format('%0.2f', [(vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat]) +
           '%) Fonte: IBPT';
       end;
     end;
     (vnotanfs as TClassNfSe).vden:=vden;
     Servico.Discriminacao             := TClassNfSe(vnotanfs).RetiraCarEsp(vden);

     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo do Municipio tem que ser '999'
     Servico.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);

     // Informar A Exigibilidade ISS para fintelISS [1/2/3/4/5/6/7]
     Servico.ExigibilidadeISS := exiExigivel;

     // Informar para Saatri
{     Servico.CodigoPais := 1058; // Brasil}
     Servico.MunicipioIncidencia := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;

      {$IFDEF USE_NFSEX}
      Prestador.IdentificacaoPrestador.Cnpj               := vnotanfs.cadempresa.fstrNotEsp('CGC_EMP');
      Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
      Prestador.Endereco.CodigoMunicipio                  := vnotanfs.strzero(vnotanfs.cadempresa.fint('IBGE_COD_CIDADE'), 7);
      Prestador.RazaoSocial                               := StringReplace(vnotanfs.cadempresa.fstrNotEsp('NOME_EMP'), '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      {$ELSE}
      Prestador.Cnpj               := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
      Prestador.InscricaoMunicipal := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IM_EMP').AsString;
      PrestadorServico.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);
      PrestadorServico.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NOME_EMP').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      {$ENDIF}

     Tomador.IdentificacaoTomador.CpfCnpj            := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString;
     if trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString) <> '' then
     Tomador.IdentificacaoTomador.InscricaoMunicipal := trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);

     Tomador.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

     Tomador.Endereco.Endereco        := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Numero          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Complemento     := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Bairro          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString;
     Tomador.Endereco.UF              := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString;
     Tomador.Endereco.CEP             := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString;
     //edtEmitCEP.Text;
	 //Provedor Equiplano é obrigatório o pais e IE
     Tomador.Endereco.xPais           := 'BRASIL';
//     Tomador.IdentificacaoTomador.InscricaoEstadual := 'ISENTO';

     Tomador.Contato.Telefone := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString;
     Tomador.Contato.Email    := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString;

     { Usando quando houver um intermediario na prestação do serviço
     IntermediarioServico.RazaoSocial        := 'razao';
     IntermediarioServico.CpfCnpj            := '00000000000';
     IntermediarioServico.InscricaoMunicipal := '12547478';
     }

     { Usando quando o serviço for uma obra
     ConstrucaoCivil.CodigoObra := '88888';
     ConstrucaoCivil.Art        := '433';
     }
    end;

  end;
 end;
end;

function TClasstribcidBH.montartxtrps(vnotanfs: TClassNfe): string;
var
  vobsos: AnsiString;
  vden: String;
  vvalserv: currency;
  valiqt: string;
  vunidades: string;
begin
   //Belo Horizonte na versão 1.0 ABRASF
  with vnotanfs do
  begin
   montalinha(0001,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger,15));
   montalinha(0016,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring);
   montalinha(0021,'1');
   montalinha(0022,FormatDateTime('yyyy-mm-dd"T"hh:nn:ss',(vnotanfs as TClassNfSe).buscasmnt.FieldByName('emissao_rps').AsDateTime));
   montalinha(0041,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_natop').AsInteger,1));
   montalinha(0042,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
   montalinha(0043,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));
   montalinha(0044,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));
   montalinha(0045,'1');
   // Valor total dos serviços
   vvalserv:=(vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
   (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
   (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency;
   //
   montalinha(0067,(vnotanfs as TClassNfSe).Tzero(vvalserv,15));
   montalinha(0082,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0097,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0112,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0127,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0142,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency,15));
   montalinha(0157,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0172,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
   montalinha(0173,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('valor').Ascurrency*
   ((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100),15));
   if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger = 1 then
    montalinha(0188,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency,15))
   else
    montalinha(0188,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0203,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0218,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('valor').Ascurrency,15));
   valiqt:=(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency*1000,5);
   montalinha(0233,valiqt);
//       montalinha(0233,Tzero(buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100,3)+'00');
   montalinha(0238,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0253,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0268,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0283,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString);
   montalinha(0288,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7));
//       if cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
//        montalinha(0295,'4320453')
//       else
//       montalinha(0295,cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString);
   montalinha(0295,(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CTISS').AsString);
   vobsos:='';
//       if pos(',',(vnotanfs as TClassNfSe).vospesq) <= 0 then
   begin

     vRemoverEnterOBS_OS := False;
     try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
     except
       vRemoverEnterOBS_OS := False;
     end;

     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
     ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
     (vnotanfs as TClassNfSe).buscaadc.open;
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ||-||';
      (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     if vRemoverEnterOBS_OS then
     begin
       vobsos:=StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]);
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos) - 1 , 1) = ',' then
         System.Delete(vobsos, Length(vobsos) - 1, 1);
     end;
   end;
   (vnotanfs as TClassNfSe).buscaadc.close;
   (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
   ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
   (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
   (vnotanfs as TClassNfSe).buscaadc.open;
   vobsos:=StringReplace(vobsos, #13, '|', [rfReplaceAll]);
   vobsos:=StringReplace(vobsos, #10, '|', [rfReplaceAll]);
   //vden:=RetiraCarEsp(vobsos);
   vden:='';
   vunidades:='';
   //'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
   while not (vnotanfs as TClassNfSe).buscaadc.eof do
   begin
     vunidades:=format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency])+' X '+
     format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency])+
     '=';
     vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
     vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
//         if pos(',',vospesq) > 0 then
//         begin
     vden:=vden+'(O.S.: '+StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
     if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
      vden:=vden+',';
//         end;
     (vnotanfs as TClassNfSe).buscaadc.next;
   end;
   vden:=vden+'||';
   vden:=vden+'----------------||';
   vden:=vden+vobsos;
   (vnotanfs as TClassNfSe).vden:=vden;
   montalinha(0315,copy(vden,1,2000));
   if (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
    montalinha(2315,'4320453')
   else
    montalinha(2315,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7));
   montalinha(2322,(vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('CGC_EMP').AsString);
   montalinha(2336,(vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IM_EMP').AsString);
   if Length(trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString)) <= 11 then
     montalinha(2351,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString)
   else
     montalinha(2362,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString);
   montalinha(2376,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);
   montalinha(2391,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString));
   montalinha(2506,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString));
   montalinha(2631,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString);
   montalinha(2641,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString));
   montalinha(2701,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString));
   montalinha(2761,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString);
   montalinha(2768,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString);
   montalinha(2770,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString);
   montalinha(2778,'0'+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString);
   montalinha(2789,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString);
  end;
end;

{ TEventNFSe }


{ TClasstribcidTO }

procedure TClasstribcidTO.copiarschemas(tpAmb: string);
begin
  fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\GovDigital';
  inherited;
end;

constructor TClasstribcidTO.create;
begin

end;

destructor TClasstribcidTO.destroy;
begin

  inherited;
end;

function TClasstribcidTO.sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps;
begin
  raise Exception.Create('Nao disponível para esta cidade');
end;

function TClasstribcidTO.montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ; vnotanfs: TClassNfe): boolean;
var
 vobsos: AnsiString;
 vden: String;
 vunidades: string;
 vquantserv, vlTmpValorISS: currency;
  vRoundMode: TFPURoundingMode;
begin
  vacbrnfse1.NotasFiscais.Clear;
  with vacbrnfse1 do
  begin
    NotasFiscais.NumeroLote:='1';
    NotasFiscais.Transacao := True;

    {$IFDEF USE_NFSEX}
    with NotasFiscais.New.NFSe do
    {$ELSE}
    with NotasFiscais.Add.NFSe do
    {$ENDIF}
    begin
      IdentificacaoRps.Numero := FormatFloat('#########0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger);
      IdentificacaoRps.Serie := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring;
      IdentificacaoRps.Tipo := trRPS;

      DataEmissao := Now;
      NaturezaOperacao := no1;//noTributacaoNoMunicipio;
      RegimeEspecialTributacao := vacbrnfse1.Provider.
      StrToRegimeEspecialTributacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
      OptanteSimplesNacional := vacbrnfse1.Provider.
      StrToSimNao(Ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));
      IncentivadorCultural := vacbrnfse1.Provider.
      StrToSimNao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));
      if (vacbrnfse1.Configuracoes.WebServices.Ambiente = taProducao) then
       Producao := snSim
      else
       Producao :=snNao;
      StatusRps := srNormal;
      OutrasInformacoes := 'Pagamento a Vista';
      Servico.Valores.ValorServicos          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

      Servico.Valores.ValorServicos := StrToFloatDef(  FormatFloat('0.00', Servico.Valores.ValorServicos), Servico.Valores.ValorServicos);
      vlTmpValorISS := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;

      try

      vRoundMode := GetRoundMode;
      SetRoundMode(rmUp);

      servico.Valores.ValorIss               := SimpleRoundTo(vlTmpValorISS, -2);
      servico.valores.Aliquota               :=(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat;

      finally
       SetRoundMode(vRoundMode);
      end;
      Servico.Valores.ValorDeducoes          := 0.00;
      Servico.Valores.ValorPis               := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency;
      Servico.Valores.ValorCofins            := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency;
      Servico.Valores.ValorInss              := 0.00;
      Servico.Valores.ValorIr                := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency;
      Servico.Valores.ValorCsll              := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

      Servico.Valores.IssRetido := vacbrnfse1.Provider.
      StrToSituacaoTributaria(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
      if Servico.Valores.IssRetido = stRetencao then
       Servico.Valores.ValorIssRetido:=(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency
      else
       Servico.Valores.ValorIssRetido:= 0.00;

      Servico.Valores.OutrasRetencoes        := 0.00;
      Servico.Valores.DescontoIncondicionado := 0.00;
      Servico.Valores.DescontoCondicionado   := 0.00;
      Servico.ItemListaServico         := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString;
      servico.CodigoCnae               := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7);

      Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString;
      vobsos:='';

      vRemoverEnterOBS_OS := False;
      try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
      except
       vRemoverEnterOBS_OS := False;
      end;

      (vnotanfs as TClassNfSe).buscaadc.close;
      (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
      ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
      ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
      (vnotanfs as TClassNfSe).buscaadc.open;
      while not (vnotanfs as TClassNfSe).buscaadc.eof do
      begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
      (vnotanfs as TClassNfSe).buscaadc.next;
      end;
      if vRemoverEnterOBS_OS then
      begin
       vobsos:=Trim(StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]));
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos), 1) = ',' then
         System.Delete(vobsos, Length(vobsos), 1);
      end;
      (vnotanfs as TClassNfSe).buscaadc.close;
      (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
      ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
      (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
      (vnotanfs as TClassNfSe).buscaadc.open;
      vobsos:=StringReplace(vobsos, #13#10, ';', [rfReplaceAll]);
      vden:='';
      vunidades:='';
      while not (vnotanfs as TClassNfSe).buscaadc.eof do
      begin
       vquantserv:=(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
       if vquantserv = 0 then
         vquantserv:=1;
       vunidades:=format('%n',[vquantserv])+' X '+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/vquantserv])+
       '=';
       vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
       vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
       vden:=vden+'(O.S.: '+(vnotanfs as TClassNfSe).StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
       if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
        vden:=vden+',';
       (vnotanfs as TClassNfSe).buscaadc.next;
      end;
      vden:=vden+';';
      vden:=vden+'----------------;';
      vden:=vden+vobsos;
      vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      if Pos('Fonte: IBPT', vden) = 0 then
      begin
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + QuotedStr(Servico.ItemListaServico);
       (vnotanfs as TClassNfSe).buscaadc.Open;
       if (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat > 0 then
       begin
         if vRemoverEnterOBS_OS then
           vden := vden + ','
         else
           vden := vden + ';';
         vden := vden + 'Val Aprox Tributos R$' + Format('%0.2n', [Servico.Valores.ValorServicos *
           (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
           ' (' + Format('%0.2f', [(vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat]) +
           '%) Fonte: IBPT';
       end;
      end;

      (vnotanfs as TClassNfSe).vden:=vden;
      Servico.Discriminacao             := vden;
      Servico.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);
      Servico.ExigibilidadeISS := exiExigivel;
      Servico.MunicipioIncidencia := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;

      {$IFDEF USE_NFSEX}
      Prestador.IdentificacaoPrestador.Cnpj               := vnotanfs.cadempresa.fstrNotEsp('CGC_EMP');
      Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
      Prestador.Endereco.CodigoMunicipio                  := vnotanfs.strzero(vnotanfs.cadempresa.fint('IBGE_COD_CIDADE'), 7);
      Prestador.RazaoSocial                               := StringReplace(vnotanfs.cadempresa.fstrNotEsp('NOME_EMP'), '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      {$ELSE}
      Prestador.Cnpj               := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
      Prestador.InscricaoMunicipal := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IM_EMP').AsString;
      PrestadorServico.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);
      PrestadorServico.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NOME_EMP').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      {$ENDIF}

      Tomador.IdentificacaoTomador.CpfCnpj            := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString;
      if trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString) <> '' then
      Tomador.IdentificacaoTomador.InscricaoMunicipal := trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);

      Tomador.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

      Tomador.Endereco.Endereco        := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Numero          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Complemento     := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Bairro          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString;
      Tomador.Endereco.UF              := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString;
      Tomador.Endereco.CEP             := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString;
      Tomador.Endereco.xPais           := 'BRASIL';
      Tomador.Contato.Telefone := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString;
      Tomador.Contato.Email    := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
    end;
  end;
end;

function TClasstribcidTO.montartxtrps(vnotanfs: TClassNfe): string;
begin
  raise Exception.Create('Nao disponivel para FlexDocs');
end;
*)
{ TAuxiliar }

class function TAuxiliar.apenasLetras(Atexto: string; ACaseSensitive: Boolean): string;
var
  I: Integer;
  AtextoU, AtextoL: string;
begin
  Result := '';
  AtextoU := UpperCase('ABCDEFGHIJKLMNOPQRSTUVXYWZ');
  AtextoL := LowerCase('abcdefghijklmnopqrstuvxywz');

  for I := 1 to (Length(Atexto)) do
  begin
    if ACaseSensitive then
    begin
      if (Pos(Atexto[I], AtextoU) > 0) or (Pos(Atexto[I], AtextoL) > 0) then
        Result := Result + Atexto[I];
    end
    else if Pos(UpperCase(Atexto[I]), AtextoU) > 0 then
      Result := Result + Atexto[I];
  end;
end;

class function TAuxiliar.ConvertStrToDateTime(Value, AFormat: string): TDateTime;
var
  AFormatSettings: TFormatSettings;
  ADateTimeFormat: string;
  ADate, ADay, AMonth, AYear, AHour, AMinutes, ASeconds: string;
  AChar, ACharValue: Char;
  I: Integer;
begin
  if AFormat.LowerCase(AFormat) = 'mongo' then
  begin
    AFormatSettings.DateSeparator := '-';
    AFormatSettings.TimeSeparator := ':';
    AFormatSettings.ShortDateFormat := 'YYYY-MM-DD';
    AFormatSettings.ShortTimeFormat := 'hh:nn:ss';

    ADate := Copy(Value, 1, 19);
    ADate := StringReplace(ADate, 'T', ' ', []);
    Result := StrToDateTime(ADate, AFormatSettings);
  end
  else
  begin
    ADate := Value;
    ADateTimeFormat := AFormat.ToUpper;

    for I := 1 to Length(ADateTimeFormat) do
    begin
      AChar := ADateTimeFormat[I];
      ACharValue := ADate[I];

      if AChar = 'D' then
        ADay := ADay + ACharValue
      else if AChar = 'M' then
        AMonth := AMonth + ACharValue
      else if AChar = 'Y' then
        AYear := AYear + ACharValue
      else if AChar = 'H' then
        AHour := AHour + ACharValue
      else if AChar = 'N' then
        AMinutes := AMinutes + ACharValue
      else if AChar = 'S' then
        ASeconds := ASeconds + ACharValue;
    end;
    result := EncodeDate(StrToIntDef(AYear, 0), StrToIntDef(AMonth, 0),
      StrToIntDef(ADay, 0)) + EncodeTime(StrToIntDef(AHour, 0),
      StrToIntDef(AMinutes, 0), StrToIntDef(ASeconds, 0), 0);
  end;
end;

class function TAuxiliar.GetParam(AParam: string; AList: TStrings): string;
var
  AValue: string;
begin
  Result := '';
  for AValue in AList do
    if AValue.StartsWith(AParam + '=') then
      Exit(AValue.Replace(AParam + '=', ''));
end;

class function TAuxiliar.GetRegistry(Aclass, Aname: string; Adefault: Integer): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
  Aint: Integer;
begin
  Result := Adefault;
  try
    Aint := Adefault;
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Aclass, True);
      if not Registro.ValueExists(Aname) then
        Exit;
      Aint := Registro.ReadInteger(Aname);
      Registro.CloseKey;
    finally
      Result := Aint;
      Registro.Free;
    end;
  except
  end;
end;

class function TAuxiliar.GetRegistry(Aclass, Aname, Adefault: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
  Astr: string;
begin
  Result := Adefault;
  try
    Astr := Adefault;
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Aclass, True);
      if not Registro.ValueExists(Aname) then
        Exit;
      Astr := Registro.ReadString(Aname);
      Registro.CloseKey;
    finally
      Result := Astr;
      Registro.Free;
    end;
  except
  end;
end;

class procedure TAuxiliar.SetRegistry(Aclass, Aname, Avalue: string);
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Aclass, True);
      Registro.WriteString(Aname, Avalue);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

class procedure TAuxiliar.SetRegistry(Aclass, Aname: string; Avalue: Integer);
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Aclass, True);
      Registro.WriteInteger(Aname, Avalue);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

{ TVinculoProdutos }

function TVinculoProdutos.CadastrarProdutoXML(vdataset: TClientDataSet; vdatasetCodigoEAN: TClientDataSet;
  pCadTodosItens: Boolean; pCadUnicoProdCodigo: Boolean): boolean;
var
  vCodigo: Integer;
  vOK: boolean;
  vCFOPIntra, vCFOPInter: Double;
  Aconf: TConfig_sistema_class;
  vCEST_v2: boolean;
  CestST: TCestM;
  vMvaCEST, vMvaNCM: Double;
  vCodGrupo, vCountGrupo: Integer;
  vItemJaExist: Integer;
  vCProdJaExiste: boolean;
  vProdJaCadastrado: boolean;
  vCadProdRep: boolean;
  vCadProdMesmoCodigo: boolean;
  vRegraCstTabA, vRegraCstTabB: boolean;
  vCadUnicoProdPorCodigo: boolean;
  vIdxUnqCodBarra: boolean;
  vReplicacaoInterna: boolean;
  vUsaReplicador: boolean;
  vbuscasTmp: TIBQuery;
  I, J: Integer;
  vListaEmp: TStringList;
  vListaCFOPSemConv: TStringList;
  vListConverterCSOSNparaCST: TStringList;
  vListCstTabA, vListCstTabB: TStringList;
  vListCodigoCProd: TStringList;
  vIncluirCodBarra: boolean;
  vCST_A: string;
  vCST_B: string;
  vCST_NF_A: string;
  vCST_NF_B: string;
  vCFOPpadraoOperacaoST: Double;
  vEmpresaFisicas: string;
  vRecNo: Integer;
  ufEmp: string;
  cstPisCofinsSai, cstPisCofinsEnt, natRecPisCofins: string;
  aliPisSai, aliCofinsSai, aliPisEnt, aliCofinsEnt : Variant;

  function StrZero(Num, Tam: Integer): string;
  var
    I: Integer;
    V1: string;
  begin
    V1 := Trim(IntToStr(Num));
    for I := 1 to Tam - Length(V1) do V1 := '0' + V1;
    Result := V1;
  end;

  function getCampoPipe(plinha: string; pOrdem: integer; pDelimitador: string = '|'): string;
  var
    vTemp: string;
    vInc: Smallint;
  begin
    // recebe uma string como parametro separados por um delimitador,
    // toda vez que encontrar um delimitador quer dizer que vai ser 1 item na string
    // Ex: "1|nome|endereco|", onde a string possui 3 itens
    // sempre finalizar com o delimitador
    // veja tambem a funcao getValue
    vTemp := plinha;
    vInc := 0;
    while pos(pDelimitador, vTemp) > 0 do
    begin
      inc(vInc);
      if pOrdem = vInc then
      begin
        vTemp := Copy(vTemp, 1, pos(pDelimitador, vTemp) - 1);
        Result := Trim(vTemp);
        exit;
      end;
      vTemp := Copy(vTemp, pos(pDelimitador, vTemp) + 1, length(vTemp));
    end;
    Result := '';
  end;

  function getValue(pStr: string; pPos: integer; pDelimiter: string = '|';
    StartWithDelimiter: Boolean = True): string;
  begin
    // parecido com a funcao getCampoPipe,
    // porém sempre vai iniciar com um delimitador
    // Ex: |1|nome|endedeco|, onde a string possui 3 itens
    // sempre começa e sempre termina com delimitador
    if StartWithDelimiter then
      pStr := Trim(Copy(pStr, 2, Length(pStr)));
    Result := getCampoPipe(pStr, pPos, pDelimiter);
  end;

begin
  for I := 0 to Fdetalhes.Count - 1 do
    if (Fdetalhes[I].unid_prin.Trim.IsEmpty)
      and (Fdetalhes[I].prod_vinc <> 'S') then
    begin
      ShowAtencao('Existem produtos sem definir a unidade de medida principal, utilize os botões(3 pontinhos) no canto superior direito (ao lado do Remover) ou na linha do item (coluna Op) para selecionar a unidade principal');
      Exit;
    end;

  try
    vdataset.DisableControls;
    if vdataset.RecordCount > 0 then    
      vRecNo := vdataset.RecNo
    else
      vRecNo := 0;    
    vdataset.Filtered := false;
    vdataset.Filter := 'sel = ''S'' ';
    vdataset.Filtered := true;
    
    try
      Result := false;
      if vCadProdAberto = 'S' then
      begin
        if Application.MessageBox(PChar( 'O cadastro do produto se encontra aberto, ' +
          'os dados em tela serão perdidos, deseja continuar mesmo assim?'),
          'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
          exit;
      end;

      vCEST_v2 := false;
      vOK := false;
      vCProdJaExiste := false;
      vProdJaCadastrado := false;
      vCadProdRep := false;
      vCadProdMesmoCodigo := false;
      vRegraCstTabA := false;
      vRegraCstTabB := false;
      vCadUnicoProdPorCodigo := false;
      vReplicacaoInterna := false;
      vIdxUnqCodBarra := false;
      vUsaReplicador := false;
      vCFOPpadraoOperacaoST := 0;

      vbuscasTmp := TIBQuery.Create(Application);
      vbuscasTmp.Database := FconsProd.Database;
      vbuscasTmp.Transaction := FconsProd.Transaction;

      vClassNfVenda.vusuario := vUsuario;
      vClassNfVenda.cadempresa.codempresa := cod_empresa;
      if not vClassNfVenda.PesqPros(true, 'PRO002', '') then
        exit;

      vListaEmp := TStringList.Create;
      vListaEmp.Duplicates := dupIgnore;
      vListaEmp.Clear;

      vListaCFOPSemConv := TStringList.Create;
      vListaCFOPSemConv.Duplicates := dupIgnore;
      vListaCFOPSemConv.Clear;

      vListConverterCSOSNparaCST := TStringList.Create;
      vListConverterCSOSNparaCST.Duplicates := dupIgnore;
      vListConverterCSOSNparaCST.Clear;

      vListCstTabA := TStringList.Create;
      vListCstTabA.Duplicates := dupIgnore;
      vListCstTabA.Clear;

      vListCstTabB := TStringList.Create;
      vListCstTabB.Duplicates := dupIgnore;
      vListCstTabB.Clear;

      vListCodigoCProd := TStringList.Create;
      vListCodigoCProd.Duplicates := dupIgnore;
      vListCodigoCProd.Clear;

      vbuscasTmp.Close;
      vbuscasTmp.SQL.Text := ' select * from TAB_REP where TABELA = ''PRODUTOS'' ';
      vbuscasTmp.open;
      vReplicacaoInterna := not vbuscasTmp.IsEmpty;

      vListaEmp.Add(IntToStr(cod_empresa));
      if vReplicacaoInterna then
      begin
        vbuscasTmp.close;
        vbuscasTmp.sql.Text := ' select cod_empresa, ' +
         ' coalesce(emp_repl_interna, ' + IntToStr(cod_empresa) + ') emp_repl_interna from EMPRESA ' +
         ' where ativo = 1 and cod_empresa <> ' + IntToStr(cod_empresa);
        vbuscasTmp.Open;
        vbuscasTmp.FetchAll;

        vbuscasTmp.First;
        while not vbuscasTmp.Eof do
        begin
          if vbuscasTmp.FieldByName('EMP_REPL_INTERNA').AsInteger = cod_empresa then
            vListaEmp.Add(IntToStr(vbuscasTmp.FieldByName('COD_EMPRESA').AsInteger));

          vbuscasTmp.Next;
        end;
      end;

      vbuscasTmp.Close;
      vbuscasTmp.SQL.Text := ' select rdb$index_name from rdb$indices ' +
        ' where rdb$index_name = ''I_CODBARRAS'' ' +
        ' and rdb$relation_name = ''COD_BARRA'' ' +
        ' and rdb$index_id > 0';
      vbuscasTmp.open;
      vIdxUnqCodBarra := not vbuscasTmp.IsEmpty;

      Aconf := TConfig_sistema_class.GetConf('nf_icmsst_cest_v2', vbuscasTmp, cod_empresa);
      if Aconf.value1_f = 1 then
        vCEST_v2 := true;

      Aconf := TConfig_sistema_class.GetConf('importacao_xml_usa_anexoxv_operacao_st', vbuscasTmp, cod_empresa);
      if Aconf.chave.IsEmpty then
      begin
        Application.MessageBox(PWideChar('Configuração: "CFOP padrão ST usando o anexo XV" não criada favor verificar.'),PWideChar('Aviso'), MB_ICONERROR);
        exit;
      end;
      if Aconf.value1_f = 1 then
      begin
        if not TryStrToFloat(Aconf.ReadString('Conf', 'CFOP padrão ST usando o anexo XV', '0'), vCFOPpadraoOperacaoST) then
        begin
          vCFOPpadraoOperacaoST := 5405;
          Application.MessageBox(PWideChar('CFOP padrão ST usando o anexo XV não definido ou incorreto.'),PWideChar('Aviso'), MB_ICONWARNING);
        end;
       
        Aconf := TConfig_sistema_class.GetConf('nf_icmsst_cest_v2', vbuscasTmp, cod_empresa);
        if Aconf.value1_f = 1 then
          vCEST_v2 := true
        else
        begin
          Application.MessageBox(PWideChar('CEST versão 2 desativada, favor verificar.'),PWideChar('Aviso'), MB_ICONERROR);
          exit;
        end;
      end;

      Aconf := TConfig_sistema_class.GetConf('importacao_xml_cad_prod_mais_de_uma_vez', vbuscasTmp, cod_empresa);
      if Aconf.value1_f = 1 then
        vCadProdRep := true;

      Aconf := TConfig_sistema_class.GetConf('importacao_xml_cad_prod_com_mesmo_codigo', vbuscasTmp, cod_empresa);
      if Aconf.value1_f = 1 then
        vCadProdMesmoCodigo := true;

      Aconf := TConfig_sistema_class.GetConf('importacao_xml_conversao_csosn_cst', vbuscasTmp, cod_empresa);
      vListConverterCSOSNparaCST.Text := Aconf.value1_b.Text;

      Aconf := TConfig_sistema_class.GetConf('importacao_xml_conversao_cst_regra_geral_tabela_a', vbuscasTmp, cod_empresa);
      if Aconf.value1_f = 1 then
      begin
       vRegraCstTabA := true;
       vListCstTabA.Text := Aconf.value1_b.Text;
      end;

      Aconf := TConfig_sistema_class.GetConf('importacao_xml_conversao_cst_regra_geral_tabela_b', vbuscasTmp, cod_empresa);
      if Aconf.value1_f = 1 then
      begin
       vRegraCstTabB := true;
       vListCstTabB.Text := Aconf.value1_b.Text;
      end;

      Aconf := TConfig_sistema_class.GetConf('importacao_xml_cad_unico_produto_por_codigo', vbuscasTmp, cod_empresa);
      if Aconf.value1_f = 1 then
        vCadUnicoProdPorCodigo := true;
            
      vdataset.First;
      while not vdataset.Eof do
      begin
        if ((vdataset.FieldByName('sel').AsString = 'S')
             and (not vCadProdRep)
             and (trim(vdataset.FieldByName('cod_prod').AsString) = ''))
         or
           ((vdataset.FieldByName('sel').AsString = 'S')
             and (vCadProdRep)) then
        begin
          if not vCProdJaExiste then
            if ((vdataset.FieldByName('sel').AsString = 'S') //            and (not vCadProdRep)
              and (trim(vdataset.FieldByName('cod_prod').AsString) = '')) then
                if (vdataset.FieldByName('cprod_existente').AsString = 'S') then
                  vCProdJaExiste := true;

          if not vProdJaCadastrado then
            if ((vdataset.FieldByName('sel').AsString = 'S') //            and (not vCadProdRep)
              and (trim(vdataset.FieldByName('cod_prod').AsString) <> '')) then
                 vProdJaCadastrado := true;

          if not vProdJaCadastrado then
            if ((vdataset.FieldByName('sel').AsString = 'S') //            and (vCadProdRep)
              and (trim(vdataset.FieldByName('prod_cad').AsString) = 'S')) then
                 vProdJaCadastrado := true;

          vOK := true;

           if vListaCFOPSemConv.IndexOf(IntToStr(Trunc(vdataset.FieldByName('CODIGO_NOP').AsFloat))) < 0 then
           begin
             vbuscasTmp.Close;
             vbuscasTmp.SQL.Text := ' SELECT CODIGO_NOP, CFOP_CONV_SAIDA_INTRA, CFOP_CONV_SAIDA_INTER FROM NAT_OP ' +
                ' WHERE CODIGO_NOP = :CODIGO_NOP AND ATIVO = 1 ';
             vbuscasTmp.ParamByName('CODIGO_NOP').AsFloat := vdataset.FieldByName('CODIGO_NOP').AsFloat;
             vbuscasTmp.Open;

             if vbuscasTmp.IsEmpty then
                vListaCFOPSemConv.Add(IntToStr(Trunc(vdataset.FieldByName('CODIGO_NOP').AsFloat)))
             else if (vbuscasTmp.FieldByName('CFOP_CONV_SAIDA_INTRA').AsFloat = 0)
              or (vbuscasTmp.FieldByName('CFOP_CONV_SAIDA_INTER').AsFloat = 0) then
                vListaCFOPSemConv.Add(IntToStr(Trunc(vdataset.FieldByName('CODIGO_NOP').AsFloat)));
           end;
        end;

        vdataset.Next;
      end;
      vdataset.First;      

      if not vOK then
      begin
        if not vCadProdRep then
          Application.MessageBox(PWideChar('Nenhum produto sem vinculo selecionado!'),PWideChar('Aviso'), MB_ICONWARNING)
        else
          Application.MessageBox(PWideChar('Nenhum produto selecionado!'),PWideChar('Aviso'), MB_ICONWARNING);
        Result := false;
        exit;
      end;

     if Application.MessageBox(PChar('Deseja cadastrar os produtos selecionados?'),
       'Atenção', mb_yesno + MB_DEFBUTTON2) <> IDYES then
     begin
       Result := false;
       exit;
     end;

      if vCProdJaExiste then
      begin
        if not vCadProdMesmoCodigo then
        begin
          Application.MessageBox(PWideChar('Existem produtos cadastrados com os códigos informados no xml, favor verificar antes de continuar!'),PWideChar('Aviso'), MB_ICONWARNING);
          Result := false;
          exit;
        end
        else if Application.MessageBox(PChar('Existem produtos cadastrados com os códigos informados no xml, deseja continuar assim mesmo?'), 'Atenção', mb_yesno + MB_DEFBUTTON2) <> IDYES then
        begin
          Result := false;
          exit;
        end;
      end;

      if vProdJaCadastrado then
      begin
        if not vCadProdRep then
        begin
          Application.MessageBox(PWideChar('Já existe o cadastro de alguns produtos do xml, favor verificar antes de continuar!'),PWideChar('Aviso'), MB_ICONWARNING);
          Result := false;
          exit;
        end
        else if Application.MessageBox(PChar('Já existe o cadastro de alguns produtos do xml, deseja continuar assim mesmo?'), 'Atenção', mb_yesno + MB_DEFBUTTON2) <> IDYES then
        begin
          Result := false;
          exit;
        end;
      end;

      if vListaCFOPSemConv.Count > 0 then
      begin
        if ShowConfirmacao('CFOP(s) sem conversão para cadastro de produtos' + sLineBreak +
                           'Verifique o cadastro de Natureza de Operação os campos "CFOP Interestadual" e "CFOP Interestadual não Contr"' + sLineBreak + sLineBreak +
                           'Deseja continuar assim mesmo?' + sLineBreak + sLineBreak + vListaCFOPSemConv.Text) <> IDYES then
        begin
          Result := false;
          exit;
        end;
      end;

      ufEmp := FOwner.SqlOpen('select es.sigla_uf from empresa e' +
                              ' inner join estados es on es.codigo_uf = e.uf_emp' +
                              ' where e.cod_empresa = ' + IntToStr(cod_empresa), vbuscasTmp)
                              .FieldByName('sigla_uf').AsString;

      vbuscasTmp.Close;
      vbuscasTmp.SQL.Text := ' SELECT CODIGO_GRUP, DESCRICAO FROM GRUPOS ' +
        ' WHERE ATIVO = 1 ';
      vbuscasTmp.open;
      vbuscasTmp.FetchAll;

      vCodGrupo := vbuscasTmp.FieldByName('CODIGO_GRUP').AsInteger;
      vCountGrupo := vbuscasTmp.RecordCount;

      if vUsarCodigoSequencialProduto = 'S' then
      begin
        vCodigo := FOwner.SqlOpen(' select valor as MAXIMOCOD from codigo' +
          ' where COD_EMPRESA= ' + IntToStr(cod_empresa) +
          ' and tabela = ''PRODUTOS''', vbuscasTmp).FieldByName('MAXIMOCOD').AsInteger;

        vEmpresaFisicas := '';
        for I := 0 to vListaEmp.Count - 1 do
          vEmpresaFisicas := vEmpresaFisicas + vListaEmp[I] + IfThen(I = vListaEmp.Count - 1, '', ',');

        vbuscasTmp.Close;
        vbuscasTmp.SQL.Text := 'select max(valor) as MAXIMOCOD from codigo' +
          ' where COD_EMPRESA in (' + vEmpresaFisicas + ') ' +
          ' and tabela = ''PRODUTOS''';
        vbuscasTmp.open;

        if vbuscasTmp.FieldByName('MAXIMOCOD').AsInteger > vCodigo then
        begin
          vCodigo := vbuscasTmp.FieldByName('MAXIMOCOD').AsInteger;

          vbuscasTmp.Close;
          vbuscasTmp.SQL.Text := ' UPDATE CODIGO SET VALOR = :VALOR ' +
           ' WHERE TABELA = ''PRODUTOS'' ' +
           ' AND COD_EMPRESA = :COD_EMPRESA ';
          vbuscasTmp.ParamByName('VALOR').AsFloat := vCodigo;
          vbuscasTmp.ParamByName('COD_EMPRESA').AsInteger := cod_empresa;
          vbuscasTmp.ExecSQL;

          vCodigo := 0;
        end;
      end
      else
      begin
        vbuscasTmp.Close;
        vbuscasTmp.SQL.Text := ' SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ' +
          '	WHERE RDB$RELATION_FIELDS.RDB$RELATION_NAME = ''PRODUTOS'' ' +
          ' AND RDB$RELATION_FIELDS.RDB$FIELD_NAME IN (''UNQ_GRUPO_PROD'', ''UNQ_COD_PROD'') ';
        vbuscasTmp.open;

        vUsaReplicador := not vbuscasTmp.IsEmpty;

        vCodigo := 0;
        for I := 0 to vListaEmp.Count - 1 do
        begin
          if vUsaReplicador then
          begin
            vbuscasTmp.Close;
            vbuscasTmp.SQL.Text := ' select max(cast(UNQ_COD_PROD as integer)) as MAXIMOCOD from produtos' +
              ' where unq_grupo_prod = ' + IfThen(vCountGrupo = 1, vCodGrupo, vdataset.FieldByName('GRUPO_PROD').AsInteger).ToString()  +
              ' and cod_empresa = ' + vListaEmp[I] +
              ' union ' +
              ' select max(cast(COD_PROD as integer)) as MAXIMOCOD from produtos ' +
              ' where grupo_prod = ' + IfThen(vCountGrupo = 1, vCodGrupo, vdataset.FieldByName('GRUPO_PROD').AsInteger).ToString()  +
              ' and COD_EMPRESA = ' + vListaEmp[I] +
              ' order by 1 desc ';
            vbuscasTmp.open;
          end
          else
          begin
            vbuscasTmp.Close;
            vbuscasTmp.SQL.Text := 'select max(cast(COD_PROD as integer)) as MAXIMOCOD from produtos' +
              ' where grupo_prod = ' + IfThen(vCountGrupo = 1, vCodGrupo, vdataset.FieldByName('GRUPO_PROD').AsInteger).ToString()  +
              ' and COD_EMPRESA = ' + vListaEmp[I];
            vbuscasTmp.open;
          end;
          if vbuscasTmp.FieldByName('MAXIMOCOD').AsInteger > vCodigo then
            vCodigo := vbuscasTmp.FieldByName('MAXIMOCOD').AsInteger;
        end;
      end;

      mostrarmensagem('Cadastrando produtos pelo XML');      

      vdataset.First;
      while not vdataset.Eof do
      begin
        mostrarmensagem('Cadastrando produtos pelo XML (' + IntToStr(vdataset.RecNo) + '/' + IntToStr(vdataset.RecordCount) + ')');

        if (vdataset.FieldByName('sel').AsString = 'S')
          and (vListCodigoCProd.IndexOf(vdataset.FieldByName('NUM_FAB_FORNECEDOR').AsString) <= -1) then
        begin
           if pCadTodosItens then
              // Cadastrar todos produtos
           else if pCadUnicoProdCodigo then
             vListCodigoCProd.Add(vdataset.FieldByName('NUM_FAB_FORNECEDOR').AsString)
           else if vCadUnicoProdPorCodigo then
             vListCodigoCProd.Add(vdataset.FieldByName('NUM_FAB_FORNECEDOR').AsString);

           if vUsarCodigoSequencialProduto = 'S' then
             vCodigo := FOwner.Gencodigo('PRODUTOS', vbuscasTmp, cod_empresa.ToString())
           else
             vCodigo := vCodigo + 1;

           var NullIfZero := function (ADoubleValue: Double): Variant
             begin
               if ADoubleValue > 0 then
                 Result := ADoubleValue
               else
                 Result := Null;
             end;

           vbuscasTmp.Close;
           vbuscasTmp.SQL.Text :=
             ' SELECT COD_NCM, MVA, CST_PIS_ENT, CST_PIS, NAT_REC,' +
             ' ALIQ_PIS_DIFERENCIADA, ALIQ_CRED_PIS, ALIQ_COFINS_DIFERENCIADA, ALIQ_CRED_COFINS,' +
             ' ALIQ_INTRA FROM NBM ' +
             ' WHERE COD_NCM = ' + QuotedStr(vdataset.FieldByName('NCM').AsString);
           vbuscasTmp.Open;

           cstPisCofinsSai := vbuscasTmp.FieldByName('CST_PIS').AsString.Trim();
           cstPisCofinsEnt := vbuscasTmp.FieldByName('CST_PIS_ENT').AsString.Trim();
           natRecPisCofins := vbuscasTmp.FieldByName('NAT_REC').AsString.Trim();
           aliPisSai       := NullIfZero(vbuscasTmp.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat);
           aliPisEnt       := NullIfZero(vbuscasTmp.FieldByName('ALIQ_CRED_PIS').AsFloat);
           aliCofinsSai    := NullIfZero(vbuscasTmp.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat);
           aliCofinsEnt    := NullIfZero(vbuscasTmp.FieldByName('ALIQ_CRED_COFINS').AsFloat);

           NullIfZero := nil;

           vMvaCEST := 0;
           vMvaNCM := 0;
           if vCFOPpadraoOperacaoST > 0 then
             if (vCEST_v2) and (trim(vdataset.FieldByName('CEST').AsString) <> '') then
             begin
               CestST := TCest_Builder.GetCest(
                  vdataset.FieldByName('CEST').AsString,
                  vdataset.FieldByName('NCM').AsString,
                  Copy(vdataSet.FieldByName('CST').AsString, 1, 1),
                  vUFDest,
                  ufEmp,
                  1,
                  0,
                  Aconf.ReadInteger('Conf', 'RamoAtividade_' + vdataSet.FieldByName('cnpj').AsString, 0),
                  0,
                  vbuscasTmp.Database,
                  IntToStr(Fcod_empresa));
               vMvaCEST := CestST.MVAs.Count;
             end
             else
             begin
               vMvaNCM := vbuscasTmp.FieldByName('MVA').AsFloat;
             end;

           vCFOPIntra := 0;
           vCFOPInter := 0;

           vbuscasTmp.Close;
           vbuscasTmp.SQL.Text := ' SELECT CODIGO_NOP, CFOP_CONV_SAIDA_INTRA, CFOP_CONV_SAIDA_INTER FROM NAT_OP ' +
              ' WHERE CODIGO_NOP = :CODIGO_NOP AND ATIVO = 1 ';
           vbuscasTmp.ParamByName('CODIGO_NOP').AsFloat := vdataset.FieldByName('CODIGO_NOP').AsFloat;
           vbuscasTmp.Open;

           vCFOPIntra := vbuscasTmp.FieldByName('CFOP_CONV_SAIDA_INTRA').AsFloat;
           vCFOPInter := vbuscasTmp.FieldByName('CFOP_CONV_SAIDA_INTER').AsFloat;

           for I := 0 to vListaEmp.Count - 1 do
           begin
             vbuscasTmp.Close;
             vbuscasTmp.SQL.Text := ' INSERT INTO PRODUTOS ' +
                '(GRUPO_PROD, COD_PROD, COD_EMPRESA, DAT_CAD_PROD, DAT_MOD_PROD, NUM_FAB_PROD, DESCR_PROD, DESCR_PROD_RED, ' +
                ' PREC_CUS_PROD, PREC_CUSM_PROD, PREC_TAB_PROD, NBM, CST_PROD, CEST, CSOSN, CODIGO_NOP, CFOP_INTER_N_CONT, ' +
                ' UNIDADE, CHAVE_NFE, CPROD_XML, CEAN_XML, ATIVO, ISENTO_PIS, MD5, EM_PROMOCAO, TIPO_FAB, TIP_PROD_IND, ' +
                ' CST_PIS_ENT, CST_COFINS_ENT, CST_PIS, CST_COFINS, NAT_REC, ALIQ_PIS_DIFERENCIADA, ALIQ_CRED_PIS, ALIQ_COFINS_DIFERENCIADA, ALIQ_CRED_COFINS,' +
                ' EMB_PROD, QTDEMB, REP_INT_ACTIVE, SEQID) ' +
                ' VALUES (:GRUPO_PROD, :COD_PROD, :COD_EMPRESA, :DAT_CAD_PROD, :DAT_MOD_PROD, :NUM_FAB_PROD, :DESCR_PROD, :DESCR_PROD_RED, ' +
                ' :PREC_CUS_PROD, :PREC_CUSM_PROD, :PREC_TAB_PROD, :NBM, :CST_PROD, :CEST, :CSOSN, :CODIGO_NOP, :CFOP_INTER_N_CONT, ' +
                ' :UNIDADE, :CHAVE_NFE, :CPROD_XML, :CEAN_XML, :ATIVO, :ISENTO_PIS, :MD5, :EM_PROMOCAO, :TIPO_FAB, :TIP_PROD_IND, ' +
                ' :CST_PIS_ENT, :CST_COFINS_ENT, :CST_PIS, :CST_COFINS, :NAT_REC, :ALIQ_PIS_DIFERENCIADA, :ALIQ_CRED_PIS, :ALIQ_COFINS_DIFERENCIADA, :ALIQ_CRED_COFINS,' +
                ' :EMB_PROD, :QTDEMB, :REP_INT_ACTIVE, ' +
                ' (SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, ''PRODUTOS_SEQID'')) ); ';
             if vCountGrupo = 1 then
               vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vCodGrupo
             else
               vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vdataset.FieldByName('GRUPO_PROD').AsInteger;
             vbuscasTmp.ParamByName('COD_PROD').AsString := StrZero(vCodigo, vDigitosProd);

             vbuscasTmp.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListaEmp[i]);
             if vUsarCodigoSequencialProduto = 'S' then
               vbuscasTmp.ParamByName('NUM_FAB_PROD').AsString := vbuscasTmp.ParamByName('COD_PROD').AsString
             else
               vbuscasTmp.ParamByName('NUM_FAB_PROD').AsString :=
                IntToStr(vdataset.FieldByName('GRUPO_PROD').AsInteger) + vbuscasTmp.ParamByName('COD_PROD').AsString;
             vbuscasTmp.ParamByName('DESCR_PROD').AsString := Copy(trim(vdataset.FieldByName('DESCRICAO_ITEM').AsString), 1, 75).ToUpper;
             vbuscasTmp.ParamByName('DESCR_PROD_RED').AsString := Copy(trim(vdataset.FieldByName('DESCRICAO_ITEM').AsString), 1, 35).ToUpper;
             vbuscasTmp.ParamByName('PREC_CUS_PROD').AsFloat := vdataset.FieldByName('PREC_CUS_PROD').AsFloat;
             vbuscasTmp.ParamByName('PREC_CUSM_PROD').AsFloat := vdataset.FieldByName('PREC_CUSM_PROD').AsFloat;
             vbuscasTmp.ParamByName('PREC_TAB_PROD').AsFloat := 0;
             vbuscasTmp.ParamByName('NBM').AsString := vdataset.FieldByName('NCM').AsString;
             vbuscasTmp.ParamByName('CEST').AsString := vdataset.FieldByName('CEST').AsString;
             vbuscasTmp.ParamByName('CST_PIS').AsString := cstPisCofinsSai;
             vbuscasTmp.ParamByName('CST_COFINS').AsString := cstPisCofinsSai;
             vbuscasTmp.ParamByName('CST_PIS_ENT').AsString := cstPisCofinsEnt;
             vbuscasTmp.ParamByName('CST_COFINS_ENT').AsString := cstPisCofinsEnt;
             vbuscasTmp.ParamByName('NAT_REC').AsString := natRecPisCofins;
             vbuscasTmp.ParamByName('ALIQ_PIS_DIFERENCIADA').Value := aliPisSai;
             vbuscasTmp.ParamByName('ALIQ_COFINS_DIFERENCIADA').Value := aliCofinsSai;
             vbuscasTmp.ParamByName('ALIQ_CRED_PIS').Value := aliPisEnt;
             vbuscasTmp.ParamByName('ALIQ_CRED_COFINS').Value := aliCofinsEnt;
             if vSimplesNacional then
               vbuscasTmp.ParamByName('CSOSN').AsString := vdataset.FieldByName('CSOSN').AsString;

             vCST_A := '';
             vCST_B := '';
             vCST_NF_A := '';
             vCST_NF_B := '';
             if (vMvaCEST > 0) or (vMvaNCM > 0) then
             begin
               if vSimplesNacional then
                 vCST_NF_A := Copy(trim(vdataSet.FieldByName('icms_orig').AsString), 1, 1)
               else
                 vCST_NF_A := Copy(trim(vdataSet.FieldByName('CST').AsString), 1, 1);

               vbuscasTmp.ParamByName('CST_PROD').AsString := vCST_NF_A +  '60';
               vbuscasTmp.ParamByName('CODIGO_NOP').AsFloat := 5405;
               vbuscasTmp.ParamByName('CFOP_INTER_N_CONT').AsFloat := 6403;
             end
             else
             begin
               if vSimplesNacional then
               begin
                 vCST_NF_A := Copy(trim(vdataSet.FieldByName('icms_orig').AsString), 1, 1);

                 if (vListConverterCSOSNparaCST.Count >= 2) then
                   for J := 1 to vListConverterCSOSNparaCST.Count - 1 do // a primeira linha é desconsiderada
                     if (trim(vdataset.FieldByName('CSOSN').AsString) = trim(getValue(vListConverterCSOSNparaCST[J], 1))) then
                     begin
                       vCST_B    := Copy(Trim(getValue(vListConverterCSOSNparaCST[J], 2)), 1, 2);
                       vCST_NF_B := Copy(Trim(getValue(vListConverterCSOSNparaCST[J], 2)), 1, 2);
                       Break;
                     end;

                 if trim(vCST_NF_B) = '' then
                  vCST_NF_B := '90';
               end
               else
               begin
                 vCST_NF_A := Copy(trim(vdataSet.FieldByName('CST').AsString), 1, 1);
                 vCST_NF_B := Copy(trim(vdataSet.FieldByName('CST').AsString), 2, 2);
               end;

               if (vRegraCstTabA) and (vListCstTabA.Count >= 2) then
                 for J := 1 to vListCstTabA.Count - 1 do // a primeira linha é desconsiderada
                   if (trim(vCST_NF_A) = trim(getValue(vListCstTabA[J], 1))) then
                   begin
                     vCST_A := Copy(Trim(getValue(vListCstTabA[J], 2)), 1, 1);
                     Break;
                   end;

               if (vRegraCstTabB) and (vListCstTabB.Count >= 2) then
                for J := 1 to vListCstTabB.Count - 1 do // a primeira linha é desconsiderada
                  if (trim(vCST_NF_B) = trim(getValue(vListCstTabB[J], 1))) then
                  begin
                    vCST_B := Copy(Trim(getValue(vListCstTabB[J], 2)), 1, 2);
                    if trim(vCST_B) <> '' then
                      Break;
                  end;

               vbuscasTmp.ParamByName('CST_PROD').AsString :=
                  IfThen(trim(vCST_A) <> '', trim(vCST_A), trim(vCST_NF_A)) +
                  IfThen(trim(vCST_B) <> '', TRIM(vCST_B), trim(vCST_NF_B));

               if vCFOPIntra <= 0 then
                 vbuscasTmp.ParamByName('CODIGO_NOP').AsFloat := StrToFloat('5' + copy(FloatToStr(vdataset.FieldByName('CODIGO_NOP').AsFloat), 2, 3))
               else
               begin
                 if Copy(FloatToStr(vCFOPIntra), 1, 1) = '6' then
                   vbuscasTmp.ParamByName('CODIGO_NOP').AsFloat := StrToFloat('5' + copy(FloatToStr(vCFOPIntra),2,3))
                 else
                   vbuscasTmp.ParamByName('CODIGO_NOP').AsFloat := vCFOPIntra;
               end;

               if vCFOPInter <= 0 then
               begin
                 if vdataset.FieldByName('CODIGO_NOP').AsFloat = 5102 then
                   vbuscasTmp.ParamByName('CFOP_INTER_N_CONT').AsFloat := 6102
                 else
                   vbuscasTmp.ParamByName('CFOP_INTER_N_CONT').AsFloat := 6403;
               end
               else
                 vbuscasTmp.ParamByName('CFOP_INTER_N_CONT').AsFloat := vCFOPInter;
             end;

             if vSimplesNacional then
               vCST_NF_A := Copy(trim(vdataSet.FieldByName('icms_orig').AsString), 1, 1)
             else
               vCST_NF_A := Copy(trim(vdataSet.FieldByName('CST').AsString), 1, 1);

             if (vRegraCstTabA) and (vListCstTabA.Count >= 2) then
               for J := 1 to vListCstTabA.Count - 1 do // a primeira linha é desconsiderada
                 if (trim(vCST_NF_A) = trim(getValue(vListCstTabA[J], 1))) then
                 begin
                   vCST_A := Copy(Trim(getValue(vListCstTabA[J], 2)), 1, 1);
                   vbuscasTmp.ParamByName('CST_PROD').AsString := vCST_NF_A.Substring(0, 1) +
                      vbuscasTmp.ParamByName('CST_PROD').AsString.Substring(1, 2);
                   Break;
                 end;

             if trim(vdataset.FieldByName('UNIDADE_PRINC').AsString) <> '' then
               vbuscasTmp.ParamByName('UNIDADE').AsString := UpperCase(trim(vdataset.FieldByName('UNIDADE_PRINC').AsString))
             else
               vbuscasTmp.ParamByName('UNIDADE').AsString := UpperCase(trim(vdataset.FieldByName('UNIDADE').AsString));
             vbuscasTmp.ParamByName('CHAVE_NFE').AsString := vdataset.FieldByName('CHAVE_NFE').AsString;
             vbuscasTmp.ParamByName('CPROD_XML').AsString := vdataset.FieldByName('CPROD').AsString;
             vbuscasTmp.ParamByName('CEAN_XML').AsString := UpperCase(trim(vdataset.FieldByName('CEAN').AsString));
             vbuscasTmp.ParamByName('DAT_CAD_PROD').AsDate := Date;
             vbuscasTmp.ParamByName('DAT_MOD_PROD').AsDate := Date;
             vbuscasTmp.ParamByName('ATIVO').AsInteger := IfThen(vCountGrupo = 1, 1, 3);
             vbuscasTmp.ParamByName('ISENTO_PIS').AsString := 'N';
             vbuscasTmp.ParamByName('MD5').AsString := 'sistema';
             vbuscasTmp.ParamByName('EM_PROMOCAO').AsString := 'N';
             vbuscasTmp.ParamByName('TIPO_FAB').AsString := 'N';
             vbuscasTmp.ParamByName('TIP_PROD_IND').AsString := 'O';
             if trim(vdataset.FieldByName('EMB_PROD').AsString) <> '' then
               vbuscasTmp.ParamByName('EMB_PROD').AsString := UpperCase(trim(vdataset.FieldByName('EMB_PROD').AsString));
             if vdataset.FieldByName('QTDEMB').AsInteger > 0 then
               vbuscasTmp.ParamByName('QTDEMB').AsFloat := vdataset.FieldByName('QTDEMB').AsFloat;
             vbuscasTmp.ParamByName('REP_INT_ACTIVE').AsInteger := 1;
             vbuscasTmp.ExecSQL;

             //Incluir na tabela "PRODUTOS_CONVERSAO" somente na empresa de origem
             if cod_empresa = StrToInt(vListaEmp[i]) then
             begin
               try
                 vdatasetCodigoEAN.Filtered := false;
                 vdatasetCodigoEAN.Filter := 'nitem = ' + IntToStr(vdataset.FieldByName('nitem').AsInteger);
                 vdatasetCodigoEAN.Filtered := true;

                 if not vdatasetCodigoEAN.IsEmpty then
                 begin
                   vdatasetCodigoEAN.First;
                   while not vdatasetCodigoEAN.Eof do
                   begin
                     vbuscasTmp.Close;
                     vbuscasTmp.SQL.Text := ' INSERT INTO PRODUTOS_CONVERSAO ' +
                        ' (GRUPO_PROD, COD_PROD, COD_EMPRESA, CODIGO_EAN, UNIDADE, QUANTIDADE) ' +
                        ' VALUES (:GRUPO_PROD, :COD_PROD, :COD_EMPRESA, :CODIGO_EAN, :UNIDADE, :QUANTIDADE); ';
                     if vCountGrupo = 1 then
                       vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vCodGrupo
                     else
                       vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vdataset.FieldByName('GRUPO_PROD').AsInteger;
                     vbuscasTmp.ParamByName('COD_PROD').AsString      := StrZero(vCodigo, vDigitosProd);

                     vbuscasTmp.ParamByName('COD_EMPRESA').AsInteger  := StrToInt(vListaEmp[i]);
                     vbuscasTmp.ParamByName('CODIGO_EAN').AsString    := UpperCase(trim(vdatasetCodigoEAN.FieldByName('CODIGO_EAN').AsString));
                     vbuscasTmp.ParamByName('UNIDADE').AsString       := UpperCase(trim(vdatasetCodigoEAN.FieldByName('UNIDADE').AsString));
                     vbuscasTmp.ParamByName('QUANTIDADE').AsFloat     := vdatasetCodigoEAN.FieldByName('QUANTIDADE').AsFloat;
                     vbuscasTmp.ExecSQL;

                     vdatasetCodigoEAN.Next;
                   end;
                 end;

               finally
                 vdatasetCodigoEAN.Filtered := false;
               end;
             end;

             vIncluirCodBarra := true;
             if vIdxUnqCodBarra then
             begin
               vbuscasTmp.Close;
               vbuscasTmp.SQL.Text := ' select cod_barra, grupo_prod, cod_prod, cod_empresa from cod_barra ' +
                 ' where cod_barra = ' + QuotedStr(IfThen(vUsarCodigoSequencialProduto = 'S',
                   StrZero(vCodigo, vDigitosProd), IntToStr(vdataset.FieldByName('GRUPO_PROD').AsInteger) + StrZero(vCodigo, vDigitosProd))) +
                 ' and cod_empresa = ' + vListaEmp[i];
               vbuscasTmp.Open;

               vIncluirCodBarra := vbuscasTmp.IsEmpty;
             end;

             if vIncluirCodBarra then
             begin
               vbuscasTmp.Close;
               vbuscasTmp.SQL.Text := ' INSERT INTO COD_BARRA ' +
                ' (COD_BARRA, GRUPO_PROD, COD_PROD, COD_EMPRESA, DAT_CAD_CDBAR, ATIVO) ' +
                ' VALUES ' +
                ' (:COD_BARRA, :GRUPO_PROD, :COD_PROD, :COD_EMPRESA, :DAT_CAD_CDBAR, :ATIVO); ';
               if vUsarCodigoSequencialProduto = 'S' then
                 vbuscasTmp.ParamByName('COD_BARRA').AsString := StrZero(vCodigo, vDigitosProd)
               else
                 vbuscasTmp.ParamByName('COD_BARRA').AsString :=
                  IntToStr(vdataset.FieldByName('GRUPO_PROD').AsInteger) + StrZero(vCodigo, vDigitosProd);
               if vCountGrupo = 1 then
                 vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vCodGrupo
               else
                 vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vdataset.FieldByName('GRUPO_PROD').AsInteger;
               vbuscasTmp.ParamByName('COD_PROD').AsString := StrZero(vCodigo, vDigitosProd);
               vbuscasTmp.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListaEmp[i]);
               vbuscasTmp.ParamByName('DAT_CAD_CDBAR').AsDate := Date;
               vbuscasTmp.ParamByName('ATIVO').AsInteger := 1;
               vbuscasTmp.ExecSQL;
             end;

             if (trim(vdataset.FieldByName('CPROD').AsString) <> '')
              and (trim(vdataset.FieldByName('NUM_FAB_PROD').AsString) <> trim(vdataset.FieldByName('CPROD').AsString)) then
             begin
               vIncluirCodBarra := true;
               if vIdxUnqCodBarra then
               begin
                 vbuscasTmp.Close;
                 vbuscasTmp.SQL.Text := ' select cod_barra, grupo_prod, cod_prod, cod_empresa from cod_barra ' +
                   ' where cod_barra = ' + QuotedStr(Copy(vdataset.FieldByName('CPROD').AsString, 1, 20)) +
                   ' and cod_empresa = ' + vListaEmp[i];
                 vbuscasTmp.Open;
                 vIncluirCodBarra := vbuscasTmp.IsEmpty;
               end;

               if vIncluirCodBarra then
               begin
                 vbuscasTmp.Close;
                 vbuscasTmp.SQL.Text := ' INSERT INTO COD_BARRA ' +
                  ' (COD_BARRA, GRUPO_PROD, COD_PROD, COD_EMPRESA, DAT_CAD_CDBAR, ATIVO) ' +
                  ' VALUES ' +
                  ' (:COD_BARRA, :GRUPO_PROD, :COD_PROD, :COD_EMPRESA, :DAT_CAD_CDBAR, :ATIVO); ';
                 vbuscasTmp.ParamByName('COD_BARRA').AsString := Copy(vdataset.FieldByName('CPROD').AsString, 1, 20);
                 if vCountGrupo = 1 then
                   vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vCodGrupo
                 else
                   vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vdataset.FieldByName('GRUPO_PROD').AsInteger;
                 vbuscasTmp.ParamByName('COD_PROD').AsString := StrZero(vCodigo, vDigitosProd);
                 vbuscasTmp.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListaEmp[i]);
                 vbuscasTmp.ParamByName('DAT_CAD_CDBAR').AsDate := Date;
                 vbuscasTmp.ParamByName('ATIVO').AsInteger := 1;
                 vbuscasTmp.ExecSQL;
               end;
             end;

             if (trim(vdataset.FieldByName('CEAN').AsString) <> '')
              and (trim(vdataset.FieldByName('NUM_FAB_PROD').AsString) <> trim(vdataset.FieldByName('CEAN').AsString))
              and (trim(vdataset.FieldByName('CPROD').AsString) <> trim(vdataset.FieldByName('CEAN').AsString)) then
             begin
               vIncluirCodBarra := true;
               if vIdxUnqCodBarra then
               begin
                 vbuscasTmp.Close;
                 vbuscasTmp.SQL.Text := ' select cod_barra, grupo_prod, cod_prod, cod_empresa from cod_barra ' +
                   ' where cod_barra = ' + QuotedStr(Copy(vdataset.FieldByName('CEAN').AsString, 1, 20)) +
                   ' and cod_empresa = ' + vListaEmp[i];
                 vbuscasTmp.Open;
                 vIncluirCodBarra := vbuscasTmp.IsEmpty;
               end;

               if vIncluirCodBarra then
               begin
                 vbuscasTmp.Close;
                 vbuscasTmp.SQL.Text := ' INSERT INTO COD_BARRA ' +
                  ' (COD_BARRA, GRUPO_PROD, COD_PROD, COD_EMPRESA, DAT_CAD_CDBAR, ATIVO) ' +
                  ' VALUES ' +
                  ' (:COD_BARRA, :GRUPO_PROD, :COD_PROD, :COD_EMPRESA, :DAT_CAD_CDBAR, :ATIVO); ';
                 vbuscasTmp.ParamByName('COD_BARRA').AsString := Copy(vdataset.FieldByName('CEAN').AsString, 1, 20);
                 if vCountGrupo = 1 then
                   vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vCodGrupo
                 else
                   vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vdataset.FieldByName('GRUPO_PROD').AsInteger;
                 vbuscasTmp.ParamByName('COD_PROD').AsString := StrZero(vCodigo, vDigitosProd);
                 vbuscasTmp.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListaEmp[i]);
                 vbuscasTmp.ParamByName('DAT_CAD_CDBAR').AsDate := Date;
                 vbuscasTmp.ParamByName('ATIVO').AsInteger := 1;
                 vbuscasTmp.ExecSQL;
               end;
             end;

             // Insere apenas na empresa de origem, pois não existe replicação interna da tabela PRODUTOS_FORN_NFE
             // o código do cliente nas outras empresa são diferentes
             if StrToInt(vListaEmp[i]) = cod_empresa then
             begin
               vbuscasTmp.Close;
               vbuscasTmp.SQL.Text := ' INSERT INTO PRODUTOS_FORN_NFE2 ' +
                 ' (COD_EMPRESA, CPFCGC, GRUPO_PROD, COD_PROD, NUM_FAB_FORNECEDOR, ATIVO, DATA_CADASTRO, COD_GRADE) ' +
                 ' VALUES ' +
                 ' (:COD_EMPRESA, :CPFCGC, :GRUPO_PROD, :COD_PROD, :NUM_FAB_FORNECEDOR, :ATIVO, :DATA_CADASTRO, :COD_GRADE); ';
               vbuscasTmp.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListaEmp[i]);
               vbuscasTmp.ParamByName('CPFCGC').AsString := Fcpfcgc;
               if vCountGrupo = 1 then
                 vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vCodGrupo
               else
                 vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vdataset.FieldByName('GRUPO_PROD').AsInteger;
               vbuscasTmp.ParamByName('COD_PROD').AsString := StrZero(vCodigo, vDigitosProd);
               vbuscasTmp.ParamByName('NUM_FAB_FORNECEDOR').AsString := vdataset.FieldByName('NUM_FAB_FORNECEDOR').AsString;
               vbuscasTmp.ParamByName('ATIVO').AsInteger := 1;
               vbuscasTmp.ParamByName('DATA_CADASTRO').AsDate := Date;
               vbuscasTmp.ExecSQL;
//               vbuscasTmp.Close;
//               vbuscasTmp.SQL.Text := ' INSERT INTO PRODUTOS_FORN_NFE ' +
//                 ' (COD_EMPRESA, COD_FORNECEDOR, GRUPO_PROD, COD_PROD, NUM_FAB_FORNECEDOR, ATIVO, DATA_CADASTRO, COD_GRADE) ' +
//                 ' VALUES ' +
//                 ' (:COD_EMPRESA, :COD_FORNECEDOR, :GRUPO_PROD, :COD_PROD, :NUM_FAB_FORNECEDOR, :ATIVO, :DATA_CADASTRO, :COD_GRADE); ';
//               vbuscasTmp.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListaEmp[i]);
//               vbuscasTmp.ParamByName('COD_FORNECEDOR').AsInteger := vCodCliente;
//               if vCountGrupo = 1 then
//                 vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vCodGrupo
//               else
//                 vbuscasTmp.ParamByName('GRUPO_PROD').AsInteger := vdataset.FieldByName('GRUPO_PROD').AsInteger;
//               vbuscasTmp.ParamByName('COD_PROD').AsString := StrZero(vCodigo, vDigitosProd);
//               vbuscasTmp.ParamByName('NUM_FAB_FORNECEDOR').AsString := vdataset.FieldByName('NUM_FAB_FORNECEDOR').AsString;
//               vbuscasTmp.ParamByName('ATIVO').AsInteger := 1;
//               vbuscasTmp.ParamByName('DATA_CADASTRO').AsDate := Date;
//               vbuscasTmp.ExecSQL;
             end;
           end;
        end;

        vdataset.Next;
      end;
      vdataset.First;

      mostrarmensagem('');

      vbuscasTmp.Close;
      vbuscasTmp.SQL.Text := ' SELECT CODIGO_GRUP, DESCRICAO FROM GRUPOS ' +
        ' WHERE CODIGO_GRUP = 0 ';
      vbuscasTmp.Open;

      if vbuscasTmp.IsEmpty then
      begin
        vbuscasTmp.Close;
        vbuscasTmp.SQL.Text := ' INSERT INTO GRUPOS (CODIGO_GRUP, DESCRICAO, ATIVO) ' +
          ' VALUES (0, ''CADASTRO PRODUTO IMPORTACAO XML'', 3); ';
        vbuscasTmp.ExecSQL;
      end;

      if vbuscasTmp.Transaction.InTransaction then
        vbuscasTmp.Transaction.Commit;
      Result := true;
    except on E: Exception do
      begin
        if vbuscasTmp.Transaction.InTransaction then
          vbuscasTmp.Transaction.Rollback;
        mostrarmensagem('');
        Application.MessageBox(PWideChar('Erro ao cadastrar produto: ' + e.Message), 'Atenção', 0 + 64);
        Result := false;
      end;
    end;
  finally
    vdataset.Filtered := false;    
    if vRecNo > 0 then
      vdataset.RecNo := vRecNo;
    vdataset.IndexFieldNames := 'NITEM';
    vdataset.EnableControls;
  end;
end;

procedure TVinculoProdutos.checarEstrutura;
begin
  try
    if FOwner.SqlOpen('select trim(f.rdb$field_name) campo, f.rdb$field_length tamanho from rdb$relation_fields r' +
                      ' join rdb$fields f on f.rdb$field_name = rdb$field_source' +
                      ' where (r.rdb$relation_name = ''NOTAFISCAL_ITEM'')' +
                      ' and (r.rdb$field_name=''NUM_FAB_FORNECEDOR'')').FieldByName('tamanho').AsInteger < 60 then
    begin
      FOwner.SqlExec('update RDB$FIELDS set RDB$FIELD_LENGTH = 60, RDB$CHARACTER_LENGTH = 60' +
                     ' where RDB$FIELD_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields r' +
                     ' join rdb$fields f on f.rdb$field_name = rdb$field_source' +
                     ' where (r.rdb$relation_name = ''NOTAFISCAL_ITEM'') and (r.rdb$field_name=''NUM_FAB_FORNECEDOR''))');
      if FOwner.buscas.Transaction.InTransaction then
        FOwner.buscas.Transaction.Commit;
    end;
    FOwner.buscas.Close;
  except
  end;
end;

function TVinculoProdutos.consultarProduto(Acampo, Acondicao, Atexto: string): Boolean;
begin
  Result := False;
  try
    if Atexto.Trim.IsEmpty then
      raise Exception.Create('Informe o código ou descrição para consulta')
    else if (Acondicao.Equals('Começa') and (Atexto.Trim.Length < 2)) then
      raise Exception.Create('Informe pelo menos 2 caracteres para a condição "Começa"')
    else if (Acondicao.Equals('Está contido') and (Atexto.Trim.Length < 3)) then
      raise Exception.Create('Informe pelo menos 3 caracteres para a condição "Está contido"');

    if Acondicao.Equals('Começa') then
      Atexto :=  Atexto + '%'
    else if Acondicao.Equals('Está contido') then
      Atexto :=  '%' + Atexto + '%';

    FconsProd.Close;
    FconsProd.SQL.Text := 'select ' +
                          IfThen(Acampo.Equals('Codigo'), 'cb.cod_barra', 'pr.num_fab_prod') +
                          IfThen(Acampo.Equals('Codigo'), '"Cod Barras"', '"Num Fab"') + ', ' +
                          ' pr.descr_prod "Descrição", pr.unidade "Und",' +
                          ' pr.grupo_prod "Grupo", pr.cod_prod "Codigo", pr.nbm "NCM", pr.cst_prod "CST",' +
                          ' pr.codigo_nop "CFOP", pr.marca_p "Marca", pr.aplicacao_prod "Aplicação", pr.prec_tab_prod "Preço tabela"' +
                          ' from produtos pr' +
                          IfThen(Acampo.Equals('Codigo'), ' inner join cod_barra cb on cb.grupo_prod = pr.grupo_prod and cb.cod_prod = pr.cod_prod and cb.cod_empresa = pr.cod_empresa and cb.ativo = 1') +
                          IfThen(Acampo.Equals('Codigo'),
                          ' where cb.cod_barra ' + IfThen(Acondicao.Equals('Igual'), '= ', 'like ') + Atexto.QuotedString,
                          ' where pr.descr_prod ' + IfThen(Acondicao.Equals('Igual'), '= ', 'like ') + Atexto.QuotedString) +
                          ' and pr.cod_empresa = ' + Fcod_empresa.ToString +
                          ' and pr.ativo = 1' +
                          ' order by pr.descr_prod';
    FconsProd.Open;
    Result := not FconsProd.IsEmpty;

  except on E: Exception do
    begin
      Application.MessageBox(PWideChar(Format('Erro ao consultar. Erro: %s', [e.Message])), 'Atenção', 0 + 64);
    end;
  end;
end;

function TVinculoProdutos.consultarProdutoTmp(ADtSet: TDataSet; Acampo, Acondicao,
  Atexto: string): Boolean;
var
  vcampo: string;
  vpesquisa: string;
begin
 Result := False;
  try
    if Acampo = 'Codigo' then
      vcampo := 'num_fab_fornecedor'
    else
      vcampo := 'descricao_item';

    try
      ADtSet.DisableControls;
      if ADtSet.Eof then
        ADtSet.First;
      while not ADtSet.Eof do
      begin
        if Acondicao.Equals('Começa') then
        begin
          if (Copy(trim(Atexto), 1, Length(trim(Atexto))) = Copy(trim(ADtSet.FieldByName(vcampo).AsString), 1, Length(trim(Atexto)))) then
            Break;
        end
        else if Acondicao.Equals('Está contido') then
        begin
          if Pos(Atexto, ADtSet.FieldByName(vcampo).AsString) > 0 then
            Break;
        end
        else
        begin
          if (trim(Atexto) = trim(ADtSet.FieldByName(vcampo).AsString)) then
            Break;
        end;

        ADtSet.Next;
      end;
    finally
      ADtSet.EnableControls;
    end;
  except on E: Exception do
    begin
      Application.MessageBox(PWideChar(Format('Erro ao consultar. Erro: %s', [e.Message])), 'Atenção', 0 + 64);
    end;
  end;
end;

function TVinculoProdutos.consultarProdutoXML(ADtSet: TDataSet; Acampo, Atexto: string): Boolean;
var
  vtemp: string;
begin
 Result := False;
  try
    if Acampo = 'Codigo' then
      vtemp := 'cprod_ean'
    else
      vtemp := 'descr_prod';


    ADtSet.Locate(vtemp, Atexto, [loCaseInsensitive, loPartialKey]);

  except on E: Exception do
    begin
      Application.MessageBox(PWideChar(Format('Erro ao consultar. Erro: %s', [e.Message])), 'Atenção', 0 + 64);
    end;
  end;
end;

constructor TVinculoProdutos.Create(AOwner: TClassNfVenda);
begin
  FOwner := AOwner;
  FconsProd := TIBQuery.Create(FOwner.buscas.Owner);
  FconsProd.Database :=FOwner.buscas.Database;
  FconsProd.Transaction :=FOwner.buscas.Transaction;

  buscasTmp := TIBQuery.Create(FOwner.buscas.Owner);
  buscasTmp.Database :=FOwner.buscas.Database;
  buscasTmp.Transaction :=FOwner.buscas.Transaction;

  Fdetalhes := TObjectList<TDetImportaItem>.Create();
end;

destructor TVinculoProdutos.Destroy;
begin
  if Assigned(Fdetalhes) then
  begin
    Fdetalhes.Clear;
    FreeAndNil(Fdetalhes);
  end;
  if Assigned(FconsProd) then
    FreeAndNil(FconsProd);
  inherited;
end;

function TVinculoProdutos.DesVincular(Anitem, AindexProd: Integer): Boolean;
var
  Aitem: TNotafiscal_item_class;
  I, J: Integer;
  Acprod, Asql: string;
  Aprod: TProdutos_class;
begin
  try
    Acprod := '';
    for I := 0 to Fdetalhes.Count - 1 do
      if Fdetalhes[I].item.nitem = Anitem then
      begin
        Acprod := Fdetalhes[I].item.num_fab_fornecedor;
        if (AindexProd < 0) or ( AindexProd > Fdetalhes[I].outs.Count -1) then
          Exit;

        Aprod  := Fdetalhes[I].outs.Items[AindexProd].Clone;
        if not Assigned(Aprod) then
          Exit;
        Break;
      end;

    if (Acprod.Trim.IsEmpty) or (not Assigned(Aprod)) then
      Exit;

    try
      Asql := 'delete from codigo_fornecedor' +
              ' where grupo_prod = ' + Aprod.grupo_prod.ToString +
              ' and cod_prod = ' + Aprod.cod_prod.QuotedString +
              ' and num_fab_fornecedor = ' + Acprod.QuotedString +
              ' and cod_fornecedor = ' + Fcod_cliente.ToString;
      FOwner.SqlExec(Asql);

      Asql := 'delete from produtos_forn_nfe' +
              ' where grupo_prod = ' + Aprod.grupo_prod.ToString +
              ' and cod_prod = ' + Aprod.cod_prod.QuotedString +
              ' and num_fab_fornecedor = ' + Acprod.QuotedString +
              ' and cod_fornecedor = ' + Fcod_cliente.ToString;
      FOwner.SqlExec(Asql);

      Asql := 'delete from produtos_forn_nfe2' +
              ' where grupo_prod = ' + Aprod.grupo_prod.ToString +
              ' and cod_prod = ' + Aprod.cod_prod.QuotedString +
              ' and num_fab_fornecedor = ' + Acprod.QuotedString +
              ' and cpfcgc = ' + QuotedStr(Fcpfcgc);
      FOwner.SqlExec(Asql);

      if FOwner.buscas.Transaction.InTransaction then
        FOwner.buscas.Transaction.Commit;

    except on E: Exception do
      begin
        if FOwner.buscas.Transaction.InTransaction then
          FOwner.buscas.Transaction.Rollback;

        Application.MessageBox(PWideChar('Erro ao vincular. Erro ' + e.Message), 'Atenção', 64);
        FOwner.registraErro('TVinculoProdutos.Vincular ' + E.Message);
      end;
    end;

    for I := 0 to Fdetalhes.Count - 1 do
      if Fdetalhes[I].item.num_fab_fornecedor.Trim.Equals(Acprod.Trim) then
      begin

        if Assigned(Fdetalhes[I].prod) then
          if (Fdetalhes[I].prod.grupo_prod = Aprod.grupo_prod) and
             (Fdetalhes[I].prod.cod_prod.Trim.Equals(Aprod.cod_prod.Trim)) then
          begin
            Fdetalhes[I].prod := nil;
            Fdetalhes[I].item.grupo_prod   := 0;
            Fdetalhes[I].item.cod_prod     := '';
            Fdetalhes[I].item.num_fab_prod := '';
            Fdetalhes[I].unid_prin    := '';
            Fdetalhes[I].prod_vinc    := 'N';
          end;

        for J := Fdetalhes[I].outs.Count - 1 downto 0 do
          if (Fdetalhes[I].outs.Items[J].grupo_prod = Aprod.grupo_prod) and
             (Fdetalhes[I].outs.Items[J].cod_prod.Trim.Equals(Aprod.cod_prod.Trim)) then
            Fdetalhes[I].outs.Delete(J);

        if (not Assigned(Fdetalhes[I].prod)) and (Fdetalhes[I].outs.Count > 0) then
        begin
            Fdetalhes[I].prod := Fdetalhes[I].outs.Items[0].Clone;
            Fdetalhes[I].item.grupo_prod   := Fdetalhes[I].prod.grupo_prod;
            Fdetalhes[I].item.cod_prod     := Fdetalhes[I].prod.cod_prod;
            Fdetalhes[I].item.num_fab_prod := Fdetalhes[I].prod.num_fab_prod;
            Fdetalhes[I].unid_prin         := Fdetalhes[I].prod.unidade;
            Fdetalhes[I].prod_vinc    := 'S';
        end;
      end;

  finally
    if Assigned(Aprod) then
      FreeAndNil(Aprod);
  end;
end;

procedure TVinculoProdutos.MostrarMensagem(vmens: string);
begin
  if FrmStatusNFSe = nil then
  begin
   FrmStatusNFSe :=TFrmStatusNFSe.Create(Application);
   FrmStatusNFSe.BorderStyle := bsDialog;
   FrmStatusNFSe.Caption := 'Status';
   FrmStatusNFSe.Position := poScreenCenter;
   FrmStatusNFSe.Width := 489;
   FrmStatusNFSe.Height := 72;
  end;
  if ( FrmStatusNFSe <> nil ) then
  begin
    if vmens = '' then
    begin
     FrmStatusNFSe.Hide;
     application.ProcessMessages;
    end
    else
    begin
     FrmStatusNFSe.lblStatus.Caption := vmens;
     FrmStatusNFSe.Show;
     FrmStatusNFSe.BringToFront;
     application.ProcessMessages;
    end;
  end;
end;

function TVinculoProdutos.NewDetItem(Acprod, Acean: string): TDetImportaItem;
begin
  Result := TDetImportaItem.Create;

  Result.item := TNotafiscal_item_class.Create;

  var  qr := FOwner.SqlOpen('select ' + TProdutos_class.GetFieldsSql('p') + ' from produtos p' +
                        ' inner join vw_produtos_conversao pc on pc.grupo_prod = p.grupo_prod and pc.cod_prod = p.cod_prod and pc.cod_empresa = p.cod_empresa' +
                        ' where pc.codigo_ean = ' + QuotedStr(Acean) +
                        ' and pc.codigo_ean <> ''''' +
                        ' and p.ativo = 1 and p.cod_empresa = ' + Fcod_empresa.ToString);
  if qr.RecordCount > 0 then
  begin
    Result.item.grupo_prod   := FOwner.buscas.FieldByName('grupo_prod').AsInteger;
    Result.item.cod_prod     := FOwner.buscas.FieldByName('cod_prod').AsString.Trim;
    Result.item.num_fab_prod := FOwner.buscas.FieldByName('num_fab_prod').AsString.Trim;

    Result.unid_prin         := FOwner.buscas.FieldByName('unidade').AsString.Trim;
    Result.prod_vinc    := 'S';

    Result.eans := TProdutos_classList.Create;

    FOwner.buscas.First;
    while not FOwner.buscas.Eof do
    begin
      with Result.eans.New do
        SetValuesFrom(FOwner.buscas);
      FOwner.buscas.Next;
    end;
  end;

//  if (Result.item.grupo_prod = 0) and (Result.item.cod_prod.IsEmpty) then
  if Result.prod_vinc <> 'S' then
  begin
    if FbuscaNoProd then
    begin
      if not FOwner.SqlOpen('select ' + TProdutos_class.GetFieldsSql('p') + ' from cod_barra cb' +
                     ' inner join produtos p on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
                     ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
                     ' where cod_barra = '+ Acprod.Trim.QuotedString +
                     ' and p.ativo = 1 and cb.ativo = 1 and cb.cod_empresa = ' + Fcod_empresa.ToString).IsEmpty then
      begin
        Result.item.grupo_prod   := FOwner.buscas.FieldByName('grupo_prod').AsInteger;
        Result.item.cod_prod     := FOwner.buscas.FieldByName('cod_prod').AsString.Trim;
        Result.item.num_fab_prod := FOwner.buscas.FieldByName('num_fab_prod').AsString.Trim;

        Result.unid_prin    := FOwner.buscas.FieldByName('unidade').AsString.Trim;
        Result.prod_vinc    := 'S';

        Result.outs := TProdutos_classList.Create;

        FOwner.buscas.First;
        while not FOwner.buscas.Eof do
        begin
          with Result.outs.New do
            SetValuesFrom(FOwner.buscas);
          FOwner.buscas.Next;
        end;
      end;
    end;
  end;

//  if (Result.item.grupo_prod = 0) and (Result.item.cod_prod.IsEmpty) then
  if Result.prod_vinc <> 'S' then
  begin
//    if not FOwner.SqlOpen('select cf.grupo_prod, cf.cod_prod, cf.num_fab_fornecedor, cf.cod_grade,' +
////                 ' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from codigo_fornecedor cf' +
//                   TProdutos_class.GetFieldsSql('p') + ' from codigo_fornecedor_vw cf' +
//                   ' inner join produtos p on p.grupo_prod = cf.grupo_prod and p.cod_prod = cf.cod_prod and p.cod_empresa = cf.cod_empresa ' +
//                   ' where cf.num_fab_fornecedor = ' + Acprod.QuotedString +
//                   ' and cf.cod_fornecedor = ' + Fcod_cliente.ToString +
//                   ' and cf.cod_empresa = ' + Fcod_empresa.ToString +
//                   ' and p.ativo = 1').IsEmpty then
    if not FOwner.SqlOpen('select cf.grupo_prod, cf.cod_prod, cf.num_fab_fornecedor, cf.cod_grade,' +
//                 ' p.num_fab_prod, p.descr_prod, p.unidade, p.consumo, p.ecf from codigo_fornecedor cf' +
                   TProdutos_class.GetFieldsSql('p') + ' from codigo_fornecedor_vw cf' +
                   ' inner join produtos p on p.grupo_prod = cf.grupo_prod and p.cod_prod = cf.cod_prod and p.cod_empresa = cf.cod_empresa ' +
                   ' where cf.num_fab_fornecedor = ' + Acprod.QuotedString +
                   ' and cf.cpfcgc = ' + QuotedStr(Fcpfcgc) +
                   ' and cf.cod_empresa = ' + Fcod_empresa.ToString +
                   ' and p.ativo = 1').IsEmpty then
    begin
      Result.item.grupo_prod   := FOwner.buscas.FieldByName('grupo_prod').AsInteger;
      Result.item.cod_prod     := FOwner.buscas.FieldByName('cod_prod').AsString.Trim;
      Result.item.num_fab_prod := FOwner.buscas.FieldByName('num_fab_prod').AsString.Trim;

      Result.unid_prin    := FOwner.buscas.FieldByName('unidade').AsString.Trim;
      Result.prod_vinc    := 'S';

      Result.outs := TProdutos_classList.Create;

      FOwner.buscas.First;
      while not FOwner.buscas.Eof do
      begin
        with Result.outs.New do
          SetValuesFrom(FOwner.buscas);
        FOwner.buscas.Next;
      end;
    end;
  end;

//  if (Result.item.grupo_prod > 0) and (not Result.item.cod_prod.IsEmpty) then
  if Result.prod_vinc = 'S' then
  begin
    if not FOwner.SqlOpen('select ' + TProdutos_class.GetFieldsSql() + ' from produtos' +
            ' where grupo_prod = ' + Result.item.grupo_prod.ToString +
            ' and cod_prod = ' + Result.item.cod_prod.QuotedString +
            ' and cod_empresa = ' + Fcod_empresa.ToString).IsEmpty then
    begin
      Result.prod := TProdutos_class.Create;
      Result.prod.SetValuesFrom(FOwner.buscas);
      FOwner.buscas.Close;
    end;
  end;

  Fdetalhes.Add(Result);
end;

function TVinculoProdutos.RemoverVinculoProdutoXML(vdataset: TClientDataSet): boolean;
var
   vOK: boolean;
   vbuscasTmp: TIBQuery;
   vRecNo: Integer;
   vListaEmp: TStringList;
   vReplicacaoInterna: boolean;
   I: Integer;
begin
  try
    vReplicacaoInterna := false;

     vdataset.DisableControls;
     if vdataset.RecordCount > 0 then
       vRecNo := vdataset.RecNo
     else
       vRecNo := 0;     
     vdataset.Filtered := false;
     vdataset.Filter := 'sel = ''S'' ';
     vdataset.Filtered := true;

     Result := false;

     vListaEmp := TStringList.Create;
     vListaEmp.Duplicates := dupIgnore;
     vListaEmp.Clear;

     vbuscasTmp := TIBQuery.Create(Application);
     vbuscasTmp.Database := FconsProd.Database;
     vbuscasTmp.Transaction := FconsProd.Transaction;

     vbuscasTmp.Close;
     vbuscasTmp.SQL.Text := ' select * from TAB_REP where TABELA = ''PRODUTOS'' ';
     vbuscasTmp.open;
     vReplicacaoInterna := not vbuscasTmp.IsEmpty;

     vListaEmp.Add(IntToStr(cod_empresa));
     if vReplicacaoInterna then
     begin
       vbuscasTmp.close;
       vbuscasTmp.sql.Text := ' select cod_empresa, ' +
        ' coalesce(emp_repl_interna, ' + IntToStr(cod_empresa) + ') emp_repl_interna from EMPRESA ' +
        ' where ativo = 1 and cod_empresa <> ' + IntToStr(cod_empresa);
       vbuscasTmp.Open;
       vbuscasTmp.FetchAll;

       vbuscasTmp.First;
       while not vbuscasTmp.Eof do
       begin
         if vbuscasTmp.FieldByName('EMP_REPL_INTERNA').AsInteger = cod_empresa then
           vListaEmp.Add(IntToStr(vbuscasTmp.FieldByName('COD_EMPRESA').AsInteger));

         vbuscasTmp.Next;
       end;
     end;

     vdataset.First;
     while not vdataset.Eof do
     begin
       if (vdataset.FieldByName('sel').AsString = 'S') and (trim(vdataset.FieldByName('cod_prod').AsString) <> '') then
       begin
         vOK := true;
         Break;
       end;

       vdataset.Next;
     end;
     vdataset.First;

     if not vOK then
     begin
       Application.MessageBox(PWideChar('Nenhum produto com vinculo selecionado!'),PWideChar('Aviso'), MB_OK);
       Result := false;
       exit;
     end;

     if Application.MessageBox(PChar('Deseja remover o vinculo dos produtos selecionados?'),
       'Atenção', mb_yesno + MB_DEFBUTTON2) <> IDYES then
     begin
       Result := false;
       exit;
     end;

    try
      mostrarmensagem('Removendo vínculo produtos');
      
      vdataset.DisableControls;
      vdataset.First;
      while not vdataset.Eof do
      begin
        mostrarmensagem('Removendo vínculo produtos (' + IntToStr(vdataset.RecNo) + '/' + IntToStr(vdataset.RecordCount) + ')');

         if (vdataset.FieldByName('sel').AsString = 'S') and (trim(vdataset.FieldByName('cod_prod').AsString) <> '') then
         begin
           for I := 0 to vListaEmp.Count - 1 do
           begin
             if StrToInt(vListaEmp[i]) = cod_empresa then
             begin
               vbuscasTmp.Close;
               vbuscasTmp.SQL.Text := 'delete from codigo_fornecedor' +
                 ' where cod_fornecedor = ' + IntToStr(cod_cliente) +
                 ' and grupo_prod = ' + IntToStr(vdataset.FieldByName('grupo_prod').AsInteger) +
                 ' and cod_prod = ' + QuotedStr(vdataset.FieldByName('cod_prod').AsString) +
                 ' and cod_empresa = ' + vListaEmp[i] +
                 ' and num_fab_fornecedor = ' + QuotedStr(vdataset.FieldByName('num_fab_fornecedor').AsString);
               vbuscasTmp.ExecSQL;

               vbuscasTmp.Close;
               vbuscasTmp.SQL.Text := 'delete from produtos_forn_nfe' +
                 ' where cod_fornecedor = ' + IntToStr(cod_cliente) +
                 ' and grupo_prod = ' + IntToStr(vdataset.FieldByName('grupo_prod').AsInteger) +
                 ' and cod_prod = ' + QuotedStr(vdataset.FieldByName('cod_prod').AsString) +
                 ' and cod_empresa = ' + vListaEmp[i] +
                 ' and num_fab_fornecedor = ' + QuotedStr(vdataset.FieldByName('num_fab_fornecedor').AsString);
               vbuscasTmp.ExecSQL;

               vbuscasTmp.Close;
               vbuscasTmp.SQL.Text := 'delete from produtos_forn_nfe2' +
                 ' where cpfcgc = ' + QuotedStr(cpfcgc) +
                 ' and grupo_prod = ' + IntToStr(vdataset.FieldByName('grupo_prod').AsInteger) +
                 ' and cod_prod = ' + QuotedStr(vdataset.FieldByName('cod_prod').AsString) +
                 ' and cod_empresa = ' + vListaEmp[i] +
                 ' and num_fab_fornecedor = ' + QuotedStr(vdataset.FieldByName('num_fab_fornecedor').AsString);
               vbuscasTmp.ExecSQL;
             end;
           end;
         end;
         vdataset.Next;
      end;
      vdataset.First;

      mostrarmensagem('');

      if vbuscasTmp.Transaction.InTransaction then
        vbuscasTmp.Transaction.Commit;

      Result := true;
    except on E: Exception do
      begin
        if vbuscasTmp.Transaction.InTransaction then
          vbuscasTmp.Transaction.Rollback;
        mostrarmensagem('');
        Application.MessageBox(PWideChar('Erro ao vincular. Erro ' + e.Message), 'Atenção', 64);
        FOwner.registraErro('TVinculoProdutos.Vincular ' + E.Message);
      end;
    end;
  finally
    vdataset.Filtered := false;    
    if vRecNo > 0 then
      vdataset.RecNo := vRecNo;
    vdataset.IndexFieldNames := 'NITEM';
    vdataset.EnableControls;    
  end;
end;

function TVinculoProdutos.SetarUnidadePrincipal(Anitem: Integer;
  undSel: string): Boolean;
var
  I: Integer;
  cprodnItem: string;
begin
  if undSel.Trim.IsEmpty  then
    Exit;

  cprodnItem := '';
  for I := 0 to Fdetalhes.Count - 1 do
    if (Fdetalhes[I].item.nitem = Anitem)
      and (Fdetalhes[I].prod_vinc <> 'S') then
    begin
      Fdetalhes[I].unid_prin := undSel;
      cprodnItem := Fdetalhes[I].cprod.Trim;
      Break;
    end;

  if not cprodnItem.IsEmpty then
    for I := 0 to Fdetalhes.Count - 1 do
      if (Fdetalhes[I].item.nitem <> Anitem)
        and (Fdetalhes[I].cprod = cprodnItem)
        and (Fdetalhes[I].prod_vinc <> 'S') then
      begin
        Fdetalhes[I].unid_prin := undSel;
      end;
end;

function TVinculoProdutos.SetarUnidadePrincipalParaTodos(
  undSel: string): Boolean;
var
  I: Integer;
begin
  if undSel.Trim.IsEmpty  then
    Exit;

  for I := 0 to Fdetalhes.Count - 1 do
    if (Fdetalhes[I].prod_vinc <> 'S') then
    begin
      Fdetalhes[I].unid_prin := undSel;
    end;
end;

function TVinculoProdutos.SetarUnidadePrincipalTodosFaltantes(
  undSel: string): Boolean;
var
  I: Integer;
begin
  if undSel.Trim.IsEmpty  then
    Exit;

  for I := 0 to Fdetalhes.Count - 1 do
    if (Fdetalhes[I].unid_prin.Trim.IsEmpty)
      and (Fdetalhes[I].prod_vinc <> 'S') then
    begin
      Fdetalhes[I].unid_prin := undSel;
    end;
end;

function TVinculoProdutos.SetarUnidadePrincipalTodosFaltantesMesmaXml: Boolean;
var
  I: Integer;
begin
  for I := 0 to Fdetalhes.Count - 1 do
    if (Fdetalhes[I].unid_prin.Trim.IsEmpty)
      and (Fdetalhes[I].prod_vinc <> 'S') then
    begin
      Fdetalhes[I].unid_prin := Fdetalhes.Items[I].item.ucom.ToUpper();
    end;
end;

function TVinculoProdutos.ValidarVinculos(pClassNfVenda: TClassNfVenda; pDigitosProd: Integer;
  pUsarCodigoSequencialProduto: string; pCadProdAberto: string;
  pAUsuario: string; pNivel: Integer; pCodCliente: Integer; pCNPJ: string;
  pUFDest: string; pSimplesNacional: boolean; pChaveAcesso: string): string;
var
 vShowModal: Integer;
begin
  vDigitosProd                 := pDigitosProd;
  vUsarCodigoSequencialProduto := pUsarCodigoSequencialProduto;
  vCadProdAberto               := pCadProdAberto;
  vUsuario                     := pAUsuario;
  vNivel                       := pNivel;
  vCodCliente                  := pCodCliente;
  vCNPJ                        := pCNPJ;
  vUFDest                      := pUFDest;
  vSimplesNacional             := pSimplesNacional;
  vClassNfVenda                := pClassNfVenda;
  Application.CreateForm(TfrmVinculoProdutos, frmVinculoProdutos);
  frmVinculoProdutos.Caption := 'Vinculo Itens NF-e com Produtos - ' + pChaveAcesso;
  frmVinculoProdutos.vincProd := Self;
  checarEstrutura;
  vShowModal := frmVinculoProdutos.ShowModal;
  if vShowModal = mrOk then
    Result := 'OK'
  else if vShowModal = mrYes then
    Result := 'CADASTRARPROD'
  else if vShowModal = mrRetry then
    Result := 'REMOVERVINCPROD'
  else
    Result := 'ERRO';
end;

function TVinculoProdutos.Vincular(Anitem: Integer): Boolean;
var
  Aitem: TNotafiscal_item_class;
  I: Integer;
  Acprod, Asql: string;
  Aprod: TProdutos_class;
begin
  if FconsProd.IsEmpty then
    Exit;

  try

    Acprod := '';
    for I := 0 to Fdetalhes.Count - 1 do
      if Fdetalhes[I].item.nitem = Anitem then
      begin
        if not FOwner.SqlOpen('select ' + TProdutos_class.GetFieldsSql() + ' from produtos' +
            ' where grupo_prod = ' + FconsProd.FieldByName('grupo').AsInteger.ToString +
            ' and cod_prod = ' + FconsProd.FieldByName('codigo').AsString.QuotedString +
            ' and cod_empresa = ' + Fcod_empresa.ToString).IsEmpty then
        begin
          Acprod := Fdetalhes[I].item.num_fab_fornecedor;

          Aprod := TProdutos_class.Create;
          Aprod.SetValuesFrom(FOwner.buscas);

          if not Assigned(Fdetalhes[I].prod) then
            Fdetalhes[I].prod := TProdutos_class.Create;
          Fdetalhes[I].prod := Aprod.Clone;
          Fdetalhes[I].item.grupo_prod   := Fdetalhes[I].prod.grupo_prod;
          Fdetalhes[I].item.cod_prod     := Fdetalhes[I].prod.cod_prod;
          Fdetalhes[I].item.num_fab_prod := Fdetalhes[I].prod.num_fab_prod;
          //Fdetalhes[I].item.referencia   := Fdetalhes[I].prod.unidade;

          Fdetalhes[I].unid_prin    := Fdetalhes[I].prod.unidade;
          Fdetalhes[I].prod_vinc    := 'S';
          if not Assigned(Fdetalhes[I].outs) then
            Fdetalhes[I].outs := TProdutos_classList.Create;
          Fdetalhes[I].outs.Add(Aprod.Clone);

          try
            Asql :=       ('delete from codigo_fornecedor' +
                           ' where grupo_prod = ' + Fdetalhes[I].prod.grupo_prod.ToString +
                           ' and cod_prod = ' + Fdetalhes[I].prod.cod_prod.QuotedString +
                           ' and num_fab_fornecedor = ' + Fdetalhes[I].item.num_fab_fornecedor.QuotedString +
                           ' and cod_fornecedor = ' +  Fcod_cliente.ToString);
            FOwner.SqlExec(Asql);

            Asql :=       ('delete from produtos_forn_nfe' +
                           ' where grupo_prod = ' + Fdetalhes[I].prod.grupo_prod.ToString +
                           ' and cod_prod = ' + Fdetalhes[I].prod.cod_prod.QuotedString +
                           ' and num_fab_fornecedor = ' + Fdetalhes[I].item.num_fab_fornecedor.QuotedString +
                           ' and cod_fornecedor = ' +  Fcod_cliente.ToString);
            FOwner.SqlExec(Asql);

            Asql :=       ('delete from produtos_forn_nfe2' +
                           ' where grupo_prod = ' + Fdetalhes[I].prod.grupo_prod.ToString +
                           ' and cod_prod = ' + Fdetalhes[I].prod.cod_prod.QuotedString +
                           ' and num_fab_fornecedor = ' + Fdetalhes[I].item.num_fab_fornecedor.QuotedString +
                           ' and cpfcgc = ' +  QuotedStr(Fcpfcgc));
            FOwner.SqlExec(Asql);

            if FOwner.SqlExec('insert into produtos_forn_nfe2' +
                              ' (cpfcgc, grupo_prod, cod_prod, cod_empresa, num_fab_fornecedor)' +
                              ' values (' +
                              QuotedStr(Fcpfcgc) + ', ' +
                              Fdetalhes[I].prod.grupo_prod.ToString + ', ' +
                              Fdetalhes[I].prod.cod_prod.QuotedString + ', ' +
                              Fcod_empresa.ToString + ', ' +
                              Fdetalhes[I].item.num_fab_fornecedor.Substring(0, 60).QuotedString + ')').Transaction.InTransaction then
//            if FOwner.SqlExec('insert into produtos_forn_nfe' +
//                              ' (cod_fornecedor, grupo_prod, cod_prod, cod_empresa, num_fab_fornecedor)' +
//                              ' values (' +
//                              Fcod_cliente.ToString + ', ' +
//                              Fdetalhes[I].prod.grupo_prod.ToString + ', ' +
//                              Fdetalhes[I].prod.cod_prod.QuotedString + ', ' +
//                              Fcod_empresa.ToString + ', ' +
//                              Fdetalhes[I].item.num_fab_fornecedor.Substring(0, 60).QuotedString + ')').Transaction.InTransaction then
              FOwner.buscas.Transaction.Commit;
          except on E: Exception do
            begin
              if FOwner.buscas.Transaction.InTransaction then
                FOwner.buscas.Transaction.Rollback;

              Application.MessageBox(PWideChar('Erro ao vincular. Erro ' + e.Message), 'Atenção', 64);
              FOwner.registraErro('TVinculoProdutos.Vincular ' + E.Message);
            end;
          end;
        end;
      end;

    if (Acprod <> '') and (Assigned(Aprod)) then
      for I := 0 to Fdetalhes.Count - 1 do
        if (Fdetalhes[I].item.num_fab_fornecedor = Acprod) and (not Assigned(Fdetalhes[I].eans)) then
          if Fdetalhes[I].item.nitem <> Anitem then
//            if Application.MessageBox(PWideChar(Format('Mesmo codigo %s para o item %d - %s da NF-e. Alterar também?', [Fdetalhes[I].item.num_fab_fornecedor, Fdetalhes[I].item.nitem, Fdetalhes[I].item.descricao_item])),
//                                      'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
          begin
            if not Assigned(Fdetalhes[I].prod) then
            begin
              Fdetalhes[I].prod := TProdutos_class.Create;
              Fdetalhes[I].prod := Aprod.Clone;
              Fdetalhes[I].item.grupo_prod   := Aprod.grupo_prod;
              Fdetalhes[I].item.cod_prod     := Aprod.cod_prod;
              Fdetalhes[I].item.num_fab_prod := Aprod.num_fab_prod;
              //Fdetalhes[I].item.referencia   := Aprod.unidade;

              Fdetalhes[I].unid_prin    := Aprod.unidade;
              Fdetalhes[I].prod_vinc    := 'S';
            end;

            if not Assigned(Fdetalhes[I].outs) then
              Fdetalhes[I].outs := TProdutos_classList.Create;
            Fdetalhes[I].outs.Add(Aprod.Clone);
          end;
  finally
    if Assigned(Aprod) then
      FreeAndNil(Aprod);
  end;
end;

procedure TVinculoProdutos._marcaDesmarcaLinhaProdutoXML(ADtSet: TDataSet);
begin
  if ADtSet.IsEmpty then
    exit;

  ADtSet.Edit;
  if ADtSet.FieldByName('SEL').AsString = 'S' then
    ADtSet.FieldByName('SEL').AsString := ''
  else
    ADtSet.FieldByName('SEL').AsString := 'S';
  ADtSet.Post;
end;

procedure TVinculoProdutos._marcaDesmarcaTodosProdutosXML(ADtSet: TDataSet; pMarcar: boolean = true);
var
  vRecNo: Integer;
begin
  if ADtSet.IsEmpty then
    exit;

  try
    if pMarcar then
      mostrarmensagem('Aguarde. Selecionando todos os registros')
    else
      mostrarmensagem('Aguarde. Desfazendo a seleção de todos os registros');

    vRecNo := ADtSet.RecNo;
    ADtSet.DisableControls;
    ADtSet.First;
    while not ADtSet.Eof do
    begin
      if pMarcar then
        mostrarmensagem('Aguarde. Selecionando todos os registros (' + IntToStr(ADtSet.RecNo) + '/' + IntToStr(ADtSet.RecordCount) + ')')
      else
        mostrarmensagem('Aguarde. Desfazendo a seleção de todos os registros  (' + IntToStr(ADtSet.RecNo) + '/' + IntToStr(ADtSet.RecordCount) + ')');

      ADtSet.Edit;
      if pMarcar then
        ADtSet.FieldByName('SEL').AsString := 'S'
      else
        ADtSet.FieldByName('SEL').AsString := '';
      ADtSet.Post;

      ADtSet.Next;
    end;
  finally
    mostrarmensagem('');
    ADtSet.First;
    ADtSet.RecNo := vRecNo;
    ADtSet.EnableControls;
  end;
end;

{ TDetImportaItem }

destructor TDetImportaItem.Destroy;
begin
  if Assigned(Fitem) then
    FreeAndNil(Fitem);

  if Assigned(Fprod) then
    FreeAndNil(Fprod);

  if Assigned(Feans) then
    FreeAndNil(Feans);

  if Assigned(Fouts) then
    FreeAndNil(Fouts);
  inherited;
end;

(*
{ TClassNFSeAbaco }

procedure TClassNFSeAbaco.copiarschemas(tpAmb: string);
begin
  fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Abaco';
  inherited;
end;

constructor TClassNFSeAbaco.create;
begin

end;

destructor TClassNFSeAbaco.destroy;
begin

  inherited;
end;

function TClassNFSeAbaco.montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;
  vnotanfs: TClassNfe): boolean;
begin
   inherited;
end;

function TClassNFSeAbaco.montartxtrps(vnotanfs: TClassNfe): string;
begin
  raise Exception.Create('Nao disponivel para FlexDocs');
end;

function TClassNFSeAbaco.sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps;
begin
  raise Exception.Create('Nao disponível para este provedor');
end;

{ TClassNFSeDefault }

procedure TClassNFSeDefault.copiarschemas(tpAmb: string);
begin
//  fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Abaco';
//  inherited;
//  fPathSh := IniConf.ReadStr('Sistema', 'SchemasNFSe');
end;

constructor TClassNFSeDefault.create(_ibgeId: string);
begin
  ibgeId := _ibgeId;
end;

destructor TClassNFSeDefault.destroy;
begin

  inherited;
end;

procedure TClassNFSeDefault.HandleValuesBeforePrint(var nfse:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;
  nfs: TClassNfe);
var
  data: TClientDataSet;
begin
  inherited;

  data := (nfs as TClassNfSe).buscasmnt;

  if IniConf.ReadStr(Format('NFSe_%s', [ibgeId]), 'Atualizar_Servico_Valores_ValorLiquidoNfse', 'S') = 'S' then
    if nfse.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse > 0 then
      nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := nfse.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;

  if IniConf.ReadStr(Format('NFSe_%s', [ibgeId]), 'Atualizar_Servico_Valores_ValorIssRetido ', 'S') = 'S' then
    if (nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido = stRetencao) and (nfse.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss > 0) then
        nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := nfse.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss;

  if (nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota = 0) and
     (data.FieldByName('aliq_iss').AsFloat > 0) then
     nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota := data.FieldByName('aliq_iss').AsFloat;

  if (nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss = 0) and
     (data.FieldByName('aliq_iss').AsFloat > 0) and (not data.FieldByName('iss_retido').AsString.Equals('1')) then  // valor_b_nfse = bruto
     nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss := RoundTo(data.FieldByName('bruto').AsFloat * data.FieldByName('aliq_iss').AsFloat / 100, -2);

  if (nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido = 0) and
     (data.FieldByName('aliq_iss').AsFloat > 0) and (data.FieldByName('iss_retido').AsString.Equals('1')) then  // valor_b_nfse = bruto
     nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := RoundTo(data.FieldByName('bruto').AsFloat * data.FieldByName('aliq_iss').AsFloat / 100, -2);

  if IniConf.ReadDouble(Format('NFSe_%s', [ibgeId]), 'Fator_Ajuste_Aliquota_ISS', 0) > 0 then
    nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota :=
      nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota * IniConf.ReadDouble(Format('NFSe_%s', [ibgeId]), 'Fator_Ajuste_Aliquota_ISS', 1);

  {
  if IniConf.ReadStr(Format('NFSe_%s', [ibgeId]), 'Atualizar_Servico_Valores_ValorIssRetido ', 'S') = 'S' then
  begin
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.RazaoSocial := nfs.cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Endereco := nfs.cadempresa.dataSet.FieldByName('ENDRECO_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Numero := nfs.cadempresa.dataSet.FieldByName('NUMERO_END').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Complemento := nfs.cadempresa.dataSet.FieldByName('COMPLEMENTO_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Bairro := nfs.cadempresa.dataSet.FieldByName('BAIRRO_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio := nfs.cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.xMunicipio := nfs.cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.UF := buscaSiglaest(nfs.cadempresa.dataSet.FieldByName('UF_EMP').AsInteger);
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CEP := nfs.cadempresa.dataSet.FieldByName('CEP_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.Telefone := nfs.cadempresa.dataSet.FieldByName('TELEFONE_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.Email := nfs.cadempresa.dataSet.FieldByName('EMAIL_EMP').AsString;
  end;
  }
end;

function TClassNFSeDefault.montarRPSAC(var vacbrnfse1:
      {$IFDEF USE_NFSEX}
        TACBrNFSeX
      {$ELSE}
        TACBrNFSe
      {$ENDIF}
      ;
  vnotanfs: TClassNfe): boolean;
begin
   inherited;
end;

function TClassNFSeDefault.montartxtrps(vnotanfs: TClassNfe): string;
begin
  raise Exception.Create('Nao disponivel para FlexDocs');
end;

function TClassNFSeDefault.sigiss_getRPS(
  Anfs: TClassNfSe): tcDescricaoRps;
begin
  raise Exception.Create('Nao disponível para este provedor');
end;
*)

end.

{$IFDEF USE_NFSEX}
{$ELSE}
{$ENDIF}

// prefeitura de Manaus ainda não foi testada, não temos os cnaes, quando o cliente for utilizar e se der problema pegar os dados para testar
