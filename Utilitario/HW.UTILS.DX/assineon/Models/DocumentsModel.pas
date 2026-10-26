unit DocumentsModel;

interface

type
  EnumContentType = (ctHtml = 1, {ctDocx = 2} ctPdf = 3);
  EnumAuthenticationType = (atNone = 1, atEmail = 2, atSMS = 3, atWhatsApp);

  TDocSignatoryModel = class
  private
    FAuthenticationType: EnumAuthenticationType;
    FAuthenticationContact: string;
    FSignatureTag: string;
  published
    property SignatureTag: string read FSignatureTag write FSignatureTag;
    property AuthenticationType: EnumAuthenticationType read FAuthenticationType write FAuthenticationType;
    property AuthenticationContact: string read FAuthenticationContact write FAuthenticationContact;
  end;

  TTagModel = class
  private
    FTagName: string;
    FTagValue: string;
  published
    property TagName: string read FTagName write FTagName;
    property TagValue: string read FTagValue write FTagValue;
  end;

  TGenerateDocumentModel = class
  private
    FTemplateRevisionId: string;
    FName: string;
    FExternalCode: string;
    FContentType: EnumContentType;
    FSignatories: TArray<TDocSignatoryModel>;
    FTagsValue: TArray<TTagModel>;
  published
    property TemplateRevisionId: string read FTemplateRevisionId write FTemplateRevisionId;
    //property Content: string read FContent write FContent;
    property ContentType: EnumContentType read FContentType write FContentType;
    property TagsValue: TArray<TTagModel> read FTagsValue write FTagsValue;
    property ExternalCode: string read FExternalCode write FExternalCode;
    property Name: string read FName write FName;
    //property OriginalFilePath: string read FOriginalFilePath write FOriginalFilePath;
    property Signatories: TArray<TDocSignatoryModel> read FSignatories write FSignatories;
  end;

  TDocumentSignatory = class
  private
    FAuthenticationType: SmallInt;
    FSignatureTag: string;
    FAuthenticationContact: string;
    FId: string;
    FSignatureLink: string;
    FIsSigned: Boolean;
  published
    property Id: string read FId write FId;
    property SignatureTag: string read FSignatureTag write FSignatureTag;
    property AuthenticationType: SmallInt read FAuthenticationType write FAuthenticationType;
    property AuthenticationContact: string read FAuthenticationContact write FAuthenticationContact;
    property IsSigned: Boolean read FIsSigned write FIsSigned;
    property SignatureLink: string read FSignatureLink write FSignatureLink;
  end;

  TDocument = class
  private
    FId: string;
    FName: string;
    FCreateAt: TDateTime;
    FSignedAt: TDateTime;
    FStatus: SmallInt;
    FContentType: SmallInt;
    FIsActive: Boolean;
    FSignatories: TArray<TDocumentSignatory>;
    FValidUntil: TDateTime;
    FTagList: TArray<string>;
    FPreviewLink: string;
    FOriginalFileLink: string;
    FFinalFileLink: string;
  published
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property CreateAt: TDateTime read FCreateAt write FCreateAt;
    property SignedAt: TDateTime read FSignedAt write FSignedAt;
    property ValidUntil: TDateTime read FValidUntil write FValidUntil;
    property Status: SmallInt read FStatus write FStatus;
    //property OriginalFileHash: string read FOriginalFileHash write FOriginalFileHash;
    //property FinalFileHash: string read FFinalFileHash write FFinalFileHash;
    property ContentType: SmallInt read FContentType write FContentType;
    property IsActive: Boolean read FIsActive write FIsActive;

    property Signatories: TArray<TDocumentSignatory> read FSignatories write FSignatories;
    property TagList: TArray<string> read FTagList write FTagList;
    property PreviewLink: string read FPreviewLink write FPreviewLink;
    property OriginalFileLink: string read FOriginalFileLink write FOriginalFileLink;
    property FinalFileLink: string read FFinalFileLink write FFinalFileLink;
  end;


implementation

end.
