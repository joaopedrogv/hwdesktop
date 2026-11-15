unit GruposFiscaisView;

interface

uses
  ViewFeedback, ValidationEntityOutputUnit;

type
  // Contrato visual de Grupos Fiscais. Alem do feedback comum das telas Next,
  // recebe o resultado de validacao do caso de uso para que o editor apresente
  // cada campo com as suas mensagens. Somente esse resultado atravessa a
  // fronteira da apresentacao: as entidades e listas do contexto Modern
  // permanecem no apresentador.
  IGruposFiscaisView = interface(IViewFeedback)
    ['{7B2E4C1A-58D3-4F6B-9A2E-C4D1E8F30B57}']
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
  end;

implementation

end.
