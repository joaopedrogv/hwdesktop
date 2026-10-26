unit AnexosRepositoryUnit;

interface

uses
  IAnexosRepositoryUnit,
  CacheableRepositoryUnit,
  TipoTributoEnumUnit,
  QueryResultUnit,
  TipoComunsUnit,
  AnexoEtdUnit;

type                                                                     
  {$IFDEF INTF_ON}
  AnexosRepository = class(CacheableRepository, IAnexosRepository)
  {$ELSE}
  AnexosRepository = class(IAnexosRepository)
  {$ENDIF}
  private
    function CreateItemFromQuery(Q: QueryResult): AnexoEtd;
    function CreateListFromQuery(const CacheKey: string; Q: QueryResult): AnexosEtd;
  public
    function ListarAnexos(TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd; override;
    function ListarAnexosCompativeisComEstoque(EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd; override;
    function ListarAnexosIbsCbs(): AnexosEtd; override;
    function ListarAnexosImpostoSeletivo(): AnexosEtd; override;
    function ListarAnexosIbsCbsCompativeisComEstoque(): AnexosEtd; override;
    function ListarAnexosImpostoSeletivoCompativeisComEstoque(): AnexosEtd; override;
  end;

implementation

uses
  SysUtils,
  StringServiceUnit,
  EnumServiceUnit,
  ParameterValueUnit;

type
  TWraper = class(RecordWrapper)
    Data: AnexosEtd;
  end;

{ AnexosRepository }

function AnexosRepository.CreateItemFromQuery(Q: QueryResult): AnexoEtd;
begin
  Result := AnexoEtd.Create(
    Q.FieldAsInteger('ANXO_ID'),
    Q.FieldAsString('ANXO_NUMERO'),
    Q.FieldAsString('ANXO_DESCRICAO'),
    Q.FieldAsString('ANXO_NUMERO_ITEM'),
    Q.FieldAsString('ANXO_TEXTO_ITEM'),
    Q.FieldAsDateTime('ANXO_INICIO_VIGENCIA'),
    Q.FieldAsDateNullable('ANXO_FIM_VIGENCIA')
  );
end;

function AnexosRepository.CreateListFromQuery(const CacheKey: string; Q: QueryResult): AnexosEtd;
var
  Count: Integer;
  W: TWraper;
begin
  Count := 0;
  SetLength( Result, 1000);

  while not Q.Eof do
  begin

    if Count >= Length(Result) then
      SetLength(Result, Length(Result) * 2);

    Result[ Q.DataSet.RecNo - 1 ] := CreateItemFromQuery( Q );

    Inc(Count);
    Q.Next();
  end;

  SetLength( Result, Count);

  W := TWraper.Create();
  W.Data := Result;

  FCacheObjs.Add(CacheKey, W);
end;

function AnexosRepository.ListarAnexos(TiposTributos: TipoTributoEnumSet;
  Data: TDate): AnexosEtd;
var
  sTiposTrib: string;    
  Q: QueryResult;
  CacheKey: string;
  W: TWraper;
begin
  sTiposTrib := StringService.Default( StringService.Join(',',
    EnumService.SetAsArrayString(TypeInfo(TipoTributoEnumSet), TiposTributos)
  ), '0');

  CacheKey := 'all_tribs_' + sTiposTrib;

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  Q := FConnection.CreateQuery(Format(
    'select distinct a.anxo_id, a.anxo_numero, a.anxo_descricao, a.anxo_numero_item, ' +
    '                a.anxo_texto_item, a.anxo_inicio_vigencia, ' +
    '                a.anxo_fim_vigencia ' +
    'from rtc_anexo a ' +
    'where :data between a.anxo_inicio_vigencia and coalesce(a.anxo_fim_vigencia, :data) ' +
    'and exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where :data between n.ncma_inicio_vigencia and coalesce(n.ncma_fim_vigencia, :data)' +
    '             and n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo in (%s) ) ' +
    'order by anxo_numero, anxo_id  ', [ sTiposTrib ]),
    ParametersBuilder.Create(1)
      .ByName('DATA', Data)
      .Build()
  );
  try
    Result := CreateListFromQuery( CacheKey, Q );
  finally
    Q.Free();
  end;
end;

function AnexosRepository.ListarAnexosCompativeisComEstoque(
  EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): AnexosEtd;
var
  sTiposTrib: string;
  Q: QueryResult;
  CacheKey: string;
  W: TWraper;
begin
  sTiposTrib := StringService.Default( StringService.Join(',',
    EnumService.SetAsArrayString(TypeInfo(TipoTributoEnumSet), TiposTributos)
  ), '0');

  CacheKey := 'all_compat_' + sTiposTrib;

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  Q := FConnection.CreateQuery( Format(
    'select distinct a.anxo_id, a.anxo_numero, a.anxo_descricao, a.anxo_numero_item, ' +
    '                a.anxo_texto_item, a.anxo_inicio_vigencia, ' +
    '                a.anxo_fim_vigencia ' +
    'from rtc_anexo a ' +
    'where :data between a.anxo_inicio_vigencia and coalesce(a.anxo_fim_vigencia, :data) ' +
    'and exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join produtos p on p.nbm starting with n.ncma_ncm_cd ' +
    '                 and p.ativo <> 99 ' + // linha compative com estoque
    '                 and p.cod_empresa = :cod_empresa ' +
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where :data between n.ncma_inicio_vigencia and coalesce(n.ncma_fim_vigencia, :data) ' +
    '             and n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo in (%s)) ' +
    'and not exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = n.ncma_id ' +
    '               inner join produtos p on p.nbm starting with e.encm_ncm_cd ' +
    '                 and p.ativo <> 99 ' + // linha compative com estoque
    '                 and p.cod_empresa = :cod_empresa ' +
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where :data between n.ncma_inicio_vigencia and coalesce(n.ncma_fim_vigencia, :data) ' +
    '             and :data between e.encm_inicio_vigencia and coalesce(e.encm_fim_vigencia, :data) ' +
    '             and n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo in (%s)) ' +
    'order by anxo_numero, anxo_id  ', [ sTiposTrib, sTiposTrib ]),
    ParametersBuilder.Create(1)
      .ByName('COD_EMPRESA', EmpresaId)
      .ByName('DATA', Data)
      .Build()
  );
  try
    Result := CreateListFromQuery( CacheKey, Q );
  finally
    Q.Free();
  end;
end;

function AnexosRepository.ListarAnexosIbsCbs(): AnexosEtd;
var
  Q: QueryResult;
  CacheKey: string;
  W: TWraper;
begin
  CacheKey := 'all_ibscbs';

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  Q := FConnection.CreateQuery(
    'select distinct a.anxo_id, a.anxo_numero, a.anxo_descricao, a.anxo_numero_item, ' +
    '                a.anxo_texto_item, a.anxo_inicio_vigencia, ' +
    '                a.anxo_fim_vigencia ' +
    'from rtc_anexo a ' +
    'where exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo in (%d, %d, %d)) ' +
    'order by anxo_numero, anxo_id  ', [Ord(tbtCBS), Ord(tbtIBSUF), Ord(tbtIBSMun)]
  );
  try
    Result := CreateListFromQuery( CacheKey, Q );
  finally
    Q.Free();
  end;
end;

function AnexosRepository.ListarAnexosIbsCbsCompativeisComEstoque: AnexosEtd;
var
  Q: QueryResult;
  CacheKey: string;
  W: TWraper;
begin
  CacheKey := 'all_ibscbs';

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  Q := FConnection.CreateQuery(
    'select distinct a.anxo_id, a.anxo_numero, a.anxo_descricao, a.anxo_numero_item, ' +
    '                a.anxo_texto_item, a.anxo_inicio_vigencia, ' +
    '                a.anxo_fim_vigencia ' +
    'from rtc_anexo a ' +
    'where exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join produtos p on p.nbm starting with n.ncma_ncm_cd and p.ativo <> 99 ' + // linha compative com estoque
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo in (%d, %d, %d)) ' +
    'and not exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = n.ncma_id ' +
    '               inner join produtos p on p.nbm starting with e.encm_ncm_cd and p.ativo <> 99 ' + // linha compative com estoque
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo in (%d, %d, %d)) ' +
    'order by anxo_numero, anxo_id  ',
    [
      Ord(tbtCBS), Ord(tbtIBSUF), Ord(tbtIBSMun),
      Ord(tbtCBS), Ord(tbtIBSUF), Ord(tbtIBSMun)
    ]
  );
  try
    Result := CreateListFromQuery( CacheKey, Q );
  finally
    Q.Free();
  end;
