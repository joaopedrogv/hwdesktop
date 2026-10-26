inherited frmReestruturaVersao14: TfrmReestruturaVersao14
  Caption = 'frmReestruturaVersao14'
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
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'REC023'#39', :COD_EMPRESA, '#39'BT' +
          ' ENVIAR BOLETO POR EMAIL'#39', 1, '#39'N'#39', '#39'FRMCADRECIBO'#39', 1, '#39'S'#39', CURRE' +
          'NT_DATE);'
        'ALTER TABLE PEDVENDA ADD COD_FATURA INTEGER;'
        'ALTER TABLE RECIBOS ADD COD_LOCACAO INTEGER;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG040'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR UTILIZAR VALES DE LOCACAO'#39', 11, '#39'S'#39', '#39'...'#39', 1, '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI232'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR LANCAMENTOS DE VALE RESGATE'#39', 10, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1,' +
          ' '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RECIBO_PROG_FID ('
        '  CODIGO,'
        '  COD_EMPRESA,'
        '  COD_TAXA_PROG_FID,'
        '  COD_CLIENTE,'
        '  TIPO,'
        '  DESCRICAO,'
        '  VALOR_OP,'
        '  DATA,'
        '  PONTOS,'
        '  NDOC,'
        '  TIPODOC,'
        '  DATA_VENC_PROG,'
        '  PERC_PROG_FID,'
        '  VALOR,'
        '  NOME_CLIENTE,'
        '  RAZAO,'
        '  CPFCGC,'
        '  SIGLA_UF,'
        '  CIDADE,'
        '  BAIRRO,'
        '  ENDERECO,'
        '  COMPLEMENTO,'
        '  NUM_END_CLIENTE,'
        '  CEP,'
        '  IDENTIFICACAO_EMP,'
        '  CGC_EMP,'
        '  ESTADO_EMP,'
        '  CIDADE_EMP,'
        '  BAIRRO_EMP,'
        '  ENDERECO_EMP,'
        '  COMPLEMENTO_EMP,'
        '  NUMERO_END,'
        '  CEP_EMP,'
        '  VALE)'
        'AS'
        'SELECT CP.CODIGO, CP.COD_EMPRESA,'
        
          'CP.COD_TAXA_PROG_FID, CP.COD_CLIENTE, CP.TIPO, CP.DESCRICAO, CP.' +
          'VALOR_OP, CP.DATA,'
        
          'CP.PONTOS, CP.NDOC, CP.TIPODOC, CP.DATA_VENC_PROG, CP.PERC_PROG_' +
          'FID, CP.VALOR,'
        
          'CL.NOME_CLIENTE, CL.RAZAO, CL.CPFCGC, EST.SIGLA_UF, CL.CIDADE, C' +
          'L.BAIRRO, CL.ENDERECO, CL.COMPLEMENTO, CL.NUM_END_CLIENTE, CL.CE' +
          'P,'
        
          'EMP.IDENTIFICACAO_EMP, EMP.CGC_EMP, EMP.ESTADO_EMP, EMP.CIDADE_E' +
          'MP, EMP.BAIRRO_EMP, EMP.ENDRECO_EMP, EMP.COMPLEMENTO_EMP, EMP.NU' +
          'MERO_END, EMP.CEP_EMP,'
        'CP.VALE'
        'FROM CONTA_CORRENTE_PROG_FIDELIDADE CP'
        'INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = CP.COD_EMPRESA '
        
          'INNER JOIN CLIENTES CL ON CL.COD_CLIENTE = CP.COD_CLIENTE AND CL' +
          '.COD_EMPRESA = CP.COD_EMPRESA'
        'LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = CL.CODIGO_UF;'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE TAXA_CONV_PROG_FIDELIDADE ADD PERIODO_VENC_PONTOS IN' +
          'TEGER;'
        
          'CMD:REPL|delete from tabela_processos where cod_processo = '#39'FID0' +
          '15'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'REL051'#39', :COD_EMPRESA, '#39'BT' +
          ' CONFIRMAR REL EXTRATO CONTA CORRENTE (PROG FID)'#39', 10, '#39'FRMRELAT' +
          'ORIOS'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'REL052'#39', :COD_EMPRESA, '#39'BT' +
          ' CONFIRMAR REL DOC RECEB COM VALE RESG(PROG FID)'#39', 10, '#39'FRMRELAT' +
          'ORIOS'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE CARGA ADD COD_ROTA INTEGER;'
        'ALTER TABLE PEDVENDA ADD DEST_SEQID INTEGER;'
        'ALTER TABLE PEDVENDA ADD DEST_SEQID_ENTRG INTEGER;'
        'ALTER TABLE CLIENTES_END_DOC_ADD ADD COD_LOCALIDADE INTEGER;'
        'ALTER TABLE CLIENTES_END_DOC_ADD ADD COD_CIDADE INTEGER;'
        
          'CREATE INDEX IDX_CLIENTES_CID ON CLIENTES (COD_CIDADE, COD_EMPRE' +
          'SA);'
        
          'CREATE INDEX IDX_CLIENTES_END_DOC_ADD_CID ON CLIENTES_END_DOC_AD' +
          'D (COD_CIDADE,COD_EMPRESA);'
        
          'CREATE INDEX IDX_CLIENTES_END_DOC_ADD_LOC ON CLIENTES_END_DOC_AD' +
          'D (COD_LOCALIDADE,COD_EMPRESA);'
        'CREATE INDEX IDX_CIDADES_IBGE ON CIDADES (IBGE_COD_CIDADE);'
        ''
        '|BLOCO|'
        'CREATE TABLE ROTAS_ENTR ('
        '    COD_ROTA     INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DESCRICAO    VARCHAR(32) NOT NULL,'
        '    ROTA         CHAR(2) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE ROTAS_ENTR ADD CONSTRAINT PK_ROTAS_ENTR PRIMARY KEY ' +
          '(COD_ROTA, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE ROTAS_ENTR_CLIENTE ('
        '    COD_ROTA           INTEGER NOT NULL,'
        '    COD_EMPRESA        INTEGER NOT NULL,'
        '    COD_CLIENTE        INTEGER NOT NULL,'
        '    END_DOC_ADD_SEQID  INTEGER NOT NULL,'
        '    ORDEM              INTEGER,'
        '    DATAHORA           TIMESTAMP DEFAULT CURRENT_TIMESTAMP'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE ROTAS_ENTR_CLIENTE ADD CONSTRAINT PK_ROTAS_ENTR_CLIE' +
          'NTE PRIMARY KEY (COD_ROTA, COD_EMPRESA, COD_CLIENTE, END_DOC_ADD' +
          '_SEQID);'
        
          'ALTER TABLE ROTAS_ENTR_CLIENTE ADD CONSTRAINT FK_ROTAS_ENTR_CLIE' +
          'NTE FOREIGN KEY (COD_ROTA, COD_EMPRESA) REFERENCES ROTAS_ENTR (C' +
          'OD_ROTA, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE ROTAS_ENTR_CLIENTE ADD CONSTRAINT FK_ROTAS_ENTR_CLIE' +
          'NTE_CL FOREIGN KEY (COD_CLIENTE, COD_EMPRESA) REFERENCES CLIENTE' +
          'S (COD_CLIENTE, COD_EMPRESA) ON UPDATE CASCADE;'
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
        'CREATE TABLE ROTAS_ENTR_REGIAO ('
        '    COD_ROTA        INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    COD_CIDADE      INTEGER NOT NULL,'
        '    COD_LOCALIDADE  INTEGER NOT NULL,'
        '    ORDEM           INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE ROTAS_ENTR_REGIAO ADD CONSTRAINT PK_ROTAS_ENTR_REGIA' +
          'O PRIMARY KEY (COD_ROTA, COD_EMPRESA, COD_CIDADE, COD_LOCALIDADE' +
          ');'
        
          'ALTER TABLE ROTAS_ENTR_REGIAO ADD CONSTRAINT FK_ROTAS_ENTR_REGIA' +
          'O FOREIGN KEY (COD_ROTA, COD_EMPRESA) REFERENCES ROTAS_ENTR (COD' +
          '_ROTA, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|CMD:INATIVO|'
        'select current_date from rdb$database'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'select current_date from rdb$database'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block'
        'as'
        'begin'
        '  if ((exists(select RI.RDB$INDEX_NAME'
        '              from RDB$INDICES RI'
        
          '              where RI.RDB$INDEX_NAME = '#39'IND_LIXEIRA_PEDVENDA'#39' a' +
          'nd'
        
          '                    RI.RDB$RELATION_NAME = '#39'PEDVENDA'#39')) or (exis' +
          'ts(select RIS.RDB$INDEX_NAME'
        
          '                                                                ' +
          '   from RDB$INDEX_SEGMENTS RIS'
        
          '                                                                ' +
          '   where RIS.RDB$INDEX_NAME = '#39'IND_LIXEIRA_PEDVENDA'#39'))) then'
        '  begin'
        
          '    execute statement '#39'DELETE FROM RDB$INDICES RI WHERE RI.RDB$I' +
          'NDEX_NAME = '#39#39'IND_LIXEIRA_PEDVENDA'#39#39' AND RI.RDB$RELATION_NAME = ' +
          #39#39'PEDVENDA'#39#39';'#39';'
        
          '    execute statement '#39'DELETE FROM RDB$INDEX_SEGMENTS RIS WHERE ' +
          'RIS.RDB$INDEX_NAME = '#39#39'IND_LIXEIRA_PEDVENDA'#39#39';'#39';'
        '  end'
        'end; '
        '|/BLOCO|'
        ''
        
          'CMD:REPL|update clientes_end_doc_add cd set cd.cod_cidade = (sel' +
          'ect min(cod_cidade) from cidades where cidades.ibge_cod_cidade =' +
          ' cd.cmun) where cd.cod_cidade is null;'
        ''
        '|BLOCO|CMD:INATIVO|'
        'create or alter procedure EXISTE_FORMAS '
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS2'
        '|/BLOCO|'
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
        '    ATIVO)'
        'AS'
        '/*view enderecos cliente*/'
        
          'select CL.COD_CLIENTE, CL.COD_EMPRESA, 0 DEST_SEQID, '#39'Principal'#39 +
          ' TIPO_END, CL.NOME_CLIENTE, CL.RAZAO, CL.CPFCGC,'
        
          '       CL.INSC_EST, CL.NFE_INDIEDEST, CL.NFE_IDESTRANGEIRO, '#39' '#39' ' +
          'ISUF, CL.INSC_MUNICIPAL IM, CL.ENDERECO LOGRADOURO,'
        
          '       CL.NUM_END_CLIENTE NUMERO, CL.BAIRRO BAIRRO, CL.CEP, CL.C' +
          'OMPLEMENTO, CL.CIDADE, ES.SIGLA_UF UF,'
        
          '       CL.FONE_CLIENTE TELEFONE, CL.EMAIL, LOC.LOCALIDADE, SR.SE' +
          'TOR, CL.COD_CIDADE, CL.COD_LOCALIDADE,'
        
          '       CI.IBGE_COD_CIDADE CMUN, CL.COD_PAIS CPAIS, PA.NOME_PAIS ' +
          'XPAIS, CL.ATIVO'
        'from CLIENTES CL'
        'left join CIDADES CI on CI.COD_CIDADE = CL.COD_CIDADE'
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
        '                AD.ATIVO'
        'from CLIENTES CL'
        
          'inner join CLIENTES_END_DOC_ADD AD on AD.COD_CLIENTE = CL.COD_CL' +
          'IENTE and'
        '      AD.COD_EMPRESA = CL.COD_EMPRESA'
        
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
          'S, PA.NOME_PAIS'
        '        from CLIENTES CL'
        '        left join CIDADES CI on CI.COD_CIDADE = CL.COD_CIDADE'
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
        '                        AD.IM, AD.CMUN, AD.CPAIS, AD.XPAIS'
        '        from CLIENTES CL'
        
          '        inner join CLIENTES_END_DOC_ADD AD on AD.COD_CLIENTE = C' +
          'L.COD_CLIENTE and'
        '              AD.COD_EMPRESA = CL.COD_EMPRESA'
        
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
          ', :ISUF, :IM, :CMUN, :CPAIS, :XPAIS'
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
          'S, PA.NOME_PAIS'
        '        from CLIENTES CL'
        '        left join CIDADES CI on CI.COD_CIDADE = CL.COD_CIDADE'
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
        '                        AD.IM, AD.CMUN, AD.CPAIS, AD.XPAIS'
        '        from CLIENTES_END_DOC_ADD AD'
        
          '        inner join CLIENTES CL on CL.COD_CLIENTE = AD.COD_CLIENT' +
          'E and'
        '              CL.COD_EMPRESA = AD.COD_EMPRESA'
        
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
          ', :ISUF, :IM, :CMUN, :CPAIS, :XPAIS'
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
          'S, PA.NOME_PAIS'
        '        from CLIENTES CL'
        '        left join CIDADES CI on CI.COD_CIDADE = CL.COD_CIDADE'
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
        '                        AD.IM, AD.CMUN, AD.CPAIS, AD.XPAIS'
        '        from LOCALIDADE LOC'
        
          '        inner join CLIENTES_END_DOC_ADD AD on AD.COD_LOCALIDADE ' +
          '= LOC.COD_LOCALIDADE and'
        '              AD.COD_EMPRESA = LOC.COD_EMPRESA'
        
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
          ', :ISUF, :IM, :CMUN, :CPAIS, :XPAIS'
        '    do'
        '    begin'
        '      suspend;'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS2'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI233'#39', :COD_EMPRESA, '#39'BT' +
          ' PESQUISAR ROTAS ENTREGA'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI234'#39', :COD_EMPRESA, '#39'BT' +
          ' INSERIR ROTAS ENTREGA'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI235'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR ROTAS ENTREGA'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI236'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR ROTAS ENTREGA'#39', 10, '#39'S'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI237'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR ROTAS ENTREGA'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI238'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR ROTAS ENTREGA MESMA SIGLA'#39', 4, '#39'S'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI239'#39', :COD_EMPRESA, '#39'BT' +
          ' VISUALIZAR CLIENTES ROTA'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI240'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR CLIENTES ROTA'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI241'#39', :COD_EMPRESA, '#39'BT' +
          ' INCLUIR REGIAO ROTA ENTREGA'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI242'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR REGIAO ROTA ENTREGA'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI243'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR ROTA ENTREGA COM REGIAO VINC'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1,' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI244'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR ROTA ENTREGA COM CLIENTE VINC'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1' +
          ', '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS2'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND241'#39', :COD_EMPRESA, '#39'BT' +
          ' UTILIZAR PRECO TELA CONSULTA ULT PRECO'#39', 10, '#39'N'#39', '#39'FRMCADPEDVEN' +
          'DA'#39', 1, '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'REL053'#39', :COD_EMPRESA, '#39'BT' +
          ' CONFIRMAR REL TITULOS POR ROTA'#39', 10, '#39'FRMRELATORIOS'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW SPED_PRESUMIDO'
        '|/BLOCO|'
        ''
        'ALTER TABLE PEDVENDA ADD VL_COMISSAO_VEND T_VL_TODOS;'
        'ALTER TABLE PEDVENDA ADD PERC_COMISSAO_VEND T_VL_TODOS;'
        'ALTER TABLE PEDVENDA ADD VL_COMISSAO_VEND1 T_VL_TODOS;'
        'ALTER TABLE PEDVENDA ADD PERC_COMISSAO_VEND1 T_VL_TODOS;'
        'ALTER TABLE PEDVENDA_PROD ADD VL_COMISSAO_VEND T_VL_TODOS;'
        'ALTER TABLE PEDVENDA_PROD ADD PERC_COMISSAO_VEND T_VL_TODOS;'
        'ALTER TABLE PEDVENDA_PROD ADD VL_COMISSAO_VEND1 T_VL_TODOS;'
        'ALTER TABLE PEDVENDA_PROD ADD PERC_COMISSAO_VEND1 T_VL_TODOS;'
        'ALTER TABLE PARTICIPANTE ADD PC_VEND_PROD T_N_GERAL;'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'REL054'#39', :COD_EMPRESA, '#39'BT CONFIRMA' +
          'R REL COMISSAO POR VENDA'#39', 10, '#39'FRMRELATORIOS'#39', 1, '#39'N'#39', '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'REL055'#39', :COD_EMPRESA, '#39'BT HABILITA' +
          'R VENDEDOR COMISSAO POR VENDA'#39', 3, '#39'FRMRELATORIOS'#39', 1, '#39'N'#39', '#39'N'#39',' +
          ' CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'REL056'#39', :COD_EMPRESA, '#39'BT HABILITA' +
          'R PARCEIRO COMISSAO POR VENDA'#39', 3, '#39'FRMRELATORIOS'#39', 1, '#39'N'#39', '#39'N'#39',' +
          ' CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND242'#39', :COD_EMPRESA, '#39'ABRIR COMIS' +
          'SAO POR VENDA'#39', 10, '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE)' +
          ';'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND243'#39', :COD_EMPRESA, '#39'HAB VISUALI' +
          'ZACAO VENDAS ABERTAS COMISSAO POR VENDA'#39', 10, '#39'FRMCADPEDVENDA'#39', ' +
          '1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND244'#39', :COD_EMPRESA, '#39'SALVAR COMI' +
          'SSAO POR VENDA'#39', 10, '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE' +
          ');'
        ''
        '|BLOCO|'
        'create or alter procedure FORMAS_DET ('
        '    PNDOC integer,'
        '    PTIPODOC varchar(6),'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    SEQFORM integer,'
        '    NDOC varchar(20),'
        '    DATA_MOV timestamp,'
        '    DATA_VENC timestamp,'
        '    VALORDOC double precision,'
        '    COD_CONTROLE integer,'
        '    NOME_CTRL varchar(35),'
        '    DOCS char(2),'
        '    NPARCELA integer,'
        '    REC_TIPVEND char(3),'
        '    REC_NUMVEND integer,'
        '    RECIBO char(1),'
        '    HISTORICO varchar(100),'
        '    PRG_FID char(1),'
        '    QTDE_REG integer)'
        'as'
        'declare variable VSQL varchar(600);'
        'declare variable VCONFFORMPAGAMENTO varchar(3);'
        'declare variable VNF integer;'
        'declare variable VSERIE integer;'
        'declare variable VTEMP varchar(400);'
        'declare variable VTEMP2 varchar(400);'
        'begin'
        '  VSQL = '#39#39';'
        '  VTEMP = '#39#39';'
        '  VTEMP2 = '#39#39';'
        '  /* Procedure Text */'
        
          '  select conf_formpagamento from empresa where cod_empresa = 1 i' +
          'nto :vconfformpagamento;'
        
          '  if ((trim(coalesce(vconfformpagamento, '#39#39')) = '#39'PED'#39') or (trim(' +
          'coalesce(ptipodoc, '#39#39')) = '#39'PRE'#39')) then'
        '  begin'
        '    for select fp.seqform, fp.ndoc, fp.data_mov, fp.data_venc,'
        '    fp.valordoc, fp.cod_controle, ctr.nome_ctrl, ctr.docs,'
        
          '    fp.nparcela, fp.rec_tipvend, fp.rec_numvend, fp.recibo, fp.h' +
          'istorico, fp.prg_fid,'
        '        coalesce((select count(*) from formpagamento fp2'
        
          '        where fp2.nrequisicao = fp.nrequisicao and fp2.tpdocs = ' +
          'fp.tpdocs and fp2.cod_empresa = fp.cod_empresa), 0)'
        '    from formpagamento fp'
        
          '    inner join controles ctr on ctr.codigo_ctrl = fp.cod_control' +
          'e and ctr.codigo_emp = fp.cod_empresa'
        
          '    where fp.nrequisicao = :pndoc and fp.tpdocs = :ptipodoc and ' +
          'fp.cod_empresa = :pcod_empresa'
        '    and fp.ativo = 1'
        
          '    into :seqform, :ndoc, :data_mov, :data_venc, :valordoc, :cod' +
          '_controle, :nome_ctrl, :docs,'
        
          '      :nparcela, :rec_tipvend, :rec_numvend, :recibo, :historico' +
          ', :prg_fid, :qtde_reg do'
        '      suspend;'
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
        '       begin'
        
          '          VTEMP = '#39' ((fp.num_nota = '#39'||:vnf||'#39' and fp.sub_serie ' +
          '= '#39'||:vserie||'#39')'#39';'
        
          '          VTEMP2 = '#39' ((fp2.num_nota = '#39'||:vnf||'#39' and fp2.sub_ser' +
          'ie = '#39'||:vserie||'#39')'#39';'
        '       end'
        '       else'
        '       begin'
        
          '          VTEMP = VTEMP || '#39' or (fp.num_nota = '#39'||:vnf||'#39' and fp' +
          '.sub_serie = '#39'||:vserie||'#39')'#39';'
        
          '          VTEMP2 = VTEMP2 || '#39' or (fp2.num_nota = '#39'||:vnf||'#39' and' +
          ' fp2.sub_serie = '#39'||:vserie||'#39')'#39';'
        '       end'
        '    end'
        '    if (trim(coalesce(VTEMP, '#39#39')) <> '#39#39') then'
        '    begin'
        '      VTEMP = VTEMP || '#39')'#39';'
        '      VTEMP2 = VTEMP2 || '#39')'#39';'
        '    end'
        ''
        '    if (trim(coalesce(VTEMP, '#39#39')) <> '#39#39') then'
        '    begin'
        '        for execute statement'
        '        '#39' select fp.seqform, fp.ndoc, fp.data_mov, fp.data_venc,'
        '          fp.valordoc, fp.cod_controle, ctr.nome_ctrl, ctr.docs,'
        
          '          fp.nparcela, fp.rec_tipvend, fp.rec_numvend, fp.recibo' +
          ', fp.historico, fp.prg_fid,'
        '             coalesce((select count(*) from formpagamento fp2'
        
          '             where '#39'||:VTEMP2||'#39' and fp2.tpdocs <> '#39#39'LCS'#39#39' and f' +
          'p2.cod_empresa = '#39'||:pcod_empresa||'#39
        '             and fp2.ativo = 1), 0)'
        '          from formpagamento fp'
        
          '          inner join controles ctr on ctr.codigo_ctrl = fp.cod_c' +
          'ontrole and ctr.codigo_emp = fp.cod_empresa'
        
          '          where '#39'||:VTEMP||'#39' and fp.tpdocs <> '#39#39'LCS'#39#39' and fp.cod' +
          '_empresa = '#39'||:pcod_empresa||'#39
        '          and fp.ativo = 1 '#39
        
          '          into :seqform, :ndoc, :data_mov, :data_venc, :valordoc' +
          ', :cod_controle, :nome_ctrl, :docs,'
        
          '          :nparcela, :rec_tipvend, :rec_numvend, :recibo, :histo' +
          'rico, :prg_fid, :qtde_reg do'
        '            suspend;'
        '      end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_FORMPAGAMENTO_VENC ON FORMPAGAMENTO (DATA_VENC,' +
          ' TPDOCS, COD_EMPRESA);'
        'ALTER TABLE COBREBEM ADD CORR_REMESSA CHAR(1) DEFAULT '#39'N'#39';'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NFCE_SUM_TOTAIS_PISCOFINS ('
        '    CODIGO_NFCE integer,'
        '    CODIGO_EMPRESA integer)'
        'returns ('
        '    SUCESSO smallint)'
        'as'
        'declare variable CODNFCE integer;'
        'declare variable CODEMPRESA integer;'
        'declare variable PIS_VALOR double precision;'
        'declare variable COFINS_VALOR double precision;'
        'begin'
        '  select NFCE.COD_NFCE, NFCE.COD_EMPRESA'
        '  from NFCE'
        '  where NFCE.COD_NFCE = :CODIGO_NFCE and'
        '        NFCE.COD_EMPRESA = :CODIGO_EMPRESA'
        '  into :CODNFCE, :CODEMPRESA;'
        '  if (coalesce(CODNFCE, 0) = 0) then'
        '  begin'
        '    SUCESSO = 0;'
        '    suspend;'
        '    exit;'
        '  end'
        ''
        
          '  select sum(coalesce(NFCE_ITEM.PIS_VPIS, 0)), sum(coalesce(NFCE' +
          '_ITEM.COFINS_VCOFINS, 0))'
        '  from NFCE_ITEM'
        '  where NFCE_ITEM.COD_NFCE = :CODNFCE and'
        '        NFCE_ITEM.COD_EMPRESA = :CODEMPRESA'
        '  into :PIS_VALOR, :COFINS_VALOR;'
        ''
        
          '  select sum(coalesce(NFCE_ITEM.PIS_VPIS, 0)), sum(coalesce(NFCE' +
          '_ITEM.COFINS_VCOFINS, 0))'
        '  from NFCE_ITEM'
        '  where NFCE_ITEM.COD_NFCE = :CODNFCE and'
        '        NFCE_ITEM.COD_EMPRESA = :CODEMPRESA'
        '  into :PIS_VALOR, :COFINS_VALOR;'
        ''
        '  update NFCE'
        '  set NFCE.VPIS = coalesce(:PIS_VALOR, 0),'
        '      NFCE.VCOFINS = coalesce(:COFINS_VALOR, 0)'
        '  where NFCE.COD_NFCE = :CODNFCE and'
        '        NFCE.COD_EMPRESA = :CODEMPRESA;'
        ''
        '  SUCESSO = 1;'
        '  suspend;'
        'end'
        '|/BLOCO|')
    end
  end
end
