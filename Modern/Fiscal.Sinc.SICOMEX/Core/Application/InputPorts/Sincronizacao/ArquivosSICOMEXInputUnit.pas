unit ArquivosSICOMEXInputUnit;

interface

type
  ArquivosSICOMEXInput = record
  private
    FHistorico: string;
    FFuturo: string;
    FVigente: string;
  public
    class function Create(
      const Historico, Futuro, Vigente: string
    ): ArquivosSICOMEXInput; static;

    property Historico: string read FHistorico;
    property Vigente: string read FVigente;
    property Futuro: string read FFuturo;
  end;

implementation

{ ArquivosSICOMEXInput }

class function ArquivosSICOMEXInput.Create(
  const Historico, Futuro, Vigente: string
): ArquivosSICOMEXInput;
begin
  Result.FHistorico := Historico;
  Result.FFuturo := Futuro;
  Result.FVigente := Vigente;
end;


end.
