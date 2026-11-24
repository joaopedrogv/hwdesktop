unit GruposFiscaisView;

interface

uses
  ConsultaBaseView, GruposFiscaisQueryDefinition;

type
  // Preparacao, carregamento e gravacao do registro pertencem ao cadastro.
  IGruposFiscaisView = interface(IConsultaBaseView)
    ['{7B2E4C1A-58D3-4F6B-9A2E-C4D1E8F30B57}']
    function AbrirEdicao(const ASelecao: TGrupoSelecionado): Boolean;
    function AbrirInclusao: Boolean;
  end;

implementation

end.
