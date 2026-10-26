unit ListarEmpresasUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  EmpresaEtdUnit, IEmpresasRepositoryUnit;

type    
  {$IFDEF INTF_ON}
  IListarEmpresasPermitidasUseCase = interface
    ['{DD11B08C-9A96-433C-9094-3346503199BD}']
    function Executar(const Usuario: string): EmpresasEtd;
  end;

  IListarTodasEmpresasUseCase = interface
    ['{DA160A88-D21B-415C-951F-9CB1D6445B38}']
    function Executar(): EmpresasEtd;
  end;
  {$ENDIF}
                                         
  {$IFDEF INTF_ON}
  ListarEmpresasUseCase = class(BaseUseCase, IListarEmpresasPermitidasUseCase, IListarTodasEmpresasUseCase)
  {$ELSE}
  ListarEmpresasUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FEmpresaRepo: IEmpresasRepository;
  public
    constructor Create(const EmpresaRepo: IEmpresasRepository);

    function Executar(const Usuario: string): EmpresasEtd; overload;
    function Executar(): EmpresasEtd; overload;
  end;

implementation

{ ListarEmpresasPermitidasUseCase }

constructor ListarEmpresasUseCase.Create(const EmpresaRepo: IEmpresasRepository);
begin
  FEmpresaRepo := EmpresaRepo;
end;

function ListarEmpresasUseCase.Executar(const Usuario: string): EmpresasEtd;
begin
  Result := FEmpresaRepo.ListarPorUsuarioPermitido(Usuario);
end;

function ListarEmpresasUseCase.Executar: EmpresasEtd;
begin
  Result := FEmpresaRepo.ListarTodas();
end;

end.
