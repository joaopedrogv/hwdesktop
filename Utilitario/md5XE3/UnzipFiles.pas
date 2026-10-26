unit UnzipFiles;

interface

implementation

uses
  System.SysUtils,
  System.Classes,
  System.Zip,
  Winapi.Windows;

function UnzipFirstFileFromMemory(
  Buffer: Pointer;
  BufferSize: Integer;
  OutputBuffer: PAnsiChar;
  MaxOutputSize: Integer
): Integer; stdcall;
var
  InputStream: TBytesStream;
  ZipFile: TZipFile;
  Files: TArray<string>;
  FileData: TBytes;
  Content: UTF8String;
begin
  Result := 0; // 0 = erro, >0 = tamanho do conteúdo retornado, <= tamanho do conteudo para chamar novamente
  if not Assigned(Buffer) or (BufferSize <= 0) or not Assigned(OutputBuffer) then
    Exit;

  try
    // Carrega o buffer de entrada
    InputStream := TBytesStream.Create;
    try
      InputStream.WriteBuffer(Buffer^, BufferSize);
      InputStream.Position := 0;

      // Abre o ZIP
      ZipFile := TZipFile.Create;
      try
        ZipFile.Open(InputStream, zmRead);
        if ZipFile.FileCount = 0 then
          Exit;

        ZipFile.Read(ZipFile.FileNames[0], FileData);

        //SetLength(Files, 0);
        //ZipFile.GetZipFileNames(Files);

        //if Length(Files) = 0 then
          //Exit;

        // Extrai o primeiro arquivo (assumimos que há apenas um .sql)
        //ZipFile.Read(Files[0], FileData);
      finally
        ZipFile.Free;
      end;
    finally
      InputStream.Free;
    end;

    // Converte para UTF8 (compatível com Delphi 2006)
    Content := UTF8String(TEncoding.UTF8.GetString(FileData));

    // Verifica se cabe no buffer de saída
    if Length(Content) + 1 > MaxOutputSize then
    begin
      Result := 0 - (Length(Content) + 1);
      Exit; // Buffer muito pequeno
    end;

    // Copia para o buffer de saída
    Move(Content[1], OutputBuffer^, Length(Content));
    OutputBuffer[Length(Content)] := #0; // null-terminado

    Result := Length(Content);
  except
    // Em caso de erro, retorna 0
    Result := 0;
  end;
end;

exports
  UnzipFirstFileFromMemory;

end.
