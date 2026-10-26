unit INotasConsumidorRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  UpdateDFeRedBenefPcCalcCommandsUnit, ContextoDocTribPcModelUnit, PeriodoEmpresaVOUnit;

type
  INotasConsumidorRepository = class(CacheableRepository)
  public
    function ObterContextoTribPISCOFINS(const ChaveNFe: string; EmpresaId: Integer): ContextoDocTribPcModel; overload; virtual; abstract;
    function ObterContextoTribPISCOFINS(const Input: PeriodoEmpresaVO): ContextoDocTribPcModelList; overload; virtual; abstract;
    procedure AtualizarRedBenefPcCalculado(const Input: UpdateDFeRedBenefPcCalcCommands); virtual; abstract;
  end;

implementation

end.
