unit ConsoleObserverFactoryUnit;

interface
uses
  SysUtils, Classes, IProgressObserverUnit;

type
  ConsoleObserverFactory = class
  public
    class function Create( const Title: string; Silent: Boolean ): IProgressObserver; static;
  end;

implementation

uses
  UIProgressObserverUnit;

type
  ConsoleSimpleProgressObserver = class(UIProgressObserver)
  private
    FSilent: Boolean;
    FTitle: string;
    procedure DoStart();
    procedure DoComplete();
    procedure DoCancel();
    procedure DoMessage(const Value: string);
    procedure DoCounter(Current, Total: Integer);
  public
    constructor Create(const Title: string; Silent: Boolean);
  end;

{ ConsoleObserverFactory }

class function ConsoleObserverFactory.Create( const Title: string; Silent: Boolean ): IProgressObserver;
begin
  Result := ConsoleSimpleProgressObserver.Create( Title, Silent );
end;

{ ConsoleSimpleProgressObserver }

constructor ConsoleSimpleProgressObserver.Create(const Title: string; Silent: Boolean);
begin
  FSilent := Silent;
  FTitle := Title;

  inherited Create(
    {OnMessage} DoMessage,
    {OnWarning} DoMessage,
    {OnError}  DoMessage,
    {OnProgress} nil,
    {OnCounter} DoCounter,
    {OnStart} DoStart,
    {OnComplete} DoComplete,
    {OnCancel} DoCancel
  );
end;

procedure ConsoleSimpleProgressObserver.DoComplete;
begin
  WriteLn('Concluído');
end;

procedure ConsoleSimpleProgressObserver.DoCounter(Current, Total: Integer);
begin
  Write(Format('%s - %d de %d', [ FTitle, Current, Total ]));
end;

procedure ConsoleSimpleProgressObserver.DoMessage(const Value: string);
begin
  WriteLn(Value);
end;

procedure ConsoleSimpleProgressObserver.DoCancel;
begin
  WriteLn('Cancelando');
end;

procedure ConsoleSimpleProgressObserver.DoStart;
begin
  WriteLn('Iniciando ' + FTitle);
end;

end.
