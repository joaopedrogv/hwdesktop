unit CalcularTributosAproximadosTypesUnit;

interface

uses
  TipoComunsUnit;

type
  CalcularTributosAproximadosInput = record
  private
    FCodigos: TArrayString;
    FUF: string;
    FBaseCalculo: Currency;
    FExcecao: Smallint;
  public
    class function Create(
      const ACodigos: TArrayString;
      const AUF: string;
      ABaseCalculo: Currency;
      AExcecao: Smallint = 0
    ): CalcularTributosAproximadosInput; static;

    property Codigos: TArrayString read FCodigos;
    property UF: string read FUF;
    property BaseCalculo: Currency read FBaseCalculo;
    property Excecao: Smallint read FExcecao;
  end;

  CalcularTributosAproximadosResult = record
  private
    FPAliqNacional: Currency;
    FPAliqEstadual: Currency;
    FPAliqMunicipal: Currency;
    FPAliqImportado: Currency;
    FValorNacional: Currency;
    FValorEstadual: Currency;
    FValorMunicipal: Currency;
    FValorImportado: Currency;
  public
    class function Create(
      APAliqNacional: Currency;
      APAliqEstadual: Currency;
      APAliqMunicipal: Currency;
      APAliqImportado: Currency;
      AValorNacional: Currency;
      AValorEstadual: Currency;
      AValorMunicipal: Currency;
      AValorImportado: Currency
    ): CalcularTributosAproximadosResult; static;

    property PAliqNacional: Currency read FPAliqNacional;
    property PAliqEstadual: Currency read FPAliqEstadual;
    property PAliqMunicipal: Currency read FPAliqMunicipal;
    property PAliqImportado: Currency read FPAliqImportado;
    property ValorNacional: Currency read FValorNacional;
    property ValorEstadual: Currency read FValorEstadual;
    property ValorMunicipal: Currency read FValorMunicipal;
    property ValorImportado: Currency read FValorImportado;
  end;

implementation

{ CalcularTributosAproximadosInput }

class function CalcularTributosAproximadosInput.Create(
  const ACodigos: TArrayString;
  const AUF: string;
  ABaseCalculo: Currency;
  AExcecao: Smallint
): CalcularTributosAproximadosInput;
begin
  Result.FCodigos := ACodigos;
  Result.FUF := AUF;
  Result.FBaseCalculo := ABaseCalculo;
  Result.FExcecao := AExcecao;
end;

{ CalcularTributosAproximadosResult }

class function CalcularTributosAproximadosResult.Create(
  APAliqNacional: Currency;
  APAliqEstadual: Currency;
  APAliqMunicipal: Currency;
  APAliqImportado: Currency;
  AValorNacional: Currency;
  AValorEstadual: Currency;
  AValorMunicipal: Currency;
  AValorImportado: Currency
): CalcularTributosAproximadosResult;
begin
  Result.FPAliqNacional := APAliqNacional;
  Result.FPAliqEstadual := APAliqEstadual;
  Result.FPAliqMunicipal := APAliqMunicipal;
  Result.FPAliqImportado := APAliqImportado;
  Result.FValorNacional := AValorNacional;
  Result.FValorEstadual := AValorEstadual;
  Result.FValorMunicipal := AValorMunicipal;
  Result.FValorImportado := AValorImportado;
end;

end.
