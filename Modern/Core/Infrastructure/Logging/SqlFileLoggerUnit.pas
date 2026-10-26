unit SqlFileLoggerUnit;

interface

uses
  SysUtils, Classes, ISqlLoggerUnit, FileConfigUnit, BaseSqlLoggerUnit;

type
                        
  {$IFDEF INTF_ON}
  SqlFileLogger = class(BaseSqlLogger, ISqlLogger)
  {$ELSE}
  SqlFileLogger = class(BaseSqlLogger)
  {$ENDIF}
  private
    FLogDirectory: string;
    FPrefix: string;
  protected
  public
    procedure WriteToLog(const Content: string); override;
    constructor Create(const Config: FileConfig);
  end;

implementation

uses
  StrUtils, DateUtils;

{ SqlFileLogger }

constructor SqlFileLogger.Create(const Config: FileConfig);
begin
  inherited Create;

  FLogDirectory := IfThen(Config.Directory <> '', IncludeTrailingPathDelimiter(Config.Directory));
  FPrefix       := IfThen(Config.Prefix    <> '', Config.Prefix);
  FSemaphor     := TMultiReadExclusiveWriteSynchronizer.Create;

  FOptions      := [];
end;

procedure SqlFileLogger.WriteToLog(const Content: string);
var
  LogFile: TextFile;
  FileName: string;
begin
  FSemaphor.BeginWrite;
  try
    try
      ForceDirectories(FLogDirectory);
      FileName := FLogDirectory + FPrefix + FormatDateTime('yyyy-mm-dd', Now) + '_sql.log';

      AssignFile(LogFile, FileName);
      try
        if FileExists(FileName) then
          Append(LogFile)
        else
          Rewrite(LogFile);

        Writeln(LogFile, Content);
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


