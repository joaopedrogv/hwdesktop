unit ReverterCancelamentoPortalNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  INFSeRepositoryUnit,
  NFSeEventoResumoModelUnit;

type
  IReverterCancelamentoPortalNFSeUseCase = interface
    ['{0EF21767-908A-4294-BF10-A6BDA0F1A817}']
    function Executar(const EventoId: string): NFSeEventoResumoModel;
  end;

  ReverterCancelamentoPortalNFSeUseCase = class(TInterfacedBaseUseCase, IReverterCancelamentoPortalNFSeUseCase)
  private
    FNFSeRepo: INFSeRepository;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository
    );
    function Executar(const EventoId: string): NFSeEventoResumoModel;
  end;

implementation

uses
  SysUtils, DateUtils, ITransactionUnit,
  NFSeEventoModelUnit, NFSeTypesUnit, NFSeAtualizarSituacaoTypesUnit, EValidacaoNegocioUnit, NFSeResumoModelUnit;

{ ReverterCancelamentoPortalNFSeUseCase }

constructor ReverterCancelamentoPortalNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository
);
begin
  FConnection := Connection;
  FNFSeRepo := NFSeRepo;
end;

function ReverterCancelamentoPortalNFSeUseCase.Executar(const EventoId: string): NFSeEventoResumoModel;
var
  NfEve: NFSeEventoModel;
  NfResumo: NFSeResumoModel;
  transaction: ITransaction;
begin
  transaction := FConnection.BeginTransaction();
  try try
    NfEve := FNFSeRepo.GetEventoNFSe( EventoId );

    if NfEve = nil then
      raise EValidacaoNegocio.Create('NFSe não encontrada');

    if NfEve.Evento = nil then
      raise EValidacaoNegocio.Create('Evento da NFSe não encontrado');

    if NfEve.Situacao <> sdpsCancelada then
      raise EValidacaoNegocio.Create('Só é possivel reverter o Cancelamento de uma NFSe com situação = "Cancelada"');

    if NfEve.Evento.Situacao <> sdpsAutorizada then
      raise EValidacaoNegocio.Create('Só é possivel reverter um Cancelamento com situação = "Autorizada"');

    if NfEve.OrigemCanc <> ocnPortalWebSite then
      raise EValidacaoNegocio.Create(
        'Só é possivel reverter um Cancelamento efetuado fora do sistema, no Portal da Prefeitura'
      );

    NfResumo := FNFSeRepo.AtualizarNFSe( NFSeAtualizarReverterCancelamentoPortalModel.Create( NfEve.NFSeId, EventoId ));

    if NfResumo.Situacao <> sdpsAutorizada then
      raise EValidacaoNegocio.Create(
        'O sistema não conseguiu processa a solicitação. Contacte o suporte técnico por favor'
      );

    Result := FNFSeRepo.GetResumoEventoNFSe( NfEve.NFSeId, EventoId );

    transaction.Commit();

  except on E: Exception do
    begin
      transaction.Rollback();
      raise;
    end;
  end;
  finally
    transaction.Free();
    NfEve.Free();
  end;
end;

end.

