unit PresenterCadastroBase;

interface

uses
  Classes, SysUtils, PresenterAutorizacao;

type
  TPresenterCadastroBase  = class(TPresenterAutorizacao)
  public
    function PrepararInclusao: Boolean; virtual; abstract;
    function PrepararAlteracao(const AId: string): Boolean; virtual; abstract;
  end;

implementation

end.