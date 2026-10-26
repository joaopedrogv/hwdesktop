unit TributoNFSePisCofinsOutputUnit;

interface

uses
	NFSeTypesUnit,
	StringNullableUnit,
	CurrencyNullableUnit;

type
	TributoNFSePisCofinsOutput = class
	private
		FCST: StringNullable;
		FBaseCalculo: CurrencyNullable;
		FPPis: CurrencyNullable;
    FPCofins: CurrencyNullable;
    FVPis: CurrencyNullable;
    FVCofins: CurrencyNullable;
    FTipoRetencao: TipoRetencaoPisCofinsEnum;
  public
    constructor Create(
			const ACST: StringNullable;
      const ABaseCalculo: CurrencyNullable;
      const APPis: CurrencyNullable;
      const APCofins: CurrencyNullable;
      const AVPis: CurrencyNullable;
      const AVCofins: CurrencyNullable;
      ATipoRetencao: TipoRetencaoPisCofinsEnum
		);
		property CST: StringNullable read FCST;
		property BaseCalculo: CurrencyNullable read FBaseCalculo;
    property PPis: CurrencyNullable read FPPis;
    property PCofins: CurrencyNullable read FPCofins;
    property VPis: CurrencyNullable read FVPis;      
    property VCofins: CurrencyNullable read FVCofins;
    property TipoRetencao: TipoRetencaoPisCofinsEnum read FTipoRetencao;
  end;

implementation

{ TributoNFSePisCofinsOutput }

constructor TributoNFSePisCofinsOutput.Create(
  const ACST: StringNullable;
  const ABaseCalculo: CurrencyNullable;
  const APPis: CurrencyNullable;
  const APCofins: CurrencyNullable;
  const AVPis: CurrencyNullable;
  const AVCofins: CurrencyNullable;
  ATipoRetencao: TipoRetencaoPisCofinsEnum
);
begin
	FCST := ACST;
  FBaseCalculo := ABaseCalculo;
  FPPis := APPis;
  FPCofins := APCofins;
  FVPis := AVPis;
  FVCofins := AVCofins;
  FTipoRetencao := ATipoRetencao;
end;

end.
