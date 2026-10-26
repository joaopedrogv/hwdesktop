unit NcmAplicavelRepositoryUnit;

interface

uses
  INcmAplicavelRepositoryUnit,
  CacheableRepositoryUnit,
  NcmAplicavelEtdUnit,
  ParameterValueUnit,
  TipoComunsUnit;

type                                                                                
  {$IFDEF INTF_ON}
  NcmAplicavelRepository = class(CacheableRepository, INcmAplicavelRepository)
  {$ELSE}                                                                     
  NcmAplicavelRepository = class(INcmAplicavelRepository)
  {$ENDIF}
  private
    function ObterPorSQL(const CacheKey, SQL: string; const Params: ParametersValues): NcmsAplicaveisEtd;
  public
    function ObterPorNcmeClassificacaoId(NCM: string; ClassificacaoId: Integer; Data: TDate): NcmsAplicaveisEtd; override;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean; override;
  end;

implementation

uses
  Classes, Contnrs,
  SysUtils, ExcecaoNcmAplicavelEtdUnit, IntegerNullableUnit, DateAndTimeNullableUnit, EntityBaseUnit;

type
  NcmJoinExcecao = record
    NCMA_ID: Integer;
    NCMA_NCM_CD: string;
    NCMA_CLTR_ID: Integer;
    NCMA_ANXO_ID: IntegerNullable;
    NCMA_INICIO_VIGENCIA: TDate;
    NCMA_FIM_VIGENCIA: DateNullable;
    ENCM_ID: Integer;
    ENCM_NCM_CD: string;
    ENCM_NCMA_ID: Integer;
    ENCM_INICIO_VIGENCIA: TDate;
    ENCM_FIM_VIGENCIA: DateNullable;
    HasExcecao: Boolean;
  end;

{ NcmAplicavelRepository }
{ Minha versao,
function NcmAplicavelRepository.ObterPorSQL(const SQL: string;
  const Params: ParametersValues): NcmsAplicaveisEtd;
var
  countApl, countEx: Integer;
  ncmAplicavel: NcmAplicavelEtd;
  excecoes: ExcecoesNcmAplicavelEtd;
begin
  with FConnection.CreateQuery( SQL, Params ) do
  try
    if IsEmpty then
      Result := []

    else
    begin

      countApl := 0;
      SetLength( Result, 50);

      while not DataSet.Eof do
      begin
        if countApl >= Length(Result) then
          SetLength(Result, Length(Result) * 2);

        ncmAplicavel := NcmAplicavelEtd.CreateEtd(
          FieldAsInteger('NCMA_ID'),
          FieldAsString('NCMA_NCM_CD'),
          FieldAsInteger('NCMA_CLTR_ID'),
          FieldAsIntNullable('NCMA_ANXO_ID'),
          FieldAsDate('NCMA_INICIO_VIGENCIA'),
          FieldAsDateNullable('NCMA_FIM_VIGENCIA')
        );

        if not FieldIsNull('ENCM_ID') then
        begin
          countEx := 0;
          SetLength( excecoes, 50);

          repeat
            if countEx >= Length(excecoes) then
              SetLength(excecoes, Length(excecoes) * 2);

            excecoes[countEx] := ExcecaoNcmAplicavelEtd.CreateEtd(
              FieldAsInteger('ENCM_ID'),
              FieldAsString('ENCM_NCM_CD'),
              FieldAsInteger('ENCM_NCMA_ID'),
              FieldAsDate('ENCM_INICIO_VIGENCIA'),
              FieldAsDateNullable('ENCM_FIM_VIGENCIA')
            );

            Inc(countEx);
            DataSet.Next();
          until
            ( DataSet.Eof or (FieldAsInteger('NCMA_ID') <> ncmAplicavel.Id));

          SetLength( excecoes, countEx);
        end
        else
        begin
          SetLength( excecoes, 0);
          DataSet.Next();
        end;

        Result[countApl] := NcmAplicavelEtd.Create(
          ncmAplicavel.Id, ncmAplicavel.Ncm, ncmAplicavel.ClassificacaoTributariaId,
          ncmAplicavel.AnexoId, ncmAplicavel.InicioVigencia, ncmAplicavel.FimVigencia,
          excecoes
        );

        Inc(countApl);
      end;

      SetLength( Result, countApl);

    end;
  finally
    FreeQueryResult();
  end;
end;
}

function NcmAplicavelRepository.ObterPorSQL(const CacheKey, SQL: string; const Params: ParametersValues): NcmsAplicaveisEtd;
var
  Rows: array of NcmJoinExcecao;
  i, j, conte: Integer;
  CurrentId: Integer;
  excecoes: ExcecoesNcmAplicavelEtd;
  ncm: NcmJoinExcecao;
