unit IRegistrarAjusteRedBenefPcUseCaseUnit;

interface

uses
  SysUtils, Classes;

type
  RegistrarAjusteRedBenefPcUseCaseInput = record
  private
    FChaveDFe: string;
    FEmpresaId: Integer;
  public
    class function Create(const ChaveDFe: string; EmpresaId: Integer): RegistrarAjusteRedBenefPcUseCaseInput ; static;
    property ChaveDFe: string read FChaveDFe;
    property EmpresaId: Integer read FEmpresaId;
  end;

  IRegistrarAjusteRedBenefPcUseCase = interface
    ['{EF7FD7E5-C602-437D-B37C-6C59DAD219A5}']
    procedure Executar(const Input: RegistrarAjusteRedBenefPcUseCaseInput);
  end;

implementation

{ RegistrarAjusteRedBenefPcUseCaseInput }

class function RegistrarAjusteRedBenefPcUseCaseInput.Create(const ChaveDFe: string;
  EmpresaId: Integer): RegistrarAjusteRedBenefPcUseCaseInput;
begin
  Result.FChaveDFe := ChaveDFe;
  Result.FEmpresaId := EmpresaId;
end;

end.
