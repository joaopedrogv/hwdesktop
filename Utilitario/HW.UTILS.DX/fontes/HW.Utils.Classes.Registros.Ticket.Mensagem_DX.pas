unit HW.Utils.Classes.Registros.Ticket.Mensagem_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Ticket.Documento_DX,
  HW.Utils.Classes.Registros.Ticket.Participante_DX,
  HW.Utils.Classes.Registros.Ticket.Anexo_DX,
  HW.Utils.Classes.Rtti,
  REST.Json.Types;

type

  TTicketMensagem = class(THwClassRegistros)
  private
    [JSONNameAttribute('TicketID')]
    FTicketID: Integer;
    [JSONNameAttribute('CriadaPorID')]
    FCriadaPorID: Integer;
    [JSONNameAttribute('Documentos')]
    FDocumentos: TArray<TTicketDocumento>;
    //[JSONMarshalledAttribute(False)]
    [JSONNameAttribute('CriadorPor')]
    FCriadorPor: TTicketParticipante;
    [JSONNameAttribute('MensagemID')]
    FMensagemID: Integer;
    [JSONNameAttribute('Anexos')]
    FAnexos: TArray<TTicketAnexo>;
    [JSONNameAttribute('Conteudo')]
    FConteudo: String;
    [JSONNameAttribute('CodEmpresa')]
    FCodEmpresa: Integer;
    [JSONNameAttribute('emailEnviado')]
    FemailEnviado: string;
    [JSONNameAttribute('Privada')]
    //[JSONMarshalledAttribute(False)]
    FPrivada: Boolean;
    FemailParam: string;
    [JSONNameAttribute('ConteudoHtml')]
    FConteudoHtml: String;
    [JSONNameAttribute('Notificacao')]
    FNotificacao: Boolean;
    [JSONNameAttribute('DataCriacao')]
    FDataCriacao: string;
  published
    property Anexos: TArray<TTicketAnexo> read FAnexos write FAnexos;// Collection
    property CriadorPor: TTicketParticipante read FCriadorPor write FCriadorPor;// class
    property Documentos: TArray<TTicketDocumento> read FDocumentos write FDocumentos;// Collection
    property MensagemID: Integer read FMensagemID write FMensagemID;
    property DataCriacao: string read FDataCriacao write FDataCriacao;
    property Conteudo: String read FConteudo write FConteudo;
    property ConteudoHtml: String read FConteudoHtml write FConteudoHtml;
    property Privada: Boolean read FPrivada write FPrivada;
    property Notificacao: Boolean read FNotificacao write FNotificacao;
    property TicketID: Integer read FTicketID write FTicketID;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property emailParam: string read FemailParam write FemailParam;
    property emailEnviado: string read FemailEnviado write FemailEnviado;
    property CriadaPorID: Integer read FCriadaPorID write FCriadaPorID;
  end;

implementation

end.
