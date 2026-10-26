unit TributoNFSeIssQnOutputUnit;

interface

uses
  NFSeTypesUnit,
	CurrencyNullableUnit;

type
	TributoNFSeIssQnOutput = class
  private
    FTipoTributacao: TributacaoISSQNEnum;
    FTipoRetencao: TipoRetencaoISSQNEnum;
    FAliquota: CurrencyNullable;
    FBaseCalculo: CurrencyNullable;
    FValorISSQN: CurrencyNullable;
  public
    constructor Create(
      ATipoTributacao: TributacaoISSQNEnum;
      ATipoRetencao: TipoRetencaoISSQNEnum;
      const AAliquota: CurrencyNullable;
      const ABaseCalculo: CurrencyNullable;
      const AValorISSQN: CurrencyNullable
    );
    property TipoTributacao: TributacaoISSQNEnum read FTipoTributacao;
    property TipoRetencao: TipoRetencaoISSQNEnum read FTipoRetencao;
    property Aliquota: CurrencyNullable read FAliquota;
    property BaseCalculo: CurrencyNullable read FBaseCalculo;
    property ValorISSQN: CurrencyNullable read FValorISSQN;
  end;

implementation

{ TributoNFSeIssQnOutput }

constructor TributoNFSeIssQnOutput.Create(
  ATipoTributacao: TributacaoISSQNEnum;
  ATipoRetencao: TipoRetencaoISSQNEnum;
  const AAliquota, ABaseCalculo, AValorISSQN: CurrencyNullable
);
begin
  FTipoTributacao := ATipoTributacao;
  FTipoRetencao := ATipoRetencao;
  FAliquota := AAliquota;
  FBaseCalculo := ABaseCalculo;
  FValorISSQN := AValorISSQN;
end;

end.
