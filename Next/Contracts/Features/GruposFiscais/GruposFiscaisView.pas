unit GruposFiscaisView;

interface

uses
  ConsultaBaseView, GruposFiscaisQueryDefinition;

type
  // A preparacao, o carregamento e a gravacao do registro pertencem ao cadastro,
  // que tem contrato proprio.
  IGruposFiscaisView = interface(IConsultaBaseView)
    ['{7B2E4C1A-58D3-4F6B-9A2E-C4D1E8F30B57}']
    function AbrirEdicao(const ASelecao: TGrupoSelecionado): Boolean;
    function AbrirInclusao: Boolean;
  end;

implementation

end.
