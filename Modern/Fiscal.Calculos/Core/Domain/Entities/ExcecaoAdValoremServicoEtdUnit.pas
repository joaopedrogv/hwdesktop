unit ExcecaoAdValoremServicoEtdUnit;

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  ExcecaoAdValoremServicoEtd = record
  private
    FId: Integer;
    FNbs: string;
    FAliquotaAdValoremServicoId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function CreateEtd(
      Id: Integer;
      const Nbs: string;
      AliquotaAdValoremServicoId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): ExcecaoAdValoremServicoEtd; static;

    property Id: Integer read FId;
    property Nbs: string read FNbs;
    property AliquotaAdValoremServicoId: Integer read FAliquotaAdValoremServicoId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  ExcecoesAdValoremServicosEtd = array of ExcecaoAdValoremServicoEtd;

implementation

{ ExcecaoAdValoremServicoEtd }

class function ExcecaoAdValoremServicoEtd.CreateEtd(
  Id: Integer;
  const Nbs: string;
  AliquotaAdValoremServicoId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): ExcecaoAdValoremServicoEtd;
begin
  Result.FId := Id;
  Result.FNbs := Nbs;
  Result.FAliquotaAdValoremServicoId := AliquotaAdValoremServicoId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
