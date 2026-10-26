unit IEmailServiceUnit;

interface

uses
  SysUtils, Classes,
  EmailMessageTypesUnit,
  EmailConfigModelUnit;

type
  IEmailService = interface
    ['{E634F5C1-D87B-4409-B285-4AFAB52A1871}']
    procedure Configurar(const Config: EmailConfigModel);
    function Enviar(const EmailMessage: EmailMessageModel): Boolean;
  end;

implementation

end.
