unit BaseClassUnit;

interface

uses
  SysUtils;

type
  {$IFDEF INTF_ON}
  BaseClass = class(TInterfacedObject)
  {$ELSE}
  BaseClass = class
  {$ENDIF}
  public
    procedure FreeSafe();
  end;

implementation

{ BaseClass }

procedure BaseClass.FreeSafe;
begin
  {$IFNDEF INTF_ON}
  Self.Free()
  {$ENDIF}
end;

end.
