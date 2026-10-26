unit ZipCompressorServiceUnit;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  IZipCompressorServiceUnit;

type
  ZipCompressorService = class(TInterfacedObject, IZipCompressorService)
  public
    function Comprimir(const Attachments: TArray<TPair<string,TBytes>>; const FileName: string): TPair<string,TBytes>;
  end;

implementation

uses
  System.Zip,
  System.ZLib;

{ ZipCompressorService }

function ZipCompressorService.Comprimir(const Attachments: TArray<TPair<string, TBytes>>;
  const FileName: string): TPair<string, TBytes>;
var
  MemoryStream: TMemoryStream;
  ZipFile: TZipFile;
  i: Integer;
  EntryName: string;
  FileData: TBytes;
begin
  Result.Key := FileName;
  Result.Value := nil;

  if Length(Attachments) = 0 then
    Exit;

  MemoryStream := TMemoryStream.Create;
  ZipFile := TZipFile.Create;
  try
    ZipFile.Open(MemoryStream, zmWrite);

    for i := Low(Attachments) to High(Attachments) do
    begin
      EntryName := Attachments[i].Key;
      FileData := Attachments[i].Value;

      if (Length(FileData) > 0) and (EntryName <> '') then
        ZipFile.Add(FileData, EntryName, zcDeflate);
    end;

    ZipFile.Close;

    Result.Key := FileName;

    if MemoryStream.Size > 0 then
    begin
      SetLength(Result.Value, MemoryStream.Size);
      MemoryStream.Position := 0;
      MemoryStream.ReadBuffer(Result.Value[0], MemoryStream.Size);
    end;

  finally
    MemoryStream.Free;
    ZipFile.Free;
  end;
end;

end.

