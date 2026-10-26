unit TomadorEspecificoEtdUnit;

interface

uses
  TipoComunsUnit, DateAndTimeNullableUnit;

type
  TomadorEspecificoEtd = record
  private
    FInstance: RecordInstance;
    FId: Int64;
    FNome: string;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function NullInstance(): TomadorEspecificoEtd; static;
    class function Create(
      Id: Int64;
      const Nome: string;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): TomadorEspecificoEtd; static;

    function IsNull(): Boolean;

    property Id: Int64 read FId;
    property Nome: string read FNome;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  TomadoresEspecificosEtd = array of TomadorEspecificoEtd;

implementation

{ TomadorEspecificoEtd }

class function TomadorEspecificoEtd.Create(
  Id: Int64;
  const Nome: string;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): TomadorEspecificoEtd;
begin
  Result.FId := Id;
  Result.FNome := Nome;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FInstance := riNotNull;
end;

function TomadorEspecificoEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function TomadorEspecificoEtd.NullInstance: TomadorEspecificoEtd;
begin
  Result.FInstance := riNull;
end;

end.
