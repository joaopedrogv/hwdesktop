unit OperacoesFiscaisIbsCbsForm;

interface

uses
  Vcl.StdCtrls, ConsultaBaseForm, PresenterConsultaBase, NextQueryDefinition;

type
  // Tela de consulta das Operacoes Fiscais IBS/CBS. Herda a apresentacao
  // generica e acrescenta apenas a opcao de pesquisar a lixeira; a definicao e
  // o apresentador sao injetados pela composicao.
  TfrmOperacoesFiscaisIbsCbs = class(TfrmConsultaBase)
    chkLixeira: TCheckBox;
  public
    // Opcao lida pela definicao em cada pesquisa: vale para a proxima busca e
    // nao altera o resultado ja apresentado.
    function IsLixeiraSearch: Boolean;
    // Entrega a definicao e o apresentador a base, que passa a possuir o
    // apresentador a partir da associacao aceita.
    procedure AttachPresenter(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase; const ATitle: string);
  end;

implementation

{$R *.dfm}

function TfrmOperacoesFiscaisIbsCbs.IsLixeiraSearch: Boolean;
begin
  Result := chkLixeira.Checked;
end;

procedure TfrmOperacoesFiscaisIbsCbs.AttachPresenter(
  APresenter: TPresenterConsultaBase;
  const ADefinition: INextQueryDefinitionBase; const ATitle: string);
begin
  AssociarPresenter(APresenter, ADefinition, ATitle);
end;

end.
