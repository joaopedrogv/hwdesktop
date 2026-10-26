unit EnviarEmailUseCaseUnit;

interface

uses
  SysUtils, Classes,
  IEnviarEmailUseCaseUnit, IEmailServiceUnit, EmailMessageTypesUnit, EmailConfigModelUnit;

type
  EnviarEmailUseCase = class(TInterfacedObject, IEnviarEmailUseCase)
  private
    FEmailService: IEmailService;
  public
    constructor Create(const EmailService: IEmailService);
    function Executar(const Config: EmailConfigModel; const EmailMessage: EmailMessageModel): Boolean;
  end;

implementation

{ EnviarEmailUseCase }

constructor EnviarEmailUseCase.Create(const EmailService: IEmailService);
begin
  FEmailService := EmailService;
end;

function EnviarEmailUseCase.Executar(const Config: EmailConfigModel; const EmailMessage: EmailMessageModel): Boolean;
begin
  FEmailService.Configurar(Config);

  Result := FEmailService.Enviar(EmailMessage);
end;

end.
