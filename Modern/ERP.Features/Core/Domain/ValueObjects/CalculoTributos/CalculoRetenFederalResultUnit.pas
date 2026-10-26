unit CalculoRetenFederalResultUnit;

interface

type
	CalculoRetenFederalResult = record
  private
    FVRetPIS: Currency;
    FVRetCOFINS: Currency;
    FVRetIRRF: Currency;
    FVRetCSLL: Currency;
    FVRetCP: Currency;
  public
    class function Create(
      VRetPIS, VRetCOFINS, VRetIRRF, VRetCSLL, VRetCP: Currency
    ): CalculoRetenFederalResult; static;

    property VRetPIS: Currency read FVRetPIS;
    property VRetCOFINS: Currency read FVRetCOFINS;
    property VRetIRRF: Currency read FVRetIRRF;
    property VRetCSLL: Currency read FVRetCSLL;
    property VRetCP: Currency read FVRetCP;
  end;

implementation

{ CalculoRetenFederalResult }

class function CalculoRetenFederalResult.Create(
	VRetPIS, VRetCOFINS, VRetIRRF, VRetCSLL, VRetCP: Currency): CalculoRetenFederalResult;
begin
  Result.FVRetPIS := VRetPIS;
  Result.FVRetCOFINS := VRetCOFINS;
  Result.FVRetIRRF := VRetIRRF;
  Result.FVRetCSLL := VRetCSLL;
  Result.FVRetCP := VRetCP;
end;

end.
