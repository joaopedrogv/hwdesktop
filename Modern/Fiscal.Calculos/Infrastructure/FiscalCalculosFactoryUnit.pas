unit FiscalCalculosFactoryUnit;

interface

uses
  IServiceFactoryUnit,
  IDatabaseConnectionUnit,
  CalculaTributoUseCaseUnit,
  ValidarTributacaoUseCaseUnit,
  IPreparacaoCalculoServiceUnit,
  ListarClassificacoesTributariasUseCaseUnit,
  ObterClassificacaoTributariaIbsCbsUseCaseUnit,
  ObterTratamentoClassificacaoUseCaseUnit,
  ObterPercentualDeReducaoUseCaseUnit,
  CalcularBCIbsCbsUseCaseUnit,
  CalcularBCImpostoSeletivoUseCaseUnit,
  ValidarIndicadorOperacaoUseCaseUnit,
  ConsultarLocalOperacaoUseCaseUnit,
  ConsultarIndicadorOperacaoUseCaseUnit,
  ConsultarSituacoesClassificacoesPorNbsUseCaseUnit, ISharedFactoryUnit;

type       
  {$IFDEF INTF_ON}
  IFiscalCalculosFactory = interface(IServiceFactory)
    ['{25132B56-6E86-462A-AC43-8EBDFDB8E06C}']
    function CreateCalculaTributoUseCase: ICalculaTributoUseCase;
    function CreateValidaTributacaoUseCase: IValidarTributacaoUseCase;   
    function CreateCalcularBCIbsCbsUseCase: ICalcularBCIbsCbsUseCase;
    function CreateCalcularBCImpostoSeletivoUseCase: ICalcularBCImpostoSeletivoUseCase;

    // De uso do ERP
    function CreateListarClassificacoesTributariasUseCase(): IListarClassificacoesTributariasUseCase;
    function CreateObterClassificacaoTributariaIbsCbsUseCase(): IObterClassificacaoTributariaIbsCbsUseCase;
    function CreateObterTratamentoClassificacaoUseCase(): IObterTratamentoClassificacaoUseCase;
    function CreateObterPercentualDeReducaoUseCase(): IObterPercentualDeReducaoUseCase;
    function CreateValidarIndicadorOperacaoUseCase(): IValidarIndicadorOperacaoUseCase;
    function CreateConsultarLocalOperacaoUseCase(): IConsultarLocalOperacaoUseCase;
    function CreateConsultarIndicadorOperacaoUseCase(): IConsultarIndicadorOperacaoUseCase;
    function CreateConsultarSituacoesClassificacoesPorNbsUseCase(): IConsultarSituacoesClassificacoesPorNbsUseCase;
  end;
  {$ENDIF}
       
  {$IFDEF INTF_ON}
  FiscalCalculosFactory = class(TInterfacedObject, IFiscalCalculosFactory)
  {$ELSE}                                                                 
  FiscalCalculosFactory = class
  {$ENDIF}
  private
    FDatabaseConnection: IDatabaseConnection;
    FSharedFactory: ISharedFactory;
    function CreatePreparacaoCalculoService: IPreparacaoCalculoServiceInter;
  public
    constructor Create(const DatabaseConnection: IDatabaseConnection; SharedFactory: ISharedFactory);
    function CreateCalculaTributoUseCase: ICalculaTributoUseCase;
    function CreateValidaTributacaoUseCase: IValidarTributacaoUseCase;
    function CreateCalcularBCIbsCbsUseCase: ICalcularBCIbsCbsUseCase;
    function CreateCalcularBCImpostoSeletivoUseCase: ICalcularBCImpostoSeletivoUseCase;

    // De uso do ERP
    function CreateListarClassificacoesTributariasUseCase(): IListarClassificacoesTributariasUseCase;
    function CreateObterClassificacaoTributariaIbsCbsUseCase(): IObterClassificacaoTributariaIbsCbsUseCase;
    function CreateObterTratamentoClassificacaoUseCase(): IObterTratamentoClassificacaoUseCase;
    function CreateObterPercentualDeReducaoUseCase(): IObterPercentualDeReducaoUseCase;
    function CreateValidarIndicadorOperacaoUseCase(): IValidarIndicadorOperacaoUseCase;
    function CreateConsultarLocalOperacaoUseCase(): IConsultarLocalOperacaoUseCase;
    function CreateConsultarIndicadorOperacaoUseCase(): IConsultarIndicadorOperacaoUseCase;
    function CreateConsultarSituacoesClassificacoesPorNbsUseCase(): IConsultarSituacoesClassificacoesPorNbsUseCase;
  end;

