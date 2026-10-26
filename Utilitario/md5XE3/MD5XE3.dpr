library MD5XE3;

uses
  MessageDigest_5 in 'MessageDigest_5.pas',
  IdHashMessageDigest,
  IdHash,
  System.Classes,
  System.SysUtils,
  IdCoder,
  IdCoderMIME,
  IdGlobal,
  Vcl.Forms,
  Winapi.ShellAPI,
  ActiveX,
  ComObj,
  ShlObj,
  Soap.EncdDecd,
  System.Zip,
  System.ZLib,
  hw_erro_class in '..\..\Ativos\fonte\hw_erro_class.pas',
  UnzipFiles in 'UnzipFiles.pas',
  MarkdownCommonMark in '..\..\lib\markdown\MarkdownCommonMark.pas',
  MarkdownDaringFireball in '..\..\lib\markdown\MarkdownDaringFireball.pas',
  MarkdownHTMLEntities in '..\..\lib\markdown\MarkdownHTMLEntities.pas',
  MarkdownProcessor in '..\..\lib\markdown\MarkdownProcessor.pas',
  MarkdownUnicodeUtils in '..\..\lib\markdown\MarkdownUnicodeUtils.pas',
  Winapi.Windows;

{$R *.res}

function _getMd5(Value: WideString): WideString; stdcall;
var
  hash: MessageDigest_5.IMD5;
begin
  hash := MessageDigest_5.GetMD5();
  hash.Update(Value);
  Result := hash.AsString();
end;

function _getMd5File(FileName: WideString): WideString; stdcall;
var
  IdMD5: TIdHashMessageDigest5;
  FS: TFileStream;
begin
  IdMD5 := nil;
  FS := nil;
  try
    IdMD5 := TIdHashMessageDigest5.Create;
    FS := TFileStream.Create(string(FileName), fmOpenRead or fmShareDenyWrite);
    Result := IdMD5.HashStreamAsHex(FS);
  finally
    FS.Free;
    IdMD5.Free;
  end;
end;

function _strImagetoBase64(FileName: WideString): WideString; stdcall;
var
  Stream : TFileStream;
  Encoder : TIdEncoderMIME;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Encoder := TIdEncoderMIME.Create(nil);
    try
      Result := Encoder.Encode(Stream);
    finally
      Encoder.Free;
    end;
  finally
    Stream.Free;
  end;
end;

function _strBase64toImage(Base64: WideString; FileName: WideString): WideString; stdcall;
var
  BStream: TBytesStream;
begin
  BStream := TBytesStream.Create(DecodeBase64(Base64));
  try
    BStream.SaveToFile(Filename);
  finally
    BStream.Free;
  end;
end;

function _markdownToHtml(Markdown: WideString): WideString; stdcall;
var
  md: TMarkdownProcessor;
  HtmlFragment: string;
begin
  md := TMarkdownProcessor.createDialect(mdCommonMark);
  try
    // Note: By default, HTML output is a fragment, not a full <html> document
    Result := md.process(Markdown);
  finally
    md.Free;
  end;
end;


function CopyFileISHFileOperation(Origem: WideString; Destino: WideString) : boolean;
var
  SH : SHFILEOPSTRUCT;
begin
  Result := False;

  FillChar(SH, SizeOf(SH), 0);
  SH.Wnd    := Application.Handle;
  SH.wFunc  := FO_Copy;
  SH.pFrom  := PWideChar(Origem);
  SH.pTo    := PWideChar(Destino);
  SH.fFlags := FOF_NO_UI;//FOF_ALLOWUNDO;//FOF_NOERRORUI + FOF_SILENT + FOF_NOCONFIRMATION;
  result := SHFileOperation(SH) = 0;
end;

function CopyFileIFileOperation(const srcFile, destFile : string) : boolean;
//works on Windows >= Vista and 2008 server
var
  r : HRESULT;
  fileOp: IFileOperation;
  siSrcFile: IShellItem;
  siDestFolder: IShellItem;
  destFileFolder, destFileName : string;
