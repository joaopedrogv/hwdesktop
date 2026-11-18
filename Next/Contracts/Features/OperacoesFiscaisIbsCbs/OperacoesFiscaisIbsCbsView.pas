unit OperacoesFiscaisIbsCbsView;

interface

uses
  ConsultaBaseView, OperacoesFiscaisIbsCbsQueryDefinition;

type
  IOperacoesFiscaisIbsCbsView = interface(IConsultaBaseView)
    ['{84B0BEDF-5168-40D8-853A-DF60E4201C0B}']
    function AbrirInclusao: Boolean;
    function AbrirEdicao(const ASelecao: TOperacaoFiscalSelecionada): Boolean;
  end;

implementation

end.
