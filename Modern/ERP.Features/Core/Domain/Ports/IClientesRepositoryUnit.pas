unit IClientesRepositoryUnit;

interface      

uses  
  CacheableRepositoryUnit,
  ClienteEtdUnit;

type
  IClientesRepository = class(CacheableRepository)
  public
    function GetById(Codigo, EmpresaId: Integer): ClienteEtd; virtual; abstract;
  end;

implementation

end.
