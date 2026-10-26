unit IRemoverTributoDFeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  TipoComunsUnit,
  TributoDFeOrigemEnumUnit;
        
type
  {$IFDEF INTF_ON}
  IRemoverTributoDFeUseCase = interface
    ['{6BB4742A-B661-45EF-B072-54AED2146005}']
    procedure Executar(const Ids: TArrayString; Origem: TributoDFeOrigemEnum);
  end;
  {$ELSE}         
  IRemoverTributoDFeUseCase = class(BaseUseCase)
  public
    procedure Executar(const Ids: TArrayString; Origem: TributoDFeOrigemEnum); virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
