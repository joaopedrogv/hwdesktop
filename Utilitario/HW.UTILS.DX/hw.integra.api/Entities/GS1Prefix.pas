unit GS1Prefix;

interface

type
  TGS1Prefix = class
  private
    FStarts: string;
    FEnds: string;
    FSpecial: Integer;
    FDescription: string;
  published
    property Starts: string read FStarts write FStarts;
    property Ends: string read FEnds write FEnds;
    property Special: Integer read FSpecial write FSpecial;
    property Description: string read FDescription write FDescription;
  end;

  TGS1PrefixDateUpdate = class
  private
    FDateUpdate: TDateTime;
  published
    property DateUpdate: TDateTime read FDateUpdate write FDateUpdate;
  end;

implementation

end.
