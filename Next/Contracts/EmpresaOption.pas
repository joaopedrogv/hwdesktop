unit EmpresaOption;

interface

uses
  TipoComunsUnit;

type
  // Opcao de empresa apresentada por um seletor de empresas. A tela recebe
  // somente estes dados; as entidades e listas do contexto Modern nao
  // atravessam a fronteira da apresentacao.
  TEmpresaOption = record
    Id: Integer;
    Texto: string;
    Habilitada: Boolean;
    Marcada: Boolean;
  end;

  TEmpresaOptions = TArray<TEmpresaOption>;

  // Momento em que o seletor carrega a lista. Na inclusao a lista nasce com as
  // empresas permitidas marcadas; na alteracao as marcas sao substituidas pelos
  // vinculos gravados, inclusive os de itens que o usuario nao pode alterar.
  TPreparacaoEmpresas = (peInclusao, peAlteracao);

  // Carrega as opcoes do seletor para a preparacao informada. O login vigente e
  // lido a cada chamada, porque o host pode trocar o usuario com a janela viva.
  // A falha devolve False e nenhuma opcao parcial.
  TCarregarOpcoesEmpresas = reference to function(
    APreparacao: TPreparacaoEmpresas;
    const AEmpresasVinculadas: TArrayInteger;
    out AOpcoes: TEmpresaOptions): Boolean;

implementation

end.
