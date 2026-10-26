unit HW.Comercio.Api.Lojista;

interface

type
  TLojista = class
  private
    FEmail: String;
    FCpfCnpj: String;
    FId: Integer;
    FSenha: String;
    FTelefone: String;
    FNomeFantasia: String;
    FCelular: String;
    FCidadeId: Integer;
    FLinkLogo: string;
    FWebSite: string;
    //FEmailContato: string;
  public
    property Id: Integer read FId write FId;
    property NomeFantasia: String read FNomeFantasia write FNomeFantasia;
    property CpfCnpj: String read FCpfCnpj write FCpfCnpj;
    property Email: String read FEmail write FEmail;
    property Telefone: String read FTelefone write FTelefone;
    property Celular: String read FCelular write FCelular;
    property Senha: String read FSenha write FSenha;
    property CidadeId: Integer read FCidadeId write FCidadeId;
    property LinkLogo: string read FLinkLogo write FLinkLogo;
    property WebSite: string read FWebSite write FWebSite;
    //property EmailContato: string read FEmailContato write FEmailContato;
  end;

implementation

end.
