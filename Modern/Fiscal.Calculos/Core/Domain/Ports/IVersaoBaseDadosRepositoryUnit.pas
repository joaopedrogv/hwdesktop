unit IVersaoBaseDadosRepositoryUnit;

interface

uses
  VersaoSerproEtdUnit, CacheableRepositoryUnit;

type
  /// <summary>
  ///   Contrato que equivale a VersaoBaseDadosRepository.java
  /// </summary>
  IVersaoBaseDadosRepository = class(CacheableRepository)
  public
    /// <summary>
    ///   Equivale a findTopByOrderByIdDesc
    /// </summary>
    function GetUltimaVersao(): VersaoSerproEtd; virtual; abstract;
  end;

implementation

end.
