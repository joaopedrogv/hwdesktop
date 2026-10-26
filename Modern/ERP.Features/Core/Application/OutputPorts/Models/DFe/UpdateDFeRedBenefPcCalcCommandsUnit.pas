unit UpdateDFeRedBenefPcCalcCommandsUnit;

interface

type
  UpdateDFeRedBenefPcCalcCommands = record
  private
    FEmpresaId: Integer;
    FDFeId: Integer;
    FRedBenefCalculado: Boolean;
  public
    class function Create(
      ADFeId, AEmpresaId: Integer; ARedBenefCalculado: Boolean
    ): UpdateDFeRedBenefPcCalcCommands; static;

    property DFeId: Integer read FDFeId;
    property EmpresaId: Integer read FEmpresaId;
    property RedBenefCalculado: Boolean read FRedBenefCalculado;
  end;

implementation

{ UpdateDFeRedBenefPcCalcCommands }

class function UpdateDFeRedBenefPcCalcCommands.Create(
  ADFeId, AEmpresaId: Integer; ARedBenefCalculado: Boolean
): UpdateDFeRedBenefPcCalcCommands;
begin
  Result.FDFeId := ADFeId;
  Result.FEmpresaId := AEmpresaId;
  Result.FRedBenefCalculado := ARedBenefCalculado;
end;

end.