implementation

uses
  FiscalRepoContainerUnit,
  NcmAplicavelServiceUnit,
  NbsAplicavelServiceUnit,
  CalculoCbsIbsServiceUnit,
  CalculoImpostoSeletivoServiceUnit,
  MemoriaCalculoServiceUnit,
  ICalculoTributoServiceUnit,
  CalculoTributoServiceUnit,
  CalculoBaseCalculoServiceUnit, ICalculoBaseCalculoServiceUnit,
  ITradutorErrosRtcUnit, TradutorErrosRtcUnit, IClassificacaoTributariaServiceUnit,
  IAvaliadorExpressaoAritmeticaServiceUnit, AvaliadorExpressaoAritmeticaServiceUnit, ClassificacaoTributariaServiceUnit,
  PreparacaoCalculoServiceInterUnit, ProcessamentoItemServiceNovoUnit, ICalculadorROCServiceUnit;

{ FiscalCalculosFactory }

constructor FiscalCalculosFactory.Create(const DatabaseConnection: IDatabaseConnection; SharedFactory: ISharedFactory);
begin
  inherited Create;
  FDatabaseConnection := DatabaseConnection;
  FSharedFactory := SharedFactory;

  FiscalRepoContainer.GetInstance().Setup( FDatabaseConnection );
end;

function FiscalCalculosFactory.CreateCalcularBCIbsCbsUseCase: ICalcularBCIbsCbsUseCase;
var
  Calculo: ICalculoBaseCalculoService;
begin
  Calculo := CalculoBaseCalculoService.Create();

  Result := CalcularBCIbsCbsUseCase.Create(Calculo);
end;

function FiscalCalculosFactory.CreateCalcularBCImpostoSeletivoUseCase: ICalcularBCImpostoSeletivoUseCase;
var
  Calculo: ICalculoBaseCalculoService;
begin
  Calculo := CalculoBaseCalculoService.Create();

  Result := CalcularBCImpostoSeletivoUseCase.Create(Calculo);
end;

function FiscalCalculosFactory.CreateCalculaTributoUseCase: ICalculaTributoUseCase;
var
//  preparacao: IPreparacaoCalculoServiceInter;
//  calcCbsIbsService: ICalculoCbsIbsService;
//  calcISService: ICalculoImpostoSeletivoService;
//  memCalc: IMemoriaCalculoService;
//  calcTributosService: ICalculoTributoService;
//  tradutorErros: ITradutorErrosRTC;
//  avaliadorExprss: IAvaliadorExpressaoAritmeticaService;
  ProcessamentoItem: IProcessamentoItemService;
  CalculadorROC: ICalculadorROCService;
begin
//  preparacao := CreatePreparacaoCalculoService();
//  avaliadorExprss := AvaliadorExpressaoAritmeticaService.Create();
  try
        {
    calcCbsIbsService := CalculoCbsIbsService.Create(
      FiscalRepoContainer.GetInstance().PercentualReducaoRepo,
      FiscalRepoContainer.GetInstance().AliquotaReferenciaRepo,
      FiscalRepoContainer.GetInstance().AliquotaPadraoRepo,
      FiscalRepoContainer.GetInstance().AliquotaAdRemProdutoRepo,
      FiscalRepoContainer.GetInstance().AliquotaAdValoremServicoRepo,
      FiscalRepoContainer.GetInstance().TratamentosTributariosRepo,
      FiscalRepoContainer.GetInstance().ClassificacaoTributariaRepo,
      avaliadorExprss
    );

    calcISService := CalculoImpostoSeletivoService.Create(
      FiscalRepoContainer.GetInstance().TratamentosTributariosRepo,
      avaliadorExprss
    );

    memCalc := MemoriaCalculoService.Create(
      FiscalRepoContainer.GetInstance().FundamentacaoClassificacaoRepo,
      FiscalRepoContainer.GetInstance().TratamentosTributariosRepo
    );

    calcTributosService := CalculoTributoService.Create(
      calcCbsIbsService, calcISService, memCalc,
      FiscalRepoContainer.GetInstance().TransferenciaCBSRepo
    );

    tradutorErros := TradutorErrosRtc.Create();
               }

    CalculadorROC := FSharedFactory.CreateCalculadorROCService();

    Result := CalculaTributoUseCase.Create(CalculadorROC);
