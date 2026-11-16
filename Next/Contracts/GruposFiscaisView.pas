unit GruposFiscaisView;

interface

uses
  ViewFeedback, ValidationEntityOutputUnit, GrupoFiscalEtdUnit,
  GrupoFiscalCadastro;

type
  // Contrato visual de Grupos Fiscais. Alem do feedback comum das telas Next,
  // reapresenta a aba de alteracao ja aberta e recebe o rascunho carregado para
  // a nova aba, alem do resultado de validacao do caso de uso para que o editor
  // da aba apresente cada campo com as suas mensagens. A chave identifica a
  // aba: vazia na inclusao e o identificador do registro na alteracao. Somente
  // o rascunho da alteracao atravessa a fronteira como entidade; as listas do
  // contexto Modern permanecem no apresentador.
  IGruposFiscaisView = interface(IViewFeedback)
    ['{7B2E4C1A-58D3-4F6B-9A2E-C4D1E8F30B57}']
    procedure ExibirValidacao(const AChave: string;
      const AValidacao: ValidationEntityOutput);
    // True quando a aba da chave ja existe e foi ativada: a alteracao nao
    // repete a autorizacao nem a carga do registro.
    function AtivarEdicao(const AChave: string): Boolean;
    // Abre a aba da chave e assume a posse do rascunho carregado, que a tela
    // libera junto com a aba.
    function AbrirEdicao(const AChave: string; var AGrupo: GrupoFiscalEtd;
      const AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
  end;

implementation

end.
