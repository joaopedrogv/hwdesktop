unit IEmailComposerServiceUnit;

interface
uses
  SysUtils, Classes,
  EmailMessageTypesUnit,
  EmailNFSeInputUnit;

type
  IEmailComposerService = interface
    ['{4E70E38B-6F7E-4240-9704-FD166FCA1FEC}']
    function ComporEmailNFSe(const Input: EmailNFSeInput): EmailMessageModel;
    procedure ComporEmailNFSeUpdate(
      var EmailMessage: EmailMessageModel;
      const AChave: string;
      const ADANFSePDF, AXMLAutorizacao, AXMLCancelamento: TBytes
    );
    //function ComporEmailBoleto(const BoletoId: string): EmailMessage;
  end;

implementation

end.
