unit StringServiceUnit;

interface

uses
  SysUtils, Classes, TipoComunsUnit;

type
  StringService = class
  private
    class function IndexOfAny(const Value: string; const AnyOf: array of Char): Integer; overload; static;
    class function IndexOfAny(const Value: string; const AnyOf: array of Char; StartIndex: Integer): Integer; overload; static;
    class function IndexOfAny(const Value: string; const AnyOf: array of Char; StartIndex: Integer; Count: Integer): Integer; overload; static;
    class function Substring(const Value: string; StartIndex: Integer; Length: Integer): string; static;
  public
    class function Join(const Separator: string; const Values: TStrings): string; overload; static;
    class function Join(const Separator: string; const Values: array of string): string; overload; static;
    class function Split(const Separator: array of Char; const Value: string): TArrayString; static;
    class function Default(const Value, Default: string; TrimValue: Boolean = True): string; static;
    class function OnlyNumber(Value: string): string; static;
    class function TrimChars(const S: string; const Chars: string): string; static;
    class function TrimLeft(const S: string; const Chars: string): string; static;
    class function TrimRight(const S: string; const Chars: string): string; static;
    class function PadLeft(const S: string; TotalWidth: Integer; PaddingChar: Char): string; overload;
    class function StringsToArray(const Source: TStrings): TArrayString;
  end;

implementation

uses
  StrUtils,
  Math;

{ StringService }

class function StringService.IndexOfAny(const Value: string; const AnyOf: array of Char): Integer;
begin
  Result := StringService.IndexOfAny(Value, AnyOf, 0, Length(Value));
end;

class function StringService.IndexOfAny(const Value: string;
  const AnyOf: array of Char; StartIndex: Integer): Integer;
begin
  Result := StringService.IndexOfAny(Value, AnyOf, StartIndex, Length(Value));
end;

class function StringService.IndexOfAny(const Value: string; const AnyOf: array of Char; StartIndex,
  Count: Integer): Integer;
var
  I: Integer;
  C: Char;
  MaxL: Integer;
begin
  if (StartIndex + Count) >= Length(Value) then
    MaxL := Length(Value)
  else
    MaxL := StartIndex + Count;

  I := StartIndex + 1; // para string[n] n é >= 1
  while I <= MaxL do
  begin
    for C in AnyOf do
      if Value[I] = C then
      begin
        Result := I - 1;
        Exit;
      end;
    Inc(I);
  end;
  Result := -1;
end;

class function StringService.Join(const Separator: string; const Values: TStrings): string;
var
  AValues: TArrayString;
  I: Integer;
begin
  SetLength(AValues, Values.Count);

  for I := 0 to Values.Count - 1 do
    AValues[I] := Values[I];

  Result := StringService.Join( Separator, AValues );
end;

class function StringService.Join(const Separator: string;
  const Values: array of string): string;
var
  I: Integer;
begin
  Result := '';

  if Length(Values) > 0 then
  begin
    Result := Values[Low(Values)];

    for I := Low(Values) + 1 to High(Values) do
      Result := Result + Separator + Values[I];
  end;
end;

