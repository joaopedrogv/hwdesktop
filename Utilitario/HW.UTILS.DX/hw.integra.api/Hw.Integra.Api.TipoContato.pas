unit Hw.Integra.Api.TipoContato;

interface

type
  TTipoContato = class
  private
    FtipoContatoId: Integer;
    FempresaId: Integer;
    Ftipo: String;
  public
    property tipoContatoId: Integer read FtipoContatoId write FtipoContatoId;
    property empresaId: Integer read FempresaId write FempresaId;
    property tipo: String read Ftipo write Ftipo;
  end;

implementation

end.
