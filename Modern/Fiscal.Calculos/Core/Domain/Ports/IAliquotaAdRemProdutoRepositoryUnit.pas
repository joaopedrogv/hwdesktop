unit IAliquotaAdRemProdutoRepositoryUnit;

interface

uses       
  CacheableRepositoryUnit,
  TipoTributoEnumUnit,
  DoubleNullableUnit,
  TipoComunsUnit,
  AliquotaAdRemModelUnit;

type
  IAliquotaAdRemProdutoRepository = class(CacheableRepository)
  public
    function ObterAliquotaAdRem(const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate): AliquotaAdRemModel; virtual; abstract;
  end;

implementation

end.
