unit IAliquotaPadraoRepositoryUnit;

interface

uses                       
  CacheableRepositoryUnit,
  TipoComunsUnit, TipoTributoEnumUnit, IntegerNullableUnit, AliquotaResultadoModelUnit;

type
  IAliquotaPadraoRepository = class(CacheableRepository)
  public
    function ObterAliquota(
      TipoTributo: TipoTributoEnum; const CUF, CMun: IntegerNullable; Data: TDate
    ): AliquotaResultadoModel; virtual; abstract;
  end;

implementation

end.
