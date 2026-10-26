unit AliquotaAdRemServicoEtdUnit;

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  AliquotaAdRemServicoEtd = record
  private
    FId: Integer;
    FNbs: string;
    FAliquotaAdRemId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public

    class function CreateEtd(
      Id: Integer;
      const Nbs: string;
      AliquotaAdRemId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): AliquotaAdRemServicoEtd; static;

    property Id: Integer read FId;
    property Nbs: string read FNbs write FNbs;
    property AliquotaAdRemId: Integer read FAliquotaAdRemId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  AliquotasAdRemServicosEtd = array of AliquotaAdRemServicoEtd;

implementation

{ AliquotaAdRemServicoEtd }

class function AliquotaAdRemServicoEtd.CreateEtd(
  Id: Integer;
  const Nbs: string;
  AliquotaAdRemId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): AliquotaAdRemServicoEtd;
begin
  Result.FId := Id;
  Result.FNbs := Nbs;
  Result.FAliquotaAdRemId := AliquotaAdRemId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
