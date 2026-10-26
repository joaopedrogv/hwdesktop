unit ISituacaoTributariaRepositoryUnit;

interface

uses
  TipoComunsUnit,
  CacheableRepositoryUnit,
  SituacaoTributariaEtdUnit,
  TipoTributoEnumUnit;

type
  ISituacaoTributariaRepository = class(CacheableRepository)
  public
    function ConsultarSituacaoTributariaPorCodigo(const CST: string; IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd; virtual; abstract;
  end;

implementation

end.
