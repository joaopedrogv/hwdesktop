inherited frmReestruturaVersao6: TfrmReestruturaVersao6
  Caption = 'frmReestruturaVersao6'
  ExplicitWidth = 1076
  ExplicitHeight = 600
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
        '|BLOCO|CMD:COMMIT|'
        'execute block as begin'
        
          'IF (NOT EXISTS(SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS WH' +
          'ERE RDB$FIELD_NAME = '#39'COD_GERADOR'#39' AND RDB$RELATION_NAME = '#39'PEDV' +
          'ENDA'#39')) THEN'
        
          '    execute statement '#39' ALTER TABLE PEDVENDA ADD COD_GERADOR INT' +
          'EGER; '#39';'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:COMMIT|'
        'execute block as begin'
        
          'IF (NOT EXISTS(SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS WH' +
          'ERE RDB$FIELD_NAME = '#39'COD_GERADOR'#39' AND RDB$RELATION_NAME = '#39'FORM' +
          'PAGAMENTO'#39')) THEN'
        
          '    execute statement '#39' ALTER TABLE FORMPAGAMENTO ADD COD_GERADO' +
          'R INTEGER; '#39';'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:COMMIT|'
        'execute block as begin'
        
          'IF (NOT EXISTS(SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS WH' +
          'ERE RDB$FIELD_NAME = '#39'COD_GERADOR'#39' AND RDB$RELATION_NAME = '#39'BOLE' +
          'TAS'#39')) THEN'
        
          '    execute statement '#39' ALTER TABLE BOLETAS ADD COD_GERADOR INTE' +
          'GER; '#39';'
        'end;'
        '|/BLOCO|'
        ''
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 40, RDB$CHARACTER_LENGT' +
          'H = 40 where RDB$FIELD_NAME = (select b.rdb$field_name from rdb$' +
          'relation_fields a inner join rdb$fields b on a.rdb$field_source ' +
          '= b.rdb$field_name where a.rdb$relation_name = '#39'GERADOR_OSBOL'#39' a' +
          'nd a.rdb$field_name = '#39'STATUS_TMO'#39');'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI209'#39', :COD_EMPRESA, '#39'CO' +
          'NFIRMAR GERACAO DE OS/FORMAS/BOLETAS'#39', 10, '#39'FRMGERADOROSFORMASBO' +
          'LETAS'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI210'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR GERACAO DE OS/FORMAS/BOLETAS'#39', 10, '#39'FRMGERADOROSFORMASBOLE' +
          'TAS'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI211'#39', :COD_EMPRESA, '#39'AB' +
          'RIR CONTRATOS GERADOS'#39', 10, '#39'FRMGERADOROSFORMASBOLETAS'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI212'#39', :COD_EMPRESA, '#39'CO' +
          'NSULTAR CONTRATOS GERADOS'#39', 10, '#39'FRMGERADOROSFORMASBOLETAS'#39', 1, ' +
          #39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'BT EXCLUIR' +
          ' CONTRATOS COM CLIENTES'#39' WHERE COD_PROCESSO = '#39'CLI176'#39' AND NOME_' +
          'PROCESSO = '#39'BT ESCLUIR CONTRATOS COM CLIENTES'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI213'#39', :COD_EMPRESA, '#39'RE' +
          'AJUSTAR VALOR CONTRATOS'#39', 10, '#39'FRMCADCONTRATOSCLIENTES'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        ''
        'ALTER TABLE CLIENTES_COM_CONTRATO ADD DATA_REAJUSTE TIMESTAMP;'
        'ALTER TABLE CLIENTES_COM_CONTRATO ADD PERC_REAJUSTE T_VL_TODOS;'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI214'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR GERAR CONTRATOS MAIS DE UMA VEZ POR MES'#39', 15, '#39'FRMCADCONT' +
          'RATOSCLIENTES'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        'ALTER TABLE PEDVENDA_SERV ADD COD_CONTRATO INTEGER;'
        ''
        
          'CREATE INDEX IDX_PEDVENDA_SERV_CONTRATOS ON PEDVENDA_SERV (COD_C' +
          'ONTRATO, TIPO, COD_EMPRESA);'
        ''
        
          'ALTER TABLE P_CONTAS ADD GERAR_CONTRAPARTIDA CHAR(1) DEFAULT '#39'N'#39 +
          ';'
        ''
        'ALTER TABLE CONTROLES ADD CONTRAPARTIDA CHAR(1) DEFAULT '#39'N'#39';'
        ''
        
          'UPDATE P_CONTAS SET GERAR_CONTRAPARTIDA = '#39'N'#39' WHERE GERAR_CONTRA' +
          'PARTIDA IS NULL;'
        ''
        
          'UPDATE CONTROLES SET CONTRAPARTIDA = '#39'N'#39' WHERE CONTRAPARTIDA IS ' +
          'NULL;'
        ''
        '|BLOCO|'
        'CREATE TABLE NOTIFICACAO_API ('
        '    CNPJ             VARCHAR(14) NOT NULL,'
        
          '    TOKEN            BLOB SUB_TYPE 1 SEGMENT SIZE 2048 CHARACTER' +
          ' SET ASCII,'
        '    SEQRANDOM        INTEGER DEFAULT 0,'
        '    DATACONSULTA     TIMESTAMP,'
        '    DATAFATURAMENTO  TIMESTAMP,'
        '    COD_FATURAMENTO  INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NOTIFICACAO_API ADD CONSTRAINT PK_NOTIFICACAO_API PR' +
          'IMARY KEY (CNPJ);'
        ''
        '|BLOCO|'
        'CREATE TABLE NOTIFICACAO_API_USUARIOS ('
        '    CNPJ          VARCHAR(14) NOT NULL,'
        '    USUARIO       VARCHAR(128) NOT NULL,'
        '    COD_NOTIF     INTEGER NOT NULL,'
        
          '    NOTIFICACOES  BLOB SUB_TYPE 1 SEGMENT SIZE 2048 CHARACTER SE' +
          'T ASCII,'
        '    LIDO          SMALLINT DEFAULT 0'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NOTIFICACAO_API_USUARIOS ADD CONSTRAINT PK_NOTIFICAC' +
          'AO_API_USUARIOS PRIMARY KEY (CNPJ, USUARIO, COD_NOTIF);'
        
          'ALTER TABLE NOTIFICACAO_API_USUARIOS ADD CONSTRAINT FK_NOTIF_API' +
          '_US_NOTIF FOREIGN KEY (CNPJ) REFERENCES NOTIFICACAO_API (CNPJ) O' +
          'N DELETE CASCADE ON UPDATE CASCADE;'
        ''
        'ALTER TABLE  GERADOR_OSBOL ADD  VALOR_GERADO T_VL_TODOS;'
        'ALTER TABLE  GERADOR_OSBOL ADD VALOR_BOL_GERADOR T_VL_TODOS;'
        'ALTER TABLE  GERADOR_OSBOL ADD VALOR_BOL_GERADO T_VL_TODOS;')
    end
  end
end
