unit EventoDFe211130ItemView;

interface

uses
  CadastroEditorView, EventoDFe211130ItemEtdUnit;

type
  IEventoDFe211130ItemView = interface(ICadastroEditorView)
    ['{D9F2B6C7-A0B1-4C2D-9E3E-E8ECF5A6B42D}']
    procedure PrepararItem(const AItem: EventoDFe211130ItemEtd);
    function ColetarItem(out AItem: EventoDFe211130ItemEtd): Boolean;
  end;

implementation

end.
