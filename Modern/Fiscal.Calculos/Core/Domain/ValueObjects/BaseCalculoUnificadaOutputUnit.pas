unit BaseCalculoUnificadaOutputUnit;

interface

uses
  DecimalCalculoUnit;

type
  BaseCalculoAvisos = array of string;

  BaseCalculoUnificadaOutput = record
  private
    FBaseRG: DecimalCalculo;
    FBaseIS: DecimalCalculo;
    FBaseSN: DecimalCalculo;
    FAvisos: BaseCalculoAvisos;
  public
    class function Create(const ABaseRG, ABaseIS, ABaseSN: DecimalCalculo;
      const AAvisos: BaseCalculoAvisos): BaseCalculoUnificadaOutput; static;

    property BaseRG: DecimalCalculo read FBaseRG;
    property BaseIS: DecimalCalculo read FBaseIS;
    property BaseSN: DecimalCalculo read FBaseSN;
    property Avisos: BaseCalculoAvisos read FAvisos;
  end;

implementation

class function BaseCalculoUnificadaOutput.Create(const ABaseRG, ABaseIS,
  ABaseSN: DecimalCalculo; const AAvisos: BaseCalculoAvisos): BaseCalculoUnificadaOutput;
begin
  Result.FBaseRG := ABaseRG;
  Result.FBaseIS := ABaseIS;
  Result.FBaseSN := ABaseSN;
  Result.FAvisos := AAvisos;
end;

end.
