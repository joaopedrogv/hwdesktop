unit ExcecaoNbsAplicavelEtdUnit;

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  ExcecaoNbsAplicavelEtd = record
  private
    FId: Integer;
    FNbs: string;
    FNbsAplicavelId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function CreateEtd(
      Id: Integer;
      const Nbs: string;
      NbsAplicavelId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): ExcecaoNbsAplicavelEtd; static;

    property Id: Integer read FId;
    property Nbs: string read FNbs;
    property NbsAplicavelId: Integer read FNbsAplicavelId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  ExcecoesNbsAplicavelEtd = array of ExcecaoNbsAplicavelEtd;

implementation

{ ExcecaoNbsAplicavelEtd }

class function ExcecaoNbsAplicavelEtd.CreateEtd(
  Id: Integer;
  const Nbs: string;
  NbsAplicavelId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): ExcecaoNbsAplicavelEtd;
begin
  Result.FId := Id;
  Result.FNbs := Nbs;
  Result.FNbsAplicavelId := NbsAplicavelId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
