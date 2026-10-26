unit SimpleStringDictionaryUnit;

interface

uses
  Classes, SysUtils;

type
  SimpleStringDictionary = class
  private
    FList: TStringList;
    function Get(const Key: string): string;
    procedure Put(const Key, Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Key, Value: string);
    function TryGetValue(const Key: string; out Value: string): Boolean;
    function GetValue(const Key: string): string;
    property Values[const Key: string]: string read Get write Put; default;
  end;

implementation

{ SimpleStringDictionary }

constructor SimpleStringDictionary.Create;
begin
  inherited Create;
  FList := TStringList.Create;
  FList.Sorted := True;
  FList.Duplicates := dupError;
end;

destructor SimpleStringDictionary.Destroy;
var
  I: Integer;
begin

  for I := 0 to FList.Count - 1 do
    FList.Objects[I].Free();

  FList.Free;

  inherited;
end;

procedure SimpleStringDictionary.Add(const Key, Value: string);
var
  SList: TStrings;
begin
  SList := TStringList.Create;
  SList.LineBreak := '';
  FList.AddObject(Key, SList);
  TStringList(FList.Objects[FList.IndexOf(Key)]).Text := Value;
end;

function SimpleStringDictionary.TryGetValue(const Key: string; out Value: string): Boolean;
var
  Idx: Integer;
begin
  Idx := FList.IndexOf(Key);
  if Idx >= 0 then
  begin
    Value := TStringList(FList.Objects[Idx]).Text;
    Result := True;
  end
  else
  begin
    Value := '';
    Result := False;
  end;
end;

function SimpleStringDictionary.Get(const Key: string): string;
begin
  if not TryGetValue(Key, Result) then
    raise Exception.CreateFmt('Has no value with key ', [Key]);  
end;

function SimpleStringDictionary.GetValue(const Key: string): string;
begin
  if not TryGetValue(Key, Result) then
    Result := '';
end;

procedure SimpleStringDictionary.Put(const Key, Value: string);
var
  Idx: Integer;
begin
  Idx := FList.IndexOf(Key);
  if Idx >= 0 then
    TStringList(FList.Objects[Idx]).Text := Value
  else
    Add(Key, Value);
end;

end.
