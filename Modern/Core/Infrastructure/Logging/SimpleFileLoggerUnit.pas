unit SimpleFileLoggerUnit;

interface

uses
  SysUtils, Classes,
  ISimpleLoggerUnit, FileConfigUnit;

type
  SimpleFileLogger = class(TInterfacedObject, ISimpleLogger)
  private
    FSemaphor: IReadWriteSync;
    FLogDirectory: string;
    FPrefix: string;
    FFileName: string;
  public
    constructor Create(const Config: FileConfig);

    procedure Log(const Value: string); overload;
    procedure Log(const Value: string; const Args: array of const); overload;
  end;

implementation

uses
  StrUtils;

{ SimpleFileLogger }

constructor SimpleFileLogger.Create(const Config: FileConfig);
begin
  inherited Create;

  FFileName := IfThen(Config.Directory <> '', IncludeTrailingPathDelimiter(Config.Directory))
    + Trim(Config.Prefix)
    + Trim(Config.FileName)
    + IfThen( not Config.FileName.Contains('.'), '.log');
end;

procedure SimpleFileLogger.Log(const Value: string);
var
  LogFile: TextFile;
begin
  FSemaphor.BeginWrite;
  try
    try
      ForceDirectories(FLogDirectory);

      AssignFile(LogFile, FFileName);
      try
        if FileExists(FFileName) then
          Append(LogFile)
        else
          Rewrite(LogFile);

        Writeln(LogFile, Value);
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

procedure SimpleFileLogger.Log(const Value: string; const Args: array of const);
begin
  Log(Format(Value, Args));
end;

end.
