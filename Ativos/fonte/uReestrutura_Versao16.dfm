inherited frmReestruturaVersao16: TfrmReestruturaVersao16
  Caption = 'frmReestruturaVersao16'
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
        'CREATE TABLE PRODUTOS_EC ('
        '    GRUPO_PROD '#9#9'     INTEGER NOT NULL,'
        '    COD_PROD'#9#9'     CHAR(6) NOT NULL,'
        '    COD_EMPRESA'#9#9'     INTEGER NOT NULL,'
        '    DESCR_PROD_RES           VARCHAR(131),'
        '    DESCR_PROD_COMPL         BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
        '    SINC_ECOMMERCE           CHAR(1) DEFAULT '#39'N'#39','
        '    DISPONIVEL               CHAR(1) DEFAULT '#39'N'#39','
        '    PROMOCIONAL              CHAR(1) DEFAULT '#39'N'#39','
        '    FRETE_GRATIS             CHAR(1) DEFAULT '#39'N'#39','
        '    LANCAMENTO               CHAR(1) DEFAULT '#39'N'#39','
        '    DESTAQUE                 CHAR(1) DEFAULT '#39'N'#39','
        '    VARIACAO                 CHAR(1) DEFAULT '#39'N'#39','
        '    TERMOS_ACEITE            CHAR(1) DEFAULT '#39'N'#39','
        '    COMPREJUNTO              CHAR(1) DEFAULT '#39'N'#39','
        '    VIRTUAL                  CHAR(1) DEFAULT '#39'N'#39','
        '    COD_CATEGORIA            INTEGER,'
        '    ID_COMMERCE              INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_EC ADD CONSTRAINT PK_PRODUTOS_EC PRIMARY KE' +
          'Y (GRUPO_PROD, COD_PROD, COD_EMPRESA);'
        
          'ALTER TABLE PRODUTOS_EC ADD CONSTRAINT FK_PRODUTOS_EC_PRODUTOS F' +
          'OREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES PRODUT' +
          'OS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCADE ON UPDA' +
          'TE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE PRODUTOS_EC_GRADE ('
        '    GRUPO_PROD '#9#9'     INTEGER NOT NULL,'
        '    COD_PROD'#9#9'     CHAR(6) NOT NULL,'
        '    COD_GRADE'#9#9'     INTEGER NOT NULL,'
        '    COD_EMPRESA'#9#9'     INTEGER NOT NULL,'
        '    ID_COMMERCE              INTEGER           '
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_EC_GRADE ADD CONSTRAINT PK_PRODUTOS_EC_GRAD' +
          'E PRIMARY KEY (GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA);'
        
          'ALTER TABLE PRODUTOS_EC_GRADE ADD CONSTRAINT FK_PRODUTOS_EC_GRAD' +
          'E_PRODUTOS FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFER' +
          'ENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CAS' +
          'CADE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE CATEGORIA ('
        '  COD_CATEGORIA '#9'     INTEGER NOT NULL,'
        '  COD_EMPRESA'#9#9'     INTEGER NOT NULL,'
        '  DESCRICAO                  VARCHAR(50),'
        '  COD_CATEGORIA_PAI          INTEGER,'
        '  ID_COMMERCE                INTEGER,'
        '  ATIVO                      INTEGER DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CATEGORIA ADD CONSTRAINT PK_CATEGORIA PRIMARY KEY (C' +
          'OD_CATEGORIA, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE PRODUTOS_CATEGORIA ('
        '  GRUPO_PROD '#9#9'     INTEGER NOT NULL,'
        '  COD_PROD'#9#9'     CHAR(6) NOT NULL,'
        '  COD_EMPRESA'#9#9'     INTEGER NOT NULL,'
        '  COD_CATEGORIA              INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_CATEGORIA ADD CONSTRAINT PK_PRODUTOS_CATEGO' +
          'RIA PRIMARY KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA, COD_CATEGORI' +
          'A);'
        
          'ALTER TABLE PRODUTOS_CATEGORIA ADD CONSTRAINT FK_PRODUTOS_CATEGO' +
          'RIA_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFEREN' +
          'CES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCA' +
          'DE ON UPDATE CASCADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO309'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR ECOMMERCE SIMPL PROD'#39', 100, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'N' +
          #39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE PRODUTOS_IMAGENS ('
        '    GRUPO_PROD '#9#9'     INTEGER NOT NULL,'
        '    COD_PROD'#9#9'     CHAR(6) NOT NULL,'
        '    COD_GRADE'#9#9'     INTEGER NOT NULL,'
        '    COD_EMPRESA'#9#9'     INTEGER NOT NULL,'
        '    LISTA_IMAGENS            BLOB SUB_TYPE 1 SEGMENT SIZE 256,'
        '    URL_IMAGENS              BLOB SUB_TYPE 1 SEGMENT SIZE 256'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_IMAGENS ADD CONSTRAINT PK_PRODUTOS_IMAGENS ' +
          'PRIMARY KEY (GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA);'
        
          'ALTER TABLE PRODUTOS_IMAGENS ADD CONSTRAINT FK_PRODUTOS_IMAGENS_' +
          'PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES ' +
          'PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCADE O' +
          'N UPDATE CASCADE;'
        'ALTER TABLE MARCA_PROD ADD ID_COMMERCE INTEGER;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'API001'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA DE CONFIG API'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGAPI'#39', 1, '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'API002'#39', :COD_EMPRESA, '#39'BT' +
          ' PESQUISAR CONFIG API'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGAPI'#39', 1, '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'API003'#39', :COD_EMPRESA, '#39'BT' +
          ' INCLUIR CONFIG API'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGAPI'#39', 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'API004'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR CONFIG API'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGAPI'#39', 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'API005'#39', :COD_EMPRESA, '#39'BT' +
          ' APAGAR CONFIG API'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGAPI'#39', 1, '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'API006'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR CONFIG API'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGAPI'#39', 1, '#39'S'#39', CURRENT' +
          '_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE CONFIG_API ('
        '    COD_EMPRESA        INTEGER NOT NULL,'
        '    API                VARCHAR(20) NOT NULL,'
        '    URL_API            VARCHAR(100),'
        '    CONSUMER_KEY       VARCHAR(100),'
        '    CONSUMER_SECRET    VARCHAR(100),'
        '    CODE_AUTORIZATION  VARCHAR(100),'
        '    COD_TIP_CLIENTE    INTEGER,'
        '    TIPO_VENDA         CHAR(1),'
        '    COD_VENDEDOR       INTEGER,'
        '    COD_TAB_PRECO      INTEGER,'
        '    ATIVO              INTEGER default 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CONFIG_API ADD CONSTRAINT PK_CONFIG_API PRIMARY KEY ' +
          '(COD_EMPRESA, API);'
        'ALTER TABLE PRODUTOS ADD COMPRIMENTO_PROD T_N_GERAL;'
        'ALTER TABLE PRODUTOS ADD LARGURA_PROD T_N_GERAL;'
        'ALTER TABLE PRODUTOS ADD ALTURA_PROD T_N_GERAL;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_PRODUTOS_EC FOR PRODUTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER trigger tr_promocao_produto_ec for promocao_prod' +
          'uto'
        'active before insert or update or delete position 0'
        'AS '
        '   DECLARE VARIABLE GRUPO_PROD INTEGER; '
        '   DECLARE VARIABLE COD_PROD CHAR(6); '
        '   DECLARE VARIABLE VCOD_EMPRESA INTEGER;'
        '   DECLARE VARIABLE COD_PROMOCAO INTEGER;'
        '   DECLARE VARIABLE ECOMMERCE INTEGER; '
        '   DECLARE VARIABLE VATUALIZAR INTEGER;'
        ' BEGIN'
        '   /* TRIGGER TEXT */ '
        '   IF(SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN '
        '    EXIT; '
        ''
        '   if (DELETING) then'
        '   begin '
        '     if (COALESCE(OLD.COD_PROMOCAO, 0) <= 0) then '
        '         exit; '
        '     GRUPO_PROD = OLD.GRUPO_PROD; '
        '     COD_PROD = OLD.COD_PROD; '
        '     VCOD_EMPRESA = OLD.COD_EMPRESA;'
        '     COD_PROMOCAO = OLD.COD_PROMOCAO;'
        '   end '
        '   else '
        '   begin '
        '     if (COALESCE(NEW.COD_PROMOCAO, 0) <= 0) then '
        '         exit; '
        '     GRUPO_PROD = NEW.GRUPO_PROD; '
        '     COD_PROD = NEW.COD_PROD; '
        '     VCOD_EMPRESA = NEW.COD_EMPRESA;'
        '     COD_PROMOCAO = NEW.COD_PROMOCAO;'
        '   end '
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = :VCOD_EMPRESA INTO: ECOMMERCE' +
          ';'
        ''
        '  IF(COALESCE(ECOMMERCE, 0) <= 0) THEN'
        '    exit;'
        ''
        '   SELECT CONFIG_API.COD_TAB_PRECO FROM CONFIG_API'
        
          '      WHERE CONFIG_API.COD_EMPRESA = :VCOD_EMPRESA AND CONFIG_AP' +
          'I.API = '#39'TRAYCOMMERCE'#39' and CONFIG_API.COD_TAB_PRECO = :COD_PROMO' +
          'CAO'
        '      INTO: VATUALIZAR;'
        ''
        '   if (COALESCE(VATUALIZAR, 0) <= 0) then'
        
          '     SELECT PROMOCAO_ORDEM_EC.COD_PROMOCAO FROM PROMOCAO_ORDEM_E' +
          'C'
        
          '        WHERE PROMOCAO_ORDEM_EC.COD_PROMOCAO = :COD_PROMOCAO AND' +
          ' PROMOCAO_ORDEM_EC.COD_EMPRESA = :VCOD_EMPRESA'
        '        INTO: VATUALIZAR;'
        ''
        
          '   if (COALESCE(VATUALIZAR, 0) <> COALESCE(COD_PROMOCAO, 0)) the' +
          'n'
        '     exit;'
        ''
        '   update produtos_ec set produtos_ec.grupo_prod = :grupo_prod,'
        '    produtos_ec.cod_prod = :cod_prod,'
        '    produtos_ec.cod_empresa = :VCOD_EMPRESA'
        '  where produtos_ec.grupo_prod = :grupo_prod'
        '    and produtos_ec.cod_prod = :cod_prod'
        '    and produtos_ec.cod_empresa = :VCOD_EMPRESA;'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_COD_GRADE_PROD_EC FOR COD_GRADE_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = new.cod_empresa INTO: ecommer' +
          'ce;'
        ''
        '  if(coalesce(ecommerce, 0) <= 0) then'
        '    EXIT;'
        ''
        
          '  update produtos_ec_grade set produtos_ec_grade.grupo_prod = ne' +
          'w.grupo_prod,'
        '    produtos_ec_grade.cod_prod = new.cod_prod,'
        '    produtos_ec_grade.cod_empresa = new.cod_empresa'
        '  where produtos_ec_grade.grupo_prod = new.grupo_prod'
        '  and produtos_ec_grade.cod_prod = new.cod_prod'
        '  and produtos_ec_grade.cod_empresa = new.cod_empresa;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE PROMOCAO_ORDEM_EC ('
        '    COD_PROMOCAO  INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    ORDEM         INTEGER,'
        '    ATUAL         CHAR(1)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PROMOCAO_ORDEM_EC ADD CONSTRAINT PK_PROMOCAO_ORDEM_E' +
          'C PRIMARY KEY (COD_PROMOCAO, COD_EMPRESA);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_PROMOCAO_ORDEM_EC FOR PROMOCAO_ORDEM_' +
          'EC'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        ' DECLARE VARIABLE VCODIGO INTEGER;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if (new.ordem is not null) then'
        '    exit;'
        ''
        
          '  select COD from INCREMENTA_CODIGO(new.cod_empresa, '#39'PROMOCAO_O' +
          'RDEM_EC'#39') into :vcodigo;'
        '  new.ordem = :vcodigo;'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE PEDVENDA ADD ID_COMMERCE INTEGER;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO310'#39', :COD_EMPRESA, '#39'AP' +
          'AGAR PRODUTO UTILIZADO NO ECOMMERCE'#39', 100, '#39'S'#39', '#39'FRMCADPRODUTOS'#39 +
          ', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO311'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR DADOS PRODUTO - ECOMMERCE'#39', 10, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, ' +
          #39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO312'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR DADOS PRODUTO - ECOMMERCE'#39', 10, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39 +
          'N'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE FORMPAGAMENTO_EC('
        '    SEQFORM                INTEGER NOT NULL,'
        '    COD_EMPRESA            INTEGER NOT NULL,'
        '    NREQUISICAO            INTEGER,'
        '    TPDOCS                 VARCHAR(6),'
        '    CLIENTE                VARCHAR(60),'
        '    COD_CLIENTE            INTEGER,'
        '    INTERMEDIADOR          VARCHAR(80),'
        '    HISTORICO              VARCHAR(80),'
        '    VALORDOC               DOUBLE PRECISION DEFAULT 0.00,'
        '    DATA_BANCO             TIMESTAMP,'
        '    DATA                   TIMESTAMP,'
        '    DATA_CAD               TIMESTAMP,'
        '    DATA_MOD               TIMESTAMP,'
        '    METODO_PAG_ID          INTEGER,'
        '    ID_COMMERCE            INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE FORMPAGAMENTO_EC ADD CONSTRAINT PK_FORMPAGAMENTO_EC ' +
          'PRIMARY KEY (SEQFORM, COD_EMPRESA);'
        ''
        '|BLOCO|'
        ' CREATE TABLE FORMAS_ENVIO_EC('
        '    COD_FORMA          INTEGER NOT NULL,'
        '    COD_EMPRESA        INTEGER NOT NULL,'
        '    DESCRICAO          VARCHAR(100),'
        '    DISPLAY            VARCHAR(100),'
        '    STATUS             INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE FORMAS_ENVIO_EC ADD CONSTRAINT PK_FORMAS_ENVIO_EC PR' +
          'IMARY KEY (COD_FORMA, COD_EMPRESA);'
        'ALTER TABLE PEDVENDA ADD COD_FORMA_RAST INTEGER;'
        'ALTER TABLE PEDVENDA ADD DATA_ENVIO_RAST TIMESTAMP;'
        'ALTER TABLE PEDVENDA ADD COD_RASTREAMENTO VARCHAR(30);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND248'#39', :COD_EMPRESA, '#39'AB' +
          'RIR FORM DADOS E ENVIO PEDIDO - ECOMMERCE'#39', 10, '#39'N'#39', '#39'FRMCADPEDV' +
          'ENDA'#39', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND249'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR DADOS E ENVIO PEDIDO - ECOMMERCE'#39', 10, '#39'N'#39', '#39'FRMCADPEDVENDA' +
          #39', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND250'#39', :COD_EMPRESA, '#39'CA' +
          'NCELAR DAV FEITO PELO E-COMMERCE'#39', 10, '#39'S'#39', '#39'FRMCADPEDVENDA'#39', 1,' +
          ' '#39'N'#39', CURRENT_DATE);'
        
          'CREATE INDEX IDX_PRODUTOS_EC_GRADE ON PRODUTOS_EC_GRADE (GRUPO_P' +
          'ROD, COD_PROD, COD_EMPRESA, ID_COMMERCE);'
        'ALTER TABLE PRODUTOS ADD ID_COMMERCE INTEGER;'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS412'#39', :COD_EMPRESA, '#39'ABRIR TELA ' +
          'DE CADASTRO DE CATEGORIA'#39', 10, '#39'N'#39', '#39'FRMCADCATEGORIA'#39', 1, '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS413'#39', :COD_EMPRESA, '#39'BT PESQUISA' +
          'R CATEGORIA'#39', 10, '#39'N'#39', '#39'FRMCADCATEGORIA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS414'#39', :COD_EMPRESA, '#39'BT NOVA CAT' +
          'EGORIA'#39', 10, '#39'N'#39', '#39'FRMCADCATEGORIA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS415'#39', :COD_EMPRESA, '#39'BT ALTERAR ' +
          'CATEGORIA'#39', 10, '#39'N'#39', '#39'FRMCADCATEGORIA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS416'#39', :COD_EMPRESA, '#39'BT REMOVER ' +
          'PERMANENTEMENTE CATEGORIA'#39', 10, '#39'N'#39', '#39'FRMCADCATEGORIA'#39', 1, '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS417'#39', :COD_EMPRESA, '#39'BT SALVAR C' +
          'ATEGORIA'#39', 10, '#39'N'#39', '#39'FRMCADCATEGORIA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CREATE INDEX IDX_PEDVENDA_ECOMMERCE ON PEDVENDA (ID_COMMERCE, CO' +
          'D_EMPRESA);'
        
          'CREATE INDEX IDX_FORMPAGAMENTO_EC_NUMVEND ON FORMPAGAMENTO_EC (N' +
          'REQUISICAO, TPDOCS, COD_EMPRESA);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG041'#39', :COD_EMPRESA, '#39'FO' +
          'RMA DE PAG E-COMMERCE'#39', 4, '#39'N'#39', NULL, 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG042'#39', :COD_EMPRESA, '#39'UT' +
          'ILIZAR FORMAS E-COMMERCE'#39', 4, '#39'N'#39', NULL, 1, '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE INTERMEDIADOR_CONTROLE_EC ('
        '    SEQID          INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    INTERMEDIADOR  VARCHAR(80) NOT NULL,'
        '    CODIGO_CTRL    INTEGER NOT NULL,'
        '    METODO_PAG_ID  INTEGER DEFAULT 0'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE INTERMEDIADOR_CONTROLE_EC ADD CONSTRAINT PK_INTERMED' +
          'IADOR_CONTROLE_EC PRIMARY KEY (SEQID, COD_EMPRESA);'
        
          'CREATE UNIQUE INDEX IDX_INTERMEDIADOR_CONTROLE_UNQ ON INTERMEDIA' +
          'DOR_CONTROLE_EC (INTERMEDIADOR, COD_EMPRESA);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG043'#39', :COD_EMPRESA, '#39'VI' +
          'NCULAR INTERMEDIADOR AO CONTROLE'#39', 10, '#39'S'#39', NULL, 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        'ALTER TABLE FORMPAGAMENTO ADD METODO_PAG_ID INTEGER;'
        'ALTER TABLE FORMPAGAMENTO ADD INTERMEDIADOR VARCHAR(80);'
        
          'ALTER TABLE KITS_PROD_KITS ADD CONSTRAINT FK_KITS_PROD_KITS_PROD' +
          'UTOS FOREIGN KEY (GRUPO_PROD,COD_PROD,COD_EMPRESA) REFERENCES PR' +
          'ODUTOS(GRUPO_PROD,COD_PROD,COD_EMPRESA) ON DELETE CASCADE ON UPD' +
          'ATE CASCADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG044'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR VINCULO INTERMEDIADOR E CONTROLE'#39', 10, '#39'S'#39', NULL, 1, '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG045'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA P/ VINCULAR INTERMEDIADOR E CONTROLE'#39', 10, '#39'S'#39', NULL, 1' +
          ', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG046'#39', :COD_EMPRESA, '#39'RE' +
          'CEBER DOCUMENTO S/ UTIL INTERMEDIADOR ECOMMERCE'#39', 10, '#39'S'#39', NULL,' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE CONT_LIG ADD NCON_TARIFAINTERMPAG T_N_GERAL;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG047'#39', :COD_EMPRESA, '#39'LA' +
          'NC DIF COMO TAXA INTERMEDIADOR ECOMMERCE'#39', 10, '#39'S'#39', NULL, 1, '#39'S'#39 +
          ', CURRENT_DATE);'
        'ALTER TABLE FORMPAGAMENTO ADD INTERM_NUMVEND INTEGER;'
        'ALTER TABLE LANCCXL ADD TAXA_INTERMEDIADOR CHAR(1);'
        
          'CREATE INDEX IDX_LANCCXL_DOC ON LANCCXL (CODIGO_EMP, DATA_LC_CXL' +
          ', OP_CXL);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG048'#39', :COD_EMPRESA, '#39'CO' +
          'NSULTAR INTERMEDIADOR PAG ECOMMERCE'#39', 10, '#39'N'#39', NULL, 1, '#39'S'#39', CUR' +
          'RENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW CADTABELA('
        '    COD_PROMOCAO,'
        '    COD_EMPRESA,'
        '    DESCR_PROMOCAO)'
        'AS'
        'SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.COD_EMPRESA,'
        'PROMOCAO.DESCR_PROMOCAO FROM PROMOCAO'
        
          'INNER JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_T' +
          'PPRECO'
        
          '    AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA AND TIPO_P' +
          'RECO.TIPO = '#39'T'#39
        'WHERE PROMOCAO.ATIVO = 1 AND PROMOCAO.COD_PROMOCAO > 0;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW CADPROMOCAO ('
        'COD_PROMOCAO,'
        'COD_EMPRESA,'
        'DESCR_PROMOCAO,'
        'ORDEM,'
        'DATA_INI,'
        'DATA_FIM,'
        'HORA_INI,'
        'HORA_FIM)'
        'as'
        'SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.COD_EMPRESA,'
        'PROMOCAO.DESCR_PROMOCAO, PROMOCAO.ORDEM,'
        'PROMOCAO.DATA_INI, PROMOCAO.DATA_FIM,'
        'PROMOCAO.HORA_INI, PROMOCAO.HORA_FIM FROM PROMOCAO'
        
          'INNER JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_T' +
          'PPRECO'
        
          '    AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA AND TIPO_P' +
          'RECO.TIPO = '#39'P'#39
        'WHERE PROMOCAO.ATIVO = 1;'
        '|/BLOCO|'
        ''
        'ALTER TABLE INTERMEDIADOR_CONTROLE_EC ADD COD_COND_PAG INTEGER;'
        'ALTER TABLE GRADE ADD TIPO_EC VARCHAR(100);'
        'ALTER TABLE GRADE ADD DESCRICAO_EC VARCHAR(100);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO313'#39', :COD_EMPRESA, '#39'ALTER TIPO ' +
          'DA GRADE - ECOMMERCE'#39', 10, '#39'S'#39', '#39'FRMCADGRADE'#39', 1, '#39'S'#39', CURRENT_D' +
          'ATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_COD_GRADE_PROD_DEL FOR COD_GRADE_PROD'
        'ACTIVE AFTER DELETE POSITION 0'
        'AS'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = old.cod_empresa INTO: ecommer' +
          'ce;'
        ''
        '  if(coalesce(ecommerce, 0) <= 0) then'
        '    EXIT;'
        ''
        '  delete from produtos_ec_grade'
        '  where produtos_ec_grade.grupo_prod = old.grupo_prod'
        '   and produtos_ec_grade.cod_prod = old.cod_prod'
        '   and produtos_ec_grade.cod_grade = old.cod_grade'
        '   and produtos_ec_grade.cod_empresa = old.cod_empresa;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW CADTABELAPROMOCAO('
        '    COD_PROMOCAO,'
        '    COD_EMPRESA,'
        '    DESCR_PROMOCAO,'
        '    ORDEM,'
        '    DATA_INI,'
        '    DATA_FIM,'
        '    HORA_INI,'
        '    HORA_FIM)'
        'AS'
        'SELECT PROMOCAO.COD_PROMOCAO, PROMOCAO.COD_EMPRESA,'
        'PROMOCAO.DESCR_PROMOCAO, PROMOCAO.ORDEM,'
        'PROMOCAO.DATA_INI, PROMOCAO.DATA_FIM,'
        'PROMOCAO.HORA_INI, PROMOCAO.HORA_FIM FROM PROMOCAO'
        
          'INNER JOIN TIPO_PRECO ON TIPO_PRECO.COD_TPPRECO = PROMOCAO.COD_T' +
          'PPRECO'
        '    AND TIPO_PRECO.COD_EMPRESA = PROMOCAO.COD_EMPRESA'
        'WHERE PROMOCAO.ATIVO = 1 AND PROMOCAO.COD_PROMOCAO > 0;'
        '|/BLOCO|'
        ''
        'ALTER TABLE PEDVENDA ADD IDSITPED_EC INTEGER;'
        'ALTER TABLE CLIENTES ADD ID_COMMERCE INTEGER;'
        
          'ALTER TABLE NOTAFISCAL_SPED_C120 DROP CONSTRAINT PK_NOTAFISCAL_S' +
          'PED_C120;'
        ''
        '|BLOCO|'
        'update RDB$FIELDS set'
        'RDB$FIELD_LENGTH = 15,'
        'RDB$CHARACTER_LENGTH = 15'
        
          'where RDB$FIELD_NAME = (select trim(f.rdb$field_name) from rdb$r' +
          'elation_fields r'
        'join rdb$fields f on f.rdb$field_name = rdb$field_source'
        
          'where (r.rdb$relation_name = '#39'NOTAFISCAL_SPED_C120'#39') and (r.rdb$' +
          'field_name='#39'NUM_DOC_IMP'#39'))'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NOTAFISCAL_SPED_C120 ADD CONSTRAINT PK_NOTAFISCAL_SP' +
          'ED_C120 PRIMARY KEY (COD_NF, COD_EMPRESA, NUM_DOC_IMP, NUM_ACDRA' +
          'W);'
        'ALTER TABLE MARCA_PROD ADD DESCRICAO_EC VARCHAR(30);'
        'ALTER TABLE PRODUTOS_EC ADD ESTOQUE_EC T_D_QUANT;'
        'ALTER TABLE PRODUTOS_EC_GRADE ADD ESTOQUE_EC T_D_QUANT;'
        'ALTER TABLE PRODUTOS_EC ADD ESTOQUE_MIN_EC T_D_QUANT;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*create or alter procedure GETESTOQUEDISPONIVEL */'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure MOVIMENTA_ESTOQUE_EC ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_EMPRESA integer,'
        '    PCOD_GRADE integer,'
        '    PQTDE_ENTRADA double precision,'
        '    PQTDE_SAIDA double precision)'
        'as'
        'declare variable PEXISTEGRADE smallint;'
        'begin'
        '  if (:pqtde_entrada > 0) then'
        '  begin'
        
          '    update produtos_ec set estoque_ec = estoque_ec + :pqtde_entr' +
          'ada'
        
          '      where grupo_prod = :pgrupo_prod and cod_prod = :pcod_prod ' +
          'and cod_empresa = :pcod_empresa;'
        ''
        ''
        '    if (:pcod_grade > 0) then'
        '    begin'
        '      pexistegrade = 0;'
        '      select first 1 cod_grade from produtos_ec_grade'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa'
        '        and cod_grade = :pcod_grade into :pexistegrade;'
        ''
        '      if (coalesce(:pexistegrade,0) > 0) then'
        '      begin'
        
          '        update produtos_ec_grade set estoque_ec = estoque_ec + :' +
          'pqtde_entrada'
        
          '          where grupo_prod = :pgrupo_prod and cod_prod = :pcod_p' +
          'rod and cod_empresa = :pcod_empresa'
        '          and cod_grade = :pcod_grade;'
        '      end'
        '      else'
        '      begin'
        
          '        insert into produtos_ec_grade (grupo_prod, cod_prod, cod' +
          '_grade, cod_empresa, estoque_ec)'
        
          '          values (:pgrupo_prod, :pcod_prod, :pcod_grade, :pcod_e' +
          'mpresa, :pqtde_entrada);'
        '      end'
        '    end'
        '  end'
        '  else if (:pqtde_saida > 0) then'
        '  begin'
        
          '    update produtos_ec set estoque_ec = estoque_ec - :pqtde_said' +
          'a'
        
          '      where grupo_prod = :pgrupo_prod and cod_prod = :pcod_prod ' +
          'and cod_empresa = :pcod_empresa;'
        ''
        '    if (:pcod_grade > 0) then'
        '    begin'
        '      pexistegrade = 0;'
        '      select first 1 cod_grade from produtos_ec_grade'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa'
        '        and cod_grade = :pcod_grade into :pexistegrade;'
        ''
        '      if (coalesce(:pexistegrade,0) > 0) then'
        '      begin'
        
          '        update produtos_ec_grade set estoque_ec = estoque_ec - :' +
          'pqtde_saida'
        
          '          where grupo_prod = :pgrupo_prod and cod_prod = :pcod_p' +
          'rod and cod_empresa = :pcod_empresa'
        '          and cod_grade = :pcod_grade;'
        '      end'
        '      else'
        '      begin'
        
          '        insert into produtos_ec_grade (grupo_prod, cod_prod, cod' +
          '_grade, cod_empresa, estoque_ec)'
        
          '          values (:pgrupo_prod, :pcod_prod, :pcod_grade, :pcod_e' +
          'mpresa, ((-1) * :pqtde_saida));'
        '      end'
        '    end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_EC FOR PRODUTOS'
        'ACTIVE AFTER INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        '  DECLARE VARIABLE VSQL VARCHAR(100);'
        'begin'
        '  /* Trigger text */'
        '   IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  VSQL = '#39#39';'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = new.cod_empresa INTO: ecommer' +
          'ce;'
        ''
        '  IF(COALESCE(ECOMMERCE, 0) <= 0) THEN'
        '    exit;'
        ''
        '  if (updating) then'
        
          '    if ((coalesce(old.ativo, 0) <> coalesce(new.ativo, 0)) and (' +
          'new.ativo = 0)) then'
        '      VSQL = '#39' produtos_ec.disponivel = '#39#39'N'#39#39', '#39';'
        ''
        '  execute statement'
        '   '#39'update produtos_ec set '#39'||VSQL||'#39
        '      produtos_ec.grupo_prod = '#39'||new.grupo_prod||'#39','
        '      produtos_ec.cod_prod = '#39#39#39'||new.cod_prod||'#39#39#39','
        '      produtos_ec.cod_empresa = '#39'||new.cod_empresa||'#39
        '    where produtos_ec.grupo_prod = '#39'||new.grupo_prod||'#39
        '    and produtos_ec.cod_prod = '#39#39#39'||new.cod_prod||'#39#39#39
        '    and produtos_ec.cod_empresa = '#39'||new.cod_empresa||'#39';'#39';'
        ''
        
          '  update produtos_ec_grade set produtos_ec_grade.grupo_prod = ne' +
          'w.grupo_prod,'
        '    produtos_ec_grade.cod_prod = new.cod_prod,'
        '    produtos_ec_grade.cod_empresa = new.cod_empresa'
        '  where produtos_ec_grade.grupo_prod = new.grupo_prod'
        '    and produtos_ec_grade.cod_prod = new.cod_prod'
        '    and produtos_ec_grade.cod_empresa = new.cod_empresa;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_EC_SEQ FOR PRODUTOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE IDCOMMERCE INTEGER;'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        'begin'
        '  /* Trigger text */'
        '   IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = new.cod_empresa INTO: ecommer' +
          'ce;'
        ''
        '  IF(COALESCE(ECOMMERCE, 0) <= 0) THEN'
        '    exit;'
        ''
        '  SELECT PRODUTOS_EC.ID_COMMERCE FROM PRODUTOS_EC'
        
          '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD AND PRODUTOS_EC.' +
          'COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO: IDCOMMERCE' +
          ';'
        ''
        '  IF (COALESCE(IDCOMMERCE, 0) > 0) THEN'
        '    new.ID_COMMERCE = :IDCOMMERCE;'
        'end;'
        '|/BLOCO|'
        ''
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO314'#39', :COD_EMPRESA, '#39'ALTER ESTOQ' +
          'UE PRODUTOS - ECOMMERCE'#39', 10, '#39'S'#39', '#39'FRMCADGRADE'#39', 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO315'#39', :COD_EMPRESA, '#39'ALTER ESTOQ' +
          'UE GRADE - ECOMMERCE'#39', 10, '#39'S'#39', '#39'FRMCADGRADE'#39', 1, '#39'S'#39', CURRENT_D' +
          'ATE);'
        'ALTER TABLE MENSAGEM_MOB ADD ORIG_MENS CHAR(1);'
        'ALTER TABLE PEDVENDA ADD STATUS_EC VARCHAR(100);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_EMPRESA, COD_PROCESSO' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA) VALUES (:COD_EMPRESA, '#39'PPR038'#39', '#39'BT IMPORTAR PEDI' +
          'DO DE COMPRA'#39', 10, '#39'N'#39', '#39'FRMCADFORMULAPROD'#39', 1, '#39'S'#39');'
        'ALTER TABLE PRODUCAO_ITEM ADD COD_GRADE INTEGER DEFAULT 0;'
        
          'ALTER TABLE PRODUCAO_ITEM_INDICE ADD COD_GRADE INTEGER DEFAULT 0' +
          ';'
        ''
        '|BLOCO|'
        'CREATE TABLE PRODUTOS_PDC_VAR ('
        '    ID_IND       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    GRUPO_PROD   INTEGER NOT NULL,'
        '    COD_PROD     CHAR(6) NOT NULL,'
        '    COD_GRADE    INTEGER,'
        '    DESCRICAO    VARCHAR(75)'
        ');'
        
          'ALTER TABLE PRODUTOS_PDC_VAR ADD CONSTRAINT PK_PRODUTOS_PDC_VAR ' +
          'PRIMARY KEY (ID_IND, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_PDC_VAR ADD CONSTRAINT FK_PRODUTOS_PDC_VAR ' +
          'FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES PRODU' +
          'TOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCADE ON UPD' +
          'ATE CASCADE;'
        
          'ALTER TABLE PRODUTOS_PDC_VAR ADD CONSTRAINT FK_PRODUTOS_PDC_VAR_' +
          'G FOREIGN KEY (COD_GRADE, COD_EMPRESA) REFERENCES GRADE (COD_GRA' +
          'DE, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE PRODUTOS_PDC_VAR_IT ('
        '    ID_IND       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    ID_IND_IT    INTEGER NOT NULL,'
        '    GRUPO_PROD   INTEGER NOT NULL,'
        '    COD_PROD     CHAR(6) NOT NULL,'
        '    COD_GRADE    INTEGER,'
        '    DESCRICAO    VARCHAR(75)'
        ');'
        
          'ALTER TABLE PRODUTOS_PDC_VAR_IT ADD CONSTRAINT PK_PRODUTOS_PDC_V' +
          'AR_IT PRIMARY KEY (ID_IND, COD_EMPRESA, ID_IND_IT);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_PDC_VAR_IT ADD CONSTRAINT FK_PRODUTOS_PDC_V' +
          'AR_IND FOREIGN KEY (ID_IND, COD_EMPRESA) REFERENCES PRODUTOS_PDC' +
          '_VAR (ID_IND, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE PRODUTOS_PDC_VAR_IT ADD CONSTRAINT FK_PRODUTOS_PDC_V' +
          'AR_IT FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES' +
          ' PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE PRODUTOS_PDC_VAR_IT ADD CONSTRAINT FK_PRODUTOS_PDC_V' +
          'AR_IT_G FOREIGN KEY (COD_GRADE, COD_EMPRESA) REFERENCES GRADE (C' +
          'OD_GRADE, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA2*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER PRODUCAO_HIST_ESTOQUE_D FOR PRODUCAO*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETESTOQUEDISPONIVEL ('
        '    PGRUPOPROD integer,'
        '    PCODPROD char(6),'
        '    PCODGRADE integer,'
        '    PCODEMPRESA integer,'
        '    PNUMVENDA integer,'
        '    PTIPOVENDA varchar(5),'
        '    PCODPEDALMOX integer,'
        '    PNITEMPEDALMOX integer)'
        'returns ('
        '    ESTOQUE double precision,'
        '    PEND_REQOS double precision,'
        '    PEND_PDC double precision,'
        '    PEND_ALMOX double precision,'
        '    EST_F double precision)'
        'as'
        'declare variable VSQL varchar(1000);'
        'declare variable VESTOQUE double precision;'
        'declare variable VPENDENCIA double precision;'
        'declare variable VABATERITENS char(1);'
        'declare variable VCOD_VENDEDOR integer;'
        'declare variable VUSARCONFERENCIAPRODUTO char(1);'
        'begin'
        '  vSql = '#39#39';'
        
          '  select abater_itens from empresa where cod_empresa = :pcodempr' +
          'esa into: vabateritens;'
        ''
        '  if (coalesce(pcodgrade, 0) <= 0) then'
        '  begin'
        '    select est_f from produtos'
        '    where grupo_prod = :pgrupoprod'
        '    and cod_prod = :pcodprod'
        '    and cod_empresa = :pcodempresa into :vestoque;'
        '  end'
        '  else'
        '  begin'
        '    select qtde from cod_grade_prod'
        '    where grupo_prod = :pgrupoprod'
        '    and cod_prod = :pcodprod'
        '    and cod_grade = :pcodgrade'
        '    and cod_empresa = :pcodempresa into :vestoque;'
        '  end'
        ''
        '  est_f = coalesce(vestoque, 0);'
        ''
        
          '  if ((coalesce(vabateritens, '#39#39') = '#39'S'#39') and (coalesce(pnumvenda' +
          ', 0) > 0) and (Trim(coalesce(ptipovenda, '#39#39')) <> '#39#39')) then'
        '  begin'
        
          '    select first 1 coalesce(tv.usar_conferencia_produto, '#39#39') as ' +
          'usar_conferencia_produto, pv.cod_vendedor from pedvenda pv'
        
          '    inner join tipo_vendas tv on tv.tipo = pv.tipo and tv.sigla ' +
          '= pv.tipv'
        '    where pv.nped = :pnumvenda'
        '    and pv.tipo = :ptipovenda'
        '    and pv.cod_empresa = :pcodempresa'
        
          '    order by tv.cod_tipo into : vusarconferenciaproduto, :vcod_v' +
          'endedor;'
        ''
        '    if (coalesce(vusarconferenciaproduto, '#39#39') <> '#39'S'#39') then'
        
          '      vSql = vsql || '#39' inner join tipo_vendas tv on tv.sigla = p' +
          'd.tipv and tv.tipo = pd.tipo'
        
          '         and (coalesce(tv.usar_conferencia_produto, '#39#39#39#39') <> '#39#39'S' +
          #39#39')'#39';'
        '  end'
        ''
        
          '  vSql = vSql || '#39' where pd.ativo = 1 and itpd.grupo_prod = '#39'||:' +
          'pgrupoprod||'#39' and itpd.cod_prod = '#39#39#39'||:pcodprod||'#39#39#39
        '     and pd.cod_empresa = '#39' || pcodempresa ||'#39
        
          '     and (pd.data_fech is null or pd.data_fech < '#39#39'01.01.1899'#39#39' ' +
          ') and (itpd.status<>'#39#39'CANCELADO'#39#39' or itpd.status is null)'
        '     and pd.tipo <> '#39#39'ORC'#39#39' '#39';'
        ''
        
          '  if ((coalesce(vabateritens, '#39#39') = '#39'S'#39') and (coalesce(pnumvenda' +
          ', 0) > 0)'
        
          '    and (Trim(ptipovenda) <> '#39#39') and (Trim(vusarconferenciaprodu' +
          'to) <> '#39'S'#39')) then'
        '    vSql = vSql || '#39' and pd.cod_vendedor = '#39'|| :vcod_vendedor;'
        ''
        '  if (coalesce(pcodgrade, 0) > 0) then'
        '    vSql = vSql || '#39' and itpd.cod_grade = '#39'|| :pcodgrade;'
        '             '
        
          '  if ((coalesce(pnumvenda, 0) > 0) and (coalesce(ptipovenda, '#39#39')' +
          ' <> '#39#39')) then'
        
          '    vSql = vSql || '#39' and pd.nped = '#39'|| :pnumvenda || '#39' and pd.ti' +
          'po = '#39#39#39' || :ptipovenda || '#39#39#39' '#39';'
        ''
        '  execute statement'
        
          '    '#39' select sum(itpd.quant_ped_item) as pendecia from pedvenda ' +
          'pd'
        
          '    inner join pedvenda_prod itpd on pd.nped = itpd.nped and pd.' +
          'cod_empresa = itpd.cod_empresa and pd.tipo = itpd.tipo'
        '    '#39' || vSql into :vpendencia;'
        ''
        '  pend_reqos = coalesce(vpendencia, 0);'
        ''
        '  vestoque = coalesce(vestoque, 0) - coalesce(vpendencia, 0);'
        ''
        '  vsql = '#39#39';'
        '  if (coalesce(pcodgrade, 0) > 0) then'
        '    vSql = vSql || '#39' and pi.cod_grade = '#39'||:pcodgrade;'
        ''
        '  if (Trim(coalesce(ptipovenda, '#39#39')) = '#39'PRODUCAO'#39') then'
        '    vSql = vSql || '#39' and pd.cod_producao <> '#39'|| :pnumvenda;'
        ''
        
          '  execute statement '#39'select sum(coalesce(pi.quantidade_utilizada' +
          ',0) + coalesce(pi.quantidade_perda,0)) as pendecia from producao' +
          ' pd, producao_item_indice pi'
        '                    where pi.grupo_prod = '#39' || :pgrupoprod ||'
        '                    '#39' and pi.cod_prod = '#39#39#39' || :pcodprod || '#39#39#39
        
          '                    and pd.cod_producao = pi.cod_producao and pd' +
          '.cod_empresa = pi.cod_empresa'
        
          '                    and (pd.data_fechamento is null) and pd.cod_' +
          'empresa = '#39' || :pcodempresa || vsql into :vpendencia;'
        ''
        '  pend_pdc = coalesce(vpendencia, 0);'
        ''
        '  vestoque = coalesce(vestoque, 0) - coalesce(vpendencia, 0);'
        ''
        '  vSql = '#39#39';'
        '  if (coalesce(pcodgrade, 0) > 0) then'
        '      vSql = vSql || '#39' and c.cod_grade = '#39'||:pcodgrade;'
        ''
        '  execute statement'
        
          '    '#39' select sum(coalesce(c.quant,0)) as pendecia from controle_' +
          'almoxarifado c'
        
          '      where not(c.cod_pedido = '#39'||:pcodpedalmox||'#39' and c.nitem =' +
          ' '#39'||:pnitempedalmox||'#39')'#39'||'#39
        
          '      and c.grupo_prod = '#39'|| :pgrupoprod ||'#39' and c.cod_prod = '#39#39 +
          #39'||:pcodprod||'#39#39#39
        
          '      and c.cod_empresa = '#39'||:pcodempresa|| vsql into :vpendenci' +
          'a;'
        ''
        '  pend_almox = coalesce(vpendencia, 0);'
        ''
        '  vestoque = coalesce(vestoque, 0) - coalesce(vpendencia, 0);'
        ''
        '  ESTOQUE = vestoque;'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        
          'update producao_item set cod_grade = 0 where cod_grade is null a' +
          'nd cod_empresa = :cod_empresa;'
        
          'update producao_item_indice set cod_grade = 0 where cod_grade is' +
          ' null and cod_empresa = :cod_empresa;')
    end
  end
end
