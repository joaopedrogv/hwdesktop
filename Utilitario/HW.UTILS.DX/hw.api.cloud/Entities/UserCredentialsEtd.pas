unit UserCredentialsEtd;

interface

type
  TUserCredentials = class
  private
    FempresaId: Integer;
    Fcnpj: string;
    Fcode: string;
    FcaixaId: Integer;
  public
    property empresaId: Integer read FempresaId write FempresaId;
    property cnpj: string read Fcnpj write Fcnpj;
    property code: string read Fcode write Fcode;
    property caixaId: Integer read FcaixaId write FcaixaId;
  end;

implementation

end.
