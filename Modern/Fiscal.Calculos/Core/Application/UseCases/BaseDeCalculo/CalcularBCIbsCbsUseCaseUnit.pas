unit CalcularBCIbsCbsUseCaseUnit;

interface

uses      
  BaseUseCaseUnit,
  ICalculoBaseCalculoServiceUnit,
  CalcularBaseCalculoModelUnit;

type                       
//  {$IFDEF INTF_ON}
  ICalcularBCIbsCbsUseCase = interface
    ['{81B07BFD-7D64-4470-853E-23C464990367}']
    function Executar(const Input: BaseCalculoIbsCbsModel): Currency;
  end;
//  {$ELSE}
//  ICalcularBCIbsCbsUseCase = class(BaseUseCase)
//  public
//    function Executar(const Input: BaseCalculoIbsCbsModel): Currency; virtual; abstract;
//  end;
//  {$ENDIF}
  
//  {$IFDEF INTF_ON}
  CalcularBCIbsCbsUseCase = class(TInterfacedObject, ICalcularBCIbsCbsUseCase)
//  {$ELSE}
//  CalcularBCIbsCbsUseCase = class(ICalcularBCIbsCbsUseCase)
//  {$ENDIF}
  private
    FCalculo: ICalculoBaseCalculoService;
  public
    constructor Create(Calculo: ICalculoBaseCalculoService);
//  {$IFDEF INTF_ON}
    function Executar(const Input: BaseCalculoIbsCbsModel): Currency;
//  {$ELSE}
//    function Executar(const Input: BaseCalculoIbsCbsModel): Currency; override;
//  {$ENDIF}
  end;

implementation

{ CalcularBCIbsCbsUseCase }

constructor CalcularBCIbsCbsUseCase.Create(Calculo: ICalculoBaseCalculoService);
begin
  FCalculo := Calculo;
end;

function CalcularBCIbsCbsUseCase.Executar(
  const Input: BaseCalculoIbsCbsModel): Currency;
begin
  Result := FCalculo.CalculaIbsCbs(Input);
end;

end.

