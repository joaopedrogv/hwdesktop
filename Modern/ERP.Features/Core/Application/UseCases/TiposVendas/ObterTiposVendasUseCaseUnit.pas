unit ObterTiposVendasUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  TipoVendaEtdUnit, ITiposVendasRepositoryUnit, TipoComunsUnit;

type       
  {$IFDEF INTF_ON}
  IObterTipoVendaPorIdUseCase = interface
    ['{1A6B5A53-8A84-45E5-A6BB-0B6AA0EB4474}']
    function Executar(Codigo: Integer; const Tipo: string): TipoVendaEtd;
  end;
  {$ENDIF}
           
  {$IFDEF INTF_ON}                                 
  ObterTiposVendasUseCase = class(BaseUseCase, IObterTipoVendaPorIdUseCase)
  {$ELSE}
  ObterTiposVendasUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FTipoVendaRepo: ITiposVendasRepository;
  public
    constructor Create(const TipoVendaRepo: ITiposVendasRepository);

    function Executar(Codigo: Integer; const Tipo: string): TipoVendaEtd;
  end;

implementation

{ ObterTiposVendasUseCase }

constructor ObterTiposVendasUseCase.Create(const TipoVendaRepo: ITiposVendasRepository);
begin
  FTipoVendaRepo := TipoVendaRepo;
end;

function ObterTiposVendasUseCase.Executar(Codigo: Integer; const Tipo: string): TipoVendaEtd;
begin
  Result := FTipoVendaRepo.GetById(Codigo, Tipo);
end;

end.
