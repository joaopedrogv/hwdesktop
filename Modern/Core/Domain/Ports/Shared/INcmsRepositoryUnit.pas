unit INcmsRepositoryUnit;

interface

uses               
  CacheableRepositoryUnit,
  NcmEtdUnit,
  TipoComunsUnit,
  TipoTributoEnumUnit;

type
  INcmsRepository = class(CacheableRepository)
  public
    function ObterNcm(const Ncm: string; Data: TDate): NcmEtd; virtual; abstract;
    function ObterNcmMaisRecente(const Ncm: string): NcmEtd; virtual; abstract;
    //function ListarNcmsEstoqueCompativeisComAnexo(EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): NcmsEtd; virtual; abstract;
  end;

implementation

end.
