unit EventoDFeTransmissaoRepositoryUnit;

interface

uses
  IEventoDFeTransmissaoRepositoryUnit,
  EventoDFeTransmissaoEtdUnit,
  EventoDFeTransmissaoTypesUnit,
  IDataBaseConnectionUnit,
  QueryResultUnit;

type
  EventoDFeTransmissaoRepository = class(TInterfacedObject,
    IEventoDFeTransmissaoRepository)
  private
    FConnection: IDataBaseConnection;
    function CriarTentativaDeQuery(const AQ: QueryResult;
      const ACompleta: Boolean): TEventoDFeTransmissaoEtd;
    procedure PreservarEvidenciaDoLote(const AId: string;
      var ACStatLote: Integer; var AXmlRetorno: string);
  public
    constructor Create(const AConnection: IDataBaseConnection);
    function ProximoIdLote: Int64;
    function RegistrarTentativa(const ATentativa: TEventoDFeTransmissaoEtd):
      TEventoDFeTransmissaoEtd;
    function SalvarResposta(const ATentativa: TEventoDFeTransmissaoEtd;
      const AConcluir: Boolean): Integer;
    function RegistrarEvidenciaConsulta(const ATentativa: TEventoDFeTransmissaoEtd):
      Integer;
    function FecharTentativaAberta(const AEventoDFeId: string): Integer;
    function ObterPorId(const AId: string): TEventoDFeTransmissaoEtd;
    function ObterUltimaPorEvento(const AEventoDFeId: string):
      TEventoDFeTransmissaoEtd;
    function ObterAbertaPorEvento(const AEventoDFeId: string):
      TEventoDFeTransmissaoEtd;
  end;

implementation

uses
  ParameterValueUnit,
  GuidServiceUnit;

{ EventoDFeTransmissaoRepository }

constructor EventoDFeTransmissaoRepository.Create(
  const AConnection: IDataBaseConnection);
begin
  inherited Create;
  FConnection := AConnection;
end;

function EventoDFeTransmissaoRepository.CriarTentativaDeQuery(
  const AQ: QueryResult;
  const ACompleta: Boolean): TEventoDFeTransmissaoEtd;
begin
  Result := TEventoDFeTransmissaoEtd.Create;
  Result.Id := AQ.FieldAsString('ID');
  Result.EventoDFeId := AQ.FieldAsString('EVENTO_DFE_ID');
  Result.IdLote := AQ.FieldAsInt64('ID_LOTE');
  Result.DhEvento := AQ.FieldAsDateTime('DH_EVENTO');
  Result.DataInicio := AQ.FieldAsDateTime('DATA_INICIO');
  Result.CStatLote := AQ.FieldAsInteger('CSTAT_LOTE');
  Result.CStatEvento := AQ.FieldAsInteger('CSTAT_EVENTO');
  Result.OrigemResultado :=
    TEventoDFeOrigemResultado(AQ.FieldAsInteger('ORIGEM_RESULTADO'));
  Result.XmlEnvio := AQ.FieldAsString('XML_ENVIO', False);
  Result.XmlRetorno := AQ.FieldAsString('XML_RETORNO', False);
  Result.XmlProcEvento := AQ.FieldAsString('XML_PROC_EVENTO', False);

  if ACompleta then
  begin
    Result.DataFim := AQ.FieldAsDateTime('DATA_FIM');
    Result.Concluida := AQ.FieldAsInteger('CONCLUIDA') = 1;
  end;
end;

function EventoDFeTransmissaoRepository.ProximoIdLote: Int64;
begin
  Result := FConnection.ExecuteScalar(
    'SELECT COALESCE(MAX(ID_LOTE), 0) + 1 FROM EVENTOS_DFE_TRANSMISSAO'
  ).AsInt64;
end;

function EventoDFeTransmissaoRepository.RegistrarTentativa(
  const ATentativa: TEventoDFeTransmissaoEtd): TEventoDFeTransmissaoEtd;
