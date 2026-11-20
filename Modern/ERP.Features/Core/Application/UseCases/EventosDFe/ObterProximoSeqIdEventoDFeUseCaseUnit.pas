unit ObterProximoSeqIdEventoDFeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  ISessionContextUnit,
  IEventosDFeRepositoryUnit;

type
  IObterProximoSeqIdEventoDFeUseCase = interface
    ['{F2B4C9DA-3E51-4A72-8B63-0C1D2E3F4A55}']
    function Executar: Integer;
  end;

  ObterProximoSeqIdEventoDFeUseCase = class(TInterfacedObject,
    IObterProximoSeqIdEventoDFeUseCase)
  private
    FSession: ISessionContext;
    FEventosRepo: IEventosDFeRepository;
  public
    constructor Create(ASession: ISessionContext;
      AEventosRepo: IEventosDFeRepository);
    function Executar: Integer;
  end;

implementation

{ ObterProximoSeqIdEventoDFeUseCase }

constructor ObterProximoSeqIdEventoDFeUseCase.Create(ASession: ISessionContext;
  AEventosRepo: IEventosDFeRepository);
begin
  FSession := ASession;
  FEventosRepo := AEventosRepo;
end;

function ObterProximoSeqIdEventoDFeUseCase.Executar: Integer;
begin
  Result := FEventosRepo.ObterProximoSeqId(FSession.EmpresaId);
end;

end.
