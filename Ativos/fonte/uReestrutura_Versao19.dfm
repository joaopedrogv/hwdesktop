inherited frmReestruturaVersao19: TfrmReestruturaVersao19
  Caption = 'frmReestruturaVersao19'
  ClientWidth = 1028
  ExplicitWidth = 1036
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1028
    ExplicitWidth = 1028
    inherited Label1: TLabel
      Width = 1022
    end
    inherited sqlFiscal: TMemo
      Width = 1022
      ExplicitWidth = 1022
    end
  end
  inherited Panel2: TPanel
    Width = 1028
    ExplicitWidth = 1028
    inherited Label2: TLabel
      Width = 1022
    end
    inherited sqlHWF: TMemo
      Width = 1022
      ExplicitWidth = 1022
    end
  end
  inherited Panel3: TPanel
    Width = 1028
    ExplicitWidth = 1028
    inherited Label3: TLabel
      Width = 1022
    end
    inherited sqlHwauto: TMemo
      Width = 1022
      Lines.Strings = (
        'ALTER TABLE RECIBOS ADD COD_EMP_MULT INTEGER;'
        'ALTER TABLE FORMPAGAMENTO ADD COD_UNIFICADA INTEGER;'
        'ALTER TABLE HIST_REC ADD COD_UNIFICADA INTEGER;'
        'ALTER TABLE CONTROLE_CHEQUE ADD COD_EMP_LOTE INTEGER;'
        'ALTER TABLE CONTROLE_CREDITOS ADD COD_EMP_LOTE INTEGER;'
        'ALTER TABLE BAIXA_CREDITOS ADD COD_EMP_LOTE INTEGER;'
        
          'CMD:REPL|UPDATE RECIBOS SET COD_EMP_MULT = COD_EMPRESA WHERE COD' +
          '_EMP_MULT IS NULL;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW CREDITOSCHEQUE('
        '    LOTE,'
        '    CODIGO,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    HISTORICO,'
        '    VALOR,'
        '    COD_CLIENTE,'
        '    CLIENTE,'
        '    TIPO_DOC)'
        'AS'
        'select baixa_creditos.lote_quit, baixa_creditos.cod_cred,'
        'baixa_creditos.codigo_emp, baixa_creditos.cod_emp_mult,'
        'baixa_creditos.historico_c, baixa_creditos.valor_quitado,'
        'baixa_creditos.cod_cliente, baixa_creditos.nome_c,'
        'controles.nome_ctrl from baixa_creditos'
        
          'inner join controles on controles.codigo_ctrl = baixa_creditos.c' +
          'odigo_ctrl and controles.codigo_emp = baixa_creditos.codigo_emp'
        'inner join baixa_creditos bx on'
        
          '    bx.cod_cred = baixa_creditos.cod_cred and bx.codigo_emp = ba' +
          'ixa_creditos.codigo_emp'
        ''
        'union'
        ''
        'select controle_cheque.lote_quit, controle_cheque.codigo_ch,'
        'controle_cheque.codigo_emp, controle_cheque.cod_emp_mult,'
        'controle_cheque.historico_ch, controle_cheque.valor_ch,'
        'controle_cheque.cod_cliente, controle_cheque.nome_ch,'
        'controles.nome_ctrl from controle_cheque'
        
          'inner join controles on controles.codigo_ctrl = controle_cheque.' +
          'codigo_ctrl and controles.codigo_emp = controle_cheque.codigo_em' +
          'p'
        ''
        'inner join controle_cheque ch on'
        
          '    ch.codigo_ch = controle_cheque.codigo_ch and ch.codigo_emp =' +
          ' controle_cheque.codigo_emp;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VENDAS_GERAIS('
        '    TIPO,'
        '    NPED,'
        '    DATA_VENDA,'
        '    VALOR_VENDA,'
        '    VALOR_REAL,'
        '    VALOR_NF,'
        '    NUM_NF,'
        '    DATA_NF,'
        '    NCUPOM,'
        '    DATA_CUPOM,'
        '    VALOR_CUPOM,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    NOME_VENDEDOR,'
        '    OPERADOR,'
        '    OPERADORBAL,'
        '    STATUS_CXL,'
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    VENDA,'
        '    TIPV)'
        'AS'
        
          'select pd.tipo as tp_doc,pd.nped,pd.data_fech,pd.valor_total,pd.' +
          'valor_total as valor_real,'
        
          'pd.valor_total as valor_nf,pd.num_nf,pd.data_nf,pd.ncupom,pd.dat' +
          'a_cupom,((cp.valorcupom-cp.valor_desc)+cp.valor_acres) as valorc' +
          'upom,cl.cod_cliente,'
        
          'cl.nome_cliente,v.nome_vendedor,pd.op_cxl,pd.operador,pd.STATUS_' +
          'CXL_RQ,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pd.cod_empresa end) cod_empresa,'
        'pd.cod_empresa,'
        'tv.venda,pd.tipv from pedvenda pd'
        'inner join empresa emp on pd.cod_empresa = emp.cod_empresa'
        
          'inner join clientes cl on pd.cod_cliente = cl.cod_cliente and pd' +
          '.cod_empresa = cl.cod_empresa'
        
          'inner join colaborador v on pd.cod_vendedor = v.cod_vendedor and' +
          ' pd.cod_empresa = v.cod_empresa'
        
          'left join cupom cp on pd.ncupom = cp.cupom and pd.NSERIEECF = cp' +
          '.NSERIEECF and pd.cod_empresa = cp.cod_empresa'
        
          'inner join tipo_vendas tv on pd.tipo=tv.tipo and (pd.tipv=tv.sig' +
          'la or (pd.tipo_os=tv.tipo_os))'
        
          'where pd.data_fech  >= '#39'01/01/2010'#39' and coalesce(pd.status_ped, ' +
          #39#39') <> '#39'CANCELADO'#39
        'union'
        
          'select '#39'MOT'#39' as tp_doc,pd.n_comando,pd.data_ven,pd.valor_a_rec,p' +
          'd.valor_real,pd.prven_v,pd.num_nota_v,pd.data_ven,0 as ncupom,'
        
          'cast('#39'01/01/2001'#39' as timestamp) as data_cupom,0 as valorcupom,cl' +
          '.cod_cliente,cl.nome_cliente,v.nome_vendedor,pd.op_cxl,pd.covend' +
          '_v,pd.STATUS_CXL_RQ,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pd.cod_empresa end) cod_empresa,'
        'pd.cod_empresa,'
        'tv.venda, '#39'V'#39' from com_fat pd'
        'inner join empresa emp on pd.cod_empresa = emp.cod_empresa'
        
          'inner join clientes cl on pd.clientes_v = cl.cod_cliente and pd.' +
          'cod_empresa = cl.cod_empresa'
        
          'inner join colaborador v on pd.covend_v = v.cod_vendedor and pd.' +
          'cod_empresa = v.cod_empresa'
        
          'inner join tipo_vendas tv on tv.tipo = '#39'VEI'#39' and pd.tipo_v = tv.' +
          'tipo_os'
        'where pd.data_ven  >= '#39'01/01/2010'#39
        
          'and pd.natureza = '#39'S'#39' and (coalesce(pd.status_v, '#39#39') = '#39'FECHADO'#39 +
          ');'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS2*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS3('
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    DATA,'
        '    VALOR,'
        '    MULT_MEDIA,'
        '    PONDERACAO,'
        '    TIPO)'
        'AS'
        
          'SELECT (CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIG' +
          'O_UNIFICADORA ELSE FP.COD_EMPRESA END) COD_EMPRESA,'
        'FP.COD_EMPRESA,'
        'FP.DATA_MOV, SUM(COALESCE(FP.VALORDOC, 0)) AS VALOR,'
        
          '0 MULT_MEDIA, 0 PONDERACAO, '#39'VALORVENDA'#39' TIPO FROM FORMPAGAMENTO' +
          ' FP'
        'INNER JOIN EMPRESA EMP ON FP.COD_EMPRESA = EMP.COD_EMPRESA'
        'WHERE (TIPDOC = '#39'N'#39' OR (DATA_VENC-DATA_MOV) <= 5)'
        'AND TPDOCS <> '#39'PRE'#39
        'GROUP BY 1, 2, 3'
        'UNION'
        
          'SELECT (CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIG' +
          'O_UNIFICADORA ELSE FP.COD_EMPRESA END) COD_EMPRESA,'
        'FP.COD_EMPRESA,'
        'FP.DATA_MOV, SUM(COALESCE(FP.VALORDOC, 0)) AS VALORVENDA,'
        
          'SUM((FP.DATA_VENC-FP.DATA_MOV) * COALESCE(FP.VALORDOC, 0)) AS MU' +
          'LT_MEDIA, 0 PONDERACAO, '#39'VALORVENDA1'#39' FROM FORMPAGAMENTO FP'
        'INNER JOIN EMPRESA EMP ON FP.COD_EMPRESA = EMP.COD_EMPRESA'
        'WHERE (FP.TIPDOC <> '#39'N'#39' AND (FP.DATA_VENC-FP.DATA_MOV) > 5)'
        'AND FP.TPDOCS <> '#39'PRE'#39
        'GROUP BY 1, 2, 3'
        'UNION'
        'SELECT'
        'CRED.CODIGO_EMP,'
        'CRED.COD_EMP_MULT, CRED.DATA_REC,'
        'SUM(COALESCE(CRED.VALOR,0)) AS VALORVENDA,'
        
          'SUM((CRED.DATA_VENC-CRED.DATA_REC) * COALESCE(CRED.VALOR, 0)) AS' +
          ' MULT_MEDIA,'
        '0 PONDERACAO,  '#39'VALORVENDA2'#39' FROM CRED_JUR CRED'
        
          'INNER JOIN CONTROLES CTRL ON CRED.CONTROLE = CTRL.CODIGO_CTRL AN' +
          'D CRED.CODIGO_EMP = CTRL.CODIGO_EMP'
        
          'WHERE (CRED.DATA_VENC-CRED.DATA_REC) > 5 AND COALESCE(CTRL.ENTRA' +
          '_PMV,'#39#39') <> '#39'N'#39
        'GROUP BY 1, 2, 3'
        'UNION'
        'SELECT'
        'VND.COD_EMPRESA,'
        'VND.COD_EMP_MULT,'
        
          'VND.DATA_VENDA, SUM(COALESCE(VND.VALOR_VENDA, 0)) AS VALORVENDA,' +
          ' 0 MULT_MEDIA, 0 PONDERACAO,'
        #39'VENDAG'#39' FROM VENDAS_GERAIS VND'
        'LEFT JOIN EMPRESA EMP ON VND.COD_EMPRESA = EMP.COD_EMPRESA'
        'WHERE VENDA = '#39'S'#39
        'GROUP BY 1, 2, 3'
        'UNION'
        
          'SELECT (CASE WHEN(EMP.FINANCEIRO_UNIFICADO = '#39'S'#39') THEN EMP.CODIG' +
          'O_UNIFICADORA ELSE CR.CODIGO_EMP END) COD_EMPRESA,'
        
          'CR.COD_EMP_MULT, CR.DATQ_C, SUM(COALESCE(CR.VALOR_C, 0)) AS VALO' +
          'RATRASO,'
        '(SUM((CR.DATQ_C-CR.DATA_VENC_C))/COUNT(*)) AS MULT_MEDIA,'
        
          '((SUM((CR.DATQ_C-CR.DATA_VENC_C))/COUNT(*)) * SUM(COALESCE(CR.VA' +
          'LOR_C, 0))) AS PONDERACAO,'
        #39'PONDERACAO'#39' FROM CONTROLE_CREDITOS CR'
        'LEFT JOIN EMPRESA EMP ON CR.CODIGO_CTRL = EMP.COD_EMPRESA'
        
          'INNER JOIN CONTROLES CTRL ON CR.CODIGO_CTRL = CTRL.CODIGO_CTRL A' +
          'ND CR.CODIGO_EMP = CTRL.CODIGO_EMP'
        'WHERE (CR.DATQ_C-CR.DATA_VENC_C) > 1'
        'AND CTRL.COMPSALDO = '#39'S'#39
        'GROUP BY 1, 2, 3;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS4*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS5*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS6*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VENDAS_GERAIS('
        '    TIPO,'
        '    NPED,'
        '    DATA_VENDA,'
        '    VALOR_VENDA,'
        '    VALOR_REAL,'
        '    VALOR_NF,'
        '    NUM_NF,'
        '    DATA_NF,'
        '    NCUPOM,'
        '    DATA_CUPOM,'
        '    VALOR_CUPOM,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    NOME_VENDEDOR,'
        '    OPERADOR,'
        '    OPERADORBAL,'
        '    DIA_CXL,'
        '    STATUS_CXL,'
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    VENDA,'
        '    TIPV)'
        'AS'
        
          'select pd.tipo as tp_doc,pd.nped,pd.data_fech,pd.valor_total,pd.' +
          'valor_total as valor_real,'
        
          'pd.valor_total as valor_nf,pd.num_nf,pd.data_nf,pd.ncupom,pd.dat' +
          'a_cupom,((cp.valorcupom-cp.valor_desc)+cp.valor_acres) as valorc' +
          'upom,cl.cod_cliente,'
        
          'cl.nome_cliente,v.nome_vendedor,pd.op_cxl,pd.operador,pd.dia_cxl' +
          ',pd.STATUS_CXL_RQ,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pd.cod_empresa end) cod_empresa,'
        'pd.cod_empresa,'
        'tv.venda,pd.tipv from pedvenda pd'
        'inner join empresa emp on pd.cod_empresa = emp.cod_empresa'
        
          'inner join clientes cl on pd.cod_cliente = cl.cod_cliente and pd' +
          '.cod_empresa = cl.cod_empresa'
        
          'inner join colaborador v on pd.cod_vendedor = v.cod_vendedor and' +
          ' pd.cod_empresa = v.cod_empresa'
        
          'left join cupom cp on pd.ncupom = cp.cupom and pd.NSERIEECF = cp' +
          '.NSERIEECF and pd.cod_empresa = cp.cod_empresa'
        
          'inner join tipo_vendas tv on pd.tipo=tv.tipo and (pd.tipv=tv.sig' +
          'la or (pd.tipo_os=tv.tipo_os))'
        
          'where pd.data_fech  >= '#39'01/01/2010'#39' and coalesce(pd.status_ped, ' +
          #39#39') <> '#39'CANCELADO'#39
        'union'
        
          'select '#39'MOT'#39' as tp_doc,pd.n_comando,pd.data_ven,pd.valor_a_rec,p' +
          'd.valor_real,'
        
          'pd.prven_v,pd.num_nota_v,pd.data_ven,0 as ncupom, cast('#39'01/01/20' +
          '01'#39' as timestamp) as data_cupom,0 as valorcupom,cl.cod_cliente,'
        
          'cl.nome_cliente,v.nome_vendedor,pd.op_cxl,pd.covend_v,pd.dia_cxl' +
          ',pd.STATUS_CXL_RQ,'
        
          '(case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_unifi' +
          'cadora else pd.cod_empresa end) cod_empresa,'
        'pd.cod_empresa,'
        'tv.venda, '#39'V'#39
        'from com_fat pd'
        'inner join empresa emp on pd.cod_empresa = emp.cod_empresa'
        
          'inner join clientes cl on pd.clientes_v = cl.cod_cliente and pd.' +
          'cod_empresa = cl.cod_empresa'
        
          'inner join colaborador v on pd.covend_v = v.cod_vendedor and pd.' +
          'cod_empresa = v.cod_empresa'
        
          'inner join tipo_vendas tv on tv.tipo = '#39'VEI'#39' and pd.tipo_v = tv.' +
          'tipo_os'
        
          'where pd.data_ven  >= '#39'01/01/2010'#39' and pd.natureza = '#39'S'#39' and (co' +
          'alesce(pd.status_v, '#39#39') = '#39'FECHADO'#39');'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW CRED_JUR*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW DEB_JUR('
        '    N_CONTA_PLC,'
        '    NOME,'
        '    DATA_ENT_CTP,'
        '    TIPO_DOC,'
        '    N_DOC,'
        '    HISTORICO,'
        '    DATA_VENC,'
        '    VALOR,'
        '    TERCEIRO,'
        '    CONTROLE,'
        '    DATA_QUITACAO,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    TIPODOC_CTP,'
        '    DATA_BAIXA,'
        '    NDOC_V,'
        '    LOTE_QUIT,'
        '    CODIGO_VEND,'
        '    CODSEQ,'
        '    TPDOC,'
        '    COD_CLIENTE,'
        '    STATUS_C,'
        '    VALOR_CORR,'
        '    EXIBIR_RESUMO_FINANCEIRO)'
        'AS'
        '-- VIEW EXIBE AS CONTAS A PAGAR'
        
          '-- RELATORIO "RESUMO FINANCEIRO" EXIBIDO NA PARTE DAS CONTAS A P' +
          'AGAR VENCIDAS'
        
          'select ctp.n_conta_plc, ctp.nome_for_ctp, ctp.data_ent_ctp, ctp.' +
          'tipo_ctp, ctp.n_doc_ctp,'
        
          '    ctp.historico_ctp, ctp.data_venc_ctp, ctp.valor_ctp, '#39#39' terc' +
          'eiro,'
        '    ctp.codigo_ctrl, ctp.datq_ctp,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else ctp.codigo_emp end) cod_empresa,'
        '    ctp.cod_emp_mult, ctp.tipo_ctp,'
        '    ctp.data_venc_ctp, ctp.n_doc_ctp, ctp.lote, ctp.us_cad,'
        
          '    ctp.cod_contrp, '#39'CTP'#39', ctp.cod_forn_nfe, ctp.status_ctp, ctp' +
          '.valor_ctp, coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39')'
        '    from contas_a_pagar ctp'
        '    left join empresa emp on ctp.codigo_emp = emp.cod_empresa'
        
          '    inner join controles ctr on ctr.codigo_ctrl = ctp.codigo_ctr' +
          'l and ctr.codigo_emp = ctp.codigo_emp;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW SALDOS_CTR_LANCAMENTOS('
        '    COD_LANC,'
        '    CODIGO_CTRL,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    TIPO_L,'
        '    VALOR_L,'
        '    DATA_ANT,'
        '    DATA,'
        '    VAL_SLD,'
        '    VALOR_SLD_ATUAL,'
        '    NOME_CTRL,'
        '    HISTORICO,'
        '    DOCS,'
        '    LOTE,'
        '    EXIBIR_RESUMO_FINANCEIRO)'
        'AS'
        '-- VIEW EXIBE OS SALDOS POR CONTROLE DIARIAMENTE'
        
          '-- RELATORIO "RESUMO FINANCEIRO", "ENTRADAS E SADAS POR CONTROLE' +
          ' FINANCEIRO" E "ENTRADAS E SADAS POR CONTROLE FINANCEIRO E DATA"'
        
          '    SELECT DISTINCT LANC.COD_LANC, LANC.CODIGO_CTRL, LANC.CODIGO' +
          '_EMP, LANC.COD_EMP_MULT, LANC.TIPO_L,'
        
          '    LANC.VALOR_L, (LANC.DATA -1) DATA_ANT, LANC.DATA, COALESCE(S' +
          'AL.VAL_SLD, 0) VAL_SLD,'
        
          '    COALESCE(SALT.VAL_SLD, 0) VALOR_SLD_ATUAL, CTR.NOME_CTRL, LA' +
          'NC.HISTORICO_L, CTR.DOCS,'
        
          '    (CASE WHEN (LANC.LOTE > 0) THEN LANC.LOTE  ELSE (CASE WHEN (' +
          'LANC.LOTE_QUIT >0) THEN LANC.LOTE_QUIT ELSE LANC.LOTE_ENT END) E' +
          'ND),'
        
          '    COALESCE(CTR.EXIBIR_RESUMO_FINANCEIRO, '#39'S'#39') FROM LANCAMENTOS' +
          ' LANC'
        
          '    INNER JOIN CONTROLES CTR ON CTR.CODIGO_CTRL = LANC.CODIGO_CT' +
          'RL AND CTR.CODIGO_EMP = LANC.CODIGO_EMP'
        
          '    LEFT JOIN SAL_CTRL SAL ON SAL.CODIGO_CTRL = LANC.CODIGO_CTRL' +
          ' AND SAL.DATA_SLD = (LANC.DATA - 1) AND SAL.COD_EMP = LANC.CODIG' +
          'O_EMP'
        
          '    LEFT JOIN SAL_CTRL SALT ON SALT.CODIGO_CTRL = LANC.CODIGO_CT' +
          'RL AND SALT.DATA_SLD = LANC.DATA AND SALT.COD_EMP = LANC.CODIGO_' +
          'EMP;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RESUMO_FINANCEIRO*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure RESUMO_FINANCEIRO_UNIFICADO ('
        '    PDTINI date,'
        '    PDTFIM date,'
        '    PCOD_EMPRESA integer,'
        '    PREGIMECAIXA char(1),'
        '    PTODASCONTAS char(1),'
        '    PAGRUPARUNIFADA char(1),'
        '    PCODEMPUNIFICADA integer)'
        'returns ('
        '    TPDTQUIT_DTREF integer,'
        '    TIPO_DESP varchar(10),'
        '    TIPO varchar(10),'
        '    COD_EMPRESA integer,'
        '    COD_EMP_MULT integer,'
        '    N_CONTA_PLC double precision,'
        '    DTQUIT_DTREF timestamp,'
        '    NDOC varchar(50),'
        '    VALOR double precision,'
        '    HISTORICO varchar(200),'
        '    DATA timestamp,'
        '    COD_LANC integer,'
        '    VALOR_PAGO double precision,'
        '    DESC_PADR varchar(50),'
        '    DESC_SUB_CT varchar(50),'
        '    FORNECEDOR varchar(100),'
        '    NOME_CTRL varchar(50),'
        '    EXIBIR_RESUMO_FINANCEIRO char(1),'
        '    DATA_INI timestamp,'
        '    DATA_FIM timestamp,'
        '    ATIVO integer,'
        '    ORDEM integer,'
        '    DESC_GR varchar(50),'
        '    DESC_DEP varchar(50))'
        'as'
        'declare variable VCAMPO varchar(15);'
        'declare variable VTEMP varchar(100);'
        'declare variable VTEMPCODEMP varchar(100);'
        'declare variable VTEMPTODAS varchar(2000);'
        'declare variable VFINANCEIRO_UNIFICADO char(1);'
        'declare variable VEMP_UNIFICADA integer;'
        'begin'
        '  /* Procedure Text */'
        '  VCAMPO = '#39'COD_EMPRESA'#39';'
        '  VTEMP = '#39#39';'
        '  VTEMPCODEMP = '#39#39';'
        '  VTEMPTODAS = '#39#39';'
        ''
        '  VFINANCEIRO_UNIFICADO = '#39#39';'
        '  VEMP_UNIFICADA = 0;'
        ''
        '  select codigo_unificadora, financeiro_unificado from empresa'
        
          '  where cod_empresa = :pcod_empresa into :vemp_unificada, :vfina' +
          'nceiro_unificado;'
        ''
        
          '  if ((coalesce(vfinanceiro_unificado, '#39'N'#39') = '#39'S'#39') and (vemp_uni' +
          'ficada > 0) and (pcodempunificada > 0)) then'
        '  begin'
        '    if (vemp_unificada = pcod_empresa) then'
        '      VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcodempunificada;'
        '    else'
        '      VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcod_empresa;  '
        '     VCAMPO = '#39'COD_EMP_MULT'#39';'
        '  end'
        '  else'
        '    VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcod_empresa;'
        '    '
        '  if (pregimecaixa = '#39'S'#39') then'
        '    VTEMP = '#39' and tpdtquit_dtref = 1'#39';'
        '  else'
        '    VTEMP = '#39' and tpdtquit_dtref = 2'#39';'
        ''
        '  if (ptodascontas <> '#39'S'#39') then'
        '    VTEMP = VTEMP || '#39' and trim(tipo) <> '#39#39'TODAS'#39#39' '#39';'
        ''
        '  FOR EXECUTE STATEMENT'
        '  '#39' select cod_empresa from empresa'
        '    where ativo = 1 '#39' || VTEMPCODEMP into :cod_empresa  do'
        '  begin'
        '    IF (COALESCE(PTODASCONTAS, '#39#39') = '#39'S'#39') THEN'
        '       VTEMPTODAS = '#39' union'
        
          '        select distinct 1, '#39#39'LANC'#39#39', '#39#39'TODAS'#39#39', cast('#39'||:cod_emp' +
          'resa||'#39' as integer), cast('#39'||:cod_empresa||'#39' as integer),'
        
          '        p.n_conta_plc, null datq_l, '#39#39#39#39' ndoc_l, 0 valor_l, '#39#39#39#39 +
          ' historico_l, null data, 0 cod_lanc, 0 valor_l,'
        
          '        case when trim(coalesce(p.desc_padr, '#39#39#39#39')) = '#39#39#39#39' then ' +
          'p.desc_plc else p.desc_padr end desc_padr,'
        '        s.desc_sub_ct, p.tipo_ctp, '#39#39'S'#39#39', '#39#39#39#39' nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        p.ativo, 1 ordem, c.desc_gr, ct.desc_dep from p_contas p'
        
          '        inner join grupos_ct c on p.grup_ct = c.grup_ct and c.ti' +
          'po_gr = '#39#39'S'#39#39
        '        left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct'
        '        left join depart_ct ct on ct.cod_dep = c.cod_dep'
        '        UNION'
        
          '        select distinct 2, '#39#39'LANC'#39#39', '#39#39'TODAS'#39#39', cast('#39'||:cod_emp' +
          'resa||'#39' as integer), cast('#39'||:cod_empresa||'#39' as integer),'
        
          '        p.n_conta_plc, null dtreferencia, '#39#39#39#39' ndoc_l, 0 valor_l' +
          ', '#39#39#39#39' historico_l, null data, 0 cod_lanc, 0 valor_l,'
        
          '        case when trim(coalesce(p.desc_padr, '#39#39#39#39')) = '#39#39#39#39' then ' +
          'p.desc_plc else p.desc_padr end desc_padr,'
        '        s.desc_sub_ct, p.tipo_ctp, '#39#39'S'#39#39', '#39#39#39#39' nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        p.ativo, 1 ordem, c.desc_gr, ct.desc_dep from p_contas p'
        
          '        inner join grupos_ct c on p.grup_ct = c.grup_ct and c.ti' +
          'po_gr = '#39#39'S'#39#39
        '        left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct'
        '        left join depart_ct ct on ct.cod_dep = c.cod_dep '#39';'
        ''
        '    FOR EXECUTE STATEMENT'
        
          '    '#39' select tpdtquit_dtref, tipo_desp, tipo, cod_empresa, cod_e' +
          'mp_mult,'
        '        n_conta_plc, dtquit_dtref, ndoc, valor, historico, data,'
        
          '        cod_lanc, valor_pago, desc_padr, desc_sub_ct, fornecedor' +
          ','
        '        exibir_resumo_financeiro, nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        ativo, ordem, desc_gr, desc_dep from resumo_financeiro'
        '        where ((dtquit_dtref  >= '#39#39#39'||:pdtini||'#39#39#39
        '        and dtquit_dtref <= '#39#39#39'||:pdtfim||'#39#39#39'))'
        
          '        and '#39' || :vcampo || '#39' = '#39'||:cod_empresa|| vtemp || vtemp' +
          'todas'
        ''
        
          '    into :tpdtquit_dtref, :tipo_desp, :tipo, :cod_empresa, cod_e' +
          'mp_mult,'
        
          '        :n_conta_plc, :dtquit_dtref, :ndoc, :valor, :historico, ' +
          ':data,'
        
          '        :cod_lanc, :valor_pago, :desc_padr, :desc_sub_ct, :forne' +
          'cedor,'
        '        :exibir_resumo_financeiro, :nome_ctrl,'
        
          '        :data_ini, :data_fim, :ativo, :ordem, :desc_gr, :desc_de' +
          'p do'
        '     begin'
        '        if (trim(coalesce(pagruparunifada, '#39#39')) = '#39'S'#39') then '
        '          cod_empresa = pcod_empresa;'
        ''
        '        if (tpdtquit_dtref is not null) then'
        '          suspend;'
        '     end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_RECIBOS_UNIFICADA FOR RECIBOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  /* Trigger text */'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        '  if (inserting) then'
        '  begin'
        '    if (new.cod_emp_mult is null) then'
        '      new.cod_emp_mult = new.cod_empresa;'
        '  end'
        '  else if (updating) then'
        '    if (new.cod_emp_mult is null) then'
        '      new.cod_emp_mult = new.cod_empresa;'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|UPDATE CONTROLE_CHEQUE SET COD_EMP_LOTE = CODIGO_EMP WH' +
          'ERE COD_EMP_LOTE IS NULL AND TIP_BAIXA = '#39'C'#39' AND DATQ_CH IS NOT ' +
          'NULL;'
        
          'CMD:REPL|UPDATE CONTROLE_CREDITOS SET COD_EMP_LOTE = CODIGO_EMP ' +
          'WHERE COD_EMP_LOTE IS NULL AND TIP_BAIXA = '#39'C'#39' AND DATQ_C IS NOT' +
          ' NULL;'
        
          'CMD:REPL|UPDATE BAIXA_CREDITOS SET COD_EMP_LOTE = CODIGO_EMP WHE' +
          'RE COD_EMP_LOTE IS NULL AND TIP_BAIXA = '#39'C'#39' AND DATQ_C IS NOT NU' +
          'LL;'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'LIBER PERC' +
          '/VALOR DESC ITEM ACIMA DO PERM PRODUTO'#39' WHERE COD_PROCESSO = '#39'VN' +
          'D240'#39';'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW DESPMES('
        '    CD_GRUPO,'
        '    DESC_GRUPO,'
        '    DATA_LANC,'
        '    DTREFERENCIA,'
        '    VALOR_LANC,'
        '    CONT_INT,'
        '    LOTE,'
        '    COD_DEP,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT)'
        'AS'
        
          'select c.grup_ct,c.desc_gr,l.datq_l,l.dtreferencia,l.valor_l,l.c' +
          'od_lanc,l.lote,c.cod_dep,l.codigo_emp,l.cod_emp_mult from Lancam' +
          'entos l,p_contas p,'
        'grupos_ct c where l.n_conta_plc = p.n_conta_plc and p.grup_ct = '
        'c.grup_ct and c.tipo_gr = '#39'S'#39' and l.lote is null and p.ativo = 1'
        'union'
        
          'select c.grup_ct,c.desc_gr,ctr.datq_ctp,ctr.dtreferencia,ctr.val' +
          'or_pago,ctr.cod_contrp,ctr.lote,c.cod_dep,ctr.codigo_emp,ctr.cod' +
          '_emp_mult from'
        
          'contas_a_pagar ctr,p_contas p,grupos_ct c where ctr.n_conta_plc ' +
          '= '
        'p.n_conta_plc and p.grup_ct = c.grup_ct '
        'and c.tipo_gr = '#39'S'#39' and ctr.lote is not null and p.ativo = 1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW MAPA_DESP_ANAL('
        '    TPDTQUIT_DTREF,'
        '    N_CONTA_PLC,'
        '    VALOR_L,'
        '    DESC_GR,'
        '    TIPO_GR,'
        '    HISTORICO_L,'
        '    DATA_REL,'
        '    DATA,'
        '    DTREFERENCIA,'
        '    GRUP_CT,'
        '    COD_LANC,'
        '    MES_MAPA,'
        '    DESC_P,'
        '    VALOR_CONTABIL,'
        '    MES_MAPA_REF,'
        '    DESC_DEP,'
        '    DESC_SUB_CT,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    IDENTIFICACAO_EMP,'
        '    CGC_EMP,'
        '    FINANCEIRO_UNIFICADO,'
        '    CODIGO_UNIFICADORA,'
        '    COD_CTA,'
        '    NOME_CTA)'
        'AS'
        'select'
        '    1 tpdtquit_dtref,'
        '    mapa_desp.n_conta_plc,'
        '    mapa_desp.valor_l,'
        '    mapa_desp.desc_gr,'
        '    mapa_desp.tipo_gr,'
        '    mapa_desp.historico_l,'
        '    mapa_desp.data, '
        '    mapa_desp.data,'
        '    mapa_desp.dtreferencia,'
        '    mapa_desp.grup_ct,'
        '    mapa_desp.cod_lanc,'
        '    mapa_desp.mes_mapa,'
        '    mapa_desp.desc_p,'
        '    mapa_desp.valor_contabil,'
        '    mapa_desp.mes_mapa_ref,'
        '    depart_ct.desc_dep,'
        '    sub_grup_ct.desc_sub_ct,'
        '    mapa_desp.codigo_emp,'
        '    mapa_desp.cod_emp_mult,'
        '    empresa.identificacao_emp,'
        '    empresa.cgc_emp,'
        '    empresa.financeiro_unificado,'
        '    empresa.codigo_unificadora,'
        '    p_contas_contabil.cod_cta,'
        '    p_contas_contabil.nome_cta'
        '    from mapa_desp'
        
          '    inner join grupos_ct on grupos_ct.grup_ct = mapa_desp.grup_c' +
          't'
        
          '    inner join depart_ct on depart_ct.cod_dep = mapa_desp.cod_de' +
          'p'
        
          '    inner join sub_grup_ct on sub_grup_ct.cod_sub_ct = mapa_desp' +
          '.cd_subgrupo'
        
          '    inner join empresa on empresa.cod_empresa = mapa_desp.cod_em' +
          'p_mult'
        
          '    inner join p_contas on p_contas.n_conta_plc = mapa_desp.n_co' +
          'nta_plc'
        
          '    left join p_contas_contabil on p_contas_contabil.cod_cta = p' +
          '_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = emp' +
          'resa.cod_empresa'
        '    '
        '    union'
        '    '
        '    select'
        '    2 tpdtquit_dtref,'
        '    mapa_desp.n_conta_plc,'
        '    mapa_desp.valor_l,'
        '    mapa_desp.desc_gr,'
        '    mapa_desp.tipo_gr,'
        '    mapa_desp.historico_l,'
        '    mapa_desp.dtreferencia,'
        '    mapa_desp.data,'
        '    mapa_desp.dtreferencia,'
        '    mapa_desp.grup_ct,'
        '    mapa_desp.cod_lanc,'
        '    mapa_desp.mes_mapa,'
        '    mapa_desp.desc_p,'
        '    mapa_desp.valor_contabil,'
        '    mapa_desp.mes_mapa_ref,'
        '    depart_ct.desc_dep,'
        '    sub_grup_ct.desc_sub_ct,'
        '    mapa_desp.codigo_emp,'
        '    mapa_desp.cod_emp_mult,'
        '    empresa.identificacao_emp,'
        '    empresa.cgc_emp,'
        '    empresa.financeiro_unificado,'
        '    empresa.codigo_unificadora,'
        '    p_contas_contabil.cod_cta,'
        '    p_contas_contabil.nome_cta'
        '    from mapa_desp'
        
          '    inner join grupos_ct on grupos_ct.grup_ct = mapa_desp.grup_c' +
          't'
        
          '    inner join depart_ct on depart_ct.cod_dep = mapa_desp.cod_de' +
          'p'
        
          '    inner join sub_grup_ct on sub_grup_ct.cod_sub_ct = mapa_desp' +
          '.cd_subgrupo'
        
          '    inner join empresa on empresa.cod_empresa = mapa_desp.cod_em' +
          'p_mult'
        
          '    inner join p_contas on p_contas.n_conta_plc = mapa_desp.n_co' +
          'nta_plc'
        
          '    left join p_contas_contabil on p_contas_contabil.cod_cta = p' +
          '_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = emp' +
          'resa.cod_empresa;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure INCREMENTA_WS ('
        '    VCOD_EMPRESA integer,'
        '    VTABELA varchar(32),'
        '    VSEQUENCIA varchar(32))'
        'returns ('
        '    COD integer)'
        'as'
        'declare variable TAB varchar(32);'
        'BEGIN '
        
          '     EXECUTE STATEMENT '#39'SELECT GEN_ID('#39'||:VSEQUENCIA||'#39', 1) FROM' +
          ' RDB$DATABASE'#39' INTO :cod; '
        '     if (coalesce(cod, 0) <= 1) then'
        '     BEGIN '
        
          '       SELECT MAX(VALOR) FROM CODIGO WHERE TABELA = :VTABELA INT' +
          'O :cod; '
        '       if (coalesce(cod, 0) > 0) then'
        '       BEGIN'
        
          '         EXECUTE STATEMENT '#39'ALTER SEQUENCE '#39'||:VSEQUENCIA||'#39' RES' +
          'TART WITH '#39'|| CAST(:cod AS VARCHAR(128));'
        
          '         EXECUTE STATEMENT '#39'SELECT GEN_ID('#39'||:VSEQUENCIA||'#39', 1) ' +
          'FROM RDB$DATABASE'#39' INTO :cod;'
        '       END'
        '       else'
        '       BEGIN'
        
          '         EXECUTE STATEMENT '#39'ALTER SEQUENCE '#39'||:VSEQUENCIA||'#39' RES' +
          'TART WITH 0 '#39';'
        
          '         EXECUTE STATEMENT '#39'SELECT GEN_ID('#39'||:VSEQUENCIA||'#39', 1) ' +
          'FROM RDB$DATABASE'#39' INTO :cod;'
        '       END'
        '    END '
        '    SUSPEND; '
        'END;'
        '|/BLOCO|'
        ''
        'ALTER TABLE CLIENTES ADD CL_GERAR_PONTOS CHAR(1) DEFAULT '#39'S'#39';'
        
          'CMD:REPL|UPDATE CLIENTES SET CL_GERAR_PONTOS = '#39'S'#39' WHERE CL_GERA' +
          'R_PONTOS IS NULL;'
        ''
        '|BLOCO|'
        'create or alter procedure FORMAS_PROG_FID_DET ('
        '    PDTINI timestamp,'
        '    PDTFIM timestamp,'
        '    PCOD_CLIENTE integer,'
        '    PCOD_EMPRESA integer,'
        '    PREGRA varchar(60),'
        '    PNDOC integer,'
        '    PTIPO char(3),'
        '    PSIMULACAO char(1))'
        'returns ('
        '    NREQUISICAO integer,'
        '    TPDOCS varchar(3),'
        '    DATA_FECH timestamp,'
        '    COD_EMPRESA integer,'
        '    VALORENTRADA double precision,'
        '    VALORTOTAL double precision,'
        '    DEV double precision,'
        '    CRED char(1),'
        '    FP_REGRA_FIDELIDADE varchar(20),'
        '    PERC_DIA_REAL double precision,'
        '    PONTOS double precision)'
        'as'
        'declare variable VTEMP varchar(100);'
        'declare variable VTEMP2 varchar(100);'
        'declare variable VTEMP3 varchar(100);'
        'declare variable VPERC_ENT double precision;'
        'begin'
        '  VTEMP = '#39#39';'
        '  VTEMP2 = '#39#39';'
        '  VTEMP3 = '#39#39';'
        ''
        '  if (COALESCE(PNDOC, 0) > 0) then'
        '  begin'
        
          '    VTEMP = '#39' and pd.nped = '#39'||:pndoc||'#39' and pd.tipo = '#39#39#39'||:pti' +
          'po||'#39#39#39' '#39';'
        '    VTEMP2 = '#39' and cf.n_comando = '#39'||:pndoc||'#39' '#39';'
        '  end'
        '  else'
        '  begin'
        
          '    VTEMP = '#39' and pd.data_fech >= '#39#39#39'||:pdtini||'#39#39#39' and pd.data_' +
          'fech <= '#39#39#39'||:pdtfim||'#39#39#39' '#39';'
        
          '    VTEMP2 = '#39' and cf.data_fech >= '#39#39#39'||:pdtini||'#39#39#39' and cf.data' +
          '_fech <= '#39#39#39'||:pdtfim||'#39#39#39' '#39';'
        '  end'
        ''
        '  if (COALESCE(psimulacao,  '#39#39') = '#39'S'#39') then'
        '  begin'
        
          '    VTEMP3 = '#39' and (select ndev from existe_dev_nf_v(cf.cod_nf, ' +
          'cf.cod_empresa)) = 0 '#39';'
        '  end'
        ''
        '  for execute statement    '
        '  '#39' select pd.nped, pd.tipo, pd.cod_empresa, pd.data_fech,'
        
          '    coalesce((select coalesce(fp3.entrada, 0) from existe_formas' +
          '(pd.nped, pd.tipo, pd.cod_empresa) fp3), 0) entrada,'
        
          '    coalesce((select coalesce(fp2.valor_total, 0) from existe_fo' +
          'rmas(pd.nped, pd.tipo, pd.cod_empresa) fp2), 0) valor_total,'
        
          '    coalesce((select coalesce(fp1.crediario, '#39#39'N'#39#39') from existe_' +
          'formas'
        '      (pd.nped, pd.tipo, pd.cod_empresa) fp1), '#39#39'N'#39#39') crediario,'
        
          '    coalesce((select coalesce(dp.valor_dev, 0) from devolucao_np' +
          'ed (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) dev from pedvenda ' +
          'pd'
        
          '    inner join clientes cl on cl.cod_cliente = pd.cod_cliente an' +
          'd cl.cod_empresa = pd.cod_empresa'
        
          '    left join tipo_faturamento tf on tf.codigo_faturamento = cl.' +
          'codigo_faturamento and tf.ativo = 1'
        
          '    inner join tipo_vendas tv on pd.tipo = tv.tipo and pd.tipv =' +
          ' tv.sigla'
        
          '        and coalesce(pd.tp_venda, tv.venda) = '#39#39'S'#39#39' and coalesce' +
          '(pd.tp_gerar_pontos, tv.gerar_pontos) = '#39#39'S'#39#39
        
          '    where trim(pd.tipo) = '#39#39'REQ'#39#39' and coalesce(pd.status_ped, '#39#39 +
          #39#39') = '#39#39'FECHADA'#39#39
        '    '#39'||VTEMP||'#39' and pd.cod_empresa = '#39'||:pcod_empresa||'#39
        '    and (coalesce(pd.valor_total, 0) >'
        
          '        coalesce((select coalesce(abs(dp.valor_dev), 0) from dev' +
          'olucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0))'
        '    and (coalesce(pd.valor_total, 0) >'
        
          '        coalesce((select coalesce(abs(vl.valor_vale), 0) from va' +
          'le_doc_prg (pd.nped, pd.tipo, pd.cod_empresa) vl), 0))'
        '    and coalesce(cl.cl_gerar_pontos, '#39#39'S'#39#39') <> '#39#39'N'#39#39
        '    and coalesce(tf.status_f, '#39#39#39#39') <> '#39#39'BARRADO'#39#39
        '    and pd.cod_cliente <> '#39'||:pcod_cliente||'#39
        '    '
        '    union'
        ''
        '    select pd.nped, pd.tipo, pd.cod_empresa, pd.data_fech,'
        
          '    coalesce((select coalesce(fp3.entrada, 0) from existe_formas' +
          '(pd.nped, pd.tipo, pd.cod_empresa) fp3), 0) entrada,'
        
          '    coalesce((select coalesce(fp2.valor_total, 0) from existe_fo' +
          'rmas(pd.nped, pd.tipo, pd.cod_empresa) fp2), 0) valor_total,'
        
          '    coalesce((select coalesce(fp1.crediario, '#39#39'N'#39#39') from existe_' +
          'formas'
        '      (pd.nped, pd.tipo, pd.cod_empresa) fp1), '#39#39'N'#39#39') crediario,'
        
          '     coalesce((select coalesce(dp.valor_dev, 0) from devolucao_n' +
          'ped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) dev from pedvenda' +
          ' pd'
        
          '    inner join clientes cl on cl.cod_cliente = pd.cod_cliente an' +
          'd cl.cod_empresa = pd.cod_empresa'
        
          '    left join tipo_faturamento tf on tf.codigo_faturamento = cl.' +
          'codigo_faturamento and tf.ativo = 1'
        
          '    inner join tipo_vendas tv on pd.tipo = tv.tipo and pd.tipo_o' +
          's = tv.tipo_os'
        
          '        and coalesce(pd.tp_venda, tv.venda) = '#39#39'S'#39#39' and coalesce' +
          '(pd.tp_gerar_pontos, tv.gerar_pontos) = '#39#39'S'#39#39
        
          '    where trim(pd.tipo) = '#39#39'OS'#39#39' and coalesce(pd.status_ped, '#39#39#39 +
          #39') = '#39#39'FECHADA'#39#39
        '    '#39'||VTEMP||'#39' and pd.cod_empresa = '#39'||:pcod_empresa||'#39
        
          '    and coalesce(pd.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos' +
          ', '#39#39'S'#39#39')) <> '#39#39'N'#39#39
        '    and (coalesce(pd.valor_total, 0) >'
        
          '        coalesce((select coalesce(abs(dp.valor_dev), 0) from dev' +
          'olucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0))'
        '    and (coalesce(pd.valor_total, 0) >'
        
          '        coalesce((select coalesce(abs(vl.valor_vale), 0) from va' +
          'le_doc_prg (pd.nped, pd.tipo, pd.cod_empresa) vl), 0))'
        '    and coalesce(cl.cl_gerar_pontos, '#39#39'S'#39#39') <> '#39#39'N'#39#39
        '    and coalesce(tf.status_f, '#39#39#39#39') <> '#39#39'BARRADO'#39#39
        '    and pd.cod_cliente <> '#39'||:pcod_cliente||'#39
        '    '
        '    union'
        
          '    select cf.n_comando, '#39#39'MOT'#39#39' as tipo, cf.cod_empresa, cf.dat' +
          'a_fech,'
        ''
        
          '    coalesce((select coalesce(fp3.entrada, 0) from existe_formas' +
          '(cf.n_comando, '#39#39'MOT'#39#39', cf.cod_empresa) fp3), 0) entrada,'
        
          '    coalesce((select coalesce(fp2.valor_total, 0) from existe_fo' +
          'rmas(cf.n_comando, '#39#39'MOT'#39#39', cf.cod_empresa) fp2), 0) valor_total' +
          ','
        
          '    coalesce((select coalesce(fp1.crediario, '#39#39'N'#39#39') from existe_' +
          'formas'
        
          '      (cf.n_comando, '#39#39'MOT'#39#39', cf.cod_empresa) fp1), '#39#39'N'#39#39') credi' +
          'ario,'
        '    0 dev from com_fat cf'
        
          '    inner join clientes cl on cl.cod_cliente = cf.clientes_v and' +
          ' cl.cod_empresa = cf.cod_empresa'
        
          '    left join tipo_faturamento tf on tf.codigo_faturamento = cl.' +
          'codigo_faturamento and tf.ativo = 1 '
        
          '    inner join tipo_vendas tv on tv.tipo = '#39#39'VEI'#39#39' and tv.tipo_o' +
          's = cf.tipo_v'
        
          '        and coalesce(cf.tp_venda, tv.venda) = '#39#39'S'#39#39' and coalesce' +
          '(cf.tp_gerar_pontos, tv.gerar_pontos) = '#39#39'S'#39#39
        '    where cf.status_v = '#39#39'FECHADO'#39#39' and cf.natureza = '#39#39'S'#39#39
        '    '#39'||VTEMP2||'#39' and cf.cod_empresa = '#39'||:pcod_empresa||'#39
        '    and coalesce(cl.cl_gerar_pontos, '#39#39'S'#39#39') <> '#39#39'N'#39#39
        '    and coalesce(tf.status_f, '#39#39#39#39') <> '#39#39'BARRADO'#39#39
        '    '#39'||VTEMP3||'#39
        '    and (coalesce(cf.valtot_v, 0) >'
        
          '        coalesce((select coalesce(abs(vl.valor_vale), 0) from va' +
          'le_doc_prg (cf.n_comando, '#39#39'MOT'#39#39', cf.cod_empresa) vl), 0))'
        '    and cf.clientes_v <> '#39'||:pcod_cliente'
        ''
        
          '  into: nrequisicao, :tpdocs, :cod_empresa, :data_fech, :valoren' +
          'trada, :valortotal, :cred, :dev DO'
        '  begin'
        '     vperc_ent = 0;'
        '     if (coalesce(valortotal, 0) > 0) then'
        '       vperc_ent = ((valorentrada / valortotal) * 100);'
        '     fp_regra_fidelidade = '#39#39';'
        '     perc_dia_real = 0;'
        '     pontos = 0;'
        ''
        '     if (coalesce(valortotal, 0) > 0) then'
        '     begin'
        '       if ((coalesce(cred, '#39'N'#39') = '#39'N'#39')'
        
          '         and (coalesce(valorentrada, 0) = coalesce(valortotal, 0' +
          '))) then'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.pontos, 0) from regras_prog_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         inner join controles ctr on trim(ctr.fp_regra_fidelidad' +
          'e) = trim(crf.valor_vc) and ctr.codigo_emp = crf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39
        
          '         and crf.valor_vc = '#39'DIN'#39' and rf.cod_empresa = :cod_empr' +
          'esa'
        '         order by crf.pontos asc'
        '          into :fp_regra_fidelidade, :pontos;'
        '         if (coalesce(fp_regra_fidelidade, '#39#39') <> '#39#39') then'
        '           suspend;'
        '       end'
        '       else if (coalesce(cred, '#39'N'#39') = '#39'N'#39') then'
        '       begin'
        
          '         select first 1 trim(coalesce(ctr.fp_regra_fidelidade, '#39 +
          #39')), coalesce(crf.pontos, 0) from formpagamento fp'
        
          '         inner join controles ctr on ctr.codigo_ctrl = fp.cod_co' +
          'ntrole and ctr.codigo_emp = fp.cod_empresa'
        
          '         inner join config_regras_prog_fidelidade crf on crf.val' +
          'or_vc = ctr.fp_regra_fidelidade and crf.cod_empresa = ctr.codigo' +
          '_emp'
        
          '         inner join regras_prog_fidelidade rf on rf.cod_tp_regra' +
          ' = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.' +
          'descricao_regra = :pregra'
        
          '         where fp.nrequisicao = :nrequisicao and fp.tpdocs = :tp' +
          'docs and fp.cod_empresa = :cod_empresa'
        '         order by crf.pontos asc'
        '          into :fp_regra_fidelidade, :pontos;'
        '         if (coalesce(fp_regra_fidelidade, '#39#39') <> '#39#39') then'
        '           suspend;'
        '       end'
        '       else if (coalesce(vperc_ent, 0) > 0) then'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.perc_dia_real, 0), coalesce(crf.pontos, 0) from regras_pr' +
          'og_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         inner join controles ctr on trim(ctr.fp_regra_fidelidad' +
          'e) = '#39'CR'#39' and ctr.codigo_emp = crf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39
        
          '         and crf.valor_vc = '#39'CRX'#39' and rf.cod_empresa = :cod_empr' +
          'esa'
        '         and crf.perc_dia_real <= :vperc_ent'
        '         order by crf.perc_dia_real desc'
        '          into :fp_regra_fidelidade, :perc_dia_real, :pontos;'
        '         if (trim(coalesce(fp_regra_fidelidade, '#39#39')) = '#39#39') then'
        '         begin'
        
          '           select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coal' +
          'esce(crf.perc_dia_real, 0), coalesce(crf.pontos, 0) from regras_' +
          'prog_fidelidade rf'
        
          '           inner join config_regras_prog_fidelidade crf on crf.c' +
          'od_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empre' +
          'sa'
        
          '           inner join controles ctr on trim(ctr.fp_regra_fidelid' +
          'ade) = '#39'CR'#39' and ctr.codigo_emp = crf.cod_empresa'
        
          '           where rf.descricao_regra = :pregra and rf.situacao = ' +
          #39'ATIVA'#39
        
          '           and crf.valor_vc = '#39'CRC'#39' and rf.cod_empresa = :cod_em' +
          'presa'
        '             into :fp_regra_fidelidade, :perc_dia_real, :pontos;'
        '         end'
        '         if (trim(coalesce(fp_regra_fidelidade, '#39#39')) = '#39#39') then'
        '         begin'
        
          '           select first 1 trim(coalesce(ctr.fp_regra_fidelidade,' +
          ' '#39#39')), coalesce(crf.pontos, 0) from formpagamento fp'
        
          '           inner join controles ctr on ctr.codigo_ctrl = fp.cod_' +
          'controle and ctr.codigo_emp = fp.cod_empresa'
        
          '           inner join config_regras_prog_fidelidade crf on crf.v' +
          'alor_vc = ctr.fp_regra_fidelidade and crf.cod_empresa = ctr.codi' +
          'go_emp'
        
          '           inner join regras_prog_fidelidade rf on rf.cod_tp_reg' +
          'ra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and r' +
          'f.descricao_regra = :pregra'
        
          '           where fp.nrequisicao = :nrequisicao and fp.tpdocs = :' +
          'tpdocs and fp.cod_empresa = :cod_empresa'
        '           order by crf.pontos asc'
        '            into :fp_regra_fidelidade, :pontos;'
        '         end'
        '         if (coalesce(fp_regra_fidelidade, '#39#39') <> '#39#39') then'
        '           suspend;'
        '       end'
        '       else'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.perc_dia_real, 0), coalesce(crf.pontos, 0) from regras_pr' +
          'og_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         inner join controles ctr on trim(ctr.fp_regra_fidelidad' +
          'e) = '#39'CR'#39' and ctr.codigo_emp = crf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39
        
          '         and crf.valor_vc = '#39'CRS'#39' and rf.cod_empresa = :cod_empr' +
          'esa'
        '          into :fp_regra_fidelidade, :perc_dia_real, :pontos;'
        '         if (trim(coalesce(fp_regra_fidelidade, '#39#39')) = '#39#39') then'
        '         begin'
        
          '           select first 1 trim(coalesce(ctr.fp_regra_fidelidade,' +
          ' '#39#39')), coalesce(crf.pontos, 0) from formpagamento fp'
        
          '           inner join controles ctr on ctr.codigo_ctrl = fp.cod_' +
          'controle and ctr.codigo_emp = fp.cod_empresa'
        
          '           inner join config_regras_prog_fidelidade crf on crf.v' +
          'alor_vc = ctr.fp_regra_fidelidade and crf.cod_empresa = ctr.codi' +
          'go_emp'
        
          '           inner join regras_prog_fidelidade rf on rf.cod_tp_reg' +
          'ra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and r' +
          'f.descricao_regra = :pregra'
        
          '           where fp.nrequisicao = :nrequisicao and fp.tpdocs = :' +
          'tpdocs and fp.cod_empresa = :cod_empresa'
        '           order by crf.pontos asc'
        '            into :fp_regra_fidelidade, :pontos;'
        '         end'
        '         if (coalesce(fp_regra_fidelidade, '#39#39') <> '#39#39') then'
        '           suspend;'
        '       end'
        '     end'
        '     if (coalesce(fp_regra_fidelidade, '#39#39') = '#39#39') then'
        '       suspend;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure REC_PREST_PROG_FID_DET ('
        '    PDTINI timestamp,'
        '    PDTFIM timestamp,'
        '    PCODCLIENTE integer,'
        '    PCOD_EMPRESA integer,'
        '    PREGRA varchar(60),'
        '    PCOD_CRED integer)'
        'returns ('
        '    COD_CRED integer,'
        '    DATQ_C timestamp,'
        '    DATA_VENC_C timestamp,'
        '    COD_EMPRESA integer,'
        '    DIAS double precision,'
        '    TIPO varchar(10),'
        '    PERC_DIA_REAL double precision,'
        '    CARENCIA double precision)'
        'as'
        'declare variable VCARENCIA integer;'
        'declare variable VPERC_ENT double precision;'
        'declare variable VCRED integer;'
        'declare variable VTEMP varchar(100);'
        'begin'
        '  VTEMP = '#39#39';'
        '  if (COALESCE(PCOD_CRED, 0) > 0) then'
        '  begin'
        '    VTEMP = '#39' cr.cod_cred = '#39'||:pcod_cred||'#39' '#39';'
        '  end'
        '  else'
        '  begin'
        
          '    VTEMP = '#39' cr.dia_cxl >= '#39#39#39'||:pdtini||'#39#39#39' and cr.dia_cxl <= ' +
          #39#39#39'||:pdtfim||'#39#39#39' '#39';'
        '  end'
        ''
        '  for execute statement'
        
          '   '#39' select cr.cod_cred, cr.dia_cxl, cr.data_venc_c, cr.codigo_e' +
          'mp, emp.dias_car_juros from controle_creditos cr'
        
          '    inner join clientes cl on cr.cod_cliente = cl.cod_cliente an' +
          'd cr.cod_emp_mult = cl.cod_empresa'
        
          '    inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ct' +
          'rl and cr.codigo_emp = ctrl.codigo_emp'
        '    inner join empresa emp on emp.cod_empresa = cr.codigo_emp'
        
          '    left join pedvenda pd on cr.n_doc_v = pd.nped and cr.tp_doc_' +
          'v = pd.tipo and cr.codigo_emp = pd.cod_empresa'
        
          '    left join tipo_vendas tpreq on trim(tpreq.tipo) = '#39#39'REQ'#39#39' an' +
          'd tpreq.sigla = pd.tipv'
        
          '    left join tipo_vendas tpord on trim(tpord.tipo) = '#39#39'OS'#39#39' and' +
          ' tpord.tipo_os = pd.tipo_os'
        
          '    left join com_fat cf on cr.n_doc_v = cf.n_comando and cr.tp_' +
          'doc_v = '#39#39'MOT'#39#39' and cr.codigo_emp = cf.cod_empresa'
        
          '    left join tipo_vendas tpv on trim(tpv.tipo) = '#39#39'VEI'#39#39' and tp' +
          'v.tipo_os = cf.tipo_v'
        
          '    left join tipo_faturamento tf on tf.codigo_faturamento = cl.' +
          'codigo_faturamento and tf.ativo = 1 '
        '    where '#39'||VTEMP||'#39
        '    and ctrl.entra_prest_cxl = '#39#39'S'#39#39
        '    and cr.codigo_emp = '#39'||:pcod_empresa||'#39
        '    and cr.tp_doc_v in ('#39#39'REQ'#39#39', '#39#39'OS'#39#39', '#39#39'MOT'#39#39')'
        '    and (coalesce((select count(*) from formpagamento fp'
        
          '    where fp.nrequisicao = cr.lote_cxl and fp.tpdocs = '#39#39'PRE'#39#39' a' +
          'nd fp.cod_empresa = cr.codigo_emp), 0) > 0)'
        '    and (case when (cr.tp_doc_v = '#39#39'MOT'#39#39') then'
        
          '                coalesce(cf.tp_venda, coalesce(tpv.venda, '#39#39'N'#39#39')' +
          ')'
        '              else'
        '                case when (pd.tipo = '#39#39'REQ'#39#39') then'
        
          '                       coalesce(pd.tp_venda, coalesce(tpreq.vend' +
          'a, '#39#39'N'#39#39'))'
        '                     else'
        
          '                       coalesce(pd.tp_venda, coalesce(tpord.vend' +
          'a, '#39#39'N'#39#39'))'
        '                end'
        '        end) = '#39#39'S'#39#39
        '    and (case when (cr.tp_doc_v = '#39#39'MOT'#39#39') then'
        
          '                 coalesce(cf.tp_gerar_pontos, coalesce(tpv.gerar' +
          '_pontos, '#39#39'N'#39#39'))'
        '               else'
        '                 case when (pd.tipo = '#39#39'REQ'#39#39') then'
        
          '                        coalesce(pd.tp_gerar_pontos, coalesce(tp' +
          'req.gerar_pontos, '#39#39'N'#39#39'))'
        '                      else'
        
          '                        coalesce(pd.tp_gerar_pontos, coalesce(tp' +
          'ord.gerar_pontos, '#39#39'N'#39#39'))'
        '                 end'
        '         end) = '#39#39'S'#39#39
        '    and coalesce(cl.cl_gerar_pontos, '#39#39'S'#39#39') <> '#39#39'N'#39#39
        '    and coalesce(tf.status_f, '#39#39#39#39') <> '#39#39'BARRADO'#39#39
        '    and cr.cod_cliente <> '#39'||:pcodcliente'
        
          '  into :cod_cred, :datq_c, :data_venc_c, :cod_empresa, :carencia' +
          ' do'
        '  begin'
        '     dias = abs(:datq_c - :data_venc_c);'
        '     tipo = '#39#39';'
        ''
        
          '     if ((coalesce(:carencia, 0) > 0) and (:datq_c > :data_venc_' +
          'c) and ((:datq_c - :data_venc_c) <= coalesce(:vcarencia, 0))) th' +
          'en'
        '     begin'
        
          '       select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coalesce' +
          '(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '       inner join config_regras_prog_fidelidade crf on crf.cod_t' +
          'p_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '       where rf.descricao_regra = :pregra and rf.cod_empresa = :' +
          'pcod_empresa'
        '       and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PC'#39
        '         into :tipo, :perc_dia_real;'
        '     end'
        '     else if (:datq_c = :data_venc_c) then'
        '     begin'
        
          '       select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coalesce' +
          '(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '       inner join config_regras_prog_fidelidade crf on crf.cod_t' +
          'p_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '       where rf.descricao_regra = :pregra and rf.situacao = '#39'ATI' +
          'VA'#39' and rf.cod_empresa = :pcod_empresa'
        '       and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PDV'#39
        '         into :tipo, :perc_dia_real;'
        '     end'
        '     else if (:datq_c > :data_venc_c) then'
        '     begin'
        
          '       select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coalesce' +
          '(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '       inner join config_regras_prog_fidelidade crf on crf.cod_t' +
          'p_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '       where rf.descricao_regra = :pregra and rf.situacao = '#39'ATI' +
          'VA'#39' and rf.cod_empresa = :pcod_empresa'
        
          '       and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PTX'#39' and coalesce' +
          '(crf.perc_dia_real, 0) <= :dias'
        '       order by crf.perc_dia_real desc'
        '         into :tipo, :perc_dia_real;'
        ''
        '       if (trim(coalesce(tipo, '#39#39')) = '#39#39') then'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39' and rf.cod_empresa = :pcod_empresa'
        '         and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PT'#39
        '          into :tipo, :perc_dia_real;'
        '       end'
        '     end'
        '     else'
        '     begin'
        
          '       select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coalesce' +
          '(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '       inner join config_regras_prog_fidelidade crf on crf.cod_t' +
          'p_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '       where rf.descricao_regra = :pregra and rf.situacao = '#39'ATI' +
          'VA'#39' and rf.cod_empresa = :pcod_empresa'
        
          '       and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PAX'#39' and coalesce' +
          '(crf.perc_dia_real, 0) <= :dias'
        '       order by crf.perc_dia_real desc'
        '         into :tipo, :perc_dia_real;'
        ''
        '       if (trim(coalesce(tipo, '#39#39')) = '#39#39') then'
        '       begin'
        
          '         select first 1 trim(coalesce(crf.valor_vc, '#39#39')), coales' +
          'ce(crf.perc_dia_real, 0) from regras_prog_fidelidade rf'
        
          '         inner join config_regras_prog_fidelidade crf on crf.cod' +
          '_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa'
        
          '         where rf.descricao_regra = :pregra and rf.situacao = '#39'A' +
          'TIVA'#39' and rf.cod_empresa = :pcod_empresa'
        '         and trim(coalesce(crf.valor_vc, '#39#39')) = '#39'PA'#39
        '          into :tipo, :perc_dia_real;'
        '       end'
        '     end'
        '     if (trim(coalesce(tipo, '#39#39')) <> '#39#39') then'
        '       suspend;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE PEDVENDA ADD CL_GERAR_PONTOS CHAR(1);'
        'ALTER TABLE COM_FAT ADD CL_GERAR_PONTOS CHAR(1);'
        'ALTER TABLE DEVOLUCAO ADD CL_GERAR_PONTOS CHAR(1);'
        'ALTER TABLE NOTAFISCAL ADD CL_GERAR_PONTOS CHAR(1);'
        'ALTER TABLE CONTROLE_CREDITOS ADD CL_GERAR_PONTOS CHAR(1);'
        'ALTER TABLE CONTROLE_CREDITOS ADD CL_CLULTIMACOMPRA CHAR(2);'
        'ALTER TABLE CONTROLE_CREDITOS ADD CL_STATUS_F CHAR(10);'
        'ALTER TABLE BAIXA_CREDITOS ADD CL_GERAR_PONTOS CHAR(1);'
        'ALTER TABLE BAIXA_CREDITOS ADD CL_CLULTIMACOMPRA CHAR(2);'
        'ALTER TABLE BAIXA_CREDITOS ADD CL_STATUS_F CHAR(10);'
        
          'ALTER TABLE COBREBEM ADD OUTRAS_CONFIG_BOL BLOB SUB_TYPE 1 SEGME' +
          'NT SIZE 1024;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BOL039'#39', :COD_EMPRESA, '#39'VI' +
          'NCULAR CREDITO A BOLETA COM DATA VENC DIFERENTE'#39', 5, '#39'FRMCADBOLE' +
          'TOS'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET SENHA_GERENTE = '#39'S'#39' WHERE C' +
          'OD_PROCESSO = '#39'BOL027'#39';'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW PRODISENTO_PISCOFINS*/'
        '|/BLOCO|'
        ''
        'ALTER TABLE EMPRESA ADD EMAIL_USATLS CHAR(1);'
        
          'CMD:REPL|UPDATE EMPRESA SET EMAIL_USATLS = EMAIL_USASSL WHERE CO' +
          'D_EMPRESA = :COD_EMPRESA AND EMAIL_USATLS IS NULL;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO335'#39', :COD_EMPRESA, '#39'BT' +
          ' IMPRIMIR REL INVENTARIO PROD'#39', 3, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'N'#39 +
          ', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND251'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR CLIENTE VND/OS (PROG FID)'#39', 5, '#39'S'#39', '#39'FRMCADPEDVENDA'#39', 1, '#39 +
          'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ALTERAR CL' +
          'IENTE VND/OS (PROG FID)'#39', NIVEL_PROCESSO = 5, SENHA_GERENTE = '#39'S' +
          #39' WHERE COD_PROCESSO = '#39'VND251'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0218'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR BT ALTERAR DATA LANCAMENTO'#39', 10, '#39'FRMCADNF'#39', 1, '#39'S'#39', '#39'S'#39 +
          ', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'create or alter procedure RESUMO_FINANCEIRO_UNIFICADO ('
        '    PDTINI date,'
        '    PDTFIM date,'
        '    PCOD_EMPRESA integer,'
        '    PREGIMECAIXA char(1),'
        '    PTODASCONTAS char(1),'
        '    PAGRUPARUNIFADA char(1),'
        '    PCODEMPUNIFICADA integer)'
        'returns ('
        '    TPDTQUIT_DTREF integer,'
        '    TIPO_DESP varchar(10),'
        '    TIPO varchar(20),'
        '    COD_EMPRESA integer,'
        '    COD_EMP_MULT integer,'
        '    N_CONTA_PLC double precision,'
        '    DTQUIT_DTREF timestamp,'
        '    NDOC varchar(50),'
        '    VALOR double precision,'
        '    HISTORICO varchar(200),'
        '    DATA timestamp,'
        '    COD_LANC integer,'
        '    VALOR_PAGO double precision,'
        '    DESC_PADR varchar(50),'
        '    DESC_SUB_CT varchar(50),'
        '    FORNECEDOR varchar(100),'
        '    NOME_CTRL varchar(50),'
        '    EXIBIR_RESUMO_FINANCEIRO char(1),'
        '    DATA_INI timestamp,'
        '    DATA_FIM timestamp,'
        '    ATIVO integer,'
        '    ORDEM integer,'
        '    DESC_GR varchar(50),'
        '    DESC_DEP varchar(50))'
        'as'
        'declare variable VCAMPO varchar(15);'
        'declare variable VTEMP varchar(100);'
        'declare variable VTEMPCODEMP varchar(100);'
        'declare variable VTEMPTODAS varchar(2000);'
        'declare variable VFINANCEIRO_UNIFICADO char(1);'
        'declare variable VEMP_UNIFICADA integer;'
        'begin'
        '  /* Procedure Text */'
        '  VCAMPO = '#39'COD_EMPRESA'#39';'
        '  VTEMP = '#39#39';'
        '  VTEMPCODEMP = '#39#39';'
        '  VTEMPTODAS = '#39#39';'
        ''
        '  VFINANCEIRO_UNIFICADO = '#39#39';'
        '  VEMP_UNIFICADA = 0;'
        ''
        '  select codigo_unificadora, financeiro_unificado from empresa'
        
          '  where cod_empresa = :pcod_empresa into :vemp_unificada, :vfina' +
          'nceiro_unificado;'
        ''
        
          '  if ((coalesce(vfinanceiro_unificado, '#39'N'#39') = '#39'S'#39') and (vemp_uni' +
          'ficada > 0) and (pcodempunificada > 0)) then'
        '  begin'
        '    if (vemp_unificada = pcod_empresa) then'
        '      VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcodempunificada;'
        '    else'
        '      VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcod_empresa;  '
        '     VCAMPO = '#39'COD_EMP_MULT'#39';'
        '  end'
        '  else'
        '    VTEMPCODEMP = '#39' and cod_empresa = '#39' || pcod_empresa;'
        '    '
        '  if (pregimecaixa = '#39'S'#39') then'
        '    VTEMP = '#39' and tpdtquit_dtref = 1'#39';'
        '  else'
        '    VTEMP = '#39' and tpdtquit_dtref = 2'#39';'
        ''
        '  if (ptodascontas <> '#39'S'#39') then'
        '    VTEMP = VTEMP || '#39' and trim(tipo) <> '#39#39'TODAS'#39#39' '#39';'
        ''
        '  FOR EXECUTE STATEMENT'
        '  '#39' select cod_empresa from empresa'
        '    where ativo = 1 '#39' || VTEMPCODEMP into :cod_empresa  do'
        '  begin'
        '    IF (COALESCE(PTODASCONTAS, '#39#39') = '#39'S'#39') THEN'
        '       VTEMPTODAS = '#39' union'
        
          '        select distinct 1, '#39#39'LANC'#39#39', '#39#39'TODAS'#39#39', cast('#39'||:cod_emp' +
          'resa||'#39' as integer), cast('#39'||:cod_empresa||'#39' as integer),'
        
          '        p.n_conta_plc, null datq_l, '#39#39#39#39' ndoc_l, 0 valor_l, '#39#39#39#39 +
          ' historico_l, null data, 0 cod_lanc, 0 valor_l,'
        
          '        case when trim(coalesce(p.desc_padr, '#39#39#39#39')) = '#39#39#39#39' then ' +
          'p.desc_plc else p.desc_padr end desc_padr,'
        '        s.desc_sub_ct, p.tipo_ctp, '#39#39'S'#39#39', '#39#39#39#39' nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        p.ativo, 1 ordem, c.desc_gr, ct.desc_dep from p_contas p'
        
          '        inner join grupos_ct c on p.grup_ct = c.grup_ct and c.ti' +
          'po_gr = '#39#39'S'#39#39
        '        left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct'
        '        left join depart_ct ct on ct.cod_dep = c.cod_dep'
        '        UNION'
        
          '        select distinct 2, '#39#39'LANC'#39#39', '#39#39'TODAS'#39#39', cast('#39'||:cod_emp' +
          'resa||'#39' as integer), cast('#39'||:cod_empresa||'#39' as integer),'
        
          '        p.n_conta_plc, null dtreferencia, '#39#39#39#39' ndoc_l, 0 valor_l' +
          ', '#39#39#39#39' historico_l, null data, 0 cod_lanc, 0 valor_l,'
        
          '        case when trim(coalesce(p.desc_padr, '#39#39#39#39')) = '#39#39#39#39' then ' +
          'p.desc_plc else p.desc_padr end desc_padr,'
        '        s.desc_sub_ct, p.tipo_ctp, '#39#39'S'#39#39', '#39#39#39#39' nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        p.ativo, 1 ordem, c.desc_gr, ct.desc_dep from p_contas p'
        
          '        inner join grupos_ct c on p.grup_ct = c.grup_ct and c.ti' +
          'po_gr = '#39#39'S'#39#39
        '        left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct'
        '        left join depart_ct ct on ct.cod_dep = c.cod_dep '#39';'
        ''
        '    FOR EXECUTE STATEMENT'
        
          '    '#39' select tpdtquit_dtref, tipo_desp, tipo, cod_empresa, cod_e' +
          'mp_mult,'
        '        n_conta_plc, dtquit_dtref, ndoc, valor, historico, data,'
        
          '        cod_lanc, valor_pago, desc_padr, desc_sub_ct, fornecedor' +
          ','
        '        exibir_resumo_financeiro, nome_ctrl,'
        '        cast('#39#39#39'||:pdtini||'#39#39#39' as timestamp) data_ini,'
        '        cast('#39#39#39'||:pdtfim||'#39#39#39' as timestamp) data_fim,'
        '        ativo, ordem, desc_gr, desc_dep from resumo_financeiro'
        '        where ((dtquit_dtref  >= '#39#39#39'||:pdtini||'#39#39#39
        '        and dtquit_dtref <= '#39#39#39'||:pdtfim||'#39#39#39'))'
        
          '        and '#39' || :vcampo || '#39' = '#39'||:cod_empresa|| vtemp || vtemp' +
          'todas'
        ''
        
          '    into :tpdtquit_dtref, :tipo_desp, :tipo, :cod_empresa, cod_e' +
          'mp_mult,'
        
          '        :n_conta_plc, :dtquit_dtref, :ndoc, :valor, :historico, ' +
          ':data,'
        
          '        :cod_lanc, :valor_pago, :desc_padr, :desc_sub_ct, :forne' +
          'cedor,'
        '        :exibir_resumo_financeiro, :nome_ctrl,'
        
          '        :data_ini, :data_fim, :ativo, :ordem, :desc_gr, :desc_de' +
          'p do'
        '     begin'
        '        if (trim(coalesce(pagruparunifada, '#39#39')) = '#39'S'#39') then '
        '          cod_empresa = pcod_empresa;'
        ''
        '        if (tpdtquit_dtref is not null) then'
        '          suspend;'
        '     end'
        '  end'
        'end;'
        '|/BLOCO|')
      ExplicitWidth = 1022
    end
  end
end
