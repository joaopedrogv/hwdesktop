unit INFSeCalculoAplicadorServiceUnit;

interface

uses
  NFSeModelUnit, CalculoTributosNFSeOutputUnit;

type
  INFSeCalculoAplicadorService = interface
    ['{5786027B-4EA8-409E-8E8C-D9A1B0EDCC25}']
    procedure AplicarCalculo(
      var Nota: NFSeModel; const Calculo: CalculoTributosNFSeOutput; ATributosRTC, ATributosLegados: Boolean
    );
  end;

implementation

end.
