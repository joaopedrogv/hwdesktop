unit ResolverRegraFiscalIbsCbsUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IResolverRegraFiscalIbsCbsServiceUnit,
  ResolverRegraFiscalIbsCbsTypesUnit;

type
  IResolverRegraFiscalIbsCbsUseCase = class(BaseUseCase)
  public
    function Executar(const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsResult; virtual; abstract;
    function Analisar(const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsAnalise; virtual; abstract;
  end;

  ResolverRegraFiscalIbsCbsUseCase = class(IResolverRegraFiscalIbsCbsUseCase)
  private
    FResolvedorRegras: IResolverRegraFiscalIbsCbsService;
  public
    constructor Create(ResolvedorRegras: IResolverRegraFiscalIbsCbsService);

    function Executar(const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsResult; override;
    function Analisar(const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsAnalise; override;
  end;

implementation

{ ResolverRegraFiscalIbsCbsUseCase }

constructor ResolverRegraFiscalIbsCbsUseCase.Create(
  ResolvedorRegras: IResolverRegraFiscalIbsCbsService
);
begin
  FResolvedorRegras := ResolvedorRegras;
end;

function ResolverRegraFiscalIbsCbsUseCase.Executar(
  const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsResult;
begin
  Result := FResolvedorRegras.Executar(Input);
end;

function ResolverRegraFiscalIbsCbsUseCase.Analisar(
  const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsAnalise;
begin
  Result := FResolvedorRegras.Analisar(Input);
end;

end.
