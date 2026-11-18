unit EditorCadastro;

interface

uses
  Vcl.Controls, ValidationEntityOutputUnit;

type
  // A aba e dona do editor; o editor, do rascunho.
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

  // Editor que traz os proprios comandos Salvar/Cancelar; a ConsultaBase nao
  // cria o rodape dessa aba.
  IEditorCadastroComandos = interface
    ['{9C4A7E52-1B3D-4F68-8E27-5A6B1D9C3F02}']
  end;

  // Destino dos comandos concluidos no editor; o hospedeiro decide quando
  // fechar a aba.
  IEditorCadastroHost = interface
    ['{4E8B2D71-6C5A-4A93-B1F7-2D8E0C6A9B54}']
    procedure EditorSalvo(const AEditor: TWinControl);
    procedure EditorCancelado(const AEditor: TWinControl);
  end;

  TCriarEditorCadastroComandos = function(const AChave: string;
    AParent: TWinControl; const AHost: IEditorCadastroHost): TWinControl;

implementation

end.