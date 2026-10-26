inherited frmReestruturaVersao7: TfrmReestruturaVersao7
  Caption = 'frmReestruturaVersao7'
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
    inherited sqlHWF: TMemo
      Lines.Strings = (
        
          'ALTER TABLE PRODUTOS ADD LISTA_IMAGENS BLOB SUB_TYPE 1 SEGMENT S' +
          'IZE 256;')
    end
  end
  inherited Panel3: TPanel
    inherited Label3: TLabel
      Width = 1054
    end
    inherited sqlHwauto: TMemo
      Lines.Strings = (
        'ALTER TABLE LANCAMENTOS ADD COD_CONTRAPARTIDA INTEGER;'
        'ALTER TABLE CONTROLE_CREDITOS ADD COD_CONTRAPARTIDA INTEGER;'
        'ALTER TABLE CONTROLE_CHEQUE ADD COD_CONTRAPARTIDA INTEGER;'
        'ALTER TABLE CONTAS_A_PAGAR ADD COD_CONTRAPARTIDA INTEGER;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC036'#39', :COD_EMPRESA, '#39'B' +
          'T DETALHES RECEBIMENTO LANCAMENTO'#39', 4, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC037'#39', :COD_EMPRESA, '#39'B' +
          'T ESTORNAR LOTE QUITACAO LANCAMENTO'#39', 10, '#39'.'#39', 1, '#39'S'#39', '#39'S'#39', CURR' +
          'ENT_DATE);'
        'ALTER TABLE BAIXA_CREDITOS ADD COD_CONTRAPARTIDA INTEGER;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP027'#39', :COD_EMPRESA, '#39'PE' +
          'RMISSAO REPLICACAO DE CONTAS A PAGAR'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS TAB SET TAB.NIVEL_PROCESSO = (S' +
          'ELECT TAB.NIVEL_PROCESSO FROM TABELA_PROCESSOS TAB WHERE TAB.COD' +
          '_PROCESSO = '#39'CAR055'#39' AND TAB.COD_EMPRESA = :COD_EMPRESA), TAB.SE' +
          'NHA_GERENTE = (SELECT TAB.SENHA_GERENTE FROM TABELA_PROCESSOS TA' +
          'B WHERE TAB.COD_PROCESSO = '#39'CAR055'#39' AND TAB.COD_EMPRESA = :COD_E' +
          'MPRESA) WHERE TAB.COD_PROCESSO = '#39'CAR055'#39' AND TAB.COD_EMPRESA = ' +
          ':COD_EMPRESA;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP028'#39', :COD_EMPRESA, '#39'BT' +
          ' FILTRAR CREDITOS POR DATA NO CONTAS A PAGAR'#39', 5, '#39'.'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP029'#39', :COD_EMPRESA, '#39'BT' +
          ' RETIRAR FILTRO DOS CREDITOS POR DATA EM CTP'#39', 5, '#39'.'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP030'#39', :COD_EMPRESA, '#39'VI' +
          'SUALIZAR TODOS CREDITOS ABERTOS QUITAR CONTAS'#39', 1, '#39'.'#39', 1, '#39'N'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        'ALTER TABLE CONTROLES ADD RECEBER_CTP CHAR(1);'
        
          'UPDATE CONTROLES SET RECEBER_CTP = '#39'N'#39' WHERE RECEBER_CTP IS NULL' +
          ';'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW SALDOS_CTR_LANCAMENTOS'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP031'#39', :COD_EMPRESA, '#39'VA' +
          'LOR CREDITOS MAIOR QUE O VALOR INFORMAR NO CTP'#39', 100, '#39'.'#39', 1, '#39'S' +
          #39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG115'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR PLANO DE CONTAS SEM VINCULAR AO BALANCO'#39', 10, '#39'FRMCADPLANOC' +
          'ONTAS'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG116'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR CONTROLES SEM VINCULAR AO BALANCO'#39', 10, '#39'FRMCADCONTROLES'#39', ' +
          '1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG117'#39', :COD_EMPRESA, '#39'DE' +
          'SATIVAR VINCULO DO PLANO DE CONTAS COM BALANCO'#39', 10, '#39'FRMCADPLAN' +
          'OCONTAS'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG118'#39', :COD_EMPRESA, '#39'DE' +
          'SATIVAR VINCULO DO CONTROLES COM BALANCO'#39', 10, '#39'FRMCADCONTROLES'#39 +
          ', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE P_CONTAS ADD DESAT_VINC_BALANCO CHAR(1);'
        'ALTER TABLE CONTROLES ADD DESAT_VINC_BALANCO CHAR(1);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG119'#39', :COD_EMPRESA, '#39'AT' +
          'IVAR VINCULO DO PLANO DE CONTAS COM BALANCO'#39', 10, '#39'FRMCADPLANOCO' +
          'NTAS'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG120'#39', :COD_EMPRESA, '#39'AT' +
          'IVAR VINCULO DO CONTROLES COM BALANCO'#39', 10, '#39'FRMCADCONTROLES'#39', 1' +
          ', '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'ALTER TABLE TIPO_VENDAS ADD SALVAR_ITENS_AUTOMATIC CHAR(1) DEFAU' +
          'LT '#39'N'#39';'
        
          'UPDATE TIPO_VENDAS SET SALVAR_ITENS_AUTOMATIC = '#39'S'#39' WHERE SALVAR' +
          '_ITENS_AUTOMATIC IS NULL AND USAR_CONFERENCIA_PRODUTO = '#39'S'#39';'
        
          'UPDATE TIPO_VENDAS SET SALVAR_ITENS_AUTOMATIC = '#39'N'#39' WHERE SALVAR' +
          '_ITENS_AUTOMATIC IS NULL;'
        'ALTER TABLE TIPO_VENDAS ADD REPETIR_ITEMVND CHAR(1) DEFAULT '#39'S'#39';'
        
          'UPDATE TIPO_VENDAS SET REPETIR_ITEMVND = '#39'N'#39' WHERE REPETIR_ITEMV' +
          'ND IS NULL AND USAR_CONFERENCIA_PRODUTO = '#39'S'#39';'
        
          'UPDATE TIPO_VENDAS SET REPETIR_ITEMVND = '#39'S'#39' WHERE REPETIR_ITEMV' +
          'ND IS NULL;'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND229'#39', :COD_EMPRESA, '#39'BT ADICIONA' +
          'R QUANTIDADE ITEM PRODUTO REQUISICAO'#39', 3, '#39'N'#39', '#39'FRMCADPEDVENDA'#39',' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND230'#39', :COD_EMPRESA, '#39'BT ADICIONA' +
          'R QUANTIDADE ITEM PRODUTO ORDEM SERV'#39', 3, '#39'N'#39', '#39'FRMCADPEDVENDA'#39',' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND231'#39', :COD_EMPRESA, '#39'BT ADICIONA' +
          'R QUANTIDADE ITEM PRODUTO ORCAMENTO'#39', 3, '#39'N'#39', '#39'FRMCADPEDVENDA'#39', ' +
          '1, '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE MDFE ADD UFPER VARCHAR(64);'
        'ALTER TABLE MDFE_DESCARGA_NFE ADD INDREENTREGA SMALLINT;'
        ''
        '|BLOCO|'
        'CREATE TABLE MDFE_DESCARGA_NFE_UN_TR ('
        '    COD_MDFE              INTEGER NOT NULL,'
        '    COD_EMPRESA           INTEGER NOT NULL,'
        '    CMUNDESCARGA          INTEGER NOT NULL,'
        '    COD_NF                INTEGER NOT NULL,'
        '    SEQID                 INTEGER NOT NULL,'
        '    TPUNIDTRANSP          SMALLINT,'
        '    IDUNIDTRANSP          VARCHAR(20),'
        '    LACUNIDTRANSP_LACRES  BLOB SUB_TYPE 1 SEGMENT SIZE 32,'
        
          '    QTDRAT                T_VL_TODOS /* T_VL_TODOS = DOUBLE PREC' +
          'ISION DEFAULT 000000000.00 */'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE MDFE_DESCARGA_NFE_UN_TR ADD CONSTRAINT PK_MDFE_DESCA' +
          'RGA_NFE_UN_TR PRIMARY KEY (COD_MDFE, COD_EMPRESA, CMUNDESCARGA, ' +
          'COD_NF, SEQID);'
        
          'ALTER TABLE MDFE_DESCARGA_NFE_UN_TR ADD CONSTRAINT FK_MDFE_DESCA' +
          'RGA_NFE_UN_TR FOREIGN KEY (COD_MDFE, COD_EMPRESA, CMUNDESCARGA, ' +
          'COD_NF) REFERENCES MDFE_DESCARGA_NFE (COD_MDFE, COD_EMPRESA, CMU' +
          'NDESCARGA, COD_NF) ON DELETE CASCADE ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE MDFE_DESCARGA_NFE_UN_TR_CARGA ('
        '    COD_MDFE             INTEGER NOT NULL,'
        '    COD_EMPRESA          INTEGER NOT NULL,'
        '    CMUNDESCARGA         INTEGER NOT NULL,'
        '    COD_NF               INTEGER NOT NULL,'
        '    SEQID                INTEGER NOT NULL,'
        '    SEQID_CARGA          INTEGER NOT NULL,'
        '    TPUNIDCARGA          SMALLINT,'
        '    IDUNIDCARGA          VARCHAR(20),'
        '    LACUNIDCARGA_LACRES  BLOB SUB_TYPE 1 SEGMENT SIZE 32,'
        
          '    QTDRAT               T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECI' +
          'SION DEFAULT 000000000.00 */'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE MDFE_DESCARGA_NFE_UN_TR_CARGA ADD CONSTRAINT PK_MDFE' +
          '_DESCARGA_NFE_UN_TR_CARG PRIMARY KEY (COD_MDFE, COD_EMPRESA, CMU' +
          'NDESCARGA, COD_NF, SEQID, SEQID_CARGA);'
        
          'ALTER TABLE MDFE_DESCARGA_NFE_UN_TR_CARGA ADD CONSTRAINT FK_MDFE' +
          '_DESCARGA_NFE_UN_TR_CARG FOREIGN KEY (COD_MDFE, COD_EMPRESA, CMU' +
          'NDESCARGA, COD_NF, SEQID) REFERENCES MDFE_DESCARGA_NFE_UN_TR (CO' +
          'D_MDFE, COD_EMPRESA, CMUNDESCARGA, COD_NF, SEQID) ON DELETE CASC' +
          'ADE ON UPDATE CASCADE;'
        'ALTER TABLE P_CONTAS_CONTABIL ADD COD_CTA_REF VARCHAR(60);'
        'ALTER TABLE P_CONTAS_CONTABIL ADD CNPJ_EST VARCHAR(14);'
        ''
        '|BLOCO|'
        'CREATE TABLE NAT_OP_P_CONTAS_CONTABIL ('
        
          '    CODIGO_NOP   T_N_GERAL NOT NULL /* T_N_GERAL = DOUBLE PRECIS' +
          'ION DEFAULT 000.00 */,'
        '    COD_CTA      VARCHAR(60) NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NAT_OP_P_CONTAS_CONTABIL ADD CONSTRAINT PK_NAT_OP_P_' +
          'CONTAS_CONTABIL PRIMARY KEY (CODIGO_NOP, COD_CTA, COD_EMPRESA);'
        
          'ALTER TABLE NAT_OP_P_CONTAS_CONTABIL ADD CONSTRAINT FK_NAT_OP_P_' +
          'CONTAS_NAT_OP FOREIGN KEY (CODIGO_NOP) REFERENCES NAT_OP (CODIGO' +
          '_NOP) ON DELETE CASCADE ON UPDATE CASCADE;'
        
          'ALTER TABLE NAT_OP_P_CONTAS_CONTABIL ADD CONSTRAINT FK_NAT_OP_P_' +
          'CONTAS_P_CONTAS FOREIGN KEY (COD_CTA, COD_EMPRESA) REFERENCES P_' +
          'CONTAS_CONTABIL (COD_CTA, COD_EMPRESA) ON DELETE CASCADE ON UPDA' +
          'TE CASCADE;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC038'#39', :COD_EMPRESA, '#39'P' +
          'ERM REALIZAR LANCAMENTOS DE CONTAS NAO CONFIG'#39', 10, '#39'.'#39', 1, '#39'S'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP032'#39', :COD_EMPRESA, '#39'PE' +
          'RM LANCAR CONTA A PAGAR DE CONTAS NAO CONFIG'#39', 10, '#39'.'#39', 1, '#39'S'#39', ' +
          #39'S'#39', CURRENT_DATE);'
        'ALTER TABLE NOTAFISCAL ADD CNFE INTEGER;'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW CRED_JUR'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS4'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RESUMO_FINANCEIRO'
        '|/BLOCO|'
        ''
        'ALTER TABLE P_CONTAS_CONTABIL ADD COD_CONTADOR INTEGER;'
        'ALTER TABLE CONT_LIG ADD NCON_ED_PREST T_N_GERAL2;'
        'ALTER TABLE CONT_LIG ADD NCON_SJ_PREST T_N_GERAL2;'
        
          'UPDATE CONT_LIG SET NCON_ED_PREST = NCON_V_PROD WHERE NCON_ED_PR' +
          'EST IS NULL;'
        
          'UPDATE CONT_LIG SET NCON_SJ_PREST = NCON_S_CRD WHERE NCON_SJ_PRE' +
          'ST IS NULL;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CTP033'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR CAMPO VALOR DA CTP NA CONTRAPARTIDA'#39', 11, '#39'.'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:UPDATE DADOS_BALANCO SET PRAZOINICIAL = -1800 WHERE CODSEQ_B' +
          'ALANCO = 4 AND PRAZOINICIAL = 0;'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS4'
        '|/BLOCO|'
        ''
        
          'CREATE OR ALTER EXCEPTION EXC_PED_CONF_TOTAL '#39'Erro ao efetuar so' +
          'matorio dos itens. Proceder novamente com o fechamento'#39';'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_BIU_CONF_TOTAL FOR PEDVENDA'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        '  declare variable val_tot t_vl_todos;'
        '  declare variable val_acr t_vl_todos;'
        '  declare variable val_des t_vl_todos;'
        '  declare variable sum_prod t_vl_todos;'
        '  declare variable sum_serv t_vl_todos;'
        '  declare variable sum_total t_vl_todos;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  if ((coalesce(old.status_ped, '#39#39') <> '#39'FECHADA'#39') and'
        '    (coalesce(new.status_ped, '#39#39') = '#39'FECHADA'#39')) then'
        '  begin'
        '    sum_prod = 0;'
        '    sum_serv = 0;'
        '    sum_total = 0;'
        ''
        '    --Produtos'
        
          '    select sum(pvp.vltot_ped_item), sum(pvp.rateio_desc), sum(pv' +
          'p.rateio_acresc) from pedvenda_prod pvp'
        
          '      where pvp.nped = new.nped and pvp.tipo = new.tipo and pvp.' +
          'cod_empresa = new.cod_empresa'
        '        and coalesce(pvp.status, '#39#39') = '#39#39
        '        into :val_tot, :val_des, val_acr;'
        ''
        '    sum_prod = coalesce(val_tot, 0);'
        
          '    sum_total = coalesce(sum_total, 0) + coalesce(val_tot, 0) + ' +
          'coalesce(val_acr, 0) - coalesce(val_des, 0);'
        ''
        '    --Servicos'
        
          '    select sum(pvs.valor_tot_serv), sum(pvs.rateio_desc), sum(pv' +
          's.rateio_acresc) from pedvenda_serv pvs'
        
          '      where pvs.nped = new.nped and pvs.tipo = new.tipo and pvs.' +
          'cod_empresa = new.cod_empresa'
        '        and coalesce(pvs.status, '#39#39') = '#39#39
        '        into :val_tot, :val_des, val_acr;'
        ''
        '    sum_serv = coalesce(val_tot, 0);'
        
          '    sum_total = coalesce(sum_total, 0) + coalesce(val_tot, 0) + ' +
          'coalesce(val_acr, 0) - coalesce(val_des, 0);'
        ''
        '    --Produtos Terceiro'
        
          '    select sum(pvpt.vl_total), sum(0), sum(0) from pedvenda_prod' +
          '_terc pvpt'
        
          '      where pvpt.nped = new.nped and pvpt.tipo = new.tipo and pv' +
          'pt.cod_empresa = new.cod_empresa'
        '        into :val_tot, :val_des, val_acr;'
        ''
        
          '    sum_total = coalesce(sum_total, 0) + coalesce(val_tot, 0) + ' +
          'coalesce(val_acr, 0) - coalesce(val_des, 0);'
        ''
        '    --Servicos Terceiro'
        
          '    select sum(pvt.vl_servt), sum(0), sum(0) from pedvenda_serv_' +
          'terc pvt'
        
          '      where pvt.nped = new.nped and pvt.tipo = new.tipo and pvt.' +
          'cod_empresa = new.cod_empresa'
        '        into :val_tot, :val_des, val_acr;'
        ''
        
          '    sum_total = coalesce(sum_total, 0) + coalesce(val_tot, 0) + ' +
          'coalesce(val_acr, 0) - coalesce(val_des, 0);'
        ''
        '    if (round(sum_total, 2) <> round(new.valor_total, 2)) then'
        '      exception EXC_PED_CONF_TOTAL;'
        ''
        '  end'
        'end'
        '|/BLOCO|')
    end
  end
end
