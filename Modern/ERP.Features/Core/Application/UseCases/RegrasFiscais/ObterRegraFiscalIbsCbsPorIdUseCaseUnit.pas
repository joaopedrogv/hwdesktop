unit ObterRegraFiscalIbsCbsPorIdUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  RegraFiscalIbsCbsEtdUnit;

type 
  {$IFDEF INTF_ON}
  IObterRegraFiscalIbsCbsPorIdUseCase = interface
    ['{60784EAF-917D-4AAF-AB91-C0C95EBD1F19}']
    function Executar(const Id: string): RegraFiscalIbsCbsEtd;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  ObterRegraFiscalIbsCbsPorIdUseCase = class(BaseUseCase, IObterRegraFiscalIbsCbsPorIdUseCase)
  {$ELSE}
  ObterRegraFiscalIbsCbsPorIdUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
  public
    constructor Create(const RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository);

    function Executar(const Id: string): RegraFiscalIbsCbsEtd;
  end;

implementation

{ ObterRegraFiscalIbsCbsPorIdUseCase }

constructor ObterRegraFiscalIbsCbsPorIdUseCase.Create(const RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository);
begin
  FRegrasFiscaisIbsCbsRepo := RegrasFiscaisIbsCbsRepo;
end;

function ObterRegraFiscalIbsCbsPorIdUseCase.Executar(const Id: string): RegraFiscalIbsCbsEtd;
begin
  Result := FRegrasFiscaisIbsCbsRepo.GetById(Id);
end;

end.
