unit ObjectCacheUnit;

interface

uses
  Classes, SysUtils, EntityBaseUnit, IObjectCacheUnit;

type
  // Classe base para uso dos repositorios que retornam tipos diferentes de objetos, nao utiliza clone de objetos
  RecordWrapper = class
  end;

  {$IFDEF INTF_ON}
  ObjectCache = class(TInterfacedObject, IObjectCache)
  {$ELSE}
  ObjectCache = class(IObjectCache)
  {$ENDIF}
  private
    FList: TStringList;                                                      
    procedure Clear;
  public
    constructor Create;
    destructor Destroy; override;

    {$IFDEF INTF_ON}
    procedure Add(const Key: string; Obj: TObject; TTLMinutes: Integer = 0);
    function TryGetValue(const Key: string; out ClonedObj: TObject): Boolean;
    {$ELSE}
    procedure Add(const Key: string; Obj: TObject; TTLMinutes: Integer = 0); override;
    function TryGetValue(const Key: string; out ClonedObj: TObject): Boolean; override;
    {$ENDIF}
    procedure Invalidate(); override;

  end;

implementation

uses
  Contnrs, DateUtils, Math;

type

  TCacheEntry = class
  public
    Value: TObject;
    ExpiresAt: TDateTime;

    constructor Create(AValue: TObject; TTLMinutes: Integer);
    destructor Destroy; override;
  end;

{ TCacheEntry }

constructor TCacheEntry.Create(AValue: TObject; TTLMinutes: Integer);
begin
  inherited Create;
  Value := AValue;
  if TTLMinutes <= 0 then
    TTLMinutes := 60 * 4; // 4h

  ExpiresAt := IncMinute(Now, TTLMinutes);
end;

destructor TCacheEntry.Destroy;
begin
  Value.Free();
  inherited;
end;

{ ObjectCache }

constructor ObjectCache.Create;
begin
  inherited Create;
  FList := TStringList.Create;
  FList.Sorted := True;
  FList.Duplicates := dupError;
end;

destructor ObjectCache.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

procedure ObjectCache.Invalidate;
begin
  Self.Clear();
end;

procedure ObjectCache.Add(const Key: string; Obj: TObject; TTLMinutes: Integer);
var
  I: Integer;             
  Entry: TCacheEntry;
  Clonado, ItObj: TObject;
begin
  Entry := nil;
  try
    if Obj = nil then
      Entry := TCacheEntry.Create(nil, TTLMinutes)
    else if Obj is EntityBase then
      Entry := TCacheEntry.Create((Obj as EntityBase).Clone(), TTLMinutes)
    else if Obj is RecordWrapper then
      Entry := TCacheEntry.Create(Obj, TTLMinutes)
    else if Obj is TObjectList then
    begin
      Clonado := Obj.ClassType.Create();
      TObjectList(Clonado).OwnsObjects := True;
      for I := 0 to TObjectList(Obj).Count - 1 do
      begin
        ItObj := TObjectList(Obj).Items[I];
        if not (ItObj is EntityBase) then
          raise Exception.Create('Item in ObjectList is not EntityBase class');

        (Clonado as TObjectList).Add(
          (ItObj as EntityBase).Clone()
        );
      end;

      Entry := TCacheEntry.Create(Clonado, TTLMinutes);
    end;

    FList.AddObject(Key, Entry);

  except
    Entry.Free();
    raise;
  end;
end;

function ObjectCache.TryGetValue(const Key: string; out ClonedObj: TObject): Boolean;
var
  Idx: Integer;     
  Entry: TCacheEntry;      
  Original, ItObj: TObject;
begin
  ClonedObj := nil;
  Result := False;
  Idx := FList.IndexOf(Key);
  if Idx < 0 then
    Exit;

  Entry := TCacheEntry(FList.Objects[Idx]);
  // Verifica se expirou
  if (Entry.ExpiresAt = 0) or (Now <= Entry.ExpiresAt) then
  begin
    if Entry.Value = nil then
      ClonedObj := nil
    else if Entry.Value is EntityBase then
      ClonedObj := (Entry.Value as EntityBase).Clone()
    else if Entry.Value is RecordWrapper then
      ClonedObj := Entry.Value
    else if Entry.Value is TObjectList then
    begin
      Original := Entry.Value;
      ClonedObj := Original.ClassType.Create();
      TObjectList(ClonedObj).OwnsObjects := True;
      for Idx := 0 to TObjectList(Original).Count - 1 do
      begin
        ItObj := TObjectList(Original).Items[Idx];
        if not (ItObj is EntityBase) then
          raise Exception.Create('Item in ObjectList is not EntityBase class');

        (ClonedObj as TObjectList).Add(
          (ItObj as EntityBase).Clone()
        );
      end;
    end;
    Result := True;
  end
  else
  begin
    // Expirado: remove do cache
    FList.Objects[Idx].Free;
    FList.Delete(Idx);
  end;
end;

procedure ObjectCache.Clear;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    FList.Objects[i].Free;

  FList.Clear;
end;

end.
