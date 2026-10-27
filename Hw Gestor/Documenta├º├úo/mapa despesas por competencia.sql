CREATE VIEW MAPA_DESP(
    N_CONTA_PLC,
    DESC_PLC,
    VALOR_L,
    DESC_GR,
    TIPO_GR,
    HISTORICO_L,
    DATA,
    GRUP_CT,
    COD_LANC,
    COD_DEP,
    MES_MAPA,
    DESC_P,
    CD_SUBGRUPO,
    DESC_SUBGRUPO,
    ORDEM_SUBGRUPO,
    CODIGO_EMP,
    SIGLA)
AS
select p.n_conta_plc,p.desc_plc,l.valor_l,c.desc_gr,c.tipo_gr,
       l.historico_l,l.dtreferencia,p.grup_ct,l.cod_lanc,c.cod_dep,extract(month from l.dtreferencia),p.desc_padr,p.COD_SUB_CT,sg.DESC_SUB_CT,
       sg.ORDEM_SUB_CT,l.codigo_emp,p.sigla_plc
       from Lancamentos l RIGHT JOIN p_contas p ON l.n_conta_plc = p.n_conta_plc and l.lote is null 
       INNER JOIN GRUPOS_CT c on
       p.grup_ct = c.grup_ct and (c.tipo_gr = 'S' or (c.desc_gr like '%INVEST%')) INNER JOIN SUB_GRUP_CT sg
       on p.COD_SUB_CT = sg.COD_SUB_CT where p.ativo = 1
union
select P.n_conta_plc,p.desc_plc,
       ctr.valor_pago,c.desc_gr,c.tipo_gr,ctr.historico_ctp,
       ctr.dtreferencia,p.grup_ct,ctr.cod_contrp,c.cod_dep,extract(month from ctr.dtreferencia),p.desc_padr,
       p.COD_SUB_CT,sg.DESC_SUB_CT,sg.ORDEM_SUB_CT,ctr.codigo_emp,p.sigla_plc
       from contas_a_pagar ctr RIGHT JOIN p_contas p ON ctr.n_conta_plc = p.n_conta_plc and ctr.lote is not null
       INNER JOIN grupos_ct c ON p.grup_ct = c.grup_ct and 
       (c.tipo_gr = 'S' or (c.desc_gr like '%INVEST%')) INNER JOIN SUB_GRUP_CT sg 
       on p.COD_SUB_CT = sg.COD_SUB_CT where p.ativo = 1
