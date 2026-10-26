unit AliquotaAdValoremServicoEtdUnit;

interface

uses
  TipoComunsUnit,
  TipoTributoEnumUnit,
  DateAndTimeNullableUnit;

type
  AliquotaAdValoremServicoEtd = record
  private
    FId: Integer;
    FNbs: string;
    FAliquotaAdValoremId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function CreateEtd(
      Id: Integer;
      const Nbs: string;
      AliquotaAdValoremId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): AliquotaAdValoremServicoEtd; static;

    property Id: Integer read FId;
    property Nbs: string read FNbs write FNbs;
    property AliquotaAdValoremId: Integer read FAliquotaAdValoremId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  AliquotasAdValoremServicosEtd = array of AliquotaAdValoremServicoEtd;

implementation

{ AliquotaAdValoremServicoEtd }

class function AliquotaAdValoremServicoEtd.CreateEtd(
  Id: Integer;
  const Nbs: string;
  AliquotaAdValoremId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): AliquotaAdValoremServicoEtd;
begin
  Result.FId := Id;
  Result.FNbs := Nbs;
  Result.FAliquotaAdValoremId := AliquotaAdValoremId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
