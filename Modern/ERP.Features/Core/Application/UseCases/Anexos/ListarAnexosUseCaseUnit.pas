unit ListarAnexosUseCaseUnit;

interface

uses
  AnexoEtdUnit,
  TipoComunsUnit,
  TipoTributoEnumUnit,
  IAnexosRepositoryUnit;

type
  IListarAnexosUseCase = interface
    ['{F0C1B25D-1256-4462-A986-549AD9991A0A}']
    function Executar(TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd;
  end;

  IListarAnexosCompativeisUseCase = interface
    function Executar(EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd;
  end;

  ListarAnexosUseCase = class(TInterfacedObject, IListarAnexosUseCase, IListarAnexosCompativeisUseCase)
  private
    FAnexosRepo: IAnexosRepository;
  public
    constructor Create(const AnexosRepo: IAnexosRepository);

    function Executar(TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd; overload;
    function Executar(EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd; overload;
  end;

implementation

{ ListarMunicipiosPermitidasUseCase }

constructor ListarAnexosUseCase.Create(const AnexosRepo:
  IAnexosRepository);
begin
  FAnexosRepo := AnexosRepo;
end;


function ListarAnexosUseCase.Executar(TiposTributos: TipoTributoEnumSet;
  Data: TDate): AnexosEtd;
begin
  Result := FAnexosRepo.ListarAnexos( TiposTributos, Data );
end;

function ListarAnexosUseCase.Executar(EmpresaId: Integer;
  TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd;
begin
  Result := FAnexosRepo.ListarAnexosCompativeisComEstoque( EmpresaId, TiposTributos, Data );
end;

end.
