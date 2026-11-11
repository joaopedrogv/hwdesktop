unit EventosRtcQuery;

interface

uses
  IDataBaseConnectionUnit, IDatabaseReaderUnit, FilterCriterion;

type
  // Contrato de leitura de Eventos RTC. A empresa e recebida em cada chamada;
  // a definicao do SQL e a execucao ficam fora da tela e da sessao.
  IEventosRtcQuery = interface
    ['{A26E8DD7-E18F-4E1A-BE52-784128F37299}']
    function CriarLeitor(ACompanyCode: Integer;
      const ACriteria: TFilterCriteria;
      ASomenteNFeAutorizada: Boolean): IDatabaseReader;
  end;

  // Consulta de Eventos RTC. Usa a conexao do adaptador recebida na composicao;
  // nao abre conexao, nao conhece sessao nem tela e nao possui o leitor devolvido.
  TEventosRtcQuery = class(TInterfacedObject, IEventosRtcQuery)
  private
    FConnection: IDataBaseConnection;
  public
    constructor Create(AConnection: IDataBaseConnection);
    function CriarLeitor(ACompanyCode: Integer;
      const ACriteria: TFilterCriteria;
      ASomenteNFeAutorizada: Boolean): IDatabaseReader;
  end;

implementation

uses
  System.SysUtils, NextQueryDefinition, EventosRtcDefinition;

const
  MissingConnectionMessage =
    'A conexao da consulta de Eventos RTC nao foi informada.';

{ TEventosRtcQuery }

constructor TEventosRtcQuery.Create(AConnection: IDataBaseConnection);
begin
  inherited Create;
  if AConnection = nil then
    raise Exception.Create(MissingConnectionMessage);

  FConnection := AConnection;
end;

function TEventosRtcQuery.CriarLeitor(ACompanyCode: Integer;
  const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): IDatabaseReader;
var
  Definition: TNextQueryDefinition;
begin
  // A definicao monta SQL e parametros; a conexao apenas cria o leitor. Os
  // criterios e a opcao de autorizacao seguem o contrato da tela.
  Definition := CreateEventosRtcDefinition(ACompanyCode, ACriteria,
    ASomenteNFeAutorizada);
  Result := FConnection.CreateReader(Definition.Sql, Definition.Parameters);
end;

end.
