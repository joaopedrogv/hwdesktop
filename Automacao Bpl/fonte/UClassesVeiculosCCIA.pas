unit UClassesVeiculosCCIA;

interface
uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  ComCtrls, ExtCtrls, RDprint, UDtmVeiculosCCIA, uClasseFp, IBQuery, UClassesCadastrosBasicos, UClassesClientes,
  DBCtrls, StdCtrls, IdSMTP, IdMessage, IdText, IdAttachmentFile, IdSSLOpenSSL, IdReplySMTP,
  IdExplicitTLSClientServerBase, IdIOHandler, Provider, uDadosIni,
  Classes;

type
	Tnf_verificar_suzuki = function(dataUltimaVerificacao: TDateTime): Boolean;

  TVeiculosCCIA = class;
  TTabelaFipe = class;
  TLocCliente = class;
  TEspecieVeiculo = class;
  TLocColaborador = class;
  TModVeiculoCCIA = class;
  TListaMarca = class;
  TTabPrecoVeic = class;
  TPendencia = class;
  TDespesa = class;
  TListaTPComb = class;
  TLocCor = class;
  TComFat = class;
  TCondPagCCIA = class;
  TControlesCCIA = class;
  TPContasCCIA = class;
  TDemonstracaoCCIA = class;
  TTransfDepCCIA = class;
  TEstMotoCCIA = class;
  TEstMotoOutrasEmpCCIA = class;
  TEstMotoTransitoCCIA = class;
  TReservaEstMotoCCIA = class;
  TFilaReserva = class;
  TFilaVeiculosReserva = class;
  TNaturezaOp = class;
  TXmlImport = class;
  TModContrato = class;
  TModVeiculo_CodigoFab = class;
  THistVeiculo = class;
  TNFTransito = class;
  TFilaVeiculos = class;
  TServicosSugeridos = class;


  RDespesas = record
    parcelas, indice: Integer;
    NumConta: array of Double;
    CodFornecedor, CodTpDespesa: array of Integer;
    dataReferencia, numeroDocumento, vencimentoDocumento: arraystring;
    NumDoc, NCHQ, NCHQNominal, tipoVenda, numVenda, historico, ContrBanc: arraystring;
    valorDocumento: arrayextended;
    Controle: array of Integer;
  end;

  RConsultaFilaVeiculos = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd, novo, usado, deposito: Boolean;
    //Opçoes Adicionais
    adicional: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;
  end;

  RConsultaVeic = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd: Boolean;
    //Opçoes Avanças
    avancada, adicional: boolean;
  end;

  RConsulta = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd: Boolean;
    //Opçoes Avanças
    avancada, adicional: boolean;
    statusAv: string;
    ctrCompra, ctrEntCons, cftVenda, ctrVnd, ctrVndCons, ctrResDom, ctrInterm, cftTransf, cftDemonst, cftAtivo, cftDevo, cftOutrasS: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;

    reserva, demonstracao, canc, usadotroca: string;
    novo, usado, transfdeposito, comEstoque, semEstoque, EstoqueReal, Consignado, Intermediacao: boolean;
    entrada, saida, vivo, morto, estacionamento, transito: boolean;
    situacaoEstAND_OU, situacaoTPOPAND_OU, statusAND_OU, posicaoAND_OU: string;
  end;

   RConsulta1 = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd: Boolean;
    //Opçoes Avanças
    avancada, adicional: boolean;
    statusAv: string;
    ctrCompra, ctrEntCons, cftVenda, ctrVnd, ctrVndCons, ctrResDom, ctrInterm, cftTransf, cftDemonst, cftDevo, cftOutrasS: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;

    reserva, demonstracao, canc, usadotroca: string;
    novo, usado, transfdeposito, comEstoque, semEstoque, EstoqueReal, Consignado, Intermediacao: boolean;
    entrada, saida, vivo, morto, estacionamento, transito: boolean;
    situacaoEstAND_OU, situacaoTPOPAND_OU, statusAND_OU, posicaoAND_OU: string;
  end;

  TSing = class(TObject)
  var
    vNatureza: string; // Natureza (Entrada, Saída)
    vTipo: string; // Tipo (Comando Faturamento, Contrato)
    vMod: string; //  Modelo (Comando Faturamento - CFT, Contrato Entrada - CTRCOMPRA, Contrato de Venda - CTRVENDA)
    vNomeContrato: string; // Novo do Contrato (Contrato Compra, Contrato Venda)
    vTipoVenda: string; // TipoVenda (N - Novo) ou (U - Usado)
    vTipoVendaCFOP: string; //TipoVenda CFOP (C- CONSIGNADO, V - VENDA, T- TRANSFERENCIA DEPOSITO, D - DEMONSTRACAO)
    vAlterarEstoque: string;
  end;

  TGenerico = class(TDataSet_OOP)
  protected
    vSing: TSing;
  end;

  TNFTransito = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreNFTransito: boolean; overload;
    procedure _NFTransito(Tipoform: integer);
    function LimparNFT: boolean; overload;
    function ReceberNFT: boolean; overload;
    function CancelarNFT: boolean; overload;
    function abreFormItensNFTransito: boolean; 
  var
  end;

  THistVeiculo = class(TDataSet_OOP)
  private
  public
    fTempHistCtrE: TClientDataSet;
    fTempHistCtrEDtSource: TDataSource;
    fTempHistCtrS: TClientDataSet;
    fTempHistCtrSDtSource: TDataSource;
    fTempHistOrcamento: TClientDataSet;
    fTempHistOrcamentoDtSource: TDataSource;
    fTempHistOficina: TClientDataSet;
    fTempHistOficinaDtSource: TDataSource;
    fTempHistNfE: TClientDataSet;
    fTempHistNfEDtSource: TDataSource;
    fTempHistNfS: TClientDataSet;
    fTempHistNfSDtSource: TDataSource;
    destructor destroy; override;
    constructor create;
    function buscarHist(pChassi, pPlaca, pTipo, pNatureza: string; pRazao: boolean = false; pAgruparHist: string = ''): boolean; overload;
    function AbrirComFat(pCodigo: Integer;  pTipo: Integer = 0): boolean;
    function abrirPedVenda(pCodigo: Integer; pTipo: string; pTp: Integer = 0): boolean;
    function ImprimirPedVenda(pCodigo: Integer; pTipo: string): boolean;
    procedure GravarCodNFdatasetTemp(pCodigo: Integer);
  var
  end;


  TLocCliente = class(TDataSet_OOP)
  private
  public
    constructor create;
    function AbrirCliente(codcli: string): boolean;
    function abreClientes: boolean; overload;
    function abreClientes(codcli: integer): boolean; overload;
    function abreClientes(codcli: integer; natureza: string): boolean; overload;
    function verificacliente(vcod: integer): boolean;
    function faturamentoBarrado(CodFaturamento: integer; pExibirMens: boolean = true): boolean;
    function limiteDeCreditoEstouradoFechamento(Valor: currency): boolean;
    function getValorDebitoCredito: Currency;
    function getValorDebitoCheque: Currency;
    procedure gravaTipoCliente(pTipoCliente, pTipo: string);
  end;

  TModContrato = class(TDataSet_OOP)
  private
  public
    constructor create;
    function AbreContratos(Formulario, TipoContrato: string): boolean; overload;
    function BuscarContrato(pSQL: string): Integer;
  end;

  TNaturezaOp = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreNaturezaOp: boolean; overload;
    function abreNaturezaOp(nat: double): boolean; overload;
    function abreNaturezaOp(ptipvenda, pnatureza, pUso: string; codigo_uf: integer; pAltEst: string = ''; pVeicEstComfat: string = ''): boolean; overload;
    function buscarNaturezaInterm(nat: double): boolean;
    function buscarNaturezaOp(nat: double): boolean; overload;
    function buscarNaturezaOp(ptipvenda: string; nat: double; pUso: string): boolean; overload;
    function buscarNaturezaOp(ptipvenda, pnatureza: string; codigo_uf: integer; pUso: string; pVeicEstComfat: string = ''): boolean; overload;
    function buscarNaturezaOp(ptipvenda, pnatureza: string; codigo_uf: integer; codigo_nop: double; pUso: string): boolean; overload;
    function testarNaturezaOpNovoUsado(ptipvenda, pnatureza: string; codigo_uf: integer; nat: double; pUso: string): boolean;
  end;


  TLocColaborador = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreLocColaborador: boolean; overload;
    function abreLocVendedor: boolean; overload;
    function abreLocGerente: boolean; overload;
    function buscarColaborador(pColaborador: integer): boolean;
    function buscarVendedor(pColaborador: integer): boolean;
    function buscarGerente(pColaborador: integer): boolean;
  end;

  TLocCor = class(TDataSet_OOP)
  private
  public
    constructor create;
    function _AbreCores: boolean; overload;
    function buscarCor(pCodCor: integer): boolean;
    function verificaCorDescricao(dataset: TClientDataSet): boolean;
    function verificaCorDenatram(dataset: TClientDataSet): Boolean;
  end;

  TModVeiculo_CodigoFab = class(TDataSet_OOP)
  public
    constructor create;
    function abreCodigo(pCodigo: Integer): Boolean;
    function insereCodigoFab(pCodigo: Integer; pCodFab: string): boolean;
    function delete: Boolean; override;
  end;

  TLocTipoPendencia = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreLocTipoPendencia: boolean; overload;
    function abreLocTipoPendencia(pCodigo: Integer): boolean; overload;
  end;

  TLocTipoDespesa = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreLocTipoDespesa: boolean; overload;
    function abreLocTipoDespesa(pCodigo: Integer): boolean; overload;
    function buscarLocTipoDespesa(pCodigo: Integer): boolean; overload;
  end;

  TEspecieVeiculo = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreEspecieVeiculo: boolean; overload;
    function buscarEspecie(pEspecie: integer): boolean;
  end;

  TDemonstracaoCCIA = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreDemonstracao: boolean; overload;
    function EnvEmail(pEnviar: string = 'N'): boolean;
    function _ValidarEMail(pStr: string; pExibirErro: boolean = false): Boolean;
    procedure _DemonstracaoVeiculos(Tipoform: integer);
  end;

  TTransfDepCCIA = class(TDataSet_OOP)
  private
  public
    destructor destroy; override;
    constructor create;
    function abreTransfDep(pCodModelo: Integer): boolean; overload;
    function abreFormTransfDep(pCodModelo: Integer): boolean;
    function SalvarReservaTranfDep: boolean;
    function RetirarReservaTranfDep: boolean;
  var
   vReserva: TReservaEstMotoCCIA;
  end;

  TCondPagCCIA = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreCondPag: boolean; overload;
    function buscarCondPag(pCodigo: Integer): boolean; overload;
  end;

  TControlesCCIA = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreControles: boolean; overload;
  end;


  TPContasCCIA = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abrePContas: boolean; overload;
    function abrePContas(pCodigo: double): boolean; overload;
    function buscarPContas(pCodigo: double): boolean;
  end;


  TVeiculosCCIA = class(TDataSet_OOP)
  private
    vcodveicpesq: integer;
    vchassipesq, vplacapesq: string;
  public
    destructor destroy; override;
    constructor create;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function abreVeiculos: boolean; overload;
    function abreVeic: boolean;
    function abreVeiculos(EmpNula: string): boolean; overload;
    function abreVeiculos(pPlaca: string; pChassi: string; pCodigo: Integer): boolean; overload;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function restaurarRegistro: boolean;
    procedure CadVeiculos(TipoForm: integer);
    procedure _CompraVeiculos(TipoForm: integer);
    procedure _VendaVeiculos(TipoForm: integer; vEstMoto: boolean = false);
    function _PreencherCamposApartirModelo(campopreencherCadVeiculo: string;
      campopreenchidoCadModelo: string): Boolean;
    function confirmaAlteracao: boolean;
    function AbrirModeloVeic: boolean;
//    function AbrirCliente: boolean;
    function AbrirCores: boolean;
    function verificajacad(vit: integer): boolean;
    function verificatipovenda(vtop: integer; vcomb: TDbCombobox;
      vtipo, vtpescol: string): boolean;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function consulta: boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
  	vCons: RConsultaVeic;
    vClientesVeic: TLocCliente;
    vEspecieVeic: TEspecieVeiculo;
    vColaboradorVeic: TLocColaborador;
    vModVeic: TModVeiculoCCIA;
    vCoresVeic: TLocCor;
    vCombustivelVeic: TListaTPComb;
    vMarcaVeic: TListaMarca;
    vHistNFE: THistVeiculo;
    vHistNFS: THistVeiculo;
    vHistNFT: THistVeiculo;
    vHistCTRE: THistVeiculo;
    vHistCTRS: THistVeiculo;
    vHistORC: THistVeiculo;
    vHistOS: THistVeiculo;
  end;

  TReservaEstMotoCCIA = class(TDataSet_OOP)
  private
  public
    buscas2: TIBQuery;
    constructor create;
    destructor destroy; override;
    function abreFormReserva(TipoForm: integer; pCod: Integer; pCodEmp: Integer; pChassi: string): boolean; overload;
    function abreFormReserva(TipoForm: integer): boolean; overload;
    function SalvarReserva: boolean;
    function RetirarReserva(pTodos: boolean = false; pMensagem: string = ''): boolean;
    function RenovarReserva(pTodos: boolean = false): boolean;
    function ObterDadosReserva(pRetirar: boolean = false): boolean;
    function BuscaReservaVencidas: boolean;
    function BuscaReservaVencendo: boolean;
    function BuscaVeiculos(pCod, pCodEmp: Integer; pChassi: string): boolean;
    function verificatiporeserva(vtop: integer; vcomb: TDbCombobox;
      vtipo, vtpescol: string): boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarDemarcarTodos(pTipo: Integer = 0);
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function SalvarFilaRes(pDataVenc: TDateTime; pHoraVenc: string; pRetirar: boolean = False): boolean;
    function verificarReserva(var pMensagem, pCampo: string): boolean;
    function verificarConsorcio: boolean;
    function verficarDataAssembleia: boolean;
    function verificarRegistro(pExibirMens: boolean = true): boolean; overload;
    function verificarRegistro(pDataset: TClientDataSet; pExibirMens: boolean = true): boolean; overload;
    function verificarReservaExiste: boolean;
    procedure buscarDadosReserva;
    procedure atualizarDataVenc;
  var
    vColaboradorVeic: TLocColaborador;
    vClientesVeic: TLocCliente;
    vCodVendedorOld, vCodCliente: Integer;
    vNomeVendedorOld: string;
    vTipoRes, vRetirarReservaVenc: string;
    vCondPag: TCondPagCCIA;
    vHabilitarVend: boolean;
  end;

  TFilaVeiculosReserva = class(TDataSet_OOP)
  private
  public
    constructor create;
    function BuscaReservaVencidas: boolean;
    function BuscaReservaVencendo: boolean;
    function retirarReservasVencidas(pTodos: boolean = false): boolean;
    function renovarReservasVencidas(pTodos: boolean = false): boolean;
    function abrirReserva: boolean;
    function verificarRegistro: boolean;
  end;

  TFilaVeiculos = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreFilaVeiculos: boolean; overload;
    function abreFilaVeiculos(pCod: integer; pStatus: string = 'FILA'): boolean; overload;
    function verificarRegistro: boolean;
    function OrdenarUpGrid: boolean;
    function OrdenarDownGrid: boolean;
    function TrocarVendedores: boolean;
    function abreFormAvaria: boolean;
    procedure _marcaDesmarcaLinha;
    function consulta: boolean;
    function definirCoresConsulta(pTipo: Integer = 0): boolean;
  var
    vCons: RConsultaFilaVeiculos;
  end;

  TFilaReserva = class(TDataSet_OOP)
  private
  public
    fTempFilaReserva: TClientDataSet;
    constructor create;
    destructor destroy; override;
    function delete: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function post(pTodos: boolean = false): boolean;
    function renovarReserva(pTodos: boolean = false): boolean;
    function _AbreFilaReserva: boolean; overload;
    function _AbreFilaReserva(pCodigo: integer): boolean; overload;
    function verificatiporeserva(vtop: integer; vcomb: TDbCombobox; vtipo, vtpescol: string): boolean;
    function verificarConsorcio: boolean;
    function verficarDataAssembleia: boolean;
    function verificarRegistro: boolean;
    procedure PreencherDtsetTemp;
    procedure ChecarLista;
    function abreFormFilaReserva(TipoForm: integer): boolean; overload;
    function abreFormFilaReserva(pCod: string): boolean; overload;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function abreEstMoto(pCodigo: Integer; pChassi: string): boolean;
    procedure buscarDadosReserva;
    procedure atualizarDados;
  var
    vColaboradorVeic: TLocColaborador;
    vClientesVeic: TLocCliente;
    vCoresVeic: TLocCor;
    vModVeic: TModVeiculoCCIA;
    vCodVendedor, vCodVendedorOld, vCodCliente, vCodClienteOld: Integer;
    vNomeVendedor, vNomeVendedorOld, vFoneClienteOld, vTipoResR, vTipoResOld, vGrupoCotaRdOld, vNomeResOld: string;
    vRetirarReservaVenc: string;
    vDataAssembleiaOld: TDateTime;
    vRetirar: boolean;
    vFilaVeiculos: TFilaVeiculos;
    vReserva: TReservaEstMotoCCIA;
    vEstMoto: TEstMotoCCIA;
    vCondPag: TCondPagCCIA;
  end;

  TEstMotoTransitoCCIA = class(TDataSet_OOP)
  private
  public
    constructor create;
    function delete: boolean; override;
    function AbreEstMotoTransito: boolean; overload;
    function AbreEstMotoTransito(pNumNF: Integer): boolean; overload;
    procedure CadEstMotoTransito(TipoForm: integer; pNumNF: Integer);
  var
    vCons: RConsulta1;
    vReserva: TReservaEstMotoCCIA;
  end;

  TEstMotoOutrasEmpCCIA = class(TDataSet_OOP)
  private
    vsqlTemp: WideString;
  public
    constructor create;
    destructor destroy; override;
    function AbreEstMoto: boolean; overload;
    function consulta: boolean;
    procedure CadVeiculosOutrasEmp(TipoForm: integer);
  var
    vCons: RConsulta1;
    vReserva: TReservaEstMotoCCIA;
  end;

  TEstMotoCCIA = class(TDataSet_OOP)
  private
    vsqlTemp: WideString;
  public
    vcodestmotopesq: integer;
    vchassiestmotopesq, vplacaestmotopesq: string;
    _chassi, _placa, _cpfCnpj, _dtIni, _dtFim, _entSa, _marca, _especie, _modelo, _cor: string;
    _numNf: Integer;
    destructor destroy; override;
    constructor create;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function AbreEstMoto: boolean; overload;
    function AbreEstMoto(pCod: Integer): boolean; overload;
    function AbreEstMoto(pCod: Integer; pChassi: string; pEditar: boolean = false): boolean; overload;
    function AbreEstMoto(pChassi: string): boolean; overload;
    function BuscarEstMoto(pComfat: TComFat; valor: string; placaChassiCodigo: integer; pPlaca: string = ''; pChassi: string = ''): boolean;
    procedure CadVeiculosMov(TipoForm: integer);
    function AbrirModeloVeic: boolean;
    function AbrirCores: boolean;
    function consulta: boolean;
    function verificajacad(vit: integer): boolean;
    function pesquisar(pComfat: TComFat): Boolean;
    function existeComandoNF: Boolean;
    function existeHist: Boolean;
    function setarDadosComando(pComfat: TComFat; vit: integer = 0; vStatusV: string = ''): boolean;
    function InserirVeiculo(vTrans: Integer = 0): boolean;
    function abreFormEntradaCCIA(pTipoForm: Integer;  pTipveiculo: string = ''; vComFat: boolean = false): boolean;
    function abreFormSaidaCCIA(pTipoForm: Integer; pTipveiculo: string = ''; vComFat: boolean = false; vEdit: boolean = false): boolean;
    function abreFormTipoVendaCCIA(pTipoForm: Integer): boolean;
    function abreFormTipoVendaEstMotoCCIA(pTipoForm: Integer): boolean;
    function abreFormDadosReais(pTipoForm: Integer): boolean;
    function abreFormAlterarEstoque: boolean;
    function abreFormComfat(pTipoForm: Integer): boolean;
    procedure PreencherDatasetvDadosIni(datasettemp: TClientDataSet; vComfat: boolean; pTipveiculo: string = ''; vEdit: boolean = false);
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function abreFormStatusVeiculo(pEdit: boolean = false): boolean;
    function abreFormObservacao: boolean;
    function AlterarStatus(pTp: Integer = 0): boolean;
    function existeTipoOpVeiculo(pTp: string): boolean;
    function AlterarReducao(pRedLucro: string; pPercRed: double): boolean;
    function AtualizarDadosVeiculo(var pMensagem: string): boolean;
    function abreFormAvaria: boolean;
    function definirDataAssembleia(pCodigo, pCodEstmoto: Integer): boolean;
  var
    vEspecieVeic: TEspecieVeiculo;
    vColaboradorVeic: TLocColaborador;
    vModVeic: TModVeiculoCCIA;
    vCombustivelVeic: TListaTPComb;
    vCoresVeic: TLocCor;
    vClientesVeic: TLocCliente;
    vFornecedorVeic: TLocCliente;
    vClientesReservaVeic: TLocCliente;
    vMarcaVeic: TListaMarca;
    vPendenciaVeic: TPendencia;
    vDespesaVeic: TDespesa;
    vReserva: TReservaEstMotoCCIA;
    vCons: RConsulta;
    vHistNFE: THistVeiculo;
    vHistNFS: THistVeiculo;
    vHistNFT: THistVeiculo;
    vHistCTRE: THistVeiculo;
    vHistCTRS: THistVeiculo;
    vHistORC: THistVeiculo;
    vHistOS: THistVeiculo;
  end;

  TModVeiculoCCIA = class(TDataSet_OOP)
  private
  public
    destructor destroy; override;
    constructor create;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function restaurarRegistro: boolean;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function confirmaAlteracao: boolean;
    procedure CadModVeiculos(TipoForm: integer);
    function buscarModelo(pCodModelo: integer; codEmpresa: Integer = 0; pTipoV: string = ''): Boolean;
    function buscarNCM(pNCM: string): boolean;
    function validaNCM: Boolean;
    function AbrirCombustivel: boolean;
    function AbrirMarca: boolean;
    function abreModelos(pTipoV: string = ''): boolean; overload;
    function abreModelos(descFabricante: string; pTipoV: string = ''): boolean; overload;
    function abreModelos(codModelo: integer; pTipoV: string = ''): boolean; overload;
    function abreModVeiculos(pTipoV: string = ''): boolean; overload;
    function verificaModeloVeiculo(datasettemp: TClientDataSet): boolean;
    function alterarOrdemImpressao(pOrdem: Integer): boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
    vEspecieVeic: TEspecieVeiculo;
    vTabelaFipe: TTabelaFipe;
    vCombustivelVeic: TListaTPComb;
    vTabPreco: TTabPrecoVeic;
    vMarcaVeic: TListaMarca;
    vCodFab: TModVeiculo_CodigoFab;
    ultimasql: string;
    vServicosSugeridos: TServicosSugeridos;
  end;

  TComFat = class(TGenerico)
  private
  	Fsql_campos, Fsql_inner: string;
    vsqlTemp: WideString;
    variavel_parar: boolean;
    rdp: TRdPrint;
  public
    vSair: boolean;
    vminNF, vmaxNF: real;
    vcodveic,vanofab,vanomod: integer;
    dtSetPlano: TClientDataSet;
    procedure checarRegraCfopCST;
    destructor destroy; override;
    constructor create;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function ConfirmarComando: Boolean;
    function ReabrirComando: Boolean;
    function ConfirmarRetornoDemonst: Boolean;
    function CancelarComando: boolean;
    function EmitirNotaFiscalOS: boolean;
    function delete: boolean; override;
    function AbrirEstMoto: boolean;
    function abreComFat: boolean; overload;
    function abreComFat(vComando: Integer; pTp: Integer =0): boolean; overload;
    function getTipoVenda: string;
    function consulta: boolean;
    function abreFormCondPag(Sender: TObject): boolean;
    function abreFormPesquisaVeiculo: boolean;
    procedure _marcaDesmarcaLinha(datasettemp: TClientDataSet);
    procedure _marcarTodos(datasettemp: TClientDataSet);
    procedure _desmarcarTodos(datasettemp: TClientDataSet);
    function abreFormPerguntasVeiculo: boolean;
    function EditarFormPerguntasVeiculo: boolean;
    function verplanopag(vtp: integer; vCodigo: Integer = 0; vChassi: string = ''): boolean;
    function VerificaSaldo(vtp: integer): boolean;
    function abreCondicoes: boolean;
    function addPlano: boolean;
    function removerPlano: boolean;
    function _VerificarEstoqueVeiculo(buscas2: TIBQuery; pTp: Integer = 0): Boolean; overload;
    function _VerificarEstoqueVeiculo(memo: TMemo; vSomenteEstoque: string = 'N'; vProcPend: string = ''): Boolean; overload;
    function _VerificarDemonstracao(var pMensagem: string; pNComando: Integer; pData: TDateTime; pTipVeiculo, vProcPend: string): boolean;
    function _VerificarComando(pData: TDateTime; pTipVeiculo: string): boolean;
    function _VerificarReserva(var pMensagem: string): boolean;
    function _VerificarPendencias(var pMensagem: string): boolean;
    function _VerificarContratos(var pMensagem: string): boolean;
    function _VerificarRecebimento(pNComando: Integer): boolean;
    function ChecaCamposObrigatorios(pSomenteCampos: boolean = False): boolean;
    function ImprimirComando: boolean;
    function AbrirContrato(var pRichEdit: TRichEdit; pCodContrato: Integer): boolean;
    function ImprimirContrato(pCodContrato: Integer): boolean;
    function abreFormListaContrato: boolean;
    function ImprimirContratoComando: boolean;
    function verificarImpressaoPerm(pExibirProcesso: boolean = False; pExibirMens: boolean = False): boolean;
    function retornaValorCusto: real;
    function cadCliente(modal: integer): boolean;
    function verificaUsoDoPlanoDePagamento: boolean;
    function verificaUsodeVeiculosUsados(vtp: integer; pChassi: string = ''): Integer;
    function detalhesFormaDePagamento: boolean;
    function BaixarVeicIntermed: boolean;
    function gerarnfVenda: boolean;
    function verificaEnvioNFVeic: boolean;
    function BaixarVeiculos(vtp: integer; vmtus: integer): boolean;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function verificaFechamento(vtp: integer): boolean;
    function verificaPendenciasNF: boolean;
    function verificaPendenciaCXL: boolean;
    procedure _abreNatOperacao;
    function DemonstracaoVeiculo: boolean;
    function existeNotaFiscalDeEntrada(pCodNF: Integer): boolean;
    procedure _AbreComfatVendaVeiculos(TipoForm: integer; pNumComando: Integer);
    procedure GravarCodNFdatasetTemp;
    function MontarNFe(pNumComando: Integer; pTipo, pNatureza: string): boolean;
    function vervalorminimo: boolean;
    function checarCombinacaoCFOPCST: boolean;
    function tentarSCAN: boolean;
    function testarCNPJ(var pMensagem: string): boolean;
    procedure AtualizarVeiculos(buscas2: TIBQuery);
    function abreTipoVendas(vcomb: TDbCombobox): boolean;
    function setarTipoVendas: boolean;
    function ExisteEquipamento: Integer;
    function VendaEstoque: boolean;
    procedure PrecoTabela(buscas2: TIBQuery);
    procedure CalcularRedLucro;
    function TestarCST(var pMensagem: string; vcst: string): boolean;
    function ReceberFinanceiroPeloFinanceiroComFat: boolean;
    procedure verificarNotasFiscaisSuzuki;
  var
    vColaborador: TLocColaborador;
    vGerente: TLocColaborador;
    vClienteComFat: TLocCliente;
    vClienteVendComFat: TLocCliente;
    vIntermediadorComFat: TLocCliente;
    vConcessionariaComFat: TLocCliente;
    vCondPag: TCondPagCCIA;
    vCons: RConsulta;
    vNaturezaOp: TNaturezaOp;
    vEstMoto: TEstMotoCCIA;
    vModContratos: TModContrato;
    vTransfDep: TTransfDepCCIA;
    vModVeic: TModVeiculoCCIA;
    vSing: TSing;
    vVerificarDemonstr, vMensDemonst: boolean;
    vCodigoOld: Integer;
    vChassiOld: string;
    vCFOPOld: Double;
    vCodCondPagOld: Integer;
    vReceberPeloFinanceiro: boolean;
  end;

  TTabPrecoVeic = class(TDataSet_OOP)
  public
    constructor create;
    function edit: boolean; override;
    function delete: boolean; override;
    function _AbreTabPrecoVeic(vModVeic: TModVeiculoCCIA): boolean;
    function _existePrecoVeic(pCodMod, pAnoFab, pAnoMod: string): boolean;
    function post: boolean; override;
    function insert(vModVeic: TModVeiculoCCIA): boolean;
  end;

  TPendencia = class(TDataSet_OOP)
  public
    destructor destroy; override;
    constructor create;
    function edit: boolean; override;
    function delete: boolean; override;
    function _AbrePendencia(vEstMoto: TEstMotoCCIA): boolean; overload;
    function _AbrePendencia(vChassi: string): boolean; overload;
    function post: boolean; override;
    function insert(vEstMoto: TEstMotoCCIA): boolean;
    function AbreTipoPend: boolean;
    function buscarTpPendencia(pCodigo: Integer): boolean;
    procedure datasetAfterScrollPendencia(DataSet: TDataSet);
  var
    LocTipoPendencia: TLocTipoPendencia;
  end;

  TDespesa = class(TDataSet_OOP)
  public
    vDetDesp: TClientDataSet;
    destructor destroy; override;
    constructor create;
    function edit: boolean; override;
    function delete: boolean; override;
    function _AbreDespesa(vEstMoto: TEstMotoCCIA): boolean; overload;
    function _AbreDespesa(pChassi: string): boolean; overload;
    function post: boolean; override;
    function insert(vEstMoto: TEstMotoCCIA): boolean;
    function AbreTipoDesp: boolean;
    function buscarTpDespesa(pCodigo: Integer): boolean;
    function buscarCliente(pCodigo: Integer): boolean;
    procedure datasetAfterScrollDespesa(DataSet: TDataSet);
    function abreFormDespesa(pAlter: boolean = False): boolean;
    function abreFormDespesaDetalhado(indice: integer; cdsDesp: TClientDataSet): boolean;
    function gerarDespesa(vEstMoto: TEstMotoCCIA; pAlter: boolean = false): boolean;
    function ApagarDespesa(vEstMoto: TEstMotoCCIA): boolean;
    procedure GravarContasPagarTemp(cdsDesp: TClientDataSet);
    procedure ApagarContasPagarTemp(cdsDesp: TClientDataSet);
    function setFatura(indice: integer; pDoc, pVenc: string; pValor: Currency): boolean; overload;
    procedure DeletarContasAPagar(pCodigoDesp: Integer);
    function DespesaQuitada(pCodigoDesp: Integer): boolean;
  var
    LocCliDespesa: TLocCliente;
    LocTipoDespesa: TLocTipoDespesa;
    vCondPag: TCondPagCCIA;
    vControles: TControlesCCIA;
    vPlanoC: TPContasCCIA;
    FDespesas: RDespesas;
  end;

  TListaTPComb = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreTipoCombustiveis: Boolean;
    function buscarCombustivel(pCodCombustivel: integer): boolean;
  end;

  TListaMarca = class(TDataSet_OOP)
  private
  public
    constructor create;
    function _AbreMarca: boolean;
    function buscarMarca(pCodmarca: integer): boolean;
  var

  end;
  TTabelaFipe = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreTabelaFipe: Boolean;
  end;

  TCombustivel = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreTipoCombustiveis: Boolean;
  end;

  TXmlImport = class(TDataSet_OOP)
  private
    //vnfe: TACBrNFe;
  public
    fTempDtSet: TClientDataSet;
    fTempDtSource: TDataSource;
    constructor create;
    destructor destroy;
    function CadTransito: Boolean;
    function importaXml(vArquivo: string): Boolean;
    function importaXmlNF(vArquivo: string): Boolean;
    function manifestacaodestinatario: boolean;
    function montarNfAvulsa(pNat: string): boolean;
    function montarNf(pComFat: TComFat; VArquivoXml: string): boolean;
    function defineCampos(pComFat: TComFat; vDtSet: TClientDataSet): boolean;
    function abreFormXMLVeiculoCCIA(pComFat: TComFat): boolean;
    procedure _marcaDesmarcaLinha(datasettemp: TClientDataSet);
    procedure _marcarTodos(datasettemp: TClientDataSet);
    procedure _desmarcarTodos(datasettemp: TClientDataSet);
    function SetarStatusUsoXMLVeiculo(Uso, TipoVenda: string; pFlag: Integer = 0): boolean;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
  var
   ComFat: TComFat;
  end;

  TServicosSugeridos = class(TDataSet_OOP)
  private
  public
   	constructor create;
    function abreServico(pDataset: TDataSet): boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarLinha;
    procedure _desmarcarLinha;
    procedure SalvarServicos(pDataset: TDataSet);
    function verificarServicos(pDataset: TDataSet): boolean;
  end;

implementation

uses
  SysUtils, IBDatabase, UCadVeiculosCCIA, UCadModVeiculosCCIA,
  UCompraContratoVeiculosCCIA, UDemonstracaoVeiculosCCIA, UReciboVeiculosCCIA,
  uPadrao, funcoes, UImprimirReciboVeiculosCCIA, UReservaVeiculosCCIA,
  UMovVeiculosCCIA, IBCustomDataSet, uCadEstMotosCCIA, uEditHw, Dialogs, FileCtrl,
  IdUserPassProvider, IdSASL_CRAM_MD5, IdSASLPlain, IdSASLLogin, IdSASLSKey,
  IdSASLOTP, IdSASLAnonymous, IdSASLExternal, uClassesNotasFiscais, Variants, ShlObj, UEntradaCCIA, USaidaCCIA, UTipoVendaCCIA, UImpressaoContratosCCIA, Graphics,
  UDadosReaisVeiculosCCIA, uCadNF, uCadEstMotosOutrasEmpCCIA, UVisualizarContratosCCIA, Spin, Messages,
  uCadNFTransitoCCIA, UTransitoVeiculosCCIA, uCadFilaReservaCCIA, UAvariaCCIA,
  uReservasVencidas, StrUtils, uClassesNotasFiscais_itens_cadastros, 
  config_sistema_class;
  
function SendMailByACBr(Host, Port, From, UserName, PassWord, FromName, Subject,
  Body, AttachmentList, AddressList, ReplyToList, CCList, BCCList, Priority: WideString;
  IsHTML, SetSSL, SetTLS, ReadingConfirmation, UseThread, ShowError, OnlyAttachmentByMail: LongBool): WideString; stdcall; external 'hw.nfe.dx.dll'

{ TServicosSugeridos }

function TServicosSugeridos.abreServico(pDataset: TDataSet): boolean;
begin
 Result := montaSelect(' select regras_sug.codigo, regras_sug.descricao, ' +
  	' regras_sug.mes_ret_serv1, regras_sug.mes_ret_serv2, regras_sug.interv_mes_serv, ' +
    ' regras_sug.km_ret_serv1, regras_sug.km_ret_serv2, regras_sug.interv_km_serv from regras_sug ' +
  	' where regras_sug.tipo = ''V'' ' +
    ' and regras_sug.cod_empresa = ' + vDadosIni.codEmpresa + ' and regras_sug.ativo = 1 ' +
    ' order by regras_sug.descricao ');

 if pDataset.FieldByName('CODIGO').AsInteger > 0 then
 begin
   dataSet.First;
   while not dataSet.Eof do
   begin
     buscas.Close;
     buscas.SQL.Text := ' select regras_sug_itens.codigo, regras_sug_itens.cod_tipo from regras_sug_itens ' +
      ' where regras_sug_itens.codigo = :codigo and regras_sug_itens.cod_tipo = :cod_tipo ' +
      ' and regras_sug_itens.cod_empresa = :cod_empresa and regras_sug_itens.tipo = :tipo ';
     buscas.ParamByName('CODIGO').AsInteger := dataset.FieldByName('CODIGO').AsInteger;
     buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('CODIGO').AsInteger;
     buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.ParamByName('TIPO').AsString := 'V';
     buscas.Open;

     if not buscas.IsEmpty then
     begin
       dataSet.Edit;
       dataSet.FieldByName('SEL').AsString := 'S';
       dataSet.Post;
     end;

     dataSet.Next;
   end;
   dataSet.First;
 end;
end;

constructor TServicosSugeridos.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsServicosSugeridos);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

procedure TServicosSugeridos.SalvarServicos(pDataset: TDataSet);
begin
  if dataSet.IsEmpty then
  	exit;

  if not vDadosIni.vSugServico.vHabilitarSug then
  	exit;

  try
    dataSet.Filter := 'SEL = ''S''';
    dataSet.Filtered := True;

    vDadosIni.abreStatusProcessamento('', 'Aguarde. Incluindo serviços para o(s) modelo(s) de veículos');

    buscas.Close;
    buscas.SQL.Text := ' DELETE FROM REGRAS_SUG_ITENS ' +
      ' WHERE COD_TIPO = :COD_TIPO AND COD_EMPRESA = :COD_EMPRESA AND TIPO = :TIPO; ';
    buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('CODIGO').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('TIPO').AsString := 'V';
    buscas.ExecSQL;

    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('SEL').AsString = 'S' then
      begin
        buscas.Close;
        buscas.SQL.Text := ' INSERT INTO REGRAS_SUG_ITENS (CODIGO, COD_TIPO, COD_EMPRESA, TIPO) ' +
          ' VALUES (:CODIGO, :COD_TIPO, :COD_EMPRESA, :TIPO); ';
        buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('CODIGO').AsInteger;
        buscas.ParamByName('TIPO').AsString := 'V';
        buscas.ExecSQL;
      end;

      dataSet.Next;
    end;
  finally
  	dataSet.Filtered := False;
	  dataSet.First;
  	vDadosIni.fechaStatusProcessamento;
  end;

end;

function TServicosSugeridos.verificarServicos(pDataset: TDataSet): boolean;
var
	vSelec: boolean;
  vList: TStrings;
begin
  Result := true;

  if dataSet.IsEmpty then
  	exit;

  if not vDadosIni.vSugServico.vHabilitarSug then
  	exit;

  vSelec := false;

  try
    dataSet.Filter := 'SEL = ''S''';
    dataSet.Filtered := True;

    vDadosIni.abreStatusProcessamento('', 'Aguarde. Verificando serviços para o(s) modelo(s) de veículos');

    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('SEL').AsString = 'S' then
         vSelec := true;
      dataSet.Next;
    end;
  finally
  	dataSet.Filtered := False;
	  dataSet.First;
  	vDadosIni.fechaStatusProcessamento;
  end;

  if not vSelec then
  begin
    if vDadosIni.getConfSisBool('sug_serv_testar_regras', buscas) then
    begin
      try
        vList := TStringList.Create;
        vList := vDadosIni.getConfSisBlob('sug_serv_testar_regras', buscas);
        if vList.Count > 1 then
        begin
          if (vDadosIni.getValue(vList[1], 1) = 'V') then
          begin
            Result := false;
            if not Application.MessageBox('Nenhum serviço informado.' + chr(13) +
				      'Deseja confirmar as assim mesmo?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)= mrYES then
              exit;

            if vDadosIni.PesqPros('BAS407', 'PERMITIR', '', 'TIPMODELO', pDataset.FieldByName('CODIGO').AsString, buscas, true) then
            begin
            	Result := true;
              exit;
            end;

			      Result := false;
      			Exit;
          end;
        end;
      finally
        FreeAndNil(vList);
      end;
    end;
  end;
end;

procedure TServicosSugeridos._desmarcarLinha;
begin
  if dataSet.IsEmpty then
  	exit;

  dataSet.Edit;
  dataSet.FieldByName('SEL').AsString := '';
  dataSet.Post;
end;

procedure TServicosSugeridos._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
  	exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TServicosSugeridos._marcarLinha;
begin
   if dataSet.IsEmpty then
  	exit;

  dataSet.Edit;
  dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

{ TVeiculosCCIA }

function TVeiculosCCIA.abreVeiculos: boolean;
begin
   result := montaSelect(' SELECT VEICULOS.*, ' +
  	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
    ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
    ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
   	' where VEICULOS.CODIGO = ' + inttostr(vcodveicpesq)+
    ' and VEICULOS.PLACA = ' + QuotedStr(vplacapesq) +
    ' and VEICULOS.CHASSI = ' + QuotedStr(vchassipesq) +
    ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
  dataset.Edit;
  if dataSet.FieldByName('US_CAD').AsInteger = 0 then
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
end;

function TVeiculosCCIA.abreVeic: boolean;
begin
  result := montaSelect(' SELECT FIRST 1 VEICULOS.*, ' +
  	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
    ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
    ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
  	' where VEICULOS.ATIVO = 1 ' +
    ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

function TVeiculosCCIA.abreVeiculos(EmpNula: string): boolean;
begin
  result := montaSelect(' SELECT FIRST 1 VEICULOS.*, ' +
  	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
    ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
    ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
    ' where VEICULOS.CODIGO = 0 ' +
    ' and VEICULOS.CHASSI = '''' ' +
    ' and VEICULOS.PLACA = '''' ' +
    ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

function TVeiculosCCIA.abreVeiculos(pPlaca, pChassi: string;
  pCodigo: Integer): boolean;
begin
	result := montaSelect(' SELECT VEICULOS.*, ' +
  	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
    ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
    ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
  	' where VEICULOS.CODIGO = ' + inttostr(pCodigo)+
    ' and VEICULOS.PLACA = ' + QuotedStr(pPlaca) +
    ' and VEICULOS.CHASSI = ' + QuotedStr(pChassi) +
    ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

function TVeiculosCCIA.AbrirCores: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'CORES| ' + dataSet.FieldByName('COD_COR').AsString;

  formulario := Funcoes.AbreForm('pkClientes', 'TfrmCadCores', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TVeiculosCCIA.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect(' SELECT VEICULOS.*, ' +
  	  ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
      ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
      ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
    	' WHERE VEICULOS.ATIVO = 1' +
      ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
    result := false;
  end
  else
    result := montaSelect(' SELECT VEICULOS.*, ' +
  	  ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
      ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
      ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
    	' WHERE VEICULOS.ATIVO = 0 ' +
      ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

function TVeiculosCCIA.AbrirModeloVeic: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'MODVEICULO| ' + dataSet.FieldByName('MODELO').AsString;

  formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TFrmCadModVeiculosCCIA', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TVeiculosCCIA.CadVeiculos(TipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de Veículos');
    vDadosIni.vTipoForm := TipoForm;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    begin
      Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('VEI024', 'CONSULTA', '', 'VEICULOS', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if FrmCadVeiculosCCIA = nil then
    begin
      vDadosIni.vTipoForm := TipoForm;
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TFrmCadVeiculosCCIA, FrmCadVeiculosCCIA);
    end;
    
    if (TipoForm > 0) and (not FrmCadVeiculosCCIA.Visible) then
      FrmCadVeiculosCCIA.ShowModal
    else if (not FrmCadVeiculosCCIA.Visible) then
      FrmCadVeiculosCCIA.Show
    else if FrmCadVeiculosCCIA.FormStyle = fsMDIChild then
      FrmCadVeiculosCCIA.Show
    else
      FrmCadVeiculosCCIA.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TVeiculosCCIA.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsVeiculos);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
  vClientesVeic := TLocCliente.create;
  vEspecieVeic := TEspecieVeiculo.create;
  vColaboradorVeic := TLocColaborador.create;
  vModVeic := TModVeiculoCCIA.create;
  vCombustivelVeic := TListaTPComb.create;
  vCoresVeic := TLocCor.create;
  vMarcaVeic := TListaMarca.create;
  vHistNFE := THistVeiculo.create;
  vHistNFS := THistVeiculo.create;
  vHistNFT := THistVeiculo.create;
  vHistCTRE := THistVeiculo.create;
  vHistCTRS := THistVeiculo.create;
  vHistORC := THistVeiculo.create;
  vHistOS := THistVeiculo.create;

  vModVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsBuscaModelo);
  vCombustivelVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsAbreTpComb);
  vCoresVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsAbreCor);
  vMarcaVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsAbreMarca);
  vEspecieVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsAbreEspecie);

  vHistNFE.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistNFEVeiculos);
  vHistNFS.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistNFSVeiculos);
  vHistNFT.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistNFTVeiculos);
  vHistCTRE.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistCTREVeiculos);
  vHistCTRS.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistCTRSVeiculos);
  vHistORC.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistORCVeiculos);
  vHistOS.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistOSVeiculos);
end;

function TVeiculosCCIA.delete: boolean;
var
  vtemp: string;
	vApagar: boolean;
  vCod_Veic: string;
  vChassi: string;
  vPlaca: string;
  I: Integer;
begin
  try
    Result := False;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar    := dataSet.FieldByName('ATIVO').AsInteger = 0;
      vCod_Veic  := trim(dataSet.FieldByName('CODIGO').AsString);
      vChassi    := trim(dataSet.FieldByName('CHASSI').AsString);
      vPlaca     := trim(dataSet.FieldByName('PLACA').AsString);

      prepare_loop('SEL = ''S''');

      if not dataset.IsEmpty then
      begin
        vApagar   := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCod_Veic := '';
        vChassi   := '';
        vPlaca    := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(vCod_Veic) <> '') then
        prepare_loop('CODIGO = ' + vCod_Veic)
      else
        prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          'VEÍCULO' + #13 +
          'Código: ' + vCod_Veic + #13 +
          'Chassi: ' + vChassi + #13 +
          'Placa: ' + vPlaca;

        if (trim(vCod_Veic) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('VEI012', 'EXCLUIR', '', 'VEICULOS',
          vDadosIni.IfThen(trim(vCod_Veic) <> '', vCod_Veic, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
          'VEÍCULO' + #13 +
          'Código: ' + vCod_Veic + #13 +
          'Chassi: ' + vChassi + #13 +
          'Placa: ' + vPlaca;

        if (trim(vCod_Veic) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('VEI008', 'EXCLUIR', '', 'VEICULOS',
           vDadosIni.IfThen(trim(vCod_Veic) <> '', vCod_Veic, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo veículo(s) permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo veículo(s) para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo veículo(s) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo veículo(s) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
          SqlExec(' update veiculos set ativo = 99 ' +
            ' where placa = %s and chassi = %s and codigo = %d and cod_empresa = %d ',
            [fstrq('placa'), fstrq('chassi'), fint('codigo'), fint('cod_empresa')], buscas);
          if (trim(vCod_Veic) = '') then
            vDadosIni.GravaAuditoria('VEI012', 'EXCLUIR', '', 'VEICULOS',
              dataSet.FieldByName('CODIGO').AsString, buscas);
        end
        else
        begin
          SqlExec(' update veiculos set ativo = 0 ' +
            ' where placa = %s and chassi = %s and codigo = %d and cod_empresa = %d ',
            [fstrq('placa'), fstrq('chassi'), fint('codigo'), fint('cod_empresa')], buscas);

          if (trim(vCod_Veic) = '') then
            vDadosIni.GravaAuditoria('VEI008', 'EXCLUIR', '', 'VEICULOS',
              dataSet.FieldByName('CODIGO').AsString, buscas);
        end;

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;

    Result := CommitaTransacao;
    if Result then
    begin
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'VEI012', 'VEI008'),
        'EXCLUIR', 'SUCESSO', 'VEICULOS',
        vDadosIni.IfThen(trim(vCod_Veic) <> '', vCod_Veic, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'VEI012', 'VEI008'),
        'EXCLUIR', 'FALHA', 'VEICULOS',
        vDadosIni.IfThen(trim(vCod_Veic) <> '', vCod_Veic, ''), buscas);
    end;
    if Result then
     Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

destructor TVeiculosCCIA.destroy;
begin
  vClientesVeic.Free;
  vClientesVeic := nil;
  vEspecieVeic.Free;
  vEspecieVeic := nil;
  vColaboradorVeic.Free;
  vColaboradorVeic := nil;
  vModVeic.Free;
  vModVeic := nil;
  vCombustivelVeic.Free;
  vCombustivelVeic := nil;
  vCoresVeic.Free;
  vCoresVeic := nil;
  vMarcaVeic.Free;
  vMarcaVeic := nil;
  vHistNFE.Free;
  vHistNFE := nil;
  vHistNFS.Free;
  vHistNFS := nil;
  vHistNFT.Free;
  vHistNFT := nil;
  vHistCTRE.Free;
  vHistCTRE := nil;
  vHistCTRS.Free;
  vHistCTRS := nil;
  vHistORC.Free;
  vHistORC := nil;
  vHistOS.Free;
  vHistOS := nil;
  inherited;
end;

function TVeiculosCCIA.edit: boolean;
begin
  Result := inherited edit;
  if not result then
    Exit;

  dataSet.FieldByName('PLACA').AsString := trim(dataSet.FieldByName('PLACA').AsString);
  dataSet.FieldByName('CHASSI').AsString := trim(dataSet.FieldByName('CHASSI').AsString);
  if dataSet.FieldByName('US_CAD').AsInteger = 0 then
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;

  vEspecieVeic.abreEspecieVeiculo;
  vColaboradorVeic.abreLocColaborador;
  vModVeic.abreModVeiculos;
  vMarcaVeic._AbreMarca;
  vCombustivelVeic.abreTipoCombustiveis;
  vCoresVeic._AbreCores;
  vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
  vHistNFE.dataSet.Close;
  vHistNFS.dataSet.Close;
  vHistNFT.dataSet.Close;
  vHistCTRE.dataSet.Close;
  vHistCTRS.dataSet.Close;
  vHistORC.dataSet.Close;
  vHistOS.dataSet.Close;
end;

function TVeiculosCCIA.insert: boolean;
begin
  Result := inherited insert;
  if not result then
    Exit;

  {Preenchimento de campos}

  vEspecieVeic.abreEspecieVeiculo;
  vColaboradorVeic.abreLocColaborador;
  vModVeic.abreModVeiculos;
  vMarcaVeic._AbreMarca;
  vCombustivelVeic.abreTipoCombustiveis;
  vCoresVeic._AbreCores;
  vEspecieVeic.abreEspecieVeiculo;

  dataSet.FieldByName('DATA_CAD').AsDateTime := vDadosIni.getDataBanco(buscas);
  dataSet.FieldByName('HORA_CAD').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));
  dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
  dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
end;

function TVeiculosCCIA.post: boolean;
var
  acao: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if not vDadosIni.vVeic.vDesabilitarChassi then
      if trim(dataSet.FieldByName('CHASSI').AsString) = '' then
        raiseExceptionCreate('Chassi não informado!', 'DBEdit18');
        
    if trim(dataSet.FieldByName('PLACA').AsString) = '' then
      raiseExceptionCreate('Placa no veículo não informada!', 'DBEdit26');

    if dataSet.FieldByName('MODELO').AsInteger > 0 then
      if not vModVeic.buscarModelo(dataSet.FieldByName('MODELO').AsInteger) then
        raiseExceptionCreate('Modelo não encontrado!', 'DBEdit31');
    if trim(dataSet.FieldByName('DESCMODELO').AsString) = '' then
      raiseExceptionCreate('Modelo não informada!', 'DBEdit12');

    if dataSet.FieldByName('COD_MARCA').AsInteger > 0 then
      if not vMarcaVeic.buscarMarca(dataSet.FieldByName('COD_MARCA').AsInteger) then
        raiseExceptionCreate('Marca não encontrada!', 'DBEdit14');
    if trim(dataSet.FieldByName('MARCA_V').AsString) = '' then
      raiseExceptionCreate('Marca não informada!', 'DBEdit2');

    if dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger > 0 then
      if not vCombustivelVeic.buscarCombustivel(dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger) then
        raiseExceptionCreate('Tipo de combustível não encontrado!', 'DBEdit8');
    if trim(dataSet.FieldByName('COMBUSTIVEL').AsString) = '' then
      raiseExceptionCreate('Combustível não informado!', 'DBEdit3');

    if dataSet.FieldByName('COD_COR').AsInteger > 0 then
      if not vCoresVeic.buscarCor(dataSet.FieldByName('COD_COR').AsInteger) then
        raiseExceptionCreate('Cor não encontrada!', 'DBEdit27');
    if trim(dataSet.FieldByName('COR').AsString) = '' then
      raiseExceptionCreate('Cor não informada!', 'DBEdit6');

    if dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0 then
      raiseExceptionCreate('Cliente não informado!', 'DBEdit4');
    if not vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger) then
      raiseExceptionCreate('Cliente não encontrado!', 'DBEdit4');

    if dataSet.FieldByName('COD_ESPE_SEG').AsInteger <= 0 then
      raiseExceptionCreate('Tp Fins Seg (Espécie Veículo) não informada!', 'DBLookupComboBox5');
    if not vEspecieVeic.buscarEspecie(dataSet.FieldByName('COD_ESPE_SEG').AsInteger) then
      raiseExceptionCreate('Tp Fins Seg (Espécie Veículo) não informado!', 'DBLookupComboBox5');

    if (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S') then
	  	if dataSet.FieldByName('KM_V').IsNull then
  	    raiseExceptionCreate('Km não informada', 'DBEdit7');

//    dataSet.FieldByName('MARCA_V').AsString := Copy(Trim(vMarcaVeic.dataSet.FieldByName('DESCRICAO_MARCA').AsString), 1, 15);
//    dataSet.FieldByName('DESCMODELO').AsString := Copy(Trim(vModVeic.dataSet.FieldByName('DESCRICAO').AsString), 1, 30);
    dataSet.FieldByName('ESPECIE').AsString := Trim(vEspecieVeic.dataSet.FieldByName('DESCRICAO_ESP').AsString);
//    dataSet.FieldByName('COR').AsString := Copy(Trim(vCoresVeic.dataSet.FieldByName('DESCRICAO_CORRED').AsString), 1, 10);
//    dataSet.FieldByName('COMBUSTIVEL').AsString := Copy(Trim(vCombustivelVeic.dataSet.FieldByName('DESCR_COMB').AsString), 1, 8);

  	if (vDadosIni.vVeic.vDesabilitarChassi)
    	and (trim(dataSet.FieldByName('PLACA').AsString) <> '')
    	and (trim(dataSet.FieldByName('CHASSI').AsString) = '') then
    		dataSet.FieldByName('CHASSI').AsString := dataSet.FieldByName('PLACA').AsString;

  	dataSet.FieldByName('PLACA').AsString := UpperCase(trim(dataSet.FieldByName('PLACA').AsString));
  	dataSet.FieldByName('CHASSI').AsString := UpperCase(trim(dataSet.FieldByName('CHASSI').AsString));
    if dataSet.State in [dsInsert] then
      dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('VEICULOS', DtmVeiculosCCIA.SpIncCodigoV,
        vDadosIni.codEmpresa);

    vDadosIni.vPesquisa := dataSet.FieldByName('CODIGO').AsString;
    vDadosIni.vPesquisaPlaca := Trim(dataSet.FieldByName('PLACA').AsString);
    vDadosIni.vPesquisaChassi := Trim(dataSet.FieldByName('CHASSI').AsString);

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if result then
      result := apply;
    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI011', acao, 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI').AsString, 'VEICULOS', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI011', acao, 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI').AsString, 'VEICULOS', dataSet.FieldByName('CODIGO').AsString, buscas);
    if Result then
      Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TVeiculosCCIA.restaurarRegistro: boolean;
var
	vCodVeiculo: string;
	vChassi: string;
  vPlaca: string;
  vtemp: string;
begin
	try
  	result := false;
    if dataSet.IsEmpty then
      exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      vCodVeiculo := trim(dataSet.FieldByName('CODIGO').AsString);
      vChassi     := trim(dataSet.FieldByName('CHASSI').AsString);
      vPlaca      := trim(dataSet.FieldByName('PLACA').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodVeiculo := '';
        vChassi := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodVeiculo) <> '') then
      	prepare_loop('CODIGO = ' + vCodVeiculo)
      else
		    prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'VEÍCULO' + #13 +
        'Código: ' + vCodVeiculo + #13 +
        'Descrição: ' + vChassi + #13 +
        'Placa: ' + vPlaca;

      if (trim(vChassi) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('VEI010', 'RESTAURAR', '', 'VEICULOS',
        vDadosIni.IfThen(trim(vCodVeiculo) <> '', vCodVeiculo, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando condição(ões) de pagamento');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando condição(ões) de pagamento (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update veiculos set ativo = 1 ' +
          ' where placa = %s and chassi = %s and codigo = %d and cod_empresa = %d ',
          [fstrq('placa'), fstrq('chassi'), fint('codigo'), fint('cod_empresa')], buscas);

        if (trim(vCodVeiculo) = '') then
          vDadosIni.GravaAuditoria('VEI010', 'RESTAURAR', '', 'VEICULOS',
            dataSet.FieldByName('CODIGO').AsString, buscas);

        dataset.Next;
      end;
    finally
    	vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
    	vDadosIni.GravaAuditoria('VEI010', 'RESTAURAR', 'SUCESSO', 'VEICULOS',
        vDadosIni.IfThen(trim(vCodVeiculo) <> '', vCodVeiculo, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria('VEI010', 'RESTAURAR', 'FALHA', 'VEICULOS',
        vDadosIni.IfThen(trim(vCodVeiculo) <> '', vCodVeiculo, ''), buscas);
    end;

    if Result then
      Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TVeiculosCCIA.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql('SELECT * FROM VEICULOS '+
  	' WHERE ativo = 0 ' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

procedure TVeiculosCCIA._CompraVeiculos(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

  if FrmCompraContratoVeiculosCCIA = nil then
    Application.CreateForm(TFrmCompraContratoVeiculosCCIA, FrmCompraContratoVeiculosCCIA);

  if (TipoForm > 0) and (not FrmCompraContratoVeiculosCCIA.Visible) then
    FrmCompraContratoVeiculosCCIA.ShowModal
  else if (not FrmCompraContratoVeiculosCCIA.Visible) then
    FrmCompraContratoVeiculosCCIA.Show
  else if FrmCompraContratoVeiculosCCIA.FormStyle = fsMDIChild then
    FrmCompraContratoVeiculosCCIA.Show
  else
    FrmCompraContratoVeiculosCCIA.ShowModal;
end;


procedure TVeiculosCCIA._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TVeiculosCCIA._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TVeiculosCCIA._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TVeiculosCCIA._mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

function TVeiculosCCIA._PreencherCamposApartirModelo(campopreencherCadVeiculo: string; campopreenchidoCadModelo: string): boolean;
begin
  if dataSet.FieldByName(campopreencherCadVeiculo).IsNull then
  begin
    dataSet.FieldByName(campopreencherCadVeiculo).Value := vModVeic.dataSet.FieldByName(campopreenchidoCadModelo).Value;
    Result := true;
  end
  else
    Result := false;

end;

procedure TVeiculosCCIA._VendaVeiculos(TipoForm: integer; vEstMoto: boolean = false);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Entrada/Saída de Veículos');
    vDadosIni.vTipoForm := TipoForm;

//    if not _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo Entrada/Saída se encontra aberto!') then
//    begin
//      vDadosIni.fechaStatusProcessamento;
//      exit;
//    end;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    begin
      Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('VEI033', 'CONSULTA', '', 'VEICULOS', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    try
      if frmMovVeiculosCCIA = nil then
      begin
        vDadosIni.vTipoForm := TipoForm;
        if TipoForm > 0 then
          vDadosIni.vModalOuChild := 'M'
        else
          vDadosIni.vModalOuChild := 'C';

        Application.CreateForm(TfrmMovVeiculosCCIA, frmMovVeiculosCCIA);
      end;

      if (TipoForm > 0) and (not frmMovVeiculosCCIA.Visible) then
        frmMovVeiculosCCIA.ShowModal
      else if (not frmMovVeiculosCCIA.Visible) then
        frmMovVeiculosCCIA.Show
      else if frmMovVeiculosCCIA.FormStyle = fsMDIChild then
        frmMovVeiculosCCIA.Show
      else
        frmMovVeiculosCCIA.ShowModal;
      finally
//       if vEstMoto then
//         frmMovVeiculosCCIA.Free;
      end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TVeiculosCCIA.verificajacad(vit: integer): boolean;
begin
  if vit = 1 then
  begin
    buscas.Close;
    buscas.sql.text := ' select * from veiculos ' +
    	' where chassi = ' + QuotedStr(dataSet.FieldByName('CHASSI').AsString) +
      ' and codigo <> ' + inttostr(dataset.FieldByName('CODIGO').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo <> 99 ';
    buscas.open;
    if not buscas.isempty then
    begin
      result := true;
      vcodveicpesq := buscas.FieldByName('CODIGO').AsInteger;
      vchassipesq := Trim(buscas.FieldByName('chassi').AsString);
      vplacapesq := Trim(buscas.FieldByName('placa').AsString);
    end
    else
      Result := false;
  end
  else
  begin
    buscas.Close;
    buscas.sql.text := ' select * from veiculos ' +
    	' where placa = ' + QuotedStr(dataSet.FieldByName('PLACA').AsString) +
      ' and codigo <> ' + inttostr(dataset.FieldByName('CODIGO').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo <> 99 ';
    buscas.open;
    if not buscas.isempty then
    begin
      result := true;
      vcodveicpesq := buscas.FieldByName('CODIGO').AsInteger;
      vchassipesq := Trim(buscas.FieldByName('CHASSI').AsString);
      vplacapesq := Trim(buscas.FieldByName('PLACA').AsString);
    end
    else
      Result := false;
  end;
end;


function TVeiculosCCIA.verificatipovenda(vtop: integer; vcomb: TDbCombobox;
  vtipo, vtpescol: string): boolean;
begin
  result := false;
  if vtop = 1 then
  begin
    buscas.close;
    buscas.sql.text := 'select * from tipo_vendas where tipo = ''' + vtipo + ''' and venda = ''S'' order by cod_tipo';
    buscas.open;
    vcomb.Items.Clear;
    while not buscas.eof do
    begin
      if (buscas.FieldByName('TIPO').AsString = 'REQ') or (buscas.FieldByName('TIPO').AsString = 'ORC') then
        vcomb.Items.Add(buscas.FieldByName('DESCRICAO').AsString);
      if (trim(buscas.FieldByName('TIPO').AsString) = 'OS') or (trim(buscas.FieldByName('TIPO').AsString) = 'TMO') then
        vcomb.Items.Add(buscas.FieldByName('TIPO_OS').AsString);
      buscas.next;
    end;
    Result := true;
  end;

  if vtop = 2 then
  begin
    try
      buscas.close;
      if vtipo = 'OS' then
        buscas.sql.text := 'select * from tipo_vendas where tipo = ' + QuotedStr(vtipo) + ' and tipo_os = ' + QuotedStr(vtpescol);
      buscas.open;
      if buscas.isempty then
        raiseExceptionCreate('Tipo de OS informado é inválido', 'DBComboBox1')
      else
        Result := true;
    except
      on e: exception do
      begin
        Result := false;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  end;
end;

function TVeiculosCCIA.confirmaAlteracao: boolean;
begin
  result := false;
  if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
    if Application.MessageBox('Foram feitas alterações no banco de dados.' + chr(13) +
      'Deseja confirmar as alterções?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1)
      = mrYES then
      result := true;
end;

function TVeiculosCCIA.consulta: boolean;
var
	I, erro: Integer;
	vCampoTemp: string;
	vCondicaoTmp: string; 
  vsqlAdicional: string;
begin
	vCampoTemp := '';
  vsqlAdicional := '';

	if UpperCase(trim(vCons.campo)) = 'PLACA' then
  	vCampoTemp := 'VEICULOS.PLACA'
  else if UpperCase(trim(vCons.campo)) = 'NOME CLIENTE (NOME FANTASIA)' then
    vCampoTemp := 'CLIENTES.NOME_CLIENTE'
  else if UpperCase(trim(vCons.campo)) = 'NOME CLIENTE (RAZAO SOCIAL)' then
    vCampoTemp := 'CLIENTES.RAZAO'
  else if UpperCase(trim(vCons.campo)) = 'CEP CLIENTE' then
  	vCampoTemp := 'CLIENTES.CEP'
  else if UpperCase(trim(vCons.campo)) = 'ENDERECO CLIENTE' then
    vCampoTemp := 'CLIENTES.ENDERECO'
  else if UpperCase(trim(vCons.campo)) = 'NUM ENDERECO CLIENTE' then
	  vCampoTemp := 'CLIENTES.NUM_END_CLIENTE'
  else if UpperCase(trim(vCons.campo)) = 'TELEFONE CLIENTE' then
    vCampoTemp := 'CLIENTES.FONE_CLIENTE'
  else if UpperCase(trim(vCons.campo)) = 'CELULAR CLIENTE' then
    vCampoTemp := 'CLIENTES.FONE_CELULAR'
  else if UpperCase(trim(vCons.campo)) = 'EMAIL CLIENTE' then
  	vCampoTemp := 'CLIENTES.EMAIL'
  else if UpperCase(trim(vCons.campo)) = 'ESTADO CLIENTE' then
    vCampoTemp := 'ESTADOS.SIGLA_UF'
  else if UpperCase(trim(vCons.campo)) = 'CIDADE CLIENTE' THEN
    vCampoTemp := 'CIDADES.NOME_CIDADE'
  else if UpperCase(trim(vCons.campo)) = 'BAIRRO CLIENTE' THEN
    vCampoTemp := 'BAIRROS.NOME_BAIRRO'
  else if UpperCase(trim(vCons.campo)) = 'LOCALIDADE CLIENTE' THEN
    vCampoTemp := 'LOCALIDADE.LOCALIDADE'
  else if UpperCase(trim(vCons.campo)) = 'SETOR CLIENTE' then
    vCampoTemp := 'SETOR.SETOR';
    
	if vCons.porData then
  begin
    try
      erro := 0;
      StrToDate(vCons.dataIni);
    except
      vCons.dataIni := '';
      erro := erro + 1;
    end;
    try
      StrToDate(vCons.dataFim);
    except
      vCons.dataFim := '';
      erro := erro + 1;
    end;
    if erro = 2 then
    begin
      Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
        MB_OK + MB_ICONINFORMATION);
    end;
  end; //porData

  if Trim(vCampoTemp) <> '' then
  begin
    vCondicaoTmp := vCons.Condicao;
    if vCondicaoTmp = 'Igual' then
      vCondicaoTmp := '='
    else if vCondicaoTmp = 'Maior' then
      vCondicaoTmp := '>'
    else if vCondicaoTmp = 'Maior ou Igual' then
      vCondicaoTmp := '>='
    else if vCondicaoTmp = 'Menor' then
      vCondicaoTmp := '<'
    else if vCondicaoTmp = 'Menor ou Igual' then
      vCondicaoTmp := '<='
    else if vCondicaoTmp = 'Diferente' then
      vCondicaoTmp := '<>'
    else if (vCondicaoTmp = 'Esta contido') then
      vCondicaoTmp := 'like'
    else if (vCondicaoTmp = 'Começa') then
      vCondicaoTmp := 'Começa'
    else
      vCondicaoTmp := '=';
    if trim(vsqlAdicional) <> '' then
     vsqlAdicional := vsqlAdicional + ' and ';
    if vCondicaoTmp = 'like' then
    begin
    	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
      	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%') + ') ' +
        	' or (' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
      else
	      vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%');
    end
    else if vCondicaoTmp = 'Começa' then
    begin
    	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
       	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%') + ') ' +
         	' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
      else
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%');
    end
    else
    begin
    	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
	      vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor))) + ') ' +
  	      ' or (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))) + ')) '
      else
	      vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor)));
    end;
    vCons.valor := '';
    vCons.campo := '';
    vCons.ordem := vCampoTemp;
  end;

  if vCons.porData then
    result := ConsultaCampos('VEICULOS', vCons.campo, vCons.ordem, vCons.dataIni,
      vCons.dataFim, vDadosIni.codEmpresa, 1,
      ' VEICULOS.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
      ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
      ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR ',
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ',
      vsqlAdicional)

  else
  	result := ConsultaCampos('VEICULOS', vCons.valor, vCons.campo, vCons.condicao,
      vCons.ordem, False, vDadosIni.codEmpresa,
      ' VEICULOS.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
      ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
      ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR ',
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ',
      vsqlAdicional);
end;

{ TModVeiculoCCIA }

function TModVeiculoCCIA.abreModelos(pTipoV: string = ''): boolean;
begin
  if trim(pTipoV) = 'N' then
    Result := montaSelect(' SELECT * FROM TIPMODELO ' +
    	' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND ATIVO = 1 ' +
      ' AND VNDESTOQUE = ''S'' ' +
      ' ORDER BY DESCRICAO ')
  else
    Result := montaSelect(' SELECT * FROM TIPMODELO ' +
    	' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND ATIVO = 1 ' +
      ' ORDER BY DESCRICAO ');
end;

function TModVeiculoCCIA.abreModelos(descFabricante: string; pTipoV: string = ''): boolean;
begin
  if trim(pTipoV) = 'N' then
    Result := montaSelect(' SELECT * FROM TIPMODELO ' +
    	' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND DESFAB = ' + QuotedStr(descFabricante) +
      ' AND ATIVO = 1 ' +
      ' AND VNDESTOQUE = ''S'' ' +
      ' ORDER BY DESCRICAO ')
  else
    Result := montaSelect(' SELECT * FROM TIPMODELO ' +
    	' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND DESFAB = ' + QuotedStr(descFabricante) +
      ' AND ATIVO = 1 ' +
      ' ORDER BY DESCRICAO ');
  Result := not dataSet.IsEmpty;
end;

function TModVeiculoCCIA.abreModelos(codModelo: integer; pTipoV: string = ''): boolean;
begin
  if trim(pTipoV) = 'N' then
    Result := montaSelect(' SELECT * FROM TIPMODELO ' +
    	' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND CODIGO = ' + IntToStr(codModelo) +
      ' AND ATIVO = 1 ' +
      ' AND VNDESTOQUE = ''S'' ' +
      ' ORDER BY DESCRICAO ')
  else
    Result := montaSelect(' SELECT * FROM TIPMODELO ' +
    	'	WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND CODIGO = ' + IntToStr(codModelo) +
      ' AND ATIVO = 1 ' +
      ' ORDER BY DESCRICAO ');
  Result := not dataSet.IsEmpty;
end;

function TModVeiculoCCIA.abreModVeiculos(pTipoV: string = ''): boolean;
begin
  if trim(pTipoV) = 'N' then
    result := montaSelect('SELECT * FROM TIPMODELO ' +
    	' WHERE ATIVO = 1 ' +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND VNDESTOQUE = ''S'' ' +
      ' ORDER BY DESCRICAO ')
  else
    result := montaSelect('SELECT * FROM TIPMODELO ' +
    	' WHERE ATIVO = 1 ' +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' ORDER BY DESCRICAO ');
end;

function TModVeiculoCCIA.AbrirCombustivel: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'COMBUSTIVEL| ' + dataSet.FieldByName('CODIGO').AsString;

  formulario := Funcoes.AbreForm('pkCadastrosBasicos', 'TfrmCadCombustivel', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TModVeiculoCCIA.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect(' select * from tipmodelo ' +
    	' where ativo = 0 ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by codigo ');
end;

function TModVeiculoCCIA.AbrirMarca: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'MARCAS| ' + dataSet.FieldByName('COD_MARCA').AsString;

  formulario := Funcoes.AbreForm('pkCadastrosBasicos', 'TfrmCadMarcas', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TModVeiculoCCIA.alterarOrdemImpressao(pOrdem: Integer): boolean;
begin
 buscas.Close;
 buscas.SQL.Text := ' UPDATE TIPMODELO SET ORDTIPO = :ORDTIPO ' +
  ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
 buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
 buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
 buscas.ParamByName('ORDTIPO').AsInteger := pOrdem;
 try
    buscas.ExecSQL;
    vDadosIni.GravaAuditoria('VEI164', 'ALTERAR', 'SUCESSO', 'TIPMODELO', dataSet.FieldByName('CODIGO').AsString, buscas);
    CommitaTransacao;
    Application.MessageBox('Ordem de impressão alterada com sucesso.', 'Atenção', 0 + 64);
  except
    RollBackTransacao;
    vDadosIni.GravaAuditoria('VEI164', 'ALTERAR', 'FALHA', 'TIPMODELO', dataSet.FieldByName('CODIGO').AsString, buscas);
    Application.MessageBox('Não foi possível alterar ordem de impressão.', 'Atenção', 0 + 64);
  end;
end;

function TModVeiculoCCIA.buscarModelo(pCodModelo: integer; codEmpresa: Integer = 0; pTipoV: string = ''): Boolean;
var
 I: Integer;
begin
  buscas.Close;
  if trim(pTipoV) = 'N' then
    buscas.SQL.Text := ' SELECT * FROM TIPMODELO ' +
      ' WHERE CODIGO = ' + IntToStr(pCodModelo) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND ATIVO = 1 ' +
      ' AND VNDESTOQUE = ''S'' '
  else
    buscas.SQL.Text := ' SELECT * FROM TIPMODELO ' +
      ' WHERE CODIGO = ' + IntToStr(pCodModelo) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND ATIVO = 1 ';
  buscas.Open;

  result := not buscas.IsEmpty;

  if (Result) and (codEmpresa > 0) then
  begin
   for i := 0 to buscas.Fields.Count - 1 do
   begin
     if dataSet.FindField(buscas.Fields[I].FieldName) <> nil then
       dataSet.FieldByName(buscas.Fields[I].FieldName).Value := buscas.Fields[I].Value;
   end;
   dataSet.FieldByName('COD_EMPRESA').AsInteger := CodEmpresa;
  end;
end;

function TModVeiculoCCIA.buscarNCM(pNCM: string): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select * from nbm where cod_ncm = ' + QuotedStr(pNCM);
  buscas.Open;

  result := not buscas.IsEmpty;
end;

procedure TModVeiculoCCIA.CadModVeiculos(TipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de Modelo de Veículos');
    vDadosIni.vTipoForm := TipoForm;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    begin
      Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('VEI005', 'CONSULTA', '', 'TIPMODELO', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if FrmCadModVeiculosCCIA = nil then
    begin
      vDadosIni.vTipoForm := TipoForm;
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TFrmCadModVeiculosCCIA, FrmCadModVeiculosCCIA);
    end;

    if (TipoForm > 0) and (not FrmCadModVeiculosCCIA.Visible) then
      FrmCadModVeiculosCCIA.ShowModal
    else if (not FrmCadModVeiculosCCIA.Visible) then
      FrmCadModVeiculosCCIA.Show
    else if FrmCadModVeiculosCCIA.FormStyle = fsMDIChild then
      FrmCadModVeiculosCCIA.Show
    else
      FrmCadModVeiculosCCIA.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TModVeiculoCCIA.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsModVeiculos);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasMV);

  vEspecieVeic := TEspecieVeiculo.create;
  vTabelaFipe := TTabelaFipe.create;
  vCombustivelVeic := TListaTPComb.create;
  vMarcaVeic := TListaMarca.create;
  vTabPreco := TTabPrecoVeic.create;
  vCodFab := TModVeiculo_CodigoFab.create;
  vServicosSugeridos := TServicosSugeridos.create;

  vCombustivelVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsTpComb);
  vMarcaVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsMarca);
  vEspecieVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsEspecieVeiculo);
end;

function TModVeiculoCCIA.delete: boolean;
var
  vtemp: string;
	vApagar: boolean;
  vCod_Mod_Veic: string;
  vDesc_Mod_Veic: string;
  I: Integer;
begin
  try
    Result := False;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
      vCod_Mod_Veic  := trim(dataSet.FieldByName('CODIGO').AsString);
      vDesc_Mod_Veic := trim(dataSet.FieldByName('DESCRICAO').AsString);

      prepare_loop('SEL = ''S''');

      if not dataset.IsEmpty then
      begin
        vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCod_Mod_Veic  := '';
        vDesc_Mod_Veic := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(vCod_Mod_Veic) <> '') then
        prepare_loop('CODIGO = ' + vCod_Mod_Veic)
      else
        prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          'MODELO DE VEÍCULO' + #13 +
          'Código: ' + vCod_Mod_Veic + #13 +
          'Descrição: ' + vDesc_Mod_Veic;

        if (trim(vCod_Mod_Veic) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('VEI019', 'EXCLUIR', '', 'TIPMODELO',
          vDadosIni.IfThen(trim(vCod_Mod_Veic) <> '', vCod_Mod_Veic, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
          'MODELO DE VEÍCULO' + #13 +
          'Código: ' + vCod_Mod_Veic + #13 +
          'Descrição: ' + vDesc_Mod_Veic;

        if (trim(vCod_Mod_Veic) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('VEI015', 'EXCLUIR', '', 'TIPMODELO',
           vDadosIni.IfThen(trim(vCod_Mod_Veic) <> '', vCod_Mod_Veic, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo modelo(s) de veículo permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo modelo(s) de veículo para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo modelo(s) de veículo permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo modelo(s) de veículo para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
          SqlExec(' update tipmodelo set ativo = 99 ' +
            ' where codigo = %d and cod_empresa = %d ',
            [fint('codigo'), fint('cod_empresa')], buscas);
          if (trim(vCod_Mod_Veic) = '') then
            vDadosIni.GravaAuditoria('VEI019', 'EXCLUIR', '', 'TIPMODELO',
              dataSet.FieldByName('CODIGO').AsString, buscas);
        end
        else
        begin
          SqlExec(' update tipmodelo set ativo = 0 ' +
            ' where codigo = %d and cod_empresa = %d ',
            [fint('codigo'), fint('cod_empresa')], buscas);

          if (trim(vCod_Mod_Veic) = '') then
            vDadosIni.GravaAuditoria('VEI015', 'EXCLUIR', '', 'TIPMODELO',
              dataSet.FieldByName('CODIGO').AsString, buscas);
        end;

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;

    Result := CommitaTransacao;
    if Result then
    begin
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'VEI019', 'VEI015'),
        'EXCLUIR', 'SUCESSO', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCod_Mod_Veic) <> '', vCod_Mod_Veic, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'VEI019', 'VEI015'),
        'EXCLUIR', 'FALHA', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCod_Mod_Veic) <> '', vCod_Mod_Veic, ''), buscas);
    end;
    if Result then
     Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

destructor TModVeiculoCCIA.destroy;
begin
  vEspecieVeic.Free;
  vEspecieVeic := nil;
  vTabelaFipe.Free;
  vTabelaFipe := nil;
  vCombustivelVeic.Free;
  vCombustivelVeic := nil;
  vMarcaVeic.Free;
  vMarcaVeic := nil;
  vTabPreco.Free;
  vTabPreco := nil;
  vCodFab.Free;
  vCodFab := nil;
  vServicosSugeridos.Free;
  vServicosSugeridos := nil;
end;

function TModVeiculoCCIA.edit: boolean;
begin
  Result := inherited edit;
  if not result then
    exit;

  vTabelaFipe.abreTabelaFipe;
  vCombustivelVeic.abreTipoCombustiveis;
  vMarcaVeic._AbreMarca;
  vEspecieVeic.abreEspecieVeiculo;
  vCodFab.abreCodigo(dataSet.FieldByName('codigo').AsInteger);
  vServicosSugeridos.abreServico(dataSet);
end;

function TModVeiculoCCIA.insert: boolean;
begin
  try
    result := inherited insert;
    if not result then
      exit;

    if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'MODVEICULOSCAD' then
      dataSet.FieldByName('CODIGO').AsInteger := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3))
    else
      dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
    vTabelaFipe.abreTabelaFipe;
    vCombustivelVeic.abreTipoCombustiveis;
    vMarcaVeic._AbreMarca;
    vEspecieVeic.abreEspecieVeiculo;
    vServicosSugeridos.abreServico(dataSet);
  finally
  end;
end;

function TModVeiculoCCIA.post: boolean;
var
  acao: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if trim(dataSet.FieldByName('DESCRICAO').AsString) = '' then
    begin
      FrmCadModVeiculosCCIA.TabSheet4.Show;
      raiseExceptionCreate('Descrição do modelo não informada!', 'DBEDIT2');
    end;

    if vDadosIni.vRegistro.vSisVeiculos then
    begin
    	if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') or (vDadosIni.vVeic.TestarDetEspec) then
        if trim(dataSet.FieldByName('CILINDRADA').AsString) = '' then
        begin
          FrmCadModVeiculosCCIA.TabSheet4.Show;
          raiseExceptionCreate('Cilindrada não informada!', 'DBEDIT10');
        end;

      try
        if (trim(dataSet.FieldByName('LOTACAO').AsString) = '') or (StrToInt(trim(dataSet.FieldByName('LOTACAO').AsString)) <= 0) then
        begin
          FrmCadModVeiculosCCIA.TabSheet4.Show;
          raiseExceptionCreate('Lotação: (Pass.) não informado!', 'DBComboBox4');
        end;
      except
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Lotação: (Pass.) não informado!', 'DBComboBox4');
      end;

      if dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger <= 0 then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Combustível não informado!', 'DBEdit43');
      end;
      if not vCombustivelVeic.buscarCombustivel(dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger) then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Combustível não encontrado!', 'DBEdit43');
      end;

      if trim(dataSet.FieldByName('NCMSH').AsString) = '' then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('O campo NCM/SH precisa ser preenchido!', 'DBEDIT16');
      end;
      if not buscarNCM(dataSet.FieldByName('NCMSH').AsString) then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('O campo NCM/SH não encontrado no cadastro!', 'DBEDIT16');
      end;

      if dataSet.FieldByName('COD_TIPO_ESP').AsInteger <= 0 then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Tp Fins Seg (Espécie Veículo) Seg não informada!', 'DBLookupComboBox5');
      end;
      if not vEspecieVeic.buscarEspecie(dataSet.FieldByName('COD_TIPO_ESP').AsInteger) then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Tp Fins Seg (Espécie Veículo) não encontrada!', 'DBLookupComboBox5');
      end;

      if dataSet.FieldByName('COD_MARCA').AsInteger <= 0 then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Marca não informada!', 'DBEdit18');
      end;
      if not vMarcaVeic.buscarMarca(dataSet.FieldByName('COD_MARCA').AsInteger) then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Marca não encontrada!', 'DBEdit18');
      end;

      if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') or (vDadosIni.vVeic.TestarDetEspec) then
        if trim(dataSet.FieldByName('RENAVAM').AsString) = '' then
        begin
          FrmCadModVeiculosCCIA.TabSheet4.Show;
          raiseExceptionCreate('Renavam não informado!', 'DBEDIT37');
        end;

      if trim(dataSet.FieldByName('ESPRENAVAM').AsString) = '' then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Espécie Renavam não informada!', 'DBCOMBOBOX6');
      end;

      if trim(dataSet.FieldByName('TIP_VEICULO').AsString) = '' then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Modelo Renavan não informado!', 'DBCOMBOBOX5');
      end;

      if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') and (dataSet.FieldByName('VL_UNITARIO_NF').AsFloat <= 0) then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Valor unitário de NF inválido.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT38');
      end;

      if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') or (vDadosIni.vVeic.TestarDetEspec) then
        if trim(dataSet.FieldByName('CMKG').AsString) = '' then
        begin
          FrmCadModVeiculosCCIA.TabSheet4.Show;
          raiseExceptionCreate('CMKG não informado.', 'DBEDIT39');
        end;

    	if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') or (vDadosIni.vVeic.TestarDetEspec) then
        if trim(dataSet.FieldByName('DISTANCIAEIXO').AsString) = '' then
        begin
          FrmCadModVeiculosCCIA.TabSheet4.Show;
          raiseExceptionCreate('Distância entre eixos não informada!', 'DBEDIT40');
        end;

      if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') or (vDadosIni.vVeic.TestarDetEspec) then
        if dataSet.FieldByName('PESOB').AsFloat <= 0 then
        begin
          FrmCadModVeiculosCCIA.TabSheet4.Show;
          raiseExceptionCreate('Peso bruto não informado.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT41');
        end;

      if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') or (vDadosIni.vVeic.TestarDetEspec) then
        if dataSet.FieldByName('PESOL').AsFloat <= 0 then
        begin
          FrmCadModVeiculosCCIA.TabSheet4.Show;
          raiseExceptionCreate('Peso liquido inválido.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT42');
        end;

      if dataSet.FieldByName('VALOR_PIS').Asfloat <= 0 then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Valor PIS inválido.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT45');
      end;

      if dataSet.FieldByName('VALOR_COFINS').AsFloat <= 0 then
      begin
        FrmCadModVeiculosCCIA.TabSheet4.Show;
        raiseExceptionCreate('Valor COFINS inválido.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT46');
      end;

      if (dataSet.FieldByName('PERC_RED').AsFloat > 0) and (trim(dataSet.FieldByName('RED_LUCRO').AsString) = '') then
      begin
        FrmCadModVeiculosCCIA.TabSheet7.Show;
        raiseExceptionCreate('Redução de Lucro não foi informada!', 'DBComboBox2');
      end;

      if vTabPreco.dataSet.State in [dsInsert, dsEdit] then
      begin
        FrmCadModVeiculosCCIA.TabSheet5.Show;
        raiseExceptionCreate('Confime ou cancele antes de confirmar a operação', 'BitBtn_Salvar_Tab');
      end;
    end;

    if not vServicosSugeridos.verificarServicos(dataSet) then
    begin
    	FrmCadModVeiculosCCIA.TabSheet8.Show;
     	raiseExceptionCreate('Nenhum serviço informado', 'DBGrid4');
    end;

    dataSet.FieldByName('LOTACAO').AsString := trim(dataSet.FieldByName('LOTACAO').AsString);
    dataSet.FieldByName('LOTACAO').AsString := vDadosIni.StrZero(dataSet.FieldByName('LOTACAO').AsInteger, 2);
    dataSet.FieldByName('TIPO').AsString := trim(vEspecieVeic.dataSet.FieldByName('DESCRICAO_ESP').AsString);
    dataSet.FieldByName('MARCA_DESC').AsString := trim(vMarcaVeic.dataSet.FieldByName('DESCRICAO_MARCA').AsString);
    dataSet.FieldByName('RENAVAM').AsString := copy(trim(dataSet.FieldByName('RENAVAM').AsString), 1, 6);
    dataSet.FieldByName('TPCOMB').AsString := vDadosIni.StrZero(dataSet.FieldByName('COD_COMBUSTIVEL').AsString, 2);
    dataSet.FieldByName('ESPRENAVAM').AsString := vDadosIni.StrZero(dataSet.FieldByName('ESPRENAVAM').AsString, 2);
    dataSet.FieldByName('TIP_VEICULO').AsString := vDadosIni.StrZero(dataSet.FieldByName('TIP_VEICULO').AsString, 2);
    dataSet.FieldByName('PISCOFINS').AsCurrency := dataSet.FieldByName('VALOR_PIS').AsCurrency + dataSet.FieldByName('VALOR_COFINS').AsCurrency;
    dataSet.FieldByName('COMBUSTIVEL').AsString := Trim(vCombustivelVeic.dataSet.FieldByName('DESCR_COMB').AsString);

    if dataSet.State in [dsInsert] then
    begin
      if StrToInt(vDadosIni.codEmpresa) <> dataSet.FieldByName('COD_EMPRESA').AsInteger then
      begin
       buscas.Close;
       buscas.SQL.Text := ' SELECT C.VALOR FROM CODIGO C ' +
         ' WHERE C.TABELA = ''TIPMODELO'' AND C.COD_EMPRESA = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger);
       buscas.Open;

       if (buscas.IsEmpty) and (dataSet.FieldByName('CODIGO').AsInteger > buscas.FieldByName('VALOR').AsInteger) then
         dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('TIPMODELO', DtmVeiculosCCIA.SpIncCodigoV, dataSet.FieldByName('COD_EMPRESA').AsString);
      end
      else
        dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('TIPMODELO', DtmVeiculosCCIA.SpIncCodigoV, dataSet.FieldByName('COD_EMPRESA').AsString);
      vDadosIni.vPesquisa := dataSet.FieldByName('CODIGO').AsString;
    end;

    Result := inherited post;

    if result and (dataSet.ChangeCount = 0) and (acao = 'EDITAR') then
    begin
      Cancel;
      Result := true;
      Exit;
    end;
    
    vServicosSugeridos.SalvarServicos(dataSet);

    if result then
      result := apply;
    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI018', acao, 'SUCESSO', 'TIPMODELO', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI018', acao, 'FALHA', 'TIPMODELO', dataSet.FieldByName('CODIGO').AsString, buscas);
    if Result then
      Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TModVeiculoCCIA.restaurarRegistro: boolean;
var
	vCodModVeic: string;
	vDescModVeic: string;
  vtemp: string;
begin
	try
  	result := false;
    if dataSet.IsEmpty then
      exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      vCodModVeic := trim(dataSet.FieldByName('CODIGO').AsString);
      vDescModVeic := trim(dataSet.FieldByName('DESCRICAO').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodModVeic := '';
        vDescModVeic := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodModVeic) <> '') then
      	prepare_loop('CODIGO = ' + vCodModVeic)
      else
		    prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'MODELO DE VEÍCULO' + #13 +
        'Código: ' + vCodModVeic + #13 +
        'Descrição: ' + vDescModVeic;

      if (trim(vDescModVeic) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('VEI017', 'RESTAURAR', '', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCodModVeic) <> '', vCodModVeic, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando modelo(s) de veículo');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando modelo(s) de veículo (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update tipmodelo set ativo = 1 ' +
          ' where codigo = %d and cod_empresa = %d ',
          [fint('codigo'), fint('cod_empresa')], buscas);

        if (trim(vCodModVeic) = '') then
          vDadosIni.GravaAuditoria('VEI017', 'RESTAURAR', '', 'TIPMODELO',
            dataSet.FieldByName('CODIGO').AsString, buscas);

        dataset.Next;
      end;
    finally
    	vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
    	vDadosIni.GravaAuditoria('VEI017', 'RESTAURAR', 'SUCESSO', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCodModVeic) <> '', vCodModVeic, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria('VEI017', 'RESTAURAR', 'FALHA', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCodModVeic) <> '', vCodModVeic, ''), buscas);
    end;

    if Result then
      Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TModVeiculoCCIA.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql(' SELECT first 1 codigo FROM TIPMODELO ' +
  	' where ativo = 0 ' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TModVeiculoCCIA.validaNCM: Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cod_ncm, cest from nbm where cod_ncm = ' + QuotedStr(dataSet.FieldByName('ncmsh').AsString);
  buscas.Open;

  result := not buscas.IsEmpty;
  if (Result) and (dataSet.State in [dsEdit, dsInsert]) then
    dataSet.FieldByName('cest').AsString := buscas.FieldByName('cest').AsString;
end;

function TModVeiculoCCIA.verificaModeloVeiculo(datasettemp: TClientDataSet): boolean;
var
  stadoDt: TDataSetState;
begin
  if not (datasettemp.state in [dsInsert, dsEdit]) then
    Exit;
  stadoDt := dataSet.State;
  //  if vDetVeic.dataSet.FieldByName('versao').OldValue <>
  //    vDetVeic.dataSet.FieldByName('versao').NewValue then
  begin
    datasettemp.post;
    datasettemp.Edit;
    datasettemp.FieldByName('VERSAOEST').AsString :=
      dataSet.FieldByName('codigo').AsString;
    datasettemp.FieldByName('DESCRICAO_VERSAOEST').AsString :=
      dataSet.FieldByName('descricao').AsString;
    datasettemp.FieldByName('CILINDROSEST').AsInteger :=
      dataSet.FieldByName('cilindros').AsInteger;
    datasettemp.FieldByName('HPEST').AsFloat :=
      dataSet.FieldByName('hp').AsFloat;
    datasettemp.FieldByName('CILINDRADAEST').AsInteger :=
      dataSet.FieldByName('CILINDRADA').AsInteger;
    datasettemp.FieldByName('LOTACAOEST').AsString :=
     dataSet.FieldByName('lotacao').AsString;
    datasettemp.FieldByName('RENAVAMEST').AsString :=
      dataSet.FieldByName('renavam').AsString;
    datasettemp.FieldByName('PRECO_TABEST').AsFloat :=
      dataSet.FieldByName('VALTAB').AsFloat;
    datasettemp.FieldByName('NSERIE').AsString :=
      copy(trim(dataSet.FieldByName('inichassi1').AsString), 9, 9);
    datasettemp.FieldByName('TIP_PINTURA').AsString := 'S';
    datasettemp.FieldByName('COD_COMBUSTIVEL').AsInteger :=
      dataSet.FieldByName('TPCOMB').AsInteger;
    datasettemp.FieldByName('COMBUSTIVELEST').AsString :=
      dataSet.FieldByName('combustivel').AsString;
    datasettemp.FieldByName('COD_ESPE_SEG').AsInteger :=
      dataSet.FieldByName('cod_tipo_esp').AsInteger;
    datasettemp.FieldByName('TIPOEST').AsString :=
      dataSet.FieldByName('tipo').AsString;
    datasettemp.FieldByName('COD_MARCA').AsInteger :=
      dataSet.FieldByName('cod_marca').AsInteger;
    datasettemp.FieldByName('MARCAEST').AsString :=
      dataSet.FieldByName('marca_desc').AsString;
    datasettemp.FieldByName('BASE_CALC_ICM_SUBEST').AsFloat :=
      dataSet.FieldByName('vlbicmsub').AsFloat;
    datasettemp.FieldByName('VALOR_ICM_SUBEST').AsFloat :=
      dataSet.FieldByName('vlicmsub').AsFloat;
    datasettemp.FieldByName('FRETE_AQUISICAOEST').AsFloat := 0;
    datasettemp.FieldByName('FRETE_VENDAEST').AsFloat := 0;
    datasettemp.Edit;

    if stadoDt = dsEdit then
      dataSet.Edit;
    if (datasettemp.FieldByName('ANO_FABEST').AsInteger = 0) and
      (datasettemp.FieldByName('ANO_MODEST').AsInteger = 0) then
    begin
      if copy(datasettemp.FieldByName('CHASSI_C').AsString, 1, 10) =
        copy(dataSet.FieldByName('inichassi1').AsString, 1, 10) then
      begin
        datasettemp.FieldByName('ANO_FABEST').asinteger :=
          dataSet.FieldByName('ANO1').asinteger;
        datasettemp.FieldByName('ANO_MODEST').asinteger :=
          dataSet.FieldByName('MODELO1').asinteger;
      end
      else
      begin
        datasettemp.FieldByName('ANO_FABEST').asinteger :=
          dataSet.FieldByName('ANO2').asinteger;
        datasettemp.FieldByName('ANO_MODEST').asinteger :=
          dataSet.FieldByName('MODELO2').asinteger;
      end;
    end;
    datasettemp.post;
    datasettemp.Edit;
  end;
end;

procedure TModVeiculoCCIA._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TModVeiculoCCIA._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TModVeiculoCCIA._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TModVeiculoCCIA.confirmaAlteracao: boolean;
begin
  result := false;
  if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
    if Application.MessageBox('Foram feitas alterações no banco de dados.' + chr(13) +
      'Deseja confirmar as alterções?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1)
      = mrYES then
      result := true;
end;

{ TTabelaFipe }

function TTabelaFipe.abreTabelaFipe: Boolean;
begin
  Result := montaSelect('select * from tab_fipe where ativo=1 order by desc_mod');
end;

constructor TTabelaFipe.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsTabelaFipe);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV)
end;

{ TLocCliente }

function TLocCliente.abreClientes(codcli: integer): boolean;
begin
  Result := montaSelect('SELECT * FROM CLIENTES WHERE ativo = 1' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa + ' and cod_cliente = ' + inttostr(codcli));

  Result := not dataSet.IsEmpty;
end;

function TLocCliente.abreClientes: boolean;
begin
  Result := montaSelect('SELECT * FROM CLIENTES WHERE ativo = 1' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

function TLocCliente.abreClientes(codcli: integer; natureza: string): boolean;
begin
//  if natureza = 'S' then
//    Result := montaSelect('SELECT * FROM CLIENTES WHERE ativo = 1' +
//      ' AND ((TIPO <> ''F'') OR (TIPO IS NULL)) and COD_EMPRESA =' + vDadosIni.codEmpresa + ' and cod_cliente = ' + inttostr(codcli))
//  else
//    Result := montaSelect('SELECT * FROM CLIENTES WHERE ativo = 1' +
//      ' AND ((TIPO <> ''C'') OR (TIPO IS NULL)) and COD_EMPRESA =' + vDadosIni.codEmpresa + ' and cod_cliente = ' + inttostr(codcli));
  Result := montaSelect('SELECT * FROM CLIENTES WHERE ativo = 1' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa + ' and cod_cliente = ' + inttostr(codcli));

  Result := not dataSet.IsEmpty;
end;

function TLocCliente.AbrirCliente(codcli: string): boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'CLIENTE| ' + codcli;

  formulario := Funcoes.AbreForm('pkClientes', 'TfrmCadClientes', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

constructor TLocCliente.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsLocClientes);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TLocCliente.faturamentoBarrado(CodFaturamento: integer; pExibirMens: boolean = true): boolean;
begin
  result := false;
  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM Tipo_Faturamento ' +
    'where CODIGO_FATURAMENTO = ' + inttostr(CodFaturamento) + ' and ativo=1';
  buscas.Open;
  
  if not buscas.IsEmpty then
  begin
    if Trim(buscas.FieldByName('STATUS_F').AsString) = 'BARRADO' then
    begin
      if pExibirMens then
        Application.MessageBox('Cliente Com Faturamento Barrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      Result := true;
    end;
  end;
end;

function TLocCliente.getValorDebitoCheque: Currency;
begin
  buscas.Close;
  buscas.SQL.Text := 'Select sum(VALOR_CH) soma from' +
    ' controle_cheque where cod_cliente = :vcod' +
    ' and (status_ch is null or status_ch = '''')' +
    ' and codigo_emp = :cod_empresa';
  buscas.Params[0].AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
  buscas.Params[1].AsString := vDadosIni.codEmpresa;
  buscas.Open;
  Result := buscas.FieldByName('soma').AsCurrency;
  buscas.Close;
end;

function TLocCliente.getValorDebitoCredito: Currency;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(VALOR_C) soma from controle_creditos' +
    ' where cod_cliente = :vcod' +
    ' and (status_c is null or status_c = '''')' +
    ' and codigo_emp = :cod_empresa';
  buscas.Params[0].AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
  buscas.Params[1].AsString := vDadosIni.codEmpresa;
  buscas.Open;
  Result := buscas.FieldByName('soma').AsCurrency;
  buscas.Close;
end;

procedure TLocCliente.gravaTipoCliente(pTipoCliente, pTipo: string);
var
  vDtaTemp: TDate;
  //var
  //  vTipoCliente: string;
begin
  try
    //    vTipoCliente := Trim(tipo);
    pTipoCliente := Trim(pTipoCliente);
    if trim(pTipo) = 'ORC' then
      exit
    else if trim(pTipo) = 'REQ' then
    begin
      if trim(pTipoCliente) = '' then
        pTipoCliente := 'P'
      else if (pos('P', pTipoCliente) = 0) then
        pTipoCliente := pTipoCliente + 'P|';
    end
    else if trim(pTipo) = 'OS' then
    begin
      if trim(pTipoCliente) = '' then
        pTipoCliente := 'S'
      else if (pos('S', pTipoCliente) = 0) then
        pTipoCliente := pTipoCliente + '|S';
    end
    else if (trim(pTipo) = 'CTR') or (trim(pTipo) = 'CFT') then
    begin
      if trim(pTipoCliente) = '' then
        pTipoCliente := 'V'
      else if (pos('V', pTipoCliente) = 0) then
        pTipoCliente := pTipoCliente + '|V';
    end;

    vDtaTemp := vDadosIni.getDataBanco(buscas);

    buscas.Close;
    buscas.SQL.Text := 'update clientes set tipocliente = ' + QuotedStr(pTipoCliente) + ',' +
      ' data_ult_compra = :data where cod_cliente = ' + dataset.FieldByName('cod_cliente').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('data').AsDate := vDtaTemp;
    buscas.Prepare;
    buscas.ExecSQL;
  except
    on e: exception do
    begin
      Application.MessageBox(pchar('Erro ao gravar dados da venda no cliente: ' + #13 + 'Erro: ' +
        e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TLocCliente.limiteDeCreditoEstouradoFechamento(
  Valor: currency): boolean;
var
  valorCredito: Currency;
  valorCheque: Currency;
begin
  result := false;
  if (dataset.FieldByName('LIMITE_CREDITO').AsFloat > 0) then
  begin
    if dataset.FieldByName('LIMITE_CREDITO').AsFloat < Valor then
    begin
      Application.MessageBox(PChar('Limite de Crédito Estourado para o cliente. Valor: ' +
        format('%m',
        [dataset.FieldByName('LIMITE_CREDITO').AsFloat]))
        , 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      result := true;
      exit;
    end;
    vDadosIni.abreStatusProcessamento('', 'Verificando limite de Credito');
    valorCredito := getValorDebitoCredito;
    valorCheque := getValorDebitoCheque;
    vdadosini.fechaStatusProcessamento;
    if ((Valor + valorCredito + valorCheque) > dataset.FieldByName('LIMITE_CREDITO').AsFloat) then
    begin
      Application.MessageBox(pchar('Cliente com Limite Estourado' + chr(13) +
        'Valor do Limite: ' + format('%n', [dataset.FieldByName('LIMITE_CREDITO').AsCurrency]) +
        chr(13) +
        'Valor do debito: ' + format('%n', [valorCredito + valorCheque]) + chr(13)
        +
        'Valor da Compra: ' + format('%n', [Valor])), 'Erro', MB_ICONWARNING + MB_OK);
      Result := true;
    end;
  end;
end;

function TLocCliente.verificacliente(vcod: integer): boolean;
begin
{  buscas.close;
  buscas.SQL.text:='select count(*) from clientes where cod_cliente = '+IntToStr(vcod)+
  ' and cod_empresa = '+vDadosIni.codEmpresa;
  buscas.open;
  if buscas.IsEmpty then
    result:=false
  else
    Result:=true;
  buscas.close;}
end;

{ TEspecieVeiculo }

function TEspecieVeiculo.abreEspecieVeiculo: boolean;
begin
  Result := montaSelect('SELECT * FROM ESPECIE_VEICULO WHERE ATIVO = 1');
end;

function TEspecieVeiculo.buscarEspecie(pEspecie: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select * from  especie_veiculo where codigo_esp = ' + IntToStr(pEspecie) + ' and ativo = 1';
  buscas.Open;

  result := not buscas.IsEmpty;
end;

constructor TEspecieVeiculo.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsEspecieVeiculo);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV)
end;

{ TLocColaborador }

function TLocColaborador.abreLocColaborador: boolean;
begin
  Result := montaSelect('SELECT * FROM COLABORADOR WHERE ativo = 1' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa + ' ORDER BY NOME_VENDEDOR');
end;

function TLocColaborador.abreLocGerente: boolean;
begin
  Result := montaSelect('SELECT C.* FROM COLABORADOR C' +
   ' INNER JOIN FUNCOES F ON F.COD_FUNCAO  = C.COD_FUNCAO ' +
   ' WHERE C.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND C.ATIVO = 1 ' +
   ' AND F.DESC_FUNCAO LIKE ''%GERENTE%'' ORDER BY C.NOME_VENDEDOR');
end;

function TLocColaborador.abreLocVendedor: boolean;
begin
  Result := montaSelect('SELECT C.* FROM COLABORADOR C' +
   ' INNER JOIN FUNCOES F ON F.COD_FUNCAO  = C.COD_FUNCAO ' +
   ' WHERE C.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND C.ATIVO = 1 ' +
   ' AND F.DESC_FUNCAO LIKE ''%VEND%'' ORDER BY C.NOME_VENDEDOR');
end;

function TLocColaborador.buscarColaborador(pColaborador: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT FIRST 1 COD_VENDEDOR, NOME_VENDEDOR, COD_GERENTE FROM COLABORADOR WHERE ativo = 1' +
    ' and COD_VENDEDOR = ' + IntToStr(pColaborador) + ' and COD_EMPRESA =' + vDadosIni.codEmpresa;
  buscas.Open;

  result := not buscas.IsEmpty;
end;

function TLocColaborador.buscarGerente(pColaborador: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' SELECT FIRST 1 C.COD_VENDEDOR, C.NOME_VENDEDOR, C.COD_GERENTE FROM COLABORADOR C ' +
   ' INNER JOIN FUNCOES F ON F.COD_FUNCAO  = C.COD_FUNCAO ' +
   ' WHERE C.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND C.ATIVO = 1 ' +
   ' AND F.DESC_FUNCAO LIKE ''%GERENTE%'' AND C.COD_VENDEDOR = ' + IntToStr(pColaborador);
  buscas.Open;

  result := not buscas.IsEmpty;
end;

function TLocColaborador.buscarVendedor(pColaborador: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' SELECT FIRST 1 C.COD_VENDEDOR, C.NOME_VENDEDOR, C.COD_GERENTE FROM COLABORADOR C ' +
   ' INNER JOIN FUNCOES F ON F.COD_FUNCAO  = C.COD_FUNCAO ' +
   ' WHERE C.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND C.ATIVO = 1 ' +
   ' AND F.DESC_FUNCAO LIKE ''%VEND%'' AND C.COD_VENDEDOR = ' + IntToStr(pColaborador);
  buscas.Open;

  result := not buscas.IsEmpty;
end;

constructor TLocColaborador.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsLocColaborador);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

{ TListaTPComb }

function TListaTPComb.abreTipoCombustiveis: Boolean;
begin
  Result := montaSelect('SELECT  CODIGO_TPCOMB, DESCR_COMB FROM TP_COMB_RENAVAM WHERE ativo=1');
end;

function TListaTPComb.buscarCombustivel(pCodCombustivel: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select * from tp_comb_renavam where codigo_tpcomb = ' + IntToStr(pCodCombustivel) + ' and ativo = 1';
  buscas.Open;

  result := not buscas.IsEmpty;
end;

constructor TListaTPComb.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsTPComb);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

{ TListaMarca }

function TListaMarca.buscarMarca(pCodmarca: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select * from marca_prod where cod_marca = ' + IntToStr(pCodmarca) + ' and tipo_marca =''V'' and ativo =1';
  buscas.Open;

  result := not buscas.IsEmpty;
end;

constructor TListaMarca.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsMarca);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TListaMarca._AbreMarca: boolean;
begin
  Result := montaSelect('SELECT  COD_MARCA, DESCRICAO_MARCA FROM MARCA_PROD WHERE TIPO_MARCA = ''V'' AND ATIVO=1');
end;

{ TPendencia }


function TPendencia.buscarTpPendencia(pCodigo: Integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select * from tipo_pendencia ' +
   ' where cod_tp_pendencia = ' + IntToStr(pCodigo) + ' and ativo = 1';
  buscas.Open;

  Result := not buscas.IsEmpty;
end;

constructor TPendencia.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsPendencias);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
  LocTipoPendencia := TLocTipoPendencia.create;
end;

procedure TPendencia.datasetAfterScrollPendencia(DataSet: TDataSet);
begin
   if dataSet.IsEmpty then
    exit;

  LocTipoPendencia.abreLocTipoPendencia(dataSet.FieldByName('COD_TP_PENDENCIA').AsInteger);
end;

function TPendencia.delete: boolean;
var
  codPendencia, chassi: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  codPendencia := dataSet.FieldByName('COD_PENDENCIA').AsString;
  chassi := trim(dataSet.FieldByName('CHASSI_C').AsString);

  if Application.MessageBox('Deseja excluir pendência?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
    buscas.Close;
    buscas.SQL.Text := 'delete from pendencias_veic where cod_pendencia = ' + codPendencia
      + ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;
      vDadosIni.GravaAuditoria('VEI023', 'EXCLUIR', 'SUCESSO - CHASSI ' + chassi, 'PENDENCIAS_VEIC', codPendencia, buscas);
      CommitaTransacao;
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VEI023', 'EXCLUIR', 'FALHA - CHASSI ' + chassi, 'PENDENCIAS_VEIC', codPendencia, buscas);
    end;
  end;
  result := true;
  Refresh;
end;

destructor TPendencia.destroy;
begin
  LocTipoPendencia.Free;
  LocTipoPendencia := nil;
end;

function TPendencia.edit: boolean;
begin
  Result := inherited Edit;
  if not result then
    Exit;

  LocTipoPendencia.abreLocTipoPendencia;
end;

function TPendencia.insert(vEstMoto: TEstMotoCCIA): boolean;
begin
  Result := inherited insert;
  if not result then
    Exit;

  dataSet.FieldByName('CHASSI_C').AsString := vEstMoto.dataSet.FieldByName('CHASSI_C').AsString;
  dataSet.FieldByName('PLACAEST').AsString := vEstMoto.dataSet.FieldByName('PLACAEST').AsString;
  dataSet.FieldByName('CODIGO').AsInteger := vEstMoto.dataSet.FieldByName('CODIGO').AsInteger;
  dataSet.FieldByName('DATA_PENDENCIA').AsDateTime := date;
  dataSet.FieldByName('COD_FUNC').AsInteger := vDadosIni.vCodUsuario;
  dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);

  LocTipoPendencia.abreLocTipoPendencia;
end;

function TPendencia.post: boolean;
var
  acao: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if (dataSet.FieldByName('cod_tp_pendencia').AsInteger <= 0) then
    begin
      frmEstMotosCCIA.TabSheet_Pendencias.Show;
      raiseExceptionCreate('Assunto não informado!', 'DBEdit_Assunto_Pendencia');
    end;

    if not buscarTpPendencia(dataSet.FieldByName('cod_tp_pendencia').AsInteger) then
    begin
      frmEstMotosCCIA.TabSheet_Pendencias.Show;
      raiseExceptionCreate('Assunto não encontrado!', 'DBEdit_Assunto_Pendencia');
    end;

    if trim(dataSet.FieldByName('data_pendencia').AsString) = '' then
    begin
      frmEstMotosCCIA.TabSheet_Pendencias.Show;
      raiseExceptionCreate('Data da pendência não informada', 'DBEdit_Data_Pendencia');
    end;

    if trim(dataSet.FieldByName('descricao').AsString) = '' then
    begin
      frmEstMotosCCIA.TabSheet_Pendencias.Show;
      raiseExceptionCreate('Descrição não informada', 'DBEdit_Descricao_Pendencia');
    end;

    if trim(dataSet.FieldByName('status_pendencia').AsString) = '' then
    begin
      frmEstMotosCCIA.TabSheet_Pendencias.Show;
      raiseExceptionCreate('Situação não informada!', 'DBComboBox_Status_Pendencia');
    end;

    if (trim(dataSet.FieldByName('status_pendencia').AsString) <> 'PENDENTE')
     and (trim(dataSet.FieldByName('status_pendencia').AsString) <> 'REGULAR') then
    begin
      frmEstMotosCCIA.TabSheet_Pendencias.Show;
      raiseExceptionCreate('Situação inválida!', 'DBComboBox_Status_Pendencia');
    end;

    if dataSet.FieldByName('valor_pendencia').AsFloat < 0 then
    begin
      frmEstMotosCCIA.TabSheet_Pendencias.Show;
      raiseExceptionCreate('Valor da pendência não deve ser menor que 0!', 'DBEdit_Valor_Pendencia');
    end;

    if trim(dataSet.FieldByName('data_prevista').AsString) = '' then
    begin
      frmEstMotosCCIA.TabSheet_Pendencias.Show;
      raiseExceptionCreate('Data da previsão não informada!', 'DBEdit_DataPrevista_Pendencia');
    end;

    if dataSet.State in [dsInsert] then
      dataSet.FieldByName('cod_pendencia').AsInteger := Gencodigo('PENDENCIAS_VEIC', DtmVeiculosCCIA.SpIncCodigoV,
        vDadosIni.codEmpresa);

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if result then
      result := apply;
    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI020', acao, 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'PENDENCIAS_VEIC', dataSet.FieldByName('COD_PENDENCIA').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI020', acao, 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'PENDENCIAS_VEIC', dataSet.FieldByName('COD_PENDENCIA').AsString, buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TPendencia._AbrePendencia(vChassi: string): boolean;
begin
  if dataSet.IsEmpty then
    exit;
  Result := montaSelect('SELECT PENDENCIAS_VEIC.*, TIPO_PENDENCIA.DESCRICAO AS ' +
    'DESCRICAO_TP FROM PENDENCIAS_VEIC INNER JOIN TIPO_PENDENCIA ON ' +
    'PENDENCIAS_VEIC.COD_TP_PENDENCIA = TIPO_PENDENCIA.COD_TP_PENDENCIA where ' +
    ' chassi_c = ' + QuotedStr(vChassi) +
    ' and cod_empresa  = ' + vDadosIni.codEmpresa + ' and cod_pendencia <> 0');
end;

function TPendencia._AbrePendencia(vEstMoto: TEstMotoCCIA): boolean;
begin
  if vEstMoto.dataSet.IsEmpty then
    exit;
  Result := montaSelect('SELECT PENDENCIAS_VEIC.*, TIPO_PENDENCIA.DESCRICAO AS ' +
    'DESCRICAO_TP FROM PENDENCIAS_VEIC INNER JOIN TIPO_PENDENCIA ON ' +
    'PENDENCIAS_VEIC.COD_TP_PENDENCIA = TIPO_PENDENCIA.COD_TP_PENDENCIA where ' +
    ' chassi_c = ' + QuotedStr(vEstMoto.dataSet.FieldByName('CHASSI_C').AsString) +
    ' and cod_empresa  = ' + vDadosIni.codEmpresa + ' and cod_pendencia <> 0');
end;                      

function TPendencia.AbreTipoPend: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'TPPENDENCIA| ' + dataSet.FieldByName('COD_TP_PENDENCIA').AsString;

  formulario := Funcoes.AbreForm('pkCadastrosBasicos', 'TfrmCadTipoPendencia', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

{ TLocTipoPendencia }

function TLocTipoPendencia.abreLocTipoPendencia: boolean;
begin
  Result := montaSelect('SELECT * FROM TIPO_PENDENCIA WHERE ativo = 1');
end;

function TLocTipoPendencia.abreLocTipoPendencia(pCodigo: Integer): boolean;
begin
 Result := montaSelect('SELECT * FROM TIPO_PENDENCIA WHERE cod_tp_pendencia = ' +IntToStr(pCodigo)+ ' and ativo = 1');
end;

constructor TLocTipoPendencia.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsAbreTPPendencia);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

{ TCombustivel }

function TCombustivel.abreTipoCombustiveis: Boolean;
begin
  Result := montaSelect('SELECT CODIGO_TPCOMB,DESCR_COMB FROM TP_COMB_RENAVAM WHERE ativo=1');
end;

constructor TCombustivel.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsAbreTpComb);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrAbreTPComb);
end;

{ TLocCor }

function TLocCor.buscarCor(pCodCor: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select * from  codigo_corfab where cod_cor = ' + IntToStr(pCodCor) + ' and ativo = 1';
  buscas.Open;

  result := not buscas.IsEmpty;
end;

constructor TLocCor.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsAbreCor);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrAbreCor);
end;

function TLocCor.verificaCorDenatram(dataset: TClientDataSet): Boolean;
var
  buscas2: TIBQuery;
  vCampo: string;
begin
  Result := False;
  if not (dataSet.state in [dsInsert, dsEdit]) then
    Exit;
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas2.CLose;
  if Trim(vDadosIni.vEmp.vUsarCorFabDenatran) = 'D' then
    vCampo := 'CODCORDENATRAM'
  else
    vCampo := 'COD_COR';
  buscas2.Sql.Text := 'select * from codigo_corfab where ' + vCampo + ' = ' +
    IntToStr(dataSet.FieldByName('COD_COR').AsInteger) + ' and ativo = 1';
  buscas2.Open;
  if not buscas2.isempty then
  begin
    dataSet.FieldByName('COD_COR').AsInteger := buscas2.fieldbyname('COD_COR').AsInteger;
    dataSet.FieldByName('COREST').AsString := buscas2.fieldbyname('DESCRICAO_COR').AsString;
    dataSet.FieldByName('TIP_PINTURA').AsString := buscas2.fieldbyname('TIPO_PINTURA').AsString;
    Result := True;
  end;
  buscas2.close;
end;

function TLocCor.verificaCorDescricao(dataset: TClientDataSet): boolean;
var
  buscas2: TIBQuery;
begin
  if not (dataSet.state in [dsInsert, dsEdit]) then
    Exit;
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas2.CLose;
  buscas2.Sql.Text := 'select * from codigo_corfab where descricao_cor = ' +
    QuotedStr(dataSet.FieldByName('COREST').AsString) + ' and ativo = 1';
  buscas2.Open;
  if not buscas2.isempty then
  begin
    dataSet.FieldByName('COD_COR').AsInteger := buscas2.fieldbyname('COD_COR').AsInteger;
    dataSet.FieldByName('COREST').AsString := buscas2.fieldbyname('DESCRICAO_COR').AsString;
    dataSet.FieldByName('TIP_PINTURA').AsString := buscas2.fieldbyname('TIPO_PINTURA').AsString;
  end;
  buscas2.close;
end;

function TLocCor._AbreCores: boolean;
begin
  Result := montaSelect('SELECT COD_COR, CODCORDENATRAM, TIPO_PINTURA, trim(DESCRICAO_COR)  DESCRICAO_CORRED,' +
    ' (trim(DESCRICAO_COR) ||'' - ''|| ' +
		' case ' +
    ' 	when trim(TIPO_PINTURA) =''M'' then ''MÉTALICA'' ' +
    '		when trim(TIPO_PINTURA) =''S'' then ''SÓLIDA'' ' +
    '		when trim(TIPO_PINTURA) =''P'' then ''PEROL'' ' +
    '   when trim(TIPO_PINTURA) =''F'' then ''FOSCA'' ' +
    ' end) DESCRICAO_COR  FROM CODIGO_CORFAB WHERE ATIVO = 1');
end;

{ TDespesa }

function TDespesa.buscarCliente(pCodigo: Integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select cod_cliente, nome_cliente, razao from clientes ' +
   ' where cod_cliente = ' + IntToStr(pCodigo) + ' and ativo = 1';
  buscas.Open;

  Result := not buscas.IsEmpty;
end;

function TDespesa.buscarTpDespesa(pCodigo: Integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select * from tipo_despesa ' +
   ' where cod_tp_despesa = ' + IntToStr(pCodigo) + ' and ativo = 1';
  buscas.Open;

  Result := not buscas.IsEmpty;
end;

constructor TDespesa.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsDespesas);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);

  LocCliDespesa := TLocCliente.create;
  LocTipoDespesa := TLocTipoDespesa.create;
  vCondPag := TCondPagCCIA.create;
  vControles := TControlesCCIA.create;
  vPlanoC := TPContasCCIA.create;

  LocCliDespesa.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsFornecDespesa);
  vCondPag.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsCondPagDesp);
end;

procedure TDespesa.datasetAfterScrollDespesa(DataSet: TDataSet);
begin
  if dataSet.IsEmpty then
    exit;

  LocCliDespesa.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);   
  LocTipoDespesa.abreLocTipoDespesa(dataSet.FieldByName('COD_TP_DESPESA').AsInteger);
end;

procedure TDespesa.DeletarContasAPagar(pCodigoDesp: Integer);
begin
 try
   buscas.Close;
   buscas.SQL.Text := ' DELETE FROM CONTAS_A_PAGAR ' +
     ' WHERE COD_DESPESA = :COD_DESPESA AND CODIGO_EMP = :CODIGO_EMP';
   buscas.ParamByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
   buscas.ParamByName('COD_DESPESA').AsInteger := pCodigoDesp;
   buscas.ExecSQL;
 except
 end;
end;

function TDespesa.delete: boolean;
var
  codDespesa: Integer;
  chassi: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  codDespesa := dataSet.FieldByName('COD_DESPESA').AsInteger;
  chassi := trim(dataSet.FieldByName('CHASSI_C').AsString);

  if Application.MessageBox('Deseja excluir despesa?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
     if ExecutaComandosSql('select first 1 cod_lanc from lancamentos ' +
      ' where cod_lanc = ' + IntToStr(dataSet.FieldByName('COD_LANC').AsInteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('A despesa não pode ser excluída pois está vinculado a um lançamento!',
       'Atenção', 0 + 64);
      Exit;
    end;


    buscas.Close;
    buscas.SQL.Text := 'delete from despesas_veic where cod_despesa = ' + IntToStr(codDespesa)
      + ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      DeletarContasAPagar(codDespesa);

      vDadosIni.GravaAuditoria('VEI023', 'EXCLUIR', 'SUCESSO - CHASSI ' +chassi, 'DESPESAS_VEIC', IntToStr(codDespesa), buscas);
      CommitaTransacao;
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VEI023', 'EXCLUIR', 'FALHA - CHASSI ' + chassi, 'DESPESAS_VEIC', IntToStr(codDespesa), buscas);
    end;
  end;
  result := true;
  Refresh;
end;

function TDespesa.DespesaQuitada(pCodigoDesp: Integer): boolean;
begin
   try
    buscas.Close;
    buscas.SQL.Text := 'SELECT N_CHEQ_CTP, NOMINAL_CTP, N_DOC_CTP, DATA_VENC_CTP, DTREFERENCIA, VALOR_CTP, N_CONTA_PLC, COD_FORN_NFE, CODIGO_CTRL, DATA_VENC_CTP, HISTORICO_CTP FROM CONTAS_A_PAGAR ' +
      ' WHERE COD_DESPESA = :COD_DESPESA AND CODIGO_EMP = :CODIGO_EMP ' +
      ' AND (TRIM(COALESCE(STATUS_CTP, '''')) = ''QUITADO'') ORDER BY COD_CONTRP';
    buscas.ParamByName('COD_DESPESA').AsInteger := pCodigoDesp;
    buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Prepare;
    buscas.Open;

    Result := buscas.IsEmpty;
   except
     Result := False;
   end;
end;

destructor TDespesa.destroy;
begin
  LocCliDespesa.Free;
  LocCliDespesa := nil;
  LocTipoDespesa.Free;
  LocTipoDespesa := nil;
  vCondPag.Free;
  vCondPag := nil;
  vControles.Free;
  vControles := Nil;
  vPlanoC.Free;
  vPlanoC := Nil;
end;

function TDespesa.edit: boolean;
begin
  Result := False;

  if (dataSet.FieldByName('COD_LANC').AsInteger > 0) then
  begin
    if ExecutaComandosSql('select first 1 cod_lanc from lancamentos ' +
       ' where cod_lanc = ' + IntToStr(dataSet.FieldByName('COD_LANC').AsInteger) +
       ' and codigo_emp = ' + vDadosIni.codEmpresa) then
    begin
       Application.MessageBox('Não é possível editar pois despesa está vinculado a um lançamento!',
       'Atenção', 0 + 64);
       Exit;
    end;
  end;

  Result := inherited Edit;
  if not result then
    Exit;

  LocTipoDespesa.abreLocTipoDespesa;
  LocCliDespesa.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
end;

function TDespesa.gerarDespesa(vEstMoto: TEstMotoCCIA; pAlter: boolean = false): boolean;
var
   I, K: Integer;
   dias: array of integer;
   vCond: string;
begin
 Result := False;
 K:=0;
 I := 0;
 SetLength(dias, 100);
 SetLength(FDespesas.vencimentoDocumento, 100);
 SetLength(FDespesas.dataReferencia, 100);
 SetLength(FDespesas.numeroDocumento, 100);
 SetLength(FDespesas.CodFornecedor, 100);
 SetLength(FDespesas.CodTpDespesa, 100);
 SetLength(FDespesas.Controle, 100);
 SetLength(FDespesas.NumConta, 100);
 SetLength(FDespesas.NCHQ, 100);
 SetLength(FDespesas.NCHQNominal, 100);
 SetLength(FDespesas.valorDocumento, 100);
 SetLength(FDespesas.numVenda, 100);
 SetLength(FDespesas.tipoVenda, 100);
 SetLength(FDespesas.historico, 100);

 FDespesas.parcelas := 0;
  try
    frmEstMotosCCIA.ListBox3.Clear;

    if not pAlter then
    begin
       if frmEstMotosCCIA.edcreditoQtdeParcelas.Value > 0 then
         vCond := IntToStr(frmEstMotosCCIA.edcreditoQtdeParcelas.Value) + 'X'
       else
         vCond := trim(frmEstMotosCCIA.DBLookupComboBox6.Text);

      if not vDadosIni.montarParcelamento(buscas, FDespesas.numeroDocumento, FDespesas.vencimentoDocumento, FDespesas.valorDocumento,
       trim(frmEstMotosCCIA.Edit3.Text), vDadosIni.StrToFloatFormat(frmEstMotosCCIA.EditHw1.AsValue, 2),
      LocCliDespesa.dataSet.FieldByName('COD_CLIENTE').AsInteger, vCond, frmEstMotosCCIA.edcreditoQtdeParcelas.Value) then
      begin
       SetLength(FDespesas.vencimentoDocumento, 100);
       SetLength(FDespesas.numeroDocumento, 100);
       SetLength(FDespesas.valorDocumento, 100);
       FDespesas.NumConta[I] := LocTipoDespesa.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
       FDespesas.historico[I] := 'DESPESA VEICULO ' + QuotedStr(vEstMoto.dataSet.FieldByName('chassi_c').AsString);
       FDespesas.numeroDocumento[I] := vDadosIni.StrZero(frmEstMotosCCIA.Edit3.Text, 6) + '-1';
       FDespesas.CodFornecedor[I] := LocCliDespesa.dataSet.FieldByName('COD_CLIENTE').AsInteger;
       FDespesas.CodTpDespesa[I] := LocTipoDespesa.dataSet.FieldByName('COD_TP_DESPESA').AsInteger;
       FDespesas.Controle[I] := vControles.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
       FDespesas.vencimentoDocumento[I] := DateToStr(vDadosIni.getDataBanco(buscas));
       FDespesas.dataReferencia[I] := DateToStr(vDadosIni.getDataBanco(buscas));
       FDespesas.valorDocumento[I] := frmEstMotosCCIA.EditHw1.AsValue;
       FDespesas.parcelas := FDespesas.parcelas + 1;
       frmEstMotosCCIA.ListBox3.Items.Add(FDespesas.numeroDocumento[I] + '   ' + FDespesas.vencimentoDocumento[I] + '    ' + Format('%m', [FDespesas.valorDocumento[I]]));
      end
      else
      begin
        for I := 0 to Length(FDespesas.numeroDocumento) - 1 do
        begin
         frmEstMotosCCIA.ListBox3.Items.Add(FDespesas.numeroDocumento[I] + '   ' + FDespesas.vencimentoDocumento[I] + '    ' + Format('%m', [FDespesas.valorDocumento[I]]));
         FDespesas.NumConta[I] := LocTipoDespesa.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
         FDespesas.CodFornecedor[I] := LocCliDespesa.dataSet.FieldByName('COD_CLIENTE').AsInteger;
         FDespesas.CodTpDespesa[I] := LocTipoDespesa.dataSet.FieldByName('COD_TP_DESPESA').AsInteger;
         FDespesas.historico[I] := 'DESPESA VEICULO ' + QuotedStr(vEstMoto.dataSet.FieldByName('chassi_c').AsString);
         FDespesas.Controle[I] := vControles.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
         FDespesas.dataReferencia[I] := DateToStr(vDadosIni.getDataBanco(buscas));
         FDespesas.parcelas := FDespesas.parcelas + 1;
        end;
      end;
    end
    else
    begin
       buscas.Close;
       buscas.SQL.Text := 'SELECT N_CHEQ_CTP, NOMINAL_CTP, N_DOC_CTP, DATA_VENC_CTP, DTREFERENCIA, VALOR_CTP, N_CONTA_PLC, COD_FORN_NFE, CODIGO_CTRL, DATA_VENC_CTP, HISTORICO_CTP FROM CONTAS_A_PAGAR ' +
         ' WHERE COD_DESPESA = :COD_DESPESA AND CODIGO_EMP = :CODIGO_EMP ORDER BY COD_CONTRP';
       buscas.ParamByName('COD_DESPESA').AsInteger := dataSet.FieldByName('COD_DESPESA').AsInteger;
       buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.Prepare;
       buscas.Open;

       buscas.First;
       while not buscas.Eof do
       begin
          FDespesas.NumConta[I] := buscas.FieldByName('N_CONTA_PLC').AsFloat;
          FDespesas.historico[I] := buscas.FieldByName('HISTORICO_CTP').AsString;
          FDespesas.numeroDocumento[I] :=  buscas.FieldByName('N_DOC_CTP').AsString;
          FDespesas.CodFornecedor[I] := buscas.FieldByName('COD_FORN_NFE').AsInteger;
          FDespesas.Controle[I] := buscas.FieldByName('CODIGO_CTRL').AsInteger;
          FDespesas.vencimentoDocumento[I] := buscas.FieldByName('DATA_VENC_CTP').AsString;
          FDespesas.dataReferencia[I] := buscas.FieldByName('DTREFERENCIA').AsString;
          FDespesas.valorDocumento[I] := buscas.FieldByName('VALOR_CTP').AsFloat;
          FDespesas.CodTpDespesa[I] := LocTipoDespesa.dataSet.FieldByName('COD_TP_DESPESA').AsInteger;
          FDespesas.NCHQ[I] := buscas.FieldByName('N_CHEQ_CTP').AsString;
          FDespesas.NCHQNominal[I] := buscas.FieldByName('NOMINAL_CTP').AsString;
          frmEstMotosCCIA.ListBox3.Items.Add(trim(buscas.FieldByName('N_DOC_CTP').AsString) + '   '
           + trim(buscas.FieldByName('DATA_VENC_CTP').AsString) + '    ' + Format('%m', [buscas.FieldByName('VALOR_CTP').AsFloat]));
          FDespesas.parcelas := FDespesas.parcelas + 1; 
          buscas.Next;
       end;
    end;
    Result := True;
 except
   Result := False;
 end;

end;

procedure TDespesa.GravarContasPagarTemp(cdsDesp: TClientDataSet);
var
 I: Integer;
 vNomeCtr, vContrBanco: string;
begin
  while not cdsDesp.IsEmpty do
      cdsDesp.Delete;
  for I := 0 to FDespesas.parcelas - 1 do
  begin
    cdsDesp.Insert;
    cdsDesp.FieldByName('NumConta').AsFloat := FDespesas.NumConta[I];
    cdsDesp.FieldByName('Departamento').AsString := trim(vPlanoC.dataset.FieldByName('desc_dep').AsString);
    cdsDesp.FieldByName('DataReferencia').AsString := FDespesas.dataReferencia[I];
    cdsDesp.FieldByName('DataVenc').AsString := FDespesas.vencimentoDocumento[I];
    cdsDesp.FieldByName('NumDoc').AsString := FDespesas.numeroDocumento[I];
    cdsDesp.FieldByName('Historico').AsString := FDespesas.historico[I];
    cdsDesp.FieldByName('TipoDespesa').AsInteger := FDespesas.CodTpDespesa[I];
    cdsDesp.FieldByName('Valor').AsFloat := FDespesas.valorDocumento[I];
    cdsDesp.FieldByName('CodFornecedor').AsInteger := FDespesas.CodFornecedor[I];
    cdsDesp.FieldByName('Controles').AsInteger := FDespesas.Controle[I];
    cdsDesp.FieldByName('NChq').AsString := FDespesas.NCHQ[I];
    cdsDesp.FieldByName('NominalChq').AsString := FDespesas.NCHQNominal[I];

    buscas.Close;
    buscas.SQL.Text := 'SELECT CODIGO_CTRL, NOME_CTRL, CONTR_BANC FROM CONTROLES ' +
     ' WHERE CODIGO_CTRL = :CODIGO_CTRL ' +
     ' AND CODIGO_EMP = :CODIGO_EMP ';
    buscas.ParamByName('CODIGO_CTRL').AsInteger := cdsDesp.FieldByName('Controles').AsInteger;
    buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    vNomeCtr := buscas.FieldByName('NOME_CTRL').AsString;
    vContrBanco := buscas.FieldByName('CONTR_BANC').AsString;

    cdsDesp.FieldByName('ContrBanc').AsString := vContrBanco;
    cdsDesp.FieldByName('NomeControle').AsString := trim(vNomeCtr);

    cdsDesp.Post;
  end;
end;

function TDespesa.insert(vEstMoto: TEstMotoCCIA): boolean;
begin
  Result := inherited insert;
  if not result then
    Exit;

  dataSet.FieldByName('CHASSI_C').AsString := vEstMoto.dataSet.FieldByName('CHASSI_C').AsString;
  dataSet.FieldByName('PLACAEST').AsString := vEstMoto.dataSet.FieldByName('PLACAEST').AsString;
  dataSet.FieldByName('CODIGO').AsInteger := vEstMoto.dataSet.FieldByName('CODIGO').AsInteger;
  dataSet.FieldByName('DATA_DESPESA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
  dataSet.FieldByName('COD_FUNC').AsInteger := vDadosIni.vCodUsuario;
  dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);

  LocTipoDespesa.abreLocTipoDespesa;
  LocCliDespesa.abreClientes(0);
end;

function TDespesa.post: boolean;
var
  acao: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if (dataSet.FieldByName('cod_tp_despesa').AsInteger <= 0) then
    begin
      frmEstMotosCCIA.TabSheet_Despesas.Show;
      raiseExceptionCreate('Tipo de despesa não informada!', 'DBEdit_Assunto_Despesa');
    end;

    if not buscarTpDespesa(dataSet.FieldByName('cod_tp_despesa').AsInteger) then
    begin
      frmEstMotosCCIA.TabSheet_Despesas.Show;
      raiseExceptionCreate('Tipo de despesa não encontrado!', 'DBEdit_Assunto_Despesa');
    end;

    if trim(dataSet.FieldByName('data_despesa').AsString) = '' then
    begin
      frmEstMotosCCIA.TabSheet_Despesas.Show;
      raiseExceptionCreate('Data da pendência não informada!', 'DBEdit_Data_Despesa');
    end;

    if (dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0) then
    begin
      frmEstMotosCCIA.TabSheet_Despesas.Show;
      raiseExceptionCreate('Fornecedor não informado!', 'DBEdit_Fornecedor_Despesa');
    end;

    if not buscarCliente(dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    begin
      frmEstMotosCCIA.TabSheet_Despesas.Show;
      raiseExceptionCreate('Fornecedor não encontrado!', 'DBEdit_Fornecedor_Despesa');
    end;

//    if trim(dataSet.FieldByName('obs').AsString) = '' then
//    begin
//      frmEstMotosCCIA.TabSheet_Despesas.Show;
//      raiseExceptionCreate('Observação não informada!', 'DBMemo_Despesa_Obs');
//    end;

    if (dataSet.FieldByName('valor_despesa').AsFloat <= 0) then
    begin
      frmEstMotosCCIA.TabSheet_Despesas.Show;
      raiseExceptionCreate('Valor não informado!', 'DBEdit_Valor_Despesa');
    end;

//    if trim(dataSet.FieldByName('data_vencimento').AsString) = '' then
//    begin
//      frmEstMotosCCIA.TabSheet_Despesas.Show;
//      raiseExceptionCreate('Data da previsão não informada!', 'DBEdit_DataVencimento_Despesa');
//    end;

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if result then
      result := apply;
    if result then
      result := CommitaTransacao;

    if result then
      vDadosIni.GravaAuditoria('VEI027', acao, 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'DESPESAS_VEIC', dataSet.FieldByName('cod_despesa').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI027', acao, 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'DESPESAS_VEIC', dataSet.FieldByName('cod_despesa').AsString, buscas);
    if result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TDespesa.setFatura(indice: integer; pDoc, pVenc: string;
  pValor: Currency): boolean;
begin
 try
    FDespesas.numeroDocumento[indice] := pDoc;
    FDespesas.vencimentoDocumento[indice] := pVenc;
    FDespesas.valorDocumento[indice] := pValor;
    Result := True;
  except
    Result := false;
  end;
end;

function TDespesa._AbreDespesa(pChassi: string): boolean;
begin
  Result := montaSelect('SELECT DESPESAS_VEIC.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, TIPO_DESPESA.DESCRICAO AS ' +
    ' DESCRICAO_DESP FROM DESPESAS_VEIC INNER JOIN TIPO_DESPESA ON DESPESAS_VEIC.COD_TP_DESPESA = TIPO_DESPESA.COD_TP_DESPESA' +
    ' LEFT JOIN CLIENTES ON DESPESAS_VEIC.COD_CLIENTE = CLIENTES.COD_CLIENTE AND DESPESAS_VEIC.COD_EMPRESA = CLIENTES.COD_EMPRESA' +
    ' WHERE DESPESAS_VEIC.CHASSI_C = ' + QuotedStr(pChassi) +
    ' AND DESPESAS_VEIC.COD_EMPRESA  = ' + vDadosIni.codEmpresa + ' and DESPESAS_VEIC.COD_DESPESA <> 0');
end;

function TDespesa._AbreDespesa(vEstMoto: TEstMotoCCIA): boolean;
begin
  if vEstMoto.dataSet.IsEmpty then
    exit;
  Result := montaSelect('SELECT DESPESAS_VEIC.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, TIPO_DESPESA.DESCRICAO AS ' +
    ' DESCRICAO_DESP FROM DESPESAS_VEIC INNER JOIN TIPO_DESPESA ON DESPESAS_VEIC.COD_TP_DESPESA = TIPO_DESPESA.COD_TP_DESPESA' +
    ' LEFT JOIN CLIENTES ON DESPESAS_VEIC.COD_CLIENTE = CLIENTES.COD_CLIENTE AND DESPESAS_VEIC.COD_EMPRESA = CLIENTES.COD_EMPRESA' +
    ' WHERE DESPESAS_VEIC.CHASSI_C = ' + QuotedStr(vEstMoto.dataSet.FieldByName('CHASSI_C').AsString) +
    ' AND DESPESAS_VEIC.COD_EMPRESA  = ' + vDadosIni.codEmpresa + ' and DESPESAS_VEIC.COD_DESPESA <> 0');
end;

function TDespesa.abreFormDespesa(pAlter: boolean = False): boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
  vCodDep: Integer;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Despesa';
    frmEstMotosCCIA.pnFaturaDesp.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];
    LocTipoDespesa.abreLocTipoDespesa;
    vCondPag.abreCondPag;
    vControles.abreControles;
    if not pAlter then
    begin
      LocCliDespesa.abreClientes(0);
      frmEstMotosCCIA.Edit3.Text := '';
      frmEstMotosCCIA.EditHw1.AsValue := 0;
      frmEstMotosCCIA.edcreditoQtdeParcelas.Value := 0;
      frmEstMotosCCIA.EditHw2.AsValue := 0;
      frmEstMotosCCIA.DBLookupComboBox14.KeyValue := frmEstMotosCCIA.EditHw2.AsInteger;
      frmEstMotosCCIA.EditHw3.AsValue := 0;
      frmEstMotosCCIA.DBLookupComboBox15.KeyValue := frmEstMotosCCIA.EditHw3.AsInteger;
      frmEstMotosCCIA.ListBox3.Clear;

      frmEstMotosCCIA.Edit3.Enabled := True;
      frmEstMotosCCIA.EditHw1.Enabled := True;
      frmEstMotosCCIA.EditHw2.Enabled := True;
      frmEstMotosCCIA.DBLookupComboBox14.Enabled := True;
      frmEstMotosCCIA.EditHw3.Enabled := True;
      frmEstMotosCCIA.DBLookupComboBox15.Enabled := True;
    end
    else
    begin
      frmEstMotosCCIA.Edit3.Text := dataSet.FieldByName('N_DOC').AsString;
      frmEstMotosCCIA.EditHw1.AsValue := dataSet.FieldByName('VALOR_DESPESA').AsFloat;
      frmEstMotosCCIA.edcreditoQtdeParcelas.Value := 0;
      frmEstMotosCCIA.EditHw2.AsValue := dataSet.FieldByName('COD_TP_DESPESA').AsInteger;
      frmEstMotosCCIA.DBLookupComboBox14.KeyValue := frmEstMotosCCIA.EditHw2.AsInteger;
      frmEstMotosCCIA.EditHw3.AsValue := dataSet.FieldByName('COD_CLIENTE').AsInteger;
      frmEstMotosCCIA.DBLookupComboBox15.KeyValue :=frmEstMotosCCIA. EditHw3.AsInteger;
      frmEstMotosCCIA.ListBox3.Clear;
      frmEstMotosCCIA.Edit3.Enabled := False;
      frmEstMotosCCIA.EditHw1.Enabled := False;
      frmEstMotosCCIA.EditHw2.Enabled := False;
      frmEstMotosCCIA.DBLookupComboBox14.Enabled := False;
      frmEstMotosCCIA.EditHw3.Enabled := False;
      frmEstMotosCCIA.DBLookupComboBox15.Enabled := False;
      LocCliDespesa.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
      gerarDespesa(EstMoto, pAlter);
    end;
    result := (formulario.ShowModal = mrOk);
  finally
  if Result then
  begin
    try     
     if dataSet.State in [dsInsert] then
       vCodDep := Gencodigo('DESPESAS_VEIC', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);

     dataSet.FieldByName('cod_despesa').AsInteger := vCodDep;
     dataSet.FieldByName('COD_TP_DESPESA').AsInteger := frmEstMotosCCIA.cdsDesp.FieldByName('TipoDespesa').AsInteger;
     dataSet.FieldByName('COD_CLIENTE').AsInteger := frmEstMotosCCIA.cdsDesp.FieldByName('CodFornecedor').AsInteger;
     dataSet.FieldByName('COD_CONTROLE').AsInteger := frmEstMotosCCIA.cdsDesp.FieldByName('Controles').AsInteger;
     dataSet.FieldByName('N_DOC').AsString := trim(frmEstMotosCCIA.Edit3.Text); // cdsDesp.FieldByName('NumDoc').AsString;
     dataSet.FieldByName('STATUS_DESPESA').AsString := 'PENDENTE';
     dataSet.FieldByName('OBS').AsString := trim(frmEstMotosCCIA.ListBox3.Items.Text);
     Post;
     
     DeletarContasAPagar(vCodDep);
     LocCliDespesa.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
     for I := 0 to (FDespesas.parcelas - 1) do
     begin
       buscas.Close;
       buscas.SQL.Text := 'INSERT INTO CONTAS_A_PAGAR (CODIGO_EMP, COD_FORN_NFE, NOME_FOR_CTP, N_CONTA_PLC,' +
          ' CODIGO_CTRL, TIPO_CTP, N_DOC_CTP, NPARCELA, QTDE_PARC, DATA_VENC_CTP, VALOR_CTP, DATA_ENT_CTP, VALOR_CTP_ORIG, VL_CONTABIL,' +
          ' NATL_CTP, HISTORICO_CTP, NUM_NOTA_NFE, COD_CONTRP, SERIE, N_DOC_CTP_ORIG, DTREFERENCIA, REF_FRETE, COD_DESPESA, N_CHEQ_CTP, NOMINAL_CTP)' +
          ' VALUES' +
          ' (:CODIGO_EMP, :COD_FORN_NFE, :NOME_FOR_CTP, :N_CONTA_PLC,' +
          ' :CODIGO_CTRL, :TIPO_CTP, :N_DOC_CTP, :NPARCELA, :QTDE_PARC, :DATA_VENC_CTP, :VALOR_CTP, :DATA_ENT_CTP, :VALOR_CTP_ORIG, :VL_CONTABIL,' +
          ' :NATL_CTP, :HISTORICO_CTP, :NUM_NOTA_NFE, :COD_CONTRP, :SERIE, :N_DOC_CTP_ORIG, :DTREFERENCIA, :REF_FRETE, :COD_DESPESA, :N_CHEQ_CTP, :NOMINAL_CTP)';
       buscas.ParamByName('COD_CONTRP').AsInteger := Gencodigo('CONTAS_A_PAGAR', DtmVeiculosCCIA.SpIncCodigoV,
         vDadosIni.codEmpresa); ;
       buscas.ParamByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
       buscas.ParamByName('NUM_NOTA_NFE').Value := Null;
       buscas.ParamByName('SERIE').Value := Null;
       buscas.ParamByName('COD_FORN_NFE').AsInteger := dataSet.FieldByName('COD_CLIENTE').AsInteger;
       buscas.ParamByName('NOME_FOR_CTP').AsString := copy(Trim(LocCliDespesa.dataSet.FieldByName('nome_cliente').AsString),1,35);
       buscas.ParamByName('N_CONTA_PLC').AsFloat := FDespesas.NumConta[I];
       buscas.ParamByName('CODIGO_CTRL').AsInteger := FDespesas.Controle[I];
       buscas.ParamByName('TIPO_CTP').AsString := 'D';
       buscas.ParamByName('N_DOC_CTP').AsString := copy(FDespesas.numeroDocumento[I],1,20);
       buscas.ParamByName('NPARCELA').AsInteger := I + 1;
       buscas.ParamByName('QTDE_PARC').AsInteger := FDespesas.parcelas;
       buscas.ParamByName('DATA_VENC_CTP').AsDate := StrToDate(FDespesas.vencimentoDocumento[i]);
       buscas.ParamByName('VALOR_CTP').AsCurrency := FDespesas.valorDocumento[I];
       buscas.ParamByName('VL_CONTABIL').AsCurrency := FDespesas.valorDocumento[I];
       buscas.ParamByName('VALOR_CTP_ORIG').AsCurrency := dataSet.FieldByName('VALOR_DESPESA').AsFloat;
       buscas.ParamByName('DATA_ENT_CTP').AsString := dataSet.FieldByName('DATA_DESPESA').AsString;
       buscas.ParamByName('NATL_CTP').AsString := 'C';
       buscas.ParamByName('HISTORICO_CTP').AsString :=copy(FDespesas.historico[I],1,100);
       buscas.ParamByName('N_DOC_CTP_ORIG').AsString := dataSet.FieldByName('N_DOC').AsString;
       buscas.ParamByName('DTREFERENCIA').AsDate := StrToDate(FDespesas.dataReferencia[I]);
       buscas.ParamByName('REF_FRETE').AsString := 'N';
       buscas.ParamByName('N_CHEQ_CTP').AsString := Copy(trim(FDespesas.NCHQ[I]), 1, 10);
       buscas.ParamByName('NOMINAL_CTP').AsString := Copy(trim(FDespesas.NCHQNominal[I]), 1, 35);
       if pos('F', FDespesas.numeroDocumento[i]) > 0 then
         buscas.ParamByName('REF_FRETE').AsString := 'F';
       buscas.ParamByName('COD_DESPESA').AsInteger := vCodDep;
       buscas.Prepare;
       buscas.ExecSQL;
     end;
    except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
  end
  else
    Cancel;
  //Soma os valores do Grid
  frmEstMotosCCIA.EditMoedaSomaTotalDespesas.Valor := frmEstMotosCCIA._SomarValoresGridDespesa;
  frmEstMotosCCIA.pnFaturaDesp.Parent := frmEstMotosCCIA.tsFaturaDesp;
  formulario.Free;
  formulario := nil;
  end;
end;

function TDespesa.abreFormDespesaDetalhado(indice: integer; cdsDesp: TClientDataSet): boolean;
var
  formulario: TfrmPadrao;
  I, J: Integer;
  vrTemp: Currency;
  plContas: TClientDataSet;
  vCtrl: TControlesNF;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Detalhes da Despesa Selecionada. Documento : ' + FDespesas.numeroDocumento[indice];
    frmEstMotosCCIA.pnDetFatEnt.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons:= [];
    frmEstMotosCCIA.Label402.Caption := Format('%0.2m', [FDespesas.valorDocumento[indice]]);
    frmEstMotosCCIA.Label404.Caption := FDespesas.numeroDocumento[indice];
    frmEstMotosCCIA.Label84.Visible := False;
    frmEstMotosCCIA.DBEdit23.Visible := False;
    frmEstMotosCCIA.Label55.Visible := False;
    frmEstMotosCCIA.DBEdit24.Visible := False;
    vrTemp := 0;
    GravarContasPagarTemp(cdsDesp);

    frmEstMotosCCIA.Label414.Caption := Format('%0.2m', [FDespesas.valorDocumento[indice] - vrTemp]);

    TClientDataSet(frmEstMotosCCIA.DBGrid28.DataSource.DataSet).IndexDefs.Clear;
    TClientDataSet(frmEstMotosCCIA.DBGrid28.DataSource.DataSet).IndexDefs.Add('IDX$ANumConta', 'NumConta', []);
    TClientDataSet(frmEstMotosCCIA.DBGrid28.DataSource.DataSet).IndexName := 'IDX$ANumConta';

   if frmEstMotosCCIA.DBGrid28.DataSource <> nil then
      if TClientDataSet(frmEstMotosCCIA.DBGrid28.DataSource.DataSet).active then
        TClientDataSet(frmEstMotosCCIA.DBGrid28.DataSource.DataSet).First;

    result := (formulario.ShowModal = mrOk);
  finally
     if Result then
     begin
       frmEstMotosCCIA.ListBox3.Clear;
       cdsDesp.First;
       I := 0;
       while not cdsDesp.Eof do
       begin
          FDespesas.NumConta[I] := cdsDesp.FieldByName('NumConta').AsFloat;
          FDespesas.historico[I] := cdsDesp.FieldByName('Historico').AsString;
          FDespesas.numeroDocumento[I] := cdsDesp.FieldByName('NumDoc').AsString;
          FDespesas.CodFornecedor[I] := cdsDesp.FieldByName('CodFornecedor').AsInteger;
          FDespesas.Controle[I] := cdsDesp.FieldByName('Controles').AsInteger;
          FDespesas.vencimentoDocumento[I] := cdsDesp.FieldByName('DataVenc').AsString;
          FDespesas.dataReferencia[I] := cdsDesp.FieldByName('DataReferencia').AsString;
          FDespesas.valorDocumento[I] := cdsDesp.FieldByName('Valor').AsFloat;
          FDespesas.CodTpDespesa[I] := LocTipoDespesa.dataSet.FieldByName('COD_TP_DESPESA').AsInteger;
          FDespesas.NCHQ[I] := cdsDesp.FieldByName('NChq').AsString;
          FDespesas.NCHQNominal[I] := cdsDesp.FieldByName('NominalChq').AsString;

          frmEstMotosCCIA.ListBox3.Items.Add(cdsDesp.FieldByName('NumDoc').AsString + '   '
           + cdsDesp.FieldByName('DataVenc').AsString + '    ' + Format('%m', [cdsDesp.FieldByName('Valor').AsFloat]));
         I := I + 1;
         cdsDesp.Next;
       end;
     end;
    cdsDesp.First;
    frmEstMotosCCIA.pnDetFatEnt.Parent := frmEstMotosCCIA.tsDetalheDespesa;
    formulario.Free;
    formulario := nil;
  end;
end;

function TDespesa.AbreTipoDesp: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'TPDESPESA| ' + dataSet.FieldByName('COD_TP_DESPESA').AsString;

  formulario := Funcoes.AbreForm('pkCadastrosBasicos', 'TfrmCadTipoDespesa', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;

end;


procedure TDespesa.ApagarContasPagarTemp(cdsDesp: TClientDataSet);
begin
  while not cdsDesp.IsEmpty do
    cdsDesp.Delete;
end;

function TDespesa.ApagarDespesa(vEstMoto: TEstMotoCCIA): boolean;
begin
  try
    Result := True;
    frmEstMotosCCIA.ListBox3.Clear;
  except
    Result := False;
  end;
end;

{ TLocTipoDespesa }

function TLocTipoDespesa.abreLocTipoDespesa: boolean;
begin
  Result := montaSelect('SELECT * FROM TIPO_DESPESA WHERE ativo = 1');
end;

function TLocTipoDespesa.abreLocTipoDespesa(pCodigo: Integer): boolean;
begin
  Result := montaSelect('SELECT * FROM TIPO_DESPESA WHERE cod_tp_despesa = ' +IntToStr(pCodigo)+ ' and ativo = 1');
end;

function TLocTipoDespesa.buscarLocTipoDespesa(pCodigo: Integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM TIPO_DESPESA WHERE cod_tp_despesa = ' +IntToStr(pCodigo)+ ' and ativo = 1';
  buscas.Open;

  result := not buscas.IsEmpty;
end;

constructor TLocTipoDespesa.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsAbreTPDespesa);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

{ TComFat }

function TComFat.abreComFat: boolean;
begin
  result := montaSelect(' SELECT FIRST 1 ' + Fsql_campos + ' FROM COM_FAT ' +
  	Fsql_inner +
    ' WHERE COM_FAT.N_COMANDO = -1 ' +
    ' AND COM_FAT.COD_EMPRESA = ' +vDadosIni.codEmpresa);
end;

function TComFat.abreComFat(vComando: Integer; pTp: Integer =0): boolean;
begin
  if pTp = 0 then  
    result := montaSelect(' SELECT ' + Fsql_campos + ' FROM COM_FAT ' +
      Fsql_inner +
      ' WHERE COM_FAT.N_COMANDO = ' + IntToStr(vComando) +
      ' AND COM_FAT.COD_EMPRESA =' + vDadosIni.codEmpresa)
  else
    result := montaSelect(' SELECT ' + Fsql_campos + ' FROM COM_FAT ' +
      Fsql_inner +
      ' WHERE COM_FAT.COD_ESTMOTO = ' + IntToStr(vComando) +
      ' AND COM_FAT.COD_EMPRESA =' + vDadosIni.codEmpresa+
      ' ORDER BY COM_FAT.N_COMANDO DESC');
end;

function TComFat.abreCondicoes: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select * from controles ' +
    ' where cxent = ''S'' ' +
    ' and ativo = 1 ' +
    ' and codigo_emp = ' + vDadosIni.codEmpresa +
    ' order by codigo_ctrl';
  buscas.Open;
  buscas.FetchAll;

  frmMovVeiculosCCIA.comboBox4.Items.Clear;
  buscas.First;
  if not buscas.IsEmpty then
  begin
    while not buscas.eof do
    begin
      frmMovVeiculosCCIA.combobox4.Items.Add(trim(buscas.fieldbyname('NOME_CTRL').AsString));
      buscas.next;
    end;
  end;
  if Pos('RETORNO', vDadosIni.vEmp.vCtrPlanoPg) > 0 then
    frmMovVeiculosCCIA.combobox4.Items.add('RETORNO');
  if Pos('FRETE', vDadosIni.vEmp.vCtrPlanoPg) > 0 then
    frmMovVeiculosCCIA.combobox4.Items.add('FRETE');
  if Pos('RECIBOSANT', vDadosIni.vEmp.vCtrPlanoPg) > 0 then
    frmMovVeiculosCCIA.combobox4.Items.add('RECIBOSANT');
  if Pos('OUTROS', vDadosIni.vEmp.vCtrPlanoPg) > 0 then
    frmMovVeiculosCCIA.combobox4.Items.add('OUTROS');
  if dataSet.FieldByName('VEICULO_TROCA').AsString = 'S' then
  begin
    if vDadosIni.vEmp.vCodCtrlMtUsadas <= 0 then
    begin
      Application.MessageBox('Controle configurado para usar veículo na troca não informado ou não encontrado na empresa!', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      dataSet.FieldByName('VEICULO_TROCA').AsString := 'N';
    end
    else
      frmMovVeiculosCCIA.combobox4.Items.add('MTUSADAS');
  end;
  if dataSet.FieldByName('TIPV_VEICULO').AsString = 'I' then
    frmMovVeiculosCCIA.combobox4.Items.add('INTERMEDIACAO');
  frmMovVeiculosCCIA.ComboBox4.ItemIndex := 0;
  buscas.Close;
  VerificaSaldo(2);
end;

function TComFat.abreFormCondPag(Sender: TObject): boolean;
var
  formulario: TfrmPadrao;
  itx: integer;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 789;
    formulario.Height := 249;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Condições para Venda de Veículos...';
    frmMovVeiculosCCIA.pnCondPag.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    abreCondicoes;
    verplanopag(2);
    frmMovVeiculosCCIA.Edit2.Text := '';
    frmMovVeiculosCCIA.Edit3.Text := '';
    frmMovVeiculosCCIA.EditHw5.AsValue := 0;

    dataSet.FieldByName('VALOR_REAL').AsFloat := frmMovVeiculosCCIA.EditHw2.AsValue;
    dataSet.FieldByName('VALOR_A_REC').AsFloat := frmMovVeiculosCCIA.EditHw3.AsValue;
    dataSet.FieldByName('FRETE_V').AsFloat := 0;
    dataSet.FieldByName('OBS1').AsString := '';
    dataSet.FieldByName('VALOBS1').AsFloat := 0;
    dataSet.FieldByName('OBS2').AsString := '';
    dataSet.FieldByName('VALOBS2').AsFloat := 0;
    dataSet.FieldByName('OBS3').AsString := '';
    dataSet.FieldByName('VALOBS3').AsFloat := 0;
    dataSet.FieldByName('OBS4').AsString := '';
    dataSet.FieldByName('VALOBS4').AsFloat := 0;
    dataSet.FieldByName('OBS5').AsString := '';
    dataSet.FieldByName('VALOBS5').AsFloat := 0;

    frmMovVeiculosCCIA.Label143.Visible := false;
    frmMovVeiculosCCIA.Edit3.Visible := false;
    frmMovVeiculosCCIA.Label41.Top := 34;
    frmMovVeiculosCCIA.Edit2.Top := 32;
    frmMovVeiculosCCIA.Label143.Top := 61;
    frmMovVeiculosCCIA.EditHw5.Top := 58;
    frmMovVeiculosCCIA.BitBtn16.Top := 87;
    frmMovVeiculosCCIA.DBMemo17.Clear;
    frmMovVeiculosCCIA.ComboBox4Exit(Sender);

    if dtSetPlano.IsEmpty then
    begin
      frmMovVeiculosCCIA.EditHw1.AsValue := 0;
      if frmMovVeiculosCCIA.EditHw1.AsValue <= 0 then
        if not vEstMoto.dataSet.IsEmpty then
          if (dataSet.State in [dsInsert, dsEdit]) then
             if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'E') and (vEstMoto.dataSet.FieldByName('PRECO_CUSTO_REP').AsFloat > 0) then
               frmMovVeiculosCCIA.EditHw1.AsValue := vEstMoto.dataSet.FieldByName('PRECO_CUSTO_REP').AsFloat
             else if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'E') and (vEstMoto.dataSet.FieldByName('PRECO_CUSTO').AsFloat > 0) then
               frmMovVeiculosCCIA.EditHw1.AsValue := vEstMoto.dataSet.FieldByName('PRECO_CUSTO').AsFloat
             else if vEstMoto.dataSet.FieldByName('PRECO_SUG_VND').AsFloat > 0 then
               frmMovVeiculosCCIA.EditHw1.AsValue := vEstMoto.dataSet.FieldByName('PRECO_SUG_VND').AsFloat
             else
               frmMovVeiculosCCIA.EditHw1.AsValue := vEstMoto.dataSet.FieldByName('PRECO_TABEST').AsFloat;
     
      frmMovVeiculosCCIA.EditHw2.AsValue := 0;
      frmMovVeiculosCCIA.EditHw3.AsValue := 0;
      frmMovVeiculosCCIA.EditHw4.AsValue := 0;
      frmMovVeiculosCCIA.EditHw6.AsValue := 0;
      frmMovVeiculosCCIA.EditHw7.AsValue := 0;
    end;

    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      itx := 1;

      dtSetPlano.first;
      while not dtSetPlano.eof do
      begin
        if (vSing.vMod = 'CFT') or (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
        begin
//          frmMovVeiculosCCIA.DBMemo17.Lines.Add(dtSetPlano.FieldByName('Controle').AsString + ' - ' + dtSetPlano.FieldByName('Historico').AsString + ' (' +
//              format('%n', [dtSetPlano.FieldByName('Valor').AsFloat]) + ')');
          frmMovVeiculosCCIA.DBMemo17.Lines.Add(dtSetPlano.FieldByName('Historico').AsString + ' (' +
              format('%n', [dtSetPlano.FieldByName('Valor').AsFloat]) + ')');

          if itx = 1 then
          begin
            dataSet.FieldByName('OBS1').AsString := dtSetPlano.FieldByName('Historico').AsString;
            if dtSetPlano.FieldByName('EntrValor').AsString = 'S' then
              dataSet.FieldByName('VALOBS1').AsFloat := dtSetPlano.FieldByName('Valor').AsCurrency
            else
            begin
              dataSet.FieldByName('OBS1').AsString := dtSetPlano.FieldByName('Historico').AsString + '(' +
                format('%n', [dtSetPlano.FieldByName('Valor').ascurrency]) + ')';
              dataSet.FieldByName('VALOBS1').AsFloat := 0;
            end;
          end;
          if itx = 2 then
          begin
            dataSet.FieldByName('OBS2').AsString := dtSetPlano.FieldByName('Historico').AsString;
            if dtSetPlano.FieldByName('EntrValor').AsString = 'S' then
              dataSet.FieldByName('VALOBS2').AsFloat := dtSetPlano.FieldByName('Valor').AsFloat
            else
            begin
              dataSet.FieldByName('VALOBS2').AsFloat := 0;
              dataSet.FieldByName('OBS2').AsString := dtSetPlano.FieldByName('Historico').AsString + '(' +
                format('%n', [dtSetPlano.FieldByName('Valor').AsFloat]) + ')';
            end
          end;
          if itx = 3 then
          begin
            dataSet.FieldByName('OBS3').AsString := dtSetPlano.FieldByName('Historico').AsString;
            if dtSetPlano.FieldByName('EntrValor').AsString = 'S' then
              dataSet.FieldByName('VALOBS3').AsFloat := dtSetPlano.FieldByName('Valor').AsFloat
            else
            begin
              dataSet.FieldByName('VALOBS3').AsFloat := 0;
              dataSet.FieldByName('OBS3').AsString := dtSetPlano.FieldByName('Historico').AsString + '(' +
                format('%n', [dtSetPlano.FieldByName('Valor').AsFloat]) + ')';
            end;
          end;
          if itx = 4 then
          begin
            dataSet.FieldByName('OBS4').AsString := dtSetPlano.FieldByName('Historico').AsString;
            if dtSetPlano.FieldByName('EntrValor').AsString = 'S' then
              dataSet.FieldByName('VALOBS4').AsFloat := dtSetPlano.FieldByName('Valor').AsFloat
            else
            begin
              dataSet.FieldByName('OBS4').AsString := dtSetPlano.FieldByName('Historico').AsString + '(' +
                format('%n', [dtSetPlano.FieldByName('Valor').AsFloat]) + ')';
              dataSet.FieldByName('VALOBS4').AsFloat := 0;
            end;
          end;
          if itx = 5 then
          begin
            dataSet.FieldByName('OBS5').AsString := dtSetPlano.FieldByName('Historico').AsString;
            if dtSetPlano.FieldByName('EntrValor').AsString = 'S' then
              dataSet.FieldByName('VALOBS5').AsFloat := dtSetPlano.FieldByName('Valor').AsFloat
            else
            begin
              dataSet.FieldByName('VALOBS5').AsFloat := 0;
              dataSet.FieldByName('OBS5').AsString := dtSetPlano.FieldByName('Historico').AsString + '(' +
                format('%n', [dtSetPlano.FieldByName('Valor').AsFloat]) + ')';
            end;
          end;
          if dtSetPlano.FieldByName('Controle').AsString = 'FRETE' then
            dataSet.FieldByName('FRETE_V').AsFloat := dtSetPlano.FieldByName('Valor').AsCurrency;
          dtSetPlano.next;
          itx := itx + 1;
        end;
      end;

      if frmMovVeiculosCCIA.EditHw4.AsValue <> 0 then
        dataSet.FieldByName('PRVEN_V').AsFloat := frmMovVeiculosCCIA.EditHw4.AsValue - dataSet.FieldByName('FRETE_V').AsFloat;

      verplanopag(1);
    end;
    frmMovVeiculosCCIA.pnCondPag.Parent := frmMovVeiculosCCIA.tsCondicoes;
    formulario.Free;
    formulario := nil;
  end;
end;


function TComFat.abreFormListaContrato: boolean;
var
  formulario: TfrmPadrao;
  Form, TipoContrato: string;
  vCodContrato, I: Integer;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);

    vDadosIni.abreStatusProcessamento('', 'Abrindo Lista de Contratos');

//    if not _mdiAberto('TfrmImpressaoContratosCCIA', 'O formulário de Impressão de Contratos se encontra aberto!') then
//    begin
//      vDadosIni.fechaStatusProcessamento;
//      exit;
//    end;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
    begin
      Form := 'CONTRATO DE COMPRA DE VEICULOS';
    end
    else if vSing.vMod = 'CTRVND' then
    begin
      if dataSet.FieldByName('TIPO_VENDA_V').AsString = 'N' then
        Form := 'CONTRATO VENDA DE ZERO KM'
      else if dataSet.FieldByName('TIPO_VENDA_V').AsString = 'U' then
        Form := 'CONTRATO VENDA DE USADOS';
    end
    else if (vSing.vMod = 'CTRINTERM') or (vSing.vMod = 'CTRRESDOM') then
    begin
      if dataSet.FieldByName('TIPO_VENDA_V').AsString = 'N' then
        Form := 'INTERMEDIACAO VENDA DE ZERO KM'
      else if vSing.vTipoVenda = 'U' then
        Form := 'INTERMEDIACAO VENDA DE USADOS';
    end
//    else if vSing.vMod = 'CTRRESDOM' then
//    begin
//      if dataSet.FieldByName('TIPO_VENDA_V').AsString = 'N' then
//        Form := 'CONTRATO DE RESERVA DE DOMINIO DE ZERO KM'
//      else
//        Form := 'CONTRATO DE RESERVA DE DOMINIO DE USADOS';
//    end
    else if vSing.vMod = 'CTRVNDCONS' then
    begin
      Form := 'CONTRATO DE CONSIGNACAO';
    end;

    if dataSet.FieldByName('VEICULO_TROCA').AsString = 'S' then
      TipoContrato := 'VEÍCULO USADO NA TROCA';
    if dataSet.FieldByName('VEICULO_RODANDO').AsString = 'S' then
      TipoContrato := 'VEÍCULO RODANDO';
    if (dataSet.FieldByName('VEICULO_TROCA').AsString = 'S') and (dataSet.FieldByName('VEICULO_RODANDO').AsString = 'S') then
      TipoContrato := 'VEÍCULO USADO NA TROCA E RODANDO';

     if frmImpressaoContratosCCIA = nil then
     begin
       vDadosIni.vModalOuChild := 'M';
       vDadosIni.vTipoForm := 8;
       Application.CreateForm(TfrmImpressaoContratosCCIA, frmImpressaoContratosCCIA);
     end;
    vModContratos.AbreContratos(Form, TipoContrato);
    vDadosIni.vPesquisaNComando := dataSet.FieldByName('N_COMANDO').AsString;
    vDadosIni.vPesquisaCliente := dataSet.FieldByName('CLIENTES_V').AsString;

    try
     vDadosIni.vListTemp := TStringList.Create;
    except
    end;
    vDadosIni.vListTemp.Clear;
    vCodContrato := 0;

    vCodContrato := vModContratos.dataSet.FieldByName('COD_CARTA').AsInteger;
    if vCodContrato > 0 then
      vDadosIni.vListTemp.Add(UpperCase(trim(vModContratos.dataSet.FieldByName('DESCRICAO').AsString)) + '|');

    if (vSing.vMod = 'CTRRESDOM') then
    begin
      vCodContrato := vModContratos.BuscarContrato(' AND TIPO_CONTRATO = ''RESERVA DE DOMÍNIO'' ');
      if vCodContrato > 0 then
        vDadosIni.vListTemp.Add(IntToStr(vCodContrato) + '|RESERVA DE DOMÍNIO|');
    end;

    if (vSing.vMod = 'CFT') or (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
    begin
      vCodContrato := vModContratos.BuscarContrato(' AND TIPO_CONTRATO = ''CONTROLE INTERNO'' ');
      if vCodContrato > 0 then
        vDadosIni.vListTemp.Add(IntToStr(vCodContrato) + '|CONTROLE INTERNO|');
    end;

    if (dataSet.FieldByName('IMP_DECLARACAO').AsString = 'S') or (vSing.vMod = 'CTRRESDOM') then
    begin
      vCodContrato := vModContratos.BuscarContrato(' AND TIPO_CONTRATO = ''TERMO DE COMPROMISSO'' ');
      if vCodContrato > 0 then
        vDadosIni.vListTemp.Add(IntToStr(vCodContrato) + '|TERMO DE COMPROMISSO|');
    end;


    if frmImpressaoContratosCCIA.ShowModal = mrOK then
    begin
      vCodContrato := vModContratos.dataSet.FieldByName('COD_CARTA').AsInteger;
      if vDadosIni.vListTemp.Count > 0 then
        vDadosIni.vListTemp[0] := UpperCase(trim(vModContratos.dataSet.FieldByName('DESCRICAO').AsString)) + '|';

      for I := 0 to vDadosIni.vListTemp.Count -1 do
      begin
        vDadosIni.abreStatusProcessamento('', 'Abrindo Contrato(s): '+ IntToStr(I + 1) +'/'+IntToStr(vDadosIni.vListTemp.Count));
        ImprimirContrato(StrToInt(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1)));
      end;
      vDadosIni.fechaStatusProcessamento;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TComFat._AbreComfatVendaVeiculos(TipoForm: integer; pNumComando: Integer);
begin
   try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Entrada/Saída de Veículos');
    vDadosIni.vTipoForm := TipoForm;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if not vDadosIni.PesqPros('VEI033', 'CONSULTA', '', 'VEICULOS', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    try
      vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
      vDadosIni.vDtSetTmp.Close;
      vDadosIni.vDtSetTmp.FieldDefs.Clear;
      vDadosIni.vDtSetTmp.FieldDefs.Add('N_COMANDO', ftInteger, 0, false);

      if vDadosIni.vDtSetTmp.Tag = 0 then
      try
        vDadosIni.vDtSetTmp.CreateDataSet;
        vDadosIni.vDtSetTmp.Tag := 1;
      except
      end;

     vDadosIni.vDtSetTmp.EmptyDataSet;
     vDadosIni.vDtSetTmp.Insert;
     vDadosIni.vDtSetTmp.FieldByName('N_COMANDO').AsInteger := pNumComando;
     vDadosIni.vDtSetTmp.Post;

      if frmMovVeiculosCCIA = nil then
      begin
        vDadosIni.vTipoForm := TipoForm;
        if TipoForm > 0 then
          vDadosIni.vModalOuChild := 'M';
        vDadosIni.vTipoForm := 8;
        Application.CreateForm(TfrmMovVeiculosCCIA, frmMovVeiculosCCIA);
      end;

      if (TipoForm > 0) and (not frmMovVeiculosCCIA.Visible) then
        frmMovVeiculosCCIA.ShowModal
      else if (not frmMovVeiculosCCIA.Visible) then
        frmMovVeiculosCCIA.Show
      else if frmMovVeiculosCCIA.FormStyle = fsMDIChild then
        frmMovVeiculosCCIA.Show
      else
        frmMovVeiculosCCIA.ShowModal;
      finally
         frmMovVeiculosCCIA.Free;
      end;
  finally
    vDadosIni.vTipoForm := 0;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TComFat._abreNatOperacao;
begin
  if vSing.vTipoVendaCFOP = 'I' then
  begin
    if vDadosIni.vEmp.vCodServInterm = 0 then
    begin
      Application.MessageBox(PChar('Código de Serviço Padrão para Intermediação não encontrado nas configurações.'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vNaturezaOp.abreNaturezaOp(-1);
      exit;
    end;

    dataSet.FieldByName('COD_SERV_INTERM').AsFloat := vDadosIni.vEmp.vCodServInterm;

    buscas.Close;
    buscas.SQL.Text := 'select desc_servico, codigo_nop from tipo_servico where cod_servico = ' + IntToStr(vDadosIni.vEmp.vCodServInterm);
    buscas.Open;

    if Trim(buscas.FieldByName('desc_servico').AsString) = '' then
    begin
      Application.MessageBox(PChar('Descrição de Serviço Padrão para Intermediação não informada ou não encontrada no cadastro.'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vNaturezaOp.abreNaturezaOp(-1);
      exit;
    end
    else
      dataSet.FieldByName('DESC_NATOP').AsString := Copy(buscas.FieldByName('desc_servico').AsString, 1, 40);

    if buscas.FieldByName('codigo_nop').AsFloat <= 0 then
    begin
      Application.MessageBox(PChar('Natureza de Operação do Serviço Padrão para Intermediação não informada ou não encontrada no cadastro.'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vNaturezaOp.abreNaturezaOp(-1);
      exit;
    end
    else
    begin
      dataSet.FieldByName('NATOP_V').AsFloat := buscas.FieldByName('CODIGO_NOP').AsFloat;
      dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
      dataSet.FieldByName('TIPV_VEICULO').AsString := 'I';
      vCFOPOld := dataSet.FieldByName('NATOP_V').AsFloat;
    end;

    vNaturezaOp.abreNaturezaOp(dataSet.FieldByName('NATOP_V').AsFloat);
  end
  else
  begin
    if vSing.vMod = 'CTRVNDCONS' then
      vNaturezaOp.abreNaturezaOp(vSing.vTipoVendaCFOP, vSing.vNatureza, vSing.vTipoVenda,
      	vDadosIni.IfThen(vSing.vNatureza = 'E',
    			vDadosIni.IfThen(dataSet.FieldByName('COD_CLI_VENDE').AsInteger <= 0, -1, vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger),
	 	  		vDadosIni.IfThen(dataSet.FieldByName('CLIENTES_V').AsInteger <= 0, -1, vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)),
      'N')
    else
      vNaturezaOp.abreNaturezaOp(vSing.vTipoVendaCFOP, vSing.vNatureza, vSing.vTipoVenda,
      	vDadosIni.IfThen(vSing.vNatureza = 'E',
    			vDadosIni.IfThen(dataSet.FieldByName('COD_CLI_VENDE').AsInteger <= 0, -1, vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger),
	 	  		vDadosIni.IfThen(dataSet.FieldByName('CLIENTES_V').AsInteger <= 0, -1, vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)));

    if not vNaturezaOp.dataSet.IsEmpty then
    begin
    	dataSet.FieldByName('NATOP_V').AsFloat := vNaturezaOp.dataSet.FieldByName('CODIGO_NOP').AsFloat;
      dataSet.FieldByName('DESC_NATOP').AsString := Copy(trim(vNaturezaOp.dataSet.FieldByName('DESCRICAO_NOP').AsString), 1, 40);
      dataSet.FieldByName('TIPV_VEICULO').AsString := vNaturezaOp.dataSet.FieldByName('TIPV_VEICULO').AsString;
      vCFOPOld := dataSet.FieldByName('NATOP_V').AsFloat;
    end;
  end;
end;

function TComFat.abreFormPerguntasVeiculo: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 505;
    formulario.Height := 168;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Dados de Veículos Anteriores';
    frmMovVeiculosCCIA.pnPerguntasVeic.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    if dataSet.FieldByName('PRIMEIROVEICULO').AsString = 'N' then
      frmMovVeiculosCCIA.DBComboBox6.ItemIndex := 1
    else
    begin
      dataSet.FieldByName('PRIMEIROVEICULO').AsString := 'S';
      frmMovVeiculosCCIA.DBComboBox6.ItemIndex := 0;
    end;

    if dataSet.FieldByName('ACEITA_CONTATO').AsString = 'N' then
      frmMovVeiculosCCIA.DBComboBox7.ItemIndex := 1
    else
    begin
      dataSet.FieldByName('ACEITA_CONTATO').AsString := 'S';
      frmMovVeiculosCCIA.DBComboBox7.ItemIndex := 0;
    end;
    frmMovVeiculosCCIA.DBComboBox6.Enabled := true;
    frmMovVeiculosCCIA.DBComboBox7.Enabled := true;
    frmMovVeiculosCCIA.DBEdit75.Enabled := true;
    frmMovVeiculosCCIA.DBEdit76.Enabled := true;
    result := (formulario.ShowModal = mrOk);
  finally
    frmMovVeiculosCCIA.pnPerguntasVeic.Parent := frmMovVeiculosCCIA.tsPerguntasVeic;
    formulario.Free;
    formulario := nil;
  end;
end;

function TComFat.abreFormPesquisaVeiculo: boolean;
var
  formulario: TfrmPadrao;
  DBEditChassi: TDBEdit;
begin
  try
    if vSing.vMod = 'CFT' then
      DBEditChassi := TDBEdit(frmMovVeiculosCCIA.DBEdit2)
    else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
      DBEditChassi := TDBEdit(frmMovVeiculosCCIA.DBEdit48)
    else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
      DBEditChassi := TDBEdit(frmMovVeiculosCCIA.DBEdit56)
    else if vSing.vMod = 'CTRVNDCONS' then
      DBEditChassi := TDBEdit(frmMovVeiculosCCIA.DBEdit16);

    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 813;
    formulario.Height := 284;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Localizar...';
    frmMovVeiculosCCIA.pnPesquisaVeic.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    ComFat.vEstMoto.Close;
//    frmMovVeiculosCCIA.BitBtn36.Visible := (dataSet.FieldByName('NATUREZA').AsString = 'S') and (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S');
//    frmMovVeiculosCCIA.BitBtn37.Visible := (dataSet.FieldByName('NATUREZA').AsString = 'S') and (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S');
    frmMovVeiculosCCIA.cbxNovo.Checked := trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'N';
    frmMovVeiculosCCIA.cbxNovo.Enabled := False;
    frmMovVeiculosCCIA.cbxUsado.Checked := trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U';
    frmMovVeiculosCCIA.cbxUsado.Enabled := False;
    frmMovVeiculosCCIA.EditChassi.Text := _LerConfiguracoesRegistroString('EditChassi');
    frmMovVeiculosCCIA.EditPlaca.Text := _LerConfiguracoesRegistroString('EditPlaca');
    frmMovVeiculosCCIA.EditEspecie.Text := _LerConfiguracoesRegistroString('EditEspecie');
    frmMovVeiculosCCIA.EditHwNF.Text := _LerConfiguracoesRegistroString('EditHwNF');
    frmMovVeiculosCCIA.MaskEditDataEntIni.Text := _LerConfiguracoesRegistroString('MaskEditDataEntIni');
    frmMovVeiculosCCIA.MaskEditDataEntFim.Text := _LerConfiguracoesRegistroString('MaskEditDataEntFim');
    frmMovVeiculosCCIA.EditMarca.Text := _LerConfiguracoesRegistroString('EditMarca');
    frmMovVeiculosCCIA.EditModelo.Text := _LerConfiguracoesRegistroString('EditModelo');
    frmMovVeiculosCCIA.EditCor.Text := _LerConfiguracoesRegistroString('EditCor');
    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
       _GravaConfiguracoesString('EditChassi', frmMovVeiculosCCIA.EditChassi.Text);
       _GravaConfiguracoesString('EditPlaca', frmMovVeiculosCCIA.EditPlaca.Text);
       _GravaConfiguracoesString('EditEspecie', frmMovVeiculosCCIA.EditEspecie.Text);
       _GravaConfiguracoesString('EditHwNF', frmMovVeiculosCCIA.EditHwNF.Text);
       _GravaConfiguracoesString('MaskEditDataEntIni', frmMovVeiculosCCIA.MaskEditDataEntIni.Text);
       _GravaConfiguracoesString('MaskEditDataEntFim', frmMovVeiculosCCIA.MaskEditDataEntFim.Text);
       _GravaConfiguracoesString('EditMarca', frmMovVeiculosCCIA.EditMarca.Text);
       _GravaConfiguracoesString('EditModelo', frmMovVeiculosCCIA.EditModelo.Text);
       _GravaConfiguracoesString('EditCor', frmMovVeiculosCCIA.EditCor.Text);
    end;

    if DBEditChassi.CanFocus then
      DBEditChassi.SetFocus;

    frmMovVeiculosCCIA.pnPesquisaVeic.Parent := frmMovVeiculosCCIA.tsPesquisaVeic;
    formulario.Free;
    formulario := nil;
  end;
end;

function TComFat.abreTipoVendas(vcomb: TDbCombobox): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' SELECT TIPO_OS FROM TIPO_VENDAS ' +
    ' WHERE TIPO = ''VEI'' AND ATIVO = 1 ORDER BY ORDEMEXIBICAO';
  buscas.Open;
  buscas.FetchAll;

  vcomb.Items.Clear;
  buscas.First;
  while not buscas.Eof do
  begin
   vcomb.Items.Add(buscas.FieldByName('TIPO_OS').AsString);
   buscas.Next;
  end;
end;

function TComFat.AbrirContrato(var pRichEdit: TRichEdit; pCodContrato: Integer): boolean;
begin
  Result := false;
  if pCodContrato <= 0 then
    exit;

  pRichEdit.Text :=
  	vDadosIni._TrocaTAGsDaCarta(
      cPropostaVeic,
    	pCodContrato,
      dataSet.FieldByName('CLIENTES_V').AsInteger,
      IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger),
      '',
      0,
      0,
      '-1'
    );

  buscas.close;
end;

function TComFat.AbrirEstMoto: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'ESTMOTO| ' + dataSet.FieldByName('CHASSIV').AsString;

  vEstMoto.CadVeiculosMov(1);

//  formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TFrmEstMotosCCIA', hdTemp);
//
//  try
//    formulario.ShowModal;
//  finally
//    formulario.Free;
//    unLoadPackage(hdTemp);
//  end;
end;

function TComFat.addPlano: boolean;
var
 vCodEstMoto: Integer;
begin
  try
     Result := True;

     if Trim(frmMovVeiculosCCIA.Edit2.Text) = '' then
       raiseExceptionCreate('Histórico deve ser informado!', 'Edit2');

//     if frmMovVeiculosCCIA.EditHw5.AsValue <= 0 then
//       raiseExceptionCreate('Valor informado deve ser maior do que zero!', 'EditHw5');

     if frmMovVeiculosCCIA.Edit3.Visible then
     begin
       if Trim(frmMovVeiculosCCIA.Edit3.Text) = '' then
         raiseExceptionCreate('Chassi de Veículo usado na troca deve ser informado!', 'Edit3');

       if frmMovVeiculosCCIA.Edit3.Visible then
       begin
         vCodEstMoto := ComFat.verificaUsodeVeiculosUsados(1, Trim(frmMovVeiculosCCIA.Edit3.Text));

         if vCodEstMoto <= 0 then
           raiseExceptionCreate('Chassi de Veículo usado na troca não encontrado com estoque!', 'Edit3');
       end;
     end;

     if dataSet.FieldByName('NATUREZA').AsString = 'S' then
       if not vDadosIni.verificarControlesFormasPagBarrados(buscas,
         dataSet.FieldByName('N_COMANDO').AsInteger, dataSet.FieldByName('CLIENTES_V').AsInteger,
         trim(frmMovVeiculosCCIA.ComboBox4.Text), 'MOT')  then
       begin
         raiseExceptionCreate('A condição de pagamento "' + trim(frmMovVeiculosCCIA.ComboBox4.Text) + '" não é permitida para o cliente: ' + #13 +
           QuotedStr(IntToStr(dataSet.FieldByName('CLIENTES_V').AsInteger) + ' - ' +
           trim(vClienteComFat.dataSet.FieldByName('NOME_CLIENTE').AsString)) + #13 + #13 +
           'Pois o cliente esta com o tipo de faturamento "BARRADO"', 'ComboBox4');
         exit;
       end;

     if VerificaSaldo(1) then
     begin
       dtSetPlano.append;
       dtSetPlano.FieldByName('Controle').AsString := frmMovVeiculosCCIA.ComboBox4.text;
       dtSetPlano.FieldByName('Historico').AsString := frmMovVeiculosCCIA.Edit2.text;
       dtSetPlano.FieldByName('Valor').AsFloat := frmMovVeiculosCCIA.EditHw5.AsValue;
       dtSetPlano.FieldByName('Cod_Controle').AsFloat := 0;

       if (trim(dtSetPlano.FieldByName('Controle').AsString) = 'MTUSADAS') then
       begin
         buscas.Close;
         buscas.SQL.Text := ' select * from controles ' +
          ' where ativo = 1 ' +
          ' and codigo_ctrl = ' + IntToStr(vDadosIni.vEmp.vCodCtrlMtUsadas) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
         buscas.Open;
       end
       else
       begin
         buscas.Close;
         buscas.SQL.Text := ' select * from controles ' +
          ' where ativo = 1 ' +
          ' AND nome_ctrl = ' + QuotedStr(trim(dtSetPlano.FieldByName('Controle').AsString)) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
         buscas.Open;
       end;

       if not buscas.IsEmpty then
       begin
         dtSetPlano.FieldByName('Cod_Controle').AsString := buscas.fieldbyname('CODIGO_CTRL').AsString;
         dtSetPlano.FieldByName('TpLanc').AsString := buscas.fieldbyname('NAT_LANC').AsString;
         if (trim(dtSetPlano.FieldByName('Controle').AsString) <> 'MTUSADAS') then
           dtSetPlano.FieldByName('TIPDOC').AsString := buscas.fieldbyname('docs').AsString;
       end
       else
       begin
         if dtSetPlano.FieldByName('Controle').AsString <> 'OUTROS' then
           dtSetPlano.FieldByName('TpLanc').AsString := 'C'
         else
           dtSetPlano.FieldByName('TpLanc').AsString := 'N';
         if (trim(dtSetPlano.FieldByName('Controle').AsString) = 'RECIBOSANT') or (trim(dtSetPlano.FieldByName('Controle').AsString) = 'MTUSADAS') then
           dtSetPlano.FieldByName('Cod_Controle').AsInteger := 01;
       end;
       if (trim(dtSetPlano.FieldByName('Controle').AsString) = 'INTERMEDIACAO') or (trim(dtSetPlano.FieldByName('Controle').AsString) = 'RETORNO') or (trim(dtSetPlano.FieldByName('Controle').AsString) = 'OUTROS') then
         dtSetPlano.FieldByName('EntrValor').AsString := 'N'
       else
         dtSetPlano.FieldByName('EntrValor').AsString := 'S';

       if (trim(dtSetPlano.FieldByName('Controle').AsString) = 'MTUSADAS') then
       begin
        dtSetPlano.FieldByName('CHASSIV').AsString := Trim(frmMovVeiculosCCIA.Edit3.Text);
        dtSetPlano.FieldByName('COD_ESTMOTO').AsInteger := vCodEstMoto;
       end;

       buscas.close;
       dtSetPlano.post;
       frmMovVeiculosCCIA.Edit2.Text := '';
       frmMovVeiculosCCIA.Edit3.Text := '';
       frmMovVeiculosCCIA.EditHw5.AsValue := 0;
     // Fazer as contas do que ainda resta e o que foi atingido....
       VerificaSaldo(2);
     end;
   except
     Result := False;
   end;
end;

procedure TComFat.AtualizarVeiculos(buscas2: TIBQuery);
begin
  buscas2.close;
  buscas2.SQL.text := 'SELECT CHASSI FROM VEICULOS' +
   ' WHERE CHASSI = ' + QuotedStr(buscas.FieldByName('CHASSI_C').AsString) +
   ' and COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1';
  buscas2.Open;
  if buscas2.IsEmpty then
  begin
    buscas2.close;
    buscas2.sql.text :=
      ' INSERT INTO VEICULOS(CODIGO,COD_EMPRESA,CHASSI,COD_CLIENTE,' +
      ' ESPECIE,MARCA_V,MODELO,DESCMODELO,MOTOR,COR,ANOFAB,' +
      ' ANOMOD,CILINDROS,CILINDRADA,LOTACAO,DATA_VENDA,DATA_CAD,HORA_CAD,HP,PLACA,COMBUSTIVEL,' +
      ' COD_COR, COD_COMBUSTIVEL, COD_MARCA, COD_ESPE_SEG, KM_V) ' +
      ' VALUES(:CODIGO,:COD_EMPRESA,:CHASSI,:COD_CLIENTE,:ESPECIE,:MARCA_V,' +
      ' :MODELO,:DESCMODELO,:MOTOR,:COR,:ANOFAB,:ANOMOD,' +
      ' :CILINDROS,:CILINDRADA,:LOTACAO,:DATA_VENDA,:DATA_CAD,:HORA_CAD,:HP,:PLACA,:COMBUSTIVEL,' +
      ' :COD_COR, :COD_COMBUSTIVEL, :COD_MARCA, :COD_ESPE_SEG, :KM_V)';
    buscas2.ParamByName('CODIGO').AsInteger := Gencodigo('VEICULOS', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
    buscas2.ParamByName('COD_EMPRESA').AsString := buscas.FieldByName('COD_EMPRESA').AsString;
    buscas2.ParamByName('CHASSI').AsString := buscas.FieldByName('CHASSI_C').AsString;
    buscas2.ParamByName('COD_CLIENTE').AsString := dataset.FieldByName('CLIENTES_V').AsString;
    buscas2.ParamByName('ESPECIE').AsString := buscas.FieldByName('TIPOEST').AsString;
    buscas2.ParamByName('MARCA_V').AsString := buscas.FieldByName('MARCAEST').AsString;
    buscas2.ParamByName('MODELO').AsString := buscas.FieldByName('VERSAOEST').AsString;
    buscas2.ParamByName('DESCMODELO').AsString := buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;
    buscas2.ParamByName('MOTOR').AsString := buscas.FieldByName('MOTOREST').AsString;
    buscas2.ParamByName('COR').AsString := buscas.FieldByName('COREST').AsString;
    buscas2.ParamByName('ANOFAB').AsString := buscas.FieldByName('ANO_FABEST').AsString;
    buscas2.ParamByName('ANOMOD').AsString := buscas.FieldByName('ANO_MODEST').AsString;
    buscas2.ParamByName('CILINDROS').AsString := buscas.FieldByName('CILINDROSEST').AsString;
    buscas2.ParamByName('CILINDRADA').AsFloat := buscas.FieldByName('CILINDRADAEST').AsFloat;
    buscas2.ParamByName('COMBUSTIVEL').AsString := buscas.FieldByName('COMBUSTIVELEST').AsString;
    buscas2.ParamByName('LOTACAO').AsString := buscas.FieldByName('LOTACAOEST').AsString;
    buscas2.ParamByName('DATA_VENDA').AsString := dataset.FieldByName('DATA_VEN').AsString;
    buscas2.ParamByName('DATA_CAD').AsDate := date;
    buscas2.ParamByName('HORA_CAD').AsString := FormatDateTime('HH:MM', date);
    buscas2.ParamByName('HP').AsFloat := buscas.FieldByName('HPEST').AsFloat;
    if trim(buscas.FieldByName('STATUS_USO').AsString) = 'N' then
      buscas2.ParamByName('PLACA').AsString := copy(buscas.fieldbyname('CHASSI_C').AsString, 10, 8)
    else
      buscas2.ParamByName('PLACA').AsString := buscas.fieldbyname('PLACAEST').AsString;
    buscas2.ParamByName('COD_COR').AsInteger := buscas.FieldByName('COD_COR').AsInteger;
    buscas2.ParamByName('COD_COMBUSTIVEL').AsInteger := buscas.FieldByName('COD_COMBUSTIVEL').AsInteger;
    buscas2.ParamByName('COD_MARCA').AsInteger := buscas.FieldByName('COD_MARCA').AsInteger;
    buscas2.ParamByName('COD_ESPE_SEG').AsInteger := buscas.FieldByName('COD_ESPE_SEG').AsInteger;
    if (buscas.FieldByName('STATUS_USO').AsString = 'N') then
    	buscas2.ParamByName('KM_V').AsInteger := 0
    else
    	buscas2.ParamByName('KM_V').AsInteger := 1;
    buscas2.Prepare;
    buscas2.ExecSQL;
  end
  else
  begin
    buscas2.close;
    buscas2.sql.text :=
      ' UPDATE VEICULOS SET COD_CLIENTE = :COD_CLIENTE,' +
      ' ESPECIE = :ESPECIE, MARCA_V = :MARCA_V, MODELO = :MODELO,DESCMODELO = :DESCMODELO, ' +
      ' MOTOR = :MOTOR, COR = :COR, ANOFAB = :ANOFAB, ANOMOD = :ANOMOD, CILINDROS = :CILINDROS,' +
      ' CILINDRADA = :CILINDRADA, LOTACAO = :LOTACAO, DATA_VENDA = :DATA_VENDA, HP = :HP, COMBUSTIVEL = :COMBUSTIVEL, ' +
      ' COD_COR = :COD_COR, COD_COMBUSTIVEL = :COD_COMBUSTIVEL, COD_MARCA = :COD_MARCA, ' +
      ' COD_ESPE_SEG = :COD_ESPE_SEG, KM_V = :KM_V ' +
      ' WHERE CHASSI = :CHASSI AND COD_EMPRESA = :COD_EMPRESA AND ATIVO = 1';
    buscas2.ParamByName('CHASSI').AsString := buscas.FieldByName('CHASSI_C').AsString;
  	buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);  
    buscas2.ParamByName('COD_CLIENTE').AsString := dataset.FieldByName('CLIENTES_V').AsString;
    buscas2.ParamByName('ESPECIE').AsString := buscas.FieldByName('TIPOEST').AsString;
    buscas2.ParamByName('MARCA_V').AsString := buscas.FieldByName('MARCAEST').AsString;
    buscas2.ParamByName('MODELO').AsString := buscas.FieldByName('VERSAOEST').AsString;
    buscas2.ParamByName('DESCMODELO').AsString := buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;
    buscas2.ParamByName('MOTOR').AsString := buscas.FieldByName('MOTOREST').AsString;
    buscas2.ParamByName('COR').AsString := buscas.FieldByName('COREST').AsString;
    buscas2.ParamByName('ANOFAB').AsString := buscas.FieldByName('ANO_FABEST').AsString;
    buscas2.ParamByName('ANOMOD').AsString := buscas.FieldByName('ANO_MODEST').AsString;
    buscas2.ParamByName('CILINDROS').AsString := buscas.FieldByName('CILINDROSEST').AsString;
    buscas2.ParamByName('CILINDRADA').AsFloat := buscas.FieldByName('CILINDRADAEST').AsFloat;
    buscas2.ParamByName('COMBUSTIVEL').AsString := buscas.FieldByName('COMBUSTIVELEST').AsString;
    buscas2.ParamByName('LOTACAO').AsString := buscas.FieldByName('LOTACAOEST').AsString;
    buscas2.ParamByName('DATA_VENDA').AsString := dataset.FieldByName('DATA_VEN').AsString;
    buscas2.ParamByName('HP').AsFloat := buscas.FieldByName('HPEST').AsFloat;
    buscas2.ParamByName('COD_COR').AsInteger := buscas.FieldByName('COD_COR').AsInteger;
    buscas2.ParamByName('COD_COMBUSTIVEL').AsInteger := buscas.FieldByName('COD_COMBUSTIVEL').AsInteger;
    buscas2.ParamByName('COD_MARCA').AsInteger := buscas.FieldByName('COD_MARCA').AsInteger;
    buscas2.ParamByName('COD_ESPE_SEG').AsInteger := buscas.FieldByName('COD_ESPE_SEG').AsInteger;
    if (buscas.FieldByName('STATUS_USO').AsString = 'N') then
    	buscas2.ParamByName('KM_V').AsInteger := 0
    else
    	buscas2.ParamByName('KM_V').AsInteger := 1;
    buscas2.Prepare;
    buscas2.ExecSQL;
   // Verificar se o cancelamento de nf
  end;
end;

function TComFat.BaixarVeicIntermed: boolean;
var
  vcodmtusadas: integer;
begin
  // Colocar aqui a baixa de veículo que é de outras concessionária
  result := true;
  if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U' then
  begin
    if trim(dataSet.fieldbyname('CONFUS').AsString) <> 'S' then
    begin
//      if not BaixarVeiculos(vmtn, vmtus) then
      if not BaixarVeiculos(1, 0) then
      begin
        dataSet.Cancel;
        RollBackTransacao;
        Result := False;
        exit;
      end;
      CommitaTransacao;
    end;
  end;
end;

function TComFat.BaixarVeiculos(vtp, vmtus: integer): boolean;
var
  vcodmtusadas: integer;
  buscas2: TIBQuery;
begin
  Result := true;

  if not ((vSing.vNatureza = 'S') and (vDadosIni.vEmp.vModoFaturamento = 'N')) then
  begin
    if not vReceberPeloFinanceiro then
    	vReceberPeloFinanceiro := ReceberFinanceiroPeloFinanceiroComFat;

    if not vReceberPeloFinanceiro then
    begin
      if vEstMoto.dataSet.RecordCount > 0 then
        vEstMoto.dataSet.ApplyUpdates(-1);
      vEstMoto.setarDadosComando(ComFat);
      exit;
    end;
  end;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if (dataSet.FieldByName('NATUREZA').AsString = 'S')
  	and ((vDadosIni.vEmp.vModoFaturamento = 'N') or (vReceberPeloFinanceiro)) then
  begin
    if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
    begin
      if vtp = 1 then
      begin
          buscas.close;
          buscas.sql.text:='select * from Est_Moto where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
           ' and codigo = ' + InttoStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
           ' and cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1';  
          buscas.open;

          if (buscas.FieldByName('N_COMANDOV').AsInteger > 0) and (trim(buscas.FieldByName('STATUS_ESTOQUE').AsString) <> 'S') then
            if buscas.FieldByName('N_COMANDOV').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger then
            begin
              Application.MessageBox(PChar('Não é possível realizar baixa no Documento de venda!' + #13 +
               'Veículo '  + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
               ' está reservado/vendido ao Documento de Venda Nº = ' +  vDadosIni.strzero(buscas.FieldByName('N_COMANDOV').AsInteger, 6) + #13 +
               'Favor verificar para continuar!'), 'Erro', 0 + 64);
              Result := False;
              vSair := True;
              exit;
            end;

          if trim(buscas.FieldByName('POSICAO').AsString) = 'MORTO' then
          begin
//           result:=false;
           exit;
          end;

          if vEstMoto.dataSet.State <> dsEdit then
            vEstMoto.dataSet.Edit;
          if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
            vEstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString := 'N';
          if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
            vEstMoto.dataSet.FieldByName('POSICAO').AsString := 'MORTO';
          if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
            vEstMoto.dataSet.FieldByName('STATUS_TRANSDEP').AsString := 'S';
//          else if dataSet.FieldByName('TIPV_VEICULO').AsString = 'D' then
//            vEstMoto.dataSet.FieldByName('STATUS_DEMONST').AsString := 'S';
          vEstMoto.dataSet.Post;
          AtualizarVeiculos(buscas2);

          dataSet.Edit;
          dataSet.FieldByName('CONFUS').AsString := 'S';
          dataSet.Post;
      end
      else
      begin
          buscas.close;
          buscas.sql.text:='select * from Est_Moto where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
           ' and codigo = ' + InttoStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
           ' and cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1'; 
          buscas.open;

          if (buscas.FieldByName('N_COMANDOV').AsInteger > 0) and (trim(buscas.FieldByName('STATUS_ESTOQUE').AsString) <> 'S') then
            if buscas.FieldByName('N_COMANDOV').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger then
            begin
              Application.MessageBox(PChar('Não é possível realizar baixa no Documento de venda!' + #13 +
               'Veículo '  + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
               ' está reservado/vendido ao Documento de Venda Nº = ' +  vDadosIni.strzero(buscas.FieldByName('N_COMANDOV').AsInteger, 6) + #13 +
               'Favor verificar para continuar!'), 'Erro', 0 + 64);
              Result := False;
              vSair := True;
              exit;
            end;
          
          if trim(buscas.FieldByName('POSICAO').AsString) = 'MORTO' then
          begin
//           result:=false;
           exit;
          end;

//          if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'T') and (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
//          begin
              AtualizarVeiculos(buscas2);
//          end;
          if vEstMoto.dataSet.State <> dsEdit then
            vEstMoto.dataSet.Edit;
          if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
            vEstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString := 'N';
          if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
            vEstMoto.dataSet.FieldByName('POSICAO').AsString := 'MORTO';
           if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
            vEstMoto.dataSet.FieldByName('STATUS_TRANSDEP').AsString := 'S';
//          else if dataSet.FieldByName('TIPV_VEICULO').AsString = 'D' then
//           vEstMoto.dataSet.FieldByName('STATUS_DEMONST').AsString := 'S';
          vEstMoto.dataSet.Post;
      end;
    end
    else
    begin
       buscas.close;
       buscas.sql.text:='select * from Est_Moto where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
        ' and codigo = ' + InttoStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
        ' and cod_empresa = '+vDadosIni.codEmpresa+' and ativo = 1'; //and status_uso = ''N''
       buscas.open;

       if (buscas.FieldByName('N_COMANDOV').AsInteger > 0) and (trim(buscas.FieldByName('STATUS_ESTOQUE').AsString) <> 'S') then
         if buscas.FieldByName('N_COMANDOV').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger then
         begin
           Application.MessageBox(PChar('Não é possível realizar baixa no Documento de venda!' + #13 +
            'Veículo '  + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
            ' está reservado/vendido ao Documento de Venda Nº = ' +  vDadosIni.strzero(buscas.FieldByName('N_COMANDOV').AsInteger, 6) + #13 +
            'Favor verificar para continuar!'), 'Erro', 0 + 64);
           Result := False;
           vSair := True;
           exit;
         end;
//      if vEstMoto.dataSet.State <> dsEdit then
//          vEstMoto.dataSet.Edit;
//      if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
//        vEstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString := 'N';
//     if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
//         vEstMoto.dataSet.FieldByName('POSICAO').AsString := 'MORTO';
//      if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
//        vEstMoto.dataSet.FieldByName('STATUS_TRANSDEP').AsString := 'S';
//      else if dataSet.FieldByName('TIPV_VEICULO').AsString = 'D' then
//       vEstMoto.dataSet.FieldByName('STATUS_DEMONST').AsString := 'S';
//      vEstMoto.dataSet.Post;

      AtualizarVeiculos(buscas2);

      if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U' then
      begin
        if dataset.State <> dsEdit then
         dataSet.Edit;
        dataSet.FieldByName('CONFUS').AsString := 'S';
        dataSet.Post;
      end;
    end;
  end;
  if vEstMoto.dataSet.RecordCount > 0 then
    vEstMoto.dataSet.ApplyUpdates(-1);
  vEstMoto.setarDadosComando(ComFat);
end;

function TComFat.cadCliente(modal: integer): boolean;
var
  Cl: TCadClientes;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro do cliente...');
    cl := tcadclientes.create;
    if modal = 2 then
    begin
      Cl.abreClientes(StrToInt(vDadosIni.vPesquisa));
      if (pos('CONSUMIDOR', UpperCase(Cl.dataSet.FieldByName('NOME_CLIENTE').AsString)) > 0) or
        (Cl.dataSet.FieldByName('DATA_MOD_CAD').AsDateTime = vDadosIni.getDataBanco(buscas)) then
      begin
        vDadosIni.fechaStatusProcessamento;
        Exit;
      end;
    end;
    if (modal = 2) and (vDadosIni.vPesquisa <> '') then
    begin
      try
        StrToInt(vDadosIni.vPesquisa);
      except
        vDadosIni.vPesquisa := '';
      end;

      if vDadosIni.vPesquisa <> '' then
        vDadosIni.vPesquisa := 'EDITAR_CLIENTE|' + vDadosIni.vPesquisa + '|';
    end;
    cl.cadcliente(modal);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TComFat.ChecaCamposObrigatorios(pSomenteCampos: boolean = False): boolean;
var
  buscas2, buscas3: TIBQuery;
  CodigoCliente: Integer;
  vValorContrato, vMensagem: string;
  vchecarcampos: Boolean;
  DBEditChassi, DBEditTipoVenda, DBEditIntermediador, DBEditCliVendedor, DBEditClienteV, DBEditConcess, DBEditVendedor, DBEditGerente, DBValorReal: string;
begin
  try
    vchecarcampos := True;
//    if vDadosIni.vEmp.vTipoEmpVeiculos = 'C' then
//    begin
//     vDadosIni.vInibeMensPesqPros := 'S';
//     if vDadosIni.PesqPros('VEI128', 'CHECARCAMPOS', '', 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas, False) then
//       vchecarcampos := False;
//    end;

    Result := false;
    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas3 := TIBQuery.Create(Application);
    buscas3.Database := buscas.Database;
    buscas3.Transaction := buscas.Transaction;

    DBEditChassi := '';
    DBEditTipoVenda := '';
    DBEditIntermediador := '';
    DBEditConcess := '';
    DBEditCliVendedor := '';
    DBEditClienteV := '';
    DBEditVendedor := '';
    DBEditGerente := '';
    DBValorReal := '';

    if vSing.vMod = 'CFT' then
    begin
      DBEditChassi := 'DBEdit2';
      DBEditTipoVenda := 'DBComboBox3';
      DBEditClienteV := 'DBEdit51';
      DBEditVendedor := 'DBEdit52';
      DBValorReal := 'DBEdit5';
      if trim(dataSet.FieldByName('TIPV_VEICULO').AsString) = 'I' then
      begin
        if (vSing.vTipoVenda= 'N') then
          DBEditConcess := 'DBEdit67'
        else
          DBEditCliVendedor := 'DBEdit67';
      end;
    end
    else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
    begin
      DBEditChassi := 'DBEdit48';
      DBEditTipoVenda := 'DBComboBox4';
      DBEditClienteV := 'DBEdit14';
      DBEditCliVendedor := 'DBEdit39';
      DBEditVendedor := 'DBEdit62';
      DBEditGerente := 'DBEdit8';
      DBValorReal := 'DBEdit41';
    end
    else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
    begin
      DBEditChassi := 'DBEdit56';
      DBEditTipoVenda := 'DBComboBox5';
      if (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
        DBEditIntermediador := 'DBEdit57';
      DBEditClienteV := 'DBEdit58';
      if ((vSing.vMod = 'CTRINTERM') or (vSing.vMod = 'CTRRESDOM')) and (vSing.vTipoVenda= 'N') then
        DBEditConcess := 'DBEdit60'
      else
        DBEditCliVendedor := 'DBEdit59';
      if (vSing.vMod = 'CTRRESDOM') and (vSing.vTipoVenda= 'N') then
        DBEditCliVendedor := 'DBEdit59';
      DBEditVendedor := 'DBEdit25';
      DBEditGerente := 'DBEdit37';
      DBValorReal := 'DBEdit12';
    end
    else if vSing.vMod = 'CTRVNDCONS' then
    begin
      DBEditChassi := 'DBEdit16';
      DBEditTipoVenda := 'DBComboBox8';
      DBEditClienteV := 'DBEdit15';
      DBEditVendedor := 'DBEdit82';
      DBEditGerente := 'DBEdit83';
      DBValorReal := 'DBEdit81';
    end;

    if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = '' then
    begin
      if (vSing.vMod = 'CFT') then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vTipo = 'CTRINTERM') then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
      if DBEditTipoVenda <> '' then
        raiseExceptionCreate('Tipo de Venda deve ser informado!', DBEditTipoVenda);
    end;
    if ((trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) <> 'N') and (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) <> 'U')) then
    begin
      if (vSing.vTipo = 'CFT') then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vTipo = 'CTRINTERM') then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
      if DBEditTipoVenda <> '' then
        raiseExceptionCreate('Tipo de Venda incorreto!', DBEditTipoVenda);
    end;

    if trim(dataSet.FieldByName('CHASSIV').AsString) = '' then
    begin
      if vSing.vMod = 'CFT' then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
      else if vSing.vMod = 'CTRVNDCONS' then
        frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
      if DBEditChassi <> '' then
       raiseExceptionCreate('Chassi deve ser informado!', DBEditChassi);
    end;

    if not testarCNPJ(vMensagem) then
    begin
      if vSing.vMod = 'CFT' then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
       else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
       else if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
       if DBEditChassi <> '' then
          raiseExceptionCreate(vMensagem, DBEditClienteV);
    end;

    if not _VerificarContratos(vMensagem) then
    begin
       if vSing.vMod = 'CFT' then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
       else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
       else if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
       if DBEditChassi <> '' then
          raiseExceptionCreate(vMensagem, DBEditChassi);
    end;

    if not _VerificarPendencias(vMensagem) then
    begin
       if vSing.vMod = 'CFT' then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
       else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
       else if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
       if DBEditChassi <> '' then
          raiseExceptionCreate(vMensagem, DBEditChassi);
    end;

    if not _VerificarReserva(vMensagem) then
    begin
       if vSing.vMod = 'CFT' then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
       else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
       else if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
       if DBEditChassi <> '' then
          raiseExceptionCreate(vMensagem, DBEditChassi);
    end;

    if vchecarcampos then
      if dataSet.FieldByName('MESES_CONTRATO').AsInteger <= 0 then
      begin       
         if vSing.vMod = 'CTRVNDCONS' then
         begin
           frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
           raiseExceptionCreate('Quantidade de meses deve ser informada!', 'DBEdit19');
         end;
      end;

    if vchecarcampos then  
      if trim(dataSet.FieldByName('DATA_INICIO').AsString) = '' then
      begin
         if vSing.vMod = 'CTRVNDCONS' then
         begin
           frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
           raiseExceptionCreate('Data Inicial do Contrato deve ser informada!', 'DBEdit21');
         end;
      end;

    if vchecarcampos then  
      if trim(dataSet.FieldByName('DATA_TERMINO').AsString) = '' then
      begin
         if vSing.vMod = 'CTRVNDCONS' then
         begin
           frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
           raiseExceptionCreate('Data Final do Contrato deve ser informada!', 'DBEdit22');
         end;
      end;

    if vchecarcampos then  
      if dataSet.FieldByName('COD_INTERMED').AsFloat <= 0 then
      begin
        if (vSing.vMod = 'CTRINTERM') or (vSing.vMod = 'CTRRESDOM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
        if DBEditIntermediador <> '' then
         raiseExceptionCreate('Intermediador deve ser informado!', DBEditIntermediador);
      end;

    if vchecarcampos then  
      if not vIntermediadorComFat.abreClientes(dataSet.FieldByName('COD_INTERMED').AsInteger) then
      begin
        if (vSing.vMod = 'CTRINTERM') or (vSing.vMod = 'CTRRESDOM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
        if DBEditIntermediador <> '' then
          raiseExceptionCreate('Intermediador não encontrado!', DBEditIntermediador);
      end;

    if dataSet.FieldByName('CLIENTES_V').AsFloat <= 0 then
    begin
      if vSing.vMod = 'CFT' then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or ((vSing.vMod = 'CTRINTERM') and (vSing.vTipoVenda= 'U')) then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
      else if vSing.vMod = 'CTRVNDCONS' then
        frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
      if (DBEditClienteV <> '') and (vSing.vMod = 'CFT') then
        raiseExceptionCreate('Cliente deve ser informado!', DBEditClienteV)
      else if (DBEditClienteV <> '') then
        raiseExceptionCreate('Comprador deve ser informado!', DBEditClienteV);
    end;

    if not vClienteComFat.abreClientes(dataSet.FieldByName('CLIENTES_V').AsInteger) then
    begin
      if vSing.vMod = 'CFT' then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or ((vSing.vMod = 'CTRINTERM') and (vSing.vTipoVenda= 'U')) then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
      else if vSing.vMod = 'CTRVNDCONS' then
        frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
      if (DBEditClienteV <> '') and (vSing.vMod = 'CFT') then
        raiseExceptionCreate('Cliente não encontrado!', DBEditClienteV)
      else if (DBEditClienteV <> '') then
        raiseExceptionCreate('Comprador não encontrado!', DBEditClienteV);
    end;

    if vchecarcampos then
      if dataSet.FieldByName('COD_CLI_VENDE').AsFloat <= 0 then
      begin
        if (vSing.vMod = 'CFT') then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
        else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
          frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
        else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
        if DBEditCliVendedor <> '' then
          if (vSing.vMod = 'CFT') then
            raiseExceptionCreate('Proprietário não informado!', DBEditCliVendedor)
          else
            raiseExceptionCreate('Cliente Vendedor não informado!', DBEditCliVendedor);
      end;

    if vchecarcampos then  
      if not vClienteVendComFat.abreClientes(dataSet.FieldByName('COD_CLI_VENDE').AsInteger) then
      begin
        if (vSing.vMod = 'CFT') then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
        else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
          frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
        else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
        if DBEditCliVendedor <> '' then
          if (vSing.vMod = 'CFT') then
            raiseExceptionCreate('Proprietário não encontrado!', DBEditCliVendedor)
          else
            raiseExceptionCreate('Cliente Vendedor não encontrado!', DBEditCliVendedor);
      end;

    if vchecarcampos then
      if dataSet.FieldByName('COD_CONCESS').AsFloat <= 0 then
      begin
        if (vSing.vMod = 'CFT') then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
        else if (vSing.vMod = 'CTRINTERM') or (vSing.vMod = 'CTRRESDOM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
        if DBEditConcess <> '' then
          if (vSing.vMod = 'CFT') then
            raiseExceptionCreate('Proprietário deve ser informado!', DBEditConcess)
          else
            raiseExceptionCreate('Concessionária deve ser informado!', DBEditConcess);
      end;

    if vchecarcampos then  
      if not vConcessionariaComFat.abreClientes(dataSet.FieldByName('COD_CONCESS').AsInteger) then
      begin
        if (vSing.vMod = 'CFT') then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
        else if (vSing.vMod = 'CTRINTERM') or (vSing.vMod = 'CTRRESDOM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
        if DBEditConcess <> '' then
          if (vSing.vMod = 'CFT') then
            raiseExceptionCreate('Proprietário não encontrado!', DBEditConcess)
          else
            raiseExceptionCreate('Concessionária não encontrado!', DBEditConcess);
      end;
            
    if dataSet.FieldByName('COVEND_V').AsInteger <= 0 then
    begin
      if vSing.vMod = 'CFT' then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
      else if vSing.vMod = 'CTRVNDCONS' then
        frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
      if DBEditVendedor <> '' then
        raiseExceptionCreate('Vendedor deve ser informado!', DBEditVendedor);
    end;

    if not vColaborador.buscarColaborador(dataSet.FieldByName('COVEND_V').AsInteger) then
    begin
      if vSing.vMod = 'CFT' then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
      else if vSing.vMod = 'CTRVNDCONS' then
        frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
      if DBEditVendedor <> '' then
        raiseExceptionCreate('Vendedor não encontrado!', DBEditVendedor);
    end;

    if vchecarcampos then
      if dataSet.FieldByName('COD_GERENTE').AsInteger <= 0 then
      begin
        if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
          frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
        else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
        else if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
        if DBEditGerente <> '' then
         raiseExceptionCreate('Gerente deve ser informado!', DBEditGerente);
      end;   

    if vchecarcampos then  
      if not vGerente.buscarColaborador(dataSet.FieldByName('COD_GERENTE').AsInteger) then
      begin
        if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
          frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
        else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
        else if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
        if DBEditGerente <> '' then
          raiseExceptionCreate('Gerente não encontrado!', DBEditGerente);
      end;

    if vchecarcampos then
      if (vSing.vMod = 'CTRVNDCONS') and (dataSet.FieldByName('CONS_DEV').IsNull) then
      begin
        if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
        raiseExceptionCreate('Favor informar a operação do ' +vSing.vNomeContrato, '');
      end; 

    if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') or (vSing.vTipo = 'CFT') or (vSing.vMod = 'CTRVND')
      or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM')
      or ((dataSet.FieldByName('CONS_DEV').AsString <> '') and (vSing.vMod = 'CTRVNDCONS')) then
    begin
      if dataSet.FieldByName('PERC_RED_V').AsFloat <> 0 then
      begin
        if dataSet.FieldByName('ALICM_V').AsFloat <= 0 then
        begin
          frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
          raiseExceptionCreate('Favor Colocar aliquota de icms porque foi definida redução!', 'DBEdit34');
        end;
      end;

      if dataSet.FieldByName('CONDPAG_V').AsInteger <= 0 then
      begin
        frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
        raiseExceptionCreate('Condições de Pagamento deve ser informada!', 'DBEdit24');
      end;

      if dataSet.FieldByName('NATOP_V').AsFloat <= 0 then
      begin
        frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
        raiseExceptionCreate('Natureza de Operação deve ser informada!', 'DBEdit26');
      end;

      if dataSet.FieldByName('NATUREZA').AsString = 'S' then
        if dataSet.FieldByName('PRVEN_V').AsFloat <= 0 then
        begin
          frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
          raiseExceptionCreate('Valor da Nota deve ser informado!', 'DBEdit28');
        end;

      if dataSet.FieldByName('NATUREZA').AsString = 'S' then
        if dataSet.FieldByName('PRVEN_V').AsFloat <= 0 then
        begin
          frmMovVeiculosCCIA.TabSheet_Venda.Show;
          raiseExceptionCreate('Comando com valor de produto zerado!', 'DBComboBox3');
        end;

      if frmMovVeiculosCCIA.DBEdit78.Visible then
      begin
        if dataSet.FieldByName('QTDE_PARC').asinteger <= 0 then
        begin
          frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
          raiseExceptionCreate('Favor Indicar a quatidade de parcela desta venda a prazo', 'DBEdit78');
        end;
      end;

      if trim(dataSet.FieldByName('TIPO_V').AsString) = '' then
      begin
        frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
        raiseExceptionCreate('Tipo de Venda deve ser informado!', 'DBComboBox1');
      end;

      if (Trim(dataSet.FieldByName('TPREST').AsString) = '') or (Pos(Copy(Trim(dataSet.FieldByName('TPREST').AsString), 1, 1), '012349') = 0) then
      begin
        frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
        raiseExceptionCreate('Favor Indicar o tipo de restrição para NFe!', 'DBComboBox2');
      end;

      if not vervalorminimo then
      begin
       frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
       exit;
      end;

//      if not checarCombinacaoCFOPCST then
//      begin
//       frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
//       raiseExceptionCreate('Combinação de CFOP com CST não encontrada'+#13+
//          'Por favor entre no cadastro de CFOP e verifique as combinações','DBEdit29');
//      end;

      if (dataSet.FieldByName('NATUREZA').AsString = 'S') and (dataSet.FieldByName('TIPV_VEICULO').AsString = 'V') and (not pSomenteCampos) then
        if dataSet.FieldByName('VALOR_REAL').AsFloat < dataSet.FieldByName('VALTOT_V').AsFloat then
        begin
          Application.MessageBox('Valor Real do produto menor que o valor total da NF, necessita autorização!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          if not vDadosIni.PesqPros('VEI066', 'PERMITIR', 'CHASSI - ' + dataSet.FieldByName('CHASSIV').AsString + '', 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas, true) then
            Exit;
        end;
    end;

    if pSomenteCampos then
    begin
      Result := true;
      exit;
    end;

    if trim(dataSet.FieldByName('VALOR_REAL').AsString) = '' then
    begin
      if vSing.vMod = 'CFT' then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
      else if vSing.vMod = 'CTRVNDCONS' then
        frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
      if DBValorReal <> '' then
        raiseExceptionCreate('Valor Real do Bem Nao Informado', DBValorReal);
    end;

    if vchecarcampos then  
      if dataSet.FieldByName('COMISSAO').AsFloat <= 0 then
      begin
         if vSing.vMod = 'CTRVNDCONS' then
         begin
           frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
           raiseExceptionCreate('Percentual de Comissão não Informado', 'DBEdit84');
         end;
      end;

    if not _VerificarEstoqueVeiculo(buscas2) then
    begin
      if dataSet.State <> dsEdit then
      begin
        if vSing.vMod = 'CFT' then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
        else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
          frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
        else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
        else if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
        if (DBEditChassi <> '') and ((vSing.vNatureza = 'E') or (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString ='N')) then
          raiseExceptionCreate('Veículo não encontrado!', DBEditChassi)
        else if (DBEditChassi <> '') and (vSing.vNatureza = 'S') then
          raiseExceptionCreate('Veículo não encontrado no estoque!', DBEditChassi);
      end;
    end;

    if not VendaEstoque then
    begin
      if vSing.vMod = 'CFT' then
        frmMovVeiculosCCIA.TabSheet_Venda.Show
      else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
        frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
      else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
        frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
      else if vSing.vMod = 'CTRVNDCONS' then
        frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
      if (DBEditChassi <> '') then
        raiseExceptionCreate('Versão do Veículo não configurada como Venda Estoque, favor verificar!', DBEditChassi);
    end;


    if (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U') and (vDadosIni.vEmp.vTipoEmpVeiculos = 'A') then
    begin
      if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'D') and (buscas2.FieldByName('ESTOQUE').AsString <> 'P') then
      begin
        if dataSet.State <> dsEdit then
        begin
          if vSing.vMod = 'CFT' then
            frmMovVeiculosCCIA.TabSheet_Venda.Show
          else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
            frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
          else if vSing.vMod = 'CTRVNDCONS' then
            frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
          if DBEditChassi <> '' then
           if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'N' then
             raiseExceptionCreate('Veículo Novo não é de estoque. Não é permitido a emissão de NF de Demonstração', DBEditChassi)
           else
             raiseExceptionCreate('Veículo Usado não é de estoque. Não é permitido a emissão de NF de Demonstração', DBEditChassi);
        end;
      end;
    end;

    if (verificaUsodeVeiculosUsados(3) <= 0) then
    begin
       if vSing.vMod = 'CFT' then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
        else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
          frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
        else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
        else if vSing.vMod = 'CTRVNDCONS' then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
        if DBEditChassi <> '' then
          raiseExceptionCreate('Veículo usado na troca deve diferente do veículo utilizado nesta operação!', DBEditChassi);
    end;

    if (verificaUsodeVeiculosUsados(2) <= 0) then
      exit;
 //   if (dataSet.FieldByName('NATOP_V').AsFloat = 5409) or (dataSet.FieldByName('NATOP_V').AsFloat = 6409) then
    if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
    begin
      if Application.MessageBox('Tem Certeza que este comando é de transferencia?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
      begin
        frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
        if frmMovVeiculosCCIA.DBEdit26.CanFocus then
          frmMovVeiculosCCIA.DBEdit26.SetFocus;
        exit;
      end;
    end;

    //if (dataSet.FieldByName('NATOP_V').AsFloat = 5912) or (dataSet.FieldByName('NATOP_V').AsFloat = 6912) then
    if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'D') then
    begin
      if not vDadosIni.PesqPros('VEI070', 'PERMITIR', 'CHASSI - ' + dataSet.FieldByName('CHASSIV').AsString + '', 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString,
        buscas3, true) then
      begin
        Application.MessageBox('Demonstração não permitida para este usuário!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        exit;
      end;
    end;

    if trim(vEstMoto.dataSet.FieldByName('POSICAO').AsString) = 'TRANSITO' then
    begin
       if vSing.vNatureza = 'S' then
       begin
          if Application.MessageBox('Veículo se encontra em Trânsito, deseja continuar mesmo assim?',
           'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
          begin
            if vSing.vMod = 'CFT' then
              frmMovVeiculosCCIA.TabSheet_Venda.Show
            else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
              frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
            else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
              frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
            else if vSing.vMod = 'CTRVNDCONS' then
              frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
            if DBEditChassi <> '' then
              raiseExceptionCreate('Veículo se encontra em Trânsito!', DBEditChassi);
          end;
       end;
    end;

    if not TestarCST(vMensagem, dataSet.FieldByName('CST_V').AsString) then
    begin
      frmMovVeiculosCCIA.TabSheet_DadosdaNota.Show;
      raiseExceptionCreate(vMensagem, 'DBEdit29');
    end;
//    else if trim(vEstMoto.dataSet.FieldByName('POSICAO').AsString) = 'ESTACIONAMENTO' then
//    begin
//       if (vSing.vMod <> 'CTRINTERM') then
//       begin
//         if vSing.vMod = 'CFT' then
//           frmMovVeiculosCCIA.TabSheet_Venda.Show
//         else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
//           frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
//         else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
//           frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
//         else if vSing.vMod = 'CTRVNDCONS' then
//           frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
//         if DBEditChassi <> '' then
//           raiseExceptionCreate('Veículo se encontra em Estacionamento, não é possível realizar está operação!', DBEditChassi);
//       end;
//   end;

    if (vSing.vNatureza = 'S') and (trim(vNaturezaOp.dataSet.FieldByName('FATURAMENTO').AsString) = 'S') then
      abreFormPerguntasVeiculo;

    if (vSing.vMod = 'CFT') or (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
    begin
      if vSing.vNatureza = 'S' then
      begin
        if (vSing.vMod = 'CFT') or (vDadosIni.vUsarPlanoVeic = 'S') then
          Application.MessageBox(PChar('Valor a ser recebido pelo Caixa: ' + format('%n', [dataSet.FieldByName('VALOBS1').AsFloat +
            dataSet.FieldByName('VALOBS2').AsFloat + dataSet.FieldByName('VALOBS3').AsFloat +
              dataSet.FieldByName('VALOBS4').AsFloat + dataSet.FieldByName('VALOBS5').AsFloat])), 'Informação', MB_OK + MB_ICONINFORMATION +
              MB_DEFBUTTON1)
        else
          Application.MessageBox(PChar('Valor a ser recebido pelo Caixa: ' + format('%n', [dataSet.FieldByName('VALOR_A_REC').AsFloat])), 'Informação', MB_OK + MB_ICONINFORMATION +
              MB_DEFBUTTON1)
      end;
    end;

    if (dataSet.FieldByName('BASE_ICM_V').AsFloat <> 0) and (not dataSet.FieldByName('BASE_ICM_V').IsNull) then
      dataSet.FieldByName('CST_V').AsString := Copy(trim(dataSet.FieldByName('CST_V').AsString), 1, 1) + '00';
    if ((dataSet.FieldByName('BASE_ICM_V').AsFloat = 0) or (dataSet.FieldByName('BASE_ICM_V').IsNull)) and
      (Copy(trim(dataSet.FieldByName('CST_V').AsString), 2, 2) <> '40') and
      (Copy(trim(dataSet.FieldByName('CST_V').AsString), 2, 2) <> '50') and
      (Copy(trim(dataSet.FieldByName('CST_V').AsString), 2, 2) <> '41') and
      (Copy(trim(dataSet.FieldByName('CST_V').AsString), 2, 2) <> '90') then
        if (vSing.vTipoVenda= 'N') then
          dataSet.FieldByName('CST_V').AsString := Copy(trim(dataSet.FieldByName('CST_V').AsString), 1, 1) + '60'
        else
          dataSet.FieldByName('CST_V').AsString := Copy(trim(dataSet.FieldByName('CST_V').AsString), 1, 1) + '00';
    if (dataSet.FieldByName('BASE_ICM_V').AsFloat <> 0) and (not dataSet.FieldByName('BASE_ICM_V').IsNull) and
      (dataSet.FieldByName('REDB_V').AsString = 'S') then
        dataSet.FieldByName('CST_V').AsString := Copy(trim(dataSet.FieldByName('CST_V').AsString), 1, 1) + '20';
    dataSet.FieldByName('VALTOT_V').AsFloat := (dataSet.FieldByName('PRVEN_V').AsFloat +
      dataSet.FieldByName('FRETE_V').AsFloat + dataSet.FieldByName('SEGURO_V').AsFloat + dataSet.FieldByName('OUTDESP_V').AsFloat);

    if (vSing.vMod = 'CTRVNDCONS') and (dataSet.FieldByName('VALOR_A_REC').AsFloat <= 0) then
      dataSet.FieldByName('VALOR_A_REC').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat
    else if ((vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS')) and (dataSet.FieldByName('VALOR_A_REC').AsFloat <= 0) then
    begin
      dataSet.FieldByName('VALOR_A_REC').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat;
      dataSet.FieldByName('PRVEN_V').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat;
      dataSet.FieldByName('VALTOT_V').AsFloat := dataSet.FieldByName('VALOR_REAL').AsFloat;
    end;


    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;


function TComFat.checarCombinacaoCFOPCST: boolean;
begin
   Result := False;

   buscas.Close;
   buscas.SQL.Text := ' SELECT * FROM CFOP_CST_ENTRADA ' +
      ' WHERE CFOP = :CFOP AND CST = ' + QuotedStr(Copy(dataSet.FieldByName('CST_V').AsString,2,2))+
      ' and cod_empresa = '+vDadosIni.codEmpresa;
   buscas.ParamByName('CFOP').AsFloat := dataSet.FieldByName('NATOP_V').AsFloat;
   buscas.Open;

   if not buscas.IsEmpty then
    Result := True;
end;

procedure TComFat.checarRegraCfopCST;
var
  vLst: TStrings;
  I: Integer;
begin
  if vDadosIni.getConfSisBool('vei_cfop_st_comando_fat', buscas) then
  begin
      vLst := TStringList.Create;
      vLst := vDadosIni.getConfSisBlob('vei_cfop_st_comando_fat', buscas);
      for I := 0 to vLst.Count - 1 do
      begin
         frmMovVeiculosCCIA.DBEdit29.Enabled := True;
         if vDadosIni.getValue(vLst[i], 2) = dataSet.FieldByName('NATOP_V').AsString then
         begin
           frmMovVeiculosCCIA.DBEdit29.Enabled := trim(vDadosIni.getValue(vLst[i], 1)) <> 'S';
           if trim(dataSet.FieldByName('CST_V').AsString) <> '' then
	           dataSet.FieldByName('CST_V').AsString := Copy(trim(dataSet.FieldByName('CST_V').AsString), 1, 1) + vDadosIni.getValue(vLst[i], 3)
           else
             dataSet.FieldByName('CST_V').AsString := '0' + vDadosIni.getValue(vLst[i], 3);
           Break;
         end;
      end;
  end;
end;

function TComFat.verificaUsodeVeiculosUsados(vtp: integer; pChassi: string= ''): Integer;
var
  vCodigo: Integer;
  vTroca: boolean;
begin
  Result := 1;
  vTroca := false;

  if dataSet.FieldByName('VEICULO_TROCA').AsString <> 'S' then
   exit;

  if vtp = 1 then
  begin
     buscas.Close;
     buscas.SQL.Text := ' select first 1 est.chassi_c, est.codigo, n_comando_troca from est_moto est' +
       ' where est.chassi_c = ' + QuotedStr(pChassi) + ' and (coalesce(est.status_estoque, '''') = ''S'') ' +
       ' and (TRIM(COALESCE(POSICAO, ''VIVO'')) <> ''MORTO'') ' +
       ' and cod_empresa = ' +vDadosIni.codEmpresa+ ' order by est.codigo desc';
     buscas.Open;

     if buscas.IsEmpty then
     begin
       Result := 0;
       exit;
     end
     else if buscas.FieldByName('n_comando_troca').AsInteger > 0 then
     begin
       if (buscas.FieldByName('n_comando_troca').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger) then
       begin
         Application.MessageBox(pchar('Veículo já utilizado na troca!'), 'Atenção', MB_ICONERROR + MB_OK);
         Result := 0;
         exit;
       end;
     end;
     Result := buscas.FieldByName('CODIGO').AsInteger;
  end
  else if vtp = 2 then
  begin
    Result := 0;
    dtSetPlano.First;
    while not dtSetPlano.eof do
    begin
      if (dtSetPlano.FieldByName('Controle').AsString = 'MTUSADAS') then
      begin
       Result := 1;
       vTroca := true;

        if trim(dataSet.FieldByName('STATUS_V').AsString) = 'FECHADO' then
        begin
          buscas.Close;
          buscas.SQL.Text := 'update est_moto set usado_troca = ''S'', ' +
            ' N_COMANDO_TROCA = ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
            ' where codigo = ' +IntToStr(dtSetPlano.FieldByName('COD_ESTMOTO').AsInteger) +
            ' and chassi_c = ' + QuotedStr(dtSetPlano.FieldByName('CHASSIV').AsString) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.ExecSQL;
        end;
      end;
      dtSetPlano.next;
    end;
    dtSetPlano.First;
    if not vTroca then
    begin
      if Application.MessageBox(PChar('Nenhum veículo utilizado na troca foi encontrado no plano de pagamento informado, ' +
        ' o sistema removerá o status de veículo usado na troca.' + #13 +
        'Deseja continuar mesmo assim?'), 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        Result := 1;
        if not (dataSet.state in [dsInsert, dsEdit]) then
          dataset.Edit;
        dataSet.FieldByName('VEICULO_TROCA').AsString := 'N';
      end;
    end;
  end
  else if vtp = 3 then
  begin
    dtSetPlano.First;
    while not dtSetPlano.eof do
    begin
      if (dtSetPlano.FieldByName('Controle').AsString = 'MTUSADAS') then
      begin
        if (dataSet.FieldByName('COD_ESTMOTO').AsInteger = dtSetPlano.FieldByName('COD_ESTMOTO').AsInteger)
        and (trim(dataSet.FieldByName('CHASSIV').AsString) = trim(dtSetPlano.FieldByName('CHASSIV').AsString)) then
        begin
          Result := 0;
          break;
        end;
      end;
      dtSetPlano.next;
    end;
    dtSetPlano.First;

  end;
end;

function TComFat.verificaUsoDoPlanoDePagamento: boolean;
var
  vFormpag2: TComunicacaoFormaPagamento;
  hdFormPag2: THandle;
begin
  Result := True;

  if (vSing.vNatureza <> 'S') then
  begin
    Result := False;
    exit;
  end;

  if not vReceberPeloFinanceiro then
    vReceberPeloFinanceiro := ReceberFinanceiroPeloFinanceiroComFat;

  if not vReceberPeloFinanceiro then
  begin
    Result := False;
    exit;
  end;

  if ((vDadosIni.vEmp.vModoFaturamento <> 'S') or (vDadosIni.vVeic.ReceberPeloFinanceiro))
  	and (vDadosIni.vEmp.vConfFormPagamento = 'PED') then
  begin
    try
      CarregaPacote('pkFormPag', hdFormPag2);
      vFormpag2 := TComunicacaoFormaPagamento.Create;
      vFormpag2.iniciaFormaPagamento(dataSet.FieldByName('N_COMANDO').AsInteger,
        dataSet.FieldByName('CONDPAG_V').AsInteger, 0,
        dataSet.FieldByName('CLIENTES_V').AsInteger,
        dataSet.FieldByName('COVEND_V').AsInteger,
        'MOT', dataSet.FieldByName('VALOR_A_REC').AsCurrency);
    finally
      UnloadPackage(hdFormPag2);
    end;
  end;
end;

function TComFat.consulta: boolean;
var
  I, erro, vcontCTR: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCampoTemp, vCampoTempAd, vCondicaoTmp, vCondicaoTmpAd, vTemp: string;
  vValorTemp: string;
begin
  try
    vsqlAdicional := '';
    vCampoTemp:= '';
    vCampoTempAd := '';

    if not vCons.adicional then
    begin
     vCons.campoAd := '';
     vCons.valorAd := '';
     vCons.condicaoAd := '';
     vCons.porDataAd := false;
     vCons.dataIniAd := '';
     vCons.dataFimAd := '';
    end;

    if vCons.entrada <> vCons.saida then
    begin
      if vCons.entrada then
        vsqlAdicional := vsqlAdicional + ' COM_FAT.NATUREZA = ' + QuotedStr('E')
      else if vCons.saida  then
        vsqlAdicional := vsqlAdicional + ' COM_FAT.NATUREZA = ' + QuotedStr('S');
    end
    else
      vsqlAdicional := vsqlAdicional + ' COM_FAT.NATUREZA IN (' + QuotedStr('E') + ', ' + QuotedStr('S') + ')';

    if (UpperCase(trim(vCons.campo)) = 'OBSERVACAO')
    or (UpperCase(trim(vCons.campoAd)) = 'OBSERVACAO') then
    begin
      if (UpperCase(trim(vCons.campo)) = 'OBSERVACAO') then
      begin
        vCondicaoTmp := vCons.Condicao;
        vValorTemp := vCons.valor;
      end
      else
      begin
        vCondicaoTmp := vCons.condicaoAd;
        vValorTemp := vCons.valorAd;
      end;

      vCampoTemp := 'COM_FAT.OBS1';
      if vCondicaoTmp = 'Igual' then
        vCondicaoTmp := '='
      else if vCondicaoTmp = 'Maior' then
        vCondicaoTmp := '>'
      else if vCondicaoTmp = 'Maior ou Igual' then
        vCondicaoTmp := '>='
      else if vCondicaoTmp = 'Menor' then
        vCondicaoTmp := '<'
      else if vCondicaoTmp = 'Menor ou Igual' then
        vCondicaoTmp := '<='
      else if vCondicaoTmp = 'Diferente' then
        vCondicaoTmp := '<>'
      else if (vCondicaoTmp = 'Esta contido') then
        vCondicaoTmp := 'like'
      else if (vCondicaoTmp = 'Começa') then
        vCondicaoTmp := 'Começa'
      else
        vCondicaoTmp := '=';
      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';


      if vDadosIni.vUsarPlanoVeic = 'S' then
      begin
         buscas.Close;
         if vCondicaoTmp = 'like' then
          buscas.SQL.Text := ' SELECT FIRST 1000 PL.NREQUISICAO FROM PLANO_PAG PL WHERE PL.TPDOCS = ''MOT''' +
            ' AND TRIM(PL.HISTORICO) LIKE ' + QuotedStr('%' + vValorTemp + '%') +
            ' AND PL.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' ORDER BY PL.SEQPLANO DESC '
         else if vCondicaoTmp = 'Começa' then
          buscas.SQL.Text := ' SELECT FIRST 1000 PL.NREQUISICAO FROM PLANO_PAG PL WHERE PL.TPDOCS = ''MOT''' +
            ' AND TRIM(PL.HISTORICO) LIKE ' + QuotedStr(vValorTemp + '%') +
            ' AND PL.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' ORDER BY PL.SEQPLANO DESC '
         else
          buscas.SQL.Text := ' SELECT FIRST 1000 PL.NREQUISICAO FROM PLANO_PAG PL WHERE PL.TPDOCS = ''MOT''' +
            ' AND TRIM(PL.HISTORICO)  ' + vCondicaoTmp + ' ' + QuotedStr(vValorTemp) +
            ' AND PL.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' ORDER BY PL.SEQPLANO DESC ';
          buscas.Open;

          if buscas.IsEmpty then
            vTemp := ',0';
          buscas.First;
          while not buscas.Eof do
          begin
           vTemp := vTemp + ',' + IntToStr(buscas.FieldByName('NREQUISICAO').AsInteger);
           buscas.Next;
          end;

          vsqlAdicional := vsqlAdicional + ' COM_FAT.N_COMANDO IN (' + Copy(vTemp, 2, Length(vTemp)) + ')';
      end
      else
      begin
        if vCondicaoTmp = 'like' then
          vsqlAdicional := vsqlAdicional + ' ( ' +
           ' (TRIM(COM_FAT.OBS1) like ' + QuotedStr('%' + vValorTemp + '%') + ') or ' +
           ' (TRIM(COM_FAT.OBS2) like ' + QuotedStr('%' + vValorTemp + '%') + ') or ' +
           ' (TRIM(COM_FAT.OBS3) like ' + QuotedStr('%' + vValorTemp + '%') + ') or ' +
           ' (TRIM(COM_FAT.OBS4) like ' + QuotedStr('%' + vValorTemp + '%') + ') or ' +
           ' (TRIM(COM_FAT.OBS5) like ' + QuotedStr('%' + vValorTemp + '%') + ') ) '
        else if vCondicaoTmp = 'Começa' then
          vsqlAdicional := vsqlAdicional + ' ( ' +
           ' (TRIM(COM_FAT.OBS1) like ' + QuotedStr(vValorTemp + '%') + ') or ' +
           ' (TRIM(COM_FAT.OBS2) like ' + QuotedStr(vValorTemp + '%') + ') or ' +
           ' (TRIM(COM_FAT.OBS3) like ' + QuotedStr(vValorTemp + '%') + ') or ' +
           ' (TRIM(COM_FAT.OBS4) like ' + QuotedStr(vValorTemp + '%') + ') or ' +
           ' (TRIM(COM_FAT.OBS5) like ' + QuotedStr(vValorTemp + '%') + ') ) '
        else
          vsqlAdicional := vsqlAdicional + ' ( ' +
           ' (TRIM(COM_FAT.OBS1) ' + vCondicaoTmp + ' ' +QuotedStr(vValorTemp) + ') or ' +
           ' (TRIM(COM_FAT.OBS2) ' + vCondicaoTmp + ' ' +QuotedStr(vValorTemp) + ') or ' +
           ' (TRIM(COM_FAT.OBS3) ' + vCondicaoTmp + ' ' +QuotedStr(vValorTemp) + ') or ' +
           ' (TRIM(COM_FAT.OBS4) ' + vCondicaoTmp + ' ' +QuotedStr(vValorTemp) + ') or ' +
           ' (TRIM(COM_FAT.OBS5) ' + vCondicaoTmp + ' ' +QuotedStr(vValorTemp) + ') ) ';
      end;
      if (UpperCase(trim(vCons.campo)) = 'OBSERVACAO') then
      begin
        vCons.valor := '';
        vCons.campo := '';
        vCons.ordem := vCampoTemp;
        vCampoTemp := '';
      end;
      if (UpperCase(trim(vCons.campoAd)) = 'OBSERVACAO') then
      begin
        vCons.valorAd := '';
        vCons.campoAd := '';
//        vCons.ordem := vCampoTemp;
        vCampoTemp := '';
      end;
    end;

    if UpperCase(trim(vCons.campo)) = 'PLACA' then
  		vCampoTemp := 'COM_FAT.PLACAV'
    else if UpperCase(trim(vCons.campo)) =  'CLIENTE' then
      vCampoTemp := 'CL.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'INTERMEDIADOR' then
      vCampoTemp := 'INTER.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'CONCESSIONARIA' then
      vCampoTemp := 'CON.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'CLIENTE VENDEDOR' then
      vCampoTemp := 'CLV.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'VENDEDOR' then
      vCampoTemp := 'COL.NOME_VENDEDOR'
    else if UpperCase(trim(vCons.campo)) =  'GERENTE' then
      vCampoTemp := 'GER.NOME_VENDEDOR'
    else if UpperCase(trim(vCons.campo)) =  'COND PAG' then
      vCampoTemp := 'COND.DESC_COND_PAG'
    else if UpperCase(trim(vCons.campo)) =  'NOME USUARIO FECH' then
    	vCampoTemp := 'USFECH.NOME_VENDEDOR';

    if UpperCase(trim(vCons.campoAd)) = 'PLACA' then
  		vCampoTempAd := 'COM_FAT.PLACAV'
    else if UpperCase(trim(vCons.campoAd)) =  'CLIENTE' then
      vCampoTempAd := 'CL.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'INTERMEDIADOR' then
      vCampoTempAd := 'INTER.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'CONCESSIONARIA' then
      vCampoTempAd := 'CON.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'CLIENTE VENDEDOR' then
      vCampoTempAd := 'CLV.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'VENDEDOR' then
      vCampoTempAd := 'COL.NOME_VENDEDOR'
    else if UpperCase(trim(vCons.campoAd)) =  'GERENTE' then
      vCampoTempAd := 'GER.NOME_VENDEDOR'
    else if UpperCase(trim(vCons.campoAd)) =  'COND PAG' then
      vCampoTempAd := 'COND.DESC_COND_PAG'
    else if UpperCase(trim(vCons.campoAd)) =  'NOME USUARIO FECH' then
    	vCampoTempAd := 'USFECH.NOME_VENDEDOR';

    if Trim(vCampoTemp) <> '' then
    begin
      vCondicaoTmp := vCons.Condicao;
      if vCondicaoTmp = 'Igual' then
        vCondicaoTmp := '='
      else if vCondicaoTmp = 'Maior' then
        vCondicaoTmp := '>'
      else if vCondicaoTmp = 'Maior ou Igual' then
        vCondicaoTmp := '>='
      else if vCondicaoTmp = 'Menor' then
        vCondicaoTmp := '<'
      else if vCondicaoTmp = 'Menor ou Igual' then
        vCondicaoTmp := '<='
      else if vCondicaoTmp = 'Diferente' then
        vCondicaoTmp := '<>'
      else if (vCondicaoTmp = 'Esta contido') then
        vCondicaoTmp := 'like'
      else if (vCondicaoTmp = 'Começa') then
        vCondicaoTmp := 'Começa'
      else
        vCondicaoTmp := '=';
      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmp = 'like' then
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%') + ') ' +
          	' or (' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%');
      end
      else if vCondicaoTmp = 'Começa' then
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%') + ') ' +
          	' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%')
      end
      else
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor))) + ') ' +
          	' or (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))) + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor)));
      end;
      vCons.valor := '';
      vCons.campo := '';
      vCons.ordem := vCampoTemp;
    end;

    if Trim(vCampoTempAd) <> '' then
    begin
      vCondicaoTmpAd := vCons.CondicaoAd;
      if vCondicaoTmpAd = 'Igual' then
        vCondicaoTmpAd := '='
      else if vCondicaoTmpAd = 'Maior' then
        vCondicaoTmpAd := '>'
      else if vCondicaoTmpAd = 'Maior ou Igual' then
        vCondicaoTmpAd := '>='
      else if vCondicaoTmpAd = 'Menor' then
        vCondicaoTmpAd := '<'
      else if vCondicaoTmpAd = 'Menor ou Igual' then
        vCondicaoTmpAd := '<='
      else if vCondicaoTmpAd = 'Diferente' then
        vCondicaoTmpAd := '<>'
      else if (vCondicaoTmpAd = 'Esta contido') then
        vCondicaoTmpAd := 'like'
      else if (vCondicaoTmpAd = 'Começa') then
        vCondicaoTmpAd := 'Começa'
      else
        vCondicaoTmpAd := '=';
      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmpAd = 'like' then
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
          	' or (' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%');
      end
      else if vCondicaoTmpAd = 'Começa' then
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
          	' or (' + vCampoTempAd + ' like ' + QuotedStr(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) + '%') + ')) '
        else
			    vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%');
      end
      else
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd))) + ') ' +
          	' or (' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)))) + ')) ' 
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
      end;
      vCons.valorAd := '';
      vCons.campoAd := '';
    end;

    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
      end;
    end; //porData
    if vCons.adicional then
    begin
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
          erro := erro + 1;
        end;
        if erro = 2 then
        begin
          Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
            'Atenção', MB_OK + MB_ICONINFORMATION);
        end
        else
        begin
          if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
            formatodata := 'mm/dd/yyyy'
          else if pos('.', ShortDateFormat) <> 0 then
            formatodata := 'dd.mm.yyyy';
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end
      else
      begin
        vCons.dataIniAd := '';
        vCons.dataFimAd := '';
      end;

      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';
      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            vCons.campoAd := DataSet.Fields[I].FieldName;
            if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
              ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
            begin
              vCons.condicaoAd := '=';
              if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)
              or (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
              begin
                try
                  if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                    vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)))
                  else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                    vCons.valorAd := FloatToStr(StrToFloat(Trim(vCons.valorAd)))
                except
                  vCons.valorAd := '0';
                  Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
                end;
              end
              else
                vCons.valorAd := vDadosIni.tirapontos(vCons.valorAd, 4);
            end
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
            begin
              if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' >= ' + vCons.dataIniAd + ' and ' +
                  vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
              Break;
            end;
            if vCons.condicaoAd = 'like' then
            begin
            	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
              	vsqlAdicional := vsqlAdicional + ' and ((' + vCons.campoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
                	' or (' + vCons.campoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
              else
              	vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%');
            end
            else if vCons.condicaoAd = 'Começa' then
            begin
            	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
              	vsqlAdicional := vsqlAdicional + ' and ((' + vCons.campoAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
                	' or (' + vCons.campoAd + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
              else
	              vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%')
            end
            else
            begin
            	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
              	vsqlAdicional := vsqlAdicional + ' and ((' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd))) + ') ' +
                	' or (' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)))) + ')) '
              else
	              vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
            end;
            Break;
          end;
        end;
      end;
    end; //adicional

    if vCons.avancada then
    begin
      if vCons.statusAv = 'Abertos' then
        vsqlAdicional := vsqlAdicional + ' and (COALESCE(TRIM(COM_FAT.STATUS_V), '''') = ' + QuotedStr('ABERTO') + ')'
      else if vCons.statusAv = 'Fechados' then
        vsqlAdicional := vsqlAdicional + ' and (COALESCE(TRIM(COM_FAT.STATUS_V), '''') IN (' + QuotedStr('FECHADO') + ',''''))'
      else if vCons.statusAv = 'Cancelados' then
        vsqlAdicional := vsqlAdicional + ' and (COALESCE(TRIM(COM_FAT.STATUS_V), '''') = ' + QuotedStr('CANCELADO') + ')';

      if ((vCons.ctrCompra) and (vCons.ctrEntCons) and (vCons.cftVenda) and (vCons.ctrVnd) and (vCons.ctrVndCons) and (vCons.ctrResDom) and (vCons.ctrInterm) and (vCons.cftTransf) and (vCons.cftDemonst) and (vCons.cftDevo) and (vCons.cftOutrasS) and (vCons.cftAtivo))
        or ((not vCons.ctrCompra) and (not vCons.ctrEntCons) and (not vCons.cftVenda) and (not vCons.ctrVnd) and (not vCons.ctrVndCons) and (not vCons.ctrResDom) and (not vCons.ctrInterm) and (not vCons.cftTransf) and (not vCons.cftDemonst) and (not vCons.cftDevo) and (not vCons.cftOutrasS) and (not vCons.cftAtivo)) then
      else
      begin
        tempTipo := '';
        tempSql := '';
        vcontCTR := 0;
        if vCons.ctrCompra then
        begin
           vcontCTR := vcontCTR + 1;
           tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+  QuotedStr('CTRCOMPRA') +')';
        end;
        if vCons.ctrEntCons then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CTRENTCONS') + ')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.cftVenda then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CFT') + ' AND COM_FAT.TIPV_VEICULO = ''V'')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.ctrVnd then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CTRVND') + ')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.ctrVndCons then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CTRVNDCONS') + ')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.ctrResDom then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CTRRESDOM') + ')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.ctrInterm then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CTRINTERM') + ')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.cftTransf then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CFT') + ' AND COM_FAT.TIPV_VEICULO = ''T'')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.cftDemonst then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CFT') + ' AND COM_FAT.TIPV_VEICULO = ''D'')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.cftAtivo then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CFT') + ' AND COM_FAT.TIPV_VEICULO = ''A'')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.cftDevo then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CFT') + ' AND COM_FAT.TIPV_VEICULO = ''E'')';
          vcontCTR := vcontCTR + 1;
        end;
        if vCons.cftOutrasS then
        begin
          if vcontCTR > 0 then
            tempTipo := tempTipo + ' OR ';
          tempTipo := tempTipo + ' (COALESCE(COM_FAT.MODELO, '''') = '+ QuotedStr('CFT') + ' AND COM_FAT.TIPV_VEICULO = ''O'')';
          vcontCTR := vcontCTR + 1;
        end;

        tempSql := tempSql + ' AND (' + tempTipo + ')';
        vsqlAdicional := vsqlAdicional + tempSql;
      end;
    end; //avancada

    if vCons.porData then
      result := ConsultaCampos('COM_FAT', vCons.campo, vCons.ordem, vCons.dataIni,
        vCons.dataFim, vDadosIni.codEmpresa, 1,
        Fsql_campos,
        Fsql_inner,
        vsqlAdicional)
    else
      result := ConsultaCampos('COM_FAT', vCons.valor, vCons.campo, vCons.condicao,
        vCons.ordem, False, vDadosIni.codEmpresa,
        Fsql_campos,
        Fsql_inner,
        vsqlAdicional);
  finally
    vsqlTemp := dataSet.CommandText;
  end;
end;

constructor TComFat.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsComFat);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
  Rdp := TRdPrint(DtmVeiculosCCIA.RdpCadastros);
  vSing := TSing.Create;
  vSing.vMod := vDadosIni.vtpModeloVeic;
  vNaturezaOp := TNaturezaOp.create;
  vCondPag := TCondPagCCIA.create;
  vColaborador := TLocColaborador.create;
  vGerente := TLocColaborador.create;
  vClienteVendComFat := TLocCliente.create;
  vClienteComFat := TLocCliente.create;
  vIntermediadorComFat := TLocCliente.create;
  vConcessionariaComFat := TLocCliente.create;
  vEstMoto := TEstMotoCCIA.create;
  vModContratos := TModContrato.create;
  vTransfDep := TTransfDepCCIA.create;
  vModVeic := TModVeiculoCCIA.create;

  vClienteComFat.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsClienteComFat);
  vClienteVendComFat.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsFornecedorComFat);
  vIntermediadorComFat.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsIntermediadorComFat);
  vConcessionariaComFat.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsConcessionariaComFat);
  vColaborador.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsColaboradorComFat);
  vGerente.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsGerenteComFat);
  vNaturezaOp.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsCFOPComFat);
  vCondPag.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsCondPagComFat);
  vEstMoto.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsEstMotosComFat);
  vModVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsModVeiculosComFat);

  dtSetPlano := TClientDataSet(DtmVeiculosCCIA.cdsPlanoTempComFat);
  if dtSetPlano.Tag = 0 then
  try
    dtSetPlano.CreateDataSet;
    dtSetPlano.Tag := 22;
  except
  end;

  Fsql_campos := ' COM_FAT.*, CL.NOME_CLIENTE CLIENTE, INTER.NOME_CLIENTE INTERMEDIADOR, ' +
    ' CON.NOME_CLIENTE CONCESSIONARIA, CLV.NOME_CLIENTE CLIENTE_VENDEDOR, ' +
    ' COL.NOME_VENDEDOR VENDEDOR, GER.NOME_VENDEDOR GERENTE, COND.DESC_COND_PAG CONDPAG, ' +
    ' USFECH.NOME_VENDEDOR NOME_US_FECH ';

  Fsql_inner := ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = COM_FAT.CLIENTES_V AND CL.COD_EMPRESA = COM_FAT.COD_EMPRESA ' +
    ' LEFT JOIN CLIENTES INTER ON INTER.COD_CLIENTE = COM_FAT.COD_INTERMED AND INTER.COD_EMPRESA = COM_FAT.COD_EMPRESA ' +
    ' LEFT JOIN CLIENTES CON ON CON.COD_CLIENTE = COM_FAT.COD_CONCESS AND CON.COD_EMPRESA = COM_FAT.COD_EMPRESA ' +
    ' LEFT JOIN CLIENTES CLV ON CLV.COD_CLIENTE = COM_FAT.COD_CLI_VENDE AND CLV.COD_EMPRESA = COM_FAT.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = COM_FAT.COVEND_V AND COL.COD_EMPRESA = COM_FAT.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR GER ON GER.COD_VENDEDOR = COM_FAT.COD_GERENTE AND GER.COD_EMPRESA = COM_FAT.COD_EMPRESA ' +
    ' LEFT JOIN COND_PAG COND ON COND.COD_COND_PAG = COM_FAT.CONDPAG_V ' +
    ' LEFT JOIN COLABORADOR USFECH ON USFECH.COD_VENDEDOR = COM_FAT.COD_US_FECH AND USFECH.COD_EMPRESA = COM_FAT.COD_EMPRESA ';
end;

function TComFat.delete: boolean;
begin

end;

function TComFat.DemonstracaoVeiculo: boolean;
begin
 if trim(vEstMoto.dataSet.FieldByName('STATUS_DEMONST').AsString) = 'S' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select * from com_fat' +
     '  where chassiv = ' + QuotedStr(trim(vEstMoto.dataSet.FieldByName('CHASSI_C').AsString)) +
     ' and cod_estmoto = ' + vEstMoto.dataSet.FieldByName('CODIGO').AsString +
     ' and (tipv_veiculo = ''D'') and cod_empresa =  ' + vDadosIni.codEmpresa + ' and ativo = 1 order by data_ven desc';
    buscas.Open;
    Application.MessageBox(PChar('Demonstração para: ' + trim(dataSet.FieldByName('NOME_RECEB').AsString) + ''), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

destructor TComFat.destroy;
begin
  vNaturezaOp.Free;
  vNaturezaOp := nil;
  vCondPag.Free;
  vCondPag := nil;
  vColaborador.Free;
  vColaborador := nil;
  vGerente.Free;
  vGerente := nil;
  vClienteVendComFat.Free;
  vClienteVendComFat := nil;
  vClienteComFat.Free;
  vClienteComFat := nil;
  vIntermediadorComFat.Free;
  vIntermediadorComFat := nil;
  vConcessionariaComFat.Free;
  vConcessionariaComFat := nil;
  vEstMoto.Free;
  vEstMoto := nil;
  vModContratos.Free;
  vModContratos := nil;
  vTransfDep.Free;
  vTransfDep := nil;
  vModVeic.Free;
  vModVeic := nil;
end;

function TComFat.detalhesFormaDePagamento: boolean;
var
  obFormPag2: TFormPag2;
begin
  try
    if IsEmpty then
    begin
      Result := false;
      exit;
    end;
    if not vDadosIni.PesqPros('VEI079', 'CONSULTAR DETALHES FORMA DE PAGAMENTO', '', 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas, true) then
    begin
      Result := true;
      exit;
    end;
    if ((dataSet.FieldByName('NATUREZA').AsString <> 'S') or (trim(dataSet.FieldByName('MODELO').AsString) = 'CTRINTERM')) then
    begin
      Result := false;
      exit;
    end;

    Result := True;
    obFormPag2 := TFormPag2.Create;
    obFormPag2.detalhamentoVenda(dataSet.FieldByName('N_COMANDO').AsInteger,
      '', 'MOT');
    exit;

  except
    Result := false;
  end;

end;

function TComFat.edit: boolean;
begin
  result := false;

  if dataSet.IsEmpty then
    Exit;

  Result := inherited edit;

  if not result then
    exit;

  if trim(dataSet.FieldByName('MODELO').AsString) = 'CTRRESDOM' then
    dataSet.FieldByName('IMP_DECLARACAO').AsString := 'S'
  else if trim(dataSet.FieldByName('TIPV_VEICULO').AsString) = 'I' then
    dataSet.FieldByName('COD_SERV_INTERM').AsInteger := vDadosIni.vEmp.vCodServInterm;
  vMensDemonst := True;

  vReceberPeloFinanceiro := false;
  vCFOPOld := dataSet.FieldByName('NATOP_V').AsFloat;
  vCodCondPagOld := dataSet.FieldByName('CONDPAG_V').AsInteger;
  vSing.vTipo := trim(dataSet.FieldByName('TIPO').AsString);
  vSing.vNatureza := trim(dataSet.FieldByName('NATUREZA').AsString);
  vSing.vMod := trim(dataSet.FieldByName('MODELO').AsString);
  vSing.vNatureza := trim(dataSet.FieldByName('NATUREZA').AsString);
  vSing.vTipoVenda := trim(dataSet.FieldByName('TIPO_VENDA_V').AsString);
  vSing.vTipoVendaCFOP := trim(dataSet.FieldByName('TIPV_VEICULO').AsString);
  vSing.vAlterarEstoque := trim(dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString);

   if vSing.vMod = 'CTRCOMPRA' then
     vSing.vNomeContrato := 'Contrato de Compra'
   else if vSing.vMod = 'CTRENTCONS' then
     vSing.vNomeContrato := 'Contrato Entrada em Consignação'
   else if vSing.vMod = 'CFT' then
     vSing.vNomeContrato := 'Comando Faturamento'
   else if vSing.vMod = 'CTRVND' then
     vSing.vNomeContrato := 'Contrato de Venda'
   else if vSing.vMod = 'CTRVNDCONS' then
     vSing.vNomeContrato := 'Contrato de Saída para Venda em Consignação'
   else if vSing.vMod = 'CTRRESDOM' then
     vSing.vNomeContrato := 'Contrato Reserva de Domínio'
   else if vSing.vMod = 'CTRINTERM' then
     vSing.vNomeContrato := 'Contrato de Intermediação';

  vColaborador.abreLocVendedor;
  vGerente.abreLocGerente;
  vCondPag.abreCondPag;
  vEstMoto.AbreEstMoto(dataSet.FieldByName('COD_ESTMOTO').AsInteger, dataSet.FieldByName('CHASSIV').AsString);
  if frmMovVeiculosCCIA <> nil then
  abreTipoVendas(frmMovVeiculosCCIA.DBComboBox1);

  vClienteComFat.abreClientes(dataSet.FieldByName('CLIENTES_V').AsInteger);
  vClienteVendComFat.abreClientes(dataSet.FieldByName('COD_CLI_VENDE').AsInteger);
  vColaborador.buscarColaborador(dataSet.FieldByName('COVEND_V').AsInteger);
  vGerente.buscarColaborador(dataSet.FieldByName('COD_GERENTE').AsInteger);
  vIntermediadorComFat.abreClientes(dataSet.FieldByName('COD_INTERMED').AsInteger);
  vConcessionariaComFat.abreClientes(dataSet.FieldByName('COD_CONCESS').AsInteger);
  _abreNatOperacao;
end;

function TComFat.EditarFormPerguntasVeiculo: boolean;
begin
  try
    Result := false;

    if ComFat.dataSet.FieldByName('Natureza').AsString <> 'S' then
    begin
      Application.MessageBox(Pchar('Não é possível Editar dados de Veículos Anteriores, favor selecionar um documento de venda.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;
    abreFormPerguntasVeiculo;
    Result := inherited post;

    if (dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;
    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI082', 'EDITAR', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI082', 'EDITAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas);

//     if Result then
//      Refresh
  except
    on e: exception do
    begin
      Result := false;
      vDadosIni.GravaAuditoria('VEI082', 'EDITAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas);
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TComFat.EmitirNotaFiscalOS: boolean;
begin
  try
    vSair := False;

    if not (dataSet.State in [dsInsert, dsEdit]) then
     dataSet.Edit;
    dataSet.FieldByName('STATUS_V').AsString := 'FECHADO';
    dataSet.FieldByName('TIPV_EST').AsString := vEstMoto.dataSet.FieldByName('TIPV_VEICULO').AsString;
    dataSet.FieldByName('COD_US_FECH').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('DATA_FECH').AsString := DateToStr(vDadosIni.getDataHoraBanco(buscas));
    dataSet.FieldByName('HORA_FECH').AsString := TimeToStr(vDadosIni.getDataHoraBanco(buscas));
    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if (vSing.vNatureza = 'E') then
    begin
      if verificaEnvioNFVeic then
      begin
        frmMovVeiculosCCIA.DBComboBox3.ItemIndex := 0;
        frmMovVeiculosCCIA.DBComboBox4.ItemIndex := 0;
        frmMovVeiculosCCIA.DBComboBox5.ItemIndex := 0;
        frmMovVeiculosCCIA.DBComboBox8.ItemIndex := 0;

         if (Application.MessageBox(pchar('Deseja imprimir ' + vSing.vNomeContrato + '?'), 'Confirmação',  MB_ICONQUESTION + MB_YESNO) = IDYES) then
            abreFormListaContrato;

        if dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0 then
          exit;

        if Application.MessageBox('Deseja entrar com nota fiscal?', 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
          exit;

        MontarNFe(dataSet.FieldByName('N_COMANDO').AsInteger, 'CTR', 'E');
      end;
    end;

    verificaUsodeVeiculosUsados(2);
    
    if verificaEnvioNFVeic then
    begin
       frmMovVeiculosCCIA.DBComboBox3.ItemIndex := 0;
       frmMovVeiculosCCIA.DBComboBox4.ItemIndex := 0;
       frmMovVeiculosCCIA.DBComboBox5.ItemIndex := 0;
       frmMovVeiculosCCIA.DBComboBox8.ItemIndex := 0;

       if vSing.vMod = 'CFT' then
       begin
           if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'T') then
           begin
             if (Application.MessageBox(pchar('Deseja imprimir ' + vSing.vNomeContrato + '?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
               ImprimirComando;

             buscas.Close;
             buscas.SQL.Text := ' SELECT COALESCE(IMP_CONTRATO_VEIC, ''N'') IMP_CONTRATO_VEIC FROM TIPO_VENDAS ' +
              ' WHERE TIPO = ''VEI'' AND ATIVO = 1 AND TIPO_OS = ' + QuotedStr(Trim(dataSet.FieldByName('TIPO_V').AsString));
             buscas.Open;

             if trim(buscas.FieldByName('IMP_CONTRATO_VEIC').AsString) = 'S' then
             begin
               try
                 vDadosIni.vPesquisaChassi := 'IMPCONTRATOS';
                 if (Application.MessageBox(pchar('Deseja imprimir Contrato?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
                   frmMovVeiculosCCIA.BitBtn52.Click;
               finally
                 vDadosIni.vPesquisaChassi := '';
               end;
             end;
           end
       end
       else
       begin
//         if (trim(dataset.FieldByName('MODELO').AsString) <> 'CTRVNDCONS') then
           if (Application.MessageBox(pchar('Deseja imprimir ' + vSing.vNomeContrato + '?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
             abreFormListaContrato;
       end;

       if (vDadosIni.vEmp.vModoFaturamento <> 'S') then
       begin
         if dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0 then
         	 MontarNFe(dataSet.FieldByName('N_COMANDO').AsInteger, 'CXL', 'S');
       end
       else
       begin
       	 if not vReceberPeloFinanceiro then
		     	 vReceberPeloFinanceiro := ReceberFinanceiroPeloFinanceiroComFat;

         if vReceberPeloFinanceiro then
           if dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0 then
             MontarNFe(dataSet.FieldByName('N_COMANDO').AsInteger, 'CXL', 'S');
       end;
    end
    else
    begin
      if vSair then
        exit;

      BaixarVeicIntermed;
    end;
  except
    on E: Exception do
    begin
      result := false;
      if inibeErro <> 'S' then
        Application.MessageBox(PChar('Erro ao Emitir Nota Fiscal Veículo.'), 'Atenção', MB_ICONWARNING + MB_OK);
      inibeErro := 'N';
      registraErro('E0007 ' + e.Message);
      RollBackTransacao;
      exit;
    end;
  end;
end;

function TComFat.ConfirmarComando: Boolean;
var
  DBEditChassi: string;
begin
  try
    Result := True;

    if not verificaFechamento(1) then
    begin
     Application.MessageBox(Pchar(vSing.vNomeContrato + ' não se encontra aberto no momento!'), 'Informação', MB_OK + MB_ICONINFORMATION);
     if (dataSet.State in [dsEdit, dsInsert]) then
       Cancel;
     RollBackTransacao;
     Result := false;
     exit;
    end;

    if Application.MessageBox(pchar('Deseja Confirmar ' + vSing.vNomeContrato + '?'), 'Confirmação', MB_ICONQUESTION +  MB_YESNO) = IDNO then
    begin
      vEstMoto.setarDadosComando(ComFat);
      if (vSing.vMod = 'CTRVNDCONS') then
        if (Application.MessageBox(pchar('Deseja imprimir ' + vSing.vNomeContrato + '?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
         abreFormListaContrato;
     if (dataSet.State in [dsEdit, dsInsert]) then
       Cancel;
      Result := CommitaTransacao;
      Result := false;
      Exit;
    end;

    if not _VerificarEstoqueVeiculo(buscas, 1) then
    begin
      vEstMoto.setarDadosComando(ComFat);
      if (dataSet.State in [dsEdit, dsInsert]) then
       Cancel;
      Result := CommitaTransacao;  
      Result := false;
      exit;
    end;

    EmitirNotaFiscalOS;
  except
    on E: Exception do
    begin
      if (dataSet.State in [dsEdit, dsInsert]) then
       Cancel;
      result := false;
      if inibeErro <> 'S' then
        Application.MessageBox(PChar('Erro ao Confirmar '+ vSing.vNomeContrato), 'Atenção', MB_ICONWARNING + MB_OK);
      inibeErro := 'N';
      registraErro('E0007 ' + e.Message);
      RollBackTransacao;
      exit;
    end;
  end;
end;

function TComFat.ConfirmarRetornoDemonst: Boolean;
begin
  Result := true;

  if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'D') and (dataSet.FieldByName('NATUREZA').AsString ='S') then
  begin
    buscas.Close;
    buscas.SQL.Text := ' select CPFCGC from clientes where COD_CLIENTE = :COD_CLIENTE ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
    buscas.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('CLIENTES_V').AsInteger;
    buscas.Open;

    if trim(buscas.FieldByName('CPFCGC').AsString) <> trim(vDadosIni.vEmp.vCNPJ) then
    begin
      Application.MessageBox('Demonstração precisa de nota fiscal de entrada, a nota fiscal está em nome de outra empresa!', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if not vDadosIni.PesqPros('VEI099', 'PERMITIR', dataset.FieldByName('chassiv').asstring, 'COM_FAT', dataset.FieldByName('n_comando').asstring,  Buscas, true) then
      begin
        Result := False;
        exit;
      end;
    end;
    if Application.MessageBox('Confirma Devolução do Veículo?',
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      Edit;
      dataSet.FieldByName('SITUACAO').AsString := 'RETORNADO';
      dataSet.FieldByName('DTSITUACAO').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.Post;

      buscas.Close;
      buscas.SQL.Text := ' UPDATE EST_MOTO SET SITUACAO = :SITUACAO, STATUS_DEMONST = :STATUS_DEMONST ' +
        ' WHERE CODIGO = :CODIGO AND CHASSI_C = :CHASSI_C AND COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('COD_ESTMOTO').AsInteger;
      buscas.ParamByName('CHASSI_C').AsString := dataSet.FieldByName('CHASSIV').AsString;
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ParamByName('SITUACAO').AsString := '';
      buscas.ParamByName('STATUS_DEMONST').AsString := 'N';
      buscas.Prepare;
      buscas.ExecSQL;

      if (dataSet.ChangeCount = 0) then
       Result := True
      else
       Result := Apply;
      if result then
        result := CommitaTransacao;
      if Result then
        vDadosIni.GravaAuditoria('VEI095', 'CONFIRMAR RETORNO', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas)
      else
        vDadosIni.GravaAuditoria('VEI095', 'CONFIRMAR RETORNO', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas);
    end;
  end
  else
   Application.MessageBox('Nota Fiscal não é de Retorno em Demonstração!', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
end;

procedure TComFat.CalcularRedLucro;
begin
 if dataSet.FieldByName('COD_ESTMOTO').AsInteger <= 0 then
    exit;

 if vEstMoto.dataSet.FieldByName('CODIGO').AsInteger <= 0 then
    exit;

 if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
    exit;

 if vEstMoto.dataSet.FieldByName('STATUS_USO').AsString <> 'N' then
 begin
   dataSet.FieldByName('PERC_RED_V').AsFloat := vEstMoto.dataSet.fieldbyname('PERC_RED').AsFloat;
   if vEstMoto.dataSet.FieldByName('RED_LUCRO').AsString = 'S' then
   begin
     if vEstMoto.dataSet.FieldByName('PRECO_CUSTO').AsCurrency > 0  then
       dataSet.FieldByName('BASE_ICM_V').AsFloat := (((dataSet.FieldByName('PRVEN_V').AsFloat - vEstMoto.dataSet.FieldByName('PRECO_CUSTO').AsCurrency) * dataSet.FieldByName('PERC_RED_V').AsFloat) / 100)
     else
       dataSet.FieldByName('BASE_ICM_V').AsFloat := (((dataSet.FieldByName('PRVEN_V').AsFloat - vEstMoto.dataSet.FieldByName('VL_COMPRA').AsCurrency) * dataSet.FieldByName('PERC_RED_V').AsFloat) / 100);
     if dataSet.FieldByName('BASE_ICM_V').AsFloat <= 0 then
     begin
       dataSet.FieldByName('BASE_ICM_V').AsFloat := 0;
       dataSet.FieldByName('PERC_RED_V').AsFloat := 0;
     end;
     dataSet.FieldByName('ICMS_V').AsFloat := ((dataSet.FieldByName('BASE_ICM_V').AsFloat * dataSet.FieldByName('ALICM_V').AsFloat) / 100);
   end
   else
   begin
     dataSet.FieldByName('BASE_ICM_V').AsFloat := ((dataSet.FieldByName('PRVEN_V').AsFloat * dataSet.FieldByName('PERC_RED_V').AsFloat) / 100);
     if dataSet.FieldByName('BASE_ICM_V').AsFloat <= 0 then
     begin
       dataSet.FieldByName('BASE_ICM_V').AsFloat := 0;
       dataSet.FieldByName('PERC_RED_V').AsFloat := 0;
     end;
     dataSet.FieldByName('ICMS_V').AsFloat := ((dataSet.FieldByName('BASE_ICM_V').AsFloat * dataSet.FieldByName('ALICM_V').AsFloat) / 100);
   end;
 end;
end;

function TComFat.CancelarComando: boolean;
var
  vNf: TNfCab;
  obFp: TFormPag2;
  vCodProcesso: string;
  vStatusV: string;

  function CancelarContratoComando(vComando: Integer): boolean;
  begin
    Result := False;

    if not ((dataSet.FieldByName('DIA_CXL').isnull) or (trim(dataSet.FieldByName('DIA_CXL').AsString) = '')) then
    begin
      Application.MessageBox('Documento já Recebido Pelo Caixa da Loja', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);

      if not vDadosIni.PesqPros('VEI086', 'PERMITIR', 'CANCELAMENTO NF RECEBIDA', 'COM_FAT', dataSet.FieldByName('n_comando').AsString,
        buscas, true) then
        exit;

      if Application.MessageBox('Deseja realmente excluir o recebimento?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idyes then
      begin
        buscas.Close;
        buscas.SQL.Text := ' update com_fat set status_cxl_rq = null, dia_cxl = null ' +
          ' where n_comando= ' + dataSet.FieldByName('N_COMANDO').AsString + ' and ativo=1 and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;
        CommitaTransacao;
      end;
      exit;
    end;
    
    if not (dataSet.State in [dsInsert, dsEdit]) then
      dataSet.Edit;
    vStatusV := trim(dataSet.FieldByName('STATUS_V').AsString);
    dataSet.FieldByName('STATUS_V').AsString := 'CANCELADO';
    dataSet.Post;
    vEstMoto.setarDadosComando(ComFat, 2, vStatusV);
    if (dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;
    if result then
      result := CommitaTransacao;
    try
      if (result) and (dataSet.FieldByName('NATUREZA').AsString = 'S') then
      begin
        obFp := TFormPag2.create;
        obFp.cancelaVenda(vComando, 'MOT');
      end;
    finally
      if (result) and (dataSet.FieldByName('NATUREZA').AsString = 'S') then
        obFp.Free;
    end;
  end;
begin
  try
    if trim(dataSet.FieldByName('MODELO').AsString) = 'CTRCOMPRA' then
      vCodProcesso := 'VEI049'
    else if trim(dataSet.FieldByName('MODELO').AsString) = 'CTRENTCONS' then
      vCodProcesso := 'VEI050'
    else if trim(dataSet.FieldByName('MODELO').AsString) = 'CFT' then
      vCodProcesso := 'VEI051'
    else if trim(dataSet.FieldByName('MODELO').AsString) = 'CTRVND' then
      vCodProcesso := 'VEI052'
    else if trim(dataSet.FieldByName('MODELO').AsString) = 'CTRVNDCONS' then
      vCodProcesso := 'VEI053'
    else if trim(dataSet.FieldByName('MODELO').AsString) = 'CTRRESDOM' then
      vCodProcesso := 'VEI054'
    else if trim(dataSet.FieldByName('MODELO').AsString) = 'CTRINTERM' then
      vCodProcesso := 'VEI055';

    if not vDadosIni.PesqPros(vCodProcesso, 'CANCELAR', 'CHASSI - ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT',
      dataSet.FieldByName('N_COMANDO').AsString, buscas, true) then
      exit;

    if not (dataSet.State in [dsInsert, dsEdit]) then
       Edit;

    if not verificaFechamento(3) then
    begin
      Application.MessageBox(Pchar(vSing.vNomeContrato + ' se encontra cancelado no momento!'), 'Informação', MB_OK + MB_ICONINFORMATION);
      Result := false;
      exit;
    end;

     if Application.MessageBox(pchar('Deseja Cancelar ' + vSing.vNomeContrato + '?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
       exit;

      GravarCodNFdatasetTemp;

     if dataSet.FieldByName('NATUREZA').AsString = 'E' then
     begin
         if (dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0) then
         begin
           if Application.MessageBox(PChar(vSing.vNomeContrato + ' possui Nota Fiscal. Deseja consultar a nota e efetuar o Cancelamento ou a exclusão?'),
             'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
           begin
             if not vDadosIni.PesqPros('VEI071', 'PERMITIR', 'CHASSI - ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString,
               DtmVeiculosCCIA.qrBuscasV, true) then
               exit;

             CancelarContratoComando(dataSet.FieldByName('N_COMANDO').AsInteger);
           end
           else
           begin
            try
              Screen.Cursor := crHourGlass;

              if dataSet.IsEmpty then
               exit;

              if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
              begin
                vNf := TNFCab.create;
                vNf.cadAbrirNfIntegracaoCanc(dataSet.FieldByName('COD_NF').AsInteger);
              end;
            finally
               vNf.Free;
               vDadosIni.fechaStatusProcessamento;
               vDadosIni.vNomeForm := '';
               Screen.Cursor := crDefault;
            end;
           end;
         end;
     end;

    if dataSet.FieldByName('NATUREZA').AsString <> 'S' then
      exit;

    if ((dataSet.FieldByName('CONFUS').AsString = 'S') and (dataSet.FieldByName('NUM_NOTA_V').IsNull))
    	or ((dataSet.FieldByName('COD_NF').AsInteger <= 0) and (dataSet.FieldByName('NUM_NOTA_V').AsInteger <= 0)) then
      	CancelarContratoComando(dataSet.FieldByName('N_COMANDO').AsInteger)
    else
    begin
        if not vDadosIni.PesqPros('VEI087', 'PERMITIR', '', 'COM_FAT', '',
          buscas, true) then
         exit;

        if (dataSet.FieldByName('COD_NF').AsInteger <= 0) and (dataSet.FieldByName('NUM_NOTA_V').AsInteger > 0) then
        begin
          Application.MessageBox('Nota Fiscal não gerada, favor reabrir o documento ou gerar a Nota Fiscal para continuar com o cancelamento!', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
          exit;
        end
        else
        begin
          Application.MessageBox('Será aberto o módulo de Nota Fiscal. Faça a consulta da nota e efetue o Cancelamento!',
           'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);

          try
            Screen.Cursor := crHourGlass;

            if dataSet.IsEmpty then
             exit;

            if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
            begin
              vNf := TNFCab.create;
              vNf.cadAbrirNfIntegracaoCanc(dataSet.FieldByName('COD_NF').AsInteger);
            end;
          finally
             vNf.Free;
             vDadosIni.fechaStatusProcessamento;
             vDadosIni.vNomeForm := '';
             Screen.Cursor := crDefault;
          end;
        end;
     end;

  //  if (trim(dataSet.FieldByName('MODELO_NF').AsString) = '55') and (trim(dataSet.FieldByName('SITUACAO_NFE').AsString) <> 'Inutilizada') and
  //    (trim(dataSet.FieldByName('SITUACAO_NFE').AsString) <> 'Cancelada') then
  //  begin
  //    if not ((dataSet.FieldByName('CONFUS').AsString = 'S') and (dataSet.FieldByName('NUM_NOTA_V').IsNull)) then
  //    begin
  //      if not EnviarNFeHW('N', Pchar(vDadosIni.vBancoHW),strtoint(vDadosIni.CodEmpresa),'4.0', dataSet.FieldByName('NUM_NOTA_V').AsInteger,'COM_FAT','3',
  //       Pchar(dataSet.FieldByName('SUB_SERIE').AsString), Pchar(vDadosIni.vNomeUsuario)) then
  //      begin
  //        Application.MessageBox('Nota Fiscal não cancelada no Web Service', 'Informação', MB_OK + MB_ICONINFORMATION +
  //          MB_DEFBUTTON1);
  //        exit;
  //        end;
  //    end;
  //  end;
  finally
     if (dataSet.State in [dsInsert, dsEdit]) then
       dataSet.Cancel;
  end;

end;

function TComFat.ExisteEquipamento: Integer;
begin
  buscas.Close;
  buscas.SQL.Text := ' SELECT COD_EQUIP FROM EQUIPAMENTO ' +
    ' WHERE COD_ESTMOTO = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := buscas.FieldByName('COD_EQUIP').AsInteger;
end;

function TComFat.existeNotaFiscalDeEntrada(pCodNF: Integer): boolean;
var
 buscas2: TIBQuery;
begin
  try
   Result := False;

   buscas2 := TIBQuery.Create(Application);
   buscas2.Database := buscas.Database;
   buscas2.Transaction := buscas.Transaction;


   if dataSet.FieldByName('NATUREZA').AsString <> 'E' then
    exit;

//   if not (pCodNF <> dataSet.FieldByName('COD_NF').AsInteger) then
//    exit;

   buscas.Close;
   buscas.SQL.Text := ' select nfi.chassi, nfv.tprest, nfi.valor_total, nfi.altera_estoque_cfop, nfi.tipv_veiculo, nfi.codigo_nop, nf.* from notafiscal nf ' +
    ' inner join notafiscal_item nfi on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa ' +
    ' inner join notafiscal_item_veiculo nfv on nfi.cod_nf = nfv.cod_nf and nfi.nitem = nfv.nitem and nf.cod_empresa = nfv.cod_empresa ' +
    ' where nf.cod_nf = ' + IntToStr(pCodNF) + ' and nf.natureza_nf = ''E'' and nf.tipo_nf = ''V''' +
    ' and nfi.chassi = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
    ' and nfi.cod_estmoto = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
    ' and nfi.tipv_veiculo = ' + QuotedStr(dataSet.FieldByName('TIPV_VEICULO').AsString) +
    ' and coalesce(nf.status, '''') = ''Fechada'' ' +
    ' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by nf.cod_nf desc';
   buscas.Open;

   if buscas.IsEmpty then
   begin
     buscas2.Close;
     buscas2.SQL.Text := ' select est.codigo from est_moto est ' +
      ' where est.chassi_c = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
      ' and est.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by est.codigo desc ';
     buscas2.Open;
     buscas2.FetchAll;

     buscas2.First;
     while not buscas2.Eof do
     begin
       buscas.Close;
       buscas.SQL.Text := ' select nfi.chassi, nfv.tprest, nfi.valor_total, nfi.altera_estoque_cfop, nfi.tipv_veiculo, nfi.codigo_nop, nf.* from notafiscal nf ' +
        ' inner join notafiscal_item nfi on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa ' +
        ' inner join notafiscal_item_veiculo nfv on nfi.cod_nf = nfv.cod_nf and nfi.nitem = nfv.nitem and nf.cod_empresa = nfv.cod_empresa ' +
        ' where nf.natureza_nf = ''E'' and nf.tipo_nf = ''V''' +
        ' and nfi.chassi = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
        ' and nfi.cod_estmoto = ' + IntToStr(buscas2.FieldByName('CODIGO').AsInteger) +
        ' and nfi.tipv_veiculo = ' + QuotedStr(dataSet.FieldByName('TIPV_VEICULO').AsString) +
        ' and coalesce(nf.status, '''') = ''Fechada'' ' +
        ' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' order by nf.cod_nf desc';
       buscas.Open;

       if not buscas.IsEmpty then
        break;

       buscas2.Next;
     end;
   end;

//   if (buscas.FieldByName('TIPV_VEICULO').AsString <> dataSet.FieldByName('TIPV_VEICULO').AsString) then
//     exit;

   Result := not buscas.IsEmpty;

   if Result then
     if (dataSet.FieldByName('NUM_NOTA_V').AsInteger <> buscas.FieldByName('NUM_NF').AsInteger) then
     begin
       if dataSet.State = dsInsert then
       begin
         frmMovVeiculosCCIA.DBEdit41.Enabled := false;
         Application.MessageBox(PChar('Os dados da Nota Fiscal Nº ' + InttoStr(buscas.FieldByName('NUM_NF').AsInteger) +
         ' anexados no ' + trim(vSing.vNomeContrato) +'!'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         dataSet.FieldByName('COD_NF').AsInteger := buscas.FieldByName('COD_NF').AsInteger;
         dataSet.FieldByName('NUM_NOTA_V').AsInteger := buscas.FieldByName('NUM_NF').AsInteger;
         dataSet.FieldByName('SERIE').AsString := buscas.FieldByName('SERIE').AsString;
         dataSet.FieldByName('SUB_SERIE').AsInteger := buscas.FieldByName('SERIE').AsInteger;
         dataSet.FieldByName('MODELO_NF').AsString := buscas.FieldByName('MODELO_NF').AsString;
         dataSet.FieldByName('DATA_AUTORIZACAO').AsString := buscas.FieldByName('DATA_AUTORIZACAO').AsString;
         dataSet.FieldByName('SITUACAO_NFE').AsString := buscas.FieldByName('SITUACAO_NFE').AsString;
         dataSet.FieldByName('DIGEST').AsString := buscas.FieldByName('DIGEST').AsString;
         dataSet.FieldByName('PROTOCOLO').AsString := buscas.FieldByName('PROTOCOLO').AsString;
         dataSet.FieldByName('CODIGOERRO').AsString := buscas.FieldByName('CODIGOERRO').AsString;
         dataSet.FieldByName('DESCRICAOERRO').AsString := buscas.FieldByName('DESCRICAOERRO').AsString;
         dataSet.FieldByName('HORA_ENVIO').AsString := buscas.FieldByName('HORA_ENVIO').AsString;
         dataSet.FieldByName('TIPONFE').AsString := buscas.FieldByName('TIPONFE').AsString;
         dataSet.FieldByName('TEMPORESPOSTA').AsString := buscas.FieldByName('TEMPORESPOSTA').AsString;
         dataSet.FieldByName('DATAHORA_ENVIO').AsString := buscas.FieldByName('DATAHORA_ENVIO').AsString;
         dataSet.FieldByName('CHAVE_NFE').AsString := buscas.FieldByName('CHAVE_NFE').AsString;
         dataSet.FieldByName('SEL_NFE').AsString := buscas.FieldByName('SEL_NFE').AsString;
         dataSet.FieldByName('RESULTADO_ENVIO').AsString := buscas.FieldByName('RESULTADO_ENVIO').AsString;
         dataSet.Fieldbyname('VALOR_REAL').AsFloat := buscas.Fieldbyname('VALOR_TOTAL').AsFloat;
         dataSet.FieldByName('VALTOT_V').AsFloat := buscas.FieldByName('VALOR_TOTAL').AsFloat;
//         dataSet.FieldByName('CLIENTES_V').AsInteger := buscas.FieldByName('COD_CLIENTE').AsInteger;
         dataSet.FieldByName('COD_CLI_VENDE').AsInteger := buscas.FieldByName('COD_CLIENTE').AsInteger;
         dataSet.FieldByName('NATOP_V').AsFloat := buscas.Fieldbyname('CODIGO_NOP').AsFloat;
         dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := buscas.Fieldbyname('ALTERA_ESTOQUE_CFOP').AsString;
         dataSet.FieldByName('DESC_NATOP').AsString := copy(trim(buscas.FieldByName('DESC_NATOP').AsString), 1, 40);
         dataSet.FieldByName('CONDPAG_V').AsInteger := buscas.FieldByName('COD_COND_PAG').AsInteger;
         dataSet.FieldByName('INF_CORPO_V').AsString := buscas.FieldByName('INF_CORPO_V').AsString;
         dataSet.FieldByName('OBS_V').AsString := buscas.FieldByName('OBS').AsString;
         dataSet.FieldByName('TPREST').AsString := buscas.FieldByName('TPREST').AsString;
         dataSet.FieldByName('TIPO_V').AsString := 'AV';
       end;
     end;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TComFat.gerarnfVenda: boolean;
begin
  if (dataSet.State <> dsEdit) then
    dataSet.Edit;

  if not vReceberPeloFinanceiro then
  	vReceberPeloFinanceiro := ReceberFinanceiroPeloFinanceiroComFat;

  if ((vDadosIni.vEmp.vModoFaturamento = 'N') or (vReceberPeloFinanceiro))
  	and (trim(dataset.FieldByName('TIPV_VEICULO').AsString) <> 'I')
    and (trim(dataset.FieldByName('NATUREZA').AsString) = 'S')
    and (dataSet.fieldbyname('NUM_NOTA_V').IsNull) then
  begin
    if tentarSCAN then
    begin
      dataset.fieldbyname('NUM_NOTA_V').AsInteger := Gencodigo('NF_VENDASCAN', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
      dataset.FieldByName('SERIE').AsString := IntToStr(vDadosIni.vEmp.vNfe.serieScan);
      dataset.FieldByName('SUB_SERIE').AsInteger := StrToIntDef(dataset.FieldByName('SERIE').AsString, 0);
      dataset.FieldByName('MODELO_NF').AsString := vDadosIni.vEmp.vNfe.modeloNF;
      dataSet.FieldByName('TIPONFE').AsString := 'SCAN';
      dataSet.FieldByName('EMISSAO_PROPRIA').AsString := 'S';
    end
    else
    begin
     dataset.fieldbyname('NUM_NOTA_V').AsInteger := Gencodigo('NF_VENDA' + IfThen(vDadosIni.vEmp.vNfe.webServiceAmbiente <> 'Produção', '_HOM'),
                                                              DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
     vDadosIni.hw_registra_estatistica('NOTAFISCAL');
     dataset.FieldByName('SERIE').AsString := IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal);
     dataset.FieldByName('SUB_SERIE').AsInteger := StrToIntDef(dataset.FieldByName('SERIE').AsString, 0);
     dataset.FieldByName('MODELO_NF').AsString := vDadosIni.vEmp.vNfe.modeloNF;
     dataSet.FieldByName('EMISSAO_PROPRIA').AsString := 'S';
    end;
  end;
  dataSet.post;

  if (dataSet.ChangeCount = 0) then
    Result := True
  else
    Result := Apply;
end;

function TComFat.getTipoVenda: string;
begin
  Result := vSing.vMod;
end;

procedure TComFat.GravarCodNFdatasetTemp;
begin
   vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
   vDadosIni.vDtSetTmp.Close;
   vDadosIni.vDtSetTmp.FieldDefs.Clear;
   vDadosIni.vDtSetTmp.FieldDefs.Add('COD_NF', ftInteger, 0, false);

   if vDadosIni.vDtSetTmp.Tag = 0 then
   try
     vDadosIni.vDtSetTmp.CreateDataSet;
     vDadosIni.vDtSetTmp.Tag := 1;
   except
   end;

  vDadosIni.vDtSetTmp.EmptyDataSet;
  vDadosIni.vDtSetTmp.Insert;
  vDadosIni.vDtSetTmp.FieldByName('COD_NF').AsInteger := dataSet.FieldByName('COD_NF').AsInteger;
  vDadosIni.vDtSetTmp.Post;
end;

function TComFat.ImprimirComando: boolean;
var
  linha: integer;
begin
  try
    Result := false;

    linha := 1;
    //if (dataSet.FieldByName('NATOP_V').AsFloat = 5409) or (dataSet.FieldByName('NATOP_V').AsFloat = 6409) then
    if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
    begin
      if Application.MessageBox('Não precisa ser emitido comando para transferência.' + #13 +
        'Tem certeza que deseja emitir este comando?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
        exit;
    end;
    if not vDadosIni.ModImp(Rdp) then
      exit;
    Rdp.FonteTamanhoPadrao := S10cpp;
    Rdp.OnSendMail :=nil;
    vDadosIni._LimparVarSendEmail;
    vDadosini.CodClienteSendEmail := DataSet.FieldByName('CLIENTES_V').AsInteger;
    vDadosini.OrigemEnvSendEmail := cPropostaVeic;
    vDadosini.NDocSendEmail := IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger);
    vDadosini.TipoDocSendEmail := vDadosIni.IfThen(dataSet.FieldByName('TIPO').AsString = 'CFT', 'COMANDO', 'CONTRATO');
    Rdp.OnSendMail := vDadosini._SendMailRdPrint;
    Rdp.TamanhoQteColunas := 80;
    Rdp.CaptionSetup := 'Configurações de Impressão';
    rdp.OpcoesPreview.CaptionPreview := 'Comando de Faturamento';
    rdp.TitulodoRelatorio := 'Comando de Faturamento';
    vDadosIni._LimparVarSendEmail;
    rdp.OnSendMail := vDadosini._SendMailRdPrint;
    rdp.OpcoesPreview.Preview := true;

    try
      Screen.Cursor := crHourGlass;
      variavel_parar := false;
    finally
      Screen.Cursor := crDefault;
    end;

    if not Rdp.EstaAberto then
      Rdp.Abrir;
//  CabNovaPagina; //cabeçalho

    linha := linha + 2;
    //if (dataSet.FieldByName('NATOP_V').AsFloat = 5409) or (dataSet.FieldByName('NATOP_V').AsFloat = 6409) then
    if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
      Rdp.ImpF(linha, 1, 'COMANDO DE FATURAMENTO - TRANSFERENCIA DE VEICULO', [negrito])
    else
      Rdp.ImpF(linha, 1, 'COMANDO DE FATURAMENTO', [negrito]);
    Rdp.ImpF(linha, 65, 'NUMERO: ' + vDadosIni.StrZero(dataSet.FieldByName('N_COMANDO').AsString, 6), [negrito]);
    linha := linha + 1;

   if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') then
   begin
      buscas.Close;
      buscas.SQL.Text := ' Select n_comando, data_ven from com_fat ' +
       ' where chassiv = :chassiv and tipv_veiculo = ''D'' ' +
       ' and (coalesce(trim(upper(status_v)), '''') = ''FECHADO'') ' +
       ' and COD_EMPRESA = :COD_EMPRESA and ATIVO = 1 order by data_ven, n_comando desc ';
      buscas.ParamByName('CHASSIV').AsString := dataSet.FieldByName('CHASSIV').AsString;
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

      if not buscas.IsEmpty then
         Rdp.ImpF(linha, 1, 'ULTIMA DEMO. VEICULO COMANDO: ' + vDadosIni.strzero(buscas.fieldbyname('n_comando').asstring, 6) +
        ' DE ' + buscas.fieldbyname('data_ven').asstring, [negrito]);
      buscas.close;
   end;
    Rdp.ImpF(linha, 62, 'DATA.: ' + dataSet.FieldByName('DATA_VEN').asstring, [negrito]);
    linha := linha + 1;
    Rdp.Imp(linha, 1, vDadosIni.Replicate('_', 80));
    linha := linha + 2;
    Rdp.Impc(linha, 40, '+---------------------------+', [normal]);
    linha := linha + 1;
    Rdp.Impc(linha, 40, '| IDENTIFICACAO DO CLIENTE |', [normal]);
    linha := linha + 1;
    Rdp.Impc(linha, 40, '+---------------------------+', [normal]);
    linha := linha + 2;
    Rdp.Imp(linha, 1, 'Nome....: ' + vClienteComFat.dataSet.FieldByName('NOME_CLIENTE').AsString);
    linha := linha + 1;
    Rdp.Imp(linha, 1, 'Endereco: ' + vClienteComFat.dataSet.FieldByName('ENDERECO').AsString + ' N.:' + vClienteComFat.dataSet.FieldByName('NUM_END_CLIENTE').AsString + ' ' + vClienteComFat.dataSet.FieldByName('complemento').asstring);
    Rdp.Imp(linha, 43, 'Bairro..: ' + vClienteComFat.dataSet.FieldByName('BAIRRO').AsString);
    linha := linha + 1;
    Rdp.Imp(linha, 1, 'Cidade..: ' + vClienteComFat.dataSet.FieldByName('CIDADE').asstring);
    buscas.Close;
    buscas.SQL.Text := ' select sigla_uf from estados where codigo_uf= ' + IntToStr(vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) + '';
    buscas.Open;
    buscas.FetchAll;
    Rdp.Imp(linha, 43, 'Uf......: ' + buscas.FieldByName('sigla_uf').asstring);
    Rdp.Imp(linha, 61, 'Cep: ' + vClienteComFat.dataSet.FieldByName('CEP').asstring);
    linha := linha + 1;
    Rdp.Imp(linha, 1, 'Tel.Res.: ' + vClienteComFat.dataSet.FieldByName('FONE_CLIENTE').AsString);
    Rdp.Imp(linha, 43, 'Tel.Com.: ' + vClienteComFat.dataSet.FieldByName('FONE_TRAB').AsString);
    linha := linha + 1;
    Rdp.Imp(linha, 1, 'CPF/CNPJ: ' + vClienteComFat.dataSet.FieldByName('CPFCGC').AsString);
    Rdp.Imp(linha, 43, 'RG(I.E): ' + vClienteComFat.dataSet.FieldByName('RG').AsString);
    linha := linha + 1;
    Rdp.Imp(linha, 1, 'Dt.Nasc.: ' + vClienteComFat.dataSet.FieldByName('DATA_NASC').AsString);
    Rdp.Impf(linha, 43, 'Vendedor.: ' + dataSet.FieldByName('NOME_RECEB').AsString, [negrito]);
    linha := linha + 1;
    Rdp.Imp(linha, 1, vDadosIni.Replicate('_', 80));
    linha := linha + 1;
    Rdp.Impc(linha, 40, '+---------------------------+', [normal]);
    linha := linha + 1;
    Rdp.Impc(linha, 40, '| IDENTIFICACAO DO PRODUTO |', [normal]);
    linha := linha + 1;
    Rdp.Impc(linha, 40, '+---------------------------+', [normal]);
    linha := linha + 1;
    if dataSet.FieldByName('TIPO_VENDA_V').AsString = 'N' then
    begin
      if vEstMoto.dataSet.fieldByName('ESTOQUE').asstring = 'C' then
        Rdp.Impc(linha, 40, 'Produto: NOVO - CONCESSIONARIAS', [negrito])
      else
        Rdp.Impc(linha, 40, 'Produto: NOVO', [negrito]);
      linha := linha + 2;
      if not vEstMoto.dataSet.isempty then
      begin
        Rdp.Imp(linha, 1, 'Veículo : ' + vEstMoto.dataSet.fieldbyname('chassi_c').asstring);
        buscas.Close;
        buscas.SQL.Text := ' select descricao from tipmodelo ' +
        	' where codigo = ' + IntToStr(vEstMoto.dataSet.FieldByName('VERSAOEST').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;
        buscas.FetchAll;
        Rdp.Imp(linha, 29, 'Modelo.....: ' + buscas.FieldByName('DESCRICAO').asstring);
        Rdp.Imp(linha, 61, 'Cor..: ' + vEstMoto.dataSet.fieldByName('corest').asstring);
        linha := linha + 1;
        Rdp.Imp(linha, 1, 'Motor..: ' + vEstMoto.dataSet.fieldByName('motorest').asstring);
        Rdp.Imp(linha, 29, 'Combustivel: ' + vEstMoto.dataSet.fieldByName('combustivelest').asstring);
        Rdp.Imp(linha, 61, 'NF Nº: __________');
        linha := linha + 1;
        Rdp.Imp(linha, 1, 'Data...:___/___/____');
        Rdp.Imp(linha, 29, 'Valor NF...: ' + dataSet.FieldByName('VALTOT_V').asstring);
        Rdp.Imp(linha, 61, 'F./M.: ' + vEstMoto.dataSet.fieldByName('Ano_fabest').asstring + '/' + vEstMoto.dataSet.fieldByName('Ano_modest').asstring);
        linha := linha + 1;
        Rdp.Imp(linha, 1, vDadosIni.Replicate('_', 80));
        linha := linha + 1;
      end;
    end
    else
    begin
      if vEstMoto.dataSet.fieldByName('ESTOQUE').asstring = 'P' then
        Rdp.Impc(linha, 40, 'Produto: USADO - ESTOQUE DA LOJA', [negrito])
      else if vEstMoto.dataSet.fieldByName('ESTOQUE').AsString = 'O' then
        Rdp.Impc(linha, 40, 'Produto: USADO - OUTRAS CONCESSIONARIAS', [negrito])
      else if vEstMoto.dataSet.fieldByName('ESTOQUE').asstring = 'T' then
        Rdp.Impc(linha, 40, 'Produto: USADO - VEICULO DE TERCEIRO', [negrito])
      else if vEstMoto.dataSet.fieldByName('ESTOQUE').asstring = 'C' then
        Rdp.Impc(linha, 40, 'Produto: USADO - CONCESSIONARIAS', [negrito]);
      linha := linha + 2;
      if not vEstMoto.dataSet.isempty then
      begin
        Rdp.Imp(linha, 1, 'Veículo : ' + vEstMoto.dataSet.fieldbyname('chassi_c').asstring);
        buscas.Close;
        buscas.SQL.Text := ' select descricao from tipmodelo ' +
          ' where codigo = ' + IntToStr(vEstMoto.dataSet.FieldByName('VERSAOEST').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;
        buscas.FetchAll;
        Rdp.Imp(linha, 29, 'Modelo.....: ' + buscas.FieldByName('DESCRICAO').asstring);
        Rdp.Imp(linha, 61, 'Cor..: ' + vEstMoto.dataSet.fieldbyname('corest').asstring);
        linha := linha + 1;
        Rdp.Imp(linha, 1, 'Motor..: ' + vEstMoto.dataSet.fieldbyname('motorest').asstring);
        Rdp.Imp(linha, 29, 'Combustivel: ' + vEstMoto.dataSet.fieldbyname('combustivelest').asstring);
        Rdp.Imp(linha, 61, 'NF Nº: __________');
        linha := linha + 1;
        Rdp.Imp(linha, 1, 'Data...:___/___/____');
        Rdp.Imp(linha, 29, 'Valor NF...: ' + dataSet.fieldbyname('VALTOT_V').asstring);
        Rdp.Imp(linha, 61, 'F./M.: ' + vEstMoto.dataSet.fieldbyname('Ano_fabest').asstring + '/' + vEstMoto.dataSet.fieldbyname('Ano_modest').asstring);
        linha := linha + 1;
        Rdp.Imp(linha, 1, vDadosIni.Replicate('_', 80));
        linha := linha + 1;
      end;
    end;
    if vEstMoto.dataSet.isempty then
    begin
//    QrEstoque.close;
//    QrEstoque.sql.text := 'select * from mot_ven where chassiv = :vchass and n_comando = :vcom and cod_empresa = :COD_EMPRESA and ativo = 1';
//    QrEstoque.ParamByName('COD_EMPRESA').asstring := FRMprincipal.CodEmpresa;
//    Qrestoque.params[0].asstring := dbedit3.text;
//    QrEstoque.params[1].asinteger := dtmMoto.QrComandoFatN_COMANDO.value;
//    QrEstoque.open;
//    if not QrEstoque.IsEmpty then
//    begin
      Rdp.Imp(linha, 1, 'Veículo : ' + vEstMoto.dataSet.fieldbyname('chassi_c').asstring);
      Rdp.Imp(linha, 29, 'Modelo.....: ' + vEstMoto.vModVeic.dataSet.FieldByName('DESCRICAO').asstring);
      Rdp.Imp(linha, 61, 'Cor..: ' + vEstMoto.dataSet.fieldbyname('corest').asstring);
      linha := linha + 1;
      Rdp.Imp(linha, 1, 'Motor..: ' + vEstMoto.dataSet.fieldbyname('motorest').asstring);
      Rdp.Imp(linha, 29, 'Combustivel: ' + vEstMoto.dataSet.fieldbyname('combustivelest').asstring);
      Rdp.Imp(linha, 61, 'NF Nº: __________');
      linha := linha + 1;
      Rdp.Imp(linha, 1, 'Data...:___/___/____');
      Rdp.Imp(linha, 29, 'Valor NF...: ' + dataSet.fieldbyname('VALTOT_V').asstring);
      Rdp.Imp(linha, 61, 'F./M.: ' + vEstMoto.dataSet.fieldbyname('Ano_fabest').asstring + '/' + vEstMoto.dataSet.fieldbyname('Ano_modest').asstring);
      linha := linha + 1;
      Rdp.Imp(linha, 1, vDadosIni.Replicate('_', 80));
      linha := linha + 1;
//    end;
    end;
    Rdp.Impc(linha, 40, '+---------------------------+', [normal]);
    linha := linha + 1;
    Rdp.Impc(linha, 40, '|    CONDICOES DO NEGOCIO   |', [normal]);
    linha := linha + 1;
    Rdp.Impc(linha, 40, '+---------------------------+', [normal]);
    linha := linha + 2;
    Rdp.Imp(linha, 1, 'Descricoes');
    Rdp.Imp(linha, 64, 'Valores');
    linha := linha + 1;
    Rdp.Imp(linha, 1, '+');
    Rdp.Imp(linha, 2, vDadosIni.Replicate('-', 79));
    Rdp.Imp(linha, 80, '+');
    if vDadosIni.vUsarPlanoVeic <> 'S' then
    begin
      linha := linha + 1;
      Rdp.Imp(linha, 1, '|');
      Rdp.Imp(linha, 2, dataSet.fieldbyname('OBS1').asstring);
      Rdp.Imp(linha, 64, vDadosIni.Alndir(format('%n', [dataSet.fieldbyname('VALOBS1').AsCurrency]), 12));
      Rdp.Imp(linha, 80, '|');
      linha := linha + 1;
      Rdp.Imp(linha, 1, '|');
      Rdp.Imp(linha, 2, dataSet.fieldbyname('OBS2').asstring);
      Rdp.Imp(linha, 64, vDadosIni.Alndir(format('%n', [dataSet.fieldbyname('VALOBS2').AsCurrency]), 12));
      Rdp.Imp(linha, 80, '|');
      linha := linha + 1;
      Rdp.Imp(linha, 1, '|');
      Rdp.Imp(linha, 2, dataSet.fieldbyname('OBS3').asstring);
      Rdp.Imp(linha, 64, vDadosIni.Alndir(format('%n', [dataSet.fieldbyname('VALOBS3').AsCurrency]), 12));
      Rdp.Imp(linha, 80, '|');
      linha := linha + 1;
      Rdp.Imp(linha, 1, '|');
      Rdp.Imp(linha, 2, dataSet.fieldbyname('OBS4').asstring);
      Rdp.Imp(linha, 64, vDadosIni.Alndir(format('%n', [dataSet.fieldbyname('VALOBS4').AsCurrency]), 12));
      Rdp.Imp(linha, 80, '|');
      linha := linha + 1;
      Rdp.Imp(linha, 1, '|');
      Rdp.Imp(linha, 2, dataSet.fieldbyname('OBS5').asstring);
      Rdp.Imp(linha, 64, vDadosIni.Alndir(format('%n', [dataSet.fieldbyname('VALOBS5').AsCurrency]), 12));
      Rdp.Imp(linha, 80, '|');
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select pl.* from plano_pag pl where pl.tpdocs = ''MOT''' +
        ' and pl.nrequisicao = ' + dataSet.FieldByName('N_COMANDO').AsString +
        ' and pl.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if not buscas.isempty then
      begin
        while not Buscas.eof do
        begin
          linha := linha + 1;
          Rdp.Imp(linha, 1, '|');
          Rdp.Imp(linha, 2, buscas.fieldbyname('Historico').asstring);
          Rdp.Imp(linha, 64, vDadosIni.Alndir(format('%n', [buscas.fieldbyname('ValorDoc').AsCurrency]), 12));
          Rdp.Imp(linha, 80, '|');
          buscas.next;

          if linha >= 64 then
          begin
            linha := 1;
            Rdp.Novapagina;
          end;
        end;
      end;
    end;
    if linha >= 58 then
    begin
      linha := 1;
      Rdp.Novapagina;
    end;
    linha := linha + 1;
    Rdp.Imp(linha, 1, '|');
    Rdp.Imp(linha, 80, '|');
    linha := linha + 1;
    Rdp.Imp(linha, 1, '+');
    Rdp.Imp(linha, 2, vDadosIni.Replicate('-', 79));
    Rdp.Imp(linha, 80, '+');
    linha := linha + 1;
    Rdp.Impf(linha, 2, 'Valor Real Produto: ' + vDadosIni.Alndir(format('%n', [dataSet.fieldbyname('VALOR_REAL').AsCurrency]), 12), [negrito]);
    Rdp.Impf(linha, 39, 'Valor a Receber Cx.Loja: ' + vDadosIni.Alndir(format('%n', [dataSet.fieldbyname('VALOR_A_REC').AsCurrency]), 12), [negrito]);
    linha := linha + 4;
    Rdp.Impf(linha, 1, '____________________', [negrito]);
    Rdp.Impf(linha, 40, '____________________', [negrito]);
    linha := linha + 1;
    Rdp.Impf(linha, 1, '      VENDEDOR      ', [negrito]);
    Rdp.Impf(linha, 40, ' CLIENTES:DE ACORDO ', [negrito]);
    if linha >= 55 then
    begin
      linha := 1;
      Rdp.Novapagina;
    end;
    linha := linha + 1;
    Rdp.Imp(linha, 1, vDadosIni.Replicate('_', 80));
    linha := linha + 1;
    Rdp.Impc(linha, 40, '+---------------------------+', [normal]);
    linha := linha + 1;
    Rdp.Impc(linha, 40, '|   RESULTADO OPERACIONAL   |', [normal]);
    linha := linha + 1;
    Rdp.Impc(linha, 40, '+---------------------------+', [normal]);
    linha := linha + 2;
    Rdp.Imp(linha, 1, 'RECEITAS                      |   DESPESAS                     | LUCRO BRUTO    ');
    linha := linha + 1;
    Rdp.Imp(linha, 1, '                              |                                |                ');
    linha := linha + 1;
    Rdp.Imp(linha, 1, 'P.Venda:______________________| P.Custo:_______________________|                ');
    linha := linha + 1;
    Rdp.Imp(linha, 1, 'Juros..:______________________| Comiss.:_______________________|                ');
    linha := linha + 1;
    Rdp.Imp(linha, 1, '______________________________| _______________________________|                ');
    linha := linha + 1;
    Rdp.Imp(linha, 1, 'Total..:______________________| Total..:_______________________|                ');
    Rdp.Fechar;

  except
  end;
end;

function TComFat.ImprimirContrato(pCodContrato: Integer): boolean;
begin
  try
    Result := false;

    if pCodContrato <= 0 then
      exit;

    vDadosIni.WriteToMSWord(
    	vDadosIni._TrocaTAGsDaCarta(
      	cPropostaVeic,
      	pCodContrato,
        dataSet.FieldByName('CLIENTES_V').AsInteger,
      	IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger),
        '',
        0,
        0,
        '-1'
      ),
      vDadosIni.vEmp.vSenhaContratoVeic
    );
    buscas.close;
  except
  end;
end;

function TComFat.ImprimirContratoComando: boolean;
var
  vCodProcesso: string;
begin
  try
    inherited;

    if dataSet.IsEmpty then
      exit;
      
    if not (dataSet.State in [dsInsert, dsEdit]) then
       Edit;

    if trim(vSing.vMod) = 'CFT' then
      vCodProcesso := 'VEI074'
    else if trim(vSing.vMod) = 'CTRCOMPRA' then
      vCodProcesso := 'VEI072'
    else if trim(vSing.vMod) = 'CTRENTCONS' then
      vCodProcesso := 'VEI073'
    else if trim(vSing.vMod) = 'CTRVND' then
      vCodProcesso := 'VEI075'
    else if trim(vSing.vMod) = 'CTRVNDCONS' then
      vCodProcesso := 'VEI076'
    else if trim(vSing.vMod) = 'CTRRESDOM' then
      vCodProcesso := 'VEI077'
    else if trim(vSing.vMod) = 'CTRINTERM' then
      vCodProcesso := 'VEI078';

    if not vDadosIni.PesqPros(vCodProcesso, 'IMPRIMIR COMANDO/CONTRATO', 'CHASSI - ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT',
      dataSet.FieldByName('N_COMANDO').AsString, buscas, true) then
    begin
      Application.MessageBox(Pchar('Reimpressão do '+vSing.vNomeContrato+' não é permitido.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if (trim(dataSet.FieldByName('STATUS_V').AsString) <> 'FECHADO')
    and (trim(dataSet.FieldByName('STATUS_V').AsString) <> 'CANCELADO') then
    begin
      if ((trim(vSing.vMod) <> 'CTRVNDCONS') and (trim(dataSet.FieldByName('STATUS_V').AsString) <> 'ABERTO'))
      or ((trim(vSing.vMod) <> 'CTRVNDCONS') and (trim(dataSet.FieldByName('STATUS_V').AsString) <> '')) then
      begin
        Application.MessageBox(Pchar(vSing.vNomeContrato+' não está fechado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        exit;
      end;
    end;

    vClienteComFat.abreClientes(dataSet.FieldByName('CLIENTES_V').AsInteger);
    vEstMoto.AbreEstMoto(dataSet.FieldByName('COD_ESTMOTO').AsInteger, dataSet.FieldByName('CHASSIV').AsString);

    if trim(vSing.vMod) = 'CFT' then
      ImprimirComando
    else
      abreFormListaContrato;
    dataSet.Cancel;
  except
  end;
end;

function TComFat.insert: boolean;
var
	AConf: TConfig_sistema_class;
	vCondPagComFat: string;
begin
  result := inherited Insert;

  if not result then
    exit;

  vReceberPeloFinanceiro := false;  
  vCFOPOld := 0;
  vCodCondPagOld := 0;
  dataSet.FieldByName('VEICULO_TROCA').AsString := 'N';
  dataSet.FieldByName('VEICULO_RODANDO').AsString := 'N';
  dataSet.FieldByName('IMP_DECLARACAO').AsString := 'N';
  dataSet.FieldByName('NATUREZA').AsString := vSing.vNatureza;
  dataSet.FieldByName('TIPO').AsString := vSing.vTipo;
  dataSet.FieldByName('MODELO').AsString := vSing.vMod;
  dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.FieldByName('DT_ENT_SAID').AsDateTime := vDadosIni.getDataBanco(buscas);
  dataSet.FieldByName('DATA_VEN').AsDateTime := vDadosIni.getDataBanco(buscas);
  dataSet.FieldByName('CST_V').AsString := '060';
//  dataSet.FieldByName('SUB_SERIE').AsInteger := vDadosIni.vEmp.vSubSerieNotaFiscal;
//  dataSet.FieldByName('MODELO_NF').AsString := vDadosIni.vEmp.vNfe.modeloNF;
  dataSet.FieldByName('COVEND_V').AsInteger := vDadosIni.vCodUsuario;
  dataSet.FieldByName('COD_GERENTE').AsString := retornaValor('select cod_gerente as valor from colaborador c' +
    ' where cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +' and ativo = 1 and cod_empresa = '+ vDadosIni.codEmpresa);
  if dataSet.FieldByName('NATUREZA').AsString = 'E' then
    dataSet.FieldByName('CLIENTES_V').AsString := retornaValor('select cod_cliente as valor from clientes' +
      ' where cpfcgc = ' + QuotedStr(vDadosIni.vEmp.vCNPJ) +' and ativo = 1 and cod_empresa = '+ vDadosIni.codEmpresa)
  else if dataSet.FieldByName('NATUREZA').AsString = 'S' then
    if vSing.vTipoVendaCFOP = 'I' then //if (trim(vSing.vMod) = 'CTRINTERM') then
      dataSet.FieldByName('COD_INTERMED').AsString := retornaValor('select cod_cliente as valor from clientes' +
        ' where cpfcgc = ' + QuotedStr(vDadosIni.vEmp.vCNPJ) +' and ativo = 1 and cod_empresa = '+ vDadosIni.codEmpresa);
//    else
//      dataSet.FieldByName('COD_CLI_VENDE').AsString := retornaValor('select cod_cliente as valor from clientes' +
//        ' where cpfcgc = ' + QuotedStr(vDadosIni.vEmp.vCNPJ) +' and ativo = 1 and cod_empresa = '+ vDadosIni.codEmpresa);
  dataSet.FieldByName('PRVEN_V').AsFloat := 0;
  dataSet.FieldByName('CODFISC_V').AsString := 'MOTOCICLETA';
  if dataSet.FieldByName('MODELO').AsString = 'CTRRESDOM' then
  begin
    dataSet.FieldByName('IMP_DECLARACAO').AsString := 'S';
    dataSet.FieldByName('TPREST').AsString := '3';
  end;
  dataSet.FieldByName('STATUS_V').AsString := 'ABERTO';
  dataSet.FieldByName('EMISSAO_PROPRIA').AsString := 'N';

  if dataSet.FieldByName('NATUREZA').AsString = 'S' then
  begin
    AConf := TConfig_sistema_class.Create;
    vCondPagComFat := '';
    try
      AConf := TConfig_sistema_class.getConf('cond_pag_padrao_por_tipo', buscas, vDadosIni.cod_empresa);
      if Assigned(Aconf) then
      begin
        if AConf.value1_f = 1 then
        begin
          vCondPagComFat  := Aconf.ReadString('Configuracao', 'ComandoFaturamentoContrato', '');
        end;
      end;
    finally
      if Assigned(AConf) then FreeAndNil(AConf);
    end;

    if (trim(vCondPagComFat) <> '') then
    begin
      try
        StrToInt(vCondPagComFat);
      except
        vCondPagComFat := '';
      end;

      if trim(vCondPagComFat) <> '' then
        if trim(retornaValor(' select first 1 cond_pag.cod_cond_pag AS VALOR from cond_pag ' +
        	' inner join cond_pag_empresa on ' +
          ' 	cond_pag_empresa.cod_cond_pag = cond_pag.cod_cond_pag ' +
          '   and cond_pag_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
          ' where cond_pag.cod_cond_pag = ' + vCondPagComFat +
          ' and cond_pag.ativo = 1 ')) = '' then
            vCondPagComFat := '';


      if trim(vCondPagComFat) <> '' then
        dataSet.FieldByName('CONDPAG_V').AsString := vCondPagComFat
    end;
  end;

  vMensDemonst := True;

  vColaborador.abreLocVendedor;
  vGerente.abreLocGerente;
  vCondPag.abreCondPag;
  vEstMoto.AbreEstMoto;

  if dataSet.FieldByName('NATUREZA').AsString = 'E' then
	  vClienteComFat.abreClientes(dataSet.FieldByName('CLIENTES_V').AsInteger)
  else if (dataSet.FieldByName('NATUREZA').AsString = 'S') and (vSing.vTipoVendaCFOP = 'I') then
    vClienteComFat.abreClientes(dataSet.FieldByName('COD_INTERMED').AsInteger)
  else
	  vClienteComFat.abreClientes(0);
  vClienteVendComFat.abreClientes(0);
  vIntermediadorComFat.abreClientes(0);
  vConcessionariaComFat.abreClientes(0);
  dtSetPlano.EmptyDataSet;
  _abreNatOperacao;
  abreTipoVendas(frmMovVeiculosCCIA.DBComboBox1);

  checarRegraCfopCST;
  if trim(vSing.vNatureza) = 'S' then
  begin
    if (vDadosIni.vUsarPlanoVeic = 'S') and (trim(vNaturezaOp.dataSet.FieldByName('FATURAMENTO').AsString) = 'S') then
    begin
      if vDadosIni.PesqPros('VEI080', 'CONSULTA', '', 'COM_FAT', '', Buscas, true) then
        if application.messagebox('Veículo Usado na Troca?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          dataSet.FieldByName('VEICULO_TROCA').AsString := 'S';
    end;
  end;
end;

function TComFat.MontarNFe(pNumComando: Integer; pTipo, pNatureza: string): Boolean;
var
  vNf: TNfCab;
  vCodNF: Integer;
  vTemp: string;
begin
  Result := True;
//  vCodNF := dataSet.FieldByName('COD_NF').AsInteger;

//  if vCodNF <= 0 then
//  begin
//   vTemp := retornaValor('select coalesce(nf.cod_nf, 0) valor from notafiscal nf ' +
//    ' left join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa ' +
//    ' where (coalesce(nf.tipo_nf, '''') = ''V'') and natureza_nf = ' + QuotedStr(dataSet.FieldByName('NATUREZA').AsString) +
//    ' and nfi.chassi = '+ QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
//    ' and nfi.cod_estmoto = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
//    ' and nfi.cod_empresa = ' + vDadosIni.codEmpresa);
//    if trim(vTemp) <> '' then
//      vCodNF := StrToInt(vTemp);
//  end;
  if (dataSet.FieldByName('DATA_VEN').AsDateTime < StrToDateTime(FormatDateTime('dd/mm/yyyy', StrToDate('17/01/2011')))) then
  begin
    Application.MessageBox('Modelo de Nota Fiscal muito antigo, não é possível visualizar notafiscal.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    exit;
  end;

  if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
  begin
    try
      Screen.Cursor := crHourGlass;
      vNf := TNFCab.create;
//      if vCodNF <= 0 then
//      begin
        vDadosIni.abreStatusProcessamento('', 'Iniciando Nota Fiscal');
        if pNatureza = 'E' then
          vNf.cadNfpeloContratoAbreTela(pNumComando, pTipo)
        else
          vNf.cadNfpeloComandoAbreTela(pNumComando, pTipo);
//      end
//      else
//      begin
//        vNf.cadAbrirNfIntegracao(vCodNF);
//      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      vNf.Free;
      Screen.Cursor := crDefault;
      vDadosIni.vNomeForm := '';
    end;
  end;
end;

function TComFat.post: boolean;
var
  acao: string;
  vComando, vCodEquip: Integer;
  vOK: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if not vDadosIni.PesqPros('VEI056', 'SALVAR', vSing.vMod + ' Nº ' +
       dataSet.FieldByName('N_COMANDO').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas, true) then
      Exit;


    if dataSet.FieldByName('NATUREZA').AsString = 'S' then
      if not vClienteComFat.dataSet.FieldByName('CODIGO_FATURAMENTO').IsNull then
        if vClienteComFat.faturamentoBarrado(vClienteComFat.dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger) then
        begin
           vOK := false;

           if dataSet.FieldByName('CONDPAG_V').AsInteger > 0 then
             if vDadosIni.vCliente.vendaVistaClientesBarrados then
               if vDadosIni.verificarControlesCondPagBarrados(buscas,
                 dataSet.FieldByName('N_COMANDO').AsInteger, dataSet.FieldByName('CLIENTES_V').AsInteger,
                 dataSet.FieldByName('CONDPAG_V').AsInteger, 'MOT', true) then
                  vOK := true;

           if not vOK then
             if not vDadosIni.PesqPros('VND049', 'LIBERAR', dataSet.FieldByName('CLIENTES_V').asstring + ' ' +
               vClienteComFat.dataSet.FieldByName('NOME_CLIENTE').AsString, 'COM_FAT',
               dataSet.FieldByName('N_COMANDO').asstring, buscas, True) then
               Exit
             else if Application.MessageBox('Deseja continuar a venda?', 'Confirmação', MB_YESNO +
               MB_DEFBUTTON1) = mrYes then
        end;


    if dataSet.State in [dsInsert] then
    begin
//      if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
//        dataSet.FieldByName('N_COMANDO').AsInteger := Gencodigo('COM_FATT', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa)
//      else
        dataSet.FieldByName('N_COMANDO').AsInteger := Gencodigo('COM_FAT', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
    end;

    vComando := dataSet.FieldByName('N_COMANDO').AsInteger;

    if (vDadosIni.vTipoForm = 5) then
    begin
      if (dataSet.State = dsInsert) then
        acao := 'INSERIR'
      else
        acao := 'EDITAR';
    end;

    Result := inherited post;

    verplanopag(1);

    if (dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if not Result then
    begin
      dataSet.Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VEI056', acao, 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas);
      exit;
    end;

    vClienteComFat.gravaTipoCliente(vClienteComFat.dataSet.FieldByName('TIPOCLIENTE').AsString, vSing.vTipo);

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI056', acao, 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI056', acao, 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas);

    vCodEquip := ExisteEquipamento;

    if vCodEquip > 0 then
      if Result then
        vDadosIni.GravaAuditoria('EQU032', acao, 'SUCESSO', 'EQUIPAMENTO', IntToStr(vCodEquip), buscas)
      else
        vDadosIni.GravaAuditoria('EQU032', acao, 'FALHA', 'EQUIPAMENTO', IntToStr(vCodEquip), buscas);

    if Result then
      abreComFat(vComando);

    frmMovVeiculosCCIA.DBComboBox3.ItemIndex := 0;
    frmMovVeiculosCCIA.DBComboBox4.ItemIndex := 0;
    frmMovVeiculosCCIA.DBComboBox5.ItemIndex := 0;
    frmMovVeiculosCCIA.DBComboBox8.ItemIndex := 0;

    ConfirmarComando;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TComFat.PrecoTabela(buscas2: TIBQuery);
begin
 CalcularRedLucro;
 
 if dataSet.FieldByName('COD_ESTMOTO').AsInteger <= 0 then
    exit;

  if not (ComFat.dataSet.State in [dsInsert, dsEdit]) then
    exit;

  if (dataSet.FieldByName('NATUREZA').AsString = 'E')
  or (dataSet.FieldByName('TIPV_VEICULO').AsString = 'T') then
    exit;

  buscas2.Close;
  buscas2.sql.text := ' SELECT FIRST 1 EST.*, T.VALTAB FROM EST_MOTO EST ' +
   ' LEFT JOIN TIPMODELO T ON T.CODIGO = EST.VERSAOEST AND T.COD_EMPRESA = EST.COD_EMPRESA ' +
   ' WHERE EST.CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
   ' AND EST.CODIGO = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
   ' AND EST.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND EST.ATIVO = 1 ';
  buscas2.open;

  if dataSet.FieldByName('NATUREZA').AsString = 'S' then
  begin
    if dataSet.FieldByName('PRVEN_V').AsFloat = 0 then
      if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'E') and (buscas2.FieldByName('PRECO_CUSTO').AsFloat > 0) then
        dataSet.FieldByName('PRVEN_V').AsFloat := buscas2.FieldByName('PRECO_CUSTO_REP').AsFloat
      else if (dataSet.FieldByName('TIPV_VEICULO').AsString = 'E') and (buscas2.FieldByName('PRECO_CUSTO').AsFloat > 0) then
        dataSet.FieldByName('PRVEN_V').AsFloat := buscas2.FieldByName('PRECO_CUSTO').AsFloat
      else if buscas2.fieldbyname('PRECO_SUG_VND').AsFloat > 0 then
        dataSet.FieldByName('PRVEN_V').AsFloat := buscas2.fieldbyname('PRECO_SUG_VND').AsFloat
      else if buscas2.fieldbyname('PRECO_TABEST').AsFloat > 0 then
        dataSet.FieldByName('PRVEN_V').AsFloat := buscas2.fieldbyname('PRECO_TABEST').AsFloat
      else
        dataSet.FieldByName('PRVEN_V').AsFloat := buscas2.fieldbyname('VALTAB').AsFloat;

//    if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U' then
//      dataSet.FieldByName('PERC_RED_V').AsFloat := buscas2.fieldbyname('PERC_RED').AsFloat;

    if trim(vNaturezaOp.dataSet.FieldByName('SEM_IMPOSTO').AsString) = 'S' then
    begin
     dataSet.FieldByName('BASE_ICM_V').AsFloat := 0;
     dataSet.FieldByName('ALICM_V').AsFloat := 0;
     dataSet.FieldByName('PERC_RED_V').AsFloat := 0;
     dataSet.FieldByName('ICMS_V').AsFloat := 0;
    end;
  end;
end;

function TComFat.ReabrirComando: Boolean;
var
 vComando: Integer;
 obFp: TFormPag2;
 vStatusV: string;
begin
 try
   try
      Result := True;

      if not verificaFechamento(2) then
      begin
       Application.MessageBox(Pchar(vSing.vNomeContrato + ' não se encontra fechado no momento!'), 'Informação', MB_OK + MB_ICONINFORMATION);
       Result := false;
       exit;
      end;

      if not verificaPendenciaCXL then
      begin
       Result := false;
       exit;
      end;

      if Application.MessageBox(PChar('Deseja Reabrir ' + vSing.vNomeContrato + '?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
      begin
        Result := false;
        Exit;
      end;

      if not verificaPendenciasNF then
      begin
       Result := false;
       exit;
      end;

      if (dataSet.FieldByName('NATUREZA').AsString = 'S') and (vEstMoto.dataSet.FieldByName('NUM_NOTA').AsInteger <= 0) then
        if (trim(vEstMoto.dataSet.FieldByName('POSICAO').AsString) = 'MORTO') then
        begin
          Application.MessageBox(PChar('Não é possível reabrir ' + vSing.vNomeContrato +
           ' sem nota que já tenha baixado o estoque!' + #13 +
           'Favor realizar o cancelamento do '+ vSing.vNomeContrato + '.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          Result := false;
          exit;
        end;

      vComando := dataSet.FieldByName('N_COMANDO').AsInteger;

      if not (dataSet.State in [dsInsert, dsEdit]) then
        dataSet.Edit;
      vStatusV := trim(dataSet.FieldByName('STATUS_V').AsString);
      dataSet.FieldByName('STATUS_V').AsString := 'ABERTO';
      dataSet.FieldByName('COD_US_FECH').Value := Null;
      dataSet.FieldByName('DATA_FECH').Value := Null;
      dataSet.FieldByName('HORA_FECH').Value := Null;
      dataSet.Post;

      if not vEstMoto.setarDadosComando(ComFat, 2, vStatusV) then
      begin
       dataSet.Cancel;
       exit;
      end;

      if (dataSet.ChangeCount = 0) then
        Result := True
      else
        Result := Apply;

      if result then
        result := CommitaTransacao;
      try
       if result then
       begin
         obFp := TFormPag2.create;
         obFp.cancelaVenda(vComando, 'MOT');
       end;
      finally
       if result then
         obFp.Free;
      end;
   except
     on E: Exception do
     begin
       if (dataSet.State in [dsEdit, dsInsert]) then
        Cancel;
       result := false;
       if inibeErro <> 'S' then
         Application.MessageBox(PChar('Erro ao Reabrir '+vSing.vNomeContrato), 'Atenção', MB_ICONWARNING + MB_OK);
       inibeErro := 'N';
       registraErro('E0007 ' + e.Message);
       RollBackTransacao;
       exit;
     end;
   end;
 finally
   if (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.Cancel;

   if Result then
     vDadosIni.GravaAuditoria('VEI104', 'REABRIR', 'SUCESSO - CHASSI ' +
      dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas)
   else
     vDadosIni.GravaAuditoria('VEI104', 'REABRIR', 'FALHA - CHASSI ' +
      dataSet.FieldByName('CHASSIV').AsString, 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas);

   if Result then
    abreComFat(vComando);
 end;
end;

function TComFat.ReceberFinanceiroPeloFinanceiroComFat: boolean;
begin
	Result := false;

  if (dataSet.FieldByName('NATUREZA').AsString = 'S')
    and (vDadosIni.vEmp.vModoFaturamento = 'N')
    and (vDadosIni.vSistema <> 'Cxl') then
  begin
    Result := true;
  end
  else if (dataSet.FieldByName('NATUREZA').AsString = 'S')
    and (vDadosIni.vEmp.vModoFaturamento = 'S')
    and (vDadosIni.vVeic.ReceberPeloFinanceiro)
    and (vDadosIni.vSistema <> 'Cxl') then
  begin
    if vDadosIni.ReceberPeloFinanceiro(dataSet.FieldByName('N_COMANDO').AsInteger, 'MOT', buscas) = 'S' then
    begin
      vDadosIni.vInibeMensPesqPros := 'S';
      if vDadosIni.PesqPros('VEI168', 'HABILITAR', '"MOT" ' + dataSet.FieldByName('N_COMANDO').AsString,
       'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas, false) then
      begin
        Result := true;
        exit;
      end;
	  end;
  end;
end;

function TComFat.removerPlano: boolean;
begin
  if dtSetPlano.IsEmpty then
    exit;

  if Application.MessageBox('Tem Certeza que deseja apagar este lançamento',
    'Remover Lançamento', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    dtSetPlano.delete;
    VerificaSaldo(2);
  end;
end;

function TComFat.retornaValorCusto: real;
begin
  buscas.Close;
  buscas.SQL.Text := ' select first 1 (et.custo) as custo from comprasmesesv40 et ' +
    ' where et.chassi = ''' + dataSet.FieldByName('CHASSIV').AsString + ''' and' +
    ' et.cod_empresa = ' + vDadosIni.codEmpresa + ' order by data_ch_nota';
  buscas.Open;
  buscas.FetchAll;

  result := buscas.FieldByName('custo').AsCurrency;
end;

function TComFat.setarTipoVendas: boolean;
var
	vtemp: string;
  vcampo: string;
  vvalor: string;
	vObs: string;
  I: Integer;
  vtempini: string;
  vtempfim: string;
  vcampoenc: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' SELECT DESCRICAO, TIPO_OS, TPREST, OBSERVACAO FROM TIPO_VENDAS ' +
    ' WHERE TIPO = ''VEI'' AND TIPO_OS = :TIPO_OS AND ATIVO = 1 ORDER BY ORDEMEXIBICAO';
  buscas.ParamByName('TIPO_OS').AsString := trim(dataSet.FieldByName('TIPO_V').AsString);
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
   exit;

  dataset.FieldByName('TPREST').AsString := buscas.FieldByName('TPREST').AsString;

  if (UpperCase(trim(dataset.FieldByName('TPREST').AsString)) = '3 - RESERVA DE DOMíNIO') then
  begin
    frmMovVeiculosCCIA.Label138.Visible := true;
    frmMovVeiculosCCIA.DBEdit78.Visible := true;
    dataSet.FieldByName('TPREST').AsString := '3 - Reserva de Domínio';
  end
  else
  begin
    frmMovVeiculosCCIA.Label138.Visible := false;
    frmMovVeiculosCCIA.DBEdit78.Visible := false;
  end;

  if Trim(dataSet.FieldByName('TIPO_V').AsString) = 'CP' then
  begin
    frmMovVeiculosCCIA.Label137.visible := true;
    frmMovVeiculosCCIA.DBEdit77.visible := true;
    frmMovVeiculosCCIA.Label139.visible := true;
    frmMovVeiculosCCIA.DBEdit79.visible := true;
    dataSet.FieldByName('TPREST').AsString := '3 - Reserva de Domínio';
    if frmMovVeiculosCCIA.DBEdit77.CanFocus then
      frmMovVeiculosCCIA.DBEdit77.setfocus;
  end
  else
  begin
    frmMovVeiculosCCIA.Label137.visible := false;
    frmMovVeiculosCCIA.DBEdit77.visible := false;
    frmMovVeiculosCCIA.Label139.visible := false;
    frmMovVeiculosCCIA.DBEdit79.visible := false;
  end;

  if trim(dataSet.FieldByName('TPREST').AsString) = '' then
  begin
    frmMovVeiculosCCIA.DBComboBox2.ItemIndex := 0;
    dataset.FieldByName('TPREST').AsString := '0 - Não há';
  end;

  if trim(buscas.FieldByName('OBSERVACAO').AsString) <> '' then
  begin
  	vObs := trim(buscas.FieldByName('OBSERVACAO').AsString);

    if Pos('[@', vObs) = 0 then
    	frmMovVeiculosCCIA.DBMemo7.Lines.Text := vObs
    else
    begin
      vtemp := vObs;
      while (Pos('[@', vtemp) > 0) and (Pos(']', vtemp) > 0) do
      begin
        vcampoenc:= false;
        vtempini := Copy(vtemp, 1, Pos('[@', vtemp) - 1);
        vtempfim := Copy(vtemp, Pos(']', vtemp) + 1, Length(vtemp) - Pos(']', vtemp));

        vcampo := Copy(vtemp, Pos('[@', vtemp), Pos(']', vtemp) + 1 - Pos('[@', vtemp));

        vvalor := '';
        if trim(vcampo) <> '' then
        begin
          vcampo := Copy(vcampo, 3, Length(vcampo) - 3);
          for I := 0 to DataSet.FieldCount - 1 do
          begin
            if UpperCase(Dataset.Fields[I].FieldName) = UpperCase(vcampo) then
            begin
              vcampoenc := true;
              if dataSet.Fields[i].DataType = ftCurrency then
                vvalor := 'R$ ' + FormatFloat('0.00', Dataset.Fields[I].AsFloat)
              else if dataSet.Fields[i].DataType = ftFloat then
              begin
                if trim(dataSet.Fields[i].EditMask) <> '' then
                  vvalor := FormatFloat(dataSet.Fields[i].EditMask, Dataset.Fields[I].AsFloat)
                else
                  vvalor := FormatFloat('0.00', Dataset.Fields[I].AsFloat);
              end
              else if dataSet.Fields[i].DataType = ftInteger then
                vvalor := IntToStr(Dataset.Fields[I].AsInteger)
              else if not Dataset.Fields[I].IsNull then
              begin
                if dataSet.Fields[i].DataType = ftDateTime then
                  vvalor := FormatDateTime('dd/mm/yyyy', Dataset.Fields[I].AsDateTime)
                else if dataSet.Fields[i].DataType = ftDate then
                  vvalor := FormatDateTime('dd/mm/yyyy', Dataset.Fields[I].AsDateTime)
                else if dataSet.Fields[i].DataType = ftString then
                  vvalor := trim(Dataset.Fields[I].AsString)
                else
                  vvalor := Dataset.Fields[I].Value;
              end;
              Break;
            end;
          end;

          if not vcampoenc then
            vvalor := '[@' + vcampo + ']';
        end;

        vtemp := vtempini + vvalor + vtempfim;
      end;

      frmMovVeiculosCCIA.DBMemo7.Lines.Text := vtemp;
    end;
  end;

  if (Trim(vDadosIni.vEmp.vMensagem) <> '')
  	and (pos(Trim(vDadosIni.vEmp.vMensagem),Trim(frmMovVeiculosCCIA.DBMemo7.Lines.Text)) = 0) then
       frmMovVeiculosCCIA.DBMemo7.Lines.Text := trim(vDadosIni.vEmp.vMensagem) + #13 + frmMovVeiculosCCIA.DBMemo7.Lines.Text;
end;

function TComFat.tentarSCAN: boolean;
begin
 Result := False;
 Exit;
 {
 if dataSet.FieldByName('NUM_NOTA_V').AsInteger = 0 then
 begin
//    if (dataSet.FieldByName('MODELO_NF').AsString = '55') and
   if (vDadosIni.vEmp.vNfe.modeloNF = '55') and
     (vDadosIni.vEmp.vNfe.danfeFormaEmissao = 'SCAN') then
   begin
     Application.ProcessMessages;
     Application.MessageBox(pchar('Configuração do SCAN ativada.'+#13+
       'O Sistema irá verificar o Status do servidor SCAN na RFB'),
       'Atenção',0+64);
     //Usar metodo da dll para verificar o Status do servidor SCAN
     if VerificaSCAN(strtoint(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW)) = 107 then
//      if VerificaSCAN(strtoint(FRMprincipal.CodEmpresa), Pchar(trim(AliasAutom)) = 107 then
     begin
       Application.ProcessMessages;
       Result :=  Application.MessageBox(pchar('SCAN ativado pela SEFAZ de Origem'+#13+
         'Deseja enviar nota fiscal pelo servidor SCAN na RFB?'),'Confirmação',MB_ICONQUESTION+MB_YESNO) = IDYES;
     end;
   end;
 end;
 }
end;

function TComFat.testarCNPJ(var pMensagem: string): boolean;
begin
  Result := True;

  if (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'T') then
   exit;

  if dataSet.FieldByName('CLIENTES_V').AsFloat <= 0 then
   exit;

  if vDadosIni.vEmp.vConfCNPJTransfDep <> 'S' then
    exit;

  buscas.Close;
  buscas.SQL.Text := 'select PRE_NOTA_TRANSF_CFOP, PRE_NOTA_TRANSF_CNPJ from empresa' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if (trim(buscas.FieldByName('PRE_NOTA_TRANSF_CFOP').AsString) = '') or
     (Trim(buscas.FieldByName('PRE_NOTA_TRANSF_CNPJ').AsString) = '') then
    exit;

  if pos(Trim(IntToStr(Trunc(dataSet.FieldByName('NATOP_V').AsFloat)))+ '|',
   Trim(buscas.FieldByName('PRE_NOTA_TRANSF_CFOP').AsString)) = 0 then
   begin
     Result := False;
     pMensagem := 'Natureza de Operação informada não configurada para gerar Pré-Nota!' + #13 + #13 +'Não é possível continuar!';
     Exit;
   end;

  if pos(Trim(vClienteComFat.dataSet.FieldByName('cpfcgc').AsString)+ '|',
    Trim(buscas.FieldByName('PRE_NOTA_TRANSF_CNPJ').AsString)) = 0 then
    begin
     Result := False;
     pMensagem := 'CNPJ do Cliente informado não corresponde ao CNPJ configurado para gerar Pré-Nota!' + #13 + #13 + 'Não é possível continuar!';
     Exit;
    end;
end;

function TComFat.TestarCST(var pMensagem: string; vcst: string): boolean;
begin
  TestarCst := true;
  if vcst = '' then
  begin
     pMensagem := 'Cst Não Informado.' + chr(13) + 'Campo Requerido.';
    TestarCst := false;
  end
  else if copy(vcst, 1, 1) = '' then
  begin
    pMensagem := 'Primeiro Dígito do CST Incorreto.' + chr(13) + 'Favor corrigir.';
    TestarCst := false;
  end
  else if pos(copy(vcst, 1, 1), '012345678') = 0 then
  begin
    pMensagem := 'Primeiro Dígito do CST Incorreto.' + chr(13) + 'Favor corrigir.';
    TestarCst := false;
  end
  else if copy(vcst, 2, 1) = '' then
  begin
    pMensagem := 'Segundo Dígito do CST Incorreto.' + chr(13) + 'Favor corrigir.';
    TestarCst := false;
  end
  else if pos(copy(vcst, 2, 1), '012345679') = 0 then
  begin
    pMensagem := 'Segundo Dígito do CST Incorreto.' + chr(13) + 'Favor corrigir.';
    TestarCst := false;
  end
  else if copy(vcst, 3, 1) = '' then
  begin
    pMensagem := 'Terceiro Dígito do CST Incorreto.' + chr(13) + 'Favor corrigir.';
    TestarCst := false;
  end
  else if pos(copy(vcst, 3, 1), '01') = 0 then
  begin
    pMensagem := 'Terceiro Digito do CST Incorreto.' + chr(13) + 'Favor corrigir.';
    TestarCst := false;
  end;
end;

function TComFat.VendaEstoque: boolean;
begin
  Result := True;

  if vEstMoto.dataSet.FieldByName('VERSAOEST').AsInteger <= 0 then
    Exit;

  buscas.Close;
  buscas.SQL.Text := ' select codigo, vndestoque from tipmodelo ' +
  	' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and codigo = ' + IntToStr(vEstMoto.dataSet.FieldByName('VERSAOEST').AsInteger) +
    ' and ativo = 1';
  buscas.Open;

  if buscas.IsEmpty then
   exit;

  if buscas.FieldByName('CODIGO').AsInteger > 0 then
    if trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'N' then
      if trim(buscas.FieldByName('VNDESTOQUE').AsString) <> 'S' then
        Result := False;
end;

function TComFat.verificaEnvioNFVeic: boolean;
var
  vmtn, vmtus: integer;
begin
  Result := true;

  vmtus := 0;
  if (dataSet.FieldByName('NATUREZA').AsString = 'S') and (trim(dataSet.FieldByName('TIPV_VEICULO').AsString) <> 'I')then
  begin
    if (dataSet.FieldByName('NUM_NOTA_V').IsNull) then
       Result := true
    else if (not dataSet.FieldByName('NUM_NOTA_V').IsNull) and
     (dataset.FieldByName('MODELO_NF').AsString = '55') and (trim(dataset.FieldByName('SITUACAO_NFE').AsString) = '') then
      Result := true
    else
      if (not dataSet.FieldByName('NUM_NOTA_V').IsNull) and (dataset.FieldByName('MODELO_NF').AsString = '55') then
        Result := false
      else
        if (dataSet.FieldByName('MODELO_NF').AsString = '55') and (trim(dataset.FieldByName('SITUACAO_NFE').AsString) = '') then
          result := true
        else
          result := false;

    if (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U') or (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'N') then
    begin
      if (trim(dataSet.FieldByName('CONFUS').AsString) = 'S') and
        (dataSet.FieldByName('NUM_NOTA_V').IsNull) then
      begin
        result := false;
//        buscas.close;
//        buscas.sql.text := 'select * from com_fat ' +
//          ' where n_comando = ' + dataset.FieldByName('N_COMANDO').AsString +
//          ' and chassiv = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
//          ' and cod_estmoto = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
//          ' and cod_empresa = ' +
//          vDadosIni.codEmpresa + ' and ativo = 1';
//        buscas.open;

        buscas.close;
        buscas.sql.text := 'select * from est_moto ' +
          ' where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
          ' and codigo = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
          ' and cod_empresa = ' +
          vDadosIni.codEmpresa + ' and ativo = 1';
        buscas.open;
        if buscas.FieldByName('COD_NF').asinteger <> 0 then
        begin
          vmtus := 2;
          Result := true;
        end
        else
        begin
          result := false;
          vmtn := 1;
        end;
      end
      else
      begin
        dataSet.Refresh;
        if dataSet.FieldByName('NUM_NOTA_V').AsInteger = 0 then
        begin
          buscas.close;
          buscas.sql.text := 'select * from est_moto ' +
           ' where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSIV').AsString) +
           ' and codigo = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
           ' and cod_empresa = ' +
            vDadosIni.codEmpresa + ' and ativo = 1';
          buscas.open;
          if buscas.FieldByName('NUM_NOTA').asinteger <> 0 then
          begin
            vmtus := 2;
            Result := true;
          end
          else
          begin
            result := false;
            vmtn := 1;
          end;
        end
        else
          Result := True;
      end;
    end
    else
      vmtn := 2;
  end;

  try
    IniciaTransacao;
    if result then
      gerarnfVenda;
    if not BaixarVeiculos(vmtn, vmtus) then
    begin
      dataSet.Cancel;
      RollBackTransacao;
      Result := False;
      exit;
    end;
    CommitaTransacao;
    verificaUsoDoPlanoDePagamento;
  except
    on e: exception do
    begin
      Refresh;
      RollBackTransacao;
      result := false;
      Application.MessageBox(pchar('Erro na Gravação: ' +
        e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
      registraErro('Erro: ' + e.Message);
    end;
  end;
end;

function TComFat.verificaFechamento(vtp: integer): boolean;
var
  vstatusped: string;
begin
  Result := false;

  if vtp = 1 then
  begin
  // Verifica se está aberto
    vstatusped := retornaValor('select status_v as valor from com_fat' +
      ' where n_comando = ' + dataSet.FieldByName('n_comando').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
    if (UpperCase(trim(vstatusped)) <> 'FECHADO') and (UpperCase(trim(vstatusped)) <> 'CANCELADO') then
      result := true
    else
      Result := false;
  end
  else if vtp = 2 then
  begin
  // Verifica se está fechado
    vstatusped := retornaValor('select status_v as valor from com_fat' +
      ' where n_comando = ' + dataSet.FieldByName('n_comando').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
    if (UpperCase(trim(vstatusped)) = 'FECHADO') then
      result := true
    else
      Result := false;
  end
  else if vtp = 3 then
  begin
  // Verifica se está cancelado
    vstatusped := retornaValor('select status_v as valor from com_fat' +
      ' where n_comando = ' + dataSet.FieldByName('n_comando').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
    if (UpperCase(trim(vstatusped)) = 'CANCELADO') then
      result := false
    else
      Result := true;
  end;
end;

function TComFat.verificaPendenciaCXL: boolean;
var
 vMensagem: string;
begin

  Result := True;

  if (vDadosIni.vEmp.vModoFaturamento = 'S') then
    vMensagem := vSing.vNomeContrato + ' Recebido no Caixa Auxiliar'
  else
    vMensagem := vSing.vNomeContrato + ' Recebido no Caixa';
  if trim(dataSet.FieldByName('DIA_CXL').AsString) <> '' then
  begin
    Application.MessageBox(Pchar(vMensagem), 'Informação', MB_OK + MB_ICONINFORMATION);
    Result := false;
    Exit;
  end;

  buscas.Close;
  buscas.SQL.Text := ' SELECT DIA_CXL FROM COM_FAT CF ' +
    ' WHERE N_COMANDO = :N_COMANDO AND COD_EMPRESA = :COD_EMPRESA ';
  buscas.ParamByName('N_COMANDO').AsInteger := dataSet.FieldByName('N_COMANDO').AsInteger;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  if trim(buscas.FieldByName('DIA_CXL').AsString) <> '' then
  begin
    Application.MessageBox(Pchar(vMensagem), 'Informação', MB_OK + MB_ICONINFORMATION);
    Result := false;
    Exit;
  end;
end;

function TComFat.verificaPendenciasNF: boolean;
var
  pMensagem: string;

  function ExisteNota: boolean;
  begin
    buscas.Close;
    buscas.SQL.Text := ' SELECT FIRST 1 NF.COD_NF, NF.NUM_NF, NF.SERIE, NF.MODELO_NF, ' +
     ' NF.EMISSAO_PROPRIA, NF.DATA_LANC, NF.STATUS, NF.SITUACAO_NFE, vnd.NOME_VENDEDOR FROM NOTAFISCAL NF ' +
     ' LEFT JOIN COLABORADOR vnd ON vnd.COD_VENDEDOR = NF.COD_VENDEDOR and vnd.COD_EMPRESA = NF.COD_EMPRESA ' +
     ' WHERE NF.COD_NF = :COD_NF AND NF.COD_EMPRESA = :COD_EMPRESA ';
    buscas.ParamByName('COD_NF').AsInteger := dataSet.FieldByName('COD_NF').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if trim(buscas.FieldByName('EMISSAO_PROPRIA').AsString) = 'S' then
      Result := not ((UpperCase(trim(buscas.FieldByName('STATUS').AsString)) = 'FECHADA')
       and (trim(buscas.FieldByName('SITUACAO_NFE').AsString) <> ''))
    else
      Result := not (UpperCase(trim(buscas.FieldByName('STATUS').AsString)) = 'FECHADA');

    if not Result then
    begin
      pMensagem := 'Documento com Nota Fiscal Fechada. Abertura não permitida ' + #13 +
        'Num NF: ' +  vDadosIni.strzero(buscas.FieldByName('NUM_NF').asinteger, 6) + #13 +
        'Colaborador: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString);
      if trim(buscas.FieldByName('EMISSAO_PROPRIA').AsString) = 'S' then
        Application.MessageBox(PChar(pMensagem), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
      else
       if Application.MessageBox(PChar(pMensagem + #13 + 'Deseja continuar?'),
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idyes then
       begin
          Result := True;
       end;

    end;
  end;
begin
 Result := True;

 if dataSet.FieldByName('COD_NF').AsInteger <= 0 then
  exit;

  if trim(dataSet.FieldByName('NATUREZA').AsString) = 'S' then
  begin
    if not ExisteNota then
    begin
      Result := False;
      exit;
    end;
  end
  else
  begin
    buscas.Close;
    buscas.SQL.Text := ' SELECT FIRST 1 cf.N_COMANDO, vnd.NOME_VENDEDOR, cf.DATA_VEN FROM COM_FAT cf' +
     ' LEFT JOIN COLABORADOR vnd ON vnd.COD_VENDEDOR = cf.COVEND_V and vnd.COD_EMPRESA = cf.COD_EMPRESA ' +
     ' WHERE cf.CHASSIV = :CHASSIV AND cf.COD_ESTMOTO = :COD_ESTMOTO ' +
     ' AND cf.COD_EMPRESA = :COD_EMPRESA AND cf.NATUREZA = ''S'' ' +
     ' AND (COALESCE(TRIM(cf.STATUS_V), '''') <> ' + QuotedStr('CANCELADO') + ')';
    buscas.ParamByName('CHASSIV').AsString := trim(vEstMoto.dataSet.FieldByName('CHASSI_C').AsString);
    buscas.ParamByName('COD_ESTMOTO').AsInteger := vEstMoto.dataSet.FieldByName('CODIGO').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if (not buscas.IsEmpty) then
    begin
      Result := False;
      pMensagem := 'Veículo informado neste documento se encontra em outro documento fechado. Abertura não permitida ' + #13 +
        'Nº Doc: ' + vDadosIni.strzero(buscas.FieldByName('N_COMANDO').asinteger, 6) + #13 +
        'Colaborador: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString);
      Application.MessageBox(PChar(pMensagem), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      Exit;
    end;

    if not ExisteNota then
    begin
      Result := False;
      exit;
    end;
  end;

end;

function TComFat.verificarImpressaoPerm(pExibirProcesso,
  pExibirMens: boolean): boolean;
var
	ConfigImp: TConfig_sistema_class;
  vStringListTiposVeic: TStringList;
  I: Integer;
begin
	try
    Result := False;

    if (trim(dataSet.FieldByName('NATUREZA').AsString) = 'E')
      and (trim(dataSet.FieldByName('STATUS_V').AsString) <> 'FECHADO') then
    begin
      ConfigImp := TConfig_sistema_class.getConf('vei_imprimir_fech', buscas, vDadosIni.cod_empresa);

      if (UpperCase(ConfigImp.ReadString('Conf_E_VEI', 'Ativa')) = 'S')
        or (UpperCase(ConfigImp.ReadString('Conf_E_VEI', 'Ativa')) = 'SIM') then
      begin
        vStringListTiposVeic := TStringList.Create;
        vStringListTiposVeic := vDadosIni.Split(UpperCase(ConfigImp.ReadString('Conf_E_VEI', 'TipV')), ',');

        for I := 0 to vStringListTiposVeic.Count - 1 do
        begin
          if trim(vStringListTiposVeic[I]) = trim(dataSet.FieldByName('TIPO_V').AsString) then
          begin
            if pExibirProcesso then
              if vDadosIni.PesqPros('VEI172', 'PERMITIR',
                '', 'COM_FAT',
                dataSet.FieldByName('N_COMANDO').AsString, buscas, true) then
              begin
                Result := True;
                Exit;
              end;

            if pExibirMens then
              Application.MessageBox(Pchar('Impressão permitida apenas para documento fechado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
            exit;
          end;
        end;
      end;
    end
    else if (trim(dataSet.FieldByName('NATUREZA').AsString) = 'S')
      and (trim(dataSet.FieldByName('STATUS_V').AsString) <> 'FECHADO') then
    begin
      ConfigImp := TConfig_sistema_class.getConf('vei_imprimir_fech', buscas, vDadosIni.cod_empresa);

      if (UpperCase(ConfigImp.ReadString('Conf_S_VEI', 'Ativa')) = 'S')
        or (UpperCase(ConfigImp.ReadString('Conf_S_VEI', 'Ativa')) = 'SIM') then
      begin
        vStringListTiposVeic := TStringList.Create;
        vStringListTiposVeic := vDadosIni.Split(UpperCase(ConfigImp.ReadString('Conf_S_VEI', 'TipV')), ',');

        for I := 0 to vStringListTiposVeic.Count - 1 do
        begin
          if trim(vStringListTiposVeic[I]) = trim(dataSet.FieldByName('TIPO_V').AsString) then
          begin
            if pExibirProcesso then
              if vDadosIni.PesqPros('VEI173', 'PERMITIR',
                '', 'COM_FAT',
                dataSet.FieldByName('N_COMANDO').AsString, buscas, true) then
              begin
                Result := True;
                Exit;
              end;

            if pExibirMens then
              Application.MessageBox(Pchar('Impressão permitida apenas para documento fechado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
            exit;
          end;
        end;
      end;
    end;

    Result := True;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TComFat.verificarNotasFiscaisSuzuki;
var
  Aconf: TConfig_sistema_class;
  nf_verificar_suzuki: Tnf_verificar_suzuki;
	vDataBanco: TDateTime;
begin
	if vDadosIni.retornaDadosSuzuki(buscas) = '' then
  	Exit;

  if vDadosIni.vSuzuki.vVerificarNotasFiscais <> 'S' then
  	Exit;

  vDataBanco := vDadosIni.getDataBanco(buscas);

  if trim(vDadosIni.vSuzuki.vDataUltimaVerificacao) = '' then
  	vDadosIni.vSuzuki.vDataUltimaVerificacao := FormatDateTime('dd/mm/yyyy', vDataBanco - 1)
  else
  begin
    try
    	StrToDateTime(vDadosIni.vSuzuki.vDataUltimaVerificacao);
    except
    	vDadosIni.vSuzuki.vDataUltimaVerificacao := FormatDateTime('dd/mm/yyyy', vDataBanco - 1);
    end;
  end;

  if trim(vDadosIni.vSuzuki.vNotasFiscaisApartir) = '' then
  	vDadosIni.vSuzuki.vNotasFiscaisApartir := FormatDateTime('dd/mm/yyyy', vDataBanco - 1)
  else
  begin
    try
    	StrToDateTime(vDadosIni.vSuzuki.vNotasFiscaisApartir);
    except
    	vDadosIni.vSuzuki.vNotasFiscaisApartir := FormatDateTime('dd/mm/yyyy', vDataBanco - 1);
    end;
  end;

  if vDataBanco <> StrToDateTime(vDadosIni.vSuzuki.vDataUltimaVerificacao) then
  begin
  	try
    	Aconf := TConfig_sistema_class.getConf('vei_codmarca', buscas, vDadosIni.cod_empresa);
      
      buscas.Close;
      buscas.SQL.Text := ' select first 1 ' +
        ' vw_notafiscal_integ.cod_nf, ' +
        ' vw_notafiscal_integ.cod_empresa ' +
        ' from vw_notafiscal_integ ' +
        ' where vw_notafiscal_integ.data_lanc >= :data_lanc ' +
        ' and vw_notafiscal_integ.cod_empresa = :cod_empresa ' +
        ' and vw_notafiscal_integ.cod_marca in ' + vDadosIni.vSuzuki.vCodMarcas +
        ' and coalesce(vw_notafiscal_integ.id_protocolo, 0) <= 0 ';
      buscas.ParamByName('data_lanc').AsDateTime := StrToDateTime(vDadosIni.vSuzuki.vNotasFiscaisApartir);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

      if not buscas.IsEmpty then
      begin
        if vDadosIni.vNotaFiscal.AHandle = 0 then
          CarregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);

        if vDadosIni.vNotaFiscal.AHandle = 0 then
        begin
          vDadosIni.ShowAtencao('Pacote Nota Fiscal não carregado');
          Exit;
        end;

        Aconf.WriteString('SUZUKI', 'DataUltimaVerificacao', FormatDateTime('dd/mm/yyyy', vDataBanco));
      	Aconf.SaveConfDB(buscas);

        if buscas.Transaction.InTransaction then
          buscas.Transaction.Commit;

        @nf_verificar_suzuki := GetProcAddress(vDadosIni.vNotaFiscal.AHandle, PChar('nf_verificar_suzuki'));
        if Assigned(nf_verificar_suzuki) then
          nf_verificar_suzuki(StrToDateTime(vDadosIni.vSuzuki.vNotasFiscaisApartir));
      end;
    finally
      FreeAndNil(Aconf);
    end;
  end;
end;

function TComFat.VerificaSaldo(vtp: integer): boolean;
var
  vvalat, vvalrst, vvaloutros, vvalarec, vvalnf, vvalgeral: real;
  vvaldin: real;
  vitx: integer;
begin
//
  result := true;
  dtSetPlano.first;
  if vtp = 1 then
  begin
    vitx := 1;
    while not dtSetPlano.eof do
    begin
      vitx := vitx + 1;
      dtSetPlano.next;
    end;
//    if vitx > 5 then
//    begin
//      Application.MessageBox('Qtde de linhas > 5', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
//      result := false;
//      exit;
//    end;
    dtSetPlano.first;
  end;
  vvalat := 0;
  vvalrst := 0;
  vvalarec := 0;
  vvalnf := 0;
  vvaloutros := 0;
  vvaldin := 0;
  while not dtSetPlano.eof do
  begin
    if (dtSetPlano.FieldByName('TpLanc').AsString = 'C') or (dtSetPlano.FieldByName('Controle').AsString = 'FRETE') or
      (dtSetPlano.FieldByName('Controle').AsString = 'MTUSADAS') or (dtSetPlano.FieldByName('Controle').AsString = 'RECIBOSANT') then
    begin
      if (pos('INTERMEDIACAO', dtSetPlano.FieldByName('Controle').AsString) = 0) and
        (pos('RETORNO', dtSetPlano.FieldByName('Controle').AsString) = 0) and
         (pos('OUTROS', dtSetPlano.FieldByName('Controle').AsString) = 0) then
        vvalnf := vvalnf + dtSetPlano.FieldByName('Valor').AsFloat
    end;
    if (pos('INTERMEDIACAO', dtSetPlano.FieldByName('Controle').AsString) > 0) or
       (pos('RETORNO', dtSetPlano.FieldByName('Controle').AsString) > 0) or
       (pos('OUTROS', dtSetPlano.FieldByName('Controle').AsString) > 0) then
        vvaloutros := vvaloutros + dtSetPlano.FieldByName('Valor').AsFloat;
    if trim(dtSetPlano.FieldByName('Controle').AsString) = 'DINHEIRO' then
      vvaldin := vvaldin + dtSetPlano.FieldByName('Valor').AsFloat;
    vvalat := vvalat + dtSetPlano.FieldByName('Valor').value;
    dtSetPlano.next;
  end;
  if vtp = 1 then
  begin
    vvalat := StrToFloat(Format('%0.2f', [vvalat + frmMovVeiculosCCIA.EditHw5.AsValue]));
    vvalgeral := StrToFloat(Format('%0.2f', [frmMovVeiculosCCIA.EditHw1.AsValue]));

    if (vvalat > vvalgeral) then
    begin
      raiseExceptionCreate('Valor a ser atingido será maior que o Total da Operação', 'EditHw5');
      result := false;
      exit;
    end;
  end
  else
  begin
    frmMovVeiculosCCIA.EditHw6.AsValue := vvalat;
    frmMovVeiculosCCIA.EditHw7.AsValue := frmMovVeiculosCCIA.EditHw1.AsValue - frmMovVeiculosCCIA.EditHw6.AsValue;
    frmMovVeiculosCCIA.EditHw3.AsValue := vvalnf + vvaldin;
//    frmMovVeiculosCCIA.EditHw4.AsValue := vvalnf;
     frmMovVeiculosCCIA.EditHw4.AsValue := vvalnf + vvaldin;
    frmMovVeiculosCCIA.label67.caption := 'Valor da NF entre ' + Format('%n', [vvalnf]) + ' e ' + Format('%n', [vvalnf + vvaldin]);
    vminNF := vvalnf;
    vmaxNF := vvalnf + vvaldin;
  end;
end;

function TComFat.verplanopag(vtp: integer; vCodigo: Integer = 0; vChassi: string= ''): boolean;
var
  vcod, vcodmod: integer;
  vMod: string;
begin

  if vtp = 1 then
  begin
    if (dataSet.FieldByName('N_COMANDO').asstring <> '') and (not dtSetPlano.IsEmpty) then
    begin
      ExecutaComandosSql('delete from plano_pag where nrequisicao = ' +
        dataSet.FieldByName('N_COMANDO').asstring + ' and tpdocs = ''MOT'' and cod_empresa = ' +
        dataSet.FieldByName('COD_EMPRESA').asstring);

      dtSetPlano.first;
      while not dtSetPlano.eof do
      begin
        vcod := GenCodigo('PLANO_PAG', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);

        buscas.close;
        buscas.sql.text := 'INSERT INTO PLANO_PAG(SEQPLANO,COD_EMPRESA,' +
          'NREQUISICAO,TIPDOC,COD_CONTROLE,COD_CLIENTE,HISTORICO,DATA_MOV,' +
          'VALORDOC,TPDOCS,TIP_CNT,NOME_CTRL,ENTRVALOR,VALOROPERACAO,VALOR_REAL,VALOR_NF,CHASSIV,COD_ESTMOTO) VALUES(:SEQPLANO,:COD_EMPRESA,:NREQUISICAO,:TIPDOC,' +
          ':COD_CONTROLE,:COD_CLIENTE,:HISTORICO,:DATA_MOV,:VALORDOC,:TPDOCS,' +
          ':TIP_CNT,:NOME_CTRL,:ENTRVALOR,:VALOROPERACAO,:VALOR_REAL,:VALOR_NF,:CHASSIV,:COD_ESTMOTO)';
        buscas.ParamByName('SEQPLANO').asinteger := vcod;
        buscas.ParamByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codEmpresa);
        buscas.ParamByName('NREQUISICAO').AsInteger := dataSet.FieldByName('N_COMANDO').AsInteger;
        buscas.ParamByName('TIPDOC').value := dtSetPlano.FieldByName('TIPDOC').asstring;
        buscas.ParamByName('COD_CONTROLE').AsInteger := dtSetPlano.FieldByName('COD_CONTROLE').AsInteger;
        buscas.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('CLIENTES_V').AsInteger;
        buscas.ParamByName('HISTORICO').AsString := dtSetPlano.FieldByName('Historico').AsString;
        buscas.ParamByName('CHASSIV').AsString := dtSetPlano.FieldByName('CHASSIV').AsString;
        buscas.ParamByName('COD_ESTMOTO').AsInteger := dtSetPlano.FieldByName('COD_ESTMOTO').AsInteger;
        buscas.ParamByName('DATA_MOV').AsDate := dataSet.FieldByName('DATA_VEN').AsDateTime;
        buscas.ParamByName('VALORDOC').AsCurrency := dtSetPlano.FieldByName('Valor').AsCurrency;
        buscas.ParamByName('TPDOCS').AsString := 'MOT';
        buscas.ParamByName('TIP_CNT').AsString := dtSetPlano.FieldByName('TpLanc').AsString;
        buscas.ParamByName('NOME_CTRL').AsString := dtSetPlano.FieldByName('Controle').AsString;
        buscas.ParamByName('ENTRVALOR').AsString := dtSetPlano.FieldByName('EntrValor').AsString;
        buscas.ParamByName('VALOROPERACAO').AsCurrency := frmMovVeiculosCCIA.EditHw1.AsValue;
        buscas.ParamByName('VALOR_REAL').AsCurrency := frmMovVeiculosCCIA.EditHw2.AsValue;
        buscas.ParamByName('VALOR_NF').AsCurrency := frmMovVeiculosCCIA.EditHw4.AsValue;
        buscas.Prepare;
        buscas.ExecSQL;
        dtSetPlano.Next;
      end;
    end;
  end
  else if vtp = 4 then
  begin
    Result := True;

    buscas.close;
    buscas.sql.text := ' SELECT CODIGO, CHASSI_C, VERSAOEST, DESCRICAO_VERSAOEST FROM EST_MOTO ' +
     ' WHERE CODIGO = ' + IntToStr(vCodigoOld) +
     ' AND CHASSI_C = ' + QuotedStr(trim(vChassiOld)) +
     ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if not buscas.IsEmpty then
    begin
      vcodmod := buscas.FieldByName('VERSAOEST').AsInteger;
      vMod := buscas.FieldByName('DESCRICAO_VERSAOEST').AsString;

      buscas.close;
      buscas.sql.text := ' SELECT CODIGO, CHASSI_C, VERSAOEST, DESCRICAO_VERSAOEST FROM EST_MOTO ' +
       ' WHERE CODIGO = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
       ' AND CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
       ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas.Open;
      if not buscas.IsEmpty then
      begin
        if vcodmod <> buscas.FieldByName('VERSAOEST').AsInteger then
        begin
          Application.MessageBox(PChar('Modelo do novo veículo informado diferente do modelo informado anteriormente!' +
          #13 + 'Modelo Atual = ' + IntToStr(vcodmod) + ' - ' + trim(vMod) + ', ' + Trim(vChassiOld) +
          #13 + 'Modelo Anterior = ' + IntToStr(buscas.FieldByName('VERSAOEST').AsInteger) + ' - '
          + trim(buscas.FieldByName('DESCRICAO_VERSAOEST').AsString) + ', ' + Trim(dataSet.FieldByName('CHASSIV').AsString) +
          #13 + 'Os valores do ' + vSing.vNomeContrato + ' foram removidos!'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          dataSet.FieldByName('VALOR_REAL').AsFloat := 0;
          dataSet.FieldByName('VALOR_A_REC').AsFloat := 0;
          dataSet.FieldByName('VALOBS1').AsFloat := 0;
          dataSet.FieldByName('VALOBS2').AsFloat := 0;
          dataSet.FieldByName('VALOBS3').AsFloat := 0;
          dataSet.FieldByName('VALOBS4').AsFloat := 0;
          dataSet.FieldByName('VALOBS5').AsFloat := 0;
          dataSet.FieldByName('OBS1').AsString := '';
          dataSet.FieldByName('OBS2').AsString := '';
          dataSet.FieldByName('OBS3').AsString := '';
          dataSet.FieldByName('OBS4').AsString := '';
          dataSet.FieldByName('OBS5').AsString := '';
          dtSetPlano.EmptyDataSet;
          ExecutaComandosSql('delete from plano_pag where nrequisicao = ' +
           dataSet.FieldByName('N_COMANDO').asstring + ' and tpdocs = ''MOT'' and cod_empresa = ' +
           dataSet.FieldByName('COD_EMPRESA').asstring);
        end;
      end;
    end;
  end
  else
  begin
    if dataSet.FieldByName('N_COMANDO').AsInteger <> 0 then
    begin
      dtSetPlano.EmptyDataSet;
      buscas.Close;
      buscas.SQL.Text := 'select pl.* from plano_pag pl where pl.tpdocs = ''MOT''' +
        ' and pl.nrequisicao = ' + dataSet.FieldByName('N_COMANDO').AsString +
        ' and pl.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if not buscas.isempty then
      begin
        while not Buscas.eof do
        begin
          dtSetPlano.append;
          dtSetPlano.FieldByName('Controle').AsString := buscas.fieldbyname('nome_ctrl').AsString;
          dtSetPlano.FieldByName('Cod_Controle').AsInteger := buscas.fieldbyname('cod_controle').AsInteger;
          dtSetPlano.FieldByName('Historico').AsString := buscas.fieldbyname('historico').AsString;
          dtSetPlano.FieldByName('Chassiv').AsString := buscas.fieldbyname('chassiv').AsString;
          dtSetPlano.FieldByName('cod_estmoto').AsInteger := buscas.fieldbyname('cod_estmoto').AsInteger;
          dtSetPlano.FieldByName('Valor').AsCurrency := buscas.fieldbyname('valordoc').AsCurrency;
          dtSetPlano.FieldByName('TpLanc').AsString := buscas.fieldbyname('TIP_CNT').AsString;
          dtSetPlano.FieldByName('EntrValor').AsString := buscas.fieldbyname('ENTRVALOR').AsString;
          dtSetPlano.FieldByName('TIPDOC').AsString := buscas.fieldbyname('TIPDOC').AsString;
          dtSetPlano.Post;
          buscas.next;
        end;
        frmMovVeiculosCCIA.EditHw1.AsValue := buscas.fieldbyname('VALOROPERACAO').AsCurrency;
        frmMovVeiculosCCIA.EditHw2.AsValue := buscas.fieldbyname('VALOR_REAL').AsCurrency;
        frmMovVeiculosCCIA.EditHw4.AsValue := buscas.fieldbyname('VALOR_NF').AsCurrency;
      end;
    end;
  end;
end;

function TComFat.vervalorminimo: boolean;
begin
  Result:=true;

  Buscas.close;
  Buscas.sql.text:='select coalesce(FATURAMENTO,''N'') as valor FROM NAT_OP ' +
   ' WHERE CODIGO_NOP = ' + dataSet.FieldByName('NATOP_V').AsString;
  Buscas.Open;

 if Buscas.fieldbyname('VALOR').AsString = 'S' then
 begin
   Buscas.close;
   Buscas.SQL.text:='SELECT * FROM TABPRECO_VEICULO WHERE COD_VEICULO = '+IntToStr(vcodveic)+
     ' and ANO_FAB = '+IntToStr(vanofab)+' and ANO_MOD = '+IntToStr(vanomod)+' and '+
     ' cod_empresa = '+ vDadosIni.codEmpresa;
   Buscas.Open;
   if not Buscas.IsEmpty then
   begin
     if (StrToFloat(Format('%0.2f',[dataset.FieldByName('VALOR_REAL').AsCurrency])) <
     StrToFloat(Format('%0.2f',[Buscas.FieldByName('PREC_MIN').AsCurrency]))) or
     (StrToFloat(Format('%0.2f',[dataset.FieldByName('PRVEN_V').AsCurrency])) < StrToFloat(Format('%0.2f',[Buscas.FieldByName('PREC_MIN').AsCurrency]))) then
     begin
     Application.MessageBox('Valor da NF ou Valor da Operação ou Valor Real do Produto menor que o preço mínimo suportado!', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
      if not vDadosIni.PesqPros('VEI097', 'PERMITIR', '', 'COM_FAT', dataset.FieldByName('chassiv').asstring,  Buscas, true) then
        result:=false;
     end;
   end
   else
   begin
     Application.MessageBox('Valor mínimo para este modelo de Veículo não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
     if not vDadosIni.PesqPros('VEI098', 'PERMITIR', '', 'COM_FAT', dataset.FieldByName('chassiv').asstring,  Buscas, true) then
      result:=false
   end;
 end;
 Buscas.Close;
end;

procedure TComFat._desmarcarTodos(datasettemp: TClientDataSet);
begin
  try
    if not datasettemp.Active then
      Exit;

    datasettemp.First;
    while not datasettemp.Eof do
    begin
      datasettemp.Edit;
      datasettemp.FieldByName('sel').AsString := '';
      datasettemp.Post;
      datasettemp.Next;
    end;
    datasettemp.First;

  finally
  end;
end;

procedure TComFat._marcaDesmarcaLinha(datasettemp: TClientDataSet);
begin
  if datasettemp.IsEmpty then
    exit;

  datasettemp.Edit;
  if datasettemp.FieldByName('SEL').AsString = 'S' then
    datasettemp.FieldByName('SEL').AsString := ''
  else
    datasettemp.FieldByName('SEL').AsString := 'S';
  datasettemp.Post;
end;

procedure TComFat._marcarTodos(datasettemp: TClientDataSet);
begin
 try
 	  if not datasettemp.Active then
      Exit;

    datasettemp.First;
    while not datasettemp.Eof do
    begin
      datasettemp.Edit;
      datasettemp.FieldByName('sel').AsString := 'S';
      datasettemp.Post;
      datasettemp.Next;
    end;
    datasettemp.First;

  finally
  end;
end;

function TComFat._mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

function TComFat._VerificarComando(pData: TDateTime; pTipVeiculo: string): boolean;
var
 buscas4, buscas5: TIBQuery;
 function TestarData: boolean;
 begin
   Result := False;

   if not buscas4.IsEmpty then
   begin
     while not buscas4.Eof do
     begin
       if (not buscas4.FieldByName('DATA').IsNull)
       and (UpperCase(trim(buscas4.FieldByName('STATUS_NFE').AsString)) = 'FECHADA') then
         if buscas4.FieldByName('DATA').AsDateTime > pData then
         begin
           Result := True;
           Break;
         end;
         buscas4.Next;
     end;
   end;
 end;

begin
  Result := False;

  buscas4 := TIBQuery.Create(Application);
  buscas4.Database := buscas.Database;
  buscas4.Transaction := buscas.Transaction;

  buscas4.Close;
  buscas4.SQL.Text := ' select h.numdoc, h.num_nota, h.serie, h.modelo_nf, h.data, ' +
   ' h.status_nfe, h.situacao_nfe, h.codigo from hist_estmoto h ' +
   ' where h.chassi_c = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
   ' and h.codigo =  ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
   ' and h.cod_empresa = ' + vDadosIni.codEmpresa +
   ' and h.tipo = ''NF'' and h.natureza = ''E'' order by h.data desc ';
  buscas4.Open;
  buscas4.FetchAll;

  if buscas4.IsEmpty then
  begin
     buscas4.Close;
     buscas4.SQL.Text := ' select h.numdoc, h.num_nota, h.serie, h.modelo_nf, h.data, ' +
      ' h.status_nfe, h.situacao_nfe, h.codigo from hist_estmoto h ' +
      ' where h.chassi_c = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
      ' and h.codigo = 0 ' +
      ' and h.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and h.tipo = ''NF'' and h.natureza = ''E'' order by h.data desc ';
     buscas4.Open;
     buscas4.FetchAll;
  end;

  if TestarData then
    Result := True;

  if not Result then
  begin
    if trim(pTipVeiculo) = 'D' then
    begin
      if Application.MessageBox('Veículo com pendência de Nota Fiscal de Retorno de Entrada em Demonstração, deseja continuar?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
       exit;

      if not vDadosIni.PesqPros('VEI122', 'PERMITIR', 'CHASSI - ' + dataSet.FieldByName('CHASSIV').AsString + '', 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas, true) then
        Result := True;
    end;
  end;
end;

function TComFat._VerificarContratos(var pMensagem: string): boolean;
begin
  Result := True;

 try
   if (vDadosIni.vEmp.vTipoEmpVeiculos = 'A') then
   begin
      if trim(vEstMoto.dataSet.FieldByName('MODELO_CFT').AsString) = '' then
      begin
        if (trim(dataSet.FieldByName('MODELO').AsString) = 'CTRVND') or (trim(dataSet.FieldByName('MODELO').AsString) = 'CTRRESDOM')  then
        begin
          Result := False;
          pMensagem := 'Nenhum Contrato de Compra para Veículo: ' + dataSet.FieldByName('CHASSIV').AsString + #13 +
            'Favor emitir o contrato para continuar!';
        end
        else if trim(dataSet.FieldByName('MODELO').AsString) = 'CTRVNDCONS' then
        begin
          Result := False;
          pMensagem := 'Nenhum Contrato de Entrada em Consignação para Veículo: ' + dataSet.FieldByName('CHASSIV').AsString + #13 +
            'Favor emitir o contrato para continuar!';
        end;
      end;
   end
   else if dataSet.FieldByName('NATUREZA').AsString = 'S' then
   begin
      if trim(vEstMoto.dataSet.FieldByName('MODELO_CFT').AsString) = '' then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select cf.N_COMANDO, vnd.NOME_VENDEDOR, cf.NUM_NOTA_V, cf.NATUREZA, cf.TIPO, cf.TIPV_VEICULO, cf.STATUS_V from com_fat cf' +
         ' left join colaborador vnd on vnd.COD_VENDEDOR = cf.COVEND_V and vnd.COD_EMPRESA = cf.COD_EMPRESA ' +
         ' where cf.chassiv = ' + QuotedStr(dataset.fieldbyname('CHASSIV').asstring) +
         ' and cf.natureza = ' + QuotedStr('E') +
         ' and cf.cod_estmoto = ' + IntToStr(dataset.FieldByName('COD_ESTMOTO').AsInteger) +
         ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
         ' and cf.ativo=1 and cf.cod_empresa = vnd.cod_empresa ' +
         ' order by cf.n_comando desc ';
        buscas.Open;
        buscas.First;

        if not buscas.IsEmpty then
        begin
          while not buscas.Eof do
          begin
            if (UpperCase(Trim(buscas.FieldByName('STATUS_V').AsString)) <> 'FECHADO') and
            (UpperCase(Trim(buscas.FieldByName('STATUS_V').AsString)) <> 'CANCELADO') then
            begin
              Result := False;
              pMensagem := 'Veículo pendente no Contrato: ' + vDadosIni.strzero(buscas.FieldByName('N_COMANDO').asinteger, 6) + #13 +
                'Colaborador: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString);
            end;
            buscas.Next;
          end;
        end;
      end;
   end;
 finally
 end;
end;

function TComFat._VerificarDemonstracao(var pMensagem: string; pNComando: Integer; pData: TDateTime; pTipVeiculo, vProcPend: string): boolean;
var
 buscas4, buscas5: TIBQuery;
begin
  Result := True;

  if dataSet.FieldByName('NATUREZA').AsString <> 'S' then
    exit;

  buscas4 := TIBQuery.Create(Application);
  buscas4.Database := buscas.Database;
  buscas4.Transaction := buscas.Transaction;

  buscas5 := TIBQuery.Create(Application);
  buscas5.Database := buscas.Database;
  buscas5.Transaction := buscas.Transaction;

  buscas4.close;
  buscas4.SQL.Text := ' select cf.*, vnd.nome_vendedor from com_fat cf ' +
    ' left join colaborador vnd on vnd.cod_vendedor = cf.covend_v and vnd.COD_EMPRESA = cf.cod_empresa ' +
    ' where cf.chassiv = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
    ' and cf.natureza = ' + QuotedStr(dataset.fieldbyname('NATUREZA').asstring) +
    ' and cf.cod_estmoto = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
    ' and cf.tipv_veiculo = ''D'' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and (upper(trim(coalesce(cf.status_v, ''''))) <> ''CANCELADO'') ' +
    ' and cf.n_comando <> ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
    ' and cf.ativo = 1 order by cf.data_ven desc';
  buscas4.open;
  buscas4.FetchAll;

  if buscas4.isEmpty then
  begin
    buscas4.close;
    buscas4.SQL.Text := ' select cf.*, vnd.nome_vendedor from com_fat cf ' +
      ' left join colaborador vnd on vnd.cod_vendedor = cf.covend_v and vnd.COD_EMPRESA = cf.cod_empresa ' +
      ' where cf.chassiv = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
      ' and cf.natureza = ' + QuotedStr(dataset.fieldbyname('NATUREZA').asstring) +
      ' and cf.cod_estmoto = 0 ' +
      ' and cf.tipv_veiculo = ''D'' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and (upper(trim(coalesce(cf.status_v, ''''))) <> ''CANCELADO'') ' +
      ' and cf.n_comando <> ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
      ' and cf.ativo = 1 order by cf.data_ven desc';
    buscas4.open;
    buscas4.FetchAll;
  end;

  if not buscas4.isEmpty then
  begin
    buscas4.First;
    while not buscas4.Eof do
    begin
      if buscas4.FieldByName('N_COMANDO').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger then
      begin
        if (trim(buscas4.FieldByName('SITUACAO').AsString) <> 'RETORNADO') and
          (trim(buscas4.FieldByName('STATUS_V').AsString) <> 'CANCELADO') then
        begin
          Result := False;
          pMensagem := 'Veículo em Demonstração não retornado! '
          + #13 + 'Documento: ' + vDadosIni.strzero(buscas4.FieldByName('N_COMANDO').asinteger, 6)
          + #13 + 'Colaborador: ' + trim(buscas4.FieldByName('NOME_VENDEDOR').AsString)
          + #13 + 'Favor realizar o Retorno de Entrada em Demonstração ';
          exit;
        end;
      end;
      buscas4.Next;
    end;
  end;

//  if Result then
//  begin
//    if dataSet.FieldByName('TIPV_VEICULO').AsString <> 'R' then
//    begin
//      buscas4.close;
//      buscas4.SQL.Text := ' select est.*, nf.num_nf, vnd.nome_vendedor from est_moto est ' +
//        ' left join notafiscal nf on nf.cod_nf = est.cod_nf and nf.cod_empresa = est.cod_empresa ' +
//        ' left join colaborador vnd on vnd.cod_vendedor = nf.cod_vendedor and vnd.cod_empresa = nf.cod_empresa ' +
//        ' where est.chassi_c = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
//        ' and est.codigo = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
//        ' and est.tipv_veiculo = ''D'' and est.COD_EMPRESA = ' + vDadosIni.codEmpresa +
//        ' and est.ativo = 1 order by est.data_ven desc';
//      buscas4.open;
//      buscas4.FetchAll;
//
//      if not buscas4.isEmpty then
//      begin
//         Result := False;
//         pMensagem := 'Veículo em Demonstração não retornado!'
//         + #13 + 'Num NF: ' + vDadosIni.strzero(buscas4.FieldByName('NUM_NF').asinteger, 6)
//         + #13 + 'Colaborador: ' + trim(buscas4.FieldByName('NOME_VENDEDOR').AsString)
//         + #13 + 'Favor realizar o Retorno de Saída em Demonstração';
//         exit;
//      end;
//    end;
//  end;

  if Result then
  begin
    buscas4.close;
    buscas4.SQL.Text := ' select cf.*, vnd.nome_vendedor from com_fat cf ' +
      ' left join colaborador vnd on vnd.cod_vendedor = cf.covend_v and vnd.COD_EMPRESA = cf.cod_empresa ' +
      ' where cf.chassiv = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
      ' and cf.natureza = ' + QuotedStr(dataset.fieldbyname('NATUREZA').asstring) +
      ' and cf.cod_estmoto = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
      ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and (upper(trim(coalesce(cf.status_v, ''''))) <> ''CANCELADO'') ' +
      ' and cf.n_comando <> ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
      ' and cf.ativo = 1 order by cf.data_ven desc';
    buscas4.open;
    buscas4.FetchAll;

    if buscas4.isEmpty then
    begin
      buscas4.close;
      buscas4.SQL.Text := ' select cf.*, vnd.nome_vendedor from com_fat cf ' +
        ' left join colaborador vnd on vnd.cod_vendedor = cf.covend_v and vnd.COD_EMPRESA = cf.cod_empresa ' +
        ' where cf.chassiv = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
        ' and cf.natureza = ' + QuotedStr(dataset.fieldbyname('NATUREZA').asstring) +
        ' and cf.cod_estmoto = 0 ' +
        ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and (upper(trim(coalesce(cf.status_v, ''''))) <> ''CANCELADO'') ' +
        ' and cf.n_comando <> ' + IntToStr(dataSet.FieldByName('N_COMANDO').AsInteger) +
        ' and cf.ativo = 1 order by cf.data_ven desc';
      buscas4.open;
      buscas4.FetchAll;
    end;

    if buscas4.isEmpty then
      exit;
  end;

  if Result then
  begin
     buscas4.Close;
     buscas4.SQL.Text := ' select h.cod_hist, h.numdoc, h.num_nota, h.serie, h.modelo_nf, h.data, ' +
      ' h.status_nfe, h.situacao_nfe, h.emissao_propria, h.codigo from hist_estmoto h ' +
      ' where h.chassi_c = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
      ' and h.codigo =  ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
      ' and h.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and h.tipo = ''NF'' and h.natureza = ''E'' order by h.data desc ';
     buscas4.Open;
     buscas4.FetchAll;

     if buscas4.IsEmpty then
     begin
        buscas4.Close;
        buscas4.SQL.Text := ' select h.cod_hist, h.numdoc, h.num_nota, h.serie, h.modelo_nf, h.data, ' +
         ' h.status_nfe, h.situacao_nfe, h.emissao_propria, h.codigo from hist_estmoto h ' +
         ' where h.chassi_c = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
         ' and h.codigo = 0 ' +
         ' and h.cod_empresa = ' + vDadosIni.codEmpresa +
         ' and h.tipo = ''NF'' and h.natureza = ''E'' order by h.data desc ';
        buscas4.Open;
        buscas4.FetchAll;
     end;
     if not buscas4.IsEmpty then
     begin
       Result := False;

       buscas5.Close;
       buscas5.SQL.Text := ' select cf.N_COMANDO, cf.DATA_VEN, vnd.NOME_VENDEDOR, cf.NUM_NOTA_V, cf.NATUREZA, cf.TIPO, cf.TIPV_VEICULO, cf.STATUS_V from com_fat cf' +
        ' left join colaborador vnd on vnd.COD_VENDEDOR = cf.COVEND_V and vnd.COD_EMPRESA = cf.COD_EMPRESA ' +
        ' where cf.n_comando = ' + IntToStr(pNComando) +
        ' and cf.natureza = ' + QuotedStr(dataset.fieldbyname('NATUREZA').asstring) +
        ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and (upper(trim(coalesce(cf.status_v, ''''))) <> ''CANCELADO'') ' +
        ' and cf.ativo=1 order by cf.n_comando desc ';
       buscas5.Open;

       if not buscas5.IsEmpty then
       begin
         pMensagem := 'Veículo em Demonstração não retornado! '
          + #13 + 'Documento: ' + vDadosIni.strzero(buscas5.FieldByName('N_COMANDO').asinteger, 6)
          + #13 + 'Colaborador: ' + trim(buscas5.FieldByName('NOME_VENDEDOR').AsString)
          + #13 + 'Favor realizar o Retorno de Entrada em Demonstração ';
       end
       else
       begin
         pMensagem := 'Veículo em Demonstração não retornado! '
          + #13 + 'Favor realizar o Retorno de Entrada em Demonstração ';
       end;
       while not buscas4.Eof do
       begin
         if (not buscas4.FieldByName('DATA').IsNull)
         and (((UpperCase(trim(buscas4.FieldByName('EMISSAO_PROPRIA').AsString)) = 'S')
         and (UpperCase(trim(buscas4.FieldByName('STATUS_NFE').AsString)) = 'FECHADA')
         and (UpperCase(trim(buscas4.FieldByName('SITUACAO_NFE').AsString)) = 'AUTORIZADA'))
         or ((UpperCase(trim(buscas4.FieldByName('EMISSAO_PROPRIA').AsString)) = 'N')
         and (UpperCase(trim(buscas4.FieldByName('STATUS_NFE').AsString)) = 'FECHADA'))) then
           if (buscas4.FieldByName('DATA').AsDateTime > pData) then
           begin
             Result := True;
             vVerificarDemonstr := False;
             Break;
           end
           else if (buscas4.FieldByName('DATA').AsDateTime = pData) then
           begin
             buscas5.Close;
             buscas5.SQL.Text := ' select h.cod_hist, h.numdoc, h.num_nota, h.serie, h.modelo_nf, h.data, ' +
              ' h.status_nfe, h.situacao_nfe, h.emissao_propria, h.codigo from hist_estmoto h ' +
              ' where (trim(coalesce(h.tipo, '''')) = ''CFT'') ' +
              ' and h.numdoc = ' + IntToStr(pNComando) +
              ' and h.cod_empresa = ' + vDadosIni.codEmpresa;
             buscas5.Open;

             if not buscas5.IsEmpty then
             begin
               if (buscas4.FieldByName('COD_HIST').AsInteger > buscas5.FieldByName('COD_HIST').AsInteger) then
               begin
                 Result := True;
                 vVerificarDemonstr := False;
                 Break;
               end;
             end;
           end;
           buscas4.Next;
       end;
     end;
  end;

  if not Result then
  begin
    if trim(pTipVeiculo) = 'D' then
    begin
       if trim(vProcPend) = 'S' then
       begin
         Application.MessageBox(pchar('Nota Fiscal de Retorno de Entrada em Demonstração não encontrada!'),
          'Atenção', MB_ICONERROR + MB_OK);
         if vDadosIni.PesqPros('VEI122', 'PERMITIR', 'CHASSI - ' + dataSet.FieldByName('CHASSIV').AsString + '', 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas4, true) then
         begin
           Result := True;
           vVerificarDemonstr := False;
         end;
       end
       else
       begin
         vDadosIni.vInibeMensPesqPros := 'S';
		     if not vDadosIni.PesqPros('VEI167', 'DESATIVAR', '', 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString, buscas, false) then
         begin
        	if vMensDemonst then
         		if Application.MessageBox('Nota Fiscal de Retorno de Entrada em Demonstração não encontrada!' +
         			 #13 + 'Deseja continuar mesmo assim?',
          		'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
          		 exit;
         end;

         Result := True;
         vVerificarDemonstr := False;
         vMensDemonst := False;
       end;
    end
    else
    begin
        if buscas.FieldByName('N_COMANDO').asinteger = dataSet.FieldByName('N_COMANDO').asinteger then
        begin
          Result := true;
          Exit;
        end;

        if (buscas.FieldByName('TIPO').AsString = 'CTR') then
          pMensagem := 'Veículo pendente no Contrato: ' + vDadosIni.strzero(buscas.FieldByName('N_COMANDO').asinteger, 6) + #13 +
            'Colaborador: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString)
        else
           pMensagem := 'Veículo pendente no Comando: ' + vDadosIni.strzero(buscas.FieldByName('N_COMANDO').asinteger, 6) + #13 +
                      'Colaborador: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString);
    end;
  end;
end;

function TComFat._VerificarEstoqueVeiculo(buscas2: TIBQuery; pTp: Integer = 0): Boolean;
var
 vSqlTmp: string;
 DBEditChassi: string;
begin
  try
    vSqlTmp := '';
    DBEditChassi := '';

    if vSing.vMod = 'CFT' then
      DBEditChassi := 'DBEdit2'
    else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
      DBEditChassi := 'DBEdit48'
    else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
      DBEditChassi := 'DBEdit56'
    else if vSing.vMod = 'CTRVNDCONS' then
      DBEditChassi := 'DBEdit16';

    if (vSing.vTipoVenda = 'N') then
     vSqlTmp := vSqlTmp + ' AND STATUS_USO = ''N'''
    else
     vSqlTmp := vSqlTmp + ' AND STATUS_USO = ''U''';

    if (vSing.vTipoVendaCFOP = 'I') then
      vSqlTmp := vSqlTmp + ' AND (COALESCE(STATUS_ESTOQUE, ''N'') = ''N'') AND COALESCE(NUM_NOTA, 0) = 0 '
    else if (vSing.vNatureza = 'S') then
      if (vSing.vTipoVendaCFOP = 'O') then
      begin
        if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
          vSqlTmp := vSqlTmp + ' AND STATUS_ESTOQUE = ''S'' AND COALESCE(NUM_NOTA, 0) > 0 '
        else
          vSqlTmp := vSqlTmp + ' AND (COALESCE(STATUS_ESTOQUE, ''N'') = ''N'') '// AND COALESCE(NUM_NOTA, 0) = 0 '
      end
      else if (vSing.vTipoVendaCFOP = 'E') then
      begin
        if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
          vSqlTmp := vSqlTmp + ' AND STATUS_ESTOQUE = ''S'' AND COALESCE(NUM_NOTA, 0) > 0 '
        else
         vSqlTmp := vSqlTmp + ' AND (COALESCE(STATUS_ESTOQUE, ''N'') = ''N'') AND COALESCE(NUM_NOTA, 0) > 0 '
      end
      else
      begin
        if (vSing.vTipoVendaCFOP = 'D') or (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
          vSqlTmp := vSqlTmp + ' AND STATUS_ESTOQUE = ''S'' AND COALESCE(NUM_NOTA, 0) > 0 '
        else
          vSqlTmp := vSqlTmp + ' AND (COALESCE(STATUS_ESTOQUE, ''N'') = ''N'') AND COALESCE(NUM_NOTA, 0) > 0 ';
      end;

    vSqlTmp :=  vSqlTmp + ' AND (TRIM(COALESCE(POSICAO, ''VIVO'')) <> ''MORTO'')';

    if (vSing.vNatureza = 'E') then
    begin
      if vSing.vTipoVendaCFOP = 'V' then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') ' +
         ' AND TIPV_VEICULO IN (' + QuotedStr('V') + ', ' + QuotedStr('D') + ', ' + QuotedStr('T') + ', ' + QuotedStr('A') + ', ' + QuotedStr('R') + ', ' + QuotedStr('E') + ')'
      else if vSing.vTipoVendaCFOP = 'C' then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') AND (TIPV_VEICULO = ' + QuotedStr('C') + ')'
    end
    else if (vSing.vNatureza = 'S') then
    begin
      if (vSing.vTipoVendaCFOP = 'V') or (vSing.vTipoVendaCFOP = 'D') or (vSing.vTipoVendaCFOP = 'T') or (vSing.vTipoVendaCFOP = 'E') then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(MODELO_CFT, '''') = '''') OR (COALESCE(MODELO_CFT, '''') = ''CTRCOMPRA'') OR (COALESCE(MODELO_CFT, '''') = ''CTRENTCONS'')) ' +
         ' AND TIPV_VEICULO IN (' + QuotedStr('V') + ', ' + QuotedStr('D') + ', ' + QuotedStr('T') + ', ' + QuotedStr('R') + ', ' + QuotedStr('E') + ', ' + QuotedStr('C') + ')'
      else if vSing.vTipoVendaCFOP = 'C' then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(MODELO_CFT, '''') = '''') OR (COALESCE(MODELO_CFT, '''') = ''CTRENTCONS''))' + ' AND (TIPV_VEICULO = ' + QuotedStr('C') + ')'
      else if vSing.vTipoVendaCFOP = 'R' then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(MODELO_CFT, '''') = '''') OR (COALESCE(MODELO_CFT, '''') = ''CTRCOMPRA'')) ' +
         ' AND (TIPV_VEICULO = ' + QuotedStr('D') + ')'
      else if (vSing.vTipoVendaCFOP = 'I') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') and (TIPV_VEICULO = ' + QuotedStr('I') + ')'
      else if (vSing.vTipoVendaCFOP = 'A') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') and (TIPV_VEICULO = ' + QuotedStr('A') + ')'
      else if (vSing.vTipoVendaCFOP = 'E') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') ' +
         ' and (TIPV_VEICULO <> ' + QuotedStr('I') + ') and (TIPV_VEICULO <> ' + QuotedStr('A') + ')'
      else if (vSing.vTipoVendaCFOP = 'O') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') ' +
         ' and (TIPV_VEICULO <> ' + QuotedStr('D') + ') ' +
         ' and (TIPV_VEICULO <> ' + QuotedStr('I') + ') and (TIPV_VEICULO <> ' + QuotedStr('A') + ')';
    end;

    buscas2.Close;
    buscas2.sql.text := ' SELECT * FROM EST_MOTO ' +
      ' WHERE CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
      ' AND CODIGO = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1 ' + vSqlTmp;
    buscas2.open;


    Result := not buscas2.isempty;
  finally
    if not Result then
      if pTp > 0 then
        Result :=  vEstMoto.dataSet.FieldByName('N_COMANDOV').AsInteger = dataSet.FieldByName('N_COMANDO').AsInteger;
  end;

if not Result then
   if pTp > 0 then
   begin
    try
       if pTp = 2 then
         dataSet.Cancel;
       if UpperCase(trim(vEstMoto.dataSet.FieldByName('POSICAO').AsString)) <> 'MORTO' then
         exit;

       if vEstMoto.dataSet.FieldByName('N_COMANDOV').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger  then
         exit;

//       buscas2.Close;
//       buscas2.sql.text := ' SELECT FIRST 1 N_COMANDO, CHASSIV, COD_ESTMOTO, COD_EMPRESA FROM COM_FAT ' +
//        ' WHERE CHASSIV = ' + QuotedStr(trim(vEstMoto.dataSet.FieldByName('CHASSI_C').AsString)) + '' +
//        ' AND COD_ESTMOTO = ' + IntToStr(vEstMoto.dataSet.FieldByName('CODIGO').AsInteger) +
//        ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1 ' +
//        ' ORDER BY N_COMANDO DESC';
//       buscas2.open;
//
//       if buscas2.FieldByName('N_COMANDO').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger  then
//         exit;

       Result := True;
    finally
      if (not Result) and (pTp > 0) then
      begin
        if ((vSing.vNatureza = 'E') or (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString ='N')) then
          Application.MessageBox('Veículo não encontrado para este tipo de operação!', 'Atenção', 0 + 64)
        else
          Application.MessageBox('Veículo não encontrado no estoque para este tipo de operação!', 'Atenção', 0 + 64);
        vDadosIni.fechaStatusProcessamento;
//        if (vSing.vMod = 'CFT') then
//          frmMovVeiculosCCIA.TabSheet_Venda.Show
//        else if ((vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS'))then
//          frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
//        else if ((vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM')) then
//          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
//        else if (vSing.vMod = 'CTRVNDCONS')then
//          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
//
//        if (DBEditChassi <> '') and ((vSing.vNatureza = 'E') or (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString ='N')) then
//          raiseExceptionCreate('Veículo não encontrado para este tipo de operação!', DBEditChassi)
//        else if (DBEditChassi <> '') and (vSing.vNatureza = 'S') then
//          raiseExceptionCreate('Veículo não encontrado no estoque para este tipo de operação!', DBEditChassi);
      end;
    end;
  end;
end;

function TComFat._VerificarEstoqueVeiculo(memo: TMemo; vSomenteEstoque: string = 'N'; vProcPend: string = ''): Boolean;
var
  vdataUltversao: Tdate;
  vSqlTmp, acao, vMensagem: string;
  buscas2, buscas3: TIBQuery;
  DBEditChassi: string;
begin
  try
    Result := false;
    vVerificarDemonstr := True;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas3 := TIBQuery.Create(Application);
    buscas3.Database := buscas.Database;
    buscas3.Transaction := buscas.Transaction;

    vSqlTmp := '';
    DBEditChassi := '';

    if vSing.vMod = 'CFT' then
      DBEditChassi := 'DBEdit2'
    else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
      DBEditChassi := 'DBEdit48'
    else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
      DBEditChassi := 'DBEdit56'
    else if vSing.vMod = 'CTRVNDCONS' then
      DBEditChassi := 'DBEdit16';

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('CHASSIV').AsString) = '' then
      exit;

    if vSing.vTipoVenda = 'N' then
      vSqlTmp := vSqlTmp + ' AND STATUS_USO = ''N'''
    else
      vSqlTmp := vSqlTmp + ' AND STATUS_USO = ''U''';

    if (vSing.vTipoVendaCFOP = 'I') then
      vSqlTmp := vSqlTmp + ' AND (COALESCE(STATUS_ESTOQUE, ''N'') = ''N'') AND COALESCE(NUM_NOTA, 0) = 0 '
    else if (vSing.vNatureza = 'S') then
      if (vSing.vTipoVendaCFOP = 'O') then
      begin
        if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
          vSqlTmp := vSqlTmp + ' AND STATUS_ESTOQUE = ''S'' AND COALESCE(NUM_NOTA, 0) > 0 '
        else
          vSqlTmp := vSqlTmp + ' AND (COALESCE(STATUS_ESTOQUE, ''N'') = ''N'') '//AND COALESCE(NUM_NOTA, 0) = 0 '
      end
      else if (vSing.vTipoVendaCFOP = 'E') then
      begin
        if (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
          vSqlTmp := vSqlTmp + ' AND STATUS_ESTOQUE = ''S'' AND COALESCE(NUM_NOTA, 0) > 0 '
        else
         vSqlTmp := vSqlTmp + ' AND (COALESCE(STATUS_ESTOQUE, ''N'') = ''N'') AND COALESCE(NUM_NOTA, 0) > 0 '
      end
      else
      begin
        if (vSing.vTipoVendaCFOP = 'D') or (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
          vSqlTmp := vSqlTmp + ' AND STATUS_ESTOQUE = ''S'' AND COALESCE(NUM_NOTA, 0) > 0 '
        else
          vSqlTmp := vSqlTmp + ' AND (COALESCE(STATUS_ESTOQUE, ''N'') = ''N'') AND COALESCE(NUM_NOTA, 0) > 0 '

      end;

    vSqlTmp :=  vSqlTmp + ' AND (TRIM(COALESCE(POSICAO, ''VIVO'')) <> ''MORTO'')';

    if (vSing.vNatureza = 'E') then
    begin
      if vSing.vTipoVendaCFOP = 'V' then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') ' +
         ' AND TIPV_VEICULO IN (' + QuotedStr('V') + ', ' + QuotedStr('D') + ', ' + QuotedStr('T') + ', ' + QuotedStr('A') + ', ' + QuotedStr('R') + ', ' + QuotedStr('E') + ')'
      else if vSing.vTipoVendaCFOP = 'C' then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') AND (TIPV_VEICULO = ' + QuotedStr('C') + ')'
    end
    else if (vSing.vNatureza = 'S') then
    begin
      if (vSing.vTipoVendaCFOP = 'V') or (vSing.vTipoVendaCFOP = 'D') or (vSing.vTipoVendaCFOP = 'T') or (vSing.vTipoVendaCFOP = 'E') then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(MODELO_CFT, '''') = '''') OR (COALESCE(MODELO_CFT, '''') = ''CTRCOMPRA'') OR (COALESCE(MODELO_CFT, '''') = ''CTRENTCONS'')) ' +
         ' AND TIPV_VEICULO IN (' + QuotedStr('V') + ', ' + QuotedStr('D') + ', ' + QuotedStr('T') + ', ' + QuotedStr('R') + ', ' + QuotedStr('E') + ', ' + QuotedStr('C') + ')'
      else if vSing.vTipoVendaCFOP = 'C' then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(MODELO_CFT, '''') = '''') OR (COALESCE(MODELO_CFT, '''') = ''CTRENTCONS''))' + ' AND (TIPV_VEICULO = ' + QuotedStr('C') + ')'
      else if vSing.vTipoVendaCFOP = 'R' then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(MODELO_CFT, '''') = '''') OR (COALESCE(MODELO_CFT, '''') = ''CTRCOMPRA'')) ' +
         ' AND (TIPV_VEICULO = ' + QuotedStr('D') + ')'
      else if (vSing.vTipoVendaCFOP = 'I') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') and (TIPV_VEICULO = ' + QuotedStr('I') + ')'
      else if (vSing.vTipoVendaCFOP = 'A') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') and (TIPV_VEICULO = ' + QuotedStr('A') + ')'
     else if (vSing.vTipoVendaCFOP = 'E') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') ' +
         ' and (TIPV_VEICULO <> ' + QuotedStr('I') + ') and (TIPV_VEICULO <> ' + QuotedStr('A') + ')'
      else if (vSing.vTipoVendaCFOP = 'O') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') ' +
         ' and (TIPV_VEICULO <> ' + QuotedStr('D') + ') ' +
         ' and (TIPV_VEICULO <> ' + QuotedStr('I') + ') and (TIPV_VEICULO <> ' + QuotedStr('A') + ')';
    end;

    buscas2.Close;
    if dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0 then
    begin
      buscas2.sql.text := ' SELECT EST.*, T.VALTAB FROM EST_MOTO EST ' +
       ' LEFT JOIN TIPMODELO T ON T.CODIGO = EST.VERSAOEST AND T.COD_EMPRESA = EST.COD_EMPRESA ' +
       ' WHERE EST.CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
       ' AND EST.CODIGO = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
       ' AND EST.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND EST.ATIVO = 1 ' + vSqlTmp;
      buscas2.open;
    end;

    if (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'N') or (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U') then
    begin
      if buscas2.isempty then
      begin
        if (vSing.vMod = 'CFT') then
          frmMovVeiculosCCIA.TabSheet_Venda.Show
        else if ((vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS'))then
          frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show
        else if ((vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM')) then
          frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
        else if (vSing.vMod = 'CTRVNDCONS')then
          frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;

        if (DBEditChassi <> '') and ((vSing.vNatureza = 'E') or (dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString ='N')) then
          raiseExceptionCreate('Veículo não encontrado para este tipo de operação!', DBEditChassi)
        else if (DBEditChassi <> '') and (vSing.vNatureza = 'S') then
          raiseExceptionCreate('Veículo não encontrado no estoque para este tipo de operação!!', DBEditChassi);
      end;
      vcodveic := buscas2.fieldbyname('VERSAOEST').AsInteger;
      vanofab := buscas2.fieldbyname('ANO_FABEST').AsInteger;
      vanomod := buscas2.fieldbyname('ANO_MODEST').AsInteger;

      if not _VerificarContratos(vMensagem) then
      begin
         if vSing.vMod = 'CFT' then
            frmMovVeiculosCCIA.TabSheet_Venda.Show
         else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
            frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
         else if vSing.vMod = 'CTRVNDCONS' then
            frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
         if DBEditChassi <> '' then
            raiseExceptionCreate(vMensagem, DBEditChassi);
      end;

      buscas.Close;
      buscas.SQL.Text := 'select cf.N_COMANDO, cf.DATA_VEN, vnd.NOME_VENDEDOR, cf.NUM_NOTA_V, cf.NATUREZA, cf.TIPO, cf.TIPV_VEICULO, cf.STATUS_V from com_fat cf' +
       ' left join colaborador vnd on vnd.COD_VENDEDOR = cf.COVEND_V and vnd.COD_EMPRESA = cf.COD_EMPRESA ' +
       ' where cf.chassiv = ' + QuotedStr(buscas2.fieldbyname('CHASSI_C').asstring) +
       ' and cf.natureza = ' + QuotedStr(dataset.fieldbyname('NATUREZA').asstring) +
       ' and cf.cod_estmoto = ' + IntToStr(buscas2.FieldByName('CODIGO').AsInteger) +
       ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
       ' and (upper(trim(coalesce(cf.status_v, ''''))) <> ''CANCELADO'') ' +
       ' and cf.ativo=1 order by cf.n_comando desc ';
      buscas.Open;
      buscas.FetchAll;
      buscas.First;

      if not buscas.IsEmpty then
      begin
        while not buscas.Eof do
        begin
          if dataSet.FieldByName('NATUREZA').AsString = 'E' then
            if (buscas.FieldByName('N_COMANDO').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger) and
              (buscas.FieldByName('NATUREZA').AsString = dataSet.FieldByName('NATUREZA').AsString) and
  //            (buscas.FieldByName('TIPV_VEICULO').AsString = dataSet.FieldByName('TIPV_VEICULO').AsString) and
              (UpperCase(Trim(buscas.FieldByName('STATUS_V').AsString)) <> 'CANCELADO') then
              begin
                if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
                  frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show;

                if DBEditChassi <> '' then
                  if (buscas.FieldByName('TIPO').AsString = 'CTR') then
                    raiseExceptionCreate('Veículo pendente no Contrato: ' + vDadosIni.strzero(buscas.FieldByName('N_COMANDO').asinteger, 6) + #13 +
                    'Colaborador: ' +trim(buscas.FieldByName('NOME_VENDEDOR').AsString), DBEditChassi)
              end;

          if dataSet.FieldByName('NATUREZA').AsString = 'S' then
            if (buscas.FieldByName('N_COMANDO').AsInteger <> dataSet.FieldByName('N_COMANDO').AsInteger) and
              (buscas.FieldByName('NATUREZA').AsString = dataSet.FieldByName('NATUREZA').AsString) and
              (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'R') and (dataSet.FieldByName('TIPV_VEICULO').AsString <> 'D') and
    //          (buscas.FieldByName('TIPV_VEICULO').AsString = dataSet.FieldByName('TIPV_VEICULO').AsString) and
              (UpperCase(Trim(buscas.FieldByName('STATUS_V').AsString)) <> 'CANCELADO') then
            begin
              if vVerificarDemonstr then
                if not _VerificarDemonstracao(vMensagem, buscas.FieldByName('N_COMANDO').AsInteger,
                 buscas.FieldByName('DATA_VEN').AsDateTime, buscas.FieldByName('TIPV_VEICULO').AsString, vProcPend) then
                begin
                  if vSing.vMod = 'CFT' then
                    frmMovVeiculosCCIA.TabSheet_Venda.Show
                  else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
                    frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
                  else if vSing.vMod = 'CTRVNDCONS' then
                    frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
                  if DBEditChassi <> '' then
                    raiseExceptionCreate(vMensagem, DBEditChassi);
                end
                else
                begin
                  if not vVerificarDemonstr then
                    break;
                  if vSing.vMod = 'CFT' then
                    frmMovVeiculosCCIA.TabSheet_Venda.Show
                  else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
                    frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
                  else if vSing.vMod = 'CTRVNDCONS' then
                    frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;

                  if DBEditChassi <> '' then
                    if (buscas.FieldByName('TIPO').AsString = 'CTR') then
                       raiseExceptionCreate('Veículo pendente no Contrato: ' + vDadosIni.strzero(buscas.FieldByName('N_COMANDO').asinteger, 6) + #13 +
                       'Colaborador: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString), DBEditChassi)
                    else
                       raiseExceptionCreate('Veículo pendente no Comando: ' + vDadosIni.strzero(buscas.FieldByName('N_COMANDO').asinteger, 6) + #13 +
                       'Colaborador: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString), DBEditChassi);
                end;
            end;
          buscas.Next;
        end;
      end;

      if (vDadosIni.vpeps = 'S') and (vSomenteEstoque <> 'S') and
         (dataSet.FieldByName('NATUREZA').AsString = 'S') and (dataSet.FieldByName('TIPV_VEICULO').AsString = 'V') then
      begin
        if not buscas2.fieldbyname('DATA_CH_NOTA').IsNull then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select * from EST_MOTO WHERE VERSAOEST = ' + buscas2.fieldbyname('VERSAOEST').asstring +
            ' AND COREST = ''' + trim(buscas2.fieldbyname('COREST').asstring) + ''' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1 ' +
            ' order by data_ch_nota,descricao_versaoest,chassi_c';
          buscas.Open;
          buscas.FetchAll;
          //
          vdataUltversao := buscas.fieldbyname('DATA_CH_NOTA').value;
          //
          buscas.Close;
          buscas.SQL.Text := 'SELECT * FROM EST_MOTO WHERE VERSAOEST = ' + buscas2.fieldbyname('VERSAOEST').asstring +
            ' AND COREST LIKE ''' + trim(buscas2.FieldByName('COREST').asstring) + '%'' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' order by data_ch_nota,corest,chassi_c ';
          buscas.Open;
          buscas.FetchAll;

          while not buscas.Eof do
          begin
            if (buscas.FieldByName('STATUS_DEMONST').AsString <> 'S') then
              break;
            buscas.next;
          end;
          if (buscas2.FieldByName('CHASSI_C').AsString <> buscas.FieldByName('CHASSI_C').asstring) then
          begin
            Application.MessageBox('Veículo não está na ordem de PEPS para este modelo e cor', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if not vDadosIni.PesqPros('VEI068', 'LIBERAR', 'CHASSI - ' + buscas2.FieldByName('CHASSI_C').AsString + '', 'COM_FAT', dataSet.FieldByName('N_COMANDO').AsString,
              buscas3, False) then
            begin
              if (vSing.vMod = 'CFT') then
              begin
                frmMovVeiculosCCIA.TabSheet_Venda.Show;
                if frmMovVeiculosCCIA.DBEdit2.CanFocus then
                  frmMovVeiculosCCIA.DBEdit2.SetFocus;
              end
              else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
              begin
                frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show;
                if frmMovVeiculosCCIA.DBEdit48.CanFocus then
                  frmMovVeiculosCCIA.DBEdit48.SetFocus;
              end
              else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
              begin
                frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
                if frmMovVeiculosCCIA.DBEdit56.CanFocus then
                  frmMovVeiculosCCIA.DBEdit56.SetFocus;
              end
              else if vSing.vMod = 'CTRVNDCONS' then
              begin
                if frmMovVeiculosCCIA.DBEdit56.CanFocus then
                  frmMovVeiculosCCIA.DBEdit56.SetFocus;
              end;
              exit;
            end
            else
            begin
              if vSing.vMod = 'CFT' then
              begin
                frmMovVeiculosCCIA.TabSheet_Venda.Show;
                if (vSing.vTipoVenda = 'N') then
                begin
                  frmMovVeiculosCCIA.TabSheet_Venda.Show;
                  if frmMovVeiculosCCIA.DBEdit3.CanFocus then
                    frmMovVeiculosCCIA.DBEdit3.SetFocus;
                end
                else
                begin
                  frmMovVeiculosCCIA.TabSheet_Venda.Show;
                  if frmMovVeiculosCCIA.DBEdit7.CanFocus then
                    frmMovVeiculosCCIA.DBEdit7.SetFocus;
                end;
              end
              else if (vSing.vMod = 'CTRCOMPRA') or (vSing.vMod = 'CTRENTCONS') then
              begin
                frmMovVeiculosCCIA.TabSheet_ContratoCompra.Show;
                if frmMovVeiculosCCIA.DBEdit14.CanFocus then
                  frmMovVeiculosCCIA.DBEdit14.SetFocus;
              end
              else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
              begin
                frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show;
                if frmMovVeiculosCCIA.DBEdit57.CanFocus then
                  frmMovVeiculosCCIA.DBEdit57.SetFocus;
              end
              else if (vSing.vMod = 'CTRVNDCONS') then
              begin
                frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
                if frmMovVeiculosCCIA.DBEdit19.CanFocus then
                  frmMovVeiculosCCIA.DBEdit19.SetFocus;
              end;
            end;
          end;
        end;
      end;
      if not buscas2.IsEmpty then
      begin
        memo.clear;
        if (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'N') or (trim(dataSet.FieldByName('TIPO_VENDA_V').AsString) = 'U') then
        begin
          memo.lines.Add('MARCA....: ' + trim(buscas2.Fieldbyname('marcaest').asstring));
          memo.lines.Add('MODELO...: ' + trim(buscas2.fieldbyname('descricao_versaoest').asstring));
          memo.lines.Add('ANO FAB..: ' + trim(buscas2.fieldbyname('ano_fabest').asstring));
          memo.lines.Add('ANO MOD..: ' + trim(buscas2.fieldbyname('ano_modest').asstring));
          memo.lines.Add('PLACA....: ' + trim(buscas2.fieldbyname('placaest').asstring));
          memo.lines.Add('COR......: ' + trim(buscas2.fieldbyname('corest').asstring));

          PrecoTabela(buscas3);
          if dataSet.FieldByName('NATUREZA').AsString = 'S' then
            if buscas2.FieldByName('Estoque').value = 'O' then
              Application.MessageBox('Veículo De Outra Concessionaria, Favor Pedir NF para a Mesma.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        end;

        if vVerificarDemonstr then
          if not _VerificarDemonstracao(vMensagem, buscas.FieldByName('N_COMANDO').AsInteger,
          buscas.FieldByName('DATA_VEN').AsDateTime, buscas.FieldByName('TIPV_VEICULO').AsString, vProcPend) then
          begin
            if vSing.vMod = 'CFT' then
              frmMovVeiculosCCIA.TabSheet_Venda.Show
            else if (vSing.vMod = 'CTRVND') or (vSing.vMod = 'CTRRESDOM') or (vSing.vMod = 'CTRINTERM') then
              frmMovVeiculosCCIA.TabSheet_ContratoVndResDomInterm.Show
            else if vSing.vMod = 'CTRVNDCONS' then
              frmMovVeiculosCCIA.TabSheet_ContratoVndConsignado.Show;
            if DBEditChassi <> '' then
              raiseExceptionCreate(vMensagem, DBEditChassi);
          end;

        buscas.close;
        buscas.SQL.Text := ' select * from com_fat ' +
          ' where chassiv = ' + QuotedStr(Trim(dataSet.FieldByName('CHASSIV').AsString)) +
//          ' and cod_estmoto = ' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
          ' and tipv_veiculo = ''D'' and clientes_v = ' + IntToStr(dataSet.FieldByName('CLIENTES_V').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1 and num_nota_v > 0 ' +
          ' and (coalesce(trim(upper(status_v)), '''') = ''FECHADO'') ' +
          ' order by n_comando desc ';
        buscas.Open;
        buscas.FetchAll;

        if not buscas.isempty then
        begin
          frmMovVeiculosCCIA.DBMemo7.Lines.Add('NF EMITIDA PARA REGULARIZAR A TRANSMISSAO DE');
          frmMovVeiculosCCIA.DBMemo7.Lines.Add('PROPRIEDADE DE VEICULO ENVIADO ATRAVES DA NF ');
          frmMovVeiculosCCIA.DBMemo7.Lines.Add(buscas.fieldbyname('NUM_NOTA_V').asstring + ' DE ' +  buscas.fieldbyname('DATA_VEN').asstring);
        end;
        buscas.close;
      end;
    end;
    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TComFat._VerificarPendencias(var pMensagem: string): boolean;
begin
  try
    Result := True;

    if dataSet.FieldByName('NATUREZA').AsString <> 'S' then
      exit;

    if dataSet.FieldByName('TIPV_VEICULO').AsString <> 'V' then
      exit;

    pMensagem := 'Veículo com pendência(s): ' + #13;
    buscas.Close;
    buscas.SQL.Text := ' SELECT (TRIM(PENDENCIAS_VEIC.DESCRICAO) ||'' - ''|| ' +
      ' (SELECT RESULT FROM STRZERO(EXTRACT(DAY FROM PENDENCIAS_VEIC.DATA_PENDENCIA), 2)) ||''/''|| ' +
      ' (SELECT RESULT FROM STRZERO(EXTRACT(MONTH FROM PENDENCIAS_VEIC.DATA_PENDENCIA), 2)) ||''/''|| ' +
      ' EXTRACT(YEAR FROM PENDENCIAS_VEIC.DATA_PENDENCIA)) PENDENCIA FROM PENDENCIAS_VEIC ' +
      ' INNER JOIN TIPO_PENDENCIA ON PENDENCIAS_VEIC.COD_TP_PENDENCIA = TIPO_PENDENCIA.COD_TP_PENDENCIA ' +
      ' WHERE PENDENCIAS_VEIC.CHASSI_C = ' + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
      ' AND (COALESCE(PENDENCIAS_VEIC.STATUS_PENDENCIA, '''') <> ''REGULAR'') ' +
      ' AND PENDENCIAS_VEIC.COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;
    while not buscas.Eof do
    begin
      pMensagem := pMensagem + #13 + buscas.FieldByName('PENDENCIA').AsString;
      buscas.Next;
    end;

    if not buscas.IsEmpty then
      pMensagem := pMensagem + #13 + #13 + 'Favor resolver a(s) pendência(s) para continuar com a operação!';

    Result := buscas.IsEmpty;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TComFat._VerificarRecebimento(pNComando: Integer): boolean;
begin
  Result := true;

  if vEstMoto.dataSet.FieldByName('N_COMANDOV').AsInteger > 0 then  
    if vEstMoto.dataSet.FieldByName('N_COMANDOV').AsInteger <> pNComando then
    begin
      Application.MessageBox(PChar('Não é possível realizar baixa no Documento de venda!' + #13 +
       'Veículo '  + QuotedStr(trim(dataSet.FieldByName('CHASSIV').AsString)) +
       ' está reservado/vendido ao Documento de Venda Nº = ' +  vDadosIni.strzero(vEstMoto.dataSet.FieldByName('N_COMANDOV').AsInteger, 6) + #13 +
       'Favor verificar para continuar!'), 'Erro', 0 + 64);
      result:=false;
    end;
end;

function TComFat._VerificarReserva(var pMensagem: string): boolean;
var
  vCliente, vVendedor: string;
  vConfigC, vConfigV: string;

  procedure TestarVendedorCliente(pTipo: string; pConfig: string);
  var
   vTemp: string;
  begin
    Result := False;
    if trim(pTipo) = 'V' then    
      vTemp := 'Vendedor'
    else
      vTemp := 'Cliente';
    vCliente := IntToStr(vEstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger) +
      ' - ' +trim(vEstMoto.dataSet.FieldByName('NOME_RES').AsString);
    vVendedor := trim(retornaValor('select trim(nome_vendedor) as valor from colaborador ' +
      ' where cod_vendedor = ' + IntToStr(vEstMoto.dataSet.FieldByName('VENDEDOR_RES').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
    pMensagem := 'Veículo Reservado para outro ' + vTemp + ': ' + #13 +'Cliente: ' + vCliente + #13 +'Vendedor: ' + vVendedor + #13 +
       'Data Limite: ' + FormatDateTime('dd/MM/yyyy', (vEstMoto.dataSet.FieldByName('DATA_VENC_RES').AsDateTime)) + #13 +
       'Hora Limite: ' + vEstMoto.dataSet.FieldByName('HORA_VENC_RES').AsString;

    if (trim(pConfig) = 'M') then
      Result :=  Application.MessageBox(pchar(pMensagem + #13 + #13 +'Deseja continuar assim mesmo?'),'Confirmação',MB_ICONQUESTION+MB_YESNO) = IDYES;
  end;
begin
  	try
     Result := True;

     if dataSet.State <> dsInsert then
       exit;

     if (dataSet.FieldByName('NATUREZA').AsString <> 'S') then
       exit;

     if dataSet.FieldByName('TIPV_VEICULO').AsString <> 'V' then
       exit;

     if (vEstMoto.dataSet.FieldByName('COD_EMP_RESERVA').AsInteger > 0) and
       (vEstMoto.dataSet.FieldByName('COD_EMP_RESERVA').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
      exit;

     if (trim(vEstMoto.dataSet.FieldByName('STATUS_RES').AsString) = 'S')
      and not (vEstMoto.dataSet.FieldByName('DATA_VENC_RES').IsNull) then
     begin
         buscas.Close;
         buscas.SQL.Text := ' select * from tipo_reserva res ' +
          ' where res.tipo = ''VEI'' and res.sigla = :sigla';
         buscas.ParamByName('SIGLA').AsString := trim(vEstMoto.dataSet.FieldByName('TIPO_RES').AsString);
         buscas.Open;

         if buscas.IsEmpty then
           Exit;

         vConfigC := buscas.FieldByName('CONFIG_CLIENTE').AsString;
         vConfigV := buscas.FieldByName('CONFIG_VENDEDOR').AsString;

         if (trim(buscas.FieldByName('TIPO_RES').AsString) <> 'V')
          and (trim(buscas.FieldByName('TIPO_RES').AsString) <> 'B')
          and (trim(buscas.FieldByName('TIPO_RES').AsString) <> 'C') then
            exit;

         if (trim(vConfigV) = 'V') or (trim(vConfigV) = 'M') then
         begin
           if (dataSet.FieldByName('COVEND_V').AsInteger > 0) and (vEstMoto.dataSet.FieldByName('VENDEDOR_RES').AsInteger > 0)
            and (vEstMoto.dataSet.FieldByName('VENDEDOR_RES').AsInteger <> dataSet.FieldByName('COVEND_V').AsInteger)
            and (vEstMoto.dataSet.FieldByName('DATA_VENC_RES').AsDateTime + StrToTime(vEstMoto.dataSet.FieldByName('HORA_VENC_RES').AsString) >=
              vDadosIni.getDataHoraBanco(buscas)) then
            begin
               TestarVendedorCliente('V', vConfigV);
            end;
         end;
         if (trim(vConfigC) = 'V') or (trim(vConfigC) = 'M') then
         begin
           if (dataSet.FieldByName('CLIENTES_V').AsInteger > 0) and (vEstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
            and (vEstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger <> dataSet.FieldByName('CLIENTES_V').AsInteger)
            and (vEstMoto.dataSet.FieldByName('DATA_VENC_RES').AsDateTime + StrToTime(vEstMoto.dataSet.FieldByName('HORA_VENC_RES').AsString) >=
              vDadosIni.getDataHoraBanco(buscas)) then
            begin
               TestarVendedorCliente('C', vConfigC);
            end;
         end;
//       else if trim(vEstMoto.dataSet.FieldByName('TIPO_RES').AsString) = 'M' then
//       begin
//          Result := False;
//          pCliente := IntToStr(vEstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger) +
//             ' - ' +trim(retornaValor('select trim(c.nome_cliente) as valor from clientes c ' +
//             ' where c.cod_cliente = ' + IntToStr(vEstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger) +
//             ' and c.cod_empresa = ' + vDadosIni.codEmpresa));
//          pVendedor := trim(retornaValor('select trim(nome_vendedor) as valor from colaborador ' +
//             ' where cod_vendedor = ' + IntToStr(vEstMoto.dataSet.FieldByName('VENDEDOR_RES').AsInteger) +
//             ' and cod_empresa = ' + vDadosIni.codEmpresa));
//         pMensagem :=  'Veículo Reservado para Montagem: ' + #13 +'Cliente: ' + pCliente + #13 +'Vendedor: ' + pVendedor;
//       end;
     end;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TCondPagCCIA }

function TCondPagCCIA.abreCondPag: boolean;
begin
  Result := montaSelect(' SELECT COND_PAG.* FROM COND_PAG ' +
  	' INNER JOIN COND_PAG_EMPRESA ON ' +
    ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
    '	  AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
  	' WHERE COND_PAG.ATIVO = 1 ' +
    ' ORDER BY COND_PAG.DESC_COND_PAG ');
end;

function TCondPagCCIA.buscarCondPag(pCodigo: Integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' SELECT COND_PAG.* FROM COND_PAG ' +
   ' INNER JOIN COND_PAG_EMPRESA ON ' +
   ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
   '	  AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' WHERE COND_PAG.COD_COND_PAG = ' + IntToStr(pCodigo) +
   ' AND COND_PAG.ATIVO = 1 ';
  buscas.Open;

  Result := not buscas.IsEmpty;
end;

constructor TCondPagCCIA.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsCondPagComFat);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV)
end;

{ TEstMotoCCIA }

function TEstMotoCCIA.AbreEstMoto: boolean;
begin
  Result := montaSelect(' SELECT FIRST 1 EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, ' +
   ' COL.NOME_VENDEDOR FROM EST_MOTO ' +
   ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
   ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
   ' WHERE EST_MOTO.ATIVO = 1 AND EST_MOTO.CODIGO = 0 AND EST_MOTO.COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

function TEstMotoCCIA.consulta: boolean;
var
  I, erro: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  tempPosicao, tempPosicaoAnt: string;
  vCampoTemp, vCampoTempAd, vCondicaoTmp, vCondicaoTmpAd: string;
begin
  try
    vsqlAdicional := '';
    tempPosicao := '';
    tempPosicaoAnt := '';
    vCampoTemp:= '';
    vCampoTempAd := '';
    if UpperCase(trim(vCons.campo)) = 'TODOS' then
      vCons.porData := False;

    if not vCons.adicional then
    begin
     vCons.campoAd := '';
     vCons.valorAd := '';
     vCons.condicaoAd := '';
     vCons.porDataAd := false;
     vCons.dataIniAd := '';
     vCons.dataFimAd := '';
    end;

    if (UpperCase(trim(vCons.ordem)) =  'MODELO') or (UpperCase(trim(vCons.ordem)) =  'COD MODELO') then
      vCons.ordem := 'EST_MOTO.DESCRICAO_VERSAOEST, EST_MOTO.COREST';
    if UpperCase(trim(vCons.campo)) = 'PLACA' then
  		vCampoTemp := 'EST_MOTO.PLACAEST'
    else if UpperCase(trim(vCons.campo)) =  'CLIENTE' then
      vCampoTemp := 'CL.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'FORNECEDOR' then
      vCampoTemp := 'F.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'VENDEDOR' then
      vCampoTemp := 'COL.NOME_VENDEDOR';

	  if UpperCase(trim(vCons.campoAd)) = 'PLACA' then
  		vCampoTempAd := 'EST_MOTO.PLACAEST'
    else if UpperCase(trim(vCons.campoAd)) =  'CLIENTE' then
      vCampoTempAd := 'CL.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'FORNECEDOR' then
      vCampoTempAd := 'F.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'VENDEDOR' then
      vCampoTempAd := 'COL.NOME_VENDEDOR';

    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
      end;
    end; //porData

    if (vCons.novo) <> (vCons.usado) then
    begin
      if (vCons.novo) and (not vCons.usado) then
      begin
        if (vCons.transito) then
          vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_USO, ''N'') = ' + QuotedStr('N')+ ')'
        else
          vsqlAdicional := vsqlAdicional + ' (EST_MOTO.STATUS_USO = ' + QuotedStr('N')+ ')'
      end
      else if (vCons.usado) and (not vCons.novo) then
      begin
        if (vCons.transito) then
          vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_USO, ''U'') = ' + QuotedStr('U')+ ')'
        else
          vsqlAdicional := vsqlAdicional + ' (EST_MOTO.STATUS_USO = ' + QuotedStr('U')+ ')'
      end;
    end
    else
    begin
      if (vCons.novo) and (vCons.usado) then
      begin
        if (vCons.transito) then
          vsqlAdicional := vsqlAdicional +
          ' (COALESCE(EST_MOTO.STATUS_USO, ''N'') IN (' + QuotedStr('N')+ ', ' + QuotedStr('U')+ '))'
        else
          vsqlAdicional := vsqlAdicional +
           ' (EST_MOTO.STATUS_USO IN (' + QuotedStr('N')+ ', ' + QuotedStr('U')+ '))';
      end
      else
        vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_USO, '''') <> '''')';
    end;


    if Trim(vCampoTemp) <> '' then
    begin
      vCondicaoTmp := vCons.Condicao;
      if vCondicaoTmp = 'Igual' then
        vCondicaoTmp := '='
      else if vCondicaoTmp = 'Maior' then
        vCondicaoTmp := '>'
      else if vCondicaoTmp = 'Maior ou Igual' then
        vCondicaoTmp := '>='
      else if vCondicaoTmp = 'Menor' then
        vCondicaoTmp := '<'
      else if vCondicaoTmp = 'Menor ou Igual' then
        vCondicaoTmp := '<='
      else if vCondicaoTmp = 'Diferente' then
        vCondicaoTmp := '<>'
      else if (vCondicaoTmp = 'Esta contido') then
        vCondicaoTmp := 'like'
      else if (vCondicaoTmp = 'Começa') then
        vCondicaoTmp := 'Começa'
      else
        vCondicaoTmp := '=';
      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmp = 'like' then
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%') + ') ' +
          	' or (' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%');
      end
      else if vCondicaoTmp = 'Começa' then
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%') + ') ' +
          	' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))  + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%');
      end
      else
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor))) + ') ' +
          	' or ' + ' (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' +QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))) + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor)));
      end;
      vCons.valor := '';
      vCons.campo := '';
      vCons.ordem := vCampoTemp;
    end;

    if (UpperCase(trim(vCons.ordem)) =  'MODELO') or (UpperCase(trim(vCons.ordem)) =  'COD MODELO') then
      vCons.ordem :=  'EST_MOTO.POSICAO,' +  vCons.ordem + ', EST_MOTO.DATA_CAD,EST_MOTO.HORA_CAD'
    else if Trim(vCampoTemp) <> '' then
      vCons.ordem :=  'EST_MOTO.POSICAO,EST_MOTO.DATA_CAD,EST_MOTO.HORA_CAD,' +  vCons.ordem
    else
      vCons.ordem :=  'EST_MOTO.POSICAO,EST_MOTO.DATA_CAD,EST_MOTO.HORA_CAD';

    if Trim(vCampoTempAd) <> '' then
    begin
      vCondicaoTmpAd := vCons.CondicaoAd;
      if vCondicaoTmpAd = 'Igual' then
        vCondicaoTmpAd := '='
      else if vCondicaoTmpAd = 'Maior' then
        vCondicaoTmpAd := '>'
      else if vCondicaoTmpAd = 'Maior ou Igual' then
        vCondicaoTmpAd := '>='
      else if vCondicaoTmpAd = 'Menor' then
        vCondicaoTmpAd := '<'
      else if vCondicaoTmpAd = 'Menor ou Igual' then
        vCondicaoTmpAd := '<='
      else if vCondicaoTmpAd = 'Diferente' then
        vCondicaoTmpAd := '<>'
      else if (vCondicaoTmpAd = 'Esta contido') then
        vCondicaoTmpAd := 'like'
      else if (vCondicaoTmpAd = 'Começa') then
        vCondicaoTmpAd := 'Começa'
      else
        vCondicaoTmpAd := '=';

      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmpAd = 'like' then
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
          	' or (' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%');
      end
      else if vCondicaoTmpAd = 'Começa' then
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
          	' or (' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%');
      end
      else
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd))) + ') ' +
          	' or (' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)))) + ')) '
      	else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
      end;
      vCons.valorAd := '';
      vCons.campoAd := '';
    end;

    if vCons.adicional then
    begin
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
          erro := erro + 1;
        end;
        if erro = 2 then
        begin
          Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
            'Atenção', MB_OK + MB_ICONINFORMATION);
        end
        else
        begin
          if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
            formatodata := 'mm/dd/yyyy'
          else if pos('.', ShortDateFormat) <> 0 then
            formatodata := 'dd.mm.yyyy';
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end
      else
      begin
        vCons.dataIniAd := '';
        vCons.dataFimAd := '';
      end;
      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';

      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            vCons.campoAd := DataSet.Fields[I].FieldName;
            if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
              ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
            begin
              vCons.condicaoAd := '=';
              if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              begin
                try
                  if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                    vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)))
                  else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                    vCons.valorAd := FloatToStr(StrToFloat(Trim(vCons.valorAd)))
                except
                  vCons.valorAd := '0';
                  Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
                end;
              end
              else
                vCons.valorAd := vDadosIni.tirapontos(vCons.valorAd, 4);
            end
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
            begin
              if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd +
                ' >= ' + vCons.dataIniAd + ' and ' + vCons.campoAd + ' <= ' + vCons.dataFimAd
              else if (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
              Break;
            end;

            if UpperCase(trim(vCons.campoAd)) = 'COD_CLIENTE' then
               vCons.campoAd := 'EST_MOTO.COD_CLIENTE'
            else if UpperCase(trim(vCons.campoAd)) = 'COD_EMPRESA' then
               vCons.campoAd := 'EST_MOTO.COD_EMPRESA'
            else if UpperCase(trim(vCons.campoAd)) = 'PLACAEST' then
               vCons.campoAd := 'EST_MOTO.PLACAEST';

            if vCons.condicaoAd = 'like' then
            begin
            	if (UpperCase(trim(vCons.campoAd)) = 'PLACAEST') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
              	vsqlAdicional := vsqlAdicional + ' and ((' + vCons.campoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
                	' or (' + vCons.campoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
              else
	              vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%');
            end
            else if vCons.condicaoAd = 'Começa' then
            begin
            	if (UpperCase(trim(vCons.campoAd)) = 'PLACAEST') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
       					vsqlAdicional := vsqlAdicional + ' and ((' + vCons.campoAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
                	' or (' + vCons.campoAd + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
              else
	              vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%');
            end
            else
            begin
            	if (UpperCase(trim(vCons.campoAd)) = 'PLACAEST') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
              	vsqlAdicional := vsqlAdicional + ' and ((' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd))) + ') ' +
                	' or (' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)))) + ')) '
              else
	              vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
            end;
            Break;
          end;
        end;
      end;

    end; //adicional

    if vCons.avancada then
    begin
        if ((vCons.vivo) or (vCons.morto) or (vCons.estacionamento) or (vCons.transito))
        and (not((vCons.vivo) and (vCons.morto) and (vCons.estacionamento) and (vCons.transito))) then
        begin
          vsqlAdicional := vsqlAdicional + ' AND (';

          if ((vCons.vivo) and (vCons.morto) and (vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> (' + QuotedStr('TRANSITO') + ')) '
          else if ((vCons.vivo) and (vCons.morto) and (not vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> (' + QuotedStr('ESTACIONAMENTO') + ')) '
          else if ((vCons.vivo) and (not vCons.morto) and (vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> (' + QuotedStr('MORTO') + ')) '
          else if ((not vCons.vivo) and (vCons.morto) and (vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> (' + QuotedStr('VIVO') + ')) '
          else if ((vCons.vivo) and (vCons.morto) and (not vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('VIVO') + ',' + QuotedStr('MORTO') + ')) '
          else if ((vCons.vivo) and (not vCons.morto) and (vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('VIVO') + ',' + QuotedStr('ESTACIONAMENTO') + ')) '
          else if ((vCons.vivo) and (not vCons.morto) and (not vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('VIVO') + ',' + QuotedStr('TRANSITO') + ')) '
          else if ((not vCons.vivo) and (vCons.morto) and (vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('MORTO') + ',' + QuotedStr('ESTACIONAMENTO') + ')) '
          else if ((not vCons.vivo) and (vCons.morto) and (not vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('MORTO') + ',' + QuotedStr('TRANSITO') + ')) '
          else if ((not vCons.vivo) and (not vCons.morto) and (vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('ESTACIONAMENTO') + ',' + QuotedStr('TRANSITO') + ')) '
          else if ((vCons.vivo) and (not vCons.morto) and (not vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = '+ QuotedStr('VIVO')+ ') '
          else if ((not vCons.vivo) and (vCons.morto) and (not vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = '+ QuotedStr('MORTO')+ ') '
          else if ((not vCons.vivo) and (not vCons.morto) and (vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = '+ QuotedStr('ESTACIONAMENTO') + ') '
          else if ((not vCons.vivo) and (not vCons.morto) and (not vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = '+ QuotedStr('TRANSITO')+ ') ';
          if (vCons.transito) then
            tempPosicao := '(' + tempPosicaoAnt + ' OR (' + tempPosicaoAnt +
            ' AND (TRIM(COALESCE(EST_MOTO.MODELO_NF, '''')) = (' + QuotedStr('TRA') + ')))) '
          else
            tempPosicao := tempPosicaoAnt;
          if (vCons.transfdeposito) then
            tempPosicao := tempPosicao + ' OR (' + tempPosicaoAnt +
              ' OR (COALESCE(EST_MOTO.STATUS_TRANSDEP, '''') = ' + QuotedStr('S') +
              ' AND EST_MOTO.DATA_TRANS_RET IS NULL)) '
          else
            tempPosicao := tempPosicao + ' OR (' + tempPosicaoAnt +
              ' AND (NOT (COALESCE(EST_MOTO.STATUS_TRANSDEP, '''') = ' + QuotedStr('S') +
              ' AND EST_MOTO.DATA_TRANS_RET IS NULL))) ';

          vsqlAdicional := vsqlAdicional + tempPosicao;
          vsqlAdicional := vsqlAdicional + ' ) ';
        end;

        if (trim(vCons.demonstracao) <> '') or (trim(vCons.reserva) <> '') or (trim(vCons.canc) <> '') or (trim(vCons.usadotroca) <> '') then
        begin
          vsqlAdicional := vsqlAdicional + ' AND (';

          if (trim(vCons.demonstracao) <> '') then
            vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_DEMONST, '''') = ' + QuotedStr(trim(vCons.demonstracao)) + ')';

          if ((trim(vCons.demonstracao) <> '') and (trim(vCons.reserva) <> '')) then
            vsqlAdicional := vsqlAdicional + ' OR ';
          if (trim(vCons.reserva) <> '') then
            vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_RES, '''') = ' + QuotedStr(trim(vCons.reserva)) + ')';

          if ((trim(vCons.demonstracao) <> '') or (trim(vCons.reserva) <> '')) and (trim(vCons.canc) <> '') then
            vsqlAdicional := vsqlAdicional + ' OR ';
          if (trim(vCons.canc) <> '') then
            vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_CANC, '''') = ' + QuotedStr(trim(vCons.canc)) + ')';

          if ((trim(vCons.demonstracao) <> '') or (trim(vCons.reserva) <> '') or (trim(vCons.canc) <> '')) and (trim(vCons.usadotroca) <> '') then
            vsqlAdicional := vsqlAdicional + ' OR ';
          if (trim(vCons.usadotroca) <> '') then
            vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.USADO_TROCA, '''') = ' + QuotedStr(trim(vCons.usadotroca)) + ')';

          if (trim(tempPosicao) <> '') then
            if vCons.statusAND_OU = 'OU' then
              vsqlAdicional := vsqlAdicional + ' OR ' + tempPosicao;
          vsqlAdicional := vsqlAdicional + ' ) ';
        end;


        if ((vCons.comEstoque) or (vCons.semEstoque)
        or (vCons.EstoqueReal) or (vCons.Consignado) or (vCons.Intermediacao)) then
        begin
           if (vCons.comEstoque) <> (vCons.semEstoque) then
           begin
             vsqlAdicional := vsqlAdicional + ' AND (';

             if (vCons.comEstoque) and (not vCons.semEstoque) then
               vsqlAdicional := vsqlAdicional + ' (EST_MOTO.STATUS_ESTOQUE = ' + QuotedStr('S')+ ')'
             else if (vCons.semEstoque) and (not vCons.comEstoque) then
               vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_ESTOQUE, ''N'') = ' + QuotedStr('N') + ')';

             if (trim(tempPosicao) <> '') then
               if vCons.situacaoEstAND_OU = 'OU' then
                 vsqlAdicional := vsqlAdicional + ' OR ' + tempPosicao;
             vsqlAdicional := vsqlAdicional + ' ) ';
           end;

          if ((vCons.EstoqueReal) or (vCons.Consignado) or (vCons.Intermediacao)) then
          begin
            vsqlAdicional := vsqlAdicional + ' AND (';

            if ((vCons.EstoqueReal) and (vCons.Consignado) and (not vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') <> ' + QuotedStr('I') + ')'
            else if ((vCons.EstoqueReal) and (not vCons.Consignado) and (vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') <> ' + QuotedStr('C') + ')'
            else if ((not vCons.EstoqueReal) and (vCons.Consignado) and (vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') in (' + QuotedStr('C') + ',' + QuotedStr('I') + '))'
            else if ((vCons.EstoqueReal) and (not vCons.Consignado) and (not vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') not in (' + QuotedStr('C') + ',' + QuotedStr('I') + '))'
            else if ((not vCons.EstoqueReal) and (vCons.Consignado) and (not vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') = ' + QuotedStr('C') + ')'
            else if ((not vCons.EstoqueReal) and (not vCons.Consignado) and (vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') = ' + QuotedStr('I') + ')';

            if (trim(tempPosicao) <> '') then
              if vCons.situacaoTPOPAND_OU = 'OU' then
                 vsqlAdicional := vsqlAdicional + ' OR ' + tempPosicao;
             vsqlAdicional := vsqlAdicional + ' ) ';

          end;
        end;
    end //avancada
    else
    begin
      if (vCons.novo) or (vCons.usado) then
        vsqlAdicional := vsqlAdicional + ' AND (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''VIVO'')';

      if (vCons.novo) or (vCons.usado) then
      begin
        if (vCons.transfdeposito) then
          vsqlAdicional := '(' + vsqlAdicional + ' OR '
        else
          vsqlAdicional := '(' + vsqlAdicional + ' AND ';
      end
      else
        vsqlAdicional := vsqlAdicional + ' AND ';

      if (vCons.transfdeposito) then
        vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_TRANSDEP, '''') = ' + QuotedStr('S') + ' AND EST_MOTO.DATA_TRANS_RET IS NULL) '
      else
        vsqlAdicional := vsqlAdicional + ' (NOT (COALESCE(EST_MOTO.STATUS_TRANSDEP, '''') = ' + QuotedStr('S') + ' AND EST_MOTO.DATA_TRANS_RET IS NULL)) ';
      if (vCons.novo) or (vCons.usado) then
        vsqlAdicional := vsqlAdicional + ')';
    end;

    if vCons.porData then
      result := ConsultaCampos('EST_MOTO', vCons.campo, vCons.ordem, vCons.dataIni,
        vCons.dataFim, vDadosIni.codEmpresa, 1,
        ' EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR ',
        ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
        ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
        ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ',
        vsqlAdicional)
    else
      result := ConsultaCampos('EST_MOTO', vCons.valor, vCons.campo, vCons.condicao,
        vCons.ordem, False, vDadosIni.codEmpresa,
        ' EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR ',
        ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
        ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
        ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ',
        vsqlAdicional);
  finally
    vsqlTemp := dataSet.CommandText;
  end;
end;

constructor TEstMotoCCIA.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsEstMotos);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);

  vModVeic := TModVeiculoCCIA.create;
  vClientesVeic := TLocCliente.create;
  vFornecedorVeic := TLocCliente.create;
  vClientesReservaVeic := TLocCliente.create;
  vEspecieVeic := TEspecieVeiculo.create;
  vColaboradorVeic := TLocColaborador.create;
  vCombustivelVeic := TListaTPComb.create;
  vCoresVeic := TLocCor.create.create;
  vMarcaVeic := TListaMarca.create;
  vPendenciaVeic := TPendencia.create;
  vDespesaVeic := TDespesa.create;
  vReserva := TReservaEstMotoCCIA.create;
  vHistNFE := THistVeiculo.create;
  vHistNFS := THistVeiculo.create;
  vHistNFT := THistVeiculo.create;
  vHistCTRE := THistVeiculo.create;
  vHistCTRS := THistVeiculo.create;
  vHistORC := THistVeiculo.create;
  vHistOS := THistVeiculo.create;

  vModVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsModVeiculosEstMotos);
  vClientesVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsClientesEstMotos);
  vFornecedorVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsFornecedorEstMotos);
//  vClientesReservaVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsClienteReservaEstMotos);
  vCombustivelVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsCombustivelEstMotos);
  vCoresVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsCorEstMotos);
  vMarcaVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsMarcaEstMotos);
  vEspecieVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsEspecieEstMotos);
  vColaboradorVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsColaboradorEstMotos);

  vHistNFE.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistNFEEstmotos);
  vHistNFS.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistNFSEstmotos);
  vHistNFT.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistNFTEstmotos);
  vHistCTRE.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistCTREEstMotos);
  vHistCTRS.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistCTRSEstMotos);
  vHistORC.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistORCEstMotos);
  vHistOS.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistOSEstMotos);
end;

function TEstMotoCCIA.definirDataAssembleia(pCodigo, pCodEstmoto: Integer): boolean;
var
 vtemp, vTabela, vData, vDataRes, vPosicao: string;
 vHoraVenc: string;
 vDataBanco: TDate;
 vDiasReserva, vDiasReservaAss, vCodigo: Integer;
 buscas2: TIBQuery;
begin
  Result := False;
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vDataBanco := vDadosIni.getDataBanco(buscas2);
  buscas.Close;
  if pCodEstmoto > 0 then
  begin
    buscas.SQL.Text := ' select res.tipo_res, res.quant_dias_reserva, res.quant_dias_reserva_ass, est.posicao, est.data_res, est.hora_res from est_moto est ' +
     ' inner join tipo_reserva res on est.tipo_res = res.sigla and res.tipo = ''VEI'' ' +
     ' where est.codigo = :codigo and est.cod_empresa = :cod_empresa ';
    buscas.ParamByName('CODIGO').AsInteger := pCodEstmoto;
  end
  else
  begin
    buscas.SQL.Text := ' select res.tipo_res, res.quant_dias_reserva, res.quant_dias_reserva_ass, ''FILA'' posicao, est.data_res, est.hora_res from fila_reserva_veic est ' +
     ' inner join tipo_reserva res on est.tipo_res = res.sigla and res.tipo = ''VEI'' ' +
     ' where est.codigo = :codigo and est.cod_empresa = :cod_empresa ';
    buscas.ParamByName('CODIGO').AsInteger := pCodigo;
  end;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa); 
  buscas.Open;

  if trim(buscas.FieldByName('TIPO_RES').AsString) <> 'C'  then
  begin
   Application.MessageBox(pchar('Não é possível definir data da assembléia, reserva não é do tipo consorcio!'),Pchar('Error'), MB_OK);
   exit;
  end;

  vPosicao := trim(buscas.FieldByName('POSICAO').AsString);
  vHoraVenc := buscas.FieldByName('HORA_RES').AsString;
  vDiasReserva := buscas.FieldByName('QUANT_DIAS_RESERVA').AsInteger;
  vDiasReservaAss := buscas.FieldByName('QUANT_DIAS_RESERVA_ASS').AsInteger;
  vDataRes := buscas.FieldByName('DATA_RES').AsString;

  if (InputQuery('Informe a data da assembleia', 'Exemplo: ' + FormatDateTime('DD/MM/YYYY', vDadosIni.getDataBanco(buscas)), vData)) then
  begin
    try
      StrToDate(vData);
    except
      if trim(vData) = '' then
      begin
        if Application.MessageBox('Deseja remover data da assembléia?', 'Confirmação', MB_YESNO +
          MB_ICONQUESTION + MB_DEFBUTTON2) = mrNo then
        exit;
      end
      else
      begin
        Application.MessageBox(pchar('Data da assembléia inválida!'),Pchar('Error'), MB_OK);
        exit;
      end;
    end;
  end;

  try
    if (pCodEstmoto > 0) then
    begin
      vtemp := ' cod_estmoto ';
      buscas.Close;
      buscas.SQL.Text := ' update est_moto set data_assembleia = :data_assembleia, ' +
        ' data_venc_res = :data_venc_res, hora_venc_res = :hora_venc_res ' +
        ' where codigo = :codigo and cod_empresa = :cod_empresa ';
      buscas.ParamByName('CODIGO').AsInteger := pCodEstmoto;
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      if trim(vData) = '' then
      begin
        buscas.ParamByName('DATA_ASSEMBLEIA').Value := null;
        if vDiasReserva > 0 then
        begin
          buscas.ParamByName('DATA_VENC_RES').AsDate := StrToDate(vDataRes) + vDiasReserva;
          buscas.ParamByName('HORA_VENC_RES').AsString := vHoraVenc;
        end
        else
        begin
          buscas.ParamByName('DATA_VENC_RES').Value := null;
          buscas.ParamByName('HORA_VENC_RES').Value := null;
        end;
      end
      else
      begin
        buscas.ParamByName('DATA_ASSEMBLEIA').AsDate := StrToDate(vData);
        if (trim(vPosicao) <> 'TRANSITO') and (trim(vPosicao) <> 'FILA') then
        begin
          buscas.ParamByName('DATA_VENC_RES').AsDate := StrToDate(vData) + vDiasReservaAss;
          if vDataBanco > StrToDate(vData) then
           if Application.MessageBox(PChar('Data da assembleia ultrapassada, deseja definir a data de vencimento ' +
            IntToStr(vDiasReservaAss)+ ' dias apartir de hoje?'),
            'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
             buscas.ParamByName('DATA_VENC_RES').AsDate := vDataBanco + vDiasReservaAss;
          buscas.ParamByName('HORA_VENC_RES').AsString := vHoraVenc;
        end
        else
        begin
          buscas.ParamByName('DATA_VENC_RES').Value := null;
          buscas.ParamByName('HORA_VENC_RES').Value := null;
        end;
      end;
      buscas.ExecSQL;
    end
    else
      vtemp := ' codigo ';
    buscas.Close;
    buscas.SQL.Text := ' update fila_reserva_veic set data_assembleia = :data_assembleia ' +
      ' where ' + vtemp + ' = :codigo and cod_empresa = :cod_empresa ';
    if pCodEstmoto > 0 then
      buscas.ParamByName('CODIGO').AsInteger := pCodEstmoto
    else
      buscas.ParamByName('CODIGO').AsInteger := pCodigo;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    if trim(vData) = '' then
      buscas.ParamByName('DATA_ASSEMBLEIA').Value := null
    else
      buscas.ParamByName('DATA_ASSEMBLEIA').AsDate := StrToDate(vData);
    buscas.ExecSQL;

    CommitaTransacao;
    Result := True;

   if pCodEstmoto > 0 then
   begin
     vCodigo := pCodEstmoto;
     vTabela := 'EST_MOTO';
   end
   else
   begin
     vCodigo := pCodigo;
     vTabela := 'FILA_RESERVA_VEIC'
   end;

   if trim(vData) <> '' then
      vDadosIni.GravaAuditoria('VEI148', 'DEFINIR DATA', 'SUCESSO - ' +
       'MOD ' + IntToStr(dataSet.FieldByName('VERSAOEST').AsInteger) +
       '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
       '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
       '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
       '/VEND ' + IntToStr(dataSet.FieldByName('VENDEDOR_RES').AsInteger),
       vTabela, IntToStr(vCodigo), buscas)
   else
     vDadosIni.GravaAuditoria('VEI148', 'REMOVER DATA', 'SUCESSO - ' +
       'MOD ' + IntToStr(dataSet.FieldByName('VERSAOEST').AsInteger) +
       '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
       '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
       '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
       '/VEND ' + IntToStr(dataSet.FieldByName('VENDEDOR_RES').AsInteger),
       vTabela, IntToStr(vCodigo), buscas);
  finally
    RollBackTransacao;
  end;

end;

function TEstMotoCCIA.delete: boolean;
var
  codVeic, Chassi: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  codVeic := dataSet.FieldByName('CODIGO').AsString;
  Chassi := dataSet.FieldByName('CHASSI_C').AsString;

  if not vDadosIni.PesqPros('VEI085', 'EXCLUIR', 'CHASSI ' + Chassi, 'EST_MOTO',
    codVeic, buscas, true) then
    Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    if not existeHist then
    begin
      Application.MessageBox('Não é possível excluir, poís veículo possui movimento.', 'Erro', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    if not existeComandoNF then
    begin
      Application.MessageBox('Não é possível excluir, poís veículo possui movimento.', 'Erro', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;
    buscas.Close;
    buscas.SQL.Text := ' delete from est_moto ' +
     ' where codigo = ' +  IntToStr(dataSet.FieldByName('CODIGO').AsInteger) +
     ' and chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSI_C').AsString) +
     ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;
      CommitaTransacao;
      vDadosIni.GravaAuditoria('VEI085', 'EXCLUIR', 'SUCESSO - CHASSI ' + Chassi, 'EST_MOTO', codVeic, buscas);
      Result := true;
    except
      Result := false;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VEI085', 'EXCLUIR', 'FALHA - CHASSI ' + Chassi, 'EST_MOTO', codVeic, buscas);
    end;
  end;

  if Result then
    Refresh;
end;

destructor TEstMotoCCIA.destroy;
begin
  vClientesVeic.Free;
  vClientesVeic := nil;
  vFornecedorVeic.Free;
  vFornecedorVeic := nil;
  vEspecieVeic.Free;
  vEspecieVeic := nil;
  vColaboradorVeic.Free;
  vColaboradorVeic := nil;
  vModVeic.Free;
  vModVeic := nil;
  vPendenciaVeic.Free;
  vPendenciaVeic := nil;
  vDespesaVeic.Free;
  vDespesaVeic := nil;
  vCombustivelVeic.Free;
  vCombustivelVeic := nil;
  vCoresVeic.Free;
  vCoresVeic := nil;
  vMarcaVeic.Free;
  vMarcaVeic := nil;
  vReserva.Free;
  vReserva := nil;
  vHistNFE.Free;
  vHistNFE := nil;
  vHistNFS.Free;
  vHistNFS := nil;
  vHistNFT.Free;
  vHistNFT := nil;
  vHistCTRE.Free;
  vHistCTRE := nil;
  vHistCTRS.Free;
  vHistCTRS := nil;
  vHistORC.Free;
  vHistORC := nil;
  vHistOS.Free;
  vHistOS := nil;
  inherited;
end;

function TEstMotoCCIA.edit: boolean;
begin
  if trim(dataSet.FieldByName('STATUS_USO').AsString) = '' then
  begin
    Application.MessageBox('Situação do veículo não informado, favor informar.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if not abreFormTipoVendaEstMotoCCIA(1) then
      exit;
  end;

  Result := inherited edit;

  if not result then
    Exit;

  if trim(dataSet.FieldByName('STATUS_USO').AsString) = '' then
    dataSet.FieldByName('STATUS_USO').AsString := vDadosIni.vDtSetTmp.FieldByName('TIPO_VENDA_V').AsString;
  if trim(dataSet.FieldByName('TIPV_VEICULO').AsString) = '' then
    dataSet.FieldByName('TIPV_VEICULO').AsString := 'V';

  dataSet.FieldByName('OBS_ITEMEST').AsString := trim(dataSet.FieldByName('OBS_ITEMEST').AsString);
  dataSet.FieldByName('ADICIONAIS').AsString := trim(dataSet.FieldByName('ADICIONAIS').AsString);

  vEspecieVeic.abreEspecieVeiculo;
  vColaboradorVeic.abreLocColaborador;
  vModVeic.abreModVeiculos(dataSet.FieldByName('STATUS_USO').AsString);
  vMarcaVeic._AbreMarca;
  vCombustivelVeic.abreTipoCombustiveis;
  vCoresVeic._AbreCores;
  vDespesaVeic._AbreDespesa('');
  vPendenciaVeic._AbrePendencia('');
  vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
  vFornecedorVeic.abreClientes(dataSet.FieldByName('COD_FORNECEDOR').AsInteger);
  vHistNFE.dataSet.Close;
  vHistNFS.dataSet.Close;
  vHistNFT.dataSet.Close;
  vHistCTRE.dataSet.Close;
  vHistCTRS.dataSet.Close;
  vHistORC.dataSet.Close;
  vHistOS.dataSet.Close;

  vPendenciaVeic.dataSet.AfterScroll := vPendenciaVeic.datasetAfterScrollPendencia;
  vDespesaVeic.dataSet.AfterScroll := vDespesaVeic.datasetAfterScrollDespesa;
end;

function TEstMotoCCIA.existeComandoNF: Boolean;
begin
  Result := False;


  if (dataSet.FieldByName('NUM_NOTA').AsInteger > 0) or (dataSet.FieldByName('NUM_NOTAV').AsInteger > 0) then
   exit;
   
  buscas.Close;
  buscas.SQL.Text := 'SELECT FIRST 1 N_COMANDO FROM COM_FAT WHERE CHASSIV = ' + QuotedStr(dataSet.FieldByName('CHASSI_C').AsString) +
    ' AND COD_ESTMOTO = ' + dataSet.FieldByName('CODIGO').AsString + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if not buscas.IsEmpty then
    exit;

  buscas.Close;
  buscas.SQL.Text := 'SELECT FIRST 1 COD_NF FROM NOTAFISCAL_ITEM_VEICULO WHERE CHASSI = ' + QuotedStr(dataSet.FieldByName('CHASSI_C').AsString) +
    ' AND COD_NF IN (' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) + ',' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) + ') AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if not buscas.IsEmpty then
    exit;

  Result := True;
end;

function TEstMotoCCIA.existeHist: Boolean;
begin
  Result := False;

  buscas.Close;
  buscas.SQL.Text := 'SELECT FIRST 1 CHASSI_C FROM HIST_ESTMOTO ' +
    ' WHERE CHASSI_C = ' + QuotedStr(dataSet.FieldByName('CHASSI_C').AsString) +
    ' AND CODIGO = ' + dataSet.FieldByName('CODIGO').AsString + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if not buscas.IsEmpty then
    exit;

  Result := True;
end;

function TEstMotoCCIA.existeTipoOpVeiculo(pTp: string): boolean;
begin
 Result := true;

 pTp := Copy(trim(pTp), 1, 1);
 if  (pTp <> 'A') and (pTp <> 'C') and (pTp <> 'D') and (pTp <> 'E') and (pTp <> 'I')
 and (pTp <> 'O') and (pTp <> 'R') and (pTp <> 'T') and (pTp <> 'V') and (pTp <> '') then
 begin
   Result := false;
   Application.MessageBox(PChar('Tipo de Operação não existe: "' + pTp + '"'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
 end;
end;

function TEstMotoCCIA.InserirVeiculo(vTrans: Integer = 0): boolean;
var
 buscas2: TIBQuery;
begin
  Result := true;
  
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  if vTrans = 0 then  
    buscas2.Transaction := buscas.Transaction
  else 
    buscas2.Transaction := ComFat.buscas.Transaction;

  try
    if not (dataset.FieldByName('TIPV_VEICULO').AsString = 'I') then
      exit;
 
    if not ExecutaComandosSql(' SELECT FIRST 1 CHASSI FROM VEICULOS ' +
    	' WHERE CHASSI = ' + QuotedStr(dataset.FieldByName('CHASSI_C').AsString) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND ATIVO <> 99 ') then
    begin
     buscas.Close;
     buscas.SQL.Text := 'INSERT INTO VEICULOS (PLACA, CHASSI, CODIGO, COD_EMPRESA, COD_CLIENTE, ESPECIE, MARCA_V,' +
      ' MODELO, DESCMODELO, MOTOR, COR, ANOFAB, ANOMOD, CILINDROS, COMBUSTIVEL, CILINDRADA, LOTACAO, RENAVAM,' +
      ' DATA_VENDA, OBS, DATA_CAD, HORA_CAD, US_CAD, HP, ATIVO, COD_ESPE_SEG, TIPO_OS, COD_COR, COD_COMBUSTIVEL, ' +
      ' COD_MARCA, N_MOTOR, KM_V)' +
      ' VALUES (:PLACA, :CHASSI, :CODIGO, :COD_EMPRESA, :COD_CLIENTE, :ESPECIE, :MARCA_V,' +
      ' :MODELO, :DESCMODELO, :MOTOR, :COR, :ANOFAB, :ANOMOD, :CILINDROS, :COMBUSTIVEL, :CILINDRADA, :LOTACAO, :RENAVAM,' +
      ' :DATA_VENDA, :OBS, :DATA_CAD, :HORA_CAD, :US_CAD, :HP, :ATIVO, :COD_ESPE_SEG, :TIPO_OS, :COD_COR, :COD_COMBUSTIVEL, ' +
      ' :COD_MARCA, :N_MOTOR, :KM_V)';
     buscas.ParamByName('PLACA').AsString := dataset.FieldByName('PLACAEST').AsString;
     buscas.ParamByName('CHASSI').AsString := dataset.FieldByName('CHASSI_C').AsString;
     buscas.ParamByName('CODIGO').AsInteger := Gencodigo('VEICULOS', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
     buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.ParamByName('COD_CLIENTE').AsInteger := dataset.FieldByName('COD_CLIENTE').AsInteger;
     buscas.ParamByName('ESPECIE').AsString := dataset.FieldByName('TIPOEST').AsString;
     buscas.ParamByName('MARCA_V').AsString := vModVeic.dataSet.FieldByName('MARCA_DESC').AsString;
     buscas.ParamByName('MODELO').AsInteger := vModVeic.dataset.FieldByName('CODIGO').AsInteger;
     buscas.ParamByName('DESCMODELO').AsString := vModVeic.dataset.FieldByName('DESCRICAO').AsString;
     buscas.ParamByName('MOTOR').AsString := Copy(dataset.FieldByName('MOTOREST').AsString, 1, 21);
     buscas.ParamByName('COR').AsString := dataset.FieldByName('COREST').AsString;
     buscas.ParamByName('ANOFAB').AsInteger := dataset.FieldByName('ANO_FABEST').AsInteger;
     buscas.ParamByName('ANOMOD').AsInteger := dataset.FieldByName('ANO_MODEST').AsInteger;
     buscas.ParamByName('CILINDROS').AsInteger := dataset.FieldByName('CILINDROSEST').AsInteger;
     buscas.ParamByName('COMBUSTIVEL').AsString := dataset.FieldByName('COMBUSTIVELEST').AsString;
     buscas.ParamByName('CILINDRADA').AsFloat := dataset.FieldByName('CILINDRADAEST').AsFloat;
     buscas.ParamByName('LOTACAO').AsString := Copy(dataset.FieldByName('LOTACAOEST').AsString, 1, 10);
     buscas.ParamByName('RENAVAM').AsString := Copy(dataset.FieldByName('RENAVAMEST').AsString, 1, 9);
     buscas.ParamByName('DATA_VENDA').AsDate := vDadosIni.getDataBanco(buscas2);
     buscas.ParamByName('DATA_CAD').AsDate := vDadosIni.getDataBanco(buscas2);
     buscas.ParamByName('HORA_CAD').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas2));
     buscas.ParamByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;   
     buscas.ParamByName('HP').AsFloat := dataset.FieldByName('HPEST').AsFloat;
     buscas.ParamByName('ATIVO').AsInteger := 1;
     buscas.ParamByName('COD_ESPE_SEG').AsInteger := dataset.FieldByName('COD_ESPE_SEG').AsInteger;
     buscas.ParamByName('TIPO_OS').AsString := '';
     buscas.ParamByName('COD_COR').AsInteger := dataset.FieldByName('COD_COR').AsInteger;
     buscas.ParamByName('COD_COMBUSTIVEL').AsInteger := dataset.FieldByName('COD_COMBUSTIVEL').AsInteger;
     buscas.ParamByName('COD_MARCA').AsInteger := dataset.FieldByName('COD_MARCA').AsInteger;
     buscas.ParamByName('MOTOR').AsString := dataset.FieldByName('MOTOREST').AsString;
     if (dataset.FieldByName('STATUS_USO').AsString = 'N') then
     	buscas.ParamByName('KM_V').AsInteger := 0
     else
    	buscas.ParamByName('KM_V').AsInteger := 1;
     buscas.ExecSQL;

     Result := true;
    end;
  except
  on E: Exception do
   begin
     result := false;
     if inibeErro <> 'S' then
       Application.MessageBox(PChar('EST0006 ' + 'Erro ao ler executar comandos sql: ' +
           buscas.SQL.Text), 'Atenção', MB_ICONWARNING + MB_OK);
     inibeErro := 'N';
     registraErro('EST0006 ' + e.Message + ' ' + buscas.SQL.Text);
     RollBackTransacao;
     exit;
   end;
  end;
end;

function TEstMotoCCIA.insert: boolean;
begin
  Result := False;

//  if (vDadosIni.vEmp.vTipoEmpVeiculos = 'A') then
   if not abreFormStatusVeiculo(true) then
     exit;

   if not abreFormTipoVendaEstMotoCCIA(1) then
    exit;

   Result := inherited insert;

  if not result then
    Exit;

  dataSet.FieldByName('STATUS_USO').AsString := vDadosIni.vDtSetTmp.FieldByName('TIPO_VENDA_V').AsString;
  dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
  dataSet.FieldByName('NUM_NOTA').AsInteger := 0;
  dataSet.FieldByName('POSICAO').AsString := 'VIVO';
  dataSet.FieldByName('STATUS_RES').AsString := 'N';
  dataSet.FieldByName('STATUS_TRANSDEP').AsString := 'N';
  dataSet.FieldByName('STATUS_DEMONST').AsString := 'N';
  dataSet.FieldByName('STATUS_ESTOQUE').AsString := 'N';
  dataSet.FieldByName('DATA_CAD').AsDateTime := vDadosIni.getDataBanco(buscas);
  dataSet.FieldByName('HORA_CAD').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));
  dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
  AlterarStatus;

  {Preenchimento de campos}

  vEspecieVeic.abreEspecieVeiculo;
  vColaboradorVeic.abreLocColaborador;
  vModVeic.abreModVeiculos(dataSet.FieldByName('STATUS_USO').AsString);
  vMarcaVeic._AbreMarca;
  vCombustivelVeic.abreTipoCombustiveis;
  vCoresVeic._AbreCores;
  vDespesaVeic._AbreDespesa('');
  vPendenciaVeic._AbrePendencia('');
end;

function TEstMotoCCIA.pesquisar(pComfat: TComFat): Boolean;
var
  vSqlTmp: string;
begin
  try
    vSqlTmp := '';

     if (pComfat.vSing.vTipoVenda = 'N') then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.STATUS_USO = ''N'''
    else
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.STATUS_USO = ''U''';

    if (pComfat.vSing.vTipoVendaCFOP = 'I') then
      vSqlTmp := vSqlTmp + ' AND (COALESCE(EST_MOTO.STATUS_ESTOQUE, ''N'') = ''N'') AND COALESCE(EST_MOTO.NUM_NOTA, 0) = 0 '
    else if (pComfat.vSing.vNatureza = 'S') then
      if (pComfat.vSing.vTipoVendaCFOP = 'D') or (pComfat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString <> 'N') then
        vSqlTmp := vSqlTmp + ' AND EST_MOTO.STATUS_ESTOQUE = ''S'' AND COALESCE(EST_MOTO.NUM_NOTA, 0) > 0 '
      else
        vSqlTmp := vSqlTmp + ' AND (COALESCE(EST_MOTO.STATUS_ESTOQUE, ''N'') = ''N'') AND COALESCE(EST_MOTO.NUM_NOTA, 0) > 0 ';

    if (_dtIni <> '  /  /    ') and (_dtFim <> '  /  /    ') then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.DATA_CH_NOTA >= :dataIni and EST_MOTO.DATA_CH_NOTA <= :dataFim';

    if (_dtIni <> '  /  /    ') and (_dtFim = '  /  /    ') then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.DATA_CH_NOTA >= :dataIni';

    if (_dtIni = '  /  /    ') and (_dtFim <> '  /  /    ') then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.DATA_CH_NOTA <= :dataFim';

    if Trim(_chassi) <> '' then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.CHASSI_C LIKE ''%' + UpperCase(trim(_chassi)) + '%''';

    if Trim(_placa) <> '' then
    	if (Length(vDadosIni.apenasLetraseNumeros(_placa)) >= 5)
      	and (trim(vDadosIni.retornaPlacaNovaAntiga(_placa)) <> trim(_placa)) then
        	vSqlTmp := vSqlTmp + ' AND ((EST_MOTO.PLACAEST LIKE ''%' + UpperCase(trim(_placa)) + '%'') ' +
          	' OR (EST_MOTO.PLACAEST LIKE ''%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(_placa))) + '%'')) '
      else
      		vSqlTmp := vSqlTmp + ' AND EST_MOTO.PLACAEST LIKE ''%' + UpperCase(trim(_placa)) + '%''';

    if (_numNf > 0) then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.NUM_NOTA = ' + IntToStr(_numNf);

    if Trim(_cor) <> '' then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.COREST LIKE ''%' + UpperCase(trim(_cor)) + '%''';

    if Trim(_especie) <> '' then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.TIPOEST LIKE ''%' + UpperCase(trim(_especie)) + '%''';

    if Trim(_marca) <> '' then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.MARCAEST LIKE ''%' + UpperCase(trim(_marca)) + '%''';

    if Trim(_modelo) <> '' then
      vSqlTmp := vSqlTmp + ' AND EST_MOTO.DESCRICAO_VERSAOEST LIKE ''%' + UpperCase(trim(_modelo)) + '%''';

    vSqlTmp := vSqlTmp + ' AND (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'')';

    if (pComfat.vSing.vNatureza = 'E') then
    begin
      if pComfat.vSing.vTipoVendaCFOP = 'V' then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(EST_MOTO.MODELO_CFT, '''') = '''') ' +
         ' AND EST_MOTO.TIPV_VEICULO IN (' + QuotedStr('V') + ', ' + QuotedStr('D') + ', ' + QuotedStr('T') + ', ' + QuotedStr('A') + ', ' + QuotedStr('R') + ', ' + QuotedStr('E') + ')'
      else if pComfat.vSing.vTipoVendaCFOP = 'C' then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(EST_MOTO.MODELO_CFT, '''') = '''') ' +
         ' AND (EST_MOTO.TIPV_VEICULO = ' + QuotedStr('C') + ')'
    end
    else if (pComfat.vSing.vNatureza = 'S') then
    begin
      if (pComfat.vSing.vTipoVendaCFOP = 'V') or (pComfat.vSing.vTipoVendaCFOP = 'D') or (pComfat.vSing.vTipoVendaCFOP = 'T') or (pComfat.vSing.vTipoVendaCFOP = 'E') then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(EST_MOTO.MODELO_CFT, '''') = '''') OR (COALESCE(EST_MOTO.MODELO_CFT, '''') = ''CTRCOMPRA'')) ' +
         ' AND EST_MOTO.TIPV_VEICULO IN (' + QuotedStr('V') + ', ' + QuotedStr('D') + ', ' + QuotedStr('T') + ', ' + QuotedStr('R') + ', ' + QuotedStr('E') + ')'
      else if pComfat.vSing.vTipoVendaCFOP = 'C' then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(EST_MOTO.MODELO_CFT, '''') = '''') OR (COALESCE(EST_MOTO.MODELO_CFT, '''') = ''CTRENTCONS''))' +
         ' AND (EST_MOTO.TIPV_VEICULO = ' + QuotedStr('C') + ')'
      else if pComfat.vSing.vTipoVendaCFOP = 'R' then
        vSqlTmp := vSqlTmp + ' AND ((COALESCE(EST_MOTO.MODELO_CFT, '''') = '''') OR (COALESCE(EST_MOTO.MODELO_CFT, '''') = ''CTRCOMPRA'')) ' +
         ' AND (EST_MOTO.TIPV_VEICULO = ' + QuotedStr('D') + ')'
      else if (pComfat.vSing.vTipoVendaCFOP = 'I') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(EST_MOTO.MODELO_CFT, '''') = '''') ' +
         ' AND (EST_MOTO.TIPV_VEICULO = ' + QuotedStr('I') + ')'
      else if (pComfat.vSing.vTipoVendaCFOP = 'A') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(MODELO_CFT, '''') = '''') ' +
         ' AND (EST_MOTO.TIPV_VEICULO = ' + QuotedStr('A') + ')'
      else if (pComfat.vSing.vTipoVendaCFOP = 'E') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(EST_MOTO.MODELO_CFT, '''') = '''') ' +
         ' AND (EST_MOTO.TIPV_VEICULO <> ' + QuotedStr('I') + ') AND (EST_MOTO.TIPV_VEICULO <> ' + QuotedStr('A') + ')'
      else if (pComfat.vSing.vTipoVendaCFOP = 'O') then
        vSqlTmp := vSqlTmp + ' AND (COALESCE(EST_MOTO.MODELO_CFT, '''') = '''') ' +
         ' AND (EST_MOTO.TIPV_VEICULO <> ' + QuotedStr('I') + ') AND (EST_MOTO.TIPV_VEICULO <> ' + QuotedStr('A') + ')';
    end;

    dataSet.Close;
    dataSet.CommandText := ' SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO  ' +
      ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
      ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
      ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
      ' WHERE EST_MOTO.ATIVO = 1 AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa + vSqlTmp;

    if (_dtIni <> '  /  /    ') and (_dtFim <> '  /  /    ') then
    begin
      dataSet.Params[0].AsDate := StrToDate(_dtIni);
      dataSet.Params[1].AsDate := StrToDate(_dtFim);
    end;

    if (_dtIni <> '  /  /    ') and (_dtFim = '  /  /    ') then
      dataSet.Params[0].AsDate := StrToDate(_dtIni);

    if (_dtIni = '  /  /    ') and (_dtFim <> '  /  /    ') then
      dataSet.Params[0].AsDate := StrToDate(_dtFim);

    dataSet.Open;

    _dtIni := '  /  /    ';
    _dtFim := '  /  /    ';
    _numNf := 0;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao realizar consulta: TEstMotoCCIA.pesquisar '+ e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TEstMotoCCIA.post: boolean;
var
  acao: string;
  pTemp: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('POSICAO').AsString) = '' then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Posição não informada!', 'DBComboBox7');
    end;

    if trim(dataSet.FieldByName('POSICAO').AsString) <> 'TRANSITO' then
      if trim(dataSet.FieldByName('STATUS_USO').AsString) = '' then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        raiseExceptionCreate('Situação não informado!', 'DBComboBox3');
      end;

    if trim(dataSet.FieldByName('CHASSI_C').AsString) = '' then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Número do Chassi não informado!', 'DBEdit18');
    end;

    if vDadosIni.vEmp.vAcrescCaracteresChassi = 'S' then
     if (Length(Trim(dataSet.FieldByName('CHASSI_C').AsString)) <> 17) then
       dataSet.FieldByName('CHASSI_C').AsString := vDadosIni.StrZero(trim(dataSet.FieldByName('CHASSI_C').AsString), 17);

    if (Length(Trim(dataSet.FieldByName('CHASSI_C').AsString)) <> 17) then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Número do Chassi deve conter 17 dígitos', 'DBEdit18');
    end;

    if trim(dataSet.FieldByName('STATUS_USO').AsString) = 'U' then
      if trim(dataSet.FieldByName('PLACAEST').AsString) = '' then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        raiseExceptionCreate('Placa não informada!', 'DBEdit26');
      end;

    if not verificajacad(2) then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Veiculo já cadastrado no estoque!', 'DBEdit18');
    end;

    if (trim(dataSet.FieldByName('STATUS_USO').AsString) = 'U') and (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A') then
      if trim(dataSet.FieldByName('ESTOQUE').AsString) = '' then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        raiseExceptionCreate('Origem do Estoque não informado!', 'DBComboBox6');
      end;

    if dataSet.FieldByName('VERSAOEST').AsInteger <= 0 then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Modelo não informado!', 'DBEdit31');
    end;

    if not vModVeic.buscarModelo(dataSet.FieldByName('VERSAOEST').AsInteger, 0, dataSet.FieldByName('STATUS_USO').AsString) then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Modelo não encontrado!', 'DBEdit31');
    end;

    if dataSet.FieldByName('COD_MARCA').AsInteger <= 0 then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Marca não informada!', 'DBLookupComboBox8');
    end;

    if not vMarcaVeic.buscarMarca(dataSet.FieldByName('COD_MARCA').AsInteger) then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Marca não encontrada!', 'DBLookupComboBox8');
    end;

    try
      if (trim(dataSet.FieldByName('LOTACAOEST').AsString) = '') or (StrToInt(trim(dataSet.FieldByName('LOTACAOEST').AsString)) <= 0) then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        raiseExceptionCreate('Lotação não encontrada!', 'DBComboBox2');
      end;
    except
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Lotação não encontrada!', 'DBComboBox2');
    end;

    if dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger <= 0 then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Tipo de combustível não informado!', 'DBLookupComboBox9');
    end;
    if not vCombustivelVeic.buscarCombustivel(dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger) then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Tipo de combustível não encontrado!', 'DBLookupComboBox9');
    end;

    if dataSet.FieldByName('COD_COR').AsInteger <= 0 then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Cor não informada!', 'DBEdit27');
    end;
    if not vCoresVeic.buscarCor(dataSet.FieldByName('COD_COR').AsInteger) then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Cor não encontrada!', 'DBEdit27');
    end;
//    if dataSet.FieldByName('CLIENTES_V').AsInteger <= 0 then
//      raiseExceptionCreate('Comprador não informado!', 'DBEdit2');

    if dataSet.FieldByName('COD_ESPE_SEG').AsInteger <= 0 then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Tp Fins Seg (Espécie Veículo) não informado!', 'DBLookupComboBox5');
    end;
    if not vEspecieVeic.buscarEspecie(dataSet.FieldByName('COD_ESPE_SEG').AsInteger) then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Tp Fins Seg (Espécie Veículo) não encontrado!', 'DBLookupComboBox5');
    end;

    if dataSet.FieldByName('ANO_FABEST').AsInteger <= 0 then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Ano de fabricação não informado!', 'DBEdit11');
    end;

    if dataSet.FieldByName('ANO_MODEST').AsInteger <= 0 then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Ano modelo não informado!', 'DBEdit33');
    end;

    if (trim(dataSet.FieldByName('STATUS_USO').AsString) = 'N') or (vDadosIni.vVeic.TestarDetEspec) then
    begin
      if dataSet.FieldByName('CILINDROSEST').AsInteger <= 0 then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        raiseExceptionCreate('Cilindros não informado!', 'DBEdit35');
      end;
    end;

    if (trim(dataSet.FieldByName('STATUS_USO').AsString) = 'N') or (vDadosIni.vVeic.TestarDetEspec) then
    begin
      if dataSet.FieldByName('CILINDRADAEST').AsInteger <= 0 then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        raiseExceptionCreate('Cilindradas não informado!', 'DBEdit28');
      end;
    end;

    if dataSet.FieldByName('COD_FORNECEDOR').AsInteger <= 0 then
      raiseExceptionCreate('Fornecedor não informado!', 'DBEdit2');
    if not vFornecedorVeic.abreClientes(dataSet.FieldByName('COD_FORNECEDOR').AsInteger) then
      raiseExceptionCreate('Fornecedor não encontrado!', 'DBEdit2');

    if (trim(dataSet.FieldByName('STATUS_USO').AsString) = 'N') or (vDadosIni.vVeic.TestarDetEspec) then
    begin
      if trim(dataSet.FieldByName('RENAVAMEST').AsString) = '' then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        raiseExceptionCreate('Renavam não informado!', 'DBEdit43');
      end;
    end;

    if (trim(dataSet.FieldByName('STATUS_USO').AsString) = 'N') or (vDadosIni.vVeic.TestarDetEspec) then
    begin
      if trim(dataSet.FieldByName('MOTOREST').AsString) = '' then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        raiseExceptionCreate('Motor não informado!', 'DBEdit5');
      end;
    end;

    if dataSet.FieldByName('PRECO_CUSTO').AsFloat <= 0 then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Preço de Custo não informado!', 'DBEdit17');
    end;

    if trim(dataSet.FieldByName('TIPV_VEICULO').AsString) = '' then
    begin
      frmEstMotosCCIA.TabSheet_Dados.Show;
      raiseExceptionCreate('Tipo de Operação não informado!', 'DBComboBox1');
    end;

   if dataSet.FieldByName('PRECO_SUG_VND').AsFloat <= 0 then
     dataSet.FieldByName('PRECO_SUG_VND').AsFloat := vModVeic.dataSet.FieldByName('VALTAB').AsFloat;

   if dataSet.FieldByName('PRECO_SUG_VND').AsFloat <= 0 then
   begin
     frmEstMotosCCIA.TabSheet_Dados.Show;
     raiseExceptionCreate('Valor Sugerido para Venda não informado!', 'DBEdit9');
   end;

    if (trim(dataSet.FieldByName('POSICAO').AsString) = 'TRANSITO')
      and (dataSet.FieldByName('COD_NF').AsInteger <= 0)
      and (trim(dataSet.FieldByName('MODELO_NF').AsString) = '') then
        dataSet.FieldByName('MODELO_NF').AsString := 'TRA'
    else if (trim(dataSet.FieldByName('POSICAO').AsString) <> 'TRANSITO')
      and (trim(dataSet.FieldByName('STATUS_CANC').AsString) <> 'S')
      and (trim(dataSet.FieldByName('MODELO_NF').AsString) = 'TRA') then
        dataSet.FieldByName('MODELO_NF').Value := Null;

    dataSet.FieldByName('LOTACAOEST').AsString := trim(dataSet.FieldByName('LOTACAOEST').AsString);
    dataSet.FieldByName('LOTACAOEST').AsString := vDadosIni.StrZero(dataSet.FieldByName('LOTACAOEST').AsInteger, 2);
    dataSet.FieldByName('MARCAEST').AsString := Trim(vMarcaVeic.dataSet.FieldByName('DESCRICAO_MARCA').AsString);
    dataSet.FieldByName('DESCRICAO_VERSAOEST').AsString := Trim(vModVeic.dataSet.FieldByName('DESCRICAO').AsString);
    dataSet.FieldByName('TIPOEST').AsString := Trim(vEspecieVeic.dataSet.FieldByName('DESCRICAO_ESP').AsString);
    dataSet.FieldByName('COREST').AsString := Trim(vCoresVeic.dataSet.FieldByName('DESCRICAO_CORRED').AsString);
    dataSet.FieldByName('TIP_PINTURA').AsString := Copy(Trim(vCoresVeic.dataSet.FieldByName('TIPO_PINTURA').AsString), 1, 1);
    dataSet.FieldByName('COMBUSTIVELEST').AsString := Trim(vCombustivelVeic.dataSet.FieldByName('DESCR_COMB').AsString);
    dataSet.FieldByName('NSERIE').AsString := copy(trim(dataSet.FieldByName('CHASSI_C').AsString), 9, 9);

//    InserirVeiculo;

    if dataSet.State in [dsInsert] then
      dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('EST_MOTO', DtmVeiculosCCIA.SpIncCodigoV,
        vDadosIni.codEmpresa);
    vDadosIni.vPesquisa := dataSet.FieldByName('CHASSI_C').AsString;

    if (vDadosIni.vTipoForm = 5) then
    begin
      if (dataSet.State = dsInsert) then
        acao := 'INSERIR'
      else
        acao := 'EDITAR';
    end;

    Result := inherited post;

    if (dataSet.ChangeCount > 0) and (trim(acao) = 'EDITAR') then
      if not AtualizarDadosVeiculo(pTemp) then
      begin
        frmEstMotosCCIA.TabSheet_Dados.Show;
        if trim(pTemp) <> '' then
          raiseExceptionCreate(pTemp, '');
      end;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI061', acao, 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI061', acao, 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);
    if Result then
      Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TEstMotoCCIA.PreencherDatasetvDadosIni(datasettemp: TClientDataSet; vComFat: boolean; pTipveiculo: string = ''; vEdit: boolean = false);
begin
  vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
  vDadosIni.vDtSetTmp.Close;
  vDadosIni.vDtSetTmp.FieldDefs.Clear;
  vDadosIni.vDtSetTmp.FieldDefs.Add('TIPO', ftString, 3, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('NATUREZA', ftString, 1, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('TIPO_VENDA_V', ftString, 1, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('MODELO', ftString, 10, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('CODIGO', ftInteger, 0, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('CHASSI_C', ftString, 20, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('PLACAEST', ftString, 10, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('MODELO_CFT', ftString, 10, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('MODELO_CFTV', ftString, 10, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('TIPV_VEICULO', ftString, 1, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('NOME_CONTRATO', ftString, 50, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('STATUS_ESTOQUE', ftString, 1, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('ALTERA_ESTOQUE_CFOP', ftString, 1, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('COMFAT', ftBoolean, 0, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('NUM_NOTA', ftInteger, 0, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('NUM_NOTAV', ftInteger, 0, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('POSICAO', ftString, 16, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('EDITAR', ftBoolean, 0, false);

  if vDadosIni.vDtSetTmp.Tag = 0 then
  try
    vDadosIni.vDtSetTmp.CreateDataSet;
    vDadosIni.vDtSetTmp.Tag := 1;
  except
  end;

  vDadosIni.vDtSetTmp.EmptyDataSet;
  vDadosIni.vDtSetTmp.Insert;
  vDadosIni.vDtSetTmp.FieldByName('TIPO_VENDA_V').AsString := datasettemp.FieldByName('STATUS_USO').AsString;
  vDadosIni.vDtSetTmp.FieldByName('CODIGO').AsInteger := datasettemp.FieldByName('CODIGO').AsInteger;
  vDadosIni.vDtSetTmp.FieldByName('CHASSI_C').AsString := datasettemp.FieldByName('CHASSI_C').AsString;
  vDadosIni.vDtSetTmp.FieldByName('PLACAEST').AsString := datasettemp.FieldByName('PLACAEST').AsString;
  vDadosIni.vDtSetTmp.FieldByName('MODELO_CFT').AsString := datasettemp.FieldByName('MODELO_CFT').AsString;
  vDadosIni.vDtSetTmp.FieldByName('MODELO_CFTV').AsString := datasettemp.FieldByName('MODELO_CFTV').AsString;
  vDadosIni.vDtSetTmp.FieldByName('STATUS_ESTOQUE').AsString := datasettemp.FieldByName('STATUS_ESTOQUE').AsString;
  if trim(pTipveiculo) <> '' then
    vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := trim(pTipveiculo)
  else
    vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := datasettemp.FieldByName('TIPV_VEICULO').AsString;
  vDadosIni.vDtSetTmp.FieldByName('NUM_NOTA').AsInteger := datasettemp.FieldByName('NUM_NOTA').AsInteger;
  vDadosIni.vDtSetTmp.FieldByName('NUM_NOTAV').AsInteger := datasettemp.FieldByName('NUM_NOTAV').AsInteger;
  vDadosIni.vDtSetTmp.FieldByName('POSICAO').AsString := datasettemp.FieldByName('POSICAO').AsString;
  vDadosIni.vDtSetTmp.FieldByName('COMFAT').Value := vComFat;
  vDadosIni.vDtSetTmp.FieldByName('EDITAR').Value := vEdit;
  vDadosIni.vDtSetTmp.Post;


  if datasettemp.FieldByName('CODIGO').AsInteger > 0 then
    if trim(vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString) = '' then
      Application.MessageBox(PChar('Tipo OP não informado! ' + #13 +
       'Veículo ' + QuotedStr(Trim(vDadosIni.vDtSetTmp.FieldByName('CHASSI_C').AsString)) + '.' + #13 +
       'Favor informar para continuar!'), 'Atenção', 0 + 64);
end;

function TEstMotoCCIA.setarDadosComando(pComfat: TComFat; vit: integer = 0; vStatusV: string = ''): boolean;
begin
 try
    montaSelect('SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO  ' +
      ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
      ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
      ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
      ' WHERE EST_MOTO.CHASSI_C = ' + QuotedStr(trim(pComfat.dataSet.FieldByName('CHASSIV').AsString)) +
      ' AND EST_MOTO.CODIGO = ' + IntToStr(pComfat.dataSet.FieldByName('COD_ESTMOTO').AsInteger) +
      ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa);

    if dataSet.State <> dsEdit then
      dataSet.Edit;

    if vit = 0 then
    begin
      if  (UpperCase(trim(pComfat.dataSet.FieldByName('STATUS_V').AsString)) = 'FECHADO') then
      begin
        if (pComfat.dataSet.FieldByName('NATUREZA').AsString = 'S') then
        begin
          if trim(dataSet.FieldByName('STATUS_RES').AsString) <> 'S' then
            dataSet.FieldByName('COD_CLIENTE').AsInteger := pComfat.dataSet.FieldByName('CLIENTES_V').AsInteger;
          dataSet.FieldByName('VALOR_VEN').AsFloat := pComfat.dataSet.FieldByName('VALOR_REAL').AsFloat;
          dataSet.FieldByName('DATA_VEN').AsDateTime := vDadosIni.getDataBanco(buscas);
          dataSet.FieldByName('N_COMANDOV').AsInteger := pComfat.dataSet.FieldByName('N_COMANDO').AsInteger;
          dataSet.FieldByName('MODELO_CFTV').AsString := pComfat.dataSet.FieldByName('MODELO').AsString;
        end
        else
        begin
          dataSet.FieldByName('VL_COMPRA').AsFloat := pComfat.dataSet.FieldByName('VALOR_REAL').AsFloat;
          dataSet.FieldByName('DATA_COMPRA').AsDateTime := vDadosIni.getDataBanco(buscas);
          dataSet.FieldByName('N_COMANDO').AsInteger := pComfat.dataSet.FieldByName('N_COMANDO').AsInteger;
          dataSet.FieldByName('MODELO_CFT').AsString := pComfat.dataSet.FieldByName('MODELO').AsString;
        end;

        dataSet.FieldByName('TIPV_VEICULO').AsString := pComfat.dataSet.FieldByName('TIPV_VEICULO').AsString;
        dataSet.Post;
      end;
    end
    else
    begin
        if (pComfat.dataSet.FieldByName('NATUREZA').AsString = 'S') then
        begin
          if trim(vStatusV) = 'FECHADO' then
            if dataSet.FieldByName('N_COMANDOV').AsInteger = pComfat.dataSet.FieldByName('N_COMANDO').AsInteger then
            begin
              dataSet.FieldByName('COD_CLIENTE').Value := Null;
              dataSet.FieldByName('VALOR_VEN').Value := Null;
              dataSet.FieldByName('DATA_VEN').Value := Null;
              dataSet.FieldByName('N_COMANDOV').Value := Null;
              dataSet.FieldByName('MODELO_CFTV').Value := Null;
              dataSet.FieldByName('TIPV_VEICULO').AsString := pComfat.dataSet.FieldByName('TIPV_EST').AsString;
              if trim(pComfat.dataSet.FieldByName('TIPV_VEICULO').AsString) = 'T' then
                if dataSet.FieldByName('STATUS_TRANSDEP').AsString = 'S' then
                  dataSet.FieldByName('STATUS_TRANSDEP').AsString := 'N';

              buscas.Close;
              buscas.SQL.Text := 'update est_moto set usado_troca = ''N'', n_comando_troca = null ' +
                ' where n_comando_troca = ' +IntToStr(pComfat.dataSet.FieldByName('N_COMANDO').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa;
              buscas.ExecSQL;
            end;
        end
        else
        begin
          if trim(vStatusV) = 'FECHADO' then
            if dataSet.FieldByName('N_COMANDO').AsInteger = pComfat.dataSet.FieldByName('N_COMANDO').AsInteger then
            begin
              dataSet.FieldByName('VL_COMPRA').Value := Null;
              dataSet.FieldByName('DATA_COMPRA').Value := Null;
              dataSet.FieldByName('N_COMANDO').Value := Null;
              dataSet.FieldByName('MODELO_CFT').Value := Null;
              dataSet.FieldByName('TIPV_VEICULO').AsString := pComfat.dataSet.FieldByName('TIPV_EST').AsString;
            end;
        end;
        if vit = 2 then
        begin
          if trim(vStatusV) = 'FECHADO' then
            if (UpperCase(trim(dataSet.FieldByName('POSICAO').AsString)) = 'MORTO')
            and (pComfat.dataSet.FieldByName('NATUREZA').AsString = 'S') then
            begin
              if (pComfat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString = 'S') then
                dataSet.FieldByName('STATUS_ESTOQUE').AsString := 'S';
              dataSet.FieldByName('POSICAO').AsString := 'VIVO';
            end;
        end;
        dataSet.Post;
    end;

    vDadosIni.vHistV.vChassi := dataSet.FieldByName('CHASSI_C').AsString;
    vDadosIni.vHistV.vCodigo := dataSet.FieldByName('CODIGO').AsInteger;
    vDadosIni.vHistV.vNatureza := pComfat.dataSet.FieldByName('NATUREZA').AsString;
    vDadosIni.vHistV.vNumDoc := pComfat.dataSet.FieldByName('N_COMANDO').AsInteger;
    vDadosIni.vHistV.vPlaca := dataSet.FieldByName('PLACAEST').AsString;
    vDadosIni.vHistV.vTipo := pComfat.dataSet.FieldByName('TIPO').AsString;
    vDadosIni.vHistV.vModelo := pComfat.dataSet.FieldByName('MODELO').AsString;
    vDadosIni.vHistV.vValorOP := pComfat.dataSet.FieldByName('VALOR_REAL').AsFloat;
    vDadosIni.vHistV.vData := pComfat.dataSet.FieldByName('DT_ENT_SAID').AsString;
    vDadosIni.vHistV.vNatOP := pComfat.dataSet.FieldByName('NATOP_V').AsFloat;
    vDadosIni.vHistV.vTipoVenda := pComfat.dataSet.FieldByName('TIPO_VENDA_V').AsString;
    vDadosIni.vHistV.vCodCliente := pComfat.dataSet.FieldByName('CLIENTES_V').AsInteger;
    vDadosIni.vHistV.vCodCliVend := pComfat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger;
    vDadosIni.vHistV.vCodGerente := pComfat.dataSet.FieldByName('COD_GERENTE').AsInteger;
    vDadosIni.vHistV.vCodConcess := pComfat.dataSet.FieldByName('COD_CONCESS').AsInteger;
    vDadosIni.vHistV.vCodIntermed := pComfat.dataSet.FieldByName('COD_INTERMED').AsInteger;
    vDadosIni.vHistV.vCodVendedor := pComfat.dataSet.FieldByName('COVEND_V').AsInteger;
    vDadosIni.vHistV.vCodCondPag := pComfat.dataSet.FieldByName('CONDPAG_V').AsInteger;
    vDadosIni.vHistV.vPrecCusto := dataSet.FieldByName('PRECO_CUSTO').AsFloat;
    vDadosIni.vHistV.vPrecTabEst := dataSet.FieldByName('PRECO_TABEST').AsFloat;
    vDadosIni.vHistV.vRedLucro := dataSet.FieldByName('RED_LUCRO').AsString;
    vDadosIni.vHistV.vTipvVeiculo := dataSet.FieldByName('TIPV_VEICULO').AsString;
    vDadosIni.vHistV.vStatusDemonst := dataSet.FieldByName('STATUS_DEMONST').AsString;
    vDadosIni.vHistV.vStatusEstoque := dataSet.FieldByName('STATUS_ESTOQUE').AsString;
    vDadosIni.vHistV.vStatusRes := dataSet.FieldByName('STATUS_RES').AsString;
    vDadosIni.vHistV.vStatusTransD := dataSet.FieldByName('STATUS_TRANSDEP').AsString;
    vDadosIni.vHistV.vStatusUso := dataSet.FieldByName('STATUS_USO').AsString;
    vDadosIni.vHistV.vStatusV := pComfat.dataSet.FieldByName('STATUS_V').AsString;
    vDadosIni.vHistV.vPosicao := dataSet.FieldByName('POSICAO').AsString;
    vDadosIni.vHistV.vAlteraEstoqueCFOP := pComfat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString;
    vDadosIni.vHistV.vNumOS := pComfat.dataSet.FieldByName('N_OS').AsInteger;
    vDadosIni.vHistV.vNumNota := pComfat.dataSet.FieldByName('NUM_NOTA_V').AsInteger;
    vDadosIni.vHistV.vSerieNF := pComfat.dataSet.FieldByName('SERIE').AsString;
    vDadosIni.vHistV.vModeloNF := pComfat.dataSet.FieldByName('MODELO_NF').AsString;
    vDadosIni.GravarHistEstMoto(buscas, DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.vHistV);

    if (dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

  except
    on E: Exception do
    begin
      result := false;
      if inibeErro <> 'S' then
        Application.MessageBox(PChar('Erro ao Gravar Histórico Veículo.'), 'Atenção', MB_ICONWARNING + MB_OK);
      inibeErro := 'N';
      registraErro('E0007 ' + e.Message);
      RollBackTransacao;
      exit;
    end;
  end;
end;

function TEstMotoCCIA.verificajacad(vit: integer): boolean;
var
 pWhere: string;
begin
  result := true;

  vcodestmotopesq := 0;
  vchassiestmotopesq := '';
  vplacaestmotopesq := '';

  if vit = 1 then
  begin
    buscas.Close;
    buscas.sql.text := 'select * from est_moto ' +
    	' where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSI_C').AsString) +
      ' and codigo <> ' + inttostr(dataset.FieldByName('CODIGO').AsInteger) +
      ' and (trim(coalesce(posicao, ''VIVO'')) <> ''MORTO'') ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.open;
    if not buscas.isempty then
    begin
      result := true;
      vcodestmotopesq := buscas.FieldByName('CODIGO').AsInteger;
      vchassiestmotopesq := buscas.FieldByName('CHASSI_C').AsString;
      vplacaestmotopesq := buscas.FieldByName('PLACAEST').AsString;
    end
    else
    begin
      if dataSet.State <> dsInsert then
      begin
        Result := false;
        exit;
      end;

      buscas.Close;
      buscas.sql.text := ' select placaest, versaoest, descricao_versaoest, ' +
        ' cod_marca, marcaest, cod_combustivel, combustivelest, ' +
        ' cod_cor, corest, cod_fornecedor, ano_fabest, ano_modest, cilindradaest, cilindrosest, ' +
        ' hpest, preco_custo, preco_custo_rep, preco_custo_desp, cod_cliente, ' +
        ' perc_red, red_lucro, preco_tabest, preco_sug_vnd, vl_compra, estoque, ' +
        ' lotacaoest, motorest, cod_espe_seg, renavamest, status_uso, tipoest ' +
        ' from est_moto ' +
        ' where chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSI_C').AsString) +
        ' and codigo <> ' + inttostr(dataset.FieldByName('CODIGO').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' order by codigo desc ';
      buscas.open;

      if (not buscas.isempty) then
      begin
        if Application.MessageBox('Veiculo movimentado anteriormente, deseja importar os dados?',
          'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        buscas.Close;
        buscas.sql.text := ' select placa as placaest, modelo versaoest, descmodelo as descricao_versaoest, ' +
          ' cod_marca, marca_v as marcaest, cod_combustivel, combustivel as combustivelest, ' +
      		' cod_cor, cor as corest, null as cod_fornecedor, anofab as ano_fabest, anomod as ano_modest, ' +
          ' cilindrada as cilindradaest, cilindros as cilindrosest, ' +
          ' hp as hpest, null preco_custo, null preco_custo_rep, null preco_custo_desp, ' +
          ' cod_cliente, null perc_red, null red_lucro, null preco_tabest, null preco_sug_vnd, ' +
          ' null vl_compra, ''T'' estoque, lotacao as lotacaoest, motor as motorest, ' +
          ' cod_espe_seg, renavam as renavamest, ''U'' status_uso, especie as tipoest from veiculos ' +
          ' where chassi = ' + QuotedStr(dataSet.FieldByName('CHASSI_C').AsString) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and ativo <> 99 ' +
          ' order by codigo desc ';
        buscas.Open;

        if (not buscas.isempty) then
          if Application.MessageBox('Veiculo movimentado na Oficina, deseja importar os dados?',
            'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
            exit;
      end;
        
      if (not buscas.isempty)  then
      begin
        dataSet.FieldByName('PLACAEST').Value := buscas.FieldByName('PLACAEST').Value;
        dataSet.FieldByName('VERSAOEST').Value := buscas.FieldByName('VERSAOEST').Value;
        dataSet.FieldByName('DESCRICAO_VERSAOEST').Value := buscas.FieldByName('DESCRICAO_VERSAOEST').Value;
        dataSet.FieldByName('COD_MARCA').Value := buscas.FieldByName('COD_MARCA').Value;
        dataSet.FieldByName('MARCAEST').Value := buscas.FieldByName('MARCAEST').Value;
        dataSet.FieldByName('COD_COMBUSTIVEL').Value := buscas.FieldByName('COD_COMBUSTIVEL').Value;
        dataSet.FieldByName('COMBUSTIVELEST').Value := buscas.FieldByName('COMBUSTIVELEST').Value;        
        dataSet.FieldByName('COD_COR').Value := buscas.FieldByName('COD_COR').Value;
        dataSet.FieldByName('COREST').Value := buscas.FieldByName('COREST').Value;
        dataSet.FieldByName('COD_FORNECEDOR').Value := buscas.FieldByName('COD_FORNECEDOR').Value;
        dataSet.FieldByName('ANO_FABEST').Value := buscas.FieldByName('ANO_FABEST').Value;
        dataSet.FieldByName('ANO_MODEST').Value := buscas.FieldByName('ANO_MODEST').Value;
        dataSet.FieldByName('CILINDRADAEST').Value := buscas.FieldByName('CILINDRADAEST').Value;
        dataSet.FieldByName('CILINDROSEST').Value := buscas.FieldByName('CILINDROSEST').Value;
        dataSet.FieldByName('HPEST').Value := buscas.FieldByName('HPEST').Value;
        dataSet.FieldByName('PRECO_CUSTO').Value := buscas.FieldByName('PRECO_CUSTO').Value;
        dataSet.FieldByName('PRECO_CUSTO_REP').Value := buscas.FieldByName('PRECO_CUSTO_REP').Value;
        dataSet.FieldByName('PRECO_CUSTO_DESP').Value := buscas.FieldByName('PRECO_CUSTO_DESP').Value;
        dataSet.FieldByName('COD_CLIENTE').Value := buscas.FieldByName('COD_CLIENTE').Value;
        dataSet.FieldByName('PERC_RED').Value := buscas.FieldByName('PERC_RED').Value;
        dataSet.FieldByName('RED_LUCRO').Value := buscas.FieldByName('RED_LUCRO').Value;
        dataSet.FieldByName('PRECO_TABEST').Value := buscas.FieldByName('PRECO_TABEST').Value;
        dataSet.FieldByName('PRECO_SUG_VND').Value := buscas.FieldByName('PRECO_SUG_VND').Value;
        dataSet.FieldByName('VL_COMPRA').Value := buscas.FieldByName('VL_COMPRA').Value;
        dataSet.FieldByName('ESTOQUE').Value := buscas.FieldByName('ESTOQUE').Value;
        dataSet.FieldByName('LOTACAOEST').Value := buscas.FieldByName('LOTACAOEST').Value;
        dataSet.FieldByName('MOTOREST').Value := buscas.FieldByName('MOTOREST').Value;
        dataSet.FieldByName('COD_ESPE_SEG').Value := buscas.FieldByName('COD_ESPE_SEG').Value;
        dataSet.FieldByName('RENAVAMEST').Value := buscas.FieldByName('RENAVAMEST').Value;
        dataSet.FieldByName('STATUS_USO').Value := buscas.FieldByName('STATUS_USO').Value;
        dataSet.FieldByName('TIPOEST').Value := buscas.FieldByName('TIPOEST').Value;

        if frmEstMotosCCIA <> nil then
        begin
          frmEstMotosCCIA.DBComboBox3.ItemIndex := vDadosIni.IfThen(dataSet.FieldByName('STATUS_USO').Value = 'N', 0, 1);
          frmEstMotosCCIA.DBComboBox6.ItemIndex := vDadosIni.IfThen(dataSet.FieldByName('ESTOQUE').Value = 'P', 0,
            vDadosIni.IfThen(dataSet.FieldByName('ESTOQUE').Value = '0', 2, 1));

          frmEstMotosCCIA.DBComboBox3Exit(frmEstMotosCCIA.DBEdit3);
          frmEstMotosCCIA.DBEdit31Exit(frmEstMotosCCIA.DBEdit31);

          frmEstMotosCCIA.DBEdit26.Enabled := dataSet.FieldByName('STATUS_USO').AsString = 'N';
          frmEstMotosCCIA.Label8.Visible := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A')
          	and (dataSet.FieldByName('STATUS_USO').AsString = 'U');
          frmEstMotosCCIA.DBComboBox6.Visible := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A')
          	and (dataSet.FieldByName('STATUS_USO').AsString = 'U');
        end;
        vModVeic.buscarModelo(dataSet.FieldByName('VERSAOEST').AsInteger, 0, dataSet.FieldByName('STATUS_USO').AsString);
        vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').asinteger, 'S');
        vFornecedorVeic.abreClientes(dataSet.FieldByName('COD_FORNECEDOR').asinteger, 'E');
      end;
      
      Result := false;
    end;
  end
  else
  begin
    if dataSet.FieldByName('CODIGO').AsInteger > 0 then
      pWhere := ' and codigo <> ' + IntToStr(dataSet.FieldByName('CODIGO').AsInteger);

    buscas.Close;
    buscas.sql.text := 'select * from est_moto where chassi_c = ''' + dataSet.FieldByName('CHASSI_C').AsString +
      ''' and codigo <> ' + inttostr(dataset.FieldByName('CODIGO').AsInteger) +
      ' and (trim(coalesce(posicao, ''VIVO'')) <> ''MORTO'') and cod_empresa = ' + vDadosIni.codEmpresa + pWhere;
    buscas.open;
    if not buscas.isempty then
      result := false;
  end;
end;

function TEstMotoCCIA._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

function TEstMotoCCIA.AbreEstMoto(pCod: Integer; pChassi: string; pEditar: boolean = false): boolean;
begin
   if pEditar then
     result := montaSelect(' SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
      ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
      ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
      ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
      ' WHERE EST_MOTO.CODIGO = ' + inttostr(pCod) +
      ' AND EST_MOTO.CHASSI_C =' + QuotedStr(pChassi) +
      ' AND EST_MOTO.COD_EMPRESA =' + vDadosIni.codEmpresa +
      ' AND (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'')' +
      ' ORDER BY EST_MOTO.CODIGO DESC')
   else
     result := montaSelect(' SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
      ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
      ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
      ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
      ' WHERE EST_MOTO.CODIGO = ' + inttostr(pCod) +
      ' AND EST_MOTO.CHASSI_C =' + QuotedStr(pChassi) +
      ' AND EST_MOTO.COD_EMPRESA =' + vDadosIni.codEmpresa);

  if pEditar then
   Edit;

end;

function TEstMotoCCIA.AbreEstMoto(pChassi: string): boolean;
begin
  montaSelect(' SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
    ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
    ' WHERE EST_MOTO.CHASSI_C = ' + QuotedStr(pChassi) +
    ' AND (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') AND EST_MOTO.COD_EMPRESA =' + vDadosIni.codEmpresa);
  Result := dataSet.IsEmpty;
end;

function TEstMotoCCIA.AbreEstMoto(pCod: Integer): boolean;
begin
  montaSelect(' SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
    ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
    ' WHERE EST_MOTO.CODIGO = ' + inttostr(pCod) + ' AND EST_MOTO.COD_EMPRESA =' + vDadosIni.codEmpresa);
  Result := dataSet.IsEmpty;
end;

function TEstMotoCCIA.abreFormAlterarEstoque: boolean;
var
  formulario: TfrmPadrao;
begin
 try
   formulario := TfrmPadrao.Create(Application);
   formulario.Width := 505;
   formulario.Height := 168;
   formulario.Position := poScreenCenter;
   formulario.Caption := 'Alterar Estoque';
   frmEstMotosCCIA.PnEstoque.Parent := formulario;
   formulario.AutoSize := True;
   formulario.AutoScroll := False;
   formulario.ShowHint := true;
   formulario.BorderIcons := [];
   if trim(dataSet.FieldByName('STATUS_ESTOQUE').AsString) <> 'S' then
     frmEstMotosCCIA.ComboBox6.ItemIndex := 0
   else
     frmEstMotosCCIA.ComboBox6.ItemIndex := 1;
   if trim(dataSet.FieldByName('POSICAO').AsString) = 'VIVO' then
   	 frmEstMotosCCIA.cbPosicaoVeic.ItemIndex := 0
   else if trim(dataSet.FieldByName('POSICAO').AsString) = 'MORTO' then
     frmEstMotosCCIA.cbPosicaoVeic.ItemIndex := 1
   else if trim(dataSet.FieldByName('POSICAO').AsString) = 'TRANSITO' then
     frmEstMotosCCIA.cbPosicaoVeic.ItemIndex := 2
   else if trim(dataSet.FieldByName('POSICAO').AsString) = 'ESTACIONAMENTO' then
     frmEstMotosCCIA.cbPosicaoVeic.ItemIndex := 3;

   frmEstMotosCCIA.DBComboBox13.Clear;
   frmEstMotosCCIA.DBComboBox13.Items.Add('A - ATIVO IMOBILIZADO');
   frmEstMotosCCIA.DBComboBox13.Items.Add('C - CONSIGNAÇÃO');
   frmEstMotosCCIA.DBComboBox13.Items.Add('D - DEMONSTRAÇÃO');
   frmEstMotosCCIA.DBComboBox13.Items.Add('E - DEVOLUÇÃO DE MERCADORIA');
   frmEstMotosCCIA.DBComboBox13.Items.Add('O - OUTRAS OPERAÇÕES');
   frmEstMotosCCIA.DBComboBox13.Items.Add('R - RETORNO MERCADORIA EM DEMONSTRAÇÃO');
   frmEstMotosCCIA.DBComboBox13.Items.Add('T - TRANSFERÊNCIA DEPÓSITO');
   frmEstMotosCCIA.DBComboBox13.Items.Add('V - MERCADORIA ADQUIRIDA');
   frmEstMotosCCIA.DBComboBox13.Items.Add('');
   frmEstMotosCCIA.DBComboBox13.Text := trim(dataSet.FieldByName('TIPV_VEICULO').AsString);
   vDadosIni.vInibeMensPesqPros := 'S';
   frmEstMotosCCIA.DBComboBox13.Enabled := vDadosIni.PesqPros('VEI102', 'HABILITAR' + dataSet.FieldByName('CHASSI_C').AsString, '', 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas, true);
   frmEstMotosCCIA.DBEdit3.Enabled := False;
   frmEstMotosCCIA.DBEdit6.Enabled := False;
   frmEstMotosCCIA.DBEdit7.Enabled := False;
   if dataSet.FieldByName('COD_NF').AsInteger <= 0 then
   begin
     vDadosIni.vInibeMensPesqPros := 'S';
     if vDadosIni.PesqPros('VEI113', 'HABILITAR' + dataSet.FieldByName('CHASSI_C').AsString, '', 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas, true) then
     begin
       frmEstMotosCCIA.DBEdit3.Enabled := True;
       frmEstMotosCCIA.DBEdit6.Enabled := True;
       frmEstMotosCCIA.DBEdit7.Enabled := True;
     end;
   end;
   Result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      frmEstMotosCCIA.PnEstoque.Parent := frmEstMotosCCIA.tsEstoque;
      dataSet.Edit;
      if frmEstMotosCCIA.ComboBox6.ItemIndex = 0 then
        dataSet.FieldByName('STATUS_ESTOQUE').AsString := 'N'
      else
        dataSet.FieldByName('STATUS_ESTOQUE').AsString := 'S';

      if frmEstMotosCCIA.cbPosicaoVeic.ItemIndex = 0 then
        dataSet.FieldByName('POSICAO').AsString := 'VIVO'
      else if frmEstMotosCCIA.cbPosicaoVeic.ItemIndex = 1 then
        dataSet.FieldByName('POSICAO').AsString := 'MORTO'
      else if frmEstMotosCCIA.cbPosicaoVeic.ItemIndex = 2 then
        dataSet.FieldByName('POSICAO').AsString := 'TRANSITO'
      else if frmEstMotosCCIA.cbPosicaoVeic.ItemIndex = 3 then
        dataSet.FieldByName('POSICAO').AsString := 'ESTACIONAMENTO';
      dataSet.Post;

      if (dataSet.ChangeCount = 0) then
        Result := True
      else
        Result := Apply;

      if result then
        result := CommitaTransacao;

      if Result then
        vDadosIni.GravaAuditoria('VEI101', 'EDITAR', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
      else
        vDadosIni.GravaAuditoria('VEI101', 'EDITAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);
      formulario.Free;
      formulario := nil;
    end;
    dataSet.Close;
    dataSet.Open;;
  end;
end;

function TEstMotoCCIA.abreFormAvaria: boolean;
var
 vAvaria: string;
begin
  Result := True;
  try
   if frmAvariaCCIA = nil then
     Application.CreateForm(TfrmAvariaCCIA, frmAvariaCCIA);
   if trim(dataSet.FieldByName('STATUS_AVARIAS').AsString) ='S' then
     frmAvariaCCIA.ComboBox1.ItemIndex := 0
   else
     frmAvariaCCIA.ComboBox1.ItemIndex := 1;
   frmAvariaCCIA.Memo1.Text := trim(dataSet.FieldByName('OBS_ITEMEST').AsString);
   if frmAvariaCCIA.ShowModal = mrOk then
   begin
     if not vDadosIni.PesqPros('VEI145', 'ALTERAR',
      'MOD ' + IntToStr(dataSet.FieldByName('VERSAOEST').AsInteger) +
      '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
      '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
      '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
      '/VEND ' + IntToStr(dataSet.FieldByName('VENDEDOR_RES').AsInteger),
      'FILA_RESERVA_VEIC', dataSet.FieldByName('CODIGO').AsString, buscas, false) then
       Exit;

     if frmAvariaCCIA.ComboBox1.ItemIndex = 0 then
       vAvaria := 'S'
     else
       vAvaria := 'N';

     if dataSet.FieldByName('CODIGO').AsInteger > 0 then
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE EST_MOTO SET STATUS_AVARIAS = :STATUS_AVARIAS, OBS_ITEMEST = :OBS_ITEMEST ' +
         ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
       buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('STATUS_AVARIAS').AsString := vAvaria;
       buscas.ParamByName('OBS_ITEMEST').AsString := trim(frmAvariaCCIA.Memo1.Text);
       buscas.ExecSQL;
     end;

     if dataSet.FieldByName('COD_FILA_RES').AsInteger > 0 then
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE FILA_RESERVA_VEIC SET STATUS_AVARIAS = :STATUS_AVARIAS, OBS_ITEMEST = :OBS_ITEMEST  ' +
         ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
       buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('COD_FILA_RES').AsInteger;
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('STATUS_AVARIAS').AsString := vAvaria;
       buscas.ParamByName('OBS_ITEMEST').AsString := trim(frmAvariaCCIA.Memo1.Text);
       buscas.ExecSQL;
     end;
     Result := CommitaTransacao;
   end;
  finally
    if Result then
      vDadosIni.GravaAuditoria('VEI145', 'EDITAR', 'SUCESSO - ' +
      'MOD ' + IntToStr(dataSet.FieldByName('VERSAOEST').AsInteger) +
      '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
      '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
      '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
      '/VEND ' + IntToStr(dataSet.FieldByName('VENDEDOR_RES').AsInteger),
      'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI145', 'EDITAR', 'FALHA - ' +
      'MOD ' + IntToStr(dataSet.FieldByName('VERSAOEST').AsInteger) +
      '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
      '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
      '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
      '/VEND ' + IntToStr(dataSet.FieldByName('VENDEDOR_RES').AsInteger),
      'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);
  end;
end;

function TEstMotoCCIA.abreFormComfat(pTipoForm: Integer): boolean;
var
  vVeiculosCCIA: TVeiculosCCIA;
begin
  try
    vVeiculosCCIA := TVeiculosCCIA.create;
    vVeiculosCCIA._VendaVeiculos(0);
  finally
     vVeiculosCCIA.Free;
  end;
end;

function TEstMotoCCIA.abreFormDadosReais(pTipoForm: Integer): boolean;
begin
 try
   vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de Dados Reais da Venda');
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('VEI060', 'ALTERAR', '', 'COM_FAT', '',
      DtmVeiculosCCIA.qrBuscasV, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select co.nome_vendedor, cf.*, est.preco_custo from com_fat cf ' +
       ' inner join est_moto est on est.chassi_c = cf.chassiv and est.codigo = cf.cod_estmoto and est.cod_empresa = cf.cod_empresa ' +
       ' left join colaborador co on co.cod_vendedor = cf.covend_v and co.cod_empresa = cf.cod_empresa ' +
       ' where cf.n_comando = ' +IntToStr(dataSet.FieldByName('N_COMANDOV').AsInteger) +
       ' and cf.natureza = ''S'' and cf.cod_empresa =' + vDadosIni.codEmpresa;
    buscas.Open;
    if frmDadosReaisVeiculosCCIA = nil then
    begin
      vDadosIni.vTipoForm := pTipoForm;
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmDadosReaisVeiculosCCIA, frmDadosReaisVeiculosCCIA);
      if not buscas.IsEmpty then
        frmDadosReaisVeiculosCCIA.Label4.Caption :=buscas.FieldByName('NOME_VENDEDOR').AsString;
      frmDadosReaisVeiculosCCIA.Label5.Caption := Format('%0.2f', [dataSet.FieldByName('PRECO_CUSTO').AsFloat]);
      frmDadosReaisVeiculosCCIA.Label6.Caption := Format('%0.2f', [dataSet.FieldByName('PRECO_CUSTO_DESP').AsFloat]);
    end;

    if buscas.FieldByName('VALOR_REAL_COMPRA').AsFloat > 0 then
      frmDadosReaisVeiculosCCIA.EditHw1.AsValue := buscas.FieldByName('VALOR_REAL_COMPRA').AsFloat
    else
      frmDadosReaisVeiculosCCIA.EditHw1.AsValue := buscas.FieldByName('PRECO_CUSTO').AsFloat;

    if buscas.FieldByName('VALOR_REAL_VENDA').AsFloat > 0 then
      frmDadosReaisVeiculosCCIA.EditHw2.AsValue :=  buscas.FieldByName('VALOR_REAL_VENDA').AsFloat
    else
      frmDadosReaisVeiculosCCIA.EditHw2.AsValue :=  buscas.FieldByName('VALOR_REAL').AsFloat;

    if buscas.FieldByName('PARTE_VENDEDOR').AsFloat > 0 then
      frmDadosReaisVeiculosCCIA.EditHw3.AsValue := buscas.FieldByName('PARTE_VENDEDOR').AsFloat
    else
      frmDadosReaisVeiculosCCIA.EditHw3.AsValue := vDadosIni.vEmp.vPercComissaoVendedorVeic;

    if buscas.FieldByName('PARTE_GERENTE').AsFloat > 0 then
      frmDadosReaisVeiculosCCIA.EditHw4.AsValue := buscas.FieldByName('PARTE_GERENTE').AsFloat
    else
      frmDadosReaisVeiculosCCIA.EditHw4.AsValue := vDadosIni.vEmp.vPercComissaoGerenteVeic;

    frmDadosReaisVeiculosCCIA.EditHw5.AsValue := buscas.FieldByName('COMIS_BANCO').AsFloat;

    if buscas.FieldByName('RET_B_VENDEDOR').AsFloat > 0 then
      frmDadosReaisVeiculosCCIA.EditHw6.AsValue := buscas.FieldByName('RET_B_VENDEDOR').AsFloat
    else
      frmDadosReaisVeiculosCCIA.EditHw6.AsValue := vDadosIni.vEmp.vPercRetornoVendedorVeic;

    if buscas.FieldByName('RET_B_GERENTE').AsFloat > 0 then
      frmDadosReaisVeiculosCCIA.EditHw7.AsValue := buscas.FieldByName('RET_B_GERENTE').AsFloat
    else
      frmDadosReaisVeiculosCCIA.EditHw7.AsValue := vDadosIni.vEmp.vPercRetornoGerenteVeic;

    frmDadosReaisVeiculosCCIA.EditHw8.AsValue := buscas.FieldByName('COEF_UTILIZADO').AsFloat;
    frmDadosReaisVeiculosCCIA.EditHw10.AsValue := buscas.FieldByName('BONIFICACAO_FAB').AsFloat;
    frmDadosReaisVeiculosCCIA.Memo1.Text := buscas.FieldByName('LOCAL_FOMENTO').AsString;


    if buscas.FieldByName('DESP_FINANC').AsFloat > 0 then
      frmDadosReaisVeiculosCCIA.EditHw9.AsValue := buscas.FieldByName('DESP_FINANC').AsFloat
    else if dataSet.FieldByName('PRECO_CUSTO_DESP').AsFloat > 0then
    begin
      frmDadosReaisVeiculosCCIA.EditHw9.AsValue :=
         dataSet.FieldByName('PRECO_CUSTO_DESP').AsFloat - dataSet.FieldByName('PRECO_CUSTO').AsFloat;
    end
    else
      frmDadosReaisVeiculosCCIA.EditHw9.AsValue := 0;

    Result := (frmDadosReaisVeiculosCCIA.ShowModal = mrOk);
  finally
    if Result then
    begin
      if not buscas.Transaction.InTransaction then
        buscas.Transaction.StartTransaction;
      buscas.Close;
      buscas.SQL.Text := ' UPDATE COM_FAT SET' +
       ' VALOR_REAL_COMPRA = :VALOR_REAL_COMPRA, VALOR_REAL_VENDA = :VALOR_REAL_VENDA, PARTE_VENDEDOR = :PARTE_VENDEDOR, ' +
       ' PARTE_GERENTE = :PARTE_GERENTE, COMIS_BANCO = :COMIS_BANCO, RET_B_VENDEDOR = :RET_B_VENDEDOR, RET_B_GERENTE = :RET_B_GERENTE, ' +
       ' COEF_UTILIZADO = :COEF_UTILIZADO, DESP_FINANC = :DESP_FINANC, BONIFICACAO_FAB = :BONIFICACAO_FAB, LOCAL_FOMENTO = :LOCAL_FOMENTO' +
       ' WHERE N_COMANDO = :N_COMANDO AND COD_EMPRESA = :COD_EMPRESA;';
      buscas.ParamByName('N_COMANDO').AsInteger := dataSet.FieldByName('N_COMANDOV').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ParamByName('VALOR_REAL_COMPRA').AsFloat := frmDadosReaisVeiculosCCIA.EditHw1.AsValue;
      buscas.ParamByName('VALOR_REAL_VENDA').AsFloat := frmDadosReaisVeiculosCCIA.EditHw2.AsValue;
      buscas.ParamByName('PARTE_VENDEDOR').AsFloat := frmDadosReaisVeiculosCCIA.EditHw3.AsValue;
      buscas.ParamByName('PARTE_GERENTE').AsFloat := frmDadosReaisVeiculosCCIA.EditHw4.AsValue;
      buscas.ParamByName('COMIS_BANCO').AsFloat := frmDadosReaisVeiculosCCIA.EditHw5.AsValue;
      buscas.ParamByName('RET_B_VENDEDOR').AsFloat := frmDadosReaisVeiculosCCIA.EditHw6.AsValue;
      buscas.ParamByName('RET_B_GERENTE').AsFloat := frmDadosReaisVeiculosCCIA.EditHw7.AsValue;
      buscas.ParamByName('COEF_UTILIZADO').AsFloat := frmDadosReaisVeiculosCCIA.EditHw8.AsValue;
      buscas.ParamByName('DESP_FINANC').AsFloat := frmDadosReaisVeiculosCCIA.EditHw9.AsValue;
      buscas.ParamByName('BONIFICACAO_FAB').AsFloat := frmDadosReaisVeiculosCCIA.EditHw10.AsValue;
      buscas.ParamByName('LOCAL_FOMENTO').AsString := frmDadosReaisVeiculosCCIA.Memo1.Text;
	   buscas.ExecSQL;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    end;
    if (frmDadosReaisVeiculosCCIA <> nil) then
      frmDadosReaisVeiculosCCIA := nil;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TEstMotoCCIA.abreFormEntradaCCIA(pTipoForm: Integer; pTipveiculo: string = ''; vComFat: boolean = false): boolean;
var
   vVeiculosCCIA : TVeiculosCCIA;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Entrada de Veículos');

    if not _mdiAberto('TfrmEntradaCCIA', 'O Formulário de Entrada de Veículos se encontra aberto!') then
    begin
      False;
      vDadosIni.vPesquisa := '';
      vDadosIni.fechaStatusProcessamento;
      exit;
    end;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    vDadosIni.vTipoForm := pTipoForm;

    if frmEntradaCCIA = nil then
    begin
      vDadosIni.vTipoForm := pTipoForm;
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmEntradaCCIA, frmEntradaCCIA);
    end;

    frmEntradaCCIA.PageControl1.ActivePage := frmEntradaCCIA.tsEntrada;
    frmEntradaCCIA.Height := 283;
    frmEntradaCCIA.Width := 340;
    frmEntradaCCIA.tsEntrada.Show;

    PreencherDatasetvDadosIni(dataSet, vComFat, pTipveiculo);

    if vComFat then
    begin
       vDadosIni.vPesquisa := 'COM_FAT|E|';
       if frmEntradaCCIA.ShowModal = mrOk then
        abreFormTipoVendaCCIA(1);
    end
    else
    begin
      vDadosIni.vPesquisa := 'COM_FAT|E|' + dataSet.FieldByName('STATUS_USO').AsString + '|';
      if frmEntradaCCIA.ShowModal = mrOk then
        vVeiculosCCIA._VendaVeiculos(0, true);
    end;

  finally
    vDadosIni.vPesquisa := '';
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TEstMotoCCIA.abreFormObservacao: boolean;
 var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 776;
    formulario.Height := 453;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Observação';
    frmEstMotosCCIA.pnObservacao.Parent := formulario;
    frmEstMotosCCIA.pnConfirmObs.Visible := true;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];
    if not (dataSet.State in [dsInsert, dsEdit]) then
      dataSet.Edit;
    dataSet.FieldByName('OBS_ITEMEST').AsString := trim(dataSet.FieldByName('OBS_ITEMEST').AsString);
    dataSet.FieldByName('ADICIONAIS').AsString := trim(dataSet.FieldByName('ADICIONAIS').AsString);
    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      try
        Result := inherited post;

        if (dataSet.ChangeCount = 0) then
          Result := True
        else
          Result := Apply;
        if result then
          result := CommitaTransacao;

        if Result then
          vDadosIni.GravaAuditoria('VEI123', 'EDITAR', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
        else
          vDadosIni.GravaAuditoria('VEI123', 'EDITAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);

      except
        on e: exception do
        begin
          Result := false;
          vDadosIni.GravaAuditoria('VEI123', 'EDITAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);
          Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
          registraErro(e.Message);
        end;
      end;
    end
    else
    begin
     dataSet.Cancel;
     RollBackTransacao;
    end;  
    frmEstMotosCCIA.pnObservacao.Parent := frmEstMotosCCIA.TabSheet_MaisInformacoes;
    frmEstMotosCCIA.pnConfirmObs.Visible := false;
    formulario.Free;
    formulario := nil;
  end;
end;

function TEstMotoCCIA.abreFormSaidaCCIA(pTipoForm: Integer; pTipveiculo: string = ''; vComFat: boolean = false; vEdit: boolean = false): boolean;
var
   vVeiculosCCIA : TVeiculosCCIA;
begin
  Result := False;

  vDadosIni.abreStatusProcessamento('', 'Abrindo Saída de Veículos');

  if not _mdiAberto('TfrmSaidaCCIA', 'O Formulário de Saídas de Veículos se encontra aberto!') then
  begin
    Result := False;
    vDadosIni.vPesquisa := '';
    vDadosIni.fechaStatusProcessamento;
    exit;
  end;

  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

  vDadosIni.vTipoForm := pTipoForm;

  if frmSaidaCCIA = nil then
  begin
    vDadosIni.vTipoForm := pTipoForm;
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmSaidaCCIA, frmSaidaCCIA);
  end;

  PreencherDatasetvDadosIni(dataSet, vComfat, pTipveiculo, vEdit);

  try
   if vComfat then
   begin
     vDadosIni.vPesquisa := 'COM_FAT|S|';
     if frmSaidaCCIA.ShowModal = mrOk then
     begin
       Result := true;
       if not vEdit then
         abreFormTipoVendaCCIA(1);
     end;
   end
   else
   begin
     vDadosIni.vPesquisa := 'COM_FAT|S|' + dataSet.FieldByName('STATUS_USO').AsString + '|';
     if frmSaidaCCIA.ShowModal = mrOk then
     begin
      Result := true;
      vVeiculosCCIA._VendaVeiculos(0, true);
     end;
   end;

  finally
    vDadosIni.vPesquisa := '';
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TEstMotoCCIA.abreFormStatusVeiculo(pEdit: boolean = false): boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Status do Veículo no Sistema';
    frmEstMotosCCIA.pnStatusVeiculo.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];
    frmEstMotosCCIA.RadioGroup1.ItemIndex := 0;
    frmEstMotosCCIA.checkConc.Checked := False;
    frmEstMotosCCIA.checkEstoqueReal.Checked := False;
    frmEstMotosCCIA.checkConc.Visible := vDadosIni.vEmp.vTipoEmpVeiculos = 'A';
    frmEstMotosCCIA.checkEstoqueReal.Visible := vDadosIni.vEmp.vTipoEmpVeiculos = 'A';
    frmEstMotosCCIA.RadioGroup1.Enabled := pEdit;
    frmEstMotosCCIA.BitBtn27.Enabled := pEdit;
    if pEdit then
    begin
       if EstMoto.dataSet.FieldByName('TIPV_VEICULO').AsString = 'C' then
         frmEstMotosCCIA.RadioGroup1.ItemIndex := 1
       else if EstMoto.dataSet.FieldByName('TIPV_VEICULO').AsString = 'I' then
         frmEstMotosCCIA.RadioGroup1.ItemIndex := 2
       else
         frmEstMotosCCIA.RadioGroup1.ItemIndex := 0;

       frmEstMotosCCIA.checkConc.Checked := dataSet.FieldByName('ESTOQUE').AsString = 'C';
       frmEstMotosCCIA.checkEstoqueReal.Checked := dataSet.FieldByName('ESTOQUE').AsString = 'P';

       frmEstMotosCCIA.checkConc.Enabled := not frmEstMotosCCIA.checkEstoqueReal.Checked;
       frmEstMotosCCIA.checkEstoqueReal.Enabled := not frmEstMotosCCIA.checkConc.Checked;
    end;
    result := (formulario.ShowModal = mrOk);
  finally
    frmEstMotosCCIA.pnStatusVeiculo.Parent := frmEstMotosCCIA.tsStatusVeiculo;
    formulario.Free;
    formulario := nil;
  end;
end;

function TEstMotoCCIA.abreFormTipoVendaCCIA(pTipoForm: Integer): boolean;
var
   vVeiculosCCIA : TVeiculosCCIA;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Tipo de Venda (Novo / Usado)');

    if not _mdiAberto('TfrmTipoVendaCCIA', 'O Formulário Tipo de Venda Veículos se encontra aberto!') then
    begin
     False;
     vDadosIni.vPesquisa := '';
     vDadosIni.fechaStatusProcessamento;
     exit;
    end;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    vDadosIni.vTipoForm := pTipoForm;

    if frmTipoVendaCCIA = nil then
    begin
      vDadosIni.vTipoForm := pTipoForm;
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmTipoVendaCCIA, frmTipoVendaCCIA);
    end;
    try
       vDadosIni.vPesquisa := 'COM_FAT|E|' + vDadosIni.vDtSetTmp.FieldByName('TIPO_VENDA_V').AsString + '|';
    finally
      vDadosIni.vPesquisa := '';
    end;
    frmTipoVendaCCIA.Caption := 'Tipo de Venda(Novo / Usado)';
    if frmTipoVendaCCIA.ShowModal = mrOk then
      if frmMovVeiculosCCIA <> nil then
        frmMovVeiculosCCIA.NovoComando(vDadosIni.vDtSetTmp.FieldByName('TIPO_VENDA_V').AsString);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TEstMotoCCIA.abreFormTipoVendaEstMotoCCIA(pTipoForm: Integer): boolean;
begin
  try
    Result := False;

    vDadosIni.abreStatusProcessamento('', 'Abrindo Situação do Veículo (Novo / Usado)');

    if not _mdiAberto('TfrmTipoVendaCCIA', 'O Formulário Tipo de Venda Veículos se encontra aberto!') then
    begin
     False;
     vDadosIni.vPesquisa := '';
     vDadosIni.fechaStatusProcessamento;
     exit;
    end;

     vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
     vDadosIni.vDtSetTmp.Close;
     vDadosIni.vDtSetTmp.FieldDefs.Clear;
     vDadosIni.vDtSetTmp.FieldDefs.Add('TIPO_VENDA_V', ftString, 1, false);

     if vDadosIni.vDtSetTmp.Tag = 0 then
     try
       vDadosIni.vDtSetTmp.CreateDataSet;
       vDadosIni.vDtSetTmp.Tag := 1;
     except
     end;
     vDadosIni.vDtSetTmp.EmptyDataSet;
     vDadosIni.vDtSetTmp.Insert;
     vDadosIni.vDtSetTmp.FieldByName('TIPO_VENDA_V').AsString := '';
     vDadosIni.vDtSetTmp.Post;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    vDadosIni.vTipoForm := pTipoForm;

    if frmTipoVendaCCIA = nil then
    begin
      vDadosIni.vTipoForm := pTipoForm;
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmTipoVendaCCIA, frmTipoVendaCCIA);
    end;
    frmTipoVendaCCIA.Caption := 'Situação do Veículo (Novo / Usado)';
    if frmTipoVendaCCIA.ShowModal = mrOk then
      Result := true;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TEstMotoCCIA.AbrirCores: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'CORES| ' + dataSet.FieldByName('COD_COR').AsString;

  formulario := Funcoes.AbreForm('pkClientes', 'TfrmCadCores', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TEstMotoCCIA.AbrirModeloVeic: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'MODVEICULO| ' + dataSet.FieldByName('VERSAOEST').AsString;

  formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TFrmCadModVeiculosCCIA', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TEstMotoCCIA.AlterarReducao(pRedLucro: string;
  pPercRed: double): boolean;
var
 vCodigo, vChassi: string;
begin
 vCodigo := trim(dataSet.FieldByName('CODIGO').AsString);
 vChassi := trim(dataSet.FieldByName('CHASSI_C').AsString);

 buscas.Close;
 buscas.SQL.Text := ' UPDATE EST_MOTO SET RED_LUCRO = :RED_LUCRO, PERC_RED = :PERC_RED ' +
  ' WHERE CHASSI_C = :CHASSI_C AND CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
 buscas.ParamByName('CHASSI_C').AsString := trim(dataSet.FieldByName('CHASSI_C').AsString);
 buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
 buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
 buscas.ParamByName('RED_LUCRO').AsString := trim(pRedLucro);
 buscas.ParamByName('PERC_RED').AsFloat := pPercRed;
 try
    buscas.ExecSQL;
    vDadosIni.GravaAuditoria('VEI125', 'ALTERAR', 'SUCESSO - CHASSI ' + vChassi, 'EST_MOTO', vCodigo, buscas);
    CommitaTransacao;
    Application.MessageBox('Redução alterada com sucesso.', 'Atenção', 0 + 64);
  except
    RollBackTransacao;
    vDadosIni.GravaAuditoria('VEI125', 'ALTERAR', 'FALHA - CHASSI ' + vChassi, 'EST_MOTO', vCodigo, buscas);
    Application.MessageBox('Não foi possível alterar redução.', 'Atenção', 0 + 64);
  end;

end;

function TEstMotoCCIA.AlterarStatus(pTp: Integer = 0): boolean;
begin
 Result := True;

 if pTp = 1 then
 begin
   if not abreFormStatusVeiculo(frmEstMotosCCIA.BitBtn4.Enabled) then
    exit;
   if not (dataSet.State in [dsInsert, dsEdit]) then
      dataSet.Edit;
   frmEstMotosCCIA._DesabilitaCampos;
 end;

 if frmEstMotosCCIA.RadioGroup1.ItemIndex = 0 then
   dataSet.FieldByName('TIPV_VEICULO').AsString := 'V'
 else if frmEstMotosCCIA.RadioGroup1.ItemIndex = 1 then
   dataSet.FieldByName('TIPV_VEICULO').AsString := 'C'
 else if frmEstMotosCCIA.RadioGroup1.ItemIndex = 2 then
 begin
   dataSet.FieldByName('TIPV_VEICULO').AsString := 'I';
 end;
 if (vDadosIni.vEmp.vTipoEmpVeiculos = 'A') then
 begin
   if frmEstMotosCCIA.checkConc.Checked then
     dataSet.FieldByName('ESTOQUE').AsString := 'C'
   else if frmEstMotosCCIA.checkEstoqueReal.Checked then
     dataSet.FieldByName('ESTOQUE').AsString := 'P'
   else
     dataSet.FieldByName('ESTOQUE').Value := Null;
 end
 else
 begin
   if dataSet.FieldByName('STATUS_USO').AsString = 'N' then
     dataSet.FieldByName('ESTOQUE').AsString := 'P';
 end;
 if pTp = 1 then
 begin
   dataSet.Post;
   if (DataSet.ChangeCount = 0) then
     Result := True
   else
     Result := Apply;

   if result then
     result := CommitaTransacao;

   if Result then
     vDadosIni.GravaAuditoria('VEI061', 'EDITAR', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
   else
     vDadosIni.GravaAuditoria('VEI061', 'EDITAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);
   if Result then
     Refresh
 end;
end;

function TEstMotoCCIA.AtualizarDadosVeiculo(var pMensagem: string): boolean;
begin
  Result := True;

//  vDadosIni.vInibeMensPesqPros := 'S';
//  if not vDadosIni.PesqPros('VEI126', 'HABILITAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
//    exit;

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('VEI127', 'ATUALIZAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
    exit;

  vDadosIni.abreStatusProcessamento('', 'Atualizando informações do veículo');
    
  buscas.Close;
  buscas.SQL.Text := ' SELECT FIRST 1 NUM_NF, VND.NOME_VENDEDOR FROM NOTAFISCAL NF ' +
   ' INNER JOIN NOTAFISCAL_ITEM NFI ON NFI.COD_NF = NF.COD_NF AND NFI.COD_EMPRESA = NF.COD_EMPRESA ' +
   ' LEFT JOIN COLABORADOR VND ON VND.COD_VENDEDOR = NF.COD_VENDEDOR and VND.COD_EMPRESA = NF.COD_EMPRESA ' +
   ' WHERE NFI.TIPO_ITEM = ''V'' AND NF.EMISSAO_PROPRIA = ''S'' ' +
   ' AND NF.STATUS = ''Fechada'' AND NFI.COD_ESTMOTO = :COD_ESTMOTO ' +
   ' AND NFI.COD_EMPRESA = :COD_EMPRESA ' +
   ' ORDER BY NF.COD_NF DESC ';
  buscas.ParamByName('COD_ESTMOTO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
  buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  buscas.Open;

  if not buscas.IsEmpty then
  begin
   vDadosIni.fechaStatusProcessamento;
   pMensagem := 'Veículo com Nota Fiscal Fechada. Não é permitido confirmar operação.' + #13 +
    'Num NF: ' +  vDadosIni.strzero(buscas.FieldByName('NUM_NF').asinteger, 6) + #13 +
    'Colaborador: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString);
   Result := False;
   exit;
  end;

  try
   try
      buscas.Close;
      buscas.SQL.Text := ' UPDATE HIST_ESTMOTO SET CHASSI_C = :CHASSI_C, PLACAEST = :PLACAEST ' +
       ' WHERE (CODIGO = :CODIGO) AND COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
      buscas.ParamByName('CHASSI_C').AsString := dataSet.FieldByName('CHASSI_C').AsString;
      buscas.ParamByName('PLACAEST').AsString := dataSet.FieldByName('PLACAEST').AsString;
      buscas.Prepare;
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' UPDATE DESPESAS_VEIC SET CHASSI_C = :CHASSI_C, PLACAEST = :PLACAEST ' +
       ' WHERE (CODIGO = :CODIGO) AND COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
      buscas.ParamByName('CHASSI_C').AsString := dataSet.FieldByName('CHASSI_C').AsString;
      buscas.ParamByName('PLACAEST').AsString := dataSet.FieldByName('PLACAEST').AsString;
      buscas.Prepare;
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' UPDATE COM_FAT SET CHASSIV = :CHASSIV, PLACAV = :PLACAV ' +
       ' WHERE (COD_ESTMOTO = :COD_ESTMOTO) AND COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('COD_ESTMOTO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
      buscas.ParamByName('CHASSIV').AsString := dataSet.FieldByName('CHASSI_C').AsString;
      buscas.ParamByName('PLACAV').AsString := dataSet.FieldByName('PLACAEST').AsString;
      buscas.Prepare;
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' UPDATE PENDENCIAS_VEIC SET CHASSI_C = :CHASSI_C, PLACAEST = :PLACAEST ' +
       ' WHERE (CODIGO = :CODIGO) AND COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
      buscas.ParamByName('CHASSI_C').AsString := dataSet.FieldByName('CHASSI_C').AsString;
      buscas.ParamByName('PLACAEST').AsString := dataSet.FieldByName('PLACAEST').AsString;
      buscas.Prepare;
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' UPDATE NOTAFISCAL_ITEM SET CHASSI = :CHASSI, NUM_FAB_PROD = :NUM_FAB_PROD, ' +
       ' DESCRICAO_ITEM = :DESCRICAO_ITEM ' +
       ' WHERE (COD_ESTMOTO = :COD_ESTMOTO) AND COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('COD_ESTMOTO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
      buscas.ParamByName('CHASSI').AsString := dataSet.FieldByName('CHASSI_C').AsString;
      buscas.ParamByName('NUM_FAB_PROD').AsString := dataSet.FieldByName('CHASSI_C').AsString;
      buscas.ParamByName('DESCRICAO_ITEM').AsString := dataSet.FieldByName('DESCRICAO_VERSAOEST').AsString;
      buscas.Prepare;
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' UPDATE NOTAFISCAL_ITEM_VEICULO SET CHASSI = :CHASSI, PLACA = :PLACA, ' +
       ' MOTOR = :MOTOR, MARCA = :MARCA, VERSAO = :VERSAO, DESCRICAO_VERSAO = :DESCRICAO_VERSAO, ' +
       ' ANO_FAB = :ANO_FAB, ANO_MOD = :ANO_MOD, COR = :COR, CILINDROS = :CILINDROS, COMBUSTIVEL = :COMBUSTIVEL, ' +
       ' CILINDRADA = :CILINDRADA, HP = :HP, LOTACAO = :LOTACAO, TIPO = :TIPO, RENAVAM = :RENAVAM, ' +
       ' NSERIE = :NSERIE, TIP_PINTURA = :TIP_PINTURA, COD_COR = :COD_COR, COD_MARCA = :COD_MARCA, ' +
       ' COD_COMBUSTIVEL = :COD_COMBUSTIVEL,  COD_TIPO_ESP = :COD_TIPO_ESP, ' +
       ' CATEGORIA = :CATEGORIA ' +
       ' WHERE (COD_EMPRESA = :COD_EMPRESA) AND (COD_ESTMOTO = :COD_ESTMOTO); ';
      buscas.ParamByName('COD_ESTMOTO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
      buscas.ParamByName('CHASSI').AsString := dataSet.FieldByName('CHASSI_C').AsString;
      buscas.ParamByName('PLACA').AsString := dataSet.FieldByName('PLACAEST').AsString;
      buscas.ParamByName('MOTOR').AsString := dataSet.FieldByName('MOTOREST').AsString;
      buscas.ParamByName('MARCA').AsString := dataSet.FieldByName('MARCAEST').AsString;
      buscas.ParamByName('VERSAO').AsInteger := dataSet.FieldByName('VERSAOEST').AsInteger;
      buscas.ParamByName('DESCRICAO_VERSAO').AsString := dataSet.FieldByName('DESCRICAO_VERSAOEST').AsString;
      buscas.ParamByName('ANO_FAB').AsInteger := dataSet.FieldByName('ANO_FABEST').AsInteger;
      buscas.ParamByName('ANO_MOD').AsInteger := dataSet.FieldByName('ANO_MODEST').AsInteger;
      buscas.ParamByName('COR').AsString := dataSet.FieldByName('COREST').AsString;
      buscas.ParamByName('CILINDROS').AsInteger := dataSet.FieldByName('CILINDROSEST').AsInteger;
      buscas.ParamByName('CILINDRADA').AsFloat := dataSet.FieldByName('CILINDRADAEST').AsFloat;
      buscas.ParamByName('HP').AsFloat := dataSet.FieldByName('HPEST').AsFloat;
      buscas.ParamByName('LOTACAO').AsString := dataSet.FieldByName('LOTACAOEST').AsString;
      buscas.ParamByName('TIPO').AsString := dataSet.FieldByName('TIPOEST').AsString;
      buscas.ParamByName('RENAVAM').AsString := dataSet.FieldByName('RENAVAMEST').AsString;
      buscas.ParamByName('NSERIE').AsString := dataSet.FieldByName('NSERIE').AsString;
      buscas.ParamByName('TIP_PINTURA').AsString := dataSet.FieldByName('TIP_PINTURA').AsString;
      buscas.ParamByName('COD_COR').AsInteger := dataSet.FieldByName('COD_COR').AsInteger;
      buscas.ParamByName('COD_MARCA').AsInteger := dataSet.FieldByName('COD_MARCA').AsInteger;
      buscas.ParamByName('COD_COMBUSTIVEL').AsInteger := dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger;
      buscas.ParamByName('COD_TIPO_ESP').AsInteger := dataSet.FieldByName('COD_ESPE_SEG').AsInteger;
      buscas.ParamByName('CATEGORIA').AsString := dataSet.FieldByName('CATEGORIAEST').AsString;
      buscas.Prepare;
      buscas.ExecSQL;

      vDadosIni.GravaAuditoria('VEI127', 'ATUALIZAR', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
   except
      on e: exception do
      begin
        Result := false;
        vDadosIni.GravaAuditoria('VEI127', 'ATUALIZAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);
        Application.MessageBox(pchar('Erro ao realizar dados do veículos: TEstMotoCCIA.AtualizarDadosVeiculo '+ e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TEstMotoCCIA.BuscarEstMoto(pComfat: TComFat; valor: string; placaChassiCodigo: integer; pPlaca: string = ''; pChassi: string = ''): boolean;
var
 pWhere: string;
 vcfop: string;
 vatualizarcfop: boolean;
 vstatusestoque: string;
begin
  Result := false;

  if trim(valor) <> '' then
  begin
    if placaChassiCodigo = 0 then
      pWhere := ' AND TRIM(EST_MOTO.CHASSI_C) = ' + QuotedStr(trim(pChassi)) +
        ' AND TRIM(EST_MOTO.PLACAEST) = ' + QuotedStr(trim(pPlaca)) +
        ' AND EST_MOTO.CODIGO = ' + (valor)
    else if placaChassiCodigo = 1 then
    begin
    	if (trim(vDadosIni.retornaPlacaNovaAntiga(valor)) <> trim(valor)) then
      	pWhere := ' AND ((TRIM(EST_MOTO.PLACAEST) = ' + QuotedStr(UpperCase(trim(valor))) + ')' +
        	' or (TRIM(EST_MOTO.PLACAEST) = ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(valor)))) + ')) '
      else
	      pWhere := ' AND TRIM(EST_MOTO.PLACAEST) = ' + QuotedStr(UpperCase(trim(valor)));
    end
    else if placaChassiCodigo = 2 then
      pWhere := ' AND TRIM(EST_MOTO.CHASSI_C) = ' + QuotedStr(UpperCase(trim(valor)))
    else if placaChassiCodigo = 3 then
      pWhere := ' AND EST_MOTO.CODIGO = ' + (valor);
  end
  else
  begin
    if (pComfat.dataSet.State in [dsInsert, dsEdit]) then
    begin
      pComfat.dataSet.Fieldbyname('CHASSIV').Value := Null;
      pComfat.dataSet.Fieldbyname('COD_ESTMOTO').Value := Null;
      pComfat.dataSet.Fieldbyname('PLACAV').Value := Null;
      pComfat.dataSet.Fieldbyname('CLIENTES_V').Value := Null;
      pComfat.dataSet.FieldByName('TIPO_V').Value := Null;
    end;
    Result := true;
    exit;
  end;
   montaSelect(' SELECT FIRST 1 EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO  ' +
    ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
    ' WHERE (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') AND EST_MOTO.COD_EMPRESA =' + vDadosIni.codEmpresa + pWhere +
    ' ORDER BY EST_MOTO.CODIGO DESC');

  Result := not dataSet.IsEmpty;


  if Result then
  begin
   pComfat.dataSet.Fieldbyname('CHASSIV').AsString := dataSet.Fieldbyname('CHASSI_C').AsString;
   pComfat.dataSet.Fieldbyname('COD_ESTMOTO').AsInteger := dataSet.Fieldbyname('CODIGO').AsInteger;
   pComfat.dataSet.Fieldbyname('PLACAV').AsString := dataSet.Fieldbyname('PLACAEST').AsString;
   pComfat.dataSet.FieldByName('CODFISC_V').AsString := trim(dataSet.Fieldbyname('TIPOEST').AsString);
   if trim(pComFat.dataSet.Fieldbyname('TIPV_VEICULO').AsString) = 'I' then
   begin
     if pComFat.dataSet.FieldByName('TIPO_VENDA_V').AsString = 'N' then
     begin
       if (pComfat.dataSet.Fieldbyname('COD_CONCESS').IsNull) then
       begin
         pComFat.dataSet.Fieldbyname('COD_CONCESS').AsInteger := dataSet.Fieldbyname('COD_FORNECEDOR').AsInteger;
         pComfat.vConcessionariaComFat.abreClientes(pComfat.dataSet.FieldByName('COD_CONCESS').AsInteger)
       end;
     end
     else
     begin
       if (pComfat.dataSet.Fieldbyname('COD_CLI_VENDE').IsNull) then
       begin
         pComFat.dataSet.Fieldbyname('COD_CLI_VENDE').AsInteger := dataSet.Fieldbyname('COD_FORNECEDOR').AsInteger;
         pComfat.vClienteVendComFat.abreClientes(pComfat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger)
       end;
     end;
   end;
   if trim(pComFat.dataSet.FieldByName('NATUREZA').AsString) = 'S' then
   begin
      if (trim(dataSet.Fieldbyname('STATUS_RES').AsString) = 'S') and (pComfat.dataSet.Fieldbyname('CLIENTES_V').IsNull) then
      begin
        pComfat.dataSet.Fieldbyname('CLIENTES_V').AsInteger := dataSet.Fieldbyname('COD_CLIENTE').AsInteger;
        pComfat.vClienteComFat.abreClientes(pComfat.dataSet.FieldByName('CLIENTES_V').AsInteger);
   //     pComfat.dataSet.FieldByName('TIPO_V').AsString := trim(dataSet.Fieldbyname('TIPO_RES').AsString);
      end;
      vatualizarcfop := false;
      vstatusestoque := '';
      vcfop := FloatToStr(pComFat.dataSet.FieldByName('NATOP_V').AsFloat);

      if (pComfat.dataSet.Fieldbyname('CLIENTES_V').AsInteger > 0)
      	and (vDadosIni.vEmp.vCodigo_Uf = pComfat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) and (vcfop[1] <> '5') then
        vatualizarcfop := true
      else if (pComfat.dataSet.Fieldbyname('CLIENTES_V').AsInteger > 0)
      	and (vDadosIni.vEmp.vCodigo_Uf <> pComfat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) and (vcfop[1] <> '6') then
        vatualizarcfop := true
      else if (pComfat.dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0)
      	and (trim(dataSet.FieldByName('STATUS_ESTOQUE').AsString) <> trim(pComfat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString)) then
      begin
        vatualizarcfop := true;
        vstatusestoque := trim(dataSet.FieldByName('STATUS_ESTOQUE').AsString);
      end
      else if (pComFat.dataSet.FieldByName('NATOP_V').AsFloat > 0)
      	and	(vDadosIni.IfThen(trim(pComfat.vNaturezaOp.dataSet.FieldByName('ALT_EST').AsString) = 'N', 'N', 'S') <> trim(pComfat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString)) then
      begin
      	vatualizarcfop := true;
        vstatusestoque := trim(pComfat.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').AsString);
      end;

      if vatualizarcfop then
      begin
        pComfat.vNaturezaOp.abreNaturezaOp(pComfat.vSing.vTipoVendaCFOP, pComfat.vSing.vNatureza, pComfat.vSing.vTipoVenda,
          vDadosIni.IfThen(pComfat.vSing.vNatureza = 'E',
            vDadosIni.IfThen(pComFat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger <= 0, -1, pComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger),
            vDadosIni.IfThen(pComFat.dataSet.FieldByName('CLIENTES_V').AsInteger <= 0, -1, pComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)), '',
          vstatusestoque);
        pComFat.dataSet.FieldByName('NATOP_V').AsFloat := pComFat.vNaturezaOp.dataSet.FieldByName('CODIGO_NOP').AsFloat;
        pComFat.dataSet.FieldByName('DESC_NATOP').AsString := Copy(trim(pComFat.vNaturezaOp.dataSet.FieldByName('DESCRICAO_NOP').AsString), 1, 40);
        pComFat.dataSet.FieldByName('TIPV_VEICULO').AsString := pComFat.vNaturezaOp.dataSet.FieldByName('TIPV_VEICULO').AsString;
        pComFat.vCFOPOld := pComFat.dataSet.FieldByName('NATOP_V').AsFloat;
      end;
   end
   else
   begin
     pComfat.dataSet.Fieldbyname('COD_CLI_VENDE').AsInteger := dataSet.Fieldbyname('COD_FORNECEDOR').AsInteger;
     pComfat.vClienteVendComFat.abreClientes(pComfat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger);

     vatualizarcfop := false;
     vcfop := FloatToStr(pComFat.dataSet.FieldByName('NATOP_V').AsFloat);

     if (pComfat.dataSet.Fieldbyname('COD_CLI_VENDE').AsInteger > 0)
     	and (vDadosIni.vEmp.vCodigo_Uf = pComfat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) and (vcfop[1] <> '1') then
       vatualizarcfop := true
     else if (pComfat.dataSet.Fieldbyname('COD_CLI_VENDE').AsInteger > 0)
     	and (vDadosIni.vEmp.vCodigo_Uf <> pComfat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger) and (vcfop[1] <> '2') then
     	 vatualizarcfop := true;

     if vatualizarcfop then
     begin
       pComfat.vNaturezaOp.abreNaturezaOp(pComfat.vSing.vTipoVendaCFOP, pComfat.vSing.vNatureza, pComfat.vSing.vTipoVenda,
          vDadosIni.IfThen(pComfat.vSing.vNatureza = 'E',
            vDadosIni.IfThen(pComFat.dataSet.FieldByName('COD_CLI_VENDE').AsInteger <= 0, -1, pComFat.vClienteVendComFat.dataSet.FieldByName('CODIGO_UF').AsInteger),
            vDadosIni.IfThen(pComFat.dataSet.FieldByName('CLIENTES_V').AsInteger <= 0, -1, pComFat.vClienteComFat.dataSet.FieldByName('CODIGO_UF').AsInteger)));
       pComFat.dataSet.FieldByName('NATOP_V').AsFloat := pComFat.vNaturezaOp.dataSet.FieldByName('CODIGO_NOP').AsFloat;
       pComFat.dataSet.FieldByName('DESC_NATOP').AsString := Copy(trim(pComFat.vNaturezaOp.dataSet.FieldByName('DESCRICAO_NOP').AsString), 1, 40);
       pComFat.dataSet.FieldByName('TIPV_VEICULO').AsString := pComFat.vNaturezaOp.dataSet.FieldByName('TIPV_VEICULO').AsString;
       pComFat.vCFOPOld := pComFat.dataSet.FieldByName('NATOP_V').AsFloat;
     end;
   end;
  end
  else
  begin
   pComFat.dataSet.Fieldbyname('COD_ESTMOTO').Value := Null;
   Application.MessageBox('Veículo não encontrado', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
  end;

end;

procedure TEstMotoCCIA.CadVeiculosMov(TipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Estoque e Movimento de Veículos');
    vDadosIni.vTipoForm := TipoForm;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    begin
      Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;  

    if not vDadosIni.PesqPros('VEI063', 'CONSULTA', '', 'EST_MOTO', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmEstMotosCCIA = nil then
    begin
      vDadosIni.vTipoForm := TipoForm;
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmEstMotosCCIA, frmEstMotosCCIA);
    end;

    if (TipoForm > 0) and (not frmEstMotosCCIA.Visible) then
      frmEstMotosCCIA.ShowModal
    else if (not frmEstMotosCCIA.Visible) then
      frmEstMotosCCIA.Show
    else if frmEstMotosCCIA.FormStyle = fsMDIChild then
      frmEstMotosCCIA.Show
    else
      frmEstMotosCCIA.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;


{ TNaturezaOp }

function TNaturezaOp.abreNaturezaOp: boolean;
begin
  Result := montaSelect(' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
   ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
   ' WHERE NAT.ATIVO = 1 ORDER BY NAT.ORDEMEXIBICAO');
end;

function TNaturezaOp.abreNaturezaOp(nat: double): boolean;
begin
 Result := montaSelect(' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
  ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
  ' WHERE NAT.CODIGO_NOP = ' + FloatToStr(nat) + ' AND NAT.ATIVO = 1 ORDER BY NAT.ORDEMEXIBICAO, NAT.CODIGO_NOP');
end;

function TNaturezaOp.abreNaturezaOp(ptipvenda, pnatureza, pUso: string; codigo_uf: integer; pAltEst: string = ''; pVeicEstComfat: string = ''): boolean;
var
 vSql: string;
 cfop: string;
 altestoque: string;
 vcfopatualizado: boolean;
begin
  vSql := '';
  vcfopatualizado := false;
  if trim(pUso) = 'N' then
    vSql := vSql + ' AND IIF(COALESCE(NAT.TIPO_OPERACAO, ''N'') = '''', ''N'', COALESCE(NAT.TIPO_OPERACAO, ''N'')) = ''N'' '
  else
    vSql := vSql + ' AND IIF(COALESCE(NAT.TIPO_OPERACAO, ''U'') = '''', ''U'', COALESCE(NAT.TIPO_OPERACAO, ''U'')) = ''U'' ';

  if trim(pAltEst) = 'S' then
    vSql := vSql + ' AND COALESCE(NAT.ALT_EST, ''S'') <> ''N'' '
  else if (trim(pAltEst) = 'N') then
    vSql := vSql + ' AND COALESCE(NAT.ALT_EST, ''S'') = ''N'' ';

  if pnatureza = 'E' then
    Result := montaSelect(' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
     ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
     ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
     ' AND NAT.CODIGO_NOP <= 3999 AND NAT.ATIVO = 1 ' + vSql +
     ' ORDER BY NAT.ORDEMEXIBICAO, NAT.CODIGO_NOP')
  else if pnatureza = 'S' then
    Result := montaSelect(' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
     ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
     ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
     ' AND NAT.CODIGO_NOP > 4999 AND NAT.ATIVO = 1 ' + vSql +
     ' ORDER BY NAT.ORDEMEXIBICAO, NAT.CODIGO_NOP');
  Result := not dataSet.IsEmpty;

  if (codigo_uf <> - 1) and (trim(pVeicEstComfat) = '') then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
    	cfop := FloatToStr(dataset.FieldByName('CODIGO_NOP').AsFloat);

      if (pnatureza = 'E') and (vDadosIni.vEmp.vCodigo_Uf = codigo_uf) and (cfop[1] = '1') then
      begin
      	vcfopatualizado := true;
      	break;
      end
      else if (pnatureza = 'E') and (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf) and (cfop[1] = '2') then
    	begin
        vcfopatualizado := true;
      	break;
      end
      else if (pnatureza = 'S') and (vDadosIni.vEmp.vCodigo_Uf = codigo_uf) and (cfop[1] = '5') then
  	  begin
        vcfopatualizado := true;
      	break;
      end
      else if (pnatureza = 'S') and (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf) and (cfop[1] = '6') then
	    begin
      	vcfopatualizado := true;
      	break;
      end;

      dataSet.Next;
    end;
  end
  else if (codigo_uf = - 1) and (trim(pVeicEstComfat) <> '') then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
	    cfop := FloatToStr(dataset.FieldByName('CODIGO_NOP').AsFloat);
    	altestoque := vDadosIni.IfThen(dataset.FieldByName('ALT_EST').AsString = 'N', 'N', 'S');

      if (pVeicEstComfat = altestoque) then
      begin
      	vcfopatualizado := true;
      	break;
      end;
        
      dataSet.Next;
    end;
  end
  else if (codigo_uf <> - 1) and (trim(pVeicEstComfat) <> '') then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
    	cfop := FloatToStr(dataset.FieldByName('CODIGO_NOP').AsFloat);
      altestoque := vDadosIni.IfThen(dataset.FieldByName('ALT_EST').AsString = 'N', 'N', 'S');

      if (pnatureza = 'E') and (vDadosIni.vEmp.vCodigo_Uf = codigo_uf) and (cfop[1] = '1') and (pVeicEstComfat = altestoque) then
      begin
      	vcfopatualizado := true;
      	break;
      end
      else if (pnatureza = 'E') and (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf) and (cfop[1] = '2') and (pVeicEstComfat = altestoque) then
    	begin
        vcfopatualizado := true;
      	break;
      end
      else if (pnatureza = 'S') and (vDadosIni.vEmp.vCodigo_Uf = codigo_uf) and (cfop[1] = '5') and (pVeicEstComfat = altestoque) then
  	  begin
        vcfopatualizado := true;
      	break;
      end
      else if (pnatureza = 'S') and (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf) and (cfop[1] = '6') and (pVeicEstComfat = altestoque) then
	    begin
	      vcfopatualizado := true;
      	break;
      end;

      dataSet.Next;
    end;
  end;

  if not vcfopatualizado then
  	if not dataSet.IsEmpty then
	  	dataSet.First;
end;

function TNaturezaOp.buscarNaturezaOp(ptipvenda: string; nat: double; pUso: string): boolean;
var
 vSql: string;
begin
  vSql := '';
  if trim(pUso) = 'N' then
    vSql := vSql + ' AND IIF(COALESCE(NAT.TIPO_OPERACAO, ''N'') = '''', ''N'', COALESCE(NAT.TIPO_OPERACAO, ''N'')) = ''N'' '
  else
    vSql := vSql + ' AND IIF(COALESCE(NAT.TIPO_OPERACAO, ''U'') = '''', ''U'', COALESCE(NAT.TIPO_OPERACAO, ''U'')) = ''U'' ';

  buscas.Close;
  buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
    ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
    ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
    ' AND NAT.CODIGO_NOP = '+FloatToStr(nat)+  ' AND NAT.ATIVO = 1 ' + vSql +
    ' ORDER BY NAT.ORDEMEXIBICAO, NAT.CODIGO_NOP';
  buscas.Open;

  Result :=  not buscas.IsEmpty;
end;

function TNaturezaOp.buscarNaturezaOp(ptipvenda, pnatureza: string; codigo_uf: integer; pUso: string; pVeicEstComfat: string = ''): boolean;
var
 vSql: string;
begin
  vSql := '';
  if trim(pUso) = 'N' then
    vSql := vSql + ' AND IIF(COALESCE(NAT.TIPO_OPERACAO, ''N'') = '''', ''N'', COALESCE(NAT.TIPO_OPERACAO, ''N'')) = ''N'' '
  else
    vSql := vSql + ' AND IIF(COALESCE(NAT.TIPO_OPERACAO, ''U'') = '''', ''U'', COALESCE(NAT.TIPO_OPERACAO, ''U'')) = ''U'' ';

  if (pnatureza = 'S') and (trim(pVeicEstComfat) <> '') then
  	if trim(pVeicEstComfat) = 'S' then
	    vSql := vSql + ' AND COALESCE(NAT.ALT_EST, ''S'') <> ''N'' '
    else if trim(pVeicEstComfat) = 'N' then
    	vSql := vSql + ' AND COALESCE(NAT.ALT_EST, ''S'') = ''N'' ';

  if pnatureza = 'E' then
  begin
    buscas.Close;
    if (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf) then
      buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
        ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
        ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
        ' AND NAT.CODIGO_NOP > 1999 AND NAT.CODIGO_NOP <= 3999 AND NAT.ATIVO = 1 ' + vSql +
        ' ORDER BY NAT.ORDEMEXIBICAO, NAT.CODIGO_NOP'
    else
      buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
        ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
        ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
        ' AND NAT.CODIGO_NOP >= 0000 AND NAT.CODIGO_NOP <= 1999 AND NAT.ATIVO = 1 ' + vSql +
        ' ORDER BY NAT.ORDEMEXIBICAO, NAT.CODIGO_NOP';
    buscas.Open;
  end
  else
  begin
    buscas.Close;
    if (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf) then
      buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
        ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
        ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
        ' AND NAT.CODIGO_NOP > 5999 AND NAT.ATIVO = 1 ' +vSql+ ' ORDER BY NAT.ORDEMEXIBICAO, NAT.CODIGO_NOP'
    else
      buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
       ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
       ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
       ' AND NAT.CODIGO_NOP >= 4999  AND NAT.CODIGO_NOP <= 5999 AND NAT.ATIVO = 1 ' +vSql+ ' ORDER BY NAT.ORDEMEXIBICAO, NAT.CODIGO_NOP';
    buscas.Open;
  end;

  Result :=  not buscas.IsEmpty;
end;

function TNaturezaOp.buscarNaturezaInterm(nat: double): boolean;
var
 pCodigoNop: double;
begin
   Result := False;

   buscas.Close;
   buscas.SQL.Text := ' SELECT DESC_SERVICO, CODIGO_NOP FROM TIPO_SERVICO ' +
    ' WHERE COD_SERVICO = ' + IntToStr(vDadosIni.vEmp.vCodServInterm);
   buscas.Open;

   pCodigoNop := buscas.FieldByName('CODIGO_NOP').AsFloat;

   if pCodigoNop <> nat then
    exit;

   buscas.Close;
   buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT' +
    ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
    ' WHERE NAT.CODIGO_NOP = ' + FloatToStr(pCodigoNop);
   buscas.Open;

   Result :=  not buscas.IsEmpty;
end;

function TNaturezaOp.buscarNaturezaOp(ptipvenda, pnatureza: string; codigo_uf: Integer; codigo_nop: double; pUso: string): boolean;
var
 vSql: string;
begin
  vSql := '';
  if trim(pUso) = 'N' then
    vSql := vSql + ' AND IIF(COALESCE(NAT.TIPO_OPERACAO, ''N'') = '''', ''N'', COALESCE(NAT.TIPO_OPERACAO, ''N'')) = ''N'' '
  else
    vSql := vSql + ' AND IIF(COALESCE(NAT.TIPO_OPERACAO, ''U'') = '''', ''U'', COALESCE(NAT.TIPO_OPERACAO, ''U'')) = ''U'' ';
  if pnatureza = 'E' then
  begin
    buscas.Close;
    if codigo_uf = -1 then
    	buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
         ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
         ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
         ' AND NAT.CODIGO_NOP >= 0000  AND NAT.CODIGO_NOP <= 3999 AND NAT.CODIGO_NOP = '+FloatToStr(codigo_nop)+
         ' AND NAT.ATIVO = 1 ' + vSql + ' ORDER BY NAT.CODIGO_NOP'
    else
      if (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf) then
        buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
         ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
         ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
         ' AND NAT.CODIGO_NOP > 1999 AND NAT.CODIGO_NOP <= 3999 AND NAT.CODIGO_NOP = '+FloatToStr(codigo_nop)+
         ' AND NAT.ATIVO = 1 ' + vSql + ' ORDER BY NAT.CODIGO_NOP'
      else
        buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
         ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
         ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
         ' AND NAT.CODIGO_NOP >= 0000  AND NAT.CODIGO_NOP <= 1999 AND NAT.CODIGO_NOP = '+FloatToStr(codigo_nop)+
         ' AND NAT.ATIVO = 1 ' + vSql + ' ORDER BY NAT.CODIGO_NOP';
    buscas.Open;
  end
  else
  begin
    buscas.Close;
    if codigo_uf = -1 then
    	buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
          ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
          ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
          ' AND NAT.CODIGO_NOP >= 4999 AND NAT.CODIGO_NOP = '+FloatToStr(codigo_nop)+
          ' AND NAT.ATIVO = 1 ' +vSql+ ' ORDER BY NAT.CODIGO_NOP'
    else
      if (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf) then
        buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
          ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
          ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
          ' AND NAT.CODIGO_NOP > 5999 AND NAT.CODIGO_NOP = '+FloatToStr(codigo_nop)+
          ' AND NAT.ATIVO = 1 ' +vSql+ ' ORDER BY NAT.CODIGO_NOP'
      else
        buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
          ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
          ' WHERE NAT.TIPV_VEICULO = ' + QuotedStr(ptipvenda) +
          ' AND NAT.CODIGO_NOP >= 4999 AND NAT.CODIGO_NOP <= 5999 AND NAT.CODIGO_NOP = '+FloatToStr(codigo_nop)+
          ' AND NAT.ATIVO = 1 ' +vSql+ ' ORDER BY NAT.CODIGO_NOP';
    buscas.Open;
  end;

  Result :=  not buscas.IsEmpty;
end;

function TNaturezaOp.buscarNaturezaOp(nat: double): boolean;
begin
  Result := ExecutaComandosSql(' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
   ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
   ' WHERE NAT.CODIGO_NOP = ' + FloatToStr(nat) + ' AND NAT.ATIVO = 1');
end;

constructor TNaturezaOp.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsCFOPComFat);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TNaturezaOp.testarNaturezaOpNovoUsado(ptipvenda, pnatureza: string; codigo_uf: integer; nat: double; pUso: string): boolean;
var
  vMensagem: string;
  vtipo: string;
  cfop: string;
begin
  Result := true;

  vMensagem := '';

  buscas.Close;
  buscas.SQL.Text := ' SELECT NAT.*, SPED.TXT, SPED.TXT_COMPL FROM NAT_OP NAT ' +
    ' LEFT JOIN SPED_INFORMACAO_COMPLEMENTAR SPED ON SPED.COD_INF = NAT.COD_INF AND SPED.COD_EMPRESA = ' + vDadosIni.codEmpresa+
    ' WHERE NAT.CODIGO_NOP = :CODIGO_NOP AND NAT.ATIVO = 1 ';
  buscas.ParamByName('CODIGO_NOP').AsFloat := nat;
  buscas.Open;

  if buscas.IsEmpty then
    exit;

  if ((buscas.FieldByName('CODIGO_NOP').AsFloat >= 0000) and (buscas.FieldByName('CODIGO_NOP').AsFloat <= 3999) and (pnatureza <> 'E'))
  	or ((buscas.FieldByName('CODIGO_NOP').AsFloat >= 4999) and (pnatureza <> 'S')) then
  begin
    vMensagem := 'Natureza de Operação informada é de ' +	vDadosIni.IfThen(pnatureza = 'E', 'saída', 'entrada');
    Application.MessageBox(PChar(vMensagem), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    Result := false;
    exit;
  end;

  if ((trim(buscas.FieldByName('TIPO_OPERACAO').AsString) = 'N') and (pUso = 'U'))
  	or ((trim(buscas.FieldByName('TIPO_OPERACAO').AsString) = 'U') and (pUso = 'N')) then
  begin
    vMensagem := 'Natureza de Operação configurada somente para operações de veículos ' +	vDadosIni.IfThen(pUso = 'N', 'usados', 'novos');
    Application.MessageBox(PChar(vMensagem), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    Result := false;
    exit;
  end;

  if (codigo_uf  <> -1) then
  begin
  	cfop := IntToStr(Trunc(nat));
    if (Comfat.vSing.vMod = 'CTRVNDCONS') then
    	vtipo := 'Consignante'
    else
    	vtipo := 'Cliente';

    if (pnatureza = 'E') then
    begin
       if (cfop[1] <> '1') and (cfop[1] <> '2') and (cfop[1] <> '3') then
         vMensagem := 'CFOP de entrada deve iniciar em 1, 2 ou 3!'
       else if (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf)
       and (cfop[1] = '1') then
         vMensagem := vtipo + ' fora do estado, ' +
           'Natureza de Operação para fora do estado não deve iniciar em 1!'
       else if (vDadosIni.vEmp.vCodigo_Uf = codigo_uf)
       and (cfop[1] = '2') then
         vMensagem := vtipo + ' dentro do estado, ' +
           'Natureza de Operação para dentro do estado não deve iniciar em 2!';
    end
    else
    begin
       if (cfop[1] <> '5') and (cfop[1] <> '6') and (cfop[1] <> '7') then
         vMensagem := 'CFOP de saída deve iniciar em 5, 6 ou 7!'
       else if (vDadosIni.vEmp.vCodigo_Uf <> codigo_uf)
        and (cfop[1] = '5') then
         vMensagem := vtipo + ' fora do estado, ' +
           'Natureza de Operação para fora do estado não deve iniciar em 5!'
       else if (vDadosIni.vEmp.vCodigo_Uf = codigo_uf)
       and (cfop[1] = '6') then
         vMensagem := vtipo + ' dentro do estado, ' +
           'Natureza de Operação para dentro do estado não deve iniciar em 6!';
    end;

    if trim(vMensagem) <> '' then
    begin
      Application.MessageBox(PChar(vMensagem), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      Result := false;
      exit;
    end;
  end; 

  
end;

{ TXmlImport }

function TXmlImport.abreFormXMLVeiculoCCIA(pComFat: TComFat): boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 813;
    formulario.Height := 288;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Localizar...';
    frmEntradaCCIA.pnVeiculosXML.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    fTempDtSource := TDataSource.Create(nil);
    fTempDtSource.DataSet := fTempDtSet;

    frmEntradaCCIA.DtVeiculosXML.DataSet := fTempDtSet;
    frmEntradaCCIA.DBGrid6.DataSource := fTempDtSource;
    //ComFat.vEstMoto.Refresh;
    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      fTempDtSet.First;
      while not fTempDtSet.Eof  do
      begin
        if fTempDtSet.FieldByName('SEL').AsString = 'S' then
        begin
          pComFat.vEstMoto.dataSet.Insert;
          for i := 0 to fTempDtSet.Fields.Count - 1 do
            if (fTempDtSet.Fields[I].FieldName <> 'CODIGO') and (fTempDtSet.Fields[I].FieldName <> 'SEL') then
             if pComFat.vEstMoto.dataSet.FindField(fTempDtSet.Fields[I].FieldName) <> nil then
              pComFat.vEstMoto.dataSet.FieldByName(fTempDtSet.Fields[I].FieldName).Value := fTempDtSet.Fields[I].Value;
          pComFat.vEstMoto.dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('EST_MOTO', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
          pComFat.vEstMoto.dataSet.Post;
        end;
        fTempDtSet.Next;
      end;
      fTempDtSet.First;
    end;
    frmEntradaCCIA.pnVeiculosXML.Parent := frmEntradaCCIA.tsVeiculosXML;
    formulario.Free;
    formulario := nil;
  end;
end;

function TXmlImport.CadTransito: Boolean;
begin
 try
    if not _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      vDadosIni.fechaStatusProcessamento;
      exit;
    end;

    vDadosIni.abreStatusProcessamento('', 'Iniciando Nota Fiscal');
    vDadosIni.vTipoForm := 2;
    
    if frmCadNF = nil then
    begin
      vDadosIni.vNomeForm := 'frmCadNF';
      vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadNF, frmCadNF);
    end;

    frmCadNF.tag := 24;
    frmCadNF.ShowModal;
   finally
     vDadosIni.fechaStatusProcessamento;
     vDadosIni.vNomeForm := '';
   end;
end;

constructor TXmlImport.create;
begin
//  vnfe := TACBrNFe.Create(Application);
  ComFat := TComFat.create;
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TXmlImport.defineCampos(pComFat: TComFat; vDtSet: TClientDataSet): boolean;
var
  I: Integer;
begin
  try
      fTempDtSet:= TClientDataSet.Create(nil);
      fTempDtSet.Close;
      fTempDtSet.FieldDefs.Clear;
      for I := 0 to vDtSet.FieldDefs.Count - 1 do
        fTempDtSet.FieldDefs.Add(
          vDtSet.FieldDefs[i].Name,
          vDtSet.FieldDefs[i].DataType,
          vDtSet.FieldDefs[i].Size,
          false);
      fTempDtSet.CreateDataSet;
      fTempDtSet.EmptyDataSet;
      for I := 0 to vDtSet.FieldCount -1 do
      begin
         fTempDtSet.FieldByName(vDtSet.Fields[i].FieldName).DisplayLabel :=
            vDtSet.Fields[i].DisplayLabel;
         if ((fTempDtSet.FieldByName(vDtSet.Fields[i].FieldName).FieldName = 'PRECO_CUSTO') or
             (fTempDtSet.FieldByName(vDtSet.Fields[i].FieldName).FieldName = 'PRECO_TABEST') or
             (fTempDtSet.FieldByName(vDtSet.Fields[i].FieldName).FieldName = 'VALOR_ICM_SUBEST') or
             (fTempDtSet.FieldByName(vDtSet.Fields[i].FieldName).FieldName = 'FRETE_AQUISICAOEST') or
             (fTempDtSet.FieldByName(vDtSet.Fields[i].FieldName).FieldName = 'FRETE_VENDAEST')) then
            TFloatField(fTempDtSet.FieldByName(vDtSet.Fields[i].FieldName)).currency := true;
      end;
  except
    Result := false;
  end;
end;

destructor TXmlImport.destroy;
begin
  ComFat.Free;
  ComFat := nil;
end;

function TXmlImport.importaXml(vArquivo: string): Boolean;
begin
  if not vDadosIni.PesqPros('VEI067', 'INCLUIR', '', 'COM_FAT', '', buscas, True) then
    Exit;
  Result := montarNf(ComFat, vArquivo);
end;

function TXmlImport.importaXmlNF(vArquivo: string): Boolean;
begin
  if not _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
  begin
    vDadosIni.fechaStatusProcessamento;
    exit;
  end;

  try
    vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
    vDadosIni.vDtSetTmp.Close;
    vDadosIni.vDtSetTmp.FieldDefs.Clear;
    vDadosIni.vDtSetTmp.FieldDefs.Add('XML', ftString, 1000, false);

    if vDadosIni.vDtSetTmp.Tag = 0 then
    try
      vDadosIni.vDtSetTmp.CreateDataSet;
      vDadosIni.vDtSetTmp.Tag := 1;
    except
    end;

    vDadosIni.vDtSetTmp.EmptyDataSet;
    vDadosIni.vDtSetTmp.Insert;
    vDadosIni.vDtSetTmp.FieldByName('XML').AsString := trim(vArquivo);
    vDadosIni.vDtSetTmp.Post;

    vDadosIni.abreStatusProcessamento('', 'Iniciando Nota Fiscal');
    vDadosIni.vTipoForm := 2;

    if frmCadNF = nil then
    begin
      vDadosIni.vNomeForm := 'frmCadNF';
      vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadNF, frmCadNF);
    end;

    frmCadNF.tag := 12;
    frmCadNF.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
    vDadosIni.vNomeForm := '';
  end;
end;

function TXmlImport.manifestacaodestinatario: boolean;
begin
  try
    if not _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      vDadosIni.fechaStatusProcessamento;
      exit;
    end;

    if frmCadNF = nil then
    begin
      vDadosIni.vNomeForm := 'frmCadNF';
      vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadNF, frmCadNF);
    end;

    frmCadNF.tag := 16;
    frmCadNF.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TXmlImport.montarNf(pComFat: TComFat; VArquivoXml: string): boolean;
var
  n, x, vnota, vCodBairro, vCodTransportador,
    vCodClienteFornecedor, vCodUf, vcodcidade: Integer;
  BaseIPI: real;
  vdtbanco: Tdate;
  vflgcfop: integer;
begin
{  vnfe := TACBrNFe.Create(Application);

  try
   pComFat.vEstMoto.AbreEstMoto('');
   if fTempDtSet = nil then
     fTempDtSet := TClientDataSet.Create(nil);
   defineCampos(pComFat, pComFat.vEstMoto.dataset);

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;

  try
    n := 0;
    if VArquivoXml = '' then
    begin
      Result := false;
      exit;
    end;
    vflgcfop := 0;
    vnfe.NotasFiscais.Clear;
    vnfe.NotasFiscais.LoadFromFile(VArquivoXml);
    with vnfe.NotasFiscais.Items[n].NFe do
    begin
      if det.Items[n].Prod.veicProd.chassi <> '' then
      begin
        if not vdadosini.vSistemasUsuario.vSisVeiculos then
        begin
          Application.MessageBox('Usuário não pode importar Dados de veículos. ' + #13 +
            'Favor configurar a senha do mesmo', 'Atenção', mb_ok +
            MB_ICONINFORMATION);
          result := false;
          pComFat.buscas.close;
          exit;
        end;
      end;

      BaseIPI := 0;
      vdtbanco := vDadosIni.getDataBanco(pComFat.buscas);
      pComFat.buscas.close;
      pComFat.buscas.sql.Clear;
      pComFat.buscas.sql.Add('select * from bairros where NOME_BAIRRO like ' + QuotedStr(trim('%' +
        UpperCase(Emit.EnderEmit.xBairro) + '%')));
      pComFat.buscas.open;

      if pComFat.buscas.IsEmpty then
      begin
        pComFat.buscas.close;
        pComFat.buscas.sql.Clear;
        pComFat.buscas.sql.Add('insert into bairros (nome_bairro, cod_usuario, cod_usuario_alt) values ' +
          '(:nome_bairro, :cod_usuario, :cod_usuario_alt)');

        pComFat.buscas.ParamByName('nome_bairro').AsString := copy(uppercase(Emit.EnderEmit.xBairro), 1, 30);
        //          vnf.buscas.ParamByName('cod_bairro').AsInteger:=0;
        pComFat.buscas.ParamByName('cod_usuario').AsInteger := vDadosIni.vCodUsuario;
        pComFat.buscas.ParamByName('cod_usuario_alt').AsInteger := vDadosIni.vCodUsuario;

        pComFat.buscas.ExecSQL;
        pComFat.buscas.Transaction.CommitRetaining;

        pComFat.buscas.close;
        pComFat.buscas.sql.Clear;
        pComFat.buscas.sql.Add('select * from bairros where NOME_BAIRRO like ' + QuotedStr(trim('%' +
          uppercase(Emit.EnderEmit.xBairro) + '%')));
        pComFat.buscas.open;

        vCodBairro := pComFat.buscas.Fields[0].AsInteger;

      end
      else
      begin
        vCodBairro := pComFat.buscas.Fields[0].AsInteger;
      end;

      pComFat.buscas.close;
      pComFat.buscas.sql.Clear;
      pComFat.buscas.sql.Add('select * from cidades where NOME_CIDADE like ' + QuotedStr(trim('%' +
        UpperCase(Emit.EnderEmit.xMun) + '%')));
      pComFat.buscas.open;

      if pComFat.buscas.IsEmpty then
      begin
        pComFat.buscas.close;
        pComFat.buscas.sql.Clear;
        pComFat.buscas.sql.Add('insert into cidades(nome_cidade, cod_usuario,cod_usuario_alt,ibge_cod_cidade) values ' +
          '(:nome_cidade, :cod_usuario, :cod_usuario_alt,:ibge_cod_cidade)');

        pComFat.buscas.ParamByName('nome_cidade').AsString := copy(uppercase(Emit.EnderEmit.xMun), 1, 30);
        //          vnf.buscas.ParamByName('cod_cidade').AsInteger := 0;
        pComFat.buscas.ParamByName('cod_usuario').AsInteger := vDadosIni.vCodUsuario;
        pComFat.buscas.ParamByName('cod_usuario_alt').AsInteger := vDadosIni.vCodUsuario;
        pComFat.buscas.ParamByName('ibge_cod_cidade').AsInteger := Emit.EnderEmit.cMun;

        pComFat.buscas.ExecSQL;
        pComFat.buscas.Transaction.CommitRetaining;

        pComFat.buscas.close;
        pComFat.buscas.sql.Clear;
        pComFat.buscas.sql.Add('select * from cidades where NOME_CIDADE like ' + QuotedStr(trim('%' +
          uppercase(Emit.EnderEmit.xMun) + '%')));
        pComFat.buscas.open;

        vcodcidade := pComFat.buscas.Fields[0].AsInteger;

      end
      else
      begin
        vcodcidade := pComFat.buscas.Fields[0].AsInteger;
      end;

      if (trim(vnfe.NotasFiscais.items[0].NFe.Dest.CNPJCPF) <> '') and
        (trim(vnfe.NotasFiscais.items[0].NFe.Emit.CNPJCPF) <> vDadosIni.vEmp.vCNPJ) then
      begin
        if trim(vnfe.NotasFiscais.items[0].NFe.Dest.CNPJCPF) <>
          trim(vDadosIni.vEmp.vCNPJ) then
        begin
          Application.MessageBox(PChar('CNPJ do Destinatario difere do CNPJ da Empresa' + #13
            + 'CNPJ Destinatario: ' + vnfe.NotasFiscais.items[0].NFe.Dest.CNPJCPF
            + #13 + 'CNPJ Empresa: ' + vDadosIni.vEmp.vCNPJ), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          result := false;
          exit;
        end;
      end;
      pComFat.buscas.close;
      pComFat.buscas.sql.Clear;
      pComFat.buscas.sql.Add('select * from estados where IBGE_CODIGO_UF = ' +
        copy(inttostr(emit.EnderEmit.cMun), 1, 2));
      pComFat.buscas.open;
    // Testar aqui se não existir o não cadastramento...

      vCodUf := pComFat.buscas.Fields[0].AsInteger;

      pComFat.buscas.close;
      pComFat.buscas.sql.Clear;
      pComFat.buscas.sql.Add('select * from clientes where CPFCGC = ' + QuotedStr(trim(Emit.CNPJCPF)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);
      pComFat.buscas.open;

      if pComFat.buscas.IsEmpty then
      begin
        if Application.MessageBox('O forncedor/emitente não cadastrado.' + #13 +
          'Deseja cadastradar?',
          'Cadastrar Fornecedor/Emitente.', MB_YESNO + MB_ICONQUESTION) = idYes then
        begin
          pComFat.buscas.close;
          pComFat.buscas.sql.Clear;
          pComFat.buscas.sql.Add('insert into clientes (COD_CLIENTE, COD_EMPRESA, CODIGO_TIPO, EST_CODIGO_UF, CODIGO_UF, CPFCGC, NOME_CLIENTE, RAZAO, INSC_EST, ENDERECO, END_COBRANCA,' +
            ' NUM_END_CLIENTE, COD_BAIRRO, COD_BAIRRO_COBRANCA, BAIRRO, BAIRRO_COBRANCA, CEP, CEP_COBRANCA, COD_CIDADE, COD_CIDADE_COBRANCA, CIDADE, CIDA_COBRANCA, FONE_CLIENTE, TIPO, INSC_SUB_F,TIPVCLIENTE,DATA_CADASTRO)' +
            ' values (:COD_CLIENTE, :COD_EMPRESA, :CODIGO_TIPO, :EST_CODIGO_UF, :CODIGO_UF, :CPFCGC, :NOME_CLIENTE, :RAZAO, :INSC_EST, :ENDERECO, :END_COBRANCA,' +
            ' :NUM_END_CLIENTE, :COD_BAIRRO, :COD_BAIRRO_COBRANCA, :BAIRRO, :BAIRRO_COBRANCA, :CEP, :CEP_COBRANCA, :COD_CIDADE, :COD_CIDADE_COBRANCA, :CIDADE, :CIDA_COBRANCA, :FONE_CLIENTE, :TIPO, :INSC_SUB_F,:TIPVCLIENTE,:DATA_CADASTRO)');

          pComFat.buscas.ParamByName('COD_CLIENTE').AsInteger := pComFat.Gencodigo('clientes', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
          vCodClienteFornecedor := pComFat.buscas.ParamByName('COD_CLIENTE').AsInteger;
          pComFat.buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
          pComFat.buscas.ParamByName('CODIGO_TIPO').AsInteger := 2;
          pComFat.buscas.ParamByName('EST_CODIGO_UF').AsInteger := vCodUf;
          pComFat.buscas.ParamByName('CODIGO_UF').AsInteger := vCodUf;
          pComFat.buscas.ParamByName('CPFCGC').AsString := Emit.CNPJCPF;
          pComFat.buscas.ParamByName('NOME_CLIENTE').AsString := copy(uppercase(Emit.xNome), 1, 35);
          pComFat.buscas.ParamByName('RAZAO').AsString := copy(UpperCase(Emit.xNome), 1, 60);
          pComFat.buscas.ParamByName('INSC_EST').AsString := Emit.IE;
          pComFat.buscas.ParamByName('ENDERECO').AsString := copy(UpperCase(Emit.EnderEmit.xLgr), 1, 50);
          pComFat.buscas.ParamByName('END_COBRANCA').AsString := copy(UpperCase(Emit.EnderEmit.xLgr + ', '
            + Emit.EnderEmit.nro), 1, 50);
          pComFat.buscas.ParamByName('NUM_END_CLIENTE').AsString := Emit.EnderEmit.nro;
          //mudar  tipo de inteiro para vachar.
          pComFat.buscas.ParamByName('COD_BAIRRO').AsInteger := vCodBairro;
          pComFat.buscas.ParamByName('COD_BAIRRO_COBRANCA').AsInteger := vCodBairro;
          pComFat.buscas.ParamByName('BAIRRO').AsString := copy(UpperCase(Emit.EnderEmit.xBairro), 1, 35);
          pComFat.buscas.ParamByName('BAIRRO_COBRANCA').AsString := copy(UpperCase(Emit.EnderEmit.xBairro), 1, 35);
          pComFat.buscas.ParamByName('CEP').AsInteger := Emit.EnderEmit.Cep;
          pComFat.buscas.ParamByName('CEP_COBRANCA').AsInteger := Emit.EnderEmit.Cep;
          pComFat.buscas.ParamByName('COD_CIDADE').AsInteger := vcodcidade;
          pComFat.buscas.ParamByName('COD_CIDADE_COBRANCA').AsInteger := vcodcidade;
          pComFat.buscas.ParamByName('CIDADE').AsString := copy(uppercase(Emit.EnderEmit.xMun), 1, 30);
          pComFat.buscas.ParamByName('CIDA_COBRANCA').AsString := copy(Uppercase(Emit.EnderEmit.xMun), 1, 30);
          pComFat.buscas.ParamByName('FONE_CLIENTE').AsString := StringReplace(Emit.EnderEmit.fone, '(', '', [rfReplaceAll]);
          pComFat.buscas.ParamByName('FONE_CLIENTE').AsString := StringReplace(pComFat.buscas.ParamByName('FONE_CLIENTE').AsString, ')', '', [rfReplaceAll]);
          pComFat.buscas.ParamByName('FONE_CLIENTE').AsString := StringReplace(pComFat.buscas.ParamByName('FONE_CLIENTE').AsString, '-', '', [rfReplaceAll]);
          pComFat.buscas.ParamByName('FONE_CLIENTE').AsString := StringReplace(pComFat.buscas.ParamByName('FONE_CLIENTE').AsString, ' ', '', [rfReplaceAll]);
          pComFat.buscas.ParamByName('FONE_CLIENTE').AsString := copy(pComFat.buscas.ParamByName('FONE_CLIENTE').AsString, 1, 13);
          pComFat.buscas.ParamByName('TIPO').AsString := 'A';
          pComFat.buscas.ParamByName('INSC_SUB_F').AsString := Emit.IEST;
          pComFat.buscas.ParamByName('TIPVCLIENTE').AsString := 'V';
          pComFat.buscas.ParamByName('DATA_CADASTRO').asdate := vdtbanco;
          pComFat.buscas.ExecSQL;
          pComFat.buscas.Transaction.CommitRetaining;
        end
        else
        begin
          result := false;
          pComFat.buscas.close;
          exit;
        end;
      end
      else
      begin
        vCodClienteFornecedor := pComFat.buscas.FieldByName('COD_CLIENTE').AsInteger;
        if (pComFat.buscas.FieldByName('TIPO').AsString <> 'F') and
          (pComFat.buscas.FieldByName('TIPO').AsString <> 'A') then
        begin
          pComFat.buscas.close;
          pComFat.buscas.sql.Text := 'update clientes set tipo = ''A'' where cod_cliente = ' +
            IntToStr(vCodClienteFornecedor) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
          pComFat.buscas.Prepare;
          pComFat.buscas.ExecSQL;
        end;
      end;

      if Det.Items[x].Prod.veicProd.chassi <> '' then
      begin
        pComFat.buscas.Close;
        pComFat.buscas.SQL.Text := ' select tipv_veiculo from nat_op' +
         ' where codigo_nop = ' + Det.Items[x].Prod.CFOP+ ' and tipv_veiculo = ''T''';
        pComFat.buscas.Open;

//        if Det.Items[x].Prod.CFOP = '5409' then
        if not pComFat.buscas.IsEmpty then
        begin
          pComFat.buscas.close;
          pComFat.buscas.sql.Text := 'select VERSAO from NOTAFISCAL_ITEM_VEICULO where CHASSI = ' +
            QuotedStr(Det.Items[x].Prod.veicProd.chassi) +
          //' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' order by cod_nf desc';
          pComFat.buscas.open;

          vDadosIni.vPesquisa := IntToStr(pComFat.buscas.FieldByName('versao').AsInteger);

          pComFat.buscas.close;
          pComFat.buscas.sql.Text := 'select * from tipmodelo where codigo = ' + vDadosIni.vPesquisa +
            ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
          pComFat.buscas.open;

          vDadosIni.vPesquisa := '';
        end
        else
        begin
          pComFat.buscas.close;
          pComFat.buscas.sql.Text := 'select * from tipmodelo where codigofab like ''%' +
            Det.Items[x].Prod.cProd +
            '%'' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
          pComFat.buscas.open;

          if pComFat.buscas.IsEmpty then
          begin
            pComFat.buscas.close;
            pComFat.buscas.sql.Text := 'select tm.* from TIPMODELO_CODIGOFAB t' +
              ' inner join TIPMODELO tm on tm.codigo = t.CODIGO and tm.COD_EMPRESA = t.COD_EMPRESA' +
              ' where t.CODIGO_FAB = ' +QuotedStr(Det.Items[x].Prod.cProd) +
              ' and t.cod_empresa = ' + vDadosIni.codEmpresa + ' and tm.ativo = 1';
            pComFat.buscas.open;
          end;
        end;

        if pComFat.vEstMoto.AbreEstMoto(dET.Items[x].Prod.veicProd.chassi) then
        begin
          fTempDtSet.Insert;
          fTempDtSet.FieldByName('SEL').AsString := 'S';
          fTempDtSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          fTempDtSet.FieldByName('ATIVO').AsInteger := 1;
          fTempDtSet.FieldByName('CHASSI_C').AsString := dET.Items[x].Prod.veicProd.chassi;
          fTempDtSet.FieldByName('NUM_NOTA').AsInteger := 0;
          fTempDtSet.FieldByName('SERIE').AsVariant := Null;
          fTempDtSet.FieldByName('SIT_RES').AsVariant := Null;
          fTempDtSet.FieldByName('OBS_ITEMEST').AsVariant := Null;
          fTempDtSet.FieldByName('CERTIFICADOEST').AsVariant := Null;
          fTempDtSet.FieldByName('CATEGORIAEST').AsVariant := Null;
          fTempDtSet.FieldByName('SITUACAO').AsVariant := Null;
          fTempDtSet.FieldByName('TIPO_RES').AsVariant := Null;
          fTempDtSet.FieldByName('VENDEDOR_RES').AsVariant := Null;
          fTempDtSet.FieldByName('STATUS_RES').AsVariant := Null;
          fTempDtSet.FieldByName('NOME_RES').AsVariant := Null;
          fTempDtSet.FieldByName('SIT_RES').AsVariant := Null;
          fTempDtSet.FieldByName('STATUS_USO').AsVariant := Null;//.AsString := 'N';
          fTempDtSet.FieldByName('STATUS_ESTOQUE').AsString := 'N';
          fTempDtSet.FieldByName('STATUS_DEMONST').AsString := 'N';
          fTempDtSet.FieldByName('STATUS_RES').AsString := 'N';
          fTempDtSet.FieldByName('STATUS_TRANSDEP').AsString := 'N';

          fTempDtSet.FieldByName('COREST').AsString := Copy(dET.Items[x].Prod.veicProd.xCor, 1, 10);
          fTempDtSet.FieldByName('MOTOREST').AsString := Copy(dET.Items[x].Prod.veicProd.nMotor, 1, 15);
          fTempDtSet.FieldByName('COD_FORNECEDOR').AsInteger := vCodClienteFornecedor;
          fTempDtSet.FieldByName('PRECO_CUSTO').AsFloat := Det.Items[x].Prod.vProd;
          try
            if Trim(vDadosIni.vEmp.vUsarCorFabDenatran) = 'D' then
              fTempDtSet.FieldByName('COD_COR').AsString := dET.Items[x].Prod.veicProd.cCorDENATRAN
            else
              fTempDtSet.FieldByName('COD_COR').AsString := dET.Items[x].Prod.veicProd.cCor;
            if not pComFat.vEstMoto.vCoresVeic.verificaCorDenatram(fTempDtSet) then
              pComFat.vEstMoto.vCoresVeic.verificaCorDescricao(fTempDtSet);
          except
            pComFat.vEstMoto.vCoresVeic.verificaCorDescricao(fTempDtSet);
          end;

          pComFat.vEstMoto.vModVeic.abreModelos(pComFat.buscas.FieldByName('CODIGO').AsInteger);
          fTempDtSet.FieldByName('ANO_FABEST').AsInteger := dET.Items[x].Prod.veicProd.anoFab;
          fTempDtSet.FieldByName('ANO_MODEST').AsInteger := dET.Items[x].Prod.veicProd.anoMod;
          fTempDtSet.FieldByName('MOTOREST').AsString := dET.Items[x].Prod.veicProd.nMotor;

          pComFat.buscas.close;
          pComFat.buscas.sql.Text := ' select n1.codigo_nop, coalesce(n1.tipv_veiculo, '''') tipv_veiculo from nat_op n1 ' +
            ' where n1.codigo_nop = (select n2.cfop_conv from nat_op n2 where n2.codigo_nop = ' + dET.Items[x].Prod.CFOP+ ')';
          pComFat.buscas.Open;

          if trim(pComFat.buscas.FieldByName('TIPV_VEICULO').AsString) <> '' then
            fTempDtSet.FieldByName('TIPV_VEICULO').AsString := pComFat.buscas.FieldByName('TIPV_VEICULO').AsString;

          if pComFat.vEstMoto.vModVeic.dataSet.IsEmpty then
          begin
            pComFat.vEstMoto.vModVeic.abreModelos;
            Application.MessageBox(PChar('Modelo não encontrado. Código de Fabrica: ' + Det.Items[x].Prod.cProd), 'Atenção', 0 + 64);
            exit;
          end
          else
            pComFat.vEstMoto.vModVeic.verificaModeloVeiculo(fTempDtSet);

          if fTempDtSet.State in [dsInsert, dsEdit] then
            fTempDtSet.Post;
        end;
      end;
    end;
    if not fTempDtSet.IsEmpty then
      if not abreFormXMLVeiculoCCIA(pComFat) then
        exit;

    if (pComFat.vEstMoto.dataSet.ChangeCount = 0) then
      Result := True
    else
      Result := pComFat.vEstMoto.Apply;

    if result then
      pComFat.vEstMoto.transacao.Commit;

    if vflgcfop = 1 then
      Application.MessageBox('Nota Fiscal não encontrou CFOP de conversão no cadastro de CFOP. ' +
        #13 + 'Favor atualizar esta tabela.(Ex.: CFOP=6401 CFOP CONVERSÃO=2401)', 'Atenção', mb_ok +
        MB_ICONINFORMATION);
    Result := True;

  finally
    vnfe.Free;
    vnfe := nil;
  end;
  }
end;

function TXmlImport.montarNfAvulsa(pNat: string): boolean;
var
  vNf: TNfCab;
  vCodNF: Integer;
  vTemp: string;
begin
  if not _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
  begin
    vDadosIni.fechaStatusProcessamento;
    exit;
  end;

  try
    vDadosIni.abreStatusProcessamento('', 'Iniciando Nota Fiscal');
    vDadosIni.vTipoForm := 2;

    if frmCadNF = nil then
    begin
      vDadosIni.vNomeForm := 'frmCadNF';
      vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadNF, frmCadNF);
    end;

    if pNat = 'E' then
      frmCadNF.tag := 14
    else
      frmCadNF.tag := 15;
    frmCadNF.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
    vDadosIni.vNomeForm := '';
  end;
end;

function TXmlImport.SetarStatusUsoXMLVeiculo(Uso, TipoVenda: string; pFlag: Integer = 0): boolean;
begin
  fTempDtSet.First;
  if not fTempDtSet.Eof then
  begin
    if (fTempDtSet.FieldByName('SEL').AsString= 'S') then
    begin
      fTempDtSet.Edit;
      if pFlag = 0 then
        fTempDtSet.FieldByName('STATUS_USO').AsString := Uso
      else
        fTempDtSet.FieldByName('TIPV_VEICULO').AsString := Copy(trim(TipoVenda), 1, 1);
      fTempDtSet.Post;
    end;
   fTempDtSet.Next;
  end;
end;

procedure TXmlImport._desmarcarTodos(datasettemp: TClientDataSet);
begin
  try
    if not datasettemp.Active then
      Exit;

    datasettemp.First;
    while not datasettemp.Eof do
    begin
      datasettemp.Edit;
      datasettemp.FieldByName('sel').AsString := '';
      datasettemp.Post;
      datasettemp.Next;
    end;
    datasettemp.First;

  finally
  end;
end;

procedure TXmlImport._marcaDesmarcaLinha(datasettemp: TClientDataSet);
begin
  if datasettemp.IsEmpty then
    exit;

  datasettemp.Edit;
  if datasettemp.FieldByName('SEL').AsString = 'S' then
    datasettemp.FieldByName('SEL').AsString := ''
  else
    datasettemp.FieldByName('SEL').AsString := 'S';
  datasettemp.Post;
end;

procedure TXmlImport._marcarTodos(datasettemp: TClientDataSet);
begin
  try
  	if not datasettemp.Active then
      Exit;

    datasettemp.First;
    while not datasettemp.Eof do
    begin
      datasettemp.Edit;
      datasettemp.FieldByName('sel').AsString := 'S';
      datasettemp.Post;
      datasettemp.Next;
    end;
    datasettemp.First;

  finally
  end;
end;

function TXmlImport._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;

end;

{ TModContrato }

function TModContrato.AbreContratos(Formulario, TipoContrato: string): boolean;
begin
  if Trim(Formulario) = '' then
    Result := montaSelect('SELECT (M.COD_CARTA||'' | ''||M.DESCRICAO) DESCRICAO, M.* FROM MODCARTAS M ' +
      ' WHERE M.ATIVO = 1 AND M.TIPO =''MOT'' AND M.COD_EMPRESA =' + vDadosIni.codEmpresa + ' ORDER BY M.DESCRICAO')
  else if Trim(TipoContrato) = '' then
    Result := montaSelect('SELECT (M.COD_CARTA||'' | ''||M.DESCRICAO) DESCRICAO, M.* FROM MODCARTAS M ' +
      ' WHERE M.ATIVO = 1 AND M.TIPO =''MOT'' AND M.COD_EMPRESA =' + vDadosIni.codEmpresa + ' AND FORMULARIOS = ''' +
      Formulario + ''' AND COALESCE(TIPO_CONTRATO, '''') = '''' ORDER BY M.DESCRICAO')
  else
    Result := montaSelect('SELECT (M.COD_CARTA||'' | ''||M.DESCRICAO) DESCRICAO, M.* FROM MODCARTAS M ' +
      ' WHERE M.ATIVO = 1 AND M.TIPO =''MOT'' AND M.COD_EMPRESA =' + vDadosIni.codEmpresa + ' AND FORMULARIOS = ''' +
      Formulario + ''' AND TIPO_CONTRATO LIKE ''%' + TipoContrato + '%'' ORDER BY M.DESCRICAO');
end;

function TModContrato.BuscarContrato(pSQL: string): Integer;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT (M.COD_CARTA||'' | ''||M.DESCRICAO) DESCRICAO, M.* FROM MODCARTAS M ' +
    ' WHERE M.ATIVO = 1 AND M.TIPO =''MOT'' AND M.COD_EMPRESA =' + vDadosIni.codEmpresa + pSQL;
  buscas.Open;

  Result := buscas.FieldByName('COD_CARTA').AsInteger;
end;

constructor TModContrato.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsModContratos);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

{ TDemonstracaoCCIA }

function TDemonstracaoCCIA.abreDemonstracao: boolean;
var
  pcod, pcod1, pcod2, pcod3: string;
  pDataHoraAtual: TDateTime;
begin
  pDataHoraAtual := vDadosIni.getDataBanco(buscas);
  pcod := '599';
  pcod1 := '699';
  pcod2 := '5912';
  pcod3 := '6912';

  montaSelect(' select vn.chassiv,vn.data_ven,vn.clientes_v,' +
    ' vn.num_nota_v,vn.nome_receb,tpm.codigo,tpm.cilindrada, vn.situacao, coalesce(est.status_demonst, ''N'') status_demonst, ' +
    ' est.preco_tabest,tpm.descricao,(vn.data_ven+ '+ IntToStr(vDadosIni.vEmp.vDiasDemonstracao)+') as data_venc from com_fat vn ' +
    ' inner join est_moto est on est.codigo = vn.cod_estmoto and est.chassi_c = vn.chassiv and est.cod_empresa = vn.cod_empresa ' +
    ' left join tipmodelo tpm on tpm.codigo = est.versaoest and tpm.cod_empresa = est.cod_empresa ' +
    ' where (((vn.data_ven+'+ IntToStr(vDadosIni.vEmp.vDiasDemonstracao)+')- (cast(''' + FormatDateTime('mm/dd/yyyy', pDataHoraAtual) + ''' as timestamp))) <= 5)' +
    ' and (vn.tipv_veiculo = ''D'') and vn.situacao is null ' + //((vn.tipv_veiculo = ''D'') or (vn.tipv_veiculo = ''O'')) ' +
    ' and natureza = ''S'' and (coalesce(trim(status_v), '''') = ''FECHADO'') ' +
    //' and (vn.natop_v = ' + pcod + ' or vn.natop_v = ' + pcod1 + ' or vn.natop_v = ' + pcod2 + ' or vn.natop_v = ' + pcod3 + ' ) and vn.situacao is null ' +
    ' and vn.chassiv = est.chassi_c and est.versaoest = tpm.codigo and vn.cod_empresa = tpm.cod_empresa' +
    ' and vn.cod_empresa = est.cod_empresa and vn.cod_empresa = ' + vDadosIni.codEmpresa + ' and vn.natureza = ''S'' and vn.ativo = 1 ' +
    ' and coalesce(est.status_demonst, ''N'') = ''S'' ' +
    ' order by tpm.ordtipo,tpm.descricao,tpm.codigo,vn.data_ven');

  vDadosIni.vdatademo := DateToStr(vDadosIni.getDataBanco(buscas));

  Result := not dataSet.IsEmpty;
end;

constructor TDemonstracaoCCIA.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsDemonstracao);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

procedure TDemonstracaoCCIA._DemonstracaoVeiculos(Tipoform: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Veículos em Demonstração');
    vDadosIni.vTipoForm := TipoForm;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    begin
      Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('VEI088', 'CONSULTA', '', 'VEICULOS', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmDemonstracaoVeiculosCCIA = nil then
    begin
      vDadosIni.vTipoForm := TipoForm;
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmDemonstracaoVeiculosCCIA, frmDemonstracaoVeiculosCCIA);
    end;

    if (TipoForm > 0) and (not frmDemonstracaoVeiculosCCIA.Visible) then
      frmDemonstracaoVeiculosCCIA.ShowModal
    else if (not frmDemonstracaoVeiculosCCIA.Visible) then
      frmDemonstracaoVeiculosCCIA.Show
    else if frmDemonstracaoVeiculosCCIA.FormStyle = fsMDIChild then
      frmDemonstracaoVeiculosCCIA.Show
    else
      frmDemonstracaoVeiculosCCIA.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TDemonstracaoCCIA._ValidarEMail(pStr: string; pExibirErro: boolean = false): Boolean;
begin
  pStr := Trim(UpperCase(pStr));
  if Pos('@', pStr) > 1 then
  begin
    System.Delete(pStr, 1, pos('@', pStr));
    Result := (Length(pStr) > 0) and (Pos('.', pStr) > 2);
  end
  else begin
    if pExibirErro then
      Application.MessageBox(PChar('FALHA AO ENVIAR EMAIL DE MOTOS EM DEMONSTRAÇÃO VENCENDO E/OU VENCIDAS: ' + pStr), 'Informação', MB_OK + MB_ICONINFORMATION);
    Result := False;
  end;
end;

function TDemonstracaoCCIA.EnvEmail(pEnviar: string = 'N'): boolean;
var
  html: ansistring;
  vEmails, vemail, vLetra, RetornoDll: string;
  i: Integer;
  AdressList: TStringList;

  procedure VerificarEmail(txt: string);
  begin
    if not _ValidarEMail(trim(txt), true) then
    begin
      registraErro('FALHA AO ENVIAR EMAIL DE MOTOS EM DEMONSTRAÇÃO VENCENDO E/OU VENCIDAS: ' + txt);
    end
    else
    begin
      if trim(vEmails) = '' then
        vEmails := trim(txt)
      else
        vEmails := trim(vEmails) + ';' + trim(txt);
    end;
  end;

begin
  try
    AdressList := TStringList.Create;
    vEmails := '';

    if ((vDadosIni.vemailDemo = '') or (pEnviar <> 'S')) then
      exit; ;

    for i := 1 to Length(vDadosIni.vemailDemo) do
    begin
      vLetra := vDadosIni.vemailDemo[i];
      if (vDadosIni.vemailDemo[i] = ';') or (vDadosIni.vemailDemo[i] = ',') or (vDadosIni.vemailDemo[i] = '|') then
      begin
        VerificarEmail(vemail);
        vemail := '';
      end
      else
        vemail := vemail + vDadosIni.vemailDemo[i];
    end;

    if (vLetra <> ';') and (vLetra <> ',') and (vLetra <> '|') then
      VerificarEmail(vemail);

    AdressList := TStringList.Create;
    vDadosIni.abreStatusProcessamento('', 'Enviando E-mail para: ' + vEmails);

    html := '<center> <b> MOTOS EM DEMONSTRAÇÃO VENCENDO E/OU VENCIDAS: </b> </center>';
    html := html + '<br>';
    dataSet.First;
    while not dataSet.eof do
    begin
      html := html + '<br>' + (' CHASSI: ' + dataSet.FieldByName('CHASSIV').asstring +
        ' DATA: ' + dataSet.FieldByName('DATA_VEN').AsString +
        ' DIAS: ' + format('%4.2f', [((dataSet.FieldByName('DATA_VEN').AsDateTime + 60) - vDadosIni.getDataBanco(buscas))]) +
        ' MOD: ' + trim(copy(dataSet.FieldByName('DESCRICAO').AsString, 1, 10)) +
        ' ONDE: ' + copy(dataSet.FieldByName('NOME_RECEB').AsString, 1, 14));
      dataSet.next;
    end;
    dataSet.First;

    if (Pos(vEmails, ';') <= 0 ) then
   		vEmails := vEmails + ';';
    AdressList := vDadosIni.Split(vEmails, ';');

    RetornoDll := Trim(string(SendMailByACBr(
    	PChar(vDadosIni.vEmp.vSmtp_cobranca),
      PChar(IntToStr(vDadosIni.vEmp.vSmtpporta_cobranca)),
      PChar(vDadosIni.vEmp.vEmail_cobranca),
      PChar(vDadosIni.vEmp.vLogin_cobranca),
      PChar(vDadosIni.vEmp.vSenha_email_cobranca),
      PChar(vDadosIni.vEmp.vRemetente_email_cobranca),
      PChar('MOTOS EM DEMONSTRAÇÃO VENCENDO E/OU VENCIDAS:'),
      PChar(html),
      PChar(''),
      PChar(AdressList.Text),
      PChar(''),
      PChar(''),
      PChar(''),
      PChar(''),
      True,
      vDadosIni.vEmp.vEmailUsaSegurancaSSL,
      True,
      False,
      false,
      True,
      False)));

     if RetornoDll <> 'OK' then
     begin
       Application.MessageBox(PChar(RetornoDll), 'Erro', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
       vDadosIni.registraErro(RetornoDll);
     end;

  finally
    if AdressList <> nil then
    	AdressList.Free;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TTransfDepCCIA }

function TTransfDepCCIA.abreFormTransfDep(pCodModelo: Integer): boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmTransDepVeiculosCCIA', hdTemp);

  try
    abreTransfDep(pCodModelo);
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TTransfDepCCIA.abreTransfDep(pCodModelo: Integer): boolean;
begin
  Result := false;

  if pCodModelo <= 0 then
    exit;

  montaSelect(' SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
    ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
    ' WHERE (COALESCE(EST_MOTO.STATUS_ESTOQUE, ''N'') = ''N'') AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'' ' +
    ' AND EST_MOTO.DATA_TRANS_RET IS NULL) AND EST_MOTO.VERSAOEST = ' + IntToStr(pCodModelo) +
    ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND EST_MOTO.DATA_TRANS_RET IS NULL AND EST_MOTO.ATIVO = 1');

  Result := not dataSet.IsEmpty;

end;

constructor TTransfDepCCIA.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsEstMotosTransfDep);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);

  vReserva := TReservaEstMotoCCIA.create;
end;

destructor TTransfDepCCIA.destroy;
begin
  vReserva.Free;
  vReserva := nil;
  inherited;
end;

function TTransfDepCCIA.RetirarReservaTranfDep: boolean;
var
  buscas2: TIBQuery;
  vCodigo, vChassi: string;
begin
  if dataSet.IsEmpty then
    exit;

  vCodigo := dataSet.FieldByName('CODIGO').AsString;
  vChassi := trim(dataSet.FieldByName('CHASSI_C').AsString);

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if Application.MessageBox('Tem certeza que deseja retirar reservar do Veículo?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
  begin
    if not dataSet.FieldByName('DATA_RES').IsNull then
    begin
      dataSet.edit;
      dataSet.FieldByName('DATA_RES').AsString := '';
      dataSet.FieldByName('HORA_RES').value := '';
      dataSet.FieldByName('NOME_RES').Value := '';
      dataSet.Post;

      if (dataSet.ChangeCount = 0) then
        Result := True
      else
        Result := Apply;

      if result then
        result := CommitaTransacao;

      if Result then
        vDadosIni.GravaAuditoria('VEI084', 'EDITAR', 'SUCESSO - CHASSI ' + vChassi, 'TRANSF_DEP', vCodigo, buscas)
      else
        vDadosIni.GravaAuditoria('VEI084', 'EDITAR', 'FALHA - CHASSI ' + vChassi, 'TRANSF_DEP', vCodigo, buscas);

      if result then
        Refresh;
    end
    else
      Application.MessageBox('Veículo não Reservado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

function TTransfDepCCIA.SalvarReservaTranfDep: boolean;
var
  buscas2: TIBQuery;
  vCodigo, vChassi: string;
begin
  if dataSet.IsEmpty then
    exit;

  vCodigo := dataSet.FieldByName('CODIGO').AsString;
  vChassi := trim(dataSet.FieldByName('CHASSI_C').AsString);
              
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if Application.MessageBox('Tem certeza que deseja reservar o Veículo?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
  begin
    if dataSet.FieldByName('DATA_RES').IsNull then
    begin
      dataSet.Edit;
      dataSet.FieldByName('DATA_RES').Value := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('HORA_RES').value := timetostr(vDadosIni.getDataHoraBanco(buscas));
      dataSet.FieldByName('NOME_RES').AsString := vDadosIni.vNomeFuncionario;
      dataSet.Post;

      if (dataSet.ChangeCount = 0) then
        Result := True
      else
        Result := Apply;

      if result then
        result := CommitaTransacao;

      if Result then
        vDadosIni.GravaAuditoria('VEI083', 'EDITAR', 'SUCESSO - CHASSI ' + vChassi, 'TRANSF_DEP', vCodigo, buscas)
      else
        vDadosIni.GravaAuditoria('VEI083', 'EDITAR', 'FALHA - CHASSI ' + vChassi, 'TRANSF_DEP', vCodigo, buscas);

      if result then
        Refresh;
    end
    else
      Application.MessageBox('Veículo Reservado para outro Vendedor.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

{ TTabPrecoVeic }

constructor TTabPrecoVeic.create;
begin
 if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsTabPrecoVeic);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TTabPrecoVeic.delete: boolean;
var
  codigo: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  codigo := dataSet.FieldByName('cod_veiculo').AsString;

  if Application.MessageBox('Deseja excluir Tabela Preço?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
    buscas.Close;
    buscas.SQL.Text := 'delete from tabpreco_veiculo where cod_veiculo = ' + codigo
      + ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;
      vDadosIni.GravaAuditoria('VEI092', 'EXCLUIR', 'SUCESSO', 'TABPRECO_VEICULO', codigo, buscas);
      CommitaTransacao;
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VEI092', 'EXCLUIR', 'FALHA', 'TABPRECO_VEICULO', codigo, buscas);
    end;
  end;
  result := true;
  Refresh;

end;

function TTabPrecoVeic.edit: boolean;
begin
   Result := inherited Edit;
  if not result then
    Exit;
end;

function TTabPrecoVeic.insert(vModVeic: TModVeiculoCCIA): boolean;
begin
  Result := inherited insert;
  if not result then
    Exit;

  dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
  dataSet.FieldByName('COD_VEICULO').AsInteger := vModVeic.dataSet.FieldByName('CODIGO').AsInteger;
end;

function TTabPrecoVeic.post: boolean;
var
  acao: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.FieldByName('ano_fab').IsNull then
    begin
      FrmCadModVeiculosCCIA.TabSheet5.Show;
      raiseExceptionCreate('Ano Fabricação não informado!', 'DBEdit3');
    end;

    if Length(trim(dataSet.FieldByName('ano_fab').AsString)) < 4 then
    begin
     FrmCadModVeiculosCCIA.TabSheet5.Show;
     raiseExceptionCreate('Ano Fabricação incorreto!', 'DBEdit3');
    end;

    if (dataSet.FieldByName('ano_mod').isnull) then
    begin
      FrmCadModVeiculosCCIA.TabSheet5.Show;
      raiseExceptionCreate('Ano Modelo não informado!', 'DBEdit5');
    end;

    if Length(trim(dataSet.FieldByName('ano_mod').AsString)) < 4 then
    begin
     FrmCadModVeiculosCCIA.TabSheet5.Show;
     raiseExceptionCreate('Ano Modelo incorreto!', 'DBEdit5');
    end;

    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('prec_min').AsFloat, 2) <= 0 then
    begin
      FrmCadModVeiculosCCIA.TabSheet5.Show;
      raiseExceptionCreate('Preço Mínimo não informado!', 'DBEdit6');
    end;

    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('prec_tab').AsFloat, 2) <= 0 then
    begin
      FrmCadModVeiculosCCIA.TabSheet5.Show;
      raiseExceptionCreate('Preço Tabela não informado!', 'DBEdit7');
    end;

    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('prec_tab').AsFloat, 2) < vDadosIni.StrToFloatFormat(dataSet.FieldByName('prec_min').AsFloat, 2) then
    begin
      FrmCadModVeiculosCCIA.TabSheet5.Show;
      raiseExceptionCreate('Preço Tabela não deve ser menor que Preço Mínimo!', 'DBEdit6');
    end;

    if dataSet.State = dsInsert then
     if not _existePrecoVeic(dataSet.FieldByName('cod_veiculo').AsString, dataSet.FieldByName('ano_fab').AsString, dataSet.FieldByName('ano_mod').AsString) then
     begin
       FrmCadModVeiculosCCIA.TabSheet5.Show;
       Application.MessageBox('Já existe um preço cadastrado para esse Ano/Mod!', 'Atenção', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if result then
      result := apply;
    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI089', acao, 'SUCESSO', 'TABPRECO_VEICULO', dataSet.FieldByName('cod_veiculo').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI089', acao, 'FALHA', 'TABPRECO_VEICULO', dataSet.FieldByName('cod_veiculo').AsString, buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TTabPrecoVeic._AbreTabPrecoVeic(vModVeic: TModVeiculoCCIA): boolean;
begin
   if vModVeic.dataSet.IsEmpty then
    exit;
  Result := montaSelect('SELECT TABPRECO_VEICULO.* FROM TABPRECO_VEICULO' +
    ' INNER JOIN TIPMODELO ON TIPMODELO.CODIGO = TABPRECO_VEICULO.COD_VEICULO AND TIPMODELO.COD_EMPRESA = TABPRECO_VEICULO.COD_EMPRESA' +
    ' WHERE TABPRECO_VEICULO.COD_VEICULO = ' + vModVeic.dataSet.FieldByName('CODIGO').AsString +
    ' AND TABPRECO_VEICULO.COD_EMPRESA  = ' + vDadosIni.codEmpresa + ' and TABPRECO_VEICULO.COD_VEICULO <> 0');
end;

function TTabPrecoVeic._existePrecoVeic(pCodMod, pAnoFab, pAnoMod: string) : boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cod_veiculo from tabpreco_veiculo' +
  '  where cod_veiculo =' + pCodMod + ' and ano_fab = ' + pAnoFab + ' and ano_mod = '+pAnoMod+'  and cod_empresa = '+vDadosIni.codEmpresa+'';
  buscas.Open;

  Result := buscas.IsEmpty;
end;

{ TModVeiculo_CodigoFab }

function TModVeiculo_CodigoFab.abreCodigo(pCodigo: Integer): Boolean;
begin
 Result := montaSelect('select * from TIPMODELO_CODIGOFAB ' +
 	 ' where codigo = ' + IntToStr(pCodigo) +
   ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TModVeiculo_CodigoFab.create;
begin
 if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsModVCorF);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasMV);
end;

function TModVeiculo_CodigoFab.delete: Boolean;
begin
  Result := False;

  if not dataSet.IsEmpty then
   Result := inherited delete;

  if Result then
    Result := Apply;

  if Result then
    CommitaTransacao
  else
    RollBackTransacao;
end;

function TModVeiculo_CodigoFab.insereCodigoFab(pCodigo: Integer;
  pCodFab: string): boolean;
begin
  Result := False;
  try
    dataSet.Filter := 'CODIGO_FAB = ' + QuotedStr(Trim(pCodFab));
    dataSet.Filtered := True;

    if Trim(dataSet.FieldByName('codigo_fab').AsString) = trim(pCodFab) then
      raiseExceptionCreate('Codigo informado já existe para o modelo selecionado','');

    if Length(Trim(pCodFab)) > 60  then
      raiseExceptionCreate('Codigo informado deve conter até 60 caracteres','');

    buscas.Close;
    buscas.SQL.Text := 'select * from TIPMODELO_CODIGOFAB' +
      ' where codigo <> ' + IntToStr(pCodigo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and codigo_fab = ' + QuotedStr(Trim(pCodFab));
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Codigo informado já existe para outro modelo de codigo: ' + buscas.FieldByName('codigo').AsString,'');

    dataSet.Insert;
    dataSet.FieldByName('codigo').AsInteger := pCodigo;
    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('codigo_fab').AsString := Trim(pCodFab);
    dataSet.Post;

    Result := Apply;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;

  finally
    dataSet.Filtered := False;
    dataSet.Filter := '';
  end;
end;

{ THistVeiculo }

function THistVeiculo.AbrirComFat(pCodigo: Integer; pTipo: Integer = 0): boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  if pTipo = 0 then
    vDadosIni.vPesquisa := 'COM_FATEDIT| ' + IntToStr(pCodigo)
  else
    vDadosIni.vPesquisa := 'COM_FATEABRIR| ' + IntToStr(pCodigo);

  vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
  vDadosIni.vDtSetTmp.Close;
  vDadosIni.vDtSetTmp.FieldDefs.Clear;
  vDadosIni.vDtSetTmp.FieldDefs.Add('N_COMANDO', ftInteger, 0, false);

  if vDadosIni.vDtSetTmp.Tag = 0 then
  try
    vDadosIni.vDtSetTmp.CreateDataSet;
    vDadosIni.vDtSetTmp.Tag := 1;
  except
  end;

 vDadosIni.vDtSetTmp.EmptyDataSet;
 vDadosIni.vDtSetTmp.Insert;
 vDadosIni.vDtSetTmp.FieldByName('N_COMANDO').AsInteger := pCodigo;
 vDadosIni.vDtSetTmp.Post;
 vDadosIni.abreStatusProcessamento('', 'Abrindo Entrada/Saída de Veículos');
 formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmMovVeiculosCCIA', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
    vDadosIni.vPesquisa := '';
  end;
end;

function THistVeiculo.abrirPedVenda(pCodigo: Integer; pTipo: string; pTp: Integer = 0): boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  try
    if pTp = 0 then
    begin
      if trim(pTipo) = 'OS' then
        vDadosIni.vPesquisa := 'PEDVENDAESTMOTOOS| ' + IntToStr(pCodigo) + '|' + pTipo + '|'
      else
        vDadosIni.vPesquisa := 'PEDVENDAESTMOTOORC| ' + IntToStr(pCodigo) + '|' + pTipo + '|';
    end
    else
    begin
     if trim(pTipo) = 'OS' then
        vDadosIni.vPesquisa := 'PEDVENDAESTMOTOOSEDIT| ' + IntToStr(pCodigo) + '|' + pTipo + '|'
      else
        vDadosIni.vPesquisa := 'PEDVENDAESTMOTOORCEDIT| ' + IntToStr(pCodigo) + '|' + pTipo + '|';
    end; 


    if trim(pTipo) = 'OS' then
      vDadosIni.abreStatusProcessamento('', 'Abrindo Ordem de Serviço')
    else
      vDadosIni.abreStatusProcessamento('', 'Abrindo Orçamento');
    vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
    vDadosIni.vDtSetTmp.Close;
    vDadosIni.vDtSetTmp.FieldDefs.Clear;
    vDadosIni.vDtSetTmp.FieldDefs.Add('NPED', ftInteger, 0, false);
    vDadosIni.vDtSetTmp.FieldDefs.Add('TIPO', ftString, 3, false);

    if vDadosIni.vDtSetTmp.Tag = 0 then
    try
      vDadosIni.vDtSetTmp.CreateDataSet;
      vDadosIni.vDtSetTmp.Tag := 1;
    except
    end;

   vDadosIni.vDtSetTmp.EmptyDataSet;
   vDadosIni.vDtSetTmp.Insert;
   vDadosIni.vDtSetTmp.FieldByName('NPED').AsInteger := pCodigo;
   vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := pTipo;
   vDadosIni.vDtSetTmp.Post;

   formulario := Funcoes.AbreForm('pkPedidoVenda', 'TFrmCadPedVenda', hdTemp);

   formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
    vDadosIni.vPesquisa := '';
  end;
end;

function THistVeiculo.buscarHist(pChassi, pPlaca, pTipo, pNatureza: string; pRazao: boolean = false; pAgruparHist: string = ''): boolean;
var
 vNome, vWhere: string;
begin
 vNome := '';
 vWhere := '';

 if trim(pAgruparHist) = 'C' then
   vWhere := vWhere + ' WHERE (H.CHASSI_C =  '+ QuotedStr(pChassi) + ' AND TRIM(H.CHASSI_C) <> '''') '
 else if trim(pAgruparHist) = 'P' then
   vWhere := vWhere + ' WHERE (H.PLACAEST = '+ QuotedStr(pPlaca) + ' AND TRIM(H.CHASSI_C) <> '''') '
 else
   vWhere := ' WHERE ((H.CHASSI_C =  '+ QuotedStr(pChassi) + ' AND TRIM(H.CHASSI_C) <> '''') ' +
     ' OR (H.PLACAEST = ' + QuotedStr(pPlaca) + ' AND TRIM(H.PLACAEST) <> '''')) ';

 if (trim(pTipo) = 'CFT') and (trim(pNatureza)= 'S') then
   vWhere := vWhere + ' and H.NATUREZA = ' +QuotedStr(pNatureza)+
    ' and H.TIPO in (''CFT'',''CTR'') and H.COD_EMPRESA =' + vDadosIni.codEmpresa + ' ORDER BY H.DATA, H.COD_HIST'
 else
   vWhere := vWhere + ' and H.NATUREZA = ' +QuotedStr(pNatureza) +
    ' and H.TIPO in (' + QuotedStr(pTipo) +') and H.COD_EMPRESA =' + vDadosIni.codEmpresa + ' ORDER BY H.DATA, H.COD_HIST';

 if (trim(pChassi) = '') and (trim(pPlaca) = '') and (trim(pTipo) = '') and (trim(pNatureza) = '') then
   vNome := ' FIRST 1';
 if pRazao then
  vNome := ' CASE WHEN ((TRIM(COALESCE(H.TIPO, '''')) = ''NF'') AND (TRIM(COALESCE(H.NATUREZA, '''')) = ''E'') ' +
   ' AND (COALESCE(H.NUMDOC, 0) = 0)) THEN ' +
   '     CASE WHEN (TRIM(COALESCE(F.NOME, '''')) = '''') THEN ' +
   '       TRIM(F.NOME_FANTASIA) ' +
   '     ELSE ' +
   '       TRIM(F.NOME) ' +
   '     END ' +
   ' ELSE ' +
   '   TRIM(CL.RAZAO) ' +
   ' END CLIENTE, ' +
   ' TRIM(INTER.RAZAO) INTERMEDIADOR, TRIM(CON.RAZAO) CONCESSIONARIA, TRIM(CLV.RAZAO) CLIENTE_VENDEDOR '
 else
  vNome := ' CASE WHEN ((TRIM(COALESCE(H.TIPO, '''')) = ''NF'') AND (TRIM(COALESCE(H.NATUREZA, '''')) = ''E'') ' +
   ' AND (COALESCE(H.NUMDOC, 0) = 0)) THEN ' +
   '     CASE WHEN (TRIM(COALESCE(F.NOME_FANTASIA, '''')) = '''') THEN ' +
   '       TRIM(F.NOME) ' +
   '     ELSE ' +
   '       TRIM(F.NOME_FANTASIA) ' +
   '     END ' +
   ' ELSE ' +
   '   TRIM(CL.NOME_CLIENTE) ' +
   ' END CLIENTE, ' +
   ' TRIM(INTER.NOME_CLIENTE) INTERMEDIADOR, TRIM(CON.NOME_CLIENTE) CONCESSIONARIA, ' +
   ' TRIM(CLV.NOME_CLIENTE) CLIENTE_VENDEDOR ';

 result := montaSelect('SELECT ' + vNome + ', COL.NOME_VENDEDOR VENDEDOR, GER.NOME_VENDEDOR GERENTE, ' +
   ' SUBSTRING(TRIM(N.DESCRICAO_NOP) FROM 1 FOR 40) DESC_NATOP, ' +
   ' COND.DESC_COND_PAG COND_PAG, H.* FROM HIST_ESTMOTO H ' +
   ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = H.COD_CLIENTE AND CL.COD_EMPRESA = H.COD_EMPRESA ' +
   ' LEFT JOIN FORNECEDOR F ON F.CODIGO_F = H.COD_CLIENTE AND F.COD_EMPRESA = H.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES INTER ON INTER.COD_CLIENTE = H.COD_INTERMED AND INTER.COD_EMPRESA = H.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES CON ON CON.COD_CLIENTE = H.COD_CONCESS AND CON.COD_EMPRESA = H.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES CLV ON CLV.COD_CLIENTE = H.COD_CLI_VENDE AND CLV.COD_EMPRESA = H.COD_EMPRESA ' +
   ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = H.COD_VENDEDOR AND COL.COD_EMPRESA = H.COD_EMPRESA ' +
   ' LEFT JOIN COLABORADOR GER ON GER.COD_VENDEDOR = H.COD_GERENTE AND GER.COD_EMPRESA = H.COD_EMPRESA ' +
   ' LEFT JOIN COND_PAG COND ON COND.COD_COND_PAG = H.COD_COND_PAG ' +
   ' LEFT JOIN NAT_OP N ON N.CODIGO_NOP = H.NATOP_V '+ vWhere);

end;

constructor THistVeiculo.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsHistNFEEstmotos);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

destructor THistVeiculo.destroy;
begin
  fTempHistCtrE.Free;
  fTempHistCtrE := nil;
  fTempHistCtrS.Free;
  fTempHistCtrS := nil;
  fTempHistOrcamento.Free;
  fTempHistOrcamento := nil;
  fTempHistOficina.Free;
  fTempHistOficina := nil;
  inherited;
end;

procedure THistVeiculo.GravarCodNFdatasetTemp(pCodigo: Integer);
begin
   vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
   vDadosIni.vDtSetTmp.Close;
   vDadosIni.vDtSetTmp.FieldDefs.Clear;
   vDadosIni.vDtSetTmp.FieldDefs.Add('COD_NF', ftInteger, 0, false);

   if vDadosIni.vDtSetTmp.Tag = 0 then
   try
     vDadosIni.vDtSetTmp.CreateDataSet;
     vDadosIni.vDtSetTmp.Tag := 1;
   except
   end;

  vDadosIni.vDtSetTmp.EmptyDataSet;
  vDadosIni.vDtSetTmp.Insert;
  vDadosIni.vDtSetTmp.FieldByName('COD_NF').AsInteger := pCodigo;
  vDadosIni.vDtSetTmp.Post;
end;

function THistVeiculo.ImprimirPedVenda(pCodigo: Integer;
  pTipo: string): boolean;
 var
  formulario: TForm;
  hdTemp: THandle;
begin
try
  vDadosIni.vPesquisa := 'PEDVENDAIMPESTMOTO| ' + IntToStr(pCodigo) + '|' + pTipo + '|';

  vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
  vDadosIni.vDtSetTmp.Close;
  vDadosIni.vDtSetTmp.FieldDefs.Clear;
  vDadosIni.vDtSetTmp.FieldDefs.Add('NPED', ftInteger, 0, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('TIPO', ftString, 3, false);

  if vDadosIni.vDtSetTmp.Tag = 0 then
  try
    vDadosIni.vDtSetTmp.CreateDataSet;
    vDadosIni.vDtSetTmp.Tag := 1;
  except
  end;

  vDadosIni.vDtSetTmp.EmptyDataSet;
  vDadosIni.vDtSetTmp.Insert;
  vDadosIni.vDtSetTmp.FieldByName('NPED').AsInteger := pCodigo;
  vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := pTipo;
  vDadosIni.vDtSetTmp.Post;

  formulario := Funcoes.AbreForm('pkPedidoVenda', 'TfrmAbrirPedVenda', hdTemp);

  formulario.Show;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
    vDadosIni.vPesquisa := '';
  end;
end;

{ TEstMotoOutrasEmpCCIA }

function TEstMotoOutrasEmpCCIA.AbreEstMoto: boolean;
begin
  Result := montaSelect(' SELECT FIRST 1 EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
   ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
   ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
   ' WHERE EST_MOTO.ATIVO = 1 AND EST_MOTO.CODIGO = 0 AND EST_MOTO.COD_EMPRESA <>' + vDadosIni.codEmpresa);
end;

procedure TEstMotoOutrasEmpCCIA.CadVeiculosOutrasEmp(TipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Estoque e Movimento de Veículos (Outras Empresas)');
    vDadosIni.vTipoForm := TipoForm;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    begin
      Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    
    if not vDadosIni.PesqPros('VEI063', 'CONSULTA', '', 'EST_MOTO', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmEstMotosOutrasEmpCCIA = nil then
    begin
      vDadosIni.vTipoForm := TipoForm;
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmEstMotosOutrasEmpCCIA, frmEstMotosOutrasEmpCCIA);
    end;

    if (TipoForm > 0) and (not frmEstMotosOutrasEmpCCIA.Visible) then
      frmEstMotosOutrasEmpCCIA.ShowModal
    else if (not frmEstMotosOutrasEmpCCIA.Visible) then
      frmEstMotosOutrasEmpCCIA.Show
    else if frmEstMotosOutrasEmpCCIA.FormStyle = fsMDIChild then
      frmEstMotosOutrasEmpCCIA.Show
    else
      frmEstMotosOutrasEmpCCIA.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TEstMotoOutrasEmpCCIA.consulta: boolean;
var
  I, erro: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  tempPosicao, tempPosicaoAnt: string;
  vCampoTemp, vCampoTempAd, vCondicaoTmp, vCondicaoTmpAd: string;
begin
  try
    vsqlAdicional := '';
    tempPosicao := '';
    tempPosicaoAnt := '';
    vCampoTemp:= '';
    vCampoTempAd := '';
    if UpperCase(trim(vCons.campo)) = 'TODOS' then
      vCons.porData := False;

    if not vCons.adicional then
    begin
     vCons.campoAd := '';
     vCons.valorAd := '';
     vCons.condicaoAd := '';
     vCons.porDataAd := false;
     vCons.dataIniAd := '';
     vCons.dataFimAd := '';
    end;

    if (UpperCase(trim(vCons.ordem)) =  'MODELO') or (UpperCase(trim(vCons.ordem)) =  'COD MODELO') then
      vCons.ordem := 'EST_MOTO.DESCRICAO_VERSAOEST, EST_MOTO.COREST';
    if UpperCase(trim(vCons.campo)) = 'PLACA' then
  		vCampoTemp := 'EST_MOTO.PLACAEST'
    else if UpperCase(trim(vCons.campo)) =  'CLIENTE' then
      vCampoTemp := 'CL.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'FORNECEDOR' then
      vCampoTemp := 'F.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'VENDEDOR' then
      vCampoTemp := 'COL.NOME_VENDEDOR';

    if UpperCase(trim(vCons.campoAd)) = 'PLACA' then
  		vCampoTempAd := 'EST_MOTO.PLACAEST'
    else if UpperCase(trim(vCons.campoAd)) =  'CLIENTE' then
      vCampoTempAd := 'CL.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'FORNECEDOR' then
      vCampoTempAd := 'F.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'VENDEDOR' then
      vCampoTempAd := 'COL.NOME_VENDEDOR';

    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
      end;
    end; //porData

    if (vCons.novo) <> (vCons.usado) then
    begin
      if (vCons.novo) and (not vCons.usado) then
      begin
        if (vCons.transito) then
          vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_USO, ''N'') = ' + QuotedStr('N')+ ')'
        else
          vsqlAdicional := vsqlAdicional + ' (EST_MOTO.STATUS_USO = ' + QuotedStr('N')+ ')'
      end
      else if (vCons.usado) and (not vCons.novo) then
      begin
        if (vCons.transito) then
          vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_USO, ''U'') = ' + QuotedStr('U')+ ')'
        else
          vsqlAdicional := vsqlAdicional + ' (EST_MOTO.STATUS_USO = ' + QuotedStr('U')+ ')'
      end;
    end
    else
    begin
      if (vCons.novo) and (vCons.usado) then
      begin
        if (vCons.transito) then
          vsqlAdicional := vsqlAdicional +
          ' (COALESCE(EST_MOTO.STATUS_USO, ''N'') IN (' + QuotedStr('N')+ ', ' + QuotedStr('U')+ '))'
        else
          vsqlAdicional := vsqlAdicional +
           ' (EST_MOTO.STATUS_USO IN (' + QuotedStr('N')+ ', ' + QuotedStr('U')+ '))';
      end
      else
        vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_USO, '''') <> '''')';
    end;


    if Trim(vCampoTemp) <> '' then
    begin
      vCondicaoTmp := vCons.Condicao;
      if vCondicaoTmp = 'Igual' then
        vCondicaoTmp := '='
      else if vCondicaoTmp = 'Maior' then
        vCondicaoTmp := '>'
      else if vCondicaoTmp = 'Maior ou Igual' then
        vCondicaoTmp := '>='
      else if vCondicaoTmp = 'Menor' then
        vCondicaoTmp := '<'
      else if vCondicaoTmp = 'Menor ou Igual' then
        vCondicaoTmp := '<='
      else if vCondicaoTmp = 'Diferente' then
        vCondicaoTmp := '<>'
      else if (vCondicaoTmp = 'Esta contido') then
        vCondicaoTmp := 'like'
      else if (vCondicaoTmp = 'Começa') then
        vCondicaoTmp := 'Começa'
      else
        vCondicaoTmp := '=';
      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmp = 'like' then
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%') + ') ' +
          	' or (' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%')
      end
      else if vCondicaoTmp = 'Começa' then
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%') + ') ' +
          	' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))  + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%');
      end
      else
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor))) + ') ' +
          	' or ' + ' (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))) + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor)));
      end;
      vCons.valor := '';
      vCons.campo := '';
      vCons.ordem := vCampoTemp;
    end;

    if (UpperCase(trim(vCons.ordem)) =  'MODELO') or (UpperCase(trim(vCons.ordem)) =  'COD MODELO') then
      vCons.ordem :=  'EST_MOTO.POSICAO,' +  vCons.ordem + ', EST_MOTO.DATA_CAD,EST_MOTO.HORA_CAD'
    else if Trim(vCampoTemp) <> '' then
      vCons.ordem :=  'EST_MOTO.POSICAO,EST_MOTO.DATA_CAD,EST_MOTO.HORA_CAD,' +  vCons.ordem
    else
      vCons.ordem :=  'EST_MOTO.POSICAO,EST_MOTO.DATA_CAD,EST_MOTO.HORA_CAD';

    if Trim(vCampoTempAd) <> '' then
    begin
      vCondicaoTmpAd := vCons.CondicaoAd;
      if vCondicaoTmpAd = 'Igual' then
        vCondicaoTmpAd := '='
      else if vCondicaoTmpAd = 'Maior' then
        vCondicaoTmpAd := '>'
      else if vCondicaoTmpAd = 'Maior ou Igual' then
        vCondicaoTmpAd := '>='
      else if vCondicaoTmpAd = 'Menor' then
        vCondicaoTmpAd := '<'
      else if vCondicaoTmpAd = 'Menor ou Igual' then
        vCondicaoTmpAd := '<='
      else if vCondicaoTmpAd = 'Diferente' then
        vCondicaoTmpAd := '<>'
      else if (vCondicaoTmpAd = 'Esta contido') then
        vCondicaoTmpAd := 'like'
      else if (vCondicaoTmpAd = 'Começa') then
        vCondicaoTmpAd := 'Começa'
      else
        vCondicaoTmpAd := '=';

      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmpAd = 'like' then
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
          	' or (' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%')
      end
      else if vCondicaoTmpAd = 'Começa' then
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
          	' or (' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
        else
        	vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%');
      end
      else
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd))) + ') ' +
          	' or (' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)))) + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
      end;
      vCons.valorAd := '';
      vCons.campoAd := '';
    end;

    if vCons.adicional then
    begin
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
          erro := erro + 1;
        end;
        if erro = 2 then
        begin
          Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
            'Atenção', MB_OK + MB_ICONINFORMATION);
        end
        else
        begin
          if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
            formatodata := 'mm/dd/yyyy'
          else if pos('.', ShortDateFormat) <> 0 then
            formatodata := 'dd.mm.yyyy';
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end
      else
      begin
        vCons.dataIniAd := '';
        vCons.dataFimAd := '';
      end;
      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';

      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            vCons.campoAd := DataSet.Fields[I].FieldName;
            if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
              ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
            begin
              vCons.condicaoAd := '=';
              if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              begin
                try
                  if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                    vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)))
                  else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                    vCons.valorAd := FloatToStr(StrToFloat(Trim(vCons.valorAd)))
                except
                  vCons.valorAd := '0';
                  Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
                end;
              end
              else
                vCons.valorAd := vDadosIni.tirapontos(vCons.valorAd, 4);
            end
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
            begin
              if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd +
                ' >= ' + vCons.dataIniAd + ' and ' + vCons.campoAd + ' <= ' + vCons.dataFimAd
              else if (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
              Break;
            end;

            if UpperCase(trim(vCons.campoAd)) = 'COD_CLIENTE' then
               vCons.campoAd := 'EST_MOTO.COD_CLIENTE'
            else if UpperCase(trim(vCons.campoAd)) = 'COD_EMPRESA' then
               vCons.campoAd := 'EST_MOTO.COD_EMPRESA';

            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + ' and ' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' +
                QuotedStr(vCons.valorAd);
            Break;
          end;
        end;
      end;

    end; //adicional

    if vCons.avancada then
    begin
        if ((vCons.vivo) or (vCons.morto) or (vCons.estacionamento) or (vCons.transito))
        and (not((vCons.vivo) and (vCons.morto) and (vCons.estacionamento) and (vCons.transito))) then
        begin
          vsqlAdicional := vsqlAdicional + ' AND (';

          if ((vCons.vivo) and (vCons.morto) and (vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> (' + QuotedStr('TRANSITO') + ')) '
          else if ((vCons.vivo) and (vCons.morto) and (not vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> (' + QuotedStr('ESTACIONAMENTO') + ')) '
          else if ((vCons.vivo) and (not vCons.morto) and (vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> (' + QuotedStr('MORTO') + ')) '
          else if ((not vCons.vivo) and (vCons.morto) and (vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> (' + QuotedStr('VIVO') + ')) '
          else if ((vCons.vivo) and (vCons.morto) and (not vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('VIVO') + ',' + QuotedStr('MORTO') + ')) '
          else if ((vCons.vivo) and (not vCons.morto) and (vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('VIVO') + ',' + QuotedStr('ESTACIONAMENTO') + ')) '
          else if ((vCons.vivo) and (not vCons.morto) and (not vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('VIVO') + ',' + QuotedStr('TRANSITO') + ')) '
          else if ((not vCons.vivo) and (vCons.morto) and (vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('MORTO') + ',' + QuotedStr('ESTACIONAMENTO') + ')) '
          else if ((not vCons.vivo) and (vCons.morto) and (not vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('MORTO') + ',' + QuotedStr('TRANSITO') + ')) '
          else if ((not vCons.vivo) and (not vCons.morto) and (vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) in (' + QuotedStr('ESTACIONAMENTO') + ',' + QuotedStr('TRANSITO') + ')) '
          else if ((vCons.vivo) and (not vCons.morto) and (not vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = '+ QuotedStr('VIVO')+ ') '
          else if ((not vCons.vivo) and (vCons.morto) and (not vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = '+ QuotedStr('MORTO')+ ') '
          else if ((not vCons.vivo) and (not vCons.morto) and (vCons.estacionamento) and (not vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = '+ QuotedStr('ESTACIONAMENTO') + ') '
          else if ((not vCons.vivo) and (not vCons.morto) and (not vCons.estacionamento) and (vCons.transito)) then
            tempPosicaoAnt := ' (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = '+ QuotedStr('TRANSITO')+ ') ';
          if (vCons.transito) then
            tempPosicao := '(' + tempPosicaoAnt + ' OR (' + tempPosicaoAnt +
            ' AND (TRIM(COALESCE(EST_MOTO.MODELO_NF, '''')) = (' + QuotedStr('TRA') + ')))) '
          else
            tempPosicao := tempPosicaoAnt;
          if (vCons.transfdeposito) then
            tempPosicao := tempPosicao + ' OR (' + tempPosicaoAnt +
              ' OR (COALESCE(EST_MOTO.STATUS_TRANSDEP, '''') = ' + QuotedStr('S') +
              ' AND EST_MOTO.DATA_TRANS_RET IS NULL)) '
          else
            tempPosicao := tempPosicao + ' OR (' + tempPosicaoAnt +
              ' AND (NOT (COALESCE(EST_MOTO.STATUS_TRANSDEP, '''') = ' + QuotedStr('S') +
              ' AND EST_MOTO.DATA_TRANS_RET IS NULL))) ';

          vsqlAdicional := vsqlAdicional + tempPosicao;
          vsqlAdicional := vsqlAdicional + ' ) ';
        end;

        if (trim(vCons.demonstracao) <> '') or (trim(vCons.reserva) <> '') or (trim(vCons.canc) <> '') or (trim(vCons.usadotroca) <> '') then
        begin
          vsqlAdicional := vsqlAdicional + ' AND (';

          if (trim(vCons.demonstracao) <> '') then
            vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_DEMONST, '''') = ' + QuotedStr(trim(vCons.demonstracao)) + ')';

          if ((trim(vCons.demonstracao) <> '') and (trim(vCons.reserva) <> '')) then
            vsqlAdicional := vsqlAdicional + ' OR ';
          if (trim(vCons.reserva) <> '') then
            vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_RES, '''') = ' + QuotedStr(trim(vCons.reserva)) + ')';

          if ((trim(vCons.demonstracao) <> '') or (trim(vCons.reserva) <> '')) and (trim(vCons.canc) <> '') then
            vsqlAdicional := vsqlAdicional + ' OR ';
          if (trim(vCons.canc) <> '') then
            vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_CANC, '''') = ' + QuotedStr(trim(vCons.canc)) + ')';

          if ((trim(vCons.demonstracao) <> '') or (trim(vCons.reserva) <> '') or (trim(vCons.canc) <> '')) and (trim(vCons.usadotroca) <> '') then
            vsqlAdicional := vsqlAdicional + ' OR ';
          if (trim(vCons.usadotroca) <> '') then
            vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.USADO_TROCA, '''') = ' + QuotedStr(trim(vCons.usadotroca)) + ')';

          if (trim(tempPosicao) <> '') then
            if vCons.statusAND_OU = 'OU' then
              vsqlAdicional := vsqlAdicional + ' OR ' + tempPosicao;
          vsqlAdicional := vsqlAdicional + ' ) ';
        end;


        if ((vCons.comEstoque) or (vCons.semEstoque)
        or (vCons.EstoqueReal) or (vCons.Consignado) or (vCons.Intermediacao)) then
        begin
           if (vCons.comEstoque) <> (vCons.semEstoque) then
           begin
             vsqlAdicional := vsqlAdicional + ' AND (';

             if (vCons.comEstoque) and (not vCons.semEstoque) then
               vsqlAdicional := vsqlAdicional + ' (EST_MOTO.STATUS_ESTOQUE = ' + QuotedStr('S')+ ')'
             else if (vCons.semEstoque) and (not vCons.comEstoque) then
               vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_ESTOQUE, ''N'') = ' + QuotedStr('N') + ')';

             if (trim(tempPosicao) <> '') then
               if vCons.situacaoEstAND_OU = 'OU' then
                 vsqlAdicional := vsqlAdicional + ' OR ' + tempPosicao;
             vsqlAdicional := vsqlAdicional + ' ) ';
           end;

          if ((vCons.EstoqueReal) or (vCons.Consignado) or (vCons.Intermediacao)) then
          begin
            vsqlAdicional := vsqlAdicional + ' AND (';

            if ((vCons.EstoqueReal) and (vCons.Consignado) and (not vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') <> ' + QuotedStr('I') + ')'
            else if ((vCons.EstoqueReal) and (not vCons.Consignado) and (vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') <> ' + QuotedStr('C') + ')'
            else if ((not vCons.EstoqueReal) and (vCons.Consignado) and (vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') in (' + QuotedStr('C') + ',' + QuotedStr('I') + '))'
            else if ((vCons.EstoqueReal) and (not vCons.Consignado) and (not vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') not in (' + QuotedStr('C') + ',' + QuotedStr('I') + '))'
            else if ((not vCons.EstoqueReal) and (vCons.Consignado) and (not vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') = ' + QuotedStr('C') + ')'
            else if ((not vCons.EstoqueReal) and (not vCons.Consignado) and (vCons.Intermediacao)) then
              vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.TIPV_VEICULO, '''') = ' + QuotedStr('I') + ')';

            if (trim(tempPosicao) <> '') then
              if vCons.situacaoTPOPAND_OU = 'OU' then
                 vsqlAdicional := vsqlAdicional + ' OR ' + tempPosicao;
             vsqlAdicional := vsqlAdicional + ' ) ';

          end;
        end;
    end //avancada
    else
    begin
      if (vCons.novo) or (vCons.usado) then
        vsqlAdicional := vsqlAdicional + ' AND (TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''VIVO'')';

      if (vCons.novo) or (vCons.usado) then
      begin
        if (vCons.transfdeposito) then
          vsqlAdicional := '(' + vsqlAdicional + ' OR '
        else
          vsqlAdicional := '(' + vsqlAdicional + ' AND ';
      end
      else
        vsqlAdicional := vsqlAdicional + ' AND ';

      if (vCons.transfdeposito) then
        vsqlAdicional := vsqlAdicional + ' (COALESCE(EST_MOTO.STATUS_TRANSDEP, '''') = ' + QuotedStr('S') + ' AND EST_MOTO.DATA_TRANS_RET IS NULL) '
      else
        vsqlAdicional := vsqlAdicional + ' (NOT (COALESCE(EST_MOTO.STATUS_TRANSDEP, '''') = ' + QuotedStr('S') + ' AND EST_MOTO.DATA_TRANS_RET IS NULL)) ';
      if (vCons.novo) or (vCons.usado) then
        vsqlAdicional := vsqlAdicional + ')';
    end;

    if vCons.porData then
      result := ConsultaCamposOutrasEmp('EST_MOTO', vCons.campo, vCons.ordem, vCons.dataIni,
        vCons.dataFim, vDadosIni.codEmpresa, 1,
        ' EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR ',
        ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
        ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
        ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ',
        vsqlAdicional)
    else
      result := ConsultaCamposOutrasEmp('EST_MOTO', vCons.valor, vCons.campo, vCons.condicao,
        vCons.ordem, False, vDadosIni.codEmpresa,
        ' EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR ',
        ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
        ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
        ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ',
        vsqlAdicional);
  finally
    vsqlTemp := dataSet.CommandText;
  end;
end;

constructor TEstMotoOutrasEmpCCIA.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsEstMotosOutrasEmp);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);

  vReserva := TReservaEstMotoCCIA.create;
end;

destructor TEstMotoOutrasEmpCCIA.destroy;
begin
  vReserva.Free;
  vReserva := nil;
  inherited;
end;

{ TControlesCCIA }

function TControlesCCIA.abreControles: boolean;
begin
  Result := montaSelect('SELECT * FROM CONTROLES WHERE ATIVO = 1');
end;

constructor TControlesCCIA.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsControlesDesp);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV)
end;

{ TPContasCCIA }

function TPContasCCIA.abrePContas: boolean;
begin
  result := montaSelect(' SELECT P.*, G.DESC_GR, D.DESC_DEP FROM P_CONTAS P ' +
   ' LEFT JOIN GRUPOS_CT G ON G.GRUP_CT = P.GRUP_CT ' +
   ' LEFT JOIN DEPART_CT D ON D.COD_DEP  = G.COD_DEP WHERE P.TIPO_PLC = ''S'' AND P.ATIVO = 1');
end;

function TPContasCCIA.abrePContas(pCodigo: double): boolean;
begin
 result := montaSelect(' SELECT P.*, G.DESC_GR, D.DESC_DEP FROM P_CONTAS P ' +
  ' LEFT JOIN GRUPOS_CT G ON G.GRUP_CT = P.GRUP_CT ' +
  ' LEFT JOIN DEPART_CT D ON D.COD_DEP  = G.COD_DEP' +
  ' WHERE P.TIPO_PLC = ''S'' AND P.ATIVO = 1 AND P.N_CONTA_PLC = ' + FloatToStr(pCodigo));
end;

function TPContasCCIA.buscarPContas(pCodigo: double): boolean;
var
 pCodigoStr: string;
begin
  pCodigoStr := StringReplace(FloatToStr(pCodigo), ',', '.', [rfReplaceAll, rfIgnoreCase]);
  Result := ExecutaComandosSql('SELECT * FROM P_CONTAS WHERE N_CONTA_PLC = ' + pCodigoStr +
    ' AND TIPO_PLC = ''S'' AND ATIVO = 1');

end;

constructor TPContasCCIA.create;
begin
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsPContasDesp);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV)
end;

{ TReservaEstMotoCCIA }

function TReservaEstMotoCCIA.abreFormReserva(
	TipoForm: integer; pCod: Integer; pCodEmp: Integer; pChassi: string): boolean;
var
  pMensagem: string;
begin
  try
    Result := True;
    vDadosIni.abreStatusProcessamento('', 'Abrindo Reserva de Veículos');
    vDadosIni.vTipoForm := 1;
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if not vDadosIni.PesqPros('VEI062', 'ABRIR', '', 'EST_MOTO', '', DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      exit;
    end;

//    if not _mdiAberto('TFrmReservaVeiculosCCIA', 'O formulário de (reserva/reservas vencidas) se encontra aberto!') then
//    begin
//      vDadosIni.fechaStatusProcessamento;
//      exit;
//    end;

    vDadosIni.vPesquisa := 'RESERVAVEIC|' + IntToStr(pCod) + '|' + IntToStr(pCodEmp) + '|' + trim(pChassi) + '|';

    if FrmReservaVeiculosCCIA = nil then
    begin
    	vDadosIni.vTipoForm := TipoForm;
    	if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TFrmReservaVeiculosCCIA, FrmReservaVeiculosCCIA);
    end;

    if (TipoForm > 0) and (not FrmReservaVeiculosCCIA.Visible) then
      FrmReservaVeiculosCCIA.ShowModal
    else if (not FrmReservaVeiculosCCIA.Visible) then
      FrmReservaVeiculosCCIA.Show
    else if FrmReservaVeiculosCCIA.FormStyle = fsMDIChild then
      FrmReservaVeiculosCCIA.Show
    else
      FrmReservaVeiculosCCIA.ShowModal;
  finally
    vDadosIni.vPesquisa := '';
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TReservaEstMotoCCIA.abreFormReserva(TipoForm: integer): boolean;
begin
 try
    Result := True;
    if TipoForm = 1 then
      vDadosIni.vPesquisa := 'RESERVAVENC|'
    else if TipoForm = 2 then
      vDadosIni.vPesquisa := 'RESERVAVENCENDO|2|';
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);  

    try
      vDadosIni.abreStatusProcessamento('', 'Abrindo Reserva de Veículos');
      vDadosIni.vTipoForm := 1;

      if not vDadosIni.PesqPros('VEI062', 'ABRIR', '', 'EST_MOTO', '', DtmVeiculosCCIA.qrBuscasV, true) then
      begin
        vDadosIni.fechaStatusProcessamento;
        exit;
      end;

//      if not _mdiAberto('TfrmReservasVencidas', 'O formulário de reserva se encontra aberto!') then
//      begin
//        vDadosIni.fechaStatusProcessamento;
//        exit;
//      end;

      if frmReservasVencidas = nil then
      begin
        vDadosIni.vTipoForm := TipoForm;
        if TipoForm > 0 then
          vDadosIni.vModalOuChild := 'M';
        Application.CreateForm(TfrmReservasVencidas, frmReservasVencidas);
      end;

      if (TipoForm > 0) and (not frmReservasVencidas.Visible) then
        frmReservasVencidas.ShowModal
      else if (not frmReservasVencidas.Visible) then
        frmReservasVencidas.Show
      else if frmReservasVencidas.FormStyle = fsMDIChild then
        frmReservasVencidas.Show
      else
        frmReservasVencidas.ShowModal;
    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  finally
  end;
end;

procedure TReservaEstMotoCCIA.atualizarDataVenc;
var
	vDiasReserva, vDiasReservaAss: Integer;
  vDataBanco: TDate;
begin
  vDataBanco := vDadosIni.getDataBanco(buscas);

	buscas.Close;
  buscas.SQL.Text := ' select res.tipo_res, res.quant_dias_reserva, res.quant_dias_reserva_ass, est.posicao, est.data_res, est.hora_res from est_moto est ' +
     ' inner join tipo_reserva res on est.tipo_res = res.sigla and res.tipo = ''VEI'' ' +
     ' where est.codigo = :codigo and est.cod_empresa = :cod_empresa ';
  buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  if trim(buscas.FieldByName('TIPO_RES').AsString) <> 'C'  then
   exit;

  vDiasReserva := buscas.FieldByName('QUANT_DIAS_RESERVA').AsInteger;
  vDiasReservaAss := buscas.FieldByName('QUANT_DIAS_RESERVA_ASS').AsInteger;

  if dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime <= 0 then
		  dataSet.FieldByName('DATA_VENC_RES').AsDateTime := dataSet.FieldByName('DATA_RES').AsDatetime +	vDiasReserva
  else
  begin
    	dataSet.FieldByName('DATA_VENC_RES').AsDateTime := dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime + vDiasReservaAss;
      if vDataBanco > dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime then
       	if Application.MessageBox(PChar('Data da assembleia ultrapassada, deseja definir a data de vencimento ' +
        	IntToStr(vDiasReservaAss)+ ' dias apartir de hoje?'), 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
	         dataSet.FieldByName('DATA_VENC_RES').AsDateTime := vDataBanco + vDiasReservaAss;
  end;
end;

procedure TReservaEstMotoCCIA.buscarDadosReserva;
begin
  buscas.Close;
  if trim(dataSet.FieldByName('POSICAO').AsString) = 'TRANSITO' then
  begin
    buscas.SQL.Text := ' select retirar_reservas_venc, tipo_res from tipo_reserva res ' +
      ' where res.tipo = ''VEI'' and res.tipo_res = :tipo_res ';
    buscas.ParamByName('TIPO_RES').AsString := Copy(trim(dataSet.FieldByName('POSICAO').AsString), 1, 1);
  end
  else
  begin
    buscas.SQL.Text := ' select retirar_reservas_venc, tipo_res from tipo_reserva res ' +
      ' where res.tipo = ''VEI'' and res.sigla = :sigla ';
    buscas.ParamByName('SIGLA').AsString := trim(dataSet.FieldByName('TIPO_RES').AsString);
  end;
  buscas.Open;

  vTipoRes := buscas.FieldByName('TIPO_RES').AsString;
  vRetirarReservaVenc := buscas.FieldByName('RETIRAR_RESERVAS_VENC').AsString;
end;

function TReservaEstMotoCCIA.BuscaReservaVencendo: boolean;
begin
   dataSet.Close;
   dataSet.CommandText := ' SELECT EST_MOTO.*, ' +
     ' CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST_MOTO.NOME_RES END CLIENTE, ' +
     ' F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
     ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
     ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = EST_MOTO.TIPO_RES ' +
     ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' WHERE EST_MOTO.ATIVO = 1 AND RES.TIPO_RES = ''V'' ' +
     ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
     ' AND ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') ' +
     ' OR ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') ' +
     ' AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'') AND (EST_MOTO.DATA_TRANS_RET IS NULL) ' +
     ' AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, ''N'')) = ''S''))) ' +
     ' AND EST_MOTO.STATUS_RES = ''S'' AND EST_MOTO.DATA_VENC_RES IS NOT NULL ' +
     ' AND ((DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(EST_MOTO.HORA_VENC_RES AS TIME)), EST_MOTO.DATA_VENC_RES)) ' +
     ' - CAST(:DATA_ATUAL AS TIMESTAMP) < COALESCE(RES.MENSAGEM_VENC_DIAS, 0)) ' +
     ' AND (COALESCE(RES.MENSAGEM_VENC_DIAS, 0) > 0) AND EST_MOTO.VENDEDOR_RES = :COD_VENDEDOR ' +
     ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' UNION ' +
     ' SELECT EST_MOTO.*, ' +
     ' CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST_MOTO.NOME_RES END CLIENTE, ' +
     ' F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
     ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
     ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = EST_MOTO.TIPO_RES ' +
     ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' WHERE EST_MOTO.ATIVO = 1 AND RES.TIPO_RES = ''B'' ' +
     ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
     ' AND ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') ' +
     ' OR ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') ' +
     ' AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'') AND (EST_MOTO.DATA_TRANS_RET IS NULL) ' +
     ' AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, ''N'')) = ''S''))) ' +
     ' AND EST_MOTO.STATUS_RES = ''S'' AND EST_MOTO.DATA_VENC_RES IS NOT NULL ' +
     ' AND ((DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(EST_MOTO.HORA_VENC_RES AS TIME)), EST_MOTO.DATA_VENC_RES)) ' +
     ' - CAST(:DATA_ATUAL AS TIMESTAMP) < COALESCE(RES.MENSAGEM_VENC_DIAS, 0)) ' +
     ' AND (COALESCE(RES.MENSAGEM_VENC_DIAS, 0) > 0) AND EST_MOTO.VENDEDOR_RES = :COD_VENDEDOR ' +
     ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' UNION ' +
     ' SELECT EST_MOTO.*, ' +
     ' CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST_MOTO.NOME_RES END CLIENTE, ' +
     ' F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
     ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
     ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = EST_MOTO.TIPO_RES ' +
     ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' WHERE EST_MOTO.ATIVO = 1 AND RES.TIPO_RES = ''C'' ' +
     ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' + 
     ' AND ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') ' +
     ' OR ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') ' +
     ' AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'') AND (EST_MOTO.DATA_TRANS_RET IS NULL) ' +
     ' AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, ''N'')) = ''S''))) ' +
     ' AND EST_MOTO.STATUS_RES = ''S'' AND EST_MOTO.DATA_VENC_RES IS NOT NULL ' +
     ' AND ((DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(EST_MOTO.HORA_VENC_RES AS TIME)), EST_MOTO.DATA_VENC_RES)) ' +
     ' - CAST(:DATA_ATUAL AS TIMESTAMP) < COALESCE(RES.MENSAGEM_VENC_DIAS, 0)) ' +
     ' AND (COALESCE(RES.MENSAGEM_VENC_DIAS, 0) > 0) AND EST_MOTO.VENDEDOR_RES = :COD_VENDEDOR ' +
     ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' UNION '+
     ' SELECT EST_MOTO.*, ' +
     ' CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST_MOTO.NOME_RES END CLIENTE, ' +
     ' F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
     ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
     ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = EST_MOTO.TIPO_RES ' +
     ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' WHERE EST_MOTO.ATIVO = 1 AND RES.TIPO_RES = ''M'' ' +
     ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
     ' AND ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') ' +
     ' OR ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') ' +
     ' AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'') AND (EST_MOTO.DATA_TRANS_RET IS NULL) ' +
     ' AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, ''N'')) = ''S''))) ' +
     ' AND EST_MOTO.STATUS_RES = ''S'' AND EST_MOTO.DATA_VENC_RES IS NOT NULL ' +
     ' AND ((DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(EST_MOTO.HORA_VENC_RES AS TIME)), EST_MOTO.DATA_VENC_RES)) ' +
     ' - CAST(:DATA_ATUAL AS TIMESTAMP) < COALESCE(RES.MENSAGEM_VENC_DIAS, 0)) ' +
     ' AND (COALESCE(RES.MENSAGEM_VENC_DIAS, 0) > 0) AND EST_MOTO.VENDEDOR_RES = :COD_VENDEDOR ' +
     ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa;
   dataSet.Params.ParamByName('DATA_ATUAL').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
   dataSet.Params.ParamByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
   dataSet.Open;

   Result := not dataSet.IsEmpty;
end;

function TReservaEstMotoCCIA.BuscaReservaVencidas: boolean;
begin
   dataSet.Close;
   dataSet.CommandText := ' SELECT EST_MOTO.*, ' +
     ' CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST_MOTO.NOME_RES END CLIENTE, ' +
     ' F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
     ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
     ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = EST_MOTO.TIPO_RES ' +
     ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' WHERE EST_MOTO.ATIVO = 1 AND RES.TIPO_RES = ''V'' ' +
     ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
     ' AND ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') ' +
     ' OR ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') ' +
     ' AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'') AND (EST_MOTO.DATA_TRANS_RET IS NULL) ' +
     ' AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, ''N'')) = ''S''))) ' +
     ' AND EST_MOTO.STATUS_RES = ''S'' AND EST_MOTO.DATA_VENC_RES IS NOT NULL ' +
     ' AND :DATA_ATUAL > DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(EST_MOTO.HORA_VENC_RES AS TIME)), EST_MOTO.DATA_VENC_RES) ' +
     ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' UNION ' +
     ' SELECT EST_MOTO.*, ' +
     ' CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST_MOTO.NOME_RES END CLIENTE, ' +
     ' F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
     ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
     ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = EST_MOTO.TIPO_RES ' +
     ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' WHERE EST_MOTO.ATIVO = 1 AND RES.TIPO_RES = ''B'' ' +
     ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
     ' AND ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') ' +
     ' OR ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') ' +
     ' AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'') AND (EST_MOTO.DATA_TRANS_RET IS NULL) ' +
     ' AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, ''N'')) = ''S''))) ' +
     ' AND EST_MOTO.STATUS_RES = ''S'' AND EST_MOTO.DATA_VENC_RES IS NOT NULL ' +
     ' AND :DATA_ATUAL > DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(EST_MOTO.HORA_VENC_RES AS TIME)), EST_MOTO.DATA_VENC_RES)  ' +
     ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' UNION ' +
     ' SELECT EST_MOTO.*, ' +
     ' CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST_MOTO.NOME_RES END CLIENTE, ' +
     ' F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
     ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
     ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = EST_MOTO.TIPO_RES ' +
     ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' WHERE EST_MOTO.ATIVO = 1 AND RES.TIPO_RES = ''C'' ' +
     ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
     ' AND ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') ' +
     ' OR ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') ' +
     ' AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'') AND (EST_MOTO.DATA_TRANS_RET IS NULL) ' +
     ' AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, ''N'')) = ''S''))) ' +
     ' AND EST_MOTO.STATUS_RES = ''S'' AND EST_MOTO.DATA_VENC_RES IS NOT NULL ' +
     ' AND :DATA_ATUAL > DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(EST_MOTO.HORA_VENC_RES AS TIME)), EST_MOTO.DATA_VENC_RES)  ' +
     ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' UNION ' +
     ' SELECT EST_MOTO.*, ' +
     ' CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST_MOTO.NOME_RES END CLIENTE, ' +
     ' F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
     ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
     ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = EST_MOTO.TIPO_RES ' +
     ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
     ' WHERE EST_MOTO.ATIVO = 1 AND RES.TIPO_RES = ''M'' ' +
     ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
     ' AND ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) <> ''MORTO'') ' +
     ' OR ((TRIM(COALESCE(EST_MOTO.POSICAO, ''VIVO'')) = ''MORTO'') ' +
     ' AND (COALESCE(EST_MOTO.STATUS_TRANSDEP, ''N'') = ''S'') AND (EST_MOTO.DATA_TRANS_RET IS NULL) ' +
     ' AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, ''N'')) = ''S''))) ' +
     ' AND EST_MOTO.STATUS_RES = ''S'' AND EST_MOTO.DATA_VENC_RES IS NOT NULL ' +
     ' AND :DATA_ATUAL > DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(EST_MOTO.HORA_VENC_RES AS TIME)), EST_MOTO.DATA_VENC_RES) ' +
     ' AND EST_MOTO.COD_EMPRESA = ' + vDadosIni.codEmpresa;
   dataSet.Params.ParamByName('DATA_ATUAL').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
   dataSet.Open;

   Result := not dataSet.IsEmpty;
end;

function TReservaEstMotoCCIA.BuscaVeiculos(pCod, pCodEmp: Integer; pChassi: string): boolean;
var
 pMensagem: string;
begin
  Result := montaSelect(' SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
    ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
    ' WHERE EST_MOTO.ATIVO = 1 AND EST_MOTO.CODIGO = ' +IntToStr(pCod) +
    ' AND EST_MOTO.CHASSI_C = ' + QuotedStr(trim(pChassi)) +
    ' AND EST_MOTO.COD_EMPRESA = ' +IntToStr(pCodEmp));


  if (dataSet.FieldByName('COD_EMP_RESERVA').AsInteger > 0)
   and (dataSet.FieldByName('COD_EMP_RESERVA').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
  begin
    buscas.Close;
    buscas.SQL.Text := ' select IDENTIFICACAO_EMP, CGC_EMP from empresa  ' +
     ' where cod_empresa = ' + IntToStr(dataSet.FieldByName('COD_EMP_RESERVA').AsInteger);
    buscas.Open;

    pMensagem := 'Veículo reservado por outra empresa!' + #13 +
     '"' + IntToStr(dataSet.FieldByName('COD_EMP_RESERVA').AsInteger) +
     ' - '+ trim(buscas.FieldByName('IDENTIFICACAO_EMP').AsString) +
     ': '+ trim(buscas.FieldByName('CGC_EMP').AsString)+ '"';
    Application.MessageBox(PChar(pMensagem), 'Informação', MB_OK + MB_ICONINFORMATION +
    MB_DEFBUTTON1);
    Result := False;
    exit;
  end;
end;

constructor TReservaEstMotoCCIA.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsEstMotosReserva);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vColaboradorVeic := TLocColaborador.create;
  vClientesVeic := TLocCliente.create;
  vCondPag := TCondPagCCIA.create;

  vClientesVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsClientesEstMotosReserva);
  vColaboradorVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsColaboradorEstMotosReserva);
end;

destructor TReservaEstMotoCCIA.destroy;
begin
  vColaboradorVeic.Free;
  vColaboradorVeic := nil;
  vColaboradorVeic.Free;
  vColaboradorVeic := nil;
  vCondPag.Free;
  vCondPag := nil;
  inherited;
end;

function TReservaEstMotoCCIA.ObterDadosReserva(pRetirar: boolean = false): boolean;
begin
  try
    Result := True;

    buscarDadosReserva;
    if (dataSet.FieldByName('VENDEDOR_RES').AsInteger > 0) and (trim(vTipoRes) <> 'M')
     and (dataSet.FieldByName('VENDEDOR_RES').AsInteger <> vDadosIni.vCodUsuario) then
    begin
      if not vDadosIni.PesqPros('VEI159', 'ALTERAR', 'CHASSI - ' + dataSet.FieldByName('CHASSI_C').AsString + '',
        'EST_MOTO', dataSet.FieldByName('CODIGO').AsString , buscas, true) then
      begin
        Result := False;
        exit;
      end;
    end;

    if dataSet.State <> dsEdit then
     dataSet.Edit;

    vCodVendedorOld := dataSet.FieldByName('VENDEDOR_RES').AsInteger;
    vCodCliente := dataSet.FieldByName('COD_CLIENTE').AsInteger;
    vNomeVendedorOld := trim(dataSet.FieldByName('NOME_VENDEDOR').AsString);
    FrmReservaVeiculosCCIA.DBComboBox8.Text := '';
    FrmReservaVeiculosCCIA.DBComboBox4.Text := '';
    FrmReservaVeiculosCCIA.DBEdit1.Enabled := vHabilitarVend;
    FrmReservaVeiculosCCIA.DBLookupComboBox10.Enabled := vHabilitarVend;

    if vColaboradorVeic.buscarVendedor(vDadosIni.vCodUsuario) then
    begin
      if (dataSet.FieldByName('VENDEDOR_RES').AsInteger = 0) then
        dataSet.FieldByName('VENDEDOR_RES').AsInteger := vDadosIni.vCodUsuario;
    end;
    vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
    if (trim(dataSet.FieldByName('STATUS_RES').AsString) <> 'S') or (pRetirar) then
    begin
      dataSet.FieldByName('DATA_RES').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('HORA_RES').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));
    end;
    FrmReservaVeiculosCCIA.DBComboBox4.Text := dataSet.FieldByName('TIPO_RES').AsString;

    if dataSet.FieldByName('SIT_RES').AsString = 'V' then
      FrmReservaVeiculosCCIA.DBComboBox8.Text := FrmReservaVeiculosCCIA.DBComboBox8.Items[0]
    else if dataSet.FieldByName('SIT_RES').AsString = 'N' then
      FrmReservaVeiculosCCIA.DBComboBox8.Text := FrmReservaVeiculosCCIA.DBComboBox8.Items[1];

    FrmReservaVeiculosCCIA.Memo1.Clear;
    FrmReservaVeiculosCCIA.Memo1.Lines.Add('Chassi.: ' + dataSet.FieldByName('CHASSI_C').AsString);
    FrmReservaVeiculosCCIA.Memo1.Lines.Add('Modelo: ' + dataSet.FieldByName('DESCRICAO_VERSAOEST').AsString);
    FrmReservaVeiculosCCIA.Memo1.Lines.Add('Fabr...: ' + dataSet.FieldByName('ANO_FABEST').AsString);
    FrmReservaVeiculosCCIA.Memo1.Lines.Add('Mod...: ' + dataSet.FieldByName('ANO_MODEST').AsString);
    FrmReservaVeiculosCCIA.Memo1.Lines.Add('Cor....: ' + dataSet.FieldByName('COREST').AsString);

    if (trim(dataSet.FieldByName('POSICAO').AsString) = 'MORTO')
     and (trim(dataSet.FieldByName('STATUS_TRANSDEP').AsString) = 'S')
     and (dataSet.FieldByName('DATA_TRANS_RET').IsNull) then
    begin
      FrmReservaVeiculosCCIA.DBEdit3.Enabled := true;
      FrmReservaVeiculosCCIA.DBEdit6.Enabled := true;
    end
    else
    begin
      FrmReservaVeiculosCCIA.DBEdit3.Enabled := (trim(dataSet.FieldByName('POSICAO').AsString) <> 'MORTO');
      FrmReservaVeiculosCCIA.DBEdit6.Enabled := (trim(dataSet.FieldByName('POSICAO').AsString) <> 'MORTO');
    end;
    vColaboradorVeic.abreLocVendedor;
    vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
    vCondPag.abreCondPag;
    if trim(dataSet.FieldByName('NOME_RES').AsString) = '' then
      dataSet.FieldByName('NOME_RES').AsString := vClientesVeic.dataSet.FieldByName('NOME_CLIENTE').AsString;
    if trim(dataSet.FieldByName('SIT_RES').AsString) = ''  then     
      dataSet.FieldByName('SIT_RES').AsString := 'V';

    if dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
      dataSet.FieldByName('NOME_RES').AsString := vClientesVeic.dataSet.FieldByName('NOME_CLIENTE').AsString;
  except
   on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TReservaEstMotoCCIA.RenovarReserva(pTodos: boolean = false): boolean;
var
  acao, proc: string;
  vCodVendedor, vDiasReservas: Integer;
  vMensTemp, vObs: string;
  vDataBanco: TDate;
begin
  try
    Result := false;

    if dataSet.FieldByName('DATA_VENC_RES').IsNull then
    begin
      Application.MessageBox('Data de vencimento não definida, favor verificar.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    vDataBanco := vDadosIni.getDataBanco(buscas);
    vCodVendedor := dataSet.FieldByName('VENDEDOR_RES').AsInteger;

    if trim(dataSet.FieldByName('POSICAO').AsString) = 'TRANSITO' then
      vDiasReservas := StrToInt(retornaValor(' select case when trim(tipo_res) = ''C'' then ' +
       ' coalesce(DIAS_RENOV_ASS, 0) else coalesce(DIAS_RENOV, 0) end valor from tipo_reserva  ' +
       ' where tipo = ''VEI'' and tipo_res = ' + QuotedStr(Copy(trim(dataSet.FieldByName('POSICAO').AsString), 1, 1))))
    else
      vDiasReservas := StrToInt(retornaValor(' select case when trim(tipo_res) = ''C'' then ' +
       ' coalesce(DIAS_RENOV_ASS, 0) else coalesce(DIAS_RENOV, 0) end valor from tipo_reserva  ' +
       ' where tipo = ''VEI'' and sigla = ' + QuotedStr(trim(dataSet.FieldByName('TIPO_RES').AsString))));

    if vDiasReservas = 0 then
	    raiseExceptionCreate('Condição da reserva configurada para não renovar.', 'DBComboBox4');

    if not pTodos then
      if Application.MessageBox(pchar('Deseja renovar reserva deste veículo?'), 'Atenção',
         MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDNO then
         exit;

    vMensTemp := 'RESERVA RENOVADA:  ' +
     'CHASSI: ' + trim(dataSet.FieldByName('CHASSI_C').AsString) +
     ',MODELO: ' + trim(dataSet.FieldByName('DESCRICAO_VERSAOEST').AsString)  +
     ',ANO_FAB: ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
     ',ANO_MOD: ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
     ',COR: ' + trim(dataSet.FieldByName('COREST').AsString) +
     ',CLIENTE: ' + trim(dataSet.FieldByName('NOME_RES').AsString) +
     ',FONE: ' + trim(dataSet.FieldByName('FONE_RES').AsString) +
     ',COND: ' + trim(dataSet.FieldByName('TIPO_RES').AsString) +
     + vDadosIni.retornoPorCondicao(trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) <> '',
      ',GRUPO/COTA/RD: ' + trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString), '') +
     + vDadosIni.retornoPorCondicao(dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime > 0,
      ',ASSEMBLEIA: ' + trim(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime)), '') +
     ',USUARIO RENOVOU: ' + trim(vDadosIni.vNomeUsuario) +
     ',DATA VENC ANT: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VENC_RES').AsDateTime) +
     ',DATA VENC ATUAL: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VENC_RES').AsDateTime + vDiasReservas);

    if (dataSet.FieldByName('VENDEDOR_RES').AsInteger > 0)  and (trim(vTipoRes) <> 'M')
      and (dataSet.FieldByName('VENDEDOR_RES').AsInteger <> vDadosIni.vCodUsuario) then
    begin
      if not vDadosIni.PesqPros('VEI153', 'RENOVAR', dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO',
       dataSet.FieldByName('CODIGO').AsString, buscas, true) then
        exit;
    end;

    if trim(dataSet.FieldByName('STATUS_RENOV_RES').AsString) = 'S' then
       if not vDadosIni.PesqPros('VEI160', 'RENOVAR VEIC', dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO',
         dataSet.FieldByName('CODIGO').AsString, buscas, true) then
          exit;

    if not (InputQuery('Renovar reserva', 'Informe o motivo da renovação da reserva.', vObs)) then
      exit;

    if trim(vObs) = '' then
      raiseExceptionCreate('Favor informar o motivo da renovação da reserva.', 'DBMemo1');

    if dataSet.State <> dsEdit then
      dataSet.Edit;

    if (trim(vTipoRes) = 'B') then
      proc := 'VEI150'
    else if (trim(vTipoRes) = 'C') then
      proc := 'VEI151'
    else
      proc := 'VEI149';
    if not (dataSet.State in [dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR';

    dataSet.FieldByName('STATUS_RENOV_RES').AsString := 'S';
    dataSet.FieldByName('QTDE_RENOV_RES').AsInteger := dataSet.FieldByName('QTDE_RENOV_RES').AsInteger + 1;
    if vDataBanco > dataSet.FieldByName('DATA_VENC_RES').AsDateTime then
      dataSet.FieldByName('DATA_VENC_RES').AsDateTime := vDataBanco + vDiasReservas
    else
      dataSet.FieldByName('DATA_VENC_RES').AsDateTime := dataSet.FieldByName('DATA_VENC_RES').AsDateTime + vDiasReservas;
    if trim(dataSet.FieldByName('OBS_RES').AsString) = '' then
      dataSet.FieldByName('OBS_RES').AsString := trim(vObs)
    else
      dataSet.FieldByName('OBS_RES').AsString := trim(dataSet.FieldByName('OBS_RES').AsString) + '; ' + trim(vObs);
    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if result then
      result := apply;

    SalvarFilaRes(dataSet.FieldByName('DATA_VENC_RES').AsDateTime, dataSet.FieldByName('HORA_VENC_RES').AsString);

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria(proc, 'RENOVAR', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria(proc, 'RENOVAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);

    if (result) and (trim(vTipoRes) <> 'M') then
    begin
      vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, 'RESERVA RENOVADA', vMensTemp, vCodVendedor);
      CommitaTransacao;
    end;
    
    if Result then
       Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TReservaEstMotoCCIA.RetirarReserva(pTodos: boolean = false; pMensagem: string = ''): boolean;
var
  acao, proc: string;
  vCodVendedor: Integer;
  vMensTemp, codVeic, Chassi, vPrev, vDemonstracao, vStatusUso: string;
  vDataVenc: TDateTime;
  vHoraVenc: string;
begin
  try
    Result := false;
    vCodVendedor := dataSet.FieldByName('VENDEDOR_RES').AsInteger;
    vDemonstracao := trim(dataSet.FieldByName('STATUS_DEMONST').AsString);
    codVeic := dataSet.FieldByName('CODIGO').AsString;
    Chassi := dataSet.FieldByName('CHASSI_C').AsString;
    vStatusUso := dataSet.FieldByName('STATUS_USO').AsString;
    vMensTemp := 'RESERVA' + pMensagem + ' RETIRADA : ' +
     'CHASSI: ' + trim(dataSet.FieldByName('CHASSI_C').AsString) +
     ',MODELO: ' + trim(dataSet.FieldByName('DESCRICAO_VERSAOEST').AsString)  +
     ',ANO_FAB: ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
     ',ANO_MOD: ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
     ',COR: ' + trim(dataSet.FieldByName('COREST').AsString) +
     ',CLIENTE: ' + trim(dataSet.FieldByName('NOME_RES').AsString) +
     ',FONE: ' + trim(dataSet.FieldByName('FONE_RES').AsString) +
     ',COND: ' + trim(dataSet.FieldByName('TIPO_RES').AsString) +
     + vDadosIni.retornoPorCondicao(trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) <> '',
      ',GRUPO/COTA/RD: ' + trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString), '') +
     + vDadosIni.retornoPorCondicao(dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime > 0,
      ',ASSEMBLEIA: ' + trim(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime)), '') +
     ',USUARIO QUE RETIROU: ' + trim(vDadosIni.vNomeUsuario);
   vPrev := retornaValor(' select first 1 f.prev_cheg valor from fila_reserva_veic f ' +
     ' where f.cod_modelo = ' + IntToStr(dataSet.FieldByName('VERSAOEST').AsInteger) +
     ' and f.ano_fab = ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
     ' and f.ano_mod = ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
     ' and f.cod_cor = ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
     ' and coalesce(f.status_res, ''N'') = ''N'' ' +
     ' and f.cod_empresa = ' +vDadosIni.codEmpresa + ' and f.ativo = 1 ' +
     ' order by f.ordem desc ');

    if (not ptodos) and (dataSet.FieldByName('VENDEDOR_RES').AsInteger > 0) and (trim(vTipoRes) <> 'M')
      and (dataSet.FieldByName('VENDEDOR_RES').AsInteger <> vDadosIni.vCodUsuario) then
    begin
      if not vDadosIni.PesqPros('VEI152', 'RETIRAR', dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO',
       dataSet.FieldByName('CODIGO').AsString, buscas, true) then
        exit;
    end;

    if dataSet.State <> dsEdit then
      dataSet.Edit;

    if (trim(vTipoRes) = 'B') then
      proc := 'VEI131'
    else if (trim(vTipoRes) = 'C') then
      proc := 'VEI133'
    else
      proc := 'VEI064';
    if not (dataSet.State in [dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR';

    if not pTodos then     
      if Application.MessageBox(pchar('Deseja retirar este veículo da reserva?'), 'Atenção',
        MB_ICONQUESTION + MB_YESNO) = IDNO then
        exit;

    vDataVenc := vDadosIni.getDataBanco(buscas); //dataSet.FieldByName('DATA_VENC_RES').AsDateTime;
    vHoraVenc := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));//dataSet.FieldByName('HORA_VENC_RES').AsString;

    if trim(dataSet.FieldByName('POSICAO').AsString) <> 'MORTO' then
      dataSet.FieldByName('COD_CLIENTE').Value := Null;
    dataSet.FieldByName('NOME_RES').Value := Null;
    dataSet.FieldByName('VENDEDOR_RES').Value := Null;
    dataSet.FieldByName('SIT_RES').Value := Null;
    dataSet.FieldByName('TIPO_RES').Value := Null;
    dataSet.FieldByName('HORA_RES').Value := Null;
    dataSet.FieldByName('DATA_RES').Value := Null;
    dataSet.FieldByName('HORA_VENC_RES').Value := Null;
    dataSet.FieldByName('DATA_VENC_RES').Value := Null;
    dataSet.FieldByName('STATUS_RES').AsString := 'N';
    dataSet.FieldByName('OBS_RES').Value := Null;
    dataSet.FieldByName('FONE_RES').Value := Null;
    dataSet.FieldByName('COD_EMP_RESERVA').Value := Null;
    dataSet.FieldByName('GRUPO_COTA_RD').Value := Null;
    dataSet.FieldByName('DATA_ASSEMBLEIA').Value := Null;
    dataSet.FieldByName('STATUS_RENOV_RES').Value := Null;
    dataSet.FieldByName('QTDE_RENOV_RES').Value := Null;
    dataSet.FieldByName('TIPO_RES_OLD').Value := Null;
    dataSet.FieldByName('DATA_RES_OLD').Value := Null;
    dataSet.FieldByName('HORA_RES_OLD').Value := Null;
    dataSet.FieldByName('GRUPO_COTA_RD_OLD').Value := Null;
    dataSet.FieldByName('DATA_ASSEMBLEIA_OLD').Value := Null;
    dataSet.FieldByName('DATA_VENC_RES_OLD').Value := Null;
    dataSet.FieldByName('HORA_VENC_RES_OLD').Value := Null;
    SalvarFilaRes(vDataVenc, vHoraVenc,true);
    dataSet.FieldByName('COD_FILA_RES').Value := Null;

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if result then
      result := apply;

    if (result) and (trim(vDemonstracao) <> 'S') and (trim(vStatusUso) <> 'U') then
    begin
      vDadosIni.vReordenarFila := 'S'; 
      vDadosIni.AtualizarFilaReserva(buscas, DtmVeiculosCCIA.SpIncCodigoV, StrToInt(codVeic), trim(Chassi), true, false, vPrev);
    end;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria(proc, 'RETIRAR', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria(proc, 'RETIRAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);

    if (result) and (trim(vTipoRes) <> 'M') then
    begin
      vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, 'RESERVA RETIRADA', vMensTemp, vCodVendedor);
      CommitaTransacao;
    end;

    if not pTodos then
     if Result then
       Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TReservaEstMotoCCIA.SalvarFilaRes(pDataVenc: TDateTime; pHoraVenc: string; pRetirar: boolean = False): boolean;
var
 buscas2: TIBQuery;
begin
  try
    Result := True;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas2.Close;
    buscas2.SQL.Text := ' SELECT * FROM FILA_RESERVA_VEIC ' +
     ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
    buscas2.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('COD_FILA_RES').AsInteger;
    buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;

    if pRetirar then
    begin
      if buscas2.IsEmpty then
       exit;

      buscas.Close;
      buscas.SQL.Text := ' UPDATE FILA_RESERVA_VEIC SET ATIVO = 0, DATA_VENC_RES = :DATA_VENC_RES, HORA_VENC_RES = :HORA_VENC_RES ' +
       ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA; ';
      buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('COD_FILA_RES').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ParamByName('DATA_VENC_RES').Value := pDataVenc;
      buscas.ParamByName('HORA_VENC_RES').AsString := pHoraVenc;
      buscas.ExecSQL;

      exit;
    end;

    if buscas2.IsEmpty then
    begin
      buscas.Close;
      buscas.SQL.Text := ' INSERT INTO FILA_RESERVA_VEIC (CODIGO, COD_EMPRESA, COD_MODELO, ' +
       ' ANO_FAB, ANO_MOD, ORDEM, COD_COR, COD_VENDEDOR, COD_CLIENTE, NOME_RES, FONE_RES, ' +
       ' DATA_RES, HORA_RES, STATUS_RES, OBS_RES, TIPO_RES, SIT_RES, ' +
       ' STATUS_AVARIAS, OBS_ITEMEST, GRUPO_COTA_RD, COD_ESTMOTO, CHASSI_C, ' +
       ' DATA_ASSEMBLEIA, US_CAD, DATA_CAD, HORA_CAD, ' +
       ' US_EDIT, DATA_EDIT, HORA_EDIT, DATA_VENC_RES, HORA_VENC_RES) ' +
       ' VALUES ' +
       ' (:CODIGO, :COD_EMPRESA, :COD_MODELO, ' +
       ' :ANO_FAB, :ANO_MOD, :ORDEM, :COD_COR, :COD_VENDEDOR, :COD_CLIENTE, :NOME_RES, :FONE_RES, ' +
       ' :DATA_RES, :HORA_RES, :STATUS_RES, :OBS_RES, :TIPO_RES, :SIT_RES, ' +
       ' :STATUS_AVARIAS, :OBS_ITEMEST, :GRUPO_COTA_RD, :COD_ESTMOTO, :CHASSI_C, ' +
       ' :DATA_ASSEMBLEIA, :US_CAD, :DATA_CAD, :HORA_CAD, ' +
       ' :US_EDIT, :DATA_EDIT, :HORA_EDIT, :DATA_VENC_RES, :HORA_VENC_RES);';
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := ' UPDATE FILA_RESERVA_VEIC SET ' +
       ' COD_MODELO = :COD_MODELO, ANO_FAB = :ANO_FAB, ANO_MOD = :ANO_MOD, ' +
       ' ORDEM = :ORDEM, COD_COR = :COD_COR, COD_VENDEDOR = :COD_VENDEDOR, ' +
       ' COD_CLIENTE = :COD_CLIENTE, NOME_RES = :NOME_RES, FONE_RES = :FONE_RES, ' +
       ' DATA_RES = :DATA_RES, HORA_RES = :HORA_RES, ' +
       ' STATUS_RES = :STATUS_RES, OBS_RES = :OBS_RES, TIPO_RES = :TIPO_RES, ' +
       ' SIT_RES = :SIT_RES, STATUS_AVARIAS = :STATUS_AVARIAS, OBS_ITEMEST = :OBS_ITEMEST, ' +
       ' GRUPO_COTA_RD = :GRUPO_COTA_RD, CHASSI_C = :CHASSI_C, COD_ESTMOTO = :COD_ESTMOTO, ' +
       ' DATA_ASSEMBLEIA = :DATA_ASSEMBLEIA, US_CAD = :US_CAD, DATA_CAD = :DATA_CAD, HORA_CAD = :HORA_CAD, ' +
       ' US_EDIT = :US_EDIT, DATA_EDIT = :DATA_EDIT, HORA_EDIT = :HORA_EDIT, ' +
       ' DATA_VENC_RES = :DATA_VENC_RES, HORA_VENC_RES = :HORA_VENC_RES ' +
       ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA; ';
    end;
    buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('COD_FILA_RES').AsInteger;
    if not buscas2.IsEmpty then
      buscas.ParamByName('ORDEM').AsInteger := buscas2.FieldByName('ORDEM').AsInteger
    else
      buscas.ParamByName('ORDEM').AsInteger := Gencodigo('FILA_RESERVA_VEIC_ORDEM', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('COD_MODELO').AsInteger := dataSet.FieldByName('VERSAOEST').AsInteger;
    buscas.ParamByName('ANO_FAB').AsInteger := dataSet.FieldByName('ANO_FABEST').AsInteger;
    buscas.ParamByName('ANO_MOD').AsInteger := dataSet.FieldByName('ANO_MODEST').AsInteger;
    buscas.ParamByName('COD_COR').AsInteger := dataSet.FieldByName('COD_COR').AsInteger;
    buscas.ParamByName('COD_VENDEDOR').AsInteger := dataSet.FieldByName('VENDEDOR_RES').AsInteger;
    buscas.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('COD_CLIENTE').AsInteger;
    buscas.ParamByName('NOME_RES').AsString := dataSet.FieldByName('NOME_RES').AsString;
    buscas.ParamByName('FONE_RES').AsString := dataSet.FieldByName('FONE_RES').AsString;
    buscas.ParamByName('DATA_RES').Value := dataSet.FieldByName('DATA_RES').Value;
    buscas.ParamByName('HORA_RES').AsString := dataSet.FieldByName('HORA_RES').AsString;
    buscas.ParamByName('STATUS_RES').AsString := 'S';
    buscas.ParamByName('OBS_RES').AsString := dataSet.FieldByName('OBS_RES').AsString;
    buscas.ParamByName('TIPO_RES').AsString := dataSet.FieldByName('TIPO_RES').AsString;
    buscas.ParamByName('SIT_RES').AsString := dataSet.FieldByName('SIT_RES').AsString;
    buscas.ParamByName('STATUS_AVARIAS').AsString := dataSet.FieldByName('STATUS_AVARIAS').AsString;
    buscas.ParamByName('OBS_ITEMEST').AsString := dataSet.FieldByName('OBS_ITEMEST').AsString;
    buscas.ParamByName('DATA_ASSEMBLEIA').Value := dataSet.FieldByName('DATA_ASSEMBLEIA').Value;
    buscas.ParamByName('US_CAD').AsInteger := dataSet.FieldByName('US_CAD').AsInteger;
    buscas.ParamByName('DATA_CAD').Value := dataSet.FieldByName('DATA_CAD').Value;
    buscas.ParamByName('HORA_CAD').AsString := dataSet.FieldByName('HORA_CAD').AsString;
    buscas.ParamByName('US_EDIT').AsInteger := dataSet.FieldByName('VENDEDOR_RES').AsInteger;
    buscas.ParamByName('DATA_EDIT').Value := dataSet.FieldByName('DATA_RES').Value;
    buscas.ParamByName('HORA_EDIT').AsString := dataSet.FieldByName('HORA_RES').AsString;
    buscas.ParamByName('DATA_VENC_RES').AsDateTime := pDataVenc;
    buscas.ParamByName('HORA_VENC_RES').AsString := pHoraVenc;

    buscas.ParamByName('GRUPO_COTA_RD').AsString := dataSet.FieldByName('GRUPO_COTA_RD').AsString;
    buscas.ParamByName('COD_ESTMOTO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
    buscas.ParamByName('CHASSI_C').AsString := dataSet.FieldByName('CHASSI_C').AsString;
    buscas.ExecSQL;
 except
   on e: exception do
   begin
     Result := false;
     Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
     registraErro(e.Message);
   end;
 end;
end;

function TReservaEstMotoCCIA.SalvarReserva: boolean;
var
  acao, vMensTemp: string;
  vCodVendedor: Integer;
  vNomeVendedor: string;
  vMensagem, vCampo, vTipoResNovo: string;
begin
  try
    Result := false;
    vTipoResNovo := retornaValor(' select tipo_res as valor from tipo_reserva res ' +
      ' where res.tipo = ''VEI'' and res.sigla = ' + QuotedStr(trim(dataSet.FieldByName('TIPO_RES').AsString)));

    vCodVendedor := dataSet.FieldByName('VENDEDOR_RES').AsInteger;
    vNomeVendedor := retornaValor('SELECT NOME_VENDEDOR AS VALOR FROM COLABORADOR ' +
      ' WHERE COD_VENDEDOR = ' + IntToStr(vCodVendedor) + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND ATIVO = 1');
    vMensTemp := 'VENDEDOR NA FILA DE RESERVA ALTERADO:  ' +
      'CHASSI: ' + trim(dataSet.FieldByName('CHASSI_C').AsString) +
      ',MODELO: ' + trim(dataSet.FieldByName('DESCRICAO_VERSAOEST').AsString)  +
      ',ANO_FAB: ' + IntToStr(dataSet.FieldByName('ANO_FABEST').AsInteger) +
      ',ANO_MOD: ' + IntToStr(dataSet.FieldByName('ANO_MODEST').AsInteger) +
      ',COR: ' + trim(dataSet.FieldByName('COREST').AsString) +
      ',CLIENTE: ' + trim(dataSet.FieldByName('NOME_RES').AsString) +
      ',FONE: ' + trim(dataSet.FieldByName('FONE_RES').AsString) +
      ',COND: ' + trim(dataSet.FieldByName('TIPO_RES').AsString) +
      + vDadosIni.retornoPorCondicao(trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) <> '',
       ',GRUPO/COTA/RD: ' + trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString), '') +
      + vDadosIni.retornoPorCondicao(dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime > 0,
       ',ASSEMBLEIA: ' + trim(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime)), '') +
      ',USUARIO QUE ALTEROU: ' + trim(vDadosIni.vNomeUsuario) +
      ',VENDEDOR ANTERIOR: ' + Trim(vNomeVendedorOld) +
      ',VENDEDOR ATUAL: ' + Trim(vNomeVendedor);

    if not (dataSet.State in [dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR';

    if dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
      if not vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger) then
        raiseExceptionCreate('Cliente não encontrado!', 'DBEdit3');

    if trim(dataSet.FieldByName('NOME_RES').AsString) = '' then
      raiseExceptionCreate('Nome do Cliente não informado!', 'DBEdit6');

    if dataSet.FieldByName('VENDEDOR_RES').AsInteger <= 0 then
      raiseExceptionCreate('Vendedor não informado!', 'DBEdit1');

    if dataSet.FieldByName('VENDEDOR_RES').AsInteger > 0 then
      if not vColaboradorVeic.buscarVendedor(dataSet.FieldByName('VENDEDOR_RES').AsInteger) then
        raiseExceptionCreate('Vendedor não encontrado!', 'DBEdit1');

    if trim(dataSet.FieldByName('FONE_RES').AsString) = '' then
    begin
      vDadosIni.vInibeMensPesqPros := 'S';
      if not vDadosIni.PesqPros('VEI155', 'TESTAR', '', 'EST_MOTO', '', buscas, true) then
        raiseExceptionCreate('Telefone não informado!', 'DBEdit7');
    end;

    if trim(dataSet.FieldByName('TIPO_RES').AsString) = '' then
      raiseExceptionCreate('Condição da reserva não informada!', 'DBComboBox4');

    if not verificatiporeserva(2, FrmReservaVeiculosCCIA.DBComboBox4, 'VEI', trim(dataSet.FieldByName('TIPO_RES').AsString)) then
      raiseExceptionCreate('Condição da reserva é inválida!', 'DBComboBox4');

    if trim(dataSet.FieldByName('SIT_RES').AsString) = '' then
      raiseExceptionCreate('Situação da reserva não informada!', 'DBComboBox8');

    if (trim(dataSet.FieldByName('SIT_RES').AsString) <> 'N')
     and (trim(dataSet.FieldByName('SIT_RES').AsString) <> 'V') then
       raiseExceptionCreate('Situação da reserva incorreto!', 'DBComboBox8');

    if not verificarConsorcio then
      raiseExceptionCreate('Grupo/Cota/RD não informado!', 'DBEdit8');

    if not verficarDataAssembleia then
      raiseExceptionCreate('Data da assembleia não informado!', 'DBEdit5');

//    if dataSet.FieldByName('DATA_VENC_RES').AsDateTime > 0 then
//      if vDadosIni.getDataBanco(buscas) > dataSet.FieldByName('DATA_VENC_RES').AsDateTime  then
//        raiseExceptionCreate('Data limite da reserva ultrapassada, favor verificar!', 'DBEdit2');

    if not verificarReserva(vMensagem, vCampo) then
      raiseExceptionCreate(vMensagem, vCampo);

    if (trim(vTipoResNovo) <> 'M') then
    begin
      dataSet.FieldByName('TIPO_RES_OLD').Value := Null;
      dataSet.FieldByName('DATA_RES_OLD').Value := Null;
      dataSet.FieldByName('HORA_RES_OLD').Value := Null;
      dataSet.FieldByName('GRUPO_COTA_RD_OLD').Value := Null;
      dataSet.FieldByName('DATA_ASSEMBLEIA_OLD').Value := Null;
      dataSet.FieldByName('DATA_VENC_RES_OLD').Value := Null;
      dataSet.FieldByName('HORA_VENC_RES_OLD').Value := Null;
    end;
    if trim(vTipoResNovo) = 'M' then
    begin
      if trim(dataSet.FieldByName('TIPO_RES_OLD').AsString) = '' then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if not vDadosIni.PesqPros('VEI167', 'PERMITIR', '', 'EST_MOTO', '', buscas, false) then
        	raiseExceptionCreate('Condição da primeira reserva não deve ser ' + QuotedStr(trim(dataSet.FieldByName('TIPO_RES').AsString)) +' !', 'DBComboBox4');
      end;
    end;
    dataSet.FieldByName('STATUS_RES').AsString := 'S';
    dataSet.FieldByName('COD_EMP_RESERVA').AsString := vDadosIni.codEmpresa;
    if dataSet.FieldByName('COD_FILA_RES').AsInteger  <= 0 then
      dataSet.FieldByName('COD_FILA_RES').AsInteger := Gencodigo('FILA_RESERVA_VEIC', DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;      
      exit;
    end;

    if result then
      result := apply;

    SalvarFilaRes(dataSet.FieldByName('DATA_VENC_RES').AsDateTime, dataSet.FieldByName('HORA_VENC_RES').AsString);

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI063', 'RESERVAR', 'SUCESSO - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString + ' TIPO RES ' + trim(dataSet.FieldByName('TIPO_RES').AsString), 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI063', 'RESERVAR', 'FALHA - CHASSI ' + dataSet.FieldByName('CHASSI_C').AsString + ' TIPO RES ' + trim(dataSet.FieldByName('TIPO_RES').AsString), 'EST_MOTO', dataSet.FieldByName('CODIGO').AsString, buscas);

    if (vCodVendedorOld > 0) and (vCodVendedorOld <> vCodVendedor) and (trim(vTipoRes) <> 'M') then
    begin
      vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, 'RESERVA ALTERADA', vMensTemp, vCodVendedorOld);
      vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, 'RESERVA ALTERADA', vMensTemp, vCodVendedor);
      CommitaTransacao;
    end;
    
    if Result then
      Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TReservaEstMotoCCIA.verficarDataAssembleia: boolean;
begin
  Result := False;

  buscas.close;
  buscas.sql.text := 'select * from tipo_reserva where tipo = ''VEI'' and sigla = :sigla';
  buscas.ParamByName('SIGLA').AsString := dataSet.FieldByName('TIPO_RES').AsString;
  buscas.open;

  if buscas.IsEmpty then
  begin
    Result := True;
    exit;
  end;

  if (trim(buscas.FieldByName('TIPO_RES').AsString) = 'C') then
  begin
     if ((trim(dataSet.FieldByName('DATA_ASSEMBLEIA').AsString) = '') or
     	(trim(dataSet.FieldByName('DATA_ASSEMBLEIA').AsString) = '  /  /    '))  then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
	      if not vDadosIni.PesqPros('VEI166', 'TESTAR', '', 'EST_MOTO', '', buscas, true) then
        	exit;
      end;
  end
  else if trim(buscas.FieldByName('TIPO_RES').AsString) <> 'C' then
    dataSet.FieldByName('DATA_ASSEMBLEIA').Value := Null;

   Result := True;
end;

function TReservaEstMotoCCIA.verificarConsorcio: boolean;
begin
  Result := False;

  buscas.close;
  buscas.sql.text := 'select * from tipo_reserva where tipo = ''VEI'' and sigla = :sigla';
  buscas.ParamByName('SIGLA').AsString := dataSet.FieldByName('TIPO_RES').AsString;
  buscas.open;

  if buscas.IsEmpty then
  begin
    Result := True;
    exit;
  end;

  if (trim(buscas.FieldByName('TIPO_RES').AsString) = 'C') and
    ((trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) = '') or
     (trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) = '/   /'))  then
      exit;
  if trim(buscas.FieldByName('TIPO_RES').AsString) <> 'C' then
    dataSet.FieldByName('GRUPO_COTA_RD').Value := Null;

   Result := True;
end;

function TReservaEstMotoCCIA.verificarRegistro(pExibirMens: boolean = true): boolean;
var
  vCodigo: Integer;
begin
  Result := True;

  vCodigo := dataSet.FieldByName('CODIGO').AsInteger;
  try
    dataSet.RefreshRecord;
    if vCodigo <> dataSet.FieldByName('CODIGO').AsInteger then
    begin
      Result := False;
      Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão Procurar e verifique',
        'Atenção', 0 + 64);
      Exit;
    end;

  except on E: Exception do
    begin
      if Pos('changed by another user', e.Message) > 0 then
      begin
        Result := False;
        if pExibirMens then
          Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
           'Atenção', 0 + 64);
        Exit;
      end;
    end;
  end;
end;

function TReservaEstMotoCCIA.verificarRegistro(pDataset: TClientDataSet;
  pExibirMens: boolean): boolean;
var
 vCodigo: Integer;
begin
  Result := True;

  vCodigo := pDataset.FieldByName('CODIGO').AsInteger;
  try
    pDataset.RefreshRecord;
    if vCodigo <> pDataset.FieldByName('CODIGO').AsInteger then
    begin
      Result := False;
      Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão Procurar e verifique',
        'Atenção', 0 + 64);
      Exit;
    end;

  except on E: Exception do
    begin
      if Pos('changed by another user', e.Message) > 0 then
      begin
        Result := False;
        if pExibirMens then
          Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
           'Atenção', 0 + 64);
        Exit;
      end;
    end;
  end;
end;

function TReservaEstMotoCCIA.verificarReserva(var pMensagem, pCampo: string): boolean;
var
 vMensTemp: string;
 vQtdeDiasAposRes: Integer;
 vDataBanco, vDataVenc: TDateTime;
begin
 try
   Result := False;

   vDataBanco := vDadosIni.getDataBanco(buscas);

   if trim(dataSet.FieldByName('STATUS_RES').AsString) = 'S' then
   begin
    Result := true;
    exit;
   end;

   buscas.Close;
   buscas.SQL.Text := 'select tipo_res from tipo_reserva ' +
     ' where tipo = ''VEI'' and sigla = :sigla';
   buscas.ParamByName('SIGLA').AsString := trim(dataSet.FieldByName('TIPO_RES').AsString);
   buscas.Open;

   if not buscas.IsEmpty then
     if trim(buscas.FieldByName('TIPO_RES').AsString) = 'M' then
     begin
       Result := True;
       exit;
     end;

   if dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
   begin
     buscas.Close;
     buscas.SQL.Text := ' select first 1 f.codigo, f.tipo_res, ' +
      ' f.data_res, f.hora_res, f.data_venc_res, f.hora_venc_res, res.dias_reserv_apos_venc from fila_reserva_veic f ' +
      ' inner join tipo_reserva res on res.tipo = ''VEI'' and res.sigla = f.tipo_res ' +
      ' where f.cod_estmoto = :cod_estmoto and f.chassi_c = :chassi_c ' +
      ' and f.cod_vendedor = :cod_vendedor and f.cod_empresa = :cod_empresa and res.tipo_res <> ''M'' ' +
      ' order by f.codigo desc ';
     buscas.ParamByName('COD_ESTMOTO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
     buscas.ParamByName('CHASSI_C').AsString := dataSet.FieldByName('CHASSI_C').AsString;
     buscas.ParamByName('COD_VENDEDOR').AsInteger := dataSet.FieldByName('VENDEDOR_RES').AsInteger;
     buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.Open;

     if not buscas.IsEmpty then
     begin
       vDataVenc := buscas.FieldByName('DATA_VENC_RES').AsDateTime;
       vQtdeDiasAposRes := buscas.FieldByName('DIAS_RESERV_APOS_VENC').AsInteger;
       if (vDataBanco = buscas.FieldByName('DATA_RES').AsDateTime)
        or (vDataBanco <= vDataVenc + vQtdeDiasAposRes) then
       begin
         vMensTemp := 'VEÍCULO RESERVADO PARA ESSE VENDEDOR:  ' + #13 +
            'CHASSI: ' + trim(dataSet.FieldByName('CHASSI_C').AsString) + #13 +
            ',VENDEDOR: ' + trim(vColaboradorVeic.dataSet.FieldByName('NOME_VENDEDOR').AsString);
         Result := vDadosIni.PesqPros('VEI146', 'RESERVA', vMensTemp, 'EST_MOTO', '', buscas, true);
         if not Result then
         begin
           pMensagem := 'Veículo reservado para esse vendedor anteriormente: ' + #13 +
            'Chassi: ' + trim(dataSet.FieldByName('CHASSI_C').AsString) + #13 +
            'Vendedor: ' + trim(vColaboradorVeic.dataSet.FieldByName('NOME_VENDEDOR').AsString) + #13 + #13 +
            'Favor aguardar até o dia ' + FormatDateTime('dd/mm/yyyy', vDataVenc + vQtdeDiasAposRes + 1) + ' para realizar a reserva!';
           pCampo := 'DBEdit1';
           exit;
         end;
       end;
     end;
   end;

   if dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
   begin
     buscas.Close;
     buscas.SQL.Text := ' select first 1 f.codigo, f.tipo_res, ' +
      ' f.data_res, f.hora_res, f.data_venc_res, f.hora_venc_res, res.dias_reserv_apos_venc from fila_reserva_veic f ' +
      ' inner join tipo_reserva res on res.tipo = ''VEI'' and res.sigla = f.tipo_res ' +
      ' where f.cod_estmoto = :cod_estmoto and f.chassi_c = :chassi_c ' +
      ' and f.cod_cliente = :cod_cliente and f.cod_empresa = :cod_empresa and res.tipo_res <> ''M'' ' +
      ' order by f.codigo desc ';
     buscas.ParamByName('COD_ESTMOTO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
     buscas.ParamByName('CHASSI_C').AsString := dataSet.FieldByName('CHASSI_C').AsString;
     buscas.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('COD_CLIENTE').AsInteger;
     buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.Open;

     if not buscas.IsEmpty then
     begin
       vDataVenc := buscas.FieldByName('DATA_VENC_RES').AsDateTime;
       vQtdeDiasAposRes := buscas.FieldByName('DIAS_RESERV_APOS_VENC').AsInteger;
       if (vDataBanco = buscas.FieldByName('DATA_RES').AsDateTime)
	      or (vDataBanco <= vDataVenc + vQtdeDiasAposRes) then
       begin
         vMensTemp := 'VEÍCULO RESERVADO PARA ESSE CLIENTE: ' + #13 +
           'CHASSI: ' + trim(dataSet.FieldByName('CHASSI_C').AsString) + #13 +
           ',CLIENTE: ' + trim(dataSet.FieldByName('NOME_RES').AsString);
         Result := vDadosIni.PesqPros('VEI147', 'RESERVA', vMensTemp, 'EST_MOTO', '', buscas, true);
         if not Result then
         begin
           pMensagem := 'Veículo reservado para esse cliente anteriormente: ' + #13 +
	           'Chassi: ' + trim(dataSet.FieldByName('CHASSI_C').AsString) + #13 +
             'Cliente: ' + trim(dataSet.FieldByName('NOME_RES').AsString) + #13 + #13 +
             'Favor aguardar até o dia ' + FormatDateTime('dd/mm/yyyy', vDataVenc + vQtdeDiasAposRes + 1) + ' para realizar a reserva!';
           pCampo := 'DBEdit3';
           exit;
         end;
       end;
     end;
   end;
   Result := true;
 except
   Result := False;
 end;
end;

function TReservaEstMotoCCIA.verificarReservaExiste: boolean;
var
 vReserva: string;
begin
 vReserva := retornaValor(' select trim(coalesce(status_res, ''N'')) as valor from est_moto  ' +
  ' where codigo = ' + IntToStr(dataSet.FieldByName('CODIGO').AsInteger) +
  ' and chassi_c = ' + QuotedStr(dataSet.FieldByName('CHASSI_C').AsString) +
  ' and cod_empresa = ' + vDadosIni.codEmpresa);

 Result := trim(vReserva) = 'S';
 if not Result then
   Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique', 'Atenção', 0 + 64);
end;

function TReservaEstMotoCCIA.verificatiporeserva(vtop: integer;
  vcomb: TDbCombobox; vtipo, vtpescol: string): boolean;
begin
  result := false;
  if vtop = 1 then
  begin
    buscas.close;
    buscas.sql.text := 'select * from tipo_reserva where tipo = ''VEI'' and ativo = 1 ' +
     ' and tipo_res in (''V'', ''C'', ''B'', ''M'') ' +
	   ' order by ordemexibicao, codigo';
    buscas.open;
    vcomb.Items.Clear;
    while not buscas.eof do
    begin
      vcomb.Items.Add(buscas.FieldByName('SIGLA').AsString);
      buscas.next;
    end;
    Result := true;
  end;

  if vtop = 2 then
  begin
    try
      buscas.close;
      buscas.sql.text := 'select * from tipo_reserva where tipo = ''VEI'' and ativo = 1 and sigla = ' + QuotedStr(vtpescol);
      buscas.open;
      if buscas.isempty then
        Result := False
      else
        Result := true;
    except
      on e: exception do
      begin
        Result := false;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  end;
end;

procedure TReservaEstMotoCCIA._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  if not (dataSet.State in [dsEdit]) then
    dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TReservaEstMotoCCIA._marcarDemarcarTodos(pTipo: Integer = 0);
begin
	if not dataSet.Active then
    Exit;

  if dataSet.IsEmpty then
    exit;
  try
  	if pTipo = 0 then
    	vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros')
    else
    	vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if not (dataSet.State in [dsEdit]) then
        dataSet.Edit;
      if pTipo = 0 then
        dataSet.FieldByName('SEL').AsString := 'S'
      else
        dataSet.FieldByName('SEL').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TReservaEstMotoCCIA._mdiAberto(pNomeFormMDI,
  pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

{ TNFTransito }

function TNFTransito.abreFormItensNFTransito: boolean;
var
  formulario: TfrmPadrao;
begin
 try
   formulario := TfrmPadrao.Create(Application);
   formulario.Width := 505;
   formulario.Height := 168;
   formulario.Position := poScreenCenter;
   formulario.Caption := 'Chassis das Notas';
   frmEstMotosCCIA.PnEstoque.Parent := formulario;
   formulario.AutoSize := True;
   formulario.AutoScroll := False;
   formulario.ShowHint := true;
   formulario.BorderIcons := [];
   Result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      formulario.Free;
      formulario := nil;
    end;
  end;
end;

function TNFTransito.abreNFTransito: boolean;
begin
  Result := montaSelect(' SELECT FIRST 1 * FROM NF_TRANSITO ' +
   ' WHERE NUM_NOTAT = 0 AND COD_EMPRESA = 0 ');
end;

function TNFTransito.CancelarNFT: boolean;
begin
   try
    Result := false;

   if not vDadosIni.PesqPros('VEI108', 'CANCELAR', '', 'NF_TRANSITO',
      '', buscas, true) then
      Exit;

   if Application.MessageBox('Deseja marca como "CANCELADA" Nota Fiscal em Trânsito',
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
     exit;

    if not (dataSet.State in [dsInsert, dsEdit]) then
      dataSet.Edit;
    dataset.FieldByName('STATUST').AsString := 'CANCELADA';
    dataSet.Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI108', 'CANCELAR', 'SUCESSO', 'NF_TRANSITO', dataSet.FieldByName('NUM_NOTAT').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI108', 'CANCELAR', 'FALHA', 'NF_TRANSITO', dataSet.FieldByName('NUM_NOTAT').AsString, buscas);
    if Result then
      Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TNFTransito.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  dataSet := TClientDataSet(DtmVeiculosCCIA.cdsNFTransito);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TNFTransito.LimparNFT: boolean;
begin
  try
    Result := false;

   if not vDadosIni.PesqPros('VEI107', 'LIMPAR', '', 'NF_TRANSITO',
      '', buscas, true) then
      Exit;

   if Application.MessageBox('Deseja Limpar Status Nota Fiscal em Trânsito',
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
     exit;

    if not (dataSet.State in [dsInsert, dsEdit]) then
      dataSet.Edit;
    dataset.FieldByName('STATUST').Value := Null;
    dataSet.Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI107', 'LIMPAR', 'SUCESSO', 'NF_TRANSITO', dataSet.FieldByName('NUM_NOTAT').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI107', 'LIMPAR', 'FALHA', 'NF_TRANSITO', dataSet.FieldByName('NUM_NOTAT').AsString, buscas);
    if Result then
      Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TNFTransito.ReceberNFT: boolean;
begin
   try
    Result := false;

   if not vDadosIni.PesqPros('VEI109', 'RECEBER', '', 'NF_TRANSITO',
      '', buscas, true) then
      Exit;

   if Application.MessageBox('Deseja marcar como "RECEBIDA" Nota Fiscal em Trânsito',
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
     exit;

    if not (dataSet.State in [dsInsert, dsEdit]) then
      dataSet.Edit;
    dataset.FieldByName('STATUST').AsString := 'RECEBIDA';
    dataSet.Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI109', 'RECEBER', 'SUCESSO', 'NF_TRANSITO', dataSet.FieldByName('NUM_NOTAT').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI109', 'RECEBER', 'FALHA', 'NF_TRANSITO', dataSet.FieldByName('NUM_NOTAT').AsString, buscas);
    if Result then
      Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TNFTransito._NFTransito(Tipoform: integer);
begin
 try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Notas Fiscais em Trânsito');
    vDadosIni.vTipoForm := TipoForm;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    begin
      Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('VEI105', 'CONSULTA', '', 'NF_TRANSITO', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if FrmCadNFTransitoCCIA = nil then
    begin
      vDadosIni.vTipoForm := TipoForm;
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TFrmCadNFTransitoCCIA, FrmCadNFTransitoCCIA);
    end;

    if (TipoForm > 0) and (not FrmCadNFTransitoCCIA.Visible) then
      FrmCadNFTransitoCCIA.ShowModal
    else if (not FrmCadNFTransitoCCIA.Visible) then
      FrmCadNFTransitoCCIA.Show
    else if FrmCadNFTransitoCCIA.FormStyle = fsMDIChild then
      FrmCadNFTransitoCCIA.Show
    else
      FrmCadNFTransitoCCIA.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TEstMotoTransitoCCIA }

function TEstMotoTransitoCCIA.AbreEstMotoTransito: boolean;
begin
  Result := montaSelect(' SELECT FIRST 1 EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
   ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
   ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
   ' WHERE EST_MOTO.ATIVO = 1 AND EST_MOTO.CODIGO = 0 AND EST_MOTO.COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

function TEstMotoTransitoCCIA.AbreEstMotoTransito(pNumNF: Integer): boolean;
begin
 Result := montaSelect(' SELECT EST_MOTO.*, CL.NOME_CLIENTE CLIENTE, F.NOME_CLIENTE FORNECEDOR, COL.NOME_VENDEDOR FROM EST_MOTO ' +
   ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST_MOTO.COD_CLIENTE AND CL.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES F ON F.COD_CLIENTE = EST_MOTO.COD_FORNECEDOR AND F.COD_EMPRESA = EST_MOTO.COD_EMPRESA ' +
   ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = EST_MOTO.VENDEDOR_RES AND COL.COD_EMPRESA = EST_MOTO.COD_EMPRESA AND COL.ATIVO = 1 ' +
   ' WHERE EST_MOTO.ATIVO = 1 AND EST_MOTO.NUM_NOTA = '+IntToStr(pNumNF)+' AND EST_MOTO.COD_EMPRESA =' + vDadosIni.codEmpresa);

 Result := not dataSet.IsEmpty;
end;

procedure TEstMotoTransitoCCIA.CadEstMotoTransito(TipoForm: integer; pNumNF: Integer);
begin
 try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Nota Fiscal Transito');
    vDadosIni.vTipoForm := TipoForm;

    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

    if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    begin
      Application.MessageBox('Empresa não configurada para Usar Módulo de Veículo 4.0!', 'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('VEI110', 'CONSULTA', '', 'EST_MOTO', '',
      DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    vDadosIni.vPesquisa := IntToStr(pNumNF);
    if FrmTransitoVeiculosCCIA = nil then
    begin
      vDadosIni.vTipoForm := TipoForm;
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TFrmTransitoVeiculosCCIA, FrmTransitoVeiculosCCIA);
    end;

    if (TipoForm > 0) and (not FrmTransitoVeiculosCCIA.Visible) then
      FrmTransitoVeiculosCCIA.ShowModal
    else if (not FrmTransitoVeiculosCCIA.Visible) then
      FrmTransitoVeiculosCCIA.Show
    else if FrmTransitoVeiculosCCIA.FormStyle = fsMDIChild then
      FrmTransitoVeiculosCCIA.Show
    else
      FrmTransitoVeiculosCCIA.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TEstMotoTransitoCCIA.create;
begin
 if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsEstMotosTransito);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TEstMotoTransitoCCIA.delete: boolean;
var
  codVeic, Chassi: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  codVeic := dataSet.FieldByName('CODIGO').AsString;
  Chassi := dataSet.FieldByName('CHASSI_C').AsString;

  if ((UpperCase(trim(dataSet.FieldByName('POSICAO').AsString)) = 'TRANSITO')
   or (UpperCase(trim(dataSet.FieldByName('MODELO_NF').AsString)) = 'TRA'))
   and (dataSet.FieldByName('COD_NF').AsInteger <= 0)
   and (dataSet.FieldByName('NUM_NOTA').AsInteger > 0) then
  begin
   if not vDadosIni.PesqPros('VEI103', 'CANCELAR', '', 'EST_MOTO',
    '', buscas, true) then
    Exit;

   if Application.MessageBox('Veículo se encontra em transito, Tem certeza que deseja cancelar?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
    exit;

   dataSet.Edit;
   dataSet.FieldByName('POSICAO').AsString := 'MORTO';
   dataSet.FieldByName('MODELO_NF').AsString := 'TRA';
   dataSet.FieldByName('STATUS_CANC').AsString := 'S';
   dataSet.Post;

   result := Apply;

   if result then
     vDadosIni.AtualizarFilaReserva(buscas, DtmVeiculosCCIA.SpIncCodigoV, StrToInt(codVeic), trim(Chassi), false);

   if result then
     result := CommitaTransacao;

   if Result then
     vDadosIni.GravaAuditoria('VEI103', 'CANCELAR', 'SUCESSO - CHASSI ' + Chassi, 'EST_MOTO', codVeic, buscas)
   else
     vDadosIni.GravaAuditoria('VEI103', 'CANCELAR', 'FALHA - CHASSI ' + Chassi, 'EST_MOTO', codVeic, buscas);
   Refresh;
   exit;
  end;
end;

{ TFilaReserva }

function TFilaReserva.abreEstMoto(pCodigo: Integer; pChassi: string): boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'ESTMOTOEDIT| ' + IntToStr(pCodigo);
  vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
  vDadosIni.vDtSetTmp.Close;
  vDadosIni.vDtSetTmp.FieldDefs.Clear;
  vDadosIni.vDtSetTmp.FieldDefs.Add('CODIGO', ftInteger, 0, false);
  vDadosIni.vDtSetTmp.FieldDefs.Add('CHASSI_C', ftString, 17, false);

  if vDadosIni.vDtSetTmp.Tag = 0 then
  try
    vDadosIni.vDtSetTmp.CreateDataSet;
    vDadosIni.vDtSetTmp.Tag := 1;
  except
  end;

 vDadosIni.vDtSetTmp.EmptyDataSet;
 vDadosIni.vDtSetTmp.Insert;
 vDadosIni.vDtSetTmp.FieldByName('CODIGO').AsInteger := pCodigo;
 vDadosIni.vDtSetTmp.FieldByName('CHASSI_C').AsString := pChassi;
 vDadosIni.vDtSetTmp.Post;
 vDadosIni.abreStatusProcessamento('', 'Abrindo Estoque e Movimento de Veículos');
 formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmEstMotosCCIA', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
    vDadosIni.vPesquisa := '';
  end;
end;

function TFilaReserva.abreFormFilaReserva(TipoForm: integer): boolean;
begin
  try
    Result := True;
    try
      vDadosIni.abreStatusProcessamento('', 'Abrindo Controle de Estoque');
      vDadosIni.vTipoForm := 1;
      if DtmVeiculosCCIA = nil then
        DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

      if not vDadosIni.PesqPros('VEI136', 'ABRIR', '', 'EST_MOTO', '', DtmVeiculosCCIA.qrBuscasV, true) then
      begin
        vDadosIni.fechaStatusProcessamento;
        exit;
      end;


      if frmCadFilaReservaCCIA = nil then
      begin
        vDadosIni.vTipoForm := TipoForm;
        if TipoForm > 0 then
          vDadosIni.vModalOuChild := 'M';
        Application.CreateForm(TfrmCadFilaReservaCCIA, frmCadFilaReservaCCIA);
      end;

      if (TipoForm > 0) and (not frmCadFilaReservaCCIA.Visible) then
        frmCadFilaReservaCCIA.ShowModal
      else if (not frmCadFilaReservaCCIA.Visible) then
        frmCadFilaReservaCCIA.Show
      else if frmCadFilaReservaCCIA.FormStyle = fsMDIChild then
        frmCadFilaReservaCCIA.Show
      else
        frmCadFilaReservaCCIA.ShowModal;
    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  finally
  end;
end;

function TFilaReserva.abreFormFilaReserva(pCod: string): boolean;
var
  pMensagem: string;
begin
  try
    Result := True;
    vDadosIni.abreStatusProcessamento('', 'Abrindo Fila Reserva de Veículos');
    vDadosIni.vTipoForm := 1;
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    if not vDadosIni.PesqPros('VEI136', 'ABRIR', '', 'EST_MOTO', '', DtmVeiculosCCIA.qrBuscasV, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
       exit;
    end;

//    if not _mdiAberto('TfrmCadFilaReservaCCIA', 'O formulário fila de reserva se encontra aberto!') then
//    begin
//      vDadosIni.fechaStatusProcessamento;
//      exit;
//    end;

    vDadosIni.vPesquisa := 'FILARESERVAVEIC|' + pCod + '|';

    if frmCadFilaReservaCCIA = nil then
    begin
      vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadFilaReservaCCIA, frmCadFilaReservaCCIA);
    end;

    // Vai abrir sempre showmodal
    if frmCadFilaReservaCCIA.FormStyle = fsMDIChild then
      frmCadFilaReservaCCIA.Show
    else
      frmCadFilaReservaCCIA.ShowModal;
  finally
    vDadosIni.vPesquisa := '';
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFilaReserva.atualizarDados;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.Edit;

  if dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0 then
  begin
    if dataSet.FieldByName('DATA_RES').IsNull then
    begin
      dataSet.FieldByName('DATA_RES').AsDateTime := vDadosIni.getDataBanco(FilaReserva.buscas);
      dataSet.FieldByName('HORA_RES').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(FilaReserva.buscas));
    end;
  end
  else
  begin
    dataSet.FieldByName('COD_CLIENTE').Value := Null;
    dataSet.FieldByName('NOME_RES').Value := Null;
    dataSet.FieldByName('FONE_RES').Value := Null;
    dataSet.FieldByName('TIPO_RES').Value := Null;
    dataSet.FieldByName('SIT_RES').Value := Null;
    dataSet.FieldByName('GRUPO_COTA_RD').Value := Null;
    dataSet.FieldByName('DATA_ASSEMBLEIA').Value := Null;
    dataSet.FieldByName('DATA_RES').Value := Null;
    dataSet.FieldByName('HORA_RES').Value := Null;
    dataSet.FieldByName('DATA_VENC_RES').Value := Null;
    dataSet.FieldByName('HORA_VENC_RES').Value := Null;
  end;
end;

procedure TFilaReserva.buscarDadosReserva;
begin
  buscas.Close;
  buscas.SQL.Text := ' select retirar_reservas_venc, tipo_res from tipo_reserva res ' +
    ' where res.tipo = ''VEI'' and res.tipo_res = :tipo_res ';
  buscas.ParamByName('TIPO_RES').AsString := 'F';
  buscas.Open;

  vTipoResR := buscas.FieldByName('TIPO_RES').AsString;
  vRetirarReservaVenc := buscas.FieldByName('RETIRAR_RESERVAS_VENC').AsString;
end;

procedure TFilaReserva.ChecarLista;
var
 vresultado, vCodVendedor: Integer;
 vMens, vMensTemp: string;
begin
 vFilaVeiculos.dataSet.First;
 while not vFilaVeiculos.dataSet.Eof do
 begin
   vCodVendedor := vFilaVeiculos.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
   fTempFilaReserva.Filtered := false;
   fTempFilaReserva.Filter := 'CODIGO = ' + IntToStr(vFilaVeiculos.dataSet.FieldByName('CODIGO').AsInteger);
   fTempFilaReserva.Filtered := true;
   if vCodVendedor > 0 then
     if vFilaVeiculos.dataSet.RecNo <> fTempFilaReserva.FieldByName('ORDEM_TEMP').AsInteger then
     begin
      vMensTemp :='ORDEM FILA DE RESERVA ALTERADA:  ' +
        'MODELO: ' + trim(vFilaVeiculos.dataSet.FieldByName('DESCRICAO').AsString)  +
        ',ANO_FAB: ' + IntToStr(vFilaVeiculos.dataSet.FieldByName('ANO_FAB').AsInteger) +
        ',ANO_MOD: ' + IntToStr(vFilaVeiculos.dataSet.FieldByName('ANO_MOD').AsInteger) +
        ',COR: ' + trim(vFilaVeiculos.dataSet.FieldByName('DESCRICAO_COR').AsString) +
        ',CLIENTE: ' + trim(vFilaVeiculos.dataSet.FieldByName('NOME_RES').AsString) +
        ',FONE: ' + trim(dataSet.FieldByName('FONE_RES').AsString) +
        ',COND: ' + trim(dataSet.FieldByName('TIPO_RES').AsString) +
        + vDadosIni.retornoPorCondicao(trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) <> '',
         ',GRUPO/COTA/RD: ' + trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString), '') +
        + vDadosIni.retornoPorCondicao(dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime > 0,
         ',ASSEMBLEIA: ' + trim(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime)), '') +
        ',USUARIO QUE REORDENOU: ' + trim(vDadosIni.vNomeUsuario);

       if vFilaVeiculos.dataSet.RecNo >  fTempFilaReserva.FieldByName('ORDEM_TEMP').AsInteger then
       begin
         vresultado := vFilaVeiculos.dataSet.RecNo - fTempFilaReserva.FieldByName('ORDEM_TEMP').AsInteger;
         vMens := 'DESCEU ' + IntToStr(vresultado);
       end
       else
       begin
         vresultado := fTempFilaReserva.FieldByName('ORDEM_TEMP').AsInteger - vFilaVeiculos.dataSet.RecNo;
         vMens := 'SUBIU ' + IntToStr(vresultado);
       end;
       if vresultado > 1 then
         vMens := vMens + ' POSIÇÕES NA FILA DA RESERVA'
       else
         vMens := vMens + ' POSIÇÃO NA FILA DA RESERVA';
       vMensTemp := vMensTemp + ',' + vMens;
       vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, 'ORDEM FILA DE RESERVA ALTERADA', vMensTemp, vCodVendedor);
     end;
   vFilaVeiculos.dataSet.Next;
 end;
 CommitaTransacao;
end;

constructor TFilaReserva.create;
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsFilaReserva);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);

  vColaboradorVeic := TLocColaborador.create;
  vClientesVeic := TLocCliente.create;
  vCoresVeic := TLocCor.create;
  vModVeic := TModVeiculoCCIA.create;
  vFilaVeiculos := TFilaVeiculos.create;
  vReserva := TReservaEstMotoCCIA.create;
  vEstMoto := TEstMotoCCIA.create;
  vCondPag := TCondPagCCIA.create;

  vClientesVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsClientesEstMotosReserva);
  vColaboradorVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsColaboradorEstMotosReserva);
  vModVeic.dataSet := TClientDataSet(DtmVeiculosCCIA.cdsBuscaModelo);

  fTempFilaReserva := TClientDataSet.Create(nil);
  fTempFilaReserva.Close;
  fTempFilaReserva.FieldDefs.Clear;
  fTempFilaReserva.FieldDefs.Add('CODIGO', ftInteger, 0, false);
  fTempFilaReserva.FieldDefs.Add('ORDEM', ftInteger, 0, false);
  fTempFilaReserva.FieldDefs.Add('ORDEM_TEMP', ftInteger, 0, false);

  if fTempFilaReserva.Tag = 0 then
  try
    fTempFilaReserva.CreateDataSet;
    fTempFilaReserva.Tag := 1;
  except
  end;
end;

function TFilaReserva.delete: boolean;
var
  codigo, vMens, vMensTemp, vTipoRes: string;
  vCodVendedor: Integer;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  codigo := dataSet.FieldByName('CODIGO').AsString;
  vCodVendedor := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
  vTipoRes := retornaValor(' select tipo_res as valor from tipo_reserva ' +
    ' where tipo = ''VEI'' and sigla = ' + QuotedStr(trim(dataSet.FieldByName('TIPO_RES').AsString)));
  
   vMens := 'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
   '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
   '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
   '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
   '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
   '/ORDEM ' + IntToStr(dataSet.FieldByName('ORDEM').AsInteger);
   vMensTemp := 'FILA DE RESERVA EXCLUÍDA:  ' +
   'MODELO: ' + trim(dataSet.FieldByName('DESCRICAO').AsString)  +
   ',ANO_FAB: ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
   ',ANO_MOD: ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
   ',COR: ' + trim(dataSet.FieldByName('DESCRICAO_COR').AsString) +
   ',CLIENTE: ' + trim(dataSet.FieldByName('NOME_RES').AsString) +
   ',FONE: ' + trim(dataSet.FieldByName('FONE_RES').AsString) +
   ',COND: ' + trim(dataSet.FieldByName('TIPO_RES').AsString) +
   + vDadosIni.retornoPorCondicao(trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) <> '',
    ',GRUPO/COTA/RD: ' + trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString), '') +
   + vDadosIni.retornoPorCondicao(dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime > 0,
    ',ASSEMBLEIA: ' + trim(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime)), '') +
   ',USUARIO QUE EXCLUIU: ' + trim(vDadosIni.vNomeUsuario);

  if not vDadosIni.PesqPros('VEI140', 'EXCLUIR', vMens, 'FILA_RESERVA_VEIC',
    '', buscas, false) then
    Exit;

  if (dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0) and (trim(vTipoRes) <> 'M')
    and (dataSet.FieldByName('COD_VENDEDOR').AsInteger <> vDadosIni.vCodUsuario) then
  begin
    if not vDadosIni.PesqPros('VEI154', 'EXCLUIR', vMens, 'FILA_RESERVA_VEIC',
      dataSet.FieldByName('CODIGO').AsString, buscas, false) then
      Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja excluir registro?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
     buscas.Close;
     buscas.SQL.Text := 'delete from fila_reserva_veic ' +
      ' where codigo = ' + IntToStr(dataSet.FieldByName('CODIGO').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;
      CommitaTransacao;
      vDadosIni.GravaAuditoria('VEI140', 'EXCLUIR', 'SUCESSO - ' + vMens, 'FILA_RESERVA_VEIC', codigo, buscas);

      if (trim(vTipoRes) <> 'M') then
      begin
        vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, 'FILA DE RESERVA EXCLUÍDA', vMensTemp, vCodVendedor);
        CommitaTransacao;
      end;
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VEI140', 'EXCLUIR', 'FALHA - ' + vMens, 'FILA_RESERVA_VEIC', codigo, buscas);
    end;
  end;
  Result := true;
  Refresh;
end;

destructor TFilaReserva.destroy;
begin
  vColaboradorVeic.Free;
  vColaboradorVeic := nil;
  vColaboradorVeic.Free;
  vColaboradorVeic := nil;
  vCoresVeic.Free;
  vCoresVeic := nil;
  vModVeic.Free;
  vModVeic := nil;
  vFilaVeiculos.Free;
  vFilaVeiculos := nil;
  vReserva.Free;
  vReserva := nil;
  vEstMoto.Free;
  vEstMoto := nil;
  vCondPag.Free;
  vCondPag := nil;
  inherited;
end;

function TFilaReserva.edit: boolean;
var
 vTipoRes: string;
begin
  Result := False;
  if not vDadosIni.PesqPros('VEI139', 'ALTERAR',
   'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
   '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
   '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
   '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
   '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
   '/ORDEM ' + IntToStr(dataSet.FieldByName('ORDEM').AsInteger),
   'FILA_RESERVA_VEIC',
    dataSet.FieldByName('CODIGO').AsString, buscas, false) then
    Exit;

  vTipoRes := retornaValor(' select tipo_res as valor from tipo_reserva ' +
    ' where tipo = ''VEI'' and sigla = ' + QuotedStr(trim(dataSet.FieldByName('TIPO_RES').AsString)));

  if (dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0) and (trim(vTipoRes) <> 'M')
   and (dataSet.FieldByName('COD_VENDEDOR').AsInteger <> vDadosIni.vCodUsuario) then
  begin
    if not vDadosIni.PesqPros('VEI159', 'ALTERAR', '', 'FILA_RESERVA_VEIC',
     dataSet.FieldByName('CODIGO').AsString, buscas, true) then
    exit;
  end;
  if inherited Edit then
  begin
    dataSet.FieldByName('US_EDIT').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('DATA_EDIT').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('HORA_EDIT').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));
    Result := True;
    vColaboradorVeic.abreLocVendedor;
    vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
    vCoresVeic._AbreCores;
    vModVeic.abreModVeiculos;
    vCondPag.abreCondPag;
    vCodCliente := dataSet.FieldByName('COD_CLIENTE').AsInteger;
    vCodClienteOld := dataSet.FieldByName('COD_CLIENTE').AsInteger;
    vCodVendedorOld := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    vNomeVendedorOld := trim(dataSet.FieldByName('NOME_VENDEDOR').AsString);
    vCodVendedor := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    vNomeVendedor := trim(dataSet.FieldByName('NOME_VENDEDOR').AsString);
    vNomeResOld := trim(dataSet.FieldByName('NOME_RES').AsString);
    vFoneClienteOld := trim(dataSet.FieldByName('FONE_RES').AsString);
    vTipoResOld := trim(dataSet.FieldByName('TIPO_RES').AsString);
    vGrupoCotaRdOld := trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString);
    vDataAssembleiaOld := dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime;
    buscarDadosReserva;
    if trim(dataSet.FieldByName('NOME_RES').AsString) = '' then
      dataSet.FieldByName('NOME_RES').AsString := vClientesVeic.dataSet.FieldByName('NOME_CLIENTE').AsString;
  end;
end;

function TFilaReserva.Insert: boolean;
begin
  result := inherited Insert;
  if not result then
   exit;

  dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  if vColaboradorVeic.buscarVendedor(vDadosIni.vCodUsuario) then
    dataSet.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;

  dataSet.FieldByName('SIT_RES').AsString := 'V';
  dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
  dataSet.FieldByName('DATA_CAD').AsDateTime := vDadosIni.getDataBanco(buscas);
  dataSet.FieldByName('HORA_CAD').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));
  vCodCliente := 0;
  vCodClienteOld := 0;
  vCodVendedorOld := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
  vNomeVendedorOld := trim(dataSet.FieldByName('NOME_VENDEDOR').AsString);
  vCodVendedor := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
  vNomeVendedor := trim(dataSet.FieldByName('NOME_VENDEDOR').AsString);
  vCodVendedor := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
  vNomeVendedor := trim(dataSet.FieldByName('NOME_VENDEDOR').AsString);
  vNomeResOld := trim(dataSet.FieldByName('NOME_RES').AsString);
  vFoneClienteOld := trim(dataSet.FieldByName('FONE_RES').AsString);
  vTipoResOld := trim(dataSet.FieldByName('TIPO_RES').AsString);
  vGrupoCotaRdOld := trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString);
  vDataAssembleiaOld := dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime;
  buscarDadosReserva;
  vColaboradorVeic.abreLocVendedor;
  vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
  vCoresVeic._AbreCores;
  vModVeic.abreModVeiculos;
  vCondPag.abreCondPag;
end;

function TFilaReserva.post(pTodos: boolean = false): boolean;
var
  acao: string;
  codigo: Integer;
  vMens, vMensTemp, vTemp: string;
  valterado: boolean;
  vTipoResNovo: string;
begin
  try
    Result := false;

     vTipoResNovo := retornaValor(' select tipo_res as valor from tipo_reserva res ' +
      ' where res.tipo = ''VEI'' and res.sigla = ' + QuotedStr(trim(dataSet.FieldByName('TIPO_RES').AsString)));
     codigo :=  dataSet.FieldByName('CODIGO').AsInteger;
     vCodVendedor := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
     vNomeVendedor := retornaValor('SELECT NOME_VENDEDOR AS VALOR FROM COLABORADOR ' +
      ' WHERE COD_VENDEDOR = ' + IntToStr(vCodVendedor) + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND ATIVO = 1');

     vMens := 'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
      '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
      '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
      '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
      '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
      '/ORDEM ' + IntToStr(dataSet.FieldByName('ORDEM').AsInteger);
     if (vCodVendedor > 0) then
       vMensTemp := 'VENDEDOR NA FILA DE RESERVA ALTERADO:  ' +
        'MODELO: ' + trim(dataSet.FieldByName('DESCRICAO').AsString)  +
        ',ANO_FAB: ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
        ',ANO_MOD: ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
        ',COR: ' + trim(dataSet.FieldByName('DESCRICAO_COR').AsString) +
        ',CLIENTE: ' + trim(dataSet.FieldByName('NOME_RES').AsString) +
        ',FONE: ' + trim(dataSet.FieldByName('FONE_RES').AsString) +
        ',COND: ' + trim(dataSet.FieldByName('TIPO_RES').AsString) +
        + vDadosIni.retornoPorCondicao(trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) <> '',
         ',GRUPO/COTA/RD: ' + trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString), '') +
        + vDadosIni.retornoPorCondicao(dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime > 0,
         ',ASSEMBLEIA: ' + trim(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime)), '') +
        ',USUARIO QUE ALTEROU: ' + trim(vDadosIni.vNomeUsuario) +
        ',VENDEDOR ANTERIOR: ' + Trim(vNomeVendedorOld) +
        ',VENDEDOR ATUAL: ' + Trim(vNomeVendedor)
     else
       vMensTemp := 'VENDEDOR NA FILA DE RESERVA RETIRADO:  ' +
        'MODELO: ' + trim(dataSet.FieldByName('DESCRICAO').AsString)  +
        ',ANO_FAB: ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
        ',ANO_MOD: ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
        ',COR: ' + trim(dataSet.FieldByName('DESCRICAO_COR').AsString) +
        ',CLIENTE: ' + trim(vNomeResOld) +
        ',FONE: ' + trim(vFoneClienteOld) +
        ',COND: ' + trim(vTipoResOld) +
        + vDadosIni.retornoPorCondicao(trim(vGrupoCotaRdOld) <> '',
         ',GRUPO/COTA/RD: ' + trim(vGrupoCotaRdOld), '') +
        + vDadosIni.retornoPorCondicao(vDataAssembleiaOld > 0,
         ',ASSEMBLEIA: ' + trim(FormatDateTime('dd/mm/yyyy', vDataAssembleiaOld)), '') +
        ',USUARIO QUE RETIROU: ' + trim(vDadosIni.vNomeUsuario);

    if not vDadosIni.PesqPros('VEI141', 'SALVAR', vMens, 'FILA_RESERVA_VEIC',
      IntToStr(codigo), buscas, true) then
      Exit;

    if (not ptodos) and (vCodVendedorOld > 0) and (vCodVendedor = 0) and (trim(vTipoResR) <> 'M')
      and (vCodVendedorOld <> vDadosIni.vCodUsuario) then
    begin
      if not vDadosIni.PesqPros('VEI152', 'RETIRAR', vMens, 'FILA_RESERVA_VEIC',
       IntToStr(codigo), buscas, true) then
        exit;
    end;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';
      
    if (trim(dataSet.FieldByName('STATUS_AVARIAS').AsString) = '') then 
      dataSet.FieldByName('STATUS_AVARIAS').AsString := 'N';
      
    if dataSet.FieldByName('COD_MODELO').AsInteger <= 0 then
      raiseExceptionCreate('Modelo não informado!', 'DBEdit_Codigo');

    if not vModVeic.buscarModelo(dataSet.FieldByName('COD_MODELO').AsInteger) then
      raiseExceptionCreate('Modelo não encontrado!', 'DBEdit_Codigo');

    if dataSet.FieldByName('ANO_FAB').AsInteger <= 0 then
      raiseExceptionCreate('Ano fabricação não informado!', 'DBEdit8');

    if Length(trim(dataSet.FieldByName('ANO_FAB').AsString)) < 4 then
      raiseExceptionCreate('Ano fabricação incorreto, exemplo: 2014!', 'DBEdit8');

    if dataSet.FieldByName('ANO_MOD').AsInteger <= 0 then
      raiseExceptionCreate('Ano modelo não informado!', 'DBEdit10');

    if Length(trim(dataSet.FieldByName('ANO_MOD').AsString)) < 4 then
      raiseExceptionCreate('Ano modelo incorreto, exemplo: 2014!', 'DBEdit10');

    if dataSet.FieldByName('COD_COR').AsInteger <= 0 then
      raiseExceptionCreate('Cor não informada!', 'DBEdit17');

    if not vCoresVeic.buscarCor(dataSet.FieldByName('COD_COR').AsInteger) then
      raiseExceptionCreate('Cor não encontrada!', 'DBEdit17');

    if (vRetirar) and (dataSet.State = dsEdit)  then
    else
      if dataSet.FieldByName('COD_VENDEDOR').AsInteger <= 0 then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if not vDadosIni.PesqPros('VEI156', 'TESTAR', '', 'FILA_RESERVA_VEIC', '', buscas, true) then
          raiseExceptionCreate('Vendedor não informado!', 'DBEdit5');
      end;

    if dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0 then
    begin
      if not vColaboradorVeic.buscarVendedor(dataSet.FieldByName('COD_VENDEDOR').AsInteger) then
        raiseExceptionCreate('Vendedor não encontrado!', 'DBEdit5');

      if dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
       if not vClientesVeic.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger) then
        raiseExceptionCreate('Cliente não encontrado!', 'DBEdit5');

      if trim(dataSet.FieldByName('NOME_RES').AsString) = '' then
        raiseExceptionCreate('Nome do Cliente não informado!', 'DBEdit12');

      if trim(dataSet.FieldByName('FONE_RES').AsString) = '' then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if not vDadosIni.PesqPros('VEI155', 'TESTAR', '', 'EST_MOTO', '', buscas, true) then
          raiseExceptionCreate('Telefone não informado!', 'DBEdit13');
      end;

      if trim(dataSet.FieldByName('TIPO_RES').AsString) = '' then
        raiseExceptionCreate('Condição da reserva não informada!', 'DBComboBox1');

      if not verificatiporeserva(2, frmCadFilaReservaCCIA.DBComboBox1, 'VEI', trim(dataSet.FieldByName('TIPO_RES').AsString)) then
        raiseExceptionCreate('Condição da reserva é inválida!', 'DBComboBox1');

      if trim(dataSet.FieldByName('SIT_RES').AsString) = '' then
        raiseExceptionCreate('Situação da reserva não informada!', 'DBComboBox2');

      if (trim(dataSet.FieldByName('SIT_RES').AsString) <> 'N')
       and (trim(dataSet.FieldByName('SIT_RES').AsString) <> 'V') then
         raiseExceptionCreate('Situação da reserva incorreto!', 'DBComboBox2');

      if not verificarConsorcio then
         raiseExceptionCreate('Grupo/Cota/RD não informado!', 'DBEdit2');

      if not verficarDataAssembleia then
         raiseExceptionCreate('Data da assembleia não informado!', 'DBEdit3');

      if trim(vTipoResNovo) = 'M' then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if not vDadosIni.PesqPros('VEI167', 'PERMITIR', '', 'EST_MOTO', '', buscas, false) then
        	raiseExceptionCreate('Condição da primeira reserva não deve ser ' + QuotedStr(trim(dataSet.FieldByName('TIPO_RES').AsString)) +' !', 'DBComboBox1');
      end;
    end;

    if dataSet.State in [dsInsert] then
    begin
      dataSet.FieldByName('CODIGO').AsInteger :=
       Gencodigo('FILA_RESERVA_VEIC',  DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
      dataSet.FieldByName('ORDEM').AsInteger :=
       Gencodigo('FILA_RESERVA_VEIC_ORDEM',  DtmVeiculosCCIA.SpIncCodigoV, vDadosIni.codEmpresa);
    end;

    Result := inherited post;
    valterado := DataSet.ChangeCount > 0;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI141', acao, 'SUCESSO - ' + vMens, 'FILA_RESERVA_VEIC',
        IntToStr(codigo), buscas)
    else
      vDadosIni.GravaAuditoria('VEI141', acao, 'FALHA - ' + vMens, 'FILA_RESERVA_VEIC',
        IntToStr(codigo), buscas);

    if (acao = 'EDITAR') and (valterado) then
    begin
      if (vCodVendedorOld > 0) and (vCodVendedorOld <> vCodVendedor) and (trim(vTipoResR) <> 'M') then
      begin
        if vCodVendedor > 0 then
           vTemp := 'FILA DE RESERVA ALTERADA'
        else
           vTemp := 'FILA DE RESERVA RETIRADA';
        vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, vTemp, vMensTemp, vCodVendedorOld);
        vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, vTemp, vMensTemp, vCodVendedor);
        CommitaTransacao;
      end;
    end;

    if Result then
    begin
      Refresh;
      vFilaVeiculos.Refresh;
    end
    else if acao = 'INSERIR' then
      raise exception.create('Erro ao inserir');
  except
    on e: exception do
    begin
      Result := false;
      if e.Message <> 'Erro ao inserir' then
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK)
      else
      begin
        Application.MessageBox('Erro ao gravar registro. Pode ter outro usuário ' +
          'impedindo a gravação. Por favor espere um pouco e confirme novamente,  ' +
          'se o erro persistir contacte o administrador da rede.',
          'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        if dataSet.State = dsBrowse then
          Edit;
      end;
    end;
  end;
end;

procedure TFilaReserva.PreencherDtsetTemp;
begin
  fTempFilaReserva.EmptyDataSet;

  if vFilaVeiculos.dataSet.IsEmpty then
    Exit;
  vFilaVeiculos.dataSet.First;
  while not vFilaVeiculos.dataSet.Eof do
  begin
    fTempFilaReserva.Insert;
    fTempFilaReserva.FieldByName('CODIGO').AsInteger := vFilaVeiculos.dataSet.FieldByName('CODIGO').AsInteger;
    fTempFilaReserva.FieldByName('ORDEM').AsInteger := vFilaVeiculos.dataSet.FieldByName('ORDEM').AsInteger;
    fTempFilaReserva.FieldByName('ORDEM_TEMP').AsInteger := vFilaVeiculos.dataSet.RecNo;
    fTempFilaReserva.Post;
    vFilaVeiculos.dataSet.Next;
  end;
  vFilaVeiculos.dataSet.First;
end;

function TFilaReserva.renovarReserva(pTodos: boolean = false): boolean;
var
 vDiasReservas: Integer;
 vMens, proc, vObs, acao: string;
 vDataBanco: TDate;
 vCodigo: Integer;
begin
  try
    Result := false;

    if dataSet.FieldByName('DATA_VENC_RES').IsNull then
    begin
      Application.MessageBox('Data de vencimento não definida, favor verificar.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    vCodigo := dataSet.FieldByName('CODIGO').AsInteger;
    vDataBanco := vDadosIni.getDataBanco(buscas);
    vDiasReservas := StrToInt(retornaValor(' select coalesce(DIAS_RENOV, 0) valor from tipo_reserva  ' +
     ' where tipo = ''VEI'' and tipo_res = ''F'''));

    if vDiasReservas = 0 then
      raiseExceptionCreate('Condição da reserva configurada para não renovar.', 'DBComboBox1');

    if not pTodos then
      if Application.MessageBox(pchar('Deseja renovar reserva deste veículo?'), 'Atenção',
         MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDNO then
         exit;

    if (dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0) and (trim(vTipoResR) <> 'M')
     and (dataSet.FieldByName('COD_VENDEDOR').AsInteger <> vDadosIni.vCodUsuario) then
    begin
      if not vDadosIni.PesqPros('VEI153', 'RENOVAR', dataSet.FieldByName('CHASSI_C').AsString, 'EST_MOTO',
       dataSet.FieldByName('CODIGO').AsString, buscas, true) then
        exit;
    end;

    if trim(dataSet.FieldByName('STATUS_RENOV_RES').AsString) = 'S' then
       if not vDadosIni.PesqPros('VEI160', 'RENOVAR FILA',
         'MOD: ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) + ' COR: ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
         ' ANO MOD: ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) + ' ANO FAB: ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger),
         'FILA_RESERVA_VEIC', dataSet.FieldByName('CODIGO').AsString, buscas, true) then
          exit;

    if not (InputQuery('Renovar reserva', 'Informe o motivo da renovação da reserva.', vObs)) then
      exit;

    if trim(vObs) = '' then
      raiseExceptionCreate('Favor informar o motivo da renovação da reserva.', 'DBMemo2');

    if dataSet.State <> dsEdit then
      dataSet.Edit;

    if not (dataSet.State in [dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR';

    vMens := 'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
      '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
      '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
      '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
      '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
      '/ORDEM ' + IntToStr(dataSet.FieldByName('ORDEM').AsInteger);

    dataSet.FieldByName('STATUS_RENOV_RES').AsString := 'S';
    dataSet.FieldByName('QTDE_RENOV_RES').AsInteger := dataSet.FieldByName('QTDE_RENOV_RES').AsInteger + 1;
    if vDataBanco > dataSet.FieldByName('DATA_VENC_RES').AsDateTime then
      dataSet.FieldByName('DATA_VENC_RES').AsDateTime := vDataBanco + vDiasReservas
    else
      dataSet.FieldByName('DATA_VENC_RES').AsDateTime := dataSet.FieldByName('DATA_VENC_RES').AsDateTime + vDiasReservas;
    if trim(dataSet.FieldByName('OBS_RES').AsString) = '' then
      dataSet.FieldByName('OBS_RES').AsString := trim(vObs)
    else
      dataSet.FieldByName('OBS_RES').AsString := trim(dataSet.FieldByName('OBS_RES').AsString) + '; ' + trim(vObs);
    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if result then
      result := apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI149', 'RENOVAR', 'SUCESSO - ' + vMens, 'FILA_RESERVA_VEIC',
        IntToStr(vCodigo), buscas)
    else
      vDadosIni.GravaAuditoria('VEI149', 'RENOVAR', 'FALHA - ' + vMens, 'FILA_RESERVA_VEIC',
        IntToStr(vCodigo), buscas);

    if (result) and (acao = 'EDITAR') then
    begin
      vDadosIni.EnvMensMobile(buscas, DtmVeiculosCCIA.SpIncCodigoV, 'FILA DE RESERVA RENOVADA', vMens, vCodigo);
      CommitaTransacao;
    end;
    
    if Result then
    begin
      Refresh;
      vFilaVeiculos.Refresh;
    end;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TFilaReserva.verficarDataAssembleia: boolean;
begin
  Result := False;

  buscas.close;
  buscas.sql.text := 'select * from tipo_reserva where tipo = ''VEI'' and sigla = :sigla';
  buscas.ParamByName('SIGLA').AsString := dataSet.FieldByName('TIPO_RES').AsString;
  buscas.open;

  if buscas.IsEmpty then
  begin
    Result := True;
    exit;
  end;

  if (trim(buscas.FieldByName('TIPO_RES').AsString) = 'C') then
  begin
     if ((trim(dataSet.FieldByName('DATA_ASSEMBLEIA').AsString) = '') or
     	(trim(dataSet.FieldByName('DATA_ASSEMBLEIA').AsString) = '  /  /    '))  then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
	      if not vDadosIni.PesqPros('VEI166', 'TESTAR', '', 'EST_MOTO', '', buscas, true) then
        	exit;
      end;
  end
  else if trim(buscas.FieldByName('TIPO_RES').AsString) <> 'C' then
    dataSet.FieldByName('DATA_ASSEMBLEIA').Value := Null;

   Result := True;
end;

function TFilaReserva.verificarConsorcio: boolean;
begin
  Result := False;

  buscas.close;
  buscas.sql.text := 'select * from tipo_reserva where tipo = ''VEI'' and sigla = :sigla';
  buscas.ParamByName('SIGLA').AsString := dataSet.FieldByName('TIPO_RES').AsString;
  buscas.open;

  if buscas.IsEmpty then
  begin
    Result := True;
    exit;
  end;

  if (trim(buscas.FieldByName('TIPO_RES').AsString) = 'C') and
    ((trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) = '') or
     (trim(dataSet.FieldByName('GRUPO_COTA_RD').AsString) = '/   /'))  then
      exit;
   if trim(buscas.FieldByName('TIPO_RES').AsString) <> 'C' then
     dataSet.FieldByName('GRUPO_COTA_RD').Value := Null;

   Result := True;
end;

function TFilaReserva.verificarRegistro: boolean;
var
 vCodigo: Integer;
begin
  Result := True;

  vCodigo := dataSet.FieldByName('CODIGO').AsInteger;
  try
    dataSet.RefreshRecord;
    if vCodigo <> dataSet.FieldByName('CODIGO').AsInteger then
    begin
      Result := False;
      Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão Procurar e verifique',
        'Atenção', 0 + 64);
      Exit;
    end;

  except on E: Exception do
    begin
      if Pos('changed by another user', e.Message) > 0 then
      begin
        Result := False;
        Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
          'Atenção', 0 + 64);
        Exit;
      end;
    end;
  end;
end;

function TFilaReserva.verificatiporeserva(vtop: integer; vcomb: TDbCombobox;
  vtipo, vtpescol: string): boolean;
begin  
  result := false;
  if vtop = 1 then
  begin
    buscas.close;
    buscas.sql.text := 'select * from tipo_reserva where tipo = ''VEI'' and ativo = 1 ' +
     ' and tipo_res in (''V'', ''C'', ''B'', ''M'') ' +
     ' order by ordemexibicao, codigo';
    buscas.open;
    vcomb.Items.Clear;
    while not buscas.eof do
    begin
      vcomb.Items.Add(buscas.FieldByName('SIGLA').AsString);
      buscas.next;
    end;
    Result := true;
  end;

  if vtop = 2 then
  begin
    try
      buscas.close;
      buscas.sql.text := 'select * from tipo_reserva where tipo = ''VEI'' and ativo = 1 and sigla = ' + QuotedStr(vtpescol);
      buscas.open;
      if buscas.isempty then
        Result := False
      else
        Result := true;
    except
      on e: exception do
      begin
        Result := false;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  end;
end;

function TFilaReserva._AbreFilaReserva: boolean;
begin
  result := montaSelect(' SELECT FL.*, VN.NOME_VENDEDOR, TP.DESCRICAO, ' +
   ' TP.CILINDRADA, CL.NOME_CLIENTE, CL.RAZAO, COR.DESCRICAO_COR FROM FILA_RESERVA_VEIC FL ' +
   ' LEFT JOIN COLABORADOR VN ON VN.COD_VENDEDOR = FL.COD_VENDEDOR AND VN.COD_EMPRESA = FL.COD_EMPRESA ' +
   ' LEFT JOIN TIPMODELO TP ON TP.CODIGO = FL.COD_MODELO AND TP.COD_EMPRESA = FL.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = FL.COD_CLIENTE AND CL.COD_EMPRESA = FL.COD_EMPRESA ' +
   ' LEFT JOIN CODIGO_CORFAB COR ON COR.COD_COR = FL.COD_COR ' +
   ' WHERE FL.CODIGO=0 AND FL.COD_EMPRESA = ' +vDadosIni.codEmpresa)
end;

function TFilaReserva._AbreFilaReserva(pCodigo: integer): boolean;
begin
  result := montaSelect(' SELECT FL.*, VN.NOME_VENDEDOR, TP.DESCRICAO, ' +
   ' TP.CILINDRADA, CL.NOME_CLIENTE, CL.RAZAO, COR.DESCRICAO_COR FROM FILA_RESERVA_VEIC FL ' +
   ' LEFT JOIN COLABORADOR VN ON VN.COD_VENDEDOR = FL.COD_VENDEDOR AND VN.COD_EMPRESA = FL.COD_EMPRESA ' +
   ' LEFT JOIN TIPMODELO TP ON TP.CODIGO = FL.COD_MODELO AND TP.COD_EMPRESA = FL.COD_EMPRESA ' +
   ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = FL.COD_CLIENTE AND CL.COD_EMPRESA = FL.COD_EMPRESA ' +
   ' LEFT JOIN CODIGO_CORFAB COR ON COR.COD_COR = FL.COD_COR ' +
   ' WHERE FL.CODIGO= '+IntToStr(pCodigo) + ' AND FL.COD_EMPRESA = ' +vDadosIni.codEmpresa);
end;

function TFilaReserva._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

{ TFilaVeiculos }

function TFilaVeiculos.abreFilaVeiculos: boolean;
begin
 Result := montaSelect(' SELECT FIRST 1 FILA_VEICULOS.* FROM FILA_VEICULOS ' +
  ' WHERE FILA_VEICULOS.CODIGO = 0 AND FILA_VEICULOS.COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

function TFilaVeiculos.abreFilaVeiculos(pCod: integer; pStatus: string = 'FILA'): boolean;
begin
 Result := montaSelect(' SELECT FIRST 1 FILA_VEICULOS.* FROM FILA_VEICULOS ' +
  ' WHERE FILA_VEICULOS.CODIGO = ' + IntToStr(pCod) + ' AND TPV = ' + QuotedStr(pStatus) + 
  ' AND FILA_VEICULOS.COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

function TFilaVeiculos.abreFormAvaria: boolean;
var
 vAvaria: string;
begin
  Result := True;
  try
   if frmAvariaCCIA = nil then
     Application.CreateForm(TfrmAvariaCCIA, frmAvariaCCIA);

   if trim(dataSet.FieldByName('STATUS_AVARIAS').AsString) ='S' then
     frmAvariaCCIA.ComboBox1.ItemIndex := 0
   else
     frmAvariaCCIA.ComboBox1.ItemIndex := 1;

   buscas.Close;
   if dataSet.FieldByName('CODIGO').AsInteger > 0 then
   begin
     buscas.SQL.Text := ' SELECT OBS_ITEMEST FROM FILA_RESERVA_VEIC ' +
       ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
     buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
   end
   else
   begin
     buscas.SQL.Text := ' SELECT OBS_ITEMEST FROM EST_MOTO ' +
      ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
     buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('COD_ESTMOTO').AsInteger;
   end;
   buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
   buscas.Open;
   frmAvariaCCIA.Memo1.Text := '';
   if trim(buscas.FieldByName('OBS_ITEMEST').AsString) <> '' then
     frmAvariaCCIA.Memo1.Text := trim(buscas.FieldByName('OBS_ITEMEST').AsString);

   if frmAvariaCCIA.ShowModal = mrOk then
   begin
     if not vDadosIni.PesqPros('VEI145', 'ALTERAR',
      'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
      '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
      '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
      '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
      '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger),
      'FILA_RESERVA_VEIC',
       dataSet.FieldByName('COD_ESTMOTO').AsString, buscas, false) then
       Exit;
       
     if frmAvariaCCIA.ComboBox1.ItemIndex = 0 then
       vAvaria := 'S'
     else
       vAvaria := 'N';

     if dataSet.FieldByName('CODIGO').AsInteger > 0 then
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE FILA_RESERVA_VEIC SET STATUS_AVARIAS = :STATUS_AVARIAS, OBS_ITEMEST = :OBS_ITEMEST ' +
         ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
       buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('STATUS_AVARIAS').AsString := vAvaria;
       buscas.ParamByName('OBS_ITEMEST').AsString := trim(frmAvariaCCIA.Memo1.Text);
       buscas.ExecSQL;
     end;

     if dataSet.FieldByName('COD_ESTMOTO').AsInteger > 0 then
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE EST_MOTO SET STATUS_AVARIAS = :STATUS_AVARIAS, OBS_ITEMEST = :OBS_ITEMEST ' +
         ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
       buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('COD_ESTMOTO').AsInteger;
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('STATUS_AVARIAS').AsString := vAvaria;
       buscas.ParamByName('OBS_ITEMEST').AsString := trim(frmAvariaCCIA.Memo1.Text);
       buscas.ExecSQL;
     end;
     Result := CommitaTransacao;
   end;
  finally
    if Result then
      vDadosIni.GravaAuditoria('VEI145', 'EDITAR', 'SUCESSO "'+vAvaria+'" - ' +
      'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
      '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
      '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
      '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
      '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger),
      'EST_MOTO', dataSet.FieldByName('COD_ESTMOTO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI145', 'EDITAR', 'FALHA "'+vAvaria+'" - ' +
      'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
      '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
      '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
      '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
      '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger),
      'EST_MOTO', dataSet.FieldByName('COD_ESTMOTO').AsString, buscas);
  end;
end;

constructor TFilaVeiculos.create;
begin
   if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsFilaVeiculos);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TFilaVeiculos.definirCoresConsulta(pTipo: Integer = 0): boolean;
begin
  Result := True;

  if pTipo = 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := ' SELECT COR_ANOANTERIOS, COR_ANOFUTUROS, COR_AVARIA, COR_FATURADASPREV, COR_LOJA, COR_DEPOSITO, ' +
      ' COR_FATURADASPREV_ANO_ANTERIOS, COR_FATURADASPREV_ANOFUTUROS FROM EMPRESA ' +
      ' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.FieldByName('COR_ANOANTERIOS').AsInteger > 0 then
      frmCadFilaReservaCCIA.pnAnterios.Color := buscas.FieldByName('COR_ANOANTERIOS').AsInteger;
    if buscas.FieldByName('COR_ANOFUTUROS').AsInteger > 0 then
      frmCadFilaReservaCCIA.pnFuturos.Color := buscas.FieldByName('COR_ANOFUTUROS').AsInteger;  
    if buscas.FieldByName('COR_AVARIA').AsInteger > 0 then
      frmCadFilaReservaCCIA.pnAvaria.Color := buscas.FieldByName('COR_AVARIA').AsInteger;
    if buscas.FieldByName('COR_FATURADASPREV').AsInteger > 0 then
      frmCadFilaReservaCCIA.pnFaturadasPrevisao.Color := buscas.FieldByName('COR_FATURADASPREV').AsInteger;
    if buscas.FieldByName('COR_LOJA').AsInteger > 0 then
      frmCadFilaReservaCCIA.pnLoja.Color := buscas.FieldByName('COR_LOJA').AsInteger;
    if buscas.FieldByName('COR_DEPOSITO').AsInteger > 0 then
      frmCadFilaReservaCCIA.pnDeposito.Color := buscas.FieldByName('COR_DEPOSITO').AsInteger;
    if buscas.FieldByName('COR_FATURADASPREV_ANO_ANTERIOS').AsInteger > 0 then
      frmCadFilaReservaCCIA.pnAnteriosFaturadas.Color := buscas.FieldByName('COR_FATURADASPREV_ANO_ANTERIOS').AsInteger;
    if buscas.FieldByName('COR_FATURADASPREV_ANOFUTUROS').AsInteger > 0 then
      frmCadFilaReservaCCIA.pnFuturosFaturadas.Color := buscas.FieldByName('COR_FATURADASPREV_ANOFUTUROS').AsInteger;
  end
  else
  begin
    buscas.Close;
    buscas.SQL.Text := ' UPDATE EMPRESA SET COR_ANOANTERIOS = :COR_ANOANTERIOS, COR_ANOFUTUROS = :COR_ANOFUTUROS, ' +
     ' COR_AVARIA = :COR_AVARIA, COR_FATURADASPREV = :COR_FATURADASPREV, ' +
     ' COR_LOJA = :COR_LOJA, COR_DEPOSITO = :COR_DEPOSITO, ' +
     ' COR_FATURADASPREV_ANO_ANTERIOS = :COR_FATURADASPREV_ANO_ANTERIOS,' +
     ' COR_FATURADASPREV_ANOFUTUROS = :COR_FATURADASPREV_ANOFUTUROS ' +
     ' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('COR_ANOANTERIOS').AsInteger := frmCadFilaReservaCCIA.pnAnterios.Color;
    buscas.ParamByName('COR_ANOFUTUROS').AsInteger := frmCadFilaReservaCCIA.pnFuturos.Color;
    buscas.ParamByName('COR_AVARIA').AsInteger := frmCadFilaReservaCCIA.pnAvaria.Color;
    buscas.ParamByName('COR_FATURADASPREV').AsInteger := frmCadFilaReservaCCIA.pnFaturadasPrevisao.Color;
    buscas.ParamByName('COR_LOJA').AsInteger := frmCadFilaReservaCCIA.pnLoja.Color;
    buscas.ParamByName('COR_DEPOSITO').AsInteger := frmCadFilaReservaCCIA.pnDeposito.Color;
    buscas.ParamByName('COR_FATURADASPREV_ANO_ANTERIOS').AsInteger := frmCadFilaReservaCCIA.pnAnteriosFaturadas.Color;
    buscas.ParamByName('COR_FATURADASPREV_ANOFUTUROS').AsInteger := frmCadFilaReservaCCIA.pnFuturosFaturadas.Color;
    buscas.ExecSQL;
    if buscas.Transaction.InTransaction then
     buscas.Transaction.Commit;
  end;
end;

function TFilaVeiculos.OrdenarDownGrid: boolean;
var
  vOrdem1, vOrdem2, vCodigo1, vCodigo2, vCodVend1, vCodVend2: Integer;
  vMens, vPrevCheg1, vPrevCheg2: string;
  vCod: Integer;
begin
  Result := False;

  vCod :=  dataSet.FieldByName('CODIGO').AsInteger;
  vMens := 'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
   '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
   '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
   '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
   '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
   '/ORDEM ' + IntToStr(dataSet.FieldByName('ORDEM').AsInteger);

  if not vDadosIni.PesqPros('VEI143', 'ORDENAR_BAIXO', vMens, 'FILA_RESERVA_VEIC',
    dataSet.FieldByName('CODIGO').AsString, buscas, true) then
    Exit;

  if dataSet.RecordCount <= 0 then
  begin
    Application.MessageBox('Nenhum registro selecionado!', 'Atenção', MB_ICONWARNING + MB_OK);
    Exit;
  end
  else if dataSet.RecordCount = 1 then
  begin
   Application.MessageBox('Registro selecionado é o primeiro da lista!', 'Atenção', MB_ICONWARNING + MB_OK);
   Exit;
  end;

  if dataSet.RecNo = dataSet.RecordCount then
  begin
   Application.MessageBox('Registro selecionado é o último da lista!', 'Atenção', MB_ICONWARNING + MB_OK);
   Exit;
  end;


  vOrdem1 := dataSet.FieldByName('ORDEM').AsInteger;
  vCodigo1 := dataSet.FieldByName('CODIGO').AsInteger;
  vPrevCheg1 := dataSet.FieldByName('PREV_CHEG').AsString;
  vCodVend1 := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
  dataSet.Next;
  vOrdem2 := dataSet.FieldByName('ORDEM').AsInteger;
  vCodigo2 := dataSet.FieldByName('CODIGO').AsInteger;
  vPrevCheg2 := dataSet.FieldByName('PREV_CHEG').AsString;
  vCodVend2 := dataSet.FieldByName('COD_VENDEDOR').AsInteger;

  if (vCodVend1 > 0) and (vCodVend1 <> vDadosIni.vCodUsuario) then
  begin
     if not vDadosIni.PesqPros('VEI161', 'ALTERAR', vMens, 'FILA_RESERVA_VEIC',
      '', buscas, true) then
     begin
       Application.MessageBox('Somente o vendedor que se encontra à frente pode alterar a ordem da fila.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
       exit;
     end;
  end;

  try
    buscas.Close;
    buscas.SQL.Text := ' update fila_reserva_veic set ordem = :novaordem, prev_cheg = :prev_cheg ' +
    ' where ordem = :ordem and codigo = :codigo and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('CODIGO').AsInteger := vCodigo1;
    buscas.ParamByName('ORDEM').AsInteger := vOrdem1;
    buscas.ParamByName('PREV_CHEG').AsString := vPrevCheg2;
    buscas.ParamByName('NOVAORDEM').AsInteger := vOrdem2;
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := ' update fila_reserva_veic set ordem = :novaordem, prev_cheg = :prev_cheg ' +
     ' where ordem = :ordem and codigo = :codigo and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('CODIGO').AsInteger := vCodigo2;
    buscas.ParamByName('ORDEM').AsInteger := vOrdem2;
    buscas.ParamByName('PREV_CHEG').AsString := vPrevCheg1;
    buscas.ParamByName('NOVAORDEM').AsInteger := vOrdem1;
    buscas.ExecSQL;

    Result := True;
  except
    on e: exception do
     begin
       Application.MessageBox(Pchar('Não foi possível ordenar para baixo: TFilaVeiculos.OrdenarDownGrid!' + #13 +
        'Erro: ' + e.Message)  , 'Atenção', 64);
       registraErro(e.Message); 
       Result := False;
     end;
  end;

  dataSet.Refresh;
end;

function TFilaVeiculos.OrdenarUpGrid: boolean;
var
  vOrdem1, vOrdem2, vCodigo1, vCodigo2, vCodVend1, vCodVend2: Integer;
  vMens, vPrevCheg1, vPrevCheg2: string;
  vCod: Integer;
begin
  Result := False;

  vCod :=  dataSet.FieldByName('CODIGO').AsInteger;
  vMens := 'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
   '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
   '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
   '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
   '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
   '/ORDEM ' + IntToStr(dataSet.FieldByName('ORDEM').AsInteger);

  if not vDadosIni.PesqPros('VEI142', 'ORDENAR_CIMA', vMens, 'FILA_RESERVA_VEIC',
   IntToStr(vCod), buscas, true) then
    Exit;

  if dataSet.RecordCount <= 0 then
  begin
    Application.MessageBox('Nenhum registro selecionado!', 'Atenção', MB_ICONWARNING + MB_OK);
    Exit;
  end
  else if dataSet.RecordCount = 1 then
  begin
   Application.MessageBox('Registro selecionado é o primeiro da lista!', 'Atenção', MB_ICONWARNING + MB_OK);
   Exit;
  end;

  if dataSet.RecNo = 1 then
  begin
   Application.MessageBox('Registro selecionado é o primeiro da lista!', 'Atenção', MB_ICONWARNING + MB_OK);
   Exit;
  end;

  vOrdem1 := dataSet.FieldByName('ORDEM').AsInteger;
  vCodigo1 := dataSet.FieldByName('CODIGO').AsInteger;
  vPrevCheg1 := dataSet.FieldByName('PREV_CHEG').AsString;
  vCodVend1 := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
  dataSet.Prior;
  vOrdem2 := dataSet.FieldByName('ORDEM').AsInteger;
  vCodigo2 := dataSet.FieldByName('CODIGO').AsInteger;
  vPrevCheg2 := dataSet.FieldByName('PREV_CHEG').AsString;
  vCodVend2 := dataSet.FieldByName('COD_VENDEDOR').AsInteger;

  if (vCodVend2 > 0) and (vCodVend2 <> vDadosIni.vCodUsuario) then
  begin
    if not vDadosIni.PesqPros('VEI161', 'ALTERAR', vMens, 'FILA_RESERVA_VEIC',
      '', buscas, true) then
    begin
      Application.MessageBox('Somente o vendedor que se encontra à frente pode alterar a ordem da fila.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;
  end;

  try
    buscas.Close;
    buscas.SQL.Text := ' update fila_reserva_veic set ordem = :novaordem, prev_cheg = :prev_cheg ' +
    ' where ordem = :ordem and codigo = :codigo and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('CODIGO').AsInteger := vCodigo1;
    buscas.ParamByName('ORDEM').AsInteger := vOrdem1;
    buscas.ParamByName('PREV_CHEG').AsString := vPrevCheg2;
    buscas.ParamByName('NOVAORDEM').AsInteger := vOrdem2;
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := ' update fila_reserva_veic set ordem = :novaordem, prev_cheg = :prev_cheg ' +
     ' where ordem = :ordem and codigo = :codigo and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('CODIGO').AsInteger := vCodigo2;
    buscas.ParamByName('ORDEM').AsInteger := vOrdem2;
    buscas.ParamByName('PREV_CHEG').AsString := vPrevCheg1;
    buscas.ParamByName('NOVAORDEM').AsInteger := vOrdem1;
    buscas.ExecSQL;

    Result := True;
  except
     on e: exception do
     begin
       Application.MessageBox(Pchar('Não foi possível ordenar para cima: TFilaVeiculos.OrdenarUpGrid!' + #13 +
        'Erro: ' + e.Message), 'Atenção', 64);
       registraErro(e.Message);
       Result := False;
     end;
  end;

  dataSet.Refresh;
end;

function TFilaVeiculos.TrocarVendedores: boolean;
var
  vOrdem1, vOrdem2, vCodigo1, vCodigo2, vCodEst1, vCodEst2, vCodVend1, vCodVend2: Integer;
  vPosicao1, vPosicao2: string;
  vDataRes1, vDataRes2, vHoraVenc1, vHoraVenc2: Variant;
  vRegistro: Integer;
  buscas1, buscas2, buscas3: TIBQuery;
  vTipoRes, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia: Variant;
  vDataBanco: TDateTime;
  vHoraBanco: string;
  vMens: string;
begin
  Result := False;

  buscas1 := TIBQuery.Create(Application);
  buscas1.Database := buscas.Database;
  buscas1.Transaction := buscas.Transaction;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas3 := TIBQuery.Create(Application);
  buscas3.Database := buscas.Database;
  buscas3.Transaction := buscas.Transaction;

  vDataBanco := vDadosIni.getDataBanco(buscas1);
  vHoraBanco := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas1));

  vMens := 'MOD ' + IntToStr(dataSet.FieldByName('COD_MODELO').AsInteger) +
    '/FAB ' + IntToStr(dataSet.FieldByName('ANO_FAB').AsInteger) +
    '/MOD ' + IntToStr(dataSet.FieldByName('ANO_MOD').AsInteger) +
    '/COR ' + IntToStr(dataSet.FieldByName('COD_COR').AsInteger) +
    '/VEND ' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
    '/ORDEM ' + IntToStr(dataSet.FieldByName('ORDEM').AsInteger);

  if not vDadosIni.PesqPros('VEI144', 'TROCAR', vMens, 'FILA_RESERVA_VEIC',
   '', buscas, true) then
    Exit;

  if dataSet.RecordCount <= 0 then
  begin
    Application.MessageBox('Nenhum registro selecionado!', 'Atenção', MB_ICONWARNING + MB_OK);
    Exit;
  end;

  vRegistro := 0;
  dataSet.First;
  while not dataSet.Eof do
  begin
   if dataSet.FieldByName('SEL').AsString = 'S' then
    vRegistro := vRegistro + 1;
   dataSet.Next;
  end;

  if vRegistro <> 2 then
  begin
   if vRegistro < 2 then   
     Application.MessageBox('Favor selecionar dois registros!', 'Atenção', MB_ICONWARNING + MB_OK)
   else
     Application.MessageBox('Favor selecionar somente dois registros!', 'Atenção', MB_ICONWARNING + MB_OK);
   Exit;
  end;

  vRegistro := 0;
  dataSet.First;
  while not dataSet.Eof do
  begin
   if dataSet.FieldByName('SEL').AsString = 'S' then
   begin
     vRegistro := vRegistro + 1;
     if vRegistro = 1 then
     begin
        vOrdem1 := dataSet.FieldByName('ORDEM').AsInteger;
        vCodigo1 := dataSet.FieldByName('CODIGO').AsInteger;
        vCodEst1 := dataSet.FieldByName('COD_ESTMOTO').AsInteger;
        vCodVend1 := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
        vPosicao1 := dataSet.FieldByName('POSICAO').AsString;
        vDataRes1 := dataSet.FieldByName('DATA_RES').AsDateTime;
        vHoraVenc1 := dataSet.FieldByName('HORA_RES').AsString;
     end
     else
     begin
        vOrdem2 := dataSet.FieldByName('ORDEM').AsInteger;
        vCodigo2 := dataSet.FieldByName('CODIGO').AsInteger;
        vCodEst2 := dataSet.FieldByName('COD_ESTMOTO').AsInteger;
        vCodVend2 := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
        vPosicao2 := dataSet.FieldByName('POSICAO').AsString;
        vDataRes2 := dataSet.FieldByName('DATA_RES').AsDateTime;
        vHoraVenc2 := dataSet.FieldByName('HORA_RES').AsString;
     end;
   end;
   dataSet.Next;
  end;

  if (vCodVend1 > 0) and (vCodVend1 <> vDadosIni.vCodUsuario) then
  begin
    if not vDadosIni.PesqPros('VEI161', 'ALTERAR', vMens, 'FILA_RESERVA_VEIC',
      '', buscas, true) then
    begin
      Application.MessageBox('Somente o vendedor que se encontra à frente pode realizar a troca entre vendedores.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;
  end;
  try
    try
       vDadosIni.abreStatusProcessamento('', 'Alterando vendedores');
       buscas1.Close;
       if vCodEst1 > 0 then
       begin
         buscas1.SQL.Text := ' select * from est_moto ' +
          ' where codigo = :codigo and cod_empresa = ' + vDadosIni.codEmpresa;
         buscas1.ParamByName('CODIGO').AsInteger := vCodEst1;
       end
       else
       begin
         buscas1.SQL.Text := ' select ''FILA'' POSICAO, f.* from fila_reserva_veic f ' +
           ' where f.codigo = :codigo and f.cod_empresa = ' + vDadosIni.codEmpresa;
         buscas1.ParamByName('CODIGO').AsInteger := vCodigo1;
       end;
       buscas1.Open;

       buscas2.Close;
       if vCodEst2 > 0 then
       begin
         buscas2.SQL.Text := ' select * from est_moto ' +
          ' where codigo = :codigo and cod_empresa = ' + vDadosIni.codEmpresa;
         buscas2.ParamByName('CODIGO').AsInteger := vCodEst2;
       end
       else
       begin
         buscas2.SQL.Text := ' select ''FILA'' POSICAO, f.*  from fila_reserva_veic f ' +
          ' where f.codigo = :codigo and f.cod_empresa = ' + vDadosIni.codEmpresa;
         buscas2.ParamByName('CODIGO').AsInteger := vCodigo2;
       end;
       buscas2.Open;

       if not buscas1.IsEmpty then
       begin
         buscas.Close;
         if vCodEst2 > 0 then
           buscas.SQL.Text := ' update est_moto ' +
            ' set status_res = :status_res, cod_cliente = :cod_cliente, nome_res = :nome_res, ' +
            ' fone_res = :fone_res, vendedor_res = :vendedor_res, ' +
            ' tipo_res = :tipo_res, sit_res = :sit_res, obs_res = :obs_res,' +
            ' data_res = :data_res, hora_res = :hora_res, ' +
            ' grupo_cota_rd = :grupo_cota_rd, data_assembleia = :data_assembleia, ' +
            ' data_venc_res = :data_venc_res, hora_venc_res = :hora_venc_res, ' +
            ' tipo_res_old = :tipo_res_old, ' +
            ' data_assembleia_old = :data_assembleia_old, grupo_cota_rd_old = :grupo_cota_rd_old, ' +
            ' data_venc_res_old = :data_venc_res_old, hora_venc_res_old = :hora_venc_res_old, ' +
            ' data_res_old = :data_res_old, hora_res_old = :hora_res_old ' +
            ' where codigo = :codigo and cod_empresa = :cod_empresa '
         else
           buscas.SQL.Text := ' update fila_reserva_veic ' +
            ' set cod_cliente = :cod_cliente, nome_res = :nome_res, ' +
            ' fone_res = :fone_res, cod_vendedor = :vendedor_res, ' +
            ' tipo_res = :tipo_res, sit_res = :sit_res, obs_res = :obs_res, ' +
            ' data_res = :data_res, hora_res = :hora_res, ' +
            ' grupo_cota_rd = :grupo_cota_rd, data_assembleia = :data_assembleia, ' +
            ' data_venc_res = :data_venc_res, hora_venc_res = :hora_venc_res ' +
            ' where codigo = :codigo and cod_empresa = :cod_empresa ';
         buscas.ParamByName('COD_CLIENTE').AsInteger := buscas1.FieldByName('COD_CLIENTE').AsInteger;
         buscas.ParamByName('NOME_RES').AsString := buscas1.FieldByName('NOME_RES').AsString;
         buscas.ParamByName('FONE_RES').AsString := buscas1.FieldByName('FONE_RES').AsString;
         if ((vCodEst2 > 0) and (vCodEst1 = 0)) or ((vCodEst2 = 0) and (vCodEst1 = 0)) then 
           buscas.ParamByName('VENDEDOR_RES').AsInteger := buscas1.FieldByName('COD_VENDEDOR').AsInteger
         else
           buscas.ParamByName('VENDEDOR_RES').AsInteger := buscas1.FieldByName('VENDEDOR_RES').AsInteger;
         buscas.ParamByName('TIPO_RES').AsString := buscas1.FieldByName('TIPO_RES').AsString;
         buscas.ParamByName('SIT_RES').AsString := buscas1.FieldByName('SIT_RES').AsString;
         buscas.ParamByName('OBS_RES').AsString := buscas1.FieldByName('OBS_RES').AsString;
         buscas.ParamByName('DATA_RES').Value := buscas1.FieldByName('DATA_RES').Value;
         buscas.ParamByName('HORA_RES').AsString := buscas1.FieldByName('HORA_RES').AsString;
         buscas.ParamByName('GRUPO_COTA_RD').AsString := buscas1.FieldByName('GRUPO_COTA_RD').AsString;
         buscas.ParamByName('DATA_ASSEMBLEIA').Value := buscas1.FieldByName('DATA_ASSEMBLEIA').Value;
         if (vCodEst2 > 0) and (trim(vPosicao2) <> 'TRANSITO') 
         	and (vCodEst1 > 0) and (trim(vPosicao1) <> 'TRANSITO') then // Colocar data de vencimento
         begin
           buscas.ParamByName('STATUS_RES').AsString := buscas1.FieldByName('STATUS_RES').AsString;
           buscas.ParamByName('DATA_VENC_RES').Value := buscas1.FieldByName('DATA_VENC_RES').Value;
           buscas.ParamByName('HORA_VENC_RES').Value := buscas1.FieldByName('HORA_VENC_RES').Value;
           buscas.ParamByName('TIPO_RES_OLD').AsString := buscas1.FieldByName('TIPO_RES_OLD').AsString;
           buscas.ParamByName('DATA_ASSEMBLEIA_OLD').Value := buscas1.FieldByName('DATA_ASSEMBLEIA_OLD').Value;
           buscas.ParamByName('GRUPO_COTA_RD_OLD').AsString := buscas1.FieldByName('GRUPO_COTA_RD_OLD').AsString;
           buscas.ParamByName('DATA_VENC_RES_OLD').Value := buscas1.FieldByName('DATA_VENC_RES_OLD').Value;
           buscas.ParamByName('HORA_VENC_RES_OLD').Value := buscas1.FieldByName('HORA_VENC_RES_OLD').Value;
           buscas.ParamByName('DATA_RES_OLD').Value := buscas1.FieldByName('DATA_RES_OLD').Value;
           buscas.ParamByName('HORA_RES_OLD').Value := buscas1.FieldByName('HORA_RES_OLD').Value;
         end
         else
         begin
           vDadosIni.RetornaDataHoraVenc(buscas3,
           vPosicao2, //Status veículo
           buscas1.FieldByName('TIPO_RES').AsString,
           buscas1.FieldByName('GRUPO_COTA_RD').AsString,
					 vDadosIni.IfThen(Trim(vDataRes1) = '', vDataBanco, vDataRes1),
					 vDadosIni.IfThen(Trim(vDataRes1) = '', vHoraBanco, vHoraVenc1),
           buscas1.FieldByName('DATA_ASSEMBLEIA').AsDateTime,
           vTipoRes, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia);

           if (vDataBanco > vDataVenc) then
           begin
             vDadosIni.RetornaDataHoraVenc(buscas3,
             vPosicao2, //Status veículo
             buscas1.FieldByName('TIPO_RES').AsString,
             buscas1.FieldByName('GRUPO_COTA_RD').AsString,
					   vDataBanco,
					   vHoraBanco,
             buscas1.FieldByName('DATA_ASSEMBLEIA').AsDateTime,
             vTipoRes, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia);

             buscas.ParamByName('DATA_RES').Value :=
               vDadosIni.IfThen(buscas.ParamByName('DATA_RES').IsNull, Null, vDataBanco);
             buscas.ParamByName('HORA_RES').AsString :=
              vDadosIni.IfThen(buscas.ParamByName('HORA_RES').IsNull, Null, vHoraBanco);
             buscas.ParamByName('DATA_VENC_RES').Value := vDataVenc;
             buscas.ParamByName('HORA_VENC_RES').Value := vHoraVenc;
           end
           else
           begin
          	 buscas.ParamByName('DATA_RES').Value :=
              vDadosIni.IfThen(buscas.ParamByName('DATA_RES').IsNull, Null, vDadosIni.IfThen(Trim(vDataRes1) = '', vDataBanco, vDataRes1));
             buscas.ParamByName('HORA_RES').AsString :=
              vDadosIni.IfThen(buscas.ParamByName('HORA_RES').IsNull, Null, vDadosIni.IfThen(Trim(vDataRes1) = '', vHoraBanco, vHoraVenc1));
             buscas.ParamByName('DATA_VENC_RES').Value := vDataVenc;
             buscas.ParamByName('HORA_VENC_RES').Value := vHoraVenc;
           end;
           if (trim(vPosicao2) <> 'FILA') then
           	buscas.ParamByName('STATUS_RES').AsString := vDadosIni.IfThen(buscas.ParamByName('DATA_RES').IsNull, 'N', 'S');
         end;
//         end;
         if vCodEst2 > 0 then
           buscas.ParamByName('CODIGO').AsInteger := vCodEst2
         else
           buscas.ParamByName('CODIGO').AsInteger := vCodigo2;
         buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
         buscas.ExecSQL;
       end;

       if not buscas2.IsEmpty then
       begin
         buscas.Close;
         if vCodEst1 > 0 then
          buscas.SQL.Text := ' update est_moto ' +
            ' set status_res = :status_res, cod_cliente = :cod_cliente, nome_res = :nome_res, ' +
            ' fone_res = :fone_res, vendedor_res = :vendedor_res, ' +
            ' tipo_res = :tipo_res, sit_res = :sit_res, obs_res = :obs_res,' +
            ' data_res = :data_res, hora_res = :hora_res, ' +
            ' grupo_cota_rd = :grupo_cota_rd, data_assembleia = :data_assembleia, ' +
            ' data_venc_res = :data_venc_res, hora_venc_res = :hora_venc_res, ' +
            ' tipo_res_old = :tipo_res_old, ' +
            ' data_assembleia_old = :data_assembleia_old, grupo_cota_rd_old = :grupo_cota_rd_old, ' +
            ' data_venc_res_old = :data_venc_res_old, hora_venc_res_old = :hora_venc_res_old, ' +
            ' data_res_old = :data_res_old, hora_res_old = :hora_res_old ' +
            ' where codigo = :codigo and cod_empresa = :cod_empresa '
         else
            buscas.SQL.Text := ' update fila_reserva_veic ' +
            ' set cod_cliente = :cod_cliente, nome_res = :nome_res, ' +
            ' fone_res = :fone_res, cod_vendedor = :vendedor_res, ' +
            ' tipo_res = :tipo_res, sit_res = :sit_res, obs_res = :obs_res, ' +
            ' data_res = :data_res, hora_res = :hora_res, ' +
            ' grupo_cota_rd = :grupo_cota_rd, data_assembleia = :data_assembleia, ' +
            ' data_venc_res = :data_venc_res, hora_venc_res = :hora_venc_res ' +
            ' where codigo = :codigo and cod_empresa = :cod_empresa ';
         buscas.ParamByName('COD_CLIENTE').AsInteger := buscas2.FieldByName('COD_CLIENTE').AsInteger;
         buscas.ParamByName('NOME_RES').AsString := buscas2.FieldByName('NOME_RES').AsString;
         buscas.ParamByName('FONE_RES').AsString := buscas2.FieldByName('FONE_RES').AsString;
         if ((vCodEst1 > 0) and (vCodEst2 = 0)) or ((vCodEst1 = 0) and (vCodEst2 = 0)) then
           buscas.ParamByName('VENDEDOR_RES').AsInteger := buscas2.FieldByName('COD_VENDEDOR').AsInteger
         else
           buscas.ParamByName('VENDEDOR_RES').AsInteger := buscas2.FieldByName('VENDEDOR_RES').AsInteger;
         buscas.ParamByName('TIPO_RES').AsString := buscas2.FieldByName('TIPO_RES').AsString;
         buscas.ParamByName('SIT_RES').AsString := buscas2.FieldByName('SIT_RES').AsString;
         buscas.ParamByName('OBS_RES').AsString := buscas2.FieldByName('OBS_RES').AsString;
         buscas.ParamByName('DATA_RES').Value := buscas2.FieldByName('DATA_RES').Value;
         buscas.ParamByName('HORA_RES').AsString := buscas2.FieldByName('HORA_RES').AsString;
         buscas.ParamByName('GRUPO_COTA_RD').AsString := buscas2.FieldByName('GRUPO_COTA_RD').AsString;
         buscas.ParamByName('DATA_ASSEMBLEIA').Value := buscas2.FieldByName('DATA_ASSEMBLEIA').Value;
         if (vCodEst1 > 0) and (trim(vPosicao1) <> 'TRANSITO') 
	         and (vCodEst2 > 0) and (trim(vPosicao2) <> 'TRANSITO') then // Colocar data de vencimento
         begin
           buscas.ParamByName('STATUS_RES').AsString := buscas2.FieldByName('STATUS_RES').AsString;
           buscas.ParamByName('DATA_VENC_RES').Value := buscas2.FieldByName('DATA_VENC_RES').Value;
           buscas.ParamByName('HORA_VENC_RES').Value := buscas2.FieldByName('HORA_VENC_RES').Value;
           buscas.ParamByName('TIPO_RES_OLD').AsString := buscas2.FieldByName('TIPO_RES_OLD').AsString;
           buscas.ParamByName('DATA_ASSEMBLEIA_OLD').Value := buscas2.FieldByName('DATA_ASSEMBLEIA_OLD').Value;
           buscas.ParamByName('GRUPO_COTA_RD_OLD').AsString := buscas2.FieldByName('GRUPO_COTA_RD_OLD').AsString;
           buscas.ParamByName('DATA_VENC_RES_OLD').Value := buscas2.FieldByName('DATA_VENC_RES_OLD').Value;
           buscas.ParamByName('HORA_VENC_RES_OLD').Value := buscas2.FieldByName('HORA_VENC_RES_OLD').Value;
           buscas.ParamByName('DATA_RES_OLD').Value := buscas2.FieldByName('DATA_RES_OLD').Value;
           buscas.ParamByName('HORA_RES_OLD').Value := buscas2.FieldByName('HORA_RES_OLD').Value;
         end
         else
         begin
           vDadosIni.RetornaDataHoraVenc(buscas3,
           vPosicao1, //Status veículo
           buscas2.FieldByName('TIPO_RES').AsString,
           buscas2.FieldByName('GRUPO_COTA_RD').AsString,
           vDadosIni.IfThen(Trim(vDataRes2) = '', vDataBanco, vDataRes2),
           vDadosIni.IfThen(Trim(vDataRes2) = '', vHoraBanco, vHoraVenc2),
           buscas2.FieldByName('DATA_ASSEMBLEIA').AsDateTime,
           vTipoRes, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia);

           if (vDataBanco > vDataVenc) then
           begin
              vDadosIni.RetornaDataHoraVenc(buscas3,
              vPosicao1, //Status veículo
              buscas2.FieldByName('TIPO_RES').AsString,
              buscas2.FieldByName('GRUPO_COTA_RD').AsString,
              vDataBanco,
	            vHoraBanco,
              buscas2.FieldByName('DATA_ASSEMBLEIA').AsDateTime,
              vTipoRes, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia);

              buscas.ParamByName('DATA_RES').Value :=
             	 vDadosIni.IfThen(buscas.ParamByName('DATA_RES').IsNull, Null, vDataBanco);
              buscas.ParamByName('HORA_RES').AsString :=
           	 	 vDadosIni.IfThen(buscas.ParamByName('HORA_RES').IsNull, Null, vHoraBanco);
           	  buscas.ParamByName('DATA_VENC_RES').Value := vDataVenc;
              buscas.ParamByName('HORA_VENC_RES').Value := vHoraVenc;
           end
           else
           begin
             buscas.ParamByName('DATA_RES').Value :=
              vDadosIni.IfThen(buscas.ParamByName('DATA_RES').IsNull, Null, vDadosIni.IfThen(Trim(vDataRes2) = '', vDataBanco, vDataRes2));
             buscas.ParamByName('HORA_RES').AsString :=
              vDadosIni.IfThen(buscas.ParamByName('HORA_RES').IsNull, Null, vDadosIni.IfThen(Trim(vDataRes2) = '', vHoraBanco, vHoraVenc2));
             buscas.ParamByName('DATA_VENC_RES').Value := vDataVenc;
             buscas.ParamByName('HORA_VENC_RES').Value := vHoraVenc;
           end;
           if (trim(vPosicao1) <> 'FILA') then
           	buscas.ParamByName('STATUS_RES').AsString := vDadosIni.IfThen(buscas.ParamByName('DATA_RES').IsNull, 'N', 'S');
         end;
//         end;
         if vCodEst1 > 0 then
           buscas.ParamByName('CODIGO').AsInteger := vCodEst1
         else
           buscas.ParamByName('CODIGO').AsInteger := vCodigo1;
         buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
         buscas.ExecSQL;
       end;
     Result := True;
     CommitaTransacao;
     vDadosIni.GravaAuditoria('VEI144', 'TROCAR VENDEDOR', 'SUCESSO', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas);
    except
      on e: exception do
      begin
        Application.MessageBox(Pchar('Não foi possível trocar vendedores: TFilaVeiculos.TrocarVendedores!' + #13 +
         'Erro: ' + e.Message), 'Atenção', 64);
        registraErro(e.Message);
        RollBackTransacao;
        vDadosIni.GravaAuditoria('VEI144', 'TROCAR VENDEDOR', 'FALHA', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas);
        Result := False;
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
  dataSet.Refresh;
end;

function TFilaVeiculos.verificarRegistro: boolean;
var
 vCodigo: Integer;
begin
  Result := True;

  vCodigo := dataSet.FieldByName('CODIGO').AsInteger;
  try
    dataSet.RefreshRecord;
    if vCodigo <> dataSet.FieldByName('CODIGO').AsInteger then
    begin
      Result := False;
      Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão Procurar e verifique',
        'Atenção', 0 + 64);
      Exit;
    end;

  except on E: Exception do
    begin
      if Pos('changed by another user', e.Message) > 0 then
      begin
        Result := False;
        Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
          'Atenção', 0 + 64);
        Exit;
      end;
    end;
  end;
end;

function TFilaVeiculos.consulta: boolean;
var
  I, erro: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCampoTemp, vCampoTempAd, vCondicaoTmp, vCondicaoTmpAd: string;
begin
  try
    if UpperCase(trim(vCons.campo)) = 'TODOS' then
      vCons.porData := False;

    if not vCons.adicional then
    begin
     vCons.campoAd := '';
     vCons.valorAd := '';
     vCons.condicaoAd := '';
     vCons.porDataAd := false;
     vCons.dataIniAd := '';
     vCons.dataFimAd := '';
    end;
    
  	if UpperCase(trim(vCons.campo)) = 'PLACA' then
  		vCampoTemp := 'FILA_VEICULOS.PLACA';
    if UpperCase(trim(vCons.campoAd)) = 'PLACA' then
    	vCampoTempAd := 'FILA_VEICULOS.PLACA';

    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
        exit;  
      end;
    end; //porData
    vsqlAdicional := '';

    if Trim(vCampoTemp) <> '' then
    begin
      vCondicaoTmp := vCons.Condicao;
      if vCondicaoTmp = 'Igual' then
        vCondicaoTmp := '='
      else if vCondicaoTmp = 'Maior' then
        vCondicaoTmp := '>'
      else if vCondicaoTmp = 'Maior ou Igual' then
        vCondicaoTmp := '>='
      else if vCondicaoTmp = 'Menor' then
        vCondicaoTmp := '<'
      else if vCondicaoTmp = 'Menor ou Igual' then
        vCondicaoTmp := '<='
      else if vCondicaoTmp = 'Diferente' then
        vCondicaoTmp := '<>'
      else if (vCondicaoTmp = 'Esta contido') then
        vCondicaoTmp := 'like'
      else if (vCondicaoTmp = 'Começa') then
        vCondicaoTmp := 'Começa'
      else
        vCondicaoTmp := '=';
      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmp = 'like' then
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%') + ') ' +
          	' or (' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%');
      end
      else if vCondicaoTmp = 'Começa' then
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%') + ') ' +
          	' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))  + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%');
      end
      else
      begin
      	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor))) + ') ' +
          	' or ' + ' (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' +QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))) + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor)));
      end;
      vCons.valor := '';
      vCons.campo := '';
      vCons.ordem := vCampoTemp;
    end;

    if Trim(vCampoTempAd) <> '' then
    begin
      vCondicaoTmpAd := vCons.CondicaoAd;
      if vCondicaoTmpAd = 'Igual' then
        vCondicaoTmpAd := '='
      else if vCondicaoTmpAd = 'Maior' then
        vCondicaoTmpAd := '>'
      else if vCondicaoTmpAd = 'Maior ou Igual' then
        vCondicaoTmpAd := '>='
      else if vCondicaoTmpAd = 'Menor' then
        vCondicaoTmpAd := '<'
      else if vCondicaoTmpAd = 'Menor ou Igual' then
        vCondicaoTmpAd := '<='
      else if vCondicaoTmpAd = 'Diferente' then
        vCondicaoTmpAd := '<>'
      else if (vCondicaoTmpAd = 'Esta contido') then
        vCondicaoTmpAd := 'like'
      else if (vCondicaoTmpAd = 'Começa') then
        vCondicaoTmpAd := 'Começa'
      else
        vCondicaoTmpAd := '=';

      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmpAd = 'like' then
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
          	' or (' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%');
      end
      else if vCondicaoTmpAd = 'Começa' then
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%') + ') ' +
          	' or (' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd))) + '%') + ')) '
        else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%');
      end
      else
      begin
      	if (UpperCase(trim(vCons.campoAd)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)) <> trim(vCons.valorAd)) then
        	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd))) + ') ' +
          	' or (' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valorAd)))) + ')) '
      	else
	        vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
      end;
      vCons.valorAd := '';
      vCons.campoAd := '';
    end;

    if vCons.adicional then
    begin
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
          erro := erro + 1;
        end;
        if erro = 2 then
        begin
          Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
            'Atenção', MB_OK + MB_ICONINFORMATION);
        end
        else
        begin
          if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
            formatodata := 'mm/dd/yyyy'
          else if pos('.', ShortDateFormat) <> 0 then
            formatodata := 'dd.mm.yyyy';
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end;
      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Maior ou Igual' then
        vCons.condicaoAd := '>='
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Menor ou Igual' then
        vCons.condicaoAd := '<='
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';
      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            vCons.campoAd := DataSet.Fields[I].FieldName;
            if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
              ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
            begin
              try
                vCons.condicaoAd := '=';
                if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                  vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)))
                else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                  vCons.valorAd := FloatToStr(StrToFloat(Trim(vCons.valorAd)))
              except
                vCons.valorAd := '0';
                Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
              end;
            end
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
            begin
            	if trim(vsqlAdicional) <> '' then
				       vsqlAdicional := vsqlAdicional + ' and ';

              if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' FILA_VEICULOS.' + vCons.campoAd + ' >= ' + vCons.dataIniAd
                  +
                  ' and ' +
                  vCons.campoAd + ' <= ' + vCons.dataFimAd
              else if (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' FILA_VEICULOS.' + vCons.campoAd + ' <= ' + vCons.dataFimAd
              else if (vCons.dataIniAd <> '') then
                vsqlAdicional := vsqlAdicional + ' FILA_VEICULOS.' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
              Break;
            end;
            if trim(vsqlAdicional) <> '' then
			       vsqlAdicional := vsqlAdicional + ' and ';
             
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + ' FILA_VEICULOS.' + vCons.campoAd + ' like ' + QuotedStr('%' +
                vCons.valorAd +
                '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + ' FILA_VEICULOS.' + vCons.campoAd + ' like ' +
                QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + ' FILA_VEICULOS.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' '
                +
                QuotedStr(vCons.valorAd);
            Break;
          end;
        end;
      end;
    end; //adicional

  if (vCons.novo) <> (vCons.usado) then
  begin
    if (trim(vsqlAdicional) <> '') then
      vsqlAdicional := vsqlAdicional + ' and ';
    if vCons.novo then
      vsqlAdicional := vsqlAdicional + ' (FILA_VEICULOS.STATUS_USO <> ' + QuotedStr('U')+ ')'
    else
      vsqlAdicional := vsqlAdicional + ' (FILA_VEICULOS.STATUS_USO <> ' + QuotedStr('N')+ ')'
  end;
  if not vCons.deposito then
  begin
    if (trim(vsqlAdicional) <> '') or ((vCons.novo) <> (vCons.usado)) then
      vsqlAdicional := vsqlAdicional + ' and ';
    vsqlAdicional := vsqlAdicional + ' (TRIM(COALESCE(FILA_VEICULOS.TPV, ''''))  <> ''DEPOSITO'') ';
  end;

  if trim(vDadosIni.vEmp.vSqlOrdemFilaRes) = '' then
    vCons.ordem := ' FILA_VEICULOS.ORDTIPO, FILA_VEICULOS.CILINDRADA, FILA_VEICULOS.DESCRICAO, ' +
       ' FILA_VEICULOS.ANO_FAB, FILA_VEICULOS.ANO_MOD, FILA_VEICULOS.DESCRICAO_COR, ' +
       ' FILA_VEICULOS.ORDEM_TPV, FILA_VEICULOS.DATA_CH_NOTA, FILA_VEICULOS.DATA_TRANS_NOTA, ' +
       ' FILA_VEICULOS.ORDEM, FILA_VEICULOS.COD_ESTMOTO '
  else
    vCons.ordem := vDadosIni.vEmp.vSqlOrdemFilaRes;

  if vCons.porData then
    Result := ConsultaCampos('FILA_VEICULOS', vCons.campo,
     vCons.ordem, vCons.dataIni, vCons.dataFim, vDadosIni.codEmpresa, 1,
     'FILA_VEICULOS.*', '', vsqlAdicional)
  else
    Result := ConsultaCampos('FILA_VEICULOS',  vCons.valor, vCons.campo,
      vCons.condicao, vCons.ordem, true, vDadosIni.codEmpresa,
        'FILA_VEICULOS.*', '', vsqlAdicional);

  finally
  end;
end;

procedure TFilaVeiculos._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  if not (dataSet.State in [dsEdit]) then
    dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

{ TFilaVeiculosReserva }

function TFilaVeiculosReserva.abrirReserva: boolean;
var
 vFilaRes: TFilaReserva;
 vReservaEst: TReservaEstMotoCCIA;
begin
  if dataSet.IsEmpty then
    exit;
  if trim(dataSet.FieldByName('TPV').AsString) = 'FILA' then
  begin
    vFilaRes := TFilaReserva.create;
    try
      if not vFilaRes.abreFormFilaReserva(dataSet.FieldByName('CODIGO').AsString) then
      	exit;
    finally
      vFilaRes.Free;
    end;
  end
  else
  begin
    vReservaEst := TReservaEstMotoCCIA.create;
    try
      if not vReservaEst.abreFormReserva(
      	1,
        dataSet.FieldByName('COD_ESTMOTO').AsInteger,
        dataSet.FieldByName('COD_EMPRESA').AsInteger,
        dataSet.FieldByName('CHASSI_C').AsString) then
          exit;
    finally
      vReservaEst.Free;
    end;
  end;
end;

function TFilaVeiculosReserva.BuscaReservaVencendo: boolean;
begin
  dataSet.Close;
  dataSet.CommandText:= ' SELECT FILA_VEICULOS.*, CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE FILA_VEICULOS.NOME_RES END CLIENTE FROM FILA_VEICULOS ' +
 		' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = FILA_VEICULOS.COD_CLIENTE AND CL.COD_EMPRESA = FILA_VEICULOS.COD_EMPRESA ' +
    ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = FILA_VEICULOS.TIPO_RES ' +
    ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = FILA_VEICULOS.COD_EMPRESA ' +
    ' WHERE RES.TIPO_RES IN (''V'', ''C'', ''B'', ''M'') ' +
    ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
    ' AND FILA_VEICULOS.STATUS_RES = ''S'' AND FILA_VEICULOS.DATA_VENC_RES IS NOT NULL ' +
    ' AND ((DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(FILA_VEICULOS.HORA_VENC_RES AS TIME)), FILA_VEICULOS.DATA_VENC_RES)) ' +
    ' - CAST(:DATA_ATUAL AS TIMESTAMP) < COALESCE(RES.MENSAGEM_VENC_DIAS, 0)) ' +
    ' AND (COALESCE(RES.MENSAGEM_VENC_DIAS, 0) > 0) AND FILA_VEICULOS.COD_VENDEDOR = :COD_VENDEDOR ' +
    ' AND FILA_VEICULOS.COD_EMPRESA = :COD_EMPRESA ' +
    ' UNION ' +
    ' SELECT FILA_VEICULOS.*, CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE FILA_VEICULOS.NOME_RES END CLIENTE FROM FILA_VEICULOS ' +
    ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = FILA_VEICULOS.COD_CLIENTE AND CL.COD_EMPRESA = FILA_VEICULOS.COD_EMPRESA ' +
    ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.TIPO_RES = SUBSTRING(TRIM(FILA_VEICULOS.POSICAO) FROM 1 FOR 1) ' +
    ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = FILA_VEICULOS.COD_EMPRESA ' +
    ' WHERE FILA_VEICULOS.POSICAO IN (''TRANSITO'', ''FILA'') ' +
    ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
    ' AND FILA_VEICULOS.DATA_VENC_RES IS NOT NULL ' +
    ' AND ((DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(FILA_VEICULOS.HORA_VENC_RES AS TIME)), FILA_VEICULOS.DATA_VENC_RES)) ' +
    ' - CAST(:DATA_ATUAL AS TIMESTAMP) < COALESCE(RES.MENSAGEM_VENC_DIAS, 0)) ' +
    ' AND (COALESCE(RES.MENSAGEM_VENC_DIAS, 0) > 0) AND FILA_VEICULOS.COD_VENDEDOR = :COD_VENDEDOR ' +
    ' AND FILA_VEICULOS.COD_EMPRESA = :COD_EMPRESA ';
  dataSet.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);  
  dataSet.Params.ParamByName('DATA_ATUAL').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
  dataSet.Params.ParamByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
  dataSet.Open;

  Result := not dataSet.IsEmpty;
end;

function TFilaVeiculosReserva.BuscaReservaVencidas: boolean;
begin
  dataSet.Close;
  dataSet.CommandText:= ' SELECT FILA_VEICULOS.*, CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE FILA_VEICULOS.NOME_RES END CLIENTE FROM FILA_VEICULOS ' +
 		' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = FILA_VEICULOS.COD_CLIENTE AND CL.COD_EMPRESA = FILA_VEICULOS.COD_EMPRESA ' +
    ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.SIGLA = FILA_VEICULOS.TIPO_RES ' +
    ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = FILA_VEICULOS.COD_EMPRESA ' +
    ' WHERE RES.TIPO_RES IN (''V'', ''C'', ''B'', ''M'') ' +
    ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
    ' AND FILA_VEICULOS.STATUS_RES = ''S'' AND FILA_VEICULOS.DATA_VENC_RES IS NOT NULL ' +
    ' AND :DATA_ATUAL > DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(FILA_VEICULOS.HORA_VENC_RES AS TIME)), FILA_VEICULOS.DATA_VENC_RES) ' +
    ' AND FILA_VEICULOS.COD_EMPRESA = :COD_EMPRESA ' +
    ' UNION ' +
    ' SELECT FILA_VEICULOS.*, CASE WHEN (CL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE FILA_VEICULOS.NOME_RES END CLIENTE FROM FILA_VEICULOS ' +
    ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = FILA_VEICULOS.COD_CLIENTE AND CL.COD_EMPRESA = FILA_VEICULOS.COD_EMPRESA ' +
    ' INNER JOIN TIPO_RESERVA RES ON RES.TIPO = ''VEI'' AND RES.TIPO_RES = SUBSTRING(TRIM(FILA_VEICULOS.POSICAO) FROM 1 FOR 1) ' +
    ' INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = FILA_VEICULOS.COD_EMPRESA ' +
    ' WHERE FILA_VEICULOS.POSICAO IN (''TRANSITO'', ''FILA'') ' +
    ' AND RES.VISUALIZAR_RESERVAS_VENC = ''S'' ' +
    ' AND FILA_VEICULOS.DATA_VENC_RES IS NOT NULL ' +
    ' AND :DATA_ATUAL > DATEADD(SECOND, DATEDIFF(SECOND, TIME ''00:00:00'', CAST(FILA_VEICULOS.HORA_VENC_RES AS TIME)), FILA_VEICULOS.DATA_VENC_RES) ' +
    ' AND FILA_VEICULOS.COD_EMPRESA = :COD_EMPRESA ';
  dataSet.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.Params.ParamByName('DATA_ATUAL').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
  dataSet.Open;

  Result := not dataSet.IsEmpty;
end;

constructor TFilaVeiculosReserva.create;
begin
 if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  DataSet := TClientDataSet(DtmVeiculosCCIA.cdsFilaVeiculosReserva);
  transacao := TIBTransaction(DtmVeiculosCCIA.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);
end;

function TFilaVeiculosReserva.renovarReservasVencidas(pTodos: boolean = false): boolean;
var
  vFilaRes: TFilaReserva;
  vReservaEst: TReservaEstMotoCCIA;

 function renovarReserva(pTodos: boolean): boolean;
 begin
    Result := false;

  	Application.ProcessMessages;
    if trim(dataSet.FieldByName('POSICAO').AsString) = 'FILA' then
    begin
      if vFilaRes._AbreFilaReserva(dataSet.FieldByName('CODIGO').AsInteger) then
      begin
          vFilaRes.buscarDadosReserva;
          if not vFilaRes.renovarReserva(pTodos) then
            exit;
          Result := true;
      end;
    end
    else
    begin
      if vReservaEst.BuscaVeiculos(dataSet.FieldByName('COD_ESTMOTO').AsInteger, StrToInt(vDadosIni.codEmpresa),
        dataSet.FieldByName('CHASSI_C').AsString) then
      begin
         vReservaEst.buscarDadosReserva;
         if not vReservaEst.RenovarReserva(pTodos) then
           exit;
         Result := true;  
      end;
    end;
 end;

begin
  if pTodos then
	  dataSet.Refresh
  else
  	if not verificarRegistro then
    	exit;  
  if dataSet.IsEmpty then
     Exit;

  try
    vFilaRes := TFilaReserva.create;
    vReservaEst := TReservaEstMotoCCIA.create;
    if pTodos then
	    dataSet.First;
    if not dataSet.IsEmpty then
      vDadosIni.abreStatusProcessamento('', 'Retirando reservas vencidas');

    if pTodos then
    begin
      while not dataSet.Eof do
      begin

        if not renovarReserva(pTodos) then
          exit;

        dataSet.Next;
      end;
    end
    else
    begin
       if not renovarReserva(pTodos) then
        exit;
    end;

    dataSet.Refresh;
    dataSet.First;
  finally
   vDadosIni.fechaStatusProcessamento;
   vFilaRes.Free;
   vReservaEst.Free;
  end;
end;

function TFilaVeiculosReserva.retirarReservasVencidas(pTodos: boolean = false): boolean;
var
 vFilaRes: TFilaReserva;
 vReservaEst: TReservaEstMotoCCIA;

 function retirarReserva: boolean;
 begin
    Result := false;
  	Application.ProcessMessages;
    if trim(dataSet.FieldByName('POSICAO').AsString) = 'FILA' then
    begin
      if vFilaRes._AbreFilaReserva(dataSet.FieldByName('CODIGO').AsInteger) then
      begin
        vFilaRes.buscarDadosReserva;
        if trim(vFilaRes.vRetirarReservaVenc) = 'S' then
        begin
          if not (vFilaRes.dataSet.State in [dsInsert, dsEdit]) then
				    vFilaRes.dataSet.Edit;
          vFilaRes.vCodVendedorOld := vFilaRes.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
          vFilaRes.dataSet.FieldByName('COD_VENDEDOR').AsInteger := 0;
          vFilaRes.atualizarDados;
          if not vFilaRes.Post(pTodos) then
            exit;
        end;
        Result := true;
      end;
    end
    else
    begin
      if vReservaEst.BuscaVeiculos(dataSet.FieldByName('COD_ESTMOTO').AsInteger, StrToInt(vDadosIni.codEmpresa),
        dataSet.FieldByName('CHASSI_C').AsString) then
      begin
          vReservaEst.buscarDadosReserva;
          if trim(vReservaEst.vRetirarReservaVenc) = 'S' then
            if not vReservaEst.RetirarReserva(pTodos, ' VENCIDA') then
              exit;
          Result := true;
      end;
    end;
 end;
begin

  if not dataSet.Active then
  	exit;
  if pTodos then
	  dataSet.Refresh
  else
  	if not verificarRegistro then
    	exit;
  if dataSet.IsEmpty then
     Exit;
     
  try
    vFilaRes := TFilaReserva.create;
    vReservaEst := TReservaEstMotoCCIA.create;
    if pTodos then
	    dataSet.First;
    if not dataSet.IsEmpty then
      vDadosIni.abreStatusProcessamento('', 'Retirando reservas vencidas');

    if pTodos then
    begin
      while not dataSet.Eof do
      begin
        if not retirarReserva then
          exit;

        dataSet.Next;
      end;
    end
    else
    begin
       if not retirarReserva then
        exit;
    end;

    dataSet.Refresh;
    dataSet.First;
  finally
   vDadosIni.fechaStatusProcessamento;
   vFilaRes.Free;
   vReservaEst.Free;
  end;
end;

function TFilaVeiculosReserva.verificarRegistro: boolean;
var
 vCodigo, vCodEstMoto: Integer;
begin
  Result := True;

  vCodigo := dataSet.FieldByName('CODIGO').AsInteger;
  vCodEstMoto := dataSet.FieldByName('COD_ESTMOTO').AsInteger;
  try
    dataSet.RefreshRecord;
    if ((vCodigo <> dataSet.FieldByName('CODIGO').AsInteger)
    	or (vCodEstMoto <> dataSet.FieldByName('COD_ESTMOTO').AsInteger)) then
    begin
      Result := False;
      Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão Procurar e verifique',
        'Atenção', 0 + 64);
      Exit;
    end;

  except on E: Exception do
    begin
      if Pos('changed by another user', e.Message) > 0 then
      begin
        Result := False;
        Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique', 'Atenção', 0 + 64);
        Exit;
      end;
    end;
  end;
end;

end.

