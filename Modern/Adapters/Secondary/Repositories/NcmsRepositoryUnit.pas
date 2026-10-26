unit NcmsRepositoryUnit;

interface

uses
  INcmsRepositoryUnit,
  CacheableRepositoryUnit,
  NcmEtdUnit,
  QueryResultUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit;

type                                                                
  {$IFDEF INTF_ON}
  NcmsRepository = class(CacheableRepository, INcmRepository)
  {$ELSE}
  NcmsRepository = class(INcmsRepository)
  {$ENDIF}
  private
    function CreateItemFromQuery(Q: QueryResult): NcmEtd;
  public
    function ObterNcm(const Ncm: string; Data: TDate): NcmEtd; override;
    function ObterNcmMaisRecente(const Ncm: string): NcmEtd; override;
    //function ListarNcmsEstoqueCompativeisComAnexo(EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): NcmsEtd; override;
  end;

implementation

{ NcmsRepository }

uses
  SysUtils,
  TypInfo,
  ParameterValueUnit, Contnrs, EnumServiceUnit,
  StringServiceUnit;

function NcmsRepository.CreateItemFromQuery(Q: QueryResult): NcmEtd;
begin
  Result := NcmEtd.Create(
    Q.FieldAsString('CODIGO'),
    Q.FieldAsString('DESCRICAO'),
    Q.FieldAsDate('DATA_INICIO'),
    Q.FieldAsDateNullable('DATA_FIM'),
    Q.FieldAsString('NUMERO_ATO_INI'),
    Q.FieldAsStringNullable('NUMERO_ATO_FIM'),
    Q.FieldAsString('ANO_ATO_INI'),
    Q.FieldAsStringNullable('ANO_ATO_FIM'),
    NcmState(Q.FieldAsInteger('STATE'))
  );
end;
{
function NcmsRepository.ListarNcmsEstoqueCompativeisComAnexo(
  EmpresaId: Integer; 
  TiposTributos: TipoTributoEnumSet;
  Data: TDate): NcmsEtd;
var
  CacheKey: string;
  Q: QueryResult;
  I: Integer;
  Tipos: TipoTributoEnumSet;
  sTiposTrib: string;
begin
  sTiposTrib := StringService.Default( StringService.Join(',',
    EnumService.SetAsArrayString(TypeInfo(TipoTributoEnumSet), TiposTributos)
  ), '0');

  CacheKey := Format('estoque_Compat_%s_%s', [ sTiposTrib, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery( Format(
    'select distinct ' +
    '  n.id, n.codigo, n.descricao, n.data_inicio, n.data_fim, n.numero_ato_ini, ' +
    '  n.numero_ato_fim, n.ano_ato_ini, n.ano_ato_fim, n.state ' + 
    'from produtos p ' + 
    '  inner join ncm n on n.codigo = p.nbm ' + 
    '  inner join rtc_ncm_aplicavel na on na.ncma_ncm_cd in ( ' + 
    '    substr(p.nbm, 1, 8), substr(p.nbm, 1, 7), substr(p.nbm, 1, 6), substr(p.nbm, 1, 5), ' + 
    '    substr(p.nbm, 1, 4), substr(p.nbm, 1, 3), substr(p.nbm, 1, 2) ' + 
    '  ) ' + 
    '  inner join rtc_anexo a on na.ncma_anxo_id = a.anxo_id ' + 
    '    inner join rtc_classificacao_tributaria c on c.cltr_id = na.ncma_cltr_id ' + 
    '    inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' + 
    '    inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' + 
    '    left join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = na.ncma_id ' + 
    '      and p.nbm starting with e.encm_ncm_cd ' + 
    '      and :data between e.encm_inicio_vigencia and coalesce(e.encm_fim_vigencia, :data) ' + 
    '  where p.ativo <> 99 and p.cod_empresa = :cod_empresa ' + 
    '    and :data between n.data_inicio and coalesce(n.data_fim, :data) ' + 
    '    and tst.tipo_tributo in (%s) and :data between a.anxo_inicio_vigencia and coalesce(a.anxo_fim_vigencia, :data) ' + 
    '    and :data between na.ncma_inicio_vigencia and coalesce(na.ncma_fim_vigencia, :data) ' + 
    '    and :data between c.cltr_inicio_vigencia and coalesce(c.cltr_fim_vigencia, :data) ' + 
    '    and :data between st.sitr_inicio_vigencia and coalesce(st.sitr_fim_vigencia, :data) ' + 
    '    and :data between tst.trst_inicio_vigencia and coalesce(tst.trst_fim_vigencia, :data) ' + 
    '    and e.encm_id is null ', [ sTiposTrib ] ),
    ParametersBuilder.Create(2)
      .ByName('COD_EMPRESA', EmpresaId)
      .ByName('DATA', Data)
      .Build()
  );
  try
    Result := NcmsEtd.Create();
    while not Q.Eof do
    begin
      Result.Add( CreateItemFromQuery( Q ) );

      Q.Next
    end;

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;
}
function NcmsRepository.ObterNcm(const Ncm: string; Data: TDate): NcmEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('%s_%s', [ Ncm, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'SELECT FIRST 1 ID, CODIGO, DESCRICAO, DATA_INICIO, DATA_FIM, NUMERO_ATO_INI, '+
    '       NUMERO_ATO_FIM, ANO_ATO_INI, ANO_ATO_FIM, STATE '+
    'FROM NCM ' +
    'WHERE CODIGO = :CODIGO ' +
    'AND :DATA BETWEEN DATA_INICIO AND COALESCE(DATA_FIM, :DATA) ',
    ParametersBuilder.Create(2)
      .ByName('CODIGO', Ncm)
      .ByName('DATA', Data)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;

function NcmsRepository.ObterNcmMaisRecente(const Ncm: string): NcmEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('recente_%s', [ Ncm ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'SELECT FIRST 1 ID, CODIGO, DESCRICAO, DATA_INICIO, DATA_FIM, NUMERO_ATO_INI, '+
    '       NUMERO_ATO_FIM, ANO_ATO_INI, ANO_ATO_FIM, STATE '+
    'FROM NCM ' +
    'WHERE CODIGO = :CODIGO ' +
    'ORDER BY DATA_INICIO DESC',
    ParametersBuilder.Create(2)
      .ByName('CODIGO', Ncm)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;

end.
