unit PercentualReducaoEtdUnit;

interface

uses
  TipoComunsUnit,
  TipoTributoEnumUnit,
  DateAndTimeNullableUnit;

type
  PercentualReducaoEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FClassificacaoTributariaId: Integer;
    FTipoTributo: TipoTributoEnum;
    FValor: Currency;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function NullInstance(): PercentualReducaoEtd; static;

    class function CreateEtd(
      Id: Integer;
      ClassificacaoTributariaId: Integer;
      TipoTributo: TipoTributoEnum;
      Valor: Currency;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): PercentualReducaoEtd; static;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property ClassificacaoTributariaId: Integer read FClassificacaoTributariaId;
    property TipoTributo: TipoTributoEnum read FTipoTributo;
    property Valor: Currency read FValor;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  PercentuaisReducaoEtd = array of PercentualReducaoEtd;

implementation

{ PercentualReducaoEtd }

class function PercentualReducaoEtd.CreateEtd(
  Id: Integer;
  ClassificacaoTributariaId: Integer;
  TipoTributo: TipoTributoEnum;
  Valor: Currency;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): PercentualReducaoEtd;
begin
  Result.FId := Id;
  Result.FClassificacaoTributariaId := ClassificacaoTributariaId;
  Result.FTipoTributo := TipoTributo;
  Result.FValor := Valor;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FInstance := riNotNull;
end;

function PercentualReducaoEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function PercentualReducaoEtd.NullInstance: PercentualReducaoEtd;
begin
  Result.FInstance := riNull;
end;

end.
