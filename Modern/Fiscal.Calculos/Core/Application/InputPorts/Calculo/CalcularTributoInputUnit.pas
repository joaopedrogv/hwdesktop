unit CalcularTributoInputUnit;

interface

uses
  ItemCalculoInputUnit,
  CompraGovernamentalInputUnit,
  TipoEnteGovernamentalEnumUnit;

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
  public
    class function Create(
      DataHoraEmissao: TDateTime;
      MunicipioId: Integer;
      const UF: string;
      const Itens: ItensCalculoInput;
      const GCompraGov: CompraGovernamentalInput;
      DhFatoGerador: TDateTime = 0
    ): CalcularTributoInput; static;

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
  Result.FDataHoraEmissao := DataHoraEmissao;
  Result.FMunicipio := MunicipioId;
  Result.FUF := UF;
  Result.FItens := Itens;                
  Result.FGCompraGov := GCompraGov;
  Result.FDhFatoGerador := DhFatoGerador;
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
