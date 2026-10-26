unit AliquotaAdValoremEtdUnit;

interface

uses
  TipoComunsUnit,
  TipoTributoEnumUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit;

type
  AliquotaAdValoremEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FValor: Currency;
    FTipoTributo: TipoTributoEnum;
    FClassificacaoTributariaId: IntegerNullable;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function NullInstance(): AliquotaAdValoremEtd; static;

    class function CreateEtd(
      Id: Integer;
      Valor: Currency;
      TipoTributo: TipoTributoEnum;
      const ClassificacaoTributariaId: IntegerNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): AliquotaAdValoremEtd; static;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Valor: Currency read FValor;
    property TipoTributo: TipoTributoEnum read FTipoTributo;
    property ClassificacaoTributariaId: IntegerNullable read FClassificacaoTributariaId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  AliquotasAdValoremEtd = array of AliquotaAdValoremEtd;

implementation

{ AliquotaAdValoremEtd }

class function AliquotaAdValoremEtd.CreateEtd(
  Id: Integer;
  Valor: Currency;
  TipoTributo: TipoTributoEnum;
  const ClassificacaoTributariaId: IntegerNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): AliquotaAdValoremEtd;
begin
  Result.FInstance := riNotNull;
  Result.FId := Id;
  Result.FValor := Valor;
  Result.FTipoTributo := TipoTributo;
  Result.FClassificacaoTributariaId := ClassificacaoTributariaId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

function AliquotaAdValoremEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function AliquotaAdValoremEtd.NullInstance: AliquotaAdValoremEtd;
begin
  Result.FInstance := riNull;
end;

end.
