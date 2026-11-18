unit EventosRtcForm;

interface

uses
  Vcl.StdCtrls, ConsultaBaseForm, LocalPreferences, NextQueryDefinition;

type
  // Acrescenta a restricao aos eventos autorizados a consulta generica.
  TfrmEventosRtc = class(TfrmConsultaBase)
    chkSomenteAutorizada: TCheckBox;
  public
    // Opcao lida pela definicao em cada pesquisa: vale para a proxima busca e nao altera o resultado ja apresentado.
    function IsOnlyAuthorizedNFe: Boolean;
    procedure ConfigurarTela(const ADefinition: INextQueryDefinitionBase; const APreferences: ILocalPreferences);
  end;

implementation

{$R *.dfm}

function TfrmEventosRtc.IsOnlyAuthorizedNFe: Boolean;
begin
  Result := chkSomenteAutorizada.Checked;
end;

procedure TfrmEventosRtc.ConfigurarTela(const ADefinition: INextQueryDefinitionBase;
  const APreferences: ILocalPreferences);
begin
  Attach(ADefinition, 'Eventos RTC');
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
end;

end.
