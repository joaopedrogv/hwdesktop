unit UIFormObserverFactoryUnit;

interface
uses
  SysUtils, Classes, IProgressObserverUnit;

type
  UIFormObserverFactory = class
  public
    class function CreateSimple( const Title: string; Silent: Boolean ): IProgressObserver; static;
  end;

implementation

uses
  Forms,
  UIProgressObserverUnit, UStatusProcessamentoSimplesFormUnit;

type
  UISimpleFormProgressObserver = class(UIProgressObserver)
  private
    FSilent: Boolean;
    FTitle: string;
    FForm: TStatusProcessamentoSimplesForm;
    procedure MakeVisible();
    procedure MakeInVisible();
    procedure DoMessage(const Value: string);
    procedure DoCounter(Current, Total: Integer);
  public
    constructor Create(const Title: string; Silent: Boolean);
    destructor Destroy; override;
  end;

{ UIFormObserverFactory }

class function UIFormObserverFactory.CreateSimple( const Title: string; Silent: Boolean ): IProgressObserver;
begin
  Result := UISimpleFormProgressObserver.Create( Title, Silent );
end;

{ UISimpleFormProgressObserver }

constructor UISimpleFormProgressObserver.Create(const Title: string; Silent: Boolean);
begin
  FSilent := Silent;
  FTitle := Title;
  if not Silent then
  begin
    FForm := TStatusProcessamentoSimplesForm.Create(nil);
    FForm.Hide;
    FForm.Caption := Title;
    FForm.lbTitle.Caption := Title;
  end
  else
    FForm := nil;

  inherited Create(
    {OnMessage} DoMessage,
    {OnWarning} DoMessage,
    {OnError}  DoMessage,
    {OnProgress} nil,
    {OnCounter} DoCounter,
    {OnStart} MakeVisible,
    {OnComplete} MakeVisible,
    {OnCancel} MakeInVisible
  );
end;

destructor UISimpleFormProgressObserver.Destroy;
begin
  FForm.Free();
  inherited;
end;

procedure UISimpleFormProgressObserver.DoCounter(Current, Total: Integer);
begin
  if not Assigned(FForm) then
    Exit;

  FForm.Caption := Format('%s - %d de %d', [ FTitle, Current, Total ]);
  FForm.lbTitle.Caption := Format('%s - %d de %d', [ FTitle, Current, Total ]);
  MakeVisible();
end;

procedure UISimpleFormProgressObserver.DoMessage(const Value: string);
begin
  if not Assigned(FForm) then
    Exit;

  FForm.lbMessage.Caption := Value;
  MakeVisible();
end;

procedure UISimpleFormProgressObserver.MakeInVisible;
begin
  if not Assigned(FForm) then
    Exit;

  FForm.Hide();
end;

procedure UISimpleFormProgressObserver.MakeVisible;
begin
  if not Assigned(FForm) then
    Exit;

  if not FForm.Visible then
    FForm.Show;

  FForm.BringToFront();
  Application.ProcessMessages();
end;

end.
