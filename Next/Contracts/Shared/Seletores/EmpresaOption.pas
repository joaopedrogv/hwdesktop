unit EmpresaOption;

interface

uses
  TipoComunsUnit;

type
  // Somente estes dados atravessam a fronteira; entidades do contexto Modern ficam fora.
  TEmpresaOption = record
    Id: Integer;
    Texto: string;
    Habilitada: Boolean;
    Marcada: Boolean;
  end;

  TEmpresaOptions = TArray<TEmpresaOption>;

  // Na inclusao a lista nasce com as empresas permitidas marcadas; na alteracao as marcas sao substituidas pelos
  // vinculos gravados, inclusive os de itens que o usuario nao pode alterar.
  TPreparacaoEmpresas = (peInclusao, peAlteracao);

  // O login vigente e lido a cada chamada porque o host pode trocar o usuario com a janela viva; a falha devolve False
  // e nenhuma opcao parcial.
  TCarregarOpcoesEmpresas = reference to function(APreparacao: TPreparacaoEmpresas;
    const AEmpresasVinculadas: TArrayInteger; out AOpcoes: TEmpresaOptions): Boolean;

implementation

end.
