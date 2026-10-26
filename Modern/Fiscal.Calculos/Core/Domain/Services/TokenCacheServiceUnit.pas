unit TokenCacheServiceUnit;

interface

uses
  TextTokenModelUnit;

type
  TokenCacheService = class
  public
    class function GetToken(const AText: string; const AKey: string): TextTokenModel; static;
  end;

implementation

{ TokenCacheService }

class function TokenCacheService.GetToken(const AText: string; const AKey: string): TextTokenModel;
begin
  Result := TextTokenModel.Create(AText, AKey);
end;

end.
