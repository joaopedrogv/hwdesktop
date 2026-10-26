unit ICalculoTotaisNFSeServiceUnit;

interface

uses
  NFSeModelUnit, CalculoTotaisNFSeTypes;

type
  ICalculoTotaisNFSeService = interface
    ['{79FB007B-15A3-4BB1-A7ED-0A15E7589FA6}']
    function Executar(Input: CalculoTotaisNFSeInput): CalculoTotaisNFSeResult; overload;
    function Executar(Input: NFSeModel): CalculoTotaisNFSeResult; overload;
  end;

implementation

end.