class function StringService.OnlyNumber(Value: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to (Length(Value)) do
    if Pos(Value[I], '0123456789') > 0 then
      Result := Result + Value[I];
end;

class function StringService.PadLeft(const S: string; TotalWidth: Integer; PaddingChar: Char): string;
begin
  TotalWidth := TotalWidth - Length(S);
  if TotalWidth > 0 then
    Result := System.StringOfChar(PaddingChar, TotalWidth) + S
  else
    Result := S;
end;

class function StringService.Split(const Separator: array of Char;
  const Value: string): TArrayString;
const
  DeltaGrow = 32;
var
  NextSeparator, LastIndex: Integer;
  Total: Integer;
  CurrentLength: Integer;
  SeparatorIndex: Integer;
  S: string;
begin
  if Value = '' then
  begin
    SetLength(Result, 0);
    Exit;
  end;

  Total := 0;
  LastIndex := 0;
  CurrentLength := 0;
  SeparatorIndex := 0;

  NextSeparator := StringService.IndexOfAny(Value, Separator);

  while (NextSeparator >= 0) and (Total < MaxInt) do
  begin
    S := StringService.Substring(Value, LastIndex, NextSeparator - LastIndex);

    Inc(Total);
    if CurrentLength < Total then
    begin
      CurrentLength := Total + DeltaGrow;
      SetLength(Result, CurrentLength);
    end;
    Result[Total - 1] := S;

    LastIndex := NextSeparator + 1;
    NextSeparator := StringService.IndexOfAny(Value, Separator, LastIndex) ;
  end;

  if (LastIndex <= Length(Value)) and (Total < MaxInt) then
  begin
    S := StringService.Substring(Value, LastIndex, Length(Value) - LastIndex);

    Inc(Total);
    SetLength(Result, Total);
    Result[Total - 1] := S;
  end
  else
    SetLength(Result, Total);
end;

class function StringService.StringsToArray(const Source: TStrings): TArrayString;
var
  I: Integer;
  Count: Integer;
begin
  Count := Source.Count;
  SetLength(Result, Count);

  for I := 0 to Count - 1 do
    Result[I] := Source.Strings[I];
end;

class function StringService.Default(const Value, Default: string;
  TrimValue: Boolean): string;
begin
  if TrimValue then
    Result := IfThen(Trim(Value) <> '', Value, Default)
  else
    Result := IfThen(Value <> '', Value, Default);
end;

class function StringService.Substring(const Value: string; StartIndex,
  Length: Integer): string;
begin
  Result := System.Copy(Value, StartIndex + 1, Length);
end;

{$IFDEF UNICODE}
function IsCharInSet(C: Char; const CharSet: string): Boolean;
var
  I: Integer;
begin
  for I := 1 to Length(CharSet) do
    if CharSet[I] = C then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;
{$ENDIF}

class function StringService.TrimLeft(const S: string; const Chars: string): string;
var
  StartPos: Integer;
{$IFNDEF UNICODE}
  I: Integer;
  CharSet: set of Char;
{$ENDIF}
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;

  if Chars = '' then
  begin
    Result := S;
    Exit;
  end;

{$IFDEF UNICODE}
  StartPos := 1;
  while (StartPos <= Length(S)) and IsCharInSet(S[StartPos], Chars) do
    Inc(StartPos);
{$ELSE}
  // ANSI mode (Delphi 2006)
  CharSet := [];
  for I := 1 to Length(Chars) do
    Include(CharSet, Chars[I]);

  StartPos := 1;
  while (StartPos <= Length(S)) and (S[StartPos] in CharSet) do
    Inc(StartPos);
{$ENDIF}

  if StartPos > Length(S) then
    Result := ''
  else
    Result := Copy(S, StartPos, MaxInt);
end;

class function StringService.TrimRight(const S: string; const Chars: string): string;
var
  EndPos: Integer;
{$IFNDEF UNICODE}
  I: Integer;
  CharSet: set of Char;
{$ENDIF}
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;

  if Chars = '' then
  begin
    Result := S;
    Exit;
  end;

{$IFDEF UNICODE}
  EndPos := Length(S);
  while (EndPos >= 1) and IsCharInSet(S[EndPos], Chars) do
    Dec(EndPos);
{$ELSE}
  // ANSI mode
  CharSet := [];
  for I := 1 to Length(Chars) do
    Include(CharSet, Chars[I]);

  EndPos := Length(S);
  while (EndPos >= 1) and (S[EndPos] in CharSet) do
    Dec(EndPos);
{$ENDIF}

  if EndPos < 1 then
    Result := ''
  else
    Result := Copy(S, 1, EndPos);
end;

class function StringService.TrimChars(const S: string; const Chars: string): string;
begin
  Result := TrimRight(TrimLeft(S, Chars), Chars);
end;

end.
