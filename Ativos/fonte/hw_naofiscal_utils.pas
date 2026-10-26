unit hw_naofiscal_utils;

interface

uses
  SysUtils,
  Variants,
  Classes;
const
  partnerTagBegin = '[/';
  partnerTagEnd   = ']';

procedure Replace(var Str: string; OldPattern, NewPattern: string);
function ReplaceFor(Value: string; Tamanho: Integer; Separador: string = '|'; withChar: string = ' '): string; overload;
function ReplaceFor(Value: TStrings; ColunasCondensado, Colunas: Integer; Separador: string = '|'; withChar: string = ' '): string; overload;
function ReplaceForSpace(Value: string; Tamanho: Integer; Separador: string = '|'): string; overload;
function ReplaceForSpace(Value: TStrings; ColunasCondensado, Colunas: Integer; Separador: string = '|'): string; overload;
function CountTags(Value: string): Integer;
function GetEntities(report: TStrings): TStrings;
function GetEntitiesFields(report: TStrings; entity: string): TStrings;
function GetEntitiesFieldsSql(report: TStrings; entity: string): string;

implementation

uses
  StrUtils,
  Math;

function ReplaceFor(Value: string; Tamanho: Integer;
  Separador: string = '|'; withChar: string = ' '): string;
var
  IntegerTmp: Integer;
  NewValue: string;
  K, CountAddChar, CountValue, CountNewValue, CountFinalValue: Integer;
begin
  CountFinalValue := Tamanho + CountTags(Value);
  if Length(Value) >= (CountFinalValue) then
  begin
    Result := StringReplace(Value, Separador, withChar,[rfReplaceAll]);
    Exit;
  end;
  if Pos(Separador, Value) = 0 then
  begin
    Result := Value;
    Exit;
  end;
  CountAddChar  := 0;
  CountValue    := Length(Value);
  CountNewValue := CountValue + CountAddChar;

  while CountNewValue < CountFinalValue do
  begin
    NewValue      := '';
    for K := 1 to CountValue do
    begin
      CountNewValue := CountValue + CountAddChar;

      if (CountNewValue < CountFinalValue) then
      begin
        if Value[K] = Separador then
        begin
          NewValue := NewValue + withChar + Separador;
          CountAddChar := CountAddChar + 1;
        end
        else
          NewValue := NewValue + Value[K];
      end
      else
        NewValue := NewValue + Value[K];
    end;
    Value         := NewValue;
    CountAddChar  := 0;
    CountValue    := Length(Value);
    CountNewValue := CountValue + CountAddChar;

  end;
  Result := StringReplace(NewValue, Separador, withChar, [rfReplaceAll]);
end;

function ReplaceFor(Value: TStrings; ColunasCondensado, Colunas: Integer;
  Separador: string = '|'; withChar: string = ' '): string; overload;
var
  condensado: Boolean;
  I: Integer;
begin
  condensado := False;
  for I := 0 to Value.Count - 1 do
  begin
    if ContainsText(Value[I], '<c>') then
      condensado := True;

    if ContainsText(Value[I], Separador) then
      Value[I] := ReplaceFor(Value[I], IfThen(condensado, ColunasCondensado, Colunas), Separador, withChar);

  if ContainsText(Value[I], '</c>') then
    condensado := False;
  end;
  Result := Value.Text;
end;

procedure Replace(var Str: string; OldPattern, NewPattern: string);
begin
  Str := StringReplace(Str, OldPattern, NewPattern, [rfReplaceAll, rfIgnoreCase]);
end;

function ReplaceForSpace(Value: string; Tamanho: Integer; Separador: string = '|'): string;
begin
  Result := ReplaceFor(Value, Tamanho, Separador);
end;

function ReplaceForSpace(Value: TStrings; ColunasCondensado, Colunas: Integer; Separador: string = '|'): string; overload;
begin
  Result := ReplaceFor(Value, ColunasCondensado, Colunas, Separador);
