unit ContainerEFDUnit;

interface

uses
  ErpFeaturesFactoryEFDUnit, ISessionContextUnit;

type
  ContainerEFD = class
  private
    FSessionContext: ISessionContext;
    FErpFeaturesFactoryEFD: IErpFeaturesFactoryEFD;
  public
    class function GetInstance(): ContainerEFD;
    class procedure ReleaseInstance();

    destructor Destroy; override;

    function GetSessionContext(): ISessionContext;

    procedure RegisterErpFeaturesEFD(const Factory: IErpFeaturesFactoryEFD);
    property ErpFeaturesFactoryEFD: IErpFeaturesFactoryEFD read FErpFeaturesFactoryEFD;
  end;

implementation

uses
  SysUtils, SessionContextUnit;

var
  GContainerDX: ContainerEFD;

{ ContainerEFD }

destructor ContainerEFD.Destroy;
begin
  // Nao faz free pois veio de fora os objetos registrados
  FErpFeaturesFactoryEFD := nil;
  FSessionContext := nil;

  inherited;
end;

class function ContainerEFD.GetInstance: ContainerEFD;
begin
  if GContainerDX = nil then
    GContainerDX := ContainerEFD.Create();

  Result := GContainerDX;
end;

function ContainerEFD.GetSessionContext: ISessionContext;
begin
  if FSessionContext = nil then
    FSessionContext := SessionContext.Create();

  Result := FSessionContext;
end;

procedure ContainerEFD.RegisterErpFeaturesEFD(const Factory: IErpFeaturesFactoryEFD);
begin
  FErpFeaturesFactoryEFD := Factory;
end;

class procedure ContainerEFD.ReleaseInstance;
begin
  if Assigned(GContainerDX) then
    FreeAndNil(GContainerDX);
end;

initialization

finalization
  ContainerEFD.ReleaseInstance();

end.
