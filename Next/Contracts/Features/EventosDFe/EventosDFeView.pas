unit EventosDFeView;

interface

uses
  ConsultaBaseView, EventosDFeQueryDefinition, TipoEventoDFeUnit;

type
  IEventosDFeView = interface(IConsultaBaseView)
    ['{D39A7182-A4B5-40C6-9DD7-E28D9EAFB0C7}']
    // A view apresenta o modal de tipo; a permissão é verificada pelo apresentador antes da chamada.
    function SelecionarTipoEvento(out ATipo: TipoEventoDFe): Boolean;
    function IsLixeiraSearch: Boolean;
    function AbrirInclusao(const AChave, ATitulo: string): Boolean;
    function AbrirEdicao(const ASelecao: TEventoDFeSelecionado): Boolean;
  end;

implementation

end.
