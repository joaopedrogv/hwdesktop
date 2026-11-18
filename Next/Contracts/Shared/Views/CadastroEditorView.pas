unit CadastroEditorView;

interface

uses
  ViewFeedback, ValidationEntityOutputUnit;

type
  // A validacao volta ao editor que iniciou a gravacao.
  ICadastroEditorView = interface(IViewFeedback)
    ['{52F2C450-C05C-443B-A360-0DDF225ECC21}']
    procedure ShowValidation(const AValidacao: ValidationEntityOutput);
  end;

implementation

end.
