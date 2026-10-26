inherited frmReestruturaVersao22: TfrmReestruturaVersao22
  Caption = 'frmReestruturaVersao22'
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
        'ALTER TABLE CEST_VARIANTE ADD API_ID INTEGER;'
        
          'CMD:REPL|update config_sistema set value1_f = 1 where chave = '#39'n' +
          'f_icmsst_cest_v2'#39' and cod_empresa = :COD_EMPRESA and value1_f = ' +
          '1;'
        ''
        '|BLOCO|'
        'CREATE TABLE GS1PREFIX ('
        '    INICIO     VARCHAR(3) NOT NULL,'
        '    FIM        VARCHAR(3) NOT NULL,'
        '    ESPECIAL   SMALLINT NOT NULL,'
        '    DESCRICAO  VARCHAR(64)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE GS1PREFIX ADD CONSTRAINT PK_GS1PREFIX PRIMARY KEY (I' +
          'NICIO, FIM);'
        ''
        '|BLOCO|'
        'CREATE GLOBAL TEMPORARY TABLE EFD_ICMSST_CR_E_S_DEV ('
        '    COD_NF          INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    NITEM           INTEGER NOT NULL,'
        '    TIPO_REF        VARCHAR(3),'
        '    COD_REF         INTEGER NOT NULL,'
        '    NITEM_REF       INTEGER NOT NULL,'
        '    QUANTIDADE_REF  T_VL_TODOS'
        ') ON COMMIT DELETE ROWS;'
        '|/BLOCO|'
        ''
        
          'CREATE UNIQUE DESCENDING INDEX IDX_EFD_ICMSST_CR_E_S_DEV ON EFD_' +
          'ICMSST_CR_E_S_DEV (COD_NF, COD_EMPRESA, NITEM, TIPO_REF, COD_REF' +
          ', NITEM_REF);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_EFD_ICMSST_DEV_MAKE ('
        '    DTINI timestamp,'
        '    DTFIM timestamp,'
        '    CODEMPRESA integer)'
        'returns ('
        '    RESULT smallint)'
        'as'
        '  declare variable NAT_DEV char(1);'
        '  declare variable COD_NF_DEV integer;'
        '  declare variable NITEM_DEV integer;'
        '  declare variable TP_REF varchar(3);'
        '  declare variable COD_DOC_REF integer;'
        '  declare variable NITEM_REF integer;'
        '  declare variable GRU integer;'
        '  declare variable COD char(6);'
        'begin'
        '  result = 0;'
        '--para cada item de devolucao em uma nota'
        
          '-- ver se vai precisar de nova procedure ou usar o mesmo select ' +
          'da outra que tem a data de emissao'
        '--   procurar a venda pelas referencias'
        
          '--   caso encontre a referencia e esta ainda nao tenha sido vicu' +
          'lada a outro documento em quantidade superior(vai ter de adicion' +
          'ar quantidade)'
        '--   adicionar a referencia, e passar para o proximo'
        '--'
        
          '    for select es.cod_doc, es.e_s, es.nitem, es.grupo_prod, es.c' +
          'od_prod'
        '      from efd_icmsst_cr_e_s es'
        
          '        inner join nat_op np on np.codigo_nop = es.codigo_nop an' +
          'd np.devolucao = '#39'S'#39
        
          '      where es.data >= :dtini and es.data <= :dtfim and es.cod_e' +
          'mpresa = :codempresa and es.tpdoc = '#39'NF'#39
        '        into :cod_nf_dev, :nat_dev, :nitem_dev, :gru, :cod'
        '    do'
        '    begin'
        '      for select distinct '#39'NF'#39', nfsel.cod_nf, nfi.nitem'
        '          from notafiscal_sped_c110 c1'
        
          '            inner join notafiscal_sped_c113 c3 on c3.cod_nf = c1' +
          '.cod_nf and c3.cod_empresa = c1.cod_empresa and coalesce(c3.cod_' +
          'nf_ref, 0) > 0 and c3.chave_nfe_ref is null'
        
          '            inner join notafiscal nfsel on nfsel.cod_nf = c3.cod' +
          '_nf_ref and nfsel.cod_empresa = c3.cod_empresa and nfsel.naturez' +
          'a_nf = iif(:NAT_dev = '#39'S'#39', '#39'E'#39', '#39'S'#39')'
        
          '            inner join notafiscal_item nfi on nfi.cod_nf = nfsel' +
          '.cod_nf and nfi.cod_empresa = nfi.cod_empresa and nfi.grupo_prod' +
          ' = :gru and nfi.cod_prod = :cod'
        
          '          where c1.cod_nf = :cod_nf_dev and c1.cod_empresa = :co' +
          'dempresa'
        '        union'
        '        select distinct '#39'NF'#39', nfsel.cod_nf, nfi.nitem'
        '          from notafiscal_sped_c110 c1'
        
          '            inner join notafiscal_sped_c113 c3 on c3.cod_nf = c1' +
          '.cod_nf and c3.cod_empresa = c1.cod_empresa and coalesce(c3.cod_' +
          'nf_ref, 0) < 0 and c3.chave_nfe_ref is not null'
        
          '            inner join notafiscal nfsel on nfsel.chave_nfe = c3.' +
          'chave_nfe_ref and nfsel.cod_empresa = c3.cod_empresa and nfsel.n' +
          'atureza_nf = iif(:NAT_dev = '#39'S'#39', '#39'E'#39', '#39'S'#39')'
        
          '            inner join notafiscal_item nfi on nfi.cod_nf = nfsel' +
          '.cod_nf and nfi.cod_empresa = nfi.cod_empresa and nfi.grupo_prod' +
          ' = :gru and nfi.cod_prod = :cod'
        
          '          where c1.cod_nf = :cod_nf_dev and c1.cod_empresa = :co' +
          'dempresa'
        '        union'
        '        select distinct '#39'NFC'#39', nfc.cod_nfce, nci.nitem'
        '          from notafiscal nf'
        
          '            inner join notafiscal_sped_c110 c1 on c1.cod_nf = nf' +
          '.cod_nf and c1.cod_empresa = nf.cod_empresa'
        
          '            inner join notafiscal_sped_c113 c3 on c3.cod_nf = c1' +
          '.cod_nf and c3.cod_empresa = c1.cod_empresa and coalesce(c3.cod_' +
          'nf_ref, 0) < 0 and c3.chave_nfe_ref is not null'
        
          '            inner join nfce nfc on nfc.chave_nfce = c3.chave_nfe' +
          '_ref and nfc.cod_empresa = c3.cod_empresa'
        
          '            inner join nfce_item nci on nci.cod_nfce = nfc.cod_n' +
          'fce and nci.cod_empresa = nfc.cod_empresa and nci.grupo_prod = :' +
          'gru and nci.cod_prod = :cod'
        
          '          where nf.cod_nf = :cod_nf_dev and nf.cod_empresa = :co' +
          'dempresa and nf.natureza_nf = '#39'E'#39
        '        union'
        '        select distinct '#39'CP'#39', cp.cupom, cp2.nitem'
        '          from notafiscal nf'
        
          '            inner join notafiscal_sped_c110 c1 on c1.cod_nf = nf' +
          '.cod_nf and c1.cod_empresa = nf.cod_empresa'
        
          '            inner join notafiscal_sped_c114 c4 on c4.cod_nf = c1' +
          '.cod_nf and c4.cod_empresa = c1.cod_empresa'
        
          '            inner join cupom cp on cp.data = c4.dt_doc and cp.cu' +
          'pom  = c4.num_doc and cp.nserieecf = c4.ecf_fab and cp.cod_empre' +
          'sa = c4.cod_empresa'
        
          '            inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_t' +
          'erminal and cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = ' +
          'cp2.nserieecf and'
        '              cp.registro = cp2.ordem and cp.cupom = cp2.cupom'
        
          '          where nf.cod_nf = :cod_nf_dev and nf.cod_empresa = :co' +
          'dempresa and nf.natureza_nf = '#39'E'#39
        '        into :tp_ref, :COD_doc_ref , :nitem_ref'
        '      do'
        '      begin'
        ''
        
          '        update or insert into efd_icmsst_cr_e_s_dev (COD_NF, COD' +
          '_EMPRESA, NITEM, TIPO_ref, COD_ref, NITEM_ref)'
        
          '        values (:cod_nf_dev, :codempresa, :nitem_dev, :tp_ref, :' +
          'cod_doc_ref, :nitem_ref)'
        
          '        matching (COD_NF, COD_EMPRESA, NITEM, TIPO_ref, COD_ref,' +
          ' NITEM_ref);'
        ''
        '        result = result + 1;'
        '      end'
        '    end'
        ''
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_EFD_ICMSST_DEV_PERIODO ('
        '    DTINI timestamp,'
        '    DTFIM timestamp,'
        '    CODEMPRESA integer,'
        '    USADHEMI smallint)'
        'returns ('
        '    MES smallint,'
        '    ANO smallint)'
        'as'
        '  declare variable COD_NF_MES integer;'
        '  declare variable NAT_MES char(1);'
        'begin'
        ''
        '  --selecionar as entradas e saidas devolvidas'
        
          '  -- para cada entrada ou saida localizar o documento referencia' +
          'do'
        '  --   referencia pelo codigo na tabela NF'
        '  --   referencia pela chave na tabela NF'
        '  --   referencia pela chave na tabela NFCe'
        '  for execute statement '#39'select T8.COD_DOC, T8.E_S'#39' ||'
        '                        '#39' from VW_TIPO88_ITNF T8'#39' ||'
        
          '                        '#39'   inner join EFD_ICMSST_CR_CFOPS N on ' +
          'N.CFOP = T8.CODIGO_NOP'#39' ||'
        
          '                        '#39'   inner join NAT_OP np on np.CODIGO_NO' +
          'P = t8.CODIGO_NOP and np.DEVOLUCAO = '#39#39'S'#39#39#39' ||'
        
          '                        '#39' where '#39' || iif(:USADHEMI = 1, '#39'T8.DATA' +
          '_EMISS'#39', '#39'T8.DATA_LANC'#39') || '#39' >= '#39#39#39' || :DTINI || '#39#39#39' and '#39' ||'
        
          '                            iif(:USADHEMI = 1, '#39'T8.DATA_EMISS'#39', ' +
          #39'T8.DATA_LANC'#39') || '#39' <= '#39#39#39' || :DTFIM || '#39#39#39' and'#39' ||'
        
          '                            '#39' iif(T8.E_S = '#39#39'E'#39#39', '#39#39'S'#39#39', T8.CONS' +
          'UMIDOR_FINAL) = '#39#39'S'#39#39' and T8.COD_EMPRESA ='#39' || :CODEMPRESA'
        '    into :cod_nf_mes, :nat_mes'
        '  do'
        '    begin'
        '        for select distinct'
        
          '            iif(:usadhemi = 1, extract(month from nfsel.data_con' +
          'tabil), extract(month from nfsel.data_lanc)) mes,'
        
          '            iif(:usadhemi = 1, extract(year from nfsel.data_cont' +
          'abil), extract(year from nfsel.data_lanc)) ano'
        '            from notafiscal_sped_c110 c1'
        
          '              inner join notafiscal_sped_c113 c3 on c3.cod_nf = ' +
          'c1.cod_nf and c3.cod_empresa = c1.cod_empresa and coalesce(c3.co' +
          'd_nf_ref, 0) > 0 and c3.chave_nfe_ref is null'
        
          '              inner join notafiscal nfsel on nfsel.cod_nf = c3.c' +
          'od_nf_ref and nfsel.cod_empresa = c3.cod_empresa and nfsel.natur' +
          'eza_nf = iif(:nat_mes = '#39'S'#39', '#39'E'#39', '#39'S'#39')'
        
          '            where c1.cod_nf = :cod_nf_mes and c1.cod_empresa = :' +
          'codempresa'
        '          union'
        '          select distinct'
        
          '            iif(:usadhemi = 1, extract(month from nfsel.data_con' +
          'tabil), extract(month from nfsel.data_lanc)) mes,'
        
          '            iif(:usadhemi = 1, extract(year from nfsel.data_cont' +
          'abil), extract(year from nfsel.data_lanc)) ano'
        '            from notafiscal_sped_c110 c1'
        
          '              inner join notafiscal_sped_c113 c3 on c3.cod_nf = ' +
          'c1.cod_nf and c3.cod_empresa = c1.cod_empresa and coalesce(c3.co' +
          'd_nf_ref, 0) < 0 and c3.chave_nfe_ref is not null'
        
          '              inner join notafiscal nfsel on nfsel.chave_nfe = c' +
          '3.chave_nfe_ref and nfsel.cod_empresa = c3.cod_empresa and nfsel' +
          '.natureza_nf = iif(:nat_mes = '#39'S'#39', '#39'E'#39', '#39'S'#39')'
        
          '            where c1.cod_nf = :cod_nf_mes and c1.cod_empresa = :' +
          'codempresa'
        '          union'
        
          '          select distinct extract(month from nfc.dhemi), extract' +
          '(year from nfc.dhemi)'
        '            from notafiscal nf'
        
          '              inner join notafiscal_sped_c110 c1 on c1.cod_nf = ' +
          'nf.cod_nf and c1.cod_empresa = nf.cod_empresa'
        
          '              inner join notafiscal_sped_c113 c3 on c3.cod_nf = ' +
          'c1.cod_nf and c3.cod_empresa = c1.cod_empresa and coalesce(c3.co' +
          'd_nf_ref, 0) < 0 and c3.chave_nfe_ref is not null'
        
          '              inner join nfce nfc on nfc.chave_nfce = c3.chave_n' +
          'fe_ref and nfc.cod_empresa = c3.cod_empresa'
        
          '            where nf.cod_nf = :cod_nf_mes and nf.cod_empresa = :' +
          'codempresa and nf.natureza_nf = '#39'E'#39
        '          union'
        
          '          select distinct extract(month from cp.data), extract(y' +
          'ear from cp.data)'
        '            from notafiscal nf'
        
          '              inner join notafiscal_sped_c110 c1 on c1.cod_nf = ' +
          'nf.cod_nf and c1.cod_empresa = nf.cod_empresa'
        
          '              inner join notafiscal_sped_c114 c4 on c4.cod_nf = ' +
          'c1.cod_nf and c4.cod_empresa = c1.cod_empresa'
        
          '              inner join cupom cp on cp.data = c4.dt_doc and cp.' +
          'cupom  = c4.num_doc and cp.nserieecf = c4.ecf_fab and cp.cod_emp' +
          'resa = c4.cod_empresa'
        
          '            where nf.cod_nf = :cod_nf_mes and nf.cod_empresa = :' +
          'codempresa and nf.natureza_nf = '#39'E'#39
        '          into :mes, :ano'
        '        do'
        '        begin'
        '          suspend;'
        '        end'
        '    end'
        'end'
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
        
          '    left join NAT_OP NT on NT.CODIGO_NOP = T8.CODIGO_NOP and NT.' +
          'DEVOLUCAO = '#39#39'S'#39#39
        
          '  where '#39' || iif(:USADHEMI = 1, '#39'T8.DATA_EMISS'#39', '#39'T8.DATA_LANC'#39')' +
          ' || '#39' >= '#39#39#39' || :DTINI || '#39#39#39' and'
        
          '        '#39' || iif(:USADHEMI = 1, '#39'T8.DATA_EMISS'#39', '#39'T8.DATA_LANC'#39')' +
          ' || '#39' <= '#39#39#39' || :DTFIM || '#39#39#39' and'
        
          '        iif(T8.E_S = '#39#39'E'#39#39', '#39#39'S'#39#39', iif(NT.DEVOLUCAO = '#39#39'S'#39#39', '#39#39'S' +
          #39#39', T8.CONSUMIDOR_FINAL)) = '#39#39'S'#39#39' and'
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
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE ADM_CARTAO_REDES ('
        '    REDE         VARCHAR(32) NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    COD_ADM      INTEGER,'
        '    TBAND        SMALLINT,'
        '    DEBCRED     CHAR(1)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE ADM_CARTAO_REDES ADD CONSTRAINT PK_ADM_CARTAO_REDES ' +
          'PRIMARY KEY (REDE, COD_EMPRESA);'
        
          'ALTER TABLE ADM_CARTAO_REDES ADD CONSTRAINT FK_ADM_CARTAO_REDES ' +
          'FOREIGN KEY (COD_ADM, COD_EMPRESA) REFERENCES ADM_CARTAO (COD_AD' +
          'M, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;'
        'ALTER TABLE NFCE_PAGAMENTO ADD ID_TR_CARTAO INTEGER;'
        
          'ALTER TABLE NFCE_PAGAMENTO ADD CONSTRAINT NFCE_PAGAMENTO_TR_CART' +
          'AO FOREIGN KEY (ID_TR_CARTAO, COD_EMPRESA) REFERENCES TRANSACAO_' +
          'CARTAO(SEQID, COD_EMPRESA) ON UPDATE CASCADE;'
        'ALTER TABLE TRANSACAO_CARTAO ADD REDE VARCHAR(32);'
        
          'CREATE INDEX IDX_TRANSACAO_CARTAO_NUMDOC ON TRANSACAO_CARTAO (TP' +
          'DOCS, NREQUISICAO, COD_EMPRESA);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NFC039'#39', :COD_EMPRESA, '#39'EXCLUIR PAGAMENTO COM CARTAO ' +
          'TEF AUTORIZADO'#39', 100, '#39'N'#39', '#39'S'#39');'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA' +
          ') VALUES ('#39'NFC040'#39', :COD_EMPRESA, '#39'INCLUIR PAGAMENTO CARTAO SEM ' +
          'TRANSACAO TEF'#39', 100, '#39'N'#39', '#39'S'#39');'
        
          'update config_sistema set chave = replace(chave, '#39'conc_banc'#39', '#39'c' +
          'onc_banc_sistema'#39') where chave like '#39'conc_banc%'#39' and chave not l' +
          'ike '#39'conc_banc_sistema%'#39';'
        'ALTER TABLE EMPDESVOLV ADD COD_EMP_CONC_CARTAO INTEGER;'
        'ALTER TABLE EMPDESVOLV ADD DADOS_CONC_CARTAO VARCHAR(100);'
        'ALTER TABLE CONFIG_API ADD COD_INTEGRADOR VARCHAR(60);'
        'ALTER TABLE CONFIG_API ADD TOKEN_INTEGRADOR VARCHAR(255);'
        'ALTER TABLE CONFIG_API ADD COD_CLIENTE_CONFERE INTEGER;'
        'ALTER TABLE CONFIG_API ADD COD_ESTABEL_CONFERE INTEGER;'
        'ALTER TABLE CONTROLE_CREDITOS ADD ID_CONFERE INTEGER;'
        'ALTER TABLE CONTROLE_CREDITOS ADD ID_FINANC_CONFERE INTEGER;'
        'ALTER TABLE CONTAS_A_PAGAR ADD ID_FINANC_CONFERE INTEGER;'
        'ALTER TABLE LANCAMENTOS ADD ID_FINANC_CONFERE INTEGER;'
        ''
        '|BLOCO|'
        'CREATE TABLE CONCILIACAO_EVENTOS ('
        '    ID                      INTEGER NOT NULL,'
        '    COD_EMPRESA             INTEGER NOT NULL,'
        '    TYPE_                   VARCHAR(20),'
        '    MERCHANT_ID             INTEGER,'
        '    ESTABLISHMENT_NUMBER    VARCHAR(30),'
        '    DATE_                   TIMESTAMP,'
        '    REQUEST_DATE            TIMESTAMP,'
        '    EFFECTED_DATE           TIMESTAMP,'
        '    HOUR_                   VARCHAR(8),'
        '    GROSS_AMOUNT            T_VL_TODOS,'
        '    NET_AMOUNT              T_VL_TODOS,'
        '    TAX                     T_VL_TODOS,'
        '    SALE_TAX                T_VL_TODOS,'
        '    CUSTOMER_TAX            T_VL_TODOS,'
        '    ADJUST_DESCRIPTION      VARCHAR(20),'
        '    PROTOCOL_NUMBER         VARCHAR(50),'
        '    INSTALLMENT_NUMBER      INTEGER,'
        '    INSTALLMENTS_TOTAL      INTEGER,'
        '    TRANSACTION_TYPE        VARCHAR(20),'
        '    ACQUIRER_ID             INTEGER,'
        '    ACQUIRER_NAME           VARCHAR(30),'
        '    BRAND_ID                INTEGER,'
        '    BRAND_NAME              VARCHAR(30),'
        '    AUTHORIZATION_NUMBER    VARCHAR(20),'
        '    NSU                     VARCHAR(20),'
        '    FINANCIAL_STATUS        VARCHAR(20),'
        '    SALES_STATUS            VARCHAR(20),'
        '    TERMINAL_NUMBER         VARCHAR(20)    '
        ');'
        '|/BLOCO|'
        '      '
        
          'ALTER TABLE CONCILIACAO_EVENTOS ADD CONSTRAINT PK_CONCILIACAO_EV' +
          'ENTOS PRIMARY KEY (ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CONCILIACAO_FINANCEIRO ('
        '    ID                      INTEGER NOT NULL,'
        '    INSTALLMENT_NUMBER      INTEGER NOT NULL,'
        '    INSTALLMENTS_TOTAL      INTEGER NOT NULL,'#9
        '    COD_EMPRESA             INTEGER NOT NULL,'
        '    EVENT_TYPE              INTEGER, '
        '    EVENT_TYPE_DESCRIPTION  VARCHAR(30),'
        '    TYPE_                   INTEGER,'
        '    TYPE_DESCRIPTION        VARCHAR(30),'
        '    MERCHANT_ID             INTEGER,'
        '    ESTABLISHMENT_NUMBER    VARCHAR(30),'
        '    DATE_                   TIMESTAMP,'
        '    REQUEST_DATE            TIMESTAMP,'
        '    EFFECTED_DATE           TIMESTAMP,'
        '    HOUR_                   VARCHAR(8),'
        '    GROSS_AMOUNT            T_VL_TODOS,'
        '    EVENT_NET_AMOUNT        T_VL_TODOS,'
        '    BATCH_NET_AMOUNT        T_VL_TODOS,'
        '    TAX                     T_VL_TODOS,'
        '    SALE_TAX                T_VL_TODOS,'
        '    CUSTOMER_TAX            T_VL_TODOS,'
        '    DESCRIPTION             VARCHAR(30),'
        '    PROTOCOL_NUMBER         VARCHAR(50),    '
        '    TRANSACTION_TYPE        VARCHAR(30),'
        '    ACQUIRER_ID             INTEGER,'
        '    ACQUIRER_NAME           VARCHAR(30),'
        '    BRAND_ID                INTEGER,'
        '    BRAND_NAME              VARCHAR(30),'
        '    AUTHORIZATION_NUMBER    VARCHAR(20),'
        '    NSU                     VARCHAR(20),'
        '    BANK_NAME               VARCHAR(30),'
        '    BANK_NUMBER             INTEGER,'
        '    BRANCH_NUMBER           INTEGER,'
        '    ACCOUNT_NUMBER          VARCHAR(20),'
        '    BATCH_NUMBER            VARCHAR(20),'
        '    BANK_RECON_STATUS       INTEGER,'
        '    TERMINAL_NUMBER         VARCHAR(20),'
        '    SALE_ID                 VARCHAR(20)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CONCILIACAO_FINANCEIRO ADD CONSTRAINT PK_CONCILIACAO' +
          '_FINANCEIRO PRIMARY KEY (ID, INSTALLMENT_NUMBER, INSTALLMENTS_TO' +
          'TAL, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CONCILIACAO_DESCR_TIPO ('
        '    DESCRICAO               VARCHAR(30) NOT NULL,'
        '    COD_EMPRESA             INTEGER NOT NULL,'
        '    NATUREZA                CHAR(1) NOT NULL,  '
        '    N_CONTA_PLC             T_N_GERAL'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CONCILIACAO_DESCR_TIPO ADD CONSTRAINT PK_CONCILIACAO' +
          '_DESCR_TIPO PRIMARY KEY (DESCRICAO, COD_EMPRESA, NATUREZA);'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS452'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA TIPOS DE LANCAMENTOS CONC CARTAO'#39', 10, '#39'FRMCADCONCILIAC' +
          'AOEVENTOSDESCR'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS453'#39', :COD_EMPRESA, '#39'BT' +
          ' PESQUISAR TIPOS DE LANCAMENTOS CONC CARTAO'#39', 10, '#39'FRMCADCONCILI' +
          'ACAOEVENTOSDESCR'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS454'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO TIPOS DE LANCAMENTOS CONC CARTAO'#39', 10, '#39'FRMCADCONCILIACAOE' +
          'VENTOSDESCR'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS455'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR TIPOS DE LANCAMENTOS CONC CARTAO'#39', 10, '#39'FRMCADCONCILIAC' +
          'AOEVENTOSDESCR'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS456'#39', :COD_EMPRESA, '#39'BT' +
          ' REMOVER TIPOS DE LANCAMENTOS CONC CARTAO'#39', 10, '#39'FRMCADCONCILIAC' +
          'AOEVENTOSDESCR'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS457'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR TIPOS DE LANCAMENTOS CONC CARTAO'#39', 10, '#39'FRMCADCONCILIACA' +
          'OEVENTOSDESCR'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        'ALTER TABLE ADM_CARTAO ADD COD_ADQUIRENTE INTEGER;'
        ''
        '|BLOCO|'
        'CREATE TABLE CONCILIACAO_ADQUIRENTE ('
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    NOME         VARCHAR(30),'
        '    ATIVO        SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CONCILIACAO_ADQUIRENTE ADD CONSTRAINT PK_CONCILIACAO' +
          '_ADQUIRENTE PRIMARY KEY (ID, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE CONCILIACAO_BANDEIRA ('
        '    ID           INTEGER NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    NOME         VARCHAR(30),'
        '    ATIVO        SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CONCILIACAO_BANDEIRA ADD CONSTRAINT PK_CONCILIACAO_B' +
          'ANDEIRA PRIMARY KEY (ID, COD_EMPRESA);'
        'ALTER TABLE CONTROLE_CREDITOS ADD IDDEV_CARTAO INTEGER;'
        
          'CREATE INDEX IDX_CONTROLES_CARTAO ON CONTROLES (N_CONTA_CTRL, AG' +
          'ENCIA_CTRL, CODIGO_EMP);'
        
          'CREATE INDEX IDX_CONCILIACAO_FINANCEIRO_DTTP ON CONCILIACAO_FINA' +
          'NCEIRO (DATE_, COD_EMPRESA, EVENT_TYPE_DESCRIPTION);'
        
          'CREATE INDEX IDX_CONTROLE_CREDITOS_AUTNSU ON CONTROLE_CREDITOS (' +
          'N_DOCNSU_ADM, N_AUT_CART, NPARCELA, COD_EMP_MULT);'
        
          'CREATE INDEX IDX_CONTROLE_CREDITOS_NSU ON CONTROLE_CREDITOS (N_D' +
          'OCNSU_ADM, NPARCELA, COD_EMP_MULT);'
        
          'CREATE INDEX IDX_CONCILIACAO_FINANCEIRO_NSAT ON CONCILIACAO_FINA' +
          'NCEIRO (NSU, AUTHORIZATION_NUMBER, INSTALLMENT_NUMBER, COD_EMPRE' +
          'SA);'
        
          'CREATE INDEX IDX_CONCILIACAO_FINANCEIRO_NSU ON CONCILIACAO_FINAN' +
          'CEIRO (NSU, INSTALLMENT_NUMBER, COD_EMPRESA);'
        
          'CREATE INDEX IDX_DTCADCRED_MULT ON CONTROLE_CREDITOS (DATA_REC_C' +
          ', COD_EMP_MULT);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN035'#39', :COD_EMPRESA, ' +
          #39'BUSCAR MOVIMENTOS FINANCEIRO CONCILIACAO CARTAO'#39', 3, '#39'FRMCONCIL' +
          'IACARTAOCONFERE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN036'#39', :COD_EMPRESA, ' +
          #39'CONFIRMAR CONCILIACAO CARTAO'#39', 3, '#39'FRMCONCILIACARTAOCONFERE'#39', 1' +
          ', '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN037'#39', :COD_EMPRESA, ' +
          #39'BUSCAR PENDENCIAS CONCILIACAO CARTAO'#39', 3, '#39'FRMCONCILIACARTAOCON' +
          'FERE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN038'#39', :COD_EMPRESA, ' +
          #39'VINCULAR CREDITO A FINANCEIRO CONCILIACAO CARTAO'#39', 3, '#39'FRMCONCI' +
          'LIACARTAOCONFERE'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'IMPFIN039'#39', :COD_EMPRESA, ' +
          #39'EXCLUIR PENDENCIAS CONCILIACAO CARTAO'#39', 3, '#39'FRMCONCILIACARTAOCO' +
          'NFERE'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        'CREATE SEQUENCE INC_KIT_PEDVENDA_PROD;'
        'ALTER TABLE PEDVENDA_PROD ADD ID_KIT INTEGER;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'PRO427'#39', :COD_EMPRESA, '#39'BT' +
          ' IMPRIMIR KITS DE PRODUTOS'#39', 3, '#39'FRMCADKITS'#39', 1, '#39'N'#39', '#39'N'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|delete from config_sistema cs where cs.chave = '#39'ped_vnd' +
          '_campos_obrigatorios'#39' and cs.value1_b not like '#39'%|Campo do banco' +
          '|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|Tipo ' +
          '(REQ/OS/ORCP/ORCPS)%'#39';'
        'ALTER TABLE NFCE_ITEM ADD PIS_RESET INTEGER;'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NFCE_RESET_PISCOFINS ('
        '    CODIGO_NFCE integer,'
        '    CODIGO_EMPRESA integer)'
        'returns ('
        '    SUCESSO smallint)'
        'as'
        '  declare variable AGRUPO_PROD integer;'
        '  declare variable ACOD_PROD char(6);'
        '  declare variable ASEQID integer;'
        '  declare variable ACST char(2);'
        '  declare variable APIS_EMP double precision;'
        '  declare variable ACOFINS_EMP double precision;'
        '  declare variable APIS_PROD double precision;'
        '  declare variable ACOFINS_PROD double precision;'
        '  declare variable ANAT_REC char(3);'
        '  declare variable VPIS double precision;'
        '  declare variable VCOFINS double precision;'
        'begin'
        '  sucesso = 0;'
        ''
        '  select pis_emp, cofins_emp from empresa'
        '    where cod_empresa = :codigo_empresa'
        '    into :apis_emp, :acofins_emp;'
        ''
        '  for select grupo_prod, cod_prod, seqid from nfce_item'
        
          '    where cod_nfce = :codigo_nfce and cod_empresa = :codigo_empr' +
          'esa and tipo_item = '#39'P'#39
        '    into :agrupo_prod, :acod_prod, :aseqid'
        '  do'
        '  begin'
        
          '    select case when coalesce(cst_pis, '#39#39') = '#39#39' then '#39'01'#39' else c' +
          'st_pis end cst_pis, nat_rec,'
        
          '      aliq_pis_diferenciada, aliq_cofins_diferenciada from produ' +
          'tos'
        
          '      where grupo_prod = :agrupo_prod and cod_prod = :acod_prod ' +
          'and cod_empresa = :codigo_empresa'
        '      into :acst, :anat_rec, :apis_prod, :acofins_prod;'
        ''
        
          '    update nfce_item set pis_cst = :acst, cofins_cst = :acst, na' +
          't_rec = :anat_rec, '
        '      pis_reset = coalesce(pis_reset, 0) + 1,'
        '      pis_ppis = case when :acst = '#39'01'#39' then :apis_emp'
        '                      when :acst in ('#39'02'#39', '#39'05'#39') then :apis_prod'
        '                      else 0'
        '                 end, '
        '      pis_valiqprod = case when :acst = '#39'03'#39' then :apis_prod'
        '                           else 0'
        '                      end,'
        '      cofins_pcofins = case when :acst = '#39'01'#39' then :acofins_emp'
        
          '                            when :acst in ('#39'02'#39', '#39'05'#39') then :aco' +
          'fins_prod'
        '                            else 0'
        '                       end,'
        
          '      cofins_valiqprod = case when :acst = '#39'03'#39' then :acofins_pr' +
          'od'
        '                              else 0'
        '                         end'
        
          '      where cod_nfce = :codigo_nfce and cod_empresa = :codigo_em' +
          'presa and seqid = :aseqid;'
        '  end'
        ''
        
          '  select sum(ni.pis_vpis), sum(ni.cofins_vcofins) from nfce_item' +
          ' ni'
        
          '    where ni.cod_nfce = :codigo_nfce and ni.cod_empresa = :codig' +
          'o_empresa'
        '    into :vpis, vcofins;'
        ''
        
          '  update nfce set vpis = coalesce(:vpis, 0), vcofins = coalesce(' +
          ':vcofins, 0)'
        
          '    where cod_nfce = :codigo_nfce and cod_empresa = :codigo_empr' +
          'esa;'
        ''
        '  sucesso = 1;'
        '  suspend;'
        'end'
        '|/BLOCO|'
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
        
          '  if (((inserting) or ( updating)) and (new.cfop in (5401, 5403)' +
          ')) then'
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
        
          '      --((old.vfrete <> new.vfrete) and (new.frete_na_base = '#39'S'#39 +
          ')) or'
        '      (old.vfrete <> new.vfrete) or'
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
        '      if ((old.pis_reset <> new.pis_reset) or'
        '        (old.pis_cst <> new.pis_cst) or'
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
        '  --if (new.frete_na_base = '#39'S'#39') then'
        '  --  valor_tmp = new.vfrete;'
        '  --else'
        '  --   valor_tmp = 0;'
        
          '  --valor_tmp = valor_tmp + new.vprod + new.vseg + new.voutro - ' +
          'new.vdesc;'
        ''
        '  valor_tmp = coalesce(new.vprod, 0) +'
        '              coalesce(new.vseg, 0) +'
        '              coalesce(new.voutro, 0) +'
        
          '              iif(coalesce(new.frete_na_base, '#39'S'#39') = '#39'S'#39', coales' +
          'ce(new.vfrete, 0), 0) -'
        '              coalesce(new.vdesc, 0);'
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
        '  valor_tmp = coalesce(new.vprod, 0) +'
        '              coalesce(new.vseg, 0) +'
        '              coalesce(new.voutro, 0) +'
        '              coalesce(new.vfrete, 0) -'
        '              coalesce(new.vdesc, 0);'
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
        
          '      if (new.pis_cst <> '#39'05'#39') then --Quando cst 05, no sped tem' +
          ' de permanecer a aliquota, porem base e valor zero'
        '        new.pis_ppis = 0;'
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
        '      if (new.cofins_cst <> '#39'05'#39') then'
        '        new.cofins_pcofins = 0;'
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
        ''
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
        'end'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CAR105'#39', :COD_EMPRESA, '#39'PE' +
          'RMISSAO INFORMAR NSU, NUM AUT E PARCELAS EXIST'#39', 1, '#39'FRMCADCONTA' +
          'SARECEBER'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        ''
        'ALTER TABLE CONTROLES ADD CONTROLE_VISIVEL CHAR(1);'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG123'#39', :COD_EMPRESA, '#39'AB' +
          'RE FORM DEFINIR CONTROLES POR EMPRESA'#39', 5, '#39'S'#39', '#39'FRMCADCONTROLES' +
          #39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG124'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR CONTROLE POR EMPRESA'#39', 5, '#39'N'#39', '#39'FRMCADCONTROLES'#39', 1, '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG125'#39', :COD_EMPRESA, '#39'DE' +
          'SABILITAR CONTROLE POR EMPRESA'#39', 5, '#39'N'#39', '#39'FRMCADCONTROLES'#39', 1, '#39 +
          'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW BAIXAS_VAN('
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
          'dor,'
        
          'ppc.nped_conf nped_dest, ppc.tipo_conf tipo_dest, ppc.nitem_conf' +
          ' nitem_dest,'
        
          'ppc.quant as quant_dest, ppc.tipv tipv_dest, ppc.codigo ordem_de' +
          'st,'
        
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
        'left join pedvenda_prod_conf ppc on'
        '  ppc.nped = pp.nped'
        '  and ppc.tipo = pp.tipo'
        '  and ppc.grupo_prod = pp.grupo_prod'
        '  and ppc.cod_prod = pp.cod_prod'
        '  and ppc.cod_grade = pp.cod_grade'
        '  and ((pp.nitem = ppc.nitem_conf) or (ppc.nitem_conf > 0))'
        '  and ppc.cod_empresa = pp.cod_empresa'
        
          'left join tipo_vendas tv2 on ppc.tipo_conf = tv2.tipo and ppc.ti' +
          'pv = tv2.sigla'
        
          'left join pedvenda pv2 on pv2.nped = ppc.nped_conf and pv2.tipo ' +
          '= ppc.tipo_conf and pv2.cod_empresa = ppc.cod_empresa'
        
          'left join pedvenda_prod pp2 on pp2.nped = ppc.nped and pp2.tipo ' +
          '= ppc.tipo and pp2.cod_empresa = ppc.cod_empresa and pp2.nitem =' +
          ' ppc.nitem'
        
          'left join clientes cl2 on cl2.cod_cliente = pv2.cod_cliente and ' +
          'cl2.cod_empresa = pv2.cod_empresa'
        ';'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI262'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR DADOS CONTRATOS EM LOTE'#39', 5, '#39'FRMCADCLIENTES'#39', 1, '#39'N'#39', '#39'S'#39 +
          ', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI263'#39', :COD_EMPRESA, '#39'SA' +
          'LVAR DADOS CONTRATOS EM LOTE'#39', 5, '#39'FRMCADCLIENTES'#39', 1, '#39'S'#39', '#39'S'#39',' +
          ' CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXL086'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TAXA RECEBIMENTO ECOMMERCE'#39', 3, '#39'N'#39', '#39'.'#39', 1, '#39'N'#39', CURRENT_DA' +
          'TE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG126'#39', :COD_EMPRESA, '#39'AB' +
          'RE FORM TAXA RECEBIMENTO ECOMMERCE'#39', 5, '#39'S'#39', '#39'FRMCADCONTROLES'#39', ' +
          '1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG127'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVA TAXA RECEBIMENTO ECOMMERCE'#39', 5, '#39'N'#39', '#39'FRMCADCONTROLES'#39', 1,' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG128'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR TAXA RECEBIMENTO ECOMMERCE'#39', 5, '#39'N'#39', '#39'FRMCADCONTROLES'#39',' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG129'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR TAXA RECEBIMENTO ECOMMERCE'#39', 5, '#39'N'#39', '#39'FRMCADCONTROLES'#39',' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG130'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR TAXA RECEBIMENTO ECOMMERCE'#39', 5, '#39'N'#39', '#39'FRMCADCONTROLES'#39', ' +
          '1, '#39'S'#39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS5('
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    TP_RECEBIMENTO,'
        '    TP_RECEBIMENTO2,'
        '    ORDEM,'
        '    TIPO,'
        '    NUM_DOC,'
        '    NUM_DOC2,'
        '    DATA_DOC,'
        '    DATA_CONF,'
        '    VALOR_A_RECEBER,'
        '    VALOR_A_RECEBER_CORR,'
        '    OBS_CXL,'
        '    LOTEREC,'
        '    DIA_CXL,'
        '    OP_CXL,'
        '    NOME_OP_CXL,'
        '    COD_US,'
        '    DATA_MOV,'
        '    HISTORICO,'
        '    VALOR_PAGO,'
        '    DATA_VENC,'
        '    TERCEIROS,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    NUM_RECIBO,'
        '    VALOR_RECIBO,'
        '    NCUPOM,'
        '    NUM_NF,'
        '    PARCELA,'
        '    SEQID,'
        '    SEQID2,'
        '    VENDA,'
        '    TIPV,'
        '    TIPO_DOC,'
        '    ID_COMMERCE,'
        '    QTDE_PREST)'
        'AS'
        
          '-- VIEW EXIBE OS RECEBIMENTOS DETALHADOS DO CAIXA AUXILIAR POR O' +
          'PERADOR E DATA DO CAIXA'
        '-- RELATORIO "RECEBIMENTOS CAIXA AUXILIAR"'
        '    '
        '    --- REQ, OS'
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rq.cod_empresa end) cod_empresa,'
        
          '    rq.cod_empresa, coalesce(rq.cod_cliente, 0) cod_cliente, cl.' +
          'nome_cliente,'
        
          '    case when (rq.id_commerce > 0) then '#39'ECOMMERCE'#39' else case wh' +
          'en (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVICOS'#39' end end tp_re' +
          'cebimento,'
        '    '#39'DIRETO'#39' tp_recebimento2,'
        
          '    case when (rq.id_commerce > 0) then 7 else case when (rq.tip' +
          'o = '#39'REQ'#39') then 2 else 3 end end ordem,'
        '    rq.tipo, coalesce(rq.nped, 0) as Num_doc,'
        
          '    coalesce(fp.ndoc, coalesce(rq.nped, 0)) as Num_doc2, rq.data' +
          '_ped as data_doc,'
        
          '    rq.data_fech as data_Conf, coalesce(rq.valor_total, 0) as va' +
          'lor_total, coalesce(rq.valor_total, 0) as valor_total, rq.obs_cx' +
          'l_rq, rq.nped as loterec,'
        
          '    rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', rq.cod_vendedor,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0) valordoc' +
          ', fp.data_venc, fp.terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    case when (rec.num_rec_dep <> '#39#39') then rec.num_rec_dep else ' +
          'coalesce(fp.rec_numvend,0) end as num_recibo, 0 as valor_recibo,'
        
          '    coalesce(rq.ncupom, 0) ncupom, coalesce(rq.num_nf, 0) num_nf' +
          ','
        
          '    case when (fp.nrequisicao > 0) then coalesce(fp.nparcela, 0)' +
          ' else 0 end nparcela,'
        
          '    coalesce(fp.seqform, rq.nped), coalesce(fp.seqform, rq.nped)' +
          ', coalesce(tp.venda, '#39'S'#39') venda,'
        
          '    case when(rq.tipo = '#39'REQ'#39') then tp.sigla else tp.tipo_os end' +
          ' tipv, rq.tipo as tipo_doc,'
        '    coalesce(rq.id_commerce, 0) id_commerce,'
        '    1 qtde_prest'
        ''
        '    from pedvenda rq'
        '    inner join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = rq.op_cxl a' +
          'nd col.cod_empresa = rq.cod_empresa'
        
          '    left join tipo_vendas tp on tp.tipo = rq.tipo and (tp.sigla ' +
          '= rq.tipv or (tp.tipo_os = rq.tipo_os))'
        
          '    left join clientes cl on cl.cod_cliente = rq.cod_cliente and' +
          ' cl.cod_empresa = rq.cod_empresa'
        
          '    left join formpagamento fp on fp.nrequisicao = rq.nped and f' +
          'p.tpdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa and fp.re' +
          'cibo is null'
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.t' +
          'ipo in ('#39'REQ'#39', '#39'OS'#39')'
        
          '    /*where coalesce((select count(*) from formpagamento frc whe' +
          're frc.nrequisicao = rq.nped and'
        
          '        frc.tpdocs = rq.tipo and frc.cod_empresa = rq.cod_empres' +
          'a and (not frc.recibo is null)),0) <= 0*/'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rq.cod_empresa end) cod_empresa,'
        
          '    rq.cod_empresa, coalesce(rq.cod_cliente, 0) cod_cliente, cl.' +
          'nome_cliente,'
        
          '    case when (rq.id_commerce > 0) then '#39'ECOMMERCE'#39' else case wh' +
          'en (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVICOS'#39' end end tp_re' +
          'cebimento,'
        '    '#39'RECIBO'#39' tp_recebimento2,'
        
          '    case when (rq.id_commerce > 0) then 7 else case when (rq.tip' +
          'o = '#39'REQ'#39') then 2 else 3 end end ordem,'
        '    rq.tipo, coalesce(rq.nped, 0) as Num_doc,'
        
          '    coalesce(fp.ndoc, coalesce(rq.nped, 0)) as Num_doc2, rq.data' +
          '_ped as data_doc,'
        
          '    rq.data_fech as data_Conf, coalesce(rq.valor_total, 0) as va' +
          'lor_total, coalesce(rq.valor_total, 0) as valor_total, rq.obs_cx' +
          'l_rq, rq.nped as loterec,'
        
          '    rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', rq.cod_vendedor,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0) valordoc' +
          ', fp.data_venc, fp.terceiros,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc' +
          ') is null then'
        '        0'
        '    else (select first 1 ctrl.codigo_ctrl from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa' +
          ' = fp.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc' +
          ' asc)'
        '    end as codigo_ctrl,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc' +
          ') is null then'
        '        '#39'SEM FORMA'#39
        '    else (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa' +
          ' = fp.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc' +
          ' asc)'
        '    end as nome_ctrl,'
        
          '    case when (rec.num_rec_dep <> '#39#39') then rec.num_rec_dep else ' +
          'coalesce(fp.rec_numvend,0) end num_recibo,'
        
          '    coalesce((select sum(rc.valor_orig) from recibos rc where rc' +
          '.nrecibo = fp.rec_numvend and rc.cod_empresa = fp.cod_empresa), ' +
          '0) as valor_recibo,'
        
          '    coalesce(rq.ncupom, 0) ncupom, coalesce(rq.num_nf, 0) num_nf' +
          ','
        
          '    case when (fp.nrequisicao > 0) then coalesce(fp.nparcela, 0)' +
          ' else 0 end nparcela,'
        
          '    coalesce(fp.seqform, rq.nped), coalesce(fp.seqform, rq.nped)' +
          ', coalesce(tp.venda, '#39'S'#39') venda,'
        
          '    case when(rq.tipo = '#39'REQ'#39') then tp.sigla else tp.tipo_os end' +
          ' tipv, rq.tipo as tipo_doc,'
        '    coalesce(rq.id_commerce, 0) id_commerce,'
        '    1 qtde_prest'
        ''
        '    from pedvenda rq'
        '    inner join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = rq.op_cxl a' +
          'nd col.cod_empresa = rq.cod_empresa'
        
          '    left join tipo_vendas tp on tp.tipo = rq.tipo and (tp.sigla ' +
          '= rq.tipv or (tp.tipo_os = rq.tipo_os))'
        
          '    left join clientes cl on cl.cod_cliente = rq.cod_cliente and' +
          ' cl.cod_empresa = rq.cod_empresa'
        
          '    inner join formpagamento fp on fp.nrequisicao = rq.nped and ' +
          'fp.tpdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa and (not' +
          ' fp.recibo is null)'
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        
          '    where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.t' +
          'ipo in ('#39'REQ'#39', '#39'OS'#39')'
        ''
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rq.cod_empresa end) cod_empresa,'
        
          '    rq.cod_empresa, coalesce(rq.cod_cliente, 0) cod_cliente, cl.' +
          'nome_cliente,'
        
          '    case when (rq.id_commerce > 0) then '#39'ECOMMERCE'#39' else case wh' +
          'en (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVICOS'#39' end end tp_re' +
          'cebimento,'
        '    '#39'TROCO'#39' tp_recebimento2,'
        
          '    case when (rq.id_commerce > 0) then 7 else case when (rq.tip' +
          'o = '#39'REQ'#39') then 2 else 3 end end ordem,'
        '    rq.tipo, coalesce(rq.nped, 0) as Num_doc,'
        
          '    coalesce(fp.ndoc, coalesce(rq.nped, 0)) as Num_doc2, rq.data' +
          '_ped as data_doc,'
        
          '    rq.data_fech as data_Conf, coalesce(rq.valor_total, 0) as va' +
          'lor_total, coalesce(rq.valor_total, 0) as valor_total, rq.obs_cx' +
          'l_rq, rq.nped as loterec,'
        
          '    rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', rq.cod_vendedor,'
        '    fp.data_mov, fp.historico,'
        
          '    coalesce(fp.valordoc, 0) valordoc, fp.data_venc, fp.terceiro' +
          's,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    case when (rec.num_rec_dep <> '#39#39') then rec.num_rec_dep else ' +
          'coalesce(fp.rec_numvend,0) end num_recibo, 0 as valor_recibo,'
        
          '    coalesce(rq.ncupom, 0) ncupom, coalesce(rq.num_nf, 0) num_nf' +
          ','
        
          '    case when (fp.nrequisicao > 0) then coalesce(fp.nparcela, 0)' +
          ' else 0 end nparcela,'
        
          '    coalesce(fp.seqform, rq.nped), coalesce(fp.seqform, rq.nped)' +
          ',  coalesce(tp.venda, '#39'S'#39') venda,'
        
          '    case when(rq.tipo = '#39'REQ'#39') then tp.sigla else tp.tipo_os end' +
          ' tipv, rq.tipo as tipo_doc,'
        '    coalesce(rq.id_commerce, 0) id_commerce,'
        '    1 qtde_prest'
        ''
        '    from pedvenda rq'
        '    inner join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = rq.op_cxl a' +
          'nd col.cod_empresa = rq.cod_empresa'
        
          '    left join tipo_vendas tp on tp.tipo = rq.tipo and (tp.sigla ' +
          '= rq.tipv or (tp.tipo_os = rq.tipo_os))'
        
          '    left join clientes cl on cl.cod_cliente = rq.cod_cliente and' +
          ' cl.cod_empresa = rq.cod_empresa'
        
          '    inner join formpagamento fp on fp.rec_numvend = rq.nped and ' +
          'fp.rec_tipvend = rq.tipo and fp.cod_empresa = rq.cod_empresa and' +
          ' fp.tpdocs = '#39'TRC'#39
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.t' +
          'ipo in ('#39'REQ'#39', '#39'OS'#39')'
        ''
        '    union'
        '    '
        '    --- CF'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else mt.cod_empresa end) cod_empresa,'
        
          '    mt.cod_empresa, coalesce(mt.clientes_v, 0) clientes_v, cl.no' +
          'me_cliente,'
        '    '#39'VEICULOS'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebimento2,'
        
          '    1 ordem, '#39'MOT'#39' as tipo, coalesce(mt.n_comando, 0) as Num_doc' +
          ','
        
          '    coalesce(fp.ndoc, coalesce(mt.n_comando, 0)) as Num_doc2, mt' +
          '.data_ven as Data_Doc,'
        
          '    mt.data_fech as Data_Conf, coalesce(mt.valor_a_rec, 0) as va' +
          'lor_total, coalesce(mt.valor_a_rec, 0) as valor_total, '#39' '#39' as ob' +
          's_cxl_rq, mt.n_comando as loterec,'
        
          '    mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', mt.covend_v,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0), fp.data' +
          '_venc, fp.terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    case when (rec.num_rec_dep <> '#39#39') then rec.num_rec_dep else ' +
          'coalesce(fp.rec_numvend,0) end num_recibo, 0 as valor_recibo,'
        '    0 ncupom, coalesce(mt.num_nota_v, 0) num_nf,'
        
          '    case when (fp.nrequisicao > 0) then coalesce(fp.nparcela, 0)' +
          ' else 0 end nparcela,'
        
          '    coalesce(fp.seqform, mt.n_comando), coalesce(fp.seqform, mt.' +
          'n_comando), coalesce(tp.venda, '#39'S'#39') venda,'
        
          '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 0 id_commerce, 1 qtde_prest f' +
          'rom com_fat mt'
        '    inner join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = mt.op_cxl a' +
          'nd col.cod_empresa = mt.cod_empresa'
        
          '    left join tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os =' +
          ' mt.tipo_v'
        
          '    left join clientes cl on cl.cod_cliente = mt.clientes_v and ' +
          'cl.cod_empresa = mt.cod_empresa'
        
          '    left join formpagamento fp on fp.nrequisicao = mt.n_comando ' +
          'and fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa and fp' +
          '.recibo is null'
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl'
        
          '    where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.n' +
          'atureza = '#39'S'#39
        
          '    /* where coalesce((select count(*) from formpagamento frc wh' +
          'ere frc.nrequisicao = mt.n_comando and'
        
          '        frc.tpdocs = '#39'MOT'#39' and frc.cod_empresa = mt.cod_empresa ' +
          'and (not frc.recibo is null)),0) <= 0*/'
        '    -- where mt.data_fech >= '#39'25.11.2016'#39' and mt.cod_empresa = 1'
        '    '
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else mt.cod_empresa end) cod_empresa,'
        
          '    mt.cod_empresa, coalesce(mt.clientes_v, 0) clientes_v, cl.no' +
          'me_cliente,'
        '    '#39'VEICULOS'#39' tp_recebimento, '#39'RECIBO'#39' tp_recebimento2,'
        
          '    1 ordem, '#39'MOT'#39' as tipo, coalesce(mt.n_comando, 0) as Num_doc' +
          ','
        
          '    coalesce(fp.ndoc, coalesce(mt.n_comando, 0)) as Num_doc2, mt' +
          '.data_ven as Data_Doc,'
        
          '    mt.data_fech as Data_Conf, coalesce(mt.valor_a_rec, 0) as va' +
          'lor_total,  coalesce(mt.valor_a_rec, 0) as valor_total, '#39' '#39' as o' +
          'bs_cxl_rq, mt.n_comando as loterec,'
        
          '    mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', mt.covend_v,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0), fp.data' +
          '_venc, fp.terceiros,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc as' +
          'c) is null then'
        '        0'
        '    else (select first 1 ctrl.codigo_ctrl from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa' +
          ' = fp.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordo' +
          'c asc)'
        '    end as codigo_ctrl,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc as' +
          'c) is null then'
        '        '#39'SEM FORMA'#39
        '    else (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa' +
          ' = fp.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordo' +
          'c asc)'
        '    end as nome_ctrl,'
        
          '    case when (rec.num_rec_dep <> '#39#39') then rec.num_rec_dep else ' +
          'coalesce(fp.rec_numvend,0) end num_recibo,'
        
          '    coalesce((select sum(rc.valor_orig) from recibos rc where rc' +
          '.nrecibo = fp.rec_numvend and rc.cod_empresa = fp.cod_empresa), ' +
          '0) as valor_recibo,'
        '    0 ncupom, coalesce(mt.num_nota_v, 0) num_nf,'
        
          '    case when (fp.nrequisicao > 0) then coalesce(fp.nparcela, 0)' +
          ' else 0 end nparcela,'
        
          '    coalesce(fp.seqform, mt.n_comando), coalesce(fp.seqform, mt.' +
          'n_comando),  coalesce(tp.venda, '#39'S'#39') venda,'
        
          '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 0 id_commerce, 1 qtde_prest f' +
          'rom com_fat mt'
        '    inner join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = mt.op_cxl a' +
          'nd col.cod_empresa = mt.cod_empresa'
        
          '    left join tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os =' +
          ' mt.tipo_v'
        
          '    left join clientes cl on cl.cod_cliente = mt.clientes_v and ' +
          'cl.cod_empresa = mt.cod_empresa'
        
          '    inner join formpagamento fp on fp.nrequisicao = mt.n_comando' +
          ' and fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa and (' +
          'not fp.recibo is null)'
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.n' +
          'atureza = '#39'S'#39
        ''
        '    union'
        '    '
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else mt.cod_empresa end) cod_empresa,'
        
          '    mt.cod_empresa, coalesce(mt.clientes_v, 0) clientes_v, cl.no' +
          'me_cliente,'
        '    '#39'VEICULOS'#39' tp_recebimento, '#39'TROCO'#39' tp_recebimento2,'
        
          '    1 ordem, '#39'MOT'#39' as tipo, coalesce(mt.n_comando, 0) as Num_doc' +
          ','
        
          '    coalesce(fp.ndoc, coalesce(mt.n_comando, 0)) as Num_doc2, mt' +
          '.data_ven as Data_Doc,'
        
          '    mt.data_fech as Data_Conf, coalesce(mt.valor_a_rec, 0) as va' +
          'lor_total,  coalesce(mt.valor_a_rec, 0) as valor_total, '#39' '#39' as o' +
          'bs_cxl_rq, mt.n_comando as loterec,'
        
          '    mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', mt.covend_v,'
        
          '    fp.data_mov, fp.historico, coalesce(fp.valordoc, 0), fp.data' +
          '_venc, fp.terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    case when (rec.num_rec_dep <> '#39#39') then rec.num_rec_dep else ' +
          'coalesce(fp.rec_numvend,0) end num_recibo, 0 as valor_recibo,'
        '    0 ncupom, coalesce(mt.num_nota_v, 0) num_nf,'
        
          '    case when (fp.nrequisicao > 0) then coalesce(fp.nparcela, 0)' +
          ' else 0 end nparcela,'
        
          '    coalesce(fp.seqform, mt.n_comando), coalesce(fp.seqform, mt.' +
          'n_comando),  coalesce(tp.venda, '#39'S'#39') venda,'
        
          '    tp.tipo_os, '#39'MOT'#39' as tipo_doc, 0 id_commerce, 1 qtde_prest f' +
          'rom com_fat mt'
        '    inner join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = mt.op_cxl a' +
          'nd col.cod_empresa = mt.cod_empresa'
        
          '    left join tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os =' +
          ' mt.tipo_v'
        
          '    left join clientes cl on cl.cod_cliente = mt.clientes_v and ' +
          'cl.cod_empresa = mt.cod_empresa'
        
          '    inner join formpagamento fp on fp.rec_numvend = mt.n_comando' +
          ' and fp.rec_tipvend = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa ' +
          'and fp.tpdocs = '#39'TRC'#39
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.n' +
          'atureza = '#39'S'#39
        ''
        '    union'
        ''
        '    --RECIBO'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rec.cod_empresa end) cod_empresa,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then coalesce(rec' +
          '.cod_emp_mult, rec.cod_empresa) else rec.cod_empresa end) cod_em' +
          'p_mult,'
        
          '    coalesce(rec.cod_devedor, 0) cod_cliente, rec.nome_dev nome_' +
          'cliente,'
        
          '    '#39'RECIBO ANTECIPADO'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebimento2' +
          ', 4 ordem,'
        '    '#39'RECIBO'#39' tipo, coalesce(rec.nrecibo, 0) Num_doc,'
        
          '    coalesce(fp.ndoc, coalesce(rec.nrecibo, 0)) as Num_doc2, rec' +
          '.data_rec as Data_Doc,'
        '    rec.data_rec as Data_Conf,'
        
          '    coalesce(rec.valor_orig, 0) as valor_total, coalesce(rec.val' +
          'or_orig, 0) as valor_total,'
        
          '    rec.obs_cxl_rq as obs_cxl_rq, coalesce(rec.nrecibo, 0) as lo' +
          'terec,'
        
          '    rec.dia_cxl, coalesce(rec.op_cxl, 0) op_cxl, col.nome_vended' +
          'or, rec.cod_us, fp.data_mov, fp.historico,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago,'
        '    fp.data_mov, '#39' '#39' terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        '    0 ncupom, 0 num_nf,'
        
          '    0 as nparcela, rec.nrecibo, coalesce(fp.seqform, rec.nrecibo' +
          '),'
        
          '    '#39'N'#39' venda, '#39#39' tipv, '#39'REC'#39' as tipo_doc, 0 id_commerce, 1 qtde' +
          '_prest'
        '    from recibos rec'
        '    inner join empresa emp on rec.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = rec.op_cxl ' +
          'and col.cod_empresa = rec.cod_empresa'
        
          '    left join formpagamento fp on fp.nrequisicao = rec.nrecibo a' +
          'nd fp.cod_empresa = rec.cod_empresa and fp.tpdocs = '#39'REC'#39' and fp' +
          '.recibo is null'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else rec.cod_empresa end) cod_empresa,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then coalesce(rec' +
          '.cod_emp_mult, rec.cod_empresa) else rec.cod_empresa end) cod_em' +
          'p_mult,'
        
          '    coalesce(rec.cod_devedor, 0) cod_cliente, rec.nome_dev nome_' +
          'cliente,'
        
          '    '#39'RECIBO ANTECIPADO'#39' tp_recebimento, '#39'TROCO'#39' tp_recebimento2,' +
          ' 4 ordem,'
        '    '#39'RECIBO'#39' tipo, coalesce(rec.nrecibo, 0) Num_doc,'
        
          '    coalesce(fp.ndoc, coalesce(rec.nrecibo, 0)) as Num_doc2, rec' +
          '.data_rec as Data_Doc,'
        '    rec.data_rec as Data_Conf,'
        
          '    coalesce(rec.valor_orig, 0) as valor_total, coalesce(rec.val' +
          'or_orig, 0) as valor_total,'
        
          '    rec.obs_cxl_rq as obs_cxl_rq, coalesce(rec.nrecibo, 0) as lo' +
          'terec,'
        
          '    rec.dia_cxl, coalesce(rec.op_cxl, 0) op_cxl, col.nome_vended' +
          'or, rec.cod_us, fp.data_mov, fp.historico,'
        
          '    coalesce(fp.valordoc, 0) valor_pago, fp.data_mov, '#39' '#39' tercei' +
          'ros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        '    0 ncupom, 0 num_nf,'
        
          '    0 as nparcela, rec.nrecibo, coalesce(fp.seqform, rec.nrecibo' +
          '),'
        
          '    '#39'N'#39' venda, '#39#39' tipv, '#39'REC'#39' as tipo_doc, 0 id_commerce, 1 qtde' +
          '_prest'
        '    from recibos rec'
        '    inner join empresa emp on rec.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = rec.op_cxl ' +
          'and col.cod_empresa = rec.cod_empresa'
        
          '    inner join formpagamento fp on fp.rec_numvend = rec.nrecibo ' +
          'and fp.cod_empresa = rec.cod_empresa and fp.rec_tipvend = '#39'REC'#39' ' +
          'and fp.tpdocs = '#39'TRC'#39
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        '    '
        '    union'
        ''
        '    -- PRESTACOES'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        
          '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente,  c' +
          'ase when (cl.nome_cliente is null) then pr.nome_c else cl.nome_c' +
          'liente end nome_cliente,'
        '    '#39'PRESTACOES'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebimento2,'
        
          '    5 ordem,  case when (ctr1.nome_ctrl is null) then pr.tipo_do' +
          'c_c else ctr1.nome_ctrl end tipo,  coalesce(pr.n_doc_c, 0) Num_d' +
          'oc,'
        
          '    coalesce(fp.ndoc, coalesce(pr.n_doc_c, 0)) as Num_doc2, pr.d' +
          'ata_venc_c as Data_Doc,'
        '    pr.datq_c as Data_Conf,'
        '    coalesce(pr.valor_c, 0) as valor_total,'
        
          '    case when coalesce(pr.valor_corr, 0) > 0 then coalesce(pr.va' +
          'lor_corr, 0) else pr.valor_c end as valor_total,'
        
          '    '#39' '#39' as obs_cxl_rq, coalesce(pr.lote_quit, pr.seq_bxcred) as ' +
          'loterec,'
        
          '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', pr.codigo_vend, fp.data_mov, fp.historico,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago, fp.data_mov, '#39 +
          ' '#39' terceiros,'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then 0'
        '    else'
        '        (select coalesce(pd.ncupom, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) ncupom,'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        '        (select coalesce(cf.num_nota_v, 0) from com_fat cf'
        
          '        where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.' +
          'codigo_emp)'
        '    else'
        '        (select coalesce(pd.num_nf, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) num_nf,'
        ''
        ''
        
          '    case when(cc.cod_cred > 0) then coalesce(cc.nparcela, 0) els' +
          'e 0 end nparcela, pr.seq_bxcred, coalesce(fp.seqform, pr.seq_bxc' +
          'red),'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select coalesce(tp.venda, '#39'S'#39') venda from com_fat cf left j' +
          'oin tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        
          '    else (select coalesce(tp.venda, '#39'S'#39') venda from pedvenda pd ' +
          'left join tipo_vendas tp on tp.tipo = pd.tipo and (tp.sigla = pd' +
          '.tipv or (tp.tipo_os = pd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end), '#39'S'#39') venda,'
        ''
        '    case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select tp.tipo_os from com_fat cf left join tipo_vendas tp ' +
          'on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        '    when(trim(pr.tp_doc_v) = '#39'OS'#39') then'
        
          '    (select tp.tipo_os from pedvenda pd left join tipo_vendas tp' +
          ' on tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = p' +
          'd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    else'
        
          '    (select tp.sigla from pedvenda pd left join tipo_vendas tp o' +
          'n tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = pd.' +
          'tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end tipv,'
        '    pr.tp_doc_v as tipo_doc, 0 id_commerce,'
        
          '    coalesce((case when ((select count(*) from baixa_creditos bc' +
          ' where bc.lote_quit = pr.lote_quit and bc.cod_emp_mult = pr.cod_' +
          'emp_mult) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from baixa_creditos bc where bc.lote_qu' +
          'it = pr.lote_quit and bc.cod_emp_mult = pr.cod_emp_mult)'
        '    end), 1) qtde_prest'
        ''
        '    from baixa_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.cod_emp_mult = pr.cod_emp_mult'
        
          '    left join formpagamento fp on fp.nrequisicao = pr.lote_cxl a' +
          'nd fp.cod_empresa = pr.cod_emp_mult and fp.tpdocs = '#39'PRE'#39' and fp' +
          '.recibo is null'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.datq_c is not null'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        
          '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente,  c' +
          'ase when (cl.nome_cliente is null) then pr.nome_c else cl.nome_c' +
          'liente end nome_cliente,'
        '    '#39'PRESTACOES'#39' tp_recebimento, '#39'RECIBO'#39' tp_recebimento2,'
        
          '    5 ordem,  case when (ctr1.nome_ctrl is null) then pr.tipo_do' +
          'c_c else ctr1.nome_ctrl end tipo, coalesce(pr.n_doc_c, 0) Num_do' +
          'c,'
        
          '    coalesce(fp.ndoc, coalesce(pr.n_doc_c, 0)) as Num_doc2, pr.d' +
          'ata_venc_c as Data_Doc,'
        '    pr.datq_c as Data_Conf,'
        '    coalesce(pr.valor_c, 0) as valor_total,'
        
          '    case when coalesce(pr.valor_corr, 0) > 0 then coalesce(pr.va' +
          'lor_corr, 0) else pr.valor_c end as valor_total,'
        
          '    '#39' '#39' as obs_cxl_rq, coalesce(pr.lote_quit, pr.seq_bxcred) as ' +
          'loterec,'
        
          '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', pr.codigo_vend, fp.data_mov, fp.historico,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago, fp.data_mov, '#39 +
          ' '#39' terceiros,'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then 0'
        '    else'
        '        (select coalesce(pd.ncupom, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) ncupom,'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        '        (select coalesce(cf.num_nota_v, 0) from com_fat cf'
        
          '        where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.' +
          'codigo_emp)'
        '    else'
        '        (select coalesce(pd.num_nf, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) num_nf,'
        ''
        ''
        
          '    case when(cc.cod_cred > 0) then coalesce(cc.nparcela, 0) els' +
          'e 0 end nparcela, pr.seq_bxcred, coalesce(fp.seqform, pr.seq_bxc' +
          'red),'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select coalesce(tp.venda, '#39'S'#39') venda from com_fat cf left j' +
          'oin tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        
          '    else (select coalesce(tp.venda, '#39'S'#39') venda from pedvenda pd ' +
          'left join tipo_vendas tp on tp.tipo = pd.tipo and (tp.sigla = pd' +
          '.tipv or (tp.tipo_os = pd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end), '#39'S'#39') venda,'
        ''
        '    case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select tp.tipo_os from com_fat cf left join tipo_vendas tp ' +
          'on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        '    when(trim(pr.tp_doc_v) = '#39'OS'#39') then'
        
          '    (select tp.tipo_os from pedvenda pd left join tipo_vendas tp' +
          ' on tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = p' +
          'd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    else'
        
          '    (select tp.sigla from pedvenda pd left join tipo_vendas tp o' +
          'n tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = pd.' +
          'tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end tipv,'
        '    pr.tp_doc_v as tipo_doc, 0 id_commerce,'
        
          '    coalesce((case when ((select count(*) from baixa_creditos bc' +
          ' where bc.lote_quit = pr.lote_quit and bc.cod_emp_mult = pr.cod_' +
          'emp_mult) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from baixa_creditos bc where bc.lote_qu' +
          'it = pr.lote_quit and bc.cod_emp_mult = pr.cod_emp_mult)'
        '    end), 1) qtde_prest'
        ''
        '    from baixa_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.cod_emp_mult = pr.cod_emp_mult'
        
          '    inner join formpagamento fp on fp.nrequisicao = pr.lote_cxl ' +
          'and fp.cod_empresa = pr.cod_emp_mult and fp.tpdocs = '#39'PRE'#39' and (' +
          'not fp.recibo is null)'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.datq_c is not null'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        
          '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente, ca' +
          'se when (cl.nome_cliente is null) then pr.nome_c else cl.nome_cl' +
          'iente end nome_cliente,'
        '    '#39'PRESTACOES'#39' tp_recebimento, '#39'TROCO'#39' tp_recebimento2,'
        
          '    5 ordem,  case when (ctr1.nome_ctrl is null) then pr.tipo_do' +
          'c_c else ctr1.nome_ctrl end tipo,  coalesce(pr.n_doc_c, 0) Num_d' +
          'oc,'
        
          '    coalesce(fp.ndoc, coalesce(pr.n_doc_c, 0)) as Num_doc2, pr.d' +
          'ata_venc_c as Data_Doc,'
        '    pr.datq_c as Data_Conf,'
        '    coalesce(pr.valor_c, 0) as valor_total,'
        
          '    case when coalesce(pr.valor_corr, 0) > 0 then coalesce(pr.va' +
          'lor_corr, 0) else pr.valor_c end as valor_total,'
        
          '    '#39' '#39' as obs_cxl_rq, coalesce(pr.lote_quit, pr.seq_bxcred) as ' +
          'loterec,'
        
          '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', pr.codigo_vend, fp.data_mov, fp.historico,'
        
          '    coalesce(fp.valordoc, 0) valor_pago, fp.data_mov, '#39' '#39' tercei' +
          'ros,'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then 0'
        '    else'
        '        (select coalesce(pd.ncupom, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) ncupom,'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        '        (select coalesce(cf.num_nota_v, 0) from com_fat cf'
        
          '        where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.' +
          'codigo_emp)'
        '    else'
        '        (select coalesce(pd.num_nf, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) num_nf,'
        ''
        ''
        
          '    case when(cc.cod_cred > 0) then coalesce(cc.nparcela, 0) els' +
          'e 0 end nparcela, pr.seq_bxcred, coalesce(fp.seqform, pr.seq_bxc' +
          'red),'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select coalesce(tp.venda, '#39'S'#39') venda from com_fat cf left j' +
          'oin tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        
          '    else (select coalesce(tp.venda, '#39'S'#39') venda from pedvenda pd ' +
          'left join tipo_vendas tp on tp.tipo = pd.tipo and (tp.sigla = pd' +
          '.tipv or (tp.tipo_os = pd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end), '#39'S'#39') venda,'
        ''
        '    case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select tp.tipo_os from com_fat cf left join tipo_vendas tp ' +
          'on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        '    when(trim(pr.tp_doc_v) = '#39'OS'#39') then'
        
          '    (select tp.tipo_os from pedvenda pd left join tipo_vendas tp' +
          ' on tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = p' +
          'd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    else'
        
          '    (select tp.sigla from pedvenda pd left join tipo_vendas tp o' +
          'n tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = pd.' +
          'tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end tipv,'
        '    pr.tp_doc_v as tipo_doc, 0 id_commerce,'
        
          '    coalesce((case when ((select count(*) from baixa_creditos bc' +
          ' where bc.lote_quit = pr.lote_quit and bc.cod_emp_mult = pr.cod_' +
          'emp_mult) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from baixa_creditos bc where bc.lote_qu' +
          'it = pr.lote_quit and bc.cod_emp_mult = pr.cod_emp_mult)'
        '    end), 1) qtde_prest'
        ''
        '    from baixa_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.cod_emp_mult = pr.cod_emp_mult'
        
          '    inner join formpagamento fp on fp.rec_numvend = pr.lote_cxl ' +
          'and fp.cod_empresa = pr.cod_emp_mult and fp.rec_tipvend = '#39'PRE'#39' ' +
          'and fp.tpdocs = '#39'TRC'#39
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.datq_c is not null'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        
          '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente, ca' +
          'se when (cl.nome_cliente is null) then pr.nome_c else cl.nome_cl' +
          'iente end nome_cliente,'
        '    '#39'PRESTACOES'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebimento2,'
        
          '    5 ordem, case when (ctr1.nome_ctrl is null) then pr.tipo_doc' +
          '_c else ctr1.nome_ctrl end tipo, coalesce(pr.n_doc_c, 0) Num_doc' +
          ','
        
          '    coalesce(fp.ndoc, coalesce(pr.n_doc_c, 0)) as Num_doc2, pr.d' +
          'ata_venc_c as Data_Doc,'
        '    pr.data_rec_c as Data_Conf,'
        '    coalesce(pr.valor_c, 0) as valor_total,'
        
          '    case when coalesce(pr.valor_corr, 0) > 0 then coalesce(pr.va' +
          'lor_corr, 0) else pr.valor_c end as valor_total,'
        
          '    '#39' '#39' as obs_cxl_rq, coalesce(pr.lote_cxl, cod_cred) as lotere' +
          'c,'
        
          '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', pr.codigo_vend, fp.data_mov, fp.historico,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago, fp.data_mov, '#39 +
          ' '#39' terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        '    '
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then 0'
        '    else'
        '        (select coalesce(pd.ncupom, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) ncupom,'
        '    '
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        '        (select coalesce(cf.num_nota_v, 0) from com_fat cf'
        
          '        where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.' +
          'codigo_emp)'
        '    else'
        '        (select coalesce(pd.num_nf, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) num_nf,'
        '    '
        
          '    0 as nparcela, pr.cod_cred, coalesce(fp.seqform, pr.cod_cred' +
          '),'
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select coalesce(tp.venda, '#39'S'#39') venda from com_fat cf left j' +
          'oin tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        
          '    else (select coalesce(tp.venda, '#39'S'#39') venda from pedvenda pd ' +
          'left join tipo_vendas tp on tp.tipo = pd.tipo and (tp.sigla = pd' +
          '.tipv or (tp.tipo_os = pd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end), '#39'S'#39') venda,'
        '    '
        '    case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select tp.tipo_os from com_fat cf left join tipo_vendas tp ' +
          'on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        '    when(trim(pr.tp_doc_v) = '#39'OS'#39') then'
        
          '    (select tp.tipo_os from pedvenda pd left join tipo_vendas tp' +
          ' on tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = p' +
          'd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    else'
        
          '    (select tp.sigla from pedvenda pd left join tipo_vendas tp o' +
          'n tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = pd.' +
          'tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end tipv,'
        '    pr.tp_doc_v as tipo_doc, 0 id_commerce,'
        
          '    coalesce((case when((select count(*) from controle_creditos ' +
          'cc where cc.lote_cxl = pr.lote_cxl and cc.cod_emp_mult = pr.cod_' +
          'emp_mult) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from controle_creditos cc where cc.lote' +
          '_cxl = pr.lote_cxl and cc.cod_emp_mult = pr.cod_emp_mult)'
        '    end), 1) qtde_prest'
        '    from controle_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join formpagamento fp on fp.nrequisicao = pr.lote_cxl a' +
          'nd fp.cod_empresa = pr.cod_emp_mult and fp.tpdocs = '#39'PRE'#39' and fp' +
          '.recibo is null'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        
          '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente, ca' +
          'se when (cl.nome_cliente is null) then pr.nome_c else cl.nome_cl' +
          'iente end nome_cliente,'
        '    '#39'PRESTACOES'#39' tp_recebimento, '#39'RECIBO'#39' tp_recebimento2,'
        
          '    5 ordem, case when (ctr1.nome_ctrl is null) then pr.tipo_doc' +
          '_c else ctr1.nome_ctrl end tipo, coalesce(pr.n_doc_c, 0) Num_doc' +
          ','
        
          '    coalesce(fp.ndoc, coalesce(pr.n_doc_c, 0)) as Num_doc2, pr.d' +
          'ata_venc_c as Data_Doc,'
        '    pr.data_rec_c as Data_Conf,'
        '    coalesce(pr.valor_c, 0) as valor_total,'
        
          '    case when coalesce(pr.valor_corr, 0) > 0 then coalesce(pr.va' +
          'lor_corr, 0) else pr.valor_c end as valor_total,'
        
          '    '#39' '#39' as obs_cxl_rq, coalesce(pr.lote_cxl, cod_cred) as lotere' +
          'c,'
        
          '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', pr.codigo_vend, fp.data_mov, fp.historico,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago, fp.data_mov, '#39 +
          ' '#39' terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        '    '
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then 0'
        '    else'
        '        (select coalesce(pd.ncupom, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) ncupom,'
        '    '
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        '        (select coalesce(cf.num_nota_v, 0) from com_fat cf'
        
          '        where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.' +
          'codigo_emp)'
        '    else'
        '        (select coalesce(pd.num_nf, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) num_nf,'
        '    '
        
          '    0 as nparcela, pr.cod_cred, coalesce(fp.seqform, pr.cod_cred' +
          '),'
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select coalesce(tp.venda, '#39'S'#39') venda from com_fat cf left j' +
          'oin tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        
          '    else (select coalesce(tp.venda, '#39'S'#39') venda from pedvenda pd ' +
          'left join tipo_vendas tp on tp.tipo = pd.tipo and (tp.sigla = pd' +
          '.tipv or (tp.tipo_os = pd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end), '#39'S'#39') venda,'
        '    '
        '    case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select tp.tipo_os from com_fat cf left join tipo_vendas tp ' +
          'on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        '    when(trim(pr.tp_doc_v) = '#39'OS'#39') then'
        
          '    (select tp.tipo_os from pedvenda pd left join tipo_vendas tp' +
          ' on tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = p' +
          'd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    else'
        
          '    (select tp.sigla from pedvenda pd left join tipo_vendas tp o' +
          'n tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = pd.' +
          'tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end tipv,'
        '    pr.tp_doc_v as tipo_doc, 0 id_commerce,'
        
          '    coalesce((case when((select count(*) from controle_creditos ' +
          'cc where cc.lote_cxl = pr.lote_cxl and cc.cod_emp_mult = pr.cod_' +
          'emp_mult) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from controle_creditos cc where cc.lote' +
          '_cxl = pr.lote_cxl and cc.cod_emp_mult = pr.cod_emp_mult)'
        '    end), 1) qtde_prest'
        '    from controle_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    inner join formpagamento fp on fp.nrequisicao = pr.lote_cxl ' +
          'and fp.cod_empresa = pr.cod_emp_mult and fp.tpdocs = '#39'PRE'#39' and (' +
          'not fp.recibo is null)'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        ''
        '    union'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else pr.codigo_emp end) cod_empresa,'
        
          '    pr.cod_emp_mult, coalesce(pr.cod_cliente, 0) cod_cliente, ca' +
          'se when (cl.nome_cliente is null) then pr.nome_c else cl.nome_cl' +
          'iente end nome_cliente,'
        '    '#39'PRESTACOES'#39' tp_recebimento, '#39'TROCO'#39' tp_recebimento2,'
        
          '    5 ordem, case when (ctr1.nome_ctrl is null) then pr.tipo_doc' +
          '_c else ctr1.nome_ctrl end tipo, coalesce(pr.n_doc_c, 0) Num_doc' +
          ','
        
          '    coalesce(fp.ndoc, coalesce(pr.n_doc_c, 0)) as Num_doc2, pr.d' +
          'ata_venc_c as Data_Doc,'
        '    pr.data_rec_c as Data_Conf,'
        '    coalesce(pr.valor_c, 0) as valor_total,'
        
          '    case when coalesce(pr.valor_corr, 0) > 0 then coalesce(pr.va' +
          'lor_corr, 0) else pr.valor_c end as valor_total,'
        
          '    '#39' '#39' as obs_cxl_rq, coalesce(pr.lote_cxl, cod_cred) as lotere' +
          'c,'
        
          '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, col.nome_vendedor' +
          ', pr.codigo_vend, fp.data_mov, fp.historico,'
        
          '    coalesce(fp.valordoc, 0) valor_pago, fp.data_mov, '#39' '#39' tercei' +
          'ros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        '    '
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then 0'
        '    else'
        '        (select coalesce(pd.ncupom, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) ncupom,'
        ''
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        '        (select coalesce(cf.num_nota_v, 0) from com_fat cf'
        
          '        where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.' +
          'codigo_emp)'
        '    else'
        '        (select coalesce(pd.num_nf, 0) from pedvenda pd'
        
          '        where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and' +
          ' pd.cod_empresa = pr.codigo_emp)'
        '    end), 0) num_nf,'
        '    '
        
          '    0 as nparcela, pr.cod_cred, coalesce(fp.seqform, pr.cod_cred' +
          '),'
        '    coalesce((case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select coalesce(tp.venda, '#39'S'#39') venda from com_fat cf left j' +
          'oin tipo_vendas tp on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        
          '    else (select coalesce(tp.venda, '#39'S'#39') venda from pedvenda pd ' +
          'left join tipo_vendas tp on tp.tipo = pd.tipo and (tp.sigla = pd' +
          '.tipv or (tp.tipo_os = pd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end), '#39'S'#39') venda,'
        '    '
        '    case when(trim(pr.tp_doc_v) = '#39'MOT'#39') then'
        
          '    (select tp.tipo_os from com_fat cf left join tipo_vendas tp ' +
          'on tp.tipo = '#39'VEI'#39' and tp.tipo_os = cf.tipo_v'
        
          '    where cf.n_comando = pr.n_doc_v and cf.cod_empresa = pr.codi' +
          'go_emp)'
        '    when(trim(pr.tp_doc_v) = '#39'OS'#39') then'
        
          '    (select tp.tipo_os from pedvenda pd left join tipo_vendas tp' +
          ' on tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = p' +
          'd.tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    else'
        
          '    (select tp.sigla from pedvenda pd left join tipo_vendas tp o' +
          'n tp.tipo = pd.tipo and (tp.sigla = pd.tipv or (tp.tipo_os = pd.' +
          'tipo_os))'
        
          '    where pd.nped = pr.n_doc_v and pd.tipo = pr.tp_doc_v and pd.' +
          'cod_empresa = pr.codigo_emp)'
        '    end tipv,'
        '    pr.tp_doc_v as tipo_doc, 0 id_commerce,'
        
          '    coalesce((case when((select count(*) from controle_creditos ' +
          'cc where cc.lote_cxl = pr.lote_cxl and cc.cod_emp_mult = pr.cod_' +
          'emp_mult) = 0) then'
        '        1'
        '    else'
        
          '        (select count(*) from controle_creditos cc where cc.lote' +
          '_cxl = pr.lote_cxl and cc.cod_emp_mult = pr.cod_emp_mult)'
        '    end), 1) qtde_prest'
        '    from controle_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    inner join formpagamento fp on fp.rec_numvend = pr.lote_cxl ' +
          'and fp.cod_empresa = pr.cod_emp_mult and fp.rec_tipvend = '#39'PRE'#39' ' +
          'and fp.tpdocs = '#39'TRC'#39
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        ''
        '    union'
        ''
        '    -- LANC CXL'
        ''
        
          '    select (case when(emp.financeiro_unificado = '#39'S'#39') then emp.c' +
          'odigo_unificadora else lanc.codigo_emp end) cod_empresa,'
        '    lanc.codigo_emp, 0, coalesce(lanc.historico_cxl, '#39#39'),'
        
          '    '#39'LANCAMENTO AVULSO'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebimento2' +
          ','
        
          '    6 ordem, '#39'LANC CXL'#39' TIPO, coalesce(lanc.n_doc_cxl, 0) num_do' +
          'c,'
        
          '    coalesce(fp.ndoc, coalesce(lanc.n_doc_cxl, 0)) as Num_doc2, ' +
          'lanc.data_lc_cxl data_doc,'
        '    lanc.data_lc_cxl,'
        
          '    case when (lanc.tipo_lanc_cxl = '#39'S'#39') then (lanc.valor_cxl * ' +
          '-1) else lanc.valor_cxl end valor_total,'
        
          '    case when (lanc.tipo_lanc_cxl = '#39'S'#39') then (lanc.valor_cxl * ' +
          '-1) else lanc.valor_cxl end valor_total,'
        '    '#39' '#39' as obs_cxl_rq, coalesce(lanc.cod_lancxl, 0) as loterec,'
        
          '    lanc.data_lc_cxl, coalesce(lanc.op_cxl, 0), col.nome_vendedo' +
          'r, lanc.op_cxl, fp.data_mov, fp.historico,'
        '    coalesce(fp.valordoc, 0), fp.data_mov, '#39' '#39' terceiros,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    0 as num_recibo, 0 as valor_recibo,'
        '    0 ncupom, 0 num_nf,'
        
          '    0 as nparcela, lanc.cod_lancxl, coalesce(fp.seqform, lanc.co' +
          'd_lancxl), '
        
          '    '#39'N'#39' venda, '#39#39' tipv, '#39'LANCCXL'#39' tipo_doc, 0 id_commerce, 1 qtd' +
          'e_prest from lanccxl lanc'
        '    inner join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = lanc.op_cxl' +
          ' and col.cod_empresa = lanc.codigo_emp'
        
          '    inner join formpagamento fp on fp.nrequisicao = lanc.cod_lan' +
          'cxl and fp.cod_empresa = lanc.codigo_emp and fp.tpdocs = '#39'LCS'#39
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        '    where lanc.tipo_doc_cxl is null and lanc.refrecibo is null'
        ';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RECEBIMENTOS6('
        '    TP_RECEBIMENTO,'
        '    TP_RECEBIMENTO2,'
        '    ORDEM,'
        '    TIPO,'
        '    TIPO2,'
        '    COD_EMPRESA,'
        '    COD_EMP_MULT,'
        '    DATA_CONF,'
        '    DIA_CXL,'
        '    OP_CXL,'
        '    ID_COMMERCE,'
        '    CODIGO_CTRL,'
        '    NOME_CTRL,'
        '    VALOR_PAGO,'
        '    SEQID,'
        '    SEQID2)'
        'AS'
        
          '-- VIEW EXIBE OS TOTAIS DOS RECEBIMENTOS DO CAIXA AUXILIAR POR C' +
          'ONTROLE'
        '-- RELATORIO "RECEBIMENTOS CAIXA AUXILIAR"'
        ''
        '    --- REQ, OS'
        '    select'
        
          '    case when (rq.id_commerce > 0) then '#39'ECOMMERCE'#39' else case wh' +
          'en (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVICOS'#39' end end tp_re' +
          'cebimento,'
        '    '#39'DIRETO'#39' tp_recebimento2,'
        
          '    case when (rq.id_commerce > 0) then 7 else case when (rq.tip' +
          'o = '#39'REQ'#39') then 2 else 3 end end ordem,'
        '    rq.tipo, rq.tipo,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        
          '    rq.data_fech, rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl, coa' +
          'lesce(rq.id_commerce, 0) id_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    coalesce(fp.valordoc, 0) valordoc,'
        '    coalesce(fp.seqform, rq.nped), coalesce(fp.seqform, rq.nped)'
        '    from pedvenda rq'
        '    inner join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    left join formpagamento fp on fp.nrequisicao = rq.nped and f' +
          'p.tpdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa and fp.re' +
          'cibo is null'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.t' +
          'ipo in ('#39'REQ'#39', '#39'OS'#39')'
        
          '    /*where coalesce((select count(*) from formpagamento frc whe' +
          're frc.nrequisicao = rq.nped and'
        
          '      frc.tpdocs = rq.tipo and frc.cod_empresa = rq.cod_empresa ' +
          'and (not frc.recibo is null)),0) <= 0*/'
        ''
        '    union'
        '    '
        
          '    select case when (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVI' +
          'COS'#39' end tp_recebimento, '#39'RECIBO'#39' tp_recebimento2,'
        
          '    case when (rq.id_commerce > 0) then 7 else case when (rq.tip' +
          'o = '#39'REQ'#39') then 2 else 3 end end ordem,'
        '    rq.tipo, rq.tipo,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        
          '    rq.data_fech, rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl, coa' +
          'lesce(rq.id_commerce, 0) id_commerce,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc' +
          ') is null then'
        '        0'
        '    else (select first 1 ctrl.codigo_ctrl from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa' +
          ' = fp.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc' +
          ' asc)'
        '    end as codigo_ctrl,'
        '    '#39'RECIBO'#39','
        
          '    /*case when (select first 1 ctrl.nome_ctrl from controles ct' +
          'rl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc asc' +
          ') is null then'
        '        '#39'SEM FORMA'#39
        '    else (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa' +
          ' = fp.cod_empresa and rc.rec_tipvend ='#39'REC'#39' order by rc.valordoc' +
          ' asc)'
        '    end as nome_ctrl,*/'
        
          '    coalesce(fp.valordoc, 0) valordoc, coalesce(fp.seqform, rq.n' +
          'ped), coalesce(fp.seqform, rq.nped)'
        '    '
        '    from pedvenda rq'
        '    inner join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.nrequisicao = rq.nped and ' +
          'fp.tpdocs = rq.tipo and fp.cod_empresa = rq.cod_empresa and (not' +
          ' fp.recibo is null)'
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        
          '    where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.t' +
          'ipo in ('#39'REQ'#39', '#39'OS'#39')'
        '    '
        '    union'
        '    '
        '    select'
        
          '    case when (rq.id_commerce > 0) then '#39'ECOMMERCE'#39' else case wh' +
          'en (rq.tipo = '#39'REQ'#39') then '#39'BALCAO'#39' else '#39'SERVICOS'#39' end end tp_re' +
          'cebimento,'
        '    '#39'TROCO'#39' tp_recebimento2,'
        
          '    case when (rq.id_commerce > 0) then 7 else case when (rq.tip' +
          'o = '#39'REQ'#39') then 2 else 3 end end ordem,'
        '    rq.tipo, rq.tipo,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else rq.cod_empresa end) cod_empresa,'
        '    rq.cod_empresa,'
        
          '    rq.data_fech, rq.dia_cxl, coalesce(rq.op_cxl, 0) op_cxl, coa' +
          'lesce(rq.id_commerce, 0) id_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(fp.valordoc, 0) valordoc, coalesce(fp.seqform, rq.n' +
          'ped), coalesce(fp.seqform, rq.nped)'
        '    from pedvenda rq'
        '    inner join empresa emp on rq.cod_empresa = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.rec_numvend = rq.nped and ' +
          'fp.rec_tipvend = rq.tipo and fp.cod_empresa = rq.cod_empresa and' +
          ' fp.tpdocs = '#39'TRC'#39
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where coalesce(trim(rq.status_ped), '#39#39') = '#39'FECHADA'#39' and rq.t' +
          'ipo in ('#39'REQ'#39', '#39'OS'#39')'
        '    '
        '    union'
        '    '
        '    --- CF'
        '    '
        '    select '#39'VEICULOS'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebimento2,'
        '    1, '#39'MOT'#39',  '#39'MOT'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else mt.cod_empresa end) cod_empresa,'
        '    mt.cod_empresa,'
        
          '    mt.data_fech, mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl, 0 i' +
          'd_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    coalesce(fp.valordoc, 0) valordoc,'
        
          '    coalesce(fp.seqform, mt.n_comando), coalesce(fp.seqform, mt.' +
          'n_comando) from com_fat mt'
        '    inner join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.nrequisicao = mt.n_comando' +
          ' and fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa  and ' +
          'fp.recibo is null'
        
          '    inner join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctr' +
          'l'
        
          '    where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.n' +
          'atureza = '#39'S'#39
        
          '    /* where coalesce((select count(*) from formpagamento frc wh' +
          'ere frc.nrequisicao = mt.n_comando and'
        
          '        frc.tpdocs = '#39'MOT'#39' and frc.cod_empresa = mt.cod_empresa ' +
          'and (not frc.recibo is null)),0) <= 0*/'
        '    '
        '    union'
        '    '
        '    select '#39'VEICULOS'#39' tp_recebimento, '#39'RECIBO'#39' tp_recebimento2,'
        '    1, '#39'MOT'#39',  '#39'MOT'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else mt.cod_empresa end) cod_empresa,'
        '    mt.cod_empresa,'
        
          '    mt.data_fech, mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl, 0 i' +
          'd_commerce,'
        '    case when (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc as' +
          'c) is null then'
        '        0'
        '    else (select first 1 ctrl.codigo_ctrl from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa' +
          ' = fp.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordo' +
          'c asc)'
        '    end as codigo_ctrl,'
        '    '#39'RECIBO'#39','
        
          '    /*case when (select first 1 ctrl.nome_ctrl from controles ct' +
          'rl'
        
          '    inner join formpagamento rc on rc.cod_controle = ctrl.codigo' +
          '_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '    where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa = f' +
          'p.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordoc as' +
          'c) is null then'
        '        '#39'SEM FORMA'#39
        '    else (select first 1 ctrl.nome_ctrl from controles ctrl'
        
          '        inner join formpagamento rc on rc.cod_controle = ctrl.co' +
          'digo_ctrl and rc.cod_empresa = ctrl.codigo_emp'
        
          '        where rc.rec_numvend = fp.rec_numvend and rc.cod_empresa' +
          ' = fp.cod_empresa and rc.rec_tipvend = '#39'REC'#39' order by rc.valordo' +
          'c asc)'
        '    end as nome_ctrl,*/'
        '    coalesce(fp.valordoc, 0) valordoc,'
        
          '    coalesce(fp.seqform, mt.n_comando), coalesce(fp.seqform, mt.' +
          'n_comando) from com_fat mt'
        '    inner join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.nrequisicao = mt.n_comando' +
          ' and fp.tpdocs = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa and (' +
          'not fp.recibo is null)'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.n' +
          'atureza = '#39'S'#39
        '    '
        '    union'
        '    '
        '    select '#39'VEICULOS'#39' tp_recebimento, '#39'TROCO'#39' tp_recebimento2,'
        '    1, '#39'MOT'#39',  '#39'MOT'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else mt.cod_empresa end) cod_empresa,'
        '    mt.cod_empresa,'
        
          '    mt.data_fech, mt.dia_cxl, coalesce(mt.op_cxl, 0) op_cxl, 0 i' +
          'd_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(fp.valordoc, 0) valordoc, coalesce(fp.seqform, mt.n' +
          '_comando), coalesce(fp.seqform, mt.n_comando)'
        '    from com_fat mt'
        '    inner join empresa emp on mt.cod_empresa = emp.cod_empresa'
        
          '    inner join formpagamento fp on fp.rec_numvend = mt.n_comando' +
          ' and fp.rec_tipvend = '#39'MOT'#39' and fp.cod_empresa = mt.cod_empresa ' +
          'and fp.tpdocs = '#39'TRC'#39
        
          '    left join recibos rec on rec.nrecibo = fp.rec_numvend and re' +
          'c.cod_empresa = fp.cod_empresa'
        
          '    left join CONTROLES ctr on fp.cod_controle = ctr.codigo_ctrl' +
          ' and fp.cod_empresa = ctr.codigo_emp'
        
          '    where (coalesce(trim(mt.status_v), '#39#39') = '#39'FECHADO'#39') and mt.n' +
          'atureza = '#39'S'#39
        ''
        '    union'
        '    '
        '    --RECIBO'
        '    '
        
          '    select '#39'RECIBO ANTECIPADO'#39' tp_recebimento, '#39'DIRETO'#39' tp_receb' +
          'imento2,'
        '    4, '#39'REC'#39', '#39'REC'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else rec.cod_empresa end) cod_empresa,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then coalesce(rec' +
          '.cod_emp_mult, rec.cod_empresa) else rec.cod_empresa end) cod_em' +
          'p_mult,'
        
          '    rec.data_rec, rec.dia_cxl, coalesce(rec.op_cxl, 0) op_cxl, 0' +
          ' id_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(fp.valordoc, 0) valordoc, coalesce(fp.seqform, rec.' +
          'nrecibo), coalesce(fp.seqform, rec.nrecibo)'
        '    from recibos rec'
        '    inner join empresa emp on rec.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = rec.op_cxl ' +
          'and col.cod_empresa = rec.cod_empresa'
        
          '    left join formpagamento fp on fp.nrequisicao = rec.nrecibo a' +
          'nd fp.cod_empresa = rec.cod_empresa and fp.tpdocs = '#39'REC'#39' and fp' +
          '.recibo is null'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        ''
        '    union'
        '    '
        
          '    select '#39'RECIBO ANTECIPADO'#39' tp_recebimento, '#39'TROCO'#39' tp_recebi' +
          'mento2,'
        '    4, '#39'REC'#39', '#39'REC'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else rec.cod_empresa end) cod_empresa,'
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then coalesce(rec' +
          '.cod_emp_mult, rec.cod_empresa) else rec.cod_empresa end) cod_em' +
          'p_mult,'
        
          '    rec.data_rec, rec.dia_cxl, coalesce(rec.op_cxl, 0) op_cxl, 0' +
          ' id_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(fp.valordoc, 0) valordoc, coalesce(fp.seqform, rec.' +
          'nrecibo), coalesce(fp.seqform, rec.nrecibo)'
        '    from recibos rec'
        '    inner join empresa emp on rec.cod_empresa = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = rec.op_cxl ' +
          'and col.cod_empresa = rec.cod_empresa'
        
          '    inner join formpagamento fp on fp.rec_numvend = rec.nrecibo ' +
          'and fp.cod_empresa = rec.cod_empresa and fp.rec_tipvend = '#39'REC'#39' ' +
          'and fp.tpdocs = '#39'TRC'#39
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        ''
        '    union'
        '    '
        '    -- PRESTACAO'
        '    '
        
          '    select '#39'PRESTACOES'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebimento2' +
          ','
        '    5, '#39'PRE'#39', '#39'PRE'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.datq_c as Data_Conf,'
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, 0 id_commerce,'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago,'
        
          '    coalesce(fp.seqform, pr.cod_cred), coalesce(fp.seqform, pr.c' +
          'od_cred)'
        '    from baixa_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.cod_emp_mult = pr.cod_emp_mult'
        
          '    left join formpagamento fp on fp.nrequisicao = pr.lote_cxl a' +
          'nd fp.cod_empresa = pr.cod_emp_mult and fp.tpdocs = '#39'PRE'#39' and fp' +
          '.recibo is null'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.datq_c is not null'
        ''
        '    union'
        '    '
        
          '    select '#39'PRESTACOES'#39' tp_recebimento, '#39'RECIBO'#39' tp_recebimento2' +
          ','
        '    5, '#39'PRE'#39', '#39'PRE'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.datq_c as Data_Conf,'
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, 0 id_commerce,'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end codigo_ctrl,'
        '    '#39'RECIBO'#39','
        
          '    --case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.' +
          'nome_ctrl end nome_ctrl,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago,'
        
          '    coalesce(fp.seqform, pr.cod_cred), coalesce(fp.seqform, pr.c' +
          'od_cred)'
        '    from baixa_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.cod_emp_mult = pr.cod_emp_mult'
        
          '    inner join formpagamento fp on fp.nrequisicao = pr.lote_cxl ' +
          'and fp.cod_empresa = pr.cod_emp_mult and fp.tpdocs = '#39'PRE'#39' and (' +
          'not fp.recibo is null)'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.datq_c is not null'
        ''
        '    union'
        '    '
        '    select '#39'PRESTACOES'#39' tp_recebimento, '#39'TROCO'#39' tp_recebimento2,'
        '    5, '#39'PRE'#39', '#39'PRE'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.datq_c as Data_Conf,'
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, 0 id_commerce,'
        
          '    case when ctr.codigo_ctrl is null then 0 else ctr.codigo_ctr' +
          'l end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        '    coalesce(fp.valordoc, 0) valor_pago,'
        
          '    coalesce(fp.seqform, pr.cod_cred), coalesce(fp.seqform, pr.c' +
          'od_cred)'
        '    from baixa_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join controle_creditos cc on cc.cod_cred = pr.cod_cred ' +
          'and cc.cod_emp_mult = pr.cod_emp_mult'
        
          '    inner join formpagamento fp on fp.rec_numvend = pr.lote_cxl ' +
          'and fp.cod_empresa = pr.cod_emp_mult and fp.rec_tipvend = '#39'PRE'#39' ' +
          'and fp.tpdocs = '#39'TRC'#39
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where pr.datq_c is not null'
        ''
        '    union'
        '    '
        
          '    select '#39'PRESTACOES'#39' tp_recebimento, '#39'DIRETO'#39' tp_recebimento2' +
          ','
        '    5, '#39'PRE'#39', '#39'PRE'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.data_rec_c,'
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, 0 id_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago,'
        
          '    coalesce(fp.seqform, pr.cod_cred), coalesce(fp.seqform, pr.c' +
          'od_cred)'
        '    from controle_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    left join formpagamento fp on fp.nrequisicao = pr.lote_cxl a' +
          'nd fp.cod_empresa = pr.cod_emp_mult and fp.tpdocs = '#39'PRE'#39' and fp' +
          '.recibo is null'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        ''
        '    union'
        '    '
        
          '    select '#39'PRESTACOES'#39' tp_recebimento, '#39'RECIBO'#39' tp_recebimento2' +
          ','
        '    5, '#39'PRE'#39', '#39'PRE'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.data_rec_c,'
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, 0 id_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        '    '#39'RECIBO'#39','
        
          '    --case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.' +
          'nome_ctrl end nome_ctrl,'
        
          '    case when(fp.valordoc < 0) then (coalesce(fp.valordoc, 0) * ' +
          '-1) else coalesce(fp.valordoc, 0) end valor_pago,'
        
          '    coalesce(fp.seqform, pr.cod_cred), coalesce(fp.seqform, pr.c' +
          'od_cred)'
        '    from controle_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    inner join formpagamento fp on fp.nrequisicao = pr.lote_cxl ' +
          'and fp.cod_empresa = pr.cod_emp_mult and fp.tpdocs = '#39'PRE'#39' and (' +
          'not fp.recibo is null)'
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        ''
        '    union'
        '    '
        '    select '#39'PRESTACOES'#39' tp_recebimento, '#39'TROCO'#39' tp_recebimento2,'
        '    5, '#39'PRE'#39', '#39'PRE'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else pr.codigo_emp end) cod_empresa,'
        '    pr.cod_emp_mult, pr.data_rec_c,'
        '    pr.dia_cxl, coalesce(pr.op_cxl, 0) op_cxl, 0 id_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(fp.valordoc, 0) valordoc, coalesce(fp.seqform, pr.c' +
          'od_cred), coalesce(fp.seqform, pr.cod_cred)'
        '    from controle_creditos pr'
        '    inner join empresa emp on pr.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = pr.op_cxl a' +
          'nd col.cod_empresa = pr.cod_emp_mult'
        
          '    left join clientes cl on cl.cod_cliente = pr.cod_cliente and' +
          ' cl.cod_empresa = pr.cod_emp_mult'
        
          '    inner join formpagamento fp on fp.rec_numvend = pr.lote_cxl ' +
          'and fp.cod_empresa = pr.cod_emp_mult and fp.rec_tipvend = '#39'PRE'#39' ' +
          'and fp.tpdocs = '#39'TRC'#39
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        
          '    left join CONTROLES ctr1 on ctr1.codigo_ctrl = pr.codigo_ctr' +
          'l and ctr1.codigo_emp = pr.codigo_emp'
        '    where coalesce(pr.status_c, '#39#39') = '#39#39' and pr.datq_c is null'
        ''
        '    union'
        ''
        '    -- LANC CXL'
        '    '
        
          '    select '#39'LANCAMENTO AVULSO'#39' tp_recebimento, '#39'DIRETO'#39' tp_receb' +
          'imento2,'
        '    6 ordem, '#39'LCXL'#39', '#39'LCXL'#39','
        
          '    (case when(emp.financeiro_unificado = '#39'S'#39') then emp.codigo_u' +
          'nificadora else lanc.codigo_emp end) cod_empresa,'
        
          '    lanc.codigo_emp, lanc.data_lc_cxl, lanc.data_lc_cxl, coalesc' +
          'e(lanc.op_cxl, 0) op_cxl, 0 id_commerce,'
        
          '    case when ctr.nome_ctrl is null then 0 else ctr.codigo_ctrl ' +
          'end codigo_ctrl,'
        
          '    case when ctr.nome_ctrl is null then '#39'SEM FORMA'#39' else ctr.no' +
          'me_ctrl end nome_ctrl,'
        
          '    coalesce(fp.valordoc, 0) valordoc, coalesce(fp.seqform, lanc' +
          '.cod_lancxl), coalesce(fp.seqform, lanc.cod_lancxl)'
        '    from lanccxl lanc'
        '    inner join empresa emp on lanc.codigo_emp = emp.cod_empresa'
        
          '    inner join colaborador col on col.cod_vendedor = lanc.op_cxl' +
          ' and col.cod_empresa = lanc.codigo_emp'
        
          '    inner join formpagamento fp on fp.nrequisicao = lanc.cod_lan' +
          'cxl and fp.cod_empresa = lanc.codigo_emp and fp.tpdocs = '#39'LCS'#39
        
          '    left join CONTROLES ctr on ctr.codigo_ctrl = fp.cod_controle' +
          ' and ctr.codigo_emp = fp.cod_empresa'
        '    where lanc.tipo_doc_cxl is null and lanc.refrecibo is null'
        ';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE TABLE CONTROLES_TAXAS_ECOMMERCE ('
        '    SEQID                    INTEGER NOT NULL,'
        '    COD_EMPRESA              INTEGER NOT NULL,'
        '    CODIGO_CTRL              INTEGER NOT NULL,'
        '    DEBITO_CREDITO           CHAR(1) DEFAULT '#39'C'#39','
        '    PARCELAS_DE              SMALLINT,'
        '    PARCELAS_ATE             SMALLINT,'
        '    HAB_TAXA_PROD            CHAR(1) DEFAULT '#39'N'#39','
        
          '    TAXA_PROD                T_VL_TODOS /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        '    HAB_TAXA_FRETE           CHAR(1) DEFAULT '#39'N'#39','
        '    TAXA_FRETE               DOUBLE PRECISION,'
        '    HAB_TAXA_POR_PEDIDO      CHAR(1) DEFAULT '#39'N'#39','
        
          '    VL_TAXA_POR_PEDIDO       T_VL_TODOS /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        '    HAB_TAXA_POR_ITEM        CHAR(1) DEFAULT '#39'N'#39','
        
          '    VL_TAXA_POR_ITEM         T_VL_TODOS /* T_VL_TODOS = DOUBLE P' +
          'RECISION DEFAULT 000000000.00 */,'
        '    FRETE_CONTA_SMART_PLACE  CHAR(1) DEFAULT '#39'N'#39','
        '    ATIVO                    INTEGER DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE CONTROLES_TAXAS_ECOMMERCE ADD CONSTRAINT PK_CONTROLE' +
          'S_TAXAS_ECOMMERCE PRIMARY KEY (SEQID, COD_EMPRESA);'
        
          'ALTER TABLE CONTROLES_TAXAS_ECOMMERCE ADD CONSTRAINT FK_CONTROLE' +
          '_TAXAS_ECOMMERC_CTRL FOREIGN KEY (CODIGO_CTRL, COD_EMPRESA) REFE' +
          'RENCES CONTROLES (CODIGO_CTRL, CODIGO_EMP) ON DELETE CASCADE ON ' +
          'UPDATE CASCADE;'
        
          'ALTER TABLE CONTROLES_TAXAS_ECOMMERCE ADD VALOR_DE DOUBLE PRECIS' +
          'ION DEFAULT 0;'
        
          'ALTER TABLE CONTROLES_TAXAS_ECOMMERCE ADD VALOR_ATE DOUBLE PRECI' +
          'SION DEFAULT 0;'
        
          'ALTER TABLE CONTROLES_TAXAS_ECOMMERCE ADD CONS_FRETE_REGRA CHAR(' +
          '1) DEFAULT '#39'N'#39';'
        'CREATE INDEX IDX_PRODUTOS_EMP ON PRODUTOS (COD_EMPRESA);'
        'ALTER TABLE PEDVENDA ADD LOCAL_VENDA VARCHAR(80);'
        'ALTER TABLE FORMPAGAMENTO ADD LOCAL_VENDA VARCHAR(80);'
        'ALTER TABLE FORMPAGAMENTO_EC ADD LOCAL_VENDA VARCHAR(80);'
        
          'ALTER TABLE INTERMEDIADOR_CONTROLE_EC ADD LOCAL_VENDA VARCHAR(80' +
          ');'
        'DROP INDEX IDX_INTERMEDIADOR_CONTROLE_UNQ;'
        
          'CREATE UNIQUE INDEX IDX_INTERMEDIADOR_CONTROLE_UNQ2 ON INTERMEDI' +
          'ADOR_CONTROLE_EC (LOCAL_VENDA, INTERMEDIADOR, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NFE_MEIOS_PAG'
        'returns ('
        '    TPAG integer,'
        '    DESCRICAO varchar(60))'
        'as'
        'begin'
        '  tpag = 01;'
        '  descricao = '#39'Dinheiro'#39';'
        '  suspend;'
        ''
        '  tpag = 02;'
        '  descricao = '#39'Cheque'#39';'
        '  suspend;'
        ''
        '  tpag = 03;'
        '  descricao = '#39'Cartao de Credito'#39';'
        '  suspend;'
        ''
        '  tpag = 04;'
        '  descricao = '#39'Cartao de Debito'#39';'
        '  suspend;'
        ''
        '  tpag = 05;'
        '  descricao = '#39'Credito Loja'#39';'
        '  suspend;'
        ''
        '  tpag = 10;'
        '  descricao = '#39'Vale Alimentacao'#39';'
        '  suspend;'
        ''
        '  tpag = 11;'
        '  descricao = '#39'Vale Refeicao'#39';'
        '  suspend;'
        ''
        '  tpag = 12;'
        '  descricao = '#39'Vale Presente'#39';'
        '  suspend;'
        ''
        '  tpag = 13;'
        '  descricao = '#39'Vale Combustivel'#39';'
        '  suspend;'
        ''
        '  tpag = 15;'
        '  descricao = '#39'Boleto Bancario'#39';'
        '  suspend;'
        ''
        '  tpag = 16;'
        '  descricao = '#39'Deposito Bancario'#39';'
        '  suspend;'
        ''
        '  tpag = 17;'
        '  descricao = '#39'Pagamento Instantaneo (PIX)'#39';'
        '  suspend;'
        ''
        '  tpag = 18;'
        '  descricao = '#39'Transferencia bancaria, Carteira Digital'#39';'
        '  suspend;'
        ''
        '  tpag = 19;'
        
          '  descricao = '#39'Programa de fidelidade, Cashback, Credito Virtual' +
          #39';'
        '  suspend;'
        ''
        '  tpag = 90;'
        '  descricao = '#39'Sem pagamento'#39';'
        '  suspend;'
        ''
        '  tpag = 99;'
        '  descricao = '#39'Outro'#39';'
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        'ALTER TABLE NOTAFISCAL ADD INDINTERMED CHAR(1);'
        'ALTER TABLE NOTAFISCAL ADD INFINTERMED_CNPJ VARCHAR(14);'
        'ALTER TABLE NOTAFISCAL ADD INFINTERMED_IDCADINTTRAN VARCHAR(60);'
        'ALTER TABLE NFCE ADD INDINTERMED CHAR(1);'
        'ALTER TABLE NFCE ADD INFINTERMED_CNPJ VARCHAR(14);'
        'ALTER TABLE NFCE ADD INFINTERMED_IDCADINTTRAN VARCHAR(60);'
        
          'ALTER TABLE CONTROLES_TAXAS_ECOMMERCE ADD HAB_TAXA_POR_UNIDADE C' +
          'HAR(1) DEFAULT '#39'N'#39';'
        
          'ALTER TABLE CONTROLES_TAXAS_ECOMMERCE ADD VL_TAXA_POR_UNIDADE T_' +
          'VL_TODOS;'
        'ALTER TABLE MARCA_PROD ADD SEQID_EC BIGINT;'
        'ALTER TABLE CATEGORIA ADD SEQID_EC BIGINT;'
        'ALTER TABLE TIPO_GRADE_EC ADD SEQID_EC BIGINT;'
        'ALTER TABLE CLIENTES ADD SEQID_EC BIGINT;'
        'ALTER TABLE CLIENTES_END_DOC_ADD ADD SEQID_EC BIGINT;'
        'ALTER TABLE PRODUTOS_EC ADD SEQID_EC BIGINT;'
        'ALTER TABLE PRODUTOS_EC_GRADE ADD SEQID_EC BIGINT;'
        'ALTER TABLE KITS_PROD_EC ADD SEQID_EC BIGINT;'
        'ALTER TABLE KITS_PROD_KITS ADD SEQID_EC BIGINT;'
        'ALTER TABLE PEDVENDA ADD SEQID_EC BIGINT;'
        'ALTER TABLE NOTAFISCAL ADD SEQID_EC BIGINT;'
        'CREATE SEQUENCE SEQ_DEL_CA;'
        'CREATE SEQUENCE SEQ_DEL_EC;'
        'CREATE SEQUENCE SEQ_EC_MARCA_PROD;'
        'CREATE SEQUENCE SEQ_EC_CATEGORIA;'
        'CREATE SEQUENCE SEQ_EC_TIPO_GRADE_EC;'
        'CREATE SEQUENCE SEQ_EC_CLIENTES;'
        'CREATE SEQUENCE SEQ_EC_CLIENTES_END_DOC_ADD;'
        'CREATE SEQUENCE SEQ_EC_PRODUTOS_EC;'
        'CREATE SEQUENCE SEQ_EC_PRODUTOS_EC_GRADE;'
        'CREATE SEQUENCE SEQ_EC_KITS_PROD_EC;'
        'CREATE SEQUENCE SEQ_EC_KITS_PROD_KITS;'
        'CREATE SEQUENCE SEQ_EC_PEDVENDA;'
        'CREATE SEQUENCE SEQ_EC_NOTAFISCAL;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_CA_SEQ FOR PRODUTOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'as'
        '  declare variable ID_COMERCIO_ABERTO integer;'
        '  declare variable COMERCIO_ABERTO integer;'
        'begin'
        '  if (substring(user from 1 for 4) = '#39'REPL'#39') then'
        '    exit;'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F from CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'comercio_aberto_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO :COMERCI' +
          'O_ABERTO;'
        '    '
        '  SELECT PRODUTOS_EC.ID_COMERCIO_ABERTO from PRODUTOS_EC'
        '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD'
        '  AND PRODUTOS_EC.COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :ID_COMERCI' +
          'O_ABERTO;'
        ''
        
          '  if ((COALESCE(ID_COMERCIO_ABERTO, 0) <= 0) and (COALESCE(COMER' +
          'CIO_ABERTO, 0) <= 0)) then'
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
        '  if (coalesce(ID_COMERCIO_ABERTO, 0) > 0) then'
        '    new.ID_COMERCIO_ABERTO = :ID_COMERCIO_ABERTO;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER TRIGGER TR_DTCA_PRODUTOS_EC FOR PRODUTOS_EC'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_PRODUTOS_EC FOR PRODUTOS_EC'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_KITS_PROD_EC FOR KITS_PROD_EC'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_CA FOR PRODUTOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE COMERCIO_ABERTO INTEGER;'
        '  DECLARE VARIABLE ID_COMERCIO_ABERTO INTEGER;'
        '  DECLARE VARIABLE VSQL VARCHAR(100);'
        'begin'
        '  /* Trigger text */'
        '   IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  VSQL = '#39#39';'
        ''
        '  SELECT CONFIG_SISTEMA.VALUE1_F FROM CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'comercio_aberto_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: COMERCI' +
          'O_ABERTO;'
        ''
        '  SELECT PRODUTOS_EC.ID_COMERCIO_ABERTO FROM PRODUTOS_EC'
        
          '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD AND PRODUTOS_EC.' +
          'COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :ID_COMERCI' +
          'O_ABERTO;'
        ''
        
          '  if ((COALESCE(ID_COMERCIO_ABERTO, 0) <= 0) and (COALESCE(COMER' +
          'CIO_ABERTO, 0) <= 0)) then'
        '    exit;'
        ''
        '  if (trim(old.LISTA_IMAGENS) <> trim(new.LISTA_IMAGENS)) then'
        '  begin'
        '    if (coalesce(new.ALTEROU_IMAGEM, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM = '#39'S'#39';'
        '    if (coalesce(new.ALTEROU_IMAGEM_GRADE, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM_GRADE = '#39'S'#39';'
        '  end'
        ''
        '  IF (COALESCE(ID_COMERCIO_ABERTO, 0) > 0) THEN'
        '    new.ID_COMERCIO_ABERTO = :ID_COMERCIO_ABERTO;'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_EC FOR PRODUTOS'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE ECOMMERCE INTEGER;  '
        '  DECLARE VARIABLE VSINC_ECOMMERCE VARCHAR(1);'
        '  DECLARE VARIABLE IDCOMMERCE INTEGER;'
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
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMMER' +
          'CE;'
        ''
        
          '  SELECT PRODUTOS_EC.SINC_ECOMMERCE, PRODUTOS_EC.ID_COMMERCE FRO' +
          'M PRODUTOS_EC'
        
          '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD AND PRODUTOS_EC.' +
          'COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :VSINC_ECOM' +
          'MERCE, :IDCOMMERCE;'
        ''
        
          '  if ((COALESCE(IDCOMMERCE, 0) <= 0) and (COALESCE(ECOMMERCE, 0)' +
          ' <= 0)) then'
        '    exit;'
        ''
        '  if (trim(old.LISTA_IMAGENS) <> trim(new.LISTA_IMAGENS)) then'
        '  begin'
        '    if (coalesce(new.ALTEROU_IMAGEM, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM = '#39'S'#39';'
        '    if (coalesce(new.ALTEROU_IMAGEM_GRADE, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM_GRADE = '#39'S'#39';'
        '  end'
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
        '  SELECT CONFIG_SISTEMA.VALUE1_F from CONFIG_SISTEMA'
        '  WHERE CONFIG_SISTEMA.CHAVE = '#39'comercio_aberto_hab'#39
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO :COMERCI' +
          'O_ABERTO;'
        '    '
        '  SELECT PRODUTOS_EC.ID_COMERCIO_ABERTO from PRODUTOS_EC'
        '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD'
        '  AND PRODUTOS_EC.COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :IDCOMERCIO' +
          '_ABERTO;'
        ''
        
          '  if ((COALESCE(IDCOMERCIO_ABERTO, 0) <= 0) and (COALESCE(COMERC' +
          'IO_ABERTO, 0) <= 0)) then'
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
        '  if (coalesce(IDCOMERCIO_ABERTO, 0) > 0) then'
        '    new.ID_COMERCIO_ABERTO = :IDCOMERCIO_ABERTO;'
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
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMMER' +
          'CE;'
        ''
        '  SELECT PRODUTOS_EC.ID_COMMERCE FROM PRODUTOS_EC'
        
          '  WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD AND PRODUTOS_EC.' +
          'COD_PROD = NEW.COD_PROD'
        
          '  AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO: IDCOMMERCE' +
          ';'
        ''
        
          '  if ((COALESCE(IDCOMMERCE, 0) <= 0) and (COALESCE(ECOMMERCE, 0)' +
          ' <= 0)) then'
        '    exit;'
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
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMMER' +
          'CE;'
        ''
        
          '  SELECT KITS_PROD_EC.SINC_ECOMMERCE, KITS_PROD_EC.ID_COMMERCE F' +
          'ROM KITS_PROD_EC'
        '  WHERE KITS_PROD_EC.CODIGO_KIT = NEW.CODIGO_KIT'
        
          '  AND KITS_PROD_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :VSINC_ECO' +
          'MMERCE, :IDCOMMERCE;'
        ''
        
          '  if ((COALESCE(IDCOMMERCE, 0) <= 0) and (COALESCE(ECOMMERCE, 0)' +
          ' <= 0)) then'
        '    exit;'
        ''
        '  if (trim(OLD.LISTA_IMAGENS) <> trim(NEW.LISTA_IMAGENS)) then'
        '  begin'
        '    if (coalesce(new.ALTEROU_IMAGEM, '#39'N'#39') <> '#39'S'#39') then'
        '        new.ALTEROU_IMAGEM = '#39'S'#39';'
        '  end'
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
        
          '  AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO: ECOMMER' +
          'CE;'
        ''
        '  SELECT KITS_PROD_EC.ID_COMMERCE FROM KITS_PROD_EC'
        '  WHERE KITS_PROD_EC.CODIGO_KIT = NEW.CODIGO_KIT'
        
          '  AND KITS_PROD_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO: IDCOMMERC' +
          'E;'
        ''
        
          '  if ((COALESCE(IDCOMMERCE, 0) <= 0) and (COALESCE(ECOMMERCE, 0)' +
          ' <= 0)) then'
        '    exit;'
        ''
        '  IF (COALESCE(IDCOMMERCE, 0) > 0) THEN'
        '    new.ID_COMMERCE = :IDCOMMERCE;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          'CREATE OR ALTER TRIGGER TR_DTEC_KITS_PROD_KITS_EC FOR KITS_PROD_' +
          'KITS'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_DTEC_PRODUTOS_EC_GRADE FOR PRODUTOS_E' +
          'C_GRADE'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS '
        '  DECLARE VARIABLE ECOMMERCE INTEGER;'
        '  DECLARE VARIABLE ID_COMMERCE INTEGER;'
        '  DECLARE VARIABLE VSEQID BIGINT; '
        '  DECLARE VARIABLE VDELETE INTEGER; '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F from CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = NEW.COD_EMPRESA INTO :ECOMM' +
          'ERCE;'
        '    '
        '    SELECT PRODUTOS_EC.ID_COMMERCE from PRODUTOS_EC'
        '    WHERE PRODUTOS_EC.GRUPO_PROD = NEW.GRUPO_PROD'
        '    AND PRODUTOS_EC.COD_PROD = NEW.COD_PROD'
        
          '    AND PRODUTOS_EC.COD_EMPRESA = NEW.COD_EMPRESA INTO :ID_COMME' +
          'RCE;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        '    SELECT CONFIG_SISTEMA.VALUE1_F from CONFIG_SISTEMA'
        '    WHERE CONFIG_SISTEMA.CHAVE = '#39'e-commerce_hab'#39
        
          '    AND CONFIG_SISTEMA.COD_EMPRESA = OLD.COD_EMPRESA INTO :ECOMM' +
          'ERCE;'
        '    '
        '    SELECT PRODUTOS_EC.ID_COMMERCE from PRODUTOS_EC'
        '    WHERE PRODUTOS_EC.GRUPO_PROD = OLD.GRUPO_PROD'
        '    AND PRODUTOS_EC.COD_PROD = OLD.COD_PROD'
        
          '    AND PRODUTOS_EC.COD_EMPRESA = OLD.COD_EMPRESA INTO :ID_COMME' +
          'RCE;'
        '  end'
        ''
        '  if ((inserting)or(updating)) then '
        '  begin'
        
          '    if ((COALESCE(NEW.ID_COMMERCE, 0) <= 0) and (COALESCE(ID_COM' +
          'MERCE, 0) <= 0) and (COALESCE(ECOMMERCE, 0) <= 0)) then'
        '      exit;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '    if ((COALESCE(OLD.ID_COMMERCE, 0) <= 0) and (COALESCE(ID_COM' +
          'MERCE, 0) <= 0) and (COALESCE(ECOMMERCE, 0) <= 0)) then'
        '      exit;'
        '  end'
        ''
        '  VDELETE = 0;   '
        '  if (updating) then '
        
          '    if (coalesce(old.sinc_ecommerce, '#39'N'#39') <> (coalesce(new.sinc_' +
          'ecommerce, '#39'N'#39')) '
        
          '     and (coalesce(old.sinc_ecommerce, '#39'N'#39') = '#39'S'#39') and (coalesce' +
          '(new.sinc_ecommerce, '#39'N'#39') = '#39'N'#39')) then '
        '      VDELETE = 1; '
        ''
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
        
          '    VALUES(:VSEQID, old.COD_EMPRESA, '#39'PRODUTOS_EC_GRADE'#39', (selec' +
          't CURRENT_TS from SP_CURRENT_TS(old.COD_EMPRESA)), OLD.ID_COMMER' +
          'CE); '
        '    NEW.ID_COMMERCE = 0;'
        '  end '
        '  else if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_PRODUTOS_EC_GRADE, 1) F' +
          'ROM RDB$DATABASE); '
        '  end '
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          'CREATE OR ALTER TRIGGER TR_DTCA_PRODUTOS_EC_GRADE FOR PRODUTOS_E' +
          'C_GRADE'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_CATEGORIA FOR CATEGORIA'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_MARCA_PROD FOR MARCA_PROD'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_TIPO_GRADE_EC FOR TIPO_GRADE_EC'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        '  if ((inserting)or(updating)) then '
        '  begin '
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_TIPO_GRADE_EC, 1) FROM ' +
          'RDB$DATABASE); '
        '  end '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_CLIENTES FOR CLIENTES'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_CLIENTES, 1) FROM RDB$D' +
          'ATABASE); '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TR_DTEC_CLIENTES_END_DOC_ADD FOR CLIENTE' +
          'S_END_DOC_ADD'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_CLIENTES_END_DOC_ADD, 1' +
          ') FROM RDB$DATABASE); '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_PEDVENDA FOR PEDVENDA'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_PEDVENDA, 1) FROM RDB$D' +
          'ATABASE); '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_DTEC_NOTAFISCAL FOR NOTAFISCAL'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS '
        '  DECLARE VARIABLE VSEQID BIGINT; '
        'begin '
        '  /* Trigger text */ '
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit; '
        ''
        
          '    NEW.SEQID_EC = (SELECT GEN_ID(SEQ_EC_NOTAFISCAL, 1) FROM RDB' +
          '$DATABASE); '
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER TRIGGER TR_DTCA_TIPO_SERVICO FOR TIPO_SERVICO'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|update RDB$FIELDS set RDB$FIELD_LENGTH = 61, RDB$CHARAC' +
          'TER_LENGTH = 61 where RDB$FIELD_NAME = (select rdb$field_source ' +
          'from rdb$relation_fields where rdb$relation_name = '#39'NOTAFISCAL'#39' ' +
          'and rdb$field_name = '#39'JUST_CANCELAMENTO'#39');'
        'ALTER TABLE CEST_ ADD ORIGEM SMALLINT;'
        'ALTER TABLE CEST_ ADD UFS_CONVENIO VARCHAR(128);'
        'ALTER TABLE CEST_MVA ADD ORIGEM SMALLINT;'
        'ALTER TABLE CEST_MVA ADD UFS_ALIQ VARCHAR(128);'
        'CREATE INDEX IDX_CEST ON CEST_ (CEST,COD_EMPRESA);'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'CEST_' +
          'MVA'#39') AND (F1.RDB$FIELD_NAME = '#39'TIPO_CADASTRO'#39');'
        
          'UPDATE RDB$RELATION_FIELDS F1 SET F1.RDB$DEFAULT_VALUE = NULL, F' +
          '1.RDB$DEFAULT_SOURCE = NULL WHERE (F1.RDB$RELATION_NAME = '#39'CEST_' +
          'NCM'#39') AND (F1.RDB$FIELD_NAME = '#39'TIPO_CADASTRO'#39');'
        'DROP INDEX IDX_UNQ_CEST_AMBITO;'
        
          'ALTER TABLE INTERMEDIADOR_CONTROLE_EC ADD IDCADINTTRAN VARCHAR(6' +
          '0);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TR_PRODUTOS_EST_DIA_DEL FOR PRODUTOS'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        'begin'
        '  /* Trigger text */'
        '  delete from estoque_diario'
        '  where grupo_prod = old.grupo_prod'
        '  and cod_prod = old.cod_prod'
        '  and cod_empresa = old.cod_empresa'
        '  and dia = '#39'30.12.1899'#39';'
        'end;'
        '|/BLOCO|')
    end
  end
end
