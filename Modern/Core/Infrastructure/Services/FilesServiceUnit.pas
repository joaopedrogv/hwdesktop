unit FilesServiceUnit;

interface

type
  FilesService = class
  public
    class function GetPathTemp(const SubFolder: string): string;
  end;

implementation

uses
  SysUtils,
  Classes,
  SHFolder,
  Windows;

{ FilesService }

class function FilesService.GetPathTemp(const SubFolder: string): string;
const
   SHGFP_TYPE_CURRENT = 0;
var
  vPath: array[0..MAX_PATH] of char;
  AfileTest: TStrings;

  function run_path(Apath: string): Boolean;
  begin
    if not DirectoryExists(Apath) then
      CreateDir(Apath);
    Result := DirectoryExists(Apath);
  end;

  function test_path(Apath: string): Boolean;
  var
    S: string;
  begin
    Result := True;
    S := Apath + '\test.txt';
    AfileTest.Add(DateTimeToStr(Now));
    try
      try
        AfileTest.SaveToFile(S);
      finally
        SysUtils.DeleteFile( S );
      end;
    except
      Result := False;
    end;
  end;

begin
  Result := '';
  AfileTest := TStringList.Create;
  try
    if SUCCEEDED(SHGetFolderPath(0, CSIDL_APPDATA, 0, SHGFP_TYPE_CURRENT, @vPath[0])) then
    begin
      Result := vPath + '\Hw Sistemas\Temp';
      run_path(Result);

      Result := Result + '\' + SubFolder;

      if not run_path(Result) then
        Result := ''
      else if not test_path(Result) then
        Result := '';
    end;

    if Result = '' then
    begin
      Result := 'C:\WINDOWS\TEMP';
      if not run_path(Result) then
        Result := ''
      else if not test_path(Result) then
        Result := '';
    end;

    if Result = '' then
    begin
      Result := ExtractFilePath(ParamStr(0)) + SubFolder;
      if not run_path(Result) then
        Result := ''
      else if not test_path(Result) then
        Result := ExtractFilePath(ParamStr(0));
    end;
  finally
    if Trim(Result) <> '' then
      Result := IncludeTrailingPathDelimiter(Result);

    FreeAndNil(AfileTest);
  end;
end;

end.
