unit MessageTransferType;

interface

const 
  TTI_INFO = 1;
  TTI_WARNING = 2;
  TTI_ERROR = 3;

type
  MessageTransferEnum = (mtInfo, mtWarnig, mtError, mtValidation);

  MessageTransfer = record
  private
    FText: WideString;
    FTypeTTI: MessageTransferEnum;
    FParentHandle: Cardinal;
    FCaption: WideString;
  public
    class function Create(
      const Text: WideString;
      TypeTTI: MessageTransferEnum;
      ParentHandle: Cardinal;
      const Caption: string = ''
    ): MessageTransfer; static;

    property Text: WideString read FText;
    property TypeTTI: MessageTransferEnum read FTypeTTI;
    property ParentHandle: Cardinal read FParentHandle;
    property Caption: WideString read FCaption; 
  end;

implementation

{ MessageTransfer }

{ MessageTransfer }

class function MessageTransfer.Create(
  const Text: WideString;
  TypeTTI: MessageTransferEnum;
  ParentHandle: Cardinal;
  const Caption: string
): MessageTransfer;
begin
  Result.FText := Text;
  Result.FTypeTTI := TypeTTI;
  Result.FParentHandle := ParentHandle;
  Result.FCaption := Caption;
end;

end.