//      preparacao,
//      calcTributosService,
//      tradutorErros
//    );
  except
    //preparacao.FreeSafe();
  end;
end;

function FiscalCalculosFactory.CreateListarClassificacoesTributariasUseCase: IListarClassificacoesTributariasUseCase;
begin
  Result := ListarClassificacoesTributariasUseCase.Create(
    FiscalRepoContainer.GetInstance().ClassificacaoTributariaRepo
  );
end;

function FiscalCalculosFactory.CreateObterClassificacaoTributariaIbsCbsUseCase: IObterClassificacaoTributariaIbsCbsUseCase;
begin
  Result := ObterClassificacaoTributariaIbsCbsUseCase.Create(
    FiscalRepoContainer.GetInstance().ClassificacaoTributariaRepo
  );
end;

function FiscalCalculosFactory.CreateObterPercentualDeReducaoUseCase: IObterPercentualDeReducaoUseCase;
begin
  Result := ObterPercentualDeReducaoUseCase.Create(
    FiscalRepoContainer.GetInstance().PercentualReducaoRepo
  );
end;

function FiscalCalculosFactory.CreateObterTratamentoClassificacaoUseCase: IObterTratamentoClassificacaoUseCase;
begin
  Result := ObterTratamentoClassificacaoUseCase.Create(
    FiscalRepoContainer.GetInstance().TratamentoClassificacaoRepo
  );
end;

function FiscalCalculosFactory.CreateValidarIndicadorOperacaoUseCase: IValidarIndicadorOperacaoUseCase;
begin
  Result := ValidarIndicadorOperacaoUseCase.Create(
    FiscalRepoContainer.GetInstance().IndicadorOperacaoRepo
  );
end;

function FiscalCalculosFactory.CreateConsultarLocalOperacaoUseCase: IConsultarLocalOperacaoUseCase;
begin
  Result := ConsultarLocalOperacaoUseCase.Create(
    FiscalRepoContainer.GetInstance().IndicadorOperacaoRepo
  );
end;

function FiscalCalculosFactory.CreateConsultarIndicadorOperacaoUseCase: IConsultarIndicadorOperacaoUseCase;
begin
  Result := ConsultarIndicadorOperacaoUseCase.Create(
    FiscalRepoContainer.GetInstance().IndicadorOperacaoRepo,
    FiscalRepoContainer.GetInstance().NbsRepo
  );
end;

function FiscalCalculosFactory.CreateConsultarSituacoesClassificacoesPorNbsUseCase: IConsultarSituacoesClassificacoesPorNbsUseCase;
begin
  Result := ConsultarSituacoesClassificacoesPorNbsUseCase.Create(
    FiscalRepoContainer.GetInstance().IndicadorOperacaoRepo,
    FiscalRepoContainer.GetInstance().NbsRepo
  );
end;

function FiscalCalculosFactory.CreatePreparacaoCalculoService: IPreparacaoCalculoServiceInter;
var
  nbsAplService: INbsAplicavelService;
  ncmAplService: INcmAplicavelService;
  classTribService: IClassificacaoTributariaService;
begin
  ncmAplService := NcmAplicavelService.Create( FiscalRepoContainer.GetInstance().NcmAplicavelRepo );
  nbsAplService := NbsAplicavelService.Create( FiscalRepoContainer.GetInstance().NbsAplicavelRepo );
  classTribService := ClassificacaoTributariaService.Create(
    FiscalRepoContainer.GetInstance().ClassificacaoTributariaRepo
  );

  Result := PreparacaoCalculoServiceInter.Create(
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
end;

function FiscalCalculosFactory.CreateValidaTributacaoUseCase: IValidarTributacaoUseCase;
var
  preparacao: IPreparacaoCalculoServiceInter;
begin
  preparacao := CreatePreparacaoCalculoService();
  try
    Result := ValidarTributacaoItemUseCase.Create( preparacao );
  except
    //preparacao.FreeSafe();
  end;
end;

end.
