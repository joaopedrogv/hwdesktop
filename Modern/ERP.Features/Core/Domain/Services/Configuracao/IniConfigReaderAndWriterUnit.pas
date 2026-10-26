unit IniConfigReaderAndWriterUnit;

interface

uses
  SysUtils, Classes,
  IConfigReaderAndWriterUnit,
  IniFiles, FileConfigUnit;

type
  IniConfigReaderAndWriter = class(TInterfacedObject, IConfigReader, IConfigWriter)
  private
    FIniConfig: TMemIniFile;
  public
    constructor Create(Configuracao: TStrings); overload;
    constructor Create(const InputFile: FileConfig); overload;
    destructor Destroy; override;

    function ReadString(const Section, Ident: string; DefaultValue: string = ''): string;
    function ReadInteger(const Section, Ident: string; DefaultValue: Integer = 0): Integer;
    function ReadBool(const Section, Ident: string; DefaultValue: Boolean): Boolean;

    procedure WriteString(const Section, Ident: string; Value: string);
    procedure WriteInteger(const Section, Ident: string; Value: Integer);

    function GetStrings(): string;
  end;

implementation

uses
  StrUtils;

{ IniConfigReaderAndWriter }

constructor IniConfigReaderAndWriter.Create(Configuracao: TStrings);
begin
  FIniConfig := TMemIniFile.Create('');
  if Configuracao <> nil then
    FIniConfig.SetStrings(Configuracao);
end;

constructor IniConfigReaderAndWriter.Create(const InputFile: FileConfig);
var
  IniConfFile: TStrings;
  FileName: string;
begin
  if not FileExists(InputFile.FullFileName) then
    raise Exception.CreateFmt('IniConfigReader. Directory %s - Prefix %s - FileName %s',
      [ InputFile.Directory, InputFile.Prefix, InputFile.FileName ]
    );

  IniConfFile := TStringList.Create();
  try
    IniConfFile.LoadFromFile( InputFile.FullFileName );

    Create( IniConfFile );

  finally
    IniConfFile.Clear();
  end;
end;

destructor IniConfigReaderAndWriter.Destroy;
begin
  FIniConfig.Free();
  inherited;
end;

function IniConfigReaderAndWriter.GetStrings: string;
var
  S: TStrings;
begin
  S := TStringList.Create();
  try
    FIniConfig.GetStrings(S);

    Result := S.Text;

  finally
    S.Free();
  end;
end;

function IniConfigReaderAndWriter.ReadBool(const Section, Ident: string; DefaultValue: Boolean): Boolean;
const
  TRUE_VALUES: array[0..2] of string = ('1', 'T', 'S'); //1 ou 0; True e False; Sim e Nao
var
  S: string;
begin
  if not FIniConfig.ValueExists(Section, Ident) then
    Result := DefaultValue
  else
  begin
    S := Copy(Trim(FIniConfig.ReadString( Section, Ident, '')), 1, 1);
    Result := MatchText(S, TRUE_VALUES);
  end;
end;

function IniConfigReaderAndWriter.ReadInteger(const Section, Ident: string;
  DefaultValue: Integer): Integer;
begin
  if not FIniConfig.ValueExists(Section, Ident) then
    Result := DefaultValue
  else
    Result := FIniConfig.ReadInteger( Section, Ident, DefaultValue );
end;

function IniConfigReaderAndWriter.ReadString(const Section, Ident: string;
  DefaultValue: string): string;
begin
  if not FIniConfig.ValueExists(Section, Ident) then
    Result := DefaultValue
  else
    Result := FIniConfig.ReadString( Section, Ident, DefaultValue );
end;

procedure IniConfigReaderAndWriter.WriteInteger(const Section, Ident: string; Value: Integer);
begin
  FIniConfig.WriteInteger( Section, Ident, Value );
end;

procedure IniConfigReaderAndWriter.WriteString(const Section, Ident: string; Value: string);
begin
  FIniConfig.WriteString( Section, Ident, Value );
end;

end.
