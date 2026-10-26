unit TipoTributoFiscalEnumUnit;

interface

type
  TipoTributoFiscalEnum = ( tfIndefinido, tfIBSCBS, tfIS{? IS ficaria junto IBSCBS}{, tfICMS, tfPISCOFINS, tfIPI});
  TipoTributoFiscalEnumSet = set of TipoTributoFiscalEnum;

const
  TipoTributoFiscalEnumDisplay: array[TipoTributoFiscalEnum] of string =
    ('', '1 - IBS e CBS', '2 - Imposto Seletivo'{, '3 - ICMS', '4 - PISCOFINS', '5 - IPI' });

implementation

end.
