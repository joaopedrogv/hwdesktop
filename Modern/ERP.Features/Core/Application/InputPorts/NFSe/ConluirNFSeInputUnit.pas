unit ConluirNFSeInputUnit;

interface

uses
  NFSeTypesUnit;

type
  ConcluirNFSeInput = record
  private
    FNFSeId: string;
    FContinuarSemChave: Boolean;
  public
    class function Create(
      const ANFSeId: string;
      AContinuarSemChave: Boolean
    ): ConcluirNFSeInput; static;

    property NFSeId: string read FNFSeId;
    property ContinuarSemChave: Boolean read FContinuarSemChave;
  end;

implementation

{ ConcluirNFSeInput }

class function ConcluirNFSeInput.Create(
  const ANFSeId: string;
  AContinuarSemChave: Boolean
): ConcluirNFSeInput;
begin
  Result.FNFSeId := ANFSeId;
  Result.FContinuarSemChave := AContinuarSemChave;
end;

end.
