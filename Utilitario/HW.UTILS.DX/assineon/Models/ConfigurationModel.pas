unit ConfigurationModel;

interface

type

  TConfigurationModel = class
  private
    FbearerToken: string;
    Fcnpj: string;
    Femail: string;
    Fname: string;
    FClienteRevisaoId: string;
    FColaboradorRevisaoId: string;
  published
    property bearerToken: string read FbearerToken write FbearerToken;
    property name: string read Fname write Fname;
    property cnpj: string read Fcnpj write Fcnpj;
    property email: string read Femail write Femail;
    property ClienteRevisaoId: string read FClienteRevisaoId write FClienteRevisaoId;
    property ColaboradorRevisaoId: string read FColaboradorRevisaoId write FColaboradorRevisaoId;
  end;


implementation

end.
