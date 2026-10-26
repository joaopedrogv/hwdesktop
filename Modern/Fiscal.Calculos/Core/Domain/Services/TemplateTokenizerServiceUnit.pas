unit TemplateTokenizerServiceUnit;

interface

uses
  SysUtils, TextTokenModelUnit;

type
  TemplateTokenizerService = class
  public
    class function Tokenize(const Template: string): TextTokensModel;
  end;

implementation

uses
  StrUtils;

{ TemplateTokenizerService }

class function TemplateTokenizerService.Tokenize(const Template: string): TextTokensModel;
var
  LastPos, Len, OpenPos, ClosePos: Integer;
  TokenText: string;
  Token: TextTokenModel;
begin
  SetLength(Result, 0);
  LastPos := 1;
  Len := Length(Template);

  while LastPos <= Len do
  begin
    OpenPos := PosEx('[', Template, LastPos);

    if OpenPos < 1 then
    begin
      TokenText := Copy(Template, LastPos, MaxInt);
      Token := TextTokenModel.Create(TokenText, '');
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Token;
      Break;
    end;

    ClosePos := PosEx(']', Template, OpenPos + 1);

    if ClosePos < 1 then
    begin
      TokenText := Copy(Template, LastPos, MaxInt);
      Token := TextTokenModel.Create(TokenText, '');
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Token;
      Break;
    end;

    if OpenPos > LastPos then
    begin
      TokenText := Copy(Template, LastPos, OpenPos - LastPos);
      Token := TextTokenModel.Create(TokenText, '');
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Token;
    end;

    TokenText := Copy(Template, OpenPos + 1, ClosePos - OpenPos - 1);
    Token := TextTokenModel.Create('', TokenText);
    SetLength(Result, Length(Result) + 1);
    Result[High(Result)] := Token;

    LastPos := ClosePos + 1;
  end;
end;

end.
