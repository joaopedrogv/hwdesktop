|BLOCO|
CREATE OR ALTER TRIGGER TI_DEVOLUCAO_DEBCRED FOR DEVOLUCAO
ACTIVE AFTER INSERT OR DELETE POSITION 0
AS
  declare variable vdescricao varchar(48);
  declare variable vpercetual_dc t_vl_todos;
  declare variable vpercetual_dc_temp t_vl_todos;
  declare variable vdebcred t_vl_todos;
  declare variable vempusadebcred char(1);
  declare variable vlancdebcred_dev char(1);
  declare variable current_t timestamp;
  declare variable current_d timestamp;
  declare variable vquant t_d_quant;
  declare variable vvalor t_vl_todos;
  /*declare variable vtipo_os varchar(10);*/
begin
  if (substring(user from 1 for 4) = 'REPL') then
    exit;

  if (inserting) then
  begin
    if (coalesce(new.usar_debcred, 'S') = 'N') then
      exit;
  end
  else
  begin
    if (coalesce(old.usar_debcred, 'S') = 'N') then
      exit;
  end

  /*vtipo_os=''; */
  if (inserting) then
  begin
    if (coalesce(new.tipo, '') <> 'D') then
      exit;

    select coalesce(e.usardebitocredito, '') as usardebitocredito,
    coalesce(e.perc_lancdebcred_dev, 0) as perc_lancdebcred_dev,
    coalesce(p.perc_lancdebcred_dev, 0) as perc_lancdebcre_dev2,
    coalesce(e.lancdebcred_dev, '') as lancdebcred_dev from empresa e
    inner join produtos p on e.cod_empresa = p.cod_empresa
    where p.grupo_prod = new.grupo_prod
    and p.cod_prod = new.cod_prod
    and e.cod_empresa = new.cod_empresa
      into :vempusadebcred, :vpercetual_dc, :vpercetual_dc_temp, :vlancdebcred_dev;

    if (((coalesce(new.tipo_venda, '') = 'REQ') or (coalesce(new.tipo_venda, '') = 'OS')) and (coalesce(new.cod_venda, 0) > 0)) then
    begin
      if ((vempusadebcred <> 'S') or (vlancdebcred_dev <> 'S')) then
        exit;
    end
    else
    begin
      if ((vempusadebcred <> 'S') or ((vpercetual_dc <= 0) and (vpercetual_dc_temp <= 0)) or (vlancdebcred_dev <> 'S') ) then
        exit;
    end

    /*if (rtrim(coalesce(new.tipo_venda,''))='OS') then
      select v.tipo_os from pedvenda v
      where v.nped = coalesce(new.cod_venda, -1)
      and v.tipo = coalesce(new.tipo_venda, '')
      and v.cod_empresa = new.cod_empresa
        into :vtipo_os;
        
    if ((select retorno from sp_retorno_debitocredito(new.tipo_venda,new.tipv,:vtipo_os)) <> 'S') then
      exit;*/
  end
  else
  begin
    if (coalesce(old.tipo, '') <> 'D') then
      exit;

    select coalesce(e.usardebitocredito, '') as usardebitocredito,
    coalesce(e.perc_lancdebcred_dev, 0) as perc_lancdebcred_dev,
    coalesce(p.perc_lancdebcred_dev, 0) as perc_lancdebcred_dev2,
    coalesce(e.lancdebcred_dev, '') as lancdebcred_dev from empresa e
    inner join produtos p on e.cod_empresa=p.cod_empresa
    where p.grupo_prod = old.grupo_prod
    and p.cod_prod = old.cod_prod
    and e.cod_empresa = old.cod_empresa
      into :vempusadebcred, :vpercetual_dc, :vpercetual_dc_temp, :vlancdebcred_dev;

    if (((coalesce(old.tipo_venda, '') = 'REQ') or (coalesce(old.tipo_venda, '') = 'OS')) and (coalesce(old.cod_venda, 0) > 0)) then
    begin
      if ((vempusadebcred <> 'S') or (vlancdebcred_dev <> 'S')) then
        exit;
    end
    else
    begin
      if ((vempusadebcred <> 'S') or ((vpercetual_dc <= 0) and (vpercetual_dc_temp <= 0)) or (vlancdebcred_dev <> 'S')) then
        exit;
    end

    /*if (rtrim(coalesce(old.tipo_venda, '')) = 'OS') then
      select v.tipo_os from pedvenda v
      where v.nped = coalesce(old.cod_venda, -1)
      and v.tipo = coalesce(old.tipo_venda, '')
      and v.cod_empresa = old.cod_empresa
        into :vtipo_os;

    if ((select retorno from sp_retorno_debitocredito(old.tipo_venda,old.tipv,:vtipo_os)) <> 'S') then
      exit;*/
  end

  if (coalesce(vpercetual_dc_temp,0) > 0) then
    vpercetual_dc = vpercetual_dc_temp;

  if (inserting) then
  begin
    if (((coalesce(new.tipo_venda, '') = 'REQ') or (coalesce(new.tipo_venda, '') = 'OS'))
      and (coalesce(new.cod_venda, 0) > 0)) then
    begin
      select sum(coalesce(pp.vl_debcred, 0)) vl_debcred,
             sum(coalesce(pp.quant_ped_item, 0)) quant_ped_item from pedvenda_prod pp
      where pp.nped = new.cod_venda
      and pp.tipo = new.tipo_venda
      and pp.cod_empresa = new.cod_empresa
      and pp.grupo_prod = new.grupo_prod
      and pp.cod_prod = new.cod_prod
      and (pp.status <> 'CANCELADO' or pp.status is null)
        into :vvalor, :vquant;

      vdebcred = iif(coalesce(vquant, 0) > 0, coalesce(vvalor, 0) / coalesce(vquant, 0), coalesce(vvalor, 0));

      vdebcred = (-1) * round(coalesce(vdebcred, 0) * coalesce(new.quant, 0), 2);
    end
    else
      vdebcred = - (coalesce(new.quant,0) * coalesce(new.valor,0) * vpercetual_dc) / 100;
  end
  else
  begin
    if (((coalesce(old.tipo_venda, '') = 'REQ') or (coalesce(old.tipo_venda, '') = 'OS'))
      and (coalesce(old.cod_venda, 0) > 0)) then
    begin
      select sum(coalesce(pp.vl_debcred, 0)) vl_debcred,
             sum(coalesce(pp.quant_ped_item, 0)) quant_ped_item from pedvenda_prod pp
      where pp.nped = old.cod_venda
      and pp.tipo = old.tipo_venda
      and pp.cod_empresa = old.cod_empresa
      and pp.grupo_prod = old.grupo_prod
      and pp.cod_prod = old.cod_prod
      and (pp.status <> 'CANCELADO' or pp.status is null)
        into :vvalor, :vquant;

      vdebcred = iif(coalesce(vquant, 0) > 0, coalesce(vvalor, 0) / coalesce(vquant, 0), coalesce(vvalor, 0));

      vdebcred = round(coalesce(vdebcred, 0) * coalesce(old.quant, 0), 2);
    end
    else
      vdebcred = (coalesce(old.quant,0) * coalesce(old.valor,0) * vpercetual_dc) / 100;
  end

  if (inserting) then
    vdescricao = 'DEBITO REF. A DEVOLUCAO ITEM ';
  else
    vdescricao = 'ESTORNO - EXCLUSAO DE ITEM DEV ';

  if ((inserting) and (new.cod_vendedor is not null)) then
  begin
    select current_d, current_t from sp_current_ts(new.cod_empresa) into :current_d, :current_t;

    insert into LANC_DEBCRED (COD_LANC, COD_EMPRESA, COD_VENDEDOR, DATA_LANC, HORA_LANC, ORIGEM_LANC, VL_LANCDEBCRED, NPEDORIGEM, DESCRICAO)
    values ((select COD from INCREMENTA_CODIGO(new.cod_empresa, 'LANC_DEBCRED')),
    new.cod_empresa, new.cod_vendedor, :current_d, :current_t, 'DEV',
    (:vdebcred), new.sequencia, :vdescricao||'|'||new.seqid||'|'||new.grupo_prod||'|'||new.cod_prod);
  end
  else if (old.cod_vendedor is not null) then
  begin
    select current_d, current_t from sp_current_ts(new.cod_empresa) into :current_d, :current_t;

    insert into LANC_DEBCRED (COD_LANC, COD_EMPRESA, COD_VENDEDOR, DATA_LANC, HORA_LANC, ORIGEM_LANC, VL_LANCDEBCRED, NPEDORIGEM, DESCRICAO)
    values ((select COD from INCREMENTA_CODIGO(old.cod_empresa, 'LANC_DEBCRED')),
    old.cod_empresa, old.cod_vendedor, :current_d, :current_t, 'DEV',
    (:vdebcred), old.sequencia, :vdescricao||'|'||old.seqid||'|'||old.grupo_prod||'|'||old.cod_prod);
  end
end;
|/BLOCO|

UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = 'PERM ALT PROD PRECO DIFERENCIADO PARA PRECO NORMAL' WHERE COD_PROCESSO = 'VND285';
UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = 'PERM ALT PROD PRECO PROMOCAO PARA PRECO NORMAL' WHERE COD_PROCESSO = 'VND286';
UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = 'PERM ALT PROD PRECO POR QTDE PARA PRECO NORMAL' WHERE COD_PROCESSO = 'VND226';

ALTER TABLE HIST_ESTOQUE_DIARIO_PROD ADD BAIXOU_EST CHAR(1);

|BLOCO|
CREATE OR ALTER TRIGGER TR_NOTAFISCAL_EST_PRE_NF FOR NOTAFISCAL
ACTIVE AFTER UPDATE POSITION 0
AS
  declare variable vtipo_item char(1);
  declare variable vgrupo_prod integer;
  declare variable vcod_prod char(6);
  declare variable vcod_grade integer;
  declare variable vnitem integer;
  declare variable vquantidade t_d_quant;
  declare variable vvalor_unitario t_vl_todos;
  declare variable vvalor_total t_vl_todos;
  declare variable vprec_cusm_prod t_vl_todos;
  declare variable vcodigo_nop t_n_geral;
  declare variable valt_est char(1);
  declare variable valiq_icm t_n_geral;
  declare variable vbase_icm t_vl_todos;
  declare variable vvalor_icm t_vl_todos;
  declare variable valiq_icmsub t_n_geral;
  declare variable vbase_icmsub t_vl_todos;
  declare variable vvalor_icmsub t_vl_todos;
  declare variable valiq_ipi t_n_geral;
  declare variable vbase_ipi t_vl_todos;
  declare variable vvalor_ipi t_vl_todos;
  declare variable vchassi char(17);
  declare variable vbaixa_estoque integer;
begin
  /* Trigger text */
  if (substring(user from 1 for 4) = 'REPL') then
    exit;

  if (new.natureza_nf <> 'S') then
    exit;

  if (new.tipo_nf <> 'P') then
    exit;

  if (trim(coalesce(old.status, '')) <> 'ImportaXML') then
    exit;

  if (trim(coalesce(new.status, '')) <> 'Fechada') then
    exit;
  
  select config_sistema.value1_f from config_sistema
  where config_sistema.chave = 'nf_s_baixa_estoque_import'
  and config_sistema.cod_empresa = new.cod_empresa into :vbaixa_estoque;

  if (coalesce(vbaixa_estoque, 0) <= 0) then
    exit;

  for select notafiscal_item.tipo_item,
      notafiscal_item.grupo_prod,
      notafiscal_item.cod_prod,
      notafiscal_item.cod_grade,
      notafiscal_item.nitem,
      notafiscal_item.quantidade,
      notafiscal_item.valor_unitario,
      notafiscal_item.valor_total,
      notafiscal_item.prec_cusm_prod,
      notafiscal_item.codigo_nop,
      nat_op.alt_est,
      notafiscal_item.aliq_icm,
      notafiscal_item.base_icm,
      notafiscal_item.valor_icm,
      notafiscal_item.aliq_icmsub,
      notafiscal_item.base_icmsub,
      notafiscal_item.valor_icmsub,
      notafiscal_item.aliq_ipi,
      notafiscal_item.base_ipi,
      notafiscal_item.valor_ipi,
      notafiscal_item.chassi from notafiscal_item
      left join nat_op on nat_op.codigo_nop = notafiscal_item.codigo_nop
      where notafiscal_item.cod_nf = new.cod_nf
      and notafiscal_item.cod_empresa = new.cod_empresa
      order by notafiscal_item.nitem
        into :vtipo_item, :vgrupo_prod, :vcod_prod, :vcod_grade,
          :vnitem, :vquantidade, :vvalor_unitario, :vvalor_total,
          :vprec_cusm_prod, :vcodigo_nop, :valt_est,
          :valiq_icm, :vbase_icm, :vvalor_icm,
          :valiq_icmsub, :vbase_icmsub, :vvalor_icmsub,
          :valiq_ipi, :vbase_ipi, :vvalor_ipi,
          :vchassi do
  begin
    if ((trim(coalesce(vtipo_item, '')) = 'P') and (coalesce(valt_est, 'S') <> 'N')) then
    begin
      update notafiscal_item set notafiscal_item.altera_estoque_cfop = 'S'
      where notafiscal_item.cod_nf = new.cod_nf
      and notafiscal_item.cod_empresa = new.cod_empresa
      and notafiscal_item.nitem = :vnitem;

      execute procedure movimenta_estoque
        (:vgrupo_prod, :vcod_prod, new.cod_empresa, :vcod_grade, 0, :vquantidade, 1);

      insert into hist_estoque_diario_prod (tipo, seqid, cod_empresa,
       tipor, natureza, data, grupo_prod, cod_prod, cod_grade, chassi, numero, qtde,
       valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_cliente, cod_vendedor, cod_cfop,
       aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,
       aliq_ipi, base_ipi, valor_ipi, cod_nf, baixou_est)
      values (:vtipo_item, (select cod from incrementa_codigo(new.cod_empresa, 'HIST_ESTOQUE_DIARIO_PROD')), new.cod_empresa,
       'NF', 'S', new.data_lanc, :vgrupo_prod, :vcod_prod, :vcod_grade, :vchassi, new.num_nf, :vquantidade,
       :vvalor_unitario, :vvalor_total, 'N', :vprec_cusm_prod, :vnitem, new.cod_cliente, new.cod_vendedor, :vcodigo_nop,
       :valiq_icm, :vbase_icm, :vvalor_icm, :valiq_icmsub, :vbase_icmsub, :vvalor_icmsub,
       :valiq_ipi, :vbase_ipi, :vvalor_ipi, new.cod_nf, 'S');
    end
  end
end;
|/BLOCO|

|BLOCO|
CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA(
    ORDEM,
    TIPO,
    NATUREZA,
    COD_EMPRESA,
    EMPRESA,
    NUMDOC,
    DATA,
    QTDE,
    VALOR_UNIT,
    VALOR_TOTAL,
    ALTERA_CUSTO,
    CUSTO_MEDIO,
    NITEM_ID,
    GRUPO_PROD,
    COD_PROD,
    NUM_FAB_PROD,
    DESCR_PROD,
    COD_GRADE,
    GRADE,
    COD_CLIENTE_FORNECEDOR,
    CLIENTE_FORNECEDOR,
    TIPO_VND_OS_DEV,
    TIPO_VENDA,
    NUM_VENDA,
    COD_NF,
    COD_CFOP,
    CFOP,
    ALIQ_ICM,
    BASE_ICM,
    VALOR_ICM,
    ALIQ_ST,
    BASE_ST,
    VALOR_ST,
    ALIQ_IPI,
    BASE_IPI,
    VALOR_IPI,
    DATA_ESTOQUE,
    SEQID)
AS
select '4' "Ordem", 'BAL' || ini.TIP_BAL "Tipo",
iif(coalesce(ingr.qtd_dif_bal, ini.qtd_dif_bal) > 0, 'E', 'S') "Natuzeza", ini.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",
0 "Numero", ini.data_confirm "Data",
case when (coalesce(ingr.cod_grade, 0) > 0) then
       case when (ingr.qtd_dif_bal > 0) then
              coalesce(ingr.qtd_dif_bal, 0)
            else
              coalesce(ingr.qtd_dif_bal, 0) * -1
       end
     else
       case when (ini.qtd_dif_bal > 0) then
              coalesce(ini.qtd_dif_bal, 0)
            else
              coalesce(ini.qtd_dif_bal, 0) * -1
       end
end "Quantidade",
0 "Valor Unit", 0 "Valor Total",
'N' "Altera Custo", ini.pcust_mc "Custo Med", 0 "Seq ID1",
ini.grupo_prod "Grupo", ini.cod_prod "Cod Prod", ini.num_fab_prod "Num Fab",
pr.descr_prod "Descricao",
coalesce(ingr.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao,'SEM GRADE') "Descricao Grade",
0 "Cod Cliente", '' "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", ini.data_confirm "Data Estoque", 0 "Seq Id"
  from estoque_ini ini
left join estoque_ini_grade ingr on ini.grupo_prod = ingr.grupo_prod and ini.cod_prod = ingr.cod_prod and ini.cod_empresa = ingr.cod_empresa and ini.data_cadastro = ingr.data_cadastro
left join grade gra on gra.cod_grade = ingr.cod_grade and gra.cod_empresa = ingr.cod_empresa
left join produtos pr on pr.grupo_prod = ini.grupo_prod and pr.cod_prod = ini.cod_prod and pr.cod_empresa = ini.cod_empresa
inner join empresa emp on emp.cod_empresa = ini.cod_empresa
union all
select 1 "Ordem", 'NF' "Tipo", nf4.natureza_nf "Natureza",
nf4.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nf4.num_nf "Numero", nf4.data_ent_saida "Data",
case when grcomp.QTDE is null then
      it4.quantidade
    else
      grcomp.qtde
end "Quantidade",
it4.valor_unitario "Valor Unit", it4.valor_total "Valor Total",
case when (coalesce(it4.altera_custo_cfop, 'S') = '') then
       'S'
     else
       coalesce(it4.altera_custo_cfop, 'S')
end "Altera Custo",
it4.prec_cusm_prod "Custo Med", it4.nitem "N Item/Id",
it4.grupo_prod "Grupo", it4.cod_prod "Cod Prod", pr.num_fab_prod "Num Fab",
case when (it4.cod_grade > 0) then
       it4.descricao_item||' - '||coalesce(gra.descricao,'')
     else
       it4.descricao_item
end  "Descricao",
coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'SEM GRADE') "Grade",
nf4.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo Vnd/OS/DEV", '' "Tipo Venda", 0 "Num Venda",
coalesce(nf4.cod_nf, 0) "Cod NF", it4.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
coalesce(it4.aliq_icm, 0) "Aliq ICM", coalesce(it4.base_icm, 0) "Base ICM", coalesce(it4.valor_icm, 0) "Valor ICM",
coalesce(it4.aliq_icmsub, 0) "Aliq ST", coalesce(it4.base_icmsub, 0) "Base ST", coalesce(it4.valor_icmsub, 0) "Valor ST",
coalesce(it4.aliq_ipi, 0) "Aliq IPI", coalesce(it4.base_ipi, 0) "Base IPI", coalesce(it4.valor_ipi, 0) "Valor IPI", nf4.data_estoque "Data Estoque", nf4.cod_nf "Seq Id"
from notafiscal nf4
inner join notafiscal_item it4 on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa
inner join empresa emp on emp.cod_empresa = nf4.cod_empresa
left join nat_op nat on nat.codigo_nop = it4.codigo_nop
left join cod_grade_prod_compra grcomp on
it4.grupo_prod = grcomp.grupo_prod and it4.cod_prod = grcomp.cod_prod and it4.cod_empresa = grcomp.cod_empresa and
it4.cod_nf = grcomp.num_nota_nfe and it4.nitem = grcomp.cod_forn_nfe
left join grade gra on grcomp.cod_grade = gra.cod_grade and grcomp.cod_empresa = gra.cod_empresa
inner join produtos pr on it4.grupo_prod = pr.grupo_prod and it4.cod_prod = pr.cod_prod
and it4.cod_empresa = pr.cod_empresa
inner join clientes cl on nf4.cod_cliente=cl.cod_cliente and nf4.cod_empresa=cl.cod_empresa
where nf4.natureza_nf = 'E' and (nf4.status = 'Fechada')
and (it4.altera_estoque_cfop <> 'N' or it4.altera_estoque_cfop is null)
and nf4.ativo=1
union all
select 1 "Ordem", 'NF' "Tipo", 'E' "Natureza",
nfe.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nfe.num_nota_nfe "Numero", nfe.data_lanc_nfe "Data",
case when grcomp.QTDE is null then
       infe.quant_item_nfe
     else
       grcomp.qtde
end "Quantidade",
infe.vlun_item_nfe "Valor Unit", infe.vltot_item_nfe "Valor Total",
coalesce(nat.calc_custo, 'S') "Altera Custo", coalesce(infe.prec_cusm_prod, 0) "Custo Med", coalesce(infe.n_item, 0)  "N Item/Id",
infe.grupo_prod "Grupo", infe.cod_prod "Cod Prod", infe.num_fab_prod "Num Fab",
case when (grcomp.cod_grade > 0) then
       infe.descprod||' - '||coalesce(gra.descricao,'')
     else
       infe.descprod
end  "Descricao",
coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'SEM GRADE') "Grade",
null "Cod Cliente", fr.nome "Cliente/Fornecedor",
'' "Tipo Vnd/OS/DEV", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", infe.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
coalesce(infe.alicm_item_nfe, 0) "Aliq ICM",
coalesce(infe.baseicms_it_nfe, 0) "Base ICM", coalesce(infe.icms_it_nfe, 0) "Valor ICM",
0 "Aliq ST", coalesce(infe.bicmsub_nfe, 0) "Base ST", coalesce(infe.icmsub_nfe, 0) "Valor ST",
0 "Aliq IPI", coalesce(infe.baseipi_it_nfe, 0) "Base IPI", coalesce(infe.ipi_item_nfe, 0) "Valor IPI",
nfe.data_lanc_nfe "Data Estoque", nfe.num_nota_nfe "Seq Id"
from nf_entrada nfe
inner join item_nf_entrada infe on infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe and infe.cod_empresa = nfe.cod_empresa
inner join empresa emp on emp.cod_empresa = nfe.cod_empresa
left join nat_op nat on nat.codigo_nop = infe.codigo_nop
left join cod_grade_prod_compra grcomp on
infe.grupo_prod = grcomp.grupo_prod and infe.cod_prod = grcomp.cod_prod and infe.cod_empresa = grcomp.cod_empresa and
infe.num_nota_nfe = grcomp.num_nota_nfe and infe.cod_forn_nfe = grcomp.cod_forn_nfe
left join grade gra on grcomp.cod_grade = gra.cod_grade and grcomp.cod_empresa = gra.cod_empresa
inner join produtos pr on infe.grupo_prod = pr.grupo_prod and infe.cod_prod = pr.cod_prod
and infe.cod_empresa = pr.cod_empresa
inner join fornecedor fr on fr.codigo_f = nfe.cod_forn_nfe and fr.cod_empresa = nfe.cod_empresa
where nfe.status_nfe = 'CONFIRMADA'
and nfe.ativo = 1
union all
select '1' "Ordem", 'NF' "Tipo", 'S' "Natureza",
nfs.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nfs.num_nf_vnd "Numero",
nfs.data_ets_vnd "Data",
infs.quant_item_vnd "Quantidade",
infs.vlun_item_vnd "Valor Unit", infs.vltot_item_vnd "Valor Total",
'N' "Altera Custo",
0 "Custo Med", 0 "N Item/Id",
infs.grupo_prod "Grupo", infs.cod_prod "Cod Prod", infs.num_fab_prod "Num Fab",
infs.desc_prod_nf "Descricao",
0 "Cod Grade", 'SEM GRADE' "Grade",
0 "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo Vnd/OS/DEV", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", infs.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
0 "Aliq ICM", coalesce(infs.baseicms_it, 0) "Base ICM", coalesce(infs.icms_it, 0) "Valor ICM",
0 "Aliq ST", coalesce(infs.bicmsub_vnd, 0) "Base ST", coalesce(infs.icmsub_vnd, 0) "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
nfs.data_ets_vnd "Data Estoque", nfs.num_nf_vnd "Seq ID"  from nf_venda nfs
inner join item_nfvenda infs on infs.num_nf_vnd = nfs.num_nf_vnd and infs.cod_empresa = nfs.cod_empresa
inner join empresa emp on emp.cod_empresa = nfs.cod_empresa
inner join clientes cl on cl.cod_cliente = nfs.cod_cliente and cl.cod_empresa = nfs.cod_empresa
left join nat_op nat on nat.codigo_nop = infs.codigo_nop
union all
select 2 "Ordem", 'PDC' "Tipo", 'E' "Natureza", pi.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", pd.cod_producao "Numero", pd.data_fechamento "Data",
pi.quantidade "Quantidade",
pi.prec_cus_prod "Custo Unit", (pi.quantidade * pi.prec_cus_prod) "Custo Total",
'N' "Altera Custo", pi.prec_cusm_prod "Custo Med", pi.nitem "N Item",
pi.grupo_prod "Grupo", pi.cod_prod "Cod Prod", pi.num_fab_prod "Num Fab",
pi.descr_prod "Descricao",
gra.cod_grade "Cod Grade", gra.descricao "Descricao Grade",
0 "Cod Cliente", emp.nome_emp "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", pd.data_estoque "Data Estoque", pd.cod_producao "Seq Id"
from producao pd
inner join producao_item pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa
inner join empresa emp on emp.cod_empresa = pd.cod_empresa
left join grade gra on gra.cod_grade = pi.cod_grade and gra.cod_empresa = pi.cod_empresa
where pd.status = 'FECHADO'
union all
select 3 "Ordem", 'DEV' "Tipo", 'E' "Natureza", dev.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", dev.sequencia "Numero", dev.data "Data",
dev.quant "Quantidade",
dev.valor "Valor Unit", (dev.valor * dev.quant) "Valor Total",
'N' "Altera Custo", dev.pcust_mc "Custo Med", dev.seqid "Seq ID1",
dev.grupo_prod "Grupo", dev.cod_prod "Cod Prod", dev.num_fab_prod "Num Fab",
dev.descricao "Descricao",
coalesce(gra.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao,'SEM GRADE') "Descricao Grade",
cl.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
dev.tipo "Tipo", dev.tipo_venda "Tipo Venda", coalesce(dev.cod_venda, 0) "Num Venda",
coalesce(dev.cod_nf, 0) "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", dev.data_estoque "Data Estoque", dev.sequencia "Seq Id"
from devolucao dev
inner join empresa emp on emp.cod_empresa = dev.cod_empresa
left join grade gra on gra.cod_grade = dev.cod_grade and gra.cod_empresa = dev.cod_empresa
inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa
where coalesce(dev.nf_gerou, '') <> 'S'
union all
select 1 "Ordem", pv.tipo "Tipo", 'S' "Natureza", ipv.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", pv.nped "Numero",
pv.data_ped "Data",
ipv.quant_ped_item "Quantidade",
ipv.vlun_ped_item "Valor Unit" , ipv.vltot_ped_item "Valor Total",
'N' "Altera Custo", ipv.pcust_mc "Custo Med", ipv.nitem "N Item",
ipv.grupo_prod "Grupo", ipv.cod_prod "Cod Prod", ipv.num_fab_prod "Num Fab",
case when (ipv.cod_grade > 0) then
       ipv.descr_prod_ped ||' - '||coalesce(gra.descricao,'')
     else
       ipv.descr_prod_ped
