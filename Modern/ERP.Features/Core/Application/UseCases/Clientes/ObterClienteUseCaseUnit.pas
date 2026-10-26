unit ObterClienteUseCaseUnit;

interface

uses
  ClienteEtdUnit,
  IClientesRepositoryUnit;

type
  IObterClientePorIdUseCase = interface
    ['{96880FC0-771C-4ABD-AE10-5D7AA2FEA142}']
    function Executar(Codigo, EmpresaId: Integer): ClienteEtd;
  end;

  ObterClienteUseCase = class(TInterfacedObject, IObterClientePorIdUseCase)
  private
    FClientesRepo: IClientesRepository;
  public
    constructor Create(const ClientesRepo: IClientesRepository);

    function Executar(Codigo, EmpresaId: Integer): ClienteEtd;
  end;

implementation

{ ObterClienteUseCase }

constructor ObterClienteUseCase.Create(const ClientesRepo: IClientesRepository);
begin
  FClientesRepo := ClientesRepo;
end;

function ObterClienteUseCase.Executar(Codigo, EmpresaId: Integer): ClienteEtd;
begin
  Result := FClientesRepo.GetById(Codigo, EmpresaId);
end;

end.
