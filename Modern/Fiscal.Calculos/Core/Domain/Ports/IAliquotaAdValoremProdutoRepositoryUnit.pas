unit IAliquotaAdValoremProdutoRepositoryUnit;

interface

uses                                       
  CacheableRepositoryUnit,
  TipoTributoEnumUnit,
  CurrencyNullableUnit,
  TipoComunsUnit;

type
  IAliquotaAdValoremProdutoRepository = class(CacheableRepository)
  public
    function ObterAliquota(const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate): CurrencyNullable; virtual; abstract;
  end;

implementation

end.
