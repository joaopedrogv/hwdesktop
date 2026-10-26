unit AccountModel;

interface

type
  TNewAccountModel = class
  private
    Fname: string;
    Femail: string;
    Fpassword: string;
    Fcnpj: string;
    FprivacyTerms: Boolean;
    FhwTrigger: string;
  published
    property name: string read Fname write Fname;
    property email: string read Femail write Femail;
    property password: string read Fpassword write Fpassword;
    property cnpj: string read Fcnpj write Fcnpj;
    property privacyTerms: Boolean read FprivacyTerms write FprivacyTerms;
    property hwTrigger: string read FhwTrigger write FhwTrigger;
  end;

  TAccount = class
  private
    Fid: string;
    Femail: string;
    FhasSubscription: Boolean;
    Fcredits: Integer;
    Fcnpj: string;
  published
    property id: string read Fid write Fid;
    property email: string read Femail write Femail;
    property hasSubscription: Boolean read FhasSubscription write FhasSubscription;
    property credits: Integer read Fcredits write Fcredits;
    property cnpj: string read Fcnpj write Fcnpj;
  end;

  TAccountDbModel = class
  private
    FbearerToken: string;
    Fcnpj: string;
    Femail: string;
    Fname: string;
  published
    property bearerToken: string read FbearerToken write FbearerToken;
    property name: string read Fname write Fname;
    property cnpj: string read Fcnpj write Fcnpj;
    property email: string read Femail write Femail;
  end;

  TIntegrationModel = class
  private
    Ftoken: string;
  published
    property token: string read Ftoken write Ftoken;
  end;

  TLoginByToken = class
  private
    Fcode: string;
    FloginUrl: string;
  published
    property code: string read Fcode write Fcode;
    property loginUrl: string read FloginUrl write FloginUrl;
  end;

implementation

end.
