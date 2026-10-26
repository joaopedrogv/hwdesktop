unit IEnviarEmailUseCaseUnit;

interface

uses
  EmailMessageTypesUnit, EmailConfigModelUnit;

type
  IEnviarEmailUseCase = interface
    ['{FE076BF7-EF0C-4E2C-A672-25E32846AC24}']
    function Executar(const Config: EmailConfigModel; const EmailMessage: EmailMessageModel): Boolean;
  end;

implementation

end.
