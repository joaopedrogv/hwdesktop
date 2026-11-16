unit GruposFiscaisView;

interface

uses
  ViewFeedback, ValidationEntityOutputUnit, GrupoFiscalEtdUnit,
  EmpresaOption;

type
  // Contrato visual de Grupos Fiscais. Alem do feedback comum das telas Next,
  // reapresenta a aba de alteracao ja aberta e recebe o grupo carregado para que
  // a nova aba monte o proprio rascunho, alem do resultado de validacao do caso
  // de uso para que o editor da aba apresente cada campo com as suas mensagens.
  // A chave identifica a aba de alteracao, sempre o identificador do registro.
  // O grupo recebido nao transfere posse: quem chamou libera a entidade e a aba
  // mantem apenas uma copia.
  IGruposFiscaisView = interface(IViewFeedback)
    ['{7B2E4C1A-58D3-4F6B-9A2E-C4D1E8F30B57}']
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    // True quando a aba da chave ja existe e foi ativada: a alteracao nao
    // repete a autorizacao nem a carga do registro.
    function AtivarEdicao(const AChave: string): Boolean;
    // Abre a aba da chave e copia o grupo carregado para o rascunho da aba.
    // A entidade recebida continua pertencendo a quem chamou.
    function AbrirEdicao(const AChave: string; const AGrupo: GrupoFiscalEtd;
      const AOpcoes: TEmpresaOptions): Boolean;
    // True quando a aba de inclusao ja existe e foi ativada: a inclusao nao
    // repete a autorizacao nem recarrega as empresas.
    function AtivarInclusao: Boolean;
    // Abre uma nova aba de inclusao e deixa o editor criar o proprio rascunho.
    function AbrirInclusao(const AOpcoes: TEmpresaOptions): Boolean;
  end;

implementation

end.
