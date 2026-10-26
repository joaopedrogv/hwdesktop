unit IAnexosRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  TipoComunsUnit,
  TipoTributoEnumUnit,
  AnexoEtdUnit;

type
  IAnexosRepository = class(CacheableRepository)
  public
    function ListarAnexos(TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd; virtual; abstract;
    function ListarAnexosCompativeisComEstoque(EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd; virtual; abstract;
    function ListarAnexosIbsCbs(): AnexosEtd; virtual; abstract;
    function ListarAnexosImpostoSeletivo(): AnexosEtd; virtual; abstract;
    function ListarAnexosIbsCbsCompativeisComEstoque(): AnexosEtd; virtual; abstract;
    function ListarAnexosImpostoSeletivoCompativeisComEstoque(): AnexosEtd; virtual; abstract;
  end;

implementation

end.
