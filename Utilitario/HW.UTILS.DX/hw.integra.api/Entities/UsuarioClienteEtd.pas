unit UsuarioClienteEtd;

interface

type
  TConfsUsusarioCliente = class
  private
    FAtivo: Boolean;
    FDiasLogin: Integer;
  published
    property Ativo: Boolean read FAtivo write FAtivo;
    property DiasLogin: Integer read FDiasLogin write FDiasLogin;
  end;

  TUsuarioClienteBase = class
  private
    FcolaboradorId: Integer;
    FdataLogin: TDateTime;
  published
    property colaboradorId: Integer read FcolaboradorId write FcolaboradorId;
    property dataLogin: TDateTime read FdataLogin write FdataLogin;
  end;

  TUsuarioCliente = class(TUsuarioClienteBase)
  private
    Fid: Integer;
    FempresaId: Integer;
    FclienteId: Integer;
    Fnome: string;
    Fendereco: string;
    Fbairro: string;
    Fcidade: string;
    Festado: string;
    Fcep: string;
    Ffone: string;
    Fcpf: string;
    Femail: string;
    FdataNascimento: TDateTime;
    FdataCadastro: TDateTime;
    FdataAlteracao: TDateTime;
    Fativo: Integer;
    FisFromMobile: Boolean;
  published
    property id: Integer read Fid write Fid;
    property empresaId: Integer read FempresaId write FempresaId;
    property clienteId: Integer read FclienteId write FclienteId;
    property nome: string read Fnome write Fnome;
    property endereco: string read Fendereco write Fendereco;
    property bairro: string read Fbairro write Fbairro;
    property cidade: string read Fcidade write Fcidade;
    property estado: string read Festado write Festado;
    property cep: string read Fcep write Fcep;
    property fone: string read Ffone write Ffone;
    property cpf: string read Fcpf write Fcpf;
    property email: string read Femail write Femail;
    property dataNascimento: TDateTime read FdataNascimento write FdataNascimento;
    property dataCadastro: TDateTime read FdataCadastro write FdataCadastro;
    property dataAlteracao: TDateTime read FdataAlteracao write FdataAlteracao;
    property ativo: Integer read Fativo write Fativo;
    property isFromMobile: Boolean read FisFromMobile write FisFromMobile;
  end;

implementation

end.
