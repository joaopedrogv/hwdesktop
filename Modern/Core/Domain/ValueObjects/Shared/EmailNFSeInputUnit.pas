unit EmailNFSeInputUnit;

interface

uses
  SysUtils, Classes, EmailConfigModelUnit;

type
  EmailNFSeInput = record
  private
    FEmails: string;
    FChave: string;
    FDANFSePDF: TBytes;
    FXMLAutorizacao: TBytes;
    FXMLCancelamento: TBytes;
    FEmailConfig: EmailConfigModel;
  public
    class function Create(
      const AEmails: string;
      const AChave: string;
      const ADANFSePDF: TBytes;
      const AXMLAutorizacao: TBytes;
      const AXMLCancelamento: TBytes;
      const AEmailConfig: EmailConfigModel
    ): EmailNFSeInput; overload; static;

    class function Create(
      const AEmails: string;
      const AEmailConfig: EmailConfigModel
    ): EmailNFSeInput; overload; static;

    property Emails: string read FEmails;
    property Chave: string read FChave;
    property DANFSePDF: TBytes read FDANFSePDF;
    property XMLAutorizacao: TBytes read FXMLAutorizacao;
    property XMLCancelamento: TBytes read FXMLCancelamento;
    property EmailConfig: EmailConfigModel read FEmailConfig;
  end;

implementation

{ EmailNFSeInput }

class function EmailNFSeInput.Create(
  const AEmails: string;
  const AChave: string;
  const ADANFSePDF: TBytes;
  const AXMLAutorizacao: TBytes;
  const AXMLCancelamento: TBytes;
  const AEmailConfig: EmailConfigModel
): EmailNFSeInput;
begin
  Result.FEmails := AEmails;
  Result.FChave := AChave;
  Result.FEmailConfig := AEmailConfig;
  Result.FDANFSePDF := ADANFSePDF;
  Result.FXMLAutorizacao := AXMLAutorizacao;
  Result.FXMLCancelamento := AXMLCancelamento;
end;


class function EmailNFSeInput.Create(const AEmails: string;
  const AEmailConfig: EmailConfigModel): EmailNFSeInput;
begin
  Result.FEmails := AEmails;
  Result.FEmailConfig := AEmailConfig;
  Result.FChave := '';

  SetLength(Result.FDANFSePDF      , 0);
  SetLength(Result.FXMLAutorizacao , 0);
  SetLength(Result.FXMLCancelamento, 0);
end;

end.
