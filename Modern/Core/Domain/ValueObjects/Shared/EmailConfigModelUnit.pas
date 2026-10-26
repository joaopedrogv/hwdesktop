unit EmailConfigModelUnit;

interface

uses
  SysUtils, Classes, EmailConfigRemetenteEnumUnit;

type
  EmailConfigModel = record
  private
    FSMTPServer: string;
    FSMTPPort: string;
    FUsername: string;
    FPassword: string;
    FFromEmail: string;
    FFromName: string;
    FSubjectTemplate: string;
    FBodyTemplate: string;
    FUseSSL: Boolean;
    FUseTLS: Boolean;
  public
    class function Create(
      const ASMTPServer: string;
      const ASMTPPort: string;
      const AUsername: string;
      const APassword: string;
      const AFromEmail: string;
      const AFromName: string;  
      const ASubjectTemplate: string;
      const ABodyTemplate: string;
      AUseSSL: Boolean;
      AUseTLS: Boolean
    ): EmailConfigModel; static;

    property SMTPServer: string read FSMTPServer;
    property SMTPPort: string read FSMTPPort;
    property Username: string read FUsername;
    property Password: string read FPassword;
    property FromEmail: string read FFromEmail;
    property FromName: string read FFromName;
    property SubjectTemplate: string read FSubjectTemplate;
    property BodyTemplate: string read FBodyTemplate;
    property UseSSL: Boolean read FUseSSL;
    property UseTLS: Boolean read FUseTLS;
  end;

implementation

{ EmailConfigModel }

class function EmailConfigModel.Create(
  const ASMTPServer: string;
  const ASMTPPort: string;
  const AUsername: string;
  const APassword: string;
  const AFromEmail: string;
  const AFromName: string;
  const ASubjectTemplate: string;
  const ABodyTemplate: string;
  AUseSSL: Boolean;
  AUseTLS: Boolean
): EmailConfigModel;
begin
  Result.FSMTPServer := ASMTPServer;
  Result.FSMTPPort := ASMTPPort;
  Result.FUsername := AUsername;
  Result.FPassword := APassword;
  Result.FFromEmail := AFromEmail;
  Result.FFromName := AFromName;
  Result.FSubjectTemplate := ASubjectTemplate;
  Result.FBodyTemplate := ABodyTemplate;
  Result.FUseSSL := AUseSSL;
  Result.FUseTLS := AUseTLS;
end;

end.
