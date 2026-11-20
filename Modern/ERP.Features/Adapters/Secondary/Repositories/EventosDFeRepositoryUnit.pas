unit EventosDFeRepositoryUnit;

interface

uses
  IEventosDFeRepositoryUnit,
  BaseRepositoryUnit,
  EventoDFeEtdUnit;

type
  {$IFDEF INTF_ON}
  EventosDFeRepository = class(BaseRepository, IEventosDFeRepository)
  {$ELSE}
  EventosDFeRepository = class(IEventosDFeRepository)
  {$ENDIF}
  public
    function Inserir(const AEvento: EventoDFeEtd): EventoDFeEtd; override;
    function Atualizar(const AEvento: EventoDFeEtd): EventoDFeEtd; override;
    function ObterPorId(const AId: string; AEmpresaId: Integer): EventoDFeEtd; override;
    function ObterProximoSeqId(AEmpresaId: Integer): Integer; override;
    procedure RemoverLogicamente(const AId: string; AEmpresaId: Integer); override;
  end;

implementation

uses
  SysUtils,
  IDataBaseConnectionUnit,
  ParameterValueUnit,
  QueryResultUnit,
  StatusRegistroEnumUnit,
  TipoEventoDFeUnit;

{ EventosDFeRepository }

function EventosDFeRepository.Inserir(const AEvento: EventoDFeEtd): EventoDFeEtd;
var
  EventoId: string;
begin
  EventoId := GenerateNewUUID();

  FConnection.ExecuteCommand(
    'INSERT INTO EVENTOS_DFE ' +
    ' (ID, SEQID, FAMILIA_DOCUMENTO, TIPO_EVENTO, CHAVE_DOCUMENTO, COD_EMPRESA, ATIVO) ' +
    ' VALUES ' +
    ' (:ID, :SEQID, :FAMILIA_DOCUMENTO, :TIPO_EVENTO, :CHAVE_DOCUMENTO, :COD_EMPRESA, :ATIVO)',
    ParametersBuilder.Create(7)
      .ByName('ID', EventoId)
      .ByName('SEQID', AEvento.SeqId)
      .ByName('FAMILIA_DOCUMENTO', FamiliaDocumentoDFeCodigo(AEvento.FamiliaDocumento))
      .ByName('TIPO_EVENTO', TipoEventoDFeCodigo(AEvento.TipoEvento))
      .ByName('CHAVE_DOCUMENTO', AEvento.ChaveDocumento)
      .ByName('COD_EMPRESA', AEvento.CodEmpresa)
      .ByName('ATIVO', Ord(AEvento.Ativo))
      .Build()
  );

  Result := ObterPorId(EventoId, AEvento.CodEmpresa);

  if Result = nil then
    raise Exception.Create('Evento DF-e não encontrado após a inserção.');
end;

function EventosDFeRepository.Atualizar(const AEvento: EventoDFeEtd): EventoDFeEtd;
begin
  FConnection.ExecuteCommand(
    'UPDATE EVENTOS_DFE ' +
    ' SET CHAVE_DOCUMENTO = :CHAVE_DOCUMENTO, ' +
    '     ATIVO = :ATIVO, ' +
    '     DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
    ' WHERE ID = :ID ' +
    '   AND COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(4)
      .ByName('CHAVE_DOCUMENTO', AEvento.ChaveDocumento)
      .ByName('ATIVO', Ord(AEvento.Ativo))
      .ByName('ID', AEvento.Id)
      .ByName('COD_EMPRESA', AEvento.CodEmpresa)
      .Build()
  );

  Result := ObterPorId(AEvento.Id, AEvento.CodEmpresa);

  if Result = nil then
    raise Exception.Create('Evento DF-e não encontrado após a atualização.');
end;

function EventosDFeRepository.ObterPorId(const AId: string;
  AEmpresaId: Integer): EventoDFeEtd;
var
  Q: QueryResult;
begin
  Result := nil;

  Q := FConnection.CreateQuery(
    'SELECT ID, SEQID, FAMILIA_DOCUMENTO, TIPO_EVENTO, CHAVE_DOCUMENTO, ' +
    '       COD_EMPRESA, DATA_CADASTRO, DATA_ALTERACAO, ATIVO ' +
    ' FROM EVENTOS_DFE ' +
    ' WHERE ID = :ID ' +
    '   AND COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(2)
      .ByName('ID', AId)
      .ByName('COD_EMPRESA', AEmpresaId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Exit;

    Result := EventoDFeEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsInteger('SEQID'),
      FamiliaDocumentoDFeFromCodigo(Q.FieldAsInteger('FAMILIA_DOCUMENTO')),
      TipoEventoDFeFromCodigo(Q.FieldAsInteger('TIPO_EVENTO')),
      Q.FieldAsString('CHAVE_DOCUMENTO'),
      Q.FieldAsInteger('COD_EMPRESA'),
      StatusRegistroUtils.FromInt(Q.FieldAsInteger('ATIVO')),
      Q.FieldAsDateTime('DATA_CADASTRO'),
      Q.FieldAsDateTime('DATA_ALTERACAO')
    );
  finally
    Q.Free();
  end;
end;

function EventosDFeRepository.ObterProximoSeqId(AEmpresaId: Integer): Integer;
begin
  Result := FConnection.ExecuteScalar(
    'SELECT COALESCE(MAX(SEQID), 0) + 1 ' +
    ' FROM EVENTOS_DFE ' +
    ' WHERE COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(1)
      .ByName('COD_EMPRESA', AEmpresaId)
      .Build()
  ).AsInteger;
end;

procedure EventosDFeRepository.RemoverLogicamente(const AId: string;
  AEmpresaId: Integer);
begin
  FConnection.ExecuteCommand(
    'UPDATE EVENTOS_DFE ' +
    ' SET ATIVO = 0, ' +
    '     DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
    ' WHERE ID = :ID ' +
    '   AND COD_EMPRESA = :COD_EMPRESA ' +
    '   AND ATIVO = 1',
    ParametersBuilder.Create(2)
      .ByName('ID', AId)
      .ByName('COD_EMPRESA', AEmpresaId)
      .Build()
  );
end;

end.
