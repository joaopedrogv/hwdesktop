unit hw_utils;

interface

uses
 {$IFDEF VER180}
  SysUtils,
  Variants,
  Math,
  Classes,
  Windows;
 {$ELSE}
 	System.SysUtils,
  System.Variants,
  System.Math,
  System.Classes,
  System.Net.Mime,
  Winapi.Windows;
 {$ENDIF}

const
  _LB = sLineBreak;
  _DLB = sLineBreak + sLineBreak;

type
  ArrayString = array of string;

//conversoes
function VarToInt(Value: Variant; Default: Integer = 0): Integer;
function VarToFloat(Value: Variant; Default: Integer = 0): Double;
function StrNumber(Value: Double; Decimal: Integer = 2): string;
function StrLength(Value: string; ATrim: Boolean = True): Integer;
function StrEquals(Value1, Value2: string; Atrim: Boolean = True): Boolean;
function StrReplace(const Subject: string; const OldPatterns: array of string; NewPatterns: string; ReplaceFlags: TReplaceFlags = [rfReplaceAll, rfIgnoreCase]): string;
function StrReplaceA(const Subject: string; const OldPatterns, NewPatterns: array of string; ReplaceFlags: TReplaceFlags = [rfReplaceAll, rfIgnoreCase]): string;
function StrDefault(const value, default: string; trimvalue: Boolean = True): string;
function StrConcat(values: array of string): string;
function PadL(Value: string; Size: Integer; Pad: string = ' '): string; overload;
function PadL(Value: Integer; Size: Integer; Pad: string = '0'): string; overload;
function PadR(Value: string; Size: Integer; Pad: string = ' '): string; overload;
function PadR(Value: Integer; Size: Integer; Pad: string = '0'): string; overload;
function TrimAndPadL(Value: string; Size: Integer; Pad: string): string;
function MinToDay(Minutes: Integer): Double;
function date_fb(Data: TDateTime; AQuoteStr: Boolean = True): string; overload;
function date_fb(Data: string; AQuoteStr: Boolean = True): string; overload;
function datet_fb(Data: TDateTime; AQuoteStr: Boolean = True): string;
function IfEmpty(Value, Default: string): string;
function ExtractStr(text, startStr, endStr: string): string;
function ExtractTags(text, startStr, endStr: string): TStrings;
function Split(Expression:string; Delimiter:string): TStringList;

//formatacoes
{$IFNDEF VER180}
function GetFileMimeType(const AFileName: string): string;
{$ENDIF}
function getCampoPipe(Alinha: string; AOrdem: integer; ADelimitador: string = '|'): string;
function ProperCase(Name: string): string;
function OnlyNumber(Atext: string): string; overload;
function OnlyNumber(Atext: string; AddChars: string): string; overload;
function OnlyNumberAndLetters(Atext: string; AddChars: string; spaceUnknowChar: Boolean = False; limmit: Integer = 0): string;
function DisplayNumber(digitos: Smallint): string;

//utilitarios
function NewStringList(Atext: string; AlineBreak: string = sLineBreak): TStringList; overload;
function NewStringList(AdupIgnore: Boolean = False; Atext: string = ''; AlineBreak: string = sLineBreak): TStringList; overload;
{$IFNDEF VER180}
function NewStringList(values: TArray<string>): TStringList; overload;
{$ENDIF}
function NewGuid(): string;
function NewArrayString(Atext: string; Aseparator: string = ','; ignoreEmptys: Boolean = True): ArrayString;
function ShowAtencao(AValue: string; AFlags: Longint = 64): Integer; overload;
function ShowAtencao(AValue: string; const Args: array of const; AFlags: Longint = 64): Integer; overload;
function ShowErro(AValue: string; AFlags: Longint = 16): Integer; overload;
function ShowErro(AValue: string; const Args: array of const; AFlags: Longint = 16): Integer; overload;
function ShowConfirmacao(AValue: string; AFlags: Longint = 36): Integer; overload;
function ShowConfirmacao(AValue: string; const Args: array of const; AFlags: Longint = 36): Integer; overload;
function ShowWarning(AValue: string; AFlags: Longint = 48): Integer; overload;
function ShowWarning(AValue: string; const Args: array of const; AFlags: Longint = 48): Integer; overload;
function ReplaceCaracteresEspeciais(Str: string): string;
function StrIn(Value: string; Values: array of string; Atrim: Boolean = True; CaseSensitive: Boolean = False): Boolean;
function StrZero(Num: LongInt; Tam: Integer): string; overload;
function StrZero(Num: string; Tam: Integer): string; overload;
function TrimLeftC(value: string; caracter: Char = ' '): string;
function TrimS(value: string; sTrim: string): string;
function TrimLeftS(value: string; sTrim: string): string;
function TrimRightS(value: string; sTrim: string): string;
function TryCond(var value: Boolean; condition: Boolean): Boolean;
function Codifica(wtexto: string): string;
function Decodifica(wtexto: string): string;
function StrByPosition(str: string; position: Integer; delimiter: string = '|'; startWithDelimiter: Boolean = True): string;
function ValueOrNull(AValue: string; ANullIf: string = '' ): Variant; overload;
function ValueOrNull(AValue: Integer; ANullIf: Integer = 0 ): Variant; overload;

