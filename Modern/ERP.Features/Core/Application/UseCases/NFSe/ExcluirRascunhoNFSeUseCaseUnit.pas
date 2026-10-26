unit ExcluirRascunhoNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  INFSeRepositoryUnit,
  IAtualizarSituacaoNFSeServiceUnit;

type
  IExcluirRascunhoNFSeUseCase = interface
    ['{91E5D1FD-323F-4301-A925-F75011672675}']
    procedure Executar(const NFSeId: string; EmpresaId: Integer);
  end;

  ExcluirRascunhoNFSeUseCase = class(TInterfacedBaseUseCase, IExcluirRascunhoNFSeUseCase)
  private
    FNFSeRepo: INFSeRepository;
    FAtualizarSitNFSe: IAtualizarSituacaoNFSeService;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      AtualizarSitNFSe: IAtualizarSituacaoNFSeService
    );
    procedure Executar(const NFSeId: string; EmpresaId: Integer);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, NFSeResumoModelUnit, NFSeTypesUnit, NFSeAtualizarSituacaoTypesUnit, ITransactionUnit,
  NFSeOSEtdUnit;

{ ExcluirRascunhoNFSeUseCase }

constructor ExcluirRascunhoNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository;
  AtualizarSitNFSe: IAtualizarSituacaoNFSeService
);
begin
  inherited Create(Connection);
  FNFSeRepo := NFSeRepo;
  FAtualizarSitNFSe := AtualizarSitNFSe;
end;

procedure ExcluirRascunhoNFSeUseCase.Executar(const NFSeId: string; EmpresaId: Integer);
var
  transaction: ITransaction;
  nfseDb: NFSeResumoModel;
begin
  transaction := FConnection.BeginTransaction();
  try try
    nfseDb := FNFSeRepo.GetResumoNFSe(NFSeId);

    if nfseDb.Situacao = sdpsExcluido then
      raise EValidacaoNegocio.Create('Registro não encontrado');

    if not (nfseDb.Situacao in [ sdpsRascunho, sdpsRejeicao ]) then
      raise EValidacaoNegocio.Create('NFSe não pode se excluída na situação atual');

    FAtualizarSitNFSe.ExecutarExclusao( AtualizarSituacaoNFSeInput.Create(NFSeId, EmpresaId, sdpsExcluido ));

    transaction.Commit();

  except on E: Exception do
    begin
      transaction.Rollback();
      raise;
    end;
  end;
  finally
    transaction.Free();
  end;
end;

end.
