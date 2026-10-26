unit SqlConsoleLoggerUnit;

interface

uses
  SysUtils, Classes, ISqlLoggerUnit, BaseSqlLoggerUnit;

type
  SqlConsoleLoggerEvent = procedure(const Value: string) of object;
                                                     
  {$IFDEF INTF_ON}      
  SqlConsoleLogger = class(BaseSqlLogger, ISqlLogger)
  {$ELSE}                                            
  SqlConsoleLogger = class(BaseSqlLogger)
  {$ENDIF}
  private
    FLogEvent: SqlConsoleLoggerEvent;
  protected
    procedure WriteToLog(const Content: string); override;
  public
    constructor Create(const LogEvent: SqlConsoleLoggerEvent);
    destructor Destroy; override;
  end;

implementation

uses
  StrUtils, DateUtils;

{ SqlConsoleLogger }

constructor SqlConsoleLogger.Create(const LogEvent: SqlConsoleLoggerEvent);
begin
  inherited Create;

  FLogEvent := LogEvent;
  FSemaphor := TMultiReadExclusiveWriteSynchronizer.Create;

  FOptions := [];
end;

destructor SqlConsoleLogger.Destroy;
begin
  FLogEvent := nil;
  inherited;
end;

procedure SqlConsoleLogger.WriteToLog(const Content: string);
begin
  FSemaphor.BeginWrite;
  try
    try
      FLogEvent(Content);
    except on E: Exception do
    end;

  finally
    FSemaphor.EndWrite;
  end;
end;

end.


