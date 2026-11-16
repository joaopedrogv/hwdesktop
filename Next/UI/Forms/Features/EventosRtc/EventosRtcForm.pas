unit EventosRtcForm;

interface

uses
  Vcl.StdCtrls, ConsultaBaseForm;

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
  end;

implementation

{$R *.dfm}

function TfrmEventosRtc.IsOnlyAuthorizedNFe: Boolean;
begin
  Result := chkSomenteAutorizada.Checked;
end;

end.
