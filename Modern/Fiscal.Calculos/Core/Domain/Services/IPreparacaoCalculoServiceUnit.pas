unit IPreparacaoCalculoServiceUnit;

interface  
uses
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  TipoComunsUnit,
  PreparacaoResultadoUnit;

type
  IPreparacaoCalculoServiceInter = interface
    ['{49A82A4D-0111-4FEA-8D9D-0042F87024B6}']
    function Preparar(const Documento: CalcularTributoInput; const Item: ItemCalculoInput): PreparacaoResultado;
  end;

  IProcessamentoItemService = interface
    ['{48761704-5599-4C5D-B970-CB274C924C76}']
    function ProcessarItem(const Documento: CalcularTributoInput; const Item: ItemCalculoInput; Data: TDate): ProcessamentoItemResult;
  end;

implementation

end.
