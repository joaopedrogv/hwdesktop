unit TributoNFSeRetenFederalOutputUnit;

interface

uses
	CurrencyNullableUnit;

type
	TributoNFSeRetenFederalOutput = class
	private
		FAliqPIS: CurrencyNullable;
		FAliqCOFINS: CurrencyNullable;
		FAliqIRRF: CurrencyNullable;
		FAliqCSLL: CurrencyNullable;
		FValorPIS: CurrencyNullable;
		FValorCOFINS: CurrencyNullable;
		FValorIRRF: CurrencyNullable;
		FValorCSLL: CurrencyNullable;
    FAliqCP: CurrencyNullable;
    FValorCP: CurrencyNullable;
	public
		constructor Create(
			AAliqPIS, AValorPIS,
      AAliqCOFINS, AValorCOFINS,
      AAliqIRRF, AValorIRRF,
      AAliqCSLL, AValorCSLL,
      AAliqCP, AValorCP: CurrencyNullable
		);

		property AliqPIS: CurrencyNullable read FAliqPIS;
		property ValorPIS: CurrencyNullable read FValorPIS;
		property AliqCOFINS: CurrencyNullable read FAliqCOFINS;
		property ValorCOFINS: CurrencyNullable read FValorCOFINS;
		property AliqIRRF: CurrencyNullable read FAliqIRRF;
		property ValorIRRF: CurrencyNullable read FValorIRRF;
		property AliqCSLL: CurrencyNullable read FAliqCSLL;
		property ValorCSLL: CurrencyNullable read FValorCSLL;
		property AliqCP: CurrencyNullable read FAliqCP;
		property ValorCP: CurrencyNullable read FValorCP;
	end;

implementation

{ TributoNFSeRetenFederalOutput }

constructor TributoNFSeRetenFederalOutput.Create(
	AAliqPIS, AValorPIS,
  AAliqCOFINS, AValorCOFINS,
  AAliqIRRF, AValorIRRF,
  AAliqCSLL, AValorCSLL,
  AAliqCP, AValorCP: CurrencyNullable
);
begin
	FAliqPIS := AAliqPIS;
	FAliqCOFINS := AAliqCOFINS;
	FAliqIRRF := AAliqIRRF;
	FAliqCSLL := AAliqCSLL;
	FAliqCP := AAliqCP;

	FValorPIS := AValorPIS;
	FValorCOFINS := AValorCOFINS;
	FValorIRRF := AValorIRRF;
	FValorCSLL := AValorCSLL;
	FValorCP := AValorCP;
end;

end.
