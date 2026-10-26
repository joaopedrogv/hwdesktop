unit TiposTributosServiceUnit;

interface

uses
  TipoTributoFiscalEnumUnit,
  TipoTributoEnumUnit;

type

  TiposTributosService = class
  public
    class function FiscalToRtcSet(Tributo: TipoTributoFiscalEnum): TipoTributoEnumSet;
    class function SetToStr(const TributoSet: TipoTributoEnumSet): string;
  end;

implementation

uses StringServiceUnit, EnumServiceUnit;

{ TiposTributosService }

class function TiposTributosService.FiscalToRtcSet(
  Tributo: TipoTributoFiscalEnum): TipoTributoEnumSet;
begin
  case Tributo of
    tfIBSCBS    : Result := [ tbtCBS, tbtIBSUF, tbtIBSMun ];
    tfIS        : Result := [ tbtIS ];
  else
    Result := [];
  end;
end;

class function TiposTributosService.SetToStr(
  const TributoSet: TipoTributoEnumSet): string;
begin
  Result := StringService.Default( StringService.Join(',',
    EnumService.SetAsArrayString(TypeInfo(TipoTributoEnumSet), TributoSet)
  ), '0');
end;

end.
