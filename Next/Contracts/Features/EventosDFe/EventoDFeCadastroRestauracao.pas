unit EventoDFeCadastroRestauracao;

interface

type
  // A restauração não pertence à base do cadastro: a consulta a solicita ao editor do tipo escolhido.
  IEventoDFeCadastroRestauracao = interface
    ['{9B32EBAE-D5B2-455A-9166-221F3708BC30}']
    function PrepararAbaRestauracao(const AId: string): Boolean;
  end;

implementation

end.
