unit ObterOperacaoFiscalIbsCbsPorIdUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  OperacaoFiscalIbsCbsEtdUnit;

type       
  {$IFDEF INTF_ON}
  IObterOperacaoFiscalIbsCbsPorIdUseCase = interface
    ['{1C866EB6-6350-45CE-9CF1-6B933C3169B8}']
    function Executar(const Id: string): OperacaoFiscalIbsCbsEtd;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  ObterOperacaoFiscalIbsCbsPorIdUseCase = class(BaseUseCase, IObterOperacaoFiscalIbsCbsPorIdUseCase)
  {$ELSE}
  ObterOperacaoFiscalIbsCbsPorIdUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
  public
    constructor Create(const OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository);

    function Executar(const Id: string): OperacaoFiscalIbsCbsEtd;
  end;

implementation

{ ObterOperacaoFiscalIbsCbsPorIdUseCase }

constructor ObterOperacaoFiscalIbsCbsPorIdUseCase.Create(const OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository);
begin
  FOperacoesFiscaisIbsCbsRepo := OperacoesFiscaisIbsCbsRepo;
end;

function ObterOperacaoFiscalIbsCbsPorIdUseCase.Executar(const Id: string): OperacaoFiscalIbsCbsEtd;
begin
  Result := FOperacoesFiscaisIbsCbsRepo.GetById(Id);
end;

end.
