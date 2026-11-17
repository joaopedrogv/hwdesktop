unit OperacoesFiscaisIbsCbsForm;

interface

uses
  Vcl.StdCtrls, ConsultaBaseForm, PresenterConsultaBase, NextQueryDefinition,
  LocalPreferences;

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
    // Unica entrada da configuracao inicial: associa a definicao, configura os
    // filtros e entrega o apresentador a base por ultimo.
    procedure ConfigurarTela(const ADefinition: INextQueryDefinitionBase;
      const APresenter: TPresenterConsultaBase;
      const APreferences: ILocalPreferences);
  end;

implementation

{$R *.dfm}

function TfrmOperacoesFiscaisIbsCbs.IsLixeiraSearch: Boolean;
begin
  Result := chkLixeira.Checked;
end;

procedure TfrmOperacoesFiscaisIbsCbs.ConfigurarTela(
  const ADefinition: INextQueryDefinitionBase;
  const APresenter: TPresenterConsultaBase;
  const APreferences: ILocalPreferences);
const
  QueryTitle = 'Operações Fiscais IBS/CBS';
begin
  Attach(ADefinition, QueryTitle);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
  AssociarPresenter(APresenter);
end;

end.
