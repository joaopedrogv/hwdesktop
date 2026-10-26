unit IAliquotaAdValoremServicoRepositoryUnit;

interface

uses                 
  CacheableRepositoryUnit,
  TipoTributoEnumUnit,
  CurrencyNullableUnit,
  TipoComunsUnit;

type
  IAliquotaAdValoremServicoRepository = class(CacheableRepository)
  public
    function ObterAliquotaAdValorem(
      const Nbs: string; TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate
    ): CurrencyNullable; virtual; abstract;
    function ObterAliquotaAdValoremPorClassificacaoTributaria(
      TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate
    ): CurrencyNullable; virtual; abstract;
  end;

implementation

end.
