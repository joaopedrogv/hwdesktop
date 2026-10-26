unit CalcularBCImpostoSeletivoUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  ICalculoBaseCalculoServiceUnit,
  CalcularBaseCalculoModelUnit;

type    
//  {$IFDEF INTF_ON}
  ICalcularBCImpostoSeletivoUseCase = interface
    ['{37F8DE14-B03A-4A17-B5DA-04AC23C21ED7}']
    function Executar(const Input: BaseCalculoISMercadoriasModel): Currency;
  end;
//  {$ELSE}
//  ICalcularBCImpostoSeletivoUseCase = class(BaseUseCase)
//  public
//    function Executar(const Input: BaseCalculoISMercadoriasModel): Currency; virtual; abstract;
//  end;
//  {$ENDIF}

//  {$IFDEF INTF_ON}
  CalcularBCImpostoSeletivoUseCase = class(TInterfacedObject, ICalcularBCImpostoSeletivoUseCase)
//  {$ELSE}
//  CalcularBCImpostoSeletivoUseCase = class(ICalcularBCImpostoSeletivoUseCase)
//  {$ENDIF}
  private
    FCalculo: ICalculoBaseCalculoService;
  public
    constructor Create(Calculo: ICalculoBaseCalculoService);
//  {$IFDEF INTF_ON}
    function Executar(const Input: BaseCalculoISMercadoriasModel): Currency;
//  {$ELSE}
//    function Executar(const Input: BaseCalculoISMercadoriasModel): Currency; override;
//  {$ENDIF}
  end;

implementation

{ CalcularBCImpostoSeletivoUseCase }

constructor CalcularBCImpostoSeletivoUseCase.Create(Calculo: ICalculoBaseCalculoService);
begin
  FCalculo := Calculo;
end;

function CalcularBCImpostoSeletivoUseCase.Executar(
  const Input: BaseCalculoISMercadoriasModel): Currency;
begin
  Result := FCalculo.CalculaIS(Input);
end;

end.
