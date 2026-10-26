unit EmissaoLoteNFSeOutputUnit;

interface

uses
  ValidacaoOutputUnit, TipoComunsUnit;

type
  EmissaoLoteNFSeOutput = class
  private
    FValidacoes: ValidacaoOutput;
    FNFSeIDs: TArrayString;
    FTotalNotasCriadas: Integer;
    FTotalNotasAutorizadas: Integer;
    FTotalEmEmissao: Integer;
    FTotalNotasRejeitadas: Integer;
    FTotalFalhaRegistradas: Integer;
    FTotalFalhasNaoTratadas: Integer;
    FArquivosPDF: TArrayString;
    FNFSeIDsAutorizadas: TArrayString;
  public
    constructor Create(
      const ANFSeIDs: TArrayString; const AValidacoes: ValidacaoOutput; ATotalNotasCriadas: Integer
    ); overload;
    constructor Create(
      const ANFSeIDs: TArrayString;
      const AValidacoes: ValidacaoOutput;
      ATotalNotasCriadas: Integer;
      ATotalNotasAutorizadas: Integer;
      ATotalEmEmissao: Integer;
      ATotalNotasRejeitadas: Integer;
      ATotalFalhaRegistradas: Integer;
      ATotalFalhasNaoTratadas: Integer;
      const AArquivosPDF, ANFSeIDsAutorizadas: TArrayString
    ); overload;

    property NFSeIDs: TArrayString read FNFSeIDs;
    property Validacoes: ValidacaoOutput read FValidacoes;
    property TotalNotasCriadas: Integer read FTotalNotasCriadas;
    property TotalNotasAutorizadas: Integer read FTotalNotasAutorizadas;
    property TotalEmEmissao: Integer read FTotalEmEmissao;
    property TotalNotasRejeitadas: Integer read FTotalNotasRejeitadas;
    property TotalFalhaRegistradas: Integer read FTotalFalhaRegistradas;
    property TotalFalhasNaoTratadas: Integer read FTotalFalhasNaoTratadas;
    property ArquivosPDF: TArrayString read FArquivosPDF;
    property NFSeIDsAutorizadas: TArrayString read FNFSeIDsAutorizadas;
  end;

implementation

{ EmissaoLoteNFSeOutput }

constructor EmissaoLoteNFSeOutput.Create(
  const ANFSeIDs: TArrayString;
  const AValidacoes: ValidacaoOutput;
  ATotalNotasCriadas, ATotalNotasAutorizadas, ATotalEmEmissao, ATotalNotasRejeitadas, ATotalFalhaRegistradas,
  ATotalFalhasNaoTratadas: Integer;
  const AArquivosPDF, ANFSeIDsAutorizadas: TArrayString
);
begin
  FNFSeIDs := ANFSeIDs;
  FValidacoes := AValidacoes;
  FTotalNotasCriadas := ATotalNotasCriadas;
  FTotalNotasAutorizadas := ATotalNotasAutorizadas;
  FTotalEmEmissao := ATotalEmEmissao;
  FTotalNotasRejeitadas := ATotalNotasRejeitadas;
  FTotalFalhaRegistradas := ATotalFalhaRegistradas;
  FTotalFalhasNaoTratadas := ATotalFalhasNaoTratadas;
  FArquivosPDF := AArquivosPDF;
  FNFSeIDsAutorizadas := ANFSeIDsAutorizadas;
end;

constructor EmissaoLoteNFSeOutput.Create(const ANFSeIDs: TArrayString; const AValidacoes: ValidacaoOutput;
  ATotalNotasCriadas: Integer);
begin
  FNFSeIDs := ANFSeIDs;
  FValidacoes := AValidacoes;
  FTotalNotasCriadas := ATotalNotasCriadas;
  FTotalNotasAutorizadas := 0;
  FTotalEmEmissao := 0;
  FTotalNotasRejeitadas := 0;
  FTotalFalhaRegistradas := 0;
  FTotalFalhasNaoTratadas := 0;
  SetLength(FArquivosPDF, 0);
  SetLength(FNFSeIDsAutorizadas, 0);
end;

end.
