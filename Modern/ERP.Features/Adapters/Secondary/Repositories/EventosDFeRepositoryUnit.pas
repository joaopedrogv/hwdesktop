unit EventosDFeRepositoryUnit;

interface

uses
  IEventosDFeRepositoryUnit,
  BaseRepositoryUnit,
  EventoDFeEtdUnit,
  TipoEventoDFeUnit,
  EventoDFeStatusUnit,
  EventoDFeTransmissaoTypesUnit;

type
  EventosDFeRepository = class(IEventosDFeRepository)
  public
    function Inserir(const AEvento: EventoDFeEtd): EventoDFeEtd; override;
    function Atualizar(const AEvento: EventoDFeEtd): EventoDFeEtd; override;
    function ObterPorId(const AId: string; AEmpresaId: Integer): EventoDFeEtd; override;
    function ObterProximoSeqId(AEmpresaId: Integer): Integer; override;
    procedure RemoverLogicamente(const AId: string; AEmpresaId: Integer); override;
    function ObterConflitoEvento(const ACodEmpresa: Integer;
      const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
      const AIdIgnorado: string): TEventoDFeConflito; override;
    function GarantirNseqEvento(const AId: string;
      const ACodEmpresa: Integer; const AChaveDocumento: string;
      const ATipoEvento: TipoEventoDFe): Integer; override;
    function RegistrarEnvio(const AId: string; const AAmbiente: Integer;
      const ACnpj: string; const ACOrgao, ATpAutor, ACOrgaoAutor: Integer): Integer;
      override;
    function ConcluirEvento(const AId: string;
      const AStatusEsperado, ANovoStatus: TStatusEventoDFe;
      const AXMotivo, ANProt: string; const ADhRegEvento: TDateTime): Integer;
      override;
  end;

implementation

uses
  SysUtils,
  IDataBaseConnectionUnit,
  ParameterValueUnit,
  QueryResultUnit,
  StatusRegistroEnumUnit,
  EValidacaoNegocioUnit;

const
  ID_IGNORADO_INCLUSAO = '00000000-0000-0000-0000-000000000000';

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
    '       COD_EMPRESA, DATA_CADASTRO, DATA_ALTERACAO, ATIVO, ' +
    '       NSEQ_EVENTO, STATUS ' +
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
    Result.NseqEvento := Q.FieldAsInteger('NSEQ_EVENTO');
    Result.Status := TextoParaStatusEventoDFe(Q.FieldAsString('STATUS'));
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

function EventosDFeRepository.ObterConflitoEvento(const ACodEmpresa: Integer;
  const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
  const AIdIgnorado: string): TEventoDFeConflito;
var
  Q: QueryResult;
  LIdIgnorado: string;
begin
  Result.Existe := False;
  Result.IdExistente := '';
  Result.SeqIdExistente := 0;
  Result.StatusExistente := sePendente;

  LIdIgnorado := AIdIgnorado;
  if LIdIgnorado = '' then
    LIdIgnorado := ID_IGNORADO_INCLUSAO;

  Q := FConnection.CreateQuery(
    'SELECT FIRST 1 ID, SEQID, STATUS ' +
    ' FROM EVENTOS_DFE ' +
    ' WHERE COD_EMPRESA = :COD_EMPRESA ' +
    '   AND CHAVE_DOCUMENTO = :CHAVE_DOCUMENTO ' +
    '   AND TIPO_EVENTO = :TIPO_EVENTO ' +
    '   AND ATIVO = 1 ' +
    '   AND ID <> :ID_IGNORADO ' +
    '   AND STATUS <> :STATUS_AUTORIZADO',
    ParametersBuilder.Create(5)
      .ByName('COD_EMPRESA', ACodEmpresa)
      .ByName('CHAVE_DOCUMENTO', AChaveDocumento)
      .ByName('TIPO_EVENTO', TipoEventoDFeCodigo(ATipoEvento))
      .ByName('ID_IGNORADO', LIdIgnorado)
      .ByName('STATUS_AUTORIZADO', STATUS_EVENTO_DFE[seAutorizado])
      .Build()
  );
  try
    if Q.IsEmpty then
      Exit;

    Result.Existe := True;
    Result.IdExistente := Q.FieldAsString('ID');
    Result.SeqIdExistente := Q.FieldAsInteger('SEQID');
    Result.StatusExistente := TextoParaStatusEventoDFe(Q.FieldAsString('STATUS'));
  finally
    Q.Free();
  end;
end;

function EventosDFeRepository.GarantirNseqEvento(const AId: string;
  const ACodEmpresa: Integer; const AChaveDocumento: string;
  const ATipoEvento: TipoEventoDFe): Integer;
var
  LNseqAtual: Integer;
  LNseqCalculado: Integer;
