unit IPercentualReducaoRepositoryUnit;

interface

uses          
  CacheableRepositoryUnit,
  TipoComunsUnit,
  PercentualReducaoEtdUnit,
  TipoTributoEnumUnit,
  CurrencyNullableUnit;

type
  IPercentualReducaoRepository = class(CacheableRepository)
  public
    function ObterporClassTribETributo(
      ClassificacaoTributariaId: Integer;
      TipoTributo: TipoTributoEnum;
      Data: TDate
    ): CurrencyNullable; virtual; abstract;
    // ERP
    function ObterporCClassTribETributo(
      const CClassTrib: string;
      TipoTributo: TipoTributoEnum;
      Data: TDate
    ): PercentualReducaoEtd; virtual; abstract;
  end;

implementation

end.
