unit IRecordCacheUnit;

interface

type               
  {$IFDEF INTF_ON}
  IRecordCache = interface
    ['{65D36FC5-3EAA-44AD-973B-EA37EBBB50E6}']
    procedure Add(const Key: string; Value: Pointer);
    function TryGetValue(const Key: string; out Value: Pointer): Boolean;
    function NewRecord(RecordSize: Integer): Pointer;
  end;
  {$ELSE}
  IRecordCache = class abstract
  public
    procedure Add(const Key: string; Value: Pointer); virtual; abstract;
    function TryGetValue(const Key: string; out Value: Pointer): Boolean; virtual; abstract;
    function NewRecord(RecordSize: Integer): Pointer; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
