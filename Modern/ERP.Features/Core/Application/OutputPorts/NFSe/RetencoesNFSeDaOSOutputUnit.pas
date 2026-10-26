unit RetencoesNFSeDaOSOutputUnit;

interface

type         
  RetencoesNFSeDaOSOutput = record
  private
    FNumeroOS: Integer;
    FVRetIRRF: Currency;
    FVRetCP: Currency;
    FVRetPIS: Currency;
    FVRetCOFINS: Currency;
    FVRetCSLL: Currency;
    FVRetISS: Currency;
  public
    class function Create(
      ANumeroOS: Integer;
      AVRetIRRF: Currency;
      AVRetCP: Currency;
      AVRetPIS: Currency;
      AVRetCOFINS: Currency;
      AVRetCSLL: Currency;
      AVRetISS: Currency
    ): RetencoesNFSeDaOSOutput; static;

    property NumeroOS: Integer read FNumeroOS;
    property VRetIRRF: Currency read FVRetIRRF;
    property VRetCP: Currency read FVRetCP;
    property VRetPIS: Currency read FVRetPIS;
    property VRetCOFINS: Currency read FVRetCOFINS;
    property VRetCSLL: Currency read FVRetCSLL;
    property VRetISS: Currency read FVRetISS;
  end;

implementation

{ RetencoesNFSeDaOSOutput }

class function RetencoesNFSeDaOSOutput.Create(
  ANumeroOS: Integer;
  AVRetIRRF: Currency;
  AVRetCP: Currency;
  AVRetPIS: Currency;
  AVRetCOFINS: Currency;
  AVRetCSLL: Currency;
  AVRetISS: Currency
): RetencoesNFSeDaOSOutput;
begin
  Result.FNumeroOS := ANumeroOS;
  Result.FVRetIRRF := AVRetIRRF;
  Result.FVRetCP := AVRetCP;
  Result.FVRetPIS := AVRetPIS;
  Result.FVRetCOFINS := AVRetCOFINS;
  Result.FVRetCSLL := AVRetCSLL;
  Result.FVRetISS := AVRetISS;
end;

end.
