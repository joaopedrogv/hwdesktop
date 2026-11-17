unit EventosRtcForm;

interface

uses
  Vcl.StdCtrls, ConsultaBaseForm, LocalPreferences, NextQueryDefinition;

type
  // Tela de Eventos RTC. Herda a apresentacao generica e acrescenta apenas a
  // opcao de restringir aos eventos autorizados; a definicao da consulta e
  // injetada pela composicao.
  TfrmEventosRtc = class(TfrmConsultaBase)
    chkSomenteAutorizada: TCheckBox;
  public
    // Opcao lida pela definicao em cada pesquisa: vale para a proxima busca e
    // nao altera o resultado ja apresentado.
    function IsOnlyAuthorizedNFe: Boolean;
    // Unica entrada da configuracao inicial: associa a definicao e configura os
    // filtros desta tela.
    procedure ConfigurarTela(const ADefinition: INextQueryDefinitionBase;
      const APreferences: ILocalPreferences);
  end;

implementation

{$R *.dfm}

function TfrmEventosRtc.IsOnlyAuthorizedNFe: Boolean;
begin
  Result := chkSomenteAutorizada.Checked;
end;

procedure TfrmEventosRtc.ConfigurarTela(
  const ADefinition: INextQueryDefinitionBase;
  const APreferences: ILocalPreferences);
const
  QueryTitle = 'Eventos RTC';
begin
  Attach(ADefinition, QueryTitle);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
end;

end.
