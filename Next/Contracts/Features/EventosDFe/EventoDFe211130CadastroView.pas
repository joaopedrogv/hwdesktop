unit EventoDFe211130CadastroView;

interface

uses
  CadastroEditorView, EventoDFe211130EtdUnit;

type
  // O evento recebido não transfere posse: o frame guarda apenas uma cópia própria.
  IEventoDFe211130CadastroView = interface(ICadastroEditorView)
    ['{CA021175-7312-444D-84B7-C811CB1DB554}']
    function PrepararInclusao: Boolean;
    function PrepararAlteracao(const AEvento: EventoDFe211130Etd): Boolean;
  end;

implementation

end.
