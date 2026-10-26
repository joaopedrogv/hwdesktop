unit json_utils;

interface

type

  /// Classe exclusiva para Serialização e deserialização JSON em Delphi 2006
  ///  - Para Serialização
  ///    * As classes precisam ser derivadas de TPersistent ou conter a direva {$M+} TMyClass = class ... end; {$M-} somente
  ///  - Para Deserialização
  ///    * Funciona da mesma forma da Serialização, com exceção para as Listas( TMyClassList = class(TObjectList) ), os Itens dessa lista
  ///      obrigatoriamente precisam herdar de TPersistent e ter a classe registrada
  ///         initialization
  ///           RegisterClass(TMyClass)
  ///  ! Sobre listas, não funciona array of TObject; isso por conta da unit TypInfo, não consegue converter objetos
  ///    > No entanto, derivadas de TObjectList funciona perfeitamente
  ///    > Para funcionar a lista deve terminar em (s_List, _List, sList ou List)
  JsonUtils = class
    class function ToJson(const Value: TObject): string;
    class function ToJsonUTF8(const Value: TObject): UTF8String;
    class function ToObject(AClassType: TClass; Value: string; isUTF8: Boolean = False): TObject;
    class function ToList(AClassType, AItemClassType: TClass; Value: string; isUTF8: Boolean = False): TObject;
  end;

implementation

uses               
  StrUtils,
  OldRttiMarshal,
  OldRttiUnMarshal,
  superobject;

{ JsonUtils }

class function JsonUtils.ToJson(const Value: TObject): string;
begin
  Result := TOldRttiMarshal.ToJson(Value).AsString();
end;

class function JsonUtils.ToJsonUTF8(const Value: TObject): UTF8String;
begin
  Result := AnsiToUtf8(JsonUtils.ToJson(Value));
end;

class function JsonUtils.ToList(AClassType, AItemClassType: TClass;
  Value: string; isUTF8: Boolean): TObject;
var
  json: string;
begin

  if isUTF8 then
    json := Utf8ToAnsi(Value)
  else
    json := Value;

  Result := TOldRttiUnMarshal.FromJsonArray(AClassType, AItemClassType, json);
end;

class function JsonUtils.ToObject(AClassType: TClass; Value: string;
  isUTF8: Boolean): TObject;
var
  json: string;
begin

  if isUTF8 then
    json := Utf8ToAnsi(Value)
  else
    json := Value;

  Result := TOldRttiUnMarshal.FromJson(AClassType, json);
end;

function JsonUtilsToObject(AClassType: TClass; Value: string;
  isUTF8: Boolean): TObject;
begin
  Result := JsonUtils.ToObject(AClassType, Value, isUTF8);
end;

function JsonUtilsToJson(const Value: TObject): string;
begin
  Result := JsonUtils.ToJson(Value);
end;

function JsonUtilsToJsonUtf8(const Value: TObject): string;
begin
  Result := JsonUtils.ToJsonUTF8(Value);
end;

exports
  JsonUtilsToJson,
  JsonUtilsToJsonUtf8,
  JsonUtilsToObject;

end.
