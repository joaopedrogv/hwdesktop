unit UpdatePedvendaVinculoNFSeSubstituidaCommandUnit;

interface

type
  UpdatePedvendaVinculoNFSeSubstituidaCommand = record
  private
    FNumeroOS: Integer;
    FEmpresaId: Integer;
    FNFSeSubstituidaId: string;
    FNFSeSubstituidoraId: string;
  public
    class function Create(
      ANumeroOS, AEmpresaId: Integer;
      const ANFSeSubstituidaId, ANFSeSubstituidoraId: string
    ): UpdatePedvendaVinculoNFSeSubstituidaCommand; static;

    property NumeroOS: Integer read FNumeroOS;
    property EmpresaId: Integer read FEmpresaId;
    property NFSeSubstituidaId: string read FNFSeSubstituidaId;
    property NFSeSubstituidoraId: string read FNFSeSubstituidoraId;
  end;

implementation

{ UpdatePedvendaVinculoNFSeSubstituidaCommand }

class function UpdatePedvendaVinculoNFSeSubstituidaCommand.Create(
  ANumeroOS, AEmpresaId: Integer;
  const ANFSeSubstituidaId, ANFSeSubstituidoraId: string
): UpdatePedvendaVinculoNFSeSubstituidaCommand;
begin
  Result.FNumeroOS := ANumeroOS;
  Result.FEmpresaId := AEmpresaId;
  Result.FNFSeSubstituidaId := ANFSeSubstituidaId;
  Result.FNFSeSubstituidoraId := ANFSeSubstituidoraId;
end;

end.
