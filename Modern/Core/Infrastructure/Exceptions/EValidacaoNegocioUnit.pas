unit EValidacaoNegocioUnit;

interface

uses
  SysUtils;

type
  EValidacaoNegocio = class(Exception)
  public
    constructor Create(const Mensagem: string);
  end;

implementation

{ EValidacaoNegocio }

constructor EValidacaoNegocio.Create(const Mensagem: string);
begin
  inherited Create(Mensagem);
end;

end.
