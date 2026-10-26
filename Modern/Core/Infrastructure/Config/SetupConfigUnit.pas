unit SetupConfigUnit;

interface

uses
  FileConfigUnit;

type
  SetupConfig = record
  private
    FSqlLogger: FileConfig;
    FErrorLogger: FileConfig;
  public
    class function Create(const SqlLogger, ErrorLogger: FileConfig): SetupConfig; static;
    property SqlLogger: FileConfig read FSqlLogger;
    property ErrorLogger: FileConfig read FErrorLogger;
  end;

implementation

{ SetupConfig }

class function SetupConfig.Create(const SqlLogger, ErrorLogger: FileConfig): SetupConfig;
begin
  Result.FSqlLogger := SqlLogger;
  Result.FErrorLogger := ErrorLogger;
end;

end.
