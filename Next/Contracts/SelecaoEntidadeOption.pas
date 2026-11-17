unit SelecaoEntidadeOption;

interface

type
  // Opcao de uma entidade vinculada por identificador, como Operacao Interna e
  // Grupo Fiscal. A tela recebe somente o par identificador/texto; as entidades
  // e as listas do contexto Modern nao atravessam a fronteira da apresentacao.
  TSelecaoEntidadeOption = record
    Id: string;
    Texto: string;
  end;

  TSelecaoEntidadeOptions = TArray<TSelecaoEntidadeOption>;

  // Carrega as opcoes do seletor para o identificador atual. AIdAtual garante o
  // registro ja vinculado mesmo quando ele nao esta na lista de ativos. A falha
  // devolve False e nenhuma opcao parcial.
  TCarregarSelecaoEntidade = reference to function(const AIdAtual: string;
    out AOpcoes: TSelecaoEntidadeOptions): Boolean;

implementation

end.
