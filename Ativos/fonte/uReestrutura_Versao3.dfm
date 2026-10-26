inherited frmReestruturaVersao3: TfrmReestruturaVersao3
  Caption = 'frmReestruturaVersao3'
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
        'ALTER TABLE EQUIPAMENTO ADD US_CAD INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE VEICULOS ADD KM_V INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE SUG_OS ('
        '    COD_SUG_OS    INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    COD_SERV_SUG  INTEGER NOT NULL,'
        '    COD_VENDEDOR  INTEGER NOT NULL,'
        '    COD_EQUIP     INTEGER,'
        '    COD_VEIC      INTEGER,'
        '    CHASSI        VARCHAR(17),'
        '    PLACA         VARCHAR(10),'
        '    US_CAD        INTEGER,'
        '    DATA_CAD      TIMESTAMP,'
        '    HORA_CAD      CHAR(8),'
        '    KM            INTEGER DEFAULT 0,'
        '    NDOC          INTEGER,'
        '    TPDOC         CHAR(3),'
        '    ATIVO         INTEGER DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SUG_OS ADD CONSTRAINT PK_SUG_OS PRIMARY KEY (COD_SUG' +
          '_OS, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SUG_OS ADD CONSTRAINT FK_SUG_OS_VEICULOS FOREIGN KEY' +
          ' (PLACA, CHASSI, COD_VEIC, COD_EMPRESA) REFERENCES VEICULOS (PLA' +
          'CA, CHASSI, CODIGO, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SUG_OS ADD CONSTRAINT FK_SUG_OS_EQUIPAMENTO FOREIGN ' +
          'KEY (COD_EQUIP, COD_EMPRESA) REFERENCES EQUIPAMENTO (COD_EQUIP, ' +
          'COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_SUG_OS_EQUIPAMENTO ON SUG_OS (CHASSI, PLACA, CO' +
          'D_VEIC, COD_EMPRESA, COD_SERV_SUG);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_SUG_OS_MODVEICULO ON SUG_OS (COD_EQUIP, COD_EMP' +
          'RESA, COD_SERV_SUG);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_SUG_OS_NDOC ON SUG_OS (NDOC, TPDOC, COD_EMPRESA' +
          ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE REGRAS_SUG ('
        '    CODIGO           INTEGER NOT NULL,'
        '    COD_EMPRESA      INTEGER NOT NULL,'
        '    TIPO             CHAR(1) NOT NULL,'
        '    DESCRICAO        VARCHAR(50),'
        '    MES_RET_SERV1    INTEGER,'
        '    MES_RET_SERV2    INTEGER,'
        '    INTERV_MES_SERV  INTEGER,'
        '    KM_RET_SERV1     INTEGER,'
        '    KM_RET_SERV2     INTEGER,'
        '    INTERV_KM_SERV   INTEGER DEFAULT 0,'
        '    US_CAD           INTEGER,'
        '    DATA_CAD         TIMESTAMP,'
        '    HORA_CAD         CHAR(8),'
        '    US_MOD           INTEGER,'
        '    DATA_MOD         TIMESTAMP,'
        '    HORA_MOD         CHAR(8),'
        '    ATIVO            INTEGER DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE REGRAS_SUG ADD CONSTRAINT PK_REGRAS_SUG PRIMARY KEY ' +
          '(CODIGO, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE REGRAS_SUG_ITENS ('
        '    CODIGO       INTEGER NOT NULL,'
        '    COD_TIPO     INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    TIPO         CHAR(1) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE REGRAS_SUG_ITENS ADD CONSTRAINT PK_REGRAS_SUG_ITENS ' +
          'PRIMARY KEY (CODIGO, COD_TIPO, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE REGRAS_SUG_ITENS ADD CONSTRAINT FK_REGRSUG_ITENS FOR' +
          'EIGN KEY (CODIGO, COD_EMPRESA) REFERENCES REGRAS_SUG (CODIGO, CO' +
          'D_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_REGRAS_SUG_ITENS ON REGRAS_SUG_ITENS (COD_TIPO,' +
          ' COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_REGRAS_SUG_ITENS_TIPO ON REGRAS_SUG_ITENS (COD_' +
          'TIPO, COD_EMPRESA, TIPO);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE SUGESTAOSERVICO ('
        '    COD_SUG       INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    COD_EQUIP     INTEGER,'
        '    COD_VEIC      INTEGER,'
        '    CHASSI        VARCHAR(17),'
        '    PLACA         VARCHAR(10),'
        '    COD_CLIENTE   INTEGER,'
        '    COD_SUG_OS    INTEGER,'
        '    COD_SERV_SUG  INTEGER,'
        '    COD_AGENDA    INTEGER,'
        '    DATA          TIMESTAMP,'
        '    HORA          CHAR(8),'
        '    US_CAD        INTEGER,'
        '    DATA_CAD      TIMESTAMP,'
        '    HORA_CAD      CHAR(8),'
        '    US_MOD        INTEGER,'
        '    DATA_MOD      TIMESTAMP,'
        '    HORA_MOD      CHAR(8),'
        '    ULT_ATD       INTEGER,'
        '    NDOC_ANT      INTEGER,'
        '    TPDOC_ANT     CHAR(3),'
        '    NDOC          INTEGER,'
        '    TPDOC         CHAR(3),'
        '    STATUS        VARCHAR(10),'
        '    ATIVO         INTEGER DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SUGESTAOSERVICO ADD CONSTRAINT PK_SUGSERVICO PRIMARY' +
          ' KEY (COD_SUG, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SUGESTAOSERVICO ADD CONSTRAINT FK_SUGSERVICO_VEICULO' +
          'S FOREIGN KEY (PLACA, CHASSI, COD_VEIC, COD_EMPRESA) REFERENCES ' +
          'VEICULOS (PLACA, CHASSI, CODIGO, COD_EMPRESA) ON UPDATE CASCADE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SUGESTAOSERVICO ADD CONSTRAINT FK_SUGSERVICO_EQUIPAM' +
          'ENTO FOREIGN KEY (COD_EQUIP, COD_EMPRESA) REFERENCES EQUIPAMENTO' +
          ' (COD_EQUIP, COD_EMPRESA) ON UPDATE CASCADE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SUGESTAOSERVICO ADD CONSTRAINT FK_SUGSERVICO_SUG_OS ' +
          'FOREIGN KEY (COD_SUG_OS, COD_EMPRESA) REFERENCES SUG_OS (COD_SUG' +
          '_OS, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE SUGESTAOSERVICO ADD CONSTRAINT FK_SUGSERVICO_AGENDA ' +
          'FOREIGN KEY (COD_AGENDA, COD_EMPRESA) REFERENCES AGENDA (COD_AGE' +
          'NDA, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_SUGESTAOSERVICO_DATA ON SUGESTAOSERVICO (DATA, ' +
          'COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_SUGESTAOSERVICO_SERV ON SUGESTAOSERVICO (COD_SE' +
          'RV_SUG, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_SUGESTAOSERVICO_PEDVENDA ON SUGESTAOSERVICO (ND' +
          'OC, TPDOC, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE OCORRENCIA_SUG ('
        '    COD_OCORR    INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    COD_EQUIP    INTEGER,'
        '    COD_VEIC     INTEGER,'
        '    CHASSI       VARCHAR(17),'
        '    PLACA        VARCHAR(10),'
        '    OBSERVACAO   BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
        '    US_CAD       INTEGER,'
        '    DATA_CAD     TIMESTAMP,'
        '    HORA_CAD     CHAR(8)'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE OCORRENCIA_SUG ADD CONSTRAINT PK_OCORR_SUG PRIMARY K' +
          'EY (COD_OCORR, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE OCORRENCIA_SUG ADD CONSTRAINT FK_OCORR_SUG_VEICULOS ' +
          'FOREIGN KEY (PLACA, CHASSI, COD_VEIC, COD_EMPRESA) REFERENCES VE' +
          'ICULOS (PLACA, CHASSI, CODIGO, COD_EMPRESA) ON UPDATE CASCADE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE OCORRENCIA_SUG ADD CONSTRAINT FK_OCORR_SUG_EQUIPAMEN' +
          'TO FOREIGN KEY (COD_EQUIP, COD_EMPRESA) REFERENCES EQUIPAMENTO (' +
          'COD_EQUIP, COD_EMPRESA) ON UPDATE CASCADE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EQUIPAMENTO_SUGESTAO FOR EQUIPAMENTO'
        'ACTIVE AFTER INSERT OR UPDATE POSITION 0'
        'AS'
        '    DECLARE VARIABLE vSugServico integer;'
        '    DECLARE VARIABLE vUsarAparelho char(3);'
        '    DECLARE VARIABLE vCodServ integer;'
        '    DECLARE VARIABLE vCodSug integer;'
        '    DECLARE VARIABLE vCodSugOs integer;'
        '    DECLARE VARIABLE vInterM integer;'
        '    DECLARE VARIABLE vDataCad timestamp;'
        '    DECLARE VARIABLE vHoraCad char(8);'
        '    DECLARE VARIABLE vExisteSug integer;'
        'begin'
        '  if (user = '#39'REPL'#39') then'
        '    exit;'
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
        '    and config_sistema.cod_empresa = 1'
        '    into: vSugServico;'
        ''
        '    if (vsugservico <= 0) then'
        '        exit;'
        ''
        '    select first 1 sugestaoservico.cod_sug from sugestaoservico'
        
          '    where sugestaoservico.cod_equip = new.cod_equip and sugestao' +
          'servico.cod_empresa = new.cod_empresa'
        '    and sugestaoservico.status <> '#39'CANCELADA'#39
        '    into: vExisteSug;'
        ''
        '    if (vExisteSug > 0) then'
        '        exit;'
        ''
        '    vDataCad = current_date;'
        ''
        
          '    select case when(extract(hour from current_timestamp) <=9) t' +
          'hen '#39'0'#39'|| extract(hour from current_timestamp)'
        '    else extract(hour from current_timestamp)'
        
          '    end ||'#39':'#39'|| case when (extract(minute from current_timestamp' +
          ') <= 9) then'
        '        '#39'0'#39'|| extract(minute from current_timestamp)'
        
          '    else extract(minute from current_timestamp) end from rdb$dat' +
          'abase'
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
        '            null, null, null, :vcodserv, new.us_cad, 1);'
        ''
        '            INSERT INTO SUGESTAOSERVICO'
        
          '            (COD_SUG, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASSI, ' +
          'PLACA, COD_SUG_OS, ULT_ATD, DATA, HORA,'
        
          '            ATIVO, COD_CLIENTE, US_CAD, DATA_CAD, HORA_CAD, NDOC' +
          '_ANT, TPDOC_ANT, COD_SERV_SUG)'
        '            VALUES'
        
          '            (:vCodSug, new.cod_empresa, new.cod_equip, null, nul' +
          'l, null, null,'
        
          '            new.us_cad, (:vDataCad + (:vInterM * 30)), :vHoraCad' +
          ','
        '            1, new.cod_prop,  new.us_cad, :vDataCad, :vHoraCad,'
        '            null, null, :vcodserv);'
        '        end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_VEICULOS_SUGESTAO FOR VEICULOS'
        'ACTIVE AFTER INSERT OR UPDATE POSITION 0'
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
        'begin'
        '    if (user = '#39'REPL'#39') then'
        '        exit;'
        ''
        '    if (new.modelo <= 0) then'
        '        exit;'
        '    '
        '    if (coalesce(new.km_v, 0) > 0) then'
        '        exit;    '
        ''
        '    select empresa.dadvap from empresa'
        '    where empresa.cod_empresa = new.cod_empresa'
        '    into: vusaraparelho;'
        ''
        '    if (trim(vusaraparelho) = '#39'SIM'#39') then'
        '        exit;'
        ''
        '    select config_sistema.value1_f from config_sistema'
        '    where config_sistema.chave like '#39'sug_serv_hab'#39
        '    and config_sistema.cod_empresa = 1'
        '    into: vSugServico;'
        ''
        '    if (vsugservico <= 0) then'
        '        exit;'
        ''
        '    vDataCad = current_date;'
        '    '
        
          '    select case when(extract(hour from current_timestamp) <=9) t' +
          'hen '#39'0'#39'|| extract(hour from current_timestamp)'
        '    else extract(hour from current_timestamp)'
        
          '    end ||'#39':'#39'|| case when (extract(minute from current_timestamp' +
          ') <= 9) then'
        '        '#39'0'#39'|| extract(minute from current_timestamp)'
        
          '    else extract(minute from current_timestamp) end from rdb$dat' +
          'abase'
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
        '            0, null, null, :vcodserv, new.us_cad, 1);'
        '    '
        '            INSERT INTO SUGESTAOSERVICO'
        
          '            (COD_SUG, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASSI, ' +
          'PLACA, COD_SUG_OS, ULT_ATD, DATA, HORA,'
        
          '            ATIVO, COD_CLIENTE, US_CAD, DATA_CAD, HORA_CAD, NDOC' +
          '_ANT, TPDOC_ANT, COD_SERV_SUG)'
        '            VALUES'
        
          '            (:vCodSug, new.cod_empresa, null, new.codigo, new.ch' +
          'assi, new.placa, null,'
        '            new.us_cad, (:vDataCad + (:vDias * 30)), :vHoraCad,'
        
          '            1, new.cod_cliente, new.us_cad, :vDataCad, :vHoraCad' +
          ','
        '            null, null, :vcodserv);'
        '        end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_SUG_OS FOR PEDVENDA'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        '    DECLARE VARIABLE vSugServico integer;'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  select config_sistema.value1_f from config_sistema'
        '  where config_sistema.chave like '#39'sug_serv_hab'#39
        '  and config_sistema.cod_empresa = 1'
        '  into: vSugServico;'
        ''
        '  if (vsugservico <= 0) then'
        '    exit;'
        ''
        '  if (trim(coalesce(new.tipo, '#39#39')) <> '#39'OS'#39') then'
        '    exit;'
        ''
        
          '  if ((trim(coalesce(old.status_ped, '#39#39')) <> trim(coalesce(new.s' +
          'tatus_ped, '#39#39')))'
        '      and trim(coalesce(old.status_ped, '#39#39')) = '#39'FECHADA'#39') then'
        '  begin'
        '      delete from sug_os'
        
          '      where sug_os.ndoc = new.nped and sug_os.tpdoc = trim(coale' +
          'sce(new.tipo, '#39#39')) and sug_os.cod_empresa = new.cod_empresa;'
        ''
        
          '      update sugestaoservico set sugestaoservico.status = null, ' +
          'sugestaoservico.ndoc = null, sugestaoservico.tpdoc  = null'
        
          '      where sugestaoservico.ndoc = new.nped and sugestaoservico.' +
          'tpdoc = trim(coalesce(new.tipo, '#39#39')) and sugestaoservico.cod_emp' +
          'resa = new.cod_empresa;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:REPL|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS363'#39', :COD_EMPRESA, '#39'ABRIR TELA ' +
          'DE CADASTRO REGRA SUGESTAO SERVICO'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39',' +
          ' 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS364'#39', :COD_EMPRESA, '#39'BT PESQUISA' +
          'R REGRA SUGESTAO SERVICO'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS365'#39', :COD_EMPRESA, '#39'BT NOVO REG' +
          'RA SUGESTAO SERVICO'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N'#39', '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS366'#39', :COD_EMPRESA, '#39'BT ALTERAR ' +
          'REGRA SUGESTAO SERVICO'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N'#39', '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS367'#39', :COD_EMPRESA, '#39'BT ENVIAR R' +
          'EGRA SUGESTAO SERVICO PARA LIXEIRA'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39',' +
          ' 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS368'#39', :COD_EMPRESA, '#39'BT REMOVER ' +
          'PERMANENTEMENTE REGRA SUGESTAO SERVICO'#39', 10, '#39'FRMCADREGRASSUGEST' +
          'AO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS369'#39', :COD_EMPRESA, '#39'BT RESTAURA' +
          'R DA LIXEIRA REGRA SUGESTAO SERVICO'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39 +
          ', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS370'#39', :COD_EMPRESA, '#39'BT SALVAR R' +
          'EGRA SUGESTAO SERVICO'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N'#39', '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS371'#39', :COD_EMPRESA, '#39'BT ABRIR LI' +
          'XEIRA REGRA SUGESTAO SERVICO'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N' +
          #39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS372'#39', :COD_EMPRESA, '#39'MARCAR MODE' +
          'LO/EQUIPAMENTOS'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N'#39', '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS373'#39', :COD_EMPRESA, '#39'DESMARCAR M' +
          'ODELO/EQUIPAMENTOS'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N'#39', '#39'S'#39', CU' +
          'RRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS374'#39', :COD_EMPRESA, '#39'SELECIONAR ' +
          'TODOS MODELO/EQUIPAMENTOS'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS375'#39', :COD_EMPRESA, '#39'DESMARCAR T' +
          'ODOS MODELO/EQUIPAMENTOS'#39', 10, '#39'FRMCADREGRASSUGESTAO'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS376'#39', :COD_EMPRESA, '#39'ABRIR TELA ' +
          'DE SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS377'#39', :COD_EMPRESA, '#39'BT PESQUISA' +
          'R SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS378'#39', :COD_EMPRESA, '#39'BT VISUALIZ' +
          'AR SERVICO SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS379'#39', :COD_EMPRESA, '#39'BT VISUALIZ' +
          'AR OCORRENCIA SUGESTAO SERVICO'#39', 10, '#39'OCORRENCIA_SUG'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS380'#39', :COD_EMPRESA, '#39'BT INCLUIR ' +
          'OCORRENCIA SUGESTAO SERVICO'#39', 10, '#39'OCORRENCIA_SUG'#39', 1, '#39'N'#39', '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS381'#39', :COD_EMPRESA, '#39'BT EDITAR O' +
          'CORRENCIA SUGESTAO SERVICO'#39', 10, '#39'OCORRENCIA_SUG'#39', 1, '#39'N'#39', '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS382'#39', :COD_EMPRESA, '#39'BT EXCLUIR ' +
          'OCORRENCIA SUGESTAO SERVICO'#39', 10, '#39'OCORRENCIA_SUG'#39', 1, '#39'N'#39', '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS383'#39', :COD_EMPRESA, '#39'BT SALVAR O' +
          'CORRENCIA SUGESTAO SERVICO'#39', 10, '#39'OCORRENCIA_SUG'#39', 1, '#39'N'#39', '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS384'#39', :COD_EMPRESA, '#39'BT ENVIAR E' +
          'MAIL SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS385'#39', :COD_EMPRESA, '#39'BT INCLUIR ' +
          'AGENDAMENTO SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS386'#39', :COD_EMPRESA, '#39'BT EDITAR A' +
          'GENDAMENTO SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS387'#39', :COD_EMPRESA, '#39'BT EXCLUIR ' +
          'AGENDAMENTO SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS388'#39', :COD_EMPRESA, '#39'BT ADIAR SU' +
          'GESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_' +
          'DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS389'#39', :COD_EMPRESA, '#39'BT FINALIZA' +
          'R SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS390'#39', :COD_EMPRESA, '#39'BT CANCELAR' +
          ' SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS391'#39', :COD_EMPRESA, '#39'BT REABRIR ' +
          'SUGESTAO SERVICO'#39', 10, '#39'FRMSUGESTAOSERVICO'#39', 1, '#39'N'#39', '#39'S'#39', CURREN' +
          'T_DATE);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE PEDVENDA_PROD ADD COD_VENDEDOR1 INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE PEDVENDA ADD COD_VENDEDOR1 INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE COLABORADOR ADD PARTICIPANTE CHAR(1);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE PARTICIPANTE ('
        '    COD_PARTICIPANTE       INTEGER NOT NULL,'
        '    COD_EMPRESA            INTEGER NOT NULL,'
        '    CODIGO_UF              SMALLINT,'
        '    COD_CIDADE             SMALLINT,'
        '    COD_BAIRRO             SMALLINT,'
        '    NOME_PARTICIPANTE      VARCHAR(35),'
        '    END_PARTICIPANTE       VARCHAR(35),'
        '    BAIRRO_PARTICIPANTE    VARCHAR(35),'
        '    CIDADE_PARTICIPANTE    VARCHAR(35),'
        '    SIGLA_UF               CHAR(2),     '
        '    CEP_PARTICIPANTE       CHAR(9),'
        '    FONE_PARTICIPANTE      CHAR(14),'
        '    CPF_PARTICIPANTE       CHAR(11),'
        '    OBS_PARTICIPANTE       BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
        '    DATA_MOD_PART          TIMESTAMP,'
        '    DATA_CAD_PART          TIMESTAMP,'
        '    DAT_NASC_PART          TIMESTAMP,'
        '    EMAIL                  VARCHAR(128),'
        '    FONE_CONTATO           CHAR(40),'
        '    ATIVO                  INTEGER default 1'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE PARTICIPANTE ADD CONSTRAINT PK_PARTICIPANTE PRIMARY ' +
          'KEY (COD_PARTICIPANTE, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE PEDVENDA ADD CONSTRAINT FK_PEDVENDA_PART FOREIGN KEY' +
          ' (COD_VENDEDOR1, COD_EMPRESA) REFERENCES PARTICIPANTE (COD_PARTI' +
          'CIPANTE, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE PEDVENDA_PROD ADD CONSTRAINT FK_PEDVENDA_PROD_PART F' +
          'OREIGN KEY (COD_VENDEDOR1, COD_EMPRESA) REFERENCES PARTICIPANTE ' +
          '(COD_PARTICIPANTE, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:REPL|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS392'#39', :COD_EMPRESA, '#39'ABRIR TELA ' +
          'DE CADASTRO DE PARTICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS393'#39', :COD_EMPRESA, '#39'BT PESQUISA' +
          'R PARTICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_' +
          'DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS394'#39', :COD_EMPRESA, '#39'BT NOVO PAR' +
          'TICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE)' +
          ';'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS395'#39', :COD_EMPRESA, '#39'BT ALTERAR ' +
          'PARTICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DA' +
          'TE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS396'#39', :COD_EMPRESA, '#39'BT ENVIAR P' +
          'ARTICIPANTE PARA LIXEIRA'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS397'#39', :COD_EMPRESA, '#39'BT REMOVER ' +
          'PERMANENTEMENTE PARTICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS398'#39', :COD_EMPRESA, '#39'BT RESTAURA' +
          'R DA LIXEIRA PARTICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S' +
          #39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS399'#39', :COD_EMPRESA, '#39'BT SALVAR P' +
          'ARTICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DAT' +
          'E);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS400'#39', :COD_EMPRESA, '#39'BT ABRIR LI' +
          'XEIRA PARTICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS401'#39', :COD_EMPRESA, '#39'BT IMPRIMIR' +
          ' PARTICIPANTE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_D' +
          'ATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS402'#39', :COD_EMPRESA, '#39'PESQUISAR B' +
          'AIRRO'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS403'#39', :COD_EMPRESA, '#39'CADASTRAR B' +
          'AIRRO'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS404'#39', :COD_EMPRESA, '#39'PESQUISAR C' +
          'IDADE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS405'#39', :COD_EMPRESA, '#39'CADASTAR CI' +
          'DADE'#39', 10, '#39'FRMCADPARTICIPANTE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        '|/BLOCO|'
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
        
          'select v.cod_empresa,  v.data_fech, pp.nped,pp.tipo, pp.grupo_pr' +
          'od,pp.cod_prod,pp.cod_grade,'
        
          'coalesce(pp.quant_ped_item,0) as quant_ped_item,coalesce(pp.vlun' +
          '_ped_item,0) as vlun_ped_item,'
        
          'coalesce(pp.vltot_ped_item,0) as vltot_ped_item, coalesce(pp.rat' +
          'eio_desc,0) as rateio_desc,'
        'coalesce(pp.rateio_acresc,0) as rateio_acresc,pp.descr_prod_ped,'
        
          'coalesce(pp.pcust_mc,0) as pcust_mc,coalesce(pp.comiss_prod,0) a' +
          's comiss_prod,'
        
          'coalesce(pp.comiss_prod_ger,0) as comiss_prod_ger, coalesce(pp.n' +
          '_nf,0) as n_nf,'
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
        
          'select d.cod_empresa,d.data,d.sequencia,'#39'DEV'#39' as tipo,d.grupo_pr' +
          'od,d.cod_prod,d.cod_grade,'
        
          'd.quant as quant_ped_item,((-1)*d.valor) as valor,((-1)*(d.quant' +
          '*d.valor)) as vltot_ped_item,0 as rateio_desc,'
        
          '0 as rateio_acresc,substr(d.descricao,1,60) as descr_prod_ped,((' +
          '-1)*d.pcust_mc) as pcust_mc,((-1)*d.comiss_prod),'
        
          '((-1)*d.comiss_prod_ger),num_nota_nfe,case when tv.descricao is ' +
          'null then '#39'V - VAREJO          '#39
        
          'else tv.descricao end as descricao,case when tv.sigla is null th' +
          'en '#39'V'#39' else'
        
          'tv.sigla end as sigla,tv.tipo_os,g.descricao,c.nome_vendedor, nu' +
          'll nome_participante,'
        
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
        
          'CREATE INDEX IDX_ESTOQUE_DIARIO_VEICULOS ON ESTOQUE_DIARIO (CHAS' +
          'SI, DIA, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_ESTOQUE_DIARIO_PRODUTOS ON ESTOQUE_DIARIO (GRUP' +
          'O_PROD, COD_PROD, DIA, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_ESTOQUE_DIARIO_PRODUTOS_GRA ON ESTOQUE_DIARIO (' +
          'GRUPO_PROD, COD_PROD, COD_GRADE, DIA, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW ENTRADASMESESV('
        '    COD_NF,'
        '    NUM_NOTA,'
        '    CHASSI,'
        '    DATA_CH_NOTA,'
        '    DESCRICAO_VERSAO,'
        '    COR,'
        '    ANO_FAB,'
        '    ANO_MOD,'
        '    CUSTO,'
        '    COD_EMPRESA,'
        '    COD_ESTMOTO,'
        '    COD_NF_DEV,'
        '    NITEM_DEV,'
        '    TIPV_VEICULO,'
        '    STATUS_USO)'
        'AS'
        
          'select 0, it.num_nota,it.chassi_c,et.data_ch_nota, substr(it.des' +
          'cricao_versao, 1, 25),'
        
          'it.cor,it.ano_fab,it.ano_mod,((et.valor_tot_nota/et.qtde_motos_n' +
          'ota)+it.piscofins),et.cod_empresa,'
        '0, 0, 0, nt.tipv_veiculo,cast (et.tipo_entrada as char(10))'
        'from ent_moto et'
        
          'inner join ent_moto_itens it on it.num_nota = et.num_nota and it' +
          '.cod_fornecedor = et.cod_fornecedor and it.cod_empresa = et.cod_' +
          'empresa'
        'inner join nat_op nt on nt.codigo_nop = et.cod_fisc_nota'
        'where et.ativo = 1 --and coalesce(nt.compra, '#39#39') <> '#39'N'#39
        'union'
        
          'select nf4.cod_nf,nf4.num_nf,it4.chassi,nf4.data_lanc,substr(it4' +
          '.descricao_item,1,25),'
        
          'itv4.cor,itv4.ano_fab,itv4.ano_mod,it4.prec_cusm_prod,nf4.cod_em' +
          'presa,'
        
          'it4.cod_estmoto,it4.cod_nf_dev, it4.nitem_dev, nt.tipv_veiculo, ' +
          'itv4.tipo_venda'
        'from notafiscal nf4'
        
          'inner join notafiscal_item it4 on nf4.cod_nf=it4.cod_nf and nf4.' +
          'cod_empresa=it4.cod_empresa'
        
          'inner join notafiscal_item_veiculo itv4 on it4.cod_nf=itv4.cod_n' +
          'f and it4.cod_empresa = itv4.cod_empresa and it4.chassi = itv4.c' +
          'hassi'
        'inner join nat_op nt on nt.codigo_nop = it4.codigo_nop'
        'where nf4.natureza_nf='#39'E'#39' and (nf4.status = '#39'Fechada'#39')'
        '--and coalesce(nt.compra, '#39#39') <> '#39'N'#39
        'and nf4.tipo_nf = '#39'V'#39' and nf4.ativo=1;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:REPL|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO302'#39', :COD_EMPRESA, '#39'HABILITAR P' +
          'RECOS POR QTDE CADASTRO SIMPL PROD'#39', 1, '#39'FRMCADPRODUTOS'#39', 1, '#39'N'#39 +
          ', '#39'N'#39', CURRENT_DATE);'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:REPL|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO303'#39', :COD_EMPRESA, '#39'BT NOVO PRE' +
          'CO POR QTDE'#39', 10, '#39'FRMCADPRODUTO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO304'#39', :COD_EMPRESA, '#39'BT ALTERAR ' +
          'PRECO POR QTDE'#39', 10, '#39'FRMCADPRODUTO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE)' +
          ';'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO305'#39', :COD_EMPRESA, '#39'BT SALVAR P' +
          'RECO POR QTDE'#39', 10, '#39'FRMCADPRODUTO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO306'#39', :COD_EMPRESA, '#39'BT DELETAR ' +
          'PRECO POR QTDE'#39', 10, '#39'FRMCADPRODUTO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE)' +
          ';'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO307'#39', :COD_EMPRESA, '#39'BT DELETAR ' +
          'TODOS PRECO POR QTDE'#39', 10, '#39'FRMCADPRODUTO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'PRO308'#39', :COD_EMPRESA, '#39'BT IMPRIMIR' +
          ' PRECO POR QTDE'#39', 10, '#39'FRMCADPRODUTO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE' +
          ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE PRECO_PRODUTOS_QTDE ('
        '    GRUPO_PROD          INTEGER NOT NULL,'
        '    COD_PROD            CHAR(6) NOT NULL,'
        '    COD_EMPRESA         INTEGER NOT NULL,'
        '    QUANT               T_D_QUANT NOT NULL,'
        '    SIGLA               CHAR(1) NOT NULL,'
        '    PRECO_VENDA         T_D_QUANT DEFAULT 0,'
        '    US_CAD              INTEGER,'
        '    DATA_CAD            TIMESTAMP,'
        '    HORA_CAD            CHAR(8),'
        '    US_MOD              INTEGER,'
        '    DATA_MOD            TIMESTAMP,'
        '    HORA_MOD            CHAR(8)'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE PRECO_PRODUTOS_QTDE ADD CONSTRAINT PK_PRECO_PRODUTOS' +
          '_QTDE PRIMARY KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA, QUANT, SIG' +
          'LA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'ALTER TABLE PRECO_PRODUTOS_QTDE ADD CONSTRAINT FK_PRECO_PRODUTOS' +
          '_QTDE_PRODUTOS FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) R' +
          'EFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON UPDATE' +
          ' CASCADE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_PRECO_PRODUTOS_QTDE_PRODUTO ON PRECO_PRODUTOS_Q' +
          'TDE (GRUPO_PROD, COD_PROD, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_SUGESTAOSERVICO_CLIENTE ON SUGESTAOSERVICO (COD' +
          '_CLIENTE, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_PEDVENDA_EQUIPAMENTO ON PEDVENDA (TIPO, STATUS_' +
          'PED, COD_EQUIP, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE INDEX IDX_PEDVENDA_VEICULOS ON PEDVENDA (TIPO, STATUS_PED' +
          ', PLACA, CHASSI, COD_VEICULO, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE SUGESTAOSERVICO ADD DATA_DOC TIMESTAMP;'
        'ALTER TABLE SUGESTAOSERVICO ADD DATA_DOC_ANT TIMESTAMP;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE SUGESTAOSERVICO ADD DATA_ULT_SERV TIMESTAMP;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE SUGESTAOSERVICO ADD KM_ULT_SERV INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE SUGESTAOSERVICO ADD TIPO VARCHAR(40);'
        'ALTER TABLE SUGESTAOSERVICO ADD DIAS INTEGER;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'update menus_auto set desc_menu = '#39'Sa'#237'das x Recebimentos Loja'#39' w' +
          'here desc_menu = '#39'Vendas x Recebimentos Loja'#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS406'#39', :COD_EMPRESA, '#39'PERM INCLUI' +
          'R/ALTERAR EQUIPAMENTO SEM INF SERVICO'#39', 10, '#39'FRMCADEQUIPAMENTOS'#39 +
          ', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS407'#39', :COD_EMPRESA, '#39'PERM INCLUI' +
          'R/ALTERAR MODVEICULOS SEM INF SERVICO'#39', 10, '#39'FRMCADEQUIPAMENTOS'#39 +
          ', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_VEICULOS_SUGESTAO FOR VEICULOS'
        'ACTIVE AFTER INSERT OR UPDATE POSITION 0'
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
        'begin'
        '    if (user = '#39'REPL'#39') then'
        '        exit;'
        ''
        '    if (new.modelo <= 0) then'
        '        exit;'
        '    '
        '    if (coalesce(new.km_v, 0) > 0) then'
        '        exit;    '
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
        '    vDataCad = current_date;'
        '    '
        
          '    select case when(extract(hour from current_timestamp) <=9) t' +
          'hen '#39'0'#39'|| extract(hour from current_timestamp)'
        '    else extract(hour from current_timestamp)'
        
          '    end ||'#39':'#39'|| case when (extract(minute from current_timestamp' +
          ') <= 9) then'
        '        '#39'0'#39'|| extract(minute from current_timestamp)'
        
          '    else extract(minute from current_timestamp) end from rdb$dat' +
          'abase'
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
        '            0, null, null, :vcodserv, new.us_cad, 1);'
        '    '
        '            INSERT INTO SUGESTAOSERVICO'
        
          '            (COD_SUG, COD_EMPRESA, COD_EQUIP, COD_VEIC, CHASSI, ' +
          'PLACA, COD_SUG_OS, ULT_ATD, DATA, HORA,'
        
          '            ATIVO, COD_CLIENTE, US_CAD, DATA_CAD, HORA_CAD, NDOC' +
          '_ANT, TPDOC_ANT, COD_SERV_SUG, DIAS, TIPO)'
        '            VALUES'
        
          '            (:vCodSug, new.cod_empresa, null, new.codigo, new.ch' +
          'assi, new.placa, null,'
        '            new.us_cad, (:vDataCad + (:vDias * 30)), :vHoraCad,'
        
          '            1, new.cod_cliente, new.us_cad, :vDataCad, :vHoraCad' +
          ','
        
          '            null, null, :vcodserv, (:vDias * 30), '#39'MES PRIMEIRA ' +
          'REVISAO'#39');'
        '        end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EQUIPAMENTO_SUGESTAO FOR EQUIPAMENTO'
        'ACTIVE AFTER INSERT OR UPDATE POSITION 0'
        'AS'
        '    DECLARE VARIABLE vSugServico integer;'
        '    DECLARE VARIABLE vUsarAparelho char(3);'
        '    DECLARE VARIABLE vCodServ integer;'
        '    DECLARE VARIABLE vCodSug integer;'
        '    DECLARE VARIABLE vCodSugOs integer;'
        '    DECLARE VARIABLE vInterM integer;'
        '    DECLARE VARIABLE vDataCad timestamp;'
        '    DECLARE VARIABLE vHoraCad char(8);'
        '    DECLARE VARIABLE vExisteSug integer;'
        'begin'
        '  if (user = '#39'REPL'#39') then'
        '    exit;'
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
        '    and sugestaoservico.status <> '#39'CANCELADA'#39
        '    into: vExisteSug;'
        ''
        '    if (vExisteSug > 0) then'
        '        exit;'
        ''
        '    vDataCad = current_date;'
        '    '
        
          '    select case when(extract(hour from current_timestamp) <=9) t' +
          'hen '#39'0'#39'|| extract(hour from current_timestamp)'
        '    else extract(hour from current_timestamp)'
        
          '    end ||'#39':'#39'|| case when (extract(minute from current_timestamp' +
          ') <= 9) then'
        '        '#39'0'#39'|| extract(minute from current_timestamp)'
        
          '    else extract(minute from current_timestamp) end from rdb$dat' +
          'abase'
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
        '            null, null, null, :vcodserv, new.us_cad, 1);'
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
        '            1, new.cod_prop,  new.us_cad, :vDataCad, :vHoraCad,'
        
          '            null, null, :vcodserv, (:vInterM * 30), '#39'INTERVALO M' +
          'ESES ENTRE AS REVISOES'#39');'
        '        end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'BAS408'#39', :COD_EMPRESA, '#39'CONFIRMAR O' +
          'S SEM INFORMAR SERVICOS PARA PROX REV'#39', 10, '#39'FRMCADEQUIPAMENTOS'#39 +
          ', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        '|/BLOCO|'
        ''
        
          'CMD:COMMIT|CREATE INDEX IDX_CONFIG_SISTEMA_DISPLAY ON CONFIG_SIS' +
          'TEMA (COD_EMPRESA,DISPLAY_);'
        ''
        '|BLOCO|'
        'update config_sistema set'
        
          'config_sistema.display_ = '#39'Abrir dados de cliente quando o clien' +
          'te padr'#227'o for informado.'#39','
        
          'config_sistema.value1_b = '#39'Informar no campo acima o tipo do doc' +
          'umento. Ex: ORC, REQ, OS'#39' ||ascii_char(13)||'
        
          #39'Informar abaixo se deve abrir a tela ao salvar clicando no bota' +
          'o OK: S ou N '#39' ||ascii_char(13)||'
        #39'AoSalvar=S'#39
        
          'where config_sistema.display_ = '#39'Abrir dados de cliente quando o' +
          ' cliente padr'#227'o for informado'#39' and config_sistema.cod_empresa >=' +
          ' 0'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TABLE PEDVENDA_PROD ADD PRECOPORQTDE CHAR(1);'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA'
        '|/BLOCO|'
        '')
    end
  end
end
