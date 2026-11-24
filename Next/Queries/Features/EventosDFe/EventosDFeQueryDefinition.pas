unit EventosDFeQueryDefinition;

interface

uses
  Data.DB, FilterCriterion, NextDatasetDefinition, NextSqlQueryDefinition,
  DatasetColumnDefinition, GridColumnDefinition, FilterDefinition,
  IDataSetReaderUnit, DatasetResultOperations, ColumnLayoutPreferences,
  ISessionContextUnit, TipoEventoDFeUnit, StatusRegistroEnumUnit,
  EventoDFeStatusUnit;

type
  // Opção da tela lida a cada pesquisa: a marcação da lixeira pertence à view e pode mudar enquanto a janela permanece
  // aberta.
  TEventosDFeLixeiraSearch = function: Boolean of object;

  // Identificação do evento escolhido na grade, copiada por valor: nenhum objeto precisa ser liberado pela tela ou pelo
  // apresentador. O SeqId é a chave de negócio encaminhada ao host de autorização.
  TEventoDFeSelecionado = record
    Id: string;
    SeqId: Integer;
    NSeqEvento: Integer;
    FamiliaDocumento: TFamiliaDocumentoDFe;
    TipoEvento: TipoEventoDFe;
    ChaveDocumento: string;
    Ativo: StatusRegistroEnum;
    Status: TStatusEventoDFe;
  end;

  TEventosDFeQueryDefinition = class(TNextSqlQueryDefinitionBase,
    INextDatasetDefinition<TEventoDFeSelecionado>)
  private
    FSession: ISessionContext;
    FLixeiraSearch: TEventosDFeLixeiraSearch;
    function BuildColumns: TDatasetColumnDefinitions;
  protected
    procedure Configure(); override;
    function CreateQueryDefinition(const ACriteria: TFilterCriteria): TNextQueryDefinition; override;
  public
    // A empresa e a opção da lixeira são lidas a cada pesquisa, não na construção.
    constructor Create(AReaderFactory: ISqlDataSetReaderFactory; AOperation: IDataSetResultOperations;
      ALayoutPreferences: IColumnLayoutPreferences; ASession: ISessionContext;
      const ALixeiraSearch: TEventosDFeLixeiraSearch);
    function TryGetSelected(out ASelected: TEventoDFeSelecionado): Boolean;
  end;

implementation

uses
  System.SysUtils, QueryResultUnit, ParameterValueUnit, QueryFilterSqlBuilder;

const
  LayoutDatasetId = 'eventos.dfe';
  FilterMarker = '/*FILTROS*/';
  EmpresaParameterName = 'EMPRESA';
  AtivoParameterName = 'ATIVO';
  OrderSql = sLineBreak + 'order by SEQID';

// Os literais vêm apenas das funções de exibição; nenhum valor de usuário entra na montagem do SQL.
function FamiliaDocumentoDisplaySql: string;
var
  Familia: TFamiliaDocumentoDFe;
begin
  Result := 'case FAMILIA_DOCUMENTO';
  for Familia := Low(TFamiliaDocumentoDFe) to High(TFamiliaDocumentoDFe) do
    Result := Result + ' when ' + IntToStr(FamiliaDocumentoDFeCodigo(Familia)) + ' then ' +
      QuotedStr(FamiliaDocumentoDFeDisplay(Familia));
  Result := Result + ' end';
end;

// Os códigos fiscais não são contíguos: a lista percorre apenas as opções implementadas.
function TipoEventoDisplaySql: string;
var
  Opcoes: TipoEventoDFeArray;
  Indice: Integer;
begin
  Result := 'case TIPO_EVENTO';
  Opcoes := TipoEventoDFeOpcoes;
  for Indice := 0 to High(Opcoes) do
    Result := Result + ' when ' + IntToStr(TipoEventoDFeCodigo(Opcoes[Indice])) + ' then ' +
      QuotedStr(TipoEventoDFeDisplay(Opcoes[Indice]));
  Result := Result + ' end';
end;

function EventosDFeSql: string;
begin
  Result := 'select SEQID, ID, FAMILIA_DOCUMENTO, FAMILIA_DOCUMENTO_DESCRICAO,' + sLineBreak +
    '       TIPO_EVENTO, TIPO_EVENTO_DESCRICAO, CHAVE_DOCUMENTO, ATIVO, STATUS, NSEQ_EVENTO,' + sLineBreak +
    '       DATA_CADASTRO, DATA_ALTERACAO' + sLineBreak +
    'from (' + sLineBreak +
    '  select e.SEQID, e.ID, e.FAMILIA_DOCUMENTO,' + sLineBreak +
    '         ' + FamiliaDocumentoDisplaySql + ' as FAMILIA_DOCUMENTO_DESCRICAO,' + sLineBreak +
    '         e.TIPO_EVENTO,' + sLineBreak +
    '         ' + TipoEventoDisplaySql + ' as TIPO_EVENTO_DESCRICAO,' + sLineBreak +
    '         e.CHAVE_DOCUMENTO, e.ATIVO, e.STATUS, e.NSEQ_EVENTO, e.DATA_CADASTRO, e.DATA_ALTERACAO' + sLineBreak +
    '  from EVENTOS_DFE e' + sLineBreak +
    '  where e.COD_EMPRESA = :' + EmpresaParameterName + sLineBreak +
    '    and e.ATIVO = :' + AtivoParameterName + sLineBreak +
    ') q' + sLineBreak +
    'where 1 = 1' + sLineBreak +
    FilterMarker;
end;

constructor TEventosDFeQueryDefinition.Create(AReaderFactory: ISqlDataSetReaderFactory;
  AOperation: IDataSetResultOperations; ALayoutPreferences: IColumnLayoutPreferences;
  ASession: ISessionContext; const ALixeiraSearch: TEventosDFeLixeiraSearch);
