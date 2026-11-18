unit ViewFeedback;

interface

type
  IViewFeedback = interface
    ['{6F1C3A52-9D4B-4E57-8C21-3A7E5D90B2F4}']
    procedure ShowInformation(const AMessage: string);
    procedure ShowWarning(const AMessage: string);
    procedure ShowError(const AMessage: string);
    function ShowDangerQuestion(const AMessage: string): Boolean;
    function ShowQuestion(const AMessage: string): Boolean;
  end;

implementation

end.