end "Descricao",
coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'SEM GRADE') "Grade",
cl.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
case when pv.tipo = 'REQ' then
       pv.tipv
     else pv.tipo_os
end "Tipo Vnd/OS", '' "Tipo Venda", 0 "Num Venda",
coalesce(ipv.cod_nf, 0) "Cod NF", ipv.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", pv.data_estoque "Data Estoque", pv.nped "Seq Id"
from pedvenda pv
inner join pedvenda_prod ipv on ipv.tipo = pv.tipo and ipv.nped = pv.nped and ipv.cod_empresa = pv.cod_empresa
inner join produtos pr on pr.cod_prod = ipv.cod_prod and pr.grupo_prod = ipv.grupo_prod and pr.cod_empresa = ipv.cod_empresa
inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa
inner join empresa emp on emp.cod_empresa = pv.cod_empresa
left join grade gra on gra.cod_grade = ipv.cod_grade and gra.cod_empresa = ipv.cod_empresa
left join nat_op nat on nat.codigo_nop = ipv.codigo_nop
where pv.status_ped = 'FECHADA' and pv.tipo <> 'ORC'
and ((ipv.status is null) or (ipv.status <> 'CANCELADO')) and pv.ativo = 1
union all
select 2 "Ordem", 'PDC' "Tipo", 'S' "Natureza", pi.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", pd.cod_producao "Num Producao", pd.data_fechamento "Data",
(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) "Quantidade",
pi.prec_cusm_prod "Custo Unit",
((coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) * pi.prec_cusm_prod) "Custo Total",
'N' "Altera Custo", pi.prec_cusm_prod "Custo Med", pi.nitem "N Item",
pi.grupo_prod "Grupo", pi.cod_prod "Cod Prod", pi.num_fab_prod "Num Fab.",
pi.descr_prod "Descricao", gra.cod_grade "Cod. Grade", gra.descricao "Descricao Grade",
0 "Cod Cliente", emp.nome_emp "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", pd.data_estoque "Data Estoque", pd.cod_producao "Seq Id"
from producao pd
inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa
inner join empresa emp on emp.cod_empresa = pd.cod_empresa
left join grade gra on gra.cod_grade = pi.cod_grade and gra.cod_empresa = pi.cod_empresa
where pd.status = 'FECHADO'
union all
select case when trim(h.tipor) = 'NF' then
              1
            when trim(h.tipor) = 'DEV' then
              3
            when trim(h.tipor) = 'COR' then
              4
            else
              2
end "Ordem",
case when trim(h.tipor) = 'COR' then
       trim(h.tipor)
     else
       trim(h.tipor)||'X'
end "Tipo",
h.natureza, h.cod_empresa, emp.nome_emp EMPRESA, h.numero "Num NF", h.data "Data",
coalesce(h.qtde, 0) "Quantidade", coalesce(h.valor_unit, 0) "Valor Unit", coalesce(h.valor_tot, 0) "Valor Total",
case when trim(h.tipor) = 'NF' then
       coalesce(h.alterou_custo, 'S')
     else
       coalesce(h.alterou_custo, 'N')
end "Altera Custo",
h.custo_med "Custo Med", h.nitem "N Item",
h.grupo_prod "Grupo", h.cod_prod "Cod Prod", pr.num_fab_prod "Num Fab.",
rtrim(pr.descr_prod) || case when coalesce(gra.cod_grade, 0) = 0 then
                               ''
                             else
                               ' - ' || gra.descricao
                        end "Descricao",
coalesce(h.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao, 'SEM GRADE') "Descricao Grade",
h.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
coalesce(h.cod_nf, 0) "Cod NF", h.cod_cfop "Cod CFOP", nat.descricao_nop "CFOP",
coalesce(h.aliq_icm, 0) "Aliq ICM", coalesce(h.base_icm, 0) "Base ICM", coalesce(h.valor_icm, 0) "Valor ICM",
coalesce(h.aliq_st, 0) "Aliq ST", coalesce(h.base_st, 0) "Base ST", coalesce(h.valor_st, 0) "Valor ST",
coalesce(h.aliq_ipi, 0) "Aliq IPI", coalesce(h.base_ipi, 0) "Base IPI", coalesce(h.valor_ipi, 0) "Valor IPI", h.data "Data Estoque", h.seqid "Seq Id"
from hist_estoque_diario h
inner join produtos pr on pr.grupo_prod = h.grupo_prod and pr.cod_prod = h.cod_prod and pr.cod_empresa = h.cod_empresa
left join grupos gr on gr.codigo_grup = pr.grupo_prod
left join grade gra on gra.cod_grade = h.cod_grade and gra.cod_empresa = h.cod_empresa
left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and gp.cod_empresa = pr.cod_empresa
left join clientes cl on cl.cod_cliente = h.cod_cliente and cl.cod_empresa = h.cod_empresa
inner join empresa emp on emp.cod_empresa = pr.cod_empresa
left join nat_op nat on nat.codigo_nop = h.cod_cfop
union all
select case when trim(h.tipor) = 'NF' then
              1
            when trim(h.tipor) = 'DEV' then
              3
            when trim(h.tipor) = 'COR' then
              4
            else
              2
end "Ordem",
case when (coalesce(h.baixou_est, '') = 'S') then
       trim(h.tipor)     
     when trim(h.tipor) = 'COR' then
       trim(h.tipor)
     else
       trim(h.tipor)||'X'
end "Tipo",
h.natureza, h.cod_empresa, emp.nome_emp EMPRESA, h.numero "Num NF", h.data "Data",
coalesce(h.qtde, 0) "Quantidade", coalesce(h.valor_unit, 0) "Valor Unit", coalesce(h.valor_tot, 0) "Valor Total",
case when trim(h.tipor) = 'NF' then
       coalesce(h.alterou_custo, 'S')
     else
       coalesce(h.alterou_custo, 'N')
end "Altera Custo",
h.custo_med "Custo Med", h.nitem "N Item",
h.grupo_prod "Grupo", h.cod_prod "Cod Prod", pr.num_fab_prod "Num Fab.",
rtrim(pr.descr_prod) || case when coalesce(gra.cod_grade, 0) = 0 then
                               ''
                             else
                               ' - ' || gra.descricao
                        end "Descricao", coalesce(h.cod_grade, 0) "Cod. Grade",
coalesce(gra.descricao, 'SEM GRADE') "Descricao Grade",
h.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
coalesce(h.cod_nf, 0) "Cod NF", h.cod_cfop "Cod CFOP", nat.descricao_nop "CFOP",
coalesce(h.aliq_icm, 0) "Aliq ICM", coalesce(h.base_icm, 0) "Base ICM", coalesce(h.valor_icm, 0) "Valor ICM",
coalesce(h.aliq_st, 0) "Aliq ST", coalesce(h.base_st, 0) "Base ST", coalesce(h.valor_st, 0) "Valor ST",
coalesce(h.aliq_ipi, 0) "Aliq IPI", coalesce(h.base_ipi, 0) "Base IPI", coalesce(h.valor_ipi, 0) "Valor IPI", h.data "Data Estoque", h.seqid "Seq Id"
from hist_estoque_diario_prod h
inner join produtos pr on pr.grupo_prod = h.grupo_prod and pr.cod_prod = h.cod_prod and pr.cod_empresa = h.cod_empresa
left join grupos gr on gr.codigo_grup = pr.grupo_prod
left join grade gra on gra.cod_grade = h.cod_grade and gra.cod_empresa = h.cod_empresa
left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and gp.cod_empresa = pr.cod_empresa
left join clientes cl on cl.cod_cliente = h.cod_cliente and cl.cod_empresa = h.cod_empresa
inner join empresa emp on emp.cod_empresa = pr.cod_empresa
left join nat_op nat on nat.codigo_nop = h.cod_cfop;
|/BLOCO|

|BLOCO|
CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA2(
    ORDEM,
    TIPO,
    TIPO2,
    NATUREZA,
    COD_EMPRESA,
    EMPRESA,
    NUMDOC,
    DATA,
    DATA_CONFIRM,
    STATUS,
    QTDE,
    VALOR_UNIT,
    VALOR_TOTAL,
    ALTERA_ESTOQUE,
    ALTERA_CUSTO,
    CUSTO_MEDIO,
    NITEM_ID,
    GRUPO_PROD,
    COD_PROD,
    NUM_FAB_PROD,
    DESCR_PROD,
    COD_GRADE,
    GRADE,
    COD_CLIENTE_FORNECEDOR,
    CLIENTE_FORNECEDOR,
    TIPO_VND_OS_DEV,
    TIPO_VENDA,
    NUM_VENDA,
    COD_NF,
    COD_CFOP,
    CFOP,
    ALIQ_ICM,
    BASE_ICM,
    VALOR_ICM,
    ALIQ_ST,
    BASE_ST,
    VALOR_ST,
    ALIQ_IPI,
    BASE_IPI,
    VALOR_IPI,
    DATA_ESTOQUE,
    SEQID)
AS
select '4' "Ordem", 'BAL' || ini.TIP_BAL "Tipo", 'BAL' || ini.TIP_BAL "Tipo2",
iif(coalesce(ingr.qtd_dif_bal, ini.qtd_dif_bal) > 0, 'E', 'S') "Natuzeza", ini.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",
0 "Numero", ini.data_cadastro "Data", ini.data_confirm "Data Confirm",
case when (ini.data_confirm is not null) then
 'FECHADA'
else
  '' end,
case when (coalesce(ingr.cod_grade, 0) > 0) then
    abs(coalesce(ingr.qtd_dif_bal, 0))
else
    abs(coalesce(ini.qtd_dif_bal, 0))
end "Quantidade",
0 "Valor Unit", 0 "Valor Total",
case when (ini.data_confirm is not null) then 'S'
     else 'N' end "Altera Estoque",
'N' "Altera Custo", ini.pcust_mc "Custo Med", 0 "Seq ID",
ini.grupo_prod "Grupo", ini.cod_prod "Cod Prod", ini.num_fab_prod "Num Fab",
pr.descr_prod "Descricao",
coalesce(ingr.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao,'SEM GRADE') "Descricao Grade",
0 "Cod Cliente", '' "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
case when (ini.data_confirm is not null) then ini.data_confirm
else ini.data_cadastro end "Data Estoque", 0 "Seq Id"
  from estoque_ini ini
left join estoque_ini_grade ingr on ini.grupo_prod = ingr.grupo_prod and ini.cod_prod = ingr.cod_prod and ini.cod_empresa = ingr.cod_empresa and ini.data_cadastro = ingr.data_cadastro
left join grade gra on gra.cod_grade = ingr.cod_grade and gra.cod_empresa = ingr.cod_empresa
left join produtos pr on pr.grupo_prod = ini.grupo_prod and pr.cod_prod = ini.cod_prod and pr.cod_empresa = ini.cod_empresa
inner join empresa emp on emp.cod_empresa = ini.cod_empresa
union all
/*select '4' "Ordem", 'BALG*' "Tipo", 'BALG' "Tipo2",
case when (balp.qtd_dif_bal > 0) then 'E' else 'S' end "Natuzeza", balp.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",
0 "Numero", cast(cast(balp.data_hora_leitura as date) as timestamp) "Data", null "Data Confirm",
'',
case when (coalesce(balpg.cod_grade, 0) > 0) then
  case when (balpg.qtd_dif_bal > 0) then
    coalesce(balpg.qtd_dif_bal, 0)
  else
    coalesce(balpg.qtd_dif_bal, 0) * -1
  end
else
  case when (balp.qtd_dif_bal > 0) then
    coalesce(balp.qtd_dif_bal, 0)
  else
    coalesce(balp.qtd_dif_bal, 0) * -1
  end
end "Quantidade",
0 "Valor Unit", 0 "Valor Total",
'N' "Altera Estoque",
'N' "Altera Custo", balp.prec_cusm_prod "Custo Med", 0 "Seq ID1",
balp.grupo_prod "Grupo", balp.cod_prod "Cod Prod", balp.cod_barra "Num Fab",
pr.descr_prod "Descricao",
coalesce(balpg.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao,'SEM GRADE') "Descricao Grade",
0 "Cod Cliente", '' "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
cast(cast(balp.data_hora_leitura as date) as timestamp) "Data Estoque", 0 "Seq Id"
from balanco_produtos balp
left join cod_grade_balanco balpg on balp.grupo_prod = balpg.grupo_prod and balp.cod_prod = balpg.cod_prod and balp.cod_empresa = balpg.cod_empresa
left join grade gra on gra.cod_grade = balpg.cod_grade and gra.cod_empresa = balpg.cod_empresa
inner join produtos pr on pr.grupo_prod = balp.grupo_prod and pr.cod_prod = balp.cod_prod and pr.cod_empresa = balp.cod_empresa
inner join empresa emp on emp.cod_empresa = balp.cod_empresa
union all  */
select 1 "Ordem", 'NF' "Tipo", ('NF'||nf4.natureza_nf) "Tipo2", nf4.natureza_nf "Natureza",
nf4.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nf4.num_nf "Numero",
/*case when (nf4.natureza_nf = 'E') then nf4.data_ent_saida
     else nf4.data_lanc end "Data",*/
nf4.data_lanc "Data",
nf4.data_lanc "Data Confirm",
upper(trim(NF4.status)),
case when grcomp.QTDE is null then it4.quantidade else grcomp.qtde end "Quantidade",
it4.valor_unitario "Valor Unit", it4.valor_total "Valor Total",
case when (nf4.natureza_nf = 'S') then 'N'
     when (nf4.status = 'Fechada') and (it4.altera_estoque_cfop is null) then 'S'
     when (nf4.status = 'Fechada') and (it4.altera_estoque_cfop <> 'N') then 'S'
     else 'N' end "Altera Estoque",
case when (nf4.natureza_nf = 'S') then 'N'
  when (coalesce(it4.altera_custo_cfop, 'S') = '') then 'S'
  else coalesce(it4.altera_custo_cfop, 'S') end "Altera Custo",
it4.prec_cusm_prod "Custo Med", it4.nitem "N Item/Id",
it4.grupo_prod "Grupo", it4.cod_prod "Cod Prod", pr.num_fab_prod "Num Fab",
case when (it4.cod_grade > 0) then
  case when (trim(nf4.natureza_nf) = 'S') then
    it4.descricao_item||' - '||coalesce(gras.descricao,'')
  else
    it4.descricao_item||' - '||coalesce(gra.descricao,'') end
else
  it4.descricao_item
end  "Descricao",
coalesce(gra.cod_grade,0) "Cod Grade",
case when (trim(nf4.natureza_nf) = 'S') then
     coalesce(gras.descricao, 'SEM GRADE')
     else coalesce(gra.descricao,'SEM GRADE') end "Grade",
nf4.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo Vnd/OS/DEV", '' "Tipo Venda", 0 "Num Venda",
nf4.cod_nf "Cod NF", it4.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
it4.aliq_icm "Aliq ICM", it4.base_icm "Base ICM", it4.valor_icm "Valor ICM",
it4.aliq_icmsub "Aliq ST", it4.base_icmsub "Base ST", it4.valor_icmsub "Valor ST",
it4.aliq_ipi "Aliq IPI", it4.base_ipi "Base IPI", it4.valor_ipi "Valor IPI",
case when (nf4.natureza_nf = 'S') then nf4.data_lanc
    else nf4.data_estoque end  "Data Estoque", nf4.cod_nf "Seq Id"
from notafiscal nf4
inner join notafiscal_item it4 on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa
inner join empresa emp on emp.cod_empresa = nf4.cod_empresa
left join nat_op nat on nat.codigo_nop = it4.codigo_nop
left join cod_grade_prod_compra grcomp on
it4.grupo_prod = grcomp.grupo_prod and it4.cod_prod = grcomp.cod_prod and it4.cod_empresa = grcomp.cod_empresa and
it4.cod_nf = grcomp.num_nota_nfe and it4.nitem = grcomp.cod_forn_nfe
left join grade gra on grcomp.cod_grade = gra.cod_grade and grcomp.cod_empresa = gra.cod_empresa
left join grade gras on it4.cod_grade = gras.cod_grade and it4.cod_empresa = gras.cod_empresa
inner join produtos pr on it4.grupo_prod = pr.grupo_prod and it4.cod_prod = pr.cod_prod
and it4.cod_empresa = pr.cod_empresa
inner join clientes cl on nf4.cod_cliente=cl.cod_cliente and nf4.cod_empresa=cl.cod_empresa
/*where nf4.natureza_nf = 'E' and (nf4.status = 'Fechada')*/
/*and (it4.altera_estoque_cfop <> 'N' or it4.altera_estoque_cfop is null)*/
/*and*/ where nf4.ativo=1 and upper(trim(nf4.status)) <> 'CANCELADA'
union all
select 1 "Ordem", 'NF' "Tipo", 'NFE' "Tipo2", 'E' "Natureza",
nfe.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nfe.num_nota_nfe "Numero",
nfe.data_lanc_nfe "Data", nfe.data_lanc_nfe "Data Confirm", 'FECHADA' "Status",
case when grcomp.QTDE is null then infe.quant_item_nfe else grcomp.qtde end "Quantidade",
infe.vlun_item_nfe "Valor Unit", infe.vltot_item_nfe "Valor Total",
'S' "Alterar Estoque", coalesce(nat.calc_custo, 'S') "Altera Custo",
coalesce(infe.prec_cusm_prod, 0) "Custo Med", coalesce(infe.n_item, 0) "N Item/Id",
infe.grupo_prod "Grupo", infe.cod_prod "Cod Prod", infe.num_fab_prod "Num Fab",
case when (grcomp.cod_grade > 0) then
  infe.descprod||' - '||coalesce(gra.descricao,'')
else
  infe.descprod
end  "Descricao",
coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'SEM GRADE') "Grade",
0 "Cod Cliente", fr.nome "Cliente/Fornecedor",
'' "Tipo Vnd/OS/DEV", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", infe.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
coalesce(infe.alicm_item_nfe, 0) "Aliq ICM", coalesce(infe.baseicms_it_nfe, 0) "Base ICM", coalesce(infe.icms_it_nfe, 0) "Valor ICM",
0 "Aliq ST", coalesce(infe.bicmsub_nfe, 0) "Base ST", coalesce(infe.icmsub_nfe, 0) "Valor ST",
0 "Aliq IPI", coalesce(infe.baseipi_it_nfe, 0) "Base IPI", coalesce(infe.ipi_item_nfe, 0) "Valor IPI",
nfe.data_lanc_nfe "Data Estoque", nfe.num_nota_nfe "Seq Id"
from nf_entrada nfe
inner join item_nf_entrada infe on infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe and infe.cod_empresa = nfe.cod_empresa
inner join empresa emp on emp.cod_empresa = nfe.cod_empresa
left join nat_op nat on nat.codigo_nop = infe.codigo_nop
left join cod_grade_prod_compra grcomp on
infe.grupo_prod = grcomp.grupo_prod and infe.cod_prod = grcomp.cod_prod and infe.cod_empresa = grcomp.cod_empresa and
infe.num_nota_nfe = grcomp.num_nota_nfe and infe.cod_forn_nfe = grcomp.cod_forn_nfe
left join grade gra on grcomp.cod_grade = gra.cod_grade and grcomp.cod_empresa = gra.cod_empresa
inner join produtos pr on infe.grupo_prod = pr.grupo_prod and infe.cod_prod = pr.cod_prod
and infe.cod_empresa = pr.cod_empresa
inner join fornecedor fr on fr.codigo_f = nfe.cod_forn_nfe and fr.cod_empresa = nfe.cod_empresa
where nfe.status_nfe = 'CONFIRMADA'
and nfe.ativo = 1
union all
select '1' "Ordem", 'NF' "Tipo", 'NFS' "Tipo2", 'S' "Natureza",
nfs.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nfs.num_nf_vnd "Numero",
nfs.data_ets_vnd "Data", nfs.data_ets_vnd "Data Confirm", 'FECHADA' "Status",
infs.quant_item_vnd "Quantidade",
infs.vlun_item_vnd "Valor Unit", infs.vltot_item_vnd "Valor Total",
'N' "Alterar Estoque", 'N' "Altera Custo",
0 "Custo Med", 0 "N Item/Id",
infs.grupo_prod "Grupo", infs.cod_prod "Cod Prod", infs.num_fab_prod "Num Fab",
infs.desc_prod_nf "Descricao",
0 "Cod Grade", 'SEM GRADE' "Grade",
null "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo Vnd/OS/DEV", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", infs.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
0 "Aliq ICM", coalesce(infs.baseicms_it, 0) "Base ICM", coalesce(infs.icms_it, 0) "Valor ICM",
0 "Aliq ST", coalesce(infs.bicmsub_vnd, 0) "Base ST", coalesce(infs.icmsub_vnd, 0) "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
nfs.data_ets_vnd "Data Estoque", nfs.num_nf_vnd "Seq ID"  from nf_venda nfs
inner join item_nfvenda infs on infs.num_nf_vnd = nfs.num_nf_vnd and infs.cod_empresa = nfs.cod_empresa
inner join empresa emp on emp.cod_empresa = nfs.cod_empresa
inner join clientes cl on cl.cod_cliente = nfs.cod_cliente and cl.cod_empresa = nfs.cod_empresa
left join nat_op nat on nat.codigo_nop = infs.codigo_nop
union all
select 2 "Ordem", 'PDC' "Tipo", 'PDC' "Tipo2", 'E' "Natureza", pi.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",
pd.cod_producao "Numero", pd.data "Data", pd.data_fechamento "Data Confirm",
pd.status,
pi.quantidade "Quantidade",
pi.prec_cus_prod "Custo Unit", (pi.quantidade * pi.prec_cus_prod) "Custo Total",
case when (trim(pd.status) = 'FECHADO') then 'S'
     else 'N' end "Altera Estoque",
'N' "Altera Custo", pi.prec_cusm_prod "Custo Med", pi.nitem "N Item",
pi.grupo_prod "Grupo", pi.cod_prod "Cod Prod", pi.num_fab_prod "Num Fab",
pi.descr_prod "Descricao",
gra.cod_grade "Cod Grade", gra.descricao "Descricao Grade",
0 "Cod Cliente", emp.nome_emp "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
case when (pd.data_fechamento is not null) then pd.data_estoque
     else pd.data end "Data Estoque", pd.cod_producao "Seq Id"
from producao pd
inner join producao_item pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa
inner join empresa emp on emp.cod_empresa = pd.cod_empresa
left join grade gra on gra.cod_grade = pi.cod_grade and gra.cod_empresa = pi.cod_empresa
/*where pd.status = 'FECHADO'*/
union all
select 3 "Ordem", 'DEV' "Tipo", 'DEV' "Tipo2", 'E' "Natureza", dev.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",
dev.sequencia "Numero", dev.data "Data", dev.data "Data Confirm",
'FECHADA', dev.quant "Quantidade",
dev.valor "Valor Unit", (dev.valor * dev.quant) "Valor Total",
case when (coalesce(dev.nf_gerou, '') <> 'S') then 'S' else 'N' end "Altera Estoque",
'N' "Altera Custo", dev.pcust_mc "Custo Med", dev.seqid "Seq ID",
dev.grupo_prod "Grupo", dev.cod_prod "Cod Prod", dev.num_fab_prod "Num Fab",
dev.descricao "Descricao",
coalesce(gra.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao,'SEM GRADE') "Descricao Grade",
cl.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
dev.tipo "Tipo", dev.tipo_venda "Tipo Venda", coalesce(dev.cod_venda, 0) "Num Venda",
coalesce(dev.cod_nf, 0) "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", dev.data_estoque "Data Estoque", dev.sequencia "Seq Id"
from devolucao dev
inner join empresa emp on emp.cod_empresa = dev.cod_empresa
left join grade gra on gra.cod_grade = dev.cod_grade and gra.cod_empresa = dev.cod_empresa
inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa
/*where coalesce(dev.nf_gerou, '') <> 'S'*/
union all
select 1 "Ordem", trim(pv.tipo) "Tipo", trim(pv.tipo) "Tipo2",
case when (trim(pv.tipo) = 'ORC') then '' else 'S' end "Natureza",
ipv.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",
pv.nped "Numero",
pv.data_ped "Data",
pv.data_fech "Data Confirm",
pv.status_ped, ipv.quant_ped_item "Quantidade",
ipv.vlun_ped_item "Valor Unit" , ipv.vltot_ped_item "Valor Total",
case when (trim(pv.tipo) = 'ORC') then 'N'
     when (pv.data_fech is not null) then 'S'
     else 'N' end "Altera Estoque",
