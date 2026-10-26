unit ContainerDFeUnit;

interface

uses
  ErpFeaturesFactoryDFeUnit, ISessionContextUnit;

type
  ContainerDFe = class
  private
    FSessionContext: ISessionContext;
    FErpFeaturesFactoryDFe: IErpFeaturesFactoryDFe;
  public
    class function GetInstance(): ContainerDFe;
    class procedure ReleaseInstance();

    destructor Destroy; override;

    function GetSessionContext(): ISessionContext;

    procedure RegisterDFeFeatures(const Factory: IErpFeaturesFactoryDFe);
    property DFeFeaturesFactory: IErpFeaturesFactoryDFe read FErpFeaturesFactoryDFe;
  end;

implementation

uses
  SysUtils, SessionContextUnit;

var
  GContainerDFe: ContainerDFe;

{ ContainerDFe }

destructor ContainerDFe.Destroy;
begin
  // Nao faz free pois veio de fora os objetos registrados
  FErpFeaturesFactoryDFe := nil;
  FSessionContext := nil;

  inherited;
end;

class function ContainerDFe.GetInstance: ContainerDFe;
begin
  if GContainerDFe = nil then
    GContainerDFe := ContainerDFe.Create();

  Result := GContainerDFe;
end;

function ContainerDFe.GetSessionContext: ISessionContext;
begin
  if FSessionContext = nil then
    FSessionContext := SessionContext.Create();

  Result := FSessionContext;
end;

procedure ContainerDFe.RegisterDFeFeatures(const Factory: IErpFeaturesFactoryDFe);
begin
  FErpFeaturesFactoryDFe := Factory;
end;

class procedure ContainerDFe.ReleaseInstance;
begin
  if Assigned(GContainerDFe) then
    FreeAndNil(GContainerDFe);
end;

initialization

finalization
  ContainerDFe.ReleaseInstance();

end.
