unit IAliquotaReferenciaRepositoryUnit;

interface

uses          
  CacheableRepositoryUnit,
  TipoComunsUnit,
  CurrencyNullableUnit,
  TipoTributoEnumUnit;

type
  IAliquotaReferenciaRepository = class(CacheableRepository)
  public
    function ObterPorTipoTributo(TipoTributo: TipoTributoEnum; Data: TDate): CurrencyNullable; virtual; abstract;
  end;

implementation

end.
