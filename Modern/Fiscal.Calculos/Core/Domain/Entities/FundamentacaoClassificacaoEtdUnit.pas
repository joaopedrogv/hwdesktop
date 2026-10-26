unit FundamentacaoClassificacaoEtdUnit;

interface

uses
  EntityBaseUnit,
  ClassificacaoTributariaEtdUnit,
  FundamentacaoLegalEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  Contnrs;

type
  FundamentacaoClassificacaoEtd = class(EntityBase)
  private
    FId                        : Integer;
    FClassificacaoTributariaId : Integer;
    FClassificacaoTributaria   : ClassificacaoTributariaEtd;
    FFundamentacaoLegalId      : Integer;
    FFundamentacaoLegal        : FundamentacaoLegalEtd;
    FInicioVigencia            : TDate;
    FFimVigencia               : DateNullable;
  public
    constructor Create(
      Id                        : Integer;
      ClassificacaoTributariaId : Integer;
      FundamentacaoLegalId      : Integer;
      InicioVigencia            : TDate;
      const FimVigencia         : DateNullable
    ); overload;

    constructor Create(
      Id                        : Integer;
      ClassificacaoTributariaId : Integer;
      FundamentacaoLegalId      : Integer;
      InicioVigencia            : TDate;
      const FimVigencia         : DateNullable;
      ClassificacaoTributaria   : ClassificacaoTributariaEtd;
      const FundamentacaoLegal  : FundamentacaoLegalEtd
    ); overload;

    destructor Destroy; override;

    function Clone(): EntityBase; override;

    property Id                        : Integer                    read FId;
    property ClassificacaoTributariaId : Integer                    read FClassificacaoTributariaId;
    property ClassificacaoTributaria   : ClassificacaoTributariaEtd read FClassificacaoTributaria;
    property FundamentacaoLegalId      : Integer                    read FFundamentacaoLegalId;
    property FundamentacaoLegal        : FundamentacaoLegalEtd      read FFundamentacaoLegal;
    property InicioVigencia            : TDate                      read FInicioVigencia;
    property FimVigencia               : DateNullable               read FFimVigencia;
  end;

  FundamentacoesClassificacoesEtd = class(TObjectList);

implementation

{ FundamentacaoClassificacaoEtd }

function FundamentacaoClassificacaoEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := FundamentacaoClassificacaoEtd.Create(
      FId, FClassificacaoTributariaId, FFundamentacaoLegalId, FInicioVigencia, FFimVigencia,
      ClassificacaoTributariaEtd(FClassificacaoTributaria.Clone()), FFundamentacaoLegal
    );
end;

constructor FundamentacaoClassificacaoEtd.Create(
  Id                        : Integer;
  ClassificacaoTributariaId : Integer;
  FundamentacaoLegalId      : Integer;
  InicioVigencia            : TDate;
  const FimVigencia         : DateNullable;
  ClassificacaoTributaria   : ClassificacaoTributariaEtd;
  const FundamentacaoLegal  : FundamentacaoLegalEtd
);
begin
  Create(
    Id, ClassificacaoTributariaId, FundamentacaoLegalId, InicioVigencia, FimVigencia
  );
  FClassificacaoTributaria := ClassificacaoTributaria;
  FFundamentacaoLegal      := FundamentacaoLegal;
end;

destructor FundamentacaoClassificacaoEtd.Destroy;
begin
  FClassificacaoTributaria.Free();
  inherited;
end;

constructor FundamentacaoClassificacaoEtd.Create(
  Id                        : Integer;
  ClassificacaoTributariaId : Integer;
  FundamentacaoLegalId      : Integer;
  InicioVigencia            : TDate;
  const FimVigencia         : DateNullable
);
begin
  FId                        := Id;
  FClassificacaoTributariaId := ClassificacaoTributariaId;
  FFundamentacaoLegalId      := FundamentacaoLegalId;
  FInicioVigencia            := InicioVigencia;
  FFimVigencia               := FimVigencia;
end;

end.
