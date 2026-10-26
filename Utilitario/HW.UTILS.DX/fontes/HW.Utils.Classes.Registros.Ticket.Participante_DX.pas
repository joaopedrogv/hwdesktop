unit HW.Utils.Classes.Registros.Ticket.Participante_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Usuario_DX,
  REST.Json.Types;

type
  TTicketParticipante = class(THwClassRegistros)
  private
    FTicketID: Integer;
    FParticipanteID: Integer;
    FDataEntrada: string;
    FEmail: string;
    FNivelAcesso: Integer;
    FDataLeituraMensagem: string;
    FUsuarioID: Integer;
    FDataEnvioAlerta: string;
    FCodEmpresa: Integer;
    [JSONMarshalledAttribute(False)]
    FUltimaMensagemLidaID: Integer;
    FNome: string;
    FUsuario: TUsuario;
    FExcluido: Boolean;
    FEnviarEmail: Boolean;
  published
    //property MensagemLida: TMensagemLida read FMensagemLida write FMensagemLida;// class
    property Usuario: TUsuario read FUsuario write FUsuario;// class
    property ParticipanteID: Integer read FParticipanteID write FParticipanteID;
    property DataEntrada: string read FDataEntrada write FDataEntrada;
    property NivelAcesso: Integer read FNivelAcesso write FNivelAcesso;
    property DataLeituraMensagem: string read FDataLeituraMensagem write FDataLeituraMensagem;
    property DataEnvioAlerta: string read FDataEnvioAlerta write FDataEnvioAlerta;// class
    property Excluido: Boolean read FExcluido write FExcluido;
    property EnviarEmail: Boolean read FEnviarEmail write FEnviarEmail;
    property UsuarioID: Integer read FUsuarioID write FUsuarioID;
    property TicketID: Integer read FTicketID write FTicketID;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property UltimaMensagemLidaID: Integer read FUltimaMensagemLidaID write FUltimaMensagemLidaID;
    property Nome: string read FNome write FNome;
    property Email: string read FEmail write FEmail;
  end;

implementation

end.