end;

function CountTags(Value: string): Integer;
var
  K: Integer;
  ValueNoTag: string;
  TagAberta: Boolean;
begin
  ValueNoTag := '';
  TagAberta := False;
  for K := 1 to Length(Value) do
  begin
    if (not TagAberta) and (Value[K] = '<') then
      TagAberta := True
    else if (TagAberta) and (Value[K] = '>') then
      TagAberta := False
    else if not TagAberta  then
      ValueNoTag := ValueNoTag + Value[K];
  end;
  Result := Length(Value) - Length(ValueNoTag);
end;


function GetEntities(report: TStrings): TStrings;
var
  I: Integer;
  insideTag: Boolean;
  entity, str: string;
begin
  Result    := TStringList.Create;
  entity    := '';
  insideTag := False;
  str       := report.Text;

  while ContainsText(str, partnerTagBegin) do
  begin
    str := Copy(str, Pos(partnerTagBegin, str) + Length(partnerTagBegin), Length(str));

    if (Pos(partnerTagEnd, str) = 0) then
      raise Exception.Create('Tag de inicio sem tag de fim no arquivo de configuração. Por favor corrija');

    if (Pos(partnerTagBegin, str) > 1) and
       (Pos(partnerTagBegin, str) < Pos(partnerTagEnd, str)) then
      raise Exception.Create('Tags mal formatadas no arquivo de configuração. Por favor verifique onde inicia e terminam as tags');

    entity := Copy(str, 1, Pos(partnerTagEnd, str) - 1);

    if (Pos('.', entity) > 0) then
      entity := UpperCase(Trim(Copy(entity, 1, Pos('.', entity) - 1)));

    str := Copy(str, Pos(partnerTagEnd, str) + Length(partnerTagEnd), Length(str));

    if (Result.IndexOf(entity) = -1) then
      Result.Add(Trim(entity));
  end;
end;

function GetEntitiesFields(report: TStrings; entity: string): TStrings;
var
  I: Integer;
  insideTag: Boolean;
  strEntity, field, str: string;
begin
  Result    := TStringList.Create;
  strEntity := '';
  insideTag := False;
  str       := report.Text;
  entity    := UpperCase(Trim(entity));

  while ContainsText(str, partnerTagBegin) do
  begin
    str := Copy(str, Pos(partnerTagBegin, str) + Length(partnerTagBegin), Length(str));

    if (Pos(partnerTagEnd, str) = 0) then
      raise Exception.Create('Tag de inicio sem tag de fim no arquivo de configuração. Por favor corrija');

    if (Pos(partnerTagBegin, str) > 1) and
       (Pos(partnerTagBegin, str) < Pos(partnerTagEnd, str)) then
      raise Exception.Create('Tags mal formatadas no arquivo de configuração. Por favor verifique onde inicia e terminam as tags');

    strEntity := Copy(str, 1, Pos(partnerTagEnd, str) - 1);

    str := Copy(str, Pos(partnerTagEnd, str) + Length(partnerTagEnd), Length(str));

    if Pos('.', strEntity) > 0 then
    begin
      field     := UpperCase(Trim(Copy(strEntity, Pos('.', strEntity) + 1, Length(strEntity))));
      strEntity := UpperCase(Trim(Copy(strEntity, 1, Pos('.', strEntity) - 1)));

      if (strEntity = entity) and (Result.IndexOf(field) = -1) then
        Result.Add(field);
    end;
  end;
end;  

function GetEntitiesFieldsSql(report: TStrings; entity: string): string;
var
  fields: TStrings;
  I: Integer;
begin
  Result := ''; 
  fields := GetEntitiesFields(report, entity);
  try
    for I := 0 to fields.Count - 1 do
      if Trim(fields[I]) <> '' then
        Result := Result + IfThen(Result <> '', ',') + fields[I];
  finally
    fields.Free;
  end;
end;

end.
