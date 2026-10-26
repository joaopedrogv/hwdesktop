inherited frmReestruturaVersao17: TfrmReestruturaVersao17
  Caption = 'frmReestruturaVersao17'
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
        'ALTER TABLE PEDVENDA_PROD_TERC ADD VLCUSTO T_VL_TODOS;'
        'ALTER TABLE PEDVENDA_PROD_TERC ADD VLCUSTO_TOT T_VL_TODOS;'
        'ALTER TABLE PEDVENDA_SERV_TERC ADD VLCUSTO T_VL_TODOS;'
        'ALTER TABLE PEDVENDA_PROD_TERC ADD COD_FORNECEDOR INTEGER;'
        'ALTER TABLE PEDVENDA_PROD_TERC ADD NOME_FORNECEDOR VARCHAR(35);'
        'ALTER TABLE PEDVENDA_SERV_TERC ADD COD_FORNECEDOR INTEGER;'
        'ALTER TABLE PEDVENDA_SERV_TERC ADD NOME_FORNECEDOR VARCHAR(35);'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'ABRIR DESP' +
          'ESAS PRODUTOS/SERVICO DE TERCEIRO'#39' WHERE COD_PROCESSO = '#39'VND236'#39 +
          ';'
        
          'CMD:REPL|UPDATE TABELA_PROCESSOS SET NOME_PROCESSO = '#39'INCLUIR DE' +
          'SPESAS PRODUTOS/SERVICO DE TERCERO'#39' WHERE COD_PROCESSO = '#39'VND237' +
          #39';'
        
          'CMD:REPL|update config_sistema set display_ = '#39'Ao confirmar Orde' +
          'm de Servico gerar contas a pagar dos produtos/servi'#231'os de terce' +
          'iro'#39' where chave = '#39'ped_vnd_gerar_contas_a_pagar'#39';'
        
          'CMD:REPL|update config_sistema set display_ = '#39'Gerar contas a pa' +
          'gar do valor total dos produtos/servi'#231'os de terceiro'#39' where chav' +
          'e = '#39'ped_vnd_gerar_contas_a_pagar_tot_serv'#39';'
        
          'CMD:REPL|update config_sistema set display_ = '#39'C'#243'digo do plano d' +
          'e contas das despesas dos produtos/servi'#231'os de terceiro'#39' where c' +
          'have = '#39'ped_vnd_gerar_contas_a_pagar_numconta_plc'#39';'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VENDAS_VAN('
        '    NPED,'
        '    TIPO,'
        '    COD_EMPRESA,'
        '    VALOR_TOTAL,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    NUM_FAB_PROD,'
        '    NITEM,'
        '    COD_GRADE,'
        '    QUANT_PED_ITEM,'
        '    DESCR_PROD_PED,'
        '    DESCR_PROD_PED2,'
        '    STATUS,'
        '    DATA_PED,'
        '    DATA_FECH,'
        '    STATUS_PED,'
        '    VLUN_PED_ITEM,'
        '    VLTOT_PED_ITEM,'
        '    TIPV,'
        '    DESCRICAO_TPV,'
        '    USAR_CONFERENCIA_PRODUTO,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    COD_VENDEDOR,'
        '    NOME_VENDEDOR,'
        '    NPED_DEST,'
        '    TIPO_DEST,'
        '    NITEM_DEST,'
        '    QUANT_DEST,'
        '    TIPV_DEST,'
        '    ORDEM_DEST,'
        '    DESCRICAO_TPV2,'
        '    DATA_PED2,'
        '    DATA_FECH2,'
        '    STATUS_PED2,'
        '    COD_CLIENTE2,'
        '    NOME_CLIENTE2,'
        '    VLUN_PED_ITEM2,'
        '    VLTOT_PED_ITEM2,'
        '    SEQID)'
        'AS'
        'select pv.nped, pv.tipo, pv.cod_empresa, pv.valor_total,'
        
          'pp.grupo_prod, pp.cod_prod, pp.num_fab_prod, pp.nitem, pp.cod_gr' +
          'ade, coalesce(pp.quant_ped_item, 0) quant_ped_item,'
        
          'pp.descr_prod_ped, (pp.descr_prod_ped ||'#39' - '#39'||pp.nitem) descr_p' +
          'rod_ped2, pp.status,'
        
          'pv.data_ped, pv.data_fech, pv.status_ped, coalesce(pp.vlun_ped_i' +
          'tem, 0) vlun_ped_item,'
        
          'coalesce(pp.vltot_ped_item, 0), pv.tipv, tv.descricao descricao_' +
          'tpv,'
        
          'coalesce(tv.usar_conferencia_produto, '#39'N'#39') usar_conferencia_prod' +
          'uto,'
        
          'pv.cod_cliente, cl.nome_cliente, pv.cod_vendedor, col.nome_vende' +
          'dor, ppc.nped nped_dest, ppc.tipo tipo_dest,'
        
          'ppc.nitem nitem_dest, ppc.quant as quant_dest, ppc.tipv tipv_des' +
          't, ppc.codigo ordem_dest,'
        
          'tv2.descricao descricao_tpv2, pv2.data_ped data_ped2, pv2.data_f' +
          'ech data_fech2,'
        
          'pv2.status_ped status_ped2,  pv2.cod_cliente cod_cliente2, cl2.n' +
          'ome_cliente nome_cliente2,'
        'coalesce(pp2.vlun_ped_item, 0) vlun_ped_item2,'
        
          '(coalesce(pp2.vlun_ped_item, 0) * coalesce(ppc.quant, 0)) vltot_' +
          'ped_item2, coalesce(ppc.codigo, 0) seqid from pedvenda pv'
        
          'inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = p' +
          'v.tipo and pp.cod_empresa = pv.cod_empresa'
        
          'inner join tipo_vendas tv on pv.tipo = tv.tipo and (pv.tipv=tv.s' +
          'igla or (pv.tipo_os= tv.tipo_os))'
        
          'inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl' +
          '.cod_empresa = pv.cod_empresa'
        
          'inner join colaborador col on col.cod_vendedor = pv.cod_vendedor' +
          ' and col.cod_empresa = pv.cod_empresa'
        
          'left join pedvenda_prod_conf ppc on ppc.nped_conf = pp.nped and ' +
          'ppc.tipo_conf = pp.tipo'
        '  and ppc.grupo_prod = pp.grupo_prod'
        '  and ppc.cod_prod = pp.cod_prod'
        '  and ppc.cod_grade = pp.cod_grade'
        '  and ((ppc.nitem_conf = pp.nitem) or (ppc.nitem_conf > 0))'
        '  and ppc.cod_empresa = pp.cod_empresa'
        
          'left join tipo_vendas tv2 on ppc.tipo_conf = tv2.tipo and ppc.ti' +
          'pv = tv2.sigla'
        
          'left join pedvenda pv2 on pv2.nped = ppc.nped and pv2.tipo = ppc' +
          '.tipo and pv2.cod_empresa = ppc.cod_empresa'
        
          'left join pedvenda_prod pp2 on pp2.nped = ppc.nped_conf and pp2.' +
          'tipo = ppc.tipo_conf and pp2.cod_empresa = ppc.cod_empresa and p' +
          'p2.nitem = ppc.nitem_conf'
        
          'left join clientes cl2 on cl2.cod_cliente = pv2.cod_cliente and ' +
          'cl2.cod_empresa = pv2.cod_empresa;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN033'#39', :COD_EMPRESA, ' +
          #39'PERM PROCES RECEB VENDAS DIA CXL DIF DO FINANC'#39', 1, '#39'FRMIMPAUTO' +
          #39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN034'#39', :COD_EMPRESA, ' +
          #39'PERM PROCES RECEB PRESTACAO DIA CXL DIF FINANC'#39', 1, '#39'FRMIMPAUTO' +
          #39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'create or alter procedure RETORNASALDOSCONTROLES ('
        '    PCOD_CONTROLE integer,'
        '    PCOD_EMPRESA integer)'
        'returns ('
        '    SALDOCAIXA double precision,'
        '    SALDOBANCO double precision,'
        '    DIFERENCA double precision)'
        'as'
        'declare variable VSALDOBANCO_LANC double precision;'
        'declare variable VSALDOCAIXA_LANC double precision;'
        'declare variable VTEMP double precision;'
        'declare variable VTEMP2 double precision;'
        'declare variable VDIAFINANC timestamp;'
        'begin'
        '  VSALDOCAIXA_LANC = 0;'
        '  VSALDOBANCO_LANC = 0;'
        '  VTEMP = 0;'
        '  VTEMP2 = 0;'
        '  SALDOBANCO = 0;'
        '  SALDOCAIXA = 0;'
        '  DIFERENCA = 0;'
        ''
        '  VDIAFINANC = NULL;'
        ''
        '  select max(fech_dia.dia_fcd) as data from fech_dia'
        '  where fech_dia.codigo_emp = :PCOD_EMPRESA INTO :VDIAFINANC;'
        ''
        
          '  select first 1 sal_ctrl.saldo_banco, sal_ctrl.val_sld from sal' +
          '_ctrl where sal_ctrl.codigo_ctrl = :PCOD_CONTROLE'
        '  and sal_ctrl.data_sld ='
        '    (select max(sal.data_sld) as max_data_sld from sal_ctrl sal'
        
          '     where sal.codigo_ctrl = :PCOD_CONTROLE and sal.cod_emp = :P' +
          'COD_EMPRESA)'
        
          '  and sal_ctrl.cod_emp = :PCOD_EMPRESA order by sal_ctrl.data_sl' +
          'd INTO :VTEMP, :VTEMP2;'
        ''
        
          '  select sum(case when (lancamentos.tipo_l = '#39'E'#39') then coalesce(' +
          'lancamentos.valor_l, 0)'
        
          '              else (0 - coalesce(lancamentos.valor_l, 0)) end) f' +
          'rom lancamentos'
        '  where lancamentos.codigo_ctrl = :PCOD_CONTROLE'
        
          '  and ((lancamentos.dt_compensado = (:VDIAFINANC + 1)) or (lanca' +
          'mentos.dt_compensado is null))'
        '  and not(lancamentos.data < (:VDIAFINANC + 1))'
        '  and lancamentos.data <= (:VDIAFINANC + 1)'
        
          '  and lancamentos.codigo_emp = :PCOD_EMPRESA INTO : VSALDOCAIXA_' +
          'LANC;'
        ''
        
          '  select sum(case when (lancamentos.tipo_l = '#39'E'#39') then coalesce(' +
          'lancamentos.valor_l, 0)'
        
          '              else (0 - coalesce(lancamentos.valor_l, 0)) end) f' +
          'rom lancamentos'
        '  where lancamentos.codigo_ctrl = :PCOD_CONTROLE'
        
          '  and ((lancamentos.dt_compensado = (:VDIAFINANC + 1)) or (lanca' +
          'mentos.dt_compensado is null))'
        '  and (lancamentos.dia_fcd = (:VDIAFINANC + 1))'
        '  and lancamentos.data <= (:VDIAFINANC + 1)'
        
          '  and lancamentos.codigo_emp = :PCOD_EMPRESA INTO : VSALDOBANCO_' +
          'LANC;'
        ''
        
          '  SALDOCAIXA = COALESCE(VTEMP2, 0) + COALESCE(VSALDOCAIXA_LANC, ' +
          '0);'
        
          '  SALDOBANCO = COALESCE(VTEMP, 0) + COALESCE(VSALDOBANCO_LANC, 0' +
          ');'
        '  DIFERENCA = COALESCE(SALDOCAIXA, 0) - COALESCE(SALDOBANCO, 0);'
        ''
        '  suspend;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW CREDITOSCHEQUE*/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC042'#39', :COD_EMPRESA, '#39'I' +
          'MPRIMIR RELATORIO CONCILIACAO BANCARIA'#39', 2, '#39'N'#39', '#39'FRMCONCILIA'#39', ' +
          '1, '#39'S'#39', CURRENT_DATE);'
        
          'CREATE INDEX IDX_LOTEENT_BXCREDITOS ON BAIXA_CREDITOS (LOTE_ENT,' +
          ' CODIGO_EMP);'
        'ALTER TABLE SAL_CTRL ADD CONC_BANC CHAR(1) DEFAULT '#39'N'#39';'
        'CREATE INDEX IDX_NFCE_DHEMI ON NFCE (DHEMI, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_EAN_DIGITO ('
        '    ACODIGO varchar(20))'
        'returns ('
        '    DIGITO integer)'
        'as'
        'declare variable SOMA integer;'
        'declare variable MULTIPLICADOR integer;'
        'declare variable COUNTER integer;'
        'begin'
        
          '  /* tamanhos EANs validos 8, 12, 13, 14, portanto acodigo deve ' +
          'ser, 7, 11, 12, 13*/'
        '  SOMA = 0;'
        '  MULTIPLICADOR = 3;'
        ''
        '  COUNTER = char_length(ACODIGO);'
        '  if (COUNTER not in (7, 11, 12, 13)) then'
        '  begin'
        '    DIGITO = -1;'
        '    suspend;'
        '    exit;'
        '  end'
        ''
        '  while (COUNTER > 0) do'
        '  begin'
        
          '    if (substring(:ACODIGO from :COUNTER for 1) not in ('#39'0'#39', '#39'1'#39 +
          ', '#39'2'#39', '#39'3'#39', '#39'4'#39', '#39'5'#39', '#39'6'#39', '#39'7'#39', '#39'8'#39', '#39'9'#39')) then'
        '    begin'
        '      DIGITO = -1;'
        '      suspend;'
        '      exit;'
        '    end'
        ''
        
          '    -- pegar o numero atual e multiplicar pelo peso somando ao q' +
          'ue ja existe'
        
          '    SOMA = :SOMA + cast(substring(:ACODIGO from :COUNTER for 1) ' +
          'as integer) * MULTIPLICADOR;'
        ''
        '    -- acertar o multiplicador'
        '    if (MULTIPLICADOR = 3) then'
        '    begin'
        '      MULTIPLICADOR = 1;'
        '    end'
        '    else'
        '    begin'
        '      MULTIPLICADOR = 3;'
        '    end'
        ''
        '    -- Acertar o contador'
        '    COUNTER = COUNTER - 1;'
        '  end'
        ''
        '  if ((((:SOMA / 10.00) - (:SOMA / 10)) * 10) = 0) then'
        '  begin'
        '    DIGITO = 0;'
        '  end'
        '  else'
        '  begin'
        '    DIGITO = 10 - (((:SOMA / 10.00) - (:SOMA / 10)) * 10);'
        '  end'
        ''
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_EAN_VALIDO ('
        '    ACODIGO varchar(20))'
        'returns ('
        '    VALIDO smallint)'
        'as'
        'declare variable ADIG integer;'
        'declare variable ADIG_STR varchar(32);'
        'begin'
        '  VALIDO = 0;'
        '  if (char_length(trim(ACODIGO)) in (8, 12, 13, 14)) then'
        '  begin'
        
          '    ADIG_STR = substring(ACODIGO from (char_length(trim(:ACODIGO' +
          '))) for 1);'
        ''
        '    select DIGITO'
        
          '    from SP_EAN_DIGITO(substring(:ACODIGO from 1 for (char_lengt' +
          'h(trim(:ACODIGO)) - 1)))'
        '    into :ADIG;'
        '    if (ADIG > -1) then'
        
          '      if ((substring(cast(:ADIG as varchar(32)) from 1 for 1)) =' +
          ' ADIG_STR) then'
        '        VALIDO = 1;'
        '  end'
        ''
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_EAN_VALIDO_STR ('
        '    ACODIGO varchar(20))'
        'returns ('
        '    EAN varchar(20))'
        'as'
        'declare variable ADIG integer;'
        'begin'
        '  if (char_length(trim(ACODIGO)) not in (8, 12, 13, 14)) then'
        '  begin'
        '    EAN = '#39#39';'
        '  end'
        '  else'
        '  begin'
        '    --if ((char_length(trim(ACODIGO)) = 13) and'
        
          '    --    (substring(trim(ACODIGO) from 1 for 5) = '#39'00000'#39')) the' +
          'n'
        '    --  ACODIGO = substring(trim(ACODIGO) from 6 for 8);'
        ''
        '    select DIGITO'
        
          '    from SP_EAN_DIGITO(substring(:ACODIGO from 1 for (char_lengt' +
          'h(trim(:ACODIGO)) - 1)))'
        '    into :ADIG;'
        '    if (ADIG > -1) then'
        
          '      EAN = substring(ACODIGO from 1 for (char_length(trim(:ACOD' +
          'IGO)) - 1)) ||(substring(cast(:ADIG as varchar(32)) from 1 for 1' +
          '));'
        '  end'
        ''
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW VW_TIPO88_ITNF*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW CREDITOSCHEQUE*/'
        '|/BLOCO|'
        ''
        'ALTER TABLE CONT_LIG ADD NCON_ENT_DESCDESP T_N_GERAL2;'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'NF0212'#39', :COD_EMPRESA, '#39'BT NOTAS FI' +
          'SCAIS COMPLEMENTO/RESTITUI'#199#195'O ICMSST'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N' +
          #39', '#39'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'NF0213'#39', :COD_EMPRESA, '#39'BT PREVER N' +
          'F COMPLEMENTO/RESTITUI'#199#195'O ICMSST'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'N'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'NF0214'#39', :COD_EMPRESA, '#39'BT SALVAR N' +
          'F COMPLEMENTO/RESTITUI'#199#195'O ICMSST'#39', 6, '#39'FRMCADNF_LOTE'#39', 1, '#39'S'#39', '#39 +
          'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_SQL_INSERT ('
        '    SQL blob sub_type 1 segment size 1024,'
        '    RETURN_FIELD varchar(31))'
        'returns ('
        '    ID integer)'
        'as'
        'begin'
        '  /* Procedure Text */'
        '  execute statement SQL || '#39' returning '#39' || RETURN_FIELD'
        '      into :ID;'
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE TIPO88_ICMSST_PERIODO ('
        '    PERIODO      VARCHAR(6) NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    TIPO_ICM     VARCHAR(16),'
        '    TIPO_FCP     VARCHAR(16),'
        '    VL_COMP_ICM  T_VL_TODOS,'
        '    VL_COMP_FCP  T_VL_TODOS,'
        '    VL_REST_ICM  T_VL_TODOS,'
        '    VL_REST_FCP  T_VL_TODOS,'
        '    COD_NF_COMP  INTEGER,'
        '    COD_NF_REST  INTEGER'
        ');'
        
          'ALTER TABLE TIPO88_ICMSST_PERIODO ADD CONSTRAINT PK_TIPO88_ICMSS' +
          'T_PERIODO PRIMARY KEY (PERIODO, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE TIPO88_ICMSST_PERIODO ADD CONSTRAINT FK_TIPO88_ICMSS' +
          'T_PERIODO_COMP FOREIGN KEY (COD_NF_COMP, COD_EMPRESA) REFERENCES' +
          ' NOTAFISCAL (COD_NF, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE TIPO88_ICMSST_PERIODO ADD CONSTRAINT FK_TIPO88_ICMSS' +
          'T_PERIODO_REST FOREIGN KEY (COD_NF_REST, COD_EMPRESA) REFERENCES' +
          ' NOTAFISCAL (COD_NF, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE NOTAFISCAL_SPED_C195_C197 ADD TXT_COMPL_C195 VARCHAR' +
          '(128);'
        
          'ALTER TABLE SPED_LANCAMENTO_FISCAL ADD CONF_ASSISTENTE BLOB SUB_' +
          'TYPE 1 SEGMENT SIZE 128;'
        'ALTER TABLE SPED_LANCAMENTO_FISCAL ADD TIPO_LANC SMALLINT;'
        'ALTER TABLE P_CONTAS ADD ESTORNAR_VALE CHAR(1);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC043'#39', :COD_EMPRESA, '#39'B' +
          'T DETALHES RECEBIMENTO RECIBO/VALE COMPRA'#39', 4, '#39'N'#39', '#39'.'#39', 1, '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC044'#39', :COD_EMPRESA, '#39'B' +
          'T ESTORNAR LANCAMENTO ESTORNO RECIBO/VALE COMPRA'#39', 10, '#39'S'#39', '#39'.'#39',' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE RECIBOS ADD CXL CHAR(1);'
        'ALTER TABLE LANCAMENTOS ADD LANC_AVULSO CHAR(1) DEFAULT '#39'N'#39';'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'LANC045'#39', :COD_EMPRESA, '#39'P' +
          'ERMITIR EXCLUIR LANCAMENTO REALIZADO P/ SISTEMA'#39', 10, '#39'S'#39', '#39'.'#39', ' +
          '1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'REC024'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR RECEBIMENTO DE RECIBOS PELO FINANCEIRO'#39', 11, '#39'N'#39', '#39'FRMCA' +
          'DRECIBO'#39', 1, '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TI_PRODUTOS_CP2 FOR PRODUTOS*/'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO316'#39', :COD_EMPRESA, '#39'AD' +
          'ICIONAR IMAGEM PRODUTO'#39', 3, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO317'#39', :COD_EMPRESA, '#39'VI' +
          'SUALIZAR IMAGEM PRODUTO'#39', 3, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO318'#39', :COD_EMPRESA, '#39'PR' +
          'OXIMA IMAGEM PRODUTO'#39', 3, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO319'#39', :COD_EMPRESA, '#39'IM' +
          'AGEM ANTERIOR PRODUTO'#39', 3, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO320'#39', :COD_EMPRESA, '#39'EX' +
          'CLUIR IMAGEM PRODUTO'#39', 3, '#39'N'#39', '#39'FRMCADPRODUTOS'#39', 1, '#39'S'#39', CURRENT' +
          '_DATE);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_ORIG CHAR(1);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_CST VARCHAR(2);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_CSOSN VARCHAR(3);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PRED T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VBC T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PICM T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VICM T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VBCFCP T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PFCP T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VFCP T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_MODBCST CHAR(1);'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PMVAST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PREDBCST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VBCST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PICMST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VICMST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VBCFCPST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PFCPST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VFCPST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VICMDESON T_N_GERAL;  '
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VBCSTRET T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VICMSSUBSTITUTO T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VICMSSTRET T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VBCFCPSTRET T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_PFCPSTRET T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICM_VFCPSTRET T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ANT_PST T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ANT_VICMSSUBSTITUTO T_N_GERAL;'
        'ALTER TABLE PRODUTOS ADD ANT_PST T_N_GERAL;'
        'ALTER TABLE PRODUTOS ADD ANT_VICMSSUBSTITUTO T_N_GERAL;'
        ''
        '|BLOCO|'
        'CREATE TABLE NOTAFISCAL_COLETA_ENTREGA ('
        '    COD_NF       INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    TIPO         SMALLINT NOT NULL,'
        '    CPFCNPJ      VARCHAR(14),'
        '    IE           VARCHAR(14),'
        '    XNOME        VARCHAR(60),'
        '    XLGR         VARCHAR(20),'
        '    NRO          VARCHAR(20),'
        '    XCPL         VARCHAR(60),'
        '    XBAIRRO      VARCHAR(60),'
        '    CMUN         INTEGER,'
        '    XMUN         VARCHAR(60),'
        '    UF           CHAR(2),'
        '    CEP          CHAR(8),'
        '    CPAIS        INTEGER,'
        '    XPAIS        VARCHAR(60),'
        '    FONE         VARCHAR(14),'
        '    EMAIL        VARCHAR(60)'
        ');'
        
          'ALTER TABLE NOTAFISCAL_COLETA_ENTREGA ADD CONSTRAINT PK_NOTAFISC' +
          'AL_COLETA_ENTREGA PRIMARY KEY (COD_NF, COD_EMPRESA, TIPO);'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE NOTAFISCAL_COLETA_ENTREGA ADD CONSTRAINT FK_NOTAFISC' +
          'AL_COLETA_ENTREGA FOREIGN KEY (COD_NF, COD_EMPRESA) REFERENCES N' +
          'OTAFISCAL (COD_NF, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASC' +
          'ADE;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER trigger nfce_item_calc_imp for nfce_item*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NFCE_REC_RATEIOS ('
        '    CODIGO_NFCE integer,'
        '    CODIGO_EMPRESA integer)'
        'returns ('
        '    SUCESSO smallint)'
        'as'
        '  declare variable CODNFCE integer;'
        '  declare variable CODEMPRESA integer;'
        '  declare variable PROD double precision;'
        '  declare variable FRETE double precision;'
        '  declare variable SEG double precision;'
        '  declare variable OUTRO double precision;'
        '  declare variable DESCONTO double precision;'
        '  declare variable FRETE_CALC char(1);'
        '  declare variable DESC_POR_IT char(1);'
        '  declare variable SUMFRETE double precision;'
        '  declare variable SUMSEG double precision;'
        '  declare variable SUMOUTRO double precision;'
        '  declare variable SUMDESCONTO double precision;'
        '  declare variable DIFFRETE double precision;'
        '  declare variable DIFSEG double precision;'
        '  declare variable DIFOUTRO double precision;'
        '  declare variable DIFDESC double precision;'
        '  declare variable SEQID_IT integer;'
        '  declare variable VNFLIQ double precision;'
        '  declare variable ICM_BASE double precision;'
        '  declare variable ICM_VALOR double precision;'
        '  declare variable PIS_VALOR double precision;'
        '  declare variable COFINS_VALOR double precision;'
        '  declare variable TOTTRIB_VALOR double precision;'
        '  declare variable FCP_VALOR double precision;'
        '  declare variable FCPST_VALOR double precision;'
        '  declare variable FCPSTRET_VALOR double precision;'
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
        '    sum(coalesce(nfce_item.vtottrib, 0)),'
        '    sum(coalesce(nfce_item.fcp_vfcp, 0)),'
        '    sum(coalesce(nfce_item.fcp_vfcpst, 0)),'
        '    sum(coalesce(nfce_item.fcp_vfcpstret, 0))'
        '    from nfce_item'
        
          '  where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empresa ' +
          '=  :codempresa'
        
          '    into :prod, :icm_base, :icm_valor, :pis_valor, :cofins_valor' +
          ', :tottrib_valor, :fcp_valor, :fcpst_valor, :fcpstret_valor;'
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
        '    sum(coalesce(nfce_item.vtottrib, 0)),'
        
          '    sum(coalesce(round(nfce_item.qcom * nfce_item.fcp_vfcpstret,' +
          ' 2), 0))'
        '    from nfce_item'
        
          '  where nfce_item.cod_nfce = :codnfce and nfce_item.cod_empresa ' +
          '=  :codempresa'
        
          '    into :prod, :icm_base, :icm_valor, :pis_valor, :cofins_valor' +
          ', :tottrib_valor, :fcpstret_valor;'
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
        '    nfce.vtottrib = coalesce(:tottrib_valor, 0),'
        ''
        '    nfce.vfcp = coalesce(:fcp_valor, 0),'
        '    nfce.vfcpst = coalesce(:fcpst_valor, 0),'
        '    nfce.vfcpstret = coalesce(:fcpstret_valor, 0)'
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
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO321'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR DADOS NF ULTIMA ENTRADA'#39', 10, '#39'S'#39', '#39'FRMCADPRODUTOS'#39', 1,' +
          ' '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE PRODUTOS_IMAGENS ADD US_CAD INTEGER;'
        'ALTER TABLE PRODUTOS_IMAGENS ADD DATA_CAD TIMESTAMP;'
        'ALTER TABLE PRODUTOS_IMAGENS ADD US_ALT INTEGER;'
        'ALTER TABLE PRODUTOS_IMAGENS ADD DATA_ALT TIMESTAMP;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NFCE_ITEM_CALC_IMP FOR NFCE_ITEM'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  --declare variable calcular char(1);'
        '  declare variable update_pis char(1);'
        '  declare variable update_icms char(1);'
        '  declare variable update_icef char(1);'
        '  declare variable update_iss char(1);'
        '  declare variable update_fcp char(1);'
        '  declare variable valor_tmp t_vl_todos;'
        'BEGIN             '
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '     exit;'
        ''
        '  if (((inserting) or ( updating)) and (new.cfop = 5403)) then'
        '    new.cfop = 5405;'
        ''
        '--  calcular = '#39'N'#39';--coalesce(new.calcular, '#39'N'#39');'
        '  update_icms = '#39'N'#39';'
        '  update_icef = '#39'N'#39';'
        '  update_pis = '#39'N'#39';'
        '  update_iss = '#39'N'#39';'
        '  update_fcp = '#39'N'#39';'
        ''
        '  if ((inserting) or (deleting) ) then'
        '  begin'
        '--    calcular = '#39'S'#39';'
        '    update_icms = '#39'S'#39';'
        '    update_icef = '#39'S'#39';'
        '    update_pis = '#39'S'#39';'
        '    update_iss = '#39'S'#39';'
        '    update_fcp = '#39'S'#39';'
        '  end'
        '  else if (updating) then'
        '    if ((old.vprod <> new.vprod) or'
        '      (old.vseg <> new.vseg) or'
        '      (old.vdesc <> new.vdesc) or  '
        
          '      ((old.vfrete <> new.vfrete) and (new.frete_na_base = '#39'S'#39'))' +
          ' or'
        '      (old.voutro <> new.voutro) or'
        '      (old.frete_na_base <> new.frete_na_base)) then-- or'
        '    begin              '
        '      update_icms = '#39'S'#39';'
        '      update_icef = '#39'S'#39';'
        '      update_pis = '#39'S'#39';'
        '      update_iss = '#39'S'#39';'
        '      update_fcp = '#39'S'#39';'
        '    end'
        '    else'
        '    begin                   '
        '      if ((old.icm_cst <> new.icm_cst) or'
        '         (old.icm_csosn <> new.icm_csosn)) then'
        '      begin'
        '        update_icms = '#39'S'#39';'
        '        update_icef = '#39'S'#39';'
        '        update_fcp = '#39'S'#39';'
        '      end'
        ''
        '      if ((old.icm_cst <> new.icm_cst) or'
        '        (old.icm_csosn <> new.icm_csosn) or'
        '        (old.icm_predbc <> new.icm_predbc) or'
        '        (old.icm_picms <> new.icm_picms) or'
        '        (old.icm_pcredsn <> new.icm_pcredsn)) then-- or'
        '        update_icms = '#39'S'#39';'
        '        '
        '      if ((old.icm_cst <> new.icm_cst) or'
        '        (old.icm_csosn <> new.icm_csosn) or'
        '        (old.icm_predbcefet <> new.icm_predbcefet) or'
        '        (old.icm_picmsefet <> new.icm_picmsefet)) then'
        '        update_icef = '#39'S'#39';'
        ''
        '      if ((old.pis_cst <> new.pis_cst) or'
        '        (old.pis_ppis <> new.pis_ppis) or'
        '        (old.pis_valiqprod <> new.pis_valiqprod) or'
        '        (old.cofins_cst <> new.cofins_cst) or'
        '        (old.cofins_pcofins <> new.cofins_pcofins) or'
        
          '        (old.cofins_valiqprod <> new.cofins_valiqprod)) then-- o' +
          'r'
        '        update_pis = '#39'S'#39';'
        ''
        '      if ((old.iss_valiq <> new.iss_valiq) or'
        '        (old.iss_retido <> new.iss_retido) ) then'
        '        update_iss = '#39'S'#39';'
        '        '
        '      if ((old.fcp_pfcp <> new.fcp_pfcp) or'
        '        (old.fcp_pfcpst <> new.fcp_pfcpst) ) then'
        '        update_fcp = '#39'S'#39';'
        '    end'
        ''
        
          '  if ((update_icms = '#39'N'#39') and (update_pis = '#39'N'#39') and (update_iss' +
          ' = '#39'N'#39') and (update_fcp = '#39'N'#39') and (update_icef = '#39'N'#39')) then'
        '    exit;'
        ''
        '  if (new.frete_na_base = '#39'S'#39') then'
        '    valor_tmp = new.vfrete;'
        '  else'
        '     valor_tmp = 0;'
        
          '  valor_tmp = valor_tmp + new.vprod + new.vseg + new.voutro - ne' +
          'w.vdesc;'
        ''
        '  IF (update_icms = '#39'S'#39') THEN'
        '  begin'
        
          '    if ((coalesce(new.icm_pcredsn,0) > 0) and ((new.icm_csosn = ' +
          #39'101'#39') or (new.icm_csosn = '#39'900'#39'))) then'
        '    begin'
        
          '      new.icm_vcredicmssn = round(valor_tmp * new.icm_pcredsn / ' +
          '100, 2);'
        '      new.icm_predbc = 0;'
        '      new.icm_picms = 0;'
        '      new.icm_vbc = 0;'
        '      new.icm_vicms = 0;'
        '    end'
        '    else if (coalesce(new.icm_csosn, '#39#39') <> '#39#39') then'
        '    begin               '
        '      new.icm_pcredsn = 0;'
        '      new.icm_vcredicmssn = 0;'
        '      new.icm_predbc = 0;'
        '      new.icm_picms = 0;'
        '      new.icm_vbc = 0;'
        '      new.icm_vicms = 0;'
        '    end'
        
          '    else if ((new.icm_picms > 0) and ((new.icm_cst = '#39'00'#39') or (n' +
          'ew.icm_cst = '#39'20'#39') or (new.icm_cst = '#39'90'#39'))) then'
        '    begin'
        '      if (new.icm_cst = '#39'00'#39') then'
        '        new.icm_predbc = 0;'
        '  '
        '      new.icm_vbc = valor_tmp;'
        '      if (new.icm_predbc > 0) then'
        '        new.icm_vbc = new.icm_predbc * new.icm_vbc / 100;'
        '  '
        '      new.icm_vbc = round(new.icm_vbc, 2);'
        
          '      new.icm_vicms = round(new.icm_vbc * new.icm_picms / 100, 2' +
          ');'
        '      '
        '      new.icm_pcredsn = 0;'
        '      new.icm_vcredicmssn = 0;'
        '    end'
        '    else'
        '    begin'
        '      new.icm_predbc = 0;'
        '      new.icm_picms = 0;'
        '      new.icm_vbc = 0;'
        '      new.icm_vicms = 0;'
        '      new.icm_pcredsn = 0;'
        '      new.icm_vcredicmssn = 0;'
        '    end'
        '  end'
        ''
        '  if (update_icef = '#39'S'#39') then'
        '  begin'
        
          '    if ((new.icm_cst = 60) and (coalesce(new.icm_picmsefet, 0) >' +
          ' 0)) then'
        '    begin'
        '      if (coalesce(new.icm_predbcefet, 0) > 0) then'
        
          '        new.icm_vbcefet = round(valor_tmp * (100 - new.icm_predb' +
          'cefet) / 100, 2);'
        '      else'
        '      begin'
        '        new.icm_vbcefet    = round(valor_tmp, 0);'
        '        new.icm_predbcefet = 0;'
        '      end'
        
          '      new.icm_vicmsefet  = round(new.icm_vbcefet * new.icm_picms' +
          'efet / 100, 2);'
        '    end'
        '    else'
        '    begin'
        '      new.icm_predbcefet = 0;'
        '      new.icm_picmsefet  = 0;'
        '      new.icm_vbcefet    = 0;'
        '      new.icm_vicmsefet  = 0;'
        '    end'
        '  end'
        ''
        '  if (update_pis = '#39'S'#39') then'
        '  begin'
        '    new.cofins_cst = new.pis_cst;'
        '  '
        '    if ('
        '      ( (new.pis_cst = '#39'03'#39') and (new.pis_valiqprod > 0) )'
        '      or'
        
          '      ( ( (new.pis_cst = '#39'01'#39') or (new.pis_cst = '#39'02'#39') ) and (ne' +
          'w.pis_ppis > 0) )'
        '      ) then'
        '    begin'
        '      if (new.pis_cst = '#39'03'#39') then'
        '      begin'
        '        new.pis_qbcprod = new.qcom;'
        
          '        new.pis_vpis = round(new.pis_qbcprod * new.pis_valiqprod' +
          ', 2);'
        '        new.pis_vbc = 0;'
        '        new.pis_ppis = 0;'
        '      end'
        '      else'
        '      begin'
        '        new.pis_vbc = round(valor_tmp, 2);'
        
          '        new.pis_vpis = round(new.pis_ppis * new.pis_vbc / 100, 2' +
          ');'
        '        new.pis_qbcprod = 0;'
        '        new.pis_valiqprod = 0;'
        '      end'
        '    end'
        '    else'
        '    begin'
        '      new.pis_vbc = 0;'
        '      new.pis_ppis = 0;'
        '      new.pis_qbcprod = 0;'
        '      new.pis_valiqprod = 0;'
        '      new.pis_vpis = 0;'
        '    end'
        '  '
        '    if ('
        '      ( (new.cofins_cst = '#39'03'#39') and (new.cofins_valiqprod > 0) )'
        '      or'
        
          '      ( ( (new.cofins_cst = '#39'01'#39') or (new.cofins_cst = '#39'02'#39') ) a' +
          'nd (new.cofins_pcofins > 0) )'
        '      ) then'
        '    begin'
        '      if (new.cofins_cst = '#39'03'#39') then'
        '      begin'
        '        new.cofins_qbcprod = new.qcom;'
        
          '        new.cofins_vcofins = round(new.cofins_qbcprod * new.cofi' +
          'ns_valiqprod, 2);'
        '        new.cofins_vbc = 0;'
        '        new.cofins_pcofins = 0;'
        '      end'
        '      else'
        '      begin'
        '        new.cofins_vbc = round(valor_tmp, 2);'
        
          '        new.cofins_vcofins = round(new.cofins_pcofins * new.cofi' +
          'ns_vbc / 100, 2);'
        '        new.cofins_qbcprod = 0;'
        '        new.cofins_valiqprod = 0;'
        '      end'
        '    end'
        '    else'
        '    begin'
        '      new.cofins_vbc = 0;'
        '      new.cofins_pcofins = 0;'
        '      new.cofins_qbcprod = 0;'
        '      new.cofins_valiqprod = 0;'
        '      new.cofins_vcofins = 0;'
        '    end'
        '  end'
        ''
        '  if (update_iss = '#39'S'#39') then'
        '  begin'
        '    if (new.iss_valiq > 0) then'
        '    begin'
        '      new.iss_vbc = round(valor_tmp, 2);'
        
          '      if ((new.iss_retido = '#39'S'#39') or (new.iss_retido = '#39'C'#39'))  the' +
          'n'
        '      begin'
        
          '        new.iss_vissret = round(new.iss_vbc * new.iss_valiq / 10' +
          '0, 2);'
        '        new.iss_vissqn = 0;'
        '      end'
        '      else'
        '      begin'
        
          '        new.iss_vissqn = round(new.iss_vbc * new.iss_valiq / 100' +
          ', 2);'
        '        new.iss_vissret = 0;'
        '      end'
        '    end'
        '    else'
        '    begin'
        '      new.iss_vbc = 0;'
        '      new.iss_valiq = 0;'
        '      new.iss_vissqn = 0;'
        '      new.iss_vissret = 0;'
        '      new.iss_retido = '#39'N'#39';'
        '    end'
        '  end'
        ''
        '  if (update_fcp = '#39'S'#39') then'
        '  begin'
        '    if (new.icm_cst in ('#39'10'#39', '#39'20'#39','#39'70'#39', '#39'90'#39')) then'
        '      new.fcp_vbcfcp = coalesce(new.icm_vbc, 0);'
        ''
        '    if (new.icm_cst in ('#39'00'#39', '#39'10'#39', '#39'20'#39','#39'70'#39', '#39'90'#39')) then'
        
          '      new.fcp_vfcp = round(coalesce(new.icm_vbc, 0) * new.fcp_pf' +
          'cp / 100, 2);'
        ''
        '    if (new.icm_cst = '#39'51'#39') then'
        '    begin'
        '      new.fcp_vbcfcp = valor_tmp;'
        
          '      new.fcp_vfcp   = round(coalesce(new.fcp_vbcfcp, 0) * new.f' +
          'cp_pfcp / 100, 2);'
        '    end'
        ''
        '    if ((new.icm_cst in ('#39'10'#39' , '#39'30'#39' , '#39'70'#39' , '#39'90'#39' )) or'
        '      (new.icm_csosn in ('#39'201'#39', '#39'202'#39', '#39'203'#39', '#39'900'#39'))) then'
        '    begin'
        '      new.fcp_vbcfcpst = new.fcp_vbcfcp;'
        
          '      new.fcp_vfcpst   = round(coalesce(new.fcp_vbcfcpst, 0) * n' +
          'ew.fcp_pfcpst / 100, 2);'
        '    end'
        '    '
        '    if (not new.icm_cst in ('#39'10'#39', '#39'20'#39', '#39'70'#39', '#39'90'#39')) then'
        '      new.fcp_vbcfcp = 0;'
        '  '
        '    if (not new.icm_cst in ('#39'00'#39', '#39'10'#39', '#39'20'#39', '#39'70'#39', '#39'90'#39')) then'
        '    begin'
        '      new.fcp_pfcp = 0;'
        '      new.fcp_vfcp = 0;'
        '    end'
        ''
        
          '    if (((not new.icm_cst   in ( '#39'10'#39',  '#39'30'#39',  '#39'70'#39',  '#39'90'#39')) and' +
          ' (trim(coalesce(new.icm_csosn, '#39#39')) =  '#39#39')) or'
        
          '        ((not new.icm_csosn in ('#39'201'#39', '#39'202'#39', '#39'203'#39', '#39'900'#39')) and' +
          ' (trim(coalesce(new.icm_csosn, '#39#39')) <> '#39#39'))) then'
        '    begin'
        '      new.fcp_vbcfcpst = 0;'
        '      new.fcp_pfcpst   = 0;'
        '      new.fcp_vfcpst   = 0;'
        '    end'
        '  '
        
          '    if (((new.icm_cst                 <>  '#39'60'#39') and (trim(coales' +
          'ce(new.icm_csosn, '#39#39')) =  '#39#39')) or'
        
          '        ((coalesce(new.icm_csosn, '#39#39') <> '#39'500'#39') and (trim(coales' +
          'ce(new.icm_csosn, '#39#39')) <> '#39#39'))) then'
        '    begin'
        '      new.fcp_vbcfcpstret = 0;'
        '      new.fcp_pfcpstret   = 0;'
        '      new.fcp_vfcpstret   = 0;'
        '    end'
        '  '
        '    if (coalesce(new.fcp_pfcp, 0) <= 0) then'
        '    begin'
        '      new.fcp_pfcp   = 0;'
        '      new.fcp_vbcfcp = 0;'
        '      new.fcp_vfcp   = 0;'
        '    end'
        '  '
        '    if (coalesce(new.fcp_pfcpst, 0) <= 0) then'
        '    begin'
        '      new.fcp_pfcpst   = 0;'
        '      new.fcp_vbcfcpst = 0;'
        '      new.fcp_vfcpst   = 0;'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE FINALIDADE ('
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    DESCRICAO    VARCHAR(64)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE FINALIDADE ADD CONSTRAINT PK_FINALIDADE PRIMARY KEY ' +
          '(ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE DESONERACAO ('
        '    ID               INTEGER NOT NULL,'
        '    COD_EMPRESA      INTEGER NOT NULL,'
        '    DESCRICAO        VARCHAR(64),'
        '    IND_DESONERACAO  SMALLINT'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE DESONERACAO ADD CONSTRAINT PK_DESONERACAO PRIMARY KE' +
          'Y (ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE DESONERACAO_REGRAS ('
        '    DESONERACAOID     INTEGER NOT NULL,'
        '    COD_EMPRESA       INTEGER NOT NULL,'
        '    ID_REGRAS         INTEGER NOT NULL,'
        '    SIGLA_UF          VARCHAR(128),'
        '    CSTS              VARCHAR(16),'
        '    CONTRIBUINTE      VARCHAR(8),'
        '    PESSOA            VARCHAR(8),'
        '    CONSUMIDOR_FINAL  VARCHAR(8),'
        '    FINALIDADEID      INTEGER'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE DESONERACAO_REGRAS ADD CONSTRAINT PK_DESONERACAO_REG' +
          'RAS PRIMARY KEY (DESONERACAOID, COD_EMPRESA, ID_REGRAS);'
        
          'ALTER TABLE DESONERACAO_REGRAS ADD CONSTRAINT FK_DESONERACAO_REG' +
          'RAS FOREIGN KEY (DESONERACAOID, COD_EMPRESA) REFERENCES DESONERA' +
          'CAO (ID,  COD_EMPRESA) ON UPDATE CASCADE ON DELETE CASCADE;'
        
          'ALTER TABLE DESONERACAO_REGRAS ADD CONSTRAINT FK_DESONERACAO_REG' +
          'RAS_FINAL foreign KEY (FINALIDADEID, COD_EMPRESA) REFERENCES FIN' +
          'ALIDADE (ID, COD_EMPRESA) ON UPDATE CASCADE;'
        ''
        '|BLOCO|'
        'CREATE TABLE DESONERACAO_EXCECOES ('
        '    DESONERACAOID  INTEGER NOT NULL,'
        '    COD_EMPRESA    INTEGER NOT NULL,'
        '    NCM            VARCHAR(8) NOT NULL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE DESONERACAO_EXCECOES ADD CONSTRAINT PK_DESONERACAO_E' +
          'XCECOES PRIMARY KEY (DESONERACAOID, COD_EMPRESA, NCM);'
        
          'ALTER TABLE DESONERACAO_EXCECOES ADD CONSTRAINT FK_DESONERACAO_E' +
          'XCECOES FOREIGN KEY (DESONERACAOID, COD_EMPRESA) REFERENCES DESO' +
          'NERACAO (ID, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        'ALTER TABLE PRODUTOS_TRIB_PF ADD IND_DESONERACAO SMALLINT;'
        'ALTER TABLE PRODUTOS_TRIB_PF ADD FINALIDADEID INTEGER;'
        'ALTER TABLE CLIENTES ADD FINALIDADEID INTEGER;'
        
          'ALTER TABLE CLIENTES ADD CONSTRAINT FK_CLIENTES_FINALIDE FOREIGN' +
          ' KEY (FINALIDADEID, COD_EMPRESA) REFERENCES FINALIDADE (ID, COD_' +
          'EMPRESA) ON UPDATE CASCADE;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD IND_DESONERACAO  SMALLINT;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD VICMDESON T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL ADD VICMDESON T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL ADD FINALIDADEID INTEGER;'
        'ALTER TABLE PEDVENDA ADD NF_CF_DESON_EMB CHAR(1);'
        'ALTER TABLE PEDVENDA ADD NF_DC_DESCONTO T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_DC_VICMDESON T_N_GERAL;'
        'ALTER TABLE PEDVENDA ADD NF_AC_VICMDESON T_N_GERAL;'
        'ALTER TABLE PEDVENDA_PROD ADD NF_DC_DESPNF T_N_GERAL;'
        'ALTER TABLE PEDVENDA_PROD ADD NF_AC_DES_EMB T_N_GERAL;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO322'#39', :COD_EMPRESA, '#39'BT' +
          ' PESQUISAR DESONERACAO'#39', 4, '#39'N'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S'#39', CU' +
          'RRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO323'#39', :COD_EMPRESA, '#39'BT' +
          ' INSERIR DESONERACAO'#39', 4, '#39'N'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO324'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR DESONERACAO'#39', 4, '#39'N'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO325'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR DESONERACAO'#39', 10, '#39'S'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S'#39', CUR' +
          'RENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO326'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR DESONERACAO'#39', 4, '#39'N'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO327'#39', :COD_EMPRESA, '#39'BT' +
          ' INSERIR REGRA DESONERACAO'#39', 4, '#39'N'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO328'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR REGRA DESONERACAO'#39', 4, '#39'N'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO329'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR REGRA DESONERACAO'#39', 4, '#39'N'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO330'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR REGRA DESONERACAO'#39', 10, '#39'S'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39'S' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO331'#39', :COD_EMPRESA, '#39'BT' +
          ' INSERIR EXCECAO DESONERACAO'#39', 4, '#39'N'#39', '#39'FRMCADDESONERACAO'#39', 1, '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO332'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR EXCECAO DESONERACAO'#39', 10, '#39'S'#39', '#39'FRMCADDESONERACAO'#39', 1, ' +
          #39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI245'#39', :COD_EMPRESA, '#39'BT' +
          ' PESQUISAR FINALIDADE'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURRENT' +
          '_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI246'#39', :COD_EMPRESA, '#39'BT' +
          ' INSERIR FINALIDADE'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURRENT_D' +
          'ATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI247'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR FINALIDADE'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURRENT_D' +
          'ATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI248'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR FINALIDADE'#39', 10, '#39'S'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURRENT_' +
          'DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI249'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR FINALIDADE'#39', 4, '#39'N'#39', '#39'FRMCADCLIENTE'#39', 1, '#39'S'#39', CURRENT_DA' +
          'TE);')
    end
  end
end
