unit HW.Utils.Classes.Registros.Ticket.Consulta_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type

  TTicketConsulta = class(THwClassRegistros)
  private
    FPrioridade: string;
    FTicketID: Integer;
    FDataFechamento: string;
    FCliente: string;
    FDataModificacao: string;
    FResponsavel: string;
    FCodEmpresa: Integer;
    FCriadoPor: string;
    FStatus: string;
    FAssunto: string;
    FDataCriacao: string;
    FCodUsuarioClResp: Integer;
  published
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property TicketID: Integer read FTicketID write FTicketID;
    property Assunto: string read FAssunto write FAssunto;
    property Status: string read FStatus write FStatus;
    property Prioridade: string read FPrioridade write FPrioridade;
    property Responsavel: string read FResponsavel write FResponsavel;
    property DataCriacao: string read FDataCriacao write FDataCriacao;
    property DataModificacao: string read FDataModificacao write FDataModificacao;
    property DataFechamento: string read FDataFechamento write FDataFechamento;
    property CriadoPor: string read FCriadoPor write FCriadoPor;
    property Cliente: string read FCliente write FCliente;
    property CodUsuarioClResp: Integer read FCodUsuarioClResp write FCodUsuarioClResp;
  end;

implementation

end.
