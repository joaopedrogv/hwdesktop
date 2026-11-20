unit EventoDFe112150CadastroView;

interface

uses
  CadastroEditorView, EventoDFe112150EtdUnit, TipoEventoDFeUnit;

type
  // O evento recebido não transfere posse: o frame guarda apenas uma cópia própria.
  IEventoDFe112150CadastroView = interface(ICadastroEditorView)
    ['{E4AB8293-B5C6-41D7-8EE8-F39EAFB1C0D8}']
    function PrepararInclusao: Boolean;
    function PrepararAlteracao(const AEvento: EventoDFe112150Etd;
      AModo: TModoEventoDFe): Boolean;
  end;

implementation

end.
