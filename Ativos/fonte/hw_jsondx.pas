unit hw_jsondx;

interface

uses
  Neon.Core.Persistence,
  System.Rtti;

type
  TJsonUtilsDX = class
  private
    class function GetConfig(): INeonConfiguration;
    class function ObjectInstance(Ctx: TRttiContext; TypeName: string): TObject;
    class function CreateInstance<T: class, constructor>(): T;
  public
    class function Serialize(const AObject: TObject): string;
    class function Deseerialize<T: class, constructor>(const AJson: string): T;
    class function DeserializeStringArray(const AJsonString: string): TArray<string>;
  end;

implementation

uses
  SysUtils, Neon.Core.Types, System.JSON, Neon.Core.Persistence.JSON, System.TypInfo;

{ TJsonUtilsDX }

class function TJsonUtilsDX.CreateInstance<T>: T;
var
  LObjectType: string;
  LObject: TObject;
  LRttiCtx: TRttiContext;
begin
  LRttiCtx.GetType(TObject);
  if not Assigned(T) then
    result := nil
  else
  begin
    LObjectType := T.QualifiedClassName;
    LObject := ObjectInstance(LRttiCtx, LObjectType);

    if LObject = nil then
      raise Exception.Create('nil instance');

    result := LObject as T;
  end;
end;

class function TJsonUtilsDX.Deseerialize<T>(const AJson: string): T;
var
  LObject: TObject;
  LJSON: TJSONValue;
  LReader: TNeonDeserializerJSON;
  LConfig: INeonConfiguration;
begin

  LJSON := TJSONObject.ParseJSONValue(AJson);
  if not Assigned(LJSON) then
    raise Exception.CreateFmt('%s<%s>.DeserializeObject Error parsing JSON string', [Self.ClassName, LObject.ClassName]);

  LConfig := TJsonUtilsDX.GetConfig();

  LObject := TJsonUtilsDX.CreateInstance<T>();
  try
    LReader := TNeonDeserializerJSON.Create(LConfig);
    try
      LReader.JSONToObject(LObject, LJSON);

      if (LReader.Errors.Count > 0) then
        raise Exception.Create('Error: ' + sLineBreak + LReader.Errors.Text);

      Result := LObject as T;

    finally
      LReader.Free;
    end;

  finally
    LJSON.Free;
  end;
end;

class function TJsonUtilsDX.DeserializeStringArray(
  const AJsonString: string): TArray<string>;
var
  JsonArray: TJSONArray;
  I: Integer;
begin
  Result := [];

  // Parse the raw JSON string into a JSON Array
  JsonArray := TJSONObject.ParseJSONValue(AJsonString) as TJSONArray;
  if Assigned(JsonArray) then
  begin
    try
      SetLength(Result, JsonArray.Count);
      for I := 0 to JsonArray.Count - 1 do
      begin
        // Extract the string value from each array element
        Result[I] := JsonArray.Items[I].Value;
      end;
    finally
      JsonArray.Free;
    end;
  end;
end;

class function TJsonUtilsDX.GetConfig: INeonConfiguration;
begin
  Result := TNeonConfiguration.Default;

  Result.SetMemberCustomCase(nil);
  Result.SetMemberCase(TNeonCase.Unchanged);
//  Result.SetMemberCase(TNeonCase.PascalCase);
//  Result.SetMemberCase(TNeonCase.CamelCase);
//  Result.SetMemberCase(TNeonCase.SnakeCase);
//  Result.SetMemberCase(TNeonCase.LowerCase);
//  Result.SetMemberCase(TNeonCase.UpperCase);

  Result.SetMembers( [TNeonMembers.Standard {,TNeonMembers.Fields, TNeonMembers.Properties}] );

  Result.SetVisibility([mvPublic, mvPublished]);

  Result.SetIgnoreFieldPrefix(False);

  Result.SetUseUTCDate(False);

  Result.SetPrettyPrint(True);

  Result.SetAutoCreate(False);

  Result.SetStrictTypes(True);

//Custom Serializers
//  if TSerializersType.CustomNeon in ASerializers then
//    RegisterNeonSerializers(Result.GetSerializers);
//
//  if TSerializersType.CustomDemo in ASerializers then
//    RegisterDemoSerializers(Result.GetSerializers);
end;

class function TJsonUtilsDX.ObjectInstance(Ctx: TRttiContext;
  TypeName: string): TObject;
var
  rType: TRttiType;
  mType: TRTTIMethod;
  metaClass: TClass;
begin
  rType := Ctx.FindType(TypeName); //ObjectType(Ctx, TypeName);
  if (rType <> nil) then
    for mType in rType.GetMethods do
    begin
      if mType.HasExtendedInfo and mType.IsConstructor then
      begin
        if Length(mType.GetParameters) = 0 then
        begin
          // invoke
          metaClass := rType.AsInstance.MetaclassType;
          Exit(mType.Invoke(metaClass, []).AsObject);
        end;
      end;
    end;
  Exit(nil);
end;

class function TJsonUtilsDX.Serialize(const AObject: TObject): string;
var
  LJSON: TJSONValue;
  LWriter: TNeonSerializerJSON;
  LConfig: INeonConfiguration;
begin
  LConfig := TJsonUtilsDX.GetConfig();
  LWriter := TNeonSerializerJSON.Create( LConfig );
  try
    LJSON := LWriter.ObjectToJSON(AObject);
    try
      Result := TNeon.Print(LJSON, LConfig.GetPrettyPrint);
      if LWriter.Errors.Count > 0 then
        raise Exception.Create('Error: ' + sLineBreak + LWriter.Errors.Text);

    finally
      LJSON.Free;
    end;
  finally
    LWriter.Free;
  end;
end;

end.
