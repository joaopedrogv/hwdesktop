unit ExcluirCancelamentoNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  INFSeRepositoryUnit,
  NFSeEventoResumoModelUnit;

type
  IExcluirCancelamentoNFSeUseCase = interface
    ['{892950A5-C48E-4972-A5FD-4874F3E15B05}']
    function Executar(const EventoId: string): NFSeEventoResumoModel;
  end;

  ExcluirCancelamentoNFSeUseCase = class(TInterfacedBaseUseCase, IExcluirCancelamentoNFSeUseCase)
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
  SysUtils, DateUtils,
  NFSeTypesUnit, NFSeTypesDisplayUnit, NFSeAtualizarSituacaoTypesUnit, EValidacaoNegocioUnit, NFSeResumoModelUnit,
  ITransactionUnit, NFSeAtualizarSituacaoEventoTypesUnit, NFSeEventoModelUnit;

{ ExcluirCancelamentoNFSeUseCase }

constructor ExcluirCancelamentoNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository
);
begin
  FConnection := Connection;
  FNFSeRepo := NFSeRepo;
end;

function ExcluirCancelamentoNFSeUseCase.Executar(const EventoId: string): NFSeEventoResumoModel;
var
  NfEve: NFSeEventoModel;
  excluirEvento: NFSeAtualizarSituacaoEventoModel;
  transaction: ITransaction;
begin
  transaction := FConnection.BeginTransaction();
  try try
    NfEve := FNFSeRepo.GetEventoNFSe( EventoId );

    if NfEve = nil then
      raise EValidacaoNegocio.Create('NFSe não encontrada');

    if NfEve.Evento = nil then
      raise EValidacaoNegocio.Create('Evento da NFSe não encontrado');

    if not (NfEve.Evento.Situacao in [ sdpsRascunho, sdpsRejeicao ]) then
      raise EValidacaoNegocio.CreateFmt(
        'Não é possivel excluir o Cancelamento com a situação do Evento atual = "%s"',
        [ SituacaoNFSeEnumStr[NfEve.Evento.Situacao] ]
      );
    excluirEvento := NFSeAtualizarSituacaoEventoModel.Create(NfEve.NFSeId, EventoId);

    Result := FNFSeRepo.AtualizarEventoNFSe( excluirEvento, sdpsExcluido );

    if Result.SituacaoEvento <> sdpsExcluido then
      raise EValidacaoNegocio.Create(
        'O sistema não conseguiu processa a solicitação. Contacte o suporte técnico por favor'
      );

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
    excluirEvento.Free();
  end;
end;

end.

