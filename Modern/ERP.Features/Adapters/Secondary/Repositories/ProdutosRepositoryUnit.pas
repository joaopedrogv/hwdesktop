unit ProdutosRepositoryUnit;

interface

uses
  IProdutosRepositoryUnit,
  ProdutoEtdUnit,
  ProdutoGrupoFiscalUpdateModelUnit,
  ProdutoNcmGrupoFiscalUpdateModelUnit,
  ProdutoAnexoResumoModelUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit;

type
  ProdutosRepository = class(IProdutosRepository)
  public
    function ObterResumoProdutosComAnexo(EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): ProdutoAnexoResumoModel; override;
    procedure AtualizarGrupoFiscalEmLote(const Dados: ProdutoGrupoFiscalUpdateModelArray); overload; override;
    procedure AtualizarGrupoFiscalEmLote(const Dados: ProdutoNcmGrupoFiscalUpdateModelArray); overload; override;
  end;

implementation

uses
  SysUtils,
  BaseRepositoryUnit,
  IDataBaseConnectionUnit,
  ScalarResultUnit, StringServiceUnit, EnumServiceUnit,
  ParameterValueUnit , DateAndTimeNullableUnit, QueryResultUnit;

{ ProdutosRepository }

procedure ProdutosRepository.AtualizarGrupoFiscalEmLote(
  const Dados: ProdutoGrupoFiscalUpdateModelArray);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: ProdutoGrupoFiscalUpdateModel;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    Dado := Dados[I];

    ParamsList[I] := ParametersBuilder.Create(5)
      .Add( Dado.GrupoFiscalId )
      .Add( DateTimeNullable.Create(Now, Dado.GrupoFiscalId.IsNull) )
      .Add( Dado.GrupoId )
      .Add( Dado.CodigoId )
      .Add( Dado.EmpresaId )
      .Build();
  end;

  FConnection.ExecuteBatch(
    'UPDATE PRODUTOS SET ' +
    '  GRUPO_FISCAL_IBSCBS = :P_0, ' +
    '  GRUPO_FISCAL_IBSCBS_RESOLVID_EM = :P_1, ' +
    '  REP_INT_ACTIVE = 1 ' +
    'WHERE GRUPO_PROD = :P_2 AND COD_PROD = :P_3 AND COD_EMPRESA = :P_4',
    ParamsList
  );
end;

procedure ProdutosRepository.AtualizarGrupoFiscalEmLote(
  const Dados: ProdutoNcmGrupoFiscalUpdateModelArray);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: ProdutoNcmGrupoFiscalUpdateModel;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    Dado := Dados[I];

    ParamsList[I] := ParametersBuilder.Create(4)
      .Add( Dado.GrupoFiscalId )
      .Add( DateTimeNullable.Create(Now, Dado.GrupoFiscalId.IsNull) )
      .Add( Dado.NCM )
      .Add( Dado.EmpresaId )
      .Build();
  end;

  FConnection.ExecuteBatch(
    'UPDATE PRODUTOS SET ' +
    '  GRUPO_FISCAL_IBSCBS = :P_0, ' +
    '  GRUPO_FISCAL_IBSCBS_RESOLVID_EM = :P_1, ' +
    '  REP_INT_ACTIVE = 1 ' +
    'WHERE NBM = :P_2 AND COD_EMPRESA = :P_3 ',
    ParamsList
  );
end;

function ProdutosRepository.ObterResumoProdutosComAnexo(
  EmpresaId: Integer;
  TiposTributos: TipoTributoEnumSet;
  Data: TDate
): ProdutoAnexoResumoModel;
var
  sTiposTrib: string;
  SR: ScalarResult;
