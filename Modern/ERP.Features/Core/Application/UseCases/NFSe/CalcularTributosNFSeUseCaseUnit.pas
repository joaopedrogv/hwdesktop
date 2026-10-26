unit CalcularTributosNFSeUseCaseUnit;

interface

uses
  SysUtils, Classes, BaseUseCaseUnit,
  ValidacaoOutputUnit,
  CalculoTributosNFSeInputUnit,
  CalculoTributosNFSeOutputUnit,
  ICalcularTributosNFSeServiceUnit, INFSeCalculoAplicadorServiceUnit;

type

	ICalcularTributosNFSeUseCase = interface
		['{D202590C-C032-431C-A214-CBA010B9ED3A}']
		function Executar(const Input: CalculoTributosNFSeInput): ValidacaoOutput;
	end;

  CalcularTributosNFSeUseCase = class(TInterfacedBaseUseCase, ICalcularTributosNFSeUseCase)
  private
		FCalcularTributosNFSe: ICalcularTributosNFSeService;
    FCalculoAplicador: INFSeCalculoAplicadorService;
	private
	public
		constructor Create(
      CalcularTributosNFSe: ICalcularTributosNFSeService;
      CalculoAplicador: INFSeCalculoAplicadorService
    );
		function Executar(const Input: CalculoTributosNFSeInput): ValidacaoOutput;
	end;

implementation

{ CalcularTributosNFSeUseCase }

uses NFSeModelUnit;

constructor CalcularTributosNFSeUseCase.Create(
  CalcularTributosNFSe: ICalcularTributosNFSeService;
  CalculoAplicador: INFSeCalculoAplicadorService
);
begin
	FCalcularTributosNFSe := CalcularTributosNFSe;
  FCalculoAplicador := CalculoAplicador;
end;

function CalcularTributosNFSeUseCase.Executar(const Input: CalculoTributosNFSeInput): ValidacaoOutput;
var
  calcResult: CalculoTributosNFSeOutput;
  nota: NFSeModel;
begin
  calcResult := FCalcularTributosNFSe.Executar( Input );
  try
    nota := Input.Nota;

    FCalculoAplicador.AplicarCalculo( nota, calcResult, Input.CalcularRTC, Input.CalcularLegado );

    Result := calcResult.Validacoes;

  finally
    calcResult.Free();
  end;
end;

end.
