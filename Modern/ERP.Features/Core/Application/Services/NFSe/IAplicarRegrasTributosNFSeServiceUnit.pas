unit IAplicarRegrasTributosNFSeServiceUnit;

interface

uses
  CalculoRetenFederalResultUnit, TipoRetencaoFederalPJEnumUnit, NFSeTypesUnit, CalculoPisCofinsResultUnit;

type
  IAplicarRegrasTributosNFSeService = interface
    ['{77337572-DEFC-43BC-9BB2-14F90B034AFE}']
    function AplicarRetencoesFederais(
      const Calculo: CalculoRetenFederalResult; IsSimplesNacional: Boolean; Retencoes: TipoRetencaoFederalPJEnumSet
    ): CalculoRetenFederalResult;

    function AplicarPisCofins(
      const Calculo: CalculoPisCofinsResult; IsSimplesNacional: Boolean
    ): CalculoPisCofinsResult;

    //function AjustarPisCofinsCST(
    //  const Retencao: CalculoRetenFederalResult; IsSimplesNacional: Boolean; const CstAtualPC: string
    //): string;

    function ObterTipoRetencaoPC(const Calculo: CalculoRetenFederalResult): TipoRetencaoPisCofinsEnum;
  end;

implementation

end.
