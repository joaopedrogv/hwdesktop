unit hw_win_utils;

interface

uses
{$IFDEF VER180}
  Classes,
  Windows,
  Registry,
  Variants,
  TypInfo,
  IniFiles,
  USock;
{$ELSE}
  Winapi.Windows,
  System.Classes,
  System.Win.Registry,
  System.Variants,
  System.TypInfo,
  System.IniFiles,
  USock;
{$ENDIF}

const
  DEFAULT_KEY_PATH = 'Software\Hw\Configuracao\Telas\';

type
  RegistroWin = class
  public
    class procedure Write(identifier, key: string; value: Variant; KeyPath: string = ''); overload;
    class function Read(identifier, key: string; defaultValue: Variant; KeyPath: string = ''): Variant; overload;
  end;

  IniConf = class
  strict private
    class function GetIniFile: TIniFile;
  public
    class procedure Write(const section, ident: string; value: Variant);
    class function ReadInt(const section, ident: string; default: Integer = 0): Integer;
    class function ReadDouble(const section, ident: string; default: Double = 0): Double;
    class function ReadStr(const section, ident: string; default: string = ''): string;
    class function FileReadStr(const filename,section, ident: string; default: string = ''): string;
  end;

  LogApp = class
  public
    class procedure Error(const log: string); overload;
    class procedure Error(const log: string; const Args: array of const); overload;
    class procedure Log(const logname, log: string; printDate: Boolean = True; resetFile: Boolean = False);
    class procedure LogR(const logname, log: string; printDate: Boolean = True);
  end;

  TextFileWriter = class
  strict private
    fileText: TextFile;
    filename: string;
  public
    constructor Create(AFileName: string; resetIfExists: Boolean = True);
    destructor Destroy; override;

    procedure Add(text: string); overload; virtual;
    procedure Add(text: string; const Args: array of const); overload; virtual;
  end;

  TCSVWriter = class(TextFileWriter)
  strict private
    formatString: string;
  public
    constructor Create(AFileName, AColumns, AFormatString: string);
    procedure Add(const Args: array of const);
  end;

  Mutex = class
  public
    class function CreateOne(var mutex_instance: Cardinal;  name: string): Boolean;
    class procedure RelaseOne(var mutex_instance: Cardinal);
  end;

  ParamApp = class
  public
    class function Exists(const name: string; caseSensitive: Boolean = False): Boolean;
    class function Value(const name: string; caseSensitive: Boolean = False): string;
  end;

  Base64Helper = class
  public
    class function DecodeFile(base64: string; outputFile: string): string;
    class function EncodeFile(inputFile: string): string;
  end;

  function CreateProcessSimple(cmd: string; pWait: Boolean = False; AhideWindow: Boolean = False): boolean;
  function CreateProcessWithOutPut(cmd: string): string;
  function GetPathTemp(FolderName: string): string;
  function GetFileNameRandom(path, extension: string): string;
  function GetUserLoggedName: string;
  function GetFileList(path: string; ext: string = '*.*'): TStrings;
  function GetComputer: string;
  function GetSerialHd: string;
  function GetIP: string;
  function GetIpsInterfaces: TStrings;
  function GetSpecialFolderPath(Folder: integer): string;
  function FileSizeB(const aFilename: String; divisor: Integer = 1): Double;
  procedure KillProcess(hWindowHandle: HWND);

implementation

uses
{$IFDEF VER180}
  SysUtils,
  StrUtils,
  SHFolder,
  Messages,
  WinSock,
  IdCoderMIME;
{$ELSE}
  Winapi.SHFolder,
  Winapi.WinSock,
  System.SysUtils,
  System.StrUtils,
  System.NetEncoding,
  Winapi.Messages;
{$ENDIF}

function CreateProcessSimple(cmd: string; pWait: Boolean = False; AhideWindow: Boolean = False): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_SHOW;

  if AhideWindow then
  Result := CreateProcess(nil, PChar(cmd), nil, nil, false, CREATE_NO_WINDOW, nil, nil, SUInfo, ProcInfo)
  else
  Result := CreateProcess(nil, PChar(cmd), nil, nil, false, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo);

  if (Result) then
  begin
    if pWait then
    WaitForSingleObject(ProcInfo.hProcess, INFINITE)
    else
    WaitForSingleObject(ProcInfo.hProcess, 0);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function CreateProcessWithOutPut(cmd: string): string;
