unit EventosRtcForm;

interface

uses
  QueryResultForm;

type
  // Tela de Eventos RTC. Herda a apresentacao generica e acrescenta apenas a
  // identidade da consulta; a definicao, o leitor e a reserva do contexto sao
  // injetados pela composicao.
  TfrmEventosRtc = class(TfrmQueryResult)
  end;

implementation

{$R *.dfm}

end.