begin
  LNseqAtual := FConnection.ExecuteScalar(
    'SELECT NSEQ_EVENTO FROM EVENTOS_DFE WHERE ID = :ID WITH LOCK',
    ParametersBuilder.Create(1)
      .ByName('ID', AId)
      .Build()
  ).AsInteger;

  if LNseqAtual > 0 then
  begin
    Result := LNseqAtual;
    Exit;
  end;

  LNseqCalculado := FConnection.ExecuteScalar(
    'SELECT COALESCE(MAX(NSEQ_EVENTO), 0) + 1 ' +
    ' FROM EVENTOS_DFE ' +
    ' WHERE COD_EMPRESA = :COD_EMPRESA ' +
    '   AND CHAVE_DOCUMENTO = :CHAVE_DOCUMENTO ' +
    '   AND TIPO_EVENTO = :TIPO_EVENTO ' +
    '   AND STATUS = :STATUS_AUTORIZADO',
    ParametersBuilder.Create(4)
      .ByName('COD_EMPRESA', ACodEmpresa)
      .ByName('CHAVE_DOCUMENTO', AChaveDocumento)
      .ByName('TIPO_EVENTO', TipoEventoDFeCodigo(ATipoEvento))
      .ByName('STATUS_AUTORIZADO', STATUS_EVENTO_DFE[seAutorizado])
      .Build()
  ).AsInteger;

  if FConnection.ExecuteScalar(
    'UPDATE EVENTOS_DFE ' +
    ' SET NSEQ_EVENTO = :NSEQ_EVENTO ' +
    ' WHERE ID = :ID ' +
    '   AND NSEQ_EVENTO = 0 ' +
    ' RETURNING ID',
    ParametersBuilder.Create(2)
      .ByName('NSEQ_EVENTO', LNseqCalculado)
      .ByName('ID', AId)
      .Build()
  ).IsNull then
    raise EValidacaoNegocio.Create(
      'O número do evento foi alterado por outra sessão. Recarregue o evento e tente novamente.');

  Result := LNseqCalculado;
end;

function EventosDFeRepository.RegistrarEnvio(const AId: string;
  const AAmbiente: Integer; const ACnpj: string;
  const ACOrgao, ATpAutor, ACOrgaoAutor: Integer): Integer;
begin
  if FConnection.ExecuteScalar(
    'UPDATE EVENTOS_DFE ' +
    ' SET STATUS = :NOVO_STATUS, ' +
    '     AMBIENTE = :AMBIENTE, CNPJ = :CNPJ, CORGAO = :CORGAO, ' +
    '     TP_AUTOR = :TP_AUTOR, C_ORGAO_AUTOR = :C_ORGAO_AUTOR, ' +
    '     DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
    ' WHERE ID = :ID ' +
    '   AND ATIVO = 1 ' +
    '   AND STATUS IN (:STATUS_PENDENTE, :STATUS_REJEITADO, :STATUS_ENVIANDO) ' +
    ' RETURNING ID',
    ParametersBuilder.Create(10)
      .ByName('NOVO_STATUS', STATUS_EVENTO_DFE[seEnviando])
      .ByName('AMBIENTE', AAmbiente)
      .ByName('CNPJ', ACnpj)
      .ByName('CORGAO', ACOrgao)
      .ByName('TP_AUTOR', ATpAutor)
      .ByName('C_ORGAO_AUTOR', ACOrgaoAutor)
      .ByName('ID', AId)
      .ByName('STATUS_PENDENTE', STATUS_EVENTO_DFE[sePendente])
      .ByName('STATUS_REJEITADO', STATUS_EVENTO_DFE[seRejeitado])
      .ByName('STATUS_ENVIANDO', STATUS_EVENTO_DFE[seEnviando])
      .Build()
  ).IsNull then
    Result := 0
  else
    Result := 1;
end;

function EventosDFeRepository.ConcluirEvento(const AId: string;
  const AStatusEsperado, ANovoStatus: TStatusEventoDFe;
  const AXMotivo, ANProt: string; const ADhRegEvento: TDateTime): Integer;
var
  LParametros: IParametersBuilder;
begin
  LParametros := ParametersBuilder.Create(6);
  LParametros.ByName('NOVO_STATUS', StatusEventoDFeParaTexto(ANovoStatus));
  LParametros.ByName('XMOTIVO', AXMotivo);
  LParametros.ByName('NPROT', ANProt);

  if ADhRegEvento = 0 then
    LParametros.Add(ParameterValue.GetNull())
  else
    LParametros.ByName('DH_REG_EVENTO', ADhRegEvento);

  LParametros.ByName('ID', AId);
  LParametros.ByName('STATUS_ESPERADO', StatusEventoDFeParaTexto(AStatusEsperado));

  if FConnection.ExecuteScalar(
    'UPDATE EVENTOS_DFE ' +
    ' SET STATUS = :NOVO_STATUS, XMOTIVO = :XMOTIVO, NPROT = :NPROT, ' +
    '     DH_REG_EVENTO = :DH_REG_EVENTO, DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
    ' WHERE ID = :ID ' +
    '   AND ATIVO = 1 ' +
    '   AND STATUS = :STATUS_ESPERADO ' +
    ' RETURNING ID',
    LParametros.Build()
  ).IsNull then
    Result := 0
  else
    Result := 1;
end;

end.