implementation

uses
  Forms,                              
  StrUtils;                                                                                       

const
  CRIPT_INPUT  = ' _ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.@!#$%|?~;Ççº{}[]<>';
  CRIPT_OUTPUT = 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcdefghijklmnopqrstuv';

function VarToInt(Value: Variant; Default: Integer = 0): Integer;
begin
  try
    if (VarIsEmpty(Value)) or (Value = Null) then
      Result := 0
    else
      Result := Value;
  except
    Result := 0;
  end;
end;

function VarToFloat(Value: Variant; Default: Integer = 0): Double;
begin
  try
    if (VarIsEmpty(Value)) or (Value = Null) then
      Result := 0
    else
      Result := Value;
  except
    Result := 0;
  end;
end;

function StrNumber(Value: Double; Decimal: Integer = 2): string;
begin
  Result := Format('%0.' + IntToStr(Decimal) + 'n', [Value]);
end;

function StrLength(Value: string; ATrim: Boolean = True): Integer;
begin
  Result := Length(IfThen(Atrim, Trim(Value), Value));
end;

function StrEquals(Value1, Value2: string; Atrim: Boolean = True): Boolean;
begin
  Result := IfThen(Atrim, Trim(Value1), Value1) = IfThen(Atrim, Trim(Value2), Value2);
end;

function StrReplaceA(const Subject: string; const OldPatterns, NewPatterns: array of string; ReplaceFlags: TReplaceFlags = [rfReplaceAll, rfIgnoreCase]): string;
var
  NewPattern: String;
  I: Integer;
begin
  Result := Subject;
  for I := Low(OldPatterns) to High(OldPatterns) do
  begin
    if I <= High(NewPatterns) then
      NewPattern := NewPatterns[I]
    else
      NewPattern := '';
    Result := StringReplace(Result, OldPatterns[I], NewPattern, ReplaceFlags);
  end;
end;

function StrDefault(const value, default: string;
  trimvalue: Boolean): string;
begin
  if trimvalue then
    Result := IfThen(Trim(value) <> '', value, default)
  else
    Result := IfThen(value <> '', value, default);
end;

function StrConcat(values: array of string): string;
var
  str: string;
begin
  Result := '';
  for str in values do
    Result := Result + str;
end;

function StrReplace(const Subject: string; const OldPatterns: array of string; NewPatterns: string; ReplaceFlags: TReplaceFlags = [rfReplaceAll, rfIgnoreCase]): string;
var
  NewArray: array of string;
  I: Integer;
begin
  SetLength(NewArray, Length(OldPatterns));
  for I := Low(OldPatterns) to High(OldPatterns) do
    NewArray[I] := NewPatterns;
  Result := StrReplaceA(Subject, OldPatterns, NewArray, ReplaceFlags);
end;

function PadL(Value: string; Size: Integer; Pad: string = ' '): string;
begin
  if Length(Pad) = 0 then
    Pad := ' ';

  Result := Copy(Value, 1, Size);
  while Length(Result) < Size do
    Result := Pad + Result;
