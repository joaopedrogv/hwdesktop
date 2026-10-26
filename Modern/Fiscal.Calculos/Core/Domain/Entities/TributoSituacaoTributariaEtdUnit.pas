unit TributoSituacaoTributariaEtdUnit;

interface

uses
  EntityBaseUnit,
  SituacaoTributariaEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  TipoTributoEnumUnit,
  Contnrs;

type
  TributoSituacaoTributariaEtd = class(EntityBase)
  private
    FId                  : Integer;
    FSituacaoTributariaId: Integer;
    FSituacaoTributaria  : SituacaoTributariaEtd;
    FTipoTributo         : TipoTributoEnum;
    FInicioVigencia      : TDate;
    FFimVigencia         : DateNullable;
  public
    constructor Create(
      Id                  : Integer;
      SituacaoTributariaId: Integer;
      TipoTributo         : TipoTributoEnum;
      InicioVigencia      : TDate;
      const FimVigencia   : DateNullable
    ); overload;

    constructor Create(
      Id                      : Integer;
      SituacaoTributariaId    : Integer;
      TipoTributo             : TipoTributoEnum;
      InicioVigencia          : TDate;
      const FimVigencia       : DateNullable;
      const SituacaoTributaria: SituacaoTributariaEtd
    ); overload;

    function Clone(): EntityBase; override;

    property Id                  : Integer               read FId;
    property SituacaoTributariaId: Integer               read FSituacaoTributariaId;
    property SituacaoTributaria  : SituacaoTributariaEtd read FSituacaoTributaria;
    property TipoTributo         : TipoTributoEnum       read FTipoTributo;
    property InicioVigencia      : TDate                 read FInicioVigencia;
    property FimVigencia         : DateNullable          read FFimVigencia;
  end;

  TributoSituacoesTributariasEtd = class(TObjectList);

implementation

{ TributoSituacaoTributariaEtd }

function TributoSituacaoTributariaEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoSituacaoTributariaEtd.Create(
      FId, FSituacaoTributariaId, FTipoTributo, FInicioVigencia, FFimVigencia,
      FSituacaoTributaria.Clone()
    );
end;

constructor TributoSituacaoTributariaEtd.Create(
  Id                      : Integer;
  SituacaoTributariaId    : Integer;
  TipoTributo             : TipoTributoEnum;
  InicioVigencia          : TDate;
  const FimVigencia       : DateNullable;
  const SituacaoTributaria: SituacaoTributariaEtd
);
begin
  Create(
    Id, SituacaoTributariaId, TipoTributo, InicioVigencia, FimVigencia
  );
  FSituacaoTributaria := SituacaoTributaria;
end;

constructor TributoSituacaoTributariaEtd.Create(
  Id                  : Integer;
  SituacaoTributariaId: Integer;
  TipoTributo         : TipoTributoEnum;
  InicioVigencia      : TDate;
  const FimVigencia   : DateNullable
);
begin
  FId                   := Id;
  FSituacaoTributariaId := SituacaoTributariaId;
  FTipoTributo          := TipoTributo;
  FInicioVigencia       := InicioVigencia;
  FFimVigencia          := FimVigencia;
end;

end.
