unit ReverterAutorizacaoPortalNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  INFSeRepositoryUnit,
  ITributosDFeRepositoryUnit,
  NFSeModelUnit, IAtualizarSituacaoNFSeServiceUnit;

type
  IReverterAutorizacaoPortalNFSeUseCase = interface
    ['{CEE1E822-E19B-4AF4-91A8-FD1F283E2AE2}']
    function Executar(const NFSeId: string; EmpresaId: Integer): NFSeModel;
  end;

  ReverterAutorizacaoPortalNFSeUseCase = class(TInterfacedBaseUseCase, IReverterAutorizacaoPortalNFSeUseCase)
  private
    FNFSeRepo: INFSeRepository;    
    FTributosDFeRepo: ITributosDFeRepository;
    FAtualizarSituacaoNFSe: IAtualizarSituacaoNFSeService;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      AtualizarSituacaoNFSe: IAtualizarSituacaoNFSeService
    );
    function Executar(const NFSeId: string; EmpresaId: Integer): NFSeModel;
  end;

implementation

uses
  SysUtils, DateUtils, ITransactionUnit,
  NFSeEventoModelUnit, NFSeTypesUnit, NFSeAtualizarSituacaoTypesUnit, EValidacaoNegocioUnit, NFSeResumoModelUnit,
  TributoDFeOrigemEnumUnit, NFSeEtdUnit;

{ ReverterAutorizacaoPortalNFSeUseCase }

constructor ReverterAutorizacaoPortalNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  AtualizarSituacaoNFSe: IAtualizarSituacaoNFSeService
);
begin
  FConnection := Connection;
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FAtualizarSituacaoNFSe := AtualizarSituacaoNFSe;
end;

function ReverterAutorizacaoPortalNFSeUseCase.Executar(const NFSeId: string; EmpresaId: Integer): NFSeModel;
var
  NfResumo: NFSeResumoModel;
  transaction: ITransaction;
  NFSe: NFSeEtd;
begin
  NFSe := nil;
  transaction := FConnection.BeginTransaction();
  try try
    NfResumo := FNFSeRepo.GetResumoNFSe( NFSeId );

    if NfResumo.Situacao = sdpsExcluido then
      raise EValidacaoNegocio.Create('NFSe não encontrada');

    if NfResumo.Situacao <> sdpsAutorizada then
      raise EValidacaoNegocio.Create('Só é possivel reverter a Autorização de uma NFSe com situação = "Autorizada"');

    if NfResumo.NaturezaEmissao = nemtPrestadorWS then
      raise EValidacaoNegocio.Create(
        'Só é possivel reverter uma Autorização que foi efetuada do sistema, no Portal Nacional/Prefeitura'
      );

    FAtualizarSituacaoNFSe.ExecutarReversaoAutorizacaoViaPortal( NFSeId, EmpresaId );

    NFSe := FNFSeRepo.GetNFSe( NFSeId, EmpresaId );
    {
    NfResumo := FNFSeRepo.AtualizarNFSe(
      NFSeAtualizarReverterAutorizacaoPortalModel.Create( NFSeId, EmpresaId )
    );
    }

    if NFSe.Situacao <> sdpsRascunho then
      raise EValidacaoNegocio.Create(
        'O sistema não conseguiu processar a solicitação. Contacte o suporte técnico por favor'
      );

    Result := NFSeModel.Create( NFSe, FTributosDFeRepo.GetById(NFSeId, tdfoNFSe) );
    NFSe := nil;

    transaction.Commit();

  except on E: Exception do
    begin
      transaction.Rollback();
      raise;
    end;
  end;
  finally
    transaction.Free();
    NFSe.Free();
  end;
end;

end.

