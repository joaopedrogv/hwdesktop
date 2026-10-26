unit ListarMunicipiosUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  MunicipioEtdUnit, IMunicipiosRepositoryUnit;

type        
  {$IFDEF INTF_ON}
  IListarTodosMunicipiosUseCase = interface
    ['{F9B4A593-71A1-4495-8B59-DC29241C4ECE}']
    function Executar(): MunicipiosEtd;
  end;
  {$ENDIF}

  {
  IListarMunicipiosPorUFSiglaUseCase = interface
    GUID
    function Executar(const UF: string): MunicipiosEtd;
  end;

  IListarMunicipiosPorUFIbgeUseCase = interface
    GUID
    function Executar(const CodigoUF: Integer): MunicipiosEtd;
  end;
  }
             
  {$IFDEF INTF_ON}
  ListarMunicipiosUseCase = class(BaseUseCase, IListarTodosMunicipiosUseCase {, IListarMunicipiosPorUFSiglaUseCase, IListarMunicipiosPorUFIbgeUseCase })
  {$ELSE}
  ListarMunicipiosUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FMunicipiosRepo: IMunicipiosRepository;
  public
    constructor Create(const EmpresaRepo: IMunicipiosRepository);

    function Executar(): MunicipiosEtd; overload;
  end;

implementation

{ ListarMunicipiosPermitidasUseCase }

constructor ListarMunicipiosUseCase.Create(const EmpresaRepo:
  IMunicipiosRepository);
begin
  FMunicipiosRepo := EmpresaRepo;
end;

function ListarMunicipiosUseCase.Executar: MunicipiosEtd;
begin
  Result := FMunicipiosRepo.ListarTodos();
end;

end.
