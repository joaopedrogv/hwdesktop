unit SetupUnit;

interface

uses
  {$IFNDEF VER180}IBX.IBDatabase{$ELSE}IBDatabase{$ENDIF},
  SetupConfigUnit,
  IDataBaseConnectionUnit,
  ISqlLoggerUnit,
  IErrorLoggerUnit
  ;

type

  TAppSetup = class
  strict private
    FInitialized: Boolean; 
    procedure Shutdown;
  private
    FDatabaseConnection: IDatabaseConnection;
    FSqlLogger: ISqlLogger;
    FErrorLogger: IErrorLogger;
  public
    destructor Destroy; override;

    procedure Initialize(const Database: TIBDatabase; const Config: SetupConfig);

    property DatabaseConnection: IDatabaseConnection read FDatabaseConnection;
    property SqlLogger: ISqlLogger read FSqlLogger;
    property ErrorLogger: IErrorLogger read FErrorLogger;
  end;

  function AppSetup(): TAppSetup;
  procedure AppSetupShutdown();

implementation

{ TAppSetup }

uses
  SysUtils,
  IBXDatabaseConnectionUnit,
  SqlFileLoggerUnit,
  FileErrorLoggerUnit
  ;

var
  GAppSetup: TAppSetup;

function AppSetup(): TAppSetup;
begin    
  if GAppSetup = nil then
    GAppSetup := TAppSetup.Create;
  Result := GAppSetup;
end;

procedure AppSetupShutdown();
begin
  FreeAndNil(GAppSetup);
end;

destructor TAppSetup.Destroy;
begin
  Shutdown();
  inherited;
end;

procedure TAppSetup.Initialize(const Database: TIBDatabase; const Config: SetupConfig);
begin
  if FInitialized then
    Exit;

  FDatabaseConnection := IBXDatabaseConnection.Create( Database );
  FSqlLogger := SqlFileLogger.Create( Config.SqlLogger );
  FDatabaseConnection.SetLogger( FSqlLogger );

  if (Trim(Config.ErrorLogger.Directory) <> '') or
    (Trim(Config.ErrorLogger.FileName) <> '') or
    (Trim(Config.ErrorLogger.Prefix) <> '') then
  begin
    FErrorLogger := FileErrorLogger.Create( Config.ErrorLogger );
    FDatabaseConnection.SetLogger( FErrorLogger );
  end;

  FInitialized := True;
end;

procedure TAppSetup.Shutdown;
begin
  if not FInitialized then
    Exit;

  {$IFDEF INTF_ON}
  FDatabaseConnection := nil;
  FSqlLogger := nil;
  FErrorLogger := nil;
  {$ELSE}
  if Assigned(FDatabaseConnection) then
    FreeAndNil(FDatabaseConnection);

  if Assigned(FSqlLogger) then
    FreeAndNil(FSqlLogger);

  if Assigned(FErrorLogger) then
    FreeAndNil(FErrorLogger);
  {$ENDIF}

  FInitialized := False;
end;

end.
