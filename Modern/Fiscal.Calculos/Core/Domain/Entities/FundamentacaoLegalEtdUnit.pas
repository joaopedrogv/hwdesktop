unit FundamentacaoLegalEtdUnit;

interface

uses
  TipoComunsUnit, DateAndTimeNullableUnit;

type

  FundamentacaoLegalEtd = record
  private
    FId: Integer;
    FTexto: string;
    FTextoCurto: string;
    FReferenciaNormativa: string;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function Create(
      Id: Integer;
      const Texto: string;
      const TextoCurto: string;
      const ReferenciaNormativa: string;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): FundamentacaoLegalEtd; static;

    function Clone(): FundamentacaoLegalEtd;

    property Id: Integer read FId write FId;
    property Texto: string read FTexto write FTexto;
    property TextoCurto: string read FTextoCurto write FTextoCurto;
    property ReferenciaNormativa: string read FReferenciaNormativa write FReferenciaNormativa;
    property InicioVigencia: TDate read FInicioVigencia write FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia write FFimVigencia;
  end;

  FundamentacoesLegaisEtd = array of FundamentacaoLegalEtd;

implementation

{ FundamentacaoLegalEtd }

function FundamentacaoLegalEtd.Clone: FundamentacaoLegalEtd;
begin
  Result := FundamentacaoLegalEtd.Create(
    FId, FTexto, FTextoCurto, FReferenciaNormativa, FInicioVigencia, DateNullable.CreateOrNull(FFimVigencia.Value)
  );
end;

class function FundamentacaoLegalEtd.Create(
  Id: Integer;
  const Texto, TextoCurto, ReferenciaNormativa: string;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): FundamentacaoLegalEtd;
begin
  Result.FId := Id;
  Result.FTexto := Texto;
  Result.FTextoCurto := TextoCurto;
  Result.FReferenciaNormativa := ReferenciaNormativa;
  Result.InicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
