unit VersaoDadosFiscaisOutputUnit;

interface

type
  VersaoDadosFiscaisOutput = record
  private
    FVersao: string;
    FFonte: string;
    FData: TDateTime;
  public
    class function Create(
      const Versao: string;
      const Fonte: string;
      Data: TDateTime
    ): VersaoDadosFiscaisOutput; static;

    property Fonte: string read FFonte;
    property Versao: string read FVersao;
    property Data: TDateTime read FData;
  end;


implementation

{ VersaoDadosFiscaisOutput }

class function VersaoDadosFiscaisOutput.Create(const Versao, Fonte: string;
  Data: TDateTime): VersaoDadosFiscaisOutput;
begin
  Result.FVersao := Versao;
  Result.FFonte := Fonte;
  Result.FData := Data;
end;

end.
