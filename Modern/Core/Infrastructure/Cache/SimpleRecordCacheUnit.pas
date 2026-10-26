unit SimpleRecordCacheUnit;

interface

uses
  Classes, IRecordCacheUnit;

type
  {$IFDEF INTF_ON}
  SimpleRecordCache = class(TInterfacedObject, IRecordCache)
  {$ELSE}
  SimpleRecordCache = class(IRecordCache)
  {$ENDIF}
  private
    FList: TStringList;
    FOwnsObjects: Boolean;
    function GetValue(const Key: string): Pointer;
    procedure Clear;
  public
    constructor Create(OwnsObjects: Boolean = True);
    destructor Destroy; override;

    {$IFDEF INTF_ON}
    procedure Add(const Key: string; Value: Pointer);
    function TryGetValue(const Key: string; out Value: Pointer): Boolean;
    function NewRecord(RecordSize: Integer): Pointer;
    {$ELSE}
    procedure Add(const Key: string; Value: Pointer); override;
    function TryGetValue(const Key: string; out Value: Pointer): Boolean; override;
    function NewRecord(RecordSize: Integer): Pointer; override;
    {$ENDIF}
    
  end;

implementation

uses
  SysUtils;

{ SimpleRecordCache }

constructor SimpleRecordCache.Create(OwnsObjects: Boolean);
begin
  inherited Create;
  FList := TStringList.Create;
  FList.Sorted := True;
  FList.Duplicates := dupError;
  FOwnsObjects := OwnsObjects;
end;

destructor SimpleRecordCache.Destroy;
begin
  Clear; // Usa o método Clear para liberar corretamente
  FList.Free;
  inherited;
end;

procedure SimpleRecordCache.Add(const Key: string; Value: Pointer);
begin
  FList.AddObject(Key, TObject(Value));
end;

function SimpleRecordCache.TryGetValue(const Key: string; out Value: Pointer): Boolean;
var
  Idx: Integer;
begin
  Idx := FList.IndexOf(Key);
  if Idx >= 0 then
  begin
    Value := Pointer(FList.Objects[Idx]);
    Result := True;
  end
  else
  begin
    Value := nil;
    Result := False;
  end;
end;

function SimpleRecordCache.GetValue(const Key: string): Pointer;
begin
  if not TryGetValue(Key, Result) then
    raise Exception.Create('Chave não encontrada no cache: ' + Key);
end;

function SimpleRecordCache.NewRecord(RecordSize: Integer): Pointer;
begin
  GetMem(Result, RecordSize);
end;

procedure SimpleRecordCache.Clear;
var
  I: Integer;
  Ptr: Pointer;
begin
  if FOwnsObjects then
  begin
    for I := 0 to FList.Count - 1 do
    begin
      Ptr := Pointer(FList.Objects[I]);
      if Assigned(Ptr) then
        FreeMem(Ptr);
    end;
  end;
  FList.Clear;
end;

end.
