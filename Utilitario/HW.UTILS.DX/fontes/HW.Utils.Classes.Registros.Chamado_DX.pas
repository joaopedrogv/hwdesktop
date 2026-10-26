unit HW.Utils.Classes.Registros.Chamado_DX;

interface

uses
  HW.Utils.Classes.Registros.Cliente_DX,
  HW.Utils.Classes.Registros.Setor_DX,
  HW.Utils.Classes.Registros_DX;

type
  TChamado = class(THwClassRegistros)
  private
    Fdiretorio_arquivo: String;
    Fcod_empresa: Integer;
    Fcod_chamado: Integer;
    Fdata_temporaria: string;
    Femail: String;
    Fdata_agendamento: string;
    Fativo: Integer;
    Fordem_cadastro: Integer;
    Fdata_cadastro: string;
    Fcliente: TCliente;
    FSetorID: Integer;
    Fordem_prioridade: Integer;
    Fdata_atendimento: string;
    Fstatus: String;
    Fcod_cli_atend: Integer;
    Fcod_us_cad: Integer;
    Fcod_cliente: Integer;
    Fmensagem: String;
    Fnome: String;
    Fassunto: String;
    Ftipo: String;
    Furgente: Integer;
    Fconnectionid: String;
    Fref_cadastro: String;
    FSetor: TSetor;
    Ftelefone: String;
    Fonline: Boolean;
  published
    property cod_chamado: Integer read Fcod_chamado write Fcod_chamado;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property ativo: Integer read Fativo write Fativo;
    property cliente: TCliente read Fcliente write Fcliente;// class
    property tipo: String read Ftipo write Ftipo;
    property nome: String read Fnome write Fnome;
    property mensagem: String read Fmensagem write Fmensagem;
    property email: String read Femail write Femail;
    property assunto: String read Fassunto write Fassunto;
    property diretorio_arquivo: String read Fdiretorio_arquivo write Fdiretorio_arquivo;
    property data_cadastro: string read Fdata_cadastro write Fdata_cadastro;
    property telefone: String read Ftelefone write Ftelefone;
    property data_agendamento: string read Fdata_agendamento write Fdata_agendamento;
    property data_atendimento: string read Fdata_atendimento write Fdata_atendimento;
    property data_temporaria: string read Fdata_temporaria write Fdata_temporaria;
    property status: String read Fstatus write Fstatus;
    property ref_cadastro: String read Fref_cadastro write Fref_cadastro;
    property cod_us_cad: Integer read Fcod_us_cad write Fcod_us_cad;
    property cod_cli_atend: Integer read Fcod_cli_atend write Fcod_cli_atend;
    property online: Boolean read Fonline write Fonline;
    property connectionid: String read Fconnectionid write Fconnectionid;
    property urgente: Integer read Furgente write Furgente;
    property ordem_cadastro: Integer read Fordem_cadastro write Fordem_cadastro;
    property ordem_prioridade: Integer read Fordem_prioridade write Fordem_prioridade;
    property SetorID: Integer read FSetorID write FSetorID;
    //property atendimentos: TAtendimento read Fatendimentos write Fatendimentos;// Collection
    property Setor: TSetor read FSetor write FSetor;// class
    //property UsuarioQueCriou: TUsuario read FUsuarioQueCriou write FUsuarioQueCriou;// class
  end;


implementation

end.
