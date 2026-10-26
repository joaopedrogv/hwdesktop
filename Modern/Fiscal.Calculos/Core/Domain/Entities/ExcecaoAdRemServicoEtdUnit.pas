unit ExcecaoAdRemServicoEtdUnit;

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  ExcecaoAdRemServicoEtd = record
  private
    FId: Integer;
    FNbs: string;
    FAliquotaAdRemServicoId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function CreateEtd(
      Id: Integer;
      const Nbs: string;
      AliquotaAdRemServicoId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): ExcecaoAdRemServicoEtd; static;

    property Id: Integer read FId;
    property Nbs: string read FNbs;
    property AliquotaAdRemServicoId: Integer read FAliquotaAdRemServicoId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  ExcecoesAdRemServicosEtd = array of ExcecaoAdRemServicoEtd;

implementation

{ ExcecaoAdRemServicoEtd }

class function ExcecaoAdRemServicoEtd.CreateEtd(
  Id: Integer;
  const Nbs: string;
  AliquotaAdRemServicoId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): ExcecaoAdRemServicoEtd;
begin
  Result.FId := Id;
  Result.FNbs := Nbs;
  Result.FAliquotaAdRemServicoId := AliquotaAdRemServicoId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
