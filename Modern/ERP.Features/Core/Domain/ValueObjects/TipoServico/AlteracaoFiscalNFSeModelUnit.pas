unit AlteracaoFiscalNFSeModelUnit;

interface

uses
  TipoComunsUnit, StringNullableUnit;

type
  AlteracaoFiscalNFSeModel = record
  private
    FServicosId: TArrayInteger;
    FCCNAE: StringNullable;
    FCLC116: StringNullable;
    FCTribNac: StringNullable;
    FCTribMun: StringNullable;
    FCNBS: StringNullable;
    FCIndOp: StringNullable;
  public
    class function Create(
      const ServicosId: TArrayInteger;
      const CCNAE, CLC116, CTribNac, CTribMun, CNBS, CIndOp: StringNullable
    ): AlteracaoFiscalNFSeModel; static;

    property ServicosId: TArrayInteger read FServicosId;
    property CCNAE: StringNullable read FCCNAE;
    property CLC116: StringNullable read FCLC116;
    property CTribNac: StringNullable read FCTribNac;
    property CTribMun: StringNullable read FCTribMun;
    property CNBS: StringNullable read FCNBS;
    property CIndOp: StringNullable read FCIndOp;
  end;

implementation

{ AlteracaoFiscalNFSeModel }

class function AlteracaoFiscalNFSeModel.Create(
  const ServicosId: TArrayInteger;
  const CCNAE, CLC116, CTribNac, CTribMun, CNBS, CIndOp: StringNullable
): AlteracaoFiscalNFSeModel;
begin
  Result.FServicosId := ServicosId;
  Result.FCCNAE := CCNAE;
  Result.FCLC116 := CLC116;
  Result.FCTribNac := CTribNac;
  Result.FCTribMun := CTribMun;
  Result.FCNBS := CNBS;
  Result.FCIndOp := CIndOp;
end;

end.
