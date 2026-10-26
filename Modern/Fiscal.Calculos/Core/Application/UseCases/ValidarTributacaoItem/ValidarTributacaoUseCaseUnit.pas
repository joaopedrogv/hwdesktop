unit ValidarTributacaoUseCaseUnit;

interface

uses  
  BaseClassUnit,
  CalcularTributoInputUnit,
  ValidacaoOutputUnit,
  IPreparacaoCalculoServiceUnit,
  ItemCalculoInputUnit;

type
  (*
  IValidarTributacaoUseCase = interface
    ['{4EB1D5C3-EE98-4714-9CAA-6F60493F7427}']
    function Executar(const Documento: CalcularTributoInput; const Item: ItemCalculoInput): ValidacaoOutput;
  end;
  *)

  IValidarTributacaoUseCase = class(BaseClass)
  public
    function Executar(const Documento: CalcularTributoInput; const Item: ItemCalculoInput): ValidacaoOutput; virtual; abstract;
  end;

  //ValidarTributacaoItemUseCase = class(TInterfacedObject, IValidarTributacaoUseCase)
  ValidarTributacaoItemUseCase = class(IValidarTributacaoUseCase)
  private
    FPreparacaoService: IPreparacaoCalculoServiceInter;
  public
    constructor Create(const Preparacao: IPreparacaoCalculoServiceInter);

    function Executar(const Documento: CalcularTributoInput; const Item: ItemCalculoInput): ValidacaoOutput;  override;
  end;

implementation

{ ValidarTributacaoItemUseCase }

uses
  PreparacaoResultadoUnit;

constructor ValidarTributacaoItemUseCase.Create(
  const Preparacao: IPreparacaoCalculoServiceInter
);
begin
  FPreparacaoService := Preparacao;
end;

function ValidarTributacaoItemUseCase.Executar(
  const Documento: CalcularTributoInput;
  const Item: ItemCalculoInput
): ValidacaoOutput;
var
  Resultado: PreparacaoResultado;
begin
  Resultado := FPreparacaoService.Preparar(Documento, Item);

  Result := Resultado.Validacoes;
end;

end.
