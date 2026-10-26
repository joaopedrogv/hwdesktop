inherited frmReestruturaVersao21: TfrmReestruturaVersao21
  Caption = 'frmReestruturaVersao21'
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
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FIS057'#39', :COD_EMPRESA, '#39'IN' +
          'FORME CANCELAMENTO CUPOM FISCAL'#39', 10, '#39'S'#39', '#39'FRMPRINCIPALF'#39', 1, '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND253'#39', :COD_EMPRESA, '#39'SI' +
          'TUACAO DE CAIXA DO CLIENTE NA VENDA'#39', 1, '#39'N'#39', '#39'FRMCADPEDVENDA'#39', ' +
          '1, '#39'N'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NFCE_CHECK_EMISSOR ('
        '    IDEMPRESA integer)'
        'returns ('
        '    SUCESS smallint)'
        'as'
        '  declare variable IDEMISSOR integer;'
        'begin'
        
          '  select first 1 cod_emissor from nfc_emissor ne where ne.cod_em' +
          'presa = :idempresa'
        '    order by cod_emissor'
        '    into :idemissor;'
        ''
        '  if (coalesce(idemissor,  0) = 0) then'
        '  begin'
        '    sucess = 0;'
        '    exit;'
        '  end'
        ''
        '  update nfce set cod_emissor = :idemissor'
        
          '    where nfce.cod_emissor is null and nfce.cod_empresa = :idemp' +
          'resa;'
        ''
        '  sucess = 1;'
        ''
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        'CMD:REPL|select * from sp_nfce_check_emissor(:COD_EMPRESA);'
        
          'CMD:INATIVO|ALTER TABLE PENDENCIAS_CARTAO ADD COD_EMP_MULT INTEG' +
          'ER;'
        
          'CMD:REPL|CMD:INATIVO|UPDATE PENDENCIAS_CARTAO SET COD_EMP_MULT =' +
          ' COD_EMPRESA WHERE COD_EMP_MULT IS NULL;'
        'CMD:INATIVO|ALTER TABLE PEDVENDA_SERV_TERC ADD SEQID INTEGER;'
        'CMD:INATIVO|ALTER TABLE PEDVENDA_PROD_TERC ADD SEQID INTEGER;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*create or alter procedure SP_NFCE_RESET_PISCOFINS*/'
        '|/BLOCO|'
        ''
        'ALTER TABLE PENDENCIAS_CARTAO ADD COD_EMP_MULT INTEGER;'
        
          'CMD:REPL|UPDATE PENDENCIAS_CARTAO SET COD_EMP_MULT = COD_EMPRESA' +
          ' WHERE COD_EMP_MULT IS NULL;'
        'ALTER TABLE PEDVENDA_SERV_TERC ADD SEQID INTEGER;'
        'ALTER TABLE PEDVENDA_PROD_TERC ADD SEQID INTEGER;'
        ''
        '|BLOCO|'
        '/*create or alter procedure SP_NFCE_RESET_PISCOFINS*/'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_PEDVENDA_COD_NF ON PEDVENDA (COD_NF, COD_EMPRES' +
          'A);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO360'#39', :COD_EMPRESA, '#39'VE' +
          'RIFICACAO GERAL DA REPLICACAO INTERNA'#39', 11, '#39'FRMCADPRODUTOS'#39', 1,' +
          ' '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IFI005'#39', :COD_EMPRESA, '#39'PE' +
          'RM QUITAR ARQ RETORNO CREDITOS NAO ENCONTRADOS'#39', 10, '#39'frmImportR' +
          'etorno'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 130, RDB$CHARACTER_LENG' +
          'TH = 130 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'EMPRESA'#39') and (' +
          'r.rdb$field_name='#39'MENSAGEM_EMP'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 130, RDB$CHARACTER_LENG' +
          'TH = 130 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'PEDVENDA'#39') and ' +
          '(r.rdb$field_name='#39'OBS_PED'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'CONTROLE_CREDIT' +
          'OS'#39') and (r.rdb$field_name='#39'HISTORICO_C'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'BAIXA_CREDITOS'#39 +
          ') and (r.rdb$field_name='#39'HISTORICO_C'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'CONTROLE_CHEQUE' +
          #39') and (r.rdb$field_name='#39'HISTORICO_CH'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'CONTAS_A_PAGAR'#39 +
          ') and (r.rdb$field_name='#39'HISTORICO_CTP'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'LANCAMENTOS'#39') a' +
          'nd (r.rdb$field_name='#39'HISTORICO_L'#39'));'
        'ALTER TABLE CONTAS_A_PAGAR ADD NPARCELA INTEGER;'
        'ALTER TABLE CONTAS_A_PAGAR ADD QTDE_PARC INTEGER;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TABELA_PROCESSOS_BI_DEFAUT FOR TABELA_PR' +
          'OCESSOS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin        '
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (new.ativo is null) then'
        '    new.ativo = 1;'
        ''
        '  if (new.senha_gerente is null) then'
        '    new.senha_gerente = '#39'N'#39';'
        ''
        '  if (new.gravar_auditoria is null) then'
        '    new.gravar_auditoria = '#39'S'#39';'
        ''
        '  if (new.data_mod_cad is null) then'
        '    new.data_mod_cad = current_date;'
        ''
        '  if (new.form is null) then'
        '    new.form = '#39'.'#39';'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO363'#39', :COD_EMPRESA, '#39'BT CONSULTAR INVENTARIO'#39'     ' +
          '     ,  6, '#39'N'#39', '#39'N'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO364'#39', :COD_EMPRESA, '#39'BT NOVO PRODUTO INVENTARIO'#39'  ' +
          '     , 10, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO365'#39', :COD_EMPRESA, '#39'BT VISUALIZAR PRODUTOS INVENT' +
          'ARIO'#39', 10, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO366'#39', :COD_EMPRESA, '#39'BT ALTERAR PRODUTOS INVENTARI' +
          'O'#39'   , 10, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO367'#39', :COD_EMPRESA, '#39'BT REMOVER PRODUTOS INVENTARI' +
          'O'#39'   , 10, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO368'#39', :COD_EMPRESA, '#39'BT SALVAR  PRODUTOS INVENTARI' +
          'O'#39'   , 10, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO369'#39', :COD_EMPRESA, '#39'BT BUSCAR/ADD VND P/ INVENTAR' +
          'IO'#39'  , 10, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO370'#39', :COD_EMPRESA, '#39'BT ADD PROD DE VND P/ INVENTA' +
          'RIO'#39' , 10, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO371'#39', :COD_EMPRESA, '#39'BT REMOVER PROD DE VND PR INV' +
          'ENT'#39' , 10, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET GRAVAR_AUDITORIA = '#39'N'#39' WHER' +
          'E COD_PROCESSO = '#39'PRO283'#39' AND COD_EMPRESA = :COD_EMPRESA;'
        'ALTER TABLE INV_TIPO74 ADD ID INTEGER;'
        'CREATE INDEX IDX_INV_TIPO74_ID ON INV_TIPO74 (ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE INV_TIPO74_POSSE ('
        '    INV_ID       INTEGER NOT NULL,'
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    IND_PROP     SMALLINT,'
        '    COD_CLIENTE  INTEGER,'
        '    QTDE         T_VL_TODOS,'
        '    VALOR        T_VL_TODOS,'
        '    ATIVO        SMALLINT'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE INV_TIPO74_POSSE ADD CONSTRAINT PK_INV_TIPO74_POSSE ' +
          'PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE INV_TIPO74_POSSE ADD CONSTRAINT PK_INV_TIPO74_POSSE_' +
          'CLIENTE FOREIGN KEY (COD_CLIENTE, COD_EMPRESA) REFERENCES CLIENT' +
          'ES (COD_CLIENTE, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'CREATE INDEX IND_INV_TIPO74_POSSE ON INV_TIPO74_POSSE (INV_ID, C' +
          'OD_EMPRESA);'
        
          'CREATE UNIQUE INDEX IND_INV_TIPO74_UNQ ON INV_TIPO74_POSSE (INV_' +
          'ID, COD_EMPRESA, IND_PROP, COD_CLIENTE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INV_TIPO74_BD_POSSE FOR INV_TIPO74'
        'ACTIVE AFTER DELETE POSITION 0'
        'AS'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if ( coalesce(old.id, 0) = 0 ) then'
        '    exit;'
        ''
        
          '  delete from inv_tipo74_posse where inv_id = old.id and cod_emp' +
          'resa = old.cod_empresa;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_INV_TIPO74_CALC ('
        '    INV_ID integer,'
        '    COD_EMPRESA integer)'
        'returns ('
        '    QTDE double precision,'
        '    VALOR double precision)'
        'as'
        '  declare variable CONTADOR integer;'
        'begin'
        '  if (coalesce(inv_id, 0) = 0) then'
        '    exit;'
        ''
        
          '  select sum(coalesce(ip.qtde, 0)), sum(coalesce(ip.qtde, 0) * c' +
          'oalesce(ip.valor, 0)),'
        '    count(ip.inv_id) from inv_tipo74_posse ip'
        '    where ip.inv_id = :inv_id and ip.cod_empresa = :cod_empresa'
        '    into :qtde, :valor, :contador;'
        ''
        '  if (coalesce(:contador, 0) = 0) then'
        
          '    delete from inv_tipo74 where id = :inv_id and cod_empresa = ' +
          ':cod_empresa;'
        '  else'
        
          '    update inv_tipo74 set quantidade = coalesce(:qtde, 0), valor' +
          '_prod = coalesce(:valor, 0) / coalesce(:qtde, 0)'
        '      where id = :inv_id and cod_empresa = :cod_empresa;'
        ''
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER INV_TIPO74_POSSE_AIU_CALC FOR INV_TIPO74' +
          '_POSSE'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  declare variable qtde double precision;'
        '  declare variable valor double precision;'
        '  declare variable id integer;'
        '  declare variable cod_empresa integer;'
        'begin  '
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (deleting ) then'
        '  begin'
        '    id = old.inv_id;'
        '    cod_empresa = old.cod_empresa;'
        '  end'
        '  else'
        '  begin'
        '    id = new.inv_id;'
        '    cod_empresa = new.cod_empresa;'
        '  end'
        ''
        '  select qtde, valor from sp_inv_tipo74_calc(:id, :cod_empresa)'
        '    into :qtde, :valor;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER INV_TIPO74_POSSE_BIU0 FOR INV_TIPO74_POS' +
          'SE'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (coalesce(new.id, 0) = 0) then'
        
          '    select cod from incrementa_codigo(new.cod_empresa, '#39'INV_TIPO' +
          '74_POSSE'#39')'
        '      into new.id;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE PEDVENDA_INV_POSSE ('
        '    NPED         INTEGER NOT NULL,'
        '    TIPO         CHAR(3) NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    NITEM        INTEGER NOT NULL,'
        '    DATA_INV     TIMESTAMP NOT NULL,'
        '    POSSE_ID     INTEGER NOT NULL,'
        '    QTDE_APLIC   T_VL_TODOS NOT NULL,'
        '    VALOR_APLIC  T_VL_TODOS NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PEDVENDA_INV_POSSE ADD CONSTRAINT PK_PEDVENDA_INV_PO' +
          'SSE PRIMARY KEY (NPED, TIPO, COD_EMPRESA, NITEM, DATA_INV);'
        
          'ALTER TABLE PEDVENDA_INV_POSSE ADD CONSTRAINT FK_PEDVENDA_INV_PE' +
          'DVENDA FOREIGN KEY (NPED, TIPO, COD_EMPRESA) REFERENCES PEDVENDA' +
          ' (NPED, TIPO, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE PEDVENDA_INV_POSSE ADD CONSTRAINT FK_PEDVENDA_INV_PO' +
          'SSE FOREIGN KEY (POSSE_ID, COD_EMPRESA) REFERENCES INV_TIPO74_PO' +
          'SSE (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL084'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR NAO INFORMAR VALOR DE ENTRADA CXL'#39', 11, '#39'.'#39', 1, '#39'S'#39', '#39'S'#39',' +
          ' CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_INV_TIPO74('
        '    DATA_INV,'
        '    COD_EMPRESA,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    QUANTIDADE,'
        '    VALOR_PROD,'
        '    VALOR_TOTAL,'
        '    VALOR_TOTAL_R,'
        '    CODIGO_POSSE,'
        '    COD_CLIENTE,'
        '    CNPJ_POSSE,'
        '    INSCR_POSSE,'
        '    UF_POSSE,'
        '    CHASSI_MT,'
        '    VALOR_ICMS,'
        '    VALOR_PIS,'
        '    VALOR_COFINS,'
        '    ID)'
        'AS'
        
          'select I.DATA_INV, I.COD_EMPRESA, I.GRUPO_PROD, I.COD_PROD, I.PO' +
          'SSE_QTDE QUANTIDADE,'
        
          '       (I.POSSE_TOTAL / I.POSSE_QTDE) VALOR_PROD, I.POSSE_TOTAL ' +
          'VALOR_TOTAL, round(I.POSSE_TOTAL, 2) VALOR_TOTAL_R,'
        
          '       I.CODIGO_POSSE, I.COD_CLIENTE, I.CNPJ_POSSE, I.INSCR_POSS' +
          'E, I.UF_POSSE,'
        
          '       iif(trim(I7.CHASSI_MT) = '#39#39', null, I7.CHASSI_MT) CHASSI_M' +
          'T, I7.VALOR_ICMS, I7.VALOR_PIS, I7.VALOR_COFINS, I7.ID'
        
          'from (select INV.DATA_INV, INV.COD_EMPRESA, INV.GRUPO_PROD, INV.' +
          'COD_PROD,'
        
          '             iif(IP.ID is null, 0, iif(IP.IND_PROP = 0, 0, iif(I' +
          'P.IND_PROP = 1, 1, 2))) CODIGO_POSSE, IP.COD_CLIENTE,'
        
          '             CL.CPFCGC CNPJ_POSSE, CL.INSC_EST INSCR_POSSE, ES.S' +
          'IGLA_UF UF_POSSE,'
        
          '             sum(iif(IP.ID is null, INV.QUANTIDADE, IP.QTDE)) PO' +
          'SSE_QTDE,'
        
          '             sum(iif(IP.ID is null, INV.VALOR_PROD * INV.QUANTID' +
          'ADE, IP.VALOR * IP.QTDE)) POSSE_TOTAL'
        '      from INV_TIPO74 INV'
        '        left join INV_TIPO74_POSSE IP on IP.INV_ID = INV.ID and'
        '              IP.COD_EMPRESA = INV.COD_EMPRESA'
        
          '        left join CLIENTES CL on CL.COD_CLIENTE = IP.COD_CLIENTE' +
          ' and'
        '              CL.COD_EMPRESA = IP.COD_EMPRESA'
        '        left join ESTADOS ES on ES.CODIGO_UF = CL.CODIGO_UF'
        '      group by 1, 2, 3, 4, 5, 6, 7, 8, 9) as I'
        '  inner join INV_TIPO74 I7 on I7.DATA_INV = I.DATA_INV and'
        '        I7.COD_EMPRESA = I.COD_EMPRESA and'
        '        I7.GRUPO_PROD = I.GRUPO_PROD and'
        '        I7.COD_PROD = I.COD_PROD;'
        '|/BLOCO|'
        ''
        'ALTER TABLE PRODUTOS ADD CHAVE_NFE VARCHAR(60);'
        'ALTER TABLE PRODUTOS ADD CPROD_XML VARCHAR(60);'
        'ALTER TABLE PRODUTOS ADD CEAN_XML VARCHAR(14);'
        'ALTER TABLE NAT_OP ADD CFOP_CONV_SAIDA_INTRA T_N_GERAL;'
        'ALTER TABLE NAT_OP ADD CFOP_CONV_SAIDA_INTER T_N_GERAL;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO361'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR DADOS PRODUTO EM LOTE'#39', 5, '#39'FRMCADPRODUTOS'#39', 1, '#39'N'#39', '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO362'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR DADOS PRODUTO EM LOTE'#39', 5, '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', '#39'S'#39', C' +
          'URRENT_DATE);'
        'ALTER INDEX I_CODBARRAS INACTIVE;'
        'ALTER INDEX IND_LIXEIRA_PEDVENDA INACTIVE;'
        'ALTER INDEX IDX_LIXEIRA_CLIENTES INACTIVE;'
        'ALTER INDEX IND_LIXEIRA_VEIC INACTIVE;'
        
          'CREATE INDEX IDX_PRODUTOS_IMPXML ON PRODUTOS (COD_EMPRESA, CHAVE' +
          '_NFE);'
        
          'CREATE INDEX IDX_COD_BARRA ON COD_BARRA (COD_BARRA, COD_EMPRESA)' +
          ';'
        ''
        '|BLOCO|'
        '/*CREATE OR ALTER TRIGGER NFCE_ITEM_CALC_IMP FOR NFCE_ITEM*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        '/*create or alter procedure SP_NFCE_RESET_PISCOFINS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CUPOM2_BIU_CALC_IMP FOR CUPOM2'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        ''
        '  if ((old.cst_pis = new.cst_pis) and'
        '      (old.aliq_pis = new.aliq_pis)) then'
        '    exit;'
        ''
        
          '  if ((coalesce(new.aliq_pis, 0) = 0) or (coalesce(new.aliq_cofi' +
          'ns, 0) = 0))  then'
        '  begin'
        '    new.aliq_pis = 0;'
        '    new.aliq_cofins = 0;'
        '    new.base_pis = 0;'
        '    new.base_cofins = 0;'
        '    new.valor_pis = 0;'
        '    new.valor_cofins = 0;'
        '    exit;'
        '  end'
        ''
        '  if (new.cst_pis in ('#39'01'#39', '#39'02'#39')) then'
        '  begin'
        
          '    new.base_pis = round(coalesce(new.total,0) + coalesce(new.ra' +
          't_acres,0) + coalesce(new.perc_acresc,0) -'
        
          '                         coalesce(new.rat_desc,0) - coalesce(new' +
          '.perc_desc,0), 2);'
        '    new.base_cofins = new.base_pis;'
        
          '    new.valor_pis = round( new.base_pis * new.aliq_pis / 100, 2)' +
          ';'
        
          '    new.valor_cofins = round( new.base_cofins * new.aliq_cofins ' +
          '/ 100, 2);'
        '  end'
        '  else if (new.cst_pis = '#39'03'#39') then'
        '  begin'
        '    new.base_pis = round(new.quantidade, 3);'
        '    new.base_cofins = new.base_pis;'
        '    new.valor_pis = round( new.base_pis * new.aliq_pis, 2);'
        
          '    new.valor_cofins = round( new.base_cofins * new.aliq_cofins,' +
          ' 2);'
        '  end'
        '  else'
        '  begin     '
        '    new.base_pis = 0;'
        '    new.base_cofins = 0;'
        '    new.valor_pis = 0;'
        '    new.valor_cofins = 0;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        'ALTER TABLE GRADE ADD TIPO_EC1 VARCHAR(100);'
        'ALTER TABLE GRADE ADD DESCRICAO_EC1 VARCHAR(100);'
        
          'UPDATE GRADE SET TIPO_EC1 = TIPO_EC WHERE TIPO_EC IS NOT NULL AN' +
          'D TIPO_EC1 IS NULL;'
        
          'UPDATE GRADE SET DESCRICAO_EC1 = DESCRICAO_EC WHERE DESCRICAO_EC' +
          ' IS NOT NULL AND DESCRICAO_EC1 IS NULL;'
        ''
        '|BLOCO|'
        'CREATE TABLE TIPO_GRADE_EC ('
        '    COD_TIPO     INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DESCRICAO    VARCHAR(100),'
        '    ATIVO        INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE TIPO_GRADE_EC ADD CONSTRAINT PK_TIPO_GRADE_EC PRIMAR' +
          'Y KEY (COD_TIPO, COD_EMPRESA);'
        
          'INSERT INTO TIPO_GRADE_EC (COD_TIPO, COD_EMPRESA, DESCRICAO, ATI' +
          'VO) VALUES ((SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, '#39'TI' +
          'PO_GRADE_EC'#39')), :COD_EMPRESA, '#39'Cor'#39', 1);'
        
          'INSERT INTO TIPO_GRADE_EC (COD_TIPO, COD_EMPRESA, DESCRICAO, ATI' +
          'VO) VALUES ((SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, '#39'TI' +
          'PO_GRADE_EC'#39')), :COD_EMPRESA, '#39'G'#234'nero'#39', 1);'
        
          'INSERT INTO TIPO_GRADE_EC (COD_TIPO, COD_EMPRESA, DESCRICAO, ATI' +
          'VO) VALUES ((SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, '#39'TI' +
          'PO_GRADE_EC'#39')), :COD_EMPRESA, '#39'Tamanho'#39', 1);'
        
          'INSERT INTO TIPO_GRADE_EC (COD_TIPO, COD_EMPRESA, DESCRICAO, ATI' +
          'VO) VALUES ((SELECT COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, '#39'TI' +
          'PO_GRADE_EC'#39')), :COD_EMPRESA, '#39'Voltagem'#39', 1);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO372'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO TIPO DE GRADE'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO373'#39', :COD_EMPRESA, '#39'BT' +
          ' EDITAR TIPO DE GRADE'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO374'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR TIPO DE GRADE'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE PEDVENDA ADD NUM_NFCE INTEGER;'
        
          'CREATE INDEX IDX_PEDVENDA_NFCE ON PEDVENDA (COD_NFCE, COD_EMPRES' +
          'A);'
        
          'CREATE INDEX IDX_PEDVENDA_NFCE_NUM ON PEDVENDA (NUM_NFCE, COD_EM' +
          'PRESA);'
        
          'CMD:REPL|CMD:INATIVO|UPDATE PEDVENDA P SET P.NUM_NFCE = (SELECT ' +
          'FIRST 1 N.NUM_NF FROM NFCE N WHERE N.COD_NFCE = P.COD_NFCE AND N' +
          '.COD_EMPRESA = P.COD_EMPRESA) WHERE P.DATA_PED >= '#39'01.01.2019'#39' A' +
          'ND P.COD_EMPRESA = :COD_EMPRESA AND P.COD_NFCE IS NOT NULL AND P' +
          '.NUM_NFCE IS NULL'
        'ALTER TABLE CLIENTES ADD TIPO_OBRA_NFSE SMALLINT;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS418'#39', :COD_EMPRESA, '#39'BT' +
          ' PROCURAR MOD NOTIFICAO'#39', 5, '#39'N'#39', '#39'FRMCADMODELOCARTAS'#39', 1, '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS419'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVOMOD NOTIFICAO'#39', 5, '#39'N'#39', '#39'FRMCADMODELOCARTAS'#39', 1, '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS420'#39', :COD_EMPRESA, '#39'BT' +
          ' EDITAR MOD NOTIFICAO'#39', 5, '#39'N'#39', '#39'FRMCADMODELOCARTAS'#39', 1, '#39'S'#39', CU' +
          'RRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS421'#39', :COD_EMPRESA, '#39'BT' +
          ' DELETAR MOD NOTIFICAO -EXCLUIR PERMANENTEMENTE'#39', 10, '#39'N'#39', '#39'FRMC' +
          'ADMODELOCARTAS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS422'#39', :COD_EMPRESA, '#39'BT' +
          ' DELETAR MOD NOTIFICAO - ENVIAR PARA A LIXEIRA'#39', 5, '#39'N'#39', '#39'FRMCAD' +
          'MODELOCARTAS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS423'#39', :COD_EMPRESA, '#39'BT' +
          ' RESTAURAR MOD NOTIFICAO'#39', 5, '#39'N'#39', '#39'FRMCADMODELOCARTAS'#39', 1, '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS424'#39', :COD_EMPRESA, '#39'BT' +
          ' ABRIR LIXEIRA MOD NOTIFICAO'#39', 5, '#39'N'#39', '#39'FRMCADMODELOCARTAS'#39', 1, ' +
          #39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS425'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR MOD NOTIFICAO '#39', 5, '#39'N'#39', '#39'FRMCADMODELOCARTAS'#39', 1, '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS426'#39', :COD_EMPRESA, '#39'BT' +
          ' DELETAR MOD NOTIFICAO USADO NO SERVI'#199'O'#39', 5, '#39'S'#39', '#39'FRMCADMODELOC' +
          'ARTAS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS427'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA CONTROLES NOTIFICADOS'#39', 5, '#39'N'#39', '#39'FRMCADMODELOCARTAS'#39', 1' +
          ', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS428'#39', :COD_EMPRESA, '#39'BT' +
          ' NOTIFICAR CONTROLES SELECIONADOS'#39', 5, '#39'S'#39', '#39'FRMCADMODELOCARTAS'#39 +
          ', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS429'#39', :COD_EMPRESA, '#39'BT' +
          ' REMOVER NOTIFICACAO CONTROLES SELECIONADOS '#39', 5, '#39'S'#39', '#39'FRMCADMO' +
          'DELOCARTAS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE MODCARTAS ADD USAR_SERVICO CHAR(1);'
        'ALTER TABLE CONTROLES ADD ENV_NOTIFICACAO CHAR(1);'
        ''
        '|BLOCO|'
        'CREATE TABLE NOTIFICACAO_CREDITOS ('
        '    CODIGO         INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    COD_EMP_MULT   INTEGER NOT NULL,'
        '    TIPO           CHAR(3) NOT NULL,'
        '    TIPO_CONTRATO  VARCHAR(64) NOT NULL,'
        '    DATA           TIMESTAMP NOT NULL,'
        '    COD_CRED       INTEGER NOT NULL,'
        '    COD_CLIENTE    INTEGER NOT NULL,'
        '    HTML           BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
        '    EMAIL          BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
        '    COD_CARTA      INTEGER NOT NULL,'
        '    ATIVO          INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NOTIFICACAO_CREDITOS ADD CONSTRAINT PK_NOTIFICACAO_C' +
          'REDITOS PRIMARY KEY (CODIGO, COD_CRED, COD_EMPRESA, COD_EMP_MULT' +
          ');'
        
          'ALTER TABLE NOTIFICACAO_CREDITOS ADD CONSTRAINT FK_NOTIFICACAO_C' +
          'REDITOS_CRED FOREIGN KEY (COD_CRED, COD_EMP_MULT) REFERENCES CON' +
          'TROLE_CREDITOS (COD_CRED, CODIGO_EMP) ON DELETE CASCADE ON UPDAT' +
          'E CASCADE;'
        
          'ALTER TABLE NOTIFICACAO_CREDITOS ADD CONSTRAINT FK_NOTIFICACAO_C' +
          'REDITOS_MODCART FOREIGN KEY (COD_CARTA, COD_EMPRESA) REFERENCES ' +
          'MODCARTAS (COD_CARTA, COD_EMPRESA) ON DELETE CASCADE ON UPDATE C' +
          'ASCADE;'
        
          'CREATE INDEX IDX_NOTIFICACAO_CREDITOS_CREDTP ON NOTIFICACAO_CRED' +
          'ITOS (COD_CRED, COD_EMPRESA, COD_EMP_MULT, TIPO, TIPO_CONTRATO);'
        'ALTER TABLE CLIENTES ADD REC_NOT CHAR(1) DEFAULT '#39'S'#39';'
        ''
        '|BLOCO|'
        'CREATE TABLE RAMO_ATIVIDADE ('
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DESCRICAO    VARCHAR(60)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RAMO_ATIVIDADE ADD CONSTRAINT PK_RAMO_ATIVIDADE PRIM' +
          'ARY KEY (ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER RAMO_ATIVIDADE_BI_SEQID FOR RAMO_ATIVIDA' +
          'DE'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        '  if (coalesce(new.id, 0) <= 0) then'
        '  begin'
        
          '    select COD from INCREMENTA_CODIGO(new.COD_EMPRESA, '#39'RAMO_ATI' +
          'VIDADE'#39')'
        '      into new.ID;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE TIPO_CONTATO ('
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    TIPO         VARCHAR(32)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE TIPO_CONTATO ADD CONSTRAINT PK_TIPO_CONTATO PRIMARY ' +
          'KEY (ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TIPO_CONTATO_SEQID FOR TIPO_CONTATO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        '  if (coalesce(new.id, 0) <= 0) then'
        '  begin'
        
          '    select COD from INCREMENTA_CODIGO(new.COD_EMPRESA, '#39'TIPO_CON' +
          'TATO'#39')'
        '      into new.ID;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE CLIENTES_CONTATO ('
        '    ID           INTEGER NOT NULL,'
        '    COD_CLIENTE  INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    TIPO_ID      INTEGER,'
        '    CONTATO      VARCHAR(32),'
        '    TELEFONE     VARCHAR(14),'
        '    EMAIL        VARCHAR(60)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CLIENTES_CONTATO ADD CONSTRAINT PK_CLIENTES_CONTATO ' +
          'PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE CLIENTES_CONTATO ADD CONSTRAINT FK_CLIENTES_CONTATO ' +
          'FOREIGN KEY (COD_CLIENTE, COD_EMPRESA) REFERENCES CLIENTES (COD_' +
          'CLIENTE, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE CLIENTES_CONTATO ADD CONSTRAINT FK_CLIENTES_CONTATO_' +
          'TIPO FOREIGN KEY (TIPO_ID, COD_EMPRESA) REFERENCES TIPO_CONTATO ' +
          '(ID, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER CLIENTES_CONTATO_BI_SEQID FOR CLIENTES_C' +
          'ONTATO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '     exit;'
        '  if (coalesce(new.id, 0) <= 0) then'
        '  begin'
        
          '    select COD from INCREMENTA_CODIGO(new.COD_EMPRESA, '#39'CLIENTES' +
          '_CONTATO'#39')'
        '      into new.ID;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'ACOUGUE'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'AGENCIA DE VEICULOS'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'ASSISTENCIA TECNICA'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'BEBIDAS'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'CONCESSIONARIA DE VEICULOS'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'DISTRIBUIDORAS'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'ELETRONICOS'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'HORTIFRUTI'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'INDUSTRIA'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'MATERIAL DE CONSTRUCAO'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'MERCEARIA'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'MOVEIS'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'OFICINA MECANICA'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'OTICAS'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'OUTROS'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'PADARIA'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'PRESTADOR DE SERVICO'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'RESTAURANTE / LANCHONETE'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'SERRALHEIRIA'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'SOFTWARE HOUSE'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'SUPERMERCADO'#39');'
        
          'INSERT INTO RAMO_ATIVIDADE (COD_EMPRESA, DESCRICAO) VALUES (:COD' +
          '_EMPRESA, '#39'VESTUARIO'#39');'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CLI254'#39', :COD_EMPRESA, '#39'BT ALTERAR CONTATO CLIENTE'#39' ,' +
          ' 2, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CLI255'#39', :COD_EMPRESA, '#39'BT SALVAR CONTATO CLIENTE'#39' , ' +
          '2, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CLI256'#39', :COD_EMPRESA, '#39'BT EXCLUIR CONTATO CLIENTE'#39' ,' +
          ' 3, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CLI257'#39', :COD_EMPRESA, '#39'BT ADICIONAR TIPO CONTATO CLI' +
          'ENTE'#39' , 2, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CLI258'#39', :COD_EMPRESA, '#39'BT ALTERAR TIPO CONTATO CLIEN' +
          'TE'#39' , 2, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CLI259'#39', :COD_EMPRESA, '#39'BT EXCLUIR TIPO CONTATO CLIEN' +
          'TE'#39' , 3, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CLI260'#39', :COD_EMPRESA, '#39'BT ADICIONAR CONTATO CLIENTE'#39 +
          ' , 2, '#39'N'#39', '#39'S'#39');'
        'ALTER TABLE CLIENTES ADD DTERRO_ENV_NOT TIMESTAMP;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR102'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA NOTIFICACOES ENVIADAS P/ FINANCEIRO'#39', 4, '#39'FRMNOTENVFINA' +
          'NC'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR103'#39', :COD_EMPRESA, '#39'BT' +
          ' PESQUISAR NOTIFICACOES ENVIADAS P/ FINANCEIRO'#39', 4, '#39'FRMNOTENVFI' +
          'NANC'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR104'#39', :COD_EMPRESA, '#39'BT' +
          ' VISUALIZAR NOTIFICACOES ENVIADAS P/ FINANCEIRO'#39', 4, '#39'FRMNOTENVF' +
          'INANC'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'REL057'#39', :COD_EMPRESA, '#39'BT' +
          ' CONFIRMAR REL REQ/OS EMITIDAS P/ PERIODO'#39', 4, '#39'FRMRELATORIOS'#39', ' +
          '1, '#39'N'#39', '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|UPDATE PEDVENDA P SET P.NUM_NFCE = (SELECT FIRST 1 N.NU' +
          'M_NF FROM NFCE N WHERE N.COD_NFCE = P.COD_NFCE AND N.COD_EMPRESA' +
          ' = P.COD_EMPRESA) WHERE P.DATA_PED >= '#39'01.01.2019'#39' AND P.COD_EMP' +
          'RESA = :COD_EMPRESA AND P.COD_NFCE IS NOT NULL AND P.NUM_NFCE IS' +
          ' NULL'
        'ALTER TABLE CLIENTES ADD TIPO_OBRA_NFSE SMALLINT;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW ITENS_PRSEV*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW CREDIARIO_ABERTO*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW ITENS_PRSEV('
        '    NPED,'
        '    TIPO,'
        '    COD_EMPRESA,'
        '    ORDEM,'
        '    TIP,'
        '    NITEM,'
        '    NUM_FAB_PROD,'
        '    DESCR_PROD_PED,'
        '    QUANT_PED_ITEM,'
        '    RATEIO_ACRESC,'
        '    RATEIO_DESC,'
        '    VLUN_PED_ITEM,'
        '    VLTOT_PED_ITEM)'
        'AS'
        'select nped,  tipo, cod_empresa,'
        '1 ordem, '#39'P'#39' tip,'
        '(select result from strzero(nitem, 3)) nitem,'
        'num_fab_prod, descr_prod_ped,'
        
          'quant_ped_item, rateio_acresc,  rateio_desc, vlun_ped_item, vlto' +
          't_ped_item from pedvenda_prod'
        'where (status<>'#39'CANCELADO'#39' or status is null)'
        'union all'
        'select nped,  tipo, cod_empresa,'
        '2 ordem, '#39'S'#39' tip,'
        '(select result from strzero(nitem, 3)) nitem,'
        'cod_servico num_fab_prod, desc_serv_ped,'
        
          'quant_serv_ped, rateio_acresc, rateio_desc, valor_un_serv, valor' +
          '_tot_serv from pedvenda_serv'
        'where (status<>'#39'CANCELADO'#39' or status is null)'
        'union all'
        'select nped,  tipo, cod_empresa,'
        '3 ordem, '#39'PT'#39' tip,'
        '(select result from strzero(seqid, 3)) nitem,'
        #39#39' num_fab_prod, descricao desc_serv_ped,'
        
          'qtde quant_serv_ped, 0 rateio_acresc, 0 rateio_desc, vl_unit val' +
          'or_un_serv, vl_total valor_tot_serv from pedvenda_prod_terc'
        ''
        'union all'
        'select nped,  tipo, cod_empresa,'
        '4 ordem, '#39'ST'#39' tip,'
        '(select result from strzero(seqid, 3)) nitem,'
        #39#39' num_fab_prod, descr_servt,'
        
          '1 quant_serv_ped, 0 rateio_acresc, 0 rateio_desc, vl_servt valor' +
          '_un_serv, vl_servt valor_tot_serv from pedvenda_serv_terc'
        ''
        'order by 1, 3;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW CREDIARIO_ABERTO('
        '    COD_CLIENTE,'
        '    COD_EMPRESA,'
        '    N_DOC_V,'
        '    N_DOC_C,'
        '    NPARCELA,'
        '    DATA_REC_C,'
        '    DATA_VENC_C,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    TIPO_DOC_C,'
        '    TP_DOC_V,'
        '    VALOR_C,'
        '    VALOR_CORR,'
        '    STATUS_C,'
        '    HISTORICO,'
        '    OBS_C)'
        'AS'
        
          'select cc.cod_cliente, cc.codigo_emp, cc.n_doc_v, cc.n_doc_c, cc' +
          '.nparcela, cc.data_rec_c, cc.data_venc_c, cc.codigo_ctrl, ctr.no' +
          'me_ctrl,'
        
          '  cc.tipo_doc_c, cc.tp_doc_v, cc.valor_c, cc.valor_corr, cc.stat' +
          'us_c, cc.historico_c, cc.obs_c from controle_creditos cc'
        
          '  inner join controles ctr on ctr.codigo_ctrl = cc.codigo_ctrl a' +
          'nd ctr.codigo_emp = cc.codigo_emp'
        'where (cc.status_c = '#39#39' or cc.status_c is null)'
        'union'
        
          'select ch.cod_cliente, ch.codigo_emp, ch.n_doc_v, ch.n_ch, 1 npa' +
          'rcela, ch.data_rec, ch.data_venc, ch.codigo_ctrl, ctr.nome_ctrl,'
        
          #39#39' tipo_doc_c, ch.tp_doc_v, ch.valor_ch, ch.valor_corr, ch.statu' +
          's_ch, ch.historico_ch, ch.obs_ch from controle_cheque ch'
        
          'inner join controles ctr on ctr.codigo_ctrl = ch.codigo_ctrl and' +
          ' ctr.codigo_emp = ch.codigo_emp'
        'where (ch.status_ch = '#39#39' or ch.status_ch is null);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE IMAGE_BASE64 ('
        '    MD5            VARCHAR(32) NOT NULL,'
        '    BASE64         BLOB SUB_TYPE 1 SEGMENT SIZE 2048 NOT NULL,'
        '    EXTENSAO       VARCHAR(10) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE IMAGE_BASE64 ADD CONSTRAINT PK_IMAGE_BASE64 PRIMARY ' +
          'KEY (MD5);'
        ''
        '|BLOCO|'
        'CREATE TABLE DADOS_JSON ('
        '    ID           VARCHAR(64) NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    JSON         BLOB SUB_TYPE 1 SEGMENT SIZE 512'
        ');'
        
          'ALTER TABLE DADOS_JSON ADD CONSTRAINT PK_DADOS_JSON PRIMARY KEY ' +
          '(ID, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE DADOS_JSON ADD CONSTRAINT PK_DADOS_JSON PRIMARY KEY(' +
          'ID, COD_EMPRESA);'
        'ALTER TABLE CONTAS_A_PAGAR ADD HWCREDID INTEGER;'
        ''
        '|BLOCO|'
        'CREATE TABLE IMAGE_BASE64 ('
        '    MD5            VARCHAR(32) NOT NULL,'
        '    BASE64         BLOB SUB_TYPE 1 SEGMENT SIZE 2048 NOT NULL,'
        '    EXTENSAO       VARCHAR(10) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE IMAGE_BASE64 ADD CONSTRAINT PK_IMAGE_BASE64 PRIMARY ' +
          'KEY (MD5);'
        'ALTER TABLE PRODUTOS ADD ALTEROU_IMAGEM CHAR(1) DEFAULT '#39'N'#39';'
        
          'ALTER TABLE PRODUTOS ADD ALTEROU_IMAGEM_GRADE CHAR(1) DEFAULT '#39'N' +
          #39';'
        'ALTER TABLE PRODUTOS ADD ID_COMERCIO_ABERTO INTEGER;'
        'ALTER TABLE PRODUTOS_EC ADD SEQID_CA INTEGER;'
        
          'ALTER TABLE PRODUTOS_EC ADD ENV_COMERCIO_ABERTO CHAR(1) DEFAULT ' +
          #39'N'#39';'
        'ALTER TABLE PRODUTOS_EC ADD ID_COMERCIO_ABERTO INTEGER;'
        'ALTER TABLE PRODUTOS_EC ADD PRECO_A_COMBINAR_CA CHAR(1);'
        
          'ALTER TABLE PRODUTOS_EC_GRADE ADD SINC_ECOMMERCE CHAR(1) DEFAULT' +
          ' '#39'N'#39';'
        
          'ALTER TABLE PRODUTOS_EC_GRADE ADD ENV_COMERCIO_ABERTO CHAR(1) DE' +
          'FAULT '#39'N'#39';'
        'ALTER TABLE PRODUTOS_EC_GRADE ADD ID_COMERCIO_ABERTO INTEGER;'
        'ALTER TABLE PRODUTOS_EC_GRADE ADD SEQID_CA INTEGER;'
        'ALTER TABLE TIPO_SERVICO ADD DESC_SERV_RES VARCHAR(131);'
        
          'ALTER TABLE TIPO_SERVICO ADD DESC_SERV_COMPL BLOB SUB_TYPE 1 SEG' +
          'MENT SIZE 80;'
        'ALTER TABLE TIPO_SERVICO ADD PRECO_A_COMBINAR_CA CHAR(1);'
        
          'ALTER TABLE TIPO_SERVICO ADD ENV_COMERCIO_ABERTO CHAR(1) DEFAULT' +
          ' '#39'N'#39';'
        'ALTER TABLE TIPO_SERVICO ADD ID_COMERCIO_ABERTO INTEGER;'
        'ALTER TABLE TIPO_SERVICO ADD SEQID_CA INTEGER;'
        'CREATE SEQUENCE SEQ_DEL_CA;'
        ''
        '|BLOCO|'
        'CREATE TABLE DEL_CA ('
        '    SEQID               INTEGER NOT NULL,'
        '    COD_EMPRESA         INTEGER NOT NULL,'
        '    TABELA              VARCHAR(31) NOT NULL,'
        '    DATA_HORA_ALT       TIMESTAMP,'
        '    ID_COMERCIO_ABERTO  INTEGER,'
        '    ATIVO               INTEGER DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE DEL_CA ADD CONSTRAINT PK_DEL_CA PRIMARY KEY (SEQID, ' +
          'COD_EMPRESA, TABELA);'
        'CREATE GENERATOR SEQ_DEL_CA;'
        ''
        '|BLOCO|'
        'CREATE TABLE PROMOCAO_ORDEM_CA ('
        '    COD_PROMOCAO  INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    ORDEM         INTEGER,'
        '    ATUAL         CHAR(1)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PROMOCAO_ORDEM_CA ADD CONSTRAINT PK_PROMOCAO_ORDEM_C' +
          'A PRIMARY KEY (COD_PROMOCAO, COD_EMPRESA);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_PRODUTOS_CA_SEQ FOR PRODUTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_DTCA_PRODUTOS_EC FOR PRODUTOS_EC*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER TR_DTCA_PRODUTOS_EC_GRADE FOR PRODUTOS' +
          '_EC_GRADE*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER TR_DTCA_TIPO_SERVICO FOR TIPO_SERVICO*' +
          '/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|UPDATE PRODUTOS_EC_GRADE SET SINC_ECOMMERCE = '#39'S'#39' WHERE' +
          ' COD_EMPRESA = :COD_EMPRESA AND SINC_ECOMMERCE IS NULL;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO309'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR ECOMMERCE SIMPL PROD'#39', 100, '#39'FRMCADPRODUTOS'#39', 1, '#39'N'#39', '#39'N' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO310'#39', :COD_EMPRESA, '#39'AP' +
          'AGAR PRODUTO UTILIZADO NO ECOMMERCE'#39', 100, '#39'FRMCADPRODUTOS'#39', 1, ' +
          #39'S'#39', '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO311'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR DADOS PRODUTO - ECOMMERCE'#39', 10, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, ' +
          #39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO312'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR DADOS PRODUTO - ECOMMERCE'#39', 5, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'N' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO313'#39', :COD_EMPRESA, '#39'AL' +
          'TER TIPO DA GRADE - ECOMMERCE'#39', 5, '#39'S'#39', '#39'FRMCADGRADE'#39', 1,  '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO314'#39', :COD_EMPRESA, '#39'AL' +
          'TER ESTOQUE PRODUTOS - ECOMMERCE'#39', 5, '#39'S'#39', '#39'FRMCADGRADE'#39', 1, '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO315'#39', :COD_EMPRESA, '#39'AL' +
          'TER ESTOQUE GRADE - ECOMMERCE'#39', 5, '#39'S'#39', '#39'FRMCADGRADE'#39', 1, '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO375'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR COMERCIO ABERTO SIMPL PROD'#39', 100, '#39'N'#39', '#39'FRMCADPRODUTOS'#39',' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO376'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR DADOS PRODUTO - COMERCIO ABERTO'#39', 5, '#39'N'#39', '#39'FRMCADPRODUTOS'#39 +
          ', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO377'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR DADOS PRODUTO - COMERCIO ABERTO'#39', 5, '#39'N'#39', '#39'FRMCADPRODUTOS'#39',' +
          ' 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO378'#39', :COD_EMPRESA, '#39'AL' +
          'TER ESTOQUE PRODUTOS - COMERCIO ABERTO'#39', 5, '#39'S'#39', '#39'FRMCADGRADE'#39', ' +
          '1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO379'#39', :COD_EMPRESA, '#39'AL' +
          'TER ESTOQUE GRADE - COMERCIO ABERTO'#39', 5, '#39'S'#39', '#39'FRMCADGRADE'#39', 1, ' +
          #39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO380'#39', :COD_EMPRESA, '#39'AP' +
          'AGAR PRODUTO UTILIZADO NO COMERCIO ABERTO'#39', 100, '#39'S'#39', '#39'FRMCADPRO' +
          'DUTOS'#39', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO381'#39', :COD_EMPRESA, '#39'RE' +
          'M SICRON PRODUTO UTILIZADO NO ECOMMERCE'#39', 100, '#39'S'#39', '#39'FRMCADPRODU' +
          'TOS'#39', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS430'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR DADOS TIPO SERVICO - COMERCIO ABERTO'#39', 5, '#39'N'#39', '#39'FRMCADTIPO' +
          'SERV'#39', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS431'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR DADOS TIPO SERVICO - COMERCIO ABERTO'#39', 5, '#39'N'#39', '#39'FRMCADTIPOS' +
          'ERV'#39', 1, '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NIVEL_PROCESSO = 5 WHERE CO' +
          'D_PROCESSO IN ('#39'PRO311'#39', '#39'PRO312'#39', '#39'PRO314'#39', '#39'PRO315'#39') AND COD_E' +
          'MPRESA = :COD_EMPRESA;'
        
          'CREATE INDEX IDX_COD_GRADE_PROD_PROD ON COD_GRADE_PROD (GRUPO_PR' +
          'OD, COD_PROD, COD_EMPRESA);'
        'ALTER TABLE CONFIG_API ADD NOMEFANTASIA VARCHAR(60);'
        'ALTER TABLE CONFIG_API ADD TELEFONE VARCHAR(12);'
        'ALTER TABLE CONFIG_API ADD CELULAR VARCHAR(12);'
        
          'ALTER TABLE CONFIG_API ADD LINKLOGO BLOB SUB_TYPE 1 SEGMENT SIZE' +
          ' 128;'
        'ALTER TABLE CONFIG_API ADD WEBSITE VARCHAR(60);'
        'ALTER TABLE CONFIG_API ADD EMAILCONTATO VARCHAR(60);'
        'ALTER TABLE CONFIG_API ADD ARQUIVOLOGO VARCHAR(128);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*create or alter procedure GETESTOQUEDISPONIVEL*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW VW_PRODUTOS_EC*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER CONFIG_API_BU_RESET_URLLOGO FOR CONFIG_A' +
          'PI'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'begin'
        '   IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        
          '   if (coalesce(old.arquivologo, '#39#39') <> coalesce(new.arquivologo' +
          ', '#39#39')) then'
        '     new.linklogo = null;'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE PRODUTOS_EC_GRADE ADD ESTOQUE_MIN_EC T_VL_TODOS;'
        'ALTER TABLE PRODUTOS_EC_GRADE ADD ID_COMMERCE INTEGER;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_PRODUTOS_EC FOR PRODUTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_PRODUTOS_EC('
        '    TIPO,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    COD_EMPRESA,'
        '    ATIVO,'
        '    NUM_FAB_PROD,'
        '    DESCR_PROD_RES,'
        '    DESCR_PROD_COMPL,'
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
        '  0 tipo,'
        '--DADOS DO PRODUTO'
        
          '  PEC.GRUPO_PROD, PEC.COD_PROD, PEC.COD_EMPRESA, PR.ATIVO, PR.NU' +
          'M_FAB_PROD,'
        
          '  coalesce(PEC.DESCR_PROD_RES, PR.DESCR_PROD) DESCR_PROD_RES, PE' +
          'C.DESCR_PROD_COMPL,'
        
          '  iif(coalesce(PECG.COD_GRADE,0 ) > 0, PECG.ENV_COMERCIO_ABERTO,' +
          ' PEC.ENV_COMERCIO_ABERTO) ENV_COMERCIO_ABERTO,'
        
          '  coalesce(PECG.ID_COMERCIO_ABERTO, PEC.ID_COMERCIO_ABERTO) ID_C' +
          'OMERCIO_ABERTO,'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '        PECG.COD_EMPRESA = PEC.COD_EMPRESA and'
        '        PECG.COD_GRADE > 0'
        
          '  left join PRODUTOS_IMAGENS PIP on PIP.GRUPO_PROD = PEC.GRUPO_P' +
          'ROD and'
        '        PIP.COD_PROD = PEC.COD_PROD and'
        '        PIP.COD_GRADE = 0 and'
        '        PIP.COD_EMPRESA = PEC.COD_EMPRESA'
        
          '  left join PRODUTOS_IMAGENS PIG on PIG.GRUPO_PROD = PECG.GRUPO_' +
          'PROD and'
        '        PIG.COD_PROD = PECG.COD_PROD and'
        '        PIG.COD_GRADE = PECG.COD_GRADE'
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
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_CA_SEQ FOR PRODUTOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'as'
        '  declare variable IDCOMERCIO_ABERTO integer;'
        '  declare variable COMERCIO_ABERTO integer;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  select CONFIG_SISTEMA.VALUE1_F'
        '  from CONFIG_SISTEMA'
        '  where CONFIG_SISTEMA.CHAVE = '#39'comercio_aberto_hab'#39' and'
        '        CONFIG_SISTEMA.COD_EMPRESA = new.COD_EMPRESA'
        '    into :COMERCIO_ABERTO;'
        ''
        '  if (coalesce(COMERCIO_ABERTO, 0) <= 0) then'
        '    exit;'
        ''
        '  if ((old.ATIVO = 1) and'
        '      (new.ATIVO = 0)) then'
        '    update PRODUTOS_EC'
        '    set ENV_COMERCIO_ABERTO = '#39'N'#39
        '    where GRUPO_PROD = old.GRUPO_PROD and'
        '          COD_PROD = old.COD_PROD and'
        '          COD_EMPRESA = old.COD_EMPRESA and'
        '          ENV_COMERCIO_ABERTO = '#39'S'#39';'
        ''
        '  select PRODUTOS_EC.ID_COMERCIO_ABERTO'
        '  from PRODUTOS_EC'
        '  where PRODUTOS_EC.GRUPO_PROD = new.GRUPO_PROD and'
        '        PRODUTOS_EC.COD_PROD = new.COD_PROD and'
        '        PRODUTOS_EC.COD_EMPRESA = new.COD_EMPRESA'
        '    into :IDCOMERCIO_ABERTO;'
        ''
        '  if (coalesce(IDCOMERCIO_ABERTO, 0) > 0) then'
        '    new.ID_COMERCIO_ABERTO = :IDCOMERCIO_ABERTO;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTCA_PRODUTOS_EC FOR PRODUTOS_EC'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  declare variable VSEQID bigint;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
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
        
          '    values (:VSEQID, old.COD_EMPRESA, '#39'PRODUTOS_EC'#39', current_tim' +
          'estamp, old.ID_COMERCIO_ABERTO);'
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
        '  declare variable VSEQID bigint;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if ((deleting) and'
        '      (coalesce(old.ID_COMERCIO_ABERTO, 0) > 0)) then'
        '  begin'
        '    select gen_id(SEQ_DEL_CA, 1)'
        '    from RDB$DATABASE'
        '      into :VSEQID;'
        
          '    insert into DEL_CA (SEQID, COD_EMPRESA, TABELA, DATA_HORA_AL' +
          'T, ID_COMERCIO_ABERTO)'
        
          '    values (:VSEQID, old.COD_EMPRESA, '#39'PRODUTOS_EC_GRADE'#39', curre' +
          'nt_timestamp, old.ID_COMERCIO_ABERTO);'
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
        
          '    values (:VSEQID, old.COD_EMPRESA, '#39'TIPO_SERVICO'#39', current_ti' +
          'mestamp, old.ID_COMERCIO_ABERTO);'
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
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'CategoriaECommerce'#39' as nome_menu from menus_auto where nome_men' +
          'u = '#39'Categoria'#39' and cod_empresa = 1 and (select count(*) from me' +
          'nus_auto where nome_menu = '#39'CategoriaECommerce'#39' and cod_empresa ' +
          '= 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'CategoriaECommerce'#39' as nome_menu, status_menu, enable_me' +
          'nu, desc_menu, ativo from menus_auto_sistema where nome_menu = '#39 +
          'Categoria'#39' and (select count(*) from menus_auto_sistema where no' +
          'me_menu = '#39'CategoriaECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'GradesVariacaoECommerce'#39' as nome_menu from menus_auto where nom' +
          'e_menu = '#39'Grades'#39' and cod_empresa = 1 and (select count(*) from ' +
          'menus_auto where nome_menu = '#39'GradesVariacaoECommerce'#39' and cod_e' +
          'mpresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'GradesVariacaoECommerce'#39' as nome_menu, status_menu, enab' +
          'le_menu, desc_menu, ativo from menus_auto_sistema where nome_men' +
          'u = '#39'Grades'#39' and (select count(*) from menus_auto_sistema where ' +
          'nome_menu = '#39'GradesVariacaoECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'IntermediadoresPagECommerce'#39' as nome_menu from menus_auto where' +
          ' nome_menu = '#39'Intermediadores'#39' and cod_empresa = 1 and (select c' +
          'ount(*) from menus_auto where nome_menu = '#39'IntermediadoresPagECo' +
          'mmerce'#39' and cod_empresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'IntermediadoresPagECommerce'#39' as nome_menu, status_menu, ' +
          'enable_menu, desc_menu, ativo from menus_auto_sistema where nome' +
          '_menu = '#39'Intermediadores'#39' and (select count(*) from menus_auto_s' +
          'istema where nome_menu = '#39'IntermediadoresPagECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'ProdutosECommerce'#39' as nome_menu from menus_auto where nome_menu' +
          ' = '#39'CadastroDeProdutos'#39' and cod_empresa = 1 and (select count(*)' +
          ' from menus_auto where nome_menu = '#39'ProdutosECommerce'#39' and cod_e' +
          'mpresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ProdutosECommerce'#39' as nome_menu, status_menu, enable_men' +
          'u, desc_menu, ativo from menus_auto_sistema where nome_menu = '#39'C' +
          'adastroDeProdutos'#39' and (select count(*) from menus_auto_sistema ' +
          'where nome_menu = '#39'ProdutosECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'ConfiguracaoApiECommerce'#39' as nome_menu from menus_auto where no' +
          'me_menu = '#39'ConfiguracaoAPIs'#39' and cod_empresa = 1 and (select cou' +
          'nt(*) from menus_auto where nome_menu = '#39'ConfiguracaoApiECommerc' +
          'e'#39' and cod_empresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiECommerce'#39' as nome_menu, status_menu, ena' +
          'ble_menu, desc_menu, ativo from menus_auto_sistema where nome_me' +
          'nu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from menus_auto_sis' +
          'tema where nome_menu = '#39'ConfiguracaoApiECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'ProdutosComercioAberto'#39' as nome_menu from menus_auto where nome' +
          '_menu = '#39'CadastroDeProdutos'#39' and cod_empresa = 1 and (select cou' +
          'nt(*) from menus_auto where nome_menu = '#39'ProdutosComercioAberto'#39 +
          ' and cod_empresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ProdutosComercioAberto'#39' as nome_menu, status_menu, enabl' +
          'e_menu, desc_menu, ativo from menus_auto_sistema where nome_menu' +
          ' = '#39'CadastroDeProdutos'#39' and (select count(*) from menus_auto_sis' +
          'tema where nome_menu = '#39'ProdutosComercioAberto'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'TiposdeServicosComercioAberto'#39' as nome_menu from menus_auto whe' +
          're nome_menu = '#39'TiposDeServicos'#39' and cod_empresa = 1 and (select' +
          ' count(*) from menus_auto where nome_menu = '#39'TiposdeServicosCome' +
          'rcioAberto'#39' and cod_empresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'TiposdeServicosComercioAberto'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'TiposDeServicos'#39' and (select count(*) from menus_auto' +
          '_sistema where nome_menu = '#39'TiposdeServicosComercioAberto'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'ConfiguracaoApiComercioAberto'#39' as nome_menu from menus_auto whe' +
          're nome_menu = '#39'ConfiguracaoAPIs'#39' and cod_empresa = 1 and (selec' +
          't count(*) from menus_auto where nome_menu = '#39'ConfiguracaoApiCom' +
          'ercioAberto'#39' and cod_empresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiComercioAberto'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from menus_aut' +
          'o_sistema where nome_menu = '#39'ConfiguracaoApiComercioAberto'#39') = 0' +
          ';'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'ConfiguracaoApiProgramadefidelidade'#39' as nome_menu from menus_au' +
          'to where nome_menu = '#39'ConfiguracaoAPIs'#39' and cod_empresa = 1 and ' +
          '(select count(*) from menus_auto where nome_menu = '#39'Configuracao' +
          'ApiProgramadefidelidade'#39' and cod_empresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiProgramadefidelidade'#39' as nome_menu, statu' +
          's_menu, enable_menu, desc_menu, ativo from menus_auto_sistema wh' +
          'ere nome_menu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from men' +
          'us_auto_sistema where nome_menu = '#39'CategoriaECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'ControlesProgramadefidelidade'#39' as nome_menu from menus_auto whe' +
          're nome_menu = '#39'Controles'#39' and cod_empresa = 1 and (select count' +
          '(*) from menus_auto where nome_menu = '#39'ControlesProgramadefideli' +
          'dade'#39' and cod_empresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ControlesProgramadefidelidade'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'Controles'#39' and (select count(*) from menus_auto_siste' +
          'ma where nome_menu = '#39'ControlesProgramadefidelidade'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (1, '#39'MENUS_AUTO'#39')), depart' +
          '_menu, cod_empresa, status_menu, desc_menu, ativo, enable_menu, ' +
          #39'TiposVendasProgramadefidelidade'#39' as nome_menu from menus_auto w' +
          'here nome_menu = '#39'TiposVendas1'#39' and cod_empresa = 1 and (select ' +
          'count(*) from menus_auto where nome_menu = '#39'TiposVendasProgramad' +
          'efidelidade'#39' and cod_empresa = 1) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'TiposVendasProgramadefidelidade'#39' as nome_menu, status_me' +
          'nu, enable_menu, desc_menu, ativo from menus_auto_sistema where ' +
          'nome_menu = '#39'TiposVendas1'#39' and (select count(*) from menus_auto_' +
          'sistema where nome_menu = '#39'TiposVendasProgramadefidelidade'#39') = 0' +
          ';'
        
          'CMD:REPL|update menus_auto set nome_menu = '#39'ConfiguracoesSimulac' +
          'aoProgramaFidelidade'#39' where nome_menu = '#39'ConfiguracoesSimulacaoP' +
          'rogramaFidelidade1'#39' and cod_empresa = 1;'
        
          'CMD:REPL|update menus_auto_sistema set nome_menu = '#39'Configuracoe' +
          'sSimulacaoProgramaFidelidade'#39' where nome_menu = '#39'ConfiguracoesSi' +
          'mulacaoProgramaFidelidade1'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NF0221'#39', :COD_EMPRESA, '#39'BT GERAR BOLETOS NF AVULSO'#39' ,' +
          ' 1, '#39'N'#39', '#39'S'#39');'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_PRODUTOS_EC FOR PRODUTOS*/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'CategoriaECommerce'#39' as nome_menu from menus_auto whe' +
          're nome_menu = '#39'Categoria'#39' and cod_empresa = :cod_empresa and (s' +
          'elect count(*) from menus_auto where nome_menu = '#39'CategoriaEComm' +
          'erce'#39' and cod_empresa = :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'CategoriaECommerce'#39' as nome_menu, status_menu, enable_me' +
          'nu, desc_menu, ativo from menus_auto_sistema where nome_menu = '#39 +
          'Categoria'#39' and (select count(*) from menus_auto_sistema where no' +
          'me_menu = '#39'CategoriaECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'GradesVariacaoECommerce'#39' as nome_menu from menus_aut' +
          'o where nome_menu = '#39'Grades'#39' and cod_empresa = :cod_empresa and ' +
          '(select count(*) from menus_auto where nome_menu = '#39'GradesVariac' +
          'aoECommerce'#39' and cod_empresa = :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'GradesVariacaoECommerce'#39' as nome_menu, status_menu, enab' +
          'le_menu, desc_menu, ativo from menus_auto_sistema where nome_men' +
          'u = '#39'Grades'#39' and (select count(*) from menus_auto_sistema where ' +
          'nome_menu = '#39'GradesVariacaoECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'IntermediadoresPagECommerce'#39' as nome_menu from menus' +
          '_auto where nome_menu = '#39'Intermediadores'#39' and cod_empresa = :cod' +
          '_empresa and (select count(*) from menus_auto where nome_menu = ' +
          #39'IntermediadoresPagECommerce'#39' and cod_empresa = :cod_empresa) = ' +
          '0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'IntermediadoresPagECommerce'#39' as nome_menu, status_menu, ' +
          'enable_menu, desc_menu, ativo from menus_auto_sistema where nome' +
          '_menu = '#39'Intermediadores'#39' and (select count(*) from menus_auto_s' +
          'istema where nome_menu = '#39'IntermediadoresPagECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ProdutosECommerce'#39' as nome_menu from menus_auto wher' +
          'e nome_menu = '#39'CadastroDeProdutos'#39' and cod_empresa = :cod_empres' +
          'a and (select count(*) from menus_auto where nome_menu = '#39'Produt' +
          'osECommerce'#39' and cod_empresa = :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ProdutosECommerce'#39' as nome_menu, status_menu, enable_men' +
          'u, desc_menu, ativo from menus_auto_sistema where nome_menu = '#39'C' +
          'adastroDeProdutos'#39' and (select count(*) from menus_auto_sistema ' +
          'where nome_menu = '#39'ProdutosECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ConfiguracaoApiECommerce'#39' as nome_menu from menus_au' +
          'to where nome_menu = '#39'ConfiguracaoAPIs'#39' and cod_empresa = :cod_e' +
          'mpresa and (select count(*) from menus_auto where nome_menu = '#39'C' +
          'onfiguracaoApiECommerce'#39' and cod_empresa = :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiECommerce'#39' as nome_menu, status_menu, ena' +
          'ble_menu, desc_menu, ativo from menus_auto_sistema where nome_me' +
          'nu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from menus_auto_sis' +
          'tema where nome_menu = '#39'ConfiguracaoApiECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ProdutosComercioAberto'#39' as nome_menu from menus_auto' +
          ' where nome_menu = '#39'CadastroDeProdutos'#39' and cod_empresa = :cod_e' +
          'mpresa and (select count(*) from menus_auto where nome_menu = '#39'P' +
          'rodutosComercioAberto'#39' and cod_empresa = :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ProdutosComercioAberto'#39' as nome_menu, status_menu, enabl' +
          'e_menu, desc_menu, ativo from menus_auto_sistema where nome_menu' +
          ' = '#39'CadastroDeProdutos'#39' and (select count(*) from menus_auto_sis' +
          'tema where nome_menu = '#39'ProdutosComercioAberto'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'TiposdeServicosComercioAberto'#39' as nome_menu from men' +
          'us_auto where nome_menu = '#39'TiposDeServicos'#39' and cod_empresa = :c' +
          'od_empresa and (select count(*) from menus_auto where nome_menu ' +
          '= '#39'TiposdeServicosComercioAberto'#39' and cod_empresa = :cod_empresa' +
          ') = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'TiposdeServicosComercioAberto'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'TiposDeServicos'#39' and (select count(*) from menus_auto' +
          '_sistema where nome_menu = '#39'TiposdeServicosComercioAberto'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ConfiguracaoApiComercioAberto'#39' as nome_menu from men' +
          'us_auto where nome_menu = '#39'ConfiguracaoAPIs'#39' and cod_empresa = :' +
          'cod_empresa and (select count(*) from menus_auto where nome_menu' +
          ' = '#39'ConfiguracaoApiComercioAberto'#39' and cod_empresa = :cod_empres' +
          'a) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiComercioAberto'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from menus_aut' +
          'o_sistema where nome_menu = '#39'ConfiguracaoApiComercioAberto'#39') = 0' +
          ';'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ConfiguracaoApiProgramadefidelidade'#39' as nome_menu fr' +
          'om menus_auto where nome_menu = '#39'ConfiguracaoAPIs'#39' and cod_empre' +
          'sa = :cod_empresa and (select count(*) from menus_auto where nom' +
          'e_menu = '#39'ConfiguracaoApiProgramadefidelidade'#39' and cod_empresa =' +
          ' :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiProgramadefidelidade'#39' as nome_menu, statu' +
          's_menu, enable_menu, desc_menu, ativo from menus_auto_sistema wh' +
          'ere nome_menu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from men' +
          'us_auto_sistema where nome_menu = '#39'CategoriaECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ControlesProgramadefidelidade'#39' as nome_menu from men' +
          'us_auto where nome_menu = '#39'Controles'#39' and cod_empresa = :cod_emp' +
          'resa and (select count(*) from menus_auto where nome_menu = '#39'Con' +
          'trolesProgramadefidelidade'#39' and cod_empresa = :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ControlesProgramadefidelidade'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'Controles'#39' and (select count(*) from menus_auto_siste' +
          'ma where nome_menu = '#39'ControlesProgramadefidelidade'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'TiposVendasProgramadefidelidade'#39' as nome_menu from m' +
          'enus_auto where nome_menu = '#39'TiposVendas1'#39' and cod_empresa = :co' +
          'd_empresa and (select count(*) from menus_auto where nome_menu =' +
          ' '#39'TiposVendasProgramadefidelidade'#39' and cod_empresa = :cod_empres' +
          'a) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'TiposVendasProgramadefidelidade'#39' as nome_menu, status_me' +
          'nu, enable_menu, desc_menu, ativo from menus_auto_sistema where ' +
          'nome_menu = '#39'TiposVendas1'#39' and (select count(*) from menus_auto_' +
          'sistema where nome_menu = '#39'TiposVendasProgramadefidelidade'#39') = 0' +
          ';'
        
          'CMD:REPL|update menus_auto set nome_menu = '#39'ConfiguracoesSimulac' +
          'aoProgramaFidelidade'#39' where nome_menu = '#39'ConfiguracoesSimulacaoP' +
          'rogramaFidelidade1'#39' and cod_empresa = :cod_empresa;'
        
          'CMD:REPL|update menus_auto_sistema set nome_menu = '#39'Configuracoe' +
          'sSimulacaoProgramaFidelidade'#39' where nome_menu = '#39'ConfiguracoesSi' +
          'mulacaoProgramaFidelidade1'#39';'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ProdutosEnvECommerce'#39' as nome_menu from menus_auto w' +
          'here nome_menu = '#39'CadastroDeProdutos'#39' and cod_empresa = :cod_emp' +
          'resa and (select count(*) from menus_auto where nome_menu = '#39'Pro' +
          'dutosEnvECommerce'#39' and cod_empresa = :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ProdutosEnvECommerce'#39' as nome_menu, status_menu, enable_' +
          'menu, desc_menu, ativo from menus_auto_sistema where nome_menu =' +
          ' '#39'CadastroDeProdutos'#39' and (select count(*) from menus_auto_siste' +
          'ma where nome_menu = '#39'ProdutosEnvECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ProdutosEnvComercioAberto'#39' as nome_menu from menus_a' +
          'uto where nome_menu = '#39'CadastroDeProdutos'#39' and cod_empresa = :co' +
          'd_empresa and (select count(*) from menus_auto where nome_menu =' +
          ' '#39'ProdutosEnvComercioAberto'#39' and cod_empresa = :cod_empresa) = 0' +
          ';'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ProdutosEnvComercioAberto'#39' as nome_menu, status_menu, en' +
          'able_menu, desc_menu, ativo from menus_auto_sistema where nome_m' +
          'enu = '#39'CadastroDeProdutos'#39' and (select count(*) from menus_auto_' +
          'sistema where nome_menu = '#39'ProdutosEnvComercioAberto'#39') = 0;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_PRODUTOS_EC('
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '  where PMP.GRUPO_PROD = PR.GRUPO_PROD and'
        '        PMP.COD_PROD = PR.COD_PROD and'
        '        PMP.COD_EMPRESA = PR.COD_EMPRESA and'
        '        current_date >= coalesce(PMP.DATA_INI, PM.DATA_INI) and'
        '        current_date <= coalesce(PMP.DATA_FIM, PM.DATA_FIM)'
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
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_EC FOR PRODUTOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE VSINC_ECOMMERCE VARCHAR(1);'
        '  DECLARE VARIABLE IDCOMMERCE INTEGER;'
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
        '  /*'
        '  IF(COALESCE(ECOMMERCE, 0) <= 0) THEN'
        '    exit;*/'
        ''
        '  if (trim(old.LISTA_IMAGENS) <> trim(new.LISTA_IMAGENS)) then'
        '  begin'
        '    if (coalesce(new.ALTEROU_IMAGEM, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM = '#39'S'#39';'
        '    if (coalesce(new.ALTEROU_IMAGEM_GRADE, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM_GRADE = '#39'S'#39';'
        '  end'
        ''
        
          '  SELECT PRODUTOS_EC.SINC_ECOMMERCE, PRODUTOS_EC.ID_COMMERCE FRO' +
          'M PRODUTOS_EC'
        
          '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD AND PRODUTOS_EC.' +
          'COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :VSINC_ECOM' +
          'MERCE, :IDCOMMERCE;'
        ''
        '  IF (COALESCE(IDCOMMERCE, 0) > 0) THEN'
        '    new.ID_COMMERCE = :IDCOMMERCE;'
        '    '
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
        ''
        '  if (updating) then'
        '    if (coalesce(VSINC_ECOMMERCE, '#39'N'#39') = '#39'N'#39') then'
        '    begin'
        
          '      update produtos_ec_grade set produtos_ec_grade.sinc_ecomme' +
          'rce = '#39'N'#39
        '      where produtos_ec_grade.grupo_prod = new.grupo_prod'
        '        and produtos_ec_grade.cod_prod = new.cod_prod'
        '        and produtos_ec_grade.cod_empresa = new.cod_empresa'
        '        and produtos_ec_grade.sinc_ecommerce = '#39'S'#39';'
        '    end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS432'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA DE PRODUTOS E-COMMERCE'#39', 5, '#39'FRMPRODUTOSEC_CA'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS433'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTAR PRODUTOS E-COMMERCE'#39', 5, '#39'FRMPRODUTOSEC_CA'#39', 1, '#39'N'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS434'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA DE PRODUTOS COMERCIO ABERTO'#39', 5, '#39'FRMPRODUTOSEC_CA'#39', 1,' +
          ' '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS435'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTAR PRODUTOS COMERCIO ABERTO'#39', 5, '#39'FRMPRODUTOSEC_CA'#39', 1, ' +
          #39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS436'#39', :COD_EMPRESA, '#39'AL' +
          'T DADOS PRODUTOS/TIPO SERVICO - COMERCIO ABERTO'#39', 5, '#39'FRMPRODUTO' +
          'SEC_CA'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
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
        'begin     '
        ''
        
          '  if ((pgrupoprod is null) or (pcodprod is null) or (pcodempresa' +
          ' is null)) then'
        '   exit;'
        ''
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
        
          'ALTER TABLE COBREBEM ADD GERAR_REGISTRO_MULTA CHAR(1) DEFAULT '#39'N' +
          #39';'
        'ALTER TABLE COBREBEM ADD LICENCA_GENERICA CHAR(1) DEFAULT '#39'N'#39';'
        'ALTER TABLE COBREBEM ADD NOME_EMP_GENERICO VARCHAR(50);'
        'ALTER TABLE COBREBEM ADD CPF_CNPJ_GENERICO VARCHAR(18);'
        'ALTER TABLE COBREBEM ADD TAM_NOME_CEDENTE_GENERICO INTEGER;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER T_GRADE_REPL_INTER FOR GRADE*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER T_COD_GRADE_REPL_INTER FOR COD_GRADE_PRO' +
          'D'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE VREPLICACAO_INTERNA INTEGER;'
        '  DECLARE VARIABLE VCODEMPF INTEGER;'
        '  DECLARE VARIABLE VCOD_EMP INTEGER;'
        '  DECLARE VARIABLE VEMP_REPL_INTERNA INTEGER;'
        '  DECLARE VARIABLE VEXISTE INTEGER;'
        'begin'
        '  /* Trigger text */'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if ((inserting) or (updating)) then'
        '  begin'
        '     if (coalesce(new.COD_GRADE, 0) <= 0) then'
        '        exit;'
        ''
        
          '     SELECT COD_EMPRESA_FISICA FROM EMPDESVOLV WHERE COD_EMPDES ' +
          '= 1 INTO :VCODEMPF;'
        ''
        
          '      if (coalesce(new.COD_EMPRESA, 0) <> COALESCE(VCODEMPF, 0))' +
          ' THEN'
        '        exit; '
        ''
        
          '      select count(*) from tab_rep where tabela = '#39'COD_GRADE_PRO' +
          'D'#39' into :VREPLICACAO_INTERNA;'
        ''
        '      if (coalesce(vreplicacao_interna, 0) <= 0) then'
        '        exit;'
        ''
        
          '      FOR SELECT COD_EMPRESA, COALESCE(EMP_REPL_INTERNA, :VCODEM' +
          'PF) EMP_REPL_INTERNA FROM EMPRESA'
        '          WHERE ATIVO = 1 AND COD_EMPRESA <> new.COD_EMPRESA'
        '          into :VCOD_EMP, VEMP_REPL_INTERNA do'
        '      begin'
        
          '          if (coalesce(VEMP_REPL_INTERNA, 0) = coalesce(VCODEMPF' +
          ', 0)) then'
        '          begin'
        '              SELECT COD_GRADE FROM COD_GRADE_PROD'
        '              WHERE GRUPO_PROD = new.GRUPO_PROD'
        '              and COD_PROD = new.COD_PROD'
        '              and COD_GRADE = new.COD_GRADE'
        '              and COD_EMPRESA = :VCOD_EMP into :VEXISTE;'
        '    '
        '              if (coalesce(VEXISTE, 0) <= 0) then'
        '              begin'
        
          '                insert into cod_grade_prod (grupo_prod, cod_prod' +
          ', cod_grade, cod_empresa, qtde, ativo)'
        
          '                values (new.GRUPO_PROD, new.COD_PROD, new.COD_GR' +
          'ADE, :VCOD_EMP, 0, new.ATIVO);'
        '              end'
        '          end'
        '      end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_COD_GRADE_PROD_BU0_EST FOR COD_GRADE_' +
          'PROD'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'declare variable vcodempf integer;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '  begin'
        
          '    select e.cod_empresa_fisica from empdesvolv e where e.cod_em' +
          'pdes = 1 into :vcodempf;'
        ''
        '    if (new.cod_empresa = coalesce(vcodempf, 0)) then'
        '    begin'
        '      new.qtde = old.qtde;'
        '    end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE TIPO_GRADE_EC ADD ID_COMMERCE INTEGER;'
        ''
        '|BLOCO|'
        'CREATE TABLE VALOR_TIPO_GRADE_EC ('
        '    COD_VALUE    INTEGER NOT NULL,'
        '    COD_TIPO     INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DESCRICAO    VARCHAR(100),'
        '    ATIVO        INTEGER,'
        '    ID_COMMERCE  INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE VALOR_TIPO_GRADE_EC ADD CONSTRAINT PK_VALOR_TIPO_GRA' +
          'DE_EC PRIMARY KEY (COD_VALUE, COD_TIPO, COD_EMPRESA);'
        
          'ALTER TABLE VALOR_TIPO_GRADE_EC ADD CONSTRAINT FK_VALOR_TIPO_GRA' +
          'DE_EC_TP_GR FOREIGN KEY (COD_TIPO, COD_EMPRESA) REFERENCES TIPO_' +
          'GRADE_EC (COD_TIPO, COD_EMPRESA);'
        
          'CREATE INDEX IDX_TIPO_GRADE_EC_DESC ON TIPO_GRADE_EC (COD_EMPRES' +
          'A, DESCRICAO);'
        
          'CREATE INDEX IDX_VALOR_TIPO_GRADE_EC_DESC ON VALOR_TIPO_GRADE_EC' +
          ' (COD_TIPO, COD_EMPRESA, DESCRICAO);'
        
          'UPDATE TIPO_GRADE_EC SET DESCRICAO = '#39'G'#202'NERO'#39' WHERE DESCRICAO = ' +
          #39'G'#234'NERO'#39';'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER GEN_COD_MARCA FOR MARCA_PROD'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (coalesce(NEW.COD_MARCA, 0) = 0) THEN'
        '   NEW.COD_MARCA = GEN_ID(INC_COD_MARCA,1);'
        'END'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO382'#39', :COD_EMPRESA, '#39'ABRIR FORMULARIO VINCULOS E-C' +
          'OMMERCE'#39', 10, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO383'#39', :COD_EMPRESA, '#39'BT CONSULTA PRODUTOS TRAY'#39', 5' +
          ', '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO384'#39', :COD_EMPRESA, '#39'BT CONSULTA PRODUTOS SISTEMA'#39 +
          ', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO385'#39', :COD_EMPRESA, '#39'BT VINCULAR PROD E-COMMERCE/S' +
          'ISTEMA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO386'#39', :COD_EMPRESA, '#39'BT REMOVER VINCULO PROD E-COM' +
          'MERCE/SISTEMA'#39', 5, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO387'#39', :COD_EMPRESA, '#39'BT CONSULTA MARCAS TRAY/SISTE' +
          'MA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO388'#39', :COD_EMPRESA, '#39'BT CADASTRAR MARCAS TRAY/SIST' +
          'EMA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO389'#39', :COD_EMPRESA, '#39'BT VINCULAR MARCA E-COMMERCE/' +
          'SISTEMA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO390'#39', :COD_EMPRESA, '#39'BT REMOVER VINCULO MARCA E-CO' +
          'MMERCE/SISTEMA'#39', 5, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO391'#39', :COD_EMPRESA, '#39'BT CONSULTA CATEGORIA TRAY/SI' +
          'STEMA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO392'#39', :COD_EMPRESA, '#39'BT CADASTRAR CATEGORIA TRAY/S' +
          'ISTEMA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO393'#39', :COD_EMPRESA, '#39'BT VINCULAR CATEGORIA E-COMME' +
          'RCE/SISTEMA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO394'#39', :COD_EMPRESA, '#39'BT REMOVER CATEGORIA E-COMMER' +
          'CE/SISTEMA'#39', 5, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO395'#39', :COD_EMPRESA, '#39'BT CONSULTA GRADE TRAY/SISTEM' +
          'A'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO396'#39', :COD_EMPRESA, '#39'BT CADASTRAR GRADE TRAY/SISTE' +
          'MA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO397'#39', :COD_EMPRESA, '#39'BT VINCULAR GRADE E-COMMERCE/' +
          'SISTEMA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO398'#39', :COD_EMPRESA, '#39'BT REMOVER GRADE E-COMMERCE/S' +
          'ISTEMA'#39', 5, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO399'#39', :COD_EMPRESA, '#39'HABILITAR GRADE/VARIACAO DUPL' +
          'A TRAY/SISTEMA'#39', 10, '#39'N'#39', '#39'N'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO400'#39', :COD_EMPRESA, '#39'BT CONSULTA VARIACOES DO PROD' +
          'UTO TRAY/SISTEMA'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO401'#39', :COD_EMPRESA, '#39'BT REENVIAR IMAGENS DO PRODUT' +
          'O PARA E-COMMERCE'#39', 5, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO402'#39', :COD_EMPRESA, '#39'BT GERAR URL E REENVIAR IMAGE' +
          'NS PRODUTO P/ EC'#39', 5, '#39'N'#39', '#39'S'#39');'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER T_GRADE_REPL_INTER FOR GRADE'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  DECLARE VARIABLE VREPLICACAO_INTERNA INTEGER;'
        '  DECLARE VARIABLE VCODEMPF INTEGER;'
        '  DECLARE VARIABLE VCOD_EMP INTEGER;'
        '  DECLARE VARIABLE VEMP_REPL_INTERNA INTEGER;'
        '  DECLARE VARIABLE VEXISTE INTEGER;'
        'begin'
        '  /* Trigger text */'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if (deleting) then'
        '  begin'
        '      if (coalesce(old.COD_GRADE, 0) <= 0) then'
        '        exit;'
        ''
        
          '      SELECT COD_EMPRESA_FISICA FROM EMPDESVOLV WHERE COD_EMPDES' +
          ' = 1 INTO :VCODEMPF;'
        ''
        
          '      if (coalesce(old.COD_EMPRESA, 0) <> COALESCE(VCODEMPF, 0))' +
          ' THEN'
        '        exit;'
        ''
        
          '      select count(*) from tab_rep where tabela = '#39'GRADE'#39' into :' +
          'VREPLICACAO_INTERNA;'
        ''
        '      if (coalesce(vreplicacao_interna, 0) <= 0) then'
        '        exit;'
        ''
        
          '      FOR SELECT COD_EMPRESA, COALESCE(EMP_REPL_INTERNA, :VCODEM' +
          'PF) EMP_REPL_INTERNA FROM EMPRESA'
        '          WHERE ATIVO = 1 AND COD_EMPRESA <> old.COD_EMPRESA'
        '          into :VCOD_EMP, VEMP_REPL_INTERNA do'
        '      begin'
        
          '         SELECT COD_GRADE FROM GRADE WHERE COD_GRADE = coalesce(' +
          'old.COD_GRADE, 0) and COD_EMPRESA = :VCOD_EMP into :VEXISTE;'
        '    '
        '         if (coalesce(VEXISTE, 0) > 0) then'
        '         begin'
        
          '            delete from grade where cod_grade = coalesce(old.cod' +
          '_grade, 0) and cod_empresa = :VCOD_EMP;'
        '         end'
        '      end'
        '  end'
        '  else if ((inserting) or (updating)) then'
        '  begin'
        '      if (coalesce(new.COD_GRADE, 0) <= 0) then'
        '        exit;'
        ''
        
          '      SELECT COD_EMPRESA_FISICA FROM EMPDESVOLV WHERE COD_EMPDES' +
          ' = 1 INTO :VCODEMPF;'
        ''
        
          '      if (coalesce(new.COD_EMPRESA, 0) <> COALESCE(VCODEMPF, 0))' +
          ' THEN'
        '        exit; '
        ''
        
          '      select count(*) from tab_rep where tabela = '#39'GRADE'#39' into :' +
          'VREPLICACAO_INTERNA;'
        ''
        '      if (coalesce(vreplicacao_interna, 0) <= 0) then'
        '        exit;'
        ''
        
          '      FOR SELECT COD_EMPRESA, COALESCE(EMP_REPL_INTERNA, :VCODEM' +
          'PF) EMP_REPL_INTERNA FROM EMPRESA'
        '          WHERE ATIVO = 1 AND COD_EMPRESA <> new.COD_EMPRESA'
        '          into :VCOD_EMP, VEMP_REPL_INTERNA do'
        '      begin'
        
          '          if (coalesce(VEMP_REPL_INTERNA, 0) = coalesce(VCODEMPF' +
          ', 0)) then'
        '          begin'
        
          '              SELECT COD_GRADE FROM GRADE WHERE COD_GRADE = coal' +
          'esce(new.COD_GRADE, 0) and COD_EMPRESA = :VCOD_EMP into :VEXISTE' +
          ';'
        '    '
        '              if (coalesce(VEXISTE, 0) <= 0) then'
        '              begin'
        
          '                insert into grade (cod_grade, cod_empresa, descr' +
          'icao, descricao1, ativo, tipo_ec, descricao_ec, tipo_ec1, descri' +
          'cao_ec1)'
        
          '                values (new.COD_GRADE, :VCOD_EMP, new.DESCRICAO,' +
          ' new.DESCRICAO1, new.ATIVO, new.TIPO_EC, new.DESCRICAO_EC, new.T' +
          'IPO_EC1, new.DESCRICAO_EC1);'
        '              end'
        '              else'
        '              begin'
        
          '                update grade set descricao = new.DESCRICAO, desc' +
          'ricao1 = new.DESCRICAO1, ativo = new.ATIVO,'
        
          '                    tipo_ec = new.TIPO_EC, descricao_ec = new.DE' +
          'SCRICAO_EC,'
        
          '                    tipo_ec1 = new.TIPO_EC1, descricao_ec1 = new' +
          '.DESCRICAO_EC1'
        
          '                where cod_grade = coalesce(new.COD_GRADE, 0) and' +
          ' cod_empresa = :VCOD_EMP;'
        '              end'
        '          end'
        '      end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:cod_empresa, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'CadastrosevinculosTray1'#39' as nome_menu from menus_aut' +
          'o where nome_menu = '#39'CadastroDeProdutos'#39' and cod_empresa = :cod_' +
          'empresa and (select count(*) from menus_auto where nome_menu = '#39 +
          'CadastrosevinculosTray1'#39' and cod_empresa = :cod_empresa) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'CadastrosevinculosTray1'#39' as nome_menu, status_menu, enab' +
          'le_menu, desc_menu, ativo from menus_auto_sistema where nome_men' +
          'u = '#39'CadastroDeProdutos'#39' and (select count(*) from menus_auto_si' +
          'stema where nome_menu = '#39'CadastrosevinculosTray1'#39') = 0;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO403'#39', :COD_EMPRESA, '#39'PERM UTILIZA NUMFAB EXIST OUT' +
          'RO PRODUTO'#39', 100, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'PRO404'#39', :COD_EMPRESA, '#39'PERM UTILIZA CODBARRA EXIST O' +
          'UTRO PRODUTO'#39', 100, '#39'S'#39', '#39'S'#39');'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 130, RDB$CHARACTER_LENG' +
          'TH = 130 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'EMPRESA'#39') and (' +
          'r.rdb$field_name='#39'MENSAGEM_EMP'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 130, RDB$CHARACTER_LENG' +
          'TH = 130 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'PEDVENDA'#39') and ' +
          '(r.rdb$field_name='#39'OBS_PED'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'CONTROLE_CREDIT' +
          'OS'#39') and (r.rdb$field_name='#39'HISTORICO_C'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'BAIXA_CREDITOS'#39 +
          ') and (r.rdb$field_name='#39'HISTORICO_C'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'CONTROLE_CHEQUE' +
          #39') and (r.rdb$field_name='#39'HISTORICO_CH'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'CONTAS_A_PAGAR'#39 +
          ') and (r.rdb$field_name='#39'HISTORICO_CTP'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 100, RDB$CHARACTER_LENG' +
          'TH = 100 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'LANCAMENTOS'#39') a' +
          'nd (r.rdb$field_name='#39'HISTORICO_L'#39'));'
        'CREATE GENERATOR SEQ_PEDVENDA_PROD_COND_DEV;'
        ''
        '|BLOCO|'
        'CREATE TABLE PEDVENDA_PROD_COND_DEV ('
        '    ID           INTEGER NOT NULL,'
        '    NPED         INTEGER NOT NULL,'
        '    TIPO         CHAR(3) NOT NULL,'
        '    GRUPO_PROD   INTEGER NOT NULL,'
        '    COD_PROD     CHAR(6) NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    COD_GRADE    INTEGER NOT NULL,'
        '    DATA         TIMESTAMP DEFAULT CURRENT_DATE,'
        '    QUANTIDADE   T_VL_TODOS NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PEDVENDA_PROD_COND_DEV ADD CONSTRAINT PEDVENDA_PROD_' +
          'COND_DEV PRIMARY KEY (ID, COD_EMPRESA);'
        
          'ALTER TABLE PEDVENDA_PROD_COND_DEV ADD CONSTRAINT FK_PEDVENDA_PR' +
          'OD_COND_DEV_PED FOREIGN KEY (NPED, TIPO, COD_EMPRESA) REFERENCES' +
          ' PEDVENDA (NPED, TIPO, COD_EMPRESA) ON DELETE CASCADE ON UPDATE ' +
          'CASCADE;'
        
          'ALTER TABLE PEDVENDA_PROD_COND_DEV ADD CONSTRAINT FK_PEDVENDA_PR' +
          'OD_COND_DEV_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA)' +
          ' REFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON UPDA' +
          'TE CASCADE;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER PEDVENDA_PROD_COND_DEV_BI_ID FOR PEDVEND' +
          'A_PROD_COND_DEV'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (coalesce(new.ID, 0) <= 0) then'
        '    new.ID = next value for SEQ_PEDVENDA_PROD_COND_DEV;'
        ''
        '  if (new.DATA is null) then'
        '    new.DATA = current_date;'
        'end'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|update sped_informacao_complementar s set s.txt = '#39'Ref ' +
          'ECF:'#39', s.txt_compl = '#39'(Mod:[@COD_MOD] ECF:[@ECF_CX] Fab:[@ECF_FA' +
          'B] COO:[@NUM_DOC] Data:[@DT_DOC])'#39' where tipo = '#39'CUPOM'#39' and s.tx' +
          't_compl not like '#39'%COO:[@NUM_DOC]%'#39';'
        
          'CMD:REPL|update sped_informacao_complementar s set s.txt = '#39'Ref ' +
          'NFCe:'#39', s.txt_compl = '#39'[@chave_nfe_ref]'#39' where tipo = '#39'NFCE'#39' and' +
          ' s.txt_compl not like '#39'%[@chave_nfe_ref]%'#39';'
        
          'CMD:REPL|update sped_informacao_complementar s set s.txt = '#39'Ref ' +
          'NFe:'#39', s.txt_compl = '#39'[@chave_nfe_ref]'#39' where tipo = '#39'NFE'#39' and s' +
          '.txt_compl not like '#39'%[@chave_nfe_ref]%'#39';'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 200, RDB$CHARACTER_LENG' +
          'TH = 200 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'FORMPAGAMENTO_E' +
          'C'#39') and (r.rdb$field_name='#39'HISTORICO'#39'));'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER ATINSERT_PEDVENDA FOR PEDVENDA_PROD'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        '  declare variable COD_EMPRESA integer;'
        '  declare variable NEC_AC integer;'
        '  declare variable NEC_ACPROD char(1);'
        '  declare variable DIAS_ACPROD integer;'
        '  declare variable ID_MOB integer;'
        '  declare variable ID_ECOMMERCE Integer;'
        '  declare variable nfab varchar(20);'
        'begin'
        
          '  select PEDVENDA.COD_CLIENTE, PEDVENDA.IDMOBILE, PEDVENDA.id_co' +
          'mmerce'
        '  from PEDVENDA'
        '  where PEDVENDA.NPED = new.NPED and'
        '        PEDVENDA.TIPO = new.TIPO and'
        '        PEDVENDA.COD_EMPRESA = new.COD_EMPRESA'
        '    into :NEC_AC, :ID_MOB, :ID_ECOMMERCE ;'
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
        
          '  if ((NEW.cod_grade > 0) AND ((COALESCE(id_mob, 0) > 0) or (COA' +
          'LESCE(id_ecommerce, 0) > 0)))  then'
        '  BEGIN'
        
          '    select first 1 c.cod_barra from cod_barra c where c.grupo_pr' +
          'od = new.grupo_prod and c.cod_prod = new.cod_prod'
        
          '      and c.cod_empresa = new.cod_empresa and c.cod_grade = new.' +
          'cod_grade'
        '      into :nfab;'
        ''
        '    if (trim(coalesce(nfab, '#39#39')) <> '#39#39') then'
        '      new.num_fab_prod = trim(nfab);'
        '  END'
        'end'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_CLIENTES_END_DOC_ADD_CEP ON CLIENTES_END_DOC_AD' +
          'D (COD_CLIENTE, COD_EMPRESA, CEP);'
        ''
        '|BLOCO|'
        'create or alter procedure SONUMEROS ('
        '   TEXTO varchar(100))'
        'returns ('
        '   RESULT varchar(100))'
        'as'
        '   declare variable INDICE integer;'
        '   declare variable CARACTER char(1);'
        'begin'
        ' if (texto is null) then'
        '   result = null;'
        ' else'
        ' begin'
        '   result = texto;'
        '   indice = char_length(result);'
        '   while (indice > 0) do'
        '   begin'
        
          '     caracter = cast(substring(result from indice for 1) as char' +
          '(1));'
        '     if (not(caracter between '#39'0'#39' and '#39'9'#39')) then'
        '       result = substring(result from 1 for (indice - 1)) ||'
        '                   substring(result from (indice + 1) for'
        '                    (char_length(result) - indice));'
        '      indice = indice - 1;'
        '   end'
        ' end'
        ' suspend;'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND254'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR RECEBIMENTO REQUISICOES PELO FINANCEIRO'#39', 100, '#39'FRMCADPE' +
          'DVENDA'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND255'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR RECEBIMENTO ORDEM SERV PELO FINANCEIRO'#39', 100, '#39'FRMCADPED' +
          'VENDA'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VEI168'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR RECEBIMENTO SAIDAS VEIC PELO FINANCEIRO'#39', 100, '#39'FRMMOVVE' +
          'ICULOSCCIA'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VEI169'#39', :COD_EMPRESA, '#39'CO' +
          'NVERTER PLACA ANTIGA PARA PLACA NOVA'#39', 10, '#39'FRMALTERARCHASSIPLAC' +
          'A'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VEI170'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR PLACA/CHASSI'#39', 10, '#39'FRMALTERARCHASSIPLACA'#39', 1, '#39'S'#39', '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VEI171'#39', :COD_EMPRESA, '#39'DE' +
          'SABIL ATUALIZACAO INFORMACOES NOS MOVIMENTOS'#39', 10, '#39'FRMALTERARCH' +
          'ASSIPLACA'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL085'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR REEBER DOCUMENTOS VALOR MENOR CXL'#39', 1, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', ' +
          'CURRENT_DATE);'
        'ALTER TABLE PEDVENDA ADD CXL CHAR(1);'
        'ALTER TABLE COM_FAT ADD CXL CHAR(1);'
        'ALTER TABLE FORMPAGAMENTO ADD CXL CHAR(1);'
        
          'ALTER TABLE TIPO_VENDAS ADD RECEBER_FINANCEIRO CHAR(1) DEFAULT '#39 +
          'N'#39';'
        ''
        '|BLOCO|'
        'create or alter procedure EXISTE_FORMAS ('
        '    PNDOC integer,'
        '    PTIPODOC varchar(6),'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    NDOC integer,'
        '    TIPODOC varchar(6),'
        '    DATA_MOV timestamp,'
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
        
          '  if ((trim(coalesce(vconfformpagamento, '#39'PED'#39')) = '#39'PED'#39') or (tr' +
          'im(coalesce(ptipodoc, '#39#39')) = '#39'PRE'#39')) then'
        '  begin'
        '    select first 1 fp.nrequisicao, fp.tpdocs, fp.data_mov,'
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
        
          '    into :ndoc, :tipodoc, :data_mov, :valor_total, :entrada, :cr' +
          'ediario, :valor_vale, :prcss, :juros;'
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
        '        '#39' select first 1 fp.nrequisicao, fp.tpdocs, fp.data_mov,'
        
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
        
          '          into :ndoc, :tipodoc, :data_mov, :valor_total, :entrad' +
          'a, :crediario, :valor_vale, :prcss, :juros;'
        '      end'
        '  end'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW FILA_VEICULOS('
        '    ORDEM_TPV,'
        '    ORDEM_CLI,'
        '    TPV,'
        '    CODIGO,'
        '    COD_EMPRESA,'
        '    COD_MODELO,'
        '    ANO_FAB,'
        '    ANO_MOD,'
        '    ORDEM,'
        '    COD_COR,'
        '    COD_VENDEDOR,'
        '    COD_CLIENTE,'
        '    NOME_RES,'
        '    FONE_RES,'
        '    DATA_RES,'
        '    HORA_RES,'
        '    STATUS_RES,'
        '    OBS_RES,'
        '    TIPO_RES,'
        '    SIT_RES,'
        '    STATUS_AVARIAS,'
        '    NOME_VENDEDOR,'
        '    DESCRICAO,'
        '    MARCA,'
        '    CILINDRADA,'
        '    DESCRICAO_COR,'
        '    STATUS_DEMONST,'
        '    COD_ESTMOTO,'
        '    CHASSI_C,'
        '    PLACA,'
        '    NUM_NOTA,'
        '    DATA_CH_NOTA,'
        '    DATA_TRANS_NOTA,'
        '    GRUPO_COTA_RD,'
        '    POSICAO,'
        '    STATUS_ESTOQUE,'
        '    STATUS_CANC,'
        '    STATUS_TRANSDEP,'
        '    STATUS_USO,'
        '    TIPV_VEICULO,'
        '    DATA_VENC_RES,'
        '    HORA_VENC_RES,'
        '    DATA_ASSEMBLEIA,'
        '    US_CAD,'
        '    DATA_CAD,'
        '    HORA_CAD,'
        '    US_EDIT,'
        '    DATA_EDIT,'
        '    HORA_EDIT,'
        '    OBS_ITEMEST,'
        '    PREV_CHEG,'
        '    STATUS_RENOV_RES,'
        '    QTDE_RENOV_RES,'
        '    ORDTIPO)'
        'AS'
        
          'SELECT 1 ORDEM_EMP, CASE WHEN(TRIM(EST.NOME_RES) <> '#39#39') THEN 1 E' +
          'LSE 2 END ORDEM_CLI,'
        
          #39'LOJA'#39' TPV, EST.COD_FILA_RES CODIGO, EST.COD_EMPRESA, EST.VERSAO' +
          'EST,'
        'EST.ANO_FABEST, EST.ANO_MODEST, 0 ORDEM,'
        'EST.COD_COR, EST.VENDEDOR_RES, EST.COD_CLIENTE,'
        
          'CASE WHEN (EST.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST.NO' +
          'ME_RES END NOME_RES,'
        'EST.FONE_RES, EST.DATA_RES,'
        'EST.HORA_RES, COALESCE(EST.STATUS_RES, '#39'N'#39') STATUS_RES,'
        
          'CAST(SUBSTRING(TRIM(EST.OBS_RES) FROM 1 FOR 15) AS VARCHAR(15)) ' +
          'OBS_RES, EST.TIPO_RES, EST.SIT_RES,'
        
          'COALESCE(EST.STATUS_AVARIAS, '#39'N'#39') STATUS_AVARIAS, VN.NOME_VENDED' +
          'OR,'
        
          'TP.DESCRICAO, TP.MARCA_DESC MARCA, TP.CILINDRADA, COR.DESCRICAO_' +
          'COR,'
        
          'COALESCE(EST.STATUS_DEMONST, '#39'N'#39') STATUS_DEMONST, EST.CODIGO COD' +
          '_ESTMOTO, EST.CHASSI_C, EST.PLACAEST,'
        
          'EST.NUM_NOTA, EST.DATA_CH_NOTA, EST.DATA_TRANS_NOTA, EST.GRUPO_C' +
          'OTA_RD,'
        
          'EST.POSICAO, EST.STATUS_ESTOQUE, EST.STATUS_CANC, EST.STATUS_TRA' +
          'NSDEP, EST.STATUS_USO,'
        
          'EST.TIPV_VEICULO, EST.DATA_VENC_RES, EST.HORA_VENC_RES, EST.DATA' +
          '_ASSEMBLEIA,'
        
          'EST.US_CAD, EST.DATA_CAD, EST.HORA_CAD, EST.VENDEDOR_RES, EST.DA' +
          'TA_RES, EST.HORA_RES,'
        
          'SUBSTRING(TRIM(EST.OBS_ITEMEST) FROM 1 FOR 15) OBS_ITEMEST, NULL' +
          ' PREV_CHEG, EST.STATUS_RENOV_RES, EST.QTDE_RENOV_RES, TP.ORDTIPO'
        'FROM EST_MOTO EST'
        
          'LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST.COD_CLIENTE AND CL' +
          '.COD_EMPRESA = EST.COD_EMPRESA'
        
          'LEFT JOIN COLABORADOR VN ON VN.COD_VENDEDOR = EST.VENDEDOR_RES A' +
          'ND VN.COD_EMPRESA = EST.COD_EMPRESA AND VN.ATIVO = 1'
        
          'LEFT JOIN TIPMODELO TP ON TP.CODIGO = EST.VERSAOEST AND TP.COD_E' +
          'MPRESA = EST.COD_EMPRESA'
        'LEFT JOIN CODIGO_CORFAB COR ON COR.COD_COR = EST.COD_COR'
        'WHERE (TRIM(COALESCE(EST.POSICAO, '#39'VIVO'#39')) = '#39'VIVO'#39')'
        'AND (COALESCE(EST.STATUS_DEMONST, '#39'N'#39') <> '#39'S'#39')'
        'UNION'
        
          'SELECT 1 ORDEM_TPV, CASE WHEN(TRIM(EST.NOME_RES) <> '#39#39') THEN 1 E' +
          'LSE 2 END ORDEM_CLI,'
        
          #39'DEMONSTRACAO'#39' TPV, EST.COD_FILA_RES CODIGO, EST.COD_EMPRESA, ES' +
          'T.VERSAOEST,'
        'EST.ANO_FABEST, EST.ANO_MODEST, 0 ORDEM,'
        'EST.COD_COR, EST.VENDEDOR_RES, EST.COD_CLIENTE,'
        
          'CASE WHEN (EST.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST.NO' +
          'ME_RES END NOME_RES,'
        'EST.FONE_RES, EST.DATA_RES,'
        'EST.HORA_RES, COALESCE(EST.STATUS_RES, '#39'N'#39') STATUS_RES,'
        
          'CAST(SUBSTRING(TRIM(EST.OBS_RES) FROM 1 FOR 15) AS VARCHAR(15)) ' +
          'OBS_RES, EST.TIPO_RES, EST.SIT_RES,'
        
          'COALESCE(EST.STATUS_AVARIAS, '#39'N'#39') STATUS_AVARIAS, VN.NOME_VENDED' +
          'OR,'
        
          'TP.DESCRICAO, TP.MARCA_DESC MARCA, TP.CILINDRADA, COR.DESCRICAO_' +
          'COR,'
        
          'COALESCE(EST.STATUS_DEMONST, '#39'N'#39') STATUS_DEMONST, EST.CODIGO COD' +
          '_ESTMOTO, EST.CHASSI_C, EST.PLACAEST,'
        
          'EST.NUM_NOTA, EST.DATA_CH_NOTA, EST.DATA_TRANS_NOTA, EST.GRUPO_C' +
          'OTA_RD,'
        
          'EST.POSICAO, EST.STATUS_ESTOQUE, EST.STATUS_CANC, EST.STATUS_TRA' +
          'NSDEP, EST.STATUS_USO,'
        
          'EST.TIPV_VEICULO, EST.DATA_VENC_RES, EST.HORA_VENC_RES, EST.DATA' +
          '_ASSEMBLEIA,'
        
          'EST.US_CAD, EST.DATA_CAD, EST.HORA_CAD, EST.VENDEDOR_RES, EST.DA' +
          'TA_RES, EST.HORA_RES,'
        
          'SUBSTRING(TRIM(EST.OBS_ITEMEST) FROM 1 FOR 15) OBS_ITEMEST, NULL' +
          ' PREV_CHEG, EST.STATUS_RENOV_RES, EST.QTDE_RENOV_RES, TP.ORDTIPO'
        'FROM EST_MOTO EST'
        
          'LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST.COD_CLIENTE AND CL' +
          '.COD_EMPRESA = EST.COD_EMPRESA'
        
          'LEFT JOIN COLABORADOR VN ON VN.COD_VENDEDOR = EST.VENDEDOR_RES A' +
          'ND VN.COD_EMPRESA = EST.COD_EMPRESA AND VN.ATIVO = 1'
        
          'LEFT JOIN TIPMODELO TP ON TP.CODIGO = EST.VERSAOEST AND TP.COD_E' +
          'MPRESA = EST.COD_EMPRESA'
        'LEFT JOIN CODIGO_CORFAB COR ON COR.COD_COR = EST.COD_COR'
        'WHERE (TRIM(COALESCE(EST.POSICAO, '#39'VIVO'#39')) = '#39'VIVO'#39')'
        'AND (COALESCE(EST.STATUS_DEMONST, '#39'N'#39') = '#39'S'#39')'
        'UNION'
        
          'SELECT 2 ORDEM_TPV, CASE WHEN(TRIM(EST.NOME_RES) <> '#39#39') THEN 1 E' +
          'LSE 2 END ORDEM_CLI,'
        
          #39'DEPOSITO'#39' TPV, EST.COD_FILA_RES CODIGO, EST.COD_EMPRESA, EST.VE' +
          'RSAOEST,'
        'EST.ANO_FABEST, EST.ANO_MODEST, 0 ORDEM,'
        'EST.COD_COR, EST.VENDEDOR_RES, EST.COD_CLIENTE,'
        
          'CASE WHEN (EST.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST.NO' +
          'ME_RES END NOME_RES,'
        'EST.FONE_RES, EST.DATA_RES,'
        'EST.HORA_RES, COALESCE(EST.STATUS_RES, '#39'N'#39') STATUS_RES,'
        
          'CAST(SUBSTRING(TRIM(EST.OBS_RES) FROM 1 FOR 15) AS VARCHAR(15)) ' +
          'OBS_RES, EST.TIPO_RES, EST.SIT_RES,'
        
          'COALESCE(EST.STATUS_AVARIAS, '#39'N'#39') STATUS_AVARIAS, VN.NOME_VENDED' +
          'OR,'
        
          'TP.DESCRICAO, TP.MARCA_DESC MARCA, TP.CILINDRADA, COR.DESCRICAO_' +
          'COR,'
        
          'COALESCE(EST.STATUS_DEMONST, '#39'N'#39') STATUS_DEMONST, EST.CODIGO COD' +
          '_ESTMOTO, EST.CHASSI_C, EST.PLACAEST,'
        
          'EST.NUM_NOTA, EST.DATA_CH_NOTA, EST.DATA_TRANS_NOTA, EST.GRUPO_C' +
          'OTA_RD,'
        
          'EST.POSICAO, EST.STATUS_ESTOQUE, EST.STATUS_CANC, EST.STATUS_TRA' +
          'NSDEP, EST.STATUS_USO,'
        
          'EST.TIPV_VEICULO, EST.DATA_VENC_RES, EST.HORA_VENC_RES, EST.DATA' +
          '_ASSEMBLEIA,'
        
          'EST.US_CAD, EST.DATA_CAD, EST.HORA_CAD, EST.VENDEDOR_RES, EST.DA' +
          'TA_RES, EST.HORA_RES,'
        
          'SUBSTRING(TRIM(EST.OBS_ITEMEST) FROM 1 FOR 15) OBS_ITEMEST, NULL' +
          ' PREV_CHEG, EST.STATUS_RENOV_RES, EST.QTDE_RENOV_RES, TP.ORDTIPO'
        'FROM EST_MOTO EST'
        
          'LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST.COD_CLIENTE AND CL' +
          '.COD_EMPRESA = EST.COD_EMPRESA'
        
          'LEFT JOIN COLABORADOR VN ON VN.COD_VENDEDOR = EST.VENDEDOR_RES A' +
          'ND VN.COD_EMPRESA = EST.COD_EMPRESA AND VN.ATIVO = 1'
        
          'LEFT JOIN TIPMODELO TP ON TP.CODIGO = EST.VERSAOEST AND TP.COD_E' +
          'MPRESA = EST.COD_EMPRESA'
        'LEFT JOIN CODIGO_CORFAB COR ON COR.COD_COR = EST.COD_COR'
        'INNER JOIN EMPRESA EMP ON EMP.COD_EMPRESA = EST.COD_EMPRESA'
        'WHERE (TRIM(COALESCE(EST.POSICAO, '#39'VIVO'#39')) = '#39'MORTO'#39')'
        
          'AND ((COALESCE(EST.STATUS_TRANSDEP, '#39'N'#39') = '#39'S'#39') AND (EST.DATA_TR' +
          'ANS_RET IS NULL))'
        'AND (TRIM(COALESCE(EMP.CONS_DEPOSITO_ESTOQUE, '#39'N'#39')) = '#39'S'#39')'
        'UNION'
        
          'SELECT 3 ORDEM_TPV, CASE WHEN(TRIM(EST.NOME_RES) <> '#39#39') THEN 1 E' +
          'LSE 2 END ORDEM_CLI,'
        
          #39'TRANSITO'#39' TPV, EST.COD_FILA_RES CODIGO, EST.COD_EMPRESA, EST.VE' +
          'RSAOEST,'
        'EST.ANO_FABEST, EST.ANO_MODEST, 0 ORDEM,'
        'EST.COD_COR, EST.VENDEDOR_RES, EST.COD_CLIENTE,'
        
          'CASE WHEN (EST.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE EST.NO' +
          'ME_RES END NOME_RES,'
        'EST.FONE_RES, EST.DATA_RES,'
        'EST.HORA_RES, COALESCE(EST.STATUS_RES, '#39'N'#39') STATUS_RES,'
        
          'CAST(SUBSTRING(TRIM(EST.OBS_RES) FROM 1 FOR 15) AS VARCHAR(15)) ' +
          'OBS_RES, EST.TIPO_RES, EST.SIT_RES,'
        
          'COALESCE(EST.STATUS_AVARIAS, '#39'N'#39') STATUS_AVARIAS, VN.NOME_VENDED' +
          'OR,'
        
          'TP.DESCRICAO, TP.MARCA_DESC MARCA, TP.CILINDRADA, COR.DESCRICAO_' +
          'COR,'
        
          'COALESCE(EST.STATUS_DEMONST, '#39'N'#39') STATUS_DEMONST , EST.CODIGO CO' +
          'D_ESTMOTO, EST.CHASSI_C, EST.PLACAEST,'
        
          'EST.NUM_NOTA, EST.DATA_CH_NOTA, EST.DATA_TRANS_NOTA, EST.GRUPO_C' +
          'OTA_RD,'
        
          'EST.POSICAO, EST.STATUS_ESTOQUE, EST.STATUS_CANC, EST.STATUS_TRA' +
          'NSDEP, COALESCE(EST.STATUS_USO, '#39'N'#39') STATUS_USO,'
        
          'EST.TIPV_VEICULO, EST.DATA_VENC_RES, EST.HORA_VENC_RES, EST.DATA' +
          '_ASSEMBLEIA,'
        
          'EST.US_CAD, EST.DATA_CAD, EST.HORA_CAD, EST.VENDEDOR_RES, EST.DA' +
          'TA_RES, EST.HORA_RES,'
        
          'SUBSTRING(TRIM(EST.OBS_ITEMEST) FROM 1 FOR 15) OBS_ITEMEST, NULL' +
          ' PREV_CHEG, EST.STATUS_RENOV_RES, EST.QTDE_RENOV_RES, TP.ORDTIPO'
        'FROM EST_MOTO EST'
        
          'LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = EST.COD_CLIENTE AND CL' +
          '.COD_EMPRESA = EST.COD_EMPRESA'
        
          'LEFT JOIN COLABORADOR VN ON VN.COD_VENDEDOR = EST.VENDEDOR_RES A' +
          'ND VN.COD_EMPRESA = EST.COD_EMPRESA AND VN.ATIVO = 1'
        
          'LEFT JOIN TIPMODELO TP ON TP.CODIGO = EST.VERSAOEST AND TP.COD_E' +
          'MPRESA = EST.COD_EMPRESA'
        'LEFT JOIN CODIGO_CORFAB COR ON COR.COD_COR = EST.COD_COR'
        'WHERE (TRIM(COALESCE(EST.POSICAO, '#39'VIVO'#39')) = '#39'TRANSITO'#39')'
        'UNION'
        
          'SELECT CASE WHEN (TRIM(FL.PREV_CHEG) <> '#39#39') THEN 4 ELSE 5 END OR' +
          'DEM_TPV, CASE WHEN(TRIM(FL.NOME_RES) <> '#39#39') THEN 1 ELSE 2 END OR' +
          'DEM_CLI,'
        #39'FILA'#39' TPV ,FL.CODIGO, FL.COD_EMPRESA, FL.COD_MODELO,'
        'FL.ANO_FAB, FL.ANO_MOD, FL.ORDEM,'
        'FL.COD_COR, FL.COD_VENDEDOR, FL.COD_CLIENTE,'
        
          'CASE WHEN (FL.COD_CLIENTE > 0) THEN CL.NOME_CLIENTE ELSE FL.NOME' +
          '_RES END NOME_RES,'
        'FL.FONE_RES, FL.DATA_RES,'
        
          'FL.HORA_RES, CASE WHEN (FL.COD_VENDEDOR > 0) THEN '#39'S'#39' ELSE COALE' +
          'SCE(FL.STATUS_RES, '#39'N'#39') END STATUS_RES,'
        
          'CAST(SUBSTRING(TRIM(FL.OBS_RES) FROM 1 FOR 15) AS VARCHAR(15)) O' +
          'BS_RES, FL.TIPO_RES, FL.SIT_RES,'
        
          'COALESCE(FL.STATUS_AVARIAS, '#39'N'#39') STATUS_AVARIAS, VN.NOME_VENDEDO' +
          'R,'
        
          'TP.DESCRICAO, TP.MARCA_DESC MARCA,  TP.CILINDRADA, COR.DESCRICAO' +
          '_COR,'
        #39'N'#39' STATUS_DEMONST, 0 COD_ESTMOTO, NULL CHASSI_C, NULL PLACA,'
        
          'FL.PREV_CHEG NUM_NOTA, NULL DATA_CH_NOTA, NULL DATA_TRANS_NOTA, ' +
          'FL.GRUPO_COTA_RD,'
        
          #39'FILA'#39' POSICAO, '#39'N'#39' STATUS_ESTOQUE, '#39'N'#39' STATUS_CANC, '#39'N'#39' STATUS_' +
          'TRANSDEP, '#39#39' STATUS_USO,'
        
          'NULL TIPV_VEICULO,FL.DATA_VENC_RES, FL.HORA_VENC_RES, FL.DATA_AS' +
          'SEMBLEIA,'
        
          'FL.US_CAD, FL.DATA_CAD, FL.HORA_CAD, FL.US_EDIT, FL.DATA_EDIT, F' +
          'L.HORA_EDIT,'
        
          'SUBSTRING(TRIM(FL.OBS_ITEMEST) FROM 1 FOR 15) OBS_ITEMEST, FL.PR' +
          'EV_CHEG, FL.STATUS_RENOV_RES, FL.QTDE_RENOV_RES, TP.ORDTIPO'
        'FROM FILA_RESERVA_VEIC FL'
        
          'LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = FL.COD_CLIENTE AND CL.' +
          'COD_EMPRESA = FL.COD_EMPRESA'
        
          'LEFT JOIN COLABORADOR VN ON VN.COD_VENDEDOR = FL.COD_VENDEDOR AN' +
          'D VN.COD_EMPRESA = FL.COD_EMPRESA AND VN.ATIVO = 1'
        
          'LEFT JOIN TIPMODELO TP ON TP.CODIGO = FL.COD_MODELO AND TP.COD_E' +
          'MPRESA = FL.COD_EMPRESA'
        'LEFT JOIN CODIGO_CORFAB COR ON COR.COD_COR = FL.COD_COR'
        
          'WHERE (TRIM(COALESCE(FL.STATUS_RES, '#39'N'#39')) = '#39'N'#39') AND FL.ATIVO = ' +
          '1;'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_EST_MOTO_CHASSI ON EST_MOTO (PLACAEST, COD_EMPR' +
          'ESA);'
        
          'CREATE INDEX IDX_EST_MOTO_PLACA ON EST_MOTO (CHASSI_C, COD_EMPRE' +
          'SA);'
        'CREATE INDEX NCHASSVEIC ON VEICULOS (CHASSI, COD_EMPRESA);'
        'CREATE INDEX NPLACAVEIC ON VEICULOS (PLACA, COD_EMPRESA);'
        
          'CREATE INDEX IDX_PEDVENDA_PLACA ON PEDVENDA (PLACA, COD_EMPRESA)' +
          ';'
        
          'CREATE INDEX IDX_PEDVENDA_CHASSI ON PEDVENDA (CHASSI, COD_EMPRES' +
          'A);'
        
          'CREATE INDEX IDX_NOTAFISCAL_ITEM_CHASSI ON NOTAFISCAL_ITEM (CHAS' +
          'SI, COD_EMPRESA);'
        
          'CREATE INDEX IDX_NF_VEICULO_PLACA ON NOTAFISCAL_ITEM_VEICULO (PL' +
          'ACA, COD_EMPRESA);'
        
          'CREATE INDEX IDX_NF_VEICULO_CHASSI ON NOTAFISCAL_ITEM_VEICULO (C' +
          'HASSI, COD_EMPRESA);'
        
          'CREATE INDEX IDX_HIST_ESTMOTO_CHASSI ON HIST_ESTMOTO (CHASSI_C, ' +
          'COD_EMPRESA);'
        
          'CREATE INDEX IDX_HIST_ESTMOTO_PLACA ON HIST_ESTMOTO (PLACAEST, C' +
          'OD_EMPRESA);'
        
          'CREATE INDEX IDXHIST_EXISTEFORMAS ON HIST_REC (NDOCANT, TP_DOC_B' +
          'AIXA, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE HIST_ESTOQUE_DIARIO_PROD ('
        '    TIPO           CHAR(1) NOT NULL,'
        '    SEQID          INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    TIPOR          CHAR(5),'
        '    NATUREZA       CHAR(1),'
        '    DATA           TIMESTAMP,'
        '    GRUPO_PROD     INTEGER,'
        '    COD_PROD       CHAR(6),'
        '    COD_GRADE      INTEGER,'
        '    CHASSI         CHAR(17),'
        '    NUMERO         INTEGER,'
        
          '    QTDE           T_D_QUANT /* T_D_QUANT = DOUBLE PRECISION DEF' +
          'AULT 00000.00 */,'
        
          '    VALOR_UNIT     T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION D' +
          'EFAULT 000000000.00 */,'
        
          '    VALOR_TOT      T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION D' +
          'EFAULT 000000000.00 */,'
        '    ALTEROU_CUSTO  CHAR(1),'
        
          '    CUSTO_MED      T_VL_TODOS DEFAULT 0 /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        '    NITEM          INTEGER,'
        '    COD_CLIENTE    INTEGER DEFAULT 0,'
        
          '    COD_CFOP       T_N_GERAL DEFAULT 0 /* T_N_GERAL = DOUBLE PRE' +
          'CISION DEFAULT 000.00 */,'
        
          '    ALIQ_ICM       T_N_GERAL DEFAULT 0 /* T_N_GERAL = DOUBLE PRE' +
          'CISION DEFAULT 000.00 */,'
        
          '    BASE_ICM       T_VL_TODOS DEFAULT 0 /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        
          '    VALOR_ICM      T_VL_TODOS DEFAULT 0 /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        
          '    ALIQ_ST        T_N_GERAL DEFAULT 0 /* T_N_GERAL = DOUBLE PRE' +
          'CISION DEFAULT 000.00 */,'
        
          '    BASE_ST        T_VL_TODOS DEFAULT 0 /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        
          '    VALOR_ST       T_VL_TODOS DEFAULT 0 /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        
          '    ALIQ_IPI       T_N_GERAL DEFAULT 0 /* T_N_GERAL = DOUBLE PRE' +
          'CISION DEFAULT 000.00 */,'
        
          '    BASE_IPI       T_VL_TODOS DEFAULT 0 /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        
          '    VALOR_IPI      T_VL_TODOS DEFAULT 0 /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        '    COD_NF         INTEGER DEFAULT 0'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE HIST_ESTOQUE_DIARIO_PROD ADD CONSTRAINT PK_HIST_ESTO' +
          'QUE_DIARIO_PROD PRIMARY KEY (TIPO, SEQID, COD_EMPRESA);'
        
          'ALTER TABLE HIST_ESTOQUE_DIARIO_PROD ADD CONSTRAINT FK_HIST_ESTO' +
          'QUE_DIARIO_PROD_PRD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRE' +
          'SA) REFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON U' +
          'PDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA('
        '    ORDEM,'
        '    TIPO,'
        '    NATUREZA,'
        '    COD_EMPRESA,'
        '    EMPRESA,'
        '    NUMDOC,'
        '    DATA,'
        '    QTDE,'
        '    VALOR_UNIT,'
        '    VALOR_TOTAL,'
        '    ALTERA_CUSTO,'
        '    CUSTO_MEDIO,'
        '    NITEM_ID,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    NUM_FAB_PROD,'
        '    DESCR_PROD,'
        '    COD_GRADE,'
        '    GRADE,'
        '    COD_CLIENTE_FORNECEDOR,'
        '    CLIENTE_FORNECEDOR,'
        '    TIPO_VND_OS_DEV,'
        '    TIPO_VENDA,'
        '    NUM_VENDA,'
        '    COD_NF,'
        '    COD_CFOP,'
        '    CFOP,'
        '    ALIQ_ICM,'
        '    BASE_ICM,'
        '    VALOR_ICM,'
        '    ALIQ_ST,'
        '    BASE_ST,'
        '    VALOR_ST,'
        '    ALIQ_IPI,'
        '    BASE_IPI,'
        '    VALOR_IPI,'
        '    DATA_ESTOQUE,'
        '    SEQID)'
        'AS'
        'select '#39'4'#39' "Ordem", '#39'BAL'#39' || ini.TIP_BAL "Tipo",'
        
          'case when (ini.qtd_dif_bal > 0) then '#39'E'#39' else '#39'S'#39' end "Natuzeza"' +
          ', ini.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",'
        '0 "Numero", ini.data_confirm "Data",'
        'case when (coalesce(ingr.cod_grade, 0) > 0) then'
        '  case when (ingr.qtd_dif_bal > 0) then'
        '    coalesce(ingr.qtd_dif_bal, 0)'
        '  else'
        '    coalesce(ingr.qtd_dif_bal, 0) * -1'
        '  end'
        'else'
        '  case when (ini.qtd_dif_bal > 0) then'
        '    coalesce(ini.qtd_dif_bal, 0)'
        '  else'
        '    coalesce(ini.qtd_dif_bal, 0) * -1'
        '  end'
        'end "Quantidade",'
        ''
        '0 "Valor Unit", 0 "Valor Total",'
        #39'N'#39' "Altera Custo", ini.pcust_mc "Custo Med", 0 "Seq ID1",'
        
          'ini.grupo_prod "Grupo", ini.cod_prod "Cod Prod", ini.num_fab_pro' +
          'd "Num Fab",'
        'pr.descr_prod "Descricao",'
        
          'coalesce(ingr.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao' +
          ','#39'SEM GRADE'#39') "Descricao Grade",'
        '0 "Cod Cliente", '#39#39' "Cliente/Fornecedor",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        '0 "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        
          '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", ini.data_confirm "Dat' +
          'a Estoque", 0 "Seq Id"'
        '  from estoque_ini ini'
        
          'left join estoque_ini_grade ingr on ini.grupo_prod = ingr.grupo_' +
          'prod and ini.cod_prod = ingr.cod_prod and ini.cod_empresa = ingr' +
          '.cod_empresa and ini.data_cadastro = ingr.data_cadastro'
        
          'left join grade gra on gra.cod_grade = ingr.cod_grade and gra.co' +
          'd_empresa = ingr.cod_empresa'
        
          'left join produtos pr on pr.grupo_prod = ini.grupo_prod and pr.c' +
          'od_prod = ini.cod_prod and pr.cod_empresa = ini.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = ini.cod_empresa'
        'union all'
        'select 1 "Ordem", '#39'NF'#39' "Tipo", nf4.natureza_nf "Natureza",'
        
          'nf4.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nf4.num_n' +
          'f "Numero", nf4.data_ent_saida "Data",'
        
          'case when grcomp.QTDE is null then it4.quantidade else grcomp.qt' +
          'de end "Quantidade",'
        'it4.valor_unitario "Valor Unit", it4.valor_total "Valor Total",'
        'case when (coalesce(it4.altera_custo_cfop, '#39'S'#39') = '#39#39') then '#39'S'#39
        
          '     else coalesce(it4.altera_custo_cfop, '#39'S'#39') end "Altera Custo' +
          '",'
        'it4.prec_cusm_prod "Custo Med", it4.nitem "N Item/Id",'
        
          'it4.grupo_prod "Grupo", it4.cod_prod "Cod Prod", pr.num_fab_prod' +
          ' "Num Fab",'
        'case when (it4.cod_grade > 0) then'
        '  it4.descricao_item||'#39' - '#39'||coalesce(gra.descricao,'#39#39')'
        'else'
        '  it4.descricao_item'
        'end  "Descricao",'
        
          'coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'#39'S' +
          'EM GRADE'#39') "Grade",'
        
          'nf4.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Forneced' +
          'or",'
        #39#39' "Tipo Vnd/OS/DEV", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          'coalesce(nf4.cod_nf, 0) "Cod NF", it4.codigo_nop "Cod CFOP", nat' +
          '.descricao_nop "CFOP",'
        
          'coalesce(it4.aliq_icm, 0) "Aliq ICM", coalesce(it4.base_icm, 0) ' +
          '"Base ICM", coalesce(it4.valor_icm, 0) "Valor ICM",'
        
          'coalesce(it4.aliq_icmsub, 0) "Aliq ST", coalesce(it4.base_icmsub' +
          ', 0) "Base ST", coalesce(it4.valor_icmsub, 0) "Valor ST",'
        
          'coalesce(it4.aliq_ipi, 0) "Aliq IPI", coalesce(it4.base_ipi, 0) ' +
          '"Base IPI", coalesce(it4.valor_ipi, 0) "Valor IPI", nf4.data_est' +
          'oque "Data Estoque", nf4.cod_nf "Seq Id"'
        'from notafiscal nf4'
        
          'inner join notafiscal_item it4 on nf4.cod_nf=it4.cod_nf and nf4.' +
          'cod_empresa=it4.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = nf4.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = it4.codigo_nop'
        'left join cod_grade_prod_compra grcomp on'
        
          'it4.grupo_prod = grcomp.grupo_prod and it4.cod_prod = grcomp.cod' +
          '_prod and it4.cod_empresa = grcomp.cod_empresa and'
        
          'it4.cod_nf = grcomp.num_nota_nfe and it4.nitem = grcomp.cod_forn' +
          '_nfe'
        
          'left join grade gra on grcomp.cod_grade = gra.cod_grade and grco' +
          'mp.cod_empresa = gra.cod_empresa'
        
          'inner join produtos pr on it4.grupo_prod = pr.grupo_prod and it4' +
          '.cod_prod = pr.cod_prod'
        'and it4.cod_empresa = pr.cod_empresa'
        
          'inner join clientes cl on nf4.cod_cliente=cl.cod_cliente and nf4' +
          '.cod_empresa=cl.cod_empresa'
        'where nf4.natureza_nf = '#39'E'#39' and (nf4.status = '#39'Fechada'#39')'
        
          'and (it4.altera_estoque_cfop <> '#39'N'#39' or it4.altera_estoque_cfop i' +
          's null)'
        'and nf4.ativo=1'
        'union all'
        'select 1 "Ordem", '#39'NF'#39' "Tipo", '#39'E'#39' "Natureza",'
        
          'nfe.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nfe.num_n' +
          'ota_nfe "Numero", nfe.data_lanc_nfe "Data",'
        
          'case when grcomp.QTDE is null then infe.quant_item_nfe else grco' +
          'mp.qtde end "Quantidade",'
        
          'infe.vlun_item_nfe "Valor Unit", infe.vltot_item_nfe "Valor Tota' +
          'l",'
        
          'coalesce(nat.calc_custo, '#39'S'#39') "Altera Custo", coalesce(infe.prec' +
          '_cusm_prod, 0) "Custo Med", coalesce(infe.n_item, 0)  "N Item/Id' +
          '",'
        
          'infe.grupo_prod "Grupo", infe.cod_prod "Cod Prod", infe.num_fab_' +
          'prod "Num Fab",'
        'case when (grcomp.cod_grade > 0) then'
        '  infe.descprod||'#39' - '#39'||coalesce(gra.descricao,'#39#39')'
        'else'
        '  infe.descprod'
        'end  "Descricao",'
        
          'coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'#39'S' +
          'EM GRADE'#39') "Grade",'
        'null "Cod Cliente", fr.nome "Cliente/Fornecedor",'
        #39#39' "Tipo Vnd/OS/DEV", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          '0 "Cod NF", infe.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP"' +
          ','
        'coalesce(infe.alicm_item_nfe, 0) "Aliq ICM",'
        
          'coalesce(infe.baseicms_it_nfe, 0) "Base ICM", coalesce(infe.icms' +
          '_it_nfe, 0) "Valor ICM",'
        
          '0 "Aliq ST", coalesce(infe.bicmsub_nfe, 0) "Base ST", coalesce(i' +
          'nfe.icmsub_nfe, 0) "Valor ST",'
        
          '0 "Aliq IPI", coalesce(infe.baseipi_it_nfe, 0) "Base IPI", coale' +
          'sce(infe.ipi_item_nfe, 0) "Valor IPI",'
        'nfe.data_lanc_nfe "Data Estoque", nfe.num_nota_nfe "Seq Id"'
        'from nf_entrada nfe'
        
          'inner join item_nf_entrada infe on infe.num_nota_nfe = nfe.num_n' +
          'ota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe and infe.cod_em' +
          'presa = nfe.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = nfe.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = infe.codigo_nop'
        'left join cod_grade_prod_compra grcomp on'
        
          'infe.grupo_prod = grcomp.grupo_prod and infe.cod_prod = grcomp.c' +
          'od_prod and infe.cod_empresa = grcomp.cod_empresa and'
        
          'infe.num_nota_nfe = grcomp.num_nota_nfe and infe.cod_forn_nfe = ' +
          'grcomp.cod_forn_nfe'
        
          'left join grade gra on grcomp.cod_grade = gra.cod_grade and grco' +
          'mp.cod_empresa = gra.cod_empresa'
        
          'inner join produtos pr on infe.grupo_prod = pr.grupo_prod and in' +
          'fe.cod_prod = pr.cod_prod'
        'and infe.cod_empresa = pr.cod_empresa'
        
          'inner join fornecedor fr on fr.codigo_f = nfe.cod_forn_nfe and f' +
          'r.cod_empresa = nfe.cod_empresa'
        'where nfe.status_nfe = '#39'CONFIRMADA'#39
        'and nfe.ativo = 1'
        'union all'
        'select '#39'1'#39' "Ordem", '#39'NF'#39' "Tipo", '#39'S'#39' "Natureza",'
        
          'nfs.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nfs.num_n' +
          'f_vnd "Numero",'
        'nfs.data_ets_vnd "Data",'
        'infs.quant_item_vnd "Quantidade",'
        
          'infs.vlun_item_vnd "Valor Unit", infs.vltot_item_vnd "Valor Tota' +
          'l",'
        #39'N'#39' "Altera Custo",'
        '0 "Custo Med", 0 "N Item/Id",'
        
          'infs.grupo_prod "Grupo", infs.cod_prod "Cod Prod", infs.num_fab_' +
          'prod "Num Fab",'
        'infs.desc_prod_nf "Descricao",'
        '0 "Cod Grade", '#39'SEM GRADE'#39' "Grade",'
        '0 "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",'
        #39#39' "Tipo Vnd/OS/DEV", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          '0 "Cod NF", infs.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP"' +
          ','
        
          '0 "Aliq ICM", coalesce(infs.baseicms_it, 0) "Base ICM", coalesce' +
          '(infs.icms_it, 0) "Valor ICM",'
        
          '0 "Aliq ST", coalesce(infs.bicmsub_vnd, 0) "Base ST", coalesce(i' +
          'nfs.icmsub_vnd, 0) "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        
          'nfs.data_ets_vnd "Data Estoque", nfs.num_nf_vnd "Seq ID"  from n' +
          'f_venda nfs'
        
          'inner join item_nfvenda infs on infs.num_nf_vnd = nfs.num_nf_vnd' +
          ' and infs.cod_empresa = nfs.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = nfs.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = nfs.cod_cliente and c' +
          'l.cod_empresa = nfs.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = infs.codigo_nop'
        'union all'
        
          'select 2 "Ordem", '#39'PDC'#39' "Tipo", '#39'E'#39' "Natureza", pi.cod_empresa "' +
          'Cod Empresa", emp.nome_emp "Empresa", pd.cod_producao "Numero", ' +
          'pd.data_fechamento "Data",'
        'pi.quantidade "Quantidade",'
        
          'pi.prec_cus_prod "Custo Unit", (pi.quantidade * pi.prec_cus_prod' +
          ') "Custo Total",'
        
          #39'N'#39' "Altera Custo", pi.prec_cusm_prod "Custo Med", pi.nitem "N I' +
          'tem",'
        
          'pi.grupo_prod "Grupo", pi.cod_prod "Cod Prod", pi.num_fab_prod "' +
          'Num Fab",'
        'pi.descr_prod "Descricao",'
        'gra.cod_grade "Cod Grade", gra.descricao "Descricao Grade",'
        '0 "Cod Cliente", emp.nome_emp "Cliente/Fornecedor",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        '0 "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        
          '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", pd.data_estoque "Data' +
          ' Estoque", pd.cod_producao "Seq Id"'
        'from producao pd'
        
          'inner join producao_item pi on pi.cod_producao = pd.cod_producao' +
          ' and pi.cod_empresa = pd.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pd.cod_empresa'
        
          'left join grade gra on gra.cod_grade = pi.cod_grade and gra.cod_' +
          'empresa = pi.cod_empresa'
        'where pd.status = '#39'FECHADO'#39
        'union all'
        
          'select 3 "Ordem", '#39'DEV'#39' "Tipo", '#39'E'#39' "Natureza", dev.cod_empresa ' +
          '"Cod Empresa", emp.nome_emp "Empresa", dev.sequencia "Numero", d' +
          'ev.data "Data",'
        'dev.quant "Quantidade",'
        'dev.valor "Valor Unit", (dev.valor * dev.quant) "Valor Total",'
        
          #39'N'#39' "Altera Custo", dev.pcust_mc "Custo Med", dev.seqid "Seq ID1' +
          '",'
        
          'dev.grupo_prod "Grupo", dev.cod_prod "Cod Prod", dev.num_fab_pro' +
          'd "Num Fab",'
        'dev.descricao "Descricao",'
        
          'coalesce(gra.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao,' +
          #39'SEM GRADE'#39') "Descricao Grade",'
        
          'cl.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedo' +
          'r",'
        
          'dev.tipo "Tipo", dev.tipo_venda "Tipo Venda", coalesce(dev.cod_v' +
          'enda, 0) "Num Venda",'
        'coalesce(dev.cod_nf, 0) "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        
          '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", dev.data_estoque "Dat' +
          'a Estoque", dev.sequencia "Seq Id"'
        'from devolucao dev'
        'inner join empresa emp on emp.cod_empresa = dev.cod_empresa'
        
          'left join grade gra on gra.cod_grade = dev.cod_grade and gra.cod' +
          '_empresa = dev.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = dev.cod_cliente and c' +
          'l.cod_empresa = dev.cod_empresa'
        'where coalesce(dev.nf_gerou, '#39#39') <> '#39'S'#39
        'union all'
        
          'select 1 "Ordem", pv.tipo "Tipo", '#39'S'#39' "Natureza", ipv.cod_empres' +
          'a "Cod Empresa", emp.nome_emp "Empresa", pv.nped "Numero",'
        'pv.data_ped "Data",'
        'ipv.quant_ped_item "Quantidade",'
        
          'ipv.vlun_ped_item "Valor Unit" , ipv.vltot_ped_item "Valor Total' +
          '",'
        
          #39'N'#39' "Altera Custo", ipv.pcust_mc "Custo Med", ipv.nitem "N Item"' +
          ','
        
          'ipv.grupo_prod "Grupo", ipv.cod_prod "Cod Prod", ipv.num_fab_pro' +
          'd "Num Fab",'
        'case when (ipv.cod_grade > 0) then'
        '  ipv.descr_prod_ped ||'#39' - '#39'||coalesce(gra.descricao,'#39#39')'
        'else'
        '  ipv.descr_prod_ped'
        'end "Descricao",'
        
          'coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'#39'S' +
          'EM GRADE'#39') "Grade",'
        
          'cl.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedo' +
          'r",'
        
          'case when pv.tipo = '#39'REQ'#39' then pv.tipv else pv.tipo_os end "Tipo' +
          ' Vnd/OS", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          'coalesce(ipv.cod_nf, 0) "Cod NF", ipv.codigo_nop "Cod CFOP", nat' +
          '.descricao_nop "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        
          '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", pv.data_estoque "Data' +
          ' Estoque", pv.nped "Seq Id"'
        'from pedvenda pv'
        
          'inner join pedvenda_prod ipv on ipv.tipo = pv.tipo and ipv.nped ' +
          '= pv.nped and ipv.cod_empresa = pv.cod_empresa'
        
          'inner join produtos pr on pr.cod_prod = ipv.cod_prod and pr.grup' +
          'o_prod = ipv.grupo_prod and pr.cod_empresa = ipv.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl' +
          '.cod_empresa = pv.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pv.cod_empresa'
        
          'left join grade gra on gra.cod_grade = ipv.cod_grade and gra.cod' +
          '_empresa = ipv.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = ipv.codigo_nop'
        'where pv.status_ped = '#39'FECHADA'#39' and pv.tipo <> '#39'ORC'#39
        
          'and ((ipv.status is null) or (ipv.status <> '#39'CANCELADO'#39')) and pv' +
          '.ativo = 1'
        'union all'
        
          'select 2 "Ordem", '#39'PDC'#39' "Tipo", '#39'S'#39' "Natureza", pi.cod_empresa "' +
          'Cod Empresa", emp.nome_emp "Empresa", pd.cod_producao "Num Produ' +
          'cao", pd.data_fechamento "Data",'
        
          '(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_pe' +
          'rda,0)) "Quantidade",'
        'pi.prec_cusm_prod "Custo Unit",'
        
          '((coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_p' +
          'erda,0)) * pi.prec_cusm_prod) "Custo Total",'
        
          #39'N'#39' "Altera Custo", pi.prec_cusm_prod "Custo Med", pi.nitem "N I' +
          'tem",'
        
          'pi.grupo_prod "Grupo", pi.cod_prod "Cod Prod", pi.num_fab_prod "' +
          'Num Fab.",'
        
          'pi.descr_prod "Descricao", gra.cod_grade "Cod. Grade", gra.descr' +
          'icao "Descricao Grade",'
        '0 "Cod Cliente", emp.nome_emp "Cliente/Fornecedor",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        '0 "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        
          '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", pd.data_estoque "Data' +
          ' Estoque", pd.cod_producao "Seq Id"'
        'from producao pd'
        
          'inner join producao_item_indice pi on pi.cod_producao = pd.cod_p' +
          'roducao and pi.cod_empresa = pd.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pd.cod_empresa'
        
          'left join grade gra on gra.cod_grade = pi.cod_grade and gra.cod_' +
          'empresa = pi.cod_empresa'
        'where pd.status = '#39'FECHADO'#39
        'union all'
        
          'select case when trim(h.tipor) = '#39'NF'#39' then 1 when trim(h.tipor) ' +
          '= '#39'DEV'#39' then 3 when trim(h.tipor) = '#39'COR'#39' then 4 else 2 end "Ord' +
          'em",'
        
          'case when trim(h.tipor) = '#39'COR'#39' then trim(h.tipor) else trim(h.t' +
          'ipor)||'#39'X'#39' end "Tipo",'
        
          'h.natureza, h.cod_empresa, emp.nome_emp EMPRESA, h.numero "Num N' +
          'F", h.data "Data",'
        
          'coalesce(h.qtde, 0) "Quantidade", coalesce(h.valor_unit, 0) "Val' +
          'or Unit", coalesce(h.valor_tot, 0) "Valor Total",'
        
          'case when trim(h.tipor) = '#39'NF'#39' then coalesce(h.alterou_custo, '#39'S' +
          #39') else coalesce(h.alterou_custo, '#39'N'#39') end "Altera Custo",'
        'h.custo_med "Custo Med", h.nitem "N Item",'
        
          'h.grupo_prod "Grupo", h.cod_prod "Cod Prod", pr.num_fab_prod "Nu' +
          'm Fab.",'
        
          'rtrim(pr.descr_prod) || case when coalesce(gra.cod_grade, 0) = 0' +
          ' then '#39#39' else '#39' - '#39' || gra.descricao end "Descricao", coalesce(h' +
          '.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao, '#39'SEM GRADE'#39 +
          ') "Descricao Grade",'
        
          'h.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor' +
          '",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          'coalesce(h.cod_nf, 0) "Cod NF", h.cod_cfop "Cod CFOP", nat.descr' +
          'icao_nop "CFOP",'
        
          'coalesce(h.aliq_icm, 0) "Aliq ICM", coalesce(h.base_icm, 0) "Bas' +
          'e ICM", coalesce(h.valor_icm, 0) "Valor ICM",'
        
          'coalesce(h.aliq_st, 0) "Aliq ST", coalesce(h.base_st, 0) "Base S' +
          'T", coalesce(h.valor_st, 0) "Valor ST",'
        
          'coalesce(h.aliq_ipi, 0) "Aliq IPI", coalesce(h.base_ipi, 0) "Bas' +
          'e IPI", coalesce(h.valor_ipi, 0) "Valor IPI", h.data "Data Estoq' +
          'ue", h.seqid "Seq Id"'
        'from hist_estoque_diario h'
        
          'inner join produtos pr on pr.grupo_prod = h.grupo_prod and pr.co' +
          'd_prod = h.cod_prod and pr.cod_empresa = h.cod_empresa'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        
          'left join grade gra on gra.cod_grade = h.cod_grade and gra.cod_e' +
          'mpresa = h.cod_empresa'
        
          'left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and ' +
          'gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and ' +
          'gp.cod_empresa = pr.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = h.cod_cliente and cl.c' +
          'od_empresa = h.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = h.cod_cfop'
        'union all'
        
          'select case when trim(h.tipor) = '#39'NF'#39' then 1 when trim(h.tipor) ' +
          '= '#39'DEV'#39' then 3 when trim(h.tipor) = '#39'COR'#39' then 4 else 2 end "Ord' +
          'em",'
        
          'case when trim(h.tipor) = '#39'COR'#39' then trim(h.tipor) else trim(h.t' +
          'ipor)||'#39'X'#39' end "Tipo",'
        
          'h.natureza, h.cod_empresa, emp.nome_emp EMPRESA, h.numero "Num N' +
          'F", h.data "Data",'
        
          'coalesce(h.qtde, 0) "Quantidade", coalesce(h.valor_unit, 0) "Val' +
          'or Unit", coalesce(h.valor_tot, 0) "Valor Total",'
        
          'case when trim(h.tipor) = '#39'NF'#39' then coalesce(h.alterou_custo, '#39'S' +
          #39') else coalesce(h.alterou_custo, '#39'N'#39') end "Altera Custo",'
        'h.custo_med "Custo Med", h.nitem "N Item",'
        
          'h.grupo_prod "Grupo", h.cod_prod "Cod Prod", pr.num_fab_prod "Nu' +
          'm Fab.",'
        
          'rtrim(pr.descr_prod) || case when coalesce(gra.cod_grade, 0) = 0' +
          ' then '#39#39' else '#39' - '#39' || gra.descricao end "Descricao", coalesce(h' +
          '.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao, '#39'SEM GRADE'#39 +
          ') "Descricao Grade",'
        
          'h.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor' +
          '",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          'coalesce(h.cod_nf, 0) "Cod NF", h.cod_cfop "Cod CFOP", nat.descr' +
          'icao_nop "CFOP",'
        
          'coalesce(h.aliq_icm, 0) "Aliq ICM", coalesce(h.base_icm, 0) "Bas' +
          'e ICM", coalesce(h.valor_icm, 0) "Valor ICM",'
        
          'coalesce(h.aliq_st, 0) "Aliq ST", coalesce(h.base_st, 0) "Base S' +
          'T", coalesce(h.valor_st, 0) "Valor ST",'
        
          'coalesce(h.aliq_ipi, 0) "Aliq IPI", coalesce(h.base_ipi, 0) "Bas' +
          'e IPI", coalesce(h.valor_ipi, 0) "Valor IPI", h.data "Data Estoq' +
          'ue", h.seqid "Seq Id"'
        'from hist_estoque_diario_prod h'
        
          'inner join produtos pr on pr.grupo_prod = h.grupo_prod and pr.co' +
          'd_prod = h.cod_prod and pr.cod_empresa = h.cod_empresa'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        
          'left join grade gra on gra.cod_grade = h.cod_grade and gra.cod_e' +
          'mpresa = h.cod_empresa'
        
          'left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and ' +
          'gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and ' +
          'gp.cod_empresa = pr.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = h.cod_cliente and cl.c' +
          'od_empresa = h.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = h.cod_cfop;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PRODUTOS_CP2 FOR PRODUTOS'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        'begin'
        
          '  if ((old.grupo_prod <> new.grupo_prod) or (old.cod_prod <> new' +
          '.cod_prod)) then'
        '  begin'
        
          '    update cupom2 set grupo_prod = new.grupo_prod, cod_prod = ne' +
          'w.cod_prod'
        
          '        where grupo_prod = old.grupo_prod and cod_prod = old.cod' +
          '_prod and cod_empresa = old.cod_empresa;'
        
          '    update  custos set grupo_prod = new.grupo_prod, cod_prod = n' +
          'ew.cod_prod'
        
          '        where grupo_prod = old.grupo_prod and cod_prod = old.cod' +
          '_prod and cod_empresa = old.cod_empresa;'
        
          '    update  inv_tipo74 set grupo_prod = new.grupo_prod, cod_prod' +
          ' = new.cod_prod'
        
          '        where grupo_prod = old.grupo_prod and cod_prod = old.cod' +
          '_prod and cod_empresa = old.cod_empresa;'
        
          '    update ecf set grupo_prod = new.grupo_prod, cod_prod = new.c' +
          'od_prod'
        
          '        where grupo_prod = old.grupo_prod and cod_prod = old.cod' +
          '_prod and cod_empresa = old.cod_empresa;'
        
          '    update estoque_ini set grupo_prod = new.grupo_prod, cod_prod' +
          ' = new.cod_prod'
        
          '        where grupo_prod = old.grupo_prod and cod_prod = old.cod' +
          '_prod and cod_empresa = old.cod_empresa;'
        
          '    update estoque_ini_grade set grupo_prod = new.grupo_prod, co' +
          'd_prod = new.cod_prod'
        
          '        where grupo_prod = old.grupo_prod and cod_prod = old.cod' +
          '_prod and cod_empresa = old.cod_empresa;'
        
          '    update nf_serie_d_itens set grupo_prod = new.grupo_prod, cod' +
          '_prod = new.cod_prod'
        
          '        where grupo_prod = old.grupo_prod and cod_prod = old.cod' +
          '_prod and cod_empresa = old.cod_empresa;'
        
          '    update hist_estoque_diario set grupo_prod = new.grupo_prod, ' +
          'cod_prod = new.cod_prod'
        
          '        where grupo_prod = old.grupo_prod and cod_prod = old.cod' +
          '_prod and cod_empresa = old.cod_empresa;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA2('
        '    ORDEM,'
        '    TIPO,'
        '    TIPO2,'
        '    NATUREZA,'
        '    COD_EMPRESA,'
        '    EMPRESA,'
        '    NUMDOC,'
        '    DATA,'
        '    DATA_CONFIRM,'
        '    STATUS,'
        '    QTDE,'
        '    VALOR_UNIT,'
        '    VALOR_TOTAL,'
        '    ALTERA_ESTOQUE,'
        '    ALTERA_CUSTO,'
        '    CUSTO_MEDIO,'
        '    NITEM_ID,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    NUM_FAB_PROD,'
        '    DESCR_PROD,'
        '    COD_GRADE,'
        '    GRADE,'
        '    COD_CLIENTE_FORNECEDOR,'
        '    CLIENTE_FORNECEDOR,'
        '    TIPO_VND_OS_DEV,'
        '    TIPO_VENDA,'
        '    NUM_VENDA,'
        '    COD_NF,'
        '    COD_CFOP,'
        '    CFOP,'
        '    ALIQ_ICM,'
        '    BASE_ICM,'
        '    VALOR_ICM,'
        '    ALIQ_ST,'
        '    BASE_ST,'
        '    VALOR_ST,'
        '    ALIQ_IPI,'
        '    BASE_IPI,'
        '    VALOR_IPI,'
        '    DATA_ESTOQUE,'
        '    SEQID)'
        'AS'
        
          'select '#39'4'#39' "Ordem", '#39'BAL'#39' || ini.TIP_BAL "Tipo", '#39'BAL'#39' || ini.TI' +
          'P_BAL "Tipo2",'
        
          'case when (ini.qtd_dif_bal > 0) then '#39'E'#39' else '#39'S'#39' end "Natuzeza"' +
          ', ini.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",'
        
          '0 "Numero", ini.data_cadastro "Data", ini.data_confirm "Data Con' +
          'firm",'
        'case when (ini.data_confirm is not null) then'
        ' '#39'FECHADA'#39
        'else'
        '  '#39#39' end,'
        'case when (coalesce(ingr.cod_grade, 0) > 0) then'
        '    abs(coalesce(ingr.qtd_dif_bal, 0))'
        'else'
        '    abs(coalesce(ini.qtd_dif_bal, 0))'
        'end "Quantidade",'
        '0 "Valor Unit", 0 "Valor Total",'
        'case when (ini.data_confirm is not null) then '#39'S'#39
        '     else '#39'N'#39' end "Altera Estoque",'
        #39'N'#39' "Altera Custo", ini.pcust_mc "Custo Med", 0 "Seq ID",'
        
          'ini.grupo_prod "Grupo", ini.cod_prod "Cod Prod", ini.num_fab_pro' +
          'd "Num Fab",'
        'pr.descr_prod "Descricao",'
        
          'coalesce(ingr.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao' +
          ','#39'SEM GRADE'#39') "Descricao Grade",'
        '0 "Cod Cliente", '#39#39' "Cliente/Fornecedor",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        '0 "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        'case when (ini.data_confirm is not null) then ini.data_confirm'
        'else ini.data_cadastro end "Data Estoque", 0 "Seq Id"'
        '  from estoque_ini ini'
        
          'left join estoque_ini_grade ingr on ini.grupo_prod = ingr.grupo_' +
          'prod and ini.cod_prod = ingr.cod_prod and ini.cod_empresa = ingr' +
          '.cod_empresa and ini.data_cadastro = ingr.data_cadastro'
        
          'left join grade gra on gra.cod_grade = ingr.cod_grade and gra.co' +
          'd_empresa = ingr.cod_empresa'
        
          'left join produtos pr on pr.grupo_prod = ini.grupo_prod and pr.c' +
          'od_prod = ini.cod_prod and pr.cod_empresa = ini.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = ini.cod_empresa'
        'union all'
        '/*select '#39'4'#39' "Ordem", '#39'BALG*'#39' "Tipo", '#39'BALG'#39' "Tipo2",'
        
          'case when (balp.qtd_dif_bal > 0) then '#39'E'#39' else '#39'S'#39' end "Natuzeza' +
          '", balp.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",'
        
          '0 "Numero", cast(cast(balp.data_hora_leitura as date) as timesta' +
          'mp) "Data", null "Data Confirm",'
        #39#39','
        'case when (coalesce(balpg.cod_grade, 0) > 0) then'
        '  case when (balpg.qtd_dif_bal > 0) then'
        '    coalesce(balpg.qtd_dif_bal, 0)'
        '  else'
        '    coalesce(balpg.qtd_dif_bal, 0) * -1'
        '  end'
        'else'
        '  case when (balp.qtd_dif_bal > 0) then'
        '    coalesce(balp.qtd_dif_bal, 0)'
        '  else'
        '    coalesce(balp.qtd_dif_bal, 0) * -1'
        '  end'
        'end "Quantidade",'
        '0 "Valor Unit", 0 "Valor Total",'
        #39'N'#39' "Altera Estoque",'
        
          #39'N'#39' "Altera Custo", balp.prec_cusm_prod "Custo Med", 0 "Seq ID1"' +
          ','
        
          'balp.grupo_prod "Grupo", balp.cod_prod "Cod Prod", balp.cod_barr' +
          'a "Num Fab",'
        'pr.descr_prod "Descricao",'
        
          'coalesce(balpg.cod_grade, 0) "Cod. Grade", coalesce(gra.descrica' +
          'o,'#39'SEM GRADE'#39') "Descricao Grade",'
        '0 "Cod Cliente", '#39#39' "Cliente/Fornecedor",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        '0 "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        
          'cast(cast(balp.data_hora_leitura as date) as timestamp) "Data Es' +
          'toque", 0 "Seq Id"'
        'from balanco_produtos balp'
        
          'left join cod_grade_balanco balpg on balp.grupo_prod = balpg.gru' +
          'po_prod and balp.cod_prod = balpg.cod_prod and balp.cod_empresa ' +
          '= balpg.cod_empresa'
        
          'left join grade gra on gra.cod_grade = balpg.cod_grade and gra.c' +
          'od_empresa = balpg.cod_empresa'
        
          'inner join produtos pr on pr.grupo_prod = balp.grupo_prod and pr' +
          '.cod_prod = balp.cod_prod and pr.cod_empresa = balp.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = balp.cod_empresa'
        'union all  */'
        
          'select 1 "Ordem", '#39'NF'#39' "Tipo", ('#39'NF'#39'||nf4.natureza_nf) "Tipo2", ' +
          'nf4.natureza_nf "Natureza",'
        
          'nf4.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nf4.num_n' +
          'f "Numero",'
        '/*case when (nf4.natureza_nf = '#39'E'#39') then nf4.data_ent_saida'
        '     else nf4.data_lanc end "Data",*/'
        'nf4.data_lanc "Data",'
        'nf4.data_lanc "Data Confirm",'
        'upper(trim(NF4.status)),'
        
          'case when grcomp.QTDE is null then it4.quantidade else grcomp.qt' +
          'de end "Quantidade",'
        'it4.valor_unitario "Valor Unit", it4.valor_total "Valor Total",'
        'case when (nf4.natureza_nf = '#39'S'#39') then '#39'N'#39
        
          '     when (nf4.status = '#39'Fechada'#39') and (it4.altera_estoque_cfop ' +
          'is null) then '#39'S'#39
        
          '     when (nf4.status = '#39'Fechada'#39') and (it4.altera_estoque_cfop ' +
          '<> '#39'N'#39') then '#39'S'#39
        '     else '#39'N'#39' end "Altera Estoque",'
        'case when (nf4.natureza_nf = '#39'S'#39') then '#39'N'#39
        '  when (coalesce(it4.altera_custo_cfop, '#39'S'#39') = '#39#39') then '#39'S'#39
        '  else coalesce(it4.altera_custo_cfop, '#39'S'#39') end "Altera Custo",'
        'it4.prec_cusm_prod "Custo Med", it4.nitem "N Item/Id",'
        
          'it4.grupo_prod "Grupo", it4.cod_prod "Cod Prod", pr.num_fab_prod' +
          ' "Num Fab",'
        'case when (it4.cod_grade > 0) then'
        '  case when (trim(nf4.natureza_nf) = '#39'S'#39') then'
        '    it4.descricao_item||'#39' - '#39'||coalesce(gras.descricao,'#39#39')'
        '  else'
        '    it4.descricao_item||'#39' - '#39'||coalesce(gra.descricao,'#39#39') end'
        'else'
        '  it4.descricao_item'
        'end  "Descricao",'
        'coalesce(gra.cod_grade,0) "Cod Grade",'
        'case when (trim(nf4.natureza_nf) = '#39'S'#39') then'
        '     coalesce(gras.descricao, '#39'SEM GRADE'#39')'
        '     else coalesce(gra.descricao,'#39'SEM GRADE'#39') end "Grade",'
        
          'nf4.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Forneced' +
          'or",'
        #39#39' "Tipo Vnd/OS/DEV", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          'nf4.cod_nf "Cod NF", it4.codigo_nop "Cod CFOP", nat.descricao_no' +
          'p "CFOP",'
        
          'it4.aliq_icm "Aliq ICM", it4.base_icm "Base ICM", it4.valor_icm ' +
          '"Valor ICM",'
        
          'it4.aliq_icmsub "Aliq ST", it4.base_icmsub "Base ST", it4.valor_' +
          'icmsub "Valor ST",'
        
          'it4.aliq_ipi "Aliq IPI", it4.base_ipi "Base IPI", it4.valor_ipi ' +
          '"Valor IPI",'
        'case when (nf4.natureza_nf = '#39'S'#39') then nf4.data_lanc'
        
          '    else nf4.data_estoque end  "Data Estoque", nf4.cod_nf "Seq I' +
          'd"'
        'from notafiscal nf4'
        
          'inner join notafiscal_item it4 on nf4.cod_nf=it4.cod_nf and nf4.' +
          'cod_empresa=it4.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = nf4.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = it4.codigo_nop'
        'left join cod_grade_prod_compra grcomp on'
        
          'it4.grupo_prod = grcomp.grupo_prod and it4.cod_prod = grcomp.cod' +
          '_prod and it4.cod_empresa = grcomp.cod_empresa and'
        
          'it4.cod_nf = grcomp.num_nota_nfe and it4.nitem = grcomp.cod_forn' +
          '_nfe'
        
          'left join grade gra on grcomp.cod_grade = gra.cod_grade and grco' +
          'mp.cod_empresa = gra.cod_empresa'
        
          'left join grade gras on it4.cod_grade = gras.cod_grade and it4.c' +
          'od_empresa = gras.cod_empresa'
        
          'inner join produtos pr on it4.grupo_prod = pr.grupo_prod and it4' +
          '.cod_prod = pr.cod_prod'
        'and it4.cod_empresa = pr.cod_empresa'
        
          'inner join clientes cl on nf4.cod_cliente=cl.cod_cliente and nf4' +
          '.cod_empresa=cl.cod_empresa'
        '/*where nf4.natureza_nf = '#39'E'#39' and (nf4.status = '#39'Fechada'#39')*/'
        
          '/*and (it4.altera_estoque_cfop <> '#39'N'#39' or it4.altera_estoque_cfop' +
          ' is null)*/'
        
          '/*and*/ where nf4.ativo=1 and upper(trim(nf4.status)) <> '#39'CANCEL' +
          'ADA'#39
        'union all'
        'select 1 "Ordem", '#39'NF'#39' "Tipo", '#39'NFE'#39' "Tipo2", '#39'E'#39' "Natureza",'
        
          'nfe.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nfe.num_n' +
          'ota_nfe "Numero",'
        
          'nfe.data_lanc_nfe "Data", nfe.data_lanc_nfe "Data Confirm", '#39'FEC' +
          'HADA'#39' "Status",'
        
          'case when grcomp.QTDE is null then infe.quant_item_nfe else grco' +
          'mp.qtde end "Quantidade",'
        
          'infe.vlun_item_nfe "Valor Unit", infe.vltot_item_nfe "Valor Tota' +
          'l",'
        
          #39'S'#39' "Alterar Estoque", coalesce(nat.calc_custo, '#39'S'#39') "Altera Cus' +
          'to",'
        
          'coalesce(infe.prec_cusm_prod, 0) "Custo Med", coalesce(infe.n_it' +
          'em, 0) "N Item/Id",'
        
          'infe.grupo_prod "Grupo", infe.cod_prod "Cod Prod", infe.num_fab_' +
          'prod "Num Fab",'
        'case when (grcomp.cod_grade > 0) then'
        '  infe.descprod||'#39' - '#39'||coalesce(gra.descricao,'#39#39')'
        'else'
        '  infe.descprod'
        'end  "Descricao",'
        
          'coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'#39'S' +
          'EM GRADE'#39') "Grade",'
        '0 "Cod Cliente", fr.nome "Cliente/Fornecedor",'
        #39#39' "Tipo Vnd/OS/DEV", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          '0 "Cod NF", infe.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP"' +
          ','
        
          'coalesce(infe.alicm_item_nfe, 0) "Aliq ICM", coalesce(infe.basei' +
          'cms_it_nfe, 0) "Base ICM", coalesce(infe.icms_it_nfe, 0) "Valor ' +
          'ICM",'
        
          '0 "Aliq ST", coalesce(infe.bicmsub_nfe, 0) "Base ST", coalesce(i' +
          'nfe.icmsub_nfe, 0) "Valor ST",'
        
          '0 "Aliq IPI", coalesce(infe.baseipi_it_nfe, 0) "Base IPI", coale' +
          'sce(infe.ipi_item_nfe, 0) "Valor IPI",'
        'nfe.data_lanc_nfe "Data Estoque", nfe.num_nota_nfe "Seq Id"'
        'from nf_entrada nfe'
        
          'inner join item_nf_entrada infe on infe.num_nota_nfe = nfe.num_n' +
          'ota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe and infe.cod_em' +
          'presa = nfe.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = nfe.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = infe.codigo_nop'
        'left join cod_grade_prod_compra grcomp on'
        
          'infe.grupo_prod = grcomp.grupo_prod and infe.cod_prod = grcomp.c' +
          'od_prod and infe.cod_empresa = grcomp.cod_empresa and'
        
          'infe.num_nota_nfe = grcomp.num_nota_nfe and infe.cod_forn_nfe = ' +
          'grcomp.cod_forn_nfe'
        
          'left join grade gra on grcomp.cod_grade = gra.cod_grade and grco' +
          'mp.cod_empresa = gra.cod_empresa'
        
          'inner join produtos pr on infe.grupo_prod = pr.grupo_prod and in' +
          'fe.cod_prod = pr.cod_prod'
        'and infe.cod_empresa = pr.cod_empresa'
        
          'inner join fornecedor fr on fr.codigo_f = nfe.cod_forn_nfe and f' +
          'r.cod_empresa = nfe.cod_empresa'
        'where nfe.status_nfe = '#39'CONFIRMADA'#39
        'and nfe.ativo = 1'
        'union all'
        'select '#39'1'#39' "Ordem", '#39'NF'#39' "Tipo", '#39'NFS'#39' "Tipo2", '#39'S'#39' "Natureza",'
        
          'nfs.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nfs.num_n' +
          'f_vnd "Numero",'
        
          'nfs.data_ets_vnd "Data", nfs.data_ets_vnd "Data Confirm", '#39'FECHA' +
          'DA'#39' "Status",'
        'infs.quant_item_vnd "Quantidade",'
        
          'infs.vlun_item_vnd "Valor Unit", infs.vltot_item_vnd "Valor Tota' +
          'l",'
        #39'N'#39' "Alterar Estoque", '#39'N'#39' "Altera Custo",'
        '0 "Custo Med", 0 "N Item/Id",'
        
          'infs.grupo_prod "Grupo", infs.cod_prod "Cod Prod", infs.num_fab_' +
          'prod "Num Fab",'
        'infs.desc_prod_nf "Descricao",'
        '0 "Cod Grade", '#39'SEM GRADE'#39' "Grade",'
        'null "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",'
        #39#39' "Tipo Vnd/OS/DEV", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          '0 "Cod NF", infs.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP"' +
          ','
        
          '0 "Aliq ICM", coalesce(infs.baseicms_it, 0) "Base ICM", coalesce' +
          '(infs.icms_it, 0) "Valor ICM",'
        
          '0 "Aliq ST", coalesce(infs.bicmsub_vnd, 0) "Base ST", coalesce(i' +
          'nfs.icmsub_vnd, 0) "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        
          'nfs.data_ets_vnd "Data Estoque", nfs.num_nf_vnd "Seq ID"  from n' +
          'f_venda nfs'
        
          'inner join item_nfvenda infs on infs.num_nf_vnd = nfs.num_nf_vnd' +
          ' and infs.cod_empresa = nfs.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = nfs.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = nfs.cod_cliente and c' +
          'l.cod_empresa = nfs.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = infs.codigo_nop'
        'union all'
        
          'select 2 "Ordem", '#39'PDC'#39' "Tipo", '#39'PDC'#39' "Tipo2", '#39'E'#39' "Natureza", p' +
          'i.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",'
        
          'pd.cod_producao "Numero", pd.data "Data", pd.data_fechamento "Da' +
          'ta Confirm",'
        'pd.status,'
        'pi.quantidade "Quantidade",'
        
          'pi.prec_cus_prod "Custo Unit", (pi.quantidade * pi.prec_cus_prod' +
          ') "Custo Total",'
        'case when (trim(pd.status) = '#39'FECHADO'#39') then '#39'S'#39
        '     else '#39'N'#39' end "Altera Estoque",'
        
          #39'N'#39' "Altera Custo", pi.prec_cusm_prod "Custo Med", pi.nitem "N I' +
          'tem",'
        
          'pi.grupo_prod "Grupo", pi.cod_prod "Cod Prod", pi.num_fab_prod "' +
          'Num Fab",'
        'pi.descr_prod "Descricao",'
        'gra.cod_grade "Cod Grade", gra.descricao "Descricao Grade",'
        '0 "Cod Cliente", emp.nome_emp "Cliente/Fornecedor",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        '0 "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        'case when (pd.data_fechamento is not null) then pd.data_estoque'
        '     else pd.data end "Data Estoque", pd.cod_producao "Seq Id"'
        'from producao pd'
        
          'inner join producao_item pi on pi.cod_producao = pd.cod_producao' +
          ' and pi.cod_empresa = pd.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pd.cod_empresa'
        
          'left join grade gra on gra.cod_grade = pi.cod_grade and gra.cod_' +
          'empresa = pi.cod_empresa'
        '/*where pd.status = '#39'FECHADO'#39'*/'
        'union all'
        
          'select 3 "Ordem", '#39'DEV'#39' "Tipo", '#39'DEV'#39' "Tipo2", '#39'E'#39' "Natureza", d' +
          'ev.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",'
        
          'dev.sequencia "Numero", dev.data "Data", dev.data "Data Confirm"' +
          ','
        #39'FECHADA'#39', dev.quant "Quantidade",'
        'dev.valor "Valor Unit", (dev.valor * dev.quant) "Valor Total",'
        
          'case when (coalesce(dev.nf_gerou, '#39#39') <> '#39'S'#39') then '#39'S'#39' else '#39'N'#39' ' +
          'end "Altera Estoque",'
        
          #39'N'#39' "Altera Custo", dev.pcust_mc "Custo Med", dev.seqid "Seq ID"' +
          ','
        
          'dev.grupo_prod "Grupo", dev.cod_prod "Cod Prod", dev.num_fab_pro' +
          'd "Num Fab",'
        'dev.descricao "Descricao",'
        
          'coalesce(gra.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao,' +
          #39'SEM GRADE'#39') "Descricao Grade",'
        
          'cl.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedo' +
          'r",'
        
          'dev.tipo "Tipo", dev.tipo_venda "Tipo Venda", coalesce(dev.cod_v' +
          'enda, 0) "Num Venda",'
        'coalesce(dev.cod_nf, 0) "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        
          '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI", dev.data_estoque "Dat' +
          'a Estoque", dev.sequencia "Seq Id"'
        'from devolucao dev'
        'inner join empresa emp on emp.cod_empresa = dev.cod_empresa'
        
          'left join grade gra on gra.cod_grade = dev.cod_grade and gra.cod' +
          '_empresa = dev.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = dev.cod_cliente and c' +
          'l.cod_empresa = dev.cod_empresa'
        '/*where coalesce(dev.nf_gerou, '#39#39') <> '#39'S'#39'*/'
        'union all'
        'select 1 "Ordem", trim(pv.tipo) "Tipo", trim(pv.tipo) "Tipo2",'
        
          'case when (trim(pv.tipo) = '#39'ORC'#39') then '#39#39' else '#39'S'#39' end "Natureza' +
          '",'
        'ipv.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",'
        'pv.nped "Numero",'
        'pv.data_ped "Data",'
        'pv.data_fech "Data Confirm",'
        'pv.status_ped, ipv.quant_ped_item "Quantidade",'
        
          'ipv.vlun_ped_item "Valor Unit" , ipv.vltot_ped_item "Valor Total' +
          '",'
        'case when (trim(pv.tipo) = '#39'ORC'#39') then '#39'N'#39
        '     when (pv.data_fech is not null) then '#39'S'#39
        '     else '#39'N'#39' end "Altera Estoque",'
        
          #39'N'#39' "Altera Custo", ipv.pcust_mc "Custo Med", ipv.nitem "N Item"' +
          ','
        
          'ipv.grupo_prod "Grupo", ipv.cod_prod "Cod Prod", ipv.num_fab_pro' +
          'd "Num Fab",'
        'case when (ipv.cod_grade > 0) then'
        '  ipv.descr_prod_ped ||'#39' - '#39'||coalesce(gra.descricao,'#39#39')'
        'else'
        '  ipv.descr_prod_ped'
        'end "Descricao",'
        
          'coalesce(gra.cod_grade,0) "Cod Grade", coalesce(gra.descricao,'#39'S' +
          'EM GRADE'#39') "Grade",'
        
          'cl.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedo' +
          'r",'
        
          'case when pv.tipo = '#39'REQ'#39' then pv.tipv else pv.tipo_os end "Tipo' +
          ' Vnd/OS", '#39#39' "Tipo Venda",'
        '0 "Num Venda",'
        
          'coalesce(ipv.cod_nf, 0) "Cod NF", ipv.codigo_nop "Cod CFOP", nat' +
          '.descricao_nop "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        'case when (pv.tipo = '#39'ORC'#39') then pv.data_ped'
        '     when (pv.data_fech is null) then pv.data_ped'
        '     else pv.data_estoque end "Data Estoque",'
        'pv.nped "Seq Id"'
        'from pedvenda pv'
        
          'inner join pedvenda_prod ipv on ipv.tipo = pv.tipo and ipv.nped ' +
          '= pv.nped and ipv.cod_empresa = pv.cod_empresa'
        
          'inner join produtos pr on pr.cod_prod = ipv.cod_prod and pr.grup' +
          'o_prod = ipv.grupo_prod and pr.cod_empresa = ipv.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl' +
          '.cod_empresa = pv.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pv.cod_empresa'
        
          'left join grade gra on gra.cod_grade = ipv.cod_grade and gra.cod' +
          '_empresa = ipv.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = ipv.codigo_nop'
        'left join tipo_vendas tp on tp.tipo = pv.tipo'
        'and ((trim(tp.tipo) = '#39'OS'#39' and tp.tipo_os = pv.tipo_os)'
        '  or (trim(tp.tipo) = '#39'ORC'#39' and tp.sigla = pv.tipo_orc)'
        '  or (tp.sigla = pv.tipv))'
        'where /* pv.status_ped = '#39'FECHADA'#39' and pv.tipo <> '#39'ORC'#39
        'and */'
        'coalesce(pv.status_ped, '#39#39') <> '#39'CANCELADO'#39
        
          'and ((ipv.status is null) or (ipv.status <> '#39'CANCELADO'#39')) and pv' +
          '.ativo = 1'
        'union all'
        
          'select 2 "Ordem", '#39'PDC'#39' "Tipo", '#39'PDC'#39' "Tipo2", '#39'S'#39' "Natureza", p' +
          'i.cod_empresa "Cod Empresa", emp.nome_emp "Empresa",'
        
          'pd.cod_producao "Num Producao", pd.data "Data", pd.data_fechamen' +
          'to "Data Confirm",'
        'pd.status   ,'
        
          '(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_pe' +
          'rda,0)) "Quantidade",'
        'pi.prec_cusm_prod "Custo Unit",'
        
          '((coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_p' +
          'erda,0)) * pi.prec_cusm_prod) "Custo Total",'
        'case when (trim(pd.status) = '#39'FECHADO'#39') then '#39'S'#39
        '     else '#39'N'#39' end "Altera Estoque",'
        
          #39'N'#39' "Altera Custo", pi.prec_cusm_prod "Custo Med", pi.nitem "N I' +
          'tem",'
        
          'pi.grupo_prod "Grupo", pi.cod_prod "Cod Prod", pi.num_fab_prod "' +
          'Num Fab.",'
        
          'pi.descr_prod "Descricao", gra.cod_grade "Cod. Grade", gra.descr' +
          'icao "Descricao Grade",'
        '0 "Cod Cliente", emp.nome_emp "Cliente/Fornecedor",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        '0 "Cod NF", 0 "Cod CFOP", '#39#39' "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        'case when (pd.data_fechamento is not null) then pd.data_estoque'
        '     else pd.data end "Data Estoque", pd.cod_producao "Seq Id"'
        'from producao pd'
        
          'inner join producao_item_indice pi on pi.cod_producao = pd.cod_p' +
          'roducao and pi.cod_empresa = pd.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pd.cod_empresa'
        
          'left join grade gra on gra.cod_grade = pi.cod_grade and gra.cod_' +
          'empresa = pi.cod_empresa'
        '/*where pd.status = '#39'FECHADO'#39'*/'
        'union all'
        
          'select case when trim(h.tipor) = '#39'NF'#39' then 1 when trim(h.tipor) ' +
          '= '#39'DEV'#39' then 3 when trim(h.tipor) = '#39'COR'#39' then 4 else 2 end "Ord' +
          'em",'
        
          'case when trim(h.tipor) = '#39'COR'#39' then trim(h.tipor) else trim(h.t' +
          'ipor)||'#39'X'#39' end "Tipo",'
        'case when ((trim(h.tipor) = '#39'NF'#39') and (h.natureza = '#39'E'#39')) then'
        '       '#39'NFEX'#39
        '     when (trim(h.tipor) = '#39'NF'#39') then'
        '       '#39'NFSX'#39
        
          '     when trim(h.tipor) = '#39'COR'#39' then trim(h.tipor) else trim(h.t' +
          'ipor)||'#39'X'#39' end "Tipo2",'
        'h.natureza, h.cod_empresa, emp.nome_emp EMPRESA,'
        'case when (h.numero > 0) then h.numero'
        '     else 0 end "Num NF",'
        'h.data "Data", h.data "Data Confirm", '#39'FECHADA'#39','
        
          'coalesce(h.qtde, 0) "Quantidade", coalesce(h.valor_unit, 0) "Val' +
          'or Unit", coalesce(h.valor_tot, 0) "Valor Total",'
        #39'S'#39' "Altera Estoque",'
        
          'case when trim(h.tipor) = '#39'NF'#39' then coalesce(h.alterou_custo, '#39'S' +
          #39') else coalesce(h.alterou_custo, '#39'N'#39') end "Altera Custo",'
        'h.custo_med "Custo Med", h.nitem "N Item",'
        
          'h.grupo_prod "Grupo", h.cod_prod "Cod Prod", pr.num_fab_prod "Nu' +
          'm Fab.",'
        
          'rtrim(pr.descr_prod) || case when coalesce(gra.cod_grade, 0) = 0' +
          ' then '#39#39' else '#39' - '#39' || gra.descricao end "Descricao", coalesce(h' +
          '.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao, '#39'SEM GRADE'#39 +
          ') "Descricao Grade",'
        
          'h.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor' +
          '",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          'coalesce(h.cod_nf , 0)"Cod NF", h.cod_cfop "Cod CFOP", nat.descr' +
          'icao_nop "CFOP",'
        
          'coalesce(h.aliq_icm, 0) "Aliq ICM", coalesce(h.base_icm, 0) "Bas' +
          'e ICM", coalesce(h.valor_icm, 0) "Valor ICM",'
        
          'coalesce(h.aliq_st, 0) "Aliq ST", coalesce(h.base_st, 0) "Base S' +
          'T", coalesce(h.valor_st, 0) "Valor ST",'
        
          'coalesce(h.aliq_ipi, 0) "Aliq IPI", coalesce(h.base_ipi, 0) "Bas' +
          'e IPI", coalesce(h.valor_ipi, 0) "Valor IPI", h.data "Data Estoq' +
          'ue", h.seqid "Seq Id"'
        'from hist_estoque_diario h'
        
          'inner join produtos pr on pr.grupo_prod = h.grupo_prod and pr.co' +
          'd_prod = h.cod_prod and pr.cod_empresa = h.cod_empresa'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        
          'left join grade gra on gra.cod_grade = h.cod_grade and gra.cod_e' +
          'mpresa = h.cod_empresa'
        
          'left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and ' +
          'gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and ' +
          'gp.cod_empresa = pr.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = h.cod_cliente and cl.c' +
          'od_empresa = h.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = h.cod_cfop'
        'union all'
        
          'select case when trim(h.tipor) = '#39'NF'#39' then 1 when trim(h.tipor) ' +
          '= '#39'DEV'#39' then 3 when trim(h.tipor) = '#39'COR'#39' then 4 else 2 end "Ord' +
          'em",'
        
          'case when trim(h.tipor) = '#39'COR'#39' then trim(h.tipor) else trim(h.t' +
          'ipor)||'#39'X'#39' end "Tipo",'
        'case when ((trim(h.tipor) = '#39'NF'#39') and (h.natureza = '#39'E'#39')) then'
        '       '#39'NFEX'#39
        '     when (trim(h.tipor) = '#39'NF'#39') then'
        '       '#39'NFSX'#39
        
          '     when trim(h.tipor) = '#39'COR'#39' then trim(h.tipor) else trim(h.t' +
          'ipor)||'#39'X'#39' end "Tipo2",'
        'h.natureza, h.cod_empresa, emp.nome_emp EMPRESA,'
        'case when (h.numero > 0) then h.numero'
        '     else 0 end "Num NF",'
        'h.data "Data", h.data "Data Confirm", '#39'FECHADA'#39','
        
          'coalesce(h.qtde, 0) "Quantidade", coalesce(h.valor_unit, 0) "Val' +
          'or Unit", coalesce(h.valor_tot, 0) "Valor Total",'
        #39'S'#39' "Altera Estoque",'
        
          'case when trim(h.tipor) = '#39'NF'#39' then coalesce(h.alterou_custo, '#39'S' +
          #39') else coalesce(h.alterou_custo, '#39'N'#39') end "Altera Custo",'
        'h.custo_med "Custo Med", h.nitem "N Item",'
        
          'h.grupo_prod "Grupo", h.cod_prod "Cod Prod", pr.num_fab_prod "Nu' +
          'm Fab.",'
        
          'rtrim(pr.descr_prod) || case when coalesce(gra.cod_grade, 0) = 0' +
          ' then '#39#39' else '#39' - '#39' || gra.descricao end "Descricao", coalesce(h' +
          '.cod_grade, 0) "Cod. Grade", coalesce(gra.descricao, '#39'SEM GRADE'#39 +
          ') "Descricao Grade",'
        
          'h.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor' +
          '",'
        #39#39' "Tipo", '#39#39' "Tipo Venda", 0 "Num Venda",'
        
          'coalesce(h.cod_nf , 0)"Cod NF", h.cod_cfop "Cod CFOP", nat.descr' +
          'icao_nop "CFOP",'
        
          'coalesce(h.aliq_icm, 0) "Aliq ICM", coalesce(h.base_icm, 0) "Bas' +
          'e ICM", coalesce(h.valor_icm, 0) "Valor ICM",'
        
          'coalesce(h.aliq_st, 0) "Aliq ST", coalesce(h.base_st, 0) "Base S' +
          'T", coalesce(h.valor_st, 0) "Valor ST",'
        
          'coalesce(h.aliq_ipi, 0) "Aliq IPI", coalesce(h.base_ipi, 0) "Bas' +
          'e IPI", coalesce(h.valor_ipi, 0) "Valor IPI", h.data "Data Estoq' +
          'ue", h.seqid "Seq Id"'
        'from hist_estoque_diario_prod h'
        
          'inner join produtos pr on pr.grupo_prod = h.grupo_prod and pr.co' +
          'd_prod = h.cod_prod and pr.cod_empresa = h.cod_empresa'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        
          'left join grade gra on gra.cod_grade = h.cod_grade and gra.cod_e' +
          'mpresa = h.cod_empresa'
        
          'left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and ' +
          'gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and ' +
          'gp.cod_empresa = pr.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = h.cod_cliente and cl.c' +
          'od_empresa = h.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = h.cod_cfop'
        'union all'
        'select 5 "Ordem", '#39'CP'#39' "Tipo",  '#39'CP'#39' "Tipo2", '#39'S'#39' "Natureza",'
        
          'cp.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", cp.cupom "' +
          'Numero",'
        'cp.data "Data", cp.data "Data Confirm",'
        
          'case when (trim(cp.status_cp) = '#39#39') then '#39'FECHADO'#39' else upper(tr' +
          'im(cp.status_cp)) end,'
        'cp2.quantidade "Quantidade",'
        'cp2.preco "Valor Unit", cp2.total "Valor Total",'
        
          #39'N'#39' "Altera Estoque", '#39'N'#39' "Altera Custo", cp2.prec_cusm_prod "Cu' +
          'sto Med",'
        
          'cp2.nitem "N Item", cp2.grupo_prod "Grupo", cp2.cod_prod "Cod Pr' +
          'od", cp2.codbarra "Num Fab",'
        'case when (cp2.cod_grade > 0) then'
        '  cp2.descr_it || '#39' - '#39'||coalesce(gra.descricao, '#39#39')'
        'else'
        '  cp2.descr_it'
        'end "Descricao",'
        
          'coalesce(gra.cod_grade, 0) "Cod Grade", coalesce(gra.descricao, ' +
          #39'SEM GRADE'#39') "Grade",'
        'cp.cliente "Cod Cliente", cl.nome_cliente "Cliente/Fornecedor",'
        
          'coalesce(pd.tipv, '#39#39') "Tipo Vnd/OS", '#39#39' "Tipo Venda", coalesce(p' +
          'd.nped, 0) "Num Venda",'
        '0 "Cod NF", cp2.codigo_nop "Cod CFOP", nat.descricao_nop "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        'cp.data "Data Estoque", cp.registro "Seq Id"'
        'from cupom cp'
        
          'inner join cupom2 cp2 on cp2.cod_terminal = cp.cod_terminal and ' +
          'cp2.cod_empresa = cp.cod_empresa'
        '  and cp2.nserieecf = cp.nserieecf and cp2.ordem = cp.registro'
        'inner join empresa emp on emp.cod_empresa = cp.cod_empresa'
        
          'left join grade gra on cp2.cod_grade = gra.cod_grade and cp2.cod' +
          '_empresa = gra.cod_empresa'
        
          'inner join produtos pr on cp2.grupo_prod = pr.grupo_prod and cp2' +
          '.cod_prod = pr.cod_prod and cp2.cod_empresa = pr.cod_empresa'
        
          'inner join clientes cl on cp.cliente = cl.cod_cliente and cp.cod' +
          '_empresa = cl.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = cp2.codigo_nop'
        
          'left join pedvenda pd on pd.nped = cp.ped and coalesce(pd.npreve' +
          'nda, 0) = coalesce(cp.prevenda, 0)'
        
          '  and  coalesce(pd.paf_num_prevenda, 0) = coalesce(cp.paf_num_pr' +
          'evenda, 0) and pd.cod_empresa = cp.cod_empresa'
        
          'where ((cp2.status_it is null) or (cp2.status_it <> '#39'CANCELADO'#39')' +
          ')'
        'union all'
        'select 6 "Ordem", '#39'NFD'#39' "Tipo", '#39'NFD'#39' "Tipo2", '#39'S'#39' "Natureza",'
        
          'nd.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", nd.numeron' +
          'ota "Numero",'
        'nd.dataemissao "Data", nd.dataemissao "Data Confirm",'
        'upper(trim(nd.status)), ndi.quantid_item "Quantidade",'
        'ndi.vl_un_item "Valor Unit", ndi.vl_tot_item "Valor Total",'
        
          #39'N'#39' "Altera Estoque", '#39'N'#39' "Altera Custo", ndi.prec_cusm_prod "Cu' +
          'sto Med",'
        
          'ndi.nitem "N Item", ndi.grupo_prod "Grupo", ndi.cod_prod "Cod Pr' +
          'od", ndi.num_fab_prod "Num Fab",'
        
          'ndi.desc_prod "Descricao", nd.cod_cliente "Cod Cliente", cl.nome' +
          '_cliente "Cliente/Fornecedor",'
        '0 "Cod Grade", '#39'SEM GRADE'#39' "Grade",'
        #39#39' "Tipo Vnd/OS", '#39#39' "Tipo Venda", nd.nped "Num Venda",'
        
          '0 "Cod NF", 0 "Cod CFOP", '#39#39' CFOP, 0 "Aliq", ndi.base_icm "Base ' +
          'ICM", ndi.valor_icm "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        'nd.dataemissao "Data Estoque", nd.numeronota "Seq Id"'
        'from nf_serie_d_itens ndi'
        
          'inner join nf_serie_d nd on nd.numeronota = ndi.numeronota and n' +
          'd.cod_empresa = ndi.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = ndi.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = nd.cod_cliente and cl.' +
          'cod_empresa = nd.cod_empresa'
        'left join estados est on est.codigo_uf = cl.codigo_uf'
        
          'inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod' +
          '_prod = ndi.cod_prod and p.cod_empresa = ndi.cod_empresa'
        'left join nat_op nt on nt.codigo_nop = p.codigo_nop'
        'left join nbm on nbm.cod_ncm = p.nbm'
        'where ((nd.status <> '#39'CANCELADA'#39') or (nd.status is null))'
        'union all'
        'select 5 "Ordem", '#39'NFC'#39' Tipo, '#39'NFC'#39' "Tipo2", '#39'S'#39' "Natureza",'
        
          'nfc.cod_empresa "Cod Empresa", emp.nome_emp "Empresa", coalesce(' +
          'nfc.num_nf, 0) "Numero",'
        'nfc.data_lanc "Data",'
        'nfc.data_lanc "Data Confirm",'
        'upper(trim(nfc.status)) status,'
        
          'nfci.qcom "Quantidade", nfci.vuncom "Valor Unit", nfci.vprod "Va' +
          'lor Total",'
        
          #39'N'#39' "Altera Estoque", '#39'N'#39' "Altera Custo", nfci.prec_cusm_prod "C' +
          'usto Med",'
        
          'nfci.nitem "N Item", nfci.grupo_prod "Grupo", nfci.cod_prod "Cod' +
          ' Prod", nfci.num_fab_prod "Num Fab",'
        'case when (nfci.cod_grade > 0) then'
        '  nfci.xprod ||'#39' - '#39'|| coalesce(gra.descricao, '#39#39')'
        'else'
        '  nfci.xprod'
        'end "Descricao",'
        
          'coalesce(gra.cod_grade, 0) "Cod Grade", coalesce(gra.descricao, ' +
          #39'SEM GRADE'#39') "Grade",'
        
          'nfc.cod_cliente "Cod Cliente", cl.nome_cliente "Cliente/Forneced' +
          'or",'
        #39#39' "Tipo Vnd/OS", '#39#39' "Tipo Venda",'
        'case when (coalesce(nfc.ped_origem_num,0) > 0) then'
        '      coalesce(nfc.ped_origem_num, 0)'
        '     else'
        '       coalesce(nfc.ped_destino_num, 0)'
        'end "Num Venda",'
        
          'coalesce(nfc.cod_nfce, 0) "Cod NF", nfci.cfop "Cod CFOP", nat.de' +
          'scricao_nop "CFOP",'
        '0 "Aliq ICM", 0 "Base ICM", 0 "Valor ICM",'
        '0 "Aliq ST", 0 "Base ST", 0 "Valor ST",'
        '0 "Aliq IPI", 0 "Base IPI", 0 "Valor IPI",'
        'nfc.data_lanc "Data Estoque", nfc.cod_nfce "Seq Id"'
        'from nfce nfc'
        
          'inner join nfce_item nfci on nfci.cod_nfce = nfc.cod_nfce and nf' +
          'ci.cod_empresa = nfc.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = nfc.cod_empresa'
        'left join nat_op nat on nat.codigo_nop = nfci.cfop'
        
          'left join grade gra on nfci.cod_grade = gra.cod_grade and nfci.c' +
          'od_empresa = gra.cod_empresa'
        
          'inner join produtos pr on nfci.grupo_prod = pr.grupo_prod and nf' +
          'ci.cod_prod = pr.cod_prod and nfci.cod_empresa = pr.cod_empresa'
        
          'left join clientes cl on nfc.cod_cliente = cl.cod_cliente and nf' +
          'ci.cod_empresa = cl.cod_empresa'
        
          'where ((upper(trim(nfc.status)) <> '#39'CANCELADA'#39') or (nfc.status i' +
          's null));'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER DEVOLUCAO_HIST_ESTOQUE_D FOR DEVOLUCAO'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        'begin'
        '   IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '   if (coalesce(old.nf_gerou, '#39#39') = '#39'S'#39') then'
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
        
          '   '#39'DEV'#39', '#39'S'#39', current_date, old.grupo_prod, old.cod_prod, old.c' +
          'od_grade, null, old.sequencia, old.quant,'
        
          '   old.valor, (old.quant * old.valor), '#39'N'#39', old.pcust_mc, old.se' +
          'qid, old.cod_cliente, 0,'
        '   0, 0, 0, 0, 0, 0, 0, 0, 0, 0);'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NOTAFISCAL_ITEM_HIST_ESTOQUE_D FOR NOTAF' +
          'ISCAL_ITEM'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        ' DECLARE VARIABLE  vnatureza char(1);'
        ' DECLARE VARIABLE  vtiponf char(1);'
        ' DECLARE VARIABLE  vnumero integer;'
        ' DECLARE VARIABLE  vcodcliente integer;'
        ' DECLARE VARIABLE  vdataestoque timestamp;'
        ' DECLARE VARIABLE  vstatus varchar(10);'
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
        
          '   '#39'NF'#39', '#39'S'#39', current_date, old.grupo_prod, old.cod_prod, old.co' +
          'd_grade, old.chassi, :vnumero, old.quantidade,'
        
          '   old.valor_unitario, old.valor_total, '#39'N'#39', old.prec_cusm_prod,' +
          ' old.nitem, :vcodcliente, old.codigo_nop,'
        
          '   old.aliq_icm, old.base_icm, old.valor_icm, old.aliq_icmsub, o' +
          'ld.base_icmsub, old.valor_icmsub,'
        '   old.aliq_ipi, old.base_ipi, old.valor_ipi, old.cod_nf);'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_HIST_ESTOQUE_D FOR PEDVENDA'
        'ACTIVE BEFORE UPDATE OR DELETE POSITION 0'
        'AS'
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
        
          '    trim(pedvenda.tipo), '#39'E'#39', current_date, pedvenda_prod.grupo_' +
          'prod, pedvenda_prod.cod_prod,'
        
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
        'CREATE OR ALTER TRIGGER PRODUCAO_HIST_ESTOQUE_D FOR PRODUCAO'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        
          '  if (not ((trim(coalesce(old.status, '#39#39')) <> trim(coalesce(new.' +
          'status, '#39#39')))'
        '   and trim(coalesce(old.status, '#39#39')) = '#39'FECHADO'#39')) then'
        '     exit;'
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
        
          '    '#39'PDC'#39', '#39'S'#39', current_date, producao_item.grupo_prod, producao' +
          '_item.cod_prod,'
        
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
        
          '    '#39'PDC'#39', '#39'E'#39', current_date, producao_item_indice.grupo_prod, p' +
          'roducao_item_indice.cod_prod,'
        
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
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE HIST_ESTOQUE_DIARIO ADD GRUPO_PROD_OLD INTEGER; '
        'ALTER TABLE HIST_ESTOQUE_DIARIO ADD COD_PROD_OLD CHAR(6);'
        
          'ALTER TABLE HIST_ESTOQUE_DIARIO ADD CONSTRAINT FK_HIST_ESTOQUE_D' +
          'IARIO FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES' +
          ' PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON UPDATE CASCADE;'
        'ALTER TABLE CONFIG_SISTEMA ADD VALUE_DT TIMESTAMP;'
        ''
        '|BLOCO|'
        
          'create or alter procedure sp_hist_prod_datas (grup integer, cod ' +
          ' char(6), cod_empresa integer)'
        
          'returns (grupo_prod integer, cod_prod char(6), grupo_ant integer' +
          ', cod_ant char(6), data_ini timestamp, data_fim timestamp,'
        '  grupo_at integer, cod_at char(6))'
        'as'
        '  declare variable str varchar(32);'
        '  declare variable gr integer;'
        '  declare variable cd char(6);'
        'begin'
        ''
        
          '  for select distinct grupo_prod, cod_prod from produtos_alterac' +
          'oes pa'
        
          '    where pa.valor_anterior = :grup||'#39'|'#39'||trim(:cod)||'#39'|'#39' and pa' +
          '.cod_empresa = :cod_empresa'
        '  into :grupo_prod, :cod_prod'
        '  do'
        '  begin'
        '    grupo_at = grupo_prod;'
        '    cod_at = cod_prod;'
        '  '
        '    for'
        '      select pa.valor_anterior, pa.data_ini,  pa.data_alteracao'
        '      from produtos_alteracoes pa'
        
          '        where pa.grupo_prod = :grupo_prod and pa.cod_prod = :cod' +
          '_prod and pa.cod_empresa = :cod_empresa'
        '      order by pa.data_alteracao desc'
        '      into :str, :data_ini, :data_fim'
        '    do'
        '    begin'
        
          '      grupo_ant = substring(:str from 1 for (select result from ' +
          'pos('#39'|'#39', :str)) - 1);'
        '  '
        
          '      cod_ant = substring(:str from 1 + (select result from pos(' +
          #39'|'#39', :str))'
        
          '           for (character_length(:str) - (select result from pos' +
          '('#39'|'#39', :str)) - 1));'
        '  '
        '      suspend;'
        '  '
        '      grupo_prod = grupo_ant;'
        '      cod_prod = cod_ant;'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*create or alter procedure VINC_HIST_PROD */'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CFG054'#39', :COD_EMPRESA, '#39'MENU NBACKUP CONFIGURAR'#39' , 10' +
          '0, '#39'S'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'CFG055'#39', :COD_EMPRESA, '#39'MENU NBACKUP EXECUTAR'#39' , 100,' +
          ' '#39'S'#39', '#39'S'#39');'
        ''
        '|BLOCO|'
        'CREATE TABLE DEL_EC ('
        '    SEQID             INTEGER NOT NULL,'
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    TABELA            VARCHAR(31) NOT NULL,'
        '    DATA_HORA_ALT_WS  TIMESTAMP,'
        '    ID_COMMERCE       INTEGER,'
        '    ATIVO             INTEGER DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE DEL_EC ADD CONSTRAINT PK_DEL_EC PRIMARY KEY (SEQID, ' +
          'COD_EMPRESA, TABELA);'
        'CREATE INDEX IDXDEL_EC ON DEL_EC (SEQID);'
        'ALTER TABLE EMPDESVOLV ADD COD_EMP_COMMERCE INTEGER;'
        'ALTER TABLE EMPDESVOLV ADD DADOS_COMMERCE VARCHAR(100);'
        'ALTER TABLE EMPDESVOLV ADD COD_EMP_PROG_FID INTEGER;'
        'ALTER TABLE EMPDESVOLV ADD DADOS_PROG_FID VARCHAR(100);'
        'ALTER TABLE EMPDESVOLV ADD COD_EMP_ENV_NOT INTEGER;'
        'ALTER TABLE EMPDESVOLV ADD DADOS_ENV_NOT VARCHAR(100);'
        'CREATE SEQUENCE SEQ_DEL_EC;'
        ''
        '|BLOCO|'
        'CREATE TABLE KITS_PROD_EC ('
        '    CODIGO_KIT           INTEGER NOT NULL,'
        '    COD_EMPRESA          INTEGER NOT NULL,'
        '    DESCR_KIT_RES        VARCHAR(131),'
        '    DESCR_KIT_COMPL      BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
        '    SINC_ECOMMERCE       CHAR(1) DEFAULT '#39'N'#39','
        '    DISPONIVEL           CHAR(1) DEFAULT '#39'N'#39','
        '    PROMOCIONAL          CHAR(1) DEFAULT '#39'N'#39','
        '    FRETE_GRATIS         CHAR(1) DEFAULT '#39'N'#39','
        '    LANCAMENTO           CHAR(1) DEFAULT '#39'N'#39','
        '    DESTAQUE             CHAR(1) DEFAULT '#39'N'#39','
        '    VARIACAO             CHAR(1) DEFAULT '#39'N'#39','
        '    TERMOS_ACEITE        CHAR(1) DEFAULT '#39'N'#39','
        '    COMPREJUNTO          CHAR(1) DEFAULT '#39'N'#39','
        '    VIRTUAL              CHAR(1) DEFAULT '#39'N'#39','
        '    COD_CATEGORIA        INTEGER,'#9
        '    REFERENCIA           VARCHAR(20),'
        '    COD_EAN              VARCHAR(20),'
        '    REGRA_PESO_DIM       VARCHAR(20), '
        '    PESO_BRUT_KIT        T_N_GERAL,'
        '    COMPRIMENTO_KIT      T_N_GERAL,'
        '    LARGURA_KIT          T_N_GERAL,'
        '    ALTURA_KIT           T_N_GERAL,'
        '    ID_COMMERCE          INTEGER,'
        '    SEQID_EC             BIGINT'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE KITS_PROD_EC ADD CONSTRAINT PK_KITS_PROD_EC PRIMARY ' +
          'KEY (CODIGO_KIT, COD_EMPRESA);'
        
          'ALTER TABLE KITS_PROD_EC ADD CONSTRAINT FK_KITS_PROD_EC_KITS FOR' +
          'EIGN KEY (CODIGO_KIT,COD_EMPRESA) REFERENCES KITS_PROD(CODIGO_KI' +
          'T,COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        'ALTER TABLE KITS_PROD ADD ID_COMMERCE INTEGER;'
        'ALTER TABLE KITS_PROD ADD ALTEROU_IMAGEM CHAR(1);'
        
          'ALTER TABLE KITS_PROD ADD LISTA_IMAGENS BLOB SUB_TYPE 1 SEGMENT ' +
          'SIZE 256;'
        
          'ALTER TABLE KITS_PROD ADD URL_IMAGENS BLOB SUB_TYPE 1 SEGMENT SI' +
          'ZE 256;'
        'CREATE INDEX IDX_EC_KITS_PROD_EC ON KITS_PROD_EC (SEQID_EC);'
        'CREATE SEQUENCE SEQ_EC_KITS_PROD_EC;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_KITS_PROD_EC FOR KITS_PROD_EC'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  DECLARE VARIABLE VSEQID BIGINT;'
        '  DECLARE VARIABLE VDELETE INTEGER;'
        '  DECLARE VARIABLE VCODEMPF INTEGER;'
        'begin'
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  VDELETE = 0; '
        
          '  select coalesce(cod_emp_commerce, 0) cod_empresa_fisica from e' +
          'mpdesvolv where cod_empdes = 1 into :vcodempf; '
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
        
          '    VALUES(:VSEQID, :VCODEMPF, '#39'KITS_PROD_EC'#39', CURRENT_TIMESTAMP' +
          ', OLD.ID_COMMERCE);'
        '  end '
        '  else if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_KITS_PROD_EC, 1) FROM R' +
          'DB$DATABASE);'
        '  end '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_KITS_PROD_EC_SEQ FOR KITS_PROD'
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
        '  SELECT KITS_PROD_EC.ID_COMMERCE FROM KITS_PROD_EC'
        '  WHERE KITS_PROD_EC.CODIGO_KIT = NEW.CODIGO_KIT'
        
          '  AND KITS_PROD_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO: IDCOMMERC' +
          'E;'
        ''
        '  IF (COALESCE(IDCOMMERCE, 0) > 0) THEN'
        '    new.ID_COMMERCE = :IDCOMMERCE;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_KITS_PROD_EC FOR KITS_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE VSINC_ECOMMERCE VARCHAR(1);'
        '  DECLARE VARIABLE IDCOMMERCE INTEGER;'
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
        '  /*'
        '  IF(COALESCE(ECOMMERCE, 0) <= 0) THEN'
        '    exit;*/'
        ''
        '  if (trim(old.LISTA_IMAGENS) <> trim(new.LISTA_IMAGENS)) then'
        '  begin'
        '    if (coalesce(new.ALTEROU_IMAGEM, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM = '#39'S'#39';'
        '  end'
        ''
        
          '  SELECT KITS_PROD_EC.SINC_ECOMMERCE, KITS_PROD_EC.ID_COMMERCE F' +
          'ROM KITS_PROD_EC'
        '  WHERE KITS_PROD_EC.CODIGO_KIT = NEW.CODIGO_KIT'
        
          '  AND KITS_PROD_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :VSINC_ECO' +
          'MMERCE, :IDCOMMERCE;'
        ''
        '  IF (COALESCE(IDCOMMERCE, 0) > 0) THEN'
        '    new.ID_COMMERCE = :IDCOMMERCE;'
        '    '
        '  if (updating) then'
        
          '    if ((coalesce(old.ativo, 0) <> coalesce(new.ativo, 0)) and (' +
          'new.ativo = 0)) then'
        '        VSQL = '#39' kits_prod_ec.disponivel = '#39#39'N'#39#39', '#39';'
        ''
        '    execute statement'
        '      '#39'update kits_prod_ec set '#39'||VSQL||'#39
        '         kits_prod_ec.codigo_kit = '#39'||new.codigo_kit||'#39','
        '         kits_prod_ec.cod_empresa = '#39'||new.cod_empresa||'#39
        '      where kits_prod_ec.codigo_kit = '#39'||new.codigo_kit||'#39
        '      and kits_prod_ec.cod_empresa = '#39'||new.cod_empresa||'#39';'#39';'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE KITS_PROD_KITS ADD ID_COMMERCE INTEGER;'
        
          'ALTER TABLE KITS_PROD_KITS ADD SINC_ECOMMERCE CHAR(1) DEFAULT '#39'N' +
          #39';'
        'ALTER TABLE KITS_PROD_KITS ADD SEQID_EC BIGINT;'
        'CREATE SEQUENCE SEQ_EC_KITS_PROD_KITS;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_DTEC_KITS_PROD_KITS_EC FOR KITS_PROD_' +
          'KITS'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '    DECLARE VARIABLE VSEQID BIGINT;'
        '    DECLARE VARIABLE VDELETE INTEGER;'
        '    DECLARE VARIABLE VCODEMPF INTEGER;'
        'begin'
        '    /* Trigger text */'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        '    VDELETE = 0;'
        
          '    select coalesce(cod_emp_commerce, 0) cod_empresa_fisica from' +
          ' empdesvolv where cod_empdes = 1 into :vcodempf;'
        ''
        ''
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
        '        if (COALESCE(OLD.ID_COMMERCE, 0) <= 0) then'
        '            exit;'
        ''
        
          '        SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO :VSE' +
          'QID;'
        
          '        INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_HORA' +
          '_ALT_WS, ID_COMMERCE)'
        
          '        VALUES(:VSEQID, :VCODEMPF, '#39'KITS_PROD_KITS'#39', CURRENT_TIM' +
          'ESTAMP, OLD.ID_COMMERCE);'
        '        NEW.ID_COMMERCE = 0;'
        '        execute statement'
        '           '#39'update kits_prod_ec set'
        '              kits_prod_ec.codigo_kit = '#39'||old.codigo_kit||'#39','
        '              kits_prod_ec.cod_empresa = '#39'||old.cod_empresa||'#39
        '            where kits_prod_ec.codigo_kit = '#39'||old.codigo_kit||'#39
        
          '            and kits_prod_ec.cod_empresa = '#39'||old.cod_empresa||'#39 +
          ';'#39';'
        '    end'
        '    else if ((inserting)or(updating)) then'
        '    begin'
        
          '        NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_KITS_PROD_KITS, 1) ' +
          'FROM RDB$DATABASE);'
        '        execute statement'
        '           '#39'update kits_prod_ec set'
        '              kits_prod_ec.codigo_kit = '#39'||new.codigo_kit||'#39','
        '              kits_prod_ec.cod_empresa = '#39'||new.cod_empresa||'#39
        '            where kits_prod_ec.codigo_kit = '#39'||new.codigo_kit||'#39
        
          '            and kits_prod_ec.cod_empresa = '#39'||new.cod_empresa||'#39 +
          ';'#39';'
        '    end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_EC FOR PRODUTOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE VSINC_ECOMMERCE VARCHAR(1);'
        '  DECLARE VARIABLE IDCOMMERCE INTEGER;'
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
        '  /*'
        '  IF(COALESCE(ECOMMERCE, 0) <= 0) THEN'
        '    exit;*/'
        ''
        '  if (trim(old.LISTA_IMAGENS) <> trim(new.LISTA_IMAGENS)) then'
        '  begin'
        '    if (coalesce(new.ALTEROU_IMAGEM, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM = '#39'S'#39';'
        '    if (coalesce(new.ALTEROU_IMAGEM_GRADE, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM_GRADE = '#39'S'#39';'
        '  end'
        ''
        
          '  SELECT PRODUTOS_EC.SINC_ECOMMERCE, PRODUTOS_EC.ID_COMMERCE FRO' +
          'M PRODUTOS_EC'
        
          '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD AND PRODUTOS_EC.' +
          'COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :VSINC_ECOM' +
          'MERCE, :IDCOMMERCE;'
        ''
        '  IF (COALESCE(IDCOMMERCE, 0) > 0) THEN'
        '    new.ID_COMMERCE = :IDCOMMERCE;'
        '    '
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
        '  execute statement'
        '   '#39'update kits_prod_kits set'
        '      kits_prod_kits.grupo_prod = '#39'||new.grupo_prod||'#39','
        '      kits_prod_kits.cod_prod = '#39#39#39'||new.cod_prod||'#39#39#39','
        '      kits_prod_kits.cod_empresa = '#39'||new.cod_empresa||'#39
        '    where kits_prod_kits.grupo_prod = '#39'||new.grupo_prod||'#39
        '    and kits_prod_kits.cod_prod = '#39#39#39'||new.cod_prod||'#39#39#39
        '    and kits_prod_kits.cod_empresa = '#39'||new.cod_empresa||'#39';'#39';'
        ''
        
          '  update produtos_ec_grade set produtos_ec_grade.grupo_prod = ne' +
          'w.grupo_prod,'
        '    produtos_ec_grade.cod_prod = new.cod_prod,'
        '    produtos_ec_grade.cod_empresa = new.cod_empresa'
        '  where produtos_ec_grade.grupo_prod = new.grupo_prod'
        '    and produtos_ec_grade.cod_prod = new.cod_prod'
        '    and produtos_ec_grade.cod_empresa = new.cod_empresa;'
        ''
        '  if (updating) then'
        '    if (coalesce(VSINC_ECOMMERCE, '#39'N'#39') = '#39'N'#39') then'
        '    begin'
        
          '      update produtos_ec_grade set produtos_ec_grade.sinc_ecomme' +
          'rce = '#39'N'#39
        '      where produtos_ec_grade.grupo_prod = new.grupo_prod'
        '        and produtos_ec_grade.cod_prod = new.cod_prod'
        '        and produtos_ec_grade.cod_empresa = new.cod_empresa'
        '        and produtos_ec_grade.sinc_ecommerce = '#39'S'#39';'
        '    end'
        'end;'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_CATEGORIA ADD CONSTRAINT FK_PRODUTOS_CATEGO' +
          'RIA_CAT FOREIGN KEY (COD_CATEGORIA, COD_EMPRESA) REFERENCES CATE' +
          'GORIA (COD_CATEGORIA, COD_EMPRESA) ON DELETE CASCADE ON UPDATE C' +
          'ASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE KITS_PROD_CATEGORIA ('
        '    CODIGO_KIT     INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    COD_CATEGORIA  INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE KITS_PROD_CATEGORIA ADD CONSTRAINT PK_KITS_PROD_CATE' +
          'GORIA PRIMARY KEY (CODIGO_KIT, COD_EMPRESA, COD_CATEGORIA);'
        
          'ALTER TABLE KITS_PROD_CATEGORIA ADD CONSTRAINT FK_KITS_PROD_CATE' +
          'GORIA_CAT FOREIGN KEY (COD_CATEGORIA, COD_EMPRESA) REFERENCES CA' +
          'TEGORIA (COD_CATEGORIA, COD_EMPRESA) ON DELETE CASCADE ON UPDATE' +
          ' CASCADE;'
        
          'ALTER TABLE KITS_PROD_CATEGORIA ADD CONSTRAINT FK_KITS_PROD_CATE' +
          'GORIA_KIT FOREIGN KEY (CODIGO_KIT, COD_EMPRESA) REFERENCES KITS_' +
          'PROD (CODIGO_KIT, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCA' +
          'DE;'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 75' +
          ', RDB$CHARACTER_LENGTH = 75, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'KITS_PROD'#39') and (r.rdb$field_name='#39'DES' +
          'CRICAO_KIT'#39'));'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO405'#39', :COD_EMPRESA, '#39'AD' +
          'ICIONAR IMAGEM PRODUTO'#39', 3, '#39'FRMCADKITS'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_D' +
          'ATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO406'#39', :COD_EMPRESA, '#39'VI' +
          'SUALIZAR IMAGEM KIT'#39', 3, '#39'N'#39', '#39'FRMCADKITS'#39', 1, '#39'S'#39', CURRENT_DATE' +
          ');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO407'#39', :COD_EMPRESA, '#39'PR' +
          'OXIMA IMAGEM KIT'#39', 3, '#39'N'#39', '#39'FRMCADKITS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO408'#39', :COD_EMPRESA, '#39'IM' +
          'AGEM ANTERIOR KIT'#39', 3, '#39'N'#39', '#39'FRMCADKITS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO409'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR IMAGEM KIT'#39', 3, '#39'N'#39', '#39'FRMCADKITS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO410'#39', :COD_EMPRESA, '#39'AP' +
          'AGAR KIT UTILIZADO NO ECOMMERCE'#39', 1, '#39'S'#39', '#39'FRMCADKITS'#39', 1, '#39'N'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO411'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR DADOS KIT - ECOMMERCE'#39', 5, '#39'N'#39', '#39'FRMCADKITS'#39', 1, '#39'N'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO412'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR DADOS KIT - ECOMMERCE'#39', 5, '#39'N'#39', '#39'FRMCADKITS'#39', 1, '#39'N'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO413'#39', :COD_EMPRESA, '#39'RE' +
          'M SICRON KIT UTILIZADO NO ECOMMERCE'#39', 100, '#39'S'#39', '#39'FRMCADKITS'#39', 1,' +
          ' '#39'N'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO414'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTA KITPRODUTOS TRAY'#39', 5, '#39'FRMCADKITS'#39', 1, '#39'N'#39', '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO415'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTA KITPRODUTOS SISTEMA'#39', 5, '#39'FRMCADKITS'#39', 1, '#39'N'#39', '#39'S'#39', CU' +
          'RRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO416'#39', :COD_EMPRESA, '#39'BT' +
          ' VINCULAR KITPROD E-COMMERCE/SISTEMA'#39', 5, '#39'FRMCADKITS'#39', 1, '#39'N'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO417'#39', :COD_EMPRESA, '#39'BT' +
          ' REMOVER VINCULO KITPROD E-COMMERCE/SISTEMA'#39', 5, '#39'FRMCADKITS'#39', 1' +
          ', '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO418'#39', :COD_EMPRESA, '#39'BT' +
          ' REENVIAR IMAGENS KITPRODUTO PARA E-COMMERCE'#39', 5, '#39'FRMCADKITS'#39', ' +
          '1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO419'#39', :COD_EMPRESA, '#39'BT' +
          ' GERAR URL REENVIAR IMAGENS KITPRODUTO P/ EC'#39', 5, '#39'FRMCADKITS'#39', ' +
          '1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO420'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTA PRODUTO DO KIT TRAY/SISTEMA'#39', 5, '#39'FRMCADKITS'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', NULL);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO421'#39', :COD_EMPRESA, '#39'BT' +
          ' VINCULAR PRODUTOS KIT E-COMMERCE/SISTEMA'#39', 5, '#39'FRMCADKITS'#39', 1, ' +
          #39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO422'#39', :COD_EMPRESA, '#39'BT' +
          ' REMOVER VINCULO PRODUTOS KIT E-COMMERCE/SISTEMA'#39', 5, '#39'FRMCADKIT' +
          'S'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO423'#39', :COD_EMPRESA, '#39'BT' +
          ' SINCR PRODUTOS KIT E-COMMERCE/SISTEMA'#39', 5, '#39'FRMCADKITS'#39', 1, '#39'N'#39 +
          ', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO424'#39', :COD_EMPRESA, '#39'BT' +
          ' REMOV SINCR PRODUTOS KIT E-COMMERCE/SISTEMA'#39', 5, '#39'FRMCADKITS'#39', ' +
          '1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO425'#39', :COD_EMPRESA, '#39'BT' +
          ' HAB GRADE/VARIACAO DUPLA E-COMMERCE/SISTEMA'#39', 11, '#39'FRMCADGRADE'#39 +
          ', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'CategoriaECommerce'#39' as nome_menu from menus_auto whe' +
          're nome_menu = '#39'Categoria'#39' and cod_empresa = :COD_EMPRESA and (s' +
          'elect count(*) from menus_auto where nome_menu = '#39'CategoriaEComm' +
          'erce'#39' and cod_empresa = :COD_EMPRESA) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'CategoriaECommerce'#39' as nome_menu, status_menu, enable_me' +
          'nu, desc_menu, ativo from menus_auto_sistema where nome_menu = '#39 +
          'Categoria'#39' and (select count(*) from menus_auto_sistema where no' +
          'me_menu = '#39'CategoriaECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'GradesVariacaoECommerce'#39' as nome_menu from menus_aut' +
          'o where nome_menu = '#39'Grades'#39' and cod_empresa = :COD_EMPRESA and ' +
          '(select count(*) from menus_auto where nome_menu = '#39'GradesVariac' +
          'aoECommerce'#39' and cod_empresa = :COD_EMPRESA) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'GradesVariacaoECommerce'#39' as nome_menu, status_menu, enab' +
          'le_menu, desc_menu, ativo from menus_auto_sistema where nome_men' +
          'u = '#39'Grades'#39' and (select count(*) from menus_auto_sistema where ' +
          'nome_menu = '#39'GradesVariacaoECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'IntermediadoresPagECommerce'#39' as nome_menu from menus' +
          '_auto where nome_menu = '#39'Intermediadores'#39' and cod_empresa = :COD' +
          '_EMPRESA and (select count(*) from menus_auto where nome_menu = ' +
          #39'IntermediadoresPagECommerce'#39' and cod_empresa = :COD_EMPRESA) = ' +
          '0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'IntermediadoresPagECommerce'#39' as nome_menu, status_menu, ' +
          'enable_menu, desc_menu, ativo from menus_auto_sistema where nome' +
          '_menu = '#39'Intermediadores'#39' and (select count(*) from menus_auto_s' +
          'istema where nome_menu = '#39'IntermediadoresPagECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ProdutosECommerce'#39' as nome_menu from menus_auto wher' +
          'e nome_menu = '#39'CadastroDeProdutos'#39' and cod_empresa = :COD_EMPRES' +
          'A and (select count(*) from menus_auto where nome_menu = '#39'Produt' +
          'osECommerce'#39' and cod_empresa = :COD_EMPRESA) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ProdutosECommerce'#39' as nome_menu, status_menu, enable_men' +
          'u, desc_menu, ativo from menus_auto_sistema where nome_menu = '#39'C' +
          'adastroDeProdutos'#39' and (select count(*) from menus_auto_sistema ' +
          'where nome_menu = '#39'ProdutosECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'KitsProdutosECommerce'#39' as nome_menu from menus_auto ' +
          'where nome_menu = '#39'CadastrosDeKits'#39' and cod_empresa = :COD_EMPRE' +
          'SA and (select count(*) from menus_auto where nome_menu = '#39'KitsP' +
          'rodutosECommerce'#39' and cod_empresa = :COD_EMPRESA) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'KitsProdutosECommerce'#39' as nome_menu, status_menu, enable' +
          '_menu, desc_menu, ativo from menus_auto_sistema where nome_menu ' +
          '= '#39'CadastrosDeKits'#39' and (select count(*) from menus_auto_sistema' +
          ' where nome_menu = '#39'KitsProdutosECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ConfiguracaoApiECommerce'#39' as nome_menu from menus_au' +
          'to where nome_menu = '#39'ConfiguracaoAPIs'#39' and cod_empresa = :COD_E' +
          'MPRESA and (select count(*) from menus_auto where nome_menu = '#39'C' +
          'onfiguracaoApiECommerce'#39' and cod_empresa = :COD_EMPRESA) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiECommerce'#39' as nome_menu, status_menu, ena' +
          'ble_menu, desc_menu, ativo from menus_auto_sistema where nome_me' +
          'nu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from menus_auto_sis' +
          'tema where nome_menu = '#39'ConfiguracaoApiECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ProdutosComercioAberto'#39' as nome_menu from menus_auto' +
          ' where nome_menu = '#39'CadastroDeProdutos'#39' and cod_empresa = :COD_E' +
          'MPRESA and (select count(*) from menus_auto where nome_menu = '#39'P' +
          'rodutosComercioAberto'#39' and cod_empresa = :COD_EMPRESA) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ProdutosComercioAberto'#39' as nome_menu, status_menu, enabl' +
          'e_menu, desc_menu, ativo from menus_auto_sistema where nome_menu' +
          ' = '#39'CadastroDeProdutos'#39' and (select count(*) from menus_auto_sis' +
          'tema where nome_menu = '#39'ProdutosComercioAberto'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'TiposdeServicosComercioAberto'#39' as nome_menu from men' +
          'us_auto where nome_menu = '#39'TiposDeServicos'#39' and cod_empresa = :C' +
          'OD_EMPRESA and (select count(*) from menus_auto where nome_menu ' +
          '= '#39'TiposdeServicosComercioAberto'#39' and cod_empresa = :COD_EMPRESA' +
          ') = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'TiposdeServicosComercioAberto'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'TiposDeServicos'#39' and (select count(*) from menus_auto' +
          '_sistema where nome_menu = '#39'TiposdeServicosComercioAberto'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ConfiguracaoApiComercioAberto'#39' as nome_menu from men' +
          'us_auto where nome_menu = '#39'ConfiguracaoAPIs'#39' and cod_empresa = :' +
          'COD_EMPRESA and (select count(*) from menus_auto where nome_menu' +
          ' = '#39'ConfiguracaoApiComercioAberto'#39' and cod_empresa = :COD_EMPRES' +
          'A) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiComercioAberto'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from menus_aut' +
          'o_sistema where nome_menu = '#39'ConfiguracaoApiComercioAberto'#39') = 0' +
          ';'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ConfiguracaoApiProgramadefidelidade'#39' as nome_menu fr' +
          'om menus_auto where nome_menu = '#39'ConfiguracaoAPIs'#39' and cod_empre' +
          'sa = :COD_EMPRESA and (select count(*) from menus_auto where nom' +
          'e_menu = '#39'ConfiguracaoApiProgramadefidelidade'#39' and cod_empresa =' +
          ' :COD_EMPRESA) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ConfiguracaoApiProgramadefidelidade'#39' as nome_menu, statu' +
          's_menu, enable_menu, desc_menu, ativo from menus_auto_sistema wh' +
          'ere nome_menu = '#39'ConfiguracaoAPIs'#39' and (select count(*) from men' +
          'us_auto_sistema where nome_menu = '#39'CategoriaECommerce'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'ControlesProgramadefidelidade'#39' as nome_menu from men' +
          'us_auto where nome_menu = '#39'Controles'#39' and cod_empresa = :COD_EMP' +
          'RESA and (select count(*) from menus_auto where nome_menu = '#39'Con' +
          'trolesProgramadefidelidade'#39' and cod_empresa = :COD_EMPRESA) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'ControlesProgramadefidelidade'#39' as nome_menu, status_menu' +
          ', enable_menu, desc_menu, ativo from menus_auto_sistema where no' +
          'me_menu = '#39'Controles'#39' and (select count(*) from menus_auto_siste' +
          'ma where nome_menu = '#39'ControlesProgramadefidelidade'#39') = 0;'
        
          'CMD:REPL|insert into menus_auto (cod_menu, depart_menu, cod_empr' +
          'esa, status_menu, desc_menu, ativo, enable_menu, nome_menu) sele' +
          'ct (select cod from incrementa_codigo (:COD_EMPRESA, '#39'MENUS_AUTO' +
          #39')), depart_menu, cod_empresa, status_menu, desc_menu, ativo, en' +
          'able_menu, '#39'TiposVendasProgramadefidelidade'#39' as nome_menu from m' +
          'enus_auto where nome_menu = '#39'TiposVendas1'#39' and cod_empresa = :CO' +
          'D_EMPRESA and (select count(*) from menus_auto where nome_menu =' +
          ' '#39'TiposVendasProgramadefidelidade'#39' and cod_empresa = :COD_EMPRES' +
          'A) = 0;'
        
          'CMD:REPL|insert into menus_auto_sistema (cod_aplicativo, nome_me' +
          'nu, status_menu, enable_menu, desc_menu, ativo) select cod_aplic' +
          'ativo, '#39'TiposVendasProgramadefidelidade'#39' as nome_menu, status_me' +
          'nu, enable_menu, desc_menu, ativo from menus_auto_sistema where ' +
          'nome_menu = '#39'TiposVendas1'#39' and (select count(*) from menus_auto_' +
          'sistema where nome_menu = '#39'TiposVendasProgramadefidelidade'#39') = 0' +
          ';'
        
          'CMD:REPL|update menus_auto set nome_menu = '#39'ConfiguracoesSimulac' +
          'aoProgramaFidelidade'#39' where nome_menu = '#39'ConfiguracoesSimulacaoP' +
          'rogramaFidelidade1'#39' and cod_empresa = :COD_EMPRESA;'
        
          'CMD:REPL|update menus_auto_sistema set nome_menu = '#39'Configuracoe' +
          'sSimulacaoProgramaFidelidade'#39' where nome_menu = '#39'ConfiguracoesSi' +
          'mulacaoProgramaFidelidade1'#39';'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW KITS_PROD_TOT('
        '    CODIGO_KIT,'
        '    COD_EMPRESA,'
        '    REGRA_PESO_DIM,'
        '    QUANT_PROD_KIT,'
        '    PREC_CUS_PROD,'
        '    PREC_CUSM_PROD,'
        '    PREC_TAB_PROD,'
        '    PREC_PUBLICO,'
        '    PREC_30_PROD,'
        '    PREC_60_PROD,'
        '    PREC_90_PROD,'
        '    PESO_BRUT_PROD,'
        '    COMPRIMENTO_PROD,'
        '    LARGURA_PROD,'
        '    ALTURA_PROD,'
        '    EST_F)'
        'AS'
        'SELECT KITS_PROD_KITS.CODIGO_KIT,'
        'KITS_PROD_KITS.COD_EMPRESA,'
        'COALESCE(KITS_PROD_EC.REGRA_PESO_DIM, '#39#39') REGRA_PESO_DIM,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0)), 0) QUA' +
          'NT_PROD_KIT,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_CUS_PROD, 0)), 0) PREC_CUS_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_CUSM_PROD, 0)), 0) PREC_CUSM_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_TAB_PROD, 0)), 0) PREC_TAB_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_PUBLICO, 0)), 0) PREC_PUBLICO,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_30_PROD, 0)), 0) PREC_30_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_60_PROD, 0)), 0) PREC_60_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_90_PROD, 0)), 0) PREC_90_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PESO_BRUT_PROD, 0)), 0) PESO_BRUT_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.COMPRIMENTO_PROD, 0)), 0) COMPRIMENTO_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.LARGURA_PROD, 0)), 0) LARGURA_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.ALTURA_PROD, 0)), 0) ALTURA_PROD,'
        
          'COALESCE(SUM(COALESCE(PRODUTOS.EST_F, 0)), 0) EST_F FROM KITS_PR' +
          'OD_KITS'
        
          'LEFT JOIN PRODUTOS ON PRODUTOS.GRUPO_PROD = KITS_PROD_KITS.GRUPO' +
          '_PROD AND PRODUTOS.COD_PROD = KITS_PROD_KITS.COD_PROD'
        '    AND PRODUTOS.COD_EMPRESA = KITS_PROD_KITS.COD_EMPRESA'
        
          'LEFT JOIN KITS_PROD_EC ON KITS_PROD_EC.CODIGO_KIT = KITS_PROD_KI' +
          'TS.CODIGO_KIT'
        '    AND KITS_PROD_EC.COD_EMPRESA = KITS_PROD_KITS.COD_EMPRESA'
        
          '--WHERE KITS_PROD_KITS.CODIGO_KIT = :CODIGO_KIT AND KITS_PROD_KI' +
          'TS.COD_EMPRESA = 1'
        'GROUP BY 1, 2, 3;'
        '|/BLOCO|'
        ''
        'ALTER TABLE KITS_PROD_EC ADD DESCONTO_VALOR T_N_GERAL;'
        'ALTER TABLE KITS_PROD_EC ADD DESCONTO_PERC T_N_GERAL;'
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
        'declare variable VCOD_TAB_PRECO integer;'
        'begin'
        '  /* Procedure Text */'
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
        
          '      AND current_date >= COALESCE(PROMOCAO_PRODUTO.DATA_INI, PR' +
          'OMOCAO.DATA_INI)'
        
          '      AND current_date <= COALESCE(PROMOCAO_PRODUTO.DATA_FIM, PR' +
          'OMOCAO.DATA_FIM) into :DESC_TABELA, :VALOR_TAB_PRO;'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure RETORNA_EC_VLTB_PROMKIT ('
        '    PCODIGO_KIT integer,'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    VALOR_TAB_PROKIT double precision)'
        'as'
        'declare variable VGRUPO_PROD integer;'
        'declare variable VCOD_PROD char(6);'
        'declare variable VCOD_EMPRESA integer;'
        'declare variable VQUANT_PROD_KIT double precision;'
        'declare variable VVALOR_TEMP double precision;'
        'begin'
        '  VVALOR_TEMP = 0;'
        '  VALOR_TAB_PROKIT = 0;'
        ''
        '  for select kits_prod_kits.grupo_prod,'
        '    kits_prod_kits.cod_prod,'
        '    kits_prod_kits.cod_empresa,'
        '    kits_prod_kits.quant_prod_kit from kits_prod'
        
          '  inner join kits_prod_kits on kits_prod_kits.codigo_kit = kits_' +
          'prod.codigo_kit and kits_prod_kits.cod_empresa = kits_prod.cod_e' +
          'mpresa'
        '  where kits_prod_kits.codigo_kit = :pcodigo_kit'
        '  and kits_prod_kits.cod_empresa = :pcod_empresa'
        
          '    into :vgrupo_prod, :vcod_prod, :vcod_empresa, :vquant_prod_k' +
          'it do'
        '  begin'
        
          '    select valor_tab_pro FROM retorna_ec_vltb_prom(:vgrupo_prod,' +
          ' :vcod_prod, :vcod_empresa) into :vvalor_temp;'
        ''
        
          '    VALOR_TAB_PROKIT = VALOR_TAB_PROKIT + (COALESCE(VQUANT_PROD_' +
          'KIT, 0) * round(coalesce(VVALOR_TEMP, 0), 2));'
        '  end'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE KITS_PROD_KITS ADD RATEIO_DESC T_VL_TODOS DEFAULT 0;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW KITS_PROD_TOT('
        '    CODIGO_KIT,'
        '    COD_EMPRESA,'
        '    REGRA_PESO_DIM,'
        '    QUANT_PROD_KIT,'
        '    PREC_CUS_PROD,'
        '    PREC_CUSM_PROD,'
        '    PREC_TAB_PROD,'
        '    PREC_PUBLICO,'
        '    PREC_30_PROD,'
        '    PREC_60_PROD,'
        '    PREC_90_PROD,'
        '    PESO_BRUT_PROD,'
        '    COMPRIMENTO_PROD,'
        '    LARGURA_PROD,'
        '    ALTURA_PROD,'
        '    EST_F,'
        '    VALOR_TAB_PROKIT,'
        '    DESCONTO_VALOR,'
        '    DESCONTO_PERC,'
        '    VALOR_DESC_TAB_PROKIT)'
        'AS'
        'SELECT KITS_PROD_KITS.CODIGO_KIT,'
        'KITS_PROD_KITS.COD_EMPRESA,'
        'COALESCE(KITS_PROD_EC.REGRA_PESO_DIM, '#39#39') REGRA_PESO_DIM,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0)), 0) QUA' +
          'NT_PROD_KIT,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_CUS_PROD, 0)), 0) PREC_CUS_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_CUSM_PROD, 0)), 0) PREC_CUSM_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_TAB_PROD, 0)), 0) PREC_TAB_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_PUBLICO, 0)), 0) PREC_PUBLICO,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_30_PROD, 0)), 0) PREC_30_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_60_PROD, 0)), 0) PREC_60_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PREC_90_PROD, 0)), 0) PREC_90_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.PESO_BRUT_PROD, 0)), 0) PESO_BRUT_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.COMPRIMENTO_PROD, 0)), 0) COMPRIMENTO_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.LARGURA_PROD, 0)), 0) LARGURA_PROD,'
        
          'COALESCE(SUM(COALESCE(KITS_PROD_KITS.QUANT_PROD_KIT, 0) * COALES' +
          'CE(PRODUTOS.ALTURA_PROD, 0)), 0) ALTURA_PROD,'
        'COALESCE(SUM(COALESCE(PRODUTOS.EST_F, 0)), 0) EST_F,'
        
          '(SELECT VALOR_TAB_PROKIT FROM RETORNA_EC_VLTB_PROMKIT(KITS_PROD_' +
          'KITS.CODIGO_KIT, KITS_PROD_KITS.COD_EMPRESA)) TAB_PRECO_ECOMMERC' +
          'E,'
        'MAX(COALESCE(KITS_PROD_EC.DESCONTO_VALOR, 0)) DESCONTO_VALOR,'
        'MAX(COALESCE(KITS_PROD_EC.DESCONTO_PERC, 0)) DESCONTO_PERC,'
        
          '((SELECT VALOR_TAB_PROKIT FROM RETORNA_EC_VLTB_PROMKIT(KITS_PROD' +
          '_KITS.CODIGO_KIT, KITS_PROD_KITS.COD_EMPRESA)) - SUM(COALESCE(KI' +
          'TS_PROD_KITS.RATEIO_DESC, 0)))  TAB_PRECO_DESC_ECOMMERCE'
        ''
        ' FROM KITS_PROD_KITS'
        
          'LEFT JOIN PRODUTOS ON PRODUTOS.GRUPO_PROD = KITS_PROD_KITS.GRUPO' +
          '_PROD AND PRODUTOS.COD_PROD = KITS_PROD_KITS.COD_PROD'
        '    AND PRODUTOS.COD_EMPRESA = KITS_PROD_KITS.COD_EMPRESA'
        
          'LEFT JOIN KITS_PROD_EC ON KITS_PROD_EC.CODIGO_KIT = KITS_PROD_KI' +
          'TS.CODIGO_KIT'
        '    AND KITS_PROD_EC.COD_EMPRESA = KITS_PROD_KITS.COD_EMPRESA'
        
          '--WHERE KITS_PROD_KITS.CODIGO_KIT = :CODIGO_KIT AND KITS_PROD_KI' +
          'TS.COD_EMPRESA = 1'
        'GROUP BY 1, 2, 3;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO426'#39', :COD_EMPRESA, '#39'PE' +
          'RMITIR DESCONTO MAIOR PERMITIDO KIT - ECOMMERCE'#39', 11, '#39'FRMCADKIT' +
          #39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER PRODUTOS_FORN_NFE_BI_SEQID FOR PRODUTOS_' +
          'FORN_NFE'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  new.SEQID = next value for GEN_PRODUTOS_FORN_NFE;'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (new.DATA_CADASTRO is null) then'
        '    new.DATA_CADASTRO = current_date;'
        '  if (new.DATA_MODIFICACAO is null) then'
        '    new.DATA_MODIFICACAO = current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_DTEC_KITS_PROD_KITS_EC FOR KITS_PROD_' +
          'KITS'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '    DECLARE VARIABLE VSEQID BIGINT;'
        '    DECLARE VARIABLE VDELETE INTEGER;'
        '    DECLARE VARIABLE VCODEMPF INTEGER;'
        '    DECLARE VARIABLE VIDCOMMERCE_KIT INTEGER;'
        'begin'
        '    /* Trigger text */'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        '    VDELETE = 0;'
        
          '    select coalesce(cod_emp_commerce, 0) cod_empresa_fisica from' +
          ' empdesvolv where cod_empdes = 1 into :vcodempf;'
        ''
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
        
          '        SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO :VSE' +
          'QID; '
        
          '        INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_HORA' +
          '_ALT_WS, ID_COMMERCE)  '
        
          '        VALUES(:VSEQID, :VCODEMPF, '#39'KITS_PROD_EC'#39', CURRENT_TIMES' +
          'TAMP, :VIDCOMMERCE_KIT);'
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
        
          '            SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE INTO ' +
          ':VSEQID; '
        
          '            INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, DATA_' +
          'HORA_ALT_WS, ID_COMMERCE)  '
        
          '            VALUES(:VSEQID, :VCODEMPF, '#39'KITS_PROD_EC'#39', CURRENT_T' +
          'IMESTAMP, :VIDCOMMERCE_KIT);'
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
        
          '                SELECT GEN_ID(SEQ_DEL_EC, 1) FROM RDB$DATABASE I' +
          'NTO :VSEQID; '
        
          '                INSERT INTO DEL_EC(SEQID, COD_EMPRESA, TABELA, D' +
          'ATA_HORA_ALT_WS, ID_COMMERCE)  '
        
          '                VALUES(:VSEQID, :VCODEMPF, '#39'KITS_PROD_EC'#39', CURRE' +
          'NT_TIMESTAMP, :VIDCOMMERCE_KIT);'
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
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FPG050'#39', :COD_EMPRESA, '#39'PE' +
          'RM RECEBER VENDA CANCELADA NO E-COMMERCE'#39', 11, '#39'S'#39', '#39#39', 1, '#39'N'#39', ' +
          'CURRENT_DATE);'
        
          'CREATE INDEX IDX_PRODUTOS_ALTERACOES_VALANT ON PRODUTOS_ALTERACO' +
          'ES (VALOR_ANTERIOR, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'create or alter procedure VINC_HIST_PROD ('
        '  codempresa integer)'
        'returns ( RESULT varchar(10))'
        'as'
        '  declare variable gr integer;'
        '  declare variable cd char(6);'
        '  declare variable id integer;'
        'begin'
        ''
        '  /* obtendo dados diretamenta da nota ou da venda*/'
        '  for'
        ''
        '  select s.seqid, nfi.grupo_prod, nfi.cod_prod grupo_cod from ('
        '    select he.* from hist_estoque_diario he'
        
          '      left join produtos pr on he.grupo_prod = pr.grupo_prod and' +
          ' he.cod_prod = pr.cod_prod and he.cod_empresa = pr.cod_empresa'
        
          '      where pr.grupo_prod is null and he.cod_empresa = :codempre' +
          'sa'
        '    ) as s -- s: sem vinculo'
        
          '    left join notafiscal nf on nf.num_nf = s.numero and trim(s.t' +
          'ipor) = '#39'NF'#39' and nf.cod_empresa = s.cod_empresa'
        
          '      and nf.cod_cliente = s.cod_cliente and nf.natureza_nf = '#39'E' +
          #39
        
          '    left join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and ' +
          'nfi.cod_empresa = nf.cod_empresa and nfi.nitem = s.nitem'
        
          '    left join produtos_alteracoes pa on pa.descr_prod_anterior =' +
          ' nfi.descricao_item'
        '    where trim(s.tipor) = '#39'NF'#39
        '  '
        '    union all'
        '    '
        '    select s.seqid, pvp.grupo_prod, pvp.cod_prod from ('
        '      select he.* from hist_estoque_diario he'
        
          '      left join produtos pr on he.grupo_prod = pr.grupo_prod and' +
          ' he.cod_prod = pr.cod_prod and he.cod_empresa = pr.cod_empresa'
        
          '      where pr.grupo_prod is null and he.cod_empresa = :codempre' +
          'sa'
        '    ) as s -- s: sem vinculo'
        
          '    left join pedvenda pv on pv.nped = s.numero and pv.tipo = tr' +
          'im(s.tipor) and pv.cod_empresa = s.cod_empresa'
        
          '    left join pedvenda_prod pvp on pvp.nped = pv.nped and pvp.ti' +
          'po = pv.tipo and pvp.cod_empresa = pv.cod_empresa'
        
          '      and pvp.nitem = s.nitem and pvp.quant_ped_item = s.qtde an' +
          'd pvp.vlun_ped_item = s.valor_unit'
        
          '    inner join produtos_alteracoes pa on pa.descr_prod_anterior ' +
          '= pvp.descr_prod_ped'
        
          '      and pa.grupo_prod = pvp.grupo_prod and pa.cod_prod = pvp.c' +
          'od_prod and pa.cod_empresa = pvp.cod_empresa'
        '    where trim(s.tipor) in ('#39'REQ'#39', '#39'OS'#39')'
        ''
        '  into :id, :gr, :cd'
        '  do'
        '  begin'
        ''
        '    if (trim(coalesce(cd, '#39#39')) <> '#39#39') then'
        '    begin'
        ''
        '      update hist_estoque_diario h set'
        
          '        h.grupo_prod_old = h.grupo_prod, h.cod_prod_old = h.cod_' +
          'prod,'
        '        h.grupo_prod = :gr, h.cod_prod = :cd'
        
          '        where h.tipo = '#39'P'#39' and h.seqid = :id and h.cod_empresa =' +
          ' :codempresa;'
        ''
        '      --newprod = gr||'#39'-'#39'||cd;'
        ''
        '      --suspend;'
        '    end'
        ''
        '  end'
        ''
        
          '  /* Atualizando outros registros que nao tenham referencia como' +
          ' acima, mas que apoos o update foi gravado o os campos old*/'
        '  for'
        '    select distinct s.seqid, h.grupo_prod, h.cod_prod from ('
        '      select he.* from hist_estoque_diario he'
        
          '      left join produtos pr on he.grupo_prod = pr.grupo_prod and' +
          ' he.cod_prod = pr.cod_prod and he.cod_empresa = pr.cod_empresa'
        
          '      where pr.grupo_prod is null and he.cod_empresa = :codempre' +
          'sa'
        '      ) as s -- s: sem vinculo'
        
          '    inner join hist_estoque_diario h on h.grupo_prod_old = s.gru' +
          'po_prod and h.cod_prod_old = s.cod_prod'
        '             '
        '  into :id, :gr, :cd'
        '  do'
        '  begin'
        '    update hist_estoque_diario h set'
        
          '      h.grupo_prod_old = h.grupo_prod, h.cod_prod_old = h.cod_pr' +
          'od,'
        '      h.grupo_prod = :gr, h.cod_prod = :cd'
        
          '      where h.tipo = '#39'P'#39' and h.seqid = :id and h.cod_empresa = :' +
          'codempresa;'
        ''
        '    --newprod = gr||'#39'-'#39'||cd;'
        ''
        '    --suspend;'
        '  end'
        ''
        
          '  /* obtendo dados da tabela de alteracao de codigo e descricao ' +
          'dos produtos */'
        '  for'
        '    select distinct s.seqid, pa.grupo_prod, pa.cod_prod from ('
        '      select he.* from hist_estoque_diario he'
        
          '      left join produtos pr on he.grupo_prod = pr.grupo_prod and' +
          ' he.cod_prod = pr.cod_prod and he.cod_empresa = pr.cod_empresa'
        
          '      where pr.grupo_prod is null and he.cod_empresa = :codempre' +
          'sa'
        '      ) as s -- s: sem vinculo'
        
          '      inner join produtos_alteracoes pa on pa.valor_anterior = s' +
          '.grupo_prod||'#39'|'#39'||trim(s.cod_prod)||'#39'|'#39
        
          '        and pa.grupo_prod||'#39'|'#39'||trim(pa.cod_prod)||'#39'|'#39' <> pa.val' +
          'or_anterior'
        
          '        and pa.cod_empresa = s.cod_empresa and s.data >= pa.data' +
          '_ini and s.data <= pa.data_alteracao      '
        ''
        '  into :id, :gr, :cd'
        '  do'
        '  begin'
        '    update hist_estoque_diario h set'
        
          '      h.grupo_prod_old = h.grupo_prod, h.cod_prod_old = h.cod_pr' +
          'od,'
        '      h.grupo_prod = :gr, h.cod_prod = :cd'
        
          '      where h.tipo = '#39'P'#39' and h.seqid = :id and h.cod_empresa = :' +
          'codempresa;'
        ''
        '    --newprod = gr||'#39'-'#39'||cd;'
        ''
        '    --suspend;'
        '  end'
        ''
        
          '  /* Atualizando outros registros que nao tenham referencia como' +
          ' acima, mas que apoos o update foi gravado o os campos old*/'
        '  for'
        '    select distinct s.seqid, h.grupo_prod, h.cod_prod from ('
        '      select he.* from hist_estoque_diario he'
        
          '      left join produtos pr on he.grupo_prod = pr.grupo_prod and' +
          ' he.cod_prod = pr.cod_prod and he.cod_empresa = pr.cod_empresa'
        
          '      where pr.grupo_prod is null and he.cod_empresa = :codempre' +
          'sa'
        '      ) as s -- s: sem vinculo'
        
          '    inner join hist_estoque_diario h on h.grupo_prod_old = s.gru' +
          'po_prod and h.cod_prod_old = s.cod_prod'
        '             '
        '  into :id, :gr, :cd'
        '  do'
        '  begin'
        '    update hist_estoque_diario h set'
        
          '      h.grupo_prod_old = h.grupo_prod, h.cod_prod_old = h.cod_pr' +
          'od,'
        '      h.grupo_prod = :gr, h.cod_prod = :cd'
        
          '      where h.tipo = '#39'P'#39' and h.seqid = :id and h.cod_empresa = :' +
          'codempresa;'
        ''
        '    --newprod = gr||'#39'-'#39'||cd;'
        ''
        '    --suspend;'
        '  end'
        ''
        '  /* o que restou que os updates acima nao conseguiram fazer */'
        '  for'
        '    select distinct s.seqid, hd.grupo_at, hd.cod_at from ('
        '      select he.* from hist_estoque_diario he'
        
          '      left join produtos pr on he.grupo_prod = pr.grupo_prod and' +
          ' he.cod_prod = pr.cod_prod and he.cod_empresa = pr.cod_empresa'
        
          '      where pr.grupo_prod is null and he.cod_empresa = :codempre' +
          'sa'
        '      ) as s -- s: sem vinculo'
        
          '      inner join sp_hist_prod_datas(s.grupo_prod, s.cod_prod, s.' +
          'cod_empresa) hd on s.data >= hd.data_ini and s.data <= hd.data_f' +
          'im'
        '                '
        '  into :id, :gr, :cd'
        '  do'
        '  begin'
        '    update hist_estoque_diario h set'
        
          '      h.grupo_prod_old = h.grupo_prod, h.cod_prod_old = h.cod_pr' +
          'od,'
        '      h.grupo_prod = :gr, h.cod_prod = :cd'
        
          '      where h.tipo = '#39'P'#39' and h.seqid = :id and h.cod_empresa = :' +
          'codempresa;'
        ''
        '    --newprod = gr||'#39'-'#39'||cd;'
        ''
        '    --suspend;'
        '  end'
        ''
        '  result = '#39'OK'#39';'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_PRODUTOS_CHAVE_NF ON PRODUTOS (CHAVE_NFE, CPROD' +
          '_XML, COD_EMPRESA);'
        
          'CREATE INDEX IDX_PRODUTOS_CPROD ON PRODUTOS (CPROD_XML, COD_EMPR' +
          'ESA);'
        'ALTER TABLE NOTAFISCAL ADD TOTAIS_COM_DESON CHAR(1);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW SPED_PRESUMIDO('
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
        
          '(coalesce(nfi.valor_total,0) -  coalesce(nfi.rateio_desconto,0) ' +
          '+ coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0)' +
          ' + case when nf.frete_f_nfe = '#39'S'#39' then 0 else coalesce(nfi.ratei' +
          'o_frete,0) end + coalesce(case when (nfi.valor_icmsub_ant > 0) t' +
          'hen 0 else nfi.valor_icmsub end,0) + coalesce(nfi.valor_ipi,0) +' +
          ' coalesce(nfi.nfe_vipidevol,0) + coalesce(nfi.fcp_vfcpst,0) - ii' +
          'f(coalesce(nf.totais_com_deson, '#39'S'#39') <> '#39'N'#39', coalesce(nfi.vicmde' +
          'son, 0), 0)),'
        'coalesce(nfi.rateio_desconto,0),'
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
        'where nfc.status = '#39'Fechada'#39
        ';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_DTEC_KITS_PROD_KITS_EC FOR KITS_PROD_' +
          'KITS'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '    DECLARE VARIABLE VSEQID BIGINT;'
        '    DECLARE VARIABLE VDELETE INTEGER;'
        '    DECLARE VARIABLE VCODEMPF INTEGER;'
        '    DECLARE VARIABLE VIDCOMMERCE_KIT INTEGER;'
        'begin'
        '    /* Trigger text */'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        '    VDELETE = 0;'
        
          '    select coalesce(cod_emp_commerce, 0) cod_empresa_fisica from' +
          ' empdesvolv where cod_empdes = 1 into :vcodempf;'
        ''
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
        
          '            VALUES(:VSEQID, :VCODEMPF, '#39'KITS_PROD_EC'#39', CURRENT_T' +
          'IMESTAMP, :VIDCOMMERCE_KIT);'
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
        
          '                VALUES(:VSEQID, :VCODEMPF, '#39'KITS_PROD_EC'#39', CURRE' +
          'NT_TIMESTAMP, :VIDCOMMERCE_KIT);'
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
        
          '                    VALUES(:VSEQID, :VCODEMPF, '#39'KITS_PROD_EC'#39', C' +
          'URRENT_TIMESTAMP, :VIDCOMMERCE_KIT);'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW MOVIMENTOSPRODSERV('
        '    TIPOPS,'
        '    TIPO,'
        '    STATUS_PED,'
        '    VALOR_TOTAL,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    DATA_PED,'
        '    DATA_FECH,'
        '    NPED,'
        '    NITEM,'
        '    COD_PROD,'
        '    GRUPOOUSEDRV,'
        '    COD_EMPRESA,'
        '    NUM_FAB_PROD,'
        '    COD_GRADE,'
        '    DESCRICAO_GRADE,'
        '    QTDE,'
        '    VL_UNIT,'
        '    VL_TOT,'
        '    DESCR,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    ACRESC_ITEM,'
        '    DESC_ITEM,'
        '    DAV_ORIGEM,'
        '    NPED_ORIGEM,'
        '    TIPO_ORIGEM,'
        '    STATUS_ITEM)'
        'AS'
        
          '  select '#39'P'#39' tipops ,p.tipo,p.status_ped,p.valor_total,c.cod_cli' +
          'ente,c.nome_cliente,p.data_ped,p.data_fech,'
        
          '  pp.nped,pp.nitem,pp.cod_prod, pp.grupo_prod grupoOuServ,pp.cod' +
          '_empresa, pp.num_fab_prod,'
        '  pp.cod_grade, g.descricao,'
        
          '  pp.quant_ped_item qtde, pp.vlun_ped_item vl_unit, pp.vltot_ped' +
          '_item vl_tot,pp.descr_prod_ped descr,'
        '  pp.rateio_desc,pp.rateio_acresc,pp.acresc_item, pp.desc_item,'
        '  pp.dav_origem,pp.nped_origem,pp.tipo_origem,pp.status'
        '  from pedvenda_prod pp'
        
          '  inner join pedvenda p on p.nped = pp.nped and p.cod_empresa = ' +
          'pp.cod_empresa and pp.tipo = p.tipo'
        
          '  inner join clientes c on c.cod_cliente = p.cod_cliente and c.c' +
          'od_empresa = p.cod_empresa'
        
          '  left join grade g on pp.cod_grade = g.cod_grade and pp.cod_emp' +
          'resa = g.cod_empresa'
        '  where p.ativo = 1'
        '  union'
        
          '  select '#39'S'#39' tipops,p.tipo,p.status_ped,p.valor_total,c.cod_clie' +
          'nte,c.nome_cliente,p.data_ped,p.data_fech,'
        
          '  ps.nped,ps.nitem,ps.cod_servico cod_prod,ps.cod_servico grupoO' +
          'uServ,ps.cod_empresa,ps.cod_servico num_fab_prod,'
        '  null cod_grade, '#39#39' descricao,'
        
          '  ps.quant_serv_ped qtde,ps.valor_un_serv vl_unit, ps.valor_tot_' +
          'serv vl_tot,'
        '  ps.desc_serv_ped descr,'
        '  ps.rateio_desc,ps.rateio_acresc,ps.acresc_item, ps.desc_item,'
        '  ps.dav_origem,ps.nped_origem,ps.tipo_origem,ps.status'
        '  from pedvenda_serv ps'
        
          '  inner join pedvenda p on p.nped = ps.nped and p.cod_empresa = ' +
          'ps.cod_empresa and ps.tipo = p.tipo'
        
          '  inner join clientes c on c.cod_cliente = p.cod_cliente and c.c' +
          'od_empresa = p.cod_empresa'
        '  where p.ativo = 1;'
        '|/BLOCO|'
        ''
        'ALTER TABLE NOTAFISCAL ADD IMPORT_XML VARCHAR(16);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD UCOM VARCHAR(6);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD QCOM T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD NITEM_XML INTEGER;'
        ''
        '|BLOCO|'
        'CREATE GLOBAL TEMPORARY TABLE EFD_ICMSST_CR_CFOPS ('
        '    CFOP  T_VL_TODOS'
        ') ON COMMIT DELETE ROWS;'
        '|/BLOCO|'
        ''
        
          'CREATE UNIQUE DESCENDING INDEX IDX_EFD_ICMSST_CR_CFOPS ON EFD_IC' +
          'MSST_CR_CFOPS (CFOP);'
        ''
        '|BLOCO|'
        'CREATE TABLE EFD_ICMSST_CR_EST ('
        '    ANO            SMALLINT NOT NULL,'
        '    MES            SMALLINT NOT NULL,'
        '    GRUPO_PROD     INTEGER NOT NULL,'
        '    COD_PROD       CHAR(6) NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    DATA           TIMESTAMP NOT NULL,'
        '    QTDE           T_VL_TODOS,'
        '    VL_ICMS_OP     T_VL_TODOS,'
        '    VL_BC_ICMS_ST  T_VL_TODOS,'
        '    VL_ICMS_ST     T_VL_TODOS,'
        '    VL_FCP         T_VL_TODOS'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE EFD_ICMSST_CR_EST ADD CONSTRAINT FK_EFD_ICMSST_CR_ES' +
          'T_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCE' +
          'S PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON UPDATE CASCADE' +
          ';'
        
          'CREATE UNIQUE DESCENDING INDEX IDX_EFD_ICMSST_CR_EST ON EFD_ICMS' +
          'ST_CR_EST (ANO, MES, GRUPO_PROD, COD_PROD, COD_EMPRESA, DATA);'
        
          'CREATE DESCENDING INDEX IDX_EFD_ICMSST_CR_EST_DT ON EFD_ICMSST_C' +
          'R_EST (ANO, MES, DATA, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE EFD_ICMSST_CR_E_S ('
        '    TPDOC             VARCHAR(3) NOT NULL,'
        '    E_S               CHAR(1) NOT NULL,'
        '    COD_DOC           INTEGER NOT NULL,'
        '    NUM_NF            INTEGER NOT NULL,'
        '    DATA              TIMESTAMP NOT NULL,'
        '    CHAVE             VARCHAR(44),'
        '    CONSUMIDOR_FINAL  CHAR(1),'
        '    IDDEST            CHAR(1),'
        '    INDIEDEST         SMALLINT,'
        '    NITEM             INTEGER NOT NULL,'
        '    GRUPO_PROD        INTEGER,'
        '    COD_PROD          CHAR(6),'
        '    COD_EMPRESA       INTEGER,'
        '    ORIG              VARCHAR(3),'
        '    CST               VARCHAR(3),'
        '    CSOSN             VARCHAR(3),'
        '    ANT_ST            CHAR(1),'
        '    CODIGO_NOP        T_VL_TODOS,'
        '    QUANTIDADE        T_VL_TODOS,'
        '    UNIDADE           VARCHAR(6),'
        '    TOTAL_LIQ         T_VL_TODOS,'
        '    TOTAL_BCICM       T_VL_TODOS,'
        '    TOTAL_ICM         T_VL_TODOS,'
        '    TOTAL_BCST        T_VL_TODOS,'
        '    TOTAL_ST          T_VL_TODOS,'
        '    TOTAL_FCPST       T_VL_TODOS,'
        '    TOTAL_FCPSTRET    T_VL_TODOS,'
        '    NF_QCOM           T_VL_TODOS,'
        '    NF_UCOM           VARCHAR(6),'
        '    NF_BCICM          T_VL_TODOS,'
        '    NF_ICM            T_VL_TODOS,'
        '    NF_BCST           T_VL_TODOS,'
        '    NF_ST             T_VL_TODOS,'
        '    NF_FCPST          T_VL_TODOS,'
        '    NF_FCPSTRET       T_VL_TODOS,'
        '    NF_BCSTRET        T_VL_TODOS,'
        '    NF_STRET          T_VL_TODOS,'
        '    EST_BCST          T_VL_TODOS,'
        '    EST_ICM           T_VL_TODOS,'
        '    EST_ST            T_VL_TODOS,'
        '    EST_FCPST         T_VL_TODOS'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE EFD_ICMSST_CR_E_S ADD CONSTRAINT FK_EFD_ICMSST_CR_E_' +
          'S_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCE' +
          'S PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON UPDATE CASCADE' +
          ';'
        
          'CREATE UNIQUE DESCENDING INDEX IDX_EFD_ICMSST_CR_E_S ON EFD_ICMS' +
          'ST_CR_E_S (TPDOC, E_S, COD_DOC, NUM_NF, DATA, NITEM, GRUPO_PROD,' +
          ' COD_PROD, COD_EMPRESA);'
        
          'CREATE DESCENDING INDEX IDX_EFD_ICMSST_CR_E_S_DT ON EFD_ICMSST_C' +
          'R_E_S (DATA, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE EFD_ICMSST_CR_APURACAO ('
        '    ID              INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    ANO             INTEGER NOT NULL,'
        '    MES             INTEGER NOT NULL,'
        '    TIPO            SMALLINT NOT NULL,'
        '    ICMSOP          T_VL_TODOS,'
        '    ICMSST          T_VL_TODOS,'
        '    FCPST           T_VL_TODOS,'
        '    DATA_CADASTRO   TIMESTAMP,'
        '    DATA_ALTERACAO  TIMESTAMP'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE EFD_ICMSST_CR_APURACAO ADD CONSTRAINT PK_EFD_ICMSST_' +
          'CR_APURACAO PRIMARY KEY (ID, COD_EMPRESA);'
        
          'CREATE UNIQUE DESCENDING INDEX IDX_EFD_ICMSST_CR_APURACAO ON EFD' +
          '_ICMSST_CR_APURACAO (ANO, MES, TIPO, COD_EMPRESA);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER EFD_ICMSST_CR_APURACAO_AUT FOR EFD_ICMSS' +
          'T_CR_APURACAO'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'BEGIN'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if (inserting) then'
        '  begin'
        '    new.DATA_CADASTRO = current_timestamp;'
        '    new.DATA_ALTERACAO = new.DATA_CADASTRO;'
        '    if (coalesce(new.ID, 0) = 0) then'
        
          '      select cod from incrementa_codigo(new.cod_empresa, '#39'EFD_IC' +
          'MSST_CR_APURACAO'#39') into new.ID;'
        '  end'
        '  else'
        '    new.DATA_ALTERACAO = current_timestamp;'
        'END;'
        '|/BLOCO|'
        ''
        'ALTER TABLE NOTAFISCAL ADD EFDRESTCOMPLICMS_ID INTEGER;'
        
          'ALTER TABLE NOTAFISCAL ADD CONSTRAINT FK_NOTAFISCAL_RESTCOMPLICM' +
          'S FOREIGN KEY (EFDRESTCOMPLICMS_ID, COD_EMPRESA) REFERENCES EFD_' +
          'ICMSST_CR_APURACAO (ID, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'EFD017'#39', :COD_EMPRESA, '#39'SALVAR EFD REST-COMPL ICMS ST' +
          #39' , 6, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'EFD018'#39', :COD_EMPRESA, '#39'SOBREESCREVER EFD REST-COMPL ' +
          'ICMS ST'#39' , 10, '#39'S'#39', '#39'S'#39');'
        ''
        '|BLOCO|'
        'create or alter view VW_TIPO88_ITNF('
        '    TPDOC,'
        '    E_S,'
        '    E_P,'
        '    CONSUMIDOR_FINAL,'
        '    ID_DEST,'
        '    ID_IEDEST,'
        '    CPFCGC,'
        '    MODELO_NF,'
        '    SERIE,'
        '    NUM_NF,'
        '    CODIGO_NOP,'
        '    ORIG,'
        '    CST,'
        '    CSOSN,'
        '    NITEM,'
        '    DATA_LANC,'
        '    DATA_EMISS,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    NUM_FAB_PROD,'
        '    UNIDADE,'
        '    QUANTIDADE,'
        '    VALOR_TOTAL,'
        '    DESCONTO,'
        '    VICMDESON,'
        '    BASE_ICM,'
        '    BASE_ICMSUB,'
        '    ALIQ_ICMSUB,'
        '    ALIQ_ICM,'
        '    VALOR_IPI,'
        '    CHAVE_NFE,'
        '    COD_DOC,'
        '    NITEM_DOC,'
        '    SEGURO,'
        '    FRETE,'
        '    OUTROS,'
        '    VALOR_ICMSUB,'
        '    FCP_VFCPST,'
        '    FCP_VFCPSTRET,'
        '    STATUS_NF,'
        '    SITUACAO_NF,'
        '    COD_EMPRESA,'
        '    ANT_ST,'
        '    VALOR_ICM,'
        '    NF_UCOM,'
        '    NF_QCOM,'
        '    NF_ORIG,'
        '    NF_CST,'
        '    NF_CSOSN,'
        '    NF_VBC,'
        '    NF_VICM,'
        '    NF_VBCST,'
        '    NF_VST,'
        '    NF_VBCSTRET,'
        '    NF_VSTRET,'
        '    NF_VFCPST,'
        '    NF_VFCPSTRET)'
        'AS'
        '--NF entradas'
        
          'select '#39'NF'#39' TPDOC, NF.NATUREZA_NF, NF.EMISSAO_PROPRIA, NF.CONSUM' +
          'IDOR_FINAL, NF.NFE_IDDEST, NF.NFE_INDIEDEST, NF.CPFCGC,'
        
          '       NF.MODELO_NF, NF.SERIE, NF.NUM_NF, NFI.CODIGO_NOP, substr' +
          'ing(NFI.CST from 1 for 1) ORIG,'
        
          '       substring(NFI.CST from 2 for 2) CST, NFI.CSOSN, NFI.NITEM' +
          ', NF.DATA_LANC, NF.DATA_CONTABIL, NFI.GRUPO_PROD,'
        
          '       NFI.COD_PROD, NFI.NUM_FAB_PROD, NFI.REFERENCIA, coalesce(' +
          'NFI.QUANTIDADE, 0), coalesce(NFI.VALOR_TOTAL, 0),'
        
          '       coalesce(NFI.RATEIO_DESCONTO, 0), coalesce(NFI.VICMDESON,' +
          ' 0), coalesce(NFI.BASE_ICM, 0),'
        
          '       coalesce(NFI.BASE_ICMSUB, 0), coalesce(NFI.ALIQ_ICMSUB, 0' +
          '), coalesce(NFI.ALIQ_ICM, 0),'
        
          '       coalesce(NFI.VALOR_IPI, 0), NF.CHAVE_NFE, NF.COD_NF, NFI.' +
          'NITEM, coalesce(NFI.RATEIO_SEGURO, 0),'
        '       case'
        '         when NF.FRETE_F_NFE = '#39'S'#39' then 0'
        '         else coalesce(NFI.RATEIO_FRETE, 0)'
        '       end,'
        
          '       coalesce(NFI.RATEIO_OUTDESP, 0), coalesce(NFI.VALOR_ICMSU' +
          'B, 0), coalesce(NFI.FCP_VFCPST, 0),'
        
          '       coalesce(NFI.FCP_VFCPSTRET, 0), NF.STATUS, NF.SITUACAO_NF' +
          'E, NF.COD_EMPRESA, NFI.ANTEC_TRIB,'
        
          '       coalesce(NFI.VALOR_ICM, 0), NFI.UCOM, coalesce(NFI.QCOM, ' +
          '0), NFI.ICM_ORIG, NFI.ICM_CST, NFI.ICM_CSOSN,'
        
          '       coalesce(NFI.ICM_VBC, 0), coalesce(NFI.ICM_VICM, 0), coal' +
          'esce(NFI.ICM_VBCST, 0), coalesce(NFI.ICM_VICMST, 0),'
        
          '       coalesce(NFI.ICM_VBCSTRET, 0), coalesce(NFI.ICM_VICMSSTRE' +
          'T, 0), coalesce(NFI.ICM_VFCPST, 0),'
        '       coalesce(NFI.ICM_VFCPSTRET, 0)'
        'from NOTAFISCAL NF'
        '  inner join NOTAFISCAL_ITEM NFI on NFI.COD_NF = NF.COD_NF and'
        '        NFI.COD_EMPRESA = NF.COD_EMPRESA'
        'where NF.NATUREZA_NF = '#39'E'#39' and'
        '      NF.TIPO_NF = '#39'P'#39' and'
        '      NF.STATUS = '#39'Fechada'#39' and'
        '      coalesce(NF.DA, '#39#39') <> '#39'S'#39' and'
        'case'
        
          '  when ((NF.MODELO_NF = '#39'55'#39') and (NF.EMISSAO_PROPRIA = '#39'S'#39')) th' +
          'en NF.SITUACAO_NFE'
        '  else '#39'Autorizada'#39
        'end = '#39'Autorizada'#39' and'
        'case'
        
          '  when ((substring(NFI.CST from 2 for 2) = '#39'90'#39') and (NFI.BASE_I' +
          'CMSUB > 0)) then '#39'10'#39
        '  else substring(NFI.CST from 2 for 2)'
        'end in ('#39'10'#39', '#39'30'#39', '#39'60'#39', '#39'70'#39', '#39'90'#39')'
        'union'
        '-- NF saidas'
        
          'select '#39'NF'#39' TPDOC, NF.NATUREZA_NF, NF.EMISSAO_PROPRIA, NF.CONSUM' +
          'IDOR_FINAL, NF.NFE_IDDEST, NF.NFE_INDIEDEST, NF.CPFCGC,'
        
          '       NF.MODELO_NF, NF.SERIE, NF.NUM_NF, NFI.CODIGO_NOP, substr' +
          'ing(NFI.CST from 1 for 1) ORIG,'
        
          '       substring(NFI.CST from 2 for 2) CST, NFI.CSOSN, NFI.NITEM' +
          ', NF.DATA_LANC, NF.DATA_CONTABIL, NFI.GRUPO_PROD,'
        
          '       NFI.COD_PROD, NFI.NUM_FAB_PROD, NFI.REFERENCIA, coalesce(' +
          'NFI.QUANTIDADE, 0), coalesce(NFI.VALOR_TOTAL, 0),'
        
          '       coalesce(NFI.RATEIO_DESCONTO, 0), coalesce(NFI.VICMDESON,' +
          ' 0), coalesce(NFI.BASE_ICM, 0),'
        
          '       coalesce(NFI.BASE_ICMSUB, 0), coalesce(NFI.ALIQ_ICMSUB, 0' +
          '), coalesce(NFI.ALIQ_ICM, 0),'
        
          '       coalesce(NFI.VALOR_IPI, 0), NF.CHAVE_NFE, NF.COD_NF, NFI.' +
          'NITEM, coalesce(NFI.RATEIO_SEGURO, 0),'
        '       case'
        '         when NF.FRETE_F_NFE = '#39'S'#39' then 0'
        '         else coalesce(NFI.RATEIO_FRETE, 0)'
        '       end,'
        
          '       coalesce(NFI.RATEIO_OUTDESP, 0), coalesce(NFI.VALOR_ICMSU' +
          'B, 0), coalesce(NFI.FCP_VFCPST, 0),'
        
          '       coalesce(NFI.FCP_VFCPSTRET, 0), NF.STATUS, NF.SITUACAO_NF' +
          'E, NF.COD_EMPRESA, NFI.ANTEC_TRIB,'
        
          '       coalesce(NFI.VALOR_ICM, 0), NFI.UCOM, coalesce(NFI.QCOM, ' +
          '0), NFI.ICM_ORIG, NFI.ICM_CST, NFI.ICM_CSOSN,'
        
          '       coalesce(NFI.ICM_VBC, 0), coalesce(NFI.ICM_VICM, 0), coal' +
          'esce(NFI.ICM_VBCST, 0), coalesce(NFI.ICM_VICMST, 0),'
        
          '       coalesce(NFI.ICM_VBCSTRET, 0), coalesce(NFI.ICM_VICMSSTRE' +
          'T, 0), coalesce(NFI.ICM_VFCPST, 0),'
        '       coalesce(NFI.ICM_VFCPSTRET, 0)'
        'from NOTAFISCAL NF'
        '  inner join NOTAFISCAL_ITEM NFI on NFI.COD_NF = NF.COD_NF and'
        '        NFI.COD_EMPRESA = NF.COD_EMPRESA'
        'where NF.NATUREZA_NF = '#39'S'#39' and'
        '      NF.TIPO_NF = '#39'P'#39' and'
        '      NF.STATUS = '#39'Fechada'#39' and'
        '      coalesce(NF.DA, '#39#39') <> '#39'S'#39' and'
        'case'
        '  when NF.MODELO_NF = '#39'55'#39' then NF.SITUACAO_NFE'
        '  else '#39'Autorizada'#39
        'end = '#39'Autorizada'#39' and'
        'case'
        
          '  when ((substring(NFI.CST from 2 for 2) = '#39'90'#39') and (NFI.BASE_I' +
          'CMSUB > 0)) then '#39'10'#39
        '  else substring(NFI.CST from 2 for 2)'
        'end in ('#39'10'#39', '#39'30'#39', '#39'60'#39', '#39'70'#39', '#39'90'#39')'
        'union'
        '-- NFCe'
        
          'select '#39'NFC'#39' TPDOC, '#39'S'#39' E_S, '#39'S'#39' E_P, '#39'S'#39' CONSUMIDOR_FINAL, '#39'1'#39' ' +
          'NFE_IDDEST, '#39'9'#39' NFE_INDIEDEST, '#39#39' CPFCGC,'
        
          '       NC.MODELO MODELO_NF, NC.SERIE, NC.NUM_NF, NCI.CFOP CODIGO' +
          '_NOP, NCI.ICM_ORIG, NCI.ICM_CST CST, NCI.ICM_CSOSN,'
        
          '       NCI.NITEM, NC.DATA_LANC, NC.DHEMI, NCI.GRUPO_PROD, NCI.CO' +
          'D_PROD, PR.NUM_FAB_PROD, NCI.UCOM,'
        
          '       coalesce(NCI.QCOM, 0) QUANTIDADE, coalesce(NCI.VPROD, 0) ' +
          'VALOR_TOTAL, coalesce(NCI.VDESC, 0) RATEIO_DESCONTO,'
        
          '       0 VICMDESON, 0 BASE_ICM, 0 BASE_ICMSUB, 0 ALIQ_ICMSUB, 0 ' +
          'ALIQ_ICM, 0 VALOR_IPI, NC.CHAVE_NFCE, NC.COD_NFCE,'
        
          '       NCI.NITEM, coalesce(NCI.VSEG, 0) RATEIO_SEGURO, coalesce(' +
          'NCI.VFRETE, 0) RATEIO_FRETE,'
        
          '       coalesce(NCI.VOUTRO, 0) RATEIO_OUTDESP, 0 VALOR_ICMSUB, c' +
          'oalesce(NCI.FCP_VFCPST, 0),'
        
          '       coalesce(NCI.FCP_VFCPSTRET, 0), NC.STATUS, NC.SITUACAO_NF' +
          'CE, NC.COD_EMPRESA, '#39'N'#39' ANT_ST,'
        
          '       coalesce(NCI.ICM_VICMS, 0), NCI.UCOM, coalesce(NCI.QCOM, ' +
          '0), null NF_ORIG, null NF_CST, null NF_CSOSN, 0 NF_VBC,'
        
          '       0 NF_VICM, 0 NF_VBCST, 0 NF_VST, 0 NF_VBCSTRET, 0 NF_VSTR' +
          'ET, 0 NF_VFCPST, 0 NF_VFCPSTRET'
        'from NFCE NC'
        '  inner join NFCE_ITEM NCI on NCI.COD_NFCE = NC.COD_NFCE and'
        '        NCI.COD_EMPRESA = NC.COD_EMPRESA'
        '  inner join PRODUTOS PR on PR.GRUPO_PROD = NCI.GRUPO_PROD and'
        '        PR.COD_PROD = NCI.COD_PROD and'
        '        PR.COD_EMPRESA = NCI.COD_EMPRESA'
        'where NC.STATUS = '#39'Fechada'#39' and'
        '      NC.SITUACAO_NFCE = '#39'Autorizada'#39' and'
        'case'
        
          '  when substring(PR.CST_PROD from 2 for 2) in ('#39'10'#39', '#39'30'#39', '#39'60'#39',' +
          ' '#39'70'#39', '#39'90'#39') then '#39'60'#39
        '  else NCI.ICM_CST'
        'end in ('#39'10'#39', '#39'30'#39', '#39'60'#39', '#39'70'#39', '#39'90'#39')'
        'union'
        '-- Cupons'
        
          'select '#39'CP'#39' TPDOC, '#39'S'#39' E_S, '#39'S'#39' E_P, '#39'S'#39' CONSUMIDOR_FINAL, '#39'1'#39' N' +
          'FE_IDDEST, '#39'9'#39' NFE_INDIEDEST, '#39#39' CPFCGC, '#39'2D'#39' MODELO_NF,'
        '       '#39#39' SERIE, CP.CUPOM NUM_NF,'
        '       case'
        '         when C2.ALIQUOTA_IT = '#39'FF'#39' then 5405.00'
        '         else 5102.00'
        '       end CODIGO_NOP,'
        '       substring(PR.CST_PROD from 1 for 1) ORIG,'
        '       case'
        '         when C2.ALIQUOTA_IT = '#39'FF'#39' then '#39'60'#39
        '         when C2.ALIQUOTA_IT = '#39'II'#39' then '#39'40'#39
        '         when C2.ALIQUOTA_IT = '#39'NN'#39' then '#39'41'#39
        '         else '#39'00'#39
        '       end CST,'
        '       case'
        '         when C2.ALIQUOTA_IT = '#39'FF'#39' then '#39'500'#39
        '         when C2.ALIQUOTA_IT = '#39'II'#39' then '#39'103'#39
        '         when C2.ALIQUOTA_IT = '#39'NN'#39' then '#39'400'#39
        '         else '#39'102'#39
        '       end CSOSN,'
        
          '       C2.NITEM, CP.DATA DATA_LANC, CP.DATA DATA_EMISS, C2.GRUPO' +
          '_PROD, C2.COD_PROD, PR.NUM_FAB_PROD, C2.UNIDADE,'
        '       C2.QUANTIDADE, C2.TOTAL VALOR_TOTAL,'
        
          '       (coalesce(C2.PERC_DESC, 0) + coalesce(C2.RAT_DESC, 0)) DE' +
          'SCONTO, 0 VICMDESON, 0 BASE_ICM, 0 BASE_ICMSUB,'
        
          '       0 ALIQ_ICMSUB, 0 ALIQ_ICM, 0 VALOR_IPI, CP.NSERIEECF CHAV' +
          'E_NFE, CP.REGISTRO, C2.NITEM, 0 SEGURO, 0 FRETE,'
        
          '       (coalesce(C2.PERC_ACRESC, 0) + coalesce(C2.RAT_ACRES, 0))' +
          ' OUTRO, 0 VALOR_ICMSUB, 0 FCP_VFCPST, 0 FCP_VFCPSTRET,'
        '       case'
        '         when CP.STATUS_CP = '#39'CANCELADO'#39' then '#39'Cancelada'#39
        '         else '#39'Fechada'#39
        '       end STATUS,'
        
          '       '#39' '#39' SITUACAO_NF, CP.COD_EMPRESA, '#39'N'#39' ANT_ST, 0 VALOR_ICM,' +
          ' C2.UNIDADE, C2.QUANTIDADE, null NF_ORIG, null NF_CST,'
        
          '       null NF_CSOSN, 0 NF_VBC, 0 NF_VICM, 0 NF_VBCST, 0 NF_VST,' +
          ' 0 NF_VBCSTRET, 0 NF_VSTRET, 0 NF_VFCPST,'
        '       0 NF_VFCPSTRET'
        'from CUPOM CP'
        '  inner join CUPOM2 C2 on C2.COD_TERMINAL = CP.COD_TERMINAL and'
        '        C2.NSERIEECF = CP.NSERIEECF and'
        '        C2.COD_EMPRESA = CP.COD_EMPRESA and'
        '        C2.ORDEM = CP.REGISTRO and'
        '        C2.CUPOM = CP.CUPOM'
        '  inner join PRODUTOS PR on PR.GRUPO_PROD = C2.GRUPO_PROD and'
        '        PR.COD_PROD = C2.COD_PROD and'
        '        PR.COD_EMPRESA = C2.COD_EMPRESA and'
        'case'
        
          '  when substring(PR.CST_PROD from 2 for 2) in ('#39'10'#39', '#39'30'#39', '#39'60'#39',' +
          ' '#39'70'#39', '#39'90'#39') then '#39'60'#39
        '  else C2.ALIQUOTA_IT'
        'end in ('#39'10'#39', '#39'30'#39', '#39'60'#39', '#39'70'#39', '#39'90'#39', '#39'FF'#39')'
        'where coalesce(CP.STATUS_CP, '#39#39') <> '#39'CANCELADO'#39' and'
        '      coalesce(C2.STATUS_IT, '#39#39') <> '#39'CANCELADO'#39
        'union'
        '-- NF serie D'
        
          'select '#39'NFD'#39' TPDOC, '#39'S'#39' E_S, '#39'S'#39' CONSUMIDOR_FINAL, '#39'S'#39' E_P, '#39'1'#39' ' +
          'NFE_IDDEST, '#39'9'#39' NFE_INDIEDEST, '#39#39' CPFCGC, ND.MODELO,'
        
          '       ND.SERIE, ND.NUMERONOTA, PR.CODIGO_NOP, substring(PR.CST_' +
          'PROD from 1 for 1) ORIG,'
        
          '       substring(PR.CST_PROD from 2 for 2) CST, PR.CSOSN, NDI.NI' +
          'TEM, ND.DATAEMISSAO, ND.DATAEMISSAO, NDI.GRUPO_PROD,'
        
          '       NDI.COD_PROD, NDI.NUM_FAB_PROD, PR.UNIDADE, NDI.QUANTID_I' +
          'TEM, NDI.VL_TOT_ITEM, 0 DESCONTO, 0 VICMDESON,'
        
          '       0 BASE_ICM, 0 BASE_ICMSUB, 0 ALIQ_ICMS_SUB, 0 ALIQ_ICM, 0' +
          ' VALOR_IPI, '#39#39' CHAVE_NFE, ND.NUMERONOTA, NDI.NITEM,'
        
          '       0 SEGURO, 0 FRETE, 0 OUTRO, 0 VALOR_ICMSUB, 0 FCP_VFCPST,' +
          ' 0 FCP_VFCPSTRET,'
        '       case'
        '         when ND.STATUS = '#39'CANCELADA'#39' then '#39'Cancelada'#39
        '         else '#39'Fechada'#39
        '       end STATUS,'
        
          '       '#39' '#39' SITUACAO_NF, ND.COD_EMPRESA, '#39'N'#39' ANT_ST, 0 VALOR_ICM,' +
          ' PR.UNIDADE, NDI.QUANTID_ITEM, null NF_ORIG,'
        
          '       null NF_CST, null NF_CSOSN, 0 NF_VBC, 0 NF_VICM, 0 NF_VBC' +
          'ST, 0 NF_VST, 0 NF_VBCSTRET, 0 NF_VSTRET, 0 NF_VFCPST,'
        '       0 NF_VFCPSTRET'
        'from NF_SERIE_D ND'
        
          '  inner join NF_SERIE_D_ITENS NDI on NDI.NUMERONOTA = ND.NUMERON' +
          'OTA and'
        '        NDI.COD_EMPRESA = ND.COD_EMPRESA'
        '  inner join PRODUTOS PR on PR.GRUPO_PROD = NDI.GRUPO_PROD and'
        '        PR.COD_PROD = NDI.COD_PROD and'
        '        PR.COD_EMPRESA = NDI.COD_EMPRESA'
        'where coalesce(ND.STATUS, '#39#39') <> '#39'CANCELADA'#39' and'
        
          '      substring(PR.CST_PROD from 2 for 2) in ('#39'10'#39', '#39'30'#39', '#39'60'#39', ' +
          #39'70'#39', '#39'90'#39');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_EFD_ICMSST_CR_EST ('
        '    DATAINV timestamp,'
        '    DTINI timestamp,'
        '    DTFIM timestamp,'
        '    CODEMPRESA integer,'
        '    USADHEMI smallint,'
        '    FORCAR smallint,'
        '    USACFOPPISCOFINS smallint)'
        'returns ('
        '    RESULT smallint)'
        'as'
        '  declare variable GRU integer;'
        '  declare variable COD char(6);'
        '  declare variable E_S char(1);'
        '  declare variable QTMP T_VL_TODOS;'
        '  declare variable QLOOP T_VL_TODOS;'
        '  declare variable VICMTMP T_VL_TODOS;'
        '  declare variable VSTTMP T_VL_TODOS;'
        '  declare variable VBCSTTMP T_VL_TODOS;'
        '  declare variable VFCPTMP T_VL_TODOS;'
        '  declare variable QEST T_VL_TODOS;'
        '  declare variable VICMEST T_VL_TODOS;'
        '  declare variable VSTEST T_VL_TODOS;'
        '  declare variable VBCSTEST T_VL_TODOS;'
        '  declare variable VFCPEST T_VL_TODOS;'
        '  declare variable DT timestamp;'
        '  declare variable TDOC varchar(6);'
        '  declare variable ES char(1);'
        '  declare variable IDDOC integer;'
        '  declare variable IDIT integer;'
        '  declare variable ANO integer;'
        '  declare variable MES integer;'
        'begin'
        '  RESULT = 0;'
        ''
        '  --Caso forcar entao delete o estoque e o movimento gerado'
        '  if (coalesce(FORCAR, 0) <> 1) then'
        '  begin'
        '    --Caso nao forcar, sai se existir algum registro no estoque'
        '    select count(*)'
        '    from EFD_ICMSST_CR_EST'
        '    where DATA >= :DTINI and'
        '          DATA <= :DTFIM and'
        '          COD_EMPRESA = :CODEMPRESA'
        '      into :FORCAR;'
        ''
        '    if (coalesce(FORCAR, 0) > 0) then'
        '    begin'
        '      RESULT = 1;'
        '      suspend;'
        '      exit;'
        '    end'
        '  end'
        ''
        '  select extract(year from :DTINI)'
        '  from RDB$DATABASE'
        '    into :ANO;'
        '  select extract(month from :DTINI)'
        '  from RDB$DATABASE'
        '    into :MES;'
        ''
        '  delete from EFD_ICMSST_CR_EST'
        '  where ANO = :ANO and'
        '        MES = :MES and'
        '        COD_EMPRESA = :CODEMPRESA;'
        '  delete from EFD_ICMSST_CR_E_S'
        '  where DATA >= :DTINI and'
        '        DATA <= :DTFIM and'
        '        COD_EMPRESA = :CODEMPRESA;'
        ''
        '  if (USACFOPPISCOFINS = 1) then'
        '    insert into EFD_ICMSST_CR_CFOPS (CFOP)'
        '    select CODIGO_NOP'
        '    from NAT_OP N'
        '      left join EFD_ICMSST_CR_CFOPS E on E.CFOP = N.CODIGO_NOP'
        
          '    where iif(CODIGO_NOP > 3000, N.RECEITA_PIS_COFINS, N.CREDITO' +
          '_PIS_COFINS) = '#39'S'#39' and'
        '          E.CFOP is null;'
        ''
        '  --MONTANDO OS VALORES DO ESTOQUE'
        '  for select I.GRUPO_PROD, I.COD_PROD, I.QUANTIDADE'
        
          '             --i.data_inv, i.cod_empresa, i.codigo_posse, i.valo' +
          'r_total, (i.valor_total / i.quantidade) valor_unitario'
        
          '      from (select INV.DATA_INV, INV.COD_EMPRESA, INV.GRUPO_PROD' +
          ', trim(INV.COD_PROD) COD_PROD,'
        
          '                   iif(IP.ID is null, 0, iif(IP.IND_PROP = 0, 0,' +
          ' iif(IP.IND_PROP = 1, 1, 2))) CODIGO_POSSE,'
        
          '                   sum(iif(IP.ID is null, INV.QUANTIDADE, IP.QTD' +
          'E)) QUANTIDADE,'
        
          '                   sum(iif(IP.ID is null, INV.VALOR_PROD * INV.Q' +
          'UANTIDADE, IP.VALOR * IP.QTDE)) VALOR_TOTAL'
        '            from INV_TIPO74 INV'
        
          '              left join INV_TIPO74_POSSE IP on IP.INV_ID = INV.I' +
          'D and'
        '                    IP.COD_EMPRESA = INV.COD_EMPRESA'
        '            where INV.COD_EMPRESA = :CODEMPRESA and'
        '                  DATA_INV = :DATAINV'
        
          '                  --and inv.grupo_prod = 38002 and inv.cod_prod ' +
          'in ('#39'0001'#39', '#39'0002'#39', '#39'0003'#39')'
        
          '                  --and inv.grupo_prod in (7807, 9919) and inv.c' +
          'od_prod in ('#39'0017'#39', '#39'0037'#39')'
        '            group by 1, 2, 3, 4, 5) as I'
        '        inner join INV_TIPO74 I7 on I7.DATA_INV = I.DATA_INV and'
        '              I7.COD_EMPRESA = I.COD_EMPRESA and'
        '              I7.GRUPO_PROD = I.GRUPO_PROD and'
        '              I7.COD_PROD = I.COD_PROD'
        '      where I.CODIGO_POSSE <> 2'
        '        into :GRU, :COD, :QEST'
        '  do'
        '  begin'
        '    QEST = coalesce(QEST, 0);'
        '    QLOOP = QEST;'
        ''
        '    if (QLOOP > 0) then'
        '    begin'
        '      --QSOMA = 0;'
        '      VICMEST = 0;'
        '      VSTEST = 0;'
        '      VBCSTEST = 0;'
        '      VFCPEST = 0;'
        ''
        '      -- OBTENDO AS ULTIMAS ENTRADAS'
        
          '      for execute statement '#39'select NFI.QUANTIDADE, iif(coalesce' +
          '(NFI.VALOR_ICM, 0) > 0, NFI.VALOR_ICM, NFI.ICM_VICM) VL_ICMS_OP,'
        
          '                 iif(coalesce(NFI.VALOR_ICMSUB, 0) > 0, NFI.BASE' +
          '_ICMSUB, NFI.ICM_VBCST) VL_BC_ICMS_ST,'
        
          '                 iif(coalesce(NFI.VALOR_ICMSUB, 0) > 0, NFI.VALO' +
          'R_ICMSUB, NFI.ICM_VICMST) VL_ICMS_ST,'
        
          '                 iif(coalesce(NFI.VALOR_ICMSUB, 0) > 0, NFI.FCP_' +
          'VFCPST, NFI.ICM_VFCPST) VL_FCP,'
        '                 nfi.cod_nf'
        '          from NOTAFISCAL NF'
        
          '            inner join NOTAFISCAL_ITEM NFI on NFI.COD_NF = NF.CO' +
          'D_NF and'
        '                  NFI.COD_EMPRESA = NF.COD_EMPRESA'
        
          '            inner join EFD_ICMSST_CR_CFOPS N on N.CFOP = NFI.COD' +
          'IGO_NOP'
        '          where NF.NATUREZA_NF = '#39#39'E'#39#39' and'
        '                NF.TIPO_NF = '#39#39'P'#39#39' and'
        '                NF.STATUS = '#39#39'Fechada'#39#39' and'
        '                coalesce(NF.DA, '#39#39#39#39') <> '#39#39'S'#39#39' and'
        '                iif((NF.MODELO_NF = '#39#39'55'#39#39') and'
        
          '                (NF.EMISSAO_PROPRIA = '#39#39'S'#39#39'), NF.SITUACAO_NFE, '#39 +
          #39'Autorizada'#39#39') = '#39#39'Autorizada'#39#39' and'
        
          '                iif((substring(NFI.CST from 2 for 2) = '#39#39'90'#39#39') a' +
          'nd'
        
          '                (NFI.BASE_ICMSUB > 0), '#39#39'10'#39#39', substring(NFI.CST' +
          ' from 2 for 2)) in ('#39#39'10'#39#39', '#39#39'30'#39#39', '#39#39'60'#39#39', '#39#39'70'#39#39', '#39#39'90'#39#39') and ' +
          #39' || iif(:USADHEMI = 1,'
        
          '              '#39'NF.DATA_CONTABIL'#39', '#39'NF.DATA_LANC'#39') || '#39' <= '#39#39#39' ||' +
          ' :DATAINV || '#39#39#39' and'
        '                NFI.GRUPO_PROD = '#39' || :GRU || '#39' and'
        '                NFI.COD_PROD = '#39#39#39' || :COD || '#39#39#39' and'
        '                NFI.COD_EMPRESA = '#39' || :CODEMPRESA || '#39
        
          '          order by '#39' || iif(:USADHEMI = 1, '#39'NF.DATA_CONTABIL'#39', '#39 +
          'NF.DATA_LANC'#39') || '#39' desc, NFI.NITEM desc'#39
        
          '              into :QTMP, :VICMTMP, :VBCSTTMP, :VSTTMP, :VFCPTMP' +
          ', :IDDOC'
        '      do'
        '      begin'
        '        QTMP = coalesce(QTMP, 0);'
        '        VICMTMP = coalesce(VICMTMP, 0);'
        '        VBCSTTMP = coalesce(VBCSTTMP, 0);'
        '        VSTTMP = coalesce(VSTTMP, 0);'
        '        VFCPTMP = coalesce(VFCPTMP, 0);'
        ''
        '        if (QTMP > QLOOP) then'
        '        begin'
        '          VICMEST = VICMEST + (VICMTMP / QTMP * QLOOP);'
        '          VBCSTEST = VBCSTEST + (VBCSTTMP / QTMP * QLOOP);'
        '          VSTEST = VSTEST + (VSTTMP / QTMP * QLOOP);'
        '          VFCPEST = VFCPEST + (VFCPTMP / QTMP * QLOOP);'
        ''
        '          QLOOP = 0;'
        '        end'
        '        else'
        '        begin'
        '          --qsoma = qsoma + qtmp;'
        '          VICMEST = VICMEST + VICMTMP;'
        '          VBCSTEST = VBCSTEST + VBCSTTMP;'
        '          VSTEST = VSTEST + VSTTMP;'
        '          VFCPEST = VFCPEST + VFCPTMP;'
        ''
        '          QLOOP = QLOOP - QTMP;'
        '        end'
        ''
        '        if (QLOOP <= 0) then'
        '          break;'
        '      end'
        ''
        '      --media aqui'
        ''
        '      VICMEST = round(VICMEST / QEST, 6);'
        '      VBCSTEST = round(VBCSTEST / QEST, 6);'
        '      VSTEST = round(VSTEST / QEST, 6);'
        '      VFCPEST = round(VFCPEST / QEST, 6);'
        ''
        
          '      update or insert into EFD_ICMSST_CR_EST (ANO, MES, GRUPO_P' +
          'ROD, COD_PROD, COD_EMPRESA, DATA, QTDE, VL_ICMS_OP,'
        
          '                                               VL_BC_ICMS_ST, VL' +
          '_ICMS_ST, VL_FCP)'
        
          '      values (:ANO, :MES, :GRU, :COD, :CODEMPRESA, :DATAINV, :QE' +
          'ST, :VICMEST, :VBCSTEST, :VSTEST, :VFCPEST)'
        
          '      matching (ANO, MES, GRUPO_PROD, COD_PROD, COD_EMPRESA, DAT' +
          'A);'
        ''
        '    end -- if QLOOP > 0'
        ''
        '  end --FIM MONTANDO OS VALORES DO ESTOQUE'
        ''
        
          '  -- MONTANDO OS REGISTROS DE ESTOQUE DURANTE O PERIODO DA APURA' +
          'CAO'
        
          '  for execute statement '#39'select '#39' || iif(:USADHEMI = 1, '#39'T8.DATA' +
          '_EMISS'#39', '#39'T8.DATA_LANC'#39') || '#39', T8.GRUPO_PROD, T8.COD_PROD, T8.E_' +
          'S,'
        
          '             sum(T8.QUANTIDADE) QTDE, sum(iif(coalesce(T8.VALOR_' +
          'ICM, 0) > 0, T8.VALOR_ICM, T8.NF_VICM)) VL_ICMS_OP,'
        
          '             sum(iif(coalesce(T8.VALOR_ICMSUB, 0) > 0, T8.BASE_I' +
          'CMSUB, T8.NF_VBCST)) VL_BC_ICMS_ST,'
        
          '             sum(iif(coalesce(T8.VALOR_ICMSUB, 0) > 0, T8.VALOR_' +
          'ICMSUB, T8.NF_VST)) VL_ICMS_ST,'
        
          '             sum(iif(coalesce(T8.VALOR_ICMSUB, 0) > 0, T8.FCP_VF' +
          'CPST, T8.NF_VFCPST)) VL_FCP'
        '      from VW_TIPO88_ITNF T8'
        
          '        inner join EFD_ICMSST_CR_CFOPS N on N.CFOP = T8.CODIGO_N' +
          'OP'
        
          '      where '#39' || iif(:USADHEMI = 1, '#39'T8.DATA_EMISS'#39', '#39'T8.DATA_LA' +
          'NC'#39') || '#39' >= '#39#39#39' || :DTINI || '#39#39#39' and'
        
          '            '#39' || iif(:USADHEMI = 1, '#39'T8.DATA_EMISS'#39', '#39'T8.DATA_LA' +
          'NC'#39') || '#39' <= '#39#39#39' || :DTFIM || '#39#39#39' and'
        '            T8.COD_EMPRESA = '#39' || :CODEMPRESA || '#39
        '      group by 1, 2, 3, 4'
        '      order by 1, 2, 3, 4 desc'#39
        
          '          into :DT, :GRU, :COD, :E_S, :QTMP, :VICMTMP, :VBCSTTMP' +
          ', :VSTTMP, :VFCPTMP'
        
          '          --            and t8.grupo_prod = 38002 and t8.cod_pro' +
          'd in ( '#39#39'0001'#39#39', '#39#39'0002'#39#39', '#39#39'0003'#39#39')'
        
          '          --            and t8.grupo_prod in (7807, 9919) and t8' +
          '.cod_prod in ( '#39#39'0017'#39#39', '#39#39'0037'#39#39')'
        '  do'
        '  begin'
        ''
        
          '    for select first 1 QTDE, VL_ICMS_OP, VL_BC_ICMS_ST, VL_ICMS_' +
          'ST, VL_FCP'
        '        from EFD_ICMSST_CR_EST'
        '        where GRUPO_PROD = :GRU and'
        '              COD_PROD = :COD and'
        '              COD_EMPRESA = :CODEMPRESA and'
        '              DATA <= :DT'
        '        order by DATA desc'
        '          into :QEST, :VICMEST, :VBCSTEST, :VSTEST, :VFCPEST'
        '    do'
        '    begin'
        '      if (E_S = '#39'S'#39') then'
        '      begin'
        '        QEST = QEST - QTMP;'
        '        if (QEST <= 0) then'
        '        begin'
        '          VICMEST = 0;'
        '          VBCSTEST = 0;'
        '          VSTEST = 0;'
        '          VFCPEST = 0;'
        '        end'
        '      end'
        '      else'
        '      begin'
        '        if ((QEST + QTMP) > 0) then'
        '        begin'
        
          '          -- media ponderada do icms, bcst, icmsst e fcpst. VICM' +
          'TMP, VBCSTTMP, VSTTMP e VFCPTMP sao totais por isso nao se divid' +
          'e nesse momento'
        
          '          VICMEST = ((VICMEST * QEST) + (VICMTMP)) / (QEST + QTM' +
          'P);'
        
          '          VBCSTEST = ((VBCSTEST * QEST) + (VBCSTTMP)) / (QEST + ' +
          'QTMP);'
        '          VSTEST = ((VSTEST * QEST) + (VSTTMP)) / (QEST + QTMP);'
        
          '          VFCPEST = ((VFCPEST * QEST) + (VFCPTMP)) / (QEST + QTM' +
          'P);'
        '        end'
        '        else'
        '        begin'
        '          VICMEST = 0;'
        '          VBCSTEST = 0;'
        '          VSTEST = 0;'
        '          VFCPEST = 0;'
        '        end'
        '        QEST = QEST + QTMP;'
        '      end'
        ''
        
          '      --A altera ou inclui o estoque corrigido para o dia especi' +
          'fico'
        
          '      update or insert into EFD_ICMSST_CR_EST (ANO, MES, GRUPO_P' +
          'ROD, COD_PROD, COD_EMPRESA, DATA, QTDE, VL_ICMS_OP,'
        
          '                                               VL_BC_ICMS_ST, VL' +
          '_ICMS_ST, VL_FCP)'
        
          '      values (:ANO, :MES, :GRU, :COD, :CODEMPRESA, :DT, :QEST, :' +
          'VICMEST, :VBCSTEST, :VSTEST, :VFCPEST)'
        
          '      matching (ANO, MES, GRUPO_PROD, COD_PROD, COD_EMPRESA, DAT' +
          'A);'
        '    end'
        '  end'
        ''
        '  -- MONTADO OS REGISTROS DE ENTRADA E SAIDA'
        
          '  execute statement '#39'insert into EFD_ICMSST_CR_E_S (TPDOC, E_S, ' +
          'COD_DOC, NUM_NF, DATA, CHAVE, CONSUMIDOR_FINAL, IDDEST, INDIEDES' +
          'T, NITEM,'
        
          '                                 GRUPO_PROD, COD_PROD, COD_EMPRE' +
          'SA, ORIG, CST, CSOSN, ANT_ST, CODIGO_NOP, QUANTIDADE,'
        
          '                                 UNIDADE, TOTAL_LIQ, TOTAL_BCICM' +
          ', TOTAL_ICM, TOTAL_BCST, TOTAL_ST, TOTAL_FCPST,'
        
          '                                 TOTAL_FCPSTRET, NF_QCOM, NF_UCO' +
          'M, NF_BCICM, NF_ICM, NF_BCST, NF_ST, NF_FCPST,'
        
          '                                 NF_FCPSTRET, NF_BCSTRET, NF_STR' +
          'ET)'
        
          '  select trim(T8.TPDOC), T8.E_S, T8.COD_DOC, T8.NUM_NF, '#39' || iif' +
          '(:USADHEMI = 1, '#39'T8.DATA_EMISS'#39', '#39'T8.DATA_LANC'#39') || '#39', T8.CHAVE_' +
          'NFE,'
        
          '         T8.CONSUMIDOR_FINAL, T8.ID_DEST, T8.ID_IEDEST, T8.NITEM' +
          ', T8.GRUPO_PROD, T8.COD_PROD, T8.COD_EMPRESA, T8.ORIG,'
        
          '         T8.CST, T8.CSOSN, T8.ANT_ST, T8.CODIGO_NOP, T8.QUANTIDA' +
          'DE, T8.UNIDADE,'
        
          '         (T8.VALOR_TOTAL + T8.SEGURO + T8.FRETE + T8.OUTROS - T8' +
          '.DESCONTO - T8.VICMDESON), T8.BASE_ICM, T8.VALOR_ICM,'
        
          '         T8.BASE_ICMSUB, T8.VALOR_ICMSUB, T8.FCP_VFCPST, T8.FCP_' +
          'VFCPSTRET, T8.NF_QCOM, T8.NF_UCOM, T8.NF_VBC,'
        
          '         T8.NF_VICM, T8.NF_VBCST, T8.NF_VST, T8.NF_VFCPST, T8.NF' +
          '_VFCPSTRET, T8.NF_VBCSTRET, T8.NF_VSTRET'
        '  from VW_TIPO88_ITNF T8'
        '    inner join EFD_ICMSST_CR_CFOPS N on N.CFOP = T8.CODIGO_NOP'
        
          '  where '#39' || iif(:USADHEMI = 1, '#39'T8.DATA_EMISS'#39', '#39'T8.DATA_LANC'#39')' +
          ' || '#39' >= '#39#39#39' || :DTINI || '#39#39#39' and'
        
          '        '#39' || iif(:USADHEMI = 1, '#39'T8.DATA_EMISS'#39', '#39'T8.DATA_LANC'#39')' +
          ' || '#39' <= '#39#39#39' || :DTFIM || '#39#39#39' and'
        
          '        iif(T8.E_S = '#39#39'E'#39#39', '#39#39'S'#39#39', T8.CONSUMIDOR_FINAL) = '#39#39'S'#39#39' ' +
          'and'
        '        T8.COD_EMPRESA ='#39' || :CODEMPRESA;'
        
          '  --            t8.grupo_prod in (7807, 9919) and t8.cod_prod in' +
          ' ( '#39#39'0017'#39#39', '#39#39'0037'#39#39') and'
        ''
        
          '  -- PREENCHENDO OS CAMPOS VL_UNIT_ICMS_OP_ESTOQUE_CONV, VL_UNIT' +
          '_ICMS_ST_ESTOQUE_CONV, VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV'
        
          '  for select TPDOC, E_S, COD_DOC, DATA, NITEM, GRUPO_PROD, COD_P' +
          'ROD'
        '      from EFD_ICMSST_CR_E_S'
        '      where E_S = '#39'S'#39' and'
        '            COD_EMPRESA = :CODEMPRESA'
        '        into :TDOC, :ES, :IDDOC, :DT, :IDIT, :GRU, :COD'
        '  do'
        '  begin'
        
          '    for select first 1 EST.VL_ICMS_OP, EST.VL_ICMS_ST, EST.VL_FC' +
          'P, EST.VL_BC_ICMS_ST'
        '        from EFD_ICMSST_CR_EST EST'
        '        where EST.GRUPO_PROD = :GRU and'
        '              EST.COD_PROD = :COD and'
        '              EST.COD_EMPRESA = :CODEMPRESA and'
        '              EST.DATA <= :DT'
        '        order by EST.DATA desc'
        '          into :VICMEST, :VSTEST, VFCPEST, :VBCSTEST'
        '    do'
        '    begin'
        '      VICMEST = coalesce(VICMEST, 0);'
        '      VSTEST = coalesce(VSTEST, 0);'
        '      VFCPEST = coalesce(VFCPEST, 0);'
        '      VBCSTEST = coalesce(VBCSTEST, 0);'
        ''
        '      update EFD_ICMSST_CR_E_S MOV'
        '      set MOV.EST_ICM = :VICMEST,'
        '          MOV.EST_ST = :VSTEST,'
        '          MOV.EST_FCPST = :VFCPEST,'
        '          MOV.EST_BCST = :VBCSTEST,'
        
          '          MOV.NF_UCOM = iif(trim(coalesce(MOV.NF_UCOM, '#39#39')) <> '#39 +
          #39', MOV.NF_UCOM, MOV.UNIDADE),'
        
          '          MOV.NF_QCOM = iif(coalesce(MOV.NF_QCOM, 0) > 0, MOV.NF' +
          '_QCOM, MOV.QUANTIDADE)'
        '      where MOV.TPDOC = :TDOC and'
        '            MOV.E_S = :ES and'
        '            MOV.COD_DOC = :IDDOC and'
        '            MOV.DATA = :DT and'
        '            MOV.NITEM = :IDIT and'
        '            MOV.GRUPO_PROD = :GRU and'
        '            MOV.COD_PROD = :COD and'
        '            MOV.COD_EMPRESA = :CODEMPRESA;'
        '    end'
        '  end'
        ''
        '  RESULT = 1;'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NF_PEND_IMPORTXML ('
        '    DATAINV timestamp,'
        '    CODEMPRESA integer,'
        '    USADHEMI smallint)'
        'returns ('
        '    COD_NF integer)'
        'as'
        '  declare variable GRU integer;'
        '  declare variable COD varchar(14);'
        '  declare variable QTMP T_VL_TODOS;'
        '  declare variable QLOOP T_VL_TODOS;'
        '  declare variable QEST T_VL_TODOS;'
        '  declare variable IDDOC integer;'
        'begin'
        ''
        '  for select I.GRUPO_PROD, trim(I.COD_PROD), I.QUANTIDADE'
        '      from VW_INV_TIPO74 I'
        '      where I.DATA_INV = :DATAINV and'
        '            I.COD_EMPRESA = :CODEMPRESA and'
        '            I.CODIGO_POSSE <> 2'
        '        into :GRU, :COD, :QEST'
        '  do'
        '  begin'
        '    QEST = coalesce(QEST, 0);'
        '    QLOOP = QEST;'
        ''
        '    if (QLOOP > 0) then'
        '    begin'
        ''
        '      -- OBTENDO AS ULTIMAS ENTRADAS'
        '      for execute statement '#39'select NFI.QUANTIDADE, nfi.cod_nf'
        '          from NOTAFISCAL NF'
        
          '            inner join NOTAFISCAL_ITEM NFI on NFI.COD_NF = NF.CO' +
          'D_NF and'
        '                  NFI.COD_EMPRESA = NF.COD_EMPRESA'
        '          where NF.NATUREZA_NF = '#39#39'E'#39#39' and'
        '                NF.TIPO_NF = '#39#39'P'#39#39' and'
        '                NF.STATUS = '#39#39'Fechada'#39#39' and'
        
          '                coalesce(NF.DA, '#39#39#39#39') <> '#39#39'S'#39#39' and '#39' || iif(:USA' +
          'DHEMI = 1, '#39'NF.DATA_CONTABIL'#39', '#39'NF.DATA_LANC'#39') || '#39' <= '#39#39#39' || :D' +
          'ATAINV || '#39#39#39' and'
        
          '                coalesce(NFI.ALTERA_ESTOQUE_CFOP, '#39#39'S'#39#39') <> '#39#39'N'#39 +
          #39' and'
        '                NFI.GRUPO_PROD = '#39' || :GRU || '#39' and'
        '                NFI.COD_PROD = '#39#39#39' || :COD || '#39#39#39' and'
        '                NFI.COD_EMPRESA = '#39' || :CODEMPRESA || '#39
        
          '          order by '#39' || iif(:USADHEMI = 1, '#39'NF.DATA_CONTABIL'#39', '#39 +
          'NF.DATA_LANC'#39') || '#39' DESC, NFI.NITEM DESC'#39
        '              into :QTMP, :IDDOC'
        '      do'
        '      begin'
        '        QTMP = coalesce(QTMP, 0);'
        ''
        '        if (QTMP > QLOOP) then'
        '        begin'
        '          QLOOP = 0;'
        '        end'
        '        else'
        '        begin'
        '          QLOOP = QLOOP - QTMP;'
        '        end'
        ''
        '        for select distinct NF.COD_NF'
        '            from NOTAFISCAL NF'
        
          '              inner join NOTAFISCAL_ITEM NFI on NFI.COD_NF = NF.' +
          'COD_NF and'
        '                    NFI.COD_EMPRESA = NF.COD_EMPRESA'
        '            where NF.COD_NF = :IDDOC and'
        '                  NF.COD_EMPRESA = :CODEMPRESA and'
        '                  NF.IMPORT_XML is null and'
        '                  NF.MODELO_NF = '#39'55'#39' and'
        '                  coalesce(NF.PATH_XML_IMPORT, '#39#39') <> '#39#39' and'
        '                  NFI.IMPORT_XML = '#39'S'#39
        '              into :COD_NF'
        '        do'
        '        begin'
        '          suspend;'
        '        end'
        ''
        '        if (QLOOP <= 0) then'
        '          break;'
        ''
        '      end'
        '    end -- if QLOOP > 0'
        ''
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND098'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR CLIENTE OU VENDEDOR DE UMA REQ'#39', 5, '#39'N'#39', '#39'FRMCADPEDVENDA'#39',' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND199'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR CLIENTE OU VENDEDOR DE UM ORC'#39', 5, '#39'N'#39', '#39'FRMCADPEDVENDA'#39', ' +
          '1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND200'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR CLIENTE DE UMA ORDEM DE SERVICO'#39', 5, '#39'N'#39', '#39'FRMCADPEDVENDA'#39 +
          ', 1, '#39'S'#39', CURRENT_DATE);'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ALTERAR CL' +
          'IENTE OU VENDEDOR DE UMA REQ'#39', SENHA_GERENTE = '#39'N'#39' WHERE (COD_PR' +
          'OCESSO = '#39'VND098'#39');'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ALTERAR CL' +
          'IENTE OU VENDEDOR DE UM ORC'#39', SENHA_GERENTE = '#39'N'#39' WHERE (COD_PRO' +
          'CESSO = '#39'VND199'#39');'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ALTERAR CL' +
          'IENTE DE UMA ORDEM DE SERVICO'#39', SENHA_GERENTE = '#39'N'#39' WHERE (COD_P' +
          'ROCESSO = '#39'VND200'#39');'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ALTERAR RE' +
          'CEPCIONISTA DE UMA ORDEM DE SERVICO'#39', SENHA_GERENTE = '#39'N'#39' WHERE ' +
          '(COD_PROCESSO = '#39'VND201'#39');'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'PERM ALTER' +
          'AR CLIENTE VND/OS (PROG FID)'#39', SENHA_GERENTE = '#39'S'#39' WHERE (COD_PR' +
          'OCESSO = '#39'VND251'#39');'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ALTERAR CL' +
          'IENTE NAS FORMAPAGAMENTOS E CREDITOS'#39', SENHA_GERENTE = '#39'N'#39' WHERE' +
          ' (COD_PROCESSO = '#39'VND238'#39');'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ALTERAR VE' +
          'NDEDOR NAS FORMA PAGAMENTOS E CREDITOS'#39', SENHA_GERENTE = '#39'N'#39' WHE' +
          'RE (COD_PROCESSO = '#39'VND160'#39');'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'PERM ALT V' +
          'ENDEDOR/CLIENTE EM CREDITOS JA RECEBIDOS'#39', SENHA_GERENTE = '#39'S'#39' W' +
          'HERE (COD_PROCESSO = '#39'VND161'#39');'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ALTERAR CO' +
          'NTROLE DE UMA REQ/OS/ORC'#39', SENHA_GERENTE = '#39'N'#39' WHERE (COD_PROCES' +
          'SO = '#39'VND162'#39');'
        ''
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'PERMITIR R' +
          'EMOVER CONTROLE REQ/OS/ORC'#39', SENHA_GERENTE = '#39'S'#39' WHERE (COD_PROC' +
          'ESSO = '#39'VND163'#39');'
        ''
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND256'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR VENDEDOR DE UMA REQ'#39', 10, '#39'N'#39', '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39', C' +
          'URRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND257'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR VENDEDOR DE UM ORC'#39', 10, '#39'N'#39', '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39', CU' +
          'RRENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NIVEL_PROCESSO = (SELECT NI' +
          'VEL_PROCESSO FROM TABELA_PROCESSOS WHERE COD_PROCESSO = '#39'VND098'#39 +
          ' AND COD_EMPRESA = :COD_EMPRESA) WHERE COD_PROCESSO = '#39'VND256'#39' A' +
          'ND COD_EMPRESA = :COD_EMPRESA;'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NIVEL_PROCESSO = (SELECT NI' +
          'VEL_PROCESSO FROM TABELA_PROCESSOS WHERE COD_PROCESSO = '#39'VND199'#39 +
          ' AND COD_EMPRESA = :COD_EMPRESA) WHERE COD_PROCESSO = '#39'VND257'#39' A' +
          'ND COD_EMPRESA = :COD_EMPRESA;'
        ''
        
          'CREATE INDEX IDX_HIST_REC_LOTE_QUIT ON HIST_REC (LOTE_QUIT, COD_' +
          'EMPRESA);'
        ''
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 20, RDB$CHARACTER_LENGT' +
          'H = 20 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) fro' +
          'm rdb$relation_fields r join rdb$fields f on f.rdb$field_name = ' +
          'rdb$field_source where (r.rdb$relation_name = '#39'DEPART_CT'#39') and (' +
          'r.rdb$field_name='#39'TIPDEVDEP'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 20, RDB$CHARACTER_LENGT' +
          'H = 20 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) fro' +
          'm rdb$relation_fields r join rdb$fields f on f.rdb$field_name = ' +
          'rdb$field_source where (r.rdb$relation_name = '#39'DEPART_CT'#39') and (' +
          'r.rdb$field_name='#39'TIPDEVDEPCNT'#39'));'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS4('
        '    TPDTQUIT_DTREF,'
        '    ORDEM,'
        '    TIPO,'
        '    TIPO2,'
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    DATA_CONF,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    EXIBIR_RESUMO_FINANCEIRO,'
        '    DOCS,'
        '    DOCS2,'
        '    DOCS3,'
        '    VALOR_PAGO,'
        '    SEQID,'
        '    SEQID2,'
        '    HISTORICO,'
        '    HISTORICO2,'
        '    QTDE_PREST,'
        '    CODIGO,'
        '    TIPO_LOTE,'
        '    LOTE,'
        '    TIPO_LANC,'
        '    COD_LANC,'
        '    NREQUISICAO,'
        '    TIP_BAIXA)'
        'AS'
        
          '-- VIEW EXIBE OS RECEBIMENTOS A VISTA E RECEBIMENTOS DO CREDIARI' +
          'O (CREDITOS/CHEQUES)'
        
          '-- RELATORIO "RESUMO FINANCEIRO" EXIBIDO NA PARTE DOS RECEBIMENT' +
          'OS'
        '    select 1, 1, fp.tpdocs, fp.tpdocs,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else lanc.codigo_emp end) cod_empresa,'
        '    lanc.cod_emp_mult, lanc.data,'
        
          '    case when ctr.nome_ctrl is null then 0 else lanc.codigo_ctrl' +
          ' end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        
          '    case when ctr.nome_ctrl is null then '#39'N'#39' else ctr.docs end d' +
          'ocs, ctr.docs docs2, ctr.docs docs3,'
        '    coalesce(fp.valordoc, 0) valordoc,'
        
          '    coalesce(fp.seqform, fp.nrequisicao), coalesce(fp.seqform, f' +
          'p.nrequisicao),'
        
          '    trim(lanc.historico_l) ||'#39' - '#39' || trim(fp.cliente), trim(lan' +
          'c.historico_l),'
        '    1 qtde_prest, lanc.cod_lanc,'
        
          '    '#39'LOTE'#39', (case when (lanc.lote_quit >0) then lanc.lote_quit e' +
          'lse lanc.lote_ent end),'
        '    '#39'LANC'#39', lanc.cod_lanc,'
        '    fp.nrequisicao, null tip_baixa'
        '    from lancamentos lanc'
        '    left join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.n_processamento = lanc.cod' +
          '_lanc'
        
          '        and fp.cod_empresa = (case when(emp.financeiro_unificado' +
          ' = '#39'S'#39') then lanc.cod_emp_mult else lanc.codigo_emp end)'
        
          '    left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao and' +
          ' cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = '#39'LCS'#39
        '    inner join p_contas p on p.n_conta_plc = lanc.n_conta_plc'
        '    inner join grupos_ct c on p.grup_ct = c.grup_ct'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where coalesce(p.tipo_ctp, '#39#39') <> '#39'F'#39' and c.tipo_gr <> '#39'S'#39' a' +
          'nd coalesce(cxl.cod_lancxl, 0) = 0'
        ''
        '    union'
        '    '
        '    select 2, 1, fp.tpdocs, fp.tpdocs,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else lanc.codigo_emp end) cod_empresa,'
        '    lanc.cod_emp_mult, lanc.dtreferencia,'
        
          '    case when ctr.nome_ctrl is null then 0 else lanc.codigo_ctrl' +
          ' end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        
          '    case when ctr.nome_ctrl is null then '#39'N'#39' else ctr.docs end d' +
          'ocs, ctr.docs docs2, ctr.docs docs3,'
        '    coalesce(fp.valordoc, 0) valordoc,'
        
          '    coalesce(fp.seqform, fp.nrequisicao), coalesce(fp.seqform, f' +
          'p.nrequisicao),'
        
          '    trim(lanc.historico_l) ||'#39' - '#39' || trim(fp.cliente), trim(lan' +
          'c.historico_l),'
        '    1 qtde_prest, lanc.cod_lanc,'
        
          '    '#39'LOTE'#39', (case when (lanc.lote_quit >0) then lanc.lote_quit e' +
          'lse lanc.lote_ent end),'
        '    '#39'LANC'#39', lanc.cod_lanc,'
        '    fp.nrequisicao, null tip_baixa'
        '    from lancamentos lanc'
        '    left join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.n_processamento = lanc.cod' +
          '_lanc'
        
          '        and fp.cod_empresa = (case when(emp.financeiro_unificado' +
          ' = '#39'S'#39') then lanc.cod_emp_mult else lanc.codigo_emp end)'
        
          '    left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao and' +
          ' cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = '#39'LCS'#39
        '    inner join p_contas p on p.n_conta_plc = lanc.n_conta_plc'
        '    inner join grupos_ct c on p.grup_ct = c.grup_ct'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where coalesce(p.tipo_ctp, '#39#39') <> '#39'F'#39' and c.tipo_gr <> '#39'S'#39' a' +
          'nd coalesce(cxl.cod_lancxl, 0) = 0'
        ''
        '    union'
        ''
        '    select 1, 1, fp.tpdocs, fp.tpdocs,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else lanc.codigo_emp end) cod_empresa,'
        '    lanc.cod_emp_mult, lanc.data,'
        
          '    case when ctr.nome_ctrl is null then 0 else lanc.codigo_ctrl' +
          ' end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        
          '    case when ctr.nome_ctrl is null then '#39'N'#39' else ctr.docs end d' +
          'ocs, ctr.docs docs2, ctr.docs docs3,'
        '    coalesce(fp.valordoc, 0) valordoc,'
        
          '    coalesce(fp.seqform, fp.nrequisicao), coalesce(fp.seqform, f' +
          'p.nrequisicao),'
        
          '    trim(lanc.historico_l) ||'#39' - '#39' || trim(fp.cliente), trim(lan' +
          'c.historico_l),'
        '    1 qtde_prest, lanc.cod_lanc,'
        
          '    '#39'LOTE'#39', (case when (lanc.lote_quit >0) then lanc.lote_quit e' +
          'lse lanc.lote_ent end),'
        '    '#39'LANC'#39', lanc.cod_lanc,'
        '    fp.nrequisicao, null tip_baixa'
        '    from lancamentos lanc'
        '    left join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.n_processamento = lanc.cod' +
          '_lanc'
        
          '        and fp.cod_empresa = (case when(emp.financeiro_unificado' +
          ' = '#39'S'#39') then lanc.cod_emp_mult else lanc.codigo_emp end)'
        
          '    left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao and' +
          ' cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = '#39'LCS'#39
        '    inner join p_contas p on p.n_conta_plc = lanc.n_conta_plc'
        '    inner join grupos_ct c on p.grup_ct = c.grup_ct'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        '    where coalesce(p.tipo_ctp, '#39#39') <> '#39'F'#39' and c.tipo_gr <> '#39'S'#39
        '    and cxl.tipo_lanc_cxl = '#39'S'#39' and cxl.refrecibo = '#39'S'#39
        ''
        '    union'
        ''
        '    select 2, 1, fp.tpdocs, fp.tpdocs,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else lanc.codigo_emp end) cod_empresa,'
        '    lanc.cod_emp_mult, lanc.dtreferencia,'
        
          '    case when ctr.nome_ctrl is null then 0 else lanc.codigo_ctrl' +
          ' end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        
          '    case when ctr.nome_ctrl is null then '#39'N'#39' else ctr.docs end d' +
          'ocs, ctr.docs docs2, ctr.docs docs3,'
        '    coalesce(fp.valordoc, 0) valordoc,'
        
          '    coalesce(fp.seqform, fp.nrequisicao), coalesce(fp.seqform, f' +
          'p.nrequisicao),'
        
          '    trim(lanc.historico_l) ||'#39' - '#39' || trim(fp.cliente), trim(lan' +
          'c.historico_l),'
        '    1 qtde_prest, lanc.cod_lanc,'
        
          '    '#39'LOTE'#39', (case when (lanc.lote_quit >0) then lanc.lote_quit e' +
          'lse lanc.lote_ent end),'
        '    '#39'LANC'#39', lanc.cod_lanc,'
        '    fp.nrequisicao, null tip_baixa'
        '    from lancamentos lanc'
        '    left join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.n_processamento = lanc.cod' +
          '_lanc'
        
          '        and fp.cod_empresa = (case when(emp.financeiro_unificado' +
          ' = '#39'S'#39') then lanc.cod_emp_mult else lanc.codigo_emp end)'
        
          '    left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao and' +
          ' cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = '#39'LCS'#39
        '    inner join p_contas p on p.n_conta_plc = lanc.n_conta_plc'
        '    inner join grupos_ct c on p.grup_ct = c.grup_ct'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        '    where coalesce(p.tipo_ctp, '#39#39') <> '#39'F'#39' and c.tipo_gr <> '#39'S'#39
        '    and cxl.tipo_lanc_cxl = '#39'S'#39' and cxl.refrecibo = '#39'S'#39
        ''
        '    -- Cred'
        '    '
        '    union'
        '    '
        
          '    select 0, 2, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is null)' +
          ' then pr.tipo_doc_c else ctr1.nome_ctrl end tipo2,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.datq_c,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then ctr1.codigo_ctrl else cas' +
          'e when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctrl end e' +
          'nd codigo_ctrl,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then ctr1.nome_ctrl else case ' +
          'when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_ctrl e' +
          'nd end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        
          '    '#39'N'#39' docs, case when(pr.tip_baixa = '#39'C'#39') then '#39'S2'#39' else ctr.d' +
          'ocs end docs2, case when(pr.tip_baixa = '#39'C'#39') then '#39'N'#39' else ctr.d' +
          'ocs end docs3,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then pr.valor_quitado else cas' +
          'e when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1) else c' +
          'oalesce(l.valor_l, 0) end end valor_pago,'
        '    coalesce(l.cod_lanc, pr.seq_bxcred), 0,'
        
          '    trim(pr.historico_c) ||'#39' - '#39'|| trim(pr.nome_c), coalesce(tri' +
          'm(l.historico_l), coalesce(trim(pr.historico_c) , '#39#39')),'
        
          '    coalesce((case when ((select count(*) from baixa_creditos bc' +
          ' where bc.lote_quit = pr.lote_quit and bc.codigo_emp = pr.codigo' +
          '_emp) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from baixa_creditos bc where bc.lote_qu' +
          'it = pr.lote_quit and bc.codigo_emp = pr.codigo_emp) '
        '    end), 1) qtde_prest, pr.SEQ_BXCRED,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then '#39'LOTE PG'#39' else '#39'LOTE'#39' end' +
          ','
        
          '    case when(pr.tip_baixa = '#39'C'#39') then pr.lote else pr.lote_quit' +
          ' end,'
        '    case when(pr.tip_baixa = '#39'C'#39') then '#39'CRED'#39' else '#39'LANC'#39' end,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then pr.seq_bxcred else l.cod_' +
          'lanc end cod_lanc,'
        '    0, pr.tip_baixa'
        '    from baixa_creditos pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.codigo_emp = pr.codigo_emp'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp and l.data = pr.datq_c'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.datq_c is not null'
        '    '
        '    union'
        '    '
        
          '    select 0, 2, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is null)' +
          ' then pr.tipo_doc_c else ctr1.nome_ctrl end tipo2,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.data_rec_c,'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        '    '#39'N'#39' docs, ctr.docs docs2, ctr.docs docs3,'
        
          '    case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1)' +
          ' else coalesce(l.valor_l, 0) end valor_pago,'
        '    coalesce(l.cod_lanc, pr.seq_bxcred), 0,'
        
          '    trim(pr.historico_c) ||'#39' - '#39'|| trim(pr.nome_c), coalesce(tri' +
          'm(l.historico_l), coalesce(trim(pr.historico_c) , '#39#39')),'
        
          '    coalesce((case when ((select count(*) from baixa_creditos bc' +
          ' where bc.lote_quit = pr.lote_quit and bc.codigo_emp = pr.codigo' +
          '_emp) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from baixa_creditos bc where bc.lote_qu' +
          'it = pr.lote_quit and bc.codigo_emp = pr.codigo_emp)'
        '    end), 1) qtde_prest, pr.SEQ_BXCRED,'
        '    '#39'LOTE'#39', pr.lote_quit,'
        '    '#39'LANC'#39', l.cod_lanc,'
        '    0, pr.tip_baixa'
        '    from baixa_creditos pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.codigo_emp'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.codigo_emp = pr.codigo_emp'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp and l.data = pr.data_rec_c'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.datq_c is null'
        '    '
        '    union'
        '    '
        
          '    select 0, 2, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is null)' +
          ' then '#39#39' else ctr1.nome_ctrl end tipo2,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.data_rec_c,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        '    '#39'N'#39' docs, ctr.docs docs2, ctr.docs docs3,'
        
          '    case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1)' +
          ' else coalesce(l.valor_l, 0) end valor_pago,'
        '    coalesce(l.cod_lanc, pr.cod_cred), 0,'
        
          '    trim(pr.historico_c) || '#39' - '#39'|| trim(pr.nome_c), coalesce(tr' +
          'im(l.historico_l), coalesce(trim(pr.historico_c) , '#39#39')),'
        '    1 qtde_prest, pr.cod_cred,'
        '    '#39'LOTE'#39', pr.lote_quit,'
        '    '#39'LANC'#39', l.cod_lanc,'
        '    0, pr.tip_baixa'
        '    from controle_creditos pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp and l.data = pr.data_rec_c'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        '    '
        '    union'
        '    '
        
          '    select 0, 2, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is null)' +
          ' then '#39#39' else ctr1.nome_ctrl end tipo2,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.datq_ch,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then ctr1.codigo_ctrl else cas' +
          'e when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl end end' +
          ' codigo_ctrl,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then ctr1.nome_ctrl else case ' +
          'when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.nome_ctrl e' +
          'nd end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        
          '    '#39'N'#39' docs, case when(pr.tip_baixa = '#39'C'#39') then '#39'S1'#39' else ctr.d' +
          'ocs end docs2, case when(pr.tip_baixa = '#39'C'#39') then '#39'N'#39' else ctr.d' +
          'ocs end docs3,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then pr.valor_ch else case whe' +
          'n(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1) else coales' +
          'ce(l.valor_l, 0) end end valor_pago,'
        '    coalesce(l.cod_lanc, pr.codigo_ch), 0,'
        
          '    trim(pr.historico_ch) || '#39' - '#39'|| trim(pr.nome_ch), coalesce(' +
          'trim(l.historico_l), coalesce(trim(pr.historico_ch) , '#39#39')),'
        
          '    coalesce((case when ((select count(*) from controle_cheque c' +
          'h where ch.lote_quit = pr.lote_quit and ch.codigo_emp = pr.codig' +
          'o_emp) = 0) then'
        '      1'
        '    else'
        
          '      (select count(*) from controle_cheque ch where ch.lote_qui' +
          't = pr.lote_quit and ch.codigo_emp = pr.codigo_emp)'
        '    end), 1) qtde_prest, pr.codigo_ch,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then '#39'LOTE PG'#39' else '#39'LOTE'#39' end' +
          ','
        
          '    case when(pr.tip_baixa = '#39'C'#39') then pr.lote else pr.lote_quit' +
          ' end,'
        '    case when(pr.tip_baixa = '#39'C'#39') then '#39'CHQ'#39' else '#39'LANC'#39' end,'
        
          '    case when(pr.tip_baixa = '#39'C'#39') then pr.codigo_ch else l.cod_l' +
          'anc end cod_lanc,'
        '    0, pr.tip_baixa'
        '    from controle_cheque pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.codigo_emp'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp and l.data = pr.datq_ch'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.status_ch is not null and pr.datq_ch is not null'
        '    '
        '    union'
        '    '
        
          '    select 0, 2, '#39'CREDIARIO'#39', case when (ctr1.nome_ctrl is null)' +
          ' then '#39#39' else ctr1.nome_ctrl end tipo2,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.data_rec,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(ctr.exibir_resumo_financeiro, '#39'S'#39') exibir_resumo_fi' +
          'nanceiro,'
        '    '#39'N'#39' docs, ctr.docs docs2, ctr.docs docs3,'
        
          '    case when(l.tipo_l = '#39'S'#39') then (coalesce(l.valor_l, 0) * -1)' +
          ' else coalesce(l.valor_l, 0) end valor_pago,'
        '    coalesce(l.cod_lanc, pr.codigo_ch), 0,'
        
          '    trim(pr.historico_ch) || '#39' - '#39'|| trim(pr.nome_ch), coalesce(' +
          'trim(l.historico_l), coalesce(trim(pr.historico_ch) , '#39#39')),'
        '    1 qtde_prest, pr.codigo_ch,'
        '    '#39'LOTE'#39', pr.lote_quit,'
        '    '#39'LANC'#39', l.cod_lanc,'
        '    0, pr.tip_baixa'
        '    from controle_cheque pr'
        '    left join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.codigo_emp'
        
          '    left join lancamentos l on l.lote_ent = pr.lote_quit and l.c' +
          'odigo_emp = pr.codigo_emp and l.data = pr.data_rec'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = l.codigo_ctrl a' +
          'nd ctr.codigo_emp = l.codigo_emp'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_ch, '#39#39') = '#39#39' and pr.datq_ch is null'
        ';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS('
        '    TPDTQUIT_DTREF,'
        '    E_S,'
        '    COD_LANC,'
        '    LOTE,'
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    N_CONTA_PLC,'
        '    COD_CONTRLE,'
        '    NOME_CTRL,'
        '    DOCS,'
        '    DATA,'
        '    VALOR,'
        '    HISTORICO,'
        '    TIPO_CTP)'
        'AS'
        
          '-- VIEW EXIBE OS LANCAMENTOS AVULSOS REALIZADOS DOS CONTROLES TI' +
          'PO DOCS = '#39'N'#39
        
          '-- RELATORIO "RESUMO FINANCEIRO" EXIBIDO NO GRUPO ENTRADAS/SAIDA' +
          'S DIVERSAS'
        '    select 1, lanc.tipo_l, lanc.cod_lanc,'
        
          '    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else ' +
          '(case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lot' +
          'e_ent end) end),'
        '    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc,'
        '    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        
          '    lanc.data, lanc.valor_l, lanc.historico_l, plano.tipo_ctp fr' +
          'om lancamentos lanc'
        
          '    inner join p_contas plano on plano.n_conta_plc = lanc.n_cont' +
          'a_plc'
        '    inner join grupos_ct c on plano.grup_ct = c.grup_ct'
        
          '    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctr' +
          'l and lanc.codigo_emp = ctr.codigo_emp'
        
          '    where lanc.tipo_l = '#39'E'#39' and plano.tipo_ctp in ('#39'E'#39', '#39'T'#39', '#39'O'#39 +
          ') and ctr.docs = '#39'N'#39
        
          '    and (select count(*) from baixa_creditos bx where bx.lote_qu' +
          'it = lanc.lote_ent and bx.codigo_emp = lanc.codigo_emp/* and bx.' +
          'datq_c = lanc.data*/) = 0'
        
          '    and (select count(*) from controle_creditos cc where cc.lote' +
          '_quit = lanc.lote_ent and cc.codigo_emp = lanc.codigo_emp/* and ' +
          'cc.datq_c = lanc.data*/) = 0'
        
          '    and (select count(*) from controle_cheque ch where ch.lote_q' +
          'uit = lanc.lote_ent and ch.codigo_emp = lanc.codigo_emp/* and ch' +
          '.datq_ch = lanc.data*/) = 0'
        ''
        '    union'
        ''
        '    select 2, lanc.tipo_l, lanc.cod_lanc,'
        
          '    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else ' +
          '(case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lot' +
          'e_ent end) end),'
        '    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc,'
        '    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        
          '    lanc.dtreferencia, lanc.valor_l, lanc.historico_l, plano.tip' +
          'o_ctp from lancamentos lanc'
        
          '    inner join p_contas plano on plano.n_conta_plc = lanc.n_cont' +
          'a_plc'
        '    inner join grupos_ct c on plano.grup_ct = c.grup_ct'
        
          '    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctr' +
          'l and lanc.codigo_emp = ctr.codigo_emp'
        
          '    where lanc.tipo_l = '#39'E'#39' and plano.tipo_ctp in ('#39'E'#39', '#39'T'#39', '#39'O'#39 +
          ') and ctr.docs = '#39'N'#39
        
          '    and (select count(*) from baixa_creditos bx where bx.lote_qu' +
          'it = lanc.lote_ent and bx.codigo_emp = lanc.codigo_emp/* and bx.' +
          'datq_c = lanc.data*/) = 0'
        
          '    and (select count(*) from controle_creditos cc where cc.lote' +
          '_quit = lanc.lote_ent and cc.codigo_emp = lanc.codigo_emp/* and ' +
          'cc.datq_c = lanc.data*/) = 0'
        
          '    and (select count(*) from controle_cheque ch where ch.lote_q' +
          'uit = lanc.lote_ent and ch.codigo_emp = lanc.codigo_emp/* and ch' +
          '.datq_ch = lanc.data*/) = 0'
        ''
        '    union'
        ''
        '    select 1, lanc.tipo_l, lanc.cod_lanc,'
        
          '    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else ' +
          '(case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lot' +
          'e_ent end) end),'
        '    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc,'
        '    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        
          '    lanc.data, (lanc.valor_l * -1) valor_l, lanc.historico_l, pl' +
          'ano.tipo_ctp from lancamentos lanc'
        '    left join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join p_contas plano on plano.n_conta_plc = lanc.n_cont' +
          'a_plc'
        
          '    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coal' +
          'esce(c.tipo_gr, '#39#39') <> '#39'S'#39
        
          '    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctr' +
          'l and lanc.codigo_emp = ctr.codigo_emp'
        
          '    where lanc.tipo_l = '#39'S'#39' and plano.tipo_ctp in ('#39'O'#39') and ctr.' +
          'docs = '#39'N'#39
        
          '    --and (select count(*) from baixa_creditos bx where bx.lote_' +
          'quit = lanc.lote_quit and bx.codigo_emp = lanc.codigo_emp/* and ' +
          'bx.datq_c = lanc.data*/) = 0'
        
          '    --and (select count(*) from controle_creditos cc where cc.lo' +
          'te_quit = lanc.lote_quit and cc.codigo_emp = lanc.codigo_emp/* a' +
          'nd cc.datq_c = lanc.data*/) = 0'
        
          '    --and (select count(*) from controle_cheque ch where ch.lote' +
          '_quit = lanc.lote_quit and ch.codigo_emp = lanc.codigo_emp/* and' +
          ' ch.datq_ch = lanc.data*/) = 0'
        ''
        '    and (select count(*) from formpagamento fp'
        
          '        left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao' +
          ' and cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = '#39'LCS'#39
        
          '        inner join p_contas p on p.n_conta_plc = lanc.n_conta_pl' +
          'c'
        '        inner join grupos_ct c on p.grup_ct = c.grup_ct'
        
          '        left join CONTROLES ctr on fp.cod_controle = ctr.codigo_' +
          'ctrl and fp.cod_empresa = ctr.codigo_emp'
        '        where fp.n_processamento = lanc.cod_lanc'
        
          '            and fp.cod_empresa = (case when(emp.financeiro_unifi' +
          'cado = '#39'S'#39') then lanc.cod_emp_mult else lanc.codigo_emp end)'
        '        and coalesce(p.tipo_ctp, '#39#39') <> '#39'F'#39' and c.tipo_gr <> '#39'S'#39
        '        and cxl.tipo_lanc_cxl = '#39'S'#39' and cxl.refrecibo = '#39'S'#39') = 0'
        ''
        '    and lanc.lote is null'
        ''
        '    union'
        ''
        '    select 2, lanc.tipo_l, lanc.cod_lanc,'
        
          '    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else ' +
          '(case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lot' +
          'e_ent end) end),'
        '    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc,'
        '    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        
          '    lanc.dtreferencia, (lanc.valor_l * -1) valor_l, lanc.histori' +
          'co_l, plano.tipo_ctp from lancamentos lanc'
        '    left join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join p_contas plano on plano.n_conta_plc = lanc.n_cont' +
          'a_plc'
        
          '    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coal' +
          'esce(c.tipo_gr, '#39#39') <> '#39'S'#39
        
          '    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctr' +
          'l and lanc.codigo_emp = ctr.codigo_emp'
        
          '    where lanc.tipo_l = '#39'S'#39' and plano.tipo_ctp in ('#39'O'#39') and ctr.' +
          'docs = '#39'N'#39
        
          '    --and (select count(*) from baixa_creditos bx where bx.lote_' +
          'quit = lanc.lote_quit and bx.codigo_emp = lanc.codigo_emp/* and ' +
          'bx.datq_c = lanc.data*/) = 0'
        
          '    --and (select count(*) from controle_creditos cc where cc.lo' +
          'te_quit = lanc.lote_quit and cc.codigo_emp = lanc.codigo_emp/* a' +
          'nd cc.datq_c = lanc.data*/) = 0'
        
          '    --and (select count(*) from controle_cheque ch where ch.lote' +
          '_quit = lanc.lote_quit and ch.codigo_emp = lanc.codigo_emp/* and' +
          ' ch.datq_ch = lanc.data*/) = 0'
        ''
        '    and (select count(*) from formpagamento fp'
        
          '        left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao' +
          ' and cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = '#39'LCS'#39
        
          '        inner join p_contas p on p.n_conta_plc = lanc.n_conta_pl' +
          'c'
        '        inner join grupos_ct c on p.grup_ct = c.grup_ct'
        
          '        left join CONTROLES ctr on fp.cod_controle = ctr.codigo_' +
          'ctrl and fp.cod_empresa = ctr.codigo_emp'
        '        where fp.n_processamento = lanc.cod_lanc'
        
          '            and fp.cod_empresa = (case when(emp.financeiro_unifi' +
          'cado = '#39'S'#39') then lanc.cod_emp_mult else lanc.codigo_emp end)'
        '        and coalesce(p.tipo_ctp, '#39#39') <> '#39'F'#39' and c.tipo_gr <> '#39'S'#39
        '        and cxl.tipo_lanc_cxl = '#39'S'#39' and cxl.refrecibo = '#39'S'#39') = 0'
        ''
        '    and lanc.lote is null'
        ''
        '    union'
        ''
        '    select 1, '#39'S'#39','
        
          '    coalesce((select first 1 lanc.cod_lanc from lancamentos lanc' +
          ' where lanc.lote = ctp.lote and lanc.codigo_emp = ctp.codigo_emp' +
          '), 0) cod_lanc,'
        '    ctp.lote,'
        '    ctp.codigo_emp, ctp.cod_emp_mult, ctp.n_conta_plc,'
        '    ctp.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        '    ctp.datq_ctp, (ctp.valor_ctp  * -1) valor_ctp,'
        
          '    trim(coalesce(ctp.historico_ctp, '#39#39')) || '#39' - '#39' || trim(coale' +
          'sce(ctp.nome_for_ctp, '#39#39')),'
        '    plano.tipo_ctp from p_contas plano'
        
          '    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coal' +
          'esce(c.tipo_gr, '#39#39') <> '#39'S'#39
        '    left join sub_grup_ct s on plano.cod_sub_ct = s.cod_sub_ct'
        
          '    inner join contas_a_pagar ctp on plano.n_conta_plc = ctp.n_c' +
          'onta_plc'
        
          '    inner join controles ctr on ctp.codigo_ctrl = ctr.codigo_ctr' +
          'l and ctp.codigo_emp = ctr.codigo_emp'
        '    where plano.tipo_ctp in ('#39'O'#39') and ctp.lote is not null'
        ''
        '    union'
        ''
        '    select 2, '#39'S'#39','
        
          '    coalesce((select first 1 lanc.cod_lanc from lancamentos lanc' +
          ' where lanc.lote = ctp.lote and lanc.codigo_emp = ctp.codigo_emp' +
          '), 0) cod_lanc,'
        '    ctp.lote,'
        '    ctp.codigo_emp, ctp.cod_emp_mult, ctp.n_conta_plc,'
        '    ctp.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        '    ctp.dtreferencia, (ctp.valor_ctp  * -1) valor_ctp,'
        
          '    trim(coalesce(ctp.historico_ctp, '#39#39')) || '#39' - '#39' || trim(coale' +
          'sce(ctp.nome_for_ctp, '#39#39')), plano.tipo_ctp from p_contas plano'
        
          '    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coal' +
          'esce(c.tipo_gr, '#39#39') <> '#39'S'#39
        '    left join sub_grup_ct s on plano.cod_sub_ct = s.cod_sub_ct'
        
          '    inner join contas_a_pagar ctp on plano.n_conta_plc = ctp.n_c' +
          'onta_plc'
        
          '    inner join controles ctr on ctp.codigo_ctrl = ctr.codigo_ctr' +
          'l and ctp.codigo_emp = ctr.codigo_emp'
        '    where plano.tipo_ctp in ('#39'O'#39') and ctp.lote is not null'
        ''
        '    union'
        ''
        '    -- CORRECAO SALDO'
        '    select 1, lanc.tipo_l, lanc.cod_lanc,'
        
          '    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else ' +
          '(case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lot' +
          'e_ent end) end),'
        '    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc,'
        '    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        
          '    lanc.data, case when (lanc.tipo_l = '#39'S'#39') then (lanc.valor_l ' +
          '* -1) else lanc.valor_l end, lanc.historico_l,'
        '    plano.tipo_ctp from lancamentos lanc'
        
          '    inner join p_contas plano on plano.n_conta_plc = lanc.n_cont' +
          'a_plc'
        '    inner join grupos_ct c on plano.grup_ct = c.grup_ct '
        
          '    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctr' +
          'l and lanc.codigo_emp = ctr.codigo_emp'
        '    where lanc.tipo_l = '#39'E'#39' and plano.tipo_ctp in ('#39'Z'#39')'
        
          '    and (select count(*) from baixa_creditos bx where bx.lote_qu' +
          'it = lanc.lote_ent and bx.codigo_emp = lanc.codigo_emp/* and bx.' +
          'datq_c = lanc.data*/) = 0'
        
          '    and (select count(*) from controle_creditos cc where cc.lote' +
          '_quit = lanc.lote_ent and cc.codigo_emp = lanc.codigo_emp/* and ' +
          'cc.datq_c = lanc.data*/) = 0'
        
          '    and (select count(*) from controle_cheque ch where ch.lote_q' +
          'uit = lanc.lote_ent and ch.codigo_emp = lanc.codigo_emp/* and ch' +
          '.datq_ch = lanc.data*/) = 0'
        ''
        '    union'
        ''
        '    select 2, lanc.tipo_l, lanc.cod_lanc,'
        
          '    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else ' +
          '(case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lot' +
          'e_ent end) end),'
        '    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc,'
        '    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        
          '    lanc.dtreferencia, case when (lanc.tipo_l = '#39'S'#39') then (lanc.' +
          'valor_l * -1) else lanc.valor_l end, lanc.historico_l,'
        '    plano.tipo_ctp from lancamentos lanc'
        
          '    inner join p_contas plano on plano.n_conta_plc = lanc.n_cont' +
          'a_plc'
        '    inner join grupos_ct c on plano.grup_ct = c.grup_ct '
        
          '    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctr' +
          'l and lanc.codigo_emp = ctr.codigo_emp'
        '    where lanc.tipo_l = '#39'E'#39' and plano.tipo_ctp in ('#39'Z'#39')'
        
          '    and (select count(*) from baixa_creditos bx where bx.lote_qu' +
          'it = lanc.lote_ent and bx.codigo_emp = lanc.codigo_emp/* and bx.' +
          'datq_c = lanc.data*/) = 0'
        
          '    and (select count(*) from controle_creditos cc where cc.lote' +
          '_quit = lanc.lote_ent and cc.codigo_emp = lanc.codigo_emp/* and ' +
          'cc.datq_c = lanc.data*/) = 0'
        
          '    and (select count(*) from controle_cheque ch where ch.lote_q' +
          'uit = lanc.lote_ent and ch.codigo_emp = lanc.codigo_emp/* and ch' +
          '.datq_ch = lanc.data*/) = 0'
        ''
        '    union'
        ''
        '    select 1, lanc.tipo_l, lanc.cod_lanc,'
        
          '    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else ' +
          '(case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lot' +
          'e_ent end) end),'
        '    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc,'
        '    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        
          '    lanc.data, case when (lanc.tipo_l = '#39'S'#39') then (lanc.valor_l ' +
          '* -1) else lanc.valor_l end, lanc.historico_l,'
        '    plano.tipo_ctp from lancamentos lanc'
        '    left join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join p_contas plano on plano.n_conta_plc = lanc.n_cont' +
          'a_plc'
        
          '    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coal' +
          'esce(c.tipo_gr, '#39#39') <> '#39'S'#39
        
          '    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctr' +
          'l and lanc.codigo_emp = ctr.codigo_emp'
        '    where lanc.tipo_l = '#39'S'#39' and plano.tipo_ctp in ('#39'Z'#39')'
        
          '    --and (select count(*) from baixa_creditos bx where bx.lote_' +
          'quit = lanc.lote_quit and bx.codigo_emp = lanc.codigo_emp/* and ' +
          'bx.datq_c = lanc.data*/) = 0'
        
          '    --and (select count(*) from controle_creditos cc where cc.lo' +
          'te_quit = lanc.lote_quit and cc.codigo_emp = lanc.codigo_emp/* a' +
          'nd cc.datq_c = lanc.data*/) = 0'
        
          '    --and (select count(*) from controle_cheque ch where ch.lote' +
          '_quit = lanc.lote_quit and ch.codigo_emp = lanc.codigo_emp/* and' +
          ' ch.datq_ch = lanc.data*/) = 0'
        ''
        '    and (select count(*) from formpagamento fp'
        
          '        left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao' +
          ' and cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = '#39'LCS'#39
        
          '        inner join p_contas p on p.n_conta_plc = lanc.n_conta_pl' +
          'c'
        '        inner join grupos_ct c on p.grup_ct = c.grup_ct'
        
          '        left join CONTROLES ctr on fp.cod_controle = ctr.codigo_' +
          'ctrl and fp.cod_empresa = ctr.codigo_emp'
        '        where fp.n_processamento = lanc.cod_lanc'
        
          '            and fp.cod_empresa = (case when(emp.financeiro_unifi' +
          'cado = '#39'S'#39') then lanc.cod_emp_mult else lanc.codigo_emp end)'
        '        and coalesce(p.tipo_ctp, '#39#39') <> '#39'F'#39' and c.tipo_gr <> '#39'S'#39
        '        and cxl.tipo_lanc_cxl = '#39'S'#39' and cxl.refrecibo = '#39'S'#39') = 0'
        ''
        '    union'
        ''
        '    select 2, lanc.tipo_l, lanc.cod_lanc,'
        
          '    (case when (coalesce(lanc.lote, 0) > 0) then lanc.lote else ' +
          '(case when (lanc.lote_quit >0) then lanc.lote_quit else lanc.lot' +
          'e_ent end) end),'
        '    lanc.codigo_emp, lanc.cod_emp_mult, lanc.n_conta_plc,'
        '    lanc.codigo_ctrl, ctr.nome_ctrl, ctr.docs,'
        
          '    lanc.dtreferencia, case when (lanc.tipo_l = '#39'S'#39') then (lanc.' +
          'valor_l * -1) else lanc.valor_l end, lanc.historico_l,'
        '    plano.tipo_ctp from lancamentos lanc'
        '    left join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join p_contas plano on plano.n_conta_plc = lanc.n_cont' +
          'a_plc'
        
          '    inner join grupos_ct c on plano.grup_ct = c.grup_ct and coal' +
          'esce(c.tipo_gr, '#39#39') <> '#39'S'#39' '
        
          '    left join CONTROLES ctr on lanc.codigo_ctrl = ctr.codigo_ctr' +
          'l and lanc.codigo_emp = ctr.codigo_emp'
        '    where lanc.tipo_l = '#39'S'#39' and plano.tipo_ctp in ('#39'Z'#39')'
        
          '    --and (select count(*) from baixa_creditos bx where bx.lote_' +
          'quit = lanc.lote_quit and bx.codigo_emp = lanc.codigo_emp/* and ' +
          'bx.datq_c = lanc.data*/) = 0'
        
          '    --and (select count(*) from controle_creditos cc where cc.lo' +
          'te_quit = lanc.lote_quit and cc.codigo_emp = lanc.codigo_emp/* a' +
          'nd cc.datq_c = lanc.data*/) = 0'
        
          '    --and (select count(*) from controle_cheque ch where ch.lote' +
          '_quit = lanc.lote_quit and ch.codigo_emp = lanc.codigo_emp/* and' +
          ' ch.datq_ch = lanc.data*/) = 0'
        ''
        '    and (select count(*) from formpagamento fp'
        
          '        left join lanccxl cxl on cxl.cod_lancxl = fp.nrequisicao' +
          ' and cxl.codigo_emp = fp.cod_empresa and fp.tpdocs = '#39'LCS'#39
        
          '        inner join p_contas p on p.n_conta_plc = lanc.n_conta_pl' +
          'c'
        '        inner join grupos_ct c on p.grup_ct = c.grup_ct'
        
          '        left join CONTROLES ctr on fp.cod_controle = ctr.codigo_' +
          'ctrl and fp.cod_empresa = ctr.codigo_emp'
        '        where fp.n_processamento = lanc.cod_lanc'
        
          '            and fp.cod_empresa = (case when(emp.financeiro_unifi' +
          'cado = '#39'S'#39') then lanc.cod_emp_mult else lanc.codigo_emp end)'
        '        and coalesce(p.tipo_ctp, '#39#39') <> '#39'F'#39' and c.tipo_gr <> '#39'S'#39
        '        and cxl.tipo_lanc_cxl = '#39'S'#39' and cxl.refrecibo = '#39'S'#39') = 0'
        ';'
        '|/BLOCO|'
        ''
        'ALTER TABLE PRODUTOS_TRIB_PF ADD USAR_MVA_ANEXOXV CHAR(1);'
        ''
        ''
        '|BLOCO|'
        '/*CREATE OR ALTER VIEW VW_FLUXO_CAIXA*/'
        '|/BLOCO|'
        ''
        
          'update RDB$FIELDS set RDB$FIELD_LENGTH = 256, RDB$CHARACTER_LENG' +
          'TH = 256 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'EMPRESA'#39') and (' +
          'r.rdb$field_name='#39'NFE_CAMINHO_CERT'#39'));'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDPROD_BIU_EVID_D4 FOR PEDVENDA_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  declare variable vndav integer;'
        '  declare variable vcodempresa integer;'
        '  declare variable vregistrar smallint;'
        '  declare variable vevidencias_paf varchar(255);'
        '  declare variable vchave_para_exclusao varchar(100);'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        '          '
        '  if (inserting) then'
        '  begin'
        '    vndav = coalesce(new.nprevenda, 0);'
        '    vcodempresa = coalesce(new.cod_empresa, 0);'
        '    if (coalesce(:vndav, 0) = 0) then'
        '    begin'
        
          '      select nprevenda from pedvenda where nped = new.nped and t' +
          'ipo = new.tipo and cod_empresa = new.cod_empresa into :vndav;'
        '      if (coalesce(:vndav, 0) > 0) then'
        '        new.nprevenda = :vndav;'
        '    end'
        '  end'
        '  else'
        '  begin'
        '    vndav = coalesce(old.nprevenda, 0);'
        '    vcodempresa = coalesce(old.cod_empresa, 0);'
        '  end'
        ''
        
          '  if ((coalesce(:vndav, 0) > 0) and (coalesce(:vcodempresa, 0) >' +
          ' 0)) then'
        '  begin'
        '    vregistrar = 0;'
        '    vevidencias_paf = cast(vndav as varchar(13)) || '#39'|'#39';'
        
          '    vevidencias_paf = vevidencias_paf || lpad(extract(day from c' +
          'urrent_timestamp), 2, '#39'0'#39') || '#39'/'#39' || lpad(extract(month from cur' +
          'rent_timestamp), 2, '#39'0'#39') || '#39'/'#39' || lpad(extract(year from curren' +
          't_timestamp), 4, '#39'0'#39') || '#39'|'#39';'
        
          '    vevidencias_paf = vevidencias_paf || lpad(extract(hour from ' +
          'current_time), 2, '#39'0'#39') || '#39':'#39' || lpad(extract(minute from curren' +
          't_time), 2, '#39'0'#39') || '#39':'#39' || lpad(extract(second from current_time' +
          '), 2, '#39'0'#39') || '#39'|'#39';'
        ''
        '    if (deleting) then'
        '    begin'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast(old.gru' +
          'po_prod as varchar(11)), '#39#39') || coalesce(old.cod_prod, '#39#39') || '#39'|' +
          #39';'
        
          '      vevidencias_paf = vevidencias_paf || rtrim(coalesce(old.nu' +
          'm_fab_prod, '#39#39')) || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.descr_pr' +
          'od_ped, '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.quant_ped_item as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39 +
          ';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.unidade,' +
          ' '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.vlun_ped_item as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.rateio_desc as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.rateio_acresc as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.vltot_ped_item as numeric(11, 4)) as varchar(32)), '#39#39') || '#39'|'#39 +
          ';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.sit_trib' +
          ', '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.icm_prod as numeric(11, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.status, ' +
          #39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.csdecqtd' +
          'e, '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.csdecvlu' +
          'nt, '#39#39') || '#39'|'#39';'
        '      vevidencias_paf = vevidencias_paf || '#39'E|'#39';'
        
          '      vchave_para_exclusao = rtrim(old.tipo)||'#39'|'#39'||old.nped||'#39'|'#39 +
          ';'
        '      vregistrar = 1;'
        
          '      if (coalesce(old.md5, '#39#39') = '#39#39') then -- criar registro ape' +
          'nas quando nao existir md5, pois foi incluido fora do sistema'
        '        vregistrar = 0;'
        '    end'
        '    else if ( (inserting) or ('
        
          '        (coalesce(new.grupo_prod,0) <> coalesce(old.grupo_prod,0' +
          ')) or (coalesce(new.cod_prod,'#39#39') <> coalesce(old.cod_prod, '#39#39')) ' +
          'or (coalesce(new.num_fab_prod,'#39#39') <> coalesce(old.num_fab_prod,'#39 +
          #39')) or'
        
          '        (coalesce(new.descr_prod_ped,'#39#39') <> coalesce(old.descr_p' +
          'rod_ped,'#39#39')) or (coalesce(new.quant_ped_item,0) <> coalesce(old.' +
          'quant_ped_item,0)) or (coalesce(new.unidade,'#39#39') <> coalesce(old.' +
          'unidade,'#39#39')) or'
        
          '        (coalesce(new.vlun_ped_item,0) <> coalesce(old.vlun_ped_' +
          'item,0)) or (coalesce(new.rateio_desc,0) <> coalesce(old.rateio_' +
          'desc,0)) or (coalesce(new.rateio_acresc,0) <> coalesce(old.ratei' +
          'o_acresc,0)) or'
        
          '        (coalesce(new.vltot_ped_item,0) <> coalesce(old.vltot_pe' +
          'd_item,0)) or (coalesce(new.sit_trib,'#39#39') <> coalesce(old.sit_tri' +
          'b, '#39#39')) or (coalesce(new.icm_prod,0) <> coalesce(old.icm_prod,0)' +
          ') or'
        
          '        (coalesce(new.csdecqtde,'#39#39') <> coalesce(old.csdecqtde,'#39#39 +
          ')) or (coalesce(new.csdecvlunt,'#39#39') <> coalesce(old.csdecvlunt,'#39#39 +
          ')) or (coalesce(new.status, '#39#39') <> coalesce(old.status, '#39#39'))'
        '      )) then'
        '    begin'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast(new.gru' +
          'po_prod as varchar(11)), '#39#39') || coalesce(new.cod_prod, '#39#39') || '#39'|' +
          #39';'
        
          '      vevidencias_paf = vevidencias_paf || rtrim(coalesce(new.nu' +
          'm_fab_prod, '#39#39')) || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.descr_pr' +
          'od_ped, '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.quant_ped_item as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39 +
          ';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.unidade,' +
          ' '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.vlun_ped_item as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.rateio_desc as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.rateio_acresc as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.vltot_ped_item as numeric(11, 4)) as varchar(32)), '#39#39') || '#39'|'#39 +
          ';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.sit_trib' +
          ', '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.icm_prod as numeric(11, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.status, ' +
          #39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.csdecqtd' +
          'e, '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.csdecvlu' +
          'nt, '#39#39') || '#39'|'#39';'
        
          '      vchave_para_exclusao = rtrim(new.tipo)||'#39'|'#39'||new.nped||'#39'|'#39 +
          ';'
        '      vregistrar = 1; '
        
          '      if (coalesce(new.md5, '#39#39') = '#39#39') then -- sem md5 nao foi o ' +
          'sistema que registrou, entao nao gera o D4'
        '        vregistrar = 0;'
        '      if (inserting) then'
        '      begin'
        '        vevidencias_paf = vevidencias_paf || '#39'I|'#39';'
        
          '        if (coalesce(new.md5, '#39#39') = '#39'SISTEMA0'#39') then -- SISTEMA0' +
          ' ainda nao salvou o DAV, quer dizer que ele nao foi alterado,'
        
          '          vregistrar = 0;                            -- apenas q' +
          'uando o nped <> 0 quer dizer que a alteracao foi feita'
        '      end'
        '      else'
        '      begin'
        '        vevidencias_paf = vevidencias_paf || '#39'A|'#39';'
        '      end'
        '    end'
        ''
        '    if (:vregistrar = 1) then'
        
          '      insert into evidencias_paf (cod_empresa, registro, data_mo' +
          'vimento, campos_chave, valores_campos, dados_reg_paf)'
        
          '        values (:vcodempresa, '#39'D4'#39', current_date, '#39#39', :vchave_pa' +
          'ra_exclusao, :vevidencias_paf);'
        '  end'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDSERV_BIU_EVID_D4 FOR PEDVENDA_SERV'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  declare variable vndav integer;'
        '  declare variable vcodempresa integer;'
        '  declare variable vregistrar smallint;'
        '  declare variable vevidencias_paf varchar(255);'
        '  declare variable vchave_para_exclusao varchar(100);'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        '          '
        '  if (inserting) then'
        '  begin'
        '    vndav = coalesce(new.nprevenda, 0);'
        '    vcodempresa = coalesce(new.cod_empresa, 0);'
        '    if (coalesce(:vndav, 0) = 0) then'
        '    begin'
        
          '      select nprevenda from pedvenda where nped = new.nped and t' +
          'ipo = new.tipo and cod_empresa = new.cod_empresa into :vndav;'
        '      if (coalesce(:vndav, 0) > 0) then'
        '        new.nprevenda = :vndav;'
        '    end'
        '  end'
        '  else'
        '  begin'
        '    vndav = coalesce(old.nprevenda, 0);'
        '    vcodempresa = coalesce(old.cod_empresa, 0);'
        '  end'
        ''
        
          '  if ((coalesce(:vndav, 0) > 0) and (coalesce(:vcodempresa, 0) >' +
          ' 0)) then'
        '  begin'
        '    vregistrar = 0;'
        '    vevidencias_paf = cast(vndav as varchar(13)) || '#39'|'#39';'
        
          '    vevidencias_paf = vevidencias_paf || lpad(extract(day from c' +
          'urrent_timestamp), 2, '#39'0'#39') || '#39'/'#39' || lpad(extract(month from cur' +
          'rent_timestamp), 2, '#39'0'#39') || '#39'/'#39' || lpad(extract(year from curren' +
          't_timestamp), 4, '#39'0'#39') || '#39'|'#39';'
        
          '    vevidencias_paf = vevidencias_paf || lpad(extract(hour from ' +
          'current_time), 2, '#39'0'#39') || '#39':'#39' || lpad(extract(minute from curren' +
          't_time), 2, '#39'0'#39') || '#39':'#39' || lpad(extract(second from current_time' +
          '), 2, '#39'0'#39') || '#39'|'#39';'
        ''
        '    if (deleting) then'
        '    begin'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast(old.cod' +
          '_servico as varchar(11)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast(old.cod' +
          '_servico as varchar(11)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.desc_ser' +
          'v_ped, '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.quant_serv_ped as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39 +
          ';'
        '      vevidencias_paf = vevidencias_paf ||  '#39#39' || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.valor_un_serv as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.rateio_desc as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.rateio_acresc as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.valor_tot_serv as numeric(11, 4)) as varchar(32)), '#39#39') || '#39'|'#39 +
          ';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.sit_trib' +
          ', '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(o' +
          'ld.aliq_iss as numeric(11, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.status, ' +
          #39#39') || '#39'|'#39';'
        '      vevidencias_paf = vevidencias_paf || '#39'0'#39' || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(old.csdecvlu' +
          'nt, '#39#39') || '#39'|'#39';'
        '      vevidencias_paf = vevidencias_paf || '#39'E|'#39';'
        
          '      vchave_para_exclusao = rtrim(old.tipo)||'#39'|'#39'||old.nped||'#39'|'#39 +
          ';'
        '      vregistrar = 1;'
        
          '      if (coalesce(old.md5, '#39#39') = '#39#39') then -- criar registro ape' +
          'nas quando nao existir md5, pois foi incluido fora do sistema'
        '        vregistrar = 0;'
        '    end'
        '    else if ( (inserting) or ('
        
          '        (coalesce(new.cod_servico,0) <> coalesce(old.cod_servico' +
          ',0)) or (coalesce(new.desc_serv_ped,'#39#39') <> coalesce(old.desc_ser' +
          'v_ped,'#39#39')) or (coalesce(new.quant_serv_ped,0) <> coalesce(old.qu' +
          'ant_serv_ped,0)) or'
        
          '        (coalesce(new.valor_un_serv,0) <> coalesce(old.valor_un_' +
          'serv,0)) or (coalesce(new.rateio_desc,0) <> coalesce(old.rateio_' +
          'desc,0)) or (coalesce(new.rateio_acresc,0) <> coalesce(old.ratei' +
          'o_acresc,0)) or'
        
          '        (coalesce(new.valor_tot_serv,0) <> coalesce(old.valor_to' +
          't_serv,0)) or (coalesce(new.sit_trib,'#39#39') <> coalesce(old.sit_tri' +
          'b,'#39#39')) or (coalesce(new.aliq_iss,0) <> coalesce(old.aliq_iss,0))' +
          ' or'
        
          '        (coalesce(new.csdecvlunt,'#39#39') <> coalesce(old.csdecvlunt,' +
          #39#39')) or (coalesce(new.status, '#39#39') <> coalesce(old.status, '#39#39'))'
        '      )) then'
        '    begin'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast(new.cod' +
          '_servico as varchar(11)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast(new.cod' +
          '_servico as varchar(11)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.desc_ser' +
          'v_ped, '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.quant_serv_ped as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39 +
          ';'
        '      vevidencias_paf = vevidencias_paf ||  '#39#39' || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.valor_un_serv as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.rateio_desc as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.rateio_acresc as numeric(10, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.valor_tot_serv as numeric(11, 4)) as varchar(32)), '#39#39') || '#39'|'#39 +
          ';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.sit_trib' +
          ', '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(cast( cast(n' +
          'ew.aliq_iss as numeric(11, 4)) as varchar(32)), '#39#39') || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.status, ' +
          #39#39') || '#39'|'#39';'
        '      vevidencias_paf = vevidencias_paf || '#39'0'#39' || '#39'|'#39';'
        
          '      vevidencias_paf = vevidencias_paf || coalesce(new.csdecvlu' +
          'nt, '#39#39') || '#39'|'#39';'
        
          '      vchave_para_exclusao = rtrim(new.tipo)||'#39'|'#39'||new.nped||'#39'|'#39 +
          ';'
        '      vregistrar = 1; '
        
          '      if (coalesce(new.md5, '#39#39') = '#39#39') then -- sem md5 nao foi o ' +
          'sistema que registrou, entao nao gera o D4'
        '        vregistrar = 0;'
        '      if (inserting) then'
        '      begin'
        '        vevidencias_paf = vevidencias_paf || '#39'I|'#39';'
        
          '        if (coalesce(new.md5, '#39#39') = '#39'SISTEMA0'#39') then -- SISTEMA0' +
          ' ainda nao salvou o DAV, quer dizer que ele nao foi alterado,'
        
          '          vregistrar = 0;                            -- apenas q' +
          'uando o nped <> 0 quer dizer que a alteracao foi feita'
        '      end'
        '      else'
        '      begin'
        '        vevidencias_paf = vevidencias_paf || '#39'A|'#39';'
        '      end'
        '    end'
        ''
        '    if (:vregistrar = 1) then'
        
          '      insert into evidencias_paf (cod_empresa, registro, data_mo' +
          'vimento, campos_chave, valores_campos, dados_reg_paf)'
        
          '        values (:vcodempresa, '#39'D4'#39', current_date, '#39#39', :vchave_pa' +
          'ra_exclusao, :vevidencias_paf);'
        '  end'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CEP_BI FOR CEP'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (COALESCE(NEW.COD_CEP, 0) = 0) THEN'
        '    NEW.COD_CEP = GEN_ID(GEN_CEP_ID,1);'
        'END'
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
        
          'case when (coalesce(pg.valor_pago, 0) > 0) then coalesce(pg.valo' +
          'r_pago, 0) else coalesce(pg.valor_ctp, 0) end,'
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
        
          'CREATE EXCEPTION EXC_RI_DUPLICIDADE '#39'Duplicidade de ocorrencia d' +
          'a tabela + empresa em schemas diferentes'#39';'
        
          'CREATE EXCEPTION EXC_RI_EXCE_KEY '#39'Campo chave nao pode ser uma e' +
          'xcessao'#39';'
        
          'CREATE EXCEPTION EXC_RI_EXCE_NOT_EXISTS '#39'Campo n'#227'o existe na tab' +
          'ela'#39';'
        
          'CREATE EXCEPTION EXC_RI_FEMP_KEY '#39'Campo da empresa nao pode ser ' +
          'informado aqui'#39';'
        
          'CREATE EXCEPTION EXC_RI_WHERE_KEY '#39'Campo chave nao pode ser inse' +
          'rido aqui'#39';'
        
          'CREATE EXCEPTION EXC_RI_TAB_ALT_NOT_ALLOW '#39'N'#227'o '#233' permitido alter' +
          'acao de tabelas, apenas Inserir e Remover'#39';'
        
          'CREATE EXCEPTION EXC_RI_TAB_FEMP_NOT_EXISTS '#39'Tabela sem campo ch' +
          'ave sendo codigo da empresa nao necessita de replicacao interna'#39 +
          ';'
        
          'CREATE EXCEPTION EXC_RI_TAB_NOT_EXISTS '#39'Tabela nao existe no ban' +
          'co de dados'#39';'
        
          'CREATE EXCEPTION EXC_RI_TAB_SCHEMA_EXIST '#39'Registro nao pode ser ' +
          'excluido, j'#225' existe em um schema'#39';'
        
          'CREATE EXCEPTION EXC_RI_TAB_NOTREP '#39'Tabela configurada para nao ' +
          'utilizar replicacao interna'#39';'
        
          'CREATE EXCEPTION EXC_RI_TAB_JACONF '#39'Tabela ja configurada para r' +
          'eplicacao interna versao banco'#39';'
        ''
        '|BLOCO|'
        'CREATE OR ALTER PROCEDURE SPDB_COUNT_PK('
        '    TABELA VARCHAR(31))'
        'RETURNS ('
        '    COUNTPK SMALLINT)'
        'AS'
        'begin'
        '  COUNTPK = 0;'
        '  select count(SG.RDB$FIELD_NAME) as FIELD_NAME'
        '--  from RDB$INDICES IX'
        
          '--    inner join RDB$INDEX_SEGMENTS SG on IX.RDB$INDEX_NAME = SG' +
          '.RDB$INDEX_NAME'
        
          '--    inner join RDB$RELATION_CONSTRAINTS RC on RC.RDB$INDEX_NAM' +
          'E = IX.RDB$INDEX_NAME'
        '  from RDB$RELATION_CONSTRAINTS RC'
        
          '    inner join RDB$INDICES IX on RC.RDB$INDEX_NAME = IX.RDB$INDE' +
          'X_NAME'
        
          '    inner join RDB$INDEX_SEGMENTS SG on IX.RDB$INDEX_NAME = SG.R' +
          'DB$INDEX_NAME'
        '  where RC.RDB$CONSTRAINT_TYPE = '#39'PRIMARY KEY'#39' and'
        '        RC.RDB$RELATION_NAME = :TABELA'
        '    into :COUNTPK;'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER PROCEDURE SPDB_EMP_KEY('
        '    TABELA VARCHAR(31))'
        'RETURNS ('
        '    CAMPO_EMP VARCHAR(31))'
        'AS'
        'begin'
        '  select first 1 TRIM(SG.RDB$FIELD_NAME) as FIELD_NAME'
        '  from RDB$RELATION_CONSTRAINTS RC'
        
          '    inner join RDB$INDICES IX on RC.RDB$INDEX_NAME = IX.RDB$INDE' +
          'X_NAME'
        
          '    inner join RDB$INDEX_SEGMENTS SG on IX.RDB$INDEX_NAME = SG.R' +
          'DB$INDEX_NAME'
        '    where RC.RDB$CONSTRAINT_TYPE = '#39'PRIMARY KEY'#39' and'
        '          SG.RDB$FIELD_NAME like '#39'%COD%EMP%'#39' and'
        '          RC.RDB$RELATION_NAME = :TABELA'
        '    order by SG.RDB$FIELD_POSITION'
        '      into :CAMPO_EMP;'
        '  CAMPO_EMP = trim(coalesce(CAMPO_EMP, '#39#39'));'
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER PROCEDURE SPDB_FIELDS('
        '    TABELA VARCHAR(31))'
        'RETURNS ('
        '    FIELDNAME VARCHAR(31),'
        '    FTYPE SMALLINT,'
        '    FSUBTYPE SMALLINT,'
        '    FIELDTYPE VARCHAR(32),'
        '    FIELDTYPE2 VARCHAR(32))'
        'AS'
        'begin'
        
          '  for select trim(RF.RDB$FIELD_NAME), F.RDB$FIELD_TYPE, F.RDB$FI' +
          'ELD_SUB_TYPE,'
        '             case F.RDB$FIELD_TYPE'
        '               when 7 then case F.RDB$FIELD_SUB_TYPE'
        '                             when 0 then '#39'SMALLINT'#39
        '                             when 1 then '#39'NUMERIC'#39
        '                             when 2 then '#39'DECIMAL'#39
        '                           end'
        '               when 8 then case F.RDB$FIELD_SUB_TYPE'
        '                             when 0 then '#39'INTEGER'#39
        '                             when 1 then '#39'NUMERIC'#39
        '                             when 2 then '#39'DECIMAL'#39
        '                           end'
        '               when 10 then '#39'FLOAT'#39
        '               when 12 then '#39'DATE'#39
        '               when 13 then '#39'TIME'#39
        '               when 14 then '#39'CHAR'#39
        '               when 16 then case F.RDB$FIELD_SUB_TYPE'
        '                              when 0 then '#39'BIGINT'#39
        '                              when 1 then '#39'NUMERIC'#39
        '                              when 2 then '#39'DECIMAL'#39
        '                            end'
        '               when 27 then '#39'DOUBLE'#39
        '               when 35 then '#39'TIMESTAMP'#39
        '               when 37 then '#39'VARCHAR'#39
        '               when 261 then '#39'BLOB '#39' || F.RDB$FIELD_SUB_TYPE'
        '               else F.RDB$FIELD_TYPE || '#39'?'#39
        '             end FIELD_TYPE,'
        '             case F.RDB$FIELD_TYPE'
        '               when 7 then case F.RDB$FIELD_SUB_TYPE'
        '                             when 0 then '#39'INT'#39
        '                             when 1 then '#39'DOUBLE'#39
        '                             when 2 then '#39'DOUBLE'#39
        '                           end'
        '               when 8 then case F.RDB$FIELD_SUB_TYPE'
        '                             when 0 then '#39'INT'#39
        '                             when 1 then '#39'DOUBLE'#39
        '                             when 2 then '#39'DOUBLE'#39
        '                           end'
        '               when 10 then '#39'DOUBLE'#39
        '               when 12 then '#39'DATETIME'#39
        '               when 13 then '#39'DATETIME'#39
        '               when 14 then '#39'STRING'#39
        '               when 16 then case F.RDB$FIELD_SUB_TYPE'
        '                              when 0 then '#39'INT'#39
        '                              when 1 then '#39'DOUBLE'#39
        '                              when 2 then '#39'DOUBLE'#39
        '                            end'
        '               when 27 then '#39'DOUBLE'#39
        '               when 35 then '#39'DATETIME'#39
        '               when 37 then '#39'STRING'#39
        '               when 261 then '#39'BLOB '#39' || F.RDB$FIELD_SUB_TYPE'
        '               else F.RDB$FIELD_TYPE || '#39'?'#39
        '             end FIELD_TYPE2'
        '      from RDB$RELATION_FIELDS RF'
        
          '        join RDB$FIELDS F on (F.RDB$FIELD_NAME = RF.RDB$FIELD_SO' +
          'URCE)'
        '      where (RF.RDB$RELATION_NAME = :TABELA) and'
        '            (coalesce(RF.RDB$SYSTEM_FLAG, 0) = 0) and'
        '            (F.RDB$COMPUTED_SOURCE is null)'
        '      order by RF.RDB$FIELD_POSITION'
        
          '        into :FIELDNAME, :FTYPE, :FSUBTYPE, :FIELDTYPE, :FIELDTY' +
          'PE2'
        '  do'
        '    suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER PROCEDURE SPDB_IS_PK('
        '    TABELA VARCHAR(31),'
        '    CAMPO VARCHAR(31))'
        'RETURNS ('
        '    ISPK SMALLINT)'
        'AS'
        'begin'
        '  ISPK = 0;'
        '  for select count(SG.RDB$FIELD_NAME) as FIELD_NAME'
        '      from RDB$RELATION_CONSTRAINTS RC'
        
          '        inner join RDB$INDICES IX on RC.RDB$INDEX_NAME = IX.RDB$' +
          'INDEX_NAME'
        
          '        inner join RDB$INDEX_SEGMENTS SG on IX.RDB$INDEX_NAME = ' +
          'SG.RDB$INDEX_NAME'
        '      where RC.RDB$CONSTRAINT_TYPE = '#39'PRIMARY KEY'#39' and'
        '            RC.RDB$RELATION_NAME = :TABELA and'
        '            SG.RDB$FIELD_NAME = :CAMPO'
        '        into :ISPK'
        '  do'
        '    suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER PROCEDURE SPDB_TABLES'
        'RETURNS ('
        '    TABELA VARCHAR(31))'
        'AS'
        'begin'
        '  for select R.RDB$RELATION_NAME'
        '      from RDB$RELATIONS R'
        
          '      where ((R.RDB$SYSTEM_FLAG = 0) or (R.RDB$SYSTEM_FLAG is nu' +
          'll)) and'
        '            (R.RDB$VIEW_SOURCE is null)'
        '      order by RDB$RELATION_NAME'
        '        into :TABELA'
        '  do'
        '    suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE RI_SCHEMA ('
        '    ID    INTEGER NOT NULL,'
        '    NOME  VARCHAR(64)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RI_SCHEMA ADD CONSTRAINT PK_RI_SCHEMA PRIMARY KEY (I' +
          'D);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER RI_SCHEMA_BI_NEWID FOR RI_SCHEMA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  select max(ID) + 1'
        '  from RI_SCHEMA'
        '    into new.ID;'
        ''
        '  if (new.ID is null) then'
        '    new.ID = 1;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE RI_SCHEMA_EMP ('
        '    SCHEMA_ID   INTEGER NOT NULL,'
        '    EMPRESA_ID  INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RI_SCHEMA_EMP ADD CONSTRAINT PK_RI_SCHEMA_EMP PRIMAR' +
          'Y KEY (SCHEMA_ID, EMPRESA_ID);'
        
          'ALTER TABLE RI_SCHEMA_EMP ADD CONSTRAINT FK_RI_SCHEMA_EMP_E FORE' +
          'IGN KEY (EMPRESA_ID) REFERENCES EMPRESA (COD_EMPRESA) ON DELETE ' +
          'CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE RI_SCHEMA_EMP ADD CONSTRAINT FK_RI_SCHEMA_EMP_S FORE' +
          'IGN KEY (SCHEMA_ID) REFERENCES RI_SCHEMA (ID) ON DELETE CASCADE ' +
          'ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE RI_SCHEMA_TAB ('
        '    ID         SMALLINT NOT NULL,'
        '    SCHEMA_ID  INTEGER NOT NULL,'
        '    TABELA     VARCHAR(31) NOT NULL,'
        '    TIPO_ID    SMALLINT DEFAULT 0'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RI_SCHEMA_TAB ADD CONSTRAINT PK_RI_SCHEMA_TAB PRIMAR' +
          'Y KEY (ID);'
        
          'ALTER TABLE RI_SCHEMA_TAB ADD CONSTRAINT FK_RI_SCHEMA_TAB FOREIG' +
          'N KEY (SCHEMA_ID) REFERENCES RI_SCHEMA (ID) ON DELETE CASCADE ON' +
          ' UPDATE CASCADE;'
        
          'CREATE UNIQUE INDEX IDX_SCHEMA_TAB ON RI_SCHEMA_TAB (SCHEMA_ID, ' +
          'TABELA);'
        ''
        '|BLOCO|'
        'CREATE GLOBAL TEMPORARY TABLE RI_TMP_SQL ('
        '    ID       INTEGER NOT NULL,'
        '    SQLEXEC  BLOB SUB_TYPE 1 SEGMENT SIZE 512'
        ') ON COMMIT DELETE ROWS;'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RI_TMP_SQL ADD CONSTRAINT PK_RI_TMP_SQL PRIMARY KEY ' +
          '(ID);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER RI_SCHEMA_EMP_BI_CHECKDUP FOR RI_SCHEMA_' +
          'EMP'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'as'
        '  declare variable TABELA varchar(31);'
        '  declare variable CONT integer;'
        'begin'
        '  for select TABELA'
        '      from RI_SCHEMA_TAB T'
        '      where T.SCHEMA_ID = new.SCHEMA_ID'
        '        into :TABELA'
        '  do'
        '  begin'
        '    for select count(*)'
        '        from RI_SCHEMA S'
        '          inner join RI_SCHEMA_TAB T on T.SCHEMA_ID = S.ID'
        '          inner join RI_SCHEMA_EMP E on E.SCHEMA_ID = S.ID'
        '        where T.TABELA = :tabela and'
        '              E.EMPRESA_ID = new.EMPRESA_ID and'
        '              T.SCHEMA_ID <> new.SCHEMA_ID'
        '          into :CONT'
        '    do'
        '      if (CONT >= 1) then'
        '        exception EXC_RI_DUPLICIDADE;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE RI_TAB_NOTREP ('
        '    TABELA  VARCHAR(31) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RI_TAB_NOTREP ADD CONSTRAINT PK_RI_TAB_NOTREP PRIMAR' +
          'Y KEY (TABELA);'
        ''
        '|BLOCO|'
        'create or alter procedure SPRI_TABLES_NOTREP'
        'returns ('
        '    TABELA varchar(31),'
        '    ORIGEM smallint)'
        'as'
        'begin'
        '  for select TABELA, 1'
        '      from RI_TAB_NOTREP'
        '    union distinct'
        '    select T.TABELA, 0'
        '      from SPDB_TABLES T'
        '        inner join SPDB_EMP_KEY(T.TABELA) EK on 1 = 1'
        '      where EK.CAMPO_EMP <> '#39#39' and'
        '            T.TABELA in ( '#39'AGENDA'#39','
        '                          '#39'AGENDAMENTO'#39','
        '                          '#39'AGENDA_ITENS'#39','
        '                          '#39'ANOTACOES'#39','
        '                          '#39'APURACAO_BALANCO'#39','
        '                          '#39'APURACAO_DEPTO'#39','
        '                          '#39'ARQ_FABRICA'#39','
        '                          '#39'ATESTADO_ECF'#39','
        '                          '#39'AT_TERMINAIS'#39','
        '                          '#39'BAIXA_CREDITOS'#39','
        '                          '#39'BALANCO_PRODUTOS'#39','
        '                          '#39'BANDEIRAS_CARTAO'#39','
        '                          '#39'BOLETAS'#39','
        '                          '#39'BOX'#39','
        '                          '#39'CADASTROS_EMP'#39','
        '                          '#39'CARGA'#39','
        '                          '#39'CARGA_ITEM'#39','
        '                          '#39'CARGA_ITEM_HISTORICO'#39','
        '                          '#39'CATEGORIA'#39','
        '                          '#39'CHASSI_A_PAGAR'#39','
        '                          '#39'CLIENTES_COM_CONTRATO'#39','
        '                          '#39'CLIENTES_CONTATO'#39','
        '                          '#39'CLIENTES_END_DOC_ADD'#39','
        '                          '#39'CLIENTES_TRIB_AD'#39','
        '                          '#39'COBREBEM'#39','
        '                          '#39'CODIGO'#39','
        '                          '#39'CODIGO_FORNECEDOR'#39','
        '                          '#39'COD_GRADE_BALANCO'#39','
        '                          '#39'COD_GRADE_PROD_COMPRA'#39','
        '                          '#39'COD_GRADE_PROD_VENDA'#39','
        '                          '#39'COMISSAO_CONSORCIO'#39','
        '                          '#39'COM_FAT'#39','
        '                          '#39'CONFERENCIA_CEGA'#39','
        '                          '#39'CONFERENCIA_CEGA_ITENS'#39','
        '                          '#39'CONFIG_API'#39','
        '                          '#39'CONFIG_EMAILMARK'#39','
        '                          '#39'CONSULTA_CREDCL'#39','
        '                          '#39'CONTAS_A_PAGAR'#39','
        '                          '#39'CONTASBANCARIAS'#39','
        '                          '#39'CONTA_CORRENTE_PROG_FIDELIDADE'#39','
        '                          '#39'CONTROLE_ALMOXARIFADO'#39','
        '                          '#39'CONTROLE_CHEQUE'#39','
        '                          '#39'CONTROLE_CREDITOS'#39','
        '                          '#39'COTACAO'#39','
        '                          '#39'COTACAO_ITENS'#39','
        '                          '#39'COTACAO_P'#39','
        '                          '#39'CREDITOS_LANC'#39','
        '                          '#39'CUPOM'#39','
        '                          '#39'CUPOM2'#39','
        '                          '#39'CUPOM_EMIT'#39','
        '                          '#39'CUSTOS'#39','
        '                          '#39'DADOS_JSON'#39','
        '                          '#39'DEL_CA'#39','
        '                          '#39'DEL_EC'#39','
        '                          '#39'DEL_MOBILE'#39','
        '                          '#39'DEL_TABELA'#39','
        '                          '#39'DEPRECIACAO'#39','
        '                          '#39'DESPESAS'#39','
        '                          '#39'DESPESAS_LANC'#39','
        '                          '#39'DESPESAS_LANC_ITENS'#39','
        '                          '#39'DESPESAS_US'#39','
        '                          '#39'DESPESAS_VEIC'#39','
        '                          '#39'DEVOLUCAO'#39','
        '                          '#39'DOC_ELETRONICO'#39','
        '                          '#39'DOC_NAOFISCAL_TERMINAL'#39','
        '                          '#39'ECF'#39','
        '                          '#39'EFD_ICMSST_CR_APURACAO'#39','
        '                          '#39'EMAIL_MARKETING'#39','
        '                          '#39'EMPDESVOLV'#39','
        '                          '#39'EMPRESA'#39','
        '                          '#39'EMPRESA_FISICA'#39','
        '                          '#39'EMPRESA_PROG_FID'#39','
        '                          '#39'EMPRESA_SUBSTITUTO'#39','
        '                          '#39'END_PCLIENTES'#39','
        '                          '#39'ENT_MOTO'#39','
        '                          '#39'ENT_MOTO_ITENS'#39','
        '                          '#39'EQUIPAMENTO'#39','
        '                          '#39'ESTOQUES_SIS'#39','
        '                          '#39'ESTOQUE_AJUSTE'#39','
        '                          '#39'ESTOQUE_AJUSTE_ITENS'#39','
        '                          '#39'ESTOQUE_DIARIO'#39','
        '                          '#39'ESTOQUE_INI'#39','
        '                          '#39'ESTOQUE_INI_GRADE'#39','
        '                          '#39'EST_MOTO'#39','
        '                          '#39'EVIDENCIAS_PAF'#39','
        '                          '#39'FECD_CXL'#39','
        '                          '#39'FECHM'#39','
        '                          '#39'FECH_DIA'#39','
        '                          '#39'FIELDSOLAP'#39','
        '                          '#39'FIELDS_POSOLAP'#39','
        '                          '#39'FIELDSOLAP_SALVOS'#39','
        '                          '#39'FILA_RESERVA_VEIC'#39','
        '                          '#39'FINALIZADORES'#39','
        '                          '#39'FINCUPOM'#39','
        '                          '#39'FLW_ATENDIMENTO'#39','
        '                          '#39'FLW_PESQUISA'#39','
        '                          '#39'FLW_RESPOSTA'#39','
        '                          '#39'FLW_RESPOSTACOMPLEMENTO'#39','
        '                          '#39'FORMAS_ENVIO_EC'#39','
        '                          '#39'FORMPAGAMENTO'#39','
        '                          '#39'FORMPAGAMENTO_EC'#39','
        '                          '#39'FORNECEDOR'#39','
        '                          '#39'FORNEC_D'#39','
        '                          '#39'FREQTEMP'#39','
        '                          '#39'GERADOR_OSBOL'#39','
        '                          '#39'HISTC_CLIENTE'#39','
        '                          '#39'HISTC_VEICULO'#39','
        '                          '#39'HIST_ESTMOTO'#39','
        '                          '#39'HIST_ESTOQUE_DIARIO'#39','
        '                          '#39'HIST_ESTOQUE_DIARIO_PROD'#39','
        '                          '#39'HIST_REC'#39','
        '                          '#39'IMP_BAR_PROD'#39','
        '                          '#39'INTERMEDIADOR_CONTROLE_EC'#39','
        '                          '#39'INV_BALANCO'#39','
        '                          '#39'INV_TIPO74'#39','
        '                          '#39'INV_TIPO74_POSSE'#39','
        '                          '#39'INV_TIPO74_SPED_SINT'#39','
        '                          '#39'ITEMPROD_ORC'#39','
        '                          '#39'ITEMPROD_ORC_TERC'#39','
        '                          '#39'ITEMSERV_ORC'#39','
        '                          '#39'ITEMSR_NFVENDA'#39','
        '                          '#39'ITEM_NFVENDA'#39','
        '                          '#39'ITEM_NF_ENTRADA'#39','
        '                          '#39'ITEM_OUTRAS_NF'#39','
        '                          '#39'ITEM_PEDIDO'#39','
        '                          '#39'ITEM_PEDIDO_NF_REC'#39','
        '                          '#39'ITENS_CARTA'#39','
        '                          '#39'ITENS_CARTA_CRED'#39','
        '                          '#39'KITS_PROD_CATEGORIA'#39','
        '                          '#39'KITS_PROD_EC'#39','
        '                          '#39'LANCAMENTOS'#39','
        '                          '#39'LANCAMENTO_PAG'#39','
        '                          '#39'LANCCHEQUE'#39','
        '                          '#39'LANCCXL'#39','
        '                          '#39'LANC_DEBCRED'#39','
        '                          '#39'LEMBRETE_AGENDA'#39','
        '                          '#39'LISTA_COTACAO'#39','
        '                          '#39'LISTA_COTACAO_ITENS'#39','
        '                          '#39'LOG_ESTOQUE'#39','
        '                          '#39'LOTE_CXL'#39','
        '                          '#39'LOTE_LANC'#39','
        '                          '#39'LOTE_QUIT'#39','
        '                          '#39'MANUTENCAO'#39','
        '                          '#39'MAPA_RESUMO_ALIQ'#39','
        '                          '#39'MDFE'#39','
        '                          '#39'MDFE_CARREGA'#39','
        '                          '#39'MDFE_CONDUTOR'#39','
        '                          '#39'MDFE_DESCARGA'#39','
        '                          '#39'MDFE_DESCARGA_NFE'#39','
        '                          '#39'MDFE_DESCARGA_NFE_UN_TR'#39','
        '                          '#39'MDFE_DESCARGA_NFE_UN_TR_CARGA'#39','
        '                          '#39'MECANICO_OS'#39','
        '                          '#39'MENSAGEM_MOB'#39','
        '                          '#39'MENUS_AUTO'#39','
        '                          '#39'MOT_VEN'#39','
        '                          '#39'MOVIMENTO_CIAP'#39','
        '                          '#39'MOVIMENTO_PDV_FINAN'#39','
        '                          '#39'MTUSADAS'#39','
        '                          '#39'NFCE'#39','
        '                          '#39'NFCE_CONFIG'#39','
        '                          '#39'NFCE_DEST'#39','
        '                          '#39'NFCE_INFADIC'#39','
        '                          '#39'NFCE_ITEM'#39','
        '                          '#39'NFCE_MOVIMENTO'#39','
        '                          '#39'NFCE_MOVIMENTO_LANC'#39','
        '                          '#39'NFCE_PAGAMENTO'#39','
        '                          '#39'NFC_CENTRAL_ACOES'#39','
        '                          '#39'NFC_EMISSOR'#39','
        '                          '#39'NFSE_CANCELADAS'#39','
        '                          '#39'NF_DESTINADAS'#39','
        '                          '#39'NF_ENTRADA'#39','
        '                          '#39'NF_SERIE_D'#39','
        '                          '#39'NF_SERIE_D_ITENS'#39','
        '                          '#39'NF_TRANSITO'#39','
        '                          '#39'NF_VENDA'#39','
        '                          '#39'NOTAFISCAL'#39','
        '                          '#39'NOTAFISCAL_CARTA_CORRECAO'#39','
        '                          '#39'NOTAFISCAL_COLETA_ENTREGA'#39','
        '                          '#39'NOTAFISCAL_DUP'#39','
        '                          '#39'NOTAFISCAL_INUT'#39','
        '                          '#39'NOTAFISCAL_ITEM'#39','
        '                          '#39'NOTAFISCAL_ITEM_ADI'#39','
        '                          '#39'NOTAFISCAL_ITEM_DETEXPORT'#39','
        '                          '#39'NOTAFISCAL_ITEM_DI'#39','
        '                          '#39'NOTAFISCAL_ITEM_ECF'#39','
        '                          '#39'NOTAFISCAL_ITEM_EXPORTIND'#39','
        '                          '#39'NOTAFISCAL_ITEM_VEICULO'#39','
        '                          '#39'NOTAFISCAL_ITEM_VFE'#39','
        '                          '#39'NOTAFISCAL_OBSCONT'#39','
        '                          '#39'NOTAFISCAL_PAG'#39','
        '                          '#39'NOTAFISCAL_SPED_C110'#39','
        '                          '#39'NOTAFISCAL_SPED_C111'#39','
        '                          '#39'NOTAFISCAL_SPED_C112'#39','
        '                          '#39'NOTAFISCAL_SPED_C113'#39','
        '                          '#39'NOTAFISCAL_SPED_C114'#39','
        '                          '#39'NOTAFISCAL_SPED_C115'#39','
        '                          '#39'NOTAFISCAL_SPED_C120'#39','
        '                          '#39'NOTAFISCAL_SPED_C195_C197'#39','
        '                          '#39'NOTAS_EMITIDAS'#39','
        '                          '#39'NOTIFICACAO_CREDITOS'#39','
        '                          '#39'OBSERVACAO'#39','
        '                          '#39'OCORRENCIAS_OS'#39','
        '                          '#39'OCORRENCIA_SUG'#39','
        '                          '#39'OPPRODUTOS'#39','
        '                          '#39'ORCAMENTOS'#39','
        '                          '#39'ORC_SERV_TERCEIRO'#39','
        '                          '#39'ORDEM_SERV'#39','
        '                          '#39'OS_ITEM_PROD'#39','
        '                          '#39'OS_ITEM_SERV'#39','
        '                          '#39'OS_PROD_TERC'#39','
        '                          '#39'OUTRAS_NF'#39','
        '                          '#39'PAF_DOC_BASE_ATEST'#39','
        '                          '#39'PARAMETROS_DADOSADICIONAIS'#39','
        '                          '#39'PEDIDO'#39','
        '                          '#39'PEDVENDA'#39','
        '                          '#39'PEDVENDA_D'#39','
        '                          '#39'PEDVENDA_INV_POSSE'#39','
        '                          '#39'PEDVENDA_PROD'#39','
        '                          '#39'PEDVENDA_PROD_COND_DEV'#39','
        '                          '#39'PEDVENDA_PROD_CONF'#39','
        '                          '#39'PEDVENDA_PROD_D'#39','
        '                          '#39'PEDVENDA_PROD_TERC'#39','
        '                          '#39'PEDVENDA_REF_NF'#39','
        '                          '#39'PEDVENDA_SERV'#39','
        '                          '#39'PEDVENDA_SERV_TERC'#39','
        '                          '#39'PEDVENDA_VOLUMES'#39','
        '                          '#39'PENDENCIAS'#39','
        '                          '#39'PENDENCIAS_CARTAO'#39','
        '                          '#39'PENDENCIAS_VEIC'#39','
        '                          '#39'PEND_CCV'#39','
        '                          '#39'PLANO_PAG'#39','
        '                          '#39'PPS_PRODUTOS'#39','
        '                          '#39'PRESTACOES_FISCAL'#39','
        '                          '#39'PRODUCAO'#39','
        '                          '#39'PRODUCAO_ITEM'#39','
        '                          '#39'PRODUCAO_ITEM_INDICE'#39','
        '                          '#39'PRODUTOS_ALTERACOES'#39','
        '                          '#39'PRODUTOS_CATEGORIA'#39','
        '                          '#39'PRODUTOS_EC'#39','
        '                          '#39'PRODUTOS_EC_GRADE'#39','
        '                          '#39'PRODUTOS_FORN_NFE'#39','
        '                          '#39'PRODUTOS_TMP'#39','
        '                          '#39'P_CONTAS_BALANCO'#39','
        '                          '#39'P_CONTAS_M'#39','
        '                          '#39'RECIBOS'#39','
        '                          '#39'REC_CXL'#39','
        '                          '#39'REGRAS_VENDAS'#39','
        '                          '#39'REGRAVND_CONDPAG'#39','
        '                          '#39'REL_VNDH'#39','
        '                          '#39'REQVENDA'#39','
        '                          '#39'REQVENDAD'#39','
        '                          '#39'REQVENDA_ITENS'#39','
        '                          '#39'REQVENDA_ITENSD'#39','
        '                          '#39'RESERVAG'#39','
        '                          '#39'RESERVAGUS'#39','
        '                          '#39'RESERVA_ALMOXARIFADO'#39','
        '                          '#39'RESERVA_ALMOXARIFADO_ITENS'#39','
        '                          '#39'RESUMOD'#39','
        '                          '#39'ROTAS_ENTR_CLIENTE'#39','
        '                          '#39'SALDO_DEBCRED'#39','
        '                          '#39'SAL_CNT'#39','
        '                          '#39'SAL_CTRL'#39','
        '                          '#39'SANGSUP'#39','
        '                          '#39'SERVICO_TRANSPORTE'#39','
        '                          '#39'SERVTP_ORC'#39','
        '                          '#39'SERV_TERCEIRO'#39','
        '                          '#39'SINC_SEQID'#39','
        '                          '#39'SOLICITACOES_ACESSO'#39','
        '                          '#39'SPED_AQUISICAO_BENS'#39','
        '                          '#39'SPED_CONT_CRED_FISC'#39','
        '                          '#39'SPED_CONT_CRED_FISC_UTIL'#39','
        '                          '#39'SPED_DEPREC_AMORT_BENS'#39','
        '                          '#39'SPED_ESTOQUE_ABERTURA'#39','
        '                          '#39'SPED_F_ICMINTER_AJ'#39','
        '                          '#39'SPED_F_ICMINTER_AJ_INF_AD'#39','
        '                          '#39'SPED_F_ICMINTER_AJ_INF_DOC'#39','
        '                          '#39'SPED_F_ICMINTER_OB_DIFAL'#39','
        '                          '#39'SPED_ITEM'#39','
        '                          '#39'SPED_OUTRAS_RECEITAS_CREDITOS'#39','
        '                          '#39'SQLCONSULTASDIV'#39','
        '                          '#39'SUGESTAOCOMPRA'#39','
        '                          '#39'SUGESTAOCOMPRAIT'#39','
        '                          '#39'SUGESTAOSERVICO'#39','
        '                          '#39'SUG_OS'#39','
        '                          '#39'TEMP_SUG_SERV'#39','
        '                          '#39'TEMP_SUG_SERV_CL'#39','
        '                          '#39'TERMINALF'#39','
        '                          '#39'TERMINAL_CARTAO'#39','
        '                          '#39'TERMINAL_IMPRESSORAS'#39','
        '                          '#39'TIPO88_ICMSST_PERIODO'#39','
        '                          '#39'TMO_SERV_OS'#39','
        '                          '#39'TOTALIZADOR_NAOF'#39','
        '                          '#39'TRANSACAO_CARTAO'#39','
        '                          '#39'TRANSF_DEP'#39','
        '                          '#39'TRANSF_DEP_EST'#39','
        '                          '#39'TRANSITO_MOTOS'#39','
        '                          '#39'USER_CONSULTASDIV'#39','
        '                          '#39'VEICULOS'#39','
        '                          '#39'VALE_CUPONS'#39','
        '                          '#39'VALORES_CIAP'#39','
        '                          '#39'VENDA_PERDIDA'#39','
        '                          '#39'WSREPLICACAO_CONSULTAS'#39','
        '                          '#39'WSR_CADASTROSBASICOS'#39','
        '                          '#39'WSR_CAMPOS'#39','
        '                          '#39'WSR_CONSULTAS'#39','
        '                          '#39'WSR_DEPENDENCIAS'#39','
        '                          '#39'WSR_EMPRESAS'#39','
        '                          '#39'WSR_GENERATOR_CODIGO'#39','
        '                          '#39'WSR_REPL'#39','
        '                          '#39'WSR_SCHEMAS'#39','
        '                          '#39'WSR_SCRIPTS'#39','
        '                          '#39'WSR_TABELAS'#39','
        '                          '#39'WSR_TAB_CHAVESALTERADAS'#39')'
        '        into :TABELA, :ORIGEM'
        '  do'
        '    suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER RI_SCHEMA_TAB_BIU_CHECK FOR RI_SCHEMA_TA' +
          'B'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  declare variable EMPID integer;'
        '  declare variable CONT integer;'
        'begin'
        '  if (updating) then'
        
          '    if ((old.TABELA <> new.TABELA) or (old.SCHEMA_ID <> new.SCHE' +
          'MA_ID)) then'
        '      exception EXC_RI_TAB_ALT_NOT_ALLOW;'
        ''
        '  if (not deleting) then'
        '  begin'
        '    delete from TAB_REP'
        '    where TABELA = new.TABELA;'
        ''
        '    for select count(SN.TABELA)'
        '        from SPRI_TABLES_NOTREP SN'
        '        where SN.TABELA = new.TABELA'
        '          into :CONT'
        '    do'
        '      if (CONT >= 1) then'
        '        exception EXC_RI_TAB_NOTREP;'
        ''
        '    for select EMPRESA_ID'
        '        from RI_SCHEMA_EMP E'
        '        where E.SCHEMA_ID = new.SCHEMA_ID'
        '          into :EMPID'
        '    do'
        '    begin'
        '      for select count(*)'
        '          from RI_SCHEMA S'
        '            inner join RI_SCHEMA_TAB T on T.SCHEMA_ID = S.ID'
        '            inner join RI_SCHEMA_EMP E on E.SCHEMA_ID = S.ID'
        '            inner join EMPRESA N on N.COD_EMPRESA = E.EMPRESA_ID'
        '          where E.EMPRESA_ID = :EMPID and'
        '                T.TABELA = new.TABELA and'
        '                T.SCHEMA_ID <> new.SCHEMA_ID'
        '            into :CONT'
        '      do'
        '        if (CONT >= 1) then'
        '          exception EXC_RI_DUPLICIDADE;'
        '    end'
        '  end'
        ''
        '  if (inserting) then'
        '  begin'
        '    select max(ID) + 1'
        '    from RI_SCHEMA_TAB'
        '      into new.ID;'
        ''
        '    if (new.ID is null) then'
        '      new.ID = 1;'
        '  end'
        ''
        '  new.TIPO_ID = coalesce(new.TIPO_ID, 0);'
        ''
        '  if (not new.TIPO_ID in (0, 1)) then'
        '    new.TIPO_ID = 0;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'COMMENT ON COLUMN RI_SCHEMA_TAB.TIPO_ID IS'
        #39'0: Mesmo ID entre empresas. Ex (PRODUTOS, GRADES, ETC)'
        
          '1: IDs diferentes entre empresas. Ex (CLIENTES em casos que o ba' +
          'nco de 1 ou mais empresa foi mesclado, caso contrario pode ser a' +
          ' opcao 0), nesse caso usa-se a tabela codigo da empresa em quest' +
          'ao'#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE RI_SCHEMA_TAB_EXCE ('
        '    TABELA_ID  INTEGER NOT NULL,'
        '    CAMPO      VARCHAR(31) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RI_SCHEMA_TAB_EXCE ADD CONSTRAINT PK_RI_SCHEMA_TAB_E' +
          'XCE PRIMARY KEY (TABELA_ID, CAMPO);'
        
          'ALTER TABLE RI_SCHEMA_TAB_EXCE ADD CONSTRAINT FK_RI_SCHEMA_TAB_E' +
          'XCE FOREIGN KEY (TABELA_ID) REFERENCES RI_SCHEMA_TAB (ID) ON DEL' +
          'ETE CASCADE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER RI_SCHEMA_TAB_EXCE_BIU_CHECK FOR RI_SCHE' +
          'MA_TAB_EXCE'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'as'
        '  declare variable resp integer;'
        '  declare variable TABELA varchar(31);'
        '  declare variable FIELDNAME varchar(31);'
        'begin'
        '  for select TABELA'
        '      from RI_SCHEMA_TAB T'
        '      where T.ID = new.TABELA_ID'
        '        into :TABELA'
        '  do'
        '  begin'
        '    for select ISPK'
        '        from SPDB_IS_PK(:TABELA, new.CAMPO)'
        '          into :RESP'
        '    do'
        '      if (RESP = 1) then'
        '        exception EXC_RI_EXCE_KEY;'
        ''
        '    select count(F.FIELDNAME)'
        '      from SPDB_FIELDS(:TABELA) F'
        '      where F.FIELDNAME = new.CAMPO'
        '        into :RESP;'
        ''
        '    if (RESP = 0) then'
        '      exception EXC_RI_EXCE_NOT_EXISTS;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE RI_SCHEMA_TAB_WHERE ('
        '    TABELA_ID  INTEGER NOT NULL,'
        '    CAMPO      VARCHAR(31) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RI_SCHEMA_TAB_WHERE ADD CONSTRAINT PK_RI_SCHEMA_TAB_' +
          'WHERE PRIMARY KEY (TABELA_ID, CAMPO);'
        
          'ALTER TABLE RI_SCHEMA_TAB_WHERE ADD CONSTRAINT FK_RI_SCHEMA_TAB_' +
          'WHERE FOREIGN KEY (TABELA_ID) REFERENCES RI_SCHEMA_TAB (ID) ON D' +
          'ELETE CASCADE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER RI_SCHEMA_TAB_WHERE_BIU_CHECK FOR RI_SCH' +
          'EMA_TAB_WHERE'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'as'
        '  declare variable resp integer;'
        '  declare variable TABELA varchar(31);'
        'begin'
        '  for select TABELA'
        '      from RI_SCHEMA_TAB T'
        '      where T.ID = new.TABELA_ID'
        '        into :TABELA'
        '  do'
        '  begin'
        '    for select count(CAMPO_EMP)'
        '        from SPDB_EMP_KEY(:TABELA)'
        '        where CAMPO_EMP = new.CAMPO'
        '          into :RESP'
        '    do'
        '      if (RESP = 1) then'
        '        exception EXC_RI_FEMP_KEY;'
        ''
        '    for select ISPK'
        '        from SPDB_IS_PK(:TABELA, new.CAMPO)'
        '        where ISPK = 1'
        '          into :RESP'
        '    do'
        '        exception EXC_RI_WHERE_KEY;'
        ''
        '    select count(F.FIELDNAME)'
        '      from SPDB_FIELDS(:TABELA) F'
        '      where F.FIELDNAME = new.CAMPO'
        '        into :RESP;'
        ''
        '    if (RESP = 0) then'
        '      exception EXC_RI_EXCE_NOT_EXISTS;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER RI_SCHEMA_TAB_WHERE_AIUD0 FOR RI_SCHEMA_' +
          'TAB_WHERE'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  declare variable CONT integer;'
        'begin'
        '  select count(TABELA_ID)'
        '  from RI_SCHEMA_TAB_WHERE'
        '  where TABELA_ID = iif(deleting, old.TABELA_ID, new.TABELA_ID)'
        '    into :CONT;'
        ''
        '  update RI_SCHEMA_TAB'
        '  set TIPO_ID = iif(:CONT = 0, 0, 1)'
        '  where ID = iif(deleting, old.TABELA_ID, new.TABELA_ID);'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE GLOBAL TEMPORARY TABLE RI_DEP ('
        '    ORDEM   SMALLINT NOT NULL,'
        '    TABELA  VARCHAR(31)'
        ') ON COMMIT DELETE ROWS;'
        '|/BLOCO|'
        ''
        'CREATE UNIQUE INDEX IDX_RI_DEP ON RI_DEP (TABELA);'
        ''
        '|BLOCO|'
        'CREATE TABLE RI_TAB ('
        '    ID      INTEGER NOT NULL,'
        '    TABELA  VARCHAR(31) NOT NULL,'
        '    GUIDT   CHAR(36)'
        ');'
        '|/BLOCO|'
        ''
        'ALTER TABLE RI_TAB ADD CONSTRAINT PK_RI_TAB PRIMARY KEY (ID);'
        'CREATE UNIQUE INDEX IDX_RI_TAB ON RI_TAB (TABELA);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_RI_TAB_BIU FOR RI_TAB'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  declare variable EXISTE integer;'
        '  declare variable CAMPO_E varchar(31);'
        'begin'
        '  if (inserting) then'
        '  begin'
        '    select max(ID) + 1'
        '    from RI_TAB'
        '      into new.ID;'
        ''
        '    if (new.ID is null) then'
        '      new.ID = 1;'
        ''
        '    select UUID_TO_CHAR(gen_uuid())'
        '    from RDB$DATABASE'
        '      into new.GUIDT;'
        '  end'
        ''
        '  if (updating) then'
        '    if ((old.TABELA <> new.TABELA) or (old.ID <> new.ID)) then'
        '      exception EXC_RI_TAB_ALT_NOT_ALLOW;'
        ''
        '  if ((inserting) or (updating)) then'
        '  begin'
        '    select count(T.TABELA)'
        '    from SPDB_TABLES T'
        '    where T.TABELA = new.TABELA'
        '      into :EXISTE;'
        '  '
        '    if (EXISTE = 0) then'
        '      exception EXC_RI_TAB_NOT_EXISTS;'
        ''
        '    select E.CAMPO_EMP'
        '    from SPDB_EMP_KEY(new.TABELA) E'
        '      into :CAMPO_E;'
        ''
        '    if (CAMPO_E = '#39#39') then'
        '      exception EXC_RI_TAB_FEMP_NOT_EXISTS;'
        '  end'
        ''
        '  if (deleting) then'
        '  begin'
        '    select count(T.TABELA)'
        '    from RI_SCHEMA_TAB T'
        '    where T.TABELA = old.TABELA'
        '      into :EXISTE;'
        ''
        '    if (EXISTE > 0) then'
        '      exception EXC_RI_TAB_SCHEMA_EXIST;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER RI_TMP_SQL_NEWID FOR RI_TMP_SQL'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  select max(ID) + 1'
        '  from RI_TMP_SQL'
        '    into new.ID;'
        ''
        '  if (new.ID is null) then'
        '    new.ID = 1;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SPDB_RI_MAKE_DEP ('
        '    TABELA varchar(31))'
        'as'
        '  declare variable TAB_REL varchar(31);'
        '  declare variable MAXID integer;'
        '  declare variable EXISTE integer;'
        'begin'
        ''
        '  for select DISTINCT RF.RDB$RELATION_NAME TAB_REF'
        '      from RDB$INDICES IX'
        
          '        left join RDB$INDEX_SEGMENTS SG on IX.RDB$INDEX_NAME = S' +
          'G.RDB$INDEX_NAME'
        
          '        left join RDB$RELATION_CONSTRAINTS RC on RC.RDB$INDEX_NA' +
          'ME = IX.RDB$INDEX_NAME'
        
          '        left join RDB$RELATION_CONSTRAINTS RF on RF.RDB$INDEX_NA' +
          'ME = IX.RDB$FOREIGN_KEY'
        '      where RC.RDB$CONSTRAINT_TYPE = '#39'FOREIGN KEY'#39' and'
        '            RC.RDB$RELATION_NAME = :TABELA and'
        '            RF.RDB$RELATION_NAME <> :TABELA'
        '        into :TAB_REL'
        '  do'
        '  begin'
        ''
        '    TAB_REL = trim(coalesce(TAB_REL, '#39#39'));'
        ''
        '    EXISTE = 0;'
        '    select count(T.TABELA)'
        '    from RI_DEP T'
        '    where T.TABELA = :TAB_REL'
        '      into :EXISTE;'
        ''
        '    if (coalesce(EXISTE, 0) = 0) then'
        '    begin'
        '      execute procedure SPDB_RI_MAKE_DEP(:TAB_REL);'
        ''
        '      select max(T.ORDEM)'
        '      from RI_DEP T'
        '        into :MAXID;'
        '      MAXID = coalesce(MAXID, 0) + 1;'
        ''
        '      EXISTE = 0;'
        '      select count(T.TABELA)'
        '      from SPDB_TABLES T'
        '        left join SPDB_EMP_KEY(T.TABELA) P on 1 = 1'
        '      where T.TABELA = :TAB_REL and'
        '            P.CAMPO_EMP <> '#39#39
        '        into :EXISTE;'
        ''
        '      if (coalesce(EXISTE, 0) > 0) then'
        '        insert into RI_DEP (ORDEM, TABELA)'
        '        values (:MAXID, :TAB_REL);'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER PROCEDURE SPRI_SCHEMA('
        '    TABELA VARCHAR(31),'
        '    IDORIGEM INTEGER)'
        'RETURNS ('
        '    SCHEMA_ID INTEGER,'
        '    TIPO_ID SMALLINT)'
        'AS'
        'begin'
        '  select T.SCHEMA_ID, T.TIPO_ID'
        '  from RI_SCHEMA_TAB T'
        '    inner join RI_SCHEMA_EMP E on E.SCHEMA_ID = T.SCHEMA_ID'
        '  where T.TABELA = :TABELA and'
        '        E.EMPRESA_ID = :IDORIGEM'
        '    into :SCHEMA_ID, :TIPO_ID;'
        ''
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SPDB_FIELDS_FK ('
        '    TABELA varchar(31))'
        'returns ('
        '    TABLE_REF varchar(31),'
        '    PK_NAME varchar(31),'
        '    FIELDNAME varchar(31),'
        '    FK_NAME varchar(31),'
        '    TABLE_O varchar(31),'
        '    DELETE_CASCATA smallint,'
        '    UPDATE_CASCATA smallint)'
        'as'
        'begin'
        
          '  for select distinct trim(CONSTRAINTSDESTINO.RDB$RELATION_NAME)' +
          ' as TABLE_REF, trim(RDB$CONST_NAME_UQ) as PK_NAME,'
        
          '                      trim(INDICES.RDB$FIELD_NAME) as FIELDNAME,' +
          ' trim(CONSTRAINTSORIGEM.RDB$CONSTRAINT_NAME) as FK_NAME,'
        
          '                      trim(CONSTRAINTSORIGEM.RDB$RELATION_NAME) ' +
          'as TABLE_O,'
        
          '                      iif(RELACIONAMENTOS.RDB$DELETE_RULE = '#39'CAS' +
          'CADE'#39', 1, 0) DELETE_CASCATA,'
        
          '                      iif(RELACIONAMENTOS.RDB$UPDATE_RULE = '#39'CAS' +
          'CADE'#39', 1, 0) UPDATE_CASCATA'
        
          '      from RDB$RELATION_CONSTRAINTS CONSTRAINTSORIGEM, RDB$RELAT' +
          'ION_CONSTRAINTS CONSTRAINTSDESTINO, RDB$INDEX_SEGMENTS INDICES, ' +
          'RDB$REF_CONSTRAINTS RELACIONAMENTOS'
        '      where CONSTRAINTSORIGEM.RDB$RELATION_NAME = :TABELA and'
        
          '            CONSTRAINTSORIGEM.RDB$CONSTRAINT_TYPE = '#39'FOREIGN KEY' +
          #39' and'
        
          '            CONSTRAINTSORIGEM.RDB$INDEX_NAME = INDICES.RDB$INDEX' +
          '_NAME and'
        
          '            CONSTRAINTSORIGEM.RDB$CONSTRAINT_NAME = RELACIONAMEN' +
          'TOS.RDB$CONSTRAINT_NAME and'
        
          '            RELACIONAMENTOS.RDB$CONST_NAME_UQ = CONSTRAINTSDESTI' +
          'NO.RDB$CONSTRAINT_NAME'
        
          '      order by CONSTRAINTSDESTINO.RDB$RELATION_NAME, CONSTRAINTS' +
          'ORIGEM.RDB$CONSTRAINT_NAME, INDICES.RDB$FIELD_POSITION'
        
          '        into :TABLE_REF, :PK_NAME, :FIELDNAME, :FK_NAME, :TABLE_' +
          'O, :DELETE_CASCATA, :UPDATE_CASCATA'
        '  do'
        '    suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SPDB_FIELDS_PK ('
        '    TABELA varchar(31))'
        'returns ('
        '    FIELDNAME varchar(31),'
        '    PK_NAME varchar(31))'
        'as'
        'begin'
        
          '  for select trim(SG.RDB$FIELD_NAME) , trim(RC.RDB$CONSTRAINT_NA' +
          'ME)'
        '      from RDB$RELATION_CONSTRAINTS RC'
        
          '        inner join RDB$INDICES IX on RC.RDB$INDEX_NAME = IX.RDB$' +
          'INDEX_NAME'
        
          '        inner join RDB$INDEX_SEGMENTS SG on IX.RDB$INDEX_NAME = ' +
          'SG.RDB$INDEX_NAME'
        '      where RC.RDB$CONSTRAINT_TYPE = '#39'PRIMARY KEY'#39' and'
        '            RC.RDB$RELATION_NAME = :TABELA'
        '      order by SG.RDB$FIELD_POSITION'
        '        into :FIELDNAME, :PK_NAME'
        '  do'
        '    suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SPRI_MAKE_OBJ_EST ('
        '    TABELA varchar(31),'
        '    TABELA_ID integer)'
        'as'
        '  declare variable STMT blob sub_type 1 segment size 256;'
        'begin'
        '  if (TABELA = '#39'PRODUTOS'#39') then'
        '  begin'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'EST_F'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'PREC_CUS_PROD'#39') matching (TABELA_ID, CAMPO)' +
          ';'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'PREC_CUSM_PROD'#39') matching (TABELA_ID, CAMPO' +
          ');'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'PREC_CUSR_PROD'#39') matching (TABELA_ID, CAMPO' +
          ');'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'PREC_CUSMR_PROD'#39') matching (TABELA_ID, CAMP' +
          'O);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'PREC_CUS_MNF'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'PREC_CUSR_MNF'#39') matching (TABELA_ID, CAMPO)' +
          ';'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'PREC_REP_PROD'#39') matching (TABELA_ID, CAMPO)' +
          ';'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'DATA_ULT_COMPRA'#39') matching (TABELA_ID, CAMP' +
          'O);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'NUM_NF_REC'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'VL_ULT_COMPRA'#39') matching (TABELA_ID, CAMPO)' +
          ';'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'PERC_FRETE_PROD'#39') matching (TABELA_ID, CAMP' +
          'O);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'ICMANT_SUB'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'BASEICMANT_SUB'#39') matching (TABELA_ID, CAMPO' +
          ');'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'LOCACAO_PROD'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'LOCACAO_PROD_1'#39') matching (TABELA_ID, CAMPO' +
          ');'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'COMISSAO_PROD'#39') matching (TABELA_ID, CAMPO)' +
          ';'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'COMISSAO_PROD_GER'#39') matching (TABELA_ID, CA' +
          'MPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'DT_ULT_VND'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'DT_ULT_VNDA'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'CLASSE_PROD'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'CLINV'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'CLPRECO'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'CLPOP'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'CLQTV'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'CLFRV'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'CLATL'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'DAT_CAD_PROD'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'VALORGE'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'VALORPME'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'QTDPROD_EXCESSO'#39') matching (TABELA_ID, CAMP' +
          'O);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'QTDDIAS_EXCESSO'#39') matching (TABELA_ID, CAMP' +
          'O);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'EST_SEGURANCA'#39') matching (TABELA_ID, CAMPO)' +
          ';'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'FREQ_PEDIDO'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'DMD'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'TCUTILIZADO'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'QTD_ETIQUETAS'#39') matching (TABELA_ID, CAMPO)' +
          ';'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'MD5'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'TEMPO_ENTREGASUG'#39') matching (TABELA_ID, CAM' +
          'PO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'COD_INF'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'COD_PRODUCAO'#39') matching (TABELA_ID, CAMPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'DT_ULT_S_PRODUCAO'#39') matching (TABELA_ID, CA' +
          'MPO);'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'DT_ULT_E_PRODUCAO'#39') matching (TABELA_ID, CA' +
          'MPO);'
        ''
        
          '    STMT = '#39'create or alter trigger TI_RI_EST_PROD for PRODUTOS'#39 +
          ' || ascii_char(13) ||'
        
          '           '#39'active before update position 1'#39' || ascii_char(13) |' +
          '|'
        '           '#39'as'#39' || ascii_char(13) ||'
        
          '           '#39'  declare variable CONTEXT_VAR char(36);'#39' || ascii_c' +
          'har(13) ||'
        
          '           '#39'  declare variable CONTEXT_STAT varchar(255);'#39' || as' +
          'cii_char(13) ||'
        '           '#39'begin'#39' || ascii_char(13) ||'
        '           '#39'  select GUIDT'#39' || ascii_char(13) ||'
        '           '#39'  from RI_TAB'#39' || ascii_char(13) ||'
        '           '#39'  where TABELA = '#39#39'PRODUTOS'#39#39' '#39' || ascii_char(13) ||'
        '           '#39'    into :CONTEXT_VAR;'#39' || ascii_char(13) ||'
        '           '#39#39' || ascii_char(13) ||'
        
          '           '#39'  select RDB$GET_CONTEXT('#39#39'USER_TRANSACTION'#39#39', :CONT' +
          'EXT_VAR)'#39' || ascii_char(13) ||'
        '           '#39'  from RDB$DATABASE'#39' || ascii_char(13) ||'
        '           '#39'    into :CONTEXT_STAT;'#39' || ascii_char(13) ||'
        '           '#39#39' || ascii_char(13) ||'
        
          '           '#39'  if (coalesce(CONTEXT_STAT, '#39#39#39#39') <> '#39#39#39#39') then'#39' ||' +
          ' ascii_char(13) ||'
        '           '#39'  begin'#39' || ascii_char(13) ||'
        '           '#39'    new.EST_F = old.EST_F;'#39' || ascii_char(13) ||'
        
          '           '#39'    new.PREC_CUS_PROD = old.PREC_CUS_PROD;'#39' || ascii' +
          '_char(13) ||'
        
          '           '#39'    new.PREC_CUSM_PROD = old.PREC_CUSM_PROD;'#39' || asc' +
          'ii_char(13) ||'
        
          '           '#39'    new.PREC_CUSR_PROD = old.PREC_CUSR_PROD;'#39' || asc' +
          'ii_char(13) ||'
        
          '           '#39'    new.PREC_CUSMR_PROD = old.PREC_CUSMR_PROD;'#39' || a' +
          'scii_char(13) ||'
        
          '           '#39'    new.PREC_CUS_MNF = old.PREC_CUS_MNF;'#39' || ascii_c' +
          'har(13) ||'
        
          '           '#39'    new.PREC_CUSR_MNF = old.PREC_CUSR_MNF;'#39' || ascii' +
          '_char(13) ||'
        
          '           '#39'    new.PREC_REP_PROD = old.PREC_REP_PROD;'#39' || ascii' +
          '_char(13) ||'
        
          '           '#39'    new.DATA_ULT_COMPRA = old.DATA_ULT_COMPRA;'#39' || a' +
          'scii_char(13) ||'
        
          '           '#39'    new.NUM_NF_REC = old.NUM_NF_REC;'#39' || ascii_char(' +
          '13) ||'
        
          '           '#39'    new.VL_ULT_COMPRA = old.VL_ULT_COMPRA;'#39' || ascii' +
          '_char(13) ||'
        
          '           '#39'    new.PERC_FRETE_PROD = old.PERC_FRETE_PROD;'#39' || a' +
          'scii_char(13) ||'
        
          '           '#39'    new.ICMANT_SUB = old.ICMANT_SUB;'#39' || ascii_char(' +
          '13) ||'
        
          '           '#39'    new.BASEICMANT_SUB = old.BASEICMANT_SUB;'#39' || asc' +
          'ii_char(13) ||'
        
          '           '#39'    new.LOCACAO_PROD = old.LOCACAO_PROD;'#39' || ascii_c' +
          'har(13) ||'
        
          '           '#39'    new.LOCACAO_PROD_1 = old.LOCACAO_PROD_1;'#39' || asc' +
          'ii_char(13) ||'
        
          '           '#39'    new.COMISSAO_PROD = old.COMISSAO_PROD;'#39' || ascii' +
          '_char(13) ||'
        
          '           '#39'    new.COMISSAO_PROD_GER = old.COMISSAO_PROD_GER;'#39' ' +
          '|| ascii_char(13) ||'
        
          '           '#39'    new.DT_ULT_VND = old.DT_ULT_VND;'#39' || ascii_char(' +
          '13) ||'
        
          '           '#39'    new.DT_ULT_VNDA = old.DT_ULT_VNDA;'#39' || ascii_cha' +
          'r(13) ||'
        
          '           '#39'    new.CLASSE_PROD = old.CLASSE_PROD;'#39' || ascii_cha' +
          'r(13) ||'
        '           '#39'    new.CLINV = old.CLINV;'#39' || ascii_char(13) ||'
        '           '#39'    new.CLPRECO = old.CLPRECO;'#39' || ascii_char(13) ||'
        '           '#39'    new.CLPOP = old.CLPOP;'#39' || ascii_char(13) ||'
        '           '#39'    new.CLQTV = old.CLQTV;'#39' || ascii_char(13) ||'
        '           '#39'    new.CLFRV = old.CLFRV;'#39' || ascii_char(13) ||'
        '           '#39'    new.CLATL = old.CLATL;'#39' || ascii_char(13) ||'
        
          '           '#39'    new.DAT_CAD_PROD = old.DAT_CAD_PROD;'#39' || ascii_c' +
          'har(13) ||'
        '           '#39'    new.VALORGE = old.VALORGE;'#39' || ascii_char(13) ||'
        
          '           '#39'    new.VALORPME = old.VALORPME;'#39' || ascii_char(13) ' +
          '||'
        
          '           '#39'    new.QTDPROD_EXCESSO = old.QTDPROD_EXCESSO;'#39' || a' +
          'scii_char(13) ||'
        
          '           '#39'    new.QTDDIAS_EXCESSO = old.QTDDIAS_EXCESSO;'#39' || a' +
          'scii_char(13) ||'
        
          '           '#39'    new.EST_SEGURANCA = old.EST_SEGURANCA;'#39' || ascii' +
          '_char(13) ||'
        
          '           '#39'    new.FREQ_PEDIDO = old.FREQ_PEDIDO;'#39' || ascii_cha' +
          'r(13) ||'
        '           '#39'    new.DMD = old.DMD;'#39' || ascii_char(13) ||'
        
          '           '#39'    new.TCUTILIZADO = old.TCUTILIZADO;'#39' || ascii_cha' +
          'r(13) ||'
        
          '           '#39'    new.QTD_ETIQUETAS = old.QTD_ETIQUETAS;'#39' || ascii' +
          '_char(13) ||'
        '           '#39'    new.MD5 = old.MD5;'#39' || ascii_char(13) ||'
        
          '           '#39'    new.TEMPO_ENTREGASUG = old.TEMPO_ENTREGASUG;'#39' ||' +
          ' ascii_char(13) ||'
        '           '#39'    new.COD_INF = old.COD_INF;'#39' || ascii_char(13) ||'
        
          '           '#39'    new.COD_PRODUCAO = old.COD_PRODUCAO;'#39' || ascii_c' +
          'har(13) ||'
        
          '           '#39'    new.DT_ULT_S_PRODUCAO = old.DT_ULT_S_PRODUCAO;'#39' ' +
          '|| ascii_char(13) ||'
        
          '           '#39'    new.DT_ULT_E_PRODUCAO = old.DT_ULT_E_PRODUCAO;'#39' ' +
          '|| ascii_char(13) ||'
        '           '#39'  end'#39' || ascii_char(13) ||'
        '           '#39'end'#39';'
        '  end'
        '  else'
        '  if (TABELA = '#39'COD_GRADE_PROD'#39') then  '
        '  begin'
        
          '    update or insert into RI_SCHEMA_TAB_EXCE (TABELA_ID, CAMPO) ' +
          'values (:TABELA_ID, '#39'QTDE'#39') matching (TABELA_ID, CAMPO);'
        ''
        
          '    STMT = '#39'create or alter trigger TI_RI_EST_GRADE for COD_GRAD' +
          'E_PROD'#39' || ascii_char(13) ||'
        
          '           '#39'active before update position 1'#39' || ascii_char(13) |' +
          '|'
        '           '#39'as'#39' || ascii_char(13) ||'
        
          '           '#39'  declare variable CONTEXT_VAR char(36);'#39' || ascii_c' +
          'har(13) ||'
        
          '           '#39'  declare variable CONTEXT_STAT varchar(255);'#39' || as' +
          'cii_char(13) ||'
        '           '#39'begin'#39' || ascii_char(13) ||'
        '           '#39'  select GUIDT'#39' || ascii_char(13) ||'
        '           '#39'  from RI_TAB'#39' || ascii_char(13) ||'
        
          '           '#39'  where TABELA = '#39#39'COD_GRADE_PROD'#39#39' '#39' || ascii_char(' +
          '13) ||'
        '           '#39'    into :CONTEXT_VAR;'#39' || ascii_char(13) ||'
        '           '#39#39' || ascii_char(13) ||'
        
          '           '#39'  select RDB$GET_CONTEXT('#39#39'USER_TRANSACTION'#39#39', :CONT' +
          'EXT_VAR)'#39' || ascii_char(13) ||'
        '           '#39'  from RDB$DATABASE'#39' || ascii_char(13) ||'
        '           '#39'    into :CONTEXT_STAT;'#39' || ascii_char(13) ||'
        '           '#39#39' || ascii_char(13) ||'
        
          '           '#39'  if (coalesce(CONTEXT_STAT, '#39#39#39#39') <> '#39#39#39#39') then'#39' ||' +
          ' ascii_char(13) ||'
        '           '#39'  begin'#39' || ascii_char(13) ||'
        '           '#39'    new.QTDE = old.QTDE;'#39' || ascii_char(13) ||'
        '           '#39'  end'#39' || ascii_char(13) ||'
        '           '#39'end'#39';   '
        '  end'
        '  else'
        '    STMT = '#39#39';'
        ''
        '  if (coalesce(STMT, '#39#39') <> '#39#39') then'
        '  begin'
        '    insert into RI_TMP_SQL (SQLEXEC)'
        '    values (:STMT);'
        ''
        '    execute statement STMT;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SPRI_MAKE_OBJ ('
        '    TABELA varchar(31),'
        '    SCH_TB_ID integer,'
        '    REMOVER smallint = 0)'
        'as'
        '  declare variable SCHEMA_ID integer;'
        '  declare variable TABLE_ID integer;'
        '  declare variable STMTTR blob sub_type 1 segment size 256;'
        '  declare variable SQLTMP blob sub_type 1 segment size 32;'
        '  declare variable SQLTMP2 blob sub_type 1 segment size 32;'
        '  declare variable SQLTMP3 blob sub_type 1 segment size 32;'
        '  declare variable STMTCASE0 blob sub_type 1 segment size 32;'
        '  declare variable STMTCASE1 blob sub_type 1 segment size 32;'
        
          '  declare variable STMTCASEWHEN1 blob sub_type 1 segment size 32' +
          ';'
        
          '  declare variable STMTCASEWHEN2 blob sub_type 1 segment size 32' +
          ';'
        '  declare variable STMTEMPTY blob sub_type 1 segment size 32;'
        '  declare variable STMTACTIVE blob sub_type 1 segment size 32;'
        
          '  declare variable STMTACTIVEEND blob sub_type 1 segment size 32' +
          ';'
        
          '  declare variable LOGKEYSUPDATE blob sub_type 1 segment size 32' +
          ';'
        '  declare variable VARPKID varchar(128);'
        '  declare variable TNAME varchar(31);'
        '  declare variable TRNAME varchar(31);'
        '  declare variable FNAME varchar(31);'
        '  declare variable PKNAME varchar(31);'
        '  declare variable FKNAME varchar(31);'
        '  declare variable FEMPNAME varchar(31);'
        '  declare variable FTYPE varchar(32);'
        '  declare variable FISPK smallint;'
        '  declare variable FISWHERE smallint;'
        '  declare variable TPID smallint;'
        '  declare variable KEYONLYEMP integer;'
        'begin'
        '  TABELA = trim(TABELA);'
        ''
        '  update or insert into RI_TAB (TABELA)'
        '  values (:TABELA)'
        '  matching (TABELA);'
        ''
        '  select T.ID, E.CAMPO_EMP'
        '  from RI_TAB T'
        '    left join SPDB_EMP_KEY(T.TABELA) E on 1 = 1'
        '  where T.TABELA = :TABELA'
        '    into :TABLE_ID, :FEMPNAME;'
        ''
        '  TRNAME = '#39'TI_RI_'#39' ||(select RESULT'
        '                       from STRZERO(:TABLE_ID, 3));'
        '  STMTCASE0 = '#39#39';'
        '  STMTCASEWHEN1 = '#39#39';'
        '  STMTCASEWHEN2 = '#39#39';'
        '  STMTACTIVE = '#39#39';'
        '  STMTACTIVEEND = '#39#39';'
        ''
        '  if (REMOVER = 1) then'
        '  begin'
        '    FNAME = '#39#39';'
        ''
        '    select count(ID)'
        '    from RI_SCHEMA_TAB'
        '    where TABELA = :TABELA'
        '      into :TABLE_ID;'
        ''
        '    if (coalesce(TABLE_ID, 0) = 0) then'
        '    begin'
        '      select trim(TG.RDB$TRIGGER_NAME)'
        '      from RDB$TRIGGERS TG'
        '      where TG.RDB$RELATION_NAME = :TABELA and'
        '            TG.RDB$TRIGGER_NAME = :TRNAME and'
        '            TG.RDB$SYSTEM_FLAG = 0'
        '        into :FNAME;'
        '  '
        '      if (FNAME = TRNAME) then'
        '        STMTTR = '#39'DROP TRIGGER '#39' || TRNAME;'
        '      else'
        
          '        STMTTR = '#39'DROP TRIGGER '#39' || TRNAME || '#39' - trigger not ex' +
          'ists'#39';'
        '  '
        '      insert into RI_TMP_SQL (SQLEXEC)'
        '      values (:STMTTR);'
        '  '
        '      if (FNAME = TRNAME) then'
        '        execute statement STMTTR;'
        '      exit;'
        '    end'
        '    else'
        '      REMOVER = 0;'
        '  end'
        ''
        '  VARPKID = '#39#39';'
        '  SQLTMP = '#39#39';'
        '  for select distinct TABLE_REF, PK_NAME, FK_NAME'
        '    from SPDB_FIELDS_FK(:TABELA)'
        '    where UPDATE_CASCATA = 1'
        '      into :TNAME, :PKNAME, :FKNAME'
        '  do'
        '  begin'
        '    SQLTMP2 = '#39#39';'
        '    SQLTMP3 = '#39#39';'
        ''
        '    for select FIELDNAME'
        '        from SPDB_FIELDS_FK(:TABELA)'
        '        where FK_NAME = :FKNAME'
        '          into :FNAME'
        '    do'
        '    begin'
        '      if (SQLTMP2 <> '#39#39') then'
        '      begin'
        '        SQLTMP2 = SQLTMP2 || '#39' || '#39#39'-'#39#39' || '#39';'
        '        SQLTMP3 = SQLTMP3 || '#39' or '#39';'
        '      end'
        '      SQLTMP2 = SQLTMP2 || '#39'old.'#39' || FNAME;'
        
          '      SQLTMP3 = SQLTMP3 || '#39'(old.'#39' || FNAME || '#39' <> new.'#39' || FNA' +
          'ME || '#39')'#39';'
        '    end'
        ''
        '    SQLTMP = iif(SQLTMP <> '#39#39', ascii_char(13), '#39#39') ||'
        '             SQLTMP ||'
        
          '             '#39'  if ((updating) and ('#39' || SQLTMP3 || '#39')) then'#39' ||' +
          ' ascii_char(13) ||'
        
          '             '#39'    for select IDPK from SPRI_FKCHECK('#39#39#39' || :TNAM' +
          'E || '#39#39#39', '#39#39#39' || :PKNAME || '#39#39#39', '#39' || SQLTMP2 || '#39')'#39' || ascii_ch' +
          'ar(13) ||'
        '             '#39'        where IDPK > 0'#39' || ascii_char(13) ||'
        '             '#39'          into :IDPK'#39' || ascii_char(13) ||'
        '             '#39'    do'#39' || ascii_char(13) ||'
        '             '#39'      exit;'#39' || ascii_char(13);'
        ''
        
          '    VARPKID = '#39'  declare variable IDPK integer;'#39' || ascii_char(1' +
          '3);'
        '  end'
        '  LOGKEYSUPDATE = SQLTMP;'
        ''
        '  SQLTMP = '#39#39';'
        '  SQLTMP2 = '#39#39';'
        '  for select FIELDNAME, PK_NAME from SPDB_FIELDS_PK(:TABELA)'
        '        into :FNAME, :PKNAME'
        '  do'
        '  begin'
        '    if (SQLTMP <> '#39#39') then'
        '    begin'
        '      SQLTMP = SQLTMP || '#39' or '#39';'
        '      SQLTMP2 = SQLTMP2 || '#39' || '#39#39'-'#39#39' || '#39';'
        '    end'
        
          '    SQLTMP = SQLTMP || '#39'(old.'#39' || FNAME || '#39' <> new.'#39' || FNAME |' +
          '| '#39')'#39';'
        '    SQLTMP2 = SQLTMP2 || '#39'old.'#39' || FNAME;'
        '  end'
        ''
        
          '  LOGKEYSUPDATE = '#39'  if ((updating) and ('#39' || SQLTMP || '#39')) then' +
          #39' || ascii_char(13) ||'
        
          '                  '#39'    insert into RI_TAB_UPDATEKEY(TABELA, CONS' +
          'TRAINT_NAME, KEYVALUES) values ('#39#39#39' || :TABELA || '#39#39#39', '#39#39#39' || :P' +
          'KNAME || '#39#39#39', '#39' || SQLTMP2 || '#39');'#39' || ascii_char(13) ||'
        '                  LOGKEYSUPDATE;'
        ''
        '  select first 1 trim(F.FIELDNAME)'
        '    from SPDB_FIELDS(:TABELA) F'
        '    where F.FIELDNAME = '#39'REP_INT_ACTIVE'#39' and'
        '          F.FIELDTYPE2 = '#39'INT'#39
        '      into :STMTACTIVE;'
        ''
        '  if (STMTACTIVE = '#39'REP_INT_ACTIVE'#39') then'
        '  begin'
        
          '    STMTACTIVE = '#39'  if ((updating) and (coalesce(new.REP_INT_ACT' +
          'IVE, 0) <> 1)) then'#39' || ascii_char(13) ||'
        
          '                 '#39'    exit;'#39' || ascii_char(13) || ascii_char(13)' +
          ';'
        ''
        '    for select trim(F.FIELDNAME), trim(F.FIELDTYPE2)'
        '        from SPDB_FIELDS(:TABELA) F'
        '          inner join SPDB_IS_PK(:TABELA, F.FIELDNAME) P on 1 = 1'
        '        where P.ISPK = 1'
        '          into :FNAME, :FTYPE'
        '        do'
        '        begin    '
        '          if (STMTACTIVEEND <> '#39#39') then'
        '            STMTACTIVEEND = STMTACTIVEEND || '#39' || '#39#39' and '#39';'
        ''
        '          if (FTYPE in ('#39'STRING'#39')) then'
        
          '            STMTACTIVEEND = STMTACTIVEEND || FNAME || '#39' = '#39#39#39#39#39#39 +
          ' || new.'#39' || FNAME || '#39' || '#39#39#39#39#39#39#39#39' '#39';'
        '          else'
        
          '            STMTACTIVEEND = STMTACTIVEEND || FNAME || '#39' = '#39#39' || ' +
          'cast(new.'#39' || FNAME ||'#39' as varchar(64)) '#39';'
        '        end'
        ''
        '    STMTACTIVEEND = ascii_char(13) ||'
        
          '                    '#39'  if ((not deleting) and (new.REP_INT_ACTIV' +
          'E = 1)) then'#39' || ascii_char(13) ||'
        
          '                    '#39'    execute statement '#39#39'update '#39' || :TABELA' +
          ' || '#39' set REP_INT_ACTIVE = null where '#39' || STMTACTIVEEND || '#39';'#39' ' +
          '|| ascii_char(13);'
        '  end'
        ''
        '  for select distinct SCHEMA_ID'
        '      from RI_SCHEMA_TAB'
        '      where TABELA = :TABELA'
        '      order by TIPO_ID'
        '        into :SCHEMA_ID'
        '  do'
        '  begin'
        '    STMTCASE1 = '#39#39';'
        '    STMTEMPTY = '#39#39';'
        
          '    for select F.FIELDNAME, F.FIELDTYPE2, P.ISPK, iif(W.CAMPO = ' +
          'F.FIELDNAME, 1, 0), T.TIPO_ID'
        '        from SPDB_FIELDS(:TABELA) F'
        '          left join SPDB_IS_PK(:TABELA, F.FIELDNAME) P on 1 = 1'
        '          left join RI_SCHEMA_TAB T on T.TABELA = :TABELA and'
        '                T.SCHEMA_ID = :SCHEMA_ID'
        
          '          left join RI_SCHEMA_TAB_WHERE W on W.TABELA_ID = T.ID ' +
          'and'
        '                W.CAMPO = F.FIELDNAME'
        '        where (F.FIELDNAME <> :FEMPNAME) and'
        '              (F.FIELDNAME <> '#39'REP_INT_ACTIVE'#39') and'
        '              (P.ISPK = 1 or W.CAMPO = F.FIELDNAME)'
        '          into :FNAME, :FTYPE, :FISPK, :FISWHERE, :TPID'
        '    do'
        '    begin'
        '      SQLTMP = '#39#39';'
        ''
        '      if (((TPID = 0) and'
        '          (FISPK = 1)) or ((TPID = 1) and'
        '          (FISWHERE = 1))) then'
        '      begin'
        
          '        if ((TPID = 1) and (FISWHERE = 1) and (FTYPE in ('#39'STRING' +
          #39'))) then'
        
          '          STMTEMPTY = STMTEMPTY || '#39' and (coalesce(iif(@ACAO, @P' +
          '1.'#39' || FNAME || '#39', @P2.'#39' || FNAME || '#39'),'#39#39#39#39') <> '#39#39#39#39')'#39';'
        ''
        '        SQLTMP = SQLTMP || '#39#39#39'@.'#39' || FNAME || '#39'='#39#39#39';'
        ''
        '        if (FTYPE in ('#39'STRING'#39')) then'
        
          '          SQLTMP = SQLTMP || '#39#39#39#39#39' || iif(@ACAO, @P1.'#39' || FNAME ' +
          '|| '#39', @P2.'#39' || FNAME || '#39') || '#39#39#39#39#39#39#39#39#39';'
        '        else'
        
          '          SQLTMP = SQLTMP || '#39' || cast(iif(@ACAO, @P1.'#39' || FNAME' +
          ' || '#39', @P2.'#39' || FNAME || '#39') as varchar(64))'#39';'
        '      end'
        ''
        '      if ((TPID = 0) and'
        '          (FISPK = 1) and'
        '          (STMTCASE0 <> '#39'FIM'#39')) then'
        '      begin'
        '        if (STMTCASE0 <> '#39#39') then'
        '          STMTCASE0 = STMTCASE0 || '#39' || '#39#39' and '#39#39' || '#39';'
        '        STMTCASE0 = STMTCASE0 || SQLTMP;'
        '      end'
        ''
        '      if ((TPID = 1) and'
        '          (FISWHERE = 1)) then'
        '      begin'
        '        if (STMTCASE1 <> '#39#39') then'
        '          STMTCASE1 = STMTCASE1 || '#39' || '#39#39' and '#39#39' || '#39';'
        '        STMTCASE1 = STMTCASE1 || SQLTMP;'
        '      end'
        '    end'
        ''
        '    if ((STMTCASE0 <> '#39#39') and'
        '        (STMTCASE0 <> '#39'FIM'#39')) then'
        '    begin'
        
          '      STMTCASEWHEN1 = STMTCASEWHEN1 || '#39'           when (S.TIPO_' +
          'ID = 0) then '#39' || STMTCASE0 || ascii_char(13);'
        
          '      STMTCASEWHEN2 = STMTCASEWHEN2 || '#39'           when (S.TIPO_' +
          'ID = 0) then '#39' || STMTCASE0 || ascii_char(13);'
        '      STMTCASE0 = '#39'FIM'#39';'
        '    end'
        '    if (STMTCASE1 <> '#39#39') then'
        '    begin'
        
          '      STMTCASEWHEN1 = STMTCASEWHEN1 || '#39'           when (S.TIPO_' +
          'ID = 1) and (S.SCHEMA_ID = '#39' || cast(:SCHEMA_ID as varchar(32)) ' +
          '|| '#39')'#39' || STMTEMPTY || '#39' then '#39' || STMTCASE1 || ascii_char(13);'
        
          '      STMTCASEWHEN2 = STMTCASEWHEN2 || '#39'           when (S.TIPO_' +
          'ID = 1) and (S.SCHEMA_ID = '#39' || cast(:SCHEMA_ID as varchar(32)) ' +
          '|| '#39')'#39' || STMTEMPTY || '#39' then '#39' || STMTCASE1 || ascii_char(13);'
        '    end'
        ''
        '    STMTCASEWHEN1 = replace(STMTCASEWHEN1, '#39'@ACAO'#39', '#39'deleting'#39');'
        '    STMTCASEWHEN1 = replace(STMTCASEWHEN1, '#39'@P1'#39', '#39'old'#39');'
        '    STMTCASEWHEN1 = replace(STMTCASEWHEN1, '#39'@P2'#39', '#39'new'#39');'
        ''
        
          '    STMTCASEWHEN2 = replace(STMTCASEWHEN2, '#39'@ACAO'#39', '#39'inserting'#39')' +
          ';'
        '    STMTCASEWHEN2 = replace(STMTCASEWHEN2, '#39'@P1'#39', '#39'new'#39');'
        '    STMTCASEWHEN2 = replace(STMTCASEWHEN2, '#39'@P2'#39', '#39'old'#39');'
        '  end'
        ''
        '  KEYONLYEMP = 0;'
        '  if ((STMTCASEWHEN1 = '#39#39') and (STMTCASEWHEN2 = '#39#39')) then'
        '    select count(T.TABELA)'
        '    from SPDB_TABLES T'
        '      inner join SPDB_COUNT_PK(T.TABELA) CP on 1 = 1'
        '      inner join SPDB_EMP_KEY(T.TABELA) EK on 1 = 1'
        '    where EK.CAMPO_EMP <> '#39#39' and'
        '          CP.COUNTPK = 1 and'
        '          T.TABELA = :TABELA'
        '      into :KEYONLYEMP;'
        ''
        
          '  STMTTR = '#39'CREATE OR ALTER TRIGGER @TRNAME FOR @TBNAME'#39' || asci' +
          'i_char(13) ||'
        
          '           '#39'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 999' +
          #39' || ascii_char(13) ||'
        '           '#39'as'#39' || ascii_char(13) ||'
        '           iif(KEYONLYEMP = 1, '#39#39','
        
          '           '#39'  declare variable CONDICAO_O varchar(255);'#39' || asci' +
          'i_char(13) ||'
        
          '           '#39'  declare variable CONDICAO_D varchar(255);'#39' || asci' +
          'i_char(13)) ||'
        '           '#39'@VARPKID@'#39' ||'
        '           '#39'begin'#39' || ascii_char(13) ||'
        '           '#39'@LOGKEYSUPDATE@'#39' || ascii_char(13) ||'
        '           '#39'@STMTACTIVE@'#39' ||'
        '           iif(KEYONLYEMP = 1,'
        
          '           '#39'  execute procedure SPRI_EXEC('#39#39'@TBNAME'#39#39', '#39#39#39#39', '#39#39#39 +
          #39', iif(deleting, old.@FEMPNAME, new.@FEMPNAME), iif(deleting, 1,' +
          ' 0));'#39','
        '           '#39'  select'#39' || ascii_char(13) ||'
        '           '#39'         case'#39' || ascii_char(13) ||'
        '           '#39'@CASEWHEN1'#39' ||'
        '           '#39'           else '#39#39#39#39#39' || ascii_char(13) ||'
        '           '#39'         end,'#39' || ascii_char(13) ||'
        '           '#39'         case'#39' || ascii_char(13) ||'
        '           '#39'@CASEWHEN2'#39' ||'
        '           '#39'           else '#39#39#39#39#39' || ascii_char(13) ||'
        '           '#39'         end'#39' || ascii_char(13) ||'
        
          '           '#39'  from SPRI_SCHEMA('#39#39'@TBNAME'#39#39', iif(deleting, old.@F' +
          'EMPNAME, new.@FEMPNAME)) S'#39' || ascii_char(13) ||'
        
          '           '#39'    into :CONDICAO_O, :CONDICAO_D;'#39' || ascii_char(13' +
          ') ||'
        '           '#39#39' || ascii_char(13) ||'
        
          '           '#39'  if ((updating) and (new.@FEMPNAME <> old.@FEMPNAME' +
          ')) then'#39' || ascii_char(13) ||'
        '           '#39'    CONDICAO_O = '#39#39#39#39';'#39' || ascii_char(13) ||'
        '           '#39#39' || ascii_char(13) ||'
        '           '#39'  if (CONDICAO_O <> '#39#39#39#39') then'#39' || ascii_char(13) ||'
        
          '           '#39'    execute procedure SPRI_EXEC('#39#39'@TBNAME'#39#39', :CONDIC' +
          'AO_O, :CONDICAO_D, iif(deleting, old.@FEMPNAME, new.@FEMPNAME), ' +
          'iif(deleting, 1, 0));'#39') || ascii_char(13) ||'
        '           '#39'@STMTACTIVEEND@'#39' ||'
        '           '#39'end'#39';'
        ''
        '  STMTTR = replace(STMTTR, '#39'@TBNAME'#39', :TABELA);'
        '  STMTTR = replace(STMTTR, '#39'@TRNAME'#39', :TRNAME);'
        '  STMTTR = replace(STMTTR, '#39'@VARPKID@'#39', :VARPKID);'
        '  STMTTR = replace(STMTTR, '#39'@LOGKEYSUPDATE@'#39', :LOGKEYSUPDATE);'
        '  STMTTR = replace(STMTTR, '#39'@STMTACTIVE@'#39', :STMTACTIVE);'
        '  STMTTR = replace(STMTTR, '#39'@FEMPNAME'#39', :FEMPNAME);'
        '  STMTTR = replace(STMTTR, '#39'@CASEWHEN1'#39', :STMTCASEWHEN1);'
        '  STMTTR = replace(STMTTR, '#39'@CASEWHEN2'#39', :STMTCASEWHEN2);'
        '  STMTTR = replace(STMTTR, '#39'@STMTACTIVEEND@'#39', :STMTACTIVEEND);'
        ''
        '  insert into RI_TMP_SQL (SQLEXEC)'
        '  values (:STMTTR);'
        ''
        '  execute statement STMTTR;'
        ''
        '  if (:TABELA in ('#39'PRODUTOS'#39', '#39'COD_GRADE_PROD'#39') ) then'
        '    execute procedure SPRI_MAKE_OBJ_EST(:TABELA, :SCH_TB_ID);'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER RI_SCHEMA_TAB_AIUD_MK_OBJ FOR RI_SCHEMA_' +
          'TAB'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 1'
        'as'
        'begin'
        
          '  execute procedure SPRI_MAKE_OBJ(iif(deleting, old.TABELA, new.' +
          'TABELA), new.ID, iif(deleting, 1, 0));'
        'end;'
        '|/BLOCO|'
        ''
        'CREATE SEQUENCE SEQ_REP_INT_LOG;'
        ''
        '|BLOCO|'
        'CREATE TABLE RI_TAB_LOG ('
        '    SEQID       BIGINT NOT NULL,'
        '    TABELA      VARCHAR(31),'
        '    CONDICAO_O  VARCHAR(255),'
        '    CONDICAO_D  VARCHAR(255),'
        '    IDORIG      INTEGER,'
        '    IDDEST      INTEGER,'
        '    EXCLUSAO    SMALLINT,'
        '    DH_REP      TIMESTAMP'
        ');'
        '|/BLOCO|'
        ''
        'CREATE UNIQUE INDEX IDX_RI_TAB_LOG ON RI_TAB_LOG (SEQID);'
        'CREATE INDEX IDX_RI_TAB_LOG_DH ON RI_TAB_LOG (DH_REP);'
        'CREATE INDEX IDX_RI_TAB_LOG_TAB ON RI_TAB_LOG (TABELA);'
        ''
        '|BLOCO|'
        'create or alter procedure SPRI_EXEC ('
        '    TABELA varchar(31),'
        '    CONDICAO_O varchar(255),'
        '    CONDICAO_D varchar(255),'
        '    IDORIGEM integer,'
        '    REMOVER smallint)'
        'as'
        '  declare variable CAMPO_E varchar(31);'
        '  declare variable FIELDNAME varchar(31);'
        '  declare variable FIELDKEY varchar(31);'
        '  declare variable CONDORIG varchar(255);'
        '  declare variable CONDDEST varchar(255);'
        '  declare variable FTYPE2 varchar(32);'
        '  declare variable STMT blob sub_type 1 segment size 80;'
        '  declare variable STMTV blob sub_type 1 segment size 80;'
        '  declare variable STMTRUN blob sub_type 1 segment size 80;'
        '  declare variable STMTI blob sub_type 1 segment size 256;'
        '  declare variable STMTU blob sub_type 1 segment size 256;'
        '  declare variable STMTE blob sub_type 1 segment size 512;'
        '  declare variable ISPK integer;'
        '  declare variable COUNTPK integer;'
        '  declare variable IDDEST integer;'
        '  declare variable TIPO_ID smallint;'
        '  declare variable SCHEMA_ID smallint;'
        '  declare variable CONTEXT_VAR varchar(80);'
        '  declare variable CONTEXT_STAT varchar(255);'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '    '
        '  select S.SCHEMA_ID, S.TIPO_ID'
        '  from SPRI_SCHEMA(:TABELA, :IDORIGEM) S'
        '      into :SCHEMA_ID, :TIPO_ID;'
        ''
        '  if (coalesce(SCHEMA_ID, 0) <= 0) then'
        '    exit;'
        ''
        '  TIPO_ID = coalesce(TIPO_ID, 0);'
        ''
        
          '  select GUIDT from RI_TAB where TABELA = :TABELA into :CONTEXT_' +
          'VAR;'
        ''
        '  if (CONTEXT_VAR is null) then'
        '    exit;'
        ''
        '  select RDB$GET_CONTEXT('#39'USER_TRANSACTION'#39', :CONTEXT_VAR)'
        '  from RDB$DATABASE'
        '    into :CONTEXT_STAT;'
        ''
        '  if (trim(CONTEXT_STAT) = trim(CONDICAO_O)) then'
        '    exit;'
        ''
        '  RDB$SET_CONTEXT('#39'USER_TRANSACTION'#39', :CONTEXT_VAR, CONDICAO_O);'
        ''
        '  insert into RI_TMP_SQL (SQLEXEC)'
        
          '    values ('#39'CONDICAO_O '#39' || :CONDICAO_O || ASCII_CHAR(13) || '#39' ' +
          'CONDICAO_D '#39' || :CONDICAO_D );'
        ''
        '  select E.CAMPO_EMP, PK.COUNTPK'
        '  from SPDB_EMP_KEY(:TABELA) E'
        '    left join SPDB_COUNT_PK(:TABELA) PK on 1 = 1'
        '    into :CAMPO_E, :COUNTPK;'
        ''
        '  CONDICAO_O = trim(coalesce(CONDICAO_O, '#39#39'));'
        
          '  CONDORIG = replace(CONDICAO_O, '#39'@'#39', '#39's'#39') || iif(CONDICAO_O <> ' +
          #39#39', '#39' and '#39', '#39#39') || '#39' s.'#39' || CAMPO_E || '#39' = '#39' || cast(IDORIGEM a' +
          's varchar(20));'
        ''
        '  CONDICAO_D = trim(coalesce(CONDICAO_D, '#39#39'));'
        
          '  CONDDEST = replace(CONDICAO_D, '#39'@'#39', '#39'd'#39') || iif(CONDICAO_D <> ' +
          #39#39', '#39' and '#39', '#39#39') || '#39' d.'#39' || CAMPO_E || '#39' = @IDDEST@'#39';'
        ''
        
          '  if (((CONDICAO_O = '#39#39') or (CONDICAO_D = '#39#39')) and (COUNTPK > 1)' +
          ') then'
        '    exit;'
        ''
        '  STMT = CAMPO_E;'
        '  STMTV = '#39#39';'
        '  STMTU = '#39#39';'
        '  FIELDKEY = '#39#39';'
        ''
        '  if (coalesce(REMOVER, 0) <> 1) then'
        '    for select F.FIELDNAME, F.FIELDTYPE2, PK.ISPK'
        '        from SPDB_FIELDS(:TABELA) F'
        '          left join SPDB_IS_PK(:TABELA, F.FIELDNAME) PK on 1 = 1'
        '          inner join RI_SCHEMA_TAB T on T.TABELA = :TABELA and'
        '                T.SCHEMA_ID = :SCHEMA_ID'
        
          '          left join RI_SCHEMA_TAB_EXCE TE on TE.TABELA_ID = T.ID' +
          ' and'
        '                TE.CAMPO = F.FIELDNAME'
        '        where F.FIELDNAME <> :CAMPO_E and'
        '              F.FIELDNAME <> '#39'REP_INT_ACTIVE'#39' and'
        '              F.FIELDNAME <> '#39'ID_COMMERCE'#39' and'
        '              TE.CAMPO is null'
        '          into :FIELDNAME, :FTYPE2, ISPK    '
        '    do'
        '    begin'
        '      STMT = STMT || '#39','#39' || FIELDNAME;'
        ''
        '      if ((FTYPE2 = '#39'INT'#39') and'
        '          (FIELDKEY = '#39#39') and'
        '          (coalesce(ISPK, 0) = 1) and'
        '          (coalesce(COUNTPK, 0) = 2)) then '
        '          FIELDKEY = FIELDNAME;'
        '  '
        '      if ((TIPO_ID = 1) and'
        '          (FIELDKEY = FIELDNAME)) then'
        '      begin'
        '        if (STMTV <> '#39#39') then'
        '          STMTV = STMTV || '#39','#39';'
        '  '
        '        STMTV = STMTV || '#39'@FUNCAO_INCREMENTA_CODIGO@'#39';'
        '      end'
        '      else'
        '      begin'
        '        if (STMTV <> '#39#39') then'
        '          STMTV = STMTV || '#39','#39';'
        '        STMTV = STMTV || '#39's.'#39' || FIELDNAME;'
        '  '
        '        if (STMTU <> '#39#39') then'
        '          STMTU = STMTU || '#39','#39';'
        '  '
        
          '        STMTU = STMTU || '#39'd.'#39' || FIELDNAME || '#39'=s.'#39' || FIELDNAME' +
          ';'
        '      end'
        '    end'
        ''
        '  for select E.EMPRESA_ID'
        '      from RI_SCHEMA_EMP E'
        '        inner join RI_SCHEMA S on E.SCHEMA_ID = S.ID'
        '        inner join RI_SCHEMA_TAB TB on TB.SCHEMA_ID = S.ID'
        '      where E.EMPRESA_ID <> :IDORIGEM and'
        '            TB.TABELA = :TABELA and'
        '            S.ID in (select S.ID'
        '                     from RI_SCHEMA S'
        
          '                       inner join RI_SCHEMA_TAB T on T.SCHEMA_ID' +
          ' = S.ID'
        
          '                       inner join RI_SCHEMA_EMP E on E.SCHEMA_ID' +
          ' = S.ID'
        '                     where E.EMPRESA_ID = :IDORIGEM and'
        '                           T.TABELA = :TABELA)'
        '      order by E.EMPRESA_ID'
        '        into :IDDEST'
        '  do'
        '  begin'
        '    if (REMOVER = 1) then'
        
          '      STMTE = '#39'delete from '#39' || :TABELA || '#39' d where '#39' || replac' +
          'e(CONDDEST, '#39'@IDDEST@'#39', cast(IDDEST as varchar(20)));'
        '    else'
        '    begin '
        
          '      STMTRUN = replace(STMTV, '#39'@FUNCAO_INCREMENTA_CODIGO@'#39', '#39'(s' +
          'elect COD from INCREMENTA_CODIGO('#39'|| cast(IDDEST as varchar(20))' +
          ' || '#39','#39#39#39' || :TABELA || '#39#39#39'))'#39');'
        ''
        '      STMTI = cast(IDDEST as varchar(20)) || '#39','#39' || STMTRUN;'
        '  '
        '      STMTE = '#39'merge into '#39' || TABELA || '#39' d'#39' ||'
        
          '              '#39' using (select * from '#39' || TABELA || '#39' where '#39' ||' +
          ' replace(CONDORIG, '#39's.'#39', '#39#39') || '#39') s'#39' ||'
        
          '              '#39' on ('#39' || replace(CONDDEST, '#39'@IDDEST@'#39', cast(IDDE' +
          'ST as varchar(20))) || '#39')'#39' ||'
        '              '#39' when matched then'#39' ||'
        '              '#39'   update set '#39' || STMTU ||'
        '              '#39' when not matched then'#39' ||'
        
          '              '#39'   insert ('#39' || STMT || '#39') values ('#39' || STMTI || ' +
          #39')'#39';'
        '    end'
        ''
        '    insert into RI_TMP_SQL (SQLEXEC)'
        '    values (:STMTE);'
        ''
        '    execute statement STMTE;'
        ''
        '    CONDICAO_O = replace(CONDICAO_O, '#39'@.'#39', '#39#39');'
        '    CONDICAO_D = replace(CONDICAO_D, '#39'@.'#39', '#39#39');'
        '    CONDICAO_O = replace(CONDICAO_O, '#39' and '#39', '#39' '#39');'
        '    CONDICAO_D = replace(CONDICAO_D, '#39' and '#39', '#39' '#39');'
        ''
        
          '    insert into RI_TAB_LOG (SEQID, TABELA, CONDICAO_O, CONDICAO_' +
          'D, IDORIG, IDDEST, EXCLUSAO, DH_REP)'
        
          '    values (gen_id(SEQ_REP_INT_LOG, 1), :TABELA, :CONDICAO_O, :C' +
          'ONDICAO_D, :IDORIGEM, :IDDEST, :REMOVER, current_timestamp);'
        '  end'
        ''
        '  RDB$SET_CONTEXT('#39'USER_TRANSACTION'#39', :CONTEXT_VAR, null);'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TAB_REP_BIUD_CHECK FOR TAB_REP'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  declare variable CONT integer;'
        'begin'
        '  if (not deleting) then'
        '  begin'
        '    for select count(T.TABELA)'
        '        from RI_SCHEMA_TAB T'
        '        where T.TABELA = new.TABELA'
        '          into :CONT'
        '    do'
        '      if (CONT >= 1) then'
        '        exception EXC_RI_TAB_JACONF;'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS437'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR SCHEMA REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINTE' +
          'RNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS438'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR SCHEMA REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINTE' +
          'RNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS439'#39', :COD_EMPRESA, '#39'RE' +
          'MOVER SCHEMA REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINTE' +
          'RNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS440'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR SCHEMA REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINTER' +
          'NA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS441'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR EMPRESA REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINT' +
          'ERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS442'#39', :COD_EMPRESA, '#39'RE' +
          'MOVER EMPRESA REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINT' +
          'ERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS443'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR EMPRESA REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINTE' +
          'RNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS444'#39', :COD_EMPRESA, '#39'VI' +
          'SUALIZAR TABELAS REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREP' +
          'INTERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS445'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR TABELAS REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINT' +
          'ERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS446'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR TABELAS REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAREPINT' +
          'ERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS447'#39', :COD_EMPRESA, '#39'ED' +
          'ITAR/VISUALIZAR TABELA REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPR' +
          'ESAREPINTERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS448'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR EXCETO CAMPOS REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESA' +
          'REPINTERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS449'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR EXCETO CAMPOS REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESA' +
          'REPINTERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS450'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR CAMPOS CHAVE REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAR' +
          'EPINTERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS451'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR CAMPOS CHAVE REPLICACAO INTERNA'#39', 10, '#39'N'#39', '#39'FRMCADEMPRESAR' +
          'EPINTERNA'#39', 1, '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INC_TIPO_RESERVA FOR TIPO_RESERVA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   IF (NEW.CODIGO IS NULL) THEN'
        '     NEW.CODIGO = GEN_ID(GEN_TIPO_RESERVA,1);'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CODIGO_AIU_REP_INT FOR CODIGO'
        'ACTIVE AFTER INSERT OR UPDATE POSITION 0'
        'as'
        '  declare variable EMPRESA_ID integer;'
        '  declare variable CONTEXT_VAR varchar(80);'
        '  declare variable CONTEXT_STAT varchar(255);'
        'begin'
        '  select GUIDT'
        '  from RI_TAB'
        '  where TABELA = new.TABELA'
        '    into :CONTEXT_VAR;'
        ''
        '  if (CONTEXT_VAR is null) then'
        '    exit;'
        ''
        
          '  select RDB$GET_CONTEXT('#39'USER_TRANSACTION'#39', '#39'CODIGO_'#39' || :CONTE' +
          'XT_VAR)'
        '  from RDB$DATABASE'
        '    into :CONTEXT_STAT;'
        ''
        '  if (trim(CONTEXT_STAT) = trim(new.TABELA)) then'
        '    exit;'
        ''
        
          '  RDB$SET_CONTEXT('#39'USER_TRANSACTION'#39', '#39'CODIGO_'#39' || :CONTEXT_VAR,' +
          ' trim(new.TABELA));'
        ''
        '  for select RE.EMPRESA_ID'
        '      from RI_SCHEMA_TAB RT'
        
          '        inner join RI_SCHEMA_EMP RE on RE.SCHEMA_ID = RT.SCHEMA_' +
          'ID and'
        '              RE.EMPRESA_ID <> new.COD_EMPRESA'
        '      where RT.TABELA = new.TABELA and'
        '            RT.TIPO_ID = 0 and'
        '            RT.SCHEMA_ID = (select RE1.SCHEMA_ID'
        '                            from RI_SCHEMA_TAB RT1'
        
          '                              inner join RI_SCHEMA_EMP RE1 on RE' +
          '1.SCHEMA_ID = RT1.SCHEMA_ID and'
        
          '                                    RE1.EMPRESA_ID = new.COD_EMP' +
          'RESA'
        '                            where RT1.TABELA = new.TABELA)'
        '        into :EMPRESA_ID'
        '  do'
        '    update or insert into CODIGO (TABELA, COD_EMPRESA, VALOR)'
        '    values (new.TABELA, :EMPRESA_ID, new.VALOR)'
        '    matching (TABELA, COD_EMPRESA);'
        ''
        
          '  RDB$SET_CONTEXT('#39'USER_TRANSACTION'#39', '#39'CODIGO_'#39' || :CONTEXT_VAR,' +
          ' null);'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TAB_REP_BIUD_CHECK FOR TAB_REP'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'as'
        '  declare variable CONT integer;'
        'begin'
        '  if (not deleting) then'
        '  begin'
        '    for select count(T.TABELA)'
        '        from RI_SCHEMA_TAB T'
        '        where T.TABELA = new.TABELA'
        '          into :CONT'
        '    do'
        '      if (CONT >= 1) then'
        '        exception EXC_RI_TAB_JACONF;'
        '  end'
        'end;'
        '|/BLOCO|                   '
        ''
        '|BLOCO|'
        'CREATE GLOBAL TEMPORARY TABLE RI_TAB_UPDATEKEY ('
        '    ID               INTEGER NOT NULL,'
        '    TABELA           VARCHAR(31) NOT NULL,'
        '    CONSTRAINT_NAME  VARCHAR(31) NOT NULL,'
        '    KEYVALUES        BLOB SUB_TYPE 1 SEGMENT SIZE 512'
        ') ON COMMIT DELETE ROWS;'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE RI_TAB_UPDATEKEY ADD CONSTRAINT PK_RI_TAB_UPDATEKEY ' +
          'PRIMARY KEY (ID);'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER RI_TAB_UPDATEKEY_NEWID FOR RI_TAB_UPDATE' +
          'KEY'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  select max(ID) + 1'
        '  from RI_tab_updatekey'
        '    into new.ID;'
        ''
        '  if (new.ID is null) then'
        '    new.ID = 1;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SPRI_FKCHECK ('
        '    TABELA varchar(31),'
        '    CONSTRAINT_NAME varchar(31),'
        '    KEYVALUES blob sub_type 1 segment size 512)'
        'returns ('
        '    IDPK integer)'
        'as'
        '  declare variable IDTMP integer;'
        '  declare variable VALORES blob sub_type 1 segment size 512;'
        'begin'
        '  IDPK = 0;'
        '  for select ID, KEYVALUES'
        '      from RI_TAB_UPDATEKEY'
        '      where TABELA = :TABELA and'
        '            CONSTRAINT_NAME = :CONSTRAINT_NAME'
        '        into :IDTMP, :VALORES'
        '  do'
        '  begin'
        '    if (VALORES = KEYVALUES) then'
        '    begin'
        '      IDPK = IDTMP;'
        '      break;'
        '    end'
        '  end'
        ''
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        'ALTER TABLE CLIENTES ADD REP_INT_ACTIVE SMALLINT;'
        'ALTER TABLE PRODUTOS ADD REP_INT_ACTIVE SMALLINT;'
        ''
        '|BLOCO|'
        'CREATE TABLE PRODUTOS_FORN_NFE2 ('
        '    COD_EMPRESA         INTEGER NOT NULL,'
        '    CPFCGC              VARCHAR(18) NOT NULL,'
        '    GRUPO_PROD          INTEGER NOT NULL,'
        '    COD_PROD            CHAR(6) NOT NULL,'
        '    NUM_FAB_FORNECEDOR  VARCHAR(60) NOT NULL,'
        '    ATIVO               INTEGER DEFAULT 1,'
        '    DATA_CADASTRO       TIMESTAMP,'
        '    DATA_MODIFICACAO    TIMESTAMP,'
        '    COD_GRADE           INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE PRODUTOS_FORN_NFE2 ADD CONSTRAINT PK_PRODUTOS_FORN_N' +
          'FE2 PRIMARY KEY (COD_EMPRESA,CPFCGC,GRUPO_PROD,COD_PROD,NUM_FAB_' +
          'FORNECEDOR);'
        ''
        
          'ALTER TABLE PRODUTOS_FORN_NFE2 ADD CONSTRAINT FK_PRODUTOS_FORN_N' +
          'FE2 FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES P' +
          'RODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCADE ON' +
          ' UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW CODIGO_FORNECEDOR_VW('
        '    SEQID,'
        '    COD_EMPRESA,'
        '    COD_FORNECEDOR,'
        '    CPFCGC,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    NUM_FAB_FORNECEDOR,'
        '    ATIVO,'
        '    DATA_CADASTRO,'
        '    DATA_MODIFICACAO,'
        '    COD_GRADE,'
        '    TABELA)'
        'AS'
        'select 0, PRODUTOS_FORN_NFE2.COD_EMPRESA,'
        '       0 COD_FORNECEDOR, PRODUTOS_FORN_NFE2.CPFCGC,'
        
          '       PRODUTOS_FORN_NFE2.GRUPO_PROD, PRODUTOS_FORN_NFE2.COD_PRO' +
          'D, PRODUTOS_FORN_NFE2.NUM_FAB_FORNECEDOR,'
        
          '       PRODUTOS_FORN_NFE2.ATIVO, PRODUTOS_FORN_NFE2.DATA_CADASTR' +
          'O, PRODUTOS_FORN_NFE2.DATA_MODIFICACAO,'
        '       PRODUTOS_FORN_NFE2.COD_GRADE, '#39'PRODUTOS_FORN_NFE2'#39' TABELA'
        'from PRODUTOS_FORN_NFE2'
        'union'
        'select PRODUTOS_FORN_NFE.SEQID, PRODUTOS_FORN_NFE.COD_EMPRESA,'
        '       PRODUTOS_FORN_NFE.COD_FORNECEDOR, CLIENTES.CPFCGC,'
        
          '       PRODUTOS_FORN_NFE.GRUPO_PROD, PRODUTOS_FORN_NFE.COD_PROD,' +
          ' PRODUTOS_FORN_NFE.NUM_FAB_FORNECEDOR,'
        
          '       PRODUTOS_FORN_NFE.ATIVO, PRODUTOS_FORN_NFE.DATA_CADASTRO,' +
          ' PRODUTOS_FORN_NFE.DATA_MODIFICACAO,'
        '       PRODUTOS_FORN_NFE.COD_GRADE, '#39'PRODUTOS_FORN_NFE'#39' TABELA'
        'from PRODUTOS_FORN_NFE'
        
          'INNER JOIN CLIENTES ON CLIENTES.COD_CLIENTE = PRODUTOS_FORN_NFE.' +
          'COD_FORNECEDOR'
        '    AND CLIENTES.COD_EMPRESA = PRODUTOS_FORN_NFE.COD_EMPRESA'
        'union'
        'select 0 SEQID, CODIGO_FORNECEDOR.COD_EMPRESA,'
        '       CODIGO_FORNECEDOR.COD_FORNECEDOR, CLIENTES.CPFCGC,'
        
          '       CODIGO_FORNECEDOR.GRUPO_PROD, CODIGO_FORNECEDOR.COD_PROD,' +
          ' cast(CODIGO_FORNECEDOR.NUM_FAB_FORNECEDOR as varchar(60)),'
        
          '       CODIGO_FORNECEDOR.ATIVO, CODIGO_FORNECEDOR.DATA_CADASTRO,' +
          ' CODIGO_FORNECEDOR.DATA_MODIFICACAO,'
        '       CODIGO_FORNECEDOR.COD_GRADE, '#39'CODIGO_FORNECEDOR'#39' TABELA'
        'from CODIGO_FORNECEDOR'
        
          'INNER JOIN CLIENTES ON CLIENTES.COD_CLIENTE = CODIGO_FORNECEDOR.' +
          'COD_FORNECEDOR'
        '    AND CLIENTES.COD_EMPRESA = CODIGO_FORNECEDOR.COD_EMPRESA;'
        '|/BLOCO|'
        ''
        'CREATE SEQUENCE GEN_PRODUTOS_FORN_NFE2;'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER PRODUTOS_FORN_NFE2_BI_SEQID FOR PRODUTOS' +
          '_FORN_NFE2'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        '  if (new.DATA_CADASTRO is null) then'
        '    new.DATA_CADASTRO = current_date;'
        '  if (new.DATA_MODIFICACAO is null) then'
        '    new.DATA_MODIFICACAO = current_date;'
        'end;'
        '|/BLOCO|'
        
          'CREATE INDEX IDX_PRODUTOS_FORN_NFE2_COD ON PRODUTOS_FORN_NFE2 (C' +
          'OD_EMPRESA, CPFCGC, NUM_FAB_FORNECEDOR);'
        'ALTER TABLE SENHAS ADD DATA_LOGIN TIMESTAMP;'
        'ALTER TABLE SENHAS ADD DATA_LOGIN_ANT TIMESTAMP;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER trigger senhas_aiu_login for senhas'
        'active after insert or update position 0'
        'AS'
        'begin'
        '  if (old.data_login = new.data_login) then'
        '    exit;'
        ''
        
          '  delete from ri_tab_log r where r.dh_rep < (current_timestamp -' +
          ' 1);'
        'end;'
        '|/BLOCO|'
        ''
        'CREATE INDEX IDX_NOTAFISCAL_CHAVE_NFE ON NOTAFISCAL (CHAVE_NFE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NFE013'#39', :COD_EMPRESA, '#39'ENVIAR NFE COM BOLETO E NOSSO' +
          ' NUMERO SEM ANEXO'#39', 1, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NFE012'#39', :COD_EMPRESA, '#39'ENVIAR NFE COM BOLETO SEM ANE' +
          'XO'#39', 1, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'EFD019'#39', :COD_EMPRESA, '#39'GERAR EFD ICMS IPI COM PENDEN' +
          'CIAS EM NOTAFISCAL'#39', 100, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'EFD020'#39', :COD_EMPRESA, '#39'GERAR EFD ICMS IPI COM PENDEN' +
          'CIAS EM NFCE'#39', 100, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'EFD021'#39', :COD_EMPRESA, '#39'GERAR EFD PISCOFINS COM PENDE' +
          'NCIAS EM NOTAFISCAL'#39', 100, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'EFD022'#39', :COD_EMPRESA, '#39'GERAR EFD PISCOFINS COM PENDE' +
          'NCIAS EM NFCE'#39', 100, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NFC038'#39', :COD_EMPRESA, '#39'CRIAR/ALTERAR NFCE COM DIA DI' +
          'FERENTE DO MOV OP'#39', 100, '#39'N'#39', '#39'S'#39');'
        
          'CREATE INDEX DOC_ELETRONICO_IDX_IDDOC ON DOC_ELETRONICO (ID_DOC,' +
          ' COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PRODUTOS_ESTOQUE_DIARIO FOR PRODUTOS'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        'begin'
        '  /* Trigger text */'
        ''
        '  delete from estoque_diario'
        '  where grupo_prod = old.grupo_prod'
        '  and cod_prod = old.cod_prod'
        '  and cod_empresa = old.cod_empresa'
        '  and dia = '#39'30.12.1899'#39';'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NF0223'#39', :COD_EMPRESA, '#39'HAB ALT PRECO ENT NF+(GLOB:NF' +
          '_E_ALTERACAO_PRECO)'#39', 100, '#39'N'#39', '#39'S'#39');'
        ''
        
          'CMD:REPL|update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LE' +
          'NGTH = 30, RDB$CHARACTER_LENGTH = 30, RDB$COLLATION_ID = 0 where' +
          ' RDB$FIELD_NAME = (select trim(f.rdb$field_name) from rdb$relati' +
          'on_fields r join rdb$fields f on f.rdb$field_name = rdb$field_so' +
          'urce where (r.rdb$relation_name = '#39'PRODUTOS'#39') and (r.rdb$field_n' +
          'ame='#39'MARCA_P'#39'));'
        
          'CMD:REPL|update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LE' +
          'NGTH = 30, RDB$CHARACTER_LENGTH = 30, RDB$COLLATION_ID = 0 where' +
          ' RDB$FIELD_NAME = (select trim(f.rdb$field_name) from rdb$relati' +
          'on_fields r join rdb$fields f on f.rdb$field_name = rdb$field_so' +
          'urce where (r.rdb$relation_name = '#39'PERFIL_PRODUTOS'#39') and (r.rdb$' +
          'field_name='#39'MARCA_P'#39'));'
        
          'CMD:REPL|update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$COLLATIO' +
          'N_ID = 0 where RDB$FIELD_NAME = (select trim(f.rdb$field_name) f' +
          'rom rdb$relation_fields r join rdb$fields f on f.rdb$field_name ' +
          '= rdb$field_source where (r.rdb$relation_name = '#39'MARCA_PROD'#39') an' +
          'd (r.rdb$field_name='#39'DESCRICAO_MARCA'#39'));'
        
          'CMD:REPL|update marca_prod set descricao_marca = trim(descricao_' +
          'marca);'
        ''
        '|BLOCO|'
        'CREATE TABLE IMAGENS_DOC ('
        '    COD_IMG      INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    IMAGEM       BLOB SUB_TYPE 1 SEGMENT SIZE 256,'
        '    US_CAD       INTEGER,'
        '    DATA_CAD     TIMESTAMP'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE IMAGENS_DOC ADD CONSTRAINT PK_IMAGENS_DOC PRIMARY KE' +
          'Y (COD_IMG, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CONTAS_A_PAGAR_IMAGENS ('
        '    COD_CONTRP   INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    COD_IMG      INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CONTAS_A_PAGAR_IMAGENS ADD CONSTRAINT PK_CONTAS_A_PA' +
          'GAR_IMAGENS PRIMARY KEY (COD_CONTRP, COD_EMPRESA, COD_IMG);'
        
          'CREATE INDEX IDX_CONTAS_A_PAGAR_IMAGENS_CTP ON CONTAS_A_PAGAR_IM' +
          'AGENS (COD_CONTRP, COD_EMPRESA);'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP036'#39', :COD_EMPRESA, '#39'AD' +
          'ICIONAR IMAGEM CONTAS A PAGAR'#39', 3, '#39'FRMCADCONTASAPAGAR'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP037'#39', :COD_EMPRESA, '#39'VI' +
          'SUALIZAR IMAGEM CONTAS A PAGAR'#39', 3, '#39'FRMCADCONTASAPAGAR'#39', 1, '#39'N'#39 +
          ', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP038'#39', :COD_EMPRESA, '#39'PR' +
          'OXIMA IMAGEM CONTAS A PAGAR'#39', 3, '#39'FRMCADCONTASAPAGAR'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP039'#39', :COD_EMPRESA, '#39'IM' +
          'AGEM ANTERIOR CONTAS A PAGAR'#39', 3, '#39'FRMCADCONTASAPAGAR'#39', 1, '#39'N'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP040'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR IMAGEM CONTAS A PAGAR'#39', 3, '#39'FRMCADCONTASAPAGAR'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|update pedvenda_prod pvp set pvp.col_cod_vendedor = nul' +
          'l where pvp.tipo = '#39'REQ'#39' and pvp.col_cod_vendedor is not null an' +
          'd pvp.data_inclusao >= current_date - 90 and pvp.cod_empresa = :' +
          'COD_EMPRESA')
    end
  end
end
