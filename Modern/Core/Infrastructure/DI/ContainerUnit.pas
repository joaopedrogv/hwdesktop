unit ContainerUnit;

interface

uses
  FiscalCalculosFactoryUnit,
  ErpFeaturesFactoryUnit,
  ISessionContextUnit;

type
  IErpFeaturesFactory = {$IFDEF INTF_ON} IErpFeaturesFactory {$ELSE} ErpFeaturesFactory {$ENDIF};
  IFiscalCalculosFactory = {$IFDEF INTF_ON} IFiscalCalculosFactory {$ELSE} FiscalCalculosFactory {$ENDIF};

  Container = class
  private
    FSessionContext: ISessionContext;
    FFiscalCalculosFactory: IFiscalCalculosFactory;
    FErpFeaturesFactory: IErpFeaturesFactory;
  public
    class function GetInstance(): Container;
    class procedure ReleaseInstance();

    destructor Destroy; override;

    function GetSessionContext(): ISessionContext;

    procedure RegisterFiscalCalculosFactory(const Factory: IFiscalCalculosFactory);
    procedure RegisterErpFeatures(const Factory: IErpFeaturesFactory);

    property FiscalCalculosFactory: IFiscalCalculosFactory read FFiscalCalculosFactory;
    property ErpFeaturesFactory: IErpFeaturesFactory read FErpFeaturesFactory;
  end;

implementation

uses
  SysUtils, SessionContextUnit;

var
  GContainer: Container;

{ Container }

destructor Container.Destroy;
begin
  // Nao faz free pois veio de fora os objetos registrados                           
  FErpFeaturesFactory := nil;
  FFiscalCalculosFactory := nil;
  FSessionContext := nil;

  inherited;
end;

class function Container.GetInstance: Container;
begin
  if GContainer = nil then
  begin
    GContainer := Container.Create();
    GContainer.FSessionContext := nil; // Se Container tiver um metodo Create no futuro, mover para lá
  end;

  Result := GContainer;
end;

function Container.GetSessionContext: ISessionContext;
begin
  if FSessionContext = nil then
    FSessionContext := SessionContext.Create();

  Result := FSessionContext;
end;

procedure Container.RegisterErpFeatures(const Factory: IErpFeaturesFactory);
begin
  FErpFeaturesFactory := Factory;
end;

procedure Container.RegisterFiscalCalculosFactory(
  const Factory: IFiscalCalculosFactory);
begin
  FFiscalCalculosFactory := Factory;
end;

class procedure Container.ReleaseInstance;
begin      
  if Assigned(GContainer) then
    FreeAndNil(GContainer);
end;

initialization

finalization
  Container.ReleaseInstance();

end.
