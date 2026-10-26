unit AliquotaReferenciaEtdUnit;

interface

uses
  TipoComunsUnit,
  TipoTributoEnumUnit,
  DateAndTimeNullableUnit;

type
  AliquotaReferenciaEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FValor: Currency;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FTipoTributo: TipoTributoEnum;
  public
    class function NullInstance(): AliquotaReferenciaEtd; static;
    class function Create(
      Id: Integer;
      Valor: Currency;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      TipoTributo: TipoTributoEnum
    ): AliquotaReferenciaEtd; static;

    function Clone(): AliquotaReferenciaEtd;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Valor: Currency read FValor;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property TipoTributo: TipoTributoEnum read FTipoTributo;
  end;

  AliquotasReferenciaEtd = array of AliquotaReferenciaEtd;

implementation

{ AliquotaReferenciaEtd }

function AliquotaReferenciaEtd.Clone: AliquotaReferenciaEtd;
begin
  Result := AliquotaReferenciaEtd.Create(
    FId, FValor, FInicioVigencia, FFimVigencia, FTipoTributo
  );
  Result.FInstance := FInstance;
end;

class function AliquotaReferenciaEtd.Create(
  Id: Integer;
  Valor: Currency;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  TipoTributo: TipoTributoEnum
): AliquotaReferenciaEtd;
begin
  Result.FId := Id;
  Result.FValor := Valor;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FTipoTributo := TipoTributo;
  Result.FInstance := riNotNull;
end;

function AliquotaReferenciaEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function AliquotaReferenciaEtd.NullInstance: AliquotaReferenciaEtd;
begin
  Result.FInstance := riNull;
end;

end.
