unit SharedFactoryContainerUnit;

interface

uses
  ISharedFactoryUnit,
  IServiceFactoryUnit,
  IDatabaseConnectionUnit,
  ICalculadorROCServiceUnit,
  ICalculadorBaseCalculoServiceUnit, ISessionContextUnit, IClassificacaoTributariaServiceUnit,
  ClassificacaoTributariaServiceUnit;

type

  SharedFactory = class(TInterfacedObject, ISharedFactory)
  private
    FDatabaseConnection: IDatabaseConnection;
    FSession: ISessionContext;
  public
    constructor Create(DatabaseConnection: IDatabaseConnection; Session: ISessionContext);

    function CreateCalculadorROCService(): ICalculadorROCService;
    function CreateCalculadorBaseCalculoService(): ICalculadorBaseCalculoService;
  end;

implementation

uses
  SharedRepoContainerUnit, FiscalRepoContainerUnit, CalculadorROCServiceUnit,
  IPreparacaoCalculoServiceUnit, NbsAplicavelServiceUnit, NcmAplicavelServiceUnit, CalculoCbsIbsServiceUnit,
  CalculoImpostoSeletivoServiceUnit, MemoriaCalculoServiceUnit, ICalculoTributoServiceUnit,
  PreparacaoCalculoServiceInterUnit, CalculoTributoServiceUnit, CalculoBaseCalculoServiceUnit, ITradutorErrosRtcUnit,
  TradutorErrosRtcUnit, IAvaliadorExpressaoAritmeticaServiceUnit, AvaliadorExpressaoAritmeticaServiceUnit,
  TransferenciaCBSServiceUnit, ProcessamentoItemServiceNovoUnit, RedutorCompraGovernamentalServiceUnit,
  ISituacaoTributariaServiceUnit, SituacaoTributariaServiceUnit;

{ SharedFactory }

constructor SharedFactory.Create(DatabaseConnection: IDatabaseConnection; Session: ISessionContext);
begin
  FDatabaseConnection := DatabaseConnection;
  FSession := Session;

  SharedRepoContainer.GetInstance().Setup( FDatabaseConnection );
end;

function SharedFactory.CreateCalculadorBaseCalculoService: ICalculadorBaseCalculoService;
begin
  Result := CalculadorBaseCalculoService.Create();
end;

function SharedFactory.CreateCalculadorROCService: ICalculadorROCService;
var
  nbsAplService: INbsAplicavelService;
  ncmAplService: INcmAplicavelService;
  preparacao: IPreparacaoCalculoServiceInter;
  calcCbsIbsService: ICalculoCbsIbsService;
  calcISService: ICalculoImpostoSeletivoService;
  memCalc: IMemoriaCalculoService;
  calcTributosService: ICalculoTributoService;
  tradutorErros: ITradutorErrosRTC;
  classTribService: IClassificacaoTributariaService;
  situacaoTribService: ISituacaoTributariaService;
  avaliadorExprss: IAvaliadorExpressaoAritmeticaService;
  transferenciaCBS: ITransferenciaCBSService;
  processamentoItem: IProcessamentoItemService;
  redutorCompraGovernamental: IRedutorCompraGovernamentalService;
begin
  ncmAplService := NcmAplicavelService.Create( FiscalRepoContainer.GetInstance().NcmAplicavelRepo );
  nbsAplService := NbsAplicavelService.Create( FiscalRepoContainer.GetInstance().NbsAplicavelRepo );
  classTribService := ClassificacaoTributariaService.Create(
    FiscalRepoContainer.GetInstance().ClassificacaoTributariaRepo
  );
  avaliadorExprss := AvaliadorExpressaoAritmeticaService.Create();

  preparacao := PreparacaoCalculoServiceInter.Create(
    FiscalRepoContainer.GetInstance().MunicipioRepo,
    FiscalRepoContainer.GetInstance().NcmRepo,
    FiscalRepoContainer.GetInstance().NbsRepo,
    FiscalRepoContainer.GetInstance().TributoSituacaoTributariaRepo,
    FiscalRepoContainer.GetInstance().ClassificacaoTributariaRepo,
    FiscalRepoContainer.GetInstance().TratamentoClassificacaoRepo,
    ncmAplService,
    nbsAplService,
    FiscalRepoContainer.GetInstance().AliquotaAdValoremProdutoRepo,
    FiscalRepoContainer.GetInstance().AliquotaAdValoremServicoRepo,
    FiscalRepoContainer.GetInstance().AliquotaAdRemProdutoRepo,
    FiscalRepoContainer.GetInstance().RedutorCompraGovernamentalRepo,
    classTribService
  );

  situacaoTribService := SituacaoTributariaService.Create(
    FiscalRepoContainer.GetInstance().SituacaoTributariaRepo
  );

  calcCbsIbsService := CalculoCbsIbsService.Create(
    FiscalRepoContainer.GetInstance().PercentualReducaoRepo,
    FiscalRepoContainer.GetInstance().AliquotaReferenciaRepo,
    FiscalRepoContainer.GetInstance().AliquotaPadraoRepo,
    FiscalRepoContainer.GetInstance().AliquotaAdRemProdutoRepo,
    FiscalRepoContainer.GetInstance().AliquotaAdValoremServicoRepo,
    FiscalRepoContainer.GetInstance().TratamentosTributariosRepo,
    FiscalRepoContainer.GetInstance().ClassificacaoTributariaRepo,
    avaliadorExprss,
    situacaoTribService
  );

  calcISService := CalculoImpostoSeletivoService.Create(
    FiscalRepoContainer.GetInstance().TratamentosTributariosRepo,
    avaliadorExprss
  );

  memCalc := MemoriaCalculoService.Create(
    FiscalRepoContainer.GetInstance().FundamentacaoClassificacaoRepo,
    FiscalRepoContainer.GetInstance().TratamentosTributariosRepo
  );

  transferenciaCBS := TransferenciaCBSService.Create(
    FiscalRepoContainer.GetInstance().TransferenciaCBSRepo,
    FiscalRepoContainer.GetInstance().VersaoBaseDadosRepo
  );

  calcTributosService := CalculoTributoService.Create(
    calcCbsIbsService, calcISService, memCalc, transferenciaCBS
  );

  tradutorErros := TradutorErrosRtc.Create();

  redutorCompraGovernamental := RedutorCompraGovernamentalService.Create(
    FiscalRepoContainer.GetInstance().RedutorCompraGovernamentalRepo
  );

  processamentoItem := ProcessamentoItemService.Create(
    calcTributosService,
    FiscalRepoContainer.GetInstance().NcmRepo,
    FiscalRepoContainer.GetInstance().NbsRepo,
    FiscalRepoContainer.GetInstance().TributoSituacaoTributariaRepo,
    FiscalRepoContainer.GetInstance().ClassificacaoTributariaRepo,
    FiscalRepoContainer.GetInstance().TratamentoClassificacaoRepo,
    ncmAplService,
    nbsAplService,
    FiscalRepoContainer.GetInstance().AliquotaAdValoremProdutoRepo,
    FiscalRepoContainer.GetInstance().AliquotaAdValoremServicoRepo,
    FiscalRepoContainer.GetInstance().AliquotaAdRemProdutoRepo,
    redutorCompraGovernamental,
    classTribService
  );

  Result := CalculadorROCService.Create(
    FiscalRepoContainer.GetInstance().MunicipioRepo,
    redutorCompraGovernamental,
    processamentoItem,
    preparacao,
    calcTributosService,
    tradutorErros
  );
end;

end.
