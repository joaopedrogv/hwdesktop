unit OperacoesFiscaisIbsCbsView;

interface

uses
  IViewFeedbackUnit, OperacaoInternaEtdUnit, GrupoFiscalEtdUnit;

type
  IOperacoesFiscaisIbsCbsView = interface(IViewFeedback)
    ['{6C2B0F2E-5A7D-4E8B-9C1A-3D4F5A6B7C8D}']
    procedure ExibirListas(
      AOperacoesInternas: OperacoesInternasEtd;
      AGruposFiscais: GruposFiscaisEtd
    );
    procedure ExibirAnaliseCondicoes(const AResumo, ARelatorio: string);
  end;

implementation

end.
