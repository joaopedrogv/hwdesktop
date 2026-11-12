unit EventosRtcForm;

interface

uses
  System.SysUtils, Vcl.StdCtrls, QueryResultForm, FilterCriterion,
  IDataSetReaderUnit, GridColumnDefinition, EventosRtcPresenter,
  QueryResultOperations;

type
  // Tela de Eventos RTC. Herda a apresentacao generica e acrescenta apenas a
  // identidade da consulta e a opcao de restringir aos eventos autorizados; o
  // apresentador e o leitor correspondente sao injetados pela composicao.
  TfrmEventosRtc = class(TfrmQueryResult)
    chkSomenteAutorizada: TCheckBox;
  private
    FPresenter: TEventosRtcPresenter;
    function PesquisarEventos(
      const ACriteria: TFilterCriteria): IDataSetReader;
  public
    destructor Destroy; override;
    procedure AttachPresenter(APresenter: TEventosRtcPresenter;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil);
  end;

implementation

{$R *.dfm}

const
  MissingPresenterMessage =
    'O apresentador de Eventos RTC nao foi informado.';

destructor TfrmEventosRtc.Destroy;
begin
  try
    FreeAndNil(FPresenter);
  finally
    inherited;
  end;
end;

procedure TfrmEventosRtc.AttachPresenter(APresenter: TEventosRtcPresenter;
  const AColumns: TGridColumnDefinitions; const ATitle: string;
  AOperations: IQueryResultOperations = nil);
begin
  if APresenter = nil then
    raise Exception.Create(MissingPresenterMessage);

  // A base recebe apenas o metodo de pesquisa; a opcao atual e consultada a
  // cada busca. A tela assume o apresentador transiente so depois da associacao
  // aceita, para que uma falha nao deixe posse parcial. As operacoes recebidas
  // seguem o mesmo caminho de ordenacao da previa e nao habilitam marcacao.
  AttachReaderFactory(PesquisarEventos, AColumns, ATitle, AOperations, False);
  FPresenter := APresenter;
end;

function TfrmEventosRtc.PesquisarEventos(
  const ACriteria: TFilterCriteria): IDataSetReader;
begin
  if FPresenter = nil then
    raise Exception.Create(MissingPresenterMessage);

  Result := FPresenter.CriarLeitor(ACriteria, chkSomenteAutorizada.Checked);
end;

end.
