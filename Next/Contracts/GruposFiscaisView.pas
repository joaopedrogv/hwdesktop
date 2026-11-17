unit GruposFiscaisView;

interface

uses
  ConsultaBaseView, GrupoFiscalEtdUnit;

type
  // Contrato visual de Grupos Fiscais. Recebe o grupo carregado para que a nova
  // aba monte o proprio rascunho e carregue as empresas na preparacao. A chave
  // identifica a aba de alteracao, sempre o identificador do registro. O grupo
  // recebido nao transfere posse: quem chamou libera a entidade e a aba mantem
  // apenas uma copia.
  IGruposFiscaisView = interface(IConsultaBaseView)
    ['{7B2E4C1A-58D3-4F6B-9A2E-C4D1E8F30B57}']
    // Abre a aba da chave e copia o grupo carregado para o rascunho da aba. A
    // entidade recebida continua pertencendo a quem chamou; a aba monta o
    // proprio seletor de empresas ao ser preparada e informa a falha ao chamador.
    function AbrirEdicao(const AChave: string;
      const AGrupo: GrupoFiscalEtd): Boolean;
    // Abre uma nova aba de inclusao; o editor cria o proprio rascunho e carrega
    // as empresas na preparacao.
    function AbrirInclusao: Boolean;
  end;

implementation

end.
