unit JsonResourceUnit;

interface

uses
  SysUtils, Classes;

type
  JsonResource = class
  private
    FRootPath: string;
    function TryReadFile(const AResourcePath: string; out AJsonString: string): Boolean;
  public
    constructor Create(const AResourcePath: string = '');

    function DeserializeObject<T:class,constructor>(const AResourcePath: string): T;
  end;

implementation

uses
  System.IOUtils, System.TypInfo, System.Json, System.Rtti, REST.Json;

{ JsonResource }

constructor JsonResource.Create(const AResourcePath: string = '');
begin
  if AResourcePath <> '' then
  begin
    FRootPath := AResourcePath;
    Exit;
  end;

  FRootPath := TPath.Combine(ExtractFilePath(ParamStr(0)), '..\..\resources');
  if not TDirectory.Exists(FRootPath) then
    FRootPath := TPath.Combine(ExtractFilePath(ParamStr(0)), '..\resources');
  if not TDirectory.Exists(FRootPath) then
    FRootPath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'resources');
  if not TDirectory.Exists(FRootPath) then
    FRootPath := '';
end;

function JsonResource.TryReadFile(const AResourcePath: string; out AJsonString: string): Boolean;
var
  ResourcePath: string;
begin
  Result := False;

  ResourcePath := TPath.Combine(FRootPath, AResourcePath);

  if not TFile.Exists(ResourcePath) then
    Exit;

  AJsonString := TFile.ReadAllText(ResourcePath);

  Result := True;
end;

function JsonResource.DeserializeObject<T>(const AResourcePath: string): T;
var
  JsonContent: string;
begin
  if not TryReadFile(AResourcePath, JsonContent) then
    Result := Default(T);

  Result := TJson.JsonToObject<T>(JsonContent);
end;

end.