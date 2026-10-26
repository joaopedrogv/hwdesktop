unit UClassesGestor;

interface
uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  ComCtrls, ExtCtrls, CheckLst, Variants, SysUtils, DBGrids, Grids,xhHierCube,
  IBQuery, Chart, StdCtrls,math, IBDatabase, Classes, Graphics, RDPrint;

type
  TOpcaoImpressao = (oiImpEstrutura, oiImpContaCTB, oiImpRegistrosFIN, oiImpContasSemVinculo,
                     oiImpRegistroSemValor, oiEspacoEntreDetalhes);//adicionar mais a medida que for necessario
  TOpcoesImpressao = set of TOpcaoImpressao;

  TipoArray = array of TColor;

  TDepto = class;
  TVendasGestor = class;
  TDespesasGestor = class;
  TFluxoCaixa = class;
  TCtrlCredchq = class;
  TControles = class;
  TApuracaoDep = class;
  TEstoque = class;
  TProdutosSugVenda = class;
  TcotacaoItens = class;
  Tcotacao = class;
  TcolaboradorGes = class;
  TFornecedorGes = class;
  TListaCotacao = class;
  TListaCotacaoItens = class;
  TAtributos = class;
  TCondPagGes = class;

  TGestorFormularios = class
  private
    cTransacao :TIBTransaction;
  public
    constructor create;
    procedure cadMetas(TipoForm: integer);
    procedure cadFinancasCustos(TipoForm:integer);
    procedure cadEnsaiosProvisao(TipoForm:integer);
    procedure cadCotacao(TipoForm:integer);
    procedure cadPainelControle(TipoForm:integer);
    var
    cQuery : TIBQuery;
  end;

  TEmpresas = class(TDataSet_OOP)
  private
    Vetor, Pivo: array of string;
  public
    constructor create;
    destructor destroy; override;
    function abreEmpresas(pCodEmpresa: Integer = 0): Boolean;
    function preenchChecklist(vcheck: TCheckListBox): boolean;
    function VerificaEmpresas(vcheck: TCheckListBox): boolean;
    function obterdataCaixa(vempresasD: string): TDate;
//    function relacEmp: boolean;
//    function refreshDataset: boolean;
//    procedure PreencheCampos;
//    function StatusLixeira(aviso: boolean): boolean;
//    function AbrirLixeira: boolean;
//    function confirmaAlteracao: boolean;
//    function post: boolean; override;
//    procedure IncrementaGodigo;
  var
    //    Bairro:TBairros;
   vempresas: string;
   vnomeemps: string;
   vCodEmpresas: array of string;
  end;

  TDREHw = class(TDataSet_OOP)
  private
   vcampoutilvndveic: string;
   vmes: integer;
   vcoddemo: string;
   vIndicesDRE: TClientDataSet;
   vtiposRateio: TIBQuery;
   vrateiorealizado: TClientDataSet;
   vrepdpto: array of array of string;
   vrepdptodest: array of string;
   function iniciavariaveis(vitx: integer): boolean;
   function VerbuscaDespDep(var vnumDRE: integer; pBalDre: string): boolean;
   function vendasSELDRE(vgriddep: Tdbgrid;vtipo: integer): boolean;
   function gravaindicesmeses(vdescricao: string;valor: currency;seq: integer): boolean;
   function obterVaalorIndiceMeses(pDRE, pMes, pAno: Integer; pDeleteIndice: Boolean = False): Real;
   function procuraitemvetor(vvetor: array of string;vdado: string): boolean;
   function efetRatSobreVenda(pBalDre: string): boolean;
   function verreplancdesp(vtpdesp: integer): boolean;
   function verificarepdpto(vtp: integer;vtpdep: string): integer;
   procedure efetRatSobreVendaDaMedia;
  public
    constructor create;
    destructor destroy; override;
    function MontaDRE(vgriddep: Tdbgrid;stgridDRE: TstringGrid;stgridVendas: TstringGrid; pBalDre: string): boolean;
    function vgerarGrafico(vdbgrid: TDBGrid;vchartanoat: Tchart;vchartanoant: Tchart;vstringgrid: TstringGrid;vtp: integer): boolean;
    function QtdeDeptoSel(vgriddep: Tdbgrid): integer;
    function gravacustosporDpto(vqtddep,vqtddepsel: integer;vgriddep: Tdbgrid;vcodempresa: integer;stgridDRE: TstringGrid): boolean;
    function montadatasBI: boolean;
    function selgriddep(vgriddep: Tdbgrid): boolean;
    function verificavinculacaodpto(vtp: integer): boolean;
    function verificadepto: boolean;
    function defineregime(vcomp: TRadioButton;vcaixa: TRadioButton): boolean;
  var
    //    Bairro:TBairros;
    CadDepto: TDepto;
    CadVendas: TvendasGestor;
    caddesp: TDespesasGestor;
    CadApuracao: TApuracaoDep;
    vregime: string;
    vversao: string;


//    VendaVeic, VendaPecas,VendaOficina,VendaConsorcio,VendaRetBanco: array of array of currency;
    vdesconto,vdespVariaveis,vcustoVend,vcontrBruta,vvendLiquidas,vimpostos,vendasGeral: array of currency;
    vrecativop,vdespFixas,Vlucro_Prej,voutrasRec,vmargemContr,vLucroLiquido,vlucliqop,lucliqop1: array of currency;
    vAdicionalIRRF,vImpRenda,vctSocial,vreinv,vremun,vdespAdm,vdevolucoes,vdevolucoesCt: array of currency;
    vCompras,EstMonetario: currency;
    vmargem,vpequilibrio,vlucratividade,vmarkupmin: currency;
    vmargemMed,vpequilibrioMed,vlucratividadeMed,vmarkupminMed: currency;
    Emes,vmesinf,vano,vanoinf: integer;
    vCodEmpresasDRE: string;
    vdepdemo: string;
    vexecutarmesatual: string;
    vContabil: Boolean;
    vMesesMedia: Integer;
//    vRow,vCol: integer;
  end;

  TFluxoCaixa = class(TDataSet_OOP)
  private
   vmes: integer;
   vcoddemo: string;
   vcolsaldini: integer;

   function iniciavariaveis(vitx: integer): boolean;

//   function VerbuscaDespDep(var vnumDRE: integer): boolean;
//   function vendasSELDRE(vgriddep: Tdbgrid;vtipo: integer): boolean;
  public
    constructor create;
    destructor destroy; override;
    function MontaFluxo(vgridFluxo: Tstringgrid;stgridGrafico: TstringGrid;vtip: string;vtpaceite: string): boolean;
    function somargrids(vgridfluxo: TStringGrid;stridgrafico: TstringGrid;vtip: string): boolean;
    function GeraHTML( GradeP: TStringGrid;Borda : String ): String;
    function verificadiainicial(vdata: string;vempresasD: string): boolean;
    function verificardiasemana: boolean;
//    function montadatasBI: boolean;
  var
    //    Bairro:TBairros;
    cadcontroles: Tcontroles;
    cadctrlCredCheq: TCtrlCredchq;
    CadVendas: TvendasGestor;
    caddesp: TDespesasGestor;
    vversao: string;
    voriginal,vInicial, vFinal : TDate;
    I : Integer;  // Linha do StringGrid
    C : Integer;  // Coluna do StrinGrid
    vlinicial: currency;
    vCodEmpresasDRE: string;
    DiaSemana:  Array[1..7]  of string;
    vdtinicial: Tdate;
    vusvlLiq,vsemPrevVenda: string;

//    vRow,vCol: integer;
  end;

  TApuracaoDep = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    function abrebase: boolean;
    function buscaapuracao(vcoddepto: integer;vcodemp: string): boolean;
    function post: boolean; override;
    var
     vcodempresaap: string;
  end;

  TDespesasGestor = class(TDataSet_OOP)
  private
   datasetBI: tibquery;
   vcoddemo: string;
  public
    constructor create;
    destructor destroy; override;
    function buscaDespDep(vnumDRE: integer;vempresasD: string;vcoddemo: string; pBalDre: string; pContabil: Boolean = False): boolean;
    function despBI(vempresasD: string;vFerCube: THierCube; pBalDre: string): boolean;
    function Somadesp(vempresasD: string;vdata: Tdate;vtpac: string; pBalDre: string): boolean;
    function ApagarBI(vempresasD: string;vFerCube: THierCube; pBalDre: string): boolean;
    function iniciavariaveis: boolean;
    function desembolsototal(vdatini,vdattfin: Tdate;vempresasD: string; pBalDre: string): currency;
    function contasFopag(vtip: string;vop: integer;vempresasD: string; pBalDre: string): boolean;
    function gravaProvisoes(vempresasD: string;vdtVenc: string;vval: real;vtipoLanc: integer): boolean;
    function desppgdia(vdia: Tdate;vEmpresasD: string): currency;
    // Tipolanc = 1 FOPAG FIXA, TipoLanc = 2 FOPAG VAIRÁVEL TipoLanc = 3 DEPRECIACAO
    function visualizadespesas: boolean;
  var
//    vratrealizado: TClientDataSet;
    vtippesq: string;
    vdatant1,vdatant2,vdat1,vdat2: Tdate;
    vmesor,vanovendas,vmesvendas: integer;
    vretorno: array of currency;
    pdiaD,pdiaF,cpdiaimp,cpdiafolha: currency;
    vvaldespped: currency;
    vregime: string;
  end;


  TVendasGestor = class(TDataSet_OOP)
  private
   datasetBI: tibquery;
   vcampoutilvndveic: string;
   vTipoVendaREQ, vTipoVendaOS: string;
   procedure defineTipoVendas;
  public
    constructor create;
    destructor destroy; override;
    function vendasGerais(vempresasD: string; pBalDre: string): boolean;
    function vendasGeraisCNT(vempresasD: string; pBalDre: string): boolean;
    function vendasBI(vempresasD: string;vFerCube: THierCube; pBalDre: string): boolean;
    function vendasBICNT(vempresasD: string;vFerCube: THierCube; pBalDre: string): boolean;
    function vendapordpto(vdpto: string;vempresasD: string; pBalDre: string): currency;
    function vendapordptoCNT(vdpto: string;vempresasD: string; pBalDre: string): currency;
    function ZeraVendas: boolean;
    function DevolucoesBI(vempresasD: string;vFerCube: THierCube; pBalDre: string): boolean;
    function vendasant(vdia: Tdate;vtip: string;vCodEmpresasDRE: string; pBalDre: string): boolean;
    function MediaVendas(vmeses: integer;vCodEmpresasDRE: string; pBalDre: string): currency;
//    function refreshDataset: boolean;
//    procedure PreencheCampos;
//    function StatusLixeira(aviso: boolean): boolean;
//    function AbrirLixeira: boolean;
//    function confirmaAlteracao: boolean;
//    function post: boolean; override;
//    procedure IncrementaGodigo;
  var
    //    Bairro:TBairros;
    VendaporMod:  array of array of ShortString;
    VendaporModCNT:  array of array of ShortString;
    //vendaporModBr: array of array of ShortString;
    vbrutoat,vcustoat,vdescat,vdevat,vdevct: array of currency;
    vbrutoatrat,vcustoatrat,vdescatrat: array of currency;
    vtippesq: string;
    vVendasCNT: string;
    vdatant1,vdatant2,vdat1,vdat2: Tdate;
    vmesor,vanovendas,vmesvendas: integer;
    vcoddemo: string;
    vvprevisao: array[1..7] of currency;
    vvendageral: currency;
  end;

  TCtrlCredchq = class(TDataSet_OOP)
  private
   datasetBI: tibquery;
  public
    constructor create;
    destructor destroy; override;
    function SomaCredCheq(vempresasD: string;vdata: Tdate;vusliq: string): boolean;
    function verificaAtrasados(vempresasD: string;vdata: Tdate): boolean;
    function CredChequesBI(vempresasD: string;vFerCube: THierCube;vdata: Tdate): boolean;
    function BIAtrasados(vempresasD: string;vFerCube: THierCube;Vdata: Tdate): boolean;
    function iniciavariaveis: boolean;
//    function refreshDataset: boolean;
//    procedure PreencheCampos;
//    function StatusLixeira(aviso: boolean): boolean;
//    function AbrirLixeira: boolean;
//    function confirmaAlteracao: boolean;
//    function post: boolean; override;
//    procedure IncrementaGodigo;
  var
    //    Bairro:TBairros;
    vatrapagar,vatrasados,cdia: currency;
    vdat1,vdat2: TDate;
  end;

  TControles = class(TDataSet_OOP)
  private
   datasetBI: tibquery;
  public
    constructor create;
    destructor destroy; override;
    function SomaSaldoinicial(vempresasD: string;vdata: Tdate): boolean;
    function ControlesBI(vempresasD: string;vFerCube: THierCube): boolean;
  var
    //    Bairro:TBairros;
    ValorInicial: currency;
    vsaldbanc: currency;
  end;

  TBalancoHw = class(TDataSet_OOP)
  private
   vbuscasinternas: TIBQuery;
   vApBalanco: TClientDataset;
   cadDreHw: TDREHw;
   CadEstoque: Testoque;
   cadDespGestor: TDespesasGestor;
   datasetBI: tibquery;
   vtr: real;
   vdiasTrab: integer;
   vmesessug: integer;
   vcampoutilvndveic: string;
  public
    constructor create;
    destructor destroy; override;
    function abreEmpresas: Boolean;
    function montarBalanco(vStAtCirc,vStRealLP,vStPerm,vStPasCirc,vStPasExLP: TStringgrid;vcodemsel: array of string): boolean;
    function buscavlporTpBal(vtpbal: string): currency;
    function ColocadadosGrid(Vstrgrid: TStringGrid): boolean;
    function somaGrids(vStAtCirc,vStRealLP,vStPerm,vStPasCirc,vStPasExLP: TStringgrid;VobjEmp:TEmpresas): boolean;
    function VerIndices(vgriddep: TdbGrid;vcodemsel: array of string): boolean;
    function apagaindemapuracao: boolean;
    function montarData: boolean;
    function apagarbalapur: boolean;
    function GravaBalanco(vStAtCirc,vStRealLP,vStPerm,vStPasCirc,vStPasExLP: TStringgrid;VobjEmp:TEmpresas;vpatliq: real): boolean;
    function confgravBal(vstrgrid: TStringGrid;vempresa: string): boolean;
    function detalhesBalBI(vFerCube: THierCube;vcodbal: string): boolean;
    function procuraitemvetor(vvetor: array of string;
    vdado: string): boolean;
    function verificarsaldobanco(vcodbal: string): boolean;
    function vgerarGrafico(vdbgrid: TDBGrid; vchartanoat,
  vchartanoant: Tchart;vstringgrid: TstringGrid;vtp: integer): boolean;
    function ultapura: boolean;

//    function refreshDataset: boolean;
//    procedure PreencheCampos;
//    function StatusLixeira(aviso: boolean): boolean;
//    function AbrirLixeira: boolean;
//    function confirmaAlteracao: boolean;
//    function post: boolean; override;
//    procedure IncrementaGodigo;
  var
    //    Bairro:TBairros;
    Emes,vmesinf,vano,vanoinf: integer;
    vCodEmpresasDRE: string;
    vIndicadoresBal:  array of array of ShortString;
    vtativo,vtpassivo,vpatLiq,vdifPatlIqM,vdifPatliqA: currency;
    Vvatcirc,vvastrealp,vvstperm,vvstpascirc,vvstpasexlp: currency;
    vstatusbal: string;
    vdat1,vdat2: Tdate;
    vinserviveis,vvalestoque: currency;
    vlblestoque: Tlabel;
    vIndicesBal: TClientDataSet;
    vultApura: string;
    vregime: string;
    vdesconsideraPME: boolean;
    vdesconsideraPMPF: boolean;
  end;

  Tdepto = class(TDataSet_OOP)
  private
    Vetor, Pivo, vCodEmpresas: array of string;
  public
    constructor create;
    destructor destroy; override;
    function abreBase: Boolean;
    function preencheCombo(vcomb: TComboBox): boolean;
    function procuraDepto(venomedepto: string): boolean;
//    function refreshDataset: boolean;
//    procedure PreencheCampos;
//    function StatusLixeira(aviso: boolean): boolean;
//    function AbrirLixeira: boolean;
//    function confirmaAlteracao: boolean;
//    function post: boolean; override;
//    procedure IncrementaGodigo;
  var
    //    Bairro:TBairros;
    vdepprod: string;
  end;

  Testoque = class(TDataSet_OOP)
  private
    Vetor, Pivo, vCodEmpresas: array of string;
    vestoqueHw: TClientDataSet;
  public
    constructor create;
    destructor destroy; override;
    function abreBase: Boolean;
    function verificaestoques(vLab:Tlabel): currency;
    function verificaMotos(vtip: integer): currency; // 1 -> Motos pagas antecipadas 2 -> Motos que chegaram antes do pagamento
    function gravainv(vqtde: real;vvalor: currency;vobs:string;vtipo: string;vpend: double): boolean;
    function getQuantidadePendenteReqOS(grupo_prod: integer;
    cod_prod: string): Double;

  var
    //    Bairro:TBairros;
    vdataref: Tdate;
    vdat1,vdat2: TDate;
    vempresas: string;
    vobsoletos: currency;
    vcodbal,vmes,vano: integer;
    vestprodutos: currency;
  end;

  TensaiosDescontos = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    function abreBase: Boolean;
    function VerificaCustos(vStCustosEmp: TStringGrid): boolean;
    function VerificaEnsaios(Vstensaioemp: TStringGrid;vStCustosEmp: TStringGrid): boolean;
  var
    //    Bairro:TBairros;
    vdat1,vdat2: TDate;
    vmesinf,vano: Integer;
    vempresas: string;
    vvaltemp,vobsoletos: currency;
    vredcustoperc,vredcmvperc,vredocvperc,vlucrodesadoperc,
    vLucroDesejadoDinheiro,vfaturamento,vdescontoperc: real;
    vlucroreal,vcmvrealperc,vcfrealperc,vocvrealperc,vfatreal,vcmvreal,vcfreal,vocvreal,vpereal: currency;
    vperccmv,vpercocv,vpercaumentofat,vlucroensaio,vperclucroensaio,vdescensaio,vfatensaio,vcmvensaio,vcfensaio,vocvensaio,vpeensaio: currency;
    vcurvas: string;
    caddre: TDREHw;
    cadCotacao: Tcotacao;
//    cadapuracao: TApuracaoDep;
//    vcodbal,vmes,vano: integer;
  end;

  TListaCotacao = class(TDataset_OOP)
  private

  public
    constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _lixeiraCheia: boolean;
    function imprimirLista: boolean;
    procedure _rdListaCotacaoSendMail(Sender: TObject);
    procedure _cadListaCotacao(pTipoForm: Integer);
  var
    vListaCotacaoItens: TListaCotacaoItens;
    vpag: Integer;
    linha: integer;
  end;

  TAtributos = class(TDataset_OOP)
  private

  public
    constructor create;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _lixeiraCheia: boolean;
    procedure _cadAtributos(pTipoForm: Integer);
  end;


  TListaCotacaoItens = class(TDataset_OOP)
  private

  public
    constructor create;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    procedure _cadListaCotacao(pTipoForm: Integer);
    function abreItListaCotacao(Cod: integer): Boolean;
    function buscarProduto(codBarra: string; grupo: integer; codProd: string; usarCodbarra: boolean): boolean;
    function buscarItem(codLista, grupo: integer; codProd: string; codEmpMult: Integer): boolean;
    function _abreFormSelecionaGradeProd(grupo: integer; codProd: string): boolean;
    function empresaExiste(CodEmp: Integer): Boolean;
  var
    nGradeSelecionada: integer;
  end;


  Tcotacao = class(TDataSet_OOP)
  private
   datasetBI: tibquery;
  public
    _codLista, pCodLista: Integer;
    _dtIni, _dtFim, _descricao: string;
    fTempAtributos: TClientDataSet;
    fTempAtributosDtSource: TDataSource;
    fTempListaCotacao: TClientDataSet;
    fTempListaCotacaoDtSource: TDataSource;
    fTempListaCotacaoItens: TClientDataSet;
    fTempListaCotacaoItens2: TClientDataSet;
    fTempListaCotacaoItensDtSource: TDataSource;
    fTempListaCotacaoItensDtSource2: TDataSource;
    fTempCotacao: TClientDataSet;
    fTempCotacaoDtSource: TDataSource;
    fTempCotacaoItens: TClientDataSet;
    fTempCotacaoItensDtSource: TDataSource;
    destructor Destroy; override;
    constructor create;
    function Insert(pTipoOP: string): boolean; //override;
    function edit: boolean; override;
    function abrecotacao: boolean;overload;
    function abrecotacao(vcodcot: integer): boolean;overload;
    function _lixeiraCheia: boolean;
    function MontacotacaoVenda(vclasses: string;vtipat: string;vtipsugest: string;vlb: TLabel;vprogresso: TProgressBar;vtipovenda: string): boolean;
    function VerificaCustosFixos(vlb: TLabel;vprogresso: TProgressBar): boolean;
    function cotacaoOLAP(vtipo: string;vcodcotacao: integer;vFerCube: THierCube): boolean;
    function Preenchcampos: boolean;
    function vercodigodep(vcampo: string): integer;
    function checarCamposObrigatorios: boolean;
    function post: boolean; override;
    function AbrirLixeira: boolean;
    function StatusLixeira: boolean;
    function EnviarpraLixeira: boolean;

//    function buscaProduto(codBarra: string): boolean; overload;
//    function buscaProduto(grupo: integer; codigo: string): boolean; overload;
//    function verificarVendaproduto(vnumfab: string;vmes,vano: integer;ValPrecvenda: currency): currency;
    // colocar neste método acima o cálculo para veiculos e serviços...
    function montardatas: boolean;
    procedure alterarNcotacaoItens;
    procedure colocasequenciaitens;
    procedure cadDNDEmpresa;
//    function verificarDNA(vcoddep: integer): boolean;
    function abreListaCotacao(cod: Integer = 0): boolean;
    procedure datasetAfterScrollListaCotacao(DataSet: TDataSet);
    procedure datasetAfterScrollCotacao(DataSet: TDataSet);
    function pesquisarListaCotacao: Boolean;
    function buscarListaCotacao(cod: Integer): Boolean;
    function ProdExisteNaListaCotacao(cod: Integer = 0): Boolean;
    procedure marcaDesmarcaLinha(dtset: TClientDataSet);
    procedure _marcarTodos(dtset: TClientDataSet);
    procedure _desmarcarTodos(dtset: TClientDataSet);
    function abrePedido: boolean;
    function AbrirPedidoCompra: boolean;
    function abreListaCotacaoC: boolean;
    function AbreFormRel: boolean;
    function imprimirRel(pMostrarRazao: boolean = false; pOrdem: string = ''; pAtributos: string = ''): boolean;
  var
    vdat1,vdat2: Tdate;
    vqtdediasmes,vmesinf,vanoinf: integer;
    vqtdeProd: real;
    vlucrocot,vcfcot,vcmvcot,vocvcot,vpequilcot,vfatcot,vfatdesc: real;
    vnomedep,vtipcot: string;
    cadCotacaoItens: TCotacaoItens;
    cadcolaborador: TcolaboradorGes;
    cadfornecedor: TFornecedorGes;
    vnitem: integer;
    vnovaCotacao: string;
    vdtdefclasses,vdtdfgiro: Tdate;
    vdiasmeses: integer;
    ultimasql: string;
    vListaCotacao: TListaCotacao;
    vAtributos: TAtributos;
    vCondPag: TCondPagGes;
    vpag: Integer;
    linha: integer;
  end;

  TcotacaoItens = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function abrecotacaoitens(vcodacao: integer;vtipop: string): boolean;
//    function buscaProduto(codBarra: string): boolean; overload;
//    function buscaProduto(grupo: integer; codigo: string): boolean; overload;
//    function verificarVendaproduto(vnumfab: string;vmes,vano: integer;ValPrecvenda: currency): currency;
    // colocar neste método acima o cálculo para veiculos e serviços...
//    function montardatas: boolean;
//    function verificarDNA(vcoddep: integer): boolean;
  var
   cadprodutos: TProdutosSugVenda;
   vultimoitem: integer;
  end;

  TProdutosSugVenda = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function buscaProduto(codBarra: string; grupoProd: Integer = 0; codProd: string = ''): boolean; overload;
//    function buscaProduto(grupo: integer; codigo: string): boolean; overload;
    function verificarVendaproduto(vtipclasse: string;vdiasmeses: integer;vtipat: string;vtipcot: string;vtipovenda: string): boolean;
    function verificapendencias(vcodprod: string;vgrupoprod: integer): real;
    function verificaclassesProduto(vchecklist: TCheckListBox): Boolean;
    function verificarPartVenda(vtipovenda: string;vacao: integer): boolean;
    // colocar neste método acima o cálculo para veiculos e serviços...
//    function montardatas: boolean;
//    function verificarDNA(vcoddep: integer): boolean;
  var
    vdat1,vdat2: Tdate;
    vdescprod,vgrprod,vcodprod,vnum_fab: string;
    vpercvendidas,vvalest,vqtdeProd,vpercvenda,vvalvend,qtdevend,vcustvend,vpme,vqtdegiromes,vdescprat,vestreal: real;
    vperctipovenda,vperctipoqtde: real;
    vperctivendageral: array of array of ShortString;
    vclasses: string;
    vPequisaPorDescr: boolean;
  end;

  TcolaboradorGes = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function abrebase(vcod_us: integer): boolean;
//    function buscaProduto(codBarra: string): boolean; overload;
//    function buscaProduto(grupo: integer; codigo: string): boolean; overload;
//    function verificarVendaproduto(vnumfab: string;vmes,vano: integer;ValPrecvenda: currency): currency;
    // colocar neste método acima o cálculo para veiculos e serviços...
//    function montardatas: boolean;
//    function verificarDNA(vcoddep: integer): boolean;
  var
   cadprodutos: TProdutosSugVenda;
  end;

  TCondPagGes = class(TDataSet_OOP)
  public
    constructor create;
    function abreCondPag: boolean;
    function existeCondPag(codigo: Integer): boolean;
  end;

  TFornecedorGes = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function abrebase: boolean;
//    function buscaProduto(codBarra: string): boolean; overload;
//    function buscaProduto(grupo: integer; codigo: string): boolean; overload;
//    function verificarVendaproduto(vnumfab: string;vmes,vano: integer;ValPrecvenda: currency): currency;
    // colocar neste método acima o cálculo para veiculos e serviços...
//    function montardatas: boolean;
//    function verificarDNA(vcoddep: integer): boolean;
  var
//   cadprodutos: TProdutosSugVenda;
  end;

  TDREComparativo = class(TDataSet_OOP)
  private
    vcodDemo: string;
    vdtgeral, vdtgeralctp, vCampoTipoCusto: string;
    fMes: Integer;
    fAno: Integer;
    vMes: TDate;
    fListaFormulaNaoApl: TStringList; // armazena os registros que estao sendo calculados, para nao deixar ficar em referencia circular
    fMaxNivel: Integer;
    fCorPersonalizadaFundo: TipoArray;
    fCorPersonalizadaFonte: TipoArray;
    fValorContribuicaoImpostos:  array of array of string; //0: PIS, 1: COFINS e 2: ICMS

    fDetalhesCta: TDataSet_OOP;
    function iniciaVariaveis: Boolean;
    function decodeFormula(var pFormula: string; var pOperador: string; var pRetorno: string; var pMsg: string; var pContinuar: Boolean): Boolean; // retorna falha se nao conseguir validar a formula
    function aplicaFormulaRegistroAtual: Boolean;
    procedure montarReceitasCustosDevolucoes(PBalDre: string);
    procedure montarDepesas(pBalDre: string);
    procedure somarVendasImpostosEContribuicoes(PBalDre: string);
  public
    destructor Destroy; override;
    constructor create;
    function montarDREComparativo(PBalDre: string): Boolean;
    procedure relatorioComparativo;
    procedure abreOLAP(pColuna: string; pBalDre: string);


    procedure setCorPersonalizadaFundo(pNivel: Integer; pColor: TColor);
    function getCorPersonalizadaFundo(pNivel: Integer): TColor;
    procedure setCorPersonalizadaFonte(pNivel: Integer; pColor: TColor);
    function getCorPersonalizadaFonte(pNivel: Integer): TColor;
    property mes: Integer read fMes write fMes;
    property ano: Integer read fAno write fAno;
    property MaxNivel: Integer read fMaxNivel;
    property detalhesCta: TDataSet_OOP read fDetalhesCta write fDetalhesCta;
  var
    vCodEmpresasDRE, vregime, vTipoCusto: string;
    relOpcoes: TOpcoesImpressao;
    CadVendas: TvendasGestor;
    caddesp: TDespesasGestor;
  end;

var
  ListaCotacao: TListaCotacao;
  Atributos: TAtributos;
  comparativoDRE: TDREComparativo;

implementation

uses UdtmGestorHw, xhConsts, TeEngine, Series, funcoes,
  UDtmEquipamentos, UClassesEquipamentos, UMetas, Ufinanceiros, UCustosGestor,
  UCotacaoCompraVenda, UPainelControl, uDadosIni, UDtmCadastrosBasicos, UcadDNAEmpresa, uCadListaCotacao, uPadrao, 
  uCadAtributos, DateUtils, StrUtils, UvisualizadorOLAP, MaskUtils, SHFolder;

{ TEmpresas }

function TEmpresas.abreEmpresas(pCodEmpresa: Integer): Boolean;
begin
 result:=montaSelect('select * from empresa where ativo = 1' +
 	vDadosIni.IfThen(pCodEmpresa > 0, ' and cod_empresa = ' + IntToStr(pCodEmpresa), ''));
end;

constructor TEmpresas.create;
begin
if DtmGestorHw = nil then
 DtmGestorHw := TDtmGestorHw.Create(DtmGestorHw);
DataSet := TClientDataSet(DtmGestorHw.CdsEmpresas);
transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
Buscas := TIBQuery(DtmGestorHw.qrBuscas);
end;

destructor TEmpresas.destroy;
begin

  inherited;
end;

function TEmpresas.obterdataCaixa(vempresasD: string): TDate;
begin
 buscas.Close;
 buscas.sql.text:='select max(dia_fcd) as data from fech_Dia where CODIGO_EMP in ('+vempresasD+')';
 buscas.Open;
 Result := buscas.FieldByName('data').AsDateTime+1;
end;

function TEmpresas.preenchChecklist(vcheck: TCheckListBox): boolean;
var
 i: integer;
begin
  SetLength(Pivo, dataSet.RecordCount);
  i := 0;
  dataSet.First;
  vcheck.Items.Clear;
  while not dataSet.eof do
  begin
    vcheck.Items.Add(dataSet.FieldByName('IDENTIFICACAO_EMP').Text);
    //dataSet.FieldByName('NOME_EMP').Text);
    Pivo[i] := (dataSet.FieldByName('COD_EMPRESA').Text);
    i := i + 1;
    dataSet.Next;
  end;
  for i := 0 to vcheck.Items.Count - 1 do
  begin
      if Pivo[i] = vDadosIni.codEmpresa then
       vcheck.Checked[i] := true;
  end;
  if not vDadosIni.PesqPros('GES050','ACESSO A EMPRESAS','GESTOR','EMPRESAS',vDadosIni.codEmpresa,buscas,True, False, True) then
    vcheck.Enabled:=false
  else
   vcheck.Enabled:=true;
end;

function TEmpresas.VerificaEmpresas(vcheck: TCheckListBox): boolean;
var
 cont,i,j: integer;
begin
  result:=true;
  vEmpresas := '';
  vnomeemps:='';
  j := 0;
  cont := 0;
  SetLength(Vetor, Length(Pivo));
  for i := 0 to Length(Pivo) - 1 do
    Vetor[i] := Pivo[i];

  for i := 0 to vcheck.Items.Count - 1 do
  begin
   if (vcheck.Checked[i] = false) then
        Vetor[i] := 'NULO'
   else
     vnomeemps:=vnomeemps+vcheck.Items[i]+'|';
      j := j + 1;
  end;

  for i := 0 to j - 1 do
  begin
   if (Vetor[i] <> 'NULO') then
    cont := cont + 1;
  end;

  SetLength(vCodEmpresas, cont);
  cont := 0;
  for i := 0 to j - 1 do
  begin
    if (Vetor[i] <> 'NULO') then
    begin
      vCodEmpresas[cont] := Vetor[i];
      vEmpresas := vEmpresas + Vetor[i] + ',';
      cont := cont + 1;
    end;
  end;
  if Length(vCodEmpresas) <= 0 then
  begin
    Application.MessageBox('Pelo menos uma empresa deve ser selecionada!', 'Confirmação', MB_OK);
    result:=false;
  end
  else begin
    vEmpresas := Copy(vEmpresas, 1, Length(vEmpresas) - 1);
  end;
end;

{ TDREHw }


function TDREHw.VerbuscaDespDep(var vnumDRE: integer; pBalDre: string): boolean;
begin
buscas.close;
//if vnumDRE <> 11 then
//iniciavariaveis(0);
caddesp.vmesvendas:=vmes;
caddesp.vanovendas:=vano;
caddesp.vmesor:=vmesinf;
caddesp.vtippesq:='M';
//if vnumDRE <> 11 then // mudança para suportar qualquer um dos numeros do DRE e poder fazer o rateio
                        // também para qualquer um dos numeros
 caddesp.buscaDespDep(vnumDRE,vCodEmpresasDRE,vcoddemo,pBalDre,vContabil);
case vnumDRE of
  2:
  begin
    if vmesinf =  vmes then
     vimpostos[0]:=vimpostos[0]+caddesp.vretorno[0];
//     buscas.FieldByName('valor').AsCurrency;
    vimpostos[1]:=vimpostos[1]+caddesp.vretorno[1];
    vimpostos[2]:=vimpostos[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 2) then
        begin
         if vmesinf = vmes then
          vimpostos[0]:=vimpostos[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vimpostos[1]:=vimpostos[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vimpostos[2]:=vimpostos[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  9:
  begin
    if vmesinf =  vmes then
     vdespVariaveis[0]:=vdespVariaveis[0]+caddesp.vretorno[0];
//     buscas.FieldByName('valor').AsCurrency;
    vdespVariaveis[1]:=vdespVariaveis[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    vdespVariaveis[2]:=vdespVariaveis[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 9) then
        begin
         if vmesinf =  vmes then
          vdespVariaveis[0]:=vdespVariaveis[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vdespVariaveis[1]:=vdespVariaveis[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vdespVariaveis[2]:=vdespVariaveis[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  10:
  begin
    if vmesinf =  vmes then
     vdespFixas[0]:=vdespFixas[0]+caddesp.vretorno[0];
//     buscas.FieldByName('valor').AsCurrency;
    vdespFixas[1]:=vdespFixas[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    vdespFixas[2]:=vdespFixas[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 10) then
        begin
         if vmesinf =  vmes then
          vdespFixas[0]:=vdespFixas[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vdespFixas[1]:=vdespFixas[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vdespFixas[2]:=vdespFixas[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  11:
  begin
    vdespAdm[0]:=vdespAdm[0]+caddesp.vretorno[0];
    vdespAdm[1]:=vdespAdm[1]+caddesp.vretorno[1];
    vdespAdm[2]:=vdespAdm[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 11) then
        begin
         if vmesinf =  vmes then
          vdespAdm[0]:=vdespAdm[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vdespAdm[1]:=vdespAdm[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vdespAdm[2]:=vdespAdm[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
{    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0 then
        begin
         if vmesinf =  vmes then
          vdespAdm[0]:=vdespadm[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vdespAdm[1]:=vdespAdm[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vdespAdm[2]:=vdespadm[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;} // rateio antigo....22/04/2010
  end;
  12:
  begin
    if vmesinf =  vmes then
      vremun[0]:=vremun[0]+caddesp.vretorno[0];
//      buscas.FieldByName('valor').AsCurrency;
    vremun[1]:=vremun[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    vremun[2]:=vremun[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 12) then
        begin
         if vmesinf =  vmes then
          vremun[0]:=vremun[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vremun[1]:=vremun[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vremun[2]:=vremun[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  14:
  begin
    if vmesinf =  vmes then
      vrecativop[0]:=vrecativop[0]+caddesp.vretorno[0];
//      buscas.FieldByName('valor').AsCurrency;
    vrecativop[1]:=vrecativop[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    vrecativop[2]:=vrecativop[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 14) then
        begin
         if vmesinf =  vmes then
          vrecativop[0]:=vrecativop[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vrecativop[1]:=vrecativop[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vrecativop[2]:=vrecativop[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  15:
  begin
    if vmesinf =  vmes then
      voutrasRec[0]:=voutrasRec[0]+caddesp.vretorno[0];
//      buscas.FieldByName('valor').AsCurrency;
    voutrasRec[1]:=voutrasRec[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    voutrasRec[2]:=voutrasRec[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 15) then
        begin
         if vmesinf =  vmes then
          voutrasRec[0]:=voutrasRec[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         voutrasRec[1]:=voutrasRec[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         voutrasRec[2]:=voutrasRec[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  17:
  begin
    if vmesinf =  vmes then
      vctSocial[0]:=vctSocial[0]+caddesp.vretorno[0];
//      buscas.FieldByName('valor').AsCurrency;
    vctSocial[1]:=vctSocial[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    vctSocial[2]:=vctSocial[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 17) then
        begin
         if vmesinf =  vmes then
          vctSocial[0]:=vctSocial[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vctSocial[1]:=vctSocial[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vctSocial[2]:=vctSocial[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  18:
  begin
    if vmesinf =  vmes then
      vImpRenda[0]:=vImpRenda[0]+caddesp.vretorno[0];
//      buscas.FieldByName('valor').AsCurrency;
    vImpRenda[1]:=vImpRenda[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    vImpRenda[2]:=vImpRenda[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 18) then
        begin
         if vmesinf =  vmes then
          vImpRenda[0]:=vImpRenda[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vImpRenda[1]:=vImpRenda[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vImpRenda[2]:=vImpRenda[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  19:
  begin
    if vmesinf =  vmes then
      vAdicionalIRRF[0]:=vAdicionalIRRF[0]+caddesp.vretorno[0];
//      buscas.FieldByName('valor').AsCurrency;
    vAdicionalIRRF[1]:=vAdicionalIRRF[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    vAdicionalIRRF[2]:=vAdicionalIRRF[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 19) then
        begin
         if vmesinf =  vmes then
          vAdicionalIRRF[0]:=vAdicionalIRRF[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vAdicionalIRRF[1]:=vAdicionalIRRF[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vAdicionalIRRF[2]:=vAdicionalIRRF[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
  21:
  begin
    if vmesinf =  vmes then
      vreinv[0]:=vreinv[0]+caddesp.vretorno[0];
//      buscas.FieldByName('valor').AsCurrency;
    vreinv[1]:=vreinv[1]+caddesp.vretorno[1];
//    buscas.FieldByName('valor').AsCurrency;
    vreinv[2]:=vreinv[2]+caddesp.vretorno[1];
    vrateiorealizado.First;
    while not vrateiorealizado.eof do
    begin
      if (vmes = vrateiorealizado.FieldByName('MES').AsInteger) and
      (vano = vrateiorealizado.FieldByName('ANO').AsInteger) then
      begin
        if (pos(vrateiorealizado.FieldByName('COD_DEP').asstring,vcoddemo) > 0)
        and (vrateiorealizado.FieldByName('CODDRE').AsInteger = 21) then
        begin
         if vmesinf =  vmes then
          vreinv[0]:=vreinv[0]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //     buscas.FieldByName('valor').AsCurrency;
         vreinv[1]:=vreinv[1]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
    //    buscas.FieldByName('valor').AsCurrency;
         vreinv[2]:=vreinv[2]+vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency;
        end;
      end;
      vrateiorealizado.Next;
    end;
  end;
else
end;


end;

function TDREHw.verificadepto: boolean;
var
 vdepart: TStringList;
begin
	try
    Result := true;

    vdepart := TStringList.Create;
    vdepart.Sorted := True;
    vdepart.Duplicates := dupIgnore;
    vdepart.Clear;

    buscas.Close;
    buscas.SQL.Text := ' select distinct dep.cod_depto, dep.nome_depto, dp.desc_dep from PEDVENDA_PROD i ' +
      ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
      ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
      ' inner join colaborador col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa ' +
      ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
      ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
      ' left join depart_ct dp on dep.cod_dptocx = dp.cod_dep ' +
      ' where (i.status is null or i.status = '''') ' +
      ' and extract(month from p.data_fech) = ' + IntToStr(vmesinf) +
      ' and extract(year from p.data_fech) = ' + IntToStr(vano) +
      ' and p.cod_empresa in ('+vCodEmpresasDRE+') ' +
      ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) ' +
      ' or (p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) ' +
      ' and dp.desc_dep is null ' +
      ' union ' +
      ' select distinct dep.cod_depto, dep.nome_depto, dp.desc_dep from PEDVENDA_SERV i ' +
      ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
      ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
      ' left join colaborador col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa ' +
      ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
      ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
      ' left join depart_ct dp on dep.cod_dptocx = dp.cod_dep ' +
      ' where (i.status is null or i.status = '''') ' +
      ' and extract(month from p.data_fech) = ' + IntToStr(vmesinf) +
      ' and extract(year from p.data_fech) = ' + IntToStr(vano) +
      ' and p.cod_empresa in ('+vCodEmpresasDRE+') ' +
      ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+'))) ' +
      ' and dp.desc_dep is null ' +
      ' union ' +
      ' select distinct dep.cod_depto, dep.nome_depto, dp.desc_dep from PEDVENDA_SERV_TERC i ' +
      ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
      ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
      ' left join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa ' +
      ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
      ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
      ' left join depart_ct dp on dep.cod_dptocx = dp.cod_dep ' +
      ' where extract(month from p.data_fech) = ' + IntToStr(vmesinf) +
      ' and extract(year from p.data_fech) = ' + IntToStr(vano) +
      ' and p.cod_empresa in ('+vCodEmpresasDRE+') ' +
      ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+'))) ' +
      ' and dp.desc_dep is null ' +
      ' union ' +
      ' select distinct dep.cod_depto, dep.nome_depto, dp.desc_dep from PEDVENDA_PROD_TERC i ' +
      ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
      ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
      ' left join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa ' +
      ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
      ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
      ' left join depart_ct dp on dep.cod_dptocx = dp.cod_dep ' +
      ' where extract(month from p.data_fech) = ' + IntToStr(vmesinf) +
      ' and extract(year from p.data_fech) = ' + IntToStr(vano) +
      ' and p.cod_empresa in ('+vCodEmpresasDRE+') ' +
      ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+'))) ' +
      ' and dp.desc_dep is null ' +
      ' union ' +
      ' select distinct dep.cod_depto, dep.nome_depto, dp.desc_dep from com_fat ft ' +
      ' inner join empresa emp on ft.cod_empresa = emp.cod_empresa ' +
      ' left join colaborador col on ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa ' +
      ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
      ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
      ' left join depart_ct dp on dep.cod_dptocx = dp.cod_dep ' +
      ' inner join nat_op nt on nt.codigo_nop = ft.natop_v ' +
      ' where ft.tipo_venda_v = ''N'' ' +
      ' and extract(month from ft.data_ven) = ' + IntToStr(vmesinf) +
      ' and extract(year from ft.data_ven) = ' + IntToStr(vano) +
      ' and ft.natureza = ''S'' ' +
      ' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'') and coalesce(nt.faturamento, ''N'') = ''S'' ' +
      ' and ft.cod_empresa in ('+vCodEmpresasDRE+') and ft.ativo = 1 ' +
      ' and dp.desc_dep is null ' +
      ' union ' +
      ' select distinct dep.cod_depto, dep.nome_depto, dp.desc_dep  from com_fat ft ' +
      ' inner join empresa emp on ft.cod_empresa = emp.cod_empresa ' +
      ' left join colaborador col on ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa ' +
      ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
      ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
      ' left join depart_ct dp on dep.cod_dptocx = dp.cod_dep ' +
      ' inner join nat_op nt on nt.codigo_nop = ft.natop_v ' +
      ' WHERE  ft.tipo_venda_v = ''U'' ' +
      ' and extract(month from ft.data_ven) = ' + IntToStr(vmesinf) +
      ' and extract(year from ft.data_ven) = ' + IntToStr(vano) +
      ' and ft.natureza = ''S'' ' +
      ' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'') and coalesce(nt.faturamento, ''N'') = ''S'' ' +
      ' and ft.cod_empresa in ('+vCodEmpresasDRE+') and ft.ativo = 1 ' +
      ' and dp.desc_dep is null ' +
      ' union ' +
      ' select distinct dep.cod_depto, dep.nome_depto, dp.desc_dep from devolucao dv ' +
      ' inner join empresa emp on dv.cod_empresa = emp.cod_empresa ' +
      ' inner join colaborador col on dv.cod_vendedor = col.cod_vendedor and dv.cod_empresa = col.cod_empresa ' +
      ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
      ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
      ' left join depart_ct dp on dep.cod_dptocx = dp.cod_dep ' +
      ' where extract(month from dv.data) = ' + IntToStr(vmesinf) +
      ' and extract(year from dv.data) = ' + IntToStr(vano) +
      ' and dv.cod_empresa in ('+vCodEmpresasDRE+') and dv.ativo = 1 ' +
      ' and dp.desc_dep is null ' +
      ' union ' +
      ' select distinct dep.cod_depto, dep.nome_depto, dp.desc_dep from notafiscal ' +
      ' inner join empresa emp on notafiscal.cod_empresa = emp.cod_empresa ' +
      ' inner join nat_op on notafiscal.codigo_nop = nat_op.codigo_nop ' +
      ' inner join notafiscal_item_veiculo on notafiscal.cod_nf = notafiscal_item_veiculo.cod_nf  and notafiscal.cod_empresa = notafiscal_item_veiculo.cod_empresa ' +
      ' inner join notafiscal_item on notafiscal_item.cod_nf = notafiscal.cod_nf and notafiscal_item.cod_empresa = notafiscal.cod_empresa ' +
      ' inner join colaborador on notafiscal.cod_vendedor = colaborador.cod_vendedor and notafiscal.cod_empresa = colaborador.cod_empresa ' +
      ' inner join funcoes on colaborador.cod_funcao = funcoes.cod_funcao ' +
      ' inner join depto dep on funcoes.cod_depto = dep.cod_depto ' +
      ' left join depart_ct dp on dep.cod_dptocx = dp.cod_dep ' +
      ' WHERE notafiscal.natureza_nf = ''E'' AND notafiscal.status = ''Fechada'' ' +
      ' and extract(month from notafiscal.data_lanc) = ' + IntToStr(vmesinf) +
      ' and extract(year from notafiscal.data_lanc) = ' + IntToStr(vano) +
      ' and notafiscal.cod_empresa in ('+vCodEmpresasDRE+') and nat_op.devolucao = ''S'' ' +
      ' and dp.desc_dep is null ';
    buscas.Open;

    Result := buscas.IsEmpty;
    if buscas.IsEmpty then
    begin
      Result := true;
      exit;
    end;

    buscas.First;
    while not buscas.Eof do
    begin
    	vdepart.Add(IntToStr(buscas.FieldByName('cod_depto').AsInteger) +
      	' - ' + trim(buscas.FieldByName('nome_depto').AsString));

      buscas.Next;
    end;

    Application.MessageBox(Pchar('Departamento(s) sem vinculo com o departamento financeiro: ' + #13 +
    	trim(vdepart.Text) +
     	#13 + #13 + 'Favor vincular os departamento'), 'Atenção', MB_ICONERROR);
 except
    on E: Exception do
    begin
      Application.MessageBox(Pchar('Erro ao verificar departamentos ' + e.Message), 'Atenção', MB_ICONERROR);
      registraErro('GEST001 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDREHw.verificarepdpto(vtp: integer; vtpdep: string): integer;
var
 i,x: integer;
begin
 if vtp = 1 then
 begin
  if vContabil then
  begin
    vrepdpto[0,0]:='NFP'; //Nota Fiscal de Produtos
    vrepdpto[1,0]:='CPP'; //Cupom Fiscal de Produtos
    vrepdpto[2,0]:='NFS'; // Nota Fiscal de Servicos
    vrepdpto[3,0]:='CPS'; //Cupom Fiscal de Servicos
    vrepdpto[4,0]:='NFVN'; // Nota Fiscal de Veiculos Novos
    vrepdpto[5,0]:='NFVU'; // Nota Fiscal de Veiculos Usados
    vrepdpto[6,0]:='CNS';  //
    vrepdpto[7,0]:='RETB'; // Retorno de Banco
    vrepdpto[8,0]:='DEVNFP'; //Devolucao de Produtos
    vrepdpto[9,0]:='DEVNFVN'; //Devolucao de Veiculos Novos
    vrepdpto[10,0]:='DEVNFVU';//Devolucao de Veiculos Usados
    vrepdpto[11,0]:='NFO';//Nota Fiscal Outras
    vrepdpto[12,0]:='NFPS';//Produtos usados em servicos na notafiscal de produtos
    vrepdpto[13,0]:='CPPS';//Produtos usados em servicos no cupom fiscal
    for i:=0 to 13 do
      for x := 1 to 1 do
        vrepdpto[i,x]:='0';
  end
  else
  begin
    vrepdpto[0,0]:='REQ';
    vrepdpto[1,0]:='OSP';
    vrepdpto[2,0]:='OSS';
    vrepdpto[3,0]:='OST';
    vrepdpto[4,0]:='OSPT';
    vrepdpto[5,0]:='VEI';
    vrepdpto[6,0]:='VEIU';
    vrepdpto[7,0]:='CNS';
    vrepdpto[8,0]:='RETB';
    vrepdpto[9,0]:='DEVP';
    vrepdpto[10,0]:='DEVVN';
    vrepdpto[11,0]:='DEVVU';
    for i:=0 to 11 do
     for x := 1 to 1 do
     begin
       vrepdpto[i,x]:='0';
     end;
  end;
   Result:=0;
 end;
 if vtp = 2 then
 begin
  if vContabil then
  begin
    for i:=0 to 13 do
      if vrepdpto[i,0] = vtpdep then
        vrepdpto[i,1]:=IntToStr(StrToInt(vrepdpto[i,1])+1);
  end
  else
  begin
    for i:=0 to 11 do
    begin
      if vrepdpto[i,0] = vtpdep then
      begin
        vrepdpto[i,1]:=IntToStr(StrToInt(vrepdpto[i,1])+1);
      end;
    end;
  end;
  Result:=0;
 end;
 if vtp = 3 then
 begin
  if vContabil then
  begin
    for i:=0 to 13 do
      if vrepdpto[i,0] = vtpdep then
        Result:=StrToInt(vrepdpto[i,1]);
  end
  else
  begin
    for i:=0 to 11 do
    begin
      if vrepdpto[i,0] = vtpdep then
      begin
       Result:=StrToInt(vrepdpto[i,1]);
      end;
    end;
  end;
 end;
 if vtp = 4 then
 begin
   Result:=0;
   for I := 0 to 98 do
   begin
    if vrepdptodest[i] = vtpdep then
      Result:=1;
   end;
 end;
 if vtp = 5 then
 begin
   Result:=0;
   for I := 0 to 98 do
   begin
    if vrepdptodest[i] = '' then
      vrepdptodest[i]:=vtpdep;
   end;
 end;
end;

function TDREHw.verificavinculacaodpto(vtp: integer): boolean;
begin
 Result:=true;
 buscas.close;
 if vtp = 2 then
 begin
  buscas.SQL.text:='select emp.nome_emp as Empresa, ' +
  	' f.nome_vendedor as Vendedor, ' +
    ' d.nome_depto as Departamento, ' +
    ' dpcx.desc_dep as DepartamentoFinanceiro, ' +
    ' func.desc_funcao as Funcao from colaborador f,depto d, funcoes func,depart_ct dpcx,empresa emp ' +
    ' where f.cod_funcao = func.cod_funcao and func.cod_depto = d.cod_depto and d.cod_dptocx = dpcx.cod_dep ' +
    ' and f.cod_empresa = emp.cod_empresa and f.cod_empresa in ('+vCodEmpresasDRE+') and f.ativo = 1 ' +
    ' order by empresa, DepartamentoFinanceiro';
  buscas.Open;
 end
 else
 begin
  buscas.SQL.text:='select count(*) as valor from colaborador f,depto d, funcoes func,depart_ct dpcx,empresa emp ' +
    ' where f.cod_funcao = func.cod_funcao and func.cod_depto = d.cod_depto and d.cod_dptocx = dpcx.cod_dep ' +
    ' and f.cod_empresa = emp.cod_empresa and f.ativo = 1 ' +
    ' and f.cod_empresa in ('+vCodEmpresasDRE+') and dpcx.cod_dep in '+vcoddemo;
  buscas.Open;
  if buscas.FieldByName('VALOR').AsInteger = 0 then
   Result:=false;
  buscas.Close;
 end;
end;

function TDREHw.verreplancdesp(vtpdesp: integer): boolean;
begin
 result:=false;
 vrateiorealizado.first;
 while not vrateiorealizado.Eof do
 begin
  if (trim(vrateiorealizado.FieldByName('DEPARTOR').AsString) = trim(vtiposRateio.FieldByName('DEPARTOR').AsString)) and
  (trim(vrateiorealizado.FieldByName('DEPARTDEST').AsString) = trim(vtiposRateio.FieldByName('DEPARTDEST').AsString)) and
  (vrateiorealizado.FieldByName('CODDRE').Asinteger = vtpdesp) and
  (vrateiorealizado.FieldByName('ANO').AsInteger = vano) and (vrateiorealizado.FieldByName('MES').AsInteger = vmes)
  then
   Result:=true;
  vrateiorealizado.Next;
 end;
end;

function TDREHw.vgerarGrafico(vdbgrid: TDBGrid; vchartanoat,
  vchartanoant: Tchart;vstringgrid: TstringGrid;vtp: integer): boolean;
var
  I,j,vtam: Integer;
  SeriesClass: TChartSeriesClass;
  NewSeries: TChartSeries;
  NewSeries1: TChartSeries;
  vseqgr:array of string;
//  vstringGrid: TStringGrid;
  vseqnum: integer;
  vanocomp: integer;
begin
  // destroy the existing series (in reverse order)
  if vtp = 1 then
   vanocomp:=vanoinf
  else
   vanocomp:=vanoinf-1;
  
   vtam:=1;
   SetLength(vseqgr,vtam);
   vseqgr[0]:='';
  // create the new series
//  vstringGrid:=TStringGrid.Create(Application);
  vIndicesDRE.First;
  while not vIndicesDRE.eof do
  begin
    if vdbgrid.SelectedRows.CurrentRowSelected then
    begin
       if not procuraitemvetor(vseqgr,vIndicesDRE.FieldByName('SEQUENCIA').AsString) then
       begin
         vseqgr[vtam-1]:=vIndicesDRE.FieldByName('SEQUENCIA').AsString;
         SetLength(vseqgr,vtam+1);
         vtam:=vtam+1;
         vseqgr[vtam-1]:='';
       end;
    end;
    vIndicesDRE.next;
  end;
  for i := 1 to vstringGrid.RowCount -1 do
    vstringGrid.Rows[I].Clear;
  vstringGrid.rowcount:=1;
  vstringGrid.Cells[0,0] :='Ano: '+inttostr(vanocomp);
  vstringGrid.ColCount:=vmesinf+1;
  j:=0;
  for I := 0 to Length(vseqgr)-1 do
  begin
   if vseqgr[i] <> '' then
     vstringGrid.rowcount:=vstringGrid.rowcount+1;
   vIndicesDRE.First;
   while not vIndicesDRE.eof do
   begin
     if vseqgr[i] <> '' then
     begin
       if vanocomp = vIndicesDRE.FieldByName('ANO').AsInteger then
       begin
         if vseqgr[i] = vIndicesDRE.FieldByName('SEQUENCIA').AsString then
         begin
          vstringGrid.Cells[0,j+1] :=vIndicesDRE.FieldByName('TIPOINDICADORES').AsString;
          vstringGrid.Cells[vIndicesDRE.FieldByName('MES').asinteger,0] :=vIndicesDRE.FieldByName('MES').asstring;
          vstringGrid.Cells[vIndicesDRE.FieldByName('MES').asinteger,j+1] :=vIndicesDRE.FieldByName('VALOR').asstring;
         end;
       end;
     end;
     vIndicesDRE.next;
   end;
   j:=j+1;
  end;
  // destroy the existing series (in reverse order)
//  vstringGrid.Free;
end;

constructor TDREHw.create;
begin
  vmes:=0;
  vano:=0;
  vpequilibrio:=0;
  vlucratividade:=0;
  vmargem:=0;
//  vRow:=0;
//  vCol:=0;
  SetLength(vrepdpto,14,2);
  SetLength(vrepdptodest,99);
  caddesp:=TDespesasGestor.create;
  CadDepto:=tDepto.create;
  CadDepto.abreBase;
  CadVendas:=TVendasGestor.create;
  CadVendas.ZeraVendas;
  CadApuracao:=TApuracaoDep.create;
  CadApuracao.abrebase;
  vIndicesDRE:=TClientDataSet(DtmGestorHw.CdsIndicadoresDRE);
  if vIndicesDRE.Tag <> 1 then
  begin
   vIndicesDRE.CreateDataSet;
   vIndicesDRE.Tag:=1;
  end;
  vIndicesDRE.Open;
  vtiposRateio:=TIBQuery(DtmGestorHw.IbTiposRateio);
  vtiposRateio.Open;
  vrateiorealizado:=TClientDataSet(DtmGestorHw.CdsRateioMes);
  if vrateiorealizado.Tag <> 1 then
  begin
   vrateiorealizado.CreateDataSet;
   vrateiorealizado.Tag:=1;
  end;
  vrateiorealizado.open;
//  caddesp.vratrealizado:=TClientDataSet(DtmGestorHw.CdsRateioMes);
//  SetLength(VendaVeic,2);
//  SetLength(VendaPecas,2);
//  SetLength(VendaOficina,2);
//  SetLength(VendaConsorcio,2);
//  SetLength(VendaRetBanco,2);
  SetLength(vdesconto,3);
  SetLength(vdespVariaveis,3);
  SetLength(vcustoVend,3);
  SetLength(vcontrBruta,3);
  SetLength(vvendLiquidas,3);
  SetLength(vimpostos,3);
  SetLength(vendasGeral,3);
  SetLength(vrecativop,3);
  SetLength(vdespFixas,3);
  SetLength(Vlucro_Prej,3);
  SetLength(voutrasRec,3);
  SetLength(vmargemContr,3);
  SetLength(vLucroLiquido,3);
  SetLength(vlucliqop,3);
  SetLength(lucliqop1,3);
  SetLength(vImpRenda,3);
  SetLength(vAdicionalIRRF,3);
  SetLength(vctSocial,3);
  SetLength(vreinv,3);
  SetLength(vremun,3);
  SetLength(vdespAdm,3);
  SetLength(vdevolucoes,3);
  SetLength(vdevolucoesCt,3);
  iniciavariaveis(1);
  vCompras:=0;
  EstMonetario:=0;
  buscas:=TIBQuery(DtmGestorHw.QrBuscas);
  transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
  buscas.Close;
  buscas.sql.text:='select coalesce(US_VLNF_VEICDRE,''N'') as US_VLNF_VEICDRE from empresa where cod_empresa = '+vDadosIni.codEmpresa;
  buscas.Open;
  if buscas.FieldByName('US_VLNF_VEICDRE').AsString = 'S' then
   vcampoutilvndveic:='VALTOT_V'
  else
   vcampoutilvndveic:='VALOR_REAL';
  buscas.close;
  Emes:=01;
  vmesinf:=0;
  vmes:=0;
  vexecutarmesatual:='';
  vregime:='';
  vContabil := False;
end;

function TDREHw.defineregime(vcomp, vcaixa: TRadioButton): boolean;
begin
  if vcomp.Checked then
  begin
    vregime:='COMP';
    caddesp.vregime:='COMP';
  end
  else
  begin
    vregime:='CAIXA';
    caddesp.vregime:='CAIXA';
  end;
end;

destructor TDREHw.destroy;
begin
  caddesp.free;
  CadVendas.free;
  CadApuracao.free;
  CadDepto.free;
//  vIndicesDRE.Tag:=0;
  vIndicesDRE.Close;
//  vIndicesDRE.Free;
//  vrateiorealizado.Tag:=0;
  vrateiorealizado.Close;
//  vrateiorealizado.Free;
end;

function TDREHw.efetRatSobreVenda(pBalDre: string): boolean;
var
 vpercRat: real;
 vsomaor,vsomadest:Currency;
 vqtdep,i: integer;
 vemp: string;
 vcoddre: array of string;
begin
  SetLength(vcoddre,11);
  vcoddre[0]:='2';
  vcoddre[1]:='9';
  vcoddre[2]:='10';
  vcoddre[3]:='11';
  vcoddre[4]:='12';
  vcoddre[5]:='14';
  vcoddre[6]:='15';
  vcoddre[7]:='17';
  vcoddre[8]:='18';
  vcoddre[9]:='19';
  vcoddre[10]:='21';
  //CadVendas.vbrutoat
  verificarepdpto(1,'');
  for I := 0 to 98 do
    vrepdptodest[i]:='';
  if vtiposRateio.State = dsinactive then
    vtiposRateio.Open;
  vtiposRateio.first;
  vqtdep:=0;
  while not vtiposRateio.eof do
  begin
   vqtdep:=vqtdep+1;
   vtiposRateio.next;
  end;
  vtiposRateio.first;
  // Assim ainda está sem média
  while not vtiposRateio.eof do
  begin
    vpercRat:=0;
    vsomaor:=0;
    vsomadest:=0;
    if pos(vtiposRateio.FieldByName('COD_DEP').AsString,vcoddemo) > 0 then
    begin
//      for I := 0 to 11 do
      begin
//       if (verificarepdpto(4,cadvendas.VendaporMod[i,0]+inttostr(vmes)+inttostr(vano)+) = 0) then
       begin
//        if pos(cadvendas.VendaporMod[i,0],vtiposRateio.fieldbyname('TPRAT').asstring) > 0 then
        begin
          if vContabil then
            vsomaor:=vsomaor+CadVendas.vendapordptoCNT('('+vtiposRateio.FieldByName('COD_DEP').AsString+')',vCodEmpresasDRE, pBalDre)
          else
	          vsomaor:=vsomaor+CadVendas.vendapordpto('('+vtiposRateio.FieldByName('COD_DEP').AsString+')',vCodEmpresasDRE, pBalDre);
//          (CadVendas.vbrutoat[i]-CadVendas.vdescat[i]);
//          verificarepdpto(2,cadvendas.VendaporMod[i,0]);
//          verificarepdpto(5,cadvendas.VendaporMod[i,0]+inttostr(vmes)+inttostr(vano));
        end;
       end;
      end;
      if vContabil then
      begin
        for I := 0 to 13 do
          if pos(cadvendas.VendaporModCNT[i,0] + ',', vtiposRateio.fieldbyname('RATEMCNT').asstring + ',') > 0 then
            vsomadest:=vsomadest+(CadVendas.vbrutoatrat[i]-CadVendas.vdescatRat[i]);
      end
      else
      begin
        for I := 0 to 11 do
        begin
          if pos(cadvendas.VendaporMod[i,0],vtiposRateio.fieldbyname('RATEM').asstring) > 0 then
          begin
            vsomadest:=vsomadest+(CadVendas.vbrutoatrat[i]-CadVendas.vdescatRat[i]);
          end;
        end;
      end;
      caddesp.vmesvendas:=vmes;
      caddesp.vanovendas:=vano;
      caddesp.vmesor:=vmesinf;
      caddesp.vtippesq:='M';
//      if vsomaor <> 0 then
      begin
        for i:=0 to 10 do
        begin
           caddesp.buscaDespDep(StrToInt(vcoddre[i]),vCodEmpresasDRE,'('+vtiposRateio.FieldByName('COD_DEPRAT').AsString+')',pBalDre,vContabil);
//          if not verreplancdesp(StrToInt(vcoddre[i])) then
//          begin
           vrateiorealizado.Append;
           vrateiorealizado.FieldByName('DEPARTOR').AsString:=vtiposRateio.FieldByName('DEPARTOR').AsString;
           vrateiorealizado.FieldByName('DEPARTDEST').AsString:=vtiposRateio.FieldByName('DEPARTDEST').AsString;
           if vContabil then
             vrateiorealizado.FieldByName('TIPRAT').AsString:=vtiposRateio.FieldByName('TPRATCNT').AsString
           else
           vrateiorealizado.FieldByName('TIPRAT').AsString:=vtiposRateio.FieldByName('TPRAT').AsString;
           vrateiorealizado.FieldByName('MEDQTDRATFAT').AsInteger:=vtiposRateio.FieldByName('MEDQTDRATFAT').AsInteger;
           if vContabil then
             vrateiorealizado.FieldByName('RATEM').AsString:=vtiposRateio.FieldByName('RATEMCNT').AsString
           else
           vrateiorealizado.FieldByName('RATEM').AsString:=vtiposRateio.FieldByName('RATEM').AsString;
           vrateiorealizado.FieldByName('COD_DEP').AsInteger:=vtiposRateio.FieldByName('COD_DEP').AsInteger;
           vrateiorealizado.FieldByName('COD_DEPRAT').AsInteger:=vtiposRateio.FieldByName('COD_DEPRAT').AsInteger;
           vrateiorealizado.FieldByName('VALOROR').AsCurrency:=vsomaor;
           vrateiorealizado.FieldByName('VALORDEST').AsCurrency:=vsomadest;
           vrateiorealizado.FieldByName('ANO').AsInteger:=vano;
           vrateiorealizado.FieldByName('MES').AsInteger:=vmes;
           vrateiorealizado.FieldByName('VALORDESPDEP').AsCurrency:=caddesp.vretorno[1];
           vrateiorealizado.FieldByName('CODDRE').AsString:=vcoddre[i];
           if vsomadest <> 0 then
            vpercRat:=((vsomaor/vsomadest)*100)
           else
           begin
            if CadVendas.vvendageral <> 0 then
             vpercRat:=0
            else
             vpercRat:=100/vqtdep;
           end;
           vrateiorealizado.FieldByName('PERCRAT').AsFloat:=vpercRat;
           vrateiorealizado.FieldByName('VALORRATEADO').AsCurrency:=(vpercRat*caddesp.vretorno[1])/100;
//           verificarepdpto(2,cadvendas.VendaporMod[i,0]);
           vrateiorealizado.post;
        end;
      end;
    end;
    vtiposRateio.next;
  end;
//  vrateiorealizado:=TClientDataSet(DtmGestorHw.CdsRateioMes);
end;

procedure TDREHw.efetRatSobreVendaDaMedia;
var
  vDataSetMedia: TClientDataSet;
  I: Integer;
 vpercRat: real;
begin
  vDataSetMedia := TClientDataSet.Create(Application);
  for I := 0 to vrateiorealizado.FieldCount - 1 do
    vDataSetMedia.FieldDefs.Add(
      vrateiorealizado.Fields[i].FieldName,
      vrateiorealizado.Fields[i].DataType,
      vrateiorealizado.Fields[i].Size,
      False);
  vDataSetMedia.CreateDataSet;
  vDataSetMedia.EmptyDataSet;

  vrateiorealizado.First;
  while not vrateiorealizado.Eof do
  begin
    vDataSetMedia.Filter :=
      'DEPARTOR = ' + QuotedStr(vrateiorealizado.FieldByName('DEPARTOR').AsString) +
      ' and DEPARTDEST = ' + QuotedStr(vrateiorealizado.FieldByName('DEPARTDEST').AsString) +
      ' and CODDRE = ' + QuotedStr(vrateiorealizado.FieldByName('CODDRE').AsString);
    vDataSetMedia.Filtered := True;

    if vDataSetMedia.IsEmpty then
    begin
      vDataSetMedia.Insert;
      vDataSetMedia.FieldByName('DEPARTOR').AsString      := vrateiorealizado.FieldByName('DEPARTOR').AsString;
      vDataSetMedia.FieldByName('DEPARTDEST').AsString    := vrateiorealizado.FieldByName('DEPARTDEST').AsString;
      vDataSetMedia.FieldByName('TIPRAT').AsString        := vrateiorealizado.FieldByName('TIPRAT').AsString;
      vDataSetMedia.FieldByName('MEDQTDRATFAT').AsInteger := vrateiorealizado.FieldByName('MEDQTDRATFAT').AsInteger;
      vDataSetMedia.FieldByName('RATEM').AsString         := vrateiorealizado.FieldByName('RATEM').AsString;
      vDataSetMedia.FieldByName('COD_DEP').AsInteger      := vrateiorealizado.FieldByName('COD_DEP').AsInteger;
      vDataSetMedia.FieldByName('COD_DEPRAT').AsInteger   := vrateiorealizado.FieldByName('COD_DEPRAT').AsInteger;
      vDataSetMedia.FieldByName('ANO').AsInteger          := 9999;
      vDataSetMedia.FieldByName('MES').AsInteger          := 99;
      vDataSetMedia.FieldByName('CODDRE').AsString        := vrateiorealizado.FieldByName('CODDRE').AsString;
      vDataSetMedia.Post;
    end;
    vrateiorealizado.Next;
  end;

  
  if vtiposRateio.State = dsinactive then
    vtiposRateio.Open;
  vtiposRateio.FetchAll;

  vDataSetMedia.Filter := '';
  vDataSetMedia.Filtered := False;
  vDataSetMedia.First;
  while not vDataSetMedia.Eof do
  begin
    vrateiorealizado.Filter :=
      'DEPARTOR = ' + QuotedStr(vDataSetMedia.FieldByName('DEPARTOR').AsString) +
      ' and DEPARTDEST = ' + QuotedStr(vDataSetMedia.FieldByName('DEPARTDEST').AsString) +
      ' and CODDRE = ' + QuotedStr(vDataSetMedia.FieldByName('CODDRE').AsString);
    vrateiorealizado.Filtered := True;

    vDataSetMedia.Edit;
    vrateiorealizado.First;
    while not vrateiorealizado.Eof do
    begin
      vDataSetMedia.FieldByName('VALOROR').AsCurrency := vDataSetMedia.FieldByName('VALOROR').AsCurrency +
        vrateiorealizado.FieldByName('VALOROR').AsCurrency;
      vDataSetMedia.FieldByName('VALORDEST').AsCurrency := vDataSetMedia.FieldByName('VALORDEST').AsCurrency +
        vrateiorealizado.FieldByName('VALORDEST').AsCurrency;
      vDataSetMedia.FieldByName('VALORDESPDEP').AsCurrency := vDataSetMedia.FieldByName('VALORDESPDEP').AsCurrency +
        vrateiorealizado.FieldByName('VALORDESPDEP').AsCurrency;
      vrateiorealizado.Next;
    end;

    if vDataSetMedia.FieldByName('VALORDEST').AsCurrency <> 0 then
      vpercRat := ((vDataSetMedia.FieldByName('VALOROR').AsCurrency / vDataSetMedia.FieldByName('VALORDEST').AsCurrency) * 100)
    else
    begin
      if CadVendas.vvendageral <> 0 then
        vpercRat:=0
      else
        vpercRat:= 100 / vtiposRateio.RecordCount;
    end;
    vDataSetMedia.FieldByName('PERCRAT').AsFloat := vpercRat;
    vDataSetMedia.FieldByName('VALOROR').AsCurrency := vDataSetMedia.FieldByName('VALOROR').AsCurrency / vMesesMedia;
    vDataSetMedia.FieldByName('VALORDEST').AsCurrency := vDataSetMedia.FieldByName('VALORDEST').AsCurrency / vMesesMedia;
    vDataSetMedia.FieldByName('VALORDESPDEP').AsCurrency := vDataSetMedia.FieldByName('VALORDESPDEP').AsCurrency / vMesesMedia;
    vDataSetMedia.FieldByName('VALORRATEADO').AsCurrency := ( vpercRat * vDataSetMedia.FieldByName('VALORDESPDEP').AsCurrency) / 100;
    vDataSetMedia.Post;

    vDataSetMedia.Next;
  end;

  vrateiorealizado.Filter := '';
  vrateiorealizado.Filtered := False;
  vrateiorealizado.EmptyDataSet;

  vDataSetMedia.First;
  while not vDataSetMedia.Eof do
  begin
    vrateiorealizado.Append;
    for I := 0 to vDataSetMedia.FieldCount - 1 do
      vrateiorealizado.FieldByName(vDataSetMedia.Fields[I].FieldName).Value :=
        vDataSetMedia.FieldByName(vDataSetMedia.Fields[I].FieldName).Value;

    vrateiorealizado.Post;
    vDataSetMedia.Next;
  end;
end;

function TDREHw.gravacustosporDpto(vqtddep,vqtddepsel: integer;vgriddep: Tdbgrid;vcodempresa: integer;stgridDRE: TstringGrid): boolean;
var
 vcoddep: integer;
 vfaturamento,vvaldinCMV,vvaldinOCV,vperccf,vcf,vcmv,vocv,vadirrf, virrf: currency;
 vrtemp: Currency;
 vdata: TDate;
 vUsarMedias, vContinuar: Boolean;
 vTmpUltMeses: Integer;
begin
if vqtddep = vqtddepsel then
  vcoddep:=99
else
begin
  CadDepto.First;
  while not CadDepto.Eof do
  begin
    if vgriddep.SelectedRows.CurrentRowSelected then
     vcoddep:=CadDepto.dataSet.fieldbyname('COD_DEP').AsInteger;
    CadDepto.dataSet.next;
  end;
end;

  vTmpUltMeses := 0;
  vUsarMedias := Application.MessageBox(PChar('Deseja usar as médias dos últimos ' + IntToStr(vMesesMedia) + ' meses?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
  if vUsarMedias then
  begin
    vContinuar := Application.MessageBox(PChar('O sistema vai salvar os dados da apuração com base nas médias dos últimos ' + IntToStr(vMesesMedia) + ' meses. Deseja continuar?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
    vTmpUltMeses := 8;// para ajustar qual coluna vai usar do stringgrid: 1 e 2 mes informado, 1 ou 2 + 8 = 9 e 10 para media ultimos meses
  end
  else
    vContinuar := Application.MessageBox('O sistema vai salvar os dados da apuração com base no mês informado. Deseja continuar?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;

  if not vContinuar then
    Exit;

try
  IniciaTransacao;
  vdata:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
  vcf:=(strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[1+vTmpUltMeses,10],2))+
  strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[1+vTmpUltMeses,11],2)));
  vcmv:=strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[2+vTmpUltMeses,7],2));
  vocv:=strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[2+vTmpUltMeses,9],2))+
  strtocurr(vDadosIni.tirapontos((stgridDRE.Cells[2+vTmpUltMeses,17]),2))+
  strtocurr(vDadosIni.tirapontos((stgridDRE.Cells[2+vTmpUltMeses,2]),2))+
  strtocurr(vDadosIni.tirapontos((stgridDRE.Cells[2+vTmpUltMeses,18]),2))+
  strtocurr(vDadosIni.tirapontos((stgridDRE.Cells[2+vTmpUltMeses,19]),2));
  vperccf:=(strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[2+vTmpUltMeses,10],2))+
  strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[2+vTmpUltMeses,11],2)));
  vvaldinCMV:=strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[1+vTmpUltMeses,7],2));
  vvaldinOCV:=strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[1+vTmpUltMeses,9],2))+
  strtocurr(vDadosIni.tirapontos((stgridDRE.Cells[1+vTmpUltMeses,17]),2))+
  strtocurr(vDadosIni.tirapontos((stgridDRE.Cells[1+vTmpUltMeses,18]),2))+
  strtocurr(vDadosIni.tirapontos((stgridDRE.Cells[1+vTmpUltMeses,19]),2));
  vfaturamento:=strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[1+vTmpUltMeses,6],2));
  vrtemp:=strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[1+vTmpUltMeses,16],2));
  virrf:=strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[1+vTmpUltMeses,18],2));
  vadirrf:=strtocurr(vDadosIni.tirapontos(stgridDRE.Cells[1+vTmpUltMeses,19],2));
  CadApuracao.close;
  CadApuracao.dataSet.CommandText:='SELECT * FROM APURACAO_DEPTO WHERE COD_DEP = '+
  inttostr(vcoddep)+' AND MES = '+IntToStr(vmesinf)+' AND ANO = '+IntToStr(vanoinf)+
  'AND TPDESP = ''CF'' AND COD_EMPRESA = '+INTTOSTR(vcodempresa);
  CadApuracao.open;
  if CadApuracao.IsEmpty then
   CadApuracao.Insert
  else
   CadApuracao.Edit;

  CadApuracao.dataSet.FieldByName('COD_DEP').value:=vcoddep;
  CadApuracao.dataSet.FieldByName('MES').AsInteger:=vmesinf;
  CadApuracao.dataSet.FieldByName('ANO').AsInteger:=vanoinf;
  CadApuracao.dataSet.FieldByName('TPDESP').asstring:='CF';
  CadApuracao.dataSet.FieldByName('COD_EMPRESA').AsInteger:=vcodempresa;
  CadApuracao.dataSet.FieldByName('VALOR').AsCurrency:=vcf;
//  (vdespFixas[0]+vdespAdm[0]);
  CadApuracao.dataSet.FieldByName('PE').AsCurrency:= vDadosIni.retornoPorCondicao(vUsarMedias,vpequilibrioMed,vpequilibrio);
  CadApuracao.dataSet.FieldByName('DNADEP').AsString:='CF('+
  vDadosIni.alndir(trim(Format('%n', [vcf])),12)+')+CMV('+
  vDadosIni.alndir(trim(Format('%n', [vcmv])),6)+'%F)+OCV('+
  vDadosIni.alndir(trim(Format('%n', [vocv])), 6)+'%F)+L=F';
  CadApuracao.dataSet.FieldByName('DATACAD_AP').AsDateTime:=vdata;
  CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency:=vperccf;
  CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency:=vcf;
  CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency:=vfaturamento;
  CadApuracao.dataSet.FieldByName('MARGMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmargemMed,vmargem);
  CadApuracao.dataSet.FieldByName('MARKUPMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmarkupminMed,vmarkupmin);

  CadApuracao.dataSet.FieldByName('APURACAO_CONTABIL').AsString:=vDadosIni.retornoPorCondicao(vContabil,'S','N');
  CadApuracao.dataSet.FieldByName('APURACAO_MEDIA').AsString:=vDadosIni.retornoPorCondicao(vUsarMedias,'S','N');
  CadApuracao.dataSet.FieldByName('APURACAO_MEDIA_MESES').AsInteger:=vDadosIni.retornoPorCondicao(vUsarMedias,vMesesMedia,0);
  CadApuracao.Post;
  CadApuracao.Apply;
  CadApuracao.close;
  CadApuracao.dataSet.CommandText:='SELECT * FROM APURACAO_DEPTO WHERE COD_DEP = '+
  inttostr(vcoddep)+' AND MES = '+IntToStr(vmesinf)+' AND ANO = '+IntToStr(vanoinf)+
  'AND TPDESP = ''CMV'' AND COD_EMPRESA = '+INTTOSTR(vcodempresa);
  CadApuracao.open;
  if CadApuracao.IsEmpty then
   CadApuracao.Insert
  else
   CadApuracao.Edit;
  CadApuracao.dataSet.FieldByName('COD_DEP').value:=vcoddep;
  CadApuracao.dataSet.FieldByName('MES').AsInteger:=vmesinf;
  CadApuracao.dataSet.FieldByName('ANO').AsInteger:=vanoinf;
  CadApuracao.dataSet.FieldByName('TPDESP').asstring:='CMV';
  CadApuracao.dataSet.FieldByName('COD_EMPRESA').AsInteger:=vcodempresa;
  CadApuracao.dataSet.FieldByName('VALOR').AsCurrency:=vcmv;
//  (vdespFixas[0]+vdespAdm[0]);
  CadApuracao.dataSet.FieldByName('PE').AsCurrency:= vDadosIni.retornoPorCondicao(vUsarMedias,vpequilibrioMed,vpequilibrio);
  CadApuracao.dataSet.FieldByName('DNADEP').AsString:='CF('+
  vDadosIni.alndir(trim(Format('%n', [vcf])),12)+')+CMV('+
  vDadosIni.alndir(trim(Format('%n', [vcmv])),6)+'%F)+OCV('+
  vDadosIni.alndir(trim(Format('%n', [vocv])), 6)+'%F)+L=F';
  CadApuracao.dataSet.FieldByName('DATACAD_AP').AsDateTime:=vdata;
  CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency:=vcmv;
  CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency:=vvaldinCMV;
  CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency:=vfaturamento;
  CadApuracao.dataSet.FieldByName('MARGMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmargemMed,vmargem);
  CadApuracao.dataSet.FieldByName('MARKUPMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmarkupminMed,vmarkupmin);

  CadApuracao.dataSet.FieldByName('APURACAO_CONTABIL').AsString:=vDadosIni.retornoPorCondicao(vContabil,'S','N');
  CadApuracao.dataSet.FieldByName('APURACAO_MEDIA').AsString:=vDadosIni.retornoPorCondicao(vUsarMedias,'S','N');
  CadApuracao.dataSet.FieldByName('APURACAO_MEDIA_MESES').AsInteger:=vDadosIni.retornoPorCondicao(vUsarMedias,vMesesMedia,0);
  CadApuracao.Post;
  CadApuracao.Apply;
  CadApuracao.close;
  CadApuracao.dataSet.CommandText:='SELECT * FROM APURACAO_DEPTO WHERE COD_DEP = '+
  inttostr(vcoddep)+' AND MES = '+IntToStr(vmesinf)+' AND ANO = '+IntToStr(vanoinf)+
  'AND TPDESP = ''OCV'' AND COD_EMPRESA = '+INTTOSTR(vcodempresa);
  CadApuracao.open;
  if CadApuracao.IsEmpty then
   CadApuracao.Insert
  else
   CadApuracao.Edit;
  CadApuracao.dataSet.FieldByName('COD_DEP').value:=vcoddep;
  CadApuracao.dataSet.FieldByName('MES').AsInteger:=vmesinf;
  CadApuracao.dataSet.FieldByName('ANO').AsInteger:=vanoinf;
  CadApuracao.dataSet.FieldByName('TPDESP').asstring:='OCV';
  CadApuracao.dataSet.FieldByName('COD_EMPRESA').AsInteger:=vcodempresa;
  CadApuracao.dataSet.FieldByName('VALOR').AsCurrency:=vocv;
//  (vdespFixas[0]+vdespAdm[0]);
  CadApuracao.dataSet.FieldByName('PE').AsCurrency:= vDadosIni.retornoPorCondicao(vUsarMedias,vpequilibrioMed,vpequilibrio);
  CadApuracao.dataSet.FieldByName('DNADEP').AsString:='CF('+
  vDadosIni.alndir(trim(Format('%n', [vcf])),12)+')+CMV('+
  vDadosIni.alndir(trim(Format('%n', [vcmv])),6)+'%F)+OCV('+
  vDadosIni.alndir(trim(Format('%n', [vocv])), 6)+'%F)+L=F';
  CadApuracao.dataSet.FieldByName('DATACAD_AP').AsDateTime:=vdata;
  CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency:=vocv;
  CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency:=vvaldinOCV;
  CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency:=vfaturamento;
  CadApuracao.dataSet.FieldByName('MARGMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmargemMed,vmargem);
  CadApuracao.dataSet.FieldByName('MARKUPMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmarkupminMed,vmarkupmin);

  CadApuracao.dataSet.FieldByName('APURACAO_CONTABIL').AsString:=vDadosIni.retornoPorCondicao(vContabil,'S','N');
  CadApuracao.dataSet.FieldByName('APURACAO_MEDIA').AsString:=vDadosIni.retornoPorCondicao(vUsarMedias,'S','N');
  CadApuracao.dataSet.FieldByName('APURACAO_MEDIA_MESES').AsInteger:=vDadosIni.retornoPorCondicao(vUsarMedias,vMesesMedia,0);
  CadApuracao.Post;
  CadApuracao.Apply;
  //Adicional Imposto de Renda, salva o percentualque exceda os 20000.
  if (vadirrf > 0) and (vcoddep = 99) then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select imp_renda, imp_renda_adicional from empresa' +
      ' where cod_empresa = ' + IntToStr(vcodempresa);
    buscas.Open;
    if (buscas.FieldByName('imp_renda').AsFloat > 0) and (virrf > 0) then
      vrtemp := virrf / buscas.FieldByName('imp_renda').AsFloat * 100; //valor pago convertido para o valor base de calculo lucro
    if (buscas.FieldByName('imp_renda_adicional').AsFloat > 0) then
      vadirrf := vadirrf / buscas.FieldByName('imp_renda_adicional').AsFloat * 100;//valor pago convertido para o valor base de calculo

    vadirrf := vDadosIni.StrToFloatFormat(vadirrf / vrtemp * 100, 2);
    buscas.Close;
  end
  else
    vadirrf := 0;
  if vadirrf > 0 then
  begin
    CadApuracao.close;
    CadApuracao.dataSet.CommandText:='SELECT * FROM APURACAO_DEPTO WHERE COD_DEP = '+
    inttostr(vcoddep)+' AND MES = '+IntToStr(vmesinf)+' AND ANO = '+IntToStr(vanoinf)+
    'AND TPDESP = ''AIR'' AND COD_EMPRESA = '+INTTOSTR(vcodempresa);
    CadApuracao.open;
    if CadApuracao.IsEmpty then
     CadApuracao.Insert
    else
     CadApuracao.Edit;
    CadApuracao.dataSet.FieldByName('COD_DEP').value:=vcoddep;
    CadApuracao.dataSet.FieldByName('MES').AsInteger:=vmesinf;
    CadApuracao.dataSet.FieldByName('ANO').AsInteger:=vanoinf;
    CadApuracao.dataSet.FieldByName('TPDESP').asstring:='AIR';
    CadApuracao.dataSet.FieldByName('COD_EMPRESA').AsInteger:=vcodempresa;
    CadApuracao.dataSet.FieldByName('VALOR').AsCurrency:=vadirrf;
  //  (vdespFixas[0]+vdespAdm[0]);
    CadApuracao.dataSet.FieldByName('PE').AsCurrency:= vDadosIni.retornoPorCondicao(vUsarMedias,vpequilibrioMed,vpequilibrio);
    CadApuracao.dataSet.FieldByName('DNADEP').AsString:='CF('+
    vDadosIni.alndir(trim(Format('%n', [vcf])),12)+')+CMV('+
    vDadosIni.alndir(trim(Format('%n', [vcmv])),6)+'%F)+OCV('+
    vDadosIni.alndir(trim(Format('%n', [vocv])), 6)+'%F)+L=F';
    CadApuracao.dataSet.FieldByName('DATACAD_AP').AsDateTime:=vdata;
    CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency:=vadirrf;
    CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency:=vvaldinOCV;
    CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency:=vfaturamento;
    CadApuracao.dataSet.FieldByName('MARGMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmargemMed,vmargem);
    CadApuracao.dataSet.FieldByName('MARKUPMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmarkupminMed,vmarkupmin);

    CadApuracao.dataSet.FieldByName('APURACAO_CONTABIL').AsString:=vDadosIni.retornoPorCondicao(vContabil,'S','N');
    CadApuracao.dataSet.FieldByName('APURACAO_MEDIA').AsString:=vDadosIni.retornoPorCondicao(vUsarMedias,'S','N');
    CadApuracao.dataSet.FieldByName('APURACAO_MEDIA_MESES').AsInteger:=vDadosIni.retornoPorCondicao(vUsarMedias,vMesesMedia,0);
    CadApuracao.Post;
    CadApuracao.Apply;
  end;
  // Grava os rateios...
  vrateiorealizado.First;
  while not vrateiorealizado.Eof do
  begin
    if (vrateiorealizado.FieldByName('MES').AsInteger = vmesinf) and
    (vrateiorealizado.FieldByName('ANO').AsInteger = vanoinf) then
    begin
      CadApuracao.close;
      CadApuracao.dataSet.CommandText:='SELECT * FROM APURACAO_DEPTO WHERE COD_DEP = '+
      vrateiorealizado.FieldByName('COD_DEP').AsString+' AND MES = '+IntToStr(vmesinf)+' AND ANO = '+IntToStr(vanoinf)+
      ' AND TPDESP = ''RAT'' AND COD_EMPRESA = '+INTTOSTR(vcodempresa);
      CadApuracao.open;
      if CadApuracao.IsEmpty then
       CadApuracao.Insert
      else
       CadApuracao.Edit;
      CadApuracao.dataSet.FieldByName('COD_DEP').value:=vrateiorealizado.FieldByName('COD_DEP').AsInteger;
      CadApuracao.dataSet.FieldByName('MES').AsInteger:=vmesinf;
      CadApuracao.dataSet.FieldByName('ANO').AsInteger:=vanoinf;
      CadApuracao.dataSet.FieldByName('TPDESP').asstring:='RAT';
      CadApuracao.dataSet.FieldByName('COD_EMPRESA').AsInteger:=vcodempresa;
      CadApuracao.dataSet.FieldByName('VALOR').AsCurrency:=vrateiorealizado.FieldByName('PERCRAT').AsFloat;
    //  (vdespFixas[0]+vdespAdm[0]);
      CadApuracao.dataSet.FieldByName('PE').AsCurrency:= vDadosIni.retornoPorCondicao(vUsarMedias,vpequilibrioMed,vpequilibrio);
      CadApuracao.dataSet.FieldByName('DNADEP').AsString:='CF('+
      vDadosIni.alndir(trim(Format('%n', [vcf])),12)+')+CMV('+
      vDadosIni.alndir(trim(Format('%n', [vcmv])),6)+'%F)+OCV('+
      vDadosIni.alndir(trim(Format('%n', [vocv])), 6)+'%F)+L=F';
      CadApuracao.dataSet.FieldByName('DATACAD_AP').AsDateTime:=vdata;
      CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency:=vrateiorealizado.FieldByName('PERCRAT').AsFloat;
      CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency:=0;
      CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency:=vfaturamento;
      CadApuracao.dataSet.FieldByName('MARGMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmargemMed,vmargem);
      CadApuracao.dataSet.FieldByName('MARKUPMIN').AsFloat:=vDadosIni.retornoPorCondicao(vUsarMedias,vmarkupminMed,vmarkupmin);

      CadApuracao.dataSet.FieldByName('APURACAO_CONTABIL').AsString:=vDadosIni.retornoPorCondicao(vContabil,'S','N');
      CadApuracao.dataSet.FieldByName('APURACAO_MEDIA').AsString:=vDadosIni.retornoPorCondicao(vUsarMedias,'S','N');
      CadApuracao.dataSet.FieldByName('APURACAO_MEDIA_MESES').AsInteger:=vDadosIni.retornoPorCondicao(vUsarMedias,vMesesMedia,0);
      CadApuracao.Post;
      CadApuracao.Apply;
    end;
    vrateiorealizado.Next;
  end;


  CommitaTransacao;
except
    on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(Pchar('GEST001 '+e.Message), 'Confirmação', MB_OK);
      registraErro('GEST001 ' + e.Message);
      Result := False;
    end;
end;

end;

function TDREHw.gravaindicesmeses(vdescricao: string;valor: currency;seq: integer): boolean;
begin
 vIndicesDRE.Append;
 vIndicesDRE.FieldByName('TIPOINDICADORES').AsString:=vdescricao;
 vIndicesDRE.FieldByName('MES').AsInteger:=vmes;
 vIndicesDRE.FieldByName('ANO').AsInteger:=vano;
 vIndicesDRE.FieldByName('VALOR').AsCurrency:=valor;
 vIndicesDRE.FieldByName('SEQUENCIA').AsCurrency:=seq;
 vIndicesDRE.Post;
end;

function TDREHw.iniciavariaveis(vitx: integer): boolean;
var
 i: integer;
 x: integer;
begin
  Result:=true;
  if vitx = 1 then
   x:=0
  else
   x:=2;

  for I := x to 2 do
  begin
//   VendaVeic[i]:=0;
//   VendaPecas[i]:=0;
//   VendaOficina[i]:=0;
//   VendaConsorcio[i]:=0;
//   VendaRetBanco[i]:=0;
   vdesconto[i]:=0;
   vdespVariaveis[i]:=0;
   vcustoVend[i]:=0;
   vcontrBruta[i]:=0;
   vvendLiquidas[i]:=0;
   vimpostos[i]:=0;
   vendasGeral[i]:=0;
   vdespFixas[i]:=0;
   vrecativop[i]:=0;
   Vlucro_Prej[i]:=0;
   voutrasRec[i]:=0;
   vmargemContr[i]:=0;
   vLucroLiquido[i]:=0;
   vlucliqop[i]:=0;
   lucliqop1[i]:=0;
   vImpRenda[i]:=0;
   vAdicionalIRRF[i]:=0;
   vctSocial[i]:=0;
   vreinv[i]:=0;
   vremun[i]:=0;
   vdespAdm[i]:=0;
   vdevolucoes[i]:=0;
   vdevolucoesCt[i]:=0;
  end;
end;

function TDREHw.montadatasBI: boolean;
begin
 CadVendas.vdat1:=StrToDate('01/'+inttostr(Emes)+'/'+IntToStr(vanoinf));
 CadVendas.vdat2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
 caddesp.vdat1:=StrToDate('01/'+inttostr(Emes)+'/'+IntToStr(vanoinf));
 caddesp.vdat2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
 caddesp.vcoddemo:=vcoddemo;
 CadVendas.vdatant1:=StrToDate('01/'+inttostr(Emes)+'/'+IntToStr(vanoinf-1));
 CadVendas.vdatant2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf-1))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf-1));
 caddesp.vdatant1:=StrToDate('01/'+inttostr(Emes)+'/'+IntToStr(vanoinf-1));
 caddesp.vdatant2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf-1))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf-1));
// caddesp.vnumDRE:=vnum
end;

function TDREHw.MontaDRE(vgriddep: Tdbgrid;stgridDRE: TstringGrid;stgridVendas: TstringGrid;pBalDre: string): boolean;
var
  imudano,itxano,itx: integer;
//  vdata, Data: TDateTime;
//  Dia, Mes, Ano: Word;
//  Contador: Integer;
//  Vvndmes, vliqof, vdescR, vdesc: currency;
//  vtotadm: currency;
  vtemp,vvendatotal: real;
  vpercdemo: real;
  vvolta: integer;
  vultdia: integer;
  vpercequil: real;
  I: Integer;
  vDataTmp: TDate;
  vMesTemporario, vAnoTemporario: Integer;
  vrTemp: Currency;
begin
  Result:=true;
  if vContabil then
    stgridVendas.RowCount := 15;
  stgridDRE.ColCount := 11;
  stgridDRE.ColWidths[09] := stgridDRE.ColWidths[1];
  stgridDRE.ColWidths[10] := stgridDRE.ColWidths[2];
  vdepDemo := '';
  vcoddemo:='(';
  itxano:=0;
  CadDepto.First;
  while not CadDepto.Eof do
  begin
    if vgriddep.SelectedRows.CurrentRowSelected then
    begin
      vdepDemo := vdepDemo + ' ' +CadDepto.dataSet.FieldByName('DESC_DEP').AsString;
      if Length(vcoddemo) > 1 then
       vcoddemo:=vcoddemo+','+CadDepto.dataSet.FieldByName('COD_DEP').AsString
      else
       vcoddemo:=vcoddemo+CadDepto.dataSet.FieldByName('COD_DEP').AsString;
    end;
    CadDepto.dataSet.next;
  end;
  CadDepto.First;
  vcoddemo:=vcoddemo+')';
  if vdepDemo = '' then
  begin
    Application.MessageBox('Selecione os Departamentos', 'Confirmação', MB_OK);
    result:=false;
    exit;
  end;
  if not verificadepto then
  begin
    result:=false;
    exit;
  end;
  if not verificavinculacaodpto(1) then
  begin
    Application.MessageBox('Sem Vinculação de venda para o(s) Departamentos Selecionado(s) ', 'Confirmação', MB_OK);
    result:=false;
    exit;
  end;
  if vversao = '' then
  begin
    Application.MessageBox('Informe a Versão do Automação', 'Confirmação', MB_OK);
    result:=false;
    exit;
  end;
  if (vmesinf = 0) or (vano = 0) then
  begin
   Application.MessageBox('Mês ou Ano não informado(s)', 'Confirmação', MB_OK);
   result:=false;
   exit;
  end;
  if (vmesinf > 12) or (vmesinf < 0) or (vano < 2007)  then
  begin
   Application.MessageBox('Mês ou Ano Inválido(s)', 'Confirmação', MB_OK);
   result:=false;
   exit;
  end;
  if (vMesesMedia > 12) or (vMesesMedia < 1) then
  begin 
   Application.MessageBox('Quantide de meses informada para a Média inválida. Informar entre 1 e 12 meses', 'Confirmação', MB_OK);
   result:=false;
   exit;
  end;
  //******************* Montando o StringGrid ************************************
  stgridDRE.Cells[0, 0] := 'Descrição';
  stgridDRE.Cells[1, 0] := 'Valores';
  stgridDRE.Cells[2, 0] := '% Sobre Fat';
  stgridDRE.Cells[3, 0] := 'Ano';
  stgridDRE.Cells[4, 0] := '% Sobre Fat';
  stgridDRE.Cells[5, 0] := 'Mes Ano Anterior';
  stgridDRE.Cells[6, 0] := '% Sobre Fat';
  stgridDRE.Cells[7, 0] := 'Ano Anterior';
  stgridDRE.Cells[8, 0] := '% Sobre Fat';
  //medias
  stgridDRE.Cells[9, 0] := 'Média ' + IntToStr(vMesesMedia) + ' meses';
  stgridDRE.Cells[10, 0] := '% ' + IntToStr(vMesesMedia) + ' meses';

  stgridDRE.Cells[0, 1] := '1  - Receita Operacional Bruta.';
  stgridDRE.Cells[0, 2] := '2  - Impostos Pagos na Venda';
  stgridDRE.Cells[0, 3] := '3  - Devoluções';
  stgridDRE.Cells[0, 4] := '4  - Descontos';
  stgridDRE.Cells[0, 5] := '5  - Total das Deduções(2+3+4).';
  stgridDRE.Cells[0, 6] := '6  - Receita Operacional Liquida(1-5).';
  stgridDRE.Cells[0, 7] := '7  - Custo Mercadoria Vendida(CMV)';
  stgridDRE.Cells[0, 8] := '8  - Lucro Bruto(6-7).';
  stgridDRE.Cells[0, 9] := '9  - Despesas Variaveis';
  stgridDRE.Cells[0, 10]:= '10 - Despesas Fixas';
  stgridDRE.Cells[0, 11]:= '11 - Despesas Administrativas ';
  stgridDRE.Cells[0, 12]:= '12 - Remuneração de Capital de Terceiro';
  stgridDRE.Cells[0, 13]:= '13 - Resultado Operacional Líquido(8-9-10-11-12).';
  stgridDRE.Cells[0, 14]:= '14 - Receita Vnd Ativo Permanente';
  stgridDRE.Cells[0, 15]:= '15 - Outras Receitas';
  stgridDRE.Cells[0, 16]:= '16 - Resultado Liquido Antes CSLL(13+14+15).';

  stgridDRE.Cells[0, 17]:= '17 - Contribuição Social Sobre o Lucro';
  stgridDRE.Cells[0, 18]:= '18 - Imposto de Renda Pessoa Jurídica';
  stgridDRE.Cells[0, 19]:= '19 - Adicional do Imposto de Renda Pessoa Jurídica';
//  stgridDRE.Cells[0, 19]:= '19 - Simples Federal';

  stgridDRE.Cells[0, 20]:= '20 - Resultado Líquido do Exercício(16-17-18-19).';
  // resultado opcional de escolha
  stgridDRE.Cells[0, 21]:= '21 - Investimentos';
  stgridDRE.Cells[0, 22]:= '.22 - Lucro Liquido Retido na Empresa(20-21)';

  //*************Monta Titulo StringList de Vendas******************//
  stgridVendas.Cells[0, 0] := 'Tipo de Venda';
  stgridVendas.Cells[1, 0] := 'Valor (R$)';
  stgridVendas.Cells[2, 0] := 'Percentual (%)';
  //**************************************//
  vIndicesDRE.EmptyDataSet;
  vrateiorealizado.EmptyDataSet;

  //********************************realizando a média ultimos 12 meses
  vAnoTemporario := vano;
  vMesTemporario := vmesinf;

  iniciavariaveis(1);//1: limpa todos os 3 valores dos arrays
  CadVendas.ZeraVendas;
  vanoinf := vano;
  vmes := vmesinf;
  vDataTmp := EncodeDate(vanoinf, vmes, 1);
  for I := 1 to vMesesMedia do
  begin
    CadVendas.vdat1 := StartOfTheMonth(vDataTmp);
    CadVendas.vdat2 := EndOfTheMonth(vDataTmp);

    CadVendas.vmesvendas:=vmes;
    CadVendas.vanovendas:=vanoinf;
    vano:=vanoinf;
    cadvendas.vmesor:=vmesinf;
    CadVendas.vtippesq:='M';
    CadVendas.vcoddemo:=vcoddemo;
    if vContabil then
      CadVendas.vendasGeraisCNT(vCodEmpresasDRE, pBalDre)
    else
      CadVendas.vendasGerais(vCodEmpresasDRE, pBalDre);

    efetRatSobreVenda(pBalDre);
    vendasSELDRE(vgriddep,0);
    itxano := 1; //Indica o valor acumulado geral em cada array: 0 mes atual, 1 acumulado, 2 venda bruta mes informado
    stgridDRE.Cells[ 09, 01] := vDadosIni.alndir(Format('%n', [(vendasGeral[itxano] / vMesesMedia)]), 14);

    itx := 02;//Impostos pagos na venda
    VerbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vimpostos[itxano] / vMesesMedia)]), 14);
    try
      if (vendasGeral[0] + vdesconto[0]) <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vimpostos[itxano] * 100) / (vendasGeral[itxano] + vdesconto[itxano]))]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 03;//Devoluções
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vdevolucoes[itxano] / vMesesMedia)]), 14);
    try
    if vendasGeral[itxano] <> 0 then
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [(vdevolucoes[itxano] * 100) / (vendasGeral[itxano])]), 6)
    else
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 04;// Descontos
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vdesconto[itxano] / vMesesMedia)]), 14);
    try
    if vendasGeral[itxano] <> 0 then
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [(vdesconto[itxano] * 100) / (vendasGeral[itxano])]), 6)
    else
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 05;// Total Deducoes
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [((vimpostos[itxano]+vdevolucoes[itxano]+vdesconto[itxano]) / vMesesMedia)]), 14);
    if vendasGeral[itxano] <> 0 then
    begin
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vimpostos[itxano]+vdevolucoes[itxano]+vdesconto[itxano])*100)/(vendasGeral[itxano])]), 6);
      stgridDRE.Cells[ 10, 1] := vDadosIni.alndir(Format('%n', [100+(((vimpostos[itxano]+vdevolucoes[itxano]+vdesconto[itxano])*100)/(vendasGeral[itxano]))]), 6);
    end
    else
    begin
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
      stgridDRE.Cells[ 10, 1] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    end;

    itx := 06;//  Receita Operacional Liquida
    vvendLiquidas[itxano]:=vendasgeral[itxano]-(vdesconto[itxano]+vimpostos[itxano]+vdevolucoes[itxano]);
  //  vvendLiquidas[2]:=vendasgeral[2]-(vdesconto[2]+vimpostos[2]+vdevolucoes[2]);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [vvendLiquidas[itxano] / vMesesMedia]), 14);
    stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [100.00]), 6);
  //  gravaindicesmeses(stgridDRE.Cells[0, itx],vvendLiquidas[2],itx); SE FOR GRAVAR TEM DE REMOVER O COMENTARIO LA LINHA ACIMA

    itx := 07;//  CMV
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vcustoVend[itxano]-vdevolucoesCt[itxano]) / vMesesMedia]), 14);
    if vvendLiquidas[itxano] <> 0 then
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vcustoVend[itxano]-vdevolucoesCt[itxano])/vvendLiquidas[itxano])*100]), 6)
    else
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);

    itx := 08;//  Lucro Bruto
    vcontrBruta[itxano]:=vvendLiquidas[itxano]-(vcustoVend[itxano]-vdevolucoesCt[itxano]);
  //  vcontrBruta[2]:=vvendLiquidas[2]-(vcustoVend[2]-vdevolucoesCt[2]);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [vcontrBruta[itxano] / vMesesMedia]), 14);
    if vvendLiquidas[itxano] <> 0 then
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [(vcontrBruta[itxano]/vvendLiquidas[itxano])*100]), 6)
    else
      stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);

    itx := 09;//  Despesas Variaveis
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vdespVariaveis[itxano]) / vMesesMedia]), 14);
    vmargemContr[itxano]:=vcontrBruta[itxano]-vdespVariaveis[itxano];
  //  vmargemContr[2]:=vcontrBruta[2]-vdespVariaveis[2];
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vdespVariaveis[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 10;//  Despesas Fixas
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vdespFixas[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vdespFixas[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 11;//  Despesas Administrativas
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vdespAdm[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vdespAdm[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 12;//  Remuneracao de Capital de Terceiro
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vremun[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vremun[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except

    end;

    itx := 13;// Resultado Operacional Liquido
    Vlucro_Prej[itxano]:=vmargemContr[itxano]-(vdespFixas[itxano]+vdespAdm[itxano]+vremun[itxano]);
  //  Vlucro_Prej[2]:=vmargemContr[2]-(vdespFixas[2]+vdespAdm[2]+vremun[2]);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(Vlucro_Prej[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((Vlucro_Prej[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 14;//  Receita Vnd Ativo Permanente
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vrecativop[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vrecativop[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 15;//  Outras Receitas
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(voutrasRec[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((voutrasRec[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 16;// Resultado Liquido Antes CSLL
    vLucroLiquido[itxano]:=Vlucro_Prej[itxano]+vrecativop[itxano]+voutrasRec[itxano];
  //  vLucroLiquido[2]:=Vlucro_Prej[2]+vrecativop[2]+voutrasRec[2];
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vLucroLiquido[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vLucroLiquido[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 17;//  Contribuicao Social sobre o Lucro
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vctSocial[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vctSocial[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 18;//  Imposto de Renda Pessoa Juridica
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vImpRenda[itxano] / vMesesMedia)]), 14);
    try
      IF vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vImpRenda[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 19;//  Adicional do Imposto de Renda Pessoa Juridica
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vAdicionalIRRF[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vAdicionalIRRF[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 20;//  Resultado Liquido do Exercicio
    vlucliqop[itxano]:=vLucroLiquido[itxano]-(vImpRenda[itxano]+vctSocial[itxano]+vAdicionalIRRF[itxano]);
  //  vlucliqop[2]:=vLucroLiquido[2]-(vImpRenda[2]+vctSocial[2]+vAdicionalIRRF[2]);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vlucliqop[itxano] / vMesesMedia)]), 14);
    try
      if (vvendLiquidas[itxano] <> 0) then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vlucliqop[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 21;//  Investimentos
    verbuscaDespDep(itx, pBalDre);
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vreinv[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vreinv[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    itx := 22;//  Lucro Liquido Retido na Empresa
    vlucliqop[itxano]:=vlucliqop[itxano]-vreinv[itxano];
  //  vlucliqop[2]:=vlucliqop[2]-vreinv[2];
    stgridDRE.Cells[ 09, itx] := vDadosIni.alndir(Format('%n', [(vlucliqop[itxano] / vMesesMedia)]), 14);
    try
      if vvendLiquidas[itxano] <> 0 then
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [((vlucliqop[itxano])/vvendLiquidas[itxano])*100]), 6)
      else
        stgridDRE.Cells[ 10, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
    except
    end;

    vDataTmp := IncMonth(vDataTmp, -1);
    vanoinf := YearOf(vDataTmp);
    vmes := MonthOf(vDataTmp);
  end;

  try
    vpercequil:=strtofloat(stgridDRE.Cells[10,9])+strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10,7],2))+
      strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10,17],2))+strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10,18],2))+strtofloat(
      vdadosini.tirapontos(stgridDRE.Cells[10,19],2));
  except
    vpercequil:=0;
  end;
  if vpercequil <> 0 then
    vpequilibrioMed:=(strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[09, 10],2)) +
      strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[09, 11],2)))/
      (1-(vpercequil/100))
  else
    vpequilibrioMed:=(strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[09, 10],2)) +
    strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[09, 11],2)));
  try
    vlucratividadeMed:=strtofloat(stgridDRE.Cells[10, 20]);
  except
    vlucratividadeMed:=0;
  end;
  try
    vmargemMed :=100-(strtofloat(vdadosini.tirapontos(stgridDRE.Cells[10, 2],2)) + strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10, 9],2)) +
      strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10, 10],2)) + strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10, 11],2))+
      strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10,17],2))+strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10,18],2))+
      strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[10,19],2)));
  except
    vmargemMed:=0;
  end;
  vmargemMed:=vmargemMed/100;
  vmarkupminMed:=((100/vmargemMed)/100);

  vano := vAnoTemporario;
  vmesinf := vMesTemporario;

  efetRatSobreVendaDaMedia; //aqui é feita a media entre e zerado o dataset para deixar a apuracao informada, ficando registrado apenas a media
  //******************************************final media ultimos 12 meses


  vIndicesDRE.EmptyDataSet;
//  vrateiorealizado.EmptyDataSet;
  //inicio apuracao periodo ano atual e mesmo periodo ano anterior

  for imudano := 0 to 1 do//0
  begin
   vanoinf:=vano;
   if imudano = 1 then
    vano:=vano-1;
  iniciavariaveis(1);//1: limpa todos os 3 valores dos arrays
  CadVendas.ZeraVendas;
  Emes:=01;
  vmes:=vmesinf;//mes informado na para apuracao
  vDadosIni.progressoFuncao('Status da Geração do DRE','Processo Gerando DRE Gestor','Iniciando DRE Gestor');
    while vmes >= Emes do// enquanto o mes corrente nao chegar no mes inicial: 01
    begin
      iniciavariaveis(3);//<>1: limpa apenas o valor do ultimo registro dos arrays
      if vmes = vmesinf then//se mes corrente da apuracao igual mes informado
      begin
        if imudano = 0 then// ano informado
          vvolta := 1//coluna Valores
        else// ano anterior ao informado
         vvolta := 5;//coluna Valor Mensal Ano Anterior
        itxano:=0;
      end
      else
      begin
        itxano:=1;
        if imudano = 0 then
         vvolta := 3// coluna Valor Acumulado no Ano
        else
         vvolta := 7;//coluna Valor Acumulado no Ano Anterior
      end;
      CadVendas.vmesvendas:=vmes;
      CadVendas.vanovendas:=vano;
      cadvendas.vmesor:=vmesinf;
      CadVendas.vtippesq:='M';
      CadVendas.vcoddemo:=vcoddemo;
      if vContabil then
        CadVendas.vendasGeraisCNT(vCodEmpresasDRE, pBalDre)
      else
      CadVendas.vendasGerais(vCodEmpresasDRE, pBalDre);
//      if CadVendas.vendasGerais(vCodEmpresasDRE) then
//      begin
        efetRatSobreVenda(pBalDre);
        vendasSELDRE(vgriddep,0);
        for itx := 1 to 22 do//linas do stringgrid
        begin
          vDadosIni.progressoFuncao('','', trim(stgridDRE.Cells[0,itx]));
          if (itx < 9) and (itx <> 2) then//< Despesas Variaveis e <> Impostos pagos na Venda
          begin
            stgridDRE.Cells[vvolta, 1] := vDadosIni.alndir(Format('%n', [(vendasGeral[itxano])]), 14);
            if itx = 3 then
            begin
              stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vdevolucoes[itxano])]), 14);
              try
               if vendasGeral[itxano] <> 0 then
                stgridDRE.Cells[vvolta+1,itx] := vDadosIni.alndir(Format('%n', [(vdevolucoes[itxano]*100)/(vendasGeral[itxano])]), 6)
               else
                 stgridDRE.Cells[vvolta+1,itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
               if vendasGeral[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(vdevolucoes[2]*100)/(vendasGeral[2]),itx)
               else
                gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
              except

              end;
            end;
            if itx = 4 then  // Descontos
            begin
             stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vdesconto[itxano])]), 14);
             try
              if vendasGeral[itxano] <> 0 then
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [(vdesconto[itxano]*100)/(vendasGeral[itxano])]), 6)
              else
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
              if vendasGeral[2] <> 0 then
               gravaindicesmeses(stgridDRE.Cells[0, itx],(vdesconto[2]*100)/(vendasGeral[2]),itx)
              else
               gravaindicesmeses(stgridDRE.Cells[0, itx],(0),itx);
             except

             end;
            end;
            if itx = 5 then  // Total Deducoes
            begin
             stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vimpostos[itxano]+vdevolucoes[itxano]+vdesconto[itxano])]), 14);
             if vendasGeral[itxano] <> 0 then
             begin
              stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vimpostos[itxano]+vdevolucoes[itxano]+vdesconto[itxano])*100)/(vendasGeral[itxano])]), 6);
              stgridDRE.Cells[vvolta+1, 1] := vDadosIni.alndir(Format('%n', [100+(((vimpostos[itxano]+vdevolucoes[itxano]+vdesconto[itxano])*100)/(vendasGeral[itxano]))]), 6);
             end
             else
             begin
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
               stgridDRE.Cells[vvolta+1, 1] := vDadosIni.alndir(Format('%n', [0.00]), 6);
             end;
            end;
            if itx = 6  then  //  Receita Operacional Liquida
            begin
              vvendLiquidas[itxano]:=vendasgeral[itxano]-(vdesconto[itxano]+vimpostos[itxano]+vdevolucoes[itxano]);
              vvendLiquidas[2]:=vendasgeral[2]-(vdesconto[2]+vimpostos[2]+vdevolucoes[2]);
              stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [vvendLiquidas[itxano]]), 14);
              stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [100.00]), 6);
              gravaindicesmeses(stgridDRE.Cells[0, itx],vvendLiquidas[2],itx);
            end;
            if itx = 7  then  //  CMV
            begin
              stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [vcustoVend[itxano]-vdevolucoesCt[itxano]]), 14);
              if vvendLiquidas[itxano] <> 0 then
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vcustoVend[itxano]-vdevolucoesCt[itxano])/vvendLiquidas[itxano])*100]), 6)
              else
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
              if vvendLiquidas[2] <> 0 then
               gravaindicesmeses(stgridDRE.Cells[0, itx],(((vcustoVend[2]-vdevolucoesCt[2])/vvendLiquidas[2])*100),itx)
              else
               gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
            end;
            if itx = 8  then  //  Lucro Bruto
            begin
              vcontrBruta[itxano]:=vvendLiquidas[itxano]-(vcustoVend[itxano]-vdevolucoesCt[itxano]);
              vcontrBruta[2]:=vvendLiquidas[2]-(vcustoVend[2]-vdevolucoesCt[2]);
              stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [vcontrBruta[itxano]]), 14);
              if vvendLiquidas[itxano] <> 0 then
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [(vcontrBruta[itxano]/vvendLiquidas[itxano])*100]), 6)
              else
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
              if vvendLiquidas[2] <> 0 then
                gravaindicesmeses(stgridDRE.Cells[0, itx],((vcontrBruta[2]/vvendLiquidas[2])*100),itx)
              else
               gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
            end;
          end
          else
          begin
           if itx = 2 then //  Impostos Pagos na Venda
           begin
             VerbuscaDespDep(itx, pBalDre);
             stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vimpostos[itxano])]), 14);
             try
              if (vendasGeral[itxano]+vdesconto[itxano]) <> 0 then
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vimpostos[itxano]*100)/(vendasGeral[itxano]+vdesconto[itxano]))]), 6)
              else
               stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
              if (vendasGeral[2]+vdesconto[2]) <> 0 then
               gravaindicesmeses(stgridDRE.Cells[0, itx],((vimpostos[2]*100)/(vendasGeral[2]+vdesconto[2])),itx)
              else
                gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
             except

             end;
           end
           else
           begin
             if (itx = 13) or (itx = 16) or (itx = 20) or (itx = 22) then // Resultado Operacional Liq, Resultado Antes CSLL, Resultado do Exercicio, Lucro liquido retido na empresa
             begin
              if itx = 13 then  // Resultado Operacional Liquido
              begin
                Vlucro_Prej[itxano]:=vmargemContr[itxano]-(vdespFixas[itxano]+vdespAdm[itxano]+vremun[itxano]);
                Vlucro_Prej[2]:=vmargemContr[2]-(vdespFixas[2]+vdespAdm[2]+vremun[2]);
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(Vlucro_Prej[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((Vlucro_Prej[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((Vlucro_Prej[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
               except
               end;
              end;
              if itx = 16 then  // Resultado Liquido Antes CSLL
              begin
                vLucroLiquido[itxano]:=Vlucro_Prej[itxano]+vrecativop[itxano]+voutrasRec[itxano];
                vLucroLiquido[2]:=Vlucro_Prej[2]+vrecativop[2]+voutrasRec[2];
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vLucroLiquido[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vLucroLiquido[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vLucroLiquido[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
               except
               end;
              end;
  //            if itx = 18 then
  //            begin
  //             vLucroLiquido[itxano]:=vLucroLiquido[itxano]-vctSocial[itxano];
  //             stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vLucroLiquido[itxano])]), 14);
  //             try
  //              stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vLucroLiquido[itxano])/vvendLiquidas[itxano])*100]), 6);
  //             except
  //             end;
  //            end;
              if itx = 20 then  //  Resultado Liquido do Exercicio
              begin
               vlucliqop[itxano]:=vLucroLiquido[itxano]-(vImpRenda[itxano]+vctSocial[itxano]+vAdicionalIRRF[itxano]);
               vlucliqop[2]:=vLucroLiquido[2]-(vImpRenda[2]+vctSocial[2]+vAdicionalIRRF[2]);
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vlucliqop[itxano])]), 14);
               try
                if (vvendLiquidas[itxano] <> 0) then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vlucliqop[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vlucliqop[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
               except
               end;
              end;
              if itx = 22 then  //  Lucro Liquido Retido na Empresa
              begin
               vlucliqop[itxano]:=vlucliqop[itxano]-vreinv[itxano];
               vlucliqop[2]:=vlucliqop[2]-vreinv[2];
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vlucliqop[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vlucliqop[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vlucliqop[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
               except
               end;
              end;
             end
             else
             begin
              verbuscaDespDep(itx, pBalDre);
              if itx = 9 then  //  Despesas Variaveis
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vdespVariaveis[itxano])]), 14);
               vmargemContr[itxano]:=vcontrBruta[itxano]-vdespVariaveis[itxano];
               vmargemContr[2]:=vcontrBruta[2]-vdespVariaveis[2];
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vdespVariaveis[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vdespVariaveis[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);

               except

               end;
              end;
              if itx = 10 then  //  Despesas Fixas
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vdespFixas[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vdespFixas[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                begin
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vdespFixas[2])/vvendLiquidas[2])*100),itx);
                 gravaindicesmeses(stgridDRE.Cells[0, itx],vDadosIni.StrToFloatFormat(vdespFixas[2],2),101);//grava apenas para calcular o ponto de equilibrio mensal, la embaixo será excluido
                end
                else
                begin
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),101);
                end;
               except

               end;
              end;
              if itx = 11 then  //  Despesas Administrativas
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vdespAdm[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vdespAdm[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                begin
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vdespAdm[2])/vvendLiquidas[2])*100),itx);
                 gravaindicesmeses(stgridDRE.Cells[0, itx],vDadosIni.StrToFloatFormat(vdespAdm[2],2),111);//grava apenas para calcular o ponto de equilibrio mensal, la embaixo será excluido
                end
                else
                begin
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),111);
                end;

               except

               end;
              end;
              if itx = 12 then  //  Remuneracao de Capital de Terceiro
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vremun[itxano])]), 14);
               try
                IF vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vremun[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vremun[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
               except

               end;
              end;
              if itx = 14 then  //  Receita Vnd Ativo Permanente
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vrecativop[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vrecativop[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vrecativop[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);

               except

               end;
              end;
              if itx = 15 then  //  Outras Receitas
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(voutrasRec[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((voutrasRec[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((voutrasRec[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
               except

               end;
              end;
              if itx = 17 then  //  Contribuicao Social sobre o Lucro
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vctSocial[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vctSocial[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vctSocial[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);
               except

               end;
              end;
              if itx = 18 then  //  Imposto de Renda Pessoa Juridica
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vImpRenda[itxano])]), 14);
               try
                IF vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vImpRenda[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vImpRenda[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);

               except

               end;
              end;
              //  Aqui colocar os valores do Adicional do Imposto de Renda
              if itx = 19 then  //  Adicional do Imposto de Renda Pessoa Juridica
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vAdicionalIRRF[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vAdicionalIRRF[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vAdicionalIRRF[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);

               except
               end;
              end;
              if itx = 21 then //  Investimentos
              begin
               stgridDRE.Cells[vvolta, itx] := vDadosIni.alndir(Format('%n', [(vreinv[itxano])]), 14);
               try
                if vvendLiquidas[itxano] <> 0 then
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [((vreinv[itxano])/vvendLiquidas[itxano])*100]), 6)
                else
                 stgridDRE.Cells[vvolta+1, itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
                if vvendLiquidas[2] <> 0 then
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(((vreinv[2])/vvendLiquidas[2])*100),itx)
                else
                 gravaindicesmeses(stgridDRE.Cells[0, itx],(0.00),itx);

               except

               end;
              end;

             end;
           end;
          end;

        end;

        //gravando o ponto de equilibrio mensal para o grafico de tendencias
        vrTemp :=
          vDadosIni.StrToFloatFormat(obterVaalorIndiceMeses(9,vmes,vano),2) +
          vDadosIni.StrToFloatFormat(obterVaalorIndiceMeses(7,vmes,vano),2) +
          vDadosIni.StrToFloatFormat(obterVaalorIndiceMeses(17,vmes,vano),2) +
          vDadosIni.StrToFloatFormat(obterVaalorIndiceMeses(18,vmes,vano),2) +
          vDadosIni.StrToFloatFormat(obterVaalorIndiceMeses(19,vmes,vano),2);
        if vrTemp <> 0 then
          vrTemp := (obterVaalorIndiceMeses(101,vmes,vano,True) + obterVaalorIndiceMeses(111,vmes,vano,True)) / (1-(vrTemp/100))
        else
          vrTemp := (obterVaalorIndiceMeses(101,vmes,vano,True) + obterVaalorIndiceMeses(111,vmes,vano,True));

        gravaindicesmeses('23. Ponto de Equilibrio', vDadosIni.StrToFloatFormat(vrTemp,2), 23);
//      end
//      else
//      begin
//         Application.MessageBox(Pchar('Mes '+vDadosIni.StrZero(vmes,02)+'/'+vDadosIni.StrZero(vano,4)+
//         'Não Teve Venda!'), 'Confirmação', MB_OK);
//      end;
      vmes := vmes - 1;
      if vexecutarmesatual = 'S' then
        break;
    end;
    if imudano = 0 then
    begin
      vvendatotal:=0;
      if vContabil then
      begin 
        for itx := 0 to 13 do
          vvendatotal:=vvendatotal+(StrToCurr(CadVendas.VendaporModCNT[itx,1])-StrToCurr(CadVendas.VendaporModCNT[itx,2]));
        for itx := 1 to 14 do
        begin
         stgridVendas.Cells[0,itx] :=CadVendas.VendaporModCNT[itx-1,0];
         stgridVendas.Cells[1,itx] := vDadosIni.alndir(Format('%n', [(StrToCurr(CadVendas.VendaporModCNT[itx-1,1])-StrToCurr(CadVendas.VendaporModCNT[itx-1,2]))]), 14);
         try
           if vvendatotal <> 0 then
            stgridVendas.Cells[2,itx] := vDadosIni.alndir(Format('%n', [((StrToCurr(CadVendas.VendaporModCNT[itx-1,1])-StrToCurr(CadVendas.VendaporModCNT[itx-1,2]))/vvendatotal)*100]), 6)
           else
            stgridVendas.Cells[2,itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
         except
         end;
        end;
      end
      else
      begin
        for itx := 0 to 11 do
        begin
         vvendatotal:=vvendatotal+(StrToCurr(CadVendas.VendaporMod[itx,1])-StrToCurr(CadVendas.VendaporMod[itx,2]));
        end;
        for itx := 1 to 12 do
        begin
         stgridVendas.Cells[0,itx] :=CadVendas.VendaporMod[itx-1,0];
         stgridVendas.Cells[1,itx] := vDadosIni.alndir(Format('%n', [(StrToCurr(CadVendas.VendaporMod[itx-1,1])-StrToCurr(CadVendas.VendaporMod[itx-1,2]))]), 14);
         try
           if vvendatotal <> 0 then
            stgridVendas.Cells[2,itx] := vDadosIni.alndir(Format('%n', [((StrToCurr(CadVendas.VendaporMod[itx-1,1])-StrToCurr(CadVendas.VendaporMod[itx-1,2]))/vvendatotal)*100]), 6)
           else
            stgridVendas.Cells[2,itx] := vDadosIni.alndir(Format('%n', [0.00]), 6);
         except
         end;
        end;
      end;
      try
       vpercequil:=strtofloat(stgridDRE.Cells[2,9])+strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2,7],2))+
       strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2,17],2))+strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2,18],2))+strtofloat(
       vdadosini.tirapontos(stgridDRE.Cells[2,19],2));
      except
       vpercequil:=0;
      end;
      if vpercequil <> 0 then
       vpequilibrio:=(strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[1, 10],2)) +
       strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[1, 11],2)))/
       (1-(vpercequil/100))
      else
       vpequilibrio:=(strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[1, 10],2)) +
       strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[1, 11],2)));
  //    (((vdespFixas[0]+vdespVariaveis[0])/vmargemContr[0])*vendasGeral[0]);
      try
       vlucratividade:=strtofloat(stgridDRE.Cells[2, 20]);
      except
       vlucratividade:=0;
      end;
//      vtemp:=((vpercequil-strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2,7],2))+
//      strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2, 10],2)))/100);
      try
       vmargem :=100-(strtofloat(vdadosini.tirapontos(stgridDRE.Cells[2, 2],2)) + strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2, 9],2)) +
              strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2, 10],2)) + strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2, 11],2))+
              strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2,17],2))+strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2,18],2))+
              strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[2,19],2)));
      except
       vmargem:=0;
      end;
      vmargem:=vmargem/100;
      vmarkupmin:=((100/vmargem)/100);
//      /strtofloat(vDadosIni.tirapontos(stgridDRE.Cells[1,7],2));
    end;
    if vexecutarmesatual = 'S' then
     break;
  end;
  vIndicesDRE.IndexFieldNames:='ANO;MES;SEQUENCIA';
  vIndicesDRE.first;
  vDadosIni.finalizaProgresso;
end;


function TDREHw.obterVaalorIndiceMeses(pDRE, pMes, pAno: Integer; pDeleteIndice: Boolean): Real;
begin
  try
    vIndicesDRE.Filter := 'SEQUENCIA = ' + IntToStr(pDRE) + ' and MES = ' + IntToStr(pMes) + ' and ANO = ' + IntToStr(pAno);
    vIndicesDRE.Filtered := True;
    Result := vIndicesDRE.FieldByName('VALOR').AsCurrency;
    if pDeleteIndice then
      vIndicesDRE.Delete;
  finally
    vIndicesDRE.Filtered := False;
     vIndicesDRE.Filter := '';
  end; 
end;

function TDREHw.procuraitemvetor(vvetor: array of string;
  vdado: string): boolean;
var
 i: integer;
begin
  Result:=false;
  for I := 0 to length(vvetor) do
  begin
    if vvetor[i] = vdado then
    begin
      result:=true;
      break;
    end;
  end;
end;

function TDREHw.QtdeDeptoSel(vgriddep: Tdbgrid): integer;
var
 vqtdepsel: integer;
begin
  vqtdepsel:=0;
  CadDepto.First;
  while not CadDepto.Eof do
  begin
    if vgriddep.SelectedRows.CurrentRowSelected then
     vqtdepsel:=vqtdepsel+1;
    CadDepto.dataSet.next;
  end;
 Result:=vqtdepsel;
end;

function TDREHw.selgriddep(vgriddep: Tdbgrid): boolean;
begin
  CadDepto.First;
  while not CadDepto.eof do
  begin
   if not vgriddep.SelectedRows.CurrentRowSelected then
     vgriddep.SelectedRows.CurrentRowSelected:=true;
   CadDepto.Next;
  end;
end;

function TDREHw.vendasSELDRE(vgriddep: Tdbgrid;vtipo: integer): boolean;
var
 i,x:integer;
 vvendas,vvendas1,vdev,dev1,vdesc,vdesc1,vcust,vcust1,vdevc,vdevc1: currency;
 vpercfat: real;
begin
  Result:=true;
  CadDepto.First;
  vvendas:=0;
  vvendas1:=0;
  vdesc:=0;
  vdesc1:=0;
  vdev:=0;
  dev1:=0;
  vdevc:=0;
  vdevc1:=0;
  vcust:=0;
  vcust1:=0;
  vDadosIni.progressoFuncao('','','Selecionando Venda Departamentos selecionados');
  vendasGeral[1]:=0;
  vdevolucoes[1]:=0;
  vdevolucoesCt[1]:=0;
  vdesconto[1]:=0;
  vcustoVend[1]:=0;
  verificarepdpto(1,'');
  while not CadDepto.eof do
  begin
   vvendas:=0;
   vvendas1:=0;
   vdesc:=0;
   vdesc1:=0;
   vdev:=0;
   dev1:=0;
  vdevc:=0;
  vdevc1:=0;
   vcust:=0;
   vcust1:=0;
   if vgriddep.SelectedRows.CurrentRowSelected then
   begin
    if vContabil then
    begin
      for  i:=0 to 13 do
      begin
        if pos(cadvendas.VendaporModCNT[i,0] + ',', CadDepto.dataSet.fieldbyname('TIPOFATCNT').asstring + ',') > 0 then
        begin
          if verificarepdpto(3,cadvendas.VendaporModCNT[i,0]) = 0 then
          begin
            buscas.Close;
            buscas.SQL.text:='SELECT * FROM PERCRATFAT ' +
            	' WHERE TIPOFAT = '''+ cadvendas.VendaporModCNT[i,0]+''' AND ATIVO = 1 ';
            buscas.open;
            buscas.FetchAll;
            if buscas.RecordCount > 0 then
             vpercfat:=buscas.FieldByName('PERCFAT').AsCurrency
            else
             vpercfat:=0;
            if vpercfat = 0 then
            begin
              if vmes = vmesinf then
              begin
                vvendas:=vvendas+strtofloat(cadvendas.VendaporModCNT[i,1]);
                vdesc:=vdesc+strtofloat(cadvendas.VendaporModCNT[i,2]);
                vcust:=vcust+strtofloat(cadvendas.VendaporModCNT[i,3]);
              end;
              vvendas1:=vvendas1+strtofloat(cadvendas.VendaporModCNT[i,4]);
              vdesc1:=vdesc1+strtofloat(cadvendas.VendaporModCNT[i,5]);
              vcust1:=vcust1+strtofloat(cadvendas.VendaporModCNT[i,6]);
              vendasGeral[2]:=vendasGeral[2]+CadVendas.vbrutoat[i];
              vdesconto[2]:=vdesconto[2]+CadVendas.vdescat[I];
              vcustoVend[2]:=vcustoVend[2]+CadVendas.vcustoat[I];
            end
            else
            begin
              if vmes = vmesinf then
              begin
                vvendas:=vvendas+((strtofloat(cadvendas.VendaporModCNT[i,1])*vpercfat)/100);
                vdesc:=vdesc+((strtofloat(cadvendas.VendaporModCNT[i,2])*vpercfat)/100);
                vcust:=vcust+((strtofloat(cadvendas.VendaporModCNT[i,3])*vpercfat)/100);
              end;
              vvendas1:=vvendas1+((strtofloat(cadvendas.VendaporModCNT[i,4])*vpercfat)/100);
              vdesc1:=vdesc1+((strtofloat(cadvendas.VendaporModCNT[i,5])*vpercfat)/100);
              vcust1:=vcust1+((strtofloat(cadvendas.VendaporModCNT[i,6])*vpercfat)/100);
              vendasGeral[2]:=vendasGeral[2]+((CadVendas.vbrutoat[i]*vpercfat)/100);
              vdesconto[2]:=vdesconto[2]+((CadVendas.vdescat[I]*vpercfat)/100);
              vcustoVend[2]:=vcustoVend[2]+((CadVendas.vcustoat[I]*vpercfat)/100);
            end;
            verificarepdpto(2,cadvendas.VendaporModCNT[i,0]);
          end;
        end;
        if pos(cadvendas.VendaporModCNT[i,0] + ',', CadDepto.dataSet.fieldbyname('TIPDEVDEPCNT').asstring + ',') > 0 then
        begin
         if verificarepdpto(3,cadvendas.VendaporModCNT[i,0]) = 0 then
         begin
          if vmes = vmesinf then
          begin
            vdev:=vdev+strtofloat(cadvendas.VendaporModCNT[i,1]);
            vdevc:=vdevc+strtofloat(cadvendas.VendaporModCNT[i,3]);
          end;
          dev1:=dev1+strtofloat(cadvendas.VendaporModCNT[i,4]);
          vdevc1:=vdevc1+strtofloat(cadvendas.VendaporModCNT[i,6]);
          vdevolucoes[2]:=vdevolucoes[2]+CadVendas.vdevat[i];
          vdevolucoesCt[2]:=vdevolucoesct[2]+CadVendas.vdevct[i];
          verificarepdpto(2,cadvendas.VendaporModCNT[i,0]);
         end;
        end;
      end;

    end
    else
    for  i:=0 to 11 do
    begin
//     for x := 0 to 6 do
      if pos(cadvendas.VendaporMod[i,0],CadDepto.dataSet.fieldbyname('TIPOFAT').asstring) > 0 then
      begin
        if verificarepdpto(3,cadvendas.VendaporMod[i,0]) = 0 then
        begin
          buscas.Close;
          buscas.SQL.text:='SELECT * FROM PERCRATFAT ' +
          	' WHERE TIPOFAT = '''+ cadvendas.VendaporMod[i,0]+''' AND ATIVO = 1 ';
          buscas.open;
          buscas.FetchAll;
          if buscas.RecordCount > 0 then
           vpercfat:=buscas.FieldByName('PERCFAT').AsCurrency
          else
           vpercfat:=0;
          if vpercfat = 0 then
          begin
            if vmes = vmesinf then
            begin
              vvendas:=vvendas+strtofloat(cadvendas.VendaporMod[i,1]);
              vdesc:=vdesc+strtofloat(cadvendas.VendaporMod[i,2]);
              vcust:=vcust+strtofloat(cadvendas.VendaporMod[i,3]);
            end;
            vvendas1:=vvendas1+strtofloat(cadvendas.VendaporMod[i,4]);
            vdesc1:=vdesc1+strtofloat(cadvendas.VendaporMod[i,5]);
            vcust1:=vcust1+strtofloat(cadvendas.VendaporMod[i,6]);
            vendasGeral[2]:=vendasGeral[2]+CadVendas.vbrutoat[i];
            vdesconto[2]:=vdesconto[2]+CadVendas.vdescat[I];
            vcustoVend[2]:=vcustoVend[2]+CadVendas.vcustoat[I];
          end
          else
          begin
            if vmes = vmesinf then
            begin
              vvendas:=vvendas+((strtofloat(cadvendas.VendaporMod[i,1])*vpercfat)/100);
              vdesc:=vdesc+((strtofloat(cadvendas.VendaporMod[i,2])*vpercfat)/100);
              vcust:=vcust+((strtofloat(cadvendas.VendaporMod[i,3])*vpercfat)/100);
            end;
            vvendas1:=vvendas1+((strtofloat(cadvendas.VendaporMod[i,4])*vpercfat)/100);
            vdesc1:=vdesc1+((strtofloat(cadvendas.VendaporMod[i,5])*vpercfat)/100);
            vcust1:=vcust1+((strtofloat(cadvendas.VendaporMod[i,6])*vpercfat)/100);
            vendasGeral[2]:=vendasGeral[2]+((CadVendas.vbrutoat[i]*vpercfat)/100);
            vdesconto[2]:=vdesconto[2]+((CadVendas.vdescat[I]*vpercfat)/100);
            vcustoVend[2]:=vcustoVend[2]+((CadVendas.vcustoat[I]*vpercfat)/100);
          end;
          verificarepdpto(2,cadvendas.VendaporMod[i,0]);
        end;
      end;
      if pos(cadvendas.VendaporMod[i,0],CadDepto.dataSet.fieldbyname('TIPDEVDEP').asstring) > 0 then
      begin
       if verificarepdpto(3,cadvendas.VendaporMod[i,0]) = 0 then
       begin
        if vmes = vmesinf then
        begin
          vdev:=vdev+strtofloat(cadvendas.VendaporMod[i,1]);
          vdevc:=vdevc+strtofloat(cadvendas.VendaporMod[i,3]);
        end;
        dev1:=dev1+strtofloat(cadvendas.VendaporMod[i,4]);
        vdevc1:=vdevc1+strtofloat(cadvendas.VendaporMod[i,6]);
        vdevolucoes[2]:=vdevolucoes[2]+CadVendas.vdevat[i];
        vdevolucoesCt[2]:=vdevolucoesct[2]+CadVendas.vdevct[i];
        verificarepdpto(2,cadvendas.VendaporMod[i,0]);
       end;
      end;
    end;
    vendasGeral[0]:=vendasGeral[0]+vvendas;
    vendasGeral[1]:=vendasGeral[1]+vvendas1;
    vdevolucoes[0]:=vdevolucoes[0]+vdev;
    vdevolucoes[1]:=vdevolucoes[1]+dev1;

    vdevolucoesCt[0]:=vdevolucoesCt[0]+vdevc;
    vdevolucoesCt[1]:=vdevolucoesCt[1]+vdevc1;

    vdesconto[0]:=vdesconto[0]+vdesc;
    vdesconto[1]:=vdesconto[1]+vdesc1;
    vcustoVend[0]:=vcustoVend[0]+vcust;
    vcustoVend[1]:=vcustoVend[1]+vcust1;
   end;
    CadDepto.next;
  end;
end;

{ TBalancoHw }

function TBalancoHw.abreEmpresas: Boolean;
begin

end;

function TBalancoHw.apagaindemapuracao: boolean;
begin
 result:=true;
 if vIndicesBal.Active then
 begin
   vIndicesBal.first;
   while not vIndicesBal.Eof do
   begin
     if (vIndicesBal.FieldByName('MES').AsInteger = vmesinf) and
     (vIndicesBal.FieldByName('ANO').AsInteger = vanoinf) and
     vIndicesBal.FieldByName('COD_EMPRESA').Value = vCodEmpresasDRE then
       vIndicesBal.Delete;
     vIndicesBal.next;
   end;
 end;
end;

function TBalancoHw.apagarbalapur: boolean;
begin
 if Application.MessageBox('Tem certeza que deseja apagar este Balanço já apurado?',
 'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON1)  = mrYES then
 begin
  try
   IniciaTransacao;
   buscas.SQL.Text:='DELETE FROM APURACAO_BALANCO WHERE COD_EMPRESA IN ('+vCodEmpresasDRE+') and '+
   'mes = '+IntToStr(vmesinf)+' and ano = '+IntToStr(vano);
   buscas.Prepare;
   buscas.ExecSQL;
   buscas.SQL.Text:='DELETE FROM INDICES_BALANCO WHERE COD_EMPRESA IN ('+vCodEmpresasDRE+') and '+
   'mes = '+IntToStr(vmesinf)+' and ano = '+IntToStr(vano);
   buscas.Prepare;
   buscas.ExecSQL;
   buscas.SQL.Text:='DELETE FROM INV_BALANCO WHERE COD_EMPRESA IN ('+vCodEmpresasDRE+') and '+
   'mes = '+IntToStr(vmesinf)+' and ano = '+IntToStr(vano);
   buscas.Prepare;
   buscas.ExecSQL;
   CommitaTransacao;
   Result:=true;
  except
    on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(Pchar('GEST001 '+e.Message), 'Confirmação', MB_OK);
      registraErro('GEST001 ' + e.Message);
      Result := False;
    end;
  end;
 end;
end;

function TBalancoHw.buscavlporTpBal(vtpbal: string): currency;
var
 vsaldobal: currency;
 vdtGeral: Tdate;
 HEquipamento: THandle;
 CadEquipamento: Tequipamentos;
 vcodemp: string;
begin
  // Chamar Depreciação a partir do pacote Equipamento, ok?
  vDadosIni.progressoFuncao('Status da Geração Balanço','Processo Gerando Balanço','Verificando '+
	  trim(dataSet.FieldByName('DESC_BALANCO').AsString));
  vdtGeral:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
  vsaldobal:=0;

  if (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 7)
  or (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 8) then
  begin
     if dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 7 then
     begin
       CadEstoque.vdataref:=vdtGeral;
       CadEstoque.abreBase;
       CadEstoque.vcodbal:=dataSet.FieldByName('CODSEQ_BALANCO').AsInteger;
       CadEstoque.vmes:=vmesinf;
       CadEstoque.vano:=vanoinf;
       vvalestoque:=CadEstoque.verificaestoques(vlblestoque);
       vsaldobal:=vsaldobal+vvalestoque;
     end;
     if dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 8 then
     begin
      vinserviveis:=CadEstoque.vobsoletos;
      vsaldobal:=vsaldobal+vinserviveis;
     end;
  end;
  if (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 35) then
  begin
   CadEstoque.vdat1:=vdat1;
   CadEstoque.vdat2:=vdat2;
   vsaldobal:=vsaldobal+CadEstoque.verificaMotos(1);
  end;
  if (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 36) then
  begin
   CadEstoque.vdat1:=vdat1;
   CadEstoque.vdat2:=vdat2;
   vsaldobal:=vsaldobal+CadEstoque.verificaMotos(2);
  end;

  if (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 37) then
  begin
   buscas.Close;
   buscas.SQL.text:='SELECT SUM(rec.VALOR+coalesce((SELECT sum(hst.valor_baixa) as vlbx FROM HIST_REC hst ' +
     ' inner join empresa emp on hst.cod_empresa = emp.cod_empresa ' +
   	 ' where hst.data_baixa > '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''''+
  	 ' and hst.data_baixa <= '''+FormatDateTime('mm/dd/yyyy',date)+''' ' +
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else hst.cod_empresa end) ' +
//     ' and hst.cod_empresa ' +
     ' in (' + vCodEmpresasDRE + ') ' +
     ' and hst.ativo=rec.ativo '+
  	 ' and (hst.RECANT= ''S'' OR hst.RECANT = ''O'') and hst.nrecibo = rec.nrecibo '+
   	 ' and hst.historico_rec like ''%PARCIAL%''),0)) AS VALOR FROM RECIBOS rec ' +
     ' inner join empresa emp on rec.cod_empresa = emp.cod_empresa ' +
     ' where rec.data_rec <= '''+	FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
     ' and ((rec.data_baixa > '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''') or (rec.data_baixa is null)) ' +
     ' and rec.RECANT = ''S'' ' +
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else rec.cod_empresa end) ' +
//     ' and rec.cod_empresa ' +
     ' in ('+vCodEmpresasDRE+') ' +
     ' and rec.ativo=1 ';
   buscas.open;
   vsaldobal:=vsaldobal+buscas.FieldByName('VALOR').AsCurrency;
  end;

  if (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 38) then
  begin
   buscas.Close;
   buscas.SQL.text:='select sum(coalesce(pd.valor_total,0)) as valor from pedvenda pd ' +
     ' inner join empresa emp on pd.cod_empresa = emp.cod_empresa ' +
   	 ' where pd.data_fech >= '''+  FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+''' ' +
     ' and pd.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+ ''' ' +
     ' and (select count(*) from formpagamento fr ' +
     '		where fr.nrequisicao = pd.nped ' +
     '		and fr.cod_empresa = pd.cod_empresa ' +
     '		and fr.tpdocs = pd.tipo ' +
     '		and (coalesce(fr.prcss,'''') <> '''' ' +
     '		or fr.data_mov > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 ' +
     ' and (pd.status_ped <> ''CANCELADO'') '+
   	 ' and pd.valor_total > 0 ' +
     ' and ((pd.tipo = ''OS'') or (pd.tipo = ''REQ'')) ' +
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pd.cod_empresa end) ' +
//     ' and pd.cod_empresa ' +
     ' in ('+vCodEmpresasDRE+') '+
   	 ' union '+
     //troquei o select pois nao usa mais a tabela mot_ven
     ' select sum(coalesce(ft.'+vcampoutilvndveic+',0)) as valor from com_fat ft '+
     ' inner join empresa emp on ft.cod_empresa = emp.cod_empresa ' +
     ' inner join nat_op nt on nt.codigo_nop = ft.natop_v and coalesce(nt.faturamento, ''N'') = ''S'' ' +
     ' WHERE  ft.data_ven >= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
     ' and ft.data_ven <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ft.cod_empresa end) ' +
//     ' and ft.cod_empresa ' +
     ' in ('+vCodEmpresasDRE+') ' +
     ' and ft.ativo = 1 '+
     ' and ft.natureza = ''S'' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'')' +
     ' and (select count(*) from formpagamento fr ' +
     ' 		where fr.nrequisicao = ft.n_comando ' +
     '		and fr.cod_empresa = ft.cod_empresa ' +
     '		and fr.tpdocs = ''MOT'' ' +
     '		and (coalesce(fr.prcss,'''') <> '''' ' +
     '		or fr.data_mov > '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 '+
     ' and ft.'+vcampoutilvndveic+' <> 0';
//   'select sum(coalesce(ft.'+vcampoutilvndveic+',0)) as valor from com_fat ft,mot_ven vn,nat_op nt '+
//   'WHERE  ft.data_ven >= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+
//   ''' and ft.data_ven <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' and '+
//   'ft.chassiv = vn.chassiv and ft.num_nota_v = vn.num_nota_v and ft.n_comando = vn.n_comando and '+
//   'ft.cod_empresa = vn.cod_empresa and '+
//   'ft.natop_v = nt.codigo_nop and coalesce(nt.faturamento,''N'') <> ''N'' and ft.cod_empresa in ('+vCodEmpresasDRE+') and ft.ativo = 1 '+
//   'and (select count(*) from formpagamento fr where fr.nrequisicao = ft.n_comando and fr.cod_empresa = '+
//   'ft.cod_empresa and fr.tpdocs = ''MOT'' and (coalesce(fr.prcss,'''') <> '''' or fr.data_mov > '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 '+
//   'and ft.'+vcampoutilvndveic+' <> 0';
   buscas.open;
   while not buscas.eof do
   begin
     vsaldobal:=vsaldobal+buscas.FieldByName('VALOR').AsCurrency;
     buscas.next;
   end;
  end;

  if (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger >= 11)
  and (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger <= 16) then
  begin
   buscas.Close;
   buscas.SQL.text:= 'SELECT SUM(EQ.VLR_EQUI) AS SOMA FROM EQUIPAMENTO EQ ' +
    ' INNER JOIN EMPRESA EMP ON EQ.COD_EMPRESA = EMP.COD_EMPRESA ' +
   	' WHERE EQ.TIPEQUIP = '''+ copy(dataSet.FieldByName('DESC_BALANCO').AsString,1,1)+''' ' +
    ' AND EQ.TIP_EQUIP = ''I'' AND EQ.CODSEQ_BALANCO = '+ dataset.FieldByName('CODSEQ_BALANCO').AsString+
    ' AND (CASE WHEN(EMP.FINANCEIRO_UNIFICADO = ''S'') THEN EMP.CODIGO_UNIFICADORA ELSE EQ.COD_EMPRESA END) ' +
//    ' AND EQ.COD_EMPRESA ' +
    ' IN ('+vCodEmpresasDRE+') ' +
    ' AND EQ.ATIVO = 1 AND EQ.DAT_CAD_EQUI <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ';
   buscas.Open;
   vsaldobal:=vsaldobal+buscas.FieldByName('SOMA').AsCurrency;
   buscas.close;
  end;
  if (dataSet.FieldByName('CODSEQ_BALANCO').AsInteger = 17) then
  begin
    if hEquipamento = 0 then
      CarregaPacote('pkEquipamentos', hEquipamento);
    if DtmEquipamentos = nil then
     DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
    CadEquipamento := TEquipamentos.create;
    CadEquipamento.abreEquipamentos(vCodEmpresasDRE, vdtGeral);
    vcodemp:=vDadosIni.codEmpresa;
    vDadosIni.codEmpresa:=vCodEmpresasDRE;
    while not CadEquipamento.Eof do
    begin
      CadEquipamento.vDepreciacao.verificaDepreciacao(CadEquipamento);
      CadEquipamento.next;
    end;
    CadEquipamento.vDepreciacao.SomaDepreciacaoGeral(vCodEmpresasDRE,vdtgeral);
    vsaldobal:=vsaldobal+CadEquipamento.vDepreciacao.ValorDepreciado;
    CadEquipamento.Free;
    DtmEquipamentos.Free;
    DtmEquipamentos:=nil;
    UnloadPackage(HEquipamento);
    vDadosIni.codEmpresa:=vcodemp;
  end;
  if vtpbal = 'ATIVO' then
  begin
    if pos(trim(vDadosIni.StrZero(dataSet.FieldByName('CODSEQ_BALANCO').asinteger,2)),'07,08,11,12,13,14,15,16,17,35,37,38') <= 0 then
    begin
      buscas.Close;
      buscas.sql.text:='SELECT CTRL.DOCS,CTRL.CODIGO_CTRL,CTRL.CONTR_BANC, '+
      	' (SELECT FIRST 1 SAL.VAL_SLD FROM SAL_CTRL SAL ' +
        '		WHERE SAL.CODIGO_CTRL = CTRL.CODIGO_CTRL ' +
        '		AND SAL.COD_EMP = CTRL.codigo_emp ' +
        ' 	and sal.data_sld <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+ ''' ' +
	      '		ORDER BY DATA_SLD DESC) as SALDO,'+
        ' (SELECT FIRST 1 SAL.VL_CRD_SLD FROM SAL_CTRL SAL ' +
        ' 	WHERE SAL.CODIGO_CTRL = CTRL.CODIGO_CTRL ' +
        '		AND SAL.COD_EMP = CTRL.CODIGO_EMP ' +
        '		AND SAL.DATA_SLD <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
        '		ORDER BY DATA_SLD DESC) as SOMASALDO,'+
        ' (SELECT FIRST 1 SAL.SALDO_BANCO FROM SAL_CTRL SAL ' +
        '		WHERE SAL.CODIGO_CTRL = CTRL.CODIGO_CTRL ' +
        '		AND SAL.COD_EMP = CTRL.CODIGO_EMP ' +
        '   AND SAL.DATA_SLD <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+'''  ' +
        '		ORDER BY DATA_SLD DESC) as SALDOBANCO FROM CONTROLES CTRL ' +
        ' inner join controles_balanco BAL on CTRL.codigo_ctrl = BAL.codigo_ctrl '+
        ' 	and ctrl.codigo_emp = bal.cod_empresa ' +
        ' WHERE BAL.codseq_balanco = '+dataSet.FieldByName('CODSEQ_BALANCO').AsString+
        ' AND CTRL.CODIGO_EMP IN ('+vCodEmpresasDRE+') ' +
        ' and ctrl.ativo = 1 ' +
        ' order by ctrl.codigo_ctrl ';
      buscas.Open;
      buscas.FetchAll;
      vsaldobal:=0;
      while not buscas.Eof do
      begin
       Application.ProcessMessages;
       if (trim(buscas.FieldByName('DOCS').AsString) = 'N') or (buscas.FieldByName('DOCS').isnull) then
       begin
         if (trim(buscas.FieldByName('CONTR_BANC').AsString) = 'S')
          and (buscas.FieldByName('SALDOBANCO').ascurrency <> 0) then
          vsaldobal:=vsaldobal+buscas.FieldByName('SALDOBANCO').AsCurrency
         else
          vsaldobal:=vsaldobal+buscas.FieldByName('SALDO').AsCurrency;
       end
       else
       begin
        if (dataset.FieldByName('PRAZOINICIAL').AsInteger = 0) and
        (dataset.FieldByName('PRAZOFINAL').AsInteger = 0) then
          vsaldobal:=vsaldobal+buscas.FieldByName('SOMASALDO').AsCurrency
        else
        begin
          vbuscasinternas.close;
          vbuscasinternas.sql.text:='select SUM(VALOR+(case when jur.tpdoc = ''CRED'' then '+
          	' 	coalesce((select sum(valor_quitado) from baixa_creditos bx ' +
            '			where bx.cod_cred = jur.codseq and bx.codigo_emp = jur.codigo_emp ' +
            '			and bx.tp_operacao = ''P'' ' +
            '			and bx.datq_c > '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+ '''),0) else 0 end)) AS VALOR ' +
            ' from cred_jur jur ' +
            ' inner join empresa emp on jur.codigo_emp = emp.cod_empresa ' +
            ' where ';
          if dataset.FieldByName('PRAZOINICIAL').AsInteger > 90 then
           vbuscasinternas.sql.text := vbuscasinternas.sql.text+
            ' jur.data_venc >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
            ' AND jur.data_venc <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+''' ' +
            ' AND jur.CONTROLE = '+buscas.FieldByName('CODIGO_CTRL').AsString+
            ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else jur.codigo_emp end)  ' +
//            ' AND jur.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP')+
            ' IN ('+vCodEmpresasDRE+') ' +
            ' AND jur.DATA_REC <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
            ' AND (jur.DATA_QUITACAO > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' OR jur.DATA_QUITACAO IS NULL)'
          else
          begin
            vbuscasinternas.sql.text:=vbuscasinternas.sql.text+
            '(jur.DATA_QUITACAO IS NULL ' +
            ' AND jur.DATA_VENC < '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
            ' and jur.CONTROLE = '+buscas.FieldByName('CODIGO_CTRL').AsString+
            ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else jur.codigo_emp end)  ' +
//            ' AND jur.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
            ' IN ('+vCodEmpresasDRE+')) ' +
            ' or (jur.data_venc >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
            ' AND jur.data_venc <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+ ''' ' +
            ' AND jur.CONTROLE = '+buscas.FieldByName('CODIGO_CTRL').AsString+
            ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else jur.codigo_emp end)  ' +
//            ' AND jur.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
            ' IN ('+vCodEmpresasDRE+') ' +
            ' AND jur.DATA_REC <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
            ' AND (jur.DATA_QUITACAO > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' OR jur.DATA_QUITACAO IS NULL))';
          end;
          vbuscasinternas.Open;
          vsaldobal:=vsaldobal+vbuscasinternas.FieldByName('VALOR').AsCurrency;
        end;
       end;
       buscas.next;
      end;
      buscas.Close;
    end;
  end
  else
  begin
     if pos(trim(vDadosIni.StrZero(dataSet.FieldByName('CODSEQ_BALANCO').asinteger,2)),'07,08,11,12,13,14,15,16,17,35,36,37,38') <= 0 then
     begin
      buscas.Close;
      buscas.sql.text:='SELECT N_CONTA_PLC,CODSEQ_BALANCO FROM P_CONTAS_BALANCO ' +
        ' WHERE codseq_balanco = '+dataSet.FieldByName('CODSEQ_BALANCO').AsString+
      	' AND COD_EMPRESA IN ('+vCodEmpresasDRE+') ' +
        ' order by n_conta_plc ';
      buscas.Open;
      buscas.FetchAll;
      vsaldobal:=0;
      while not buscas.Eof do
      begin
        vbuscasinternas.close;
        vbuscasinternas.sql.text:='select ''CTP'' as tipo,' +
          ' SUM(coalesce(ctp.VALOR_CTP, 0)) AS VALOR from contas_a_pagar ctp ' +
        	' inner join empresa emp on ctp.codigo_emp = emp.cod_empresa where ';
        if dataset.FieldByName('PRAZOINICIAL').AsInteger > 90 then
          vbuscasinternas.SQL.Text:=vbuscasinternas.SQL.text+
          ' ctp.data_venc_ctp >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
          ' AND ctp.data_venc_ctp <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+ ''' ' +
          ' AND ctp.n_conta_plc = cast('+vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('n_conta_plc').AsString)+' as double precision) '+
          ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctp.codigo_emp end) ' +
          //' AND ctp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
          ' IN ('+vCodEmpresasDRE+') ' +
          ' AND ctp.DATA_ENT_CTP <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
          ' AND (ctp.DATQ_CTP > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' OR ctp.DATQ_CTP IS NULL) ' +
          ' group by 1'+
          ' union '+
          ' select ''LNC'' as tipo,SUM(coalesce(lanc.VALOR_L, 0)) AS VALOR from lancamentos lanc ' +
          ' inner join empresa emp on lanc.codigo_emp = emp.cod_empresa ' +
          ' where lanc.data >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
          ' AND lanc.data <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+ ''' ' +
          ' AND lanc.n_conta_plc = cast('+vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('n_conta_plc').AsString)+' as double precision)'+
          ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else lanc.codigo_emp end) ' +
//          ' AND lanc.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
          ' IN ('+vCodEmpresasDRE+') and lanc.lote is null ' +
          ' group by 1'
        else
          vbuscasinternas.SQL.Text:=vbuscasinternas.SQL.text+
          ' (ctp.datq_ctp is null and ctp.data_venc_ctp < '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+''' ' +
          ' AND ctp.n_conta_plc = cast('+vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('n_conta_plc').AsString)+' as double precision) '+
          ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctp.codigo_emp end) ' +
          //' AND ctp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
          ' IN ('+vCodEmpresasDRE+')) ' +
          ' or (ctp.data_venc_ctp >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
          ' AND ctp.data_venc_ctp <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+ ''' ' +
          ' AND ctp.n_conta_plc = cast('+vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('n_conta_plc').AsString)+' as double precision) '+
          ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctp.codigo_emp end) ' +
          //' AND ctp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
          ' IN ('+vCodEmpresasDRE+') ' +
          ' AND ctp.DATA_ENT_CTP <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
          ' AND (ctp.DATQ_CTP > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
          ' OR ctp.DATQ_CTP IS NULL)) ' +
          ' group by 1'+
          ' union '+
          ' select ''LNC'' as tipo,SUM(coalesce(lanc.VALOR_L, 0)) AS VALOR from lancamentos lanc ' +
          ' inner join empresa emp on lanc.codigo_emp = emp.cod_empresa ' +
          ' where lanc.data >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
          ' AND lanc.data <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+ ''' ' +
          ' AND lanc.n_conta_plc = cast('+vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('n_conta_plc').AsString)+' as double precision)'+
          ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else lanc.codigo_emp end) ' +
//          ' AND lanc.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
          ' IN ('+vCodEmpresasDRE+') and lanc.lote is null ' +
          ' group by 1';

        vbuscasinternas.Open;
        while not vbuscasinternas.Eof do
        begin
         vsaldobal:=vsaldobal+vbuscasinternas.FieldByName('VALOR').AsCurrency;
         vbuscasinternas.next;
        end;
        buscas.next;
      end;
      buscas.Close;
     end;
  end;
  Result:=vsaldobal;
end;

function TBalancoHw.ColocadadosGrid(Vstrgrid: TStringGrid): boolean;
var
 vtip: string;
 i,l,posicao: integer;
 vvalgrav: currency;
begin
//StringGrids -> Tag = 1 é ativo e Tag = 2 é Passivo. No Hint a descrição é o subtipo na table
  // dados_balanco
  // Olhando o Ativo Circulante
  // procurar aqui se já existe o balanço gravado no sistema caso não tenha fazer o que está abaixo
  for i := 1 to Vstrgrid.RowCount -1 do
    Vstrgrid.Rows[I].Clear;
  Vstrgrid.rowcount:=1;

  buscas.close;
  buscas.sql.text:='select * from apuracao_balanco ' +
  	' where mes = '+inttostr(vmesinf)+
    ' and ano = '+IntToStr(vanoinf)+
    ' and cod_empresa in ('+vCodEmpresasDRE+')';
  buscas.Open;
  vstatusbal:='N';
  if not buscas.IsEmpty then
  begin
    vstatusbal:='S';
    if Vstrgrid.Tag = 1 then
      vtip:='ATIVO'
    else
      vtip:='PASSIVO';
    Vstrgrid.Cells[0,0]:='DESCRIÇÃO';
    Vstrgrid.Cells[1,0]:='VALOR';
    Vstrgrid.FixedCols := 1;
    montaSelect('select * from dados_balanco ' +
    	' where tipo_balanco = '''+vtip+''' ' +
      ' AND SUBTIPO = '''+trim(Vstrgrid.hint)+'''');
    open;
    first;
    l:=1;
    while not Eof do
    begin
     Application.ProcessMessages;
     posicao:=pos('.',dataSet.FieldByName('CODIGO_INT_BAL').AsString);
     if copy(dataSet.FieldByName('CODIGO_INT_BAL').AsString,posicao+1,2) = '00' then
      Vstrgrid.Cells[0,l]:=dataSet.FieldByName('DESC_BALANCO').AsString
     else
      Vstrgrid.Cells[0,l]:='   '+dataSet.FieldByName('DESC_BALANCO').AsString;
     vvalgrav:=0;
     buscas.close;
     buscas.SQL.Text:= ' select * from apuracao_balanco ' +
     		' where mes = '+inttostr(vmesinf)+
        ' and ano = '+IntToStr(vanoinf)+
        ' and cod_empresa in ('+vCodEmpresasDRE+') ' +
        ' and COD_SEQBALANCO = '+dataSet.FieldByName('CODSEQ_BALANCO').AsString;
     buscas.Open;
     while not buscas.Eof do
     begin
       vvalgrav:=vvalgrav+buscas.FieldByName('VALOR').AsCurrency;
       buscas.Next;
     end;
     buscas.Close;
     Vstrgrid.Cells[1,l]:=vDadosIni.alndir(trim(Format('%n', [vvalgrav])),14);
     Vstrgrid.Cells[2,l]:=dataSet.FieldByName('CODSEQ_BALANCO').AsString;
     Vstrgrid.Cells[3,l]:=dataSet.FieldByName('SINAL').AsString;
     Vstrgrid.rowcount:=Vstrgrid.rowcount+1;
     Vstrgrid.FixedRows := 1;
     l:=l+1;
     Next;
    end;
  end
  else
  begin
    if Vstrgrid.Tag = 1 then
      vtip:='ATIVO'
    else
      vtip:='PASSIVO';
    Vstrgrid.Cells[0,0]:='DESCRIÇÃO';
    Vstrgrid.Cells[1,0]:='VALOR';
    montaSelect('select * from dados_balanco ' +
    	' where tipo_balanco = '''+vtip+''' ' +
      ' AND SUBTIPO = '''+trim(Vstrgrid.hint)+'''');
    open;
    first;
    l:=1;
    while not Eof do
    begin
     Application.ProcessMessages;
     posicao:=pos('.',dataSet.FieldByName('CODIGO_INT_BAL').AsString);
     if copy(dataSet.FieldByName('CODIGO_INT_BAL').AsString,posicao+1,2) = '00' then
      Vstrgrid.Cells[0,l]:=dataSet.FieldByName('DESC_BALANCO').AsString
     else
      Vstrgrid.Cells[0,l]:='   '+dataSet.FieldByName('DESC_BALANCO').AsString;
     Vstrgrid.Cells[1,l]:=vDadosIni.alndir(trim(Format('%n', [buscavlporTpBal(vtip)])),14);
     Vstrgrid.Cells[2,l]:=dataSet.FieldByName('CODSEQ_BALANCO').AsString;
     Vstrgrid.Cells[3,l]:=dataSet.FieldByName('SINAL').AsString;
     Vstrgrid.rowcount:=Vstrgrid.rowcount+1;
     Vstrgrid.FixedRows := 1;
     l:=l+1;
     Next;
    end;
  end;
end;

function TBalancoHw.confgravBal(vstrgrid: TStringGrid;
  vempresa: string): boolean;
  var
   i: integer;
begin
  Result:=true;
  vDadosIni.progressoFuncao('Gravando dados Balanco','Status da Gravação','Gravando dados do Balanço '+trim(vstrgrid.Hint));
  IniciaTransacao;
  try
    for i:=1 to vstrgrid.RowCount-1 do
    begin
     vApBalanco.Close;
     vApBalanco.CommandText:= ' select * from apuracao_balanco ' +
     		' where mes = '+inttostr(vmesinf)+
        ' and ano = '+IntToStr(vanoinf)+
        ' and cod_empresa in ('+vCodEmpresasDRE+') ' +
        ' and cod_seqbalanco = '+vstrgrid.Cells[2,i];
     vApBalanco.Open;
     if vApBalanco.IsEmpty then
       vApBalanco.Append
     else
       vApBalanco.Edit;
     vApBalanco.FieldByName('COD_SEQBALANCO').AsString:=Vstrgrid.Cells[2,i];
     vApBalanco.FieldByName('MES').AsInteger:=vmesinf;
     vApBalanco.FieldByName('ANO').AsInteger:=vanoinf;
     vApBalanco.FieldByName('COD_EMPRESA').AsString:=vCodEmpresasDRE;
     vApBalanco.FieldByName('VALOR').AsCurrency:=StrToCurr(vDadosIni.tirapontos(Vstrgrid.Cells[1,i],2));
     vApBalanco.Post;
     vApBalanco.ApplyUpdates(-1);
    end;
    if vIndicesBal.ChangeCount > 0 then
    begin
     vDadosIni.progressoFuncao('Gravando dados Balanco','Status da Gravação','Gravando Índices do Balanço');
     vIndicesBal.ApplyUpdates(-1);
    end;
    if CadEstoque.vestoqueHw.ChangeCount > 0 then
    begin
     vDadosIni.progressoFuncao('Gravando dados Balanco','Status da Gravação','Gravando Estoques Apurados');
     CadEstoque.vestoqueHw.ApplyUpdates(-1);
    end;

    CommitaTransacao;
  except
    on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(Pchar('GEST002 '+e.Message), 'Confirmação', MB_OK);
      registraErro('GEST002 ' + e.Message);
      Result := False;
    end;
  end;
end;

constructor TBalancoHw.create;
var
 i,x: integer;
begin
 SetLength(vIndicadoresBal,20,2);
 vIndicadoresBal[0,0]:='Prazo Médio Venda';
 vIndicadoresBal[1,0]:='Atraso Médio Recebimento';
 vIndicadoresBal[2,0]:='Prazo Médio Recebimento';
 vIndicadoresBal[3,0]:='Prazo Médio de estocagem((EST/CMV)*30)';
 vIndicadoresBal[4,0]:='Prazo Médio de Pagamento a Fornecedores';
 vIndicadoresBal[5,0]:='Rentabilidade';
 vIndicadoresBal[6,0]:='Índice de Endividamento(Teto < 1)';
 vIndicadoresBal[7,0]:='Índices de Liquidez Circulante(ILC)(Teto > 1)';
 vIndicadoresBal[8,0]:='Índices de Liquidez Geral(ILG)(Teto > 1)';
 vIndicadoresBal[9,0]:='Índices de Liquidez Seca(ILS)(Teto > 1)';
 vIndicadoresBal[10,0]:='Ciclo Financeiro(Dias)';
 vIndicadoresBal[11,0]:='Giro de Caixa(Gcx)';
 vIndicadoresBal[12,0]:='Capital de Giro Disponível(KG)';
 vIndicadoresBal[13,0]:='Necessidade de Capital de Giro';
 vIndicadoresBal[14,0]:='Patrimônio Líquido';
 vIndicadoresBal[15,0]:='Tempo de Reposição Estoque Produtos';
 vIndicadoresBal[16,0]:='Excesso de Estoque Produtos';
 vIndicadoresBal[17,0]:='Dias uteis desta Empresa';
 vIndicadoresBal[18,0]:='Perc. Obsoletos';
 vIndicadoresBal[19,0]:='Desembolso Diário($)';
// aqui...
   for  i:=0 to 19 do
   for x := 1 to 1 do
     vIndicadoresBal[i,x]:='0';
 buscas:=TIBQuery(DtmGestorHw.QrBuscas);
 transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
 dataSet:=TClientDataSet(DtmGestorHw.CdsDadosBalanco);
 vbuscasinternas:=TIBQuery(DtmGestorHw.IbBuscasBalanco);
 vApBalanco:=TClientDataSet(dtmGestorHw.CdsApuracaoBalanco);
 CadEstoque:=TEstoque.create;
 CadEstoque.vempresas:=vCodEmpresasDRE;
 cadDespGestor:=TDespesasGestor.create;
 vIndicesBal:=TClientDataSet(dtmGestorHw.CdsIndicesBalanco);
 datasetBI:=TIBQuery(DtmGestorHw.IbCubeGeral);
 buscas.Close;
 buscas.sql.text:='select coalesce(US_VLNF_VEICDRE,''N'') as US_VLNF_VEICDRE from empresa where cod_empresa = '+vDadosIni.codEmpresa;
 buscas.Open;
 if buscas.FieldByName('US_VLNF_VEICDRE').AsString = 'S' then
  vcampoutilvndveic:='VALTOT_V'
 else
  vcampoutilvndveic:='VALOR_REAL';
 buscas.close;

 vpatLiq:=0;
 vdifPatlIqM:=0;
 vdifPatliqA:=0;
 Vvatcirc:=0;
 vvastrealp:=0;
 vvstperm:=0;
 vvstpascirc:=0;
 vvstpasexlp:=0;
 vstatusbal:='N';
 vdesconsideraPME:=false;
 vdesconsideraPMPF:=false;
end;

destructor TBalancoHw.destroy;
begin
  Close;
  vIndicesBal.close;
  vbuscasinternas.Close;
  CadEstoque.free;
  cadDespGestor.free;
  inherited;
end;


function TBalancoHw.detalhesBalBI(vFerCube: THierCube;vcodbal: string): boolean;
var
 vdtgeral: TDate;
begin
  montaSelect('select * from dados_balanco where ativo = 1');
  result:=false;
  vdtGeral:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
  if (vcodbal = '7') or (vcodbal = '8') then
  begin
     if vcodbal = '7' then
     begin
      datasetBI.Close;
      datasetBI.SQL.text:='select ''PEÇAS'' as tipo,emp.identificacao_emp as nome_emp,gr.descricao,ivb.cod_prod,ivb.mes,ivb.ano,'+
      'pr.num_fab_prod as codigoprod,pr.descr_prod as descricao_prod,'+
      'sum(ivb.quantidade) as qtde,sum(ivb.quantidade*ivb.valor_prod) as custo from inv_balanco ivb,grupos gr,produtos pr,empresa emp where '+
      'ivb.grupo_prod = pr.grupo_prod and ivb.cod_prod = pr.cod_prod and '+
      'ivb.cod_empresa = pr.cod_empresa and ivb.grupo_prod = gr.codigo_grup '+
      'and ivb.cod_empresa = emp.cod_empresa ' +
      'and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ivb.cod_empresa end) ' +
      'in ('+vCodEmpresasDRE+') and ivb.versaov = 0 '+
      'and ivb.mes = '+IntToStr(vmesinf)+' and ivb.ano = '+IntToStr(vanoinf)+ ' ' +  
      'group by nome_emp,gr.descricao,ivb.cod_prod,ivb.mes,ivb.ano,codigoprod,tipo,descricao_prod '+
      'union '+
      'select ''VEICS'' as tipo,emp.identificacao_emp as nome_emp,gr.descricao,ivb.cod_prod,ivb.mes,ivb.ano,'+
      'ivb.chassi_mt||''   '' as codigoprod,gr.descricao||''               '' as descricao_prod,'+
      'sum(ivb.quantidade) as qtde,sum(ivb.valor_prod) as custo from inv_balanco ivb,tipmodelo gr,empresa emp where '+
      'ivb.versaov = gr.codigo and ivb.cod_empresa = gr.cod_empresa '+
      'and ivb.cod_empresa = emp.cod_empresa ' +
      'and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ivb.cod_empresa end) ' +
      'in ('+vCodEmpresasDRE+') and ivb.versaov <> 0' +
      'and ivb.mes = '+IntToStr(vmesinf)+' and ivb.ano = '+IntToStr(vanoinf)+ ' ' +
      'group by nome_emp,gr.descricao,ivb.cod_prod,ivb.mes,ivb.ano,codigoprod,tipo,descricao_prod ';
     end;
     if vcodbal = '8' then
     begin
      datasetBI.Close;
      datasetBI.SQL.text:='select ''PECAS'' as tipo,emp.identificacao_emp as nome_emp,gr.descricao,ivb.cod_prod,ivb.mes,ivb.ano,'+
      'pr.num_fab_prod as codigoprod,pr.descr_prod as descricao_prod,'+
      'sum(ivb.quantidade) as qtde,sum(ivb.qtde_real*ivb.valor_prod) as custo from inv_balanco ivb,grupos gr,produtos pr,empresa emp where '+
      'ivb.grupo_prod = pr.grupo_prod and ivb.cod_prod = pr.cod_prod and '+
      'ivb.cod_empresa = pr.cod_empresa and ivb.grupo_prod = gr.codigo_grup '+
      'and ivb.cod_empresa = emp.cod_empresa ' +
      'and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ivb.cod_empresa end) ' +
      'in ('+vCodEmpresasDRE+') and ivb.versaov = 0  and obsoleto = ''S'' '+
      'and ivb.mes = '+IntToStr(vmesinf)+' and ivb.ano = '+IntToStr(vanoinf)+ ' ' +
      'group by nome_emp,gr.descricao,ivb.cod_prod,ivb.mes,ivb.ano,codigoprod,tipo,descricao_prod ';
     end;
     datasetBI.open;
     vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
     vFerCube.BuildDimensionMap;
     vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
     vFerCube.DefineFieldAsDimension('tipo','Tipo de Produto',dgRow);
     vFerCube.DefineFieldAsDimension('descricao','Grupo Produto',dgRow);
     vFerCube.DefineFieldAsDimension('descricao_prod','Descricao do Produto',dgpage);
     vFerCube.DefineFieldAsDimension('ANO','Ano Movimento',dgCol);
     vFerCube.DefineFieldAsDimension('MES','Mês do Movimento',dgCol);
     vFerCube.DefineFieldAsDimension('codigoprod','Código Produto',dgPage);
     vFerCube.DefineFieldAsSummary('qtde');
     vFerCube.DefineFieldAsSummary('custo');
     Result:=true;
  end;
  if vcodbal = '35' then
  begin
    datasetBI.Close;
    datasetBI.SQL.text:='SELECT emp.identificacao_emp as nome_emp,cp.chassi_conc,cp.n_doc_ctp,'+
    'extract(month from datq_ctp) as mes,extract(year from datq_ctp) as ano,'+
    'extract(day from cp.datq_ctp) as dia,'+
//    '(extract(day from (select first 1 et.data_ch_nota from comprasmesesv4 et where '+
//    'et.chassi = cp.chassi_conc and et.cod_empresa = cp.codigo_emp order by data_ch_nota desc))'+
//    '||''/''||extract(month from (select first 1 et.data_ch_nota from comprasmesesv4 et where '+
//    'et.chassi = cp.chassi_conc and et.cod_empresa = cp.codigo_emp order by data_ch_nota desc))'+
//    '||''/''||extract(year from (select first 1 et.data_ch_nota from comprasmesesv4 et where '+
//    'et.chassi = cp.chassi_conc and et.cod_empresa = cp.codigo_emp order by data_ch_nota desc))) as datachegada,'+
    ' sum(cp.valor_ctp) as valor from contas_a_pagar cp ' +
    ' inner join empresa emp on cp.cod_emp_mult = emp.cod_empresa ' +
    ' and cp.datq_ctp >= '''+FormatDateTime('mm/dd/yyyy',strtodate('01/01/'+IntToStr(vanoinf)))+ ''' ' + // colocar aqui a data inicial do ano
    ' and cp.datq_ctp <= '''+FormatDateTime('mm/dd/yyyy',(vdat2))+ '''  ' +
    ' and ((not cp.chassi_conc is null) and cp.chassi_conc <> '''') '+
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.codigo_emp end) ' +
//    ' and cp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
    ' in ('+vCodEmpresasDRE+') ' +
    ' and ((select first 1 et.data_ch_nota from comprasmesesv4 et ' +
    ' where et.chassi = cp.chassi_conc and et.cod_empresa = cp.codigo_emp ' +
    ' order by data_ch_nota desc) > '''+ FormatDateTime('mm/dd/yyyy',(vdat2))+''' ' +
    ' or (select first 1 et.data_ch_nota from comprasmesesv4 et ' +
    ' where et.chassi = cp.chassi_conc and et.cod_empresa = cp.codigo_emp order by data_ch_nota desc) is null) ' +
    ' group by cp.chassi_conc,cp.n_doc_ctp,mes,ano,dia,nome_emp';
    //,datachegada';
    datasetBI.open;
    vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
    vFerCube.BuildDimensionMap;
    vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
    vFerCube.DefineFieldAsDimension('chassi_conc','Chassi',dgRow);
//    vFerCube.DefineFieldAsDimension('datachegada','Data chegada',dgpage);
    vFerCube.DefineFieldAsDimension('n_doc_ctp','N. Documento',dgpage);
    vFerCube.DefineFieldAsDimension('ANO','Ano Quitacao',dgCol);
    vFerCube.DefineFieldAsDimension('MES','Mês Quitacao',dgCol);
    vFerCube.DefineFieldAsDimension('dia','Dia Quitacao',dgPage);
    vFerCube.DefineFieldAsSummary('valor');
    Result:=true;
  end;
  if vcodbal = '36' then
  begin
    datasetBI.Close;
    datasetBI.SQL.text:='select emp.identificacao_emp as nome_emp,it4.chassi,sum(it4.prec_cusm_prod-(it4.valor_icmsub+it4.piscofins)) as custo_nf,nf4.num_nf, '+
   ' sum(coalesce(ctp.valor_ctp,0)) as valor_ctp,coalesce(ctp.n_doc_ctp,'''') as n_doc_ctp, '+
   ' extract(month from nf4.data_lanc) as mes_lanc_nf,extract(year from nf4.data_lanc) as ano_lanc_nf,'+
   ' extract(day from nf4.data_lanc) as dia_lanc_nf,'+
   ' (extract(day from ctp.data_venc_ctp)||''/''||extract(month from ctp.data_venc_ctp)||''/''||extract(year from ctp.data_venc_ctp)) as vencimento '+
   ' from notafiscal nf4 ' +
   ' inner join empresa emp on nf4.cod_empresa = emp.cod_empresa ' +
   ' inner join notafiscal_item it4 on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa '+
   ' inner join notafiscal_item_veiculo itv4 on it4.cod_nf=itv4.cod_nf ' +
   '		and it4.cod_empresa = itv4.cod_empresa and it4.chassi = itv4.chassi '+
   ' left join contas_a_pagar ctp on ctp.num_nota_nfe = nf4.num_nf ' +
   '		and ctp.cod_emp_mult = nf4.cod_empresa and ctp.chassi_conc = itv4.chassi ' +
   ' and n_conta_plc <> 48.01 and n_conta_plc <> 46.01 and n_conta_plc <> 20 '+
   ' inner join empresa emp on nf4.cod_empresa = emp.cod_empresa '+
   ' where nf4.natureza_nf=''E'' and nf4.tipo_nf = ''V'' ' +
   ' and nf4.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',strtodate('01/01/'+IntToStr(vanoinf)))+ ''' ' + // colocar aqui a data inicial do ano
   ' and nf4.data_lanc <= '''+FormatDateTime('mm/dd/yyyy',(vdat2))+ ''' ' +
   ' and (nf4.status = ''Fechada'') and (nf4.codigo_nop <> 1409 and '+
   ' nf4.codigo_nop <> 2409 and nf4.codigo_nop <> 1913 and nf4.codigo_nop <> 1411) '+
   ' and nf4.ativo=1 ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf4.cod_empresa end) ' +
   ' in ('+vCodEmpresasDRE+') '+
   ' and (ctp.datq_ctp is null or (ctp.datq_ctp > '''+FormatDateTime('mm/dd/yyyy',(vdat2))+''')) '+
   ' group by it4.chassi,ctp.n_doc_ctp,nf4.num_nf,mes_lanc_nf,ano_lanc_nf,dia_lanc_nf,nome_emp,vencimento';
    datasetBI.open;
    vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
    vFerCube.BuildDimensionMap;
    vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
    vFerCube.DefineFieldAsDimension('chassi','Chassi',dgRow);
    vFerCube.DefineFieldAsDimension('num_nf','Num NF',dgpage);
    vFerCube.DefineFieldAsDimension('vencimento','Data Vencimento',dgpage);
    vFerCube.DefineFieldAsDimension('n_doc_ctp','N. Documento',dgpage);
    vFerCube.DefineFieldAsDimension('ano_lanc_nf','Ano Movimento',dgCol);
    vFerCube.DefineFieldAsDimension('mes_lanc_nf','Mês do Movimento',dgCol);
    vFerCube.DefineFieldAsDimension('dia_lanc_nf','Dia do Movimento',dgPage);
    vFerCube.DefineFieldAsSummary('valor_ctp');
    vFerCube.DefineFieldAsSummary('custo_nf');
    Result:=true;
  end;

  if vcodbal = '37' then
  begin
   datasetBI.Close;
   dataSetBI.SQL.Text:='SELECT emp.identificacao_emp as nome_emp,extract(month from rec.data_rec) as mes,'+
   'extract(year from rec.data_rec) as ano,extract(day from rec.data_rec) as dia,rec.nome_dev,'+
   'rec.nrecibo,SUM(VALOR+coalesce((SELECT sum(hst.valor_baixa) as vlbx FROM HIST_REC hst where hst.data_baixa > '''+FormatDateTime('mm/dd/yyyy',vdat2)+''''+
   'and hst.data_baixa <= '''+FormatDateTime('mm/dd/yyyy',date)+''' and hst.cod_empresa in (' + vCodEmpresasDRE + ') and hst.ativo= rec.ativo '+
   'and (hst.RECANT= ''S'' OR hst.RECANT = ''O'') and hst.nrecibo = rec.nrecibo '+
   'and hst.historico_rec like ''%PARCIAL%''),0)) AS VALOR '+
   'FROM RECIBOS rec,empresa emp where rec.data_rec <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' and '+
   '((rec.data_baixa > '''+FormatDateTime('mm/dd/yyyy',vdat2)+''') or '+
   '(rec.data_baixa is null)) and rec.RECANT = ''S'' ' +
   'and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else rec.cod_empresa end) ' +
   'in ('+vCodEmpresasDRE+
   ') and rec.ativo=1 and rec.cod_empresa = emp.cod_empresa ' +
   'group by nome_emp,mes,ano,dia,rec.nome_dev,rec.nrecibo ';
   datasetBI.OPEN;
   vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
   vFerCube.BuildDimensionMap;
   vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
   vFerCube.DefineFieldAsDimension('ANO','Ano Recibo',dgrow);
   vFerCube.DefineFieldAsDimension('MES','Mês do Recibo',dgrow);
   vFerCube.DefineFieldAsDimension('DIA','Dia do Recibo',dgpage);
   vFerCube.DefineFieldAsDimension('colaborador','Colaborador',dgpage);
   vFerCube.DefineFieldAsDimension('nrecibo','Descricao do Produto',dgrow);
   vFerCube.DefineFieldAsDimension('nome_dev','Nome do Devedor',dgPage);
   vFerCube.DefineFieldAsSummary('valor');
   Result:=true;
  end;


  if vcodbal = '38' then
  begin
//    dataSet.First;
   dataSet.Locate('CODSEQ_BALANCO',vcodbal,[loCaseInsensitive]);
   datasetBI.Close;
   dataSetBI.SQL.Text:=
   ' select emp.identificacao_emp as empresa,gr.descricao as grupo_prod,p.tipo||'' '' as tipo,p.data_fech,'+
   ' ((select result from strzero(extract(month from p.data_fech),2))) as mes,extract(year from p.data_fech) '+
   ' as ano,((select result from strzero(extract(day from p.data_fech),2))) as dia,'+
   ' i.descr_prod_ped as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,'+
   ' sum(i.VLTOT_PED_ITEM+coalesce(I.RATEIO_ACRESC,0)) as bruto,sum(coalesce(i.RATEIO_DESC,0)) as desconto,'+
   ' sum(i.QUANT_PED_ITEM*i.PCUST_MC) as custo,sum(i.QUANT_PED_ITEM) as Qtde_itens,p.tipv as tipovenda,case when '+
   ' (p.op_cxl is null) then 0 else p.op_cxl end as operador_cxl,p.nped as nvenda,cl.sexo,'+
   ' case when (p.tipo_os is null) then ''CLIENTE   '' else p.tipo_os end as tipo_os,cl.clqtdcompra,cl.clsomacompra,'+
   ' clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,'+
   ' sum(i.VLTOT_PED_ITEM+coalesce(I.RATEIO_ACRESC,0)-coalesce(i.RATEIO_DESC,0)) as liquido,i.nitem,'+
   ' coalesce(tv.venda,''N'') as venda,cl.cidade,tpf.descricao_tipo,case when (strlen(trim(cl.cpfcgc)) <= 11) '+
   ' then ''FISICA'' else ''JURIDICA'' end as tipo_cliente from PEDVENDA_PROD i ' +
   ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
   ' inner join produtos pr on i.grupo_prod = '+
   ' pr.grupo_prod and i.cod_prod = pr.cod_prod and i.cod_empresa = pr.cod_empresa '+
   ' inner join GRUPOS GR  on i.grupo_prod = gr.codigo_grup ' +
   ' left join SUB_GRUPO sb on coalesce(pr.sub_g_prod, 0) = sb.codigo_subgr '+
   ' inner join colaborador col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa '+
   ' inner join funcoes func on col.cod_funcao = func.cod_funcao '+
   ' inner join depto dep on func.cod_depto = dep.cod_depto '+
   ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa '+
   ' left join tipos_clientes tpf on cl.codigo_tipo = tpf.codigo_tipo '+
   ' inner join EMPRESA emp on p.cod_empresa = emp.cod_empresa '+
   ' left join tipo_vendas tv on p.tipo = tv.tipo and (p.tipv=tv.sigla or (p.tipo_os=tv.tipo_os)) '+
   ' where (i.status is null or i.status = '''') and ((p.tipo = ''OS'') or (p.tipo = ''REQ'')) ' +
   ' and p.data_fech >= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
   ' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
   ' and (select count(*) from formpagamento fr where fr.nrequisicao = p.nped ' +
   ' and fr.cod_empresa = p.cod_empresa and fr.tpdocs = p.tipo ' +
   ' and (coalesce(fr.prcss,'''') <> '''' ' +
   ' or fr.data_mov > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end)  ' +
   ' in ('+vCodEmpresasDRE+')'+
   ' group by empresa,grupo_prod,tipo,mes,ano,dia,descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,data_fech,operador_cxl,nvenda,sexo,tipo_os,'+
   ' cl.clqtdcompra,cl.clsomacompra,clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,nitem,venda,'+
   ' cidade,tpf.descricao_tipo,tipo_cliente '+
   ' union '+
   ' select emp.identificacao_emp as empresa,s.desc_servico||''                    '' as grupo_prod,''OSS '' as tipo,'+
   ' p.data_fech,(select result from strzero(extract(month from p.data_fech),2)) as mes,extract(year from p.data_fech) as ano,'+
   ' (select result from strzero(extract(day from p.data_fech),2)) as dia,'+
   ' s.desc_servico as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,'+
   ' sum(i.VALOR_TOT_SERV+coalesce(i.RATEIO_ACRESC,0)+coalesce(i.PRC_INT_SERV,0)) as bruto,'+
   ' sum(coalesce(i.RATEIO_DESC,0)) as desconto, 0 as custo,sum(i.QUANT_SERV_PED) as Qtde_itens,'+
   ' p.tipv as tipovenda,case when (p.op_cxl is null) then 0 else p.op_cxl end as operador_cxl,p.nped as nvenda,cl.sexo,'+
   ' case when (p.tipo_os is null) then ''CLIENTE   '' else p.tipo_os end as tipo_os,cl.clqtdcompra,cl.clsomacompra,'+
   ' clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,'+
   ' sum(i.VALOR_TOT_SERV+coalesce(i.PRC_INT_SERV,0)+coalesce(i.RATEIO_ACRESC,0)-coalesce(i.RATEIO_DESC,0)) as liquido,i.nitem,'+
   ' coalesce(tv.venda,''N'') as venda,cl.cidade,tpf.descricao_tipo,case when (strlen(trim(cl.cpfcgc)) <= 11) '+
   ' then ''FISICA'' else ''JURIDICA'' end as tipo_cliente from PEDVENDA_SERV i '+
   ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa '+
   ' inner join TIPO_SERVICO s on i.cod_servico = s.cod_servico '+
   ' inner join COLABORADOR col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa '+
   ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
   ' inner join depto dep on func.cod_depto = dep.cod_depto '+
   ' left join sub_grupo sb on sb.codigo_subgr = 0 '+
   ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa '+
   ' left join tipos_clientes tpf on cl.codigo_tipo = tpf.codigo_tipo '+
   ' inner join EMPRESA emp on p.cod_empresa = emp.cod_empresa '+
   ' left join tipo_vendas tv on p.tipo = tv.tipo and (p.tipv=tv.sigla or (p.tipo_os=tv.tipo_os)) '+
   ' where (i.status is null or i.status = '''') and ((p.tipo = ''OS'')) ' +
   ' and p.data_fech >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
   ' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
   ' and (select count(*) from formpagamento fr where fr.nrequisicao = p.nped ' +
   ' and fr.cod_empresa = p.cod_empresa and fr.tpdocs = p.tipo ' +
   ' and (coalesce(fr.prcss,'''') <> '''' ' +
   ' or fr.data_mov > ''' +  FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end)  ' +
   ' in ('+vCodEmpresasDRE+')'+
   ' group by empresa,grupo_prod,tipo,mes,ano,dia,descricao_prod,nome_vendedor,tipovenda,sub_grupo,'+
   ' nome_cliente,data_fech,operador_cxl,nvenda,sexo,tipo_os,cl.clqtdcompra,cl.clsomacompra,'+
   ' clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,nitem,'+
   ' venda,cidade,tpf.descricao_tipo,tipo_cliente '+
   ' union '+
   ' select emp.identificacao_emp as empresa,i.descr_servt||''                    '' as grupo_prod,''OST '' as tipo,p.data_fech,'+
   ' (select result from strzero(extract(month from p.data_fech),2)) as mes,extract(year from p.data_fech) as ano,'+
   ' (select result from strzero(extract(day from p.data_fech),2)) as dia,i.descr_servt as descricao_prod,'+
   ' col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,sum(coalesce(i.VL_SERVT,0)) '+
   ' as bruto,sum(0) as desconto, sum(0) as custo,count(i.vl_servt) as qtde_itens, p.tipv as tipovenda,'+
   ' case when (p.op_cxl is null) then 0 else p.op_cxl end as operador_cxl,p.nped as nvenda,cl.sexo,'+
   ' case when (p.tipo_os is null) then ''CLIENTE   '' else p.tipo_os end as tipo_os,cl.clqtdcompra,cl.clsomacompra,'+
   ' clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,'+
   ' sum(coalesce(i.VL_SERVT,0)) as liquido,0 as nitem,coalesce(tv.venda,''N'') as venda,cl.cidade,'+
   ' tpf.descricao_tipo,case when (strlen(trim(cl.cpfcgc)) <= 11) then ''FISICA'' else ''JURIDICA'' end as tipo_cliente '+
   ' from PEDVENDA_SERV_TERC i ' +
   ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa '+
   ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa '+
   ' left join tipos_clientes tpf on cl.codigo_tipo = tpf.codigo_tipo '+
   ' left join sub_grupo sb on sb.codigo_subgr = 0 '+
   ' inner join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa '+
   ' inner join empresa emp on p.cod_empresa = emp.cod_empresa '+
   ' left join tipo_vendas tv on p.tipo = tv.tipo and (p.tipv=tv.sigla or (p.tipo_os=tv.tipo_os)) '+
   ' where ((p.tipo = ''OS'')) and p.data_fech >= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
   ' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
   ' and (select count(*) from formpagamento fr '+
   ' where fr.nrequisicao = p.nped and fr.cod_empresa = p.cod_empresa ' +
   ' and fr.tpdocs = p.tipo and (coalesce(fr.prcss,'''') <> '''' ' +
   ' or fr.data_mov > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end)  ' +
   ' in ('+vCodEmpresasDRE+') '+
   ' group by empresa,grupo_prod,tipo,mes,ano,dia,descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,'+
   ' data_fech,operador_cxl,nvenda,sexo,tipo_os,cl.clqtdcompra,cl.clsomacompra,clultimacompra,cl.clatrasocompra,'+
   ' cl.clqtdveiculo,cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,nitem,venda,cidade,tpf.descricao_tipo,tipo_cliente '+
   ' union '+
   ' select emp.identificacao_emp as empresa,i.descricao||''                    '' as grupo_prod,''OSPT'' as tipo,p.data_fech,'+
   ' (select result from strzero(extract(month from p.data_fech),2)) as mes,extract(year from p.data_fech) as ano,'+
   ' (select result from strzero(extract(day from p.data_fech),2)) as dia,i.descricao as descricao_prod,'+
   ' col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,sum(coalesce(i.vl_total,0))'+
   ' as bruto,sum(0) as desconto, sum(i.vlcusto_tot) as custo,count(i.qtde) as qtde_itens, p.tipv as tipovenda,'+
   ' case when (p.op_cxl is null) then 0 else p.op_cxl end as operador_cxl,p.nped as nvenda,cl.sexo,'+
   ' case when (p.tipo_os is null) then ''CLIENTE   '' else p.tipo_os end as tipo_os,cl.clqtdcompra,cl.clsomacompra,'+
   ' clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,'+
   ' sum(coalesce(i.vl_total,0)) as liquido,0 as nitem,coalesce(tv.venda,''N'') as venda,cl.cidade,'+
   ' tpf.descricao_tipo,case when (strlen(trim(cl.cpfcgc)) <= 11) then ''FISICA'' else ''JURIDICA'' end as tipo_cliente'+
   ' from PEDVENDA_PROD_TERC i'+
   ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa'+
   ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa'+
   ' left join tipos_clientes tpf on cl.codigo_tipo = tpf.codigo_tipo'+
   ' left join sub_grupo sb on sb.codigo_subgr = 0 '+
   ' inner join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa'+
   ' inner join empresa emp on p.cod_empresa = emp.cod_empresa'+
   ' left join tipo_vendas tv on p.tipo = tv.tipo and (p.tipv=tv.sigla or (p.tipo_os=tv.tipo_os))'+
   ' where ((p.tipo = ''OS'')) and p.data_fech >= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
   ' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
   ' and (select count(*) from formpagamento fr'+
   ' where fr.nrequisicao = p.nped and fr.cod_empresa = p.cod_empresa'+
   ' and fr.tpdocs = p.tipo and (coalesce(fr.prcss,'''') <> '''' '+
   ' or fr.data_mov > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end)'+
   ' in ('+vCodEmpresasDRE+')'+
   ' group by empresa,grupo_prod,tipo,mes,ano,dia,descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,'+
   ' data_fech,operador_cxl,nvenda,sexo,tipo_os,cl.clqtdcompra,cl.clsomacompra,clultimacompra,cl.clatrasocompra,'+
   ' cl.clqtdveiculo,cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,nitem,venda,cidade,tpf.descricao_tipo,tipo_cliente'+
   ' union '+
   //troquei o select pois nao usa mais a tabela mot_ven
   ' select emp.identificacao_emp as empresa,vv.descricao||''-''||cast(ft.n_comando as char(10))||''         '' as grupo_prod,case when ft.tipo_venda_v = ''U'' '+
   ' then ''VEIU'' else ''VEI '' end as tipo,ft.data_ven,(select result from strzero(extract(month from ft.data_ven),2)) '+
   ' as mes,extract(year from ft.data_ven) as ano,(select result from strzero(extract(day from ft.data_ven),2)) as dia,'+
   ' vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,'+
   ' sum(coalesce(ft.'+vcampoutilvndveic+',0)) as bruto,0 as desconto,sum(' +
   '      case when coalesce(est.num_nota,0) > 0 then' +
   '        case when ft.tipo_venda_v = ''U'' then' +
   '          coalesce((select first 1 (et.custo) from comprasmesesv40 et' +
   '             where et.chassi = ft.chassiv and et.cod_empresa = ft.cod_empresa and et.status_uso = ft.tipo_venda_v' +
   '             order by data_ch_nota desc), coalesce(est.preco_custo,0))' +
   '        else' +
   '          coalesce((select first 1 (et.custo) from comprasmesesv40 et' +
   '             where et.chassi = ft.chassiv and et.cod_empresa = ft.cod_empresa and et.status_uso = ft.tipo_venda_v' +
   '             order by data_ch_nota), coalesce(est.preco_custo,0))' +
   '        end' +
   '      else' +
   '        coalesce(est.preco_custo,0)' +
   '      end' +
   ' ) as custo,count(ft.n_comando) as '+
   ' qtde_itens,''V'' as tipovenda,case when (ft.op_cxl is null) then 0 else ft.op_cxl end as operador_cxl,ft.n_comando as nvenda,cl.sexo,'+
   ' ''CLIENTE   '' as tipo_os,cl.clqtdcompra,cl.clsomacompra,clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,cl.clsomaveiculo,'+
   ' cl.clultimoveiculo,cl.cllucroveiculo,sum(coalesce(ft.'+vcampoutilvndveic+',0)) as liquido,1 as nitem,''S'' as venda,cl.cidade,'+
   ' tpf.descricao_tipo,case when (strlen(trim(cl.cpfcgc)) <= 11) then ''FISICA'' else ''JURIDICA'' end as tipo_cliente '+
   ' from com_fat ft' +
   ' inner join est_moto est on est.chassi_c = ft.chassiv and est.cod_empresa = ft.cod_empresa and est.codigo = ft.cod_estmoto' +
   ' inner join tipmodelo vv on est.versaoest = vv.codigo and est.cod_empresa = vv.cod_empresa' +
   ' inner join clientes cl on ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa' +
   ' inner join nat_op nt on nt.codigo_nop = ft.natop_v and nt.faturamento = ''S''' +
   ' inner join colaborador col on ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa' +
   ' inner join empresa emp on emp.cod_empresa = ft.cod_empresa' +
   ' left join sub_grupo sb on sb.codigo_subgr = 0' +
   ' left join tipos_clientes tpf on tpf.codigo_tipo = cl.codigo_tipo' +
   ' where ft.data_ven >= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
   ' and ft.data_ven <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
   ' and (select count(*) from formpagamento fr '+
   ' where fr.nrequisicao = ft.n_comando and fr.cod_empresa = ft.cod_empresa and fr.tpdocs = ''MOT'' and '+
   ' (coalesce(fr.prcss,'''') <> '''' ' +
   ' or fr.data_mov > '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 ' +
   ' and ft.cod_empresa = emp.cod_empresa and ft.ativo = 1 ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ft.cod_empresa end)  ' +
   ' in ('+vCodEmpresasDRE+')' +
   ' and ft.natureza = ''S'' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'')' +
   ' group by empresa,grupo_prod,tipo,'+
   ' mes,ano,dia,descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,data_ven,operador_cxl,nvenda,'+
   ' sexo,tipo_os,cl.clqtdcompra,cl.clsomacompra,clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,'+
   ' cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,nitem,venda,cidade,tpf.descricao_tipo,tipo_cliente';
//   'union '+
//   'select emp.identificacao_emp as empresa,vv.descricao||''-''||cast(ft.n_comando as char(10))||''         '' as grupo_prod,case when ft.tipo_venda_v = ''U'' '+
//   'then ''VEIU'' else ''VEI '' end as tipo,ft.data_ven,(select result from strzero(extract(month from ft.data_ven),2)) '+
//   'as mes,extract(year from ft.data_ven) as ano,(select result from strzero(extract(day from ft.data_ven),2)) as dia,'+
//   'vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,'+
//   'sum(coalesce(ft.'+vcampoutilvndveic+',0)) as bruto,0 as desconto,sum(vn.vl_compra_us) as custo,count(vn.vl_compra_us) as '+
//   'qtde_itens,''V'' as tipovenda,case when (ft.op_cxl is null) then 0 else ft.op_cxl end as operador_cxl,ft.n_comando as nvenda,cl.sexo,'+
//   '''CLIENTE   '' as tipo_os,cl.clqtdcompra,cl.clsomacompra,clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,cl.clsomaveiculo,'+
//   'cl.clultimoveiculo,cl.cllucroveiculo,sum(coalesce(ft.'+vcampoutilvndveic+',0)) as liquido,1 as nitem,''S'' as venda,cl.cidade,'+
//   'tpf.descricao_tipo,case when (strlen(trim(cl.cpfcgc)) <= 11) then ''FISICA'' else ''JURIDICA'' end as tipo_cliente '+
//   'from com_fat ft,mot_ven vn,sub_grupo sb,TIPMODELO vv,colaborador col,empresa emp,clientes cl,tipos_clientes tpf,nat_op nt '+
//   'where ft.natop_v = nt.codigo_nop and nt.faturamento <> ''N'' and sb.codigo_subgr = 0 and '+
//   'ft.chassiv = vn.chassiv and ft.n_comando = vn.n_comando and vn.versaov = vv.codigo and vn.cod_empresa = vv.cod_empresa '+
//   'and ft.cod_empresa = vn.cod_empresa and ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa and '+
//   'ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa and cl.codigo_tipo = tpf.codigo_tipo and '+
//   'ft.data_ven >= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+
//   ''' and ft.data_ven <= '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''' and (select count(*) from formpagamento fr '+
//   'where fr.nrequisicao = ft.n_comando and fr.cod_empresa = ft.cod_empresa and fr.tpdocs = ''MOT'' and '+
//   '(coalesce(fr.prcss,'''') <> '''' or fr.data_mov > '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+''')) = 0 and ft.cod_empresa = '+
//   'emp.cod_empresa and ft.ativo = 1 and ft.cod_empresa in ('+vCodEmpresasDRE+') group by empresa,grupo_prod,tipo,'+
//   'mes,ano,dia,descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,data_ven,operador_cxl,nvenda,'+
//   'sexo,tipo_os,cl.clqtdcompra,cl.clsomacompra,clultimacompra,cl.clatrasocompra,cl.clqtdveiculo,'+
//   'cl.clsomaveiculo,cl.clultimoveiculo,cl.cllucroveiculo,nitem,venda,cidade,tpf.descricao_tipo,tipo_cliente';
   registraErro(datasetBI.SQL.Text);
   datasetBI.OPEN;
   vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
   vFerCube.BuildDimensionMap;
   vFerCube.DefineFieldAsDimension('grupo_prod','GRUPO PRODUTO',dgpage);
   vFerCube.DefineFieldAsDimension('VENDA','VENDA?',dgrow);
   vFerCube.DefineFieldAsDimension('TIPO','TIPO DE SAIDA',dgrow);
   vFerCube.DefineFieldAsDimension('ANO','ANO MOVIMENTO',dgcol);
   vFerCube.DefineFieldAsDimension('MES','MES MOVIMENTO',dgcol);
   vFerCube.DefineFieldAsDimension('DESCRICAO_PROD','DESCRICAO DO PRODUTO',dgpage);
   vFerCube.DefineFieldAsDimension('EMPRESA','EMPRESA',dgpage);
   vFerCube.DefineFieldAsDimension('NOME_VENDEDOR','VENDEDOR',dgPage);
   vFerCube.DefineFieldAsDimension('TIPOVENDA','NATUREZA DA SAIDA',dgPage);
   vFerCube.DefineFieldAsDimension('SUB_GRUPO','SUBGRUPO PRODUTO',dgPage);
   vFerCube.DefineFieldAsDimension('NOME_CLIENTE','CLIENTE',dgPage);
   vFerCube.DefineFieldAsDimension('DIA','DIA MOVIMENTO',dgPage);
   vFerCube.DefineFieldAsDimension('NVENDA','N.DOC.SAIDA',dgPage);
   vFerCube.DefineFieldAsDimension('TIPO_OS','TIPO VENDA O.S.',dgPage);
   vFerCube.DefineFieldAsSummary('QTDE_ITENS');
   vFerCube.DefineFieldAsSummary('LIQUIDO');
   Result:=true;
  end;


  if (strtoint(vcodbal) >= 11) and (strtoint(vcodbal) <= 16) then
  begin
   datasetBI.Close;
   datasetBI.SQL.text:='SELECT emp.identificacao_emp as nome_emp,col.nome_vendedor,eq.ind_deprec,'+
   'coalesce(dp.nome_depto, ''SEM DEPARTAMENTO'') nome_depto,' +
   'coalesce(eq.modelo, ''SEM MODELO'') modelo, ' +
   'eq.nom_equip,eq.tipequip,SUM(VLR_EQUI) AS SOMA,'+
   'sum((select sum(depr.valor_depreci) from depreciacao depr ' +
   'where depr.cod_equip = eq.cod_equip and depr.cod_empresa = eq.cod_empresa)) as depacumulada ' +
   'FROM EQUIPAMENTO eq '+
   'inner join colaborador col on eq.cod_prop = col.cod_vendedor and eq.cod_empresa = col.cod_empresa ' +
   'inner join empresa emp on eq.cod_empresa = emp.cod_empresa ' +
   'left join depto dp on eq.cod_depart = dp.cod_depto ' +
   'WHERE eq.TIP_EQUIP = ''I'' AND eq.CODSEQ_BALANCO <> 0 '+
   'and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else eq.cod_empresa end) ' +
   'IN ('+vCodEmpresasDRE+') AND eq.ATIVO = 1 '+
   'group by nome_emp,col.nome_vendedor,eq.ind_deprec,dp.nome_depto,'+
   'eq.modelo,eq.nom_equip,eq.tipequip ';
   datasetBI.Open;
   vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
   vFerCube.BuildDimensionMap;
   vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
   vFerCube.DefineFieldAsDimension('NOME_DEPTO','Nome Dpto',dgrow);
   vFerCube.DefineFieldAsDimension('MODELO','Modelo',dgrow);
   vFerCube.DefineFieldAsDimension('tipequip','Nome do Devedor',dgrow);
   vFerCube.DefineFieldAsDimension('nome_vendedor','Colaborador',dgrow);
   vFerCube.DefineFieldAsDimension('nom_equip','Nome do Imobilizado',dgpage);
   vFerCube.DefineFieldAsDimension('ind_deprec','Índices Deprec',dgpage);
   vFerCube.DefineFieldAsSummary('soma');
   vFerCube.DefineFieldAsSummary('depacumulada');
   Result:=true;
  end;
  if (vcodbal = '17') then
  begin
     datasetBI.close;
     datasetBI.SQL.text:='SELECT emp.identificacao_emp as nome_emp,col.nome_vendedor,eq.ind_deprec,'+
     'coalesce(dpt.nome_depto, ''SEM DEPARTAMENTO'') nome_depto,' +
     'coalesce(eq.modelo, ''SEM MODELO'') modelo, ' +
     'eq.nom_equip,eq.tipequip,dp.mes,dp.ano,SUM(DP.VALOR_DEPRECI) '+
     'as soma FROM EQUIPAMENTO EQ '+
     'inner join DEPRECIACAO DP on EQ.COD_EQUIP =DP.COD_EQUIP AND EQ.COD_EMPRESA = DP.COD_EMPRESA ' +
     'inner join colaborador col on eq.cod_prop = col.cod_vendedor and eq.cod_empresa = col.cod_empresa ' +
     'inner join empresa emp on eq.cod_empresa = emp.cod_empresa ' +
     'left join depto dpt on eq.cod_depart = dpt.cod_depto '+
     'WHERE eq.TIP_EQUIP = ''I'' AND eq.CODSEQ_BALANCO <> 0 ' +
     'AND (CASE WHEN(EMP.FINANCEIRO_UNIFICADO = ''S'') THEN EMP.CODIGO_UNIFICADORA ELSE EQ.COD_EMPRESA END) ' +
     'IN ('+vCodEmpresasDRE+') ' +
     'AND EQ.DAT_CAD_EQUI <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
     'AND DP.DATA_DEPRECI <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
     'AND EQ.ATIVO = 1 '+
     'group by nome_emp,col.nome_vendedor,eq.ind_deprec,dpt.nome_depto,'+
     'eq.modelo,eq.nom_equip,eq.tipequip,dp.mes,dp.ano ';
     datasetBI.Open;
     vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
     vFerCube.BuildDimensionMap;
     vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
     vFerCube.DefineFieldAsDimension('ano','Ano Deprec',dgcol);
     vFerCube.DefineFieldAsDimension('mes','Mes Deprec',dgcol);
     vFerCube.DefineFieldAsDimension('NOME_DEPTO','Nome Dpto',dgrow);
     vFerCube.DefineFieldAsDimension('MODELO','Modelo',dgrow);
     vFerCube.DefineFieldAsDimension('tipequip','Nome do Devedor',dgrow);
     vFerCube.DefineFieldAsDimension('nome_vendedor','Colaborador',dgrow);
     vFerCube.DefineFieldAsDimension('nom_equip','Nome do Imobilizado',dgpage);
     vFerCube.DefineFieldAsDimension('ind_deprec','Índices Deprec',dgpage);
     vFerCube.DefineFieldAsSummary('soma');
     Result:=true;
  end;
  dataSet.First;
  dataSet.Locate('CODSEQ_BALANCO',vcodbal,[loCaseInsensitive]);
  if dataSet.FieldByName('TIPO_BALANCO').AsString = 'ATIVO' then
  begin
    if pos(trim(vDadosIni.StrZero(StrToInt(vcodbal),2)),'01,02,03,07,08,11,12,13,14,15,16,17,35,37,38') <= 0 then
    begin
      datasetBI.Close;
      datasetBI.SQL.text:='select emp.identificacao_emp as nome_emp,jur.nome,ctrlj.nome_ctrl,jur.historico,'+
      ' extract(year from data_venc) as ano,extract(month from data_venc) as mes,'+
      ' extract(day from data_venc) as dia,jur.n_doc,SUM(VALOR+(case when jur.tpdoc = ''CRED'' then '+
      ' coalesce((select sum(valor_quitado) from baixa_creditos bx ' +
      ' where bx.cod_cred = jur.codseq and bx.codigo_emp = jur.codigo_emp and bx.tp_operacao = ''P'' ' +
      ' and bx.datq_c > '''+FormatDateTime('mm/dd/yyyy',vdtGeral)+ '''),0) else 0 end)) AS VALOR from cred_jur jur,empresa emp,controles ctrlj ' +
      ' where jur.controle = ctrlj.codigo_ctrl and jur.codigo_emp = ctrlj.codigo_emp and jur.cod_emp_mult = emp.cod_empresa and ';
      if dataset.FieldByName('PRAZOINICIAL').AsInteger > 90 then
       datasetBI.SQL.text:=datasetBI.SQL.text+
       ' jur.data_venc >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
       ' AND jur.data_venc <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+ ''' ' +
       ' AND jur.CONTROLE IN ' +
       '		(SELECT CTRL.CODIGO_CTRL FROM CONTROLES CTRL,controles_balanco BAL ' +
       ' 		WHERE CTRL.codigo_ctrl = BAL.codigo_ctrl AND BAL.codseq_balanco = '+vcodbal+
       ' 		AND CTRL.CODIGO_EMP IN ('+vCodEmpresasDRE+') order by ctrl.codigo_ctrl) '+
       ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else jur.CODIGO_EMP end) ' +
//       ' AND jur.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
       ' IN ('+vCodEmpresasDRE+') ' +
       ' AND jur.DATA_REC <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
       ' AND (jur.DATA_QUITACAO > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' OR jur.DATA_QUITACAO IS NULL) '+
       ' group by nome_emp,jur.nome,ctrlj.nome_ctrl,jur.historico,ano,mes,dia,jur.n_doc'
      else
      begin
       datasetBI.Close;
       datasetBI.SQL.text:=datasetBI.SQL.text+
       ' ((jur.data_quitacao is null ' +
       ' and jur.data_venc < '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+''' ' +
       ' and jur.CONTROLE IN '+
       ' (SELECT CTRL.CODIGO_CTRL FROM CONTROLES CTRL,controles_balanco BAL ' +
       ' WHERE CTRL.codigo_ctrl = BAL.codigo_ctrl ' +
       ' AND BAL.codseq_balanco = '+vcodbal+
       ' AND CTRL.CODIGO_EMP IN ('+vCodEmpresasDRE+') order by ctrl.codigo_ctrl) '+
       ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else jur.CODIGO_EMP end) ' +
//       ' AND jur.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
       ' IN ('+vCodEmpresasDRE+')) ' +
       ' or (jur.data_venc >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+''' ' +
       ' AND jur.data_venc <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+''' ' +
       ' AND jur.CONTROLE IN ' +
       '		(SELECT CTRL.CODIGO_CTRL FROM CONTROLES CTRL,controles_balanco BAL ' +
       '		WHERE CTRL.codigo_ctrl = BAL.codigo_ctrl AND BAL.codseq_balanco = '+vcodbal+
       ' 		AND CTRL.CODIGO_EMP IN ('+vCodEmpresasDRE+') order by ctrl.codigo_ctrl) '+
       ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else jur.CODIGO_EMP end) ' +
//       ' AND jur.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
       ' IN ('+vCodEmpresasDRE+') ' +
       ' AND jur.DATA_REC <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
       ' AND (jur.DATA_QUITACAO > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' OR jur.DATA_QUITACAO IS NULL))) '+
       ' group by nome_emp,jur.nome,ctrlj.nome_ctrl,jur.historico,ano,mes,dia,jur.n_doc';
      end;
      datasetBI.Open;
      vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
      vFerCube.BuildDimensionMap;
      vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
      vFerCube.DefineFieldAsDimension('ano','Ano Venc Cred/Cheq',dgcol);
      vFerCube.DefineFieldAsDimension('mes','Mes Venc Cred/Cheq',dgcol);
      vFerCube.DefineFieldAsDimension('nome_ctrl','Nome Controle',dgrow);
      vFerCube.DefineFieldAsDimension('historico','Histórico',dgpage);
      vFerCube.DefineFieldAsDimension('dia','Dia Vencimento',dgpage);
      vFerCube.DefineFieldAsDimension('nome','Nome Devedor',dgpage);
      vFerCube.DefineFieldAsDimension('n_doc','Num Doc',dgpage);
      vFerCube.DefineFieldAsSummary('valor');
      Result:=true;
    end;
  end
  else
  begin
     if pos(trim(vDadosIni.StrZero(StrToInt(vcodbal),2)),'01,02,03,07,08,11,12,13,14,15,16,17,35,36,37,38') <= 0 then
     begin
        datasetBI.Close;
        datasetBI.sql.text:='select ''CTP'' as tipolanc,emp.identificacao_emp as nome_emp,cp.nome_for_ctp,pc.desc_padr,cp.historico_ctp,'+
         ' extract(year from cp.data_venc_ctp) as ano,extract(month from cp.data_venc_ctp) as mes,'+
         ' extract(day from cp.data_venc_ctp) as dia,cp.n_doc_ctp,SUM(cp.VALOR_CTP) AS VALOR from '+
         ' contas_a_pagar cp ' +
         ' inner join empresa emp on cp.cod_emp_mult = emp.cod_empresa ' +
         ' inner join p_contas pc on cp.n_conta_plc = pc.n_conta_plc ' +
         ' where cp.n_conta_plc in ' +
         ' (SELECT pb.N_CONTA_PLC FROM P_CONTAS_BALANCO pb WHERE pb.codseq_balanco = '+vcodbal+
         ' AND pb.COD_EMPRESA IN ('+vCodEmpresasDRE+') and ';
       if dataset.FieldByName('PRAZOINICIAL').AsInteger > 90 then
        datasetBI.SQL.Text:=datasetBI.SQL.text+
        ' cp.data_venc_ctp >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+''' ' +
        ' AND cp.data_venc_ctp <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+''' ' +
        ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.codigo_emp end) ' +
//        ' AND cp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
        ' IN ('+vCodEmpresasDRE+') ' +
        ' AND cp.DATA_ENT_CTP <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
        ' AND (cp.DATQ_CTP > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' OR cp.DATQ_CTP IS NULL) '+
        ' order by n_conta_plc) group by tipolanc,nome_emp,nome_for_ctp,desc_padr,historico_ctp,ano,mes,dia,n_doc_ctp '
        else
         datasetBI.SQL.Text:=datasetBI.SQL.text+
         '((cp.datq_ctp is null ' +
         ' and cp.data_venc_ctp < '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+ ''' ' +
         ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.codigo_emp end) ' +
//         ' AND cp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
         ' IN ('+vCodEmpresasDRE+')) or '+
         '(cp.data_venc_ctp >= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+''' ' +
         ' AND cp.data_venc_ctp <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+''' ' +
         ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.codigo_emp end) ' +
//         ' AND cp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
         ' IN ('+vCodEmpresasDRE+') ' +
         ' AND cp.DATA_ENT_CTP <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
         ' AND (cp.DATQ_CTP > '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' OR cp.DATQ_CTP IS NULL))) '+
         ' order by n_conta_plc) group by tipolanc,nome_emp,nome_for_ctp,desc_padr,historico_ctp,ano,mes,dia,n_doc_ctp ';

        datasetBI.SQL.text:=datasetBI.SQL.Text+ ' union '+
         ' select ''LNC'' as tipolanc,emp.identificacao_emp as nome_emp,cp.nominal_l as nome_for_ctp,pc.desc_padr,cp.historico_l,'+
         ' extract(year from cp.data) as ano,extract(month from cp.data) as mes,'+
         ' extract(day from cp.data) as dia,cp.ndoc_l,SUM(cp.VALOR_L) AS VALOR from '+
         ' lancamentos cp ' +
         ' inner join empresa emp on cp.cod_emp_mult = emp.cod_empresa ' +
         ' inner join p_contas pc on cp.n_conta_plc = pc.n_conta_plc ' +
         ' where cp.data >= '''+ FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOINICIAL').AsInteger))+''' ' +
         ' AND cp.data <= '''+FormatDateTime('mm/dd/yyyy',(vdtGeral+dataset.FieldByName('PRAZOFINAL').AsInteger))+''' ' +
         ' AND (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.codigo_emp end) ' +
//         ' AND cp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
         ' IN ('+vCodEmpresasDRE+') ' +
         ' and cp.n_conta_plc in ' +
         ' (SELECT pb.N_CONTA_PLC FROM P_CONTAS_BALANCO pb ' +
         ' WHERE pb.codseq_balanco = '+vcodbal+
         ' AND pb.COD_EMPRESA IN ('+vCodEmpresasDRE+') order by n_conta_plc) ' +
         ' and cp.lote is null group by tipolanc,nome_emp,nome_for_ctp,desc_padr,historico_l,ano,mes,dia,ndoc_l';

        datasetBI.Open;
        vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
        vFerCube.BuildDimensionMap;
        vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
        vFerCube.DefineFieldAsDimension('ano','Ano Venc Cred/Cheq',dgcol);
        vFerCube.DefineFieldAsDimension('mes','Mes Venc Cred/Cheq',dgcol);
        vFerCube.DefineFieldAsDimension('tipolanc','Tipo Lançamento',dgrow);
        vFerCube.DefineFieldAsDimension('desc_padr','Desc.Padrão Conta',dgrow);
        vFerCube.DefineFieldAsDimension('historico_ctp','Histórico',dgpage);
        vFerCube.DefineFieldAsDimension('dia','Dia Vencimento',dgpage);
        vFerCube.DefineFieldAsDimension('nome_for_ctp','Nome Credor',dgpage);
        vFerCube.DefineFieldAsDimension('n_doc_ctp','N.Doc Credor',dgpage);
        vFerCube.DefineFieldAsSummary('valor');
        Result:=true;
     end;
  end;
end;

function TBalancoHw.GravaBalanco(vStAtCirc, vStRealLP, vStPerm, vStPasCirc,
  vStPasExLP: TStringgrid; VobjEmp: TEmpresas;vpatliq: real): boolean;
var
 i: integer;
begin
 Result:=true;
 if not confgravBal(vStAtCirc,vCodEmpresasDRE) then
 begin
   Result:=false;
   Exit;
 end;
 if not confgravBal(vStRealLP,vCodEmpresasDRE) then
 begin
   Result:=false;
   Exit;
 end;
 if not confgravBal(vStPerm,vCodEmpresasDRE) then
 begin
   Result:=false;
   Exit;
 end;
 if not confgravBal(vStPasCirc,vCodEmpresasDRE) then
 begin
   Result:=false;
   Exit;
 end;
 if not confgravBal(vStPasExLP,vCodEmpresasDRE) then
 begin
   Result:=false;
   Exit;
 end;
 try
  vDadosIni.progressoFuncao('Gravando dados Balanco','Status da Gravação','Gravando Patrimônio Líquido Apurado');
  IniciaTransacao;
  vApBalanco.Close;
  vApBalanco.CommandText:='select * from apuracao_balanco where mes = '+inttostr(vmesinf)+' and ano = '+IntToStr(vanoinf)+' and cod_empresa in ('+
  vCodEmpresasDRE+') and cod_seqbalanco = 34';
  vApBalanco.Open;
  if vApBalanco.IsEmpty then
    vApBalanco.Append
  else
    vApBalanco.Edit;
   vApBalanco.FieldByName('COD_SEQBALANCO').AsString:='34';
   vApBalanco.FieldByName('MES').AsInteger:=vmesinf;
   vApBalanco.FieldByName('ANO').AsInteger:=vanoinf;
   vApBalanco.FieldByName('COD_EMPRESA').AsString:=vCodEmpresasDRE;
   vApBalanco.FieldByName('VALOR').AsCurrency:=vpatliq;
   vApBalanco.Post;
   vApBalanco.ApplyUpdates(-1);
   CommitaTransacao;
 except
    on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(Pchar('GEST002 '+e.Message), 'Confirmação', MB_OK);
      registraErro('GEST002 ' + e.Message);
      Result := False;
    end;
 end;
 vDadosIni.finalizaProgresso;
 Application.MessageBox('Gravação realizada com sucesso!!!', 'Confirmação', MB_OK);
end;

function TBalancoHw.montarBalanco(vStAtCirc, vStRealLP, vStPerm, vStPasCirc,
  vStPasExLP: TStringgrid;vcodemsel: array of string): boolean;
begin
result:=true;
if (vmesinf = 0) or (vano = 0) then
begin
 Application.MessageBox('Mês ou Ano não informado(s)', 'Confirmação', MB_OK);
 result:=false;
 exit;
end;
if (vmesinf > 12) or (vmesinf < 0) or (vano < 2007)  then
begin
 Application.MessageBox('Mês ou Ano Inválido(s)', 'Confirmação', MB_OK);
 result:=false;
 exit;
end;
//cadDreHw.vCodEmpresasDRE:=vCodEmpresasDRE;
vDadosIni.progressoFuncao('Status da Geração Balanço','Processo Gerando Balanço','Verificando Configurações da Empresa');
buscas.Close;
buscas.SQL.Text:=' select * from empresa ' +
	' where cod_empresa in ('+vCodEmpresasDRE+')';
buscas.Open;
vtr:=buscas.FieldByName('TP_SUG').AsInteger+
buscas.FieldByName('TE_SUG').AsInteger+buscas.FieldByName('TA_SUG').AsInteger+
buscas.FieldByName('FP_SUG').AsInteger;
if buscas.FieldByName('EST_SEGURACAPROD').AsInteger <> 0 then
vtr:=vtr+(vtr*(buscas.FieldByName('EST_SEGURACAPROD').AsInteger/100));
vdiasTrab:=buscas.FieldByName('DIAS_TRABALHO_MES').AsInteger;
vmesessug:=buscas.FieldByName('QTMESSUG').AsInteger;
buscas.Close;
montarData;
CadEstoque.vempresas:=vCodEmpresasDRE;
vDadosIni.progressoFuncao('Status da Geração Balanço','Processo Gerando Balanço','Verificando Ativo Circulante');
ColocadadosGrid(vStAtCirc);
vDadosIni.progressoFuncao('Status da Geração Balanço','Processo Gerando Balanço','Verificando Ativo Realizável LP');
ColocadadosGrid(vStRealLP);
vDadosIni.progressoFuncao('Status da Geração Balanço','Processo Gerando Balanço','Verificando Ativo Permanente');
ColocadadosGrid(vStPerm);
vDadosIni.progressoFuncao('Status da Geração Balanço','Processo Gerando Balanço','Verificando Passivo Circulante');
ColocadadosGrid(vStPasCirc);
vDadosIni.progressoFuncao('Status da Geração Balanço','Processo Gerando Balanço','Verificando Passivo Exigível a LP');
ColocadadosGrid(vStPasExLP);
vDadosIni.finalizaProgresso;
end;

function TBalancoHw.montarData: boolean;
begin
vdat1:=StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
vdat2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
end;

function TBalancoHw.procuraitemvetor(vvetor: array of string;
  vdado: string): boolean;
var
 i: integer;
begin
  Result:=false;
  for I := 0 to length(vvetor) do
  begin
    if vvetor[i] = vdado then
    begin
      result:=true;
      break;
    end;
  end;
end;

function TBalancoHw.somaGrids(vStAtCirc, vStRealLP, vStPerm, vStPasCirc,
  vStPasExLP: TStringgrid;VobjEmp:TEmpresas): boolean;
var
 i,x: integer;
begin
  vpatLiq:=0;
  vdifPatlIqM:=0;
  vdifPatliqA:=0;
  Vvatcirc:=0;
  vvastrealp:=0;
  vvstperm:=0;
  vvstpascirc:=0;
  vvstpasexlp:=0;
  for i:=1 to vStAtCirc.RowCount-1 do
  begin
   if vStAtCirc.Cells[3,i] = '+' then
    Vvatcirc:=Vvatcirc+strtofloat(vDadosIni.tirapontos(vStAtCirc.Cells[1,i],14))
   else
    Vvatcirc:=Vvatcirc-strtofloat(vDadosIni.tirapontos(vStAtCirc.Cells[1,i],14));
  end;
  for i:=1 to vStRealLP.RowCount-1 do
  begin
   if vStRealLP.Cells[3,i] = '+' then
    vvastrealp:=vvastrealp+strtofloat(vDadosIni.tirapontos(vStRealLP.Cells[1,i],14))
   else
    vvastrealp:=vvastrealp-strtofloat(vDadosIni.tirapontos(vStRealLP.Cells[1,i],14));
  end;
  for i:=1 to vStPerm.RowCount-1 do
  begin
   if vStPerm.Cells[3,i] = '+' then
    vvstperm:=vvstperm+strtofloat(vDadosIni.tirapontos(vStPerm.Cells[1,i],14))
   else
    vvstperm:=vvstperm-strtofloat(vDadosIni.tirapontos(vStPerm.Cells[1,i],14))
  end;
  for i:=1 to vStPasCirc.RowCount-1 do
  begin
   if vStPasCirc.Cells[3,i] = '+' then
    vvstpascirc:=vvstpascirc+strtofloat(vDadosIni.tirapontos(vStPasCirc.Cells[1,i],14))
   else
    vvstpascirc:=vvstpascirc-strtofloat(vDadosIni.tirapontos(vStPasCirc.Cells[1,i],14))
  end;
  for i:=1 to vStPasExLP.RowCount-1 do
  begin
   if vStPasExLP.Cells[3,i] = '+' then
    vvstpasexlp:=vvstpasexlp+strtofloat(vDadosIni.tirapontos(vStPasExLP.Cells[1,i],14))
   else
    vvstpasexlp:=vvstpasexlp-strtofloat(vDadosIni.tirapontos(vStPasExLP.Cells[1,i],14))
  end;
  vpatLiq:=(Vvatcirc+vvastrealp+vvstperm)-(vvstpascirc+vvstpasexlp);
  vtativo:=(Vvatcirc+vvastrealp+vvstperm);
  vtpassivo:=(vvstpascirc+vvstpasexlp);
  buscas.Close;
//  if length(VobjEmp.vCodEmpresas) = 1 then
//  begin
  if vmesinf <> 1 then
  begin
   buscas.SQL.text:='select sum(valor) as valor from APURACAO_BALANCO where mes = '+
   inttostr(vmesinf-1)+' and ano = '+IntToStr(vanoinf)+' and cod_empresa in ('+
   vCodEmpresasDRE+') and ativo = 1 and COD_SEQBALANCO = 34';
   buscas.Open;
   if buscas.FieldByName('VALOR').AsCurrency <> 0 then
    vdifPatlIqM:=vpatLiq-buscas.FieldByName('VALOR').AsCurrency;
  end
  else
  begin
   buscas.SQL.text:='select sum(valor) as valor from APURACAO_BALANCO where mes = '+
   inttostr(12)+' and ano = '+IntToStr(vanoinf-1)+' and cod_empresa in ('+
   vCodEmpresasDRE+') and ativo = 1 and COD_SEQBALANCO = 34';
   buscas.Open;
   if buscas.FieldByName('VALOR').AsCurrency <> 0 then
    vdifPatlIqM:=vpatLiq-buscas.FieldByName('VALOR').AsCurrency;
  end;
  buscas.Close;
  buscas.SQL.text:='select sum(valor) as valor from APURACAO_BALANCO where mes = '+
  inttostr(vmesinf)+' and ano = '+IntToStr(vanoinf-1)+' and cod_empresa in ('+
  vCodEmpresasDRE+') and ativo = 1 and COD_SEQBALANCO = 34';
  buscas.Open;
  if buscas.FieldByName('VALOR').AsCurrency <> 0 then
   vdifPatliqA:=vpatLiq-buscas.FieldByName('VALOR').AsCurrency;
//  end;
end;

function TBalancoHw.ultapura: boolean;
begin
  buscas.close;
  buscas.sql.text:='select first 1 ano,mes from apuracao_balanco '+
  'where cod_empresa in ('+
    vCodEmpresasDRE+') order by ano desc,mes desc,cod_empresa,cod_seqbalanco';
  buscas.open;
  vultApura:=vDadosIni.StrZero(buscas.FieldByName('MES').AsInteger,2)+'/'+
  vDadosIni.StrZero(buscas.FieldByName('ANO').AsInteger,4);  
end;

function TBalancoHw.verificarsaldobanco(vcodbal: string): boolean;
var
 vdtGeral: Tdate;
begin
  vdtGeral:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
  buscas.Close;
  buscas.sql.text:='SELECT CTRL.NOME_CTRL AS CONTROLE,CTRL.CODIGO_CTRL AS CODIGO_CONTROLE, '+
  ' (SELECT FIRST 1 SAL.VAL_SLD FROM SAL_CTRL SAL ' +
  '	WHERE SAL.CODIGO_CTRL = CTRL.CODIGO_CTRL ' +
  ' AND SAL.COD_EMP = CTRL.codigo_emp ' +
  ' and sal.data_sld <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+ ''' ' +
  ' ORDER BY DATA_SLD DESC) as SALDO,'+
  ' (SELECT FIRST 1 SAL.VL_CRD_SLD FROM SAL_CTRL SAL WHERE SAL.CODIGO_CTRL = '+
  ' CTRL.CODIGO_CTRL AND SAL.COD_EMP = CTRL.CODIGO_EMP ' +
  ' AND SAL.DATA_SLD <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+''' ' +
  ' ORDER BY DATA_SLD DESC) as SOMASALDO,'+
  ' (SELECT FIRST 1 SAL.SALDO_BANCO FROM SAL_CTRL SAL WHERE SAL.CODIGO_CTRL = '+
  ' CTRL.CODIGO_CTRL AND SAL.COD_EMP = CTRL.CODIGO_EMP ' +
  ' AND SAL.DATA_SLD <= '''+ FormatDateTime('mm/dd/yyyy',vdtGeral)+'''  ' +
  ' ORDER BY DATA_SLD DESC) as SALDOBANCO '+
  ' FROM CONTROLES CTRL,controles_balanco BAL ' +
  ' WHERE CTRL.codigo_ctrl = BAL.codigo_ctrl '+
  ' and ctrl.codigo_emp = bal.cod_empresa ' +
  ' AND BAL.codseq_balanco = '+vcodbal+
  ' AND CTRL.CODIGO_EMP IN ('+vCodEmpresasDRE+') ' +
  ' and ctrl.ativo = 1 order by ctrl.codigo_ctrl ';
  buscas.Open;
  TFloatField(buscas.FieldByName('saldo')).DisplayFormat:='#,##0.00';
  TFloatField(buscas.FieldByName('somasaldo')).DisplayFormat:='#,##0.00';
  TFloatField(buscas.FieldByName('saldobanco')).DisplayFormat:='#,##0.00';
  buscas.FetchAll;
  result:=true;
end;

function TBalancoHw.VerIndices(vgriddep: TdbGrid;vcodemsel: array of string): boolean;
var
 vdesembolso,vvalvendaav: currency;
 vval: currency;
 vprmedio: currency;
 vstgridDRE,vstgvenda: TStringGrid;
 vgcx: real;
 i,x,j: integer;
  vPMRControle: array of array of Double;
begin
  vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando possibilidade de gerar Índices');
  if length(vcodemsel) = 1 then
  begin
    buscas.close;
    buscas.sql.text:=  ' select * from INDICES_BALANCO ' +
    	' where mes = '+inttostr(vmesinf)+
      ' and ano = '+IntToStr(vanoinf)+
      ' and cod_empresa in ('+ vCodEmpresasDRE+') ';
    buscas.Open;
    if not buscas.IsEmpty then
    begin
    vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando Índice da base de dados');
     vIndicesBal.Close;
     vIndicesBal.CommandText := 'SELECT * FROM INDICES_BALANCO ' +
     		' WHERE ((MES >=01 AND MES <= '+inttostr(vmesinf)+
        ' AND ANO = '+IntToStr(vanoinf)+') ' +
        ' OR (MES >= 01 AND MES <= '+inttostr(vmesinf)+') ' +
        ' AND ANO = '+IntToStr(vanoinf-1)+') ' +
        ' and cod_empresa in ('+vCodEmpresasDRE+') ' +
        ' order by ano,mes,seq_indice,cod_empresa ';
     vIndicesBal.Open;
    end
    else
    begin
     montarData;
     // Vendas a Vista
     cadDreHw:=TDREHw.create;
     buscas.Close;
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando Vendas a Vista');
     buscas.SQL.text:= 'select sum(fp.valordoc) as valor from formpagamento fp ' +
      ' inner join empresa emp on fp.cod_empresa = emp.cod_empresa ' +
     	' where fp.data_mov >= '''+ FormatDateTime('mm/dd/yyyy',vdat1)+''' ' +
      ' and fp.data_mov <= '''+ FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
      ' and (fp.tipdoc = ''N'' or (fp.data_venc-fp.data_mov) <= 5) ' +
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else fp.cod_empresa end) ' +
      ' in ('+vCodEmpresasDRE+')' +
      ' and fp.TPDOCS <> ''PRE''';
     buscas.Open;
     vvalvendaav:=buscas.FieldByName('valor').AsCurrency;
     // Vendas a Prazo e ponderação para achar os dias do prazo médio de venda
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando Vendas a Prazo');
     buscas.Close;
     if vDadosIni.vEmp.vmetodopmv <> 'CREDITOS' then
     begin
      buscas.SQL.text:='select sum(fp.valordoc) as valorvenda,' +
     	  ' sum((fp.data_venc-fp.data_mov)*fp.valordoc) as mult from formpagamento fp ' +
      	' inner join empresa emp on fp.cod_empresa = emp.cod_empresa ' +
     	  ' where fp.data_mov >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
        ' and fp.data_mov <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+ ''' ' +
        ' and (fp.tipdoc <> ''N'' and (fp.data_venc-fp.data_mov) > 5) ' +
        ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else fp.cod_empresa end) ' +
			  ' in ('+vCodEmpresasDRE+')' +
        ' and fp.TPDOCS <> ''PRE''';
     end
     else
     begin
      buscas.SQL.text:='select sum(cred.valor) as valorvenda,sum((cred.data_venc-cred.data_rec)*cred.valor) as mult from cred_jur cred ' +
        ' inner join empresa emp on cred.codigo_emp = emp.cod_empresa ' +
        ' inner join controles ctrl on cred.controle = ctrl.codigo_ctrl and cred.codigo_emp = ctrl.codigo_emp '+
        ' where cred.data_rec >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''' ' +
        ' and cred.data_rec <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
        ' and (cred.data_venc-cred.data_rec) > 5 and coalesce(ctrl.entra_pmv,'''') <> ''N'' ' +
        ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cred.codigo_emp end) ' +
        ' in ('+vCodEmpresasDRE+')';
     end;
     buscas.Open;
     // Vendas gerais (a vista +prazo)
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando PMV');
     vval:=vvalvendaav+buscas.FieldByName('valorvenda').AsCurrency;
     if vval <> 0 then
     begin
       vIndicadoresBal[0,1]:=vDadosIni.alndir(Format('%n',
       [buscas.FieldByName('mult').AsCurrency/(vval)]), 6);
       vprmedio:=buscas.FieldByName('mult').AsCurrency/(vval);
     end
     else
     begin
      vIndicadoresBal[0,1]:=vDadosIni.alndir(Format('%n',
      [0.00]), 6);
      vprmedio:=0;
     end;
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando Média de atrasos no pagamento AMR');
     // Caso a empresa não use o formpagamento para registrar pagamento de vendas
     buscas.Close;
     buscas.SQL.text:= ' select sum(vnd.valor_venda) as valorvenda from vendas_gerais vnd ' +
       ' inner join empresa emp on vnd.cod_empresa = emp.cod_empresa ' +
       ' where vnd.data_venda >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''' ' +
       ' and vnd.data_venda <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
       ' and vnd.venda = ''S'' ' +
			 ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else vnd.cod_empresa end) ' +
       ' in ('+vCodEmpresasDRE+')';
//     buscas.SQL.text:='select sum(valor_total) as valorvenda from '+
//     'pedvenda where data_fech >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+
//     ''' and data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
//     ''' and status_ped = ''FECHADA'' and ((tipo = ''OS'' and (tipo_os in '+vDadosIni.vTipoVendaOS+
//     ')) or (tipo = ''REQ'' and tipv in '+vDadosIni.vTipoVendaREQ+')) and cod_empresa in ('+vCodEmpresasDRE+')';
     buscas.Open;
     if buscas.FieldByName('valorvenda').AsCurrency > vval then
      vval:=buscas.FieldByName('valorvenda').AsCurrency;
     //
     buscas.close;
     buscas.SQL.text:='select sum(cr.valor_c) as valoratraso, ' +
      ' (sum((cr.datq_c-cr.data_venc_c))/count(*)) as mediadias,'+
      ' (sum((cr.datq_c-cr.data_venc_c))/count(*))*sum(cr.valor_c) as ponderacao from controle_creditos cr ' +
      ' inner join empresa emp on cr.codigo_emp = emp.cod_empresa ' +
      ' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp ' +
      ' where ctrl.compsaldo = ''S'' '+
      ' and cr.datq_c >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
      ' and cr.datq_c <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
      ' and (cr.datq_c-cr.data_venc_c) > 1 ' +
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
      ' in ('+vCodEmpresasDRE+')';
     buscas.open;

     if vval <> 0 then
     begin
      vIndicadoresBal[1,1]:=vDadosIni.alndir(Format('%n',
      [buscas.FieldByName('ponderacao').AsCurrency/(vval)]), 6);
      vprmedio:=vprmedio+(buscas.FieldByName('ponderacao').AsCurrency/(vval));
     end
     else
     begin
      vIndicadoresBal[1,1]:=vDadosIni.alndir(Format('%n',
      [0.00]), 6);
      vprmedio:=vprmedio+0;
     end;
     vIndicadoresBal[2,1]:=vDadosIni.alndir(Format('%n',[vprmedio]), 6);
     { Para nao atrasar o release ficou para o proximo, o prazo médio de recebimento
     ainda nao esta certo, mesmo usando a mesma regra geral não bateu, deu valores exorbitantes
     //Prazo medio por controle
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando PMV por controle');
     buscas.Close;
     buscas.SQL.Text := 'select codigo_ctrl from controles ctrl' +
       ' where codigo_emp in (' + vCodEmpresasDRE + ')' +
       ' and coalesce(ctrl.entra_pmv,'''') <> ''N''' +
       ' and ctrl.compsaldo = ''S''';
     buscas.Open;
     buscas.FetchAll;

     SetLength(vPMRControle, buscas.RecordCount);

     for J := 0 to Length(vPMRControle) - 1 do
     begin
       SetLength(vPMRControle[J], 2);
       vPMRControle[J, 0]:= 0;
       vPMRControle[J, 1]:= 0;
     end;
     J:= 0;
     buscas.First;
     while not buscas.Eof do
     begin
       vPMRControle[J, 0] := buscas.FieldByName('codigo_ctrl').AsInteger;
       J := J + 1;
       buscas.Next;
     end;

     for J := 0 to Length(vPMRControle) - 1 do
     begin
       buscas.Close;
       vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando Vendas a Vista ' + IntToStr(J + 1) + ' de ' + IntToStr(Length(vPMRControle)) );
       buscas.SQL.text:='select sum(valordoc) as valor from formpagamento where data_mov >= '''+
       FormatDateTime('mm/dd/yyyy',vdat1)+''' and data_mov <= '''+
       FormatDateTime('mm/dd/yyyy',vdat2)+''' and (tipdoc = ''N'' or (data_venc-data_mov) <= 5) and cod_empresa in ('+vCodEmpresasDRE+')' +
       ' and cod_controle = ' + IntToStr(Trunc(vPMRControle[J, 0]));
       buscas.Open;
       vvalvendaav:=buscas.FieldByName('valor').AsCurrency;

       buscas.Close;
       if vDadosIni.vEmp.vmetodopmv <> 'CREDITOS' then
         buscas.SQL.text:='select sum(valordoc) as valorvenda,sum((data_venc-data_mov)*valordoc) as mult from '+
           'formpagamento where data_mov >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+
           ''' and data_mov <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
           ''' and (tipdoc <> ''N'' and (data_venc-data_mov) >= 5) and cod_empresa in ('+vCodEmpresasDRE+')' +
           ' and cod_controle = ' + IntToStr(Trunc(vPMRControle[J, 0]))
       else
         buscas.SQL.text:='select sum(cred.valor) as valorvenda,sum((cred.data_venc-cred.data_rec)*cred.valor) as mult from cred_jur cred inner join '+
           'controles ctrl on cred.controle = ctrl.codigo_ctrl and cred.codigo_emp = ctrl.codigo_emp '+
           'where cred.data_rec >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''' and cred.data_rec <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' and '+
           '(cred.data_venc-cred.data_rec) >= 5 and coalesce(ctrl.entra_pmv,'''') <> ''N'' and cred.codigo_emp in ('+vCodEmpresasDRE+')'+
           ' and cred.codigo_ctrl = ' + IntToStr(Trunc(vPMRControle[J, 0]));
       buscas.Open;
       vval:=vvalvendaav+buscas.FieldByName('valorvenda').AsCurrency;
       if vval <> 0 then
         vprmedio:=buscas.FieldByName('mult').AsCurrency/(vval)
       else
         vprmedio:=0;

       buscas.close;
       buscas.SQL.text:='select sum(cr.valor_c) as valoratraso,(sum((cr.datq_c-cr.data_venc_c))/count(*)) as mediadias,'+
         '(sum((cr.datq_c-cr.data_venc_c))/count(*))*sum(cr.valor_c) as ponderacao from '+
         'controle_creditos cr,controles ctrl where cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp and ctrl.compsaldo = ''S'' '+
         'and cr.datq_c >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+
         ''' and cr.datq_c <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' and (cr.datq_c-cr.data_venc_c) > 1 and cr.codigo_emp in ('+vCodEmpresasDRE+')'+
         ' and cr.codigo_ctrl = ' + IntToStr(Trunc(vPMRControle[J, 0]));
       buscas.open;

       if vval <> 0 then
         vprmedio:=vprmedio+(buscas.FieldByName('ponderacao').AsCurrency/(vval))
       else
         vprmedio:=vprmedio+0;
       vPMRControle[J, 1] := vprmedio;
       registraErro(IntToStr(Trunc(vPMRControle[J, 0])) +' - '+FloatToStr(vPMRControle[J, 1]));
     end;  }

     // Cálculo de prazo médio ponderado para pagamento de fornecedor
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando Ponderação para PMPF');
     buscas.Close;
     buscas.sql.text:='select sum(ctp.valor_ctp) as valorpago, ' +
      ' sum((ctp.data_venc_ctp-ctp.data_ent_ctp)*ctp.valor_ctp) as ponderacao from contas_a_pagar ctp ' +
      ' inner join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
      ' where ctp.data_ent_ctp >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
      ' and ctp.data_ent_ctp <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+ ''' ' +
      ' and (not ctp.num_nota_nfe is null and ctp.num_nota_nfe <> 0) and (ctp.tipo_ctp = ''F'' ' +
      ' and (ctp.data_venc_ctp-data_ent_ctp) >= 5) ' +
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctp.codigo_emp end) ' +
      ' in ('+vCodEmpresasDRE+')';
     buscas.Open;
     vvalvendaav:=buscas.FieldByName('ponderacao').AsCurrency;
     vval:=0;
     if not vdesconsideraPMPF then
     begin
       vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Consultando Compras');
       buscas.Close;
       buscas.SQL.text:='select ''pc'' as tipo,sum(val_tot_nfe) as valor from nf_entrada nf ' +
       ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
       ' inner join nat_op nt on nf.codigo_nop = nt.codigo_nop ' +
       ' where nf.data_lanc_nfe >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
       ' and nf.data_lanc_nfe <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+ ''' ' +
       ' and (nt.mostrar_rel_compras <> ''N'' or nt.mostrar_rel_compras is null) ' +
       ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ' +
       ' in ('+vCodEmpresasDRE+')'+
       ' group by tipo ' +
       ' UNION '+
       ' select ''mt'' as tipo,sum(valor_tot_nota) as valor from ent_moto nf ' +
       ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
       ' inner join nat_op nt on nf.cod_fisc_nota = nt.codigo_nop ' +
       ' where nf.data_ch_nota >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
       ' and nf.data_ch_nota <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
       ' and (nt.mostrar_rel_compras <> ''N'' or nt.mostrar_rel_compras is null) ' +
       ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ' +
       ' in ('+vCodEmpresasDRE+') ' +
       ' group by tipo '+
       ' union '+
       ' select ''N4'' as tipo,sum(valor_total) as valor from notafiscal nf ' +
       ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
       ' inner join nat_op nt on nf.codigo_nop = nt.codigo_nop ' +
       ' where nf.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
       ' and nf.data_lanc <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+ ''' ' +
       ' and nf.natureza_nf = ''E'' and (nt.mostrar_rel_compras <> ''N'' or nt.mostrar_rel_compras is null) ' +
       ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ' +
       ' in ('+vCodEmpresasDRE+') ' +
       ' group by tipo ';
       vval:=0;
       buscas.open;
       vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando PMPF');
       while not buscas.eof do
       begin
         vval:=vval+buscas.FieldByName('valor').AsCurrency;
         buscas.next;
       end;
       if vval <> 0 then
        vIndicadoresBal[4,1]:=vDadosIni.alndir(Format('%n',[vvalvendaav/vval]), 6)
       else
        vIndicadoresBal[4,1]:=vDadosIni.alndir(Format('%n',[0.00]), 6);
     end
     else
      vIndicadoresBal[4,1]:=vDadosIni.alndir(Format('%n',[0.00]), 6);

     vstgridDRE:=TStringGrid.create(application);
     vstgvenda:=TStringGrid.create(application);
     cadDreHw.vexecutarmesatual:='S';
     CadDREHW.vCodEmpresasDRE:=vCodEmpresasDRE;
     CadDREHW.vversao:='4.0';
     CadDREHW.vmesinf:=vmesinf;
     CadDREHW.vano:=vanoinf;
     CadDREHW.vanoinf:=vanoinf;
     CadDREHW.vContabil := False;
     CadDREHW.vMesesMedia := 1;
     cadDreHw.caddesp.vregime:=vregime;
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando DRE');
     cadDreHw.selgriddep(vgriddep);
     cadDreHw.MontaDRE(vgriddep,vstgridDRE,vstgvenda, 'B');
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Gravando Índices Rentabilidade,Endividamento e Liquidez Circ');
     if vpatLiq <> 0 then
      vIndicadoresBal[5,1]:=vDadosIni.alndir(Format('%n',[(((cadDreHw.vlucliqop[0]+cadDreHw.vreinv[0])/vpatLiq)*100)]), 6)
     else
      vIndicadoresBal[5,1]:=vDadosIni.alndir(Format('%n',[0.00]), 6);
     if vtativo <> 0 then
      vIndicadoresBal[6,1]:=vDadosIni.alndir(Format('%n',[(vvstpascirc+vvstpasexlp)/vtativo]), 6)
     else
      vIndicadoresBal[6,1]:=vDadosIni.alndir(Format('%n',[0.00]), 6);
     if vvstpascirc <> 0 then
       vIndicadoresBal[7,1]:=vDadosIni.alndir(Format('%n',[ Vvatcirc/vvstpascirc]), 6)
     else
      vIndicadoresBal[7,1]:=vDadosIni.alndir(Format('%n',[0.00]), 6);
//     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando Estoques para PME');
     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Gravando Índices PME, ILG, ILS, CFi,Gcx,KG e NKG');
     if vdesconsideraPME then
      vIndicadoresBal[3,1]:=vDadosIni.alndir(Format('%n',[0.00]), 6)
     else
     begin
      if cadDreHw.vcustoVend[0] <> 0 then
       vIndicadoresBal[3,1]:=vDadosIni.alndir(Format('%n',[(vvalestoque/cadDreHw.vcustoVend[0])*30]), 6)
      else
       vIndicadoresBal[3,1]:=vDadosIni.alndir(Format('%n',[0.00]), 6);
     end;
     if (vvstpascirc+vvstpasexlp) <> 0 then
      vIndicadoresBal[8,1]:=vDadosIni.alndir(Format('%n',[((Vvatcirc+vvastrealp)/(vvstpascirc+vvstpasexlp))]),6)
     else
      vIndicadoresBal[8,1]:=vDadosIni.alndir(Format('%n',[0.00]),6);
     if vvstpascirc <> 0 then
      vIndicadoresBal[9,1]:=vDadosIni.alndir(Format('%n',[((Vvatcirc-vvalestoque)/vvstpascirc)]),6)
     else
      vIndicadoresBal[9,1]:=vDadosIni.alndir(Format('%n',[0.00]),6);

     vIndicadoresBal[10,1]:=vDadosIni.alndir(Format('%n',[StrToFloat(vDadosIni.tirapontos(vIndicadoresBal[2,1],2))+
     StrToFloat(vDadosIni.tirapontos(vIndicadoresBal[3,1],2))-StrToFloat(vDadosIni.tirapontos(vIndicadoresBal[4,1],2))]),6);
     try
      if (StrToFloat(vIndicadoresBal[2,1])+
      StrToFloat(vIndicadoresBal[3,1])-StrToFloat(vIndicadoresBal[4,1])) > 0 then
      begin
       vgcx:=(360/(StrToFloat(vIndicadoresBal[2,1])+
       StrToFloat(vIndicadoresBal[3,1])-StrToFloat(vIndicadoresBal[4,1])));
      end;
     except
      vgcx:=0;
     end;
     vIndicadoresBal[11,1]:=vDadosIni.alndir(Format('%n',[vgcx]),6);
     vIndicadoresBal[12,1]:=vDadosIni.alndir(Format('%n',[(Vvatcirc-vvstpascirc)]),14);
     vdesembolso:=cadDespGestor.desembolsototal((vdat2-360),vdat2,vCodEmpresasDRE, 'B');
     if vgcx <> 0 then
      vIndicadoresBal[13,1]:=vDadosIni.alndir(Format('%n',[(vdesembolso/vgcx)]),14)
     else
      vIndicadoresBal[13,1]:=vDadosIni.alndir(Format('%n',[0.00]),14);

     vDadosIni.progressoFuncao('Status da Geração Índices','Processo Gerando Balanço','Verificando Índices de meses e anos anteriores');
     vIndicesBal.Close;
     vIndicesBal.CommandText:= ' SELECT * FROM INDICES_BALANCO ' +
     	 ' WHERE ((MES >=01 AND MES <= '+inttostr(vmesinf)+' AND ANO = '+IntToStr(vanoinf)+') ' +
       ' OR (MES >= 01 AND MES <= '+inttostr(vmesinf)+' AND ANO = '+IntToStr(vanoinf-1)+')) ' +
       ' AND COD_EMPRESA in ('+vCodEmpresasDRE+') ' +
       ' ORDER BY ANO,MES,SEQ_INDICE,COD_EMPRESA ';
     vIndicadoresBal[14,1]:=vDadosIni.alndir(Format('%n',[(vpatLiq)]),14);
     vIndicadoresBal[15,1]:=vDadosIni.alndir(Format('%n',[(vtr)]),6);
     cadDreHw.montadatasBI;
     vval:=cadDreHw.CadVendas.MediaVendas(vmesessug,vCodEmpresasDRE, 'B');
     if vdiasTrab <> 0 then
     begin
      if (CadEstoque.vestprodutos-((vval/vdiasTrab)*vtr)) > 0 then
       vIndicadoresBal[16,1]:=vDadosIni.alndir(Format('%n',[
       (CadEstoque.vestprodutos-((vval/vdiasTrab)*vtr))]),14)
      else
       vIndicadoresBal[16,1]:=vDadosIni.alndir(Format('%n',[0.00]),14);
     end
     else
      vIndicadoresBal[16,1]:=vDadosIni.alndir(Format('%n',[0.00]),14);
     vIndicadoresBal[17,1]:=vDadosIni.alndir(Format('%d',[(vdiasTrab)]),6);
     if CadEstoque.vestprodutos <> 0 then
      vIndicadoresBal[18,1]:=vDadosIni.alndir(Format('%n',[(((CadEstoque.vobsoletos/CadEstoque.vestprodutos)*100))]),14)
     else
      vIndicadoresBal[18,1]:=vDadosIni.alndir(Format('%n',[0.00]),14);
     // 
//     if StrToFloat(vIndicadoresBal[10,1]) <> 0 then
      vIndicadoresBal[19,1]:=vDadosIni.alndir(Format('%n',[(vdesembolso/360)]),14);
  //   else
//      vIndicadoresBal[19,1]:=vDadosIni.alndir(Format('%n',[0.00]),14);
     vIndicesBal.Open;
     for I := 0 to 19 do
     begin
      vIndicesBal.Append;
      vIndicesBal.FieldByName('NOME_INDICE').AsString:=vIndicadoresBal[i,0];
      vIndicesBal.FieldByName('MES').AsInteger:=vmesinf;
      vIndicesBal.FieldByName('ANO').AsInteger:=vanoinf;
      vIndicesBal.FieldByName('COD_EMPRESA').Value:=vCodEmpresasDRE;
      vIndicesBal.FieldByName('VALOR').AsFloat:=StrToFloat(vDadosIni.tirapontos(vIndicadoresBal[i,1],2));
      vIndicesBal.FieldByName('SEQ_INDICE').AsFloat:=i;
      vIndicesBal.post;
     end;
    end;
  end;
  vDadosIni.finalizaProgresso;
end;

function TBalancoHw.vgerarGrafico(vdbgrid: TDBGrid; vchartanoat,
  vchartanoant: Tchart; vstringgrid: TstringGrid; vtp: integer): boolean;
var
  I,j,vtam: Integer;
  SeriesClass: TChartSeriesClass;
  NewSeries: TChartSeries;
  NewSeries1: TChartSeries;
  vseqgr:array of string;
//  vstringGrid: TStringGrid;
  vseqnum: integer;
  vanocomp: integer;
begin
  // destroy the existing series (in reverse order)
  if vtp = 1 then
   vanocomp:=vanoinf
  else
   vanocomp:=vanoinf-1;

   vtam:=1;
   SetLength(vseqgr,vtam);
   vseqgr[0]:='';
  // create the new series
//  vstringGrid:=TStringGrid.Create(Application);
  vIndicesBal.First;
  while not vIndicesBal.eof do
  begin
    if vdbgrid.SelectedRows.CurrentRowSelected then
    begin
       if not procuraitemvetor(vseqgr,vIndicesBal.FieldByName('NOME_INDICE').AsString) then
       begin
         vseqgr[vtam-1]:=vIndicesBal.FieldByName('NOME_INDICE').AsString;
         SetLength(vseqgr,vtam+1);
         vtam:=vtam+1;
         vseqgr[vtam-1]:='';
       end;
    end;
    vIndicesBal.next;
  end;
  for i := 1 to vstringGrid.RowCount -1 do
    vstringGrid.Rows[I].Clear;
  vstringGrid.rowcount:=1;
  vstringGrid.Cells[0,0] :='Ano: '+inttostr(vanocomp);
  vstringGrid.ColCount:=vmesinf+1;
  j:=0;
  for I := 0 to Length(vseqgr)-1 do
  begin
   if vseqgr[i] <> '' then
     vstringGrid.rowcount:=vstringGrid.rowcount+1;
   vIndicesBal.First;
   while not vIndicesBal.eof do
   begin
     if vseqgr[i] <> '' then
     begin
       if vanocomp = vIndicesBal.FieldByName('ANO').AsInteger then
       begin
         if vseqgr[i] = vIndicesBal.FieldByName('NOME_INDICE').AsString then
         begin
          vstringGrid.Cells[0,j+1] :=vIndicesBal.FieldByName('NOME_INDICE').AsString;
          vstringGrid.Cells[vIndicesBal.FieldByName('MES').asinteger,0] :=vIndicesBal.FieldByName('MES').asstring;
          vstringGrid.Cells[vIndicesBal.FieldByName('MES').asinteger,j+1] :=vIndicesBal.FieldByName('VALOR').asstring;
         end;
       end;
     end;
     vIndicesBal.next;
   end;
   j:=j+1;
  end;
  // destroy the existing series (in reverse order)
//  vstringGrid.Free;
end;

{ Tdpto }

function Tdepto.abreBase: Boolean;
begin
 montaSelect('SELECT * FROM DEPART_CT WHERE TP_DEP = ''I''');
end;

constructor Tdepto.create;
begin
dataSet:=TClientDataSet(DtmGestorHw.CdsDpto);
buscas:=TIBQuery(DtmGestorHw.QrBuscas);
transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
vdepprod:='N';
end;

destructor Tdepto.destroy;
begin
  Close;
  inherited;
end;

function Tdepto.preencheCombo(vcomb: TComboBox): boolean;
begin
  abreBase;
  vcomb.Items.Clear;
  while not eof do
  begin
    vcomb.Items.Add(dataSet.FieldByName('DESC_DEP').AsString);
    Next;
  end;
  vcomb.Items.Add('EMPRESA');
  vcomb.Text:='EMPRESA';
  Close;
  result:=true;
end;


function Tdepto.procuraDepto(venomedepto: string): boolean;
begin
 if venomedepto <> 'EMPRESA' then
 begin
  montaSelect('SELECT * FROM DEPART_CT WHERE DESC_DEP = '''+
  venomedepto+''' and TP_DEP = ''I''');
  buscas.Close;
  buscas.sql.text:='select CODDEPPRODUTOS,CODDEPOFICINA,CODDEPVEICULOS,CODDEPVEICULOSUS from '+
  'empresa where cod_empresa = '+vDadosIni.codEmpresa;
  buscas.Open;
  if dataset.FieldByName('COD_DEP').AsString = buscas.FieldByName('CODDEPPRODUTOS').AsString then
   vdepprod:='S'
  else
   vdepprod:='N';
 end
 else
  abreBase;
 buscas.Close;
end;

{ TVendasGestor }

constructor TVendasGestor.create;
var
 i: integer;
begin
   for i:=1 to 7 do
   begin
    vvprevisao[i]:=0.00;
   end;
  SetLength(VendaporMod,12,7);
  SetLength(VendaporModCNT,14,7);
//  SetLength(vendaporModBr,11,7);
  SetLength(vbrutoat,14);
  SetLength(vcustoat,14);
  SetLength(vdescat,14);
  SetLength(vdevat,14);
  SetLength(vdevct,14);

  SetLength(vbrutoatRat,14);
  SetLength(vcustoatRat,14);
  SetLength(vdescatRat,14);

  for i := 0 to 13 do
  begin
   vbrutoat[i]:=0;
   vcustoat[i]:=0;
   vdescat[i]:=0;
   vdevat[i]:=0;
   vdevct[i]:=0;
   vbrutoatRat[i]:=0;
   vcustoatRat[i]:=0;
   vdescatRat[i]:=0;
  end;
  vtippesq:='';
  vmesor:=0;
  vanovendas:=0;
  vmesvendas:=0;
  vdat1:=strtodate('01/01/2001');
  vdat2:=strtodate('01/01/2001');
  datasetBI:=TIBQuery(DtmGestorHw.IbCubeGeral);
  dataSet:=TClientDataSet(DtmGestorHw.CdsVendasGestor);
  buscas:=TIBQuery(DtmGestorHw.QrBuscas);
  transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
  buscas.Close;
  buscas.sql.text:='select coalesce(US_VLNF_VEICDRE,''N'') as US_VLNF_VEICDRE from empresa where cod_empresa = '+vDadosIni.codEmpresa;
  buscas.Open;
  if buscas.FieldByName('US_VLNF_VEICDRE').AsString = 'S' then
   vcampoutilvndveic:='VALTOT_V'
  else
   vcampoutilvndveic:='VALOR_REAL';
   buscas.Close;
  vVendasCNT := '';
end;

procedure TVendasGestor.defineTipoVendas;
begin
if vVendasCNT = 'S' then
  begin
    vTipoVendaREQ := '(';
    vTipoVendaOS := '(';

    buscas.Close;
    buscas.SQL.Text := 'select * from TIPO_VENDAS where venda_cnt = ''S''';
    buscas.Open;
    buscas.First;
    while not buscas.Eof do
    begin
      if Trim(buscas.FieldByName('tipo').AsString) = 'REQ' then
        vTipoVendaREQ := vTipoVendaREQ + QuotedStr(Trim(buscas.FieldByName('sigla').AsString)) + ','
      else if Trim(buscas.FieldByName('tipo').AsString) = 'OS' then
        vTipoVendaOS := vTipoVendaOS + QuotedStr(Trim(buscas.FieldByName('tipo_os').AsString)) + ',';
      buscas.Next;
    end;
    vTipoVendaREQ := vTipoVendaREQ + ')';
    vTipoVendaOS := vTipoVendaOS + ')';
    vTipoVendaREQ := StringReplace(vTipoVendaREQ, ',)', ')', [rfReplaceAll]);
    vTipoVendaOS := StringReplace(vTipoVendaOS, ',)', ')', [rfReplaceAll]);
    if vTipoVendaREQ = '()' then
      vTipoVendaREQ := vDadosIni.vTipoVendaREQ;
    if vTipoVendaOS = '()' then
      vTipoVendaOS := vDadosIni.vTipoVendaOS;
    buscas.Close;
  end
  else
  begin
    vTipoVendaREQ := vDadosIni.vTipoVendaREQ;
    vTipoVendaOS := vDadosIni.vTipoVendaOS;
  end;
  vVendasCNT := '';
end;

destructor TVendasGestor.destroy;
begin
  Close;
  inherited;
end;

function TVendasGestor.DevolucoesBI(vempresasD: string;
  vFerCube: THierCube; pBalDre: string): boolean;
var
 vtppesq: string;
begin
  vtppesq:='d.data >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and d.data <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+'''';
   datasetBI.Close;
   datasetBI.SQL.text:=
   ' select emp.identificacao_emp as nome_emp,' +
   ' d.num_fab_prod,gr.descricao as grupo,d.descricao,' +
   ' col.nome_vendedor,extract(month from d.data) as mes,'+
   ' extract(year from d.data) as ano,extract(day from d.data) as dia,sum(d.Quant*d.valor) as valor,'+
   ' sum(d.quant*d.pcust_mc) custo from devolucao d,grupos gr,colaborador col,empresa emp ' +
   ' where d.grupo_prod = gr.codigo_grup ' +
   ' and d.cod_vendedor = col.cod_vendedor and d.cod_empresa = col.cod_empresa ' +
   ' and d.cod_empresa = emp.cod_empresa ' +
   ' and '+vtppesq+
   vDadosIni.IfThen(pBalDre = 'D',
	   ' and d.cod_empresa ',
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else d.cod_empresa end) ') +
   ' in ('+vempresasD+') and d.ativo = 1 '+
   ' group by nome_emp,d.num_fab_prod,d.descricao,col.nome_vendedor,mes,dia,ano,grupo';

//   CommandText:=
   // Colocar aqui o progresso das ações....
{  'select emp.nome_emp as empresa,gr.descricao as grupo_prod,p.tipo as tipo,extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,'+
  'i.descr_prod_ped as descricao_prod,sum(i.VLTOT_PED_ITEM+I.RATEIO_ACRESC) as bruto,sum(i.RATEIO_DESC) as desconto,sum(i.QUANT_PED_ITEM*i.PCUST_MC) as custo '+
  ' from PEDVENDA_PROD i, PEDVENDA p, GRUPOS GR,EMPRESA emp '+
  'where i.grupo_prod = gr.codigo_grup and '+
  ' i.nped = p.nped and i.tipo = p.tipo and '+
  'i.cod_empresa = p.cod_empresa and '+vtppesq+
  ' AND '+
  ' p.cod_empresa in ('+VempresasD+') and p.cod_empresa = emp.cod_empresa '+
  'and ((p.tipo = ''OS'' and (p.tipo_os = ''CLIENTE'' or p.tipo_os = ''EXTERNA'')) or (p.tipo = ''REQ'' and tipv <> ''C'')) '+
  ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod '+
  'union '+
  'select emp.nome_emp as empresa,s.desc_servico||''                    '' as grupo_prod,''OSS'' as tipo,extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,'+
  's.desc_servico as descricao_prod,sum(i.VALOR_TOT_SERV+i.RATEIO_ACRESC) as bruto,sum(i.RATEIO_DESC) as desconto, 0 as custo '+
  'from PEDVENDA_SERV i, PEDVENDA p, TIPO_SERVICO s, EMPRESA emp '+
  ' where i.cod_servico = s.cod_servico and i.nped = p.nped and i.tipo = p.tipo and '+
  'i.cod_empresa = p.cod_empresa and '+vtppesq+
  ' AND '+
  'p.cod_empresa in ('+vempresasD+') and p.cod_empresa = emp.cod_empresa '+
  ' and ((p.tipo = ''OS'' and (p.tipo_os = ''CLIENTE'' or p.tipo_os = ''EXTERNA'')) ) '+
  ' group by empresa,grupo_prod,tipo,mes,ano,descricao_prod ';
{  'union '+
  'select ''OST'' as tipo,SUM(i.VL_SERVT) as bruto,SUM(0) as desconto, SUM(0) as custo '+
  'from PEDVENDA_SERV_TERC i, PEDVENDA p '+
  'where i.nped = p.nped and i.tipo = p.tipo and '+
  'i.cod_empresa = p.cod_empresa and '+vtppesq+
  ' AND '+
  'p.cod_empresa in ('+vempresasD+') '+
  'and ((p.tipo = ''OS'' and (p.tipo_os = ''CLIENTE'' or p.tipo_os = ''EXTERNA'')) ) GROUP BY tipo';}
   datasetBI.Open;
   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgPage);
  vFerCube.DefineFieldAsDimension('grupo','Grupo Produto',dgRow);
  vFerCube.DefineFieldAsDimension('ANO','Ano Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('MES','Mês do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('dia','Dia Devolução',dgPage);
  vFerCube.DefineFieldAsDimension('descricao','Desc Produto',dgPage);
  vFerCube.DefineFieldAsDimension('Num_fab_prod','Código Produto',dgPage);
  vFerCube.DefineFieldAsDimension('nome_vendedor','Nome Vendedor',dgPage);
  vFerCube.DefineFieldAsSummary('valor');
  vFerCube.DefineFieldAsSummary('custo');
end;

function TVendasGestor.MediaVendas(vmeses: integer;
  vCodEmpresasDRE: string; pBalDre: string): currency;
begin
   dataSet.Close;
   dataSet.CommandText:=
   // Colocar aqui o progresso das ações....
    ' select SUM(i.QUANT_PED_ITEM*i.PCUST_MC) as custo from PEDVENDA_PROD i ' +
    ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa  '+
    ' where (i.status is null or i.status = '''') ' +
    ' and p.data_fech >= '''+FormatDateTime('mm/dd/yyyy', vdat2-(vmeses*30))+ ''' ' +
    ' AND p.data_fech <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''' ' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' AND p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end)  ') +
    ' in ('+vCodEmpresasDRE+') '+
    ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) ' +
    ' or (p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+'))';
   dataSet.Open;
   result:=(dataset.FieldByName('custo').AsCurrency/vmeses);
end;

function TVendasGestor.vendapordpto(vdpto: string;vempresasD: string; pBalDre: string): currency;
var
 vtppesq,vtppesq1,vtppesq2: string;
 vtot: currency;
begin
//  result:=true;
 vdat1:=StrToDate('01/'+inttostr(vmesvendas)+'/'+IntToStr(vanovendas));
 vdat2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesvendas)+
 '/'+IntToStr(vanovendas))))+'/'+inttostr(vmesvendas)+'/'+IntToStr(vanovendas));
  vtppesq:='(p.data_fech >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') ';
  vtppesq1:='(ft.data_ven >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and ft.data_ven <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') ';
  vtppesq2:='(c.data_em_nf >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and c.data_em_nf <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') ';
//  try
  buscas.Close;
  buscas.SQL.text:=
    ' select sum(i.VLTOT_PED_ITEM+I.RATEIO_ACRESC) as bruto,sum(i.RATEIO_DESC) as desconto,' +
    ' sum(i.QUANT_PED_ITEM*i.PCUST_MC) as custo from PEDVENDA_PROD i ' +
    ' inner join EMPRESA emp on i.cod_empresa = emp.cod_empresa ' +
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
    ' inner join produtos pr on i.grupo_prod = pr.grupo_prod and i.cod_prod = pr.cod_prod and i.cod_empresa = pr.cod_empresa ' +
    ' inner join GRUPOS GR on i.grupo_prod = gr.codigo_grup ' +
    ' left join SUB_GRUPO sb on coalesce(pr.sub_g_prod,0) = sb.codigo_subgr ' +
    ' inner join colaborador col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
    ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa ' +
    ' where (i.status is null or i.status = '''') ' +
    ' and dep.cod_dptocx in '+vdpto+' and '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+VempresasD+') and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) ' +
    ' or (p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
    ' union '+
    ' select sum(i.VALOR_TOT_SERV+coalesce(i.RATEIO_ACRESC,0)+coalesce(i.PRC_INT_SERV,0)) as bruto,' +
    ' sum(i.RATEIO_DESC) as desconto, 0 as custo from PEDVENDA_SERV i ' +
    ' inner join EMPRESA emp on i.cod_empresa = emp.cod_empresa ' +
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
    ' inner join TIPO_SERVICO s on i.cod_servico = s.cod_servico ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join COLABORADOR col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
    ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa ' +
    ' where (i.status is null or i.status = '''')  '+
    ' and dep.cod_dptocx in '+vdpto+ ' and '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+vempresasD+') '+
    ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) ) '+
    ' union '+
    ' select SUM(i.VL_SERVT) as bruto,SUM(0) as desconto, SUM(0) as custo from PEDVENDA_SERV_TERC i ' +
    ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa ' +
    ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
    ' where dep.cod_dptocx in '+vdpto+ ' and '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+vempresasD+') '+
    ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) ) '+
    ' union '+
    ' select SUM(i.vl_total) as bruto,SUM(0) as desconto, SUM(i.vlcusto_tot) as custo from PEDVENDA_PROD_TERC i ' +
    ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa ' +
    ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
    ' where dep.cod_dptocx in '+vdpto+ ' and '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+vempresasD+') '+
    ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vDadosIni.vTipoVendaOS+')) ) '+
    ' union '+
    //veiculos novos, troquei o select pois nao usa mais a tabela mot_ven
    ' select sum(ft.'+vcampoutilvndveic+') as bruto, 0 as desconto, ' +
    '	sum(coalesce((select first 1 (et.custo) from comprasmesesv40 et ' +
    '			where et.chassi = ft.chassiv and et.cod_empresa = ft.cod_empresa ' +
    '			and et.status_uso = ft.tipo_venda_v order by data_ch_nota),0)) as custo from com_fat ft' +
    ' inner join empresa emp on ft.cod_empresa = emp.cod_empresa ' +
    ' inner join nat_op nt on nt.codigo_nop = ft.natop_v' +
    ' inner join colaborador col on ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto' +
    ' WHERE ft.tipo_venda_v = ''N'' and '+vtppesq1+
    ' and ft.natureza = ''S'' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'')' +
    ' and coalesce(nt.faturamento, ''N'') = ''S'' ' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and ft.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ft.cod_empresa end) ') +
    ' in ('+vempresasD+') and ft.ativo = 1 ' +
    ' and dep.cod_dptocx in '+vdpto+
  //  'select sum(ft.'+vcampoutilvndveic+') as bruto,0 as desconto,'+
  //  'sum((select first 1 (et.custo) from comprasmesesv4 et where '+
  //  'et.chassi = vn.chassiv and et.cod_empresa = vn.cod_empresa order by data_ch_nota)) as custo '+
  //  'from com_fat ft,mot_ven vn,sub_grupo sb,'+
  //  'TIPMODELO vv,colaborador col,empresa emp,clientes cl,funcoes func,depto dep '+
  //  'where  sb.codigo_subgr = 0 and ft.tipo_venda_v = ''N'' and  '+vtppesq1+
  //  'and ft.natop_v <> 1552 and ft.natop_v <> 5552 and ft.natop_v <> 5409 and ft.natop_v <> 5913 and ft.natop_v <> 6913 and '+
  //  'ft.chassiv = vn.chassiv and ft.num_nota_v = vn.num_nota_v and ft.n_comando = vn.n_comando and '+
  //  'vn.versaov = vv.codigo and vn.cod_empresa = vv.cod_empresa and ft.cod_empresa = vn.cod_empresa and '+
  //  'ft.cod_empresa in ('+vempresasD+') and ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa and '+
  //  'col.cod_funcao = func.cod_funcao and func.cod_depto = dep.cod_depto and dep.cod_dptocx in '+vdpto+' and ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa and ft.cod_empresa = emp.cod_empresa and ft.ativo = 1 '+
    ' union '+
    //veiculos usados, troquei o select pois nao usa mais a tabela mot_ven
    ' select sum(ft.'+vcampoutilvndveic+') as bruto, 0 as desconto,' +
    ' sum(case when coalesce(est.num_nota,0) > 0 then' +
    '       coalesce((select first 1 (et.custo) from comprasmesesv40 et ' +
    '				where et.chassi = ft.chassiv and et.cod_empresa = ft.cod_empresa ' +
    '				and et.status_uso = ft.tipo_venda_v order by et.data_ch_nota desc), coalesce(est.preco_custo,0))' +
    '     else' +
    '       coalesce(est.preco_custo,0)' +
    '     end) as custo from com_fat ft' +
    ' inner join empresa emp on ft.cod_empresa = emp.cod_empresa ' +
    ' left join est_moto est on est.codigo = ft.cod_estmoto and est.chassi_c = ft.chassiv and est.cod_empresa = ft.cod_empresa' +
    ' inner join nat_op nt on nt.codigo_nop = ft.natop_v' +
    ' inner join colaborador col on ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto' +
    ' WHERE  ft.tipo_venda_v = ''U'' and '+vtppesq1+
    ' and ft.natureza = ''S'' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'')' +
    ' and coalesce(nt.faturamento, ''N'') = ''S'' ' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and ft.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ft.cod_empresa end) ') +
    ' in ('+vempresasD+') and ft.ativo = 1 ' +
    ' and dep.cod_dptocx in '+vdpto+
  //  'select sum(ft.'+vcampoutilvndveic+') as bruto,0 as desconto,'+
  //  'sum(vn.vl_compra_us) as custo '+
  //  'from com_fat ft,mot_ven vn,sub_grupo sb,'+
  //  'TIPMODELO vv,colaborador col,empresa emp,clientes cl,funcoes func,depto dep '+
  //  'WHERE  sb.codigo_subgr = 0 and ft.tipo_venda_v = ''U'' and '+vtppesq1+
  //  'and ft.natop_v <> 1552 and ft.natop_v <> 5552 and ft.natop_v <> 5409 and ft.natop_v <> 5913 and ft.natop_v <> 6913 and '+
  //  'ft.chassiv = vn.chassiv and ft.n_comando = vn.n_comando and '+
  //  'vn.versaov = vv.codigo and vn.cod_empresa = vv.cod_empresa and ft.cod_empresa = vn.cod_empresa and '+
  //  'ft.cod_empresa in ('+vempresasD+') and ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa and '+
  //  'col.cod_funcao = func.cod_funcao and func.cod_depto = dep.cod_depto and dep.cod_dptocx in '+vdpto+' and '+
  //  'ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa and ft.cod_empresa = emp.cod_empresa and ft.ativo = 1 '+
    ' union '+
    ' select sum(c.valor) as bruto,0 as desconto, 0 as custo from COMISSAO_CONSORCIO c ' +
    ' inner join empresa emp on c.cod_empresa = emp.cod_empresa ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join colaborador col on c.cod_vendedor = col.cod_vendedor and c.cod_empresa = col.cod_empresa ' +
    ' inner join clientes cl on c.cod_cliente = cl.cod_cliente and c.cod_empresa = cl.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto '+
    ' WHERE dep.cod_dptocx in '+vdpto+ ' and '+vtppesq2+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and c.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else c.cod_empresa end)  ') +
    ' in ('+vempresasD+') and c.ativo = 1 ';
  vtot:=0;
  buscas.open;
  while not buscas.Eof do
  begin
    vtot:=vtot+(buscas.FieldByName('BRUTO').AsCurrency-buscas.FieldByName('DESCONTO').AsCurrency);
    buscas.next;
  end;
  Result:=vtot;
end;

function TVendasGestor.vendapordptoCNT(vdpto, vempresasD: string; pBalDre: string): currency;
var
 vtppesq,vtppesq2: string;
 vtot: currency;
begin
//  result:=true;
 vdat1:=StrToDate('01/'+inttostr(vmesvendas)+'/'+IntToStr(vanovendas));
 vdat2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesvendas)+
 '/'+IntToStr(vanovendas))))+'/'+inttostr(vmesvendas)+'/'+IntToStr(vanovendas));
  vtppesq:='(nf.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and nf.data_lanc <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') ';
  vtppesq2:='(c.data_em_nf >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and c.data_em_nf <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') ';
//  try
  buscas.Close;
  buscas.SQL.text:=
    ' select sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''P''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    ' case when coalesce(nfi.nped,0) > 0 then' +
    ' coalesce( (select first 1 cod_vendedor from pedvenda_prod pp where pp.nped = nfi.nped and pp.tipo = nfi.tipo_ped and pp.cod_empresa = nfi.cod_empresa and pp.nitem = nfi.nitem_ped), nf.cod_vendedor)' +
    ' else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vdpto +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' union ' +
    //cupom fiscal de produtos
    ' select sum(coalesce(cp2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0)) bruto,' +
    ' sum(coalesce(cp2.rat_desc, 0) + coalesce(cp2.perc_desc,0)) desconto,' +
    ' sum( case when cp2.prod_serv = ''S'' then 0 else (coalesce(cp2.quantidade, 0) * coalesce(cp2.prec_cusm_prod, 0)) end ) custo' +
    ' from cupom cp' +
    ' inner join empresa emp on cp.cod_empresa = emp.cod_empresa ' +
    ' inner join cupom2 cp2 on cp2.cod_terminal = cp.cod_terminal and cp2.nserieecf = cp.nserieecf' +
    '   and cp2.cod_empresa = cp.cod_empresa and cp2.cupom = cp.cupom and cp2.ordem = cp.registro' +
    ' inner join nat_op nop on nop.codigo_nop = cp2.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = cp2.cod_empresa and col.cod_vendedor = cp2.cod_vendedor' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where cp.data >= '+QuotedStr(FormatDateTime('mm/dd/yyyy',vdat1))+
    ' and cp.data <= '+QuotedStr(FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and dep.cod_dptocx in ' + vdpto+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and cp.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and coalesce(cp.status_cp, '''') <> ''CANCELADO'' and coalesce(cp2.status_it, '''') <> ''CANCELADO''' +
    ' union ' +
    //nf servicos tabela nota fiscal
    ' select sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo from notafiscal nf ' +
    ' inner join empresa emp on cp.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''S''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when coalesce(nfi.nped,0) > 0 then' +
    '     coalesce( (select first 1 cod_vendedor from pedvenda_serv ps where ps.nped = nfi.nped and ps.tipo = nfi.tipo_ped and ps.cod_empresa = nfi.cod_empresa and ps.nitem = nfi.nitem_ped), nf.cod_vendedor)' +
    '     else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vdpto +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' union ' +
    //nf servicos prefeitura pedvendaserv pelo sistema
    ' select sum(coalesce(ps.valor_nfse,0) + coalesce(ps.irrf_servico,0) + coalesce(ps.pisrf_servico,0) + coalesce(ps.cofinsrf_servico,0) + coalesce(ps.csslrf_servico,0)) bruto, 0 as desconto, 0 as custo' +
    ' from pedvenda pv' +
    ' inner join empresa emp on pv.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ps.emissao_nfse >= '+QuotedStr(FormatDateTime('mm/dd/yyyy',vdat1))+
    ' and ps.emissao_nfse <= '+QuotedStr(FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and dep.cod_dptocx in ' + vdpto +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ps.status_nfse = ''Autorizada''' +
    ' union ' +
    // pedvenda_serv nf servicos externa digitada na ordem de servico o numero data e valor
    ' select sum(coalesce(ps.valor_tot_serv,0)) bruto, sum(coalesce(ps.rateio_desc,0)) as desconto, 0 as custo' +
    ' from pedvenda_serv ps' +
    ' inner join empresa emp on ps.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda pv on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto ' +
    ' and dep.cod_dptocx in ' + vdpto +
    ' where  pv.data_nfext >= '+QuotedStr(FormatDateTime('mm/dd/yyyy',vdat1))+
    ' and pv.data_nfext <= '+QuotedStr(FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and pv.num_nfeext > 0 and pv.tipo = ''OS''' +
    ' and coalesce(ps.status_nfse,'''') <> ''Autorizada'' and (coalesce(ps.n_nf, 0) = 0)' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')'+
    ' union ' +
    // pedvenda_serv_terc
    ' select sum(coalesce(pt.vl_servt,0)) bruto, 0 as desconto, 0 as custo' +
    ' from pedvenda_serv_terc pt' +
    ' inner join empresa emp on pt.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda pv on pv.nped = pt.nped and pv.tipo = pt.tipo and pv.cod_empresa = pt.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = pv.cod_vendedor and col.cod_empresa = pv.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto ' +
    ' and dep.cod_dptocx in ' + vdpto +
    ' where pv.data_nfext >= '+QuotedStr(FormatDateTime('mm/dd/yyyy',vdat1))+
    ' and pv.data_nfext <= '+QuotedStr(FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and pv.num_nfeext > 0 and pv.tipo = ''OS''' +
    ' and coalesce((select count(sss.nped) from pedvenda_serv sss where sss.nped = pt.nped and sss.tipo = pt.tipo' +
    ' and sss.cod_empresa = pt.cod_empresa and  coalesce(sss.status_nfse, '''') = ''Autorizada'' ' +
    ' and coalesce(sss.lote_nfse,0) > 0 )  ,0) = 0' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    // pedvenda_prod_terc não tem documento fiscal
    ' union ' +
//    ' select sum(pv.valor_nfext) bruto, 0 as desconto, 0 as custo from pedvenda pv' +
//    ' where pv.data_nfext >= '+QuotedStr(FormatDateTime('mm/dd/yyyy',vdat1)) +
//    ' and pv.data_nfext <= '+QuotedStr(FormatDateTime('mm/dd/yyyy', vdat2)) +
//    ' and pv.num_nfeext > 0' +
//    ' and pv.cod_empresa in (' + vempresasD + ')' +
//    ' and ( select count(*) from pedvenda_serv ps' +
//    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
//    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
//    ' inner join depto dep on dep.cod_depto = f.cod_depto ' +
//    ' and dep.cod_dptocx in ' + vdpto +
//    ' where ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa and coalesce(ps.status_nfse,'''') <> ''Autorizada''' +
//    ' and coalesce(ps.valor_tot_serv,0) > 0 '+
//    ' ) > 0' +
//    ' union ' +
    //nf veiculos novos e usados
    ' select sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''V''' +
    ' inner join notafiscal_item_veiculo nfiv on nfiv.cod_nf = nfi.cod_nf and nfiv.cod_empresa = nfi.cod_empresa and nfiv.nitem = nfi.nitem' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when coalesce(nf.n_comando,0) > 0 then' +
    '     coalesce( (select first 1 cf.covend_v from com_fat cf where cf.n_comando = nf.n_comando and cf.cod_empresa = nf.cod_empresa), nf.cod_vendedor)' +
    '     else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vdpto+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    ' union ' +
    //nf outras tabela nota fiscal
    ' select sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto, sum(nfi.quantidade * nfi.prec_cusm_prod) custo' +
    ' from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''O''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor = nf.cod_vendedor' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vdpto+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    ' union '+
    ' select sum(c.valor) as bruto,0 as desconto, 0 as custo from COMISSAO_CONSORCIO c' +
    ' inner join empresa emp on c.cod_empresa = emp.cod_empresa ' +
    ' inner join colaborador col on c.cod_vendedor = col.cod_vendedor and c.cod_empresa = col.cod_empresa ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join clientes cl on c.cod_cliente = cl.cod_cliente and c.cod_empresa = cl.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto '+
    ' WHERE dep.cod_dptocx in '+vdpto+' and '+vtppesq2+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and c.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else c.cod_empresa end) ') +
    ' in ('+vempresasD+') ' +
    ' and c.ativo = 1 ';
  vtot:=0;
  buscas.open;
  while not buscas.Eof do
  begin
    vtot:=vtot+(buscas.FieldByName('BRUTO').AsCurrency-buscas.FieldByName('DESCONTO').AsCurrency);
    buscas.next;
  end;
  Result:=vtot;
end;

function TVendasGestor.vendasant(vdia: Tdate; vtip: string;vCodEmpresasDRE: string; pBalDre: string): boolean;
var
 vdataant: Tdate;
 itxdia,itx: integer;
begin
  if vtip = 'D' then
  begin
    vDadosIni.progressoFuncao('','','Verificando Média Recebimento a Vista Últimas 24 Semanas');
    for itxdia:=1 to 7 do
    begin
     Application.ProcessMessages;
     vdataant:=vdia-1;
     itx:=1;
     while itx <= 24 do
     begin
      if DayOfWeek(vdataant) = itxdia then
      begin
      // messagedlg(datetostr(vdataant),mtinformation,[mbOK],0);
       Application.ProcessMessages;
       buscas.close;
       buscas.sql.Text:='select sum(lanc.valor_l) as valor from lancamentos lanc ' +
       ' inner join empresa emp on lanc.codigo_emp = emp.cod_empresa ' +
       ' where lanc.codigo_ctrl = 1 and lanc.lanc_venda = ''S'' ' +
       ' and lanc.data = '''+FormatDateTime('mm/dd/yyyy',vdataant)+ ''' ' +
       vDadosIni.IfThen(pBalDre = 'D',
       	' and lanc.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
       	' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else lanc.codigo_emp end) ') +
       ' in ('+vCodEmpresasDRE+') '+
       ' union '+
       ' select sum(ch.valor_ch) as valor from controle_cheque ch ' +
       ' inner join empresa emp on ch.codigo_emp = emp.cod_empresa ' +
       ' where (ch.data_venc - ch.data_rec) <= 1 '+
       ' and ch.data_rec = '''+FormatDateTime('mm/dd/yyyy',vdataant)+''' ' +
       vDadosIni.IfThen(pBalDre = 'D',
       	 ' and ch.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
	       ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ') +
       ' in ('+ vCodEmpresasDRE+')';
       buscas.open;
       buscas.FetchAll;
       if buscas.RecordCount > 0 then
       begin
        While not buscas.eof do
        begin
         vvprevisao[itxdia]:=vvprevisao[itxdia]+buscas.FieldByName('VALOR').ascurrency;
         buscas.next;
        end;
       end;
       itx:=itx+1;
       vdataant:=vdataant-1;
      end
      else
       vdataant:=vdataant-1;
     end;
     vvprevisao[itxdia]:=vvprevisao[itxdia]/24;
    end;
    buscas.close;
  end
  else
  begin
   vDadosIni.progressoFuncao('','','Verificando Média Recebimento a Vista últimos 180 dias');
   buscas.close;
   buscas.sql.text:='select sum(lanc.valor_l) as valor from lancamentos lanc ' +
    ' inner join empresa emp on lanc.codigo_emp = emp.cod_empresa ' +
    ' where lanc.codigo_ctrl = 1 and lanc.lanc_venda = ''S'' ' +
    ' and lanc.data >= '''+FormatDateTime('mm/dd/yyyy',(vdia-180))+''' ' +
    ' and lanc.data <= '''+FormatDateTime('mm/dd/yyyy',vdia)+''' ' +
    vDadosIni.IfThen(pBalDre = 'D',
      ' and lanc.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
	    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else lanc.codigo_emp end) ') +
    ' in ('+vCodEmpresasDRE+') '+
    ' union '+
    ' select sum(ch.valor_ch) as valor from controle_cheque ch ' +
    ' inner join empresa emp on ch.codigo_emp = emp.cod_empresa ' +
    ' where (ch.data_venc - ch.data_rec) <= 1 '+
    ' and ch.data_rec >= '''+FormatDateTime('mm/dd/yyyy',(vdia-180))+''' ' +
    ' and ch.data_rec <= '''+FormatDateTime('mm/dd/yyyy',vdia)+''' ' +
    vDadosIni.IfThen(pBalDre = 'D',
      ' and ch.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
	    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ') +
    ' in ('+vCodEmpresasDRE+') ';
   buscas.open;
   While not buscas.eof do
   begin
    vvprevisao[1]:=vvprevisao[1]+buscas.FieldByName('VALOR').AsCurrency;
    buscas.next;
   end;
   vvprevisao[1]:=vvprevisao[1]/6;
   buscas.close;
  end;
end;

function TVendasGestor.vendasBI(vempresasD: string;vFerCube: THierCube; pBalDre: string): boolean;
var
 vtppesq,vtppesq1,vtppesq2,vtppesq3,vtppesq4: string;
begin
  result:=true;
  vtppesq:='((p.data_fech >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(p.data_fech >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))' +
  ' and p.status_ped = ''FECHADA''';
  vtppesq1:='((ft.data_ven >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and ft.data_ven <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(ft.data_ven >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and ft.data_ven <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
  vtppesq2:='((c.data_em_nf >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and c.data_em_nf <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(c.data_em_nf >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and c.data_em_nf <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
  vtppesq3:='((p.data >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and p.data <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(p.data >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and p.data <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
  vtppesq4:='((nf.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and nf.data_lanc <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(nf.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and nf.data_lanc <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';

  defineTipoVendas;
                                
//  try
   datasetBI.Close;
   datasetBI.SQL.text:=
    ' select emp.identificacao_emp as empresa,dep.cod_dptocx,gr.descricao as grupo_prod,p.tipo||''  '' as tipo,extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,'+
    ' i.descr_prod_ped as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' case when p.ncupom > 0 then ''CP'' else case when i.n_nf > 0 then ''NF'' else '''' end end doc_fiscal,' +
    ' case when p.ncupom > 0 then p.ncupom else i.n_nf end ndoc_fiscal,i.nped ndoc_int,' +
    ' sum(i.VLTOT_PED_ITEM+I.RATEIO_ACRESC) as bruto,sum(i.RATEIO_DESC) as desconto,'+
    ' sum(i.QUANT_PED_ITEM*i.PCUST_MC) as custo,p.tipv as tipovenda,i.nitem,sum(i.VLTOT_PED_ITEM+I.RATEIO_ACRESC-i.RATEIO_DESC) as liquido '+
    ' from PEDVENDA_PROD i ' +
    ' inner join EMPRESA emp on i.cod_empresa = emp.cod_empresa ' +
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
    ' inner join produtos pr on i.grupo_prod = pr.grupo_prod and i.cod_prod = pr.cod_prod and i.cod_empresa = pr.cod_empresa ' +
    ' inner join GRUPOS GR on i.grupo_prod = gr.codigo_grup ' +
    ' left join SUB_GRUPO sb on coalesce(pr.sub_g_prod,0) = sb.codigo_subgr ' +
    ' inner join colaborador col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
    ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa ' +
    ' where (i.status is null or i.status = '''') ' +
    ' and dep.cod_dptocx in '+vcoddemo+' and '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+VempresasD+') '+
    ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) or (p.tipo = ''REQ'' and p.tipv in '+vTipoVendaREQ+')) '+
    ' group by empresa,dep.cod_dptocx,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal, ndoc_int '+
    ' union '+
    ' select emp.identificacao_emp as empresa,dep.cod_dptocx,s.desc_servico||''                    '' as grupo_prod,''OSS  '' as tipo,extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,'+
    ' s.desc_servico as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' case when i.n_nf > 0 then ''NF'' else case when p.ncupom > 0 then ''CP'' else case when p.num_nfeext > 0 then ''NF'' else '''' end end end doc_fiscal,' +
    ' case when i.n_nf > 0 then i.n_nf else case when p.ncupom > 0 then p.ncupom else p.num_nfeext end end ndoc_fiscal, i.nped ndoc_int, ' +
    ' sum(i.VALOR_TOT_SERV+coalesce(i.RATEIO_ACRESC,0)+coalesce(i.PRC_INT_SERV,0)) as bruto,'+
    ' sum(i.RATEIO_DESC) as desconto, 0 as custo,p.tipv as tipovenda,i.nitem,sum(i.VALOR_TOT_SERV+coalesce(i.RATEIO_ACRESC,0)+coalesce(i.PRC_INT_SERV,0)-coalesce(i.RATEIO_DESC,0)) as liquido '+
    ' from PEDVENDA_SERV i ' +
    ' inner join EMPRESA emp on i.cod_empresa = emp.cod_empresa ' +
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
    ' inner join TIPO_SERVICO s on i.cod_servico = s.cod_servico ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join COLABORADOR col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
    ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa '+
    ' where (i.status is null or i.status = '''') '+
    ' and dep.cod_dptocx in '+vcoddemo+ ' and '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+vempresasD+') '+
    ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) '+
    ' group by empresa,dep.cod_dptocx,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal, ndoc_int '+
    ' union '+
    ' select emp.identificacao_emp as empresa,dep.cod_dptocx,i.descr_servt||''                    '' as grupo_prod,''OST  '' as tipo,'+
    ' extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,i.descr_servt as descricao_prod,'+
    ' col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' case when p.num_nfeext > 0 then ''NF'' else '''' end doc_fiscal,' +
    ' p.num_nfeext ndoc_fiscal, i.nped ndoc_int,' +
    ' SUM(i.VL_SERVT) as bruto,'+
    ' SUM(0) as desconto, SUM(0) as custo,p.tipv as tipovenda,0 as nitem,sum(i.VL_SERVT) as liquido '+
    ' from PEDVENDA_SERV_TERC i '+
    ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa ' +
    ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
    ' where dep.cod_dptocx in '+vcoddemo+ ' and '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+vempresasD+') '+
    ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) ' +
    ' GROUP BY empresa,dep.cod_dptocx,grupo_prod,tipo,mes,ano, '+
    ' descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal, ndoc_int '+
    ' union '+
    ' select emp.identificacao_emp as empresa,dep.cod_dptocx,i.descricao||''                    '' as grupo_prod,''OSPT '' as tipo, '+
    ' extract(month from p.data_fech) as mes,extract(year from p.data_fech) as ano,i.descricao as descricao_prod, '+
    ' col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente, '+
    ' case when p.num_nfeext > 0 then ''NF'' else '''' end doc_fiscal, '+
    ' p.num_nfeext ndoc_fiscal, i.nped ndoc_int, '+
    ' SUM(i.VL_TOTAL) as bruto, '+
    ' SUM(0) as desconto, SUM(i.VLCUSTO_TOT) as custo,p.tipv as tipovenda,0 as nitem,sum(i.VL_TOTAL) as liquido '+
    ' from PEDVENDA_PROD_TERC i '+
    ' inner join empresa emp on i.cod_empresa = emp.cod_empresa '+
    ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa '+
    ' left join sub_grupo sb on sb.codigo_subgr = 0 '+
    ' inner join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa '+
    ' inner join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa '+
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao '+
    ' inner join depto dep on func.cod_depto = dep.cod_depto '+
    ' where dep.cod_dptocx in '+vcoddemo+ ' and '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+vempresasD+') '+
    ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) ' +
    ' GROUP BY empresa,dep.cod_dptocx,grupo_prod,tipo,mes,ano, '+
    ' descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal, ndoc_int '+
    ' union ' +
    //veiculos novos
  //  'select emp.identificacao_emp as empresa,vv.descricao||''-''||cast(ft.n_comando as char(10))||''         '' as grupo_prod,''VEI '' as tipo, '+
  //  'extract(month from ft.data_ven) as mes,extract(year from ft.data_ven) as ano,'+
  //  'vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,sum(ft.'+vcampoutilvndveic+') as bruto,0 as desconto,'+
  //  'sum((select first 1 (et.custo) from comprasmesesv4 et where '+
  //  'et.chassi = vn.chassiv and et.cod_empresa = vn.cod_empresa order by data_ch_nota)) '+
  //  'as custo,''V'' as tipovenda,0 as nitem,sum(ft.'+vcampoutilvndveic+') as liquido '+
  //  'from com_fat ft,mot_ven vn,sub_grupo sb,'+
  //  'TIPMODELO vv,colaborador col,empresa emp,clientes cl '+
  //  'where  sb.codigo_subgr = 0 and ft.tipo_venda_v = ''N'' and  '+vtppesq1+
  //  'and ft.natop_v <> 1552 and ft.natop_v <> 5552 and ft.natop_v <> 5409 and ft.natop_v <> 5913 and ft.natop_v <> 6913 and '+
  //  'ft.chassiv = vn.chassiv and ft.num_nota_v = vn.num_nota_v and ft.n_comando = vn.n_comando and '+
  //  'vn.versaov = vv.codigo and vn.cod_empresa = vv.cod_empresa and ft.cod_empresa = vn.cod_empresa and '+
  //  'ft.cod_empresa in ('+vempresasD+') and ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa and '+
  //  'ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa and ft.cod_empresa = emp.cod_empresa and ft.ativo = 1 '+
  //  'group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem '+
    ' select emp.identificacao_emp as empresa,dep.cod_dptocx,vv.descricao||''-''||cast(ft.n_comando as char(10))||''         '' as grupo_prod,''VEI '' as tipo, '+
    ' extract(month from ft.data_ven) as mes,extract(year from ft.data_ven) as ano,'+
    ' vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' case when ft.num_nota_v > 0 then ''NF'' else '''' end doc_fiscal, ft.num_nota_v ndoc_fiscal, ft.n_comando ndoc_int,' +
    ' sum(ft.'+vcampoutilvndveic+') as bruto,0 as desconto,'+
    ' sum((select first 1 (et.custo) from comprasmesesv40 et where ' +
    ' et.chassi = ft.chassiv and et.cod_empresa = ft.cod_empresa and et.status_uso = ft.tipo_venda_v order by et.data_ch_nota)) '+
    ' as custo,''V'' as tipovenda,0 as nitem,sum(ft.'+vcampoutilvndveic+') as liquido '+
    ' from com_fat ft' +
    ' inner join est_moto est on est.codigo = ft.cod_estmoto and est.chassi_c = ft.chassiv and est.cod_empresa = ft.cod_empresa' +
    ' inner join nat_op nt on nt.codigo_nop = ft.natop_v' +
    ' inner join tipmodelo vv on est.versaoest = vv.codigo and est.cod_empresa = vv.cod_empresa' +
    ' inner join colaborador col on ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa' +
    ' inner join funcoes func on func.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = func.cod_depto ' +
    ' inner join empresa emp on emp.cod_empresa = ft.cod_empresa' +
    ' inner join clientes cl on ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' WHERE ft.tipo_venda_v = ''N'' and dep.cod_dptocx in '+vcoddemo+' and '+vtppesq1+
    ' and ft.natureza = ''S'' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'')' +
    ' and coalesce(nt.faturamento, ''N'') = ''S'' ' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and ft.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ft.cod_empresa end) ') +
    ' in ('+vempresasD+') and ft.ativo = 1' +
    ' group by empresa,dep.cod_dptocx,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal, ndoc_int '+
    'union '+
    //veiculos usados
  //  'select emp.identificacao_emp as empresa,vv.descricao||''-''||cast(ft.n_comando as char(10))||''         '' as grupo_prod,''VEIU'' as tipo,'+
  //  'extract(month from ft.data_ven) as mes,extract(year from ft.data_ven) as ano,'+
  //  'vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,sum(ft.'+vcampoutilvndveic+') as bruto,0 as desconto,'+
  //  'sum(vn.vl_compra_us) as custo,''V'' as tipovenda,0 as nitem,sum(ft.valor_real) as liquido '+
  //  'from com_fat ft,mot_ven vn,sub_grupo sb,'+
  //  'TIPMODELO vv,colaborador col,empresa emp,clientes cl '+
  //  'WHERE  sb.codigo_subgr = 0 and ft.tipo_venda_v = ''U'' and '+vtppesq1+
  //  'and ft.natop_v <> 1552 and ft.natop_v <> 5552 and ft.natop_v <> 5409 and ft.natop_v <> 5913 and ft.natop_v <> 6913 and '+
  //  'ft.chassiv = vn.chassiv and ft.n_comando = vn.n_comando and '+
  //  'vn.versaov = vv.codigo and vn.cod_empresa = vv.cod_empresa and ft.cod_empresa = vn.cod_empresa and '+
  //  'ft.cod_empresa in ('+vempresasD+') and ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa and '+
  //  'ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa and ft.cod_empresa = emp.cod_empresa and ft.ativo = 1 '+
  //  'group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem '+
    ' select emp.identificacao_emp as empresa,dep.cod_dptocx,vv.descricao||''-''||cast(ft.n_comando as char(10))||''         '' as grupo_prod,''VEIU'' as tipo, '+
    ' extract(month from ft.data_ven) as mes,extract(year from ft.data_ven) as ano,'+
    ' vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' case when ft.num_nota_v > 0 then ''NF'' else '''' end doc_fiscal, ft.num_nota_v ndoc_fiscal, ft.n_comando ndoc_int,' +
    ' sum(ft.'+vcampoutilvndveic+') as bruto,0 as desconto,'+
    ' sum(case when coalesce(est.num_nota,0) > 0 then' +
    '       coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = ft.chassiv and et.cod_empresa = ft.cod_empresa and et.status_uso = ft.tipo_venda_v order by et.data_ch_nota desc), coalesce(est.preco_custo,0))' +
    '     else' +
    '       coalesce(est.preco_custo,0)' +
    '     end) '+
    ' as custo,''V'' as tipovenda,0 as nitem,sum(ft.'+vcampoutilvndveic+') as liquido '+
    ' from com_fat ft' +
    ' inner join est_moto est on est.codigo = ft.cod_estmoto and est.chassi_c = ft.chassiv and est.cod_empresa = ft.cod_empresa' +
    ' inner join nat_op nt on nt.codigo_nop = ft.natop_v' +
    ' inner join tipmodelo vv on est.versaoest = vv.codigo and est.cod_empresa = vv.cod_empresa' +
    ' inner join colaborador col on ft.covend_v = col.cod_vendedor and ft.cod_empresa = col.cod_empresa' +
    ' inner join funcoes func on func.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = func.cod_depto ' +
    ' inner join empresa emp on emp.cod_empresa = ft.cod_empresa' +
    ' inner join clientes cl on ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' WHERE ft.tipo_venda_v = ''U'' and dep.cod_dptocx in '+vcoddemo+' and '+vtppesq1+
    ' and ft.natureza = ''S'' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'')' +
    ' and coalesce(nt.faturamento, ''N'') = ''S'' ' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and ft.cod_empresa ', 
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ft.cod_empresa end) ') +
    ' in ('+vempresasD+') and ft.ativo = 1' +
    ' group by empresa,dep.cod_dptocx,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal, ndoc_int '+
    ' union '+
    ' select emp.identificacao_emp as empresa,0 cod_dptocx,c.descricao||''-''||cast(c.codseq_comissao as char(10))||''         '' as grupo_prod,'+
    ' c.tipo_reg as tipo,extract(month from c.data_em_nf) as mes,extract(year from c.data_em_nf) as ano,'+
    ' c.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' case when (c.num_nf_comissao > 0) then ''NF'' else '''' end doc_fiscal,' +
    ' c.num_nf_comissao ndoc_fiscal, c.codseq_comissao ndoc_int,' +
    ' sum(c.valor) as bruto,0 as desconto,'+
    ' 0 as custo,''V'' as tipovenda,0 as nitem,sum(c.valor) as liquido '+
    ' from COMISSAO_CONSORCIO c ' +
    ' inner join empresa emp on c.cod_empresa = emp.cod_empresa ' +
    ' inner join colaborador col on c.cod_vendedor = col.cod_vendedor and c.cod_empresa = col.cod_empresa ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join clientes cl on c.cod_cliente = cl.cod_cliente and c.cod_empresa = cl.cod_empresa ' +
    ' WHERE '+vtppesq2+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and c.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else c.cod_empresa end) ') +
    ' in ('+vempresasD+') and c.ativo = 1 '+
    ' group by empresa,cod_dptocx,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal, ndoc_int '+
    ' union '+
    ' select emp.identificacao_emp as empresa,dep.cod_dptocx,gr.descricao as grupo_prod,''DEVP'' as tipo,'+
    ' extract(month from p.data) as mes,extract(year from p.data) as ano,'+
    ' p.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' case when (p.num_nota_nfe > 0) then ''NF'' else '''' end doc_fiscal,' +
    ' p.num_nota_nfe ndoc_fiscal, p.sequencia  ndoc_int,' +
    ' sum((-1)*(P.VALOR*P.QUANT)) as bruto,'+
    ' sum(0) as desconto,sum((-1)*(P.QUANT*P.PCUST_MC)) as custo,''V'' as tipovenda,0 as nitem,sum((-1)*(P.VALOR*P.QUANT)) as liquido '+
    ' from DEVOLUCAO p ' +
    ' inner join GRUPOS GR on P.grupo_prod = gr.codigo_grup ' +
    ' inner join produtos pr on P.grupo_prod = pr.grupo_prod and P.cod_prod = pr.cod_prod and P.cod_empresa = pr.cod_empresa ' +
    ' left join SUB_GRUPO sb on coalesce(pr.sub_g_prod,0) = sb.codigo_subgr '+
    ' inner join EMPRESA emp on p.cod_empresa = emp.cod_empresa ' +
    ' inner join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
    ' left join clientes cl on p.cod_cliente = cl.cod_cliente and p.cod_empresa = cl.cod_empresa '+
    ' where dep.cod_dptocx in '+vcoddemo+ ' and ' +vtppesq3+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and p.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
    ' in ('+vempresasD+') '+
    ' group by empresa,dep.cod_dptocx,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal, ndoc_int '+
    ' union' +
    ' select emp.identificacao_emp as empresa,dep.cod_dptocx, vv.descricao||''-''||cast(nf.num_nf as char(10))||''         '' as grupo_prod,' +
    ' ''DEVV''||substring(nfiv.tipo_venda from 1 for 1) as tipo, extract(month from nf.data_lanc) as mes,extract(year from nf.data_lanc) as ano,' +
    ' vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' ''NF'' doc_fiscal, nf.num_nf ndoc_fiscal, nf.num_nf ndoc_int,' +
    ' (-1) * sum(nfi.valor_total) as bruto,' +
    ' (-1) * sum(0) as desconto,' +
    ' (-1) * sum(' +
    '   case when trim(nfiv.tipo_venda) = ''U'' then' +
    '     coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = nfiv.chassi' +
    '       and et.cod_empresa = nfiv.cod_empresa and et.status_uso = nfiv.tipo_venda order by et.data_ch_nota desc), 0)' +
    '   else' +
    '     coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = nfiv.chassi' +
    '       and et.cod_empresa = nfiv.cod_empresa and et.status_uso = nfiv.tipo_venda order by et.data_ch_nota), 0)' +
    '   end' +
    ' ) as custo,' +
    ' ''V'' as tipovenda, nfi.nitem, (-1) * sum(nfi.valor_total) as liquido' +
    ' from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
    ' inner join notafiscal_item_veiculo nfiv on nfiv.cod_nf = nfi.cod_nf and nfiv.cod_empresa = nfi.cod_empresa' +
    ' inner join tipmodelo vv on nfiv.versao = vv.codigo and nfiv.cod_empresa = vv.cod_empresa' +
    ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' inner join nat_op nt on nf.codigo_nop = nt.codigo_nop and nt.devolucao = ''S''' +
    ' inner join colaborador col on nf.cod_vendedor = col.cod_vendedor and nf.cod_empresa = col.cod_empresa' +
    ' inner join funcoes func on func.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = func.cod_depto ' +
    ' inner join empresa emp on emp.cod_empresa = nf.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' where nf.natureza_nf = ''E'' and nf.status = ''Fechada''' +
    ' and dep.cod_dptocx in '+vcoddemo+ ' and ' + vtppesq4 +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in ('+vempresasD+')' +
    ' group by empresa,dep.cod_dptocx,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,tipovenda,sub_grupo,nome_cliente,nitem,doc_fiscal,ndoc_fiscal,  ndoc_int ';
   datasetBI.Open;
   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('grupo_prod','Grupo Produto',dgpage);
  vFerCube.DefineFieldAsDimension('tipo','Tipo de Venda',dgRow);
  vFerCube.DefineFieldAsDimension('ANO','Ano Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('MES','Mês do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('descricao_prod','Descrição do Produto',dgPage);
  vFerCube.DefineFieldAsDimension('empresa','Nome Empresa',dgPage);
  vFerCube.DefineFieldAsDimension('nome_vendedor','Nome Vendedor',dgPage);
  vFerCube.DefineFieldAsDimension('tipovenda','Natureza de Venda',dgPage);
  vFerCube.DefineFieldAsDimension('sub_grupo','SubGrupo Produto',dgPage);
  vFerCube.DefineFieldAsDimension('nome_cliente','Cliente',dgPage);
  vFerCube.DefineFieldAsDimension('cod_dptocx', 'Dpto Finac.', dgPage);
  vFerCube.DefineFieldAsDimension('ndoc_int', 'Num Doc', dgPage);
  vFerCube.DefineFieldAsDimension('doc_fiscal', 'Doc Fiscal.', dgPage);
  vFerCube.DefineFieldAsDimension('ndoc_fiscal', 'Num Doc Fiscal.', dgPage);
  vFerCube.DefineFieldAsSummary('BRUTO');
  vFerCube.DefineFieldAsSummary('desconto');
  vFerCube.DefineFieldAsSummary('custo');
  vFerCube.DefineFieldAsSummary('liquido');
end;

function TVendasGestor.vendasBICNT(vempresasD: string; vFerCube: THierCube; pBalDre: string): boolean;
var
 vtppesq,vtppesq1,vtppesq2,vtppesq3,vtppesq4: string;
begin
  result:=true;
  vtppesq:='((nf.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and nf.data_lanc <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(nf.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and nf.data_lanc <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
  vtppesq1:='((cp.data >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and cp.data <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(cp.data >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and cp.data <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
  vtppesq2:='((ps.emissao_nfse >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and ps.emissao_nfse <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(ps.emissao_nfse >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and ps.emissao_nfse <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
  vtppesq3:='((pv.data_nfext >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and pv.data_nfext <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(pv.data_nfext >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and pv.data_nfext <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
  vtppesq4:='((c.data_em_nf >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and c.data_em_nf <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '(c.data_em_nf >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and c.data_em_nf <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';

//  try
   datasetBI.Close;
   datasetBI.SQL.text:=
     //notafiscal produtos
    ' select emp.identificacao_emp as empresa, nfi.grupo_prod,' +
    ' ''NFP'' || case when rtrim(nfi.tipo_ped) = ''OS'' then ''S'' else '''' end tipo,' +
    ' extract(month from nf.data_lanc) as mes,extract(year from nf.data_lanc) as ano,' +
    ' nfi.descricao_item descricao_prod, col.nome_vendedor, sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto,' +
    ' sum(coalesce(nfi.rateio_desconto,0)) desconto,' +
    ' sum(coalesce(nfi.quantidade,0) * coalesce(nfi.prec_cusm_prod,0)) custo,' +
    ' nfi.codigo_nop, nfi.nitem,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0) - coalesce(nfi.rateio_desconto,0)) liquido' +
    ' from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''P''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when coalesce(nfi.nped,0) > 0 then' +
    '     coalesce( (select first 1 cod_vendedor from pedvenda_prod pp where pp.nped = nfi.nped and pp.tipo = nfi.tipo_ped and pp.cod_empresa = nfi.cod_empresa and pp.nitem = nfi.nitem_ped), nf.cod_vendedor)' +
    '   else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' inner join empresa emp on emp.cod_empresa = nf.cod_empresa' +
    ' inner join produtos pr on pr.grupo_prod = nfi.grupo_prod and pr.cod_prod = nfi.cod_prod and pr.cod_empresa = nfi.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = coalesce(pr.sub_g_prod, 0)' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ')  +
    ' in (' + vempresasD + ')' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    ' union ' +
    //cupom fiscal de produtos
    ' select emp.identificacao_emp as empresa, cp2.grupo_prod,' +
    ' ''CP'' || case when cp2.prod_serv = ''S'' then ''S'' else' +
    ' case when rtrim(pv.tipo) = ''OS'' then ''PS'' else ''P'' end end tipo,' +
    ' extract(month from cp.data) as mes,extract(year from cp.data) as ano,' +
    ' cp2.descr_it descricao_prod, col.nome_vendedor, sb.descricao as sub_grupo, cl.nome_cliente,' +
    ' sum(coalesce(cp2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0)) bruto,' +
    ' sum(coalesce(cp2.rat_desc, 0) + coalesce(cp2.perc_desc,0)) desconto,' +
    ' sum( case when cp2.prod_serv = ''S'' then 0 else (coalesce(cp2.quantidade, 0) * coalesce(cp2.prec_cusm_prod, 0)) end ) custo,' +
    ' cp2.codigo_nop, cp2.nitem,' +
    ' sum(coalesce(cp2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0) -' +
    '  coalesce(cp2.rat_desc, 0) - coalesce(cp2.perc_desc,0) ) liquido' +
    ' from cupom cp' +
    ' inner join cupom2 cp2 on cp2.cod_terminal = cp.cod_terminal and cp2.nserieecf = cp.nserieecf' +
    '   and cp2.cod_empresa = cp.cod_empresa and cp2.cupom = cp.cupom and cp2.ordem = cp.registro' +
    ' inner join nat_op nop on nop.codigo_nop = cp2.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = cp2.cod_empresa and col.cod_vendedor = cp2.cod_vendedor' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' left join clientes cl on cl.cod_cliente = cp.cliente and cl.cod_empresa = cp.cod_empresa' +
    ' inner join empresa emp on emp.cod_empresa = cp.cod_empresa' +
    ' left join produtos pr on pr.grupo_prod = cp2.grupo_prod and pr.cod_prod = cp2.cod_prod and pr.cod_empresa = cp2.cod_empresa and cp2.prod_serv = ''P''' +
    ' left join sub_grupo sb on sb.codigo_subgr = coalesce(pr.sub_g_prod, 0)' +
    ' left join pedvenda pv on pv.nped = cp.ped and pv.nprevenda = cp.prevenda and pv.cod_empresa = cp.cod_empresa' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq1 +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and cp.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.cod_empresa end) ')  +
    ' in (' + vempresasD + ')' +
    ' and coalesce(cp.status_cp, '''') <> ''CANCELADO'' and coalesce(cp2.status_it, '''') <> ''CANCELADO''' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    ' union ' +
    //nf servicos tabela nota fiscal
    ' select emp.identificacao_emp as empresa, nfi.grupo_prod,' +
    ' ''NFS'' tipo,' +
    ' extract(month from nf.data_lanc) as mes,extract(year from nf.data_lanc) as ano,' +
    ' nfi.descricao_item descricao_prod, col.nome_vendedor, sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto,' +
    ' sum(coalesce(nfi.rateio_desconto,0)) desconto,' +
    ' sum(coalesce(nfi.quantidade,0) * coalesce(nfi.prec_cusm_prod,0)) custo,' +
    ' nfi.codigo_nop, nfi.nitem,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0) - coalesce(nfi.rateio_desconto,0)) liquido' +
    ' from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''S''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when coalesce(nfi.nped,0) > 0 then' +
    '     coalesce( (select first 1 cod_vendedor from pedvenda_serv ps where ps.nped = nfi.nped and ps.tipo = nfi.tipo_ped and ps.cod_empresa = nfi.cod_empresa and ps.nitem = nfi.nitem_ped), nf.cod_vendedor)' +
    '     else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' inner join empresa emp on emp.cod_empresa = nf.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    ' union ' +
    //nf servicos prefeitura pedvendaserv pelo sistema
    ' select emp.identificacao_emp as empresa, ps.desc_serv_ped ||'' - @''||ps.n_nf as grupo_prod,' +
    ' ''NFS'' tipo,' +
    ' extract(month from ps.emissao_nfse) as mes,extract(year from ps.emissao_nfse) as ano,' +
    ' ps.desc_serv_ped descricao_prod, col.nome_vendedor, sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' sum(coalesce(ps.valor_nfse,0) + coalesce(ps.irrf_servico,0) + coalesce(ps.pisrf_servico,0) + coalesce(ps.cofinsrf_servico,0) + coalesce(ps.csslrf_servico,0)) bruto,' +
    ' sum(0) desconto,' +
    ' sum(0) custo,' +
    ' ps.codigo_nop, 0 as nitem,' +
    ' sum(coalesce(ps.valor_nfse,0) + coalesce(ps.irrf_servico,0) + coalesce(ps.pisrf_servico,0) + coalesce(ps.cofinsrf_servico,0) + coalesce(ps.csslrf_servico,0)) liquido' +
    ' from pedvenda pv' +
    ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa' +
    ' inner join empresa emp on emp.cod_empresa = pv.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq2 +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ps.status_nfse = ''Autorizada''' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    ' union ' +
    // pedvenda_serv nf servicos externa digitada na ordem de servico o numero data e valor
    ' select emp.identificacao_emp as empresa, ps.desc_serv_ped ||'' - e''||pv.num_nfeext as grupo_prod,' +
    ' ''NFS'' tipo,' +
    ' extract(month from pv.data_nfext) as mes,extract(year from pv.data_nfext) as ano,' +
    ' ps.desc_serv_ped descricao_prod, col.nome_vendedor, sb.descricao as sub_grupo, cl.nome_cliente,' +
    ' sum(coalesce(ps.valor_tot_serv,0)) bruto,' +
    ' sum(coalesce(ps.rateio_desc,0)) as desconto,' +
    ' sum(0) as custo,' +
    ' ps.codigo_nop, 0 as nitem,' +
    ' sum(coalesce(ps.valor_tot_serv,0) - coalesce(ps.rateio_desc,0)) as liquido' +
    ' from pedvenda_serv ps' +
    ' inner join pedvenda pv on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto ' +
    ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa' +
    ' inner join empresa emp on emp.cod_empresa = pv.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq3 +
    ' and pv.num_nfeext > 0 and pv.tipo = ''OS''' +
    ' and coalesce(ps.status_nfse,'''') <> ''Autorizada'' and (coalesce(ps.n_nf, 0) = 0)' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    ' union ' +
    // pedvenda_serv_terc
    ' select emp.identificacao_emp as empresa, pt.descr_servt||'' - e''||pv.num_nfeext as grupo_prod,' +
    ' ''NFS'' tipo,' +    
    ' extract(month from pv.data_nfext) as mes,extract(year from pv.data_nfext) as ano,' +
    ' pt.descr_servt descricao_prod, col.nome_vendedor, sb.descricao as sub_grupo, cl.nome_cliente,' +
    ' sum(coalesce(pt.vl_servt,0)) bruto,' +
    ' sum(0) as desconto,' +
    ' sum(0) as custo,' +
    ' emp.cfop_pad_serv codigo_nop, 0 as nitem,' +
    ' sum(coalesce(pt.vl_servt,0)) liquido' +
    ' from pedvenda_serv_terc pt' +
    ' inner join pedvenda pv on pv.nped = pt.nped and pv.tipo = pt.tipo and pv.cod_empresa = pt.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = pv.cod_vendedor and col.cod_empresa = pv.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto ' +
    ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa' +
    ' inner join empresa emp on emp.cod_empresa = pv.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq3 +
    ' and pv.num_nfeext > 0 and pv.tipo = ''OS''' +
    ' and coalesce((select count(sss.nped) from pedvenda_serv sss where sss.nped = pt.nped and sss.tipo = pt.tipo' +
    ' and sss.cod_empresa = pt.cod_empresa ' +
    ' and coalesce(sss.status_nfse, '''') = ''Autorizada'' and coalesce(sss.lote_nfse,0) > 0 )  ,0) = 0' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    // pedvenda_serv_terc não tem documento fiscal
    ' union ' +
    //nf veiculos novos e usados
    ' select emp.identificacao_emp as empresa, vv.descricao||''-''||cast(nf.num_nf as char(10))||''         '' as grupo_prod,' +
    ' ''NFV''||substring(nfiv.tipo_venda from 1 for 1) as tipo, extract(month from nf.data_lanc) as mes,extract(year from nf.data_lanc) as ano,' +
    ' vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto,' +
    ' sum(coalesce(nfi.rateio_desconto,0)) desconto,' +
    ' sum(coalesce(nfi.quantidade,0) * coalesce(nfi.prec_cusm_prod,0)) custo,' +
    ' nfi.codigo_nop, nfi.nitem,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0) - coalesce(nfi.rateio_desconto,0)) liquido' +
    ' from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''V''' +
    ' inner join notafiscal_item_veiculo nfiv on nfiv.cod_nf = nfi.cod_nf and nfiv.cod_empresa = nfi.cod_empresa and nfiv.nitem = nfi.nitem' +
    ' inner join tipmodelo vv on nfiv.versao = vv.codigo and nfiv.cod_empresa = vv.cod_empresa' +
    ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when coalesce(nf.n_comando,0) > 0 then' +
    '     coalesce( (select first 1 cf.covend_v from com_fat cf where cf.n_comando = nf.n_comando and cf.cod_empresa = nf.cod_empresa), nf.cod_vendedor)' +
    '     else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' inner join empresa emp on emp.cod_empresa = nf.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq +
    vDadosIni.IfThen(pBalDre = 'D',
    	' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    ' union ' +
    //nf outras tabela nota fiscal
    ' select emp.identificacao_emp as empresa, nfi.num_fab_prod as grupo_prod,' +
    ' ''NFO'' tipo,' +
    ' extract(month from nf.data_lanc) as mes,extract(year from nf.data_lanc) as ano,' +
    ' nfi.descricao_item descricao_prod, col.nome_vendedor, sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto,' +
    ' sum(coalesce(nfi.rateio_desconto,0)) desconto,' +
    ' sum(coalesce(nfi.quantidade,0) * coalesce(nfi.prec_cusm_prod,0)) custo,' +
    ' nfi.codigo_nop, nfi.nitem,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0) - coalesce(nfi.rateio_desconto,0)) liquido' +
    ' from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''O''' +
    ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor = nf.cod_vendedor' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' inner join empresa emp on emp.cod_empresa = nf.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq +
    ' and nf.cod_empresa in (' + vempresasD + ')' +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    ' union '+
    ' select emp.identificacao_emp as empresa,c.descricao||''-''||cast(c.codseq_comissao as char(10))||''         '' as grupo_prod,'+
    ' c.tipo_reg as tipo,extract(month from c.data_em_nf) as mes,extract(year from c.data_em_nf) as ano,'+
    ' c.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,sum(c.valor) as bruto,0 as desconto,'+
    ' 0 as custo, 0 as codigo_nop,0 as nitem,sum(c.valor) as liquido '+
    ' from COMISSAO_CONSORCIO c ' +
    ' inner join empresa emp on c.cod_empresa = emp.cod_empresa ' +
    ' inner join colaborador col on c.cod_vendedor = col.cod_vendedor and c.cod_empresa = col.cod_empresa ' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0 ' +
    ' inner join clientes cl on c.cod_cliente = cl.cod_cliente and c.cod_empresa = cl.cod_empresa ' +
    ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
    ' inner join depto dep on func.cod_depto = dep.cod_depto '+
    ' WHERE dep.cod_dptocx in '+vcoddemo+ ' and '+vtppesq4+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and c.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else c.cod_empresa end) ') +
    ' in ('+vempresasD+') and c.ativo = 1 '+
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem '+
    ' union' +
    //devolucao de produtos
    ' select emp.identificacao_emp as empresa, nfi.grupo_prod, ''DEVNFP'' as tipo,' +
    ' extract(month from nf.data_lanc) as mes,extract(year from nf.data_lanc) as ano,' +
    ' nfi.descricao_item descricao_prod, col.nome_vendedor, sb.descricao as sub_grupo, cl.nome_cliente,' +
    ' (-1) * sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto,' +
    ' (-1) * sum(coalesce(nfi.rateio_desconto,0)) desconto,' +
    ' (-1) * sum(coalesce(nfi.quantidade,0) * coalesce(nfi.prec_cusm_prod,0)) custo,' +
    ' nfi.codigo_nop, nfi.nitem,' +
    ' (-1) * sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0) - coalesce(nfi.rateio_desconto,0)) liquido' +
    ' from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''P''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.devolucao = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when ((nfi.seq_devolucao > 0) and (nfi.seqid_devolucao > 0)) then' +
    '    coalesce((select first 1 cod_vendedor from devolucao dev where dev.sequencia = nfi.seq_devolucao and dev.seqid = nfi.seqid_devolucao and dev.cod_empresa = nfi.cod_empresa), nf.cod_vendedor)' +
    '   else' +
    '    coalesce((select first 1 cod_vendedor from devolucao dev where dev.cod_nf = nfi.cod_nf and dev.nitem_nf = nfi.nitem and dev.cod_empresa = nfi.cod_empresa and dev.nf_gerou = ''S''), nf.cod_devolucao)' +
    '   end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' inner join empresa emp on emp.cod_empresa = nf.cod_empresa' +
    ' inner join produtos pr on pr.grupo_prod = nfi.grupo_prod and pr.cod_prod = nfi.cod_prod and pr.cod_empresa = nfi.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = coalesce(pr.sub_g_prod, 0)' +
    ' where dep.cod_dptocx in ' + vcoddemo + ' and ' + vtppesq +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.emissao_propria = ''S'' and nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or' +
    ' (nf.emissao_propria = ''N'' and nf.modelo_nf = ''55'') or (nf.modelo_nf <> ''55'') ) and nf.status = ''Fechada'' and nf.natureza_nf = ''E''' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem' +
    ' union ' +
    //devolucao de veiculos
    ' select emp.identificacao_emp as empresa, vv.descricao||''-''||cast(nf.num_nf as char(10))||''         '' as grupo_prod,' +
    ' ''DEVV''||substring(nfiv.tipo_venda from 1 for 1) as tipo, extract(month from nf.data_lanc) as mes,extract(year from nf.data_lanc) as ano,' +
    ' vv.descricao as descricao_prod,col.nome_vendedor as nome_vendedor,sb.descricao as sub_grupo,cl.nome_cliente,' +
    ' (-1) * sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto,' +
    ' (-1) * sum(coalesce(nfi.rateio_desconto,0)) desconto,' +
    ' (-1) * sum(' +
    '   case when trim(nfiv.tipo_venda) = ''U'' then' +
    '     coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = nfiv.chassi' +
    '       and et.cod_empresa = nfiv.cod_empresa and et.status_uso = nfiv.tipo_venda order by et.data_ch_nota desc), 0)' +
    '   else' +
    '     coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = nfiv.chassi' +
    '       and et.cod_empresa = nfiv.cod_empresa and et.status_uso = nfiv.tipo_venda order by et.data_ch_nota), 0)' +
    '   end' +
    ' ) as custo,' +
    ' nfi.codigo_nop, nfi.nitem,' +
    ' (-1) * sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0) - coalesce(nfi.rateio_desconto,0)) liquido' +
    ' from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''V''' +
    ' inner join notafiscal_item_veiculo nfiv on nfiv.cod_nf = nfi.cod_nf and nfiv.cod_empresa = nfi.cod_empresa' +
    ' inner join tipmodelo vv on nfiv.versao = vv.codigo and nfiv.cod_empresa = vv.cod_empresa' +
    ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' inner join nat_op nt on nf.codigo_nop = nt.codigo_nop and nt.devolucao = ''S''' +
    ' inner join colaborador col on nf.cod_vendedor = col.cod_vendedor and nf.cod_empresa = col.cod_empresa' +
    ' inner join funcoes func on func.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = func.cod_depto ' +
    ' inner join empresa emp on emp.cod_empresa = nf.cod_empresa' +
    ' left join sub_grupo sb on sb.codigo_subgr = 0' +
    ' where nf.natureza_nf = ''E'' and nf.status = ''Fechada''' +
    ' and dep.cod_dptocx in '+vcoddemo+ ' and ' + vtppesq +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in ('+vempresasD+')' +
    ' group by empresa,grupo_prod,tipo,mes,ano, descricao_prod,nome_vendedor,codigo_nop,sub_grupo,nome_cliente,nitem';
   registraErro(datasetBI.SQL.Text);
   datasetBI.Open;
   datasetBI.FetchAll;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('grupo_prod','Grupo Produto',dgpage);
  vFerCube.DefineFieldAsDimension('tipo','Tipo de Venda',dgRow);
  vFerCube.DefineFieldAsDimension('ANO','Ano Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('MES','Mês do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('descricao_prod','Descrição do Produto',dgPage);
  vFerCube.DefineFieldAsDimension('empresa','Nome Empresa',dgPage);
  vFerCube.DefineFieldAsDimension('nome_vendedor','Nome Vendedor',dgPage);
  vFerCube.DefineFieldAsDimension('codigo_nop','CFOP',dgPage);
  vFerCube.DefineFieldAsDimension('sub_grupo','SubGrupo Produto',dgPage);
  vFerCube.DefineFieldAsDimension('nome_cliente','Cliente',dgPage);
  vFerCube.DefineFieldAsSummary('BRUTO');
  vFerCube.DefineFieldAsSummary('desconto');
  vFerCube.DefineFieldAsSummary('custo');
  vFerCube.DefineFieldAsSummary('liquido');
end;

function TVendasGestor.vendasGerais(vempresasD: string; pBalDre: string): boolean;
var
 i: integer;
 vtppesq: string;
 vvalconf: currency;
begin
 if vtippesq = '' then
 begin
   Application.MessageBox('Tipo de Pesquisa não fornecido!', 'Confirmação', MB_OK);
   Result:=false;
   Exit;
 end;

 if vtippesq = 'M' then
 begin
   if vanovendas = 0  then
   begin
     Application.MessageBox('Ano atual da pesquisa não fornecido para o tip ''M''!', 'Confirmação', MB_OK);
     Result:=false;
     exit;
   end;
   if vmesor = 0  then
   begin
     Application.MessageBox('Mês Original da pesquisa não fornecido para o tip ''M''!', 'Confirmação', MB_OK);
     Result:=false;
     exit;
   end;
   if vmesvendas = 0  then
   begin
     Application.MessageBox('Mês Original da pesquisa não fornecido para o tip ''M''!', 'Confirmação', MB_OK);
     Result:=false;
     exit;
   end;
 end
 else
 begin
   vmesor:=1;
   vmesvendas:=1;
   vanovendas:=1;
   if (DateToStr(vdat1) = ('01/01/2001')) and
   (DateToStr(vdat2) = ('01/01/2001')) then
   begin
     Application.MessageBox('Intervalos de Datas inválidos para pesquisa tipo ''I''!', 'Confirmação', MB_OK);
     Result:=false;
     exit;
   end;
 end;
 result:=true;
 for i := 0 to 13 do
 begin
  vbrutoat[i]:=0;
  vcustoat[i]:=0;
  vdescat[i]:=0;
  vbrutoatRat[i]:=0;
  vcustoatRat[i]:=0;
  vdescatRat[i]:=0;
  vdevat[i]:=0;
  vdevct[i]:=0;
 end;
 VendaporMod[0,0]:='REQ';
 VendaporMod[1,0]:='OSP';
 VendaporMod[2,0]:='OSS';
 VendaporMod[3,0]:='OST';
 VendaporMod[4,0]:='OSPT';
 VendaporMod[5,0]:='VEI';
 VendaporMod[6,0]:='VEIU';
 VendaporMod[7,0]:='CNS';
 VendaporMod[8,0]:='RETB';
 VendaporMod[9,0]:='DEVP';
 VendaporMod[10,0]:='DEVVN';
 VendaporMod[11,0]:='DEVVU';
 vDadosIni.progressoFuncao('','','Pesquisando vendas OS E REQUISIÇÕES mes: '+vDadosIni.StrZero(vmesvendas,2)+'/'+vdadosini.Strzero(vanovendas,4));
 if vtippesq = 'M' then
   vtppesq:='extract(month from p.data_fech) = '+inttostr(vmesvendas)+
  ' and extract(year from p.data_fech) = '+inttostr(vanovendas)
 else
   vtppesq:='p.data_fech >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
  ' and p.data_fech <= '+FormatDateTime('mm/dd/yyyy', vdat2);
  vtppesq := vtppesq + ' and p.status_ped = ''FECHADA'' '; 

 defineTipoVendas;

 dataSet.Close;
 dataSet.CommandText:=
 // Colocar aqui o progresso das ações....
  ' select p.tipo as tipo,SUM(i.VLTOT_PED_ITEM+I.RATEIO_ACRESC) as bruto,SUM(i.RATEIO_DESC) as desconto, ' +
  ' SUM(i.QUANT_PED_ITEM*i.PCUST_MC) as custo from PEDVENDA_PROD i ' +
  ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
  ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
  ' inner join colaborador col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa ' +
  ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
  ' inner join depto dep on func.cod_depto = dep.cod_depto '+
  ' where dep.cod_dptocx in '+vcoddemo+' and (i.status is null or i.status = '''') and '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and p.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
  ' in ('+VempresasD+') ' +
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) or (p.tipo = ''REQ'' and p.tipv in '+vTipoVendaREQ+')) ' +
  ' group by tipo '+
  ' union '+
  ' select ''OSS'' as tipo,SUM(i.VALOR_TOT_SERV+coalesce(i.RATEIO_ACRESC,0)+coalesce(i.PRC_INT_SERV,0)) as bruto,' +
  ' SUM(i.RATEIO_DESC) as desconto, 0 as custo from PEDVENDA_SERV i ' +
  ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
  ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
  ' inner join colaborador col on i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa  ' +
  ' inner join funcoes func on col.cod_funcao = func.cod_funcao  ' +
  ' inner join depto dep on func.cod_depto = dep.cod_depto '+
  ' where dep.cod_dptocx in '+vcoddemo+' and (i.status is null or i.status = '''') and '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and p.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
  ' in ('+vempresasD+') '+
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) ' +
  ' group by tipo '+
  ' union '+
  ' select ''OST'' as tipo,SUM(i.VL_SERVT) as bruto,SUM(0) as desconto, SUM(0) as custo '+
  ' from PEDVENDA_SERV_TERC i ' +
  ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
  ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa'+
  ' where '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and p.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
  ' in ('+vempresasD+') '+
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) ' +
  ' GROUP BY tipo ' +
  ' union ' +
  ' select ''OSPT'' as tipo,SUM(i.VL_TOTAL) as bruto,SUM(0) as desconto, SUM(i.VLCUSTO_TOT) as custo '+
  ' from PEDVENDA_PROD_TERC i '+
  ' inner join empresa emp on i.cod_empresa = emp.cod_empresa '+
  ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa '+
  ' where '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and p.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
  ' in ('+vempresasD+') '+
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) ' +
  ' GROUP BY tipo ';
 dataSet.Open;
 i:=0;
 vDadosIni.progressoFuncao('','','Somando vendas Produtos, Serviços, Serviços de Terceiro e Produtos de Terceiro');
 while not dataSet.Eof do
 begin
  if trim(dataset.FieldByName('tipo').AsString) = 'REQ' then
   i:=0
  else if trim(dataset.FieldByName('tipo').AsString) = 'OS' then
   i:=1
  else if trim(dataset.FieldByName('tipo').AsString) = 'OSS' then
   i:=2
  else if trim(dataset.FieldByName('tipo').AsString) = 'OST' then
   i:=3
  else if trim(dataset.FieldByName('tipo').AsString) = 'OSPT' then
   i:=4;
  if vmesor = vmesvendas then
  begin
   VendaporMod[i,1]:=dataset.FieldByName('bruto').AsString;
   VendaporMod[i,2]:=dataset.FieldByName('desconto').AsString;
   VendaporMod[i,3]:=dataset.FieldByName('custo').AsString;
  end;

  vbrutoat[i]:=vbrutoat[i]+dataset.FieldByName('bruto').ascurrency;
  vcustoat[i]:=vcustoat[i]+dataset.FieldByName('custo').AsCurrency;
  vdescat[i]:=vdescat[i]+dataset.FieldByName('desconto').AsCurrency;

  VendaporMod[i,4]:=currtostr(strtocurr(VendaporMod[i,4])+dataset.FieldByName('bruto').ascurrency);
  VendaporMod[i,5]:=currtostr(strtocurr(VendaporMod[i,5])+dataset.FieldByName('desconto').ascurrency);
  VendaporMod[i,6]:=CurrToStr(strtocurr(VendaporMod[i,6])+dataset.FieldByName('custo').ascurrency);
  dataset.next;
 end;
 // Verificar o valor de venda geral para efeito de Rateio
 dataSet.Close;
 dataSet.CommandText:=
   // Colocar aqui o progresso das ações....
  ' select p.tipo as tipo,SUM(i.VLTOT_PED_ITEM+I.RATEIO_ACRESC) as bruto,SUM(i.RATEIO_DESC) as desconto, ' +
  ' SUM(i.QUANT_PED_ITEM*i.PCUST_MC) as custo from PEDVENDA_PROD i ' +
  ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
  ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa'+
  ' where (i.status is null or i.status = '''') and '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and p.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
  ' in ('+VempresasD+') '+
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) or (p.tipo = ''REQ'' and p.tipv in '+vTipoVendaREQ+')) ' +
  ' group by tipo '+
  ' union '+
  ' select ''OSS'' as tipo,SUM(i.VALOR_TOT_SERV+coalesce(i.RATEIO_ACRESC,0)+coalesce(i.PRC_INT_SERV,0)) as bruto,' +
  ' SUM(i.RATEIO_DESC) as desconto, 0 as custo from PEDVENDA_SERV i ' +
  ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
  ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
  ' where (i.status is null or i.status = '''') and '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and p.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
  ' in ('+vempresasD+') '+
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) group by tipo '+
  ' union '+
  ' select ''OST'' as tipo,SUM(i.VL_SERVT) as bruto,SUM(0) as desconto, SUM(0) as custo '+
  ' from PEDVENDA_SERV_TERC i ' +
  ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
  ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
  ' where '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and p.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
  ' in ('+vempresasD+') ' +
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) ' +
  ' GROUP BY tipo' +
  ' union ' +
  ' select ''OSPT'' as tipo,SUM(i.VL_TOTAL) as bruto,SUM(0) as desconto, SUM(i.VLCUSTO_TOT) as custo ' +
  ' from PEDVENDA_PROD_TERC i ' +
  ' inner join empresa emp on i.cod_empresa = emp.cod_empresa ' +
  ' inner join PEDVENDA p on i.nped = p.nped and i.tipo = p.tipo and i.cod_empresa = p.cod_empresa ' +
  ' where '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and p.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else p.cod_empresa end) ') +
  ' in ('+vempresasD+') ' +
  ' and ((p.tipo = ''OS'' and (p.tipo_os in '+vTipoVendaOS+')) ) ' +
  ' GROUP BY tipo ';
 dataSet.Open;
 i:=0;
 vDadosIni.progressoFuncao('','','Somando vendas Produtos, Serviços, Serviços de Terceiro e Produtos de Terceiro');
 while not dataSet.Eof do
 begin
  if trim(dataset.FieldByName('tipo').AsString) = 'REQ' then
   i:=0
  else if trim(dataset.FieldByName('tipo').AsString) = 'OS' then
   i:=1
  else if trim(dataset.FieldByName('tipo').AsString) = 'OSS' then
   i:=2
  else if trim(dataset.FieldByName('tipo').AsString) = 'OST' then
   i:=3
  else if trim(dataset.FieldByName('tipo').AsString) = 'OSPT' then
   i:=4;
  vbrutoatrat[i]:=vbrutoatRat[i]+dataset.FieldByName('bruto').ascurrency;
  vcustoatRat[i]:=vcustoatRat[i]+dataset.FieldByName('custo').AsCurrency;
  vdescatRat[i]:=vdescatRat[i]+dataset.FieldByName('desconto').AsCurrency;
  dataset.next;
 end;   
 vVendasCNT := '';

 vDadosIni.progressoFuncao('','','Pesquisando Venda de Veículos Novos');
  if vtippesq = 'M' then
   vtppesq:='extract(month from ft.data_ven) = '+inttostr(vmesvendas)+
  ' and extract(year from ft.data_ven) = '+inttostr(vanovendas)
  else
   vtppesq:='ft.data_ven >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
  ' and ft.data_ven <= '+FormatDateTime('mm/dd/yyyy', vdat2);
 dataset.Close;
 dataset.CommandText:=' select sum(ft.'+vcampoutilvndveic+') as bruto, ' +
   ' sum(coalesce((select first 1 (et.custo) from comprasmesesv40 et ' +
   ' 		where et.chassi = ft.chassiv and et.cod_empresa = ft.cod_empresa ' +
   '		and et.status_uso = ft.tipo_venda_v order by data_ch_nota),0)) as custo '+
   ' from com_fat ft ' +
   ' inner join empresa emp on ft.cod_empresa = emp.cod_empresa ' +
   ' inner join nat_op nt on nt.codigo_nop = ft.natop_v' +
   ' where ft.tipo_venda_v = ''N'' and '+vtppesq+
   ' and ft.natureza = ''S'' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'')' +
   ' and coalesce(nt.faturamento, ''N'') = ''S'' ' +
   vDadosIni.IfThen(pBalDre = 'D',
	   ' and ft.cod_empresa ',
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ft.cod_empresa end) ') +
   ' in ('+vempresasD+') and ft.ativo = 1 ';
// dataset.CommandText:='select sum(ft.'+vcampoutilvndveic+') as bruto,sum((select first 1 (et.custo) '+
// 'from comprasmesesv4 et where '+
// 'et.chassi = vn.chassiv and et.cod_empresa = vn.cod_empresa order by data_ch_nota)) as custo '+
// 'from com_fat ft,mot_ven vn,' +
// 'TIPMODELO vv ' +
// 'WHERE  ft.tipo_venda_v = ''N'' and '+vtppesq+
// ' and ft.natop_v <> 1552 and ft.natop_v <> 5552 and ft.natop_v <> 5409 and ft.natop_v <> 5913 and ft.natop_v <> 6913 and ' +
// 'ft.chassiv = vn.chassiv and ft.num_nota_v = vn.num_nota_v and ft.n_comando = vn.n_comando and ' +
// ' vn.versaov = vv.codigo and vn.cod_empresa = vv.cod_empresa and ft.cod_empresa = vn.cod_empresa and '+
// 'ft.cod_empresa in ('+vempresasD+') and ft.ativo = 1 ';
 dataSet.open;
 if dataSet.FieldByName('bruto').AsString <> '' then
 begin
  i:=5;
  vDadosIni.progressoFuncao('','','Somando Venda de Veículos Novos');
  if vmesor =  vmesvendas then
  begin
  VendaporMod[i,1]:=dataSet.FieldByName('bruto').AsString;
  VendaporMod[i,2]:='0';
  VendaporMod[i,3]:=dataset.FieldByName('custo').asstring;
  end;
  vbrutoat[i]:=vbrutoat[i]+dataset.FieldByName('bruto').ascurrency;
  vcustoat[i]:=vcustoat[i]+dataset.FieldByName('custo').AsCurrency;
  vdescat[i]:=vdescat[i]+0;

  vbrutoatrat[i]:=vbrutoatRat[i]+dataset.FieldByName('bruto').ascurrency;
  vcustoatRat[i]:=vcustoatRat[i]+dataset.FieldByName('custo').AsCurrency;
  vdescatRat[i]:=vdescatRat[i]+0;

  VendaporMod[i,4]:=strtocurr(VendaporMod[i,4])+dataSet.FieldByName('bruto').Value;
  VendaporMod[i,5]:='0';
  VendaporMod[i,6]:=strtocurr(VendaporMod[i,6])+dataSet.FieldByName('custo').Value;
 end;
 vDadosIni.progressoFuncao('','','Pesquisando Venda de Veículos Usados');

 dataSet.Close;
 ///  o custo quando usado é buscado pelo pelo primeiro registro,
 ///  pois o usado pode passar varias vezes na empresa e ter custos diferentes a cada nova entrada,
 ///  caso nao tenha custo vindo de entradas(comprasmeses40) no coalesce ele usa o custo informado no cadastro do veiculo
 ///  tambem se o veiculo nao teve entrada de nota pelo teste "coalesce(est.num_nota,0) > 0" entao usa o custo do cadastro
 dataSet.CommandText:='select sum(ft.'+vcampoutilvndveic+') as bruto,' +
   ' sum(case when coalesce(est.num_nota,0) > 0 then' +
   '       coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = ft.chassiv and et.cod_empresa = ft.cod_empresa and et.status_uso = ft.tipo_venda_v order by data_ch_nota desc), coalesce(est.preco_custo,0))' +
   '     else' +
   '       coalesce(est.preco_custo,0)' +
   '     end) as custo ' +
   ' from com_fat ft ' +
   ' inner join empresa emp on ft.cod_empresa = emp.cod_empresa ' +
   ' left join est_moto est on est.codigo = ft.cod_estmoto and est.chassi_c = ft.chassiv and est.cod_empresa = ft.cod_empresa' +
   ' inner join nat_op nt on nt.codigo_nop = ft.natop_v' +
   ' WHERE  ft.tipo_venda_v = ''U'' and '+vtppesq+
   ' and ft.natureza = ''S'' and (coalesce(trim(ft.status_v), '''') = ''FECHADO'')' +
   ' and coalesce(nt.faturamento, ''N'') = ''S'' ' +
   vDadosIni.IfThen(pBalDre = 'D',
	   ' and ft.cod_empresa ',
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ft.cod_empresa end) ') +
   ' in ('+vempresasD+') and ft.ativo = 1 ';
// dataSet.CommandText:='select sum(ft.'+vcampoutilvndveic+') as bruto,sum(vn.vl_compra_us) as custo '+
//        'from com_fat ft,mot_ven vn,' +
//        'TIPMODELO vv ' +
//        'WHERE  ft.tipo_venda_v = ''U'' and '+vtppesq+
//        ' and ft.natop_v <> 1552 and ft.natop_v <> 5552 and ft.natop_v <> 5409 and ft.natop_v <> 5913 and ft.natop_v <> 6913 and ' +
//        'ft.chassiv = vn.chassiv and ft.n_comando = vn.n_comando and ' +
//        'vn.versaov = vv.codigo and vn.cod_empresa = vv.cod_empresa and ft.cod_empresa = vn.cod_empresa and '+
//        'ft.cod_empresa in ('+vempresasD+') and ft.ativo = 1 ';
 dataset.open;
 if dataset.FieldByName('bruto').AsString <> '' then
 begin
  i:=6;
  vDadosIni.progressoFuncao('','','Somando Venda de Veículos Usados');
  if vmesor = vmesvendas then
  begin
  	VendaporMod[i,1]:=dataset.FieldByName('bruto').AsString;
  	VendaporMod[i,2]:='0';
  	VendaporMod[i,3]:=dataset.FieldByName('custo').asstring;
  end;

  vbrutoat[i]:=vbrutoat[i]+dataset.FieldByName('bruto').ascurrency;
  vcustoat[i]:=vcustoat[i]+dataset.FieldByName('custo').AsCurrency;
  vdescat[i]:=vdescat[i]+0;

  vbrutoatRat[i]:=vbrutoatRat[i]+dataset.FieldByName('bruto').ascurrency;
  vcustoatRat[i]:=vcustoatRat[i]+dataset.FieldByName('custo').AsCurrency;
  vdescatRat[i]:=vdescatRat[i]+0;

  VendaporMod[i,4]:=strtocurr(VendaporMod[i,4])+dataset.FieldByName('bruto').Value;
  VendaporMod[i,5]:='0';
  VendaporMod[i,6]:=strtocurr(VendaporMod[i,6])+dataset.FieldByName('custo').Value;
  vDadosIni.progressoFuncao('','','Pesquisando Vendas Consórcio e Retornos de bancos');
 end;
  if vtippesq = 'M' then
   vtppesq:=' extract(month from cc.DATA_EM_NF) = '+inttostr(vmesvendas)+
  ' and extract(year from cc.DATA_EM_NF) = '+inttostr(vanovendas)
  else
   vtppesq:=' cc.DATA_EM_NF >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
  ' and cc.DATA_EM_NF <= '+FormatDateTime('mm/dd/yyyy', vdat2);
 dataSet.Close;
 dataSet.CommandText:=' select cc.tipo_reg, sum(cc.valor) as bruto,sum(0) as custo,sum(0) as desconto '+
 	'	from COMISSAO_CONSORCIO cc ' +
 	' inner join empresa emp on cc.cod_empresa = emp.cod_empresa ' +
  ' WHERE  '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and cc.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cc.cod_empresa end) ') +
  ' in ('+vempresasD+') and cc.ativo = 1 ' +
  ' group by cc.tipo_reg';
 dataSet.open;
 while not dataset.Eof do
 begin
  if trim(dataset.FieldByName('tipo_reg').AsString) = 'CNS' then
   i:=7
  else if trim(dataset.FieldByName('tipo_reg').AsString) = 'RETB' then
   i:=8;
  if vmesor = vmesvendas then
  begin      
   VendaporMod[i,1]:=dataset.FieldByName('bruto').AsString;
   VendaporMod[i,2]:=dataset.FieldByName('desconto').AsString;
   VendaporMod[i,3]:=dataset.FieldByName('custo').AsString;
  end;

  vbrutoat[i]:=vbrutoat[i]+dataset.FieldByName('bruto').ascurrency;
  vcustoat[i]:=vcustoat[i]+dataset.FieldByName('custo').AsCurrency;
  vdescat[i]:=vdescat[i]+dataset.FieldByName('desconto').AsCurrency;

  vbrutoatRat[i]:=vbrutoatRat[i]+dataset.FieldByName('bruto').ascurrency;
  vcustoatRat[i]:=vcustoatRat[i]+dataset.FieldByName('custo').AsCurrency;
  vdescatRat[i]:=vdescatRat[i]+dataset.FieldByName('desconto').AsCurrency;

  VendaporMod[i,4]:=strtocurr(VendaporMod[i,4])+dataSet.FieldByName('bruto').Value;
  VendaporMod[i,5]:=strtocurr(VendaporMod[i,5])+dataset.FieldByName('desconto').Value;
  VendaporMod[i,6]:=strtocurr(VendaporMod[i,6])+dataSet.FieldByName('custo').Value;
  dataset.next;
 end;
 vDadosIni.progressoFuncao('','','Pesquisando Devolução');
 i:=9;
 if vtippesq = 'M' then
   vtppesq:='extract(month from dv.data) = '+inttostr(vmesvendas)+
  	' and extract(year from dv.data) = '+inttostr(vanovendas)
 else
   vtppesq:='dv.data >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
  	' and dv.data <= '+FormatDateTime('mm/dd/yyyy', vdat2);
 dataSet.close;
 dataset.CommandText:= 'select sum(dv.Quant*dv.valor) as bruto, ' +
 	' sum(dv.quant*dv.pcust_mc) as custo from devolucao dv ' +
  ' inner join empresa emp on dv.cod_empresa = emp.cod_empresa ' +
  ' inner join colaborador col on dv.cod_vendedor = col.cod_vendedor and dv.cod_empresa = col.cod_empresa ' +
  ' inner join funcoes func on col.cod_funcao = func.cod_funcao ' +
  ' inner join depto dep on func.cod_depto = dep.cod_depto ' +
  ' where '+vtppesq +
  vDadosIni.IfThen(pBalDre = 'D',
	  ' and dv.cod_empresa ',
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else dv.cod_empresa end) ') +
  ' in ('+vempresasD+') and dv.ativo = 1 and dep.cod_dptocx in '+vcoddemo;
 //i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa and col.cod_funcao = func.cod_funcao and func.cod_depto = dep.cod_depto '+
//  'and dep.cod_dptocx in '+vcoddemo+'
 dataset.open;
 if dataset.FieldByName('bruto').AsString <> '' then
 begin
   if vmesor = vmesvendas then
   begin
    VendaporMod[i,1]:=dataset.FieldByName('bruto').AsString;
    VendaporMod[i,2]:='0';
    VendaporMod[i,3]:=dataset.FieldByName('custo').AsString;
   end;
   vdevat[i]:=vdevat[i]+dataset.FieldByName('bruto').AsCurrency;
   vdevct[i]:=vdevct[i]+dataset.FieldByName('custo').AsCurrency;
   VendaporMod[i,4]:=strtocurr(VendaporMod[i,4])+dataset.FieldByName('bruto').Value;
   VendaporMod[i,5]:='0';
   VendaporMod[i,6]:=strtocurr(VendaporMod[i,6])+dataset.FieldByName('custo').Value;
 end;
 // Fazer aqui a Devolução de Veiculos
  if vtippesq = 'M' then
   vtppesq:='extract(month from NOTAFISCAL.DATA_LANC) = '+inttostr(vmesvendas)+
  ' and extract(year from NOTAFISCAL.DATA_LANC) = '+inttostr(vanovendas)
  else
   vtppesq:='NOTAFISCAL.DATA_LANC >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
  ' and NOTAFISCAL.DATA_LANC <= '+FormatDateTime('mm/dd/yyyy', vdat2);
 dataSet.close;
 dataset.CommandText:='SELECT NOTAFISCAL_ITEM_VEICULO.tipo_venda, ' +
   ' sum(NOTAFISCAL_ITEM.valor_total) as bruto, ' +
   ' sum(' +
   ' case when trim(NOTAFISCAL_ITEM_VEICULO.tipo_venda) = ''U'' then' +
   '    coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = NOTAFISCAL_ITEM_VEICULO.chassi' +
   '      and et.cod_empresa = NOTAFISCAL_ITEM_VEICULO.cod_empresa and et.status_uso = NOTAFISCAL_ITEM_VEICULO.tipo_venda order by et.data_ch_nota desc), 0)' +
   '   else' +
   '     coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = NOTAFISCAL_ITEM_VEICULO.chassi' +
   '     and et.cod_empresa = NOTAFISCAL_ITEM_VEICULO.cod_empresa and et.status_uso = NOTAFISCAL_ITEM_VEICULO.tipo_venda order by et.data_ch_nota), 0)' +
   '   end' +
  ' ) as custo '+
  ' FROM NOTAFISCAL ' +
  ' INNER JOIN EMPRESA EMP ON NOTAFISCAL.COD_EMPRESA = EMP.COD_EMPRESA ' +
  ' INNER JOIN NAT_OP ON NOTAFISCAL.CODIGO_NOP = NAT_OP.CODIGO_NOP ' +
  ' INNER JOIN NOTAFISCAL_ITEM_VEICULO ON NOTAFISCAL.COD_NF = NOTAFISCAL_ITEM_VEICULO.COD_NF ' +
  ' 		AND NOTAFISCAL.COD_EMPRESA = NOTAFISCAL_ITEM_VEICULO.COD_EMPRESA ' +
  ' INNER JOIN NOTAFISCAL_ITEM ON NOTAFISCAL_ITEM.COD_NF = NOTAFISCAL_ITEM_VEICULO.COD_NF ' +
  '			AND NOTAFISCAL_ITEM.COD_EMPRESA = NOTAFISCAL_ITEM_VEICULO.COD_EMPRESA '+
  '			AND NOTAFISCAL_ITEM.NITEM = NOTAFISCAL_ITEM_VEICULO.NITEM ' +
  ' INNER JOIN COLABORADOR ON NOTAFISCAL.COD_VENDEDOR = COLABORADOR.COD_VENDEDOR ' +
  '			AND NOTAFISCAL.COD_EMPRESA = COLABORADOR.COD_EMPRESA ' +
  ' INNER JOIN FUNCOES ON COLABORADOR.COD_FUNCAO = FUNCOES.COD_FUNCAO '+
  ' INNER JOIN DEPTO ON FUNCOES.COD_DEPTO = DEPTO.COD_DEPTO '+
  ' WHERE NOTAFISCAL.NATUREZA_NF = ''E'' AND NOTAFISCAL.STATUS = ''Fechada'' AND '+vtppesq+
  vDadosIni.IfThen(pBalDre = 'D',
	  ' AND NOTAFISCAL.COD_EMPRESA ',
    ' AND (CASE WHEN(EMP.FINANCEIRO_UNIFICADO = ''S'') THEN EMP.CODIGO_UNIFICADORA ELSE NOTAFISCAL.COD_EMPRESA END) ') +
  ' in ('+vempresasD+') AND NAT_OP.DEVOLUCAO = ''S'' AND DEPTO.COD_DPTOCX IN '+vcoddemo +
  ' group by NOTAFISCAL_ITEM_VEICULO.tipo_venda ';
 dataset.open;
 while not dataset.Eof do
 begin
   if trim(dataset.FieldByName('tipo_venda').AsString) = 'U' then
     i:=11
   else
     i:=10;
   if dataset.FieldByName('bruto').AsString <> '' then
   begin
     if vmesor = vmesvendas then
     begin
      VendaporMod[i,1]:=dataset.FieldByName('bruto').AsString;
      VendaporMod[i,2]:='0';
      VendaporMod[i,3]:=dataset.FieldByName('custo').AsString;
     end;
     vdevat[i]:=vdevat[i]+dataset.FieldByName('bruto').AsCurrency;
     vdevct[i]:=vdevct[i]+dataset.FieldByName('custo').AsCurrency;
     VendaporMod[i,4]:=strtocurr(VendaporMod[i,4])+dataset.FieldByName('bruto').Value;
     VendaporMod[i,5]:='0';
     VendaporMod[i,6]:=strtocurr(VendaporMod[i,6])+dataset.FieldByName('custo').Value;
   end;

   dataset.Next;
 end;
 ///
 vvalconf:=0;
 vvendageral:=0;
 for i := 0 to 11 do
 begin
  vvalconf:=vvalconf+vbrutoat[i];
  vvendageral:=vvendageral+vbrutoat[i];
 end;
 if vvalconf = 0 then
 begin
  Result:=false;
//  VendaporMod[0,1]:='0,01';
//  vbrutoat[0]:=0.01;
 end;
 dataset.close;
end;

function TVendasGestor.vendasGeraisCNT(vempresasD: string; pBalDre: string): boolean;
var
  i: integer;
  vtppesq: string;
  vvalconf: currency;
  j: Integer;
begin
  if vtippesq = '' then
  begin
    Application.MessageBox('Tipo de Pesquisa não fornecido!', 'Confirmação', MB_OK);
    Result:=false;
    Exit;
  end;

  if vtippesq = 'M' then
  begin
    if vanovendas = 0  then
    begin
      Application.MessageBox('Ano atual da pesquisa não fornecido para o tip ''M''!', 'Confirmação', MB_OK);
      Result:=false;
      exit;
    end;
    if vmesor = 0  then
    begin
      Application.MessageBox('Mês Original da pesquisa não fornecido para o tip ''M''!', 'Confirmação', MB_OK);
      Result:=false;
      exit;
    end;
    if vmesvendas = 0  then
    begin
      Application.MessageBox('Mês Original da pesquisa não fornecido para o tip ''M''!', 'Confirmação', MB_OK);
      Result:=false;
      exit;
    end;
  end
  else
  begin
    vmesor:=1;
    vmesvendas:=1;
    vanovendas:=1;
    if (DateToStr(vdat1) = ('01/01/2001')) and (DateToStr(vdat2) = ('01/01/2001')) then
    begin
      Application.MessageBox('Intervalos de Datas inválidos para pesquisa tipo ''I''!', 'Confirmação', MB_OK);
      Result:=false;
      exit;
    end;
  end;

  result:=true;

  for i := 0 to 13 do
  begin
    vbrutoat[i]:=0;
    vcustoat[i]:=0;
    vdescat[i]:=0;
    vbrutoatRat[i]:=0;
    vcustoatRat[i]:=0;
    vdescatRat[i]:=0;
    vdevat[i]:=0;
    vdevct[i]:=0;
  end;
  VendaporModCNT[0,0]:='NFP'; //Nota Fiscal de Produtos
  VendaporModCNT[1,0]:='CPP'; //Cupom Fiscal de Produtos
  VendaporModCNT[2,0]:='NFS'; // Nota Fiscal de Servicos
  VendaporModCNT[3,0]:='CPS'; //Cupom Fiscal de Servicos
  VendaporModCNT[4,0]:='NFVN'; // Nota Fiscal de Veiculos Novos
  VendaporModCNT[5,0]:='NFVU'; // Nota Fiscal de Veiculos Usados
  VendaporModCNT[6,0]:='CNS';  //
  VendaporModCNT[7,0]:='RETB'; // Retorno de Banco
  VendaporModCNT[8,0]:='DEVNFP'; //Devolucao de Produtos
  VendaporModCNT[9,0]:='DEVNFVN'; //Devolucao de Veiculos Novos
  VendaporModCNT[10,0]:='DEVNFVU';//Devolucao de Veiculos Usados
  VendaporModCNT[11,0]:='NFO';//Nota Fiscal Outras
  VendaporModCNT[12,0]:='NFPS';//Produtos usados em servicos na notafiscal de produtos
  VendaporModCNT[13,0]:='CPPS';//Produtos usados em servicos no cupom fiscal

  if vmesor = vmesvendas then
    for I := 0 to 13 do
      for j := 1 to 3 do
        VendaporModCNT[I,j] := '0';

  vDadosIni.progressoFuncao('','','Pesquisando notas fiscais e cupons fiscais mes: '+vDadosIni.StrZero(vmesvendas,2)+'/'+vdadosini.Strzero(vanovendas,4));
  if vtippesq = 'M' then
    vtppesq:='extract(month from nf.data_lanc) = '+inttostr(vmesvendas)+
      ' and extract(year from nf.data_lanc) = '+inttostr(vanovendas)
  else
    vtppesq:='nf.data_lanc >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
      ' and nf.data_lanc <= '+FormatDateTime('mm/dd/yyyy', vdat2);

  dataSet.Close;
  dataSet.CommandText:=
    //nf produtos
    'select ''NFP'' || case when rtrim(nfi.tipo_ped) = ''OS'' then ''S'' else '''' end tipo,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''P''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    ' case when coalesce(nfi.nped,0) > 0 then' +
    ' coalesce( (select first 1 cod_vendedor from pedvenda_prod pp where pp.nped = nfi.nped and pp.tipo = nfi.tipo_ped and pp.cod_empresa = nfi.cod_empresa and pp.nitem = nfi.nitem_ped), nf.cod_vendedor)' +
    ' else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vcoddemo +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    vDadosIni.IfThen(pBalDre = 'D',
    	' and nf.cod_empresa ',
	    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by 1' +
    ' union ' +
    //cupom fiscal de produtos
    ' select ''CP'' || case when cp2.prod_serv = ''S'' then ''S'' else' +
    ' case when rtrim(pv.tipo) = ''OS'' then ''PS'' else ''P'' end end ,' +
    ' sum(coalesce(cp2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0)) bruto,' +
    ' sum(coalesce(cp2.rat_desc, 0) + coalesce(cp2.perc_desc,0)) desconto,' +
    ' sum( case when cp2.prod_serv = ''S'' then 0 else (coalesce(cp2.quantidade, 0) * coalesce(cp2.prec_cusm_prod, 0)) end ) custo' +
    ' from cupom cp' +
    ' inner join empresa emp on cp.cod_empresa = emp.cod_empresa ' +
    ' inner join cupom2 cp2 on cp2.cod_terminal = cp.cod_terminal and cp2.nserieecf = cp.nserieecf' +
    '   and cp2.cod_empresa = cp.cod_empresa and cp2.cupom = cp.cupom and cp2.ordem = cp.registro' +
    ' inner join nat_op nop on nop.codigo_nop = cp2.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = cp2.cod_empresa and col.cod_vendedor = cp2.cod_vendedor' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' left join pedvenda pv on pv.nped = cp.ped and pv.nprevenda = cp.prevenda and pv.cod_empresa = cp.cod_empresa' +
    ' where ' + vDadosIni.retornoPorCondicao( vtippesq = 'M',
    	'extract(month from cp.data) = '+inttostr(vmesvendas)+
    	' and extract(year from cp.data) = '+inttostr(vanovendas),
    	'cp.data >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
    	' and cp.data <= '+FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and dep.cod_dptocx in ' + vcoddemo +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and cp.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and coalesce(cp.status_cp, '''') <> ''CANCELADO'' and coalesce(cp2.status_it, '''') <> ''CANCELADO''' +
    ' group by 1' +
    ' union ' +
    //nf servicos tabela nota fiscal
    ' select ''NFS'' tipo,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto,' +
    ' sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo' +
    ' from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''S''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when coalesce(nfi.nped,0) > 0 then' +
    '     coalesce( (select first 1 cod_vendedor from pedvenda_serv ps where ps.nped = nfi.nped and ps.tipo = nfi.tipo_ped and ps.cod_empresa = nfi.cod_empresa and ps.nitem = nfi.nitem_ped), nf.cod_vendedor)' +
    '     else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vcoddemo +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    vDadosIni.IfThen(pBalDre = 'D',
			' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by 1' +
    ' union ' +
    //nf servicos prefeitura pedvendaserv pelo sistema
    ' select ''NFS'' tipo, sum(coalesce(ps.valor_nfse,0) + coalesce(ps.irrf_servico,0) + coalesce(ps.pisrf_servico,0) + coalesce(ps.cofinsrf_servico,0) + coalesce(ps.csslrf_servico,0)) bruto, 0 as desconto, 0 as custo' +
    ' from pedvenda pv' +
    ' inner join empresa emp on pv.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vDadosIni.retornoPorCondicao( vtippesq = 'M',
      'extract(month from ps.emissao_nfse) = '+inttostr(vmesvendas)+
      ' and extract(year from ps.emissao_nfse) = '+inttostr(vanovendas),
      'ps.emissao_nfse >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
      ' and ps.emissao_nfse <= '+FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and dep.cod_dptocx in ' + vcoddemo +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ps.status_nfse = ''Autorizada''' +
    ' group by 1' +
    ' union ' +
    // pedvenda_serv nf servicos externa digitada na ordem de servico o numero data e valor
    ' select ''NFS'' tipo, sum(coalesce(ps.valor_tot_serv,0)) bruto, sum(coalesce(ps.rateio_desc,0)) as desconto, 0 as custo' +
    ' from pedvenda_serv ps' +
    ' inner join empresa emp on ps.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda pv on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto and dep.cod_dptocx in ' + vcoddemo +
    ' where ' + vDadosIni.retornoPorCondicao( vtippesq = 'M',
      'extract(month from pv.data_nfext) = '+inttostr(vmesvendas)+
      ' and extract(year from pv.data_nfext) = '+inttostr(vanovendas),
      'pv.data_nfext >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
      ' and pv.data_nfext <= '+FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and pv.num_nfeext > 0 and pv.tipo = ''OS''' +
    ' and coalesce(ps.status_nfse,'''') <> ''Autorizada'' and (coalesce(ps.n_nf, 0) = 0)' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by 1' +
    ' union ' +
    // pedvenda_serv_terc
    ' select ''NFS'' tipo, sum(coalesce(pt.vl_servt,0)) bruto, 0 as desconto, 0 as custo' +
    ' from pedvenda_serv_terc pt' +
    ' inner join empresa emp on pt.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda pv on pv.nped = pt.nped and pv.tipo = pt.tipo and pv.cod_empresa = pt.cod_empresa' +
    ' inner join colaborador col on col.cod_vendedor = pv.cod_vendedor and col.cod_empresa = pv.cod_empresa' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto ' +
    ' and dep.cod_dptocx in ' + vcoddemo +
    ' where ' + vDadosIni.retornoPorCondicao( vtippesq = 'M',
      'extract(month from pv.data_nfext) = '+inttostr(vmesvendas)+
      ' and extract(year from pv.data_nfext) = '+inttostr(vanovendas),
      'pv.data_nfext >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
      ' and pv.data_nfext <= '+FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and pv.num_nfeext > 0 and pv.tipo = ''OS''' +
    ' and coalesce((select count(sss.nped) from pedvenda_serv sss where sss.nped = pt.nped and sss.tipo = pt.tipo' +
    ' and sss.cod_empresa = pt.cod_empresa and coalesce(sss.status_nfse, '''') = ''Autorizada'' ' +
    ' and coalesce(sss.lote_nfse,0) > 0 ),0) = 0' +
    vDadosIni.IfThen(pBalDre = 'D',
    	' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by 1' +
    // pedvenda_prod_terc não tem documentos fiscal
    ' union '+
//    ' select ''NFS'' tipo, sum(pv.valor_nfext) bruto, 0 as desconto, 0 as custo from pedvenda pv' +
//    ' where ' + vDadosIni.retornoPorCondicao( vtippesq = 'M',
//      'extract(month from pv.data_nfext) = '+inttostr(vmesvendas)+
//      ' and extract(year from pv.data_nfext) = '+inttostr(vanovendas),
//      'pv.data_nfext >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
//      ' and pv.data_nfext <= '+FormatDateTime('mm/dd/yyyy', vdat2)) +
//    ' and pv.num_nfeext > 0' +
//    ' and pv.cod_empresa in (' + vempresasD + ')' +
//    ' and ( select count(*) from pedvenda_serv ps' +
//    ' inner join colaborador col on col.cod_vendedor = ps.cod_vendedor and col.cod_empresa = ps.cod_empresa' +
//    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
//    ' inner join depto dep on dep.cod_depto = f.cod_depto ' +
//    ' and dep.cod_dptocx in ' + vcoddemo +
//    ' where ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa and coalesce(ps.status_nfse,'''') <> ''Autorizada''' +
//    ' and coalesce(ps.valor_tot_serv,0) > 0 '+
//    ' ) > 0' +
//    ' union ' +
    //nf veiculos novos e usados
    ' select ''NFV'' || rtrim(nfiv.tipo_venda) TIPO, sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''V''' +
    ' inner join notafiscal_item_veiculo nfiv on nfiv.cod_nf = nfi.cod_nf and nfiv.cod_empresa = nfi.cod_empresa and nfiv.nitem = nfi.nitem' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when coalesce(nf.n_comando,0) > 0 then' +
    '     coalesce( (select first 1 cf.covend_v from com_fat cf where cf.n_comando = nf.n_comando and cf.cod_empresa = nf.cod_empresa), nf.cod_vendedor)' +
    '     else nf.cod_vendedor end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vcoddemo +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    ' group by 1' +
    ' union ' +
    //nf outras tabela nota fiscal
    ' select ''NFO'' tipo, sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto, sum(nfi.quantidade * nfi.prec_cusm_prod) custo' +
    ' from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''O''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor = nf.cod_vendedor' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vcoddemo +
    vDadosIni.IfThen(pBalDre = 'D',
    	' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    ' group by 1';
  dataSet.Open;
  registraErro(dataSet.CommandText);
  i:=0;
  vDadosIni.progressoFuncao('','','Somando vendas Notas Fiscais e Cupons Fiscais');
  while not dataSet.Eof do
  begin
    if trim(dataset.FieldByName('tipo').AsString) = 'NFP' then
      i:=0
    else if trim(dataset.FieldByName('tipo').AsString) = 'CPP' then
      i:=1
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFS' then
      i:=2
    else if trim(dataset.FieldByName('tipo').AsString) = 'CPS' then
      i:=3
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFVN' then
      i:=4
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFVU' then
      i:=5
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFO' then
      i:=11
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFPS' then
      i:=12
    else if trim(dataset.FieldByName('tipo').AsString) = 'CPPS' then
      i:=13;
    if dataset.FieldByName('bruto').AsFloat > 0 then
    begin
      if vmesor = vmesvendas then
      begin
        VendaporModCNT[i,1]:=currtostr(strtocurr(VendaporModCNT[i,1])+dataset.FieldByName('bruto').AsCurrency);
        VendaporModCNT[i,2]:=currtostr(strtocurr(VendaporModCNT[i,2])+dataset.FieldByName('desconto').AsCurrency);
        VendaporModCNT[i,3]:=currtostr(strtocurr(VendaporModCNT[i,3])+dataset.FieldByName('custo').AsCurrency);
      end;

      vbrutoat[i]:=vbrutoat[i]+dataset.FieldByName('bruto').ascurrency;
      vcustoat[i]:=vcustoat[i]+dataset.FieldByName('custo').AsCurrency;
      vdescat[i]:=vdescat[i]+dataset.FieldByName('desconto').AsCurrency;

      VendaporModCNT[i,4]:=currtostr(strtocurr(VendaporModCNT[i,4])+dataset.FieldByName('bruto').ascurrency);
      VendaporModCNT[i,5]:=currtostr(strtocurr(VendaporModCNT[i,5])+dataset.FieldByName('desconto').ascurrency);
      VendaporModCNT[i,6]:=CurrToStr(strtocurr(VendaporModCNT[i,6])+dataset.FieldByName('custo').ascurrency);
    end;
    dataset.next;
  end;

  // Verificar o valor de venda geral para efeito de Rateio
  dataSet.Close;
  dataSet.CommandText:=
    //nf produtos
    ' select ''NFP'' tipo, sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''P''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' where ' + vtppesq +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by 1' +
    ' union ' +
    //cupom fiscal de produtos
    ' select ''CP'' || cp2.prod_serv,' +
    ' sum(coalesce(cp2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0)) bruto,' +
    ' sum(coalesce(cp2.rat_desc, 0) + coalesce(cp2.perc_desc,0)) desconto,' +
    ' sum( case when cp2.prod_serv = ''S'' then 0 else (coalesce(cp2.quantidade, 0) * coalesce(cp2.prec_cusm_prod, 0)) end ) custo' +
    ' from cupom cp' +
    ' inner join empresa emp on cp.cod_empresa = emp.cod_empresa ' +
    ' inner join cupom2 cp2 on cp2.cod_terminal = cp.cod_terminal and cp2.nserieecf = cp.nserieecf' +
    '   and cp2.cod_empresa = cp.cod_empresa and cp2.cupom = cp.cupom and cp2.ordem = cp.registro' +
    ' inner join nat_op nop on nop.codigo_nop = cp2.codigo_nop and nop.faturamento = ''S''' +
    	' where ' + vDadosIni.retornoPorCondicao( vtippesq = 'M',
    	'extract(month from cp.data) = '+inttostr(vmesvendas)+
    	' and extract(year from cp.data) = '+inttostr(vanovendas),
    	'cp.data >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
    	' and cp.data <= '+FormatDateTime('mm/dd/yyyy', vdat2)) +
    vDadosIni.IfThen(pBalDre = 'D',
    	' and cp.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and coalesce(cp.status_cp, '''') <> ''CANCELADO'' and coalesce(cp2.status_it, '''') <> ''CANCELADO''' +
    ' group by 1' +
    ' union ' +
    //nf servicos tabela nota fiscal
    ' select ''NFS'' tipo,' +
    ' sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto,' +
    ' sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo' +
    ' from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''S''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' where ' + vtppesq +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' group by 1' +
    ' union ' +
    //nf servicos prefeitura pedvendaserv pelo sistema
    ' select ''NFS'' tipo, sum(coalesce(ps.valor_nfse,0) + coalesce(ps.irrf_servico,0) + coalesce(ps.pisrf_servico,0) + coalesce(ps.cofinsrf_servico,0) + coalesce(ps.csslrf_servico,0)) bruto, 0 as desconto, 0 as custo' +
    ' from pedvenda pv' +
    ' inner join empresa emp on pv.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' where ' + vDadosIni.retornoPorCondicao( vtippesq = 'M',
      'extract(month from ps.emissao_nfse) = '+inttostr(vmesvendas)+
      ' and extract(year from ps.emissao_nfse) = '+inttostr(vanovendas),
      'ps.emissao_nfse >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
      ' and ps.emissao_nfse <= '+FormatDateTime('mm/dd/yyyy', vdat2)) +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ps.status_nfse = ''Autorizada''' +
    ' group by 1' +
    ' union ' +
    // nf servicos externa digitada na ordem de servico o numero data e valor
    ' select ''NFS'' tipo, sum(pv.valor_nfext) bruto, 0 as desconto, 0 as custo from pedvenda pv' +
    ' inner join empresa emp on pv.cod_empresa = emp.cod_empresa ' +
    ' where ' + vDadosIni.retornoPorCondicao( vtippesq = 'M',
      'extract(month from pv.data_nfext) = '+inttostr(vmesvendas)+
      ' and extract(year from pv.data_nfext) = '+inttostr(vanovendas),
      'pv.data_nfext >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
      ' and pv.data_nfext <= '+FormatDateTime('mm/dd/yyyy', vdat2)) +
    ' and pv.num_nfeext > 0' +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ( select count(*) from pedvenda_serv ps' +
    ' where ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa ' +
    ' and coalesce(ps.status_nfse,'''') <> ''Autorizada''' +
    ' and coalesce(ps.valor_tot_serv,0) > 0 '+
    ' ) > 0' +
    ' union ' +
    //nf veiculos novos e usados
    'select ''NFV'' || rtrim(nfiv.tipo_venda) TIPO, sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''V''' +
    ' inner join notafiscal_item_veiculo nfiv on nfiv.cod_nf = nfi.cod_nf and nfiv.cod_empresa = nfi.cod_empresa and nfiv.nitem = nfi.nitem' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' where ' + vtppesq +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    ' group by 1' +
    ' union ' +
    //nf outras tabela nota fiscal
    ' select ''NFO'' tipo, sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto, sum(nfi.quantidade * nfi.prec_cusm_prod) custo' +
    ' from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''O''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.faturamento = ''S''' +
    ' where ' + vtppesq +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or (nf.modelo_nf <> ''55'')) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''S''' +
    ' group by 1';
  dataSet.Open;
  i:=0;
  vDadosIni.progressoFuncao('','','Somando Notas Fiscais e Cupons Fiscais');
  while not dataSet.Eof do
  begin
    if trim(dataset.FieldByName('tipo').AsString) = 'NFP' then
      i:=0
    else if trim(dataset.FieldByName('tipo').AsString) = 'CPP' then
      i:=1
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFS' then
      i:=2
    else if trim(dataset.FieldByName('tipo').AsString) = 'CPS' then
      i:=3
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFVN' then
      i:=4
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFVU' then
      i:=5
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFO' then
      i:=11
    else if trim(dataset.FieldByName('tipo').AsString) = 'NFPS' then
      i:=12
    else if trim(dataset.FieldByName('tipo').AsString) = 'CPPS' then
      i:=13;
    vbrutoatrat[i]:=vbrutoatRat[i]+dataset.FieldByName('bruto').ascurrency;
    vcustoatRat[i]:=vcustoatRat[i]+dataset.FieldByName('custo').AsCurrency;
    vdescatRat[i]:=vdescatRat[i]+dataset.FieldByName('desconto').AsCurrency;
    dataset.next;
  end;

  vDadosIni.progressoFuncao('','','Pesquisando Vendas Consórcio e Retornos de bancos');
//  end;
  if vtippesq = 'M' then
    vtppesq:='extract(month from DATA_EM_NF) = '+inttostr(vmesvendas)+
      ' and extract(year from DATA_EM_NF) = '+inttostr(vanovendas)
  else
    vtppesq:='DATA_EM_NF >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
      ' and DATA_EM_NF <= '+FormatDateTime('mm/dd/yyyy', vdat2);
  dataSet.Close;
  dataSet.CommandText:='select cc.tipo_reg, sum(cc.valor) as bruto,' +
    ' sum(0) as custo,sum(0) as desconto from COMISSAO_CONSORCIO cc ' +
    ' inner join empresa emp on cc.cod_empresa = emp.cod_empresa ' +
  	' WHERE '+vtppesq+
    vDadosIni.IfThen(pBalDre = 'D',
    	' and cc.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cc.cod_empresa end) ') +
    ' in ('+vempresasD+') ' +
    ' and cc.ativo = 1 ' +
    ' group by cc.tipo_reg';
  dataSet.open;
  while not dataset.Eof do
  begin
    if trim(dataset.FieldByName('tipo_reg').AsString) = 'CNS' then
      i:=6
    else if trim(dataset.FieldByName('tipo_reg').AsString) = 'RETB' then
      i:=7;
    if vmesor =  vmesvendas then
    begin
      VendaporModCNT[i,1]:=CurrToStr(dataset.FieldByName('bruto').AsCurrency);
      VendaporModCNT[i,2]:=CurrToStr(dataset.FieldByName('desconto').AsCurrency);
      VendaporModCNT[i,3]:=CurrToStr(dataset.FieldByName('custo').AsCurrency);
    end;

    vbrutoat[i]:=vbrutoat[i]+dataset.FieldByName('bruto').ascurrency;
    vcustoat[i]:=vcustoat[i]+dataset.FieldByName('custo').AsCurrency;
    vdescat[i]:=vdescat[i]+dataset.FieldByName('desconto').AsCurrency;

    vbrutoatRat[i]:=vbrutoatRat[i]+dataset.FieldByName('bruto').ascurrency;
    vcustoatRat[i]:=vcustoatRat[i]+dataset.FieldByName('custo').AsCurrency;
    vdescatRat[i]:=vdescatRat[i]+dataset.FieldByName('desconto').AsCurrency;

    VendaporModCNT[i,4]:=CurrToStr(strtocurr(VendaporModCNT[i,4])+dataSet.FieldByName('bruto').AsCurrency);
    VendaporModCNT[i,5]:=CurrToStr(strtocurr(VendaporModCNT[i,5])+dataset.FieldByName('desconto').AsCurrency);
    VendaporModCNT[i,6]:=CurrToStr(strtocurr(VendaporModCNT[i,6])+dataSet.FieldByName('custo').AsCurrency);
    dataset.next;
  end;

  vDadosIni.progressoFuncao('','','Pesquisando Devolução');
  i:=8;
  if vtippesq = 'M' then
    vtppesq:='extract(month from nf.data_lanc) = '+inttostr(vmesvendas)+
      ' and extract(year from nf.data_lanc) = '+inttostr(vanovendas)
  else
    vtppesq:='nf.data_lanc >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
      ' and nf.data_lanc <= '+FormatDateTime('mm/dd/yyyy', vdat2);
  dataSet.close;
  dataset.CommandText:=
    ' select ''DEVNFP'' tipo, sum(coalesce(nfi.valor_total,0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
    '   case when nf.frete_f_nfe = ''S'' then 0 else coalesce(nfi.rateio_frete,0) end +' +
    '   coalesce(case when (nfi.valor_icmsub_ant > 0) then 0 else nfi.valor_icmsub end,0) +' +
    '   coalesce(nfi.valor_ipi,0)) bruto, sum(nfi.rateio_desconto) desconto,' +
    ' sum(nfi.quantidade * nfi.prec_cusm_prod) custo from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''P''' +
    ' inner join nat_op nop on nop.codigo_nop = nfi.codigo_nop and nop.devolucao = ''S''' +
    ' inner join colaborador col on col.cod_empresa = nfi.cod_empresa and col.cod_vendedor =' +
    '   case when ((nfi.seq_devolucao > 0) and (nfi.seqid_devolucao > 0)) then' +
    '    coalesce((select first 1 cod_vendedor from devolucao dev where dev.sequencia = nfi.seq_devolucao and dev.seqid = nfi.seqid_devolucao and dev.cod_empresa = nfi.cod_empresa), nf.cod_vendedor)' +
    '   else' +
    '    coalesce( (select first 1 cod_vendedor from devolucao dev where dev.cod_nf = nfi.cod_nf and dev.nitem_nf = nfi.nitem and dev.cod_empresa = nfi.cod_empresa and dev.nf_gerou = ''S''), nf.cod_devolucao)' +
    '   end' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao' +
    ' inner join depto dep on dep.cod_depto = f.cod_depto' +
    ' where ' + vtppesq +
    ' and dep.cod_dptocx in ' + vcoddemo +
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vempresasD + ')' +
    ' and ((nf.emissao_propria = ''S'' and nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada'') or' +
    ' (nf.emissao_propria = ''N'' and nf.modelo_nf = ''55'') or (nf.modelo_nf <> ''55'') ) ' +
    ' and nf.status = ''Fechada'' and nf.natureza_nf = ''E''' +
    ' group by 1';
  dataset.open;
  if dataset.FieldByName('bruto').AsString <> '' then
  begin
    if vmesor =  vmesvendas then
    begin
      VendaporModCNT[i,1]:=dataset.FieldByName('bruto').AsString;
      VendaporModCNT[i,2]:=dataset.FieldByName('desconto').AsString;
      VendaporModCNT[i,3]:=dataset.FieldByName('custo').AsString;
    end;
    vdevat[i]:=vdevat[i]+dataset.FieldByName('bruto').AsCurrency;
    vdevct[i]:=vdevct[i]+dataset.FieldByName('custo').AsCurrency;
    VendaporModCNT[i,4]:=CurrToStr(strtocurr(VendaporModCNT[i,4])+dataset.FieldByName('bruto').AsCurrency);
    VendaporModCNT[i,5]:=CurrToStr(strtocurr(VendaporModCNT[i,5])+dataset.FieldByName('desconto').AsCurrency);
    VendaporModCNT[i,6]:=CurrToStr(strtocurr(VendaporModCNT[i,6])+dataset.FieldByName('custo').AsCurrency);
  end;
  // Fazer aqui a Devolução de Veiculos
  i:=9;
  if vtippesq = 'M' then
   vtppesq:='extract(month from NOTAFISCAL.DATA_LANC) = '+inttostr(vmesvendas)+
  ' and extract(year from NOTAFISCAL.DATA_LANC) = '+inttostr(vanovendas)
  else
   vtppesq:='NOTAFISCAL.DATA_LANC >= '+FormatDateTime('mm/dd/yyyy',vdat1)+
  ' and NOTAFISCAL.DATA_LANC <= '+FormatDateTime('mm/dd/yyyy', vdat2);
 dataSet.close;
 dataset.CommandText:='SELECT sum(NOTAFISCAL_ITEM.valor_total) as bruto,sum(' +
 ' case when trim(NOTAFISCAL_ITEM_VEICULO.tipo_venda) = ''U'' then' +
 '   coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = NOTAFISCAL_ITEM_VEICULO.chassi' +
 '     and et.cod_empresa = NOTAFISCAL_ITEM_VEICULO.cod_empresa and et.status_uso = NOTAFISCAL_ITEM_VEICULO.tipo_venda order by et.data_ch_nota desc), 0)' +
 '  else' +
 '    coalesce((select first 1 (et.custo) from comprasmesesv40 et where et.chassi = NOTAFISCAL_ITEM_VEICULO.chassi' +
 '     and et.cod_empresa = NOTAFISCAL_ITEM_VEICULO.cod_empresa and et.status_uso = NOTAFISCAL_ITEM_VEICULO.tipo_venda order by et.data_ch_nota), 0)' +
 '  end' +
//  (select first 1 (et.custo) from comprasmesesv4 et where '+
//  'et.chassi = NOTAFISCAL_ITEM_VEICULO.CHASSI and et.cod_empresa = '+
//  'NOTAFISCAL_ITEM_VEICULO.COD_EMPRESA order by data_ch_nota)
' ) as custo FROM NOTAFISCAL ' +
' INNER JOIN EMPRESA EMP ON NOTAFISCAL.COD_EMPRESA = EMP.COD_EMPRESA ' +
' INNER JOIN NAT_OP ON NOTAFISCAL.CODIGO_NOP = NAT_OP.CODIGO_NOP '+
' INNER JOIN NOTAFISCAL_ITEM_VEICULO ON NOTAFISCAL.COD_NF = NOTAFISCAL_ITEM_VEICULO.COD_NF ' +
' 	AND NOTAFISCAL.COD_EMPRESA = NOTAFISCAL_ITEM_VEICULO.COD_EMPRESA '+
' INNER JOIN NOTAFISCAL_ITEM ON NOTAFISCAL_ITEM.COD_NF = NOTAFISCAL.COD_NF ' +
'		AND NOTAFISCAL_ITEM.COD_EMPRESA = NOTAFISCAL.COD_EMPRESA '+
' INNER JOIN COLABORADOR ON NOTAFISCAL.COD_VENDEDOR = COLABORADOR.COD_VENDEDOR ' +
'		AND NOTAFISCAL.COD_EMPRESA = COLABORADOR.COD_EMPRESA '+
' INNER JOIN FUNCOES ON COLABORADOR.COD_FUNCAO = FUNCOES.COD_FUNCAO '+
' INNER JOIN DEPTO ON FUNCOES.COD_DEPTO = DEPTO.COD_DEPTO '+
' WHERE NOTAFISCAL.NATUREZA_NF = ''E'' AND NOTAFISCAL.STATUS = ''Fechada'' AND '+vtppesq+
vDadosIni.IfThen(pBalDre = 'D',
	' AND NOTAFISCAL.COD_EMPRESA ',
  ' AND (CASE WHEN(EMP.FINANCEIRO_UNIFICADO = ''S'') THEN EMP.CODIGO_UNIFICADORA ELSE NOTAFISCAL.COD_EMPRESA END) ') +
' in ('+vempresasD+') AND NAT_OP.DEVOLUCAO = ''S'' AND DEPTO.COD_DPTOCX IN '+vcoddemo;
  // 'select sum(dv.Quant*dv.valor) as bruto,sum(dv.quant*dv.pcust_mc) as custo from devolucao dv,colaborador col,funcoes func,depto dep where '+vtppesq+
  // ' and dv.cod_vendedor = col.cod_vendedor and dv.cod_empresa = col.cod_empresa and '+
  // 'col.cod_funcao = func.cod_funcao and func.cod_depto = dep.cod_depto and dv.cod_empresa in ('+vempresasD+') and dv.ativo = 1 '+
  // 'and dep.cod_dptocx in '+vcoddemo;
  //i.cod_vendedor = col.cod_vendedor and i.cod_empresa = col.cod_empresa and col.cod_funcao = func.cod_funcao and func.cod_depto = dep.cod_depto '+
  //  'and dep.cod_dptocx in '+vcoddemo+'
  dataset.open;
  if dataset.FieldByName('bruto').AsString <> '' then
  begin
   if vmesor =  vmesvendas then
   begin
    VendaporModCNT[i,1]:=dataset.FieldByName('bruto').AsString;
    VendaporModCNT[i,2]:='0';
    VendaporModCNT[i,3]:=dataset.FieldByName('custo').AsString;
   end;
   vdevat[i]:=vdevat[i]+dataset.FieldByName('bruto').AsCurrency;
   vdevct[i]:=vdevct[i]+dataset.FieldByName('custo').AsCurrency;
   VendaporModCNT[i,4]:=CurrToStr(strtocurr(VendaporModCNT[i,4])+dataset.FieldByName('bruto').AsCurrency);
   VendaporModCNT[i,5]:='0';
   VendaporModCNT[i,6]:=CurrToStr(strtocurr(VendaporModCNT[i,6])+dataset.FieldByName('custo').AsCurrency);
  end;
  ///
  vvalconf:=0;
  vvendageral:=0;
  for i := 0 to 13 do
  begin
  vvalconf:=vvalconf+vbrutoat[i];
  vvendageral:=vvendageral+vbrutoat[i];
  end;
  if vvalconf = 0 then
  begin
  Result:=false;
  //  VendaporMod[0,1]:='0,01';
  //  vbrutoat[0]:=0.01;
  end;
  dataset.close;
  //col 0: REQ, osp, OSS
  //COL 1: BRUTO
  //COL 2: DESCONTO
  //COL 3: CUSTO
  //COL 4: BRUTO + BRUTO
  //COL 5: DESCONTO + DESCONTO
  //COL 6: CUSTO + CUSTO
end;

function TVendasGestor.ZeraVendas: boolean;
var
 i,x: integer;
begin
  for i:=0 to 11 do
   for x := 0 to 6 do
   begin
     VendaporMod[i,x]:='0';
//     vendaporModBr[i,x]:='0';
   end;
  for  i:=0 to 13 do
   for x := 0 to 6 do
   begin
     VendaporModCNT[i,x]:='0';
//     vendaporModBr[i,x]:='0';
   end;
end;

{ TDespesasGestor }

function TDespesasGestor.ApagarBI(vempresasD: string;
  vFerCube: THierCube; pBalDre: string): boolean;
begin
   //DRE
   datasetBI.Close;
   datasetBI.SQL.text:=
   ' select ct.tipo_ctp as tipo,emp.identificacao_emp as nome_emp,ctrl.nome_ctrl as controle,cp.nome_for_ctp as nome,(select result from strzero(extract(day from cp.data_venc_ctp),2)) as dia,'+
   ' extract(month from cp.data_venc_ctp) as mes,extract(year from cp.data_venc_ctp) as ano,cp.data_venc_ctp,'+
   ' cp.n_doc_ctp as documento,sum(cp.valor_ctp) valor from contas_a_pagar cp,controles ctrl,empresa emp,p_contas ct ' +
   ' where cp.n_conta_plc = ct.n_conta_plc ' +
   ' and cp.data_venc_ctp >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
   ' and cp.data_venc_ctp <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+ ''' ' +
   ' and cp.datq_ctp is null and cp.codigo_ctrl  = ctrl.codigo_ctrl ' +
   ' and cp.codigo_emp = ctrl.codigo_emp and cp.cod_emp_mult = emp.cod_empresa ' +
   vDadosIni.IfThen(pBalDre = 'D',
	   ' and cp.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.codigo_emp end) ') +
   ' in ('+vEmpresasD+') ' +
   ' group by nome_emp,tipo,documento,controle,nome,mes,ano,dia,data_venc_ctp ';
   datasetBI.Open;
   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
  vFerCube.DefineFieldAsDimension('controle','Controle Fin',dgCol);
  vFerCube.DefineFieldAsDimension('mes','Mês do Movimento',dgRow);
  vFerCube.DefineFieldAsDimension('dia','Dia do Movimento',dgRow);
  vFerCube.DefineFieldAsDimension('tipo','Tipo de Documento',dgRow);
  vFerCube.DefineFieldAsDimension('nome','Fornecedor',dgPage);
  vFerCube.DefineFieldAsDimension('ano','Ano do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('documento','N. Documento',dgPage);
  vFerCube.DefineFieldAsSummary('valor');
end;

function TDespesasGestor.buscaDespDep(vnumDRE: integer;vempresasD: string;vcoddemo: string;
  pBalDre: string; pContabil: Boolean): boolean;
var
 vdtgeral,vdtgeralctp: string;
begin
 //DRE
Result:=true;
{  if vnumDRE = 11 then
  begin
   // aqui
   vretorno[0]:=0;
    vretorno[1]:=0;
    dataSet.close;
    dataSet.CommandText:='select l.codigo_emp,c.cod_dep,c.grup_ct,sum(l.valor_l) as valor '+
    'from Lancamentos l,p_contas p,GRUPOS_CT c,DEPART_CT d where EXTRACT(month FROM l.datq_l) = '+IntToStr(vmesvendas)+
    ' and EXTRACT(YEAR FROM l.datq_l) = '+IntToStr(vanovendas)+' and l.n_conta_plc = '+
    'p.n_conta_plc and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep and '+
    '(c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) and l.lote is null '+
    ' and d.tp_dep = ''T'' and d.cod_dep in '+vcoddemo+
    ' and l.codigo_emp in ('+vEmpresasD+') and p.ativo = 1 group by c.cod_dep,c.grup_ct,l.codigo_emp '+
    'union '+
    'select ctr.codigo_emp,c.cod_dep,c.grup_ct,sum(ctr.valor_pago) as valor '+
    'from contas_a_pagar ctr,p_contas p,grupos_ct c,DEPART_CT d '+
    'where EXTRACT(MONTH FROM ctr.datq_ctp) = '+IntToStr(vmesvendas)+
    ' and EXTRACT(YEAR FROM ctr.datq_ctp) = '+IntToStr(vanovendas)+
    ' and ctr.n_conta_plc = p.n_conta_plc and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep '+
    'and (c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%''))and ctr.lote is not null '+
    'and d.tp_dep = ''T'' and d.cod_dep in '+vcoddemo+
    ' and ctr.codigo_emp in ('+vEmpresasD+') and p.ativo = 1 group by c.cod_dep,c.grup_ct,ctr.codigo_emp ';
    dataset.Open;
  end
  else
  begin}
     if vregime = 'COMP' then
     begin
      vdtgeral:='l.dtreferencia';
      vdtgeralctp:='ctr.dtreferencia';
     end
     else
     begin
      vdtgeral:='l.datq_l';
      vdtgeralctp:='ctr.datq_ctp';
     end;
    vretorno[0]:=0;
    vretorno[1]:=0;
    dataSet.close;
    dataSet.CommandText:='select l.codigo_emp,c.cod_dep,c.grup_ct,sum(l.valor_l) as valor, '+
      ' sum(coalesce(l.vl_contabil,0)) valorcnt from Lancamentos l ' +
      ' inner join empresa emp on l.codigo_emp = emp.cod_empresa ' +
      ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
      ' inner join GRUPOS_CT c on p.grup_ct = c.grup_ct ' +
      ' inner join DEPART_CT d on c.cod_dep = d.cod_dep ' +
      ' where EXTRACT(month FROM '+vdtgeral+') = '+IntToStr(vmesvendas)+
      ' and EXTRACT(YEAR FROM '+vdtgeral+') = '+IntToStr(vanovendas)+
      ' and (c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) ' +
      ' and l.lote is null '+
      ' and c.cod_dre = '+IntToStr(vnumDRE)+
      ' and d.cod_dep in '+vcoddemo+
      vDadosIni.IfThen(pBalDre = 'D',
	      ' and l.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
        ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else l.codigo_emp end) ') +
      ' in ('+vEmpresasD+') and p.ativo = 1 ' +
      ' group by c.cod_dep,c.grup_ct,l.codigo_emp '+
      ' union '+
      ' select ctr.codigo_emp,c.cod_dep,c.grup_ct,' +
      ' sum(case when (ctr.valor_pago is null or ctr.valor_pago = 0) then ctr.valor_ctp else ctr.valor_pago end) as valor, '+
      ' sum( case when ((coalesce(ctr.valor_pago,0) > 0)' +
      ' and (coalesce(ctr.valor_pago,0) < coalesce(ctr.vl_contabil,0))) then coalesce(ctr.valor_pago,0) else coalesce(ctr.vl_contabil,0) end ) valorcnt ' +
      ' from contas_a_pagar ctr ' +
      ' inner join empresa emp on ctr.codigo_emp = emp.cod_empresa ' +
      ' inner join p_contas p on ctr.n_conta_plc = p.n_conta_plc ' +
      ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' inner join DEPART_CT d on c.cod_dep = d.cod_dep ' +
      ' where EXTRACT(MONTH FROM '+vdtgeralctp+') = '+IntToStr(vmesvendas)+
      ' and EXTRACT(YEAR FROM '+vdtgeralctp+') = '+IntToStr(vanovendas)+
      ' and (c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) ' +
      ' and (ctr.lote is not null or (ctr.datq_ctp is null and ctr.entra_previsao = ''S''))'+
      ' and c.cod_dre = '+IntToStr(vnumDRE)+' and d.cod_dep in '+vcoddemo+
      vDadosIni.IfThen(pBalDre = 'D',
	      ' and ctr.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
        ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctr.codigo_emp end) ') +
      ' in ('+vEmpresasD+') and p.ativo = 1 ' +
      ' group by c.cod_dep,c.grup_ct,ctr.codigo_emp ';
    dataset.Open;
//  end;
  while not dataSet.eof do
  begin
   if pContabil then
   begin
   if vmesor =  vmesvendas then
    vretorno[0]:=vretorno[0]+dataSet.FieldByName('valorcnt').AsCurrency;
   vretorno[1]:=vretorno[1]+dataSet.FieldByName('valorcnt').AsCurrency;
   end
   else
   begin
   if vmesor =  vmesvendas then
    vretorno[0]:=vretorno[0]+dataSet.FieldByName('valor').AsCurrency;
   vretorno[1]:=vretorno[1]+dataSet.FieldByName('valor').AsCurrency;
   end;
   dataSet.next;
  end;
end;

function TDespesasGestor.contasFopag(vtip: string;vop: integer;vempresasD: string; pBalDre: string): boolean;
var
 vvtip: string;
 vdtgeral,vdtgeralctp: string;
begin
  Result:=false;
  if (vmesvendas > 12) or (vmesvendas < 0) or (vanovendas < 2007)  then
  begin
   Application.MessageBox('Mês ou Ano Inválido(s)', 'Confirmação', MB_OK);
   result:=false;
   exit;
  end;
  if vtip = 'FIXO' then
   vvtip:='10'
  else
   vvtip:='9';
  if vregime = 'COMP' then
  begin
   vdtgeral:='l.dtreferencia';
   vdtgeralctp:='ctr.dtreferencia';
  end
  else
  begin
   vdtgeral:='l.datq_l';
   vdtgeralctp:='ctr.datq_ctp';
  end;
  dataSet.close;
  if vop = 1 then
  begin
  dataSet.CommandText:='SELECT P.N_CONTA_PLC,P.DESC_PLC,' +
  	' P.DESC_PADR,P.TIPO_CTP FROM P_CONTAS P,GRUPOS_CT GR ' +
    ' WHERE P.TIPO_CTP = ''P'' AND P.GRUP_CT = GR.GRUP_CT AND COD_DRE = '+vvtip;
  dataset.open;
  end
  else
  begin
    dataSet.CommandText:='select (l.valor_l) as valor from Lancamentos l' +
    ' inner join empresa emp on l.codigo_emp = emp.cod_empresa ' +
    ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
    ' inner join GRUPOS_CT c on p.grup_ct = c.grup_ct ' +
    ' where EXTRACT(month FROM '+vdtgeral+') = '+IntToStr(vmesvendas)+
    ' and EXTRACT(YEAR FROM '+vdtgeral+') = '+IntToStr(vanovendas)+
    ' and (c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) '+
    ' and cod_dre = '+vvtip+' and l.lote is null '+
    vDadosIni.IfThen((pBalDre = 'D') or (pBalDre = 'P'),
	    ' and l.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else l.codigo_emp end) ') +
    ' in ('+vEmpresasD+') ' +
    ' and p.ativo = 1 and l.n_conta_plc in '+
    ' (SELECT P.N_CONTA_PLC FROM P_CONTAS P,GRUPOS_CT GR WHERE P.TIPO_CTP = ''P'' '+
    ' AND P.GRUP_CT = GR.GRUP_CT AND COD_DRE = '+vvtip+') '+
    ' union '+
    ' select sum(ctr.valor_pago) as valor from contas_a_pagar ctr ' +
    ' inner join empresa emp on ctr.codigo_emp = emp.cod_empresa ' +
    ' inner join p_contas p on ctr.n_conta_plc = p.n_conta_plc ' +
    ' inner join grupos_ct c on p.grup_ct = c.grup_ct '+
    ' where EXTRACT(MONTH FROM '+vdtgeralctp+') = '+IntToStr(vmesvendas)+
    ' and EXTRACT(YEAR FROM '+vdtgeralctp+') = '+IntToStr(vanovendas)+
    ' and (c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) '+
    ' and ctr.lote is not null and cod_dre = '+vvtip+
    vDadosIni.IfThen((pBalDre = 'D') or (pBalDre = 'P'),
  	  ' and ctr.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
	    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctr.codigo_emp end) ') +
    ' in ('+vEmpresasD+') ' +
    ' and p.ativo = 1 and ctr.n_conta_plc in '+
    ' (SELECT P.N_CONTA_PLC FROM P_CONTAS P,GRUPOS_CT GR WHERE P.TIPO_CTP = ''P'' '+
    ' AND P.GRUP_CT = GR.GRUP_CT AND COD_DRE = '+vvtip+') ';
    dataset.Open;
    vvaldespped:=0;
    while not dataset.eof do
    begin
      vvaldespped:=vvaldespped+dataset.FieldByName('VALOR').AsCurrency;
      dataSet.next;
    end;
  end;
  Result:=true;
end;

constructor TDespesasGestor.create;
begin
  SetLength(vretorno,2);
  vtippesq:='';
  vmesor:=0;
  vanovendas:=0;
  vmesvendas:=0;
  vdat1:=strtodate('01/01/2001');
  vdat2:=strtodate('01/01/2001');
  datasetBI:=TIBQuery(DtmGestorHw.IbCubeGeral);
  dataSet:=TClientDataSet(DtmGestorHw.CdsMapaFinan);
  buscas:=TIBQuery(DtmGestorHw.QrBuscas);
  transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
  vregime:='';
end;

function TDespesasGestor.desembolsototal(vdatini,vdattfin: Tdate;vempresasD: string; pBalDre: string): currency;
var
 vtot: currency;
begin
//Balanço Geral
buscas.Close;
buscas.SQL.text:='select ''LNC'' as tp_lanc,sum(l.valor_l) as valor '+
' from Lancamentos l,p_contas p,GRUPOS_CT c,DEPART_CT d,empresa emp ' +
' where l.datq_l >= '''+FormatDateTime('mm/dd/yyyy',vdatini)+''' ' +
' and l.datq_l <= '''+FormatDateTime('mm/dd/yyyy',vdattfin)+''' ' +
' and l.n_conta_plc = p.n_conta_plc ' +
' and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep ' +
' and (c.tipo_gr = ''S'' or (c.desc_gr like ''%INVEST%'')) and l.lote is null '+
vDadosIni.IfThen(pBalDre = 'D',
  ' and l.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
	' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else l.codigo_emp end)  ') +
' in ('+vempresasD+') ' +
' and l.codigo_emp = emp.cod_empresa and p.ativo = 1 group by tp_lanc '+
' union '+
' select ''CTP'' as tp_lanc,sum(ctr.valor_pago) as valor '+
' from contas_a_pagar ctr,p_contas p,grupos_ct c,DEPART_CT d,empresa emp '+
' where ctr.datq_ctp >= '''+FormatDateTime('mm/dd/yyyy',vdatini)+''' ' +
' and ctr.datq_ctp <= '''+FormatDateTime('mm/dd/yyyy',vdattfin)+''' ' +
' and ctr.n_conta_plc = p.n_conta_plc and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep '+
' and (c.tipo_gr = ''S'' or (c.desc_gr like ''%INVEST%'')) and ctr.lote is not null '+
vDadosIni.IfThen(pBalDre = 'D',
	' and ctr.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'), 
	' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctr.codigo_emp end) ') +
' in ('+vempresasD+') ' +
' and ctr.codigo_emp = emp.cod_empresa and p.ativo = 1 '+
' group by tp_lanc '+
' union '+
' select ''FOR'' as tp_lanc,sum(ctr.valor_pago) as valor '+
' from contas_a_pagar ctr,p_contas p,grupos_ct c,DEPART_CT d,empresa emp '+
' where ctr.datq_ctp >= '''+FormatDateTime('mm/dd/yyyy',vdatini)+ ''' ' +
' and ctr.datq_ctp <= '''+FormatDateTime('mm/dd/yyyy',vdattfin)+ ''' ' +
' and ctr.n_conta_plc = p.n_conta_plc and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep '+
' and (c.tipo_gr <> ''S'' and (not c.desc_gr like ''%INVEST%'')) and ctr.lote is not null '+
vDadosIni.IfThen(pBalDre = 'D',
	' and ctr.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') ,
  ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctr.codigo_emp end)  ') +
' in ('+vempresasD+') ' +
' and ctr.codigo_emp = emp.cod_empresa and p.ativo = 1 '+
' group by tp_lanc ';
buscas.Open;
vtot:=0;
while not buscas.eof do
begin
 vtot:=vtot+buscas.FieldByName('valor').AsCurrency;
 buscas.next;
end;
buscas.close;
Result:=vtot;
end;

function TDespesasGestor.despBI(vempresasD: string;
  vFerCube: THierCube; pBalDre: string): boolean;
var
 vtppesq: string;
 vtppesq1: string;
 vdtgeral,vdtgeralctp: string;
begin
  //DRE
  if vregime = 'COMP' then
  begin
   vdtgeral:='l.dtreferencia';
   vdtgeralctp:='ctr.dtreferencia';
  end
  else
  begin
   vdtgeral:='l.datq_l';
   vdtgeralctp:='ctr.datq_ctp';
  end;
  vtppesq:='(('+vdtgeral+' >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and '+vdtgeral+' <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '('+vdtgeral+' >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and '+vdtgeral+' <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
  vtppesq1:='(('+vdtgeralctp+' >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''''+
  ' and '+vdtgeralctp+' <= '''+FormatDateTime('mm/dd/yyyy', vdat2)+''') or '+
  '('+vdtgeralctp+' >= '''+FormatDateTime('mm/dd/yyyy',vdatant1)+''''+
  ' and '+vdtgeralctp+' <= '''+FormatDateTime('mm/dd/yyyy', vdatant2)+'''))';
//  try
   datasetBI.Close;
   datasetBI.SQL.text:=
    ' select ''LNC'' as tp_lanc,EXTRACT(day FROM '+vdtgeral+') as Dia,emp.identificacao_emp as nome_emp,'+
    ' c.desc_gr,p.n_conta_plc,l.historico_l as historico,d.desc_dep,p.desc_padr,'+
    ' c.cod_dre,EXTRACT(month FROM '+vdtgeral+') as mes,EXTRACT(year FROM '+vdtgeral+') as ano,''N'' as previsao,'+
    ' p.cod_cta_contabil, p.ord_cta_contabil,' +
    ' sum(l.valor_l) as valorrealizado,sum(l.valor_l) as valorprevisto,sum(0) as diferenca '+
    ' from Lancamentos l,p_contas p,GRUPOS_CT c,DEPART_CT d,empresa emp ' +
    ' where ' +vtppesq+
    ' and l.n_conta_plc = p.n_conta_plc and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep ' +
    ' and (c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) and l.lote is null '+
    ' and (d.cod_dep in '+vcoddemo+' or tp_dep = ''T'') '+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and l.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else l.codigo_emp end) ') +
    ' in ('+vEmpresasD+') ' +
    ' and l.cod_emp_mult = emp.cod_empresa and p.ativo = 1 ' +
    ' group by nome_emp,c.desc_gr,p.n_conta_plc,historico,d.desc_dep,p.desc_padr,c.cod_dre,mes,ano,tp_lanc,dia,previsao,p.cod_cta_contabil,p.ord_cta_contabil '+
    ' union '+
    ' select ''CTP'' as tp_lanc,EXTRACT(DAY FROM '+vdtgeralctp+') as Dia,emp.identificacao_emp as nome_emp,'+
    ' c.desc_gr,p.n_conta_plc,ctr.historico_ctp as historico,d.desc_dep,p.desc_padr,'+
    ' c.cod_dre,EXTRACT(MONTH FROM '+vdtgeralctp+') as mes,'+
    ' EXTRACT(YEAR FROM '+vdtgeralctp+') as ano,case when (ctr.entra_previsao is null or (not ctr.datq_ctp is null)) '+
    ' then ''N'' else ctr.entra_previsao end as previsao,' +
    ' p.cod_cta_contabil, p.ord_cta_contabil,' +
    ' sum(ctr.valor_pago) as valorrealizado,'+
    ' sum(ctr.valor_ctp) as valorprevisto,sum(ctr.valor_pago-ctr.valor_ctp) as diferenca '+
    ' from contas_a_pagar ctr,p_contas p,grupos_ct c,DEPART_CT d,empresa emp '+
    ' where '+vtppesq1+
    ' and ctr.n_conta_plc = p.n_conta_plc and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep '+
    ' and (c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) and '+
    ' (ctr.lote is not null or (ctr.datq_ctp is null and ctr.entra_previsao = ''S'')) '+
    ' and (d.cod_dep in '+vcoddemo+' or tp_dep = ''T'') '+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and ctr.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctr.codigo_emp end) ') +
    ' in ('+vEmpresasD+') ' +
    ' and ctr.cod_emp_mult = emp.cod_empresa and p.ativo = 1 ' +
    ' group by nome_emp,c.desc_gr,p.n_conta_plc,historico,d.desc_dep,p.desc_padr,c.cod_dre,mes,ano,tp_lanc,dia,previsao,p.cod_cta_contabil,p.ord_cta_contabil ';

{  'union '+
  'select ''OST'' as tipo,SUM(i.VL_SERVT) as bruto,SUM(0) as desconto, SUM(0) as custo '+
  'from PEDVENDA_SERV_TERC i, PEDVENDA p '+
  'where i.nped = p.nped and i.tipo = p.tipo and '+
  'i.cod_empresa = p.cod_empresa and '+vtppesq+
  ' AND '+
  'p.cod_empresa in ('+vempresasD+') '+
  'and ((p.tipo = ''OS'' and (p.tipo_os = ''CLIENTE'' or p.tipo_os = ''EXTERNA'')) ) GROUP BY tipo';}
   datasetBI.Open;
   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
  vFerCube.DefineFieldAsDimension('desc_dep','Descrição do Departamento',dgRow);
  vFerCube.DefineFieldAsDimension('desc_gr','Grupo de Despesas',dgRow);
  vFerCube.DefineFieldAsDimension('ANO','Ano Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('MES','Mês do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('n_conta_plc','Conta do Lançamento',dgPage);
  vFerCube.DefineFieldAsDimension('historico','Histórico do Lançamento',dgPage);
  vFerCube.DefineFieldAsDimension('Desc_padr','Descriçao Padrão da Conta',dgPage);
  vFerCube.DefineFieldAsDimension('cod_dre','Código no DRE',dgPage);
  vFerCube.DefineFieldAsDimension('tp_lanc','Tipo de Lançamento',dgPage);
  vFerCube.DefineFieldAsDimension('dia','Dia do Lançamento',dgPage);
  vFerCube.DefineFieldAsDimension('previsao','Conta de Previsao',dgPage);
  vFerCube.DefineFieldAsDimension('cod_cta_contabil','Conta Contabil do Lancamento',dgPage);
  vFerCube.DefineFieldAsDimension('ord_cta_contabil','Ordem Contabil do Lancamento',dgPage);
  vFerCube.DefineFieldAsSummary('valorprevisto');
  vFerCube.DefineFieldAsSummary('valorrealizado');
  vFerCube.DefineFieldAsSummary('diferenca');
end;

function TDespesasGestor.desppgdia(vdia: Tdate;vEmpresasD: string): currency;
var
 vtotal: currency;
begin
{buscas.close;
buscas.SQL.text:=
    'select sum(l.valor_l) as valorrealizado '+
    'from Lancamentos l,p_contas p,GRUPOS_CT c,DEPART_CT d,empresa emp where l.data = '''+
    FormatDateTime('mm/dd/yyyy',vdia)+
    ''' and l.n_conta_plc = '+
    'p.n_conta_plc and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep and '+
    '(c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) and l.lote is null '+
    ' and l.codigo_emp in ('+vEmpresasD+') and l.codigo_emp = emp.cod_empresa and p.ativo = 1  '+
    'union '+
    'select sum(ctr.valor_pago) as valorrealizado '+
    'from contas_a_pagar ctr,p_contas p,grupos_ct c,DEPART_CT d,empresa emp '+
    'where data_ctp = '''+FormatDateTime('mm/dd/yyyy',vdia)+
    ''' and ctr.n_conta_plc = p.n_conta_plc and p.grup_ct = c.grup_ct and c.cod_dep = d.cod_dep '+
    'and (c.tipo_gr = ''S'' or c.tipo_gr = ''E'' or (c.desc_gr like ''%INVEST%'')) and ctr.lote is not null '+
    '  and ctr.codigo_emp in ('+vEmpresasD+') and ctr.codigo_emp = emp.cod_empresa and p.ativo = 1 ';
 buscas.Open;
 vtotal:=0;
 while not buscas.Eof do
 begin
   vtotal:=vtotal+buscas.FieldByName('valorrealizado').AsCurrency;
   buscas.next;
 end;
 buscas.close;}
end;

destructor TDespesasGestor.destroy;
begin
  close;
  inherited;
end;

function TDespesasGestor.gravaProvisoes(vempresasD: string;vdtVenc: string;vval: real;vtipoLanc: integer): boolean;
var
 vdtfech: TDate;
 vdoc: string;
begin
  result:=false;
  buscas.close;
  buscas.sql.text:='select max(dia_fcd) as data from fech_dia ' +
  	' where codigo_emp in ('+vempresasD+')';
  buscas.Open;
  vdtfech:=buscas.FieldByName('DATA').AsDateTime;
  if vtipoLanc = 1 then
   vdoc:='PROVISIONAMENTO DE SALARIO FIXO REF. MES '+inttostr(vmesvendas)+'/12';
  if vtipoLanc = 2 then
   vdoc:='PROVISIONAMENTO DE SALARIO VARIAVEL REF. MES '+inttostr(vmesvendas)+'/12';
  if vtipoLanc = 3 then
   vdoc:='DEPRECIACAO IMOBILIZADO REF. MES '+inttostr(vmesvendas)+'/12';
  montaSelect('select * from contas_a_pagar ' +
  	' where n_doc_ctp = '''+inttostr(vmesvendas)+'/12' +''' ' +
    ' and historico_ctp = '''+vdoc+ ''' ' +
    ' and codigo_emp in ('+vempresasD+')');
  if dataset.IsEmpty then
  begin
  IniciaTransacao;
  try
    buscas.close;
    buscas.sql.text:= ' select nome_emp as nome from empresa ' +
    	' where cod_empresa in (' + vempresasD + ')';
    buscas.Open;
    vDadosIni.codEmpresa:=vempresasD;
    dataSet.Append;
    dataSet.FieldByName('n_conta_plc').Value:=vvaldespped;
    dataSet.FieldByName('COD_CONTRP').AsInteger:=Gencodigo('CONTAS_A_PAGAR',dtmGestorHw.SpIncCodigo,vempresasD);
    dataSet.FieldByName('NOME_FOR_CTP').AsString:=buscas.FieldByName('nome').AsString;
    dataSet.FieldByName('DATA_ENT_CTP').AsDateTime:=vdtfech+1;
    dataSet.FieldByName('DATA_VENC_CTP').AsDateTime:=StrToDate(vdtVenc);
    dataSet.FieldByName('N_DOC_CTP').AsString:=inttostr(vmesvendas)+'/12';
    dataSet.FieldByName('CODIGO_CTRL').AsInteger:=1;
    dataset.FieldByName('VALOR_CTP').AsCurrency:=vval;
    dataset.FieldByName('VL_CONTABIL').AsCurrency:=dataset.FieldByName('VALOR_CTP').AsCurrency;
    dataSet.FieldByName('TIPO_CTP').AsString:='D';
    dataSet.FieldByName('HISTORICO_CTP').AsString:=vdoc;
    dataSet.FieldByName('CODIGO_EMP').AsString:=vempresasD;
    dataSet.FieldByName('TIP_CNT').asstring:='C';
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('DTREFERENCIA').AsDateTime:=StrToDate(
    inttostr(vDadosIni.UltimoDia(StrToDate('01/'+IntToStr(vmesvendas)+'/'+IntToStr(vanovendas))))+'/'+IntToStr(vmesvendas)+'/'+IntToStr(vanovendas));

    buscas.close;
    buscas.sql.text:='SELECT COUNT(*) as conta FROM CONTAS_REL_ORIGEM ' +
    	' WHERE N_CONTA_PLC_OR = cast('+  vDadosIni.trocaVirgulaPorPonto(dataSet.FieldByName('N_CONTA_PLC').AsString)+' as double precision)';
    buscas.open;
    if buscas.FieldByName('CONTA').AsInteger > 0 then
    begin
      try
        vDadosIni.vPesquisa := 'FOPAG|';
        vDadosIni.vDtSetTmp := TClientDataSet(dataSet);
        vDadosIni.vQueryTmp := buscas;
        vDadosIni.vTransactionTmp := transacao;
        vDadosIni.abreFormCadastro('pkContasAPagar', 'TfrmIntegraCTP');
        if vDadosIni.vPesquisa = 'FOPAG|SUCESSO' then
        begin
          Result:=true;
          Application.MessageBox('Gravação realizada com sucesso', 'Confirmação', MB_OK);
        end;
      finally
        vDadosIni.vPesquisa := '';
      end;
    end
    else
    begin
      dataSet.Post;
      dataSet.ApplyUpdates(-1);
      CommitaTransacao;
      Result:=true;
      Application.MessageBox('Gravação realizada com sucesso', 'Confirmação', MB_OK);
    end;
  except
    on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(Pchar('GEST002 '+e.Message), 'Confirmação', MB_OK);
      registraErro('GEST002 ' + e.Message);
      Result := False;
    end;
  end;
  end
  else
   Application.MessageBox('Provisionamento já lancado para este mês', 'Confirmação', MB_OK);
end;

function TDespesasGestor.iniciavariaveis: boolean;
begin
pdiaD:=0;
pdiaF:=0;
cpdiaimp:=0;
cpdiafolha:=0;
end;

function TDespesasGestor.Somadesp(vempresasD: string; vdata: Tdate;vtpac: string; pBalDre: string): boolean;
begin
 // Fluxo de Caixa 
 Result:=true;
 dataSet.Close;
 dataSet.CommandText:='select ctp.* from contas_a_pagar ctp ' +
 ' inner join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
 ' where ctp.data_venc_ctp >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''' '+
 ' and ctp.data_venc_ctp <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' '+
 ' and (ctp.status_ctp is null or ctp.status_ctp = '''') ' +
 vDadosIni.IfThen(pBalDre = 'D',
   ' and ctp.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
	 ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctp.codigo_emp end) ') +
 ' in ('+vempresasD+ ') ';
 if vtpac = 'S' then
  dataSet.CommandText:=dataSet.CommandText+' and ctp.aceite_ctp = ''S'' order by ctp.data_venc_ctp '
 else
  dataSet.CommandText:=dataSet.CommandText+' order by data_venc_ctp';

 dataSet.Open;
 While not dataSet.EOF do
 begin
   IF dataSet.FieldByName('Data_Venc_ctp').Value = vdata  then
   begin
    if dataSet.FieldByName('tipo_ctp').value = 'D' then
    begin
      buscas.Close;
      buscas.sql.text:='select tipo_ctp from p_contas ' +
      	' where n_conta_plc = cast('+ vDadosIni.trocaVirgulaPorPonto(dataSet.FieldByName('N_CONTA_PLC').AsString)+' as double precision)';
      buscas.Open;
      if (buscas.FieldByName('TIPO_CTP').value = 'D') then
       pdiad:=pdiad+dataSet.FieldByName('Valor_ctp').Value
      else
      begin
      if buscas.FieldByName('TIPO_CTP').value = 'I' then
       cpdiaimp:=cpdiaimp+dataSet.FieldByName('VALOR_CTP').value
      else
       if buscas.FieldByName('TIPO_CTP').value = 'P' then
        cpdiafolha:=cpdiafolha+dataSet.FieldByName('VALOR_CTP').value
       else
        pdiad:=pdiad+dataSet.FieldByName('valor_ctp').Value;
      end;
    end
    else
     pdiaf:=pdiaf+dataSet.FieldByName('Valor_ctp').Value;
   end;
   dataSet.Next;
 end;
 buscas.close;
end;

function TDespesasGestor.visualizadespesas: boolean;
begin
 montaSelect('SELECT * FROM P_CONTAS WHERE ATIVO = 1 ORDER BY N_CONTA_PLC ');
end;

{ TFluxoCaixa }


{ TFluxoCaixa }

constructor TFluxoCaixa.create;
begin
DiaSemana[1]:='Dom';
DiaSemana[2]:='Seg';
DiaSemana[3]:='Ter';
DiaSemana[4]:='Qua';
DiaSemana[5]:='Qui';
DiaSemana[6]:='Sex';
DiaSemana[7]:='Sáb';
vInicial:=strtodate('01/01/2001');
vFinal:=strtodate('01/01/2001');
voriginal:=strtodate('01/01/2001');
buscas:=TIBQuery(DtmGestorHw.QrBuscas);
transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
cadcontroles:=Tcontroles.create;
cadctrlCredCheq:=TCtrlCredchq.create;
CadVendas:=TvendasGestor.create;
caddesp:= TDespesasGestor.create;
//vInicial:=voriginal;
end;

destructor TFluxoCaixa.destroy;
begin
 cadcontroles.Free;
 cadctrlCredCheq.free;
 CadVendas.free;
 caddesp.free;
  inherited;
end;

function TFluxoCaixa.GeraHTML(GradeP: TStringGrid; Borda: String): String;
var
 Tabela : String;
 itt,i,j : Integer;
 vini,vlinha,flg: integer;
 vl,vl1,vl2: integer;
begin
(* try
    // gera a tabela
    Tabela := Tabela + '<Table Width="100%" Border=' + Borda + ' cellspacing="0" cellpadding="0"><TR>';
    for i := 0 to GradeP.ColCount-1 do
      Tabela := Tabela + '<TD bgcolor="blue" height="35"><font size="1"><b>'+GradeP.Cells[i,0]+ '</b></font></TD>';
    vini:=1;
    While vlinha <= GradeP.RowCount-1 do
    begin
      Tabela := Tabela + '</TR><TR>';
      vlinha:=LinhaDest(GradeP,vini);
      for i := 0 to GradeP.colCount-1 do
      begin
          vl:=0;
          vl1:=0;
          vl2:=0;
          flg:=0;
          {for itt:= 0 to 200 do
          begin
           if ( i = vtcolor[itt]) then
           begin
            flg:=1;
            break;
           end
           else
            if ( i = vtcolor1[itt])  then
            begin
             flg:=2;
             break;
            end
            else
             flg:=3;
          end;
          if flg = 1 then
           tabela:=tabela+'<TD background="verde.png" height="25">'
          else
           if flg = 2 then
             Tabela := Tabela + '<TD background="azul.png" height="30">'
           else}
          if vini = vlinha then
          else
          begin
            Tabela := Tabela + '<TD>';
            for j := vini to vlinha-1 do
            begin
             if GradeP.Cells[i,j] = '' then
             begin
    //            bgcolor="green" height="25">';
              Tabela := Tabela + '<div align="right"><font size="2">' + '&nbsp;' + '</font></div>';
             end
             else
             begin
                Tabela := Tabela + '<div align="right"><font size="2">' + trim(GradeP.Cells[i,j]) + '</font></div>';
             end;
            end;
            Tabela := Tabela + '</TD>';
          end;
      end;
      if vini = vlinha then
      else
       Tabela := Tabela +'<TR>';
      for j := 0 to GradeP.ColCount-1 do
      begin
       if GradeP.Cells[j,vlinha] = '' then
        Tabela := Tabela + '<TD><div align="right">' + '&nbsp;' + '</div></TD>'
       else
        Tabela := Tabela + '<TD background="verde.png"><div align="right">' + trim(GradeP.Cells[j,vlinha]) + '</div></TD>';
      end;
      vini:=vlinha+1;
    end;
    Tabela := Tabela + '</TR></TABLE>';
  finally
    Result := Tabela;
  end;*)
end;

function TFluxoCaixa.iniciavariaveis(vitx: integer): boolean;
begin

end;

function TFluxoCaixa.MontaFluxo(vgridFluxo: Tstringgrid;
  stgridGrafico: TstringGrid;vtip: string;vtpaceite: string): boolean;
var
 icol: integer;
 vfl17,itx: integer;
 vmesat,Vdia,vmes,vano: word;
begin
	  vgridFluxo.Cells[0,0] := 'Data - ' + vDadosIni.IfThen(vtip = 'D', 'Dia Semana', 'Mês');
    vgridFluxo.Cells[1,0] := 'Receita Real';
    vgridFluxo.Cells[2,0] := 'Saldos C/C';
    vgridFluxo.Cells[3,0] := 'Venda Estimada AV'; // Sugestão e fica a disposição do usuário
    vgridFluxo.Cells[4,0] := 'A Rec. Chq/Cred'; // todos cujo qperf = 1
    vgridFluxo.Cells[5,0] := 'Outros Créditos'; // A disposição do usuário
    vgridFluxo.Cells[6,0] := 'Outras Receitas'; // A disposição do usuário
    vgridFluxo.Cells[7,0] := 'Fornec. A Pagar'; // Todos os fornecedores a pagar cujo tipo_ctp = 'F'
    vgridFluxo.Cells[8,0] := 'Despesas A Pagar'; // Todas as despesas a Pagar cujo tipo_ctp = 'D' com
                                                  //exeção das contas no plano de contas tipo_ctp <> 'D'
    vgridFluxo.Cells[9,0] := 'Impostos'; // Todas as despesas a Pagar cujo o tipo_ctp no plano de contas = 'I'
    vgridFluxo.Cells[10,0] := 'Folha Pagamento'; // Todas as despesas cujo o tipo_ctp no plano de contas = 'P'
    vgridFluxo.Cells[11,0] := 'Outras Despesas'; // A Disposição do Usuário
    vgridFluxo.Cells[12,0] := 'Saldo dia';
    vgridFluxo.Cells[13,0] := 'Saldo Disponível';
    vgridFluxo.Cells[14,0] := 'Dia';
    vcolsaldini:=0;
//  Testar aqui os campos inicial e final da data
   if (DateToStr(voriginal) = ('01/01/2001')) and
   (DateToStr(vFinal) = ('01/01/2001')) then
   begin
     Application.MessageBox('Intervalos de Datas inválidos para Iniciar o Fluxo de caixa', 'Confirmação', MB_OK);
     Result:=false;
     exit;
   end;
   vInicial:=voriginal;
   cadctrlCredCheq.vdat1:=voriginal;
   cadctrlCredCheq.vdat2:=vFinal;
   caddesp.vdat1:=voriginal;
   caddesp.vdat2:=vFinal;
   for icol:= 1 to 7 do
    CadVendas.vvprevisao[icol]:=0;
   cadctrlCredCheq.cdia:=0;
   caddesp.pdiaf:=0;
   caddesp.pdiad:=0;
   caddesp.cpdiaimp:=0;
   caddesp.cpdiafolha:=0;
   cadcontroles.valorinicial:=0;
   for icol := 1 to vgridFluxo.RowCount -1 do
    vgridFluxo.Rows[Icol].Clear;
   vgridFluxo.rowcount:=1;
   for icol := 0 to stgridGrafico.RowCount -1 do
    stgridGrafico.Rows[Icol].Clear;
   stgridGrafico.rowcount:=3;
   stgridGrafico.colcount:=2;
   vDadosIni.progressoFuncao('Processando Fluxo','Processo Geração Fluxo de Caixa','Verificando Valores iniciais');
   cadcontroles.SomaSaldoinicial(vCodEmpresasDRE,vInicial);
    vlinicial:=cadcontroles.valorInicial;
   if vsemPrevVenda = 'N' then
   begin
    vDadosIni.progressoFuncao('','','Verificando Média Recebimento a Vista');
    CadVendas.vendasant(voriginal,vtip,vCodEmpresasDRE, 'F');
   end;
   I:=1;
   if vtip = 'D' then
   begin
     vfl17:=0;
     While vInicial <= vfinal do
     begin
         Application.ProcessMessages;
         vDadosIni.progressoFuncao('','','Verificando Valores para o dia '+
         DiaSemana[DayOfWeek(vinicial)]+'-'+datetostr(vinicial));
           // fazer testes do dia da semana em caso de ser por dia
         if (DayOfWeek(vinicial) = 1) or (DayOfWeek(vinicial) = 7) then
         begin
{          if i = 1 then
          begin
           vgridFluxo.Cells[1,I] := vdadosini.alndir(format('%n',[cadcontroles.ValorInicial]),14);
           vgridFluxo.Cells[2,I] := vDadosIni.alndir(format('%n',[cadcontroles.vsaldbanc]),14);
          end;}
          if (DayOfWeek(vinicial) = 7) then
          begin
           caddesp.iniciavariaveis;
           cadctrlCredCheq.iniciavariaveis;
//                 pdiad:=0.00;
//                 pdiaf:=0.00;
//                 cdia:=0.00;
//                 cpdiaimp:=0.00;
//                 cpdiafolha:=0.00;
          end;
          cadctrlCredCheq.SomaCredCheq(vCodEmpresasDRE,vInicial,vusvlLiq);
          caddesp.Somadesp(vCodEmpresasDRE,vInicial,vtpaceite, 'F');
//                somacrdeb;
          vfl17:=vfl17+1;
          if vfl17 = 2 then
          begin
//               frm_fluxo.vgridFluxo.rowcount:=I+1;
           vgridFluxo.rowcount:=I+1;
           vgridFluxo.Cells[0,I] := '.TOTAL SEMANA';
           I:=I+1;
          end;
         end
         else
         begin
           vgridFluxo.rowcount:=I+1;
           vgridFluxo.rowcount:=I+1;
           if vfl17 = 0 then
           begin
            caddesp.iniciavariaveis;
            cadctrlCredCheq.iniciavariaveis;
//                  pdiad:=0.00;
//                  pdiaf:=0.00;
//                  cdia:=0.00;
//                  cpdiaimp:=0.00;
//                  cpdiafolha:=0.00;
           end
           else
            vfl17:=0;
          cadctrlCredCheq.SomaCredCheq(vCodEmpresasDRE,vInicial,vusvlLiq);
          caddesp.Somadesp(vCodEmpresasDRE,vInicial,vtpaceite, 'F');
//                 somacrdeb;
//************* Montando o StringGrid com os Resultados ************************
//              with frm_fluxo do
//              begin
           vgridFluxo.Cells[0,I] := DiaSemana[DayOfWeek(vinicial)]+'-'+datetostr(vinicial);
           //messagedlg(vgridFluxo.Cells[0,I],mtinformation,[mbOK],0);
           if i = 1 then
           begin
            vgridFluxo.Cells[1,I] := vdadosini.alndir(format('%n',[cadcontroles.ValorInicial]),14);
            vcolsaldini:=i;
           end
           else
           begin
            if (vgridFluxo.Cells[0,I-1] = '.TOTAL SEMANA') and (i = 2) then
            begin
             vgridFluxo.Cells[1,I] := vdadosini.alndir(format('%n',[cadcontroles.ValorInicial]),14);
             vcolsaldini:=i;
            end
           else
            vgridFluxo.Cells[1,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           end;
           if i = 1 then
            vgridFluxo.Cells[2,I] := vDadosIni.alndir(format('%n',[cadcontroles.vsaldbanc]),14)
           else
           begin
            if (vgridFluxo.Cells[0,I-1] = '.TOTAL SEMANA') and (i = 2) then
             vgridFluxo.Cells[2,I] := vDadosIni.alndir(format('%n',[cadcontroles.vsaldbanc]),14)
            else
             vgridFluxo.Cells[2,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           end;
           vgridFluxo.Cells[3,I] := vDadosIni.alndir(format('%n',[CadVendas.vvprevisao[DayOfWeek(vinicial)]]),14);
           vgridFluxo.Cells[4,I] := vDadosIni.alndir(format('%n',[cadctrlCredCheq.cdia]),14);
           vgridFluxo.Cells[5,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[6,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[7,I] := vDadosIni.alndir(format('%n',[caddesp.pdiaf]),14);
           vgridFluxo.Cells[8,I] := vDadosIni.alndir(format('%n',[caddesp.pdiad]),14);
           vgridFluxo.Cells[9,I] := vDadosIni.alndir(format('%n',[caddesp.cpdiaimp]),14);
           vgridFluxo.Cells[10,I] := vDadosIni.alndir(format('%n',[caddesp.cpdiafolha]),14);
           vgridFluxo.Cells[11,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[12,I] := vDadosIni.alndir(format('%n',[cadcontroles.valorinicial+CadVendas.vvprevisao[DayOfWeek(vinicial)]+
           (cadctrlCredCheq.cdia-(caddesp.pdiad+caddesp.pdiaf+caddesp.cpdiaimp+
           caddesp.cpdiafolha))+strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[2,vcolsaldini],2))]),14);
//           strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[2,1],2))]),14);
           vgridFluxo.Cells[13,I] := vDadosIni.alndir(format('%n',[cadcontroles.valorinicial+
           CadVendas.vvprevisao[DayOfWeek(vinicial)]+(cadctrlCredCheq.cdia-(caddesp.pdiad+
           caddesp.pdiaf+caddesp.cpdiaimp+caddesp.cpdiafolha))]),14);
           vgridFluxo.Cells[14,I]:=datetostr(vInicial);
//              end;
          stgridGrafico.Cells[0,0]:='Período';
          stgridGrafico.Cells[0,1]:='Saldo Dia';
          stgridGrafico.Cells[stgridGrafico.ColCount-1,0]:=copy(datetostr(vinicial),1,5);
          stgridGrafico.Cells[stgridGrafico.ColCount-1,1]:=vgridFluxo.Cells[12,I];
          stgridGrafico.Cells[0,2]:='Disponivel';
          stgridGrafico.Cells[stgridGrafico.ColCount-1,2]:=vgridFluxo.Cells[13,I];
          stgridGrafico.ColWidths[stgridGrafico.ColCount-1]:=100;
          stgridGrafico.ColCount:=stgridGrafico.ColCount+1;
          cadcontroles.valorinicial:=cadcontroles.valorinicial+(CadVendas.vvprevisao[DayOfWeek(vinicial)]+
          cadctrlCredCheq.cdia-(caddesp.pdiad+caddesp.pdiaf+caddesp.cpdiaimp+caddesp.cpdiafolha));
//                Credito := Credito+cdia;
//                pagar:=pagar+(pdiad+pdiaf);
//              frm_fluxo.vgridFluxo.Cells[5,I] := format('%n',[valorinicial]);
//              vgridFluxo.Cells[12,I] := format('%n',[valorinicial]);
          I:=I+1;
         end;
         vinicial:=vinicial+1;
     end;
//         if (DayOfWeek(inicial) <> 1) and (DayOfWeek(inicial) <> 7) then
//         begin
     vgridFluxo.rowcount:=I+1;
     vgridFluxo.Cells[0,I] := '.TOTAL SEMANA';
     I:=I+1;
   end
   else
   begin
     DecodeDate(vinicial,vano,vmesat,vdia);
     While vinicial <= vfinal do
     begin
         Application.ProcessMessages;
           // fazer testes do dia da semana em caso de ser por dia
         vDadosIni.progressoFuncao('','','Verificando Valores para o mês '+
         copy(datetostr(vinicial-1),4,2)+'/'+copy(datetostr(vinicial-1),7,4));
         DecodeDate(vinicial,vano,vmes,vdia);
         if vmes <> vmesat then
         begin
           vmesat:=vmes;
           vgridFluxo.rowcount:=I+1;
           vgridFluxo.rowcount:=I+1;
//************* Montando o StringGrid com os Resultados ************************
//              with frm_fluxo do
//              begin
           vgridFluxo.Cells[0,I] := copy(datetostr(vinicial-1),4,2)+'/'+copy(datetostr(vinicial-1),7,4);
           //messagedlg(vgridFluxo.Cells[0,I],mtinformation,[mbOK],0);
           if i = 1 then
           begin
            vgridFluxo.Cells[1,I] := vDadosIni.alndir(format('%n',[cadcontroles.Valorinicial]),14);
            vcolsaldini:=i;
           end
           else
           begin
            vgridFluxo.Cells[1,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           end;
           if i = 1 then
            vgridFluxo.Cells[2,I] := vDadosIni.alndir(format('%n',[cadcontroles.vsaldbanc]),14)
           else
            vgridFluxo.Cells[2,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[3,I] := vDadosIni.alndir(format('%n',[CadVendas.vvprevisao[1]]),14);
           vgridFluxo.Cells[4,I] := vDadosIni.alndir(format('%n',[cadctrlCredCheq.cdia]),14);
           vgridFluxo.Cells[5,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[6,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[7,I] := vDadosIni.alndir(format('%n',[caddesp.pdiaf]),14);
           vgridFluxo.Cells[8,I] := vDadosIni.alndir(format('%n',[caddesp.pdiad]),14);
           vgridFluxo.Cells[9,I] := vDadosIni.alndir(format('%n',[caddesp.cpdiaimp]),14);
           vgridFluxo.Cells[10,I] := vDadosIni.alndir(format('%n',[caddesp.cpdiafolha]),14);
           vgridFluxo.Cells[11,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[12,I] := vDadosIni.alndir(format('%n',[cadcontroles.valorinicial+
           CadVendas.vvprevisao[1]+(cadctrlCredCheq.cdia-(caddesp.pdiad+caddesp.pdiaf+
           caddesp.cpdiaimp+caddesp.cpdiafolha))+strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[2,1],2))]),14);
           vgridFluxo.Cells[13,I] := vDadosIni.alndir(format('%n',[cadcontroles.valorinicial+
           CadVendas.vvprevisao[1]+(cadctrlCredCheq.cdia-(caddesp.pdiad+
           caddesp.pdiaf+caddesp.cpdiaimp+caddesp.cpdiafolha))]),14);
           vgridFluxo.Cells[14,I]:=datetostr(vInicial);
//              end;
          stgridGrafico.Cells[0,0]:='Período';
          stgridGrafico.Cells[0,1]:='Saldo Dia';
          stgridGrafico.Cells[stgridGrafico.ColCount-1,0]:=vgridFluxo.Cells[0,I];
          stgridGrafico.Cells[stgridGrafico.ColCount-1,1]:=vgridFluxo.Cells[12,I];
          stgridGrafico.Cells[0,2]:='Disponivel';
          stgridGrafico.Cells[stgridGrafico.ColCount-1,2]:=vgridFluxo.Cells[13,I];
          stgridGrafico.ColWidths[stgridGrafico.ColCount-1]:=100;
          stgridGrafico.ColCount:=stgridGrafico.ColCount+1;
          //
          cadcontroles.valorinicial:=cadcontroles.valorinicial+(CadVendas.vvprevisao[1]+
          cadctrlCredCheq.cdia-(caddesp.pdiad+caddesp.pdiaf+caddesp.cpdiaimp+caddesp.cpdiafolha));
//                Credito := Credito+cdia;
//                pagar:=pagar+(pdiad+pdiaf);
//              frm_fluxo.vgridFluxo.Cells[5,I] := format('%n',[valorinicial]);
//              vgridFluxo.Cells[12,I] := format('%n',[valorinicial]);
          I:=I+1;
//                vgridFluxo.rowcount:=I+1;
//                vgridFluxo.Cells[0,I] := '.TOTAL MES';
//                I:=I+1;
            caddesp.iniciavariaveis;
            cadctrlCredCheq.iniciavariaveis;
//                pdiad:=0.00;
//                pdiaf:=0.00;
//                cdia:=0.00;
//                cpdiaimp:=0.00;
//                cpdiafolha:=0.00;
          cadctrlCredCheq.SomaCredCheq(vCodEmpresasDRE,vInicial,vusvlLiq);
          caddesp.Somadesp(vCodEmpresasDRE,vInicial,vtpaceite, 'F');
//                somacrdeb;
         end
         else
         begin
          cadctrlCredCheq.SomaCredCheq(vCodEmpresasDRE,vInicial,vusvlLiq);
          caddesp.Somadesp(vCodEmpresasDRE,vInicial,vtpaceite, 'F');
//                                 somacrdeb;
         end;

         vinicial:=vinicial+1;
         if vinicial > vfinal then
         begin
           vgridFluxo.rowcount:=I+1;
//************* Montando o StringGrid com os Resultados ************************
//              with frm_fluxo do
//              begin
           vgridFluxo.Cells[0,I] := copy(datetostr(vinicial-1),4,2)+'/'+copy(datetostr(vinicial-1),7,4);
           //messagedlg(vgridFluxo.Cells[0,I],mtinformation,[mbOK],0);
           if i = 1 then
            vgridFluxo.Cells[1,I] := vDadosIni.alndir(format('%n',[cadcontroles.Valorinicial]),14)
           else
            vgridFluxo.Cells[1,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           if i = 1 then
            vgridFluxo.Cells[2,I] := vDadosIni.alndir(format('%n',[cadcontroles.vsaldbanc]),14)
           else
            vgridFluxo.Cells[2,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[3,I] := vDadosIni.alndir(format('%n',[CadVendas.vvprevisao[1]]),14);
           vgridFluxo.Cells[4,I] := vDadosIni.alndir(format('%n',[cadctrlCredCheq.cdia]),14);
           vgridFluxo.Cells[5,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[6,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[7,I] := vDadosIni.alndir(format('%n',[caddesp.pdiaf]),14);
           vgridFluxo.Cells[8,I] := vDadosIni.alndir(format('%n',[caddesp.pdiad]),14);
           vgridFluxo.Cells[9,I] := vDadosIni.alndir(format('%n',[caddesp.cpdiaimp]),14);
           vgridFluxo.Cells[10,I] := vDadosIni.alndir(format('%n',[caddesp.cpdiafolha]),14);
           vgridFluxo.Cells[11,I] := vDadosIni.alndir(format('%n',[0.00]),14);
           vgridFluxo.Cells[12,I] := vDadosIni.alndir(format('%n',[cadcontroles.valorinicial+
           CadVendas.vvprevisao[1]+(cadctrlCredCheq.cdia-(caddesp.pdiad+caddesp.pdiaf+
           caddesp.cpdiaimp+caddesp.cpdiafolha))+strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[2,1],2))]),14);
           vgridFluxo.Cells[13,I] := vDadosIni.alndir(format('%n',[cadcontroles.valorinicial+CadVendas.vvprevisao[1]+(
           cadctrlCredCheq.cdia-(caddesp.pdiad+caddesp.pdiaf+caddesp.cpdiaimp+caddesp.cpdiafolha))]),14);
           vgridFluxo.Cells[14,I]:=datetostr(vInicial);
//              end;
           stgridGrafico.Cells[0,0]:='Período';
           stgridGrafico.Cells[0,1]:='Saldo Dia';
           stgridGrafico.Cells[stgridGrafico.ColCount-1,0]:=vgridFluxo.Cells[0,I];
           stgridGrafico.Cells[stgridGrafico.ColCount-1,1]:=vgridFluxo.Cells[12,I];
           stgridGrafico.Cells[0,2]:='Disponivel';
           stgridGrafico.Cells[stgridGrafico.ColCount-1,2]:=vgridFluxo.Cells[13,I];
           stgridGrafico.ColWidths[stgridGrafico.ColCount-1]:=100;
           stgridGrafico.ColCount:=stgridGrafico.ColCount+1;
           cadcontroles.valorinicial:=cadcontroles.valorinicial+(CadVendas.vvprevisao[1]+
           cadctrlCredCheq.cdia-(caddesp.pdiad+caddesp.pdiaf+caddesp.cpdiaimp+caddesp.cpdiafolha));
//                 Credito := Credito+cdia;
//                 pagar:=pagar+(pdiad+pdiaf);
//              frm_fluxo.vgridFluxo.Cells[5,I] := format('%n',[valorinicial]);
//              vgridFluxo.Cells[12,I] := format('%n',[valorinicial]);
           I:=I+1;
//                 vgridFluxo.rowcount:=I+1;
//                 vgridFluxo.Cells[0,I] := '.TOTAL MES';
//                 I:=I+1;
         end;
     end;
   end;
   cadctrlCredCheq.verificaAtrasados(vCodEmpresasDRE,voriginal);
//   vgridFluxo.rowcount:=vgridFluxo.rowcount-1;
   I := 1;
   somargrids(vgridFluxo,stgridGrafico,vtip);
   vDadosIni.finalizaProgresso;
end;

function TFluxoCaixa.somargrids(vgridfluxo, stridgrafico: TstringGrid;vtip: string): boolean;
var
 itc,itl: integer;
 vtt: currency;
 vlinic: currency;
begin
   for itc := 0 to stridgrafico.RowCount -1 do
    stridgrafico.Rows[Itc].Clear;
   stridgrafico.rowcount:=3;
   stridgrafico.colcount:=2;

   for itc:=1 to (vgridFluxo.ColCount-3) do
   begin
    vtt:=0.00;
    for itl:=1 to (vgridFluxo.RowCount-1) do
    begin
     if (vgridFluxo.Cells[0,itl] = '.TOTAL SEMANA') or (vgridFluxo.Cells[0,itl] = '.TOTAL MES') then
     begin
      vgridFluxo.cells[itc,itl]:=vDadosIni.alndir(Format('%n',[vtt]),14);
     // vtt:=0.00;
     end
     else
     begin
      vtt:=vtt+strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[itc,itl],14));
      vgridFluxo.Cells[itc,itl]:=vDadosIni.alndir(vgridFluxo.Cells[itc,itl],14);
     end;
    end;
   end;
   // totalizando as semanas;
   vlinic:=0.00;
//   strtofloat(tirapontos(vgridFluxo.Cells[1,1]));
   //   vlinicial;
   for itl:=1 to (vgridFluxo.RowCount-1) do
   begin
     if (vgridFluxo.Cells[0,itl] = '.TOTAL SEMANA') or  (vgridFluxo.Cells[0,itl] = '.TOTAL MES') then
     begin
      vgridFluxo.Cells[12,itl]:=vDadosIni.alndir(format('%n',[strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[1,itl],2))+
      strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[2,itl],2))+
      strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[3,itl],2))+
      strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[4,itl],2))+
      strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[5,itl],2))+
      strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[6,itl],2))-
      strtofloat(vDadosIni.tirapontos(vgridFluxo.Cells[7,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[8,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[9,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[10,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[11,itl],2))]),14);
      if vcolsaldini > 0 then
        vgridFluxo.Cells[13,itl]:=vDadosIni.alndir(format('%n',[
          strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[12,itl],2))-
          strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[2,vcolsaldini],2))]),14);
      if vgridFluxo.Cells[0,itl] = '.TOTAL SEMANA' then
        vgridFluxo.Cells[14,itl]:='FERIADO';
     end
     else
     begin
      vgridFluxo.Cells[12,itl]:=vDadosIni.alndir(format('%n',[vlinic+strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[1,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[2,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[3,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[4,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[5,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[6,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[7,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[8,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[9,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[10,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[11,itl],2))]),14);
      if vcolsaldini > 0 then
        vgridFluxo.Cells[13,itl]:=vDadosIni.alndir(format('%n',[
          strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[12,itl],2))-
          strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[2,vcolsaldini],2))]),14);
      vlinic:=vlinic+strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[1,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[2,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[3,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[4,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[5,itl],2))+
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[6,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[7,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[8,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[9,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[10,itl],2))-
      strtofloat(vdadosIni.tirapontos(vgridFluxo.Cells[11,itl],2));
      if vtip = 'D' then
      begin
       stridgrafico.Cells[0,0]:='Período';
       stridgrafico.Cells[0,1]:='Saldo Dia';
       stridgrafico.Cells[stridgrafico.ColCount-1,0]:=copy(vgridFluxo.Cells[0,Itl],5,5);
       stridgrafico.Cells[stridgrafico.ColCount-1,1]:=vgridFluxo.Cells[12,Itl];
       stridgrafico.Cells[0,2]:='Disponivel';
       stridgrafico.Cells[stridgrafico.ColCount-1,2]:=vgridFluxo.Cells[13,Itl];
       stridgrafico.ColWidths[stridgrafico.ColCount-1]:=100;
       stridgrafico.ColCount:=stridgrafico.ColCount+1;
      end
      else
      begin
       stridgrafico.Cells[0,0]:='Período';
       stridgrafico.Cells[0,1]:='Saldo Dia';
       stridgrafico.Cells[stridgrafico.ColCount-1,0]:=vgridFluxo.Cells[0,Itl];
       stridgrafico.Cells[stridgrafico.ColCount-1,1]:=vgridFluxo.Cells[12,Itl];
       stridgrafico.Cells[0,2]:='Disponivel';
       stridgrafico.Cells[stridgrafico.ColCount-1,2]:=vgridFluxo.Cells[13,Itl];
       stridgrafico.ColWidths[stridgrafico.ColCount-1]:=100;
       stridgrafico.ColCount:=stridgrafico.ColCount+1;
      end;
     end;
   end;
end;


function TFluxoCaixa.verificadiainicial(vdata: string;vempresasD: string): boolean;
begin
 buscas.Close;
 if (vDadosIni.vEmp.vFinanceiroUnificado) then
 	 buscas.sql.text:= ' select max(dia_fcd) as data from fech_Dia ' +
 		' where CODIGO_EMP = ' + IntToStr(vDadosIni.vEmp.vCodigoUnificadora)
 else
	 buscas.sql.text:= ' select max(dia_fcd) as data from fech_Dia ' +
 		' where CODIGO_EMP in ('+vempresasD+')';
 buscas.Open;
 vdtinicial:=buscas.FieldByName('data').AsDateTime+1;
 Result:=true;
 if strtodate(vdata) <> vdtinicial then
  Result:=false;
end;

function TFluxoCaixa.verificardiasemana: boolean;
begin
if (DayOfWeek(vFinal) = 1) or (DayOfWeek(vFinal) = 7) then
begin
   Application.MessageBox('Data final está no sábado ou Domingo, favor colocar um dia util', 'Confirmação', MB_OK);
   result:=false;
end
else
 result:=true;
end;

{ TCtrlCredchq }

function TCtrlCredchq.BIAtrasados(vempresasD: string;
  vFerCube: THierCube;Vdata: Tdate): boolean;
var
 vtppesq: string;
 vtppesq1: string;
begin
//  try
//(select result from strzero(extract(month from cr.data_venc_c),2))||''_''||extract(year from cr.data_venc_c) as mesano,'+
   datasetBI.Close;
   datasetBI.SQL.text:=
   ' select ''CRED'' as tipo,emp.identificacao_emp as nome_emp,ctrl.nome_ctrl as controle,cr.nome_c as nome,' +
   ' (select result from strzero(extract(day from cr.data_venc_c),2)) as dia,'+
   ' extract(month from cr.data_venc_c) as mes,extract(year from cr.data_venc_c) as ano,cr.data_venc_c,'+
   ' cr.n_doc_c as documento,sum(cr.valor_c) valor  from controle_creditos cr ' +
   ' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp ' +
   ' inner join empresa emp on cr.cod_emp_mult = emp.cod_empresa ' +
   ' where cr.data_venc_c < '''+FormatDateTime('mm/dd/yyyy',vdata)+''' ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
//   ' and cr.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
   ' in ('+vempresasD+')'+
   ' and cr.datq_c is null and ctrl.qperf = 1 ' +
   ' group by nome_emp,tipo,documento,controle,nome,mes,ano,dia,data_venc_c '+
   ' union '+
   ' select ''CHEQ'' as tipo,emp.identificacao_emp as nome_emp,ctrl.nome_ctrl as controle,ch.nome_ch as nome,' +
   ' (select result from strzero(extract(day from ch.data_venc),2)) as dia,'+
   ' extract(month from ch.data_venc) as mes,extract(year from ch.data_venc) as ano,ch.data_venc, ' +
   ' ch.n_ch as documento,sum(ch.valor_ch) as valor from controle_cheque ch ' +
   ' inner join controles ctrl on ch.codigo_ctrl = ctrl.codigo_ctrl and ch.codigo_emp = ctrl.codigo_emp' +
   ' inner join empresa emp on ch.cod_emp_mult = emp.cod_empresa ' +
   ' where ch.data_venc < '''+ FormatDateTime('mm/dd/yyyy',vdata)+''' ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ' +
//   ' and ch.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
   ' in ('+vempresasD+') ' +
   ' and ch.datq_ch is null and ctrl.qperf =  1 '+
   ' group by nome_emp,tipo,documento,controle,nome,mes,ano,dia,ch.data_venc ';
//
//and ctrl.fluxo_ctrl = ''S''
{  'union '+
  'select ''OST'' as tipo,SUM(i.VL_SERVT) as bruto,SUM(0) as desconto, SUM(0) as custo '+
  'from PEDVENDA_SERV_TERC i, PEDVENDA p '+
  'where i.nped = p.nped and i.tipo = p.tipo and '+
  'i.cod_empresa = p.cod_empresa and '+vtppesq+
  ' AND '+
  'p.cod_empresa in ('+vempresasD+') '+
  'and ((p.tipo = ''OS'' and (p.tipo_os = ''CLIENTE'' or p.tipo_os = ''EXTERNA'')) ) GROUP BY tipo';}
   datasetBI.Open;
   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
  vFerCube.DefineFieldAsDimension('controle','Controle Fin',dgRow);
  vFerCube.DefineFieldAsDimension('tipo','Tipo de Documento',dgRow);
  vFerCube.DefineFieldAsDimension('nome','Cliente',dgPage);
  vFerCube.DefineFieldAsDimension('ano','Ano do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('mes','Mês do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('dia','Dia do Movimento',dgPage);
  vFerCube.DefineFieldAsDimension('documento','N. Documento',dgPage);
  vFerCube.DefineFieldAsSummary('valor');
end;

constructor TCtrlCredchq.create;
begin
  buscas:=TIBQuery(DtmGestorHw.QrBuscas);
  transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
  dataSet:=TClientDataSet(DtmGestorHw.CdsCreditos);
  datasetBI:=TIBQuery(DtmGestorHw.IbCubeGeral);
  vdat1:=strtodate('01/01/2001');
  vdat2:=strtodate('01/01/2001');
end;

function TCtrlCredchq.CredChequesBI(vempresasD: string;
  vFerCube: THierCube;vdata: Tdate): boolean;
var
 vtppesq: string;
 vtppesq1: string;
begin
//  try
//(select result from strzero(extract(month from cr.data_venc_c),2))||''_''||extract(year from cr.data_venc_c) as mesano,'+
   datasetBI.Close;
   datasetBI.SQL.text:=
   ' select ''CRED'' as tipo,emp.identificacao_emp as nome_emp,ctrl.nome_ctrl as controle,cr.nome_c as nome, ' +
   ' (select result from strzero(extract(day from cr.data_venc_c),2)) as dia,'+
   ' extract(month from cr.data_venc_c) as mes,extract(year from cr.data_venc_c) as ano,cr.data_venc_c,'+
   ' cr.n_doc_c as documento,sum(cr.valor_c) valor,sum(cr.valor_liquido) as valor_liquido from controle_creditos cr ' +
   ' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp ' +
   ' inner join empresa emp on cr.cod_emp_mult = emp.cod_empresa ' +
   ' where cr.data_venc_c >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
   ' and cr.data_venc_c <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
//   ' and cr.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
   ' in ('+vempresasD+') '+
   ' and cr.datq_c is null and ctrl.qperf = 1 ' +
   ' group by nome_emp,tipo,documento,controle,nome,mes,ano,dia,data_venc_c '+
   ' union '+
   ' select ''CHEQ'' as tipo,emp.identificacao_emp as nome_emp,ctrl.nome_ctrl as controle,ch.nome_ch as nome, ' +
   ' (select result from strzero(extract(day from ch.data_venc),2)) as dia,'+
   ' extract(month from ch.data_venc) as mes,extract(year from ch.data_venc) as ano,ch.data_venc, ' +
   ' ch.n_ch as documento,sum(ch.valor_ch) as valor,sum(ch.valor_ch) as valor_liquido from controle_cheque ch ' +
   ' inner join controles ctrl on ch.codigo_ctrl = ctrl.codigo_ctrl and ch.codigo_emp = ctrl.codigo_emp ' +
   ' inner join empresa emp on ch.cod_emp_mult = emp.cod_empresa ' +
   ' where ch.data_venc >= '''+ FormatDateTime('mm/dd/yyyy',vdat1)+''' ' +
   ' and ch.data_venc <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ' +
//   ' and ch.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
   ' in ('+vempresasD+')'+
   ' and ch.datq_ch is null and ctrl.qperf = 1 '+
   ' group by nome_emp,tipo,documento,controle,nome,mes,ano,dia,ch.data_venc ';
   datasetBI.Open;
   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('nome_emp','Empresa',dgpage);
  vFerCube.DefineFieldAsDimension('controle','Controle Fin',dgCol);
  vFerCube.DefineFieldAsDimension('mes','Mês do Movimento',dgRow);
  vFerCube.DefineFieldAsDimension('dia','Dia do Movimento',dgRow);
  vFerCube.DefineFieldAsDimension('tipo','Tipo de Documento',dgRow);
  vFerCube.DefineFieldAsDimension('nome','Cliente',dgPage);
  vFerCube.DefineFieldAsDimension('ano','Ano do Movimento',dgCol);
  vFerCube.DefineFieldAsDimension('documento','N. Documento',dgPage);
  vFerCube.DefineFieldAsSummary('valor');
  vFerCube.DefineFieldAsSummary('valor_liquido');
end;

destructor TCtrlCredchq.destroy;
begin
  Close;
  inherited;
end;

function TCtrlCredchq.iniciavariaveis: boolean;
begin
  cdia:=0;
end;

function TCtrlCredchq.SomaCredCheq(vempresasD: string; vdata: Tdate;vusliq: string): boolean;
begin
 Result:=true;
 dataSet.Close;
 dataSet.CommandText:='select cc.* from controle_creditos cc ' +
	 ' inner join empresa emp on cc.codigo_emp = emp.cod_empresa ' +
   ' where cc.data_venc_c >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+ ''' ' +
   ' and cc.data_venc_c <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+ ''' ' +
   ' and (cc.status_c is null or cc.status_c = '''') ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cc.codigo_emp end) ' +
//   ' and cc.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
   ' in ('+ vempresasD+') ' +
   ' order by cc.data_venc_c';
 dataset.open;
 While not dataSet.EOF do
 begin
   buscas.close;
   buscas.SQL.Text:='select * from controles where codigo_ctrl = '+
   dataSet.FieldByName('CODIGO_CTRL').AsString+' and codigo_emp in ('+
   vempresasD+')';
   buscas.open;
   if buscas.FieldByName('QPERF').value = 1 then
   begin
    IF dataset.FieldByName('Data_venc_c').Value = vdata then
    begin
      if vusliq = 'S' then
       cdia:=cdia+dataSet.FieldByName('Valor_liquido').AsCurrency
      else
       cdia:=cdia+dataSet.FieldByName('Valor_c').AsCurrency;
    end;
   end;
   dataSet.next;
 end;
 dataset.Close;
 dataSet.CommandText:='select ch.* from controle_cheque ch '+
   ' inner join empresa emp on ch.codigo_emp = emp.cod_empresa ' +
   ' where ch.data_venc >= '''+FormatDateTime('mm/dd/yyyy',vdat1)+''' ' +
   ' and ch.data_venc <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+''' ' +
   ' and (ch.status_ch is null or ch.status_ch = '''') ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ' +
//   ' and '+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
   ' in ('+ vempresasD+') ' +
   ' order by ch.data_venc';
 dataset.open;
 While not dataSet.EOF do
 begin
   buscas.close;
   buscas.SQL.Text:='select * from controles where codigo_ctrl = '+
   dataSet.FieldByName('CODIGO_CTRL').AsString+' and codigo_emp in ('+
   vempresasD+')';
   buscas.open;
   if buscas.FieldByName('QPERF').value = 1 then
   begin
    IF dataset.FieldByName('Data_venc').Value = vdata then
    begin
        cdia:=cdia+dataSet.FieldByName('Valor_ch').Value;
    end;
   end;
   dataSet.next;
 end;
 buscas.Close;
end;

function TCtrlCredchq.verificaAtrasados(vempresasD: string;
  vdata: Tdate): boolean;
begin
dataSet.Close;
dataSet.CommandText:='select sum(cr.valor_c) as valor from controle_creditos cr ' +
  ' inner join empresa emp on cr.codigo_emp = emp.cod_empresa ' +
	' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp ' +
  ' where (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
//  ' where cr.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
  ' in ('+vempresasD+') ' +
  ' and cr.data_venc_c < '''+FormatDateTime('mm/dd/yyyy',vdata)+''' ' +
  ' and cr.datq_c is null '+
  ' and ctrl.qperf = 1 ' +
  ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
//  ' and cr.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
  ' in ('+vempresasD+')'+
  ' union '+
  ' select sum(ch.valor_ch) as valor from controle_cheque ch ' +
  ' inner join empresa emp on ch.codigo_emp = emp.cod_empresa ' +
  ' inner join controles ctrl on ch.codigo_ctrl = ctrl.codigo_ctrl and ch.codigo_emp = ctrl.codigo_emp ' +
  ' where (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ' +
//  ' where ch.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
  ' in ('+vempresasD+') ' +
  ' and ch.data_venc <= '''+FormatDateTime('mm/dd/yyyy',vdata)+ ''' ' +
  ' and ch.datq_ch is null  ' +
  ' and ctrl.qperf = 1 ' +
  ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ' +
//  ' and ch.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
  ' in ('+vempresasD+')';
dataSet.Open;
vatrasados:=0;
while not dataSet.Eof do
begin
  vatrasados:=vatrasados+dataSet.FieldByName('valor').AsCurrency;
  dataSet.next;
end;
dataSet.close;
vatrapagar:=0;
dataSet.Close;
dataSet.CommandText:=' select sum(ctp.valor_ctp) as valor from contas_a_pagar ctp ' +
  ' inner join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
	' where ctp.data_venc_ctp < '''+FormatDateTime('mm/dd/yyyy',vdata)+''' ' +
	' and ctp.datq_ctp is null ' +
  ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctp.codigo_emp end) ' +
//	' and ctp.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp')+
	' in ('+vempresasD+')';
dataSet.Open;
vatrapagar:=dataSet.FieldByName('valor').AsCurrency;
dataSet.close;
Result:=true;
end;

{ TControles }

function TControles.ControlesBI(vempresasD: string;
  vFerCube: THierCube): boolean;
begin

end;

constructor TControles.create;
begin
  dataset:=TClientDataSet(DtmGestorHw.CdsControles);
  buscas:=TIBQuery(DtmGestorHw.QrBuscas);
  transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
  ValorInicial:=0;
end;

destructor TControles.destroy;
begin

  inherited;
end;

function TControles.SomaSaldoinicial(vempresasD: string; vdata: Tdate): boolean;
var
 vdtcaixa: Tdate;
 vSaldoTemp: Double;
 buscas2: TIBQuery;
begin
 Result:=true;

 vSaldoTemp := 0;
 dataSet.close;
 dataset.CommandText:= ' select * from controles ' +
 	' where codigo_emp in ('+vempresasD+')'+
  ' and ativo = 1 ' +
  ' order by codigo_ctrl ';
 dataSet.open;
 vsaldbanc:=0.00;
 ValorInicial:=0;
 while not dataSet.EOF do
 begin
    application.ProcessMessages;
    if trim(dataSet.fieldbyname('fluxo_ctrl').text) = 'S' then
    begin
     vDadosIni.progressoFuncao('','','Verificando Controle '+ trim(dataSet.FieldByName('NOME_CTRL').AsString));
     buscas.close;
     buscas.sql.text:='select val_sld,saldo_banco from sal_ctrl ' +
     	' where data_sld = '''+ FormatDateTime('mm/dd/yyyy',(vdata-1))+''' ' +
      ' and codigo_ctrl = '+dataset.FieldByName('codigo_ctrl').AsString+
      ' and cod_emp in ('+vempresasD+')';
     buscas.open;
     if buscas.isempty then
     begin
      buscas.close;
      buscas.sql.text:='select val_sld,saldo_banco from sal_ctrl ' +
      	' where codigo_ctrl = '+dataSet.FieldByName('CODIGO_CTRL').AsString+
        ' and data_sld = (select max(data_sld) from sal_ctrl ' +
        '									where codigo_ctrl = '+dataSet.FieldByName('CODIGO_CTRL').AsString +
        '									and cod_emp in ('+vempresasD+')) ' +
        ' and cod_emp in ('+vempresasD+')';
      buscas.open;
     end;
     if dataSet.FieldByName('CONTR_BANC').AsString = 'S' then
     begin
      if vDadosIni.StrToFloatFormat(buscas.FieldByName('SALDO_BANCO').AsFloat, 2) <>
         vDadosIni.StrToFloatFormat(buscas.FieldByName('VAL_SLD').AsFloat, 2) then
           Application.MessageBox(Pchar('Saldo do controle bancário: ' +trim(dataSet.FieldByName('NOME_CTRL').AsString) +
           ' não está conciliado(Saldo Banco: ' + format('%n', [buscas.FieldByName('SALDO_BANCO').AsFloat])+
           '/Saldo Finan: '+ format('%n', [buscas.FieldByName('VAL_SLD').AsFloat])+')'),
           'Atenção', MB_OK + MB_ICONINFORMATION);
      vsaldbanc:=vsaldbanc+buscas.FieldByName('VAL_SLD').AsFloat + vSaldoTemp
     end
     else
      ValorInicial := ValorInicial+buscas.FieldByName('VAL_SLD').AsFloat + vSaldoTemp;
    end;
    dataSet.Next;
    buscas.close;
 end;
//         ValorInicial:=QrsaldoInicialSUM.value;
// Verifica lanámentos do dia em controles bancários...
 buscas.Close;
 buscas.sql.text:='select max(dia_fcd) as data from fech_Dia ' +
 	' where CODIGO_EMP in ('+vempresasD+')';
 buscas.Open;
 vdtcaixa:=buscas.FieldByName('data').AsDateTime;
// buscas.close;
// buscas.SQL.Text:='select l.tipo_l as tipo,sum(l.valor_l) as lancados from lancamentos l,controles c where '+
// 'l.data = '''+FormatDateTime('mm/dd/yyyy',vdtcaixa+1)+''' and '+
// 'l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp and c.fluxo_ctrl = ''S'' and '+
// 'c.contr_banc = ''S'' and l.codigo_emp in ('+vempresasD+') group by l.tipo_l';
// buscas.open;
 buscas.close;
 buscas.SQL.Text:='select l.tipo_l as tipo,sum(l.valor_l) as lancados from lancamentos l ' +
 ' inner join controles c on l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp ' +
 ' where l.data > '''+FormatDateTime('mm/dd/yyyy',vdata-1)+''' ' +
 ' and l.data <= '''+FormatDateTime('mm/dd/yyyy',vdtcaixa + 1)+''' ' +
 ' and c.fluxo_ctrl = ''S'' and c.contr_banc = ''S'' ' +
 ' and l.codigo_emp ' +
// ' and l.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp')+
 ' in ('+vempresasD+') ' +
 ' group by l.tipo_l';
 buscas.open;
 while Not buscas.eof do
 begin
  if buscas.FieldByName('tipo').AsString = 'E' then
   vsaldbanc:=vsaldbanc+buscas.FieldByName('lancados').AsCurrency
  else
   vsaldbanc:=vsaldbanc-buscas.FieldByName('lancados').AsCurrency;
  buscas.Next;
 end;
 // Verifica lançamentos do dia em controles não bancários...
// buscas.close;
// buscas.SQL.Text:='select l.tipo_l as tipo,sum(l.valor_l) as lancados from lancamentos l,controles c where '+
// 'l.data = '''+FormatDateTime('mm/dd/yyyy',vdtcaixa+1)+''' and '+
// 'l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp and c.fluxo_ctrl = ''S'' and '+
// '(c.contr_banc = '''' or c.contr_banc is null or contr_banc = ''N'') and l.codigo_emp in ('+vempresasD+') group by l.tipo_l';
// buscas.open;
 buscas.close;
 buscas.SQL.Text:='select l.tipo_l as tipo,sum(l.valor_l) as lancados from lancamentos l ' +
 ' inner join controles c on l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp ' +
 ' where l.data > '''+FormatDateTime('mm/dd/yyyy',vdata-1)+''' '+
 ' and l.data <= '''+FormatDateTime('mm/dd/yyyy',vdtcaixa+1)+''' ' +
 ' and c.fluxo_ctrl = ''S'' and (c.contr_banc = '''' or c.contr_banc is null or contr_banc = ''N'') ' +
 ' and l.codigo_emp in ('+vempresasD+') ' +
 ' group by l.tipo_l';
 buscas.open;
 while Not buscas.eof do
 begin
  if buscas.FieldByName('tipo').AsString = 'E' then
   ValorInicial:=ValorInicial+buscas.FieldByName('lancados').AsCurrency
  else
   ValorInicial:=ValorInicial-buscas.FieldByName('lancados').AsCurrency;
  buscas.Next;
 end;
 buscas.close;
end;

{ TApuracaoDep }

function TApuracaoDep.abrebase: boolean;
begin
 montaSelect('select * from APURACAO_DEPTO where ativo = 1 order by ano,mes,cod_dep');
end;

function TApuracaoDep.buscaapuracao(vcoddepto: integer;vcodemp: string): boolean;
begin
 Result:=true;
 montaSelect('select * from apuracao_depto where cod_dep = '+IntToStr(vcoddepto)+
 ' and mes = '+IntToStr(vmesap)+' and ano = '+IntToStr(vanoap)+' and cod_empresa = '+vcodemp);
 //' and cod);
 if dataset.IsEmpty then
 begin
     Application.MessageBox('Apuracao não encontrada para o período informado', 'Confirmação', MB_OK);
    result:=false;
 end;
end;

constructor TApuracaoDep.create;
begin
  dataset:=TClientDataSet(DtmGestorHw.CdsApuracaoDep);
  buscas:=TIBQuery(DtmGestorHw.QrBuscas);
  transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
end;

destructor TApuracaoDep.destroy;
begin
  Close;
  inherited;
end;

function TApuracaoDep.post: boolean;
begin
  try
    Result := false;
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.FieldByName('COD_DEP').asinteger = 0 then
      raise exception.create('Departamento não informado');
    if dataSet.FieldByName('MES').asinteger = 0 then
      raise exception.create('Mês não informado');
    if dataSet.FieldByName('ANO').asinteger = 0 then
      raise exception.create('Ano não informado');
    if trim(dataSet.FieldByName('TPDESP').AsString) = '' then
      raise exception.create('Tipo de Custo não informado');
    if dataSet.FieldByName('VALOR').AsCurrency = 0 then
      raise exception.create('Valor do Custo não informado');


    if dataSet.State in [dsInsert] then
    begin
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    end;
    dataSet.FieldByName('datacad_ap').AsDateTime:=
    strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+dataSet.FieldByName('MES').AsString+'/'+dataSet.FieldByName('ANO').AsString)))+'/'+dataSet.FieldByName('MES').AsString+'/'+dataSet.FieldByName('ANO').AsString);


    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
       if CommitaTransacao then
         vDadosIni.GravaAuditoria('GES001', 'SALVAR', 'TRANSACAO CONFIRMADA DEPTO ' +
          dataSet.FieldByName('COD_DEP').AsString+' MES '+dataSet.FieldByName('MES').AsString+' ANO '+
          dataSet.FieldByName('ANO').AsString, '', '', buscas);
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('GES001', 'SALVAR', 'TRANSACAO NAO CONFIRMADA DEPTO ' +
          dataSet.FieldByName('COD_DEP').AsString+' MES '+dataSet.FieldByName('MES').AsString+' ANO '+
          dataSet.FieldByName('ANO').AsString, '', '', buscas);
      Result := FALSE;
    end;
    Refresh;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ Testoque }

function Testoque.abreBase: Boolean;
begin
 dataset.close;
 dataSet.CommandText:=
  ' select * from produtos pr ' +
  ' where cod_empresa in (' + vempresas + ') ' +
  ' and ativo=1 and ((consumo <> '+QuotedStr('S')+') or (consumo is null)) ' +
  ' and ((pr.dat_cad_prod is null) or (pr.dat_cad_prod <= :data_ref))' +
  ' and ((((select count(cod_prod) from reqvenda_itens where grupo_prod = pr.grupo_prod ' +
  ' and cod_prod = pr.cod_prod ' +
  ' and cod_empresa in (' + vempresas + ') and ativo=1) >= 1 ) ' +
  ' or ((select count(cod_prod) from os_item_prod ' +
  ' where grupo_prod = pr.grupo_prod and cod_prod = pr.cod_prod ' +
  ' and cod_empresa in (' + vempresas + ') and ativo=1) >= 1 ) ' +
  ' or ((select count(cod_prod) from pedvenda_prod ' +
  ' where grupo_prod = pr.grupo_prod and cod_prod = pr.cod_prod ' +
  ' and cod_empresa in (' + vempresas + ') ' +
  ' and tipo in (''REQ'', ''OS'') and ativo=1) >= 1) ' +
  ' or ((select count(cod_prod) from item_nf_entrada ' +
  ' where grupo_prod = pr.grupo_prod and cod_prod = pr.cod_prod ' +
  ' and cod_empresa in (' + vempresas + ') and ativo=1) >= 1 ) ' +
  ' or ((select count(nfit.cod_prod) from notafiscal_item nfit ' +
  ' inner join notafiscal nf on nf.cod_nf=nfit.cod_nf and nf.cod_empresa=nfit.cod_empresa ' +
  ' where nf.natureza_nf=''E'' and nfit.grupo_prod = pr.grupo_prod and nfit.cod_prod = pr.cod_prod ' +
  ' and nfit.cod_empresa in (' + vempresas + ') and nfit.ativo=1) >= 1 ) ) ' +
  ' or ((est_f) > 0 and cod_empresa in (' + vempresas + ')))';
 dataset.Params.ParamByName('data_ref').AsDateTime := vdataref;
 dataset.open;
end;

constructor Testoque.create;
begin
 dataset:=TClientDataSet(DtmGestorHw.CdsEstoques);
 buscas:=TIBQuery(DtmGestorHw.QrBuscas);
 transacao:=TIBTransaction(DtmGestorHw.IbTransHwGestor);
 vestoqueHw:=TClientDataSet(dtmGestorHw.CdsEstoquehw);
end;

destructor Testoque.destroy;
begin

  inherited;
end;

function Testoque.getQuantidadePendenteReqOS(grupo_prod: integer;
  cod_prod: string): Double;
begin
  buscas.close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item) as valor from pedvenda pv' +
    ' inner join pedvenda_prod ipv on ipv.nped = pv.nped' +
    ' and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo' +
    ' where ipv.cod_prod = ' + quotedstr(cod_prod) +
    ' and ipv.grupo_prod = ' + inttostr(grupo_prod) +
    ' and ((ipv.status is null) or (ipv.status <> ''CANCELADO''))' +
    ' and pv.tipo <> ''ORC''' +
    ' and (pv.data_fech is null or pv.data_fech < ''01/01/1900'') ' +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and pv.ativo = 1';
  //  buscas.ParamByName('vgrup').AsInteger := grupo_prod;
  //  buscas.ParamByName('vcod').AsString := cod_prod;
  buscas.Prepare;
  buscas.Open;
  Result := buscas.FieldByName('valor').AsFloat;

  buscas.Close;
  buscas.SQL.Text := ' select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as valor from producao pd ' +
    ' inner join producao_item_indice pi on pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa ' +
    ' where pi.grupo_prod = ' + IntToStr(grupo_prod) + ' and pi.cod_prod = ' + QuotedStr(cod_prod) +
    ' and (pd.data_fechamento is null) and pd.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := Result + buscas.FieldByName('valor').AsFloat;

  buscas.Close;
  buscas.UnPrepare;
end;

function Testoque.gravainv(vqtde: real; vvalor: currency; vobs,
  vtipo: string;vpend: double): boolean;
begin
  Result:=true;
//  vpend:=0;
  vestoqueHw.Append;
  vestoqueHw.FieldByName('CODSEQ_BALANCO').AsInteger:=vcodbal;
  vestoqueHw.FieldByName('MES').AsInteger:=vmes;
  vestoqueHw.FieldByName('ANO').AsInteger:=vano;
  vestoqueHw.FieldByName('COD_EMPRESA').AsString:=vempresas;
  if vtipo = 'P' then
  begin
   vestoqueHw.FieldByName('GRUPO_PROD').AsInteger:=dataSet.FieldByName('GRUPO_PROD').AsInteger;
   vestoqueHw.FieldByName('COD_PROD').asstring:=dataSet.FieldByName('COD_PROD').AsString;
   vestoqueHw.FieldByName('VERSAOV').AsInteger:=0;
   vestoqueHw.FieldByName('CHASSI_MT').AsString:='0';
  end
  else
  begin
   vestoqueHw.FieldByName('GRUPO_PROD').AsInteger:=dataSet.FieldByName('CODIGO').AsInteger;
   vestoqueHw.FieldByName('COD_PROD').asstring:=dataSet.FieldByName('CHASSI_C').AsString;
   vestoqueHw.FieldByName('VERSAOV').AsInteger:=dataSet.FieldByName('CODIGO').AsInteger;
   vestoqueHw.FieldByName('CHASSI_MT').AsString:=dataSet.FieldByName('CHASSI_C').AsString;
  end;
  vestoqueHw.FieldByName('QUANTIDADE').AsFloat:=vqtde;
  vestoqueHw.FieldByName('VALOR_PROD').AsCurrency:=vvalor;
  vestoqueHw.FieldByName('OBSOLETO').AsString:=vobs;
//  if vobs = 'S' then
  vestoqueHw.FieldByName('QTDE_REAL').AsFloat:=vqtde-vpend;
//  else
//   vestoqueHw.FieldByName('QTDE_REAL').AsFloat:=vqtde;
  try
    vestoqueHw.post;
  Except
    on E: Exception do
    begin
      Application.MessageBox(Pchar('GEST001 '+e.Message+' DADO: '+vestoqueHw.FieldByName('COD_PROD').asstring), 'Confirmação', MB_OK);
      vestoqueHw.Cancel;
      registraErro('GEST001 ' + e.Message+' DADO: '+vestoqueHw.FieldByName('COD_PROD').asstring);
      Result := False;
    end;
  end;
end;

function Testoque.verificaestoques(vLab:Tlabel): currency;
var
 vtotger,vtotgert: Double;
 vest,vvenda,vcompra,vdev,vpendencias: Double;
 vprc,vrCurrency: Double;
 vdatultvnd,vdatultentr: Tdate;
 vob: string;
 vcount: integer;
 buscas2, buscasMov, buscasCompra: TIBQuery;
 fTempChassi : TClientDataSet;
 vExisteGrade: boolean;
 vGradeP: boolean;
begin

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vExisteGrade := trim(retornaValor('select coalesce(cod_grade, 0) as valor from grade ' +
   ' where ativo = 1 and cod_grade > 0 and cod_empresa = ' + vDadosIni.codEmpresa)) <> '';

    vestoqueHw.Close;
    vestoqueHw.CommandText:='SELECT * FROM INV_BALANCO ' +
    	' WHERE MES = '+inttostr(vmes)+
      ' and ano = '+inttostr(vano)+
      ' and cod_empresa in ('+vempresas+ ') ' +
      ' and codseq_balanco = '+IntToStr(vcodbal);
    vestoqueHw.Open;
    vtotger := 0.00;
    vtotgert := 0.00;
    vobsoletos:=0.00;
    vestprodutos:=0.00;
    vob:='';
    vcount:=1;
    dataSet.First;
    while not dataSet.Eof do
    begin
      vpendencias:=0;
      Application.ProcessMessages;
      vLab.Caption:=vDadosIni.StrZero(vcount,6)+' G: '+dataSet.FieldByName('GRUPO_PROD').AsString+' C: '+
      dataSet.FieldByName('COD_PROD').AsString;
//      if variavel_parar = 1 then
//      begin
//        Parar;
//        Exit;
//      end;
      if vdataref < date then
      begin
        vLab.Caption:=vLab.Caption+' V';

        vDadosIni.RetornarEstoquePrecoCusto(buscas, buscas2, DateToStr(vdataref),
          dataSet.FieldByName('GRUPO_PROD').AsInteger, dataSet.FieldByName('COD_PROD').asstring,
          vExisteGrade, vGradeP, vest, vprc);
//        vprc := vrCurrency;//adicionei a variavel vrCurrency apenas para chamar o metodo , pois nao aceita de tipos diferentes

        if (not vGradeP) or (buscas.IsEmpty) then
        begin
          buscas.Close;
          buscas.SQL.Text:='select sum(it.quant_ped_item) as valor from pedvenda_prod it ' +
           ' inner join pedvenda p on it.nped = p.nped and it.tipo = p.tipo and it.cod_empresa = p.cod_empresa ' +
           ' where it.cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+''' ' +
           ' and it.grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
           ' and (it.status is null or it.status = '''') ' +
           ' and p.cod_empresa ' +
           ' in ('+vempresas+') '+
           ' and p.data_fech  >= '''+FormatDateTime('mm/dd/yyyy',(vdataref+1))+''' ' +
           ' and p.tipo <> ''ORC''  and p.ativo = 1';
          buscas.Open;
          try
           vvenda:=buscas.FieldByName('valor').AsFloat;
          except
           on E: Exception do
           begin
             Application.MessageBox(Pchar('GEST001 '+e.Message+' '+buscas.sql.text), 'Confirmação', MB_OK);
             registraErro('GEST001 ' + e.Message+' '+' '+buscas.sql.text);
           end;
          end;
          buscas.Close;
          buscas.SQL.Text:='select sum(it.quant_item_nfe) as soma from item_nf_entrada it ' +
           ' inner join nf_entrada nf on it.num_nota_nfe = nf.num_nota_nfe '+
           '		and it.cod_forn_nfe = nf.cod_forn_nfe and nf.cod_empresa = it.cod_empresa ' +
           ' where it.cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+''' '+
           ' and it.grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
           ' and  nf.data_lanc_nfe  >= '''+FormatDateTime('mm/dd/yyyy',(vdataref+1))+ ''' ' +
           ' and (not nf.status_nfe is null)  '+
           ' and nf.cod_empresa ' +
           ' in ('+vempresas+') and nf.ativo=1 '+
           ' union '+
           ' select sum(it.quantidade) as soma from notafiscal_item it ' +
           ' inner join notafiscal nf on it.cod_nf = nf.cod_nf and it.cod_empresa = nf.cod_empresa '+
           ' where it.cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+''' '+
           ' and it.grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
           ' and nf.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',(vdataref+1))+ ''' ' +
           ' and (nf.status = ''Fechada'') ' +
           ' and nf.cod_empresa ' +
           ' in ('+vempresas+') ' +
           ' and nf.natureza_nf=''E'' and nf.ativo=1 ';
          vLab.Caption:=vLab.Caption+' C';
          Application.ProcessMessages;
          buscas.Open;
          vcompra:=0;
          while not buscas.Eof do
          begin
           vcompra:=vcompra+buscas.FieldByName('soma').AsFloat;
           buscas.next;
          end;
          buscas.Close;
          buscas.sql.text:='select ' +
           ' case when sum(dev.quant*dev.valor) is null then 0 ' +
           '		  else sum(dev.quant*dev.valor) end as valor,' +
           ' case when sum(dev.quant) is null then 0 else sum(dev.quant) end as qtd from devolucao dev '+
           ' where dev.cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+ ''' ' +
           ' and dev.grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
           ' and dev.data  >= '''+FormatDateTime('mm/dd/yyyy',(vdataref+1))+''' ' +
           ' and dev.cod_empresa ' +
           ' in ('+vempresas+') '+
           ' and dev.ativo = 1 and coalesce(dev.nf_gerou,'''') <> ''S''';
          buscas.open;
          vLab.Caption:=vLab.Caption+' D';
          Application.ProcessMessages;
          try
  	        vdev:=buscas.FieldByName('qtd').AsFloat;
	          vest := (((dataSet.FieldByName('EST_F').AsFloat) - (vcompra+vdev)) + (vvenda));
          except
           on E: Exception do
           begin
             Application.MessageBox(Pchar('GEST001 '+e.Message+' '+buscas.sql.text), 'Confirmação', MB_OK);
             registraErro('GEST001 ' + e.Message+' '+' '+buscas.sql.text);
           end;
          end;
        end;
        if vDadosIni.StrToFloatFormat(vest, 3) > 0.000 then
        begin
          if vprC = 0 then
          begin
            buscas.Close;
            buscas.SQL.Text:= ' SELECT c.data,c.valor,c.prec_cus_med FROM CUSTOS c ' +
              ' WHERE c.GRUPO_PROD = '+dataSet.FieldByName('GRUPO_PROD').AsString+
              ' AND c.COD_PROD = '''+dataSet.FieldByName('COD_PROD').AsString+ ''' ' +
              ' AND c.DATA < '''+FormatDateTime('mm/dd/yyyy',(vdataref+1))+ ''' ' +
              ' and c.cod_empresa ' +
              ' in ('+vempresas+') ' +
              ' and c.ativo=1 ' +
              ' order by c.data desc ';
            buscas.Open;
            vLab.Caption:=vLab.Caption+' UC';
            Application.ProcessMessages;
            try
            if buscas.IsEmpty then
              vprC := dataSet.FieldByName('PREC_CUSM_PROD').AsFloat
            else
            begin
              if (buscas.FieldByName('PREC_CUS_MED').isnull) or
              (buscas.FieldByName('PREC_CUS_MED').AsFloat = 0) then
                vprC := buscas.FieldByName('VALOR').AsFloat
              else
                vprC := buscas.FieldByName('PREC_CUS_MED').AsFloat;
            end;
            except
             on E: Exception do
             begin
               Application.MessageBox(Pchar('GEST001 '+e.Message+' '+buscas.sql.text), 'Confirmação', MB_OK);
               registraErro('GEST001 ' + e.Message+' '+' '+buscas.sql.text);
             end;
            end;
          end;
        end;
      end
      else
      begin
        try
        vest := dataSet.FieldByName('EST_F').AsFloat;
        vprc := dataSet.FieldByName('PREC_CUSM_PROD').AsFloat;
        except
         on E: Exception do
         begin
           Application.MessageBox(Pchar('GEST001 '+e.Message+' '+buscas.sql.text), 'Confirmação', MB_OK);
           registraErro('GEST001 ' + e.Message+' '+' '+buscas.sql.text);
         end;
        end;
      end;
      if vest > 0 then
      begin
        vob:='N';
        vtotger := vtotger + (vest * vprC);
        vtotgert := vtotgert + (vest * vprC);
        vestprodutos:=vestprodutos+(vest * vprC);
        buscas.close;
        buscas.sql.text:='select max(data_os_rq) as UltimaData from demandap4 ' +
        	' where grupo_prod = '+dataSet.FieldByName('GRUPO_PROD').AsString+
        	' and cod_prod = '''+dataSet.FieldByName('COD_PROD').AsString+''' ' +
          ' and cod_empresa in ('+vempresas+') and ativo=1';
        buscas.Open;
        vLab.Caption:=vLab.Caption+' UV';
        Application.ProcessMessages;
        if not buscas.IsEmpty then
         vdatultvnd:=buscas.FieldByName('ultimadata').AsDateTime
        else
         vdatultvnd:=strtodate('01/01/1990');
        buscas.close;
        buscas.sql.text:='select max(data) as data_lanc_nfe from custos ' +
          ' where grupo_prod = ' + dataSet.FieldByName('GRUPO_PROD').AsString +
          ' and cod_prod = ' + quotedstr(dataSet.FieldByName('COD_PROD').AsString) +
          ' and cod_empresa in (' +vempresas+') and ativo=1';
        buscas.Open;
        vLab.Caption:=vLab.Caption+' UC';
        Application.ProcessMessages;
        if not buscas.IsEmpty then
         vdatultentr:=buscas.FieldByName('data_lanc_nfe').AsDateTime
        else
         vdatultentr:=strtodate('01/01/1990');
        if dataset.FieldByName('CONSUMO').AsString <> 'S' then
        begin
          if (vDadosIni.vEmp.vApresentarEstR = 'O') or (vDadosIni.vEmp.vApresentarEstR = 'R')
          or (vDadosIni.vEmp.vApresentarEstR = 'P') or (vDadosIni.vEmp.vApresentarEstR = 'S') then
           vpendencias:=getQuantidadePendenteReqOS(dataSet.FieldByName('GRUPO_PROD').AsInteger,dataSet.FieldByName('COD_PROD').AsString);

          if (vdatultvnd = strtodate('01/01/1990')) and (vdatultentr = strtodate('01/01/1990')) then
          begin
            vobsoletos:=vobsoletos+((vest-vpendencias)*vprC);
            vob:='S';
          end
          else
          begin
            if (date-360) > vdatultvnd then
            begin
             if (date-360) > vdatultentr then
             begin
               vobsoletos:=vobsoletos+((vest-vpendencias) * vprC);
               vob:='S';
             end;
            end;
          end;
        end;
        buscas.close;
        gravainv(vest,vprc,vob,'P',vpendencias);
      end;
      dataset.next;
      vcount:=vcount+1;
    end;
    // Estoque de Veiculos

    if date > vdataref then
    begin

      fTempChassi := TClientDataSet.Create(nil);
      fTempChassi.Close;
      fTempChassi.FieldDefs.Clear;
      fTempChassi.FieldDefs.Add('CHASSI', ftString, 80, false);
      if fTempChassi.Tag = 0 then
        try
          fTempChassi.CreateDataSet;
          fTempChassi.Tag := 1;
        except
        end;
      fTempChassi.EmptyDataSet;

      buscasCompra := TIBQuery.Create(Application);
      buscasCompra.Database := buscas.Database;
      buscasCompra.Transaction := buscas.Transaction;

      dataSet.close;
      dataSet.CommandText := ' select est.chassi_c, ' +
        ' (select first 1 (et.data_ch_nota) from comprasmesesv40 et where ' +
        ' et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota desc) as data_ch_nota, ' +
        ' est.descricao_versaoest, est.corest, est.ano_fabest,est.ano_modest, ' +
        ' (select first 1 (et.custo) from comprasmesesv40 et ' +
        ' where et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota desc) custo, ' +
        ' tpm.cilindrada,tpm.codigo,tpm.ordtipo,est.cod_empresa from est_moto est ' +
        ' inner join TIPMODELO tpm on tpm.codigo = est.versaoest and tpm.cod_empresa = est.cod_empresa' +
        ' where est.cod_empresa in ('+vempresas+') and est.ativo = 1 ' +
        ' and (est.posicao = ''VIVO'' and est.status_estoque = ''S'') and est.status_uso = ''N''';
      if vDadosIni.vEmp.vConsDepositoEstoque = 'S' then
        dataSet.CommandText := dataSet.CommandText + ' union ' +
          ' select est.chassi_c,(select first 1 (et.data_ch_nota) from comprasmesesv40 et ' +
          ' where et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota desc) as data_ch_nota, ' +
          ' est.descricao_versaoest,est.corest, est.ano_fabest, est.ano_modest, ' +
          ' (select first 1 (et.custo) from comprasmesesv40 et where ' +
          ' et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota desc), ' +
          ' tpm.cilindrada,tpm.codigo,tpm.ordtipo,est.cod_empresa from est_moto est,TIPMODELO tpm ' +
          ' where est.status_transdep = ''S'' and est.data_trans_ret is null and est.versaoest = tpm.codigo ' +
          ' and est.cod_empresa = tpm.cod_empresa and est.cod_empresa in ('+vempresas+') ' +
          ' and (trim(coalesce(est.posicao, '''')) = ''MORTO'') and est.ativo = 1 and est.status_uso = ''N''';
      dataSet.CommandText := dataSet.CommandText + ' union ' +
        ' select vn.chassiv,vn.data_ven, est.descricao_versaoest, est.corest, est.ano_fabest, est.ano_modest, ' +
        ' (select first 1 (et.custo) from comprasmesesv40 et ' +
        ' where et.chassi = vn.chassiv and et.cod_empresa = vn.cod_empresa order by data_ch_nota), ' +
        ' tpm.cilindrada,tpm.codigo,tpm.ordtipo,vn.cod_empresa from com_fat vn ' +
        ' inner join est_moto est on est.chassi_c = vn.chassiv and est.codigo = vn.cod_estmoto and est.cod_empresa = vn.cod_empresa ' +
        ' inner join tipmodelo tpm on tpm.codigo = est.versaoest and tpm.cod_empresa = est.cod_empresa ' +
        ' inner join nat_op nat on nat.codigo_nop = vn.natop_v ' +
        ' where vn.data_ven >= :vdat1 and vn.data_ven <= :vdat2 and vn.altera_estoque_cfop = ''S'' ' +
        ' and vn.natureza = ''S'' and vn.cod_empresa in ('+vempresas+') ' +
        ' and (trim(coalesce(est.posicao, '''')) = ''MORTO'')  and (trim(coalesce(vn.status_v, '''')) = ''FECHADO'')' +
        ' and vn.tipo_venda_v = ''N'' order by 10,4 ';
      dataSet.Params.parambyName('VDAT1').AsDate := vdataref + 1;
      dataSet.Params.parambyName('VDAT2').AsDate := date;
      dataSet.open;

      while not dataSet.Eof do
      begin
        Application.ProcessMessages;

        fTempChassi.Filter := 'CHASSI = ' + QuotedStr(trim(dataSet.FieldByName('CHASSI_C').AsString));
        fTempChassi.Filtered := True;

        if fTempChassi.IsEmpty then
        begin
          buscasCompra.close;
          buscasCompra.SQL.Text := ' select first 1 est.chassi_c chassi, e.dia data_ch_nota, est.descricao_versaoest, ' +
           ' est.corest cor, est.ano_fabest ano_fab, est.ano_modest ano_mod, e.custo_medio prec_cusm_prod ' +
           ' from estoque_diario e ' +
           ' inner join est_moto est on est.chassi_c = e.chassi and est.cod_empresa = e.cod_empresa' +
           ' where e.chassi = :vchass and e.dia <= :vdat1 and e.cod_empresa = :cod_empresa ' +
           ' order by e.dia desc ';
          buscasCompra.parambyName('VCHASS').AsString := dataSet.FieldByName('CHASSI_C').AsString;
          buscasCompra.parambyName('VDAT1').AsDate := vdataref;
          buscasCompra.parambyName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
          buscasCompra.open;

          if buscasCompra.IsEmpty then
          begin
            buscasCompra.close;
            buscasCompra.SQL.Text := ' select it.chassi_c,et.data_ch_nota,it.descricao_versao,' +
             ' it.cor,it.ano_fab,it.ano_mod,((et.valor_tot_nota/et.qtde_motos_nota)+it.piscofins) ' +
             ' from ent_moto et ' +
             ' inner join ent_moto_itens it on it.num_nota = et.num_nota and it.cod_fornecedor = et.cod_fornecedor and it.cod_empresa = et.cod_empresa ' +
             ' inner join nat_op nat on nat.codigo_nop = et.cod_fisc_nota ' +
             ' where it.chassi_c = :vchass and et.data_ch_nota <= :vdat1 ' +
             ' and (coalesce(nat.tipv_veiculo, '''') <> ''T'') and (coalesce(nat.tipv_veiculo, '''') <> ''R'') ' +
             // and nat.tipv_veiculo = ''V'' ' +
             ' and et.cod_empresa = :cod_empresa and et.ativo = 1 ' +
             ' union ' +
             ' select it4.chassi,nf4.data_lanc data_ch_nota, substr(it4.descricao_item,1,25), ' +
             ' itv4.cor,itv4.ano_fab,itv4.ano_mod,it4.prec_cusm_prod from notafiscal nf4 ' +
             ' inner join notafiscal_item it4 on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa ' +
             ' inner join notafiscal_item_veiculo itv4 on it4.cod_nf=itv4.cod_nf and it4.cod_empresa = itv4.cod_empresa and it4.chassi = itv4.chassi ' +
             ' inner join nat_op nat on nat.codigo_nop = it4.codigo_nop ' +
             ' where nf4.natureza_nf = ''E'' and it4.chassi = :vchass and (nf4.status = ''Fechada'') ' +
             ' and  nf4.data_lanc <= :vdat1 ' +
             ' and (coalesce(nat.tipv_veiculo, '''') <> ''T'') and (coalesce(nat.tipv_veiculo, '''') <> ''R'') ' +
              //and nat.tipv_veiculo = ''V'' ' +
             ' and nf4.cod_empresa = :cod_empresa and nf4.ativo=1 order by 2 desc ';
            buscasCompra.parambyName('VCHASS').AsString := dataSet.FieldByName('CHASSI_C').AsString;
            buscasCompra.parambyName('VDAT1').AsDate := date;
            buscasCompra.parambyName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
            buscasCompra.open;
          end;
          if (buscasCompra.IsEmpty) or (buscasCompra.FieldByName('DATA_CH_NOTA').AsDateTime < (vdataref + 1)) then
          begin  
            vLab.Caption := vDadosIni.StrZero(vcount, 6);
            vtotger := vtotger + dataSet.FieldByName('custo').AsCurrency;
            gravainv( 1, dataSet.FieldByName('custo').AsCurrency, 'N', 'M', 0);
            vcount := vcount + 1;
          end;
        end;
        dataSet.Next;
      end;
    end
    else
    begin
      dataSet.Close;
      dataSet.CommandText := ' select distinct est.chassi_c, ' +
        ' (select first 1 (et.data_ch_nota) from comprasmesesv40 et ' +
        ' where et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota) as data_ch_nota, ' +
        ' est.descricao_versaoest,est.corest, est.ano_fabest,est.ano_modest, ' +
        ' (select first 1 (et.custo) from comprasmesesv40 et ' +
        ' where et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota) custo, ' +
        ' tpm.cilindrada, tpm.codigo, est.situacao, est.sit_res, tpm.ordtipo from est_moto est,TIPMODELO tpm ' +
        ' where est.versaoest = tpm.codigo and est.cod_empresa = tpm.cod_empresa and est.cod_empresa in ('+vempresas+') ' +
        ' and est.ativo = 1 and ((trim(coalesce(est.posicao, '''')) = ''VIVO'') and est.status_estoque = ''S'') and est.status_uso = ''N''' ;
      if vDadosIni.vEmp.vConsDepositoEstoque = 'S' then
        dataSet.CommandText := dataSet.CommandText + ' union ' +
          ' select distinct est.chassi_c, ' +
          ' (select first 1 (et.data_ch_nota) from comprasmesesv40 et ' +
          ' where et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota) as data_ch_nota, ' +
          ' est.descricao_versaoest,est.corest, est.ano_fabest,est.ano_modest, ' +
          ' (select first 1 (et.custo) from comprasmesesv40 et ' +
          ' where et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota) custo, ' +
          ' tpm.cilindrada, tpm.codigo, est.situacao, est.sit_res, tpm.ordtipo from est_moto est,TIPMODELO tpm ' +
          ' where est.versaoest = tpm.codigo and est.cod_empresa = tpm.cod_empresa and est.cod_empresa in ('+vempresas+') ' +
          ' and est.ativo = 1 and ((trim(coalesce(est.posicao, '''')) = ''MORTO'') and est.status_transdep = ''S'' ' +
          ' and est.data_trans_ret is null) and est.status_uso = ''N''';
      dataSet.CommandText := dataSet.CommandText + ' order by 12,4 ';
      dataSet.Open;

      dataSet.First;
      while not dataSet.eof do
      begin
        vLab.Caption := vDadosIni.StrZero(vcount, 6);
        vtotger := vtotger + dataSet.FieldByName('custo').AsCurrency;
        gravainv( 1, dataSet.FieldByName('custo').AsCurrency, 'N', 'M', 0);
        vcount := vcount + 1;
        dataSet.Next;
      end;
    end;

    (* Arqui o metodo antigo de busca de estoque. acima novo metodo usado como no inventario
    if date > vdataref then
    begin
      dataset.Close;
      dataset.CommandText:='select est.chassi_c,((select first 1 (et.data_ch_nota) from comprasmesesv4 et '+
      'where et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota)) '+
      'as data_ch_nota,est.descricao_versaoest,est.corest,'+
      'est.ano_fabest,est.ano_modest,'+
      '((select first 1 (et.custo) from comprasmesesv4 et '+
      'where et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota)) '+
      'as custo,tpm.cilindrada,tpm.codigo,tpm.ordtipo '+
      'from '+
      'est_moto est,TIPMODELO tpm '+
      'where est.versaoest = tpm.codigo and est.cod_empresa = tpm.cod_empresa '+
      'and est.cod_empresa in ('+vempresas+') and est.ativo = 1 '+
      'union '+
      'select est.chassiv,((select first 1 (et.data_ch_nota) from comprasmesesv4 et '+
      'where et.chassi = est.chassiv and et.cod_empresa = est.cod_empresa order by data_ch_nota)) as data_ch_nota,est.descricao_versaov,est.corv,'+
      'est.ano_fabv,est.ano_modv,((select first 1 (et.custo) from comprasmesesv4 et '+
      'where et.chassi = est.chassiv and et.cod_empresa = est.cod_empresa order by data_ch_nota)) as custo,'+
      'tpm.cilindrada,tpm.codigo,tpm.ordtipo '+
      'from '+
      'transf_dep est,TIPMODELO tpm '+
      'where est.data_trans_ret is null and est.versaov = tpm.codigo and '+
      'est.cod_empresa = tpm.cod_empresa '+
      'and est.cod_empresa in ('+vempresas+') and est.ativo = 1 '+
      'union '+
      'select mtv.chassiv,vn.data_ven,mtv.descricao_versaov,mtv.corv,'+
      'mtv.ano_fabv,mtv.ano_modv,((select first 1 (et.custo) from comprasmesesv4 et '+
      'where et.chassi = vn.chassiv and et.cod_empresa = vn.cod_empresa order by data_ch_nota)) as custo,'+
      'tpm.cilindrada,tpm.codigo,tpm.ordtipo '+
      'from '+
      'mot_ven mtv,com_fat vn,'+
      'TIPMODELO tpm  where mtv.num_nota_v = vn.num_nota_v and '+
      'mtv.n_comando = vn.n_comando and '+
      'vn.data_ven >= '''+FormatDateTime('mm/dd/yyyy',(vdataref+1))+
      ''' and vn.data_ven <= '''+FormatDateTime('mm/dd/yyyy',(Date))+
      ''' and vn.natop_v <> 5409 and vn.natop_v <> 6409 and vn.natop_v <> 5913 and vn.natop_v <> 6913 '+
      'and mtv.versaov = tpm.codigo and mtv.cod_empresa = vn.cod_empresa and '+
      'mtv.cod_empresa = tpm.cod_empresa and mtv.cod_empresa in ('+vempresas+') and vn.tipo_venda_v = ''N'' and mtv.ativo = 1 '+
      'order by 10,4';
      dataSet.open;
      while not dataSet.eof do
      begin
        vLab.Caption:=vDadosIni.StrZero(vcount,6);
        buscas.Close;
        buscas.SQL.text:='select et.chassi,et.data_ch_nota,et.descricao_versao,et.cor,et.ano_fab,et.ano_mod,et.custo from comprasmesesv4 et '+
       'where et.chassi = '''+dataSet.FieldByName('CHASSI_C').AsString+''' and et.data_ch_nota <= '''+FormatDateTime('mm/dd/yyyy',(Date))+
       ''' and et.cod_empresa in ('+vempresas+') order by data_ch_nota desc ';
 {       select it.chassi_c,et.data_ch_nota,it.descricao_versao,'+
        'it.cor,it.ano_fab,it.ano_mod,((et.valor_tot_nota/et.qtde_motos_nota)+it.piscofins) as custo '+
        'from ent_moto_itens it,ent_moto et '+
        'where '+
        'it.chassi_c = '''+dataSet.FieldByName('CHASSI_C').AsString+
        ''' and it.num_nota = et.num_nota '+
        'and it.cod_fornecedor = et.cod_fornecedor and '+
        'et.data_ch_nota <= '''+FormatDateTime('mm/dd/yyyy',(Date))+
        ''' and (et.cod_fisc_nota <> 1409 and '+
        'et.cod_fisc_nota <> 2409 and et.cod_fisc_nota <> 1913) '+
        'and it.cod_empresa = et.cod_empresa and et.cod_empresa in ('+vempresas+
        ') and et.ativo = 1 order by data_ch_nota desc ';}
        buscas.Open;
        if (buscas.IsEmpty) or (buscas.FieldByName('DATA_CH_NOTA').Value < (vdataref+1)) then
        begin
          vtotger:=vtotger+dataSet.FieldByName('CUSTO').AsCurrency;
          vcount:=vcount+1;
          gravainv(1,dataset.FieldByName('custo').AsCurrency,'N','M',0);
        end;
        dataSet.Next;
      end;
      buscas.close;
    end
    else
    begin
      dataSet.Close;
      dataset.CommandText:='select est.chassi_c,((select first 1 (et.data_ch_nota) from comprasmesesv4 et where '+
      'et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota)) as data_ch_nota,est.descricao_versaoest,est.corest, '+
      'est.ano_fabest,est.ano_modest,((select first 1 (et.custo) from comprasmesesv4 et where '+
      'et.chassi = est.chassi_c and et.cod_empresa = est.cod_empresa order by data_ch_nota)) as custo, '+
      'tpm.cilindrada,tpm.codigo,est.situacao,est.sit_res,tpm.ordtipo '+
      'from '+
      'est_moto est,TIPMODELO tpm where est.versaoest = tpm.codigo '+
      'and est.cod_empresa = tpm.cod_empresa and est.cod_empresa in ('+vempresas+
      ') and est.ativo = 1 '+
      'union '+
      'select est.chassiv,((select first 1 (et.data_ch_nota) from comprasmesesv4 et where '+
      'et.chassi = est.chassiv and et.cod_empresa = est.cod_empresa order by data_ch_nota)) as data_ch_nota,est.descricao_versaov,est.corv, '+
      'est.ano_fabv,est.ano_modv,((select first 1 (et.custo) from comprasmesesv4 et where '+
      'et.chassi = est.chassiv and et.cod_empresa = est.cod_empresa order by data_ch_nota)) as custo,'+
      'tpm.cilindrada,tpm.codigo,''               '',est.sit_res,tpm.ordtipo '+
      'from '+
      'transf_dep est,TIPMODELO tpm '+
      'where est.versaov = tpm.codigo and '+
      'est.cod_empresa = tpm.cod_empresa and '+
      'est.cod_empresa in ('+vempresas+') and est.ativo = 1 and '+
      'data_trans_ret is null order by 12,4 ';
      dataSet.Open;
      while not dataSet.Eof do
      begin
        vLab.Caption:=vDadosIni.StrZero(vcount,6);
        vtotger:=vtotger+dataset.FieldByName('custo').AsCurrency;
        gravainv(1,dataset.FieldByName('custo').AsCurrency,'N','M',0);
        vcount:=vcount+1;
        dataSet.next;
      end;
    end;
    *)

    Result:=vtotger;
end;


function Testoque.verificaMotos(vtip: integer): currency;
var
 dia,mes,ano: Word;
 vdata: string;
begin
  DecodeDate(vdataref,ano,mes,dia);
  vdata:='01/01/'+inttostr(ano);
  dataSet.close;
  //ANTECIPADAS
  if vtip = 1 then // Motos Pagas antecipadas
  begin
    dataset.CommandText:=
     ' SELECT sum(cp.valor_ctp) as valor FROM contas_a_pagar cp ' +
     ' inner join empresa emp on cp.codigo_emp = emp.cod_empresa ' +
     ' where cp.datq_ctp >= '''+FormatDateTime('mm/dd/yyyy',strtodate(vdata))+''' ' + // colocar aqui a data inicial do ano
     ' and cp.datq_ctp <= '''+FormatDateTime('mm/dd/yyyy',(vdat2))+ ''' ' +
     ' and ((not cp.chassi_conc is null) and cp.chassi_conc <> '''') '+
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.codigo_emp end) ' +
//     ' and cp.'+vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
     ' in ('+vempresas+') ' +
     ' and (((select first 1 (et.data_ch_nota) from comprasmesesv4 et ' +
     ' where et.chassi = cp.chassi_conc and et.cod_empresa = cp.codigo_emp ' +
     ' order by data_ch_nota desc)) > '''+ FormatDateTime('mm/dd/yyyy',(vdat2))+''' ' +
     ' or ((select first 1 (et.data_ch_nota) from comprasmesesv4 et ' +
     ' where et.chassi = cp.chassi_conc and et.cod_empresa = cp.codigo_emp order by data_ch_nota desc)) is null)';
    dataSet.open;
    result:=dataSet.FieldByName('valor').AsCurrency;
   end
   else
   begin
    dataset.CommandText:=
     ' select sum((it4.prec_cusm_prod-(it4.valor_icmsub+it4.piscofins))) as valor,'+
     ' sum(coalesce(ctp.valor_ctp,(it4.prec_cusm_prod-(it4.valor_icmsub+it4.piscofins)))) as valor_ctp '+
     ' from notafiscal nf4 ' +
     ' inner join notafiscal_item it4 on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa '+
     ' inner join notafiscal_item_veiculo itv4 on it4.cod_nf=itv4.cod_nf ' +
     ' 		and it4.cod_empresa = itv4.cod_empresa and it4.chassi = itv4.chassi '+
     ' inner join empresa emp on emp.cod_empresa = nf4.cod_empresa ' +
     ' left join contas_a_pagar ctp on ctp.num_nota_nfe = nf4.num_nf and ctp.codigo_emp = nf4.cod_empresa '+
     ' 		and ctp.chassi_conc = itv4.chassi and n_conta_plc <> 48.01 and n_conta_plc <> 46.01 '+
     ' 		and n_conta_plc <> 20 '+
     ' where nf4.natureza_nf=''E'' and nf4.tipo_nf = ''V'' ' +
     ' and nf4.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',strtodate(vdata))+''' ' +
     ' and nf4.data_lanc <= '''+FormatDateTime('mm/dd/yyyy',(vdat2))+''' ' +
     ' and (nf4.status = ''Fechada'') ' +
     ' and (nf4.codigo_nop <> 1409 and nf4.codigo_nop <> 2409 ' +
     ' and nf4.codigo_nop <> 1913 and nf4.codigo_nop <> 1411) '+
     ' and nf4.ativo=1 ' +
     ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf4.cod_empresa end) ' +
//     ' and nf4.cod_empresa ' +
     ' in ('+vempresas+') '+
     ' and (ctp.datq_ctp is null or (ctp.datq_ctp > '''+FormatDateTime('mm/dd/yyyy',(vdat2))+'''))';
    dataSet.open;
    result:=dataSet.FieldByName('valor_ctp').AsCurrency;
(* para fazer o BI
   'select it4.chassi,nf4.data_lanc,(it4.prec_cusm_prod-(it4.valor_icmsub+it4.piscofins)),nf4.num_nf, '+
   'coalesce(ctp.valor_ctp,0) as valor_ctp,coalesce(ctp.datq_ctp,'') as datq_ctp,coalesce(ctp.data_venc_ctp,'') as data_venc_ctp,' +
   'coalesce(n_doc_ctp,'') as n_doc_ctp '+
   'from notafiscal nf4 inner join notafiscal_item it4 '+
   'on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa '+
   'inner join notafiscal_item_veiculo itv4 '+
   'on it4.cod_nf=itv4.cod_nf and it4.cod_empresa = itv4.cod_empresa and '+
   'it4.chassi = itv4.chassi '+
   'left join contas_a_pagar ctp on ctp.num_nota_nfe = nf4.num_nf and ctp.codigo_emp = nf4.cod_empresa '+
   'and ctp.chassi_conc = itv4.chassi and n_conta_plc <> 48.01 and n_conta_plc <> 46.01 '+
   'and n_conta_plc <> 20 '+
   'where nf4.natureza_nf=''E'' and nf4.tipo_nf = ''V'' and nf4.data_lanc >= '''+FormatDateTime('mm/dd/yyyy',strtodate(vdata))+
   ''' and nf4.data_lanc <= '''+FormatDateTime('mm/dd/yyyy',(vdat2))+
   ''' and (nf4.status = ''Fechada'') and (nf4.codigo_nop <> 1409 and '+
   'nf4.codigo_nop <> 2409 and nf4.codigo_nop <> 1913 and nf4.codigo_nop <> 1411) '+
   'and nf4.ativo=1 and nf4.cod_empresa in ('+vempresas+') '+
   'and (ctp.datq_ctp is null or (ctp.datq_ctp > '''+FormatDateTime('mm/dd/yyyy',(vdat2))+'''))';

*)
(*    'SELECT sum(cp.valor_ctp) as valor,'+
    '(select first 1 ent.data_ch_nota from ent_moto_itens it,ent_moto ent '+
    'WHERE  it.chassi_c = cp.chassi_conc  and it.num_nota = ent.num_nota and '+
    'it.cod_fornecedor = ent.cod_fornecedor and it.cod_empresa = ent.cod_empresa and '+
    'ent.cod_fisc_nota <> 1409 and ent.cod_fisc_nota <> 2409 and '+
    'ent.cod_fisc_nota <> 1411 and  ent.cod_fisc_nota <> 2411 and '+
    'ent.cod_fisc_nota <> 1913 and ent.cod_fisc_nota <> 2913  and ent.cod_empresa = cp.codigo_emp '+
    'order by data_ch_nota desc) as data_ch_nota '+
    'FROM  contas_a_pagar cp where '+
    'cp.datq_ctp >= '''+FormatDateTime('mm/dd/yyyy',strtodate(vdata))+// colocar aqui a data inicial do ano
    ''' and cp.datq_ctp <= '''+FormatDateTime('mm/dd/yyyy',(vdat2))+
    ''' and ((not cp.chassi_conc is null) and cp.chassi_conc <> '''') '+
    'and cp.codigo_emp in ('+vempresas+') and '+
    '((select first 1 ent.data_ch_nota from ent_moto_itens it,ent_moto ent '+
    'WHERE  it.chassi_c = cp.chassi_conc  and it.num_nota = ent.num_nota and '+
    'it.cod_fornecedor = ent.cod_fornecedor and it.cod_empresa = ent.cod_empresa and '+
    'ent.cod_fisc_nota <> 1409 and ent.cod_fisc_nota <> 2409 and '+
    'ent.cod_fisc_nota <> 1411 and  ent.cod_fisc_nota <> 2411 and '+
    'ent.cod_fisc_nota <> 1913 and ent.cod_fisc_nota <> 2913  and ent.cod_empresa = cp.codigo_emp '+
    'order by data_ch_nota desc) > '''+FormatDateTime('mm/dd/yyyy',(vdat2))+''' or '+
    '(select first 1 ent.data_ch_nota from ent_moto_itens it,ent_moto ent '+
    'WHERE  it.chassi_c = cp.chassi_conc  and it.num_nota = ent.num_nota and '+
    'it.cod_fornecedor = ent.cod_fornecedor and it.cod_empresa = ent.cod_empresa and '+
    'ent.cod_fisc_nota <> 1409 and ent.cod_fisc_nota <> 2409 and '+
    'ent.cod_fisc_nota <> 1411 and  ent.cod_fisc_nota <> 2411 and '+
    'ent.cod_fisc_nota <> 1913 and ent.cod_fisc_nota <> 2913  and ent.cod_empresa = cp.codigo_emp '+
    'order by data_ch_nota desc) is null) order by datq_ctp,chassi_conc ';*)
  end;
end;

{ TensaiosDescontos }

function TensaiosDescontos.abreBase: Boolean;
begin

end;

constructor TensaiosDescontos.create;
begin
 caddre:=TDREHw.create;
 Buscas := TIBQuery(DtmGestorHw.qrBuscas);
 vredcustoperc:=0;
 vredcmvperc:=0;
 vredocvperc:=0;
 vlucrodesadoperc:=0;
 vLucroDesejadoDinheiro:=0;
 vfaturamento:=0;
 vdescontoperc:=0;
 vfatreal:=0;
 vcmvreal:=0;
 vcfreal:=0;
 vocvreal:=0;
 vpereal:=0;
 vfatensaio:=0;
 vcmvensaio:=0;
 vcfensaio:=0;
 vocvensaio:=0;
 vpeensaio:=0;
 vperclucroensaio:=0;
 vdescensaio:=0;
 vcmvrealperc:=0;
 vcfrealperc:=0;
 vocvrealperc:=0;
 vpercaumentofat:=0;
 vlucroensaio:=0;
 vvaltemp:=0;
end;

destructor TensaiosDescontos.destroy;
begin

  inherited;
end;

function TensaiosDescontos.VerificaCustos(vStCustosEmp: TStringGrid): boolean;
//var
// vstgridDRE,vstgvenda: TStringGrid;
var
 vcusttotal: currency;
begin
Result:=true;
vStCustosEmp.Cells[0,0]:='Descrição do Item';
vStCustosEmp.Cells[1,0]:='Valor Realizado';
vStCustosEmp.Cells[2,0]:='%';
vStCustosEmp.Cells[3,0]:='Valor Previsto';
vStCustosEmp.Cells[4,0]:='%';
{cadDRE.vexecutarmesatual:='S';
CadDRE.vCodEmpresasDRE:=vempresas;
CadDRE.vversao:='4.0';
CadDRE.vmesinf:=vmesinf;
CadDRE.vano:=vano;
cadDRE.CadDepto.procuraDepto(vdepto);
cadDRE.selgriddep(vgriddep);
vstgridDRE:=TStringGrid.create(application);
vstgvenda:=TStringGrid.create(application);
cadDre.MontaDRE(vgriddep,vstgridDRE,vstgvenda);}
// Montando a String grid
if not caddre.CadApuracao.dataSet.IsEmpty then
begin
 vcusttotal:=0;
 while not caddre.CadApuracao.Eof do
 begin
   vStCustosEmp.Cells[0,1]:='Faturamento: ';
   vStCustosEmp.Cells[1,1]:=vDadosIni.alndir(
   Format('%n', [caddre.CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency]), 14);
   vStCustosEmp.Cells[2,1]:=vDadosIni.alndir(
   Format('%n', [100.00]), 6);
   vStCustosEmp.Cells[5,1]:='6';
   vfatreal:=caddre.CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency;
  if trim(caddre.CadApuracao.dataSet.FieldByName('TPDESP').AsString) = 'CF' then
  begin
    vStCustosEmp.Cells[0,2]:='Custos Fixos: ';
   vStCustosEmp.Cells[1,2]:=vDadosIni.alndir(
   Format('%n', [caddre.CadApuracao.dataSet.FieldByName('VALOR').AsCurrency]), 14);
   vStCustosEmp.Cells[2,2]:=vDadosIni.alndir(
   Format('%n', [caddre.CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency]), 6);
   vcusttotal:=vcusttotal+caddre.CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency;
   vcfreal:=caddre.CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency;
   vcfrealperc:=caddre.CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency;
   vStCustosEmp.Cells[5,2]:='10';
  end;
  if trim(caddre.CadApuracao.dataSet.FieldByName('TPDESP').AsString) = 'CMV' then
  begin
   vStCustosEmp.Cells[0,3]:='Custos Mercadoria Vendida(CMV): ';
   vStCustosEmp.Cells[1,3]:=vDadosIni.alndir(Format('%n', [caddre.CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency]), 14);
   vStCustosEmp.Cells[2,3]:=vDadosIni.alndir(Format('%n', [caddre.CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency]), 6);
   vcusttotal:=vcusttotal+caddre.CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency;
   vcmvreal:=caddre.CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency;
   vcmvrealperc:=caddre.CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency;
   vStCustosEmp.Cells[5,3]:='7';
  end;
  if trim(caddre.CadApuracao.dataSet.FieldByName('TPDESP').AsString) = 'OCV' then
  begin
   vStCustosEmp.Cells[0,4]:='Outros Custos Variáveis(OCV): ';
   vStCustosEmp.Cells[1,4]:=vDadosIni.alndir(Format('%n', [caddre.CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency]), 14);
   vStCustosEmp.Cells[2,4]:=vDadosIni.alndir(Format('%n', [caddre.CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency]), 6);
   vcusttotal:=vcusttotal+caddre.CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency;
   vocvreal:=caddre.CadApuracao.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency;
   vocvrealperc:=caddre.CadApuracao.dataSet.FieldByName('PERC_VALOR').AsCurrency;
   vStCustosEmp.Cells[5,4]:='9';
  end;
  caddre.CadApuracao.dataSet.Next;
 end;
 vStCustosEmp.Cells[0,5]:='Custo Total: ';
 vStCustosEmp.Cells[1,5]:=vDadosIni.alndir(Format('%n', [vcusttotal]), 14);
 vStCustosEmp.Cells[2,5]:=vDadosIni.alndir(Format('%n', [((vcusttotal/
 caddre.CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency)*
 100)]), 6);
 vStCustosEmp.Cells[0,6]:='Lucro: ';
 vlucroreal:=caddre.CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency-
 vcusttotal;
 vStCustosEmp.Cells[1,6]:=vDadosIni.alndir(Format('%n', [vlucroreal]), 14);
 vStCustosEmp.Cells[2,6]:=vDadosIni.alndir(Format('%n', [((vlucroreal/
 caddre.CadApuracao.dataSet.FieldByName('VALOR_FATURADO').AsCurrency)*
 100)]), 6);
 vStCustosEmp.Cells[0,7]:='Ponto de Equilíbrio: ';
 vStCustosEmp.Cells[1,7]:=vDadosIni.alndir(Format('%n',
 [caddre.CadApuracao.dataSet.FieldByName('PE').AsCurrency]), 14);
 vStCustosEmp.Cells[2,7]:=vDadosIni.alndir(Format('%n', [0.00]), 6);
 vStCustosEmp.Cells[5,7]:='PE';
 vpereal:=caddre.CadApuracao.dataSet.FieldByName('PE').AsCurrency;
end
else
begin
 Application.MessageBox('Apuração não encontrada!', 'Confirmação', MB_OK);
 result:=false;
end;
end;

function TensaiosDescontos.VerificaEnsaios(Vstensaioemp: TStringGrid;vStCustosEmp: TStringGrid): boolean;
var
 i: integer;
 vlucro,vcusttotal,vperccf: real;
begin
 if vredcustoperc <> 0 then
  vcfensaio:=(vcfreal-(vcfreal*(vredcustoperc/100)))
 else
  vcfensaio:=vcfreal;
 if vredcmvperc <> 0 then
  vcmvensaio:=(vfatreal*((vcmvrealperc-vredcmvperc)/100))
 else
  vcmvensaio:=vcmvreal;
 if vredocvperc <> 0 then
  vocvensaio:=(vfatreal*((vocvrealperc-vredocvperc)/100))
 else
  vocvensaio:=vocvreal;
 // colocar aqui o percentual de lucro relativo ao que o usuário quer...
 if (vlucrodesadoperc <> 0) or (vLucroDesejadoDinheiro <> 0) then
 begin
   if vlucrodesadoperc <> 0 then
    vperclucroensaio:=vlucrodesadoperc;
   if vLucroDesejadoDinheiro <> 0 then
    vperclucroensaio:=((vLucroDesejadoDinheiro/vfatreal)*100);
   vperccf:=vcfensaio/vfatreal;
   vperccmv:=vcmvensaio/vfatreal;
   vpercocv:=vocvensaio/vfatreal;
   vvaltemp:=(vpercocv+vperccmv+(vperclucroensaio/100));
   if vLucroDesejadoDinheiro <> 0 then
    vfatensaio:=(vcfensaio+vLucroDesejadoDinheiro)/(1-(vpercocv+vperccmv))
   else
    vfatensaio:=vcfensaio/(1-vvaltemp);
   vcmvensaio:=vfatensaio*((vcmvrealperc-vredcmvperc)/100);
   if vdescontoperc <> 0 then
   begin
    vfatensaio:=vfatensaio-(vfatensaio*(vdescontoperc/100));
    vocvensaio:=vfatensaio*vpercocv;
   end;
   vocvensaio:=vfatensaio*((vocvrealperc-vredocvperc)/100);
   vpeensaio:=vcfensaio/(1-(vpercocv+vperccmv));
   vpercaumentofat:=((vfatensaio-vfatreal)/vfatreal)*100;
//   vlucroensaio:=vfatensaio-vcfensaio-vcmvensaio-(vpercocv*vfatensaio);
 end
 else
 begin
  if vfaturamento <> 0 then
  begin
   vperccf:=vcfensaio/vfatreal;
   vperccmv:=vcmvensaio/vfatreal;
   vpercocv:=vocvensaio/vfatreal;
   vfatensaio:=vfaturamento;
   vcmvensaio:=vfatensaio*((vcmvrealperc-vredcmvperc)/100);
   if vdescontoperc <> 0 then
   begin
    vfatensaio:=vfatensaio-(vfatensaio*(vdescontoperc/100));
    vocvensaio:=vfatensaio*vpercocv;
   end;
//   vlucroensaio:=vfatensaio-vcfensaio-(vperccmv*vfatensaio)-(vpercocv*vfatensaio);
//   vperclucroensaio:=((vlucroensaio/vfatensaio)*100);
//   vocvensaio:=vfatensaio*((vocvrealperc-vredocvperc)/100);
//   vcmvensaio:=vfatensaio*((vcmvrealperc-vredcmvperc)/100);
//   vfatensaio:=vcfensaio/(1-(vpercocv+vperccmv+(vperclucroensaio/100)));
   vocvensaio:=vfatensaio*((vocvrealperc-vredocvperc)/100);
   vpeensaio:=vcfensaio/(1-(vpercocv+vperccmv));
   vpercaumentofat:=((vfatensaio-vfatreal)/vfatreal)*100;
  end
  else
  begin
   //   vfatensaio:=vcfensaio/(1-(vpercocv+vperccmv+(vperclucroensaio/100)));
   vperccmv:=vcmvensaio/vfatreal;
   vperccf:=vcfensaio/vfatreal;
   vpercocv:=vocvensaio/vfatreal;
   vfatensaio:=vfatreal;
   if vdescontoperc <> 0 then
   begin
    vfatensaio:=vfatensaio-(vfatensaio*(vdescontoperc/100));
    vocvensaio:=vfatensaio*vpercocv;
   end;
   vlucroensaio:=vfatensaio-vcfensaio-(vperccmv*vfatensaio)-(vpercocv*vfatensaio);
   vperclucroensaio:=((vlucroensaio/vfatensaio)*100);
//   vfatensaio:=vcfensaio/(1-(vpercocv+vperccmv+(vperclucroensaio/100)));
   vpeensaio:=vcfensaio/(1-(vpercocv+vperccmv));
   vpercaumentofat:=((vfatensaio-vfatreal)/vfatreal)*100;
  end;
 end;
 Vstensaioemp.Cells[0,0]:='Descrição do Item';
 Vstensaioemp.Cells[1,0]:='Valor Realizado';
 Vstensaioemp.Cells[2,0]:='%';
 Vstensaioemp.Cells[3,0]:='Valor Previsto';
 Vstensaioemp.Cells[4,0]:='%';
 Vstensaioemp.Cells[0,1]:='Novo Faturamento: ';
 Vstensaioemp.Cells[1,1]:=vDadosIni.alndir(
 Format('%n', [vfatensaio]), 14);
 Vstensaioemp.Cells[2,1]:=vDadosIni.alndir(
 Format('%n', [100.00]), 8);
 Vstensaioemp.Cells[0,2]:='Custos Fixos: ';
 Vstensaioemp.Cells[1,2]:=vDadosIni.alndir(
 Format('%n', [vcfensaio]), 14);
 Vstensaioemp.Cells[2,2]:=vDadosIni.alndir(
 Format('%n', [(vcfensaio/vfatensaio)*100]), 8);
 vcusttotal:=vcusttotal+vcfensaio;
 Vstensaioemp.Cells[0,3]:='Custos Mercadoria Vendida(CMV): ';
 Vstensaioemp.Cells[1,3]:=vDadosIni.alndir(Format('%n',
 [vcmvensaio]), 14);
 Vstensaioemp.Cells[2,3]:=vDadosIni.alndir(
 Format('%n', [(vcmvensaio/vfatensaio)*100]), 8);
 vcusttotal:=vcusttotal+vcmvensaio;
 Vstensaioemp.Cells[0,4]:='Outros Custos Variáveis(OCV): ';
 Vstensaioemp.Cells[1,4]:=vDadosIni.alndir(Format('%n',
 [vocvensaio]), 14);
 Vstensaioemp.Cells[2,4]:=vDadosIni.alndir(Format('%n',
 [(vocvensaio/vfatensaio)*100]), 8);
 vcusttotal:=vcusttotal+vocvensaio;
 Vstensaioemp.Cells[0,5]:='Custo Total: ';
 Vstensaioemp.Cells[1,5]:=vDadosIni.alndir(Format('%n', [vcusttotal]), 14);
// Application.MessageBox(Pchar(floattostr((vcusttotal/vfatensaio)*100)), 'Confirmação', MB_OK);
 vvaltemp:=((vcusttotal/vfatensaio)*100);
 Vstensaioemp.Cells[2,5]:=vDadosIni.alndir(Format('%n', [vvaltemp]), 8);
 Vstensaioemp.Cells[0,6]:='Lucro: ';
 vlucro:=vfatensaio-vcusttotal;
 vperclucroensaio:=(vlucro/vfatensaio)*100;
 vlucroensaio:=vlucro;
 Vstensaioemp.Cells[1,6]:=vDadosIni.alndir(Format('%n', [vlucro]), 14);
 vvaltemp:=((vlucro/vfatensaio)*100);
 Vstensaioemp.Cells[2,6]:=vDadosIni.
 alndir(Format('%n', [vvaltemp]), 8);
 Vstensaioemp.Cells[0,7]:='Ponto de Equilíbrio: ';
 Vstensaioemp.Cells[1,7]:=vDadosIni.alndir(Format('%n',[vpeensaio]), 14);
 Vstensaioemp.Cells[2,7]:=vDadosIni.alndir(Format('%n', [0.00]), 8);
 Vstensaioemp.Cells[0,8]:='Quanto Faturamento Precisa Aumentar: ';
 Vstensaioemp.Cells[1,8]:=vDadosIni.alndir(Format('%n',[vfatensaio-vfatreal]), 14);
 Vstensaioemp.Cells[2,8]:=vDadosIni.alndir(Format('%n', [vpercaumentofat]), 8);
 Vstensaioemp.Cells[0,9]:='Variação nos lucros: ';
 Vstensaioemp.Cells[1,9]:=vDadosIni.alndir(Format('%n',[vlucro-vlucroreal]), 14);
 Vstensaioemp.Cells[2,9]:=vDadosIni.alndir(Format('%n', [((vlucro-vlucroreal)/vlucroreal)*100]), 8);
end;

{ Tcotacao }

function Tcotacao.abrecotacao: boolean;
begin
	Result := montaSelect('select * from cotacao ' +
  	' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1');
end;

function Tcotacao.abrecotacao(vcodcot: integer): boolean;
begin
 Result := montaSelect('select * from cotacao ' +
 	' where cod_cotacao = ' + IntToStr(vcodcot) +
 	' and cod_empresa = ' + vDadosIni.codEmpresa +
  ' and ativo = 1');
end;

function Tcotacao.AbreFormRel: boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
  vSel: boolean;
  vCodListaContacao: Integer;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 489;
    formulario.Height := 89;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Ordenar Relatório';
    FrmSugestCompraVenda.pnOrdenarRel.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];
//    FrmSugestCompraVenda.cbOrdem.ItemIndex := 2;
    FrmSugestCompraVenda.mkTipo.Text := '';
    FrmSugestCompraVenda.mkTipo.Visible := false;
    FrmSugestCompraVenda.Label247.Visible := false;
    FrmSugestCompraVenda.SpeedButton16.Visible := false;
    FrmSugestCompraVenda.SpeedButton17.Visible := false;
    FrmSugestCompraVenda.Label76.Visible := false;
    FrmSugestCompraVenda.Panel6.Visible := false;
    FrmSugestCompraVenda.Panel7.Visible := false;
    FrmSugestCompraVenda.mkTipo.Enabled := false;
    FrmSugestCompraVenda.pnOrdenarRel.Width := 489;
    FrmSugestCompraVenda.pnOrdenarRel.Height := 89;
    formulario.Position := poMainFormCenter;

    buscas.Close;
    buscas.SQL.Text := 'select cod_atributo, descricao_atributo from atributos' +
     ' where ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Prepare;
    buscas.Open;

    fTempAtributos.EmptyDataSet;

    buscas.First;
    while not buscas.Eof do
    begin
      fTempAtributos.Insert;
      fTempAtributos.FieldByName('COD_ATRIBUTO').AsInteger := buscas.FieldByName('COD_ATRIBUTO').AsInteger;
      fTempAtributos.FieldByName('DESCRICAO_ATRIBUTO').AsString := buscas.FieldByName('DESCRICAO_ATRIBUTO').AsString;
      fTempAtributos.Post;
      buscas.Next;
    end;

    FrmSugestCompraVenda.DBGrid8.DataSource := fTempAtributosDtSource;

    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
     imprimirRel(FrmSugestCompraVenda.CheckBox2.Checked, FrmSugestCompraVenda.cbOrdem.Text, FrmSugestCompraVenda.mkTipo.Text);
    FrmSugestCompraVenda.pnOrdenarRel.Parent := FrmSugestCompraVenda.tsOrdenarRel;
    formulario.Free;
    formulario := nil;
  end;
end;

function Tcotacao.abreListaCotacaoC: boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
  vSel: boolean;
  vCodListaContacao: Integer;
  buscas2: TIBQuery;
begin
  try
    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 864;
    formulario.Height := 377;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lista de Cotação';
    FrmSugestCompraVenda.pnListaCotacaoC.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];
    FrmSugestCompraVenda.DBGrid7.DataSource := fTempListaCotacaoItensDtSource2;
    fTempListaCotacaoItens2.EmptyDataSet;
    cadCotacaoItens.dataSet.Filtered := false;
    cadCotacaoItens.First;
    while not cadCotacaoItens.Eof do
    begin
      fTempListaCotacaoItens2.Insert;
      fTempListaCotacaoItens2.FieldByName('SEL').AsString := 'S';
      fTempListaCotacaoItens2.FieldByName('COD_FORNECEDOR').AsInteger := cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger;
      fTempListaCotacaoItens2.FieldByName('GRUPO_PROD').AsInteger := cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger;
      fTempListaCotacaoItens2.FieldByName('COD_PROD').AsString := cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString;
      fTempListaCotacaoItens2.FieldByName('NUM_FAB_PROD').AsString := cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString;
      fTempListaCotacaoItens2.FieldByName('DESCR_PROD').AsString := cadCotacaoItens.dataSet.FieldByName('DESCR_PROD').AsString;
      fTempListaCotacaoItens2.FieldByName('QUANT_PROD').AsFloat := cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat;
      fTempListaCotacaoItens2.FieldByName('COD_GRADE').AsInteger := 0;
      fTempListaCotacaoItens2.FieldByName('NUM_PED').AsInteger := 0;
      fTempListaCotacaoItens2.Post;
      cadCotacaoItens.Next;
    end;
    FrmSugestCompraVenda.Edit1.Text := '';
    FrmSugestCompraVenda.Memo1.Text := '';
    fTempListaCotacaoItens2.IndexFieldNames := 'COD_FORNECEDOR';
    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      vSel := false;
      vCodListaContacao := 0;

      try
        fTempListaCotacaoItens2.First;
        while not fTempListaCotacaoItens2.Eof do
        begin
          if fTempListaCotacaoItens2.FieldByName('SEL').AsString = 'S' then
          begin
            if not vSel then
            begin
              buscas.Close;
              buscas.SQL.Text := 'INSERT INTO LISTA_COTACAO (COD_LISTA, COD_EMPRESA, DESCRICAO_LISTA, DATA, OBS, ATIVO, NUM_PED, COD_COTACAO)' +
                '  VALUES (:COD_LISTA, :COD_EMPRESA, :DESCRICAO_LISTA, :DATA, :OBS, :ATIVO, :NUM_PED, :COD_COTACAO);';
              DtmGestorHw.SpIncCodigo.Transaction := DtmGestorHw.IbTransHwGestor;
              buscas.ParamByName('COD_LISTA').AsInteger := Gencodigo('LISTA_COTACAO', DtmGestorHw.SpIncCodigo, vDadosIni.codEmpresa);
              buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
              buscas.ParamByName('DESCRICAO_LISTA').AsString := trim(FrmSugestCompraVenda.Edit1.Text);
              buscas.ParamByName('DATA').AsString := FormatDateTime('DD/MM/YYYY', vDadosIni.getDataHoraBanco(DtmGestorHw.QrBuscas2));
              buscas.ParamByName('OBS').AsString := FrmSugestCompraVenda.Memo1.Text;
              buscas.ParamByName('ATIVO').AsInteger := 1;
              if dataSet.FieldByName('COD_COTACAO').AsInteger > 0 then
                buscas.ParamByName('COD_COTACAO').AsInteger := dataSet.FieldByName('COD_COTACAO').AsInteger;
              vCodListaContacao := buscas.ParamByName('COD_LISTA').AsInteger;
              buscas.ExecSQL;
            end;

            buscas2.Close;
            buscas2.SQL.Text := 'SELECT * FROM LISTA_COTACAO_ITENS' +
             ' WHERE COD_LISTA = ' + IntToStr(vCodListaContacao) +
             ' AND GRUPO_PROD = ' + IntToStr(fTempListaCotacaoItens2.FieldByName('GRUPO_PROD').AsInteger) +
             ' AND COD_PROD = ' +QuotedStr(fTempListaCotacaoItens2.FieldByName('COD_PROD').AsString)+
             ' AND COD_GRADE = ' +QuotedStr(fTempListaCotacaoItens2.FieldByName('COD_GRADE').AsString)+
             ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
            buscas2.Prepare;
            buscas2.Open;

            if buscas2.IsEmpty then
            begin
              buscas.Close;
              buscas.SQL.Text := 'INSERT INTO LISTA_COTACAO_ITENS (COD_LISTA, GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA, NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED, COD_COTACAO)' +
                '  VALUES (:COD_LISTA, :GRUPO_PROD, :COD_PROD, :COD_GRADE, :COD_EMPRESA, :NUM_FAB_PROD, :DESCR_PROD, :QUANT_PROD, :NUM_PED, :COD_COTACAO);';
              buscas.ParamByName('COD_LISTA').AsInteger := vCodListaContacao;
              buscas.ParamByName('GRUPO_PROD').AsInteger := fTempListaCotacaoItens2.FieldByName('GRUPO_PROD').AsInteger;
              buscas.ParamByName('COD_PROD').AsString := fTempListaCotacaoItens2.FieldByName('COD_PROD').AsString;
              buscas.ParamByName('COD_GRADE').AsInteger := fTempListaCotacaoItens2.FieldByName('COD_GRADE').AsInteger;
              buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
              buscas.ParamByName('NUM_FAB_PROD').AsString := fTempListaCotacaoItens2.FieldByName('NUM_FAB_PROD').AsString;
              buscas.ParamByName('DESCR_PROD').AsString := fTempListaCotacaoItens2.FieldByName('DESCR_PROD').AsString;
              buscas.ParamByName('QUANT_PROD').AsFloat := fTempListaCotacaoItens2.FieldByName('QUANT_PROD').AsFloat;
              if dataSet.FieldByName('COD_COTACAO').AsInteger > 0 then
                buscas.ParamByName('COD_COTACAO').AsInteger := dataSet.FieldByName('COD_COTACAO').AsInteger;
              buscas.ExecSQL;
            end;
            vSel := true;
          end;
          fTempListaCotacaoItens2.Next;
        end;
        CommitaTransacao;
        fTempListaCotacaoItens2.First;

      except
        on e: exception do
        begin
          Result := false;
          Application.MessageBox(pchar('Erro ao montar lista de cotação. Erro: ' +
            e.Message), 'Atenção', MB_ICONEXCLAMATION +
            MB_OK);
        end;
      end;
    end;
    FrmSugestCompraVenda.pnListaCotacaoC.Parent := FrmSugestCompraVenda.TabSheet9;
    formulario.Free;
    formulario := nil;
  end;
end;

function Tcotacao.abreListaCotacao(cod: Integer = 0): boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
  vSel: boolean;
  vCodListaContacao: Integer;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 884;
    formulario.Height := 377;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lista de Cotação';
    FrmSugestCompraVenda.pnListaCotacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];

    if cod = 0 then
    begin
     fTempListaCotacao.EmptyDataSet;
     fTempListaCotacaoItens.EmptyDataSet;
    end;

    if cod = 2 then
    begin
     FrmSugestCompraVenda.GroupBox7.Enabled := false;
     FrmSugestCompraVenda.GroupBox10.Enabled := false;
     FrmSugestCompraVenda.EditCodLista.Text := IntToStr(dataSet.FieldByName('COD_LISTA').AsInteger);
     buscarListaCotacao(dataSet.FieldByName('COD_LISTA').AsInteger);
    end
    else
    begin
     FrmSugestCompraVenda.GroupBox7.Enabled := true;
     FrmSugestCompraVenda.GroupBox10.Enabled := true;
    end;


    FrmSugestCompraVenda.DBGrid3.DataSource := fTempListaCotacaoDtSource;
    FrmSugestCompraVenda.DBGrid4.DataSource := fTempListaCotacaoItensDtSource;

    if (cod <> 0) and (cod <> 2) then
    begin
      _descricao := FrmSugestCompraVenda.EditDesricao.Text;
      _dtIni := FrmSugestCompraVenda.MaskEditDataEntIni.Text;
      _dtFim := FrmSugestCompraVenda.MaskEditDataEntFim.Text;
      _codLista := StrToInt(FrmSugestCompraVenda.EditCodLista.Text);
      pesquisarListaCotacao;
      _marcarTodos(fTempListaCotacaoItens);
    end;

    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger := fTempListaCotacao.FieldByName('COD_LISTA').AsInteger;
      FrmSugestCompraVenda.BitBtn27.Enabled := true;
    end;
    obCompraVenda.cadCotacaoItens.dataSet.Filtered := false;
    FrmSugestCompraVenda.DBEdit46.Enabled := obCompraVenda.cadCotacaoItens.IsEmpty;
    FrmSugestCompraVenda.pnListaCotacao.Parent := FrmSugestCompraVenda.TabSheet7;
    formulario.Free;
    formulario := nil;
  end;
end;

function Tcotacao.abrePedido: boolean;
var
  formulario: TfrmPadrao;
  vCodFornec: string;
  vQuantFornec, I: Integer;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 864;
    formulario.Height := 377;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Fornecedores:';
    FrmSugestCompraVenda.pnCotacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];
    FrmSugestCompraVenda.DBGrid5.DataSource := fTempCotacaoDtSource;
    FrmSugestCompraVenda.DBGrid6.DataSource := fTempCotacaoItensDtSource;

    fTempCotacao.EmptyDataSet;
    fTempCotacaoItens.EmptyDataSet;
    vCodFornec := '';
    vQuantFornec := 0;
    cadCotacaoItens.First;
    while not cadCotacaoItens.Eof do
    begin
      if pos(cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsString + '|', vCodFornec) = 0 then
      begin
        if trim(vCodFornec) = '' then
          vCodFornec := cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsString + '|'
        else
          vCodFornec := vCodFornec + cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsString + '|';
        vQuantFornec := vQuantFornec + 1;
      end;
      cadCotacaoItens.Next;
    end;
    cadCotacaoItens.First;
    fTempCotacao.AfterScroll := nil;

    for I := 1 to vQuantFornec do
    begin
      cadCotacaoItens.dataSet.Filtered := False;
      cadCotacaoItens.dataSet.Filter := 'cod_fornecedor = ' + vDadosIni.getCampoPipe(vCodFornec, I);
      cadCotacaoItens.dataSet.Filtered := True;

      fTempCotacao.Insert;
      fTempCotacao.FieldByName('COD_COTACAO').AsInteger := dataSet.FieldByName('COD_COTACAO').AsInteger;
      fTempCotacao.FieldByName('COD_VENDEDOR').AsInteger := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
      fTempCotacao.FieldByName('COD_FORNECEDOR').AsInteger := cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger;
      fTempCotacao.FieldByName('COD_COND_PAG').AsInteger := cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsInteger;
      fTempCotacao.FieldByName('NUM_COTACAO').AsInteger := cadCotacaoItens.dataSet.FieldByName('COD_COTACAO').AsInteger;

      buscas.Close;
      buscas.SQL.Text := 'SELECT NOME_VENDEDOR FROM COLABORADOR ' +
       ' WHERE COD_VENDEDOR = ' + IntToStr(fTempCotacao.FieldByName('COD_VENDEDOR').AsInteger) +
       ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas.Open;
      fTempCotacao.FieldByName('NOME_VENDEDOR').AsString := buscas.FieldByName('NOME_VENDEDOR').AsString;

      buscas.Close;
      buscas.SQL.Text := ' SELECT NOME_CLIENTE FROM CLIENTES' +
       ' WHERE COD_CLIENTE = ' + IntToStr(fTempCotacao.FieldByName('COD_FORNECEDOR').AsInteger) +
       ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas.Open;
      fTempCotacao.FieldByName('NOME_CLIENTE').AsString := buscas.FieldByName('NOME_CLIENTE').AsString;

      buscas.Close;
      buscas.SQL.Text := ' SELECT DESC_COND_PAG FROM COND_PAG' +
        ' WHERE COD_COND_PAG = ' + IntToStr(fTempCotacao.FieldByName('COD_COND_PAG').AsInteger);
      buscas.Open;
      fTempCotacao.FieldByName('DESC_COND_PAG').AsString := buscas.FieldByName('DESC_COND_PAG').AsString;

      fTempCotacao.Post;
    end;
    cadCotacaoItens.dataSet.Filtered := False;
    cadCotacaoItens.First;
    fTempCotacao.AfterScroll := datasetAfterScrollCotacao;
    fTempCotacao.First;

    result := (formulario.ShowModal = mrOk);

  finally
    if Result then
      obCompraVenda.AbrirPedidoCompra;
    FrmSugestCompraVenda.pnCotacao.Parent := FrmSugestCompraVenda.TabSheet8;
    formulario.Free;
    formulario := nil;
  end;
end;

function Tcotacao.AbrirLixeira: boolean;
begin
if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if dataSet.IsEmpty then
      result := montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect('SELECT * FROM COTACAO ' +
      'WHERE cod_empresa = ' + vDadosIni.codEmpresa + ' and (ativo=0 or ativo is null) ');
end;

function Tcotacao.AbrirPedidoCompra: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
 vDadosIni.vPesquisa := 'PEDIDO	| 0';

  formulario := Funcoes.AbreForm('pkSugestaoCompras', 'TfrmCadPedidoCompra', hdTemp);
  vDadosIni.vDtSetTmp := TClientDataSet(fTempCotacao);
  vDadosIni.vDtSetTmpItens := TClientDataSet(fTempCotacaoItens);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure Tcotacao.alterarNcotacaoItens;
begin
 cadCotacaoItens.First;
 while not cadCotacaoItens.Eof do
 begin
   cadCotacaoItens.edit;
   cadCotacaoItens.dataSet.FieldByName('COD_COTACAO').AsInteger:=
   dataSet.FieldByName('COD_COTACAO').AsInteger;
   cadCotacaoItens.next;
 end;
end;

procedure Tcotacao.cadDNDEmpresa;
begin
if DtmCadBasicos = nil then
    DtmCadBasicos := TDtmCadBasicos.Create(DtmCadBasicos);
  if FrmcadDNAEmpresa = nil then
    Application.CreateForm(TFrmcadDNAEmpresa, FrmcadDNAEmpresa);
  FrmcadDNAEmpresa.ShowModal;
end;

function Tcotacao.checarCamposObrigatorios: boolean;
begin
	 try
   	 Result := false;
     if trim(dataSet.FieldByName('TIPOOP').AsString) = '' then
       raiseExceptionCreate('Tipo de Operação não informada', 'DBComboBox1');
     if trim(dataSet.FieldByName('cod_vendedor').AsString) = '' then
       raiseExceptionCreate('Código do Colaborador não informado', 'DBLookupComboBox1');
     if trim(dataSet.FieldByName('TIPODEP').AsString) = '' then
       raiseExceptionCreate('Tipo de Departamento não informado', 'DBComboBox2');
     Result := true;
   except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure Tcotacao.colocasequenciaitens;
var
 vitem: integer;
begin
{ cadCotacaoItens.First;
 vitem:=1;
 while not cadCotacaoItens.Eof do
 begin
   cadCotacaoItens.edit;
   cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsInteger:=
   vitem;
   cadCotacaoItens.next;
   vitem:=vitem+1;
 end;}
end;

function Tcotacao.cotacaoOLAP(vtipo: string; vcodcotacao: integer;vFerCube: THierCube): boolean;
begin
//
 if vtipo = 'COMPRA' then
 begin
   datasetBI.Close;
   datasetBI.SQL.text:=
   'select f.nome_cliente as nome_fornecedor,'+
   'gr.descricao as grupo_prod,it.descr_prod,it.curva,c.tipodep,it.tipvenda,it.CODSEQ_ITEM,'+
   'sum(it.CUSTO_UN_SIM) as valor_unitario_compra,'+
   'sum(it.QTDE_VENDIDA) as qtde_vendido,'+
   'sum(it.VALOR_MEDIO_VENDA) as valor_vendido,sum(it.qtde_simulada) as qtdePedida,'+
   'sum(it.QTDE_VENDA_PMEMES) as maximoqtdemes,sum(it.VALOR_VENDA_PMEMES) as maximovalormes,'+
   'sum(it.valor_venda_sim) as valor_venda,sum(it.cmv_produto) as valor_compra '+
   'from cotacao c,cotacao_itens it,grupos gr,clientes f where it.cod_cotacao = c.cod_cotacao '+
   'and it.tipoop = c.tipoop and it.cod_empresa = c.cod_empresa and it.grupo = gr.codigo_grup and '+
   'it.cod_fornecedor = F.cod_cliente and it.cod_empresa = f.cod_empresa '+
   'and c.cod_cotacao ='+inttostr(vcodcotacao)+' and c.cod_empresa = '+vDadosIni.codEmpresa+
   ' group by nome_fornecedor,grupo_prod,descr_prod,curva,tipodep,tipvenda,it.CODSEQ_ITEM ';
   datasetBI.Open;
   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('nome_fornecedor','Fornecedor',dgrow);
  vFerCube.DefineFieldAsDimension('descr_prod','Descrição produto',dgRow);
  vFerCube.DefineFieldAsDimension('grupo_prod','Grupo Produto',dgpage);
  vFerCube.DefineFieldAsDimension('curva','Curva ABC',dgPage);
  vFerCube.DefineFieldAsDimension('Tipodep','Departamento',dgPage);
  vFerCube.DefineFieldAsDimension('tipvenda','Natureza de Venda',dgPage);
  vFerCube.DefineFieldAsSummary('valor_unitario_compra');
  vFerCube.DefineFieldAsSummary('valor_compra');
  vFerCube.DefineFieldAsSummary('valor_venda');
  vFerCube.DefineFieldAsSummary('qtdepedida');
  vFerCube.DefineFieldAsSummary('qtde_vendido');
  vFerCube.DefineFieldAsSummary('valor_vendido');
  vFerCube.DefineFieldAsSummary('maximoqtdemes');
  vFerCube.DefineFieldAsSummary('maximovalormes');
 end
 else
 begin
   datasetBI.Close;
   datasetBI.SQL.text:=
   'select gr.descricao as grupo_prod,it.descr_prod,it.curva,c.tipodep,it.tipvenda,it.CODSEQ_ITEM,'+
   'sum(it.valor_venda_sim) as valor_venda,sum(it.cmv_produto) as cmv_produto,'+
   'sum(it.CUSTO_FIXO_PROP) as custofixoprop,sum(it.CUSTO_VARIAVEL) as custoVariavel,'+
   'sum(it.LUCRO_APURADO) as lucroapurado,sum(it.qtde_simulada) as qtdeVenda,'+
   'sum(it.QTDE_VENDA_PMEMES) as maximoqtdemes,sum(it.VALOR_VENDA_PMEMES) as maximovalormes '+
   'from cotacao c,cotacao_itens it,grupos gr where it.cod_cotacao = c.cod_cotacao '+
   'and it.tipoop = c.tipoop and it.cod_empresa = c.cod_empresa and it.grupo = gr.codigo_grup '+
   'and c.cod_cotacao = '+inttostr(vcodcotacao)+' and c.cod_empresa = '+vDadosIni.codEmpresa+
   'group by descricao,descr_prod,curva,tipodep,tipvenda,it.CODSEQ_ITEM ';
   datasetBI.Open;
   datasetBI.FetchAll;
//  except
//  end;
//  datasetBI.CommandText;
  vFerCube.DataSet:=DtmGestorHw.IbCubeGeral;
  vFerCube.BuildDimensionMap;
  vFerCube.DefineFieldAsDimension('tipvenda','Natureza de Venda',dgrow);
    vFerCube.DefineFieldAsDimension('grupo_prod','Grupo Produto',dgrow);
  vFerCube.DefineFieldAsDimension('descr_prod','Descrição produto',dgpage);
  vFerCube.DefineFieldAsDimension('curva','Curva ABC',dgPage);
  vFerCube.DefineFieldAsDimension('Tipodep','Departamento',dgPage);
  vFerCube.DefineFieldAsSummary('valor_venda');
  vFerCube.DefineFieldAsSummary('cmv_produto');
  vFerCube.DefineFieldAsSummary('custofixoprop');
  vFerCube.DefineFieldAsSummary('custovariavel');
  vFerCube.DefineFieldAsSummary('lucroapurado');
  vFerCube.DefineFieldAsSummary('qtdevenda');
  vFerCube.DefineFieldAsSummary('maximoqtdemes');
  vFerCube.DefineFieldAsSummary('maximovalormes');
 end;
end;

constructor Tcotacao.create;
begin
  DataSet := TClientDataSet(DtmGestorHw.CdsCotacao);
  transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
  Buscas := TIBQuery(DtmGestorHw.qrBuscas);
  cadCotacaoItens:=TcotacaoItens.create;
  cadcolaborador:=TcolaboradorGes.create;
  cadfornecedor:=TFornecedorGes.create;
  datasetBI:=TIBQuery(DtmGestorHw.IbCubeGeral);
  vnovaCotacao:='S';
  buscas.close;
  buscas.sql.Text:='select * from empresa where cod_empresa = '+vDadosIni.codEmpresa;
  buscas.open;
  vdtdefclasses:=buscas.FieldByName('DTDEF_CLASSEP').AsDateTime;
  vdtdfgiro:=buscas.FieldByName('DTDEFINICAO_GE').AsDateTime;
  vdiasmeses:=buscas.FieldByName('DIAS_TRABALHO_MES').AsInteger;
  buscas.Close;
  vfatcot:=0;
  vListaCotacao := TListaCotacao.Create;
  vAtributos:= TAtributos.create;
  vCondPag:= TCondPagGes.Create;

  fTempListaCotacao := TClientDataSet.Create(nil);
  fTempListaCotacao.Close;
  fTempListaCotacao.FieldDefs.Clear;
  fTempListaCotacao.FieldDefs.Add('COD_LISTA', ftInteger, 0, false);
  fTempListaCotacao.FieldDefs.Add('DESCRICAO_LISTA', ftString, 75, false);
  fTempListaCotacao.FieldDefs.Add('OBS', ftString, 80, false);

  if fTempListaCotacao.Tag = 0 then
  try
    fTempListaCotacao.CreateDataSet;
    fTempListaCotacao.Tag := 1;
    fTempListaCotacao.FieldByName('COD_LISTA').DisplayLabel := 'Codigo';
    fTempListaCotacao.FieldByName('DESCRICAO_LISTA').DisplayLabel := 'Descrição';
    fTempListaCotacao.FieldByName('OBS').DisplayLabel := 'OBS';
    fTempListaCotacaoDtSource := TDataSource.Create(nil);
    fTempListaCotacaoDtSource.DataSet := fTempListaCotacao;
  except
  end;

  fTempListaCotacaoItens := TClientDataSet.Create(nil);
  fTempListaCotacaoItens.Close;
  fTempListaCotacaoItens.FieldDefs.Clear;
  fTempListaCotacaoItens.FieldDefs.Add('SEL', ftString, 1, false);
  fTempListaCotacaoItens.FieldDefs.Add('COD_LISTA', ftInteger, 0, false);
  fTempListaCotacaoItens.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
  fTempListaCotacaoItens.FieldDefs.Add('COD_PROD', ftString, 6, false);
  fTempListaCotacaoItens.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
  fTempListaCotacaoItens.FieldDefs.Add('NUM_FAB_PROD', ftString, 20, false);
  fTempListaCotacaoItens.FieldDefs.Add('DESCR_PROD', ftString, 75, false);
  fTempListaCotacaoItens.FieldDefs.Add('QUANT_PROD', ftFloat, 0, false);
  fTempListaCotacaoItens.FieldDefs.Add('NUM_PED', ftInteger, 0, false);
  fTempListaCotacaoItens.FieldDefs.Add('COD_EMP_MULT', ftInteger, 0, false);
  fTempListaCotacaoItens.FieldDefs.Add('COD_COTACAO', ftInteger, 0, false);
  fTempListaCotacaoItens.FieldDefs.Add('COD_FORNECEDOR', ftInteger, 0, false);

  if fTempListaCotacaoItens.Tag = 0 then
  try
    fTempListaCotacaoItens.CreateDataSet;
    fTempListaCotacaoItens.Tag := 1;
    fTempListaCotacaoItens.FieldByName('SEL').DisplayLabel := 'Sel';
    fTempListaCotacaoItens.FieldByName('GRUPO_PROD').DisplayLabel := 'Grupo Prod';
    fTempListaCotacaoItens.FieldByName('COD_PROD').DisplayLabel := 'Cod Prod';
    fTempListaCotacaoItens.FieldByName('COD_GRADE').DisplayLabel := 'Cod Grade';
    fTempListaCotacaoItens.FieldByName('COD_EMP_MULT').DisplayLabel := 'Emp';
    fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').DisplayLabel := 'Num Fabr';
    fTempListaCotacaoItens.FieldByName('DESCR_PROD').DisplayLabel := 'Descr Prod';
    fTempListaCotacaoItens.FieldByName('QUANT_PROD').DisplayLabel := 'Quant';
    fTempListaCotacaoItens.FieldByName('NUM_PED').DisplayLabel := 'Num Sug';
    fTempListaCotacaoItens.FieldByName('COD_COTACAO').DisplayLabel := 'Cod Cotação';
    fTempListaCotacaoItens.FieldByName('COD_FORNECEDOR').DisplayLabel := 'Cod Fornecedor';
    fTempListaCotacaoItens.FieldByName('COD_LISTA').Visible := false;
    fTempListaCotacaoItens.FieldByName('COD_GRADE').Visible := false;
    fTempListaCotacaoItens.FieldByName('COD_FORNECEDOR').Visible := false;
    fTempListaCotacaoItensDtSource := TDataSource.Create(nil);
    fTempListaCotacaoItensDtSource.DataSet := fTempListaCotacaoItens;
  except
  end;
  try
    fTempListaCotacao.AfterScroll := datasetAfterScrollListaCotacao;
    fTempListaCotacaoItens2 := fTempListaCotacaoItens;
    fTempListaCotacaoItens2.FieldByName('COD_FORNECEDOR').Visible := true;
    fTempListaCotacaoItens2.FieldByName('COD_FORNECEDOR').Index := 1;
    fTempListaCotacaoItensDtSource2 := TDataSource.Create(nil);
    fTempListaCotacaoItensDtSource2.DataSet := fTempListaCotacaoItens2;
  except
  end;

  fTempCotacao := TClientDataSet.Create(nil);
  fTempCotacao.Close;
  fTempCotacao.FieldDefs.Clear;
  fTempCotacao.FieldDefs.Add('COD_COTACAO', ftInteger, 0, false);
  fTempCotacao.FieldDefs.Add('COD_VENDEDOR', ftInteger, 0, false);
  fTempCotacao.FieldDefs.Add('NOME_VENDEDOR', ftString, 35, false);
  fTempCotacao.FieldDefs.Add('COD_FORNECEDOR', ftInteger, 0, false);
  fTempCotacao.FieldDefs.Add('NOME_CLIENTE', ftString, 35, false);
  fTempCotacao.FieldDefs.Add('COD_COND_PAG', ftInteger, 0, false);
  fTempCotacao.FieldDefs.Add('DESC_COND_PAG', ftString, 30, false);
  fTempCotacao.FieldDefs.Add('NUM_COTACAO', ftInteger, 0, false);

  if fTempCotacao.Tag = 0 then
  try
    fTempCotacao.CreateDataSet;
    fTempCotacao.Tag := 1;
    fTempCotacao.FieldByName('COD_COTACAO').DisplayLabel := 'Codigo';
    fTempCotacao.FieldByName('COD_VENDEDOR').DisplayLabel := 'Cod Vendedor';
    fTempCotacao.FieldByName('NOME_VENDEDOR').DisplayLabel := 'Vendedor';
    fTempCotacao.FieldByName('COD_FORNECEDOR').DisplayLabel := 'Cod Fornec';
    fTempCotacao.FieldByName('NOME_CLIENTE').DisplayLabel := 'Fornecedor';
    fTempCotacao.FieldByName('COD_COND_PAG').DisplayLabel := 'Cod Cond Pag';
    fTempCotacao.FieldByName('DESC_COND_PAG').DisplayLabel := 'Cond Pag';
    fTempCotacao.FieldByName('NUM_COTACAO').DisplayLabel := 'Num Cotacao';
    fTempCotacaoDtSource := TDataSource.Create(nil);
    fTempCotacaoDtSource.DataSet := fTempCotacao;
  except
  end;

  fTempCotacaoItens := TClientDataSet.Create(nil);
  fTempCotacaoItens.Close;
  fTempCotacaoItens.FieldDefs.Clear;
  fTempCotacaoItens.FieldDefs.Add('SEL', ftString, 1, false);
  fTempCotacaoItens.FieldDefs.Add('COD_LISTA', ftInteger, 0, false);
  fTempCotacaoItens.FieldDefs.Add('CODSEQ_ITEM', ftInteger, 0, false);
  fTempCotacaoItens.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
  fTempCotacaoItens.FieldDefs.Add('COD_PROD', ftString, 6, false);
  fTempCotacaoItens.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
  fTempCotacaoItens.FieldDefs.Add('NUM_FAB_PROD', ftString, 20, false);
  fTempCotacaoItens.FieldDefs.Add('DESCR_PROD', ftString, 75, false);
  fTempCotacaoItens.FieldDefs.Add('QTDE_SIMULADA', ftFloat, 0, false);
  fTempCotacaoItens.FieldDefs.Add('VALOR_EQUILIBRIO', ftFloat, 0, false);
  fTempCotacaoItens.FieldDefs.Add('CMV_PRODUTO', ftFloat, 0, false);
  fTempCotacaoItens.FieldDefs.Add('NUM_PED', ftInteger, 0, false);
  fTempCotacaoItens.FieldDefs.Add('COD_FORNECEDOR', ftInteger, 0, false);
  fTempCotacaoItens.FieldDefs.Add('FRETE_SIM', ftFloat, 0, false);
  fTempCotacaoItens.FieldDefs.Add('IPI_SIM', ftFloat, 0, false);
  fTempCotacaoItens.FieldDefs.Add('MVA_SIM', ftFloat, 0, false);
  fTempCotacaoItens.FieldDefs.Add('NUM_COTACAO', ftInteger, 0, false);

  if fTempCotacaoItens.Tag = 0 then
  try
    fTempCotacaoItens.CreateDataSet;
    fTempCotacaoItens.Tag := 1;
    fTempCotacaoItens.FieldByName('CODSEQ_ITEM').DisplayLabel := 'Nº Item';
    fTempCotacaoItens.FieldByName('GRUPO_PROD').DisplayLabel := 'Grupo Prod';
    fTempCotacaoItens.FieldByName('COD_PROD').DisplayLabel := 'Cod Prod';
    fTempCotacaoItens.FieldByName('COD_GRADE').DisplayLabel := 'Cod Grade';
    fTempCotacaoItens.FieldByName('NUM_FAB_PROD').DisplayLabel := 'Num Fabr';
    fTempCotacaoItens.FieldByName('DESCR_PROD').DisplayLabel := 'Descr Prod';
    fTempCotacaoItens.FieldByName('QTDE_SIMULADA').DisplayLabel := 'Quant';
    fTempCotacaoItens.FieldByName('VALOR_EQUILIBRIO').DisplayLabel := 'Valor Un';
    fTempCotacaoItens.FieldByName('CMV_PRODUTO').DisplayLabel := 'Valor Tot';
    fTempCotacaoItens.FieldByName('NUM_PED').DisplayLabel := 'Num Sug';
    fTempCotacaoItens.FieldByName('COD_LISTA').Visible := false;
    fTempCotacaoItens.FieldByName('COD_GRADE').Visible := false;
    fTempCotacaoItens.FieldByName('COD_FORNECEDOR').Visible := false;
    fTempCotacaoItens.FieldByName('FRETE_SIM').DisplayLabel := 'Frete (%)';
    fTempCotacaoItens.FieldByName('IPI_SIM').DisplayLabel := 'IPI (%)';
    fTempCotacaoItens.FieldByName('MVA_SIM').DisplayLabel := 'Mva';
    fTempCotacaoItens.FieldByName('NUM_COTACAO').DisplayLabel := 'Num Cotacao';
    fTempCotacaoItensDtSource := TDataSource.Create(nil);
    fTempCotacaoItensDtSource.DataSet := fTempCotacaoItens;
  except
  end;

  fTempAtributos := TClientDataSet.Create(nil);
  fTempAtributos.Close;
  fTempAtributos.FieldDefs.Clear;
  fTempAtributos.FieldDefs.Add('COD_ATRIBUTO', ftInteger, 0, false);
  fTempAtributos.FieldDefs.Add('DESCRICAO_ATRIBUTO', ftString, 30, false);

  if fTempAtributos.Tag = 0 then
  try
    fTempAtributos.CreateDataSet;
    fTempAtributos.Tag := 1;
    fTempAtributos.FieldByName('COD_ATRIBUTO').DisplayLabel := 'Codigo';
    fTempAtributos.FieldByName('DESCRICAO_ATRIBUTO').DisplayLabel := 'Descrição';
    fTempAtributosDtSource := TDataSource.Create(nil);
    fTempAtributosDtSource.DataSet := fTempAtributos;
  except
  end;
end;

procedure Tcotacao.datasetAfterScrollCotacao(DataSet: TDataSet);
begin
  fTempCotacaoItens.EmptyDataSet;

  cadCotacaoItens.dataSet.Filtered := False;
  cadCotacaoItens.dataSet.Filter := 'cod_fornecedor = ' + fTempCotacao.FieldByName('COD_FORNECEDOR').AsString;
  cadCotacaoItens.dataSet.Filtered := True;

  cadCotacaoItens.First;
  while not cadCotacaoItens.Eof do
  begin
    fTempCotacaoItens.Insert;
    fTempCotacaoItens.FieldByName('SEL').AsString := '';
    fTempCotacaoItens.FieldByName('CODSEQ_ITEM').AsString := cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsString;
    fTempCotacaoItens.FieldByName('GRUPO_PROD').AsString := cadCotacaoItens.dataSet.FieldByName('GRUPO').AsString;
    fTempCotacaoItens.FieldByName('COD_PROD').AsString := cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString;
    fTempCotacaoItens.FieldByName('COD_GRADE').AsInteger := 0;
    fTempCotacaoItens.FieldByName('NUM_FAB_PROD').AsString := cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString;
    fTempCotacaoItens.FieldByName('DESCR_PROD').AsString := cadCotacaoItens.dataSet.FieldByName('DESCR_PROD').AsString;
    fTempCotacaoItens.FieldByName('QTDE_SIMULADA').AsFloat := cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat;
    fTempCotacaoItens.FieldByName('VALOR_EQUILIBRIO').AsFloat := cadCotacaoItens.dataSet.FieldByName('VALOR_EQUILIBRIO').AsFloat;
    fTempCotacaoItens.FieldByName('CMV_PRODUTO').AsFloat := cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsFloat;
    fTempCotacaoItens.FieldByName('FRETE_SIM').AsFloat := cadCotacaoItens.dataSet.FieldByName('FRETE_SIM').AsFloat;
    fTempCotacaoItens.FieldByName('IPI_SIM').AsFloat := cadCotacaoItens.dataSet.FieldByName('IPI_SIM').AsFloat;
    fTempCotacaoItens.FieldByName('MVA_SIM').AsFloat := cadCotacaoItens.dataSet.FieldByName('IPI_SIM').AsFloat;
    fTempCotacaoItens.FieldByName('NUM_COTACAO').AsInteger := cadCotacaoItens.dataSet.FieldByName('COD_COTACAO').AsInteger;
    fTempCotacaoItens.Post;
    cadCotacaoItens.Next;
  end;
  cadCotacaoItens.dataSet.First;
  cadCotacaoItens.dataSet.Filtered := False;
end;

procedure Tcotacao.datasetAfterScrollListaCotacao(DataSet: TDataSet);
var
   buscas2: TIBQuery;
   vCod: Integer;
begin
  buscas2 := TIBQuery(DtmGestorHw.QrBuscas2);

  if fTempListaCotacao.FieldByName('COD_LISTA').AsInteger > 0 then
    vCod := fTempListaCotacao.FieldByName('COD_LISTA').AsInteger
  else
    vCod := pCodLista;
    
  buscas2.Close;
  buscas2.SQL.Text := ' SELECT GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA AS COD_EMP_MULT, COD_EMPRESA, ' +
  	' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED FROM LISTA_COTACAO_ITENS ' +
  	' WHERE COD_LISTA = ' +IntToStr(vCod) +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' UNION ALL ' +
    ' SELECT GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMP_MULT, COD_EMPRESA, ' +
  	' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED FROM LISTA_COTACAO_ITENS2 ' +
  	' WHERE COD_LISTA = ' +IntToStr(vCod) +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
//    vDadosIni.IfThen(not vDadosIni.vSugCompra.vMultiempresa, ' AND COD_EMP_MULT = ' + vDadosIni.codEmpresa, '') +
    ' ORDER BY 1, 2, 3, 4, 5 ';
  buscas2.Open;

  fTempListaCotacaoItens.EmptyDataSet;

  buscas2.First;
  while not buscas2.Eof do
  begin
    fTempListaCotacaoItens.Insert;
    fTempListaCotacaoItens.FieldByName('SEL').AsString := '';
    fTempListaCotacaoItens.FieldByName('GRUPO_PROD').AsString := buscas2.FieldByName('GRUPO_PROD').AsString;
    fTempListaCotacaoItens.FieldByName('COD_PROD').AsString := buscas2.FieldByName('COD_PROD').AsString;
    fTempListaCotacaoItens.FieldByName('COD_GRADE').AsInteger := buscas2.FieldByName('COD_GRADE').AsInteger;
    fTempListaCotacaoItens.FieldByName('COD_EMP_MULT').AsInteger := buscas2.FieldByName('COD_EMP_MULT').AsInteger;
    fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString := buscas2.FieldByName('NUM_FAB_PROD').AsString;
    fTempListaCotacaoItens.FieldByName('DESCR_PROD').AsString := buscas2.FieldByName('DESCR_PROD').AsString;
    fTempListaCotacaoItens.FieldByName('QUANT_PROD').AsFloat := buscas2.FieldByName('QUANT_PROD').AsFloat;
    fTempListaCotacaoItens.FieldByName('NUM_PED').AsInteger := buscas2.FieldByName('NUM_PED').AsInteger;
    fTempListaCotacaoItens.Post;
    
    buscas2.Next;
  end;
  fTempListaCotacaoItens.IndexFieldNames:='GRUPO_PROD;COD_PROD;COD_GRADE;COD_EMP_MULT';
  fTempListaCotacaoItens.First;
end;

destructor Tcotacao.Destroy;
begin
  vListaCotacao.Free;
  vListaCotacao := nil;

  vAtributos.Free;
  vAtributos := nil;

  vCondPag.Free;
  vCondPag := nil;

  cadCotacaoItens.free;
  inherited;
end;

function Tcotacao.edit: boolean;
begin
	Result := False;
  
  if not dataSet.Active then
    montaSelect('select * from cotacao ' +
  		' where cod_cotacao = 0 ' +
      ' and tipoop = ''VENDA'' ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);

	if inherited Edit then
  begin
    Result := True;
    if dataSet.FieldByName('TIPODEP').IsNull then
    	dataSet.FieldByName('TIPODEP').AsString := 'P';
    cadCotacaoItens.abrecotacaoitens(
 	 		dataSet.FieldByName('COD_COTACAO').AsInteger,
		 	dataSet.FieldByName('TIPOOP').AsString);
    cadcolaborador.abrebase(0);
    vCondPag.abreCondPag;
    if dataSet.FieldByName('TIPOOP').AsString = 'COMPRA' then
    obCompraVenda.cadfornecedor.abrebase;
  end;
end;

function Tcotacao.EnviarpraLixeira: boolean;
var
	vCodCotacao: Integer;
begin
	try
    result := false;

    vCodCotacao := dataSet.FieldByName('COD_COTACAO').AsInteger;
    if Edit then
    begin
      dataSet.FieldByName('ATIVO').asinteger := 0;
      Result := inherited post;
      if result then
      begin
        if Apply then
        begin
          if CommitaTransacao then
          begin
            vDadosIni.GravaAuditoria('GES032', 'EXCLUIR', IntToStr(vCodCotacao) + ' Sucesso', 'COTACAO', IntToStr(vCodCotacao), buscas);
            result := true;
          end
          else
          begin
            vDadosIni.GravaAuditoria('GES032', 'EXCLUIR', IntToStr(vCodCotacao) + ' Falha', 'COTACAO', IntToStr(vCodCotacao), buscas);
            CancelUpdates;
            result := false;
          end;
        end
        else
        begin
          vDadosIni.GravaAuditoria('GES032', 'EXCLUIR', IntToStr(vCodCotacao) + ' Falha', 'COTACAO', IntToStr(vCodCotacao), buscas);
          CancelUpdates;
          result := false;
        end;
      end
      else
        vDadosIni.GravaAuditoria('GES032', 'EXCLUIR', IntToStr(vCodCotacao) + ' Falha', 'COTACAO', IntToStr(vCodCotacao),  buscas)
    end;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function Tcotacao.imprimirRel(pMostrarRazao: boolean = false; pOrdem: string = ''; pAtributos: string = ''): boolean;
var
 vQuantFornec, vQuantAtr, I, J, vNitem: Integer;
 vCodFornecPipe, vCodFornecPipeAnt, vCodFornec, vCodFornecTemp, vCodFornecRet, vNumFabr, vOrdem: string;
 buscas2: TIBQuery;
 vNota, vQuantMin, valorAtr: double;
 vtotquant, vtotcusto, vtotcustoun, vtotnota: double;
 vMenorPrecCusto, vMenorPrecCustoAnt: TStringList;


  function OrdenarAtr (quantRecordAtrib: Integer; codAtrib: string; valorAtr: double; qtdeAtr, qtdeAtrTot: Integer; vClientes: string): boolean;
  begin
     Result := true;

     if ((quantRecordAtrib > 1) and (qtdeAtr <> qtdeAtrTot)) then
     begin
       buscas.Close;
       buscas.SQL.Text := 'select t.cod_atributo, t.valor_atributo , cl.cod_cliente, cl.nome_cliente, cl.razao from clientes cl' +
        ' left join atributos_fornec t on t.cod_cliente = cl.cod_cliente and t.cod_empresa = cl.cod_empresa' +
        ' where cl.cod_cliente in  ('+Copy(vClientes, 1, length(vClientes) - 1)+') and cl.cod_empresa = '+vDadosIni.codEmpresa+
        ' and t.cod_atributo = ' + vDadosIni.getCampoPipe(codAtrib, qtdeAtr + 1) +' order by t.valor_atributo desc';
       buscas.Open;

       if not buscas.IsEmpty then
       begin
         buscas.First;
         valorAtr := buscas.FieldByName('VALOR_ATRIBUTO').AsFloat;

         buscas.Close;
         buscas.SQL.Text := 'select t.cod_atributo, t.valor_atributo , cl.cod_cliente, cl.nome_cliente, cl.razao from clientes cl' +
          ' left join atributos_fornec t on t.cod_cliente = cl.cod_cliente and t.cod_empresa = cl.cod_empresa' +
          ' where cl.cod_cliente in  ('+Copy(vClientes, 1, length(vClientes) - 1)+') and cl.cod_empresa = '+vDadosIni.codEmpresa+
          ' and t.cod_atributo = ' + vDadosIni.getCampoPipe(codAtrib, qtdeAtr + 1) +
          ' and t.valor_atributo = :VALOR_ATRIBUTO  order by t.valor_atributo desc';
         buscas.ParamByName('VALOR_ATRIBUTO').AsFloat := valorAtr;
         buscas.Open;
         buscas.First;

         vCodFornecRet := '';
         buscas.First;
         while not buscas.Eof do
         begin
           vCodFornecRet :=  vCodFornecRet + buscas.FieldByName('COD_CLIENTE').AsString + ',';
           buscas.Next
         end;
         buscas.First;

         qtdeAtr := qtdeAtr + 1;

         OrdenarAtr (buscas.RecordCount, codAtrib, 0, qtdeAtr, qtdeAtrTot, vCodFornecRet);
       end;
     end
     else
     begin
       if Pos(buscas.FieldByName('COD_CLIENTE').AsString + '|', vCodFornecPipe) = 0 then
       begin
         vCodFornecPipe := vCodFornecPipe + buscas.FieldByName('COD_CLIENTE').AsString + '|';
         vCodFornecTemp := buscas.FieldByName('COD_CLIENTE').AsString + ',';
         Result := False;
         exit;
       end;
     end;
  end;

  function VerificarProdFornec(cod: Integer = 0): boolean;
  var
   j: Integer;
   vPrecCusto: double;
  begin
     Result := True;
     vQuantMin := 0;

     for j := 1 to vQuantFornec do
     begin
       buscas2.Close;
       buscas2.SQL.Text := ' select * from cotacao_itens ' +
        ' where cod_cotacao = ' + IntToStr(dataSet.FieldByName('COD_COTACAO').AsInteger) +
        ' and cod_fornecedor = ' + vDadosIni.getCampoPipe(vCodFornecPipe, j) +
        ' and grupo = ' + IntToStr(cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger) +
        ' and cod_prod = ' + QuotedStr(cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
       buscas2.Prepare;
       buscas2.Open;

       if not buscas2.IsEmpty then
         if vQuantMin <= 0 then
           vQuantMin := buscas2.FieldByName('QTDE_SIMULADA').AsFloat
         else if vQuantMin > buscas2.FieldByName('QTDE_SIMULADA').AsFloat then
          vQuantMin := buscas2.FieldByName('QTDE_SIMULADA').AsFloat;

       if buscas2.IsEmpty then
       begin
         Result := False;
         exit;
       end;
     end;

     if cod <> 0 then
      for j := 1 to vQuantFornec do
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select * from cotacao_itens ' +
         ' where cod_cotacao = ' + IntToStr(dataSet.FieldByName('COD_COTACAO').AsInteger) +
         ' and cod_fornecedor = ' + vDadosIni.getCampoPipe(vCodFornecPipe, j) +
         ' and grupo = ' + IntToStr(cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger) +
         ' and cod_prod = ' + QuotedStr(cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString) +
         ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas2.Prepare;
        buscas2.Open;

        if buscas2.FieldByName('CUSTO_UN_SIM').AsFloat  > 0then
           vPrecCusto := buscas2.FieldByName('CUSTO_UN_SIM').AsFloat
        else
           vPrecCusto := 0;

        if pos(buscas2.FieldByName('COD_FORNECEDOR').AsString+'-'+trim(buscas2.FieldByName('GRUPO').AsString) + trim(buscas2.FieldByName('COD_PROD').AsString) + '|', vNumFabr) = 0 then
        begin
          vNumFabr := vNumFabr + trim(buscas2.FieldByName('COD_FORNECEDOR').AsString) + '-' + trim(buscas2.FieldByName('GRUPO').AsString) + trim(buscas2.FieldByName('COD_PROD').AsString) + '|';

          if vMenorPrecCusto.Count < j then
          begin
             vMenorPrecCusto.Add(FloatToStr(vPrecCusto));
             vMenorPrecCustoAnt.Add(FloatToStr(vPrecCusto));
          end
          else
          begin
             vMenorPrecCusto[j - 1] := FloatToStr(StrToFloat(vMenorPrecCusto[j - 1]) + vPrecCusto);
             vMenorPrecCustoAnt[j - 1] := FloatToStr(StrToFloat(vMenorPrecCustoAnt[j - 1]) + vPrecCusto);
          end;
        end;
      end;
  end;


  procedure Linhas;
  begin
     DtmGestorHw.RDprintGestor.Impf(linha, 1, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 7, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 18, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 72, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 83, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 96, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 109, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 122, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 135, '|', [comp17]);
     DtmGestorHw.RDprintGestor.Impf(linha, 148, '|', [comp17]);
  end;

  procedure Separador(ln: integer; tp: integer);
  begin
    DtmGestorHw.RDprintGestor.Impf(ln, 1, '+' + VdadosIni.replicate('-', 6), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 7, '+' + VdadosIni.replicate('-', 14), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 18, '+' + VdadosIni.replicate('-', 62), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 72, '+' + VdadosIni.replicate('-', 26), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 83, '+' + VdadosIni.replicate('-', 26), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 96, '+' + VdadosIni.replicate('-', 12), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 109, '+' + VdadosIni.replicate('-', 18), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 122, '+' + VdadosIni.replicate('-', 18), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 135, '+' + VdadosIni.replicate('-', 13), [comp17]);
    DtmGestorHw.RDprintGestor.Impf(ln, 148, '+', [comp17]);
  end;

  procedure CabNovaPagina;
  var
    vNomeVendedor, vCondPag: string;
  begin
    if vpag > 0 then
      DtmGestorHw.RDprintGestor.Novapagina;

    vpag := vpag + 1;

    linha := 2;
    DtmGestorHw.RDprintGestor.ImpF(linha, 1, 'EMPRESA', [normal, negrito]);
    linha := linha + 1;
    DtmGestorHw.RDprintGestor.Impf(linha, 01, 'EMITENTE: ' + vDadosIni.vEmp.vnomeEmpresa, [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 90, 'CNPJ.....: ' + vDadosIni.vEmp.vCNPJ, [comp17]);
    linha := linha + 1;
    DtmGestorHw.RDprintGestor.Impf(linha, 1, 'Endereco : ' + vDadosIni.vEmp.vEndereco, [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 48, 'Cidade/UF: ' + vDadosIni.vEmp.vCidade, [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 90, 'Bairro...: ' + vDadosIni.vEmp.vBairro, [comp17]);
    linha := linha + 1;
    DtmGestorHw.RDprintGestor.Impf(linha, 1, 'Telef    : ' + vDadosIni.vEmp.vTelefone, [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 48, 'Num Cot..: ' + vDadosIni.StrZero(dataSet.FieldByName('COD_COTACAO').AsInteger, 7), [comp17]);
    if ((trim(pOrdem) = 'ATRIBUTOS') or (trim(pOrdem) = 'MEDIA DOS ATRIBUTOS'))  then
      DtmGestorHw.RDprintGestor.Impf(linha, 90, 'Ordem....: ' + pOrdem + ' ' + pAtributos, [comp17])
    else if pOrdem = 'NOME/RAZAO' then
    begin
      if pMostrarRazao then
        DtmGestorHw.RDprintGestor.Impf(linha, 90, 'Ordem....: RAZAO SOCIAL', [comp17])
      else
        DtmGestorHw.RDprintGestor.Impf(linha, 90, 'Ordem....: NOME FANTASIA', [comp17]);
    end
    else
      DtmGestorHw.RDprintGestor.Impf(linha, 90, 'Ordem....: ' + pOrdem, [comp17]);

    DtmGestorHw.RDprintGestor.Impf(linha, 139, 'Pág.:' + IntToStr(vpag), [comp17]);

    linha := linha + 1;

    linha := linha + 1;
    separador(linha, 1);
    linha := linha + 1;
    Linhas;
    DtmGestorHw.RDprintGestor.Impf(linha, 2, 'ITEM', [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 9, 'NUM. PROD', [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 21, 'DESCRICAO', [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 76, 'QTDE', [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 85, 'CUSTO UNT.', [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 97, 'CUSTO TOTAL', [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 114, 'MVA(%)', [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 127, 'IPI(%)', [comp17]);
    DtmGestorHw.RDprintGestor.Impf(linha, 139, 'FRETE(%)', [comp17]);
    linha := linha + 1;
    separador(linha, 1);
  end;

begin
  if not vDadosIni.ModImp(DtmGestorHw.RDprintGestor) then
    exit;
  DtmGestorHw.RDprintGestor.FonteTamanhoPadrao := S17cpp;
  DtmGestorHw.RDprintGestor.TamanhoQteColunas := 150;
  DtmGestorHw.RDprintGestor.CaptionSetup := 'Configurações de Impressão';
  DtmGestorHw.RDprintGestor.OpcoesPreview.CaptionPreview := 'Fornecedores';
  DtmGestorHw.RDprintGestor.TitulodoRelatorio := 'Fornecedores';
  vDadosIni._LimparVarSendEmail;
  DtmGestorHw.RDprintGestor.OnSendMail := vDadosini._SendMailRdPrint;
  DtmGestorHw.RDprintGestor.OpcoesPreview.Preview := true;

  vpag := 0;
  vQuantFornec := 0;
  vCodFornecPipe := '';
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  cadCotacaoItens.abrecotacaoitens(dataSet.FieldByName('COD_COTACAO').AsInteger, dataSet.FieldByName('TIPOOP').AsString);

  cadCotacaoItens.First;
  while not cadCotacaoItens.Eof do
  begin
    if pos(cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsString + '|', vCodFornecPipe) = 0 then
    begin
      if trim(vCodFornecPipe) = '' then
        vCodFornecPipe := cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsString + '|'
      else
        vCodFornecPipe := vCodFornecPipe + cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsString + '|';
      vQuantFornec := vQuantFornec + 1;
    end;
    cadCotacaoItens.Next;
  end;
  cadCotacaoItens.First;

   if not DtmGestorHw.RDprintGestor.EstaAberto then
   DtmGestorHw.RDprintGestor.Abrir;
  CabNovaPagina; //cabeçalho

  try
     Screen.Cursor := crHourGlass;
  finally
     Screen.Cursor := crDefault;
  end;


   if pOrdem = 'PRECO CUSTO' then
   begin
      vNumFabr := '';
      vMenorPrecCusto := TStringList.Create;
      vMenorPrecCusto.Clear;
      vMenorPrecCustoAnt := TStringList.Create;
      vMenorPrecCustoAnt.Clear;
      cadCotacaoItens.First;
      while not cadCotacaoItens.Eof do
      begin
        VerificarProdFornec(1);
        cadCotacaoItens.Next;
     end;

     vMenorPrecCusto.Sort;
     vCodFornec := vCodFornecPipe;
     vCodFornecPipe := '';

     for I := 0 to vMenorPrecCusto.Count - 1 do
       for J := 0 to vMenorPrecCustoAnt.Count - 1 do
         if vMenorPrecCusto[I] = vMenorPrecCustoAnt[J] then
         begin
          vCodFornecPipe := vCodFornecPipe + vDadosIni.getCampoPipe(vCodFornec, J + 1) + '|';
          Break;
         end;

   end
   else if pOrdem = 'NOME/RAZAO' then
   begin
     if pMostrarRazao then
       vOrdem := ' order by cl.razao asc'
     else
       vOrdem := ' order by cl.nome_cliente asc'
   end
   else if pOrdem = 'PRAZO PAG' then
     vOrdem := ' order by cl.prazo_medio_pag desc'
   else if pOrdem = 'PRAZO ENT' then
     vOrdem := ' order by cl.prazo_medio_ent asc';

   if ((pOrdem = 'NOME/RAZAO') or
      (pOrdem = 'PRAZO PAG') or (pOrdem = 'PRAZO ENT')) then
   begin
     vCodFornec := StringReplace(vCodFornecPipe, '|', ',', [rfReplaceAll]);

     buscas.Close;
     buscas.SQL.Text := ' select cl.cod_cliente, trim(cl.nome_cliente) nome_cliente, trim(cl.razao) razao from clientes cl' +
      ' where cl.cod_cliente in ('+Copy(vCodFornec, 1, length(vCodFornec) - 1)+') and cl.cod_empresa = ' + vDadosIni.codEmpresa + vOrdem;
     buscas.Prepare;
     buscas.Open;

     vCodFornecPipe := '';
     buscas.First;
     while not buscas.Eof do
     begin
       vCodFornecPipe := vCodFornecPipe + buscas.FieldByName('COD_CLIENTE').AsString + '|';
       buscas.Next;
     end;
   end
   else if ((pOrdem = 'ATRIBUTOS') or (pOrdem = 'MEDIA DOS ATRIBUTOS')) then
   begin
    try
     vCodFornec := StringReplace(vCodFornecPipe, '|', ',', [rfReplaceAll]);

     if pOrdem = 'ATRIBUTOS' then
     begin
       vQuantAtr := 0;
       pAtributos := StringReplace(pAtributos, '(', '', [rfReplaceAll]);
       pAtributos := StringReplace(pAtributos, ')', '|', [rfReplaceAll]);
       pAtributos := StringReplace(pAtributos, ',', '|', [rfReplaceAll]);

        for i := 1 to Length(pAtributos) do
         if (pAtributos[i] = '|') then
           vQuantAtr := vQuantAtr + 1;

      vCodFornecPipeAnt := vCodFornecPipe;
      vCodFornecPipe := '';
      vCodFornecTemp := '';

      for I := 1 to vQuantFornec do
      begin
        for J := 1 to vQuantAtr do
        begin
          buscas.Close;
          buscas.SQL.Text := ' select t.cod_atributo, t.valor_atributo , cl.cod_cliente, cl.nome_cliente, cl.razao from clientes cl' +
           ' left join atributos_fornec t on t.cod_cliente = cl.cod_cliente and t.cod_empresa = cl.cod_empresa' +
           ' where cl.cod_cliente in  ('+Copy(vCodFornec, 1, length(vCodFornec) - 1)+') and cl.cod_empresa = '+vDadosIni.codEmpresa+
           ' and t.cod_atributo = ' + vDadosIni.getCampoPipe(pAtributos,J) + ' order by t.valor_atributo desc';
          buscas.Open;

          if not buscas.IsEmpty then
          begin
            buscas.First;
            valorAtr := buscas.FieldByName('VALOR_ATRIBUTO').AsFloat;

            buscas.Close;
            buscas.SQL.Text := ' select t.cod_atributo, t.valor_atributo , cl.cod_cliente, cl.nome_cliente, cl.razao from clientes cl' +
             ' left join atributos_fornec t on t.cod_cliente = cl.cod_cliente and t.cod_empresa = cl.cod_empresa' +
             ' where cl.cod_cliente in  ('+Copy(vCodFornec, 1, length(vCodFornec) - 1)+') and cl.cod_empresa = '+vDadosIni.codEmpresa+
             ' and t.cod_atributo = ' + vDadosIni.getCampoPipe(pAtributos,J) +
             ' and t.valor_atributo = :VALOR_ATRIBUTO  order by t.valor_atributo desc';
            buscas.ParamByName('VALOR_ATRIBUTO').AsFloat := valorAtr;
            buscas.Open;

            vCodFornecRet := '';
            buscas.First;
            while not buscas.Eof do
            begin
              vCodFornecRet :=  vCodFornecRet + buscas.FieldByName('COD_CLIENTE').AsString + ',';
              buscas.Next
            end;
            buscas.First;

            if not OrdenarAtr(buscas.RecordCount, pAtributos, 0, J, vQuantAtr, vCodFornecRet) then;
             break;
          end;
        end;
        if vCodFornecPipe <> '' then
         vCodFornec := StringReplace(vCodFornec, vCodFornecTemp, '', [rfReplaceAll]);
      end;

      for I := 1 to vQuantFornec do
       if Pos(vDadosIni.getCampoPipe(vCodFornecPipeAnt, I), vCodFornecPipe) = 0 then
         vCodFornecPipe := vCodFornecPipe + vDadosIni.getCampoPipe(vCodFornecPipeAnt, I) + '|';

     end
     else
     begin
       buscas.Close;
       buscas.SQL.Text := ' select sum(t.valor_atributo) nota, cl.cod_cliente, cl.nome_cliente, cl.razao from clientes cl' +
         ' left join atributos_fornec t on t.cod_cliente = cl.cod_cliente and t.cod_empresa = cl.cod_empresa' +
         ' where cl.cod_cliente in ('+Copy(vCodFornec, 1, length(vCodFornec) - 1)+')  and cl.cod_empresa = '+vDadosIni.codEmpresa+' and ' +
         ' ((t.cod_atributo in '+ pAtributos +') or (t.cod_atributo is null)) group by cl.cod_cliente, cl.nome_cliente, cl.razao order by 1 desc';
       buscas.Prepare;
       buscas.Open;

       vCodFornecPipeAnt := vCodFornecPipe;
       vCodFornecPipe := '';

       if not buscas.IsEmpty then
       begin
         buscas.First;
         buscas.First;
         while not buscas.Eof do
         begin
           if pos(buscas.FieldByName('COD_CLIENTE').AsString + '|', vCodFornecPipe) = 0 then
             vCodFornecPipe := vCodFornecPipe + buscas.FieldByName('COD_CLIENTE').AsString + '|';
           buscas.Next;
         end;
       end;

      for I := 1 to vQuantFornec do
       if Pos(vDadosIni.getCampoPipe(vCodFornecPipeAnt, I), vCodFornecPipe) = 0 then
         vCodFornecPipe := vCodFornecPipe + vDadosIni.getCampoPipe(vCodFornecPipeAnt, I) + '|';
     end;
    except
       Application.MessageBox(PChar('E0006 ' + 'Erro ao ler executar comandos sql: ' + buscas.SQL.Text), 'Atenção', MB_ICONWARNING + MB_OK);
      exit;
    end;
   end;

   for I := 1 to vQuantFornec do
   begin
    linha := linha + 2;

    cadCotacaoItens.dataSet.Filtered := False;
    cadCotacaoItens.dataSet.Filter := 'cod_fornecedor = ' + vDadosIni.getCampoPipe(vCodFornecPipe, I);
    cadCotacaoItens.dataSet.Filtered := True;

     buscas.Close;
     buscas.SQL.Text := ' select cl.cod_cliente, cl.nome_cliente, cl.razao, cl.cod_cond_pag, cl.prazo_medio_ent, cl.prazo_medio_pag from clientes cl' +
      ' where cl.cod_cliente = ' + vDadosIni.getCampoPipe(vCodFornecPipe, I) + ' and cl.cod_empresa = ' + vDadosIni.codEmpresa;
     buscas.Prepare;
     buscas.Open;

     if pMostrarRazao then
      DtmGestorHw.RDprintGestor.Impf(linha, 01, buscas.FieldByName('COD_CLIENTE').AsString +' - '+ trim(buscas.FieldByName('RAZAO').AsString), [negrito])
     else
      DtmGestorHw.RDprintGestor.Impf(linha, 01, buscas.FieldByName('COD_CLIENTE').AsString +' - '+ trim(buscas.FieldByName('NOME_CLIENTE').AsString), [negrito]);

     buscas2.Close;
     buscas2.SQL.Text := 'select trim(desc_cond_pag) desc_cond_pag from cond_pag' +
      ' where cod_cond_pag = '+ IntToStr(buscas.FieldByName('COD_COND_PAG').AsInteger);
     buscas2.Prepare;
     buscas2.Open;

     if trim(buscas2.FieldByName('DESC_COND_PAG').AsString) = '' then
       DtmGestorHw.RDprintGestor.ImpF(linha, 70, 'COND. PAG.: NAO INFORMADA', [negrito])
     else
       DtmGestorHw.RDprintGestor.ImpF(linha, 70, 'COND. PAG.:'+ buscas2.FieldByName('DESC_COND_PAG').AsString, [negrito]);
     DtmGestorHw.RDprintGestor.ImpF(linha, 112, 'PRAZO PAG.:' + format('%2.2f', [buscas.FieldByName('PRAZO_MEDIO_PAG').AsFloat]), [negrito]);
     DtmGestorHw.RDprintGestor.ImpF(linha, 131, 'PRAZO ENT.:' + format('%2.2f', [buscas.FieldByName('PRAZO_MEDIO_ENT').AsFloat]), [negrito]);

     buscas.Close;
     buscas.SQL.Text := 'select atr.cod_atributo, atr.descricao_atributo, 0 valor_atributo from atributos atr' +
      ' where atr.ativo = 1 and atr.cod_empresa = ' + vDadosIni.codEmpresa + ' order by atr.descricao_atributo';
     buscas.Prepare;
     buscas.Open;

     if not buscas.IsEmpty then
      DtmGestorHw.RDprintGestor.Imp(linha + 1, 004, 'ATRIBUTOS:');
     vtotnota := 0;
     buscas.First;
     while not buscas.Eof do
     begin
       linha := linha + 1;
       buscas2.Close;
       buscas2.SQL.Text := 'select atr.cod_atributo, atr.descricao_atributo, atf.* from atributos atr' +
       ' left join atributos_fornec atf on atf.cod_atributo = atr.cod_atributo and atf.cod_empresa = atr.cod_empresa ' +
       ' left join clientes cl on cl.cod_cliente = atf.cod_cliente and cl.cod_empresa = atf.cod_empresa ' +
       ' where atr.cod_atributo = ' + IntToStr(buscas.FieldByName('COD_ATRIBUTO').AsInteger) +
       ' and atr.ativo = 1 and atf.cod_cliente = ' + vDadosIni.getCampoPipe(vCodFornecPipe, I) + ' and atr.cod_empresa = ' + vDadosIni.codEmpresa;
       buscas2.Prepare;
       buscas2.Open;

       if not buscas2.IsEmpty then
        vNota := buscas2.FieldByName('VALOR_ATRIBUTO').AsFloat
       else
        vNota := 0;

       vtotnota :=  vtotnota + vNota;

       DtmGestorHw.RDprintGestor.Imp(linha, 019, buscas.FieldByName('COD_ATRIBUTO').AsString);
       DtmGestorHw.RDprintGestor.Imp(linha, 030, trim(buscas.FieldByName('DESCRICAO_ATRIBUTO').AsString));
       DtmGestorHw.RDprintGestor.ImpD(linha, 063, format('%8.2f', [vNota]), [comp17]);
       buscas.Next;
     end;
     linha := linha + 1;
     vNitem := 0;
     cadCotacaoItens.First;
     vtotquant := 0;
     vtotcusto := 0;
     vtotcustoun := 0;
     while not cadCotacaoItens.Eof do
     begin
       if VerificarProdFornec then
       begin
         vNitem := vNitem + 1;
         linha := linha + 1;
         vtotquant := vtotquant + vQuantMin;
         vtotcustoun := vtotcustoun + cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat;
         vtotcusto := vtotcusto + (vQuantMin * cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat);
         DtmGestorHw.RDprintGestor.Imp(linha, 002, IntToStr(vNitem));
         DtmGestorHw.RDprintGestor.Imp(linha, 009, cadCotacaoItens.dataSet.FieldByName('GRUPO').AsString +' '+ trim(cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString));
         DtmGestorHw.RDprintGestor.Imp(linha, 020, copy(trim(cadCotacaoItens.dataSet.FieldByName('DESCR_PROD').AsString), 1, 52));
         DtmGestorHw.RDprintGestor.ImpD(linha, 083, format('%8.3f', [vQuantMin]), [comp17]);
         DtmGestorHw.RDprintGestor.ImpD(linha, 096,  format('%8.2f', [cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat]), [comp17]);
         DtmGestorHw.RDprintGestor.ImpD(linha, 109, format('%8.2f', [vQuantMin * cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat]), [comp17]);
         DtmGestorHw.RDprintGestor.ImpD(linha, 122, format('%8.2f', [cadCotacaoItens.dataSet.FieldByName('MVA_SIM').AsFloat]), [comp17]);
         DtmGestorHw.RDprintGestor.ImpD(linha, 135, format('%8.2f', [cadCotacaoItens.dataSet.FieldByName('IPI_SIM').AsFloat]), [comp17]);
         DtmGestorHw.RDprintGestor.ImpD(linha, 148, format('%8.2f', [cadCotacaoItens.dataSet.FieldByName('FRETE_SIM').AsFloat]), [comp17]);
       end;
       cadCotacaoItens.Next;
       if linha >= 65 then
       begin
         linha := 1;
         CabNovaPagina;
       end;
     end;
     linha := linha + 1;
     DtmGestorHw.RDprintGestor.ImpF(linha, 004,'TOTAIS:', [comp17, negrito]);
     DtmGestorHw.RDprintGestor.ImpD(linha, 063, format('%8.2f', [vtotnota]), [comp17, negrito]);
     DtmGestorHw.RDprintGestor.ImpD(linha, 083, format('%8.3f', [vtotquant]), [comp17, negrito]);
     DtmGestorHw.RDprintGestor.ImpD(linha, 096, format('%8.2f', [vtotcustoun]), [comp17, negrito]);
     DtmGestorHw.RDprintGestor.ImpD(linha, 109, format('%8.2f', [vtotcusto]), [comp17, negrito]);
   end;
   cadCotacaoItens.dataSet.Filtered := False;

  if DtmGestorHw.RDprintGestor.EstaAberto then
      DtmGestorHw.RDprintGestor.Fechar;

end;

function Tcotacao.Insert(pTipoOP: string): boolean;
begin
	Result := False;

  if not dataSet.Active then
    montaSelect('select * from cotacao ' +
  		' where cod_cotacao = 0 ' +
      ' and tipoop = ''VENDA'' ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);

  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('TIPOOP').AsString := pTipoOP;
    dataSet.FieldByName('TIPODEP').AsString := 'P';
    Preenchcampos;
    cadCotacaoItens.abrecotacaoitens(dataSet.FieldByName('COD_COTACAO').AsInteger, pTipoOP);
    cadcolaborador.abrebase(vDadosIni.vCodUsuario);
    vCondPag.abreCondPag;
  end;
end;

procedure Tcotacao.marcaDesmarcaLinha(dtset: TClientDataSet);
begin
if dtset.IsEmpty then
   exit;

  dtset.Edit;
  if dtset.FieldByName('SEL').AsString = 'S' then
    dtset.FieldByName('SEL').AsString := ''
  else
    dtset.FieldByName('SEL').AsString := 'S';
  dtset.Post;
end;

function Tcotacao.MontacotacaoVenda(vclasses: string;vtipat: string;vtipsugest: string;vlb: TLabel;vprogresso: TProgressBar;vtipovenda: string): boolean;
var
 vflg: integer;
 vvalop,vvalfat: real;
 vtpdep: string;
 vnomevalorvenda: string;
 vadic: string;
begin
 if vqtdediasmes <= 0 then
 begin
   Application.MessageBox('Qtde de Dias para o Mês não informada!', 'Confirmação', MB_OK);
    result:=false;
    exit
 end;
 montardatas;
 cadCotacaoItens.cadprodutos.vdat1:=vdat1;
 cadCotacaoItens.cadprodutos.vdat2:=vdat2;
 cadCotacaoItens.cadprodutos.vmesap:=vmesinf;
 cadCotacaoItens.cadprodutos.vanoap:=vanoinf;
 buscas.Close;
 buscas.sql.text:='select CODDEPPRODUTOS,CODDEPOFICINA,CODDEPVEICULOS,CODDEPVEICULOSUS from '+
 'empresa where cod_empresa = '+vDadosIni.codEmpresa;
 buscas.Open;
 if vfatcot < vpequilcot then
    vvalfat:=vpequilcot
 else
 begin
//  if vfatdesc <> 0 then
//    vvalfat:=vfatcot/(1-(vfatdesc/100))
//  else
   vvalfat:=vfatcot;
 end;

 if buscas.FieldByName('CODDEPPRODUTOS').AsInteger = strtoint(vtipcot) then
 begin
   vtipcot:='1';
   vtpdep:=buscas.FieldByName('CODDEPPRODUTOS').AsString;
 end
 else
  if buscas.FieldByName('CODDEPOFICINA').AsInteger = strtoint(vtipcot) then
  begin
    vtpdep:=buscas.FieldByName('CODDEPOFICINA').AsString;
    vtipcot:='2';
  end
  else
   if buscas.FieldByName('CODDEPVEICULOS').AsInteger = strtoint(vtipcot) then
   begin
    vtpdep:=buscas.FieldByName('CODDEPVEICULOS').AsString;
    vtipcot:='3';
   end
   else
   if buscas.FieldByName('CODDEPVEICULOSUS').AsInteger = strtoint(vtipcot) then
   begin
     vtpdep:=buscas.FieldByName('CODDEPVEICULOSUS').AsString;
     vtipcot:='4';
   end
   else
   begin
    vtipcot:='1';
    vtpdep:='99';
   end;
// COLOCAR AQUI TAMBÉM O CNH QUANDO FOR NECESSÁRIO...
 vlb.Caption:='Aguarde Abrindo Tabelas...';
 buscas.close;
 if vtipovenda = 'A' then
  vnomevalorvenda:='PREC_PUBLICO'
 else
  vnomevalorvenda:='PREC_TAB_PROD';
// if cadCotacaoItens.cadprodutos.vperctivendageral[0,1] = '0' then
//  cadCotacaoItens.cadprodutos.verificarPartVenda(vtipovenda,1)
// else
 cadCotacaoItens.cadprodutos.verificarPartVenda(vtipovenda,2);
 vvalfat:=vvalfat*cadCotacaoItens.cadprodutos.vperctipovenda;
 if vtipcot = '1' then
 begin
  if vtipovenda = 'A' then
   vadic:=' AND PREC_PUBLICO <> 0 AND (NOT PREC_PUBLICO IS NULL) '
  else
   vadic:='';
// if cadCotacaoItens.cadprodutos.vvalest = 0  then
// begin
  if vtipat = 'R' then
    cadCotacaoItens.cadprodutos.montaSelect('SELECT sum(((pr.dmd*'+
    vDadosIni.trocaVirgulaPorPonto(FloatToStr(cadCotacaoItens.cadprodutos.vperctipoqtde))+')*'+inttostr(vqtdediasmes)+
   ')*'+vnomevalorvenda+') as valorest FROM produtos pr '+
   'where '+
   '((select count(*) from pedvenda p,pedvenda_prod pp where pp.grupo_prod = pr.grupo_prod '+
   ' and pp.cod_prod = pr.cod_prod and pp.cod_empresa = pr.cod_empresa and  pp.nped = p.nped and pp.tipo = p.tipo '+
   'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
   'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
   ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
   ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
   '(p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
   'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+
   vtipovenda+''' and p.ativo = 1) > 0 or '+
   'est_f > 0 ) '+vadic+' and pr.cod_empresa = '+vDadosIni.codEmpresa+' and (pr.classe_prod in ('+vclasses+
   ')) and (pr.consumo is null or pr.consumo <> ''S'') union '+
   'select sum(case when (gr.valorpme = 0 or gr.valorpme is null) then 0 else (((pr.est_f/gr.valorpme)*'+vDadosIni.trocaVirgulaPorPonto(FloatToStr(cadCotacaoItens.cadprodutos.vperctipoqtde))+')*'+
   inttostr(vqtdediasmes)+')*'+vnomevalorvenda+' end) from produtos pr, grupos gr ' +
   'where pr.grupo_prod = gr.codigo_grup and pr.clatl = ''R'' and pr.est_f > 0 '+vadic+' and (pr.consumo is null or pr.consumo <> ''S'')')
  else
   cadCotacaoItens.cadprodutos.montaSelect('SELECT sum(((pr.dmd*'+
    vDadosIni.trocaVirgulaPorPonto(FloatToStr(cadCotacaoItens.cadprodutos.vperctipoqtde))+')*'+inttostr(vqtdediasmes)+
   ')*'+vnomevalorvenda+') as valorest FROM produtos pr '+
   'where '+
   '((select count(*) from pedvenda p,pedvenda_prod pp where pp.grupo_prod = pr.grupo_prod '+
   ' and pp.cod_prod = pr.cod_prod and pp.cod_empresa = pr.cod_empresa and  pp.nped = p.nped and pp.tipo = p.tipo '+
   'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
   'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
   ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
   ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
   '(p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
   'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+
   vtipovenda+''' and p.ativo = 1) > 0 or '+
   'est_f > 0 ) '+vadic+' and pr.cod_empresa = '+vDadosIni.codEmpresa+' and (pr.classe_prod in ('+vclasses+
   ')) and (pr.consumo is null or pr.consumo <> ''S'')');
  cadCotacaoItens.cadprodutos.vvalest:=0;
  while not cadCotacaoItens.cadprodutos.Eof do
  begin
   cadCotacaoItens.cadprodutos.vvalest:=cadCotacaoItens.cadprodutos.vvalest+cadCotacaoItens.cadprodutos.dataset.FieldByName('valorest').AsFloat;
   cadCotacaoItens.cadprodutos.next;
  end;
// end;
 if vtipat = 'R' then
  cadCotacaoItens.cadprodutos.montaSelect('SELECT pr.* FROM produtos pr '+
   'where '+
   '((select count(*) from pedvenda p,pedvenda_prod pp where pp.grupo_prod = pr.grupo_prod '+
   ' and pp.cod_prod = pr.cod_prod and pp.cod_empresa = pr.cod_empresa and  pp.nped = p.nped and pp.tipo = p.tipo '+
   'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
   'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
   ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
   ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
   '(p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
   'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+
   vtipovenda+''' and p.ativo = 1) > 0 or '+
   'est_f > 0 ) '+vadic+' and pr.cod_empresa = '+vDadosIni.codEmpresa+' and (pr.classe_prod in ('+vclasses+
   ')) and (pr.consumo is null or pr.consumo <> ''S'') union '+
   'select pr.* from produtos pr, grupos gr ' +
   'where pr.grupo_prod = gr.codigo_grup and pr.clatl = ''R'' and pr.est_f > 0 '+vadic+' and (pr.consumo is null or pr.consumo <> ''S'')')

{  cadCotacaoItens.cadprodutos.montaSelect('SELECT * FROM produtos '+
  'where est_f > 0 and cod_empresa = '+vDadosIni.codEmpresa+' and (classe_prod in ('+vclasses+
  ') or clatl  = ''R'') and (consumo is null or consumo <> ''S'')')}
 else
  cadCotacaoItens.cadprodutos.montaSelect('SELECT * FROM produtos pr '+
   'where '+
   '((select count(*) from pedvenda p,pedvenda_prod pp where pp.grupo_prod = pr.grupo_prod '+
   ' and pp.cod_prod = pr.cod_prod and pp.cod_empresa = pr.cod_empresa and  pp.nped = p.nped and pp.tipo = p.tipo '+
   'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
   'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
   ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
   ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
   '(p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
   'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+
   vtipovenda+''' and p.ativo = 1) > 0 or '+
   'est_f > 0 ) '+vadic+' and pr.cod_empresa = '+vDadosIni.codEmpresa+' and (pr.classe_prod in ('+vclasses+
   ')) and (pr.consumo is null or pr.consumo <> ''S'')');
{  cadCotacaoItens.cadprodutos.montaSelect('SELECT * FROM produtos '+
  'where est_f > 0 and cod_empresa = '+vDadosIni.codEmpresa+' and classe_prod in ('+vclasses+
  ') and (consumo is null or consumo <> ''S'') ');}
 end;
 try
 IniciaTransacao;
 vflg:=0;
 if vnovaCotacao = 'S' then
 begin
  dataSet.Append;
  dataSet.FieldByName('COD_COTACAO').AsInteger:=Gencodigo('COTACAO',dtmGestorHw.SpIncCodigo,vDadosIni.codEmpresa);
  dataSet.FieldByName('TIPOOP').AsString:='VENDA';
  dataSet.FieldByName('COD_EMPRESA').AsString:=vDadosIni.codEmpresa;
  dataset.FieldByName('DATA_COTACAO').AsDateTime:=vDadosIni.getDataBanco(buscas);
  dataSet.FieldByName('COD_VENDEDOR').AsInteger:=vDadosIni.vCodUsuario;
  dataSet.FieldByName('HORA').AsDateTime:=Time;
  dataSet.FieldByName('FATURAMENTO').AsCurrency:=vfatcot;
  dataSet.FieldByName('CF').AsCurrency:=vcfcot;
  dataSet.FieldByName('CMV').AsCurrency:=vcmvcot;
  dataSet.FieldByName('OCV').AsCurrency:=vocvcot;
  dataSet.FieldByName('LUCRO').AsCurrency:=vlucrocot;
  dataSet.FieldByName('PE').AsCurrency:=vpequilcot;
  dataSet.FieldByName('TIPODEP').asstring:='PRODUTOS';
//  vtpdep;
  dataSet.Post;
  dataSet.ApplyUpdates(-1);
  vnovaCotacao:='N';
 end;
 cadCotacaoItens.abrecotacaoitens(dataset.FieldByName('COD_COTACAO').AsInteger,dataSet.FieldByName('TIPOOP').AsString);
 vprogresso.Min:=0;
 vprogresso.Max:=cadCotacaoItens.cadprodutos.dataSet.RecordCount;
 vprogresso.Position:=0;
 vlb.Caption:='Tipo Venda = '+vtipovenda+' - '+vDadosIni.StrZero(vprogresso.Min+1,6);
 while not cadCotacaoItens.cadprodutos.Eof do
 begin
   vlb.Caption:='Tipo Venda = '+vtipovenda+' - '+vDadosIni.StrZero(vprogresso.position+1,6)+' - '+cadCotacaoItens.cadprodutos.dataSet.FieldByName('NUM_FAB_PROD').AsString;
   Application.ProcessMessages;
   if not cadCotacaoItens.cadprodutos.verificarVendaproduto(vclasses,vqtdediasmes,vtipat,vtipcot,vtipovenda) then
   begin
 //    vflg:=1;
//     break
   end
   else
   begin
    cadCotacaoItens.Insert;
    cadCotacaoItens.dataSet.FieldByName('COD_COTACAO').AsInteger:=dataSet.FieldByName('COD_COTACAO').AsInteger;
    cadCotacaoItens.dataSet.FieldByName('TIPOOP').AsString:=dataSet.FieldByName('TIPOOP').AsString;
    cadCotacaoItens.dataSet.FieldByName('COD_EMPRESA').AsString:=vDadosIni.codEmpresa;
    cadCotacaoItens.dataSet.fieldbyname('CODSEQ_ITEM').AsInteger:=vnitem;
    cadCotacaoItens.dataSet.FieldByName('TIPODEP').AsString:=vtpdep;
//    vnomedep;
    cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger:=strtoint(cadCotacaoItens.cadprodutos.vgrprod);
    cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString:=cadCotacaoItens.cadprodutos.vcodprod;
    cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString:=cadCotacaoItens.cadprodutos.vnum_fab;
    cadCotacaoItens.dataSet.FieldByName('DESCR_PROD').AsString:=cadCotacaoItens.cadprodutos.vdescprod;
    cadCotacaoItens.dataSet.FieldByName('CURVA').AsString:=cadCotacaoItens.
    cadprodutos.dataSet.FieldByName('CLASSE_PROD').AsString;
    cadCotacaoItens.dataSet.FieldByName('qtde_vendida').AsFloat:=cadCotacaoItens.cadprodutos.qtdevend;
    cadCotacaoItens.dataSet.FieldByName('VALOR_MEDIO_VENDA').AsFloat:=
    cadCotacaoItens.cadprodutos.vvalvend-cadCotacaoItens.cadprodutos.vdescprat;
    {if (trim(cadCotacaoItens.cadprodutos.dataSet.FieldByName('UNIDADE').AsString) = 'PC')
    or (trim(cadCotacaoItens.cadprodutos.dataSet.FieldByName('UNIDADE').AsString) = 'UN') then
    begin
      cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency:=(cadCotacaoItens.cadprodutos.vpercvenda*vvalfat);
      if cadCotacaoItens.cadprodutos.dataSet.FieldByName(vnomevalorvenda).AsCurrency = 0 then
         vvalop:=1
      else
       vvalop:=cadCotacaoItens.cadprodutos.dataSet.FieldByName(vnomevalorvenda).AsCurrency;

      cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency:=
      Ceil((cadCotacaoItens.cadprodutos.vpercvenda*vvalfat)/vvalop);
      cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency:=
      cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency*vvalop;
    end
    else
    begin}
      cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency:=(cadCotacaoItens.cadprodutos.vpercvenda*vvalfat);
      if cadCotacaoItens.cadprodutos.dataSet.FieldByName(vnomevalorvenda).AsCurrency = 0 then
         vvalop:=1
      else
       vvalop:=cadCotacaoItens.cadprodutos.dataSet.FieldByName(vnomevalorvenda).AsCurrency;

      cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency:=
      (cadCotacaoItens.cadprodutos.vpercvenda*vvalfat)/vvalop;
//    end;
    cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsCurrency:=
    cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency*
    cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_CUSM_PROD').AsCurrency;
    cadCotacaoItens.dataSet.FieldByName('CUSTO_VARIAVEL').AsCurrency:=(vocvcot*
    cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency);
    if cadCotacaoItens.cadprodutos.vvalvend <> 0 then
     cadCotacaoItens.dataSet.FieldByName('PERC_DESC').AsCurrency:=
     ((cadCotacaoItens.cadprodutos.vdescprat/cadCotacaoItens.cadprodutos.vvalvend)*100)
    else
     cadCotacaoItens.dataSet.FieldByName('PERC_DESC').AsCurrency:=0;

    cadCotacaoItens.dataSet.FieldByName('DESCONTO_VALOR').AsCurrency:=cadCotacaoItens.cadprodutos.vdescprat;
    if cadCotacaoItens.cadprodutos.vcustvend = 0 then
     vvalop:=1
    else
     vvalop:=cadCotacaoItens.cadprodutos.vcustvend;

    cadCotacaoItens.dataSet.FieldByName('MARKUP_PRATICADO').AsCurrency:=
    cadCotacaoItens.dataSet.FieldByName('VALOR_MEDIO_VENDA').AsFloat/
    vvalop;
    if cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsCurrency = 0 then
     vvalop:=1
    else
     vvalop:=cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsCurrency;
    cadCotacaoItens.dataSet.FieldByName('MARKUP_SIMULADO').AsCurrency:=cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency/
    vvalop;
    cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_DIARIA').AsCurrency:=
    (cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency/vqtdediasmes);
    cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_DIARIA').AsCurrency:=
    cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency/vqtdediasmes;
    cadCotacaoItens.dataSet.FieldByName('CLASS_FREQ').AsString:=
    cadCotacaoItens.cadprodutos.dataSet.FieldByName('CLFRV').AsString;
    cadCotacaoItens.dataSet.FieldByName('CLASS_AT').AsString:=
    cadCotacaoItens.cadprodutos.dataSet.FieldByName('CLATL').AsString;
    cadCotacaoItens.dataSet.FieldByName('PME').AsFloat:=cadCotacaoItens.cadprodutos.vpme;
    // Qtde de Venda Possível pelo giro...
    cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat:=
    cadCotacaoItens.cadprodutos.vqtdegiromes*cadCotacaoItens.cadprodutos.vperctipoqtde;
    // Valor de Venda Possível pelo giro...
    IF vfatdesc <> 0 then
     cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_PMEMES').AsFloat:=
     cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat*
     (cadCotacaoItens.cadprodutos.dataSet.FieldByName(vnomevalorvenda).AsCurrency-
     (cadCotacaoItens.cadprodutos.dataSet.FieldByName(vnomevalorvenda).AsCurrency*(vfatdesc/100)))
    else
    cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_PMEMES').AsFloat:=
     cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat*
     cadCotacaoItens.cadprodutos.dataSet.FieldByName(vnomevalorvenda).AsCurrency;
    cadCotacaoItens.dataSet.FieldByName('ESTOQUE').AsFloat:=
    cadCotacaoItens.cadprodutos.dataSet.FieldByName('EST_F').AsFloat;
    cadCotacaoItens.dataSet.FieldByName('ESTOQUE_DISP').AsFloat:=
    cadCotacaoItens.cadprodutos.vestreal;
    cadCotacaoItens.dataSet.FieldByName('TIPVENDA').AsString:=vtipovenda;
    cadCotacaoItens.dataSet.FieldByName('CMV_VENDIDA').AsCurrency:=cadCotacaoItens.cadprodutos.vcustvend;
    cadCotacaoItens.Post;
    cadCotacaoItens.Apply;
   end;
   cadCotacaoItens.cadprodutos.next;
   vprogresso.Position:=vprogresso.Position+1;
   vnitem:=vnitem+1;
 end;
 if vflg = 0 then
 begin
  CommitaTransacao;
  Result:=true;
 end
 else
 begin
  RollBackTransacao;
  Result:=false;
 end;
 except
  on E: Exception do
  begin
    RollBackTransacao;
    Application.MessageBox(Pchar('GEST001 '+e.Message), 'Confirmação', MB_OK);
    registraErro('GEST001 ' + e.Message);
    Result := False;
  end;
 end;
end;

function Tcotacao.montardatas: boolean;
begin
 vdat1:=StrToDate('01/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
 vdat2:=strtodate(inttostr(vDadosIni.UltimoDia(StrToDate('01/'+inttostr(vmesinf)+'/'+
 IntToStr(vanoinf))))+'/'+inttostr(vmesinf)+'/'+IntToStr(vanoinf));
 cadCotacaoItens.cadprodutos.vdat1:=vdat1;
 cadCotacaoItens.cadprodutos.vdat2:=vdat2;
end;

function Tcotacao.pesquisarListaCotacao: Boolean;
var
  vSqlTmp: string;
  vCod: Integer;
begin

  if (_dtIni <> '  /  /    ') and (_dtFim <> '  /  /    ') then
    vSqlTmp := vSqlTmp + ' and DATA >= :dataIni and DATA <= :dataFim';

  if (_dtIni <> '  /  /    ') and (_dtFim = '  /  /    ') then
    vSqlTmp := vSqlTmp + ' and DATA >= :dataIni';

  if (_dtIni = '  /  /    ') and (_dtFim <> '  /  /    ') then
    vSqlTmp := vSqlTmp + ' and DATA <= :dataFim';

  if Trim(_descricao) <> '' then
    vSqlTmp := vSqlTmp + ' and DESCRICAO_LISTA LIKE ''%' + Trim(_descricao) + '%''';

  if _codLista > 0 then
    vSqlTmp := vSqlTmp + ' and COD_LISTA =  ' + IntToStr(_codLista) +'';


  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM LISTA_COTACAO' +
    ' WHERE ATIVO = 1 AND COD_EMPRESA = ' + vDadosIni.codEmpresa + vSqlTmp;

  if (_dtIni <> '  /  /    ') and (_dtFim <> '  /  /    ') then
  begin
    buscas.Params[0].AsDate := StrToDate(_dtIni);
    buscas.Params[1].AsDate := StrToDate(_dtFim);
  end;

  if (_dtIni <> '  /  /    ') and (_dtFim = '  /  /    ') then
    buscas.Params[0].AsDate := StrToDate(_dtIni);

  if (_dtIni = '  /  /    ') and (_dtFim <> '  /  /    ') then
    buscas.Params[0].AsDate := StrToDate(_dtFim);

  buscas.Open;

  fTempListaCotacao.EmptyDataSet;

  buscas.First;
  pCodLista := buscas.FieldByName('COD_LISTA').AsInteger;
  while not buscas.Eof do
  begin
    fTempListaCotacao.Insert;
    fTempListaCotacao.FieldByName('COD_LISTA').AsInteger := buscas.FieldByName('COD_LISTA').AsInteger;
    fTempListaCotacao.FieldByName('DESCRICAO_LISTA').AsString := buscas.FieldByName('DESCRICAO_LISTA').AsString;
    fTempListaCotacao.FieldByName('OBS').AsString := buscas.FieldByName('OBS').AsString;
    fTempListaCotacao.Post;
    buscas.Next;
  end;


  if buscas.IsEmpty then
  begin
    vCod := fTempListaCotacao.FieldByName('COD_LISTA').AsInteger;

    buscas.Close;
    buscas.SQL.Text := ' SELECT GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA AS COD_EMP_MULT, COD_EMPRESA, ' +
  		' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED FROM LISTA_COTACAO_ITENS ' +
  		' WHERE COD_LISTA = ' +IntToStr(vCod) +
    	' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
    	' UNION ALL ' +
    	' SELECT GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMP_MULT, COD_EMPRESA, ' +
  		' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED FROM LISTA_COTACAO_ITENS2 ' +
  		' WHERE COD_LISTA = ' +IntToStr(vCod) +
    	' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      vDadosIni.IfThen(not vDadosIni.vSugCompra.vMultiempresa, ' AND COD_EMP_MULT = ' + vDadosIni.codEmpresa, '') +
    	' ORDER BY 1, 2, 3, 4, 5 ';
    buscas.Open;

    fTempListaCotacaoItens.EmptyDataSet;
    buscas.First;
    while not buscas.Eof do
    begin
      fTempListaCotacaoItens.Insert;
      fTempListaCotacaoItens.FieldByName('SEL').AsString := '';
      fTempListaCotacaoItens.FieldByName('GRUPO_PROD').AsString := buscas.FieldByName('GRUPO_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('COD_PROD').AsString := buscas.FieldByName('COD_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('COD_GRADE').AsInteger := buscas.FieldByName('COD_GRADE').AsInteger;
      fTempListaCotacaoItens.FieldByName('COD_EMP_MULT').AsInteger := buscas.FieldByName('COD_EMP_MULT').AsInteger;
      fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('DESCR_PROD').AsString := buscas.FieldByName('DESCR_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('QUANT_PROD').AsFloat := buscas.FieldByName('QUANT_PROD').AsFloat;
      fTempListaCotacaoItens.FieldByName('NUM_PED').AsInteger := buscas.FieldByName('NUM_PED').AsInteger;
      fTempListaCotacaoItens.Post;
      buscas.Next;
    end;
  end;
  fTempListaCotacaoItens.IndexFieldNames := 'GRUPO_PROD;COD_PROD;COD_GRADE;COD_EMP_MULT';
  fTempListaCotacaoItens.First;

  _dtIni := '  /  /    ';
  _dtFim := '  /  /    ';
  _descricao := '';
  _codLista := 0;
  pCodLista := 0;
end;

function Tcotacao.buscarListaCotacao(cod: Integer): Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM LISTA_COTACAO' +
   ' WHERE ATIVO = 1 AND COD_LISTA = ' + IntToStr(cod)+
   ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas.Open;

  fTempListaCotacao.EmptyDataSet;
  fTempListaCotacaoItens.EmptyDataSet;
  if not buscas.IsEmpty then
  begin
    fTempListaCotacao.Insert;
    fTempListaCotacao.FieldByName('COD_LISTA').AsInteger := buscas.FieldByName('COD_LISTA').AsInteger;
    fTempListaCotacao.FieldByName('DESCRICAO_LISTA').AsString := buscas.FieldByName('DESCRICAO_LISTA').AsString;
    fTempListaCotacao.FieldByName('OBS').AsString := buscas.FieldByName('OBS').AsString;
    fTempListaCotacao.Post;

    buscas.Close;
    buscas.SQL.Text := ' SELECT COD_LISTA, GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA, COD_EMPRESA AS COD_EMP_MULT, ' +
    	' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED, COD_COTACAO FROM LISTA_COTACAO_ITENS ' +
      ' WHERE COD_LISTA = ' + IntToStr(cod) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' UNION ALL ' +
      ' SELECT COD_LISTA, GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA, COD_EMP_MULT, ' +
    	' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED, COD_COTACAO FROM LISTA_COTACAO_ITENS2 ' +
      ' WHERE COD_LISTA = ' + IntToStr(cod) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    fTempListaCotacaoItens.EmptyDataSet;
    buscas.First;
    while not buscas.Eof do
    begin
      fTempListaCotacaoItens.Insert;
      fTempListaCotacaoItens.FieldByName('SEL').AsString := '';
      fTempListaCotacaoItens.FieldByName('GRUPO_PROD').AsString := buscas.FieldByName('GRUPO_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('COD_PROD').AsString := buscas.FieldByName('COD_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('COD_GRADE').AsInteger := buscas.FieldByName('COD_GRADE').AsInteger;
      fTempListaCotacaoItens.FieldByName('COD_EMP_MULT').AsInteger := buscas.FieldByName('COD_EMP_MULT').AsInteger;
      fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('DESCR_PROD').AsString := buscas.FieldByName('DESCR_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('QUANT_PROD').AsFloat := buscas.FieldByName('QUANT_PROD').AsFloat;
      fTempListaCotacaoItens.FieldByName('NUM_PED').AsInteger := buscas.FieldByName('NUM_PED').AsInteger;
      fTempListaCotacaoItens.Post;
      
      buscas.Next;
    end;
  end;
end;

function Tcotacao.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if not checarCamposObrigatorios then
    	exit;
      
    if dataSet.State in [dsInsert] then
    begin
      dataSet.FieldByName('cod_cotacao').AsInteger :=Gencodigo('COTACAO', DtmGestorHw.SpIncCodigo, vDadosIni.codEmpresa);
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      colocasequenciaitens;
      alterarNcotacaoItens;
    end;

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      if cadCotacaoItens.dataSet.ChangeCount > 0 then
      begin
        if cadCotacaoItens.Apply then
        begin

         if CommitaTransacao then
           vDadosIni.GravaAuditoria('COL001', 'SALVAR', 'TRANSACAO CONFIRMADA' +
            dataSet.FieldByName('COD_COTACAO').AsString, 'COTACAO', dataSet.FieldByName('COD_COTACAO').AsString,  buscas);
        end;
      end;
      Result := true;
      exit;
    end;

    if Apply then
    begin
      if cadCotacaoItens.Apply then
      begin
       if CommitaTransacao then
         vDadosIni.GravaAuditoria('COL001', 'SALVAR', 'TRANSACAO CONFIRMADA' +
          dataSet.FieldByName('COD_COTACAO').AsString, 'COTACAO', dataSet.FieldByName('COD_COTACAO').AsString,  buscas);
      end;
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('COL001', 'SALVAR', 'TRANSACAO NAO CONFIRMADA' +
        dataSet.FieldByName('COD_COTACAO').AsString, 'COTACAO', dataSet.FieldByName('COD_COTACAO').AsString,  buscas);
      Result := FALSE;
    end;
    Refresh;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function Tcotacao.Preenchcampos: boolean;
begin
 if dataSet.State = dsInsert then
 begin
   dataSet.FieldByName('DATA_COTACAO').AsDateTime:=vDadosIni.getDataBanco(buscas);
   dataSet.FieldByName('HORA').AsDateTime:=Time;
   dataSet.FieldByName('FATURAMENTO').AsFloat:=vfatapura;
   dataSet.FieldByName('CF').AsCurrency:=VCF;
   dataSet.FieldByName('CMV').AsCurrency:=VCMV;
   dataSet.FieldByName('OCV').AsCurrency:=VOCV;
   dataSet.FieldByName('LUCRO').AsCurrency:=vfatapura-VCF-((VCMV/100)*vfatapura)-((VOCV/100)*vfatapura);
   dataSet.FieldByName('MESAPURACAO').AsInteger:=vmesap;
   dataSet.FieldByName('ANOAPURACAO').AsInteger:=vanoap;
   vlucrocot:=dataSet.FieldByName('LUCRO').AsCurrency;
   vcfcot:=VCF;
   vcmvcot:=VCMV;
   vocvcot:=VOCV;
//   vpequilcot:=
   vfatcot:=vfatapura;
//   vfatdesc: real;
 end;
end;

function Tcotacao.ProdExisteNaListaCotacao(cod: Integer = 0): Boolean;
var
 buscas2: TIBQuery;
begin
  Result := true;
  buscas2 := TIBQuery(DtmGestorHw.QrBuscas2);

  fTempListaCotacao.EmptyDataSet;
  fTempListaCotacaoItens.EmptyDataSet;

  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM LISTA_COTACAO' +
    ' WHERE ATIVO = 1 AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND COD_LISTA = ' + IntToStr(cod);
  buscas.Open;

  if buscas.RecordCount > 0 then
  begin
    fTempListaCotacao.Insert;
    fTempListaCotacao.FieldByName('COD_LISTA').AsInteger := buscas.FieldByName('COD_LISTA').AsInteger;
    fTempListaCotacao.FieldByName('DESCRICAO_LISTA').AsString := buscas.FieldByName('DESCRICAO_LISTA').AsString;
    fTempListaCotacao.FieldByName('OBS').AsString := buscas.FieldByName('OBS').AsString;
    fTempListaCotacao.Post;
  end;

  buscas2.Close;
  buscas2.SQL.Text := 'SELECT * FROM LISTA_COTACAO_ITENS' +
   ' WHERE COD_LISTA = ' +IntToStr(cod) +
   ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas2.Open;

  buscas2.First;
  if buscas.RecordCount > 0 then
    while not buscas2.Eof do
    begin
      fTempListaCotacaoItens.Insert;
      fTempListaCotacaoItens.FieldByName('SEL').AsString := '';
      fTempListaCotacaoItens.FieldByName('GRUPO_PROD').AsString := buscas2.FieldByName('GRUPO_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('COD_PROD').AsString := buscas2.FieldByName('COD_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('COD_GRADE').AsInteger := buscas2.FieldByName('COD_GRADE').AsInteger;
      fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString := buscas2.FieldByName('NUM_FAB_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('DESCR_PROD').AsString := buscas2.FieldByName('DESCR_PROD').AsString;
      fTempListaCotacaoItens.FieldByName('QUANT_PROD').AsFloat := buscas2.FieldByName('QUANT_PROD').AsFloat;
      fTempListaCotacaoItens.FieldByName('NUM_PED').AsInteger := buscas2.FieldByName('NUM_PED').AsInteger;
      fTempListaCotacaoItens.Post;
      buscas2.Next;
    end;
  buscas2.First;

  cadCotacaoItens.First;
  fTempListaCotacaoItens.RecordCount;
  while not cadCotacaoItens.Eof do
  begin
    fTempListaCotacaoItens.Filtered := False;
    fTempListaCotacaoItens.Filter := ' grupo_prod = ' + cadCotacaoItens.dataSet.FieldByName('GRUPO').AsString +' and cod_prod = '+QuotedStr(trim(cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString))+'';
    fTempListaCotacaoItens.Filtered := True;

    if not ((cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger = fTempListaCotacaoItens.FieldByName('GRUPO_PROD').AsInteger) and
      (trim(cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString) = trim(fTempListaCotacaoItens.FieldByName('COD_PROD').AsString))) then
      begin
        fTempListaCotacaoItens.Filtered := False;
        Result := false;
        Application.MessageBox(PChar('Item Nº ! ' + cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsString + ' não encontrado na lista, favor remover para informar o código da lista de cotação!'), 'Confirmação', MB_OK);
        break;
      end;
    cadCotacaoItens.Next;
  end;
  fTempListaCotacaoItens.Filtered := False;
  
end;

function Tcotacao.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql('select * from COTACAO where ativo=0 or ativo is null ' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa)
end;

function Tcotacao.vercodigodep(vcampo: string): integer;
begin
if vcampo = '99' then
 result:=99
else
begin
 buscas.close;
 buscas.SQL.text:='select * from empresa where cod_empresa = '+vDadosIni.codEmpresa;
 buscas.Open;
 Result:=buscas.FieldByName(vcampo).AsInteger;
 buscas.Close;
end;
end;

function Tcotacao.VerificaCustosFixos(vlb: TLabel;
  vprogresso: TProgressBar): boolean;
var
 vvalop,vvalfatg: real;
begin
buscas.Close;
buscas.SQL.Text:='select sum(valor_venda_sim) as valortotal from cotacao_itens where cod_cotacao = '+dataset.FieldByName('COD_COTACAO').AsString+
' and tipoop = '''+dataSet.FieldByName('TIPOOP').AsString+''' and cod_empresa = '+vDadosIni.codEmpresa;
buscas.Open;
vvalfatg:=buscas.fieldbyname('valortotal').ascurrency;
try
 IniciaTransacao;
 cadCotacaoItens.abrecotacaoitens(dataset.FieldByName('COD_COTACAO').AsInteger,dataSet.FieldByName('TIPOOP').AsString);
 vprogresso.Min:=0;
 vprogresso.Max:=cadCotacaoItens.dataSet.RecordCount;
 vprogresso.Position:=0;
 while not cadCotacaoItens.Eof do
 begin
   vlb.Caption:='Definindo Custos/Lucros do Tipo Venda = '+cadCotacaoItens.dataSet.FieldByName('TIPVENDA').AsString+' - '+vDadosIni.StrZero(vprogresso.position+1,6)+' - '+cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString;
   Application.ProcessMessages;
   if cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency <> 0 then
   begin
     cadCotacaoItens.edit;
     VCFprod:=((cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency/vvalfatg)*vcfcot);
     if cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency <> 0 then
      VCFprod:=VCFprod/cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency
     else
      VCFprod:=0;
     if (cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency/cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency) = 0 then
         vvalop:=1
      else
       vvalop:=(cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency/cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency);

      cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsCurrency:=VCFprod*
      cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency;
      vvalop:=(((cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency/cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency)-
      ((cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsCurrency/cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency)+
      ((cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency/cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency)*vocvcot))));
      if vvalop <> 0  then
       cadCotacaoItens.dataSet.FieldByName('QTDE_EQUILIBRIO').AsCurrency:=
       (VCFprod*cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency)/vvalop
      else
       cadCotacaoItens.dataSet.FieldByName('QTDE_EQUILIBRIO').AsCurrency:=0;


      cadCotacaoItens.dataSet.FieldByName('VALOR_EQUILIBRIO').AsCurrency:=
      cadCotacaoItens.dataSet.FieldByName('QTDE_EQUILIBRIO').AsCurrency*
      (cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency/cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsCurrency);

      cadCotacaoItens.dataSet.FieldByName('LUCRO_APURADO').AsCurrency:=
      cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency-
      cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsCurrency-
      cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsCurrency-
      cadCotacaoItens.dataSet.FieldByName('CUSTO_VARIAVEL').AsCurrency;

      if cadCotacaoItens.dataSet.FieldByName('VALOR_MEDIO_VENDA').AsCurrency <> 0 then
       cadCotacaoItens.dataSet.FieldByName('MARGEM_PRATICADA').AsCurrency:=
       ((cadCotacaoItens.dataSet.FieldByName('VALOR_MEDIO_VENDA').AsCurrency-
       cadCotacaoItens.dataSet.FieldByName('CMV_VENDIDA').AsCurrency-
       cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsCurrency-
       (vocvcot*cadCotacaoItens.dataSet.FieldByName('VALOR_MEDIO_VENDA').AsCurrency))/
       cadCotacaoItens.dataSet.FieldByName('VALOR_MEDIO_VENDA').AsCurrency)*100
      else
       cadCotacaoItens.dataSet.FieldByName('MARGEM_PRATICADA').AsCurrency:=0;

      if cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency <> 0 then
       cadCotacaoItens.dataSet.FieldByName('MARGEM_SIMULADA').AsCurrency:=
       (cadCotacaoItens.dataSet.FieldByName('LUCRO_APURADO').AsCurrency/
       cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsCurrency)*100
      else
       cadCotacaoItens.dataSet.FieldByName('MARGEM_SIMULADA').AsCurrency:=0;
     cadCotacaoItens.Post;
     cadCotacaoItens.Apply;
   end;
   cadCotacaoItens.next;
   vprogresso.Position:=vprogresso.Position+1;
 end;
 CommitaTransacao;
 Result:=true;
except
  on E: Exception do
  begin
    RollBackTransacao;
    Application.MessageBox(Pchar('GEST001 '+e.Message), 'Confirmação', MB_OK);
    registraErro('GEST001 ' + e.Message);
    Result := False;
  end;
end;
end;

procedure Tcotacao._desmarcarTodos(dtset: TClientDataSet);
begin
	try
  	dtset.DisableControls;
    dtset.First;
    while not dtset.Eof do
    begin
      dtset.Edit;
      dtset.FieldByName('sel').AsString := '';
      dtset.Post;
      dtset.Next;
    end;
  finally
     dtset.First;
     dtset.EnableControls;
  end;
end;

function Tcotacao._lixeiraCheia: boolean;
begin
	Result := ExecutaComandosSql('select first 1 cod_cotacao from cotacao ' +
  	' where ativo = 0 ' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure Tcotacao._marcarTodos(dtset: TClientDataSet);
begin
	try
  	dtset.DisableControls;
    dtset.First;
    while not dtset.Eof do
    begin
      dtset.Edit;
      dtset.FieldByName('sel').AsString := 'S';
      dtset.Post;
      dtset.Next;
    end;
  finally
  	dtset.First;
    dtset.EnableControls;
  end;
end;

{ TcotacaoItens }

function TcotacaoItens.abrecotacaoitens(vcodacao: integer;vtipop: string): boolean;
begin
 montaSelect('select * from cotacao_itens where cod_cotacao = '+IntToStr(vcodacao)+
 	 ' and tipoop = '''+vtipop+''' and cod_empresa = '+vDadosIni.codEmpresa+' order by CODSEQ_ITEM');
 dataSet.Last;
 vultimoitem:=dataSet.FieldByName('CODSEQ_ITEM').AsInteger;
 dataSet.First;
end;

constructor TcotacaoItens.create;
begin
DataSet := TClientDataSet(DtmGestorHw.CdscotacaoItens);
transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
Buscas := TIBQuery(DtmGestorHw.qrBuscas);
cadprodutos:=TProdutosSugVenda.create;
end;

destructor TcotacaoItens.Destroy;
begin

  inherited;
end;

{ TProdutosSugVenda }

function TProdutosSugVenda.buscaProduto(codBarra: string; grupoProd: Integer = 0; codProd: string = ''): boolean;
begin
{
result := true;
montaSelect('SELECT DISTINCT * FROM PRODUTOS PR,COD_BARRA CDB WHERE CDB.COD_BARRA = '''+codBarra+
''' AND CDB.COD_PROD = PR.COD_PROD AND CDB.GRUPO_PROD = PR.GRUPO_PROD AND '+
'PR.COD_EMPRESA = CDB.COD_EMPRESA AND PR.cod_empresa = ' + vDadosIni.codEmpresa+ ' and PR.ativo=1');
 if dataSet.IsEmpty then
 begin
     Application.MessageBox(PChar('Produto não encontrado no estoque = ' + QuotedStr(codBarra) + '!'), 'Confirmação', MB_OK);
     result := false;
 end;
 }
  Result := True;
  vPequisaPorDescr := false;	
  if (grupoProd > 0) or (trim(codProd) <> '') then
  begin
    montaSelect(' select distinct pr.*, nbm.mva mva_ncm, ' +
    	' coalesce(est.estoque, 0) estoque_disponivel, ' +
	 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos pr ' +
      ' inner join cod_barra cdb ON cdb.cod_prod = pr.cod_prod and cdb.grupo_prod = pr.grupo_prod and pr.cod_empresa = cdb.cod_empresa and pr.ativo = 1 ' +
      ' left join nbm on nbm.cod_ncm = pr.nbm ' +
      ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
      ' where cdb.cod_barra = ' + QuotedStr(codBarra) +
      ' and cdb.grupo_prod = ' + intToStr(grupoProd) +
      ' and cdb.cod_prod = ' + QuotedStr(codProd) +
      ' and cdb.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cdb.ativo=1');
  end
  else
  begin
    montaSelect(' select distinct pr.*, nbm.mva mva_ncm, ' +
      ' coalesce(est.estoque, 0) estoque_disponivel, ' +
	 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos pr' +
      ' inner join cod_barra cdb on cdb.cod_prod = pr.cod_prod and cdb.grupo_prod = pr.grupo_prod and pr.cod_empresa = cdb.cod_empresa and pr.ativo = 1 ' +
      ' left join nbm on nbm.cod_ncm = pr.nbm' +
      ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
      ' where cdb.cod_barra = ' + QuotedStr(codBarra) +
      ' and cdb.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cdb.ativo = 1 ');

    if dataSet.IsEmpty then
    begin
    	montaSelect(' select distinct pr.*, nbm.mva mva_ncm, ' +
        ' coalesce(est.estoque, 0) estoque_disponivel, ' +
		 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos pr ' +
        ' inner join cod_barra cdb on cdb.cod_prod = pr.cod_prod and cdb.grupo_prod = pr.grupo_prod and pr.cod_empresa = cdb.cod_empresa and pr.ativo = 1 ' +
        ' left join nbm on nbm.cod_ncm = pr.nbm ' +
        ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
        ' where pr.descr_prod like ' + QuotedStr(codBarra + '%') +
        ' and pr.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cdb.ativo = 1 ' +
        ' order by pr.descr_prod ');
       if not dataSet.IsEmpty then
       	 vPequisaPorDescr := true; 
    end;
  end;

  if not dataSet.IsEmpty then
    if dataSet.RecordCount > 1 then
    begin
    	TFloatField(dataSet.FieldByName('PREC_TAB_PROD')).currency := True;
      TFloatField(dataSet.FieldByName('PREC_PUBLICO')).currency := True;
      TFloatField(dataSet.FieldByName('PRECO_PROMOCAO')).currency := True;
      TFloatField(dataSet.FieldByName('PREC_30_PROD')).currency := True;
      TFloatField(dataSet.FieldByName('PREC_60_PROD')).currency := True;
      TFloatField(dataSet.FieldByName('PREC_90_PROD')).currency := True;
      TFloatField(dataSet.FieldByName('ESTOQUE_DISPONIVEL')).DisplayFormat := '#,##0.000';
      TFloatField(dataSet.FieldByName('ESTOQUE_PRODUZIR')).DisplayFormat   := '#,##0.000';
      if not vDadosIni._abreFormEscolhaProdutosIni(dataSet) then
      begin
        Result := false;
        exit;
      end;
    end;

  if dataSet.IsEmpty then
  begin
    result := false;
  end;
end;

constructor TProdutosSugVenda.create;
var
 i,x: integer;
begin
vvalest:=0;
vqtdeProd:=0;
vpercvenda:=0;
DataSet := TClientDataSet(DtmGestorHw.cdsProdutos);
transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
Buscas := TIBQuery(DtmGestorHw.qrBuscas);
SetLength(vperctivendageral,6,3);
vperctivendageral[0,0]:='V';
vperctivendageral[1,0]:='A';
vperctivendageral[2,0]:='C';
vperctivendageral[3,0]:='T';
vperctivendageral[4,0]:='L';
vperctivendageral[5,0]:='O';
for i := 0 to 5 do
 for x:=1 to 2 do
  vperctivendageral[i,x]:='0';

end;

destructor TProdutosSugVenda.Destroy;
begin

  inherited;
end;

function TProdutosSugVenda.verificaclassesProduto(
  vchecklist: TCheckListBox): Boolean;
var
 cont,i,j: integer;
begin
  result:=true;
  vclasses := '';
  j := 0;
  cont := 0;
//  SetLength(vclasses, cont);
  cont := 0;
  for i := 0 to vchecklist.Items.Count - 1 do
  begin
     IF (vchecklist.Checked[i] = true) then
     begin
      vclasses:= vclasses + ''''+vchecklist.Items[i]+''''+',';
      cont := cont + 1;
     end;
  end;
  if vclasses <> ''  then
    vclasses:= Copy(vclasses, 1, Length(vclasses) - 1);
end;

function TProdutosSugVenda.verificapendencias(vcodprod: string;
  vgrupoprod: integer): real;
begin
   buscas.close;
   buscas.SQL.text:='select sum(ipv.quant_ped_item) as valor from pedvenda pv' +
   ' inner join pedvenda_prod ipv on ipv.nped = pv.nped' +
   ' and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo and (ipv.status is null or ipv.status = '''')' +
   ' where ipv.cod_prod = '''+vcodprod+''' and ipv.grupo_prod = '+
   IntToStr(vgrupoprod)+' and  pv.tipo <> ''ORC''' +
   ' and (pv.data_fech is null or pv.data_fech < ''01/01/1899'') and pv.cod_empresa = '+
   vDadosIni.codEmpresa +
   ' and pv.ativo = 1';
   buscas.open;
   Result :=buscas.FieldByName('valor').AsFloat;
end;

function TProdutosSugVenda.verificarPartVenda(vtipovenda: string;vacao: integer): boolean;
var
 vvalparcial: real;
 vvalqtdeparcial: real;
 vflag,i,x: integer;
begin
 vflag:=0;
 for I := 0 to 5 do
 begin
  if vperctivendageral[i,1] <> '0' then
    vflag:=1;
 end;
 if vflag = 0 then
   vacao:=1; 
 if vacao = 1 then
 begin
  for I := 0 to 5 do
  begin
    buscas.Close;
    buscas.SQL.text:='select sum(pp.vltot_ped_item) as valorprod,sum(pp.rateio_desc) as descontos,sum(pp.quant_ped_item) as qtde,'+
       'SUM(pp.QUANT_PED_ITEM*pp.PCUST_MC) as custo from pedvenda p,pedvenda_prod pp where pp.nped = p.nped and pp.tipo = p.tipo '+
       'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
       'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
       ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
       ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
       '(p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
       'and (p.status_ped <> '''' or not p.status_ped is null) and '+
       'p.tipv = '''+vperctivendageral[i,0]+''' and p.ativo = 1 and '+
       'p.cod_empresa = '+vDadosIni.codEmpresa;
    buscas.open;
    vvalparcial:=buscas.FieldByName('valorprod').AsCurrency-buscas.FieldByName('descontos').AsCurrency;
    vvalqtdeparcial:=buscas.FieldByName('qtde').AsCurrency;
    buscas.Close;
      buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(pp.rateio_desc)) as valorprod,sum(pp.quant_ped_item) as qtde '+
      'from pedvenda p,pedvenda_prod pp where pp.nped = p.nped and pp.tipo = p.tipo '+
      'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
      'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
      ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
      ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
      '(p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
      'and (p.status_ped <> '''' or not p.status_ped is null) and p.ativo = 1 and '+
      'p.cod_empresa = '+vDadosIni.codEmpresa;
      buscas.Open;
      vperctipovenda:=0;
      vperctipoqtde:=0;
      if buscas.FieldByName('valorprod').AsCurrency <> 0 then
       vperctipovenda:=vvalparcial/buscas.FieldByName('valorprod').AsCurrency;
      if buscas.FieldByName('qtde').AsCurrency <> 0 then
       vperctipoqtde:=vvalqtdeparcial/buscas.FieldByName('qtde').AsCurrency;
     vperctivendageral[i,1]:=FloatToStr(vperctipovenda);
     vperctivendageral[i,2]:=FloatToStr(vperctipoqtde);
     buscas.close;
  end;
 end
 else
 begin
   for I := 0 to 5 do
   begin
     if vperctivendageral[i,0] = vtipovenda then
     begin
      vperctipovenda:=StrToFloat(vperctivendageral[i,1]);
      vperctipoqtde:=strtofloat(vperctivendageral[i,2]);
     end;
   end;
 end;
end;

function TProdutosSugVenda.verificarVendaproduto(vtipclasse: string;vdiasmeses: integer;vtipat: string;vtipcot: string;vtipovenda: string): boolean;
var
 vnomecampo: string;
begin
// fazer aqui o vtipclasse = "R" olhando o giro do grupo a que pertence este produto
// quando o grupo não possuir estes parâmetros retornar uma exceção para que o usuário
// possa colocá-lo manualmente via cadastro...(pedir para o Zé acrescentar as informações
// dos giros de grupos e serviços nos seus respectivos cadastros)
{ if dataSet.FieldByName('PREC_TAB_PROD').AsCurrency < dataset.FieldByName('PREC_CUSM_PROD').AsCurrency then
 begin
  Application.MessageBox(Pchar('Problemas com Preço de Venda de produtos. Menor que custo '+dataSet.FieldByName('GRUPO_PROD').AsString), 'Confirmação', MB_OK);
  Result:=false;
  exit;
 end;}
 result:=true;
 //if trim(dataset.fieldbyname('NUM_FAB_PROD').ASSTRING) = 'H0640KPE910' then
//   Application.MessageBox('OK', 'Confirmação', MB_OK);
 if vtipovenda = 'A' then
  vnomecampo:='PREC_PUBLICO'
 else
  vnomecampo:='PREC_TAB_PROD';
 if vtipcot = '1' then
 begin
  if trim(dataSet.FieldByName('CLATL').AsString) = 'R' then
  begin
    buscas.close;
    buscas.sql.Text:='SELECT * FROM GRUPOS WHERE CODIGO_GRUP = '+
    dataSet.FieldByName('GRUPO_PROD').AsString;
    buscas.Open;
    if buscas.FieldByName('VALORPME').AsFloat <> 0 then
    begin
      // qtde disponível do estoque, dividir o estoque/valorpme*qtdedispmes
      vqtdegiromes:=((dataSet.FieldByName('EST_F').AsFloat/buscas.FieldByName('VALORPME').AsFloat)*vdiasmeses);
  //      vqtdegiromes:=vqtdegiromes;
      vpme:=buscas.FieldByName('VALORPME').AsFloat;
    end
    else
    begin
      Application.MessageBox(Pchar('Não é possível determinar qtde de venda para produto "R" do grupo '+dataSet.FieldByName('GRUPO_PROD').AsString), 'Confirmação', MB_OK);
      Result:=false;
      buscas.Close;
      exit;
    end;
  end
  else
  begin
   if dataset.FieldByName('DMD').AsFloat <> 0 then
    vqtdegiromes:=(dataset.FieldByName('DMD').AsFloat*vdiasmeses)
    //((dataSet.FieldByName('EST_F').AsFloat/dataset.FieldByName('VALORPME').AsFloat)*vdiasmeses)
   else
    vqtdegiromes:=0;
   vpme:=dataset.FieldByName('VALORPME').AsFloat;
  end;
  IF vvalest = 0 then
   vvalest:=1;
  vpercvenda:=(((vqtdegiromes*vperctipoqtde)*dataSet.FieldByName(vnomecampo).AsFloat)/vvalest);
//  ((dataSet.FieldByName('EST_F').AsFloat*dataSet.FieldByName('PREC_CUSM_PROD').AsFloat)/vvalest);
  vcustvend:=dataSet.FieldByName('PREC_CUSM_PROD').AsFloat;
  buscas.Close;
  // Herbert 12/08/2011
  buscas.SQL.text:='select sum(pp.vltot_ped_item) as valorprod,sum(pp.rateio_desc) as descontos,sum(pp.quant_ped_item) as qtde,'+
     'SUM(pp.QUANT_PED_ITEM*pp.PCUST_MC) as custo from pedvenda p,pedvenda_prod pp where pp.grupo_prod = '+
     dataSet.FieldByName('GRUPO_PROD').AsString+' and pp.cod_prod = '''+
     dataSet.FieldByName('COD_PROD').AsString+''' and  pp.nped = p.nped and pp.tipo = p.tipo '+
     'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
     'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
     ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
     ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
     '(p.tipo = ''REQ'')) '+
     'and (p.status_ped <> '''' or not p.status_ped is null) and p.tipv = '''+vtipovenda+''' and p.ativo = 1 and '+
     'p.cod_empresa = '+vDadosIni.codEmpresa;
  buscas.open;

  qtdevend:=buscas.FieldByName('qtde').AsFloat;
  vvalvend:=buscas.FieldByName('valorprod').AsFloat;
  vdescprat:=buscas.FieldByName('descontos').AsFloat;
  vcustvend:=buscas.FieldByName('custo').AsFloat;
  vestreal:=dataSet.FieldByName('est_f').AsFloat-
  verificapendencias(dataSet.FieldByName('COD_PROD').AsString,dataSet.FieldByName('GRUPO_PROD').AsInteger);
  vgrprod:=dataSet.FieldByName('grupo_prod').AsString;
  vcodprod:=dataSet.FieldByName('cod_prod').AsString;
  vnum_fab:=dataset.FieldByName('num_fab_prod').AsString;
  vdescprod:=dataset.FieldByName('descr_prod').AsString;
  buscas.Close;
    buscas.SQL.text:='select (sum(pp.vltot_ped_item)-sum(pp.rateio_desc)) as valorprod '+
    'from pedvenda p,pedvenda_prod pp where pp.nped = p.nped and pp.tipo = p.tipo '+
    'and pp.cod_empresa = p.cod_empresa and (pp.status is null or pp.status = '''') '+
    'and p.data_fech >='''+FormatDateTime('mm/dd/yyyy',vdat1)+
    ''' and p.data_fech <= '''+FormatDateTime('mm/dd/yyyy',vdat2)+
    ''' and ((p.tipo = ''OS'' and p.tipo_os in '+vDadosIni.vTipoVendaOS+') or '+
    '(p.tipo = ''REQ'' and p.tipv in '+vDadosIni.vTipoVendaREQ+')) '+
    'and (p.status_ped <> '''' or not p.status_ped is null) and p.ativo = 1 and '+
    'p.cod_empresa = '+vDadosIni.codEmpresa;
    buscas.Open;
    vpercvendidas:=(vvalvend-vdescprat)/buscas.FieldByName('valorprod').AsFloat;
 end;
end;

{ TcolaboradorGes }

function TcolaboradorGes.abrebase(vcod_us: integer): boolean;
begin
 montaSelect('select cod_vendedor,nome_vendedor from colaborador where ativo = 1 and cod_empresa ='+vDadosIni.codEmpresa);
// dataSet.Locate('COD_VENDEDOR',vcod_us,[]);
end;

constructor TcolaboradorGes.create;
begin
DataSet := TClientDataSet(DtmGestorHw.CdsColaborador);
transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
Buscas := TIBQuery(DtmGestorHw.qrBuscas);
end;

destructor TcolaboradorGes.Destroy;
begin
  Close;
  inherited;
end;

{ TFornecedorGes }

function TFornecedorGes.abrebase: boolean;
begin
montaSelect('select cod_cliente, nome_cliente, cod_cond_pag, prazo_medio_ent, prazo_medio_pag from clientes where cod_empresa = '+vDadosIni.codEmpresa+
' and (tipo = ''A'' or tipo = ''F'')  and ativo = 1');
end;

constructor TFornecedorGes.create;
begin
DataSet := TClientDataSet(DtmGestorHw.CdsFornecedor);
transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
Buscas := TIBQuery(DtmGestorHw.qrBuscas);
end;

destructor TFornecedorGes.Destroy;
begin

  inherited;
end;

{ TGestorFormularios }

procedure TGestorFormularios.cadCotacao(TipoForm: integer);
begin
  try
  	vDadosIni.abreStatusProcessamento('', 'Abrindo Cotação de Compra/Venda');
    if DtmGestorHw = nil then
      DtmGestorHw:= TDtmGestorHw.Create(DtmGestorHw);
    if not vDadosIni.PesqPros('GES004','ACESSO','COTAÇÃO COMPRA/VENDA','','',cQuery,True) then
      Exit;

     if FrmSugestCompraVenda = nil then
     begin
       if TipoForm > 0 then
         vDadosIni.vModalOuChild := 'M';

       Application.CreateForm(TFrmSugestCompraVenda, FrmSugestCompraVenda);
     end;

     if (TipoForm > 0) and (not FrmSugestCompraVenda.Visible) then
       FrmSugestCompraVenda.ShowModal
     else if (not FrmSugestCompraVenda.Visible) then
       FrmSugestCompraVenda.Show
     else if FrmSugestCompraVenda.FormStyle = fsMDIChild then
       FrmSugestCompraVenda.Show
     else
       FrmSugestCompraVenda.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TGestorFormularios.cadEnsaiosProvisao(TipoForm: integer);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('GES003','ACESSO','ENSAIOS/PROVISÃO','','',cQuery,True) then
      Exit;
    if FrmCustos = nil then
      Application.CreateForm(TFrmCustos, FrmCustos);
    FrmCustos.show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TGestorFormularios.cadFinancasCustos(TipoForm: integer);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('GES002','ACESSO','FINANÇA/CUSTOS','','',cQuery,True) then
      Exit;
    vDadosIni.vatvfluxo:=tipoform;
    if FrmFinanceiros = nil then
      Application.CreateForm(TFrmFinanceiros, FrmFinanceiros);
    FrmFinanceiros.show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TGestorFormularios.cadMetas(TipoForm: integer);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('GES001','ACESSO','METAS','','',cQuery,True) then
      Exit;
    if FrmMetas = nil then
      Application.CreateForm(TFrmMetas, FrmMetas);
    FrmMetas.show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TGestorFormularios.cadPainelControle(TipoForm: integer);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('GES005','ACESSO','PAINEL DE CONTROLE','','',cQuery,True) then
      Exit;
    if FrmPainelControl = nil then
      Application.CreateForm(TFrmPainelControl, FrmPainelControl);
    FrmPainelControl.show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

constructor TGestorFormularios.create;
begin
  cTransacao := TIBTransaction.Create(Application);
  cQuery := TIBQuery.Create(Application);
  cTransacao.DefaultDatabase := dtmAtivo.bancoHw;
  cTransacao.Params.Add('read_committed');
  cTransacao.Params.Add('rec_version');
  cTransacao.Params.Add('nowait');
  cQuery.Database := dtmAtivo.bancoHw;
  cQuery.Transaction := cTransacao;
end;

{ TListaCotacao }

constructor TListaCotacao.create;
begin
	if DtmGestorHw = nil then
  	DtmGestorHw := TDtmGestorHw.Create(DtmGestorHw);
  DataSet := TClientDataSet(DtmGestorHw.cdsListaCotacao);
  transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
  Buscas := TIBQuery(DtmGestorHw.qrBuscas);

  vListaCotacaoItens := TListaCotacaoItens.Create;
end;

function TListaCotacao.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('COD_LISTA').AsString;

  if dataSet.FieldByName('ATIVO').AsInteger = 1 then
  begin

    if not vDadosIni.PesqPros('GES055', 'EXCLUIR', '', 'LISTA_COTACAO',
      dataSet.FieldByName('COD_LISTA').AsString, buscas, true) then
      Exit;

    if Application.MessageBox('Tem certeza que deseja enviar este registro para Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ATIVO').AsInteger := 0;
    dataSet.Post;

    result := Apply;
    if result then
      result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria('GES055', 'EXCLUIR', 'SUCESSO', 'LISTA_COTACAO', vCodFormula, buscas)
    else
      vDadosIni.GravaAuditoria('GES055', 'EXCLUIR', 'FALHA', 'LISTA_COTACAO', vCodFormula, buscas);

    Result := true;
    Refresh;

    Exit;
  end;

  if not vDadosIni.PesqPros('GES056', 'EXCLUIR', '', 'LISTA_COTACAO',
    dataSet.FieldByName('COD_LISTA').AsString, buscas, true) then
    Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  if ExecutaComandosSql('select first 1 cod_lista from lista_cotacao_itens ' +
    ' where cod_lista = ' + IntToStr(dataSet.FieldByName('COD_LISTA').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa) then
  begin
     if Application.MessageBox('Existem Produtos vinculados a esta lista de cotação, tem certeza que deseja excluir permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;
  end;

  if ExecutaComandosSql('select first 1 cod_lista from cotacao_itens ' +
    ' where cod_lista = ' + IntToStr(dataSet.FieldByName('COD_LISTA').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa) then
  begin
     Application.MessageBox('Lista de Cotação não pode ser excluída pois está vinculado a uma cotação!',
      'Atenção', 0 + 64);
    Exit;
  end;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;
  _abrelixeira;
  if Result then
    vDadosIni.GravaAuditoria('GES056', 'EXCLUIR', 'SUCESSO', 'LISTA_COTACAO', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('GES056', 'EXCLUIR', 'FALHA', 'LISTA_COT	ACAO', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

destructor TListaCotacao.destroy;
begin
  vListaCotacaoItens.Free;
  vListaCotacaoItens := nil;

  inherited;
end;

function TListaCotacao.edit: boolean;
begin
 Result := False;
  if not vDadosIni.PesqPros('GES054', 'ALTERAR', '', 'LISTA_COTACAO',
    '', buscas, true) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('DESCRICAO_LISTA').AsString := dataSet.FieldByName('DESCRICAO_LISTA').AsString;
    dataSet.FieldByName('OBS').AsString := dataSet.FieldByName('OBS').AsString;
  end;

end;

function TListaCotacao.imprimirLista: boolean;
var
	vPecastot, vPesoBrTotal, vPesoLiqTotal: Double;
  vNitem: Integer;

  procedure Linhas;
  begin
     dtmGestorHw.RDprintGestor.Impf(linha, 1, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 7, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 18, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 63, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 72, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 83, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 96, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 109, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 122, '|', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 135, '|', [comp17]);
  end;

  procedure Separador(ln: integer; tp: integer);
  begin
    dtmGestorHw.RDprintGestor.Impf(ln, 1, '+' + VdadosIni.replicate('-', 6), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 7, '+' + VdadosIni.replicate('-', 14), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 18, '+' + VdadosIni.replicate('-', 44), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 63, '+' + VdadosIni.replicate('-', 8), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 72, '+' + VdadosIni.replicate('-', 26), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 83, '+' + VdadosIni.replicate('-', 26), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 96, '+' + VdadosIni.replicate('-', 12), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 109, '+' + VdadosIni.replicate('-', 12), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 122, '+' + VdadosIni.replicate('-', 12), [comp17]);
    dtmGestorHw.RDprintGestor.Impf(ln, 135, '+', [comp17]);
  end;

  procedure CabNovaPagina;
  begin
     if vpag > 0 then
       dtmGestorHw.RDprintGestor.Novapagina;

     vpag := vpag + 1;

     linha := 1;
  	 dtmGestorHw.RDprintGestor.ImpC(linha, 66, 'Loja: ' + vDadosIni.StrZero(vDadosIni.codEmpresa, 3) + ' '
    		+ trim(vDadosIni.vEmp.vnomeEmpresa), [comp17, Negrito]);
     linha := linha + 1;
     dtmGestorHw.RDprintGestor.ImpC(linha, 66, 'Lista de COração', [comp17, Negrito]);
     dtmGestorHw.RDprintGestor.ImpF(linha, 01, datetostr(date), [comp12, Negrito]);
     dtmGestorHw.RDprintGestor.ImpF(linha, 124, 'PAG: ' + vDadosIni.StrZero(vpag, 3), [comp17, Negrito]);
     linha := linha + 1;
     separador(linha, 2);
     linha := linha + 1;
     dtmGestorHw.RDprintGestor.Impf(linha, 2, 'ITEM', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 9, 'NUM. PROD', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 21, 'DESCRICAO', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 65, 'GRADE', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 76, 'QTDE', [comp17]);
   	 dtmGestorHw.RDprintGestor.Impf(linha, 85, 'LOCACAO', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 97, 'LOCACAO 1', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 112, 'PESO BR', [comp17]);
     dtmGestorHw.RDprintGestor.Impf(linha, 125, 'PESO LIQ', [comp17]);
     Linhas;
     linha := linha + 1;
     separador(linha, 1);
  end;
begin
	vpag := 0;
  vPecastot     := 0;
  vPesoBrTotal  := 0;
  vPesoLiqTotal := 0;
  vNitem        := 0;
  
	if not vDadosIni.ModImp(dtmGestorHw.RDprintGestor) then
    exit;
  dtmGestorHw.RDprintGestor.FonteTamanhoPadrao := S17cpp;
  dtmGestorHw.RDprintGestor.TamanhoQteColunas := 136;
  dtmGestorHw.RDprintGestor.CaptionSetup := 'Configurações de Impressão';
  dtmGestorHw.RDprintGestor.OpcoesPreview.CaptionPreview := 'Lista de Cotação';
  dtmGestorHw.RDprintGestor.TitulodoRelatorio := 'Lista de Cotação';
  vDadosIni._LimparVarSendEmail;
  dtmGestorHw.RDprintGestor.OnSendMail := vDadosini._SendMailRdPrint;
  dtmGestorHw.RDprintGestor.OpcoesPreview.Preview := true;

  dtmGestorHw.RDprintGestor.OnSendMail :=nil;
  vDadosIni._LimparVarSendEmail;
  dtmGestorHw.RDprintGestor.OnSendMail := _rdListaCotacaoSendMail;

  vListaCotacaoItens.abreItListaCotacao(dataSet.FieldByName('COD_LISTA').AsInteger);
  if not dtmGestorHw.RDprintGestor.EstaAberto then
    dtmGestorHw.RDprintGestor.Abrir;
  CabNovaPagina; //cabeçalho

  try
    Screen.Cursor := crHourGlass;
  finally
    Screen.Cursor := crDefault;
  end;

  try
  	vListaCotacaoItens.dataSet.DisableControls;
    vListaCotacaoItens.dataSet.First;
    while not vListaCotacaoItens.dataSet.eof do
    begin
    	vNitem        := vNitem + 1;
      vPecastot     := vPecastot     + vListaCotacaoItens.dataSet.FieldByName('QUANT_PROD').AsFloat;
    	vPesoBrTotal  := vPesoBrTotal  + vListaCotacaoItens.dataSet.FieldByName('PESO_BRUT_PROD').AsFloat;
      vPesoLiqTotal := vPesoLiqTotal + vListaCotacaoItens.dataSet.FieldByName('PESO_LIQ_PROD').AsFloat;

      Application.ProcessMessages;
      linha := linha + 1;
      Linhas;
      dtmGestorHw.RDprintGestor.Imp(linha, 002, IntToStr(vNitem));
      dtmGestorHw.RDprintGestor.Imp(linha, 009, vListaCotacaoItens.dataSet.FieldByName('GRUPO_PROD').AsString +' '+ trim(vListaCotacaoItens.dataSet.FieldByName('COD_PROD').AsString));
      dtmGestorHw.RDprintGestor.Imp(linha, 020, copy(trim(vListaCotacaoItens.dataSet.FieldByName('DESCR_PROD').AsString), 1, 33));
      dtmGestorHw.RDprintGestor.ImpD(linha, 069, IntToStr(vListaCotacaoItens.dataSet.FieldByName('COD_GRADE').AsInteger), [comp17]);
      dtmGestorHw.RDprintGestor.ImpD(linha, 083, format('%8.3f', [vListaCotacaoItens.dataSet.FieldByName('QUANT_PROD').AsFloat]), [comp17]);

      if trim(vListaCotacaoItens.dataSet.FieldByName('LOCACAO_PROD').AsString) <> '' then
        dtmGestorHw.RDprintGestor.ImpD(linha, 096, FormatMaskText(vDadosIni.vMascaraLocacao, trim(vListaCotacaoItens.dataSet.FieldByName('LOCACAO_PROD').AsString)), [comp17]);
      if trim(vListaCotacaoItens.dataSet.FieldByName('LOCACAO_PROD_1').AsString) <> '' then
        dtmGestorHw.RDprintGestor.ImpD(linha, 109, FormatMaskText(vDadosIni.vMascaraLocacao, trim(vListaCotacaoItens.dataSet.FieldByName('LOCACAO_PROD_1').AsString)), [comp17]);
      if vListaCotacaoItens.dataSet.FieldByName('PESO_BRUT_PROD').AsFloat > 0 then
        dtmGestorHw.RDprintGestor.ImpD(linha, 121, format('%8.2f', [vListaCotacaoItens.dataSet.FieldByName('PESO_BRUT_PROD').AsFloat]), [comp17]);
      if vListaCotacaoItens.dataSet.FieldByName('PESO_LIQ_PROD').AsFloat > 0 then
        dtmGestorHw.RDprintGestor.ImpD(linha, 134, format('%8.2f', [vListaCotacaoItens.dataSet.FieldByName('PESO_LIQ_PROD').AsFloat]), [comp17]);

      vListaCotacaoItens.dataSet.Next;
      if linha >= 65 then
      begin
        linha := 1;
        dtmGestorHw.RDprintGestor.Novapagina;
        CabNovaPagina;
      end;
    end;
  finally
    vListaCotacaoItens.dataSet.First;
    vListaCotacaoItens.dataSet.EnableControls;
  end;

  linha := linha + 1;
  separador(linha, 2);
  linha := linha + 1;

	dtmGestorHw.RDprintGestor.impf(linha, 1, 'QTDE PECAS..............: ' + VdadosIni.alndir(format('%8.3f', [vPecastot]), 8), [normal]);
  linha := linha + 1;
  dtmGestorHw.RDprintGestor.impf(linha, 1, 'TOTAL PESO BR...........: ' + VdadosIni.alndir(format('%8.2f', [vPesoBrTotal]),  12), [normal]);
  linha := linha + 1;
  dtmGestorHw.RDprintGestor.impf(linha, 1, 'TOTAL PESO LIQ..........: ' + VdadosIni.alndir(format('%8.2f', [vPesoLiqTotal]),  12), [normal]);
  linha := linha + 1;

  if dtmGestorHw.RDprintGestor.EstaAberto then
    dtmGestorHw.RDprintGestor.Fechar;
end;

function TListaCotacao.Insert: boolean;
begin
   if not vDadosIni.PesqPros('GES053', 'INCLUIR', '', 'LISTA_COTACAO',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect('select l.* from lista_cotacao l ' +
      ' where l.cod_lista = 0 and l.ativo = 0 and l.cod_empresa =0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('DATA').AsString := FormatDateTime('DD/MM/YYYY', vDadosIni.getDataHoraBanco(DtmGestorHw.QrBuscas));
    dataSet.FieldByName('ATIVO').AsFloat := 1;
  end;
end;

function TListaCotacao.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('GES058', 'SALVAR', '', 'LISTA_COTACAO',
      dataSet.FieldByName('COD_LISTA').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('DESCRICAO_LISTA').AsString) = '' then
      raiseExceptionCreate('Descrição da Lista deve ser informada', 'DBEdit2');

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('COD_LISTA').AsInteger :=
        Gencodigo('LISTA_COTACAO', DtmGestorHw.SpIncCodigo, vDadosIni.codEmpresa);

    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('GES058', acao, 'SUCESSO', 'LISTA_COTACAO',
        dataSet.FieldByName('COD_LISTA').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('GES058', acao, 'FALHA', 'LISTA_COTACAO',
        dataSet.FieldByName('COD_LISTA').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TListaCotacao._abrelixeira: boolean;
begin
 if not _lixeiraCheia then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select l.* from lista_cotacao l where l.cod_empresa= ' + vDadosIni.codEmpresa +
      ' and l.ativo = 0');
end;

procedure TListaCotacao._cadListaCotacao(pTipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Lista de Cotação');
    if DtmGestorHw = nil then
      DtmGestorHw := TDtmGestorHw.Create(DtmGestorHw);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('GES051', 'CONSULTA', '', 'LISTA_COTACAO', '',
      DtmGestorHw.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadListaCotacao = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadListaCotacao, frmCadListaCotacao);
    end;

    if (pTipoForm > 0) and (not frmCadListaCotacao.Visible) then
      frmCadListaCotacao.ShowModal
    else if (not frmCadListaCotacao.Visible) then
      frmCadListaCotacao.Show
    else if frmCadListaCotacao.FormStyle = fsMDIChild then
      frmCadListaCotacao.Show
    else
      frmCadListaCotacao.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TListaCotacao._lixeiraCheia: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 cod_lista from LISTA_COTACAO ' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TListaCotacao._rdListaCotacaoSendMail(Sender: TObject);
var
 pTipo: string;
begin
  try

   pTipo := 'LISTA COTACAO' + dataSet.FieldByName('COD_LISTA').AsString;

   Screen.Cursor := crHourGlass;

   if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
      CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

   if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
    exit;
                                                                                        
   if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
      CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp');

   if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
    exit;

    TRdprint(Sender).gerarPDF(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

    vDadosIni.EnvEmail(
    	vDadosIni.vEmp.vAssunto_dav,
      vDadosIni.vEmp.vMsg_dav,
      0,
      cEmail,
      '',
      '',
      cNenhum,
      vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

   DeleteFile(Pchar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf'));
  finally
     Screen.Cursor := crDefault;
  end;
end;

function TListaCotacao._restauralixeira: boolean;
begin
 if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        if (Edit) or (dataSet.State = dsEdit) then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          Result := Post;
          if Result then
            Result := CommitaTransacao;

          if Result then
            vDadosIni.GravaAuditoria('GES057', 'RESTAURAR REGISTRO', 'SUCESSO',
              'LISTA_COTACAO', dataSet.FieldByName('COD_LISTA').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('GES057', 'RESTAURAR REGISTRO', 'FALHA',
              'LISTA_COTACAO', dataSet.FieldByName('COD_LISTA').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação', 0 + 64);
  Refresh;
end;

{ TListaCotacaoItens }

function TListaCotacaoItens.abreItListaCotacao(Cod: integer): Boolean;
begin
 result := montaSelect(' SELECT LISTA_COTACAO_ITENS.COD_LISTA, ' +
 	  ' LISTA_COTACAO_ITENS.GRUPO_PROD, LISTA_COTACAO_ITENS.COD_PROD, ' +
    ' LISTA_COTACAO_ITENS.COD_GRADE, LISTA_COTACAO_ITENS.COD_EMPRESA AS COD_EMP_MULT, LISTA_COTACAO_ITENS.COD_EMPRESA,  ' +
    ' LISTA_COTACAO_ITENS.NUM_FAB_PROD, LISTA_COTACAO_ITENS.DESCR_PROD, LISTA_COTACAO_ITENS.QUANT_PROD, ' +
    ' LISTA_COTACAO_ITENS.NUM_PED, LISTA_COTACAO_ITENS.COD_COTACAO, ' +
    ' case when (PRODUTOS.PESO_LIQ_PROD is null) then ' +
    '				 null ' +
    '			 else ' +
    '				 (coalesce(LISTA_COTACAO_ITENS.QUANT_PROD, 0) * coalesce(PRODUTOS.PESO_LIQ_PROD,  0)) ' +
    ' end PESO_LIQ_PROD, ' +
    ' case when (PRODUTOS.PESO_BRUT_PROD is null) then ' +
    '				 null ' +
    '			 else ' +
		' 			 (coalesce(LISTA_COTACAO_ITENS.QUANT_PROD, 0) * coalesce(PRODUTOS.PESO_BRUT_PROD,  0)) ' +
    '	end PESO_BRUT_PROD, ' +
		' PRODUTOS.LOCACAO_PROD, PRODUTOS.LOCACAO_PROD_1 FROM LISTA_COTACAO_ITENS ' +
    ' LEFT JOIN PRODUTOS on PRODUTOS.GRUPO_PROD = LISTA_COTACAO_ITENS.GRUPO_PROD and PRODUTOS.COD_PROD = LISTA_COTACAO_ITENS.COD_PROD and PRODUTOS.COD_EMPRESA = LISTA_COTACAO_ITENS.COD_EMPRESA ' +
    ' WHERE LISTA_COTACAO_ITENS.COD_LISTA = ' + inttostr(Cod) +
    ' AND LISTA_COTACAO_ITENS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' UNION ALL ' +
    ' SELECT LISTA_COTACAO_ITENS2.COD_LISTA, ' +
 	  ' LISTA_COTACAO_ITENS2.GRUPO_PROD, LISTA_COTACAO_ITENS2.COD_PROD, ' +
    ' LISTA_COTACAO_ITENS2.COD_GRADE, LISTA_COTACAO_ITENS2.COD_EMP_MULT, LISTA_COTACAO_ITENS2.COD_EMPRESA, ' +
    ' LISTA_COTACAO_ITENS2.NUM_FAB_PROD, LISTA_COTACAO_ITENS2.DESCR_PROD, LISTA_COTACAO_ITENS2.QUANT_PROD, ' +
    ' LISTA_COTACAO_ITENS2.NUM_PED, LISTA_COTACAO_ITENS2.COD_COTACAO, ' +
    ' case when (PRODUTOS.PESO_LIQ_PROD is null) then ' +
    '				 null ' +
    '			 else ' +
    '				 (coalesce(LISTA_COTACAO_ITENS2.QUANT_PROD, 0) * coalesce(PRODUTOS.PESO_LIQ_PROD,  0)) ' +
    ' end PESO_LIQ_PROD, ' +
    ' case when (PRODUTOS.PESO_BRUT_PROD is null) then ' +
    '				 null ' +
    '			 else ' +
		' 			 (coalesce(LISTA_COTACAO_ITENS2.QUANT_PROD, 0) * coalesce(PRODUTOS.PESO_BRUT_PROD,  0)) ' +
    '	end PESO_BRUT_PROD, ' +
		' PRODUTOS.LOCACAO_PROD, PRODUTOS.LOCACAO_PROD_1 ' +
    ' FROM LISTA_COTACAO_ITENS2 ' +
    ' LEFT JOIN PRODUTOS on PRODUTOS.GRUPO_PROD = LISTA_COTACAO_ITENS2.GRUPO_PROD and PRODUTOS.COD_PROD = LISTA_COTACAO_ITENS2.COD_PROD and PRODUTOS.COD_EMPRESA = LISTA_COTACAO_ITENS2.COD_EMP_MULT ' +
    ' WHERE LISTA_COTACAO_ITENS2.COD_LISTA = ' + inttostr(Cod) +
    ' AND LISTA_COTACAO_ITENS2.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' ORDER BY 1, 2, 3, 4, 5 ');
end;

function TListaCotacaoItens.buscarItem(codLista, grupo: integer; codProd: string; codEmpMult: Integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select first 1 cod_lista from lista_cotacao_itens ' +
     ' where cod_lista = ' + IntToStr(codLista)+
     ' and grupo_prod = ' + IntToStr(grupo) +
     ' and cod_prod = '+ QuotedStr(codProd) +
     ' and cod_empresa = ' + vDadosIni.codEmpresa +
     ' union all ' +
     ' select first 1 cod_lista from lista_cotacao_itens2 ' +
     ' where cod_lista = ' + IntToStr(codLista)+
     ' and grupo_prod = ' + IntToStr(grupo) +
     ' and cod_prod = '+ QuotedStr(codProd) +
     ' and cod_empresa = ' + vDadosIni.codEmpresa +
     ' and cod_emp_mult = ' + IntToStr(codEmpMult);
  buscas.Prepare;
  buscas.Open;

  Result :=  buscas.IsEmpty;
end;

function TListaCotacaoItens.buscarProduto(codBarra: string; grupo: integer; codProd: string; usarCodbarra: boolean): boolean;
var
  temp: string;
  j: Integer;
  i: Integer;
  nBarra, nGradetTemp, vCodProd: string;
  vCodSeg, vCodVend, vCodVendCol, vCodGrade, vGrupoProd: Integer;
  vStatusEdicao, GradeNoCodigo: boolean;
begin
	try
    nGradeSelecionada := 0;
    vGrupoProd := 0;
    vCodProd := '';
    vCodGrade := 0;
    Result := true;
    vStatusEdicao := false;
    GradeNoCodigo := false;
    if not usarCodbarra then
    begin
      if (trim(codProd) = '') or (grupo = 0) then
        raise exception.create(Pchar('Dados para consulta não informados completamente' + chr(13) + 'Grupo e código do produto são campos abrigatórios'));
      buscas.Close;
      buscas.SQL.Text := 'select distinct(p.*) from produtos p ' +
      	' inner join cod_barra cb on p.grupo_prod=cb.grupo_prod and p.cod_prod=cb.cod_prod and p.cod_empresa=cb.cod_empresa ' +
        ' where  p.grupo_prod = ' + IntToStr(grupo) +
        ' and p.cod_prod = ' + QuotedStr(codProd) +
        ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      if not buscas.IsEmpty then
      begin
        vGrupoProd := buscas.FieldByName('GRUPO_PROD').AsInteger;
        vCodProd := trim(buscas.FieldByName('COD_PROD').AsString);
        CodBarra := trim(buscas.FieldByName('num_fab_prod').AsString);
        GradeNoCodigo := false;
      end
      else
      begin
        Application.MessageBox(pchar('Produto Não Encontrado' + chr(13) + 'Use a Lupa ou F3 para Pesquisar'), 'Atenção', MB_ICONWARNING + MB_OK);
        Result := false;
        exit
      end;
    end
    else
    begin
      //Validando codigo de barras
//      if (Copy(codBarra, 1, 2) = 'G-') then
//      begin
//        try
//          if (pos(';', codBarra) > 0) then //compatibilidade com etiquetas antigas
//          begin
//            //            nGradeSelecionada := StrToInt(Copy(codBarra, Pos(';', codBarra) + 1, Length(codBarra) - Pos(';', codBarra)));
//            vCodGrade := strtoint(Copy(codBarra, Pos(';', codBarra) + 1, Length(codBarra) - Pos(';', codBarra)));
//            codBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//              ' and grupo_prod=' + Copy(codBarra, 5, (pos(';', codBarra) - 5 - strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and cod_prod=' + quotedstr(Copy(codBarra, (pos(';', codBarra) - strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and ativo=1'));
//          end
//          else if (pos('/', codBarra) > 0) then //compatibilidade com etiquetas antigas
//          begin
//            //            nGradeSelecionada := StrToInt(Copy(codBarra, Pos('/', codBarra) + 1, Length(codBarra) - Pos('/', codBarra)));
//            vCodGrade := strtoint(Copy(codBarra, Pos('/', codBarra) + 1, Length(codBarra) - Pos('/', codBarra)));
//            codBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//              ' and grupo_prod=' + Copy(codBarra, 5, (pos('/', codBarra) - 5 - strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and cod_prod=' + quotedstr(Copy(codBarra, (pos('/', codBarra) - strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and ativo=1'));
//          end
//          else
//          begin //Novo modelo de etiqueta
//            //            nGradeSelecionada := StrToInt(copy(codBarra, (3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup + strtoint(vDadosIni.vProduto.vDigitosProd)), 10));
//            vCodGrade := StrToInt(copy(codBarra, (3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup + strtoint(vDadosIni.vProduto.vDigitosProd)), 10));
//            codBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//              ' and grupo_prod=' + Copy(codBarra, 3 + vDadosIni.vEmp.vDigitosEmp, vDadosIni.vEmp.vDidgitosGrup) +
//              ' and cod_prod=' + quotedstr(Copy(codBarra, 3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup, strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and ativo=1'));
//          end;
//          GradeNoCodigo := true;
//          if codBarra = '' then
//          begin
//            Application.MessageBox('Produto não encontrado', 'Atenção', MB_ICONINFORMATION + MB_OK);
//            exit;
//          end;
//        except
//          raise exception.create('Produto não encontrado');
//        end;
//      end;
      vDadosIni.vEtiqProd := vDadosIni.retornaDadosEtiqueta(
        buscas,
        codBarra,
        grupo,
        codProd);

      codBarra := vDadosIni.vEtiqProd.CodBarra;
      vGrupoProd := vDadosIni.vEtiqProd.GrupoProd;
      vCodProd := vDadosIni.vEtiqProd.CodProd;

      if vDadosIni.vEtiqProd.Quant > 0 then
      	dataSet.FieldByName('QUANT_PROD').AsFloat := vDadosIni.vEtiqProd.Quant;
    end;

    if trim(vCodProd) <> '' then
      // Não fazer nada	
    else if (codBarra <> '') and usarCodbarra then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select distinct(p.*) from produtos p ' +
      	' inner join cod_barra cb on p.grupo_prod=cb.grupo_prod and p.cod_prod=cb.cod_prod and p.cod_empresa=cb.cod_empresa ' +
        ' where p.cod_empresa=' + vDadosIni.codEmpresa +
        ' and cb.cod_barra=' + QuotedStr(codBarra) + ' and p.ativo = 1';
      buscas.Open;
      if buscas.IsEmpty then
      begin
        Result := false;
        raise exception.create('Produto não encontrado');
        exit;
      end
      else
      begin
        vCodProd := trim(buscas.FieldByName('cod_prod').AsString);
        vGrupoProd := buscas.FieldByName('grupo_prod').AsInteger;
      end;
      buscas.close;
    end
    else
    begin
      Result := false;
      raise exception.create('Produto não encontrado');
    end;

    if not Result then
      exit;

//    if (not GradeNoCodigo) and ExecutaComandosSql('select first 1 cgp.cod_grade from cod_grade_prod cgp' +
//      ' inner join grade g on g.cod_grade = cgp.cod_grade and g.cod_empresa = cgp.cod_empresa' +
//      ' where cgp.grupo_prod = ' + IntToStr(vGrupoProd) +
//      ' and cgp.cod_prod = ' + QuotedStr(trim(vCodProd)) +
//      ' and cgp.cod_empresa = ' + vDadosIni.codEmpresa) then
//      _abreFormSelecionaGradeProd(vGrupoProd, vCodProd);
//
//    if nGradeSelecionada <> 0 then
//      dataSet.FieldByName('cod_grade').AsInteger := nGradeSelecionada
//    else
//      dataSet.FieldByName('cod_grade').AsInteger := vCodGrade;
    dataSet.FieldByName('cod_grade').AsInteger := 0;

    buscas.Close;
    buscas.SQL.Text := ' select GRUPO_PROD, COD_PROD, DESCR_PROD, ' +
    	' NUM_FAB_PROD,VL_ULT_COMPRA,PREC_CUS_PROD, ' +
      ' PREC_TAB_PROD,PREC_PUBLICO,CUSTO_HONDA from produtos ' +
      '	where grupo_prod = ' + IntToStr(vGrupoProd) +
      ' and cod_prod = ' + QuotedStr(vCodProd) +
      ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    dataSet.FieldByName('DESCR_PROD').AsString := buscas.FieldByName('DESCR_PROD').AsString;
    dataSet.FieldByName('NUM_FAB_PROD').AsString := trim(buscas.FieldByName('NUM_FAB_PROD').AsString);
    dataSet.FieldByName('GRUPO_PROD').AsInteger := buscas.FieldByName('GRUPO_PROD').AsInteger;
    dataSet.FieldByName('COD_PROD').AsString := trim(buscas.FieldByName('COD_PROD').AsString);

    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

constructor TListaCotacaoItens.create;
begin
  DataSet := TClientDataSet(DtmGestorHw.cdsListaCotacaoItens);
  transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
  Buscas := TIBQuery(DtmGestorHw.qrBuscas);

  dataSet.FieldByName('LOCACAO_PROD').EditMask := vDadosIni.vMascaraLocacao;
  dataSet.FieldByName('LOCACAO_PROD_1').EditMask := vDadosIni.vMascaraLocacao;

  TFloatField(dataset.FieldByName('PESO_BRUT_PROD')).DisplayFormat := '#,##0.00';
  TFloatField(dataset.FieldByName('PESO_LIQ_PROD')).DisplayFormat := '#,##0.00';
end;

function TListaCotacaoItens.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('COD_LISTA').AsString;

   if not vDadosIni.PesqPros('GES064', 'EXCLUIR', 'PROD.:' + dataSet.FieldByName('NUM_FAB_PROD').AsString, 'LISTA_COTACAO_ITENS',
      dataSet.FieldByName('COD_LISTA').AsString, buscas, true) then
      Exit;


  if Application.MessageBox('Deseja excluir este Produto da Lista?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('GES056', 'EXCLUIR', 'SUCESSO', 'LISTA_COTACAO_ITENS', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('GES056', 'EXCLUIR', 'FALHA', 'LISTA_COTACAO_ITENS', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

function TListaCotacaoItens.edit: boolean;
begin
 Result := False;
  if not vDadosIni.PesqPros('GES063', 'ALTERAR', '', 'LISTA_COTACAO_ITENS',
    '', buscas, true) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    if dataSet.FieldByName('COD_EMPRESA').IsNull then
	    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    if dataSet.FieldByName('COD_EMP_MULT').IsNull then
	    dataSet.FieldByName('COD_EMP_MULT').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('NUM_FAB_PROD').AsString := dataSet.FieldByName('NUM_FAB_PROD').AsString;
    dataSet.FieldByName('DESCR_PROD').AsString := dataSet.FieldByName('DESCR_PROD').AsString;
    dataSet.FieldByName('QUANT_PROD').AsFloat := dataSet.FieldByName('QUANT_PROD').AsFloat;
  end;
end;

function TListaCotacaoItens.empresaExiste(CodEmp: Integer): Boolean;
begin
	buscas.Close;
  buscas.SQL.Text := 'select cod_empresa from empresa ' +
  	' where cod_empresa = ' + IntToStr(CodEmp);
  buscas.Open;

  Result := not buscas.IsEmpty;
end;

function TListaCotacaoItens.Insert: boolean;
begin
   if not vDadosIni.PesqPros('GES062', 'INCLUIR', '', 'LISTA_COTACAO_ITENS',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect(' SELECT LISTA_COTACAO_ITENS2.COD_LISTA, ' +
 	  ' LISTA_COTACAO_ITENS2.GRUPO_PROD, LISTA_COTACAO_ITENS2.COD_PROD, ' +
    ' LISTA_COTACAO_ITENS2.COD_GRADE, LISTA_COTACAO_ITENS2.COD_EMP_MULT, LISTA_COTACAO_ITENS2.COD_EMPRESA, ' +
    ' LISTA_COTACAO_ITENS2.NUM_FAB_PROD, LISTA_COTACAO_ITENS2.DESCR_PROD, LISTA_COTACAO_ITENS2.QUANT_PROD, ' +
    ' LISTA_COTACAO_ITENS2.NUM_PED, LISTA_COTACAO_ITENS2.COD_COTACAO, ' +
    ' case when (PRODUTOS.PESO_LIQ_PROD is null) then ' +
    '				 null ' +
    '			 else ' +
    '				 (coalesce(LISTA_COTACAO_ITENS2.QUANT_PROD, 0) * coalesce(PRODUTOS.PESO_LIQ_PROD,  0)) ' +
    ' end PESO_LIQ_PROD, ' +
    ' case when (PRODUTOS.PESO_BRUT_PROD is null) then ' +
    '				 null ' +
    '			 else ' +
		' 			 (coalesce(LISTA_COTACAO_ITENS2.QUANT_PROD, 0) * coalesce(PRODUTOS.PESO_BRUT_PROD,  0)) ' +
    '	end PESO_BRUT_PROD, ' +
		' PRODUTOS.LOCACAO_PROD, PRODUTOS.LOCACAO_PROD_1 ' +
    ' FROM LISTA_COTACAO_ITENS2 ' +
    ' LEFT JOIN PRODUTOS on PRODUTOS.GRUPO_PROD = LISTA_COTACAO_ITENS2.GRUPO_PROD and PRODUTOS.COD_PROD = LISTA_COTACAO_ITENS2.COD_PROD and PRODUTOS.COD_EMPRESA = LISTA_COTACAO_ITENS2.COD_EMP_MULT ' +
    ' WHERE LISTA_COTACAO_ITENS2.COD_LISTA = 0 ' +
    ' AND LISTA_COTACAO_ITENS2.COD_EMPRESA = 0 ' + 
    ' ORDER BY 1, 2, 3, 4, 5 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_LISTA').AsInteger := ListaCotacao.dataSet.FieldByName('COD_LISTA').AsInteger;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('COD_EMP_MULT').AsString := vDadosIni.codEmpresa;
  end;
end;

function TListaCotacaoItens.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('GES065', 'SALVAR', 'PROD.:' + dataSet.FieldByName('NUM_FAB_PROD').AsString, 'LISTA_COTACAO_ITENS',
      dataSet.FieldByName('COD_LISTA').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.FieldByName('COD_EMP_MULT').AsInteger <= 0 then
      raiseExceptionCreate('Código da empresa deve ser informada', 'DBEdit6');

   	if not empresaExiste(dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
      raiseExceptionCreate('Código da empresa não encontrada', 'DBEdit6');

    if trim(dataSet.FieldByName('NUM_FAB_PROD').AsString) = '' then
      raiseExceptionCreate('Numero de fabricante deve ser informada', 'DBEdit3');

    if dataSet.FieldByName('COD_GRADE').AsInteger < 0 then
      raiseExceptionCreate('Codigo da grade deve ser informada', 'DBEdit53');

    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('QUANT_PROD').AsFloat, 3) <= 0 then
      raiseExceptionCreate('Quantidade deve ser informada', 'DBEdit4');

    if dataSet.State = dsInsert then
     if not buscarItem(
     	 dataSet.FieldByName('COD_LISTA').AsInteger,
       dataSet.FieldByName('GRUPO_PROD').AsInteger,
       dataSet.FieldByName('COD_PROD').AsString,
       dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
        raiseExceptionCreate('Produto existente nesta lista!', 'DBEdit3');

    buscas.Close;
    buscas.SQL.Text := ' INSERT INTO LISTA_COTACAO_ITENS2 ' +
    	' (COD_LISTA, GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA, COD_EMP_MULT, ' +
      ' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD) ' +
      ' VALUES (:COD_LISTA, :GRUPO_PROD, :COD_PROD, :COD_GRADE, :COD_EMPRESA, :COD_EMP_MULT, ' +
      ' :NUM_FAB_PROD, :DESCR_PROD, :QUANT_PROD) ';
    buscas.ParamByName('COD_LISTA').AsInteger := dataSet.FieldByName('COD_LISTA').AsInteger;
    buscas.ParamByName('GRUPO_PROD').AsInteger := dataSet.FieldByName('GRUPO_PROD').AsInteger;
    buscas.ParamByName('COD_PROD').AsString := dataSet.FieldByName('COD_PROD').AsString;
    buscas.ParamByName('COD_GRADE').AsInteger := dataSet.FieldByName('COD_GRADE').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
    buscas.ParamByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    buscas.ParamByName('NUM_FAB_PROD').AsString := dataSet.FieldByName('NUM_FAB_PROD').AsString;
    buscas.ParamByName('DESCR_PROD').AsString := dataSet.FieldByName('DESCR_PROD').AsString;
    buscas.ParamByName('QUANT_PROD').AsFloat := dataSet.FieldByName('QUANT_PROD').AsFloat;
    buscas.ExecSQL;
                          
//    Result := inherited post;
//
//    if (DataSet.ChangeCount = 0) then
//      Result := True
//    else
//      Result := Apply;
//
//    if result then
    result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('GES065', acao, 'SUCESSO', 'LISTA_COTACAO_ITENS',
        dataSet.FieldByName('COD_LISTA').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('GES065', acao, 'FALHA', 'LISTA_COTACAO_ITENS',
        dataSet.FieldByName('COD_LISTA').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TListaCotacaoItens._abreFormSelecionaGradeProd(grupo: integer;
  codProd: string): boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.BorderIcons := [];
    formulario.Caption := 'Selecionar Grade do produto';
    frmCadListaCotacao.pnSelecionaGradeProd.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;

    buscas.Close;
    buscas.SQL.Text := 'select g.cod_grade,g.descricao,g.descricao1,' +
      ' (cgp.qtde - coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and ((v.status_ped <>''FECHADA'') or (v.status_ped is null))' +
      ' and (pp.status<>''CANCELADO'' or pp.status is null)' +
      //' and v.NPED<>' + inttostr(dataSet.FieldByName('NPED').AsInteger) +
    ' and v.tipo<>''ORC''),0)) as qtd_item_disponivel, ' +
      ' cgp.qtde, ' +
      '(coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and ((v.status_ped <>''FECHADA'') or (v.status_ped is null))' +
      ' and (pp.status<>''CANCELADO'' or pp.status is null)' +
      //' and v.NPED<>' + inttostr(dataSet.FieldByName('NPED').AsInteger) +
    ' and v.tipo<>''ORC''),0)) as qtd_item_pedAberto ' +
      ' from grade g inner join cod_grade_prod cgp ' +
      ' on g.cod_grade=cgp.cod_grade and g.cod_empresa =cgp.cod_empresa ' +
      ' where cgp.grupo_prod = ' + inttostr(grupo) +
      ' and cgp.cod_prod = ' + QuotedStr(codProd) +
      ' and cgp.cod_empresa =' + vDadosIni.codEmpresa +
      ' order by g.cod_grade';
    buscas.open;
    buscas.FieldByName('cod_grade').DisplayLabel := 'Grade';
    buscas.FieldByName('descricao').DisplayLabel := 'Descrição 1';
    buscas.FieldByName('descricao1').DisplayLabel := 'Descrição 2';
    buscas.FieldByName('qtde').DisplayLabel := 'Qtd. total da grade';
    buscas.FieldByName('qtd_item_pedAberto').DisplayLabel := 'Qtd. em Vendas em Aberto';
    buscas.FieldByName('qtd_item_disponivel').DisplayLabel := 'Qtd. Disponível';
    frmCadListaCotacao.dsSelecionaGradeProd.dataSet := buscas;
    result := (formulario.ShowModal = IDOK);
    nGradeSelecionada := buscas.FieldByName('cod_grade').AsInteger;

  finally
    buscas.close;
    frmCadListaCotacao.pnSelecionaGradeProd.Parent := frmCadListaCotacao.tsSelecionaGradeProd;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TListaCotacaoItens._cadListaCotacao(pTipoForm: Integer);
begin
  vDadosIni.vShiftClick := False;
  abreItListaCotacao(ListaCotacao.dataSet.FieldByName('COD_LISTA').asinteger);
end;

{ TCondPagGes }

function TCondPagGes.abreCondPag: boolean;
begin
  result := montaSelect('SELECT * FROM COND_PAG where' +
    ' natureza_cp <> ''C'' and ativo=1 order by desc_cond_pag');
end;

constructor TCondPagGes.create;
begin
  DataSet := TClientDataSet(DtmGestorHw.CdsCondPag);
  transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
  Buscas := TIBQuery(DtmGestorHw.qrBuscas);
end;

function TCondPagGes.existeCondPag(codigo: Integer): boolean;
begin
  result := ExecutaComandosSql('SELECT cod_cond_pag FROM COND_PAG' +
    ' where cod_cond_pag = ' + IntToStr(codigo) +
    ' and natureza_cp <> ''C'' and ativo = 1');
end;

{ TAtributos }

constructor TAtributos.create;
begin
  DataSet := TClientDataSet(DtmGestorHw.cdsAtributos);
  transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
  Buscas := TIBQuery(DtmGestorHw.qrBuscas);
end;

function TAtributos.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('COD_ATRIBUTO').AsString;

  if dataSet.FieldByName('ATIVO').AsInteger = 1 then
  begin

    if not vDadosIni.PesqPros('GES072', 'EXCLUIR', '', 'ATRIBUTOS',
      dataSet.FieldByName('COD_ATRIBUTO').AsString, buscas, true) then
      Exit;

    if Application.MessageBox('Tem certeza que deseja enviar este registro para Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ATIVO').AsInteger := 0;
    dataSet.Post;

    result := Apply;
    if result then
      result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria('GES072', 'EXCLUIR', 'SUCESSO', 'ATRIBUTOS', vCodFormula, buscas)
    else
      vDadosIni.GravaAuditoria('GES072', 'EXCLUIR', 'FALHA', 'ATRIBUTOS', vCodFormula, buscas);

    Result := true;
    Refresh;

    Exit;
  end;

  if not vDadosIni.PesqPros('GES073', 'EXCLUIR', '', 'ATRIBUTOS',
    dataSet.FieldByName('COD_ATRIBUTO').AsString, buscas, true) then
    Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  if ExecutaComandosSql('select first 1 cod_atributo from atributos_fornec ' +
    ' where cod_atributo = ' + IntToStr(dataSet.FieldByName('COD_ATRIBUTO').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa) then
  begin
     if Application.MessageBox('Existem Atributos vinculados a um fornecedor, tem certeza que deseja excluir permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;
  end;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;
  _abrelixeira;
  if Result then
    vDadosIni.GravaAuditoria('GES073', 'EXCLUIR', 'SUCESSO', 'ATRIBUTOS', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('GES073', 'EXCLUIR', 'FALHA', 'ATRIBUTOS', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

function TAtributos.edit: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('GES071', 'ALTERAR', '', 'ATRIBUTOS',
    '', buscas, true) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('DESCRICAO_ATRIBUTO').AsString := dataSet.FieldByName('DESCRICAO_ATRIBUTO').AsString;
  end;
end;

function TAtributos.Insert: boolean;
begin
    if not vDadosIni.PesqPros('GES070', 'INCLUIR', '', 'ATRIBUTOS',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect('select a.* from atributos a ' +
      ' where a.cod_atributo = 0 and a.ativo = 0 and a.cod_empresa =0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('DATA').AsString := FormatDateTime('DD/MM/YYYY', vDadosIni.getDataHoraBanco(DtmGestorHw.QrBuscas));
    dataSet.FieldByName('ATIVO').AsFloat := 1;
  end;

end;

function TAtributos.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('GES075', 'SALVAR', '', 'ATRIBUTOS',
      dataSet.FieldByName('COD_ATRIBUTO').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('DESCRICAO_ATRIBUTO').AsString) = '' then
      raiseExceptionCreate('Descrição deve ser informada', 'DBEdit2');

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('COD_ATRIBUTO').AsInteger :=
        Gencodigo('ATRIBUTOS', DtmGestorHw.SpIncCodigo, vDadosIni.codEmpresa);

    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('GES075', acao, 'SUCESSO', 'ATRIBUTOS',
        dataSet.FieldByName('COD_ATRIBUTO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('GES075', acao, 'FALHA', 'ATRIBUTOS',
        dataSet.FieldByName('COD_ATRIBUTO').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TAtributos._abrelixeira: boolean;
begin
  if not _lixeiraCheia then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select a.* from atributos a where a.cod_empresa= ' + vDadosIni.codEmpresa +
      ' and a.ativo = 0');
end;

procedure TAtributos._cadAtributos(pTipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Tipos de Atributos');
    if DtmGestorHw = nil then
      DtmGestorHw := TDtmGestorHw.Create(DtmGestorHw);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('GES068', 'CONSULTA', '', 'ATRIBUTOS', '',
      DtmGestorHw.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadAtributos = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadAtributos, frmCadAtributos);
    end;

    if (pTipoForm > 0) and (not frmCadAtributos.Visible) then
      frmCadAtributos.ShowModal
    else if (not frmCadAtributos.Visible) then
      frmCadAtributos.Show
    else if frmCadAtributos.FormStyle = fsMDIChild then
      frmCadAtributos.Show
    else
      frmCadAtributos.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TAtributos._lixeiraCheia: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 cod_atributo from ATRIBUTOS ' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TAtributos._restauralixeira: boolean;
begin
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        if (Edit) or (dataSet.State = dsEdit) then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          Result := Post;
          if Result then
            Result := CommitaTransacao;

          if Result then
            vDadosIni.GravaAuditoria('GES074', 'RESTAURAR REGISTRO', 'SUCESSO',
              'ATRIBUTOS', dataSet.FieldByName('COD_ATRIBUTO').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('GES074', 'RESTAURAR REGISTRO', 'FALHA',
              'ATRIBUTOS', dataSet.FieldByName('COD_ATRIBUTO').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação', 0 + 64);
  Refresh;
end;

{ TDREComparativo }

procedure TDREComparativo.abreOLAP(pColuna: string; pBalDre: string);
begin
  if vDadosIni.PosMult(['RECEITA', 'DEVOLUCAO', 'CUSTO'], dataSet.FieldByName('TIPO_REL').AsString ) > 0 then
  begin
    CadVendas.vdat1 := StartOfTheMonth(EncodeDate(ano, mes, 1));
    CadVendas.vdat2 := EndOfTheMonth(EncodeDate(ano, mes, 1));
    CadVendas.vdatant1 := CadVendas.vdat1;
    CadVendas.vdatant2 := CadVendas.vdat2;
    Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
    if (pColuna = 'VALOR_CNT') or (pColuna = 'GRUPO_CNT') then
      CadVendas.vendasBICNT(vCodEmpresasDRE, FrmVisualizaOlap.HCubeGERAL, pBalDre)
    else
    begin
      CadVendas.vVendasCNT := 'S';
      CadVendas.vendasBI(vCodEmpresasDRE, FrmVisualizaOlap.HCubeGERAL, pBalDre);
    end;
    FrmVisualizaOlap.Label1.Caption:='Detalhes de Vendas do Comparativo';
    FrmVisualizaOlap.HierCubeGrid1.SummarySettings.BeginUpdate;
    FrmVisualizaOlap.HierCubeGrid1.SummarySettings.AddSummary('MARKUP','("BRUTO"."Sum"-"DESCONTO"."Sum")/"CUSTO"."Sum"');
    FrmVisualizaOlap.HierCubeGrid1.SummarySettings.Items[0].FunctionSum.SubFunctions[0].FormatString:='##0.0000';
    FrmVisualizaOlap.HierCubeGrid1.SummarySettings.EndUpdate;
    FrmVisualizaOlap.ShowModal;
  end
  else
  begin
    caddesp.vdat1 := StartOfTheMonth(EncodeDate(ano, mes, 1));
    caddesp.vdat2 := EndOfTheMonth(EncodeDate(ano, mes, 1));
    caddesp.vdatant1 := caddesp.vdat1;
    caddesp.vdatant2 := caddesp.vdat2;
    caddesp.vmesvendas := mes;
    caddesp.vanovendas := ano;
    caddesp.vregime := vregime;
    caddesp.vmesor := mes;
    caddesp.vtippesq := 'M';
    caddesp.vcoddemo:=vcoddemo;
    Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
    caddesp.despBI(vCodEmpresasDRE, FrmVisualizaOlap.HCubeGERAL, pBalDre);
    FrmVisualizaOlap.Label1.Caption:='Detalhes dos Custos e Inventimentos por Mês';
    FrmVisualizaOlap.ShowModal;
  end;
end;

function TDREComparativo.aplicaFormulaRegistroAtual: Boolean;
var
  vRecNo, vRecNoTmp: Integer;
  vFiltro, vFiltroTmp: string;
  vFiltered: Boolean;
  vFormRetorno: string;
  vListaFormulasApl: TStringList;
  I: Integer;
  J: Integer;
  vContaAT: string;
  vFormula: string;
  vFormContinuar: Boolean;
  vFormOperador: string;
  vFormErro: string;
  vrTmpReal: Currency;
  vrTmpCNT: Currency;
begin
  vRecNo := dataSet.RecNo;
  vFiltro := dataSet.Filter;
  vFiltered := dataSet.Filtered;
  vListaFormulasApl := TStringList.Create;
  vListaFormulasApl.Clear;
  vContaAT := dataSet.FieldByName('cod_cta').AsString;

  vFormula := Trim(dataSet.FieldByName('FORMULA').AsString);
  vFormContinuar := True;
  while vFormContinuar do
  begin
    if not decodeFormula(vFormula, vFormOperador, vFormRetorno, vFormErro, vFormContinuar) then
    begin
      dataSet.Edit;
      dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString + 'FORMULA INVALIDA ' + vFormErro + ' ';
      dataSet.Post;
      Break;
    end
    else
    begin
      if Copy(vFormRetorno, 1, 1) = '@' then
      begin
        if (Pos(vFormRetorno, fListaFormulaNaoApl.Text) > 0) then
        begin
          dataSet.Edit;
          dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString + 'REFERENCIA CIRCULAR ' + vFormRetorno + ' ' + vFormErro + ' ';
          dataSet.Post;
          Break;
        end
        else
          fListaFormulaNaoApl.Add(vFormRetorno);

        vFormRetorno := StringReplace(vFormRetorno, '@', '', [rfReplaceAll]);
        dataSet.Filter := 'COD_CTA = ' + QuotedStr(vFormRetorno);
        dataSet.Filtered := True;
        if dataSet.IsEmpty then
        begin
          dataSet.Filter := vFiltro;
          dataSet.RecNo := vRecNo;
          dataSet.Edit;
          dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString + 'CONTA CODIGO ' + vFormRetorno + ' NAO ENCONTRADA';
          dataSet.Post;
        end
        else
        begin
          if (Trim(dataSet.FieldByName('FORMULA').AsString) <> '') and (Trim(dataSet.FieldByName('FORMULAAPL').AsString) <> 'S') then
          begin
            vFiltroTmp := dataSet.Filter;
            aplicaFormulaRegistroAtual;
            dataSet.Filter := vFiltroTmp;
            dataSet.Filtered := True;
          end;
          if (not dataSet.FieldByName('GRUPO_REAL').IsNull) and (not dataSet.FieldByName('GRUPO_CNT').IsNull) then
          begin
            vrTmpReal := dataSet.FieldByName('GRUPO_REAL').AsFloat;
            vrTmpCNT := dataSet.FieldByName('GRUPO_CNT').AsFloat;
          end
          else
          begin
            vrTmpReal := dataSet.FieldByName('VALOR_REAL').AsFloat;
            vrTmpCNT := dataSet.FieldByName('VALOR_CNT').AsFloat;
          end;
          if vFormOperador = '-' then
          begin
            vrTmpReal := vrTmpReal  * (-1);
            vrTmpCNT := vrTmpCNT  * (-1);
          end;
        end;
        vListaFormulasApl.Add('@' + vFormRetorno + '@');
      end
      else
      begin
        vrTmpReal := StrToFloatDef(vFormRetorno, 0);
        vrTmpCNT := StrToFloatDef(vFormRetorno, 0);
      end;

      dataSet.Filter := vFiltro;
      dataSet.RecNo := vRecNo;
      dataSet.Edit;
      if vDadosIni.strEstaContidoEm(vFormOperador, ['+', '-']) then
      begin
        dataSet.FieldByName('GRUPO_REAL').AsFloat := dataSet.FieldByName('GRUPO_REAL').AsFloat + vrTmpReal;
        dataSet.FieldByName('GRUPO_CNT').AsFloat := dataSet.FieldByName('GRUPO_CNT').AsFloat + vrTmpCNT;
      end
      else if vFormOperador = '*' then
      begin
        dataSet.FieldByName('GRUPO_REAL').AsFloat := dataSet.FieldByName('GRUPO_REAL').AsFloat * vrTmpReal;
        dataSet.FieldByName('GRUPO_CNT').AsFloat := dataSet.FieldByName('GRUPO_CNT').AsFloat * vrTmpCNT;
      end
      else// if vFormOperador = '/' then
      begin
        dataSet.FieldByName('GRUPO_REAL').AsFloat := dataSet.FieldByName('GRUPO_REAL').AsFloat / vrTmpReal;
        dataSet.FieldByName('GRUPO_CNT').AsFloat := dataSet.FieldByName('GRUPO_CNT').AsFloat / vrTmpCNT;
      end;
      dataSet.Post;
    end;
  end;

  dataSet.Filter := vFiltro;
  dataSet.Filtered := vFiltered;
  dataSet.RecNo := vRecNo;

  dataSet.Edit;
  dataSet.FieldByName('FORMULAAPL').AsString := 'S';
  dataSet.Post;

  for I := 0 to vListaFormulasApl.Count - 1 do
    if (Pos(vListaFormulasApl[i], fListaFormulaNaoApl.Text) > 0) then
      for J := 0 to fListaFormulaNaoApl.Count - 1 do
        if vListaFormulasApl[i] = fListaFormulaNaoApl[J] then
        begin
          fListaFormulaNaoApl.Delete(J);
          Break;
        end;
end;

constructor TDREComparativo.create;
begin
  transacao := TIBTransaction(DtmGestorHw.IbTransHwGestor);
  buscas := TIBQuery(DtmGestorHw.qrBuscas);
  dataSet := TClientDataSet.Create(Application);
  dataSet.FieldDefs.Add('COD_CTA', ftString, 60);
  dataSet.FieldDefs.Add('DESC_PLC', ftString, 30);
  dataSet.FieldDefs.Add('NOME_CTA', ftString, 60);
  dataSet.FieldDefs.Add('VALOR_REAL', ftFloat);
  dataSet.FieldDefs.Add('VALOR_CNT', ftFloat);
  dataSet.FieldDefs.Add('GRUPO_REAL', ftFloat);
  dataSet.FieldDefs.Add('GRUPO_CNT', ftFloat);
  dataSet.FieldDefs.Add('ESTRUTURADRE', ftString, 32);
  dataSet.FieldDefs.Add('TIPO_REL', ftString, 10);
  dataSet.FieldDefs.Add('FORMULA', ftString, 128);
  dataSet.FieldDefs.Add('SINAL', ftString, 1);
  dataSet.FieldDefs.Add('SOMARGRUPO', ftString, 1);
  dataSet.FieldDefs.Add('ALERTA', ftString, 32);
  dataSet.FieldDefs.Add('CONTCONTAS', ftInteger);
  dataSet.FieldDefs.Add('NIVEL', ftInteger);
  dataSet.FieldDefs.Add('FORMULAAPL', ftString, 32);
  dataSet.CreateDataSet;
  dataSet.EmptyDataSet;
  dataSet.IndexFieldNames := 'ESTRUTURADRE';


  dataSet.FieldByName('COD_CTA').DisplayLabel := 'Cod Cta Contabil';
  dataSet.FieldByName('DESC_PLC').DisplayLabel := 'Descr Cta Contabil';
  dataSet.FieldByName('NOME_CTA').DisplayLabel := 'Descr Cta Financeiro';
  dataSet.FieldByName('VALOR_REAL').DisplayLabel := 'Valor Financeiro';
  dataSet.FieldByName('VALOR_CNT').DisplayLabel := 'Valor Contábil';
  dataSet.FieldByName('GRUPO_REAL').DisplayLabel := 'Grupo Financeiro';
  dataSet.FieldByName('GRUPO_CNT').DisplayLabel := 'Grupo Contabil';
  dataSet.FieldByName('ESTRUTURADRE').DisplayLabel := 'Estrutura';
  dataSet.FieldByName('TIPO_REL').DisplayLabel := 'Tp Cta';
  dataSet.FieldByName('FORMULA').DisplayLabel := 'Formula';
  dataSet.FieldByName('SINAL').DisplayLabel := 'Sinal';
  dataSet.FieldByName('SOMARGRUPO').DisplayLabel := 'Soma Grupo';
  dataSet.FieldByName('ALERTA').DisplayLabel := 'Alerta';
  dataSet.FieldByName('FORMULAAPL').DisplayLabel := 'Formula Aplicada';

  TFloatField(dataSet.FieldByName('VALOR_REAL')).DisplayFormat :=  '#,##0.00';
  TFloatField(dataSet.FieldByName('VALOR_CNT')).DisplayFormat := '#,##0.00';
  TFloatField(dataSet.FieldByName('GRUPO_REAL')).DisplayFormat := '#,##0.00';
  TFloatField(dataSet.FieldByName('GRUPO_CNT')).DisplayFormat := '#,##0.00';

  CadVendas := TVendasGestor.create;
  CadVendas.ZeraVendas;

  caddesp := TDespesasGestor.create;

  fListaFormulaNaoApl := TStringList.Create;

  fDetalhesCta := TDataSet_OOP.Create;
  fDetalhesCta.dataSet := TClientDataSet.Create(Application);
  fDetalhesCta.dataSet.FieldDefs.Add('COD_CTA', ftString, 60);
  fDetalhesCta.dataSet.FieldDefs.Add('N_CONTA_PLC', ftFloat);
  fDetalhesCta.dataSet.FieldDefs.Add('TIPO_REL', ftString, 10);
  fDetalhesCta.dataSet.FieldDefs.Add('DESCRICAO', ftString, 60);
  fDetalhesCta.dataSet.FieldDefs.Add('VALOR_REAL', ftFloat);
  fDetalhesCta.dataSet.FieldDefs.Add('VALOR_CNT', ftFloat);
  fDetalhesCta.dataSet.CreateDataSet;
  fDetalhesCta.dataSet.EmptyDataSet;
  fDetalhesCta.dataSet.IndexFieldNames := 'DESCRICAO';

  fDetalhesCta.dataSet.FieldByName('COD_CTA').DisplayLabel := 'Cta';
  fDetalhesCta.dataSet.FieldByName('N_CONTA_PLC').DisplayLabel := 'Cta Fin';
  fDetalhesCta.dataSet.FieldByName('TIPO_REL').DisplayLabel := 'Tipo';
  fDetalhesCta.dataSet.FieldByName('DESCRICAO').DisplayLabel := 'Descrição';
  fDetalhesCta.dataSet.FieldByName('VALOR_REAL').DisplayLabel := 'Valor Financeiro';
  fDetalhesCta.dataSet.FieldByName('VALOR_CNT').DisplayLabel := 'Valor Contábil';

  TFloatField(fDetalhesCta.dataSet.FieldByName('VALOR_REAL')).DisplayFormat :=  '#,##0.00';
  TFloatField(fDetalhesCta.dataSet.FieldByName('VALOR_CNT')).DisplayFormat := '#,##0.00';
end;

function TDREComparativo.decodeFormula(var pFormula: string; var pOperador: string; var pRetorno: string; var pMsg: string; var pContinuar: Boolean): Boolean;
var
  vTmp: string;
  vrTmp: Double;
begin
  ///  esta funcao retorna sucesso na leitura da formula,
  ///  ela deve ser chamada até o parametro pContinuar for false
  ///  existe sempre 3 retornos, o Operador, o numero ou o campo(@chavetabela@) e o retante da formula
  vTmp := pFormula;
  pOperador := '';
  pRetorno := '';
  pContinuar := False;

  // 1º passo, obter o operador
  if vDadosIni.strEstaContidoEm(Copy(vTmp, 1, 1), ['+', '-', '*', '/']) then//teste de operador
  begin
    pOperador := Copy(vTmp, 1, 1);
    System.Delete(vTmp, 1, 1);
  end
  else
    pOperador := '+';

  // 2º passo, Testar se é campo e retornar o campo com o @ no inicio e final
  if Copy(vTmp, 1, 1) = '@' then
  begin
    System.Delete(vTmp, 1, 1);
    if Pos('@', vTmp) = 0 then
    begin
      pMsg:= 'FINAL DE CAMPO(@) NAO ENCONTRADO';
      pContinuar := False;
      Result := False;
      Exit;
    end;
    pRetorno := '@' + Copy(vTmp, 1, Pos('@', vTmp));
    System.Delete(vTmp, 1, Pos('@', vTmp));
    pContinuar := Trim(vTmp) <> '';// caso tenha mais na formula o continuar vai indicar
    pFormula := vTmp;
    Result := True;
  end
  else// caso nao seja campo será considerado sendo um valor
  begin
    if vDadosIni.PosMult(['+', '-', '*', '/'], vTmp) > 0 then// caso encontre outro operador na formula
    begin
      pRetorno := Copy(vTmp, 1, vDadosIni.PosMult(['+', '-', '*', '/'], vTmp) - 1);// o retorno vai até a posicao do 1º operador encontrado
      if not TryStrToFloat(pRetorno, vrTmp) then// teste numérico
      begin
        pMsg := 'NUMERO INVALIDO: ' + pRetorno;
        pContinuar := False;
        Result := False;
        Exit;
      end;
      System.Delete(vTmp, 1, vDadosIni.PosMult(['+', '-', '*', '/'], vTmp));
      pContinuar := True;
      pFormula := vTmp;
      Result := True;
    end
    else
    begin
      pRetorno := Trim(vTmp);
      if not TryStrToFloat(pRetorno, vrTmp) then// teste numérico
      begin
        pMsg := 'NUMERO INVALIDO: ' + pRetorno;
        pContinuar := False;
        Result := False;
        Exit;
      end;
      pContinuar := False;
      pFormula := '';
      Result := True;
    end;
  end;
end;

destructor TDREComparativo.Destroy;
begin

  inherited;
end;

function TDREComparativo.getCorPersonalizadaFonte(pNivel: Integer): TColor;
var
  vLength: Integer;
begin
  try
    vLength := Length(fCorPersonalizadaFundo);
    if (pNivel > vLength) or (pNivel = 0) then
      Result := clWindowText
    else
      Result := fCorPersonalizadaFonte[pNivel - 1];
  except
    Result := clWindowText;
  end;
end;

function TDREComparativo.getCorPersonalizadaFundo(pNivel: Integer): TColor;
var
  vLength: Integer;
begin
  try
    vLength := Length(fCorPersonalizadaFundo);
    if (pNivel > vLength) or (pNivel = 0) then
      Result := clWhite
    else
      Result := fCorPersonalizadaFundo[pNivel - 1];
  except
    Result := clWhite;
  end;
end;

function TDREComparativo.iniciaVariaveis: Boolean;
var
  I: Integer;
begin
  try
    vcoddemo:='(';
    buscas.Close;
    buscas.SQL.Text := 'SELECT * FROM DEPART_CT';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
      if Length(vcoddemo) > 1 then
       vcoddemo:=vcoddemo + ',' + buscas.FieldByName('COD_DEP').AsString
      else
       vcoddemo:=vcoddemo + buscas.FieldByName('COD_DEP').AsString;
      buscas.next;
    end;
    vcoddemo:=vcoddemo+')';

    if vregime = 'COMP' then
    begin
      vdtgeral:='l.dtreferencia';
      vdtgeralctp:='ctr.dtreferencia';
    end
    else
    begin
      vdtgeral:='l.datq_l';
      vdtgeralctp:='ctr.datq_ctp';
    end;

    vCampoTipoCusto := vDadosIni.retornoPorCondicao(vTipoCusto = 'Tipo2', 'TIPO_GR2', 'TIPO_GR');

    vMes := StrToDate('01/' + vDadosIni.StrZero(fMes, 2) + '/' + vDadosIni.StrZero(fAno, 4));
     dataSet.DisableControls;
    dataSet.EmptyDataSet;
    detalhesCta.dataSet.EmptyDataSet;
    buscas.Close;
    buscas.SQL.Text :=
      'select pc.cod_cta, pc.nome_cta, pc.nivel, pc.tipo_rel, pc.sinal, pc.formula, pc.somargrupo, pc.estruturadre,' +
      ' count(pl.n_conta_plc) contcontas from p_contas_contabil pc' +
      ' left join p_contas pl on pl.cod_cta_contabil = pc.cod_cta' +
      ' where pc.tipo_rel is not null and pc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(pc.estruturadre, '''') <> ''''' +
      ' group by pc.cod_cta, pc.nome_cta, pc.nivel, pc.tipo_rel, pc.sinal, pc.formula, pc.somargrupo, pc.estruturadre' +
      ' order by pc.estruturadre';
    buscas.Open;
    fMaxNivel := 0;

    buscas.First;
    while not buscas.Eof do
    begin
      dataSet.Insert;
      for I := 0 to dataSet.FieldCount - 1 do
        if buscas.FindField(dataSet.Fields[i].FieldName) <> nil then
          dataSet.FieldByName(dataSet.Fields[i].FieldName).Value := buscas.FieldByName(dataSet.Fields[i].FieldName).Value;
      dataSet.FieldByName('NOME_CTA').AsString := vDadosIni.Space((dataSet.FieldByName('nivel').AsInteger - 1) * 3) +
        Trim(dataSet.FieldByName('NOME_CTA').AsString);
      if dataSet.FieldByName('nivel').AsInteger > fMaxNivel then
        fMaxNivel := dataSet.FieldByName('nivel').AsInteger;
      dataSet.Post;
      buscas.Next;
    end;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('NOME_CTA').AsString :=
        vDadosIni.Space((dataSet.FieldByName('nivel').AsInteger - 1) *
        vDadosIni.retornoPorCondicao(dataSet.FieldByName('nivel').AsInteger = fMaxNivel, 3, 2)) +
        Trim(dataSet.FieldByName('NOME_CTA').AsString);
      dataSet.Post;
      dataSet.Next;
    end;


    buscas.Close;

    fListaFormulaNaoApl.Clear;

    SetLength(fCorPersonalizadaFundo, fMaxNivel);
    for I := 0 to fMaxNivel - 1 do
      fCorPersonalizadaFundo[I] := StrToInt64Def( vDadosIni._LerConfiguracoesRegistroString('DRECorPersonalisadaFundoNivel' + IntToStr(I + 1)), clWhite);
    SetLength(fCorPersonalizadaFonte, fMaxNivel);
    for I := 0 to fMaxNivel - 1 do
      fCorPersonalizadaFonte[I] := StrToInt64Def( vDadosIni._LerConfiguracoesRegistroString('DRECorPersonalisadaFonteNivel' + IntToStr(I + 1)), clWindowText);

    relOpcoes := [];
    if _LerConfiguracoesRegistroBoolean('ImpEstrutura') then
      relOpcoes := relOpcoes + [oiImpEstrutura];
    if _LerConfiguracoesRegistroBoolean('ImpContaContabil') then
      relOpcoes := relOpcoes + [oiImpContaCTB];
    if _LerConfiguracoesRegistroBoolean('ImpRegistrosFinanceiros') then
      relOpcoes := relOpcoes + [oiImpRegistrosFIN];
    if _LerConfiguracoesRegistroBoolean('EspacoEntreDetalhes', True) then
      relOpcoes := relOpcoes + [oiEspacoEntreDetalhes];
    if _LerConfiguracoesRegistroBoolean('ImpContasSemVinculo', True) then
      relOpcoes := relOpcoes + [oiImpContasSemVinculo];
    if _LerConfiguracoesRegistroBoolean('ImpRegistroSemValor', True) then
      relOpcoes := relOpcoes + [oiImpRegistroSemValor];
  finally
    dataSet.EnableControls;
  end;
end;

procedure TDREComparativo.montarDepesas(pBalDre: string);
var
  I: Integer;
  vEstr: string;
  vValorReal: Double;
  vValorCNT: Double;
begin
  buscas.Close;
  buscas.SQL.Text :=
    ' select l.n_conta_plc, p.DESC_PLC, p.cod_cta_contabil,sum(l.valor_l) as valor, ' +
    ' sum(coalesce(l.vl_contabil,0)) valorcnt from Lancamentos l ' +
    ' inner join empresa emp on l.codigo_emp = emp.cod_empresa ' +
    ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
    ' inner join GRUPOS_CT c on p.grup_ct = c.grup_ct ' +
    ' inner join DEPART_CT d on c.cod_dep = d.cod_dep ' +
    ' where EXTRACT(month FROM '+vdtgeral+') = '+IntToStr(fMes)+
    ' and EXTRACT(YEAR FROM '+vdtgeral+') = '+IntToStr(fAno)+
    ' and (c.' + vCampoTipoCusto+ ' = ''S'' or c.' + vCampoTipoCusto+ ' = ''E'' or (c.desc_gr like ''%INVEST%'')) ' +
    ' and l.lote is null and c.cod_dre > 0 ' +
    ' and d.cod_dep in '+vcoddemo+
    vDadosIni.IfThen(pBalDre = 'D',
    	' and l.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else l.codigo_emp end) ') +
    ' in ('+vCodEmpresasDRE+') ' +
    ' and p.ativo = 1 group by l.n_conta_plc, p.DESC_PLC, p.cod_cta_contabil '+
    ' union '+
    ' select ctr.n_conta_plc, p.DESC_PLC, p.cod_cta_contabil, ' +
    ' sum(case when (ctr.valor_pago is null or ctr.valor_pago = 0) then ctr.valor_ctp else ctr.valor_pago end) as valor, '+
    ' sum(case when ((coalesce(ctr.valor_pago,0) > 0) and (coalesce(ctr.valor_pago,0) < coalesce(ctr.vl_contabil,0))) then ' +
    '   coalesce(ctr.valor_pago,0)else coalesce(ctr.vl_contabil,0) end ) valorcnt ' +
    ' from contas_a_pagar ctr ' +
    ' inner join empresa emp on ctr.codigo_emp = emp.cod_empresa ' +
    ' inner join p_contas p on ctr.n_conta_plc = p.n_conta_plc ' +
    ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
    ' inner join DEPART_CT d on c.cod_dep = d.cod_dep '+
    ' where EXTRACT(MONTH FROM '+vdtgeralctp+') = '+IntToStr(fMes)+
    ' and EXTRACT(YEAR FROM '+vdtgeralctp+') = '+IntToStr(fAno)+
    ' and (c.' + vCampoTipoCusto+ ' = ''S'' or c.' + vCampoTipoCusto+ ' = ''E'' or (c.desc_gr like ''%INVEST%'')) ' +
    ' and (ctr.lote is not null or (ctr.datq_ctp is null and ctr.entra_previsao = ''S''))'+
    ' and c.cod_dre > 0 and d.cod_dep in '+vcoddemo+
    vDadosIni.IfThen(pBalDre = 'D',
	    ' and ctr.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp'),
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ctr.codigo_emp end) ') +
    ' in ('+vCodEmpresasDRE+') ' +
    ' and p.ativo = 1 group by ctr.n_conta_plc, p.DESC_PLC, p.cod_cta_contabil';
  buscas.Open;

  buscas.First;

  while not buscas.Eof do
  begin

    if Trim(buscas.FieldByName('COD_CTA_CONTABIL').AsString) <> '' then
    begin
      dataSet.Filter := '(not(TIPO_REL LIKE ''RECEITA%'')) and (TIPO_REL <> ''CUSTO'') and (TIPO_REL <> ''DEVOLUCAO'')' +
        ' and COD_CTA = ' + QuotedStr(Trim(buscas.FieldByName('COD_CTA_CONTABIL').AsString));
      dataSet.Filtered := True;
    end;
    if (Trim(dataSet.FieldByName('COD_CTA').AsString) = Trim(buscas.FieldByName('COD_CTA_CONTABIL').AsString)) and
      (Trim(buscas.FieldByName('COD_CTA_CONTABIL').AsString) <> '') then
    begin
      dataSet.Edit;
      dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat +
        buscas.FieldByName('VALOR').AsFloat;
      dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat +
        buscas.FieldByName('VALORCNT').AsFloat;
//      dataSet.FieldByName('DETALHES').AsString := dataSet.FieldByName('DETALHES').AsString +
//        buscas.FieldByName('n_conta_plc').AsString + ' - ' +
//        Trim(buscas.FieldByName('desc_plc').AsString) + ' - ' +
//        ' Vl Real: ' + Format('%n',[buscas.FieldByName('VALOR').AsFloat]) + ' - ' +
//        ' Vl Contabil: ' + Format('%n',[buscas.FieldByName('VALORCNT').AsFloat]) + ' - ' + #13;

      detalhesCta.dataSet.Insert;
      detalhesCta.dataSet.FieldByName('COD_CTA').AsString := dataSet.FieldByName('COD_CTA').AsString;
      detalhesCta.dataSet.FieldByName('TIPO_REL').AsString := 'OUTRAS';
      detalhesCta.dataSet.FieldByName('N_CONTA_PLC').AsString := buscas.FieldByName('N_CONTA_PLC').AsString;
      detalhesCta.dataSet.FieldByName('DESCRICAO').AsString := buscas.FieldByName('DESC_PLC').AsString;
      detalhesCta.dataSet.FieldByName('VALOR_REAL').AsFloat := buscas.FieldByName('VALOR').AsFloat;
      detalhesCta.dataSet.FieldByName('VALOR_CNT').AsFloat := buscas.FieldByName('VALORCNT').AsFloat;
      detalhesCta.dataSet.Post;

      dataSet.Post;
    end
    else
    begin
      dataSet.Insert;
      dataSet.FieldByName('COD_CTA').AsString := '';
      dataSet.FieldByName('COD_CTA').AsString := buscas.FieldByName('N_CONTA_PLC').AsString;
      dataSet.FieldByName('DESC_PLC').AsString := buscas.FieldByName('DESC_PLC').AsString;
      dataSet.FieldByName('NOME_CTA').AsString := buscas.FieldByName('DESC_PLC').AsString;
      dataSet.FieldByName('ESTRUTURADRE').AsString := '9999 - SEM VINCULO - ' + buscas.FieldByName('N_CONTA_PLC').AsString;
//      dataSet.FieldByName('DETALHES').AsString := '9999 - SEM VINCULO - ' + buscas.FieldByName('N_CONTA_PLC').AsString +
//        ' - ' + buscas.FieldByName('DESC_PLC').AsString;
      dataSet.FieldByName('VALOR_REAL').AsFloat := buscas.FieldByName('VALOR').AsFloat;
      dataSet.FieldByName('VALOR_CNT').AsFloat := buscas.FieldByName('VALORCNT').AsFloat;
      dataSet.Post;
    end;
    buscas.Next;
  end;
  dataSet.Filter := '';
  dataSet.Filtered := False;

  //somando os grupos
  for I := dataSet.RecordCount downto 1 do
  begin
    dataSet.RecNo := I;
    vEstr:= dataSet.FieldByName('ESTRUTURADRE').AsString;
    //verificando se possui niveis abaixo para somar
    if Pos('9999 - SEM VINCULO -', vEstr) = 0 then
    begin
      if (dataSet.FieldByName('VALOR_REAL').AsFloat > 0) or (dataSet.FieldByName('VALOR_CNT').AsFloat > 0) then//valor para somar no grupo
      begin
        if Trim(dataSet.FieldByName('SINAL').AsString) = '-' then
        begin
          dataSet.Edit;
          dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat * (-1);
          dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat * (-1);
          dataSet.Post;
        end;
        if vDadosIni.PosEnd('.', vEstr) > 0 then
        begin
          vValorReal := dataSet.FieldByName('VALOR_REAL').AsFloat;
          vValorCNT := dataSet.FieldByName('VALOR_CNT').AsFloat;
          dataSet.Filter := 'ESTRUTURADRE = ' + QuotedStr(Copy(vEstr, 1, vDadosIni.PosEnd('.', vEstr) - 1));
          dataSet.Filtered := True;
          if not dataSet.IsEmpty then
          begin
            dataSet.Edit;
            dataSet.FieldByName('GRUPO_REAL').AsFloat := dataSet.FieldByName('GRUPO_REAL').AsFloat + vValorReal;
            dataSet.FieldByName('GRUPO_CNT').AsFloat := dataSet.FieldByName('GRUPO_CNT').AsFloat + vValorCNT;
            if Trim(dataSet.FieldByName('FORMULA').AsString) <> '' then
              dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString + 'REGISTRO GRUPO COM FORMULA ';
            if Trim(dataSet.FieldByName('SOMARGRUPO').AsString) = 'N' then
              dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString + 'REGISTRO DEFINIDO SEM SOMA ';
            dataSet.Post;
          end
          else
          begin
            dataSet.Filtered := False;
            dataSet.RecNo := I;
            dataSet.Edit;
            dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString + 'REGISTRO DETALHE SEM GRUPO PARA SOMAR';
            dataSet.Post;
          end;
          dataSet.Filtered := False;
          dataSet.RecNo := I;
        end;
        if (Trim(dataSet.FieldByName('FORMULA').AsString) <> '') or
          (Trim(dataSet.FieldByName('SINAL').AsString) = '-') then
        begin
          dataSet.Edit;
          if (Trim(dataSet.FieldByName('FORMULA').AsString) <> '') then
            dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString + 'REGISTRO DETALHE COM FORMULA ';
          if (Trim(dataSet.FieldByName('SINAL').AsString) = '-') then
            dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString  + 'REGISTRO DETALHE SINAL NEGATIVO ';
          dataSet.Post;
        end;
        dataSet.Filtered := False;
        dataSet.RecNo := I;
      end;


      if ((dataSet.FieldByName('GRUPO_REAL').AsFloat > 0) or (dataSet.FieldByName('GRUPO_CNT').AsFloat > 0)) then
      begin
        if Trim(dataSet.FieldByName('SINAL').AsString) = '-' then
        begin
          dataSet.Edit;
          dataSet.FieldByName('GRUPO_REAL').AsFloat := dataSet.FieldByName('GRUPO_REAL').AsFloat * (-1);
          dataSet.FieldByName('GRUPO_CNT').AsFloat := dataSet.FieldByName('GRUPO_CNT').AsFloat * (-1);
          dataSet.Post;
        end;
        if vDadosIni.PosEnd('.', vEstr) > 0 then
        begin
          vValorReal := dataSet.FieldByName('GRUPO_REAL').AsFloat;
          vValorCNT := dataSet.FieldByName('GRUPO_CNT').AsFloat;
          dataSet.Filter := 'ESTRUTURADRE = ' + QuotedStr(Copy(vEstr, 1, vDadosIni.PosEnd('.', vEstr) - 1));
          dataSet.Filtered := True;
          if (not dataSet.IsEmpty) and
            (dataSet.FieldByName('SOMARGRUPO').AsString <> 'N') and
            (Trim(dataSet.FieldByName('FORMULA').AsString) = '') then
          begin
            dataSet.Edit;
            dataSet.FieldByName('GRUPO_REAL').AsFloat := dataSet.FieldByName('GRUPO_REAL').AsFloat + vValorReal;
            dataSet.FieldByName('GRUPO_CNT').AsFloat := dataSet.FieldByName('GRUPO_CNT').AsFloat + vValorCNT;
            dataSet.Post;
          end
          else if (dataSet.IsEmpty) and
            (dataSet.FieldByName('SOMARGRUPO').AsString <> 'N') and
            (Trim(dataSet.FieldByName('FORMULA').AsString) = '') then
          begin
            dataSet.Filtered := False;
            dataSet.RecNo := I;
            dataSet.Edit;
            dataSet.FieldByName('ALERTA').AsString := dataSet.FieldByName('ALERTA').AsString + 'REGISTRO GRUPO SEM DESTINO';
            dataSet.Post;
          end;
          dataSet.Filtered := False;
          dataSet.RecNo := I;
        end;
      end;
    end;
  end;
end;

function TDREComparativo.montarDREComparativo(PBalDre: string): Boolean;
var
  I: Integer;
begin
  try
    dataSet.DisableControls;
    if (fMes = 0) or (fAno = 0) then
    begin
      Application.MessageBox('Mês ou Ano não informado(s)', 'Confirmação', MB_OK);
      result:=false;
      exit;
    end;
    if (fMes > 12) or (fMes < 0) or (fAno < 2007)  then
    begin
      Application.MessageBox('Mês ou Ano Inválido(s)', 'Confirmação', MB_OK);
      result:=false;
      exit;
    end;

    vDadosIni.progressoFuncao('Comparativo DRE', 'Processo comparativo', 'Iniciando registros');

    iniciaVariaveis;

    montarReceitasCustosDevolucoes(PBalDre);

    montarDepesas(PBalDre);

    //aplicando as formulas

    dataSet.Filter := 'FORMULA <> '''' ';
    dataSet.Filtered := True;
    for I := 1 to dataSet.RecordCount do
    begin
      dataSet.Filter := 'FORMULA <> '''' ';
      dataSet.Filtered := True;
      dataSet.RecNo := I;

      if (Trim(dataSet.FieldByName('FORMULAAPL').AsString) <> 'S') then
        aplicaFormulaRegistroAtual;
    end;
    dataSet.Filtered := False;
  finally
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
    vDadosIni.finalizaProgresso;
  end;
end;

procedure TDREComparativo.montarReceitasCustosDevolucoes(PBalDre: string);
var
  I, L: Integer;
begin
  somarVendasImpostosEContribuicoes(PBalDre);
  CadVendas.vdat1 := StartOfTheMonth(vMes);
  CadVendas.vdat2 := EndOfTheMonth(vMes);
  CadVendas.vmesvendas := fMes;
  CadVendas.vanovendas := fAno;
  cadvendas.vmesor := fMes;
  CadVendas.vtippesq := 'M';
  CadVendas.vcoddemo := vcoddemo;
  CadVendas.vVendasCNT := 'S';

  CadVendas.vendasGerais(vCodEmpresasDRE, PBalDre);
  CadVendas.vendasGeraisCNT(vCodEmpresasDRE, PBalDre);
  dataSet.Filter := 'TIPO_REL LIKE ''RECEITA%'' OR TIPO_REL = ''CUSTO'' OR TIPO_REL = ''DEVOLUCAO'' OR TIPO_REL LIKE ''CR%'' OR TIPO_REL LIKE ''DB%''';
  dataSet.Filtered := True;
  dataSet.First;
  while not dataSet.Eof do
  begin
    dataSet.Edit;
    if Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA P' then
    begin
      for I := 0 to 11 do
        dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['REQ', 'OSP']),
            StrToFloat(CadVendas.VendaporMod[I, 1]) - StrToFloat(CadVendas.VendaporMod[I, 2]), 0);

      for I := 0 to 13 do
        dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFP', 'CPP', 'NFPS', 'CPPS', 'NFO']),
            StrToFloat(CadVendas.VendaporModCNT[I, 1]) - StrToFloat(CadVendas.VendaporModCNT[I, 2]), 0);
    end
    else if Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA S' then
    begin
      for I := 0 to 11 do
        dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['OSS', 'OST', 'OSPT']),
            StrToFloat(CadVendas.VendaporMod[I, 1]) - StrToFloat(CadVendas.VendaporMod[I, 2]), 0);

      for I := 0 to 13 do
        dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFS', 'CPS']),
            StrToFloat(CadVendas.VendaporModCNT[I, 1]) - StrToFloat(CadVendas.VendaporModCNT[I, 2]), 0);
    end
    else if Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA V' then
    begin
      for I := 0 to 11 do
        dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['VEI', 'VEIU']),
            StrToFloat(CadVendas.VendaporMod[I, 1]) - StrToFloat(CadVendas.VendaporMod[I, 2]), 0);

      for I := 0 to 13 do
        dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFVN', 'NFVU']),
            StrToFloat(CadVendas.VendaporModCNT[I, 1]) - StrToFloat(CadVendas.VendaporModCNT[I, 2]), 0);
    end
    else if Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'CUSTO' then
    begin
      for I := 0 to 11 do
      begin
        dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['REQ', 'OSP', 'OSS', 'OST', 'OSPT', 'VEI', 'VEIU']),
            StrToFloat(CadVendas.VendaporMod[I, 3]), 0);
        dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat -
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['DEVP', 'DEVVN', 'DEVVU']),
            StrToFloat(CadVendas.VendaporMod[I, 3]), 0);
      end;

      for I := 0 to 13 do
      begin
        dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFP', 'CPP', 'NFPS', 'CPPS', 'NFO', 'NFS', 'CPS', 'NFVN', 'NFVU']),
            StrToFloat(CadVendas.VendaporModCNT[I, 3]), 0);
        dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat -
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['DEVNFP', 'DEVNFVN', 'DEVNFVU']),
            StrToFloat(CadVendas.VendaporModCNT[I, 3]), 0);
      end;
    end
    else if Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'DEVOLUCAO' then
    begin
      for I := 0 to 11 do
        dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['DEVP', 'DEVVN', 'DEVVU']),
            StrToFloat(CadVendas.VendaporMod[I, 1]) - StrToFloat(CadVendas.VendaporMod[I, 2]), 0);

      for I := 0 to 13 do
        dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['DEVNFP', 'DEVNFVN', 'DEVNFVU']),
            StrToFloat(CadVendas.VendaporModCNT[I, 1]) - StrToFloat(CadVendas.VendaporModCNT[I, 2]), 0);
    end
    else if vDadosIni.strEstaContidoEm(Trim(dataSet.FieldByName('TIPO_REL').AsString),
      ['CR PIS', 'CR COFINS', 'CR ICMS', 'DB PIS', 'DB COFINS', 'DB ICMS']) then
    begin
        for I := 0 to 5 do
        begin
          dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat +
            vDadosIni.retornoPorCondicao(
              fValorContribuicaoImpostos[i, 0] = (Trim(dataSet.FieldByName('TIPO_REL').AsString)),
              StrToFloat(fValorContribuicaoImpostos[I, 1]), 0);
          dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat +
            vDadosIni.retornoPorCondicao(
              fValorContribuicaoImpostos[i, 0] = (Trim(dataSet.FieldByName('TIPO_REL').AsString)),
              StrToFloat(fValorContribuicaoImpostos[I, 1]), 0);
        end;
    end
    else// if Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA' then// RECEITA GERAL
    begin
      for I := 0 to 11 do
        dataSet.FieldByName('VALOR_REAL').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['REQ', 'OSP', 'OSS', 'OST', 'OSPT', 'VEI', 'VEIU']),
            StrToFloat(CadVendas.VendaporMod[I, 1]) - StrToFloat(CadVendas.VendaporMod[I, 2]), 0);

      for I := 0 to 13 do
        dataSet.FieldByName('VALOR_CNT').AsFloat := dataSet.FieldByName('VALOR_CNT').AsFloat +
          vDadosIni.retornoPorCondicao(
            vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFP', 'CPP', 'NFPS', 'CPPS', 'NFO', 'NFS', 'CPS', 'NFVN', 'NFVU']),
            StrToFloat(CadVendas.VendaporModCNT[I, 1]) - StrToFloat(CadVendas.VendaporModCNT[I, 2]), 0);
    end;
    for I := 0 to 11 do
    begin
      if ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA P') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['REQ', 'OSP']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA S') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['OSS', 'OST', 'OSPT']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA V') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['VEI', 'VEIU']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'CUSTO') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['REQ', 'OSP', 'OSS', 'OST', 'OSPT', 'VEI', 'VEIU', 'DEVP', 'DEVVN', 'DEVVU']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'DEVOLUCAO') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['DEVP', 'DEVVN', 'DEVVU']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA' ) and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['REQ', 'OSP', 'OSS', 'OST', 'OSPT', 'VEI', 'VEIU']))) then
      begin
        detalhesCta.dataSet.Insert;
        detalhesCta.dataSet.FieldByName('COD_CTA').AsString := dataSet.FieldByName('COD_CTA').AsString;
        detalhesCta.dataSet.FieldByName('TIPO_REL').AsString := Trim(dataSet.FieldByName('TIPO_REL').AsString);
        detalhesCta.dataSet.FieldByName('DESCRICAO').AsString := CadVendas.VendaporMod[i, 0];
        if Trim(detalhesCta.dataSet.FieldByName('TIPO_REL').AsString) = 'CUSTO' then
          detalhesCta.dataSet.FieldByName('VALOR_REAL').AsFloat := StrToFloat(CadVendas.VendaporMod[I, 3]) *
            vDadosIni.retornoPorCondicao(vDadosIni.strEstaContidoEm(CadVendas.VendaporMod[i, 0], ['DEVP', 'DEVVN', 'DEVVU']), (-1), 1)
        else
          detalhesCta.dataSet.FieldByName('VALOR_REAL').AsFloat := StrToFloat(CadVendas.VendaporMod[I, 1]) - StrToFloat(CadVendas.VendaporMod[I, 2]);
        if detalhesCta.dataSet.FieldByName('VALOR_REAL').AsFloat = 0 then
          detalhesCta.dataSet.Cancel
        else
          detalhesCta.dataSet.Post;
      end;
    end;
    for I := 0 to 13 do
    begin
      if ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA P') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFP', 'CPP', 'NFPS', 'CPPS', 'NFO']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA S') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFS', 'CPS']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA V') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFVN', 'NFVU']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'CUSTO') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFP', 'CPP', 'NFPS', 'CPPS', 'NFO', 'NFS', 'CPS', 'NFVN', 'NFVU', 'DEVNFP', 'DEVNFVN', 'DEVNFVU']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'DEVOLUCAO') and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['DEVNFP', 'DEVNFVN', 'DEVNFVU']))) or
        ((Trim(dataSet.FieldByName('TIPO_REL').AsString) = 'RECEITA' ) and
        (vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['NFP', 'CPP', 'NFPS', 'CPPS', 'NFO', 'NFS', 'CPS', 'NFVN', 'NFVU']))) then
      begin
        detalhesCta.dataSet.Insert;
        detalhesCta.dataSet.FieldByName('COD_CTA').AsString := dataSet.FieldByName('COD_CTA').AsString;
        detalhesCta.dataSet.FieldByName('TIPO_REL').AsString := Trim(dataSet.FieldByName('TIPO_REL').AsString);
        detalhesCta.dataSet.FieldByName('DESCRICAO').AsString := CadVendas.VendaporModCNT[i, 0];
        if Trim(detalhesCta.dataSet.FieldByName('TIPO_REL').AsString) = 'CUSTO' then
          detalhesCta.dataSet.FieldByName('VALOR_CNT').AsFloat := StrToFloat(CadVendas.VendaporModCNT[I, 3]) *
            vDadosIni.retornoPorCondicao(vDadosIni.strEstaContidoEm(CadVendas.VendaporModCNT[i, 0], ['DEVNFP', 'DEVNFVN', 'DEVNFVU']), (-1), 1)
        else
          detalhesCta.dataSet.FieldByName('VALOR_CNT').AsFloat := StrToFloat(CadVendas.VendaporModCNT[I, 1]) - StrToFloat(CadVendas.VendaporModCNT[I, 2]);
        if detalhesCta.dataSet.FieldByName('VALOR_CNT').AsFloat = 0 then
          detalhesCta.dataSet.Cancel
        else
          detalhesCta.dataSet.Post;
      end;
    end;
    dataSet.Post;
    dataSet.Next;
  end;
end;

procedure TDREComparativo.relatorioComparativo;
var
  rel: TRDPrint;
  vSomaContaSemVinculo: Currency;
  vMaxEstrutura, vMaxContaCTB, vMaxDescrCTB, vMaxDescrFin, vMaxDigFracContaFin,
    vMaxDigInteiroContaFin, vMaxVL, vMaxColuna, vIntTmp: Smallint;
  vPosEstrutura, vPosContaCTB, vPosDescCTB, vPosValores: Smallint;
  vImpDuasLinhas, vOK, vTituloSemVinculo: Boolean;
  vTemp: string;
  vlinha: Integer;
  vValorCNTTmp, vValorRealTmp: Currency;

  procedure definirTamanhoEposicaoColunas;
  begin
    //definindo tamanho das colunas
    vMaxEstrutura := 0;
    vMaxContaCTB := 0;
    vMaxDescrCTB := 0;
    vMaxDescrFin := 0;
    vMaxDigFracContaFin := 0;
    vMaxDigInteiroContaFin := 0;
    vMaxVL := 0;
    vImpDuasLinhas := (oiImpRegistrosFIN in relOpcoes);

    dataSet.First;
    while not dataSet.Eof do
    begin
      if Pos('9999 - SEM VINCULO - ', dataSet.FieldByName('ESTRUTURADRE').AsString) = 0 then
        if (oiImpEstrutura in relOpcoes) and (Length(dataSet.FieldByName('ESTRUTURADRE').AsString) > vMaxEstrutura) then
          vMaxEstrutura := Length(dataSet.FieldByName('ESTRUTURADRE').AsString);
      if (oiImpContaCTB in relOpcoes) and (Length(dataSet.FieldByName('COD_CTA').AsString) > vMaxContaCTB) then
        vMaxContaCTB := Length(dataSet.FieldByName('COD_CTA').AsString);
      if (Length(dataSet.FieldByName('NOME_CTA').AsString) > vMaxDescrCTB) then
        vMaxDescrCTB := Length(dataSet.FieldByName('NOME_CTA').AsString);
      if (Length(Format('%0.2n', [dataSet.FieldByName('VALOR_REAL').AsFloat])) > vMaxVL) then
        vMaxVL:= Length(Format('%0.2n', [dataSet.FieldByName('VALOR_REAL').AsFloat]));
      if (Length(Format('%0.2n', [dataSet.FieldByName('VALOR_CNT').AsFloat])) > vMaxVL) then
        vMaxVL:= Length(Format('%0.2n', [dataSet.FieldByName('VALOR_CNT').AsFloat]));
      if (Length(Format('%0.2n', [dataSet.FieldByName('GRUPO_REAL').AsFloat])) > vMaxVL) then
        vMaxVL:= Length(Format('%0.2n', [dataSet.FieldByName('GRUPO_REAL').AsFloat]));
      if (Length(Format('%0.2n', [dataSet.FieldByName('GRUPO_CNT').AsFloat])) > vMaxVL) then
        vMaxVL:= Length(Format('%0.2n', [dataSet.FieldByName('GRUPO_CNT').AsFloat]));
      dataSet.Next;
    end;

    if oiImpRegistrosFIN in relOpcoes then
    begin
      fDetalhesCta.dataSet.Filter := '';
      fDetalhesCta.dataSet.Filtered := False;
      fDetalhesCta.dataSet.First;
      while not fDetalhesCta.dataSet.Eof do
      begin
        if fDetalhesCta.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
        begin
          if (Length(fDetalhesCta.dataSet.FieldByName('DESCRICAO').AsString) > vMaxDescrFin) then
            vMaxDescrFin := Length(fDetalhesCta.dataSet.FieldByName('DESCRICAO').AsString);
          //descobrindo a qtde de casas decimais da  conta financeira
          vTemp := FloatToStr(Frac(StrToFloat(fDetalhesCta.dataSet.FieldByName('N_CONTA_PLC').AsString)));
          if (Length(vTemp) - 2) > vMaxDigFracContaFin then
            vMaxDigFracContaFin := Length(vTemp) - 2;
          vTemp := IntToStr(Trunc(fDetalhesCta.dataSet.FieldByName('N_CONTA_PLC').AsFloat));
          if (Length(vTemp)) > vMaxDigInteiroContaFin then
            vMaxDigInteiroContaFin := Length(vTemp);
          if (Length(Format('%0.2n', [fDetalhesCta.dataSet.FieldByName('VALOR_REAL').AsFloat])) > vMaxVL) then
            vMaxVL:= Length(Format('%0.2n', [fDetalhesCta.dataSet.FieldByName('VALOR_REAL').AsFloat]));
          if (Length(Format('%0.2n', [fDetalhesCta.dataSet.FieldByName('VALOR_CNT').AsFloat])) > vMaxVL) then
            vMaxVL:= Length(Format('%0.2n', [fDetalhesCta.dataSet.FieldByName('VALOR_CNT').AsFloat]));
        end;
        fDetalhesCta.dataSet.Next;
      end;
    end;

    vPosEstrutura := 0;
    vPosContaCTB := 0;
    vPosDescCTB := 0;
    vPosValores := 0;
    vMaxColuna := 0;
    if vImpDuasLinhas then
    begin
      if vMaxDescrFin > vMaxDescrCTB then
        vMaxDescrCTB := vMaxDescrFin;

      if vMaxEstrutura > 0 then
      begin
        vMaxColuna := vMaxColuna + vMaxEstrutura + 2;
        vPosEstrutura := 1;
      end;

      if vMaxContaCTB > 0 then
      begin
        if vMaxColuna > 0 then
          vPosContaCTB := vMaxColuna
        else
          vPosContaCTB := 1;
        if (vMaxDigFracContaFin + vMaxDigInteiroContaFin  + 1) > vMaxContaCTB then
          vMaxColuna := vMaxColuna + vMaxDigFracContaFin + vMaxDigInteiroContaFin  + 1 + 2
        else
          vMaxColuna := vMaxColuna + vMaxContaCTB + 2;
      end;
      if vMaxDescrCTB > 0 then
      begin
        if vMaxColuna > 0 then
          vPosDescCTB := vMaxColuna
        else
          vPosDescCTB := 1;
        if (vMaxDescrFin + (fMaxNivel * 2)) > vMaxDescrCTB then
          vMaxColuna := vMaxColuna + vMaxDescrFin + (fMaxNivel * 2) + 2
        else
          vMaxColuna := vMaxColuna + vMaxDescrCTB + 2;
      end;

      vPosValores := vMaxColuna;
      vMaxColuna := vMaxColuna + (vMaxVL  * 4) + 8;
//      if vMaxColuna < 80 then
//        vMaxColuna := 80;
    end
    else
    begin
      if vMaxEstrutura > 0 then
      begin
        vMaxColuna := vMaxColuna + vMaxEstrutura + 2;
        vPosEstrutura := 1;
      end;

      if vMaxContaCTB > 0 then
      begin
        if vMaxColuna > 0 then
          vPosContaCTB := vMaxColuna
        else
          vPosContaCTB := 1;
        vMaxColuna := vMaxColuna + vMaxContaCTB + 2;
      end;

      if vMaxDescrCTB > 0 then
      begin
        if vMaxColuna > 0 then
          vPosDescCTB := vMaxColuna
        else
          vPosDescCTB := 1;
        vMaxColuna := vMaxColuna + vMaxDescrCTB + 2;
      end;

      vPosValores := vMaxColuna;
      vMaxColuna := vMaxColuna + (vMaxVL  * 4) + 8;
    end;
  end;

  procedure novaPagina;
  begin
    vlinha := 1;
    rel.ImpF(vlinha, 1, vDadosIni.Replicate('=', rel.TamanhoQteColunas), []);
    vlinha := vlinha + 1;

    if oiImpEstrutura in relOpcoes then
      rel.ImpF(vlinha, vPosEstrutura, Copy('Estrutura', 1, vMaxEstrutura), []);
    if oiImpContaCTB in relOpcoes then
      rel.ImpF(vlinha, vPosContaCTB, Copy('Conta', 1, vMaxContaCTB), []);
    rel.ImpF(vlinha, vPosDescCTB, Copy('Descricao', 1, vMaxDescrCTB), []);
    rel.ImpF(vlinha, vPosValores, vDadosIni.Space(Copy('Grupo Financeiro', 1, vMaxVL),vMaxVL, True), []);
    rel.ImpF(vlinha, vPosValores + vMaxVL +  2, vDadosIni.Space(Copy('Grupo CNT', 1, vMaxVL),vMaxVL, True), []);
    rel.ImpF(vlinha, vPosValores + ((vMaxVL + 2) * 2), vDadosIni.Space(Copy('Valor Financeiro', 1, vMaxVL),vMaxVL, True), []);
    rel.ImpF(vlinha, vPosValores + ((vMaxVL + 2) * 3), vDadosIni.Space(Copy('Valor CNT', 1, vMaxVL),vMaxVL, True), []);
    vlinha := vlinha + 1;

    rel.ImpF(vlinha, 1, vDadosIni.Replicate('-', rel.TamanhoQteColunas), []);
    vlinha := vlinha + 1;
  end;

  function formatValor(pValor: Double): string;
  begin
    Result := Format('%0.2n', [pValor]);
    if Length(Result) < vMaxVL then
      Result := vDadosIni.Space(Result, vMaxVL, True);
  end;

begin
  _GravaConfiguracoesBoolean( 'ImpEstrutura', oiImpEstrutura in relOpcoes);
  _GravaConfiguracoesBoolean( 'ImpContaContabil', oiImpContaCTB in relOpcoes);
  _GravaConfiguracoesBoolean( 'ImpRegistrosFinanceiros', oiImpRegistrosFIN in relOpcoes);
  _GravaConfiguracoesBoolean( 'EspacoEntreDetalhes', oiEspacoEntreDetalhes in relOpcoes);
  _GravaConfiguracoesBoolean( 'ImpContasSemVinculo', oiImpContasSemVinculo in relOpcoes);
  _GravaConfiguracoesBoolean( 'ImpRegistroSemValor', oiImpRegistroSemValor in relOpcoes);

  rel := TRDprint.Create(Application);
  dataSet.DisableControls;
  fDetalhesCta.dataSet.DisableControls;
  try
    rel.CaptionSetup := 'Opções de Impressão';
    if not vDadosIni.ModImp(rel) then
      exit;

    rel.OpcoesPreview.Remalina := True;
    rel.TamanhoQteColunas := 80;
    rel.TamanhoQteLinhas := 66;
    rel.FonteTamanhoPadrao := S20cpp;
    rel.OpcoesPreview.Preview := True;

    if rel.EstaAberto then
      rel.Abortar;

    dataSet.Filter := '';
    dataSet.Filtered := False;
    vSomaContaSemVinculo:= 0;

    definirTamanhoEposicaoColunas;
    rel.TamanhoQteColunas := vMaxColuna;
    if not rel.EstaAberto then
      rel.Abrir;
    novaPagina;

    vValorCNTTmp := 0;
    vValorRealTmp := 0;
    vTituloSemVinculo := False;

    dataSet.First;
    while not dataSet.Eof do
    begin

      if Pos('9999 - SEM VINCULO - ', dataSet.FieldByName('ESTRUTURADRE').AsString) = 0 then
      begin
        vOK:= (not dataSet.FieldByName('GRUPO_CNT').IsNull) or (not dataSet.FieldByName('GRUPO_REAL').IsNull) or
          (not dataSet.FieldByName('VALOR_CNT').IsNull) or (not dataSet.FieldByName('VALOR_REAL').IsNull);
        if not vOK then
          vOK := oiImpRegistroSemValor in relOpcoes;

        if vOK then
        begin

          if oiImpEstrutura in relOpcoes then
            if dataSet.FieldByName('NIVEL').AsInteger = fMaxNivel then
              rel.ImpF(vlinha, vPosEstrutura, dataSet.FieldByName('ESTRUTURADRE').AsString, [])
            else
              rel.ImpF(vlinha, vPosEstrutura, dataSet.FieldByName('ESTRUTURADRE').AsString, [negrito]);

          if oiImpContaCTB in relOpcoes then
            if dataSet.FieldByName('NIVEL').AsInteger = fMaxNivel then
              rel.ImpF(vlinha, vPosContaCTB, dataSet.FieldByName('COD_CTA').AsString, [])
            else
              rel.ImpF(vlinha, vPosContaCTB, dataSet.FieldByName('COD_CTA').AsString, [negrito]);

          if dataSet.FieldByName('NIVEL').AsInteger = fMaxNivel then
            rel.ImpF(vlinha, vPosDescCTB, dataSet.FieldByName('NOME_CTA').AsString, [])
          else
            rel.ImpF(vlinha, vPosDescCTB, dataSet.FieldByName('NOME_CTA').AsString, [negrito]);

          if (not dataSet.FieldByName('GRUPO_REAL').IsNull) then
            if dataSet.FieldByName('nivel').AsInteger = fMaxNivel then
              rel.ImpF(vlinha, vPosValores, formatValor(dataSet.FieldByName('GRUPO_REAL').AsFloat), [])
            else
              rel.ImpF(vlinha, vPosValores, formatValor(dataSet.FieldByName('GRUPO_REAL').AsFloat), [negrito]);

          if (not dataSet.FieldByName('GRUPO_CNT').IsNull) then
            if dataSet.FieldByName('nivel').AsInteger = fMaxNivel then
              rel.ImpF(vlinha, vPosValores + vMaxVL +  2, formatValor(dataSet.FieldByName('GRUPO_CNT').AsFloat), [])
            else
              rel.ImpF(vlinha, vPosValores + vMaxVL +  2, formatValor(dataSet.FieldByName('GRUPO_CNT').AsFloat), [negrito]);

          if (not dataSet.FieldByName('VALOR_REAL').IsNull) then
            if dataSet.FieldByName('nivel').AsInteger = fMaxNivel then
              rel.ImpF(vlinha, vPosValores + ((vMaxVL + 2) * 2), formatValor(dataSet.FieldByName('VALOR_REAL').AsFloat), [])
            else
              rel.ImpF(vlinha, vPosValores + ((vMaxVL + 2) * 2), formatValor(dataSet.FieldByName('VALOR_REAL').AsFloat), [negrito]);

          if (not dataSet.FieldByName('VALOR_CNT').IsNull) then
            if dataSet.FieldByName('nivel').AsInteger = fMaxNivel then
              rel.ImpF(vlinha, vPosValores + ((vMaxVL + 2) * 3), formatValor(dataSet.FieldByName('VALOR_CNT').AsFloat), [])
            else
              rel.ImpF(vlinha, vPosValores + ((vMaxVL + 2) * 3), formatValor(dataSet.FieldByName('VALOR_CNT').AsFloat), [negrito]);

          if vlinha >= (rel.TamanhoQteLinhas - 2) then
          begin
            rel.ImpF(rel.TamanhoQteLinhas, 1, vDadosIni.Replicate('-', rel.TamanhoQteColunas), []);
            rel.Novapagina;
            novaPagina;
          end
          else
            vlinha := vlinha + 1;
          if oiImpRegistrosFIN in relOpcoes then
          begin
            detalhesCta.dataSet.Filter := 'COD_CTA = ' + QuotedStr(dataSet.FieldByName('COD_CTA').AsString);
            detalhesCta.dataSet.Filtered := True;
            detalhesCta.dataSet.First;
            while not detalhesCta.dataSet.Eof do
            begin
              if (oiImpContaCTB in relOpcoes) and (detalhesCta.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0) then
                rel.ImpF(vlinha, vPosContaCTB, Format( '%0.'+ IntToStr(vMaxDigFracContaFin) + 'f',
                [detalhesCta.dataSet.FieldByName('N_CONTA_PLC').AsFloat]), []);
              rel.ImpF(vlinha, vPosDescCTB, '  ' + vDadosIni.Space((dataSet.FieldByName('nivel').AsInteger - 1) *
                vDadosIni.retornoPorCondicao(dataSet.FieldByName('nivel').AsInteger = fMaxNivel, 3, 2)) +
                Trim(detalhesCta.dataSet.FieldByName('DESCRICAO').AsString), []);
              rel.ImpF(vlinha, vPosValores + ((vMaxVL + 2) * 2), formatValor(detalhesCta.dataSet.FieldByName('VALOR_REAL').AsFloat), []);
              rel.ImpF(vlinha, vPosValores + ((vMaxVL + 2) * 3), formatValor(detalhesCta.dataSet.FieldByName('VALOR_CNT').AsFloat), []);
              if vlinha >= (rel.TamanhoQteLinhas - 2) then
              begin
                rel.ImpF(rel.TamanhoQteLinhas, 1, vDadosIni.Replicate('-', rel.TamanhoQteColunas), []);
                rel.Novapagina;
                novaPagina;
              end
              else
                vlinha := vlinha + 1;
              detalhesCta.dataSet.Next;
            end;
          end;  
          if oiEspacoEntreDetalhes in relOpcoes then
            vlinha := vlinha + 1;
        end;
      end
      else if oiImpContasSemVinculo in relOpcoes then
      begin
        if not vTituloSemVinculo then
        begin
          vTituloSemVinculo := True;
          if (vlinha + 3 ) >= (rel.TamanhoQteLinhas - 2)  then
          begin
            rel.ImpF(rel.TamanhoQteLinhas, 1, vDadosIni.Replicate('-', rel.TamanhoQteColunas), []);
            novaPagina;
          end
          else
            vlinha := vlinha + 1;
          rel.ImpC(vlinha, Trunc(rel.TamanhoQteColunas / 2), ' --- CONTAS SEM VINCULO ---', []);
          vlinha := vlinha + 2;
        end;

        //if oiImpEstrutura in relOpcoes then
          //rel.ImpF(vlinha, vPosEstrutura, dataSet.FieldByName('ESTRUTURADRE').AsString, []);

        if oiImpContaCTB in relOpcoes then
          rel.ImpF(vlinha, vPosContaCTB, dataSet.FieldByName('COD_CTA').AsString, []);

        rel.ImpF(vlinha, vPosDescCTB, dataSet.FieldByName('NOME_CTA').AsString, []);

        if (not dataSet.FieldByName('VALOR_REAL').IsNull) then
          rel.ImpF(vlinha, vPosValores, formatValor(dataSet.FieldByName('VALOR_REAL').AsFloat), []);

        if (not dataSet.FieldByName('VALOR_CNT').IsNull) then
          rel.ImpF(vlinha, vPosValores + vMaxVL +  2, formatValor(dataSet.FieldByName('VALOR_CNT').AsFloat), []);

        vValorCNTTmp := vValorCNTTmp + dataSet.FieldByName('VALOR_CNT').AsFloat;
        vValorRealTmp := vValorRealTmp + dataSet.FieldByName('VALOR_REAL').AsFloat;
        
        if vlinha >= (rel.TamanhoQteLinhas - 2) then
        begin
          rel.ImpF(rel.TamanhoQteLinhas, 1, vDadosIni.Replicate('-', rel.TamanhoQteColunas), []);
          rel.Novapagina;
          novaPagina;
        end
        else
          vlinha := vlinha + 1;
      end;

      dataSet.Next;
    end;

    if oiImpContasSemVinculo in relOpcoes then
    begin
      if (vlinha + 3 ) >= (rel.TamanhoQteLinhas - 2)  then
      begin
        rel.ImpF(rel.TamanhoQteLinhas, 1, vDadosIni.Replicate('-', rel.TamanhoQteColunas), []);
        rel.Novapagina;
        novaPagina;
      end
      else
        vlinha := vlinha + 1;
      rel.ImpF(vlinha, vPosDescCTB, vDadosIni.Space('Total sem vinculo: ', vMaxDescrCTB, True),[]);
      rel.ImpF(vlinha, vPosValores, formatValor(vValorRealTmp), []);
      rel.ImpF(vlinha, vPosValores + vMaxVL +  2, formatValor(vValorCNTTmp), []);
      vlinha := vlinha + 1;
    end
    else
      vlinha := vlinha + 1;

    if (vlinha) < (rel.TamanhoQteLinhas)  then
      rel.ImpF(rel.TamanhoQteLinhas, 1, vDadosIni.Replicate('-', rel.TamanhoQteColunas), []);

    rel.Fechar;
  finally
    fDetalhesCta.dataSet.EnableControls;
    dataSet.EnableControls;
    rel.Free;
    rel := nil;
  end;
end;

procedure TDREComparativo.setCorPersonalizadaFonte(pNivel: Integer; pColor: TColor);
begin
  vDadosIni._GravaConfiguracoesString('DRECorPersonalisadaFonteNivel' + IntToStr(pNivel), IntToStr(pColor));

  try fCorPersonalizadaFonte[pNivel - 1] := pColor; except end;
end;

procedure TDREComparativo.setCorPersonalizadaFundo(pNivel: Integer; pColor: TColor);
begin
  vDadosIni._GravaConfiguracoesString('DRECorPersonalisadaFundoNivel' + IntToStr(pNivel), IntToStr(pColor));

  try fCorPersonalizadaFundo[pNivel - 1] := pColor; except end;
end;

procedure TDREComparativo.somarVendasImpostosEContribuicoes(PBalDre: string);
var
  I: Integer;
begin
  SetLength(fValorContribuicaoImpostos, 6, 2);
  fValorContribuicaoImpostos[0, 0] := 'CR PIS';
  fValorContribuicaoImpostos[1, 0] := 'CR COFINS';
  fValorContribuicaoImpostos[2, 0] := 'CR ICMS';
  fValorContribuicaoImpostos[3, 0] := 'DB PIS';
  fValorContribuicaoImpostos[4, 0] := 'DB COFINS';
  fValorContribuicaoImpostos[5, 0] := 'DB ICMS';
  for I := 0 to 5 do
    fValorContribuicaoImpostos[I, 1] := '0';

  buscas.Close;
  buscas.SQL.Text :=
    'select nf.natureza_nf Deb_Cred,' +
    ' sum( case when (nf.natureza_nf = ''S'' and nt.receita_pis_cofins = ''S'') then nfi.valor_pis' +
    ' when (nf.natureza_nf = ''E'' and nt.credito_pis_cofins = ''S'') then nfi.valor_pis' +
    ' else 0 end) valor_pis,' +
    ' sum( case when (nf.natureza_nf = ''S'' and nt.receita_pis_cofins = ''S'') then nfi.valor_cofins' +
    ' when (nf.natureza_nf = ''E'' and nt.credito_pis_cofins = ''S'') then nfi.valor_cofins' +
    ' else 0 end) valor_cofins, sum(nfi.valor_icm) valor_icms from notafiscal nf' +
    ' inner join empresa emp on nf.cod_empresa = emp.cod_empresa ' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
    ' inner join nat_op nt on nt.codigo_nop = nfi.codigo_nop' +
    ' where nf.data_lanc >= :DATA1 and nf.data_lanc <= :DATA2 and nf.status = ''Fechada'' and coalesce(nf.da, ''N'') <> ''S''' +
    ' and ( (nf.emissao_propria = ''S'' and nf.modelo_nf = ''55'' and coalesce(nf.situacao_nfe,'''') = ''Autorizada'' )' +
    ' or (nf.emissao_propria = ''S'' and nf.modelo_nf <> ''55'') or (nf.emissao_propria = ''N''))' +
    vDadosIni.IfThen(PBalDre = 'D',
	    ' and nf.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else nf.cod_empresa end) ') +
    ' in (' + vCodEmpresasDRE + ')' +
    ' group by 1' +
    ' union' +
    ' select ''S'' Deb_Cred, ' +
    ' sum(coalesce(cp2.total,0)+coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0)-' +
    '   coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)) * avg(e.pis_emp) / 100 valor_pis,' +
    ' sum(coalesce(cp2.total,0)+coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0)-' +
    '   coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)) * avg(e.cofins_emp) / 100 valor_cofins,' +
    ' sum(case when (substring(cp2.descaliq from 3 for 1) = ''T'') then (cast( (substring(cp2.descaliq from 4 for 2)||''.''||substring(cp2.descaliq from 6 for 2)) as double precision)) *' +
    ' (coalesce(CP2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0) - coalesce(cp2.rat_desc,0) - coalesce(cp2.perc_desc,0) ) / 100 else 0 end) valor_icms' +
    ' from cupom cp' +
    ' inner join empresa emp on cp.cod_empresa = emp.cod_empresa ' +
    ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and cp.nserieecf = cp2.nserieecf and' +
    ' cp.cod_empresa = cp2.cod_empresa and cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
    ' inner join nat_op nt on nt.codigo_nop = cp2.codigo_nop' +
    ' inner join empresa e on e.cod_empresa = cp.cod_empresa' +
    ' where cp.data >= :DATA1 and cp.data <= :DATA2 and ((cp2.status_it <> ''CANCELADO'') or (cp2.status_it is null))' +
    ' and cp.cod_empresa in (1,2,3) and cp2.cst_pis in (''01'',''02'',''03'')' +
    vDadosIni.IfThen(PBalDre = 'D',
	    ' and cp.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cp.cod_empresa end) ') +
    ' in (' + vCodEmpresasDRE + ')' +
    ' group by 1' +
    ' union' +
    ' select ''S'' Deb_Cred, sum(ps.valor_pis), sum(ps.valor_cofins), sum(0) valor_icms from pedvenda_serv ps' +
    ' inner join empresa emp on ps.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda pv on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' inner join nat_op nt on nt.codigo_nop = ps.codigo_nop and nt.receita_pis_cofins = ''S''' +
    ' where ps.status_nfse = ''Autorizada'' and ps.emissao_nfse >= :DATA1 and ps.emissao_nfse <= :DATA2' +
    ' and pv.tipo = ''OS'' and ps.lote_nfse > 0' +
    vDadosIni.IfThen(PBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vCodEmpresasDRE + ')' +
    ' group by 1' +
    ' union' +
    ' select ''S'' Deb_Cred, sum(ps.valor_pis), sum(ps.valor_cofins), sum(0) valor_icms' +
    ' from pedvenda_serv ps' +
    ' inner join empresa emp on ps.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda pv on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
    ' inner join nat_op nt on nt.codigo_nop = ps.codigo_nop and nt.receita_pis_cofins = ''S''' +
    ' where pv.data_nfext >= :DATA1 and pv.data_nfext <= :DATA2 and pv.num_nfeext > 0 and pv.tipo = ''OS''' +
    ' and ((ps.lote_nfse = 0 ) or (ps.lote_nfse is null))' +
    vDadosIni.IfThen(PBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vCodEmpresasDRE + ')' +
    ' group by 1' +
    ' union' +
    ' select ''S'' Deb_Cred,' +
    ' sum((coalesce(pt.vl_servt,0) * coalesce(e.pis_emp,0) / 100)),' +
    ' sum((coalesce(pt.vl_servt,0) * coalesce(e.cofins_emp,0) / 100)),' +
    ' sum(0) valor_icms' +
    ' from pedvenda_serv_terc pt ' +
    ' inner join empresa emp on pt.cod_empresa = emp.cod_empresa ' +
    ' inner join pedvenda pv on pv.nped = pt.nped and pv.tipo = pt.tipo and pv.cod_empresa = pt.cod_empresa' +
    ' inner join empresa e on e.cod_empresa = pt.cod_empresa' +
    ' inner join nat_op nt on nt.codigo_nop = e.cfop_pad_serv and nt.receita_pis_cofins = ''S''' +
    ' where pv.data_nfext >= :DATA1 and pv.data_nfext <= :DATA2 and pv.num_nfeext > 0 and pv.tipo = ''OS''' +
    ' and coalesce((select count(sss.nped) from pedvenda_serv sss where sss.nped = pt.nped and sss.tipo = pt.tipo ' +
    ' and sss.cod_empresa = pt.cod_empresa and  coalesce(sss.status_nfse, '''') = ''Autorizada'' and coalesce(sss.lote_nfse,0) > 0 ),0) = 0' +
    vDadosIni.IfThen(PBalDre = 'D',
	    ' and pv.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else pv.cod_empresa end) ') +
    ' in (' + vCodEmpresasDRE + ')' +
    ' group by 1' +
    ' union' +
    ' select ''E'' Deb_Cred,' +
    ' sum( case when nt.credito_pis_cofins = ''S'' then st.valor_pis else 0 end) valor_pis,' +
    ' sum( case when nt.credito_pis_cofins = ''S'' then st.valor_cofins else 0 end) valor_cofins, sum(st.valor_icms) valor_icms' +
    ' from servico_transporte st' +
    ' inner join empresa emp on st.cod_empresa = emp.cod_empresa ' +
    ' inner join transportador t on t.codigo_tr = st.cod_transportador and t.cod_empresa = st.cod_empresa' +
    ' inner join nat_op nt on nt.codigo_nop = st.cfop' +
    ' where st.data_lancamento >= :DATA1 and st.data_lancamento <= :DATA2' +
    ' and (((st.tipo = ''E'') and (st.cif_fob_outros = 2)) or ( (st.tipo = ''S'') and (st.cif_fob_outros = 1)))' +
    vDadosIni.IfThen(PBalDre = 'D',
	    ' and st.cod_empresa ',
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else st.cod_empresa end) ') +
    ' in (' + vCodEmpresasDRE + ')' +
    ' group by 1' +
    ' union ' +
    ' select ''E'' Deb_cred,' +
    ' sum(coalesce(spu.valor_pis_util, 0)) valor_pis,' +
    ' sum(coalesce(spu.valor_cofins_util,0)) valor_cofins, 0 valor_icms' +
    ' from sped_pc_retencao_periodo_util spu' +
    ' where spu.ano_util = :ano and spu.mes_util = :mes' +
    ' union' +
    ' select ''E'' Deb_Cred,' +
    ' sum(coalesce(spc.valor_pis_util, 0)) valor_pis,' +
    ' sum(coalesce(spc.valor_cofins_util,0)) valor_cofins, 0 valor_icms' +
    ' from sped_creditos_periodo_util spc' +
    ' where spc.ano_util = :ano and spc.mes_util = :mes' +
    ' union ' +
    ' select ''E'' Deb_Cred, 0 valor_pis, 0 valor_cofins,' +
    ' sum(coalesce(' +
    '   ( select sppant.valor_icms from sped_creditos_periodo sppant' +
    '     where sppant.ano = (case when :mes = 1 then :ano - 1 else :ano end)' +
    '     and sppant.mes = (case when :mes = 1 then 12 else :mes - 1 end) and sppant.cnpj = spp.cnpj and sppant.sped = spp.sped ) ,0) - coalesce(spp.valor_icms, 0)) valor_icms' +
    ' from sped_creditos_periodo spp' +
    ' where spp.ano = :ano and spp.mes = :mes and spp.cnpj in' +
    ' ( select cgc_emp from empresa where cod_empresa in (' + vCodEmpresasDRE + '))' +
    ' group by 1';
  buscas.ParamByName('data1').AsDate := StartOfTheMonth(vMes);
  buscas.ParamByName('data2').AsDate := EndOfTheMonth(vMes);
  buscas.ParamByName('mes').AsInteger := MonthOf(vMes);
  buscas.ParamByName('ano').AsInteger := YearOf(vMes);
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
    if buscas.FieldByName('Deb_Cred').AsString = 'S' then //debito
    begin
      fValorContribuicaoImpostos[3, 1] :=
        FloatToStr(buscas.FieldByName('valor_pis').AsFloat + StrToFloat(fValorContribuicaoImpostos[3, 1]));
      fValorContribuicaoImpostos[4, 1] :=
        FloatToStr(buscas.FieldByName('valor_cofins').AsFloat + StrToFloat(fValorContribuicaoImpostos[4, 1]));
      fValorContribuicaoImpostos[5, 1] :=
        FloatToStr(buscas.FieldByName('valor_icms').AsFloat + StrToFloat(fValorContribuicaoImpostos[5, 1]));
    end
    else//credito
    begin
      fValorContribuicaoImpostos[0, 1] :=
        FloatToStr(buscas.FieldByName('valor_pis').AsFloat + StrToFloat(fValorContribuicaoImpostos[0, 1]));
      fValorContribuicaoImpostos[1, 1] :=
        FloatToStr(buscas.FieldByName('valor_cofins').AsFloat + StrToFloat(fValorContribuicaoImpostos[1, 1]));
      fValorContribuicaoImpostos[2, 1] :=
        FloatToStr(buscas.FieldByName('valor_icms').AsFloat + StrToFloat(fValorContribuicaoImpostos[2, 1]));
    end;
    buscas.Next;
  end;
  buscas.Close;
end;

end.