end;

function PadL(Value: Integer; Size: Integer; Pad: string = '0'): string;
begin
  Result := PadL(IntToStr(Value), Size, Pad);
end;

function PadR(Value: string; Size: Integer; Pad: string = ' '): string;
begin
  if Length(Pad) = 0 then
    Pad := ' ';

  Result := Copy(Value, 1, Size);
  while Length(Result) < Size do
    Result := Result + Pad;
end;

function PadR(Value: Integer; Size: Integer; Pad: string = '0'): string;
begin
  Result := PadR(IntToStr(Value), Size, Pad);
end;

function TrimAndPadL(Value: string; Size: Integer; Pad: string): string;
begin
  Result := Value;
  while (Length(Result) > 0) and (Copy(Result, 1, Length(Pad)) = Pad) do
    Result := Copy(Result, Length(Pad) + 1, Length(Result));

  Result := PadL(Result, Size, Pad);
end;

function MinToDay(Minutes: Integer): Double;
begin
  Result := (Minutes * SecsPerMin) / SecsPerDay;
end;

function date_fb(Data: TDateTime; AQuoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD', Data);
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function date_fb(Data: string; AQuoteStr: Boolean = True): string; overload;
begin
  Result := date_fb(StrToDate(Data), AQuoteStr);
end;

function datet_fb(Data: TDateTime; AQuoteStr: Boolean = True): string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss', Data);
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function IfEmpty(Value, Default: string): string;
begin
  Result := IfThen(Value = '', Default, Value);
end;

function ExtractStr(text, startStr, endStr: string): string;
var
  idx: Integer;
  partStr, str: string;
begin
  partStr := '';
  idx := Pos(startStr, text);
  if (idx > 0) then
  begin
    partStr := Copy(text, idx + Length(startStr) , Length(text));
    idx := Pos(endStr, partStr);

    if idx > 0 then
      partStr := Copy(partStr, 1, idx - 1)
    else
      partStr := '';
  end;
  Result := partStr;
end;

function ExtractTags(text, startStr, endStr: string): TStrings;
var
  idx: Integer;
  tag, str: string;
begin
  // Nao testado ainda
  Result := NewStringList(True);

  tag := '';
  idx := Pos(startStr, text);
  while (idx > 0) do
  begin
    tag := Copy(text, idx + Length(startStr) , Length(text));
    idx := Pos(endStr, tag);

    if idx > 0 then
    begin
      tag := Copy(tag, 1, idx - 1);
      text := Copy(text, idx + 1, Length(text));
      Result.Add(tag);
    end
    else
      text := '';

    idx := Pos(startStr, text);
  end;
end;

function Split(Expression:string; Delimiter:string): TStringList;
var
  Res:        TStringList;
  ResCount:   DWORD;
  dLength:    DWORD;
  StartIndex: DWORD;
  sTemp:      string;
begin
  Res := TStringList.Create;
  Res.Clear;
  dLength := Length(Expression);
  StartIndex := 1;
  ResCount := 0;
  repeat
    sTemp := Copy(Expression, StartIndex, Pos(Delimiter, Copy(Expression, StartIndex, Length(Expression))) - 1);
//    SetLength(Res, Length(Res) + 1);
//    SetLength(Res[ResCount], Length(sTemp));
//    Res[ResCount] := sTemp;
    if trim(sTemp) <> '' then
      Res.Add(sTemp);
    StartIndex := StartIndex + Length(sTemp) + Length(Delimiter);
    ResCount := ResCount + 1;
  until StartIndex > dLength;
  Result := Res;
end;

{$IFNDEF VER180}
function GetFileMimeType(const AFileName: string): string;
var
   LKind: TMimeTypes.TKind;
begin
  // TMimeTypes.Default automatically calls AddDefTypes and AddOSTypes
  if LowerCase(ExtractFileExt(AFileName)) = '.jpeg' then
    Result := 'image/jpeg'
  else if LowerCase(ExtractFileExt(AFileName)) = '.jpg' then
    Result := 'image/jpeg'
  else if LowerCase(ExtractFileExt(AFileName)) = '.png' then
    Result := 'image/png'
  else if LowerCase(ExtractFileExt(AFileName)) = '.bmp' then
    Result := 'image/bmp'
  else if LowerCase(ExtractFileExt(AFileName)) = '.ico' then
    Result := 'image/x-icon'
  else if LowerCase(ExtractFileExt(AFileName)) = '.gif' then
    Result := 'image/gif'
  else if LowerCase(ExtractFileExt(AFileName)) = '.tif' then
    Result := 'image/tiff'
  else if LowerCase(ExtractFileExt(AFileName)) = '.tiff' then
    Result := 'image/tiff'
  else if LowerCase(ExtractFileExt(AFileName)) = '.webp' then
    Result := 'image/webp'
  else if LowerCase(ExtractFileExt(AFileName)) = '.txt' then
    Result := 'text/plain'
  else if LowerCase(ExtractFileExt(AFileName)) = '.css' then
    Result := 'text/css'
  else if LowerCase(ExtractFileExt(AFileName)) = '.csv' then
    Result := 'text/csv'
  else if LowerCase(ExtractFileExt(AFileName)) = '.htm' then
    Result := 'text/html'
  else if LowerCase(ExtractFileExt(AFileName)) = '.html' then
    Result := 'text/html'
  else if LowerCase(ExtractFileExt(AFileName)) = '.aac' then
    Result := 'audio/aac'
  else if LowerCase(ExtractFileExt(AFileName)) = '.oga' then
    Result := 'audio/ogg'
  else if LowerCase(ExtractFileExt(AFileName)) = '.mid' then
    Result := 'audio/midi'
  else if LowerCase(ExtractFileExt(AFileName)) = '.midi' then
    Result := 'audio/midi'
  else if LowerCase(ExtractFileExt(AFileName)) = '.wav' then
    Result := 'audio/x-wav'
  else if LowerCase(ExtractFileExt(AFileName)) = '.weba' then
    Result := 'audio/webm'
  else if LowerCase(ExtractFileExt(AFileName)) = '.3gp' then
    Result := 'video/3gpp'
  else if LowerCase(ExtractFileExt(AFileName)) = '.3g2' then
    Result := 'video/3gpp2'
  else if LowerCase(ExtractFileExt(AFileName)) = '.avi' then
    Result := 'video/x-msvideo'
  else if LowerCase(ExtractFileExt(AFileName)) = '.mpeg' then
    Result := 'video/mpeg'
  else if LowerCase(ExtractFileExt(AFileName)) = '.mp4' then
    Result := 'video/mp4'
  else if LowerCase(ExtractFileExt(AFileName)) = '.ogv' then
    Result := 'video/ogg'
  else if LowerCase(ExtractFileExt(AFileName)) = '.webm' then
    Result := 'video/webm'
  else if LowerCase(ExtractFileExt(AFileName)) = '.doc' then
    Result := 'application/msword'
  else if LowerCase(ExtractFileExt(AFileName)) = '.ppt' then
    Result := 'application/vnd.ms-powerpoint'
  else if LowerCase(ExtractFileExt(AFileName)) = '.xls' then
    Result := 'application/vnd.ms-excel'
  else if LowerCase(ExtractFileExt(AFileName)) = '.xlsx' then
    Result := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  else if LowerCase(ExtractFileExt(AFileName)) = '.pdf' then
    Result := 'application/pdf'
  else if LowerCase(ExtractFileExt(AFileName)) = '.rar' then
    Result := 'application/x-rar-compressed'
  else if LowerCase(ExtractFileExt(AFileName)) = '.tar' then
    Result := 'application/x-tar'
  else if LowerCase(ExtractFileExt(AFileName)) = '.zip' then
    Result := 'application/zip'
  else if LowerCase(ExtractFileExt(AFileName)) = '.7z' then
    Result := 'application/x-7z-compressed'
  else if LowerCase(ExtractFileExt(AFileName)) = '.rtf' then
    Result := 'application/rtf'
  else if LowerCase(ExtractFileExt(AFileName)) =  '.odp' then
    Result := 'application/vnd.oasis.opendocument.presentation'
  else if LowerCase(ExtractFileExt(AFileName)) = '.ods' then
    Result := 'application/application/vnd.oasis.opendocument.spreadsheet'
  else if LowerCase(ExtractFileExt(AFileName)) = '.odt' then
    Result := 'application/application/vnd.oasis.opendocument.text'
  else if LowerCase(ExtractFileExt(AFileName)) = '.bin' then
    Result := 'application/octet-stream'
  else if LowerCase(ExtractFileExt(AFileName)) = '.js' then
    Result := 'application/javascript'
  else if LowerCase(ExtractFileExt(AFileName)) = '.json' then
    Result := 'application/json'
  else if LowerCase(ExtractFileExt(AFileName)) = '.ts' then
    Result := 'application/typescript'
  else if LowerCase(ExtractFileExt(AFileName)) = '.vsd' then
    Result := 'application/vnd.visio'
  else if LowerCase(ExtractFileExt(AFileName)) = '.xhtml' then
    Result := 'application/xhtml+xml'
  else if LowerCase(ExtractFileExt(AFileName)) = '.xml' then
    Result := 'application/xml'
  else if not TMimeTypes.Default.GetFileInfo(AFileName, Result, LKind) then
    Result := 'application/octet-stream'; // Default if unknown
end;
{$ENDIF}

function getCampoPipe(Alinha: string; AOrdem: integer; ADelimitador: string = '|'): string;
var
  vTemp: string;
  vInc: Smallint;
begin
  // recebe uma string como parametro separados por um delimitador,
  // toda vez que encontrar um delimitador quer dizer que vai ser 1 item na string
  // Ex: "1|nome|endereco|", onde a string possui 3 itens
  // sempre finalizar com o delimitador
  // veja tambem a funcao getValue
  vTemp := Alinha;
  vInc := 0;
  while pos(ADelimitador, vTemp) > 0 do
  begin
    inc(vInc);
    if AOrdem = vInc then
    begin
      vTemp := Copy(vTemp, 1, pos(ADelimitador, vTemp) - 1);
      Result := Trim(vTemp);
      exit;
    end;
    vTemp := Copy(vTemp, pos(ADelimitador, vTemp) + 1, length(vTemp));
  end;
  Result := '';
end;

function ProperCase(Name: string): string;
const
  wordsLower: array[1..8] of string = (' a ', ' e ', ' i ', ' o ', ' u ', ' da ', ' de ', ' do ');
  wordsUpper: array[1..3] of string = (' ME', ' EPP', ' LTDA');
var
  I: Integer;
  Upper: Boolean;
begin
  Result := '';

  Upper := True;

  for I := 1 to Length(Name)  do
  begin
    if Upper then
      Result := Result + UpperCase(Name[I])
    else
      Result := Result + LowerCase(Name[I]);

    Upper := (Name[I] = ' ');
  end;
  for I := Low(wordsLower) to High(wordsLower) do
    Result := ReplaceText(Result, wordsLower[I], wordsLower[I]);

  for I := Low(wordsUpper) to High(wordsUpper) do
    Result := ReplaceText(Result, wordsUpper[I], wordsUpper[I]);
end;

function OnlyNumber(Atext: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to (Length(Atext)) do
    if Pos(Atext[I], '0123456789') > 0 then
      Result := Result + Atext[I];
end;

function OnlyNumber(Atext: string; AddChars: string): string; overload;
const
  CHARS = ['0'..'9'];
var
  I: Integer;
begin
  Result := '';
  for i := 1 to Length(Atext) do
    if (Atext[i] in CHARS) or (ContainsStr(AddChars, Atext[i])) then
      Result := Result + Atext[I];
end;

function OnlyNumberAndLetters(Atext: string; AddChars: string;
  spaceUnknowChar: Boolean; limmit: Integer): string;
const
  CHARS = ['0'..'9', 'a'..'z', 'A'..'Z'];
var
  I: Integer;
begin
  Result := '';
  if (limmit <= 0) or (limmit > Length(Atext)) then
    limmit := Length(Atext);

  for i := 1 to limmit do
    if (Atext[i] in CHARS) or (ContainsStr(AddChars, Atext[i])) then
      Result := Result + Atext[I]
    else if spaceUnknowChar then
      Result := Result + ' ';
end;

function DisplayNumber(digitos: Smallint): string;
begin
  Result := '#,###,##0.' + PadL('', Min(Abs(digitos), 37), '0');
end;

function NewStringList(Atext: string; AlineBreak: string = sLineBreak): TStringList; overload;
begin
  Result := NewStringList(False, Atext, AlineBreak);
end;

function NewStringList(AdupIgnore: Boolean = False; Atext: string = ''; AlineBreak: string = sLineBreak): TStringList;
begin
  Result := TStringList.Create;
  Result.LineBreak := AlineBreak;
  if AdupIgnore then
  begin
    Result.Sorted := True;
    Result.Duplicates := dupIgnore;
  end;
  Result.Text := Atext;
end;

{$IFNDEF VER180}
function NewStringList(values: TArray<string>): TStringList; overload;
begin
  Result := NewStringList();
  for var value in values do
    Result.Add(value);
end;
{$ENDIF}

function NewGuid(): string;
var
  guid: TGUID;
begin
  if CreateGUID(guid) <> S_OK then
    RaiseLastOSError;

  Result := Copy(GUIDToString(guid), 2, 36);
end;

function NewArrayString(Atext: string; Aseparator: string;
  ignoreEmptys: Boolean): ArrayString;
var
  item, str: string;
  posicao: Integer;
begin
  SetLength(Result, 0);
  str := Atext;
  while str <> '' do
  begin
    posicao := Pos(Aseparator, str);
    if posicao > 0 then
    begin
      item := Copy(str, 1, posicao - 1);
      //      str := Copy(str, posicao + 1, Length(str));
      System.Delete(str, 1, posicao + Length(Aseparator) - 1);//, Length(str));
    end
    else
    begin
      item := str;
      str := '';
    end;
    if (item <> '') or (not ignoreEmptys) then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := item;
    end;
  end;
end;

function ShowAtencao(AValue: string; AFlags: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(AValue), 'Atenção', AFlags);
end;

function ShowAtencao(AValue: string; const Args: array of const;
  AFlags: Integer): Integer;
begin
  Result := ShowAtencao(Format(AValue, Args), AFlags);
end;

function ShowErro(AValue: string; AFlags: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(AValue), 'Erro', AFlags);
end;

function ShowErro(AValue: string; const Args: array of const;
  AFlags: Integer): Integer;
begin
  Result := ShowErro(Format(AValue, Args), AFlags);
end;

function ShowConfirmacao(AValue: string; AFlags: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(AValue), 'Confirmação', AFlags);
end;

function ShowConfirmacao(AValue: string; const Args: array of const;
  AFlags: Integer): Integer;
begin
  Result := ShowConfirmacao(Format(AValue, Args), AFlags);
end;

function ShowWarning(AValue: string; AFlags: Longint = 48): Integer; overload;
begin
  Result := Application.MessageBox(PChar(AValue), 'Atenção', AFlags);
end;

function ShowWarning(AValue: string; const Args: array of const; AFlags: Longint = 48): Integer; overload;
begin
  Result := ShowWarning(Format(AValue, Args), AFlags);
end;

function StrZero(Num, Tam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(IntToStr(Num));
  for I := 1 to Tam - Length(V1) do
    V1 := '0' + V1;
  Result := V1;
end;

function StrZero(Num: string; Tam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(Num);
  for I := 1 to Tam - Length(V1) do
    V1 := '0' + V1;
  Result := V1;
end;

function TrimLeftC(value: string; caracter: Char): string;
begin
  Result := value;
  while StartsStr(caracter, Result) and (Length(Result) > 0) do
    System.Delete(Result, 1, 1);
end;

function TrimS(value: string; sTrim: string): string;
begin
  Result := TrimRightS(TrimLeftS(value, sTrim), sTrim);
end;

function TrimLeftS(value: string; sTrim: string): string;
begin
  Result := value;
  while StartsStr(sTrim, Result) and (Length(Result) > 0) do
    System.Delete(Result, 1, Length(sTrim));
end;

function TrimRightS(value: string; sTrim: string): string;
begin
  Result := value;
  while EndsStr(sTrim, Result) and (Length(Result) > 0) do
    System.Delete(Result, Length(Result) - Length(sTrim) + 1, Length(sTrim));
end;

function TryCond(var value: Boolean; condition: Boolean): Boolean;
begin
  try
    value := condition;
  finally
    Result := value;
  end;
end;

function Codifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));

  wnormal := CRIPT_INPUT;  // ' _ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.@!';
  wcripto := CRIPT_OUTPUT; // 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcdef';

  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  codifica := wresultado;
end;

function Decodifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));

  wnormal := CRIPT_OUTPUT;// 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcdef';
  wcripto := CRIPT_INPUT; // ' _ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.@!';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  Result := wresultado;
