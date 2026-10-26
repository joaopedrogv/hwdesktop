unit ObterNFSeOSsUseCaseUnit;

interface

uses NFSeOSEtdUnit, INFSeRepositoryUnit;

type
  IObterNFSeOSsUseCase = interface
    ['{7B0AE3D1-B379-47D6-9620-29660B12D6CC}']
    function Executar(const NFSeId: string): NFSeOSEtdList;
  end;

  ObterNFSeOSsUseCase = class(TInterfacedObject, IObterNFSeOSsUseCase)
  private
    FNFSeRepo: INFSeRepository;
  public
    constructor Create(NFSeRepo: INFSeRepository);
    function Executar(const NFSeId: string): NFSeOSEtdList;
  end;

implementation

{ ObterNFSeOSsUseCase }

constructor ObterNFSeOSsUseCase.Create(NFSeRepo: INFSeRepository);
begin
  FNFSeRepo := NFSeRepo;
end;

function ObterNFSeOSsUseCase.Executar(const NFSeId: string): NFSeOSEtdList;
begin
  Result := FNFSeRepo.ListarRelacionamento(NFSeId);
end;

end.
