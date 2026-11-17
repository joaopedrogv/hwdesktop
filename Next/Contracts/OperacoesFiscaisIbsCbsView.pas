unit OperacoesFiscaisIbsCbsView;

interface

uses
  ConsultaBaseView, OperacaoFiscalIbsCbsEtdUnit;

type
  // Contrato visual de Operacoes Fiscais IBS/CBS. Recebe a operacao carregada
  // para que a nova aba monte o proprio rascunho. A chave identifica a aba de
  // alteracao, sempre o identificador do registro. A operacao recebida nao
  // transfere posse: quem chamou libera a entidade e a aba mantem apenas uma
  // copia.
  IOperacoesFiscaisIbsCbsView = interface(IConsultaBaseView)
    ['{84B0BEDF-5168-40D8-853A-DF60E4201C0B}']
    // Abre a aba da chave e copia a operacao carregada para o rascunho da aba. A
    // entidade recebida continua pertencendo a quem chamou; a aba monta os
    // proprios seletores ao ser preparada e informa a falha ao chamador.
    function AbrirEdicao(const AChave: string;
      const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
    // Abre uma nova aba de inclusao; o editor cria o proprio rascunho e carrega
    // os seletores na preparacao.
    function AbrirInclusao: Boolean;
  end;

implementation

end.