end;

function AnexosRepository.ListarAnexosImpostoSeletivo: AnexosEtd;
var
  Q: QueryResult;
  CacheKey: string;
  W: TWraper;
begin
  CacheKey := 'all_imp_sel';

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  Q := FConnection.CreateQuery(
    'select distinct a.anxo_id, a.anxo_numero, a.anxo_descricao, a.anxo_numero_item, ' +
    '                a.anxo_texto_item, a.anxo_inicio_vigencia, ' +
    '                a.anxo_fim_vigencia ' +
    'from rtc_anexo a ' +
    'where exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo = %d) ' +
    'order by anxo_numero, anxo_id  ', [ Ord(tbtIS) ]
  );
  try
    Result := CreateListFromQuery( CacheKey, Q );
  finally
    Q.Free();
  end;
end;

function AnexosRepository.ListarAnexosImpostoSeletivoCompativeisComEstoque: AnexosEtd;
var
  Q: QueryResult;
  CacheKey: string;
  W: TWraper;
begin
  CacheKey := 'all_imp_sel';

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  Q := FConnection.CreateQuery(
    'select distinct a.anxo_id, a.anxo_numero, a.anxo_descricao, a.anxo_numero_item, ' +
    '                a.anxo_texto_item, a.anxo_inicio_vigencia, ' +
    '                a.anxo_fim_vigencia ' +
    'from rtc_anexo a ' +
    'where exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join produtos p on p.nbm starting with n.ncma_ncm_cd and p.ativo <> 99 ' + // linha compative com estoque
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo = %d) ' +
    'and not exists(select first 1 1 ' +
    '             from rtc_ncm_aplicavel n ' +
    '               inner join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = n.ncma_id ' +
    '               inner join produtos p on p.nbm starting with e.encm_ncm_cd and p.ativo <> 99 ' + // linha compative com estoque
    '               inner join rtc_classificacao_tributaria c on c.cltr_id = n.ncma_cltr_id ' +
    '               inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '               inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '             where n.ncma_anxo_id = a.anxo_id and tst.tipo_tributo = %d) ' +
    'order by anxo_numero, anxo_id  ', [ Ord(tbtIS), Ord(tbtIS) ]
  );
  try
    Result := CreateListFromQuery( CacheKey, Q );
  finally
    Q.Free();
  end;
end;

end.
