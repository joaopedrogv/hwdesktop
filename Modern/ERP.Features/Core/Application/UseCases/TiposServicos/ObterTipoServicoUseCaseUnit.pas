unit ObterTipoServicoUseCaseUnit;

interface

uses
  TipoServicoEtdUnit,
  ITiposServicosRepositoryUnit;

type
  IObterTipoServicoPorIdUseCase = interface
    ['{9BA01DEC-DAD2-4DF2-921C-27E62B259DC8}']
    function Executar(Codigo: Integer): TipoServicoEtd;
  end;

  ObterTipoServicoUseCase = class(TInterfacedObject, IObterTipoServicoPorIdUseCase)
  private
    FTiposServicosRepo: ITiposServicosRepository;
  public
    constructor Create(const TiposServicosRepo: ITiposServicosRepository);

    function Executar(Codigo: Integer): TipoServicoEtd;
  end;

implementation

{ ObterTipoServicoUseCase }

constructor ObterTipoServicoUseCase.Create(const TiposServicosRepo: ITiposServicosRepository);
begin
  FTiposServicosRepo := TiposServicosRepo;
end;

function ObterTipoServicoUseCase.Executar(Codigo: Integer): TipoServicoEtd;
begin
  Result := FTiposServicosRepo.GetById(Codigo);
end;

end.
