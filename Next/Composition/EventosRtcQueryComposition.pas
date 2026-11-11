unit EventosRtcQueryComposition;

interface

uses
  FilterCriterion, IDatabaseReaderUnit;

// Cria o leitor de Eventos RTC na composicao. A empresa vem da sessao recebida
// no login e e obrigatoria. O adaptador devolve o leitor diretamente; a tela
// possui o leitor e o libera ao desvincular o conjunto.
function CreateEventosRtcReader(const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): IDatabaseReader;

implementation

uses
  System.SysUtils, NextSetup, NextQueryDefinition, EventosRtcDefinition;

const
  MissingContextMessage = 'O contexto da empresa nao foi informado.';

function CreateEventosRtcReader(const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): IDatabaseReader;
var
  Definition: TNextQueryDefinition;
  CompanyCode: Integer;
begin
  if (not NextSetupInstance.HasContext) or (NextSetupInstance.Adapter = nil) or
    (NextSetupInstance.SessionContext = nil) then
    raise Exception.Create(MissingContextMessage);

  CompanyCode := NextSetupInstance.SessionContext.EmpresaId;
  if CompanyCode <= 0 then
    raise Exception.Create(MissingContextMessage);

  Definition := CreateEventosRtcDefinition(CompanyCode, ACriteria,
    ASomenteNFeAutorizada);
  Result := NextSetupInstance.Adapter.CreateReader(Definition.Sql,
    Definition.Parameters);
end;

end.
