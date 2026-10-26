inherited frmReestruturaVersao15: TfrmReestruturaVersao15
  Caption = 'frmReestruturaVersao15'
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
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'EMPRESA'#39') and (' +
          'r.rdb$field_name='#39'MENSAGEM_EMP'#39'));'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'PEDVENDA'#39') and ' +
          '(r.rdb$field_name='#39'OBS_PED'#39'));'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND245'#39', :COD_EMPRESA, '#39'CA' +
          'NCELAR ORDEM DE SERV COM NOTA FISCAL SERVICO'#39', 10, '#39'FRMCADPEDVEN' +
          'DA'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND246'#39', :COD_EMPRESA, '#39'CA' +
          'NCELAR SERVICOS - ORDEM DE SERVICO COM DEVOLV'#39', 10, '#39'FRMCADPEDVE' +
          'NDA'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE FORMPAGAMENTO ADD VL_JUROS T_VL_TODOS;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*create or alter procedure EXISTE_FORMAS */'
        '|/BLOCO|'
        ''
        'ALTER TABLE CONTROLE_CREDITOS ADD VALOR_ACRESC T_VL_TODOS;'
        'ALTER TABLE BAIXA_CREDITOS ADD VALOR_ACRESC T_VL_TODOS;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR096'#39', :COD_EMPRESA, '#39'CO' +
          'NCEDER ACRESCIMO CREDITO'#39', 10, '#39'N'#39', '#39'.'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR097'#39', :COD_EMPRESA, '#39'BT' +
          ' CONCEDER DESCONTO/ACRESCIMO CREDITO'#39', 10, '#39'N'#39', '#39'.'#39', 1, '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'CONCEDER D' +
          'ESCONTO CREDITO'#39' WHERE COD_PROCESSO = '#39'CAR039'#39';'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NIVEL_PROCESSO = COALESCE((' +
          'SELECT COALESCE(TAB.NIVEL_PROCESSO, 0) FROM TABELA_PROCESSOS TAB' +
          ' WHERE TAB.COD_PROCESSO = '#39'CAR039'#39' AND TAB.COD_EMPRESA = :COD_EM' +
          'PRESA), 10), SENHA_GERENTE = COALESCE((SELECT COALESCE(TAB.SENHA' +
          '_GERENTE, '#39'N'#39') FROM TABELA_PROCESSOS TAB WHERE TAB.COD_PROCESSO ' +
          '= '#39'CAR039'#39' AND TAB.COD_EMPRESA = :COD_EMPRESA), '#39'N'#39') WHERE COD_P' +
          'ROCESSO = '#39'CAR094'#39' AND COD_EMPRESA = :COD_EMPRESA;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL080'#39', :COD_EMPRESA, '#39'BT' +
          ' CONCEDER DESCONTO/ACRESCIMO CXL'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL081'#39', :COD_EMPRESA, '#39'CO' +
          'NCEDER ACRESCIMO CXL'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL082'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR DESCONTO FINAN SEM DEF EMPRESA'#39', 10, '#39'.'#39', 1, '#39'S'#39', '#39'S'#39', CU' +
          'RRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR098'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR VALOR CREDITO'#39', 10, '#39'N'#39', '#39'.'#39', 1, '#39'S'#39' , CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL083'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR VALOR CREDITO CXL'#39', 10, '#39'N'#39', '#39'.'#39', 1, '#39'S'#39', CURRENT_DATE)' +
          ';'
        'ALTER TABLE CONTROLE_CHEQUE ADD VALOR_ACRESC T_VL_TODOS;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND247'#39', :COD_EMPRESA, '#39'BT' +
          ' CONFIRMAR REQ EM LOTE'#39', 10, '#39'FRMCADNF_LOTE'#39', 1, '#39'S'#39', '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0204'#39', :COD_EMPRESA, '#39'BT' +
          ' GERAR NF POR REQ EM LOTE'#39', 10, '#39'FRMCADNF_LOTE'#39', 1, '#39'S'#39', '#39'S'#39', CU' +
          'RRENT_DATE);'
        'ALTER TABLE SOLICITACOES_ACESSO ADD CONT_ALT SMALLINT;'
        'ALTER TABLE SOLICITACOES_ACESSO ADD LOTE INTEGER;'
        'ALTER TABLE NOTAFISCAL ADD LOTE_FAT INTEGER;'
        'ALTER TABLE PEDVENDA ADD CONT_ALT SMALLINT;'
        
          'CREATE INDEX IDX_SOLICITACOES_ACESSO_LOTE ON SOLICITACOES_ACESSO' +
          ' (LOTE, COD_EMPRESA);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER SOL_ACESSO_BIU_CONT_ALT FOR SOLICITACOES' +
          '_ACESSO'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'as'
        'begin'
        '  if (inserting) then'
        '    new.CONT_ALT = 0;'
        '  else'
        '  if (updating) then'
        '    if ((coalesce(new.CONT_ALT, 0)) >= 9999) then'
        '      new.CONT_ALT = 1;'
        '    else'
        '      new.CONT_ALT = coalesce(new.CONT_ALT, 0) + 1;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_BIU_CONT_ALT FOR PEDVENDA'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'as'
        'begin'
        '  if (inserting) then'
        '    new.CONT_ALT = 0;'
        '  else'
        '  if (updating) then'
        '    if ((coalesce(new.CONT_ALT, 0)) >= 9999) then'
        '      new.CONT_ALT = 1;'
        '    else'
        '      new.CONT_ALT = coalesce(new.CONT_ALT, 0) + 1;'
        'end'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'EXCLUIR TO' +
          'DOS PRODUTOS DA PROMOCAO/TABELA'#39' WHERE COD_PROCESSO = '#39'PRO258'#39';'
        'ALTER TABLE PEDVENDA ADD LOCAL_INCIDENCIA INTEGER;'
        'ALTER TABLE CLIENTES ADD TIPO_REC_ISSQN CHAR(1);'
        ''
        '|BLOCO|'
        'CREATE SEQUENCE SEQ_PRODUTOS_TMP;'
        'CREATE GLOBAL TEMPORARY TABLE PRODUTOS_TMP ('
        '    ID_TMP       VARCHAR(60) NOT NULL,'
        '    SEQID        INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    GRUPO_PROD   INTEGER,'
        '    COD_PROD     CHAR(6)'
        ') ON COMMIT DELETE ROWS;'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_TMP ADD CONSTRAINT PK_PRODUTOS_TMP PRIMARY ' +
          'KEY (ID_TMP, COD_EMPRESA, SEQID);'
        ''
        '|BLOCO|'
        'create or alter trigger PRODUTOS_TMP_BI_SEQID for PRODUTOS_TMP'
        'active before insert position 0'
        'as'
        'declare variable ACODIGO integer;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (coalesce(new.SEQID, 0) <= 0) then'
        '    new.SEQID = NEXT VALUE FOR SEQ_PRODUTOS_TMP;'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE PEDVENDA ADD NF_AC_CALCTRIB CHAR(1);'
        'ALTER TABLE PEDVENDA ADD NF_AC_SEGURO T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_AC_OUTRAS T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_AC_FRETE T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_AC_IPI T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_AC_ICMSST T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_AC_FCPST T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_AC_IMPOSTO_II T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_FRETECONTA CHAR(1);'
        
          'CREATE INDEX IDX_BOLETAS_SEQFORM ON BOLETAS (SEQFORM, COD_EMPRES' +
          'A);'
        'ALTER TABLE PRODUCAO ADD TIPO_K VARCHAR(4);'
        'ALTER TABLE NOTAFISCAL ADD ID_AJUSTE INTEGER;'
        ''
        '|BLOCO|'
        'CREATE TABLE ESTOQUE_AJUSTE ('
        '    ID_AJUSTE      INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    DATA_CONFIRM   TIMESTAMP,'
        '    DATA_APURACAO  TIMESTAMP,'
        '    STATUS         VARCHAR(16) DEFAULT '#39'Aberto'#39','
        '    ATIVO          SMALLINT default 1'
        ');'
        
          'ALTER TABLE ESTOQUE_AJUSTE ADD CONSTRAINT PK_ESTOQUE_AJUSTE PRIM' +
          'ARY KEY (ID_AJUSTE, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE ESTOQUE_AJUSTE_ITENS ('
        '    ID_AJUSTE     INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    ID_IT         INTEGER NOT NULL,'
        '    GRUPO_PROD    INTEGER,'
        '    COD_PROD      CHAR(6),'
        '    COD_GRADE     INTEGER DEFAULT 0,'
        '    QUANTIDADE    T_VL_TODOS,'
        '    CUSTO_UN      T_VL_TODOS,'
        '    CUSTO_TOT_AJ  T_VL_TODOS,'
        '    FATOR         T_VL_TODOS default 1,'
        '    COD_NF        INTEGER,'
        '    NITEM         INTEGER'
        ');'
        
          'ALTER TABLE ESTOQUE_AJUSTE_ITENS ADD CONSTRAINT PK_ESTOQUE_AJUST' +
          'E_ITENS PRIMARY KEY (ID_AJUSTE, COD_EMPRESA, ID_IT);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE ESTOQUE_AJUSTE_ITENS ADD CONSTRAINT FK_ESTOQUE_AJUST' +
          'E_ITENS FOREIGN KEY (ID_AJUSTE, COD_EMPRESA) REFERENCES ESTOQUE_' +
          'AJUSTE (ID_AJUSTE, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASC' +
          'ADE;'
        
          'ALTER TABLE ESTOQUE_AJUSTE_ITENS ADD CONSTRAINT FK_ESTOQUE_AJUST' +
          'E_ITENS_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REF' +
          'ERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE C' +
          'ASCADE ON UPDATE CASCADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0205'#39', :COD_EMPRESA, '#39'BT' +
          ' VISUALIZAR BALANCOS'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_' +
          'DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0206'#39', :COD_EMPRESA, '#39'BT' +
          ' MANTER AJUSTE BALANCOS'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0207'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR DATA APURACAO AJUSTE'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N'#39', '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0208'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR FATOR DE AJUSTE'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0209'#39', :COD_EMPRESA, '#39'BT' +
          ' MANTER NOTAS FISCAIS DE AJUSTE'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N'#39', '#39'S' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0210'#39', :COD_EMPRESA, '#39'BT' +
          ' PREVER NOTAS FISCAIS DE AJUSTE'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N'#39', '#39'S' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0211'#39', :COD_EMPRESA, '#39'BT' +
          ' CRIAR NOTAS FISCAIS DE AJUSTE'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N'#39', '#39'S'#39 +
          ', CURRENT_DATE);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TI_PRODUTOS_CP2 FOR PRODUTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NOTAFISCAL_BU_AJUSTE_EST FOR NOTAFISCAL'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (coalesce(new.id_ajuste, 0) = 0) then'
        '    exit;'
        ''
        
          '  if (((coalesce(old.status ,'#39#39') <> coalesce(new.status ,'#39#39')) an' +
          'd (coalesce(new.status ,'#39#39') = '#39'Cancelada'#39')) or'
        
          '     (((coalesce(old.situacao_nfe ,'#39#39') <> coalesce(new.situacao_' +
          'nfe ,'#39#39')) and (coalesce(new.situacao_nfe ,'#39#39') in ('#39'Cancelada'#39', '#39 +
          'Inutilizada'#39', '#39'Denegada'#39'))))) then'
        '  begin'
        '    update estoque_ajuste_itens set cod_nf = null, nitem = null'
        
          '      where id_ajuste = old.id_ajuste and cod_empresa = old.cod_' +
          'empresa and cod_nf = old.cod_nf;'
        ''
        '    update estoque_ajuste set status = '#39'Aberto'#39
        
          '      where id_ajuste = old.id_ajuste and cod_empresa = old.cod_' +
          'empresa and status = '#39'Concluido'#39';'
        ''
        '    new.id_ajuste = null;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'EFD016'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR GERAR EFD ICMS IPI SEM REGISTRO K200'#39', 10, '#39'.'#39', 1, '#39'S'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        'ALTER TABLE PRODUCAO_ITEM ADD SEQ INTEGER;'
        'ALTER TABLE PRODUCAO_ITEM_INDICE ADD SEQ INTEGER;'
        'ALTER TABLE PRODUCAO_ITEM_INDICE ADD SEQN INTEGER;'
        
          'CMD:REPL|UPDATE PRODUCAO_ITEM SET SEQ = NITEM WHERE SEQ IS NULL ' +
          'AND COD_EMPRESA = :COD_EMPRESA;'
        
          'CMD:REPL|UPDATE PRODUCAO_ITEM_INDICE SET SEQ = NITEM WHERE SEQ I' +
          'S NULL AND COD_EMPRESA = :COD_EMPRESA;'
        
          'CMD:REPL|UPDATE PRODUCAO_ITEM_INDICE SET SEQN = NITEM_IND WHERE ' +
          'SEQN IS NULL AND COD_EMPRESA = :COD_EMPRESA;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*create or alter procedure EXISTE_FORMAS */'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE CLIENTES_TRIB_AD ('
        '    COD_CLIENTE        INTEGER NOT NULL,'
        '    COD_EMPRESA        INTEGER NOT NULL,'
        '    END_DOC_ADD_SEQID  INTEGER NOT NULL,'
        '    COD_TRIB_PF        INTEGER NOT NULL,'
        '    DATAHORA           TIMESTAMP DEFAULT CURRENT_TIMESTAMP'
        ');'
        
          'ALTER TABLE CLIENTES_TRIB_AD ADD CONSTRAINT PK_CLIENTES_TRIB_AD ' +
          'PRIMARY KEY (COD_CLIENTE, COD_EMPRESA, END_DOC_ADD_SEQID, COD_TR' +
          'IB_PF);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CLIENTES_TRIB_AD ADD CONSTRAINT FK_CLIENTES_TRIB_AD_' +
          'CL FOREIGN KEY (COD_CLIENTE, COD_EMPRESA) REFERENCES CLIENTES (C' +
          'OD_CLIENTE, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE CLIENTES_TRIB_AD ADD CONSTRAINT FK_CLIENTES_TRIB_AD_' +
          'PF FOREIGN KEY (COD_TRIB_PF, COD_EMPRESA) REFERENCES PRODUTOS_TR' +
          'IB_PF (COD_TRIB_PF, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE PEDVENDA_VOLUMES ('
        '    NPED         INTEGER NOT NULL,'
        '    TIPO         CHAR(3) NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    QVOL         INTEGER,'
        '    ESP          VARCHAR(60),'
        '    MARCA        VARCHAR(60),'
        '    NVOL         VARCHAR(60),'
        '    PESOL        T_VL_TODOS,'
        '    PESOB        T_VL_TODOS'
        ');'
        
          'ALTER TABLE PEDVENDA_VOLUMES ADD CONSTRAINT PK_PEDVENDA_VOLUMES ' +
          'PRIMARY KEY (NPED, TIPO, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PEDVENDA_VOLUMES ADD CONSTRAINT FK_PEDVENDA_VOLUMES ' +
          'FOREIGN KEY (NPED, TIPO, COD_EMPRESA) REFERENCES PEDVENDA (NPED,' +
          ' TIPO, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE CST_ICMS_INF_CPL ('
        '    CST_CSOSN    VARCHAR(3) NOT NULL,'
        '    COD_INF      INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL'
        ');'
        
          'ALTER TABLE CST_ICMS_INF_CPL ADD CONSTRAINT PK_CST_ICMS_INF_CPL ' +
          'PRIMARY KEY (CST_CSOSN, COD_INF, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CST_ICMS_INF_CPL ADD CONSTRAINT FK_CST_ICMS_INF_CPL ' +
          'FOREIGN KEY (COD_INF, COD_EMPRESA) REFERENCES SPED_INFORMACAO_CO' +
          'MPLEMENTAR (COD_INF, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CA' +
          'SCADE;')
    end
  end
end
