unit uPrincipalS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Menus, Buttons, XPMan, DBClient, Provider, DB,
  IBCustomDataSet, IBQuery, IBDatabase, StdCtrls, Grids, DBGrids,
  CategoryButtons, ImgList, EnterantHw, FileCtrl, uClassesPedVenda, ExtDlgs,
  OleCtrls, SHDocVw, funcoes, uProcessamentosEmSegundoPlano, Query_OOP, 
  uDtmPedVenda;

const
  HW_MENS_UPDATE = WM_COPYDATA;

type
  TConfigEtiqueta = procedure(EnderecoDB: PChar; CodEmp: integer); stdcall;
  TGerarDES = function (pCodEmpresa: PChar): LongBool; stdcall;
  Treestrutura_verificar_hwauto = procedure(VersaoBPL: PChar);
  Treestrutura_verificar_fiscal = procedure(VersaoBPL: PChar);
  Treestrutura_manutencao = procedure(VersaoBPL: PChar);
  TShowForm = procedure (Amodal: Boolean);

  Tolap_pesquisageral_mdi = procedure(Atipo, ACodEmpresa, ADataBaseName, AUsuario, ACodUsuario: string);
  TSimpleProcedure = procedure();

  TOKEN_ELEVATION = record
    TokenIsElevated: DWORD;
  end;

  TVerificaHwSuporteAtivo = class(TThread)
  private
    { Private declarations }
    fImageLoaded: Boolean;
    FImagem: TImage;
    procedure SetImagem(const Value: TImage);
    function TaskRuning(ExeNameWithExtension: string): Boolean;
  protected
    procedure FreeImages; virtual;
    procedure LoadImages; virtual;
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    property Imagem: TImage read FImagem write SetImagem;
  end;

  TfrmPrincipalS = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ScrollBox1: TScrollBox;
    cbAutomacao: TCategoryButtons;
    FileListBox1: TFileListBox;
    Memo1: TMemo;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    MenuCadastros: TMenuItem;
    ClientesFornecedor: TMenuItem;
    CadastrosDeClientesFornecedor: TMenuItem;
    PossiveisClientes: TMenuItem;
    Grupos: TMenuItem;
    SubGrupos: TMenuItem;
    Produtos: TMenuItem;
    CadastroDeProdutos: TMenuItem;
    CadastrosDeKits: TMenuItem;
    CadastrosDePerfilDeProdutos: TMenuItem;
    ProdutosSimilares: TMenuItem;
    Funcionarios: TMenuItem;
    CadastroDeVeiculos: TMenuItem;
    ModelosdeVeiculos: TMenuItem;
    Equipamentos: TMenuItem;
    Manutencao: TMenuItem;
    CadastrosBasicos: TMenuItem;
    Departamentos: TMenuItem;
    Funcoes1: TMenuItem;
    Bairros: TMenuItem;
    Cidades: TMenuItem;
    Estados: TMenuItem;
    NaturezaDeOperacao: TMenuItem;
    TiposDeServicos: TMenuItem;
    CondicoesDePagamento: TMenuItem;
    Faturamento: TMenuItem;
    Transportador: TMenuItem;
    Grades: TMenuItem;
    PerfilDeClientes: TMenuItem;
    MarcasdeProdutos: TMenuItem;
    Contadores: TMenuItem;
    ImpressorasFiscais: TMenuItem;
    NCMSH: TMenuItem;
    N1: TMenuItem;
    MenuEstoque: TMenuItem;
    MovimentosEstoque: TMenuItem;
    CompradeProdutos: TMenuItem;
    SugestaoDeCompras: TMenuItem;
    Pedido: TMenuItem;
    NotasFiscais: TMenuItem;
    NotaFiscalSerieD: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    VendasPerdidas: TMenuItem;
    CadastroDeVendaPerdida: TMenuItem;
    TipodeVendaPerdida: TMenuItem;
    AlteracaoDePreco: TMenuItem;
    N14: TMenuItem;
    VendaDeProdutos: TMenuItem;
    OrcamentoEstoque: TMenuItem;
    ControledeAlmoxarifado: TMenuItem;
    TransDevolucaodeProdutos: TMenuItem;
    BoletosBancarios: TMenuItem;
    Outros: TMenuItem;
    ReciboEstoque: TMenuItem;
    OutrosRecibosEstoque: TMenuItem;
    Inventario: TMenuItem;
    FichaDeInventario: TMenuItem;
    DemostracaoDeResultados: TMenuItem;
    AtualizaPrecoDeProdutosHonda: TMenuItem;
    AtualizaPrecodeProdutoGM: TMenuItem;
    CalculoDeComissoes: TMenuItem;
    ControledeTMOOSMecanico: TMenuItem;
    DemostrativodePagamento: TMenuItem;
    RelatoriosEstoque: TMenuItem;
    Resumo: TMenuItem;
    Gerenciais: TMenuItem;
    NotasEmitidasPorPeriodo: TMenuItem;
    ProdutosComPendenciasEmOSREQ: TMenuItem;
    RequisicoesEmitidasPorPeriodo: TMenuItem;
    OrdensDeServicosEmitidasPorPeriodo: TMenuItem;
    ArquivosFiscaisSintegra: TMenuItem;
    RecibosEmitidos: TMenuItem;
    ListaDeAlteracaoDePreco: TMenuItem;
    LivrodeRegistrodeEntrada: TMenuItem;
    RelatoriosdeVendasPlacaCliente: TMenuItem;
    MenuOficina: TMenuItem;
    OrdemdeServico: TMenuItem;
    MenuFinanceiro: TMenuItem;
    MenuPAFECF: TMenuItem;
    SistemaFiscalPAFECF: TMenuItem;
    OperacoesFrenteLoja: TMenuItem;
    MenuVeiculos: TMenuItem;
    MenuCRM: TMenuItem;
    MenuGestor: TMenuItem;
    GestorMetas: TMenuItem;
    GestorFinancasCustos: TMenuItem;
    GestorEnsaioProvisionamento: TMenuItem;
    GestorPaineldeControle: TMenuItem;
    GestorAnalisedeDados: TMenuItem;
    MenuConfiguracoes: TMenuItem;
    NotaFiscalConfiguracao: TMenuItem;
    BoletoConfiguracao: TMenuItem;
    EtiquetaConfiguracao: TMenuItem;
    ConfiguraImpressora: TMenuItem;
    N9: TMenuItem;
    Senhas: TMenuItem;
    DadosdaEmpresa: TMenuItem;
    Auditoria: TMenuItem;
    MenusAuto: TMenuItem;
    TabeladeProcessos: TMenuItem;
    ParametrosdeSistema: TMenuItem;
    N10: TMenuItem;
    ImprimirRegua: TMenuItem;
    MenuJanelas: TMenuItem;
    LadoaLado: TMenuItem;
    Cascata: TMenuItem;
    ModoCascata: TMenuItem;
    MenuAtalhos: TMenuItem;
    ConsultadeProdutosShiftF3: TMenuItem;
    ConsultadeClientesShiftF4: TMenuItem;
    CalculoDeMargemDoProdutoShiftF5: TMenuItem;
    ConsultarKitsdeProdutosShiftF6: TMenuItem;
    CalculodePlanodePagamento1ShiftF7: TMenuItem;
    ConsultarCidadesShiftF8: TMenuItem;
    ConsultarBairrosShiftF9: TMenuItem;
    MenuAjuda: TMenuItem;
    Sobre: TMenuItem;
    Ajuda: TMenuItem;
    MudarUsuario: TMenuItem;
    PlanoDeContas: TMenuItem;
    Controles: TMenuItem;
    Lancamentos: TMenuItem;
    FechamentodeDia: TMenuItem;
    CalculoDeJurosFinanceiro: TMenuItem;
    N2: TMenuItem;
    ContasaReceber: TMenuItem;
    ContasaPagar: TMenuItem;
    RelatoriosFinanceiro: TMenuItem;
    Conciliacoes: TMenuItem;
    Cheques: TMenuItem;
    Creditos: TMenuItem;
    BoletimDeCaixa: TMenuItem;
    MapadeDespesas: TMenuItem;
    FluxoDeCaixa: TMenuItem;
    NiveldeEndividamento: TMenuItem;
    RelatoriodeClientesVencidos: TMenuItem;
    Bancaria: TMenuItem;
    OrcamentoOficina: TMenuItem;
    N17: TMenuItem;
    RelatoriosVeiculos: TMenuItem;
    CRMPosVenda: TMenuItem;
    CRMFollowUpPosAtendimento: TMenuItem;
    TipodeClientesFornecedor: TMenuItem;
    cbFinanceiro: TCategoryButtons;
    cbPAFECF: TCategoryButtons;
    cbVeiculo: TCategoryButtons;
    cbCRM: TCategoryButtons;
    cbGestor: TCategoryButtons;
    RegistrarSoftware: TMenuItem;
    N7: TMenuItem;
    ConhecimentoDeTransporte: TMenuItem;
    DevolucaoDeMercadorias: TMenuItem;
    MVAAjustada: TMenuItem;
    GestorCotacaoCompraVenda: TMenuItem;
    ConfiguracaoBoletaCobreBem: TMenuItem;
    ConfiguracaoBoletaPreImpresso: TMenuItem;
    CIAP: TMenuItem;
    ArquivosFiscaisSpedFiscal: TMenuItem;
    EstoqueDeEquipqmentosComNdeSerie: TMenuItem;
    N8: TMenuItem;
    MenuFinanceiroImportacao: TMenuItem;
    PagamentosRetaguarda: TMenuItem;
    PagamentosPDVs: TMenuItem;
    IndiceTecnicoPAF: TMenuItem;
    CorrigirCidadeseBairrosCEP1: TMenuItem;
    CodigoEstadoeCidadeIbge1: TMenuItem;
    QuitarBoletosArquivodeRetorno: TMenuItem;
    MenuEstoqueCompraDeProdutosCotacao: TMenuItem;
    MenuEstoqueRelatoriosAnalisedeDados: TMenuItem;
    N4: TMenuItem;
    Sair: TMenuItem;
    N6: TMenuItem;
    pnAbout: TPanel;
    Panel5: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Memo2: TMemo;
    BitBtn2: TBitBtn;
    EstoqueeMovimentoVeiculos1: TMenuItem;
    EntradaSaidaVeiculos1: TMenuItem;
    DemonstracoesVeiculos1: TMenuItem;
    CEP1: TMenuItem;
    Combustveis1: TMenuItem;
    EspecieTipoFinsSeg1: TMenuItem;
    Cores1: TMenuItem;
    ipoDespesas1: TMenuItem;
    ipopndencias1: TMenuItem;
    AGS1: TMenuItem;
    Opcionais1: TMenuItem;
    HwService: TMenuItem;
    SuporteRemoto: TMenuItem;
    Image1: TImage;
    N5: TMenuItem;
    SPED: TMenuItem;
    InformacaoComplementar: TMenuItem;
    PopupMenu1: TPopupMenu;
    VerDimensesdareaparaimagem01: TMenuItem;
    Definirplanodefundo011: TMenuItem;
    DefinirPlanodeFundo021: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    Timer1: TTimer;                            
    N11: TMenuItem;
    PISCOFINS: TMenuItem;
    DemaisReceitaseouCreditos: TMenuItem;
    AcaoJudicial: TMenuItem;
    ProcessoAdministrativo: TMenuItem;
    BalancoGeral: TMenuItem;
    CreditosDepreciacaoAmortizacaodeBens: TMenuItem;
    CreditosAquisicaodeBens: TMenuItem;
    Timer2: TTimer;
    CreditosEstoquedeAbertura: TMenuItem;
    N16: TMenuItem;
    Veiculos301: TMenuItem;
    N3: TMenuItem;
    ArquivosFiscaisSpedPISCOFINS: TMenuItem;
    ArquivosFbricaImportacaoDeArquivos1: TMenuItem;
    ModelosEtiquetasImpTrmicas1: TMenuItem;
    PlanodeFundo1: TMenuItem;
    VerDimensesdareaparaimagem1: TMenuItem;
    DefinirPlanodeFundo11: TMenuItem;
    DefinirPlanodeFundo21: TMenuItem;
    PlanodeContasContabil: TMenuItem;
    Fiscal: TMenuItem;
    CentrodeCustos: TMenuItem;
    N18: TMenuItem;
    RelatoriodeVendasObjetoCliente: TMenuItem;
    MenuEstoqueMovimentoManutencaodeCargas: TMenuItem;
    OrdemdeCarregamento: TMenuItem;
    Localidades: TMenuItem;
    Setor: TMenuItem;
    VeiculosDeTransporte: TMenuItem;
    MenuEstoqueProducao: TMenuItem;
    PedidodeProducao: TMenuItem;
    Formulas: TMenuItem;
    MenuEstoqueMovimentoMobile: TMenuItem;
    CadastrodeMobile: TMenuItem;
    CadastrodeMensagemMobile: TMenuItem;
    CadastrodePromocao: TMenuItem;
    N19: TMenuItem;
    Box: TMenuItem;
    Agenda: TMenuItem;
    Feriados: TMenuItem;
    TiposVendas1: TMenuItem;
    MetasComissao1: TMenuItem;
    AgendaMecnico1: TMenuItem;
    ModelosdeCartas1: TMenuItem;
    CRMFiltrosDiversos: TMenuItem;
    CRMPrevisaoDeServicos: TMenuItem;
    CRMFollowUpPosAtendimento_Grupos: TMenuItem;
    CRMFollowUpPosAtendimento_Perfis: TMenuItem;
    CRMFollowUpPosAtendimento_Perguntas: TMenuItem;
    CRMFollowUpPosAtendimento_Pesquisas: TMenuItem;
    CRMFollowUpPosAtendimento_Atendimentos: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    MenuEstoqueMovimentoEstouqeFechado1: TMenuItem;
    Vendedor1: TMenuItem;
    Almoxarifado1: TMenuItem;
    Alternarentrejanelas1: TMenuItem;
    TrayIconMensMob: TTrayIcon;
    Timer3: TTimer;
    LancamentosFiscais: TMenuItem;
    RelatorioApuracaodeICMS: TMenuItem;
    Label1: TLabel;
    NBS: TMenuItem;
    TiposdeServicosLeiComplementarN116: TMenuItem;
    SuporteOnline: TMenuItem;
    NoticiasHW: TMenuItem;
    HwUpdate: TMenuItem;
    QuitarCrditosconciliaoCarto1: TMenuItem;
    Verificarnovaversao: TMenuItem;
    N22: TMenuItem;
    Arquivopeas1: TMenuItem;
    ArquivosPeasContasaPagareTSI1: TMenuItem;
    VendaEstoqueASSOHONDA1: TMenuItem;
    ArquivodevendasPorChassi1: TMenuItem;
    ArquivodeClientes1: TMenuItem;
    SincronizardadosPAFECF: TMenuItem;
    OcorrenciaAdministradora: TMenuItem;
    PerfildeTributacaoAdicional: TMenuItem;
    N23: TMenuItem;
    RelatoriosFinanceiroAnaliseDeDados: TMenuItem;
    N24: TMenuItem;
    MenuFinanceiroOutros: TMenuItem;
    FinanceiroAprovacaoDePedidos: TMenuItem;
    N25: TMenuItem;
    MenuEstoqueRelatoriosSituacaodosPedidos: TMenuItem;
    RegrasdeVendas: TMenuItem;
    MDFe: TMenuItem;
    ConfernciaCega: TMenuItem;
    CRMFollowUpPosAtendimento_Anotacoes: TMenuItem;
    N26: TMenuItem;
    ArquivosFiscaisDES: TMenuItem;
    RelatorioVeiculosemDemonstracao1: TMenuItem;
    RelatorioPosicaodeEstoqueVeiculos1: TMenuItem;
    RelatorioVeiculosemTransito: TMenuItem;
    RelatorioAcompanhamentodeVeiculos: TMenuItem;
    RelatorioVeiculosNegociados1: TMenuItem;
    EstoqueeMovimentoVeiculosOutrasEmpresas1: TMenuItem;
    RelatorioDiarioDiretoria1: TMenuItem;
    InventarioV: TMenuItem;
    RelatorioSituacaodoEstoqueFechado: TMenuItem;
    RelatorioVeiculosQueChegaramAntesDoPagamento1: TMenuItem;
    RelatorioVeiculosPagosAntecipados1: TMenuItem;
    RelatorioFaturamentodeVeiculos1: TMenuItem;
    GerenciaisV: TMenuItem;
    N27: TMenuItem;
    NotasFiscaisemTransito1: TMenuItem;
    RelatorioparaGerenciaVeiculos1: TMenuItem;
    RelatorioTabeladePrecosVeiculos: TMenuItem;
    RelatrioRecebimentodeVeculos1: TMenuItem;
    RelatorioDespesasdeVeiculos: TMenuItem;
    RelatorioPendenciasdeVeiculos: TMenuItem;
    ConfigWSReplicacao: TMenuItem;
    Timer4: TTimer;
    FinanceiroPOSVirtual: TMenuItem;
    FinanceiroPOSVirtualTransacaoAvulsa: TMenuItem;
    FinanceiroPOSVirtualAdministrativo: TMenuItem;
    dsDiversos: TDataSource;
    FinanceiroPOSVirtualHistoricodeTransacoes: TMenuItem;
    ReservasVencidas1: TMenuItem;
    TipodeReserva1: TMenuItem;
    ControledeEstoqueV1: TMenuItem;
    Outros2: TMenuItem;
    CadastrodeMensagemMobile1: TMenuItem;
    NotasFiscal12: TMenuItem;
    Recibo: TMenuItem;
    Mensagem1: TMenuItem;
    ReservasVencendo1: TMenuItem;
    RecibosEmitidos2: TMenuItem;
    CEST: TMenuItem;
    ParametrosdeSistemaGlobal: TMenuItem;
    ManutencaoDoInventario: TMenuItem;
    AjustesBeneficiosIncentivoICMSDifalPorUF: TMenuItem;
    ObrigacoesIcmsRecolhidoRecolherDIFAL: TMenuItem;
    timerProcessamentos: TTimer;
    visualizarWSReplicacao: TMenuItem;
    ManutencaoFDB1: TMenuItem;
    NotaFiscalConsumidor: TMenuItem;
    NotaFiscalConsumidorEmissor: TMenuItem;
    NotaFiscalConsumidorNFCe: TMenuItem;
    NotaFiscalConsumidorSATFiscal: TMenuItem;
    Yamaha: TMenuItem;
    ArquivodePecasYamaha: TMenuItem;
    Servicos: TMenuItem;
    SugestaoServico: TMenuItem;
    RegrasSugestaoServico: TMenuItem;
    Participantes: TMenuItem;
    TrayIconLicenca: TTrayIcon;
    ContratosClientes: TMenuItem;
    ManutencaodeInventario1: TMenuItem;
    LiberarAcessos: TMenuItem;
    ContratosClientesGerados: TMenuItem;
    DesoneracaodeICMS: TMenuItem;
    FinalidadesNF1: TMenuItem;
    ProgramadeFidelidade: TMenuItem;
    ConfiguracoesSimulacaoProgramaFidelidade: TMenuItem;
    RegrasValeResgateTrocaProgramadefidelidade: TMenuItem;
    RelatorioExtratoContaCorrenteProgFid: TMenuItem;
    RelatorioDocumentosRecebidoscomValeResgateProgFid: TMenuItem;
    N15: TMenuItem;
    Rotasdeentrega: TMenuItem;
    RelatorioTitulosPorRota: TMenuItem;
    RelatorioComissaoPorVenda: TMenuItem;
    ConfiguracaoAPIs: TMenuItem;
    Categoria: TMenuItem;
    Intermediadores: TMenuItem;
    EmissaodeNotasdeAjustesdeEstoque1: TMenuItem;
    TrayIconMensEcommerce: TTrayIcon;
    Timer5: TTimer;
    TimerServiceLess: TTimer;
    TimerCloseApp: TTimer;
    N28: TMenuItem;
    CRMServicos: TMenuItem;
    CRMSugestaoServico: TMenuItem;
    CRMRegras: TMenuItem;
    CRMProgramadeFidelidade: TMenuItem;
    CRMConfiguracoesSimulcaoProgramaFidelidade: TMenuItem;
    CRMRegrasValeResgateTrocaProgramadefidelidade: TMenuItem;
    CRMCllientes: TMenuItem;
    CRMCartasdeCobranca: TMenuItem;
    TrayIconEnvNotFinanc: TTrayIcon;
    Timer6: TTimer;
    NotificacoesEnviadas: TMenuItem;
    RequisicoesOrdensdeServicosEmitidasPorPeriodo: TMenuItem;    DocumentosEmAberto: TMenuItem;
    N29: TMenuItem;
    ImageList2: TImageList;
    MenuECommerce: TMenuItem;
    MenuComercioAberto: TMenuItem;
    GradesVariacaoECommerce: TMenuItem;
    CategoriaECommerce: TMenuItem;
    ProdutosECommerce: TMenuItem;
    IntermediadoresPagECommerce: TMenuItem;
    ConfiguracaoApiECommerce: TMenuItem;
    ProdutosComercioAberto: TMenuItem;
    ConfiguracaoApiComercioAberto: TMenuItem;
    ConfiguracaoApiProgramadefidelidade: TMenuItem;
    TiposdeServicosComercioAberto: TMenuItem;
    ControlesProgramadefidelidade: TMenuItem;
    ArquivosDiversos1: TMenuItem;
    ArquivosDiversosProdutos1: TMenuItem;
    TiposVendasProgramadefidelidade: TMenuItem;
    ProdutosEnvECommerce: TMenuItem;
    ProdutosEnvComercioAberto: TMenuItem;
    CadastrosevinculosTray1: TMenuItem;
    KitsProdutosECommerce: TMenuItem;
    NBackup1: TMenuItem;
    NBackupConfigurar1: TMenuItem;
    NBackupExecutar: TMenuItem;
    ConfiguracoesReplicacaoInterna: TMenuItem;
    CodigosdeAjusteConcCartao: TMenuItem;
    ComissaoFaixaDesconto: TMenuItem;
    RegrasTravaReqOSEstFech: TMenuItem;
    OperacaoFiscal: TMenuItem;
    N30: TMenuItem;
    ConfiguraodeAjustesAutomticosC197e19211: TMenuItem;
    EmpresaAdq: TMenuItem;
    ProdutosValidade: TMenuItem;
    MontarPedidos: TMenuItem;
    TipoLancamentoConcCartao: TMenuItem;
    cbMenusAbertos: TCategoryButtons;
    Timer7: TTimer;
    TrayIconPagOnline: TTrayIcon;
    Timer8: TTimer;
    PedidoCompraClienteNFe1: TMenuItem;
    cbMensagens: TCategoryButtons;
    ReformaTributariadoConsumoRTC1: TMenuItem;
    RTC_OperaccoesInternas1: TMenuItem;
    RTC_GruposFiscais1: TMenuItem;
    RTC_RegrasFiscaisdoIBSeCBS1: TMenuItem;
    RTC_OperacoesFiscaisdoIBSeCBS1: TMenuItem; 
    NFSeDPS1: TMenuItem;
    GruposResumoFinanceiro: TMenuItem;
    btOpcoes: TSpeedButton;
    lbInfSeqMin: TLabel;
    lbInfSeqErp: TLabel;
    lbSeqMin: TLabel;
    lbSeqErp: TLabel;
    lbInfSeqMax: TLabel;
    lbSeqMax: TLabel;
    RTC_CentraldeInformacoesFiscais1: TMenuItem;
    N31: TMenuItem;
    RTC_RegrasRedBenefPC1: TMenuItem;
    RTC_AjustesReduoBenefcioPISCOFINSLC22420251: TMenuItem;
    Suzuki: TMenuItem;
    NotasfiscaisSuzuki: TMenuItem;
    Timer9: TTimer;
    procedure Timer9Timer(Sender: TObject);
    procedure NotasfiscaisSuzukiClick(Sender: TObject);
    procedure RTC_AjustesReduoBenefcioPISCOFINSLC22420251Click(Sender: TObject);
    procedure RTC_RegrasRedBenefPC1Click(Sender: TObject);
    procedure cbMenusAbertosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btOpcoesClick(Sender: TObject);
    procedure RTC_CentraldeInformacoesFiscais1Click(Sender: TObject);
    procedure GruposResumoFinanceiroClick(Sender: TObject);
    procedure NFSeDPS1Click(Sender: TObject);
    procedure RTC_OperacoesFiscaisdoIBSeCBS1Click(Sender: TObject);
    procedure RTC_RegrasFiscaisdoIBSeCBS1Click(Sender: TObject);
    procedure RTC_OperaccoesInternas1Click(Sender: TObject);
    procedure RTC_GruposFiscais1Click(Sender: TObject);
    procedure cbMensagensCategories0Items0Click(Sender: TObject);
    procedure PedidoCompraClienteNFe1Click(Sender: TObject);
    procedure Timer8Timer(Sender: TObject);
    procedure TrayIconPagOnlineDblClick(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure cbMenusAbertosCategoryCollapase(Sender: TObject;
      const Category: TButtonCategory);
    procedure cbMenusAbertosSelectedItemChange(Sender: TObject;
      const Button: TButtonItem);
    procedure TipoLancamentoConcCartaoClick(Sender: TObject);
    procedure MontarPedidosClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ProdutosValidadeClick(Sender: TObject);
    procedure EmpresaAdqClick(Sender: TObject);
    procedure ConfiguraodeAjustesAutomticosC197e19211Click(Sender: TObject);
    procedure OperacaoFiscalClick(Sender: TObject);
    procedure RegrasTravaReqOSEstFechClick(Sender: TObject);
    procedure ComissaoFaixaDescontoClick(Sender: TObject);
    procedure CodigosdeAjusteConcCartaoClick(Sender: TObject);
    procedure ConfiguracoesReplicacaoInternaClick(Sender: TObject);
    procedure NBackupExecutarClick(Sender: TObject);
    procedure NBackupConfigurar1Click(Sender: TObject);
    procedure CadastrosevinculosTray1Click(Sender: TObject);
    procedure ProdutosEnvComercioAbertoClick(Sender: TObject);
    procedure ProdutosEnvECommerceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DocumentosEmAbertoClick(Sender: TObject);
    procedure RequisicoesOrdensdeServicosEmitidasPorPeriodoClick(
      Sender: TObject);
    procedure NotificacoesEnviadasClick(Sender: TObject);
    procedure ArquivosDiversosProdutos1Click(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure TrayIconEnvNotFinancDblClick(Sender: TObject);
    procedure CRMCartasdeCobrancaClick(Sender: TObject);
    procedure TimerCloseAppTimer(Sender: TObject);
    procedure TimerServiceLessTimer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure TrayIconMensEcommerceDblClick(Sender: TObject);
    procedure IntermediadoresClick(Sender: TObject);
    procedure CategoriaClick(Sender: TObject);
    procedure ConfiguracaoAPIsClick(Sender: TObject);
    procedure EmissaodeNotasdeAjustesdeEstoque1Click(Sender: TObject);
    procedure RelatorioComissaoPorVendaClick(Sender: TObject);
    procedure RelatorioTitulosPorRotaClick(Sender: TObject);
    procedure RotasdeentregaClick(Sender: TObject);
    procedure RelatorioDocumentosRecebidoscomValeResgateProgFidClick(
      Sender: TObject);
    procedure RelatorioExtratoContaCorrenteProgFidClick(Sender: TObject);
    procedure RegrasValeResgateTrocaProgramadefidelidadeClick(Sender: TObject);
    procedure ConfiguracoesSimulacaoProgramaFidelidadeClick(Sender: TObject);
    procedure ManutencaodeInventario1Click(Sender: TObject);
    procedure ContratosClientesGeradosClick(Sender: TObject);
    procedure FinalidadesNF1Click(Sender: TObject);
    procedure DesoneracaodeICMSClick(Sender: TObject);
    procedure LiberarAcessosClick(Sender: TObject);
    procedure ContratosClientesClick(Sender: TObject);
    procedure TrayIconLicencaDblClick(Sender: TObject);
    procedure ParticipantesClick(Sender: TObject);
    procedure SugestaoServicoClick(Sender: TObject);
    procedure RegrasSugestaoServicoClick(Sender: TObject);
    procedure ArquivodePecasYamahaClick(Sender: TObject);
    procedure NotaFiscalConsumidorSATFiscalClick(Sender: TObject);
    procedure NotaFiscalConsumidorNFCeClick(Sender: TObject);
    procedure NotaFiscalConsumidorEmissorClick(Sender: TObject);
    procedure ManutencaoFDB1Click(Sender: TObject);
    procedure visualizarWSReplicacaoClick(Sender: TObject);
    procedure timerProcessamentosTimer(Sender: TObject);
    procedure ObrigacoesIcmsRecolhidoRecolherDIFALClick(Sender: TObject);
    procedure AjustesBeneficiosIncentivoICMSDifalPorUFClick(Sender: TObject);
    procedure ManutencaoDoInventarioClick(Sender: TObject);
    procedure ParametrosdeSistemaGlobalClick(Sender: TObject);
    procedure CESTClick(Sender: TObject);
    procedure cbVeiculoCategories0Items3Click(Sender: TObject);
    procedure ReservasVencendo1Click(Sender: TObject);
    procedure ReciboClick(Sender: TObject);
    procedure NotasFiscal12Click(Sender: TObject);
    procedure CadastrodeMensagemMobile1Click(Sender: TObject);
    procedure ControledeEstoqueV1Click(Sender: TObject);
    procedure TipodeReserva1Click(Sender: TObject);
    procedure ReservasVencidas1Click(Sender: TObject);
    procedure FinanceiroPOSVirtualHistoricodeTransacoesClick(Sender: TObject);
    procedure FinanceiroPOSVirtualAdministrativoClick(Sender: TObject);
    procedure FinanceiroPOSVirtualTransacaoAvulsaClick(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure ConfigWSReplicacaoClick(Sender: TObject);
    procedure RelatorioPendenciasdeVeiculosClick(Sender: TObject);
    procedure RelatorioDespesasdeVeiculosClick(Sender: TObject);
    procedure RelatrioRecebimentodeVeculos1Click(Sender: TObject);
    procedure RelatorioTabeladePrecosVeiculosClick(Sender: TObject);
    procedure RelatorioparaGerenciaVeiculos1Click(Sender: TObject);
    procedure NotasFiscaisemTransito1Click(Sender: TObject);
    procedure RelatorioFaturamentodeVeiculos1Click(Sender: TObject);
    procedure RelatorioVeiculosQueChegaramAntesDoPagamento1Click(
      Sender: TObject);
    procedure RelatorioVeiculosPagosAntecipados1Click(Sender: TObject);
    procedure RelatorioSituacaodoEstoqueFechadoClick(Sender: TObject);
    procedure cbFinanceiroCategories0Items5Click(Sender: TObject);
    procedure InventarioVClick(Sender: TObject);
    procedure cbVeiculoCategories0Items4Click(Sender: TObject);
    procedure cbVeiculoCategories0Items2Click(Sender: TObject);
    procedure cbVeiculoCategories0Items1Click(Sender: TObject);
    procedure cbVeiculoCategories0Items0Click(Sender: TObject);
    procedure RelatorioDiarioDiretoria1Click(Sender: TObject);
    procedure ArquivodeClientes1Click(Sender: TObject);
    procedure ArquivodevendasPorChassi1Click(Sender: TObject);
    procedure ProcessarArquivoHondaClick(Sender: TObject);
    procedure EstoqueeMovimentoVeiculosOutrasEmpresas1Click(Sender: TObject);
    procedure RelatorioVeiculosNegociados1Click(Sender: TObject);
    procedure RelatorioAcompanhamentodeVeiculosClick(Sender: TObject);
    procedure RelatorioVeiculosemTransitoClick(Sender: TObject);
    procedure RelatorioPosicaodeEstoqueVeiculos1Click(Sender: TObject);
    procedure RelatorioVeiculosemDemonstracao1Click(Sender: TObject);
    procedure EstoqueVeiculosOutrasEmpresa1Click(Sender: TObject);
    procedure ArquivosFiscaisDESClick(Sender: TObject);
    procedure CRMFollowUpPosAtendimento_AnotacoesClick(Sender: TObject);
    procedure ConfernciaCegaClick(Sender: TObject);
    procedure MDFeClick(Sender: TObject);
    procedure RegrasdeVendasClick(Sender: TObject);
    procedure MenuEstoqueRelatoriosSituacaodosPedidosClick(Sender: TObject);
    procedure FinanceiroAprovacaoDePedidosClick(Sender: TObject);
    procedure PerfildeTributacaoAdicionalClick(Sender: TObject);
    procedure OcorrenciaAdministradoraClick(Sender: TObject);
    procedure SincronizardadosPAFECFClick(Sender: TObject);
    procedure AdministradoradeCartaoClick(Sender: TObject);
    procedure VendaEstoqueASSOHONDA1Click(Sender: TObject);
    procedure ArquivosPeasContasaPagareTSI1Click(Sender: TObject);
    procedure VerificarnovaversaoClick(Sender: TObject);
    procedure QuitarCrditosconciliaoCarto1Click(Sender: TObject);
    procedure HwUpdateClick(Sender: TObject);
    procedure NoticiasHWClick(Sender: TObject);
    procedure SuporteOnlineClick(Sender: TObject);
    procedure TiposdeServicosLeiComplementarN116Click(Sender: TObject);
    procedure NBSClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure RelatorioApuracaodeICMSClick(Sender: TObject);
    procedure LancamentosFiscaisClick(Sender: TObject);
    procedure TrayIconMensMobDblClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Alternarentrejanelas1Click(Sender: TObject);
    procedure CRMFollowUpPosAtendimento_PesquisasClick(Sender: TObject);
    procedure CRMFollowUpPosAtendimento_AtendimentosClick(Sender: TObject);
    procedure CRMFollowUpPosAtendimento_PerfisClick(Sender: TObject);
    procedure Almoxarifado1Click(Sender: TObject);
    procedure CRMFollowUpPosAtendimento_PerguntasClick(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure CRMFollowUpPosAtendimento_GruposClick(Sender: TObject);
    procedure ModelosdeCartas1Click(Sender: TObject);
    procedure AgendaMecnico1Click(Sender: TObject);
    procedure MetasComissao1Click(Sender: TObject);
    procedure TiposVendas1Click(Sender: TObject);
    procedure FeriadosClick(Sender: TObject);
    procedure AgendaClick(Sender: TObject);
    procedure BoxClick(Sender: TObject);
    procedure CadastrodePromocaoClick(Sender: TObject);
    procedure CadastrodeMensagemMobileClick(Sender: TObject);
    procedure CadastrodeMobileClick(Sender: TObject);
    procedure FormulasClick(Sender: TObject);
    procedure PedidodeProducaoClick(Sender: TObject);
    procedure VeiculosDeTransporteClick(Sender: TObject);
    procedure LocalidadesClick(Sender: TObject);
    procedure SetorClick(Sender: TObject);
    procedure OrdemdeCarregamentoClick(Sender: TObject);
    procedure RelatoriodeVendasObjetoClienteClick(Sender: TObject);
    procedure CentrodeCustosClick(Sender: TObject);
    procedure PlanodeContasContabilClick(Sender: TObject);
    procedure CRMFollowUpPosAtendimentoClick(Sender: TObject);
    procedure CRMPosVendaClick(Sender: TObject);
    procedure DefinirPlanodeFundo21Click(Sender: TObject);
    procedure DefinirPlanodeFundo11Click(Sender: TObject);
    procedure VerDimensesdareaparaimagem1Click(Sender: TObject);
    procedure ModelosEtiquetasImpTrmicas1Click(Sender: TObject);
    procedure ArquivosFiscaisSpedPISCOFINSClick(Sender: TObject);
    procedure BancariaClick(Sender: TObject);
    procedure OrcamentoOficinaClick(Sender: TObject);
    procedure Veiculos301Click(Sender: TObject);
    procedure CreditosEstoquedeAberturaClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CreditosAquisicaodeBensClick(Sender: TObject);
    procedure CreditosDepreciacaoAmortizacaodeBensClick(Sender: TObject);
    procedure ProcessoAdministrativoClick(Sender: TObject);
    procedure AcaoJudicialClick(Sender: TObject);
    procedure DemaisReceitaseouCreditosClick(Sender: TObject);
    procedure BalancoGeralClick(Sender: TObject);
    procedure InventarioClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FechamentodeDiaClick(Sender: TObject);
    procedure InformacaoComplementarClick(Sender: TObject);
    procedure NiveldeEndividamentoClick(Sender: TObject);
    procedure RelatoriodeClientesVencidosClick(Sender: TObject);
    procedure MapadeDespesasClick(Sender: TObject);
    procedure BoletimDeCaixaClick(Sender: TObject);
    procedure CalculoDeJurosFinanceiroClick(Sender: TObject);
    procedure FluxoDeCaixaClick(Sender: TObject);
    procedure SuporteRemotoClick(Sender: TObject);
    procedure ContasaPagarClick(Sender: TObject);
    procedure PlanoDeContasClick(Sender: TObject);
    procedure CreditosClick(Sender: TObject);
    procedure ChequesClick(Sender: TObject);
    procedure LancamentosClick(Sender: TObject);
    procedure PagamentosRetaguardaClick(Sender: TObject);
    procedure CalculoDeComissoesClick(Sender: TObject);
    procedure HwServiceClick(Sender: TObject);
    procedure VeiculosCadastroClick(Sender: TObject);
    procedure Opcionais1Click(Sender: TObject);
    procedure AGS1Click(Sender: TObject);
    procedure ipopndencias1Click(Sender: TObject);
    procedure ipoDespesas1Click(Sender: TObject);
    procedure Cores1Click(Sender: TObject);
    procedure EspecieTipoFinsSeg1Click(Sender: TObject);
    procedure Combustveis1Click(Sender: TObject);
    procedure CEP1Click(Sender: TObject);
    procedure ContratodeCompraVeiculosCCIA1Click(Sender: TObject);
    procedure DemonstracoesVeiculos1Click(Sender: TObject);
    procedure ReciboVeiculosCCIA1Click(Sender: TObject);
    procedure VendaVeiculos1Click(Sender: TObject);
    procedure EstoqueVeiculos1Click(Sender: TObject);
    procedure RelatoriosdeVendasPlacaClienteClick(Sender: TObject);
    procedure ProdutosComPrejuizoemVendasClick(Sender: TObject);
    procedure ListaDeAlteracaoDePrecoClick(Sender: TObject);
    procedure RecibosEmitidosClick(Sender: TObject);
    procedure OrdensDeServicosEmitidasPorPeriodoClick(Sender: TObject);
    procedure RequisicoesEmitidasPorPeriodoClick(Sender: TObject);
    procedure ProdutosComPendenciasEmOSREQClick(Sender: TObject);
    procedure NotasEmitidasPorPeriodoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure AlteracaoDePrecoClick(Sender: TObject);
    procedure Financeiro30Click(Sender: TObject);
    procedure ControlesClick(Sender: TObject);
    procedure QuitarBoletosArquivodeRetornoClick(Sender: TObject);
    procedure CodigoEstadoeCidadeIbge1Click(Sender: TObject);
    procedure CorrigirCidadeseBairrosCEP1Click(Sender: TObject);
    procedure IndiceTecnicoPAFClick(Sender: TObject);
    procedure PagamentosPDVsClick(Sender: TObject);
    procedure ParametrosdeSistemaClick(Sender: TObject);
    procedure DevolucaoDeMercadoriasClick(Sender: TObject);
    procedure EstoqueDeEquipqmentosComNdeSerieClick(Sender: TObject);
    procedure ArquivosFiscaisSpedFiscalClick(Sender: TObject);
    procedure CIAPClick(Sender: TObject);
    procedure DadosdaEmpresaClick(Sender: TObject);
    procedure ResumoClick(Sender: TObject);
    procedure NotaFiscalConfiguracaoClick(Sender: TObject);
    procedure ConfiguracaoBoletaCobreBemClick(Sender: TObject);
    procedure BoletosBancariosClick(Sender: TObject);
    procedure GestorAnalisedeDadosClick(Sender: TObject);
    procedure GestorCotacaoCompraVendaClick(Sender: TObject);
    procedure GestorPaineldeControleClick(Sender: TObject);
    procedure GestorEnsaioProvisionamentoClick(Sender: TObject);
    procedure GestorFinancasCustosClick(Sender: TObject);
    procedure GestorMetasClick(Sender: TObject);
    procedure ControledeTMOOSMecanicoClick(Sender: TObject);
    procedure AuditoriaClick(Sender: TObject);
    procedure FichaDeInventarioClick(Sender: TObject);
    procedure TabeladeProcessosClick(Sender: TObject);
    procedure MVAAjustadaClick(Sender: TObject);
    procedure ReciboEstoqueClick(Sender: TObject);
    procedure SugestaoDeComprasClick(Sender: TObject);
    procedure OutrosRecibosEstoqueClick(Sender: TObject);
    procedure ConhecimentoDeTransporteClick(Sender: TObject);
    procedure ConsultadeClientesShiftF4Click(Sender: TObject);
    procedure ConsultadeProdutosShiftF3Click(Sender: TObject);
    procedure ConsultarBairrosShiftF9Click(Sender: TObject);
    procedure ConsultarCidadesShiftF8Click(Sender: TObject);
    procedure ConsultarKitsdeProdutosShiftF6Click(Sender: TObject);
    procedure CalculoDeMargemDoProdutoShiftF5Click(Sender: TObject);
    procedure CalculodePlanodePagamento1ShiftF7Click(Sender: TObject);
    procedure LivrodeRegistrodeEntradaClick(Sender: TObject);
    procedure ControledeAlmoxarifadoClick(Sender: TObject);
    procedure NCMSHClick(Sender: TObject);
    procedure ImpressorasFiscaisClick(Sender: TObject);
    procedure ContadoresClick(Sender: TObject);
    procedure PerfilDeClientesClick(Sender: TObject);
    procedure TransportadorClick(Sender: TObject);
    procedure FaturamentoClick(Sender: TObject);
    procedure CondicoesDePagamentoClick(Sender: TObject);
    procedure NaturezaDeOperacaoClick(Sender: TObject);
    procedure ProdutosSimilaresClick(Sender: TObject);
    procedure CadastrosDePerfilDeProdutosClick(Sender: TObject);
    procedure CadastrosDeKitsClick(Sender: TObject);
    procedure RegistrarSoftwareClick(Sender: TObject);
    procedure cbAutomacaoCategoryCollapase(Sender: TObject;
      const Category: TButtonCategory);
    procedure TipodeClientesFornecedorClick(Sender: TObject);
    procedure NotasFiscaisClick(Sender: TObject);
    procedure SenhasClick(Sender: TObject);
    procedure PedidoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Funcoes1Click(Sender: TObject);
    procedure FuncionariosClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TipodeVendaPerdidaClick(Sender: TObject);
    procedure CadastroDeVendaPerdidaClick(Sender: TObject);
    procedure ManutencaoClick(Sender: TObject);
    procedure PossiveisClientesClick(Sender: TObject);
    procedure GradesClick(Sender: TObject);
    procedure EtiquetaConfiguracaoClick(Sender: TObject);
    procedure MudarUsuarioClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MenusAutoClick(Sender: TObject);
    procedure EquipamentosClick(Sender: TObject);
    procedure TiposDeServicosClick(Sender: TObject);
    procedure MarcasdeProdutosClick(Sender: TObject);
    procedure DepartamentosClick(Sender: TObject);
    procedure ModelosdeVeiculosClick(Sender: TObject);
    procedure OrcamentoEstoqueClick(Sender: TObject);
    procedure NotaFiscalSerieDClick(Sender: TObject);
    procedure TransDevolucaodeProdutosClick(Sender: TObject);
    procedure OrdemdeServicoClick(Sender: TObject);
    procedure CadastrosDeClientesFornecedorClick(Sender: TObject);
    procedure ArquivosFiscaisSintegraClick(Sender: TObject);
    procedure SistemaFiscalPAFECFClick(Sender: TObject);
    procedure VendaDeProdutosClick(Sender: TObject);
    procedure SubGruposClick(Sender: TObject);
    procedure CadastroDeProdutosClick(Sender: TObject);
    procedure GruposClick(Sender: TObject);
    procedure EstadosClick(Sender: TObject);
    procedure OperacoesFrenteLojaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CategoryButtons1Categories0Items0Click(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure ModoCascataClick(Sender: TObject);
    procedure CascataClick(Sender: TObject);
    procedure LadoaLadoClick(Sender: TObject);
    procedure BairrosClick(Sender: TObject);
    procedure CidadesClick(Sender: TObject);
    function CloseQuery: Boolean; override;
    procedure WM_Sys(var Msg: TMessage); message WM_SysCommand;
  strict private
    procedure UsarPlanilhaParaInserirAlterar(ParamsAdicionais: string);
    procedure SetupModern();
    procedure SetupModernShutdown();
  private
    { Private declarations }

    // Handle menssagem
    vTituloMensagem: string;
    vTextoMensagem: string;
    vIconMensagem: Integer;
    vTipoMensagem: string;
    vHandleMensagem: THandle;

    //Variavel notificacao backup
    vNotificarBackupBD, vNotificarBackupBD_Fixa: Boolean;
		vVerificarBackupBD: string;
    vDataUltimoBackupBD: TDateTime;
    vNotificarAposDias: Integer;

    //Variavel notificacao chave periodica
    vNotificarChavePeriodica, vNotificarChavePeriodica_Fixa: Boolean;
    vDataRegistroERP: string;
    vDiasVencimentoChavePeriodica: Currency;
    vCodFaturamentoChavePeriodica: Integer;
    vDataConsultaChavePeriodica: TDateTime;
    vDataFaturamentoChavePeriodica: TDateTime;

    //Variavel notificacao documento aberto
    vNotificarDocAberto, vNotificarDocAberto_Fixa: Boolean;

    //Variavel notificacao hw
    vNotificarHw, vNotificarHw_Fixa: Boolean;

    vDataHora: TDateTime;

    cQuery, cCartaoQ: TIBQuery;
    cTransacao: TIBTransaction;
    hdAtivo, hdEntrada, HdTerminaisF, hdClientes, hdFiscal, hdProducao,
      hdPedVenda, hdFormpag, hdNFSerieD, hdConfig, hdVeiculos,hdVeiculosCCIA, hdEquipamentos,
      hdSugestaoCompra, hdMargem, hdRecibo, hdMva, hdDevolucao , hdRelatorios,
        hdEstoqueECF, hdImportFinan, hdIndTec, hdBoletos, hdCadastrosBasicosCx, hdComissao, hdLancamentos,
        hdContasAReceber, hdIntegraFab, hdOrdemCarregamento, hdFeriado,
        hdMobile, hdMensMobile, hdAgenda, hdMontarPedidos, hdAgendaMecanico, hdControlePecasVendedor,
        hdControlePecasAlmoxarifado, hdReestrutura: THandle;
    handleDevTest: THandle;
    MySubItems: array[0..99] of TMenuItem; // Herbert
    MySubItemsFin: array[0..99] of TMenuItem; // Financeiro
    MySubItemsVeic: array[0..99] of TMenuItem; // Odilon

    DtmPedVenda: TDtmPedVenda;
    
    vVerificarMensagens: Boolean;
    vProcessamentos: TProcessamentosEmSegundoPlano;
    FtimerChavePeriodica: TTimer;
    FTimeExibirMensagemChavePeriodica: TTime;
    FTimeNBackupLog: TTime;
    MenuHwCreditosEmAberto: TMenuItem;
    MenuHwNBackupLog: TMenuItem;
//    thProcessamentos: TThreadProcessamentoSegundoPlano;
//    thHwSuporte: TVerificaHwSuporteAtivo;
    TrayIconDocumentosAbertos: TTrayIcon;
    TimerNotificarBackup: TTimer;
    TimerContasEmAbertoConsultaDiaria: TTimer;
    TimerContasEmAbertoNotificacao: TTimer;
    TimerComercioAbertoConsultaPeriodica: TTimer;
    TimerComercioAbertoNotificacao: TTimer;
    TrayIconComercioAberto: TTrayIcon;
    TimerMensagemBackup: TTimer;
    procedure TimerNotificarBackupTimer(Sender: TObject);
    procedure TimerMensagemBackupTimer(Sender: TObject);
    procedure TimerComercioAbertoNotificacaoTimer(Sender: TObject);
    procedure TimerComercioAbertoConsultaPeriodicaTimer(Sender: TObject);
    procedure TimerContasEmAbertoConsultaDiariaTimer(Sender: TObject);
    procedure TimerContasEmAbertoNotificacaoTimer(Sender: TObject);
    procedure FtimerChavePeriodicaTimer(Sender: TObject);
    procedure MenuHwNBackupLogClick(Sender: TObject);
    function CreateProcessSimple(cmd: string): boolean;
    procedure Menu_Rel(Sender: TObject);
    procedure Menu_RelCX(Sender: TObject);
    procedure Menu_RelVeic(Sender: TObject);
    function abreFormAbout: boolean;
    procedure FechaJanelasMDI(n: integer);
    procedure criarMenusRelatorios;
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    function _LerConfiguracoesRegistroString(NomeVariavel : string) : string;
    procedure _carregarImagemFundo;
    function abreFormConsorciosemAssembleia: Boolean;
    function abreFormVeiculosEmDemonstracao: Boolean;
    function abreFormVeiculosReservasVencidas: Boolean;
    function abreFormVeiculosReservasVencendo: Boolean;
    function gravarDataVeiculosEmDemonstracao: boolean;
    function gravarDataVeiculosVencidos: boolean;
    procedure chamaintegraassohonda;
    procedure _abreHwUpdate(pForcaAtualizacao: Boolean = False);
    procedure _passaVersaoHwUpdate;
    procedure ExibirMensagemChavePeriodica;
    procedure VerificarLogNBackup;
    procedure InicializarTimers;
    function ChaveMensalValida: Boolean;
    procedure MenusReset;
    procedure MenusConfigurarDefaults;
    procedure MenusDesabilitarQuandoNFCeOffline;
    procedure CategoryButtonsReset;
    procedure CategoryButtonsConfigurar;
    procedure EnterTelaConfigurar;
    procedure ClientesAniversariantesdoDia;
    procedure ContasAReceberVerNaEntrada;
    procedure ContasAPagarVerNaEntrada;

    function GridHandlerNeedQueryOOP(var usuario: string): TQuery_OOP;
    function CloseQueryMainFormMsg(AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean;
    function ShowFormMainForm(AFormName: string; AForm: string): Boolean;
    function ShowModalFormMainForm(AFormName: string; AForm: string): Boolean;
    procedure CriarMenu(pForm: TForm);
    procedure DeletarMenu(pForm: TForm);
    function verificaConfiguracoesJanela: string;
    procedure ShowHintBalloon;
    procedure HideHintBalloon;
    function FormularioShowModal: Boolean;
    procedure setar_versao_minima(Sender: TObject);
  var
    public
      { Public declarations }
  end;

var
  frmPrincipalS: TfrmPrincipalS;
  pop_menu_opcoes: TPopupMenu;
  enterTela: TEnterHw;
  vMensagemFinancNaoFech: Boolean;
  vButton: TButtonItem;

implementation

uses uDtmAtivo, uDadosIni, uDtmEntrada, {UdtmTerminalF, UTerminalF,}
  UClassesClientes, UClassesProdutos, {UClassesFinalizadores,}
  uClassesNFSerieD, UClassesVeiculosCCIA, UClassesVeiculos, UClassesCadastrosBasicos, UClassesEquipamentos,
  UClassesConfig, uClassesVendaPerdida, UclassesColaborador,
  uClasseMargemProduto, uClassesAlmoxarifado, UClasseSugestaoCompras, uClassesNotasFiscais,
  URelCrystal, UclassesRecibo, UClassesMvaAjusatada, uClassesProcesso, uClassesTMO,
  UClassesGestor, UClassesBoleto, uClassesAuditoria_V2, uClassesConfigNf, uClassesCIAP, UClassesProducao,
  uClassesEstoqueECF, UClassesDevolucao, uClassesImportacaoFinanceiro,
  uClassesIndiceTecnico, UClassesCadastrosBasicosCx , UClassesRelatorios,
  uClassesCalculoComissao, uClassesLancamentos, uClassesContasAReceber,uClassesContasAPagar,uclasseFP,
  Registry, uClassesSped, uClassesSpedPCBlocoF, uClassesOrdemCarregamento, UClassesMobile,
  uClassesAgenda, uClassesFollowUpPosAtendimento, uClassesEstoqueFechado, ShellAPI,
  uSuporteOnline, uNewHw, {funcoesF, }uclassesconciliacartao, uClassesMDFe,
  uClasseConferenciaCega, uClassesConfigWS, DateUtils, uClassesSpedFBlocoE,
  uClassesSpedFBlocoH, TlHelp32, StrUtils, Math, config_sistema_class, hw_utils, hw_win_utils,
  uCadEmpresa_RepInterna, uClassesNotasFiscais_ServTransporte, hw_Confirmacao, //UclassesintegraFab;
  hw_const_types, hw_grid_utils, uCadPadraoModal, uCadPadrao, uPadrao;

function sintegra2009(comveic, vendBanco: PChar; codempresa: integer; vversao: Pchar; vdtini,
  vdtfinal: Pchar): longbool; stdcall; external 'CompativelHW.dll';

function sistemaRegistrado(vcnpj, vSistema: string): LongBool; stdcall; external 'cons40.dll';

function sistemasRegistrados(vcnpj: string): string; stdcall; external 'cons40.dll';

function registrarNovoSoftware(vcnpj: string): LongBool; stdcall; external 'cons40.dll';

function validaChaveEmpresa(tipo, vBanco, vcodEmpresa: string): boolean; stdcall; external 'cons40.dll';

function chaveDataLicenca(chave: PChar): PChar; stdcall; external 'cons40.dll';

//function abrirAuditoria(cod_emp: Integer): boolean; stdcall; external 'auditoria.dll';

procedure closeallAuditoria ;stdcall; external 'auditoria.dll';

function hw_gerarEFD_ICMSIPI(ACodEmpresa, AEnderecoBanco, AUsuario, ANivel: WideString): Boolean; stdcall; external 'hw.efd.dx.dll';
function hw_gerarEFD_Contribuicoes(AEnderecoBanco, ACNPJ, AUsuario, ACodEmpresa, ANivel: WideString): Boolean; stdcall; external 'hw.efd.dx.dll';

function _exiteNews(pUsuario: PChar; pBancoHw: PChar): Boolean; stdcall; external 'cons40.dll';

function hw_config_sistema_empzero(pChaveIdent, pUsuario: PChar; pCodEmpresa, pNivel: Integer): Integer; stdcall; external 'cons40.dll';

procedure hw_integra_fin_show_creditos_abertos(banco: WideString; empresas: array of Integer; usuario: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_integra_fin_documentos_em_aberto(banco: WideString; empresas: array of Integer; email: WideString; usuarioFinanceiro: Boolean; var dadosnotificacao: WideString); stdcall; external 'hw.utils.dx.dll';

procedure hw_comercio_consultar_notificacoes(banco: WideString; codempresa, codusuario: Integer; var dadosnotificacao: WideString); stdcall; external 'hw.utils.dx.dll';

procedure hw_tray_show_vinculos(banco, usuario: WideString; codempresa: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_nuvemshop_show_vinculos(banco, usuario: WideString; codempresa: Integer); stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

function TfrmPrincipalS.abreFormAbout: boolean;
var
  formulario: TForm;
begin
  try
    formulario := TForm.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Sobre';
    formulario.BorderIcons:= [];
    pnAbout.Visible := True;
    pnAbout.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    lbSeqMin.Caption := IntToStr(vDadosIni.retornaVersaoMinimaCRC(cQuery));
    lbSeqMax.Caption := IntToStr(vDadosIni.retornaVersaoMaximaCRC(cQuery));
    lbSeqErp.Caption := IntToStr(vDadosIni.vCrcSeq);
    pnAbout.Refresh;
    result := (formulario.ShowModal = mrOk);
  finally
    pnAbout.Visible := False;
    pnAbout.Parent := frmPrincipalS;
    formulario.Free;
    formulario := nil;
  end;
end;

function TfrmPrincipalS.abreFormConsorciosemAssembleia: Boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    Exit;

  if vDadosIni.vMensagemConsorcio <> 'S' then
    Exit;
  
  if (vDadosIni.VerificarDataAssembleia(cQuery))then
    exit;

  Application.MessageBox('Reservas de consorcio sem data da assembleia definida.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
end;

function TfrmPrincipalS.abreFormVeiculosEmDemonstracao: Boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    Exit;

  if not vVerificarMensagens then
    Exit;

  if vDadosIni.vatvDemo <> '' then
  begin
    if vDadosIni.vatvDemo = 'S' then
    begin
      if vDadosIni.vdataDemo <> '' then
      begin
        if strtodate(vDadosIni.vdataDemo) <> vDadosIni.getDataBanco(cQuery) then
        begin
          Timer4.Enabled:=false;
          vDadosIni.vPesquisa := 'EMAIL| S';
          formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TFrmDemonstracaoVeiculosCCIA', hdTemp);
          try
            //formulario.ShowModal;
          finally
            vDadosIni.vPesquisa := '';
            formulario.Free;
            unLoadPackage(hdTemp);
          end;
          Timer4.Enabled:=true;
        end;
      end;
    end;
  end;
end;

function TfrmPrincipalS.abreFormVeiculosReservasVencendo: Boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    Exit;

  if not vVerificarMensagens then
    Exit;

  if (vDadosIni.vRegistro.vSisVeiculos and vDadosIni.vSistemasUsuario.vSisVeiculos) then
  begin
    vDadosIni.vPesquisa := 'RESERVAVENCENDO|';
    formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmReservasVencidas', hdTemp);
    try
      formulario.ShowModal;
    finally
      vDadosIni.vPesquisa := '';
      formulario.Free;;
      unLoadPackage(hdTemp);
    end;
  end;
end;

function TfrmPrincipalS.abreFormVeiculosReservasVencidas: Boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    Exit;

  if not vVerificarMensagens then
    Exit;

  if vDadosIni.vatvReserva <> '' then
  begin
    if vDadosIni.vatvReserva = 'S' then
    begin
      if vDadosIni.vdatareserva <> '' then
      begin
//        if strtodate(vDadosIni.vdatareserva) <> vDadosIni.getDataBanco(cQuery) then
//        begin
          Timer4.Enabled:=false;
          vDadosIni.vPesquisa := 'RESERVAVENC|';
          formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmReservasVencidas', hdTemp);
          try
            //formulario.ShowModal;
          finally
            vDadosIni.vPesquisa := '';
            formulario.Free;
            unLoadPackage(hdTemp);
          end;
          Timer4.Enabled:=true;
//        end;
      end;
    end;
  end;
end;

procedure TfrmPrincipalS.AcaoJudicialClick(Sender: TObject);
var
  vAcaoJudicial: TAcaoJudicialSPED;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vAcaoJudicial.cadAcaoJudicialSPED(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.AdministradoradeCartaoClick(Sender: TObject);
var
  vAdministradora: TAdministradoraCartao;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdCadastrosBasicosCx = 0 then
    CarregaPacote('pkCadastrosBasicosCx', hdCadastrosBasicosCx);
  vAdministradora._cadAdmCartao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.AgendaClick(Sender: TObject);
var
  vAgenda: TAgenda;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdPedVenda = 0 then
    CarregaPacote('pkPedidoVenda', hdPedVenda);
  vAgenda._cadAgenda(0);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPrincipalS.AgendaMecnico1Click(Sender: TObject);
var
  vServicosMecanicos: TServicosMecanicos;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdPedVenda = 0 then
    CarregaPacote('pkPedidoVenda', hdPedVenda);
  vServicosMecanicos._cadServicosMecanicos(0);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPrincipalS.AGS1Click(Sender: TObject);
var
  vTAG: TTAG;
begin
  try
    Screen.Cursor := crHourGlass;
  if vDadosIni.vCadBasicos.AHandle = 0 then
    CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
  vTAG._CadTAG(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.AjustesBeneficiosIncentivoICMSDifalPorUFClick(Sender: TObject);
var
  vDifal: TIcmsInterDifalAjustes;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vDifal.abreForm(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Almoxarifado1Click(Sender: TObject);
var
  vControlePecasAlmoxarifado: TEstoqueFechado;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdPedVenda = 0 then
      CarregaPacote('pkPedidoVenda', hdPedVenda);
    vControlePecasAlmoxarifado._ControleAlmoxarifado(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.AlteracaoDePrecoClick(Sender: TObject);
var
  Produto: TProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Produto.cadAlteracaoPreco;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Alternarentrejanelas1Click(Sender: TObject);
begin
  if Application.MainForm.MDIChildCount > 1 then
    Application.MainForm.Next;
end;

procedure TfrmPrincipalS.ArquivodeClientes1Click(Sender: TObject);
var
// cadintegraFab: TIntegraFab;
  hdTemp: THandle;
  formulario: TForm;
begin
  if not vDadosIni.PesqPros('FAB004', 'ABRIR', '', '', '', cQuery, False) then
    Exit;

  carregaPacote('pkautomacao', hdIntegraFab);
  vDadosIni.vPesquisa := 'RELARQUIVOCLIENTES|';
  formulario := Funcoes.AbreForm('pkFabrica', 'TFrmFabrica', hdTemp);

  try
    formulario.Show;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TfrmPrincipalS.ArquivodePecasYamahaClick(Sender: TObject);
var
  hdTemp: THandle;
  formulario: TForm;
begin
  if not vDadosIni.PesqPros('FAB001', 'ABRIR', '', '', '', cQuery, False) then
   Exit;

  carregaPacote('pkautomacao', hdIntegraFab);
  if vDadosIni.vProduto.AHandle = 0 then
   CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
  if vDadosIni.vCtp.AHandle = 0 then
   carregaPacote('pkContasAPagar', vDadosIni.vCtp.AHandle);
//  cadintegraFab.cadIntegraFab(0);
//  UnloadPackage(hdIntegraFab);

    vDadosIni.vPesquisa := 'INTEGRAFABRICAYAMAHA|';
    formulario := Funcoes.AbreForm('pkFabrica', 'TFrmFabrica', hdTemp);

  try
    formulario.Show;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TfrmPrincipalS.ArquivodevendasPorChassi1Click(Sender: TObject);
var
// cadintegraFab: TIntegraFab;
  hdTemp: THandle;
  formulario: TForm;
begin
  if not vDadosIni.PesqPros('FAB003', 'ABRIR', '', '', '', cQuery, False) then
    Exit;

  carregaPacote('pkautomacao', hdIntegraFab);
  vDadosIni.vPesquisa := 'RELARQUIVOVENDAPORCHASSI|';
  formulario := Funcoes.AbreForm('pkFabrica', 'TFrmFabrica', hdTemp);

  try
    formulario.Show;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TfrmPrincipalS.ArquivosDiversosProdutos1Click(Sender: TObject);
type
  TSalvarDisplay = procedure;
var
  SalvarDisplays: TSalvarDisplay;
begin
  if vDadosIni.vProduto.AHandle = 0 then
    CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);

  @SalvarDisplays := GetProcAddress(vDadosIni.vProduto.AHandle, 'produtos_salvar_display_para_usar_arquivo_configuravel');
  if Assigned(SalvarDisplays) then
    SalvarDisplays();

  UsarPlanilhaParaInserirAlterar('FileName=');
end;

procedure TfrmPrincipalS.ArquivosFiscaisDESClick(Sender: TObject);
var
  vGerarDES: TGerarDES;
  hdDES: thandle;
begin
  try
    Screen.Cursor := crHourGlass;
    hdDES := 0;
  	hdDES := LoadLibrary(Pchar('DES.dll'));
  	if hdDES <> 0 then
  	begin
    	@vGerarDES := GetProcAddress(hdDES, PChar('gerarDES'));
      vGerarDES(PChar(vDadosIni.codEmpresa));
    end;
  finally
    Screen.Cursor := crDefault;
    if hdDES <> 0 then
   		FreeLibrary(hdDES);
  end;
end;

procedure TfrmPrincipalS.ArquivosFiscaisSintegraClick(Sender: TObject);
var
  //vTerminais: TTerminaisF;
  dataIni, dataFim: TDateTime;
  label3: TLabel;
begin
  inherited;
  try

    if not vDadosIni.PesqPros('REL024', 'CONSULTA', '', '', '',
      cQuery, True) then
      Exit;

    Screen.Cursor := crHourGlass;
    //vTerminais := TTerminaisF.create;
    //vTerminais.abreTerminais;
    label3 := TLabel.Create(Self);
    //vTerminais.vdtini := StartOfTheMonth(IncMonth(Date,-1));
    //vTerminais.vdtfim := EndOfTheMonth(IncMonth(Date, - 1));
    {
    if Application.MessageBox('Deseja sincronizar dados dos Caixas?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      vTerminais.sincronizacaoParaSintegra;
      }

    dataIni := StartOfTheMonth(IncMonth(Date,-1));
    dataFim := EndOfTheMonth(dataIni);

    sintegra2009(PCHAR(vDadosIni.vEmp.vConcess), pchar(vDadosIni.vBancoHW),
      StrToInt(vDadosIni.codEmpresa),
      pchar('4.1'), pchar(DateToStr(dataIni)),
      pchar(DateToStr(dataFim)));

  finally
    Screen.Cursor := crDefault;
  end;
  //  sintegra2009('S','127.0.0.1:c:\clientes\motomol\Hwauto.gdb',1,pchar(vDadosIni.vVersaoFiscal));
end;

procedure TfrmPrincipalS.ArquivosFiscaisSpedFiscalClick(Sender: TObject);
begin
  try
    if not vDadosIni.PesqPros('REL025', 'CONSULTA', '', '', '',
      cQuery, True) then
      Exit;


    Screen.Cursor := crHourGlass;
    hw_gerarEFD_ICMSIPI(pchar(vDadosIni.CodEmpresa), pchar(vDadosIni.vBancoHW), PChar(vDadosIni.vNomeUsuario), PChar(IntToStr(vDadosIni.vNivel)));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ArquivosFiscaisSpedPISCOFINSClick(Sender: TObject);
begin
  try
   if not vDadosIni.PesqPros('REL026', 'CONSULTA', '', '', '',
      cQuery, True) then
      Exit;

    Screen.Cursor := crHourGlass;
    hw_gerarEFD_Contribuicoes(pchar(vDadosIni.vBancoHW), PChar(vDadosIni.vEmp.vCNPJ), PChar(vDadosIni.vNomeUsuario), PChar(vDadosIni.codEmpresa), PChar(IntToStr(vDadosIni.vNivel)));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ArquivosPeasContasaPagareTSI1Click(Sender: TObject);
var
  hdTemp: THandle;
  formulario: TForm;
begin
  if not vDadosIni.PesqPros('FAB001', 'ABRIR', '', '', '', cQuery, False) then
   Exit;

  carregaPacote('pkautomacao', hdIntegraFab);
  if vDadosIni.vProduto.AHandle = 0 then
   CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
  if vDadosIni.vCtp.AHandle = 0 then
   carregaPacote('pkContasAPagar', vDadosIni.vCtp.AHandle);
//  cadintegraFab.cadIntegraFab(0);
//  UnloadPackage(hdIntegraFab);

    vDadosIni.vPesquisa := 'INTEGRAFABRICA|';
    formulario := Funcoes.AbreForm('pkFabrica', 'TFrmFabrica', hdTemp);

  try
    formulario.Show;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TfrmPrincipalS.HwUpdateClick(Sender: TObject);
var
  vProgRecep: THandle;
  vRetorno: Smallint;
  copyDataStruct : TCopyDataStruct;
begin

  vProgRecep:=FindWindow('TfrmHwUpdate', nil);
  if vProgRecep = 0 then
  begin
    Sleep(2000);
    Application.MessageBox('O Atualizador não esta em execução. O sistema irá tentar carregar o Atualizador. Tente novamente', 'Atenção', 0 + 64);
    vDadosIni.CreateProcessSimple( ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HW_MENS_CONFIGURAR ' + vDadosIni.vVersaoBpl);
    Exit;
  end;

  copyDataStruct.dwData := 3; //use it to identify the message contents
  copyDataStruct.cbData := 1 + Length(vDadosIni.vVersaoBpl) ;
  copyDataStruct.lpData := PChar(vDadosIni.vVersaoBpl);

  vDadosIni.forcaFocoNoSistema(vProgRecep);
  vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@copyDataStruct)) ;
//  vDadosIni.forcaFocoNoSistema(Application.Handle);
  if vRetorno = 0 then
    Application.MessageBox('O Atualizador não esta respondendo', 'Atenção', 0 + 64)
  else if vRetorno = 2 then
    Application.MessageBox('Programa em Execução. Tente depois de alguns minutos', 'Atenção', 0 + 64);
end;

procedure TfrmPrincipalS.AuditoriaClick(Sender: TObject);
var
  vAuditoriaV2: TAuditoriaV2;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vAuditoriaV2.cadAuditoria(dtmEnt.qrBuscas);
  finally
    Screen.Cursor := crDefault;
  end;
//  try
//    Screen.Cursor := crHourGlass;
//    if not vDadosIni.PesqPros('AUD001', 'CONSULTA', 'ABRIR AUDITORIA CONSULTA', 'AUDITORIA', '',
//      cQuery, True) then
//      Exit;
//    abrirAuditoria(StrToInt(vDadosIni.codEmpresa));
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmPrincipalS.BairrosClick(Sender: TObject);
var
  vBairro: TBairros;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vBairro.CadBairro(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.BitBtn1Click(Sender: TObject);
var
  i: Integer;
begin


  {
  i := 0;
  vDadosIni.progressoFuncao('Inicio', 'uaisuiausi', 'inicio 1');
  Sleep(1000);
  while i <= 100 do
  begin
    Application.ProcessMessages;
    inc(i);
    vDadosIni.progressoFuncao('', '', 'inicio ' + IntToStr(i));
    Sleep(10);
    if vDadosIni.vParar = 1 then
      //  if Application.MessageBox('Deseja realmente parar o processamento','Confirmação',MB_YESNO+MB_ICONQUESTION) = IDYES then
    begin
      vDadosIni.finalizaProgresso;
      Break;
    end;
  end;
  vDadosIni.finalizaProgresso;
  }
end;

procedure TfrmPrincipalS.BitBtn2Click(Sender: TObject);
begin
  TForm(pnAbout.Parent).ModalResult := IDOK;
end;

procedure TfrmPrincipalS.BoletimDeCaixaClick(Sender: TObject);
var
  lanc: TLancamentos;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdLancamentos = 0 then
      carregaPacote('pkLancamentos', hdLancamentos);
    lanc.cadLancamentos(1);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.BoletosBancariosClick(Sender: TObject);
var
  boleto: TBoleto;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdBoletos = 0 then
      carregaPacote('pkBoletos', hdboletos);
    boleto.cadBoleto(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.BoxClick(Sender: TObject);
var
  vBox: TBox;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vBox._cadBox(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.btOpcoesClick(Sender: TObject);
var
	MenuItem: TMenuItem;
begin
	if Assigned(pop_menu_opcoes) then
  	FreeAndNil(pop_menu_opcoes);

  pop_menu_opcoes := TPopupMenu.Create(Self);

  MenuItem := TMenuItem.Create(pop_menu_opcoes);
  MenuItem.Caption := 'Setar versão do sistema com versão mínima recomendada - [CFG063]';
  MenuItem.OnClick := setar_versao_minima;
  pop_menu_opcoes.Items.Add(MenuItem);

  pop_menu_opcoes.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmPrincipalS.CadastrosDeClientesFornecedorClick(Sender: TObject);
var
  Clientes: TCadClientes;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    Clientes.CadCliente(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CadastrosDeKitsClick(Sender: TObject);
var
  Kits: TKitsProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Kits.CadKits(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CadastrosDePerfilDeProdutosClick(Sender: TObject);
var
  PerfilProd: TPerfilProduto;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    PerfilProd.CadPerfilProd(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CadastrosevinculosTray1Click(Sender: TObject);
begin                   
  if not vDadosIni.PesqPros('PRO382', 'ABRIR', '', '', '', cQuery, False) then
    Exit;

  if (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'NUVEMSHOP') then
  	hw_nuvemshop_show_vinculos(vDadosIni.vBancoHW, vDadosIni.vNomeUsuario, vDadosIni.cod_empresa)
  else
	  hw_tray_show_vinculos(vDadosIni.vBancoHW, vDadosIni.vNomeUsuario, vDadosIni.cod_empresa);
end;

procedure TfrmPrincipalS.CalculoDeComissoesClick(Sender: TObject);
var
  vComissao: TCalculoComissao;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdComissao = 0 then
      CarregaPacote('pkCalculoComissao', hdComissao);
    vComissao.abreCalculoComissao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CalculoDeJurosFinanceiroClick(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  try
    Screen.Cursor := crHourGlass;
    gestor := TGestorFormularios.Create;
    gestor.cadFinancasCustos(2);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CalculoDeMargemDoProdutoShiftF5Click(Sender: TObject);
var
  vMargemProd: TMargemProduto;
begin
  try
    Screen.Cursor := crHourGlass;
    vMargemProd.cadMargemProduto;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CalculodePlanodePagamento1ShiftF7Click(
  Sender: TObject);
var
  hdFormPag: Cardinal;
  vPlano: TComunicacaoFormaPagamento;
  vrplano: currency;
begin
//  try
//    Screen.Cursor := crHourGlass;
//    if obPedVenda = nil then
//      obPedVenda := TPedVenda.create;
//    obPedVenda.abrePlanoPagamento;
//  finally
//    Screen.Cursor := crDefault;
//  end;
CarregaPacote('pkFormPag', hdFormPag);
vPlano := TComunicacaoFormaPagamento.Create;
vrplano:=0;
vPlano.iniciaPlanoDePagamento(0,0,0,0,0,0,'','',vrplano,'');
//vPlano.iniciaPlanoDePagamento(0,0,0,0.00,0.00,0.00,'','',0.00);
UnloadPackage(hdFormPag);
end;

procedure TfrmPrincipalS.DadosdaEmpresaClick(Sender: TObject);
var
  vEmp: TEmpresa;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vEmp.CadEmpresa(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.DefinirPlanodeFundo11Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    _GravaConfiguracoesString(Image1.Name+'_01_' + vDadosIni.codEmpresa, OpenPictureDialog1.FileName);
end;

procedure TfrmPrincipalS.DefinirPlanodeFundo21Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    _GravaConfiguracoesString(Image1.Name+'_02_' + vDadosIni.codEmpresa, OpenPictureDialog1.FileName);
end;

procedure TfrmPrincipalS.DeletarMenu(pForm: TForm);
var
  I: Integer;
begin
  for I := 0 to cbMenusAbertos.Categories[0].Items.Count - 1 do
    if Pos('{' + trim(pForm.Name) + '}', trim(cbMenusAbertos.Categories[0].Items[I].Hint)) > 0 then
    begin
      cbMenusAbertos.Categories[0].Items[I].Destroy;
      Break;
    end;

  try
  	cbMenusAbertos.Enabled := False;

    cbMenusAbertos.Visible  := cbMenusAbertos.Categories[0].Items.Count > 0;
    cbMenusAbertos.Enabled  := cbMenusAbertos.Visible;

    cbMensagens.Top := 0;
    cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

    if cbMenusAbertos.Categories[0].Items.Count <= 1 then
      cbMenusAbertos.Categories[0].Caption := '...'
    else if cbMenusAbertos.Categories[0].Items.Count = 2 then
      cbMenusAbertos.Categories[0].Caption := 'Abe'
    else
      cbMenusAbertos.Categories[0].Caption := 'Abertos';

    if cbMenusAbertos.Categories[0].Collapsed then
    begin
    	cbMenusAbertos.Tag    := 5 + (cbMenusAbertos.Categories[0].Items.Count * 25);
    	cbMenusAbertos.Height := 18;
    end
    else
    begin
      cbMenusAbertos.Height := 5 + (cbMenusAbertos.Categories[0].Items.Count * 25);
      cbMenusAbertos.Tag    := 18;
    end;
  finally
  	cbMenusAbertos.Enabled := True;
  end;
end;

procedure TfrmPrincipalS.DemaisReceitaseouCreditosClick(Sender: TObject);
var
  vOutRecCred: TOutrasReceitasOuCreditosSPEDPC;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vOutRecCred.cadOutrasReceitasOuCreditos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.DemonstracoesVeiculos1Click(Sender: TObject);
var
  vDemonstracaoVeiculosCCIA : TDemonstracaoCCIA;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdVeiculosCCIA = 0 then
     CarregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);

     vDemonstracaoVeiculosCCIA._DemonstracaoVeiculos(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.DepartamentosClick(Sender: TObject);
var
  Departamento: TDepartamentos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    Departamento.CadDepartamentos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.DesoneracaodeICMSClick(Sender: TObject);
var
  AshowForm: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    @AshowForm := GetProcAddress(vDadosIni.vProduto.AHandle, 'desoneracao_show');
    if Assigned(AshowForm) then
      AshowForm(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.DevolucaoDeMercadoriasClick(Sender: TObject);
var
  devolucao: TDevolucao;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdDevolucao = 0 then
      CarregaPacote('pkDevolucao', hdDevolucao);
    devolucao.CadDevolucao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.DocumentosEmAbertoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  InicializarTimers;
  try
    hw_integra_fin_show_creditos_abertos(WideString(vDadosIni.vBancoHW), vDadosIni.vEmp.UnificadasArray, vDadosIni.vCodUsuario);
  finally
    if (not vDadosIni.vEmp.vFinanceiroUnificado) or (vDadosIni.vEmp.vCodigoUnificadora = vDadosIni.cod_empresa)  then
      TimerContasEmAbertoConsultaDiaria.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CadastrodeMensagemMobile1Click(Sender: TObject);
var
 vMensMobile: TMensMobile;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdMensMobile = 0 then
      CarregaPacote('pkMobile', hdMensMobile);
    vMensMobile._cadMensMobile(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CadastrodeMensagemMobileClick(Sender: TObject);
 var
 vMensMobile: TMensMobile;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdMensMobile = 0 then
      CarregaPacote('pkMobile', hdMensMobile);
    vMensMobile._cadMensMobile(0);
  finally
    Screen.Cursor := crDefault;
  end;


end;

procedure TfrmPrincipalS.CadastrodeMobileClick(Sender: TObject);
var
  vMobile: TMobile;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdMobile = 0 then
      CarregaPacote('pkMobile', hdMobile);
    vMobile._cadMobile(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CadastroDeProdutosClick(Sender: TObject);
var
  Produto: TProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Produto.CadProdutos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CadastrodePromocaoClick(Sender: TObject);
var
  Promocao: TPromocao;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Promocao._cadPromocao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CascataClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TfrmPrincipalS.CategoriaClick(Sender: TObject);
var
  vCadCategorias: TCadCategorias;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vCadBasicos.AHandle);
    vCadCategorias._cadCategoria(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CategoryButtons1Categories0Items0Click(
  Sender: TObject);
begin
  // Linhas para testar se o formulario selecionado pelo botao ja esta aberto.
  // Troque o nome do formulario FrmPrincipalS para o formulario a ser aberto.
  //  if frmPrincipalS = nil then
  //    Application.CreateForm(TfrmPrincipalS,frmPrincipalS);
  //  frmPrincipalS.Show;

end;

procedure TfrmPrincipalS.CategoryButtonsReset;
begin
  cbMenusAbertos.Visible := False;
  cbAutomacao.Visible  := False;
  cbFinanceiro.Visible := False;
  cbPAFECF.Visible     := False;
  cbVeiculo.Visible    := False;
  cbCRM.Visible        := False;
  cbGestor.Visible     := False;
  cbMenusAbertos.Enabled := cbMenusAbertos.Visible;
  cbAutomacao.Enabled  := cbAutomacao.Visible;
  cbFinanceiro.Enabled := cbFinanceiro.Visible;
  cbPAFECF.Enabled     := cbPAFECF.Visible;
  cbVeiculo.Enabled    := cbVeiculo.Visible;
  cbCRM.Enabled        := cbCRM.Visible;
  cbGestor.Enabled     := cbGestor.Visible;
end;

procedure TfrmPrincipalS.cbAutomacaoCategoryCollapase(Sender: TObject;
  const Category: TButtonCategory);
begin
  if (TCategoryButtons(Sender).Height = 18) then
  begin
    TCategoryButtons(Sender).Height := TCategoryButtons(Sender).Tag;
  end
  else
  begin
    TCategoryButtons(Sender).Tag := TCategoryButtons(Sender).Height;
    TCategoryButtons(Sender).Height := 18;
  end;
end;

procedure TfrmPrincipalS.cbFinanceiroCategories0Items5Click(Sender: TObject);
var
  vImpAuto: TImportacaoAutomacao;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);
    vImpAuto.abreImpAuto;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.cbMensagensCategories0Items0Click(Sender: TObject);
var
  vMensMobile: TMensMobile;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdMensMobile = 0 then
      CarregaPacote('pkMobile', hdMensMobile);
    vMensMobile._cadVerMensMobile(0, vTipoMensagem);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.cbMenusAbertosCategoryCollapase(Sender: TObject;
  const Category: TButtonCategory);
begin
	if (TCategoryButtons(Sender).Height = 18) then
  begin
    TCategoryButtons(Sender).Height := TCategoryButtons(Sender).Tag;
    if TCategoryButtons(Sender).Categories[0].Items.Count <= 1 then
      TCategoryButtons(Sender).Categories[0].Caption := '...'
    else if TCategoryButtons(Sender).Categories[0].Items.Count = 2 then
      TCategoryButtons(Sender).Categories[0].Caption := 'Abe'
    else
      TCategoryButtons(Sender).Categories[0].Caption := 'Abertos';
  end
  else
  begin
    TCategoryButtons(Sender).Tag := TCategoryButtons(Sender).Height;
    TCategoryButtons(Sender).Height := 18;
    TCategoryButtons(Sender).Categories[0].Caption := 'Abertos';
  end;
end;

procedure TfrmPrincipalS.cbMenusAbertosClick(Sender: TObject);
var
  X : Byte;
begin
	if MDIChildCount <= 1 then
  	Exit;

  if not Assigned(vButton) then
    Exit;

  if trim(vButton.Hint) = '' then
    Exit;

  if MDIChildCount > 0 then
    for X := 0 to Pred(MDIChildCount) do
      if Pos('{' + trim(MDIChildren[X].Name) + '}', trim(vButton.Hint)) > 0 then
      begin
      	try
        	Screen.Cursor := crHourGlass;
          MDIChildren[X].Show;
          Break;
        finally
        	Screen.Cursor := crDefault;
        end;
      end;
end;

procedure TfrmPrincipalS.cbMenusAbertosSelectedItemChange(Sender: TObject;
  const Button: TButtonItem);
var
  X : Byte;
begin
	if MDIChildCount <= 1 then
  	Exit;

  if not Assigned(Button) then
    Exit;

  if trim(Button.Hint) = '' then
    Exit;

  vButton           := Button;
end;

procedure TfrmPrincipalS.cbVeiculoCategories0Items0Click(Sender: TObject);
var
  Clientes: TCadClientes;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    Clientes.CadCliente(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.cbVeiculoCategories0Items1Click(Sender: TObject);
var
  VeiculoCCIA: TEstMotoCCIA;
begin
 try
   Screen.Cursor := crHourGlass;
  if hdVeiculos = 0 then
    carregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);
    VeiculoCCIA.CadVeiculosMov(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.cbVeiculoCategories0Items2Click(Sender: TObject);
var
  vVeiculosCCIA : TVeiculosCCIA;
begin
  try
    Screen.Cursor := crHourGlass;
   if hdVeiculosCCIA = 0 then
   begin
   CarregaPacote('pkVeiculosCCIA',hdVeiculosCCIA);
   end;
   vVeiculosCCIA._VendaVeiculos(0);
     finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPrincipalS.cbVeiculoCategories0Items3Click(Sender: TObject);
var
  vFilaReserva : TFilaReserva;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdVeiculosCCIA = 0 then
     CarregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);

   vFilaReserva.abreFormFilaReserva(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.cbVeiculoCategories0Items4Click(Sender: TObject);
var
  vDemonstracaoVeiculosCCIA : TDemonstracaoCCIA;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdVeiculosCCIA = 0 then
     CarregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);

     vDemonstracaoVeiculosCCIA._DemonstracaoVeiculos(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CentrodeCustosClick(Sender: TObject);
var
  vCentroCusto: TCentroCustos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vCentroCusto.CadCentroCustos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CEP1Click(Sender: TObject);
var
  vCep: TCEP;
begin
 try
    Screen.Cursor := crHourGlass;
  if vDadosIni.vCadBasicos.AHandle = 0 then
    CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
  vCep._CadCep(0);
 finally
    Screen.Cursor := crDefault;
 end;

end;

procedure TfrmPrincipalS.CESTClick(Sender: TObject);
var
  Produto: TProdutos;
  AshowForm: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);

    if vDadosIni.getConfSisObject('nf_icmsst_cest_v2', cQuery).value1_f = 1 then
    begin
      @AshowForm := GetProcAddress(vDadosIni.vProduto.AHandle, 'cest_show');
      if Assigned(AshowForm) then
        AshowForm(False);
    end
    else
      Produto.CadCEST(0);
  finally
    Screen.Cursor := crDefault;
  end;
{var
  Produto: TProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Produto.CadCEST(0);
  finally
    Screen.Cursor := crDefault;
  end;
  }
end;

procedure TfrmPrincipalS.chamaintegraassohonda;
var
 vdataatual,vdatabanco: Tdate;
 vGetDataBanco: TDate;
 hdTemp: THandle;
 formulario: TForm;
begin
  if vDadosIni.vusintassohonda = 'S' then
  begin
    vGetDataBanco := vDadosIni.getDataBanco(cQuery);

    if DayOfWeek(vGetDataBanco-1) = 1 then
      vdataatual := vGetDataBanco - 2
    else
      vdataatual := vGetDataBanco - 1;

    cQuery.Close;
    cQuery.SQL.Text := ' select count(*) as valor from integra_assohonda ' +
     ' where data_arquivo = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
     ' and cod_empresa = ' +  vDadosIni.CodEmpresa;
    cQuery.Open;
    if cQuery.FieldByName('valor').asinteger = 0 then
    begin
      vdatabanco := vGetDataBanco;

      cQuery.close;
      cQuery.SQL.Text := ' select DATAENVASSOHONDA from empresa ' +
       ' where cod_empresa = ' + vDadosIni.CodEmpresa;
      cQuery.open;

      if (cQuery.FieldByName('DATAENVASSOHONDA').AsDateTime <> vdatabanco) then
      begin
        try
          cQuery.Close;
          cQuery.SQL.Text := ' UPDATE EMPRESA SET DATAENVASSOHONDA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdatabanco)) +
            ' WHERE COD_EMPRESA = ' + vDadosIni.CodEmpresa;
          cQuery.Prepare;
          cQuery.ExecSQL;
          cTransacao.Commit;

          vDadosIni.vPesquisa := 'ASSOHONDAVENDAESTOQUE|';
          formulario := Funcoes.AbreForm('pkFabrica', 'TFrmFabrica', hdTemp);

          try
            formulario.Showmodal;
          finally
            formulario.Free;
            unLoadPackage(hdTemp);
          end;

        except
         cTransacao.Rollback;
        end;
      end;
    end;
  end;
end;

function TfrmPrincipalS.ChaveMensalValida: Boolean;
begin
  Result := validaChaveEmpresa('HW' + vDadosIni.vVersaoBpl, vDadosIni.vBancoHW, vDadosIni.CodEmpresa);
  if not Result then
  begin
    MenusReset;
    MenusConfigurarDefaults;
    MenusDesabilitarQuandoNFCeOffline;; 
    CategoryButtonsConfigurar;
    MenuConfiguracoes.Visible := False;
  end;
end;

procedure TfrmPrincipalS.ChequesClick(Sender: TObject);
var
  cheque: TContasAReceber;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdContasAReceber = 0 then
      carregaPacote('pkContasAReceber', hdContasAReceber);
    cheque.cadContasAReceber(0, 'S1');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CIAPClick(Sender: TObject);
var
  vCiap: TCIAP;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vCiap.CadCiap(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CidadesClick(Sender: TObject);
var
  vCidade: TCidades;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vCidade.CadCidade(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ClientesAniversariantesdoDia;
var
	Clientes: TCadClientes;
begin
	if not ((vDadosIni.vRegistro.vSisCaixaGeral) and (vDadosIni.vSistemasUsuario.vSisCaixaGeral)) then
    Exit;

  if (Trim(vDadosIni.vaniversariantesDia) = 'S') or (Trim(vDadosIni.vaniversariantesDia) = 's') then
  begin
    if ShowCustomDlg.Msg('Deseja visualizar os aniversariantes do dia?', mdtQuestion, [brYes, brNo])
      .SetDontAnskAgain('Não exibir mensagem novamente neste dia')
      .Show()
      .ResultDlg = IDYES
    then
    {
    if TConfirmacao.Preview(
    	'ANIVERS_CLI',
      'Atenção',
      #13 + 'Deseja visualizar os aniversariantes do dia?',
      'Não exibir mensagem novamente neste dia') then //ShowConfirmacao('', MB_YESNO + MB_DEFBUTTON2) = mrYES then
      }
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := 'ANIVERSARIANTE_CLIENTE|0|';
        if hdClientes = 0 then
          carregaPacote('pkClientes', hdClientes);
        Clientes.CadCliente(0);
      finally
        vDadosIni.vPesquisa := '';
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

function TfrmPrincipalS.CloseQuery: Boolean;
type
	TCloseQueryMainFormMsg = function (AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean of object;
  TSetCloseQueryMainFormMsg = procedure (evento: TCloseQueryMainFormMsg);
var
	setCloseQueryMainFormMsg: TSetCloseQueryMainFormMsg;
begin
	try
    if vDadosIni.vFormularios.AHandle = 0 then
    	CarregaPacote('pkFormularios', vDadosIni.vFormularios.AHandle);

    @setCloseQueryMainFormMsg := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setEventoCloseQueryMainForm'));

    if Assigned(setCloseQueryMainFormMsg) then
      setCloseQueryMainFormMsg(nil);

    Result := inherited CloseQuery();
  finally
  	if not Result then
      setCloseQueryMainFormMsg(CloseQueryMainFormMsg);
  end;
end;

function TfrmPrincipalS.CloseQueryMainFormMsg(
	AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean;
var
	X : Byte;
  vform: TForm;
  vTag: Integer;
begin
	Result := False;

  if (AFormName = 'frmPadrao') and (AForm = 'TfrmPadrao') then
  begin
  	Result := True;
    Exit;
  end;

  if AExibirPerg then
    if Assigned(ADBGrid) then
      if ADBGrid.DataSource <> nil then
        if ADBGrid.DataSource.DataSet.State in [dsInsert, dsEdit] then
          if Application.MessageBox('Deseja mesmo sair desta tela. Os dados não serão salvos.',
            'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
              Exit;

  if MDIChildCount > 0 then
    for X := 0 to Pred(MDIChildCount) do
      if (MDIChildren[X].Name = AFormName) then
      begin
        vform := MDIChildren[X];

        DeletarMenu(vform);

        if Assigned(ADBGrid) then
        	if ADBGrid.DataSource <> nil then
            if ADBGrid.DataSource.DataSet.State in [dsInsert, dsEdit] then
            begin
            	if AForm = 'TfrmCadPadraoM' then
              begin
              	if TfrmCadPadraoM(vform).PageControl1.ActivePage = TfrmCadPadraoM(vform).TabSheet1 then
                begin
                	try
                    vTag := TfrmCadPadraoM(vform).BitBtn5.Tag;
                  	TfrmCadPadraoM(vform).BitBtn5.Tag := 99;// Não perguntar se vai fechar
                    TfrmCadPadraoM(vform).BitBtn5.Click;
                  finally
                    TfrmCadPadraoM(vform).BitBtn5.Tag := vTag;
                  end;
                end
                else
              		ADBGrid.DataSource.DataSet.Cancel;
              end
              else if AForm = 'TfrmCadPadrao' then
        			begin
                if TfrmCadPadrao(vform).PageControl1.ActivePage = TfrmCadPadrao(vform).TabSheet1 then
                begin
                	try
                    vTag := TfrmCadPadrao(vform).BitBtn5.Tag;
                    TfrmCadPadrao(vform).BitBtn5.Tag := 99;// Não perguntar se vai fechar
                    TfrmCadPadrao(vform).BitBtn5.Click;
                  finally
                  	TfrmCadPadrao(vform).BitBtn5.Tag := vTag;
                  end;
                end
                else
              		ADBGrid.DataSource.DataSet.Cancel;
              end
              else
              	ADBGrid.DataSource.DataSet.Cancel;
            end;

        vform.Enabled := False;
        vform.DisableAlign;
        vform.DisableAutoRange;

        if AForm = 'TfrmCadPadraoM' then
        begin
        	if TfrmCadPadraoM(vform).PageControl1.ActivePage <> TfrmCadPadraoM(vform).TabSheet2 then
          begin
            TfrmCadPadraoM(vform).PageControl1.ActivePage := TfrmCadPadraoM(vform).TabSheet2;
            TfrmCadPadraoM(vform).TabSheet2.Show;
          end;
      	end
        else if AForm = 'TfrmCadPadrao' then
        begin
        	if TfrmCadPadrao(vform).PageControl1.ActivePage <> TfrmCadPadrao(vform).TabSheet2 then
          begin
            TfrmCadPadrao(vform).PageControl1.ActivePage  := TfrmCadPadrao(vform).TabSheet2;
            TfrmCadPadrao(vform).TabSheet2.Show;
          end;
        end;

        if vform.FormStyle <> fsMDIForm then
        	vform.FormStyle := fsMDIForm;
        vform.Visible := False;

        vform.EnableAlign;
        vform.EnableAutoRange;
        vform.Enabled := True;

        Exit;
      end;

  for X := 0 to Application.ComponentCount - 1 do
    if Application.Components[X] is TForm then
    	if not (TForm(Application.Components[X]) = Application.MainForm) then
        if TForm(Application.Components[X]).Name = AFormName then
        begin
        	if Assigned(ADBGrid) then
            if ADBGrid.DataSource <> nil then
              if ADBGrid.DataSource.DataSet.State in [dsInsert, dsEdit] then
              begin
                if AForm = 'TfrmCadPadraoM' then
                begin
                  if TfrmCadPadraoM(TForm(Application.Components[X])).PageControl1.ActivePage = TfrmCadPadraoM(TForm(Application.Components[X])).TabSheet1 then
                    TfrmCadPadraoM(TForm(Application.Components[X])).BitBtn5.Click
                  else
                    ADBGrid.DataSource.DataSet.Cancel;
                end
                else if AForm = 'TfrmCadPadrao' then
                begin
                  if TfrmCadPadrao(TForm(Application.Components[X])).PageControl1.ActivePage = TfrmCadPadrao(TForm(Application.Components[X])).TabSheet1 then
                    TfrmCadPadrao(TForm(Application.Components[X])).BitBtn5.Click
                  else
                    ADBGrid.DataSource.DataSet.Cancel;
                end
                else
                  ADBGrid.DataSource.DataSet.Cancel;
              end;

        	TForm(Application.Components[X]).Enabled := False;
          TForm(Application.Components[X]).DisableAlign;
          TForm(Application.Components[X]).DisableAutoRange;

          if AForm = 'TfrmCadPadraoM' then
        	begin
          	if TfrmCadPadraoM(TForm(Application.Components[X])).PageControl1.ActivePage <> TfrmCadPadraoM(TForm(Application.Components[X])).TabSheet2 then
            begin
              TfrmCadPadraoM(TForm(Application.Components[X])).PageControl1.ActivePage := TfrmCadPadraoM(TForm(Application.Components[X])).TabSheet2;
              TfrmCadPadraoM(TForm(Application.Components[X])).TabSheet2.Show;
            end;
          end
          else if AForm = 'TfrmCadPadrao' then
        	begin
          	if TfrmCadPadrao(TForm(Application.Components[X])).PageControl1.ActivePage <> TfrmCadPadrao(TForm(Application.Components[X])).TabSheet2 then
            begin
              TfrmCadPadrao(TForm(Application.Components[X])).PageControl1.ActivePage := TfrmCadPadrao(TForm(Application.Components[X])).TabSheet2;
              TfrmCadPadrao(TForm(Application.Components[X])).TabSheet2.Show;
            end;
          end;

          if not AFechar then
       			TForm(Application.Components[X]).OnClose := nil;

          if TForm(Application.Components[X]).FormStyle <> fsNormal then
          	TForm(Application.Components[X]).FormStyle := fsNormal;

          TForm(Application.Components[X]).EnableAlign;
          TForm(Application.Components[X]).EnableAutoRange;
          TForm(Application.Components[X]).Enabled := True;
        end;

  Result := True;
end;

procedure TfrmPrincipalS.CodigoEstadoeCidadeIbge1Click(Sender: TObject);
var
  vAtualizaBCIDIBGE: TAtualizaBCIDIBGE;
begin
  vAtualizaBCIDIBGE:=TAtualizaBCIDIBGE.create;
  vAtualizaBCIDIBGE.corrigeCODIGOIBGE;
  vAtualizaBCIDIBGE.Free;
end;

procedure TfrmPrincipalS.Combustveis1Click(Sender: TObject);
var
  vCombustiveis: TCombustivel;
begin
  try
    Screen.Cursor := crHourGlass;
  if vDadosIni.vCadBasicos.AHandle = 0 then
    CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
  vCombustiveis._CadCombustivel(0);
      finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CondicoesDePagamentoClick(Sender: TObject);
var
  obCondPag: TCondicaoPagamento;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    obCondPag.cadCondicaoPagamento(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConfernciaCegaClick(Sender: TObject);
var
  vCC: TConferenciaCega;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    vCC.cadConferenciaCega(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConfiguracaoAPIsClick(Sender: TObject);
var
  vAPI: TConfigAPI;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vAPI.cadConfigAPI(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConfiguracaoBoletaCobreBemClick(Sender: TObject);
var
  vCb: TCobreBem;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdBoletos = 0 then
      carregaPacote('pkBoletos', hdboletos);
    vCb.cadCobreBem(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConfiguracoesReplicacaoInternaClick(Sender: TObject);
begin
	if vDadosIni.PesqPros('BAS411', 'ABRIR', '', 'EMPRESA', '', cQuery) then
  begin
    inherited;
    if frmCadEmpresaRepInterna = nil then
    	Application.CreateForm(TfrmCadEmpresaRepInterna, frmCadEmpresaRepInterna);
    frmCadEmpresaRepInterna.Show;
  end;
end;

procedure TfrmPrincipalS.ConfiguracoesSimulacaoProgramaFidelidadeClick(Sender: TObject);
var
  vRegrasProgramasFidelidades: TRegrasProgramasFidelidades;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vRegrasProgramasFidelidades.cadRegrasProgramaFidelidades(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConfiguraodeAjustesAutomticosC197e19211Click(
  Sender: TObject);
var
  AshowForm: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);

    @AshowForm := GetProcAddress(vDadosIni.vSped.AHandle, 'ajustesautoefd_show');
    if Assigned(AshowForm) then
      AshowForm(False);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CategoryButtonsConfigurar;
begin
	cbMenusAbertos.Visible := (MDIChildCount > 0);
  cbAutomacao.Visible  := (vDadosIni.vRegistro.vSisAutomacao and vDadosIni.vSistemasUsuario.vSisAutomacao);
  cbFinanceiro.Visible := (vDadosIni.vRegistro.vSisCaixaGeral and vDadosIni.vSistemasUsuario.vSisCaixaGeral);
  cbPAFECF.Visible     := (vDadosIni.vRegistro.vSisPAFECF and vDadosIni.vSistemasUsuario.vSisPAFECF);
  cbVeiculo.Visible    := (vDadosIni.vRegistro.vSisVeiculos and vDadosIni.vSistemasUsuario.vSisVeiculos);
  cbCRM.Visible        := (vDadosIni.vRegistro.vSisCRM and vDadosIni.vSistemasUsuario.vSisCRM);
  cbGestor.Visible     := (vDadosIni.vRegistro.vSisGestor and vDadosIni.vSistemasUsuario.vSisGestor);
  cbMenusAbertos.Enabled := cbMenusAbertos.Visible;
  cbAutomacao.Enabled  := cbAutomacao.Visible;
  cbFinanceiro.Enabled := cbFinanceiro.Visible;
  cbPAFECF.Enabled     := cbPAFECF.Visible;
  cbVeiculo.Enabled    := cbVeiculo.Visible;
  cbCRM.Enabled        := cbCRM.Visible;
  cbGestor.Enabled     := cbGestor.Visible;

  {$REGION 'cbAutomacao'}
  cbAutomacao.Categories[0].Items.Clear;

  if CadastrosDeClientesFornecedor.Enabled and CadastrosDeClientesFornecedor.Visible then
    with cbAutomacao.Categories[0].Items.Add do
    begin
      Caption    := 'Clientes/Fornecedor';
      Hint       := 'Cadastro de Clientes';
      ImageIndex := 0;
      OnClick    := CadastrosDeClientesFornecedorClick;
    end;

  if CadastroDeProdutos.Enabled and CadastroDeProdutos.Visible then
    with cbAutomacao.Categories[0].Items.Add do
    begin
      Caption    := 'Produtos';
      Hint       := 'Cadastro de Produtos';
      ImageIndex := 2;
      OnClick    := CadastroDeProdutosClick;
    end;

  if NotasFiscais.Enabled and NotasFiscais.Visible then
    with cbAutomacao.Categories[0].Items.Add do
    begin
      Caption    := 'Notas Fiscais';
      Hint       := 'Lançamento das Notas Fiscais';
      ImageIndex := 4;
      OnClick    := NotasFiscaisClick;
    end;

  if VendaDeProdutos.Enabled and VendaDeProdutos.Visible then
    with cbAutomacao.Categories[0].Items.Add do
    begin
      Caption    := 'Venda de Produtos';
      Hint       := 'Venda de Produtos';
      ImageIndex := 7;
      OnClick    := VendaDeProdutosClick;
    end;

  if OrdemdeServico.Enabled and OrdemdeServico.Visible then
    with cbAutomacao.Categories[0].Items.Add do
    begin
      Caption    := 'Ordem de Serviço';
      Hint       := 'Venda de Produtos e Serviços';
      ImageIndex := 6;
      OnClick    := OrdemdeServicoClick;
    end;

  if OrcamentoEstoque.Enabled and OrcamentoEstoque.Visible then
    with cbAutomacao.Categories[0].Items.Add do
    begin
      Caption    := 'Orçamento';
      Hint       := 'Orçamento';
      ImageIndex := 5;
      OnClick    := OrcamentoEstoqueClick;
    end;

  if NotaFiscalConsumidorNFCe.Enabled and NotaFiscalConsumidorNFCe.Visible then
    with cbAutomacao.Categories[0].Items.Add do
    begin
      Caption    := 'NFC-e';
      Hint       := 'Nota Fiscal de Consumidor Eletrônica';
      ImageIndex := 4;
      OnClick    := NotaFiscalConsumidorNFCeClick;
    end;

  if NFSeDPS1.Enabled and NFSeDPS1.Visible then
    with cbAutomacao.Categories[0].Items.Add do
    begin
      Caption    := 'NFSe/DPS';
      Hint       := 'Nota Fiscal de Serviço Eletrônica';
      ImageIndex := 18;
      OnClick    := NFSeDPS1Click;
    end;

  cbAutomacao.Height := cbAutomacao.Categories[0].Items.Count * 25 + 5;
  {$ENDREGION}

  {$REGION 'cbFinanceiro'}
  cbFinanceiro.Categories[0].Items.Clear;

  if ContasaPagar.Enabled and ContasaPagar.Visible then
    with cbFinanceiro.Categories[0].Items.Add do
    begin
      Caption    := 'Contas a Pagar';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := ContasaPagarClick;
    end;

  if Creditos.Enabled and Creditos.Visible then
    with cbFinanceiro.Categories[0].Items.Add do
    begin
      Caption    := 'Controle de Créditos';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := CreditosClick;
    end;

  if Cheques.Enabled and Cheques.Visible then
    with cbFinanceiro.Categories[0].Items.Add do
    begin
      Caption    := 'Controle de Cheques';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := ChequesClick;
    end;

  if Lancamentos.Enabled and Lancamentos.Visible then
    with cbFinanceiro.Categories[0].Items.Add do
    begin
      Caption    := 'Lançamentos';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := LancamentosClick;
    end;

  if FechamentodeDia.Enabled and FechamentodeDia.Visible then
    with cbFinanceiro.Categories[0].Items.Add do
    begin
      Caption    := 'Fechamento de Dia';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := FechamentodeDiaClick;
    end;

  if PagamentosRetaguarda.Enabled and PagamentosRetaguarda.Visible then
    with cbFinanceiro.Categories[0].Items.Add do
    begin
      Caption    := 'Importações Financeiro';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := PagamentosRetaguardaClick;
    end;

  cbFinanceiro.Height := cbFinanceiro.Categories[0].Items.Count * 25 + 5;
  {$ENDREGION}

  {$REGION 'cbVeiculo'}
  cbVeiculo.Categories[0].Items.Clear;

  if CadastrosDeClientesFornecedor.Enabled and CadastrosDeClientesFornecedor.Visible then
    with cbVeiculo.Categories[0].Items.Add do
    begin
      Caption    := 'Clientes/Fornecedor';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := CadastrosDeClientesFornecedorClick;
    end;

  if ControledeEstoqueV1.Enabled and ControledeEstoqueV1.Visible then
    with cbVeiculo.Categories[0].Items.Add do
    begin
      Caption    := 'Controle de Estoque';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := ControledeEstoqueV1Click;
    end;

  if EstoqueeMovimentoVeiculos1.Enabled and EstoqueeMovimentoVeiculos1.Visible then
    with cbVeiculo.Categories[0].Items.Add do
    begin
      Caption    := 'Estoque e Movimento';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := EstoqueVeiculos1Click;
    end;

  if EntradaSaidaVeiculos1.Enabled and EntradaSaidaVeiculos1.Visible then
    with cbVeiculo.Categories[0].Items.Add do
    begin
      Caption    := 'Entrada/Saída';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := VendaVeiculos1Click;
    end;

  if DemonstracoesVeiculos1.Enabled and DemonstracoesVeiculos1.Visible then
    with cbVeiculo.Categories[0].Items.Add do
    begin
      Caption    := 'Demonstração';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := DemonstracoesVeiculos1Click;
    end;

  cbVeiculo.Height := cbVeiculo.Categories[0].Items.Count * 25 + 5;
  {$ENDREGION}

  {$REGION 'cbCRM'}
  cbCRM.Categories[0].Items.Clear;

  if CRMFollowUpPosAtendimento_Pesquisas.Enabled and CRMFollowUpPosAtendimento_Pesquisas.Visible then
    with cbCRM.Categories[0].Items.Add do
    begin
      Caption    := 'FollowUp';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := CRMFollowUpPosAtendimento_PesquisasClick;
    end;

  if CRMPosVenda.Enabled and CRMPosVenda.Visible then
    with cbCRM.Categories[0].Items.Add do
    begin
      Caption    := 'Pós-Venda';
      Hint       := '';
      ImageIndex := -1;
      OnClick    := CRMPosVendaClick;
    end;

  cbCRM.Height := cbCRM.Categories[0].Items.Count * 25 + 5;
  {$ENDREGION}

  {$REGION 'cbGestor'}
  cbGestor.Categories[0].Items.Clear;

  if GestorMetas.Enabled and GestorMetas.Visible then
    with cbGestor.Categories[0].Items.Add do
    begin
      Caption    := 'Metas';
      Hint       := '';
      ImageIndex := 16;
      OnClick    := GestorMetasClick;
    end;

  if GestorFinancasCustos.Enabled and GestorFinancasCustos.Visible then
    with cbGestor.Categories[0].Items.Add do
    begin
      Caption    := 'Finanças/Custos';
      Hint       := '';
      ImageIndex := 8;
      OnClick    := GestorFinancasCustosClick;
    end;

  if GestorEnsaioProvisionamento.Enabled and GestorEnsaioProvisionamento.Visible then
    with cbGestor.Categories[0].Items.Add do
    begin
      Caption    := 'Ensaios/Provisão';
      Hint       := '';
      ImageIndex := 12;
      OnClick    := GestorEnsaioProvisionamentoClick;
    end;

  if GestorCotacaoCompraVenda.Enabled and GestorCotacaoCompraVenda.Visible then
    with cbGestor.Categories[0].Items.Add do
    begin
      Caption    := 'Cotações';
      Hint       := 'Cotações de Compra e Venda';
      ImageIndex := 17;
      OnClick    := GestorCotacaoCompraVendaClick;
    end;

  if GestorPaineldeControle.Enabled and GestorPaineldeControle.Visible then
    with cbGestor.Categories[0].Items.Add do
    begin
      Caption    := 'Painel de Controle';
      Hint       := '';
      ImageIndex := 13;
      OnClick    := GestorPaineldeControleClick;
    end;

  if GestorAnalisedeDados.Enabled and GestorAnalisedeDados.Visible then
    with cbGestor.Categories[0].Items.Add do
    begin
      Caption    := 'Análise de Dados';
      Hint       := '';
      ImageIndex := 15;
      OnClick    := GestorAnalisedeDadosClick;
    end;

  cbGestor.Height := cbGestor.Categories[0].Items.Count * 25 + 5;
  {$ENDREGION}

  if cbAutomacao.Categories.Items[0].Items.Count  = 0 then cbAutomacao.Visible  := False;
  if cbFinanceiro.Categories.Items[0].Items.Count = 0 then cbFinanceiro.Visible := False;
  if cbFinanceiro.Categories.Items[0].Items.Count = 0 then cbPAFECF.Visible     := False;
  if cbVeiculo.Categories.Items[0].Items.Count    = 0 then cbVeiculo.Visible    := False;
  if cbCRM.Categories.Items[0].Items.Count        = 0 then cbCRM.Visible        := False;
  if cbGestor.Categories.Items[0].Items.Count     = 0 then cbGestor.Visible     := False;
end;

procedure TfrmPrincipalS.ConfigWSReplicacaoClick(Sender: TObject);
var
  vCW: TConfigWS;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vCW.cadConfigWS(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConsultadeClientesShiftF4Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.pesquisaRapida('CLIENTES');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConsultadeProdutosShiftF3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.pesquisaRapida('PRODUTOS');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConsultarBairrosShiftF9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.pesquisaRapida('BAIRROS');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConsultarCidadesShiftF8Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.pesquisaRapida('CIDADES');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConsultarKitsdeProdutosShiftF6Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.pesquisaRapida('KITS_PROD');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.GestorAnalisedeDadosClick(Sender: TObject);
var
  Aolap_pesquisageral_mdi: Tolap_pesquisageral_mdi;
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('GES006', 'CONSULTA', 'CONSULTAS DIVERSAS', '', '', cQuery, True) then
      Exit;
    vDadosIni.hw_registra_estatistica('OLAP');

    if vDadosIni.vConsultasOLAP.AHandle = 0 then
      CarregaPacote('pkConsultasOLAP', vDadosIni.vConsultasOLAP.AHandle);

    @Aolap_pesquisageral_mdi := GetProcAddress(vDadosIni.vConsultasOLAP.AHandle, 'olap_pesquisageral_mdi');
    if Assigned(Aolap_pesquisageral_mdi) then
      Aolap_pesquisageral_mdi('1', vDadosIni.codEmpresa, vDadosIni.vBancoHW, vDadosIni.vNomeUsuario, IntToStr(vDadosIni.vCodUsuario));

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ContadoresClick(Sender: TObject);
var
  contador: TContador;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    contador.CadContador(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ContasaPagarClick(Sender: TObject);
var
  contaAPagar: TContasAPagar;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCtp.AHandle = 0 then
      carregaPacote('pkContasAPagar', vDadosIni.vCtp.AHandle);
    contaAPagar.cadContasAPagar(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ContasAPagarVerNaEntrada;
var
	contaAPagar: TContasAPagar;
begin
  if not ((vDadosIni.vRegistro.vSisCaixaGeral) and (vDadosIni.vSistemasUsuario.vSisCaixaGeral)) then
    Exit;

  if (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vEmp.vCodigoUnificadora <> StrToInt(vDadosIni.codEmpresa)) then
    Exit;

  vDadosIni.vDataBanco := vDadosIni.getDataBanco(cQuery);

	if not vMensagemFinancNaoFech then
    if (vDadosIni.vDataBanco - (vDadosIni.diaFFinanceiro+1)) >= 1 then
    begin
      ShowAtencao('Dia do Financeiro: ' + DateToStr(vDadosIni.diaFFinanceiro + 1) + ' não foi fechado');
      vMensagemFinancNaoFech := True;
    end;

  if (Trim(vDadosIni.vverContas) = 'S') or (Trim(vDadosIni.vverContas) = 's') then
  begin
    if ShowCustomDlg.Msg('Deseja visualizar as Contas a Pagar com vencimento até ' + datetostr(vDadosIni.vDataBanco) + '?', mdtQuestion, [brYes, brNo])
      .SetDontAnskAgain('Não exibir mensagem novamente neste dia', dauNextDay, 'CTP_VENC')
      .Show()
      .ResultDlg = IDYES then
    begin
      try
        Screen.Cursor := crHourGlass;
        if vDadosIni.vCtp.AHandle = 0 then
          carregaPacote('pkContasAPagar', vDadosIni.vCtp.AHandle);
        contaAPagar.cadContasAPagar(2);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmPrincipalS.ContasAReceberVerNaEntrada;
var
	contasAReceber: TContasAReceber;
begin
	if not ((vDadosIni.vRegistro.vSisCaixaGeral) and (vDadosIni.vSistemasUsuario.vSisCaixaGeral)) then
    Exit;

  if (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vEmp.vCodigoUnificadora <> StrToInt(vDadosIni.codEmpresa)) then
    Exit;

  vDadosIni.vDataBanco := vDadosIni.getDataBanco(cQuery);

  if not vMensagemFinancNaoFech then
    if (vDadosIni.vDataBanco - (vDadosIni.diaFFinanceiro+1)) >= 1 then
    begin
      ShowAtencao('Dia do Financeiro: ' + DateToStr(vDadosIni.diaFFinanceiro + 1) + ' não foi fechado');
      vMensagemFinancNaoFech := True;
    end;

  if (Trim(vDadosIni.vverReceber) = 'S') or (Trim(vDadosIni.vverReceber) = 's') then
  begin
    if ShowCustomDlg.Msg('Deseja visualizar as Contas a Receber com vencimento até ' + datetostr(vDadosIni.vDataBanco) + '?', mdtQuestion, [brYes, brNo])
      .SetDontAnskAgain('Não exibir mensagem novamente neste dia', dauNextDay, 'CTR_VENC')
      .Show()
      .ResultDlg = IDYES then
    begin
      try
        Screen.Cursor := crHourGlass;

        if vDadosIni.vImportacaoFinanceiro.AHandle = 0 then
      		CarregaPacote('pkImportFinanceiro', vDadosIni.vImportacaoFinanceiro.AHandle);

        if vDadosIni.vContasAReceber.AHandle = 0 then
          carregaPacote('pkContasAReceber', vDadosIni.vContasAReceber.AHandle);

        contasAReceber.cadContasAReceber(3, 'S2');

        contasAReceber.cadContasAReceber(4, 'S1');
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmPrincipalS.ContratodeCompraVeiculosCCIA1Click(Sender: TObject);
var
    vVeiculosCCIA : TVeiculosCCIA;
begin
  try
    Screen.Cursor := crHourGlass;
    CarregaPacote('pkVeiculosCCIA',hdVeiculosCCIA);
    vVeiculosCCIA._CompraVeiculos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ContratosClientesClick(Sender: TObject);
var
  PClientes: TCadClientes;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    PClientes._abreFormContratos(0, 0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ContratosClientesGeradosClick(Sender: TObject);
var
  PContratosComClientes: TContratosComClientes;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    PContratosComClientes._abreFormContratosGerador(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ControledeAlmoxarifadoClick(Sender: TObject);
var
  obAlmx: TAlmoxarifado;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    vDadosIni.vtpVenda := 'REQ';
    //  obAlmx :=TAlmoxarifado.create;
    obAlmx.cadControleAlmoxarifado;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ControledeTMOOSMecanicoClick(Sender: TObject);
var
  vTMO: TTMO;
begin
  try
    Screen.Cursor := crHourGlass;
    vTMO.cadTMO(1);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ControlesClick(Sender: TObject);
var
  Controle: TControle;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdCadastrosBasicosCx = 0 then
      carregaPacote('pkCadastrosBasicosCx', hdCadastrosBasicosCx);
    Controle.cadControle(0);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPrincipalS.Cores1Click(Sender: TObject);
var
cores : TCores;
begin
  try
    Screen.Cursor := crHourGlass;
     if(vDadosIni.vCadBasicos.AHandle = 0) then
     Carregapacote('pkCadastrosBasicos',vDadosIni.vCadBasicos.AHandle);
     cores._CadCores(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CorrigirCidadeseBairrosCEP1Click(Sender: TObject);
var
  vAtualizaBCIDIBGE: TAtualizaBCIDIBGE;
begin
  vAtualizaBCIDIBGE:=TAtualizaBCIDIBGE.create;
  vAtualizaBCIDIBGE.corrigebairrocidade;
  vAtualizaBCIDIBGE.Free;
end;

procedure TfrmPrincipalS.GestorCotacaoCompraVendaClick(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  try
    Screen.Cursor := crHourGlass;
    gestor := TGestorFormularios.Create;
    gestor.cadCotacao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CreditosDepreciacaoAmortizacaodeBensClick(Sender: TObject);
var
  vCcredDeprec: TCredDepreciacaoAmortBem;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vCcredDeprec.cadCredDepreciacaoAmortBem(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CreditosEstoquedeAberturaClick(Sender: TObject);
var
  vEstAbertura: TCredEstoqueAbertura;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vEstAbertura.cadEstoqueAbertura(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CriarMenu(pForm: TForm);
var
	ButtonItem: TButtonItem;
  vExisteMenu: Boolean;
  I: Integer;
begin
  vExisteMenu := False;
  for I := 0 to cbMenusAbertos.Categories[0].Items.Count - 1 do
    if Pos('{' + trim(pForm.Name) + '}', trim(cbMenusAbertos.Categories[0].Items[I].Hint)) > 0 then
    begin
      vExisteMenu := True;
      Break;                                       
    end;

  if not vExisteMenu then
  begin
    ButtonItem := cbMenusAbertos.Categories[0].Items.Add;

    if trim(pForm.Name) = 'FrmConsGeral' then
    begin
    	ButtonItem.Caption     := 'Analise de Dados (OLAP)';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'FrmSugestCompraVenda' then
    begin
    	ButtonItem.Caption     := 'Cotações';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
  	else if trim(pForm.Name) = 'FrmMetas' then
    begin
      ButtonItem.Caption     := 'Metas';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'FrmFinanceiros' then
    begin
      ButtonItem.Caption     := 'Finanças/Custos';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'FrmCustos' then
    begin
    	ButtonItem.Caption     := 'Ensaio/Provisionamento';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'FrmPainelControl' then
    begin
    	ButtonItem.Caption     := 'Painel de Controle';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'frmRelatorios' then
    begin
    	ButtonItem.Caption     := 'Relatórios Resumo e Gerenciais';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'frmCadContasAReceber' then
    begin
      ButtonItem.Caption     := 'Creditos e Cheques';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'FrmCadPedVendaREQ' then
    begin
      ButtonItem.Caption     := 'Vendas de Produtos';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'FrmCadPedVendaOS' then
    begin
      ButtonItem.Caption     := 'Ordem de Serviço';

      ButtonItem.Hint        := 'Vendas de Produtos e Serviços' +
        ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'FrmCadPedVendaORC' then
    begin
      ButtonItem.Caption     := 'Orçamentos';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'frmCadPromocao' then
    begin
      ButtonItem.Caption     := 'Promoção/Tabela de Preços';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else if trim(pForm.Name) = 'frmCadNfSerieD' then
    begin
    	ButtonItem.Caption     := 'Notas Fiscais Série D';

      ButtonItem.Hint        :=
        trim(ButtonItem.Caption) + ' {' + trim(pForm.Name) + '}';
    end
    else
    begin
      ButtonItem.Caption     := pForm.Caption;

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          'Cadastros de', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          'Cadastro de', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          'Manutenção de', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          'Trabalhando com', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          'Cadastros', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          'Cadastro', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          'Manutenção', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          'Trabalhando', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          ' (Lixeira)', '', [rfReplaceAll]));

      ButtonItem.Caption     :=
        trim(StringReplace(trim(ButtonItem.Caption),
          ' (E-Commerce)', '', [rfReplaceAll]));

      ButtonItem.Hint        :=
        trim(pForm.Caption) + ' {' + trim(pForm.Name) + '}';
    end;

    ButtonItem.ImageIndex    := -1;
  end;

  try
  	cbMenusAbertos.Enabled := False;

    cbMenusAbertos.Visible  := cbMenusAbertos.Categories[0].Items.Count > 0;
    cbMenusAbertos.Enabled  := cbMenusAbertos.Visible;

    cbMensagens.Top := 0;
    cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

    if cbMenusAbertos.Categories[0].Items.Count <= 1 then
      cbMenusAbertos.Categories[0].Caption := '...'
    else if cbMenusAbertos.Categories[0].Items.Count = 2 then
      cbMenusAbertos.Categories[0].Caption := 'Abe'
    else
      cbMenusAbertos.Categories[0].Caption := 'Abertos';

    if cbMenusAbertos.Categories[0].Collapsed then
    begin
    	cbMenusAbertos.Tag    := 5 + (cbMenusAbertos.Categories[0].Items.Count * 25);
    	cbMenusAbertos.Height := 18;
    end
    else
    begin
      cbMenusAbertos.Height := 5 + (cbMenusAbertos.Categories[0].Items.Count * 25);
      cbMenusAbertos.Tag    := 18;
    end;
  finally
  	cbMenusAbertos.Enabled := True;
  end;
end;

function TfrmPrincipalS.CreateProcessSimple(cmd: string): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_SHOW;

  Result := CreateProcess(nil, PChar(cmd), nil, nil, false, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo);

  if (Result) then
  begin
    WaitForSingleObject(ProcInfo.hProcess, 0);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

procedure TfrmPrincipalS.CreditosAquisicaodeBensClick(Sender: TObject);
var
  vAquisicBem: TCredAquisicaoBem;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vAquisicBem.cadCredAquisicaoBem(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CreditosClick(Sender: TObject);
var
  credito: TContasAReceber;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdContasAReceber = 0 then
      carregaPacote('pkContasAReceber', hdContasAReceber);
    credito.cadContasAReceber(0, 'S2');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.criarMenusRelatorios;
var
  vsubitem, vsubitemFin, vsubitemVeic : TMenuItem;
  I: Integer;
begin
  if MySubItems[2] <> nil then
  begin
    MySubItems[2].Free;
    MySubItems[2] := nil;
  end;

  try
    // Relatorios do Automacao
    if DirectoryExists(vDadosIni.VpastaRel) then
    begin
      FileListBox1.Directory := vDadosIni.VpastaRel;
      FileListBox1.Refresh;
      if (FileListBox1.items.count - 1 >= 0) then
      begin
        MySubItems[2] := TMenuItem.Create(Self);
        MySubItems[2].Caption := 'Outros';
        MySubitems[2].Tag := 1;
        MySubitems[2].Name := 'OutrosRelatoriosEstoque';
        RelatoriosEstoque.Add(MySubItems[2]);
        //    i * 10;
  //      MainMenu1.Items[3].Add(MySubItems[2]);
        vsubitem := MySubItems[2];
      end;  

      for i := 0 to FileListBox1.Items.Count - 1 do
      begin
        //Modificado e alterado nome do relatório, não abrir esse relatório com o nome antigo
        if (trim(copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1))	<> 'Vendas x Recebimentos Loja') and
        //Não abrir relatório Recibo Programa Fidelidade
         (trim(copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1)) <> 'Recibo Programa Fidelidade') then
        begin
          MySubItems[i] := TMenuItem.Create(Self);
          MySubItems[i].Caption := copy(FileListBox1.Items.Strings[i], 1, pos('.',
            FileListBox1.items.Strings[i]) - 1);
          MySubItems[i].Hint := copy(FileListBox1.Items.Strings[i], 1, pos('.',
            FileListBox1.items.Strings[i]) - 1);
          // 'Novo Subitem ' + IntToStr(i);
          MySubitems[i].Tag := 1;
          MySubitems[i].Name := vDadosIni.StringReplace2(
            copy(FileListBox1.Items.Strings[i], 1, pos('.',
            FileListBox1.items.Strings[i]) - 1),
              'çÇÃãÕõÊêÁáÀàÉéÍíÓóÚú&@-=+*{}()[] ',
            '                                 ', true);
          //i * 10;
          vsubitem.Add(MySubItems[i]);
          MySubItems[i].OnClick := Menu_Rel;
        end;
      end;
      FileListBox1.Directory := ExtractFilePath(Application.Exename);
      FileListBox1.Refresh;
    end;

    if DirectoryExists(vDadosIni.VpastaRel+ '\CX') then
    begin
      // Relatorios do Caixa
      FileListBox1.Directory := vDadosIni.VpastaRel+ '\CX';
      FileListBox1.Refresh;
      if (FileListBox1.items.count - 1 >= 0) then
      begin
        MySubItemsFin[99] := TMenuItem.Create(Self);
        MySubItemsFin[99].Caption := 'Outros';
        MySubItemsFin[99].Tag := 2;
        MySubItemsFin[99].Name := 'OutrosRelatoriosFinanceiro';
        RelatoriosFinanceiro.Add(MySubItemsFin[99]);

        vsubitemFin := MySubItemsFin[99];
      end;
      for i := 0 to FileListBox1.Items.Count - 1 do
      begin
        MySubItemsFin[i] := TMenuItem.Create(Self);
        MySubItemsFin[i].Caption := copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1);
        MySubItemsFin[i].Hint := copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1);

        MySubItemsFin[i].Tag := 2;
        MySubItemsFin[i].Name := vDadosIni.StringReplace2(
          copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1),
            'çÇÃãÕõÊêÁáÀàÉéÍíÓóÚú&@-=+*{}()[] ',
          '                                 ', true);
        vsubitemFin.Add(MySubItemsFin[i]);
        MySubItemsFin[i].OnClick := Menu_RelCX;
      end;
      FileListBox1.Directory := ExtractFilePath(Application.Exename);
      FileListBox1.Refresh;
    end;
    
    if DirectoryExists(vDadosIni.VpastaRel+ '\Veic4') then
    begin
      // Relatorios do Veículos
      FileListBox1.Directory := vDadosIni.VpastaRel+ '\Veic4';
      FileListBox1.Refresh;
      if (FileListBox1.items.count - 1 >= 0) then
      begin
        MySubItemsVeic[97] := TMenuItem.Create(Self);
        MySubItemsVeic[97].Caption := 'Outros';
        MySubItemsVeic[97].Tag := 16;
        MySubItemsVeic[97].Name := 'OutrosRelatoriosVeiculo';
        RelatoriosVeiculos.Add(MySubItemsVeic[97]);

        vsubitemVeic := MySubItemsVeic[97];
      end;
      for i := 0 to FileListBox1.Items.Count - 1 do
      begin
        MySubItemsVeic[i] := TMenuItem.Create(Self);
        MySubItemsVeic[i].Caption := copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1);
        MySubItemsVeic[i].Hint := copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1);

        MySubItemsVeic[i].Tag := 16;
        MySubItemsVeic[i].Name := vDadosIni.StringReplace2(
          copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1),
            'çÇÃãÕõÊêÁáÀàÉéÍíÓóÚú&@-=+*{}()[] ',
          '                                 ', true);
        vsubitemVeic.Add(MySubItemsVeic[i]);
        MySubItemsVeic[i].OnClick := Menu_RelVeic;
      end;
      FileListBox1.Directory := ExtractFilePath(Application.Exename);
      FileListBox1.Refresh;
    end;

  except
    on E: Exception do
    begin
      if messagedlg('Erro na criação do Menu, Mostrar Erro?', mtconfirmation, [mbYES, mbNO], 0) =
        mrYES then
        showmessage(E.Message);
    end;
  end;

end;

procedure TfrmPrincipalS.GestorEnsaioProvisionamentoClick(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  try
    Screen.Cursor := crHourGlass;
    gestor := TGestorFormularios.Create;
    gestor.cadEnsaiosProvisao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EmissaodeNotasdeAjustesdeEstoque1Click(
  Sender: TObject);
var
  Aajuste_estoque_show: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      CarregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    @Aajuste_estoque_show := GetProcAddress(vDadosIni.vNotaFiscal.AHandle, 'ajuste_estoque_show');
    if Assigned(Aajuste_estoque_show) then
      Aajuste_estoque_show(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EmpresaAdqClick(Sender: TObject);
var
  ConciliacaoEstEmpAdq: TConciliacaoEstEmpAdq;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    ConciliacaoEstEmpAdq._cadConciliacaoEstEmpAdq(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EnterTelaConfigurar;
begin
  enterTela := TEnterHw.Create(Self);
  vDadosIni.enterTela := enterTela;
  enterTela.Name := 'enterHw';
  enterTela.ClassList.Clear;
  enterTela.classList.Add('TMaskEdit');
  enterTela.classList.Add('TEdit');
  enterTela.classList.Add('TDBEdit');
  enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
  enterTela.classList.Add('TEditHw'); { Componente de Moeda e Inteiros HwSistemas melhorado}
  enterTela.classList.Add('TCheckBox');
  enterTela.classList.Add('TDBCheckBox');
  enterTela.classList.Add('TComboBox');
  enterTela.classList.Add('TDBComboBox');
  enterTela.classList.Add('TListBox');
  enterTela.classList.Add('TDBListBox');
  enterTela.classList.Add('TDBLookupListBox');
  enterTela.classList.Add('TDBLookupComboBox');
  enterTela.classList.Add('TSpinEdit');
  enterTela.classList.Add('TDateTimePicker');
  enterTela.classList.Add('TRadioGroup');
  enterTela.classList.Add('TDBRadioGroup');
  enterTela.classList.Add('TRadioButton');
  enterTela.classList.Add('TDBRadioButton');
end;

procedure TfrmPrincipalS.EquipamentosClick(Sender: TObject);
var
  Equipamento: TEquipamentos;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdEquipamentos = 0 then
      CarregaPacote('pkEquipamentos', hdEquipamentos);
    Equipamento.CadEquipamentos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EspecieTipoFinsSeg1Click(Sender: TObject);
var
  vEsp : TEspecie;
begin
  try
    Screen.Cursor := crHourGlass;
  if vDadosIni.vCadBasicos.AHandle = 0 then
    CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
  vEsp._CadEspecie(0);
  finally
        Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EstadosClick(Sender: TObject);
var
  vEstado: TEstados;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vEstado.CadEstado(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EstoqueDeEquipqmentosComNdeSerieClick(Sender: TObject);
var
  vEstEcf: TEstoqueEcf;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdEstoqueECF = 0 then
      CarregaPacote('pkEstoqueECF', hdEstoqueECF);
    vEstEcf.CadEstoqueECF(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EstoqueeMovimentoVeiculosOutrasEmpresas1Click(Sender: TObject);
var
  VeiculoCCIA: TEstMotoOutrasEmpCCIA;
begin
 try
   Screen.Cursor := crHourGlass;
  if hdVeiculos = 0 then
    carregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);
    VeiculoCCIA.CadVeiculosOutrasEmp(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EstoqueVeiculos1Click(Sender: TObject);
var
  VeiculoCCIA: TEstMotoCCIA;
begin
 try
   Screen.Cursor := crHourGlass;
  if hdVeiculos = 0 then
    carregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);
    VeiculoCCIA.CadVeiculosMov(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EstoqueVeiculosOutrasEmpresa1Click(
  Sender: TObject);
var
  VeiculoCCIA: TEstMotoOutrasEmpCCIA;
begin
 try
   Screen.Cursor := crHourGlass;
  if hdVeiculos = 0 then
    carregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);
    VeiculoCCIA.CadVeiculosOutrasEmp(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.EtiquetaConfiguracaoClick(Sender: TObject);
var
	Produto: TProdutos;
  Clientes: TCadClientes;
  cadNf: TNfCab;

  HandleConfigEti: THandle;
  ConfigEti: TConfigEtiqueta;
  Ctrl: TWinControl;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Produto.PreencherCamposDisplay(dtmEnt.qrBuscas);

    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    Clientes.PreencherCamposDisplay(dtmEnt.qrBuscas);

    if vDadosIni.vNotaFiscal.AHandle = 0 then
    	carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    cadNf.PreencherCamposDisplayDanfe(dtmEnt.qrBuscas);

    HandleConfigEti := 0;
    try
      HandleConfigEti := LoadLibrary('RelQReportHW.dll');
      if HandleConfigEti <> 0 then
      begin
        @ConfigEti := GetProcAddress(HandleConfigEti, 'ConfigEtiqueta');
        ConfigEti(Pchar(vDadosIni.vBancoHW), strtoint(vDadosIni.codEmpresa));
      end;
    finally
      begin
        FreeLibrary(HandleConfigEti);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ExibirMensagemChavePeriodica;
var
  AStrDataRegistroAviso: string;
  ADataRegistroAviso: TDateTime;
begin
	if not vVerificarMensagens then
    Exit;

  if not vNotificarChavePeriodica then
    Exit;

  if FTimeExibirMensagemChavePeriodica >= Time  then
    Exit;

  try

    AStrDataRegistroAviso := vDadosIni._LerConfiguracoesRegistroString('DataRegistroAviso');
    if not TryStrToDate(AStrDataRegistroAviso, ADataRegistroAviso) then
      ADataRegistroAviso := 0;

    if DateOf(ADataRegistroAviso) >= DateOf(Date) then
      Exit;

    vDataRegistroERP := vDadosIni._dtTemp(cQuery);
    if trim(vDataRegistroERP) <> '' then
      vDataRegistroERP := chaveDataLicenca(PChar(vDataRegistroERP));

    if (Trim(vDataRegistroERP) = '') or (Trim(vDataRegistroERP) = 'DATA_INVALIDA') then
    begin
      vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));
      Exit;
    end;

    vDadosIni.vDataHora := vDadosIni.getDataBanco(cQuery);
    if (StrToDateTime(vDataRegistroERP) > vDadosIni.vDataHora) then
      vDiasVencimentoChavePeriodica := (StrToDateTime(vDataRegistroERP) - vDadosIni.vDataHora)
    else
      vDiasVencimentoChavePeriodica := 0;

    if ((vDiasVencimentoChavePeriodica >= 0) and (vDiasVencimentoChavePeriodica <= 5))
    	and (vNotificarChavePeriodica) then
    begin
    	cQuery.Close;
      cQuery.SQL.Text := 'select cod_faturamento, dataconsulta, datafaturamento, cast(' + vDadosIni.FusoDateTimeFb + ' as timestamp) datahora from NOTIFICACAO_API ' +
        ' where cnpj = ' + QuotedStr(Trim(vDadosIni.vEmp.vCNPJ));
      try
        cQuery.Open;
        vCodFaturamentoChavePeriodica  := cQuery.FieldByName('cod_faturamento').AsInteger;
        vDataConsultaChavePeriodica    := cQuery.FieldByName('dataconsulta').AsDateTime;
        vDataFaturamentoChavePeriodica := cQuery.FieldByName('datafaturamento').AsDateTime;
        vDataHora                      := cQuery.FieldByName('datahora').AsDateTime;

        if (vCodFaturamentoChavePeriodica <> 13) and         // Diferente de 13 não está barrado
          (DateOf(vDataConsultaChavePeriodica) = DateOf(vDataFaturamentoChavePeriodica)) and     // data da consulta igual a data do faturamento(servidorHw)
          (DateOf(vDataConsultaChavePeriodica) = DateOf(vDataHora)) then  // data da consulta igual a data do cliente
          vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date))
        else if (vCodFaturamentoChavePeriodica = 13) and // 13 = barrado
          (DateOf(vDataConsultaChavePeriodica) = DateOf(vDataFaturamentoChavePeriodica)) and // dia atual da consulta
          (DateOf(vDataConsultaChavePeriodica) = DateOf(vDataHora)) then
        begin
          vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));

          if vNotificarChavePeriodica then
          begin
            if not vDadosIni.ExistBallonTipFixed(vHandleMensagem) then
            begin
              vNotificarChavePeriodica      := False;
              vNotificarChavePeriodica_Fixa := False;
							Exit;
            end;

            if not FormularioShowModal then
            begin
              vNotificarChavePeriodica_Fixa := True;

            	cbMensagens.Enabled := True;
            	cbMensagens.Visible := True;

              cbMensagens.Top := 0;
    					cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

              vTituloMensagem := 'Chave periódica expirando';
              vTextoMensagem  := IntToStr(Trunc(vDiasVencimentoChavePeriodica)) + ' dia' + IfThen(Trunc(vDiasVencimentoChavePeriodica) > 1, 's')  +  ' para nova consulta';
              vIconMensagem   := 2;
              vTipoMensagem   := '';
              ShowHintBalloon;
            end;
          end;

//          TrayIconLicenca.BalloonTitle := 'Chave periódica expirando';
//          TrayIconLicenca.BalloonFlags := bfWarning;//bfInfo;
//          TrayIconLicenca.BalloonHint := IntToStr(Trunc(vDiasVencimento)) + ' dia' + IfThen( Trunc(vDiasVencimento) > 1, 's')  +  ' para nova consulta';
//          TrayIconLicenca.BalloonTimeout :=  30000;
//          //TrayIconLicenca.Animate := True;
//          TrayIconLicenca.Visible := True;
//          TrayIconLicenca.ShowBalloonHint;

          FtimerChavePeriodica := TTimer.Create(Self);
          FtimerChavePeriodica.Interval := 10000;
          FtimerChavePeriodica.OnTimer := FtimerChavePeriodicaTimer;
          FtimerChavePeriodica.Enabled := True;
        end;

        cQuery.Close;
      except
        vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));
      end;
    end
    else
      vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));
  finally
    FTimeExibirMensagemChavePeriodica := Time + EncodeTime(0, 1, 0, 0);
  end;
end;

procedure TfrmPrincipalS.FaturamentoClick(Sender: TObject);
var
  obFaturamento: TFaturamento;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    obFaturamento.CadTipoFaturamento(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.FechaJanelasMDI(n: integer);
var
  X : Byte;
begin
  if MDIChildCount > 0 then
    for X := Pred(MDIChildCount) Downto 0 do
    begin
      if MDIChildren[X] is TfrmCadPadraoM then
      begin
        if not (TfrmCadPadraoM(MDIChildren[X]).DBGrid1.DataSource.DataSet.State in [dsInsert, dsEdit]) then
          TfrmCadPadraoM(MDIChildren[X]).DBGrid1.DataSource.DataSet.Close;
        TfrmCadPadraoM(MDIChildren[X]).exibirPergFechar := False;
      end
      else if MDIChildren[X] is TfrmCadPadrao then
      begin
        if not (TfrmCadPadrao(MDIChildren[X]).DBGrid1.DataSource.DataSet.State in [dsInsert, dsEdit]) then
          TfrmCadPadrao(MDIChildren[X]).DBGrid1.DataSource.DataSet.Close;
        TfrmCadPadrao(MDIChildren[X]).exibirPergFechar := False;
      end
      else if MDIChildren[X] is TfrmPadrao then
      begin
        TfrmPadrao(MDIChildren[X]).exibirPergFechar := False;
      end;

      MDIChildren[X].Close;
    end;
end;

procedure TfrmPrincipalS.FechamentodeDiaClick(Sender: TObject);
var
  lanc: TLancamentos;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdLancamentos = 0 then
      carregaPacote('pkLancamentos', hdLancamentos);
    lanc.cadLancamentos(3);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.FeriadosClick(Sender: TObject);
var
  vFeriado: TFeriado;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vFeriado._cadFeriado(0);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPrincipalS.FichaDeInventarioClick(Sender: TObject);
var
  vFichaInv: TProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    vFichaInv.FichaInventario;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ControledeEstoqueV1Click(Sender: TObject);
var
  vFilaReserva : TFilaReserva;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdVeiculosCCIA = 0 then
     CarregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);

   vFilaReserva.abreFormFilaReserva(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.BalancoGeralClick(Sender: TObject);
var
  vbalanco : TBalancoProduto;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    vBalanco._CadBalanco;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.BancariaClick(Sender: TObject);
var
  obConciliab: TConciliacaoBanc;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdLancamentos = 0 then
      carregaPacote('pkLancamentos', hdLancamentos);
    obConciliab._abreFormConciliacaoBancaria;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.FinalidadesNF1Click(Sender: TObject);
var
  AshowForm: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCliente.AHandle = 0 then
      CarregaPacote('pkClientes', vDadosIni.vCliente.AHandle);
    @AshowForm := GetProcAddress(vDadosIni.vCliente.AHandle, 'finalidade_show');
    if Assigned(AshowForm) then
      AshowForm(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Financeiro30Click(Sender: TObject);
//var
//  vTemp: string;
//  i: integer;
begin
//  vTemp := 'Caixa Geral(Loja: ' + vDadosIni.StrZero(StrToInt(vDadosIni.CodEmpresa), 3) + ')';
//  if FindWindow('TFrPrincipal', pchar(vTemp)) > 0 then
//    SetForegroundWindow(FindWindow('TFrPrincipal', pchar(vTemp)))
//  else
//  begin
//    vTemp := ExtractFileDir(application.ExeName);
//    for i := length(vtemp) downto 1 do
//    begin
//      if vTemp[i] = '\' then
//      begin
//        vTemp := copy(vTemp, 1, i) + '\CAIXAGERAL\PrCaixaG.exe';
//        Break;
//      end;
//    end;
//    vTemp := StringReplace(vTemp, '\\', '\', [rfReplaceAll]);
//    CreateProcessSimple(vTemp + ' ' + vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' ' +
//      vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) + ' ' + vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pAutomacao');
//  end;
end;

procedure TfrmPrincipalS.FinanceiroAprovacaoDePedidosClick(Sender: TObject);
var
  vAutoriza: uClassesPedVenda.TPedidosAutorizacaoFinanceiro;
begin
	if not vDadosIni.PesqPros('VND170', 'CONSULTA', '', 'PEDVENDA', '', cQuery, False) then
    Exit;

  vAutoriza.abreAutorizacaoFinanceiro;
end;

procedure TfrmPrincipalS.FinanceiroPOSVirtualAdministrativoClick(Sender: TObject);
var
  vID: Integer;
begin
  try

    Screen.Cursor := crHourGlass;

    if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
    begin
      Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
      Exit;
    end;
    if not vDadosIni.PesqPros('POSV002', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery, True) then
      Exit;
    if not vDadosIni.operacaoPosVirtual(posADM, 'Operação Administrativo', '', 0, cQuery) then
    begin
      vDadosIni.GravaAuditoria('POSV002', 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery);
      Exit;
    end
    else if vDadosIni.vPOSV.vLinhasImpressao.Count > 0 then
    begin
      if vDadosIni.vPOSV.retorno = retSucesso then
      begin

        vID := vDadosIni.gravaTransacaoPosVirtual(0, 'ADM', vDadosIni.getTerminalADM(cQuery), 0, 0, 0, cQuery);

        cQuery.Transaction.Commit;
      end;
    end;

    if vDadosIni.vPOSV.retorno = retSucesso then
      vDadosIni.GravaAuditoria('POSV002', 'INICIAR', 'SUCESSO - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', IntToStr(vID), cQuery)
    else
      vDadosIni.GravaAuditoria('POSV002', 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.FinanceiroPOSVirtualHistoricodeTransacoesClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('POSV003', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery, True) then
    Exit;
  try
    vDadosIni.abreHistoricoTransacoesPOSVirtual;
  finally
  end;
end;

procedure TfrmPrincipalS.FinanceiroPOSVirtualTransacaoAvulsaClick(Sender: TObject);
var
  vTerminalAdm: string;
  vID: Integer;
begin
  try

    Screen.Cursor := crHourGlass;

    if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
    begin
      Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
      Exit;
    end;
    if not vDadosIni.PesqPros('POSV001', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery, True) then
      Exit;
    if not vDadosIni.operacaoPosVirtual(posCRT, 'Informe o valor da operação', '', 0, cQuery) then
    begin
      vDadosIni.GravaAuditoria('POSV001', 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery);
      Exit;
    end;

    if vDadosIni.vPOSV.retorno = retSucesso then
    begin
      vTerminalAdm := vDadosIni.getTerminalADM(cQuery);

      vID := vDadosIni.gravaTransacaoPosVirtual(0, 'AVL', vTerminalAdm, StrToIntDef(vDadosIni.vPOSV.numeroDocumento,0), 0, 0, cQuery);

      cQuery.Transaction.Commit;

      vDadosIni.GravaAuditoria('POSV001', 'INICIAR', 'SUCESSO - ' + vDadosIni.vNomeUsuario + ' VL:' + Format('%0.2n', [vDadosIni.vPOSV.valorOperacao]) , 'TRANSACAO_CARTAO', IntToStr(vID), cQuery);
    end
    else
      vDadosIni.GravaAuditoria('POSV001', 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.FluxoDeCaixaClick(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  try
    Screen.Cursor := crHourGlass;
    gestor := TGestorFormularios.Create;
    gestor.cadFinancasCustos(1);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.GestorFinancasCustosClick(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  try
    Screen.Cursor := crHourGlass;
    gestor := TGestorFormularios.Create;
    gestor.cadFinancasCustos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CRMCartasdeCobrancaClick(Sender: TObject);
var
  AshowForm: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdContasAReceber = 0 then
      carregaPacote('pkContasAReceber', hdContasAReceber);
    @AshowForm := GetProcAddress(hdContasAReceber, 'cartas_cobranca_show');
    if Assigned(AshowForm) then
      AshowForm(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CRMFollowUpPosAtendimentoClick(Sender: TObject);
//followup
//var
//  vTemp: string;
//  i: integer;
begin
//  vTemp := 'HW - FollowUp (Loja: '+vDadosIni.StrZero(vDadosIni.codEmpresa,3)+')';
//  if FindWindow('', pchar(vTemp)) > 0 then
//    SetForegroundWindow(FindWindow('', pchar(vTemp)))
//  else
//  begin
//    vTemp := ExtractFileDir(application.ExeName);
//    for i := length(vtemp) downto 1 do
//    begin
//      if vTemp[i] = '\' then
//      begin
//        vTemp := copy(vTemp, 1, i) + '\FollowUp\FollowUp.exe';
//        Break;
//      end;
//    end;
//    vTemp := StringReplace(vTemp, '\\', '\', [rfReplaceAll]);
//    CreateProcessSimple(vTemp + ' ' + vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' ' +
//      vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) + ' ' + vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pAutomacao');
//  end;
end;

procedure TfrmPrincipalS.CRMFollowUpPosAtendimento_AnotacoesClick(Sender: TObject);
var
  cadFlwAnot: TFlw_Anotacoes;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    cadFlwAnot._cadAnotacoes(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CRMFollowUpPosAtendimento_AtendimentosClick(
  Sender: TObject);
var
  cadFlwAtend: TFlw_Atendimentos;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    cadFlwAtend._cadFlwAtendimentos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CRMFollowUpPosAtendimento_GruposClick(Sender: TObject);
var
  cadFlwGrupo: TFlw_Grupos;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    cadFlwGrupo._cadFlwGrupos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CRMFollowUpPosAtendimento_PerfisClick(Sender: TObject);
var
  cadFlwPerfil: TFlw_Perfil;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    cadFlwPerfil._cadFlwPerfil(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CRMFollowUpPosAtendimento_PerguntasClick(
  Sender: TObject);
var
  cadFlwPergunta: TFlw_Pergunta;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    cadFlwPergunta._cadFlwPerguntas(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CRMFollowUpPosAtendimento_PesquisasClick(
  Sender: TObject);
var
  cadFlwPesquisa: TFlw_Pesquisa;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    cadFlwPesquisa._cadPesquisa(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.FormActivate(Sender: TObject);
begin
  if SpeedButton1.Tag = 2 then
    Panel1.Height := Self.Height - 77;
end;

procedure TfrmPrincipalS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Aolap_pesquisageral_mdi_free: TSimpleProcedure;
  noQuest: Boolean;
  I, X: Integer;
begin
  noQuest := False;
  for I := 0 to ParamCount do
    if noQuest then
      Break
    else
    begin
      noQuest := LowerCase(ParamStr(I)) = 'modonfce';
      if not noQuest then
        noQuest := StartsText('@pk-', ParamStr(I));
    end;

  if Self.Tag = 99 then
    CanClose := True
  else if noQuest then
    CanClose := True
  else
    Canclose := Application.MessageBox('Deseja Sair do Sistema', 'Confirmação',
                                       MB_YESNO + MB_ICONQUESTION) = IDYES;
  if CanClose then
  begin
  	if MDIChildCount > 0 then
      for X := Pred(MDIChildCount) Downto 0 do
      begin
        if MDIChildren[X] is TfrmCadPadraoM then
        begin
          if not (TfrmCadPadraoM(MDIChildren[X]).DBGrid1.DataSource.DataSet.State in [dsInsert, dsEdit]) then
            TfrmCadPadraoM(MDIChildren[X]).DBGrid1.DataSource.DataSet.Close;
          TfrmCadPadraoM(MDIChildren[X]).exibirPergFechar := False;
        end
        else if MDIChildren[X] is TfrmCadPadrao then
        begin
          if not (TfrmCadPadrao(MDIChildren[X]).DBGrid1.DataSource.DataSet.State in [dsInsert, dsEdit]) then
            TfrmCadPadrao(MDIChildren[X]).DBGrid1.DataSource.DataSet.Close;
          TfrmCadPadrao(MDIChildren[X]).exibirPergFechar := False;
        end
        else if MDIChildren[X] is TfrmPadrao then
        begin
          TfrmPadrao(MDIChildren[X]).exibirPergFechar := False;
        end;

        MDIChildren[X].Close;
      end;

    if SpeedButton1.Tag = 2 then
      _GravaConfiguracoesString('EsconderBotoes', 'S')
    else
      _GravaConfiguracoesString('EsconderBotoes', 'N');
    if MDIChildCount > 0 then
    begin
      if MDIChildren[0].WindowState = wsMaximized then
        _GravaConfiguracoesString('JanelasMaximizadas', 'S')
      else
        _GravaConfiguracoesString('JanelasMaximizadas', 'N');
    end;
    closeallAuditoria;
    if vDadosIni.vConsultasOLAP.AHandle > 0 then
    begin
//      @Aolap_pesquisageral_mdi_free := GetProcAddress(vDadosIni.vConsultasOLAP.AHandle, 'olap_pesquisageral_mdi_free');
//      if Assigned(Aolap_pesquisageral_mdi_free) then
//        Aolap_pesquisageral_mdi_free();
    end;
  end;
end;

procedure TfrmPrincipalS.FormCreate(Sender: TObject);
begin
  InicializarTimers;
end;

procedure TfrmPrincipalS.FormDestroy(Sender: TObject);
type
  Proc_LiberarDTM = procedure();

  procedure LiberarDtmsAndUnloadPackage(AHandle: Cardinal);
  var
    LiberarDTM: Proc_LiberarDTM;
  begin
    if AHandle <> 0 then
    begin
      LiberarDTM := nil;
      @LiberarDTM := GetProcAddress(AHandle, 'LiberarDTM');
      if Assigned(LiberarDTM) then
        LiberarDTM();

      UnloadPackage(AHandle);
    end
  end;

var
  LastHandle: Cardinal;

begin
//  LastHandle := vDadosIni.
  if Assigned(vProcessamentos) then
    FreeAndNil(vProcessamentos);

  SetupModernShutdown();

//  LiberarDtmsAndUnloadPackage(hdConfig);
//
//  LiberarDtmsAndUnloadPackage(vDadosIni.vNFConsumidor.AHandle);
//  LiberarDtmsAndUnloadPackage(vDadosIni.vNotaFiscal.AHandle);
//  LiberarDtmsAndUnloadPackage(vDadosIni.vFiscal.AHandle);
//  LiberarDtmsAndUnloadPackage(vDadosIni.vModern.AHandle);
//
//  LiberarDtmsAndUnloadPackage(hdEntrada);
//  LiberarDtmsAndUnloadPackage(hdAtivo);
end;

procedure TfrmPrincipalS.FormResize(Sender: TObject);
begin
  if SpeedButton1.Tag = 2 then
    Panel1.Height := Self.Height - 77;

  if vVerificarMensagens then
    if not FormularioShowModal then
      ShowHintBalloon;
end;

procedure TfrmPrincipalS.FormShow(Sender: TObject);
type
	TShowFormMainForm = function (AFormName: string; AForm: string): Boolean of object;
  TsetShowFormMainForm = procedure (evento: TShowFormMainForm);

  TShowModalFormMainForm = function (AFormName: string; AForm: string): Boolean of object;
  TsetShowModalFormMainForm = procedure (evento: TShowModalFormMainForm);

  TCloseQueryMainFormMsg = function (AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean of object;
  TSetCloseQueryMainFormMsg = procedure (evento: TCloseQueryMainFormMsg);
var
  PedVenda: TPedVenda;
  vsubitem: TMenuItem;
  i: Integer;
  vMenu: TMenusAuto;
  vFazerLoginNovamente: Boolean;
//  contaAPagar: TContasAPagar;
  reestrutura_verificar_hwauto: Treestrutura_verificar_hwauto;
  reestrutura_verificar_fiscal: Treestrutura_verificar_fiscal;
  vDataRegistro, AStrDataRegistroAviso, string_: string;
  ADataRegistroAviso: TDateTime;
  vDiasVencimento: Double;
  AshowForm: TShowForm;
  confList: TConfig_sistema_classList;
  cadNf: TNfCab;
  vMDFe: TMDFe;
  setShowFormMainForm: TsetShowFormMainForm;
  setShowModalFormMainForm: TsetShowModalFormMainForm;
  setCloseQueryMainFormMsg: TSetCloseQueryMainFormMsg;
begin
  if IniConf.ReadStr('TrimAppMemorySize', 'Ativo', 'N') = 'S' then
    vDadosIni.TrimAppMemorySize;
  try
    vFazerLoginNovamente := False;
    vVerificarMensagens := False;
//    TimerServiceLess.Interval := 60 * 1000;

    vDadosIni.abreStatusProcessamento('','Iniciando aplicativo', True);

    MenusReset;
    {
    for I := 0 to ComponentCount - 1 do
      if Components[i] is TMenuItem then
        TMenuItem(Components[i]).Enabled := false;
      }

    {$REGION 'carregando pacotes e criando dtms'}

    CarregaPacote('pkAtivos', hdAtivo);
    CarregaPacote('pkEntrada', hdEntrada);
    dtmAtivo := TdtmAtivo.Create(dtmAtivo);
    dtmEnt := TdtmEnt.Create(dtmEnt);
    vDadosIni := TSingleton.GetInstance;
    vDadosIni.vSistema := 'Automacao';
    CarregaPacote('pkFormularios', vDadosIni.vFormularios.AHandle);
    //  CarregaPacote('pkFiscal', hdFiscal);
    //  CarregaPacote('pkProdutos',hdProdutos );
    CarregaPacote('pkClientes', hdClientes);
    CarregaPacote('pkPedidoVenda', hdPedVenda);
    //CarregaPacote('pkNfSerieD', hdNFSerieD);
    CarregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    CarregaPacote('pkSugestaoCompras', hdSugestaoCompra);
    CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    CarregaPacote('pkMargem', hdMargem);
    CarregaPacote('pkModern', vDadosIni.vModern.AHandle);
    CarregaPacote('pkFiscal', vDadosIni.vFiscal.AHandle);
    {$ENDREGION}

    vDadosIni.abreStatusProcessamento('','Verificando estrutura do banco de dados', True);
    dtmEnt.verificaEstruturaBancoDeDados;

    //Nova reestruturação
    hdReestrutura := 0;
    CarregaPacote('pkReestrutura', hdReestrutura);
    if hdReestrutura = 0 then
      Application.MessageBox('Pacote de reestruturação não carregado', 'Anteção', 0 + 64)
    else
    begin
      try
        @reestrutura_verificar_hwauto := GetProcAddress(hdReestrutura, 'reestrutura_verificar_hwauto');
        if Assigned(reestrutura_verificar_hwauto) then
          reestrutura_verificar_hwauto(PChar(vDadosIni.vVersaoBpl));
        if vDadosIni.GetIni('Configuracao', 'TerminalFiscal', 'N') = 'S' then
        begin
          @reestrutura_verificar_fiscal := GetProcAddress(hdReestrutura, 'reestrutura_verificar_fiscal');
          if Assigned(reestrutura_verificar_fiscal) then
            reestrutura_verificar_fiscal(PChar(vDadosIni.vVersaoBpl));
        end;
      except
        Application.MessageBox('Pacote de reestruturação não executado', 'Anteção', 0 + 64)
      end;
    end;

    vDadosIni.abreStatusProcessamento('','Verificando HwUpdate', True);
    if vDadosIni._HwUpdateAtivado(dtmEnt.qrBuscas) then
    begin
      if vDadosIni._novaVersao(dtmEnt.qrBuscas) then
        _abreHwUpdate
      else if vDadosIni._novaVersaoBugSeq(dtmEnt.qrBuscas) then
        _abreHwUpdate(True)
      else
        _passaVersaoHwUpdate;
    end
    else
      vDadosIni._novaVersao(dtmEnt.qrBuscas);

    panel1.Height := Height;

    vDadosIni.abreStatusProcessamento('','Conectando com banco de dados', True);

    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True) then
    begin
      Abort;
      exit;
      Abort;
    end;

    for I := 0 to ParamCount do
      if LowerCase(ParamStr(I)) = 'modonfce' then
      begin
        vDadosIni.vNFConsumidor.ModoNFCe := True;
        Break;
      end;

    vDadosIni.abreStatusProcessamento('','Verificando usuário', True);

    if not dtmEnt.verificaEntrada then
    begin
      Exit;
      Abort;
    end;

    SetupModern();

    vDadosIni.abreStatusProcessamento('','Iniciando relatórios', True);

    criarMenusRelatorios;

    vDadosIni.abreStatusProcessamento('','Iniciando componentes', True);

    StatusBar1.Panels[0].Text := 'Hw Sac 4.0 Versão: ' + vDadosIni._getVersaoCaption + ' - ' + copy(vDadosIni._getDataVersaoBpl, 4, 7);//' 12/2011';
    Version.Caption := StatusBar1.Panels[0].Text;

//    if vDadosIni.GetIni('MD', 'MFED', 'N') = 'S' then //MostrarFuncionalidadesEmDesenvolvimento
    vDadosIni.nfc_definirTokenEmissor;

    Memo2.Lines.Clear;
    Memo2.Lines.Add('Desenvolvido por Hw Sistemas e Computadores Ltda');
    Memo2.Lines.Add('Fone: 33 32725351');
    Memo2.Lines.Add('e-mail: suporte@hwsistemas.com.br');
    Memo2.Lines.Add('Home Page: www.hwsistemas.com.br');
    Memo2.Lines.Add('');
    Memo2.Lines.Add('Equipe de Desenvolvimento:');
    Memo2.Lines.Add('Herbert da Silva Costa');
    Memo2.Lines.Add('João Pedro R Costa');
    Memo2.Lines.Add('José Carlos Souza');
    Memo2.Lines.Add('Odilon Gonçalves da P. Junior');
    Memo2.Lines.Add('');
    Memo2.Lines.Add('Versão Sistema: '+ vDadosIni._getVersaoCaption + ' - ' + vDadosIni._getDataVersaoBpl);
    Memo2.Lines.Add('Versão Base Retaguarda: '+ vDadosIni.StrZero(vDadosIni.vVersaoBancoHw,4));
    Memo2.Lines.Add('Versão Processos: '+ vDadosIni.StrZero(vDadosIni.vVersaoTabelaProcessos,4));
    Memo2.Lines.Add('Emissor NFC-e Configurado: '+ vDadosIni.StrZero(vDadosIni.vNFConsumidor.CodEmissor, 3));

    StatusBar1.Panels[1].Text := 'Usuário: ' + vDadosIni.vNomeUsuario;
    StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
    StatusBar1.Panels[4].Text := 'Endereço: ' + vDadosIni.vBancoHW;
    Caption := 'Hw Sac 4.0 - Hw Sistemas e Computadores - Empresa '+
    vdadosini.StrZero(strtoint(vDadosIni.codEmpresa),3)+'-'+vDadosIni.vEmp.vnomeEmpresa;
    if vDadosIni.vSistema = 'Automacao' then
      Application.Title := 'Hw Sac 4.0';
    if vDadosIni.vModoTreino = 'S' then
    begin
      Caption := Caption + ' - MODO TREINAMENTO ATIVADO - NF-e: ' + vDadosIni.vEmp.vNfe.webServiceAmbiente;
      Application.Title := Application.Title + ' Treinamento';
      ScrollBox1.Color := clMoneyGreen;
      Panel1.Color := clMoneyGreen;
    end;

//    if vDadosIni.GetIni('MD', 'MFED', 'N') <> 'S' then //MostrarFuncionalidadesEmDesenvolvimento
//    begin
//      NotaFiscalConsumidor.Tag := 0;
//      NotaFiscalConsumidorEmissor.Tag := 0;
//      NotaFiscalConsumidorNFCe.Tag := 0;
//      NotaFiscalConsumidorSATFiscal.Tag := 0;
//    end;

    cTransacao := TIBTransaction.Create(Application);
    cQuery := TIBQuery.Create(Application);
    cTransacao.DefaultDatabase := dtmAtivo.bancoHw;
    cTransacao.Params.Add('read_committed');
    cTransacao.Params.Add('rec_version');
    cTransacao.Params.Add('nowait');
    cQuery.Database := dtmAtivo.bancoHw;
    cQuery.Transaction := cTransacao;

    cCartaoQ := TIBQuery.Create(Application);
    cCartaoQ.Database := dtmAtivo.bancoHw;
    cCartaoQ.Transaction := cTransacao;

    GridHandlerSingleton.GetInstance().OnNeedQueryOOP := GridHandlerNeedQueryOOP;

    EnterTelaConfigurar;

    vDadosIni.setSistemasRregistrados(sistemasRegistrados(vDadosIni.vEmp.vCNPJ));

    if _LerConfiguracoesRegistroString('EsconderBotoes') = 'S'  then
    begin
      SpeedButton1.Caption := '»';
      SpeedButton1.Tag := 2;
      Panel1.Tag := Panel1.Height;
      Panel1.Align := alNone;
      Panel1.Height := Panel1.Tag;
      Panel3.Visible := true;
      Panel1.Left := -162;
      _carregarImagemFundo;
      Timer2.Enabled := true;
    end
    else
    begin
      SpeedButton1.Tag := 1;
      _carregarImagemFundo;
    end;

    vDadosIni.abreStatusProcessamento('','Validando uso do Software', True);

    if not ChaveMensalValida() then
    begin
      //Application.Terminate;
      Exit;
    end
    else
    begin
      vDadosIni.abreStatusProcessamento('','Configurando menus', True);
      vMenu := TMenusAuto.Create;
      vMenu.configurarMenus(vDadosIni.vDpto);
      vMenu.Free;
      vMenu := nil;
    end;

    MenusConfigurarDefaults;
    MenusDesabilitarQuandoNFCeOffline;
    CategoryButtonsConfigurar;
    {
    MudarUsuario.Enabled := true;
    Sair.Enabled := true;
    MenuAtalhos.Enabled := true;

    cbAutomacao.Visible := (vDadosIni.vRegistro.vSisAutomacao and
      vDadosIni.vSistemasUsuario.vSisAutomacao) and (true);
    cbFinanceiro.Visible := (vDadosIni.vRegistro.vSisCaixaGeral and
      vDadosIni.vSistemasUsuario.vSisCaixaGeral) and (true);
  //  cbCaixa.Visible := (vDadosIni.vRegistro.vSisCaixaAuxiliar and
  //    vDadosIni.vSistemasUsuario.vSisCaixaAuxiliar) and (true);
    cbPAFECF.Visible := (vDadosIni.vRegistro.vSisPAFECF and vDadosIni.vSistemasUsuario.vSisPAFECF) and
      (true);
    cbVeiculo.Visible := (vDadosIni.vRegistro.vSisVeiculos and vDadosIni.vSistemasUsuario.vSisVeiculos)
      and (true);
    cbCRM.Visible := (vDadosIni.vRegistro.vSisCRM and vDadosIni.vSistemasUsuario.vSisCRM) and (true);
    cbGestor.Visible := (vDadosIni.vRegistro.vSisGestor and vDadosIni.vSistemasUsuario.vSisGestor) and
      (true);
  //  cbSupervisor.Visible := (vDadosIni.vRegistro.vSisSupervisor and
  //    vDadosIni.vSistemasUsuario.vSisSupervisor) and (true);

    cbAutomacao.Enabled := cbAutomacao.Visible;
    cbFinanceiro.Enabled := cbFinanceiro.Visible;
  //  cbCaixa.Enabled := cbCaixa.Visible;
    cbPAFECF.Enabled := cbPAFECF.Visible;
    cbVeiculo.Enabled := cbVeiculo.Visible;
    cbCRM.Enabled := cbCRM.Visible;
    cbGestor.Enabled := cbGestor.Visible;

    if cbAutomacao.Categories.Count > 0 then
    begin
      cbAutomacao.Categories.Items[0].Items.Clear;
      with cbAutomacao.Categories.Items[0].Items.Add do
      begin
        Caption    := 'Clientes/Fornecedor';
        Hint       := 'Cadastro de Clientes';
        ImageIndex := 0;
        OnClick    := CadastrosDeClientesFornecedorClick;
      end;
      with cbAutomacao.Categories.Items[0].Items.Add do
      begin
        Caption    := 'Produtos';
        Hint       := 'Cadastro de Produtos';
        ImageIndex := 2;
        OnClick    := CadastroDeProdutosClick;
      end;
      with cbAutomacao.Categories.Items[0].Items.Add do
      begin
        Caption    := 'Notas Fiscais';
        Hint       := 'Lançamento das Notas Fiscais';
        ImageIndex := 4;
        OnClick    := NotasFiscaisClick;
      end;
      with cbAutomacao.Categories.Items[0].Items.Add do
      begin
        Caption    := 'Venda de Produtos';
        Hint       := 'Venda de Produtos';
        ImageIndex := 7;
        OnClick    := VendaDeProdutosClick;
      end;
      if (vDadosIni.GetIni('Sistema', 'poficina', 'S') <> 'N') then
        with cbAutomacao.Categories.Items[0].Items.Add do
        begin
          Caption    := 'Ordem de Serviço';
          Hint       := 'Venda de Produtos e Serviços';
          ImageIndex := 6;
          OnClick    := OrdemdeServicoClick;
        end;
      with cbAutomacao.Categories.Items[0].Items.Add do
      begin
        Caption    := 'Orçamento';
        Hint       := 'Orçamento';
        ImageIndex := 5;
        OnClick    := OrcamentoEstoqueClick;
      end;
      with cbAutomacao.Categories.Items[0].Items.Add do
      begin
        Caption    := 'NFC-e';
        Hint       := 'NFC-e';
        ImageIndex := 4;
        OnClick    := NotaFiscalConsumidorNFCeClick;
      end;
      cbAutomacao.Height := 5 + (cbAutomacao.Categories.Items[0].Items.Count * 25);
    end;
  //  cbSupervisor.Enabled := cbSupervisor.Visible;
  }

    vDadosIni.abreStatusProcessamento('','Verificando registro do software', True);

    {
    //Fazer Loggof e sair do sistema
    MenuCadastros.Enabled := True;
    MenuCadastros.Visible := True;
    MudarUsuario.Enabled := True;
    MudarUsuario.Visible := True;
    Sair.Enabled := True;
    Sair.Visible := True;

    //Cadastro da Empresa e configuracao do Menu
    MenuConfiguracoes.Enabled := True;
    MenuConfiguracoes.Visible := True;
    DadosdaEmpresa.Enabled := True;
    DadosdaEmpresa.Visible := True;
    MenusAuto.Enabled := True;
    MenusAuto.Visible := True;
    ManutencaoFDB1.Enabled := True;
    ManutencaoFDB1.Visible := True;
    ParametrosdeSistema.Enabled := True;
    ParametrosdeSistema.Visible := True;
    ParametrosdeSistemaGlobal.Enabled := True;
    ParametrosdeSistemaGlobal.Visible := True;
    LiberarAcessos.Enabled := True;
    LiberarAcessos.Visible := True;

    //Ajuda
    MenuAjuda.Enabled := True;
    MenuAjuda.Visible := True;
    Sobre.Enabled := True;
    Sobre.Visible := True;
    Ajuda.Enabled := True;
    Ajuda.Visible := True;
    RegistrarSoftware.Enabled := True;
    RegistrarSoftware.Visible := True;
    SuporteRemoto.Enabled := True;
    SuporteRemoto.Visible := True;
    SuporteOnline.Enabled := True;
    SuporteOnline.Visible := True;
    NoticiasHW.Enabled := True;
    NoticiasHW.Visible := True;
    DocumentosEmAberto.Enabled := True;
    DocumentosEmAberto.Visible := True;
    if Assigned(MenuHwCreditosEmAberto) then
    begin
      MenuHwCreditosEmAberto.Enabled := True;
      MenuHwCreditosEmAberto.Visible := True;
    end;
    }

    if not sistemaRegistrado(vDadosIni.vEmp.vCNPJ, vDadosIni.vSistema) then
    begin
      vFazerLoginNovamente := True;
      vDadosIni.setSistemasRregistrados(sistemasRegistrados(vDadosIni.vEmp.vCNPJ));
      if not vDadosIni.vRegistro.vSisPAFECF then
      begin
        Application.Terminate;
        Exit;
      end;
    end;

    vDadosIni.setSistemasRregistrados(sistemasRegistrados(vDadosIni.vEmp.vCNPJ));

    if not vDadosIni.vRegistro.vSisAutomacao then
      if (vDadosIni.vRegistro.vSisPAFECF) and (vDadosIni.vSistemasUsuario.vSisPAFECF) then
      begin
        // Entrar na configuracao do PAF
        MenuPAFECF.Enabled := True;
        MenuPAFECF.Visible := True;
        OperacoesFrenteLoja.Enabled := True;
        OperacoesFrenteLoja.Visible := True;
        ParametrosdeSistemaGlobal.Enabled := True;
        ParametrosdeSistemaGlobal.Visible := True;
      end
      else
      begin
        Application.Terminate;
        Exit;
      end;

    if vFazerLoginNovamente then
      MudarUsuario.Click;

    vDadosIni.definirDiaFinanceiroFechado(cQuery);
    StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
    StatusBar1.Panels[3].Text := 'Dia Financeiro: ' + datetostr(vDadosIni.diaFFinanceiro+1);

    vMensagemFinancNaoFech := False;
    ContasAReceberVerNaEntrada;
    ContasAPagarVerNaEntrada;
    ClientesAniversariantesdoDia;

    {
    if (vDadosIni.vRegistro.vSisCaixaGeral) and (vDadosIni.vSistemasUsuario.vSisCaixaGeral) then
    begin
     if (vDadosIni.vEmp.vFinanceiroUnificado) and
       (vDadosIni.vEmp.vCodigoUnificadora <> StrToInt(vDadosIni.codEmpresa)) then
        //
      else
      begin
       if (vDadosIni.getDataBanco(cQuery) - (vDadosIni.diaFFinanceiro+1)) >= 1 then
          messagedlg('Dia do Financeiro: ' + datetostr(vDadosIni.diaFFinanceiro + 1) + ' não foi fechado', mtinformation, [mbOK], 0);
       if (Trim(vDadosIni.vverContas) = 'S') or (Trim(vDadosIni.vverContas) = 's') then
        if Application.MessageBox(pchar('Deseja visualizar as Contas a Pagar com vencimento até ' + datetostr(vDadosIni.getDataBanco(cQuery))), 'Confirmação', MB_YESNO + MB_DEFBUTTON2) = mrYES then
        begin
         try
           Screen.Cursor := crHourGlass;
           if vDadosIni.vCtp.AHandle = 0 then
             carregaPacote('pkContasAPagar', vDadosIni.vCtp.AHandle);
           contaAPagar.cadContasAPagar(2);
         finally
           Screen.Cursor := crDefault;
         end;
        end;
      end;
    end;
    }

    if IniConf.ReadStr('MD', 'Nws', '') <> 'N' then    
    if _exiteNews(pchar(vDadosIni.vNomeUsuario), pchar(vDadosIni.vBancoHW)) then
      if vDadosIni.vAbrirNews <> 'N' then
        NoticiasHW.Click
      else
      begin
        if FileExists(ExtractFilePath(Application.ExeName) + 'nws.exe') then
          vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'nws.exe ' + vDadosIni.vNomeUsuario + ' ' + vDadosIni.vBancoHW)
        else
          ShellExecute(Handle, 'open', PChar(vDadosIni.getConfSisStr('hw_url_servicos', cQuery) + '/newshw.aspx'), nil, nil, SW_SHOWNORMAL);
      end;

    vVerificarMensagens := True;

    gravarDataVeiculosEmDemonstracao;
//    abreFormVeiculosReservasVencidas;
    abreFormConsorciosemAssembleia;
    gravarDataVeiculosVencidos;
    abreFormVeiculosReservasVencendo;
    chamaintegraassohonda;

    Participantes.Caption := trim(vDadosIni.vPedVnd.descricaoParticipante);
    vDadosIni.hw_registra_estatistica(Self.Name);

    for I := 0 to ParamCount do
    begin
      if LowerCase(ParamStr(I)) = 'modonfce' then
      begin
        if vDadosIni.vNFConsumidor.AHandle = 0 then
          CarregaPacote('pkNFConsumidor', vDadosIni.vNFConsumidor.AHandle);
        @AshowForm := GetProcAddress(vDadosIni.vNFConsumidor.AHandle, 'nfc_abreformNFCe_v2');
        if Assigned(AshowForm) then
        begin
//          TimerServiceLess.Enabled := True;
          AshowForm(True);

          TimerCloseApp.Enabled := True;
        end;
        Break;
      end;
    end;

    for I := 0 to ParamCount do
    begin
      if LowerCase(ParamStr(I)) = 'modonf' then
      begin
        if vDadosIni.vNotaFiscal.AHandle = 0 then
          carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
        cadNf.CadNF(1);
        Break;
      end
      else if LowerCase(ParamStr(I)) = 'modomdfe' then
      begin
        if vDadosIni.vNotaFiscal.AHandle = 0 then
          carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
        vMDFe.cadMDFe(1);
        Break;
      end
      else if StartsText('@pk-', ParamStr(I)) then
      begin //@pk-pkSPED-ajustesautoefd_show

        string_ := StringReplace(ParamStr(I), '@pk-', '', [rfIgnoreCase]);

        CarregaPacote(Copy(string_, 1, Pos('-', string_) - 1), handleDevTest);

        string_ := Copy(string_, Pos('-', string_) + 1, Length(string_));

        @AshowForm := GetProcAddress(handleDevTest, PAnsiChar(string_));
        if Assigned(AshowForm) then
        begin
          AshowForm(True);
          TimerCloseApp.Enabled := True;
        end;
        Break;
      end;
    end;

    if vDadosIni.vFormularios.AHandle = 0 then
      CarregaPacote('pkFormularios', vDadosIni.vFormularios.AHandle);

    @setShowFormMainForm      := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setEventoShowFormMainForm'));

    @setShowModalFormMainForm := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setEventoShowModalFormMainForm'));

    @setCloseQueryMainFormMsg := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setEventoCloseQueryMainForm'));

    if Assigned(setShowFormMainForm) then
      setShowFormMainForm(ShowFormMainForm);

    if Assigned(setShowModalFormMainForm) then
      setShowModalFormMainForm(ShowModalFormMainForm);

    if Assigned(setCloseQueryMainFormMsg) then
      setCloseQueryMainFormMsg(CloseQueryMainFormMsg);

    vDadosIni.atualizarEndBancoHwService;

    vDadosIni.iniciarServicoBackup(True);

    vNotificarBackupBD            := True;
    vNotificarChavePeriodica      := True;
    vNotificarDocAberto           := True;
    vNotificarHw                  := True;

    vNotificarBackupBD_Fixa       := False;
    vNotificarChavePeriodica_Fixa := False;
    vNotificarDocAberto_Fixa      := False;
    vNotificarHw_Fixa             := False;
  finally
    FTimeExibirMensagemChavePeriodica := Time + EncodeTime(0, 1, 0, 0);
    Timer1.Enabled := True;
    Timer3.Enabled := True;
    Timer4.Enabled := True;
    Timer5.Enabled := True;
    Timer6.Enabled := True;
    Timer7.Enabled := True;
    Timer8.Enabled := (vDadosIni.vCodPerfilHorasTrab > 0) and (not vDadosIni.vLoginPosHorarioTrab);
//    Timer9.Enabled := (trim(vDadosIni.retornaDadosHwCloudIA(dtmEnt.qrBuscas, False)) <> '') and (vDadosIni.vHwCloudIA.vUsarServMensageria = 'S');
    timerProcessamentos.Enabled := True;
//    TimerServiceLess.Enabled  := True;

    {$REGION 'ModoHomologacaoTesteTimersLog habilitar Memo para o log de comunicação com as APIs'}
    if (vDadosIni.GetIni('MD', 'MHTTL', 'N') = 'S') or (vDadosIni.GetIni('MD', 'MHTTCAL', 'N') = 'S') then //ModoHomologacaoTesteTimersLog
    begin
      Memo1.Lines.Clear;
      Memo1.Visible := True;
      Memo1.Align := alClient;
    end;
    {$ENDREGION}

    {$REGION 'Timer de notificacao backup na Hw'}
    if vDadosIni.GetIni('MD', 'MHTT', 'N') <> 'S' then //ModoHomologacaoTesteTimers
    begin
      Randomize;
      if vDadosIni.GetIni('MD', 'MHTTL', 'N') = 'S' then //ModoHomologacaoTesteTimersLog
        Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' +
                          'Minutos Random: ' + IntToStr(Trunc(((60 * 1000) + (Random(10) * 1000 * 60)) / 60 / 1000) ));
    end;
    TimerNotificarBackup.Enabled := True;
    {$ENDREGION}

    {$REGION 'Timer de verificar contas em aberto na Hw'}
    if (not vDadosIni.vEmp.vFinanceiroUnificado) or (vDadosIni.vEmp.vCodigoUnificadora = vDadosIni.cod_empresa)  then
    begin
      if vDadosIni.GetIni('MD', 'MHTT', 'N') <> 'S' then //ModoHomologacaoTesteTimers
      begin
        Randomize;
        if vDadosIni.GetIni('MD', 'MHTTL', 'N') = 'S' then //ModoHomologacaoTesteTimersLog
          Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' +
                            'Minutos Random: ' + IntToStr(Trunc(((60 * 1000) + (Random(10) * 1000 * 60)) / 60 / 1000) ))
        else
          TimerContasEmAbertoConsultaDiaria.Interval := (60 * 1000) + (Random(10) * 1000 * 60);
      end;
      TimerContasEmAbertoConsultaDiaria.Enabled := True;
    end;
    {$ENDREGION}

    confList := TConfig_sistema_classList.Create;
    try
    if vDadosIni.vCodUsuario > 0 then
      confList.AddKey('comercio_aberto_hab')
              .AddKey('comercio_aberto_receber_notificacao');
    confList.AddKey('recriar_view')
            .AddKey('atualizacao_historicoprod_prod_alt')
            .AddKey('atualizacao_historicoprod_auditoria')
            .MakeAll(cQuery, vDadosIni.cod_empresa);

    {$REGION 'Timer de verificar dados comercio aberto'}
    if vDadosIni.vCodUsuario > 0 then
      //with vDadosIni.getConfSisList(cQuery,
        //['comercio_aberto_hab', 'comercio_aberto_receber_notificacao']) do
        if confList.GetConf('comercio_aberto_hab').AsBoolean then
          with confList.GetConf('comercio_aberto_receber_notificacao') do
          begin
            value1_vc := ',' + StrReplace(value1_vc, ['|', ';', '-', ' '], ',') + ',';
            TimerComercioAbertoConsultaPeriodica.Enabled := Pos(',' + IntToStr(vDadosIni.vCodUsuario) + ',', value1_vc) > 0;
            if vDadosIni.GetIni('MD', 'MHTTCAL', 'N') = 'S' then
            begin
              Memo1.Lines.Add(value1_vc + ' ' + IntToStr(TimerComercioAbertoConsultaPeriodica.Interval) +
              IfThen(TimerComercioAbertoConsultaPeriodica.Enabled, ' Habilitado'));
            end;
          end;
    {$ENDREGION}

    {$REGION 'Chamada do hw.run.tasks para recriar views'}
    if confList.GetConf('recriar_view').AsDate <>
       DateOf(vDadosIni.getDataBanco(cQuery)) then
      vDadosIni.CreateProcessSimple(
        ExtractFilePath(Application.ExeName) +
        'hw.run.tasks.exe ' +
        'hw.recriarview ' +
        '"'+ vDadosIni.vBancoHW + '" ' +
        vDadosIni.codEmpresa, False, True);
    {$ENDREGION}

    {$REGION 'Chamada do hw.run.tasks para corrigir dados do historico diario q teve alteracao de grupo/codigo produto'}
    if (confList.GetConf('atualizacao_historicoprod_prod_alt').AsString <> 'S') or
       (confList.GetConf('atualizacao_historicoprod_auditoria').AsString <> 'S') then
      vDadosIni.CreateProcessSimple(
        ExtractFilePath(Application.ExeName) +
        'hw.run.tasks.exe ' +
        'hw.corrigirhistoricoproduto ' +
        '"'+ vDadosIni.vBancoHW + '" ' +
        vDadosIni.codEmpresa, False, True);
    {$ENDREGION}

    {$REGION 'Chamada do hw.run.tasks para o nbackup'}
    // O parametro vai criar uma tarefa agendada, e a tarefa ja dispara o evento
    vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) +
        'hw.run.tasks.exe ' +
        'hw.nbackup ' +
        '"'+ vDadosIni.vBancoHW + '" -taskschedule', False, False);
    {$ENDREGION}

    confList.Clear;
    finally
      confList.Free();
    end;

    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TfrmPrincipalS.FormularioShowModal: Boolean;
var
	X: Integer;
begin
	Result := True;
	for X := 0 to Application.ComponentCount - 1 do
    if Application.Components[X] is TForm then
      if Self.Name <> TForm(Application.Components[X]).Name then
        if fsModal in TForm(Application.Components[X]).FormState then
          Exit;

  Result := False;
end;

procedure TfrmPrincipalS.FormulasClick(Sender: TObject);
var
  vFormula: TFormulaProducao;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdProducao = 0 then
      CarregaPacote('pkProducao', hdProducao);
    vFormula._cadFormula(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.FtimerChavePeriodicaTimer(Sender: TObject);
begin
  FtimerChavePeriodica.Enabled := False;
//
//  if Assigned(TrayIconLicenca) then
//  begin
//    TrayIconLicenca.Animate := False;
//    TrayIconLicenca.Visible := False;
//  end;
end;

procedure TfrmPrincipalS.FuncionariosClick(Sender: TObject);
var
  Colaborador: tColaborador;
begin
  try
    Screen.Cursor := crHourGlass;
    Colaborador.cadColab(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Funcoes1Click(Sender: TObject);
var
  funcao: TFuncoes;
begin
  try
    Screen.Cursor := crHourGlass;
    funcao.CadFuncao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.GradesClick(Sender: TObject);
var
  ProdGrade: TProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    ProdGrade.CadGrades(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmPrincipalS.gravarDataVeiculosEmDemonstracao: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    Exit;

  if vDadosIni.vatvDemo = 'S' then
  begin
    if vDadosIni.LerGravarDataDemonstracao(cQuery) then
    begin
      vDadosIni.vPesquisa := 'EMAIL| S';
      formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TFrmDemonstracaoVeiculosCCIA', hdTemp);
      try
        //formulario.ShowModal;
      finally
        vDadosIni.vPesquisa := '';
        formulario.Free;
        unLoadPackage(hdTemp);
      end;
    end
    else
      vDadosIni.vdatademo := DateToStr(vDadosIni.getDataBanco(cQuery));
  end;
end;

function TfrmPrincipalS.gravarDataVeiculosVencidos: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  if (vDadosIni.vEmp.vVersaoVeiculos <> '4') then
    Exit;

  if vDadosIni.vatvReserva = 'S' then
  begin
    if vDadosIni.LerGravarDataReservasVencidas(cQuery) then
    begin
      vDadosIni.vPesquisa := 'RESERVAVENC|2|';
      formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmReservasVencidas', hdTemp);
      try
        formulario.ShowModal;
      finally
        vDadosIni.vPesquisa := '';
        formulario.Free;
        unLoadPackage(hdTemp);
      end;
    end;
  end;

end;

function TfrmPrincipalS.GridHandlerNeedQueryOOP(var usuario: string): TQuery_OOP;
begin
  usuario := vDadosIni.vNomeUsuario;
  Result:= QueryHelper.CreateObj(cQuery);
end;

procedure TfrmPrincipalS.GruposClick(Sender: TObject);
var
  Produto: TProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Produto.CadGrupos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.HideHintBalloon;
begin
  Exit;
	if (vHandleMensagem <> 0) then
  	vDadosIni.HideBalloonTipFixed(vHandleMensagem);
end;

procedure TfrmPrincipalS.HwServiceClick(Sender: TObject);
var
  vHwService: TConfigServiceHw;
begin
  try
    Screen.Cursor := crHourGlass;
    vHwService := TConfigServiceHw.Create;
    vHwService.abreHwService;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ImpressorasFiscaisClick(Sender: TObject);
var
  vImpCNIEE: TImpressoras_CNIEE;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vImpCNIEE.CadImpressoras(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.IndiceTecnicoPAFClick(Sender: TObject);
var
  indTec: TIndiceTecnico;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      carregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    indTec.cadIndiceTecnico(0,'');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.InformacaoComplementarClick(Sender: TObject);
var
  vInfCompl: TInformacaoComplementarSPED;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vInfCompl.cadInformacaoCompl(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.InicializarTimers;
begin
  {$REGION 'notificacções cobranca HW'}
  if not Assigned(TimerContasEmAbertoConsultaDiaria) then
    TimerContasEmAbertoConsultaDiaria := TTimer.Create(Self);
  TimerContasEmAbertoConsultaDiaria.Enabled := False;
  TimerContasEmAbertoConsultaDiaria.Interval := 1000 * 5;
  TimerContasEmAbertoConsultaDiaria.OnTimer := TimerContasEmAbertoConsultaDiariaTimer;

  if not Assigned(TimerContasEmAbertoNotificacao) then
    TimerContasEmAbertoNotificacao := TTimer.Create(Self);
  TimerContasEmAbertoNotificacao.Enabled := False;
  TimerContasEmAbertoNotificacao.Interval := 1000 * 20;
  TimerContasEmAbertoNotificacao.OnTimer := TimerContasEmAbertoNotificacaoTimer;

//  if not Assigned(TrayIconDocumentosAbertos) then
//    TrayIconDocumentosAbertos := TTrayIcon.Create(Self);
//  TrayIconDocumentosAbertos.BalloonTimeout := 10000;
  {$ENDREGION}

  {$REGION 'Comercio Aberto'}
  if not Assigned(TimerComercioAbertoConsultaPeriodica) then
    TimerComercioAbertoConsultaPeriodica := TTimer.Create(Self);
  TimerComercioAbertoConsultaPeriodica.Enabled := False;
  TimerComercioAbertoConsultaPeriodica.Interval := 1000 * 15;
  TimerComercioAbertoConsultaPeriodica.OnTimer := TimerComercioAbertoConsultaPeriodicaTimer;

  if not Assigned(TimerComercioAbertoNotificacao) then
    TimerComercioAbertoNotificacao := TTimer.Create(Self);
  TimerComercioAbertoNotificacao.Enabled := False;
  TimerComercioAbertoNotificacao.Interval := 1000 * 30;
  TimerComercioAbertoNotificacao.OnTimer := TimerComercioAbertoNotificacaoTimer;
//  if not Assigned(TrayIconComercioAberto) then
//    TrayIconComercioAberto := TTrayIcon.Create(Self);
//  TrayIconComercioAberto.BalloonTimeout := 10000;
  {$ENDREGION}

  {$REGION 'Backup Hw'}
  if not Assigned(TimerNotificarBackup) then
    TimerNotificarBackup := TTimer.Create(Self);
  TimerNotificarBackup.Enabled := False;
  TimerNotificarBackup.Interval := 1000 * 45;
  TimerNotificarBackup.OnTimer := TimerNotificarBackupTimer;
  {$ENDREGION}

end;

procedure TfrmPrincipalS.IntermediadoresClick(Sender: TObject);
var
  vIntermPagEC: TIntermPag;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vFormPag.AHandle = 0 then
      CarregaPacote('pkFormPag', vDadosIni.vFormPag.AHandle);
    vIntermPagEC._cadIntermPag(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.InventarioClick(Sender: TObject);
var
  vProd: TProdutos;
begin
  vProd := TProdutos.create;
  vProd.CadProdutos(2);
  vProd.free;
  vProd := nil;
end;

procedure TfrmPrincipalS.InventarioVClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'InventarioVeiculos');
end;

procedure TfrmPrincipalS.TiposdeServicosLeiComplementarN116Click(Sender: TObject);
var
  TipoServicoNFSE: TTipoServicoNFSE;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    TipoServicoNFSE._cadTipoServicoNFSE(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ipoDespesas1Click(Sender: TObject);
var
  PTipoDespesas: TTipoDespesa;
begin
  try
    Screen.Cursor := crHourGlass;
  if vDadosIni.vCadBasicos.AHandle = 0 then
    carregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
  PTipoDespesas._CadTipoDespesa(0);
  finally
      Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ipopndencias1Click(Sender: TObject);
var
  PTipoPendencias: TTipoPendencia;
begin
  try
    Screen.Cursor := crHourGlass;
  if vDadosIni.vCadBasicos.AHandle = 0 then
    carregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
  PTipoPendencias._CadTipoPendencia(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;


procedure TfrmPrincipalS.TiposVendas1Click(Sender: TObject);
var
  vTiposVendas: TTipoVendas;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vTiposVendas._cadTipoVendas(0);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPrincipalS.TabeladeProcessosClick(Sender: TObject);
var
  vProc: TProcesso;
begin
  try
    Screen.Cursor := crHourGlass;
    vProc.CadProcesso(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Timer1Timer(Sender: TObject);
begin
 try
 Timer1.Enabled := False;

 ExibirMensagemChavePeriodica;

 VerificarLogNBackup;

 if vDadosIni.vEmp.vFinanceiroUnificado then
   if vDadosIni.vEmp.vCodigoUnificadora <> StrToInt(vDadosIni.codEmpresa) then
   begin
     StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
     StatusBar1.Panels[3].Text := 'Dia Financeiro: 00/00/0000';
     exit;
   end;

 if vDadosIni.vRegistro.vSisCaixaGeral then
 begin
   if vDadosIni.vSistemasUsuario.vSisCaixaGeral then
   begin
     vDadosIni.definirDiaFinanceiroFechado(cQuery);
     StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
     StatusBar1.Panels[3].Text := 'Dia Financeiro: ' + datetostr(vDadosIni.diaFFinanceiro+1);
   end
   else
   begin
     StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
     StatusBar1.Panels[3].Text := 'Dia Financeiro: 00/00/0000';
   end;
 end;
 finally
   Timer1.Enabled := True;
 end;
end;

procedure TfrmPrincipalS.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  Panel1.Height := Self.Height - 77;
end;

procedure TfrmPrincipalS.Timer3Timer(Sender: TObject);
begin
  if not vVerificarMensagens then
    Exit;

  if ((vDadosIni.vCodUsuario > 0) and (vDadosIni.codEmpresa <> '')) then
  begin
    if vDadosIni.vEmp.vInterMensagem > 0 then
      if (vDadosIni.VerificarMensMobile(cQuery))then
      begin
        if not FormularioShowModal then
        begin
        	cbMensagens.Enabled := True;
        	cbMensagens.Visible := True;

          cbMensagens.Top := 0;
    			cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

          vTituloMensagem := 'Mensagens Mobile: (' + IntToStr(vDadosIni.vQuantMensMob) + ')          ';
          vTextoMensagem  := vDadosIni.vMensMob;
          vIconMensagem   := 1;
          vTipoMensagem   := 'M';
          ShowHintBalloon;
        end;
//       TrayIconMensMob.Animate := True;
//       TrayIconMensMob.Visible := True;
//       TrayIconMensMob.BalloonTitle := 'Mensagens recebidas: ('+ IntToStr(vDadosIni.vQuantMensMob)+')';
//       TrayIconMensMob.BalloonFlags := bfWarning;//bfInfo;
//       TrayIconMensMob.BalloonHint := vDadosIni.vMensMob;
//       TrayIconMensMob.BalloonTimeout :=  60000 * (vDadosIni.vEmp.vInterMensagem);
//       TrayIconMensMob.ShowBalloonHint;

        Timer3.Interval :=  60000 * (vDadosIni.vEmp.vInterMensagem);
      end
      else if (not vNotificarBackupBD_Fixa)
      	and (not vNotificarChavePeriodica_Fixa)
        and (not vNotificarDocAberto_Fixa)
        and (not vNotificarHw_Fixa) then
      begin
      	cbMensagens.Enabled := False;
        cbMensagens.Visible := False;

        cbMensagens.Top := 0;
    		cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

        vTituloMensagem := '';
        vTextoMensagem  := '';
        vIconMensagem   := 0;
        vTipoMensagem   := '';

      	HideHintBalloon;
//        TrayIconMensMob.Animate := false;
//        TrayIconMensMob.Visible := false;
//        TrayIconMensMob.BalloonTimeout :=  60000 * (vDadosIni.vEmp.vInterMensagem);

        Timer3.Interval :=  60000 * (vDadosIni.vEmp.vInterMensagem);
      end;
  end;
end;

procedure TfrmPrincipalS.Timer4Timer(Sender: TObject);
begin
  abreFormVeiculosEmDemonstracao;
  if timetostr(time) = '00:01:00' then
  begin
    chamaintegraassohonda;
  end;
end;

procedure TfrmPrincipalS.Timer5Timer(Sender: TObject);
begin
  if not vVerificarMensagens then
    Exit;

  if ((vDadosIni.vCodUsuario > 0) and (vDadosIni.codEmpresa <> '')) then
  begin
    if vDadosIni.vEcommerce.vInterMensagemEC > 0 then
      if (vDadosIni.VerificarMensEcommerce(cQuery))then
      begin
        if not FormularioShowModal then
        begin
        	cbMensagens.Enabled := True;
        	cbMensagens.Visible := True;

          cbMensagens.Top := 0;
    			cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

          vTituloMensagem := 'Mensagens E-commerce: (' + IntToStr(vDadosIni.vQuantMensEC) + ')    ';
          vTextoMensagem  := vDadosIni.vMensEC;
          vIconMensagem   := 1;
          vTipoMensagem   := 'E';
          ShowHintBalloon;
        end;
//        TrayIconMensEcommerce.Animate := True;
//        TrayIconMensEcommerce.Visible := True;
//        TrayIconMensEcommerce.BalloonTitle := 'Mensagens E-commerce: ('+ IntToStr(vDadosIni.vQuantMensEC)+')';
//        TrayIconMensEcommerce.BalloonFlags := bfWarning;//bfInfo;
//        TrayIconMensEcommerce.BalloonHint := vDadosIni.vMensEC;
//        TrayIconMensEcommerce.BalloonTimeout :=  60000 * (vDadosIni.vEcommerce.vInterMensagemEC);
//        TrayIconMensEcommerce.ShowBalloonHint;

        Timer5.Interval :=  60000 * (vDadosIni.vEcommerce.vInterMensagemEC);
      end
      else if (not vNotificarBackupBD_Fixa)
      	and (not vNotificarChavePeriodica_Fixa)
        and (not vNotificarDocAberto_Fixa)
        and (not vNotificarHw_Fixa) then
      begin
      	cbMensagens.Enabled := False;
        cbMensagens.Visible := False;

        cbMensagens.Top := 0;
    		cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

        vTituloMensagem := '';
        vTextoMensagem  := '';
        vIconMensagem   := 0;
        vTipoMensagem   := '';

      	HideHintBalloon;
//        TrayIconMensEcommerce.Animate := false;
//        TrayIconMensEcommerce.Visible := false;
//        TrayIconMensEcommerce.BalloonTimeout :=  60000 * (vDadosIni.vEcommerce.vInterMensagemEC);

        Timer5.Interval :=  60000 * (vDadosIni.vEcommerce.vInterMensagemEC);
      end;
  end;
end;

procedure TfrmPrincipalS.Timer6Timer(Sender: TObject);
begin
  if not vVerificarMensagens then
    Exit;

  if ((vDadosIni.vCodUsuario > 0) and (vDadosIni.codEmpresa <> '')) then
  begin
    if vDadosIni.vEnvNotFinanc.vInterMensagemEnvNotFinanc > 0 then
      if (vDadosIni.VerificarMensServicoEnvNot(cQuery))then
      begin
        if not FormularioShowModal then
        begin
        	cbMensagens.Enabled := True;
        	cbMensagens.Visible := True;

          cbMensagens.Top := 0;
    			cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

          vTituloMensagem := 'Notificações Financeiro: (' + IntToStr(vDadosIni.vQuantMensFinanc) + ')    ';
          vTextoMensagem  := vDadosIni.vMensFinanc;
          vIconMensagem   := 1;
          vTipoMensagem   := 'F';
          ShowHintBalloon;
        end;
//        TrayIconEnvNotFinanc.Animate := True;
//        TrayIconEnvNotFinanc.Visible := True;
//        TrayIconEnvNotFinanc.BalloonTitle := 'Notificações Financeiro: ('+ IntToStr(vDadosIni.vQuantMensFinanc)+')';
//        TrayIconEnvNotFinanc.BalloonFlags := bfWarning;//bfInfo;
//        TrayIconEnvNotFinanc.BalloonHint := vDadosIni.vMensFinanc;
//        TrayIconEnvNotFinanc.BalloonTimeout :=  60000 * (vDadosIni.vEnvNotFinanc.vInterMensagemEnvNotFinanc);
//        TrayIconEnvNotFinanc.ShowBalloonHint;

        Timer6.Interval :=  60000 * (vDadosIni.vEnvNotFinanc.vInterMensagemEnvNotFinanc);
      end
      else if (not vNotificarBackupBD_Fixa)
      	and (not vNotificarChavePeriodica_Fixa)
        and (not vNotificarDocAberto_Fixa)
        and (not vNotificarHw_Fixa) then
      begin
      	cbMensagens.Enabled := False;
        cbMensagens.Visible := False;

        cbMensagens.Top := 0;
    		cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

        vTituloMensagem := '';
        vTextoMensagem  := '';
        vIconMensagem   := 0;
        vTipoMensagem   := '';

      	HideHintBalloon;
//        TrayIconEnvNotFinanc.Animate := false;
//        TrayIconEnvNotFinanc.Visible := false;
//        TrayIconEnvNotFinanc.BalloonTimeout :=  60000 * (vDadosIni.vEnvNotFinanc.vInterMensagemEnvNotFinanc);

        Timer6.Interval :=  60000 * (vDadosIni.vEnvNotFinanc.vInterMensagemEnvNotFinanc);
      end;
    end;
end;

procedure TfrmPrincipalS.Timer7Timer(Sender: TObject);
begin
  if not vVerificarMensagens then
    Exit;

  if ((vDadosIni.vCodUsuario > 0) and (vDadosIni.codEmpresa <> '')) then
  begin
    if vDadosIni.vPagOnline.vInterMensagemPagOnline > 0 then
      if (vDadosIni.VerificarMensPagOnline(cQuery))then
      begin
        if not FormularioShowModal then
        begin
        	cbMensagens.Enabled := True;
        	cbMensagens.Visible := True;

          cbMensagens.Top := 0;
    			cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

          vTituloMensagem := 'Mensagens Pag Online: (' + IntToStr(vDadosIni.vQuantMensPagOnline) + ')';
          vTextoMensagem  := vDadosIni.vMensPagOnline;
          vIconMensagem   := 1;
          vTipoMensagem   := 'P';
          ShowHintBalloon;
        end;
//        TrayIconPagOnline.Animate := True;
//        TrayIconPagOnline.Visible := True;
//        TrayIconPagOnline.BalloonTitle := 'Notificações Financeiro: ('+ IntToStr(vDadosIni.vQuantMensPagOnline)+')';
//        TrayIconPagOnline.BalloonFlags := bfWarning;//bfInfo;
//        TrayIconPagOnline.BalloonHint := vDadosIni.vMensPagOnline;
//        TrayIconPagOnline.BalloonTimeout :=  60000 * (vDadosIni.vPagOnline.vInterMensagemPagOnline);
//        TrayIconPagOnline.ShowBalloonHint;

        Timer7.Interval :=  60000 * (vDadosIni.vPagOnline.vInterMensagemPagOnline);
      end
      else if (not vNotificarBackupBD_Fixa)
      	and (not vNotificarChavePeriodica_Fixa)
        and (not vNotificarDocAberto_Fixa)
        and (not vNotificarHw_Fixa) then
      begin
      	cbMensagens.Enabled := False;
        cbMensagens.Visible := False;

        cbMensagens.Top := 0;
    		cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

        vTituloMensagem := '';
        vTextoMensagem  := '';
        vIconMensagem   := 0;
        vTipoMensagem   := '';

        HideHintBalloon;
//        TrayIconPagOnline.Animate := false;
//        TrayIconPagOnline.Visible := false;
//        TrayIconPagOnline.BalloonTimeout :=  60000 * (vDadosIni.vPagOnline.vInterMensagemPagOnline);

        Timer7.Interval :=  60000 * (vDadosIni.vPagOnline.vInterMensagemPagOnline);
      end;
   end;
end;

procedure TfrmPrincipalS.Timer8Timer(Sender: TObject);
var
	vAvisoFechaHorasTrab: boolean;
begin
	if Self.Tag = 99 then
  	Exit;

	if ((vDadosIni.vCodUsuario > 0) and (vDadosIni.codEmpresa <> '')) then
  begin
    vAvisoFechaHorasTrab := vDadosIni.vAvisoFechaHorasTrab;
    if Timer8.Interval = 60000 * (5) then
    begin
      if vDadosIni.verificarFechamentoSistema(cQuery) then
        Timer8.Enabled  := False
      else if (vAvisoFechaHorasTrab) and (vDadosIni.vFecharSistema) then
      begin
      	Self.Tag := 99;
      	Close;
      end;
    end;

    Timer8.Interval := 60000 * (5);
  end;
end;

procedure TfrmPrincipalS.Timer9Timer(Sender: TObject);
begin
//	if Self.Tag = 99 then
//  begin
//  	Timer9.Enabled := False;
//  	Exit;
//  end;
//
//  if vDadosIni.GetIni('MD', 'MHTT', 'N') = 'S' then
//  begin
//  	Timer9.Enabled := False;
//  	Exit;
//  end;
//
//  if vDadosIni.vHwCloudIA.vUsarServMensageria <> 'S' then
//  begin
//  	Timer9.Enabled := False;
//  	Exit;
//  end;
//
//  if trim(vDadosIni.retornaDadosHwCloudIA(cQuery, False)) = '' then
//  begin
//  	Timer9.Enabled := False;
//    Exit;
//  end;
//
//  if ((vDadosIni.vCodUsuario > 0) and (vDadosIni.codEmpresa <> '')) then
//  begin
//  	try
//    	Timer9.Enabled := False;
//  		vDadosIni.VerificarMensMensageria(cQuery);
//    finally
//      Timer9.Interval := 60000 * (vDadosIni.vHwCloudIA.vTimerConsultaMensagem);
//      Timer9.Enabled := True;
//    end;
//  end;
end;

procedure TfrmPrincipalS.TimerCloseAppTimer(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipalS.TimerComercioAbertoConsultaPeriodicaTimer(
  Sender: TObject);
  procedure SetInterval(Min: Integer);
  begin
    if Min <= 0 then
      Min := 59;
    if vDadosIni.GetIni('MD', 'MHTTCA', 'N') = 'S' then //ModoHomologacaoTesteTimersLogComercioAberto
      TimerComercioAbertoConsultaPeriodica.Interval := 15000
    else                        //1min  * min
      TimerComercioAbertoConsultaPeriodica.Interval := 60000 * Min;
  end;

begin
  TimerComercioAbertoConsultaPeriodica.Enabled := False;
  try
    SetInterval(15);

    vDadosIni.CreateProcessSimple(
      ExtractFilePath(Application.ExeName) +
      'hw.run.tasks.exe ' +
      'hw.comercio.aberto.consulta.periodica ' +
      '"'+ vDadosIni.vBancoHW + '" ' +
      vDadosIni.codEmpresa, False, True);

    if vDadosIni.GetIni('MD', 'MHTTCAL', 'N') = 'S' then //ModoHomologacaoTesteTimersLogComercioAbertoLog
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - CA - ' +
                      IntToStr(TimerComercioAbertoConsultaPeriodica.Interval) +
                      ' - Minutos: ' + IntToStr(Trunc(TimerComercioAbertoConsultaPeriodica.Interval / 60 / 1000) ) +
                      ' - Consulta Diaria Api');
  finally
    TimerComercioAbertoNotificacao.Enabled := True;
    TimerComercioAbertoConsultaPeriodica.Enabled := True;
  end;
end;

procedure TfrmPrincipalS.TimerComercioAbertoNotificacaoTimer(Sender: TObject);
var
  mensagem, titulo: string;
  warning: Boolean;
  notificacao: WideString;
  conf: Tconfig_sistema_class;

  procedure SetInterval(Min: Integer);
  begin
    if Min <= 0 then
      Min := 15
    else if Min > 60 then
      Min := 30;

    if vDadosIni.GetIni('MD', 'MHTTCA', 'N') = 'S' then
      TimerComercioAbertoNotificacao.Interval := 15000
    else                                      // 1min
      TimerComercioAbertoNotificacao.Interval := 60000 * Min;
  end;

begin
  if not vVerificarMensagens then
    Exit;

  if not vNotificarDocAberto then
    Exit;

  TimerComercioAbertoNotificacao.Enabled := False;
  titulo := '';
  mensagem := '';
  try

    if vDadosIni.GetIni('MD', 'MHTTCAL', 'N') = 'S' then //ModoHomologacaoTesteTimersComercioAbertoLog
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - CA - ' + IntToStr(TimerComercioAbertoNotificacao.Interval) + ' - Notificacao Inicio');

    hw_comercio_consultar_notificacoes(vDadosIni.vBancoHW, vDadosIni.cod_empresa, vDadosIni.vCodUsuario, notificacao);

    conf := TConfig_sistema_class.Create;
    conf.value1_b.Text := string(notificacao);
    titulo     := Trim(conf.ReadString( 'Notificacao', 'Titulo', ''));
    mensagem   := Trim(conf.ReadString( 'Notificacao', 'Mensagem', ''));

    if (mensagem <> '') and (vDadosIni.vTsPlus <> 'S') then
    begin
    	if vNotificarDocAberto then
      begin
        if not vDadosIni.ExistBallonTipFixed(vHandleMensagem) then
        begin
          vNotificarDocAberto      := False;
          vNotificarDocAberto_Fixa := False;
          Exit;
        end;

        if not FormularioShowModal then
        begin
          vNotificarDocAberto_Fixa := True;

          cbMensagens.Enabled := True;
          cbMensagens.Visible := True;

          cbMensagens.Top := 0;
    		  cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

          vTituloMensagem := titulo;
          vTextoMensagem  := mensagem;
          vIconMensagem   := 1;
          vTipoMensagem   := '';
          ShowHintBalloon;
        end;
      end;
//      TrayIconDocumentosAbertos.Visible      := True;
//      TrayIconDocumentosAbertos.BalloonTitle := titulo;
//      TrayIconDocumentosAbertos.BalloonFlags := bfInfo;
//      TrayIconDocumentosAbertos.BalloonHint  := Mensagem;
//      TrayIconDocumentosAbertos.ShowBalloonHint;
    end;

  finally
    SetInterval(15);
    TimerComercioAbertoNotificacao.Enabled := True;
    if vDadosIni.GetIni('MD', 'MHTTCAL', 'N') = 'S' then //ModoHomologacaoTesteTimersComercioAbertoLog
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' +
                      IntToStr(TimerComercioAbertoNotificacao.Interval) +
                      ' - Minutos: ' + IntToStr(Trunc(TimerComercioAbertoNotificacao.Interval / 60 / 1000) ) +
                      ' - Notificacao Fim');
  end;
end;

procedure TfrmPrincipalS.TimerNotificarBackupTimer(Sender: TObject);
begin
	if not vVerificarMensagens then
    Exit;

	if not vNotificarBackupBD then
    Exit;

//	TimerNotificarBackup.Enabled := False;
  try
   	if (vDadosIni.vVerificarBackup <> 'N') and (vDadosIni.vTsPlus <> 'S') and (trim(vDadosIni.vEmp.vCNPJ) <> '03530705000109') then
    	if vDadosIni.dataVerificacaoNotificacaoBackup(dtmEnt.qrBuscas, vVerificarBackupBD, vNotificarAposDias, vNotificarBackupBD, vDataUltimoBackupBD) then
    	begin
      	if vNotificarBackupBD then
        begin
          if not vDadosIni.ExistBallonTipFixed(vHandleMensagem) then
          begin
          	vNotificarBackupBD      := False;
            vNotificarBackupBD_Fixa := False;
            Exit;
          end;

          if not FormularioShowModal then
        	begin
            vNotificarBackupBD_Fixa := True;

            cbMensagens.Enabled := True;
            cbMensagens.Visible := True;

            cbMensagens.Top := 0;
    				cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

            vTituloMensagem := 'Backup não realizado há ' + IntToStr(Trunc(vDadosIni.getDataBanco(cQuery)) - Trunc(vDataUltimoBackupBD)) + ' dias ';
            vTextoMensagem  := 'Data último backup: ' + FormatDateTime('dd/mm/yyyy', vDataUltimoBackupBD);
            vIconMensagem   := 3;
            vTipoMensagem   := '';
            ShowHintBalloon;
          end;
        end;

        vDadosIni.CreateProcessSimple(
          ExtractFilePath(Application.ExeName) +
          'hw.run.tasks.exe ' +
          'hw.verificar.backup ' +
          '"' + vDadosIni.vBancoHW + '" ' +
          vDadosIni.codEmpresa + ' ' +
          '"' + vDadosIni.vNomeUsuario + '" ', False, True);

        if vDadosIni.GetIni('MD', 'MHTTL', 'N') = 'S' then //ModoHomologacaoTesteTimersLog
          Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' +
                          IntToStr(TimerNotificarBackup.Interval) +
                          ' - Minutos: ' + IntToStr(Trunc(TimerNotificarBackup.Interval / 60 / 1000) ) +
                          ' - Consulta Backup ');

        TimerNotificarBackup.Interval := (60 * 1000) + (Random(10) * 1000 * 60);
      end
      else if (vVerificarBackupBD <> 'N') then
      begin
      	if (Trunc(vDadosIni.vDataBanco) - Trunc(vDataUltimoBackupBD) < vNotificarAposDias)
          and (vDadosIni.vDataBanco > vDataUltimoBackupBD)
          and (Trunc(vDadosIni.vDataBanco) - Trunc(vDataUltimoBackupBD) >=
            IfThen(DayOfWeek(vDadosIni.vDataBanco) = 1, 4,
              IfThen(DayOfWeek(vDadosIni.vDataBanco) = 7, 3, 2))) then
        begin
        	if not FormularioShowModal then
        	begin
            cbMensagens.Enabled := True;
            cbMensagens.Visible := True;

            cbMensagens.Top := 0;
    				cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

            vTituloMensagem := 'Backup não realizado há ' + IntToStr(Trunc(vDadosIni.getDataBanco(cQuery)) - Trunc(vDataUltimoBackupBD)) + ' dias ';
            vTextoMensagem  := 'Data último backup: ' + FormatDateTime('dd/mm/yyyy', vDataUltimoBackupBD);
            vIconMensagem   := 2;
            vTipoMensagem   := '';
            ShowHintBalloon;
          end;

          if not Assigned(TimerMensagemBackup) then
            TimerMensagemBackup := TTimer.Create(Self);
          TimerMensagemBackup.Interval := 1000 * 60;
          TimerMensagemBackup.OnTimer := TimerMensagemBackupTimer;
          TimerMensagemBackup.Enabled := True;
        end;
      end;
  finally
//    TimerNotificarBackup.Enabled := True;
  end;
end;

procedure TfrmPrincipalS.TimerContasEmAbertoConsultaDiariaTimer(Sender: TObject);

  procedure SetInterval(Min: Integer);
  begin
    if Min <= 0 then
      Min := 59;
    if vDadosIni.GetIni('MD', 'MHTT', 'N') = 'S' then
      TimerContasEmAbertoConsultaDiaria.Interval := 15000
    else                        //1min  * min
      TimerContasEmAbertoConsultaDiaria.Interval := 60000 * Min;
  end;

begin
  TimerContasEmAbertoConsultaDiaria.Enabled := False;
  try
    SetInterval(30);

    vDadosIni.CreateProcessSimple(
      ExtractFilePath(Application.ExeName) +
      'hw.run.tasks.exe ' +
      'hw.integra.credito.em.aberto.consulta.diaria ' +
      '"'+ vDadosIni.vBancoHW + '" ' +
      StrReplace(vDadosIni.vEmp.vCodigoUnificadas, ['(', ')'], EmptyStr), False, True);

    if vDadosIni.GetIni('MD', 'MHTTL', 'N') = 'S' then //ModoHomologacaoTesteTimersLog
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' +
                      IntToStr(TimerContasEmAbertoConsultaDiaria.Interval) +
                      ' - Minutos: ' + IntToStr(Trunc(TimerContasEmAbertoConsultaDiaria.Interval / 60 / 1000) ) +
                      ' - Consulta Diaria Api');
  finally
    TimerContasEmAbertoNotificacao.Enabled := True;
    TimerContasEmAbertoConsultaDiaria.Enabled := True;
  end;
end;

procedure TfrmPrincipalS.TimerContasEmAbertoNotificacaoTimer(Sender: TObject);
var
  vencidos, abertos, hoje, recorrencia: Integer;
  mensagem: string;
  warning: Boolean;
  notificacao: WideString;
  conf: Tconfig_sistema_class;

  procedure SetInterval(Horas: Integer);
  begin
    if Horas <= 0 then
      Horas := 1;
    if vDadosIni.GetIni('MD', 'MHTT', 'N') = 'S' then
      TimerContasEmAbertoNotificacao.Interval := 15000
    else                        //1min  * 1h
      TimerContasEmAbertoNotificacao.Interval := 60000 * 60 * Horas;
  end;

begin
  if not vVerificarMensagens then
    Exit;

  if not vNotificarHw then
    Exit;

  TimerContasEmAbertoNotificacao.Enabled := False;
  vencidos := 0;
  abertos := 0;
  hoje := 0;
  try

    if vDadosIni.GetIni('MD', 'MHTTL', 'N') = 'S' then //ModoHomologacaoTesteTimersLog
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + IntToStr(TimerContasEmAbertoNotificacao.Interval) + ' - Notificacao Inicio');

    SetInterval(1);

    hw_integra_fin_documentos_em_aberto(vDadosIni.vBancoHW, vDadosIni.vEmp.UnificadasArray, vDadosIni.EmailColab,
      (ContasaPagar.Enabled and ContasaPagar.Visible), notificacao);

    conf := TConfig_sistema_class.Create;
    conf.value1_b.Text := string(notificacao);
    recorrencia := conf.ReadInteger('Notificacao', 'Recorrencia', 0);
    warning     := conf.ReadInteger('Notificacao', 'Warning', 0) = 1;
    mensagem    := Trim(conf.ReadString( 'Notificacao', 'Mensagem', ''));

    if not Assigned(MenuHwCreditosEmAberto) then
    begin
      if (recorrencia > 0) and (mensagem <> '') then
      begin
        MenuHwCreditosEmAberto := TMenuItem.Create(MainMenu1);
        MainMenu1.Items.Add(MenuHwCreditosEmAberto);
        MenuHwCreditosEmAberto.OnClick    := DocumentosEmAbertoClick;
        MenuHwCreditosEmAberto.ImageIndex := IfThen(warning, 0, 1);
        DocumentosEmAberto.ImageIndex    := MenuHwCreditosEmAberto.ImageIndex;
      end;
    end
    else
    begin
      if (recorrencia <= 0) and (mensagem = '') then
      begin
        MainMenu1.Items.Remove(MenuHwCreditosEmAberto);
        FreeAndNil(MenuHwCreditosEmAberto);
        DocumentosEmAberto.ImageIndex := -1;
//        TrayIconDocumentosAbertos.Visible := False;
      end
      else
      begin
        MenuHwCreditosEmAberto.ImageIndex := IfThen(warning, 0, 1);
        DocumentosEmAberto.ImageIndex    := MenuHwCreditosEmAberto.ImageIndex;
      end;
    end;

    if (recorrencia > 0) and (mensagem <> '') and (vDadosIni.vTsPlus <> 'S') then
    begin
    	if vNotificarHw then
      begin
        if not vDadosIni.ExistBallonTipFixed(vHandleMensagem) then
        begin
          vNotificarHw      := False;
          vNotificarHw_Fixa := False;
          Exit;
        end;

        if not FormularioShowModal then
        begin
        	vNotificarHw_Fixa := True;

          cbMensagens.Enabled := True;
          cbMensagens.Visible := True;

          cbMensagens.Top := 0;
    			cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

          vTituloMensagem := 'Notificações Hw Sistemas';
          vTextoMensagem  := mensagem;
          vIconMensagem   := vDadosIni.IfThen(vencidos > 0, 2, 1);
          vTipoMensagem   := '';
          ShowHintBalloon;

          vNotificarHw := False;
          vNotificarHw_Fixa := False;
        end;

//        TrayIconDocumentosAbertos.Visible        := True;
//        TrayIconDocumentosAbertos.BalloonTitle   := 'Notificações Hw Sistemas';
//        if vencidos > 0 then
//          TrayIconDocumentosAbertos.BalloonFlags := bfWarning
//        else
//          TrayIconDocumentosAbertos.BalloonFlags := bfInfo;
//        TrayIconDocumentosAbertos.BalloonHint    := mensagem;
//        TrayIconDocumentosAbertos.ShowBalloonHint;
      end;
    end;

  finally
    SetInterval(recorrencia);
    TimerContasEmAbertoNotificacao.Enabled := True;
    if vDadosIni.GetIni('MD', 'MHTTL', 'N') = 'S' then //ModoHomologacaoTesteTimersLog
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' +
                      IntToStr(TimerContasEmAbertoNotificacao.Interval) +
                      ' - Horas: ' + IntToStr(Trunc(TimerContasEmAbertoNotificacao.Interval / 60 / 60 / 1000) ) +
                      ' - Notificacao Fim');
  end;
end;

procedure TfrmPrincipalS.TimerMensagemBackupTimer(Sender: TObject);
begin
	if not vVerificarMensagens then
    Exit;

  try
    if ((vDadosIni.vCodUsuario > 0) and (vDadosIni.codEmpresa <> '')) then
    begin
			if (not vNotificarBackupBD_Fixa)
      	and (not vNotificarChavePeriodica_Fixa)
        and (not vNotificarDocAberto_Fixa)
        and (not vNotificarHw_Fixa) then
      begin
        cbMensagens.Enabled := False;
        cbMensagens.Visible := False;

        cbMensagens.Top := 0;
    		cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

        vTituloMensagem := '';
        vTextoMensagem  := '';
        vIconMensagem   := 0;
        vTipoMensagem   := '';

        HideHintBalloon;
      end;
    end;
  finally
    TimerMensagemBackup.Enabled := False;
  end;
end;

procedure TfrmPrincipalS.timerProcessamentosTimer(Sender: TObject);
begin
  try
    timerProcessamentos.Enabled := False;

    if vProcessamentos = nil then
    begin
      timerProcessamentos.Interval := vDadosIni.getConfSisInt('prcss_intervalo_em_segundos', cQuery) * 1000;
      vProcessamentos := TProcessamentosEmSegundoPlano.create;
    end;

    vProcessamentos.verificarProcessamentos;

  finally
    timerProcessamentos.Enabled := True;
  end;
end;

procedure TfrmPrincipalS.TimerServiceLessTimer(Sender: TObject);
begin
//  if Assigned(vProcessamentos) then
//    vProcessamentos.verificarServiceLessNFCe;
end;

procedure TfrmPrincipalS.TipodeClientesFornecedorClick(Sender: TObject);
var
  PClientes: TCadClientes;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    PClientes.CadTipoCliente(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CodigosdeAjusteConcCartaoClick(Sender: TObject);
var
  ConciliacaoCodAjuste: TConciliacaoCodAjuste;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    ConciliacaoCodAjuste._cadConciliacaoCodAjuste(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.TipodeReserva1Click(Sender: TObject);
var
  TipoReserva: TTipoReserva;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    TipoReserva._CadTipoReserva(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.TipodeVendaPerdidaClick(Sender: TObject);
var
  vTpVp: TTipoVendaPerdida;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdPedVenda = 0 then
      CarregaPacote('pkPedidoVenda', hdPedVenda);
    vTpVp.CadTipoVendaPerdida(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.TipoLancamentoConcCartaoClick(Sender: TObject);
var
  ConciliacaoTipoLanc: TConciliacaoTipoLanc;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    ConciliacaoTipoLanc._cadConciliacaoTipoLanc(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.GruposResumoFinanceiroClick(Sender: TObject);
var
  plContasRel: TPlanoContasRel;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdCadastrosBasicosCx = 0 then
      carregaPacote('pkCadastrosBasicosCx', hdCadastrosBasicosCx);
    plContasRel._cadPlanoContasRel(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Label1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil,
    PChar( vDadosIni.getConfSisStr('hw_url_servicos', cQuery) + '/Clientes/ClDownloads/Release_' + vDadosIni.vVersaoDocRelease + '.pdf'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmPrincipalS.LadoaLadoClick(Sender: TObject);
begin
  TileMode := TbVertical;
  Tile;
end;

procedure TfrmPrincipalS.LancamentosClick(Sender: TObject);
var
  lanc: TLancamentos;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdLancamentos = 0 then
      carregaPacote('pkLancamentos', hdLancamentos);
    lanc.cadLancamentos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.LancamentosFiscaisClick(Sender: TObject);
var
  vLancF: TLancamentosFiscais;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vLancF.cadLancamentosFiscais(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.LiberarAcessosClick(Sender: TObject);
var
  vLibAcesso: TLiberarAcesso;
begin
  try
    Screen.Cursor := crHourGlass;
    vLibAcesso.CadLiberacaoProcesso(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ListaDeAlteracaoDePrecoClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'ListaDeAlteracaoDePreco');
end;

procedure TfrmPrincipalS.LivrodeRegistrodeEntradaClick(Sender: TObject);
var
  vLivroReg: TLivroRegistroDeEntrada;
begin
  try
     if not vDadosIni.PesqPros('REL023', 'CONSULTA', '', '', '',
      cQuery, True) then
      Exit;

    Screen.Cursor := crHourGlass;
    if hdPedVenda = 0 then
      CarregaPacote('pkPedidoVenda', hdPedVenda);
    vLivroReg.cadLivroRegistroEntrada;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.LocalidadesClick(Sender: TObject);
var
  vLocalidade: TLocalidade;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdOrdemCarregamento = 0 then
      CarregaPacote('pkOrdemCarregamento', hdOrdemCarregamento);
    vLocalidade._cadLocalidade(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.RelatorioVeiculosemTransitoClick(
  Sender: TObject);
 var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioVeiculosemTransito');
end;

procedure TfrmPrincipalS.RelatorioVeiculosNegociados1Click(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioVeiculosNegociados');
end;

procedure TfrmPrincipalS.RelatorioVeiculosPagosAntecipados1Click(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioVeiculosPagosAntecipados');
end;

procedure TfrmPrincipalS.RelatorioVeiculosQueChegaramAntesDoPagamento1Click(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioVeiculosQueChegaramAntesDoPagamento');
end;

procedure TfrmPrincipalS.RelatrioRecebimentodeVeculos1Click(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioRecebimentodeVeiculos');
end;

procedure TfrmPrincipalS.ManutencaoClick(Sender: TObject);
var
  vManut: TManutencaoEquipamentos;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdEquipamentos = 0 then
      CarregaPacote('pkEquipamentos', hdEquipamentos);
    vManut.cadManutencaoEquipamentos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ManutencaodeInventario1Click(Sender: TObject);
var
  AshowForm: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    @AshowForm := GetProcAddress(vDadosIni.vProduto.AHandle, 'ShowManutencaoInventario');
    if Assigned(AshowForm) then
      AshowForm(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ManutencaoDoInventarioClick(Sender: TObject);
var
  vManuInv: TManutencaoInventarioBlocoH;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vManuInv.abreForm(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ManutencaoFDB1Click(Sender: TObject);
var
  reestrutura_manutencao: Treestrutura_manutencao;
begin
  hdReestrutura := 0;
  CarregaPacote('pkReestrutura', hdReestrutura);
  if hdReestrutura = 0 then
    Application.MessageBox('Pacote de reestruturação não carregado', 'Anteção', 0 + 64)
  else
  begin
    try
      try
        @reestrutura_manutencao := GetProcAddress(hdReestrutura, 'reestrutura_manutencao');
        if Assigned(reestrutura_manutencao) then
          reestrutura_manutencao(PChar(vDadosIni.vVersaoBpl));
      except
        Application.MessageBox('Pacote de reestruturação não executado', 'Anteção', 0 + 64)
      end;
    finally

    end;
  end;
end;

procedure TfrmPrincipalS.MapadeDespesasClick(Sender: TObject);
var
  lanc: TLancamentos;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdLancamentos = 0 then
      carregaPacote('pkLancamentos', hdLancamentos);
    lanc.cadLancamentos(2);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.MarcasdeProdutosClick(Sender: TObject);
var
  Marca: TMarcas;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    Marca.CadMarcas(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.MDFeClick(Sender: TObject);
var
  vMDFe: TMDFe;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    vMDFe:= TMDFe.create;
    vMDFe.cadMDFe(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.MenuEstoqueRelatoriosSituacaodosPedidosClick(Sender: TObject);
var
  vSitPedidos: uClassesPedVenda.TSituacaoDosPedidos;
begin
	if not vDadosIni.PesqPros('VND171', 'CONSULTA', '', 'PEDVENDA', '', cQuery, False) then
    Exit;

  vSitPedidos.abreSituacaoPedido;
end;

procedure TfrmPrincipalS.MenuHwNBackupLogClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CFG055', 'ABRIR', '', '', '', cQuery, False) then
    Exit;

  vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) +
        'hw.run.tasks.exe ' +
        'hw.nbackup ' +
        '"'+ vDadosIni.vBancoHW + '" -gui -log', False, False);
end;

procedure TfrmPrincipalS.MenusAutoClick(Sender: TObject);
var
  vMenu: TMenusAuto;
begin
  try
    Screen.Cursor := crHourGlass;
    if not MenusAuto.Enabled then
      Exit;
    vMenu := TMenusAuto.Create;
    vMenu.cadMenusAuto(1);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.MenusConfigurarDefaults;
begin
  Self.Menu := nil;
  try

    MenuCadastros.Enabled      := True;
    MenuCadastros.Visible      := True;
    MudarUsuario.Enabled       := True;
    MudarUsuario.Visible       := True;
    Sair.Enabled               := True;
    Sair.Visible               := True;
    MenuAtalhos.Enabled        := True;

    //Cadastro da Empresa e configuracao do Menu
    MenuConfiguracoes.Enabled  := True;
    MenuConfiguracoes.Visible  := True;
    DadosdaEmpresa.Enabled     := True;
    DadosdaEmpresa.Visible     := True;
    MenusAuto.Enabled          := True;
    MenusAuto.Visible          := True;
    ManutencaoFDB1.Enabled     := True;
    ManutencaoFDB1.Visible     := True;
    if vDadosIni.GetIni('MD', 'HFT','') = 'S' then //Habilitar funcionalidade teste
    begin
    NBackup1.Visible           := True;
    NBackup1.Enabled           := True;
    NBackupConfigurar1.Visible := True;
    NBackupConfigurar1.Enabled := True;
    NBackupExecutar.Visible    := True;
    NBackupExecutar.Enabled    := True;
    end;
    ConfiguracoesReplicacaoInterna.Visible := True;
    ConfiguracoesReplicacaoInterna.Enabled := True;

    //Ajuda
    MenuAjuda.Enabled          := True;
    MenuAjuda.Visible          := True;
    Sobre.Enabled              := True;
    Sobre.Visible              := True;
    Ajuda.Enabled              := True;
    Ajuda.Visible              := True;
    RegistrarSoftware.Enabled  := True;
    RegistrarSoftware.Visible  := True;
    SuporteRemoto.Enabled      := True;
    SuporteRemoto.Visible      := True;
    SuporteOnline.Enabled      := True;
    SuporteOnline.Visible      := True;
    NoticiasHW.Enabled         := True;
    NoticiasHW.Visible         := True;
    DocumentosEmAberto.Enabled := True;
    DocumentosEmAberto.Visible := True;

    VerDimensesdareaparaimagem1.Visible := True;
    VerDimensesdareaparaimagem1.Enabled := True;
    Definirplanodefundo11.Visible := True;
    Definirplanodefundo11.Enabled := True;
    DefinirPlanodeFundo21.Visible := True;
    DefinirPlanodeFundo21.Enabled := True;
    Alternarentrejanelas1.Visible := True;
    Alternarentrejanelas1.Enabled := True;
    Mensagem1.Visible := True;
    Mensagem1.Enabled := True;

    if Assigned(MenuHwCreditosEmAberto) then
    begin
      MenuHwCreditosEmAberto.Enabled := True;
      MenuHwCreditosEmAberto.Visible := True;
    end;

  finally
    Self.Menu := MainMenu1;
  end;
end;

procedure TfrmPrincipalS.MenusDesabilitarQuandoNFCeOffline;
begin
  NotaFiscalConsumidorSATFiscal.Visible := False;
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    Grupos.Visible := False;
    SubGrupos.Visible := False;
    CadastroDeVeiculos.Visible := False;
    Equipamentos.Visible := False;
    Manutencao.Visible := False;
    ArquivosFbricaImportacaoDeArquivos1.Visible := False;
    CadastrosDeKits.Visible := False;
    CadastrosDePerfilDeProdutos.Visible := False;
    ProdutosSimilares.Visible := False;
    IndiceTecnicoPAF.Visible := False;
    EstoqueDeEquipqmentosComNdeSerie.Visible := False;
    ModelosEtiquetasImpTrmicas1.Visible := False;
    CadastrodePromocao.Visible := False;
    PerfildeTributacaoAdicional.Visible := False;
    DesoneracaodeICMS.Visible := False;
    PerfilDeClientes.Visible := False;
    PossiveisClientes.Visible := False;
    TipodeClientesFornecedor.Visible := False;
    ContratosClientes.Visible := False;
    ContratosClientesGerados.Visible := False;
    FinalidadesNF1.Visible := False;

    CompradeProdutos.Visible := False;
    NotasFiscais.Visible := False;
    NotaFiscalSerieD.Visible := False;
    ConhecimentoDeTransporte.Visible := False;
    MDFe.Visible := False;
    VendaDeProdutos.Visible := False;
    OrcamentoEstoque.Visible := False;
    VendasPerdidas.Visible := False;
    ControledeAlmoxarifado.Visible := False;
    AlteracaoDePreco.Visible := False;
    BoletosBancarios.Visible := False;
    DevolucaoDeMercadorias.Visible := False;
    MenuEstoqueMovimentoEstouqeFechado1.Visible := False;
    ConfernciaCega.Visible := False;
    EmissaodeNotasdeAjustesdeEstoque1.Visible := False;
    SPED.Visible := False;
    MenuEstoqueProducao.Visible := False;
    MenuEstoqueMovimentoManutencaodeCargas.Visible := False;
    MenuEstoqueMovimentoMobile.Visible := False;
    Outros.Visible := False;
    RelatoriosEstoque.Visible := False;
    MenuOficina.Visible := False;
    
    MenuPAFECF.Visible := False;
    MenuECommerce.Visible := False;
    MenuComercioAberto.Visible := False;
    ProgramadeFidelidade.Visible := False;

    VendaDeProdutos.Visible := False;
    NotasFiscais.Visible := False;
    OrdemdeServico.Visible := False;
    OrcamentoEstoque.Visible := False;
  end;
end;

procedure TfrmPrincipalS.Menu_Rel(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.GravaAuditoria('OUT001', copy((Sender as TmenuItem).Hint,1,50), '', 'RELATORIOS','', cQuery);
    Screen.Cursor := crHourGlass;
    Application.CreateForm(TFrRelCrystal, FrRelCrystal);
    FrRelCrystal.Hint := vDadosIni.vPastaRel;
    FrRelCrystal.Caption := (Sender as TmenuItem).Hint;
    FrRelCrystal.tag := vDadosIni.vNivel;
    FrRelCrystal.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Menu_RelCX(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.GravaAuditoria('OUT001', copy((Sender as TmenuItem).Hint,1,50), '', 'RELATORIOS','', cQuery);
    Screen.Cursor := crHourGlass;
    Application.CreateForm(TFrRelCrystal, FrRelCrystal);
    FrRelCrystal.Hint := vDadosIni.vPastaRel+'\CX';
    FrRelCrystal.Caption := (Sender as TmenuItem).Hint;
    FrRelCrystal.tag := vDadosIni.vNivel;
    FrRelCrystal.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmPrincipalS.Menu_RelVeic(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.GravaAuditoria('OUT001', copy((Sender as TmenuItem).Hint,1,50), '', 'RELATORIOS','', cQuery);
    Screen.Cursor := crHourGlass;
    Application.CreateForm(TFrRelCrystal, FrRelCrystal);
    FrRelCrystal.Hint := vDadosIni.vPastaRel+'\Veic4';
    FrRelCrystal.Caption := (Sender as TmenuItem).Hint;
    FrRelCrystal.tag := vDadosIni.vNivel;
    FrRelCrystal.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.MetasComissao1Click(Sender: TObject);
var
  vPerfilComissao: TPerfilComissao;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vPerfilComissao._cadPerfilComissao(0);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPrincipalS.GestorMetasClick(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  try
    Screen.Cursor := crHourGlass;
    gestor := TGestorFormularios.Create;
    gestor.cadMetas(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ModelosdeCartas1Click(Sender: TObject);
var
  ModCarta: TModeloCartas;
begin
  try
    Screen.Cursor := crHourGlass;
  if vDadosIni.vCadBasicos.AHandle = 0 then
    CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
  ModCarta._cadModelosCarta(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ModelosdeVeiculosClick(Sender: TObject);
var
  ModVeiculo: TModVeiculo;
  ModVeiculoCCIA: TModVeiculoCCIA;
begin
  try
    Screen.Cursor := crHourGlass;

  if vDadosIni.vEmp.vVersaoVeiculos = '4' then
  begin
    if hdVeiculos = 0 then
       carregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);
     ModVeiculoCCIA.CadModVeiculos(0);
  end
  else
  begin
     if hdVeiculos = 0 then
      carregaPacote('pkVeiculos', hdVeiculos);
    ModVeiculo.CadModVeiculos(0);
  end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ModelosEtiquetasImpTrmicas1Click(Sender: TObject);
var
  ModelosEti: TModeloEtiTermica;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    ModelosEti._cadMoledosEtiTer(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ModoCascataClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmPrincipalS.MontarPedidosClick(Sender: TObject);
var
	vMontarPedido: TMontarPedido;
begin
	try
    Screen.Cursor := crHourGlass;
  if hdPedVenda = 0 then
    CarregaPacote('pkPedidoVenda', hdPedVenda);
  vMontarPedido.cadMontarPedido;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.MudarUsuarioClick(Sender: TObject);
var
  vMenu: TMenusAuto;
  vFazerLoginNovamente: Boolean;
//  contaAPagar: TContasAPagar;
begin
  try
    Screen.Cursor := crHourGlass;
    vVerificarMensagens := False;
    vDadosIni.abreStatusProcessamento('','Mudando Usuário');

    Timer1.Enabled := False;
    Timer3.Enabled := False;
    Timer4.Enabled := False;
    Timer5.Enabled := False;
    Timer6.Enabled := False;
    Timer7.Enabled := False;
    Timer8.Enabled := False;
//    Timer9.Enabled := False;
    timerProcessamentos.Enabled := False;
//    TimerServiceLess.Enabled := False;
    InicializarTimers;

    with vDadosIni do if GetIni('MD', 'SLA', 'N') = 'S' then //SALVAR LOGIN AUTOMATICAMENTE
      _GravaConfiguracoesString('LA', 'N');

    FechaJanelasMDI(0);

    MenusReset;

    dtmEnt.verificaEntrada;
    vDadosIni.abreStatusProcessamento('','Configurando menus');
    vDadosIni.setSistemasRregistrados(sistemasRegistrados(vDadosIni.vEmp.vCNPJ));
                     
    if not ChaveMensalValida() then
    begin
      //Application.Terminate;
      Exit;
    end
    else
    begin
      vMenu := TMenusAuto.Create;
      vMenu.configurarMenus(vDadosIni.vDpto);
      vMenu.Free;
      vMenu := nil;
    end;
    MenusConfigurarDefaults;

//    MudarUsuario.Enabled := true;
//    Sair.Enabled := true;
//    MenuAtalhos.Enabled := true;
    StatusBar1.Panels[1].Text := 'Usuário: ' + vDadosIni.vNomeUsuario;
    StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
    StatusBar1.Panels[4].Text := 'Endereço: ' + vDadosIni.vBancoHW;
    Caption := 'Hw Sac 4.0 - Hw Sistemas e Computadores - Empresa '+
    vdadosini.StrZero(strtoint(vDadosIni.codEmpresa),3)+'-'+vDadosIni.vEmp.vnomeEmpresa;
    if vDadosIni.vSistema = 'Automacao' then
      Application.Title := 'Hw Sac 4.0';
    if vDadosIni.vModoTreino = 'S' then
    begin
      Caption := Caption + ' - MODO TREINAMENTO ATIVADO - NF-e: ' + vDadosIni.vEmp.vNfe.webServiceAmbiente;
      Application.Title := Application.Title + ' Treinamento';
      ScrollBox1.Color := clMoneyGreen;
      Panel1.Color := clMoneyGreen;
    end;

    MenusDesabilitarQuandoNFCeOffline;
    CategoryButtonsConfigurar;

    {
    cbAutomacao.Visible := false;
    cbFinanceiro.Visible := false;
    //cbCaixa.Visible := false;
    cbPAFECF.Visible := false;
    cbVeiculo.Visible := false;
    cbCRM.Visible := false;
    cbGestor.Visible := false;
    //cbSupervisor.Visible := false;
    cbAutomacao.Visible := (vDadosIni.vRegistro.vSisAutomacao and
      vDadosIni.vSistemasUsuario.vSisAutomacao) and (true);
    cbFinanceiro.Visible := (vDadosIni.vRegistro.vSisCaixaGeral and
      vDadosIni.vSistemasUsuario.vSisCaixaGeral) and (true);
    //cbCaixa.Visible := (vDadosIni.vRegistro.vSisCaixaAuxiliar and
    //vDadosIni.vSistemasUsuario.vSisCaixaAuxiliar) and (true);
    cbPAFECF.Visible := (vDadosIni.vRegistro.vSisPAFECF and vDadosIni.vSistemasUsuario.vSisPAFECF)
      and
      (true);
    cbVeiculo.Visible := (vDadosIni.vRegistro.vSisVeiculos and
      vDadosIni.vSistemasUsuario.vSisVeiculos)
      and (true);
    cbCRM.Visible := (vDadosIni.vRegistro.vSisCRM and vDadosIni.vSistemasUsuario.vSisCRM) and
      (true);
    cbGestor.Visible := (vDadosIni.vRegistro.vSisGestor and vDadosIni.vSistemasUsuario.vSisGestor)
      and (true);
    //cbSupervisor.Visible := (vDadosIni.vRegistro.vSisSupervisor and
    //vDadosIni.vSistemasUsuario.vSisSupervisor) and (true);

    cbAutomacao.Enabled := cbAutomacao.Visible;
    cbFinanceiro.Enabled := cbFinanceiro.Visible;
    //cbCaixa.Enabled := cbCaixa.Visible;
    cbPAFECF.Enabled := cbPAFECF.Visible;
    cbVeiculo.Enabled := cbVeiculo.Visible;
    cbCRM.Enabled := cbCRM.Visible;
    cbGestor.Enabled := cbGestor.Visible;
    //cbSupervisor.Enabled := cbSupervisor.Visible;
    }


    {
    //Fazer Loggof e sair do sistema
    MenuCadastros.Enabled := True;
    MenuCadastros.Visible := True;
    MudarUsuario.Enabled := True;
    MudarUsuario.Visible := True;
    Sair.Enabled := True;
    Sair.Visible := True;

    //Cadastro da Empresa e configuracao do Menu
    MenuConfiguracoes.Enabled := True;
    MenuConfiguracoes.Visible := True;
    DadosdaEmpresa.Enabled := True;
    DadosdaEmpresa.Visible := True;
    MenusAuto.Enabled := True;
    MenusAuto.Visible := True;
    ManutencaoFDB1.Enabled := True;
    ManutencaoFDB1.Visible := True;

    //Ajuda
    MenuAjuda.Enabled := True;
    MenuAjuda.Visible := True;
    Sobre.Enabled := True;
    Sobre.Visible := True;
    Ajuda.Enabled := True;
    Ajuda.Visible := True;
    RegistrarSoftware.Enabled := True;
    RegistrarSoftware.Visible := True;
    SuporteRemoto.Enabled := True;
    SuporteRemoto.Visible := True;
    SuporteOnline.Enabled := True;
    SuporteOnline.Visible := True;
    NoticiasHW.Enabled := True;
    NoticiasHW.Visible := True;
    DocumentosEmAberto.Enabled := True;
    DocumentosEmAberto.Visible := True;
    if Assigned(MenuHwCreditosEmAberto) then
    begin
      MenuHwCreditosEmAberto.Enabled := True;
      MenuHwCreditosEmAberto.Visible := True;
    end;
    }

    vFazerLoginNovamente := False;
    if not sistemaRegistrado(vDadosIni.vEmp.vCNPJ, vDadosIni.vSistema) then
    begin
      vFazerLoginNovamente := True;
      vDadosIni.setSistemasRregistrados(sistemasRegistrados(vDadosIni.vEmp.vCNPJ));
      if not vDadosIni.vRegistro.vSisPAFECF then
      begin
        Application.Terminate;
        Exit;
      end;
    end;

    vDadosIni.setSistemasRregistrados(sistemasRegistrados(vDadosIni.vEmp.vCNPJ));
    //if vDadosIni.GetIni('MD', 'MFED', 'N') = 'S' then //MostrarFuncionalidadesEmDesenvolvimento
    vDadosIni.nfc_definirTokenEmissor;

    if not vDadosIni.vRegistro.vSisAutomacao then
      if (vDadosIni.vRegistro.vSisPAFECF) and (vDadosIni.vSistemasUsuario.vSisPAFECF) then
      begin
        // Entrar na configuracao do PAF
        MenuPAFECF.Enabled := True;
        MenuPAFECF.Visible := True;
        OperacoesFrenteLoja.Enabled := true;
        OperacoesFrenteLoja.Visible := true;
      end
      else
      begin
        Application.Terminate;
        Exit;
      end;

    vDadosIni.abreStatusProcessamento('','Validando uso do Software');

    if vFazerLoginNovamente then
      Application.MessageBox('O sistema requer um logoff para mostrar o menus', 'Atenção', 0 + 64);

  {  if not sistemaRegistrado(vDadosIni.vEmp.vCNPJ, vDadosIni.vSistema) then
    begin
//      for I := 0 to ComponentCount - 1 do
//        if Components[i] is TMenuItem then
//        begin
//          TMenuItem(Components[i]).Enabled := false;
//          TMenuItem(Components[i]).Visible := false;
//        end;
//      cbAutomacao.Enabled := false;

      // Caso nao tenha nenhum sistema registrado ativa os menus do paf
      if sistemaRegistrado(vDadosIni.vEmp.vCNPJ, 'PAF-ECF') then
      begin
        // Entrar na configuracao do PAF

        MenuPAFECF.Enabled := True;
        MenuPAFECF.Visible := True;
        OperacoesFrenteLoja.Enabled := true;
        OperacoesFrenteLoja.Visible := true;

      end
      else
      begin
        Application.Terminate;
      end;
    end; }

    vDadosIni.definirDiaFinanceiroFechado(cQuery);
    StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
    StatusBar1.Panels[3].Text := 'Dia Financeiro: ' + datetostr(vDadosIni.diaFFinanceiro);

    vMensagemFinancNaoFech := False;
    ContasAReceberVerNaEntrada;
    ContasAPagarVerNaEntrada;
    ClientesAniversariantesdoDia;
    {
    if (vDadosIni.vRegistro.vSisCaixaGeral) and (vDadosIni.vSistemasUsuario.vSisCaixaGeral) then
    begin
     if (vDadosIni.getDataBanco(cQuery) - (vDadosIni.diaFFinanceiro+1)) >= 1 then
        messagedlg('Dia do Financeiro: ' + datetostr(vDadosIni.diaFFinanceiro + 1) + ' não foi fechado', mtinformation, [mbOK], 0);
            if (Trim(vDadosIni.vverContas) = 'S') or (Trim(vDadosIni.vverContas) = 's') then
     if Application.MessageBox(pchar('Deseja visualizar as Contas a Pagar com vencimento até ' + datetostr(vDadosIni.getDataBanco(cQuery))), 'Confirmação', MB_YESNO + MB_DEFBUTTON2) = mrYES then
     begin
      try
        Screen.Cursor := crHourGlass;
        if vDadosIni.vCtp.AHandle = 0 then
          carregaPacote('pkContasAPagar', vDadosIni.vCtp.AHandle);
        contaAPagar.cadContasAPagar(2);
      finally
        Screen.Cursor := crDefault;
      end;
     end;
    end;
    }

    {
    VerDimensesdareaparaimagem1.Visible := True;
    VerDimensesdareaparaimagem1.Enabled := True;
    Definirplanodefundo11.Visible := True;
    Definirplanodefundo11.Enabled := True;
    DefinirPlanodeFundo21.Visible := True;
    DefinirPlanodeFundo21.Enabled := True;
    }
    _carregarImagemFundo;

    MenusDesabilitarQuandoNFCeOffline;
    CategoryButtonsConfigurar;

    if _exiteNews(pchar(vDadosIni.vNomeUsuario), pchar(vDadosIni.vBancoHW)) then
      if vDadosIni.vAbrirNews <> 'N' then
        NoticiasHW.Click
      else
      begin
        if FileExists(ExtractFilePath(Application.ExeName) + 'nws.exe') then
          vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'nws.exe ' + vDadosIni.vNomeUsuario + ' ' + vDadosIni.vBancoHW)
        else
          ShellExecute(Handle, 'open', PChar(vDadosIni.getConfSisStr('hw_url_servicos', cQuery) + '/newshw.aspx'), nil, nil, SW_SHOWNORMAL);
      end;

    if vDadosIni.vCodUsuario > 0 then
      with vDadosIni.getConfSisList(cQuery,
        ['comercio_aberto_hab', 'comercio_aberto_receber_notificacao']) do
        if GetConf('comercio_aberto_hab').AsBoolean then
          with GetConf('comercio_aberto_receber_notificacao') do
          begin
            value1_vc := ',' + StrReplace(value1_vc, ['|', ';', '-', ' '], ',') + ',';
            TimerComercioAbertoConsultaPeriodica.Enabled := Pos(',' + IntToStr(vDadosIni.vCodUsuario) + ',', value1_vc) > 0;
          end;


    vVerificarMensagens := True;

  finally
    Timer1.Enabled := True;
    Timer3.Enabled := True;
    Timer4.Enabled := True;
    Timer5.Enabled := True;
    Timer6.Enabled := True;
    Timer7.Enabled := True;
    Timer8.Enabled := (vDadosIni.vCodPerfilHorasTrab > 0) and (not vDadosIni.vLoginPosHorarioTrab);
//    Timer9.Enabled := (trim(vDadosIni.retornaDadosHwCloudIA(dtmEnt.qrBuscas, False)) <> '') and (vDadosIni.vHwCloudIA.vUsarServMensageria = 'S');
    timerProcessamentos.Enabled := True;
//    TimerServiceLess.Enabled := True;
  	TimerNotificarBackup.Enabled := True;
    if (not vDadosIni.vEmp.vFinanceiroUnificado) or (vDadosIni.vEmp.vCodigoUnificadora = vDadosIni.cod_empresa)  then
      TimerContasEmAbertoConsultaDiaria.Enabled := True;
    Screen.Cursor := crDefault;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmPrincipalS.MVAAjustadaClick(Sender: TObject);
var
  vMva: TMvaAjustada;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdMva = 0 then
      CarregaPacote('pkMvaAjustada', hdMva);
    vMva.CadMvaAjustada(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NaturezaDeOperacaoClick(Sender: TObject);
var
  obNatOp: TNaturezaOperacao;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    obNatOp.cadNatOperacao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NBackupConfigurar1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CFG054', 'ABRIR', '', '', '', cQuery, False) then
    Exit;
  hw_config_sistema_empzero('hw_nbackup', PChar(vDadosIni.vNomeUsuario), vDadosIni.cod_empresa, vDadosIni.vNivel);
end;

procedure TfrmPrincipalS.NBackupExecutarClick(Sender: TObject);
var
  str: string;
begin                
  if not vDadosIni.PesqPros('CFG055', 'ABRIR', '', '', '', cQuery, False) then
    Exit;

  str := '-gui';
  if not InputQuery('Excetutar comandos NBackup', 'Comandos adicionais para o NBackup', str) then
    Exit;

  str := IfThen(Trim(str) <> '', ' ' + str);

  vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) +
        'hw.run.tasks.exe ' +
        'hw.nbackup ' +
        '"'+ vDadosIni.vBancoHW + '" ' + str, False, False);
end;

procedure TfrmPrincipalS.NBSClick(Sender: TObject);
var
  Nbs: TNBS;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Nbs._cadNBS(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NCMSHClick(Sender: TObject);
var
  Produto: TProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Produto.CadNbm(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NFSeDPS1Click(Sender: TObject);
var
  ShowModelExecute: TShowForm;
begin
  @ShowModelExecute := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowDPS');
  if Assigned(ShowModelExecute) then
    ShowModelExecute( False );
end;

procedure TfrmPrincipalS.NiveldeEndividamentoClick(Sender: TObject);
var
  credito: TContasAReceber;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdContasAReceber = 0 then
      carregaPacote('pkContasAReceber', hdContasAReceber);
    credito.cadContasAReceber(2, 'S2');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NotaFiscalConfiguracaoClick(Sender: TObject);
var
  vConfigNf: TCabecalhonf;
begin
  try
    Screen.Cursor := crHourGlass;
    vConfigNf.CadCabecalhonf(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NotaFiscalConsumidorEmissorClick(Sender: TObject);
begin
  vDadosIni.nfc_abreFormNFConsumidor('nfc_abreformEmissor', 0);
end;

procedure TfrmPrincipalS.NotaFiscalConsumidorNFCeClick(Sender: TObject);
begin
  vDadosIni.nfc_abreFormNFConsumidor('nfc_abreformNFCe', 0);
end;

procedure TfrmPrincipalS.NotaFiscalConsumidorSATFiscalClick(Sender: TObject);
begin
  vDadosIni.nfc_abreFormNFConsumidor('nfc_abreformNFCSat', 0);
end;

procedure TfrmPrincipalS.NotasEmitidasPorPeriodoClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'NotasEmitidasPorPeriodo');
end;

procedure TfrmPrincipalS.NotasFiscaisClick(Sender: TObject);
var
  vNf: TNfCab;
begin
  try
    Screen.Cursor := crHourGlass;
    if not ChaveMensalValida() then
      exit;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    vNf.CadNF(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NotasFiscaisemTransito1Click(Sender: TObject);
var
  vNFTransito : TNFTransito;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdVeiculosCCIA = 0 then
     CarregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);

     vNFTransito._NFTransito(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NotasfiscaisSuzukiClick(Sender: TObject);
var
  vNfInteg: TNFInteg;
begin
  try
    Screen.Cursor := crHourGlass;
    if not ChaveMensalValida() then
      exit;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    vNfInteg.cadNFInteg(0);
  finally
    Screen.Cursor := crDefault;
  end;
	//
end;

procedure TfrmPrincipalS.NotasFiscal12Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  try
    Screen.Cursor := crHourGlass;
    if not ChaveMensalValida() then
      exit;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    vNf.CadNF(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NoticiasHWClick(Sender: TObject);
begin
  if vDadosIni.vAbrirNews = 'N' then
  begin
    if FileExists(ExtractFilePath(Application.ExeName) + 'nws.exe') then
      vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'nws.exe ' + vDadosIni.vNomeUsuario + ' ' + vDadosIni.vBancoHW)
    else
      ShellExecute(Handle, 'open', PChar(vDadosIni.getConfSisStr('hw_url_servicos', cQuery) + '/newshw.aspx'), nil, nil, SW_SHOWNORMAL);
  end
  else
  begin
    Application.CreateForm(TfrmNews, frmNews);
    frmNews.ShowModal;
  end;
end;

procedure TfrmPrincipalS.NotificacoesEnviadasClick(Sender: TObject);
var
  notenvfinanc: TNotEnvFinanc;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdContasAReceber = 0 then
      carregaPacote('pkContasAReceber', hdContasAReceber);
    notenvfinanc._abrirNotEnvFinanc(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.NotaFiscalSerieDClick(Sender: TObject);
var
  obNfSerieD: TNfSerieD;
begin
  try
    Screen.Cursor := crHourGlass;
    obNfSerieD := TNFSeried.create;
    obNfSerieD.CadNfSerieD;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ObrigacoesIcmsRecolhidoRecolherDIFALClick(Sender: TObject);
var
  vDifal: TIcmsInterDifalObrigacoesDifal;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vDifal.abreForm(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.OcorrenciaAdministradoraClick(Sender: TObject);
var
  vOcorrencias: TOcorrenciaAdm;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdCadastrosBasicosCx = 0 then
    CarregaPacote('pkCadastrosBasicosCx', hdCadastrosBasicosCx);
  vOcorrencias._cadOcorrenciaAdm(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Opcionais1Click(Sender: TObject);
var
  vOpcionais: TOpcionais;
begin
  try
    Screen.Cursor := crHourGlass;
  if vDadosIni.vCadBasicos.AHandle = 0 then
    CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
  vOpcionais._CadOpcionais(0);
  finally
         Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.OperacaoFiscalClick(Sender: TObject);
var
  AshowForm: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);

    @AshowForm := GetProcAddress(vDadosIni.vCadBasicos.AHandle, 'operacaofiscal_show');
    if Assigned(AshowForm) then
      AshowForm(False);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.OperacoesFrenteLojaClick(Sender: TObject);
//var
//  vTerminal: TTerminaisF;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);

    ShowMessage('Módulo desativado');
//    if HdTerminaisF = 0 then
//      CarregaPacote('pkterminaisF', HdTerminaisF);
    //vTerminal.cadTerminalF(0);
//    if dtmTerminaisF = nil then
//      dtmTerminaisF := TdtmTerminaisF.Create(dtmTerminaisF);
//    if FrmTerminalF = nil then
//      Application.CreateForm(TFrmTerminalF, FrmTerminalF);
//    FrmTerminalF.Show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.OrcamentoEstoqueClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not ChaveMensalValida() then
      exit;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    vDadosIni.vtpVenda := 'ORC';
    TPedVenda.cadPedVenda(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.OrcamentoOficinaClick(Sender: TObject);
begin
 OrcamentoEstoqueClick(Sender);
end;

procedure TfrmPrincipalS.PedidodeProducaoClick(Sender: TObject);
var
  vProducao: TProducao;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdProducao = 0 then
      CarregaPacote('pkProducao', hdProducao);
    vProducao._CadProducao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.OrdemdeCarregamentoClick(Sender: TObject);
var
  vOrdemCarregamento: TOrdemCarregamento;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdOrdemCarregamento = 0 then
      CarregaPacote('pkOrdemCarregamento', hdOrdemCarregamento);
    vOrdemCarregamento._cadOrdemCarregamento(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.OrdemdeServicoClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not ChaveMensalValida() then
      exit;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    vDadosIni.vtpVenda := 'OS';
//    TPedVenda.verificaFiscalAtivo;
    TPedVenda.cadPedVenda(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.OrdensDeServicosEmitidasPorPeriodoClick(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'OrdensDeServicosEmitidasPorPeriodo');
end;

procedure TfrmPrincipalS.OutrosRecibosEstoqueClick(Sender: TObject);
var
  vRecS: TReciboSimples;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdRecibo = 0 then
      CarregaPacote('pkRecibo', hdRecibo);
    vRecS.CadReciboSimples(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.GestorPaineldeControleClick(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  try
    Screen.Cursor := crHourGlass;
    gestor := TGestorFormularios.Create;
    gestor.cadPainelControle(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PagamentosPDVsClick(Sender: TObject);
var
  vImportPdv: TFechamentoPDV;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);
    vImportPdv._abreTelaInicial;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PagamentosRetaguardaClick(Sender: TObject);
var
  vImpAuto: TImportacaoAutomacao;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);
    vImpAuto.abreImpAuto;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ParametrosdeSistemaClick(Sender: TObject);
var
  vConfigIni: TConfigIni;
begin
  vConfigIni:=TConfigIni.create;
  vConfigIni.cadConfigIni(0);
end;

procedure TfrmPrincipalS.ParametrosdeSistemaGlobalClick(Sender: TObject);
begin
  vDadosIni.configurarSistema('', cQuery);
end;

procedure TfrmPrincipalS.ParticipantesClick(Sender: TObject);
var
  Participante: TParticipante;
begin
  try
    Screen.Cursor := crHourGlass;
    Participante.CadParticipante(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PedidoClick(Sender: TObject);
var
  vPedidoCompra: TPedidoCompra;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdSugestaoCompra = 0 then
      CarregaPacote('pkSugestaoCompras', hdSugestaoCompra);
    vPedidoCompra.CadPedidoCompra(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PedidoCompraClienteNFe1Click(Sender: TObject);
var
  CadPedidoCompraCl: TCadPedidoCompraCl;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    CadPedidoCompraCl._cadPedidoCompraCl(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ComissaoFaixaDescontoClick(Sender: TObject);
var
  vComissaoFaixaDesc: TComissaoFaixaDesc;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vComissaoFaixaDesc._cadComissaoFaixaDesc(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PerfilDeClientesClick(Sender: TObject);
var
  vPerfilCli: TPerfil;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vPerfilCli.CadPerfil(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PerfildeTributacaoAdicionalClick(Sender: TObject);
var
  vPerfConv: TProdutosPerfilTribAdicional;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    vPerfConv._cadPerfilTribAdicional(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PlanoDeContasClick(Sender: TObject);
var
  plContas: TPlanoContas;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdCadastrosBasicosCx = 0 then
      carregaPacote('pkCadastrosBasicosCx', hdCadastrosBasicosCx);
    plContas.cadPlanoContas(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PlanodeContasContabilClick(Sender: TObject);
var
  vPlContC: TPlanoContasContabil;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vPlContC.CadPlanoContasC(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.PossiveisClientesClick(Sender: TObject);
var
  PClientes: TCadClientes;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    PClientes.PossiveisCadClientes(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.CRMPosVendaClick(Sender: TObject);
//posvenda
var
  vTemp: string;
  i: integer;
begin
  vTemp := 'Modulo de Pos-Venda';
  if FindWindow('', pchar(vTemp)) > 0 then
    SetForegroundWindow(FindWindow('', pchar(vTemp)))
  else
  begin
    vTemp := ExtractFileDir(application.ExeName);
    for i := length(vtemp) downto 1 do
    begin
      if vTemp[i] = '\' then
      begin
        vTemp := copy(vTemp, 1, i) + '\PosVenda\PosVenda.exe';
        Break;
      end;
    end;
    vTemp := StringReplace(vTemp, '\\', '\', [rfReplaceAll]);
    CreateProcessSimple(vTemp + ' ' + vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' ' +
      vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) + ' ' + vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pAutomacao');
  end;
end;

procedure TfrmPrincipalS.ProcessarArquivoHondaClick(Sender: TObject);
var
// cadintegraFab: TIntegraFab;
  hdTemp: THandle;
  formulario: TForm;
begin
    vDadosIni.vPesquisa := 'PROCESSARARQUIVOFABRICA|';
    formulario := Funcoes.AbreForm('pkFabrica', 'TFrmFabrica', hdTemp);

  try
    formulario.Show;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TfrmPrincipalS.ProcessoAdministrativoClick(Sender: TObject);
var
  vProAdm: TProcessoAdministrativoSPED;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vSped.AHandle = 0 then
      CarregaPacote('pkSPED', vDadosIni.vSped.AHandle);
    vProAdm.cadProcessoAdmSPED(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ProdutosComPendenciasEmOSREQClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'ProdutosComPendenciasEmOSREQ');
end;

procedure TfrmPrincipalS.ProdutosComPrejuizoemVendasClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'ProdutosComPrejuizoemVendas');
end;

procedure TfrmPrincipalS.ProdutosEnvComercioAbertoClick(Sender: TObject);
var
  ProdutosEC_CA: TProdutosEC_CA;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    ProdutosEC_CA._cadProdutosEC_CA(0, 'C');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ProdutosEnvECommerceClick(Sender: TObject);
var
  ProdutosEC_CA: TProdutosEC_CA;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    ProdutosEC_CA._cadProdutosEC_CA(0, 'E');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ProdutosSimilaresClick(Sender: TObject);
var
  PSimilar: TProdSimilares;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    PSimilar.CadProdSimilar(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ProdutosValidadeClick(Sender: TObject);
var
  PRastro: TProdutosRastro;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    PRastro._cadProdutosRastro(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.QuitarBoletosArquivodeRetornoClick(Sender: TObject);
var
  vImportRetorno: TRetorno;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);
    vImportRetorno._AbreFormRetorno;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.QuitarCrditosconciliaoCarto1Click(Sender: TObject);
var
  vimportconccartao: Tconciliacartao;
  vimportconccartaoConfere: TconciliacartaoConfere;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdContasAReceber = 0 then
      carregaPacote('pkContasAReceber', hdContasAReceber);
    if (vDadosIni.vConcCartao.vVersaoConcCartao <> '1') or (vDadosIni.vConcCartao.vHabilitarConcCartaoAPI) then
    	vimportconccartaoConfere._AbreFormRetorno(0)
    else
	    vimportconccartao._AbreFormRetorno;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.TransDevolucaodeProdutosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not ChaveMensalValida() then
      exit;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    vDadosIni.vtpVenda := 'OS';
    TPedVenda.cadTransfDesvol;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.TransportadorClick(Sender: TObject);
var
  obTransport: TTransportador;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    obTransport.CadTransportador(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.TrayIconEnvNotFinancDblClick(Sender: TObject);
var
  vMensMobile: TMensMobile;
begin
  try
    if vDadosIni.vQuantMensFinanc <= 0 then
   	  exit;

    Screen.Cursor := crHourGlass;
    if hdMensMobile = 0 then
      CarregaPacote('pkMobile', hdMensMobile);
    vMensMobile._cadVerMensMobile(0, 'F');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.TrayIconLicencaDblClick(Sender: TObject);
begin
//  try
//  	Screen.Cursor := crHourGlass;
//    TrayIconLicenca.Animate := false;
//    TrayIconLicenca.Visible:= false;
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmPrincipalS.TrayIconMensEcommerceDblClick(Sender: TObject);
//var
//  vMensMobile: TMensMobile;
begin
//  try
//    if vDadosIni.vQuantMensEC <= 0 then
//	    exit;
//
//    Screen.Cursor := crHourGlass;
//    if hdMensMobile = 0 then
//      CarregaPacote('pkMobile', hdMensMobile);
//    vMensMobile._cadVerMensMobile(0, 'E');
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmPrincipalS.TrayIconMensMobDblClick(Sender: TObject);
//var
//  vMensMobile: TMensMobile;
begin
//  try
//    if vDadosIni.vQuantMensMob <= 0 then
//      exit;
//
//    Screen.Cursor := crHourGlass;
//    if hdMensMobile = 0 then
//      CarregaPacote('pkMobile', hdMensMobile);
//    vMensMobile._cadVerMensMobile(0, 'M');
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmPrincipalS.TrayIconPagOnlineDblClick(Sender: TObject);
//var
//  vMensMobile: TMensMobile;
begin
//  try
//    if vDadosIni.vQuantMensFinanc <= 0 then
//   	  exit;
//
//    Screen.Cursor := crHourGlass;
//    if hdMensMobile = 0 then
//      CarregaPacote('pkMobile', hdMensMobile);
//    vMensMobile._cadVerMensMobile(0, 'P');
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmPrincipalS.UsarPlanilhaParaInserirAlterar(
  ParamsAdicionais: string);
type
  TPlanilhasImport = procedure (ParamsString: WideString); stdcall;
var
  sdkdll: Cardinal;
  PlanilhasImport: TPlanilhasImport;
  sParam: WideString;
begin
//  if Trim(ParamsString) = '' then
//    raise Exception.Create('ParamsString empty');

//  sParam := ParamsString;

  sdkdll := 0;
  sdkdll := LoadLibrary('lib.hwsdk.dll');
  if sdkdll = 0 then
  begin
    Application.MessageBox('Não foi possível carregar o módulo HWSDK', 'Atenção');
    Exit;
  end;

  try

    sParam := Format('CodEmpresa=%d;Usuario=%s;NivelAcesso=%d',
          [vDadosIni.cod_empresa, vDadosIni.vNomeUsuario, vDadosIni.vNivel ]);
    if Trim(ParamsAdicionais) <> '' then
    begin
      if not StartsStr(';', Trim(ParamsAdicionais)) then
        ParamsAdicionais := ';' + Trim(ParamsAdicionais);

      sParam := sParam + ParamsAdicionais;
    end;

    try
      @PlanilhasImport := GetProcAddress(sdkdll, 'PlanilhasImport');

      if Assigned(PlanilhasImport) then
        PlanilhasImport(sParam);

    finally
      FreeLibrary(sdkdll)
    end;

  except on E: Exception do
    begin
      ShowErro('Falha ao executar importação de arquivo');
    end;
  end;
end;

procedure TfrmPrincipalS.ReciboClick(Sender: TObject);
var
  vRecibo: TRecibo;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdRecibo = 0 then
      CarregaPacote('pkRecibo', hdRecibo);
    vRecibo.CadRecibo(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ReciboEstoqueClick(Sender: TObject);
var
  vRecibo: TRecibo;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdRecibo = 0 then
      CarregaPacote('pkRecibo', hdRecibo);
    vRecibo.CadRecibo(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.RecibosEmitidosClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RecibosEmitidos');
end;

procedure TfrmPrincipalS.ReciboVeiculosCCIA1Click(Sender: TObject);
//var
//   vVeiculosCCIA: tVeiculosCCIA;
begin
//  try
//   if(hdVeiculosCCIA = 0) then
//   CarregaPacote('pkVeiculosCCIA',hdVeiculosCCIA);
//   vVeiculosCCIA._ReciboVeiculos(0);
//    finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmPrincipalS.RegistrarSoftwareClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    registrarNovoSoftware(vDadosIni.vEmp.vCNPJ);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.RegrasSugestaoServicoClick(Sender: TObject);
var
  vRegrasSugServ:TRegrasSugServ;
begin
   try
     Screen.Cursor := crHourGlass;
     if vDadosIni.vCadBasicos.AHandle = 0 then
	   	CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
     vRegrasSugServ._cadRegrasSugServ(0);
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmPrincipalS.RegrasTravaReqOSEstFechClick(Sender: TObject);
var
  vCadRegrasTravReqOS:TCadRegrasTravReqOS;
begin
   try
     Screen.Cursor := crHourGlass;
     if vDadosIni.vCadBasicos.AHandle = 0 then
        CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
      vCadRegrasTravReqOS._cadCadRegrasTravReqOS(0);
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmPrincipalS.RegrasValeResgateTrocaProgramadefidelidadeClick(
  Sender: TObject);
var
  vRegrasValeTrocaProgFid: TRegrasValeTrocaProgFid;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vRegrasValeTrocaProgFid.cadRegrasValeTrocaProgFid(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.RegrasdeVendasClick(Sender: TObject);
var
  vRegrasVND:TRegrasVendas;
begin
   try
     Screen.Cursor := crHourGlass;
     if vDadosIni.vCadBasicos.AHandle = 0 then
        CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
      vRegrasVND._cadRegrasVendas(0);
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmPrincipalS.RelatorioAcompanhamentodeVeiculosClick(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioAcompanhamentodeVeiculos');
end;

procedure TfrmPrincipalS.RelatorioApuracaodeICMSClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatoriodeApuracaoICMS');
end;

procedure TfrmPrincipalS.RelatorioComissaoPorVendaClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioComissaoPorVenda');
end;

procedure TfrmPrincipalS.RelatoriodeClientesVencidosClick(Sender: TObject);
var
  credito: TContasAReceber;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdImportFinan = 0 then
      CarregaPacote('pkImportFinanceiro', hdImportFinan);

    if hdContasAReceber = 0 then
      carregaPacote('pkContasAReceber', hdContasAReceber);
    credito.cadContasAReceber(1, 'S2');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.RelatorioDespesasdeVeiculosClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioDespesasdeVeiculos');
end;

procedure TfrmPrincipalS.RelatoriodeVendasObjetoClienteClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatoriodeVendasObjetoCliente');
end;

procedure TfrmPrincipalS.RelatorioDiarioDiretoria1Click(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioDiarioDiretoria');
end;

procedure TfrmPrincipalS.RelatorioDocumentosRecebidoscomValeResgateProgFidClick(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatoriosVendasProgFid');
end;

procedure TfrmPrincipalS.RelatorioExtratoContaCorrenteProgFidClick(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatoriosExtratoContaCorrenteProgFid');
end;

procedure TfrmPrincipalS.RelatorioFaturamentodeVeiculos1Click(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioFaturamentodeVeiculos');
end;

procedure TfrmPrincipalS.RelatorioparaGerenciaVeiculos1Click(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioparaGerenciaVeiculos');
end;

procedure TfrmPrincipalS.RelatorioPendenciasdeVeiculosClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioPendenciasdeVeiculos');
end;

procedure TfrmPrincipalS.RelatorioPosicaodeEstoqueVeiculos1Click(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioPosicaoEstoquedeVeiculos');
end;

procedure TfrmPrincipalS.RelatorioSituacaodoEstoqueFechadoClick(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioSituacaodoEstoqueFechado');
end;

procedure TfrmPrincipalS.RelatorioTabeladePrecosVeiculosClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioTabeladePrecosVeiculos');
end;

procedure TfrmPrincipalS.RelatorioTitulosPorRotaClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioTitulosPorRota');
end;

procedure TfrmPrincipalS.RelatoriosdeVendasPlacaClienteClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatoriosdeVendasPlacaCliente');
end;

procedure TfrmPrincipalS.RelatorioVeiculosemDemonstracao1Click(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RelatorioVeiculosemDemonstracoes');
end;

procedure TfrmPrincipalS.RequisicoesEmitidasPorPeriodoClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RequisicoesEmitidasPorPeriodo');
end;

procedure TfrmPrincipalS.RequisicoesOrdensdeServicosEmitidasPorPeriodoClick(
  Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(1,'RequisicoesOrdensDeServicosEmitidasPorPeriodo');
end;

procedure TfrmPrincipalS.ReservasVencendo1Click(Sender: TObject);
var
  vReservaEstMoto : TReservaEstMotoCCIA;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdVeiculosCCIA = 0 then
     CarregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);

   vReservaEstMoto.abreFormReserva(2);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ReservasVencidas1Click(Sender: TObject);
var
  vReservaEstMoto : TReservaEstMotoCCIA;
begin
  try
    Screen.Cursor := crHourGlass;
  if hdVeiculosCCIA = 0 then
     CarregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);

   vReservaEstMoto.abreFormReserva(1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.MenusReset;
var
  I: Integer;
begin
  Self.Menu := nil;
  try

    for I := 0 to Self.ComponentCount - 1 do
      if Self.Components[i] is TMenuItem then
      begin
        TMenuItem(Self.Components[i]).Visible := False;
        TMenuItem(Self.Components[i]).Enabled := False;
      end;

  finally
    Self.Menu := MainMenu1;
  end;
end;

procedure TfrmPrincipalS.ResumoClick(Sender: TObject);
var
  relatorio:trelatorios;
begin
   if hdRelatorios = 0 then
      CarregaPacote('PkRelatorios', hdRelatorios);
    relatorio.CadRelatorio(0,'Resumo');
end;

procedure TfrmPrincipalS.RotasdeentregaClick(Sender: TObject);
var
  AshowForm: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCliente.AHandle = 0 then
      CarregaPacote('pkClientes', vDadosIni.vCliente.AHandle);
    @AshowForm := GetProcAddress(vDadosIni.vCliente.AHandle, 'cadRotas');
    if Assigned(AshowForm) then
      AshowForm(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.RTC_AjustesReduoBenefcioPISCOFINSLC22420251Click(Sender: TObject);
var
  ShowModelExecute: TShowForm;
begin
  @ShowModelExecute := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowAjustesRedBenefPC');
  if Assigned(ShowModelExecute) then
    ShowModelExecute( False );
end;

procedure TfrmPrincipalS.RTC_CentraldeInformacoesFiscais1Click(Sender: TObject);
var
  ShowModelExecute: TShowForm;
begin
  @ShowModelExecute := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowCentralDeDadosFiscais');
  if Assigned(ShowModelExecute) then
    ShowModelExecute( False );
end;

procedure TfrmPrincipalS.RTC_GruposFiscais1Click(Sender: TObject);
var
  ShowModelExecute: TShowForm;
begin
  @ShowModelExecute := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowGruposFiscais');
  if Assigned(ShowModelExecute) then
    ShowModelExecute( False );
end;

procedure TfrmPrincipalS.RTC_OperaccoesInternas1Click(Sender: TObject);
var
  ShowModelExecute: TShowForm;
begin
  @ShowModelExecute := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowOperacoesInternas');
  if Assigned(ShowModelExecute) then
    ShowModelExecute( False );
end;

procedure TfrmPrincipalS.RTC_OperacoesFiscaisdoIBSeCBS1Click(Sender: TObject);
var
  ShowModelExecute: TShowForm;
begin
  @ShowModelExecute := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowOperacoesFiscaisIbsCbs');
  if Assigned(ShowModelExecute) then
    ShowModelExecute( False );
end;

procedure TfrmPrincipalS.RTC_RegrasFiscaisdoIBSeCBS1Click(Sender: TObject);
var
  ShowModelExecute: TShowForm;
begin
  @ShowModelExecute := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowRegrasFiscaisIbsCbs');
  if Assigned(ShowModelExecute) then
    ShowModelExecute( False );
end;

procedure TfrmPrincipalS.RTC_RegrasRedBenefPC1Click(Sender: TObject);
var
  ShowModelExecute: TShowForm;
begin
  @ShowModelExecute := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowRegrasRedBenefPC');
  if Assigned(ShowModelExecute) then
    ShowModelExecute( False );
end;

procedure TfrmPrincipalS.SetorClick(Sender: TObject);
var
  vSetor: TSetor;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdOrdemCarregamento = 0 then
      CarregaPacote('pkOrdemCarregamento', hdOrdemCarregamento);
    vSetor._cadSetor(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.SetupModern;
var
  ProcedureInitialize: TSimpleProcedure;
begin
  if vDadosIni.vModern.AHandle = 0 then
    CarregaPacote('pkModern', vDadosIni.vModern.AHandle);

  if vDadosIni.vModern.AHandle = 0 then
  begin
    Application.MessageBox('Pacote Modern não carregado', 'Atenção', 0 + 64);
    Exit;
  end;

  @ProcedureInitialize := GetProcAddress(vDadosIni.vModern.AHandle, 'ModernInitialize');
  if Assigned(ProcedureInitialize) then
    ProcedureInitialize();
end;

procedure TfrmPrincipalS.SetupModernShutdown;
var
  ProcedureInitialize: TSimpleProcedure;
begin
  if vDadosIni.vModern.AHandle = 0 then
    CarregaPacote('pkModern', vDadosIni.vModern.AHandle);

  if vDadosIni.vModern.AHandle = 0 then
  begin
    Application.MessageBox('Pacote Modern não carregado', 'Atenção', 0 + 64);
    Exit;
  end;

  @ProcedureInitialize := GetProcAddress(vDadosIni.vModern.AHandle, 'ModernShutDown');
  if Assigned(ProcedureInitialize) then
    ProcedureInitialize();
end;

function TfrmPrincipalS.ShowFormMainForm(AFormName: string; AForm: string): Boolean;
var
	Component: TComponent;
begin
	Result := False;

  if (AFormName = 'frmPadrao') and (AForm = 'TfrmPadrao') then
  begin
  	Result := True;
    Exit;
  end;

  Component := Application.FindComponent(AFormName);
  if Component <> nil then
    if Component is TForm then
    	if (TForm(Component).Visible) then
      	CriarMenu(TForm(Component))
      else
      begin
      	TForm(Component).Enabled := False;
        TForm(Component).DisableAlign;
        TForm(Component).DisableAutoRange;

        if TForm(Component).WindowState = wsMaximized then
        	TForm(Component).WindowState := wsNormal;

        if TForm(Component).Position <> poScreenCenter then
        	TForm(Component).Position := poScreenCenter;

        if TForm(Component).FormStyle <> fsMDIChild then
      		TForm(Component).FormStyle := fsMDIChild;

        TForm(Component).Enabled := True;

        if AForm = 'TfrmCadPadraoM' then
        begin
        	TfrmCadPadraoM(TForm(Component)).Height := TfrmCadPadraoM(TForm(Component)).vHeight;
          TfrmCadPadraoM(TForm(Component)).Width  := TfrmCadPadraoM(TForm(Component)).vWidth;
	      end
        else if AForm = 'TfrmCadPadrao' then
        begin
        	TfrmCadPadrao(TForm(Component)).Height := TfrmCadPadrao(TForm(Component)).vHeight;
          TfrmCadPadrao(TForm(Component)).Width  := TfrmCadPadrao(TForm(Component)).vWidth;
	      end
        else if AForm = 'TfrmPadrao' then
        begin
        	TfrmPadrao(TForm(Component)).Height := TfrmPadrao(TForm(Component)).vHeight;
          TfrmPadrao(TForm(Component)).Width  := TfrmPadrao(TForm(Component)).vWidth;
        end;

        TForm(Component).Position := poScreenCenter;
        TForm(Component).EnableAlign;
        TForm(Component).EnableAutoRange;

      	if verificaConfiguracoesJanela = 'S' then
        	if TForm(Component).WindowState <> wsMaximized then

        	TForm(Component).WindowState := wsMaximized;

        TForm(Component).Show;

        CriarMenu(TForm(Component));

        Exit;
      end;

  Result := True;
end;

procedure TfrmPrincipalS.ShowHintBalloon;
var
	P: TPoint;
begin
  Exit;
  if (vHandleMensagem <> 0) then
  	vDadosIni.HideBalloonTipFixed(vHandleMensagem);

  if not Application.Active then
    Exit;

  if Self.WindowState <> wsMaximized then
  	Exit;

  if (vHandleMensagem = 0) and (trim(vTituloMensagem) <> '') then
  begin
  	P.X := vDadosIni.IfThen(SpeedButton1.Tag = 1, cbMensagens.Left + 10, 0);
    P.Y := cbMensagens.Top + 10;// + (cbMensagens.Height * 2);
    P := cbMensagens.Parent.ClientToScreen(P);

    vDadosIni.ShowBalloonTipFixed(
      cbMensagens,
      vIconMensagem,
      vTituloMensagem,
      vTextoMensagem,
      True,
      False,
      P.X,
      P.Y,
      vHandleMensagem
    );
  end;
end;

function TfrmPrincipalS.ShowModalFormMainForm(AFormName: string; AForm: string): Boolean;
var
	Component: TComponent;
begin
	Result    := False;

  if (AFormName = 'frmPadrao') or (AForm = 'TfrmPadrao') then
  begin
  	Result := True;
    Exit;
  end;

  Component := Application.FindComponent(AFormName);
  if Component <> nil then
    if Component is TForm then
    	if (not TForm(Component).Visible) then
      begin
        TForm(Component).Enabled := False;
        TForm(Component).DisableAlign;
        TForm(Component).DisableAutoRange;

        if TForm(Component).WindowState <> wsNormal then
        	TForm(Component).WindowState := wsNormal;

        if TForm(Component).Position <> poScreenCenter then
          TForm(Component).Position := poScreenCenter;

        if TForm(Component).FormStyle <> fsNormal then
          TForm(Component).FormStyle := fsNormal;

        TForm(Component).Enabled := True;

        if AForm = 'TfrmCadPadraoM' then
        begin
        	TfrmCadPadraoM(TForm(Component)).Height := TfrmCadPadraoM(TForm(Component)).vHeight;
          TfrmCadPadraoM(TForm(Component)).Width  := TfrmCadPadraoM(TForm(Component)).vWidth;
	      end
        else if AForm = 'TfrmCadPadrao' then
        begin
        	TfrmCadPadrao(TForm(Component)).Height := TfrmCadPadrao(TForm(Component)).vHeight;
          TfrmCadPadrao(TForm(Component)).Width  := TfrmCadPadrao(TForm(Component)).vWidth;
	      end
        else if AForm = 'TfrmPadrao' then
        begin
        	TfrmPadrao(TForm(Component)).Height := TfrmPadrao(TForm(Component)).vHeight;
          TfrmPadrao(TForm(Component)).Width  := TfrmPadrao(TForm(Component)).vWidth;
        end;

        TForm(Component).Position := poScreenCenter;
        TForm(Component).EnableAlign;
        TForm(Component).EnableAutoRange;

        TForm(Component).ShowModal;

        Exit;
      end;

  Result := True;
end;

procedure TfrmPrincipalS.SairClick(Sender: TObject);
begin
  //  Application.Terminate;
  Close;
end;

procedure TfrmPrincipalS.SenhasClick(Sender: TObject);
var
  senha: TSenha;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    senha.CadSenha(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.setar_versao_minima(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

		vDadosIni.setarVersaoMinimaCRC(cQuery);
  	lbSeqMin.Caption := IntToStr(vDadosIni.retornaVersaoMinimaCRC(cQuery));
    lbSeqMax.Caption := IntToStr(vDadosIni.retornaVersaoMaximaCRC(cQuery));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.ConhecimentoDeTransporteClick(Sender: TObject);
var
  vFrete: TServTransporte;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      carregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    vFrete:= TServTransporte.create;
    vFrete.CadServTransporte(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.SincronizardadosPAFECFClick(Sender: TObject);
//var
//  vTerminal: TTerminaisF;
begin
  ShowMessage('Módulo desativado');
  {
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    vTerminal.cadTerminalF(1);
  finally
    Screen.Cursor := crDefault;
  end;
  }
end;

procedure TfrmPrincipalS.SistemaFiscalPAFECFClick(Sender: TObject);
begin
  //  CreateProcessSimple(Application.ExeName + ' pkFiscal TfrmPrincipalFiscal ' +
  //    vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' ' + vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) + ' ' + vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pFiscal');
  try
    Screen.Cursor := crHourGlass;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    vDadosIni.vtpVenda := 'REQ';
    try
      enterTela.ClassList.Clear;
      enterTela.classList.Add('TMaskEdit');
      enterTela.classList.Add('TDBEdit');
      enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
      enterTela.classList.Add('TCheckBox');
      enterTela.classList.Add('TDBCheckBox');
      enterTela.classList.Add('TComboBox');
      enterTela.classList.Add('TDBComboBox');
      enterTela.classList.Add('TListBox');
      enterTela.classList.Add('TDBListBox');
      enterTela.classList.Add('TDBLookupListBox');
      enterTela.classList.Add('TDBLookupComboBox');
      enterTela.classList.Add('TSpinEdit');
      enterTela.classList.Add('TDateTimePicker');
      enterTela.classList.Add('TRadioGroup');
      enterTela.classList.Add('TDBRadioGroup');
      enterTela.classList.Add('TRadioButton');
      enterTela.classList.Add('TDBRadioButton');

//      TPedVenda.showFiscal;
    finally
      enterTela.classList.Add('TEdit');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.SobreClick(Sender: TObject);
begin
  abreFormAbout;
end;

procedure TfrmPrincipalS.SpeedButton1Click(Sender: TObject);
var
  i: integer;
begin
  if SpeedButton1.Tag = 1 then
  begin
    SpeedButton1.Caption := '»';
    SpeedButton1.Tag := 2;
    Panel1.Tag := Panel1.Height;
    Panel1.Align := alNone;
    Panel1.Height := Panel1.Tag;
    Panel1.Left := 0;
    Panel1.Top := 0;
    Panel3.Visible := true;
    for I := 0 downto -135 do
    begin
      Application.ProcessMessages;
      if i mod 10 = 0 then
        Panel1.Left := i;
    end;
    Panel1.Left := -162;
    _carregarImagemFundo;
  end
  else if SpeedButton1.Tag = 2 then
  begin
    Panel3.Visible := false;
    SpeedButton1.Caption := '«';
    SpeedButton1.Tag := 1;
    Panel1.Height := Panel1.Tag;
    for I := -175 to 0 do
    begin
      Application.ProcessMessages;
      if i mod 10 = 0 then
        Panel1.Left := i;
    end;
    Panel1.Align := alLeft;
    _carregarImagemFundo;
  end;

 	if vVerificarMensagens then
    if not FormularioShowModal then
      ShowHintBalloon;
end;

procedure TfrmPrincipalS.SubGruposClick(Sender: TObject);
var
  Produto: TProdutos;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vProduto.AHandle = 0 then
      CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
    Produto.CadSubGrupos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.SugestaoDeComprasClick(Sender: TObject);
var
  vSugestao: TSugestao;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdSugestaoCompra = 0 then
      CarregaPacote('pkSugestaoCompras', hdSugestaoCompra);
    vSugestao.CadSugestao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.SugestaoServicoClick(Sender: TObject);
var
  vSugestaoServico: TSugestaoServico;
begin
   try
     Screen.Cursor := crHourGlass;
     if vDadosIni.vCadBasicos.AHandle = 0 then
        CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
      vSugestaoServico._abreFormSugServ(0);
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmPrincipalS.SuporteOnlineClick(Sender: TObject);
var
  AEmail: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.ApiHwemailColaboradorValidoParaAcesso(cQuery, AEmail) then
      vDadosIni.ApiHwCentralSuporte(cQuery, AEmail);
  finally
    Screen.Cursor := crDefault;
  end;
//  Application.CreateForm(TfrmSuporteOnline, frmSuporteOnline);
//  frmSuporteOnline.Show;
end;

procedure TfrmPrincipalS.SuporteRemotoClick(Sender: TObject);
begin
    vDadosIni.CreateProcessSimple('HwSuporte.exe');
end;

procedure TfrmPrincipalS.TiposDeServicosClick(Sender: TObject);
var
  TipoServ: TTipoServ;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);
    TipoServ.CadTipoServ(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Veiculos301Click(Sender: TObject);
var
  vTemp: string;
  i: integer;
begin
  vTemp := 'Sistema de Automação(Loja: ' + vDadosIni.StrZero(StrToInt(vDadosIni.CodEmpresa), 3) + ')';
  if FindWindow('TFRMprincipal', pchar(vTemp)) > 0 then
    SetForegroundWindow(FindWindow('TFRMprincipal', pchar(vTemp)))
  else
  begin
    vTemp := ExtractFileDir(application.ExeName);
    for i := length(vtemp) downto 1 do
    begin
      if vTemp[i] = '\' then
      begin
        vTemp := copy(vTemp, 1, i) + '\veiculos\Veiculos.exe';
        Break;
      end;
    end;
    vTemp := StringReplace(vTemp, '\\', '\', [rfReplaceAll]);
    CreateProcessSimple(vTemp + ' ' + vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' ' +
      vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) + ' ' + vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pAutomacao');
  end;
end;

procedure TfrmPrincipalS.VeiculosCadastroClick(Sender: TObject);
var
  Veiculo: TVeiculos;
  VeiculoCCIA: TVeiculosCCIA;
begin
  try
    Screen.Cursor := crHourGlass;
   if vDadosIni.vEmp.vVersaoVeiculos = '4' then
   begin
     if hdVeiculosCCIA = 0 then
       carregaPacote('pkVeiculosCCIA', hdVeiculosCCIA);
     VeiculoCCIA.CadVeiculos(0);
   end
   else
   begin
     if hdVeiculos = 0 then
       carregaPacote('pkVeiculos', hdVeiculos);
     Veiculo.CadVeiculos(0);
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.VeiculosDeTransporteClick(Sender: TObject);
var
  vVeicTr: TVeiculoDeTransporte;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdOrdemCarregamento = 0 then
      CarregaPacote('pkOrdemCarregamento', hdOrdemCarregamento);
    vVeicTr._cadVeiculoTransporte(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.VendaDeProdutosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not ChaveMensalValida() then
      exit;
    if hdClientes = 0 then
      carregaPacote('pkClientes', hdClientes);
    vDadosIni.vtpVenda := 'REQ';
//    TPedVenda.verificaFiscalAtivo;
    TPedVenda.cadPedVenda(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.VendaEstoqueASSOHONDA1Click(Sender: TObject);                                            
var
// cadintegraFab: TIntegraFab;
  hdTemp: THandle;
  formulario: TForm;
begin
  if not vDadosIni.PesqPros('FAB002', 'ABRIR', '', '', '', cQuery, False) then
    Exit;

  carregaPacote('pkautomacao', hdIntegraFab);
//  if hdProdutos = 0 then
//   CarregaPacote('pkProdutos', hdProdutos);
//  if vDadosIni.vCtp.AHandle = 0 then
//   carregaPacote('pkContasAPagar', vDadosIni.vCtp.AHandle);
//  cadintegraFab.cadIntegraFab(0);
//  UnloadPackage(hdIntegraFab);

  vDadosIni.vPesquisa := 'ASSOHONDAVENDAESTOQUE|';
  formulario := Funcoes.AbreForm('pkFabrica', 'TFrmFabrica', hdTemp);

  try
    formulario.Showmodal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;

end;

procedure TfrmPrincipalS.VendaVeiculos1Click(Sender: TObject);
var
  vVeiculosCCIA : TVeiculosCCIA;
begin
  try
    Screen.Cursor := crHourGlass;
   if hdVeiculosCCIA = 0 then
   begin
   CarregaPacote('pkVeiculosCCIA',hdVeiculosCCIA);
   end;
   vVeiculosCCIA._VendaVeiculos(0);
     finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.Vendedor1Click(Sender: TObject);
var
  vControlePecasVendedor: TEstoqueFechado;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdPedVenda = 0 then
      CarregaPacote('pkPedidoVenda', hdPedVenda);
    vControlePecasVendedor._ControleVendedor(0);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPrincipalS.VerDimensesdareaparaimagem1Click(Sender: TObject);
begin
  Application.MessageBox(pchar(IntToStr(Image1.Width)+ 'x' + IntToStr(Image1.Height)
  ), 'Informação', 0 + 64);
end;

function TfrmPrincipalS.verificaConfiguracoesJanela: string;
var
  Registro: TRegistry;
  vTemp, vTemp2: string;
begin
	try
    Result := '';
    Registro := TRegistry.Create;
    try
      Registro.OpenKey('Software\Hw\Configuracao\Telas\TfrmPrincipalS', True);
      try
        Result := Registro.ReadString('JanelasMaximizadas');
      except
      end;
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmPrincipalS.VerificarLogNBackup;
var
//  conf: TConfig_sistema_class;
  str: string;
begin
  if Time < FTimeNBackupLog then
    Exit;

  if vDadosIni.SqlOpen('select value1_f from config_sistema where chave = %s and cod_empresa = 0',
                           [QuotedStr('hw_nbackup')], cQuery).FieldByName('value1_f').AsFloat = 0 then
  begin
    FTimeNBackupLog := EncodeTime(23, 59, 59, 0);
    Exit;
  end;

  str := vDadosIni.SqlOpen('select value1_vc from config_sistema where chave = %s and cod_empresa = 0',
                           [QuotedStr('hw_nbackup_last_exec')], cQuery).FieldByName('value1_vc').AsString;
  cQuery.Close;

  if ContainsText(str, 'Status: Erro') then
  begin
    MenuHwNBackupLog := TMenuItem.Create(MainMenu1);
    MainMenu1.Items.Add(MenuHwNBackupLog);
    MenuHwNBackupLog.OnClick    := MenuHwNBackupLogClick;
    MenuHwNBackupLog.ImageIndex := 2;
  end;

  FTimeNBackupLog := Time + EncodeTime(0, 30, 0, 0);
end;

procedure TfrmPrincipalS.VerificarnovaversaoClick(Sender: TObject);
var
  vProgRecep: THandle;
  vRetorno: Smallint;
  copyDataStruct : TCopyDataStruct;
begin

  vProgRecep:=FindWindow('TfrmHwUpdate', nil);
  if vProgRecep = 0 then
  begin
    Sleep(2000);
    Application.MessageBox('O Atualizador não esta em execução. O sistema irá tentar carregar o Atualizador. Tente novamente', 'Atenção', 0 + 64);
    vDadosIni.CreateProcessSimple( ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HW_MENS_ABRIR ' + vDadosIni.vVersaoBpl);
    Exit;
  end;

  copyDataStruct.dwData := 2; //use it to identify the message contents
  copyDataStruct.cbData := 1 + Length(vDadosIni.vVersaoBpl) ;
  copyDataStruct.lpData := PChar(vDadosIni.vVersaoBpl);

  vDadosIni.forcaFocoNoSistema(vProgRecep);
  vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@copyDataStruct)) ;
  if vRetorno = 0 then
    Application.MessageBox('O Atualizador não esta respondendo', 'Atenção', 0 + 64)
  else if vRetorno = 2 then
    Application.MessageBox('Programa em Execução. Tente depois de alguns minutos', 'Atenção', 0 + 64)
  else if vRetorno = 4 then
    Halt(0)
  else if vRetorno = 6 then
    Application.MessageBox('Programa em Execução. Tente depois de alguns minutos', 'Atenção', 0 + 64)
end;

procedure TfrmPrincipalS.visualizarWSReplicacaoClick(Sender: TObject);
 var
  vCons: TConsultasWs;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vCons.visualizarWS(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalS.WM_Sys(var Msg: TMessage);
begin
 	if (Msg.WParam = SC_MINIMIZE) or (Msg.WParam = SC_RESTORE) then
  begin
    if vVerificarMensagens then
    begin
      if (vHandleMensagem <> 0) then
      begin
        cbMensagens.Enabled := False;
        cbMensagens.Visible := False;

        cbMensagens.Top := 0;
        cbMenusAbertos.Top := vDadosIni.IfThen((cbMenusAbertos.Enabled) and (cbMensagens.Visible), cbMensagens.Height, 0);

        vTituloMensagem := '';
        vTextoMensagem  := '';
        vIconMensagem   := 0;
        vTipoMensagem   := '';

        HideHintBalloon;
      end;
    end;
  end;

  inherited;
end;

procedure TfrmPrincipalS._abreHwUpdate(pForcaAtualizacao: Boolean = False);
var
  vProgRecep : THandle;
  vRetorno : integer;
  copyDataStruct : TCopyDataStruct;

  procedure ReiniciarAplicativoComoAdmin;
  var
    SEInfo: TShellExecuteInfo;
  begin
    FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    SEInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
    SEInfo.lpVerb := 'runas'; // Executa como Administrador
    SEInfo.lpFile := PChar(ParamStr(0)); // Caminho da própria aplicação
    SEInfo.lpParameters := nil;
    SEInfo.nShow := SW_SHOWNORMAL;

    if ShellExecuteEx(@SEInfo) then
    begin
      // Encerra a instância atual se a nova foi iniciada com sucesso
      Application.Terminate;
    end;
  end;

  procedure ReiniciarAplicativo;
  var
    SEInfo: TShellExecuteInfo;
  begin
    FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    SEInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
    SEInfo.lpVerb := 'runas'; // Executa como Administrador
    SEInfo.lpFile := PChar(ParamStr(0)); // Caminho da própria aplicação
    SEInfo.lpParameters := nil;
    SEInfo.nShow := SW_SHOWNORMAL;

    if ShellExecuteEx(@SEInfo) then
    begin
      // Encerra a instância atual se a nova foi iniciada com sucesso
      Application.Terminate;
    end;
  end;

  function IsUserAdmin: Boolean;
  var
    TokenHandle: THandle;
    Elevation: TOKEN_ELEVATION;
    ReturnLength: DWORD;
  begin
    Result := False;
    if OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, TokenHandle) then
    begin
      try
        if GetTokenInformation(
        	 TokenHandle,
          TTokenInformationClass(TokenUser), //TTokenInformationClass(TokenUser),
          @Elevation,
          SizeOf(Elevation),
          ReturnLength) then
          	Result := Elevation.TokenIsElevated <> 0;
      finally
        CloseHandle(TokenHandle);
      end;
    end;
  end;
begin
  try
    while true do
    begin

      vProgRecep:=FindWindow('TfrmHwUpdate', nil);
      if vProgRecep = 0 then
      begin
        Sleep(2000);
        Application.MessageBox('O Atualizador não esta em execução. O sistema irá tentar carregar o Atualizador. Tente novamente', 'Atenção', 0 + 64);
        vDadosIni.CreateProcessSimple( ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HW_ATUALIZAR ' + vDadosIni.vVersaoBpl);
        Halt(0);
      end;

      copyDataStruct.dwData := vDadosIni.IfThen(pForcaAtualizacao, 5, 1); //use it to identify the message contents
      copyDataStruct.cbData := 1 + Length(vDadosIni.vVersaoBpl) ;
      copyDataStruct.lpData := PChar(vDadosIni.vVersaoBpl);

      vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@copyDataStruct)) ;

      if vRetorno = 0 then
      begin
        Application.MessageBox('O Atualizador não esta respondendo', 'Atenção', 0 + 64);
        if (vDadosIni.vTsPlus <> 'S') then
        begin
          if vDadosIni.IsProcessOpen('HwUpdate.exe') then
          begin
            if Application.MessageBox(PChar(
              'HwUpdate esta em execução e não esta respondendo.' + #13 + #13 +
              'Observações: ' + #13 +
              '1º - Verifique se o HwUpdate esta sendo executado com Administrador e o Sistema não.' + #13 +
              '2º - Execute o sistema como administrador para atualizar.' + #13 + #13 +
              'Deseja fechar e reiniciar aplicativo como Administrador?'),'Confirmação',MB_YESNO+MB_ICONQUESTION) <> IDYES then
              Halt(0)
            else
            begin
              if not IsUserAdmin then
              begin
                ReiniciarAplicativoComoAdmin;
                Break;
              end
              else
              begin
              	 ShellExecute(0, 'open', 'cmd.exe', PChar('/c taskkill /f /im HwUpdate.exe'), nil, SW_HIDE);
                Sleep(2000);

            	 if vDadosIni.IsProcessOpen('HwUpdate.exe') then
                begin
                  ShellExecute(0, 'runas', 'cmd.exe', PChar('/c taskkill /f /im HwUpdate.exe'), nil, SW_HIDE);
                  Sleep(2000);
                end;
              end;
            end;
          end;
        end;
      end
      else if vRetorno = 2 then
        Application.MessageBox('Programa em Execução. Tente depois de alguns instantes', 'Atenção', 0 + 64)
      else if vRetorno = 4 then
        Halt(0)
      else if vRetorno = 6 then
        Application.MessageBox('Programa em Execução. Tente depois de alguns minutos', 'Atenção', 0 + 64)
    end;
//      Halt(0);
  finally
    Halt(0);
  end;
end;

procedure TfrmPrincipalS._carregarImagemFundo;
var
  FileName: string;
begin
  if SpeedButton1.Tag = 2 then
  begin
    FileName := _LerConfiguracoesRegistroString(Image1.Name+'_02_' + vDadosIni.codEmpresa);
    if not FileExists(FileName) then
    begin
      FileName := ExtractFilePath(Application.ExeName) + 'logohw4_2.jpg';
      vDadosIni.saveResourceToFile('fundo1366x768', 'jpg', FileName);
      if FileExists(FileName) then
        _GravaConfiguracoesString(Image1.Name+'_02_' + vDadosIni.codEmpresa, FileName);
    end;
    if FileExists(FileName) then
      Image1.Picture.LoadFromFile(FileName)
    else if FileExists( ExtractFilePath(Application.ExeName) + 'logo4_2.jpg' ) then
      Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo4_2.jpg');
  end
  else if SpeedButton1.Tag = 1 then
  begin
    FileName := _LerConfiguracoesRegistroString(Image1.Name+'_01_' + vDadosIni.codEmpresa);
    if not FileExists(FileName) then
    begin
      FileName := ExtractFilePath(Application.ExeName) + 'logohw4_1.jpg';
      vDadosIni.saveResourceToFile('fundo1366x768', 'jpg', FileName);
      if FileExists(FileName) then
        _GravaConfiguracoesString(Image1.Name+'_01_' + vDadosIni.codEmpresa, FileName);
    end;
    if FileExists(FileName) then
      Image1.Picture.LoadFromFile(FileName)
    else if FileExists( ExtractFilePath(Application.ExeName) + 'logo4_1.jpg' ) then
      Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo4_1.jpg');
//    if FileExists(  _LerConfiguracoesRegistroString(Image1.Name+'_1_' + vDadosIni.codEmpresa) ) then
//      Image1.Picture.LoadFromFile(_LerConfiguracoesRegistroString(Image1.Name+'_1_' + vDadosIni.codEmpresa))
//    else if FileExists( ExtractFilePath(Application.ExeName) + 'logo4_1.jpg' ) then
//      Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo4_1.jpg');
  end;
end;

procedure TfrmPrincipalS._GravaConfiguracoesString(NomeVariavel, Valor: string);
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
      Registro.WriteString(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TfrmPrincipalS._LerConfiguracoesRegistroString(
  NomeVariavel: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    vTemp := '';
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadString(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmPrincipalS._passaVersaoHwUpdate;
var
  vProgRecep : THandle;
  vRetorno : integer;
  copyDataStruct : TCopyDataStruct;
begin
  try

    vProgRecep:=FindWindow('TfrmHwUpdate', nil);
    if vProgRecep = 0 then
    begin
      Sleep(2000);
      vDadosIni.CreateProcessSimple( ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HwSistemas ' + vDadosIni.vVersaoBpl);
      Exit;
    end;

    copyDataStruct.dwData := 4; //use it to identify the message contents
    copyDataStruct.cbData := 1 + Length(vDadosIni.vVersaoBpl) ;
    copyDataStruct.lpData := PChar(vDadosIni.vVersaoBpl);

    vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@copyDataStruct)) ;

  except
  end;
end;

procedure TfrmPrincipalS.CadastroDeVendaPerdidaClick(Sender: TObject);
var
  vVendaPerd: TVendaPerdida;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdPedVenda = 0 then
      CarregaPacote('pkPedidoVenda', hdPedVenda);
    vVendaPerd.CadVendaPerdida(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

{ TVerificaHwSuporteAtivo }

constructor TVerificaHwSuporteAtivo.Create(CreateSuspended: Boolean);
begin
  inherited Create (CreateSuspended);
  Self.FreeOnTerminate := False;
  Self.Priority := tpLower;
  fImageLoaded := True;
end;

procedure TVerificaHwSuporteAtivo.Execute;
begin
  inherited;
  Sleep(1000);
  while (not Self.Terminated) do
  begin
    try
      if (fImageLoaded) and (TaskRuning('HWSuporte.exe')) then
      begin
        Synchronize(FreeImages);
        fImageLoaded := False;
      end
      else if (not fImageLoaded) and (not TaskRuning('HWSuporte.exe')) then
      begin
        Synchronize(LoadImages);
        fImageLoaded := True;
      end;
    except
    end;
    Sleep(1000);
  end;
end;

procedure TVerificaHwSuporteAtivo.FreeImages;
begin
  if Assigned(Imagem) then
    Imagem.Visible := False;
end;

procedure TVerificaHwSuporteAtivo.LoadImages;
begin
  if Assigned(Imagem) then
    Imagem.Visible := True;
end;

procedure TVerificaHwSuporteAtivo.SetImagem(const Value: TImage);
begin
  FImagem := Value;
end;

function TVerificaHwSuporteAtivo.TaskRuning(
  ExeNameWithExtension: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := False;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeNameWithExtension)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeNameWithExtension))) then
      begin
        Result := True;
        Break;
      end;
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

initialization
  RegisterClass(TfrmPrincipalS);
finalization
  UnRegisterClass(TfrmPrincipalS);

  // Linhas para testar se o formulario selecionado pelo botao ja esta aberto.
// Troque o nome do formulario FrmPrincipalS para o formulario a ser aberto.
//  if frmPrincipalS = nil then
//    Application.CreateForm(TfrmPrincipalS,frmPrincipalS);
//  frmPrincipalS.Show;

end.

