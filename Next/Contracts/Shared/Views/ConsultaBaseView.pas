unit ConsultaBaseView;

interface

uses
  ViewFeedback;

type
  IConsultaBaseView = interface(IViewFeedback)
    ['{2C7E9F41-6B3A-4D5E-8A1F-9C0D2E4B7A63}']
    // Reativa a aba sem repetir a autorizacao nem recarregar o registro; False quando a aba nao existe.
    function AtivarEdicao(const AChave: string): Boolean;
    // Reativa a aba de inclusao sem repetir a autorizacao nem recarregar a preparacao; False quando a aba nao existe.
    function AtivarInclusao: Boolean;
  end;

implementation

end.
