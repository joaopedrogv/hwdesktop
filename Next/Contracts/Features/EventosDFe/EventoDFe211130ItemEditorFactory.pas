unit EventoDFe211130ItemEditorFactory;

interface

uses
  System.Classes, Vcl.Controls, EditorCadastro, EventoDFe211130ItemView,
  EventoDFe211130ItemEtdUnit, NextMemoryDatasetDefinition;

type
  TEventoDFe211130ItemEditor = record
    Editor: TWinControl;
    View: IEventoDFe211130ItemView;
  end;

  IEventoDFe211130ItemEditorFactory = interface
    ['{E4B8C5A3-9A64-4E72-8D3C-5B6F7A9E2C41}']
    function Criar(AOwner: TComponent; AParent: TWinControl;
      const AHost: IEditorCadastroHost;
      const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>):
      TEventoDFe211130ItemEditor;
  end;

implementation

end.
