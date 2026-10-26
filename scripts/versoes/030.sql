ALTER TABLE P_CONTAS ADD COD_CONTA_REL INTEGER;

CREATE SEQUENCE INC_TIPO_CONTA;

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG148', :COD_EMPRESA, 'ABRIR TELA DE CADASTRO TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG149', :COD_EMPRESA, 'BT PESQUISAR TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG150', :COD_EMPRESA, 'BT NOVO TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG151', :COD_EMPRESA, 'BT ALTERAR TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG152', :COD_EMPRESA, 'BT ENVIAR TIPO CONTA PARA LIXEIRA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG153', :COD_EMPRESA, 'BT REMOVER PERMANENTEMENTE TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG154', :COD_EMPRESA, 'BT RESTAURAR DA LIXEIRA TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG155', :COD_EMPRESA, 'BT SALVAR TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG156', :COD_EMPRESA, 'BT ABRIR LIXEIRA TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG157', :COD_EMPRESA, 'ABRIR TELA DEFINIR TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CXG158', :COD_EMPRESA, 'BT DEFINIR TIPO CONTA', 10, 'FRMPLANOCONTAREL', 1, 'N', 'S', CURRENT_DATE);

insert into menus_auto_sistema (cod_aplicativo, nome_menu, status_menu, enable_menu, desc_menu, ativo) select cod_aplicativo, 'TipoPlanoDeContas' as nome_menu, status_menu, enable_menu, desc_menu, ativo from menus_auto_sistema  where nome_menu = 'PlanoDeContas'  and (select count(*) from menus_auto_sistema where nome_menu = 'TipoPlanoDeContas') = 0;

|BLOCO|
CREATE TABLE P_CONTAS_REL (
    CODIGO     INTEGER NOT NULL,
    NATUREZA   CHAR(1) NOT NULL,
    DESCRICAO  VARCHAR(100),
	PADRAO	   CHAR(1),
    ATIVO      INTEGER DEFAULT 1
);
|/BLOCO|

ALTER TABLE P_CONTAS_REL ADD CONSTRAINT PK_P_CONTAS_REL PRIMARY KEY (CODIGO);

INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (1, 'E', 'EMPRESTIMO', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (2, 'E', 'TRANSFERENCIA', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (3, 'E', 'OUTROS ENTRADAS', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (4, 'E', 'CORRECAO DE SALDO', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (5, 'E', 'APORTE', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (6, 'S', 'DESPESA', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (7, 'S', 'FORNECEDOR', 'S', 1); 
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (8, 'S', 'IMPOSTOS', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (9, 'S', 'FOLHA DE PAGAMENTO', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (10, 'S', 'OUTRAS SAIDAS', 'S', 1);
INSERT INTO P_CONTAS_REL (CODIGO, NATUREZA, DESCRICAO, PADRAO, ATIVO) VALUES (11, 'S', 'CORRECAO DE SALDO', 'S', 1);

ALTER SEQUENCE INC_TIPO_CONTA RESTART WITH 11;

UPDATE P_CONTAS SET COD_CONTA_REL = NULL;
UPDATE P_CONTAS SET COD_CONTA_REL = 1  WHERE TIPO_PLC = 'E' AND TIPO_CTP = 'E';
UPDATE P_CONTAS SET COD_CONTA_REL = 2  WHERE TIPO_PLC = 'E' AND TIPO_CTP = 'T';
UPDATE P_CONTAS SET COD_CONTA_REL = 3  WHERE TIPO_PLC = 'E' AND TIPO_CTP = 'O';
UPDATE P_CONTAS SET COD_CONTA_REL = 4  WHERE TIPO_PLC = 'E' AND TIPO_CTP = 'Z';

UPDATE P_CONTAS SET COD_CONTA_REL = 10 WHERE TIPO_PLC = 'S' AND TIPO_CTP = 'O';
UPDATE P_CONTAS SET COD_CONTA_REL = 11 WHERE TIPO_PLC = 'S' AND TIPO_CTP = 'Z'; 

|BLOCO|CMD:INATIVO|
CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS;  
|/BLOCO|

|BLOCO|CMD:INATIVO|
CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS;
|/BLOCO|

insert into menus_auto_sistema (cod_aplicativo, nome_menu, status_menu, enable_menu, desc_menu, ativo)  select cod_aplicativo, 'GruposResumoFinanceiro' as nome_menu, status_menu, enable_menu, desc_menu, ativo from menus_auto_sistema where nome_menu = 'PlanoDeContas'  and (select count(*) from menus_auto_sistema where nome_menu = 'GruposResumoFinanceiro') = 0;

delete from menus_auto_sistema where nome_menu = 'TipoPlanoDeContas';

|BLOCO|
CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS(
    TPDTQUIT_DTREF,
    E_S,
    COD_LANC,
    LOTE,
    COD_EMPRESA,
    COD_EMP_MULT,
    N_CONTA_PLC,
    DESC_PLC,
    DESC_REL,
    COD_CONTRLE,
    NOME_CTRL,
    DOCS,
    DATA,
    VALOR,
    HISTORICO,
    TIPO_CTP)
AS
-- VIEW EXIBE OS LANCAMENTOS AVULSOS REALIZADOS
-- RELATORIO "RESUMO FINANCEIRO" EXIBIDO NO GRUPO ENTRADAS/SAIDAS DIVERSAS
    select 1, lanc.tipo_l, lanc.cod_lanc,
    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else (case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lote_ent end) end),
    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    lanc.data, lanc.valor_l, lanc.historico_l, plano.tipo_ctp from lancamentos lanc
    inner join p_contas plano on plano.n_conta_plc = lanc.n_conta_plc
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct
    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctrl and lanc.codigo_emp = ctr.codigo_emp
    where lanc.tipo_l = 'E'
    and rel.descricao <> 'CORRECAO DE SALDO' -- and plano.tipo_ctp in ('E', 'T', 'O')
    and ctr.docs = 'N'
    and (select count(*) from baixa_creditos bx where bx.lote_quit = lanc.lote_ent and bx.codigo_emp = lanc.codigo_emp/* and bx.datq_c = lanc.data*/) = 0
    and (select count(*) from controle_creditos cc where cc.lote_quit = lanc.lote_ent and cc.codigo_emp = lanc.codigo_emp/* and cc.datq_c = lanc.data*/) = 0
    and (select count(*) from controle_cheque ch where ch.lote_quit = lanc.lote_ent and ch.codigo_emp = lanc.codigo_emp/* and ch.datq_ch = lanc.data*/) = 0

    union

    select 2, lanc.tipo_l, lanc.cod_lanc,
    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else (case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lote_ent end) end),
    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    lanc.dtreferencia, lanc.valor_l, lanc.historico_l, plano.tipo_ctp from lancamentos lanc
    inner join p_contas plano on plano.n_conta_plc = lanc.n_conta_plc
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct
    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctrl and lanc.codigo_emp = ctr.codigo_emp
    where lanc.tipo_l = 'E'
    and rel.descricao <> 'CORRECAO DE SALDO' -- and plano.tipo_ctp in ('E', 'T', 'O')
    and ctr.docs = 'N'
    and (select count(*) from baixa_creditos bx where bx.lote_quit = lanc.lote_ent and bx.codigo_emp = lanc.codigo_emp/* and bx.datq_c = lanc.data*/) = 0
    and (select count(*) from controle_creditos cc where cc.lote_quit = lanc.lote_ent and cc.codigo_emp = lanc.codigo_emp/* and cc.datq_c = lanc.data*/) = 0
    and (select count(*) from controle_cheque ch where ch.lote_quit = lanc.lote_ent and ch.codigo_emp = lanc.codigo_emp/* and ch.datq_ch = lanc.data*/) = 0

    union

    select 1, lanc.tipo_l, lanc.cod_lanc,
    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else (case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lote_ent end) end),
    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    lanc.data, (- lanc.valor_l) valor_l, lanc.historico_l, plano.tipo_ctp from lancamentos lanc
    left join empresa emp on lanc.codigo_emp = emp.cod_empresa
    inner join p_contas plano on plano.n_conta_plc = lanc.n_conta_plc
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coalesce(c.tipo_gr, '') <> 'S'
    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctrl and lanc.codigo_emp = ctr.codigo_emp
    where lanc.tipo_l = 'S'
    and rel.descricao <> 'CORRECAO DE SALDO' -- and plano.tipo_ctp in ('O')
    and ctr.docs = 'N'
    and (select count(*) from formpagamento fp
        left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao and cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = 'LCS'
        inner join p_contas p on p.n_conta_plc = lanc.n_conta_plc
        inner join grupos_ct c on p.grup_ct = c.grup_ct
        left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and fp.cod_empresa = ctr.codigo_emp
        where fp.n_processamento = lanc.cod_lanc
        and fp.cod_empresa = (case when(emp.financeiro_unificado = 'S') then lanc.cod_emp_mult else lanc.codigo_emp end)
        and coalesce(p.tipo_ctp, '') <> 'F' and c.tipo_gr <> 'S'
        and cxl.tipo_lanc_cxl = 'S' and cxl.refrecibo = 'S') = 0

    and lanc.lote is null

    union

    select 2, lanc.tipo_l, lanc.cod_lanc,
    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else (case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lote_ent end) end),
    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    lanc.dtreferencia, (- lanc.valor_l) valor_l, lanc.historico_l, plano.tipo_ctp from lancamentos lanc
    left join empresa emp on lanc.codigo_emp = emp.cod_empresa
    inner join p_contas plano on plano.n_conta_plc = lanc.n_conta_plc
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coalesce(c.tipo_gr, '') <> 'S'
    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctrl and lanc.codigo_emp = ctr.codigo_emp
    where lanc.tipo_l = 'S'
    and rel.descricao <> 'CORRECAO DE SALDO' -- and plano.tipo_ctp in ('O')
    and ctr.docs = 'N'
    and (select count(*) from formpagamento fp
        left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao and cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = 'LCS'
        inner join p_contas p on p.n_conta_plc = lanc.n_conta_plc
        inner join grupos_ct c on p.grup_ct = c.grup_ct
        left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and fp.cod_empresa = ctr.codigo_emp
        where fp.n_processamento = lanc.cod_lanc
        and fp.cod_empresa = (case when(emp.financeiro_unificado = 'S') then lanc.cod_emp_mult else lanc.codigo_emp end)
        and coalesce(p.tipo_ctp, '') <> 'F' and c.tipo_gr <> 'S'
        and cxl.tipo_lanc_cxl = 'S' and cxl.refrecibo = 'S') = 0

    and lanc.lote is null

    union

    select 1, 'S',
    coalesce((select first 1 lanc.cod_lanc from lancamentos lanc where lanc.lote = ctp.lote and lanc.codigo_emp = ctp.codigo_emp), 0) cod_lanc,
    ctp.lote,
    ctp.codigo_emp, ctp.cod_emp_mult, ctp.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    ctp.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    ctp.datq_ctp, (- ctp.valor_ctp) valor_ctp,
    trim(coalesce(ctp.historico_ctp, '')) || ' - ' || trim(coalesce(ctp.nome_for_ctp, '')),
    plano.tipo_ctp from p_contas plano
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coalesce(c.tipo_gr, '') <> 'S'
    left join sub_grup_ct s on plano.cod_sub_ct = s.cod_sub_ct
    inner join contas_a_pagar ctp on plano.n_conta_plc = ctp.n_conta_plc
    inner join controles ctr on ctp.codigo_ctrl = ctr.codigo_ctrl and ctp.codigo_emp = ctr.codigo_emp
    where rel.descricao <> 'CORRECAO DE SALDO' -- plano.tipo_ctp in ('O')
    and ctp.lote is not null

    union

    select 2, 'S',
    coalesce((select first 1 lanc.cod_lanc from lancamentos lanc where lanc.lote = ctp.lote and lanc.codigo_emp = ctp.codigo_emp), 0) cod_lanc,
    ctp.lote,
    ctp.codigo_emp, ctp.cod_emp_mult, ctp.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    ctp.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    ctp.dtreferencia, (- ctp.valor_ctp) valor_ctp,
    trim(coalesce(ctp.historico_ctp, '')) || ' - ' || trim(coalesce(ctp.nome_for_ctp, '')), plano.tipo_ctp from p_contas plano
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coalesce(c.tipo_gr, '') <> 'S'
    left join sub_grup_ct s on plano.cod_sub_ct = s.cod_sub_ct
    inner join contas_a_pagar ctp on plano.n_conta_plc = ctp.n_conta_plc
    inner join controles ctr on ctp.codigo_ctrl = ctr.codigo_ctrl and ctp.codigo_emp = ctr.codigo_emp
    where rel.descricao <> 'CORRECAO DE SALDO' -- plano.tipo_ctp in ('O')
    and ctp.lote is not null

    union

    -- CORRECAO SALDO
    select 1, lanc.tipo_l, lanc.cod_lanc,
    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else (case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lote_ent end) end),
    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    lanc.data, case when (lanc.tipo_l = 'S') then (- lanc.valor_l) else lanc.valor_l end, lanc.historico_l,
    plano.tipo_ctp from lancamentos lanc
    inner join p_contas plano on plano.n_conta_plc = lanc.n_conta_plc
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct 
    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctrl and lanc.codigo_emp = ctr.codigo_emp
    where lanc.tipo_l = 'E'
    and rel.descricao = 'CORRECAO DE SALDO' -- and plano.tipo_ctp in ('Z')
    and (select count(*) from baixa_creditos bx where bx.lote_quit = lanc.lote_ent and bx.codigo_emp = lanc.codigo_emp/* and bx.datq_c = lanc.data*/) = 0
    and (select count(*) from controle_creditos cc where cc.lote_quit = lanc.lote_ent and cc.codigo_emp = lanc.codigo_emp/* and cc.datq_c = lanc.data*/) = 0
    and (select count(*) from controle_cheque ch where ch.lote_quit = lanc.lote_ent and ch.codigo_emp = lanc.codigo_emp/* and ch.datq_ch = lanc.data*/) = 0

    union

    select 2, lanc.tipo_l, lanc.cod_lanc,
    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else (case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lote_ent end) end),
    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    lanc.dtreferencia, case when (lanc.tipo_l = 'S') then (- lanc.valor_l) else lanc.valor_l end, lanc.historico_l,
    plano.tipo_ctp from lancamentos lanc
    inner join p_contas plano on plano.n_conta_plc = lanc.n_conta_plc
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct 
    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctrl and lanc.codigo_emp = ctr.codigo_emp
    where lanc.tipo_l = 'E'
    and rel.descricao = 'CORRECAO DE SALDO' -- and plano.tipo_ctp in ('Z')
    and (select count(*) from baixa_creditos bx where bx.lote_quit = lanc.lote_ent and bx.codigo_emp = lanc.codigo_emp/* and bx.datq_c = lanc.data*/) = 0
    and (select count(*) from controle_creditos cc where cc.lote_quit = lanc.lote_ent and cc.codigo_emp = lanc.codigo_emp/* and cc.datq_c = lanc.data*/) = 0
    and (select count(*) from controle_cheque ch where ch.lote_quit = lanc.lote_ent and ch.codigo_emp = lanc.codigo_emp/* and ch.datq_ch = lanc.data*/) = 0

    union

    select 1, lanc.tipo_l, lanc.cod_lanc,
    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else (case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lote_ent end) end),
    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    lanc.data, case when (lanc.tipo_l = 'S') then (- lanc.valor_l) else lanc.valor_l end, lanc.historico_l,
    plano.tipo_ctp from lancamentos lanc
    left join empresa emp on lanc.codigo_emp = emp.cod_empresa
    inner join p_contas plano on plano.n_conta_plc = lanc.n_conta_plc
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coalesce(c.tipo_gr, '') <> 'S'
    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctrl and lanc.codigo_emp = ctr.codigo_emp
    where lanc.tipo_l = 'S'
    and rel.descricao = 'CORRECAO DE SALDO' -- and plano.tipo_ctp in ('Z')
    and (select count(*) from formpagamento fp
        left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao and cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = 'LCS'
        inner join p_contas p on p.n_conta_plc = lanc.n_conta_plc
        inner join grupos_ct c on p.grup_ct = c.grup_ct
        left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and fp.cod_empresa = ctr.codigo_emp
        where fp.n_processamento = lanc.cod_lanc
        and fp.cod_empresa = (case when(emp.financeiro_unificado = 'S') then lanc.cod_emp_mult else lanc.codigo_emp end)
        and coalesce(p.tipo_ctp, '') <> 'F' and c.tipo_gr <> 'S'
        and cxl.tipo_lanc_cxl = 'S' and cxl.refrecibo = 'S') = 0

    union

    select 2, lanc.tipo_l, lanc.cod_lanc,
    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else (case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lote_ent end) end),
    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc, plano.desc_plc, rel.descricao desc_rel,
    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,
    lanc.dtreferencia, case when (lanc.tipo_l = 'S') then (- lanc.valor_l) else lanc.valor_l end, lanc.historico_l,
    plano.tipo_ctp from lancamentos lanc
    left join empresa emp on lanc.codigo_emp = emp.cod_empresa
    inner join p_contas plano on plano.n_conta_plc = lanc.n_conta_plc
    inner join p_contas_rel rel on rel.codigo = plano.cod_conta_rel
    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coalesce(c.tipo_gr, '') <> 'S'
    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctrl and lanc.codigo_emp = ctr.codigo_emp
    where lanc.tipo_l = 'S'
    and rel.descricao = 'CORRECAO DE SALDO' -- and plano.tipo_ctp in ('Z')
    and (select count(*) from formpagamento fp
        left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao and cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = 'LCS'
        inner join p_contas p on p.n_conta_plc = lanc.n_conta_plc
        inner join grupos_ct c on p.grup_ct = c.grup_ct
        left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl and fp.cod_empresa = ctr.codigo_emp
        where fp.n_processamento = lanc.cod_lanc
        and fp.cod_empresa = (case when(emp.financeiro_unificado = 'S') then lanc.cod_emp_mult else lanc.codigo_emp end)
        and coalesce(p.tipo_ctp, '') <> 'F' and c.tipo_gr <> 'S'
        and cxl.tipo_lanc_cxl = 'S' and cxl.refrecibo = 'S') = 0;
