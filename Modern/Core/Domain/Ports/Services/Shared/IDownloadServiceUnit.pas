unit IDownloadServiceUnit;

interface

uses
  SysUtils, Classes;

type
  TDownloadResult = record
    Success: Boolean;
    FilePath: string;
    ErrorMessage: string;
    FileSize: Int64;
  end;

  IDownloadService = interface
    ['{EE02058E-7673-49E3-A2DF-C102ACC3D2DD}']
    function DownloadFile(const URL: string; const DestPath: string): TDownloadResult;
    function DownloadFileToMemory(const URL: string): TBytes;
    function GetFileSize(const URL: string): Int64;
  end;

implementation

end.