'N' "Altera Custo", ipv.pcust_mc "Custo Med", ipv.nitem "N Item",
ipv.grupo_prod "Grupo", ipv.cod_prod "Cod Prod", ipv.num_fab_prod "Num Fab",
case when (ipv.cod_grade > 0) then
  ipv.descr_prod_ped ||' - '||coalesce(gra.descricao,'')
else
  ipv.descr_prod_ped
end "Descricao",
coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'SEM GRADE') "Grade",
cl.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
case when pv.tipo = 'REQ' then pv.tipv else pv.tipo_os end "Tipo Vnd/OS", '' "Tipo Venda",
0 "Num Venda",
coalesce(ipv.cod_nf, 0) "Cod NF", ipv.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
case when (pv.tipo = 'ORC') then pv.data_ped
     when (pv.data_fech is null) then pv.data_ped
     else pv.data_estoque end "Data Estoque",
pv.nped "Seq Id"
from pedvenda pv
inner join pedvenda_prod ipv on ipv.tipo = pv.tipo and ipv.nped = pv.nped and ipv.cod_empresa = pv.cod_empresa
inner join produtos pr on pr.cod_prod = ipv.cod_prod and pr.grupo_prod = ipv.grupo_prod and pr.cod_empresa = ipv.cod_empresa
inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa
inner join empresa emp on emp.cod_empresa = pv.cod_empresa
left join grade gra on gra.cod_grade = ipv.cod_grade and gra.cod_empresa = ipv.cod_empresa
left join nat_op nat on nat.codigo_nop = ipv.codigo_nop
left join tipo_vendas tp on tp.tipo = pv.tipo
and ((trim(tp.tipo) = 'OS' and tp.tipo_os = pv.tipo_os)
  or (trim(tp.tipo) = 'ORC' and tp.sigla = pv.tipo_orc)
  or (tp.sigla = pv.tipv))
where /* pv.status_ped = 'FECHADA' and pv.tipo <> 'ORC'
and */
coalesce(pv.status_ped, '') <> 'CANCELADO'
and ((ipv.status is null) or (ipv.status <> 'CANCELADO')) and pv.ativo = 1
union all
select 2 "Ordem", 'PDC' "Tipo", 'PDC' "Tipo2", 'S' "Natureza", pi.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",
pd.cod_producao "Num Producao", pd.data "Data", pd.data_fechamento "Data Confirm",
pd.status   ,
(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) "Quantidade",
pi.prec_cusm_prod "Custo Unit",
((coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) * pi.prec_cusm_prod) "Custo Total",
case when (trim(pd.status) = 'FECHADO') then 'S'
     else 'N' end "Altera Estoque",
'N' "Altera Custo", pi.prec_cusm_prod "Custo Med", pi.nitem "N Item",
pi.grupo_prod "Grupo", pi.cod_prod "Cod Prod", pi.num_fab_prod "Num Fab.",
pi.descr_prod "Descricao", gra.cod_grade "Cod. Grade", gra.descricao "Descricao Grade",
0 "Cod Cliente", emp.nome_emp "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
0 "Cod NF", 0 "Cod CFOP", '' "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
case when (pd.data_fechamento is not null) then pd.data_estoque
     else pd.data end "Data Estoque", pd.cod_producao "Seq Id"
from producao pd
inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa
inner join empresa emp on emp.cod_empresa = pd.cod_empresa
left join grade gra on gra.cod_grade = pi.cod_grade and gra.cod_empresa = pi.cod_empresa
/*where pd.status = 'FECHADO'*/
union all
select case when trim(h.tipor) = 'NF' then 1 when trim(h.tipor) = 'DEV' then 3 when trim(h.tipor) = 'COR' then 4 else 2 end "Ordem",
case when trim(h.tipor) = 'COR' then trim(h.tipor) else trim(h.tipor)||'X' end "Tipo",
case when ((trim(h.tipor) = 'NF') and (h.natureza = 'E')) then
       'NFEX'
     when (trim(h.tipor) = 'NF') then
       'NFSX'
     when trim(h.tipor) = 'COR' then trim(h.tipor) else trim(h.tipor)||'X' end "Tipo2",
h.natureza, h.cod_empresa, emp.nome_emp EMPRESA,
case when (h.numero > 0) then h.numero
     else 0 end "Num NF",
h.data "Data", h.data "Data Confirm", 'FECHADA',
coalesce(h.qtde, 0) "Quantidade", coalesce(h.valor_unit, 0) "Valor Unit", coalesce(h.valor_tot, 0) "Valor Total",
'S' "Altera Estoque",
case when trim(h.tipor) = 'NF' then coalesce(h.alterou_custo, 'S') else coalesce(h.alterou_custo, 'N') end "Altera Custo",
h.custo_med "Custo Med", h.nitem "N Item",
h.grupo_prod "Grupo", h.cod_prod "Cod Prod", pr.num_fab_prod "Num Fab.",
rtrim(pr.descr_prod) || case when coalesce(gra.cod_grade, 0) = 0 then '' else ' - ' || gra.descricao end "Descricao", coalesce(h.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao, 'SEM GRADE') "Descricao Grade",
h.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
coalesce(h.cod_nf , 0)"Cod NF", h.cod_cfop "Cod CFOP", nat.descricao_nop "CFOP",
coalesce(h.aliq_icm, 0) "Aliq ICM", coalesce(h.base_icm, 0) "Base ICM", coalesce(h.valor_icm, 0) "Valor ICM",
coalesce(h.aliq_st, 0) "Aliq ST", coalesce(h.base_st, 0) "Base ST", coalesce(h.valor_st, 0) "Valor ST",
coalesce(h.aliq_ipi, 0) "Aliq IPI", coalesce(h.base_ipi, 0) "Base IPI", coalesce(h.valor_ipi, 0) "Valor IPI", h.data "Data Estoque", h.seqid "Seq Id"
from hist_estoque_diario h
inner join produtos pr on pr.grupo_prod = h.grupo_prod and pr.cod_prod = h.cod_prod and pr.cod_empresa = h.cod_empresa
left join grupos gr on gr.codigo_grup = pr.grupo_prod
left join grade gra on gra.cod_grade = h.cod_grade and gra.cod_empresa = h.cod_empresa
left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and gp.cod_empresa = pr.cod_empresa
left join clientes cl on cl.cod_cliente = h.cod_cliente and cl.cod_empresa = h.cod_empresa
inner join empresa emp on emp.cod_empresa = pr.cod_empresa
left join nat_op nat on nat.codigo_nop = h.cod_cfop
union all
select case when trim(h.tipor) = 'NF' then 1 when trim(h.tipor) = 'DEV' then 3 when trim(h.tipor) = 'COR' then 4 else 2 end "Ordem",
case when trim(h.tipor) = 'COR' then trim(h.tipor) else trim(h.tipor)||'X' end "Tipo",
case when ((trim(h.tipor) = 'NF') and (h.natureza = 'E')) then
       'NFEX'
     when (trim(h.tipor) = 'NF') then
       'NFSX'
     when trim(h.tipor) = 'COR' then trim(h.tipor) else trim(h.tipor)||'X' end "Tipo2",
h.natureza, h.cod_empresa, emp.nome_emp EMPRESA,
case when (h.numero > 0) then h.numero
     else 0 end "Num NF",
h.data "Data", h.data "Data Confirm", 'FECHADA',
coalesce(h.qtde, 0) "Quantidade", coalesce(h.valor_unit, 0) "Valor Unit", coalesce(h.valor_tot, 0) "Valor Total",
'S' "Altera Estoque",
case when trim(h.tipor) = 'NF' then coalesce(h.alterou_custo, 'S') else coalesce(h.alterou_custo, 'N') end "Altera Custo",
h.custo_med "Custo Med", h.nitem "N Item",
h.grupo_prod "Grupo", h.cod_prod "Cod Prod", pr.num_fab_prod "Num Fab.",
rtrim(pr.descr_prod) || case when coalesce(gra.cod_grade, 0) = 0 then '' else ' - ' || gra.descricao end "Descricao", coalesce(h.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao, 'SEM GRADE') "Descricao Grade",
h.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo", '' "Tipo Venda", 0 "Num Venda",
coalesce(h.cod_nf , 0)"Cod NF", h.cod_cfop "Cod CFOP", nat.descricao_nop "CFOP",
coalesce(h.aliq_icm, 0) "Aliq ICM", coalesce(h.base_icm, 0) "Base ICM", coalesce(h.valor_icm, 0) "Valor ICM",
coalesce(h.aliq_st, 0) "Aliq ST", coalesce(h.base_st, 0) "Base ST", coalesce(h.valor_st, 0) "Valor ST",
coalesce(h.aliq_ipi, 0) "Aliq IPI", coalesce(h.base_ipi, 0) "Base IPI", coalesce(h.valor_ipi, 0) "Valor IPI", h.data "Data Estoque", h.seqid "Seq Id"
from hist_estoque_diario_prod h
inner join produtos pr on pr.grupo_prod = h.grupo_prod and pr.cod_prod = h.cod_prod and pr.cod_empresa = h.cod_empresa
left join grupos gr on gr.codigo_grup = pr.grupo_prod
left join grade gra on gra.cod_grade = h.cod_grade and gra.cod_empresa = h.cod_empresa
left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and gp.cod_empresa = pr.cod_empresa
left join clientes cl on cl.cod_cliente = h.cod_cliente and cl.cod_empresa = h.cod_empresa
inner join empresa emp on emp.cod_empresa = pr.cod_empresa
left join nat_op nat on nat.codigo_nop = h.cod_cfop
where coalesce(h.baixou_est, '') <> 'S'
union all
select 5 "Ordem", 'CP' "Tipo",  'CP' "Tipo2", 'S' "Natureza",
cp.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", cp.cupom "Numero",
cp.data "Data", cp.data "Data Confirm",
case when (trim(cp.status_cp) = '') then 'FECHADO' else upper(trim(cp.status_cp)) end,
cp2.quantidade "Quantidade",
cp2.preco "Valor Unit", cp2.total "Valor Total",
'N' "Altera Estoque", 'N' "Altera Custo", cp2.prec_cusm_prod "Custo Med",
cp2.nitem "N Item", cp2.grupo_prod "Grupo", cp2.cod_prod "Cod Prod", cp2.codbarra "Num Fab",
case when (cp2.cod_grade > 0) then
  cp2.descr_it || ' - '||coalesce(gra.descricao, '')
else
  cp2.descr_it
end "Descricao",
coalesce(gra.cod_grade, 0) "Cod Grade", coalesce(gra.descricao, 'SEM GRADE') "Grade",
cp.cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
coalesce(pd.tipv, '') "Tipo Vnd/OS", '' "Tipo Venda", coalesce(pd.nped, 0) "Num Venda",
0 "Cod NF", cp2.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
cp.data "Data Estoque", cp.registro "Seq Id"
from cupom cp
inner join cupom2 cp2 on cp2.cod_terminal = cp.cod_terminal and cp2.cod_empresa = cp.cod_empresa
  and cp2.nserieecf = cp.nserieecf and cp2.ordem = cp.registro
inner join empresa emp on emp.cod_empresa = cp.cod_empresa
left join grade gra on cp2.cod_grade = gra.cod_grade and cp2.cod_empresa = gra.cod_empresa
inner join produtos pr on cp2.grupo_prod = pr.grupo_prod and cp2.cod_prod = pr.cod_prod and cp2.cod_empresa = pr.cod_empresa
inner join clientes cl on cp.cliente = cl.cod_cliente and cp.cod_empresa = cl.cod_empresa
left join nat_op nat on nat.codigo_nop = cp2.codigo_nop
left join pedvenda pd on pd.nped = cp.ped and coalesce(pd.nprevenda, 0) = coalesce(cp.prevenda, 0)
  and  coalesce(pd.paf_num_prevenda, 0) = coalesce(cp.paf_num_prevenda, 0) and pd.cod_empresa = cp.cod_empresa
where ((cp2.status_it is null) or (cp2.status_it <> 'CANCELADO'))
union all
select 6 "Ordem", 'NFD' "Tipo", 'NFD' "Tipo2", 'S' "Natureza",
nd.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nd.numeronota "Numero",
nd.dataemissao "Data", nd.dataemissao "Data Confirm",
upper(trim(nd.status)), ndi.quantid_item "Quantidade",
ndi.vl_un_item "Valor Unit", ndi.vl_tot_item "Valor Total",
'N' "Altera Estoque", 'N' "Altera Custo", ndi.prec_cusm_prod "Custo Med",
ndi.nitem "N Item", ndi.grupo_prod "Grupo", ndi.cod_prod "Cod Prod", ndi.num_fab_prod "Num Fab",
ndi.desc_prod "Descricao", nd.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
0 "Cod Grade", 'SEM GRADE' "Grade",
'' "Tipo Vnd/OS", '' "Tipo Venda", nd.nped "Num Venda",
0 "Cod NF", 0 "Cod CFOP", '' CFOP, 0 "Aliq", ndi.base_icm "Base ICM", ndi.valor_icm "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
nd.dataemissao "Data Estoque", nd.numeronota "Seq Id"
from nf_serie_d_itens ndi
inner join nf_serie_d nd on nd.numeronota = ndi.numeronota and nd.cod_empresa = ndi.cod_empresa
inner join empresa emp on emp.cod_empresa = ndi.cod_empresa
left join clientes cl on cl.cod_cliente = nd.cod_cliente and cl.cod_empresa = nd.cod_empresa
left join estados est on est.codigo_uf = cl.codigo_uf
inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod = ndi.cod_prod and p.cod_empresa = ndi.cod_empresa
left join nat_op nt on nt.codigo_nop = p.codigo_nop
left join nbm on nbm.cod_ncm = p.nbm
where ((nd.status <> 'CANCELADA') or (nd.status is null))
union all
select 5 "Ordem", 'NFC' Tipo, 'NFC' "Tipo2", 'S' "Natureza",
nfc.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", coalesce(nfc.num_nf, 0) "Numero",
nfc.data_lanc "Data",
nfc.data_lanc "Data Confirm",
upper(trim(nfc.status)) status,
nfci.qcom "Quantidade", nfci.vuncom "Valor Unit", nfci.vprod "Valor Total",
'N' "Altera Estoque", 'N' "Altera Custo", nfci.prec_cusm_prod "Custo Med",
nfci.nitem "N Item", nfci.grupo_prod "Grupo", nfci.cod_prod "Cod Prod", nfci.num_fab_prod "Num Fab",
case when (nfci.cod_grade > 0) then
  nfci.xprod ||' - '|| coalesce(gra.descricao, '')
else
  nfci.xprod
end "Descricao",
coalesce(gra.cod_grade, 0) "Cod Grade", coalesce(gra.descricao, 'SEM GRADE') "Grade",
nfc.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",
'' "Tipo Vnd/OS", '' "Tipo Venda",
case when (coalesce(nfc.ped_origem_num,0) > 0) then
      coalesce(nfc.ped_origem_num, 0)
     else
       coalesce(nfc.ped_destino_num, 0)
end "Num Venda",
coalesce(nfc.cod_nfce, 0) "Cod NF", nfci.cfop "Cod CFOP", nat.descricao_nop "CFOP",
0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",
0 "Aliq ST", 0 "Base ST", 0 "Valor ST",
0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",
nfc.data_lanc "Data Estoque", nfc.cod_nfce "Seq Id"
from nfce nfc
inner join nfce_item nfci on nfci.cod_nfce = nfc.cod_nfce and nfci.cod_empresa = nfc.cod_empresa
inner join empresa emp on emp.cod_empresa = nfc.cod_empresa
left join nat_op nat on nat.codigo_nop = nfci.cfop
left join grade gra on nfci.cod_grade = gra.cod_grade and nfci.cod_empresa = gra.cod_empresa
inner join produtos pr on nfci.grupo_prod = pr.grupo_prod and nfci.cod_prod = pr.cod_prod and nfci.cod_empresa = pr.cod_empresa
left join clientes cl on nfc.cod_cliente = cl.cod_cliente and nfci.cod_empresa = cl.cod_empresa
where ((upper(trim(nfc.status)) <> 'CANCELADA') or (nfc.status is null));
|/BLOCO|

ALTER TABLE GERADOR_OSBOL ADD DIA_FATURAMENTO_INI INTEGER;
ALTER TABLE GERADOR_OSBOL ADD DIA_FATURAMENTO_FIM INTEGER;

UPDATE GERADOR_OSBOL SET DIA_FATURAMENTO_INI = 0 WHERE DIA_FATURAMENTO_INI IS NULL;
UPDATE GERADOR_OSBOL SET DIA_FATURAMENTO_FIM = 0 WHERE DIA_FATURAMENTO_FIM IS NULL;

delete from config_colunas where componente = 'cdsGeradorOS';

UPDATE CLIENTES_COM_CONTRATO SET DIA_VENCIMENTO = 0  WHERE DIA_VENCIMENTO IS NULL;
UPDATE CLIENTES_COM_CONTRATO SET DIAS_APOS_VENC = 0  WHERE DIAS_APOS_VENC IS NULL;
UPDATE CLIENTES_COM_CONTRATO SET DIA_FATURAMENTO = 0 WHERE DIA_FATURAMENTO IS NULL;

delete from config_colunas where componente = 'cdsContratoCl';

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG063', :COD_EMPRESA, 'SETAR VERSAO MINIMA CRC', 10, '.', 1, 'N', 'S', CURRENT_DATE);

|BLOCO|
create or alter procedure REMOVER_GRADE_PRODUTO (
    PGRUPO_PROD integer,
    PCOD_PROD char(6),
    PCOD_EMPRESA integer)
returns (
    RESULT varchar(10))
as
declare variable VGRUPO_PROD integer;
declare variable VCOD_PROD char(6);
declare variable VCOD_EMPRESA integer;
declare variable VCOD_GRADE integer;
declare variable VPREC_CUSM_PROD double precision;
declare variable VESTOQUE_GRADE double precision;
declare variable VESTOQUE_PROD double precision;
declare variable VSEQID integer;
declare variable VTEMP_SQL varchar(1000);
begin
  /* Procedure Text */
  result = 'ERRO';
  if ((pgrupo_prod > 0) or (trim(pcod_prod) <> '')) then
  begin
    vtemp_sql =
      ' where produtos.grupo_prod = ' || :pgrupo_prod || '
        and produtos.cod_prod = ''' || :pcod_prod || '''
        and produtos.cod_empresa = ' || :pcod_empresa;
  end
  else
  begin
    vtemp_sql =
      ' where produtos.cod_empresa = ' || :pcod_empresa;
  end

  for execute statement
    ' select produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, produtos.prec_cusm_prod from produtos ' ||
      vtemp_sql || '
      and (select count(*) from cod_grade_prod
           where cod_grade_prod.grupo_prod = produtos.grupo_prod
           and cod_grade_prod.cod_prod = produtos.cod_prod
           and cod_grade_prod.cod_empresa = produtos.cod_empresa) > 0 '
        into :vgrupo_prod, :vcod_prod, :vcod_empresa, :vprec_cusm_prod do
  begin
    vestoque_prod = 0;
    for select cod_grade_prod.cod_grade, cod_grade_prod.qtde from cod_grade_prod
        where cod_grade_prod.grupo_prod = :vgrupo_prod
        and cod_grade_prod.cod_prod = :vcod_prod
        and cod_grade_prod.cod_empresa = :vcod_empresa
          into :vcod_grade, :vestoque_grade do
    begin
      vestoque_grade = coalesce(vestoque_grade, 0);
      vestoque_prod  = coalesce(vestoque_prod, 0) + coalesce(vestoque_grade, 0);

      select first 1 estoque_diario.seqid from estoque_diario
      where estoque_diario.grupo_prod = :vgrupo_prod
      and estoque_diario.cod_prod = :vcod_prod
      and estoque_diario.cod_grade = :vcod_grade
      and estoque_diario.dia = current_date
      and estoque_diario.cod_empresa = :pcod_empresa
        into :vseqid;

      if (coalesce(vseqid, 0) > 0) then
      begin
        update estoque_diario set estoque_diario.estoque = 0
        where estoque_diario.tipo = 'P'
        and estoque_diario.seqid = :vseqid
        and estoque_diario.cod_empresa = :vcod_empresa;
      end
      else
      begin
        insert into estoque_diario
        (tipo, seqid, cod_empresa, dia, grupo_prod, cod_prod, cod_grade, estoque, custo_medio)
        values ('P', (select cod from incrementa_codigo (:pcod_empresa, 'ESTOQUE_DIARIO')), :pcod_empresa,
        current_date, :vgrupo_prod, :vcod_prod, :vcod_grade, 0, coalesce(:vprec_cusm_prod, 0));
      end
    end

    select first 1 estoque_diario.seqid from estoque_diario
    where estoque_diario.grupo_prod = :vgrupo_prod
    and estoque_diario.cod_prod = :vcod_prod
    and estoque_diario.cod_grade = 0
    and estoque_diario.dia = current_date
    and estoque_diario.cod_empresa = :pcod_empresa
      into :vseqid;

    if (coalesce(vseqid, 0) > 0) then
    begin
      update estoque_diario set estoque_diario.estoque = coalesce(:vestoque_prod, 0)
      where estoque_diario.tipo = 'P'
      and estoque_diario.seqid = :vseqid
      and estoque_diario.cod_empresa = :vcod_empresa;
    end
    else
    begin
      insert into estoque_diario
      (tipo, seqid, cod_empresa, dia, grupo_prod, cod_prod, cod_grade, estoque, custo_medio)
      values ('P', (select cod from incrementa_codigo (:pcod_empresa, 'ESTOQUE_DIARIO')), :pcod_empresa,
      current_date, :vgrupo_prod, :vcod_prod, 0, coalesce(:vestoque_prod, 0), coalesce(:vprec_cusm_prod, 0));
    end

    update produtos set produtos.est_f = coalesce(:vestoque_prod, 0)
    where produtos.grupo_prod = :vgrupo_prod
    and produtos.cod_prod = :vcod_prod
    and produtos.cod_empresa = :pcod_empresa;

    delete from cod_grade_prod
    where cod_grade_prod.grupo_prod = :vgrupo_prod
    and cod_grade_prod.cod_prod = :vcod_prod
    and cod_grade_prod.cod_empresa = :pcod_empresa;

    delete from cod_grade_prod_compra
    where cod_grade_prod_compra.grupo_prod = :vgrupo_prod
    and cod_grade_prod_compra.cod_prod = :vcod_prod
    and cod_grade_prod_compra.cod_empresa = :vcod_empresa;

    update pedvenda_prod set pedvenda_prod.cod_grade = 0
    where pedvenda_prod.grupo_prod = :vgrupo_prod
    and pedvenda_prod.cod_prod = :vcod_prod
    and pedvenda_prod.cod_empresa = :pcod_empresa
    and pedvenda_prod.cod_grade > 0;
  end

  result = 'OK';
  suspend;