end;

function StrByPosition(str: string; position: Integer; delimiter: string; startWithDelimiter: Boolean): string;
var
  tempStr: string;
  incr: Smallint;
begin
  // recebe uma string como parametro separados por um delimitador,
  // pode ou nao iniciar com um delimitador, por padrao é True
  // toda vez que encontrar um delimitador quer dizer que vai ser 1 item na string
  // Ex: "|1|nome|endereco|", onde a string possui 3 itens

  if startWithDelimiter then
    str := Trim(Copy(str, 2, Length(str)));

  tempStr := str;
  incr := 0;
  while pos(delimiter, tempStr) > 0 do
  begin
    inc(incr);
    if position = incr then
    begin
      tempStr := Copy(tempStr, 1, pos(delimiter, tempStr) - 1);
      Result := Trim(tempStr);
      exit;
    end;
    tempStr := Copy(tempStr, pos(delimiter, tempStr) + 1, length(tempStr));
  end;
  Result := '';

end;

function ValueOrNull(AValue: string; ANullIf: string): Variant; overload;
begin
  if AValue = ANullIf then
    Result := Null
  else
    Result := AValue;
end;

function ValueOrNull(AValue: Integer; ANullIf: Integer): Variant; overload;
begin
  if AValue = ANullIf then
    Result := Null
  else
    Result := AValue;
