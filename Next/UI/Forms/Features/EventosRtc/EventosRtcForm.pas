unit EventosRtcForm;

interface

uses
  System.SysUtils, Vcl.StdCtrls, QueryResultForm, FilterCriterion,
  IDatabaseReaderUnit, GridColumnDefinition;

type
  // Fabrica especifica da tela. O formulario decide a opcao de autorizacao a
  // cada pesquisa e a composicao fornece o leitor correspondente.
  TEventosRtcReaderFactory = reference to function(
    const ACriteria: TFilterCriteria;
    ASomenteNFeAutorizada: Boolean): IDatabaseReader;

  // Tela de Eventos RTC. Herda a apresentacao generica e acrescenta apenas a
  // identidade da consulta e a opcao de restringir aos eventos autorizados; a
  // definicao, o leitor e a reserva do contexto sao injetados pela composicao.
  TfrmEventosRtc = class(TfrmQueryResult)
    chkSomenteAutorizada: TCheckBox;
  private
    FEventosRtcReaderFactory: TEventosRtcReaderFactory;
    function PesquisarComOpcao(
      const ACriteria: TFilterCriteria): IDatabaseReader;
  public
    procedure AttachEventosRtcReaderFactory(
      const AFactory: TEventosRtcReaderFactory;
      const AColumns: TGridColumnDefinitions; const ATitle: string);
  end;

implementation

{$R *.dfm}

const
  MissingEventosRtcReaderFactoryMessage =
    'A fabrica de leitores de Eventos RTC nao foi informada.';

procedure TfrmEventosRtc.AttachEventosRtcReaderFactory(
  const AFactory: TEventosRtcReaderFactory;
  const AColumns: TGridColumnDefinitions; const ATitle: string);
begin
  if not Assigned(AFactory) then
    raise Exception.Create(MissingEventosRtcReaderFactoryMessage);

  // A base recebe apenas uma fabrica de criterios. Este metodo consulta a opcao
  // atual da tela em cada chamada e a repassa para a fabrica especifica.
  AttachReaderFactory(PesquisarComOpcao, AColumns, ATitle);

  FEventosRtcReaderFactory := AFactory;
end;

function TfrmEventosRtc.PesquisarComOpcao(
  const ACriteria: TFilterCriteria): IDatabaseReader;
begin
  if not Assigned(FEventosRtcReaderFactory) then
    raise Exception.Create(MissingEventosRtcReaderFactoryMessage);

  Result := FEventosRtcReaderFactory(ACriteria, chkSomenteAutorizada.Checked);
end;

end.
