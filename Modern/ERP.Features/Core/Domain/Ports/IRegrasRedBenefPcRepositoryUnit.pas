unit IRegrasRedBenefPcRepositoryUnit;

interface

uses
  SysUtils, Classes,
  CacheableRepositoryUnit,
  RegraRedBenefPcEtdUnit,
  TipoComunsUnit;

type
  IRegrasRedBenefPcRepository = class(CacheableRepository)
  public
    function Incluir(Input: RegraRedBenefPcEtd): RegraRedBenefPcEtd; virtual; abstract;
    function Alterar(Input: RegraRedBenefPcEtd): RegraRedBenefPcEtd; virtual; abstract;
    function GetById(const Id: string): RegraRedBenefPcEtd; virtual; abstract;
    function ListarRegrasVigentes(EmpresaId: Integer; Data: TDate): RegraRedBenefPcEtdList; virtual; abstract;
    function ListarRegrasVigentesEAtual(const RegraId: string; Data: TDate): RegraRedBenefPcEtdList; virtual; abstract;
  end;

implementation

end.