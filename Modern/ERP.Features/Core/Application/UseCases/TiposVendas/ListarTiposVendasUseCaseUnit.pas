unit ListarTiposVendasUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  TipoVendaEtdUnit, ITiposVendasRepositoryUnit, TipoComunsUnit;

type   
  {$IFDEF INTF_ON}
  IListarTiposVendasPermitidasUseCase = interface
    ['{BE8DF90F-CBF7-46B7-B18E-780CBDA50093}']
    function Executar(const Tipos: TArrayString): TipoVendaEtdList;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  ListarTiposVendasUseCase = class(BaseUseCase, IListarTiposVendasPermitidasUseCase)
  {$ELSE}
  ListarTiposVendasUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FTipoVendaRepo: ITiposVendasRepository;
  public
    constructor Create(const TipoVendaRepo: ITiposVendasRepository);

    function Executar(const Tipos: TArrayString): TipoVendaEtdList;
  end;

implementation

{ ListarTiposVendasPermitidasUseCase }

constructor ListarTiposVendasUseCase.Create(const TipoVendaRepo: ITiposVendasRepository);
begin
  FTipoVendaRepo := TipoVendaRepo;
end;

function ListarTiposVendasUseCase.Executar(const Tipos: TArrayString): TipoVendaEtdList;
begin
  Result := FTipoVendaRepo.ListarPorTipo(Tipos);
end;

end.