begin
  result := false;

  destFileFolder := ExtractFileDir(destFile);
  destFileName := ExtractFileName(destFile);

  //init com
  r := CoInitializeEx(nil, COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE);
  if Succeeded(r) then
  begin
    //create IFileOperation interface
    r := CoCreateInstance(CLSID_FileOperation, nil, CLSCTX_ALL, IFileOperation, fileOp);
    if Succeeded(r) then
    begin
      //set operations flags
      r := fileOp.SetOperationFlags(FOF_NO_UI OR FOFX_NOMINIMIZEBOX);
      if Succeeded(r) then
      begin
        //get source shell item
        r := SHCreateItemFromParsingName(PChar(srcFile), nil, IShellItem, siSrcFile);
        if Succeeded(r) then
        begin
          //get destination folder shell item
          r := SHCreateItemFromParsingName(PChar(destFileFolder), nil, IShellItem, siDestFolder);

          //add copy operation
          if Succeeded(r) then r := fileOp.CopyItem(siSrcFile, siDestFolder, PChar(destFileName), nil);
        end;

        //execute
        if Succeeded(r) then r := fileOp.PerformOperations;

        result := Succeeded(r);

        OleCheck(r);
      end;
    end;

    CoUninitialize;
  end;
end;

function hw_copy_dir(Origem: WideString; Destino: WideString): Boolean; stdcall;
var
  winver: TOSVersion;
begin
  try
    Result := False;
    if winver.Major >= 6 then
      Result := CopyFileIFileOperation(Origem, Destino)
    else
      Result := CopyFileISHFileOperation(Origem, Destino);
  except
    if CopyFile(PChar(Origem), PChar(Destino), False) then
      Result := FileExists(Destino);
  end;
end;

function ApagaDir(hHandle: THandle; Const sPath : String): boolean;
var
  OpStruc: TSHFileOpStruct;
  FromBuffer, ToBuffer: Array[0..255] of Char;
  vPath: string;
begin
  //Apaga Pasta, Sub-Pastas e Arquivos

  vPath := Trim(sPath);

  if DirectoryExists(vPath) then
  begin

    if vPath[Length(vPath)] = '\' then
      Delete(vPath, Length(vPath), 1);

    fillChar(OpStruc, Sizeof(OpStruc), 0);
    FillChar(FromBuffer, Sizeof(FromBuffer), 0);
    FillChar(ToBuffer, Sizeof(ToBuffer), 0);
    StrPCopy(FromBuffer, vPath);

    OpStruc.Wnd := hHandle;
    OpStruc.wFunc := FO_DELETE;
    OpStruc.pFrom := @FromBuffer;
    OpStruc.pTo := @ToBuffer;
    OpStruc.fFlags := FOF_NOERRORUI + FOF_SILENT + FOF_NOCONFIRMATION;
    OpStruc.fAnyOperationsAborted := False;
    OpStruc.hNameMappings := nil;
    Result := ((ShFileOperation(OpStruc) = 0) and (not OpStruc.fAnyOperationsAborted));
  end;
end;

function CompactarFbkMD5(Origem: WideString; Destino: WideString): Boolean; stdcall;
var
  ZipFile: TZipFile;
  LogWinrar: THw_erro_classList;
  LogFile: TStrings;
