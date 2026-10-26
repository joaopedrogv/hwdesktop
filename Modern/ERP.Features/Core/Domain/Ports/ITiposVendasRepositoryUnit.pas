unit ITiposVendasRepositoryUnit;

interface

uses  
  CacheableRepositoryUnit,
  TipoVendaEtdUnit, TipoComunsUnit;

type                                                                                                                                             
  {$IFDEF INTF_ON}
  ITiposVendasRepository = interface
    ['{18119035-9937-41C3-803F-F21CD8956AD2}']
    function ListarPorTipo(const Tipos: TArrayString): TipoVendaEtdList;
    function GetById(Codigo: Integer; const Tipo: string): TipoVendaEtd;
  end;
  {$ELSE}
  ITiposVendasRepository = class(CacheableRepository)
  public
    function ListarPorTipo(const Tipos: TArrayString): TipoVendaEtdList; virtual; abstract;
    function GetById(Codigo: Integer; const Tipo: string): TipoVendaEtd; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
