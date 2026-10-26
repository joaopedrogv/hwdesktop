unit BaseSingleton;

interface

type

  //https://drgarcia1986.wordpress.com/2014/04/09/singleton-pattern-no-delphi-com-uma-nova-abordagem/

  TSingleton<T: class, constructor> = class
  strict private
    class var FInstance : T;
  public
    class function GetInstance(): T;
    class procedure ReleaseInstance();
  end;

implementation

uses
  System.SysUtils;

{ TSingleton<T> }

class function TSingleton<T>.GetInstance: T;
begin
  if not Assigned(Self.FInstance) then
    Self.FInstance := T.Create();
  Result := Self.FInstance;
end;

class procedure TSingleton<T>.ReleaseInstance;
begin
  if Assigned(Self.FInstance) then
    FreeAndNil(Self.FInstance);
//    Self.FInstance.Free;
end;

end.

