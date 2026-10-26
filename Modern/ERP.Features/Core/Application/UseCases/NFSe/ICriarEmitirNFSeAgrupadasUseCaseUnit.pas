unit ICriarEmitirNFSeAgrupadasUseCaseUnit;

interface

uses
  CriarNFSeAgrupadasInputUnit, EmissaoLoteNFSeOutputUnit;

type
  ICriarEmitirNFSeAgrupadasUseCase = interface
    ['{364889D1-F39B-40BB-B924-14A43A8746AB}']
    function Executar(const Input: CriarNFSeAgrupadasInput): EmissaoLoteNFSeOutput;
  end;

implementation

end.
