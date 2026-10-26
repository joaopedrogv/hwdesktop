unit FileConfigUnit;

interface

type
  FileConfig = record
  private
    FDirectory: string;
    FPrefix: string;
    FFileName: string;
    function GetFullFileName: string;
  public
    class function CreateLog(const Directory, Prefix: string): FileConfig; static;
    class function Create(const Directory, FileName: string): FileConfig; static;

    property Directory: string read FDirectory;
    property Prefix: string read FPrefix;
    property FileName: string read FFileName;
    property FullFileName: string read GetFullFileName;
  end;

implementation

uses
  SysUtils, StrUtils;

{ FileConfig }

class function FileConfig.Create(const Directory, FileName: string): FileConfig;
begin
  Result.FDirectory := Directory;
  Result.FFileName := FileName;
  Result.FPrefix := '';
end;

class function FileConfig.CreateLog(const Directory, Prefix: string): FileConfig;
begin
  Result.FDirectory := Trim(Directory);
  Result.FPrefix := Trim(Prefix);
  Result.FFileName := '';
end;

function FileConfig.GetFullFileName: string;
begin
  Result := IfThen( Trim(FDirectory) <> '', IncludeTrailingPathDelimiter( Trim( Directory )))
    + IfThen( Trim(FPrefix) <> '', FPrefix )
    + IfThen( Trim(FFileName) <> '', FFileName );
end;

end.
