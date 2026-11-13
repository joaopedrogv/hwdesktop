unit GruposFiscaisQuery;

interface

uses
  IDataSetReaderUnit, FilterCriterion;

type
  // Contrato de leitura de Grupos Fiscais. A montagem do SQL e a execucao ficam
  // fora da tela; o catalogo e global e nao depende de empresa.
  IGruposFiscaisQuery = interface
    ['{5B0F7D2A-3C64-4E19-9A8D-2F6C1B7E4D35}']
    function CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
  end;

  // Consulta de Grupos Fiscais. Usa a fabrica de leitores recebida na composicao;
  // nao abre conexao, nao conhece sessao, empresa ou tela e nao possui o leitor
  // devolvido.
  TGruposFiscaisQuery = class(TInterfacedObject, IGruposFiscaisQuery)
  private
    FReaderFactory: ISqlDataSetReaderFactory;
  public
    constructor Create(const AReaderFactory: ISqlDataSetReaderFactory);
    function CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
  end;

implementation

uses
  System.SysUtils, NextQueryDefinition, GruposFiscaisDefinition;

const
  MissingFactoryMessage =
    'A fabrica de leitores da consulta de Grupos Fiscais nao foi informada.';

{ TGruposFiscaisQuery }

constructor TGruposFiscaisQuery.Create(
  const AReaderFactory: ISqlDataSetReaderFactory);
begin
  inherited Create;
  if AReaderFactory = nil then
    raise Exception.Create(MissingFactoryMessage);

  FReaderFactory := AReaderFactory;
end;

function TGruposFiscaisQuery.CriarLeitor(
  const ACriteria: TFilterCriteria): IDataSetReader;
var
  Definition: TNextQueryDefinition;
begin
  // A definicao monta SQL e parametros; a fabrica apenas cria o leitor.
  Definition := CreateGruposFiscaisDefinition(ACriteria);
  Result := FReaderFactory.CreateReader(Definition.Sql, Definition.Parameters);
end;

end.