|/BLOCO|

delete from config_colunas where componente = 'CdsTransportador';

UPDATE GERADOR_OSBOL SET UTILIZA_CXL = 'N' WHERE UTILIZA_CXL IS NULL;
UPDATE GERADOR_OSBOL SET GERAR_BOLETO = 'N' WHERE GERAR_BOLETO IS NULL;
UPDATE GERADOR_OSBOL SET AGRUPAR_CONTR = 'N' WHERE AGRUPAR_CONTR IS NULL;
UPDATE GERADOR_OSBOL SET DESCONS_CTRL = 'N' WHERE DESCONS_CTRL IS NULL;
UPDATE GERADOR_OSBOL SET GERAR_BOLETO_PROD_SERV = 'N' WHERE GERAR_BOLETO_PROD_SERV IS NULL;

delete from config_colunas where componente = 'cdsLancFP';

|BLOCO|
CREATE TABLE EST_MIN_PROD (
    GRUPO_PROD   INTEGER NOT NULL,
    COD_PROD     CHAR(6) NOT NULL,
    COD_EMPRESA  INTEGER NOT NULL,
    DATA         TIMESTAMP NOT NULL
);
|/BLOCO|

ALTER TABLE EST_MIN_PROD ADD CONSTRAINT PK_EST_MIN_PROD PRIMARY KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA, DATA);

ALTER TABLE EST_MIN_PROD ADD CONSTRAINT FK_EST_MIN_PROD_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCADE;

|BLOCO|
CREATE OR ALTER VIEW VW_ESTOQUE_PROD(
    GRUPO_PROD,
    COD_PROD,
    COD_EMPRESA,
    DISPONIVEL)
AS
select produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, est.estoque from produtos
left join getestoquedisponivel (produtos.grupo_prod, produtos.cod_prod, 0, produtos.cod_empresa, 0, '', 0, 0) est on 1 = 1;
|/BLOCO|


insert into menus_auto_sistema (cod_aplicativo, nome_menu, status_menu, enable_menu, desc_menu, ativo) select cod_aplicativo, 'Relatoriodeprodutoscomestoqueminimopordata' as nome_menu, status_menu, enable_menu, desc_menu, ativo from menus_auto_sistema where nome_menu = 'Relatoriodeprodutoscorrigidosporbalancodiario' and (select count(*) from menus_auto_sistema where nome_menu = 'Relatoriodeprodutoscomestoqueminimopordata') = 0;

delete from config_colunas where componente = 'CdsProdutos';

|BLOCO|
create or alter procedure GETESTOQUEDISPONIVEL (
    PGRUPOPROD integer,
    PCODPROD char(6),
    PCODGRADE integer,
    PCODEMPRESA integer,
    PNUMVENDA integer,
    PTIPOVENDA varchar(5),
    PCODPEDALMOX integer,
    PNITEMPEDALMOX integer)
returns (
    ESTOQUE double precision,
    PEND_REQOS double precision,
    PEND_PDC double precision,
    PEND_ALMOX double precision,
    EST_F double precision,
    EST_PRIMA double precision)
