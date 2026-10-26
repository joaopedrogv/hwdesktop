unit AliquotaAdRemEtdUnit;

interface

uses
  Contnrs,
  EntityBaseUnit,
  TipoComunsUnit,
  TipoTributoEnumUnit,
  DateAndTimeNullableUnit,
  UnidadeMedidaEtdUnit;

type
  AliquotaAdRemEtd = class(EntityBase)
  private
    FId: Integer;
    FValor: Currency;
    FUnidadeMedidaId: Integer;
    FTipoTributo: TipoTributoEnum;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FUnidadeMedida: UnidadeMedidaEtd;
  public
    constructor Create(
      Id: Integer;
      Valor: Currency;
      UnidadeMedidaId: Integer;
      TipoTributo: TipoTributoEnum;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ); overload;

    constructor Create(
      Id: Integer;
      Valor: Currency;
      UnidadeMedidaId: Integer;
      TipoTributo: TipoTributoEnum;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      UnidadeMedida: UnidadeMedidaEtd
    ); overload;

    function Clone(): EntityBase; override;

    property Id: Integer read FId;
    property Valor: Currency read FValor;
    property UnidadeMedidaId: Integer read FUnidadeMedidaId;
    property TipoTributo: TipoTributoEnum read FTipoTributo;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property UnidadeMedida: UnidadeMedidaEtd read FUnidadeMedida;
  end;

  AliquotaAdRemEtdList = class(TObjectList);

implementation

uses
  SysUtils;

{ AliquotaAdRemEtd }

constructor AliquotaAdRemEtd.Create(
  Id: Integer;
  Valor: Currency;
  UnidadeMedidaId: Integer;
  TipoTributo: TipoTributoEnum;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
);
begin
  FId := Id;
  FValor := Valor;
  FInicioVigencia := InicioVigencia;
  FFimVigencia := FimVigencia;
  FTipoTributo := TipoTributo;
  FUnidadeMedidaId := UnidadeMedidaId;
end;

function AliquotaAdRemEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil

  else
    Result := AliquotaAdRemEtd.Create(
      FId, FValor, FUnidadeMedidaId, FTipoTributo, FInicioVigencia, FFimVigencia, FUnidadeMedida
    );
end;

constructor AliquotaAdRemEtd.Create(
  Id: Integer;
  Valor: Currency;
  UnidadeMedidaId: Integer;
  TipoTributo: TipoTributoEnum;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  UnidadeMedida: UnidadeMedidaEtd);
begin
  Create( Id, Valor, UnidadeMedidaId, TipoTributo, InicioVigencia, FimVigencia );

  if not UnidadeMedida.IsNull() then
    FUnidadeMedida := UnidadeMedida
  else
    FUnidadeMedida := UnidadeMedidaEtd.NullInstance();
end;

end.
