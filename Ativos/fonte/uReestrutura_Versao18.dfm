inherited frmReestruturaVersao18: TfrmReestruturaVersao18
  Caption = 'frmReestruturaVersao18'
  ExplicitWidth = 1068
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 1054
    end
  end
  inherited Panel2: TPanel
    inherited Label2: TLabel
      Width = 1054
    end
  end
  inherited Panel3: TPanel
    inherited Label3: TLabel
      Width = 1054
    end
    inherited sqlHwauto: TMemo
      Lines.Strings = (
        'ALTER TABLE CONFIG_API ADD TOKEN_API VARCHAR(100);'
        'ALTER TABLE CONFIG_API ADD SENHA_API VARCHAR(20);'
        'ALTER TABLE CONFIG_API ADD CHAVE_ASSIGN VARCHAR(255);'
        'ALTER TABLE CONFIG_API ADD DATA_EXPIRACAO TIMESTAMP;'
        ''
        'ALTER TABLE CLIENTES ADD API_PROG_FID CHAR(1);'
        ''
        
          'ALTER TABLE CONTA_CORRENTE_PROG_FIDELIDADE ADD NVALECUPOM VARCHA' +
          'R(32);'
        
          'ALTER TABLE CONTA_CORRENTE_PROG_FIDELIDADE ADD ERP_API CHAR(1) D' +
          'EFAULT '#39'E'#39';'
        ''
        
          'CREATE INDEX IDX_CONTA_CORRENTE_PROG_FID ON CONTA_CORRENTE_PROG_' +
          'FIDELIDADE (COD_EMPRESA, DATA_VENC_PROG);'
        ''
        '|BLOCO|'
        'CREATE TABLE VALE_CUPONS ('
        '    CODIGO       VARCHAR(32) NOT NULL,'
        '    ERP_API      CHAR(1) NOT NULL,      '
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    NOME         VARCHAR(100),'
        '    CPF          VARCHAR(18),'
        '    CARTAO       VARCHAR(100),'
        '    PONTOS       DOUBLE PRECISION,'
        '    DESCRICAO    VARCHAR(100),'
        '    EMPRESA      VARCHAR(100),'
        '    VALIDADO     TIMESTAMP,'
        '    OPERADOR     VARCHAR(100),'
        '    DATAHORA     TIMESTAMP'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE VALE_CUPONS ADD CONSTRAINT PK_VALE_CUPONS PRIMARY KE' +
          'Y (CODIGO, ERP_API, COD_EMPRESA);'
        ''
        
          'CREATE INDEX IDX_VALE_CUPONS_CPF ON VALE_CUPONS (CPF, COD_EMPRES' +
          'A);'
        ''
        
          'CREATE INDEX IDX_CONTA_CORRENTE_PRG_FID_CP ON CONTA_CORRENTE_PRO' +
          'G_FIDELIDADE (NVALECUPOM, ERP_API, COD_EMPRESA);'
        ''
        
          'CMD:REPL|delete from tabela_processos where cod_processo = '#39'CLI2' +
          '19'#39';'
        
          'CMD:REPL|delete from tabela_processos where cod_processo = '#39'CLI2' +
          '31'#39';'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG049'#39', :COD_EMPRESA, '#39'UT' +
          'ILIZAR VALE - PROGRAMA FIDELIDADE'#39', 10, NULL, 1, '#39'N'#39', '#39'S'#39', CURRE' +
          'NT_DATE);'
        ''
        'ALTER TABLE VALE_CUPONS ADD NDOC INTEGER;'
        'ALTER TABLE VALE_CUPONS ADD TIPODOC CHAR(3);'
        ''
        'ALTER TABLE CLIENTES ADD FONE_CELULAR CHAR(13);'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI250'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR SALVAR CLIENTE SEM INFORMAR CELULAR'#39', 10, '#39'S'#39', '#39'FRMCADCLI' +
          'ENTE'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI251'#39', :COD_EMPRESA, '#39'TE' +
          'LEFONE CELULAR SENDO UTILIZADO EM OUTRO CLIENTE'#39', 10, '#39'S'#39', '#39'FRMC' +
          'ADCLIENTE'#39', 1, '#39'S'#39', CURRENT_DATE);'
        ''
        'ALTER TABLE CONTA_CORRENTE_PROG_FIDELIDADE ADD ENV_API CHAR(1);'
        ''
        
          'CREATE INDEX IDX_CONTA_CORRENTE_PROG_FID_CLI ON CONTA_CORRENTE_P' +
          'ROG_FIDELIDADE (COD_CLIENTE, DATA_VENC_PROG, COD_EMPRESA, ENV_AP' +
          'I);'
        ''
        '|BLOCO|CMD:INATIVO|'
        'create or alter procedure EXISTE_FORMAS ('
        '    PNDOC integer,'
        '    PTIPODOC varchar(6),'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    NDOC integer,'
        '    TIPODOC varchar(6),'
        '    VALOR_TOTAL double precision,'
        '    ENTRADA double precision,'
        '    CREDIARIO char(1),'
        '    VALOR_VALE double precision,'
        '    JUROS double precision,'
        '    PRCSS char(1))'
        'as'
        'declare variable VSQL varchar(600);'
        'declare variable VCONFFORMPAGAMENTO varchar(3);'
        'declare variable VNF integer;'
        'declare variable VSERIE integer;'
        'declare variable VTEMP varchar(400);'
        'begin'
        '  VSQL = '#39#39';'
        '  VTEMP = '#39#39';'
        '  /* Procedure Text */'
        
          '  select conf_formpagamento from empresa where cod_empresa = 1 i' +
          'nto :vconfformpagamento;'
        
          '  if ((trim(coalesce(vconfformpagamento, '#39#39')) = '#39'PED'#39') or (trim(' +
          'coalesce(ptipodoc, '#39#39')) = '#39'PRE'#39')) then'
        '  begin'
        '    select first 1 fp.nrequisicao, fp.tpdocs,'
        ''
        
          '    coalesce((select sum(coalesce(fp2.valordoc, 0)) from formpag' +
          'amento fp2'
        
          '    where fp2.nrequisicao = fp.nrequisicao and fp2.tpdocs = fp.t' +
          'pdocs and fp2.cod_empresa = fp.cod_empresa), 0) valor_total,'
        ''
        
          '    coalesce((select sum(coalesce(fp3.valordoc, 0)) from formpag' +
          'amento fp3'
        
          '    inner join controles ctr3 on fp3.cod_controle = ctr3.codigo_' +
          'ctrl and fp3.cod_empresa = ctr3.codigo_emp and ctr3.docs = '#39'N'#39
        
          '    where fp3.nrequisicao = fp.nrequisicao and fp3.tpdocs = fp.t' +
          'pdocs and fp3.cod_empresa = fp.cod_empresa), 0) entrada,'
        ''
        
          '    coalesce((case when (coalesce((select coalesce(count(*), 0) ' +
          'from formpagamento fp4'
        
          '    inner join controles ctr4 on ctr4.codigo_ctrl = fp4.cod_cont' +
          'role and ctr4.codigo_emp = fp4.cod_empresa'
        
          '    where fp4.nrequisicao = fp.nrequisicao and fp4.tpdocs = fp.t' +
          'pdocs and fp4.cod_empresa = fp.cod_empresa'
        
          '    and trim(ctr4.fp_regra_fidelidade) = '#39'CR'#39'), 0) > 0) then '#39'S'#39 +
          ' else '#39'N'#39' end), '#39'N'#39') crediario,'
        ''
        
          '    coalesce((select sum(coalesce(fp5.valordoc, 0)) from formpag' +
          'amento fp5'
        
          '    where fp5.nrequisicao = fp.nrequisicao and fp5.tpdocs = fp.t' +
          'pdocs and fp5.cod_empresa = fp.cod_empresa'
        '    and fp5.ativo = 1 and fp5.prg_fid = '#39'S'#39'), 0) valor_vale,'
        ''
        
          '    coalesce((case when coalesce((select coalesce(count(*), 0) f' +
          'rom formpagamento fp6'
        
          '    where fp6.nrequisicao = fp.nrequisicao and fp6.tpdocs = fp.t' +
          'pdocs and fp6.cod_empresa = fp.cod_empresa'
        
          '    and fp6.prcss = '#39'S'#39'), 0) > 0 then '#39'S'#39' else '#39'N'#39' end), '#39'N'#39') pr' +
          'css,'
        ''
        
          '    (coalesce((select sum(coalesce(fp7.vl_juros, 0)) from formpa' +
          'gamento fp7'
        
          '    where fp7.nrequisicao = fp.nrequisicao and fp7.tpdocs = fp.t' +
          'pdocs and fp7.cod_empresa = fp.cod_empresa), 0) +'
        
          '    coalesce((select sum(coalesce(fp7.vl_juros, 0)) from formpag' +
          'amento fp7'
        
          '    inner join hist_rec h on h.ndocant = fp7.nrequisicao and h.t' +
          'p_doc_baixa = fp7.tpdocs and h.cod_empresa = fp7.cod_empresa'
        
          '    where h.ndocant = fp.nrequisicao and h.tp_doc_baixa = fp.tpd' +
          'ocs and h.cod_empresa = fp.cod_empresa), 0)) vl_juros'
        ''
        '       from formpagamento fp'
        
          '    where fp.nrequisicao = :pndoc and fp.tpdocs = :ptipodoc and ' +
          'fp.cod_empresa = :pcod_empresa and fp.ativo = 1'
        
          '    into :ndoc, :tipodoc, :valor_total, :entrada, :crediario, :v' +
          'alor_vale, :prcss, :juros;'
        '  end'
        '  else'
        '  begin'
        '    if (trim(ptipodoc) = '#39'MOT'#39') then'
        '    begin'
        
          '      VSQL = '#39' select cf.num_nota_v as n_nf, cf.sub_serie as ser' +
          'ie from com_fat cf'
        
          '        where cf.n_comando = '#39'||:pndoc||'#39' and cf.cod_empresa = '#39 +
          '||:pcod_empresa;'
        '    end'
        '    else'
        '    begin'
        '      VSQL = '#39' select pp.n_nf, pp.serie from pedvenda_prod pp'
        
          '        where pp.nped = '#39'||:pndoc||'#39' and pp.tipo = '#39#39#39'||:ptipodo' +
          'c||'#39#39#39
        
          '        and pp.cod_empresa = '#39'||:pcod_empresa||'#39' and pp.ativo = ' +
          '1'
        
          '        and ((pp.status is null) or (pp.status <> '#39#39'CANCELADO'#39#39')' +
          ') and pp.n_nf > 0 and pp.serie <> '#39#39#39#39
        '        union'
        '        select ps.n_nf, ps.serie from pedvenda_serv ps'
        
          '        where ps.nped = '#39'||:pndoc||'#39' and ps.tipo = '#39#39#39'||:ptipodo' +
          'c||'#39#39#39
        
          '        and ps.cod_empresa = '#39'||:pcod_empresa||'#39' and ps.ativo = ' +
          '1'
        
          '        and ((ps.status is null) or (ps.status <> '#39#39'CANCELADO'#39#39')' +
          ') and ps.n_nf > 0 and ps.serie <> '#39#39#39#39
        '        group by 1,2 '#39';'
        '    end'
        ''
        '    for execute statement VSQL into :vnf, :vserie do'
        '    begin'
        '       if (trim(VTEMP) = '#39#39') then'
        
          '          VTEMP = '#39' ((fp.num_nota = '#39'||:vnf||'#39' and fp.sub_serie ' +
          '= '#39'||:vserie||'#39')'#39';'
        '       else'
        '          VTEMP = VTEMP || '#39' or (fp.num_nota = '#39'||:vnf||'
        '            '#39' and fp.sub_serie = '#39'||:vserie||'#39')'#39';'
        '    end'
        '    if (trim(coalesce(VTEMP, '#39#39')) <> '#39#39') then'
        '      VTEMP = VTEMP || '#39')'#39';'
        ''
        '    if (trim(coalesce(VTEMP, '#39#39')) <> '#39#39') then'
        '    begin'
        '        execute statement'
        '        '#39' select first 1 fp.nrequisicao, fp.tpdocs,'
        
          '          coalesce((select sum(coalesce(fp2.valordoc, 0)) from f' +
          'ormpagamento fp2'
        
          '          where fp2.nrequisicao = fp.nrequisicao and fp2.tpdocs ' +
          '= fp.tpdocs and fp2.cod_empresa = fp.cod_empresa), 0) valor_tota' +
          'l,'
        '    '
        
          '          coalesce((select sum(coalesce(fp3.valordoc, 0)) from f' +
          'ormpagamento fp3'
        
          '          inner join controles ctr3 on fp3.cod_controle = ctr3.c' +
          'odigo_ctrl and fp3.cod_empresa = ctr3.codigo_emp and ctr3.docs =' +
          ' '#39#39'N'#39#39
        
          '          where fp3.nrequisicao = fp.nrequisicao and fp3.tpdocs ' +
          '= fp.tpdocs and fp3.cod_empresa = fp.cod_empresa), 0) entrada,'
        '    '
        
          '          coalesce((case when (coalesce((select coalesce(count(*' +
          '), 0) from formpagamento fp4'
        
          '          inner join controles ctr4 on ctr4.codigo_ctrl = fp4.co' +
          'd_controle and ctr4.codigo_emp = fp4.cod_empresa'
        
          '          where fp4.nrequisicao = fp.nrequisicao and fp4.tpdocs ' +
          '= fp.tpdocs and fp4.cod_empresa = fp.cod_empresa'
        
          '          and trim(ctr4.fp_regra_fidelidade) = '#39#39'CR'#39#39'), 0) > 0) ' +
          'then '#39#39'S'#39#39' else '#39#39'N'#39#39' end), '#39#39'N'#39#39') crediario,'
        '    '
        
          '          coalesce((select sum(coalesce(fp5.valordoc, 0)) from f' +
          'ormpagamento fp5'
        
          '          where fp5.nrequisicao = fp.nrequisicao and fp5.tpdocs ' +
          '= fp.tpdocs and fp5.cod_empresa = fp.cod_empresa'
        
          '          and fp5.ativo = 1 and fp5.prg_fid = '#39#39'S'#39#39'), 0) valor_v' +
          'ale,'
        ''
        
          '          coalesce((case when coalesce((select coalesce(count(*)' +
          ', 0) from formpagamento fp6'
        
          '          where fp6.nrequisicao = fp.nrequisicao and fp6.tpdocs ' +
          '= fp.tpdocs and fp6.cod_empresa = fp.cod_empresa'
        
          '          and fp6.prcss = '#39#39'S'#39#39'), 0) > 0 then '#39#39'S'#39#39' else '#39#39'N'#39#39' e' +
          'nd), '#39#39'N'#39#39') prcss,'
        ''
        
          '          (coalesce((select sum(coalesce(fp7.vl_juros, 0)) from ' +
          'formpagamento fp7'
        
          '          where fp7.nrequisicao = fp.nrequisicao and fp7.tpdocs ' +
          '= fp.tpdocs and fp7.cod_empresa = fp.cod_empresa), 0) +'
        
          '          coalesce((select sum(coalesce(fp7.vl_juros, 0)) from f' +
          'ormpagamento fp7'
        
          '          inner join hist_rec h on h.ndocant = fp7.nrequisicao a' +
          'nd h.tp_doc_baixa = fp7.tpdocs and h.cod_empresa = fp7.cod_empre' +
          'sa'
        
          '          where h.ndocant = fp.nrequisicao and h.tp_doc_baixa = ' +
          'fp.tpdocs and h.cod_empresa = fp.cod_empresa), 0)) vl_juros'
        ''
        ''
        '             from formpagamento fp'
        
          '          where '#39'||:VTEMP||'#39' and fp.tpdocs <> '#39#39'LCS'#39#39' and fp.cod' +
          '_empresa = '#39'||:pcod_empresa||'#39
        '          and fp.ativo = 1 '#39
        
          '          into :ndoc, :tipodoc, :valor_total, :entrada, :crediar' +
          'io, :valor_vale, :prcss, :juros;'
        '      end'
        '  end'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI252'#39', :COD_EMPRESA, '#39'GE' +
          'RAR VALE POIS O CLIENTE NAO ACESSA APLICAT/SITE'#39', 10, '#39'S'#39', '#39'FRMC' +
          'ADCLIENTE'#39', 1, '#39'S'#39', CURRENT_DATE);'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'RECEBER DO' +
          'CUMENTO S/ UTIL INTERMEDIADOR ECOMMERCE'#39' WHERE COD_PROCESSO = '#39'F' +
          'PG046'#39';'
        ''
        'ALTER TABLE NOTAFISCAL ADD TIPO_SEGURO CHAR(1) DEFAULT '#39'R'#39';'
        'ALTER TABLE NOTAFISCAL ADD TIPO_OUTDESP CHAR(1) DEFAULT '#39'R'#39';'
        'ALTER TABLE NOTAFISCAL ADD TIPO_FRETE CHAR(1) DEFAULT '#39'R'#39';'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER FUNCOESTRIGGER1 FOR FUNCOES'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   if (coalesce(new.COD_FUNCAO, 0) = 0) then'
        '      new.COD_FUNCAO = gen_id(INC_COD_FUNCAO,1);'
        'END'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CONTA_CORRENTE_PROG_FIDELIDADE DROP CONSTRAINT FK_CO' +
          'NTA_CORRENTE_PROG_TAXA;'
        
          'CMD:INATIVO|CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO,' +
          ' COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM' +
          ', ATIVO, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI245'#39', :COD_' +
          'EMPRESA, '#39'ESTORNAR VALE COMPRA CONTA CORRENTE'#39', 10, '#39'S'#39', '#39'FRMCAD' +
          'CLIENTE'#39', 1, '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE VALE_CUPONS ADD VALOR DOUBLE PRECISION;'
        ''
        '|BLOCO|'
        'CREATE TABLE EMPRESA_PROG_FID ('
        '    COD_EMPRESA       INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        
          'ALTER TABLE EMPRESA_PROG_FID ADD CONSTRAINT PK_EMPRESA_PROG_FID ' +
          'PRIMARY KEY (COD_EMPRESA);'
        
          'ALTER TABLE CONTA_CORRENTE_PROG_FIDELIDADE ADD COD_EMP_RESP INTE' +
          'GER;'
        
          'CMD:REPL|UPDATE CONTA_CORRENTE_PROG_FIDELIDADE SET COD_EMP_RESP ' +
          '= COD_EMPRESA WHERE COD_EMP_RESP IS NULL;'
        
          'ALTER TABLE CONTA_CORRENTE_PROG_FIDELIDADE ADD COD_EMP_TIPODOC I' +
          'NTEGER;'
        'ALTER TABLE VALE_CUPONS ADD COD_EMP_TIPODOC INTEGER;'
        
          'CMD:REPL|UPDATE VALE_CUPONS SET COD_EMP_TIPODOC = COD_EMPRESA WH' +
          'ERE COD_EMP_TIPODOC IS NULL AND NDOC > 0;'
        
          'CMD:REPL|UPDATE CONTA_CORRENTE_PROG_FIDELIDADE SET COD_EMP_TIPOD' +
          'OC = COD_EMPRESA WHERE COD_EMP_TIPODOC IS NULL AND NDOC > 0;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC046'#39', :COD_EMPRESA, '#39'P' +
          'ERM REALIZAR LANCAMENTOS DE CONTAS DIF CONT LIG'#39', 5, '#39'S'#39', '#39'.'#39', 1' +
          ', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP035'#39', :COD_EMPRESA, '#39'BT' +
          ' CANCELAR LANCAMENTO DE DIF NO CONTAS A PAGAR'#39', 10, '#39'FRMCADCONTA' +
          'SAPAGAR'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE PEDVENDA_REF_NF ('
        '    NPED         INTEGER NOT NULL,'
        '    TIPO         CHAR(3) NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    COD_NF       INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        
          'ALTER TABLE PEDVENDA_REF_NF ADD CONSTRAINT PK_PEDVENDA_REF_NF PR' +
          'IMARY KEY (NPED, TIPO, COD_EMPRESA, COD_NF);'
        
          'ALTER TABLE PEDVENDA_REF_NF ADD CONSTRAINT FK_PEDVENDA_REF_NF_NF' +
          ' FOREIGN KEY (COD_NF, COD_EMPRESA) REFERENCES NOTAFISCAL (COD_NF' +
          ', COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE PEDVENDA_REF_NF ADD CONSTRAINT FK_PEDVENDA_REF_NF_PE' +
          'D FOREIGN KEY (NPED, TIPO, COD_EMPRESA) REFERENCES PEDVENDA (NPE' +
          'D, TIPO, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        'ALTER TABLE NAT_OP ADD SEMVINCULO_VND CHAR(1);'
        
          'CREATE INDEX IDX_ITEMNF_ITEMPED ON NOTAFISCAL_ITEM (NPED, TIPO_P' +
          'ED, COD_EMPRESA);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO333'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR ESTOQUE MINIMO'#39', 10, '#39'S'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO334'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR ESTOQUE MAXIMO'#39', 10, '#39'S'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0215'#39', :COD_EMPRESA, '#39'GE' +
          'RAR NF ENTRADA PEDIDO VENDA'#39', 6, '#39'FRMCADNF'#39', 1, '#39'N'#39', '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0216'#39', :COD_EMPRESA, '#39'GE' +
          'RAR NF ENTRADA PEDIDO VENDA COM NOTA EXISTENTE'#39', 6, '#39'FRMCADNF'#39', ' +
          '1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0217'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR PESQUISA DE VENDAS ABERTAS NF ENTRADA'#39', 6, '#39'FRMCADNF'#39', 1' +
          ', '#39'N'#39', '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET GRAVAR_AUDITORIA = '#39'N'#39' WHER' +
          'E COD_PROCESSO = '#39'NF0203'#39' AND COD_EMPRESA = :COD_EMPRESA AND GRA' +
          'VAR_AUDITORIA = '#39'S'#39';'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET GRAVAR_AUDITORIA = '#39'N'#39' WHER' +
          'E COD_PROCESSO = '#39'NF0191'#39' AND COD_EMPRESA = :COD_EMPRESA AND GRA' +
          'VAR_AUDITORIA = '#39'S'#39';'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'HABILITAR ' +
          'PESQUISA DE VENDAS ABERTAS NF SAIDA'#39' WHERE COD_PROCESSO = '#39'NF019' +
          '1'#39' AND COD_EMPRESA = :COD_EMPRESA AND NOME_PROCESSO = '#39'HABILITAR' +
          ' PESQUISA DE NF VENDAS VAN'#39';'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI253'#39', :COD_EMPRESA, '#39'ES' +
          'TORNAR VALE COMPRA CONTA CORRENTE'#39', 10, '#39'S'#39', '#39'FRMCADCLIENTE'#39', 1,' +
          ' '#39'S'#39', CURRENT_DATE);')
    end
  end
end
