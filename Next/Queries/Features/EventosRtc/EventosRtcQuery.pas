unit EventosRtcQuery;

interface

uses
  IDataSetReaderUnit, FilterCriterion;

type
  // Contrato de leitura de Eventos RTC. A empresa e recebida em cada chamada;
  // a definicao do SQL e a execucao ficam fora da tela e da sessao.
  IEventosRtcQuery = interface
    ['{A26E8DD7-E18F-4E1A-BE52-784128F37299}']
    function CriarLeitor(ACompanyCode: Integer;
      const ACriteria: TFilterCriteria;
      ASomenteNFeAutorizada: Boolean): IDataSetReader;
  end;

  // Consulta de Eventos RTC. Usa a fabrica de leitores recebida na composicao;
  // nao abre conexao, nao conhece sessao nem tela e nao possui o leitor devolvido.
  TEventosRtcQuery = class(TInterfacedObject, IEventosRtcQuery)
  private
    FReaderFactory: ISqlDataSetReaderFactory;
  public
    constructor Create(const AReaderFactory: ISqlDataSetReaderFactory);
    function CriarLeitor(ACompanyCode: Integer;
      const ACriteria: TFilterCriteria;
      ASomenteNFeAutorizada: Boolean): IDataSetReader;
  end;

implementation

uses
  System.SysUtils, NextQueryDefinition, EventosRtcDefinition;

const
  MissingFactoryMessage =
    'A fabrica de leitores da consulta de Eventos RTC nao foi informada.';

{ TEventosRtcQuery }

constructor TEventosRtcQuery.Create(
  const AReaderFactory: ISqlDataSetReaderFactory);
begin
  inherited Create;
  if AReaderFactory = nil then
    raise Exception.Create(MissingFactoryMessage);

  FReaderFactory := AReaderFactory;
end;

function TEventosRtcQuery.CriarLeitor(ACompanyCode: Integer;
  const ACriteria: TFilterCriteria;
  ASomenteNFeAutorizada: Boolean): IDataSetReader;
var
  Definition: TNextQueryDefinition;
begin
  // A definicao monta SQL e parametros; a fabrica apenas cria o leitor. Os
  // criterios e a opcao de autorizacao seguem o contrato da tela.
  Definition := CreateEventosRtcDefinition(ACompanyCode, ACriteria,
    ASomenteNFeAutorizada);
  Result := FReaderFactory.CreateReader(Definition.Sql, Definition.Parameters);
end;

end.
