unit GruposFiscaisView;

interface

uses
  ViewFeedback, GrupoFiscalCadastro;

type
  // Contrato visual de Grupos Fiscais. Alem do feedback comum das telas Next,
  // permite que o apresentador entregue os erros de validacao ao editor da
  // inclusao, que conhece cada campo.
  IGruposFiscaisView = interface(IViewFeedback)
    ['{7B2E4C1A-58D3-4F6B-9A2E-C4D1E8F30B57}']
    procedure ExibirErrosDeCampo(const AErros: TGrupoFiscalFieldErrors);
  end;

implementation

end.