var
  SecAtrrs: TSecurityAttributes;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  pCommandLine: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  Result := '';
  with SecAtrrs do begin
    nLength := SizeOf(SecAtrrs);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SecAtrrs, 0);
  try
    with StartupInfo do
    begin
      FillChar(StartupInfo, SizeOf(StartupInfo), 0);
      cb := SizeOf(StartupInfo);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    WorkDir := 'C:\';
    Handle := CreateProcess(nil, PChar( cmd ),
                            nil, nil, True, 0, nil,
                            PChar(WorkDir), StartupInfo, ProcessInfo);
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, pCommandLine, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            pCommandLine[BytesRead] := #0;
            Result := Result + pCommandLine;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      finally
        CloseHandle(ProcessInfo.hThread);
        CloseHandle(ProcessInfo.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;

function GetPathTemp(FolderName: string): string;
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
  begin
    Result := True;
    AfileTest.Add(DateTimeToStr(Now));
    try
      AfileTest.SaveToFile(Apath + '\test.txt');
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
      Result := vPath + '\Hw Sistemas\Temp\BOL';
      run_path(Result);

      Result := Result + '\' + FolderName;

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
      Result := ExtractFilePath(ParamStr(0)) + FolderName;
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

function GetFileNameRandom(path, extension: string): string;
begin
  if (not ContainsText(path, '/')) or (ContainsText(path, '\')) then
    path := GetPathTemp(path);

  if (not StartsText('.', extension)) and (extension <> '') then
    extension := '.' + extension;

  Randomize;

  Result := path + IntToStr(Random(999999)) + extension;
  while FileExists(Result) do
    Result := path + IntToStr(Random(999999)) + extension;
end;

function GetSerialHd: string;
var
  sWinDir: string;
  nTam: Integer;
  DLabel: array[0..11] of Char;
  Serial: DWord;
  DirLen, Flags: DWord;
begin
  try
    nTam := MAX_PATH;
    SetLength(sWinDir, nTam);
    GetSystemDirectory(PChar(sWinDir), nTam);
    GetVolumeInformation(PChar(Copy(sWinDir, 1, 1) + ':\'), dLabel, 12, @Serial, DirLen, Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  except
    Result := '';
  end;
end;

function GetUserLoggedName: string;
var
  nSize: DWord;
begin
 nSize := 255;
 SetLength(Result, nSize);
 if GetUserName(PChar(Result), nSize) then
   SetLength(Result, nSize - 1)
 else
   Result := '';
end;

function GetComputer: string;
var
  Name: AnsiString;
begin
  SetLength(Name, 255);
  Gethostname(PAnsiChar(Name), 255);
  SetLength(Name, StrLen(PAnsiChar(Name)));
  result := Name;
end;

function GetIP: string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: AnsiString;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PAnsiChar(Name), 255);
  SetLength(Name, StrLen(PAnsiChar(Name)));
  HostEnt := gethostbyname(PAnsiChar(Name));
  with HostEnt^ do
  begin
    Result := Format('%d.%d.%d.%d',
      [Byte(h_addr^[0]), Byte(h_addr^[1]),
      Byte(h_addr^[2]), Byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

function GetIpsInterfaces: TStrings;
var
	i                 : Integer;
  aNetInterfaceList : tNetworkInterfaceList;
begin
  Result := TStringList.Create;

  if (GetNetworkInterfaces (aNetInterfaceList)) THen
    for i := 0 to High (aNetInterfaceList) do
    	if aNetInterfaceList[i].AddrIP <> '127.0.0.1' then
      	Result.Add(aNetInterfaceList[i].AddrIP);

//      vStringList.Add ('');
//      vStringList.Add ('#                          : ' + IntToStr(i));
//      vStringList.Add ('Name                       : ' + aNetInterfaceList[i].ComputerName);
//      vStringList.Add ('IP-Address                 : ' + aNetInterfaceList[i].AddrIP);
//      vStringList.Add ('Subnet mask                : ' + aNetInterfaceList[i].SubnetMask);
//      vStringList.Add ('Net address                : ' + aNetInterfaceList[i].AddrNet);
//      vStringList.Add ('Limited broadcast address  : ' + aNetInterfaceList[i].AddrLimitedBroadcast);
//      vStringList.Add ('Directed Broadcast address : ' + aNetInterfaceList[i].AddrDirectedBroadcast);
//      vStringList.Add ('Interface up               : ' + BoolToStr (aNetInterfaceList[i].IsInterfaceUp, True));
//      vStringList.Add ('Broadcast supported        : ' + BoolToStr (aNetInterfaceList[i].BroadcastSupport, True));
//      vStringList.Add ('Loopback interface         : ' + BoolToStr (aNetInterfaceList[i].IsLoopback, True));
//      vStringList.Add ('');
end;

function GetFileList(path, ext: string): TStrings;
var
  SR: TSearchRec;
begin
  Result := TStringList.Create;

  path := IncludeTrailingPathDelimiter(path);

  if FindFirst(Path + ext, faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        Result.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function GetSpecialFolderPath(Folder: integer): string;
const
    SHGFP_TYPE_CURRENT = 0;
var
  vPath: array[0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0, Folder, 0, SHGFP_TYPE_CURRENT, @vPath[0])) then
    Result := vPath
  else
    Result := 'C:\WINDOWS\TEMP';
end;

{ RegistroWin }

class function RegistroWin.Read(identifier, key:string; defaultValue: Variant;
  KeyPath: string): Variant;
var
  registro: TRegistry;
begin
  try

    Result := defaultValue;

    if KeyPath = '' then
      KeyPath := DEFAULT_KEY_PATH;

    registro := TRegistry.Create;
    try

      registro.OpenKey(IncludeTrailingPathDelimiter(KeyPath) + identifier, True);
      if not registro.ValueExists(key) then
        Exit;

      //Result := registro.ReadFloat(key);

      case VarType(defaultValue) of
        varString{$IFNDEF VER180}, varUString {$ENDIF}:
          Result := registro.ReadString(key);
        varBoolean:
          Result := registro.ReadBool(key);
        varInteger, varSmallint, varInt64:
          Result := registro.ReadInteger(key);
        varDouble, varCurrency:
          Result := registro.ReadFloat(key);
        varDate:
          Result := registro.ReadDateTime(key);
      end;

      registro.CloseKey;
    finally
      registro.Free;
    end;

  except
  end;
end;

class procedure RegistroWin.Write(identifier, key: string;
  value: Variant; KeyPath: string);
var
  registro: TRegistry;
begin
  try

    if KeyPath = '' then
      KeyPath := DEFAULT_KEY_PATH;

    registro := TRegistry.Create;
    try
      registro.OpenKey(IncludeTrailingPathDelimiter(KeyPath) + identifier, True);

      case VarType(value) of
        varString{$IFNDEF VER180}, varUString {$ENDIF}:
          registro.WriteString(key, value);
        varBoolean:
          registro.WriteBool(key, value);
        varInteger, varSmallint, varInt64:
          registro.WriteInteger(key, value);
        varDouble, varCurrency:
          registro.WriteFloat(key, value);
        varDate:
          registro.WriteDateTime(key, value);
      end;

      registro.CloseKey;
    finally
      registro.Free;
    end;

  except
  end;
end;

{ IniConf }

class function IniConf.FileReadStr(const filename, section, ident: string;
  default: string): string;
var
  fileini: TIniFile;
  fileN: string;
begin
  Result := default;
  fileN := fileName;
  if not FileExists(fileN) then
  begin
    if not EndsText('.ini', fileN) then
      fileN := fileN + '.ini';

    fileN := ExtractFilePath(ParamStr(0)) + fileN;

    if not FileExists(fileN) then
      Exit;
  end;

  fileini := TIniFile.Create(fileN);
  try
    Result := fileini.ReadString(section, ident, default);
  finally
    fileini.Free;
  end;
end;

class function IniConf.GetIniFile: TIniFile;
var
  fileName: string;
begin
  fileName := ExtractFilePath(ParamStr(0)) + 'hwsistemas.ini';
  if not FileExists(fileName) then
    fileName := ExtractFilePath(ParamStr(0)) + 'Config.ini';

  try
    Result := TIniFile.Create(fileName);
  except
  end;
end;

class function IniConf.ReadDouble(const section, ident: string;
  default: Double): Double;
begin
  with IniConf.GetIniFile do
  begin
    Result := ReadFloat(section, ident, default);
    Free;
  end;
end;

class function IniConf.ReadInt(const section, ident: string;
  default: Integer): Integer;
begin
  with IniConf.GetIniFile do
  begin
    Result := ReadInteger(section, ident, default);
    Free;
  end;
end;

class function IniConf.ReadStr(const section, ident: string;
  default: string): string;
begin
  with IniConf.GetIniFile do
  begin
    Result := ReadString(section, ident, default);
    Free;
  end;
end;

class procedure IniConf.Write(const section, ident: string; value: Variant);
var
  iniFile: TIniFile;
begin
  iniFile := IniConf.GetIniFile;
  try
    case VarType(value) of
      varString{$IFNDEF VER180}, varUString {$ENDIF}:
        iniFile.WriteString(section, ident, value);
      varBoolean:
        iniFile.WriteBool(section, ident, value);
      varInteger, varSmallint, varInt64:
        iniFile.WriteInteger(section, ident, value);
      varDouble, varCurrency:
        iniFile.WriteFloat(section, ident, value);
      varDate:
        iniFile.WriteDateTime(section, ident, value);
    end;
  finally
    iniFile.Free;
  end;
end;

{ LogApp }

class procedure LogApp.Error(const log: string);
begin
  LogApp.Log('erros', log);
end;

class procedure LogApp.Error(const log: string;
  const Args: array of const);
begin
  LogApp.Error(Format(log, Args));
end;

class procedure LogApp.Log(const logname, log: string;
  printDate, resetFile: Boolean);
var
  lfile: TextFile;
  filename: string;
  str: string;
begin
  filename := ExtractFilePath(ParamStr(0)) + logname + IfThen(not EndsText('.log', logname), '.log');

  AssignFile(lfile, filename);
  try

    if not FileExists(filename) then
      Rewrite(lfile)
    else if resetFile then
      Rewrite(lfile)
    else
      append(lfile);

    if printDate then
      str := FormatDateTime('DD/MM/YYYY hh:mm:ss', Now) + ' ' + log
    else
      str := log;

    WriteLn(lfile, str);

  finally
    CloseFile(lfile);
  end;
end;

class procedure LogApp.LogR(const logname, log: string;
  printDate: Boolean);
begin
  LogApp.Log(logname, log, printDate, True)
end;

{ Mutex }

class function Mutex.CreateOne(var mutex_instance: Cardinal;
  name: string): Boolean;
var
  new_instance: Cardinal;
begin
  Result := False;
  //MyMsg := RegisterWindowMessage(PAnsiChar(name));
  {$IFNDEF VER180}
  new_instance := CreateMutex(nil, True, PWideChar(name));
  {$ELSE}
  new_instance := CreateMutex(nil, True, PAnsiChar(name));
  {$ENDIF}
  if (GetLastError = ERROR_ALREADY_EXISTS) then
  begin
    ReleaseMutex(new_instance);
    CloseHandle(new_instance);
    Exit;
  end;

  if (new_instance = 0) then
    Exit;

  if (mutex_instance <> 0) then
    Mutex.RelaseOne(mutex_instance);

  mutex_instance := new_instance;
  Result := True;
end;

class procedure Mutex.RelaseOne(var mutex_instance: Cardinal);
begin
  if mutex_instance <> 0 then
  begin
    ReleaseMutex(mutex_instance);
    CloseHandle(mutex_instance);
    mutex_instance := 0;
  end;
end;

function FileSizeB(const aFilename: String; divisor: Integer): Double;
var
  info: TWin32FileAttributeData;
begin
  Result := -1;

  {$IFNDEF VER180}
  if not GetFileAttributesEx(PWideChar(aFileName), GetFileExInfoStandard, @info) then
  {$ELSE}
  if not GetFileAttributesEx(PChar(aFileName), GetFileExInfoStandard, @info) then
  {$ENDIF}
    Exit;

  Result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
  Result := Result / divisor;
end;

procedure KillProcess(hWindowHandle: HWND);
var
  hprocessID: INTEGER;
  processHandle: THandle;
  DWResult: DWORD;
begin
  SendMessageTimeout(hWindowHandle, WM_CLOSE, 0, 0,
    SMTO_ABORTIFHUNG or SMTO_NORMAL, 5000, DWResult);
  if isWindow(hWindowHandle) then
  begin
    { Get the process identifier for the window}
    GetWindowThreadProcessID(hWindowHandle, @hprocessID);
    if hprocessID <> 0 then
    begin
      { Get the process handle }
      processHandle := OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,
        False, hprocessID);
      if processHandle <> 0 then
      begin
        { Terminate the process }
        TerminateProcess(processHandle, 0);
        CloseHandle(ProcessHandle);
      end;
    end;
  end;

end;

{ ParamApp }

class function ParamApp.Exists(const name: string;
  caseSensitive: Boolean): Boolean;
var
  I: Integer;
  s, n: string;
begin
  Result := False;
  //param index 0 = nome do arquivo executavel
  n := Trim(IfThen(caseSensitive, name, AnsiUpperCase(name)));
  for I := 1 to ParamCount do
  begin
    s := Trim(IfThen(caseSensitive, ParamStr(I), AnsiUpperCase(ParamStr(I))));
    if Result then
      Break
    else
      Result := (n = s) or (StartsStr(n + '=', s));
  end;
end;

class function ParamApp.Value(const name: string;
  caseSensitive: Boolean): string;
var
  I: Integer;
  s, n: string;
begin
  Result := '';
  n := IfThen(caseSensitive, name, AnsiUpperCase(name));
  for I := 1 to ParamCount do
  begin
    s := IfThen(caseSensitive, ParamStr(I), AnsiUpperCase(ParamStr(I)));
    if Result <> '' then
      Exit
    else if StartsStr(n + '=', s) then
      Result := Copy(ParamStr(I), Length(name) + 2,  Length(ParamStr(I)));
  end;
end;

{ Base64Helper }

class function Base64Helper.DecodeFile(base64, outputFile: string): string;
var
  fo: TFileStream;
  {$IFNDEF VER180}
  s: TStringStream;
  {$ELSE}
  dec: TIdDecoderMIME;
  {$ENDIF}
begin
  fo := TFileStream.Create(outputFile, fmCreate);
  try

    {$IFNDEF VER180}
    s := TStringStream.Create(base64);
    try
      TNetEncoding.Base64.Decode(s, fo);
    finally
      s.Free;
    end;
    {$ELSE}
    dec := TIdDecoderMIME.Create(nil);
    try
      dec.DecodeBegin(fo);
      dec.Decode(ReplaceText(base64, sLineBreak, ''));
      dec.DecodeEnd;
    finally
      dec.Free;
    end;
    {$ENDIF}

  finally
    fo.Free;
  end;

  Result := outputFile;
end;

class function Base64Helper.EncodeFile(inputFile: string): string;
var
  fi: TFileStream;
  {$IFNDEF VER180}
  s: TStringStream;
  {$ELSE}
  enc: TIdEncoderMIME;
  {$ENDIF}
begin

  fi := TFileStream.Create(inputfile, fmOpenRead);
  try
    {$IFNDEF VER180}
    s := TStringStream.Create('');
    try
      TNetEncoding.Base64.Encode(fi, s);

      Result := s.DataString;

    finally
      s.Free;
    end;
    {$ELSE}
    enc := TIdEncoderMIME.Create(nil);
    try
      Result := enc.Encode(fi);
    finally
      enc.Free;
    end;
    {$ENDIF}

  finally
    fi.Free;
  end;
end;

{ TextFileWriter }

procedure TextFileWriter.Add(text: string);
begin
  WriteLn(fileText, text);
end;

procedure TextFileWriter.Add(text: string;
  const Args: array of const);
begin
  Add(Format(text, Args));
end;

constructor TextFileWriter.Create(AFileName: string; resetIfExists: Boolean);
begin
  filename := AFileName;

  AssignFile(fileText, filename);

  if not FileExists(filename) then
    Rewrite(fileText)
  else if resetIfExists then
    Rewrite(fileText)
  else
    append(fileText);

end;

destructor TextFileWriter.Destroy;
begin
  CloseFile(fileText);
  inherited;
end;  

{ TCSVWriter }

procedure TCSVWriter.Add(const Args: array of const);
begin
  inherited Add(formatString, Args);
end;

constructor TCSVWriter.Create(AFileName, AColumns, AFormatString: string);
begin
  inherited Create(AFileName);
  formatString := AFormatString;
  inherited Add(AColumns);
end;

end.
