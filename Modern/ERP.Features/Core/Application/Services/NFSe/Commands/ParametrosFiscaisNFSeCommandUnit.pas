unit ParametrosFiscaisNFSeCommandUnit;

interface

type
  ParametrosFiscaisNFSeCommand = record
  private
    FEmpresaId: Integer;
    FServicoId: Integer;
    FTomadorId: Integer;
    FIntermedId: Integer;
    FIsEmissaoPropria: Boolean;
  public
    class function Create(
      AEmpresaId: Integer;
      AServicoId: Integer;
      ATomadorId: Integer;
      AIntermedId: Integer;
      AIsEmissaoPropria: Boolean
    ): ParametrosFiscaisNFSeCommand; static;

    property EmpresaId: Integer read FEmpresaId;
    property ServicoId: Integer read FServicoId;
    property TomadorId: Integer read FTomadorId;
    property IntermedId: Integer read FIntermedId;
    property IsEmissaoPropria: Boolean read FIsEmissaoPropria;
  end;

implementation

{ ParametrosFiscaisNFSeCommand }

class function ParametrosFiscaisNFSeCommand.Create(
  AEmpresaId: Integer;
  AServicoId: Integer;
  ATomadorId: Integer;
  AIntermedId: Integer;
  AIsEmissaoPropria: Boolean
): ParametrosFiscaisNFSeCommand;
begin
  Result.FEmpresaId := AEmpresaId;
  Result.FServicoId := AServicoId;
  Result.FTomadorId := ATomadorId;
  Result.FIntermedId := AIntermedId;
  Result.FIsEmissaoPropria := AIsEmissaoPropria;
end;

end.