end;
|/BLOCO|

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS552', :COD_EMPRESA, 'BT PROCURAR MENS TIPO DOC', 5, 'FRMCADMODELOCARTAS', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS553', :COD_EMPRESA, 'BT NOVO MENS TIPO DOC', 5, 'FRMCADMODELOCARTAS', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS554', :COD_EMPRESA, 'BT EDITAR MENS TIPO DOC', 5, 'FRMCADMODELOCARTAS', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS555', :COD_EMPRESA, 'BT DELETAR MENS TIPO DOC - EXCLUIR PERMANENTEMENTE', 10, 'FRMCADMODELOCARTAS', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS556', :COD_EMPRESA, 'BT DELETAR MENS TIPO DOC - ENVIAR PARA A LIXEIRA', 5, 'FRMCADMODELOCARTAS', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS557', :COD_EMPRESA, 'BT RESTAURAR MENS TIPO DOC', 5, 'FRMCADMODELOCARTAS', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS558', :COD_EMPRESA, 'BT ABRIR LIXEIRA MENS TIPO DOC', 5, 'FRMCADMODELOCARTAS', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS559', :COD_EMPRESA, 'BT SALVAR MENS TIPO DOC', 5, 'FRMCADMODELOCARTAS', 1, 'N', 'S', CURRENT_DATE);

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL045', :COD_EMPRESA, 'ABRIR TELA DE CADASTRO EXCECOES CALENDARIO', 5, 'FRMCADCALENDCOLABORADOEXC', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL046', :COD_EMPRESA, 'BT PROCURAR EXCECOES CALENDARIO', 5, 'FRMCADCALENDCOLABORADOEXC', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL047', :COD_EMPRESA, 'BT NOVO EXCECOES CALENDARIO', 5, 'FRMCADCALENDCOLABORADOEXC', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL048', :COD_EMPRESA, 'BT EDITAR EXCECOES CALENDARIO', 5, 'FRMCADCALENDCOLABORADOEXC', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL049', :COD_EMPRESA, 'BT DELETAR EXCECOES CALENDARIO', 10, 'FRMCADCALENDCOLABORADOEXC', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL050', :COD_EMPRESA, 'BT SALVAR EXCECOES CALENDARIO', 5, 'FRMCADCALENDCOLABORADOEXC', 1, 'N', 'S', CURRENT_DATE);

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL051', :COD_EMPRESA, 'ABRIR TELA DE CADASTRO ESCALA SEMANAL CALENDARIO', 5, 'FRMCADCALENDESCALASEMANAL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL052', :COD_EMPRESA, 'BT PROCURAR ESCALA SEMANAL CALENDARIO', 5, 'FRMCADCALENDESCALASEMANAL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL053', :COD_EMPRESA, 'BT NOVO ESCALA SEMANAL CALENDARIO', 5, 'FRMCADCALENDESCALASEMANAL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL054', :COD_EMPRESA, 'BT EDITAR ESCALA SEMANAL CALENDARIO', 5, 'FRMCADCALENDESCALASEMANAL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL055', :COD_EMPRESA, 'BT DELETAR ESCALA SEMANAL CALENDARIO', 10, 'FRMCADCALENDESCALASEMANAL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL056', :COD_EMPRESA, 'BT SALVAR ESCALA SEMANAL CALENDARIO', 5, 'FRMCADCALENDESCALASEMANAL', 1, 'N', 'S', CURRENT_DATE);

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL057', :COD_EMPRESA, 'ABRIR TELA DE CADASTRO JORNADA DE TRABALHO', 5, 'FRMCADJORNADATRABALHO', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL058', :COD_EMPRESA, 'BT PROCURAR JORNADA DE TRABALHO', 5, 'FRMCADJORNADATRABALHO', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL059', :COD_EMPRESA, 'BT NOVO JORNADA DE TRABALHO', 5, 'FRMCADJORNADATRABALHO', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL060', :COD_EMPRESA, 'BT EDITAR JORNADA DE TRABALHO', 5, 'FRMCADJORNADATRABALHO', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL061', :COD_EMPRESA, 'BT DELETAR JORNADA DE TRABALHO', 10, 'FRMCADJORNADATRABALHO', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL062', :COD_EMPRESA, 'BT SALVAR JORNADA DE TRABALHO', 5, 'FRMCADJORNADATRABALHO', 1, 'N', 'S', CURRENT_DATE);

|BLOCO|
create or alter procedure GETLIMITECREDITOS (
    PCPFCGC varchar(18),
    PCOD_CLIENTE integer,
    PCOD_EMPRESA integer,
    PTIPO char(3))
returns (
    VALOR double precision,
    QTDE integer)
as
declare variable VSQL varchar(1000);
declare variable VFINANCEIRO_UNIFICADO char(1);
declare variable VVALOR double precision;
declare variable VQTDE integer;
begin
  /* Procedure Text */
  valor = 0;
  qtde  = 0;

  select empresa.financeiro_unificado from empresa where empresa.cod_empresa = :pcod_empresa into :vfinanceiro_unificado;

  if ((coalesce(ptipo, '') = 'CH') or (coalesce(ptipo, '') = 'A')) then
  begin
    vsql =
      ' select sum(coalesce(formpagamento.valordoc, 0)) soma, count(*) qtde from formpagamento
        left join empresa on empresa.cod_empresa = formpagamento.cod_empresa
        left join clientes on
          clientes.cod_cliente = formpagamento.cod_cliente
          and clientes.cod_empresa = formpagamento.cod_empresa
        inner join controles on
          controles.codigo_ctrl = formpagamento.cod_controle
          and controles.codigo_emp = formpagamento.cod_empresa
          and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

    if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpfcgc, '') <> '')) then
      vsql = vsql ||
        ' where clientes.cpfcgc = ''' || :pcpfcgc || ''' ';
    else
      vsql = vsql ||
        ' where formpagamento.cod_cliente = ' || :pcod_cliente;

    vsql = vsql ||
      ' and formpagamento.tipdoc = ''S1'' and formpagamento.tpdocs <> ''PRE'' and formpagamento.prcss is null ';

    if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpfcgc, '') <> '')) then
      vsql = vsql ||
        ' and empresa.codigo_unificadora = ' || :pcod_empresa;
    else
      vsql = vsql ||
        ' and formpagamento.cod_empresa = ' || :pcod_empresa;

    vsql = vsql ||
      ' and formpagamento.data_mov >= (current_date - 365) ';

    execute statement
      vsql into :vvalor, :vqtde;

    valor = coalesce(valor, 0) + coalesce(vvalor, 0);
    qtde  = coalesce(qtde, 0)  + coalesce(vqtde, 0);

    vsql =
      ' select sum(coalesce(controle_cheque.valor_ch, 0)) soma, count(*) qtde from controle_cheque
        left join empresa on empresa.cod_empresa = controle_cheque.cod_emp_mult
        left join clientes on
          clientes.cod_cliente = controle_cheque.cod_cliente
          and clientes.cod_empresa = controle_cheque.cod_emp_mult
        inner join controles on
          controles.codigo_ctrl = controle_cheque.codigo_ctrl
          and controles.codigo_emp = controle_cheque.codigo_emp
          and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

    if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpfcgc, '') <> '')) then
      vsql = vsql ||
        ' where clientes.cpfcgc = ''' || :pcpfcgc || ''' ';
    else
      vsql = vsql ||
        ' where controle_cheque.cod_cliente = ' || :pcod_cliente;

    vsql = vsql ||
      ' and (controle_cheque.status_ch is null or controle_cheque.status_ch = '''') ';

    if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpfcgc, '') <> '')) then
      vsql = vsql ||
        ' and empresa.codigo_unificadora = ' || :pcod_empresa;
    else
      vsql = vsql ||
        ' and controle_cheque.codigo_emp = ' || :pcod_empresa;

    execute statement
      vsql into :vvalor, :vqtde;

    valor = coalesce(valor, 0) + coalesce(vvalor, 0);
    qtde  = coalesce(qtde, 0)  + coalesce(vqtde, 0);
  end

  if ((coalesce(ptipo, '') = 'CC') or (coalesce(ptipo, '') = 'A')) then
  begin
    vsql =
      ' select sum(coalesce(formpagamento.valordoc, 0)) soma, count(*) qtde from formpagamento
        left join empresa on empresa.cod_empresa = formpagamento.cod_empresa
        left join clientes on
          clientes.cod_cliente = formpagamento.cod_cliente
          and clientes.cod_empresa = formpagamento.cod_empresa
        inner join controles on
          controles.codigo_ctrl = formpagamento.cod_controle
          and controles.codigo_emp = formpagamento.cod_empresa
          and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

    if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpfcgc, '') <> '')) then
      vsql = vsql ||
        ' where clientes.cpfcgc = ''' || :pcpfcgc || ''' ';
    else
      vsql = vsql ||
        ' where formpagamento.cod_cliente = ' || :pcod_cliente;

    vsql = vsql ||
      ' and formpagamento.tipdoc = ''S2'' and formpagamento.tpdocs <> ''PRE'' and formpagamento.prcss is null ';

    if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpfcgc, '') <> '')) then
      vsql = vsql ||
        ' and empresa.codigo_unificadora = ' || :pcod_empresa;
    else
      vsql = vsql ||
        ' and formpagamento.cod_empresa = ' || :pcod_empresa;

    execute statement
      vsql into :vvalor, :vqtde;

    valor = coalesce(valor, 0) + coalesce(vvalor, 0);
    qtde  = coalesce(qtde, 0)  + coalesce(vqtde, 0);

    vsql =
      ' select sum(coalesce(controle_creditos.valor_c, 0)) valor, count(*) qtde from controle_creditos
        left join empresa on empresa.cod_empresa = controle_creditos.cod_emp_mult
        left join clientes on
          clientes.cod_cliente = controle_creditos.cod_cliente
          and clientes.cod_empresa = controle_creditos.cod_emp_mult
        inner join controles on
          controles.codigo_ctrl = controle_creditos.codigo_ctrl
          and controles.codigo_emp = controle_creditos.codigo_emp
          and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

    if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpfcgc, '') <> '')) then
      vsql = vsql ||
        ' where clientes.cpfcgc = ''' || :pcpfcgc || ''' ';
    else
      vsql = vsql ||
        ' where controle_creditos.cod_cliente = ' || :pcod_cliente;

    vsql = vsql ||
      ' and (controle_creditos.status_c is null or controle_creditos.status_c = '''') ';

    if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpfcgc, '') <> '')) then
      vsql = vsql || ' and empresa.codigo_unificadora = ' || :pcod_empresa;
    else
      vsql = vsql || ' and controle_creditos.codigo_emp = ' || :pcod_empresa;

    execute statement
      vsql into :vvalor, :vqtde;

    valor = coalesce(valor, 0) + coalesce(vvalor, 0);
    qtde  = coalesce(qtde, 0)  + coalesce(vqtde, 0);
  end

  suspend;
end;
|/BLOCO|

|BLOCO|
create or alter procedure RETORNA_VL_CHQ_ABERTO (
    PCOD_CLIENTE integer,
    PCOD_EMPRESA integer,
    PCPF_CNPJ varchar(18))
returns (
    VALOR_CHQ double precision)
as
declare variable VSQL varchar(1000);
declare variable VFINANCEIRO_UNIFICADO char(1);
declare variable VVALOR_CHQ double precision;
begin
  /* Procedure Text */

  valor_chq = 0;

  select empresa.financeiro_unificado from empresa where empresa.cod_empresa = :pcod_empresa into :vfinanceiro_unificado;

  vsql =
    ' select sum(coalesce(formpagamento.valordoc, 0)) soma from formpagamento
      inner join empresa on empresa.cod_empresa = formpagamento.cod_empresa
      inner join clientes on
        clientes.cod_cliente = formpagamento.cod_cliente
        and clientes.cod_empresa = formpagamento.cod_empresa
      inner join controles on
        controles.codigo_ctrl = formpagamento.cod_controle
        and controles.codigo_emp = formpagamento.cod_empresa
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' where clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' where formpagamento.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    ' and formpagamento.tipdoc = ''S1'' and formpagamento.tpdocs <> ''PRE'' and formpagamento.prcss is null ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and formpagamento.cod_empresa = ' || :pcod_empresa;

  vsql = vsql ||
    ' and formpagamento.data_mov >= (current_date - 365) ';

  execute statement
    vsql into :vvalor_chq;

  valor_chq = coalesce(valor_chq, 0) + coalesce(vvalor_chq, 0);
    
  vsql =
    ' select sum(coalesce(controle_cheque.valor_ch, 0)) soma from controle_cheque
      inner join clientes on clientes.cod_cliente = controle_cheque.cod_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult
      inner join empresa on empresa.cod_empresa = controle_cheque.codigo_emp
      inner join controles on
        controles.codigo_ctrl = controle_cheque.codigo_ctrl
        and controles.codigo_emp = controle_cheque.codigo_emp
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' where clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' where controle_cheque.codigo_emp = ' || :pcod_empresa;

  vsql = vsql ||
    '  and (controle_cheque.status_ch is null or controle_cheque.status_ch = '''') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and controle_cheque.codigo_emp = ' || :pcod_empresa;

  execute statement
    vsql into :vvalor_chq;

  valor_chq = coalesce(valor_chq, 0) + coalesce(vvalor_chq, 0);

  suspend;
end;
|/BLOCO|

|BLOCO|
create or alter procedure RETORNA_VL_CRED_ABERTO (
    PCOD_CLIENTE integer,
    PCOD_EMPRESA integer,
    PCPF_CNPJ varchar(18))
returns (
    VALOR_CRED double precision)
as
declare variable VSQL varchar(1000);
declare variable VFINANCEIRO_UNIFICADO char(1);
declare variable VVALOR_CRED double precision;
begin
  /* Procedure Text */

  valor_cred = 0;

  select empresa.financeiro_unificado from empresa where empresa.cod_empresa = :pcod_empresa into :vfinanceiro_unificado;

  vsql =
    ' select sum(coalesce(formpagamento.valordoc, 0)) soma from formpagamento
      inner join empresa on empresa.cod_empresa = formpagamento.cod_empresa
      inner join clientes on
        clientes.cod_cliente = formpagamento.cod_cliente
        and clientes.cod_empresa = formpagamento.cod_empresa
      inner join controles on
        controles.codigo_ctrl = formpagamento.cod_controle
        and controles.codigo_emp = formpagamento.cod_empresa
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' where clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' where formpagamento.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    ' and formpagamento.tipdoc = ''S2'' and formpagamento.tpdocs <> ''PRE'' and formpagamento.prcss is null ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and formpagamento.cod_empresa = ' || :pcod_empresa;

  vsql = vsql ||
    ' and formpagamento.data_mov >= (current_date - 365) ';

  execute statement
    vsql into :vvalor_cred;

  valor_cred = coalesce(valor_cred, 0) + coalesce(vvalor_cred, 0);

  vsql =
    ' select sum(coalesce(controle_creditos.valor_c, 0)) soma from controle_creditos
      inner join clientes on clientes.cod_cliente = controle_creditos.cod_cliente and clientes.cod_empresa = controle_creditos.cod_emp_mult
      inner join empresa on empresa.cod_empresa = controle_creditos.codigo_emp
      inner join controles on
        controles.codigo_ctrl = controle_creditos.codigo_ctrl
        and controles.codigo_emp = controle_creditos.codigo_emp
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' where clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' where controle_creditos.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    '  and (controle_creditos.status_c is null or controle_creditos.status_c = '''') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and controle_creditos.codigo_emp = ' || :pcod_empresa;

  execute statement
    vsql into :vvalor_cred;

  valor_cred = coalesce(valor_cred, 0) + coalesce(vvalor_cred, 0);

  suspend;
end;
|/BLOCO|

|BLOCO|
create or alter procedure RETORNA_VL_CHQ_VENC (
    PCOD_CLIENTE integer,
    PCOD_EMPRESA integer,
    PCPF_CNPJ varchar(18))
returns (
    VALOR_CHQ double precision)
as
declare variable VSQL varchar(1000);
declare variable VFINANCEIRO_UNIFICADO char(1);
declare variable VVALOR_CHQ double precision;
begin
  /* Procedure Text */

  valor_chq = 0;

  select empresa.financeiro_unificado from empresa where empresa.cod_empresa = :pcod_empresa into :vfinanceiro_unificado;

  vsql =
    ' select sum(coalesce(formpagamento.valordoc, 0)) soma from formpagamento
      inner join empresa on empresa.cod_empresa = formpagamento.cod_empresa
      inner join clientes on
        clientes.cod_cliente = formpagamento.cod_cliente
        and clientes.cod_empresa = formpagamento.cod_empresa
      inner join controles on
        controles.codigo_ctrl = formpagamento.cod_controle
        and controles.codigo_emp = formpagamento.cod_empresa
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' where clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' where formpagamento.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    ' and formpagamento.data_venc + empresa.dias_car_juros < current_date ';

  vsql = vsql ||
    ' and formpagamento.tipdoc = ''S1'' and formpagamento.tpdocs <> ''PRE'' and formpagamento.prcss is null ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and formpagamento.cod_empresa = ' || :pcod_empresa;

  vsql = vsql ||
    ' and formpagamento.data_mov >= (current_date - 365) ';

  execute statement
    vsql into :vvalor_chq;

  valor_chq = coalesce(valor_chq, 0) + coalesce(vvalor_chq, 0);

  vsql =
    ' select sum(coalesce(controle_cheque.valor_ch, 0)) soma from controle_cheque
      inner join empresa on empresa.cod_empresa = controle_cheque .codigo_emp
      inner join controles on
        controles.codigo_ctrl = controle_cheque.codigo_ctrl
        and controles.codigo_emp = controle_cheque.codigo_emp
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'')
      inner join clientes on
        clientes.cod_cliente = controle_cheque.cod_cliente
        and clientes.cod_empresa = controle_cheque.cod_emp_mult ';

  vsql = vsql ||
    ' where (controle_cheque.status_ch is null or controle_cheque.status_ch = '''') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' and controle_cheque.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    ' and controle_cheque.data_venc + empresa.dias_car_juros < current_date ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and controle_cheque.codigo_emp = ' || :pcod_empresa;

  execute statement
    vsql into :vvalor_chq;

  valor_chq = coalesce(valor_chq, 0) + coalesce(vvalor_chq, 0);

  suspend;
end;
|/BLOCO|

|BLOCO|
create or alter procedure RETORNA_VL_CRED_VENC (
    PCOD_CLIENTE integer,
    PCOD_EMPRESA integer,
    PCPF_CNPJ varchar(18))
returns (
    VALOR_CRED double precision)
as
declare variable VSQL varchar(1000);
declare variable VFINANCEIRO_UNIFICADO char(1);
declare variable VVALOR_CRED double precision;
begin
  /* Procedure Text */

  valor_cred = 0;

  select empresa.financeiro_unificado from empresa where empresa.cod_empresa = :pcod_empresa into :vfinanceiro_unificado;

  vsql =
    ' select sum(coalesce(formpagamento.valordoc, 0)) soma from formpagamento
      inner join empresa on empresa.cod_empresa = formpagamento.cod_empresa
      inner join clientes on
        clientes.cod_cliente = formpagamento.cod_cliente
        and clientes.cod_empresa = formpagamento.cod_empresa
      inner join controles on
        controles.codigo_ctrl = formpagamento.cod_controle
        and controles.codigo_emp = formpagamento.cod_empresa
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' where clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' where formpagamento.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    ' and formpagamento.data_venc + empresa.dias_car_juros < current_date ';

  vsql = vsql ||
    ' and formpagamento.tipdoc = ''S2'' and formpagamento.tpdocs <> ''PRE'' and formpagamento.prcss is null ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and formpagamento.cod_empresa = ' || :pcod_empresa;

  vsql = vsql ||
    ' and formpagamento.data_mov >= (current_date - 365) ';

  execute statement
    vsql into :vvalor_cred;

  valor_cred = coalesce(valor_cred, 0) + coalesce(vvalor_cred, 0);

  vsql =
    ' select sum(coalesce(controle_creditos.valor_c, 0)) soma from controle_creditos
      inner join empresa on empresa.cod_empresa = controle_creditos.codigo_emp
      inner join controles on
        controles.codigo_ctrl = controle_creditos.codigo_ctrl
        and controles.codigo_emp = controle_creditos.codigo_emp
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''S'')
      inner join clientes on
        clientes.cod_cliente = controle_creditos.cod_cliente
        and clientes.cod_empresa = controle_creditos.cod_emp_mult ';

  vsql = vsql ||
    ' where (controle_creditos.status_c is null or controle_creditos.status_c = '''') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' and controle_creditos.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    ' and controle_creditos.data_venc_c + empresa.dias_car_juros < current_date ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and controle_creditos.codigo_emp = ' || :pcod_empresa;

  execute statement
    vsql into :vvalor_cred;

  valor_cred = coalesce(valor_cred, 0) + coalesce(vvalor_cred, 0);

  suspend;
end;
|/BLOCO|

|BLOCO|
create or alter procedure SPRI_TABLES_NOTREP
returns (
    TABELA varchar(31),
    ORIGEM smallint)
as
begin
  for select TABELA, 1
      from RI_TAB_NOTREP
    union distinct
    select T.TABELA, 0
      from SPDB_TABLES T
        inner join SPDB_EMP_KEY(T.TABELA) EK on 1 = 1
      where EK.CAMPO_EMP <> '' and
            T.TABELA in ( 'AGENDA',
                          'AGENDAMENTO',
                          'AGENDA_ITENS',
                          'ANOTACOES',
                          'APURACAO_BALANCO',
                          'APURACAO_DEPTO',
                          'ARQ_FABRICA',
                          'ATESTADO_ECF',
                          'AT_TERMINAIS',
                          'BAIXA_CREDITOS',
                          'BALANCO_PRODUTOS',
                          'BOLETAS',
                          'BOX',
                          'CADASTROS_EMP',
                          'CARGA',
                          'CARGA_ITEM',
                          'CARGA_ITEM_HISTORICO',
                          'CHASSI_A_PAGAR',
                          'CLIENTES_CONTATO',
                          'CLIENTES_END_DOC_ADD',
                          'CLIENTES_TRIB_AD',
                          'COBREBEM',
                          'CODIGO',
                          'COD_ETIQ',
                          'CODIGO_FORNECEDOR',
                          'COD_GRADE_BALANCO',
                          'COD_GRADE_PROD_COMPRA',
                          'COD_GRADE_PROD_VENDA',
                          'COMISSAO_CONSORCIO',
                          'COM_FAT',
                          'CONFERENCIA_CEGA',
                          'CONFERENCIA_CEGA_ITENS',
                          'CONFIG_API',
                          'CONFIG_EMAILMARK',
                          'CONSULTA_CREDCL',
                          'CONTAS_A_PAGAR',
                          'CONTA_CORRENTE_PROG_FIDELIDADE',
                          'CONTROLE_ALMOXARIFADO',
                          'CONTROLE_CHEQUE',
                          'CONTROLE_CREDITOS',
                          'COTACAO',
                          'COTACAO_ITENS',
                          'COTACAO_P',
                          'CREDITOS_LANC',
                          'CUPOM',
                          'CUPOM2',
                          'CUPOM_EMIT',
                          'CUSTOS',
                          'DADOS_JSON',
                          'DEL_CA',
                          'DEL_EC',
                          'DEL_MOBILE',  
                          'DEL_TABELA',
                          'DEPRECIACAO',
                          'DESPESAS',
                          'DESPESAS_LANC',
                          'DESPESAS_LANC_ITENS',
                          'DESPESAS_US',
                          'DESPESAS_VEIC',
                          'DEVOLUCAO',
                          'DOC_ELETRONICO',
                          'DOC_NAOFISCAL_TERMINAL',
                          'ECF',
                          'EFD_ICMSST_CR_APURACAO',
                          'EMAIL_MARKETING',
                          'EMPDESVOLV',
                          'EMPRESA',
                          'EMPRESA_FISICA',
                          'EMPRESA_PROG_FID',
                          'EMPRESA_SUBSTITUTO',
                          'ENT_MOTO',
                          'ENT_MOTO_ITENS',
                          'EQUIPAMENTO',
                          'ESTOQUES_SIS',
                          'ESTOQUE_AJUSTE',
                          'ESTOQUE_AJUSTE_ITENS',
                          'ESTOQUE_DIARIO',
                          'ESTOQUE_INI',
                          'ESTOQUE_INI_GRADE',
                          'EST_MOTO',
                          'EVIDENCIAS_PAF',
                          'FECD_CXL',
                          'FECHM',
                          'FECH_DIA',
                          'FILA_RESERVA_VEIC',
                          'FINALIZADORES',
                          'FINCUPOM',
                          'FISCAL_VERSOES',
                          'FLW_ATENDIMENTO',
                          'FLW_PESQUISA',
                          'FLW_RESPOSTA',
                          'FLW_RESPOSTACOMPLEMENTO',
                          'FORMPAGAMENTO',
                          'FORMPAGAMENTO_EC',
                          'FREQTEMP',
                          'GERADOR_OSBOL',
                          'HISTC_CLIENTE',
                          'HISTC_VEICULO',
                          'HIST_ESTMOTO',
                          'HIST_ESTOQUE_DIARIO',
                          'HIST_ESTOQUE_DIARIO_PROD',
                          'HIST_REC',
                          'IMP_BAR_PROD',
                          'INV_BALANCO',
                          'INV_TIPO74',
                          'INV_TIPO74_POSSE',
                          'INV_TIPO74_SPED_SINT',
                          'ITEMPROD_ORC',
                          'ITEMPROD_ORC_TERC',
                          'ITEMSERV_ORC',
                          'ITEMSR_NFVENDA',
                          'ITEM_NFVENDA',
                          'ITEM_NF_ENTRADA',
                          'ITEM_OUTRAS_NF',
                          'ITEM_PEDIDO',
                          'ITEM_PEDIDO_NF_REC',
                          'ITENS_CARTA',
                          'ITENS_CARTA_CRED',
                          'LANCAMENTOS',
                          'LANCAMENTO_PAG',
                          'LANCCHEQUE',
                          'LANCCXL',
                          'LANC_DEBCRED',
                          'LEMBRETE_AGENDA',
                          'LISTA_COTACAO',
                          'LISTA_COTACAO_ITENS',
                          'LOG_ESTOQUE',
                          'LOTE_CXL',
                          'LOTE_LANC',
                          'LOTE_QUIT',
                          'MANUTENCAO',
                          'MAPA_RESUMO_ALIQ',
                          'MDFE',
                          'MDFE_CARREGA',
                          'MDFE_CONDUTOR',
                          'MDFE_DESCARGA',
                          'MDFE_DESCARGA_NFE',
                          'MDFE_DESCARGA_NFE_UN_TR',
                          'MDFE_DESCARGA_NFE_UN_TR_CARGA',
                          'MECANICO_OS',
                          'MENSAGEM_MOB',
                          'MOT_VEN',
                          'MOVIMENTO_CIAP',
                          'MOVIMENTO_PDV_FINAN',
                          'MTUSADAS',
                          'NFCE',
                          'NFCE_CONFIG',
                          'NFCE_DEST',
                          'NFCE_INFADIC',
                          'NFCE_ITEM',
                          'NFCE_MOVIMENTO',
                          'NFCE_MOVIMENTO_LANC',
                          'NFCE_PAGAMENTO',
                          'NFC_CENTRAL_ACOES',
                          'NFC_EMISSOR',
                          'NFSE_CANCELADAS',
                          'NF_DESTINADAS',
                          'NF_ENTRADA',
                          'NF_SERIE_D',
                          'NF_SERIE_D_ITENS',
                          'NF_TRANSITO',
                          'NF_VENDA',
                          'NOTAFISCAL',
                          'NOTAFISCAL_CARTA_CORRECAO',
                          'NOTAFISCAL_COLETA_ENTREGA',
                          'NOTAFISCAL_DUP',
                          'NOTAFISCAL_INUT',
                          'NOTAFISCAL_ITEM',
                          'NOTAFISCAL_ITEM_ADI',
                          'NOTAFISCAL_ITEM_DETEXPORT',
                          'NOTAFISCAL_ITEM_DI',
                          'NOTAFISCAL_ITEM_ECF',
                          'NOTAFISCAL_ITEM_EXPORTIND',
                          'NOTAFISCAL_ITEM_VEICULO',
                          'NOTAFISCAL_ITEM_VFE',
                          'NOTAFISCAL_OBSCONT',
                          'NOTAFISCAL_PAG',
                          'NOTAFISCAL_SPED_C110',
                          'NOTAFISCAL_SPED_C111',
                          'NOTAFISCAL_SPED_C112',
                          'NOTAFISCAL_SPED_C113',
                          'NOTAFISCAL_SPED_C114',
                          'NOTAFISCAL_SPED_C115',
                          'NOTAFISCAL_SPED_C120',
                          'NOTAFISCAL_SPED_C195_C197',
                          'NOTAS_EMITIDAS',
                          'NOTIFICACAO_CREDITOS',
                          'OBSERVACAO',
                          'OCORRENCIAS_OS',
                          'OCORRENCIA_SUG',
                          'OPPRODUTOS',
                          'ORCAMENTOS',
                          'ORC_SERV_TERCEIRO',
                          'ORDEM_SERV',
                          'OS_ITEM_PROD',
                          'OS_ITEM_SERV',
                          'OS_PROD_TERC',
                          'OUTRAS_NF',
                          'PAF_DOC_BASE_ATEST',
                          'PARAMETROS_DADOSADICIONAIS',
                          'PEDIDO',
                          'PEDVENDA',
                          'PEDVENDA_D',
                          'PEDVENDA_INV_POSSE',
                          'PEDVENDA_PROD',
                          'PEDVENDA_PROD_COND_DEV',
                          'PEDVENDA_PROD_CONF',
                          'PEDVENDA_PROD_D',
                          'PEDVENDA_PROD_TERC',
                          'PEDVENDA_REF_NF',
                          'PEDVENDA_SERV',
                          'PEDVENDA_SERV_TERC',
                          'PEDVENDA_VOLUMES',
                          'PENDENCIAS',
                          'PENDENCIAS_CARTAO',
                          'PENDENCIAS_VEIC',
                          'PEND_CCV',
                          'PLANO_PAG',
                          'PPS_PRODUTOS',
                          'PRESTACOES_FISCAL',
                          'PRODUCAO',
                          'PRODUCAO_ITEM',
                          'PRODUCAO_ITEM_INDICE',
                          'PRODUTOS_ALTERACOES',
                          'PRODUTOS_FORN_NFE',
                          'PRODUTOS_TMP',
                          'P_CONTAS_BALANCO',
                          'P_CONTAS_M',
                          'RECIBOS',
                          'REC_CXL',
                          'REGRAS_VENDAS',
                          'REGRAVND_CONDPAG',
                          'REL_VNDH',
                          'REQVENDA',
                          'REQVENDAD',
                          'REQVENDA_ITENS',
                          'REQVENDA_ITENSD',
                          'RESERVAG',
                          'RESERVAGUS',
                          'RESERVA_ALMOXARIFADO',
                          'RESERVA_ALMOXARIFADO_ITENS',
                          'RESUMOD',
                          'SALDO_DEBCRED',
                          'SAL_CNT',
                          'SAL_CTRL',
                          'SANGSUP',
                          'SERVICO_TRANSPORTE',
                          'SERVTP_ORC',
                          'SERV_TERCEIRO',
                          'SOLICITACOES_ACESSO',
                          'SPED_AQUISICAO_BENS',
                          'SPED_CONT_CRED_FISC',
                          'SPED_CONT_CRED_FISC_UTIL',
                          'SPED_DEPREC_AMORT_BENS',
                          'SPED_ESTOQUE_ABERTURA',
                          'SPED_F_ICMINTER_AJ',
                          'SPED_F_ICMINTER_AJ_INF_AD',
                          'SPED_F_ICMINTER_AJ_INF_DOC',
                          'SPED_F_ICMINTER_OB_DIFAL',
                          'SPED_ITEM',
                          'SPED_OUTRAS_RECEITAS_CREDITOS',
                          'SQLCONSULTASDIV',
                          'SUGESTAOCOMPRA',
                          'SUGESTAOCOMPRAIT',
                          'SUGESTAOSERVICO',
                          'SUG_OS',
                          'TEMP_SUG_SERV',
                          'TEMP_SUG_SERV_CL',
                          'TERMINALF',
                          'TERMINAL_CARTAO',
                          'TERMINAL_IMPRESSORAS',
                          'TIPO88_ICMSST_PERIODO',
                          'TMO_SERV_OS',
                          'TOTALIZADOR_NAOF',
                          'TRANSACAO_CARTAO',
                          'TRANSF_DEP',
                          'TRANSF_DEP_EST',
                          'TRANSITO_MOTOS',
                          'USER_CONSULTASDIV',
                          'VALE_CUPONS',
                          'VALORES_CIAP',
                          'VENDA_PERDIDA',
                          'WSREPLICACAO_CONSULTAS',
                          'WSR_CADASTROSBASICOS',
                          'WSR_CAMPOS',
                          'WSR_CONSULTAS',
                          'WSR_DEPENDENCIAS',
                          'WSR_EMPRESAS',
                          'WSR_GENERATOR_CODIGO',
                          'WSR_REPL',
                          'WSR_SCHEMAS',
                          'WSR_SCRIPTS',
                          'WSR_TABELAS',
                          'WSR_TAB_CHAVESALTERADAS')
        into :TABELA, :ORIGEM
  do
    suspend;
