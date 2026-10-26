unit IRedutorCompraGovernamentalRepositoryUnit;

interface

uses
  TipoComunsUnit,
  CacheableRepositoryUnit,
  CurrencyNullableUnit;

type
  /// <summary>
  ///   Equivale a RedutorCompraGovernamentalRepository.java
  /// </summary>
  IRedutorCompraGovernamentalRepository = class(CacheableRepository)
  public
    /// <summary>
    ///   Equivale a buscarValorRedutor
    /// </summary>
    function ObterValorRedutor(Data: TDate): CurrencyNullable; virtual; abstract;
  end;

implementation

end.
