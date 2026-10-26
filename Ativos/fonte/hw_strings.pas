unit hw_strings;

interface

uses
  Classes, IniFiles;

type
  TStringIni = class(TStringList)
  strict private
    menIniFile: TMemIniFile;
  private
    function GetMenIniFile: TMemIniFile;
  public
    constructor Create();
    destructor Destroy; override;

    function WriteString(Section, Ident, Value: string): TStringIni;
    function WriteInteger(Section, Ident: string; Value: Integer): TStringIni;
    function WriteBool(Section, Ident: string; Value: Boolean): TStringIni;
    function ReadString(Section, Ident: string; Default: string = ''): string;
    function ReadInteger(Section, Ident: string; Default: Integer = 0): Integer;
    function ReadBool(Section, Ident: string; Default: Boolean = False): Boolean;

    class function New(text: string): TStringIni;

    property ini: TMemIniFile read GetMenIniFile;
  end;

  TStringFmt = class(TStringList)
  public
    function AddF(const S: string): TStringFmt; overload;
    function AddF(const formatS: string; const args: array of const): TStringFmt; overload;
    function AddValue(const S, Value: string): TStringFmt; overload;

    class function New(text: string): TStringFmt;
  end;

  ArrayString = array of string;
  TStringListHw = class(TStringList)
  public
    function Except_(excepts: TStrings): TStringListHw;
    function ToArray(ignoreEmptys: Boolean = True): ArrayString;
  end;

  StringsUtils = class
  public
    class function New(Atext: string; AlineBreak: string = sLineBreak): TStringListHw; overload;
    class function New(AdupIgnore: Boolean = False; Atext: string = ''; AlineBreak: string = sLineBreak): TStringListHw; overload;
    class function Except_(value, excepts: TStrings): TStringListHw;
  end;

implementation

uses
  SysUtils;

{ TStringIni }

constructor TStringIni.Create;
begin
  menIniFile := TMemIniFile.Create('');
  Self.LineBreak := sLineBreak;
end;

destructor TStringIni.Destroy;
begin
  if Assigned(menIniFile) then
  begin
    Self.Clear;
    menIniFile.GetStrings(Self);
    FreeAndNil(menIniFile);
  end;
  inherited;
end;

function TStringIni.GetMenIniFile: TMemIniFile;
begin
  menIniFile.SetStrings(Self);
  Result := menIniFile;
end;

class function TStringIni.New(text: string): TStringIni;
begin
  Result := TStringIni.Create;
  Result.Text := text;
end;

function TStringIni.ReadBool(Section, Ident: string;
  Default: Boolean): Boolean;
begin
  Result := Default;

  menIniFile.SetStrings(Self);
  Result := menIniFile.ReadBool(Section, Ident, Default);
end;

function TStringIni.ReadInteger(Section, Ident: string;
  Default: Integer): Integer;
begin
  Result := Default;

  menIniFile.SetStrings(Self);
  Result := menIniFile.ReadInteger(Section, Ident, Default);
end;

function TStringIni.ReadString(Section, Ident, Default: string): string;
begin
  Result := Default;

  menIniFile.SetStrings(Self);
  Result := menIniFile.ReadString(Section, Ident, Default);
end;

function TStringIni.WriteBool(Section, Ident: string;
  Value: Boolean): TStringIni;
begin
  Result := Self;

  menIniFile.SetStrings(Self);
  menIniFile.WriteBool(Section, Ident, Value);
  Self.Clear;
  menIniFile.GetStrings(Self);
end;

function TStringIni.WriteInteger(Section, Ident: string;
  Value: Integer): TStringIni;
begin
  Result := Self;

  menIniFile.SetStrings(Self);
  menIniFile.WriteInteger(Section, Ident, Value);
  Self.Clear;
  menIniFile.GetStrings(Self);
end;

function TStringIni.WriteString(Section, Ident,
  Value: string): TStringIni;
begin
  Result := Self;

  menIniFile.SetStrings(Self);
  menIniFile.WriteString(Section, Ident, Value);

  Self.Clear;
  menIniFile.GetStrings(Self);
end;

{ TStringFmt }

function TStringFmt.AddF(const S: string): TStringFmt;
begin
  Self.Add(S);
  Result := Self;
end;

function TStringFmt.AddF(const formatS: string;
  const args: array of const): TStringFmt;
begin
  Result := AddF(Format(formatS, args));
end;

function TStringFmt.AddValue(const S, Value: string): TStringFmt;
begin
  Self.Values[S] := Value;
  Result := Self;
end;

class function TStringFmt.New(text: string): TStringFmt;
begin
  Result := TStringFmt.Create;
  Result.Text := text;
end;

{ TStringListHw }

function TStringListHw.Except_(excepts: TStrings): TStringListHw;
var
  I, idx: Integer;
begin
  Result := Self;

  for I := 0 to excepts.Count - 1 do
  begin
    idx := Self.IndexOf(excepts[I]);
    if idx >= 0 then
      Self.Delete(idx);
  end;
end;

function TStringListHw.ToArray(ignoreEmptys: Boolean): ArrayString;
var
  str: string;
  posicao: Integer;
  I: Integer;
begin
  SetLength(Result, 0);

  for I := 0 to Self.Count - 1 do
  begin
    str := Trim(Self[I]);
    if (str <> '') or (not ignoreEmptys) then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := str;
    end;
  end;
end;

{ StringsUtils }

class function StringsUtils.New(Atext, AlineBreak: string): TStringListHw;
begin
  Result := StringsUtils.New(False, Atext, AlineBreak);
end;

class function StringsUtils.Except_(value, excepts: TStrings): TStringListHw;
var
  bDupIgnore: Boolean;
  I: Integer;
  idx: Integer;
begin
  bDupIgnore := ((value is TStringListHw) or (value is TStringList))
                 and ((dupIgnore = (value as TStringList).Duplicates) and ((value as TStringList).Sorted));

  Result := StringsUtils.New(bDupIgnore, value.Text, value.LineBreak);

  for I := 0 to excepts.Count - 1 do
  begin
    idx := Result.IndexOf(excepts[I]);
    if idx >= 0 then
      Result.Delete(idx);
  end;
end;

class function StringsUtils.New(AdupIgnore: Boolean; Atext,
  AlineBreak: string): TStringListHw;
begin
  Result := TStringListHw.Create;
  Result.LineBreak := AlineBreak;
  if AdupIgnore then
  begin
    Result.Sorted := True;
    Result.Duplicates := dupIgnore;
  end;
  Result.Text := Atext;
end;

end.