end;
|/BLOCO|

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG063', :COD_EMPRESA, 'REDEFINIR SENHA USUARIO', 10, '.', 1, 'N', 'S', CURRENT_DATE);

update RDB$FIELDS set RDB$FIELD_LENGTH = 255, RDB$CHARACTER_LENGTH = 255 where RDB$FIELD_NAME = (select rdb$field_source from rdb$relation_fields where rdb$relation_name = 'CONCILIACAO_FINANCEIRO' and rdb$field_name = 'ARQUIVO');|/BLOCO|

CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CLI294', :COD_EMPRESA, 'BT ADICIONAR CONTATO POR APLICATIVO CLIENTE', 2, 'FRMCADCLIENTE', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CLI295', :COD_EMPRESA, 'BT ALTERAR CONTATO POR APLICATIVO CLIENTE', 2, 'FRMCADCLIENTE', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CLI296', :COD_EMPRESA, 'BT EXCLUIR CONTATO POR APLICATIVO CLIENTE', 3, 'FRMCADCLIENTE', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CLI297', :COD_EMPRESA, 'BT SALVAR CONTATO POR APLICATIVO CLIENTE', 2, 'FRMCADCLIENTE', 1, 'N', 'S', CURRENT_DATE);

CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG064', :COD_EMPRESA, 'ABRIR TELA DE ORIGEM POR TIPO DE CONTATO', 10, 'FRMTIPOCONTATOORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG065', :COD_EMPRESA, 'BT PESQUISAR ORIGEM POR TIPO DE CONTATO', 10, 'FRMTIPOCONTATOORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG066', :COD_EMPRESA, 'BT NOVA ORIGEM POR TIPO DE CONTATO', 10, 'FRMTIPOCONTATOORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG067', :COD_EMPRESA, 'BT ALTERAR ORIGEM POR TIPO DE CONTATO', 10, 'FRMTIPOCONTATOORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG068', :COD_EMPRESA, 'BT REMOVER ORIGEM POR TIPO DE CONTATO', 10, 'FRMTIPOCONTATOORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG069', :COD_EMPRESA, 'BT SALVAR ORIGEM POR TIPO DE CONTATO', 10, 'FRMTIPOCONTATOORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG070', :COD_EMPRESA, 'ABRIR TELA DE ORIGEM POR TIPO CONTATO E PLATAFORMA', 10, 'FRMTIPOCONTATOORIGEMPLA', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG071', :COD_EMPRESA, 'BT PESQUISAR ORIGEM POR TIPO CONTATO E PLATAFORMA', 10, 'FRMTIPOCONTATOORIGEMPLA', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG072', :COD_EMPRESA, 'BT NOVA ORIGEM POR TIPO CONTATO E PLATAFORMA', 10, 'FRMTIPOCONTATOORIGEMPLA', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG073', :COD_EMPRESA, 'BT ALTERAR ORIGEM POR TIPO CONTATO E PLATAFORMA', 10, 'FRMTIPOCONTATOORIGEMPLA', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG074', :COD_EMPRESA, 'BT REMOVER ORIGEM POR TIPO CONTATO E PLATAFORMA', 10, 'FRMTIPOCONTATOORIGEMPLA', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG075', :COD_EMPRESA, 'BT SALVAR ORIGEM POR TIPO CONTATO E PLATAFORMA', 10, 'FRMTIPOCONTATOORIGEMPLA', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG076', :COD_EMPRESA, 'ABRIR TELA DE ORIGEM POR MODCARTAS', 10, 'FRMMODCARTASORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG077', :COD_EMPRESA, 'BT PESQUISAR ORIGEM POR MODCARTAS', 10, 'FRMMODCARTASORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG078', :COD_EMPRESA, 'BT NOVA ORIGEM POR MODCARTAS', 10, 'FRMMODCARTASORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG079', :COD_EMPRESA, 'BT ALTERAR ORIGEM POR MODCARTAS', 10, 'FRMMODCARTASORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG080', :COD_EMPRESA, 'BT REMOVER ORIGEM POR MODCARTAS', 10, 'FRMMODCARTASORIGEM', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CFG081', :COD_EMPRESA, 'BT SALVAR ORIGEM POR MODCARTAS', 10, 'FRMMODCARTASORIGEM', 1, 'N', 'S', CURRENT_DATE);

