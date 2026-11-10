unit EventosRtcQueryComposition;

interface

uses
  FilterCriterion, IDatabaseReaderUnit;

// Cria o leitor de Eventos RTC na composicao. A empresa 1 e provisoria nesta
// etapa. Cada leitor recebe uma reserva propria do contexto, devolvida depois de
// o leitor interno ser liberado.
function CreateEventosRtcReader(const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): IDatabaseReader;

implementation

uses
  System.SysUtils, NextSetup, NextQueryDefinition, EventosRtcDefinition,
  ReaderContextLease;

const
  MissingContextMessage = 'O contexto da empresa nao foi informado.';
  ProvisionalCompanyCode = 1;

function CreateEventosRtcReader(const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): IDatabaseReader;
var
  Definition: TNextQueryDefinition;
  InnerReader: IDatabaseReader;
  ContextAcquired: Boolean;
begin
  if (not NextSetupInstance.HasContext) or (NextSetupInstance.Adapter = nil) then
    raise Exception.Create(MissingContextMessage);

  // A reserva e adquirida antes de criar o leitor. O wrapper passa a possuir o
  // leitor interno e a devolucao da reserva.
  NextSetupInstance.AcquireContext;
  ContextAcquired := True;
  InnerReader := nil;
  try
    Definition := CreateEventosRtcDefinition(ProvisionalCompanyCode, ACriteria,
      ASomenteNFeAutorizada);
    InnerReader := NextSetupInstance.Adapter.CreateReader(Definition.Sql,
      Definition.Parameters);

    Result := TReaderContextLease.Create(InnerReader,
      procedure
      begin
        NextSetupInstance.ReleaseContext;
      end);
    // Somente a partir da transferencia o wrapper responde pela reserva.
    ContextAcquired := False;
  finally
    // Sem transferencia, o leitor nao entregue e liberado antes de a reserva
    // ser devolvida uma unica vez pela composicao.
    InnerReader := nil;
    if ContextAcquired then
      NextSetupInstance.ReleaseContext;
  end;
end;

end.
