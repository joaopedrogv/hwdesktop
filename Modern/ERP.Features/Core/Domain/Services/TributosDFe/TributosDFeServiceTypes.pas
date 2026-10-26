unit TributosDFeServiceTypes;

interface

uses
  StringNullableUnit,
  TipoRegraTributoDFeEnumUnit,
  TributoDFeOrigemEnumUnit;

type
  TributoDFeContextInput = record
  private
    FId: string;
    FRegraFiscalId: StringNullable;
    FTipoRegra: TipoRegraTributoDFeEnum;
    FIndDoacao: Boolean;
    FOrigem: TributoDFeOrigemEnum;
  public
    class function Create(
      const Id: string;
      const RegraFiscalId: StringNullable;
      TipoRegra: TipoRegraTributoDFeEnum;
      IndDoacao: Boolean;
      Origem: TributoDFeOrigemEnum
    ): TributoDFeContextInput; static;

    property Id: string read FId;
    property RegraFiscalId: StringNullable read FRegraFiscalId;
    property TipoRegra: TipoRegraTributoDFeEnum read FTipoRegra;
    property IndDoacao: Boolean read FIndDoacao;
    property Origem: TributoDFeOrigemEnum read FOrigem;
  end;

implementation       

{ TributoDFeContextInput }

class function TributoDFeContextInput.Create(
  const Id: string;
  const RegraFiscalId: StringNullable;
  TipoRegra: TipoRegraTributoDFeEnum;
  IndDoacao: Boolean;
  Origem: TributoDFeOrigemEnum
): TributoDFeContextInput;
begin
  Result.FId := Id;
  Result.FRegraFiscalId := RegraFiscalId;
  Result.FTipoRegra := TipoRegra;
  Result.FIndDoacao := IndDoacao;
  Result.FOrigem := Origem;
end;

end.
