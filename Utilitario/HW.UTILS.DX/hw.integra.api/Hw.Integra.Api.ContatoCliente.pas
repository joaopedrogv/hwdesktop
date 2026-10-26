unit Hw.Integra.Api.ContatoCliente;

interface

uses
  Hw.Integra.Api.TipoContato;

type

  TContatoCliente = class
  private
    FtipoContatoId: Integer;
    FempresaId: Integer;
    Femail: String;
    FcontatoClienteId: Integer;
    FtipoContato: TTipoContato;
    Fcontato: String;
    FclienteId: Integer;
    Ftelefone: String;
  public
    property contatoClienteId: Integer read FcontatoClienteId write FcontatoClienteId;
    property clienteId: Integer read FclienteId write FclienteId;
    property empresaId: Integer read FempresaId write FempresaId;
    property tipoContatoId: Integer read FtipoContatoId write FtipoContatoId;
    property contato: String read Fcontato write Fcontato;
    property telefone: String read Ftelefone write Ftelefone;
    property email: String read Femail write Femail;
    property tipoContato: TTipoContato read FtipoContato write FtipoContato;// class
  end;



implementation

end.
