unit SalvarRegraFiscalIbsCbsTypesUnit;

interface

uses
  RegraFiscalIbsCbsEtdUnit;

type
  SalvarRegraFiscalIbsCbsUseCaseInput = record
  private
    FRegraFiscal: RegraFiscalIbsCbsEtd;
    FTribRegInformadaIndevidamente: Boolean;
    FExigeTribRegENaoInformada: Boolean;
  public
    class function Create(
      RegraFiscal: RegraFiscalIbsCbsEtd;
      TribRegInformadaIndevidamente,
      ExigeTribRegENaoInformada: Boolean
    ): SalvarRegraFiscalIbsCbsUseCaseInput; static;
    property RegraFiscal: RegraFiscalIbsCbsEtd read FRegraFiscal;
    property TribRegInformadaIndevidamente: Boolean read FTribRegInformadaIndevidamente;
    property ExigeTribRegENaoInformada: Boolean read FExigeTribRegENaoInformada;
  end;

implementation

{ SalvarRegraFiscalIbsCbsUseCaseInput }

class function SalvarRegraFiscalIbsCbsUseCaseInput.Create(
  RegraFiscal: RegraFiscalIbsCbsEtd;
  TribRegInformadaIndevidamente,
  ExigeTribRegENaoInformada: Boolean
): SalvarRegraFiscalIbsCbsUseCaseInput;
begin
  Result.FRegraFiscal := RegraFiscal;
  Result.FTribRegInformadaIndevidamente := TribRegInformadaIndevidamente;
  Result.FExigeTribRegENaoInformada := ExigeTribRegENaoInformada;
end;

end.