|BLOCO|
CREATE TABLE MSG_ORIGEM (
	ID					INTEGER NOT NULL,
	DESCRICAO			VARCHAR(50),
	"DISPLAY"  			VARCHAR(50)
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_ORIGEM ADD CONSTRAINT PK_MSG_ORIGEM PRIMARY KEY (ID);

CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (1, 'NFE', 'NFe');
CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (2, 'NFCE', 'NFCe');
CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (3, 'NFSE', 'NFSe');
CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (4, 'BOLETO', 'boleto');
CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (5, 'CONTRATO', 'contrato');
CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (6, 'NOTIFICACAO FINANCEIRO', 'notificação financeiro');
CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (7, 'PROPOSTA PRODUTO ', 'pedido de venda');
CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (8, 'PROPOSTA VEICULO', 'venda veículo');
CMD:COMMIT|INSERT INTO MSG_ORIGEM (ID, DESCRICAO, "DISPLAY") VALUES (9, 'RECIBO LOCACAO', 'recibo de locação');

|BLOCO|
CREATE TABLE MSG_APLICATIVO (
	ID					INTEGER NOT NULL,
	APLICATIVO			VARCHAR(50)
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_APLICATIVO ADD CONSTRAINT PK_MSG_APLICATIVO PRIMARY KEY (ID);

CMD:COMMIT|INSERT INTO MSG_APLICATIVO (ID, APLICATIVO) VALUES (0, ' ');
CMD:COMMIT|INSERT INTO MSG_APLICATIVO (ID, APLICATIVO) VALUES (1, 'E-MAIL');
CMD:COMMIT|INSERT INTO MSG_APLICATIVO (ID, APLICATIVO) VALUES (2, 'WHATSAPP');
CMD:COMMIT|INSERT INTO MSG_APLICATIVO (ID, APLICATIVO) VALUES (3, 'TELEGRAM');

|BLOCO|
CREATE TABLE MSG_PLATAFORMA (
    ID                  INTEGER NOT NULL,
    COD_EMPRESA         INTEGER NOT NULL,
	ID_MSG_APLICATIVO   INTEGER NOT NULL,
	PLATAFORMA          VARCHAR(50) NOT NULL,
	IDENTIFICADOR_BOT	VARCHAR(50)
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_PLATAFORMA ADD CONSTRAINT PK_MSG_PLATAFORMA PRIMARY KEY (ID, COD_EMPRESA);

CMD:COMMIT|ALTER TABLE MSG_PLATAFORMA ADD CONSTRAINT FK_MSG_PLATAFORMA_APLI FOREIGN KEY (ID_MSG_APLICATIVO) REFERENCES MSG_APLICATIVO (ID) ON DELETE CASCADE ON UPDATE CASCADE; 

CMD:COMMIT|INSERT INTO MSG_PLATAFORMA (ID, COD_EMPRESA, ID_MSG_APLICATIVO, PLATAFORMA, IDENTIFICADOR_BOT) VALUES (0, :COD_EMPRESA, 1, ' ', ' ');

|BLOCO|
CREATE OR ALTER TRIGGER MSG_PLATAFORMA_BI_SEQID FOR MSG_PLATAFORMA
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  IF (SUBSTRING(USER FROM 1 FOR 4) = 'REPL') THEN
     exit;
  if (coalesce(new.id, 0) <= 0) then
  begin
    select COD from INCREMENTA_CODIGO(new.COD_EMPRESA, 'MSG_PLATAFORMA')
      into new.ID;
  end
end;
|/BLOCO|

CMD:COMMIT|ALTER TABLE MODCARTAS ADD ID_MSG_APLICATIVO INTEGER;

CMD:COMMIT|ALTER TABLE MODCARTAS ADD TEMPLATE VARCHAR(64);

CMD:COMMIT|UPDATE MODCARTAS SET ID_MSG_APLICATIVO = 1 WHERE TIPO = 'NOT' AND ID_MSG_APLICATIVO IS NULL;

CMD:COMMIT|ALTER TABLE NOTIFICACAO_CREDITOS ADD ID_MSG_APLICATIVO INTEGER;

CMD:COMMIT|ALTER TABLE NOTIFICACAO_CREDITOS ADD ID_MSG_PLATAFORMA INTEGER;

CMD:COMMIT|UPDATE NOTIFICACAO_CREDITOS SET ID_MSG_APLICATIVO = 1 WHERE ID_MSG_APLICATIVO IS NULL;;

CMD:COMMIT|UPDATE NOTIFICACAO_CREDITOS SET ID_MSG_PLATAFORMA = 0 WHERE ID_MSG_PLATAFORMA IS NULL;;

CMD:COMMIT|ALTER TABLE MODCARTAS ADD CONSTRAINT FK_MODCARTAS_MSG_APLI FOREIGN KEY (ID_MSG_APLICATIVO) REFERENCES MSG_APLICATIVO (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE NOTIFICACAO_CREDITOS ADD CONSTRAINT FK_NOTIFICACAO_CREDITOS_APLI FOREIGN KEY (ID_MSG_APLICATIVO) REFERENCES MSG_APLICATIVO (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE NOTIFICACAO_CREDITOS ADD CONSTRAINT FK_NOTIFICACAO_CREDITOS_PLAT FOREIGN KEY (ID_MSG_PLATAFORMA, COD_EMPRESA) REFERENCES MSG_PLATAFORMA (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

|BLOCO|
create or alter procedure SP_FORMATA_DATA (
    PDATA timestamp)
returns (
    RESULT varchar(30))
as
begin
  /* Procedure Text */
  result = lpad(extract(day from pdata), 2, '0') || '/' || lpad(extract(month from pdata), 2, '0') || '/' || extract(year from pdata);
  suspend;
end;
|/BLOCO|

|BLOCO|
create or alter procedure SP_FORMATA_NUMERO (
    PVALOR numeric(15,4))
returns (
    RESULT varchar(30))
as
declare variable V_INTEIRO varchar(20);
declare variable V_DECIMAL varchar(10);
declare variable V_TAMANHO integer;
declare variable V_CONTADOR integer;
declare variable V_BLOCO integer;
BEGIN
    /* Converte o valor para string e separa a parte inteira da decimal */
    V_INTEIRO = CAST(TRUNC(PVALOR) AS VARCHAR(20));
    V_DECIMAL = SUBSTRING(CAST(PVALOR AS VARCHAR(30)) FROM POSITION('.' IN CAST(PVALOR AS VARCHAR(30))) + 1);
    
    V_DECIMAL = SUBSTRING(V_DECIMAL FROM 1 FOR 2);

    RESULT = '';
    V_TAMANHO = CHAR_LENGTH(V_INTEIRO);
    V_CONTADOR = V_TAMANHO;
    V_BLOCO = 0;

    /* Loop para inserir o separador de milhar (ponto) */
    WHILE (V_CONTADOR > 0) DO BEGIN
        RESULT = SUBSTRING(V_INTEIRO FROM V_CONTADOR FOR 1) || RESULT;
        V_BLOCO = V_BLOCO + 1;
        V_CONTADOR = V_CONTADOR - 1;

        IF ((V_BLOCO = 3) AND (V_CONTADOR > 0)) THEN BEGIN
            RESULT = '.' || RESULT;
            V_BLOCO = 0;
        END
    END

    /* Junta os milhares com a parte decimal */
    RESULT = RESULT || ',' || V_DECIMAL;
    SUSPEND;
END;
|/BLOCO|

ALTER TABLE CONFIG_API ADD COD_COND_PAG INTEGER;
ALTER TABLE CONFIG_API ADD MODELO_PADRAO INTEGER;
ALTER TABLE CONFIG_API ADD DIA_MES_INI_FAT_META INTEGER;
ALTER TABLE CONFIG_API ADD LIMITE_GASTOS_META T_VL_TODOS;
ALTER TABLE CONFIG_API ADD USAR_API_COG CHAR(1);
ALTER TABLE CONFIG_API ADD NOME_BOT VARCHAR(30);
ALTER TABLE CONFIG_API ADD HORARIO_SEMANA_INI VARCHAR(5);
ALTER TABLE CONFIG_API ADD HORARIO_SEMANA_FIM VARCHAR(5);
ALTER TABLE CONFIG_API ADD HORARIO_SABADO_INI VARCHAR(5);
ALTER TABLE CONFIG_API ADD HORARIO_SABADO_FIM VARCHAR(5);

|BLOCO|
CREATE TABLE MSG_TIPO_NOTIF (
	ID 					INTEGER NOT NULL,
	TIPO_NOT			VARCHAR(60)
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_TIPO_NOTIF ADD CONSTRAINT PK_MSG_TIPO_NOTIF PRIMARY KEY (ID);

INSERT INTO MSG_TIPO_NOTIF (ID, TIPO_NOT) VALUES (1, 'NOTAS FISCAIS');
INSERT INTO MSG_TIPO_NOTIF (ID, TIPO_NOT) VALUES (2, 'VENDA');
INSERT INTO MSG_TIPO_NOTIF (ID, TIPO_NOT) VALUES (3, 'BOLETO');
INSERT INTO MSG_TIPO_NOTIF (ID, TIPO_NOT) VALUES (4, 'FINANCEIRO');
INSERT INTO MSG_TIPO_NOTIF (ID, TIPO_NOT) VALUES (5, 'CONTRATO');

|BLOCO|
CREATE TABLE MSG_TIPO_NOTIF_ORIGEM (
    ID_MSG_TIPO_NOT  INTEGER NOT NULL,
    ID_MSG_ORIGEM    INTEGER NOT NULL
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_TIPO_NOTIF_ORIGEM ADD CONSTRAINT PK_MSG_TIPO_NOTIF_ORIGEM PRIMARY KEY (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM);

CMD:COMMIT|ALTER TABLE MSG_TIPO_NOTIF_ORIGEM ADD CONSTRAINT FK_MSG_TIPO_NOTIF_ORIGEM_ORIG FOREIGN KEY (ID_MSG_ORIGEM) REFERENCES MSG_ORIGEM (ID) ON DELETE CASCADE ON UPDATE CASCADE;
CMD:COMMIT|ALTER TABLE MSG_TIPO_NOTIF_ORIGEM ADD CONSTRAINT FK_MSG_TIPO_NOTIF_ORIGEM_TPNOT FOREIGN KEY (ID_MSG_TIPO_NOT) REFERENCES MSG_TIPO_NOTIF (ID) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (1, 1);
INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (1, 2);
INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (1, 3);
INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (2, 7);
INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (2, 8);
INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (2, 9);
INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (3, 4);
INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (4, 6);
INSERT INTO MSG_TIPO_NOTIF_ORIGEM (ID_MSG_TIPO_NOT, ID_MSG_ORIGEM) VALUES (5, 5);

|BLOCO|
CREATE TABLE MSG_PLATAFORMA (
    ID                  INTEGER NOT NULL,
    COD_EMPRESA         INTEGER NOT NULL,
	ID_MSG_APLICATIVO   INTEGER NOT NULL,
	PLATAFORMA          VARCHAR(50) NOT NULL,
	IDENTIFICADOR_BOT	VARCHAR(50),
	PADRAO				INTEGER DEFAULT 0
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_PLATAFORMA ADD CONSTRAINT PK_MSG_PLATAFORMA PRIMARY KEY (ID, COD_EMPRESA);

CMD:COMMIT|ALTER TABLE MSG_PLATAFORMA ADD CONSTRAINT FK_MSG_PLATAFORMA_APLI FOREIGN KEY (ID_MSG_APLICATIVO) REFERENCES MSG_APLICATIVO (ID) ON DELETE CASCADE ON UPDATE CASCADE; 

INSERT INTO MSG_PLATAFORMA (ID, COD_EMPRESA, ID_MSG_APLICATIVO, PLATAFORMA, IDENTIFICADOR_BOT) VALUES (0, :COD_EMPRESA, 1, ' ', ' ');

|BLOCO|
CREATE OR ALTER TRIGGER MSG_PLATAFORMA_BI_SEQID FOR MSG_PLATAFORMA
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  IF (SUBSTRING(USER FROM 1 FOR 4) = 'REPL') THEN
     exit;
  if (coalesce(new.id, 0) <= 0) then
  begin
    select COD from INCREMENTA_CODIGO(new.COD_EMPRESA, 'MSG_PLATAFORMA')
      into new.ID;
  end
end;
|/BLOCO|

INSERT INTO MODCARTAS (COD_CARTA, COD_EMPRESA, DESCRICAO, TIPO, ATIVO) VALUES (0, :COD_EMPRESA, ' ', ' ', 99);

ALTER TABLE MODCARTAS ADD ID_MSG_APLICATIVO INTEGER DEFAULT 0;

ALTER TABLE MODCARTAS ADD TEMPLATE VARCHAR(64);

ALTER TABLE MODCARTAS ADD ID_CONSULTAS_SQL VARCHAR(36);

ALTER TABLE MODCARTAS ADD DOC CHAR(1); 

ALTER TABLE NOTIFICACAO_CREDITOS ADD ASSUNTO VARCHAR(64);

ALTER TABLE NOTIFICACAO_CREDITOS ADD STATUS_ENV VARCHAR(2);

ALTER TABLE NOTIFICACAO_CREDITOS ADD UUID VARCHAR(50);

ALTER TABLE NOTIFICACAO_CREDITOS ADD OBS_ENV BLOB SUB_TYPE 1 SEGMENT SIZE 80;

ALTER TABLE NOTIFICACAO_CREDITOS ADD ID_MSG_APLICATIVO INTEGER DEFAULT 0;

ALTER TABLE NOTIFICACAO_CREDITOS ADD ID_MSG_PLATAFORMA INTEGER DEFAULT 0;

ALTER TABLE NOTIFICACAO_CREDITOS ADD ORIGEM VARCHAR(3);

ALTER TABLE NOTIFICACAO_CREDITOS ADD DESTINO VARCHAR(3);

ALTER TABLE NOTIFICACAO_CREDITOS ADD DATA_HORA_CONS TIMESTAMP;

UPDATE NOTIFICACAO_CREDITOS SET ID_MSG_APLICATIVO = 1 WHERE ID_MSG_APLICATIVO IS NULL;;

UPDATE NOTIFICACAO_CREDITOS SET ID_MSG_PLATAFORMA = 0 WHERE ID_MSG_PLATAFORMA IS NULL;;

|BLOCO|
CREATE TABLE MSG_CONTATO (
    ID                  INTEGER NOT NULL,
    COD_EMPRESA         INTEGER NOT NULL,
    COD_CLIENTE         INTEGER,
	COD_VENDEDOR    	INTEGER,
    ID_MSG_APLICATIVO   INTEGER NOT NULL,
    CONTATO             VARCHAR(32) NOT NULL,
    IDENTIFICADOR       VARCHAR(60) NOT NULL,
    ATIVO               INTEGER DEFAULT 1 
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_CONTATO ADD CONSTRAINT PK_MSG_CONTATO PRIMARY KEY (ID, COD_EMPRESA);

CMD:COMMIT|CREATE INDEX IDX_MSG_CONTATO_UNQ ON MSG_CONTATO (COD_CLIENTE, COD_VENDEDOR, COD_EMPRESA, ID_MSG_APLICATIVO, IDENTIFICADOR);

CMD:COMMIT|ALTER TABLE MSG_CONTATO ADD CONSTRAINT FK_MSG_CONTATO_CLI FOREIGN KEY (COD_CLIENTE, COD_EMPRESA) REFERENCES CLIENTES (COD_CLIENTE, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE MSG_CONTATO ADD CONSTRAINT FK_MSG_CONTATO_VEND FOREIGN KEY (COD_VENDEDOR, COD_EMPRESA) REFERENCES COLABORADOR(COD_VENDEDOR, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE MSG_CONTATO ADD CONSTRAINT FK_MSG_CONTATO_APLI FOREIGN KEY (ID_MSG_APLICATIVO) REFERENCES MSG_APLICATIVO (ID) ON DELETE CASCADE ON UPDATE CASCADE;

|BLOCO|
CREATE OR ALTER TRIGGER MSG_CONTATO_BI_SEQID FOR MSG_CONTATO
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  IF (SUBSTRING(USER FROM 1 FOR 4) = 'REPL') THEN
     exit;
  if (coalesce(new.id, 0) <= 0) then
  begin
    select COD from INCREMENTA_CODIGO(new.COD_EMPRESA, 'MSG_CONTATO')
      into new.ID;
  end
end;
|/BLOCO|

|BLOCO|
CREATE TABLE MSG_CONTATO_TIPO (
    ID_MSG_CONTATO      INTEGER NOT NULL,
	ID_TIPO_CONTATO		INTEGER NOT NULL,
    COD_EMPRESA         INTEGER NOT NULL
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_CONTATO_TIPO ADD CONSTRAINT PK_MSG_CONTATO_TIPO PRIMARY KEY (ID_MSG_CONTATO, ID_TIPO_CONTATO, COD_EMPRESA);

CMD:COMMIT|ALTER TABLE MSG_CONTATO_TIPO ADD CONSTRAINT FK_MSG_CONTATO_TIPO_MSG_CONTATO FOREIGN KEY (ID_MSG_CONTATO, COD_EMPRESA) REFERENCES MSG_CONTATO (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE MSG_CONTATO_TIPO ADD CONSTRAINT FK_MSG_CONTATO_TIPO_TPCONTATO FOREIGN KEY (ID_TIPO_CONTATO, COD_EMPRESA) REFERENCES TIPO_CONTATO (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

|BLOCO|
CREATE TABLE MSG_CONTATO_TIPO_NOTIF (
    ID_MSG_CONTATO      INTEGER NOT NULL,
	ID_MSG_TIPO_NOTIF   INTEGER NOT NULL,
	COD_EMPRESA         INTEGER NOT NULL,
    ACEITA				CHAR(1) NOT NULL
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_CONTATO_TIPO_NOTIF ADD CONSTRAINT PK_MSG_CONTATO_TIPO_NOTIF PRIMARY KEY (ID_MSG_CONTATO, ID_MSG_TIPO_NOTIF, COD_EMPRESA);

CMD:COMMIT|ALTER TABLE MSG_CONTATO_TIPO_NOTIF ADD CONSTRAINT FK_MSG_CONT_TP_NF_MSG_CONTATO FOREIGN KEY (ID_MSG_CONTATO, COD_EMPRESA) REFERENCES MSG_CONTATO (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE MSG_CONTATO_TIPO_NOTIF ADD CONSTRAINT FK_MSG_CONT_TP_NF_MSG_TIPO_NF FOREIGN KEY (ID_MSG_TIPO_NOTIF) REFERENCES MSG_TIPO_NOTIF(ID) ON DELETE CASCADE ON UPDATE CASCADE;

|BLOCO|
CREATE TABLE MSG_TIPO_CONTATO_ORIGEM (
	ID                  INTEGER NOT NULL,
	COD_EMPRESA         INTEGER NOT NULL,
    ID_TIPO_CONTATO		INTEGER NOT NULL,
	ID_MSG_ORIGEM	    INTEGER NOT NULL	
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_TIPO_CONTATO_ORIGEM ADD CONSTRAINT PK_MSG_TIPO_CONTATO_ORIGEM PRIMARY KEY (ID, COD_EMPRESA);

CMD:COMMIT|ALTER TABLE MSG_TIPO_CONTATO_ORIGEM ADD CONSTRAINT FK_MSG_TIPO_CONTATO_ORIGEM_TIPO FOREIGN KEY (ID_TIPO_CONTATO, COD_EMPRESA) REFERENCES TIPO_CONTATO (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE MSG_TIPO_CONTATO_ORIGEM ADD CONSTRAINT FK_MSG_TIPO_CONTATO_ORIGEM_ORIG FOREIGN KEY (ID_MSG_ORIGEM) REFERENCES MSG_ORIGEM (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|CREATE UNIQUE INDEX IDX_MSG_TIPO_CONTATO_ORIG_UNQ ON MSG_TIPO_CONTATO_ORIGEM (ID_TIPO_CONTATO, ID_MSG_ORIGEM, COD_EMPRESA);

|BLOCO|
CREATE OR ALTER TRIGGER MSG_TIPO_CONTAT_ORIGEM_BI_SEQID FOR MSG_TIPO_CONTATO_ORIGEM
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  IF (SUBSTRING(USER FROM 1 FOR 4) = 'REPL') THEN
     exit;
  if (coalesce(new.id, 0) <= 0) then
  begin
    select COD from INCREMENTA_CODIGO(new.COD_EMPRESA, 'MSG_TIPO_CONTATO_ORIGEM')
      into new.ID;
  end
end;
|/BLOCO|

|BLOCO|
CREATE TABLE MSG_TIPO_CONTATO_ORIGEM_PLAT (
	ID_MSG_PLATAFORMA				INTEGER NOT NULL,
	ID_MSG_TIPO_CONTATO_ORIGEM		INTEGER NOT NULL,
	COD_EMPRESA         			INTEGER NOT NULL
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_TIPO_CONTATO_ORIGEM_PLAT ADD CONSTRAINT PK_MSG_TIPO_CONTATO_ORIGEM_PLAT PRIMARY KEY (ID_MSG_PLATAFORMA, ID_MSG_TIPO_CONTATO_ORIGEM, COD_EMPRESA);

CMD:COMMIT|ALTER TABLE MSG_TIPO_CONTATO_ORIGEM_PLAT ADD CONSTRAINT FK_MSG_TPCONT_ORIG_PLAT_ORIG FOREIGN KEY (ID_MSG_TIPO_CONTATO_ORIGEM, COD_EMPRESA) REFERENCES MSG_TIPO_CONTATO_ORIGEM (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE MSG_TIPO_CONTATO_ORIGEM_PLAT ADD CONSTRAINT FK_MSG_TPCONT_ORIG_PLAT_PLAT FOREIGN KEY (ID_MSG_PLATAFORMA, COD_EMPRESA) REFERENCES MSG_PLATAFORMA (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

|BLOCO|
create or alter procedure SP_CONTATOS_CLIENTES (
    PCOD_CLIENTE integer,
    PCOD_EMPRESA integer,
    PORIGEM varchar(10))
returns (
    COD_CLIENTE integer,
    COD_EMPRESA integer,
    FONE varchar(14),
    CONTATO varchar(32),
    ID_TIPO integer,
    TIPO varchar(32),
    ID_CONTATO integer,
    ENV char(1))
as
begin
  /* Procedure Text */

  for select cl.cod_cliente, cl.cod_empresa,
      (select result from sonumeros(trim(cl.fone_celular))),
      trim(cl.contato),
      0, 'CELULAR', 0, 'N' from clientes cl
      where coalesce(cl.fone_celular, '') <> ''
      and cl.cod_cliente = :pcod_cliente
      and cl.cod_empresa = :pcod_empresa
      and (select count(*) from clientes_contato cc
           where cc.cod_cliente = cl.cod_cliente
           and cc.cod_empresa = cl.cod_empresa
           and trim(coalesce(cc.telefone, '')) = (select result from sonumeros(trim(coalesce(cl.fone_celular, ''))))) = 0
      union all
      select cl.cod_cliente, cl.cod_empresa,
      (select result from sonumeros(trim(cl.fone_cliente))),
      trim(cl.contato),
      0, 'FONE', 0, 'N' from clientes cl
      where coalesce(cl.fone_cliente, '') <> ''
      and cl.cod_cliente = :pcod_cliente
      and cl.cod_empresa = :pcod_empresa
      and (trim(coalesce(cl.fone_cliente, '')) <> trim(coalesce(cl.fone_celular, '')))
      and (select count(*) from clientes_contato cc
           where cc.cod_cliente = cl.cod_cliente
           and cc.cod_empresa = cl.cod_empresa
           and trim(coalesce(cc.telefone, '')) = (select result from sonumeros(trim(coalesce(cl.fone_cliente, ''))))) = 0
      union all
      select cl.cod_cliente, cl.cod_empresa,
      (select result from sonumeros(trim(cl.tel_res_cf))),
      trim(cl.contato),
      0, 'FONE RESIDENCIAL', 0, 'N' from clientes cl
      where coalesce(cl.tel_res_cf, '') <> ''
      and cl.cod_cliente = :pcod_cliente
      and cl.cod_empresa = :pcod_empresa
      and (trim(coalesce(cl.tel_res_cf, '')) <> trim(coalesce(cl.fone_celular, '')))
      and (trim(coalesce(cl.tel_res_cf, '')) <> trim(coalesce(cl.fone_cliente, '')))
      and (select count(*) from clientes_contato cc
           where cc.cod_cliente = cl.cod_cliente
           and cc.cod_empresa = cl.cod_empresa
           and trim(coalesce(cc.telefone, '')) = (select result from sonumeros(trim(coalesce(cl.tel_res_cf, ''))))) = 0
      union all
      select cl.cod_cliente, cl.cod_empresa,
      (select result from sonumeros(trim(cl.fax))),
      trim(cl.contato),
      0, 'FAX', 0, 'N' from clientes cl
      where coalesce(cl.fax, '') <> ''
      and cl.cod_cliente = :pcod_cliente
      and cl.cod_empresa = :pcod_empresa
      and (trim(coalesce(cl.fax, '')) <> trim(coalesce(cl.fone_celular, '')))
      and (trim(coalesce(cl.fax, '')) <> trim(coalesce(cl.fone_cliente, '')))
      and (trim(coalesce(cl.fax, '')) <> trim(coalesce(cl.tel_res_cf, '')))
      and (select count(*) from clientes_contato cc
           where cc.cod_cliente = cl.cod_cliente
           and cc.cod_empresa = cl.cod_empresa
           and trim(coalesce(cc.telefone, '')) = (select result from sonumeros(trim(coalesce(cl.fax, ''))))) = 0
      union all
      select cc.cod_cliente, cc.cod_empresa,
      (select result from sonumeros(trim(cc.telefone))),
      trim(cc.contato),
      cc.tipo_id, tp.tipo, cc.id,
      case when ((select count(*) from clientes_contato_env ce
                  where ce.cod_cliente = cc.cod_cliente
                  and ce.cod_empresa = cc.cod_empresa
                  and ce.origem_env = :porigem
                  and ce.id_contato = cc.id) > 0) then 'S' else 'N' end from clientes_contato cc
      inner join tipo_contato tp on tp.id = cc.tipo_id and tp.cod_empresa = cc.cod_empresa
      where coalesce(cc.telefone, '') <> ''
      and cc.cod_cliente = :pcod_cliente
      and cc.cod_empresa = :pcod_empresa
        into :cod_cliente, :cod_empresa, :fone, :contato, :id_tipo, :tipo, :id_contato, :env do
  begin
    suspend;
  end
end;
|/BLOCO|

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD STATUS_ENV VARCHAR(2);

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD UUID VARCHAR(50);

ALTER TABLE MENSAGEM_MOB ADD OBS_ENV BLOB SUB_TYPE 1 SEGMENT SIZE 80;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD ID_MSG_APLICATIVO INTEGER DEFAULT 0;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD ID_MSG_PLATAFORMA INTEGER DEFAULT 0;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD COD_CARTA INTEGER DEFAULT 0;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD ASSUNTO VARCHAR(64);

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD HTML BLOB SUB_TYPE 1 SEGMENT SIZE 80;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD COD_TAREFA INTEGER;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD EXEC_AUTO CHAR(1);

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD ORIGEM VARCHAR(3);

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD DESTINO VARCHAR(3);

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD COD_PROF_RESP INTEGER;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD ID_MSG_APLICATIVO_RESP INTEGER;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD ID_MSG_PLATAFORMA_RESP INTEGER;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD IDENTIFICADOR_RESP VARCHAR(60);

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD DATA_HORA_CONS TIMESTAMP;

CMD:COMMIT|UPDATE MENSAGEM_MOB SET ID_MSG_APLICATIVO = 0 WHERE ID_MSG_APLICATIVO IS NULL;

CMD:COMMIT|UPDATE MENSAGEM_MOB SET ID_MSG_PLATAFORMA = 0 WHERE ID_MSG_PLATAFORMA IS NULL;

CMD:COMMIT|UPDATE MENSAGEM_MOB SET COD_CARTA = 0 WHERE COD_CARTA IS NULL;

update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'ID_MSG_APLICATIVO') and (RDB$RELATION_NAME = 'MENSAGEM_MOB');

update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'ID_MSG_PLATAFORMA') and (RDB$RELATION_NAME = 'MENSAGEM_MOB');

update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'COD_CARTA') and (RDB$RELATION_NAME = 'MENSAGEM_MOB');

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD CONSTRAINT FK_MENSAGEM_MOB_APLICATIVO FOREIGN KEY (ID_MSG_APLICATIVO) REFERENCES MSG_APLICATIVO (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD CONSTRAINT FK_MENSAGEM_MOB_PLATAFORMA FOREIGN KEY (ID_MSG_PLATAFORMA,COD_EMPRESA) REFERENCES MSG_PLATAFORMA (ID,COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE; 

CMD:COMMIT|ALTER TABLE MENSAGEM_MOB ADD CONSTRAINT FK_MENSAGEM_MOB_MODCARTAS FOREIGN KEY (COD_CARTA,COD_EMPRESA) REFERENCES MODCARTAS (COD_CARTA,COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

UPDATE MOBILE SET DESCRICAO_MOB = '', ATIVO = 99 WHERE IDMOBILE = 0;

ALTER TABLE DOC_ELETRONICO ADD DATA TIMESTAMP;

update RDB$FIELDS set RDB$FIELD_LENGTH = 60, RDB$CHARACTER_LENGTH = 60 where RDB$FIELD_NAME = (select rdb$field_source from rdb$relation_fields where rdb$relation_name = 'MENSAGEM_MOB' and rdb$field_name = 'US_DEST');

DELETE FROM MENSAGEM_MOB WHERE DATA_ENVIO <= CURRENT_DATE - 60;

UPDATE MENSAGEM_MOB SET HTML = MENSAGEM, MENSAGEM = NULL WHERE MENSAGEM IS NOT NULL AND HTML IS NULL;

|BLOCO|
CREATE TRIGGER TR_MENSAGEM_MOB_HTML for MENSAGEM_MOB
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* Trigger text */
  if (inserting) then
  begin
    if ((new.html is null) and (new.mensagem is not null)) then
    begin
      new.html     = new.mensagem;
      new.mensagem = null;
    end
  end
end;
|/BLOCO|

|BLOCO|
CREATE TABLE MSG_ORIGEM_MODCARTAS (
    ID_MSG_ORIGEM INTEGER NOT NULL,
    COD_CARTA INTEGER NOT NULL,
    COD_EMPRESA INTEGER NOT NULL
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_ORIGEM_MODCARTAS ADD CONSTRAINT PK_MSG_ORIGEM_MODCARTAS PRIMARY KEY (ID_MSG_ORIGEM,COD_CARTA,COD_EMPRESA);

CMD:COMMIT|ALTER TABLE MSG_ORIGEM_MODCARTAS ADD CONSTRAINT FK_MSG_ORIGEM_MODCARTAS_ORIGEM FOREIGN KEY (ID_MSG_ORIGEM) REFERENCES MSG_ORIGEM (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|ALTER TABLE MSG_ORIGEM_MODCARTAS ADD CONSTRAINT FK_MSG_ORIGEM_MODCARTAS_MCARTAS FOREIGN KEY (COD_CARTA, COD_EMPRESA) REFERENCES MODCARTAS (COD_CARTA, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:COMMIT|CREATE EXCEPTION EXC_MSG_CONTATO 'Identificacao ja existe para este cliente/vendedor e aplicativo';

CMD:COMMIT|CREATE EXCEPTION EXC_MSG_TIPO_CONTATO_ORIG 'Existe registro para esse Tipo de Conta e Origem';

CMD:COMMIT|CREATE EXCEPTION EXC_MSG_APLI_TIPO_CONTATO_ORIG 'Este Aplicativo ja existe para esse Tipo de Conta e Origem';

CMD:COMMIT|CREATE EXCEPTION EXC_MODCARTAS_MSG_ORIG 'Este Aplicativo ja existe para essa Origem';

|BLOCO|
CREATE OR ALTER TRIGGER TR_MSG_CONTATO_CONF FOR MSG_CONTATO
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
 declare variable vexiste integer; 
begin
  /* Trigger text */
  if (substring(user from 1 for 4) = 'REPL') then
    exit;

  if (coalesce(new.cod_vendedor, 0) > 0) then
  begin
    select msg_contato.id from msg_contato
    where msg_contato.cod_cliente = new.cod_vendedor
    and msg_contato.cod_empresa = new.cod_empresa
    and msg_contato.id_msg_aplicativo = new.id_msg_aplicativo
    and msg_contato.identificador = new.identificador
    and msg_contato.ativo = new.ativo
    and msg_contato.id <> new.id
      into :vexiste;
  end	  
  else 
  begin
    select msg_contato.id from msg_contato
    where msg_contato.cod_cliente = new.cod_cliente
    and msg_contato.cod_empresa = new.cod_empresa
    and msg_contato.id_msg_aplicativo = new.id_msg_aplicativo
    and msg_contato.identificador = new.identificador
    and msg_contato.ativo = new.ativo
    and msg_contato.id <> new.id
      into :vexiste;
  end	  

  if (vexiste > 0) then
    exception EXC_MSG_CONTATO;
end;
|/BLOCO|

|BLOCO|
CREATE OR ALTER TRIGGER TR_MSG_TIPO_CONTATO_ORIGEM_CONF FOR MSG_TIPO_CONTATO_ORIGEM
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
 declare variable vexiste integer;   
begin
  /* Trigger text */
  if (substring(user from 1 for 4) = 'REPL') then
    exit;
	
  select msg_tipo_contato_origem.id from msg_tipo_contato_origem
  inner join tipo_contato on
    tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato 
    and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa 
  inner join msg_origem on
    msg_origem.id = msg_tipo_contato_origem.id_msg_origem 
  where msg_tipo_contato_origem.id_tipo_contato = new.id_tipo_contato
  and msg_tipo_contato_origem.id_msg_origem = new.id_msg_origem
  and msg_tipo_contato_origem.cod_empresa = new.cod_empresa
  and msg_tipo_contato_origem.id <> new.id
    into :vexiste;

  if (vexiste > 0) then
    exception EXC_MSG_TIPO_CONTATO_ORIG;
end;
|/BLOCO|

|BLOCO|
CREATE OR ALTER TRIGGER TR_MSG_TIPO_CONT_ORIG_PLAT_CONF FOR MSG_TIPO_CONTATO_ORIGEM_PLAT
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
  declare variable vexiste integer;
begin
  /* Trigger text */

  if (substring(user from 1 for 4) = 'REPL') then
    exit;

  select first 1 msg_tipo_contato_origem_plat.id_msg_plataforma from msg_tipo_contato_origem_plat
  inner join msg_tipo_contato_origem on
      msg_tipo_contato_origem.id = msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem
      and msg_tipo_contato_origem.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa
  inner join msg_plataforma on
      msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma
      and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa
  inner join msg_aplicativo on
      msg_aplicativo.id = msg_plataforma.id_msg_aplicativo
  inner join tipo_contato on
      tipo_contato.id = msg_tipo_contato_origem.id_tipo_contato
      and tipo_contato.cod_empresa = msg_tipo_contato_origem.cod_empresa
  inner join msg_origem on
      msg_origem.id = msg_tipo_contato_origem.id_msg_origem
  where msg_tipo_contato_origem_plat.id_msg_plataforma <> new.id_msg_plataforma
  and msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = new.id_msg_tipo_contato_origem
  and msg_tipo_contato_origem_plat.cod_empresa = new.cod_empresa
  and msg_plataforma.id_msg_aplicativo in (select msg_plataforma.id_msg_aplicativo from msg_plataforma
                                           where msg_plataforma.id = new.id_msg_plataforma
                                           and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa)
    into :vexiste;

  if (vexiste > 0) then
    exception EXC_MSG_APLI_TIPO_CONTATO_ORIG;
end;
|/BLOCO|

|BLOCO|
CREATE OR ALTER TRIGGER TR_MSG_ORIGEM_MODCARTAS_CONF FOR MSG_ORIGEM_MODCARTAS
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
  declare variable vexiste integer;
begin
  /* Trigger text */

  if (substring(user from 1 for 4) = 'REPL') then
    exit;

  select msg_origem_modcartas.id_msg_origem from msg_origem_modcartas
  inner join modcartas on
    modcartas.cod_carta = msg_origem_modcartas.cod_carta
    and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa
  inner join msg_aplicativo on
    msg_aplicativo.id = modcartas.id_msg_aplicativo
  inner join msg_origem on
    msg_origem.id = msg_origem_modcartas.id_msg_origem
  where msg_origem_modcartas.id_msg_origem = new.id_msg_origem
  and msg_origem_modcartas.cod_carta <> new.cod_carta
  and msg_origem_modcartas.cod_empresa = new.cod_empresa
  and modcartas.id_msg_aplicativo in (select modcartas.id_msg_aplicativo from modcartas
                                      where modcartas.cod_carta = new.cod_carta
                                      and modcartas.cod_empresa = new.cod_empresa)
  and modcartas.doc in (select 'Q' from rdb$database
                        union all
                        select modcartas.doc from modcartas
                        where modcartas.cod_carta = new.cod_carta
                        and modcartas.cod_empresa = new.cod_empresa)
    into :vexiste;

  if (vexiste > 0) then
    exception EXC_MODCARTAS_MSG_ORIG;
end;
|/BLOCO|

ALTER TABLE BOLETAS ADD ENV_MENS_BOL CHAR(1);
ALTER TABLE BOLETAS ADD DATA_MENS_BOL TIMESTAMP;
ALTER TABLE BOLETAS ADD COD_US_MENS_BOL INTEGER;

|BLOCO|
create or alter procedure RETORNA_DATA_ENV_BOL (
    PN_SEQ_BOL integer,
    PCOD_EMPRESA integer)
returns (
    DATA_ENV_WHATSAPP timestamp,
    DATA_ENV_EMAIL timestamp,
    DATA_ENV_MENS timestamp)
as
begin
  /* Procedure Text */
  data_env_email    = null;
  data_env_whatsapp = null;
  data_env_mens     = null;

  select first 1 data_env from(
        select first 1 env_doc.data_env from env_doc
        where env_doc.num_doc = 'BOL_' || :pn_seq_bol
        and env_doc.cod_empresa = :pcod_empresa
        and env_doc.tipo_env = 'W'
        union
        select first 1 bol.data_whatsapp_bol from boletas bol
        where bol.n_seq_bol = :pn_seq_bol
        and bol.cod_empresa = :pcod_empresa
        order by 1 desc)
          into :data_env_whatsapp;

  select first 1 data_env from(
        select first 1 env_doc.data_env from env_doc
        where env_doc.num_doc = 'BOL_' || :pn_seq_bol
        and env_doc.cod_empresa = :pcod_empresa
        and env_doc.tipo_env = 'E'
        union
        select first 1 bol.data_email_bol from boletas bol
        where bol.n_seq_bol = :pn_seq_bol
        and bol.cod_empresa = :pcod_empresa
        order by 1 desc)
          into :data_env_email;

  select first 1 data_env from(
        select first 1 env_doc.data_env from env_doc
        where env_doc.num_doc = 'BOL_' || :pn_seq_bol
        and env_doc.cod_empresa = :pcod_empresa
        and env_doc.tipo_env = 'M'
        union
        select first 1 bol.data_email_bol from boletas bol
        where bol.n_seq_bol = :pn_seq_bol
        and bol.cod_empresa = :pcod_empresa
        order by 1 desc)
          into :data_env_mens;

  suspend;
end;
|/BLOCO|

ALTER TABLE CLIENTES ADD SINC_CONTATO CHAR(1);

ALTER TABLE COLABORADOR ADD SINC_CONTATO CHAR(1);

|BLOCO|
create or alter procedure SP_CONTATOS_CLIENTES (
    PCOD_CLIENTE integer,
    PCOD_EMPRESA integer,
    PORIGEM varchar(10))
returns (
    COD_CLIENTE integer,
    COD_EMPRESA integer,
    FONE varchar(14),
    CONTATO varchar(32),
    ID_TIPO integer,
    TIPO varchar(32),
    ID_CONTATO integer,
    ENV char(1))
as
declare variable VSQL varchar(10000);
declare variable VTEMP varchar(200);
begin
  /* Procedure Text */
  if (trim(coalesce(porigem, '')) <> 'CONTRATO') then
    vtemp = ' and ce.origem_env <> ''CONTRATO'' ';
  else
    vtemp = ' and ce.origem_env = ''CONTRATO'' ';

  vsql =
      '   select cl.cod_cliente, cl.cod_empresa,
          (select result from sonumeros(trim(cl.fone_celular))),
          trim(cl.contato),
          0, ''CELULAR'', 0, ''N'' from clientes cl
          where coalesce(cl.fone_celular, '''') <> ''''
          and cl.cod_cliente = ' || :pcod_cliente || '
          and cl.cod_empresa = ' || :pcod_empresa || '
          and (select count(*) from clientes_contato cc
               where cc.cod_cliente = cl.cod_cliente
               and cc.cod_empresa = cl.cod_empresa
               and trim(coalesce(cc.telefone, '''')) = (select result from sonumeros(trim(coalesce(cl.fone_celular, ''''))))) = 0
          union all
          select cl.cod_cliente, cl.cod_empresa,
          (select result from sonumeros(trim(cl.fone_cliente))),
          trim(cl.contato),
          0, ''FONE'', 0, ''N'' from clientes cl
          where coalesce(cl.fone_cliente, '''') <> ''''
          and cl.cod_cliente = ' || :pcod_cliente || '
          and cl.cod_empresa = ' || :pcod_empresa || '
          and (trim(coalesce(cl.fone_cliente, '''')) <> trim(coalesce(cl.fone_celular, '''')))
          and (select count(*) from clientes_contato cc
               where cc.cod_cliente = cl.cod_cliente
               and cc.cod_empresa = cl.cod_empresa
               and trim(coalesce(cc.telefone, '''')) = (select result from sonumeros(trim(coalesce(cl.fone_cliente, ''''))))) = 0
          union all
          select cl.cod_cliente, cl.cod_empresa,
          (select result from sonumeros(trim(cl.tel_res_cf))),
          trim(cl.contato),
          0, ''FONE RESIDENCIAL'', 0, ''N'' from clientes cl
          where coalesce(cl.tel_res_cf, '''') <> ''''
          and cl.cod_cliente = ' || :pcod_cliente || '
          and cl.cod_empresa = ' || :pcod_empresa || '
          and (trim(coalesce(cl.tel_res_cf, '''')) <> trim(coalesce(cl.fone_celular, '''')))
          and (trim(coalesce(cl.tel_res_cf, '''')) <> trim(coalesce(cl.fone_cliente, '''')))
          and (select count(*) from clientes_contato cc
               where cc.cod_cliente = cl.cod_cliente
               and cc.cod_empresa = cl.cod_empresa
               and trim(coalesce(cc.telefone, '''')) = (select result from sonumeros(trim(coalesce(cl.tel_res_cf, ''''))))) = 0
          union all
          select cl.cod_cliente, cl.cod_empresa,
          (select result from sonumeros(trim(cl.fax))),
          trim(cl.contato),
          0, ''FAX'', 0, ''N'' from clientes cl
          where coalesce(cl.fax, '''') <> ''''
          and cl.cod_cliente = ' || :pcod_cliente || '
          and cl.cod_empresa = ' || :pcod_empresa || '
          and (trim(coalesce(cl.fax, '''')) <> trim(coalesce(cl.fone_celular, '''')))
          and (trim(coalesce(cl.fax, '''')) <> trim(coalesce(cl.fone_cliente, '''')))
          and (trim(coalesce(cl.fax, '''')) <> trim(coalesce(cl.tel_res_cf, '''')))
          and (select count(*) from clientes_contato cc
               where cc.cod_cliente = cl.cod_cliente
               and cc.cod_empresa = cl.cod_empresa
               and trim(coalesce(cc.telefone, '''')) = (select result from sonumeros(trim(coalesce(cl.fax, ''''))))) = 0
          union all
          select cc.cod_cliente, cc.cod_empresa,
          (select result from sonumeros(trim(cc.telefone))),
          trim(cc.contato),
          cc.tipo_id, tp.tipo, cc.id,
          case when ((select count(*) from clientes_contato_env ce
                      where ce.cod_cliente = cc.cod_cliente
                      and ce.cod_empresa = cc.cod_empresa ' || :vtemp || '
                      and ce.id_contato = cc.id) > 0) then ''S'' else ''N'' end from clientes_contato cc
          inner join tipo_contato tp on tp.id = cc.tipo_id and tp.cod_empresa = cc.cod_empresa
          where coalesce(cc.telefone, '''') <> ''''
          and cc.cod_cliente = ' || :pcod_cliente || '
          and cc.cod_empresa = ' || :pcod_empresa;

  for execute statement
    vsql
      into :cod_cliente, :cod_empresa, :fone, :contato, :id_tipo, :tipo, :id_contato, :env do
  begin
    suspend;
  end
end;
|/BLOCO|

|BLOCO|
CREATE TABLE CONSULTAS_SQL (
    ID   VARCHAR(36) NOT NULL,
    SQL  BLOB SUB_TYPE 1 SEGMENT SIZE 4096 NOT NULL
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE CONSULTAS_SQL ADD CONSTRAINT PK_CONSULTAS_SQL PRIMARY KEY (ID);

|BLOCO|
CREATE TABLE MSG_TIPO_TEMPLATE (
    ID           INTEGER NOT NULL,
    CATEGORIA    VARCHAR(50),
    VALOR_APROX  T_N_GERAL
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_TIPO_TEMPLATE ADD CONSTRAINT PK_MSG_TIPO_TEMPLATE PRIMARY KEY (ID);

|BLOCO|
CREATE TABLE MSG_TEMPLATE (
    ID           			INTEGER NOT NULL,
    COD_EMPRESA  			INTEGER NOT NULL,
    ID_MSG_TIPO_TEMPLATE    INTEGER NOT NULL,
    TEMPLATE     			VARCHAR(50),
    STATUS       			VARCHAR(20),
    TEXTO        			BLOB SUB_TYPE 1 SEGMENT SIZE 80
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE MSG_TEMPLATE ADD CONSTRAINT PK_MSG_TEMPLATE PRIMARY KEY (ID, COD_EMPRESA);

CMD:COMMIT|ALTER TABLE MSG_TEMPLATE ADD CONSTRAINT FK_MSG_TEMPLATE_TIPO_TEMPLATE FOREIGN KEY (ID_MSG_TIPO_TEMPLATE) REFERENCES MSG_TIPO_TEMPLATE(ID) ON DELETE CASCADE ON UPDATE CASCADE;

CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CLI298', :COD_EMPRESA, 'BT REDEFINIR SENHA USUARIO', 10, 'FRMCADCLIENTE', 1, 'S', 'S', CURRENT_DATE);

CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL038', :COD_EMPRESA, 'BT ADICIONAR TIPO CONTATO VENDEDOR', 2, 'FRMCADCOLABORADOR', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL039', :COD_EMPRESA, 'BT ALTERAR TIPO CONTATO VENDEDOR', 2, 'FRMCADCOLABORADOR', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL040', :COD_EMPRESA, 'BT EXCLUIR TIPO CONTATO VENDEDOR', 3, 'FRMCADCOLABORADOR', 1, 'S', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL041', :COD_EMPRESA, 'BT ADICIONAR CONTATO POR APLICATIVO CLIENTE', 2, 'FRMCADCOLABORADOR', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL042', :COD_EMPRESA, 'BT ALTERAR CONTATO POR APLICATIVO CLIENTE', 2, 'FRMCADCOLABORADOR', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL043', :COD_EMPRESA, 'BT EXCLUIR CONTATO POR APLICATIVO CLIENTE', 3, 'FRMCADCOLABORADOR', 1, 'N', 'S', CURRENT_DATE);
CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('COL044', :COD_EMPRESA, 'BT SALVAR CONTATO POR APLICATIVO CLIENTE', 2, 'FRMCADCOLABORADOR', 1, 'N', 'S', CURRENT_DATE);

ALTER TABLE EMPRESA ADD SINC_HWCLOUD CHAR(1) DEFAULT 'N';
ALTER TABLE CLIENTES ADD SINC_HWCLOUD CHAR(1) DEFAULT 'N';
ALTER TABLE CLIENTES ADD SINC_SENHA_HWCLOUD CHAR(1) DEFAULT 'N';
ALTER TABLE COLABORADOR ADD SINC_HWCLOUD CHAR(1) DEFAULT 'N';
ALTER TABLE MSG_CONTATO ADD SINC_HWCLOUD CHAR(1) DEFAULT 'N';

|BLOCO|
CREATE OR ALTER PROCEDURE DEC_TO_HEX (
    DECIMAL_VAL BIGINT
)
RETURNS (
    HEX_VAL VARCHAR(16)
)
AS
DECLARE VARIABLE REMINDER INT;
DECLARE VARIABLE DIGITS CHAR(16);
BEGIN
    -- Mapeamento dos digitos hexadecimais (0-9, A-F)
    DIGITS = '0123456789ABCDEF';
    HEX_VAL = '';

    -- Caso especial para o numero zero
    IF (DECIMAL_VAL = 0) THEN
    BEGIN
        HEX_VAL = '0';
        SUSPEND;
        EXIT;
    END

    -- Loop de divisao sucessiva por 16
    WHILE (DECIMAL_VAL > 0) DO
    BEGIN
        REMINDER = MOD(DECIMAL_VAL, 16);
        HEX_VAL = SUBSTRING(DIGITS FROM REMINDER + 1 FOR 1) || HEX_VAL;
        DECIMAL_VAL = DECIMAL_VAL / 16;
    END

    SUSPEND;
END;
|/BLOCO|

ALTER TABLE PROMOCAO ADD PADRAO CHAR(1);

|BLOCO|CMD:INATIVO|
create or alter procedure ATUALIZAR_LISTA_PROMOCAO (
    COD_EMPRESA integer)
returns (
    RESULT varchar(10))
as
declare variable VDATA_INI timestamp;
declare variable VDATA_FIM timestamp;
declare variable VHORA_INI varchar(8);
declare variable VHORA_FIM varchar(8);
declare variable VORDEM integer;
declare variable VTIPO char(1);
declare variable VCODIGO integer;
declare variable VCOD_TPPRECO integer;
declare variable VDESCRICAO varchar(128);
declare variable VPROMOCAO integer;
declare variable VLOCALIDADE integer;
declare variable VSETOR integer;
declare variable VCIDADE integer;
declare variable VAVULSO integer;
declare variable VQUANTIDADE integer;
declare variable VINCORDEM integer;
begin
  /* Procedure Text */
  result = 'ERRO';

  for select promocao.cod_promocao, promocao.cod_tppreco,
      cast('2000-01-01 00:00:01' as timestamp) data_ini,
      cast('2099-12-31 23:59:59' as timestamp) data_fim,
      '00:00:01' hora_ini,
      '23:59:59' hora_fim from promocao
      where promocao.cod_promocao > 0 
	  and promocao.cod_empresa = :cod_empresa
      and promocao.data_ini is null
      and promocao.data_fim is null
      into :vpromocao, :vcod_tppreco, :vdata_ini, :vdata_fim, :vhora_ini, :vhora_fim do
  begin
    update promocao set
        promocao.data_ini = :vdata_ini,
        promocao.data_fim = :vdata_fim,
        promocao.hora_ini = :vhora_ini,
        promocao.hora_fim = :vhora_fim
    where promocao.cod_promocao = :vpromocao
    and promocao.cod_tppreco = :vcod_tppreco
    and promocao.cod_empresa = :cod_empresa;
  end

  for select promocao.cod_promocao, promocao.cod_tppreco,
      ((select result from strzero(extract(hour from promocao.data_ini), 2)) || ':' ||
       (select result from strzero(extract(minute from promocao.data_ini), 2)) || ':' ||
       (select result from strzero(extract(second from promocao.data_ini), 2))
      ) hora_ini,
      ((select result from strzero(extract(hour from promocao.data_fim), 2)) || ':' ||
       (select result from strzero(extract(minute from promocao.data_fim), 2)) || ':' ||
       (select result from strzero(extract(second from promocao.data_fim), 2))
      ) hora_fim from promocao
      where promocao.cod_empresa = :cod_empresa
	  and promocao.cod_promocao > 0
      and promocao.data_ini is not null
      and promocao.data_fim is not null
      and coalesce(promocao.hora_ini, '') = ''
      and coalesce(promocao.hora_fim, '') = ''
        into :vpromocao, :vcod_tppreco, :vhora_ini, :vhora_fim do
  begin
    update promocao set
        promocao.hora_ini = :vhora_ini,
        promocao.hora_fim = :vhora_fim
    where promocao.cod_promocao = :vpromocao
    and promocao.cod_tppreco = :vcod_tppreco
    and promocao.cod_empresa = :cod_empresa;
  end

  select count(*) from tipo_preco where cod_tppreco = 1 and cod_empresa = :cod_empresa into :vpromocao;
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (1, :cod_empresa, 'P', 'PROMOCAO', NULL, NULL);
  end

  select count(*) from tipo_preco where cod_tppreco = 2 and cod_empresa = :cod_empresa into :vlocalidade;
  if (coalesce(vlocalidade, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (2, :cod_empresa, 'T', 'LOCALIDADE', 'S', 'S');
  end

  select count(*) from tipo_preco where cod_tppreco = 3 and cod_empresa = :cod_empresa into :vsetor;
  if (coalesce(vsetor, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (3, :cod_empresa, 'T', 'SETOR', 'S', 'S');
  end

  select count(*) from tipo_preco where cod_tppreco = 4 and cod_empresa = :cod_empresa into :vcidade;
  if (coalesce(vcidade, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (4, :cod_empresa, 'T', 'CIDADE', 'S', 'S');
  end

  select count(*) from tipo_preco where cod_tppreco = 5 and cod_empresa = :cod_empresa into :vavulso;
  if (coalesce(vavulso, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (5, :cod_empresa, 'T', 'AVULSO', NULL, NULL);
  end

  select count(*) from tipo_preco where cod_tppreco = 6 and cod_empresa = :cod_empresa into :vquantidade;
  if (coalesce(vquantidade, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (6, :cod_empresa, 'Q', 'QUANTIDADE', 'N', 'S');
  end
  
  select count(*) from promocao where cod_promocao = 0 and cod_tppreco = 2 and cod_empresa = :cod_empresa into :vpromocao;
  
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, ordem, ativo, recalc_preco, usar_debcred)
    values (0, 2, :cod_empresa, 'TABELA DE PRECO', 1, 1, 'N', 'S');
  end
  
  select count(*) from promocao where cod_promocao = 0 and cod_tppreco = 3 and cod_empresa = :cod_empresa into :vpromocao;
  
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, ordem, ativo, recalc_preco, usar_debcred)
    values (0, 3, :cod_empresa, 'TABELA DE PRECO', 1, 1, 'N', 'S');
  end
  
  select count(*) from promocao where cod_promocao = 0 and cod_tppreco = 4 and cod_empresa = :cod_empresa into :vpromocao;
  
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, ordem, ativo, recalc_preco, usar_debcred)
    values (0, 4, :cod_empresa, 'TABELA DE PRECO', 1, 1, 'N', 'S');
  end
  
  select count(*) from promocao where cod_promocao = 0 and cod_tppreco = 6 and cod_empresa = :cod_empresa into :vpromocao;
  
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, ordem, ativo, recalc_preco, usar_debcred)
    values (0, 6, :cod_empresa, 'TABELA DE PRECO', 1, 1, 'N', 'S');
  end
  
  update promocao set ordem = 999 where ativo <> 1;
  
  select max(promocao.cod_promocao) from promocao where promocao.cod_empresa = :cod_empresa into :vpromocao;
  
  select valor from codigo where tabela = 'PROMOCAO' and cod_empresa = :cod_empresa into :vcodigo;
  
  if (coalesce(vpromocao, 0) > coalesce(vcodigo, 0)) then
    update codigo set valor = coalesce(:vpromocao, 0) where tabela = 'PROMOCAO' and cod_empresa = :cod_empresa;

  select count(*) from promocao where cod_promocao > 0 and cod_tppreco = 2 and cod_empresa = :cod_empresa and padrao = 'S' into :vlocalidade;
  if (coalesce(vlocalidade, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, data_ini, data_fim, hora_ini, hora_fim, ordem, ativo, recalc_preco, usar_debcred, padrao)
    values ((select cod from incrementa_codigo (:cod_empresa, 'PROMOCAO')),
             2,
             :cod_empresa,
             'LOCALIDADE',
             '2000-01-01 00:00:01',
             '2099-12-31 23:59:59',
             '00:00:01',
             '23:59:59',
             0,
             88,
             coalesce((select coalesce(tipo_preco.recalc_preco, 'N') from tipo_preco
                       where tipo_preco.cod_tppreco = 2
                       and tipo_preco.cod_empresa = :cod_empresa), 'N'),
             'S',
			 'S');
  end

  select count(*) from promocao where cod_promocao > 0 and cod_tppreco = 3 and cod_empresa = :cod_empresa and padrao = 'S' into :vsetor;
  if (coalesce(vsetor, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, data_ini, data_fim, hora_ini, hora_fim, ordem, ativo, recalc_preco, usar_debcred, padrao)
    values ((select cod from incrementa_codigo (:cod_empresa, 'PROMOCAO')),
             3,
             :cod_empresa,
             'SETOR',
             '2000-01-01 00:00:01',
             '2099-12-31 23:59:59',
             '00:00:01',
             '23:59:59',
             0,
             88,
             coalesce((select coalesce(tipo_preco.recalc_preco, 'N') from tipo_preco
                      where tipo_preco.cod_tppreco = 3
                      and tipo_preco.cod_empresa = :cod_empresa), 'N'),
             'S',
			 'S');
  end

  select count(*) from promocao where cod_promocao > 0 and cod_tppreco = 4 and cod_empresa = :cod_empresa and padrao = 'S' into :vcidade;
  if (coalesce(vcidade, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, data_ini, data_fim, hora_ini, hora_fim, ordem, ativo, recalc_preco, usar_debcred, padrao)
    values ((select cod from incrementa_codigo (:cod_empresa, 'PROMOCAO')),
             4,
             :cod_empresa,
             'CIDADE',
             '2000-01-01 00:00:01',
             '2099-12-31 23:59:59',
             '00:00:01',
             '23:59:59',
             0,
             88,
             coalesce((select coalesce(tipo_preco.recalc_preco, 'N') from tipo_preco
                      where tipo_preco.cod_tppreco = 4
                      and tipo_preco.cod_empresa = :cod_empresa), 'N'),
             'S',
			 'S');
  end

  select count(*) from promocao where cod_promocao > 0 and cod_tppreco = 6 and cod_empresa = :cod_empresa and padrao = 'S' into :vquantidade;
  if (coalesce(vquantidade, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, data_ini, data_fim, hora_ini, hora_fim, ordem, ativo, recalc_preco, usar_debcred, padrao)
    values ((select cod from incrementa_codigo (:cod_empresa, 'PROMOCAO')),
             6,
             :cod_empresa,
             'QUANTIDADE',
             '2000-01-01 00:00:01',
             '2099-12-31 23:59:59',
             '00:00:01',
             '23:59:59',
             0,
             88,
             coalesce((select coalesce(tipo_preco.recalc_preco, 'N') from tipo_preco
                      where tipo_preco.cod_tppreco = 6
                      and tipo_preco.cod_empresa = :cod_empresa), 'N'),
             'S',
			 'S');
  end
  
  vincordem = 0;
  for select (1000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'P' and promocao.cod_promocao > 0 
      union all
      select first 1 (2000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'T' and promocao.cod_promocao > 0 and promocao.descr_promocao = 'LOCALIDADE'
      union all
      select first 1 (3000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'T' and promocao.cod_promocao > 0 and promocao.descr_promocao = 'SETOR'
      union all
      select first 1 (4000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'T' and promocao.cod_promocao > 0 and promocao.descr_promocao = 'CIDADE'
      union all
      select (5000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'T' and promocao.cod_promocao > 0 and promocao.descr_promocao not in ('LOCALIDADE', 'SETOR', 'CIDADE')
      union all
      select first 1 (6000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'Q' and promocao.cod_promocao > 0 and promocao.descr_promocao = 'QUANTIDADE'
      order by 4, 1
        into :vordem, :vtipo, :vcodigo, :vcod_tppreco, :vdescricao do
  begin
     vincordem = vincordem + 1;
     update promocao set promocao.ordem = coalesce(:vincordem, 0)
     where promocao.cod_promocao = :vcodigo
     and promocao.cod_tppreco = :vcod_tppreco
     and promocao.cod_empresa = :cod_empresa;
  end

  result = 'OK';
  suspend;
end;
|/BLOCO|

CMD:INATIVO|execute procedure atualizar_lista_promocao (:COD_EMPRESA);

ALTER TABLE PROMOCAO_PRODUTO ADD QTDE T_D_QUANT;

ALTER TABLE FERIADO ADD TIPO_FERIADO VARCHAR(10);

|BLOCO|
CREATE TABLE JORNADA_TRABALHO (
	CODIGO		     		INTEGER NOT NULL,	
	COD_EMPRESA  			INTEGER NOT NULL,
	DESCRICAO      			VARCHAR(60),
    HORARIO_INI_PADRAO		VARCHAR(5),
	HORARIO_FIM_PADRAO		VARCHAR(5),
	DIAS_FOLGA_SEMANAIS     VARCHAR(20)
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE JORNADA_TRABALHO ADD CONSTRAINT PK_JORNADA_TRABALHO PRIMARY KEY (CODIGO, COD_EMPRESA);

CMD:COMMIT|ALTER TABLE COLABORADOR ADD COD_JORNADA_TRABALHO INTEGER;

CMD:COMMIT|ALTER TABLE COLABORADOR ADD CONSTRAINT FK_COLABORADOR_JORNADA_TRABALHO FOREIGN KEY (COD_JORNADA_TRABALHO, COD_EMPRESA) REFERENCES JORNADA_TRABALHO (CODIGO, COD_EMPRESA);

|BLOCO|
CREATE TABLE CALEND_COLAB_EXC (
	CODIGO		     		INTEGER NOT NULL,	
	COD_EMPRESA  			INTEGER NOT NULL,
	COD_COLABORADOR      	INTEGER NOT NULL,
    DATA					TIMESTAMP NOT NULL,
	TRABALHAR        		CHAR(1) NOT NULL,
	MOTIVO					VARCHAR(60),
	HORA_INI     			VARCHAR(8),
	HORA_FIM				VARCHAR(8)
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE CALEND_COLAB_EXC ADD CONSTRAINT PK_CALEND_COLAB_EXC PRIMARY KEY (CODIGO,COD_EMPRESA);

CMD:COMMIT|ALTER TABLE CALEND_COLAB_EXC ADD CONSTRAINT FK_CALEND_COLAB_EXC_COL FOREIGN KEY (COD_COLABORADOR, COD_EMPRESA) REFERENCES COLABORADOR(COD_VENDEDOR, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

|BLOCO|
CREATE TABLE CALEND_ESCALA_SEMANAL (
	CODIGO		     		INTEGER NOT NULL,	
	COD_EMPRESA  			INTEGER NOT NULL,
	DESCRICAO				VARCHAR(60)
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE CALEND_ESCALA_SEMANAL ADD CONSTRAINT PK_CALEND_ESCALA_SEMANAL PRIMARY KEY (CODIGO, COD_EMPRESA);

|BLOCO|
CREATE TABLE CALEND_ESCALA_SEMANAL_ITENS (
	CODIGO 					INTEGER NOT NULL,
	COD_EMPRESA  			INTEGER NOT NULL,
	DIA_SEMANA				INTEGER NOT NULL,
	HORA_INI     			VARCHAR(8),
	HORA_FIM				VARCHAR(8)
);
|/BLOCO|

CMD:COMMIT|ALTER TABLE CALEND_ESCALA_SEMANAL_ITENS ADD CONSTRAINT PK_CALEND_ESCALA_SEMANAL_ITENS PRIMARY KEY (CODIGO, COD_EMPRESA, DIA_SEMANA);

CMD:COMMIT|ALTER TABLE COLABORADOR ADD COD_ESCALA_SEMANAL INTEGER;

CMD:COMMIT|ALTER TABLE COLABORADOR ADD CONSTRAINT FK_COLABORADOR_CALEND_ESC_SEMA FOREIGN KEY (COD_ESCALA_SEMANAL, COD_EMPRESA) REFERENCES CALEND_ESCALA_SEMANAL (CODIGO, COD_EMPRESA);

update RDB$FIELDS set RDB$FIELD_LENGTH = 60, RDB$CHARACTER_LENGTH = 60 where RDB$FIELD_NAME = (select b.rdb$field_name from rdb$relation_fields a inner join rdb$fields b on a.rdb$field_source = b.rdb$field_name where a.rdb$relation_name = 'FERIADO' and a.rdb$field_name = 'DESCR_FERIADO');

update RDB$FIELDS set RDB$FIELD_LENGTH = 18, RDB$CHARACTER_LENGTH = 18 where RDB$FIELD_NAME = (select b.rdb$field_name from rdb$relation_fields a inner join rdb$fields b on a.rdb$field_source = b.rdb$field_name where a.rdb$relation_name = 'CONFIG_API' and a.rdb$field_name = 'AMBIENTE_API');

ALTER TABLE CONFIG_API ADD TIPO_OS VARCHAR(40);

ALTER TABLE CONFIG_API ADD CAMINHO_LOGO_EMP VARCHAR(256);
ALTER TABLE CONFIG_API ADD CAMINHO_FAVICON_EMP VARCHAR(256);

ALTER TABLE CONFIG_API ADD CAMINHO_LOGO_EMP_BASE64 BLOB SUB_TYPE 1 SEGMENT SIZE 80;
ALTER TABLE CONFIG_API ADD CAMINHO_FAVICON_EMP_BASE64 BLOB SUB_TYPE 1 SEGMENT SIZE 80; 

ALTER TABLE CONFIG_API ADD COR_PRIMARY VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_PRIMARY_CONTAINER VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_PRIMARY_FIXED VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_ON_PRIMARY VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_SECONDARY VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_SECONDARY_CONTAINER VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_TERTIARY VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_ERROR VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_BACKGROUND VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_SURFACE_LOWEST VARCHAR(7);
ALTER TABLE CONFIG_API ADD COR_SURFACE_LOW VARCHAR(7);

ALTER TABLE PROMOCAO ADD GUIDT CHAR(36);
ALTER TABLE LOCALIDADE ADD GUIDT CHAR(36);
ALTER TABLE SETOR ADD GUIDT CHAR(36);

CREATE UNIQUE INDEX PROMOCAO_GUID ON PROMOCAO (GUIDT);
CREATE UNIQUE INDEX LOCALIDADE_GUID ON LOCALIDADE (GUIDT);
CREATE UNIQUE INDEX SETOR_GUID ON SETOR (GUIDT);

|BLOCO|
CREATE OR ALTER TRIGGER PROMOCAO_BI_GUID FOR PROMOCAO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (coalesce(new.GUIDT, '') = '') then
    new.GUIDT = (select GUID from SPDB_GUID);
end;
|/BLOCO|

|BLOCO|
CREATE OR ALTER TRIGGER LOCALIDADE_BI_GUID FOR LOCALIDADE
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (coalesce(new.GUIDT, '') = '') then
    new.GUIDT = (select GUID from SPDB_GUID);
end;
|/BLOCO|

|BLOCO|
CREATE OR ALTER TRIGGER SETOR_BI_GUID FOR SETOR
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (coalesce(new.GUIDT, '') = '') then
    new.GUIDT = (select GUID from SPDB_GUID);
end;
|/BLOCO|

CMD:INATIVO|UPDATE PROMOCAO SET PROMOCAO.GUIDT = (select GUID from SPDB_GUID) WHERE PROMOCAO.GUIDT IS NULL;

CMD:INATIVO|UPDATE LOCALIDADE SET LOCALIDADE.GUIDT = (select GUID from SPDB_GUID) WHERE LOCALIDADE.GUIDT IS NULL;

CMD:INATIVO|UPDATE SETOR SET SETOR.GUIDT = (select GUID from SPDB_GUID) WHERE SETOR.GUIDT IS NULL;

ALTER TABLE BANCOS_HOMOLOGADOS ADD QRCODE_PIX CHAR(1);
ALTER TABLE BANCOS_HOMOLOGADOS ADD VER_CERT_DIG CHAR(1);

UPDATE BANCOS_HOMOLOGADOS SET QRCODE_PIX = 'S' WHERE CODBANCO = '001' AND QRCODE_PIX IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET QRCODE_PIX = 'S' WHERE CODBANCO = '033' AND QRCODE_PIX IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET QRCODE_PIX = 'S' WHERE CODBANCO = '104' AND QRCODE_PIX IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET QRCODE_PIX = 'S' WHERE CODBANCO = '341' AND QRCODE_PIX IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET QRCODE_PIX = 'S' WHERE CODBANCO = '748' AND QRCODE_PIX IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET QRCODE_PIX = 'S' WHERE CODBANCO = '756' AND QRCODE_PIX IS NULL;

UPDATE BANCOS_HOMOLOGADOS SET VER_CERT_DIG = 'S' WHERE CODBANCO = '033' AND VER_CERT_DIG IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET VER_CERT_DIG = 'S' WHERE CODBANCO = '104' AND VER_CERT_DIG IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET VER_CERT_DIG = 'S' WHERE CODBANCO = '341' AND VER_CERT_DIG IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET VER_CERT_DIG = 'S' WHERE CODBANCO = '748' AND VER_CERT_DIG IS NULL;
UPDATE BANCOS_HOMOLOGADOS SET VER_CERT_DIG = 'S' WHERE CODBANCO = '756' AND VER_CERT_DIG IS NULL;

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('VND300', :COD_EMPRESA, 'GERAR ZIP NFS OS', 1, 'N', '.', 1, 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('VND301', :COD_EMPRESA, 'GERAR ZIP NF OS', 1, 'N', '.', 1, 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('VND302', :COD_EMPRESA, 'GERAR ZIP RECIBO LOCACAO OS', 1, 'N', '.', 1, 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BOL042', :COD_EMPRESA, 'GERAR ZIP BOLETO', 1, 'N', '.', 1, 'S', CURRENT_DATE);

|BLOCO|
CREATE OR ALTER TRIGGER TI_PROMOCAO_PRODUTO FOR PROMOCAO
ACTIVE AFTER UPDATE POSITION 0
AS
begin
   /* Trigger text */
  if (substring(user from 1 for 4) = 'REPL') then
    exit;

   if ((old.data_ini <> new.data_ini) or (old.data_fim <> new.data_fim) or (old.hora_ini <> new.hora_ini) or (old.hora_fim <> new.hora_fim))then
   begin
    update promocao_produto set data_ini = new.data_ini, data_fim = new.data_fim, hora_ini = new.hora_ini, hora_fim = new.hora_fim
    where cod_promocao = old.cod_promocao and cod_tppreco = old.cod_tppreco and cod_empresa = old.cod_empresa;
   end
end;
|/BLOCO|

CMD:REPL|UPDATE PROMOCAO SET PROMOCAO.GUIDT = (select GUID from SPDB_GUID) WHERE PROMOCAO.GUIDT IS NULL;

CMD:REPL|UPDATE LOCALIDADE SET LOCALIDADE.GUIDT = (select GUID from SPDB_GUID) WHERE LOCALIDADE.GUIDT IS NULL;

CMD:REPL|UPDATE SETOR SET SETOR.GUIDT = (select GUID from SPDB_GUID) WHERE SETOR.GUIDT IS NULL;

CMD:INATIVO|execute procedure atualizar_lista_promocao (:COD_EMPRESA);

|BLOCO|
create or alter procedure ATUALIZAR_LISTA_PROMOCAO (
    COD_EMPRESA integer)
returns (
    RESULT varchar(10))
as
declare variable VDATA_INI timestamp;
declare variable VDATA_FIM timestamp;
declare variable VHORA_INI varchar(8);
declare variable VHORA_FIM varchar(8);
declare variable VORDEM integer;
declare variable VTIPO char(1);
declare variable VCODIGO integer;
declare variable VCOD_TPPRECO integer;
declare variable VDESCRICAO varchar(128);
declare variable VPROMOCAO integer;
declare variable VLOCALIDADE integer;
declare variable VSETOR integer;
declare variable VCIDADE integer;
declare variable VAVULSO integer;
declare variable VQUANTIDADE integer;
declare variable VINCORDEM integer;
begin
  /* Procedure Text */
  result = 'ERRO';

  for select promocao.cod_promocao, promocao.cod_tppreco,
      cast('2000-01-01 00:00:01' as timestamp) data_ini,
      cast('2099-12-31 23:59:59' as timestamp) data_fim,
      '00:00:01' hora_ini,
      '23:59:59' hora_fim from promocao
      where promocao.cod_promocao > 0 
	  and promocao.cod_empresa = :cod_empresa
      and promocao.data_ini is null
      and promocao.data_fim is null
      into :vpromocao, :vcod_tppreco, :vdata_ini, :vdata_fim, :vhora_ini, :vhora_fim do
  begin
    update promocao set
        promocao.data_ini = :vdata_ini,
        promocao.data_fim = :vdata_fim,
        promocao.hora_ini = :vhora_ini,
        promocao.hora_fim = :vhora_fim
    where promocao.cod_promocao = :vpromocao
    and promocao.cod_tppreco = :vcod_tppreco
    and promocao.cod_empresa = :cod_empresa;
  end

  for select promocao.cod_promocao, promocao.cod_tppreco,
      ((select result from strzero(extract(hour from promocao.data_ini), 2)) || ':' ||
       (select result from strzero(extract(minute from promocao.data_ini), 2)) || ':' ||
       (select result from strzero(extract(second from promocao.data_ini), 2))
      ) hora_ini,
      ((select result from strzero(extract(hour from promocao.data_fim), 2)) || ':' ||
       (select result from strzero(extract(minute from promocao.data_fim), 2)) || ':' ||
       (select result from strzero(extract(second from promocao.data_fim), 2))
      ) hora_fim from promocao
      where promocao.cod_empresa = :cod_empresa
	  and promocao.cod_promocao > 0
      and promocao.data_ini is not null
      and promocao.data_fim is not null
      and coalesce(promocao.hora_ini, '') = ''
      and coalesce(promocao.hora_fim, '') = ''
        into :vpromocao, :vcod_tppreco, :vhora_ini, :vhora_fim do
  begin
    update promocao set
        promocao.hora_ini = :vhora_ini,
        promocao.hora_fim = :vhora_fim
    where promocao.cod_promocao = :vpromocao
    and promocao.cod_tppreco = :vcod_tppreco
    and promocao.cod_empresa = :cod_empresa;
  end

  select count(*) from tipo_preco where cod_tppreco = 1 and cod_empresa = :cod_empresa into :vpromocao;
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (1, :cod_empresa, 'P', 'PROMOCAO', NULL, NULL);
  end

  select count(*) from tipo_preco where cod_tppreco = 2 and cod_empresa = :cod_empresa into :vlocalidade;
  if (coalesce(vlocalidade, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (2, :cod_empresa, 'T', 'LOCALIDADE', 'S', 'S');
  end

  select count(*) from tipo_preco where cod_tppreco = 3 and cod_empresa = :cod_empresa into :vsetor;
  if (coalesce(vsetor, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (3, :cod_empresa, 'T', 'SETOR', 'S', 'S');
  end

  select count(*) from tipo_preco where cod_tppreco = 4 and cod_empresa = :cod_empresa into :vcidade;
  if (coalesce(vcidade, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (4, :cod_empresa, 'T', 'CIDADE', 'S', 'S');
  end

  select count(*) from tipo_preco where cod_tppreco = 5 and cod_empresa = :cod_empresa into :vavulso;
  if (coalesce(vavulso, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (5, :cod_empresa, 'T', 'AVULSO', NULL, NULL);
  end

  select count(*) from tipo_preco where cod_tppreco = 6 and cod_empresa = :cod_empresa into :vquantidade;
  if (coalesce(vquantidade, 0) <= 0) then
  begin
    insert into tipo_preco (cod_tppreco, cod_empresa, tipo, descr_tipo, recalc_preco, usar_debcred)
    values (6, :cod_empresa, 'Q', 'QUANTIDADE', 'N', 'S');
  end
  
  select count(*) from promocao where cod_promocao = 0 and cod_tppreco = 2 and cod_empresa = :cod_empresa into :vpromocao;
  
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, ordem, ativo, recalc_preco, usar_debcred)
    values (0, 2, :cod_empresa, 'TABELA DE PRECO', 1, 1, 'N', 'S');
  end
  
  select count(*) from promocao where cod_promocao = 0 and cod_tppreco = 3 and cod_empresa = :cod_empresa into :vpromocao;
  
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, ordem, ativo, recalc_preco, usar_debcred)
    values (0, 3, :cod_empresa, 'TABELA DE PRECO', 1, 1, 'N', 'S');
  end
  
  select count(*) from promocao where cod_promocao = 0 and cod_tppreco = 4 and cod_empresa = :cod_empresa into :vpromocao;
  
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, ordem, ativo, recalc_preco, usar_debcred)
    values (0, 4, :cod_empresa, 'TABELA DE PRECO', 1, 1, 'N', 'S');
  end
  
  select count(*) from promocao where cod_promocao = 0 and cod_tppreco = 6 and cod_empresa = :cod_empresa into :vpromocao;
  
  if (coalesce(vpromocao, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, ordem, ativo, recalc_preco, usar_debcred)
    values (0, 6, :cod_empresa, 'TABELA DE PRECO', 1, 1, 'N', 'S');
  end
  
  update promocao set ordem = 999 where ativo <> 1;
  
  select max(promocao.cod_promocao) from promocao where promocao.cod_empresa = :cod_empresa into :vpromocao;
  
  select valor from codigo where tabela = 'PROMOCAO' and cod_empresa = :cod_empresa into :vcodigo;
  
  if (coalesce(vpromocao, 0) > coalesce(vcodigo, 0)) then
    update codigo set valor = coalesce(:vpromocao, 0) where tabela = 'PROMOCAO' and cod_empresa = :cod_empresa;

  select count(*) from promocao where cod_promocao > 0 and cod_tppreco = 2 and cod_empresa = :cod_empresa and padrao = 'S' into :vlocalidade;
  if (coalesce(vlocalidade, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, data_ini, data_fim, hora_ini, hora_fim, ordem, ativo, recalc_preco, usar_debcred, padrao)
    values ((select cod from incrementa_codigo (:cod_empresa, 'PROMOCAO')),
             2,
             :cod_empresa,
             'LOCALIDADE',
             '2000-01-01 00:00:01',
             '2099-12-31 23:59:59',
             '00:00:01',
             '23:59:59',
             0,
             88,
             coalesce((select coalesce(tipo_preco.recalc_preco, 'N') from tipo_preco
                       where tipo_preco.cod_tppreco = 2
                       and tipo_preco.cod_empresa = :cod_empresa), 'N'),
             'S',
			 'S');
  end

  select count(*) from promocao where cod_promocao > 0 and cod_tppreco = 3 and cod_empresa = :cod_empresa and padrao = 'S' into :vsetor;
  if (coalesce(vsetor, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, data_ini, data_fim, hora_ini, hora_fim, ordem, ativo, recalc_preco, usar_debcred, padrao)
    values ((select cod from incrementa_codigo (:cod_empresa, 'PROMOCAO')),
             3,
             :cod_empresa,
             'SETOR',
             '2000-01-01 00:00:01',
             '2099-12-31 23:59:59',
             '00:00:01',
             '23:59:59',
             0,
             88,
             coalesce((select coalesce(tipo_preco.recalc_preco, 'N') from tipo_preco
                      where tipo_preco.cod_tppreco = 3
                      and tipo_preco.cod_empresa = :cod_empresa), 'N'),
             'S',
			 'S');
  end

  select count(*) from promocao where cod_promocao > 0 and cod_tppreco = 4 and cod_empresa = :cod_empresa and padrao = 'S' into :vcidade;
  if (coalesce(vcidade, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, data_ini, data_fim, hora_ini, hora_fim, ordem, ativo, recalc_preco, usar_debcred, padrao)
    values ((select cod from incrementa_codigo (:cod_empresa, 'PROMOCAO')),
             4,
             :cod_empresa,
             'CIDADE',
             '2000-01-01 00:00:01',
             '2099-12-31 23:59:59',
             '00:00:01',
             '23:59:59',
             0,
             88,
             coalesce((select coalesce(tipo_preco.recalc_preco, 'N') from tipo_preco
                      where tipo_preco.cod_tppreco = 4
                      and tipo_preco.cod_empresa = :cod_empresa), 'N'),
             'S',
			 'S');
  end

  select count(*) from promocao where cod_promocao > 0 and cod_tppreco = 6 and cod_empresa = :cod_empresa and padrao = 'S' into :vquantidade;
  if (coalesce(vquantidade, 0) <= 0) then
  begin
    insert into promocao (cod_promocao, cod_tppreco, cod_empresa, descr_promocao, data_ini, data_fim, hora_ini, hora_fim, ordem, ativo, recalc_preco, usar_debcred, padrao)
    values ((select cod from incrementa_codigo (:cod_empresa, 'PROMOCAO')),
             6,
             :cod_empresa,
             'QUANTIDADE',
             '2000-01-01 00:00:01',
             '2099-12-31 23:59:59',
             '00:00:01',
             '23:59:59',
             0,
             88,
             coalesce((select coalesce(tipo_preco.recalc_preco, 'N') from tipo_preco
                      where tipo_preco.cod_tppreco = 6
                      and tipo_preco.cod_empresa = :cod_empresa), 'N'),
             'S',
			 'S');
  end
  
  vincordem = 0;
  for select (1000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'P' and promocao.cod_promocao > 0 
      union all
      select first 1 (2000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'T' and promocao.cod_promocao > 0 and promocao.descr_promocao = 'LOCALIDADE'
      union all
      select first 1 (3000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'T' and promocao.cod_promocao > 0 and promocao.descr_promocao = 'SETOR'
      union all
      select first 1 (4000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'T' and promocao.cod_promocao > 0 and promocao.descr_promocao = 'CIDADE'
      union all
      select (5000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'T' and promocao.cod_promocao > 0 and promocao.descr_promocao not in ('LOCALIDADE', 'SETOR', 'CIDADE')
      union all
      select first 1 (6000 + promocao.ordem) ordem, tipo_preco.tipo, promocao.cod_promocao, promocao.cod_tppreco, promocao.descr_promocao from promocao
      inner join tipo_preco on tipo_preco.cod_tppreco = promocao.cod_tppreco and tipo_preco.cod_empresa =  promocao.cod_empresa
      where promocao.cod_empresa = :cod_empresa and promocao.ativo in (1, 88) and tipo_preco.tipo = 'Q' and promocao.cod_promocao > 0 and promocao.descr_promocao = 'QUANTIDADE'
      order by 4, 1
        into :vordem, :vtipo, :vcodigo, :vcod_tppreco, :vdescricao do
  begin
     vincordem = vincordem + 1;
     update promocao set promocao.ordem = coalesce(:vincordem, 0)
     where promocao.cod_promocao = :vcodigo
     and promocao.cod_tppreco = :vcod_tppreco
     and promocao.cod_empresa = :cod_empresa;
  end

  result = 'OK';
  suspend;
end;
|/BLOCO|

CMD:REPL|execute procedure atualizar_lista_promocao (:COD_EMPRESA);

ALTER TABLE KITS_PROD ADD GUIDT CHAR(36);

CREATE UNIQUE INDEX KITS_PROD_GUID ON KITS_PROD (GUIDT);

|BLOCO|
CREATE OR ALTER TRIGGER KITS_PROD_BI_GUID FOR KITS_PROD
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (coalesce(new.GUIDT, '') = '') then
    new.GUIDT = (select GUID from SPDB_GUID);
end;
|/BLOCO|

CMD:REPL|UPDATE KITS_PROD SET KITS_PROD.GUIDT = (select GUID from SPDB_GUID) WHERE KITS_PROD.GUIDT IS NULL;

ALTER TABLE CONFIG_API ADD DRIVE_TYPE VARCHAR(50);
ALTER TABLE CONFIG_API ADD DRIVE_CHECK_MODIF CHAR(1);
ALTER TABLE CONFIG_API ADD UTIL_AGENTIC_RAG CHAR(1);
ALTER TABLE CONFIG_API ADD PASTA_PADRAO_DRIVE VARCHAR(50);
ALTER TABLE CONFIG_API ADD DRIVE_CREDENTIALS BLOB SUB_TYPE 1 SEGMENT SIZE 80;
                           
|BLOCO|
CREATE TABLE PROMOCAO_ORDEM_HC (
    COD_PROMOCAO  INTEGER NOT NULL,
    COD_EMPRESA   INTEGER NOT NULL,
    ORDEM         INTEGER,
    ATUAL         CHAR(1)
);
|/BLOCO|

ALTER TABLE PROMOCAO_ORDEM_HC ADD CONSTRAINT PK_PROMOCAO_ORDEM_HC PRIMARY KEY (COD_PROMOCAO, COD_EMPRESA);

|BLOCO|
CREATE OR ALTER TRIGGER TR_PROMOCAO_ORDEM_CA FOR PROMOCAO_ORDEM_CA
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
 DECLARE VARIABLE VCODIGO INTEGER;
begin
  IF (SUBSTRING(USER FROM 1 FOR 4) = 'REPL') THEN
    exit;

  if (new.ordem is not null) then
    exit;

  select COD from INCREMENTA_CODIGO(new.cod_empresa, 'PROMOCAO_ORDEM_CA') into :vcodigo;
  new.ordem = :vcodigo;
end;
|/BLOCO|

|BLOCO|
CREATE OR ALTER TRIGGER TR_PROMOCAO_ORDEM_HC FOR PROMOCAO_ORDEM_HC
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
 DECLARE VARIABLE VCODIGO INTEGER;
begin
  IF (SUBSTRING(USER FROM 1 FOR 4) = 'REPL') THEN
    exit;

  if (new.ordem is not null) then
    exit;

  select COD from INCREMENTA_CODIGO(new.cod_empresa, 'PROMOCAO_ORDEM_HC') into :vcodigo;
  new.ordem = :vcodigo;
end;
|/BLOCO|

|BLOCO|
CREATE TABLE COLLECTIONS_RAG_HC (
    COD_EMPRESA       INTEGER NOT NULL,
	COLLECTION_RAG    VARCHAR(50) NOT NULL
);
|/BLOCO|

ALTER TABLE COLLECTIONS_RAG_HC ADD CONSTRAINT PK_COLLECTIONS_RAG_HC PRIMARY KEY (COD_EMPRESA, COLLECTION_RAG);

ALTER TABLE PROMOCAO_ORDEM_HC ADD TAB_CE CHAR(1);
ALTER TABLE PROMOCAO_ORDEM_HC ADD TAB_CI CHAR(1);

ALTER TABLE PRODUTOS ADD SINC_HW_CLOUD CHAR(1);
ALTER TABLE KITS_PROD ADD SINC_HW_CLOUD CHAR(1);
ALTER TABLE TIPO_SERVICO ADD SINC_HW_CLOUD CHAR(1);

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS560', :COD_EMPRESA, 'ALTERAR DADOS TIPO DE SERVICO EM LOTE', 5, 'FRMCADTIPOSERV', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS561', :COD_EMPRESA, 'SALVAR DADOS TIPO DE SERVICO EM LOTE', 5, 'FRMCADTIPOSERV', 1, 'S', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('BAS562', :COD_EMPRESA, 'SINCRONIZAR TIPO DE SERVICO EM LOTE', 5, 'FRMCADTIPOSERV', 1, 'S', 'S', CURRENT_DATE);

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('PRO460', :COD_EMPRESA, 'ALTERAR DADOS KITS DE PRODUTOS EM LOTE', 5, 'FRMCADKITS', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('PRO461', :COD_EMPRESA, 'SALVAR DADOS KITS DE PRODUTOS EM LOTE', 5, 'FRMCADKITS', 1, 'S', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('PRO462', :COD_EMPRESA, 'SINCRONIZAR KITS DE PRODUTOS EM LOTE', 5, 'FRMCADKITS', 1, 'S', 'S', CURRENT_DATE);

ALTER TABLE KITS_PROD ADD DATA_CAD_KIT TIMESTAMP;
ALTER TABLE KITS_PROD ADD DATA_MOD_KIT TIMESTAMP;

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('PRO463', :COD_EMPRESA, 'SINCRONIZAR GRADE EM LOTE', 5, 'FRMCADGRADE', 1, 'S', 'S', CURRENT_DATE);

ALTER TABLE GRADE ADD DATA_CAD_GR TIMESTAMP;
ALTER TABLE GRADE ADD DATA_MOD_GR TIMESTAMP;

|BLOCO|
create or alter procedure RETORNA_VL_CHQ_VENC (
    PCOD_CLIENTE integer,
    PCOD_EMPRESA integer,
    PCPF_CNPJ varchar(18))
returns (
    VALOR_CHQ double precision)
as
declare variable VSQL varchar(1000);
declare variable VFINANCEIRO_UNIFICADO char(1);
declare variable VVALOR_CHQ double precision;
begin
  /* Procedure Text */

  valor_chq = 0;

  select empresa.financeiro_unificado from empresa where empresa.cod_empresa = :pcod_empresa into :vfinanceiro_unificado;

  vsql =
    ' select sum(coalesce(formpagamento.valordoc, 0)) soma from formpagamento
      inner join empresa on empresa.cod_empresa = formpagamento.cod_empresa
      inner join clientes on
        clientes.cod_cliente = formpagamento.cod_cliente
        and clientes.cod_empresa = formpagamento.cod_empresa
      inner join controles on
        controles.codigo_ctrl = formpagamento.cod_controle
        and controles.codigo_emp = formpagamento.cod_empresa
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' where clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' where formpagamento.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    ' and formpagamento.data_venc + empresa.dias_car_juros < current_date ';

  vsql = vsql ||
    ' and formpagamento.tipdoc = ''S1'' and formpagamento.tpdocs <> ''PRE'' and formpagamento.prcss is null ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and formpagamento.cod_empresa = ' || :pcod_empresa;

  vsql = vsql ||
    ' and formpagamento.data_mov >= (current_date - 365) ';

  execute statement
    vsql into :vvalor_chq;

  valor_chq = coalesce(valor_chq, 0) + coalesce(vvalor_chq, 0);

  vsql =
    ' select sum(coalesce(controle_cheque.valor_ch, 0)) soma from controle_cheque
      inner join empresa on empresa.cod_empresa = controle_cheque .codigo_emp
      inner join controles on
        controles.codigo_ctrl = controle_cheque.codigo_ctrl
        and controles.codigo_emp = controle_cheque.codigo_emp
        and trim(coalesce(controles.exibir_doc, ''A'')) in ('''', ''A'', ''L'')
      inner join clientes on
        clientes.cod_cliente = controle_cheque.cod_cliente
        and clientes.cod_empresa = controle_cheque.cod_emp_mult ';

  vsql = vsql ||
    ' where (controle_cheque.status_ch is null or controle_cheque.status_ch = '''') ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and clientes.cpfcgc = ''' || :pcpf_cnpj || ''' ';
  else
    vsql = vsql ||
      ' and controle_cheque.cod_cliente = ' || :pcod_cliente;

  vsql = vsql ||
    ' and controle_cheque.data_venc + empresa.dias_car_juros < current_date ';

  if ((coalesce(vfinanceiro_unificado, 'N') = 'S') and (coalesce(pcpf_cnpj, '') <> '')) then
    vsql = vsql ||
      ' and empresa.codigo_unificadora = ' || :pcod_empresa;
  else
    vsql = vsql ||
      ' and controle_cheque.codigo_emp = ' || :pcod_empresa;

  execute statement
    vsql into :vvalor_chq;

  valor_chq = coalesce(valor_chq, 0) + coalesce(vvalor_chq, 0);

  suspend;
end;
|/BLOCO|