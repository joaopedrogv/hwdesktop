unit NbsAplicavelRepositoryUnit;

interface

uses
  INbsAplicavelRepositoryUnit,
  CacheableRepositoryUnit,
  NbsAplicavelEtdUnit,
  NbsEtdUnit,
  ParameterValueUnit,
  TipoComunsUnit;

type
  /// <summary>
  ///   Java equivalente: NbsAplicavelRepository
  /// </summary>
  NbsAplicavelRepository = class(INbsAplicavelRepository)
  private
    function ObterPorSQL(const CacheKey, SQL: string; const Params: ParametersValues): NbssAplicaveisEtd;
  public
    function ObterPorNbseClassificacaoId(NBS: string; ClassificacaoId: Integer; Data: TDate): NbssAplicaveisEtd; override;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemExcecaoNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemNbsAplicavelSemExcecao(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function ListarNbsAplicaveisPorClassificacao(ClassificacaoId: Integer; Data: TDate): NbssEtd; override;
    function ListarClassificacaoAplicavelPorNbs(const Nbs: string; Data: TDate): TArrayString; override;
    function ExisteVinculoParaClassificacao(ClassificacaoId: Integer): Boolean; override;
  end;

implementation

uses
  Classes, Contnrs,
  SysUtils, ExcecaoNbsAplicavelEtdUnit, IntegerNullableUnit, DateAndTimeNullableUnit;

type
  NbsJoinExcecao = record
    NBSA_ID: Integer;
    NBSA_NBS_CD: string;
    NBSA_CLTR_ID: Integer;
    NBSA_ANXO_ID: IntegerNullable;
    NBSA_INICIO_VIGENCIA: TDate;
    NBSA_FIM_VIGENCIA: DateNullable;
    ENBS_ID: Integer;
    ENBS_NBS_CD: string;
    ENBS_NBSA_ID: Integer;
    ENBS_INICIO_VIGENCIA: TDate;
    ENBS_FIM_VIGENCIA: DateNullable;
    HasExcecao: Boolean;
  end;

  NbsExcecaoCache = record
    Data: NbssAplicaveisEtd;
  end;

  // Wrapper usado para cachear resultados booleanos no IObjectCache, seguindo o
  // padrao TWrapper = class(RecordWrapper) adotado pelos demais repositorios.
  TResultadoBooleanoCache = class(RecordWrapper)
    Data: Boolean;
  end;

{ NbsAplicavelRepository }
function NbsAplicavelRepository.ObterPorSQL(const CacheKey, SQL: string; const Params: ParametersValues): NbssAplicaveisEtd;

var
  Rows: array of NbsJoinExcecao;
  i, j, conte: Integer;
  CurrentId: Integer;
  excecoes: ExcecoesNbsAplicavelEtd;
  nbs: NbsJoinExcecao;
begin
  // Antes de tudo verificando o Cache
  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Result := NbssAplicaveisEtd.Create();

  // Passo 1: carregar todos os registros
  with FConnection.CreateQuery(SQL, Params) do
  try
    SetLength(Rows, 10);
    i := 0;
    while not DataSet.Eof do
    begin
      if i >= Length(Rows) then
        SetLength(Rows, Length(Rows) * 2);

      Rows[i].NBSA_ID := FieldAsInteger('NBSA_ID');
      Rows[i].NBSA_NBS_CD := FieldAsString('NBSA_NBS_CD');
      Rows[i].NBSA_CLTR_ID := FieldAsInteger('NBSA_CLTR_ID');
      Rows[i].NBSA_ANXO_ID := FieldAsIntNullable('NBSA_ANXO_ID');
      Rows[i].NBSA_INICIO_VIGENCIA := FieldAsDate('NBSA_INICIO_VIGENCIA');
      Rows[i].NBSA_FIM_VIGENCIA := FieldAsDateNullable('NBSA_FIM_VIGENCIA');

      if not FieldIsNull('ENBS_ID') then
      begin
        Rows[i].HasExcecao := True;
        Rows[i].ENBS_ID := FieldAsInteger('ENBS_ID');
        Rows[i].ENBS_NBS_CD := FieldAsString('ENBS_NBS_CD');
        Rows[i].ENBS_NBSA_ID := FieldAsInteger('ENBS_NBSA_ID');
        Rows[i].ENBS_INICIO_VIGENCIA := FieldAsDate('ENBS_INICIO_VIGENCIA');
        Rows[i].ENBS_FIM_VIGENCIA := FieldAsDateNullable('ENBS_FIM_VIGENCIA');
      end
      else
        Rows[i].HasExcecao := False;

      Inc(i);
      DataSet.Next();
    end;

    SetLength( Rows, I );

  finally
    FreeQueryResult();
  end;

  // Passo 2: agrupar em memória
  i := 0;
  while i < Length(Rows) do
  begin
    CurrentId := Rows[i].NBSA_ID;

    // Cria o nbs aplicável (usa o primeiro registro do grupo)
    nbs.NBSA_NBS_CD := Rows[i].NBSA_NBS_CD;
    nbs.NBSA_CLTR_ID := Rows[i].NBSA_CLTR_ID;
    nbs.NBSA_ANXO_ID := Rows[i].NBSA_ANXO_ID;
    nbs.NBSA_INICIO_VIGENCIA := Rows[i].NBSA_INICIO_VIGENCIA;
    nbs.NBSA_FIM_VIGENCIA := DateNullable.CreateOrNull( Rows[i].NBSA_FIM_VIGENCIA.Value );

    // Coleta exceções
    SetLength(excecoes, 10);
    conte := 0;
    j := i;
    while (j < Length(Rows)) and (Rows[j].NBSA_ID = CurrentId) do
    begin
      if Rows[j].HasExcecao then
      begin
        if conte >= Length(excecoes) then
          SetLength(excecoes, Length(excecoes) * 2);

        excecoes[conte] := ExcecaoNbsAplicavelEtd.CreateEtd(
          Rows[j].ENBS_ID,
          Rows[j].ENBS_NBS_CD,
          Rows[j].ENBS_NBSA_ID,
          Rows[j].ENBS_INICIO_VIGENCIA,
          Rows[j].ENBS_FIM_VIGENCIA
        );
        Inc(conte);
      end;
      Inc(j);
    end;

    SetLength(excecoes, conte);

    Result.Add( NbsAplicavelEtd.Create(
      CurrentId, nbs.NBSA_NBS_CD, nbs.NBSA_CLTR_ID,
      nbs.NBSA_ANXO_ID, nbs.NBSA_INICIO_VIGENCIA, nbs.NBSA_FIM_VIGENCIA,
      excecoes
    ));

    i := j; // pula para o próximo grupo
  end;

  FCacheObjs.Add(CacheKey, Result);
end;

// Consulta agregada preservada para conformidade com a API do repositorio. A partir
// do incremento I14b ela deixou de ser consumida por NbsAplicavelService.Validar,
// que passou a usar os tres metodos Java equivalentes (TemNbsAplicavel,
// TemExcecaoNbsAplicavel e TemNbsAplicavelSemExcecao). Chave por CLTR_ID/Integer,
// sem LENGTH=9, que pertence a I15.
function NbsAplicavelRepository.ObterPorNbseClassificacaoId(
  NBS: string; ClassificacaoId: Integer; Data: TDate
): NbssAplicaveisEtd;
begin
  Result := ObterPorSQL(
    Format('obtr_%s_%d_%s', [ NBS, ClassificacaoId, DateToStr(Data) ]),
      'SELECT N.NBSA_ID, N.NBSA_NBS_CD, N.NBSA_CLTR_ID, N.NBSA_ANXO_ID, N.NBSA_INICIO_VIGENCIA, N.NBSA_FIM_VIGENCIA, ' +
      '       NE.ENBS_ID, NE.ENBS_NBS_CD, NE.ENBS_NBSA_ID, NE.ENBS_INICIO_VIGENCIA, NE.ENBS_FIM_VIGENCIA ' +
      'FROM RTC_NBS_APLICAVEL N ' +
      'LEFT JOIN RTC_EXCECAO_NBS_APLICAVEL NE ON NE.ENBS_NBSA_ID = N.NBSA_ID ' +
      'WHERE N.NBSA_NBS_CD = SUBSTRING(:NBS FROM 1 FOR CHAR_LENGTH(N.NBSA_NBS_CD)) ' +
      'AND N.NBSA_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
      'AND :DATA BETWEEN N.NBSA_INICIO_VIGENCIA AND COALESCE(N.NBSA_FIM_VIGENCIA, :DATA) ' +
      'ORDER BY N.NBSA_ID, NE.ENBS_ID ',
    ParametersBuilder.Create(3)
      .ByName('NBS', NBS)
      .ByName('IDCLASSIFICACAOTRIBUTARIA', ClassificacaoId)
      .ByName('DATA', Data)
      .Build()
  );
end;

function NbsAplicavelRepository.ExistePorClassificacaoId(
  ClassificacaoId: Integer; Data: TDate
): Boolean;
var
  resultado: NbssAplicaveisEtd;
begin
  resultado := ObterPorSQL(
    Format('ext_%d_%s', [ ClassificacaoId, DateToStr(Data) ]),
      'SELECT FIRST 1 N.NBSA_ID, N.NBSA_NBS_CD, N.NBSA_CLTR_ID, N.NBSA_ANXO_ID, N.NBSA_INICIO_VIGENCIA, N.NBSA_FIM_VIGENCIA, ' +
      '       NE.ENBS_ID, NE.ENBS_NBS_CD, NE.ENBS_NBSA_ID, NE.ENBS_INICIO_VIGENCIA, NE.ENBS_FIM_VIGENCIA ' +
      'FROM RTC_NBS_APLICAVEL N ' +
      'LEFT JOIN RTC_EXCECAO_NBS_APLICAVEL NE ON NE.ENBS_NBSA_ID = N.NBSA_ID ' +
      'WHERE N.NBSA_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
      'ORDER BY N.NBSA_ID, NE.ENBS_ID ',
      ParametersBuilder.Create()
        .Add( ClassificacaoId )
        .Build()
  );
  try
    Result := resultado.Count > 0;

  finally
    resultado.Free();
  end;
end;

// Espelho de NbsAplicavelRepository.temNbsAplicavel: existe NBS_APLICAVEL vigente
// para o prefixo NBS e a classificacao/data informadas.
function NbsAplicavelRepository.TemNbsAplicavel(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
var
  CacheKey: string;
  W: TResultadoBooleanoCache;
begin
  CacheKey := Format('temnbsapl_%s_%d_%s', [ Nbs, ClassificacaoId, DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT FIRST 1 1 ' +
    'FROM RTC_NBS_APLICAVEL N ' +
    'WHERE N.NBSA_NBS_CD = SUBSTRING(:NBS FROM 1 FOR CHAR_LENGTH(N.NBSA_NBS_CD)) ' +
    'AND N.NBSA_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
    'AND :DATA BETWEEN N.NBSA_INICIO_VIGENCIA AND COALESCE(N.NBSA_FIM_VIGENCIA, :DATA)',
    ParametersBuilder.Create(3)
      .ByName('NBS', Nbs)
      .ByName('IDCLASSIFICACAOTRIBUTARIA', ClassificacaoId)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    Result := not IsEmpty;
  finally
    FreeQueryResult();
  end;

  W := TResultadoBooleanoCache.Create;
  W.Data := Result;
  FCacheObjs.Add(CacheKey, W);
end;

// Espelho de NbsAplicavelRepository.temExcecaoNbsAplicavel: existe excecao vigente
// para o prefixo NBS e a classificacao/data, independentemente da vigencia da linha
// NBS_APLICAVEL associada (correcao de F-01).
function NbsAplicavelRepository.TemExcecaoNbsAplicavel(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
var
  CacheKey: string;
  W: TResultadoBooleanoCache;
begin
  CacheKey := Format('temnbsexc_%s_%d_%s', [ Nbs, ClassificacaoId, DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT FIRST 1 1 ' +
    'FROM RTC_EXCECAO_NBS_APLICAVEL E ' +
    'JOIN RTC_NBS_APLICAVEL N ON N.NBSA_ID = E.ENBS_NBSA_ID ' +
    'WHERE N.NBSA_NBS_CD = SUBSTRING(:NBS FROM 1 FOR CHAR_LENGTH(N.NBSA_NBS_CD)) ' +
    'AND E.ENBS_NBS_CD = SUBSTRING(:NBS FROM 1 FOR CHAR_LENGTH(E.ENBS_NBS_CD)) ' +
    'AND N.NBSA_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
    'AND :DATA BETWEEN E.ENBS_INICIO_VIGENCIA AND COALESCE(E.ENBS_FIM_VIGENCIA, :DATA)',
    ParametersBuilder.Create(3)
      .ByName('NBS', Nbs)
      .ByName('IDCLASSIFICACAOTRIBUTARIA', ClassificacaoId)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    Result := not IsEmpty;
  finally
    FreeQueryResult();
  end;

  W := TResultadoBooleanoCache.Create;
  W.Data := Result;
  FCacheObjs.Add(CacheKey, W);
end;

// Espelho de NbsAplicavelRepository.temNbsAplicavelSemExcecao: existe NBS_APLICAVEL
// vigente para o prefixo NBS e a classificacao/data sem excecao vigente associada.
function NbsAplicavelRepository.TemNbsAplicavelSemExcecao(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
var
  CacheKey: string;
  W: TResultadoBooleanoCache;
begin
  CacheKey := Format('temnbssemexc_%s_%d_%s', [ Nbs, ClassificacaoId, DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT FIRST 1 1 ' +
    'FROM RTC_NBS_APLICAVEL N ' +
    'LEFT JOIN RTC_EXCECAO_NBS_APLICAVEL E ON E.ENBS_NBSA_ID = N.NBSA_ID ' +
    'WHERE N.NBSA_NBS_CD = SUBSTRING(:NBS FROM 1 FOR CHAR_LENGTH(N.NBSA_NBS_CD)) ' +
    'AND N.NBSA_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
    'AND :DATA BETWEEN N.NBSA_INICIO_VIGENCIA AND COALESCE(N.NBSA_FIM_VIGENCIA, :DATA) ' +
    'AND (E.ENBS_ID IS NULL OR :DATA NOT BETWEEN E.ENBS_INICIO_VIGENCIA AND COALESCE(E.ENBS_FIM_VIGENCIA, :DATA))',
    ParametersBuilder.Create(3)
      .ByName('NBS', Nbs)
      .ByName('IDCLASSIFICACAOTRIBUTARIA', ClassificacaoId)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    Result := not IsEmpty;
  finally
    FreeQueryResult();
  end;

  W := TResultadoBooleanoCache.Create;
  W.Data := Result;
  FCacheObjs.Add(CacheKey, W);
end;

function NbsAplicavelRepository.ListarNbsAplicaveisPorClassificacao(
  ClassificacaoId: Integer; Data: TDate
): NbssEtd;
begin
  // Espelho de listarNbsAplicaveisPorClassificacao v0042: NBS com vinculo vigente
  // e sem excecao vigente, chaveadas por CLTR_ID (Integer) e ordenadas por codigo.
  Result := NbssEtd.Create;

  with FConnection.CreateQuery(
    'SELECT DISTINCT NB.COD_NBS, NB.DESCRICAO_NBS, NB.LC_116, NB.DATA_INICIO, NB.DATA_FIM ' +
    'FROM RTC_NBS_APLICAVEL N ' +
    'JOIN NBS NB ON NB.COD_NBS = N.NBSA_NBS_CD ' +
    'LEFT JOIN RTC_EXCECAO_NBS_APLICAVEL E ON E.ENBS_NBSA_ID = N.NBSA_ID ' +
    '    AND :DATA BETWEEN E.ENBS_INICIO_VIGENCIA AND COALESCE(E.ENBS_FIM_VIGENCIA, :DATA) ' +
    'JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = N.NBSA_CLTR_ID ' +
    'WHERE CT.CLTR_ID = :CLASSIFICACAOID ' +
    'AND :DATA BETWEEN N.NBSA_INICIO_VIGENCIA AND COALESCE(N.NBSA_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN NB.DATA_INICIO AND COALESCE(NB.DATA_FIM, :DATA) ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND E.ENBS_ID IS NULL ' +
    'AND CHAR_LENGTH(NB.COD_NBS) = 9 ' +
    'ORDER BY NB.COD_NBS ',
    ParametersBuilder.Create(2)
      .ByName('CLASSIFICACAOID', ClassificacaoId)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    while not DataSet.Eof do
    begin
      Result.Add( NbsEtd.Create(
        FieldAsString('COD_NBS'),
        FieldAsString('DESCRICAO_NBS'),
        FieldAsStringNullable('LC_116'),
        FieldAsDate('DATA_INICIO'),
        FieldAsDateNullable('DATA_FIM')
      ));

      DataSet.Next();
    end;

  finally
    FreeQueryResult();
  end;
end;

function NbsAplicavelRepository.ListarClassificacaoAplicavelPorNbs(
  const Nbs: string; Data: TDate
): TArrayString;
var
  i: Integer;
begin
  // Espelho de listarCodigosClassificacoesVinculadasPorNbs: codigos de
  // classificacao com vinculo vigente e sem excecao vigente.
  i := 0;
  SetLength(Result, 10);

  with FConnection.CreateQuery(
    'SELECT CT.CLTR_CD ' +
    'FROM RTC_NBS_APLICAVEL N ' +
    'JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = N.NBSA_CLTR_ID ' +
    'LEFT JOIN RTC_EXCECAO_NBS_APLICAVEL E ON E.ENBS_NBSA_ID = N.NBSA_ID ' +
    '    AND :DATA BETWEEN E.ENBS_INICIO_VIGENCIA AND COALESCE(E.ENBS_FIM_VIGENCIA, :DATA) ' +
    'WHERE N.NBSA_NBS_CD = :NBS ' +
    'AND :DATA BETWEEN N.NBSA_INICIO_VIGENCIA AND COALESCE(N.NBSA_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND E.ENBS_ID IS NULL ',
    ParametersBuilder.Create(2)
      .ByName('NBS', Nbs)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    while not DataSet.Eof do
    begin
      if i >= Length(Result) then
        SetLength(Result, Length(Result) * 2);

      Result[i] := FieldAsString('CLTR_CD');

      Inc(i);
      DataSet.Next();
    end;

    SetLength(Result, i);

  finally
    FreeQueryResult();
  end;
end;

function NbsAplicavelRepository.ExisteVinculoParaClassificacao(
  ClassificacaoId: Integer
): Boolean;
begin
  // Espelho de existeVinculoParaClassificacao v0042: verifica apenas a existencia
  // de vinculo para a classificacao por CLTR_ID (Integer), sem filtro de vigencia/data.
  with FConnection.CreateQuery(
    'SELECT FIRST 1 1 ' +
    'FROM RTC_NBS_APLICAVEL N ' +
    'JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = N.NBSA_CLTR_ID ' +
    'WHERE CT.CLTR_ID = :CLASSIFICACAOID ',
    ParametersBuilder.Create(1)
      .ByName('CLASSIFICACAOID', ClassificacaoId)
      .Build()
  ) do
  try
    Result := not IsEmpty;

  finally
    FreeQueryResult();
  end;
end;

end.

