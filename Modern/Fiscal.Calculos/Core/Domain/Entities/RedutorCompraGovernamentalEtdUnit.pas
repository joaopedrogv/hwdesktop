unit RedutorCompraGovernamentalEtdUnit;

interface

uses
  EntityBaseUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  Contnrs;

type
  /// <summary>
  ///   Entidade da tabela REDUTOR_COMPRA_GOVERNAMENTAL que armazena o redutor
  ///   aplicavel a compras governamentais em cada periodo de vigencia.
  ///   Equivale a RedutorCompraGovernamental.java (valor >= 0; inicio obrigatorio; fim opcional).
  /// </summary>
  RedutorCompraGovernamentalEtd = class(EntityBase)
  private
    FId: Integer;
    FValor: Currency;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    constructor Create(
      Id: Integer;
      Valor: Currency;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    );

    function Clone(): EntityBase; override;

    property Id: Integer read FId write FId;
    property Valor: Currency read FValor write FValor;
    property InicioVigencia: TDate read FInicioVigencia write FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia write FFimVigencia;
  end;

  RedutoresCompraGovernamentalEtd = class(TObjectList);

implementation

{ RedutorCompraGovernamentalEtd }

function RedutorCompraGovernamentalEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := RedutorCompraGovernamentalEtd.Create(
      FId, FValor, FInicioVigencia, FFimVigencia
    );
end;

constructor RedutorCompraGovernamentalEtd.Create(
  Id: Integer;
  Valor: Currency;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
);
begin
  FId := Id;
  FValor := Valor;
  FInicioVigencia := InicioVigencia;
  FFimVigencia := FimVigencia;
end;

end.
