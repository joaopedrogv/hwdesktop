inherited frmReestruturaVersao2: TfrmReestruturaVersao2
  Caption = 'frmReestruturaVersao2'
  ExplicitWidth = 1068
  ExplicitHeight = 593
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 1054
    end
    inherited sqlFiscal: TMemo
      ExplicitTop = 16
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
        '|BLOCO|'
        'CREATE TABLE EMPRESA_FISICA ('
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    DATA_CONFIG_SERV  TIMESTAMP,'
        '    DATA_CONFIG_WS    TIMESTAMP'
        ');'
        ''
        
          'ALTER TABLE EMPRESA_FISICA ADD CONSTRAINT PK_EMPRESA_FISICA PRIM' +
          'ARY KEY (COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'INSERT INTO EMPRESA_FISICA (COD_EMPRESA)'
        
          'SELECT COALESCE(COD_EMPRESA_FISICA, 0) COD_EMPRESA_FISICA FROM E' +
          'MPDESVOLV WHERE COD_EMPDES = 1;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER TRIGGER FUNCOESTRIGGER1 FOR FUNCOES'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   if (new.COD_FUNCAO is null) then'
        '      new.COD_FUNCAO = gen_id(INC_COD_FUNCAO,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE AGENDA_ITENS ADD COD_USUARIO INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE AGENDA ADD COD_USUARIO INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'AGO027'#39', :COD_EMPRESA, '#39'DEMARCA AGE' +
          'NDAMENTO'#39', 10, '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE CONTROLES ADD DIAS_ENT_FLUXO INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_PROXIMO_DIAUTIL ('
        '    PI_DATA date)'
        'returns ('
        '    PO_DATA timestamp)'
        'as'
        'declare variable VDATA date;'
        'declare variable VDAY integer;'
        'declare variable VNEWDAY integer;'
        'declare variable I integer;'
        'declare variable J integer;'
        'declare variable VOK integer;'
        'BEGIN'
        
          '  SELECT EXTRACT(WEEKDAY FROM :PI_DATA) FROM RDB$DATABASE INTO :' +
          'VDAY;'
        '  IF (VDAY=6) THEN'
        '    VDATA = PI_DATA+2;'
        '  ELSE IF (VDAY=0) THEN'
        '    VDATA = PI_DATA+1;'
        '  ELSE'
        '    VDATA = PI_DATA;'
        
          '  SELECT COALESCE(COUNT(*),0)  FROM FERIADO F WHERE F.DATA_FERIA' +
          'DO = :VDATA INTO :I;'
        '  IF (I>0) THEN'
        '  BEGIN'
        '    VDATA = VDATA+1;'
        '    VOK = 0;'
        '    WHILE (VOK=0) DO'
        '    BEGIN'
        
          '      SELECT COALESCE(COUNT(*), 0)  FROM FERIADO F WHERE F.DATA_' +
          'FERIADO = :VDATA INTO :J;'
        '      IF (J>0) THEN'
        '        VDATA = VDATA+1;'
        '      ELSE'
        '      BEGIN'
        
          '        SELECT EXTRACT(WEEKDAY FROM :VDATA) FROM RDB$DATABASE IN' +
          'TO :VNEWDAY;'
        '        IF (VNEWDAY=6) THEN'
        '          VDATA = VDATA+2;'
        '        ELSE IF (VNEWDAY=0) THEN'
        '          VDATA = VDATA+1;'
        '        ELSE'
        '          VOK = 1;'
        '      END'
        '    END'
        '  END'
        '  PO_DATA = VDATA;'
        '  SUSPEND;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'GRANT SELECT ON FERIADO TO PROCEDURE SP_PROXIMO_DIAUTIL;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'GRANT EXECUTE ON PROCEDURE SP_PROXIMO_DIAUTIL TO SYSDBA;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_FLUXO_CAIXA('
        '    TIPO_DOC,'
        '    DATA_VENC,'
        '    DATA_VENC_ATU,'
        '    HISTORICO,'
        '    VALOR_RECEBER,'
        '    VALOR_PAGAR,'
        '    COD_EMPRESA,'
        '    CODIGO_CTRL,'
        '    N_DOC,'
        '    NOME_CTRL,'
        '    NOME_CLIFOR,'
        '    DATA_EXTENSO)'
        'AS'
        
          '----------------------------------CREDITOS----------------------' +
          '---------------'
        'select '#39'CTR'#39','
        'cr.data_venc_c,'
        
          '(select po_data from sp_proximo_diautil(((select po_data from sp' +
          '_proximo_diautil(cr.data_venc_c)) + (coalesce(ctr.dias_ent_fluxo' +
          ', 0))))),'
        'cr.historico_c,'
        'cr.valor_c,'
        '0.00,'
        'cr.codigo_emp,'
        'cr.codigo_ctrl,'
        'cr.n_doc_c,'
        'ctr.nome_ctrl,'
        'cr.nome_c,'
        ''
        ''
        
          '(select EXTRACT(DAY FROM ((select po_data from sp_proximo_diauti' +
          'l(((select po_data from sp_proximo_diautil(cr.data_venc_c)) + (c' +
          'oalesce(ctr.dias_ent_fluxo, 0))))))) ||'#39' '#39'||'
        
          'trim(CASE EXTRACT(MONTH FROM (((select po_data from sp_proximo_d' +
          'iautil(((select po_data from sp_proximo_diautil(cr.data_venc_c))' +
          ' + (coalesce(ctr.dias_ent_fluxo, 0))))))))'
        '        WHEN 1 THEN '#39' DE JANEIRO DE '#39
        '        WHEN 2 THEN '#39' DE FEVEREIRO DE '#39
        '        WHEN 3 THEN '#39' DE MARCO DE '#39
        '        WHEN 4 THEN '#39' DE ABRIL DE '#39
        '        WHEN 5 THEN '#39' DE MAIO DE '#39
        '        WHEN 6 THEN '#39' DE JUNHO DE '#39
        '        WHEN 7 THEN '#39' DE JULHO DE '#39
        '        WHEN 8 THEN '#39' DE AGOSTO DE '#39
        '        WHEN 9 THEN '#39' DE SETEMBRO DE '#39
        '        WHEN 10 THEN '#39' DE OUTRUBRO DE '#39
        '        WHEN 11 THEN '#39' DE NOVEMBRO DE '#39
        '        WHEN 12 THEN '#39' DE DEZEMBRO DE '#39
        
          '      END) || '#39' '#39'|| trim(EXTRACT(YEAR FROM (((select po_data fro' +
          'm sp_proximo_diautil(((select po_data from sp_proximo_diautil(cr' +
          '.data_venc_c)) + (coalesce(ctr.dias_ent_fluxo, 0)))))))))FROM RD' +
          'B$DATABASE)'
        ''
        'from controle_creditos cr'
        
          'inner join controles ctr on cr.codigo_ctrl = ctr.codigo_ctrl and' +
          ' cr.codigo_emp = ctr.codigo_emp'
        'where  (cr.datq_c is null)'
        
          '-----------------------------------CHEQUES----------------------' +
          '----------------'
        'union'
        'select '#39'CHQ'#39','
        'ch.data_venc,'
        
          '(select po_data from sp_proximo_diautil(((select po_data from sp' +
          '_proximo_diautil(ch.data_venc))))),--data_venc,'
        'ch.historico_ch,'
        'ch.valor_ch,'
        '0.00,'
        'ch.codigo_emp,'
        'ch.codigo_ctrl,'
        'ch.n_ch,'
        'ctr2.nome_ctrl,'
        'ch.nome_ch,'
        ''
        
          '(select EXTRACT(DAY FROM ((select po_data from sp_proximo_diauti' +
          'l(((select po_data from sp_proximo_diautil(ch.data_venc))))))) |' +
          '|'#39' '#39'||'
        
          'trim(CASE EXTRACT(MONTH FROM (((select po_data from sp_proximo_d' +
          'iautil(((select po_data from sp_proximo_diautil(ch.data_venc))))' +
          '))))'
        '        WHEN 1 THEN '#39' DE JANEIRO DE '#39
        '        WHEN 2 THEN '#39' DE FEVEREIRO DE '#39
        '        WHEN 3 THEN '#39' DE MARCO DE '#39
        '        WHEN 4 THEN '#39' DE ABRIL DE '#39
        '        WHEN 5 THEN '#39' DE MAIO DE '#39
        '        WHEN 6 THEN '#39' DE JUNHO DE '#39
        '        WHEN 7 THEN '#39' DE JULHO DE '#39
        '        WHEN 8 THEN '#39' DE AGOSTO DE '#39
        '        WHEN 9 THEN '#39' DE SETEMBRO DE '#39
        '        WHEN 10 THEN '#39' DE OUTRUBRO DE '#39
        '        WHEN 11 THEN '#39' DE NOVEMBRO DE '#39
        '        WHEN 12 THEN '#39' DE DEZEMBRO DE '#39
        
          '      END) || '#39' '#39'|| trim(EXTRACT(YEAR FROM (((select po_data fro' +
          'm sp_proximo_diautil(((select po_data from sp_proximo_diautil(ch' +
          '.data_venc)))))))))FROM RDB$DATABASE)'
        ''
        'from controle_cheque ch'
        
          'inner join controles ctr2 on ch.codigo_ctrl = ctr2.codigo_ctrl a' +
          'nd ch.codigo_ctrl = ctr2.codigo_emp'
        'where (ch.datq_ch is null)'
        ''
        
          '-----------------------------------------CONTAS A PAGAR---------' +
          '----------------------------'
        'union'
        'select '#39'CTP'#39','
        'pg.data_venc_ctp,'
        
          '(select po_data from sp_proximo_diautil(((select po_data from sp' +
          '_proximo_diautil(pg.data_venc_ctp))))),--pg.data_venc_ctp,'
        'pg.historico_ctp,'
        '0.00,'
        'pg.valor_ctp,'
        'pg.codigo_emp,'
        'pg.codigo_ctrl,'
        'pg.n_doc_ctp,'
        'ctr3.nome_ctrl,'
        'pg.nome_for_ctp,'
        ''
        ''
        
          '(select EXTRACT(DAY FROM ((select po_data from sp_proximo_diauti' +
          'l(((select po_data from sp_proximo_diautil(pg.data_venc_ctp)))))' +
          ')) ||'#39' '#39'||'
        
          'trim(CASE EXTRACT(MONTH FROM (((select po_data from sp_proximo_d' +
          'iautil(((select po_data from sp_proximo_diautil(pg.data_venc_ctp' +
          '))))))))'
        '        WHEN 1 THEN '#39' DE JANEIRO DE '#39
        '        WHEN 2 THEN '#39' DE FEVEREIRO DE '#39
        '        WHEN 3 THEN '#39' DE MARCO DE '#39
        '        WHEN 4 THEN '#39' DE ABRIL DE '#39
        '        WHEN 5 THEN '#39' DE MAIO DE '#39
        '        WHEN 6 THEN '#39' DE JUNHO DE '#39
        '        WHEN 7 THEN '#39' DE JULHO DE '#39
        '        WHEN 8 THEN '#39' DE AGOSTO DE '#39
        '        WHEN 9 THEN '#39' DE SETEMBRO DE '#39
        '        WHEN 10 THEN '#39' DE OUTRUBRO DE '#39
        '        WHEN 11 THEN '#39' DE NOVEMBRO DE '#39
        '        WHEN 12 THEN '#39' DE DEZEMBRO DE '#39
        
          '      END) || '#39' '#39'|| trim(EXTRACT(YEAR FROM (((select po_data fro' +
          'm sp_proximo_diautil(((select po_data from sp_proximo_diautil(pg' +
          '.data_venc_ctp)))))))))FROM RDB$DATABASE)'
        ''
        'from contas_a_pagar pg'
        
          'inner join controles ctr3 on pg.codigo_ctrl = ctr3.codigo_ctrl a' +
          'nd pg.codigo_emp = ctr3.codigo_emp'
        'where (pg.datq_ctp is null);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE CONTROLES ADD NFCE_TPAG SMALLINT;'
        'ALTER TABLE CONTROLES ADD NFCE_TBAND SMALLINT;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_AI_SIT_PED FOR PEDVENDA'
        'ACTIVE AFTER INSERT POSITION 0'
        'AS'
        '  declare variable vcodig integer;'
        'begin'
        '  IF (USER = '#39'REPL'#39') THEN'
        '    exit;'
        '  if ((new.tipo = '#39'REQ'#39') or (rtrim(new.tipo) = '#39'OS'#39'))  then'
        '  begin'
        
          '    select COD from INCREMENTA_CODIGO(new.cod_empresa, '#39'OCORRENC' +
          'IAS_OS'#39') into :vcodig;'
        
          '    insert into OCORRENCIAS_OS (COD_OCORRENCIA, NPED, TIPO, COD_' +
          'EMPRESA, HISTORICO_OC, DATA_E_HORA, ATIVO, N_OS, SITUACAO, STATU' +
          'S_SITUACAO)'
        
          '      values (:vcodig, new.nped, new.tipo, new.cod_empresa, '#39'PED' +
          'IDO - Iniciado'#39', current_timestamp , 1, new.nped, '#39'PEDIDO'#39', '#39'Ini' +
          'ciado'#39');'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'delete from config_colunas conf where conf.componente in ('#39'cdsCt' +
          'rlCh'#39', '#39'cdsCtrlCr'#39');'
        '|/BLOCO|'
        ''
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PROD_AU_SPED_0205 FOR PRODUTOS'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        '  declare variable vseqid integer;'
        '  declare variable vvalorant varchar(32);'
        '  declare variable vdescrant varchar(75);'
        '  declare variable vvalornew varchar(32);'
        '  declare variable vdescrnew varchar(75);'
        '  declare variable vdataini timestamp;'
        '  declare variable vtipo_alt char(1); -- tipo_alt para gravar'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '   exit;'
        '   '
        '  vtipo_alt = '#39#39';'
        
          '  if (((old.grupo_prod <> new.grupo_prod) or (old.cod_prod <> ne' +
          'w.cod_prod)) and (old.descr_prod <> new.descr_prod)) then'
        '    vtipo_alt = '#39'A'#39'; -- ambos'
        
          '  else if ((old.grupo_prod <> new.grupo_prod) or (old.cod_prod <' +
          '> new.cod_prod)) then'
        '    vtipo_alt = '#39'C'#39'; -- codigo'
        '  else if (old.descr_prod <> new.descr_prod) then'
        '    vtipo_alt = '#39'D'#39'; -- descricao'
        ''
        '  if (vtipo_alt <> '#39#39') then'
        '  begin'
        
          '    select seqid, valor_anterior, descr_prod_anterior from produ' +
          'tos_alteracoes where grupo_prod = old.grupo_prod and cod_prod = ' +
          'old.cod_prod and cod_empresa = old.cod_empresa and data_alteraca' +
          'o = current_date'
        '      into :vseqid, :vvalorant, :vdescrant;'
        '    if (coalesce(vseqid, 0) = 0) then -- sem alteracao no dia'
        '    begin'
        
          '      select first 1 data_alteracao from produtos_alteracoes whe' +
          're grupo_prod = old.grupo_prod and cod_prod = old.cod_prod and c' +
          'od_empresa = old.cod_empresa and data_alteracao < current_date o' +
          'rder by data_alteracao desc'
        '        into :vdataini;'
        
          '      if ((:vdataini  is null) and (not old.dat_cad_prod is null' +
          ')) then -- data de cadastro do prduto'
        '        vdataini = old.dat_cad_prod;'
        
          '      else if (:vdataini is null) then -- caso nao tenha data re' +
          'gistrada sera registrado com data posterior 365 dias'
        '        vdataini = current_date - 365;'
        '      else'
        
          '        vdataini = :vdataini + 1; -- caso encontre a data, esta ' +
          'sera usada como data inicial da alteracao'
        '      if (:vdataini > current_date) then'
        '        vdataini = current_date;'
        
          '      select cod from incrementa_codigo(new.cod_empresa, '#39'PRODUT' +
          'OS_ALTERACOES'#39') into :vseqid;'
        
          '      insert into produtos_alteracoes (seqid, grupo_prod, cod_pr' +
          'od, cod_empresa, tipo_alt, valor_anterior, data_alteracao, data_' +
          'ini, descr_prod_anterior)'
        
          '        values ( :vseqid, new.grupo_prod, new.cod_prod, new.cod_' +
          'empresa, :vtipo_alt, old.grupo_prod||'#39'|'#39'||rtrim(old.cod_prod)||'#39 +
          '|'#39', current_date, :vdataini, rtrim(old.descr_prod));'
        '    end'
        '    else'
        '    begin'
        '      vvalornew = new.grupo_prod||'#39'|'#39'||rtrim(new.cod_prod)||'#39'|'#39';'
        '      vdescrnew = rtrim(new.descr_prod);'
        
          '      if ((vvalorant = vvalornew) and (vdescrant = vdescrnew)) t' +
          'hen'
        
          '        delete from produtos_alteracoes where seqid = :vseqid an' +
          'd cod_empresa = old.cod_empresa;'
        '      else'
        '      begin'
        
          '        if ((vvalorant <> vvalornew) and (vdescrant <> vdescrnew' +
          ')) then'
        '          vtipo_alt = '#39'A'#39';'
        '        else if (vvalorant <> vvalornew) then'
        '          vtipo_alt = '#39'C'#39';'
        '        else'
        '          vtipo_alt = '#39'D'#39';'
        
          '        update produtos_alteracoes set tipo_alt = :vtipo_alt whe' +
          're seqid = :vseqid and cod_empresa = old.cod_empresa;'
        '      end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CODIGO_BANCOTRIGGER1 FOR CODIGO_BANCO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   if (NEW.COD_BANCO IS NULL) then'
        '       new.COD_BANCO = gen_id(INC_COD_BANCO,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER COD_PERFIL_COMISSAO FOR PERFIL_COMISSAO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '    if (new.codigo_perfil is null) then'
        '        new.codigo_perfil = gen_id(perfil_comissao,1);'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_CODDEVOLUCAO FOR DEVOLUCAO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  if (NEW.SEQID IS NULL) then'
        '    NEW.SEQID = GEN_ID(INC_COMANDO,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_CODCFGNOTA FOR CONFIG_NF'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  if (NEW.seqcfgnota IS NULL) then'
        '      new.seqcfgnota = gen_id(INC_cfg_nota,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_CODHISTPAD FOR HISTORICO_P'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '    if (new.CODIGO_HPD IS NULL) then'
        '        new.CODIGO_HPD = gen_id(INC_SEQ_HSP,1);'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_CODTIPFORNEC FOR TIPO_FORNECEDOR'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '    if (new.CODIGO_T_F IS NULL) then'
        '        new.CODIGO_T_F = gen_id(INC_COD_TIPOFORNEC,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_CODTMPSUG FOR TEMP_SUG_SERV'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        ' if (new.N_SUG_SERV IS NULL) then'
        '     new.N_SUG_SERV = gen_id(INC_COD_TMPSUG,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_COD_ETI FOR CONFIG_ETI'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '    if (new.cod_eti IS NULL) then'
        '        new.cod_eti = gen_id(INC_COD_ETI,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER ITENS_CONFIG_BOLETAS FOR ITENS_CONFIG_BO' +
          'LETAS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '    if (NEW.CODIGO IS NULL) then'
        '        New.CODIGO = gen_id(INC_COD_ITENS_CONFIG_BOL,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER TRIGGER TI_CAMPOSNF_CODIGO FOR CAMPOSNF'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '    if (new.codigo IS NULL) then'
        '        new.codigo = gen_id(INC_CAMPOSNF,1);'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVIDENCIAS_PAF_BI FOR EVIDENCIAS_PAF'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   if (NEW.SEQID IS NULL) then'
        '       NEW.SEQID = GEN_ID(GEN_EVIDENCIAS_PAF, 1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TRIGERTABPERFIL1 FOR TAB_PERFIL'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   if (NEW.CAMPO_PERFIL IS NULL) then'
        '       NEW.CAMPO_PERFIL = gen_id(INC_TAB_PERFIL, 1);'
        'END'
        '|/BLOCO|'
        ''
        'ALTER TABLE PEDVENDA ADD END_AVL VARCHAR(25);'
        'ALTER TABLE PEDVENDA ADD BAIRRO_AVL VARCHAR(17);'
        'ALTER TABLE PEDVENDA ADD CIDA_AVL VARCHAR(25);'
        'ALTER TABLE PEDVENDA ADD CEP_AVL VARCHAR(8);'
        'ALTER TABLE PEDVENDA ADD ESTA_AVL VARCHAR(12);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER trigger pedvenda_biu1 for pedvenda'
        'inactive before insert or update position 1'
        'AS'
        'begin'
        ''
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'REATE OR ALTER trigger ti_pedvenda_bi_nome_cl for pedvenda'
        'inactive before insert position 0'
        'AS'
        'begin'
        ''
        'end'
        '|/BLOCO|'
        ''
        'ALTER TABLE AGENDAMENTO ADD CODMOD_POTVEIC INTEGER;'
        'ALTER TABLE AGENDAMENTO ADD CONDPAG_POTVEIC VARCHAR(30);'
        'ALTER TABLE CLIENTES ADD MODELO_POTVEICCP  VARCHAR(60);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_AGENDAMENTO_AU0 FOR AGENDAMENTO'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (old.data_agendada <> new.data_agendada) then'
        
          '    update clientes set data_agendada = new.data_agendada where ' +
          'cod_cliente = new.cod_cliente and cod_empresa = new.cod_empresa;'
        ''
        '  if (old.codmod_potveic <> new.codmod_potveic) then'
        '  begin'
        '  if ((coalesce(new.codmod_potveic,0)) <> 0) then'
        
          '    update clientes set MODELO_POTVEICCP = (select tipmodelo.des' +
          'cricao from tipmodelo where'
        
          '    tipmodelo.codigo = new.codmod_potveic and tipmodelo.cod_empr' +
          'esa = new.cod_empresa) where cod_cliente = new.cod_cliente and c' +
          'od_empresa = new.cod_empresa;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_AGENDAMENTO_BI0 FOR AGENDAMENTO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        
          '  update clientes set data_agendada = new.data_agendada where co' +
          'd_cliente = new.cod_cliente and cod_empresa = new.cod_empresa;'
        '  if ((coalesce(new.codmod_potveic,0)) <> 0) then'
        
          '    update clientes set MODELO_POTVEICCP = (select tipmodelo.des' +
          'cricao from tipmodelo where'
        
          '    tipmodelo.codigo = new.codmod_potveic and tipmodelo.cod_empr' +
          'esa = new.cod_empresa) where cod_cliente = new.cod_cliente and c' +
          'od_empresa = new.cod_empresa;'
        
          '   if (coalesce((select cod_vendedorv from clientes where cod_cl' +
          'iente = new.cod_cliente and cod_empresa = new.cod_empresa),0) = ' +
          '0) then'
        
          '       update clientes set cod_vendedorv = new.cod_vendedor wher' +
          'e cod_cliente = new.cod_cliente and cod_empresa = new.cod_empres' +
          'a;'
        'end'
        '|/BLOCO|'
        ''
        'CREATE INDEX IDXPEDVENDA ON CUPOM (PED, PREVENDA, COD_EMPRESA);'
        ''
        '|BLOCO|'
        
          'delete from config_colunas conf where conf.componente in ('#39'cdsCt' +
          'rlCh'#39', '#39'cdsCtrlCr'#39');'
        '|/BLOCO|'
        ''
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'CLI200'#39', :COD_EMPRESA, '#39'HABILITAR C' +
          'AMPO RAZAO/FANTASIA AO EDITAR'#39', 1, '#39'FRMCADCLIENTES'#39', 1, '#39'N'#39', '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'CLI201'#39', :COD_EMPRESA, '#39'HABILITAR C' +
          'AMPO CPF/CNPJ AO EDITAR'#39', 1, '#39'FRMCADCLIENTES'#39', 1, '#39'N'#39', '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'CLI202'#39', :COD_EMPRESA, '#39'EDITAR CAMP' +
          'O RAZAO/FANTASIA'#39', 10, '#39'FRMCADCLIENTES'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DA' +
          'TE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'CLI203'#39', :COD_EMPRESA, '#39'EDITAR CAMP' +
          'O CPF/CNPJ'#39', 10, '#39'FRMCADCLIENTES'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        
          'CMD:DML|DELETE FROM CONFIG_SISTEMA WHERE CHAVE = '#39'cl_cad_simpl_c' +
          'ampos_obrigatorios'#39';')
    end
  end
end
