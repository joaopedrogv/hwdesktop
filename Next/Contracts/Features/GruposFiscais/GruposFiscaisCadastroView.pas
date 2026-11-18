unit GruposFiscaisCadastroView;

interface

uses
  CadastroEditorView, GrupoFiscalEtdUnit;

type
  // O grupo recebido nao transfere posse: o frame guarda apenas uma copia propria.
  IGruposFiscaisCadastroView = interface(ICadastroEditorView)
    ['{2F5A8C31-7D64-4B09-A5E7-1C93B4D6E820}']
    function PrepararInclusao: Boolean;
    function PrepararAlteracao(const AGrupo: GrupoFiscalEtd): Boolean;
  end;

implementation

end.
