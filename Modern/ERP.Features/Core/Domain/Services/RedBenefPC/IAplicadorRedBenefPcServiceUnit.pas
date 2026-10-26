unit IAplicadorRedBenefPcServiceUnit;

interface

uses
  CalculoPisCofinsResultUnit;

type
  AplicadorRedBenefPcServiceOutput = record
  private
    FPPis: Currency;
    FPCofins: Currency;
  public
    class function Create(APPis, APCofins: Currency): AplicadorRedBenefPcServiceOutput; static;

    property PPis: Currency read FPPis;
    property PCofins: Currency read FPCofins;
  end;

  IAplicadorRedBenefPcService = interface
    ['{A14E08AA-28CA-4B73-A9D1-746BC2EBE9EA}']
    function AplicarReducao(PPis, PCofins, PercentualReducao: Currency): AplicadorRedBenefPcServiceOutput;
  end;

implementation

{ AplicadorRedBenefPcServiceOutput }

class function AplicadorRedBenefPcServiceOutput.Create(APPis, APCofins: Currency): AplicadorRedBenefPcServiceOutput;
begin
  Result.FPPis := APPis;
  Result.FPCofins := APCofins;
end;

end.
