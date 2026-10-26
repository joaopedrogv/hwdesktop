unit SituacaoNFeEnumUnit;

interface

type
  SituacaoNFeEnum = (
    stVazio,
    stRejeitada,
    stEnviando,
    stEmProcessamento,
    stAutorizada,
    stCancelada,
    stDenegada,
    stInutilizada,
    stAInutilizar,
    stDuplicidade,
    stEmEPEC,
    stEmContingencia,
    stEmContingenciaRejeitada
  );

function SituacaoNFeToEnum(const Value: string): SituacaoNFeEnum;

const
  sitVazio           = '';
  sitRejeitada       = 'Rejeitada';
  sitEnviando        = 'Enviando';
  sitEmProcessamento = 'Em Processamento';
  sitAutorizada      = 'Autorizada';
  sitCancelada       = 'Cancelada';
  sitDenegada        = 'Denegada';
  sitInutilizada     = 'Inutilizada';
  sitAInutilizar     = 'A Inutilizar';
  sitDuplicidade     = 'Duplicidade';
  sitEmEPEC          = 'Em EPEC';
  sitContingencia    = 'Contingencia';
  sitContingRejeit   = 'Contingencia Rejeitada';

  SituacaoNFeEnumStr: array[SituacaoNFeEnum] of string = (
    sitVazio,
    sitRejeitada,
    sitEnviando,
    sitEmProcessamento,
    sitAutorizada,
    sitCancelada,
    sitDenegada,
    sitInutilizada,
    sitAInutilizar,
    sitDuplicidade,
    sitEmEPEC,
    sitContingencia,
    sitContingRejeit
  );

implementation

uses
  SysUtils, StrUtils;

function SituacaoNFeToEnum(const Value: string): SituacaoNFeEnum;
var
  eVal: SmallInt;
begin
  eVal := IndexText(Value, SituacaoNFeEnumStr);
  case eVal of
    0..12:
      Result := SituacaoNFeEnum(eVal);
    else
      Result := stVazio;
  end;

  if Length(SituacaoNFeEnumStr) <> 13 then
    raise Exception.Create('SituacaoNFeToEnum Check Size error');
end;

end.
