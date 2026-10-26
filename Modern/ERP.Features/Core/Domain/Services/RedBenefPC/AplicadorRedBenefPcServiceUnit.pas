unit AplicadorRedBenefPcServiceUnit;

interface

uses
  IAplicadorRedBenefPcServiceUnit, NumberServiceUnit;

type
  AplicadorRedBenefPcService = class(TInterfacedObject, IAplicadorRedBenefPcService)
  public
    function AplicarReducao(PPis, PCofins, PercentualReducao: Currency): AplicadorRedBenefPcServiceOutput;
  end;

implementation

{ AplicadorRedBenefPcService }

function AplicadorRedBenefPcService.AplicarReducao(
  PPis, PCofins, PercentualReducao: Currency
): AplicadorRedBenefPcServiceOutput;
begin
  Result := AplicadorRedBenefPcServiceOutput.Create(
    NumberService.RoundHalfUpTo4( PPis * PercentualReducao / 100 ),
    NumberService.RoundHalfUpTo4( PCofins * PercentualReducao / 100 )
  );
end;

end.
