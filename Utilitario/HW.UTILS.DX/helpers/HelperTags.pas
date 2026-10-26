unit HelperTags;

interface

type
  TagsHelper = class
  public
    class function Extract(text, startStr, endStr: string; caseSensitive: Boolean = True; keepSearchOn: Boolean = False): string;
    class function ExtractTags(text, startStr, endStr: string; caseSensitive: Boolean = True; keepTagsOn: Boolean = False): TArray<string>;
  end;

implementation

uses
  System.SysUtils;

{ TagsHelper }

class function TagsHelper.Extract(text, startStr, endStr: string; caseSensitive, keepSearchOn: Boolean): string;
var
  idxStart, idxEnd: Integer;
  partStr, str: string;
begin
  partStr := '';
  if caseSensitive then
    idxStart := Pos(startStr, text)
  else
    idxStart := Pos(startStr.ToLowerInvariant(), text.ToLowerInvariant());

  if (idxStart > 0) then
  begin
    partStr := Copy(text, idxStart + Length(startStr) , Length(text));
    if caseSensitive then
      idxEnd := Pos(endStr, partStr)
    else
      idxEnd := Pos(endStr.ToLowerInvariant(), partStr.ToLowerInvariant());

    if idxEnd > 0 then
      partStr := Copy(partStr, 1, idxEnd - 1)
    else
      partStr := '';
  end;
  Result := partStr;

  if keepSearchOn and not Result.IsEmpty then
  begin
    startStr := Copy(text, idxStart, startStr.Length);
    endStr := Copy(text, idxStart + startStr.Length + idxEnd - 1, endStr.Length);
    Result := startStr + Result + endStr;
  end;
end;

class function TagsHelper.ExtractTags(text, startStr, endStr: string; caseSensitive,
  keepTagsOn: Boolean): TArray<string>;
var
  sTag: string;
begin
  Result := [];

  repeat
    sTag := Extract(text, startStr, endStr, caseSensitive, keepTagsOn);

    if not sTag.IsEmpty then
    begin
      Result := Result + [ sTag ];

      if caseSensitive and keepTagsOn then
        text := text.Replace(sTag, '', [])
      else if caseSensitive then
        text := text.Replace(startStr + sTag + endStr, '', [])
      else if keepTagsOn then
        text := text.Replace(sTag, '', [rfIgnoreCase])
      else
        text := text.Replace(startStr + sTag + endStr, '', [rfIgnoreCase]);
    end;

  until (sTag.IsEmpty);
end;

end.
