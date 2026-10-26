unit AnexoEtdUnit;

interface

uses
  TipoComunsUnit, DateAndTimeNullableUnit;

type
  AnexoEtd = record
  private
    FInstance: RecordInstance;
    FId: Int64;
    FNumero: string;
    FDescricao: string;
    FNumeroItem: string;
    FTextoItem: string;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function NullInstance(): AnexoEtd; static;
    class function Create(
      Id: Int64;
      const Numero: string;
      const Descricao: string;
      const NumeroItem: string;
      const TextoItem: string;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): AnexoEtd; static;

    function IsNull(): Boolean;

    property Id: Int64 read FId;
    property Numero: string read FNumero;
    property Descricao: string read FDescricao;
    property NumeroItem: string read FNumeroItem;
    property TextoItem: string read FTextoItem;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  AnexosEtd = array of AnexoEtd;

implementation

{ AnexoEtd }

class function AnexoEtd.Create(
  Id: Int64;
  const Numero: string;
  const Descricao: string;
  const NumeroItem: string;
  const TextoItem: string;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): AnexoEtd;
begin
  Result.FId := Id;
  Result.FNumero := Numero;
  Result.FDescricao := Descricao;
  Result.FNumeroItem := NumeroItem;
  Result.FTextoItem := TextoItem;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FInstance := riNotNull;
end;

function AnexoEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function AnexoEtd.NullInstance: AnexoEtd;
begin
  Result.FInstance := riNull;
end;

end.