as
declare variable VSQL varchar(1000);
declare variable VESTOQUE double precision;
declare variable VPENDENCIA double precision;
declare variable VABATERITENS char(1);
declare variable VUSAR_PRODUCAO_TIPO char(1);
declare variable VCOD_VENDEDOR integer;
declare variable VUSARCONFERENCIAPRODUTO char(1);
declare variable VCRIAR_PRODUCAO_AUT char(1);
begin     

  if ((pgrupoprod is null) or (pcodprod is null) or (pcodempresa is null)) then
   exit;

  vSql = '';
  select abater_itens from empresa where cod_empresa = :pcodempresa into: vabateritens;

  select usar_producao_tipo from empresa where cod_empresa = :pcodempresa into :vusar_producao_tipo;

  select criar_producao_aut from produtos where grupo_prod = :pgrupoprod and cod_prod = :pcodprod and cod_empresa = :pcodempresa into :vcriar_producao_aut;

  if (coalesce(pcodgrade, 0) <= 0) then
  begin
    select est_f from produtos
    where grupo_prod = :pgrupoprod
    and cod_prod = :pcodprod
    and cod_empresa = :pcodempresa into :vestoque;
  end
  else
  begin
    select qtde from cod_grade_prod
    where grupo_prod = :pgrupoprod
    and cod_prod = :pcodprod
    and cod_grade = :pcodgrade
    and cod_empresa = :pcodempresa into :vestoque;
  end

  est_f = coalesce(vestoque, 0);

  if ((coalesce(vabateritens, '') = 'S') and (coalesce(pnumvenda, 0) > 0) and (Trim(coalesce(ptipovenda, '')) <> '')) then
  begin
    select first 1 coalesce(tv.usar_conferencia_produto, '') as usar_conferencia_produto, pv.cod_vendedor from pedvenda pv
    inner join tipo_vendas tv on tv.tipo = pv.tipo and tv.sigla = pv.tipv
    where pv.nped = :pnumvenda
    and pv.tipo = :ptipovenda
    and pv.cod_empresa = :pcodempresa
    order by tv.cod_tipo into : vusarconferenciaproduto, :vcod_vendedor;

    if (coalesce(vusarconferenciaproduto, '') <> 'S') then
      vSql = vsql || ' inner join tipo_vendas tv on tv.sigla = pd.tipv and tv.tipo = pd.tipo
         and (coalesce(tv.usar_conferencia_produto, '''') <> ''S'')';
  end

  vSql = vSql || ' where pd.ativo = 1 and itpd.grupo_prod = '||:pgrupoprod||' and itpd.cod_prod = '''||:pcodprod||'''
     and pd.cod_empresa = ' || pcodempresa ||'
     and (pd.data_fech is null or pd.data_fech < ''01.01.1899'' ) and (itpd.status<>''CANCELADO'' or itpd.status is null)
     and pd.tipo <> ''ORC'' ';

  if ((coalesce(vabateritens, '') = 'S') and (coalesce(pnumvenda, 0) > 0)
    and (Trim(ptipovenda) <> '') and (Trim(vusarconferenciaproduto) <> 'S')) then
    vSql = vSql || ' and pd.cod_vendedor = '|| :vcod_vendedor;

  if (coalesce(pcodgrade, 0) > 0) then
    vSql = vSql || ' and itpd.cod_grade = '|| :pcodgrade;
             
  if ((coalesce(pnumvenda, 0) > 0) and (coalesce(ptipovenda, '') <> '')) then
    vSql = vSql || ' and pd.nped = '|| :pnumvenda || ' and pd.tipo = ''' || :ptipovenda || ''' ';

  execute statement
    ' select sum(itpd.quant_ped_item) as pendecia from pedvenda pd
    inner join pedvenda_prod itpd on pd.nped = itpd.nped and pd.cod_empresa = itpd.cod_empresa and pd.tipo = itpd.tipo
    ' || vSql into :vpendencia;

  pend_reqos = coalesce(vpendencia, 0);

  vestoque = coalesce(vestoque, 0) - coalesce(vpendencia, 0);

  vsql = '';
  if (coalesce(pcodgrade, 0) > 0) then
    vSql = vSql || ' and pi.cod_grade = '||:pcodgrade;

  if (Trim(coalesce(ptipovenda, '')) = 'PRODUCAO') then
    vSql = vSql || ' and pd.cod_producao <> '|| :pnumvenda;

  execute statement 'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as pendecia from producao pd, producao_item_indice pi
                    where pi.grupo_prod = ' || :pgrupoprod ||
                    ' and pi.cod_prod = ''' || :pcodprod || '''
                    and pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa
                    and (pd.data_fechamento is null) and pd.cod_empresa = ' || :pcodempresa || vsql into :vpendencia;

  pend_pdc = coalesce(vpendencia, 0);

  vestoque = coalesce(vestoque, 0) - coalesce(vpendencia, 0);

  vSql = '';
  if (coalesce(pcodgrade, 0) > 0) then
      vSql = vSql || ' and c.cod_grade = '||:pcodgrade;

  execute statement
    ' select sum(coalesce(c.quant,0)) as pendecia from controle_almoxarifado c
      where not(c.cod_pedido = '||:pcodpedalmox||' and c.nitem = '||:pnitempedalmox||')'||'
      and c.grupo_prod = '|| :pgrupoprod ||' and c.cod_prod = '''||:pcodprod||'''
      and c.cod_empresa = '||:pcodempresa|| vsql into :vpendencia;

  pend_almox = coalesce(vpendencia, 0);

  vestoque = coalesce(vestoque, 0) - coalesce(vpendencia, 0);

  if ((coalesce(vcriar_producao_aut, 'N') = 'S') and (coalesce(vusar_producao_tipo, 'N') = 'S')) then
  begin
    vSql = '';
    if (coalesce(pcodgrade, 0) > 0) then
      vSql = :pcodgrade;
    else
      vSql = '0';
    
    execute statement
      ' select estoque from getestoque_recursivo (
          ' || :pgrupoprod || ',
          ''' || :pcodprod || ''', '
          || :pcodempresa || ', '
          || :vSql || ') ' into :vpendencia;
    
    est_prima = coalesce(vpendencia, 0);
  end

  estoque   = COALESCE(vestoque, 0);
  est_f     = COALESCE(est_f, 0);
  est_prima = COALESCE(est_prima, 0);
  suspend;
end;
|/BLOCO|

delete from config_colunas where componente = 'cdsRecibo';

delete from config_colunas where componente = 'cdsTipoCliente';

delete from config_colunas where componente = 'cdsFuncao';

delete from config_colunas where componente = 'cdsFaturamento';

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('ITEC008', :COD_EMPRESA, 'BT UTILIZAR MATERIA PRIMA OUTRO PROD', 10, '', 1, 'N', 'S', CURRENT_DATE);

update config_sistema cs set cs.ativo = 0 where cs.chave = 'ped_vnd_exibir_devolucao' and cs.cod_empresa = :cod_empresa;

update config_sistema cs set cs.ativo = 0 where cs.chave = 'ped_vnd_exibir_form_pag' and cs.cod_empresa = :cod_empresa;

update config_sistema cs set cs.ativo = 0 where cs.chave = 'ped_vnd_exibir_unidade' and cs.cod_empresa = :cod_empresa;

update config_sistema cs set cs.ativo = 0 where cs.chave = 'ped_vnd_imprimir_usuario_que_fechou' and cs.cod_empresa = :cod_empresa;

update config_sistema cs set cs.ativo = 0 where cs.chave = 'ped_vnd_imprimir_desc_acresc_item' and cs.cod_empresa = :cod_empresa;

update config_sistema cs set cs.type1_ = 'blob' where cs.chave = 'ped_vnd_impressao_dav';

update config_sistema cs set cs.type1_ = 'blob' where cs.chave = 'ped_vnd_impressao_dav_v1';

update config_sistema cs set cs.type1_ = 'blob' where cs.chave = 'ped_vnd_impressao_dav_v2';

update config_sistema cs set cs.type1_ = 'blob' where cs.chave = 'ped_vnd_impressao_dav_v3';

update config_sistema cs set cs.type1_ = 'blob' where cs.chave = 'ped_vnd_impressao_dav_v4';

update config_sistema cs set cs.type1_ = 'blob' where cs.chave = 'ped_vnd_impressao_dav_v5';

update config_sistema cs set cs.type1_ = 'blob' where cs.chave = 'ped_vnd_impressao_dav_v6';

update config_sistema cs set cs.type1_ = 'blob' where cs.chave = 'ped_vnd_impressao_dav_v7';

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('CAR113', :COD_EMPRESA, 'DESMARCAR RECEBENDO COM OUTRO USUARIO JA RECEBENDO', 10, '.', 1, 'S', 'S', CURRENT_DATE);

ALTER TABLE CONTAS_A_PAGAR ADD DATA_DESM TIMESTAMP;

ALTER TABLE CONTAS_A_PAGAR ADD OP_DESM INTEGER;

ALTER TABLE CONTROLE_CHEQUE ADD DATA_DESM TIMESTAMP;

ALTER TABLE CONTROLE_CHEQUE ADD OP_DESM INTEGER;

ALTER TABLE CONTROLE_CREDITOS ADD DATA_DESM TIMESTAMP;

ALTER TABLE CONTROLE_CREDITOS ADD OP_DESM INTEGER;

delete from config_colunas where componente = 'cdsCtrlCh';

delete from config_colunas where componente = 'cdsCtrlCr';

delete from config_colunas where componente = 'CdsPClientes';

ALTER TABLE CONFIG_API ADD PESO_POPULARIDADE INTEGER;

ALTER TABLE CONFIG_API ADD PESO_NIVEL_GIRO_MEDIO INTEGER;

ALTER TABLE CONFIG_API ADD PESO_DEMANDA INTEGER;

ALTER TABLE CONFIG_API ADD PESO_FREQUENCIA INTEGER;

ALTER TABLE CONFIG_API ADD PESO_PRECO INTEGER;

ALTER TABLE CONFIG_API ADD GIRO_PADRAO_BAIXO_INI T_N_GERAL;

ALTER TABLE CONFIG_API ADD GIRO_PADRAO_BAIXO_FIM T_N_GERAL;

ALTER TABLE CONFIG_API ADD GIRO_PADRAO_MEDIO_INI T_N_GERAL;

ALTER TABLE CONFIG_API ADD GIRO_PADRAO_MEDIO_FIM T_N_GERAL;

ALTER TABLE CONFIG_API ADD GIRO_PADRAO_ALTO_INI T_N_GERAL;

ALTER TABLE CONFIG_API ADD GIRO_PADRAO_ALTO_FIM T_N_GERAL;

delete from config_colunas where componente = 'cdsConfigAPI';

ALTER TABLE EMPDESVOLV ADD COD_EMP_HWCLOUD INTEGER;

ALTER TABLE EMPDESVOLV ADD DADOS_HWCLOUD VARCHAR(100);

ALTER TABLE CONFIG_API ADD UTIL_RECOMENDACAO CHAR(1);

ALTER TABLE CONFIG_API ADD INTERV_TREINO_RECOMENDA INTEGER;

ALTER TABLE CONFIG_API ADD DIAS_VND_RECOMENDA INTEGER;

ALTER TABLE CONFIG_API ADD INFO_CONTATO BLOB SUB_TYPE 1 SEGMENT SIZE 80;

delete from config_colunas where componente = 'cdsConfigAPI';

ALTER TABLE CONFIG_API ADD DATA_CAD TIMESTAMP;

ALTER TABLE CONFIG_API ADD DATA_MOD TIMESTAMP;

delete from config_colunas where componente = 'cdsConfigAPI';

|BLOCO|
create or alter procedure RETORNA_QTDE_DEV_ITEM (
  PNDOC integer,
  PTIPO char(3),
  PCOD_EMPRESA integer,
  PGRUPO_PROD integer,
  PCOD_PROD char(6),
  PCOD_GRADE integer,
  PNITEM integer)
returns (
  RESULT double precision)
as
declare variable VNITEM integer;
declare variable VCODIGO_NOP double precision;
declare variable VQUANT_PED_ITEM double precision;
declare variable VQUANT_DEV_REST double precision;
declare variable VQUANT_DEV_TOT double precision;
begin
  /* Procedure Text */
  result = 0;

  execute statement
  ' select sum(coalesce(d.quant, 0)) quantidade from devolucao d
    where d.cod_venda = ' || :pndoc || '
    and d.tipo_venda = ''' || :ptipo || '''
    and d.grupo_prod = ' || :pgrupo_prod || '
    and d.cod_prod = ''' || :pcod_prod || '''
    and d.cod_grade = ' || :pcod_grade || '
    and d.cod_empresa = ' || :pcod_empresa
    into :vquant_dev_tot;

  vquant_dev_rest = coalesce(vquant_dev_tot, 0);

  for execute statement
  ' select
    pp.nitem,
    pp.codigo_nop,
    coalesce(pp.quant_ped_item, 0) quant_ped_item from pedvenda_prod pp
    where pp.nped = ' || :pndoc || '
    and pp.tipo = ''' || :ptipo || '''
    and pp.grupo_prod = ' || :pgrupo_prod || '
    and pp.cod_prod = ''' || :pcod_prod || '''
    and pp.cod_grade = ' || :pcod_grade || '
    and pp.cod_empresa = ' || :pcod_empresa || '
    and (pp.status<>''CANCELADO'' or pp.status is null)
    order by pp.nped, pp.tipo, pp.grupo_prod, pp.cod_prod, pp.nitem, pp.cod_empresa, pp.cod_grade, pp.codigo_nop '
      into :vnitem, :vcodigo_nop, :vquant_ped_item do
  begin
    if (pnitem = vnitem) then
    begin
      if ((coalesce(vquant_dev_rest, 0) > 0) and (coalesce(vquant_dev_rest, 0) > coalesce(vquant_ped_item, 0))) then
        result = coalesce(vquant_ped_item, 0);
      else if ((coalesce(vquant_dev_rest, 0) > 0) and (coalesce(vquant_dev_rest, 0) <= coalesce(vquant_ped_item, 0))) then
        result = coalesce(vquant_dev_rest, 0);
      else
        result = 0;
      break;
    end

    if ((coalesce(vquant_dev_rest, 0) > 0) and (coalesce(vquant_dev_rest, 0) > coalesce(vquant_ped_item, 0))) then
      vquant_dev_rest = vquant_dev_rest - vquant_ped_item;
    else if ((coalesce(vquant_dev_rest, 0) > 0) and (coalesce(vquant_dev_rest, 0) <= coalesce(vquant_ped_item, 0))) then
      vquant_dev_rest = vquant_dev_rest - vquant_ped_item;
    else
      vquant_dev_rest = 0;
  end

  result = coalesce(result, 0);
  suspend;
end;
|/BLOCO|

|BLOCO|
CREATE TABLE PLATAFORMA_MSG (
    CODIGO     		 VARCHAR(20) NOT NULL,
    DESCRICAO  		 VARCHAR(50),
	TESTAR_EMAIL     CHAR(1) DEFAULT 'N',
    TESTAR_CELULAR   CHAR(1) DEFAULT 'N',
	ATIVO			 INTEGER DEFAULT 1
);
|/BLOCO|

ALTER TABLE PLATAFORMA_MSG ADD CONSTRAINT PK_PLATAFORMA_MSG PRIMARY KEY (CODIGO);

|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, DESCRICAO, TESTAR_EMAIL, TESTAR_CELULAR, ATIVO) VALUES ('telegram', 'TELEGRAM', 'N', 'N', 1);
|/BLOCO|
|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, DESCRICAO, TESTAR_EMAIL, TESTAR_CELULAR, ATIVO) VALUES ('email_n8n', 'E-MAIL', 'S', 'N', 1);
|/BLOCO|
|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, DESCRICAO, TESTAR_EMAIL, TESTAR_CELULAR, ATIVO) VALUES ('whats_meta', 'WHATSAPP', 'N', 'S', 1);
|/BLOCO|

ALTER TABLE CONFIG_API ADD PLATAFORMA_EMAIL VARCHAR(20);
ALTER TABLE CONFIG_API ADD PLATAFORMA_WHATSAPP VARCHAR(20);
ALTER TABLE CONFIG_API ADD PLATAFORMA_TELEGRAM VARCHAR(20);

delete from config_colunas where componente = 'cdsConfigAPI';

CMD:COMMIT|DELETE FROM PLATAFORMA_MSG;

CMD:COMMIT|ALTER TABLE PLATAFORMA_MSG DROP CONSTRAINT PK_PLATAFORMA_MSG;

|BLOCO|CMD:INATIVO|
DROP TABLE PLATAFORMA_MSG;
|/BLOCO|

|BLOCO|CMD:INATIVO|
CREATE TABLE PLATAFORMA_MSG (
    CODIGO          INTEGER NOT NULL,
    TIPO            VARCHAR(18),
    DESCRICAO       VARCHAR(50),
    TESTAR_EMAIL    CHAR(1) DEFAULT 'N',
    TESTAR_CELULAR  CHAR(1) DEFAULT 'N',
    ATIVO           INTEGER DEFAULT 1
);
|/BLOCO|

|BLOCO|CMD:INATIVO|
ALTER TABLE PLATAFORMA_MSG ADD CONSTRAINT PK_PLATAFORMA_MSG PRIMARY KEY (CODIGO);
|/BLOCO|

|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, TIPO, DESCRICAO, TESTAR_EMAIL, TESTAR_CELULAR, ATIVO) VALUES (1, 'email_n8n', 'E-MAIL', 'S', 'N', 1);
|/BLOCO|
|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, TIPO, DESCRICAO, TESTAR_EMAIL, TESTAR_CELULAR, ATIVO) VALUES (2, 'whats_meta', 'WHATSAPP', 'N', 'S', 1);
|/BLOCO|
|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, TIPO, DESCRICAO, TESTAR_EMAIL, TESTAR_CELULAR, ATIVO) VALUES (3, 'telegram', 'TELEGRAM', 'N', 'N', 1);
|/BLOCO|

|BLOCO|
update RDB$FIELDS set RDB$FIELD_TYPE = 8, RDB$FIELD_LENGTH = 4, RDB$CHARACTER_LENGTH = NULL, RDB$CHARACTER_SET_ID = NULL where RDB$FIELD_NAME = (select rdb$field_source from rdb$relation_fields where rdb$relation_name = 'PLATAFORMA_MSG' and rdb$field_name = 'CODIGO');
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG ADD COD_EMPRESA INTEGER NOT NULL;
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG ADD TIPO VARCHAR(18) NOT NULL; 
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG ADD COD_PLATAFORMA_PARC VARCHAR(50);
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG ADD CONSTRAINT PK_PLATAFORMA_MSG PRIMARY KEY (CODIGO, COD_EMPRESA);
|/BLOCO|

|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, COD_EMPRESA, TIPO, ATIVO) VALUES (1, :COD_EMPRESA, 'email_n8n', 1);
|/BLOCO|

|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, COD_EMPRESA, TIPO, ATIVO) VALUES (2, :COD_EMPRESA, 'whats_meta', 1);
|/BLOCO|

|BLOCO|CMD:INATIVO|
INSERT INTO PLATAFORMA_MSG (CODIGO, COD_EMPRESA, TIPO, ATIVO) VALUES (3, :COD_EMPRESA, 'telegram', 1);
|/BLOCO|

|BLOCO|
CREATE OR ALTER VIEW PAGAMENTOS(
    COD_EMPRESA,
    COD_EMP_ORIG,
    COD_EMP_MULT,
    COD_CLIENTE,
    NOME_CLIENTE,
    CPFCGC_CLIENTE,
    TP_REL,
    TP_RECEBIMENTO,
    TP_RECEBIMENTO2,
    ORDEM,
    COD_TIPO,
    TIPO,
    COD_CONTRP,
    NUM_DOC,
    NUM_DOC2,
    DATA_DOC,
    DATA_CONF,
    VALOR_A_RECEBER,
    OBS_CXL,
    LOTEREC,
    OP_CXL,
    COD_US,
    DATA_MOV,
    HISTORICO,
    VALOR_PAGO,
    DATA_VENC,
    TERCEIROS,
    CODIGO_CTRL,
    NOME_CTRL,
    NUM_RECIBO,
    VALOR_RECIBO,
    NCUPOM,
    NUM_NF,
    PARCELA,
    SEQID,
    SEQID2,
    VENDA,
    TIPV,
    TIPO_DOC,
    QTDE_PREST,
    QTDE_PREST_EMP,
    VALOR_PREST_EMP,
    VALOR_PREST_TOT,
    VALOR_PAGO_PROP)
AS
-- VIEW EXIBE OS PAGAMENTOS REALIZADOS
-- RELATORIO "PAGAMENTO FINANCEIRO"
    
    select (case when(emp.financeiro_unificado = 'S') then emp.codigo_unificadora else ctp.codigo_emp end) cod_empresa,
    ctp.codigo_emp,
    ctp.cod_emp_mult,
    coalesce(ctp.cod_forn_nfe, 0) cod_cliente,
    case when (cl.nome_cliente is null) then ctp.nome_for_ctp else ctp.nome_for_ctp end nome_cliente,
    case when (cl.cpfcgc is null) then ctp.cpf_cgc_f else cl.cpfcgc end cpfcgc_cliente,
    'PAGAMENTOS' tp_rel, 'PAGAMENTOS' tp_recebimento, 'DIRETO' tp_recebimento2, 1 ordem,
    case when (ctr1.codigo_ctrl is null) then 0 else ctr1.codigo_ctrl end cod_tipo,
    case when (ctr1.nome_ctrl is null) then '' else ctr1.nome_ctrl end tipo,
    coalesce(ctp.cod_contrp, 0) as cod_contrp,
    coalesce(ctp.n_doc_ctp, 0) as Num_doc,
    coalesce(det.lote, coalesce(ctp.n_doc_ctp, 0), 0) as Num_doc2,
    ctp.data_venc_ctp as Data_Doc,
    ctp.datq_ctp as Data_Conf,
    iif(ctp.datq_ctp is not null, coalesce(ctp.valor_pago, 0), coalesce(ctp.valor_ctp, 0)) as valor_total,
    ' ' as obs_cxl_rq,
    coalesce(ctp.lote, ctp.cod_contrp) as loterec,
    coalesce(ctp.op_cx, 0) op_cxl, 0 codigo_vend,
    ctp.datq_ctp, ('LOTE CTP ' || ctp.lote) historico_ctp,
    coalesce(det.valor, 0) valor_pago,
    ctp.datq_ctp, ' ' terceiros,
    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end codigo_ctrl,
    case when ctr.nome_ctrl is null then 'SEM FORMA' else ctr.nome_ctrl end nome_ctrl,
    0 as num_recibo,
    0 as valor_recibo,
    0 ncupom,
    0 num_nf,
    0 parcela,
    ctp.cod_contrp seqid,
    coalesce(det.codigo, ctp.cod_contrp) seqid2,
    'N' venda,
    '' tipv,
    ctp.tipo_ctp,
    coalesce((case when ((select count(*) from contas_a_pagar cp
                          left join empresa e on cp.codigo_emp = e.cod_empresa
                          where cp.lote = ctp.lote
                          and cp.datq_ctp = ctp.datq_ctp
                          and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) =
                            (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else ctp.codigo_emp end)) = 0) then
                     1
                   else
                     (select count(*) from contas_a_pagar cp
                      left join empresa e on cp.codigo_emp = e.cod_empresa
                      where cp.lote = ctp.lote
                      and cp.datq_ctp = ctp.datq_ctp
                      and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) =
                        (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else ctp.codigo_emp end))
              end),
    1) qtde_prest,

    coalesce((case when ((select count(*) from contas_a_pagar cp
                          where cp.lote = ctp.lote
                          and cp.datq_ctp = ctp.datq_ctp
                          and ctp.cod_emp_mult = ctp.cod_emp_mult) = 0) then
                     1
                   else
                     (select count(*) from contas_a_pagar cp
                      where cp.lote = ctp.lote
                      and cp.datq_ctp = ctp.datq_ctp
                      and cp.cod_emp_mult = ctp.cod_emp_mult)
              end),
    1) qtde_prest_emp,

    coalesce((case when (ctp.lote <= 0) then
                     ctp.valor_ctp
                   else
                     (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                      where cp.lote = ctp.lote
                      and cp.datq_ctp = ctp.datq_ctp
                      and cp.cod_emp_mult = ctp.cod_emp_mult)
              end),
    0) valor_prest_emp,

    coalesce((case when (ctp.lote <= 0) then
                     ctp.valor_ctp
                   else
                     (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                      left join empresa e on cp.codigo_emp = e.cod_empresa
                      where cp.lote = ctp.lote
                      and cp.datq_ctp = ctp.datq_ctp
                      and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) = ctp.codigo_emp)
              end),
    0) valor_prest_tot,

    case when (coalesce((case when (ctp.lote <= 0) then
                       ctp.valor_ctp
                     else
                       (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                        left join empresa e on cp.codigo_emp = e.cod_empresa
                        where cp.lote = ctp.lote
                        and cp.datq_ctp = ctp.datq_ctp
                        and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) = ctp.codigo_emp)
                end), 0)) <= 0 then
           0
         else
            ((coalesce((case when (ctp.lote <= 0) then
                               ctp.valor_ctp
                             else
                               (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                                where cp.lote = ctp.lote
                                and cp.datq_ctp = ctp.datq_ctp
                                and cp.cod_emp_mult = ctp.cod_emp_mult)
                        end), 0) /
              coalesce((case when (ctp.lote <= 0) then
                               ctp.valor_ctp
                             else
                               (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                                left join empresa e on cp.codigo_emp = e.cod_empresa
                                where cp.lote = ctp.lote
                                and cp.datq_ctp = ctp.datq_ctp
                                and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) = ctp.codigo_emp)
                        end), 0)) *
              coalesce(det.valor, 0) 
            )
    end valor_pago_prop

    from contas_a_pagar ctp
    left join empresa emp on ctp.codigo_emp = emp.cod_empresa
    left join clientes cl on cl.cod_cliente = ctp.cod_forn_nfe and cl.cod_empresa = ctp.cod_emp_mult
    inner join det_pagamentos det on
        iif(emp.financeiro_unificado = 'S', det.cod_empresa, det.cod_emp_lote) = iif(emp.financeiro_unificado = 'S', emp.codigo_unificadora, emp.cod_empresa)
        and det.lote = ctp.lote
        and det.data_lote = iif(emp.financeiro_unificado = 'S', ctp.datq_ctp, det.data_lote)
        and det.parcial is null
        and det.renegociacao is null
    left join controles ctr on ctr.codigo_ctrl = det.codigo_ctrl and ctr.codigo_emp = det.cod_empresa
    left join CONTROLES ctr1 on ctr1.codigo_ctrl = ctp.codigo_ctrl and ctr1.codigo_emp = ctp.codigo_emp
    where ctp.datq_ctp is not null

    union

    select (case when(emp.financeiro_unificado = 'S') then emp.codigo_unificadora else ctp.codigo_emp end) cod_empresa,
    ctp.codigo_emp,
    ctp.cod_emp_mult,
    coalesce(ctp.cod_forn_nfe, 0) cod_cliente,
    case when (cl.nome_cliente is null) then ctp.nome_for_ctp else ctp.nome_for_ctp end nome_cliente,
    case when (cl.cpfcgc is null) then ctp.cpf_cgc_f else cl.cpfcgc end cpfcgc_cliente,
    'PAGAMENTOS' tp_rel, 'PAGAMENTOS' tp_recebimento, 'DIRETO' tp_recebimento2, 1 ordem,
    case when (ctr1.codigo_ctrl is null) then 0 else ctr1.codigo_ctrl end cod_tipo,
    case when (ctr1.nome_ctrl is null) then '' else ctr1.nome_ctrl end tipo,
    coalesce(ctp.cod_contrp, 0) as cod_contrp,
    coalesce(ctp.cod_contrp, 0) as Num_doc,
    coalesce(det.lote, coalesce(ctp.cod_contrp, 0), 0) as Num_doc2,
    ctp.data_venc_ctp as Data_Doc,
    ctp.data_ent_ctp as Data_Conf,
    iif(ctp.datq_ctp is not null, coalesce(ctp.valor_pago, 0), coalesce(ctp.valor_ctp, 0)) as valor_total,
    ' ' as obs_cxl_rq,
    coalesce(ctp.lote, ctp.cod_contrp) as loterec,
    coalesce(ctp.op_cx, 0) op_cxl, 0 codigo_vend,
    ctp.datq_ctp, ('LOTE CTP ' || ctp.lote) historico_ctp,
    coalesce(det.valor, 0) valor_pago,
    ctp.datq_ctp, ' ' terceiros,
    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end codigo_ctrl,
    case when ctr.nome_ctrl is null then 'SEM FORMA' else ctr.nome_ctrl end nome_ctrl,
    0 as num_recibo,
    0 as valor_recibo,
    0 ncupom,
    0 num_nf,
    0 parcela,
    ctp.cod_contrp seqid,
    coalesce(det.codigo, ctp.cod_contrp) seqid2,
    'N' venda,
    '' tipv,
    ctp.tipo_ctp,
    coalesce((case when ((select count(*) from contas_a_pagar cp
                          left join empresa e on cp.codigo_emp = e.cod_empresa
                          where cp.lote = ctp.lote
                          and cp.datq_ctp = ctp.datq_ctp
                          and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) =
                            (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else ctp.codigo_emp end)) = 0) then
                     1
                   else
                     (select count(*) from contas_a_pagar cp
                      left join empresa e on cp.codigo_emp = e.cod_empresa
                      where cp.lote = ctp.lote
                      and cp.datq_ctp = ctp.datq_ctp
                      and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) =
                        (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else ctp.codigo_emp end))
              end),
    1) qtde_prest,

    coalesce((case when ((select count(*) from contas_a_pagar cp
                          where cp.lote = ctp.lote
                          and cp.datq_ctp = ctp.datq_ctp
                          and ctp.cod_emp_mult = ctp.cod_emp_mult) = 0) then
                     1
                   else
                     (select count(*) from contas_a_pagar cp
                      where cp.lote = ctp.lote
                      and cp.datq_ctp = ctp.datq_ctp
                      and cp.cod_emp_mult = ctp.cod_emp_mult)
              end),
    1) qtde_prest_emp,

    coalesce((case when (ctp.lote <= 0) then
                     ctp.valor_ctp
                   else
                     (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                      where cp.lote = ctp.lote
                      and cp.datq_ctp = ctp.datq_ctp
                      and cp.cod_emp_mult = ctp.cod_emp_mult)
              end),
    0) valor_prest_emp,

    coalesce((case when (ctp.lote <= 0) then
                     ctp.valor_ctp
                   else
                     (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                      left join empresa e on cp.codigo_emp = e.cod_empresa
                      where cp.lote = ctp.lote
                      and cp.datq_ctp = ctp.datq_ctp
                      and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) = ctp.codigo_emp)
              end),
    0) valor_prest_tot,

    case when (coalesce((case when (ctp.lote <= 0) then
                       ctp.valor_ctp
                     else
                       (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                        left join empresa e on cp.codigo_emp = e.cod_empresa
                        where cp.lote = ctp.lote
                        and cp.datq_ctp = ctp.datq_ctp
                        and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) = ctp.codigo_emp)
                end), 0)) <= 0 then
           0
         else
            ((coalesce((case when (ctp.lote <= 0) then
                               ctp.valor_ctp
                             else
                               (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                                where cp.lote = ctp.lote
                                and cp.datq_ctp = ctp.datq_ctp
                                and cp.cod_emp_mult = ctp.cod_emp_mult)
                        end), 0) /
              coalesce((case when (ctp.lote <= 0) then
                               ctp.valor_ctp
                             else
                               (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                                left join empresa e on cp.codigo_emp = e.cod_empresa
                                where cp.lote = ctp.lote
                                and cp.datq_ctp = ctp.datq_ctp
                                and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) = ctp.codigo_emp)
                        end), 0)) *
              coalesce(det.valor, 0) 
            )
    end valor_pago_prop

    from contas_a_pagar ctp
    left join empresa emp on ctp.codigo_emp = emp.cod_empresa
    left join clientes cl on cl.cod_cliente = ctp.cod_forn_nfe and cl.cod_empresa = ctp.cod_emp_mult
    left join det_pagamentos det on
        iif(emp.financeiro_unificado = 'S', det.cod_empresa, det.cod_emp_lote) = iif(emp.financeiro_unificado = 'S', emp.codigo_unificadora, emp.cod_empresa)
        and det.lote = ctp.lote
        and det.data_lote = iif(emp.financeiro_unificado = 'S', ctp.datq_ctp, det.data_lote)
        and det.parcial is null
        and det.renegociacao is null
    left join controles ctr on ctr.codigo_ctrl = det.codigo_ctrl and ctr.codigo_emp = det.cod_empresa
    left join CONTROLES ctr1 on ctr1.codigo_ctrl = ctp.codigo_ctrl and ctr1.codigo_emp = ctp.codigo_emp
    where ctp.datq_ctp is null;
|/BLOCO|

|BLOCO|
CREATE OR ALTER VIEW PAGAMENTOS2(
    TP_RECEBIMENTO,
    ORDEM,
    TIPO,
    TIPO2,
    COD_EMPRESA,
    COD_EMP_ORIG,
    COD_EMP_MULT,
    DATA_CONF,
    CODIGO_CTRL,
    NOME_CTRL,
    VALOR_PAGO,
    DATA_MOV,
    DATA_VENC,
    SEQID,
    SEQID2,
    VALOR_PAGO_PROP)
AS
-- VIEW EXIBE OS PAGAMENTOS REALIZADOS
-- RELATORIO "PAGAMENTO FINANCEIRO"
    select distinct 'DIRETO', 1, 'PAGAMENTOS',
    case when (ctr1.nome_ctrl is null) then '' else ctr1.nome_ctrl end tipo2,
    (case when(emp.financeiro_unificado = 'S') then emp.codigo_unificadora else ctp.codigo_emp end) cod_empresa,
    ctp.codigo_emp,
    ctp.cod_emp_mult,
    ctp.datq_ctp,
    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end codigo_ctrl,
    case when ctr.nome_ctrl is null then 'SEM FORMA' else ctr.nome_ctrl end nome_ctrl,
    iif(ctp.datq_ctp is null, 0, coalesce(det.valor, 0)) valordoc, det.data_rec, det.data_venc,
    coalesce(det.codigo, ctp.cod_contrp), coalesce(det.codigo, ctp.cod_contrp),

    case when (coalesce((case when (ctp.lote <= 0) then
                       ctp.valor_ctp
                     else
                       (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                        left join empresa e on cp.codigo_emp = e.cod_empresa
                        where cp.lote = ctp.lote
                        and cp.datq_ctp = ctp.datq_ctp
                        and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) =
                            (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else ctp.codigo_emp end))
                end), 0)) <= 0 then
           0
         else
            ((coalesce((case when (ctp.lote <= 0) then
                               ctp.valor_ctp
                             else
                               (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                                where cp.lote = ctp.lote
                                and cp.datq_ctp = ctp.datq_ctp
                                and cp.cod_emp_mult = ctp.cod_emp_mult)
                        end), 0) /
              coalesce((case when (ctp.lote <= 0) then
                               ctp.valor_ctp
                             else
                               (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                                left join empresa e on cp.codigo_emp = e.cod_empresa
                                where cp.lote = ctp.lote
                                and cp.datq_ctp = ctp.datq_ctp
                                and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) =
                                    (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else ctp.codigo_emp end))
                        end), 0)) *
              coalesce(det.valor, 0) 
            )
    end valor_pago_prop

    from contas_a_pagar ctp
    left join empresa emp on ctp.codigo_emp = emp.cod_empresa
    inner join det_pagamentos det on
        iif(emp.financeiro_unificado = 'S', det.cod_empresa, det.cod_emp_lote) = iif(emp.financeiro_unificado = 'S', emp.codigo_unificadora, emp.cod_empresa)
        and det.lote = ctp.lote
        and det.data_lote = iif(emp.financeiro_unificado = 'S', ctp.datq_ctp, det.data_lote)
        and det.parcial is null
        and det.renegociacao is null
    left join controles ctr on ctr.codigo_ctrl = det.codigo_ctrl and ctr.codigo_emp = det.cod_empresa
    left join controles ctr1 on ctr1.codigo_ctrl = ctp.codigo_ctrl and ctr1.codigo_emp = ctp.codigo_emp
    where ctp.datq_ctp is not null

    union

    select distinct 'DIRETO', 1, 'PAGAMENTOS',
    case when (ctr1.nome_ctrl is null) then '' else ctr1.nome_ctrl end tipo2,
    (case when(emp.financeiro_unificado = 'S') then emp.codigo_unificadora else ctp.codigo_emp end) cod_empresa,
    ctp.codigo_emp,
    ctp.cod_emp_mult,
    ctp.data_ent_ctp,
    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end codigo_ctrl,
    case when ctr.nome_ctrl is null then 'SEM FORMA' else ctr.nome_ctrl end nome_ctrl,
    iif(ctp.datq_ctp is null, 0, coalesce(det.valor, 0)) valordoc, det.data_rec, det.data_venc,
    coalesce(det.codigo, ctp.cod_contrp), coalesce(det.codigo, ctp.cod_contrp),

    case when (coalesce((case when (ctp.lote <= 0) then
                       ctp.valor_ctp
                     else
                       (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                        left join empresa e on cp.codigo_emp = e.cod_empresa
                        where cp.lote = ctp.lote
                        and cp.datq_ctp = ctp.datq_ctp
                        and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) =
                            (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else ctp.codigo_emp end))
                end), 0)) <= 0 then
           0
         else
            ((coalesce((case when (ctp.lote <= 0) then
                               ctp.valor_ctp
                             else
                               (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                                where cp.lote = ctp.lote
                                and cp.datq_ctp = ctp.datq_ctp
                                and cp.cod_emp_mult = ctp.cod_emp_mult)
                        end), 0) /
              coalesce((case when (ctp.lote <= 0) then
                               ctp.valor_ctp
                             else
                               (select sum(coalesce(cp.valor_pago, 0)) from contas_a_pagar cp
                                left join empresa e on cp.codigo_emp = e.cod_empresa
                                where cp.lote = ctp.lote
                                and cp.datq_ctp = ctp.datq_ctp
                                and (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else cp.codigo_emp end) =
                                    (case when(e.financeiro_unificado = 'S') then e.codigo_unificadora else ctp.codigo_emp end))
                        end), 0)) *
              coalesce(det.valor, 0) 
            )
    end valor_pago_prop

    from contas_a_pagar ctp
    left join empresa emp on ctp.codigo_emp = emp.cod_empresa
    left join det_pagamentos det on
        iif(emp.financeiro_unificado = 'S', det.cod_empresa, det.cod_emp_lote) = iif(emp.financeiro_unificado = 'S', emp.codigo_unificadora, emp.cod_empresa)
        and det.lote = ctp.lote
        and det.data_lote = iif(emp.financeiro_unificado = 'S', ctp.datq_ctp, det.data_lote)
        and det.parcial is null
        and det.renegociacao is null
    left join controles ctr on ctr.codigo_ctrl = det.codigo_ctrl and ctr.codigo_emp = det.cod_empresa
    left join controles ctr1 on ctr1.codigo_ctrl = ctp.codigo_ctrl and ctr1.codigo_emp = ctp.codigo_emp
    where ctp.datq_ctp is null;
|/BLOCO|

|BLOCO|
ALTER TABLE NOTIFICACAO_CREDITOS ADD UUID VARCHAR(50);
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG DROP COD_PLATAFORMA_PARC;
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG ADD IDENT_BOT VARCHAR(50);
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG DROP DESCRICAO;
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG DROP TESTAR_EMAIL;
|/BLOCO|

|BLOCO|
ALTER TABLE PLATAFORMA_MSG DROP TESTAR_CELULAR;
|/BLOCO|

|BLOCO|
CREATE TABLE NOTAFISCAL_PROTOCOLO (
    COD_NF INTEGER NOT NULL,
    COD_EMPRESA INTEGER NOT NULL,
    SITUACAO_NFE VARCHAR(40) NOT NULL,
    ID_PROTOCOLO INTEGER,
    ID_PROCESSO INTEGER
);
|/BLOCO|	

ALTER TABLE NOTAFISCAL_PROTOCOLO ADD CONSTRAINT PK_NOTAFISCAL_PROTOCOLO PRIMARY KEY (COD_NF,COD_EMPRESA,SITUACAO_NFE);

ALTER TABLE NOTAFISCAL_PROTOCOLO ADD CONSTRAINT FK_NOTAFISCAL_PROTOCOLO_NF FOREIGN KEY (COD_NF, COD_EMPRESA) REFERENCES NOTAFISCAL(COD_NF, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;

|BLOCO|
CREATE OR ALTER VIEW VW_NOTAFISCAL_INTEG(
    COD_NF,
    COD_EMPRESA,
    NATUREZA_NF,
    TIPO_NF,
    NUM_NF,
    SERIE_NF,
    MODELO_NF,
    STATUS_NF,
    SITUACAO_NF,
    DATA_LANC,
    DATA_CONTABIL,
    DATA_ENT_SAIDA,
    VALOR_TOTAL,
    VALOR_PROD,
    VALOR_SERV,
    NITEM,
    TIPO_VENDA,
    CHASSI,
    PLACA,
    COD_MARCA,
    MARCA,
    COD_VERSAO,
    VERSAO,
    COD_ESPECIE,
    ESPECIE,
    COD_COMBUSTIVEL,
    COMBUSTIVEL,
    COD_COR,
    COR,
    ANO_FAB,
    ANO_MOD,
    XML,
    ID_PROTOCOLO,
    ID_PROCESSO)
AS
select nf.cod_nf, nf.cod_empresa,
nf.natureza_nf, nf.tipo_nf,
nf.num_nf, nf.serie, nf.modelo_nf,
'Fechada' status, 'Autorizada' situacao_nfe,
nf.data_lanc, nf.data_contabil, nf.data_ent_saida,
nf.valor_total, nf.valor_prod, nf.valor_serv,
nfv.nitem, nfv.tipo_venda, nfv.chassi, nfv.placa,
nfv.cod_marca, nfv.marca,
nfv.versao, nfv.descricao_versao,
nfv.cod_tipo_esp, esp.descricao_esp,
nfv.cod_combustivel, nfv.combustivel,
nfv.cod_cor, nfv.cor,
nfv.ano_fab, nfv.ano_mod,
nf.xml_nfe,
nfp.id_protocolo, nfp.id_processo from notafiscal nf
inner join notafiscal_item nfi on
    nfi.cod_nf = nf.cod_nf
    and nfi.cod_empresa = nf.cod_empresa
inner join notafiscal_item_veiculo nfv on
    nfv.cod_nf = nfi.cod_nf
    and nfv.cod_empresa = nfi.cod_empresa
    and nfv.chassi = nfi.chassi
left join especie_veiculo esp on
    esp.codigo_esp = nfv.cod_tipo_esp
left join notafiscal_protocolo nfp on
    nfp.cod_nf = nf.cod_nf
    and nfp.cod_empresa = nf.cod_empresa
    and nfp.situacao_nfe = nf.situacao_nfe
where nf.tipo_nf = 'V'
and nf.emissao_propria = 'S'
and nf.situacao_nfe in ('Autorizada', 'Cancelada')
and nfv.tipo_venda = 'N'
union all
select nf.cod_nf, nf.cod_empresa,
nf.natureza_nf, nf.tipo_nf,
nf.num_nf, nf.serie, nf.modelo_nf,
nf.status, nf.situacao_nfe,
nf.data_lanc, nf.data_contabil, nf.data_ent_saida,
nf.valor_total, nf.valor_prod, nf.valor_serv,
nfv.nitem, nfv.tipo_venda, nfv.chassi, nfv.placa,
nfv.cod_marca, nfv.marca,
nfv.versao, nfv.descricao_versao,
nfv.cod_tipo_esp, esp.descricao_esp,
nfv.cod_combustivel, nfv.combustivel,
nfv.cod_cor, nfv.cor,
nfv.ano_fab, nfv.ano_mod,
car.xml_evento,
nfp.id_protocolo, nfp.id_processo from notafiscal nf
inner join notafiscal_carta_correcao car on
    car.cod_nf = nf.cod_nf
    and car.cod_empresa = nf.cod_empresa
    and car.tipo_evento = 'CAR'
inner join notafiscal_item nfi on
    nfi.cod_nf = nf.cod_nf
    and nfi.cod_empresa = nf.cod_empresa
inner join notafiscal_item_veiculo nfv on
    nfv.cod_nf = nfi.cod_nf
    and nfv.cod_empresa = nfi.cod_empresa
    and nfv.chassi = nfi.chassi
left join especie_veiculo esp on
    esp.codigo_esp = nfv.cod_tipo_esp
left join notafiscal_protocolo nfp on
    nfp.cod_nf = nf.cod_nf
    and nfp.cod_empresa = nf.cod_empresa
    and nfp.situacao_nfe = nf.situacao_nfe
where nf.tipo_nf = 'V'
and nf.emissao_propria = 'S'
and nf.situacao_nfe = 'Cancelada'
and nfv.tipo_venda = 'N';
|/BLOCO|

INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('NF0258', :COD_EMPRESA, 'ABRIR TELA NOTAFISCAL (SUZUKI)', 10, 'FRMNFINTEG', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('NF0259', :COD_EMPRESA, 'BT PESQUISAR NOTAFISCAL (SUZUKI)', 10, 'FRMNFINTEG', 1, 'N', 'S', CURRENT_DATE);
INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('NF0260', :COD_EMPRESA, 'BT ENVIAR NOTAFISCAL (SUZUKI)', 10, 'FRMNFINTEG', 1, 'N', 'S', CURRENT_DATE);

update RDB$FIELDS set RDB$FIELD_LENGTH = 500, RDB$CHARACTER_LENGTH = 500 where RDB$FIELD_NAME = (select rdb$field_source from rdb$relation_fields where rdb$relation_name = 'CONFIG_API' and rdb$field_name = 'ACESS_TOKEN');

ALTER TABLE CONFIG_API ADD SENHA VARCHAR(100);

ALTER TABLE BOLETAS ADD VIA_WS CHAR(1) DEFAULT 'N'; 

ALTER TABLE COBREBEM ADD CAMINHO_CERT VARCHAR(256);

ALTER TABLE COBREBEM ADD SENHA_CERT VARCHAR(30);

ALTER TABLE COBREBEM ADD DATA_VENC_CERT TIMESTAMP;



|BLOCO|
CREATE OR ALTER VIEW VW_NOTAFISCAL_INTEG(
    COD_NF,
    COD_EMPRESA,
    NATUREZA_NF,
    TIPO_NF,
    NUM_NF,
    SERIE_NF,
    MODELO_NF,
    STATUS_NF,
    SITUACAO_NF,
    DATA_LANC,
    DATA_CONTABIL,
    DATA_ENT_SAIDA,
    VALOR_TOTAL,
    VALOR_PROD,
    VALOR_SERV,
    NITEM,
    TIPO_VENDA,
    CHASSI,
    PLACA,
    COD_MARCA,
    MARCA,
    COD_VERSAO,
    VERSAO,
    COD_ESPECIE,
    ESPECIE,
    COD_COMBUSTIVEL,
    COMBUSTIVEL,
    COD_COR,
    COR,
    ANO_FAB,
    ANO_MOD,
    XML,
    ID_PROTOCOLO,
    ID_PROCESSO)
AS
select nf.cod_nf, nf.cod_empresa,
nf.natureza_nf, nf.tipo_nf,
nf.num_nf, nf.serie, nf.modelo_nf,
'Fechada' status, 'Autorizada' situacao_nfe,
nf.data_lanc, nf.data_contabil, nf.data_ent_saida,
nf.valor_total, nf.valor_prod, nf.valor_serv,
nfv.nitem, nfv.tipo_venda, nfv.chassi, nfv.placa,
nfv.cod_marca, nfv.marca,
nfv.versao, nfv.descricao_versao,
nfv.cod_tipo_esp, esp.descricao_esp,
nfv.cod_combustivel, nfv.combustivel,
nfv.cod_cor, nfv.cor,
nfv.ano_fab, nfv.ano_mod,
nf.xml_nfe,
nfp.id_protocolo, nfp.id_processo from notafiscal nf
inner join notafiscal_item nfi on
    nfi.cod_nf = nf.cod_nf
    and nfi.cod_empresa = nf.cod_empresa
inner join notafiscal_item_veiculo nfv on
    nfv.cod_nf = nfi.cod_nf
    and nfv.cod_empresa = nfi.cod_empresa
    and nfv.chassi = nfi.chassi
left join especie_veiculo esp on
    esp.codigo_esp = nfv.cod_tipo_esp
left join notafiscal_protocolo nfp on
    nfp.cod_nf = nf.cod_nf
    and nfp.cod_empresa = nf.cod_empresa
    and nfp.situacao_nfe = nf.situacao_nfe
where nf.tipo_nf = 'V'
and nf.emissao_propria = 'S'
and nf.situacao_nfe in ('Autorizada', 'Cancelada')
and nfv.tipo_venda = 'N'
union all
select nf.cod_nf, nf.cod_empresa,
nf.natureza_nf, nf.tipo_nf,
nf.num_nf, nf.serie, nf.modelo_nf,
nf.status, nf.situacao_nfe,
nf.data_lanc, nf.data_contabil, nf.data_ent_saida,
nf.valor_total, nf.valor_prod, nf.valor_serv,
nfv.nitem, nfv.tipo_venda, nfv.chassi, nfv.placa,
nfv.cod_marca, nfv.marca,
nfv.versao, nfv.descricao_versao,
nfv.cod_tipo_esp, esp.descricao_esp,
nfv.cod_combustivel, nfv.combustivel,
nfv.cod_cor, nfv.cor,
nfv.ano_fab, nfv.ano_mod,
car.xml_evento,
nfp.id_protocolo, nfp.id_processo from notafiscal nf
inner join notafiscal_carta_correcao car on
    car.cod_nf = nf.cod_nf
    and car.cod_empresa = nf.cod_empresa
    and car.tipo_evento = 'CAN'
inner join notafiscal_item nfi on
    nfi.cod_nf = nf.cod_nf
    and nfi.cod_empresa = nf.cod_empresa
inner join notafiscal_item_veiculo nfv on
    nfv.cod_nf = nfi.cod_nf
    and nfv.cod_empresa = nfi.cod_empresa
    and nfv.chassi = nfi.chassi
left join especie_veiculo esp on
    esp.codigo_esp = nfv.cod_tipo_esp
left join notafiscal_protocolo nfp on
    nfp.cod_nf = nf.cod_nf
    and nfp.cod_empresa = nf.cod_empresa
    and nfp.situacao_nfe = nf.situacao_nfe
where nf.tipo_nf = 'V'
and nf.emissao_propria = 'S'
and nf.situacao_nfe = 'Cancelada'
and nfv.tipo_venda = 'N';
|/BLOCO|

CMD:COMMIT|ALTER TABLE PLATAFORMA_MSG DROP CONSTRAINT PK_PLATAFORMA_MSG;

CMD:COMMIT|DROP TABLE PLATAFORMA_MSG;