unit TributoNFSeAproximadosOutputUnit;

interface

type

	TributoNFSeAproximadosOutput = class
  private
    FPTotTribFed: Currency;
    FPTotTribEst: Currency;
    FPTotTribMun: Currency;
    FPTotTribSN: Currency;
  public
    constructor Create(
      APTotTribFed: Currency;
      APTotTribEst: Currency;
      APTotTribMun: Currency;
      APTotTribSN: Currency
    );
    property PTotTribFed: Currency read FPTotTribFed;
    property PTotTribEst: Currency read FPTotTribEst;
    property PTotTribMun: Currency read FPTotTribMun;
    property PTotTribSN: Currency read FPTotTribSN;
  end;

implementation

{ TributoNFSeAproximadosOutput }

constructor TributoNFSeAproximadosOutput.Create(APTotTribFed, APTotTribEst, APTotTribMun, APTotTribSN: Currency);
begin
 FPTotTribFed := APTotTribFed;
 FPTotTribEst := APTotTribEst;
 FPTotTribMun := APTotTribMun;
 FPTotTribSN := APTotTribSN;
end;

end.
