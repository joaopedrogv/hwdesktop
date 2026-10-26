unit FileErrorLoggerUnit;

interface

uses
  SysUtils, IErrorLoggerUnit, FileConfigUnit;

type         
  {$IFDEF INTF_ON}         
  FileErrorLogger = class(TInterfacedObject, IErrorLogger)
  {$ELSE}            
  FileErrorLogger = class(IErrorLogger)
  {$ENDIF}
  private
    FSemaphor: {$IFDEF INTF_ON} IReadWriteSync {$ELSE} TMultiReadExclusiveWriteSynchronizer {$ENDIF};
    FLogDirectory: string;
    FFileName: string;
    FPrefix: string;
  public
    constructor Create(const Config: FileConfig);
    destructor Destroy; override;
  {$IFDEF INTF_ON}
    procedure LogError(const Value: string);
  {$ELSE}                                   
    procedure LogError(const Value: string); overload; override;
    procedure LogError(const Value: string; const Args: array of const); overload; override;
  {$ENDIF}
  end;

implementation

uses
  StrUtils;

{ FileErrorLogger }

constructor FileErrorLogger.Create(const Config: FileConfig);
begin
  FLogDirectory := IfThen(Config.Directory <> '', IncludeTrailingPathDelimiter(Config.Directory));
  FFileName     := IfThen(Config.FileName  <> '', Config.FileName);
  FPrefix       := IfThen(Config.Prefix    <> '', Config.Prefix);
  FSemaphor     := TMultiReadExclusiveWriteSynchronizer.Create;
end;

destructor FileErrorLogger.Destroy;
begin
  {$IFNDEF INTF_ON} FSemaphor.Free(); {$ENDIF}
  inherited;
end;

procedure FileErrorLogger.LogError(const Value: string; const Args: array of const);
begin
  LogError(Format(Value, Args));
end;

procedure FileErrorLogger.LogError(const Value: string);
var
  LogFile: TextFile;
  FileName: string;
begin
  FSemaphor.BeginWrite;
  try
    try
      ForceDirectories(FLogDirectory);
      if FFileName = '' then
        FileName := FormatDateTime('yyyy-mm-dd', Now) + '_sql.log';

      FileName := FLogDirectory + FPrefix + FFileName;

      AssignFile(LogFile, FileName);
      try
        if FileExists(FileName) then
          Append(LogFile)
        else
          Rewrite(LogFile);

        Writeln(LogFile, Format('%s - %s', [ FormatDateTime('yyyy-MM-dd hh:nn:ss.zzz', Now),  Value] ));
        Writeln(LogFile, '');
      finally
        CloseFile(LogFile);
      end;

    except on E: Exception do
    end;

  finally
    FSemaphor.EndWrite;
  end;
end;

end.
