unit RedutorCompraGovernamentalServiceUnit;

interface

uses
  TipoComunsUnit, IRedutorCompraGovernamentalRepositoryUnit, TipoEnteGovernamentalEnumUnit;

type
  IRedutorCompraGovernamentalService = interface
    ['{CD9C328E-F1A8-4243-89C7-B487909C341F}']
    function BuscarValorRedutor(TpEnteGov: TipoEnteGovernamental; const Data: TDate): Currency;
  end;

  RedutorCompraGovernamentalService = class(TInterfacedObject, IRedutorCompraGovernamentalService)
  private
     FRedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository;
  public
    constructor Create(RedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository);

    function BuscarValorRedutor(TpEnteGov: TipoEnteGovernamental; const Data: TDate): Currency;
  end;

implementation

uses
  SysUtils, CurrencyNullableUnit, EValidacaoRTCUnit;

{ RedutorCompraGovernamentalService }

constructor RedutorCompraGovernamentalService.Create(
  RedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository);
begin
  FRedutorCompraGovernamentalRepo := RedutorCompraGovernamentalRepo;
end;

function RedutorCompraGovernamentalService.BuscarValorRedutor(TpEnteGov: TipoEnteGovernamental;
  const Data: TDate): Currency;
var
  Redutor: CurrencyNullable;
begin
  if TpEnteGov = tegUnassigned then
  begin
    Result := 0;
    Exit;
  end;

  Redutor := FRedutorCompraGovernamentalRepo.ObterValorRedutor(Data);

  if Redutor.IsNull then
    raise EValidacaoRTC.Create('Redutor de compra governamental não encontrada.');

  Result := Redutor.Value;
end;

end.
