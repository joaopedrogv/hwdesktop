unit CriarNFSeAgrupadasInputUnit;

interface

uses
  TipoComunsUnit;

type
  CriarNFSeAgrupadasInput = record
  private
    FNumerosOS: TArrayInteger;
    FImprimir: Boolean;
    FSilent: Boolean;
    FEnviarEmail: Boolean;
    FCriarEmitir: Boolean;
  public
    class function Create(
      const ANumerosOS: TArrayInteger;
      ASilent, AImprimir, AEnviarEmail, ACriarEmitir: Boolean
    ): CriarNFSeAgrupadasInput; static;

    property NumerosOS: TArrayInteger read FNumerosOS;
    property Silent: Boolean read FSilent;
    property Imprimir: Boolean read FImprimir;
    property EnviarEmail: Boolean read FEnviarEmail;
    property CriarEmitir: Boolean read FCriarEmitir;
  end;

implementation

{ CriarNFSeAgrupadasInput }

class function CriarNFSeAgrupadasInput.Create(
  const ANumerosOS: TArrayInteger;
  ASilent, AImprimir, AEnviarEmail, ACriarEmitir: Boolean
): CriarNFSeAgrupadasInput;
begin
  Result.FNumerosOS := ANumerosOS;
  Result.FSilent := ASilent;
  Result.FImprimir := AImprimir;
  Result.FEnviarEmail := AEnviarEmail;
  Result.FCriarEmitir := ACriarEmitir;
end;

end.
