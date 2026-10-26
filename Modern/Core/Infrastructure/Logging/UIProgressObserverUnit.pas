unit UIProgressObserverUnit;

interface

uses
  IProgressObserverUnit;

type
  UIProgressObserverMessageEvent = procedure(const Value: string) of object;
  UIProgressObserverProgressEvent = procedure(Progress: Integer) of object;
  UIProgressObserverCounterEvent = procedure(Current, Total: Integer) of object;
  UIProgressObserverEvent = procedure() of object;

  UIProgressObserver = class(TInterfacedObject, IProgressObserver)
  private
    FOnMessage  : UIProgressObserverMessageEvent;
    FOnWarning  : UIProgressObserverMessageEvent;
    FOnError    : UIProgressObserverMessageEvent;
    FOnProgress : UIProgressObserverProgressEvent;
    FOnCounter  : UIProgressObserverCounterEvent;
    FOnStart    : UIProgressObserverEvent;
    FOnComplete : UIProgressObserverEvent;
    FOnCancel   : UIProgressObserverEvent;

    FCancellationRequested: Boolean;
  public
    constructor Create(
      OnMessage  : UIProgressObserverMessageEvent;
      OnWarning  : UIProgressObserverMessageEvent;
      OnError    : UIProgressObserverMessageEvent;
      OnProgress : UIProgressObserverProgressEvent;
      OnCounter  : UIProgressObserverCounterEvent;
      OnStart    : UIProgressObserverEvent;
      OnComplete : UIProgressObserverEvent;
      OnCancel   : UIProgressObserverEvent
    );

    procedure OnMessage(const &Message: string);
    procedure OnWarning(const Warning: string);
    procedure OnError(const Error: string);
    procedure OnProgress(Progress: Integer);
    procedure OnCounter(Current, Total: Integer);
    procedure OnStart; virtual;
    procedure OnComplete;
    procedure OnCancel;

    procedure CancelRequest;
    function IsCancellationRequested: Boolean;
  end;

implementation

uses
  SysUtils;

{ UIProgressObserver }

procedure UIProgressObserver.CancelRequest;
begin
  FCancellationRequested := True;
end;

constructor UIProgressObserver.Create(
  OnMessage  : UIProgressObserverMessageEvent;
  OnWarning  : UIProgressObserverMessageEvent;
  OnError    : UIProgressObserverMessageEvent;
  OnProgress : UIProgressObserverProgressEvent;
  OnCounter  : UIProgressObserverCounterEvent;
  OnStart    : UIProgressObserverEvent;
  OnComplete : UIProgressObserverEvent;
  OnCancel   : UIProgressObserverEvent
);
begin
  FOnMessage  := OnMessage;
  FOnWarning  := OnWarning;
  FOnError    := OnError;
  FOnProgress := OnProgress;
  FOnCounter  := OnCounter;
  FOnStart    := OnStart;
  FOnComplete := OnComplete;
  FOnCancel   := OnCancel;
  FCancellationRequested := False;
end;

function UIProgressObserver.IsCancellationRequested: Boolean;
begin
  Result := FCancellationRequested;
end;

procedure UIProgressObserver.OnCancel;
begin
  if Assigned(FOnCancel) then
    FOnCancel();
end;

procedure UIProgressObserver.OnComplete;
begin
  if Assigned(FOnComplete) then
    FOnComplete();
end;

procedure UIProgressObserver.OnCounter(Current, Total: Integer);
begin
  if Assigned(FOnCounter) then
    FOnCounter(Current, Total);
end;

procedure UIProgressObserver.OnError(const Error: string);
begin
  if Assigned(FOnError) then
    FOnError(Error);
end;

procedure UIProgressObserver.OnMessage(const &Message: string);
begin
  if Assigned(FOnMessage) then
    FOnMessage(&Message);
end;

procedure UIProgressObserver.OnProgress(Progress: Integer);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Progress);
end;

procedure UIProgressObserver.OnStart;
begin
  FCancellationRequested := False;
  if Assigned(FOnStart) then
    FOnStart();
end;

procedure UIProgressObserver.OnWarning(const Warning: string);
begin
  if Assigned(FOnWarning) then
    FOnWarning(Warning);
end;

end.
