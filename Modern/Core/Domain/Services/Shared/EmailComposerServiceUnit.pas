unit EmailComposerServiceUnit;

interface

uses
  SysUtils, Classes,
  IEmailComposerServiceUnit, EmailMessageTypesUnit, EmailConfigModelUnit, EmailNFSeInputUnit;

type
  EmailComposerService = class(TInterfacedObject, IEmailComposerService)
  private
    //FBoletoRepo: IBoletoRepository;
  public
    //constructor Create({...});
    function ComporEmailNFSe(const Input: EmailNFSeInput): EmailMessageModel;
    procedure ComporEmailNFSeUpdate(
      var EmailMessage: EmailMessageModel;
      const AChave: string;
      const ADANFSePDF, AXMLAutorizacao, AXMLCancelamento: TBytes
    );
    //function ComporEmailBoleto(const BoletoId: string): EmailMessageModel;
  end;

implementation

{ EmailComposerService }

function EmailComposerService.ComporEmailNFSe(const Input: EmailNFSeInput): EmailMessageModel;
var
  S: string;
  Emails: TArray<string>;
begin
  Result := EmailMessageModel.Create(
    Input.EmailConfig.SubjectTemplate + ' - NFSe',
    Input.EmailConfig.BodyTemplate,
    False
  );
  Emails := Input.Emails.Replace(';', ',').Replace(' ', ',').Split([',']);

  for S in Emails do
    Result.AddAddress( S );

  Self.ComporEmailNFSeUpdate( Result, Input.Chave, Input.DANFSePDF, Input.XMLAutorizacao, Input.XMLCancelamento );
{
  if Length(Input.DANFSePDF) > 0 then
    Result.AddAttachment( Format('%s-nfse.pdf', [ Input.Chave ]), Input.DANFSePDF );

  if Length(Input.XMLAutorizacao) > 0 then
    Result.AddAttachment( Format('%s-nfse.xml', [ Input.Chave ]), Input.XMLAutorizacao );

  if Length(Input.XMLCancelamento) > 0 then
    Result.AddAttachment( Format('%s-nfse-canc.xml', [ Input.Chave ]), Input.XMLCancelamento );
}
end;

procedure EmailComposerService.ComporEmailNFSeUpdate(var EmailMessage: EmailMessageModel; const AChave: string;
  const ADANFSePDF, AXMLAutorizacao, AXMLCancelamento: TBytes);
begin
  if Length(ADANFSePDF) > 0 then
    EmailMessage.AddAttachment( Format('%s-nfse.pdf', [ AChave ]), ADANFSePDF );

  if Length(AXMLAutorizacao) > 0 then
    EmailMessage.AddAttachment( Format('%s-nfse.xml', [ AChave ]), AXMLAutorizacao );

  if Length(AXMLCancelamento) > 0 then
    EmailMessage.AddAttachment( Format('%s-nfse-canc.xml', [ AChave ]), AXMLCancelamento );
end;

end.
