unit OperacoesFiscaisIbsCbsView;

interface

uses
  ViewFeedback, ValidationEntityOutputUnit, OperacaoFiscalIbsCbsEtdUnit;

type
  // Contrato visual de Operacoes Fiscais IBS/CBS. Alem do feedback comum das
  // telas Next, reapresenta a aba de alteracao ja aberta e recebe a operacao
  // carregada para que a nova aba monte o proprio rascunho, alem do resultado de
  // validacao do caso de uso para que o editor da aba apresente cada campo com as
  // suas mensagens. A chave identifica a aba de alteracao, sempre o identificador
  // do registro. A operacao recebida nao transfere posse: quem chamou libera a
  // entidade e a aba mantem apenas uma copia.
  IOperacoesFiscaisIbsCbsView = interface(IViewFeedback)
    ['{84B0BEDF-5168-40D8-853A-DF60E4201C0B}']
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    // True quando a aba da chave ja existe e foi ativada: a alteracao nao
    // repete a autorizacao nem a carga do registro.
    function AtivarEdicao(const AChave: string): Boolean;
    // Abre a aba da chave e copia a operacao carregada para o rascunho da aba. A
    // entidade recebida continua pertencendo a quem chamou; a aba monta os
    // proprios seletores ao ser preparada e informa a falha ao chamador.
    function AbrirEdicao(const AChave: string;
      const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
    // True quando a aba de inclusao ja existe e foi ativada: a inclusao nao
    // repete a autorizacao nem recarrega os seletores.
    function AtivarInclusao: Boolean;
    // Abre uma nova aba de inclusao; o editor cria o proprio rascunho e carrega
    // os seletores na preparacao.
    function AbrirInclusao: Boolean;
  end;

implementation

end.
