unit TextTokenModelUnit;

interface

type
  TextTokenModel = record
  private
    FText: string;
    FKey: string;
  public
    class function Create(const AText: string; const AKey: string): TextTokenModel; static;
    property Text: string read FText;
    property Key: string read FKey;
  end;

  TextTokensModel = array of TextTokenModel;

implementation

{ TextTokenModel }

class function TextTokenModel.Create(const AText: string; const AKey: string): TextTokenModel;
begin
  Result.FText := AText;
  Result.FKey := AKey;
end;

end.
