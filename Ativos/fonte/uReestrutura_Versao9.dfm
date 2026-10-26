inherited frmReestruturaVersao9: TfrmReestruturaVersao9
  Caption = 'frmReestruturaVersao9'
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
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'GES081'#39', :COD_EMPRESA, '#39'EX' +
          'PORTAR GRID OLAP PARA ARQUIVO XLS'#39', 10, '#39'N'#39', '#39'FRMCONSGERAL'#39', 1, ' +
          #39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'GES082'#39', :COD_EMPRESA, '#39'EX' +
          'PORTAR GRID OLAP PARA EXCEL OLE'#39', 10, '#39'N'#39', '#39'FRMCONSGERAL'#39', 1, '#39'S' +
          #39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'GES083'#39', :COD_EMPRESA, '#39'EX' +
          'PORTAR GRID OLAP PARA ARQUIVO HTML'#39', 10, '#39'N'#39', '#39'FRMCONSGERAL'#39', 1,' +
          ' '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'GES084'#39', :COD_EMPRESA, '#39'EX' +
          'PORTAR GRID OLAP PARA ARQUIVO PDF'#39', 10, '#39'N'#39', '#39'FRMCONSGERAL'#39', 1, ' +
          #39'S'#39', CURRENT_TIMESTAMP);'
        ''
        '|BLOCO|'
        'CREATE TABLE FIELDSOLAP_SALVOS ('
        '    COD_CONSULTA  INTEGER NOT NULL,'
        '    NOME_SALVO    VARCHAR(32) NOT NULL,'
        '    NOME_CAMPO    VARCHAR(30) NOT NULL,'
        '    COD_USUARIO   INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    TIPO_POS      VARCHAR(10),'
        '    SEQINT        INTEGER,'
        '    TIPO_CAMPO    CHAR(1)'
        ');'
        
          'ALTER TABLE FIELDSOLAP_SALVOS ADD CONSTRAINT PK_FIELDSOLAP_SALVO' +
          'S PRIMARY KEY (COD_CONSULTA, NOME_SALVO, NOME_CAMPO, COD_USUARIO' +
          ', COD_EMPRESA);'
        '|/BLOCO|'
        ''
        'ALTER TABLE NOTAFISCAL_ITEM ADD COD_NFCE INTEGER;'
        '')
    end
  end
end
