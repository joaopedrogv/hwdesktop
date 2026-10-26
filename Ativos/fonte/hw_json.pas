unit hw_json;

interface

type
  JsonUtils = class
    class function ToJson(const Value: TObject): string;
    class function ToJsonUTF8(const Value: TObject): UTF8String;
    class function ToObject(AClassType: TClass; Value: string; isUTF8: Boolean = False): TObject;
  end;

var
  PKH: THandle;

implementation

uses
  SysUtils,
  Windows;

{ JsonUtils }

class function JsonUtils.ToJson(const Value: TObject): string;
type
  TMethod = function(const Value: TObject): string;
var
  method: TMethod;
begin
  @method := GetProcAddress(PKH, PChar('JsonUtilsToJson'));
  if Assigned(method) then
    Result := method(Value);
end;

class function JsonUtils.ToJsonUTF8(const Value: TObject): UTF8String;
type
  TMethod = function (const Value: TObject): UTF8String;
var
  method: TMethod;
begin
  @method := GetProcAddress(PKH, PChar('JsonUtilsToJsonUTF8'));
  if Assigned(method) then
    Result := method(Value);
end;

class function JsonUtils.ToObject(AClassType: TClass; Value: string;
  isUTF8: Boolean): TObject;
type
  TMethod = function (AClassType: TClass; Value: string; isUTF8: Boolean): TObject;
var
  method: TMethod;
begin
  @method := GetProcAddress(PKH, PChar('JsonUtilsToObject'));
  if Assigned(method) then
    Result := method(AClassType, Value, isUTF8);
end;

initialization
  PKH := LoadPackage(ExtractFilePath(ParamStr(0)) + 'pkUtils.bpl');

finalization
  UnloadPackage(PKH);

end.