begin
  Result := False;

  try
    LogWinrar := THw_erro_classList.Create();
    LogWinrar.PrintDate := True;
    LogFile := TStringList.Create;

    LogWinrar.New('Entrou na dll MD5X3.dll CompactarDiretorioMD5');
    LogWinrar.New('Origem "%s"', [Origem]);
    LogWinrar.New('Destino "%s"', [Destino]);

    // Cria uma instância da classe TZipFile
    ZipFile := TZipFile.Create;

    if not DirectoryExists(ExtractFilePath(Destino)) then
    begin
      CreateDir(ExtractFilePath(Destino));
      LogWinrar.New('Criando diretorio "%s"', [ExtractFilePath(Destino)]);
      Sleep(2000);
    end;

    if not DirectoryExists(ExtractFilePath(Destino)) then
      Exit;

    // Compacta os arquivos

    LogWinrar.New('Montando arquivo compactado "%s"', [Destino]);

    ZipFile.Open(Destino, zmWrite);

    LogWinrar.New('Compactando do arquivo "%s"', [Origem]);

    ZipFile.Add(Origem);

    LogWinrar.New('Fim Winrar');

    ZipFile.Close;

    Result := FileExists(Destino);

    LogWinrar.New('Arquivo criado "%s"', [iif(Result, 'Sim', 'Não')]);

  finally
    if Assigned(LogWinrar) then
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + 'winrar.log') then
      begin
        LogFile.LoadFromFile(ExtractFilePath(Application.ExeName) + 'winrar.log');
        if LogFile.Count = 0 then
          LogFile.Add(FormatDateTime('DD/MM/YYYY', Date))
        else if LogFile[0] <> FormatDateTime('DD/MM/YYYY', Date) then
        begin
          LogFile.Clear;
          LogFile.Add(FormatDateTime('DD/MM/YYYY', Date));
        end;
      end
      else
        LogFile.Add(FormatDateTime('DD/MM/YYYY', Date));

      LogFile.Add(LogWinrar.formato_TStrings.Text);
      LogFile.SaveToFile(ExtractFilePath(Application.ExeName) + 'winrar.log');

      FreeAndNil(LogWinrar);
    end;


    if Assigned(LogFile) then
      FreeAndNil(LogFile);

    if Assigned(ZipFile) then
      ZipFile.Free;
  end;
end;

function CompactarArquivoMD5(Origem: WideString; Destino: WideString): Boolean; stdcall;
var
  vArquivoTMP: string;
  ZipFile: TZipFile;
  LogWinrar: THw_erro_classList;
  LogFile: TStrings;
begin
  Result := False;

  try
    LogWinrar := THw_erro_classList.Create();
    LogWinrar.PrintDate := True;
    LogFile := TStringList.Create;

    LogWinrar.New('Entrou na dll MD5X3.dll CompactarArquivoMD5');
    LogWinrar.New('Origem "%s"', [Origem]);
    LogWinrar.New('Destino "%s"', [Destino]);

    // Cria uma instância da classe TZipFile
    ZipFile := TZipFile.Create;

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'pathtmp') then
    begin
      CreateDir(ExtractFilePath(Application.ExeName) + 'pathtmp');
      LogWinrar.New('Criando diretorio "%s"', [ExtractFilePath(Application.ExeName) + 'pathtmp']);
      Sleep(2000);
    end;

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'pathtmp') then
      Exit;

    vArquivoTMP := ExtractFilePath(Application.ExeName) + 'pathtmp' + '\' + ExtractFileName(Origem);

    if FileExists(ExtractFilePath(Application.ExeName) + 'winrar.log') then
    begin
      DeleteFile(PChar(ExtractFilePath(Application.ExeName + 'winrar.log')));
      LogWinrar.New('Apagando arquivo de log "%s"', [ExtractFilePath(Application.ExeName) + 'winrar.log']);
    end;

    if FileExists(vArquivoTMP) then
    begin
      DeleteFile(PChar(vArquivoTMP));
      LogWinrar.New('Apagando arquivo de copia "%s"', [vArquivoTMP]);
      Sleep(2000);
    end;

    LogWinrar.New('Enviando comando para windows copiar arquivo');
    LogWinrar.New('Origem : "%s"', [Origem]);
    LogWinrar.New('Destino: "%s"', [vArquivoTMP]);

    if hw_copy_dir(WideString(Origem), WideString(vArquivoTMP)) then
    begin
      if FileExists(vArquivoTMP) then
      begin
        LogWinrar.New('Retorno da dll OK');
        LogWinrar.New('Fim da cópia');

        try
          // Compacta os arquivos

          LogWinrar.New('Montando arquivo compactado "%s"', [Destino]);

          ZipFile.Open(Destino, zmWrite);

          LogWinrar.New('Compactando arquivo "%s"', [vArquivoTMP]);

          ZipFile.Add(vArquivoTMP);

          LogWinrar.New('Fim Winrar');

          ZipFile.Close;

          Result := FileExists(Destino);

          LogWinrar.New('Arquivo criado "%s"', [iif(Result, 'Sim', 'Não')]);
        finally
          if FileExists(vArquivoTMP) then
          begin
            LogWinrar.New('Apagando arquivo de copia "%s"', [vArquivoTMP]);

            DeleteFile(PChar(vArquivoTMP));

            LogWinrar.New('Fim apagando arquivo de copia');
          end;
        end;
      end
      else
      begin
        LogWinrar.New('Retorno da dll ERRO');
        LogWinrar.New('Fim da cópia');
      end;
    end
    else
    begin
      LogWinrar.New('Retorno da dll ERRO');
      LogWinrar.New('Fim da cópia');
    end;

  finally
    if Assigned(LogWinrar) then
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + 'winrar.log') then
      begin
        LogFile.LoadFromFile(ExtractFilePath(Application.ExeName) + 'winrar.log');
        if LogFile.Count = 0 then
          LogFile.Add(FormatDateTime('DD/MM/YYYY', Date))
        else if LogFile[0] <> FormatDateTime('DD/MM/YYYY', Date) then
        begin
          LogFile.Clear;
          LogFile.Add(FormatDateTime('DD/MM/YYYY', Date));
        end;
      end
      else
        LogFile.Add(FormatDateTime('DD/MM/YYYY', Date));

      LogFile.Add(LogWinrar.formato_TStrings.Text);
      LogFile.SaveToFile(ExtractFilePath(Application.ExeName) + 'winrar.log');

      FreeAndNil(LogWinrar);
    end;


    if Assigned(LogFile) then
      FreeAndNil(LogFile);

    if Assigned(ZipFile) then
      ZipFile.Free;
  end;
