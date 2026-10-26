unit TokenizerServiceUnit;

interface

uses
  SysUtils, SimpleStringDictionaryUnit;

type
  TokenizerService = class
  public
    class function SubstituirPlaceholders(const Template: string;
      const Values: SimpleStringDictionary): string;
  end;

implementation

uses
  Classes,
  TemplateTokenizerServiceUnit,
  TextTokenModelUnit;

{ TokenizerService }

class function TokenizerService.SubstituirPlaceholders(const Template: string;
  const Values: SimpleStringDictionary): string;
var
  Tokens: TextTokensModel;
  I: Integer;
  Token: TextTokenModel;
  ValorSubstituto: string;
begin
  Result := '';

  if Pos('[', Template) = 0 then
  begin
    Result := Template;
    Exit;
  end;

  Tokens := TemplateTokenizerService.Tokenize(Template);

  for I := 0 to High(Tokens) do
  begin
    Token := Tokens[I];
    if Token.Key = '' then
      Result := Result + Token.Text
    else
    begin
      ValorSubstituto := Values.GetValue(Token.Key);
      Result := Result + ValorSubstituto;
    end;
  end;
end;

end.
