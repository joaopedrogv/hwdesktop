unit ContainerFiscalTestsUnit;

interface

uses
  FiscalCalculosFactoryUnit,
  ISessionContextUnit;

type
  Container = class
  private
    FSessionContext: ISessionContext;
    FFiscalCalculosFactory: FiscalCalculosFactory;
  public
    class function GetInstance(): Container;
    class procedure ReleaseInstance();

    destructor Destroy; override;

    function GetSessionContext(): ISessionContext;

    procedure RegisterFiscalCalculosFactory(const Factory: FiscalCalculosFactory);
    property FiscalCalculosFactory: FiscalCalculosFactory read FFiscalCalculosFactory;
  end;

implementation

uses
  SysUtils, SessionContextUnit;

var
  GContainerFiscalTests: Container;

{ Container }

destructor Container.Destroy;
begin
  // Nao faz free pois veio de fora os objetos registrados
  FFiscalCalculosFactory := nil;
  FSessionContext := nil;

  inherited;
end;

class function Container.GetInstance: Container;
begin
  if GContainerFiscalTests = nil then
    GContainerFiscalTests := Container.Create();

  Result := GContainerFiscalTests;
end;

function Container.GetSessionContext: ISessionContext;
begin
  if FSessionContext = nil then
    FSessionContext := SessionContext.Create();

  Result := FSessionContext;
end;

procedure Container.RegisterFiscalCalculosFactory(const Factory: FiscalCalculosFactory);
begin
  FFiscalCalculosFactory := Factory;
end;

class procedure Container.ReleaseInstance;
begin
  if Assigned(GContainerFiscalTests) then
    FreeAndNil(GContainerFiscalTests);
end;

initialization

finalization
  Container.ReleaseInstance();

end.
