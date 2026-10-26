unit ITratamentosTributariosRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  TratamentoTributarioEtdUnit;

type
  ITratamentosTributariosRepository = class(CacheableRepository)
  public
    function ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd; virtual; abstract;
  end;

implementation

end.
