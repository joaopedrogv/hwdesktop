unit EmpresaOption;

interface

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

implementation

end.
