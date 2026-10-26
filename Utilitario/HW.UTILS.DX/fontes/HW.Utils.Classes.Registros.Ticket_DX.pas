unit HW.Utils.Classes.Registros.Ticket_DX;

interface

uses
  HW.Utils.Classes.Registros_DX, HW.Utils.Classes.Registros.Cliente_DX,
  HW.Utils.Classes.Registros.Ticket.Participante_DX,
  HW.Utils.Classes.Registros.Ticket.Categoria_DX,
  HW.Utils.Classes.Registros.Ticket.Mensagem_DX,
  HW.Utils.Classes.Registros.Setor_DX,
  HW.Utils.Classes.Rtti,
  REST.Json.Types;

type

  TTicket = class(THwClassRegistros)
  private
    [JSONNameAttribute('Prioridade')]
    FPrioridade: String;
    [JSONNameAttribute('TicketID')]
    FTicketID: Integer;
    [JSONNameAttribute('DataFechamento')]
    FDataFechamento: string;
    [JSONNameAttribute('ChamadoID')]
    FChamadoID: Integer;
    [JSONNameAttribute('CodClienteCad')]
    FCodClienteCad: Integer;
    [JSONNameAttribute('ParticipantesAnonimos')]
    FParticipantesAnonimos: string;
    [JSONNameAttribute('AlertaNaoLido')]
    FAlertaNaoLido: Integer;
    [JSONNameAttribute('DtEmailPesqSat')]
    FDtEmailPesqSat: string;
    [JSONNameAttribute('CriadoViaEmail')]
    FCriadoViaEmail: string;
    [JSONNameAttribute('ClienteCad')]
    FClienteCad: TCliente;
    [JSONNameAttribute('Cliente')]
    FCliente: TCliente;
    [JSONNameAttribute('DataModificacao')]
    FDataModificacao: string;
    [JSONNameAttribute('Participantes')]
    FParticipantes: TArray<TTicketParticipante>;
    [JSONNameAttribute('SetorID')]
    FSetorID: Integer;
    [JSONNameAttribute('CodEmpresa')]
    FCodEmpresa: Integer;
    [JSONNameAttribute('Responsavel')]
    FResponsavel: TTicketParticipante;
    [JSONNameAttribute('Mensagens')]
    FMensagens: TArray<TTicketMensagem>;
    [JSONNameAttribute('CriadoPor')]
    FCriadoPor: TTicketParticipante;
    [JSONNameAttribute('Categoria')]
    FCategoria: TTicketCategoria;
    [JSONNameAttribute('Status')]
    FStatus: String;
    [JSONNameAttribute('DtEmailTicketAberto')]
    FDtEmailTicketAberto: string;
    [JSONNameAttribute('ClienteID')]
    FClienteID: Integer;
    [JSONNameAttribute('ResponsavelID')]
    FResponsavelID: Integer;
    [JSONNameAttribute('Assunto')]
    FAssunto: String;
    [JSONNameAttribute('Setor')]
    FSetor: TSetor;
    [JSONNameAttribute('CriadoPorID')]
    FCriadoPorID: Integer;
    [JSONNameAttribute('CategoriaID')]
    FCategoriaID: Integer;
    [JSONNameAttribute('DataCriacao')]
    FDataCriacao: string;
  published
    property Categoria: TTicketCategoria read FCategoria write FCategoria;// class
    //property Chamado: TObject read FChamado write FChamado;// class
    property Cliente: TCliente read FCliente write FCliente;// class
    property ClienteCad: TCliente read FClienteCad write FClienteCad;// class
    property CriadoPor: TTicketParticipante read FCriadoPor write FCriadoPor;// class
    property Mensagens: TArray<TTicketMensagem> read FMensagens write FMensagens;// Collection
    property Participantes: TArray<TTicketParticipante> read FParticipantes write FParticipantes;// Collection
    property Responsavel: TTicketParticipante read FResponsavel write FResponsavel;// class
    property Setor: TSetor read FSetor write FSetor;// class
    property TicketID: Integer read FTicketID write FTicketID;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property CodClienteCad: Integer read FCodClienteCad write FCodClienteCad;
    property DataCriacao: string read FDataCriacao write FDataCriacao;
    property DataModificacao: string read FDataModificacao write FDataModificacao;
    property DataFechamento: string read FDataFechamento write FDataFechamento;
    property Status: String read FStatus write FStatus;
    property Assunto: String read FAssunto write FAssunto;
    property Prioridade: String read FPrioridade write FPrioridade;
    property AlertaNaoLido: Integer read FAlertaNaoLido write FAlertaNaoLido;
    property ParticipantesAnonimos: string read FParticipantesAnonimos write FParticipantesAnonimos;
    property CriadoViaEmail: string read FCriadoViaEmail write FCriadoViaEmail;
    property DtEmailTicketAberto: string read FDtEmailTicketAberto write FDtEmailTicketAberto;
    property DtEmailPesqSat: string read FDtEmailPesqSat write FDtEmailPesqSat;
    property SetorID: Integer read FSetorID write FSetorID;
    property CategoriaID: Integer read FCategoriaID write FCategoriaID;
    property ResponsavelID: Integer read FResponsavelID write FResponsavelID;
    property CriadoPorID: Integer read FCriadoPorID write FCriadoPorID;
    property ChamadoID: Integer read FChamadoID write FChamadoID;
    property ClienteID: Integer read FClienteID write FClienteID;
  end;


implementation

end.