begin
  inherited Create(AReaderFactory, AOperation, ALayoutPreferences);

  if ASession = nil then
    raise Exception.Create('A sessão da consulta de Eventos DF-e não foi informada.');
  if not Assigned(ALixeiraSearch) then
    raise Exception.Create('A opção da consulta de Eventos DF-e não foi informada.');

  FSession := ASession;
  FLixeiraSearch := ALixeiraSearch;
end;

function TEventosDFeQueryDefinition.BuildColumns: TDatasetColumnDefinitions;
begin
  // O tipo de evento permanece sempre visível; as chaves internas apenas alimentam a linha corrente da grade.
  Result := QueryColumns([
    QueryColumn('SEQID', 'Código', fftInteger, 80),
    QueryColumn('FAMILIA_DOCUMENTO_DESCRICAO', 'Documento', fftString, 130),
    QueryColumn('TIPO_EVENTO_DESCRICAO', 'Tipo de Evento', fftString, 260,
      qcaDefault, gcbAlwaysVisible),
    QueryColumn('CHAVE_DOCUMENTO', 'Chave da NF-e', fftString, 330),
    QueryColumn('DATA_CADASTRO', 'Data de cadastro', fftDateTime, 130),
    QueryColumn('DATA_ALTERACAO', 'Data de alteração', fftDateTime, 130),
    // Situação exibe o texto gravado por StatusEventoDFeParaTexto; sem filtro nesta entrega.
    QueryColumn('STATUS', 'Situação', fftString, 110, qcaDefault, gcbConfigurableVisible, '', False),
    QueryColumn('ID', 'ID', fftString, 0, qcaDefault, gcbAlwaysHidden, '', False),
    QueryColumn('FAMILIA_DOCUMENTO', 'Documento', fftInteger, 0, qcaDefault, gcbAlwaysHidden, '', False),
    QueryColumn('TIPO_EVENTO', 'Tipo de Evento', fftInteger, 0, qcaDefault, gcbAlwaysHidden, '', False),
    QueryColumn('ATIVO', 'Situação', fftInteger, 0, qcaDefault, gcbAlwaysHidden, '', False),
    QueryColumn('NSEQ_EVENTO', 'Sequência do evento', fftInteger, 0, qcaDefault, gcbAlwaysHidden, '', False)
  ]);
end;

procedure TEventosDFeQueryDefinition.Configure();
var
  Columns: TDatasetColumnDefinitions;
begin
  FDatasetId := LayoutDatasetId;

  Columns := BuildColumns;
  FColumnsDef := BuildGridColumns(Columns);
  // Os filtros usam os mesmos aliases das colunas; o estado do registro não está aqui, porque a lixeira é escolhida em
  // cada pesquisa.
  FFiltersDef := BuildFilterDefinition(Columns, True);
end;

function TEventosDFeQueryDefinition.CreateQueryDefinition(
  const ACriteria: TFilterCriteria): TNextQueryDefinition;
var
  Builder: IParametersBuilder;
  StatusPesquisa: StatusRegistroEnum;
begin
  if FLixeiraSearch() then
    StatusPesquisa := saLixeira
  else
    StatusPesquisa := saAtivo;

  Builder := ParametersBuilder.Create(2);
  Builder.ByName(EmpresaParameterName, FSession.EmpresaId);
  Builder.ByName(AtivoParameterName, Ord(StatusPesquisa));

  // Os critérios da tela viram condições parametrizadas; campo, operador ou quantidade de valores fora do contrato
  // interrompem a montagem.
  Result := TQueryFilterSqlBuilder.Build(EventosDFeSql, FilterMarker, Builder.Build, FFiltersDef, ACriteria);
  Result.Sql := Result.Sql + OrderSql;
end;

function TEventosDFeQueryDefinition.TryGetSelected(out ASelected: TEventoDFeSelecionado): Boolean;
var
  DataSet: TDataSet;
  Consulta: QueryResult;
  CodigoTipo: Integer;
begin
  ASelected := Default(TEventoDFeSelecionado);
  Result := False;

  DataSet := GetDataSet;
  if (DataSet = nil) or (not DataSet.Active) or DataSet.IsEmpty then
    Exit;

  // A grade fornece o dataset: o wrapper apenas lê a linha corrente e não participa da posse. A família e o tipo fora
  // do domínio desta entrega não identificam registro e não interrompem a navegação.
  Consulta := QueryResult.Create(DataSet, '', False);
  try
    if Consulta.FieldAsInteger('FAMILIA_DOCUMENTO') <> FamiliaDocumentoDFeCodigo(fdNFe) then
      Exit;

    CodigoTipo := Consulta.FieldAsInteger('TIPO_EVENTO');
    if not TipoEventoDFeSuportado(CodigoTipo) then
      Exit;

    ASelected.Id := Consulta.FieldAsString('ID');
    ASelected.SeqId := Consulta.FieldAsInteger('SEQID');
    ASelected.NSeqEvento := Consulta.FieldAsInteger('NSEQ_EVENTO');
    ASelected.FamiliaDocumento := fdNFe;
    ASelected.TipoEvento := TipoEventoDFeFromCodigo(CodigoTipo);
    ASelected.ChaveDocumento := Consulta.FieldAsString('CHAVE_DOCUMENTO');
    ASelected.Ativo := StatusRegistroUtils.FromInt(Consulta.FieldAsInteger('ATIVO'));
    if not TryTextoParaStatusEventoDFe(Consulta.FieldAsString('STATUS'), ASelected.Status) then
      Exit;

    Result := True;
  finally
    Consulta.Free;
  end;
end;

end.