begin
  sTiposTrib := StringService.Default( StringService.Join(',',
    EnumService.SetAsArrayString(TypeInfo(TipoTributoEnumSet), TiposTributos)
  ), '0');

  with FConnection.CreateQuery( Format(
    'select ' +
    '  reg.qtde_ncms_regulares, ' +
    '  reg.qtde_prod_regulares, ' +
    '  -- Campos da reforma ' + sLineBreak +
    '  rt.qtde_ncm_anexo, ' +
    '  rt.qtde_ncm_1p1, ' +
    '  rt.qtde_ncm_np1, ' +
    '  rt.qtde_prod_anexo, ' +
    '  rt.qtde_prod_1p1, ' +
    '  rt.qtde_prod_np1, ' +
    '  rt.primeira_revisao_ibscbs, ' +
    '  rt.ultima_revisao_ibscbs, ' +
    '  incomp.qtde_ncm_incompativel, ' +
    '  incomp.qtde_prod_incompativel, ' +
    '  -- Campos dos NCMs/produtos inexistentes ' + sLineBreak +
    '  ni.qtde_ncms_inexistentes, ' +
    '  ni.qtde_prod_inexistentes, ' +
    '  -- Campos dos NCMs/produtos extintos ' + sLineBreak +
    '  ne.qtde_ncms_extintos, ' +
    '  ne.qtde_prod_extintos ' + 
    'from ' + 
    '  ( ' + 
    '  select  ' + 
    '    count(distinct d.ncm) as qtde_ncm_anexo, ' +
    '    sum(iif(d.qtde_prod_1p1 > 0, 1, 0)) as qtde_ncm_1p1, ' + 
    '    sum(iif(d.qtde_prod_np1 > 0, 1, 0)) as qtde_ncm_np1, ' + 
    '    sum(d.qtde_prod_anexo) as qtde_prod_anexo, ' + 
    '    sum(d.qtde_prod_1p1) as qtde_prod_1p1, ' + 
    '    sum(d.qtde_prod_np1) as qtde_prod_np1, ' + 
    '    min(d.primeira_revisao_ibscbs) as primeira_revisao_ibscbs, ' + 
    '    max(d.ultima_revisao_ibscbs) as ultima_revisao_ibscbs ' + 
    '  from ( ' + 
    '    select c.ncm, ' + 
    '           count(distinct c.grupo_prod || ''-'' || c.cod_prod) as qtde_prod_anexo, ' +
    '           sum(iif(c.qtde_prod = 1, 1, 0)) as qtde_prod_1p1, ' + 
    '           sum(iif(c.qtde_prod = 1, 0, 1)) as qtde_prod_np1, ' + 
    '           min(c.grupo_fiscal_ibscbs_resolvid_em) as primeira_revisao_ibscbs, ' +
    '           max(c.grupo_fiscal_ibscbs_resolvid_em) as ultima_revisao_ibscbs ' + 
    '    from ( ' + 
    '      select distinct  ' + 
    '        p.grupo_prod,  ' + 
    '        p.cod_prod,  ' + 
    '        p.nbm as ncm,  ' + 
    '        p.grupo_fiscal_ibscbs_resolvid_em, ' + 
    '        count(distinct a.anxo_numero) as qtde_prod ' + 
    '      from produtos p ' + 
    '        inner join ncm n on n.codigo = p.nbm ' + 
    '        inner join rtc_ncm_aplicavel na on na.ncma_ncm_cd in ( ' + 
    '          substr(p.nbm, 1, 8), substr(p.nbm, 1, 7), substr(p.nbm, 1, 6),  ' + 
    '          substr(p.nbm, 1, 5), substr(p.nbm, 1, 4), substr(p.nbm, 1, 3),  ' + 
    '          substr(p.nbm, 1, 2) ' + 
    '        ) ' + 
    '        inner join rtc_anexo a on na.ncma_anxo_id = a.anxo_id ' + 
    '        inner join rtc_classificacao_tributaria c on c.cltr_id = na.ncma_cltr_id ' + 
    '        inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' + 
    '        inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' + 
    '        left join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = na.ncma_id ' + 
    '          and p.nbm starting with e.encm_ncm_cd ' + 
    '          and :data between e.encm_inicio_vigencia and coalesce(e.encm_fim_vigencia, :data) ' + 
    '      where p.ativo <> 99  ' + 
    '        and p.cod_empresa = :cod_empresa ' + 
    '        and :data between n.data_inicio and coalesce(n.data_fim, :data) ' + 
    '        and tst.tipo_tributo in (2,3,4) ' + 
    '        and :data between a.anxo_inicio_vigencia and coalesce(a.anxo_fim_vigencia, :data) ' + 
    '        and :data between na.ncma_inicio_vigencia and coalesce(na.ncma_fim_vigencia, :data) ' + 
    '        and :data between c.cltr_inicio_vigencia and coalesce(c.cltr_fim_vigencia, :data) ' + 
    '        and :data between st.sitr_inicio_vigencia and coalesce(st.sitr_fim_vigencia, :data) ' + 
    '        and :data between tst.trst_inicio_vigencia and coalesce(tst.trst_fim_vigencia, :data) ' + 
    '        and e.encm_id is null ' + 
    '      group by p.grupo_prod, p.cod_prod, p.nbm, p.grupo_fiscal_ibscbs_resolvid_em ' + 
    '    ) as c ' + 
    '    group by c.ncm ' + 
    '  ) as d ' + 
    ' ) rt ' + 
    'cross join ( ' + 
    '  select  ' + 
    '    count(distinct p.nbm) as qtde_ncm_incompativel, ' + 
    '    count(*) as qtde_prod_incompativel ' + 
    '  from produtos p ' + 
    '    inner join ncm n on n.codigo = p.nbm ' + 
    '    inner join grupos_fiscais g on g.id = p.grupo_fiscal_ibscbs ' + 
    '  where p.ativo <> 99  ' +
    '    and p.cod_empresa = :cod_empresa ' + 
    '    and p.grupo_fiscal_ibscbs is not null ' + 
    '    and :data between n.data_inicio and coalesce(n.data_fim, :data) ' + 
    '    and not exists ( ' + 
    '      select 1 ' + 
    '      from rtc_ncm_aplicavel na ' + 
    '        inner join rtc_anexo a on na.ncma_anxo_id = a.anxo_id ' + 
    '        inner join rtc_classificacao_tributaria c on c.cltr_id = na.ncma_cltr_id ' + 
    '        inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' + 
    '        inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' + 
    '        left join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = na.ncma_id ' + 
    '          and p.nbm starting with e.encm_ncm_cd ' + 
    '          and :data between e.encm_inicio_vigencia and coalesce(e.encm_fim_vigencia, :data) ' + 
    '      where na.ncma_ncm_cd in ( ' + 
    '        substr(p.nbm, 1, 8), substr(p.nbm, 1, 7), substr(p.nbm, 1, 6),  ' + 
    '        substr(p.nbm, 1, 5), substr(p.nbm, 1, 4), substr(p.nbm, 1, 3),  ' + 
    '        substr(p.nbm, 1, 2) ' + 
    '      ) ' + 
    '      and a.anxo_numero = g.anexo ' + 
    '      and tst.tipo_tributo in (2,3,4) ' + 
    '      and :data between a.anxo_inicio_vigencia and coalesce(a.anxo_fim_vigencia, :data) ' + 
    '      and :data between na.ncma_inicio_vigencia and coalesce(na.ncma_fim_vigencia, :data) ' + 
    '      and :data between c.cltr_inicio_vigencia and coalesce(c.cltr_fim_vigencia, :data) ' + 
    '      and :data between st.sitr_inicio_vigencia and coalesce(st.sitr_fim_vigencia, :data) ' + 
    '      and :data between tst.trst_inicio_vigencia and coalesce(tst.trst_fim_vigencia, :data) ' + 
    '      and e.encm_id is null ' + 
    '    ) ' + 
    ') incomp ' + 
    'cross join ( ' + 
    '  select  ' + 
    '    count(distinct p.nbm) as qtde_ncms_inexistentes,  ' +
    '    count(*) as qtde_prod_inexistentes ' +
    '  from produtos p ' + 
    '  where p.cod_empresa = :cod_empresa ' + 
    '    and p.ativo <> 99 ' + 
    '    and not exists ( ' + 
    '      select 1 from ncm n where n.codigo = p.nbm ' + 
    '    ) ' + 
    ') ni ' + 
    'cross join ( ' + 
    '  select  ' + 
    '    count(distinct p.nbm) as qtde_ncms_extintos,  ' +
    '    count(*) as qtde_prod_extintos ' + 
    '  from produtos p ' + 
    '  where p.cod_empresa = :cod_empresa ' + 
    '    and p.ativo <> 99 ' + 
    '    and exists ( ' + 
    '      select 1 from ncm n1  ' + 
    '      where n1.codigo = p.nbm and n1.data_fim is not null ' + 
    '    ) ' + 
    '    and not exists ( ' + 
    '      select 1 from ncm n2  ' + 
    '      where n2.codigo = p.nbm and n2.data_fim is null ' + 
    '    ) ' + 
    ') ne ' +
    'cross join ( ' +
    '  select  ' + 
    '    count(distinct n.codigo) as qtde_ncms_regulares, ' +
    '    count(*) as qtde_prod_regulares ' +
    '  from produtos p ' + 
    '  left join ncm n on n.codigo = p.nbm ' + 
    '    and :data between n.data_inicio and coalesce(n.data_fim, :data) ' + 
    '  where p.cod_empresa = :cod_empresa ' + 
    '    and p.ativo <> 99 ' + 
    ') reg ',
     [ sTiposTrib, sTiposTrib, sTiposTrib ] ),
    ParametersBuilder.Create(2)
      .ByName('COD_EMPRESA', EmpresaId)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    Result := ProdutoAnexoResumoModel.Create(
      FieldAsInteger('qtde_ncms_regulares'),
      FieldAsInteger('qtde_ncm_anexo'),
      FieldAsInteger('qtde_ncm_1p1'),
      FieldAsInteger('qtde_ncm_np1'),
      FieldAsInteger('qtde_ncm_incompativel'), 
      FieldAsInteger('qtde_ncms_inexistentes'),
      FieldAsInteger('qtde_ncms_extintos'),
      FieldAsInteger('qtde_prod_regulares'),
      FieldAsInteger('qtde_prod_anexo'),
      FieldAsInteger('qtde_prod_1p1'),
      FieldAsInteger('qtde_prod_np1'),
      FieldAsInteger('qtde_prod_incompativel'),
      FieldAsInteger('qtde_prod_inexistentes'),
      FieldAsInteger('qtde_prod_extintos'),
      FieldAsDateTimeNullable('primeira_revisao_ibscbs'),
      FieldAsDateTimeNullable('ultima_revisao_ibscbs')
    );
  finally
    FreeQueryResult()
  end;
end;

end.
