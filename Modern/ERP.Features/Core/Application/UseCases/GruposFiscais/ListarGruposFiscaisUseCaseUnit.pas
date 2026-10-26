unit ListarGruposFiscaisUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  GrupoFiscalEtdUnit, IGruposFiscaisRepositoryUnit;

type
  ListarGruposFiscaisUseCaseBase = class(BaseUseCase)
  protected
    FGrupoFiscalRepo: IGruposFiscaisRepository;
    function Executar(const GrupoAtualId: string): GruposFiscaisEtd; virtual;
    function ExecutarComAnexoVinculado(): GruposFiscaisEtd;
  public
    constructor Create(const GrupoFiscalRepo: IGruposFiscaisRepository);
  end;

  IListarAtualeTodosGruposFiscaisUseCase = class(ListarGruposFiscaisUseCaseBase)
  public
    function Executar(const GrupoAtualId: string): GruposFiscaisEtd; override;
  end;

  IListarGruposFiscaisComAnexoVinculadoUseCase = class(ListarGruposFiscaisUseCaseBase)
  public
    function Executar(): GruposFiscaisEtd;
  end;

implementation

{ ListarGruposFiscaisPermitidasUseCase }

constructor ListarGruposFiscaisUseCaseBase.Create(const GrupoFiscalRepo: IGruposFiscaisRepository);
begin
  FGrupoFiscalRepo := GrupoFiscalRepo;
end;

function ListarGruposFiscaisUseCaseBase.Executar(const GrupoAtualId: string): GruposFiscaisEtd;
begin
  Result := FGrupoFiscalRepo.ListCurrentAndActives(GrupoAtualId);
end;

function ListarGruposFiscaisUseCaseBase.ExecutarComAnexoVinculado: GruposFiscaisEtd;
begin
  Result := FGrupoFiscalRepo.ListarComAnexoVinculado();
end;

{ IListarAtualeTodosGruposFiscaisUseCase }

function IListarAtualeTodosGruposFiscaisUseCase.Executar(
  const GrupoAtualId: string): GruposFiscaisEtd;
begin
  Result := inherited Executar(GrupoAtualId);
end;

{ IListarGruposFiscaisComAnexoVinculadoUseCase }

function IListarGruposFiscaisComAnexoVinculadoUseCase.Executar: GruposFiscaisEtd;
begin
  Result := ExecutarComAnexoVinculado();  
end;

end.