end;

function ReplaceCaracteresEspeciais(Str: string): string;
var
   I, ASize: Integer;
   AChar, Resultado: Char;
begin
   Result := '';
   ASize := Length(Str);
   I := 1;
   while (I <= ASize) do
   begin
      AChar := Str[I];
      case AChar of
         'á', 'â', 'ã', 'à', 'ä', 'å',
         'Á', 'Â', 'Ã', 'À', 'Ä', 'Å': Resultado := 'A';
         'é', 'ê', 'è', 'ë',
         'É', 'Ê', 'È', 'Ë': Resultado := 'E';
         'í', 'î', 'ì', 'ï',
         'Í', 'Î', 'Ì', 'Ï': Resultado := 'I';
         'ó', 'ô', 'õ', 'ò', 'ö',
         'Ó', 'Ô', 'Õ', 'Ò', 'Ö': Resultado := 'O';
         'ú', 'û', 'ù', 'ü',
         'Ú', 'Û', 'Ù', 'Ü': Resultado := 'U';
         'ç', 'Ç': Resultado := 'C';
         'ñ', 'Ñ': Resultado := 'N';
         'ý', 'ÿ', 'Ý', 'Y': Resultado := 'Y';
         '<', '>': Resultado := '.';
         '°', 'º': Resultado := 'o';
         'ª': Resultado := 'a';
         '§', '¬', '¢', '£': Resultado := ' ';
         '¹': Resultado := '1';
         '²': Resultado := '2';
         '³': Resultado := '3';
      else
         Resultado := AChar;
      end;
      I := I + 1;
      Result := Result + Resultado;
   end;
end;

function StrIn(Value: string; Values: array of string; Atrim: Boolean = True; CaseSensitive: Boolean = False): Boolean;
begin
  Value := IfThen(Atrim, Trim(Value), Value);
  if CaseSensitive then
    Result := IndexStr(Value, Values) >= 0
  else
    Result := IndexText(Value, Values) >= 0;
end;

end.