end;

function CompactarArquivosMD5(Origem: array of WideString; Destino: WideString): Boolean; stdcall;
var
  vArquivoTMP: string;
  ZipFile: TZipFile;
  LogWinrar: THw_erro_classList;
  LogFile: TStrings;
  I: Integer;
begin
  Result := False;

  try
    LogWinrar := THw_erro_classList.Create();
    LogWinrar.PrintDate := True;
    LogFile := TStringList.Create;

    LogWinrar.New('Entrou na dll MD5X3.dll CompactarArquivosMD5');
//    LogWinrar.New('Origem "%s"', [Origem]);
//    LogWinrar.New('Destino "%s"', [Destino]);

    // Cria uma instância da classe TZipFile
    ZipFile := TZipFile.Create;

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'pathtmp') then
    begin
      CreateDir(ExtractFilePath(Application.ExeName) + 'pathtmp');
      LogWinrar.New('Criando diretorio "%s"', [ExtractFilePath(Application.ExeName) + 'pathtmp']);
      Sleep(2000);
    end;

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'pathtmp') then
      Exit;

    if FileExists(ExtractFilePath(Application.ExeName) + 'winrar.log') then
    begin
      DeleteFile(PChar(ExtractFilePath(Application.ExeName + 'winrar.log')));
      LogWinrar.New('Apagando arquivo de log "%s"', [ExtractFilePath(Application.ExeName) + 'winrar.log']);
    end;

    if Length(Origem) > 0 then
    begin
      // Compacta os arquivos

      LogWinrar.New('Montando arquivo compactado "%s"', [Destino]);

      ZipFile.Open(Destino, zmWrite);

      for I := Low(Origem) to High(Origem) do
      begin
        vArquivoTMP := ExtractFilePath(Application.ExeName) + 'pathtmp' + '\' + ExtractFileName(Origem[I]);

        if FileExists(vArquivoTMP) then
        begin
          DeleteFile(PChar(vArquivoTMP));
          LogWinrar.New('Apagando arquivo de copia "%s"', [vArquivoTMP]);
          Sleep(2000);
        end;

        LogWinrar.New('Enviando comando para windows copiar arquivo');
        LogWinrar.New('Origem : "%s"', [Origem[I]]);
        LogWinrar.New('Destino: "%s"', [vArquivoTMP]);

        if hw_copy_dir(WideString(Origem[I]), WideString(vArquivoTMP)) then
        begin
          if FileExists(vArquivoTMP) then
          begin
            LogWinrar.New('Retorno da dll OK');
            LogWinrar.New('Fim da cópia');

            try
              LogWinrar.New('Compactando arquivo "%s"', [vArquivoTMP]);

              ZipFile.Add(vArquivoTMP);

            finally
              if FileExists(vArquivoTMP) then
              begin
                LogWinrar.New('Apagando arquivo de copia "%s"', [vArquivoTMP]);

                DeleteFile(PChar(vArquivoTMP));

                LogWinrar.New('Fim apagando arquivo de copia');
              end;
            end;
          end
          else
          begin
            LogWinrar.New('Retorno da dll ERRO');
            LogWinrar.New('Fim da cópia');
          end;
        end
        else
        begin
          LogWinrar.New('Retorno da dll ERRO');
          LogWinrar.New('Fim da cópia');
        end;
      end;

      LogWinrar.New('Fim Winrar');

      ZipFile.Close;

      Result := FileExists(Destino);

      LogWinrar.New('Arquivo criado "%s"', [iif(Result, 'Sim', 'Não')]);
    end;

  finally
    if Assigned(LogWinrar) then
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + 'winrar.log') then
      begin
        LogFile.LoadFromFile(ExtractFilePath(Application.ExeName) + 'winrar.log');
        if LogFile.Count = 0 then
          LogFile.Add(FormatDateTime('DD/MM/YYYY', Date))
        else if LogFile[0] <> FormatDateTime('DD/MM/YYYY', Date) then
        begin
          LogFile.Clear;
          LogFile.Add(FormatDateTime('DD/MM/YYYY', Date));
        end;
      end
      else
        LogFile.Add(FormatDateTime('DD/MM/YYYY', Date));

      LogFile.Add(LogWinrar.formato_TStrings.Text);
      LogFile.SaveToFile(ExtractFilePath(Application.ExeName) + 'winrar.log');

      FreeAndNil(LogWinrar);
    end;


    if Assigned(LogFile) then
      FreeAndNil(LogFile);

    if Assigned(ZipFile) then
      ZipFile.Free;
  end;
