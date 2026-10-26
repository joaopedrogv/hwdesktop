unit ITransferenciaCBSRepositoryUnit;

interface

uses
  TipoComunsUnit,
  CacheableRepositoryUnit,
  CurrencyNullableUnit;

type
  /// <summary>
  ///   Equivale a TransferenciaCBSRepository.java
  /// </summary>
  ITransferenciaCBSRepository = class(CacheableRepository)
  public
    /// <summary>
    ///   Equivale a getPercentualTransferencia
    /// </summary>
    function ObterPercentualTransferencia(Data: TDate): CurrencyNullable; virtual; abstract;
  end;

implementation

end.