begin
  // Antes de tudo verificando o Cache
  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Result := NcmsAplicaveisEtd.Create();

  // Passo 1: carregar todos os registros
  with FConnection.CreateQuery(SQL, Params) do
  try
    SetLength(Rows, 10);
    i := 0;
    while not DataSet.Eof do
    begin
      if i >= Length(Rows) then
        SetLength(Rows, Length(Rows) * 2);

      Rows[i].NCMA_ID := FieldAsInteger('NCMA_ID');
      Rows[i].NCMA_NCM_CD := FieldAsString('NCMA_NCM_CD');
      Rows[i].NCMA_CLTR_ID := FieldAsInteger('NCMA_CLTR_ID');
      Rows[i].NCMA_ANXO_ID := FieldAsIntNullable('NCMA_ANXO_ID');
      Rows[i].NCMA_INICIO_VIGENCIA := FieldAsDate('NCMA_INICIO_VIGENCIA');
      Rows[i].NCMA_FIM_VIGENCIA := FieldAsDateNullable('NCMA_FIM_VIGENCIA');

      if not FieldIsNull('ENCM_ID') then
      begin
        Rows[i].HasExcecao := True;
        Rows[i].ENCM_ID := FieldAsInteger('ENCM_ID');
        Rows[i].ENCM_NCM_CD := FieldAsString('ENCM_NCM_CD');
        Rows[i].ENCM_NCMA_ID := FieldAsInteger('ENCM_NCMA_ID');
        Rows[i].ENCM_INICIO_VIGENCIA := FieldAsDate('ENCM_INICIO_VIGENCIA');
        Rows[i].ENCM_FIM_VIGENCIA := FieldAsDateNullable('ENCM_FIM_VIGENCIA');
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
    CurrentId := Rows[i].NCMA_ID;

    // Cria o NCM aplicável (usa o primeiro registro do grupo)
    ncm.NCMA_NCM_CD := Rows[i].NCMA_NCM_CD;
    ncm.NCMA_CLTR_ID := Rows[i].NCMA_CLTR_ID;
    ncm.NCMA_ANXO_ID := Rows[i].NCMA_ANXO_ID;
    ncm.NCMA_INICIO_VIGENCIA := Rows[i].NCMA_INICIO_VIGENCIA;
    ncm.NCMA_FIM_VIGENCIA := DateNullable.CreateOrNull( Rows[i].NCMA_FIM_VIGENCIA.Value );

    // Coleta exceções
    SetLength(excecoes, 10);
    conte := 0;
    j := i;
    while (j < Length(Rows)) and (Rows[j].NCMA_ID = CurrentId) do
    begin
      if Rows[j].HasExcecao then
      begin
        if conte >= Length(excecoes) then
          SetLength(excecoes, Length(excecoes) * 2);

        excecoes[conte] := ExcecaoNcmAplicavelEtd.CreateEtd(
          Rows[j].ENCM_ID,
          Rows[j].ENCM_NCM_CD,
          Rows[j].ENCM_NCMA_ID,
          Rows[j].ENCM_INICIO_VIGENCIA,
          Rows[j].ENCM_FIM_VIGENCIA
        );
        Inc(conte);
      end;
      Inc(j);
    end;

    SetLength(excecoes, conte);

    Result.Add( NcmAplicavelEtd.Create(
      CurrentId, ncm.NCMA_NCM_CD, ncm.NCMA_CLTR_ID,
      ncm.NCMA_ANXO_ID, ncm.NCMA_INICIO_VIGENCIA, ncm.NCMA_FIM_VIGENCIA,
      excecoes
    ));

    i := j; // pula para o próximo grupo
  end;

  FCacheObjs.Add(CacheKey, Result);
end;

function NcmAplicavelRepository.ObterPorNcmeClassificacaoId(
  NCM: string; ClassificacaoId: Integer; Data: TDate
): NcmsAplicaveisEtd;
begin
  Result := ObterPorSQL(
    Format('obtr_%s_%d_%s', [ NCM, ClassificacaoId, DateToStr(Data) ]),
      'SELECT N.NCMA_ID, N.NCMA_NCM_CD, N.NCMA_CLTR_ID, N.NCMA_ANXO_ID, N.NCMA_INICIO_VIGENCIA, N.NCMA_FIM_VIGENCIA, ' +
      '       NE.ENCM_ID, NE.ENCM_NCM_CD, NE.ENCM_NCMA_ID, NE.ENCM_INICIO_VIGENCIA, NE.ENCM_FIM_VIGENCIA ' +
      'FROM RTC_NCM_APLICAVEL N ' +
      'LEFT JOIN RTC_EXCECAO_NCM_APLICAVEL NE ON NE.ENCM_NCMA_ID = N.NCMA_ID ' +
      'WHERE N.NCMA_NCM_CD = SUBSTRING(:NCM FROM 1 FOR CHAR_LENGTH(N.NCMA_NCM_CD)) ' +
      'AND N.NCMA_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
      'AND :DATA BETWEEN N.NCMA_INICIO_VIGENCIA AND COALESCE(N.NCMA_FIM_VIGENCIA, :DATA) ' +
      'ORDER BY N.NCMA_ID, NE.ENCM_ID',
    ParametersBuilder.Create(3)
      .ByName('NCM', NCM)
      .ByName('IDCLASSIFICACAOTRIBUTARIA', ClassificacaoId)
      .ByName('DATA', Data)
      .Build()
  );
end;

function NcmAplicavelRepository.ExistePorClassificacaoId(
  ClassificacaoId: Integer; Data: TDate
): Boolean;
var
  resultado: NcmsAplicaveisEtd;
begin
  resultado := ObterPorSQL(
    Format('ext_%d_%s', [ ClassificacaoId, DateToStr(Data) ]),
      'SELECT FIRST 1 N.NCMA_ID, N.NCMA_NCM_CD, N.NCMA_CLTR_ID, N.NCMA_ANXO_ID, N.NCMA_INICIO_VIGENCIA, N.NCMA_FIM_VIGENCIA, ' +
      '       NE.ENCM_ID, NE.ENCM_NCM_CD, NE.ENCM_NCMA_ID, NE.ENCM_INICIO_VIGENCIA, NE.ENCM_FIM_VIGENCIA ' +
      'FROM RTC_NCM_APLICAVEL N ' +
      'LEFT JOIN RTC_EXCECAO_NCM_APLICAVEL NE ON 1 = 0 AND NE.ENCM_NCMA_ID = N.NCMA_ID ' +
      'WHERE N.NCMA_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
      'ORDER BY N.NCMA_ID, NE.ENCM_ID',
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


end.
