unit TratamentoClassificacaoEtdUnit;

interface

uses
  EntityBaseUnit,
  ClassificacaoTributariaEtdUnit,
  TratamentoTributarioEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  Contnrs;

type
  TratamentoClassificacaoEtd = class(EntityBase)
  private
    FId: Integer;
    FClassificacaoTributariaId: Integer;
    FClassificacaoTributaria: ClassificacaoTributariaEtd;
    FTratamentoTributarioId: Integer;
    FTratamentoTributario: TratamentoTributarioEtd;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    constructor Create(
      Id: Integer;
      ClassificacaoTributariaId: Integer;
      TratamentoTributarioId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ); overload;

    constructor Create(
      Id: Integer;
      ClassificacaoTributariaId: Integer;
      TratamentoTributarioId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      ClassificacaoTributaria: ClassificacaoTributariaEtd;
      const TratamentoTributario: TratamentoTributarioEtd
    ); overload;

    destructor Destroy; override;

    function Clone(): EntityBase; override;

    property Id: Integer read FId;
    property ClassificacaoTributariaId: Integer read FClassificacaoTributariaId;
    property ClassificacaoTributaria: ClassificacaoTributariaEtd read FClassificacaoTributaria;
    property TratamentoTributarioId: Integer read FTratamentoTributarioId;
    property TratamentoTributario: TratamentoTributarioEtd read FTratamentoTributario;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  TratamentosClassificacoesEtd = class(TObjectList);

implementation

{ TratamentoClassificacaoEtd }

function TratamentoClassificacaoEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := TratamentoClassificacaoEtd.Create(
      FId, FClassificacaoTributariaId, FTratamentoTributarioId,
      FInicioVigencia, FFimVigencia,
      ClassificacaoTributariaEtd(FClassificacaoTributaria.Clone()),
      FTratamentoTributario.Clone()
    );
end;

constructor TratamentoClassificacaoEtd.Create(
  Id: Integer;
  ClassificacaoTributariaId: Integer;
  TratamentoTributarioId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  ClassificacaoTributaria: ClassificacaoTributariaEtd;
  const TratamentoTributario: TratamentoTributarioEtd
);
begin
  Create(
    Id, ClassificacaoTributariaId, TratamentoTributarioId,
    InicioVigencia, FimVigencia
  );
  FClassificacaoTributaria := ClassificacaoTributaria;
  FTratamentoTributario := TratamentoTributario;
end;

destructor TratamentoClassificacaoEtd.Destroy;
begin
  FClassificacaoTributaria.Free();
  inherited;
end;

constructor TratamentoClassificacaoEtd.Create(
  Id: Integer;
  ClassificacaoTributariaId: Integer;
  TratamentoTributarioId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
);
begin
  FId                        := Id;
  FClassificacaoTributariaId := ClassificacaoTributariaId;
  FTratamentoTributarioId    := TratamentoTributarioId;
  FInicioVigencia            := InicioVigencia;
  FFimVigencia               := FimVigencia;
end;

end.
