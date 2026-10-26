unit IObjectCacheUnit;

interface

type
  // {$IFDEF INTF_ON}
  // IObjectCache = interface
  //   ['{B72E1D3B-77C0-41CC-92AC-6A53D16B24B0}']
  //   procedure Add(const Key: string; Obj: TObject; TTLMinutes: Integer = 0);
  //   function TryGetValue(const Key: string; out ClonedObj: TObject): Boolean;
  // end;
  // {$ELSE}
  IObjectCache = class abstract
  public
    procedure Add(const Key: string; Obj: TObject; TTLMinutes: Integer = 0); virtual; abstract;
    function TryGetValue(const Key: string; out ClonedObj: TObject): Boolean; virtual; abstract;
    procedure Invalidate(); virtual; abstract;
  end;
  // {$ENDIF}

implementation

end.
