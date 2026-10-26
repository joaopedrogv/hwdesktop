inherited frmReestruturaVersao23: TfrmReestruturaVersao23
  Caption = 'frmReestruturaVersao23'
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
        '|BLOCO|'
        'CREATE TABLE EMPRESA_FUSO_DIF ('
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DIFERENCA    INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'CREATE UNIQUE INDEX IDX_EMPRESA_FUSO_DIF ON EMPRESA_FUSO_DIF (CO' +
          'D_EMPRESA);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_CURRENT_TS ('
        '    COD_EMPRESA bigint = 0)'
        'returns ('
        '    CURRENT_TS timestamp,'
        '    CURRENT_D timestamp,'
        '    CURRENT_T time)'
        'as'
        'begin'
        '  CURRENT_TS = dateadd(hour, coalesce((select DIFERENCA'
        '                                       from EMPRESA_FUSO_DIF'
        
          '                                       where COD_EMPRESA = :COD_' +
          'EMPRESA), 0), current_timestamp);'
        '  CURRENT_D = cast(CURRENT_TS as date);'
        '  CURRENT_T = cast(CURRENT_TS as time);'
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'CEST_' +
          #39') AND (F1.RDB$FIELD_NAME in ('#39'DATA_CADASTRO'#39', '#39'DATA_MODIFICACAO' +
          #39'));'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'CEST_' +
          'MVA'#39') AND (F1.RDB$FIELD_NAME in ('#39'DATA_CADASTRO'#39', '#39'DATA_MODIFICA' +
          'CAO'#39'));'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'CEST_' +
          'NCM'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_CADASTRO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'CEST_' +
          'VERSAO'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_CADASTRO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'CLIEN' +
          'TES_TRIB_AD'#39') AND (F1.RDB$FIELD_NAME = '#39'DATAHORA'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'NFCE_' +
          'STATUS_SERVICO'#39') AND (F1.RDB$FIELD_NAME = '#39'DATAHORA'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'ROTAS' +
          '_ENTR_CLIENTE'#39') AND (F1.RDB$FIELD_NAME = '#39'DATAHORA'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'TRANS' +
          'ACAO_CARTAO'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_HORA'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'AGEND' +
          'AMENTO'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_CADASTRO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'CENTR' +
          'O_CUSTOS'#39') AND (F1.RDB$FIELD_NAME = '#39'DT_ALT'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'MDFE'#39 +
          ') AND (F1.RDB$FIELD_NAME = '#39'DATA_CADASTRO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'MOVIM' +
          'ENTO_PDV_FINAN'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_LANCAMENTO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'PEDVE' +
          'NDA'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_CUPOM'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'PEDVE' +
          'NDA_PROD'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_INCLUSAO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'PEDVE' +
          'NDA_PROD_COND_DEV'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'PEDVE' +
          'NDA_SERV'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_INCLUSAO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'PRODU' +
          'TOS'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_ALT_PRECO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'P_CON' +
          'TAS_CONTABIL'#39') AND (F1.RDB$FIELD_NAME = '#39'DT_ALT'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'SERVI' +
          'CO_TRANSPORTE'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_LANCAMENTO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'SPED_' +
          'AQUISICAO_BENS'#39') AND (F1.RDB$FIELD_NAME IN ('#39'DATA_INICIAL'#39', '#39'DAT' +
          'A_FINAL'#39', '#39'DATA_LANC'#39'));'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'SPED_' +
          'DEPREC_AMORT_BENS'#39') AND (F1.RDB$FIELD_NAME IN ('#39'DATA_OPERACAO'#39', ' +
          #39'DATA_LANC'#39'));'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'SPED_' +
          'ESTOQUE_ABERTURA'#39') AND (F1.RDB$FIELD_NAME IN ('#39'DATA_INICIAL'#39', '#39'D' +
          'ATA_FINAL'#39', '#39'DATA_LANC'#39'));'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'SPED_' +
          'OUTRAS_RECEITAS_CREDITOS'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_LANC'#39')' +
          ';'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'SPED_' +
          'PROC_REF_ACAO_JUDICIAL'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_LANC'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'SPED_' +
          'PROC_REF_ADMINISTRATIVO'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_LANC'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'TIPMO' +
          'DELO_CODIGOFAB'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_CAD'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'VERSA' +
          'O_HW'#39') AND (F1.RDB$FIELD_NAME = '#39'DATA_DOWNLOAD'#39');'
        ''
        '|BLOCO|'
        'create or alter trigger CEST__BI_CURRENT_TS for CEST_'
        'active before insert position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        
          '  if ((new.DATA_CADASTRO is null) or (new.DATA_MODIFICACAO is nu' +
          'll)) then'
        '  begin'
        '    select CURRENT_TS'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into :CURRENT_TS;'
        ''
        '    if (new.DATA_CADASTRO is null) then'
        '      new.DATA_CADASTRO = CURRENT_TS;'
        ''
        '    if (new.DATA_MODIFICACAO is null) then'
        '      new.DATA_MODIFICACAO = CURRENT_TS;'
        ''
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger CEST_MVA_BI_CURRENT_TS for CEST_MVA'
        'active before insert position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        
          '  if ((new.DATA_CADASTRO is null) or (new.DATA_MODIFICACAO is nu' +
          'll)) then'
        '  begin'
        '    select CURRENT_TS'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into :CURRENT_TS;'
        ''
        '    if (new.DATA_CADASTRO is null) then'
        '      new.DATA_CADASTRO = CURRENT_TS;'
        ''
        '    if (new.DATA_MODIFICACAO is null) then'
        '      new.DATA_MODIFICACAO = CURRENT_TS;'
        ''
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger CEST_NCM_BI_CURRENT_TS for CEST_NCM'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  if (new.DATA_CADASTRO is null) then'
        '    select CURRENT_TS'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_CADASTRO;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger CEST_VERSAO_BI_CURRENT_TS for CEST_VERSA' +
          'O'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  if (new.DATA_CADASTRO is null) then'
        '    select CURRENT_TS'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_CADASTRO;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger CLIENTES_TRIB_AD_BI_CURRENT_TS for CLIEN' +
          'TES_TRIB_AD'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  if (new.DATAHORA is null) then'
        '    select CURRENT_TS'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATAHORA;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NFCE_STATUS_SERVICO_BI_ID FOR NFCE_STATU' +
          'S_SERVICO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  '
        '  if (new.DATAHORA is null) then'
        '    select CURRENT_TS'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATAHORA;  '
        ''
        '  if (coalesce(new.ID, 0) <= 0) then'
        '    new.ID = next value for SEQ_STATUS_SERVICO;'#9
        ''
        '  if (new.ID > 99999999) then'
        
          '    execute statement '#39'ALTER SEQUENCE SEQ_STATUS_SERVICO RESTART' +
          ' WITH 0'#39';'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER ROTAS_ENTR_CLIENTE_BI_ORD FOR ROTAS_ENTR' +
          '_CLIENTE'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'as'
        'declare variable VORDEM integer;'
        'declare variable VCOD_CLIENTE integer;'
        'declare variable VEND_DOC_ADD_SEQID integer;'
        'begin'
        '  /* Trigger text */'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if ((inserting) and (new.DATAHORA is null)) then'
        '    select CURRENT_TS'
        '      from SP_CURRENT_TS(new.COD_EMPRESA)'
        '        into new.DATAHORA;'
        ''
        '  if (coalesce(new.ORDEM, 0) = 0) then'
        '  begin'
        
          '    select first 1 RE.ORDEM, RE.COD_CLIENTE, RE.END_DOC_ADD_SEQI' +
          'D'
        '    from ROTAS_ENTR_CLIENTE RE'
        '    where RE.COD_ROTA = new.COD_ROTA and'
        '          RE.COD_EMPRESA = new.COD_EMPRESA'
        '    order by RE.ORDEM desc'
        '    into :VORDEM, :VCOD_CLIENTE, :VEND_DOC_ADD_SEQID;'
        
          '    if ((new.COD_CLIENTE <> VCOD_CLIENTE) or (new.END_DOC_ADD_SE' +
          'QID <> VEND_DOC_ADD_SEQID) or (VORDEM is null)) then'
        '      VORDEM = coalesce(VORDEM, 0) + 1;'
        ''
        '    new.ORDEM = coalesce(VORDEM, 0);'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TRANSACAO_CARTAO_BI_CURRENT_TS for TRANS' +
          'ACAO_CARTAO'
        'active before insert position 0'
        'as'
        'begin'
        '  if (new.DATA_HORA is null) then'
        '    select CURRENT_TS'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_HORA;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger BADEL_MOBILE for BAIRROS'
        'active after delete position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS'
        '    into :CURRENT_TS;'
        ''
        
          '  insert into DEL_MOBILE (SEQID, COD_EMPRESA, DATA_HORA_DEL, ID_' +
          'DEL, TABELA)'
        '  values ((select COD'
        
          '           from INCREMENTA_CODIGO(1, '#39'DEL_MOBILE'#39')), 1, :CURRENT' +
          '_TS, old.COD_BAIRRO, '#39'BAIRROS'#39');'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger CDDEL_MOBILE for CIDADES'
        'active after delete position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS'
        '    into :CURRENT_TS;'
        ''
        
          '  insert into DEL_MOBILE (SEQID, COD_EMPRESA, DATA_HORA_DEL, ID_' +
          'DEL, TABELA)'
        '  values ((select COD'
        
          '           from INCREMENTA_CODIGO(1, '#39'DEL_MOBILE'#39')), 1, :CURRENT' +
          '_TS, old.COD_CIDADE, '#39'CIDADES'#39');'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger CLDEL_MOBILE for CLIENTES'
        'active after delete position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS'
        '    into :CURRENT_TS;'
        ''
        
          '  insert into DEL_MOBILE (SEQID, COD_EMPRESA, DATA_HORA_DEL, ID_' +
          'DEL, TABELA)'
        '  values ((select COD'
        
          '           from INCREMENTA_CODIGO(old.COD_EMPRESA, '#39'DEL_MOBILE'#39')' +
          '), old.COD_EMPRESA, :CURRENT_TS, old.COD_CLIENTE,'
        '          '#39'CLIENTES'#39');'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger EFD_ICMSST_CR_APURACAO_AUT for EFD_ICMSS' +
          'T_CR_APURACAO'
        'active before insert or update position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '  if (inserting) then'
        '  begin'
        '    new.DATA_CADASTRO = CURRENT_TS;'
        '    new.DATA_ALTERACAO = new.DATA_CADASTRO;'
        '    if (coalesce(new.ID, 0) = 0) then'
        '      select COD'
        
          '      from INCREMENTA_CODIGO(new.COD_EMPRESA, '#39'EFD_ICMSST_CR_APU' +
          'RACAO'#39')'
        '        into new.ID;'
        '  end'
        '  else'
        '    new.DATA_ALTERACAO = CURRENT_TS;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger NFC_CENTRAL_ACOES_BI0 for NFC_CENTRAL_AC' +
          'OES'
        'active before insert position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '  if (coalesce(new.SEQID, 0) = 0) then'
        '    new.SEQID = gen_id(GEN_NFC_CENTRAL_ACOES, 1);'
        '  if (new.DATA_CADASTRO is null) then'
        '    new.DATA_CADASTRO = CURRENT_TS;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PEDPROD_BIU_EVID_D4 for PEDVENDA_PROD'
        'active before insert or update or delete position 0'
        'as'
        'begin'
        '  /**/'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PEDSERV_BIU_EVID_D4 for PEDVENDA_SERV'
        'active before insert or update or delete position 0'
        'as'
        'begin'
        '  /**/'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PEDVENDA_AI_SIT_PED for PEDVENDA'
        'active after insert position 0'
        'as'
        '  declare variable VCODIG integer;'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if ((new.TIPO = '#39'REQ'#39') or (RTRIM(new.TIPO) = '#39'OS'#39')) then'
        '  begin'
        ''
        '    select CURRENT_TS'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into :CURRENT_TS;'
        ''
        '    select COD'
        '    from INCREMENTA_CODIGO(new.COD_EMPRESA, '#39'OCORRENCIAS_OS'#39')'
        '      into :VCODIG;'
        
          '    insert into OCORRENCIAS_OS (COD_OCORRENCIA, NPED, TIPO, COD_' +
          'EMPRESA, HISTORICO_OC, DATA_E_HORA, ATIVO, N_OS,'
        '                                SITUACAO, STATUS_SITUACAO)'
        
          '    values (:VCODIG, new.NPED, new.TIPO, new.COD_EMPRESA, '#39'PEDID' +
          'O - Iniciado'#39', :CURRENT_TS, 1, new.NPED, '#39'PEDIDO'#39','
        '            '#39'Iniciado'#39');'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PEDVENDA_AU_SIT_CP_FAT for PEDVENDA'
        'active after update position 0'
        'AS'
        '  declare variable vnumnf integer;'
        '  declare variable vnumoc integer;'
        '  declare variable vcodig integer;    '
        '  declare variable current_ts timestamp;'
        'begin'
        
          '  if ((coalesce(old.ncupom, 0) = 0) and (coalesce(new.ncupom, 0)' +
          ' > 0)) then'
        '  begin'
        
          '    select first 1 COD_OCORRENCIA from OCORRENCIAS_OS where NPED' +
          ' = new.nped and TIPO = new.tipo and COD_EMPRESA = new.cod_empres' +
          'a'
        
          '      and SITUACAO = '#39'FATURAMENTO'#39' and STATUS_SITUACAO = '#39'Inicia' +
          'do'#39' into :vnumoc; '
        ''
        
          '    select CURRENT_TS from SP_CURRENT_TS(new.COD_EMPRESA) into :' +
          'CURRENT_TS;'
        ''
        '    if (coalesce(vnumoc,0) = 0) then'
        '    begin'
        
          '      select COD from INCREMENTA_CODIGO(new.cod_empresa, '#39'OCORRE' +
          'NCIAS_OS'#39') into vcodig;'
        
          '      insert into OCORRENCIAS_OS (COD_OCORRENCIA, NPED, TIPO, CO' +
          'D_EMPRESA, HISTORICO_OC, DATA_E_HORA, ATIVO, N_OS, SITUACAO, STA' +
          'TUS_SITUACAO)'
        
          '        values (:vcodig, new.nped, new.tipo, new.cod_empresa, '#39'F' +
          'ATURAMENTO - Iniciado'#39', :current_ts , 1, new.nped, '#39'FATURAMENTO'#39 +
          ', '#39'Iniciado'#39');'
        '    end'
        '    '
        
          '    select first 1 COD_OCORRENCIA from OCORRENCIAS_OS where NPED' +
          ' = new.nped and TIPO = new.tipo and COD_EMPRESA = new.cod_empres' +
          'a'
        
          '      and SITUACAO = '#39'FATURAMENTO'#39' and STATUS_SITUACAO = '#39'Finali' +
          'zado'#39' into :vnumoc;'
        ''
        '    if (coalesce(vnumoc,0) = 0) then'
        '    begin'
        
          '      select COD from INCREMENTA_CODIGO(new.cod_empresa, '#39'OCORRE' +
          'NCIAS_OS'#39') into vcodig;'
        
          '      insert into OCORRENCIAS_OS (COD_OCORRENCIA, NPED, TIPO, CO' +
          'D_EMPRESA, HISTORICO_OC, DATA_E_HORA, ATIVO, N_OS, SITUACAO, STA' +
          'TUS_SITUACAO)'
        
          '        values (:vcodig, new.nped, new.tipo, new.cod_empresa, '#39'F' +
          'ATURAMENTO - Finalizado'#39', :current_ts , 1, new.nped, '#39'FATURAMENT' +
          'O'#39', '#39'Finalizado'#39');'
        '    end'
        ''
        '  end'
        
          '  else if ((coalesce(old.ncupom, 0) > 0) and (coalesce(new.ncupo' +
          'm, 0) = 0)) then'
        '  begin'
        
          '    if ((coalesce(new.num_nf, 0) = 0) and (coalesce(new.num_nfee' +
          'xt, 0) = 0)) then'
        '    begin'
        '      select first 1 pp.n_nf from pedvenda_prod pp'
        
          '        where pp.nped = new.nped and pp.tipo = new.tipo and pp.c' +
          'od_empresa = new.cod_empresa and pp.n_nf > 0'
        '        into :vnumnf;'
        ''
        '      if (coalesce(vnumnf,0) = 0) then'
        '      begin'
        
          '        delete from OCORRENCIAS_OS where NPED = new.nped and TIP' +
          'O = new.tipo and COD_EMPRESA = new.cod_empresa and'
        '          SITUACAO = '#39'FATURAMENTO'#39';'
        '      end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PMDEL_MOBILE for PROMOCAO_PRODUTO'
        'active after delete position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS(old.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        
          '  insert into DEL_MOBILE (SEQID, COD_EMPRESA, DATA_HORA_DEL, ID_' +
          'DEL, TABELA)'
        '  values ((select COD'
        
          '           from INCREMENTA_CODIGO(old.COD_EMPRESA, '#39'DEL_MOBILE'#39')' +
          '), old.COD_EMPRESA, :CURRENT_TS, old.SEQID,'
        '          '#39'PROMOCAO_PRODUTO'#39');'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PRDEL_MOBILE for PRODUTOS'
        'active after delete position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS(old.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        
          '  insert into DEL_MOBILE (SEQID, COD_EMPRESA, DATA_HORA_DEL, ID_' +
          'DEL, TABELA)'
        '  values ((select COD'
        
          '           from INCREMENTA_CODIGO(old.COD_EMPRESA, '#39'DEL_MOBILE'#39')' +
          '), old.COD_EMPRESA, :CURRENT_TS, old.SEQID, '#39'PRODUTOS'#39');'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_COLAB_BIU_ENV_WSHW for COLABORADOR'
        'active before insert or update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.data_hora_env_ws = old.data_hora_env_ws ) then'
        
          '    select current_d from sp_current_ts into new.data_hora_alt_w' +
          's;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_EQUIPAMENTO_SUGESTAO for EQUIPAMENTO'
        'active after insert or update position 0'
        'AS'
        '    declare variable vsugservico integer;'
        '    declare variable vusaraparelho char(3);'
        '    declare variable vcodserv integer;'
        '    declare variable vcodsug integer;'
        '    declare variable vcodsugos integer;'
        '    declare variable vinterm integer;'
        '    declare variable vdatacad timestamp;'
        '    declare variable vhoracad char(8);'
        '    declare variable vexistesug integer;  '
        '    declare variable current_ts timestamp;'
        'begin'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        ''
        '    if (new.cod_equip <= 0) then'
        '        exit;'
        ''
        '    select empresa.dadvap  from empresa'
        '    where empresa.cod_empresa = new.cod_empresa'
        '    into: vusaraparelho;'
        ''
        '    if (vusaraparelho <> '#39'SIM'#39') then'
        '        exit;'
        ''
        '    select config_sistema.value1_f from config_sistema'
        '    where config_sistema.chave like '#39'sug_serv_hab'#39
        '    and config_sistema.cod_empresa = new.cod_empresa'
        '    into: vSugServico;'
        ''
        '    if (vsugservico <= 0) then'
        '        exit;'
        ''
        '    select first 1 sugestaoservico.cod_sug from sugestaoservico'
        
          '    where sugestaoservico.cod_equip = new.cod_equip and sugestao' +
          'servico.cod_empresa = new.cod_empresa'
        '    and coalesce(sugestaoservico.status, '#39#39') <> '#39'CANCELADA'#39
        '    into: vExisteSug;'
        ''
        '    if (vExisteSug > 0) then'
        '        exit;'
        ''
        
          '    select current_d, current_ts from sp_current_ts(new.cod_empr' +
          'esa)'
        '      into :vDataCad, :current_ts;'
        ''
        
          '    select case when(extract(hour from :current_ts) <=9) then '#39'0' +
          #39'|| extract(hour from :current_ts)'
        '    else extract(hour from :current_ts)'
        
          '    end ||'#39':'#39'|| case when (extract(minute from :current_ts) <= 9' +
          ') then'
        '        '#39'0'#39'|| extract(minute from :current_ts)'
        '    else extract(minute from :current_ts) end from rdb$database'
        '    into: vHoraCad;'
        ''
        
          '    for select regras_sug.codigo, regras_sug.interv_mes_serv fro' +
          'm regras_sug'
        
          '    inner join regras_sug_itens on regras_sug_itens.codigo = reg' +
          'ras_sug.codigo and regras_sug_itens.cod_empresa = regras_sug.cod' +
          '_empresa'
        
          '    where regras_sug_itens.cod_tipo = new.cod_equip and regras_s' +
          'ug_itens.cod_empresa = new.cod_empresa and regras_sug.ativo = 1'
        '    and regras_sug.tipo = '#39'E'#39
        '    into: vCodServ, vInterM do'
        '    begin'
        '        if (vInterM > 0) then'
        '        begin'
        
          '            select cod from incrementa_codigo(new.cod_empresa, '#39 +
          'SUGESTAOSERVICO'#39') into: vCodSug;'
        ''
        
          '            select cod from incrementa_codigo(new.cod_empresa, '#39 +
          'SUG_OS'#39') into: vCodSugOs;'
        ''
        '            INSERT INTO SUG_OS'
        
          '            (COD_SUG_OS, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASS' +
          'I, PLACA, US_CAD, DATA_CAD, HORA_CAD,'
        '            KM, NDOC, TPDOC, COD_SERV_SUG, COD_VENDEDOR, ATIVO)'
        '            VALUES'
        
          '            (:vCodSugOs, new.cod_empresa, new.cod_equip, null, n' +
          'ull, null, new.us_cad, :vDataCad, :vHoraCad,'
        
          '            null, null, null, :vcodserv, coalesce(new.us_cad, 0)' +
          ', 1);'
        '    '
        '            INSERT INTO SUGESTAOSERVICO'
        
          '            (COD_SUG, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASSI, ' +
          'PLACA, COD_SUG_OS, ULT_ATD, DATA, HORA,'
        
          '            ATIVO, COD_CLIENTE, US_CAD, DATA_CAD, HORA_CAD, NDOC' +
          '_ANT, TPDOC_ANT, COD_SERV_SUG, DIAS, TIPO)'
        '            VALUES'
        
          '            (:vCodSug, new.cod_empresa, new.cod_equip, null, nul' +
          'l, null, null,'
        
          '            new.us_cad, (:vDataCad + (:vInterM * 30)), :vHoraCad' +
          ','
        
          '            1, new.cod_prop,  coalesce(new.us_cad, 0), :vDataCad' +
          ', :vHoraCad,'
        
          '            null, null, :vcodserv, (:vInterM * 30), '#39'INTERVALO M' +
          'ESES ENTRE AS REVISOES'#39');'
        '        end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_PEDVENDA_EMAIL_MARKETING for PEDVENDA'
        'active before insert or update position 0'
        'AS'
        'DECLARE VARIABLE  vEnvEmail char(1);'
        'DECLARE VARIABLE  vEmail varchar(256);'
        'DECLARE VARIABLE  vTipv char(1);'
        'DECLARE VARIABLE  vOrcamentoSoPecas Integer;'
        'DECLARE VARIABLE  vExistEmail Integer;'
        'DECLARE VARIABLE  vTemp varchar(60);   '
        'DECLARE VARIABLE CURRENT_TS timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if ((not inserting) and (not updating)) then'
        '    exit;'
        ''
        '  select coalesce(emp.env_mail_mark, '#39'N'#39') from empresa emp'
        '  where emp.cod_empresa = new.cod_empresa and emp.ativo = 1'
        '  into : vEnvEmail;'
        ''
        '  if (trim(coalesce(vEnvEmail, '#39#39')) <> '#39'S'#39') then'
        '    exit;'
        ''
        
          '  select coalesce(cl.rec_mail_mark, '#39'N'#39'), cl.email from clientes' +
          ' cl'
        
          '  where cl.cod_cliente = new.cod_cliente and cl.cod_empresa = ne' +
          'w.cod_empresa'
        '   into : vEnvEmail, vEmail;'
        ''
        '  if (trim(coalesce(vEnvEmail, '#39#39')) <> '#39'S'#39') then'
        '    exit;'
        ''
        '  if (trim(coalesce(vEmail, '#39#39')) = '#39#39') then'
        '    exit;'
        ''
        '  if ((trim(new.tipo) = '#39'REQ'#39') or (trim(new.tipo) = '#39'ORC'#39')) then'
        '  begin'
        '      if (trim(new.tipo) = '#39'ORC'#39') then'
        '      begin'
        '        select count(*) from pedvenda_serv serv'
        
          '        where serv.nped = new.nped and serv.tipo = new.tipo and ' +
          'serv.cod_empresa = new.cod_empresa'
        '         into : vOrcamentoSoPecas;'
        '      end'
        ''
        
          '      if ((trim(new.tipo) = '#39'REQ'#39') or ((trim(new.tipo) = '#39'ORC'#39') ' +
          'and (coalesce(vOrcamentoSoPecas, 0) = 0))) then'
        '      begin'
        
          '          select coalesce(tp.env_email, '#39'N'#39') env_email from pedv' +
          'enda pd'
        
          '          left join tipo_vendas tp on tp.sigla = pd.tipv and tp.' +
          'tipo = '#39'REQ'#39
        
          '          where pd.nped = new.nped and pd.tipo = new.tipo and pd' +
          '.cod_empresa = new.cod_empresa'
        '          into : vEnvEmail;'
        '      end'
        '      else'
        '      begin'
        
          '          select coalesce(tp.env_email, '#39'N'#39') env_email from pedv' +
          'enda pd'
        
          '          left join tipo_vendas tp on tp.sigla = pd.tipo_orc and' +
          ' tp.tipo = new.tipo'
        
          '          where pd.nped = new.nped and pd.tipo = new.tipo and pd' +
          '.cod_empresa = new.cod_empresa'
        '          into : vEnvEmail;'
        '      end '
        '  end'
        '  else'
        '  begin'
        
          '      select coalesce(tp.env_email, '#39'N'#39') env_email from pedvenda' +
          ' pd'
        
          '      left join tipo_vendas tp on tp.tipo_os = pd.tipo_os and tp' +
          '.tipo = new.tipo'
        
          '      where pd.nped = new.nped and pd.tipo = new.tipo and pd.cod' +
          '_empresa = new.cod_empresa'
        '      into : vEnvEmail;'
        '  end'
        ''
        
          '  if ((trim(coalesce(vEnvEmail, '#39#39')) <> '#39'A'#39') and (trim(coalesce(' +
          'vEnvEmail, '#39#39')) <> '#39'F'#39')) then'
        '     exit;'
        ''
        '   select count(*) from email_marketing e'
        
          '   where e.cod_documento = new.nped and trim(e.tipo) = trim(new.' +
          'tipo) and e.cod_empresa = new.cod_empresa'
        '    into : vExistEmail;'
        ''
        '   if (coalesce(vexistemail, 0) > 0) then'
        '     exit;'
        ''
        '   if (trim(new.tipo) = '#39'ORC'#39') then'
        '     vTemp = '#39'Envio do Orcamento Num: '#39' || new.nped;'
        '   else if (trim(new.tipo) = '#39'REQ'#39') then'
        '     vTemp = '#39'Envio da Requisicao Num: '#39' || new.nped;'
        '   else'
        '     vTemp = '#39'Envio da Ordem de Servico Num: '#39' || new.nped;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '    if (inserting) then'
        '    begin'
        '      if (trim(coalesce(vEnvEmail, '#39#39')) <> '#39'A'#39') then'
        '       exit;'
        ''
        
          '      insert into email_marketing (CODIGO, COD_EMPRESA, COD_DOCU' +
          'MENTO, ASSUNTO, TIPO, DESCRICAO, DATA_HORA, TP_ENVIO)'
        
          '      values ((select cod from incrementa_codigo(new.cod_empresa' +
          ', '#39'EMAIL_MARKETING'#39')),'
        '       new.cod_empresa, new.nped,'
        '       :vTemp, trim(new.tipo), :vTemp, :CURRENT_TS, '#39'I'#39');'
        '   end'
        '   if (updating) then'
        '   begin'
        '      if ( (trim(coalesce(vEnvEmail, '#39#39')) = '#39'A'#39')'
        
          '      or ( (trim(coalesce(old.status_ped, '#39#39')) <> trim(coalesce(' +
          'new.status_ped, '#39#39')) )'
        
          '        and (trim(coalesce(new.status_ped, '#39#39')) = '#39'FECHADA'#39') and' +
          ' (trim(coalesce(vEnvEmail, '#39#39')) = '#39'F'#39')) )  then'
        ''
        
          '      insert into email_marketing (CODIGO, COD_EMPRESA, COD_DOCU' +
          'MENTO, ASSUNTO, TIPO, DESCRICAO, DATA_HORA, TP_ENVIO)'
        
          '      values ((select cod from incrementa_codigo(new.cod_empresa' +
          ', '#39'EMAIL_MARKETING'#39')),'
        '       new.cod_empresa, new.nped,'
        '       :vTemp, trim(new.tipo), :vTemp, :CURRENT_TS, '#39'I'#39');'
        '   end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_PROD_ALT_BIU_WS for PRODUTOS_ALTERACO' +
          'ES'
        'active before insert or update position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_TS'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '  new.DATA_HORA_ALT_WS = :CURRENT_TS;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_VEICULOS_SUGESTAO for VEICULOS'
        'active after insert or update position 0'
        'AS'
        '    DECLARE VARIABLE vSugServico integer;'
        '    DECLARE VARIABLE vUsarAparelho char(3);'
        '    DECLARE VARIABLE vCodServ integer;'
        '    DECLARE VARIABLE vCodSug integer;'
        '    DECLARE VARIABLE vCodSugOs integer;'
        '    DECLARE VARIABLE vMesP integer;'
        '    DECLARE VARIABLE vDias integer;'
        '    DECLARE VARIABLE vDataCad timestamp;'
        '    DECLARE VARIABLE vHoraCad char(8);'
        '    DECLARE VARIABLE vExisteSug integer;    '
        '    DECLARE VARIABLE current_ts timestamp;'
        'begin'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        ''
        '    if (new.modelo <= 0) then'
        '        exit;'
        ''
        '    if (coalesce(new.km_v, 0) > 0) then'
        '        exit;'
        ''
        '    select empresa.dadvap from empresa'
        '    where empresa.cod_empresa = new.cod_empresa'
        '    into: vusaraparelho;'
        ''
        '    if (trim(vusaraparelho) = '#39'SIM'#39') then'
        '        exit;'
        ''
        '    select config_sistema.value1_f from config_sistema'
        '    where config_sistema.chave = '#39'sug_serv_hab'#39
        '    and config_sistema.cod_empresa = new.cod_empresa'
        '    into: vSugServico;'
        ''
        '    if (vsugservico <= 0) then'
        '        exit;'
        ''
        '    select first 1 sugestaoservico.cod_sug from sugestaoservico'
        
          '    where sugestaoservico.placa = new.placa and sugestaoservico.' +
          'chassi = new.chassi'
        
          '    and sugestaoservico.cod_veic = new.codigo and sugestaoservic' +
          'o.cod_empresa = new.cod_empresa'
        '    and coalesce(sugestaoservico.status, '#39#39') <> '#39'CANCELADA'#39
        '    into: vExisteSug;'
        ''
        '    if (vExisteSug > 0) then'
        '        exit;'
        ''
        
          '    select cast(current_ts as date), current_ts from sp_current_' +
          'ts(new.cod_empresa)'
        '      into :vDataCad, :current_ts;'
        ''
        
          '    select case when(extract(hour from :current_ts) <=9) then '#39'0' +
          #39'|| extract(hour from :current_ts)'
        '    else extract(hour from :current_ts)'
        
          '    end ||'#39':'#39'|| case when (extract(minute from :current_ts) <= 9' +
          ') then'
        '        '#39'0'#39'|| extract(minute from :current_ts)'
        '    else extract(minute from :current_ts) end from rdb$database'
        '    into: vHoraCad;'
        ''
        '    for select regras_sug.codigo,'
        
          '     case when(regras_sug.mes_ret_serv1 > 0) then regras_sug.mes' +
          '_ret_serv1 else regras_sug.interv_mes_serv end from regras_sug'
        
          '    inner join regras_sug_itens on regras_sug_itens.codigo = reg' +
          'ras_sug.codigo and regras_sug_itens.cod_empresa = regras_sug.cod' +
          '_empresa'
        
          '    where regras_sug_itens.cod_tipo = new.modelo and regras_sug_' +
          'itens.cod_empresa = new.cod_empresa and regras_sug.ativo = 1'
        '    and regras_sug.tipo = '#39'V'#39
        '    into: vCodServ, vMesP  do'
        '    begin'
        '        if (vMesP > 0) then'
        '        begin'
        '            vDias = vMesP;'
        ''
        
          '            select cod from incrementa_codigo(new.cod_empresa, '#39 +
          'SUGESTAOSERVICO'#39') into: vCodSug;'
        ''
        
          '            select cod from incrementa_codigo(new.cod_empresa, '#39 +
          'SUG_OS'#39') into: vCodSugOs;'
        ''
        '            INSERT INTO SUG_OS'
        
          '            (COD_SUG_OS, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASS' +
          'I, PLACA, US_CAD, DATA_CAD, HORA_CAD,'
        '            KM, NDOC, TPDOC, COD_SERV_SUG, COD_VENDEDOR, ATIVO)'
        '            VALUES'
        
          '            (:vCodSugOs, new.cod_empresa, null, new.codigo, new.' +
          'chassi, new.placa, new.us_cad, :vDataCad, :vHoraCad,'
        
          '            0, null, null, :vcodserv, coalesce(new.us_cad, 0), 1' +
          ');'
        ''
        '            INSERT INTO SUGESTAOSERVICO'
        
          '            (COD_SUG, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASSI, ' +
          'PLACA, COD_SUG_OS, ULT_ATD, DATA, HORA,'
        
          '            ATIVO, COD_CLIENTE, US_CAD, DATA_CAD, HORA_CAD, NDOC' +
          '_ANT, TPDOC_ANT, COD_SERV_SUG, DIAS, TIPO)'
        '            VALUES'
        
          '            (:vCodSug, new.cod_empresa, null, new.codigo, new.ch' +
          'assi, new.placa, null,'
        '            new.us_cad, (:vDataCad + (:vDias * 30)), :vHoraCad,'
        
          '            1, new.cod_cliente, coalesce(new.us_cad, 0), :vDataC' +
          'ad, :vHoraCad,'
        
          '            null, null, :vcodserv, (:vDias * 30), '#39'MES PRIMEIRA ' +
          'REVISAO'#39');'
        '        end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTCA_PRODUTOS_EC FOR PRODUTOS_EC'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  DECLARE VARIABLE COMERCIOABERTO INTEGER;'
        '  DECLARE VARIABLE VSEQID BIGINT;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'comercio_aberto_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: COMER' +
          'CIOABERTO;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'comercio_aberto_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = OLD.COD_EMPRESA INTO: COMER' +
          'CIOABERTO;'
        '  end'
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        
          '    if ((NEW.ID_COMERCIO_ABERTO <= 0) and (COALESCE(COMERCIOABER' +
          'TO, 0) <= 0)) then'
        '        exit;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '     if ((OLD.ID_COMERCIO_ABERTO <= 0) and (COALESCE(COMERCIOABE' +
          'RTO, 0) <= 0)) then'
        '        exit;'
        '  end'
        ''
        '  if (inserting) then'
        '  begin'
        '    select count(COD_GRADE)'
        '    from COD_GRADE_PROD'
        '    where GRUPO_PROD = new.GRUPO_PROD and'
        '          COD_PROD = new.COD_PROD and'
        '          COD_EMPRESA = new.COD_EMPRESA and'
        '          COD_GRADE > 0'
        '      into :VSEQID;'
        ''
        '    if (VSEQID = 0) then'
        '      new.SEQID_CA = (select gen_id(SEQ_DEL_CA, 1)'
        '                      from RDB$DATABASE);'
        '    exit;'
        '  end'
        ''
        '  if ((old.ENV_COMERCIO_ABERTO = '#39'S'#39') and'
        '      (new.ENV_COMERCIO_ABERTO = '#39'N'#39')) then'
        '    update PRODUTOS_EC_GRADE'
        '    set PRODUTOS_EC_GRADE.ENV_COMERCIO_ABERTO = '#39'N'#39
        '    where PRODUTOS_EC_GRADE.GRUPO_PROD = old.GRUPO_PROD and'
        '          PRODUTOS_EC_GRADE.COD_PROD = old.COD_PROD and'
        '          PRODUTOS_EC_GRADE.COD_EMPRESA = old.COD_EMPRESA and'
        '          PRODUTOS_EC_GRADE.ENV_COMERCIO_ABERTO = '#39'S'#39';'
        ''
        '  if (coalesce(old.ID_COMERCIO_ABERTO, 0) <= 0) then'
        '    exit;'
        ''
        '  if (deleting) then'
        '  begin'
        '    select gen_id(SEQ_DEL_CA, 1)'
        '    from RDB$DATABASE'
        '      into :VSEQID;'
        
          '    insert into DEL_CA (SEQID, COD_EMPRESA, TABELA, DATA_HORA_AL' +
          'T, ID_COMERCIO_ABERTO)'
        
          '    values (:VSEQID, old.COD_EMPRESA, '#39'PRODUTOS_EC'#39', (select CUR' +
          'RENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), old.ID_COMERCIO_AB' +
          'ERTO);'
        '  end'
        '  else'
        '  if ((inserting) or (updating)) then'
        '  begin'
        '    new.SEQID_CA = (select gen_id(SEQ_DEL_CA, 1)'
        '                    from RDB$DATABASE);'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_DTCA_PRODUTOS_EC_GRADE FOR PRODUTOS_E' +
          'C_GRADE'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  DECLARE VARIABLE COMERCIO_ABERTO INTEGER;'
        '  DECLARE VARIABLE ID_COMERCIO_ABERTO INTEGER;'
        '  DECLARE VARIABLE VSEQID BIGINT;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F from CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'comercio_aberto_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO :COMER' +
          'CIO_ABERTO;'
        '    '
        '    SELECT PRODUTOS_EC.ID_COMERCIO_ABERTO from PRODUTOS_EC'
        '    WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD'
        '    AND PRODUTOS_EC.COD_PROD = NEW.COD_PROD'
        
          '    AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :ID_COMER' +
          'CIO_ABERTO;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F from CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'comercio_aberto_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = OLD.COD_EMPRESA INTO :COMER' +
          'CIO_ABERTO;'
        '    '
        '    SELECT PRODUTOS_EC.ID_COMERCIO_ABERTO from PRODUTOS_EC'
        '    WHERE PRODUTOS_EC.GRUPO_PROD = OLD.GRUPO_PROD'
        '    AND PRODUTOS_EC.COD_PROD = OLD.COD_PROD'
        
          '    AND PRODUTOS_EC.COD_EMPRESA = OLD.COD_EMPRESA INTO :ID_COMER' +
          'CIO_ABERTO;'
        '  end'
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        
          '    if ((COALESCE(NEW.ID_COMERCIO_ABERTO, 0) <= 0) and (COALESCE' +
          '(ID_COMERCIO_ABERTO, 0) <= 0) and (COALESCE(COMERCIO_ABERTO, 0) ' +
          '<= 0)) then'
        '      exit;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '    if ((COALESCE(OLD.ID_COMERCIO_ABERTO, 0) <= 0) and (COALESCE' +
          '(ID_COMERCIO_ABERTO, 0) <= 0) and (COALESCE(COMERCIO_ABERTO, 0) ' +
          '<= 0)) then'
        '      exit;'
        '  end'
        ''
        '  if ((deleting) and'
        '      (coalesce(old.ID_COMERCIO_ABERTO, 0) > 0)) then'
        '  begin'
        '    select gen_id(SEQ_DEL_CA, 1)'
        '    from RDB$DATABASE'
        '      into :VSEQID;'
        
          '    insert into DEL_CA (SEQID, COD_EMPRESA, TABELA, DATA_HORA_AL' +
          'T, ID_COMERCIO_ABERTO)'
        
          '    values (:VSEQID, old.COD_EMPRESA, '#39'PRODUTOS_EC_GRADE'#39', (sele' +
          'ct CURRENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), old.ID_COMER' +
          'CIO_ABERTO);'
        '  end'
        '  else if ((inserting) or (updating)) then'
        '  begin'
        
          '    new.SEQID_CA = (select gen_id(SEQ_DEL_CA, 1) from RDB$DATABA' +
          'SE);'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTCA_TIPO_SERVICO FOR TIPO_SERVICO'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  declare variable VSEQID bigint;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (deleting) then'
        '  begin'
        '    select gen_id(SEQ_DEL_CA, 1)'
        '    from RDB$DATABASE'
        '      into :VSEQID;'
        
          '    insert into DEL_CA (SEQID, COD_EMPRESA, TABELA, DATA_HORA_AL' +
          'T, ID_COMERCIO_ABERTO)'
        
          '    values (:VSEQID, old.COD_EMPRESA, '#39'TIPO_SERVICO'#39', (select CU' +
          'RRENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), old.ID_COMERCIO_A' +
          'BERTO);'
        '  end'
        '  else'
        '  if ((inserting) or (updating)) then'
        '  begin'
        '    if ((old.ATIVO = 1) and'
        '        (new.ATIVO = 0)) then'
        '      if (new.ENV_COMERCIO_ABERTO = '#39'S'#39') then'
        '        new.ENV_COMERCIO_ABERTO = '#39'N'#39';'
        ''
        '    new.SEQID_CA = (select gen_id(SEQ_DEL_CA, 1)'
        '                    from RDB$DATABASE);'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_KITS_PROD_EC FOR KITS_PROD_EC'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        '  DECLARE VARIABLE VSEQID BIGINT;'
        '  DECLARE VARIABLE VDELETE INTEGER; '
        'begin'
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if ((inserting)or(updating)) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMM' +
          'ERCE;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = OLD.COD_EMPRESA INTO: ECOMM' +
          'ERCE;'
        '  end'
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        
          '    if ((NEW.ID_COMMERCE <= 0) and (COALESCE(ECOMMERCE, 0) <= 0)' +
          ') then'
        '        exit;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '     if ((OLD.ID_COMMERCE <= 0) and (COALESCE(ECOMMERCE, 0) <= 0' +
          ')) then'
        '        exit;'
        '  end'
        ''
        '  VDELETE = 0;   '
        '  if (deleting) then '
        '    VDELETE = 1; '
        ''
        '  if (vdelete > 0) then '
        '  begin '
        '    if (COALESCE(OLD.ID_COMMERCE, 0) <= 0) then '
        '     exit; '
        ''
        
          '    SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO :VSEQID;' +
          ' '
        
          '    INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_HORA_ALT' +
          '_WS, ID_COMMERCE)  '
        
          '    VALUES(:VSEQID, old.COD_EMPRESA, '#39'KITS_PROD_EC'#39', (select CUR' +
          'RENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), OLD.ID_COMMERCE);'
        '  end '
        '  else if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_KITS_PROD_EC, 1) FROM R' +
          'DB$DATABASE);'
        '  end '
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_DTEC_KITS_PROD_KITS_EC FOR KITS_PROD_' +
          'KITS'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '    DECLARE VARIABLE ECOMMERCE INTEGER;'
        '    DECLARE VARIABLE IDCOMMERCE INTEGER;'
        '    DECLARE VARIABLE VSEQID BIGINT;'
        '    DECLARE VARIABLE VDELETE INTEGER;    '
        '    DECLARE VARIABLE VIDCOMMERCE_KIT INTEGER;'
        'begin'
        '    /* Trigger text */'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        ''
        '    if ((inserting)or(updating)) then'
        '    begin'
        '      SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '      WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '      AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECO' +
          'MMERCE;'
        '    '
        '      SELECT KITS_PROD_EC.ID_COMMERCE FROM KITS_PROD_EC'
        '      WHERE KITS_PROD_EC.CODIGO_KIT = NEW.CODIGO_KIT'
        
          '      AND KITS_PROD_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO: IDCOM' +
          'MERCE;'
        '    end'
        '    else if (deleting) then'
        '    begin'
        '      SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '      WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '      AND CONFIG_SISTEMA.COD_EMPRESA = OLD.COD_EMPRESA INTO: ECO' +
          'MMERCE;'
        '    '
        '      SELECT KITS_PROD_EC.ID_COMMERCE FROM KITS_PROD_EC'
        '      WHERE KITS_PROD_EC.CODIGO_KIT = OLD.CODIGO_KIT'
        
          '      AND KITS_PROD_EC.COD_EMPRESA = OLD.COD_EMPRESA INTO: IDCOM' +
          'MERCE;'
        '    end'
        ''
        
          '    if ((COALESCE(IDCOMMERCE, 0) <= 0) and (COALESCE(ECOMMERCE, ' +
          '0) <= 0)) then'
        '      exit;'
        ''
        '    VDELETE = 0;'
        '    if (updating) then'
        
          '        if (coalesce(old.ativo, 0) <> (coalesce(new.ativo, 0)) a' +
          'nd (coalesce(new.ativo, 0) = 0)) then'
        '            VDELETE = 1;'
        ''
        '    if (updating) then'
        
          '        if (coalesce(old.sinc_ecommerce, '#39'N'#39') <> (coalesce(new.s' +
          'inc_ecommerce, '#39'N'#39'))'
        
          '          and (coalesce(old.sinc_ecommerce, '#39'N'#39') = '#39'S'#39') and (coa' +
          'lesce(new.sinc_ecommerce, '#39'N'#39') = '#39'N'#39')) then'
        '            VDELETE = 1;'
        ''
        '    if (deleting) then'
        '        VDELETE = 1;'
        ''
        '    if (vdelete > 0) then'
        '    begin'
        
          '        SELECT ID_COMMERCE FROM KITS_PROD_EC WHERE KITS_PROD_EC.' +
          'CODIGO_KIT = old.CODIGO_KIT AND KITS_PROD_EC.COD_EMPRESA = old.C' +
          'OD_EMPRESA into :VIDCOMMERCE_KIT;'
        ''
        '        if (COALESCE(VIDCOMMERCE_KIT, 0) > 0) then'
        '        begin'
        
          '            SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO ' +
          ':VSEQID; '
        
          '            INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_' +
          'HORA_ALT_WS, ID_COMMERCE)  '
        
          '            VALUES(:VSEQID, old.COD_EMPRESA, '#39'KITS_PROD_EC'#39', (se' +
          'lect CURRENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), :VIDCOMMER' +
          'CE_KIT);'
        '        end'
        ''
        '        execute statement'
        '           '#39'update kits_prod set'
        '              kits_prod.codigo_kit = '#39'||old.codigo_kit||'#39','
        '              kits_prod.cod_empresa = '#39'||old.cod_empresa||'#39
        '            where kits_prod.codigo_kit = '#39'||old.codigo_kit||'#39
        '            and kits_prod.cod_empresa = '#39'||old.cod_empresa||'#39';'#39';'
        '    end'
        '    else if ((inserting)or(updating)) then'
        '    begin'
        '        if (inserting) then'
        '        begin'
        
          '            SELECT ID_COMMERCE FROM KITS_PROD_EC WHERE KITS_PROD' +
          '_EC.CODIGO_KIT = new.CODIGO_KIT AND KITS_PROD_EC.COD_EMPRESA = n' +
          'ew.COD_EMPRESA into :VIDCOMMERCE_KIT;'
        ''
        '            if (COALESCE(VIDCOMMERCE_KIT, 0) > 0) then'
        '            begin'
        
          '                SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE I' +
          'NTO :VSEQID; '
        
          '                INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, D' +
          'ATA_HORA_ALT_WS, ID_COMMERCE)  '
        
          '                VALUES(:VSEQID, new.COD_EMPRESA, '#39'KITS_PROD_EC'#39',' +
          ' (select CURRENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), :VIDCO' +
          'MMERCE_KIT);'
        '            end'
        '        end'
        '        else if (updating) then'
        
          '            if ((coalesce(old.grupo_prod, 0) <> coalesce(new.gru' +
          'po_prod, 0))'
        
          '                or (coalesce(old.cod_prod, '#39#39') <> coalesce(new.c' +
          'od_prod, '#39#39'))'
        
          '                or (coalesce(old.quant_prod_kit, 0) <> coalesce(' +
          'new.quant_prod_kit, 0))) then'
        '            begin'
        
          '                SELECT ID_COMMERCE FROM KITS_PROD_EC WHERE KITS_' +
          'PROD_EC.CODIGO_KIT = new.CODIGO_KIT AND KITS_PROD_EC.COD_EMPRESA' +
          ' = new.COD_EMPRESA into :VIDCOMMERCE_KIT;'
        ''
        '                if (COALESCE(VIDCOMMERCE_KIT, 0) > 0) then'
        '                begin'
        
          '                    SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABA' +
          'SE INTO :VSEQID; '
        
          '                    INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABEL' +
          'A, DATA_HORA_ALT_WS, ID_COMMERCE)  '
        
          '                    VALUES(:VSEQID, new.COD_EMPRESA, '#39'KITS_PROD_' +
          'EC'#39', (select CURRENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), :V' +
          'IDCOMMERCE_KIT);'
        '                end'
        '            end'
        ''
        
          '        NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_KITS_PROD_KITS, 1) ' +
          'FROM RDB$DATABASE);'
        '        execute statement'
        '           '#39'update kits_prod set'
        '              kits_prod.codigo_kit = '#39'||new.codigo_kit||'#39','
        '              kits_prod.cod_empresa = '#39'||new.cod_empresa||'#39
        '            where kits_prod.codigo_kit = '#39'||new.codigo_kit||'#39
        '            and kits_prod.cod_empresa = '#39'||new.cod_empresa||'#39';'#39';'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_AGENDAMENTO_BI0 for AGENDAMENTO'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_CADASTRO is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_CADASTRO;'
        ''
        '  update CLIENTES'
        '  set DATA_AGENDADA = new.DATA_AGENDADA'
        '  where COD_CLIENTE = new.COD_CLIENTE and'
        '        COD_EMPRESA = new.COD_EMPRESA;'
        '  if ((coalesce(new.CODMOD_POTVEIC, 0)) <> 0) then'
        '    update CLIENTES'
        '    set MODELO_POTVEICCP = (select TIPMODELO.DESCRICAO'
        '                            from TIPMODELO'
        
          '                            where TIPMODELO.CODIGO = new.CODMOD_' +
          'POTVEIC and'
        
          '                                  TIPMODELO.COD_EMPRESA = new.CO' +
          'D_EMPRESA)'
        '    where COD_CLIENTE = new.COD_CLIENTE and'
        '          COD_EMPRESA = new.COD_EMPRESA;'
        '  if (coalesce((select COD_VENDEDORV'
        '                from CLIENTES'
        '                where COD_CLIENTE = new.COD_CLIENTE and'
        
          '                      COD_EMPRESA = new.COD_EMPRESA), 0) = 0) th' +
          'en'
        '    update CLIENTES'
        '    set COD_VENDEDORV = new.COD_VENDEDOR'
        '    where COD_CLIENTE = new.COD_CLIENTE and'
        '          COD_EMPRESA = new.COD_EMPRESA;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_CENTRO_CUSTOS_DT_ALT for CENTRO_CUSTO' +
          'S'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        
          '  if ((new.COD_CCUS <> old.COD_CCUS) or (new.CCUS <> old.CCUS)) ' +
          'then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DT_ALT;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger MDFE_BI_CURRENT_TS for MDFE'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  if (new.DATA_CADASTRO is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_CADASTRO;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger DATALIBTRAVA_PED for PEDVENDA'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_CUPOM is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_CUPOM;'
        ''
        '  new.DATA_LIBTRAVA = new.DATA_PED;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger ATINSERT_PEDVENDA for PEDVENDA_PROD'
        'active before insert position 0'
        'as'
        '  declare variable COD_EMPRESA integer;'
        '  declare variable NEC_AC integer;'
        '  declare variable NEC_ACPROD char(1);'
        '  declare variable DIAS_ACPROD integer;'
        '  declare variable ID_MOB integer;'
        '  declare variable ID_ECOMMERCE integer;'
        '  declare variable NFAB varchar(20);'
        'begin'
        ''
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_INCLUSAO is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_INCLUSAO;'
        ''
        
          '  select PEDVENDA.COD_CLIENTE, PEDVENDA.IDMOBILE, PEDVENDA.ID_CO' +
          'MMERCE'
        '  from PEDVENDA'
        '  where PEDVENDA.NPED = new.NPED and'
        '        PEDVENDA.TIPO = new.TIPO and'
        '        PEDVENDA.COD_EMPRESA = new.COD_EMPRESA'
        '    into :NEC_AC, :ID_MOB, :ID_ECOMMERCE;'
        '  if (NEC_AC <> 0) then'
        '  /* se cliente no ped */'
        '  begin'
        '    NEC_ACPROD = '#39#39';'
        '    DIAS_ACPROD = 0;'
        '    select NEC_ACOMP, DIAS_ACOMP, COD_EMPRESA'
        '    from PRODUTOS'
        '    where PRODUTOS.GRUPO_PROD = new.GRUPO_PROD and'
        '          PRODUTOS.COD_EMPRESA = new.COD_EMPRESA and'
        '          PRODUTOS.COD_PROD = new.COD_PROD'
        '      into :NEC_ACPROD, :DIAS_ACPROD, :COD_EMPRESA;'
        '    if (NEC_ACPROD <> '#39#39') then'
        '    begin'
        '      /* altera acompanhamento do cliente */'
        '      update CLIENTES'
        '      set NEC_ACOMP = :NEC_ACPROD,'
        '          DIAS_ACOMP = :DIAS_ACPROD'
        '      where CLIENTES.COD_CLIENTE = :NEC_AC and'
        '            COD_EMPRESA = :COD_EMPRESA;'
        '    end'
        '  end'
        ''
        '  if ((new.COD_GRADE > 0) and'
        
          '      ((coalesce(ID_MOB, 0) > 0) or (coalesce(ID_ECOMMERCE, 0) >' +
          ' 0))) then'
        '  begin'
        '    select first 1 C.COD_BARRA'
        '    from COD_BARRA C'
        '    where C.GRUPO_PROD = new.GRUPO_PROD and'
        '          C.COD_PROD = new.COD_PROD and'
        '          C.COD_EMPRESA = new.COD_EMPRESA and'
        '          C.COD_GRADE = new.COD_GRADE'
        '      into :NFAB;'
        ''
        '    if (trim(coalesce(NFAB, '#39#39')) <> '#39#39') then'
        '      new.NUM_FAB_PROD = trim(NFAB);'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger PEDVENDA_PROD_COND_DEV_BI_ID for PEDVEND' +
          'A_PROD_COND_DEV'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (coalesce(new.ID, 0) <= 0) then'
        '    new.ID = next value for SEQ_PEDVENDA_PROD_COND_DEV;'
        ''
        '  if (new.DATA is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger PEDVENDA_SERV_BI_CURRENT_TS for PEDVENDA' +
          '_SERV'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  if (new.DATA_INCLUSAO is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_INCLUSAO;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PRODUTOS_SUBGRUPO for PRODUTOS'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_ALT_PRECO is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_ALT_PRECO;'
        ''
        '  if (new.SUB_G_PROD is null) then'
        '    new.SUB_G_PROD = 0;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_P_CONTAS_CONTABIL_DT_ALT for P_CONTAS' +
          '_CONTABIL'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        
          '  if ((new.COD_CTA <> old.COD_CTA) or (new.NOME_CTA <> old.NOME_' +
          'CTA) or (new.COD_NAT_CC <> old.COD_NAT_CC) or (new.IND_CTA <> ol' +
          'd.IND_CTA) or (new.NIVEL <> old.NIVEL)) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DT_ALT;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger SERVICO_TRANSPORTE_BI_CURRENT_D for SERV' +
          'ICO_TRANSPORTE'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  if (new.DATA_LANCAMENTO is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_LANCAMENTO;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger SPED_AQUISICAO_BENS_BI_CURR_TS for SPED_' +
          'AQUISICAO_BENS'
        'active before insert position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '  if (new.DATA_INICIAL is null) then'
        '    new.DATA_INICIAL = CURRENT_TS;'
        ''
        '  if (new.DATA_FINAL is null) then'
        '    new.DATA_FINAL = CURRENT_TS;'
        ''
        '  if (new.DATA_LANC is null) then'
        '    new.DATA_LANC = CURRENT_TS;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger SPED_DEPREC_AMORT_BENS_BI_CURTS for SPED' +
          '_DEPREC_AMORT_BENS'
        'active before insert position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '  if (new.DATA_OPERACAO is null) then'
        '    new.DATA_OPERACAO = CURRENT_TS;'
        ''
        '  if (new.DATA_LANC is null) then'
        '    new.DATA_LANC = CURRENT_TS;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger SPED_ESTOQUE_ABERTURA_BI_CUR_TS for SPED' +
          '_ESTOQUE_ABERTURA'
        'active before insert position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '  if (new.DATA_INICIAL is null) then'
        '    new.DATA_INICIAL = CURRENT_TS;'
        ''
        '  if (new.DATA_FINAL is null) then'
        '    new.DATA_FINAL = CURRENT_TS;'
        ''
        '  if (new.DATA_LANC is null) then'
        '    new.DATA_LANC = CURRENT_TS;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger SPED_OUT_REC_CRED_BI_CURRENT_TS for SPED' +
          '_OUTRAS_RECEITAS_CREDITOS'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_LANC is null) then'
        '    select CURRENT_D'
        #9'from SP_CURRENT_TS(new.COD_EMPRESA)'
        #9'  into new.DATA_LANC;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger SPED_PROC_REF_AC_JUD_BI_CURR_TS for SPED' +
          '_PROC_REF_ACAO_JUDICIAL'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_LANC is null) then'
        '    select CURRENT_D'
        #9'from SP_CURRENT_TS'
        #9'  into new.DATA_LANC;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger SPED_PROC_REF_ADM_BI_CURR_TS for SPED_PR' +
          'OC_REF_ADMINISTRATIVO'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_LANC is null) then'
        '    select CURRENT_D'
        #9'from SP_CURRENT_TS'
        #9'  into new.DATA_LANC;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TIPMODELO_CODIGOFAB_BI_CURR_TS for TIPMO' +
          'DELO_CODIGOFAB'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_CAD is null) then'
        '    select CURRENT_D'
        #9'from SP_CURRENT_TS(new.COD_EMPRESA)'
        #9'  into new.DATA_CAD;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger VERSAO_HW_BI_CURR_TS for VERSAO_HW'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.DATA_DOWNLOAD is null) then'
        '    select CURRENT_D'
        #9'from SP_CURRENT_TS'
        #9'  into new.DATA_DOWNLOAD;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter view VW_PRODUTOS_EC('
        '    TIPO,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    COD_EMPRESA,'
        '    ATIVO,'
        '    NUM_FAB_PROD,'
        '    DESCR_PROD_RES,'
        '    DESCR_PROD_COMPL,'
        '    SINC_ECOMMERCE,'
        '    ID_COMMERCE,'
        '    DISPONIVEL,'
        '    PROMOCIONAL,'
        '    FRETE_GRATIS,'
        '    LANCAMENTO,'
        '    DESTAQUE,'
        '    VARIACAO,'
        '    TERMOS_ACEITE,'
        '    COMPREJUNTO,'
        '    VIRTUAL,'
        '    ENV_COMERCIO_ABERTO,'
        '    ID_COMERCIO_ABERTO,'
        '    DESCRICAO_MARCA,'
        '    LISTA_IMAGENS,'
        '    URL_IMAGENS,'
        '    LISTA_IMAGENS_GRADE,'
        '    URL_IMAGENS_GRADE,'
        '    REFERENCE,'
        '    COM_GRADE,'
        '    COD_GRADE,'
        '    GRADE1,'
        '    GRADE2,'
        '    EST_DISP,'
        '    EST_DISP_GRADE,'
        '    EST_MINIMO,'
        '    MANUAL_EST_DISP,'
        '    MANUAL_EST_DISP_GRADE,'
        '    MANUAL_EST_MINIMO,'
        '    API,'
        '    API_PRECO_TABELA,'
        '    PRECO_TABELA,'
        '    DESCRICAOPROMOCAO,'
        '    VALORPROMOCAO,'
        '    DATAINICIOPROMOCAO,'
        '    DATAFIMPROMOCAO,'
        '    HORAINICIOPROMOCAO,'
        '    HORAFIMPROMOCAO,'
        '    PRECO_A_COMBINAR_CA,'
        '    SEQID_CA)'
        'AS'
        'select'
        '  0 TIPO,'
        '--DADOS DO PRODUTO'
        
          '  PEC.GRUPO_PROD, PEC.COD_PROD, PEC.COD_EMPRESA, PR.ATIVO, PR.NU' +
          'M_FAB_PROD,'
        
          '  coalesce(PEC.DESCR_PROD_RES, PR.DESCR_PROD) DESCR_PROD_RES, PE' +
          'C.DESCR_PROD_COMPL,'
        ''
        '  CASE WHEN (PECG.COD_GRADE > 0) THEN'
        
          '         CASE WHEN (PEC.SINC_ECOMMERCE = '#39'S'#39') AND (PECG.SINC_ECO' +
          'MMERCE = '#39'S'#39') THEN'
        '                '#39'S'#39
        '              ELSE'
        '                '#39'N'#39
        '         END'
        '       ELSE'
        '         COALESCE(PEC.SINC_ECOMMERCE, '#39'N'#39')'
        '  END SINC_ECOMMERCE,'
        '  PEC.ID_COMMERCE,'
        
          '  PEC.DISPONIVEL, PEC.PROMOCIONAL, PEC.FRETE_GRATIS, PEC.LANCAME' +
          'NTO, PEC.DESTAQUE, PEC.VARIACAO,'
        '  PEC.TERMOS_ACEITE, PEC.COMPREJUNTO, PEC.VIRTUAL,'
        
          '  PEC.ENV_COMERCIO_ABERTO, COALESCE(PECG.ID_COMERCIO_ABERTO, PEC' +
          '.ID_COMERCIO_ABERTO) ID_COMERCIO_ABERTO,'
        '  MARCA_PROD.DESCRICAO_MARCA,'
        
          '  PIP.LISTA_IMAGENS, PIP.URL_IMAGENS, PIG.LISTA_IMAGENS as LISTA' +
          '_IMAGENS_GRADE,'
        '  PIG.URL_IMAGENS as URL_IMAGENS_GRADE,'
        '  (select first 1 CB.COD_BARRA from COD_BARRA CB'
        '   where CB.GRUPO_PROD = PEC.GRUPO_PROD'
        '   and CB.COD_PROD = PEC.COD_PROD'
        '   and coalesce(CB.COD_GRADE, 0) = 0'
        '   and CB.COD_EMPRESA = PEC.COD_EMPRESA'
        
          '   and CB.COD_BARRA <> (CB.GRUPO_PROD || CB.COD_PROD)) as REFERE' +
          'NCE,'
        '--DADOS GRADE'
        
          '  iif(coalesce(PECG.COD_GRADE, 0) > 0, '#39'1'#39', '#39'0'#39') COM_GRADE, coal' +
          'esce(PECG.COD_GRADE, 0) COD_GRADE,'
        
          '  iif(coalesce(GRADE.DESCRICAO_EC, '#39#39') <> '#39#39', GRADE.DESCRICAO_EC' +
          ', GRADE.DESCRICAO) GRADE1,'
        
          '  iif(coalesce(GRADE.DESCRICAO_EC1, '#39#39') <> '#39#39', GRADE.DESCRICAO_E' +
          'C1, GRADE.DESCRICAO_EC1) GRADE2,'
        '--ESTOQUE FISICO'
        
          '  coalesce((select trunc(coalesce(ESTOQUE, 0)) from GETESTOQUEDI' +
          'SPONIVEL'
        
          '    (PEC.GRUPO_PROD, PEC.COD_PROD, 0, PEC.COD_EMPRESA, 0, '#39#39', 0,' +
          ' 0)), 0) EST_DISP,'
        
          '  coalesce((select trunc(coalesce(ESTOQUE, 0)) from GETESTOQUEDI' +
          'SPONIVEL'
        
          '    (PECG.GRUPO_PROD, PECG.COD_PROD, PECG.COD_GRADE, PECG.COD_EM' +
          'PRESA, 0, '#39#39', 0, 0)), 0) EST_DISP_GRADE,'
        '  coalesce(PR.N_MIN_PROD, 0) EST_MINIMO,'
        '--ESTOQUE MANUAL'
        '  coalesce(PEC.ESTOQUE_EC, 0) MANUAL_EST_DISP,'
        '  coalesce(PECG.ESTOQUE_EC, 0) MANUAL_EST_DISP_GRADE,'
        '  coalesce(PEC.ESTOQUE_MIN_EC, 0) MANUAL_EST_MINIMO,'
        '-- PRECO CONFIG_API'
        '  CONFIG_API.API,'
        '  (select first 1 PMP.VALOR_PROMOCAO'
        '  from PROMOCAO_PRODUTO PMP'
        
          '    inner join PROMOCAO PM on PM.COD_PROMOCAO = PMP.COD_PROMOCAO' +
          ' and'
        '          PM.COD_EMPRESA = PMP.COD_EMPRESA and'
        '          PM.ATIVO = 1'
        
          '    left join TIPO_PRECO TP on TP.COD_TPPRECO = PMP.COD_TPPRECO ' +
          'and'
        '          TP.COD_EMPRESA = PMP.COD_EMPRESA'
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        
          '        PMP.COD_PROMOCAO = CONFIG_API.COD_TAB_PRECO) API_PRECO_T' +
          'ABELA,'
        '--PRECO PADRAO PRODUTO'
        '  PR.PREC_TAB_PROD as PRECO_TABELA,'
        '--DESCRICAO PROMOCAO COMERCIO ABERTO'
        '  (select first 1 PM.DESCR_PROMOCAO'
        '  from PROMOCAO_PRODUTO PMP'
        
          '    inner join PROMOCAO PM on PM.COD_PROMOCAO = PMP.COD_PROMOCAO' +
          ' and'
        '          PM.COD_EMPRESA = PMP.COD_EMPRESA and'
        '          PM.ATIVO = 1'
        
          '    inner join PROMOCAO_ORDEM_CA PMOCA on PMOCA.COD_PROMOCAO = P' +
          'MP.COD_PROMOCAO and'
        '          PMOCA.COD_EMPRESA = PMP.COD_EMPRESA'
        
          '    left join TIPO_PRECO TP on TP.COD_TPPRECO = PMP.COD_TPPRECO ' +
          'and'
        '          TP.COD_EMPRESA = PMP.COD_EMPRESA'
        '    left join SP_CURRENT_TS(PMP.COD_EMPRESA) CD on 1=1'
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        CD.CURRENT_D  >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        CD.CURRENT_D <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
        '  order by PMOCA.ORDEM) DESCRICAOPROMOCAO,'
        '-- VALOR PROMOCAO COMERCIO ABERTO'
        '  (select first 1 iif((PMP.PORCENTAGEM > 0),'
        
          '                      (PR.PREC_TAB_PROD - (round(PR.PREC_TAB_PRO' +
          'D * PMP.PORCENTAGEM) / 100)),'
        '                       PMP.VALOR_PROMOCAO)'
        '  from PROMOCAO_PRODUTO PMP'
        
          '    inner join PROMOCAO PM on PM.COD_PROMOCAO = PMP.COD_PROMOCAO' +
          ' and'
        '          PM.COD_EMPRESA = PMP.COD_EMPRESA and'
        '          PM.ATIVO = 1'
        
          '    inner join PROMOCAO_ORDEM_CA PMOCA on PMOCA.COD_PROMOCAO = P' +
          'MP.COD_PROMOCAO and'
        '          PMOCA.COD_EMPRESA = PMP.COD_EMPRESA'
        
          '    left join TIPO_PRECO TP on TP.COD_TPPRECO = PMP.COD_TPPRECO ' +
          'and'
        '          TP.COD_EMPRESA = PMP.COD_EMPRESA'
        '    left join SP_CURRENT_TS(PMP.COD_EMPRESA) CD on 1=1'
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        CD.CURRENT_D >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        CD.CURRENT_D <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
        '  order by PMOCA.ORDEM) VALORPROMOCAO,'
        '--DATA INICIAL PROMOCAO'
        '  (select first 1 coalesce(PMP.DATA_INI, PM.DATA_INI)'
        '  from PROMOCAO_PRODUTO PMP'
        
          '    inner join PROMOCAO PM on PM.COD_PROMOCAO = PMP.COD_PROMOCAO' +
          ' and'
        '          PM.COD_EMPRESA = PMP.COD_EMPRESA and'
        '          PM.ATIVO = 1'
        
          '    inner join PROMOCAO_ORDEM_CA PMOCA on PMOCA.COD_PROMOCAO = P' +
          'MP.COD_PROMOCAO and'
        '          PMOCA.COD_EMPRESA = PMP.COD_EMPRESA'
        
          '    left join TIPO_PRECO TP on TP.COD_TPPRECO = PMP.COD_TPPRECO ' +
          'and'
        '          TP.COD_EMPRESA = PMP.COD_EMPRESA'
        '    left join SP_CURRENT_TS(PMP.COD_EMPRESA) CD on 1=1'
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        CD.CURRENT_D >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        CD.CURRENT_D <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
        '  order by PMOCA.ORDEM) DATAINICIOPROMOCAO,'
        '--DATA FINAL PROMOCAO'
        '  (select first 1 coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
        '  from PROMOCAO_PRODUTO PMP'
        
          '    inner join PROMOCAO PM on PM.COD_PROMOCAO = PMP.COD_PROMOCAO' +
          ' and'
        '          PM.COD_EMPRESA = PMP.COD_EMPRESA and'
        '          PM.ATIVO = 1'
        
          '    inner join PROMOCAO_ORDEM_CA PMOCA on PMOCA.COD_PROMOCAO = P' +
          'MP.COD_PROMOCAO and'
        '          PMOCA.COD_EMPRESA = PMP.COD_EMPRESA'
        
          '    left join TIPO_PRECO TP on TP.COD_TPPRECO = PMP.COD_TPPRECO ' +
          'and'
        '          TP.COD_EMPRESA = PMP.COD_EMPRESA'
        '    left join SP_CURRENT_TS(PMP.COD_EMPRESA) CD on 1=1'
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        CD.CURRENT_D >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        CD.CURRENT_D <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
        '  order by PMOCA.ORDEM) DATAFIMPROMOCAO,'
        '--HORA INICIAL PROMOCAO'
        '  (select first 1 coalesce(PMP.HORA_INI, PM.HORA_INI)'
        '  from PROMOCAO_PRODUTO PMP'
        
          '    inner join PROMOCAO PM on PM.COD_PROMOCAO = PMP.COD_PROMOCAO' +
          ' and'
        '          PM.COD_EMPRESA = PMP.COD_EMPRESA and'
        '          PM.ATIVO = 1'
        
          '    inner join PROMOCAO_ORDEM_CA PMOCA on PMOCA.COD_PROMOCAO = P' +
          'MP.COD_PROMOCAO and'
        '          PMOCA.COD_EMPRESA = PMP.COD_EMPRESA'
        
          '    left join TIPO_PRECO TP on TP.COD_TPPRECO = PMP.COD_TPPRECO ' +
          'and'
        '          TP.COD_EMPRESA = PMP.COD_EMPRESA'
        '    left join SP_CURRENT_TS(PMP.COD_EMPRESA) CD on 1=1'
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        CD.CURRENT_D >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        CD.CURRENT_D <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
        '  order by PMOCA.ORDEM) HORAINICIOPROMOCAO,'
        '--HORA FINAL PROMOCAO'
        '  (select first 1 coalesce(PMP.HORA_FIM, PM.HORA_FIM)'
        '  from PROMOCAO_PRODUTO PMP'
        
          '    inner join PROMOCAO PM on PM.COD_PROMOCAO = PMP.COD_PROMOCAO' +
          ' and'
        '          PM.COD_EMPRESA = PMP.COD_EMPRESA and'
        '          PM.ATIVO = 1'
        
          '    inner join PROMOCAO_ORDEM_CA PMOCA on PMOCA.COD_PROMOCAO = P' +
          'MP.COD_PROMOCAO and'
        '          PMOCA.COD_EMPRESA = PMP.COD_EMPRESA'
        
          '    left join TIPO_PRECO TP on TP.COD_TPPRECO = PMP.COD_TPPRECO ' +
          'and'
        '          TP.COD_EMPRESA = PMP.COD_EMPRESA'
        '    left join SP_CURRENT_TS(PMP.COD_EMPRESA) CD on 1=1'
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        CD.CURRENT_D >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        CD.CURRENT_D <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
        '  order by PMOCA.ORDEM) HORAFIMPROMOCAO,'
        '-- PRECO_A_COMBINAR_CA'
        '  PEC.PRECO_A_COMBINAR_CA,'
        '--SEQIDS'
        '  coalesce(PECG.SEQID_CA, PEC.SEQID_CA)  SEQID_CA'
        'from PRODUTOS_EC PEC'
        '  inner join PRODUTOS PR on PEC.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PEC.COD_PROD = PR.COD_PROD and'
        '        PEC.COD_EMPRESA = PR.COD_EMPRESA'
        
          '  left join PRODUTOS_EC_GRADE PECG on PECG.GRUPO_PROD = PEC.GRUP' +
          'O_PROD and'
        '        PECG.COD_PROD = PEC.COD_PROD and'
        '        PECG.COD_EMPRESA = PEC.COD_EMPRESA'
        
          '  left join PRODUTOS_IMAGENS PIP on PIP.GRUPO_PROD = PEC.GRUPO_P' +
          'ROD and'
        '        PIP.COD_PROD = PEC.COD_PROD and'
        '        PIP.COD_GRADE = 0 and'
        '        PIP.COD_EMPRESA = PEC.COD_EMPRESA'
        
          '  left join PRODUTOS_IMAGENS PIG on PIG.GRUPO_PROD = PECG.GRUPO_' +
          'PROD and'
        '        PIG.COD_PROD = PECG.COD_PROD and'
        '        PIG.COD_GRADE = PECG.COD_GRADE and'
        '        PIG.COD_EMPRESA = PECG.COD_EMPRESA'
        '  left join GRADE on GRADE.COD_GRADE = PECG.COD_GRADE and'
        '        GRADE.COD_EMPRESA = PECG.COD_EMPRESA and'
        '        GRADE.COD_GRADE > 0'
        
          '  left join CATEGORIA on CATEGORIA.COD_CATEGORIA = PEC.COD_CATEG' +
          'ORIA'
        '  left join MARCA_PROD on MARCA_PROD.COD_MARCA = PR.COD_MARCA'
        
          '  left join CONFIG_API on CONFIG_API.COD_EMPRESA = PEC.COD_EMPRE' +
          'SA'
        'UNION'
        
          'select 1 TIPO, TS.COD_SERVICO GRUPO_PROD, '#39'SERV'#39' COD_PROD, coale' +
          'sce(TS.COD_EMPRESA, EMP.COD_EMPRESA) COD_EMPRESA,'
        
          '       TS.ATIVO, null NUM_FAB_PROD, TS.DESC_SERV_RES DESCR_PROD_' +
          'RES, TS.DESC_SERV_COMPL DESCR_PROD_COMPL,'
        '       null SINC_ECOMMERCE, null ID_COMMERCE,'
        
          '       null DISPONIVEL, null PROMOCIONAL, null FRETE_GRATIS, nul' +
          'l LANCAMENTO, null DESTAQUE, null VARIACAO,'
        '       null TERMOS_ACEITE, null COMPREJUNTO, null VIRTUAL,'
        
          '       TS.ENV_COMERCIO_ABERTO, TS.ID_COMERCIO_ABERTO, null DESCR' +
          'ICAO_MARCA, null LISTA_IMAGENS, null URL_IMAGENS,'
        
          '       null LISTA_IMAGENS_GRADE, null URL_IMAGENS_GRADE, cast(TS' +
          '.COD_SERVICO as varchar(20)) REFERENCE, 0 COM_GRADE,'
        
          '       0 COD_GRADE, null GRADE1, null GRADE2, 100 EST_DISP, 100 ' +
          'EST_DISP_GRADE, 100 EST_MINIMO, 100 MANUAL_EST_DISP,'
        
          '       100 MANUAL_EST_DISP_GRADE, 100 MANUAL_EST_MINIMO, '#39'COMERC' +
          'IOABERTO'#39' API, TS.VALOR_SERVICO API_PRECO_TABELA,'
        
          '       TS.VALOR_SERVICO PRECO_TABELA, null DESCRICAOPROMOCAO, nu' +
          'll VALORPROMOCAO, null DATAINICIOPROMOCAO,'
        
          '       null DATAFIMPROMOCAO, null HORAINICIOPROMOCAO, null HORAF' +
          'IMPROMOCAO, TS.PRECO_A_COMBINAR_CA, TS.SEQID_CA'
        'from EMPRESA EMP'
        
          '  left join TIPO_SERVICO TS on coalesce(TS.COD_EMPRESA, EMP.COD_' +
          'EMPRESA) = EMP.COD_EMPRESA'
        'where TS.SEQID_CA > 0;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'create or alter procedure MOVIMENTA_ESTOQUE'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure RETORNA_EC_VLTB_PROM ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    DESC_TABELA varchar(128),'
        '    VALOR_TAB_PRO double precision)'
        'as'
        '  declare variable VCOD_TAB_PRECO integer;  '
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(:PCOD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '  DESC_TABELA = '#39#39';'
        '  VALOR_TAB_PRO = 0;'
        ''
        
          '  SELECT CONFIG_API.COD_TAB_PRECO FROM CONFIG_API WHERE CONFIG_A' +
          'PI.COD_EMPRESA = :PCOD_EMPRESA AND API = '#39'TRAYCOMMERCE'#39' into :VC' +
          'OD_TAB_PRECO;'
        ''
        '  SELECT FIRST 1'
        '  PROMOCAO.DESCR_PROMOCAO,'
        '  CASE WHEN(PROMOCAO_PRODUTO.PORCENTAGEM > 0) THEN'
        
          '        (ROUND(PRODUTOS.PREC_TAB_PROD, 2) - ROUND((ROUND(PRODUTO' +
          'S.PREC_TAB_PROD * PROMOCAO_PRODUTO.PORCENTAGEM) / 100), 2))'
        '      ELSE'
        '        ROUND(PROMOCAO_PRODUTO.VALOR_PROMOCAO, 2)'
        '  END'
        '  FROM PROMOCAO_PRODUTO'
        '  INNER JOIN PRODUTOS ON'
        '      PRODUTOS.GRUPO_PROD = PROMOCAO_PRODUTO.GRUPO_PROD'
        '      AND PRODUTOS.COD_PROD = PROMOCAO_PRODUTO.COD_PROD'
        '      AND PRODUTOS.COD_EMPRESA = PROMOCAO_PRODUTO.COD_EMPRESA'
        '  INNER JOIN PROMOCAO ON'
        '      PROMOCAO.COD_PROMOCAO = PROMOCAO_PRODUTO.COD_PROMOCAO'
        '      AND PROMOCAO.COD_EMPRESA = PROMOCAO_PRODUTO.COD_EMPRESA'
        '      AND PROMOCAO.ATIVO = 1'
        '  INNER JOIN PROMOCAO_ORDEM_EC ON'
        
          '      PROMOCAO_ORDEM_EC.COD_PROMOCAO = PROMOCAO_PRODUTO.COD_PROM' +
          'OCAO'
        
          '      AND PROMOCAO_ORDEM_EC.COD_EMPRESA = PROMOCAO_PRODUTO.COD_E' +
          'MPRESA'
        
          '  LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO_PROD' +
          'UTO.COD_TPPRECO'
        '      AND TIPO_PRECO.COD_EMPRESA = PROMOCAO_PRODUTO.COD_EMPRESA'
        '      --    AND TIPO_PRECO.TIPO = '#39'P'#39' '
        '  WHERE PROMOCAO_PRODUTO.GRUPO_PROD = :PGRUPO_PROD'
        '      AND PROMOCAO_PRODUTO.COD_PROD = :PCOD_PROD'
        '      AND PROMOCAO_PRODUTO.COD_EMPRESA = :PCOD_EMPRESA'
        
          '      AND :CURRENT_TS >= COALESCE(PROMOCAO_PRODUTO.DATA_INI, PRO' +
          'MOCAO.DATA_INI)'
        
          '      AND :CURRENT_TS <= COALESCE(PROMOCAO_PRODUTO.DATA_FIM, PRO' +
          'MOCAO.DATA_FIM) into :DESC_TABELA, :VALOR_TAB_PRO;'
        ''
        
          '  if ((coalesce(VALOR_TAB_PRO, 0) <= 0) and (coalesce(VCOD_TAB_P' +
          'RECO, 0) > 0)) then'
        '  begin'
        
          '    SELECT FIRST 1 PROMOCAO.DESCR_PROMOCAO, ROUND(PROMOCAO_PRODU' +
          'TO.VALOR_PROMOCAO, 2)'
        '    FROM PROMOCAO_PRODUTO'
        
          '    INNER JOIN PROMOCAO ON PROMOCAO.COD_PROMOCAO = PROMOCAO_PROD' +
          'UTO.COD_PROMOCAO'
        '    AND PROMOCAO.COD_EMPRESA = PROMOCAO_PRODUTO.COD_EMPRESA'
        '    AND PROMOCAO.ATIVO = 1'
        
          '    LEFT JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO_PR' +
          'ODUTO.COD_TPPRECO'
        '    AND TIPO_PRECO.COD_EMPRESA = PROMOCAO_PRODUTO.COD_EMPRESA'
        '    --AND TIPO_PRECO.TIPO = '#39'T'#39
        '    WHERE PROMOCAO_PRODUTO.GRUPO_PROD = :PGRUPO_PROD'
        '    AND PROMOCAO_PRODUTO.COD_PROD = :PCOD_PROD'
        '    AND PROMOCAO_PRODUTO.COD_EMPRESA = :PCOD_EMPRESA'
        
          '    AND PROMOCAO_PRODUTO.COD_PROMOCAO = :VCOD_TAB_PRECO into :DE' +
          'SC_TABELA, :VALOR_TAB_PRO;'
        '  end'
        ''
        '  if (coalesce(VALOR_TAB_PRO, 0) <= 0) then'
        '  begin'
        
          '    SELECT '#39'PRECO DE TABELA'#39', ROUND(PRODUTOS.PREC_TAB_PROD, 2) F' +
          'ROM PRODUTOS'
        '    WHERE PRODUTOS.GRUPO_PROD = :PGRUPO_PROD'
        '    AND PRODUTOS.COD_PROD = :PCOD_PROD'
        
          '    AND PRODUTOS.COD_EMPRESA = :PCOD_EMPRESA into :DESC_TABELA, ' +
          ':VALOR_TAB_PRO;'
        '  end'
        ''
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_REG_STS_USO ('
        '    STS varchar(64))'
        'returns ('
        '    QTDE integer)'
        'as    '
        '  declare variable CURRENT_TS timestamp;'
        'begin  '
        '  select CURRENT_D'
        '  from SP_CURRENT_TS'
        '    into :CURRENT_TS;'
        ''
        '  select quantidade from sts_uso'
        '    where dia = :CURRENT_TS and sts_descricao = :sts'
        '      into :qtde;'
        ''
        '  if (coalesce(qtde, 0) = 0) then'
        '  begin'
        
          '    update or insert into sts_uso (dia, sts_descricao, quantidad' +
          'e)'
        '      values (:CURRENT_TS, :sts, 1)'
        '      matching (dia, sts_descricao)'
        '      returning quantidade into :qtde;'
        '  end'
        '  else'
        '  begin'
        '    update sts_uso set quantidade = quantidade + 1'
        '      where dia = :CURRENT_TS and sts_descricao = :sts;'
        '    qtde = qtde + 1;'
        '  end'
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger BAAT_MOBILE for BAIRROS'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS'
        '    into new.DTHR_MODMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger BACAD_MOBILE for BAIRROS'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS'
        '    into new.DTHR_CADMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger CCREDITOS_UP_ITEMCARTA for CONTROLE_CRED' +
          'ITOS'
        'active after update or delete position 0'
        'as'
        'declare variable vqtd integer;'
        'declare variable vcoditemcarta integer;'
        'declare variable current_ts timestamp;'
        'begin'
        '  if (updating) then'
        '  begin'
        
          '  if ((trim(coalesce(old.status_c,'#39#39'))<>trim(coalesce(new.status' +
          '_c,'#39#39'))) or'
        
          '     (old.status_c is null and (not new.status_c is null)))  the' +
          'n'
        '  begin'
        
          '    if ((trim(coalesce(new.status_c,'#39#39')) = '#39'QUITADO'#39') and (not n' +
          'ew.datq_c is null)) then'
        '    begin'
        
          '      update itens_carta_cred set itens_carta_cred.solucionado='#39 +
          'S'#39','
        
          '      itens_carta_cred.dt_solucao_cred= coalesce(new.data_baixa,' +
          'new.datq_c) where itens_carta_cred.cod_cred = new.cod_cred'
        '        and itens_carta_cred.cod_empresa = new.codigo_emp;'
        ''
        
          '      for select itens_carta_cred.cod_itemcarta  from itens_cart' +
          'a_cred'
        
          '        where itens_carta_cred.cod_cred = new.cod_cred and itens' +
          '_carta_cred.cod_empresa = new.codigo_emp'
        '        into :vcoditemcarta do'
        '      begin'
        
          '        select count(itens_carta_cred.cod_itemcarta) from itens_' +
          'carta_cred'
        '          where itens_carta_cred.cod_itemcarta = :vcoditemcarta'
        
          '          and itens_carta_cred.cod_empresa=new.codigo_emp and (i' +
          'tens_carta_cred.solucionado='#39'N'#39' or (itens_carta_cred.solucionado' +
          ' is null))'
        '          into :vqtd;'
        '          if ((vqtd is null) or (vqtd = 0)) then'
        
          '            update itens_carta set itens_carta.dt_solucao=coales' +
          'ce(new.data_baixa,new.datq_c)'
        
          '            where itens_carta.codigo = :vcoditemcarta and itens_' +
          'carta.cod_empresa=new.codigo_emp and itens_carta.versaocarta=1;'
        '      end'
        '    end'
        
          '    else  if ((trim(coalesce(old.status_c,'#39#39')) = '#39'QUITADO'#39') and ' +
          '(new.status_c is null or (trim(coalesce(new.status_c,'#39#39')) = '#39#39'))' +
          ') then'
        '    begin'
        
          '      update itens_carta_cred set itens_carta_cred.solucionado= ' +
          'null,'
        
          '      itens_carta_cred.dt_solucao_cred = null where itens_carta_' +
          'cred.cod_cred = new.cod_cred'
        '        and itens_carta_cred.cod_empresa = new.codigo_emp;'
        ''
        
          '      for select itens_carta_cred.cod_itemcarta  from itens_cart' +
          'a_cred'
        
          '        where itens_carta_cred.cod_cred = new.cod_cred and itens' +
          '_carta_cred.cod_empresa = new.codigo_emp'
        '        into :vcoditemcarta do'
        '      begin'
        
          '        select count(itens_carta_cred.cod_itemcarta) from itens_' +
          'carta_cred'
        '          where itens_carta_cred.cod_itemcarta = :vcoditemcarta'
        
          '          and itens_carta_cred.cod_empresa=new.codigo_emp and (i' +
          'tens_carta_cred.solucionado='#39'N'#39' or (itens_carta_cred.solucionado' +
          ' is null))'
        '          into :vqtd;'
        '          if ((not vqtd is null) or (vqtd > 0)) then'
        '            update itens_carta set itens_carta.dt_solucao=null'
        
          '            where itens_carta.codigo = :vcoditemcarta and itens_' +
          'carta.cod_empresa=new.codigo_emp and itens_carta.versaocarta=1;'
        '      end'
        '    end'
        '  end'
        '  end'
        '  else if (deleting) then'
        '  begin    '
        
          '    select CURRENT_D from SP_CURRENT_TS(old.codigo_emp) into :CU' +
          'RRENT_TS;'
        ''
        
          '    for select itens_carta_cred.cod_itemcarta  from itens_carta_' +
          'cred'
        
          '      where itens_carta_cred.cod_cred = old.cod_cred and itens_c' +
          'arta_cred.cod_empresa = old.codigo_emp'
        '      into :vcoditemcarta do'
        '    begin'
        
          '      select count(itens_carta_cred.cod_itemcarta) from itens_ca' +
          'rta_cred'
        '        where itens_carta_cred.cod_itemcarta = :vcoditemcarta'
        '        and itens_carta_cred.cod_empresa=old.codigo_emp'
        '        and itens_carta_cred.cod_cred<>old.cod_cred'
        
          '        and (itens_carta_cred.solucionado='#39'N'#39' or (itens_carta_cr' +
          'ed.solucionado is null))'
        '        into :vqtd;'
        '        if ((vqtd is null) or (vqtd = 0)) then'
        
          '          update itens_carta set itens_carta.dt_solucao= :CURREN' +
          'T_TS'
        
          '          where itens_carta.codigo = :vcoditemcarta and itens_ca' +
          'rta.cod_empresa=old.codigo_emp and itens_carta.versaocarta=1;'
        '    end'
        
          '    delete from itens_carta_cred  where itens_carta_cred.cod_cre' +
          'd = old.cod_cred'
        '      and itens_carta_cred.cod_empresa = old.codigo_emp;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger CDAT_MOBILE for CIDADES'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS'
        '    into new.DTHR_MODMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger CDCAD_MOBILE for CIDADES'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS'
        '    into new.DTHR_CADMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger CLAT_MOBILE for CLIENTES'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DTHR_MODMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger CLCAD_MOBILE for CLIENTES'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DTHR_CADMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger DEVOLUCAO_DATA_ESTOQUE for DEVOLUCAO'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DATA_ESTOQUE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger DEVOLUCAO_HIST_ESTOQUE_D for DEVOLUCAO'
        'active before delete position 0'
        'AS    '
        '  declare variable current_ts timestamp;'
        'begin'
        '   IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '   if (coalesce(old.nf_gerou, '#39#39') = '#39'S'#39') then'
        '    exit; '
        ''
        
          '    select CURRENT_D from SP_CURRENT_TS(old.cod_empresa) into :C' +
          'URRENT_TS;'
        ''
        
          '  insert into hist_estoque_diario_prod (tipo, seqid, cod_empresa' +
          ','
        
          '   tipor, natureza, data, grupo_prod, cod_prod, cod_grade, chass' +
          'i, numero, qtde,'
        
          '   valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_c' +
          'liente, cod_cfop,'
        '   aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '   aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        
          '   values ('#39'P'#39', (select cod from incrementa_codigo(old.cod_empre' +
          'sa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), old.cod_empresa,'
        
          '   '#39'DEV'#39', '#39'E'#39', old.data, old.grupo_prod, old.cod_prod, old.cod_g' +
          'rade, null, old.sequencia, old.quant,'
        
          '   old.valor, (old.quant * old.valor), '#39'N'#39', old.pcust_mc, old.se' +
          'qid, old.cod_cliente, 0,'
        '   0, 0, 0, 0, 0, 0, 0, 0, 0, 0);'
        ''
        
          '  insert into hist_estoque_diario_prod (tipo, seqid, cod_empresa' +
          ','
        
          '   tipor, natureza, data, grupo_prod, cod_prod, cod_grade, chass' +
          'i, numero, qtde,'
        
          '   valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_c' +
          'liente, cod_cfop,'
        '   aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '   aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        
          '   values ('#39'P'#39', (select cod from incrementa_codigo(old.cod_empre' +
          'sa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), old.cod_empresa,'
        
          '   '#39'DEV'#39', '#39'S'#39', :CURRENT_TS, old.grupo_prod, old.cod_prod, old.co' +
          'd_grade, null, old.sequencia, old.quant,'
        
          '   old.valor, (old.quant * old.valor), '#39'N'#39', old.pcust_mc, old.se' +
          'qid, old.cod_cliente, 0,'
        '   0, 0, 0, 0, 0, 0, 0, 0, 0, 0);'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger ENDPCLAT_MOBILE for END_PCLIENTES'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DTHR_MODMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger ENDPCLCAD_MOBILE for END_PCLIENTES'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DTHR_CADMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger NFCE_BI_MOV_OPERADOR for NFCE'
        'active before insert position 0'
        'as'
        '  declare variable movid integer;'
        '  declare variable operadorid integer;'
        '  declare variable current_ts timestamp;'
        'begin       '
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        
          '  -- mov_id = 0, o sistema preencheu "0" para a trigger obter o ' +
          'id do movimento'
        '  if ((new.mov_id = 0) and (coalesce(new.operador, 0) > 0)) then'
        '  begin'
        '    select first 1 mov.operador, mov.id from nfce_movimento mov'
        
          '      where mov.cod_emissor = new.cod_emissor and mov.cod_empres' +
          'a = new.cod_empresa and mov.dia_fech is null'
        '        order by mov.dia_mov asc'
        '      into :operadorid, :movid;'
        ''
        '    if (coalesce(operadorid, 0) > 0) then'
        
          '      if (coalesce(operadorid, 0) <> coalesce(new.operador, 0)) ' +
          'then'
        '        exception exc_nfce_mov_abrt_out;'
        ''
        '    if (movid is null) then'
        '    begin'
        
          '      select current_d from sp_current_ts(new.cod_empresa) into ' +
          ':current_ts;'
        
          '      insert into nfce_movimento (dia_mov, cod_empresa, cod_emis' +
          'sor, operador) values (:current_ts, new.cod_empresa, new.cod_emi' +
          'ssor, new.operador)'
        '        returning id into :movid;'
        '    end'
        ''
        '    if (movid is null) then'
        '      exception exc_nfce_movimento;'
        ''
        '    new.mov_id = movid;'
        '  end'
        ''
        '  if ((new.mov_id > 0) and (coalesce(new.mov_seq, 0) = 0)) then'
        '  begin'
        
          '    update nfce_movimento mov set mov.count_op = coalesce(mov.co' +
          'unt_op, 0) + 1'
        
          '      where mov.id = new.mov_id and mov.cod_empresa = new.cod_em' +
          'presa'
        '        returning mov.count_op into new.mov_seq;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger NOTAFISCAL_DATA_ESTOQUE for NOTAFISCAL'
        'active before insert or update position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into :CURRENT_TS;'
        ''
        '  if (updating) then'
        '  begin'
        
          '    if ((trim(coalesce(old.STATUS, '#39#39')) <> trim(coalesce(new.STA' +
          'TUS, '#39#39'))) and'
        '        (trim(coalesce(new.STATUS, '#39#39')) = '#39'Fechada'#39')) then'
        '      new.DATA_ESTOQUE = :CURRENT_TS;'
        '  end'
        '  else'
        '  if (inserting) then'
        '  begin'
        '    if (trim(coalesce(new.STATUS, '#39#39')) = '#39'Fechada'#39') then'
        '      new.DATA_ESTOQUE = :CURRENT_TS;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger NOTAFISCAL_ITEM_HIST_ESTOQUE_D for NOTAF' +
          'ISCAL_ITEM'
        'active before delete position 0'
        'AS'
        ' declare variable vnatureza char(1);'
        ' declare variable vtiponf char(1);'
        ' declare variable vnumero integer;'
        ' declare variable vcodcliente integer;'
        ' declare variable vdataestoque timestamp;'
        ' declare variable vstatus varchar(10);'
        ' declare variable CURRENT_TS timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        
          '  select notafiscal.natureza_nf, notafiscal.tipo_nf, notafiscal.' +
          'num_nf, notafiscal.cod_cliente,'
        '   notafiscal.data_estoque, notafiscal.status from notafiscal'
        
          '   where notafiscal.cod_nf = old.cod_nf and notafiscal.cod_empre' +
          'sa = old.cod_empresa'
        
          '  into :vnatureza, vtiponf, vnumero, vcodcliente, vdataestoque, ' +
          'vstatus;'
        ''
        '  if (trim(vnatureza) <> '#39'E'#39') then'
        '    exit;'
        ''
        '  if (trim(vtiponf) <> '#39'P'#39') then'
        '    exit;'
        ''
        '  if (trim(coalesce(vstatus, '#39#39')) <> '#39'Fechada'#39') then'
        '    exit;'
        ''
        '  if (trim(old.altera_estoque_cfop) = '#39'N'#39') then'
        '    exit;'
        ''
        
          '  insert into hist_estoque_diario_prod (tipo, seqid, cod_empresa' +
          ','
        
          '   tipor, natureza, data, grupo_prod, cod_prod, cod_grade, chass' +
          'i, numero, qtde,'
        
          '   valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_c' +
          'liente, cod_cfop,'
        '   aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '   aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        
          '   values (old.tipo_item, (select cod from incrementa_codigo(old' +
          '.cod_empresa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), old.cod_empresa,'
        
          '   '#39'NF'#39', '#39'E'#39', :vdataestoque, old.grupo_prod, old.cod_prod, old.c' +
          'od_grade, old.chassi, :vnumero, old.quantidade,'
        
          '   old.valor_unitario, old.valor_total, '#39'N'#39', old.prec_cusm_prod,' +
          ' old.nitem, :vcodcliente, old.codigo_nop,'
        
          '   old.aliq_icm, old.base_icm, old.valor_icm, old.aliq_icmsub, o' +
          'ld.base_icmsub, old.valor_icmsub,'
        '   old.aliq_ipi, old.base_ipi, old.valor_ipi, old.cod_nf);'
        ''
        
          '  select current_d from sp_current_ts(old.cod_empresa) into :cur' +
          'rent_ts;'
        ''
        
          '  insert into hist_estoque_diario_prod (tipo, seqid, cod_empresa' +
          ','
        
          '   tipor, natureza, data, grupo_prod, cod_prod, cod_grade, chass' +
          'i, numero, qtde,'
        
          '   valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_c' +
          'liente, cod_cfop,'
        '   aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '   aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        
          '   values (old.tipo_item, (select cod from incrementa_codigo(old' +
          '.cod_empresa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), old.cod_empresa,'
        
          '   '#39'NF'#39', '#39'S'#39', :current_ts, old.grupo_prod, old.cod_prod, old.cod' +
          '_grade, old.chassi, :vnumero, old.quantidade,'
        
          '   old.valor_unitario, old.valor_total, '#39'N'#39', old.prec_cusm_prod,' +
          ' old.nitem, :vcodcliente, old.codigo_nop,'
        
          '   old.aliq_icm, old.base_icm, old.valor_icm, old.aliq_icmsub, o' +
          'ld.base_icmsub, old.valor_icmsub,'
        '   old.aliq_ipi, old.base_ipi, old.valor_ipi, old.cod_nf);'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger OBSERVACAO_BI_DATAHORA for OBSERVACAO'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  select coalesce((max(OBS.NITEM) + 1), 1)'
        '  from OBSERVACAO OBS'
        '  where OBS.COD_OBS = new.COD_OBS and'
        '        OBS.COD_EMPRESA = new.COD_EMPRESA'
        '    into new.NITEM;'
        ''
        '  select CURRENT_D, CURRENT_T'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DATA_OBS, new.HORA_OBS;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PEDVENDA_DATA_ESTOQUE for PEDVENDA'
        'active before insert or update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if ((trim(coalesce(new.TIPO, '#39#39')) <> '#39'REQ'#39') and'
        '      (trim(coalesce(new.TIPO, '#39#39')) <> '#39'OS'#39')) then'
        '    exit;'
        ''
        '  if (updating) then'
        '  begin'
        
          '    if ((trim(coalesce(old.STATUS_PED, '#39#39')) <> trim(coalesce(new' +
          '.STATUS_PED, '#39#39'))) and'
        '        (trim(coalesce(new.STATUS_PED, '#39#39')) = '#39'FECHADA'#39')) then'
        '      select CURRENT_D'
        '      from SP_CURRENT_TS(new.COD_EMPRESA)'
        '        into new.DATA_ESTOQUE;'
        '  end'
        '  else'
        '  if (inserting) then'
        '  begin'
        '    if (trim(coalesce(new.STATUS_PED, '#39#39')) = '#39'FECHADA'#39') then'
        '      select CURRENT_D'
        '      from SP_CURRENT_TS(new.COD_EMPRESA)'
        '        into new.DATA_ESTOQUE;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PEDVENDA_HIST_ESTOQUE_D for PEDVENDA'
        'active before update or delete position 0'
        'AS  '
        ' declare variable CURRENT_TS timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if (updating) then'
        '  begin'
        
          '    if ((trim(coalesce(new.tipo, '#39#39')) <> '#39'REQ'#39') and (trim(coales' +
          'ce(new.tipo, '#39#39')) <> '#39'OS'#39')) then'
        '      exit;'
        ''
        
          '    if (not ((trim(coalesce(old.status_ped, '#39#39')) <> trim(coalesc' +
          'e(new.status_ped, '#39#39')))'
        '     and trim(coalesce(old.status_ped, '#39#39')) = '#39'FECHADA'#39')) then'
        '      exit;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '    if ((trim(coalesce(old.tipo, '#39#39')) <> '#39'REQ'#39') and (trim(coales' +
          'ce(old.tipo, '#39#39')) <> '#39'OS'#39')) then'
        '      exit;'
        ''
        '    if (trim(coalesce(old.status_ped, '#39#39')) <> '#39'FECHADA'#39') then'
        '      exit;'
        '  end'
        ''
        ' if ((updating) or (deleting)) then'
        ' begin'
        
          '    insert into hist_estoque_diario_prod (tipo, seqid, cod_empre' +
          'sa,'
        '    tipor, natureza, data, grupo_prod, cod_prod,'
        '    cod_grade, chassi, numero, qtde,'
        
          '    valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_' +
          'cliente, cod_cfop,'
        '    aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '    aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        ''
        
          '    select '#39'P'#39', (select cod from incrementa_codigo(old.cod_empre' +
          'sa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), pedvenda_prod.cod_empresa,'
        
          '    trim(pedvenda.tipo), '#39'S'#39', pedvenda.data_estoque, pedvenda_pr' +
          'od.grupo_prod, pedvenda_prod.cod_prod,'
        
          '    pedvenda_prod.cod_grade, null, pedvenda_prod.nped, pedvenda_' +
          'prod.quant_ped_item,'
        
          '    pedvenda_prod.vlun_ped_item, pedvenda_prod.vltot_ped_item, '#39 +
          'N'#39', pedvenda_prod.pcust_mc, pedvenda_prod.nitem, pedvenda.cod_cl' +
          'iente, pedvenda_prod.codigo_nop,'
        '    0, 0, 0, 0, 0, 0, 0, 0, 0, 0 from pedvenda'
        '    inner join pedvenda_prod on'
        
          '    pedvenda_prod.nped = pedvenda.nped and pedvenda_prod.tipo = ' +
          'pedvenda.tipo and pedvenda_prod.cod_empresa = pedvenda.cod_empre' +
          'sa'
        '    inner join produtos on'
        
          '    produtos.grupo_prod = pedvenda_prod.grupo_prod and produtos.' +
          'cod_prod = pedvenda_prod.cod_prod and produtos.cod_empresa = ped' +
          'venda_prod.cod_empresa'
        
          '    where pedvenda_prod.nped = old.nped and pedvenda_prod.tipo =' +
          ' old.tipo and pedvenda_prod.cod_empresa = old.cod_empresa'
        '    and coalesce(pedvenda_prod.status, '#39#39') <> '#39'CANCELADO'#39';'
        ''
        
          '    select current_d from sp_current_ts(old.cod_empresa) into :c' +
          'urrent_ts;'
        ''
        
          '    insert into hist_estoque_diario_prod (tipo, seqid, cod_empre' +
          'sa,'
        '    tipor, natureza, data, grupo_prod, cod_prod,'
        '    cod_grade, chassi, numero, qtde,'
        
          '    valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_' +
          'cliente, cod_cfop,'
        '    aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '    aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        ''
        
          '    select '#39'P'#39', (select cod from incrementa_codigo(old.cod_empre' +
          'sa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), pedvenda_prod.cod_empresa,'
        
          '    trim(pedvenda.tipo), '#39'E'#39', :current_ts, pedvenda_prod.grupo_p' +
          'rod, pedvenda_prod.cod_prod,'
        
          '    pedvenda_prod.cod_grade, null, pedvenda_prod.nped, pedvenda_' +
          'prod.quant_ped_item,'
        
          '    pedvenda_prod.vlun_ped_item, pedvenda_prod.vltot_ped_item, '#39 +
          'N'#39', pedvenda_prod.pcust_mc, pedvenda_prod.nitem, pedvenda.cod_cl' +
          'iente, pedvenda_prod.codigo_nop,'
        '    0, 0, 0, 0, 0, 0, 0, 0, 0, 0 from pedvenda'
        '    inner join pedvenda_prod on'
        
          '    pedvenda_prod.nped = pedvenda.nped and pedvenda_prod.tipo = ' +
          'pedvenda.tipo and pedvenda_prod.cod_empresa = pedvenda.cod_empre' +
          'sa'
        '    inner join produtos on'
        
          '    produtos.grupo_prod = pedvenda_prod.grupo_prod and produtos.' +
          'cod_prod = pedvenda_prod.cod_prod and produtos.cod_empresa = ped' +
          'venda_prod.cod_empresa'
        
          '    where pedvenda_prod.nped = old.nped and pedvenda_prod.tipo =' +
          ' old.tipo and pedvenda_prod.cod_empresa = old.cod_empresa'
        '    and coalesce(pedvenda_prod.status, '#39#39') <> '#39'CANCELADO'#39';'
        ' end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PEDVENDA_PROD_ALMOX for PEDVENDA_PROD'
        'active before insert or update or delete position 0'
        'AS'
        ' declare variable almox char(2);'
        ' declare variable nitem integer;'
        ' declare variable current_d timestamp;'
        ' declare variable current_t timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        '  if (inserting) then'
        '  begin'
        '    select trim(empresa.almox) from empresa'
        '    where empresa.cod_empresa = new.cod_empresa'
        '    into :almox;'
        '  '
        
          '    if (((new.tipo = '#39'REQ'#39')or(new.tipo = '#39'OS'#39')) and (coalesce(ne' +
          'w.status,'#39#39')='#39#39') and (almox ='#39'S2'#39') and (new.cod_pedido > 0)) the' +
          'n'
        '    begin'
        '      delete from controle_almoxarifado'
        
          '      where controle_almoxarifado.cod_pedido = new.cod_pedido an' +
          'd controle_almoxarifado.cod_empresa = new.cod_empresa and contro' +
          'le_almoxarifado.nitem = coalesce(new.nitem_pedido, 1);'
        '    end'
        '  end'
        '  else if (deleting)then'
        '  begin'
        '    select trim(empresa.almox) from empresa'
        '    where empresa.cod_empresa = old.cod_empresa'
        '    into :almox;'
        '  '
        
          '    if(((old.tipo = '#39'REQ'#39')or(old.tipo = '#39'OS'#39')) and (almox ='#39'S2'#39')' +
          ' and(old.cod_pedido > 0))  then'
        '    begin'
        
          '      select current_d, current_t from sp_current_ts(old.cod_emp' +
          'resa) into :current_d, :current_t;'
        ''
        
          '      insert into controle_almoxarifado (controle_almoxarifado.c' +
          'od_pedido, controle_almoxarifado.nitem,'
        
          '      controle_almoxarifado.cod_empresa,  controle_almoxarifado.' +
          'tipv, controle_almoxarifado.cod_cond_pag,'
        
          '      controle_almoxarifado.cod_vendedor, controle_almoxarifado.' +
          'grupo_prod, controle_almoxarifado.cod_prod,'
        
          '      controle_almoxarifado.num_fab_prod, controle_almoxarifado.' +
          'quant, controle_almoxarifado.vlun,'
        
          '      controle_almoxarifado.vltot, controle_almoxarifado.cod_gra' +
          'de,'
        
          '      controle_almoxarifado.codigo_nop, controle_almoxarifado.si' +
          't_atd, controle_almoxarifado.descr_prod,'
        
          '      controle_almoxarifado.data_pedido, controle_almoxarifado.h' +
          'ora_pedido, controle_almoxarifado.cod_cliente)'
        '    '
        
          '      select pedvenda_prod.cod_pedido, 1 nitem, pedvenda_prod.co' +
          'd_empresa, pedvenda.tipv, coalesce(pedvenda.cod_cond_pag, 1),'
        
          '      pedvenda_prod.cod_vendedor, pedvenda_prod.grupo_prod, pedv' +
          'enda_prod.cod_prod, pedvenda_prod.num_fab_prod,'
        
          '      pedvenda_prod.quant_ped_item, pedvenda_prod.vlun_ped_item,' +
          ' pedvenda_prod.vltot_ped_item,'
        
          '      pedvenda_prod.cod_grade, pedvenda_prod.codigo_nop, '#39'DV'#39' si' +
          't_atd, pedvenda_prod.descr_prod_ped,'
        
          '      :current_d, :current_t, pedvenda.cod_cliente from pedvenda' +
          ' inner join pedvenda_prod on pedvenda_prod.nped = pedvenda.nped'
        
          '      and pedvenda_prod.tipo = pedvenda.tipo and pedvenda_prod.c' +
          'od_empresa = pedvenda.cod_empresa'
        
          '      where pedvenda_prod.nped = old.nped and pedvenda_prod.nite' +
          'm = old.nitem'
        
          '      and pedvenda_prod.cod_empresa = old.cod_empresa and pedven' +
          'da_prod.tipo = old.tipo;'
        '    end'
        '  end'
        '  if(updating) then'
        '  begin'
        ''
        '    select trim(empresa.almox) from empresa'
        '    where empresa.cod_empresa = new.cod_empresa'
        '    into :almox;'
        '  '
        
          '    if ((coalesce(old.status,'#39#39')<>new.status) and (new.status = ' +
          #39'CANCELADO'#39') and (((new.tipo = '#39'REQ'#39'))or(new.tipo = '#39'OS'#39')) and (' +
          'almox ='#39'S2'#39') and(new.cod_pedido > 0))then'
        '    begin'
        
          '       select current_d, current_t from sp_current_ts(old.cod_em' +
          'presa) into :current_d, :current_t;'
        ''
        
          '       insert into controle_almoxarifado (controle_almoxarifado.' +
          'cod_pedido, controle_almoxarifado.nitem,'
        
          '       controle_almoxarifado.cod_empresa, controle_almoxarifado.' +
          'tipv, controle_almoxarifado.cod_cond_pag,'
        
          '       controle_almoxarifado.cod_vendedor, controle_almoxarifado' +
          '.grupo_prod, controle_almoxarifado.cod_prod,'
        
          '       controle_almoxarifado.num_fab_prod, controle_almoxarifado' +
          '.quant, controle_almoxarifado.vlun,'
        
          '       controle_almoxarifado.vltot, controle_almoxarifado.cod_gr' +
          'ade, controle_almoxarifado.codigo_nop,'
        
          '       controle_almoxarifado.sit_atd, controle_almoxarifado.desc' +
          'r_prod,'
        
          '       controle_almoxarifado.data_pedido, controle_almoxarifado.' +
          'hora_pedido, controle_almoxarifado.cod_cliente)'
        '    '
        
          '       select pedvenda_prod.cod_pedido, 1 nitem, pedvenda_prod.c' +
          'od_empresa, pedvenda.tipv, coalesce(pedvenda.cod_cond_pag, 1),'
        
          '       pedvenda_prod.cod_vendedor, pedvenda_prod.grupo_prod, ped' +
          'venda_prod.cod_prod, pedvenda_prod.num_fab_prod,'
        
          '       pedvenda_prod.quant_ped_item, pedvenda_prod.vlun_ped_item' +
          ', pedvenda_prod.vltot_ped_item,'
        
          '       pedvenda_prod.cod_grade, pedvenda_prod.codigo_nop, '#39'DV'#39' s' +
          'it_atd, pedvenda_prod.descr_prod_ped,'
        
          '       :current_d, :current_t, pedvenda.cod_cliente from pedvend' +
          'a inner join pedvenda_prod on pedvenda_prod.nped = pedvenda.nped'
        
          '       and pedvenda_prod.tipo = pedvenda.tipo and pedvenda_prod.' +
          'cod_empresa = pedvenda.cod_empresa'
        
          '       where pedvenda_prod.nped = new.nped and pedvenda_prod.nit' +
          'em = new.nitem'
        
          '       and pedvenda_prod.cod_empresa = new.cod_empresa and pedve' +
          'nda_prod.tipo = new.tipo;'
        '    end'
        '  '
        
          '    if ((coalesce(old.status,'#39#39')='#39#39') and (old.quant_ped_item > n' +
          'ew.quant_ped_item) and ((new.tipo = '#39'REQ'#39')or(new.tipo = '#39'OS'#39')) a' +
          'nd (almox ='#39'S2'#39') and(new.cod_pedido > 0))then'
        '    begin'
        
          '      select current_d, current_t from sp_current_ts(old.cod_emp' +
          'resa) into :current_d, :current_t;'
        ''
        '      select (count(*) + 1) as nitem from controle_almoxarifado'
        '      where controle_almoxarifado.cod_pedido = new.cod_pedido'
        '      into :nitem;'
        '      '
        
          '      insert into controle_almoxarifado (controle_almoxarifado.c' +
          'od_pedido, controle_almoxarifado.nitem,'
        
          '      controle_almoxarifado.cod_empresa, controle_almoxarifado.t' +
          'ipv, controle_almoxarifado.cod_cond_pag,'
        
          '      controle_almoxarifado.cod_vendedor, controle_almoxarifado.' +
          'data_pedido, controle_almoxarifado.hora_pedido,'
        
          '      controle_almoxarifado.grupo_prod, controle_almoxarifado.co' +
          'd_prod, controle_almoxarifado.num_fab_prod,'
        
          '      controle_almoxarifado.quant, controle_almoxarifado.vlun, c' +
          'ontrole_almoxarifado.vltot, controle_almoxarifado.cod_grade,'
        
          '      controle_almoxarifado.codigo_nop, controle_almoxarifado.si' +
          't_atd, controle_almoxarifado.descr_prod,'
        
          '      controle_almoxarifado.cod_vendedor1,  controle_almoxarifad' +
          'o.data_atd, controle_almoxarifado.hora_atd, controle_almoxarifad' +
          'o.cod_cliente)'
        '      '
        
          '      select pedvenda_prod.cod_pedido, :nitem as nitem, pedvenda' +
          '_prod.cod_empresa, pedvenda.tipv, coalesce(pedvenda.cod_cond_pag' +
          ', 1),'
        
          '      pedvenda_prod.cod_vendedor, pedvenda_prod.data_atd, pedven' +
          'da_prod.hora_atd,'
        
          '      pedvenda_prod.grupo_prod, pedvenda_prod.cod_prod, pedvenda' +
          '_prod.num_fab_prod,'
        
          '      old.quant_ped_item - new.quant_ped_item, pedvenda_prod.vlu' +
          'n_ped_item, (old.quant_ped_item - new.quant_ped_item) * pedvenda' +
          '_prod.vlun_ped_item,'
        
          '      pedvenda_prod.cod_grade, pedvenda_prod.codigo_nop, '#39'DV'#39' si' +
          't_atd, pedvenda_prod.descr_prod_ped,'
        
          '      pedvenda_prod.cod_almoxarifado, :current_d, :current_t, pe' +
          'dvenda.cod_cliente'
        
          '      from pedvenda inner join pedvenda_prod on pedvenda_prod.np' +
          'ed = pedvenda.nped'
        
          '      and pedvenda_prod.tipo = pedvenda.tipo and pedvenda_prod.c' +
          'od_empresa = pedvenda.cod_empresa'
        
          '      where pedvenda_prod.nped = new.nped and pedvenda_prod.nite' +
          'm = new.nitem'
        
          '      and pedvenda_prod.cod_empresa = new.cod_empresa and pedven' +
          'da_prod.tipo = new.tipo;'
        '    end'
        ''
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger PEDVENDA_PROD_COND_DEV_BI_ID for PEDVEND' +
          'A_PROD_COND_DEV'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (coalesce(new.ID, 0) <= 0) then'
        '    new.ID = next value for SEQ_PEDVENDA_PROD_COND_DEV;'
        ''
        '  if (new.DATA is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PMAT_MOBILE for PROMOCAO_PRODUTO'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DTHR_MODMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PMCAD_MOBILE for PROMOCAO_PRODUTO'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DTHR_CADMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PRAT_MOBILE for PRODUTOS'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DTHR_MODMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PRCAD_MOBILE for PRODUTOS'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DTHR_CADMOBILE;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PRODUCAO_DATA_ESTOQUE for PRODUCAO'
        'active before insert or update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (updating) then'
        '  begin'
        
          '    if ((trim(coalesce(old.STATUS, '#39#39')) <> trim(coalesce(new.STA' +
          'TUS, '#39#39'))) and'
        '        (trim(coalesce(new.STATUS, '#39#39')) = '#39'FECHADO'#39')) then'
        '      select CURRENT_D'
        '      from SP_CURRENT_TS(new.COD_EMPRESA)'
        '        into new.DATA_ESTOQUE;'
        '  end'
        '  else'
        '  if (inserting) then'
        '  begin'
        '    if (trim(coalesce(new.STATUS, '#39#39')) = '#39'FECHADO'#39') then'
        '      select CURRENT_D'
        '      from SP_CURRENT_TS(new.COD_EMPRESA)'
        '        into new.DATA_ESTOQUE;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger PRODUCAO_HIST_ESTOQUE_D for PRODUCAO'
        'active before update position 0'
        'AS    '
        ' declare variable current_d timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        
          '  if (not ((trim(coalesce(old.status, '#39#39')) <> trim(coalesce(new.' +
          'status, '#39#39')))'
        '   and trim(coalesce(old.status, '#39#39')) = '#39'FECHADO'#39')) then'
        '     exit;'
        ''
        '    '
        
          '   select current_d from sp_current_ts(old.cod_empresa) into :cu' +
          'rrent_d;'
        ''
        
          '   insert into hist_estoque_diario_prod (tipo, seqid, cod_empres' +
          'a,'
        '    tipor, natureza, data, grupo_prod, cod_prod,'
        '    cod_grade, chassi, numero, qtde,'
        
          '    valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_' +
          'cliente, cod_cfop,'
        '    aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '    aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        ''
        
          '    select '#39'P'#39', (select cod from incrementa_codigo(old.cod_empre' +
          'sa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), producao.cod_empresa,'
        
          '    '#39'PDC'#39', '#39'E'#39', producao.data_estoque, producao_item.grupo_prod,' +
          ' producao_item.cod_prod,'
        
          '    coalesce(producao_item.cod_grade, 0), null, producao.cod_pro' +
          'ducao, producao_item.quantidade,'
        
          '    coalesce(producao_item.prec_cusm_prod, 0), (coalesce(produca' +
          'o_item.prec_cusm_prod, 0) * producao_item.quantidade),'
        
          '    '#39'N'#39', producao_item.prec_cusm_prod, producao_item.nitem, prod' +
          'ucao.cod_cliente, 0,'
        '    0, 0, 0, 0, 0, 0, 0, 0, 0, 0 from producao'
        '    inner join producao_item on'
        
          '    producao_item.cod_producao = producao.cod_producao and produ' +
          'cao_item.cod_empresa = producao.cod_empresa'
        
          '    where producao_item.cod_producao = new.cod_producao and prod' +
          'ucao_item.cod_empresa = new.cod_empresa;'
        ''
        
          '   insert into hist_estoque_diario_prod (tipo, seqid, cod_empres' +
          'a,'
        '    tipor, natureza, data, grupo_prod, cod_prod,'
        '    cod_grade, chassi, numero, qtde,'
        
          '    valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_' +
          'cliente, cod_cfop,'
        '    aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '    aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        ''
        
          '    select '#39'P'#39', (select cod from incrementa_codigo(old.cod_empre' +
          'sa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), producao.cod_empresa,'
        
          '    '#39'PDC'#39', '#39'S'#39', :current_d, producao_item.grupo_prod, producao_i' +
          'tem.cod_prod,'
        
          '    coalesce(producao_item.cod_grade, 0), null, producao.cod_pro' +
          'ducao, producao_item.quantidade,'
        
          '    coalesce(producao_item.prec_cusm_prod, 0), (coalesce(produca' +
          'o_item.prec_cusm_prod, 0) * producao_item.quantidade),'
        
          '    '#39'N'#39', producao_item.prec_cusm_prod, producao_item.nitem, prod' +
          'ucao.cod_cliente, 0,'
        '    0, 0, 0, 0, 0, 0, 0, 0, 0, 0 from producao'
        '    inner join producao_item on'
        
          '    producao_item.cod_producao = producao.cod_producao and produ' +
          'cao_item.cod_empresa = producao.cod_empresa'
        
          '    where producao_item.cod_producao = new.cod_producao and prod' +
          'ucao_item.cod_empresa = new.cod_empresa;'
        ''
        ''
        
          '   insert into hist_estoque_diario_prod (tipo, seqid, cod_empres' +
          'a,'
        '    tipor, natureza, data, grupo_prod, cod_prod,'
        '    cod_grade, chassi, numero, qtde,'
        
          '    valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_' +
          'cliente, cod_cfop,'
        '    aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '    aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        ''
        
          '    select '#39'P'#39', (select cod from incrementa_codigo(old.cod_empre' +
          'sa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), producao.cod_empresa,'
        
          '    '#39'PDC'#39', '#39'S'#39', producao.data_estoque, producao_item_indice.grup' +
          'o_prod, producao_item_indice.cod_prod,'
        
          '    coalesce(producao_item_indice.cod_grade, 0), null, producao.' +
          'cod_producao, producao_item_indice.quantidade_utilizada,'
        
          '    coalesce(producao_item_indice.prec_cusm_prod, 0), (coalesce(' +
          'producao_item_indice.prec_cusm_prod, 0) * producao_item_indice.q' +
          'uantidade_utilizada),'
        
          '    '#39'N'#39', producao_item_indice.prec_cusm_prod, producao_item_indi' +
          'ce.nitem, producao.cod_cliente, 0,'
        '    0, 0, 0, 0, 0, 0, 0, 0, 0, 0 from producao'
        '    inner join producao_item_indice on'
        
          '    producao_item_indice.cod_producao = producao.cod_producao an' +
          'd producao_item_indice.cod_empresa = producao.cod_empresa'
        
          '    where producao_item_indice.cod_producao = new.cod_producao a' +
          'nd producao_item_indice.cod_empresa = new.cod_empresa;'
        ''
        
          '   insert into hist_estoque_diario_prod (tipo, seqid, cod_empres' +
          'a,'
        '    tipor, natureza, data, grupo_prod, cod_prod,'
        '    cod_grade, chassi, numero, qtde,'
        
          '    valor_unit, valor_tot, alterou_custo, custo_med, nitem, cod_' +
          'cliente, cod_cfop,'
        '    aliq_icm, base_icm, valor_icm, aliq_st, base_st, valor_st,'
        '    aliq_ipi, base_ipi, valor_ipi, cod_nf)'
        ''
        
          '    select '#39'P'#39', (select cod from incrementa_codigo(old.cod_empre' +
          'sa, '#39'HIST_ESTOQUE_DIARIO_PROD'#39')), producao.cod_empresa,'
        
          '    '#39'PDC'#39', '#39'E'#39', :current_d, producao_item_indice.grupo_prod, pro' +
          'ducao_item_indice.cod_prod,'
        
          '    coalesce(producao_item_indice.cod_grade, 0), null, producao.' +
          'cod_producao, producao_item_indice.quantidade_utilizada,'
        
          '    coalesce(producao_item_indice.prec_cusm_prod, 0), (coalesce(' +
          'producao_item_indice.prec_cusm_prod, 0) * producao_item_indice.q' +
          'uantidade_utilizada),'
        
          '    '#39'N'#39', producao_item_indice.prec_cusm_prod, producao_item_indi' +
          'ce.nitem, producao.cod_cliente, 0,'
        '    0, 0, 0, 0, 0, 0, 0, 0, 0, 0 from producao'
        '    inner join producao_item_indice on'
        
          '    producao_item_indice.cod_producao = producao.cod_producao an' +
          'd producao_item_indice.cod_empresa = producao.cod_empresa'
        
          '    where producao_item_indice.cod_producao = new.cod_producao a' +
          'nd producao_item_indice.cod_empresa = new.cod_empresa;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger PRODUTOS_FORN_NFE_BI_SEQID for PRODUTOS_' +
          'FORN_NFE'
        'active before insert position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  new.SEQID = next value for GEN_PRODUTOS_FORN_NFE;'
        ''
        
          '  if ((new.DATA_CADASTRO is null) or (new.DATA_MODIFICACAO is nu' +
          'll)) then'
        '  begin'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into :CURRENT_TS;'
        ''
        '    if (new.DATA_CADASTRO is null) then'
        '      new.DATA_CADASTRO = :CURRENT_TS;'
        '    if (new.DATA_MODIFICACAO is null) then'
        '      new.DATA_MODIFICACAO = :CURRENT_TS;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger PRODUTOS_FORN_NFE2_BI_SEQID for PRODUTOS' +
          '_FORN_NFE2'
        'active before insert position 0'
        'as'
        '  declare variable CURRENT_TS timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        
          '  if ((new.DATA_CADASTRO is null) or (new.DATA_MODIFICACAO is nu' +
          'll)) then'
        '  begin'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into :CURRENT_TS;'
        ''
        '    if (new.DATA_CADASTRO is null) then'
        '      new.DATA_CADASTRO = :CURRENT_TS;'
        '    if (new.DATA_MODIFICACAO is null) then'
        '      new.DATA_MODIFICACAO = :CURRENT_TS;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TABELA_PROCESSOS_BI_DEFAUT for TABELA_PR' +
          'OCESSOS'
        'active before insert position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.ATIVO is null) then'
        '    new.ATIVO = 1;'
        ''
        '  if (new.SENHA_GERENTE is null) then'
        '    new.SENHA_GERENTE = '#39'N'#39';'
        ''
        '  if (new.GRAVAR_AUDITORIA is null) then'
        '    new.GRAVAR_AUDITORIA = '#39'S'#39';'
        ''
        '  if (new.DATA_MOD_CAD is null) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_MOD_CAD;'
        ''
        '  if (new.FORM is null) then'
        '    new.FORM = '#39'.'#39';'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_CENTRO_CUSTOS_DT_ALT for CENTRO_CUSTO' +
          'S'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        
          '  if ((new.COD_CCUS <> old.COD_CCUS) or (new.CCUS <> old.CCUS)) ' +
          'then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DT_ALT;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_CODIGO_FORNECEDOR_DATACAD for CODIGO_' +
          'FORNECEDOR'
        'active before insert position 0'
        'as'
        'begin       '
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DATA_CADASTRO;'
        '  new.DATA_MODIFICACAO = new.DATA_CADASTRO;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_CODIGO_FORNECEDOR_DATAMOD for CODIGO_' +
          'FORNECEDOR'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CURRENT_D'
        '  from SP_CURRENT_TS(new.COD_EMPRESA)'
        '    into new.DATA_MODIFICACAO;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_DEVOLUCAO_DEBCRED for DEVOLUCAO'
        'active after insert or delete position 0'
        'AS'
        '  declare variable vdescricao varchar(48);'
        '  declare variable vpercetual_dc t_vl_todos;'
        '  declare variable vpercetual_dc_temp t_vl_todos;'
        '  declare variable vdebcred t_vl_todos;'
        '  declare variable vempusadebcred char(1);'
        '  declare variable vlancdebcred_dev char(1); '
        '  declare variable current_t timestamp;'
        '  declare variable current_d timestamp;'
        '  /*declare variable vtipo_os varchar(10);*/'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        '  /*vtipo_os='#39#39'; */'
        '  if (inserting) then'
        '  begin'
        '    if (coalesce(new.tipo,'#39#39')<>'#39'D'#39') then'
        '      exit;'
        
          '    select coalesce(e.usardebitocredito,'#39#39') as usardebitocredito' +
          ','
        
          '      coalesce(e.perc_lancdebcred_dev,0) as perc_lancdebcred_dev' +
          ','
        
          '      coalesce(p.perc_lancdebcred_dev,0) as perc_lancdebcre_dev2' +
          ','
        '      coalesce(e.lancdebcred_dev,'#39#39') as lancdebcred_dev'
        
          '      from empresa e inner join produtos p on e.cod_empresa=p.co' +
          'd_empresa'
        
          '      where e.cod_empresa=new.cod_empresa and p.grupo_prod=new.g' +
          'rupo_prod and p.cod_prod=new.cod_prod'
        
          '      into :vempusadebcred, :vpercetual_dc, :vpercetual_dc_temp,' +
          ' :vlancdebcred_dev;'
        ''
        
          '    if ((vempusadebcred<>'#39'S'#39') or ((vpercetual_dc<=0) and (vperce' +
          'tual_dc_temp<=0)) or (vlancdebcred_dev <> '#39'S'#39') ) then'
        '      exit;'
        ''
        '    /*if (rtrim(coalesce(new.tipo_venda,'#39#39'))='#39'OS'#39') then'
        
          '      select v.tipo_os from pedvenda v where v.nped = coalesce(n' +
          'ew.cod_venda,-1) and v.cod_empresa=new.cod_empresa into :vtipo_o' +
          's;'
        
          '    if ((select retorno from sp_retorno_debitocredito(new.tipo_v' +
          'enda,new.tipv,:vtipo_os)) <> '#39'S'#39') then'
        '      exit;*/'
        '  end'
        '  else begin'
        '    if (coalesce(old.tipo,'#39#39')<>'#39'D'#39') then'
        '      exit;'
        
          '    select coalesce(e.usardebitocredito,'#39#39') as usardebitocredito' +
          ','
        
          '      coalesce(e.perc_lancdebcred_dev,0) as perc_lancdebcred_dev' +
          ','
        
          '      coalesce(p.perc_lancdebcred_dev,0) as perc_lancdebcred_dev' +
          '2,'
        '      coalesce(e.lancdebcred_dev,'#39#39') as lancdebcred_dev'
        
          '      from empresa e inner join produtos p on e.cod_empresa=p.co' +
          'd_empresa'
        
          '      where e.cod_empresa=old.cod_empresa and p.grupo_prod=old.g' +
          'rupo_prod'
        '      and p.cod_prod=old.cod_prod'
        
          '      into :vempusadebcred,:vpercetual_dc,:vpercetual_dc_temp, :' +
          'vlancdebcred_dev;'
        
          '    if ((vempusadebcred<>'#39'S'#39') or ((vpercetual_dc<=0) and (vperce' +
          'tual_dc_temp<=0)) or (vlancdebcred_dev <> '#39'S'#39') ) then'
        '      exit;'
        ''
        '    /*if (rtrim(coalesce(old.tipo_venda,'#39#39'))='#39'OS'#39') then'
        
          '      select v.tipo_os from pedvenda v where v.nped = coalesce(o' +
          'ld.cod_venda,-1) and v.cod_empresa=old.cod_empresa into :vtipo_o' +
          's;'
        
          '    if ((select retorno from sp_retorno_debitocredito(old.tipo_v' +
          'enda,old.tipv,:vtipo_os)) <> '#39'S'#39') then'
        '      exit;*/'
        '  end'
        ''
        '  if (coalesce(vpercetual_dc_temp,0)> 0) then'
        '    vpercetual_dc = vpercetual_dc_temp;'
        ''
        '  if (inserting) then'
        
          '    vdebcred = (coalesce(new.quant,0) * coalesce(new.valor,0) * ' +
          'vpercetual_dc)/100;'
        
          '  else vdebcred = (coalesce(old.quant,0) * coalesce(old.valor,0)' +
          ' * vpercetual_dc)/100;'
        ''
        '  if (inserting) then'
        '    vdescricao = '#39'DEBITO REF. A DEVOLUCAO ITEM '#39';'
        '  else vdescricao = '#39'ESTORNO - EXCLUSAO DE ITEM DEV '#39';'
        ''
        '  if ((inserting) and (new.cod_vendedor is not null)) then'
        '  begin'
        
          '    select current_d, current_t from sp_current_ts(new.cod_empre' +
          'sa) into :current_d, :current_t;'
        ''
        
          '    insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VENDEDOR,' +
          'DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,DESCRI' +
          'CAO)'
        
          '      values ((select COD from INCREMENTA_CODIGO(new.cod_empresa' +
          ', '#39'LANC_DEBCRED'#39')),'
        
          '      new.cod_empresa,new.cod_vendedor,:current_d ,:current_t,'#39'D' +
          'EV'#39','
        
          '      -(:vdebcred) ,new.sequencia, :vdescricao||'#39'|'#39'||new.seqid||' +
          #39'|'#39'||new.grupo_prod||'#39'|'#39'||new.cod_prod);'
        '  end'
        '  else if (old.cod_vendedor is not null) then'
        '  begin'
        
          '    select current_d, current_t from sp_current_ts(new.cod_empre' +
          'sa) into :current_d, :current_t;'
        ''
        
          '    insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VENDEDOR,' +
          'DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,DESCRI' +
          'CAO)'
        
          '      values ((select COD from INCREMENTA_CODIGO(old.cod_empresa' +
          ', '#39'LANC_DEBCRED'#39')),'
        
          '      old.cod_empresa,old.cod_vendedor,:current_d ,:current_t,'#39'D' +
          'EV'#39','
        
          '      (:vdebcred) ,old.sequencia, :vdescricao||'#39'|'#39'||old.seqid||'#39 +
          '|'#39'||old.grupo_prod||'#39'|'#39'||old.cod_prod);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_ESTOQUE_DIARIO_VEICULOS for EST_MOTO'
        'active before insert or update or delete position 0'
        'as'
        '  declare variable  pveiculos char(1);'
        '  declare variable  pchassi char(20);'
        '  declare variable current_d timestamp;'
        'begin'
        '  select trim(empresa.VERSAO_VEICULO) from empresa'
        '  where empresa.cod_empresa = new.cod_empresa'
        '  into :pveiculos;'
        ''
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        '  if (trim(pveiculos) <> '#39'4'#39') then'
        '   exit;'
        ''
        '  if ((inserting) or (updating)) then'
        '  begin'
        '    if (trim(coalesce(new.status_estoque, '#39#39')) = '#39#39') then'
        '     new.status_estoque = '#39'N'#39';'
        '    if (trim(coalesce(new.status_res, '#39#39')) = '#39#39') then'
        '     new.status_res = '#39'N'#39';'
        '    if (trim(coalesce(new.status_transdep, '#39#39')) = '#39#39') then'
        '     new.status_transdep = '#39'N'#39';'
        '    if (trim(coalesce(new.status_demonst, '#39#39')) = '#39#39') then'
        '     new.status_demonst = '#39'N'#39';'
        '    if (trim(coalesce(new.status_canc, '#39#39')) = '#39#39') then'
        '     new.status_canc = '#39'N'#39';'
        '    if (trim(coalesce(new.usado_troca, '#39#39')) = '#39#39') then'
        '     new.usado_troca = '#39'N'#39';'
        '  end'
        ''
        '  if (inserting) then'
        '  begin'
        '    if (trim(coalesce(new.status_estoque, '#39'N'#39')) = '#39'S'#39') then'
        '    begin '
        
          '      select current_d from sp_current_ts(new.cod_empresa) into ' +
          ':current_d;'
        ''
        
          '      select first 1 coalesce(est.chassi, '#39#39') from estoque_diari' +
          'o est'
        
          '      where est.tipo = '#39'V'#39' and est.dia = :current_d and est.chas' +
          'si = new.chassi_c and est.cod_empresa = new.cod_empresa'
        '      into: pchassi;'
        ''
        '      if (trim(coalesce(pchassi, '#39#39')) = '#39#39') then'
        '      begin'
        
          '          INSERT INTO ESTOQUE_DIARIO (TIPO, SEQID, COD_EMPRESA, ' +
          'DIA, GRUPO_PROD, COD_PROD, COD_GRADE, CHASSI, ESTOQUE, CUSTO_MED' +
          'IO, SITUACAO)'
        
          '          VALUES ('#39'V'#39', (select cod from incrementa_codigo(new.co' +
          'd_empresa,'#39'ESTOQUE_DIARIO'#39')), new.cod_empresa, :current_d, null,' +
          ' null, null, new.chassi_c, 1, coalesce(new.preco_custo_rep, 0), ' +
          'new.status_uso);'
        '      end'
        '      else'
        '      begin'
        '         UPDATE ESTOQUE_DIARIO SET ESTOQUE = 1'
        
          '         WHERE TIPO = '#39'V'#39' AND DIA = :current_d AND CHASSI = new.' +
          'chassi_c  AND COD_EMPRESA = new.cod_empresa;'
        '      end'
        '    end'
        '  end'
        '  else if (updating) then'
        '  begin     '
        
          '    select current_d from sp_current_ts(new.cod_empresa) into :c' +
          'urrent_d;'
        ''
        
          '     select first 1 coalesce(est.chassi, '#39#39') from estoque_diario' +
          ' est'
        
          '     where est.tipo = '#39'V'#39' and est.dia = :current_d and est.chass' +
          'i = new.chassi_c and est.cod_empresa = new.cod_empresa'
        '     into: pchassi;'
        ''
        
          '     if ((trim(coalesce(old.status_estoque, '#39'N'#39')) <> trim(coales' +
          'ce(new.status_estoque, '#39'N'#39')))'
        '     and (trim(coalesce(new.status_estoque, '#39'N'#39')) = '#39'S'#39')) then'
        '     begin'
        '        if (trim(coalesce(pchassi, '#39#39')) = '#39#39') then'
        '        begin'
        
          '           INSERT INTO ESTOQUE_DIARIO (TIPO, SEQID, COD_EMPRESA,' +
          ' DIA, GRUPO_PROD, COD_PROD, COD_GRADE, CHASSI, ESTOQUE, CUSTO_ME' +
          'DIO, SITUACAO)'
        
          '           VALUES ('#39'V'#39', (select cod from incrementa_codigo(new.c' +
          'od_empresa,'#39'ESTOQUE_DIARIO'#39')), new.cod_empresa, :current_d, null' +
          ', null, null, new.chassi_c, 1, coalesce(new.preco_custo_rep, 0),' +
          ' new.status_uso);'
        '        end'
        '        else'
        '        begin'
        '           UPDATE ESTOQUE_DIARIO SET ESTOQUE = 1'
        
          '           WHERE TIPO = '#39'V'#39' AND DIA = :current_d AND CHASSI = ne' +
          'w.chassi_c  AND COD_EMPRESA = new.cod_empresa;'
        '        end'
        '     end'
        
          '     else if ((trim(coalesce(old.status_estoque, '#39'N'#39')) <> trim(c' +
          'oalesce(new.status_estoque, '#39'N'#39')))'
        '     and (trim(coalesce(new.status_estoque, '#39'N'#39')) = '#39'N'#39')) then'
        '     begin'
        '        if (trim(coalesce(pchassi, '#39#39')) = '#39#39') then'
        '        begin'
        
          '           INSERT INTO ESTOQUE_DIARIO (TIPO, SEQID, COD_EMPRESA,' +
          ' DIA, GRUPO_PROD, COD_PROD, COD_GRADE, CHASSI, ESTOQUE, CUSTO_ME' +
          'DIO, SITUACAO)'
        
          '           VALUES ('#39'V'#39', (select cod from incrementa_codigo(new.c' +
          'od_empresa,'#39'ESTOQUE_DIARIO'#39')), new.cod_empresa, :current_d, null' +
          ', null, null, new.chassi_c, 0, coalesce(new.preco_custo_rep, 0),' +
          ' new.status_uso);'
        '        end'
        '        else'
        '        begin'
        '           UPDATE ESTOQUE_DIARIO SET ESTOQUE = 0'
        
          '           WHERE TIPO = '#39'V'#39' AND DIA = :current_d AND CHASSI = ne' +
          'w.chassi_c  AND COD_EMPRESA = new.cod_empresa;'
        '        end'
        '     end'
        ''
        '  end'
        '  else if (deleting) then'
        '  begin  '
        
          '    select current_d from sp_current_ts(old.cod_empresa) into :c' +
          'urrent_d;'
        ''
        '    if (trim(coalesce(old.status_estoque, '#39'N'#39')) = '#39'S'#39') then'
        '    begin'
        
          '      select first 1 coalesce(est.chassi, '#39#39') from estoque_diari' +
          'o est'
        
          '      where est.tipo = '#39'V'#39' and est.dia = :current_d and est.chas' +
          'si = old.chassi_c and est.cod_empresa = old.cod_empresa'
        '      into: pchassi;'
        ''
        '      if (trim(coalesce(pchassi, '#39#39')) = '#39#39') then'
        '      begin'
        
          '          INSERT INTO ESTOQUE_DIARIO (TIPO, SEQID, COD_EMPRESA, ' +
          'DIA, GRUPO_PROD, COD_PROD, COD_GRADE, CHASSI, ESTOQUE, CUSTO_MED' +
          'IO, SITUACAO)'
        
          '          VALUES ('#39'V'#39', (select cod from incrementa_codigo(old.co' +
          'd_empresa,'#39'ESTOQUE_DIARIO'#39')), old.cod_empresa, :current_d, null,' +
          ' null, null, old.chassi_c, 0, coalesce(old.preco_custo_rep, 0), ' +
          'new.status_uso);'
        '      end'
        '      else'
        '      begin'
        '         UPDATE ESTOQUE_DIARIO SET ESTOQUE = 0'
        
          '         WHERE TIPO = '#39'V'#39' AND DIA = :current_d AND CHASSI = old.' +
          'chassi_c AND COD_EMPRESA = old.cod_empresa;'
        '      end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_EVD_PAF_PROD for PRODUTOS'
        'active after insert or update or delete position 0'
        'as'
        'begin'
        ' /**/'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_EVD_PAF_SERV for TIPO_SERVICO'
        'active after insert or update or delete position 0'
        'as'
        'begin'
        '  /**/'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_EVD_PAF_TERMIMP for TERMINAL_IMPRESSO' +
          'RAS'
        'active after insert or update or delete position 0'
        'as'
        'begin'
        '  /**/'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_ITEM_PEDIDO_BI_STATUS_PED for ITEM_PE' +
          'DIDO'
        'active before update position 0'
        'AS'
        '  declare variable vnum_ped integer;'
        '  declare variable vstatus_ped char(10);  '
        '  declare variable current_d timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select status_ped from pedido'
        
          '    where num_ped = new.num_ped and cod_empresa = new.cod_empres' +
          'a'
        '      into :vstatus_ped;'
        ''
        
          '   if ((new.recebido = '#39'S'#39') and (rtrim(vstatus_ped) = '#39'EFETIVADO' +
          #39')) then'
        '   begin'
        '     select first 1 num_ped from item_pedido'
        
          '       where num_ped = new.num_ped and cod_empresa = new.cod_emp' +
          'resa and'
        
          '       ((grupo_prod <> new.grupo_prod) or (cod_prod <> new.cod_p' +
          'rod) or (nitem <> new.nitem) ) and coalesce(recebido, '#39#39') <> '#39'S'#39
        '         into :vnum_ped;'
        '     if (coalesce(vnum_ped, 0) = 0) then'
        '     begin     '
        
          '       select current_d from sp_current_ts(new.cod_empresa) into' +
          ' :current_d;'
        ''
        
          '       update pedido set status_ped = '#39'RECEBIDO'#39', data_chg_ped =' +
          ' :current_d'
        
          '         where num_ped = new.num_ped and cod_empresa = new.cod_e' +
          'mpresa;'
        '     end'
        '   end'
        
          '   else if ((new.recebido <> '#39'S'#39') and (rtrim(vstatus_ped) = '#39'REC' +
          'EBIDO'#39')) then'
        '   begin'
        
          '     update pedido set status_ped = '#39'EFETIVADO'#39', data_chg_ped = ' +
          'null'
        
          '       where num_ped = new.num_ped and cod_empresa = new.cod_emp' +
          'resa;'
        '   end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_LANCDEBCRED_SALDODEBCRED for LANC_DEB' +
          'CRED'
        'active after insert or delete position 0'
        'AS'
        '  declare variable vsaldo t_vl_todos;'
        '  declare variable current_d timestamp;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        '  if (inserting) then'
        '  begin  '
        
          '    select current_d from sp_current_ts(new.cod_empresa) into :c' +
          'urrent_d;'
        ''
        '    if (new.cod_vendedor is not null) then'
        '    begin'
        '      select sdc.saldo from saldo_debcred sdc'
        
          '        where sdc.cod_vendedor = new.cod_vendedor and sdc.cod_em' +
          'presa=new.cod_empresa and sdc.data=:current_d'
        '        into :vsaldo;'
        '      if (row_count>0) then'
        '      begin'
        
          '        if ((round((coalesce(vsaldo,0) + coalesce(new.vl_lancdeb' +
          'cred,0)),5))=0.00000) then'
        '          update saldo_debcred sdc set sdc.saldo= 0'
        
          '            where sdc.cod_empresa=new.cod_empresa and sdc.cod_ve' +
          'ndedor=new.cod_vendedor and sdc.data=:current_d;'
        '        else'
        
          '          update saldo_debcred sdc set sdc.saldo= coalesce(:vsal' +
          'do,0) + coalesce(new.vl_lancdebcred,0)'
        
          '            where sdc.cod_empresa=new.cod_empresa and sdc.cod_ve' +
          'ndedor=new.cod_vendedor and sdc.data=:current_d;'
        '      end else'
        '      begin'
        
          '        select first 1 coalesce(sdc.saldo,0) from saldo_debcred ' +
          'sdc'
        
          '          where sdc.cod_vendedor= new.cod_vendedor and sdc.cod_e' +
          'mpresa=new.cod_empresa order by sdc.cod_saldo desc'
        '          into :vsaldo;'
        '        if (row_count=0) then'
        '          vsaldo=0;'
        
          '        insert into saldo_debcred (COD_SALDO,COD_EMPRESA,COD_VEN' +
          'DEDOR,SALDO,DATA)'
        
          '          values ((select COD from INCREMENTA_CODIGO(new.cod_emp' +
          'resa, '#39'SALDO_DEBCRED'#39')),'
        
          '          new.cod_empresa,new.cod_vendedor, (coalesce(:vsaldo,0)' +
          '+coalesce(new.vl_lancdebcred,0)),:current_d);'
        '      end'
        '    end'
        '  end else'
        '  begin   '
        
          '    select current_d from sp_current_ts(old.cod_empresa) into :c' +
          'urrent_d;'
        ''
        '    if (old.cod_vendedor is not null) then'
        '    begin'
        '      select sdc.saldo from saldo_debcred sdc'
        
          '        where sdc.cod_vendedor = old.cod_vendedor and sdc.cod_em' +
          'presa=old.cod_empresa and sdc.data=:current_d'
        '        into :vsaldo;'
        '      if (row_count>0) then'
        '      begin'
        
          '        if ((round((coalesce(vsaldo,0) - coalesce(old.vl_lancdeb' +
          'cred,0)),5))=0.00000) then'
        '          update saldo_debcred sdc set sdc.saldo= 0'
        
          '            where sdc.cod_empresa=old.cod_empresa and sdc.cod_ve' +
          'ndedor=old.cod_vendedor and sdc.data=:current_d;'
        '        else'
        
          '          update saldo_debcred sdc set sdc.saldo= coalesce(sdc.s' +
          'aldo,0) - coalesce(old.vl_lancdebcred,0)'
        
          '            where sdc.cod_empresa=old.cod_empresa and sdc.cod_ve' +
          'ndedor=old.cod_vendedor and sdc.data=:current_d;'
        '       end else'
        '      begin'
        '        select first 1 sdc.saldo from saldo_debcred sdc'
        
          '          where sdc.cod_vendedor= old.cod_vendedor and sdc.cod_e' +
          'mpresa=old.cod_empresa order by sdc.cod_saldo desc'
        '          into :vsaldo;'
        '        if (vsaldo is null) then'
        '          vsaldo=0;'
        
          '        insert into saldo_debcred (COD_SALDO,COD_EMPRESA,COD_VEN' +
          'DEDOR,SALDO,DATA)'
        
          '          values ((select COD from INCREMENTA_CODIGO(old.cod_emp' +
          'resa, '#39'SALDO_DEBCRED'#39')),'
        
          '          old.cod_empresa,old.cod_vendedor,coalesce(:vsaldo,0)-c' +
          'oalesce(old.vl_lancdebcred,0),:current_d);'
        '      end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_P_CONTAS_CONTABIL_DT_ALT for P_CONTAS' +
          '_CONTABIL'
        'active before update position 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        #9
        
          '  if ((new.COD_CTA <> old.COD_CTA) or (new.NOME_CTA <> old.NOME_' +
          'CTA) or (new.COD_NAT_CC <> old.COD_NAT_CC) or (new.IND_CTA <> ol' +
          'd.IND_CTA) or (new.NIVEL <> old.NIVEL)) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DT_ALT;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_PEDVENDA_DEBCRED for PEDVENDA'
        'active after insert or update position 0'
        'AS'
        '  declare variable vdebcred t_vl_todos;'
        '  declare variable vcodvendedor integer;'
        '  declare variable vdescricao varchar(48);'
        '  declare variable vempusadebcred char(1);   '
        '  declare variable current_t timestamp;'
        '  declare variable current_d timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        
          '  select coalesce(e.usardebitocredito,'#39#39') as usardebitocredito  ' +
          'from empresa e where e.cod_empresa=new.cod_empresa into :vempusa' +
          'debcred;'
        '  if (vempusadebcred<>'#39'S'#39')then'
        '    exit;'
        '  vdebcred = 0;'
        
          '  if (((coalesce(new.status_ped, '#39#39')) = '#39'FECHADA'#39') and ((coalesc' +
          'e(old.status_ped, '#39#39')) <> '#39'FECHADA'#39')) then'
        '  begin'
        
          '    if ((select retorno from sp_retorno_debitocredito(new.tipo,n' +
          'ew.tipv,new.tipo_os)) <> '#39'S'#39') then'
        '      exit;'
        
          '    update pedvenda_prod pvp set pvp.vl_debcred = (coalesce(pvp.' +
          'rateio_acresc,0)- coalesce(pvp.rateio_desc,0))+'
        
          '        (coalesce(pvp.vltot_ped_item,0)- (coalesce(pvp.vlun_orig' +
          ',coalesce(pvp.vlun_ped_item,0))*coalesce(pvp.quant_ped_item,0)))' +
          ' /*Para o caso de alterar o valor unitario*/'
        
          '        where pvp.cod_empresa = new.cod_empresa and pvp.nped = n' +
          'ew.nped and pvp.tipo=new.tipo and coalesce(pvp.status, '#39#39') <> '#39'C' +
          'ANCELADO'#39';'
        ''
        
          '    for select pvp.cod_vendedor, sum(coalesce(pvp.vl_debcred,0))' +
          ' from pedvenda_prod pvp'
        
          '      where pvp.cod_empresa = new.cod_empresa and pvp.nped = new' +
          '.nped'
        
          '      and pvp.tipo=new.tipo and coalesce(pvp.status, '#39#39') <> '#39'CAN' +
          'CELADO'#39
        '      group by pvp.cod_vendedor'
        '      into :vcodvendedor, :vdebcred do'
        '    begin'
        '      if (vcodvendedor is not null) then'
        '      begin      '
        
          '        select current_d, current_t from sp_current_ts(new.cod_e' +
          'mpresa) into :current_d, :current_t;'
        '        if (vdebcred>0) then'
        '          vdescricao= '#39'LANCAMENTO DE CREDITO - FECHAMENTO VND'#39';'
        '        else if (vdebcred<0) then'
        '          vdescricao = '#39'LANCAMENTO DE DEBITO - FECHAMENTO VND'#39';'
        '        if (vdebcred<>0) then'
        
          '          insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VEN' +
          'DEDOR,DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,' +
          'DESCRICAO)'
        
          '            values ((select COD from INCREMENTA_CODIGO(new.cod_e' +
          'mpresa, '#39'LANC_DEBCRED'#39')),'
        
          '            new.cod_empresa,:vcodvendedor,:current_d ,:current_t' +
          ',new.tipo,'
        '            :vdebcred ,new.nped, :vdescricao);'
        '      end'
        '    end'
        '  end'
        
          '  else if (((coalesce(old.status_ped, '#39#39')) = '#39'FECHADA'#39') and ((co' +
          'alesce(new.status_ped, '#39#39')) <> '#39'FECHADA'#39')) then'
        '  begin'
        
          '    if ((select retorno from sp_retorno_debitocredito(new.tipo,n' +
          'ew.tipv,new.tipo_os)) <> '#39'S'#39') then'
        '      exit;'
        
          '    for select pvp.cod_vendedor, sum(coalesce(pvp.vl_debcred,0))' +
          ' from pedvenda_prod pvp'
        
          '      where pvp.cod_empresa = new.cod_empresa and pvp.nped = new' +
          '.nped'
        
          '      and pvp.tipo=new.tipo and coalesce(pvp.status, '#39#39') <> '#39'CAN' +
          'CELADO'#39
        '      group by pvp.cod_vendedor'
        '      into :vcodvendedor, :vdebcred do'
        '    begin'
        '      if (vcodvendedor is not null) then'
        '      begin'
        
          '        select current_d, current_t from sp_current_ts(new.cod_e' +
          'mpresa) into :current_d, :current_t;'
        ''
        '        if (vdebcred>0) then'
        
          '          vdescricao= '#39'ESTORNO REFERENTE A CREDITO - VENDA REABE' +
          'RTA'#39';'
        '        else if (vdebcred<0) then'
        
          '          vdescricao = '#39'ESTORNO REFERENTE A DEBITO - VENDA REABE' +
          'RTA'#39';'
        '        if (vdebcred<>0) then'
        
          '          insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VEN' +
          'DEDOR,DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,' +
          'DESCRICAO)'
        
          '            values ((select COD from INCREMENTA_CODIGO(new.cod_e' +
          'mpresa, '#39'LANC_DEBCRED'#39')),'
        
          '            new.cod_empresa,:vcodvendedor,:current_d ,:current_t' +
          ',new.tipo,'
        '            -(:vdebcred) ,new.nped, :vdescricao);'
        '      end'
        '    end'
        '    update pedvenda_prod pvp set pvp.vl_debcred = 0'
        
          '      where pvp.cod_empresa = new.cod_empresa and pvp.nped = new' +
          '.nped'
        
          '      and pvp.tipo=new.tipo and coalesce(pvp.status, '#39#39') <> '#39'CAN' +
          'CELADO'#39';'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'create or alter trigger TI_PEDVENDAPROD_DEBCRED for PEDVENDA_PRO' +
          'D'
        'active after update position 1'
        'AS'
        '  declare variable vstatus varchar(10);'
        '  declare variable vdescricao varchar(48);'
        '  declare variable vdescricaonew varchar(48);'
        '  declare variable vempusadebcred char(1);'
        '  declare variable vtipo varchar(3);'
        '  declare variable vtipv varchar(1);'
        '  declare variable vtipo_os varchar(10);   '
        '  declare variable current_t timestamp;'
        '  declare variable current_d timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        ''
        
          '  if ((coalesce(old.vl_debcred,0)=0) and (coalesce(new.vl_debcre' +
          'd,0)=0)) then'
        '    exit;'
        ''
        
          '  select coalesce(e.usardebitocredito,'#39#39') as usardebitocredito  ' +
          'from empresa e where e.cod_empresa=new.cod_empresa into :vempusa' +
          'debcred;'
        '  if (vempusadebcred<>'#39'S'#39')then'
        '    exit;'
        
          '  select v.status_ped,v.tipo,v.tipv,v.tipo_os from pedvenda v wh' +
          'ere v.nped = new.nped and v.cod_empresa=new.cod_empresa and v.ti' +
          'po = new.tipo'
        '    into :vstatus,:vtipo,:vtipv,:vtipo_os;'
        '  if (vstatus is null) then'
        '    vstatus='#39#39';'
        
          '  if ((vstatus = '#39'FECHADA'#39') and (coalesce(new.status,'#39#39')<>'#39'CANCE' +
          'LADO'#39')) then'
        '  begin'
        
          '    if ((select retorno from sp_retorno_debitocredito(:vtipo,:vt' +
          'ipv,:vtipo_os)) <> '#39'S'#39') then'
        '      exit;'
        
          '    /*No caso de alterar o vendedor da venda ja fechada, lancar ' +
          'um credito ou debito para o new e old vendedor*/'
        '    if (coalesce(new.vl_debcred,0)>0) then'
        '    begin'
        '      vdescricao = '#39'ESTORNO DE CREDITO: ITEM '#39';'
        '      vdescricaonew = '#39'LANCAMENTO DE CREDITO: ITEM '#39';'
        '    end'
        '    else if (coalesce(new.vl_debcred,0)<0) then'
        '    begin'
        '      vdescricao = '#39'ESTORNO DE DEBITO: ITEM '#39';'
        '      vdescricaonew = '#39'LANCAMENTO DE DEBITO: ITEM '#39';'
        '    end'
        ''
        
          '    if ((coalesce(old.cod_vendedor, 0)) <> (coalesce(new.cod_ven' +
          'dedor, 0)))  then'
        '    begin     '
        
          '      select current_d, current_t from sp_current_ts(new.cod_emp' +
          'resa) into :current_d, :current_t;'
        ''
        
          '      if ((not(old.cod_vendedor is null)) and (coalesce(old.vl_d' +
          'ebcred,0)<>0)) then'
        
          '        insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VENDE' +
          'DOR,DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,DE' +
          'SCRICAO)'
        
          '          values ((select COD from INCREMENTA_CODIGO(old.cod_emp' +
          'resa, '#39'LANC_DEBCRED'#39')),'
        
          '          old.cod_empresa,old.cod_vendedor,:current_d ,:current_' +
          't,old.tipo,'
        
          '          -(coalesce(old.vl_debcred,0))  ,old.nped, :vdescricao|' +
          '|'#39'|'#39'||old.nitem||'#39'|'#39'||old.grupo_prod||'#39'|'#39'||old.cod_prod);'
        ''
        
          '      if ((not(new.cod_vendedor is null)) and (coalesce(new.vl_d' +
          'ebcred,0)<>0)) then'
        
          '        insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VENDE' +
          'DOR,DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,DE' +
          'SCRICAO)'
        
          '          values ((select COD from INCREMENTA_CODIGO(new.cod_emp' +
          'resa, '#39'LANC_DEBCRED'#39')),'
        
          '          new.cod_empresa,new.cod_vendedor,:current_d ,:current_' +
          't,new.tipo,'
        
          '          (coalesce(new.vl_debcred,0))  ,new.nped, :vdescricaone' +
          'w||'#39'|'#39'||new.nitem||'#39'|'#39'||new.grupo_prod||'#39'|'#39'||new.cod_prod);'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_PROD_AU_SPED_0205 for PRODUTOS'
        'active after update position 0'
        'AS'
        '  declare variable vseqid integer;'
        '  declare variable vvalorant varchar(32);'
        '  declare variable vdescrant varchar(75);'
        '  declare variable vvalornew varchar(32);'
        '  declare variable vdescrnew varchar(75);'
        '  declare variable vdataini timestamp;'
        '  declare variable vtipo_alt char(1); -- tipo_alt para gravar   '
        '  declare variable current_d timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;  '
        ''
        ''
        
          '  select current_d from sp_current_ts(new.cod_empresa) into :cur' +
          'rent_d;'
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
          'o = :current_d'
        '      into :vseqid, :vvalorant, :vdescrant;'
        '    if (coalesce(vseqid, 0) = 0) then -- sem alteracao no dia'
        '    begin'
        
          '      select first 1 data_alteracao from produtos_alteracoes whe' +
          're grupo_prod = old.grupo_prod and cod_prod = old.cod_prod and c' +
          'od_empresa = old.cod_empresa and data_alteracao < :current_d ord' +
          'er by data_alteracao desc'
        '        into :vdataini;'
        
          '      if ((:vdataini  is null) and (not old.dat_cad_prod is null' +
          ')) then -- data de cadastro do prduto'
        '        vdataini = old.dat_cad_prod;'
        
          '      else if (:vdataini is null) then -- caso nao tenha data re' +
          'gistrada sera registrado com data posterior 365 dias'
        '        vdataini = :current_d - 365;'
        '      else'
        
          '        vdataini = :vdataini + 1; -- caso encontre a data, esta ' +
          'sera usada como data inicial da alteracao'
        '      if (:vdataini > :current_d) then'
        '        vdataini = :current_d;'
        
          '      select cod from incrementa_codigo(new.cod_empresa, '#39'PRODUT' +
          'OS_ALTERACOES'#39') into :vseqid;'
        
          '      insert into produtos_alteracoes (seqid, grupo_prod, cod_pr' +
          'od, cod_empresa, tipo_alt, valor_anterior, data_alteracao, data_' +
          'ini, descr_prod_anterior)'
        
          '        values ( :vseqid, new.grupo_prod, new.cod_prod, new.cod_' +
          'empresa, :vtipo_alt, old.grupo_prod||'#39'|'#39'||rtrim(old.cod_prod)||'#39 +
          '|'#39', :current_d, :vdataini, rtrim(old.descr_prod));'
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
        'create or alter trigger TI_PRODUTOS_ALT_PRECO for PRODUTOS'
        'active before update position 0'
        'as'
        'begin'
        '  if (old.PREC_TAB_PROD <> new.PREC_TAB_PROD) then'
        '    select CURRENT_D'
        '    from SP_CURRENT_TS(new.COD_EMPRESA)'
        '      into new.DATA_ALT_PRECO;'
        ''
        
          '  if ((coalesce(old.ICM_PROD, 0) <> coalesce(new.ICM_PROD, 0)) o' +
          'r (coalesce(old.ISENTO_PROD, '#39#39') <> coalesce(new.ISENTO_PROD, '#39#39 +
          ')) or (coalesce(old.N_INCIDENCIA_PROD, '#39#39') <> coalesce(new.N_INC' +
          'IDENCIA_PROD, '#39#39'))) then'
        '  begin'
        '    if ((coalesce(new.ICM_PROD, 0) > 0) and'
        '        (coalesce(old.SIT_TRIB, '#39#39') <> '#39'T'#39')) then'
        '      new.SIT_TRIB = '#39'T'#39';'
        '    else'
        '    if ((coalesce(new.ISENTO_PROD, '#39#39') = '#39'S'#39') and'
        '        (coalesce(old.SIT_TRIB, '#39#39') <> '#39'I'#39')) then'
        '      new.SIT_TRIB = '#39'I'#39';'
        '    else'
        '    if ((coalesce(new.N_INCIDENCIA_PROD, '#39#39') = '#39'S'#39') and'
        '        (coalesce(old.SIT_TRIB, '#39#39') <> '#39'N'#39')) then'
        '      new.SIT_TRIB = '#39'N'#39';'
        '    else'
        '    if (coalesce(old.SIT_TRIB, '#39#39') <> '#39'F'#39') then'
        '      new.SIT_TRIB = '#39'F'#39';'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter trigger TI_VEICULOS_SUGESTAO for VEICULOS'
        'active after insert or update position 0'
        'AS'
        '    DECLARE VARIABLE vSugServico integer;'
        '    DECLARE VARIABLE vUsarAparelho char(3);'
        '    DECLARE VARIABLE vCodServ integer;'
        '    DECLARE VARIABLE vCodSug integer;'
        '    DECLARE VARIABLE vCodSugOs integer;'
        '    DECLARE VARIABLE vMesP integer;'
        '    DECLARE VARIABLE vDias integer;'
        '    DECLARE VARIABLE vDataCad timestamp;'
        '    DECLARE VARIABLE current_ts timestamp;'
        '    DECLARE VARIABLE vHoraCad char(8);'
        '    DECLARE VARIABLE vExisteSug integer;'
        'begin'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        ''
        '    if (new.modelo <= 0) then'
        '        exit;'
        ''
        '    if (coalesce(new.km_v, 0) > 0) then'
        '        exit;'
        ''
        '    select empresa.dadvap from empresa'
        '    where empresa.cod_empresa = new.cod_empresa'
        '    into: vusaraparelho;'
        ''
        '    if (trim(vusaraparelho) = '#39'SIM'#39') then'
        '        exit;'
        ''
        '    select config_sistema.value1_f from config_sistema'
        '    where config_sistema.chave = '#39'sug_serv_hab'#39
        '    and config_sistema.cod_empresa = new.cod_empresa'
        '    into: vSugServico;'
        ''
        '    if (vsugservico <= 0) then'
        '        exit;'
        ''
        '    select first 1 sugestaoservico.cod_sug from sugestaoservico'
        
          '    where sugestaoservico.placa = new.placa and sugestaoservico.' +
          'chassi = new.chassi'
        
          '    and sugestaoservico.cod_veic = new.codigo and sugestaoservic' +
          'o.cod_empresa = new.cod_empresa'
        '    and coalesce(sugestaoservico.status, '#39#39') <> '#39'CANCELADA'#39
        '    into: vExisteSug;'
        ''
        '    if (vExisteSug > 0) then'
        '        exit;'
        ''
        
          '    select current_d, current_ts from sp_current_ts(new.cod_empr' +
          'esa) into :vDataCad, :current_ts;'
        ''
        
          '    select case when(extract(hour from :current_ts) <=9) then '#39'0' +
          #39'|| extract(hour from :current_ts)'
        '    else extract(hour from :current_ts)'
        
          '    end ||'#39':'#39'|| case when (extract(minute from :current_ts) <= 9' +
          ') then'
        '        '#39'0'#39'|| extract(minute from :current_ts)'
        '    else extract(minute from :current_ts) end from rdb$database'
        '    into: vHoraCad;'
        ''
        '    for select regras_sug.codigo,'
        
          '     case when(regras_sug.mes_ret_serv1 > 0) then regras_sug.mes' +
          '_ret_serv1 else regras_sug.interv_mes_serv end from regras_sug'
        
          '    inner join regras_sug_itens on regras_sug_itens.codigo = reg' +
          'ras_sug.codigo and regras_sug_itens.cod_empresa = regras_sug.cod' +
          '_empresa'
        
          '    where regras_sug_itens.cod_tipo = new.modelo and regras_sug_' +
          'itens.cod_empresa = new.cod_empresa and regras_sug.ativo = 1'
        '    and regras_sug.tipo = '#39'V'#39
        '    into: vCodServ, vMesP  do'
        '    begin'
        '        if (vMesP > 0) then'
        '        begin'
        '            vDias = vMesP;'
        ''
        
          '            select cod from incrementa_codigo(new.cod_empresa, '#39 +
          'SUGESTAOSERVICO'#39') into: vCodSug;'
        ''
        
          '            select cod from incrementa_codigo(new.cod_empresa, '#39 +
          'SUG_OS'#39') into: vCodSugOs;'
        ''
        '            INSERT INTO SUG_OS'
        
          '            (COD_SUG_OS, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASS' +
          'I, PLACA, US_CAD, DATA_CAD, HORA_CAD,'
        '            KM, NDOC, TPDOC, COD_SERV_SUG, COD_VENDEDOR, ATIVO)'
        '            VALUES'
        
          '            (:vCodSugOs, new.cod_empresa, null, new.codigo, new.' +
          'chassi, new.placa, new.us_cad, :vDataCad, :vHoraCad,'
        
          '            0, null, null, :vcodserv, coalesce(new.us_cad, 0), 1' +
          ');'
        ''
        '            INSERT INTO SUGESTAOSERVICO'
        
          '            (COD_SUG, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASSI, ' +
          'PLACA, COD_SUG_OS, ULT_ATD, DATA, HORA,'
        
          '            ATIVO, COD_CLIENTE, US_CAD, DATA_CAD, HORA_CAD, NDOC' +
          '_ANT, TPDOC_ANT, COD_SERV_SUG, DIAS, TIPO)'
        '            VALUES'
        
          '            (:vCodSug, new.cod_empresa, null, new.codigo, new.ch' +
          'assi, new.placa, null,'
        '            new.us_cad, (:vDataCad + (:vDias * 30)), :vHoraCad,'
        
          '            1, new.cod_cliente, coalesce(new.us_cad, 0), :vDataC' +
          'ad, :vHoraCad,'
        
          '            null, null, :vcodserv, (:vDias * 30), '#39'MES PRIMEIRA ' +
          'REVISAO'#39');'
        '        end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_PRODUTOS_EC FOR PRODUTOS_EC'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS '
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        '  DECLARE VARIABLE VSEQID BIGINT; '
        '  DECLARE VARIABLE VDELETE INTEGER; '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if ((inserting)or(updating)) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMM' +
          'ERCE;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = OLD.COD_EMPRESA INTO: ECOMM' +
          'ERCE;'
        '  end'
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        
          '    if ((NEW.ID_COMMERCE <= 0) and (COALESCE(ECOMMERCE, 0) <= 0)' +
          ') then'
        '        exit;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '     if ((OLD.ID_COMMERCE <= 0) and (COALESCE(ECOMMERCE, 0) <= 0' +
          ')) then'
        '        exit;'
        '  end'
        ''
        '  VDELETE = 0;   '
        '  if (updating) then '
        
          '    if (coalesce(old.sinc_ecommerce, '#39'N'#39') <> (coalesce(new.sinc_' +
          'ecommerce, '#39'N'#39')) '
        
          '     and (coalesce(old.sinc_ecommerce, '#39'N'#39') = '#39'S'#39') and (coalesce' +
          '(new.sinc_ecommerce, '#39'N'#39') = '#39'N'#39')) then '
        '      VDELETE = 1; '
        ''
        '  if (deleting) then '
        '    VDELETE = 1; '
        ''
        '  if (vdelete > 0) then '
        '  begin '
        '    if (COALESCE(OLD.ID_COMMERCE, 0) <= 0) then '
        '     exit; '
        ''
        
          '    SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO :VSEQID;' +
          ' '
        
          '    INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_HORA_ALT' +
          '_WS, ID_COMMERCE)  '
        
          '    VALUES(:VSEQID, old.COD_EMPRESA, '#39'PRODUTOS_EC'#39', (select CURR' +
          'ENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), OLD.ID_COMMERCE);'
        '    NEW.ID_COMMERCE = 0;'
        '  end '
        '  else if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_PRODUTOS_EC, 1) FROM RD' +
          'B$DATABASE); '
        '  end '
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_CATEGORIA FOR CATEGORIA'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        '  DECLARE VARIABLE VDELETE INTEGER;  '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        '  VDELETE = 0;  '
        '  if (deleting) then '
        '    VDELETE = 1; '
        ''
        '  if (vdelete > 0) then '
        '  begin '
        '    if (COALESCE(OLD.ID_COMMERCE, 0) <= 0) then '
        '     exit; '
        ''
        
          '    SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO :VSEQID;' +
          ' '
        
          '    INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_HORA_ALT' +
          '_WS, ID_COMMERCE)  '
        
          '    VALUES(:VSEQID, old.COD_EMPRESA, '#39'CATEGORIA'#39', (select CURREN' +
          'T_TS from SP_CURRENT_TS(old.COD_EMPRESA)), OLD.ID_COMMERCE); '
        '  end '
        '  else if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_CATEGORIA, 1) FROM RDB$' +
          'DATABASE); '
        '  end '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_MARCA_PROD FOR MARCA_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        '  DECLARE VARIABLE VDELETE INTEGER;'
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        '  VDELETE = 0;  '
        '  if (deleting) then '
        '    VDELETE = 1; '
        ''
        '  if (vdelete > 0) then '
        '  begin '
        '    if (COALESCE(OLD.ID_COMMERCE, 0) <= 0) then '
        '     exit; '
        ''
        
          '    SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO :VSEQID;' +
          ' '
        
          '    INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_HORA_ALT' +
          '_WS, ID_COMMERCE)  '
        
          '    VALUES(:VSEQID, 0, '#39'MARCA_PROD'#39', (select CURRENT_TS from SP_' +
          'CURRENT_TS), OLD.ID_COMMERCE); '
        '  end '
        '  else if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_MARCA_PROD, 1) FROM RDB' +
          '$DATABASE); '
        '  end '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TI_PRODUTOS_EC_INDTEC FOR PRODUTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_DTEC_PRODUTOS_EC FOR PRODUTOS_EC*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER TR_DTEC_PRODUTOS_EC_GRADE FOR PRODUTOS' +
          '_EC_GRADE*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PRODUTOS_EC_INDTEC FOR PRODUTOS'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        '  DECLARE VARIABLE ESTMANUAL_ECOMMERCE INTEGER;'
        '  DECLARE VARIABLE VSINC_ECOMMERCE VARCHAR(1);'
        '  DECLARE VARIABLE IDCOMMERCE INTEGER;'
        '  DECLARE VARIABLE VTIPO_ITEM CHAR(2);'
        '  DECLARE VARIABLE VGRUPO_PROD_TMP INTEGER;'
        '  DECLARE VARIABLE VCOD_PROD_TMP CHAR(6);'
        '  DECLARE VARIABLE VCOD_EMPRESA_TMP INTEGER;   '
        'begin'
        '  /* Trigger text */'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMMER' +
          'CE;'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_controle_est_manual'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ESTMANU' +
          'AL_ECOMMERCE;'
        ''
        
          '  SELECT PRODUTOS_EC.SINC_ECOMMERCE, PRODUTOS_EC.ID_COMMERCE FRO' +
          'M PRODUTOS_EC'
        
          '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD AND PRODUTOS_EC.' +
          'COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :VSINC_ECOM' +
          'MERCE, :IDCOMMERCE;'
        ''
        
          '  if ((COALESCE(IDCOMMERCE, 0) <= 0) and (COALESCE(ECOMMERCE, 0)' +
          ' <= 0)) then'
        '    exit;'
        ''
        '  if (COALESCE(ESTMANUAL_ECOMMERCE, 0) > 0) then'
        '    exit;'
        ''
        '  if (updating) then'
        '  begin'
        '    if (coalesce(old.est_f, 0) <> coalesce(new.est_f, 0)) then'
        '    begin'
        '      /* Atualizar produto acabado */'
        '      for select distinct'
        '        ind.grupo_prod_acabado,'
        '        ind.cod_prod_acabado,'
        '        ind.cod_empresa,'
        
          '        coalesce(pr.tipo_item, '#39'00'#39') tipo_item from indice_tecni' +
          'co ind'
        
          '        inner join produtos pr on pr.grupo_prod = ind.grupo_prod' +
          '_acabado and pr.cod_prod = ind.cod_prod_acabado and ind.cod_empr' +
          'esa = pr.cod_empresa'
        '        where ind.grupo_prod_mprima = new.grupo_prod'
        '        and ind.cod_prod_mprima = new.cod_prod'
        '        and ind.cod_empresa = new.cod_empresa'
        
          '         into :vgrupo_prod_tmp, :vcod_prod_tmp, :vcod_empresa_tm' +
          'p, :vtipo_item do'
        '      begin'
        '        if (coalesce(vtipo_item, '#39'00'#39') = '#39'04'#39') then'
        '        begin               '
        '          vcod_prod_tmp = trim(vcod_prod_tmp);'
        '          update produtos_ec set'
        '            produtos_ec.grupo_prod = :vgrupo_prod_tmp,'
        '            produtos_ec.cod_prod = :vcod_prod_tmp,'
        '            produtos_ec.cod_empresa = :vcod_empresa_tmp'
        '          where produtos_ec.grupo_prod = :vgrupo_prod_tmp'
        '          and produtos_ec.cod_prod = :vcod_prod_tmp'
        '          and produtos_ec.cod_empresa = :vcod_empresa_tmp;'
        ''
        '          update produtos_ec_grade set'
        '            produtos_ec_grade.grupo_prod = :vgrupo_prod_tmp,'
        '            produtos_ec_grade.cod_prod = :vcod_prod_tmp,'
        '            produtos_ec_grade.cod_empresa = :vcod_empresa_tmp'
        '          where produtos_ec_grade.grupo_prod = :vgrupo_prod_tmp'
        '          and produtos_ec_grade.cod_prod = :vcod_prod_tmp'
        '          and produtos_ec_grade.cod_empresa = :vcod_empresa_tmp;'
        '        end'
        '      end'
        '    end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_DTEC_PRODUTOS_EC FOR PRODUTOS_EC*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER TR_DTEC_PRODUTOS_EC_GRADE FOR PRODUTOS' +
          '_EC_GRADE*/'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_BAIXA_CREDITOS_EMP ON BAIXA_CREDITOS (CODIGO_EM' +
          'P);'
        
          'CREATE INDEX IDX_CONTROLE_CREDITOS_EMP ON CONTROLE_CREDITOS (COD' +
          'IGO_EMP);'
        
          'CREATE INDEX IDX_CONTROLE_CHEQUE_EMP ON CONTROLE_CHEQUE (CODIGO_' +
          'EMP);'
        'ALTER TABLE PRODUTOS ADD COD_COMISSAO_FAIXA_DESC INTEGER;'
        ''
        '|BLOCO|'
        'CREATE TABLE COMISSAO_FAIXA_DESCONTO ('
        '    CODIGO       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DESCRICAO    VARCHAR(50) NOT NULL,'
        '    TIPO         VARCHAR(10) NOT NULL,'
        '    ATIVO        INTEGER DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE COMISSAO_FAIXA_DESCONTO ADD CONSTRAINT PK_COMISSAO_F' +
          'AIXA_DESCONTO PRIMARY KEY (CODIGO, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE COMISSAO_FAIXA_DESCONTO_VIG ('
        '    COD_VIG      INTEGER NOT NULL,'
        '    CODIGO       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DTINI_VIG    TIMESTAMP NOT NULL,'
        '    DTFIM_VIG    TIMESTAMP NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE COMISSAO_FAIXA_DESCONTO_VIG ADD CONSTRAINT PK_COMISS' +
          'AO_FAIXA_DESCONTO_VIG PRIMARY KEY (COD_VIG, CODIGO, COD_EMPRESA)' +
          ';'
        
          'ALTER TABLE COMISSAO_FAIXA_DESCONTO_VIG ADD CONSTRAINT FK_COMISS' +
          'AO_FAIXA_DESCONTO_VIG FOREIGN KEY (CODIGO, COD_EMPRESA) REFERENC' +
          'ES COMISSAO_FAIXA_DESCONTO (CODIGO, COD_EMPRESA) ON DELETE CASCA' +
          'DE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE COMISSAO_FAIXA_DESCONTO_PERC ('
        '    COD_PERC       INTEGER NOT NULL,'
        '    COD_VIG        INTEGER NOT NULL,'
        '    CODIGO         INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        
          '    PERC_DESC_INI  T_VL_TODOS NOT NULL /* T_VL_TODOS = DOUBLE PR' +
          'ECISION DEFAULT 000000000.00 */,'
        
          '    PERC_DESC_FIM  T_VL_TODOS NOT NULL /* T_VL_TODOS = DOUBLE PR' +
          'ECISION DEFAULT 000000000.00 */,'
        
          '    PERC_COMISSAO  T_VL_TODOS NOT NULL /* T_VL_TODOS = DOUBLE PR' +
          'ECISION DEFAULT 000000000.00 */'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE COMISSAO_FAIXA_DESCONTO_PERC ADD CONSTRAINT PK_COMIS' +
          'SAO_FAIXA_DESCONTO_PERC PRIMARY KEY (COD_PERC, COD_VIG, CODIGO, ' +
          'COD_EMPRESA);'
        
          'ALTER TABLE COMISSAO_FAIXA_DESCONTO_PERC ADD CONSTRAINT FK_COMIS' +
          'SAO_FAIXA_DESCONTO_PERC FOREIGN KEY (CODIGO, COD_EMPRESA) REFERE' +
          'NCES COMISSAO_FAIXA_DESCONTO (CODIGO, COD_EMPRESA) ON DELETE CAS' +
          'CADE ON UPDATE CASCADE;'
        
          'ALTER TABLE COMISSAO_FAIXA_DESCONTO_PERC ADD CONSTRAINT FK_COMIS' +
          'SAO_FAIXA_DESCONTO_VIGP FOREIGN KEY (COD_VIG, CODIGO, COD_EMPRES' +
          'A) REFERENCES COMISSAO_FAIXA_DESCONTO_VIG (COD_VIG, CODIGO, COD_' +
          'EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS458'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA DE CADASTRO COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMIS' +
          'SAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS459'#39', :COD_EMPRESA, '#39'BT' +
          ' PESQUISAR COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMISSAOFAIXADE' +
          'SC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS460'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMISSAOFAIXADESC'#39', ' +
          ':COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS461'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMISSAOFAIXADESC' +
          #39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS462'#39', :COD_EMPRESA, '#39'BT' +
          ' ENVIAR COMISSAO FAIXA DESC PARA LIXEIRA'#39', 10, '#39'N'#39', '#39'FRMCADCOMIS' +
          'SAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS463'#39', :COD_EMPRESA, '#39'BT' +
          ' REMOVER PERMANENTEMENTE COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADC' +
          'OMISSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS464'#39', :COD_EMPRESA, '#39'BT' +
          ' RESTAURAR DA LIXEIRA COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMI' +
          'SSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS465'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMISSAOFAIXADESC'#39 +
          ', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS466'#39', :COD_EMPRESA, '#39'BT' +
          ' ABRIR LIXEIRA COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMISSAOFAI' +
          'XADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS467'#39', :COD_EMPRESA, '#39'BT' +
          ' IMPRIMIR COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMISSAOFAIXADES' +
          'C'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS468'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVA DATA VIGENCIA COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMISS' +
          'AOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS469'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR DATA VIGENCIA COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOM' +
          'ISSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS470'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR DATA VIGENCIA COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOM' +
          'ISSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS471'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR DATA VIGENCIA COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMI' +
          'SSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS472'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO INTERV DESCONTO COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCOMI' +
          'SSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS473'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR INTERV DESCONTO COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADC' +
          'OMISSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS474'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR INTERV DESCONTO COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADC' +
          'OMISSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS475'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR INTERV DESCONTO COMISSAO FAIXA DESC'#39', 10, '#39'N'#39', '#39'FRMCADCO' +
          'MISSAOFAIXADESC'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'ALTER TABLE REGRAS_TRAVOSREQ ADD CONSTRAINT PK_REGRAS_TRAVOSREQ ' +
          'PRIMARY KEY (TIPO, TIPV, COD_EMPRESA);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS476'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA DE CADASTRO REGRAS TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREGRAS' +
          'TRAVOSREQ'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS477'#39', :COD_EMPRESA, '#39'BT' +
          ' PESQUISAR REGRAS TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREGRASTRAVOSREQ'#39 +
          ', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS478'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO REGRA TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREGRASTRAVOSREQ'#39', :COD' +
          '_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS479'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR REGRA TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREGRASTRAVOSREQ'#39', :' +
          'COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS480'#39', :COD_EMPRESA, '#39'BT' +
          ' ENVIAR REGRA TRAV REQ/OS PARA LIXEIRA'#39', 10, '#39'N'#39', '#39'FRMCADREGRAST' +
          'RAVOSREQ'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS481'#39', :COD_EMPRESA, '#39'BT' +
          ' REMOVER PERMANENTEMENTE REGRA TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREG' +
          'RASTRAVOSREQ'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS482'#39', :COD_EMPRESA, '#39'BT' +
          ' RESTAURAR DA LIXEIRA REGRA TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREGRAS' +
          'TRAVOSREQ'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS483'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR REGRA TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREGRASTRAVOSREQ'#39', :C' +
          'OD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS484'#39', :COD_EMPRESA, '#39'BT' +
          ' ABRIR LIXEIRA REGRA TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREGRASTRAVOSR' +
          'EQ'#39', :COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS485'#39', :COD_EMPRESA, '#39'BT' +
          ' IMPRIMIR REGRA TRAV REQ/OS'#39', 10, '#39'N'#39', '#39'FRMCADREGRASTRAVOSREQ'#39', ' +
          ':COD_EMPRESA, '#39'N'#39', CURRENT_DATE);'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER TI_PRODUTOS_PROMOCAO_ALT FOR PRODUTOS*' +
          '/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|update promocao set hora_ini = hora_ini || '#39':'#39' || subst' +
          'ring(hora_ini from 4 for 2) where coalesce(hora_ini, '#39#39') <> '#39#39' a' +
          'nd (char_length(hora_ini) > 4) and (char_length(hora_ini) < 8);'
        
          'CMD:REPL|update promocao set hora_fim = hora_fim || '#39':'#39' || subst' +
          'ring(hora_fim from 4 for 2) where coalesce(hora_fim, '#39#39') <> '#39#39' a' +
          'nd (char_length(hora_fim) > 4) and (char_length(hora_fim) < 8);'
        
          'CMD:REPL|update promocao_produto set hora_ini = hora_ini || '#39':'#39' ' +
          '|| substring(hora_ini from 4 for 2) where coalesce(hora_ini, '#39#39')' +
          ' <> '#39#39' and (char_length(hora_ini) > 4) and (char_length(hora_ini' +
          ') < 8);'
        
          'CMD:REPL|update promocao_produto set hora_fim = hora_fim || '#39':'#39' ' +
          '|| substring(hora_fim from 4 for 2) where coalesce(hora_fim, '#39#39')' +
          ' <> '#39#39' and (char_length(hora_fim) > 4) and (char_length(hora_fim' +
          ') < 8);'
        
          'CMD:REPL|update promocao_produto pp set pp.proporcao_tabela = co' +
          'alesce(valor_promocao, 0) / coalesce((select coalesce(prec_tab_p' +
          'rod, 0) from produtos pr where pr.grupo_prod = pp.grupo_prod and' +
          ' pr.cod_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa),' +
          ' 0) where (coalesce(pp.proporcao_tabela, 0) > 0) and (coalesce(p' +
          'p.valor_promocao, 0) > 0) and (coalesce(pp.cod_tppreco, 0) > 1) ' +
          'and (pp.cod_empresa = :cod_empresa) and (select count(*) from em' +
          'presa emp where emp.cod_empresa = pp.cod_empresa and emp.alt_per' +
          'c_margem = '#39'S'#39') = 1'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER TR_EMPRESA_PROMOCAO_PROD_ALT FOR EMPRE' +
          'SA*/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'REL058'#39', :COD_EMPRESA, '#39'BT' +
          ' CONF REL COMISSAO POR FAIXA DESCONTO'#39', 3, '#39'N'#39', '#39'FRMRELATORIOS'#39',' +
          ' 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'REL059'#39', :COD_EMPRESA, '#39'BT' +
          ' HAB VENDEDOR REL COMISSAO POR FAIXA DESCONTO'#39', 3, '#39'N'#39', '#39'FRMRELA' +
          'TORIOS'#39', 1, '#39'N'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'create or alter procedure RETORNA_COMISSAO_FAIXADESC ('
        '    PCOD_COMISSAO_FAIXA_DESC integer,'
        '    PCOD_EMPRESA integer,'
        '    PPERC_DESCONTO double precision,'
        '    PVALOR_ITEM double precision)'
        'returns ('
        '    ICODIGO_REGRA integer,'
        '    IDESCRICAO_REGRA varchar(50),'
        '    ITIPO_REGRA varchar(10),'
        '    IPERCENTUAL_REGRA double precision,'
        '    IPERCENTUAL_DESC double precision,'
        '    IVALOR_COMISSAO double precision)'
        'as'
        'begin'
        '  /* Procedure Text */'
        '  icodigo_regra = 0;'
        '  idescricao_regra = '#39#39';'
        '  itipo_regra = '#39#39';'
        '  ipercentual_regra = 0;'
        '  ivalor_comissao = 0;'
        '  if (coalesce(pcod_comissao_faixa_desc, 0) > 1) then'
        '  begin'
        
          '      select  first 1 cdesc.codigo, cdesc.descricao, cdesc.tipo,' +
          ' cperc.perc_comissao from comissao_faixa_desconto cdesc'
        '      inner join comissao_faixa_desconto_vig cvig on'
        '        cvig.codigo = cdesc.codigo'
        '        and cvig.cod_empresa = cdesc.cod_empresa'
        '        and current_date >= cvig.dtini_vig'
        '        and current_date <= cvig.dtfim_vig'
        '      inner join comissao_faixa_desconto_perc cperc on'
        '        cperc.cod_vig = cvig.cod_vig'
        '        and cperc.codigo = cvig.codigo'
        '        and cperc.cod_empresa = cvig.cod_empresa'
        '        and :pperc_desconto >= cperc.perc_desc_ini'
        '        and :pperc_desconto <= cperc.perc_desc_fim'
        '      where cdesc.codigo = :pcod_comissao_faixa_desc'
        '      and cdesc.cod_empresa = :pcod_empresa'
        
          '      and cdesc.ativo = 1 into :icodigo_regra, :idescricao_regra' +
          ', :itipo_regra, :ipercentual_regra;'
        '  end'
        '  if (coalesce(icodigo_regra, 0) <= 0) then'
        '  begin'
        
          '    select first 1 cdesc.codigo, cdesc.descricao, cdesc.tipo, cp' +
          'erc.perc_comissao from comissao_faixa_desconto cdesc'
        '    inner join comissao_faixa_desconto_vig cvig on'
        '      cvig.codigo = cdesc.codigo'
        '      and cvig.cod_empresa = cdesc.cod_empresa'
        '      and current_date >= cvig.dtini_vig'
        '      and current_date <= cvig.dtfim_vig'
        '    inner join comissao_faixa_desconto_perc cperc on'
        '      cperc.cod_vig = cvig.cod_vig'
        '      and cperc.codigo = cvig.codigo'
        '      and cperc.cod_empresa = cvig.cod_empresa'
        '      and :pperc_desconto >= cperc.perc_desc_ini'
        '      and :pperc_desconto <= cperc.perc_desc_fim'
        '    where cdesc.tipo = '#39'GERAL'#39
        '    and cdesc.cod_empresa = :pcod_empresa'
        
          '    and cdesc.ativo = 1 into :icodigo_regra, :idescricao_regra, ' +
          ':itipo_regra, :ipercentual_regra;'
        '  end'
        
          '  if ((coalesce(icodigo_regra, 0) > 0) and (coalesce(ipercentual' +
          '_regra, 0) > 0)) then'
        '  begin'
        
          '    ivalor_comissao = round(((coalesce(pvalor_item, 0) / 100) * ' +
          'coalesce(ipercentual_regra, 0)), 2);'
        '    ipercentual_desc = coalesce(pperc_desconto, 0);'
        '  end'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW PROD_SERV_EMVENDAS_FAIXA_DESC('
        '    COD_EMPRESA,'
        '    DATA_FECH,'
        '    NPED,'
        '    TIPO,'
        '    NITEM,'
        '    PROD_SERV,'
        '    GRUPOP_CODSERV,'
        '    COD_PROD,'
        '    QUANT_PED_ITEM,'
        '    VLUN_ORIG,'
        '    VLUN_PED_ITEM,'
        '    VLTOT_PED_ITEM,'
        '    VLTOTLIQ_PED_ITEM,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    PCUST_MC,'
        '    DESCR_ITEM_PED,'
        '    PERC_DESC_ITEM,'
        '    COD_REGRA_FAIXADESC,'
        '    DESCR_REGRA_FAIXADESC,'
        '    TIPO_REGRA_FAIXADESC,'
        '    PERC_DESC_REGRA_FAIXADESC,'
        '    COMISS_PROD,'
        '    COMISS_PROD_GER,'
        '    PERC_DESC,'
        '    PERC_COMISS,'
        '    N_NF,'
        '    DESCRICAO,'
        '    SIGLA,'
        '    TIPO_OS,'
        '    NOME_VENDEDOR,'
        '    COD_VENDEDOR,'
        '    COL_COD_VENDEDOR,'
        '    PC_VEND_SERV,'
        '    PC_VEND_PROD,'
        '    COD_FUNCAO,'
        '    DESC_FUNCAO,'
        '    VENDA)'
        'AS'
        
          'select v.cod_empresa,  v.data_fech, pp.nped,pp.tipo,pp.nitem,'#39'P'#39 +
          ' as prod_serv,'
        'pp.grupo_prod,pp.cod_prod,'
        'coalesce(pp.quant_ped_item,0) as quant_ped_item,'
        'coalesce(pp.vlun_orig, 0) vlun_orig,'
        'coalesce(pp.vlun_ped_item,0) as vlun_ped_item,'
        'coalesce(pp.vltot_ped_item,0) as vltot_ped_item,'
        
          '(coalesce(pp.vltot_ped_item, 0) - coalesce(pp.rateio_desc, 0) + ' +
          'coalesce(pp.rateio_acresc, 0)) vltotliq_ped_item,'
        'coalesce(pp.rateio_desc,0) as rateio_desc,'
        'coalesce(pp.rateio_acresc,0) as rateio_acresc,'
        'coalesce(pp.pcust_mc,0) as pcust_mc,'
        'pp.descr_prod_ped,'
        
          'round((pp.rateio_desc / pp.vltot_ped_item) * 100, 2) perc_desc_i' +
          'tem,'
        'comissao.icodigo_regra,'
        'comissao.idescricao_regra,'
        'comissao.itipo_regra,'
        'comissao.ipercentual_regra,'
        'comissao.ivalor_comissao as comiss_prod,'
        '0 as comiss_prod_ger,'
        'comissao.ipercentual_desc as perc_desc,'
        'comissao.ipercentual_regra as perc_comiss,'
        'coalesce(pp.n_nf,0) as n_nf,'
        'tv.descricao,tv.sigla,tv.tipo_os,c.nome_vendedor,c.cod_vendedor,'
        
          'pp.col_cod_vendedor,c.pc_vend_serv, c.PC_VEND_PROD,f.cod_funcao,' +
          'f.desc_funcao,tv.venda'
        'from  tipo_vendas tv'
        
          'inner join pedvenda v on v.tipo=tv.tipo and (v.tipv=tv.sigla or ' +
          '(v.tipo_os=tv.tipo_os))'
        
          'inner join pedvenda_prod pp on v.tipo=pp.tipo and v.nped=pp.nped' +
          ' and v.cod_empresa=pp.cod_empresa'
        
          'inner join produtos pr on pr.grupo_prod = pp.grupo_prod and pr.c' +
          'od_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa'
        'inner join grupos g on pp.grupo_prod=g.codigo_grup'
        
          'inner join colaborador c on pp.cod_vendedor=c.cod_vendedor and p' +
          'p.cod_empresa=c.cod_empresa'
        'inner join funcoes f on c.cod_funcao=f.cod_funcao'
        'left join retorna_comissao_faixadesc('
        '    pr.cod_comissao_faixa_desc,'
        '    pr.cod_empresa,'
        
          '    round(case when (coalesce(pp.vlun_orig, 0) * coalesce(pp.qua' +
          'nt_ped_item, 0) > (coalesce(pp.vltot_ped_item, 0) - coalesce(pp.' +
          'rateio_desc, 0) + coalesce(pp.rateio_acresc, 0))) then'
        
          '                   abs(1 - (((coalesce(pp.vltot_ped_item, 0) - c' +
          'oalesce(pp.rateio_desc, 0) + coalesce(pp.rateio_acresc, 0))) / (' +
          'coalesce(pp.vlun_orig, 0) * coalesce(pp.quant_ped_item, 0)))) * ' +
          '100'
        '               else'
        '                     0'
        '          end,'
        '    2),'
        
          '    coalesce(pp.vltot_ped_item, 0) - coalesce(pp.rateio_desc, 0)' +
          ' + coalesce(pp.rateio_acresc, 0)) comissao on 1 = 1'
        
          'where v.status_ped='#39'FECHADA'#39' and v.ativo=1 and (pp.status<>'#39'CANC' +
          'ELADO'#39' or (pp.status is null));'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PRODUTOS_PROMOCAO_ALT FOR PRODUTOS'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE RECALCULAR_PRECOS INTEGER;'
        '  DECLARE VARIABLE CASAS_DECIMAIS INTEGER;'
        'begin'
        '  /* Trigger text */'
        '  if (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        
          '  if (coalesce(old.PREC_TAB_PROD, 0) = coalesce(new.PREC_TAB_PRO' +
          'D, 0)) then'
        '    exit;'
        ''
        '  SELECT COALESCE(VALUE1_F, 0) FROM CONFIG_SISTEMA'
        '  WHERE CHAVE = '#39'prod_cad_recalcular_preco_diferenciado'#39
        '  AND COD_EMPRESA = new.COD_EMPRESA into :RECALCULAR_PRECOS;'
        ''
        '  if (COALESCE(RECALCULAR_PRECOS, 0) <= 0) then'
        '    exit;'
        ''
        
          '  SELECT CASAS_DECIMAIS FROM EMPRESA WHERE COD_EMPRESA = new.COD' +
          '_EMPRESA into :CASAS_DECIMAIS;'
        ''
        '  CASAS_DECIMAIS = COALESCE(CASAS_DECIMAIS, 0);'
        '  if (COALESCE(CASAS_DECIMAIS, 0) <= 0) then'
        '    CASAS_DECIMAIS = 2;'
        ''
        
          '  update PROMOCAO_PRODUTO set VALOR_PROMOCAO = round((PROPORCAO_' +
          'TABELA * new.PREC_TAB_PROD), :CASAS_DECIMAIS)'
        
          '  where GRUPO_PROD = new.GRUPO_PROD and COD_PROD = new.COD_PROD ' +
          'and new.COD_EMPRESA = new.COD_EMPRESA'
        '  and VALOR_PROMOCAO > 0 and PROPORCAO_TABELA > 0;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_EMPRESA_PROMOCAO_PROD_ALT FOR EMPRESA'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE RECALCULAR_PRECOS INTEGER;'
        'begin'
        '  /* Trigger text */'
        '  SELECT COALESCE(VALUE1_F, 0) FROM CONFIG_SISTEMA'
        '  WHERE CHAVE = '#39'prod_cad_recalcular_preco_diferenciado'#39
        '  AND COD_EMPRESA = new.COD_EMPRESA into :RECALCULAR_PRECOS;'
        ''
        '  if (COALESCE(RECALCULAR_PRECOS, 0) <= 0) then'
        '    exit;'
        ''
        '  update promocao_produto pp set pp.proporcao_tabela ='
        '    coalesce(valor_promocao, 0) /'
        '    coalesce((select coalesce(prec_tab_prod, 0) from produtos pr'
        '              where pr.grupo_prod = pp.grupo_prod'
        '              and pr.cod_prod = pp.cod_prod'
        '              and pr.cod_empresa = pp.cod_empresa), 0)'
        '  where (coalesce(pp.proporcao_tabela, 0) > 0)'
        '  and (coalesce(pp.valor_promocao, 0) > 0)'
        '  and (coalesce(pp.cod_tppreco, 0) > 1)'
        '  and (pp.cod_empresa = new.COD_EMPRESA);'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE DEVOLUCAO ADD VALOR_ORIG DOUBLE PRECISION;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VENDAPRODUTOS('
        '    COD_EMPRESA,'
        '    DATA_FECH,'
        '    NPED,'
        '    TIPO,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    COD_GRADE,'
        '    QUANT_PED_ITEM,'
        '    VLUN_ORIG,'
        '    VLUN_PED_ITEM,'
        '    VLTOT_PED_ITEM,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    DESCR_PROD_PED,'
        '    PCUST_MC,'
        '    COMISS_PROD,'
        '    COMISS_PROD_GER,'
        '    N_NF,'
        '    DESCRICAO_TIPV,'
        '    TIPV,'
        '    TIPO_OS,'
        '    DESCRICAO_GRUPO,'
        '    NOME_VENDEDOR,'
        '    NOME_PARTICIPANTE,'
        '    COD_VENDEDOR,'
        '    COD_PARTICIPANTE,'
        '    COL_COD_VENDEDOR,'
        '    COD_FUNCAO,'
        '    DESC_FUNCAO,'
        '    NITEM,'
        '    VENDA,'
        '    NOME_CLIENTEDAV,'
        '    DEV_NPED,'
        '    DEV_TIPO,'
        '    COD_CIDADE,'
        '    NOME_CIDADE)'
        'AS'
        'select v.cod_empresa,v.data_fech,'
        'pp.nped,pp.tipo, pp.grupo_prod,pp.cod_prod,pp.cod_grade,'
        'coalesce(pp.quant_ped_item,0) as quant_ped_item,'
        'coalesce(pp.vlun_orig, 0) as vlun_orig,'
        'coalesce(pp.vlun_ped_item,0) as vlun_ped_item,'
        'coalesce(pp.vltot_ped_item,0) as vltot_ped_item,'
        'coalesce(pp.rateio_desc,0) as rateio_desc,'
        'coalesce(pp.rateio_acresc,0) as rateio_acresc,'
        'pp.descr_prod_ped,'
        'coalesce(pp.pcust_mc,0) as pcust_mc,'
        'coalesce(pp.comiss_prod,0) as comiss_prod,'
        'coalesce(pp.comiss_prod_ger,0) as comiss_prod_ger,'
        'coalesce(pp.n_nf,0) as n_nf,'
        'tv.descricao,tv.sigla,tv.tipo_os, g.descricao,'
        
          'c.nome_vendedor, p.nome_participante,c.cod_vendedor, p.cod_parti' +
          'cipante, pp.col_cod_vendedor, f.cod_funcao,f.desc_funcao,'
        
          'pp.nitem,tv.venda,v.nome_clientedav,v.nped,v.tipo, cl.cod_cidade' +
          ', cd.nome_cidade from tipo_vendas tv'
        
          'inner join pedvenda v on v.tipo=tv.tipo and (v.tipv=tv.sigla or ' +
          '(v.tipo_os=tv.tipo_os))'
        
          'inner join pedvenda_prod pp on v.tipo=pp.tipo and v.nped=pp.nped' +
          ' and v.cod_empresa=pp.cod_empresa'
        'inner join grupos g on pp.grupo_prod=g.codigo_grup'
        
          'inner join colaborador c on pp.cod_vendedor=c.cod_vendedor and p' +
          'p.cod_empresa=c.cod_empresa'
        
          'left join participante p on pp.cod_vendedor1 = p.cod_participant' +
          'e and pp.cod_empresa = p.cod_empresa'
        'inner join funcoes f on c.cod_funcao=f.cod_funcao'
        
          'left join clientes cl on cl.cod_cliente = v.cod_cliente and cl.c' +
          'od_empresa = v.cod_cliente'
        'left join cidades cd on cd.cod_cidade = cl.cod_cidade'
        
          'where v.status_ped='#39'FECHADA'#39' and v.ativo=1 and (pp.status<>'#39'CANC' +
          'ELADO'#39' or (pp.status is null))'
        'union'
        'select d.cod_empresa,d.data,'
        'd.sequencia,'#39'DEV'#39' as tipo,d.grupo_prod,d.cod_prod,d.cod_grade,'
        'd.quant as quant_ped_item,'
        '((-1)*coalesce(d.valor_orig, 0)) as valor_orig,'
        '((-1)*coalesce(d.valor, 0)) as valor,'
        
          '((-1)*(coalesce(d.quant, 0)*coalesce(d.valor, 0))) as vltot_ped_' +
          'item,'
        '0 as rateio_desc,'
        '0 as rateio_acresc,'
        'substr(d.descricao,1,60) as descr_prod_ped,'
        '((-1)*coalesce(d.pcust_mc, 0)) as pcust_mc,'
        '((-1)*coalesce(d.comiss_prod, 0)),'
        '((-1)*coalesce(d.comiss_prod_ger, 0)),'
        'num_nota_nfe,'
        
          'case when tv.descricao is null then '#39'V - VAREJO          '#39' else ' +
          'tv.descricao end as descricao,'
        'case when tv.sigla is null then '#39'V'#39' else tv.sigla end as sigla,'
        'tv.tipo_os,g.descricao,c.nome_vendedor, null nome_participante,'
        
          'c.cod_vendedor, null cod_participante,c.cod_vendedor,f.cod_funca' +
          'o,f.desc_funcao,'
        
          'd.seqid,coalesce(tv.venda,'#39'S'#39'),d.nome_cliente,d.cod_venda,d.tipo' +
          '_venda, cl.cod_cidade, cd.nome_cidade'
        'from devolucao d'
        
          'inner join colaborador c on d.cod_vendedor = c.cod_vendedor and ' +
          'd.cod_empresa = c.cod_empresa'
        'inner join funcoes f on c.cod_funcao = f.cod_funcao'
        'inner join grupos g on d.grupo_prod = g.codigo_grup'
        
          'left join pedvenda v on d.tipo_venda = v.tipo and coalesce(d.cod' +
          '_venda,0) = v.nped and d.cod_empresa = v.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = d.cod_cliente and cl.c' +
          'od_empresa = d.cod_cliente'
        'left join cidades cd on cd.cod_cidade = cl.cod_cidade'
        
          'left join tipo_vendas tv on v.tipo = tv.tipo and (v.tipv=tv.sigl' +
          'a or (v.tipo_os=tv.tipo_os));'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE MARCA_PROD_EC ('
        '    COD_MARCA       INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    ID_COMMERCE     INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE MARCA_PROD_EC ADD CONSTRAINT PK_MARCA_PROD_EC PRIMAR' +
          'Y KEY (COD_MARCA, COD_EMPRESA);'
        
          'ALTER TABLE MARCA_PROD_EC ADD CONSTRAINT FK_MARCA_PROD_EC_MARCA_' +
          'PROD FOREIGN KEY (COD_MARCA) REFERENCES MARCA_PROD (COD_MARCA) O' +
          'N DELETE CASCADE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_MARCA_PROD FOR MARCA_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        '  if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_MARCA_PROD, 1) FROM RDB' +
          '$DATABASE); '
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE MARCA_PROD DROP ID_COMMERCE;'
        'CREATE SEQUENCE INC_COD_MARCA_SEQID;'
        'ALTER TABLE MARCA_PROD ADD SEQID INTEGER;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_MARCA_PROD_SEQID FOR MARCA_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  IF (coalesce(NEW.SEQID, 0) = 0) THEN'
        '    NEW.SEQID = GEN_ID(INC_COD_MARCA_SEQID,1);'
        'end;'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE SUG_OS ADD FOREIGN KEY (COD_EQUIP, COD_EMPRESA) REFE' +
          'RENCES EQUIPAMENTO (COD_EQUIP, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE SUG_OS ADD FOREIGN KEY (COD_EQUIP, COD_EMPRESA) REFE' +
          'RENCES EQUIPAMENTO (COD_EQUIP, COD_EMPRESA) ON DELETE CASCADE;'
        
          'ALTER TABLE SUG_OS ADD FOREIGN KEY (PLACA, CHASSI, COD_VEIC, COD' +
          '_EMPRESA) REFERENCES VEICULOS (PLACA, CHASSI, CODIGO, COD_EMPRES' +
          'A) ON UPDATE CASCADE;'
        
          'ALTER TABLE SUG_OS ADD FOREIGN KEY (PLACA, CHASSI, COD_VEIC, COD' +
          '_EMPRESA) REFERENCES VEICULOS (PLACA, CHASSI, CODIGO, COD_EMPRES' +
          'A) ON DELETE CASCADE;'
        'ALTER TABLE PRECO_PRODUTOS_QTDE ADD PORCENTAGEM T_VL_TODOS;'
        'ALTER TABLE PRECO_PRODUTOS_QTDE ADD PROPORCAO_TABELA T_N_GERAL;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PRECO_QTDE_PROPORC_PREC FOR PRECO_PRO' +
          'DUTOS_QTDE'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  declare variable vprec_tab_prod t_vl_todos;'
        'begin'
        
          '  if ((coalesce(new.proporcao_tabela, 0) = 0) and (coalesce(new.' +
          'preco_venda, 0) > 0)) then'
        '  begin'
        
          '    select prec_tab_prod from produtos where new.grupo_prod = gr' +
          'upo_prod and new.cod_prod = cod_prod and new.cod_empresa = cod_e' +
          'mpresa'
        '      into :vprec_tab_prod;'
        ''
        '    if (coalesce(vprec_tab_prod, 0) > 0) then'
        '      new.proporcao_tabela = new.preco_venda / vprec_tab_prod;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PRODUTOS_PRECO_QTDE_ALT FOR PRODUTOS'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE RECALCULAR_PRECOS INTEGER;'
        '  DECLARE VARIABLE CASAS_DECIMAIS INTEGER;'
        'begin'
        '  /* Trigger text */'
        '  if (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        
          '  if (coalesce(old.PREC_TAB_PROD, 0) = coalesce(new.PREC_TAB_PRO' +
          'D, 0)) then'
        '    exit;'
        ''
        '  SELECT COALESCE(VALUE1_F, 0) FROM CONFIG_SISTEMA'
        '  WHERE CHAVE = '#39'prod_cad_recalcular_preco_por_quantidade'#39
        '  AND COD_EMPRESA = new.COD_EMPRESA into :RECALCULAR_PRECOS;'
        ''
        '  if (COALESCE(RECALCULAR_PRECOS, 0) <= 0) then'
        '    exit;'
        ''
        
          '  SELECT CASAS_DECIMAIS FROM EMPRESA WHERE COD_EMPRESA = new.COD' +
          '_EMPRESA into :CASAS_DECIMAIS;'
        ''
        '  CASAS_DECIMAIS = COALESCE(CASAS_DECIMAIS, 0);'
        '  if (COALESCE(CASAS_DECIMAIS, 0) <= 0) then'
        '    CASAS_DECIMAIS = 2;'
        ''
        
          '  update PRECO_PRODUTOS_QTDE set PRECO_VENDA = round((PROPORCAO_' +
          'TABELA * new.PREC_TAB_PROD), :CASAS_DECIMAIS)'
        
          '  where GRUPO_PROD = new.GRUPO_PROD and COD_PROD = new.COD_PROD ' +
          'and new.COD_EMPRESA = new.COD_EMPRESA'
        '  and PRECO_VENDA > 0 and PROPORCAO_TABELA > 0;'
        'end;'
        '|/BLOCO|'
        ''
        
          'update preco_produtos_qtde set proporcao_tabela = proporcao_tabe' +
          'la where coalesce(proporcao_tabela, 0) = 0;'
        ''
        '|BLOCO|'
        'CREATE TABLE SUGESTAOCOMPRAIT2 ('
        '    SEQID           INTEGER NOT NULL,'
        '    COD_SUGESTAO    INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    COD_EMP_MULT    INTEGER NOT NULL,'
        '    GRUPO_PROD      INTEGER NOT NULL,'
        '    COD_PROD        CHAR(6) NOT NULL,'
        '    COD_GRADE       INTEGER DEFAULT 0 NOT NULL,'
        
          '    SUGESTAOCOMPRA  T_D_QUANT /* T_D_QUANT = DOUBLE PRECISION DE' +
          'FAULT 00000.00 */,'
        
          '    ESTOQUE_ATUAL   T_D_QUANT /* T_D_QUANT = DOUBLE PRECISION DE' +
          'FAULT 00000.00 */,'
        
          '    QTD_PEND        T_D_QUANT /* T_D_QUANT = DOUBLE PRECISION DE' +
          'FAULT 00000.00 */,'
        '    CLASSESPROD     VARCHAR(32),'
        
          '    MEDIAMES        T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DE' +
          'FAULT 000.00 */,'
        '    ATIVO           SMALLINT DEFAULT 1    '
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE SUGESTAOCOMPRAIT2 ADD CONSTRAINT PK_SUGESTAOCOMPRAIT' +
          '2 PRIMARY KEY (SEQID, COD_SUGESTAO, COD_EMPRESA, COD_EMP_MULT, G' +
          'RUPO_PROD, COD_PROD, COD_GRADE);'
        
          'ALTER TABLE SUGESTAOCOMPRAIT2 ADD CONSTRAINT FK_SUGESTAOCOMPRAIT' +
          '2_1 FOREIGN KEY (COD_SUGESTAO, COD_EMPRESA) REFERENCES SUGESTAOC' +
          'OMPRA (COD_SUGESTAO, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CA' +
          'SCADE;'
        
          'ALTER TABLE SUGESTAOCOMPRAIT2 ADD CONSTRAINT FK_SUGESTAOCOMPRAIT' +
          '2_2 FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMP_MULT) REFERENCES ' +
          'PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCADE O' +
          'N UPDATE CASCADE;'
        
          'CREATE INDEX IDX_SUGESTAOCOMPRAIT2_PROD ON SUGESTAOCOMPRAIT2 (CO' +
          'D_SUGESTAO, COD_EMPRESA, GRUPO_PROD, COD_PROD);'
        ''
        '|BLOCO|'
        'CREATE TABLE LISTA_COTACAO_ITENS2 ('
        '    COD_LISTA     INTEGER NOT NULL,'
        '    GRUPO_PROD    INTEGER NOT NULL,'
        '    COD_PROD      CHAR(6) NOT NULL,'
        '    COD_GRADE     INTEGER DEFAULT 0 NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    COD_EMP_MULT  INTEGER NOT NULL,'
        '    NUM_FAB_PROD  CHAR(20),'
        '    DESCR_PROD    VARCHAR(75),'
        
          '    QUANT_PROD    T_D_QUANT /* T_D_QUANT = DOUBLE PRECISION DEFA' +
          'ULT 00000.00 */,'
        '    NUM_PED       INTEGER,'
        '    COD_COTACAO   INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE LISTA_COTACAO_ITENS2 ADD CONSTRAINT PK_LISTA_COTACAO' +
          '_ITENS2 PRIMARY KEY (COD_LISTA, GRUPO_PROD, COD_PROD, COD_GRADE,' +
          ' COD_EMPRESA, COD_EMP_MULT);'
        
          'ALTER TABLE LISTA_COTACAO_ITENS2 ADD CONSTRAINT FK_LISTA_COTACAO' +
          'I_LCOTACAO2 FOREIGN KEY (COD_LISTA, COD_EMPRESA) REFERENCES LIST' +
          'A_COTACAO (COD_LISTA, COD_EMPRESA) ON DELETE CASCADE ON UPDATE C' +
          'ASCADE;'
        
          'ALTER TABLE LISTA_COTACAO_ITENS2 ADD CONSTRAINT FK_LISTA_COTACAO' +
          '_ITENS2_PRODUTO FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMP_MULT)' +
          ' REFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELE' +
          'TE CASCADE ON UPDATE CASCADE;'
        
          'CREATE INDEX NCUST_PROD2 ON CUSTOS (GRUPO_PROD, COD_PROD, COD_EM' +
          'PRESA);'
        
          'CREATE INDEX NCUST_PROD_DT ON CUSTOS (GRUPO_PROD, COD_PROD, COD_' +
          'EMPRESA, FORNEC, DATA);'
        'ALTER TABLE ITEM_PEDIDO DROP CONSTRAINT PK_ITEM_PEDIDO;'
        
          'ALTER TABLE ITEM_PEDIDO ADD CONSTRAINT PK_ITEM_PEDIDO PRIMARY KE' +
          'Y (NUM_PED, GRUPO_PROD, COD_PROD, NITEM, COD_EMPRESA, COD_GRADE)' +
          ';'
        'ALTER TABLE ITEM_PEDIDO ADD COD_SUGESTAO INTEGER;'
        'ALTER TABLE ITEM_PEDIDO ADD COD_EMP_MULT INTEGER;'
        
          'CREATE INDEX IDX_ITEM_PEDIDO_EMP ON ITEM_PEDIDO (GRUPO_PROD, COD' +
          '_PROD, COD_EMPRESA, COD_GRADE, COD_SUGESTAO, COD_EMP_MULT);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'SUG028'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR GERAR PEDIDO COMPRA COM PRODUTOS UTILIZ'#39', 10, '#39'S'#39', '#39'FRMSU' +
          'GESTAOCOMPRA'#39', 1, '#39'N'#39', NULL);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'SUG029'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR GERAR TRANSF COM PRODUTOS UTILIZ'#39', 10, '#39'S'#39', '#39'FRMSUGESTAOC' +
          'OMPRA'#39', 1, '#39'N'#39', NULL);'
        
          'CMD:REPL|CMD:INATIVO|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO,' +
          ' COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM' +
          ', ATIVO, GRAVAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'SUG022'#39', :COD_' +
          'EMPRESA, '#39'BT EXCLUIR SUGESTAO DE COMPRA'#39', 10, '#39'S'#39', '#39'FRMSUGESTAOC' +
          'OMPRA'#39', 1, '#39'N'#39', NULL);'
        'CMD:REPL|CMD:INATIVO|CARACTERES INVALIDOS'
        'CMD:REPL|CMD:INATIVO|CARACTERES INVALIDOS'
        ''
        '|BLOCO|'
        'CREATE TABLE SUGESTAOCOMPRA_EMP ('
        '    COD_SUGESTAO  INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    COD_EMP_MULT  INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE SUGESTAOCOMPRA_EMP ADD CONSTRAINT PK_SUGESTAOCOMPRA_' +
          'EMP PRIMARY KEY (COD_SUGESTAO, COD_EMPRESA, COD_EMP_MULT);'
        ''
        '|BLOCO|'
        'CREATE TABLE SUGESTAOCOMPRA_TRANSF ('
        '    COD_SUGESTAO   INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    COD_EMP_MULT   INTEGER NOT NULL,'
        '    GRUPO_PROD     INTEGER NOT NULL,'
        '    COD_PROD       CHAR(6) NOT NULL,'
        '    COD_GRADE      INTEGER NOT NULL,'
        '    COD_EMP_ORIG   INTEGER NOT NULL,'
        #9'ESTOQUE_ATUAL  T_D_QUANT,'
        
          '    QTDE_TRANSF    T_D_QUANT /* T_D_QUANT = DOUBLE PRECISION DEF' +
          'AULT 00000.00 */'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE SUGESTAOCOMPRA_TRANSF ADD CONSTRAINT PK_SUGESTAOCOMP' +
          'RA_TRANSF PRIMARY KEY (COD_SUGESTAO, COD_EMPRESA, COD_EMP_MULT, ' +
          'GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMP_ORIG);'
        
          'ALTER TABLE SUGESTAOCOMPRA_TRANSF ADD CONSTRAINT FK_SUGESTAOCOMP' +
          'RA_TRANSF_SUG FOREIGN KEY (COD_SUGESTAO,COD_EMPRESA) REFERENCES ' +
          'SUGESTAOCOMPRA(COD_SUGESTAO,COD_EMPRESA) ON DELETE CASCADE;'
        
          'ALTER TABLE SUGESTAOCOMPRA_TRANSF ADD CONSTRAINT FK_SUGESTAOCOMP' +
          'RA_TRANSF_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMP_ORIG) ' +
          'REFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELET' +
          'E CASCADE ON UPDATE CASCADE;'
        
          'CREATE INDEX FK_DEVOLUCAO_PRODUTOS_DT ON DEVOLUCAO (GRUPO_PROD, ' +
          'COD_PROD, COD_EMPRESA, DATA);'
        ''
        '|BLOCO|'
        'create or alter procedure GETQTDEITENSDEVOLVIDOS ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_GRADE integer,'
        '    PCOD_EMPRESA varchar(50),'
        '    PDATA timestamp)'
        'returns ('
        '    VALORDEVOLVIDO double precision,'
        '    QTDEITEMDEVOLVIDO double precision)'
        'as'
        'begin'
        '  execute statement'
        
          '   '#39'select sum(coalesce(quant, 0) * coalesce(valor, 0)) as SomaV' +
          'alorDevolvido,'
        '    sum(coalesce(quant, 0)) as qtdItemDevolvido from devolucao'
        '    where grupo_prod = '#39'||:pgrupo_prod||'#39
        '    and cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        '    and cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        '    and data >= '#39#39#39'||:pdata||'#39#39#39
        '    and ativo = 1 '#39' ||'
        '    iif(:pcod_grade > 0, '#39' and cod_grade = '#39'|| :pcod_grade, '#39#39')'
        '    into :valordevolvido, :qtdeitemdevolvido;'
        ''
        '  valordevolvido    = coalesce(valordevolvido, 0);'
        '  qtdeitemdevolvido = coalesce(qtdeitemdevolvido, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETQTDEITENSVENDA ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_GRADE integer,'
        '    PCOD_EMPRESA varchar(50),'
        '    PDATA timestamp,'
        '    PTIPOVENDAOS varchar(500),'
        '    PTIPOSVENDA varchar(500),'
        '    PTIPOSORIGEM varchar(500))'
        'returns ('
        '    QTDEITEMREQOS double precision)'
        'as'
        'begin'
        '  execute statement'
        
          '    '#39' select sum(ipv.quant_ped_item) as qtdItemREQOS from pedven' +
          'da pv'
        
          '      inner join pedvenda_prod ipv on ipv.nped = pv.nped and ipv' +
          '.tipo = pv.tipo and ipv.cod_empresa = pv.cod_empresa'
        '      and (ipv.status is null or status = '#39#39#39#39')'
        '      where ipv.grupo_prod = '#39'||:pgrupo_prod||'#39
        '      and ipv.cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        '      and pv.data_fech >= '#39#39#39'||:pdata||'#39#39#39
        '      and ((pv.tipo = '#39#39'REQ'#39#39') or (pv.tipo = '#39#39'OS'#39#39
        '      and pv.tipo_os in '#39'||:ptipovendaos||'#39'))'
        '      and pv.cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        '      and pv.ativo = 1 '#39'||'
        
          '      iif(trim(:ptiposVenda) <> '#39#39', '#39' and '#39'||:ptiposVenda, '#39#39') |' +
          '|'
        
          '      iif(trim(:ptiposorigem) <> '#39#39', '#39' and '#39'||:ptiposorigem, '#39#39')' +
          ' ||'
        
          '      iif(:pcod_grade > 0, '#39' and ipv.cod_grade = '#39'|| :pcod_grade' +
          ', '#39#39')'
        '      into :qtdeitemreqos;'
        ''
        '  qtdeitemreqos = coalesce(qtdeitemreqos, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETQTDEITENSVENDAPERDIDA ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_GRADE integer,'
        '    PCOD_EMPRESA varchar(50),'
        '    PDATA timestamp)'
        'returns ('
        '    QTDEITEMVNDPERD double precision)'
        'as'
        'begin'
        '  execute statement'
        
          '   '#39'select sum(coalesce(vnp.quant_prod_vp, 0)) as qtdItemVndPerd' +
          ' from venda_perdida vnp'
        
          '   inner join tipovp tp on vnp.codigo_vp = tp.codigo_vp and vnp.' +
          'cod_empresa = tp.cod_empresa'
        '   where vnp.grupo_prod = '#39'||:pgrupo_prod||'#39
        '   and vnp.cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        '   and vnp.data_vnp >= '#39#39#39'||:pdata||'#39#39#39
        '   and tp.ent_sug_vp = '#39#39'S'#39#39
        '   and vnp.cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        '   and vnp.ativo = 1 '#39
        '   into: qtdeitemvndperd;'
        ''
        '  qtdeitemvndperd = coalesce(qtdeitemvndperd, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETQTDEITENSPEDIDO ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_GRADE integer,'
        '    PCOD_EMPRESA varchar(50))'
        'returns ('
        '    QTDEITEMPEDIDO double precision)'
        'as'
        'begin'
        '  execute statement'
        '    '#39' select sum(coalesce(it.quant_it_prod, 0)) as qtdItemPedido'
        '      from item_pedido it'
        
          '      inner join pedido pd on it.num_ped = pd.num_ped and it.cod' +
          '_empresa = pd.cod_empresa'
        '      where it.grupo_prod = '#39'||:pgrupo_prod||'#39
        '      and it.cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        '      and it.cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        '      and pd.status_ped  = '#39#39'EFETIVADO'#39#39
        '      and pd.ativo = 1'
        '      and coalesce(it.recebido, '#39#39'N'#39#39') = '#39#39'N'#39#39' '#39'||'
        
          '      iif(:pcod_grade > 0, '#39' and it.cod_grade = '#39'|| :pcod_grade,' +
          ' '#39#39')'
        '      into: qtdeitempedido;'
        ''
        '  qtdeitempedido = coalesce(qtdeitempedido, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETQTDEITENSPEDIDOREC ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_GRADE integer,'
        '    PCOD_EMPRESA varchar(50))'
        'returns ('
        '    QTDEITEMPEDIDOREC double precision)'
        'as'
        'begin'
        '  execute statement'
        
          '    '#39' select sum(distinct(coalesce(ir.qtde_recebida,0))) qtdeRec' +
          'ebida'
        '      from item_pedido it'
        
          '      inner join pedido pd on it.num_ped = pd.num_ped and it.cod' +
          '_empresa = pd.cod_empresa'
        '      left join item_pedido_nf_rec ir on ir.num_ped = it.num_ped'
        
          '      and ir.grupo_prod = it.grupo_prod and ir.cod_prod = it.cod' +
          '_prod'
        
          '      and ir.cod_empresa = it.cod_empresa and ir.nitem = it.nite' +
          'm'
        '      where it.grupo_prod = '#39'||:pgrupo_prod||'#39
        '      and it.cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        '      and pd.status_ped  = '#39#39'EFETIVADO'#39#39
        '      and pd.cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        '      and pd.ativo = 1'
        '      and coalesce(it.recebido, '#39#39'N'#39#39') = '#39#39'N'#39#39' '#39' ||'
        
          '      iif(:pcod_grade > 0, '#39' and it.cod_grade = '#39'|| :pcod_grade,' +
          ' '#39#39')'
        '      into qtdeitempedidorec;'
        ''
        '  qtdeitempedidorec = coalesce(qtdeitempedidorec, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETPRODUTOSSIMILAR ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_EMPRESA varchar(6))'
        'returns ('
        '    EXISTESIMILAR integer)'
        'as'
        'begin'
        '  execute statement'
        '   '#39'select first 1 ps.grupo_ps from prod_similares ps'
        
          '    inner join produtos p on ps.cod_ps = p.cod_prod and ps.grupo' +
          '_ps = p.grupo_prod and p.cod_empresa = ps.cod_empresa'
        '    where ps.cod_prod = '#39'||:pcod_prod||'#39
        '    and ps.grupo_prod = '#39#39#39'||:pgrupo_prod||'#39#39#39
        '    and p.cod_empresa in ('#39#39#39'||pcod_empresa||'#39#39#39')'
        '    and ps.ativo = 1'
        '    and p.ativo = 1'
        
          '    and (select estoque from getestoquedisponivel(ps.grupo_ps, p' +
          's.cod_ps, 0, ps.cod_empresa, 0, '#39#39#39#39', 0, 0)) > 0 '#39
        '    into :existesimilar;'
        ''
        '  existesimilar = iif(coalesce(existesimilar, 0) > 0, 1, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETPRODUTOSSIMILARGRUPO ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_EMPRESA varchar(50))'
        'returns ('
        '    EXISTESIMILAR integer)'
        'as'
        'begin'
        '  execute statement'
        
          '   '#39'select first 1 ps.grupo_prod from prod_similares_grupos_iten' +
          's ps'
        
          '    inner join produtos p on ps.grupo_prod = p.grupo_prod and ps' +
          '.cod_prod = p.cod_prod and ps.cod_empresa = p.cod_empresa'
        '    where ps.cod_grupo_sim in'
        
          '      (select first 1 distinct ps1.cod_grupo_sim from prod_simil' +
          'ares_grupos_itens ps1'
        
          '       inner join prod_similares_grupos pp on pp.cod_grupo_sim =' +
          ' ps1.cod_grupo_sim and pp.cod_empresa = ps1.cod_empresa'
        
          '       inner join produtos p on ps1.grupo_prod = p.grupo_prod an' +
          'd ps1.cod_prod = p.cod_prod and ps1.cod_empresa = p.cod_empresa'
        '       where ps1.grupo_prod = '#39'||:pgrupo_prod||'#39
        '       and ps1.cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        '       and ps1.cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        '       and pp.ativo = 1'
        '       and p.ativo = 1)'
        '    and ps.cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        
          '    and not(ps.grupo_prod = '#39'||:pgrupo_prod||'#39' and ps.cod_prod =' +
          ' '#39#39#39'||:pcod_prod||'#39#39#39')'
        
          '    and (select estoque from getestoquedisponivel(ps.grupo_prod,' +
          ' ps.cod_prod, 0, ps.cod_empresa, 0, '#39#39#39#39', 0, 0)) > 0'#39
        '    into :existesimilar;'
        ''
        '  existesimilar = iif(coalesce(existesimilar, 0) > 0, 1, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETPRODUTOSSIMILARGRUPOENTRESI ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_EMPRESA varchar(50))'
        'returns ('
        '    EXISTESIMILAR integer)'
        'as'
        'begin'
        '  execute statement'
        
          '   '#39'select first 1 ps.grupo_prod from prod_similares_grupos_iten' +
          's ps'
        
          '    inner join produtos p on ps.grupo_prod = p.grupo_prod and ps' +
          '.cod_prod = p.cod_prod and ps.cod_empresa = p.cod_empresa'
        '    where ps.cod_grupo_sim in'
        
          '      (select first 1 distinct ps1.cod_grupo_sim from prod_simil' +
          'ares_grupos_itens ps1'
        
          '       inner join prod_similares_grupos pp on pp.cod_grupo_sim =' +
          ' ps1.cod_grupo_sim and pp.cod_empresa = ps1.cod_empresa'
        
          '       inner join produtos p on ps1.grupo_prod = p.grupo_prod an' +
          'd ps1.cod_prod = p.cod_prod and ps1.cod_empresa = p.cod_empresa'
        '       where ps1.grupo_prod = '#39'||:pgrupo_prod||'#39
        '       and ps1.cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        '       and ps1.cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        '       and ps1.principal = '#39#39'S'#39#39
        '       and pp.ativo = 1'
        '       and p.ativo = 1)'
        '    and ps.cod_empresa in ('#39#39#39'||:pcod_empresa||'#39#39#39')'
        
          '    and not(ps.grupo_prod = '#39'||:pgrupo_prod||'#39' and ps.cod_prod =' +
          ' '#39#39#39'||:pcod_prod||'#39#39#39')'
        
          '    and (select estoque from getestoquedisponivel(ps.grupo_prod,' +
          ' ps.cod_prod, 0, ps.cod_empresa, 0, '#39#39#39#39', 0, 0)) > 0'#39
        '    into :existesimilar;'
        ''
        '  existesimilar = iif(coalesce(existesimilar, 0) > 0, 1, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VENDASMESES4('
        '    TIPO,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    COD_GRADE,'
        '    VMES,'
        '    VANO,'
        '    VQT,'
        '    VTOT_VENDA,'
        '    DATA_OS_RQ,'
        '    NDOC,'
        '    COD_CLIENTE,'
        '    COD_PPS,'
        '    SUB_G_PROD,'
        '    TIP_PROD_IND,'
        '    DESCONTO,'
        '    CUSTOMC,'
        '    CUSTOMR,'
        '    ATIVO,'
        '    COD_EMPRESA,'
        '    NITEM,'
        '    TIPV)'
        'AS'
        'select p.tipo,pp.grupo_prod,pp.cod_prod,pp.cod_grade,'
        'extract(month from p.data_fech),extract(year from p.data_fech),'
        
          'pp.quant_ped_item,pp.vltot_ped_item,p.data_fech,p.nped,p.cod_cli' +
          'ente,'
        'pr.cod_pps, pr.sub_g_prod,pr.tip_prod_ind,pp.rateio_desc,'
        
          '(pp.quant_ped_item * pp.pcust_mc),(pp.quant_ped_item * pp.pcust_' +
          'mr),pp.ATIVO,p.COD_EMPRESA,pp.nitem,p.tipv'
        
          'from pedvenda p,pedvenda_prod pp,produtos pr where pp.nped = p.n' +
          'ped and pp.cod_empresa = p.cod_empresa and pp.tipo = p.tipo'
        
          'and (pp.status is null or pp.status = '#39#39') and pp.grupo_prod = pr' +
          '.grupo_prod and pp.cod_prod = pr.cod_prod and pp.cod_empresa = p' +
          'r.cod_empresa'
        
          'and ((p.tipo = '#39'OS'#39' and (select retorno from sp_retorno_tipo_ven' +
          'da(p.tipo, p.tipo_os)) = '#39'S'#39') or'
        
          '(p.tipo = '#39'REQ'#39' and (select retorno from sp_retorno_tipo_venda(p' +
          '.tipo, p.tipv)) = '#39'S'#39'))'
        'and (p.status_ped <> '#39#39' or not p.status_ped is null)'
        'and p.ativo = 1 order by 2,3;'
        '|/BLOCO|'
        ''
        'ALTER TABLE PEDVENDA_PROD ADD COD_SUGESTAO INTEGER;'
        'ALTER TABLE PEDVENDA_PROD ADD COD_EMP_SUGESTAO INTEGER;'
        
          'CREATE INDEX IDX_PEDVENDA_PROD_TRANSF ON PEDVENDA_PROD (GRUPO_PR' +
          'OD, COD_PROD, COD_EMPRESA, COD_GRADE, COD_SUGESTAO, COD_EMP_SUGE' +
          'STAO, STATUS);'
        'ALTER TABLE SUGESTAOCOMPRAIT ADD QTD_TRANSF T_D_QUANT;'
        'ALTER TABLE SUGESTAOCOMPRAIT2 ADD QTD_TRANSF T_D_QUANT;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW SUGESTAOCOMPRAITENS('
        '    COD_SUGESTAO,'
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    COD_GRADE,'
        '    QTD_TRANSF,'
        '    SUGESTAOCOMPRA,'
        '    ESTOQUE_ATUAL,'
        '    QTD_PEND,'
        '    CLASSESPROD,'
        '    MEDIAMES,'
        '    ATIVO)'
        'AS'
        'select COD_SUGESTAO, COD_EMPRESA, COD_EMPRESA AS COD_EMP_MULT,'
        'GRUPO_PROD, COD_PROD, COD_GRADE,'
        
          'QTD_TRANSF, SUGESTAOCOMPRA, ESTOQUE_ATUAL, QTD_PEND, CLASSESPROD' +
          ', MEDIAMES, ATIVO from SUGESTAOCOMPRAIT'
        'UNION ALL'
        'select COD_SUGESTAO, COD_EMPRESA, COD_EMP_MULT,'
        'GRUPO_PROD, COD_PROD, COD_GRADE,'
        
          'QTD_TRANSF, SUGESTAOCOMPRA, ESTOQUE_ATUAL, QTD_PEND, CLASSESPROD' +
          ', MEDIAMES, ATIVO from SUGESTAOCOMPRAIT2;'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE SUGESTAOCOMPRA ADD EXIBIR_TRANSF CHAR(1) DEFAULT '#39'N'#39 +
          ';'
        'CMD:REPL|UPDATE SUGESTAOCOMPRA SET EXIBIR_TRANSF = '#39'N'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO428'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR PRECO EM VALOR FIXO'#39', 3, '#39'FRMALTERACAODEPRECO'#39', 1, '#39'N'#39', '#39'S' +
          #39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE TIPO_SERVICO_EMPRESA ('
        '    COD_SERVICO  INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE TIPO_SERVICO_EMPRESA ADD CONSTRAINT PK_TIPO_SERVICO_' +
          'EMPRESA PRIMARY KEY (COD_SERVICO, COD_EMPRESA);'
        
          'ALTER TABLE TIPO_SERVICO_EMPRESA ADD CONSTRAINT FK_TIPO_SERVICO_' +
          'EMPRESA_TP_SERV FOREIGN KEY (COD_SERVICO) REFERENCES TIPO_SERVIC' +
          'O (COD_SERVICO) ON DELETE CASCADE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'create or alter procedure SP_SERV_EMPRESAS'
        'returns ('
        '    RESULT varchar(4))'
        'as'
        'declare variable VCOD_SERVICO integer;'
        'declare variable VCOD_EMPRESA integer;'
        'declare variable VEXISTE integer;'
        'begin'
        '  RESULT = '#39'ERRO'#39';'
        '  /* Procedure Text */'
        
          '  for select cod_servico, cod_empresa from tipo_servico into :VC' +
          'OD_SERVICO, :VCOD_EMPRESA do'
        '  begin'
        '    if (coalesce(VCOD_EMPRESA, 0) > 0) then'
        '    begin'
        
          '        UPDATE OR INSERT INTO TIPO_SERVICO_EMPRESA (COD_SERVICO,' +
          ' COD_EMPRESA)'
        '        VALUES (:VCOD_SERVICO, :VCOD_EMPRESA)'
        '        MATCHING (COD_SERVICO, COD_EMPRESA);'
        ''
        '        UPDATE TIPO_SERVICO SET COD_EMPRESA = NULL'
        '        WHERE COD_SERVICO = :VCOD_SERVICO;'
        '        RESULT = '#39'OK'#39';'
        '    end'
        '    else'
        '    begin'
        '        SELECT COUNT(*) FROM TIPO_SERVICO_EMPRESA'
        '        WHERE COD_SERVICO = :VCOD_SERVICO into :VEXISTE;'
        ''
        '        if (coalesce(VEXISTE, 0) <= 0) then'
        '        begin'
        
          '            for select cod_empresa from empresa into :VCOD_EMPRE' +
          'SA do'
        '            begin'
        
          '                UPDATE OR INSERT INTO TIPO_SERVICO_EMPRESA (COD_' +
          'SERVICO, COD_EMPRESA)'
        '                VALUES (:VCOD_SERVICO, :VCOD_EMPRESA)'
        '                MATCHING (COD_SERVICO, COD_EMPRESA);'
        '                RESULT = '#39'OK'#39';'
        '            end'
        '        end'
        '    end'
        '  end'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        'EXECUTE PROCEDURE SP_SERV_EMPRESAS;'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$COLLATION_ID = 0 ' +
          'where RDB$FIELD_NAME = (select rdb$field_source from rdb$relatio' +
          'n_fields where rdb$relation_name = '#39'TIPOVP'#39' and rdb$field_name =' +
          ' '#39'DESCRICAO_VP'#39');'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF ('
        '    ID                INTEGER NOT NULL,'
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    DESCRICAO         VARCHAR(64),'
        '    ATIVO             SMALLINT DEFAULT 1,'
        '    DATA_CADASTRO     TIMESTAMP,'
        '    DATA_MODIFICACAO  TIMESTAMP,'
        '    COD_INF           INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF ADD CONSTRAINT PK_OPF PRIMARY KEY (ID, COD_EMPRE' +
          'SA);'
        
          'ALTER TABLE OPF ADD CONSTRAINT FK_OPF_INF_COMPL FOREIGN KEY (COD' +
          '_INF, COD_EMPRESA) REFERENCES SPED_INFORMACAO_COMPLEMENTAR (COD_' +
          'INF, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_ICMS ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    TRIBUTACAO   SMALLINT NOT NULL,'
        '    MOTDESICM    SMALLINT,'
        '    CONF_CALC    BLOB SUB_TYPE 1 SEGMENT SIZE 128,'
        '    ATIVO        SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_ICMS ADD CONSTRAINT PK_OPF_ICMS PRIMARY KEY (ID,' +
          ' COD_EMPRESA);'
        
          'ALTER TABLE OPF_ICMS ADD CONSTRAINT FK_OPF_ICMS FOREIGN KEY (OPF' +
          '_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EMPRESA) ON DELETE CAS' +
          'CADE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_ICMS_DEST ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ICMS_ID  INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    IDDEST       CHAR(1) NOT NULL,'
        '    CFOP         SMALLINT NOT NULL,'
        '    ATIVO        SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_ICMS_DEST ADD CONSTRAINT PK_OPF_ICMS_DEST PRIMAR' +
          'Y KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_ICMS_DEST ADD CONSTRAINT FK_OPF_ICMS_DEST FOREIG' +
          'N KEY (OPF_ICMS_ID, COD_EMPRESA) REFERENCES OPF_ICMS (ID, COD_EM' +
          'PRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_ICMS_DEST ON OPF_ICMS_DEST (OPF_ICMS' +
          '_ID, COD_EMPRESA, CFOP);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_ICMS_DEST_PARAMS ('
        '    ID                INTEGER NOT NULL,'
        '    OPF_ICMS_DEST_ID  INTEGER NOT NULL,'
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    ALIQ_ICMS         T_VL_TODOS NOT NULL,'
        '    ALIQ_FCP          T_VL_TODOS NOT NULL,'
        '    ALIQ_RED_BC       T_VL_TODOS NOT NULL,'
        '    ALIQ_ICMS_DIF     T_VL_TODOS NOT NULL,'
        '    ALIQ_FCP_DIF      T_VL_TODOS NOT NULL,'
        '    UFS               VARCHAR(128)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_ICMS_DEST_PARAMS ADD CONSTRAINT PK_OPF_ICMS_DEST' +
          '_PARAMS PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_ICMS_DEST_PARAMS ADD CONSTRAINT FK_OPF_ICMS_DEST' +
          '_PARAMS FOREIGN KEY (OPF_ICMS_DEST_ID, COD_EMPRESA) REFERENCES O' +
          'PF_ICMS_DEST (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCA' +
          'DE;'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_PC ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    CST          CHAR(2) NOT NULL,'
        '    MOTDESPC     SMALLINT,'
        '    ALIQ_PIS     T_VL_TODOS,'
        '    ALIQ_COFINS  T_VL_TODOS,'
        '    CONF_CALC    BLOB SUB_TYPE 1 SEGMENT SIZE 128,'
        '    NAT_REC      CHAR(3),'
        '    ATIVO        SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_PC ADD CONSTRAINT PK_OPF_PC PRIMARY KEY (ID, COD' +
          '_EMPRESA);'
        
          'ALTER TABLE OPF_PC ADD CONSTRAINT FK_OPF_PF FOREIGN KEY (OPF_ID,' +
          ' COD_EMPRESA) REFERENCES OPF (ID, COD_EMPRESA) ON DELETE CASCADE' +
          ' ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_CIDADE ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    CIDADE_ID    INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_CIDADE ADD CONSTRAINT PK_OPF_ICMS_COND_CIDA' +
          'DE PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_CIDADE ADD CONSTRAINT FK_OPF_ICMS_COND_CIDA' +
          'DE FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EMP' +
          'RESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_CIDADE ON OPF_COND_CIDADE (OPF_' +
          'ID, COD_EMPRESA, CIDADE_ID);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_CONS_FINAL ('
        '    ID                INTEGER NOT NULL,'
        '    OPF_ID            INTEGER NOT NULL,'
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    CONSUMIDOR_FINAL  CHAR(1) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_CONS_FINAL ADD CONSTRAINT PK_OPF_COND_CONS_' +
          'FINAL PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_CONS_FINAL ADD CONSTRAINT FK_OPF_COND_CONS_' +
          'FINAL FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_' +
          'EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_CONS_FINAL ON OPF_COND_CONS_FIN' +
          'AL (OPF_ID, COD_EMPRESA, CONSUMIDOR_FINAL);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_CONTRIB ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    INDIEDEST    CHAR(1) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_CONTRIB ADD CONSTRAINT PK_OPF_COND_CONTRIB ' +
          'PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_CONTRIB ADD CONSTRAINT FK_OPF_COND_CONTRIB ' +
          'FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EMPRES' +
          'A) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_CONTRIB ON OPF_COND_CONTRIB (OP' +
          'F_ID, COD_EMPRESA, INDIEDEST);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_CST_ICMS ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    CST          CHAR(2) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_CST_ICMS ADD CONSTRAINT PK_OPF_COND_CST_ICM' +
          'S PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_CST_ICMS ADD CONSTRAINT FK_OPF_COND_CST_ICM' +
          'S FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EMPR' +
          'ESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_CST_ICMS ON OPF_COND_CST_ICMS (' +
          'OPF_ID, COD_EMPRESA, CST);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_CST_PC_ENT ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    CST          CHAR(2) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_CST_PC_ENT ADD CONSTRAINT PK_OPF_COND_CST_P' +
          'C_ENT PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_CST_PC_ENT ADD CONSTRAINT FK_OPF_COND_CST_P' +
          'C_ENT FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_' +
          'EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_CST_PC_ENT ON OPF_COND_CST_PC_E' +
          'NT (OPF_ID, COD_EMPRESA, CST);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_CST_PC_SAI ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    CST          CHAR(2) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_CST_PC_SAI ADD CONSTRAINT PK_OPF_COND_CST_P' +
          'C_SAI PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_CST_PC_SAI ADD CONSTRAINT FK_OPF_COND_CST_P' +
          'C_SAI FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_' +
          'EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_CST_PC_SAI ON OPF_COND_CST_PC_S' +
          'AI (OPF_ID, COD_EMPRESA, CST);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_FINALIDADE ('
        '    ID             INTEGER NOT NULL,'
        '    OPF_ID         INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    FINALIDADE_ID  INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_FINALIDADE ADD CONSTRAINT PK_OPF_COND_FINAL' +
          'IDADE PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_FINALIDADE ADD CONSTRAINT FK_OPF_COND_FINAL' +
          'IDADE FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_' +
          'EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_FINALIDADE ON OPF_COND_FINALIDA' +
          'DE (OPF_ID, COD_EMPRESA, FINALIDADE_ID);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_NCM ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    NCM_INI      VARCHAR(8) NOT NULL,'
        '    NCM_FIM      VARCHAR(8) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_NCM ADD CONSTRAINT PK_OPF_COND_NCM PRIMARY ' +
          'KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_NCM ADD CONSTRAINT FK_OPF_COND_NCM FOREIGN ' +
          'KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EMPRESA) ON DE' +
          'LETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_NCM ON OPF_COND_NCM (OPF_ID, CO' +
          'D_EMPRESA, NCM_INI, NCM_FIM);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_PESSOA ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    PESSOA       CHAR(2) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_PESSOA ADD CONSTRAINT PK_OPF_COND_PESSOA PR' +
          'IMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_PESSOA ADD CONSTRAINT FK_OPF_COND_PESSOA FO' +
          'REIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EMPRESA)' +
          ' ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_PESSOA ON OPF_COND_PESSOA (OPF_' +
          'ID, COD_EMPRESA, PESSOA);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_TIPO_ITEM ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    TIPO_ITEM    CHAR(2) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_TIPO_ITEM ADD CONSTRAINT PK_OPF_COND_TIPO_I' +
          'TEM PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_TIPO_ITEM ADD CONSTRAINT FK_OPF_COND_TIPO_I' +
          'TEM FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EM' +
          'PRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_TIPO_ITEM ON OPF_COND_TIPO_ITEM' +
          ' (OPF_ID, COD_EMPRESA, TIPO_ITEM);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_TIPO_NF ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    TIPO         SMALLINT NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_TIPO_NF ADD CONSTRAINT PK_OPF_COND_TIPO_NF ' +
          'PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_TIPO_NF ADD CONSTRAINT FK_OPF_COND_TIPO_NF ' +
          'FOREIGN KEY (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EMPRES' +
          'A) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_TIPO_NF ON OPF_COND_TIPO_NF (OP' +
          'F_ID, COD_EMPRESA, TIPO);'
        ''
        '|BLOCO|'
        'CREATE TABLE OPF_COND_UF ('
        '    ID           INTEGER NOT NULL,'
        '    OPF_ID       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    UFS          VARCHAR(128) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE OPF_COND_UF ADD CONSTRAINT PK_OPF_COND_UF PRIMARY KE' +
          'Y (ID, COD_EMPRESA);'
        
          'ALTER TABLE OPF_COND_UF ADD CONSTRAINT FK_OPF_COND_UF FOREIGN KE' +
          'Y (OPF_ID, COD_EMPRESA) REFERENCES OPF (ID, COD_EMPRESA) ON DELE' +
          'TE CASCADE ON UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_OPF_COND_UF ON OPF_COND_UF (OPF_ID, COD_' +
          'EMPRESA, UFS);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD TIPO_CALC SMALLINT;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD TIPO_CALC_PC SMALLINT;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD PDIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD VICMSDIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD PFCPDIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD VFCPDIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD VICMSOP_DIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD VFCPEFET_DIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PDIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VICMSDIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PFCPDIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VFCPDIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VICMSOP_DIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VFCPEFET_DIF T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD MOTDES_PC SMALLINT;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD VPISDESON T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD VCOFINSDESON T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD OPF_ICMS_ID INTEGER;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD OPF_PC_ID INTEGER;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD PICMSDESON T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD PPISDESON T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD PCOFINSDESON T_VL_TODOS;'
        
          'ALTER TABLE NOTAFISCAL_ITEM ADD CONSTRAINT FK_NOTAFISCAL_ITEM_OP' +
          'F_ICMS FOREIGN KEY (OPF_ICMS_ID, COD_EMPRESA) REFERENCES OPF (ID' +
          ', COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE NOTAFISCAL_ITEM ADD CONSTRAINT FK_NOTAFISCAL_ITEM_OP' +
          'F_PC FOREIGN KEY (OPF_PC_ID, COD_EMPRESA) REFERENCES OPF (ID, CO' +
          'D_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE NOTAFISCAL ADD CONF_BC BLOB SUB_TYPE 1 SEGMENT SIZE ' +
          '64;'
        'ALTER TABLE NOTAFISCAL ADD VPISDESON T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL ADD VCOFINSDESON T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL ADD CONF_ISUF CHAR(1);'
        'ALTER TABLE CLIENTES ADD ISUF VARCHAR(9);'
        'ALTER TABLE CIDADES_IBGE ADD ZFM_ALC CHAR(1);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CLIENTES_DEST('
        '    COD_CLIENTE,'
        '    COD_EMPRESA,'
        '    DEST_SEQID,'
        '    TIPO_END,'
        '    NOME_CLIENTE,'
        '    RAZAO,'
        '    CPFCGC,'
        '    INSC_EST,'
        '    INDIEDEST,'
        '    IDESTRANGEIRO,'
        '    ISUF,'
        '    IM,'
        '    LOGRADOURO,'
        '    NUMERO,'
        '    BAIRRO,'
        '    CEP,'
        '    COMPLEMENTO,'
        '    CIDADE,'
        '    UF,'
        '    TELEFONE,'
        '    EMAIL,'
        '    LOCALIDADE,'
        '    SETOR,'
        '    COD_CIDADE,'
        '    COD_LOCALIDADE,'
        '    CMUN,'
        '    CPAIS,'
        '    XPAIS,'
        '    ZFM_ALC,'
        '    ATIVO)'
        'AS'
        '/*view enderecos cliente*/'
        
          'select CL.COD_CLIENTE, CL.COD_EMPRESA, 0 DEST_SEQID, '#39'Principal'#39 +
          ' TIPO_END, CL.NOME_CLIENTE, CL.RAZAO, CL.CPFCGC,'
        
          '       CL.INSC_EST, CL.NFE_INDIEDEST, CL.NFE_IDESTRANGEIRO, cl.I' +
          'SUF, CL.INSC_MUNICIPAL IM, CL.ENDERECO LOGRADOURO,'
        
          '       CL.NUM_END_CLIENTE NUMERO, CL.BAIRRO BAIRRO, CL.CEP, CL.C' +
          'OMPLEMENTO, CL.CIDADE, ES.SIGLA_UF UF,'
        
          '       CL.FONE_CLIENTE TELEFONE, CL.EMAIL, LOC.LOCALIDADE, SR.SE' +
          'TOR, CL.COD_CIDADE, CL.COD_LOCALIDADE,'
        
          '       CI.IBGE_COD_CIDADE CMUN, CL.COD_PAIS CPAIS, PA.NOME_PAIS ' +
          'XPAIS, IBGE.ZFM_ALC, CL.ATIVO'
        'from CLIENTES CL'
        'left join CIDADES CI on CI.COD_CIDADE = CL.COD_CIDADE'
        
          'left join CIDADES_IBGE IBGE ON IBGE.CODIGO_MUN_IBGE = CI.IBGE_CO' +
          'D_CIDADE'
        'left join PAISES PA on PA.COD_PAIS = CL.COD_PAIS'
        
          'left join LOCALIDADE LOC on LOC.COD_LOCALIDADE = CL.COD_LOCALIDA' +
          'DE and'
        '      LOC.COD_EMPRESA = CL.COD_EMPRESA'
        'left join SETOR SR on SR.COD_SETOR = LOC.COD_SETOR and'
        '      SR.COD_EMPRESA = LOC.COD_EMPRESA'
        'left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        'union'
        
          'select distinct CL.COD_CLIENTE, CL.COD_EMPRESA, AD.SEQID DEST_SE' +
          'QID, AD.TIPO TIPO_END, CL.NOME_CLIENTE, CL.RAZAO,'
        
          '                CL.CPFCGC, AD.INSC_EST, AD.INDIEDEST, AD.IDESTRA' +
          'NGEIRO, AD.ISUF, AD.IM, AD.XLGR LOGRADOURO,'
        
          '                AD.NRO NUMERO, AD.XBAIRRO BAIRRO, AD.CEP, AD.XCP' +
          'L COMPLEMENTO, AD.XMUN CIDADE, AD.UF, AD.FONE TELEFONE,'
        
          '                AD.EMAIL, LOC.LOCALIDADE, SR.SETOR, AD.COD_CIDAD' +
          'E, AD.COD_LOCALIDADE, AD.CMUN, AD.CPAIS, AD.XPAIS,'
        '                IBGE.ZFM_ALC, AD.ATIVO'
        'from CLIENTES CL'
        
          'inner join CLIENTES_END_DOC_ADD AD on AD.COD_CLIENTE = CL.COD_CL' +
          'IENTE and'
        '      AD.COD_EMPRESA = CL.COD_EMPRESA'
        'left join CIDADES_IBGE IBGE ON IBGE.CODIGO_MUN_IBGE = AD.CMUN'
        
          'left join LOCALIDADE LOC on LOC.COD_LOCALIDADE = AD.COD_LOCALIDA' +
          'DE and'
        '      LOC.COD_EMPRESA = CL.COD_EMPRESA'
        'left join SETOR SR on SR.COD_SETOR = LOC.COD_SETOR and'
        '      SR.COD_EMPRESA = LOC.COD_EMPRESA'
        'left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        'order by 1, 2, 3;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_SPLIT ('
        '    TEXT_INPUT blob sub_type 1 segment size 80,'
        '    SEPARATOR blob sub_type 1 segment size 80 = '#39','#39','
        '    IGNORE_EMPTYS char(1) = '#39'S'#39')'
        'returns ('
        '    TEXT blob sub_type 1 segment size 80)'
        'as'
        'begin'
        '  while (TEXT_INPUT containing (SEPARATOR)) do'
        '  begin'
        
          '    TEXT = substring(TEXT_INPUT from 1 for (position(SEPARATOR, ' +
          'TEXT_INPUT) - 1));'
        '    if ((TEXT <> '#39#39') or (IGNORE_EMPTYS = '#39'S'#39')) then'
        '      suspend;'
        
          '    TEXT_INPUT = substring(TEXT_INPUT from (position(SEPARATOR, ' +
          'TEXT_INPUT) + char_length(SEPARATOR)) for char_length(TEXT_INPUT' +
          '));'
        '  end'
        '  if (coalesce(TEXT_INPUT, '#39#39') <> '#39#39') then'
        '    if ((TEXT <> '#39#39') or (IGNORE_EMPTYS = '#39'S'#39')) then'
        '    begin'
        '      TEXT = TEXT_INPUT;'
        '      suspend;'
        '    end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'create or alter procedure SP_GET_OPFISCAL'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'create or alter procedure SP_GET_OPFISCAL_LOTE'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter view SPED_PRESUMIDO('
        '    TIPO_DOC,'
        '    TIPO_ITEM,'
        '    NUM_DOC,'
        '    E_S,'
        '    DATA_LANCAMENTO,'
        '    DATA_EMISSAO,'
        '    CST_PIS,'
        '    CFOP,'
        '    VALOR_TOTAL,'
        '    VALOR_LIQUIDO,'
        '    DESCONTO,'
        '    NITEM,'
        '    CODIGO,'
        '    COD_ITEM,'
        '    DESCRICAO_ITEM,'
        '    RECEITA_PIS_COFINS,'
        '    CREDITO_PIS_COFINS,'
        '    NCM,'
        '    NUM_FAB_PROD,'
        '    COD_EMPRESA,'
        '    NAT_REC,'
        '    NSERIE,'
        '    COD_CLIENTE,'
        '    BASE_PIS,'
        '    ALIQ_PIS,'
        '    ALIQ_COFINS,'
        '    VALOR_PIS,'
        '    VALOR_COFINS,'
        '    MODELO,'
        '    SERIE,'
        '    SUBSERIE,'
        '    SITUACAO)'
        'AS'
        'select '#39'NF'#39','
        'nfi.tipo_item,'
        'nf.num_nf,'
        'nf.natureza_nf,'
        'nf.data_lanc,'
        'nf.data_contabil,'
        'nfi.cst_pis,'
        'nfi.codigo_nop,'
        'coalesce(nfi.valor_total,0),'
        
          '(coalesce(nfi.valor_total,0) - (coalesce(nfi.rateio_desconto,0) ' +
          '+ coalesce(nfi.vpisdeson,0) + coalesce(nfi.vcofinsdeson,0)) +'
        
          ' coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) ' +
          '+ case when nf.frete_f_nfe = '#39'S'#39' then 0 else coalesce(nfi.rateio' +
          '_frete,0) end + coalesce(case when (nfi.valor_icmsub_ant > 0) th' +
          'en 0 else nfi.valor_icmsub end,0) + coalesce(nfi.valor_ipi,0) + ' +
          'coalesce(nfi.nfe_vipidevol,0) + coalesce(nfi.fcp_vfcpst,0) - iif' +
          '(coalesce(nf.totais_com_deson, '#39'S'#39') <> '#39'N'#39', coalesce(nfi.vicmdes' +
          'on, 0), 0)),'
        
          '(coalesce(nfi.rateio_desconto,0) + coalesce(nfi.vpisdeson,0) + c' +
          'oalesce(nfi.vcofinsdeson,0) + iif(coalesce(nf.totais_com_deson, ' +
          #39'S'#39') <> '#39'N'#39', coalesce(nfi.vicmdeson, 0), 0)),'
        'nfi.nitem,'
        'nfi.cod_nf,'
        
          'case when nfi.tipo_item = '#39'P'#39' then nfi.grupo_prod||'#39'-'#39'||nfi.cod_' +
          'prod'
        '    when nfi.tipo_item = '#39'V'#39' then nfi.chassi'
        '    when nfi.tipo_item = '#39'S'#39' then nfi.cod_servico'
        '    when nfi.tipo_item = '#39'O'#39' then nfi.cod_nf||'#39'-'#39'||nfi.nitem'
        '    when nfi.tipo_item = '#39'D'#39' then nfi.cod_nf||'#39'-'#39'||nfi.nitem'
        '    else nfi.num_fab_prod'
        'end,'
        'nfi.descricao_item,'
        'nt.receita_pis_cofins,'
        'nt.credito_pis_cofins,'
        'nfi.ncm,'
        'nfi.num_fab_prod,'
        'nfi.cod_empresa,'
        
          'iif(coalesce(p.nat_rec, '#39#39') <> '#39#39', p.nat_rec, nbm.nat_rec) nat_r' +
          'ec,'
        #39#39','
        'nf.cod_cliente,'
        'nfi.base_pis,'
        'nfi.aliq_pis,'
        'nfi.aliq_cofins,'
        'nfi.valor_pis,'
        'nfi.valor_cofins,'
        'nf.modelo_nf,'
        'nf.serie,'
        'nf.subserie,'
        
          'case when (nf.emissao_propria = '#39'S'#39' and rtrim(nf.modelo_nf) = '#39'5' +
          '5'#39') then'
        '  case when nf.situacao_nfe = '#39'Autorizada'#39' then '#39'REGULAR'#39
        '        when nf.situacao_nfe = '#39'Cancelada'#39' then '#39'CANCELADO'#39
        '        else'#39'OUTROS'#39
        '  end'
        '  when nf.status = '#39'Fechada'#39' then '#39'REGULAR'#39
        '  when nf.status = '#39'Cancelada'#39' then '#39'CANCELADO'#39
        '  else '#39'OUTROS'#39
        'end'
        'from notafiscal nf'
        
          'inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi' +
          '.cod_empresa = nf.cod_empresa'
        
          'inner join produtos p on p.grupo_prod = nfi.grupo_prod and p.cod' +
          '_prod = nfi.cod_prod and p.cod_empresa = nfi.cod_empresa'
        'left join nat_op nt on nt.codigo_nop = nfi.codigo_nop'
        'left join nbm on nbm.cod_ncm = nfi.ncm'
        'where nf.status = '#39'Fechada'#39
        
          'and ( (nf.emissao_propria = '#39'S'#39' and nf.modelo_nf = '#39'55'#39' and coal' +
          'esce(nf.situacao_nfe,'#39#39') <> '#39#39' )'
        'or (nf.emissao_propria = '#39'S'#39' and nf.modelo_nf <> '#39'55'#39')'
        'or (nf.emissao_propria = '#39'N'#39') )'
        'AND coalesce(nf.da,  '#39'N'#39') <> '#39'S'#39
        'union'
        'select '#39'CP'#39','
        'cp2.prod_serv,'
        'cp.cupom,'
        #39'S'#39','
        'cp.data,'
        'cp.data,'
        'cp2.cst_pis,'
        'cp2.codigo_nop,'
        'cp2.total,'
        
          '(coalesce(CP2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp' +
          '2.perc_acresc,0) - coalesce(cp2.rat_desc,0) - coalesce(cp2.perc_' +
          'desc,0) ),'
        '(coalesce(cp2.rat_desc, 0) + coalesce(cp2.perc_desc,0)),'
        'cp2.nitem,'
        'cp.registro,'
        
          'case when cp2.prod_serv = '#39'P'#39' then cp2.grupo_prod||'#39'-'#39'||cp2.cod_' +
          'prod else cp2.grupo_prod end,'
        'cp2.descr_it,'
        'nt.receita_pis_cofins,'
        'nt.credito_pis_cofins,'
        'case when prod_serv = '#39'P'#39' then p.nbm else '#39'00'#39' end,'
        'case when prod_serv = '#39'P'#39' then p.num_fab_prod else '#39#39' end,'
        'cp.cod_empresa,'
        
          'iif(coalesce(p.nat_rec, '#39#39') <> '#39#39', p.nat_rec, nbm.nat_rec) nat_r' +
          'ec,'
        'cp.cod_terminal||'#39'-'#39'||cp.nserieecf,'
        'cp.cliente,'
        
          '(coalesce(CP2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp' +
          '2.perc_acresc,0) - coalesce(cp2.rat_desc,0) - coalesce(cp2.perc_' +
          'desc,0) ),'
        'cp2.aliq_pis, '
        'cp2.aliq_cofins, '
        
          '(coalesce(CP2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp' +
          '2.perc_acresc,0) - coalesce(cp2.rat_desc,0) - coalesce(cp2.perc_' +
          'desc,0) ) * cp2.aliq_pis / 100,'
        
          '(coalesce(CP2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp' +
          '2.perc_acresc,0) - coalesce(cp2.rat_desc,0) - coalesce(cp2.perc_' +
          'desc,0) ) * cp2.aliq_cofins / 100,'
        #39'2D'#39','
        #39#39','
        #39#39','
        'case when rtrim(coalesce(cp.status_cp, '#39#39')) = '#39#39' then '#39'REGULAR'#39
        '  else cp.status_cp'
        'end'
        'from cupom cp'
        
          'inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and ' +
          'cp.nserieecf = cp2.nserieecf and'
        
          'cp.cod_empresa = cp2.cod_empresa and cp.registro = cp2.ordem and' +
          ' cp.cupom = cp2.cupom'
        'left join nat_op nt on nt.codigo_nop = cp2.codigo_nop'
        
          'left join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_' +
          'prod = cp2.cod_prod and'
        'p.cod_empresa = cp2.cod_empresa'
        'left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod'
        'left join nbm on nbm.cod_ncm = p.nbm'
        
          'where ((cp2.status_it <> '#39'CANCELADO'#39') or (cp2.status_it is null)' +
          ')'
        'union'
        'select '#39'NFS'#39','
        #39'S'#39','
        'pv.num_nfeext,'
        #39'S'#39','
        'pv.data_nfext,'
        'pv.data_nfext,'
        'ps.cst_pis,'
        'ps.codigo_nop,'
        'coalesce(ps.valor_tot_serv,0),'
        
          'coalesce(ps.valor_tot_serv,0) + coalesce(ps.rateio_acresc,0) - c' +
          'oalesce(ps.rateio_desc,0),'
        'coalesce(ps.rateio_desc,0),'
        'ps.nitem,'
        'ps.nped,'
        'ps.cod_servico,'
        'ps.desc_serv_ped,'
        'nt.receita_pis_cofins,'
        'nt.credito_pis_cofins,'
        #39'00'#39','
        #39#39','
        'ps.cod_empresa,'
        #39#39','
        #39#39','
        'pv.cod_cliente,'
        'ps.base_pis,'
        'ps.aliq_pis,'
        'ps.aliq_cofins,'
        'ps.valor_pis,'
        'ps.valor_cofins,'
        #39'98'#39','
        #39'1'#39','
        #39#39','
        #39'REGULAR'#39
        'from pedvenda_serv ps'
        
          'inner join pedvenda pv on pv.nped = ps.nped and pv.tipo = ps.tip' +
          'o and pv.cod_empresa = ps.cod_empresa'
        'left join nat_op nt on nt.codigo_nop = ps.codigo_nop'
        'where pv.num_nfeext > 0 and pv.tipo = '#39'OS'#39
        'and ((ps.lote_nfse = 0 ) or (ps.lote_nfse is null))'
        'union'
        'select '#39'NFS'#39','
        #39'ST'#39','
        'pv.num_nfeext,'
        #39'S'#39','
        'pv.data_nfext,'
        'pv.data_nfext,'
        
          'case when coalesce(ts.cst_pis, '#39#39') <> '#39#39' then ts.cst_pis else '#39'0' +
          '1'#39' end,'
        'e.cfop_pad_serv,'
        'coalesce(pt.vl_servt,0),'
        'coalesce(pt.vl_servt,0),'
        '0,'
        '1,'
        'pt.nped,'
        '0,'
        'pt.descr_servt,'
        'nt.receita_pis_cofins,'
        'nt.credito_pis_cofins,'
        #39'00'#39','
        #39#39','
        'pv.cod_empresa,'
        #39#39','
        #39#39','
        'pv.cod_cliente,'
        'coalesce(pt.vl_servt,0),'
        'coalesce(e.pis_emp,0),'
        'coalesce(e.cofins_emp,0),'
        '(coalesce(pt.vl_servt,0) * coalesce(e.pis_emp,0) / 100 ),'
        '(coalesce(pt.vl_servt,0) * coalesce(e.cofins_emp,0) / 100),'
        #39'98'#39','
        #39'1'#39','
        #39#39','
        #39'REGULAR'#39
        'from pedvenda_serv_terc pt'
        
          'inner join pedvenda pv on pv.nped = pt.nped and pv.tipo = pt.tip' +
          'o and pv.cod_empresa = pt.cod_empresa'
        'left join empresa e on e.cod_empresa = pt.cod_empresa'
        'left join nat_op nt on nt.codigo_nop = e.cfop_pad_serv'
        'left join tipo_servico ts on ts.cod_servico = e.cod_serv_padrao'
        'where pv.num_nfeext > 0 and pv.tipo = '#39'OS'#39
        'union'
        'select '#39'NFS-e'#39','
        #39'S'#39','
        'ps.n_nf,'
        #39'S'#39','
        'ps.emissao_nfse,'
        'ps.emissao_nfse,'
        'ps.cst_pis,'
        'ps.codigo_nop,'
        
          '(coalesce(ps.valor_nfse,0) + coalesce(ps.rateio_desc,0) + coales' +
          'ce(ps.irrf_servico,0) ),'
        'coalesce(ps.valor_nfse,0) + coalesce(ps.irrf_servico,0),'
        'coalesce(ps.rateio_desc,0),'
        'ps.nitem,'
        'ps.nped,'
        'ps.cod_servico,'
        'ps.desc_serv_ped,'
        'nt.receita_pis_cofins,'
        'nt.credito_pis_cofins,'
        #39'00'#39','
        #39#39','
        'ps.cod_empresa,'
        #39#39','
        #39#39','
        'pv.cod_cliente,'
        'ps.base_pis,'
        'ps.aliq_pis,'
        'ps.aliq_cofins,'
        'ps.valor_pis,'
        'ps.valor_cofins,'
        #39'98'#39','
        #39'1'#39','
        #39#39','
        #39'REGULAR'#39
        'from pedvenda_serv ps'
        
          'inner join pedvenda pv on pv.nped = ps.nped and pv.tipo = ps.tip' +
          'o and pv.cod_empresa = ps.cod_empresa'
        'left join nat_op nt on nt.codigo_nop = ps.codigo_nop'
        'where ps.status_nfse = '#39'Autorizada'#39
        'and pv.tipo = '#39'OS'#39' and ps.lote_nfse > 0'
        'union'
        'select '#39'NF-D'#39','
        #39'P'#39','
        'nd.numeronota,'
        #39'S'#39','
        
          'case when nd.dataentrada is null then nd.dataemissao else nd.dat' +
          'aentrada end,'
        'nd.dataemissao,'
        'ndi.cst_pis,'
        'p.codigo_nop,'
        'coalesce(ndi.vl_tot_item,0),'
        'coalesce(ndi.vl_tot_item,0),'
        '0,'
        'ndi.nitem,'
        'ndi.numeronota,'
        'ndi.grupo_prod||'#39'-'#39'||ndi.cod_prod,'
        'ndi.desc_prod,'
        'nt.receita_pis_cofins,'
        'nt.credito_pis_cofins,'
        'p.nbm,'
        'p.num_fab_prod,'
        'ndi.cod_empresa,'
        
          'iif(coalesce(p.nat_rec, '#39#39') <> '#39#39', p.nat_rec, nbm.nat_rec) nat_r' +
          'ec,'
        #39#39','
        'nd.cod_cliente,'
        'ndi.base_pis,'
        'ndi.aliq_pis,'
        'ndi.aliq_cofins,'
        'ndi.valor_pis,'
        'ndi.valor_cofins,'
        #39'02'#39','
        'nd.serie,'
        'nd.subserie,'
        
          'case when rtrim(coalesce(nd.status, '#39#39')) = '#39'FECHADA'#39' then '#39'REGUL' +
          'AR'#39
        '  else '#39'CANCELADO'#39
        'end'
        'from nf_serie_d_itens ndi'
        
          'inner join nf_serie_d nd on nd.numeronota = ndi.numeronota and n' +
          'd.cod_empresa = ndi.cod_empresa'
        
          'inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod' +
          '_prod = ndi.cod_prod and p.cod_empresa = ndi.cod_empresa'
        'left join nat_op nt on nt.codigo_nop = p.codigo_nop'
        'left join nbm on nbm.cod_ncm = p.nbm'
        'union'
        'select '#39'Frete'#39','
        #39'F'#39','
        'st.num_documento,'
        #39'E'#39','
        
          'case when st.data_lancamento is null then st.data_emissao else s' +
          't.data_lancamento end,'
        'st.data_emissao,'
        'st.cst_pis,'
        'cast(st.cfop as double precision),'
        'coalesce(st.valor_total,0),'
        'coalesce(st.valor_total,0),'
        '0,'
        '1,'
        'st.cod_serv_transp,'
        'st.tipo||'#39'-'#39'||st.cif_fob_outros,'
        't.nome_tr,'
        'nt.receita_pis_cofins,'
        'nt.credito_pis_cofins,'
        #39'00'#39','
        #39#39','
        'st.cod_empresa,'
        #39#39','
        #39#39','
        #39'T'#39'||st.cod_transportador,'
        'st.base_pis,'
        'st.aliq_pis,'
        'st.aliq_cofins,'
        'st.valor_pis,'
        'st.valor_cofins,'
        'st.modelo,'
        'st.serie,'
        'ST.sub_serie,'
        #39'REGULAR'#39
        'from servico_transporte st'
        
          'inner join transportador t on t.codigo_tr = st.cod_transportador' +
          ' and t.cod_empresa = st.cod_empresa'
        'left join nat_op nt on nt.codigo_nop = st.cfop'
        
          'where (((st.tipo = '#39'E'#39') and (st.cif_fob_outros = 2)) or ( (st.ti' +
          'po = '#39'S'#39') and (st.cif_fob_outros = 1)))'
        'union'
        'select '#39'NFC'#39','
        #39'P'#39','
        'nfc.num_nf,'
        #39'S'#39','
        'nfc.data_lanc,'
        'nfc.data_lanc,'
        'nfci.pis_cst,'
        'nfci.cfop,'
        'coalesce(nfci.vprod, 0),'
        '(coalesce(nfci.vprod, 0) - coalesce(nfci.vdesc, 0)'
        
          '+ coalesce(nfci.vseg, 0) + coalesce(nfci.voutro, 0) + coalesce(n' +
          'fci.vfrete, 0)),'
        'coalesce(nfci.vdesc, 0),'
        'nfci.nitem,'
        'nfc.num_nf,'
        'nfci.grupo_prod||'#39'-'#39'||nfci.cod_prod,'
        'nfci.xprod,'
        'nt.receita_pis_cofins,'
        'nt.credito_pis_cofins,'
        'p.nbm,'
        'p.num_fab_prod,'
        'nfc.cod_empresa,'
        
          'iif(coalesce(p.nat_rec, '#39#39') <> '#39#39', p.nat_rec, nbm.nat_rec) nat_r' +
          'ec,'
        #39#39','
        'nfc.cod_cliente,'
        
          'iif(coalesce(nfci.pis_valiqprod, 0) > 0, coalesce(nfci.pis_qbcpr' +
          'od, 0), coalesce(nfci.pis_vbc, 0)),-- (coalesce(CP2.total,0) + c' +
          'oalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0) - coalesc' +
          'e(cp2.rat_desc,0) - coalesce(cp2.perc_desc,0) ),'
        
          'iif(coalesce(nfci.pis_ppis, 0) > 0, coalesce(nfci.pis_ppis, 0), ' +
          'coalesce(nfci.pis_valiqprod, 0)),-- cp2.aliq_pis,'
        
          'iif(coalesce(nfci.cofins_pcofins, 0) > 0, coalesce(nfci.cofins_p' +
          'cofins, 0), coalesce(nfci.cofins_valiqprod, 0)),-- cp2.aliq_cofi' +
          'ns,'
        'coalesce(nfci.pis_vpis, 0),'
        'coalesce(nfci.cofins_vcofins, 0),'
        'nfc.modelo,'
        'nfc.serie,'
        #39#39','
        'case when (nfc.situacao_nfce = '#39'Autorizada'#39') then '#39'REGULAR'#39
        '  when (nfc.situacao_nfce = '#39'Cancelada'#39') then '#39'CANCELADO'#39
        '  when (nfc.situacao_nfce = '#39'Inutilizada'#39') then '#39'OUTROS'#39
        '  when (nfc.situacao_nfce = '#39'Denegada'#39') then '#39'OUTROS'#39
        '  else '#39'OUTROS'#39' end'
        ''
        'from nfce nfc'
        
          'inner join nfce_item nfci on nfci.cod_nfce = nfc.cod_nfce and nf' +
          'ci.cod_empresa = nfc.cod_empresa'
        
          'inner join produtos p on nfci.grupo_prod = p.grupo_prod and nfci' +
          '.cod_prod=p.cod_prod and nfci.cod_empresa=p.cod_empresa'
        'left join nat_op nt on nt.codigo_nop = nfci.cfop'
        'left join tipo_servico ts on ts.cod_servico = nfci.grupo_prod'
        'left join nbm on nbm.cod_ncm = p.nbm'
        'where nfc.status = '#39'Fechada'#39';'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS486'#39', :COD_EMPRESA, '#39'BT CONSULTAR OPERACAO FISCAL'#39 +
          ', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS487'#39', :COD_EMPRESA, '#39'BT INCLUIR OPERACAO FISCAL'#39', ' +
          '5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS488'#39', :COD_EMPRESA, '#39'BT ALTERAR OPERACAO FISCAL'#39', ' +
          '5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS489'#39', :COD_EMPRESA, '#39'BT SALVAR OPERACAO FISCAL'#39', 5' +
          ', '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS490'#39', :COD_EMPRESA, '#39'BT EXCLUIR OPERACAO FISCAL'#39', ' +
          '100, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS491'#39', :COD_EMPRESA, '#39'BT RESTAURAR OPERACAO FISCAL'#39 +
          ', 10, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS492'#39', :COD_EMPRESA, '#39'ALTERAR ICMS OPERACAO FISCAL'#39 +
          ', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS493'#39', :COD_EMPRESA, '#39'ALTERAR ICMS INTERNO OPERACAO' +
          ' FISCAL'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS494'#39', :COD_EMPRESA, '#39'ALTERAR ICMS INTERESTADUAL OP' +
          'ERACAO FISCAL'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS495'#39', :COD_EMPRESA, '#39'ALTERAR ICMS EXTERIOR OPERACA' +
          'O FISCAL'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS496'#39', :COD_EMPRESA, '#39'ALTERAR PISCOFINS OPERACAO FI' +
          'SCAL'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS497'#39', :COD_EMPRESA, '#39'ALTERAR CONDICAO NOVO NCM OPE' +
          'RACAO FISCAL'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS498'#39', :COD_EMPRESA, '#39'ALTERAR CONDICAO EXCLUIR NCM ' +
          'OPERACAO FISCAL'#39', 10, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS499'#39', :COD_EMPRESA, '#39'ALTERAR CONDICAO NOVO OPCIONA' +
          'L OPERACAO FISCAL'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'BAS500'#39', :COD_EMPRESA, '#39'ALTERAR CONDICAO EXCLUIR OPCI' +
          'ONAL OPERACAO FISCAL'#39', 10, '#39'S'#39', '#39'S'#39');'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_FINANCEIRO('
        '    DATE_,'
        '    ID,'
        '    COD_EMPRESA,'
        '    NSU,'
        '    AUTHORIZATION_NUMBER,'
        '    TYPE_,'
        '    TYPE_DESCRIPTION,'
        '    ACQUIRER_ID,'
        '    ACQUIRER_NAME,'
        '    BRAND_ID,'
        '    BRAND_NAME,'
        '    EVENT_TYPE,'
        '    EVENT_TYPE_DESCRIPTION,'
        '    DESCRIPTION,'
        '    BANK_RECON_STATUS,'
        '    BANK_RECON_DESCRIPTION,'
        '    GROSS_AMOUNT,'
        '    EVENT_NET_AMOUNT,'
        '    BATCH_NET_AMOUNT,'
        '    TAX,'
        '    SALE_TAX,'
        '    CUSTOMER_TAX,'
        '    INSTALLMENT_NUMBER,'
        '    INSTALLMENTS_TOTAL,'
        '    BANK_NUMBER,'
        '    BANK_NAME,'
        '    BRANCH_NUMBER,'
        '    ACCOUNT_NUMBER,'
        '    IDENTIFICACAO_EMP,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    CODIGO_CTRL_TX,'
        '    NOME_CTRL_TX,'
        '    N_CONTA_PLC_TX_CARTAO,'
        '    N_CONTA_PLC_TARIFA_CARTAO,'
        '    N_CONTA_PLC,'
        '    DESC_PLC,'
        '    COD_CRED,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    STATUS_C,'
        '    DATQ_C,'
        '    TAXA_CRED,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANDEIRA_ADM)'
        'AS'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        'cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description, '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, '
        'ctrl2.n_conta_plc_tx_cartao, ctrl2.n_conta_plc_tarifa_cartao, '
        'cc.n_conta_plc, p.desc_plc, '
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.status_c, cc.datq_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        'inner join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu '
        
          '    and ((cc.n_aut_cart = cf.authorization_number) or (cf.author' +
          'ization_number is null))'
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa '
        '    and cc.datq_c is null '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join controles ctrl2 on '
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl2.codigo_emp = cc.codigo_emp '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = cc.n_conta_plc '
        'where trim(cf.event_type_description) = '#39'Venda'#39
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        '    cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description, '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, '
        'ctrl2.n_conta_plc_tx_cartao, ctrl2.n_conta_plc_tarifa_cartao, '
        'cc.n_conta_plc, p.desc_plc, '
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.status_c, cc.datq_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        'inner join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu '
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa '
        '    and cc.datq_c is null '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join controles ctrl2 on '
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl2.codigo_emp = cc.codigo_emp '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = cc.n_conta_plc '
        'where trim(cf.event_type_description) like '#39'Antecipa%'#39
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,  '
        '    cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description, '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, '
        'ctrl2.n_conta_plc_tx_cartao, ctrl2.n_conta_plc_tarifa_cartao, '
        'null n_conta_plc, null desc_plc, '
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original,  cc.data_rec_c,' +
          ' cc.data_venc_c, cc.status_c, cc.datq_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        'inner join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu '
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa '
        '    and cc.datq_c is null '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join controles ctrl2 on '
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl2.codigo_emp = cc.codigo_emp '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        
          'where trim(cf.event_type_description) in ('#39'Cancelamento'#39', '#39'Charg' +
          'eBack'#39')'
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,  '
        'cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description    , '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        'null codigo_ctrl_tx, null nome_ctrl_tx, '
        'null n_conta_plc_tx_cartao, null n_conta_plc_tarifa_cartao, '
        'ct.n_conta_plc, p.desc_plc, '
        'null cod_cred, null n_doc_v, null n_doc_c, null tp_doc_v, '
        
          'null valor_c, null valor_liquido, null valor_original, null data' +
          '_rec_c, null data_venc_c, null status_c, null datq_c, null taxa_' +
          'cred,'
        'null cod_cliente, null nome_cliente, '
        
          'null cod_terminal_adm, null desc_term_adm, null cod_adm, null de' +
          'scricao_adm, '
        'null cod_bandeira_adm, null descricao '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = ct.n_conta_plc '
        
          'where trim(cf.event_type_description) = '#39'Ajuste'#39' and coalesce(cf' +
          '.event_net_amount, 0) >= 0'
        'and (select count(*) from lancamentos lanc '
        '     where lanc.id_financ_confere = cf.id'
        '     and lanc.cod_emp_mult = cf.cod_empresa) = 0'
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,  '
        'cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description    , '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        'null codigo_ctrl_tx, null nome_ctrl_tx, '
        'null n_conta_plc_tx_cartao, null n_conta_plc_tarifa_cartao, '
        'ct.n_conta_plc, p.desc_plc, '
        'null cod_cred, null n_doc_v, null n_doc_c, null tp_doc_v, '
        
          'null valor_c, null valor_liquido, null valor_original, null data' +
          '_rec_c, null data_venc_c, null status_c, null datq_c, null taxa_' +
          'cred,'
        'null cod_cliente, null nome_cliente, '
        
          'null cod_terminal_adm, null desc_term_adm, null cod_adm, null de' +
          'scricao_adm, '
        'null cod_bandeira_adm, null descricao '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = ct.n_conta_plc '
        
          'where trim(cf.event_type_description) = '#39'Ajuste'#39' and coalesce(cf' +
          '.event_net_amount, 0) < 0'
        'and (select count(*) from contas_a_pagar ctp '
        '     where ctp.id_financ_confere = cf.id'
        '     and ctp.cod_emp_mult = cf.cod_empresa) = 0;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_PENDENCIAS_CONF('
        '    DATE_,'
        '    ID,'
        '    COD_EMPRESA,'
        '    NSU,'
        '    AUTHORIZATION_NUMBER,'
        '    TYPE_,'
        '    TYPE_DESCRIPTION,'
        '    ACQUIRER_ID,'
        '    ACQUIRER_NAME,'
        '    BRAND_ID,'
        '    BRAND_NAME,'
        '    EVENT_TYPE,'
        '    EVENT_TYPE_DESCRIPTION,'
        '    DESCRIPTION,'
        '    BANK_RECON_STATUS,'
        '    BANK_RECON_DESCRIPTION,'
        '    GROSS_AMOUNT,'
        '    EVENT_NET_AMOUNT,'
        '    BATCH_NET_AMOUNT,'
        '    TAX,'
        '    SALE_TAX,'
        '    CUSTOMER_TAX,'
        '    INSTALLMENT_NUMBER,'
        '    INSTALLMENTS_TOTAL,'
        '    BANK_NUMBER,'
        '    BANK_NAME,'
        '    BRANCH_NUMBER,'
        '    ACCOUNT_NUMBER,'
        '    IDENTIFICACAO_EMP,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    CODIGO_CTRL_TX,'
        '    NOME_CTRL_TX,'
        '    N_CONTA_PLC_TX_CARTAO,'
        '    N_CONTA_PLC,'
        '    DESC_PLC,'
        '    COD_CRED,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    DATQ_C,'
        '    STATUS_C,'
        '    TAXA_CRED,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANDEIRA_ADM)'
        'AS'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        'cf.type_, cf.type_description,'
        'cf.acquirer_id, cf.acquirer_name,'
        'cf.brand_id, cf.brand_name,'
        'cf.event_type, cf.event_type_description,'
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description,'
        'cf.bank_recon_status,'
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description,'
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax,'
        'cf.installment_number, cf.installments_total,'
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r,'
        'emp.identificacao_emp,'
        'ctrl.codigo_ctrl, ctrl.nome_ctrl,'
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, ctrl2.n_conta_plc_tx_cartao,'
        'cc.n_conta_plc, p.desc_plc,'
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm,'
        
          'cc.cod_bandeira_adm, band.descricao from conciliacao_financeiro ' +
          'cf'
        'inner join empresa emp on'
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu'
        
          '    and ((cc.n_aut_cart = cf.authorization_number) or (cf.author' +
          'ization_number is null))'
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on'
        '    ctrl.n_conta_ctrl = cf.account_number'
        '    and ctrl.agencia_ctrl = cf.branch_number'
        '    and ctrl.codigo_emp = cf.cod_empresa'
        'left join controles ctrl2 on'
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl'
        '    and ctrl2.codigo_emp = cc.codigo_emp'
        'left join conciliacao_descr_tipo ct on'
        '    ct.descricao = cf.description'
        '    and ct.cod_empresa = cf.cod_empresa'
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end)'
        'left join p_contas p on'
        '    p.n_conta_plc = cc.n_conta_plc'
        'where (select count(*) from controle_creditos cc where'
        '       cc.n_docnsu_adm = cf.nsu'
        
          '       and ((cc.n_aut_cart = cf.authorization_number) or (cf.aut' +
          'horization_number is null))'
        
          '       and coalesce(cc.nparcela, 1) = coalesce(cf.installment_nu' +
          'mber, 1)'
        '       and cc.cod_emp_mult = cf.cod_empresa) = 0'
        'and trim(cf.event_type_description) = '#39'Venda'#39
        'union'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,'
        'cf.type_, cf.type_description,'
        'cf.acquirer_id, cf.acquirer_name,'
        'cf.brand_id, cf.brand_name,'
        'cf.event_type, cf.event_type_description,'
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description,'
        'cf.bank_recon_status,'
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description,'
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax,'
        'cf.installment_number, cf.installments_total,'
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r,'
        'emp.identificacao_emp,'
        'ctrl.codigo_ctrl, ctrl.nome_ctrl,'
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, ctrl2.n_conta_plc_tx_cartao,'
        'cc.n_conta_plc, p.desc_plc,'
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm,'
        
          'cc.cod_bandeira_adm, band.descricao  from conciliacao_financeiro' +
          ' cf'
        'inner join empresa emp on'
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu'
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on'
        '    ctrl.n_conta_ctrl = cf.account_number'
        '    and ctrl.agencia_ctrl = cf.branch_number'
        '    and ctrl.codigo_emp = cf.cod_empresa'
        'left join controles ctrl2 on'
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl'
        '    and ctrl2.codigo_emp = cc.codigo_emp'
        'left join conciliacao_descr_tipo ct on'
        '    ct.descricao = cf.description'
        '    and ct.cod_empresa = cf.cod_empresa'
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end)'
        'left join p_contas p on'
        '    p.n_conta_plc = cc.n_conta_plc'
        'where (select count(*) from controle_creditos cc where'
        '       cc.n_docnsu_adm = cf.nsu'
        
          '       and coalesce(cc.nparcela, 1) = coalesce(cf.installment_nu' +
          'mber, 1)'
        '       and cc.cod_emp_mult = cf.cod_empresa) = 0'
        
          'and trim(cf.event_type_description) in ('#39'Cancelamento'#39', '#39'Chargeb' +
          'ack'#39')'
        'union'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,'
        'cf.type_, cf.type_description,'
        'cf.acquirer_id, cf.acquirer_name,'
        'cf.brand_id, cf.brand_name,'
        'cf.event_type, cf.event_type_description,'
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description,'
        'cf.bank_recon_status,'
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description,'
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax,'
        'cf.installment_number, cf.installments_total,'
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r,'
        'emp.identificacao_emp,'
        'ctrl.codigo_ctrl, ctrl.nome_ctrl,'
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, ctrl2.n_conta_plc_tx_cartao,'
        'cc.n_conta_plc, p.desc_plc,'
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm,'
        
          'cc.cod_bandeira_adm, band.descricao from conciliacao_financeiro ' +
          'cf'
        'inner join empresa emp on'
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu'
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on'
        '    ctrl.n_conta_ctrl = cf.account_number'
        '    and ctrl.agencia_ctrl = cf.branch_number'
        '    and ctrl.codigo_emp = cf.cod_empresa'
        'left join controles ctrl2 on'
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl'
        '    and ctrl2.codigo_emp = cc.codigo_emp'
        'left join conciliacao_descr_tipo ct on'
        '    ct.descricao = cf.description'
        '    and ct.cod_empresa = cf.cod_empresa'
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end)'
        'left join p_contas p on'
        '    p.n_conta_plc = cc.n_conta_plc'
        'where (select count(*) from controle_creditos cc where'
        '       cc.n_docnsu_adm = cf.nsu'
        
          '       and coalesce(cc.nparcela, 1) = coalesce(cf.installment_nu' +
          'mber, 1)'
        '       and cc.cod_emp_mult = cf.cod_empresa) = 0'
        
          'and trim(cf.event_type_description) in ('#39'Cancelamento'#39', '#39'Chargeb' +
          'ack'#39')'
        'union'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        'cf.type_, cf.type_description,'
        'cf.acquirer_id, cf.acquirer_name,'
        'cf.brand_id, cf.brand_name,'
        'cf.event_type, cf.event_type_description,'
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description,'
        'cf.bank_recon_status,'
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description,'
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax,'
        'cf.installment_number, cf.installments_total,'
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r,'
        'emp.identificacao_emp,'
        'ctrl.codigo_ctrl, ctrl.nome_ctrl,'
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, ctrl2.n_conta_plc_tx_cartao,'
        'null n_conta_plc, null desc_plc,'
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm,'
        
          'cc.cod_bandeira_adm, band.descricao from conciliacao_financeiro ' +
          'cf'
        'inner join empresa emp on'
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu '
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa'
        '    and cc.cod_cred is null'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on'
        '    ctrl.n_conta_ctrl = cf.account_number'
        '    and ctrl.agencia_ctrl = cf.branch_number'
        '    and ctrl.codigo_emp = cf.cod_empresa'
        'left join controles ctrl2 on'
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl'
        '    and ctrl2.codigo_emp = cc.codigo_emp'
        'left join conciliacao_descr_tipo ct on'
        '    ct.descricao = cf.description'
        '    and ct.cod_empresa = cf.cod_empresa'
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end)'
        'where (select count(*) from controle_creditos cc where'
        '       cc.n_docnsu_adm = cf.nsu'
        
          '       and coalesce(cc.nparcela, 1) = coalesce(cf.installment_nu' +
          'mber, 1)'
        '       and cc.cod_emp_mult = cf.cod_empresa) = 0'
        'and trim(cf.event_type_description) = '#39'Antecipacao'#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_PENDENCIAS_CRED('
        '    COD_CRED,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    N_DOCNSU_ADM,'
        '    N_AUT_CART,'
        '    NPARCELA,'
        '    QTDE_PARC,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATQ_C,'
        '    STATUS_C,'
        '    TAXA_CRED,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANDEIRA_ADM,'
        '    NOME_C,'
        '    IDENTIFICACAO_EMP)'
        'AS'
        'select cc.cod_cred, cc.codigo_emp, cc.cod_emp_mult, '
        'cc.data_rec_c, cc.data_venc_c, '
        'cc.n_docnsu_adm, cc.n_aut_cart, '
        'cc.nparcela, cc.qtde_parc, '
        'cc.codigo_ctrl, ctrl.nome_ctrl, '
        'cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        'cc.valor_c, cc.valor_liquido, cc.valor_original,'
        'cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, '
        'cc.nome_c, emp.identificacao_emp from controle_creditos cc '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'inner join empresa emp on '
        '    emp.cod_empresa = cc.cod_emp_mult '
        'inner join controles ctrl on '
        '   ctrl.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl.codigo_emp = cc.cod_emp_mult '
        '    and ctrl.tp_plano = '#39'C'#39' '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'where cc.datq_c is null'
        'and coalesce(cc.n_docnsu_adm, '#39#39') <> '#39#39' '
        'and coalesce(cc.n_aut_cart, '#39#39') <> '#39#39' '
        'and (case when ((select count(*) from conciliacao_financeiro cf '
        '                 where cf.nsu = cc.n_docnsu_adm '
        '                 and cf.authorization_number = cc.n_aut_cart'
        
          '                 and coalesce(cf.installment_number, 1) = coales' +
          'ce(cc.nparcela, 1) '
        '                 and cf.cod_empresa = cc.cod_emp_mult) > 0) then'
        
          '                    (select count(*) from conciliacao_financeiro' +
          ' cf '
        '                     where cf.nsu = cc.n_docnsu_adm '
        
          '                     and cf.authorization_number = cc.n_aut_cart' +
          ' '
        
          '                     and coalesce(cf.installment_number, 1) = co' +
          'alesce(cc.nparcela, 1) '
        '                     and cf.cod_empresa = cc.cod_emp_mult) '
        '          else '
        
          '                    (select count(*) from conciliacao_financeiro' +
          ' cf '
        '                    where cf.nsu = cc.n_docnsu_adm '
        
          '                    and coalesce(cf.installment_number, 1) = coa' +
          'lesce(cc.nparcela, 1) '
        '                    and cf.cod_empresa = cc.cod_emp_mult) '
        '    end) = 0 '
        'union '
        'select cc.cod_cred, cc.codigo_emp, cc.cod_emp_mult, '
        'cc.data_rec_c, cc.data_venc_c, '
        'cc.n_docnsu_adm, cc.n_aut_cart, '
        'cc.nparcela, cc.qtde_parc, '
        'cc.codigo_ctrl, ctrl.nome_ctrl, '
        'cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        'cc.valor_c, cc.valor_liquido, cc.valor_original,'
        'cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, '
        'cc.nome_c, emp.identificacao_emp from controle_creditos cc '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'inner join empresa emp on '
        '    emp.cod_empresa = cc.cod_emp_mult '
        'inner join controles ctrl on '
        '    ctrl.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl.codigo_emp = cc.cod_emp_mult '
        '    and ctrl.tp_plano = '#39'C'#39' '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'where cc.datq_c is null'
        'and coalesce(cc.n_docnsu_adm, '#39#39') = '#39#39
        'and coalesce(cc.n_aut_cart, '#39#39') = '#39#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_CRED_DIV_DTVALOR('
        '    DATE_,'
        '    ID,'
        '    COD_CRED,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    N_DOCNSU_ADM,'
        '    N_AUT_CART,'
        '    NPARCELA,'
        '    QTDE_PARC,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATQ_C,'
        '    STATUS_C,'
        '    TAXA_CRED,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANCEIRA_ADM,'
        '    NOME_C,'
        '    IDENTIFICACAO_EMP)'
        'AS'
        
          'select cf.date_, cf.id, cc.cod_cred, cc.codigo_emp, cc.cod_emp_m' +
          'ult, '
        'cc.data_rec_c, cc.data_venc_c, '
        'cc.n_docnsu_adm, cc.n_aut_cart, '
        'cc.nparcela, cc.qtde_parc, '
        'cc.codigo_ctrl, ctrl.nome_ctrl, '
        'cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        'cc.valor_c, cc.valor_liquido, cc.valor_original,'
        'cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente, '
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, '
        'cc.nome_c, emp.identificacao_emp from controle_creditos cc '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'inner join conciliacao_financeiro cf on '
        '    cf.nsu = cc.n_docnsu_adm '
        
          '    and ((cf.authorization_number = cc.n_aut_cart) or (cf.author' +
          'ization_number is null)) '
        
          '      and coalesce(cf.installment_number, 1) = coalesce(cc.nparc' +
          'ela, 1) '
        '    and cf.cod_empresa = cc.cod_emp_mult '
        'inner join empresa emp on '
        '    emp.cod_empresa = cc.cod_emp_mult '
        'inner join controles ctrl on '
        '   ctrl.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl.codigo_emp = cc.cod_emp_mult '
        '    and ctrl.tp_plano = '#39'C'#39' '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'where cc.datq_c is null'
        'and cc.data_venc_c is not null '
        'and cc.data_venc_c < cf.date_  '
        'and coalesce(cc.n_docnsu_adm, '#39#39') <> '#39#39' '
        'and coalesce(cc.n_aut_cart, '#39#39') <> '#39#39';'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_CONTROLE_CREDITOS_NAUT ON CONTROLE_CREDITOS (N_' +
          'AUT_CART, NPARCELA, COD_EMP_MULT);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN040'#39', :COD_EMPRESA, ' +
          #39'VINCULAR CREDITOS AS PENDENCIA CONCILIACAO CARTAO'#39', 3, '#39'S'#39', '#39'FR' +
          'MCONCILIACARTAOCONFERE'#39', 1, '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_CLIENTES_DEST ('
        '    ACOD_CLIENTE integer,'
        '    ACOD_EMPRESA integer,'
        '    ADEST_SEQID integer,'
        '    ACOD_CIDADE integer,'
        '    ACOD_LOCALIDADE integer)'
        'returns ('
        '    COD_CLIENTE integer,'
        '    COD_EMPRESA integer,'
        '    DEST_SEQID integer,'
        '    TIPO_END varchar(32),'
        '    NOME_CLIENTE varchar(35),'
        '    RAZAO varchar(60),'
        '    CPFCGC varchar(18),'
        '    INSC_EST varchar(18),'
        '    INDIEDEST smallint,'
        '    IDESTRANGEIRO varchar(20),'
        '    ISUF varchar(9),'
        '    IM varchar(15),'
        '    LOGRADOURO varchar(60),'
        '    NUMERO varchar(60),'
        '    BAIRRO varchar(60),'
        '    CEP varchar(9),'
        '    COMPLEMENTO varchar(60),'
        '    CIDADE varchar(60),'
        '    UF char(2),'
        '    TELEFONE varchar(14),'
        '    EMAIL varchar(256),'
        '    LOCALIDADE varchar(64),'
        '    SETOR varchar(64),'
        '    COD_CIDADE integer,'
        '    COD_LOCALIDADE integer,'
        '    CMUN integer,'
        '    CPAIS integer,'
        '    XPAIS varchar(64),'
        '    ZFM_ALC char(1),'
        '    ATIVO integer)'
        'as'
        'begin'
        '  if (coalesce(ACOD_CLIENTE, 0) > 0) then'
        
          '    for select CL.COD_CLIENTE, CL.COD_EMPRESA, CL.NOME_CLIENTE, ' +
          'CL.RAZAO, CL.CPFCGC, CL.INSC_EST, 0 DEST_SEQID,'
        
          '               '#39'Principal'#39' TIPO_END, CL.ENDERECO LOGRADOURO, CL.' +
          'NUM_END_CLIENTE NUMERO, CL.BAIRRO BAIRRO, CL.CEP,'
        
          '               CL.COMPLEMENTO, CL.CIDADE, ES.SIGLA_UF UF, CL.FON' +
          'E_CLIENTE TELEFONE, CL.EMAIL, LOC.LOCALIDADE, SR.SETOR,'
        
          '               CL.COD_CIDADE, CL.COD_LOCALIDADE, CL.ATIVO, CL.NF' +
          'E_INDIEDEST, CL.NFE_IDESTRANGEIRO, null ISUF,'
        
          '               CL.INSC_MUNICIPAL, CI.IBGE_COD_CIDADE, CL.COD_PAI' +
          'S, PA.NOME_PAIS, IBGE.ZFM_ALC'
        '        from CLIENTES CL'
        '        left join CIDADES CI on CI.COD_CIDADE = CL.COD_CIDADE'
        
          '        left join CIDADES_IBGE IBGE ON IBGE.CODIGO_MUN_IBGE = CI' +
          '.IBGE_COD_CIDADE'
        '        left join PAISES PA on PA.COD_PAIS = CL.COD_PAIS'
        
          '        left join LOCALIDADE LOC on LOC.COD_LOCALIDADE = CL.COD_' +
          'LOCALIDADE and'
        '              LOC.COD_EMPRESA = CL.COD_EMPRESA'
        '        left join SETOR SR on SR.COD_SETOR = LOC.COD_SETOR and'
        '              SR.COD_EMPRESA = LOC.COD_EMPRESA'
        '        left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        ''
        '        where CL.COD_CLIENTE = :ACOD_CLIENTE and'
        '              CL.COD_EMPRESA = :ACOD_EMPRESA and'
        '              :ADEST_SEQID = 0'
        '        union'
        
          '        select distinct CL.COD_CLIENTE, CL.COD_EMPRESA, CL.NOME_' +
          'CLIENTE, CL.RAZAO, CL.CPFCGC, AD.INSC_EST,'
        
          '                        AD.SEQID DEST_SEQID, AD.TIPO TIPO_END, A' +
          'D.XLGR LOGRADOURO, AD.NRO NUMERO, AD.XBAIRRO BAIRRO,'
        
          '                        AD.CEP, AD.XCPL COMPLEMENTO, AD.XMUN CID' +
          'ADE, AD.UF, AD.FONE TELEFONE, AD.EMAIL, LOC.LOCALIDADE,'
        
          '                        SR.SETOR, AD.COD_CIDADE, AD.COD_LOCALIDA' +
          'DE, AD.ATIVO, AD.INDIEDEST, AD.IDESTRANGEIRO, AD.ISUF,'
        
          '                        AD.IM, AD.CMUN, AD.CPAIS, AD.XPAIS, IBGE' +
          '.ZFM_ALC'
        '        from CLIENTES CL'
        
          '        inner join CLIENTES_END_DOC_ADD AD on AD.COD_CLIENTE = C' +
          'L.COD_CLIENTE and'
        '              AD.COD_EMPRESA = CL.COD_EMPRESA        '
        
          '        left join CIDADES_IBGE IBGE ON IBGE.CODIGO_MUN_IBGE = AD' +
          '.CMUN'
        
          '        left join LOCALIDADE LOC on LOC.COD_LOCALIDADE = AD.COD_' +
          'LOCALIDADE and'
        '              LOC.COD_EMPRESA = CL.COD_EMPRESA'
        '        left join SETOR SR on SR.COD_SETOR = LOC.COD_SETOR and'
        '              SR.COD_EMPRESA = LOC.COD_EMPRESA'
        '        left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        '        where CL.COD_CLIENTE = :ACOD_CLIENTE and'
        '              CL.COD_EMPRESA = :ACOD_EMPRESA and'
        '              AD.SEQID = :ADEST_SEQID'
        
          '        into :COD_CLIENTE, :COD_EMPRESA, :NOME_CLIENTE, :RAZAO, ' +
          ':CPFCGC, :INSC_EST, :DEST_SEQID, :TIPO_END, :LOGRADOURO,'
        
          '             :NUMERO, :BAIRRO, :CEP, :COMPLEMENTO, :CIDADE, :UF,' +
          ' :TELEFONE, :EMAIL, :LOCALIDADE, :SETOR, :COD_CIDADE,'
        
          '             :COD_LOCALIDADE, :ATIVO, :INDIEDEST, :IDESTRANGEIRO' +
          ', :ISUF, :IM, :CMUN, :CPAIS, :XPAIS, :ZFM_ALC'
        '    do'
        '    begin'
        '      suspend;'
        '    end'
        ''
        '  if (coalesce(ACOD_CIDADE, 0) > 0) then'
        
          '    for select CL.COD_CLIENTE, CL.COD_EMPRESA, CL.NOME_CLIENTE, ' +
          'CL.RAZAO, CL.CPFCGC, CL.INSC_EST, 0 DEST_SEQID,'
        
          '               '#39'Principal'#39' TIPO_END, CL.ENDERECO LOGRADOURO, CL.' +
          'NUM_END_CLIENTE NUMERO, CL.BAIRRO BAIRRO, CL.CEP,'
        
          '               CL.COMPLEMENTO, CL.CIDADE, ES.SIGLA_UF UF, CL.FON' +
          'E_CLIENTE TELEFONE, CL.EMAIL, LOC.LOCALIDADE, SR.SETOR,'
        
          '               CL.COD_CIDADE, CL.COD_LOCALIDADE, CL.ATIVO, CL.NF' +
          'E_INDIEDEST, CL.NFE_IDESTRANGEIRO, null ISUF,'
        
          '               CL.INSC_MUNICIPAL, CI.IBGE_COD_CIDADE, CL.COD_PAI' +
          'S, PA.NOME_PAIS, IBGE.ZFM_ALC'
        '        from CLIENTES CL'
        '        left join CIDADES CI on CI.COD_CIDADE = CL.COD_CIDADE   '
        
          '        left join CIDADES_IBGE IBGE ON IBGE.CODIGO_MUN_IBGE = CI' +
          '.IBGE_COD_CIDADE'
        '        left join PAISES PA on PA.COD_PAIS = CL.COD_PAIS'
        
          '        left join LOCALIDADE LOC on LOC.COD_LOCALIDADE = CL.COD_' +
          'LOCALIDADE and'
        '              LOC.COD_EMPRESA = CL.COD_EMPRESA'
        '        left join SETOR SR on SR.COD_SETOR = LOC.COD_SETOR and'
        '              SR.COD_EMPRESA = LOC.COD_EMPRESA'
        '        left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        ''
        '        where CL.COD_CIDADE = :ACOD_CIDADE and'
        '              CL.COD_EMPRESA = :ACOD_EMPRESA'
        '        union'
        
          '        select distinct CL.COD_CLIENTE, CL.COD_EMPRESA, CL.NOME_' +
          'CLIENTE, CL.RAZAO, CL.CPFCGC, AD.INSC_EST,'
        
          '                        AD.SEQID DEST_SEQID, AD.TIPO TIPO_END, A' +
          'D.XLGR LOGRADOURO, AD.NRO NUMERO, AD.XBAIRRO BAIRRO,'
        
          '                        AD.CEP, AD.XCPL COMPLEMENTO, AD.XMUN CID' +
          'ADE, AD.UF, AD.FONE TELEFONE, AD.EMAIL, LOC.LOCALIDADE,'
        
          '                        SR.SETOR, AD.COD_CIDADE, AD.COD_LOCALIDA' +
          'DE, AD.ATIVO, AD.INDIEDEST, AD.IDESTRANGEIRO, AD.ISUF,'
        
          '                        AD.IM, AD.CMUN, AD.CPAIS, AD.XPAIS, IBGE' +
          '.ZFM_ALC'
        '        from CLIENTES_END_DOC_ADD AD'
        
          '        inner join CLIENTES CL on CL.COD_CLIENTE = AD.COD_CLIENT' +
          'E and'
        '              CL.COD_EMPRESA = AD.COD_EMPRESA    '
        
          '        left join CIDADES_IBGE IBGE ON IBGE.CODIGO_MUN_IBGE = AD' +
          '.CMUN'
        
          '        left join LOCALIDADE LOC on LOC.COD_LOCALIDADE = AD.COD_' +
          'LOCALIDADE and'
        '              LOC.COD_EMPRESA = CL.COD_EMPRESA'
        '        left join SETOR SR on SR.COD_SETOR = LOC.COD_SETOR and'
        '              SR.COD_EMPRESA = LOC.COD_EMPRESA'
        '        left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        '        where AD.COD_CIDADE = :ACOD_CIDADE and'
        '              AD.COD_EMPRESA = :ACOD_EMPRESA'
        
          '        into :COD_CLIENTE, :COD_EMPRESA, :NOME_CLIENTE, :RAZAO, ' +
          ':CPFCGC, :INSC_EST, :DEST_SEQID, :TIPO_END, :LOGRADOURO,'
        
          '             :NUMERO, :BAIRRO, :CEP, :COMPLEMENTO, :CIDADE, :UF,' +
          ' :TELEFONE, :EMAIL, :LOCALIDADE, :SETOR, :COD_CIDADE,'
        
          '             :COD_LOCALIDADE, :ATIVO, :INDIEDEST, :IDESTRANGEIRO' +
          ', :ISUF, :IM, :CMUN, :CPAIS, :XPAIS, :ZFM_ALC'
        '    do'
        '    begin'
        '      suspend;'
        '    end'
        ''
        '  if (coalesce(ACOD_LOCALIDADE, 0) > 0) then'
        
          '    for select CL.COD_CLIENTE, CL.COD_EMPRESA, CL.NOME_CLIENTE, ' +
          'CL.RAZAO, CL.CPFCGC, CL.INSC_EST, 0 DEST_SEQID,'
        
          '               '#39'Principal'#39' TIPO_END, CL.ENDERECO LOGRADOURO, CL.' +
          'NUM_END_CLIENTE NUMERO, CL.BAIRRO BAIRRO, CL.CEP,'
        
          '               CL.COMPLEMENTO, CL.CIDADE, ES.SIGLA_UF UF, CL.FON' +
          'E_CLIENTE TELEFONE, CL.EMAIL, LOC.LOCALIDADE, SR.SETOR,'
        
          '               CL.COD_CIDADE, CL.COD_LOCALIDADE, CL.ATIVO, CL.NF' +
          'E_INDIEDEST, CL.NFE_IDESTRANGEIRO, null ISUF,'
        
          '               CL.INSC_MUNICIPAL, CI.IBGE_COD_CIDADE, CL.COD_PAI' +
          'S, PA.NOME_PAIS, IBGE.ZFM_ALC'
        '        from CLIENTES CL'
        
          '        left join CIDADES CI on CI.COD_CIDADE = CL.COD_CIDADE   ' +
          '    '
        
          '        left join CIDADES_IBGE IBGE ON IBGE.CODIGO_MUN_IBGE = CI' +
          '.IBGE_COD_CIDADE'
        '        left join PAISES PA on PA.COD_PAIS = CL.COD_PAIS'
        
          '        left join LOCALIDADE LOC on LOC.COD_LOCALIDADE = CL.COD_' +
          'LOCALIDADE and'
        '              LOC.COD_EMPRESA = CL.COD_EMPRESA'
        '        left join SETOR SR on SR.COD_SETOR = LOC.COD_SETOR and'
        '              SR.COD_EMPRESA = LOC.COD_EMPRESA'
        '        left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        ''
        '        where CL.COD_LOCALIDADE = :ACOD_LOCALIDADE and'
        '              CL.COD_EMPRESA = :ACOD_EMPRESA'
        '        union'
        
          '        select distinct CL.COD_CLIENTE, CL.COD_EMPRESA, CL.NOME_' +
          'CLIENTE, CL.RAZAO, CL.CPFCGC, AD.INSC_EST,'
        
          '                        AD.SEQID DEST_SEQID, AD.TIPO TIPO_END, A' +
          'D.XLGR LOGRADOURO, AD.NRO NUMERO, AD.XBAIRRO BAIRRO,'
        
          '                        AD.CEP, AD.XCPL COMPLEMENTO, AD.XMUN CID' +
          'ADE, AD.UF, AD.FONE TELEFONE, AD.EMAIL, LOC.LOCALIDADE,'
        
          '                        SR.SETOR, AD.COD_CIDADE, AD.COD_LOCALIDA' +
          'DE, AD.ATIVO, AD.INDIEDEST, AD.IDESTRANGEIRO, AD.ISUF,'
        
          '                        AD.IM, AD.CMUN, AD.CPAIS, AD.XPAIS, IBGE' +
          '.ZFM_ALC'
        '        from LOCALIDADE LOC'
        
          '        inner join CLIENTES_END_DOC_ADD AD on AD.COD_LOCALIDADE ' +
          '= LOC.COD_LOCALIDADE and'
        '              AD.COD_EMPRESA = LOC.COD_EMPRESA     '
        
          '        left join CIDADES_IBGE IBGE ON IBGE.CODIGO_MUN_IBGE = AD' +
          '.CMUN'
        
          '        inner join CLIENTES CL on CL.COD_CLIENTE = AD.COD_CLIENT' +
          'E and'
        '              CL.COD_EMPRESA = AD.COD_EMPRESA'
        '        left join SETOR SR on SR.COD_SETOR = LOC.COD_SETOR and'
        '              SR.COD_EMPRESA = LOC.COD_EMPRESA'
        '        left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        '        where LOC.COD_LOCALIDADE = :ACOD_LOCALIDADE and'
        '              LOC.COD_EMPRESA = :ACOD_EMPRESA'
        
          '        into :COD_CLIENTE, :COD_EMPRESA, :NOME_CLIENTE, :RAZAO, ' +
          ':CPFCGC, :INSC_EST, :DEST_SEQID, :TIPO_END, :LOGRADOURO,'
        
          '             :NUMERO, :BAIRRO, :CEP, :COMPLEMENTO, :CIDADE, :UF,' +
          ' :TELEFONE, :EMAIL, :LOCALIDADE, :SETOR, :COD_CIDADE,'
        
          '             :COD_LOCALIDADE, :ATIVO, :INDIEDEST, :IDESTRANGEIRO' +
          ', :ISUF, :IM, :CMUN, :CPAIS, :XPAIS, :ZFM_ALC'
        '    do'
        '    begin'
        '      suspend;'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'SUG022'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR SUGESTAO DE COMPRA'#39', 10, '#39'S'#39', '#39'FRMSUGESTAOCOMPRA'#39', 1, '#39 +
          'N'#39', NULL);'
        ''
        '|BLOCO|'
        'CREATE TABLE ALIQ_ANT_ST ('
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    UF_ORIGEM    CHAR(2) NOT NULL,'
        '    UF_DESTINO   CHAR(2) NOT NULL,'
        '    CEST         VARCHAR(7),'
        '    NCM          VARCHAR(8),'
        '    ALIQUOTA     T_VL_TODOS'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE ALIQ_ANT_ST ADD CONSTRAINT PK_ALIQ_ANT_ST PRIMARY KE' +
          'Y (ID, COD_EMPRESA);'
        
          'CREATE INDEX ALIQ_ANT_ST_IDX ON ALIQ_ANT_ST (UF_ORIGEM, UF_DESTI' +
          'NO, COD_EMPRESA, CEST, NCM);'
        
          'CREATE INDEX ALIQ_ANT_ST_IDX_CEST ON ALIQ_ANT_ST (UF_ORIGEM, UF_' +
          'DESTINO, COD_EMPRESA, CEST);'
        
          'CREATE INDEX ALIQ_ANT_ST_IDX_NCM ON ALIQ_ANT_ST (UF_ORIGEM, UF_D' +
          'ESTINO, COD_EMPRESA, NCM);'
        ''
        '|BLOCO|'
        'create or alter procedure GETQTDEITENSPEDIDO ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_GRADE integer,'
        '    PCOD_EMPRESA varchar(50))'
        'returns ('
        '    QTDEITEMPEDIDO double precision)'
        'as'
        'begin'
        '  execute statement'
        '    '#39' select sum(coalesce(it.quant_it_prod, 0)) as qtdItemPedido'
        '      from item_pedido it'
        
          '      inner join pedido pd on it.num_ped = pd.num_ped and it.cod' +
          '_empresa = pd.cod_empresa'
        '      where it.grupo_prod = '#39'||:pgrupo_prod||'#39
        '      and it.cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        
          '      and coalesce(it.cod_emp_mult, it.cod_empresa) in ('#39#39#39'||:pc' +
          'od_empresa||'#39#39#39')'
        '      and pd.status_ped  = '#39#39'EFETIVADO'#39#39
        '      and pd.ativo = 1'
        '      and coalesce(it.recebido, '#39#39'N'#39#39') = '#39#39'N'#39#39' '#39'||'
        
          '      iif(:pcod_grade > 0, '#39' and it.cod_grade = '#39'|| :pcod_grade,' +
          ' '#39#39')'
        '      into: qtdeitempedido;'
        ''
        '  qtdeitempedido = coalesce(qtdeitempedido, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETQTDEITENSPEDIDOREC ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_GRADE integer,'
        '    PCOD_EMPRESA varchar(50))'
        'returns ('
        '    QTDEITEMPEDIDOREC double precision)'
        'as'
        'begin'
        '  execute statement'
        
          '    '#39' select sum(distinct(coalesce(ir.qtde_recebida,0))) qtdeRec' +
          'ebida'
        '      from item_pedido it'
        
          '      inner join pedido pd on it.num_ped = pd.num_ped and it.cod' +
          '_empresa = pd.cod_empresa'
        '      left join item_pedido_nf_rec ir on ir.num_ped = it.num_ped'
        
          '      and ir.grupo_prod = it.grupo_prod and ir.cod_prod = it.cod' +
          '_prod'
        
          '      and ir.cod_empresa = it.cod_empresa and ir.nitem = it.nite' +
          'm'
        '      where it.grupo_prod = '#39'||:pgrupo_prod||'#39
        '      and it.cod_prod = '#39#39#39'||:pcod_prod||'#39#39#39
        
          '      and coalesce(it.cod_emp_mult, it.cod_empresa) in ('#39#39#39'||:pc' +
          'od_empresa||'#39#39#39')'
        '      and pd.status_ped  = '#39#39'EFETIVADO'#39#39
        '      and pd.ativo = 1'
        '      and coalesce(it.recebido, '#39#39'N'#39#39') = '#39#39'N'#39#39' '#39' ||'
        
          '      iif(:pcod_grade > 0, '#39' and it.cod_grade = '#39'|| :pcod_grade,' +
          ' '#39#39')'
        '      into qtdeitempedidorec;'
        ''
        '  qtdeitempedidorec = coalesce(qtdeitempedidorec, 0);'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter view SERVICOS_EMP'
        '('
        '    COD_SERVICO,'
        '    COD_EMPRESA,'
        '    VALOR_SERVICO,'
        '    DESC_SERVICO,'
        '    SHONDA,'
        '    ALTCOD,'
        '    DATA_CAD_TIPO,'
        '    DATA_MOD_TIPO,'
        '    STIPO,'
        '    TMO,'
        '    ALIQ_ISS,'
        '    ATIVO,'
        '    COD_ESPE_SEG,'
        '    CODIGO_NOP,'
        '    TMOSERVSIMULT,'
        '    ALT_DESC,'
        '    SERV_PROP_TERC,'
        '    ISENTO_SERV,'
        '    N_INCIDENCIA_SERV,'
        '    ARREDONDAR_TRUNCAR,'
        '    CLASSE_SERV,'
        '    CLASSE_QTD,'
        '    CLASSE_POP,'
        '    CLASSE_ATL,'
        '    DMD'
        ')'
        'as'
        'SELECT'
        'TIPO_SERVICO.COD_SERVICO,'
        'TIPO_SERVICO_EMPRESA.COD_EMPRESA,'
        'TIPO_SERVICO.VALOR_SERVICO,'
        'TIPO_SERVICO.DESC_SERVICO,'
        'TIPO_SERVICO.SHONDA,'
        'TIPO_SERVICO.ALTCOD,'
        'TIPO_SERVICO.DATA_CAD_TIPO,'
        'TIPO_SERVICO.DATA_MOD_TIPO,'
        'TIPO_SERVICO.STIPO,'
        'TIPO_SERVICO.TMO,'
        'TIPO_SERVICO.ALIQ_ISS,'
        'TIPO_SERVICO.ATIVO,'
        'TIPO_SERVICO.COD_ESPE_SEG,'
        'TIPO_SERVICO.CODIGO_NOP,'
        'TIPO_SERVICO.TMOSERVSIMULT,'
        'TIPO_SERVICO.ALT_DESC,'
        'TIPO_SERVICO.SERV_PROP_TERC,'
        'TIPO_SERVICO.ISENTO_SERV,'
        'TIPO_SERVICO.N_INCIDENCIA_SERV,'
        'TIPO_SERVICO.ARREDONDAR_TRUNCAR,'
        'TIPO_SERVICO.CLASSE_SERV,'
        'TIPO_SERVICO.CLASSE_QTD,'
        'TIPO_SERVICO.CLASSE_POP,'
        'TIPO_SERVICO.CLASSE_ATL,'
        'TIPO_SERVICO.DMD'
        'FROM TIPO_SERVICO'
        'LEFT JOIN TIPO_SERVICO_EMPRESA ON'
        '    TIPO_SERVICO_EMPRESA.COD_SERVICO = TIPO_SERVICO.COD_SERVICO;'
        '|/BLOCO|'
        ''
        'ALTER TABLE P_CONTAS ADD RATEIO_EMPRESA CHAR(1);'
        
          'ALTER TABLE COBREBEM ADD LICENCA BLOB SUB_TYPE 1 SEGMENT SIZE 10' +
          '24;'
        
          'ALTER TABLE COBREBEM ADD LOGOTIPO BLOB SUB_TYPE 1 SEGMENT SIZE 1' +
          '024;'
        
          'ALTER TABLE COBREBEM ADD LOGOBANCO BLOB SUB_TYPE 1 SEGMENT SIZE ' +
          '1024;'
        
          'ALTER TABLE COBREBEM ADD CODBARRAS_A BLOB SUB_TYPE 1 SEGMENT SIZ' +
          'E 1024;'
        
          'ALTER TABLE COBREBEM ADD CODBARRAS_B BLOB SUB_TYPE 1 SEGMENT SIZ' +
          'E 1024;'
        
          'ALTER TABLE COBREBEM ADD CODBARRAS_C BLOB SUB_TYPE 1 SEGMENT SIZ' +
          'E 1024;'
        
          'ALTER TABLE COBREBEM ADD CODBARRAS_D BLOB SUB_TYPE 1 SEGMENT SIZ' +
          'E 1024;'
        ''
        '|BLOCO|'
        'CREATE TABLE ARQ_BOLETO ('
        '    SEQID          BIGINT NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    COD_COBREBEM   INTEGER NOT NULL,'
        #9'TIPO           VARCHAR(10) NOT NULL,'
        '    DESCRICAO_ARQ  VARCHAR(50) NOT NULL,    '
        '    DOC            BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
        '    DATA_HORA      TIMESTAMP'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE ARQ_BOLETO ADD CONSTRAINT PK_ARQ_BOLETO PRIMARY KEY ' +
          '(SEQID, COD_EMPRESA, TIPO);'
        
          'CREATE INDEX IDX_ARQ_BOLETO_ARQ ON ARQ_BOLETO (COD_EMPRESA, TIPO' +
          ');'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_ARQ_BOLETO_DATA FOR ARQ_BOLETO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        '  declare variable current_t timestamp;'
        '  declare variable current_d timestamp;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        ''
        '  if (new.data_hora is null) then'
        '  begin'
        
          '    select current_d, current_t from sp_current_ts(new.cod_empre' +
          'sa) into :current_d, :current_t;'
        '    new.data_hora = :current_t;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD)  VALUES ('#39'COB010'#39', :COD_EMPRESA, '#39'E' +
          'XPORTAR LICENCA COBREBEM DO BANCO P/ COMPUTADOR'#39', 3, '#39'S'#39', '#39'FRMCA' +
          'DCOBREBEM'#39', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD)  VALUES ('#39'COB011'#39', :COD_EMPRESA, '#39'E' +
          'XPORTAR LOGOTIPO COBREBEM DO BANCO P/ COMPUTADOR'#39', 3, '#39'S'#39', '#39'FRMC' +
          'ADCOBREBEM'#39', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD)  VALUES ('#39'COB012'#39', :COD_EMPRESA, '#39'B' +
          'T PESQUISAR ARQUIVOS BOLETO'#39', 3, '#39'N'#39', '#39'FRMARQUIVOSBOLETO'#39', 1, '#39'N' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD)  VALUES ('#39'COB013'#39', :COD_EMPRESA, '#39'B' +
          'T EXPORTAR ARQUIVOS BOLETO'#39', 3, '#39'S'#39', '#39'FRMARQUIVOSBOLETO'#39', 1, '#39'N'#39 +
          ', CURRENT_DATE);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ALIQ_ANT_ST T_VL_TODOS;'
        
          'ALTER TABLE NOTAFISCAL_ITEM ADD ESPELHO_CALC BLOB SUB_TYPE 1 SEG' +
          'MENT SIZE 64;'
        ''
        '|BLOCO|'
        'create or alter procedure GETCREDITOSQUITADOS ('
        '    PNSU varchar(20),'
        '    PNPARCELA integer,'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    COD_CRED integer,'
        '    CODIGO_EMP integer)'
        'as'
        'begin'
        '  execute statement'
        
          '   '#39'select first 1 cc.cod_cred, cc.codigo_emp from controle_cred' +
          'itos cc'
        '   where cc.n_docnsu_adm = '#39#39#39'||:pnsu || '#39#39#39
        '    and coalesce(cc.nparcela, 1) = '#39'||:pnparcela||'#39
        '    and cc.cod_emp_mult = '#39'||:pcod_empresa||'#39
        '    and cc.datq_c is not null'#39
        '    into :cod_cred, :codigo_emp;'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETCREDITOSEMABERTO ('
        '    PNSU varchar(20),'
        '    PNPARCELA integer,'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    COD_CRED integer,'
        '    CODIGO_EMP integer,'
        '    QTDE_REG integer)'
        'as'
        'begin'
        '  execute statement'
        
          '   '#39'select first 1 min(cc.cod_cred) cod_cred, min(cc.codigo_emp)' +
          ' codigo_emp, count(*) qtde_reg from controle_creditos cc'
        '    where cc.n_docnsu_adm = '#39#39#39'||:pnsu || '#39#39#39
        '    and coalesce(cc.nparcela, 1) = '#39'||:pnparcela||'#39
        '    and cc.cod_emp_mult = '#39'||:pcod_empresa||'#39
        '    and cc.datq_c is null'#39
        '    into :cod_cred, :codigo_emp, :qtde_reg;'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_CRED_DIV_DTVALOR('
        '    DATE_,'
        '    ID,'
        '    COD_CRED,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    N_DOCNSU_ADM,'
        '    N_AUT_CART,'
        '    NPARCELA,'
        '    QTDE_PARC,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATQ_C,'
        '    STATUS_C,'
        '    TAXA_CRED,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANCEIRA_ADM,'
        '    NOME_C,'
        '    IDENTIFICACAO_EMP)'
        'AS'
        
          'select cf.date_, cf.id, cc.cod_cred, cc.codigo_emp, cc.cod_emp_m' +
          'ult, '
        'cc.data_rec_c, cc.data_venc_c, '
        'cc.n_docnsu_adm, cc.n_aut_cart, '
        'cc.nparcela, cc.qtde_parc, '
        'cc.codigo_ctrl, ctrl.nome_ctrl, '
        'cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        'cc.valor_c, cc.valor_liquido, cc.valor_original,'
        'cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente, '
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, '
        'cc.nome_c, emp.identificacao_emp from controle_creditos cc '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'inner join conciliacao_financeiro cf on '
        '    cf.nsu = cc.n_docnsu_adm '
        
          '    and coalesce(cf.installment_number, 1) = coalesce(cc.nparcel' +
          'a, 1)'
        '    and cf.cod_empresa = cc.cod_emp_mult '
        'inner join empresa emp on '
        '    emp.cod_empresa = cc.cod_emp_mult '
        'inner join controles ctrl on '
        '   ctrl.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl.codigo_emp = cc.cod_emp_mult '
        '    and ctrl.tp_plano = '#39'C'#39' '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'where cc.datq_c is null'
        'and cc.data_venc_c is not null '
        'and cc.data_venc_c < cf.date_  '
        'and coalesce(cc.n_docnsu_adm, '#39#39') <> '#39#39' '
        'and coalesce(cc.n_aut_cart, '#39#39') <> '#39#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_FINANCEIRO('
        '    DATE_,'
        '    ID,'
        '    COD_EMPRESA,'
        '    NSU,'
        '    AUTHORIZATION_NUMBER,'
        '    TYPE_,'
        '    TYPE_DESCRIPTION,'
        '    ACQUIRER_ID,'
        '    ACQUIRER_NAME,'
        '    BRAND_ID,'
        '    BRAND_NAME,'
        '    EVENT_TYPE,'
        '    EVENT_TYPE_DESCRIPTION,'
        '    DESCRIPTION,'
        '    BANK_RECON_STATUS,'
        '    BANK_RECON_DESCRIPTION,'
        '    GROSS_AMOUNT,'
        '    EVENT_NET_AMOUNT,'
        '    BATCH_NET_AMOUNT,'
        '    TAX,'
        '    SALE_TAX,'
        '    CUSTOMER_TAX,'
        '    INSTALLMENT_NUMBER,'
        '    INSTALLMENTS_TOTAL,'
        '    BANK_NUMBER,'
        '    BANK_NAME,'
        '    BRANCH_NUMBER,'
        '    ACCOUNT_NUMBER,'
        '    IDENTIFICACAO_EMP,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    CODIGO_CTRL_TX,'
        '    NOME_CTRL_TX,'
        '    N_CONTA_PLC_TX_CARTAO,'
        '    N_CONTA_PLC_TARIFA_CARTAO,'
        '    N_CONTA_PLC,'
        '    DESC_PLC,'
        '    COD_CRED,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    STATUS_C,'
        '    DATQ_C,'
        '    TAXA_CRED,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANDEIRA_ADM,'
        '    QTDE_REG)'
        'AS'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        'cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description, '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, '
        'ctrl2.n_conta_plc_tx_cartao, ctrl2.n_conta_plc_tarifa_cartao, '
        'cc.n_conta_plc, p.desc_plc, '
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.status_c, cc.datq_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, credq.qtde_reg '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        
          'left join getcreditosemaberto(cf.nsu, coalesce(cf.installment_nu' +
          'mber, 1), cf.cod_empresa) credq on 1 = 1'
        'inner join controle_creditos cc on'
        '    cc.cod_cred = credq.cod_cred'
        '    and cc.codigo_emp = credq.codigo_emp'
        'left join terminal_cartao termc on'
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join controles ctrl2 on '
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl2.codigo_emp = cc.codigo_emp '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = cc.n_conta_plc '
        'where trim(cf.event_type_description) = '#39'Venda'#39
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        '    cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description, '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, '
        'ctrl2.n_conta_plc_tx_cartao, ctrl2.n_conta_plc_tarifa_cartao, '
        'cc.n_conta_plc, p.desc_plc, '
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.status_c, cc.datq_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, credq.qtde_reg '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        
          'left join getcreditosemaberto(cf.nsu, coalesce(cf.installment_nu' +
          'mber, 1), cf.cod_empresa) credq on 1 = 1'
        'inner join controle_creditos cc on'
        '    cc.cod_cred = credq.cod_cred'
        '    and cc.codigo_emp = credq.codigo_emp'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join controles ctrl2 on '
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl2.codigo_emp = cc.codigo_emp '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = cc.n_conta_plc '
        'where trim(cf.event_type_description) like '#39'Antecipa%'#39
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,  '
        '    cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description, '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, '
        'ctrl2.n_conta_plc_tx_cartao, ctrl2.n_conta_plc_tarifa_cartao, '
        'null n_conta_plc, null desc_plc, '
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original,  cc.data_rec_c,' +
          ' cc.data_venc_c, cc.status_c, cc.datq_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, credq.qtde_reg'
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        
          'left join getcreditosemaberto(cf.nsu, coalesce(cf.installment_nu' +
          'mber, 1), cf.cod_empresa) credq on 1 = 1'
        'inner join controle_creditos cc on'
        '    cc.cod_cred = credq.cod_cred'
        '    and cc.codigo_emp = credq.codigo_emp'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join controles ctrl2 on '
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl2.codigo_emp = cc.codigo_emp '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        
          'where trim(cf.event_type_description) in ('#39'Cancelamento'#39', '#39'Charg' +
          'eBack'#39')'
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,  '
        'cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description    , '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        'null codigo_ctrl_tx, null nome_ctrl_tx, '
        'null n_conta_plc_tx_cartao, null n_conta_plc_tarifa_cartao, '
        'ct.n_conta_plc, p.desc_plc, '
        'null cod_cred, null n_doc_v, null n_doc_c, null tp_doc_v, '
        
          'null valor_c, null valor_liquido, null valor_original, null data' +
          '_rec_c, null data_venc_c, null status_c, null datq_c, null taxa_' +
          'cred,'
        'null cod_cliente, null nome_cliente, '
        
          'null cod_terminal_adm, null desc_term_adm, null cod_adm, null de' +
          'scricao_adm, '
        'null cod_bandeira_adm, null descricao, null qtde_reg'
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = ct.n_conta_plc '
        
          'where trim(cf.event_type_description) = '#39'Ajuste'#39' and coalesce(cf' +
          '.event_net_amount, 0) >= 0'
        'and (select count(*) from lancamentos lanc '
        '     where lanc.id_financ_confere = cf.id'
        '     and lanc.cod_emp_mult = cf.cod_empresa) = 0'
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,  '
        'cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description    , '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        'null codigo_ctrl_tx, null nome_ctrl_tx, '
        'null n_conta_plc_tx_cartao, null n_conta_plc_tarifa_cartao, '
        'ct.n_conta_plc, p.desc_plc, '
        'null cod_cred, null n_doc_v, null n_doc_c, null tp_doc_v, '
        
          'null valor_c, null valor_liquido, null valor_original, null data' +
          '_rec_c, null data_venc_c, null status_c, null datq_c, null taxa_' +
          'cred,'
        'null cod_cliente, null nome_cliente, '
        
          'null cod_terminal_adm, null desc_term_adm, null cod_adm, null de' +
          'scricao_adm, '
        'null cod_bandeira_adm, null descricao, null qtde_reg'
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = ct.n_conta_plc '
        
          'where trim(cf.event_type_description) = '#39'Ajuste'#39' and coalesce(cf' +
          '.event_net_amount, 0) < 0'
        'and (select count(*) from contas_a_pagar ctp '
        '     where ctp.id_financ_confere = cf.id'
        '     and ctp.cod_emp_mult = cf.cod_empresa) = 0;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_FINANCEIRO_REC('
        '    DATE_,'
        '    ID,'
        '    COD_EMPRESA,'
        '    NSU,'
        '    AUTHORIZATION_NUMBER,'
        '    TYPE_,'
        '    TYPE_DESCRIPTION,'
        '    ACQUIRER_ID,'
        '    ACQUIRER_NAME,'
        '    BRAND_ID,'
        '    BRAND_NAME,'
        '    EVENT_TYPE,'
        '    EVENT_TYPE_DESCRIPTION,'
        '    DESCRIPTION,'
        '    BANK_RECON_STATUS,'
        '    BANK_RECON_DESCRIPTION,'
        '    GROSS_AMOUNT,'
        '    EVENT_NET_AMOUNT,'
        '    BATCH_NET_AMOUNT,'
        '    TAX,'
        '    SALE_TAX,'
        '    CUSTOMER_TAX,'
        '    INSTALLMENT_NUMBER,'
        '    INSTALLMENTS_TOTAL,'
        '    BANK_NUMBER,'
        '    BANK_NAME,'
        '    BRANCH_NUMBER,'
        '    ACCOUNT_NUMBER,'
        '    IDENTIFICACAO_EMP,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    CODIGO_CTRL_TX,'
        '    NOME_CTRL_TX,'
        '    N_CONTA_PLC_TX_CARTAO,'
        '    N_CONTA_PLC_TARIFA_CARTAO,'
        '    N_CONTA_PLC,'
        '    DESC_PLC,'
        '    COD_CRED,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    STATUS_C,'
        '    DATQ_C,'
        '    TAXA_CRED,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANDEIRA_ADM)'
        'AS'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        'cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description, '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, '
        'ctrl2.n_conta_plc_tx_cartao, ctrl2.n_conta_plc_tarifa_cartao, '
        'cc.n_conta_plc, p.desc_plc, '
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.status_c, cc.datq_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        
          'left join getcreditosquitados(cf.nsu, coalesce(cf.installment_nu' +
          'mber, 1), cf.cod_empresa) credq on 1 = 1'
        'inner join controle_creditos cc on'
        '    cc.cod_cred = credq.cod_cred'
        '    and cc.codigo_emp = credq.codigo_emp'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join controles ctrl2 on '
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl2.codigo_emp = cc.codigo_emp '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = cc.n_conta_plc '
        'where trim(cf.event_type_description) = '#39'Venda'#39
        'union '
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        '    cf.type_, cf.type_description, '
        'cf.acquirer_id, cf.acquirer_name, '
        'cf.brand_id, cf.brand_name, '
        'cf.event_type, cf.event_type_description, '
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description, '
        'cf.bank_recon_status, '
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description, '
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '      when (((select result from pos('#39'dito'#39', trim(cf.description' +
          '))) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax, '
        'cf.installment_number, cf.installments_total, '
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r, '
        'emp.identificacao_emp, '
        'ctrl.codigo_ctrl, ctrl.nome_ctrl, '
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, '
        'ctrl2.n_conta_plc_tx_cartao, ctrl2.n_conta_plc_tarifa_cartao, '
        'cc.n_conta_plc, p.desc_plc, '
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.status_c, cc.datq_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao '
        'from conciliacao_financeiro cf '
        'inner join empresa emp on '
        '    emp.cod_empresa = cf.cod_empresa'
        
          'left join getcreditosquitados(cf.nsu, coalesce(cf.installment_nu' +
          'mber, 1), cf.cod_empresa) credq on 1 = 1'
        'inner join controle_creditos cc on'
        '    cc.cod_cred = credq.cod_cred'
        '    and cc.codigo_emp = credq.codigo_emp'
        'left join terminal_cartao termc on'
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on '
        '    ctrl.n_conta_ctrl = cf.account_number '
        '    and ctrl.agencia_ctrl = cf.branch_number '
        '    and ctrl.codigo_emp = cf.cod_empresa '
        'left join controles ctrl2 on '
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl2.codigo_emp = cc.codigo_emp '
        'left join conciliacao_descr_tipo ct on '
        '    ct.descricao = cf.description '
        '    and ct.cod_empresa = cf.cod_empresa '
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end) '
        'left join p_contas p on '
        '    p.n_conta_plc = cc.n_conta_plc '
        'where trim(cf.event_type_description) like '#39'Antecipa%'#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_PENDENCIAS_CONF('
        '    DATE_,'
        '    ID,'
        '    COD_EMPRESA,'
        '    NSU,'
        '    AUTHORIZATION_NUMBER,'
        '    TYPE_,'
        '    TYPE_DESCRIPTION,'
        '    ACQUIRER_ID,'
        '    ACQUIRER_NAME,'
        '    BRAND_ID,'
        '    BRAND_NAME,'
        '    EVENT_TYPE,'
        '    EVENT_TYPE_DESCRIPTION,'
        '    DESCRIPTION,'
        '    BANK_RECON_STATUS,'
        '    BANK_RECON_DESCRIPTION,'
        '    GROSS_AMOUNT,'
        '    EVENT_NET_AMOUNT,'
        '    BATCH_NET_AMOUNT,'
        '    TAX,'
        '    SALE_TAX,'
        '    CUSTOMER_TAX,'
        '    INSTALLMENT_NUMBER,'
        '    INSTALLMENTS_TOTAL,'
        '    BANK_NUMBER,'
        '    BANK_NAME,'
        '    BRANCH_NUMBER,'
        '    ACCOUNT_NUMBER,'
        '    IDENTIFICACAO_EMP,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    CODIGO_CTRL_TX,'
        '    NOME_CTRL_TX,'
        '    N_CONTA_PLC_TX_CARTAO,'
        '    N_CONTA_PLC,'
        '    DESC_PLC,'
        '    COD_CRED,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    DATQ_C,'
        '    STATUS_C,'
        '    TAXA_CRED,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANDEIRA_ADM)'
        'AS'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        'cf.type_, cf.type_description,'
        'cf.acquirer_id, cf.acquirer_name,'
        'cf.brand_id, cf.brand_name,'
        'cf.event_type, cf.event_type_description,'
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description,'
        'cf.bank_recon_status,'
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description,'
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax,'
        'cf.installment_number, cf.installments_total,'
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r,'
        'emp.identificacao_emp,'
        'ctrl.codigo_ctrl, ctrl.nome_ctrl,'
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, ctrl2.n_conta_plc_tx_cartao,'
        'cc.n_conta_plc, p.desc_plc,'
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm,'
        
          'cc.cod_bandeira_adm, band.descricao from conciliacao_financeiro ' +
          'cf'
        'inner join empresa emp on'
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu'
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on'
        '    ctrl.n_conta_ctrl = cf.account_number'
        '    and ctrl.agencia_ctrl = cf.branch_number'
        '    and ctrl.codigo_emp = cf.cod_empresa'
        'left join controles ctrl2 on'
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl'
        '    and ctrl2.codigo_emp = cc.codigo_emp'
        'left join conciliacao_descr_tipo ct on'
        '    ct.descricao = cf.description'
        '    and ct.cod_empresa = cf.cod_empresa'
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end)'
        'left join p_contas p on'
        '    p.n_conta_plc = cc.n_conta_plc'
        'where (select count(*) from controle_creditos cc where'
        '       cc.n_docnsu_adm = cf.nsu'
        
          '       and coalesce(cc.nparcela, 1) = coalesce(cf.installment_nu' +
          'mber, 1)'
        '       and cc.cod_emp_mult = cf.cod_empresa) = 0'
        'and trim(cf.event_type_description) = '#39'Venda'#39
        'union'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,'
        'cf.type_, cf.type_description,'
        'cf.acquirer_id, cf.acquirer_name,'
        'cf.brand_id, cf.brand_name,'
        'cf.event_type, cf.event_type_description,'
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description,'
        'cf.bank_recon_status,'
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description,'
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax,'
        'cf.installment_number, cf.installments_total,'
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r,'
        'emp.identificacao_emp,'
        'ctrl.codigo_ctrl, ctrl.nome_ctrl,'
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, ctrl2.n_conta_plc_tx_cartao,'
        'cc.n_conta_plc, p.desc_plc,'
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm,'
        
          'cc.cod_bandeira_adm, band.descricao  from conciliacao_financeiro' +
          ' cf'
        'inner join empresa emp on'
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu'
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on'
        '    ctrl.n_conta_ctrl = cf.account_number'
        '    and ctrl.agencia_ctrl = cf.branch_number'
        '    and ctrl.codigo_emp = cf.cod_empresa'
        'left join controles ctrl2 on'
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl'
        '    and ctrl2.codigo_emp = cc.codigo_emp'
        'left join conciliacao_descr_tipo ct on'
        '    ct.descricao = cf.description'
        '    and ct.cod_empresa = cf.cod_empresa'
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end)'
        'left join p_contas p on'
        '    p.n_conta_plc = cc.n_conta_plc'
        'where (select count(*) from controle_creditos cc where'
        '       cc.n_docnsu_adm = cf.nsu'
        
          '       and coalesce(cc.nparcela, 1) = coalesce(cf.installment_nu' +
          'mber, 1)'
        '       and cc.cod_emp_mult = cf.cod_empresa) = 0'
        
          'and trim(cf.event_type_description) in ('#39'Cancelamento'#39', '#39'Chargeb' +
          'ack'#39')'
        'union'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number,'
        'cf.type_, cf.type_description,'
        'cf.acquirer_id, cf.acquirer_name,'
        'cf.brand_id, cf.brand_name,'
        'cf.event_type, cf.event_type_description,'
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description,'
        'cf.bank_recon_status,'
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description,'
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax,'
        'cf.installment_number, cf.installments_total,'
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r,'
        'emp.identificacao_emp,'
        'ctrl.codigo_ctrl, ctrl.nome_ctrl,'
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, ctrl2.n_conta_plc_tx_cartao,'
        'cc.n_conta_plc, p.desc_plc,'
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm,'
        
          'cc.cod_bandeira_adm, band.descricao from conciliacao_financeiro ' +
          'cf'
        'inner join empresa emp on'
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu'
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on'
        '    ctrl.n_conta_ctrl = cf.account_number'
        '    and ctrl.agencia_ctrl = cf.branch_number'
        '    and ctrl.codigo_emp = cf.cod_empresa'
        'left join controles ctrl2 on'
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl'
        '    and ctrl2.codigo_emp = cc.codigo_emp'
        'left join conciliacao_descr_tipo ct on'
        '    ct.descricao = cf.description'
        '    and ct.cod_empresa = cf.cod_empresa'
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end)'
        'left join p_contas p on'
        '    p.n_conta_plc = cc.n_conta_plc'
        'where (select count(*) from controle_creditos cc where'
        '       cc.n_docnsu_adm = cf.nsu'
        
          '       and coalesce(cc.nparcela, 1) = coalesce(cf.installment_nu' +
          'mber, 1)'
        '       and cc.cod_emp_mult = cf.cod_empresa) = 0'
        
          'and trim(cf.event_type_description) in ('#39'Cancelamento'#39', '#39'Chargeb' +
          'ack'#39')'
        'union'
        
          'select cf.date_, cf.id, cf.cod_empresa, cf.nsu, cf.authorization' +
          '_number, '
        'cf.type_, cf.type_description,'
        'cf.acquirer_id, cf.acquirer_name,'
        'cf.brand_id, cf.brand_name,'
        'cf.event_type, cf.event_type_description,'
        'case when (trim(cf.description) = '#39'CP'#39') then '#39'Credito Parcelado'#39
        '     when (trim(cf.description) = '#39'CV'#39') then '#39'Credito a Vista'#39
        '     when (trim(cf.description) = '#39'DB'#39') then '#39'Debito'#39
        '     when (trim(cf.description) = '#39'BE'#39') then '#39'Beneficio'#39
        '     else cf.description end description,'
        'cf.bank_recon_status,'
        'case when (cf.bank_recon_status = 1) then '#39'Nao Conferido'#39
        
          '     when (cf.bank_recon_status = 2) then '#39'Extrato Bancario pend' +
          'ente'#39
        '     when (cf.bank_recon_status = 3) then '#39'Divergente'#39
        '     when (cf.bank_recon_status = 4) then '#39'Conciliado'#39
        'end bank_recon_description,'
        'coalesce(cf.gross_amount, 0) gross_amount,'
        
          'case when (((select result from pos('#39'dito Parcelado'#39', trim(cf.de' +
          'scription))) > 0) and (coalesce(cf.tax, 0) > 0)) then'
        
          '       round(coalesce(event_net_amount, 0) * (1 - (coalesce(cf.t' +
          'ax, 0) / 100)), 2)'
        
          '     when (((select result from pos('#39'dito'#39', trim(cf.description)' +
          ')) > 0)'
        
          '        and ((select result from pos('#39'Vista'#39', trim(cf.descriptio' +
          'n))) > 0)) then'
        '        coalesce(cf.event_net_amount, 0)'
        '     else'
        
          '        case when (coalesce(cf.batch_net_amount, 0) < coalesce(c' +
          'f.event_net_amount, 0)) then'
        
          '                coalesce(cf.batch_net_amount, cf.event_net_amoun' +
          't)'
        '             else'
        '                coalesce(cf.event_net_amount, 0)'
        '        end'
        'end'
        'event_net_amount,'
        'coalesce(cf.batch_net_amount, 0) batch_net_amount,'
        'cf.tax, cf.sale_tax, cf.customer_tax,'
        'cf.installment_number, cf.installments_total,'
        
          'cf.bank_number, cf.bank_name, cf.branch_number, cf.account_numbe' +
          'r,'
        'emp.identificacao_emp,'
        'ctrl.codigo_ctrl, ctrl.nome_ctrl,'
        
          'ctrl2.codigo_ctrl as codigo_ctrl_tx, ctrl2.nome_ctrl as nome_ctr' +
          'l_tx, ctrl2.n_conta_plc_tx_cartao,'
        'null n_conta_plc, null desc_plc,'
        'cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
        
          'cc.valor_c, cc.valor_liquido, cc.valor_original, cc.data_rec_c, ' +
          'cc.data_venc_c, cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm,'
        
          'cc.cod_bandeira_adm, band.descricao from conciliacao_financeiro ' +
          'cf'
        'inner join empresa emp on'
        '    emp.cod_empresa = cf.cod_empresa'
        'left join controle_creditos cc on'
        '    cc.n_docnsu_adm = cf.nsu '
        
          '    and coalesce(cc.nparcela, 1) = coalesce(cf.installment_numbe' +
          'r, 1)'
        '    and cc.cod_emp_mult = cf.cod_empresa'
        '    and cc.cod_cred is null'
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'left join controles ctrl on'
        '    ctrl.n_conta_ctrl = cf.account_number'
        '    and ctrl.agencia_ctrl = cf.branch_number'
        '    and ctrl.codigo_emp = cf.cod_empresa'
        'left join controles ctrl2 on'
        '    ctrl2.codigo_ctrl = cc.codigo_ctrl'
        '    and ctrl2.codigo_emp = cc.codigo_emp'
        'left join conciliacao_descr_tipo ct on'
        '    ct.descricao = cf.description'
        '    and ct.cod_empresa = cf.cod_empresa'
        
          '    and ct.natureza = (case when (cf.event_net_amount >= 0) then' +
          ' '#39'E'#39' else '#39'S'#39' end)'
        'where (select count(*) from controle_creditos cc where'
        '       cc.n_docnsu_adm = cf.nsu'
        
          '       and coalesce(cc.nparcela, 1) = coalesce(cf.installment_nu' +
          'mber, 1)'
        '       and cc.cod_emp_mult = cf.cod_empresa) = 0'
        'and trim(cf.event_type_description) = '#39'Antecipacao'#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_CONCILIACAO_PENDENCIAS_CRED('
        '    COD_CRED,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    N_DOCNSU_ADM,'
        '    N_AUT_CART,'
        '    NPARCELA,'
        '    QTDE_PARC,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_LIQUIDO,'
        '    VALOR_ORIGINAL,'
        '    DATQ_C,'
        '    STATUS_C,'
        '    TAXA_CRED,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    COD_TERMINAL_ADM,'
        '    DESC_TERM_ADM,'
        '    COD_ADM,'
        '    DESCRICAO_ADM,'
        '    COD_BANDEIRA_ADM,'
        '    DESC_BANDEIRA_ADM,'
        '    NOME_C,'
        '    IDENTIFICACAO_EMP)'
        'AS'
        'select cc.cod_cred, cc.codigo_emp, cc.cod_emp_mult, '
        'cc.data_rec_c, cc.data_venc_c, '
        'cc.n_docnsu_adm, cc.n_aut_cart, '
        'cc.nparcela, cc.qtde_parc, '
        'cc.codigo_ctrl, ctrl.nome_ctrl, '
        'cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        'cc.valor_c, cc.valor_liquido, cc.valor_original,'
        'cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, '
        'cc.nome_c, emp.identificacao_emp from controle_creditos cc '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'inner join empresa emp on '
        '    emp.cod_empresa = cc.cod_emp_mult '
        'inner join controles ctrl on '
        '   ctrl.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl.codigo_emp = cc.cod_emp_mult '
        '    and ctrl.tp_plano = '#39'C'#39' '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '   and band.cod_empresa = cc.cod_emp_mult '
        'where cc.datq_c is null'
        'and coalesce(cc.n_docnsu_adm, '#39#39') <> '#39#39' '
        'and coalesce(cc.n_aut_cart, '#39#39') <> '#39#39' '
        'and (case when ((select count(*) from conciliacao_financeiro cf '
        '                 where cf.nsu = cc.n_docnsu_adm '
        '                 and cf.authorization_number = cc.n_aut_cart'
        
          '                 and coalesce(cf.installment_number, 1) = coales' +
          'ce(cc.nparcela, 1) '
        '                 and cf.cod_empresa = cc.cod_emp_mult) > 0) then'
        
          '                    (select count(*) from conciliacao_financeiro' +
          ' cf '
        '                     where cf.nsu = cc.n_docnsu_adm '
        
          '                     and cf.authorization_number = cc.n_aut_cart' +
          ' '
        
          '                     and coalesce(cf.installment_number, 1) = co' +
          'alesce(cc.nparcela, 1) '
        '                     and cf.cod_empresa = cc.cod_emp_mult) '
        '          else '
        
          '                    (select count(*) from conciliacao_financeiro' +
          ' cf '
        '                    where cf.nsu = cc.n_docnsu_adm '
        
          '                    and coalesce(cf.installment_number, 1) = coa' +
          'lesce(cc.nparcela, 1) '
        '                    and cf.cod_empresa = cc.cod_emp_mult) '
        '    end) = 0 '
        'union '
        'select cc.cod_cred, cc.codigo_emp, cc.cod_emp_mult, '
        'cc.data_rec_c, cc.data_venc_c, '
        'cc.n_docnsu_adm, cc.n_aut_cart, '
        'cc.nparcela, cc.qtde_parc, '
        'cc.codigo_ctrl, ctrl.nome_ctrl, '
        'cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, '
        'cc.valor_c, cc.valor_liquido, cc.valor_original,'
        'cc.datq_c, cc.status_c,'
        
          'case when ((coalesce(cc.valor_original, cc.valor_c) > 0) and (co' +
          'alesce(cc.valor_liquido, 0) > 0) and (coalesce(cc.valor_original' +
          ', cc.valor_c) <> coalesce(cc.valor_liquido, 0))) then'
        
          '        (100 - ((coalesce(cc.valor_original, cc.valor_c, 0) / co' +
          'alesce(cc.valor_c, 0)) * 100))'
        '     else 0'
        'end taxa_cred,'
        'coalesce(cc.cod_cliente, 0) cod_cliente,'
        
          'trim(case when (cc.cod_cliente > 0) then cl.nome_cliente else cc' +
          '.nome_c end) nome_cliente, '
        
          'cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descri' +
          'cao_adm, '
        'cc.cod_bandeira_adm, band.descricao, '
        'cc.nome_c, emp.identificacao_emp from controle_creditos cc '
        'left join clientes cl on '
        '    cl.cod_cliente = cc.cod_cliente '
        '    and cl.cod_empresa = cc.cod_emp_mult '
        'inner join empresa emp on '
        '    emp.cod_empresa = cc.cod_emp_mult '
        'inner join controles ctrl on '
        '    ctrl.codigo_ctrl = cc.codigo_ctrl '
        '    and ctrl.codigo_emp = cc.cod_emp_mult '
        '    and ctrl.tp_plano = '#39'C'#39' '
        'left join terminal_cartao termc on '
        '    termc.cod_term_adm = cc.cod_terminal_adm '
        '    and termc.cod_empresa = cc.cod_emp_mult '
        'left join adm_cartao adm on '
        '    adm.cod_adm = termc.cod_adm '
        '    and adm.cod_empresa = termc.cod_empresa '
        'left join bandeiras_cartao band on '
        '    band.cod_bandeira = cc.cod_bandeira_adm '
        '    and band.cod_empresa = cc.cod_emp_mult '
        'where cc.datq_c is null'
        'and coalesce(cc.n_docnsu_adm, '#39#39') = '#39#39
        'and coalesce(cc.n_aut_cart, '#39#39') = '#39#39';'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NFC041'#39', :COD_EMPRESA, '#39'EMITIR NOVA NFCE COM PENDENCI' +
          'AS DE ENVIO'#39', 10, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NFC042'#39', :COD_EMPRESA, '#39'EMITIR NOVA NFCE COM OUTRAS "' +
          'A CANCELAR" PENDENTE'#39', 100, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NFC043'#39', :COD_EMPRESA, '#39'EMITIR NOVA NFCE COM OUTRAS "' +
          'ENVIANDO" PENDENTE'#39', 100, '#39'S'#39', '#39'S'#39');'
        ''
        '|BLOCO|'
        'CREATE TABLE NFC_EMISSOR_PENDENCIAS ('
        '    COD_EMISSOR    INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    DATA_CADASTRO  TIMESTAMP NOT NULL,'
        '    TIPO           VARCHAR(16) NOT NULL,'
        '    QUANTIDADE     INTEGER NOT NULL,'
        '    PERMITIDO      CHAR(1)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFC_EMISSOR_PENDENCIAS ADD CONSTRAINT PK_NFC_EMISSOR' +
          '_PENDENCIAS PRIMARY KEY (COD_EMISSOR, COD_EMPRESA, DATA_CADASTRO' +
          ', TIPO);'
        
          'ALTER TABLE NFC_EMISSOR_PENDENCIAS ADD CONSTRAINT FK_NFC_EMISSOR' +
          '_PENDENCIAS FOREIGN KEY (COD_EMISSOR, COD_EMPRESA) REFERENCES NF' +
          'C_EMISSOR (COD_EMISSOR, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE CUPOM_DESCONTO_EC ('
        '    ID              INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    CODIGO_CUPOM    VARCHAR(20) NOT NULL,'
        '    DESCONTO_EM     VARCHAR(20),'
        
          '    DESCONTO_VALOR  T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
          'DEFAULT 000000000.00 */,'
        '    UTIL_PER_VAL    CHAR(1) default '#39'N'#39','
        '    DATA_INI_VL     TIMESTAMP,'
        '    DATA_FIM_VL     TIMESTAMP,'
        '    COD_CLIENTE     INTEGER,'
        '    ID_COMMERCE     INTEGER,'
        '    SEQID_EC        BIGINT'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CUPOM_DESCONTO_EC ADD CONSTRAINT PK_CUPOM_DESCONTO_E' +
          'C PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE CUPOM_DESCONTO_EC ADD CONSTRAINT FK_CUPOM_DESCONTO_E' +
          'C_CLIENTES FOREIGN KEY (COD_CLIENTE, COD_EMPRESA) REFERENCES CLI' +
          'ENTES (COD_CLIENTE, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CAS' +
          'CADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI264'#39', :COD_EMPRESA, '#39'HA' +
          'BIL CUPOM DESCONTO CADASTRO SIMPL CLIENTE'#39', 3, '#39'N'#39', '#39'FRMCADCLIEN' +
          'TES'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI265'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO CUPOM DESCONTO CLIENTE'#39', 3, '#39'N'#39', '#39'FRMCADCLIENTES'#39', 1, '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI266'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR CUPOM DESCONTO CLIENTE'#39', 3, '#39'N'#39', '#39'FRMCADCLIENTES'#39', 1, '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI267'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR CUPOM DESCONTO CLIENTE'#39', 3, '#39'N'#39', '#39'FRMCADCLIENTES'#39', 1, '#39'S' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI268'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR CUPOM DESCONTO CLIENTE'#39', 3, '#39'N'#39', '#39'FRMCADCLIENTES'#39', 1, '#39 +
          'S'#39', CURRENT_DATE);'
        'CREATE SEQUENCE SEQ_EC_CUPOM_DESCONTO_EC;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_DTEC_CUPOM_DESCONTO_EC FOR CUPOM_DESC' +
          'ONTO_EC'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;  '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        'begin'
        '  /* Trigger text */'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if ((inserting)or(updating)) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMM' +
          'ERCE;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = OLD.COD_EMPRESA INTO: ECOMM' +
          'ERCE;'
        '  end'
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        
          '    if ((NEW.ID_COMMERCE <= 0) and (COALESCE(ECOMMERCE, 0) <= 0)' +
          ') then'
        '        exit;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '    if ((OLD.ID_COMMERCE <= 0) and (COALESCE(ECOMMERCE, 0) <= 0)' +
          ') then'
        '        exit;'
        '  end'
        ''
        
          '  if ((deleting) or (coalesce(old.codigo_cupom, '#39#39') <> coalesce(' +
          'new.codigo_cupom, '#39#39'))) then'
        '  begin '
        '    if (COALESCE(OLD.ID_COMMERCE, 0) <= 0) then'
        '     exit;'
        ''
        
          '    if (coalesce(old.codigo_cupom, '#39#39') <> coalesce(new.codigo_cu' +
          'pom, '#39#39')) then'
        '     new.ID_COMMERCE = null;'
        ''
        '    SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO :VSEQID;'
        ''
        
          '    INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_HORA_ALT' +
          '_WS, ID_COMMERCE)  '
        '    VALUES(:VSEQID, old.COD_EMPRESA, '#39'CUPOM_DESCONTO_EC'#39', '
        
          '    (select CURRENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), OLD' +
          '.ID_COMMERCE);'
        '  end '
        '  else if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_CUPOM_DESCONTO_EC, 1) F' +
          'ROM RDB$DATABASE);'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_CLIENTES_EC FOR CLIENTES'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        '  DECLARE VARIABLE VSINC_ECOMMERCE VARCHAR(1);'
        '  DECLARE VARIABLE IDCOMMERCE INTEGER; '
        'begin'
        '  /* Trigger text */'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMMER' +
          'CE;'
        ''
        
          '  SELECT CASE WHEN (CUPOM_DESCONTO_EC.ID > 0) THEN '#39'S'#39' ELSE '#39'N'#39' ' +
          'END SINC_ECOMMERCE,'
        '  CLIENTES.ID_COMMERCE FROM CLIENTES'
        '  INNER JOIN CUPOM_DESCONTO_EC ON'
        '    CUPOM_DESCONTO_EC.COD_CLIENTE = CLIENTES.COD_CLIENTE'
        '    AND CUPOM_DESCONTO_EC.COD_EMPRESA = CLIENTES.COD_EMPRESA'
        '    AND CUPOM_DESCONTO_EC.CODIGO_CUPOM = CLIENTES.CPFCGC'
        '  WHERE CLIENTES.COD_CLIENTE = NEW.COD_CLIENTE'
        
          '  AND CLIENTES.COD_EMPRESA = NEW.COD_EMPRESA INTO :VSINC_ECOMMER' +
          'CE, :IDCOMMERCE;'
        ''
        
          '  if ((COALESCE(IDCOMMERCE, 0) <= 0) and (COALESCE(ECOMMERCE, 0)' +
          ' <= 0)) then'
        '    exit;'
        ''
        
          '  if ((updating) and (COALESCE(VSINC_ECOMMERCE, '#39'N'#39') = '#39'S'#39')) the' +
          'n'
        '  begin'
        '      execute statement'
        '       '#39'update cupom_desconto_ec set'
        '          cupom_desconto_ec.cod_cliente = '#39'||new.cod_cliente||'#39','
        '          cupom_desconto_ec.cod_empresa = '#39'||new.cod_empresa||'#39','
        '          cupom_desconto_ec.codigo_cupom = '#39#39#39'||new.cpfcgc||'#39#39#39
        
          '        where cupom_desconto_ec.cod_cliente = '#39'||old.cod_cliente' +
          '||'#39
        
          '        and cupom_desconto_ec.cod_empresa = '#39'||old.cod_empresa||' +
          #39
        
          '        and cupom_desconto_ec.codigo_cupom = '#39#39#39'||old.cpfcgc||'#39#39 +
          #39';'#39';'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_LANCAMENTOS_OCORR ON LANCAMENTOS (COD_OCORRENCI' +
          'A, DATA_OCORRENCIA, CODIGO_EMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN041'#39', :COD_EMPRESA, ' +
          #39'IMPRIMIR RELATORIO (CONCILIACAO CARTAO)'#39', 3, '#39'N'#39', '#39'FRMCONCILIAC' +
          'ARTAOCONFERE'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CREATE INDEX IDX_CONTAS_A_PAGAR_CONF ON CONTAS_A_PAGAR (ID_FINAN' +
          'C_CONFERE, COD_EMP_MULT);'
        
          'CREATE INDEX IDXANCAMENTOS_CONF ON LANCAMENTOS (ID_FINANC_CONFER' +
          'E, COD_EMP_MULT);'
        
          'CREATE INDEX IDX_CONTROLE_CREDITOS_NSUAUT ON CONTROLE_CREDITOS (' +
          'N_DOCNSU_ADM,N_AUT_CART,NPARCELA,COD_EMP_MULT);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_CONTROLE_CREDITOS_AUTNSUAUT FOR CONTR' +
          'OLE_CREDITOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  /* Trigger text */'
        '  if (trim(coalesce(new.n_docnsu_adm, '#39#39')) <> '#39#39') then'
        '    new.n_docnsu_adm = trim(new.n_docnsu_adm);'
        '  if (trim(coalesce(new.n_aut_cart, '#39#39')) <> '#39#39') then'
        '    new.n_aut_cart = trim(new.n_aut_cart);'
        'end;'
        '|/BLOCO|')
    end
  end
end
