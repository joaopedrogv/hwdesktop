inherited frmReestruturaVersao8: TfrmReestruturaVersao8
  Caption = 'frmReestruturaVersao8'
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
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC039'#39', :COD_EMPRESA, '#39'I' +
          'MPRIMIR LANCAMENTO CONTRAPARTIDA'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT' +
          '_DATE);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS2*/'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_CONTAS_A_PAGAR_LOTE ON CONTAS_A_PAGAR (LOTE, CO' +
          'DIGO_EMP);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER PEDVENDA_HIST_ESTOQUE_D FOR PEDVENDA*/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP034'#39', :COD_EMPRESA, '#39'PE' +
          'RM APAGAR CONTAS A PAGAR REFERENTE NOTA FISCAL'#39', 10, '#39'.'#39', 1, '#39'S'#39 +
          ', '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE SOLICITACOES_ACESSO('
        '    COD_SOLICITACAO INTEGER NOT NULL,'
        '    COD_EMPRESA INTEGER NOT NULL,'
        '    USUARIO_SOLICITANTE VARCHAR(20) NOT NULL,'
        '    DATA_SOLICITACAO TIMESTAMP NOT NULL,'
        '    PROCESSO VARCHAR(10),'
        '    MENSAGEM VARCHAR(128),'
        '    USUARIO_GERENTE VARCHAR(20)'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SOLICITACOES_ACESSO ADD CONSTRAINT PK_SOLICITACOES_A' +
          'CESSO PRIMARY KEY (COD_SOLICITACAO, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        'ALTER TABLE SENHAS ADD LIBERAR_ACESSO CHAR(1);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRC013'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA LIBERACOES DE ACESSO'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DA' +
          'TE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRC014'#39', :COD_EMPRESA, '#39'BT' +
          ' LIBERAR ACESSO'#39', 10, '#39'.'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE NFC_EMISSOR ('
        '    COD_EMISSOR    INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    NOME_EMISSOR   VARCHAR(32),'
        '    SERIE_NFCE     SMALLINT,'
        '    TIPO           VARCHAR(32),'
        '    IDENTIFICADOR  VARCHAR(12),'
        '    TOKEN          VARCHAR(16),'
        '    DATA_CAD       TIMESTAMP,'
        '    DATA_MOD       TIMESTAMP,'
        '    US_MOD         INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFC_EMISSOR ADD CONSTRAINT PK_NFC_EMISSOR PRIMARY KE' +
          'Y (COD_EMISSOR, COD_EMPRESA);'
        'CREATE GENERATOR GEN_NFC_CENTRAL_ACOES;'
        ''
        '|BLOCO|'
        'CREATE TABLE NFC_CENTRAL_ACOES ('
        '    SEQID              BIGINT NOT NULL,'
        '    COD_EMPRESA        INTEGER NOT NULL,'
        '    TIPO               VARCHAR(32),'
        '    ACAO               VARCHAR(32),'
        '    ID                 VARCHAR(64),'
        '    ADICIONAL          VARCHAR(64),'
        '    DATA_CADASTRO      TIMESTAMP,'
        '    DATA_LEITURA_SERV  TIMESTAMP,'
        '    DATA_PRCSS         TIMESTAMP,'
        '    COD_EMISS_CLIENT   INTEGER,'
        '    COD_EMISS_SERV     INTEGER,'
        '    THREADID           BIGINT,'
        '    MSGRETORNO         VARCHAR(255),'
        '    ABORTAR            CHAR(1)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFC_CENTRAL_ACOES ADD CONSTRAINT PK_NFC_CENTRAL_ACOE' +
          'S PRIMARY KEY (SEQID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NFC_CENTRAL_ACOES_BI0 FOR NFC_CENTRAL_AC' +
          'OES'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  IF (COALESCE(NEW.SEQID, 0) = 0) THEN'
        '    NEW.SEQID = GEN_ID(GEN_NFC_CENTRAL_ACOES, 1);'
        '  IF (NEW.DATA_CADASTRO IS NULL) THEN'
        '    NEW.DATA_CADASTRO = CURRENT_TIMESTAMP;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE_CONFIG ('
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    USAR_CONF_NFE     CHAR(1),'
        '    CERT_ARQUIVOPFX   VARCHAR(256),'
        '    CERT_NUM_SERIE    VARCHAR(64),'
        '    CERT_SENHA        VARCHAR(32),'
        '    CSC_ID1           VARCHAR(6),'
        '    CSC_TOKEN1        VARCHAR(36),'
        '    CSC_ID2           VARCHAR(6),'
        '    CSC_TOKEN2        VARCHAR(36),'
        '    WS_UF             CHAR(2),'
        '    WS_TBAMB          CHAR(1),'
        '    WS_SINC_ASSINC    CHAR(1),'
        '    WS_AGUARDAR       SMALLINT,'
        '    WS_TENTATIVAS     SMALLINT,'
        '    WS_INTERVALO      SMALLINT,'
        '    WS_PROXY_HOST     VARCHAR(64),'
        '    WS_PROXY_PORT     VARCHAR(32),'
        '    WS_PROXY_USER     VARCHAR(64),'
        '    WS_PROXY_PASS     VARCHAR(64),'
        '    WS_TIMEOUT        SMALLINT,'
        '    WS_VISUALIZAR     CHAR(1),'
        '    ARQ_PATH_SALVAR   VARCHAR(256),'
        '    ARQ_PATH_SCHEMA   VARCHAR(256),'
        '    ARQ_LOGO_EMP      VARCHAR(256),'
        '    EMAIL_SMPT_HOST   VARCHAR(50),'
        '    EMAIL_SMTP_PORTA  INTEGER,'
        '    EMAIL_USERNAME    VARCHAR(50),'
        '    EMAIL_PASSWORD    VARCHAR(30),'
        '    EMAIL_USA_SSL     CHAR(1),'
        '    EMAIL_ASSUNTO     VARCHAR(70),'
        '    EMAIL_MENSAGEM    BLOB SUB_TYPE 1 SEGMENT SIZE 1024,'
        '    TPEMIS            SMALLINT,'
        '    DHCONT            TIMESTAMP,'
        '    XJUST             VARCHAR(256)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE_CONFIG ADD CONSTRAINT PK_NFCE_CONFIG PRIMARY KE' +
          'Y (COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE ('
        '    COD_NFCE           INTEGER NOT NULL,'
        '    COD_EMPRESA        INTEGER NOT NULL,'
        '    COD_CLIENTE        INTEGER,'
        '    SERIE              SMALLINT,'
        '    NUM_NF             INTEGER,'
        '    MODELO             CHAR(2),'
        '    DHEMI              TIMESTAMP,'
        '    DATA_LANC          TIMESTAMP,'
        '    STATUS             VARCHAR(10),'
        '    NATOP              VARCHAR(60),'
        '    TPIMP              CHAR(1),'
        '    TPEMIS             CHAR(1),'
        '    TPAMB              CHAR(1),'
        '    INDPRES            CHAR(1),'
        '    SITUACAO_NFCE      VARCHAR(16),'
        '    CHAVE_NFCE         VARCHAR(44),'
        '    CNF                INTEGER,'
        '    NPROT              VARCHAR(15),'
        
          '    VBC                T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VICMS              T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VPROD              T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VFRETE             T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VSEG               T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VDESC              T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VPIS               T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VCOFINS            T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VOUTRO             T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VNF                T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        
          '    VTOTTRIB           T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISI' +
          'ON DEFAULT 000000000.00 */,'
        '    MODFRETE           CHAR(1),'
        '    TR_CODIGO          INTEGER,'
        '    DATA_CAD           TIMESTAMP,'
        '    DATA_MOD           TIMESTAMP,'
        '    US_MOD             INTEGER,'
        '    DESC_POR_ITEM      CHAR(1) DEFAULT '#39'S'#39','
        '    SEQPRECO           CHAR(1),'
        '    INFADFISCO         BLOB SUB_TYPE 1 SEGMENT SIZE 256,'
        '    INFCPL             BLOB SUB_TYPE 1 SEGMENT SIZE 256,'
        '    ATIVO              SMALLINT DEFAULT 1,'
        '    CSTAT              VARCHAR(3),'
        '    XMOTIVO            VARCHAR(255),'
        '    DIGVAL             VARCHAR(28),'
        '    DHRECBTO           TIMESTAMP,'
        '    MSGRETORNO         VARCHAR(255),'
        '    XML_NFCE           BLOB SUB_TYPE 1 SEGMENT SIZE 8192,'
        '    CONT_ALT           SMALLINT,'
        '    COD_NFCE_CONTING   INTEGER,'
        '    COD_NFCE_ORIGINAL  INTEGER,'
        '    CONT_DHCONT        TIMESTAMP,'
        '    CONT_XJUST         VARCHAR(256),'
        '    CANC_XJUST         VARCHAR(255),'
        '    CANC_CSTAT         SMALLINT,'
        '    CANC_XMOTIVO       VARCHAR(255),'
        '    CANC_NPROT         VARCHAR(15),'
        '    CANC_DHRECBTO      TIMESTAMP,'
        '    CANC_XML_NFCE      BLOB SUB_TYPE 1 SEGMENT SIZE 4096,'
        '    INUT_XJUST         VARCHAR(255),'
        '    INUT_CSTAT         SMALLINT,'
        '    INUT_XMOTIVO       VARCHAR(255),'
        '    INUT_NPROT         VARCHAR(15),'
        '    INUT_DHRECBTO      TIMESTAMP,'
        '    INUT_XML_NFCE      BLOB SUB_TYPE 1 SEGMENT SIZE 4096,'
        '    CONT_MSG           SMALLINT,'
        '    PED_ORIGEM_NUM     INTEGER,'
        '    PED_ORIGEM_TIP     CHAR(3),'
        '    PED_DESTINO_NUM    INTEGER,'
        '    PED_DESTINO_TIP    CHAR(3),'
        '    COD_VENDEDOR       INTEGER,'
        '    COD_COND_PAG       INTEGER,'
        '    FRETE_NA_BASE      CHAR(1)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE ADD CONSTRAINT PK_NFCE PRIMARY KEY (COD_NFCE, C' +
          'OD_EMPRESA);'
        
          'ALTER TABLE NFCE ADD CONSTRAINT FK_NFCE_CLIENTES FOREIGN KEY (CO' +
          'D_CLIENTE, COD_EMPRESA) REFERENCES CLIENTES (COD_CLIENTE, COD_EM' +
          'PRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE NFCE ADD CONSTRAINT FK_NFCE_COLAB FOREIGN KEY (COD_V' +
          'ENDEDOR, COD_EMPRESA) REFERENCES COLABORADOR (COD_VENDEDOR, COD_' +
          'EMPRESA);'
        
          'ALTER TABLE NFCE ADD CONSTRAINT FK_NFCE_CONDPAG FOREIGN KEY (COD' +
          '_COND_PAG) REFERENCES COND_PAG (COD_COND_PAG);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NFCE_BIU_CONT_ALT FOR NFCE'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        ''
        'begin'
        '  if (inserting) then'
        '    new.cont_alt = 0;'
        '  else if (updating) then'
        '    if ((coalesce(new.cont_alt, 0)) >= 9999) then'
        '      new.cont_alt = 1;'
        '    else'
        '      new.cont_alt = coalesce(new.cont_alt, 0) + 1;'
        '  if (updating) then'
        '    if ((coalesce(new.cont_msg, 0)) >= 9999) then'
        '      new.cont_msg = 1;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE_INFADIC ('
        '    COD_NFCE     INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    SEQID        INTEGER NOT NULL,'
        '    INFADFISCO   BLOB SUB_TYPE 1 SEGMENT SIZE 256,'
        '    INFCPL       BLOB SUB_TYPE 1 SEGMENT SIZE 256'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE_INFADIC ADD CONSTRAINT PK_NFCE_INFADIC PRIMARY ' +
          'KEY (COD_NFCE, COD_EMPRESA, SEQID);'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE_ITEM ('
        '    COD_NFCE             INTEGER NOT NULL,'
        '    COD_EMPRESA          INTEGER NOT NULL,'
        '    SEQID                INTEGER NOT NULL,'
        '    NITEM                INTEGER,'
        '    TIPO_ITEM            CHAR(1),'
        '    GRUPO_PROD           INTEGER,'
        '    COD_PROD             CHAR(6),'
        '    COD_GRADE            INTEGER DEFAULT 0,'
        '    NUM_FAB_PROD         VARCHAR(20),'
        '    CEAN                 VARCHAR(14),'
        '    NCM                  VARCHAR(8),'
        '    CFOP                 SMALLINT,'
        '    XPROD                VARCHAR(120),'
        '    UCOM                 VARCHAR(6),'
        
          '    QCOM                 T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    VUNCOM               T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    VPROD                T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    VFRETE               T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    VSEG                 T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    VDESC                T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    VOUTRO               T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    PREC_CUS_PROD        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    PREC_CUSM_PROD       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        '    CEST                 VARCHAR(7),'
        '    NFCI                 VARCHAR(36),'
        
          '    VTOTTRIB             T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        '    ICM_ORIG             CHAR(1),'
        '    ICM_CST              CHAR(2),'
        
          '    ICM_MODBC            T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ICM_PREDBC           T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ICM_VBC              T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ICM_PICMS            T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ICM_VICMS            T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ICM_VBCSTRET         T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ICM_VICMSSTRET       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        '    ICM_CSOSN            CHAR(3),'
        
          '    ICM_PCREDSN          T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ICM_VCREDICMSSN      T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        '    PIS_CST              CHAR(2),'
        
          '    PIS_VBC              T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    PIS_PPIS             T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    PIS_VPIS             T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    PIS_QBCPROD          T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    PIS_VALIQPROD        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        '    COFINS_CST           CHAR(2),'
        
          '    COFINS_VBC           T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    COFINS_PCOFINS       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    COFINS_VCOFINS       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    COFINS_QBCPROD       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    COFINS_VALIQPROD     T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ISS_VBC              T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ISS_VALIQ            T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ISS_VISSQN           T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        '    ISS_CMUNFG           INTEGER,'
        '    ISS_CLISTSERV        CHAR(5),'
        
          '    ISS_VDEDUCAO         T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ISS_VOUTRO           T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ISS_VDESCINCOND      T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ISS_VDESCCOND        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        
          '    ISS_VISSRET          T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */,'
        '    ISS_INDISS           CHAR(2),'
        '    ISS_INDINCENTIVO     CHAR(1),'
        '    ISS_RETIDO           CHAR(1),'
        '    COD_SERVICO          INTEGER,'
        '    FRETE_NA_BASE        CHAR(1),'
        '    CALCULAR             CHAR(1),'
        '    ALTERA_ESTOQUE_CFOP  CHAR(1) DEFAULT '#39'S'#39
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE_ITEM ADD CONSTRAINT PK_NFCE_ITEM PRIMARY KEY (C' +
          'OD_NFCE, COD_EMPRESA, SEQID);'
        
          'ALTER TABLE NFCE_ITEM ADD CONSTRAINT FK_NFCE_ITEM_GRADE FOREIGN ' +
          'KEY (COD_GRADE, COD_EMPRESA) REFERENCES GRADE (COD_GRADE, COD_EM' +
          'PRESA);'
        
          'ALTER TABLE NFCE_ITEM ADD CONSTRAINT FK_NFCE_ITEM_NFCE FOREIGN K' +
          'EY (COD_NFCE, COD_EMPRESA) REFERENCES NFCE (COD_NFCE, COD_EMPRES' +
          'A) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE NFCE_ITEM ADD CONSTRAINT FK_NFCE_ITEM_PRODUTOS FOREI' +
          'GN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES PRODUTOS (' +
          'GRUPO_PROD, COD_PROD, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE NFCE_ITEM ADD CONSTRAINT FK_NFCE_ITEM_SERVICOS FOREI' +
          'GN KEY (COD_SERVICO) REFERENCES TIPO_SERVICO (COD_SERVICO) ON UP' +
          'DATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NFCE_ITEM_CALC_IMP FOR NFCE_ITEM'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  declare variable calcular char(1);'
        '  declare variable valor_tmp t_vl_todos;'
        'begin'
        '  if (user = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  calcular = '#39'N'#39';--coalesce(new.calcular, '#39'N'#39');'
        ''
        '  if ((inserting) or (deleting) ) then'
        '    calcular = '#39'S'#39';'
        '  else if (updating) then'
        '    if ((old.vprod <> new.vprod) or'
        '      (old.vseg <> new.vseg) or'
        '      (old.vdesc <> new.vdesc) or  '
        
          '      ((old.vfrete <> new.vfrete) and (new.frete_na_base = '#39'S'#39'))' +
          ' or'
        '      (old.voutro <> new.voutro) or'
        '      (old.frete_na_base <> new.frete_na_base) or'
        '      (old.icm_cst <> new.icm_cst) or'
        '      (old.icm_csosn <> new.icm_csosn) or'
        '      (old.icm_predbc <> new.icm_predbc) or'
        '      (old.icm_picms <> new.icm_picms) or'
        '      (old.icm_pcredsn <> new.icm_pcredsn) or'
        '      (old.pis_cst <> new.pis_cst) or'
        '      (old.pis_ppis <> new.pis_ppis) or'
        '      (old.pis_valiqprod <> new.pis_valiqprod) or'
        '      (old.cofins_cst <> new.cofins_cst) or'
        '      (old.cofins_pcofins <> new.cofins_pcofins) or'
        '      (old.cofins_valiqprod <> new.cofins_valiqprod) or'
        '      (old.iss_valiq <> new.iss_valiq) or'
        '      (old.iss_retido <> new.iss_retido) ) then'
        
          '      /*if (coalesce(new.calcular, '#39#39') <> '#39'N'#39') then*/ /* ver se ' +
          'este campo e necessario */'
        '        calcular = '#39'S'#39';'
        ''
        '  if (calcular = '#39'N'#39') then'
        '    exit;'
        ''
        '  if (new.frete_na_base = '#39'S'#39') then'
        '    valor_tmp = new.vfrete;'
        '  else'
        '     valor_tmp = 0;'
        
          '  valor_tmp = valor_tmp + new.vprod + new.vseg + new.voutro - ne' +
          'w.vdesc;'
        ''
        
          '  if ((coalesce(new.icm_pcredsn,0) > 0) and ((new.icm_csosn = '#39'1' +
          '01'#39') or (new.icm_csosn = '#39'900'#39'))) then'
        '  begin'
        
          '    new.icm_vcredicmssn = round(valor_tmp * new.icm_pcredsn / 10' +
          '0, 2);'
        '    new.icm_predbc = 0;'
        '    new.icm_picms = 0;'
        '    new.icm_vbc = 0;'
        '    new.icm_vicms = 0;'
        '  end'
        '  else if (coalesce(new.icm_csosn, '#39#39') <> '#39#39') then'
        '  begin               '
        '    new.icm_pcredsn = 0;'
        '    new.icm_vcredicmssn = 0;'
        '    new.icm_predbc = 0;'
        '    new.icm_picms = 0;'
        '    new.icm_vbc = 0;'
        '    new.icm_vicms = 0;'
        '  end'
        
          '  else if ((new.icm_picms > 0) and ((new.icm_cst = '#39'00'#39') or (new' +
          '.icm_cst = '#39'20'#39') or (new.icm_cst = '#39'90'#39'))) then'
        '  begin'
        '    if (new.icm_cst = '#39'00'#39') then'
        '      new.icm_predbc = 0;'
        ''
        '    new.icm_vbc = valor_tmp;'
        '    if (new.icm_predbc > 0) then'
        '      new.icm_vbc = new.icm_predbc * new.icm_vbc / 100;'
        ''
        '    new.icm_vbc = round(new.icm_vbc, 2);'
        '    new.icm_vicms = round(new.icm_vbc * new.icm_picms / 100, 2);'
        '    '
        '    new.icm_pcredsn = 0;'
        '    new.icm_vcredicmssn = 0;'
        '  end'
        '  else'
        '  begin'
        '    new.icm_predbc = 0;'
        '    new.icm_picms = 0;'
        '    new.icm_vbc = 0;'
        '    new.icm_vicms = 0;'
        '    new.icm_pcredsn = 0;'
        '    new.icm_vcredicmssn = 0;'
        '  end'
        ''
        '  new.cofins_cst = new.pis_cst;'
        ''
        '  if ('
        '    ( (new.pis_cst = '#39'03'#39') and (new.pis_valiqprod > 0) )'
        '    or'
        
          '    ( ( (new.pis_cst = '#39'01'#39') or (new.pis_cst = '#39'02'#39') ) and (new.' +
          'pis_ppis > 0) )'
        '    ) then'
        '  begin'
        '    if (new.pis_cst = '#39'03'#39') then'
        '    begin'
        '      new.pis_qbcprod = new.qcom;'
        
          '      new.pis_vpis = round(new.pis_qbcprod * new.pis_valiqprod, ' +
          '2);'
        '      new.pis_vbc = 0;'
        '      new.pis_ppis = 0;'
        '    end'
        '    else'
        '    begin'
        '      new.pis_vbc = round(valor_tmp, 2);'
        '      new.pis_vpis = round(new.pis_ppis * new.pis_vbc / 100, 2);'
        '      new.pis_qbcprod = 0;'
        '      new.pis_valiqprod = 0;'
        '    end'
        '  end'
        '  else'
        '  begin'
        '    new.pis_vbc = 0;'
        '    new.pis_ppis = 0;'
        '    new.pis_qbcprod = 0;'
        '    new.pis_valiqprod = 0;'
        '    new.pis_vpis = 0;'
        '  end'
        ''
        '  if ('
        '    ( (new.cofins_cst = '#39'03'#39') and (new.cofins_valiqprod > 0) )'
        '    or'
        
          '    ( ( (new.cofins_cst = '#39'01'#39') or (new.cofins_cst = '#39'02'#39') ) and' +
          ' (new.cofins_pcofins > 0) )'
        '    ) then'
        '  begin'
        '    if (new.cofins_cst = '#39'03'#39') then'
        '    begin'
        '      new.cofins_qbcprod = new.qcom;'
        
          '      new.cofins_vcofins = round(new.cofins_qbcprod * new.cofins' +
          '_valiqprod, 2);'
        '      new.cofins_vbc = 0;'
        '      new.cofins_pcofins = 0;'
        '    end'
        '    else'
        '    begin'
        '      new.cofins_vbc = round(valor_tmp, 2);'
        
          '      new.cofins_vcofins = round(new.cofins_pcofins * new.cofins' +
          '_vbc / 100, 2);'
        '      new.cofins_qbcprod = 0;'
        '      new.cofins_valiqprod = 0;'
        '    end'
        '  end'
        '  else'
        '  begin'
        '    new.cofins_vbc = 0;'
        '    new.cofins_pcofins = 0;'
        '    new.cofins_qbcprod = 0;'
        '    new.cofins_valiqprod = 0;'
        '    new.cofins_vcofins = 0;'
        '  end'
        ''
        '  if (new.iss_valiq > 0) then'
        '  begin'
        '    new.iss_vbc = round(valor_tmp, 2);'
        '    if ((new.iss_retido = '#39'S'#39') or (new.iss_retido = '#39'C'#39'))  then'
        '    begin'
        '      new.iss_vissret = round(new.iss_vbc * new.iss_valiq, 2);'
        '      new.iss_vissqn = 0;'
        '    end'
        '    else'
        '    begin'
        '      new.iss_vissqn = round(new.iss_vbc * new.iss_valiq, 2);'
        '      new.iss_vissret = 0;'
        '    end'
        '  end'
        '  else'
        '  begin'
        '    new.iss_vbc = 0;'
        '    new.iss_valiq = 0;'
        '    new.iss_vissqn = 0;'
        '    new.iss_vissret = 0;'
        '    new.iss_retido = '#39'N'#39';'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE_PAGAMENTO ('
        '    COD_NFCE      INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    SEQID         INTEGER NOT NULL,'
        '    TPAG          SMALLINT,'
        
          '    VPAG          T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DE' +
          'FAULT 000000000.00 */,'
        '    CNPJ          VARCHAR(14),'
        '    TBAND         SMALLINT,'
        '    CAUT          VARCHAR(20),'
        '    COD_CONTROLE  INTEGER,'
        '    TPINTEGRA     CHAR(1)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE_PAGAMENTO ADD CONSTRAINT PK_NFCE_PAGAMENTO PRIM' +
          'ARY KEY (COD_NFCE, COD_EMPRESA, SEQID);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NFCE_REC_RATEIOS ('
        '    CODIGO_NFCE integer,'
        '    CODIGO_EMPRESA integer)'
        'returns ('
        '    SUCESSO smallint)'
        'as'
        'declare variable CODNFCE integer;'
        'declare variable CODEMPRESA integer;'
        'declare variable PROD double precision;'
        'declare variable FRETE double precision;'
        'declare variable SEG double precision;'
        'declare variable OUTRO double precision;'
        'declare variable DESCONTO double precision;'
        'declare variable FRETE_CALC char(1);'
        'declare variable DESC_POR_IT char(1);'
        'declare variable SUMFRETE double precision;'
        'declare variable SUMSEG double precision;'
        'declare variable SUMOUTRO double precision;'
        'declare variable SUMDESCONTO double precision;'
        'declare variable DIFFRETE double precision;'
        'declare variable DIFSEG double precision;'
        'declare variable DIFOUTRO double precision;'
        'declare variable DIFDESC double precision;'
        'declare variable SEQID_IT integer;'
        'declare variable VNFLIQ double precision;'
        'declare variable ICM_BASE double precision;'
        'declare variable ICM_VALOR double precision;'
        'declare variable PIS_VALOR double precision;'
        'declare variable COFINS_VALOR double precision;'
        'declare variable TOTTRIB_VALOR double precision;'
        'begin'
        '  select nfce.cod_nfce, nfce.cod_empresa,'
        
          '     nfce.vfrete, nfce.vseg, nfce.voutro, nfce.vdesc, nfce.desc_' +
          'por_item,'
        '     coalesce(nfce.frete_na_base, '#39'N'#39')'
        '    from nfce'
        
          '    where nfce.cod_nfce = :codigo_nfce and nfce.cod_empresa = :c' +
          'odigo_empresa'
        
          '      into :codnfce, :codempresa, :frete, :seg, :outro, :descont' +
          'o, :desc_por_it, :frete_calc;'
        '  if (coalesce(codnfce, 0) = 0) then'
        '  begin'
        '    sucesso = 0;'
        '    suspend;'
        '    exit;'
        '  end'
        ''
        '  select'
        '    sum(coalesce(nfce_item.vprod, 0)),'
        '    sum(coalesce(nfce_item.icm_vbc, 0)),'
        '    sum(coalesce(nfce_item.icm_vicms, 0)),'
        '    sum(coalesce(nfce_item.pis_vpis, 0)),'
        '    sum(coalesce(nfce_item.cofins_vcofins, 0)),'
        '    sum(coalesce(nfce_item.vtottrib, 0))'
        '    from nfce_item'
        
          '  where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empresa ' +
          '=  :codempresa'
        
          '    into :prod, :icm_base, :icm_valor, :pis_valor, :cofins_valor' +
          ', :tottrib_valor;'
        ''
        '  if ((desc_por_it = '#39'S'#39') and (coalesce(prod, 0) > 0)) then'
        '  begin'
        '    update nfce_item set'
        
          '      nfce_item.vfrete = round((coalesce(:frete,0) / coalesce(:p' +
          'rod, 0)) * nfce_item.vprod, 2),'
        
          '      nfce_item.vseg = round((coalesce(:seg, 0) / coalesce(:prod' +
          ', 0)) * nfce_item.vprod, 2),'
        
          '      nfce_item.voutro = round((coalesce(:outro, 0) / coalesce(:' +
          'prod, 0)) * nfce_item.vprod, 2)'
        
          '    where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empres' +
          'a =  :codempresa;'
        '  end'
        '  else if (coalesce(prod, 0) > 0) then'
        '  begin'
        '    update nfce_item set'
        
          '      nfce_item.vfrete = round((coalesce(:frete,0) / coalesce(:p' +
          'rod, 0)) * nfce_item.vprod, 2),'
        
          '      nfce_item.vseg = round((coalesce(:seg, 0) / coalesce(:prod' +
          ', 0)) * nfce_item.vprod, 2),'
        
          '      nfce_item.voutro = round((coalesce(:outro, 0) / coalesce(:' +
          'prod, 0)) * nfce_item.vprod, 2),'
        
          '      nfce_item.vdesc = round((coalesce(:desconto, 0) / coalesce' +
          '(:prod, 0)) * nfce_item.vprod, 2)'
        
          '    where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empres' +
          'a =  :codempresa;'
        '  end'
        ''
        
          '  select sum(coalesce(nfce_item.vfrete, 0)), sum(coalesce(nfce_i' +
          'tem.vseg, 0)),'
        
          '    sum(coalesce(nfce_item.voutro, 0)), sum(coalesce(nfce_item.v' +
          'desc,0))'
        '    from nfce_item'
        
          '  where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empresa ' +
          '= :codempresa'
        '    into :sumfrete, :sumseg, :sumoutro, :sumdesconto;'
        ''
        '  difseg = coalesce(seg, 0) - coalesce(sumseg, 0);'
        '  difoutro = coalesce(outro, 0) - coalesce(sumoutro, 0);'
        '  diffrete = coalesce(frete, 0) - coalesce(sumfrete, 0);'
        '  if (desc_por_it = '#39'S'#39') then'
        '  begin'
        '    difdesc = 0;'
        '    desconto = sumdesconto;'
        '  end'
        '  else'
        '    difdesc = coalesce(desconto, 0) - coalesce(sumdesconto, 0);'
        ''
        
          '  if ((coalesce(difseg, 0) <> 0) or (coalesce(difoutro, 0) <> 0)' +
          ' or'
        
          '    (coalesce(diffrete, 0) <> 0) or (coalesce(difdesc, 0) <> 0))' +
          ' then'
        '  begin'
        '    select first 1 nfce_item.seqid from nfce_item'
        
          '    where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empres' +
          'a =  :codempresa'
        
          '      and ((coalesce(nfce_item.vseg, 0) + coalesce(:difseg, 0) )' +
          ' >= 0)'
        
          '      and ((coalesce(nfce_item.voutro, 0) + coalesce(:difoutro, ' +
          '0) ) >= 0)'
        
          '      and ((coalesce(nfce_item.vfrete, 0) + coalesce(:diffrete, ' +
          '0) ) >= 0)'
        
          '      and ((coalesce(nfce_item.vdesc, 0) + coalesce(:difdesc, 0)' +
          ' ) >= 0)'
        '      into :seqid_it;'
        ''
        '    if (coalesce(seqid_it, 0) > 0) then'
        '    begin'
        '      update nfce_item set'
        
          '        nfce_item.vseg = coalesce(nfce_item.vseg, 0) + coalesce(' +
          ':difseg, 0),'
        
          '        nfce_item.voutro = coalesce(nfce_item.voutro, 0) + coale' +
          'sce(:difoutro, 0),'
        
          '        nfce_item.vfrete = coalesce(nfce_item.vfrete, 0) + coale' +
          'sce(:diffrete, 0),'
        
          '        nfce_item.vdesc = coalesce(nfce_item.vdesc, 0) + coalesc' +
          'e(:difdesc, 0)'
        
          '      where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empr' +
          'esa =  :codempresa'
        '        and nfce_item.seqid = :seqid_it;'
        '    end'
        '  end'
        ''
        '  select'
        '    sum(coalesce(nfce_item.vprod, 0)),'
        '    sum(coalesce(nfce_item.icm_vbc, 0)),'
        '    sum(coalesce(nfce_item.icm_vicms, 0)),'
        '    sum(coalesce(nfce_item.pis_vpis, 0)),'
        '    sum(coalesce(nfce_item.cofins_vcofins, 0)),'
        '    sum(coalesce(nfce_item.vtottrib, 0))'
        '    from nfce_item'
        
          '  where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empresa ' +
          '=  :codempresa'
        
          '    into :prod, :icm_base, :icm_valor, :pis_valor, :cofins_valor' +
          ', :tottrib_valor;'
        ''
        '  if (frete_calc = '#39'S'#39') then'
        '    vnfliq = coalesce(frete, 0);'
        '  else'
        '    vnfliq = 0;'
        ''
        '  vnfliq = coalesce(vnfliq, 0) + coalesce(prod, 0) +'
        '    coalesce(seg, 0) + coalesce(outro, 0) -'
        '    coalesce(desconto, 0);'
        ''
        '  update nfce set'
        '    nfce.vprod = coalesce(:prod, 0),'
        '    nfce.vnf = coalesce(:vnfliq, 0),'
        '    nfce.vdesc = coalesce(:desconto, 0),'
        ''
        '    nfce.vbc = coalesce(:icm_base, 0),'
        '    nfce.vicms = coalesce(:icm_valor, 0),'
        '    nfce.vpis = coalesce(:pis_valor, 0),'
        '    nfce.vcofins = coalesce(:cofins_valor, 0),'
        '    nfce.vtottrib = coalesce(:tottrib_valor, 0)'
        ''
        
          '  where nfce.cod_nfce = :codnfce and nfce.cod_empresa =  :codemp' +
          'resa;'
        ''
        '  sucesso = 1;'
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC001'#39', :COD_EMPRESA, '#39'AB' +
          'RIR CADASTRO DE EMISSOR NFC'#39', 10, '#39'N'#39', '#39'FRMCADNFC_EMISSOR'#39', 1, '#39 +
          'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC002'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTAR EMISSOR NFC'#39', 10, '#39'N'#39', '#39'FRMCADNFC_EMISSOR'#39', 1, '#39'S'#39', C' +
          'URRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC003'#39', :COD_EMPRESA, '#39'BT' +
          ' INLCUIR EMISSOR NFC'#39', 10, '#39'N'#39', '#39'FRMCADNFC_EMISSOR'#39', 1, '#39'S'#39', CUR' +
          'RENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC004'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR EMISSOR NFC'#39', 10, '#39'N'#39', '#39'FRMCADNFC_EMISSOR'#39', 1, '#39'S'#39', CUR' +
          'RENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC005'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR EMISSOR NFC'#39', 10, '#39'S'#39', '#39'FRMCADNFC_EMISSOR'#39', 1, '#39'S'#39', CURR' +
          'ENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC006'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR EMISSOR NFC'#39', 100, '#39'S'#39', '#39'FRMCADNFC_EMISSOR'#39', 1, '#39'S'#39', CU' +
          'RRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC007'#39', :COD_EMPRESA, '#39'AB' +
          'RIR CADASTRO DE NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIM' +
          'ESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC008'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTAR NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMESTAM' +
          'P);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC009'#39', :COD_EMPRESA, '#39'BT' +
          ' INLCUIR NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMESTAMP)' +
          ';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC010'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMESTAMP)' +
          ';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC011'#39', :COD_EMPRESA, '#39'BT' +
          ' EMITIR NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC012'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR NFCE'#39', 10, '#39'S'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMESTAMP' +
          ');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC013'#39', :COD_EMPRESA, '#39'BT' +
          ' IMPRIMIR NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMESTAMP' +
          ');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC014'#39', :COD_EMPRESA, '#39'BT' +
          ' ENVIAR EMAIL NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC015'#39', :COD_EMPRESA, '#39'BT' +
          ' CANCELAR NFCE'#39', 5, '#39'S'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMESTAMP' +
          ');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC016'#39', :COD_EMPRESA, '#39'BT' +
          ' INUTILIZAR NFCE'#39', 5, '#39'S'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMESTA' +
          'MP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC017'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR PRODUTO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC018'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR PRODUTO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC019'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR PRODUTO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC020'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR SERVICO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC021'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR SERVICO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC022'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR SERVICO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC023'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR SEQUENCIA DE PRECO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CU' +
          'RRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC024'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR TIPO DE DESCONTO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', C' +
          'URRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC025'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR PAGAMENTO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIM' +
          'ESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC026'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR PAGAMENTO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIM' +
          'ESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC027'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR PAGAMENTO NFCE'#39', 3, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIM' +
          'ESTAMP);'
        'ALTER TABLE PEDVENDA ADD COD_NFCE INTEGER;'
        'ALTER TABLE FORMPAGAMENTO ADD COD_NFCE INTEGER;'
        'ALTER TABLE FORMPAGAMENTO ADD NDOC_ANT VARCHAR(20);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER FORMPAGAMENTO_BU_NFCE FOR FORMPAGAMENTO'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  declare variable tamanhodoc integer;'
        '  declare variable postraco integer;'
        'begin   '
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (inserting) then'
        '  begin'
        
          '    postraco = coalesce((select result from pos('#39'-'#39', trim(new.nd' +
          'oc))), 0);'
        '    tamanhodoc = postraco - 1;'
        '    if ('
        '      (new.cod_nfce > 0) and'
        '      ((new.ndoc_ant is null) or (new.ndoc_ant = '#39#39')) and'
        '      (postraco > 0)'
        '      ) then'
        
          '      new.ndoc_ant = (select result from strzero(new.nrequisicao' +
          ', 6))||'
        
          '                     substring(new.ndoc from :postraco for (char' +
          '_length(trim(new.ndoc)) - :tamanhodoc ) );'
        '  end'
        ''
        '  if (updating) then'
        '  begin'
        '    if ('
        '      (old.tipdoc <> '#39'S2'#39') or'
        
          '      (old.n_processamento is null) or (old.n_processamento <= 0' +
          ') or'
        '      (old.cod_nfce is null) or (old.cod_nfce <= 0) or'
        '      (old.ndoc_ant is null) or (old.ndoc_ant = '#39#39')'
        '      ) then'
        '      exit;'
        '  '
        '    update controle_creditos cc set cc.n_doc_c = old.ndoc_ant'
        
          '      where cc.cod_cred = old.n_processamento and cc.cod_emp_mul' +
          't = old.cod_empresa'
        '      and char_length(cc.n_doc_c) > 5;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'if (not exists(select descricao from grade where cod_grade = 0 a' +
          'nd cod_empresa = 1)) then'
        
          '    execute statement '#39'INSERT INTO GRADE (COD_GRADE, COD_EMPRESA' +
          ', DESCRICAO, DESCRICAO1, ATIVO) VALUES (0, 1, '#39#39'SEM GRADE'#39#39', '#39#39'S' +
          'EM GRADE'#39#39', 1);'#39';'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE NFCE_DEST ('
        '    COD_NFCE     INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    CNPJCPF      VARCHAR(14),'
        '    XNOME        VARCHAR(60),'
        '    EMAIL        VARCHAR(60),'
        '    XLGR         VARCHAR(60),'
        '    NRO          VARCHAR(60),'
        '    XCPL         VARCHAR(60),'
        '    XBAIRRO      VARCHAR(60),'
        '    CMUN         INTEGER,'
        '    XMUN         VARCHAR(60),'
        '    UF           VARCHAR(2),'
        '    CEP          VARCHAR(8),'
        '    FONE         VARCHAR(14)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NFCE_DEST ADD CONSTRAINT PK_NFCE_DEST PRIMARY KEY (C' +
          'OD_NFCE, COD_EMPRESA);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL078'#39', :COD_EMPRESA, '#39'HA' +
          'B TESTE DOCUMENTOS C/ DATA FECH DIF DATA CAIXA'#39', 100, '#39'FRMPRINCI' +
          'PALCXL'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL079'#39', :COD_EMPRESA, '#39'PE' +
          'RM RECEB DOCUMENTOS C/ DATA FECH DIF DATA CAIXA'#39', 5, '#39'FRMPRINCIP' +
          'ALCXL'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC028'#39', :COD_EMPRESA, '#39'EM' +
          'ITIR NFCE AVULSA'#39', 100, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC029'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR VENDEDOR DA NFCE'#39', 10, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'N'#39', CURRENT_' +
          'TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NFC030'#39', :COD_EMPRESA, '#39'EN' +
          'VIAR NFCE EMITIDAS CONTING'#195#352'NCIA'#39', 10, '#39'N'#39', '#39'FRMCADNFCE'#39', 1, '#39'N'#39 +
          ', CURRENT_TIMESTAMP);')
    end
  end
end
