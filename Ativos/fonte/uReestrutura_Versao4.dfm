inherited frmReestruturaVersao4: TfrmReestruturaVersao4
  Caption = 'frmReestruturaVersao4'
  ExplicitWidth = 1068
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 1054
    end
    inherited sqlFiscal: TMemo
      Lines.Strings = (
        '|BLOCO|'
        'create or alter procedure INCREMENTA_CODIGO ('
        '    VCOD_EMPRESA integer,'
        '    VTABELA varchar(32))'
        'returns ('
        '    COD integer)'
        'as'
        'declare variable TAB varchar(32);'
        'BEGIN'
        'SELECT DISTINCT(TABELA) FROM CODIGO'
        
          'WHERE TABELA = :VTABELA AND COD_EMPRESA = :VCOD_EMPRESA INTO :TA' +
          'B;'
        'IF (:TAB IS NULL) THEN'
        
          '    INSERT INTO CODIGO(TABELA,COD_EMPRESA,VALOR) VALUES (:VTABEL' +
          'A,:VCOD_EMPRESA,0);'
        
          'UPDATE CODIGO SET VALOR = VALOR+1 WHERE TABELA = :VTABELA AND CO' +
          'D_EMPRESA = :VCOD_EMPRESA;'
        
          'SELECT VALOR FROM CODIGO WHERE TABELA = :VTABELA AND COD_EMPRESA' +
          ' = :VCOD_EMPRESA INTO :cod;'
        'SUSPEND;'
        'END'
        '|/BLOCO|'
        ''
        'ALTER TABLE REESTRURURA_VER ADD MD5BPL VARCHAR(32);'
        ''
        '|BLOCO|'
        'CREATE TABLE TRANSACOES_TEF ('
        '    SEQID               INTEGER NOT NULL,'
        '    COD_EMPRESA         INTEGER NOT NULL,'
        '    NUM_DOC             VARCHAR(12),'
        
          '    VALOR_TOTAL         T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECIS' +
          'ION DEFAULT 000000000.00 */,'
        '    MOEDA               CHAR(1),'
        '    STATUS_TRANSACAO    VARCHAR(3),'
        '    NOME_REDE           VARCHAR(8),'
        '    TIPO_TRANSACAO      CHAR(2),'
        '    NSU                 VARCHAR(12),'
        '    NUM_AUT             VARCHAR(6),'
        '    DATA_HORA_HOST_TR   TIMESTAMP,'
        '    DATA_HORA_LOCAL_TR  TIMESTAMP,'
        '    QTDE_PARCELAS       SMALLINT,'
        '    DATA_TRANSACAO      TIMESTAMP,'
        '    HORA_TRANSACAO      VARCHAR(8),'
        '    NUMERO_CONTROLE     VARCHAR(11),'
        '    BANDEIRA_CARTAO     VARCHAR(20)'
        ');'
        
          'ALTER TABLE TRANSACOES_TEF ADD CONSTRAINT PK_TRANSACOES_TEF PRIM' +
          'ARY KEY (SEQID, COD_EMPRESA);'
        '|/BLOCO|')
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
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE STS_USO ('
        '    DIA            TIMESTAMP NOT NULL,'
        '    STS_DESCRICAO  VARCHAR(64) NOT NULL,'
        '    QUANTIDADE     INTEGER,'
        '    SEQ_ENVIO      INTEGER'
        ');'
        
          'ALTER TABLE STS_USO ADD CONSTRAINT PK_STS_USO PRIMARY KEY (DIA, ' +
          'STS_DESCRICAO);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE STS_USU_PC_US ('
        '    ULTIMO_LOGIN     TIMESTAMP NOT NULL,'
        '    USUARIO_HW       VARCHAR(32) NOT NULL,'
        '    USUARIO_WINDOWS  VARCHAR(32) NOT NULL,'
        '    SERIALHD         VARCHAR(8) NOT NULL'
        ');'
        
          'ALTER TABLE STS_USU_PC_US ADD CONSTRAINT PK_STS_USU_PC_US PRIMAR' +
          'Y KEY (ULTIMO_LOGIN, USUARIO_HW, USUARIO_WINDOWS, SERIALHD);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_REG_STS_USO ('
        '    STS varchar(64))'
        'returns ('
        '    QTDE integer)'
        'as'
        'begin'
        '  select quantidade from sts_uso'
        '    where dia = current_date and sts_descricao = :sts'
        '      into :qtde;'
        ''
        '  if (coalesce(qtde, 0) = 0) then'
        '  begin'
        
          '    update or insert into sts_uso (dia, sts_descricao, quantidad' +
          'e)'
        '      values (current_date, :sts, 1)'
        '      matching (dia, sts_descricao)'
        '      returning quantidade into :qtde;'
        '  end'
        '  else'
        '  begin'
        '    update sts_uso set quantidade = quantidade + 1'
        '      where dia = current_date and sts_descricao = :sts;'
        '    qtde = qtde + 1;'
        '  end'
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND226'#39', :COD_EMPRESA, '#39'PERM ALT VA' +
          'LOR DOS PRODUTOS COM PRECO POR QTDE'#39', 11, '#39'FRMCADPEDVENDA'#39', 1, '#39 +
          'N'#39', '#39'S'#39', CURRENT_DATE);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND227'#39', :COD_EMPRESA, '#39'REALIZAR CA' +
          'LCULO AO INSERIR/EDITAR VND'#39', 1, '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39', '#39'S'#39', ' +
          'CURRENT_DATE);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND228'#39', :COD_EMPRESA, '#39'HABILITAR A' +
          'LTERACAO DE ITEM VENDA RAPIDA'#39', 100, '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
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
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS3'
        '|/BLOCO|'
        ''
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'SPED109'#39', :COD_EMPRESA, '#39'BT REPLICA' +
          'R MOVIMENTACAO DO BEM CIAP'#39', 10, '#39'.'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE)'
        ''
        '|BLOCO|'
        'CREATE TABLE IBPT ('
        '    CODIGO          VARCHAR(8) NOT NULL,'
        '    UF              CHAR(2) NOT NULL,'
        '    EX              INTEGER NOT NULL,'
        '    DESCRICAO       VARCHAR(150),'
        
          '    NACIONAL        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
          'DEFAULT 000000000.00 */,'
        
          '    ESTADUAL        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
          'DEFAULT 000000000.00 */,'
        
          '    IMPORTADO       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
          'DEFAULT 000000000.00 */,'
        
          '    MUNICIPAL       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
          'DEFAULT 000000000.00 */,'
        '    TIPO            VARCHAR(50),'
        '    VIGENCIAINICIO  TIMESTAMP,'
        '    VIGENCIAFIM     TIMESTAMP,'
        '    CHAVE           VARCHAR(50),'
        '    VERSAO          VARCHAR(50),'
        '    DATACONSULTA    TIMESTAMP,'
        '    CONSULTAR       CHAR(1)'
        ');'
        
          'ALTER TABLE IBPT ADD CONSTRAINT PK_IBPT PRIMARY KEY (CODIGO, UF,' +
          ' EX);'
        '|/BLOCO|'
        ''
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'FIS053'#39', :COD_EMPRESA, '#39'HABILITAR V' +
          'ALIDACAO VENDA PRAZO SEM CLIENTE'#39', 1, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_' +
          'DATE)'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_BU_NOME_CL FOR PEDVENDA'
        'INACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'declare variable vnomecl varchar(35);'
        'begin'
        '  vnomecl = '#39#39';'
        
          '  if ((old.tipo = '#39'ORC'#39') and (coalesce(new.nome_cli_orc, '#39#39') <> ' +
          #39#39') and (coalesce(new.nome_cli_orc, '#39#39') <> coalesce(old.nome_cli' +
          'entedav, '#39#39') )) then'
        '  begin'
        '    vnomecl = substring(new.nome_cli_orc from 1 for 35);'
        '  end'
        '  else'
        '  if (new.cod_cliente <> old.cod_cliente) then'
        '  begin'
        
          '    select substring(cl.nome_cliente from 1 for 35) from cliente' +
          's cl'
        
          '      where cl.cod_cliente = new.cod_cliente and cl.cod_empresa ' +
          '= old.cod_empresa'
        '      into :vnomecl;'
        '  end'
        '  '
        
          '  if ((coalesce(:vnomecl,'#39#39') <> coalesce(old.nome_clientedav, '#39#39 +
          ')) and ( coalesce(:vnomecl,'#39#39') <> '#39#39')) then'
        '    new.nome_clientedav = :vnomecl;'
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
        '|BLOCO|'
        'CREATE OR ALTER VIEW ESTOQUELOJAVEIC4('
        '    TP_ESTOQUE,'
        '    ORDTIPO,'
        '    MODELO,'
        '    ANO_FAB,'
        '    ANO_MOD,'
        '    COR,'
        '    CHASSI,'
        '    NUM_NOTA,'
        '    N_COMANDO,'
        '    STATUS_USO,'
        '    COD_EMPRESA)'
        'AS'
        
          'select '#39'LOJA'#39',tp.ordtipo,est.descricao_versaoest,est.ano_fabest,' +
          'est.ano_modest,'
        
          'est.corest,est.chassi_c,est.num_nota,cast('#39'0'#39' as integer),est.st' +
          'atus_uso,est.cod_empresa'
        'from'
        'est_moto est,tipmodelo tp where est.versaoest = tp.codigo and'
        
          'est.cod_empresa = tp.cod_empresa and est.ativo = 1 and (coalesce' +
          '(est.status_estoque, '#39#39') = '#39'S'#39')'
        'and (coalesce(trim(est.posicao), '#39'VIVO'#39') = '#39'VIVO'#39')'
        'union'
        
          'select '#39'DEPO'#39',tp.ordtipo,dp.descricao_versaoest,dp.ano_fabest,dp' +
          '.ano_modest,dp.corest,'
        
          'dp.chassi_c,dp.num_notav,dp.n_comando,dp.status_uso,dp.cod_empre' +
          'sa'
        'from'
        'est_moto dp,tipmodelo tp'
        
          'where (dp.data_trans_ret is null) and (coalesce(dp.status_transd' +
          'ep, '#39#39') = '#39'S'#39') and dp.versaoest = tp.codigo and'
        'dp.cod_empresa = tp.cod_empresa and dp.ativo = 1'
        ';'
        '|/BLOCO|'
        ''
        'ALTER TABLE RECIBOS ADD COD_NF INTEGER;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW MOVPRODSERVCOMCUSTO('
        '    TIPOPS,'
        '    TIPO,'
        '    STATUS_PED,'
        '    VALOR_TOTAL,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    DATA_PED,'
        '    DATA_FECH,'
        '    NPED,'
        '    COD_PROD,'
        '    GRUPOOUSEDRV,'
        '    COD_EMPRESA,'
        '    NUM_FAB_PROD,'
        '    QTDE,'
        '    VL_UNIT,'
        '    DESCR,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    ACRESC_ITEM,'
        '    DESC_ITEM,'
        '    DAV_ORIGEM,'
        '    NPED_ORIGEM,'
        '    TIPO_ORIGEM,'
        '    STATUS_ITEM,'
        '    CUSTO_ULTIMO,'
        '    CUSTO_MEDIO,'
        '    TIPO_OS,'
        '    TIPV)'
        'AS'
        
          'select '#39'P'#39' tipops ,p.tipo,p.status_ped,p.valor_total,c.cod_clien' +
          'te,c.nome_cliente,p.data_ped,p.data_fech,pp.nped,pp.cod_prod,'
        '    pp.grupo_prod grupoOuServ,pp.cod_empresa, pp.num_fab_prod,'
        
          '     pp.quant_ped_item qtde, pp.vlun_ped_item vl_unit,pp.descr_p' +
          'rod_ped descr,'
        
          '     pp.rateio_desc,pp.rateio_acresc,pp.acresc_item, pp.desc_ite' +
          'm,'
        
          '     pp.dav_origem,pp.nped_origem,pp.tipo_origem,pp.status,pp.pc' +
          'ust_c, pp.pcust_mc,p.tipo_os,p.tipv'
        '     from pedvenda_prod pp'
        
          '     inner join pedvenda p on p.nped = pp.nped and p.cod_empresa' +
          ' = pp.cod_empresa and pp.tipo = p.tipo'
        
          '     inner join clientes c on c.cod_cliente = p.cod_cliente and ' +
          'c.cod_empresa = p.cod_empresa'
        '     where p.ativo = 1'
        '     union'
        
          '     select '#39'S'#39' tipops,p.tipo,p.status_ped,p.valor_total,c.cod_c' +
          'liente,c.nome_cliente,p.data_ped,p.data_fech,'
        
          '     ps.nped, ps.cod_servico cod_prod, ps.cod_servico grupoOuSer' +
          'v,'
        
          '     ps.cod_empresa, ps.cod_servico num_fab_prod, ps.quant_serv_' +
          'ped qtde,ps.valor_un_serv vl_unit,'
        '     ps.desc_serv_ped descr,'
        
          '     ps.rateio_desc,ps.rateio_acresc,ps.acresc_item, ps.desc_ite' +
          'm,'
        
          '     ps.dav_origem,ps.nped_origem,ps.tipo_origem,ps.status, 0, 0' +
          ',p.tipo_os,p.tipv'
        '     from pedvenda_serv ps'
        
          '     inner join pedvenda p on p.nped = ps.nped and p.cod_empresa' +
          ' = ps.cod_empresa and ps.tipo = p.tipo'
        
          '     inner join clientes c on c.cod_cliente = p.cod_cliente and ' +
          'c.cod_empresa = p.cod_empresa'
        '     where p.ativo = 1;'
        '|/BLOCO|'
        ''
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'FPG035'#39', :COD_EMPRESA, '#39'USAR RECIBO' +
          ' ANTECIPADO SEM FORMA DE PAGAMENTO'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRE' +
          'NT_DATE);'
        'ALTER TABLE LANCCXL ADD REFRECIBO CHAR(1);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'FIS054'#39', :COD_EMPRESA, '#39'PERMITIR DE' +
          'SCONTO NO SUBTOTAL'#39', 10, '#39'.'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'FIS055'#39', :COD_EMPRESA, '#39'PERMITIR AC' +
          'RESCIMO NO SUBTOTAL'#39', 1, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CREATE INDEX IDX_PED_DIACXL_REL ON PEDVENDA (DIA_CXL, OP_CXL, CO' +
          'D_EMPRESA, ATIVO, TIPO);'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (NOT EXISTS(SELECT RDB$INDEX_NAME FROM RDB$INDICES WHERE RDB$' +
          'RELATION_NAME='#39'CONTROLE_CREDITOS'#39' and RDB$INDEX_NAME = '#39'IDX_CONT' +
          'ROLE_CREDITOS_REC'#39')) THEN'
        
          '    execute statement '#39' CREATE INDEX IDX_CONTROLE_CREDITOS_REC O' +
          'N CONTROLE_CREDITOS (TIP_BAIXA, DATQ_C, DATA_REC_C, CODIGO_EMP, ' +
          'STATUS_C); '#39';'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (NOT EXISTS(SELECT RDB$INDEX_NAME FROM RDB$INDICES WHERE RDB$' +
          'RELATION_NAME='#39'CONTROLE_CHEQUE'#39' and RDB$INDEX_NAME = '#39'IDX_CONTRO' +
          'LE_CHEQUE_REC'#39')) THEN'
        
          '    execute statement '#39' CREATE INDEX IDX_CONTROLE_CHEQUE_REC ON ' +
          'CONTROLE_CHEQUE (TIP_BAIXA, DATQ_CH, DATA_REC, CODIGO_EMP, STATU' +
          'S_CH); '#39';'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (NOT EXISTS(SELECT RDB$INDEX_NAME FROM RDB$INDICES WHERE RDB$' +
          'RELATION_NAME='#39'LANCAMENTOS'#39' and RDB$INDEX_NAME = '#39'IDX_LANCAMENTO' +
          'S_REC'#39')) THEN'
        
          '    execute statement '#39' CREATE INDEX IDX_LANCAMENTOS_REC ON LANC' +
          'AMENTOS (DATA, CODIGO_EMP, LOTE_ENT); '#39';'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (EXISTS(SELECT RDB$INDEX_NAME  FROM RDB$INDICES WHERE RDB$REL' +
          'ATION_NAME='#39'CONTROLE_CREDITOS'#39' and RDB$INDEX_NAME = '#39'IDX_CONTROL' +
          'E_CREDITOS_REC'#39')) THEN'
        'begin'
        '    execute statement '#39' DROP INDEX IDX_CONTROLE_CREDITOS_REC '#39';'
        
          '    execute statement '#39' CREATE INDEX IDX_CONTROLE_CREDITOS_REC O' +
          'N CONTROLE_CREDITOS (TIP_BAIXA, DATQ_C, DATA_REC_C, CODIGO_EMP, ' +
          'STATUS_C);'#39';'
        'end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (EXISTS(SELECT RDB$INDEX_NAME FROM RDB$INDICES WHERE RDB$RELA' +
          'TION_NAME='#39'CONTROLE_CREDITOS'#39' and RDB$INDEX_NAME = '#39'IDX_CONTROLE' +
          '_CREDITOS_REC2'#39')) THEN'
        'begin'
        '    execute statement '#39' DROP INDEX IDX_CONTROLE_CREDITOS_REC2 '#39';'
        
          '    execute statement '#39' CREATE INDEX IDX_CONTROLE_CREDITOS_REC2 ' +
          'ON CONTROLE_CREDITOS (TIP_BAIXA, DATQ_C, CODIGO_EMP, STATUS_C); ' +
          #39';'
        'end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (EXISTS(SELECT RDB$INDEX_NAME FROM RDB$INDICES WHERE RDB$RELA' +
          'TION_NAME='#39'CONTROLE_CHEQUE'#39' and RDB$INDEX_NAME = '#39'IDX_CONTROLE_C' +
          'HEQUE_REC'#39')) THEN'
        'begin'
        '    execute statement '#39' DROP INDEX IDX_CONTROLE_CHEQUE_REC '#39';'
        
          '    execute statement '#39' CREATE INDEX IDX_CONTROLE_CHEQUE_REC ON ' +
          'CONTROLE_CHEQUE (TIP_BAIXA, DATQ_CH, DATA_REC, CODIGO_EMP, STATU' +
          'S_CH); '#39';'
        'end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (EXISTS(SELECT RDB$INDEX_NAME FROM RDB$INDICES WHERE RDB$RELA' +
          'TION_NAME='#39'CONTROLE_CHEQUE'#39' and RDB$INDEX_NAME = '#39'IDX_CONTROLE_C' +
          'HEQUE_REC2'#39')) THEN'
        'begin'
        '    execute statement '#39' DROP INDEX IDX_CONTROLE_CHEQUE_REC2 '#39';'
        
          '    execute statement '#39' CREATE INDEX IDX_CONTROLE_CHEQUE_REC2 ON' +
          ' CONTROLE_CHEQUE (TIP_BAIXA, DATQ_CH, CODIGO_EMP, STATUS_CH); '#39';'
        'end    '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (EXISTS(SELECT RDB$INDEX_NAME FROM RDB$INDICES WHERE RDB$RELA' +
          'TION_NAME='#39'BAIXA_CREDITOS'#39' and RDB$INDEX_NAME = '#39'IDX_BAIXA_CREDI' +
          'TOS_REC'#39')) THEN'
        'begin'
        '    execute statement '#39' DROP INDEX IDX_BAIXA_CREDITOS_REC '#39';'
        
          '    execute statement '#39' CREATE INDEX IDX_BAIXA_CREDITOS_REC ON B' +
          'AIXA_CREDITOS (TIP_BAIXA, DATQ_C, DATA_REC_C, CODIGO_EMP); '#39';'
        'end    '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute block as begin'
        
          'IF (EXISTS(SELECT RDB$INDEX_NAME FROM RDB$INDICES WHERE RDB$RELA' +
          'TION_NAME='#39'BAIXA_CREDITOS'#39' and RDB$INDEX_NAME = '#39'IDX_BAIXA_CREDI' +
          'TOS_REC2'#39')) THEN'
        'begin'
        '    execute statement '#39' DROP INDEX IDX_BAIXA_CREDITOS_REC2 '#39';'
        
          '    execute statement '#39' CREATE INDEX IDX_BAIXA_CREDITOS_REC2 ON ' +
          'BAIXA_CREDITOS (TIP_BAIXA, DATQ_C, CODIGO_EMP); '#39';'
        'end    '
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:INATIVO| CREATE INDEX IDX_CONTROLE_CREDITOS_REC ON CONTROLE_' +
          'CREDITOS (TIP_BAIXA, DATQ_C, DATA_REC_C, CODIGO_EMP, STATUS_C);'
        
          'CMD:INATIVO| CREATE INDEX IDX_CONTROLE_CREDITOS_REC2 ON CONTROLE' +
          '_CREDITOS (TIP_BAIXA, DATQ_C, CODIGO_EMP, STATUS_C);'
        
          'CMD:INATIVO| CREATE INDEX IDX_CONTROLE_CHEQUE_REC ON CONTROLE_CH' +
          'EQUE (TIP_BAIXA, DATQ_CH, DATA_REC, CODIGO_EMP, STATUS_CH);'
        
          'CMD:INATIVO| CREATE INDEX IDX_CONTROLE_CHEQUE_REC2 ON CONTROLE_C' +
          'HEQUE (TIP_BAIXA, DATQ_CH, CODIGO_EMP, STATUS_CH);'
        
          'CMD:INATIVO| CREATE INDEX IDX_BAIXA_CREDITOS_REC ON BAIXA_CREDIT' +
          'OS (TIP_BAIXA, DATQ_C, DATA_REC_C, CODIGO_EMP);'
        
          'CMD:INATIVO| CREATE INDEX IDX_BAIXA_CREDITOS_REC2 ON BAIXA_CREDI' +
          'TOS (TIP_BAIXA, DATQ_C, CODIGO_EMP);'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS2'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RESUMO_FINANCEIRO'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RESUMO_FINANCEIRO'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS4'
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
        'CREATE OR ALTER trigger ti_veiculos_sugestao for veiculos'
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
        '')
    end
  end
end