end;

function CompactarDiretorioMD5(Origem: WideString; Destino: WideString): Boolean; stdcall;
var
  vPastaTMP, vNomeTMP: string;
  ZipFile: TZipFile;
  LogWinrar: THw_erro_classList;
  LogFile: TStrings;
begin
  Result := False;

  try
    LogWinrar := THw_erro_classList.Create();
    LogWinrar.PrintDate := True;
    LogFile := TStringList.Create;

    LogWinrar.New('Entrou na dll MD5X3.dll CompactarDiretorioMD5');
    LogWinrar.New('Origem "%s"', [Origem]);
    LogWinrar.New('Destino "%s"', [Destino]);

    // Cria uma instância da classe TZipFile
    ZipFile := TZipFile.Create;

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'pathtmp') then
    begin
      CreateDir(ExtractFilePath(Application.ExeName) + 'pathtmp');
      LogWinrar.New('Criando diretorio "%s"', [ExtractFilePath(Application.ExeName) + 'pathtmp']);
      Sleep(2000);
    end;

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'pathtmp') then
      Exit;

    vPastaTMP := StringReplace(Trim(Origem), '/', '\', [rfReplaceAll]);
    if Length(vPastaTMP) > 0 then
      if vPastaTMP[Length(vPastaTMP)] = '\' then
        System.Delete(vPastaTMP, Length(vPastaTMP), 1);

    while Pos('\', vPastaTMP) > 0 do
      System.Delete(vPastaTMP, 1, Pos('\', vPastaTMP));

    vNomeTMP  := vPastaTMP;

    vPastaTMP := ExtractFilePath(Application.ExeName) + 'pathtmp' + '\' + vNomeTMP;

    if DirectoryExists(vPastaTMP) then
    begin
      ApagaDir(Application.Handle, vPastaTMP);
      LogWinrar.New('Apagando diretório de copia "%s"', [vPastaTMP]);
      Sleep(2000);
    end;

    if not DirectoryExists(vPastaTMP) then
    begin
      CreateDir(vPastaTMP);
      LogWinrar.New('Criando diretorio "%s"', [vPastaTMP]);
      Sleep(2000);
    end;

    if not DirectoryExists(vPastaTMP) then
      Exit;

    if FileExists(ExtractFilePath(Application.ExeName) + 'winrar.log') then
    begin
      DeleteFile(PChar(ExtractFilePath(Application.ExeName) + 'winrar.log'));
      LogWinrar.New('Apagando arquivo de log "%s"', [ExtractFilePath(Application.ExeName) + 'winrar.log']);
    end;

    LogWinrar.New('Enviando comando para windows copiar arquivo');
    LogWinrar.New('Origem : "%s"', [Origem]);
    LogWinrar.New('Destino: "%s"', [vPastaTMP]);

    if hw_copy_dir(WideString(Origem), WideString(vPastaTMP)) then
    begin
      if DirectoryExists(vPastaTMP) then
      begin
        LogWinrar.New('Retorno da dll OK');
        LogWinrar.New('Fim da cópia');

        try
          // Compacta as pastas

          LogWinrar.New('Montando arquivo compactado "%s"', [Destino]);

          LogWinrar.New('Compactando do arquivo "%s"', [vPastaTMP]);

          ZipFile.ZipDirectoryContents(Destino, vPastaTMP, zcDeflate, nil);

          LogWinrar.New('Fim Winrar');

          ZipFile.Close;

          Result := FileExists(Destino);

          LogWinrar.New('Arquivo criado "%s"', [iif(Result, 'Sim', 'Não')]);
        finally
          if DirectoryExists(vPastaTMP) then
          begin
            LogWinrar.New('Apagando diretório "%s" de copia', [vPastaTMP]);

            ApagaDir(Application.Handle, vPastaTMP);

            LogWinrar.New('Fim apagando diretório de copia');
          end;
        end;
      end
      else
      begin
        LogWinrar.New('Retorno da dll ERRO');
        LogWinrar.New('Fim da cópia');
      end;
    end
    else
    begin
      LogWinrar.New('Retorno da dll ERRO');
      LogWinrar.New('Fim da cópia');
    end;

  finally
    if Assigned(LogWinrar) then
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + 'winrar.log') then
      begin
        LogFile.LoadFromFile(ExtractFilePath(Application.ExeName) + 'winrar.log');
        if LogFile.Count = 0 then
          LogFile.Add(FormatDateTime('DD/MM/YYYY', Date))
        else if LogFile[0] <> FormatDateTime('DD/MM/YYYY', Date) then
        begin
          LogFile.Clear;
          LogFile.Add(FormatDateTime('DD/MM/YYYY', Date));
        end;
      end
      else
        LogFile.Add(FormatDateTime('DD/MM/YYYY', Date));

      LogFile.Add(LogWinrar.formato_TStrings.Text);
      LogFile.SaveToFile(ExtractFilePath(Application.ExeName) + 'winrar.log');

      FreeAndNil(LogWinrar);
    end;

    if Assigned(LogFile) then
      FreeAndNil(LogFile);

    if Assigned(ZipFile) then
      ZipFile.Free;
  end;
end;

function hw_gravar_crc(ArquivoACompactar: WideString; ArquivoDestinoCRC: WideString): WideString; stdcall;
var
  CRC: Cardinal;
  FS: TFileStream;
  Buff: TBytes;
  TamanhoArquivo: Int64;
  crcOutput: TStrings;
  vOrigem, vDestino: string;
begin
  try
    Result := '';
    vOrigem  := ArquivoACompactar;
    vDestino := ArquivoDestinoCRC;

    FS := TFileStream.Create(vOrigem, fmOpenRead);
    crcOutput := TStringList.Create();
    try
      TamanhoArquivo := fs.Size;
      SetLength(Buff, TamanhoArquivo);

      if TamanhoArquivo > 0 then
        FS.ReadBuffer(Buff[0], TamanhoArquivo);
      
      CRC := crc32( 0, pByte(Buff), Length(Buff)  );

      crcOutput.Text := IntToHex(CRC, 8);
      crcOutput.SaveToFile( vDestino );
    finally
      FS.Free;
      crcOutput.Free();
    end;
  except on E: Exception do
    begin
      Result := 'Origem (' + vOrigem + ') Destino: ' + vDestino + ' Erro: ' + E.Message;
    end;
  end;
end;


exports
  _getMd5,
  _getMd5File,
  _strImagetoBase64,
  _strBase64toImage,
  _markdownToHtml,
//    _strPDFtoBase64,
  hw_copy_dir,
  hw_gravar_crc,
  CompactarFbkMD5,
  CompactarArquivoMD5,
  CompactarArquivosMD5,
  CompactarDiretorioMD5;
end.
