unit IMunicipiosRepositoryUnit;

interface

uses             
  CacheableRepositoryUnit,
  MunicipioEtdUnit;

type                                       
  {$IFDEF INTF_ON}
  IMunicipiosRepository = interface
    ['{F70AEF8A-D473-4FF5-AC41-79E1FAAEFD97}']
    function ObterMunicipio(Codigo: Integer): MunicipioEtd;
    function ListarTodos(): MunicipiosEtd;
  end;
  {$ELSE}
  IMunicipiosRepository = class(CacheableRepository)
  public
    function ObterMunicipio(Codigo: Integer): MunicipioEtd; virtual; abstract;
    function ListarTodos(): MunicipiosEtd; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
