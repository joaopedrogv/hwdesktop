unit RemoverEventoDFeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  ISessionContextUnit,
  IEventosDFeRepositoryUnit,
  EventoDFeEtdUnit;

type
  IRemoverEventoDFeUseCase = interface
    ['{C28F6071-93A4-4FB5-8CC6-D17C8D9EAFB6}']
    procedure Executar(const AId: string);
  end;

  RemoverEventoDFeUseCase = class(TInterfacedObject, IRemoverEventoDFeUseCase)
  private
    FConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FEventosRepo: IEventosDFeRepository;
  public
    constructor Create(AConnection: IDataBaseConnection;
      ASession: ISessionContext; AEventosRepo: IEventosDFeRepository);
    procedure Executar(const AId: string);
  end;

implementation

uses
  SysUtils,
  ITransactionUnit,
  EValidacaoNegocioUnit,
  StatusRegistroEnumUnit;

{ RemoverEventoDFeUseCase }

constructor RemoverEventoDFeUseCase.Create(AConnection: IDataBaseConnection;
  ASession: ISessionContext; AEventosRepo: IEventosDFeRepository);
begin
  FConnection := AConnection;
  FSession := ASession;
  FEventosRepo := AEventosRepo;
end;

procedure RemoverEventoDFeUseCase.Executar(const AId: string);
var
  Header: EventoDFeEtd;
  Transacao: ITransaction;
begin
  Header := FEventosRepo.ObterPorId(AId, FSession.EmpresaId);

  if Header = nil then
    raise EValidacaoNegocio.Create('Evento DF-e não encontrado.');

  try
    if Header.Ativo = saLixeira then
      raise EValidacaoNegocio.Create('O evento já está na lixeira.');
  finally
    Header.Free;
  end;

  Transacao := FConnection.BeginTransaction();
  try
    try
      FEventosRepo.RemoverLogicamente(AId, FSession.EmpresaId);
      Transacao.Commit();
    except
      Transacao.Rollback();
      raise;
    end;
  finally
    Transacao.FreeTransaction();
  end;
end;

end.
