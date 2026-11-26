unit CalcularTributoInputUnit;

interface

uses
  ItemCalculoInputUnit,
  CompraGovernamentalInputUnit,
  TipoEnteGovernamentalEnumUnit,
  IntegerNullableUnit;

type
  ItensCalculoInput = array of ItemCalculoInput;

  CalcularTributoInput = record
  private
    FDataHoraEmissao: TDateTime;
    FDhFatoGerador: TDateTime;
    FMunicipio: Integer;
    FUF: string;
    FItens: ItensCalculoInput;
    FGCompraGov: CompraGovernamentalInput;
    FTpDoc: IntegerNullable;
  public
    class function Create(
      DataHoraEmissao: TDateTime;
      MunicipioId: Integer;
      const UF: string;
      const Itens: ItensCalculoInput;
      const GCompraGov: CompraGovernamentalInput;
      DhFatoGerador: TDateTime = 0
    ): CalcularTributoInput; overload; static;

    class function Create(
      DataHoraEmissao: TDateTime;
      MunicipioId: Integer;
      const UF: string;
      const Itens: ItensCalculoInput;
      const GCompraGov: CompraGovernamentalInput;
      DhFatoGerador: TDateTime;
      const TpDoc: IntegerNullable
    ): CalcularTributoInput; overload; static;

    function GetFatoGeradorAplicavel(): TDateTime;

    /// <summary>
    ///   Retorna o tpEnteGov interno quando ha compra governamental; caso contrario
    ///   retorna tegUnassigned (equivalente ao null de getTpEnteGov no Java).
    /// </summary>
    function GetTpEnteGov(): TipoEnteGovernamental;
    function GetCodigoUF(): Integer;

    property DataHoraEmissao: TDateTime read FDataHoraEmissao;
    property DhFatoGerador: TDateTime read FDhFatoGerador;
    property Municipio: Integer read FMunicipio;
    property UF: string read FUF;
    property Itens: ItensCalculoInput read FItens write FItens;
    property GCompraGov: CompraGovernamentalInput read FGCompraGov write FGCompraGov;
    property TpDoc: IntegerNullable read FTpDoc;
  end;

implementation

uses
  SysUtils, EstadosServiceUnit;

{ CalcularTributoInput }

class function CalcularTributoInput.Create(
  DataHoraEmissao: TDateTime;
  MunicipioId: Integer;
  const UF: string;
  const Itens: ItensCalculoInput;
  const GCompraGov: CompraGovernamentalInput;
  DhFatoGerador: TDateTime
): CalcularTributoInput;
begin
  Result := CalcularTributoInput.Create(
    DataHoraEmissao, MunicipioId, UF, Itens, GCompraGov, DhFatoGerador,
    IntegerNullable.NullInstance());
end;

class function CalcularTributoInput.Create(
  DataHoraEmissao: TDateTime;
  MunicipioId: Integer;
  const UF: string;
  const Itens: ItensCalculoInput;
  const GCompraGov: CompraGovernamentalInput;
  DhFatoGerador: TDateTime;
  const TpDoc: IntegerNullable
): CalcularTributoInput;
begin
  Result.FDataHoraEmissao := DataHoraEmissao;
  Result.FMunicipio := MunicipioId;
  Result.FUF := UF;
  Result.FItens := Itens;                
  Result.FGCompraGov := GCompraGov;
  Result.FDhFatoGerador := DhFatoGerador;
  Result.FTpDoc := TpDoc;
end;

function CalcularTributoInput.GetCodigoUF: Integer;
begin
   Result := EstadosService.UfToCodigoIBGE(FUF);
end;

function CalcularTributoInput.GetFatoGeradorAplicavel: TDateTime;
begin
  if FDhFatoGerador > 0 then
    Result := FDhFatoGerador

  else if FDataHoraEmissao > 0 then
    Result := FDataHoraEmissao

  else
    raise Exception.Create('Data fato gerador não informada');
end;

function CalcularTributoInput.GetTpEnteGov: TipoEnteGovernamental;
begin
  if FGCompraGov.IsNull() then
    Result := tegUnassigned
  else
    Result := FGCompraGov.TpEnteGov;
end;

end.
