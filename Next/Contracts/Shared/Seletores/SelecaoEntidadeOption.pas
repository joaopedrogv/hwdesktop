unit SelecaoEntidadeOption;

interface

type
  // Somente o par identificador/texto atravessa a fronteira; entidades do contexto Modern ficam fora.
  TSelecaoEntidadeOption = record
    Id: string;
    Texto: string;
  end;

  TSelecaoEntidadeOptions = TArray<TSelecaoEntidadeOption>;

  // AIdAtual garante o registro ja vinculado mesmo fora da lista de ativos; a falha devolve False e nenhuma opcao
  // parcial.
  TCarregarSelecaoEntidade = reference to function(const AIdAtual: string;
    out AOpcoes: TSelecaoEntidadeOptions): Boolean;

implementation

end.
