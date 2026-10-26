unit ISincronizadorTabelaIbptServiceUnit;

interface

type
  SincronizadorTabelaIbptInput = record
  private
    FFileName: string;
    FUF: string;
  public
    class function Create(const AFileName, AUF: string): SincronizadorTabelaIbptInput; static;
    property FileName: string read FFileName;
    property UF: string read FUF;
  end;

  ISincronizadorTabelaIbptService = interface
    ['{1F687273-4758-4B6E-98F3-3B8B2FB581B9}']
    function Executar(const Input: SincronizadorTabelaIbptInput): Boolean;
  end;

implementation

{ SincronizadorTabelaIbptInput }

class function SincronizadorTabelaIbptInput.Create(
  const AFileName, AUF: string): SincronizadorTabelaIbptInput;
begin
  Result.FFileName := AFileName;
  Result.FUF := AUF;
end;

end.