begin
  ATentativa.Id := GuidService.New;

  FConnection.ExecuteCommand(
    'INSERT INTO EVENTOS_DFE_TRANSMISSAO ' +
    '  (ID, EVENTO_DFE_ID, ID_LOTE, DH_EVENTO, CONCLUIDA, XML_ENVIO) ' +
    ' VALUES ' +
    '  (:ID, :EVENTO_DFE_ID, :ID_LOTE, :DH_EVENTO, 0, :XML_ENVIO)',
    ParametersBuilder.Create(5)
      .ByName('ID', ATentativa.Id)
      .ByName('EVENTO_DFE_ID', ATentativa.EventoDFeId)
      .ByNameI64('ID_LOTE', ATentativa.IdLote)
      .ByName('DH_EVENTO', ATentativa.DhEvento)
      .AddMemo(ATentativa.XmlEnvio)
      .Build()
  );

  Result := ATentativa;
end;

procedure EventoDFeTransmissaoRepository.PreservarEvidenciaDoLote(
  const AId: string; var ACStatLote: Integer; var AXmlRetorno: string);
var
  Q: QueryResult;
  Evidencia: TEventoDFeEvidenciaLote;
begin
  Q := FConnection.CreateQuery(
    'SELECT CSTAT_LOTE, XML_RETORNO ' +
    ' FROM EVENTOS_DFE_TRANSMISSAO ' +
    ' WHERE ID = :ID AND CONCLUIDA = 0',
    ParametersBuilder.Create(1)
      .ByName('ID', AId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Exit;

    // A conclusão obtida pela consulta chega sem lote e sem XML do envio anterior.
    Evidencia := MesclarEvidenciaDoLote(Q.FieldAsInteger('CSTAT_LOTE'),
      ACStatLote, Q.FieldAsString('XML_RETORNO', False), AXmlRetorno);
    ACStatLote := Evidencia.CStatLote;
    AXmlRetorno := Evidencia.XmlRetorno;
  finally
    Q.Free();
  end;
end;

function EventoDFeTransmissaoRepository.SalvarResposta(
  const ATentativa: TEventoDFeTransmissaoEtd; const AConcluir: Boolean): Integer;
var
  LSql: string;
  LParametros: IParametersBuilder;
  LCStatLote: Integer;
  LXmlRetorno: string;
begin
  LCStatLote := ATentativa.CStatLote;
  LXmlRetorno := ATentativa.XmlRetorno;
  PreservarEvidenciaDoLote(ATentativa.Id, LCStatLote, LXmlRetorno);

  LSql :=
    'UPDATE EVENTOS_DFE_TRANSMISSAO ' +
    ' SET CSTAT_LOTE = :CSTAT_LOTE, CSTAT_EVENTO = :CSTAT_EVENTO, ' +
    '     ORIGEM_RESULTADO = :ORIGEM_RESULTADO, ' +
    '     XML_RETORNO = :XML_RETORNO, XML_PROC_EVENTO = :XML_PROC_EVENTO';

  if AConcluir then
    LSql := LSql + ', CONCLUIDA = 1, DATA_FIM = CURRENT_TIMESTAMP';

  LSql := LSql + ' WHERE ID = :ID AND CONCLUIDA = 0 RETURNING ID';

  LParametros := ParametersBuilder.Create(6);
  LParametros.ByName('CSTAT_LOTE', LCStatLote);
  LParametros.ByName('CSTAT_EVENTO', ATentativa.CStatEvento);
  LParametros.ByName('ORIGEM_RESULTADO', Ord(ATentativa.OrigemResultado));
  LParametros.AddMemo(LXmlRetorno);
  LParametros.AddMemo(ATentativa.XmlProcEvento);
  LParametros.ByName('ID', ATentativa.Id);

  if FConnection.ExecuteScalar(LSql, LParametros.Build()).IsNull then
    Result := 0
  else
    Result := 1;
end;

function EventoDFeTransmissaoRepository.RegistrarEvidenciaConsulta(
  const ATentativa: TEventoDFeTransmissaoEtd): Integer;
begin
  if FConnection.ExecuteScalar(
    'UPDATE EVENTOS_DFE_TRANSMISSAO ' +
    ' SET CSTAT_EVENTO = :CSTAT_EVENTO, ORIGEM_RESULTADO = :ORIGEM_RESULTADO, ' +
    '     XML_PROC_EVENTO = :XML_PROC_EVENTO ' +
    ' WHERE ID = :ID AND CONCLUIDA = 1 ' +
    ' RETURNING ID',
    ParametersBuilder.Create(4)
      .ByName('CSTAT_EVENTO', ATentativa.CStatEvento)
      .ByName('ORIGEM_RESULTADO', Ord(ATentativa.OrigemResultado))
      .AddMemo(ATentativa.XmlProcEvento)
      .ByName('ID', ATentativa.Id)
      .Build()
  ).IsNull then
    Result := 0
  else
    Result := 1;
end;

function EventoDFeTransmissaoRepository.FecharTentativaAberta(
  const AEventoDFeId: string): Integer;
begin
  if FConnection.ExecuteScalar(
    'UPDATE EVENTOS_DFE_TRANSMISSAO ' +
    ' SET CONCLUIDA = 1, DATA_FIM = CURRENT_TIMESTAMP, ' +
    '     CSTAT_LOTE = 0, CSTAT_EVENTO = 0 ' +
    ' WHERE EVENTO_DFE_ID = :EVENTO_DFE_ID ' +
    '   AND CONCLUIDA = 0 ' +
    ' RETURNING ID',
    ParametersBuilder.Create(1)
      .ByName('EVENTO_DFE_ID', AEventoDFeId)
      .Build()
  ).IsNull then
    Result := 0
  else
    Result := 1;
end;

function EventoDFeTransmissaoRepository.ObterPorId(
  const AId: string): TEventoDFeTransmissaoEtd;
var
  Q: QueryResult;
begin
  Result := nil;

  Q := FConnection.CreateQuery(
    'SELECT ID, EVENTO_DFE_ID, ID_LOTE, DH_EVENTO, DATA_INICIO, DATA_FIM, ' +
    '       CONCLUIDA, CSTAT_LOTE, CSTAT_EVENTO, ORIGEM_RESULTADO, ' +
    '       XML_ENVIO, XML_RETORNO, XML_PROC_EVENTO ' +
    ' FROM EVENTOS_DFE_TRANSMISSAO ' +
    ' WHERE ID = :TENTATIVA_ID',
    ParametersBuilder.Create(1)
      .ByName('TENTATIVA_ID', AId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Exit;

    Result := CriarTentativaDeQuery(Q, True);
  finally
    Q.Free();
  end;
end;

function EventoDFeTransmissaoRepository.ObterUltimaPorEvento(
  const AEventoDFeId: string): TEventoDFeTransmissaoEtd;
var
  Q: QueryResult;
begin
  Result := nil;

  Q := FConnection.CreateQuery(
    'SELECT FIRST 1 ID, EVENTO_DFE_ID, ID_LOTE, DH_EVENTO, DATA_INICIO, DATA_FIM, ' +
    '       CONCLUIDA, CSTAT_LOTE, CSTAT_EVENTO, ORIGEM_RESULTADO, ' +
    '       XML_ENVIO, XML_RETORNO, XML_PROC_EVENTO ' +
    ' FROM EVENTOS_DFE_TRANSMISSAO ' +
    ' WHERE EVENTO_DFE_ID = :EVENTO_DFE_ID ' +
    ' ORDER BY ID_LOTE DESC',
    ParametersBuilder.Create(1)
      .ByName('EVENTO_DFE_ID', AEventoDFeId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Exit;

    Result := CriarTentativaDeQuery(Q, True);
  finally
    Q.Free();
  end;
end;

function EventoDFeTransmissaoRepository.ObterAbertaPorEvento(
  const AEventoDFeId: string): TEventoDFeTransmissaoEtd;
var
  Q: QueryResult;
begin
  Result := nil;

  Q := FConnection.CreateQuery(
    'SELECT FIRST 1 ID, EVENTO_DFE_ID, ID_LOTE, DH_EVENTO, DATA_INICIO, ' +
    '       CSTAT_LOTE, CSTAT_EVENTO, ORIGEM_RESULTADO, ' +
    '       XML_ENVIO, XML_RETORNO, XML_PROC_EVENTO ' +
    ' FROM EVENTOS_DFE_TRANSMISSAO ' +
    ' WHERE EVENTO_DFE_ID = :EVENTO_DFE_ID ' +
    '   AND CONCLUIDA = 0 ' +
    ' ORDER BY ID_LOTE DESC',
    ParametersBuilder.Create(1)
      .ByName('EVENTO_DFE_ID', AEventoDFeId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Exit;

    Result := CriarTentativaDeQuery(Q, False);
  finally
    Q.Free();
  end;
end;

end.
