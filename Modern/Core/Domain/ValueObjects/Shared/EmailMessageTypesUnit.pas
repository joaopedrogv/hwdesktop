unit EmailMessageTypesUnit;

interface

uses
  SysUtils, Classes;

type
  EmailAttachmentModel = record
  private
    FFileName: string;
    FContent: TBytes;
  public
    class function Create(
      const AFileName: string;
      const AContent: TBytes = []
    ): EmailAttachmentModel; static;

    property FileName: string read FFileName;
    property Content: TBytes read FContent;
  end;

  EmailAddressModel = record
  private
    FEmail: string;
    FName: string;
  public
    class function Create(
      const AEmail: string;
      const AName: string = ''
    ): EmailAddressModel; static;

    property Email: string read FEmail;
    property Name: string read FName;
  end;

  EmailMessageModel = record
  private
    FSubject: string;
    FBody: string;
    FBodyIsHtml: Boolean;
    FToAddresses: TArray<EmailAddressModel>;
    FAttachments: TArray<EmailAttachmentModel>;
  public
    class function Create(
      const ASubject: string = '';
      const ABody: string = '';
      ABodyIsHtml: Boolean = False;
      const AToAddresses: TArray<EmailAddressModel> = [];
      const AAttachments: TArray<EmailAttachmentModel> = []
    ): EmailMessageModel; static;

    procedure AddAddress(const Email: string; const Name: string = '');
    procedure AddAttachment(const FileName: string; const Content: TBytes = []);

    property Subject: string read FSubject write FSubject;
    property Body: string read FBody write FBody;
    property BodyIsHtml: Boolean read FBodyIsHtml write FBodyIsHtml;
    property ToAddresses: TArray<EmailAddressModel> read FToAddresses;
    property Attachments: TArray<EmailAttachmentModel> read FAttachments;
  end;

implementation

{ EmailAttachmentModel }

class function EmailAttachmentModel.Create(
  const AFileName: string;
  const AContent: TBytes
): EmailAttachmentModel;
begin
  Result.FFileName := AFileName;
  Result.FContent := AContent;
end;

{ EmailAddressModel }

class function EmailAddressModel.Create(
  const AEmail: string;
  const AName: string
): EmailAddressModel;
begin
  Result.FEmail := AEmail;
  Result.FName := AName;
end;

{ EmailMessageModel }

procedure EmailMessageModel.AddAddress(const Email, Name: string);
begin
  FToAddresses := FToAddresses + [ EmailAddressModel.Create( Email, Name ) ];
end;

procedure EmailMessageModel.AddAttachment(const FileName: string; const Content: TBytes);
begin
  FAttachments := FAttachments + [ EmailAttachmentModel.Create( FileName, Content ) ];
end;

class function EmailMessageModel.Create(
  const ASubject: string;
  const ABody: string;
  ABodyIsHtml: Boolean;
  const AToAddresses: TArray<EmailAddressModel>;
  const AAttachments: TArray<EmailAttachmentModel>
): EmailMessageModel;
begin
  Result.FSubject := ASubject;
  Result.FBody := ABody;
  Result.FBodyIsHtml := ABodyIsHtml;
  Result.FToAddresses := AToAddresses;
  Result.FAttachments := AAttachments;
end;

end.
