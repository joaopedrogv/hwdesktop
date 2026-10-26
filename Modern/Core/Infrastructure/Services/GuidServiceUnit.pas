unit GuidServiceUnit;

interface

type
  GuidService = class
  public
    class function New(): string;
  end;

implementation

uses
  SysUtils;

{ GuidService }

class function GuidService.New: string;
var
  guid: TGUID;
begin
  if CreateGUID(guid) <> S_OK then
    RaiseLastOSError;

  Result := Copy(GUIDToString(guid), 2, 36);
end;

end.
