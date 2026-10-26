unit TemplateEtd;

interface

type

  TRevision = class
  private
    Fid: string;
    Fversion: Integer;
    FcreateAt: TDateTime;
    FisActive: Boolean;
    FtagList: TArray<string>;
  published
    property id: string read Fid write Fid;
    property version: Integer read Fversion write Fversion;
    property createAt: TDateTime read FcreateAt write FcreateAt;
    property isActive: Boolean read FisActive write FisActive;
    property tagList: TArray<string> read FtagList write FtagList;
  end;

  TTemplate = class
  private
    Fid: string;
    Fname: string;
    Fvalidity: Integer;
    Frevisions: TArray<TRevision>;
  published
    property id: string read Fid write Fid;
    property name: string read Fname write Fname;
    property validity: Integer read Fvalidity write Fvalidity;
    property revisions: TArray<TRevision> read Frevisions write Frevisions;
  end;

  TRevisionModel = class
  private
    FtemplateId: string;
    FrevisionId: string;
    Fname: string;
    Fvalidity: Integer;
    FauthenticationType: Integer;
    Fversion: Integer;
    FcreateAt: TDateTime;
    FisActive: Boolean;
    FtagList: TArray<string>;
  published
    property templateId: string read FtemplateId write FtemplateId;
    property revisionId: string read FrevisionId write FrevisionId;
    property name: string read Fname write Fname;
    property validity: Integer read Fvalidity write Fvalidity;
    property authenticationType: Integer read FauthenticationType write FauthenticationType;
    property version: Integer read Fversion write Fversion;
    property createAt: TDateTime read FcreateAt write FcreateAt;
    property isActive: Boolean read FisActive write FisActive;
    property tagList: TArray<string> read FtagList write FtagList;
  end;

implementation

end.
