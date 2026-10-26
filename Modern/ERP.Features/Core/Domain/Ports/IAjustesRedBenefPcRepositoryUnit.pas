unit IAjustesRedBenefPcRepositoryUnit;

interface

uses
  SysUtils, Classes,
  CacheableRepositoryUnit,
  AjusteRedBenefPcEtdUnit,
  AjusteRedBenefPcModelUnit,
  TipoComunsUnit, PeriodoMultiEmpresaVOUnit;

type
  IAjustesRedBenefPcRepository = class(CacheableRepository)
  public
    function Incluir(Input: AjusteRedBenefPcModel): AjusteRedBenefPcModel; overload; virtual; abstract;
    procedure Incluir(Input: AjusteRedBenefPcModelList) overload; virtual; abstract;
    function Alterar(Input: AjusteRedBenefPcModel): AjusteRedBenefPcModel; overload; virtual; abstract;
    procedure Alterar(Input: AjusteRedBenefPcModelList) overload; virtual; abstract;
    procedure Excluir(const Id: string; EmpresaId: Integer); overload; virtual; abstract;
    procedure Excluir(const Ids: TArrayString; EmpresaId: Integer); overload; virtual; abstract;
    function GetById(const Id: string): AjusteRedBenefPcModel; virtual; abstract;
    function ListarPorDFe(const ChaveDFe: string; EmpresaId: Integer): AjusteRedBenefPcModelList; virtual; abstract;
    function ListarPorPeriodo(const Input: PeriodoMultiEmpresaVO): AjusteRedBenefPcModelList; virtual; abstract;
  end;

implementation

end.