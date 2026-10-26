unit CalcularTotaisNFSeUseCaseUnit;

interface

uses
  SysUtils, Classes,
  NFSeModelUnit, CalculoTotaisNFSeTypes, ICalculoTotaisNFSeServiceUnit;

type
  ICalcularTotaisNFSeUseCase = interface
    ['{E75BE6FD-4393-4D06-9ADA-4772B8F5B13C}']
    function Executar(Input: NFSeModel): CalculoTotaisNFSeResult;
  end;

  CalcularTotaisNFSeUseCase = class(TInterfacedObject, ICalcularTotaisNFSeUseCase)
  private
    FCalculoTotais: ICalculoTotaisNFSeService;
  public
    constructor Create(CalculoTotais: ICalculoTotaisNFSeService);
    function Executar(Input: NFSeModel): CalculoTotaisNFSeResult;
  end;


implementation

{ CalcularTotaisNFSeUseCase }

constructor CalcularTotaisNFSeUseCase.Create(CalculoTotais: ICalculoTotaisNFSeService);
begin
  FCalculoTotais := CalculoTotais;
end;

function CalcularTotaisNFSeUseCase.Executar(Input: NFSeModel): CalculoTotaisNFSeResult;
begin
  Result := FCalculoTotais.Executar( Input );
end;

end.
