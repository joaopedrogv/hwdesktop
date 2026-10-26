unit ResolverRegraFiscalIbsCbsUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IResolverRegraFiscalIbsCbsServiceUnit,
  ResolverRegraFiscalIbsCbsTypesUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  RegraFiscalIbsCbsEtdUnit;

type      
  IResolverRegraFiscalIbsCbsUseCase = class(BaseUseCase)
  public
    function Executar(const Input: ResolverRegraFiscalIbsCbsInput): RegraFiscalIbsCbsEtd; virtual; abstract; 
  end;

  ResolverRegraFiscalIbsCbsUseCase = class(IResolverRegraFiscalIbsCbsUseCase)
  private
    FResolvedorRegras: IResolverRegraFiscalIbsCbsService;
  public
    constructor Create(ResolvedorRegras: IResolverRegraFiscalIbsCbsService);

    function Executar(const Input: ResolverRegraFiscalIbsCbsInput): RegraFiscalIbsCbsEtd; override;
  end;

implementation

{ ResolverRegraFiscalIbsCbsUseCase }

constructor ResolverRegraFiscalIbsCbsUseCase.Create(
  ResolvedorRegras: IResolverRegraFiscalIbsCbsService
);
begin
  FResolvedorRegras := ResolvedorRegras;
end;

function ResolverRegraFiscalIbsCbsUseCase.Executar(const Input: ResolverRegraFiscalIbsCbsInput): RegraFiscalIbsCbsEtd;
begin
  Result := FResolvedorRegras.Executar( Input );
end;

end.
