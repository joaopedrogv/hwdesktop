unit OperacoesFiscaisIbsCbsCadastroView;

interface

uses
  CadastroEditorView, OperacaoFiscalIbsCbsEtdUnit;

type
  IOperacoesFiscaisIbsCbsCadastroView = interface(ICadastroEditorView)
    ['{3A7D9F24-8E61-4C58-9B03-6F1E2D8C5A17}']
    function PrepararInclusao: Boolean;
    function PrepararAlteracao(
      const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
    function FalhaCarga: string;
    procedure ExibirAnaliseCondicoes(const AResumo, ARelatorio: string);
  end;

implementation

end.
