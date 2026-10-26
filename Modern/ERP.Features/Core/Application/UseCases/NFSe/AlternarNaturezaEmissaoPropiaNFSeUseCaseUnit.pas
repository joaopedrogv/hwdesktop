unit AlternarNaturezaEmissaoPropiaNFSeUseCaseUnit;

interface

uses
  NFSeModelUnit, ISessionContextUnit, IDataBaseConnectionUnit, INFSeRepositoryUnit, ITributosDFeRepositoryUnit;

type
  IAlternarNaturezaEmissaoPropiaNFSeUseCase = interface
    ['{11235928-C9A2-44EC-91F8-271D0E1BD3F8}']
    function Executar(const NFSeId: string): NFSeModel;
  end;
  AlternarNaturezaEmissaoPropiaNFSeUseCase = class(TInterfacedObject, IAlternarNaturezaEmissaoPropiaNFSeUseCase)
  private
    FSession: ISessionContext;
    FConnection: IDataBaseConnection;
    FNFSeRepo: INFSeRepository;
    FTributosDFeRepo: ITributosDFeRepository;
  public
    constructor Create(
      Session: ISessionContext;
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository
    );
    function Executar(const NFSeId: string): NFSeModel;
  end;

implementation

uses NFSeResumoModelUnit, NFSeTypesUnit, EValidacaoNegocioUnit, NFSeEtdUnit, ITransactionUnit, TributoDFeOrigemEnumUnit;

{ AlternarNaturezaEmissaoPropiaNFSeUseCase }

constructor AlternarNaturezaEmissaoPropiaNFSeUseCase.Create(
  Session: ISessionContext;
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository
);
begin
  FSession := Session;
  FConnection := Connection;
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
end;

function AlternarNaturezaEmissaoPropiaNFSeUseCase.Executar(const NFSeId: string): NFSeModel;
var
  nfse: NFSeEtd;
  transacao: ITransaction;
begin
  transacao := FConnection.BeginTransaction();
  nfse := FNFSeRepo.GetNFSe(NFSeId, FSession.EmpresaId);
  try try

    if nfse = nil then
      raise EValidacaoNegocio.Create('NFSe não encontrada com o Id informado');

    if not nfse.IsEmissaoPropria then
      raise EValidacaoNegocio.Create('NFSe não é de emissão própria');

    if not nfse.EstaEmDigitacao then
      raise EValidacaoNegocio.Create('NFSe não está em Digitação ("Rascunho" ou "Rejeitada")');

    if nfse.NaturezaEmissao = nemtPrestadorWS then
      nfse.NaturezaEmissao := nemtPrestadorPortal
    else
      nfse.NaturezaEmissao := nemtPrestadorWS;

    if nfse.IsEmissaoSistema then
    begin
      nfse.NNFSe.SetNull();
      nfse.DhProc.SetNull();
      nfse.ChaveNFSe.SetNull();
    end;

    Result := NFSeModel.Create(
      FNFSeRepo.AlterarNFSeEmitidaNoPortal(nfse),
      FTributosDFeRepo.GetById(NFSeId, tdfoNFSe)
    );
    transacao.Commit();

  except
    transacao.Rollback();
    Exit;
  end;
  finally
    nfse.Free();
    transacao.Free();
  end;
end;

end.
