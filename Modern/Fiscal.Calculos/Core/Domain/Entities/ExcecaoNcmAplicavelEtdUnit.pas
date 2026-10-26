unit ExcecaoNcmAplicavelEtdUnit;

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  ExcecaoNcmAplicavelEtd = record
  private
    FId: Integer;
    FNcm: string;
    FNcmAplicavelId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function CreateEtd(
      Id: Integer;
      const Ncm: string;
      NcmAplicavelId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): ExcecaoNcmAplicavelEtd; static;

    property Id: Integer read FId;
    property Ncm: string read FNcm;
    property NcmAplicavelId: Integer read FNcmAplicavelId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  ExcecoesNcmAplicavelEtd = array of ExcecaoNcmAplicavelEtd;

implementation

{ ExcecaoNcmAplicavelEtd }

class function ExcecaoNcmAplicavelEtd.CreateEtd(
  Id: Integer;
  const Ncm: string;
  NcmAplicavelId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): ExcecaoNcmAplicavelEtd;
begin
  Result.FId := Id;
  Result.FNcm := Ncm;
  Result.FNcmAplicavelId := NcmAplicavelId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
