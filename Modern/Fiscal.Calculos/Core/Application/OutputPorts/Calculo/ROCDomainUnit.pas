unit ROCDomainUnit;

interface

uses
  SysUtils, ROCItemDomainUnit, ValoresTotaisDomainUnit, ValidacaoOutputUnit,
  OperacaoConsumoModelUnit;

type
  ROCDomain = class
  private
    FOwnsObjects: Boolean;
    FOper: OperacaoConsumoModel;
    FObjetos: ROCItens;
    FTotal: ValoresTotaisDomain;
    FValidacoes: ValidacaoOutput;
  public
    constructor Create(
      const Oper: OperacaoConsumoModel;
      Objetos: ROCItens;
      const Total: ValoresTotaisDomain;
      const Validacoes: ValidacaoOutput;
      OwnsObjects: Boolean = True
    );
    destructor Destroy(); override;

    property Oper: OperacaoConsumoModel read FOper;
    property Objetos: ROCItens read FObjetos;
    property Total: ValoresTotaisDomain read FTotal;
    property Validacoes: ValidacaoOutput read FValidacoes;
  end;

implementation

{ ROCDomain }

constructor ROCDomain.Create(
  const Oper: OperacaoConsumoModel;
  Objetos: ROCItens;
  const Total: ValoresTotaisDomain;
  const Validacoes: ValidacaoOutput;
  OwnsObjects: Boolean
);
begin
  FOper := Oper;
  FObjetos := Objetos;
  FTotal := Total;
  FValidacoes := Validacoes;
  FOwnsObjects := OwnsObjects;
end;

destructor ROCDomain.Destroy;
var
  I: Integer;
begin
  for I := Low(FObjetos) to High(FObjetos) do
    FObjetos[I].Free();

  SetLength(FObjetos, 0);

  inherited;
end;

end.
