unit ViewFeedback;

interface

type
  // Contrato de feedback visual das telas Next. A tela recebe a mensagem e o
  // titulo e os apresenta; a base global implementa com Application.MessageBox.
  IViewFeedback = interface
    ['{6F1C3A52-9D4B-4E57-8C21-3A7E5D90B2F4}']
    procedure ShowInformation(const AMessage, ATitle: string);
    procedure ShowWarning(const AMessage, ATitle: string);
    procedure ShowError(const AMessage, ATitle: string);
  end;

implementation

end.
