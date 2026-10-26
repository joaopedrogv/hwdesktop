unit HW.Utils.Classes.Registros.ConsultaClienteUsuario;

interface

uses
  HW.Utils.Classes.Registros_DX;

type
  TConsultaClienteUsuario = class(THwClassRegistros)
  private
    FEmailUsuario: String;
    FAtivoUsuario: Boolean;
    FNomeFantasiaCliente: String;
    FRazaoCliente: String;
    FUsuarioID: Integer;
    FNomeFantasiaParceiro: String;
    FRazaoParceiro: String;
    FCNPJCliente: String;
    FCNPJParceiro: String;
    FAtivoCliente: Boolean;
    FAtivoParceiro: Boolean;
    FNomeUsuario: String;
    FMensagem: String;
    FClienteID: Integer;
    FParceiroID: Integer;
  published
    property Mensagem: String read FMensagem write FMensagem;
    property AtivoParceiro: Boolean read FAtivoParceiro write FAtivoParceiro;
    property ParceiroID: Integer read FParceiroID write FParceiroID;
    property RazaoParceiro: String read FRazaoParceiro write FRazaoParceiro;
    property CNPJParceiro: String read FCNPJParceiro write FCNPJParceiro;
    property NomeFantasiaParceiro: String read FNomeFantasiaParceiro write FNomeFantasiaParceiro;
    property AtivoCliente: Boolean read FAtivoCliente write FAtivoCliente;
    property ClienteID: Integer read FClienteID write FClienteID;
    property RazaoCliente: String read FRazaoCliente write FRazaoCliente;
    property CNPJCliente: String read FCNPJCliente write FCNPJCliente;
    property NomeFantasiaCliente: String read FNomeFantasiaCliente write FNomeFantasiaCliente;
    property AtivoUsuario: Boolean read FAtivoUsuario write FAtivoUsuario;
    property UsuarioID: Integer read FUsuarioID write FUsuarioID;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
    property EmailUsuario: String read FEmailUsuario write FEmailUsuario;
  end;


implementation

end.
