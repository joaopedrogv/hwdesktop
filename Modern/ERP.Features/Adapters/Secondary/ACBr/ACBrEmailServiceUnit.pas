unit ACBrEmailServiceUnit;

interface

uses
  SysUtils, Classes,
  IEmailServiceUnit, ACBrMail, EmailConfigModelUnit,
  EmailMessageTypesUnit;

type
  ACBrEmailService = class(TInterfacedObject, IEmailService)
  private
    FACBr: TACBrMail;
  public
    constructor Create();
    destructor Destroy; override;

    procedure Configurar(const Config: EmailConfigModel);
    function Enviar(const EmailMessage: EmailMessageModel): Boolean;
  end;

implementation

{ ACBrEmailService }

procedure ACBrEmailService.Configurar(const Config: EmailConfigModel);
begin
  FACBr.Host                := Config.SMTPServer;
  FACBr.Port                := Config.SMTPPort;
  FACBr.Username            := Config.Username;
  FACBr.Password            := Config.Password;
  FACBr.From                := Config.FromEmail;
  FACBr.SetSSL              := Config.UseSSL;     // SSL - Conexaoo Segura
  FACBr.SetTLS              := Config.UseTLS;     // Auto TLS
  FACBr.ReadingConfirmation := False;             // Pede confirmacao de leitura do email
  FACBr.UseThread           := False;             // Aguarda Envio do Email(nao usa thread)
  FACBr.FromName            := Config.FromName;
end;

constructor ACBrEmailService.Create;
begin
  FACBr := TACBrMail.Create(nil);
end;

destructor ACBrEmailService.Destroy;
begin
  FACBr.Free();
  inherited;
end;

function ACBrEmailService.Enviar(const EmailMessage: EmailMessageModel): Boolean;
var
  I: Integer;
  BS: TBytesStream;
begin
  FACBr.Clear;

  FACBr.Subject := EmailMessage.Subject;

  FACBr.IsHTML := EmailMessage.BodyIsHtml;
  if EmailMessage.BodyIsHtml then
    FACBr.Body.Text := EmailMessage.Body
  else
    FACBr.AltBody.Text := EmailMessage.Body;

  for I := Low(EmailMessage.Attachments) to High(EmailMessage.Attachments) do
    if Length(EmailMessage.Attachments[I].Content) > 0 then
    begin
      BS := TBytesStream.Create(EmailMessage.Attachments[I].Content);
      try
        FACBr.AddAttachment( BS, EmailMessage.Attachments[I].FileName, adAttachment );
      finally
        BS.Free;
      end;
    end
    else
      FACBr.AddAttachment( EmailMessage.Attachments[I].FileName );

  for I := Low(EmailMessage.ToAddresses) to High(EmailMessage.ToAddresses) do
    FACBr.AddAddress( EmailMessage.ToAddresses[I].Email, EmailMessage.ToAddresses[I].Name );

  // More...
  //for I := Low(EmailMessage.ReplyTo[I]) to High(EmailMessage.ReplyTo[I]) do
    //FACBr.AddReplyTo( EmailMessage.ReplyTo[I].Email, EmailMessage.ReplyTo[I].Name );

  FACBr.Send();

  Result := True;
end;

end.
