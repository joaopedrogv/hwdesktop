unit EditorCadastro;

interface

uses
  Vcl.Controls;

type
  // A aba e dona do editor; o editor, do rascunho.
  IEditorCadastro = interface
    ['{6E0B5E59-6A1E-4A8A-9E1A-7F2F9B7C3D11}']
    // True enquanto o rascunho da aba ainda precisa ser gravado ou descartado.
    function HasPendingChanges: Boolean;
    // Foca o primeiro campo que deve receber a atencao do usuario; False quando o
    // editor nao consegue receber o foco.
    function TryFocus: Boolean;
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