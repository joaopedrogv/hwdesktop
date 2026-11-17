unit EditorCadastro;

interface

uses
  Vcl.Controls, ValidationEntityOutputUnit;

type
  // Contrato comum do editor de uma aba de cadastro da ConsultaBase. A base
  // consulta pendencias, encaminha o foco e entrega o resultado de validacao da
  // gravacao sem conhecer o frame de cada funcionalidade. A aba continua sendo a
  // dona do editor e do rascunho.
  IEditorCadastro = interface
    ['{6E0B5E59-6A1E-4A8A-9E1A-7F2F9B7C3D11}']
    // True enquanto o rascunho da aba ainda precisa ser gravado ou descartado.
    function HasPendingChanges: Boolean;
    // Foca o primeiro campo que deve receber a atencao do usuario; False quando o
    // editor nao consegue receber o foco.
    function TryFocus: Boolean;
    // Apresenta o resultado de validacao produzido pelo caso de uso na gravacao
    // da propria aba.
    procedure ShowValidation(const AValidacao: ValidationEntityOutput);
  end;

  // Cria o editor de uma aba de cadastro e o entrega pronto para a preparacao.
  // AParent e a area de rolagem que passa a possuir o controle; devolver nil
  // recusa a aba. A funcao nao retem a aba nem o editor.
  TCriarEditorCadastro = reference to function(const AChave: string;
    AParent: TWinControl): TWinControl;

implementation

end.