unit ComponentesBaseCalculoInputUnit;

interface

uses
  CurrencyNullableUnit,
  ElementoBaseCalculoUnit,
  TipoComunsUnit;

type
  ComponentesBaseCalculoInput = record
  private
    FInstance: RecordInstance;
    FVProd: CurrencyNullable;
    FVFrete: CurrencyNullable;
    FVSeg: CurrencyNullable;
    FVOutro: CurrencyNullable;
    FVII: CurrencyNullable;
    FVIS: CurrencyNullable;
    FVDesc: CurrencyNullable;
    FVPIS: CurrencyNullable;
    FVCOFINS: CurrencyNullable;
    FVICMS: CurrencyNullable;
    FVICMSUFDest: CurrencyNullable;
    FVFCP: CurrencyNullable;
    FVFCPUFDest: CurrencyNullable;
    FVICMSMono: CurrencyNullable;
    FVISSQN: CurrencyNullable;
  public
    class function NullInstance(): ComponentesBaseCalculoInput; static;
    class function Create(): ComponentesBaseCalculoInput; static;

    function IsNull(): Boolean;
    function PossuiComponentes(): Boolean;
    function GetValor(Elemento: ElementoBaseCalculo): CurrencyNullable;

    property VProd: CurrencyNullable read FVProd write FVProd;
    property VFrete: CurrencyNullable read FVFrete write FVFrete;
    property VSeg: CurrencyNullable read FVSeg write FVSeg;
    property VOutro: CurrencyNullable read FVOutro write FVOutro;
    property VII: CurrencyNullable read FVII write FVII;
    property VIS: CurrencyNullable read FVIS write FVIS;
    property VDesc: CurrencyNullable read FVDesc write FVDesc;
    property VPIS: CurrencyNullable read FVPIS write FVPIS;
    property VCOFINS: CurrencyNullable read FVCOFINS write FVCOFINS;
    property VICMS: CurrencyNullable read FVICMS write FVICMS;
    property VICMSUFDest: CurrencyNullable read FVICMSUFDest write FVICMSUFDest;
    property VFCP: CurrencyNullable read FVFCP write FVFCP;
    property VFCPUFDest: CurrencyNullable read FVFCPUFDest write FVFCPUFDest;
    property VICMSMono: CurrencyNullable read FVICMSMono write FVICMSMono;
    property VISSQN: CurrencyNullable read FVISSQN write FVISSQN;
  end;

implementation

uses
  SysUtils;

class function ComponentesBaseCalculoInput.Create: ComponentesBaseCalculoInput;
begin
  Result.FInstance := riNotNull;
  Result.FVProd := CurrencyNullable.NullInstance();
  Result.FVFrete := CurrencyNullable.NullInstance();
  Result.FVSeg := CurrencyNullable.NullInstance();
  Result.FVOutro := CurrencyNullable.NullInstance();
  Result.FVII := CurrencyNullable.NullInstance();
  Result.FVIS := CurrencyNullable.NullInstance();
  Result.FVDesc := CurrencyNullable.NullInstance();
  Result.FVPIS := CurrencyNullable.NullInstance();
  Result.FVCOFINS := CurrencyNullable.NullInstance();
  Result.FVICMS := CurrencyNullable.NullInstance();
  Result.FVICMSUFDest := CurrencyNullable.NullInstance();
  Result.FVFCP := CurrencyNullable.NullInstance();
  Result.FVFCPUFDest := CurrencyNullable.NullInstance();
  Result.FVICMSMono := CurrencyNullable.NullInstance();
  Result.FVISSQN := CurrencyNullable.NullInstance();
end;

class function ComponentesBaseCalculoInput.NullInstance: ComponentesBaseCalculoInput;
begin
  Result := ComponentesBaseCalculoInput.Create();
  Result.FInstance := riNull;
end;

function ComponentesBaseCalculoInput.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function ComponentesBaseCalculoInput.PossuiComponentes: Boolean;
begin
  Result := FVProd.HasValue or FVFrete.HasValue or FVSeg.HasValue or FVOutro.HasValue or
    FVII.HasValue or FVIS.HasValue or FVDesc.HasValue or FVPIS.HasValue or FVCOFINS.HasValue or
    FVICMS.HasValue or FVICMSUFDest.HasValue or FVFCP.HasValue or FVFCPUFDest.HasValue or
    FVICMSMono.HasValue or FVISSQN.HasValue;
end;

function ComponentesBaseCalculoInput.GetValor(Elemento: ElementoBaseCalculo): CurrencyNullable;
begin
  case Elemento of
    ebcVProd: Result := FVProd;
    ebcVFrete: Result := FVFrete;
    ebcVSeg: Result := FVSeg;
    ebcVOutro: Result := FVOutro;
    ebcVII: Result := FVII;
    ebcVIS: Result := FVIS;
    ebcVDesc: Result := FVDesc;
    ebcVPIS: Result := FVPIS;
    ebcVCOFINS: Result := FVCOFINS;
    ebcVICMS: Result := FVICMS;
    ebcVICMSUFDest: Result := FVICMSUFDest;
    ebcVFCP: Result := FVFCP;
    ebcVFCPUFDest: Result := FVFCPUFDest;
    ebcVICMSMono: Result := FVICMSMono;
    ebcVISSQN: Result := FVISSQN;
  else
    raise ERangeError.CreateFmt('Elemento de base de cálculo inválido: %d', [Ord(Elemento)]);
  end;
end;

end.
