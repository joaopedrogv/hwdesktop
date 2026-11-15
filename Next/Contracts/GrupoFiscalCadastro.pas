unit GrupoFiscalCadastro;

interface

type
  // Opcao de empresa apresentada na inclusao de grupo fiscal. A tela recebe
  // somente estes dados; as entidades e listas do contexto Modern nao
  // atravessam a fronteira da apresentacao.
  TGrupoFiscalEmpresaOption = record
    Id: Integer;
    Texto: string;
    Habilitada: Boolean;
    Marcada: Boolean;
  end;

  TGrupoFiscalEmpresaOptions = TArray<TGrupoFiscalEmpresaOption>;

const
  // Nomes de campo produzidos pelo validador de SalvarGrupoFiscalUseCase.
  GrupoFiscalCampoDescricao = 'Descricao';
  GrupoFiscalCampoTipoTributo = 'TipoTributo';

implementation

end.
