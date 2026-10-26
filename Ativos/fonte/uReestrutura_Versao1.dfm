inherited frmReestruturaVersao1: TfrmReestruturaVersao1
  Caption = 'frmReestruturaVersao1'
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
        'CREATE OR ALTER TRIGGER INCR_CODTCLI FOR TIPOS_CLIENTES'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   if (coalesce(NEW.CODIGO_TIPO,0) = 0) then'
        '       NEW.CODIGO_TIPO = GEN_ID(INC_COD_TCLI,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_COM_FAT_CLIENTES FOR COM_FAT'
        'ACTIVE AFTER INSERT OR UPDATE POSITION 0'
        'AS'
        '  DECLARE VARIABLE vFaturamento CHAR(1);'
        '  DECLARE VARIABLE vCodVersaoEst INTEGER;'
        '  DECLARE VARIABLE vCor VARCHAR(10);'
        '  DECLARE VARIABLE vAnoFab INTEGER;'
        '  DECLARE VARIABLE vAnoMod INTEGER;'
        '  DECLARE VARIABLE vDescricao VARCHAR(60);'
        '  DECLARE VARIABLE vCodVend INTEGER;'
        '  DECLARE VARIABLE vDataVend TIMESTAMP;'
        'begin'
        '    if (USER = '#39'REPL'#39') THEN'
        '       exit;'
        ''
        '    if (coalesce(new.TIPO_VENDA_V, '#39#39') <> '#39'N'#39') then'
        '        exit;'
        ''
        '    if (coalesce(new.NATUREZA, '#39#39') <> '#39'S'#39') then'
        '        exit;'
        ''
        
          '    SELECT FATURAMENTO FROM NAT_OP WHERE CODIGO_NOP = new.NATOP_' +
          'V'
        '    into: vFaturamento;'
        ''
        '    if (coalesce(vfaturamento, '#39'N'#39') <> '#39'S'#39') then'
        '      exit;'
        ''
        
          '    if ((trim(coalesce(old.status_v, '#39#39')) <> trim(coalesce(new.s' +
          'tatus_v, '#39#39')))) then'
        '    begin'
        '        if (trim(coalesce(new.status_v, '#39#39')) = '#39'FECHADO'#39') then'
        '        begin'
        
          '            SELECT EST.VERSAOEST, SUBSTRING(TRIM(EST.COREST) FRO' +
          'M 1 FOR 10) COREST, EST.ANO_FABEST, EST.ANO_MODEST, TP.DESCRICAO' +
          ' FROM EST_MOTO EST'
        
          '              INNER JOIN TIPMODELO TP ON TP.CODIGO = EST.VERSAOE' +
          'ST AND TP.COD_EMPRESA = EST.COD_EMPRESA'
        
          '              WHERE EST.CHASSI_C = NEW.CHASSIV AND EST.CODIGO = ' +
          'NEW.COD_ESTMOTO AND EST.COD_EMPRESA = NEW.COD_EMPRESA'
        
          '            INTO : VCODVERSAOEST, VCOR, VANOFAB, VANOMOD, VDESCR' +
          'ICAO;'
        ''
        
          '            UPDATE CLIENTES SET COD_VENDEDORV = new.COVEND_V, DA' +
          'TA_ULT_COMPRAV = new.DATA_VEN,'
        
          '              CODMODELO_POTVEIC = :vCodVersaoEst, COR_POTVEIC = ' +
          ':vCor,'
        
          '              ANO_POTVEIC = :vAnoFab, ANOMOD_POTVEIC = :vAnoMod,' +
          ' MODELO_POTVEIC = :vDescricao,'
        
          '              COD_VENDEDORV_ANT = COD_VENDEDORV, DATA_ULT_COMPRA' +
          'V_ANT = DATA_ULT_COMPRAV,'
        
          '              CODMODELO_POTVEIC_ANT = CODMODELO_POTVEIC, COR_POT' +
          'VEIC_ANT = COR_POTVEIC,'
        
          '              ANO_POTVEIC_ANT = ANO_POTVEIC, ANOMOD_POTVEIC_ANT ' +
          '= ANOMOD_POTVEIC, MODELO_POTVEIC_ANT = MODELO_POTVEIC'
        
          '            WHERE COD_CLIENTE = new.CLIENTES_V AND COD_EMPRESA =' +
          ' new.COD_EMPRESA;'
        '        end'
        
          '        else if ((trim(coalesce(new.status_v, '#39#39')) = '#39'ABERTO'#39') o' +
          'r (trim(coalesce(new.status_v, '#39#39')) = '#39'CANCELADO'#39')) then'
        '        begin'
        '            SELECT COD_VENDEDORV_ANT, DATA_ULT_COMPRAV_ANT,'
        '             CODMODELO_POTVEIC_ANT, COR_POTVEIC_ANT,'
        
          '             ANO_POTVEIC_ANT, ANOMOD_POTVEIC_ANT, MODELO_POTVEIC' +
          '_ANT FROM CLIENTES CL'
        
          '             WHERE COD_CLIENTE = new.CLIENTES_V AND COD_EMPRESA ' +
          '= new.COD_EMPRESA'
        
          '            into: vcodvend, vdatavend, vcodversaoest, vcor, vano' +
          'fab, vanomod, vdescricao;'
        ''
        
          '            UPDATE CLIENTES SET COD_VENDEDORV = COD_VENDEDORV_AN' +
          'T, DATA_ULT_COMPRAV = DATA_ULT_COMPRAV_ANT,'
        
          '              CODMODELO_POTVEIC = CODMODELO_POTVEIC_ANT, COR_POT' +
          'VEIC = COR_POTVEIC_ANT,'
        
          '              ANO_POTVEIC = ANO_POTVEIC_ANT, ANOMOD_POTVEIC = AN' +
          'OMOD_POTVEIC_ANT, MODELO_POTVEIC = MODELO_POTVEIC_ANT,'
        
          '              COD_VENDEDORV_ANT = null, DATA_ULT_COMPRAV_ANT = n' +
          'ull,'
        
          '              CODMODELO_POTVEIC_ANT = null, COR_POTVEIC_ANT = nu' +
          'll,'
        
          '              ANO_POTVEIC_ANT = null, ANOMOD_POTVEIC_ANT = null,' +
          ' MODELO_POTVEIC_ANT = null'
        
          '            WHERE COD_CLIENTE = new.CLIENTES_V AND COD_EMPRESA =' +
          ' new.COD_EMPRESA;'
        '        end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_RESERVA_ALMOXARIFADO FOR RESERVA_ALMO' +
          'XARIFADO'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        'begin'
        '  DELETE FROM RESERVA_ALMOXARIFADO_ITENS RES'
        
          '  WHERE RES.CODIGO = OLD.CODIGO AND RES.COD_EMPRESA = OLD.COD_EM' +
          'PRESA;'
        ''
        '  UPDATE CONTROLE_ALMOXARIFADO CON SET CON.COD_RESERVA = NULL'
        
          '  WHERE CON.COD_RESERVA = OLD.CODIGO AND CON.COD_EMPRESA = OLD.C' +
          'OD_EMPRESA;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER DATALIBTRAVA_ESTFECH FOR CONTROLE_ALMOXA' +
          'RIFADO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   new.DATA_LIBTRAVA=new.DATA_PEDIDO;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_EST_MOTO_FILA_RESERVA_REORDE FOR EST_' +
          'MOTO'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        '  declare variable vPrev1 char(3);'
        '  declare variable vPrev2 char(3);'
        '  declare variable vCodFila integer;'
        '  declare variable vOrdem integer;'
        '  declare variable vreordenar char(1);'
        'begin'
        '    if (USER = '#39'REPL'#39') THEN'
        '     exit;'
        ''
        
          '    select trim(coalesce(empresa.reordenar_fila_res, '#39'N'#39')) from ' +
          'empresa'
        '    where empresa.cod_empresa = new.cod_empresa'
        '    into :vreordenar;'
        ''
        '    if (trim(vreordenar) <> '#39'S'#39') then'
        '     exit;'
        ''
        
          '    if ((updating) and  (trim(coalesce(old.status_res, '#39'N'#39')) = '#39 +
          'S'#39') and (trim(coalesce(old.status_res, '#39'N'#39')) <> trim(coalesce(ne' +
          'w.status_res, '#39'N'#39')))) then'
        '    begin'
        '         select first 1 ordem, prev_cheg from fila_reserva_veic'
        
          '         where cod_modelo = new.versaoest and ano_fab = new.ano_' +
          'fabest and ano_mod = new.ano_modest'
        
          '         and cod_cor = new.cod_cor and ativo = 1 and coalesce(st' +
          'atus_res, '#39'N'#39') = '#39'N'#39
        '         order by ordem'
        '          into: vordem, vprev1;'
        ''
        '         if (vordem > 0) then'
        '         begin'
        '           for select codigo, prev_cheg from fila_reserva_veic'
        
          '           where cod_modelo = new.versaoest and ano_fab = new.an' +
          'o_fabest and ano_mod = new.ano_modest'
        
          '           and cod_cor = new.cod_cor and ordem > :vordem and ati' +
          'vo = 1 and coalesce(status_res, '#39'N'#39') = '#39'N'#39
        '           order by ordem'
        '            into: vcodfila, vprev2 do'
        '           begin'
        '             update fila_reserva_veic set prev_cheg = :vprev1'
        
          '             where codigo = :vcodfila and cod_empresa = new.cod_' +
          'empresa;'
        ''
        '             vprev1 = vprev2;'
        '           end'
        '         end'
        '    end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_FILA_RESERVA_REORDENAR FOR FILA_RESER' +
          'VA_VEIC'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  declare variable vPrev1 char(3);'
        '  declare variable vPrev2 char(3);'
        '  declare variable vCodFila integer;'
        '  declare variable vreordenar char(1);'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if (coalesce(NEW.COD_VENDEDOR, 0) <= 0) then'
        '  begin'
        '    new.cod_cliente = null;'
        '    new.nome_res = null;'
        '    new.fone_res = null;'
        '    new.tipo_res = null;'
        '    new.sit_res = null;'
        '    new.grupo_cota_rd = null;'
        '    new.data_assembleia = null;'
        '    new.data_res = null;'
        '    new.hora_res = null;'
        ''
        
          '    select trim(coalesce(empresa.reordenar_fila_res, '#39'N'#39')) from ' +
          'empresa'
        '    where empresa.cod_empresa = new.cod_empresa'
        '    into :vreordenar;'
        ''
        '    if (trim(vreordenar) <> '#39'S'#39') then'
        '     exit;'
        ''
        
          '    if ((updating) and (coalesce(old.cod_vendedor, 0) > 0) and (' +
          'coalesce(new.cod_vendedor, 0) = 0)) then'
        '    begin'
        '        vprev1 = new.prev_cheg;'
        ''
        '        for select codigo, prev_cheg from fila_reserva_veic'
        
          '        where cod_modelo = new.cod_modelo and ano_fab = new.ano_' +
          'fab and ano_mod = new.ano_mod'
        
          '        and cod_cor = new.cod_cor and ordem > new.ordem and ativ' +
          'o = 1 and coalesce(status_res, '#39'N'#39') = '#39'N'#39
        '        order by ordem'
        '         into: vcodfila, vprev2 do'
        '        begin'
        '            update fila_reserva_veic set prev_cheg = :vprev1'
        
          '            where codigo = :vcodfila and cod_empresa = new.cod_e' +
          'mpresa;'
        ''
        '            vprev1 = vprev2;'
        '        end'
        '        if (vcodfila > 0) then'
        '        begin'
        
          '          new.ordem = (select cod from incrementa_codigo(new.cod' +
          '_empresa, '#39'FILA_RESERVA_VEIC_ORDEM'#39'));'
        '          new.prev_cheg = :vprev1;'
        '        end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER FILA_RESERVA_DATA_RES FOR FILA_RESERVA_V' +
          'EIC'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER PRODUCAO_HIST_ESTOQUE_D FOR PRODUCAO*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER DEVOLUCAO_HIST_ESTOQUE_D FOR DEVOLUCAO' +
          '*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER PEDVENDA_HIST_ESTOQUE_D FOR PEDVENDA*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER NOTAFISCAL_ITEM_HIST_ESTOQUE_D FOR NOT' +
          'AFISCAL_ITEM*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_DATA_ESTOQUE FOR PEDVENDA'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        
          '  if ((trim(coalesce(new.tipo, '#39#39')) <> '#39'REQ'#39') and (trim(coalesce' +
          '(new.tipo, '#39#39')) <> '#39'OS'#39')) then'
        '    exit;'
        ''
        '  if (updating) then'
        '  begin'
        
          '    if ((trim(coalesce(old.status_ped, '#39#39')) <> trim(coalesce(new' +
          '.status_ped, '#39#39')))'
        '      and (trim(coalesce(new.status_ped, '#39#39')) = '#39'FECHADA'#39')) then'
        '        new.data_estoque = current_date;'
        '  end'
        '  else if (inserting) then'
        '  begin'
        '    if (trim(coalesce(new.status_ped, '#39#39')) = '#39'FECHADA'#39') then'
        '        new.data_estoque = current_date;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NOTAFISCAL_DATA_ESTOQUE FOR NOTAFISCAL'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if (updating) then'
        '  begin'
        
          '    if ((trim(coalesce(old.status, '#39#39')) <> trim(coalesce(new.sta' +
          'tus, '#39#39')))'
        '      and  (trim(coalesce(new.status, '#39#39')) = '#39'Fechada'#39')) then'
        '        new.data_estoque = current_date;'
        '  end'
        '  else if (inserting) then'
        '  begin'
        '   if (trim(coalesce(new.status, '#39#39')) = '#39'Fechada'#39') then'
        '     new.data_estoque = current_date;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER DEVOLUCAO_DATA_ESTOQUE FOR DEVOLUCAO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  new.data_estoque = current_date;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PRODUCAO_DATA_ESTOQUE FOR PRODUCAO'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if (updating) then'
        '  begin'
        
          '    if ((trim(coalesce(old.status, '#39#39')) <> trim(coalesce(new.sta' +
          'tus, '#39#39')))'
        '      and  (trim(coalesce(new.status, '#39#39')) = '#39'FECHADO'#39')) then'
        '        new.data_estoque = current_date;'
        '  end'
        '  else if (inserting) then'
        '  begin'
        '   if (trim(coalesce(new.status, '#39#39')) = '#39'FECHADO'#39') then'
        '     new.data_estoque = current_date;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW FILA_VEICULOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER COM_FAT_BOLETAS FOR COM_FAT'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'begin'
        '  if ((coalesce(new.natureza, '#39#39') = '#39'S'#39')'
        
          '   and (coalesce(old.clientes_v, 0) <> coalesce(new.clientes_v, ' +
          '0))) then'
        '  begin'
        '    update boletas set cod_cliente = new.clientes_v'
        
          '    where cod_nf = new.cod_nf and cod_empresa = new.cod_empresa ' +
          'and tipo_emissao = '#39'NF'#39
        '    and cod_cliente <> new.clientes_v;'
        ''
        '    update notafiscal set cod_cliente = new.clientes_v'
        '    where cod_nf = new.cod_nf and cod_empresa = new.cod_empresa'
        '     and cod_cliente <> new.clientes_v;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_COLAB_BIU_ENV_WSHW FOR COLABORADOR'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (new.data_hora_env_ws = old.data_hora_env_ws ) then'
        '    new.data_hora_alt_ws = current_timestamp;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_ESPE_VEIC FOR ESPECIE_VEICULO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        'IF (NEW.CODIGO_ESP IS NULL) THEN'
        '   NEW.CODIGO_ESP = GEN_ID(INC_COD_ESPECIE,1);'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '--CREATE OR ALTER TRIGGER TR_CLIENTES_IDCONTATO_MARK FOR CLIENTE' +
          'S'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '--CREATE OR ALTER TRIGGER TR_END_PCLIENTES_TR_IDCONTATO FOR END_' +
          'PCLIENTES'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW MAPA_DESP('
        '    N_CONTA_PLC,'
        '    DESC_PLC,'
        '    VALOR_L,'
        '    DESC_GR,'
        '    TIPO_GR,'
        '    HISTORICO_L,'
        '    DATA,'
        '    GRUP_CT,'
        '    COD_LANC,'
        '    COD_DEP,'
        '    MES_MAPA,'
        '    DESC_P,'
        '    CD_SUBGRUPO,'
        '    DESC_SUBGRUPO,'
        '    ORDEM_SUBGRUPO,'
        '    DTREFERENCIA,'
        '    CODIGO_EMP,'
        '    COD_EMP_MULT,'
        '    VALOR_CONTABIL,'
        '    MES_MAPA_REF)'
        'AS'
        'select p.n_conta_plc,p.desc_plc,l.valor_l,c.desc_gr,c.tipo_gr,'
        
          '       l.historico_l,l.data,p.grup_ct,l.cod_lanc,c.cod_dep,extra' +
          'ct(month from l.data),p.desc_padr,p.COD_SUB_CT,sg.DESC_SUB_CT,'
        
          '       sg.ORDEM_SUB_CT,l.DTREFERENCIA,l.codigo_emp,l.cod_emp_mul' +
          't,l.vl_contabil,extract(month from l.DTREFERENCIA)'
        
          '       from Lancamentos l RIGHT JOIN p_contas p ON l.n_conta_plc' +
          ' = p.n_conta_plc and l.lote is null'
        '       INNER JOIN GRUPOS_CT c on'
        
          '       p.grup_ct = c.grup_ct and (c.tipo_gr = '#39'S'#39' or (c.desc_gr ' +
          'like '#39'%INVEST%'#39')) INNER JOIN SUB_GRUP_CT sg'
        '       on p.COD_SUB_CT = sg.COD_SUB_CT where p.ativo = 1'
        'union'
        'select P.n_conta_plc,p.desc_plc,'
        
          '       case when coalesce(ctr.valor_pago,0) = 0 then ctr.valor_c' +
          'tp else ctr.valor_pago end valor_pago,c.desc_gr,c.tipo_gr,ctr.hi' +
          'storico_ctp,'
        
          '       ctr.datq_ctp,p.grup_ct,ctr.cod_contrp,c.cod_dep,extract(m' +
          'onth from ctr.datq_ctp),p.desc_padr,'
        
          '       p.COD_SUB_CT,sg.DESC_SUB_CT,sg.ORDEM_SUB_CT,ctr.DTREFEREN' +
          'CIA,ctr.codigo_emp,ctr.cod_emp_mult,ctr.vl_contabil,extract(mont' +
          'h from ctr.DTREFERENCIA)'
        
          '       from contas_a_pagar ctr RIGHT JOIN p_contas p ON ctr.n_co' +
          'nta_plc = p.n_conta_plc and (ctr.lote is not null or (ctr.datq_c' +
          'tp is null and ctr.entra_previsao = '#39'S'#39'))'
        '       INNER JOIN grupos_ct c ON p.grup_ct = c.grup_ct and'
        
          '       (c.tipo_gr = '#39'S'#39' or (c.desc_gr like '#39'%INVEST%'#39')) INNER JO' +
          'IN SUB_GRUP_CT sg'
        '       on p.COD_SUB_CT = sg.COD_SUB_CT where p.ativo = 1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_EMAIL_MARKETING FOR PEDVENDA'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'DECLARE VARIABLE  vEnvEmail char(1);'
        'DECLARE VARIABLE  vEmail varchar(256);'
        'DECLARE VARIABLE  vTipv char(1);'
        'DECLARE VARIABLE  vOrcamentoSoPecas Integer;'
        'DECLARE VARIABLE  vExistEmail Integer;'
        'DECLARE VARIABLE  vTemp varchar(60);'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if ((not inserting) and (not updating)) then'
        '    exit;'
        ''
        '  select coalesce(emp.env_mail_mark, '#39'N'#39') from empresa emp'
        '  where emp.cod_empresa = new.cod_empresa and emp.ativo = 1'
        '  into : vEnvEmail;'
        ''
        '  if (trim(coalesce(vEnvEmail, '#39#39')) <> '#39'S'#39') then'
        '    exit;'
        ''
        
          '  select coalesce(cl.rec_mail_mark, '#39'N'#39'), cl.email from clientes' +
          ' cl'
        
          '  where cl.cod_cliente = new.cod_cliente and cl.cod_empresa = ne' +
          'w.cod_empresa'
        '   into : vEnvEmail, vEmail;'
        ''
        '  if (trim(coalesce(vEnvEmail, '#39#39')) <> '#39'S'#39') then'
        '    exit;'
        ''
        '  if (trim(coalesce(vEmail, '#39#39')) = '#39#39') then'
        '    exit;'
        ''
        '  if ((trim(new.tipo) = '#39'REQ'#39') or (trim(new.tipo) = '#39'ORC'#39')) then'
        '  begin'
        '      if (trim(new.tipo) = '#39'ORC'#39') then'
        '      begin'
        '        select count(*) from pedvenda_serv serv'
        
          '        where serv.nped = new.nped and serv.tipo = new.tipo and ' +
          'serv.cod_empresa = new.cod_empresa'
        '         into : vOrcamentoSoPecas;'
        '      end'
        ''
        
          '      if ((trim(new.tipo) = '#39'REQ'#39') or ((trim(new.tipo) = '#39'ORC'#39') ' +
          'and (coalesce(vOrcamentoSoPecas, 0) = 0))) then'
        '      begin'
        
          '          select coalesce(tp.env_email, '#39'N'#39') env_email from pedv' +
          'enda pd'
        
          '          left join tipo_vendas tp on tp.sigla = pd.tipv and tp.' +
          'tipo = '#39'REQ'#39
        
          '          where pd.nped = new.nped and pd.tipo = new.tipo and pd' +
          '.cod_empresa = new.cod_empresa'
        '          into : vEnvEmail;'
        '      end'
        '      else'
        '      begin'
        
          '          select coalesce(tp.env_email, '#39'N'#39') env_email from pedv' +
          'enda pd'
        
          '          left join tipo_vendas tp on tp.sigla = pd.tipo_orc and' +
          ' tp.tipo = new.tipo'
        
          '          where pd.nped = new.nped and pd.tipo = new.tipo and pd' +
          '.cod_empresa = new.cod_empresa'
        '          into : vEnvEmail;'
        '      end '
        '  end'
        '  else'
        '  begin'
        
          '      select coalesce(tp.env_email, '#39'N'#39') env_email from pedvenda' +
          ' pd'
        
          '      left join tipo_vendas tp on tp.tipo_os = pd.tipo_os and tp' +
          '.tipo = new.tipo'
        
          '      where pd.nped = new.nped and pd.tipo = new.tipo and pd.cod' +
          '_empresa = new.cod_empresa'
        '      into : vEnvEmail;'
        '  end'
        ''
        
          '  if ((trim(coalesce(vEnvEmail, '#39#39')) <> '#39'A'#39') and (trim(coalesce(' +
          'vEnvEmail, '#39#39')) <> '#39'F'#39')) then'
        '     exit;'
        ''
        '   select count(*) from email_marketing e'
        
          '   where e.cod_documento = new.nped and trim(e.tipo) = trim(new.' +
          'tipo) and e.cod_empresa = new.cod_empresa'
        '    into : vExistEmail;'
        ''
        '   if (coalesce(vexistemail, 0) > 0) then'
        '     exit;'
        ''
        '   if (trim(new.tipo) = '#39'ORC'#39') then'
        '     vTemp = '#39'Envio do Orcamento Num: '#39' || new.nped;'
        '   else if (trim(new.tipo) = '#39'REQ'#39') then'
        '     vTemp = '#39'Envio da Requisicao Num: '#39' || new.nped;'
        '   else'
        '     vTemp = '#39'Envio da Ordem de Servico Num: '#39' || new.nped;'
        ''
        '    if (inserting) then'
        '    begin'
        '      if (trim(coalesce(vEnvEmail, '#39#39')) <> '#39'A'#39') then'
        '       exit;'
        ''
        
          '      insert into email_marketing (CODIGO, COD_EMPRESA, COD_DOCU' +
          'MENTO, ASSUNTO, TIPO, DESCRICAO, DATA_HORA, TP_ENVIO)'
        
          '      values ((select cod from incrementa_codigo(new.cod_empresa' +
          ', '#39'EMAIL_MARKETING'#39')),'
        '       new.cod_empresa, new.nped,'
        '       :vTemp, trim(new.tipo), :vTemp, current_timestamp, '#39'I'#39');'
        '   end'
        '   if (updating) then'
        '   begin'
        '      if ( (trim(coalesce(vEnvEmail, '#39#39')) = '#39'A'#39')'
        
          '      or ( (trim(coalesce(old.status_ped, '#39#39')) <> trim(coalesce(' +
          'new.status_ped, '#39#39')) )'
        
          '        and (trim(coalesce(new.status_ped, '#39#39')) = '#39'FECHADA'#39') and' +
          ' (trim(coalesce(vEnvEmail, '#39#39')) = '#39'F'#39')) )  then'
        ''
        
          '      insert into email_marketing (CODIGO, COD_EMPRESA, COD_DOCU' +
          'MENTO, ASSUNTO, TIPO, DESCRICAO, DATA_HORA, TP_ENVIO)'
        
          '      values ((select cod from incrementa_codigo(new.cod_empresa' +
          ', '#39'EMAIL_MARKETING'#39')),'
        '       new.cod_empresa, new.nped,'
        '       :vTemp, trim(new.tipo), :vTemp, current_timestamp, '#39'I'#39');'
        '   end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER ENDPCLAT_MOBILE FOR END_PCLIENTES'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_MODMOBILE=current_date;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER ENDPCLCAD_MOBILE FOR END_PCLIENTES'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_CADMOBILE=current_date;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_NOTAFISCAL_HIST_ESTMOTO FOR NOTAFISCA' +
          'L'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'begin'
        'if ((new.cod_nf > 0) and'
        
          '   ((coalesce(new.situacao_nfe, '#39#39') <> coalesce(old.situacao_nfe' +
          ','#39#39')) or'
        '   (coalesce(new.status, '#39#39') <> coalesce(old.status,'#39#39')))) then'
        ' begin'
        
          '     update hist_estmoto h set h.situacao_nfe = new.situacao_nfe' +
          ', h.status_nfe = new.status'
        '     where (trim(coalesce(h.tipo, '#39#39')) = '#39'NF'#39')'
        '     and (trim(coalesce(h.natureza, '#39#39')) = new.natureza_nf)'
        
          '     and h.numdoc = new.cod_nf and h.cod_empresa = new.cod_empre' +
          'sa;'
        ' end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_CODMTEST FOR EST_MOTO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        ' if (coalesce(new.codigo, 0) = 0) then'
        ' new.codigo = gen_id(INC_mt_EST,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PEDVENDA_SERV_TMO_SERV_OS FOR PEDVEND' +
          'A_SERV'
        'ACTIVE AFTER DELETE POSITION 0'
        'AS'
        'DECLARE VARIABLE  vregistros Integer;'
        'begin'
        ' if (USER = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        ' if (coalesce(trim(old.tipo), '#39#39') = '#39'OS'#39') then'
        ' begin'
        '   select count(*) from pedvenda_serv pd'
        
          '   where pd.nped = old.nped and pd.tipo = trim(old.tipo) and pd.' +
          'cod_empresa = old.cod_empresa'
        
          '   and pd.cod_servico = old.cod_servico and pd.cod_vendedor = ol' +
          'd.cod_vendedor'
        '   into vregistros;'
        ''
        '   if (coalesce(vregistros, 0) <= 0) then'
        '   begin'
        '       delete from tmo_serv_os tm'
        
          '       where tm.n_os = old.nped and tm.cod_vendedor = old.cod_ve' +
          'ndedor'
        
          '       and tm.cod_servico = old.cod_servico and tm.cod_empresa =' +
          ' old.cod_empresa;'
        '   end'
        ' end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_ESTOQUE_DIARIO_VEICULOS FOR EST_MOTO'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        'DECLARE VARIABLE  pveiculos char(1);'
        'DECLARE VARIABLE  pchassi char(20);'
        'begin'
        '  select trim(empresa.VERSAO_VEICULO) from empresa'
        '  where empresa.cod_empresa = new.cod_empresa'
        '  into :pveiculos;'
        ''
        '  if (USER = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        '  if (trim(pveiculos) <> '#39'4'#39') then'
        '   exit;'
        ''
        '  if ((inserting) or (updating)) then'
        '  begin'
        '    if (trim(coalesce(new.status_estoque, '#39#39')) = '#39#39') then'
        '     new.status_estoque = '#39'N'#39';'
        '    if (trim(coalesce(new.status_res, '#39#39')) = '#39#39') then'
        '     new.status_res = '#39'N'#39';'
        '    if (trim(coalesce(new.status_transdep, '#39#39')) = '#39#39') then'
        '     new.status_transdep = '#39'N'#39';'
        '    if (trim(coalesce(new.status_demonst, '#39#39')) = '#39#39') then'
        '     new.status_demonst = '#39'N'#39';'
        '    if (trim(coalesce(new.status_canc, '#39#39')) = '#39#39') then'
        '     new.status_canc = '#39'N'#39';'
        '    if (trim(coalesce(new.usado_troca, '#39#39')) = '#39#39') then'
        '     new.usado_troca = '#39'N'#39';'
        '  end'
        ''
        '  if (inserting) then'
        '  begin'
        '    if (trim(coalesce(new.status_estoque, '#39'N'#39')) = '#39'S'#39') then'
        '    begin'
        
          '      select first 1 coalesce(est.chassi, '#39#39') from estoque_diari' +
          'o est'
        
          '      where est.tipo = '#39'V'#39' and est.dia = current_date and est.ch' +
          'assi = new.chassi_c and est.cod_empresa = new.cod_empresa'
        '      into: pchassi;'
        ''
        '      if (trim(coalesce(pchassi, '#39#39')) = '#39#39') then'
        '      begin'
        
          '          INSERT INTO ESTOQUE_DIARIO (TIPO, SEQID, COD_EMPRESA, ' +
          'DIA, GRUPO_PROD, COD_PROD, COD_GRADE, CHASSI, ESTOQUE, CUSTO_MED' +
          'IO, SITUACAO)'
        
          '          VALUES ('#39'V'#39', (select cod from incrementa_codigo(new.co' +
          'd_empresa,'#39'ESTOQUE_DIARIO'#39')), new.cod_empresa, current_date, nul' +
          'l, null, null, new.chassi_c, 1, new.preco_custo_rep, new.status_' +
          'uso);'
        '      end'
        '      else'
        '      begin'
        '         UPDATE ESTOQUE_DIARIO SET ESTOQUE = 1'
        
          '         WHERE TIPO = '#39'V'#39' AND DIA = current_date AND CHASSI = ne' +
          'w.chassi_c  AND COD_EMPRESA = new.cod_empresa;'
        '      end'
        '    end'
        '  end'
        '  else if (updating) then'
        '  begin'
        
          '     select first 1 coalesce(est.chassi, '#39#39') from estoque_diario' +
          ' est'
        
          '     where est.tipo = '#39'V'#39' and est.dia = current_date and est.cha' +
          'ssi = new.chassi_c and est.cod_empresa = new.cod_empresa'
        '     into: pchassi;'
        ''
        
          '     if ((trim(coalesce(old.status_estoque, '#39'N'#39')) <> trim(coales' +
          'ce(new.status_estoque, '#39'N'#39')))'
        '     and (trim(coalesce(new.status_estoque, '#39'N'#39')) = '#39'S'#39')) then'
        '     begin'
        '        if (trim(coalesce(pchassi, '#39#39')) = '#39#39') then'
        '        begin'
        
          '           INSERT INTO ESTOQUE_DIARIO (TIPO, SEQID, COD_EMPRESA,' +
          ' DIA, GRUPO_PROD, COD_PROD, COD_GRADE, CHASSI, ESTOQUE, CUSTO_ME' +
          'DIO, SITUACAO)'
        
          '           VALUES ('#39'V'#39', (select cod from incrementa_codigo(new.c' +
          'od_empresa,'#39'ESTOQUE_DIARIO'#39')), new.cod_empresa, current_date, nu' +
          'll, null, null, new.chassi_c, 1, new.preco_custo_rep, new.status' +
          '_uso);'
        '        end'
        '        else'
        '        begin'
        '           UPDATE ESTOQUE_DIARIO SET ESTOQUE = 1'
        
          '           WHERE TIPO = '#39'V'#39' AND DIA = current_date AND CHASSI = ' +
          'new.chassi_c  AND COD_EMPRESA = new.cod_empresa;'
        '        end'
        '     end'
        
          '     else if ((trim(coalesce(old.status_estoque, '#39'N'#39')) <> trim(c' +
          'oalesce(new.status_estoque, '#39'N'#39')))'
        '     and (trim(coalesce(new.status_estoque, '#39'N'#39')) = '#39'N'#39')) then'
        '     begin'
        '        if (trim(coalesce(pchassi, '#39#39')) = '#39#39') then'
        '        begin'
        
          '           INSERT INTO ESTOQUE_DIARIO (TIPO, SEQID, COD_EMPRESA,' +
          ' DIA, GRUPO_PROD, COD_PROD, COD_GRADE, CHASSI, ESTOQUE, CUSTO_ME' +
          'DIO, SITUACAO)'
        
          '           VALUES ('#39'V'#39', (select cod from incrementa_codigo(new.c' +
          'od_empresa,'#39'ESTOQUE_DIARIO'#39')), new.cod_empresa, current_date, nu' +
          'll, null, null, new.chassi_c, 0, new.preco_custo_rep, new.status' +
          '_uso);'
        '        end'
        '        else'
        '        begin'
        '           UPDATE ESTOQUE_DIARIO SET ESTOQUE = 0'
        
          '           WHERE TIPO = '#39'V'#39' AND DIA = current_date AND CHASSI = ' +
          'new.chassi_c  AND COD_EMPRESA = new.cod_empresa;'
        '        end'
        '     end'
        ''
        '  end'
        '  else if (deleting) then'
        '  begin'
        '    if (trim(coalesce(old.status_estoque, '#39'N'#39')) = '#39'S'#39') then'
        '    begin'
        
          '      select first 1 coalesce(est.chassi, '#39#39') from estoque_diari' +
          'o est'
        
          '      where est.tipo = '#39'V'#39' and est.dia = current_date and est.ch' +
          'assi = old.chassi_c and est.cod_empresa = old.cod_empresa'
        '      into: pchassi;'
        ''
        '      if (trim(coalesce(pchassi, '#39#39')) = '#39#39') then'
        '      begin'
        
          '          INSERT INTO ESTOQUE_DIARIO (TIPO, SEQID, COD_EMPRESA, ' +
          'DIA, GRUPO_PROD, COD_PROD, COD_GRADE, CHASSI, ESTOQUE, CUSTO_MED' +
          'IO, SITUACAO)'
        
          '          VALUES ('#39'V'#39', (select cod from incrementa_codigo(old.co' +
          'd_empresa,'#39'ESTOQUE_DIARIO'#39')), old.cod_empresa, current_date, nul' +
          'l, null, null, old.chassi_c, 0, old.preco_custo_rep, new.status_' +
          'uso);'
        '      end'
        '      else'
        '      begin'
        '         UPDATE ESTOQUE_DIARIO SET ESTOQUE = 0'
        
          '         WHERE TIPO = '#39'V'#39' AND DIA = current_date AND CHASSI = ol' +
          'd.chassi_c AND COD_EMPRESA = old.cod_empresa;'
        '      end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER LANCAMENTOS_DESPESAS_VEIC FOR LANCAMENTO' +
          'S'
        'ACTIVE AFTER DELETE POSITION 0'
        'AS'
        'begin'
        '  if (old.COD_DESPESA > 0) then'
        '  begin'
        '    UPDATE DESPESAS_VEIC SET STATUS_DESPESA = NULL,'
        '     COD_LANC = NULL, DATA_PAGAMENTO = NULL'
        '     WHERE COD_DESPESA = old.COD_DESPESA'
        '     AND COD_EMPRESA = old.CODIGO_EMP;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER EST_MOTO_HIST FOR EST_MOTO'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        'begin'
        '  DELETE FROM HIST_ESTMOTO'
        
          '  WHERE CHASSI_C = old.CHASSI_C AND CODIGO = OLD.CODIGO AND COD_' +
          'EMPRESA = OLD.COD_EMPRESA;'
        ''
        '  DELETE FROM PENDENCIAS_VEIC'
        
          '  WHERE CHASSI_C = old.CHASSI_C AND CODIGO = OLD.CODIGO AND COD_' +
          'EMPRESA = OLD.COD_EMPRESA;'
        ''
        '  DELETE FROM DESPESAS_VEIC'
        
          '  WHERE CHASSI_C = old.CHASSI_C AND CODIGO = OLD.CODIGO AND COD_' +
          'EMPRESA = OLD.COD_EMPRESA;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER CONTAS_A_PAGAR_DESPESAS FOR CONTAS_A_PAG' +
          'AR'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        'DECLARE VARIABLE  vCodigoEmp Integer;'
        'DECLARE VARIABLE  vCodDespesa Integer;'
        'DECLARE VARIABLE  vObs char(3000);'
        'DECLARE VARIABLE  vDataVenc char(16);'
        
          'DECLARE VARIABLE  vValorCtpNovo double precision default 00000.0' +
          '0;'
        'DECLARE VARIABLE  vValorCtp double precision default 00000.00;'
        
          'DECLARE VARIABLE  vValorTotCtp double precision default 00000.00' +
          ';'
        'DECLARE VARIABLE  vDocCtp char(50);'
        'DECLARE VARIABLE  vDocCtpOrig char(50);'
        'DECLARE VARIABLE  vtotDocNQuitados Integer;'
        'DECLARE VARIABLE  vtotDocCtp Integer;'
        'begin'
        '   if (inserting) then'
        '     exit;'
        ''
        '   if (USER = '#39'REPL'#39') THEN'
        '     exit;'
        ''
        '   if (coalesce(old.cod_despesa, 0) <= 0) then'
        '    exit;'
        ''
        '   vCodDespesa = old.cod_despesa;'
        '   vCodigoEmp = old.codigo_emp;'
        '   vDocCtpOrig = trim(old.n_doc_ctp);'
        '   if (updating) then'
        '     vValorCtpNovo = new.valor_ctp;'
        '   else'
        '     vValorCtpNovo = old.valor_ctp;'
        '   vObs = '#39#39';'
        '   vValorTotCtp = 0;'
        ''
        
          '   for select (substring(cast(trim(n_doc_ctp) as varchar(50)) fr' +
          'om 1 for 50))'
        '      n_doc_ctp, valor_ctp,'
        
          '     (substring(cast(data_venc_ctp as varchar(50)) from 9 for 2)' +
          '||'#39'/'#39'||'
        
          '     substring(cast(data_venc_ctp as varchar(50)) from 6 for 2)|' +
          '|'#39'/'#39'||'
        
          '     substring(cast(data_venc_ctp as varchar(50)) from 1 for 4))' +
          ' data_venc_ctp from contas_a_pagar'
        '   where codigo_emp = :vCodigoEmp and cod_despesa = :vCodDespesa'
        '   into : vDocCtp, vValorCtp, vDataVenc do'
        '   begin'
        '     if (trim(vObs) = '#39#39') then'
        '     begin'
        '       if (trim(vDocCtp) = trim(vDocCtpOrig)) then'
        
          '         vObs = trim(vDocCtp) ||'#39'   '#39'|| trim(vDataVenc) ||'#39'   '#39'|' +
          '| '#39'R$ '#39'|| replace(cast(trunc(vValorCtpNovo, 4) as numeric(15,2))' +
          ', '#39'.'#39', '#39','#39');'
        '       else'
        
          '         vObs = trim(vDocCtp) ||'#39'   '#39'|| trim(vDataVenc) ||'#39'   '#39'|' +
          '| '#39'R$ '#39'|| replace(cast(trunc(vValorCtp, 4) as numeric(15,2)), '#39'.' +
          #39', '#39','#39');'
        '     end'
        '     else'
        '     begin'
        '       if (trim(vDocCtp) = trim(vDocCtpOrig)) then'
        '       begin'
        '         if (deleting) then'
        '           vObs = trim(vObs);'
        '         else'
        
          '           vObs = trim(vObs) || ascii_char(13) || trim(vDocCtp) ' +
          '||'#39'   '#39'|| trim(vDataVenc) ||'#39'   '#39'|| '#39'R$ '#39'|| replace(cast(trunc(v' +
          'ValorCtpNovo, 4) as numeric(15,2)), '#39'.'#39', '#39','#39');'
        '       end'
        '       else'
        
          '         vObs = trim(vObs) || ascii_char(13) || trim(vDocCtp) ||' +
          #39'   '#39'|| trim(vDataVenc) ||'#39'   '#39'|| '#39'R$ '#39'|| replace(cast(trunc(vVa' +
          'lorCtp, 4) as numeric(15,2)), '#39'.'#39', '#39','#39');'
        '     end'
        '     if (trim(vDocCtp) = trim(vDocCtpOrig)) then'
        '     begin'
        '      if (deleting) then'
        '        vValorTotCtp = trunc(vValorTotCtp, 4);'
        '      else'
        
          '        vValorTotCtp = trunc(vValorTotCtp, 4) + trunc(vValorCtpN' +
          'ovo, 4);'
        '     end'
        '     else'
        
          '       vValorTotCtp = trunc(vValorTotCtp, 4) + trunc(vValorCtp, ' +
          '4);'
        '   end'
        ''
        
          '   if ((coalesce(old.status_ctp, '#39#39') <> coalesce(new.status_ctp,' +
          ' '#39#39'))'
        
          '     or (coalesce(old.valor_ctp, 0) <> coalesce(new.valor_ctp, 0' +
          '))) then'
        '   begin'
        '       select count(*) tot_n_quitados from contas_a_pagar'
        
          '       where codigo_emp = :vCodigoEmp and cod_despesa = :vCodDes' +
          'pesa'
        '       and (coalesce(trim(status_ctp), '#39#39') <> '#39'QUITADO'#39')'
        '        into : vtotDocNQuitados;'
        '    '
        '       if (vtotDocNQuitados > 0) then'
        
          '         update despesas_veic d set d.valor_despesa = :vValorTot' +
          'Ctp,'
        
          '          d.obs = :vObs, d.status_despesa = '#39'PENDENTE'#39' where d.c' +
          'od_despesa = :vCodDespesa and d.cod_empresa = :vCodigoEmp;'
        '       else'
        
          '         update despesas_veic d set d.valor_despesa = :vValorTot' +
          'Ctp,'
        
          '          d.obs = :vObs, d.status_despesa = '#39'QUITADA'#39' where d.co' +
          'd_despesa = :vCodDespesa and d.cod_empresa = :vCodigoEmp;'
        '   end'
        ''
        '   if (deleting) then'
        '   begin'
        '       select count(*) tot_doc from contas_a_pagar'
        
          '       where codigo_emp = :vCodigoEmp and cod_despesa = :vCodDes' +
          'pesa'
        '        into : vtotDocCtp;'
        ''
        '      if (vtotDocCtp <= 0) then'
        '        delete from despesas_veic d'
        
          '        where d.cod_despesa = :vCodDespesa and d.cod_empresa = :' +
          'vCodigoEmp;'
        '   end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW POSICAOEST4('
        '    CHASSI,'
        '    DATA_CHEGADA,'
        '    MODELO,'
        '    COR,'
        '    ANO_FAB,'
        '    ANO_MOD,'
        '    CUSTO,'
        '    CILINDRADA,'
        '    CODIGO,'
        '    ORDTIPO,'
        '    DATA_VENDA,'
        '    COD_EMPRESA,'
        '    VALOR_REAL,'
        '    VALOR_A_REC,'
        '    VALOR_RECEBIDO,'
        '    DATA_HONDA,'
        '    COMANDO,'
        '    TIPO_VENDA,'
        '    RETORNO_DEMO,'
        '    ULT_DT_DEMO,'
        '    ULT_CANC_MT)'
        'AS'
        
          'select vn.chassiv,est.data_ch_nota,est.descricao_versaoest,est.c' +
          'orest,'
        'est.ano_fabest,est.ano_modest,est.preco_custo_rep,'
        
          'est.cilindradaest,tpm.codigo,tpm.ordtipo,vn.data_ven,vn.cod_empr' +
          'esa,vn.valor_real,vn.valor_a_rec,vn.VL_RQ_PG_CXL,est.data_ch_not' +
          'av,'
        'vn.n_comando,vn.tipo_v,'
        
          '(select max(ff.dtsituacao) from com_fat ff where ff.chassiv = vn' +
          '.chassiv and ff.cod_estmoto = vn.cod_estmoto and (ff.tipv_veicul' +
          'o = '#39'D'#39') and (trim(coalesce(ff.status_v, '#39#39')) = '#39'FECHADO'#39')),'
        
          '(select max(ff.data_ven) from com_fat ff where ff.chassiv = vn.c' +
          'hassiv and ff.cod_estmoto = vn.cod_estmoto and (ff.tipv_veiculo ' +
          '= '#39'D'#39') and (trim(coalesce(ff.status_v, '#39#39')) = '#39'FECHADO'#39')),'
        
          '(select max(ff.data_ven) from com_fat ff where ff.chassiv = vn.c' +
          'hassiv and ff.cod_estmoto = vn.cod_estmoto and (trim(coalesce(ff' +
          '.status_v, '#39#39')) = '#39'CANCELADO'#39'))'
        'from com_fat vn'
        
          'inner join est_moto est on est.chassi_c = vn.chassiv and est.cod' +
          'igo = vn.cod_estmoto and est.cod_empresa = vn.cod_empresa'
        
          'inner join tipmodelo tpm on tpm.codigo = est.versaoest and tpm.c' +
          'od_empresa = est.cod_empresa'
        
          'where vn.ativo = 1 and trim(coalesce(est.posicao, '#39#39')) <> '#39'MORTO' +
          #39' and coalesce(est.status_demonst, '#39'N'#39') = '#39'S'#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW ESTOQUELOJAVEIC4*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW COMPRASMESESV40('
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
        'where et.ativo = 1 and coalesce(nt.compra, '#39#39') <> '#39'N'#39
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
        
          'and coalesce(nt.compra, '#39#39') <> '#39'N'#39' and nf4.tipo_nf = '#39'V'#39' and nf4' +
          '.ativo=1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_PROD_CONF FOR PEDVENDA_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        'DECLARE VARIABLE  vnped Integer;'
        'DECLARE VARIABLE  vtipo char(3);'
        'DECLARE VARIABLE  vcod_empresa Integer;'
        'DECLARE VARIABLE  vgrupo_prod Integer;'
        'DECLARE VARIABLE  vcod_prod char(6);'
        'DECLARE VARIABLE  vnitem Integer;'
        'DECLARE VARIABLE  vcod_grade Integer;'
        'DECLARE VARIABLE  vquantConf double precision default 00000.00;'
        'DECLARE VARIABLE  vquantVnd double precision default 00000.00;'
        
          'DECLARE VARIABLE  vquantConfTemp double precision default 00000.' +
          '00;'
        'DECLARE VARIABLE  vconfTp char(1);'
        'DECLARE VARIABLE  vconfProd char(1);'
        'DECLARE VARIABLE  vTipV char(1);'
        'DECLARE VARIABLE  vtotvenda float;'
        'DECLARE VARIABLE  vtotprod float;'
        'DECLARE VARIABLE  vtotacresc float;'
        'DECLARE VARIABLE  vtotdesc float;'
        'DECLARE VARIABLE  valtEst char(1);'
        'DECLARE VARIABLE  vCodigoConf Integer;'
        'DECLARE VARIABLE  vStatusItem varchar(10);'
        'DECLARE VARIABLE  vOK smallint;'
        'DECLARE VARIABLE  vAbaterItens char(1);'
        'DECLARE VARIABLE  vNAbaterItens char(1);'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        '  select coalesce(emp.abater_itens, '#39#39') from empresa emp'
        '  where emp.cod_empresa = new.cod_empresa and emp.ativo = 1'
        '  into : vAbaterItens;'
        ''
        '  if (trim(vAbaterItens) <> '#39'S'#39') then'
        '   exit;'
        ''
        
          '  select coalesce(tp.usar_conferencia_produto, '#39#39') usar_conferen' +
          'cia_produto ,'
        
          '  coalesce(tp.n_usar_conferencia_produto, '#39#39') n_usar_conferencia' +
          '_produto , coalesce(pd.tipv, '#39#39') tipv from pedvenda pd'
        
          '  left join tipo_vendas tp on tp.sigla = pd.tipv and tp.tipo = n' +
          'ew.tipo'
        
          '  where pd.nped = new.nped and pd.tipo = new.tipo and pd.cod_emp' +
          'resa = new.cod_empresa and'
        '  pd.cod_vendedor = new.cod_vendedor and tp.ativo = 1'
        '  into : vconfTp, vNAbaterItens, vTipV;'
        ''
        '  if (trim(vNAbaterItens) = '#39'S'#39') then'
        '   exit;'
        ''
        '  vOK = 0;'
        '  vquantVnd = trunc(new.quant_ped_item, 4);'
        ''
        
          '  if ((inserting) and (upper(coalesce(trim(new.status), '#39#39')) = '#39 +
          'CANCELADO'#39') and (upper(coalesce(vconfTp, '#39#39')) <> '#39'S'#39')) then'
        '   exit;'
        ''
        
          '  if ((updating) and (upper(coalesce(trim(old.status), '#39#39')) = '#39'C' +
          'ANCELADO'#39') and (upper(coalesce(trim(new.status), '#39#39')) = '#39'CANCELA' +
          'DO'#39') and (upper(coalesce(vconfTp, '#39#39')) <> '#39'S'#39')) then'
        '   exit;'
        ''
        
          '  if (((updating) and (upper(coalesce(trim(new.status), '#39#39')) = '#39 +
          #39') and (old.cod_vendedor <> new.cod_vendedor) and (upper(coalesc' +
          'e(vconfTp, '#39#39')) <> '#39'S'#39'))'
        
          '   or ((updating) and (upper(coalesce(trim(new.status), '#39#39')) = '#39 +
          #39') and (old.quant_ped_item <> new.quant_ped_item) and (upper(coa' +
          'lesce(vconfTp, '#39#39')) <> '#39'S'#39'))'
        
          '   or ((updating) and (upper(coalesce(trim(new.status), '#39#39')) = '#39 +
          'CANCELADO'#39') and (old.quant_ped_item = new.quant_ped_item) and (u' +
          'pper(coalesce(vconfTp, '#39#39')) <> '#39'S'#39'))'
        
          '   or ((deleting) and (upper(coalesce(vconfTp, '#39#39')) <> '#39'S'#39'))) th' +
          'en'
        '  begin'
        '     vOK = 1;'
        
          '     if ((old.tipo = '#39'REQ'#39') and (upper(coalesce(vconfTp, '#39#39')) <>' +
          ' '#39'S'#39'))  then'
        '     begin'
        
          '        for select pdc.nped_conf, pdc.tipo_conf, pdc.nitem_conf,' +
          ' sum(pdc.quant) quant,'
        '            pdc.cod_empresa from pedvenda_prod_conf pdc'
        
          '            inner join pedvenda pd on pd.nped = pdc.nped_conf an' +
          'd pd.tipo = pdc.tipo_conf and pd.cod_empresa = pdc.cod_empresa'
        
          '            where coalesce(pd.status_ped, '#39#39') = '#39#39' and pdc.nped ' +
          '= old.nped and pdc.tipo = old.tipo and pdc.nitem = old.nitem and' +
          ' pdc.cod_empresa = old.cod_empresa'
        '            and pdc.cod_vendedor = old.cod_vendedor'
        
          '            group by pdc.nped, pdc.tipo, pdc.nitem, pdc.nped_con' +
          'f, pdc.tipo_conf, pdc.nitem_conf, pdc.cod_empresa'
        
          '         into : vnped, vtipo, vnitem, vquantConfTemp, vcod_empre' +
          'sa do'
        '        begin'
        '           if (coalesce(vnped, 0) > 0) then'
        '           begin'
        
          '             select trunc(coalesce(pdi.quant_ped_item, 0), 4), p' +
          'di.status from pedvenda_prod pdi'
        
          '             where pdi.nped = :vnped and pdi.tipo = :vtipo and p' +
          'di.cod_empresa = :vcod_empresa'
        
          '             and pdi.nitem = :vnitem and pdi.grupo_prod = old.gr' +
          'upo_prod and pdi.cod_prod = old.cod_prod and pdi.cod_grade = old' +
          '.cod_grade'
        '               into: vquantConf, vStatusItem;'
        ''
        
          '             if (upper(coalesce(trim(vStatusItem) , '#39#39')) = '#39'CANC' +
          'ELADO'#39') then'
        '               vquantConf = vquantConfTemp;'
        '             else'
        '               vquantConf = vquantConfTemp + vquantConf;'
        ''
        '             update pedvenda_prod pdi set pdi.status = Null,'
        
          '              pdi.nped_conf = Null, pdi.tipo_conf = Null, pdi.ni' +
          'tem_conf = Null,'
        '              pdi.quant_ped_item = (:vquantConf),'
        
          '              pdi.vltot_ped_item = (:vquantConf * old.vlun_ped_i' +
          'tem),'
        '              pdi.vltot_ped_nf = (:vquantConf * old.vlun_ped_nf)'
        
          '             where pdi.nped = :vnped and pdi.tipo = :vtipo and p' +
          'di.cod_empresa = :vcod_empresa'
        
          '             and pdi.nitem = :vnitem and pdi.grupo_prod = old.gr' +
          'upo_prod and pdi.cod_prod = old.cod_prod and pdi.cod_grade = old' +
          '.cod_grade;'
        ''
        '             delete from pedvenda_prod_conf pdc'
        
          '             where  pdc.nped = old.nped and pdc.tipo = old.tipo ' +
          'and pdc.nitem = old.nitem and'
        '              pdc.cod_empresa = old.cod_empresa;'
        ''
        
          '            select (sum(coalesce(pdi.quant_ped_item, 0) * coales' +
          'ce(pdi.vlun_ped_item, 0)) + sum(coalesce(pdi.acresc_item, 0)) - ' +
          'sum(coalesce(pdi.desc_item, 0))) as totovenda,'
        
          '            (sum(coalesce(pdi.quant_ped_item, 0) * coalesce(pdi.' +
          'vlun_ped_item, 0))) as totprod,'
        
          '            (sum(coalesce(pdi.rateio_acresc, 0))) as acrescimo, ' +
          '(sum(coalesce(pdi.rateio_desc, 0))) as desconto from pedvenda_pr' +
          'od pdi'
        
          '            where pdi.nped = :vnped and pdi.tipo = :vtipo and pd' +
          'i.cod_empresa = :vcod_empresa and (coalesce(pdi.status, '#39#39') = '#39#39 +
          ')'
        '            into: vtotvenda, vtotprod, vtotacresc, vtotdesc;'
        '        '
        
          '            update pedvenda pd set pd.valor_total = :vtotvenda, ' +
          'pd.tot_prod = :vtotprod, pd.acrescimo = :vtotacresc, pd.desconto' +
          ' = :vtotdesc'
        
          '            where pd.nped = :vnped and pd.tipo = :vtipo and pd.c' +
          'od_empresa = :vcod_empresa;'
        '           end'
        '        end'
        '        if ((deleting) and (coalesce(vnped, 0) > 0)) then'
        '        begin'
        
          '           select (sum(coalesce(pdi.quant_ped_item, 0) * coalesc' +
          'e(pdi.vlun_ped_item, 0)) + sum(coalesce(pdi.acresc_item, 0)) - s' +
          'um(coalesce(pdi.desc_item, 0))) as totovenda,'
        
          '             (sum(coalesce(pdi.quant_ped_item, 0) * coalesce(pdi' +
          '.vlun_ped_item, 0))) as totprod,'
        
          '             (sum(coalesce(pdi.rateio_acresc, 0))) as acrescimo,' +
          ' (sum(coalesce(pdi.rateio_desc, 0))) as desconto from pedvenda_p' +
          'rod pdi'
        
          '           where pdi.nped = new.nped and pdi.tipo = new.tipo and' +
          ' pdi.cod_empresa = :vcod_empresa and (coalesce(pdi.status, '#39#39') =' +
          ' '#39#39')'
        '           into: vtotvenda, vtotprod, vtotacresc, vtotdesc;'
        ''
        
          '           update pedvenda pd set pd.valor_total = :vtotvenda, p' +
          'd.tot_prod = :vtotprod, pd.acrescimo = :vtotacresc, pd.desconto ' +
          '= :vtotdesc'
        
          '           where pd.nped = old.nped and pd.tipo = old.tipo and p' +
          'd.cod_empresa = :vcod_empresa;'
        '        end'
        '     end'
        '  end'
        '  if ((inserting) or ((updating) and (vOk = 1))) then'
        '  begin'
        
          '    if ((new.tipo = '#39'REQ'#39') and (upper(coalesce(vconfTp, '#39#39')) <> ' +
          #39'S'#39'))  then'
        '    begin'
        '       while (trunc(vquantVnd, 4) > 0) do'
        '       begin'
        
          '         if ((updating) and (upper(coalesce(trim(new.status), '#39#39 +
          ')) = '#39'CANCELADO'#39')) then'
        '          break;'
        ''
        
          '         select first 1 tp.usar_conferencia_produto, pdi.nped, p' +
          'di.tipo, pdi.cod_empresa, pdi.grupo_prod, pdi.cod_prod, pdi.nite' +
          'm, pdi.cod_grade, pdi.quant_ped_item, coalesce(pdi.status,'#39#39') st' +
          'atus   from pedvenda pd'
        
          '         inner join pedvenda_prod pdi on pdi.nped = pd.nped and ' +
          'pdi.tipo = pd.tipo and pdi.cod_empresa = pd.cod_empresa'
        
          '         left join tipo_vendas tp on tp.sigla = pd.tipv and tp.t' +
          'ipo = pd.tipo'
        
          '         where coalesce(pd.status_ped, '#39#39') = '#39#39' and (coalesce(pd' +
          'i.status, '#39#39') = '#39#39') and (coalesce(tp.usar_conferencia_produto, '#39 +
          #39') = '#39'S'#39')'
        
          '         and pdi.grupo_prod = new.grupo_prod and pdi.cod_prod = ' +
          'new.cod_prod and pd.tipo = new.tipo and pd.cod_empresa = new.cod' +
          '_empresa'
        
          '         and pdi.cod_grade = new.cod_grade and pd.cod_vendedor =' +
          ' new.cod_vendedor'
        '         order by pd.nped, pd.tipo, pd.cod_empresa'
        
          '         into : vconfProd, vnped, vtipo, vcod_empresa, vgrupo_pr' +
          'od, vcod_prod, vnitem, vcod_grade, vquantConf, vStatusItem;'
        ''
        
          '         select coalesce(pdi.status,'#39#39') status from pedvenda_pro' +
          'd pdi'
        
          '         where pdi.nped = :vnped and pdi.tipo = :vtipo and pdi.c' +
          'od_empresa = :vcod_empresa'
        
          '                 and pdi.grupo_prod = :vgrupo_prod and pdi.cod_p' +
          'rod = :vcod_prod and pdi.nitem = :vnitem and pdi.cod_grade = :vc' +
          'od_grade'
        '         into vStatusItem;'
        ''
        '         if (trim(vStatusItem) = '#39'CANCELADO'#39') then'
        '          break;'
        ''
        '        if (upper(vconfProd) = '#39'S'#39') then'
        '        begin'
        
          '          if ((coalesce(vnped, 0) > 0) and (vtipo = new.tipo) an' +
          'd (vcod_empresa = new.cod_empresa)'
        
          '            and (vgrupo_prod = new.grupo_prod) and (vcod_prod = ' +
          'new.cod_prod) and (vcod_grade = new.cod_grade)) then'
        '          begin'
        
          '             if (trunc(vquantVnd, 4) >= trunc(vquantConf, 4)) th' +
          'en'
        '             begin'
        '               vquantConfTemp = trunc(vquantConf, 4);'
        ''
        
          '               update pedvenda_prod pdi set pdi.status = '#39'CANCEL' +
          'ADO'#39','
        
          '                 pdi.nped_conf = new.nped, pdi.tipo_conf = new.t' +
          'ipo, pdi.nitem_conf = new.nitem'
        
          '               where pdi.nped = :vnped and pdi.tipo = :vtipo and' +
          ' pdi.cod_empresa = :vcod_empresa'
        
          '               and pdi.grupo_prod = :vgrupo_prod and pdi.cod_pro' +
          'd = :vcod_prod and pdi.nitem = :vnitem and pdi.cod_grade = :vcod' +
          '_grade;'
        ''
        
          '               insert into pedvenda_prod_conf (codigo, nped, tip' +
          'o, nitem, cod_empresa, quant, nped_conf, nitem_conf, tipo_conf, ' +
          'cod_vendedor, tipv)'
        
          '               values ((select cod from incrementa_codigo(new.co' +
          'd_empresa, '#39'PRODUTOS_PROD_CONF'#39')), new.nped, new.tipo, new.nitem' +
          ', new.cod_empresa, :vquantConfTemp, :vnped, :vnitem, :vtipo, new' +
          '.cod_vendedor, :vTipV);'
        ''
        
          '               vquantVnd = trunc(vquantVnd, 4) -  trunc(vquantCo' +
          'nf, 4);'
        '             end'
        '             else'
        '             begin'
        '               vquantConfTemp = trunc(vquantVnd, 4);'
        ''
        
          '               update pedvenda_prod pdi set pdi.quant_ped_item =' +
          ' (:vquantConf - :vquantVnd),'
        
          '                 pdi.vltot_ped_item = ((:vquantConf - :vquantVnd' +
          ') * new.vlun_ped_item),'
        
          '                 pdi.vltot_ped_nf = ((:vquantConf - :vquantVnd) ' +
          '* new.vlun_ped_nf),'
        
          '                 pdi.nped_conf = new.nped, pdi.tipo_conf = new.t' +
          'ipo, pdi.nitem_conf = new.nitem'
        
          '               where pdi.nped = :vnped and pdi.tipo = :vtipo and' +
          ' pdi.cod_empresa = :vcod_empresa'
        
          '               and pdi.grupo_prod = :vgrupo_prod and pdi.cod_pro' +
          'd = :vcod_prod and pdi.nitem = :vnitem and pdi.cod_grade = :vcod' +
          '_grade;'
        ''
        
          '               insert into pedvenda_prod_conf (codigo, nped, tip' +
          'o, nitem, cod_empresa, quant, nped_conf, nitem_conf, tipo_conf, ' +
          'cod_vendedor, tipv)'
        
          '               values ((select cod from incrementa_codigo(new.co' +
          'd_empresa, '#39'PRODUTOS_PROD_CONF'#39')), new.nped, new.tipo, new.nitem' +
          ', new.cod_empresa, :vquantConfTemp, :vnped, :vnitem, :vtipo, new' +
          '.cod_vendedor, :vTipV);'
        ''
        '               vquantVnd = 0;'
        '             end'
        
          '             select (sum(coalesce(pdi.quant_ped_item, 0) * coale' +
          'sce(pdi.vlun_ped_item, 0)) + sum(coalesce(pdi.acresc_item, 0)) -' +
          ' sum(coalesce(pdi.desc_item, 0))) as totovenda,'
        
          '               (sum(coalesce(pdi.quant_ped_item, 0) * coalesce(p' +
          'di.vlun_ped_item, 0))) as totprod,'
        
          '               (sum(coalesce(pdi.rateio_acresc, 0))) as acrescim' +
          'o, (sum(coalesce(pdi.rateio_desc, 0))) as desconto from pedvenda' +
          '_prod pdi'
        
          '             where pdi.nped = :vnped and pdi.tipo = :vtipo and p' +
          'di.cod_empresa = :vcod_empresa and (coalesce(pdi.status, '#39#39') = '#39 +
          #39')'
        '             into: vtotvenda, vtotprod, vtotacresc, vtotdesc;'
        '        '
        
          '             update pedvenda pd set pd.valor_total = :vtotvenda,' +
          ' pd.tot_prod = :vtotprod, pd.acrescimo = :vtotacresc, pd.descont' +
          'o = :vtotdesc'
        
          '             where pd.nped = :vnped and pd.tipo = :vtipo and pd.' +
          'cod_empresa = :vcod_empresa;'
        '          end'
        '        end'
        '        else'
        '         break;'
        '      end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_ITEM_PEDIDO_BI_STATUS_PED FOR ITEM_PE' +
          'DIDO'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        '  declare variable vnum_ped integer;'
        '  declare variable vstatus_ped char(10);'
        'begin'
        ''
        '  select status_ped from pedido'
        
          '    where num_ped = new.num_ped and cod_empresa = new.cod_empres' +
          'a'
        '      into :vstatus_ped;'
        ''
        
          '   if ((new.recebido = '#39'S'#39') and (rtrim(vstatus_ped) = '#39'EFETIVADO' +
          #39')) then'
        '   begin'
        '     select first 1 num_ped from item_pedido'
        
          '       where num_ped = new.num_ped and cod_empresa = new.cod_emp' +
          'resa and'
        
          '       ((grupo_prod <> new.grupo_prod) or (cod_prod <> new.cod_p' +
          'rod) or (nitem <> new.nitem) ) and coalesce(recebido, '#39#39') <> '#39'S'#39
        '         into :vnum_ped;'
        '     if (coalesce(vnum_ped, 0) = 0) then'
        '     begin'
        
          '       update pedido set status_ped = '#39'RECEBIDO'#39', data_chg_ped =' +
          ' current_date'
        
          '         where num_ped = new.num_ped and cod_empresa = new.cod_e' +
          'mpresa;'
        '     end'
        '   end'
        
          '   else if ((new.recebido <> '#39'S'#39') and (rtrim(vstatus_ped) = '#39'REC' +
          'EBIDO'#39')) then'
        '   begin'
        
          '     update pedido set status_ped = '#39'EFETIVADO'#39', data_chg_ped = ' +
          'null'
        
          '       where num_ped = new.num_ped and cod_empresa = new.cod_emp' +
          'resa;'
        '   end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_ITEM_PEDIDO_NF_REC_BIUD_QT_R FOR ITEM' +
          '_PEDIDO_NF_REC'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  declare variable vqtde_ped T_D_QUANT;'
        '  declare variable vqtde_recebida T_D_QUANT;'
        '  declare variable vgrupo_prod integer;'
        '  declare variable vcod_prod char(6);'
        '  declare variable vnum_ped integer;'
        '  declare variable vcod_empresa integer;'
        '  declare variable vnitem integer;'
        '  declare variable vcod_nf integer;'
        '  declare variable vnitem_nf integer;'
        'begin'
        ''
        '  if ((inserting) or (updating)) then'
        '  begin'
        '    vgrupo_prod = new.grupo_prod;'
        '    vcod_prod = new.cod_prod;'
        '    vnum_ped = new.num_ped;'
        '    vcod_empresa = new.cod_empresa;'
        '    vnitem = new.nitem;'
        '    vcod_nf = new.cod_nf;'
        '    vnitem_nf = new.nitem_nf;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        '    vgrupo_prod = old.grupo_prod;'
        '    vcod_prod = old.cod_prod;'
        '    vnum_ped = old.num_ped;'
        '    vcod_empresa = old.cod_empresa;'
        '    vnitem = old.nitem;'
        '    vcod_nf = old.cod_nf;'
        '    vnitem_nf = old.nitem_nf;'
        '  end'
        ''
        '  select sum(qtde_recebida) from item_pedido_nf_rec'
        '    where num_ped = :vnum_ped and grupo_prod = :vgrupo_prod and'
        '    cod_prod = :vcod_prod and cod_empresa = :vcod_empresa and'
        
          '    nitem = :vnitem and ((cod_nf <> :vcod_nf) or (nitem_nf <> :v' +
          'nitem_nf))'
        '      into :vqtde_recebida;'
        ''
        '  select sum(quant_it_prod) quant_it_prod from item_pedido'
        '    where num_ped = :vnum_ped and grupo_prod = :vgrupo_prod and'
        '    cod_prod = :vcod_prod and cod_empresa = :vcod_empresa and'
        '    nitem = :vnitem'
        '      into :vqtde_ped;'
        ''
        '  if ((inserting) or (updating)) then'
        '  begin'
        
          '    vqtde_recebida = coalesce(vqtde_recebida, 0) + new.qtde_rece' +
          'bida;'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '    vqtde_recebida = coalesce(vqtde_recebida, 0) - old.qtde_rece' +
          'bida;'
        '  end'
        ''
        
          '  if (coalesce(vqtde_ped, 0) <= coalesce(vqtde_recebida, 0)) the' +
          'n'
        '  begin'
        '    update item_pedido set recebido = '#39'S'#39
        
          '      where num_ped = :vnum_ped and grupo_prod = :vgrupo_prod an' +
          'd'
        '      cod_prod = :vcod_prod and cod_empresa = :vcod_empresa and'
        '      nitem = :vnitem and coalesce(recebido, '#39#39') <> '#39'S'#39';'
        '  end'
        
          '  else if (coalesce(vqtde_ped, 0) > coalesce(vqtde_recebida, 0))' +
          ' then'
        '  begin'
        '    update item_pedido set recebido = '#39'N'#39
        
          '      where num_ped = :vnum_ped and grupo_prod = :vgrupo_prod an' +
          'd'
        '      cod_prod = :vcod_prod and cod_empresa = :vcod_empresa and'
        '      nitem = :vnitem and coalesce(recebido, '#39#39') = '#39'S'#39';'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INC_TIPO_VENDAS FOR TIPO_VENDAS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   IF (NEW.COD_TIPO IS NULL) THEN'
        '     NEW.COD_TIPO = GEN_ID(GEN_TIPO_VENDAS,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NOTAFISCAL_DEL_CONTAS_A_PAG FOR NOTAFISC' +
          'AL'
        'ACTIVE BEFORE DELETE POSITION 0'
        'as'
        'begin'
        
          '  if ((old.natureza_nf = '#39'E'#39') and (old.emissao_propria = '#39'N'#39')) t' +
          'hen'
        '  begin'
        
          '    delete from contas_a_pagar where num_nota_nfe = old.num_nf a' +
          'nd'
        
          '      cod_forn_nfe = old.cod_cliente and codigo_emp = old.cod_em' +
          'presa and'
        '      (( status_ctp <> '#39'QUITADO'#39' ) or ( status_ctp is null ));'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_RETORNO_TIPO_VENDA ('
        '    PTIPO char(3),'
        '    PCAMPOPESQUISA varchar(10))'
        'returns ('
        '    RETORNO char(1))'
        'as'
        'declare variable VVENDA char(1);'
        'begin'
        '  if (ptipo = '#39'REQ'#39') then'
        '  begin'
        '    select venda from tipo_vendas'
        
          '      where tipo = :ptipo and sigla = substring(:pcampopesquisa ' +
          'from 1 for 1) and ativo = 1'
        '      into :vvenda;'
        ''
        '  end'
        '  else if (rtrim(ptipo) = '#39'OS'#39') then'
        '  begin'
        '    '
        '    select venda from tipo_vendas'
        
          '      where tipo = :ptipo and tipo_os = :pcampopesquisa and ativ' +
          'o = 1'
        '      into :vvenda;'
        ''
        '  end'
        '  '
        '  retorno = '#39'N'#39';'
        '  if ( ltrim(rtrim(vvenda))  <> '#39#39' ) then'
        '    retorno = ltrim(rtrim(vvenda));'
        ''
        '  suspend;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW DEMANDAP4('
        '    TIPO,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    VMES,'
        '    VANO,'
        '    VQT,'
        '    DATA_OS_RQ,'
        '    TIPO_D,'
        '    TIPO_O,'
        '    NDOC,'
        '    ATIVO,'
        '    COD_EMPRESA,NITEM)'
        'as'
        'select p.tipo, pp.grupo_prod,pp.cod_prod,'
        'extract(month from p.data_fech),extract(year from p.data_fech),'
        
          'pp.quant_ped_item,p.data_fech,p.tipv,p.tipor,p.nped,p.ativo,p.co' +
          'd_empresa,pp.nitem'
        'from pedvenda p'
        
          'inner join pedvenda_prod pp on p.nped = pp.nped and p.cod_empres' +
          'a = pp.cod_empresa and p.tipo = pp.tipo'
        
          'where coalesce(p.status_ped,'#39#39')<>'#39'CANCELADO'#39' and (pp.status is n' +
          'ull or pp.status = '#39#39') and (p.status_ped <> '#39#39' and not p.status_' +
          'ped is null) and p.ativo = 1 and'
        'pp.ativo = 1 and ((p.tipo = '#39'OS'#39'  and'
        
          '(select retorno from sp_retorno_tipo_venda(p.tipo, p.tipo_os)) =' +
          ' '#39'S'#39')'
        
          'or (p.tipo = '#39'REQ'#39' and (select retorno from sp_retorno_tipo_vend' +
          'a(p.tipo, p.tipv)) = '#39'S'#39'))'
        'union'
        
          'select '#39'VPR'#39',vnp.grupo_prod,vnp.cod_prod, extract(month from vnp' +
          '.data_vnp),'
        
          'extract(year from vnp.data_vnp),vnp.quant_prod_vp,vnp.data_vnp,'#39 +
          'E'#39','#39'E'#39',0,vnp.ativo,vnp.cod_empresa,0 from'
        
          'venda_perdida vnp,tipovp tp where vnp.codigo_vp = tp.codigo_vp a' +
          'nd tp.ent_sug_vp = '#39'S'#39' and tp.cod_empresa = vnp.cod_empresa and ' +
          'vnp.ativo=1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW DEMANDAPGERAL4('
        '    TIPO,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    VMES,'
        '    VANO,'
        '    VQT,'
        '    DATA_OS_RQ,'
        '    TIPO_D,'
        '    TIPO_O,'
        '    NDOC,'
        '    ATIVO,'
        '    COD_EMPRESA,'
        '    NITEM)'
        'AS'
        'select p.tipo, pp.grupo_prod,pp.cod_prod,'
        'extract(month from p.data_fech),extract(year from p.data_fech),'
        
          'pp.quant_ped_item,p.data_fech,p.tipv,p.tipor,p.nped,p.ativo,p.co' +
          'd_empresa,pp.nitem'
        'from pedvenda p'
        
          'inner join pedvenda_prod pp on p.nped = pp.nped and p.cod_empres' +
          'a = pp.cod_empresa and p.tipo = pp.tipo'
        
          'where coalesce(p.status_ped,'#39#39')<>'#39'CANCELADO'#39' and (pp.status is n' +
          'ull or pp.status = '#39#39') and (p.status_ped <> '#39#39' and not p.status_' +
          'ped is null) and p.ativo = 1 and'
        'pp.ativo = 1 and ((p.tipo = '#39'OS'#39') or (p.tipo = '#39'REQ'#39'))'
        'union'
        
          'select '#39'VPR'#39',vnp.grupo_prod,vnp.cod_prod, extract(month from vnp' +
          '.data_vnp),'
        
          'extract(year from vnp.data_vnp),vnp.quant_prod_vp,vnp.data_vnp,'#39 +
          'E'#39','#39'E'#39',0,vnp.ativo,vnp.cod_empresa,0 from'
        
          'venda_perdida vnp,tipovp tp where vnp.codigo_vp = tp.codigo_vp a' +
          'nd tp.ent_sug_vp = '#39'S'#39' and tp.cod_empresa = vnp.cod_empresa and ' +
          'vnp.ativo=1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW FICHAVENDAPROD4('
        '    TP,'
        '    NOME_CLIENTE,'
        '    NDOC,'
        '    VALOR,'
        '    DATA,'
        '    DATA_FECH,'
        '    DESCR_PROD,'
        '    NUM_FAB_PROD,'
        '    QTDE,'
        '    VL_UNIT,'
        '    VL_TOT,'
        '    COD_CLIENTE,'
        '    COD_EMPRESA,'
        '    COD_PROD,'
        '    GRUPO_PROD,'
        '    TIPOVENDA,'
        '    TIPOOS,'
        '    DESCRICAOGRADE,'
        '    N_ITEM,'
        '    STATUS_PED)'
        'AS'
        
          'select pv.Tipo,cl.nome_cliente, pv.nped, pv.valor_total, pv.data' +
          '_ped, pv.data_fech, pvp.descr_prod_ped,'
        
          'pvp.num_fab_prod, pvp.quant_ped_item, pvp.vlun_ped_item, pvp.vlt' +
          'ot_ped_item,'
        
          'pv.cod_cliente, pv.cod_empresa, P.cod_prod, p.grupo_prod,pv.tipv' +
          ',pv.tipo_os,gr.descricao,pvp.nitem,pv.status_ped'
        'from pedvenda pv'
        
          'inner join pedvenda_prod pvp on pvp.nped = pv.nped and pvp.cod_e' +
          'mpresa = pv.cod_empresa and pvp.tipo = pv.tipo'
        'and (pvp.status is null or pvp.status = '#39#39')'
        
          'left join grade gr on pvp.cod_grade = gr.cod_grade and gr.cod_em' +
          'presa = pvp.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl' +
          '.cod_empresa = pv.cod_empresa'
        
          'inner join produtos p on p.cod_prod = pvp.cod_prod and p.grupo_p' +
          'rod = pvp.grupo_prod and p.cod_empresa = pvp.cod_empresa'
        'where pv.ativo = 1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VENDASMESES4('
        '    TIPO,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    VMES,'
        '    VANO,'
        '    VQT,'
        '    VTOT_VENDA,'
        '    DATA_OS_RQ,'
        '    NDOC,'
        '    COD_CLIENTE,'
        '    COD_PPS,'
        '    SUB_G_PROD,'
        '    TIP_PROD_IND,'
        '    DESCONTO,'
        '    CUSTOMC,'
        '    CUSTOMR,'
        '    ATIVO,'
        '    COD_EMPRESA,'
        '    NITEM,'
        '    TIPV)'
        'AS'
        'select p.tipo,pp.grupo_prod,pp.cod_prod,'
        'extract(month from p.data_fech),extract(year from p.data_fech),'
        
          'pp.quant_ped_item,pp.vltot_ped_item,p.data_fech,p.nped,p.cod_cli' +
          'ente,'
        'pr.cod_pps, pr.sub_g_prod,pr.tip_prod_ind,pp.rateio_desc,'
        
          '(pp.quant_ped_item * pp.pcust_mc),(pp.quant_ped_item * pp.pcust_' +
          'mr),pp.ATIVO,p.COD_EMPRESA,pp.nitem,p.tipv'
        
          'from pedvenda p,pedvenda_prod pp,produtos pr where pp.nped = p.n' +
          'ped and pp.cod_empresa = p.cod_empresa and pp.tipo = p.tipo'
        
          'and (pp.status is null or pp.status = '#39#39') and pp.grupo_prod = pr' +
          '.grupo_prod and pp.cod_prod = pr.cod_prod and pp.cod_empresa = p' +
          'r.cod_empresa'
        
          'and ((p.tipo = '#39'OS'#39' and (select retorno from sp_retorno_tipo_ven' +
          'da(p.tipo, p.tipo_os)) = '#39'S'#39') or'
        
          '(p.tipo = '#39'REQ'#39' and (select retorno from sp_retorno_tipo_venda(p' +
          '.tipo, p.tipv)) = '#39'S'#39'))'
        'and (p.status_ped <> '#39#39' or not p.status_ped is null)'
        'and p.ativo = 1 order by 2,3;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VENDASMESESOS4('
        '    TIPO,'
        '    VMES,'
        '    VANO,'
        '    VQT,'
        '    VTOT_VENDA,'
        '    DATA_OS_RQ,'
        '    NDOC,'
        '    COD_CLIENTE,'
        '    DESCONTO,'
        '    MECANICO,'
        '    DATA_ABERTURA,'
        '    VALOR_PAGOHND,NITEM)'
        'as'
        
          'select '#39'PC'#39',extract(month from os.data_fech),extract(year from o' +
          's.data_fech),'
        
          'ost.quant_ped_item,ost.vltot_ped_item,os.data_fech,os.nped,os.co' +
          'd_cliente,'
        
          'ost.rateio_desc,ost.col_cod_vendedor,os.data_ped,cast('#39'0.00'#39' as ' +
          'double precision),ost.nitem'
        'from pedvenda os,pedvenda_prod ost'
        
          'where ost.nped = os.nped and ost.tipo = os.tipo and ost.cod_empr' +
          'esa ='
        
          'os.cod_empresa and (ost.status is null or ost.status = '#39#39') and o' +
          's.status_ped = '#39'FECHADA'#39
        'and (os.tipo = '#39'OS'#39' and'
        
          '(select retorno from sp_retorno_tipo_venda(os.tipo, os.tipo_os))' +
          ' = '#39'S'#39')'
        'union'
        
          'select '#39'SS'#39',extract(month from os.data_fech),extract(year from o' +
          's.data_fech),'
        
          'oss.quant_serv_ped,oss.valor_tot_serv,os.data_fech,os.nped,os.co' +
          'd_cliente,'
        
          'oss.rateio_desc,oss.cod_vendedor,os.data_ped,oss.prc_int_serv,os' +
          's.nitem'
        'from pedvenda os,pedvenda_serv oss'
        
          'where oss.nped = os.nped and oss.tipo = os.tipo and oss.cod_empr' +
          'esa ='
        
          'os.cod_empresa and (oss.status is null or oss.status = '#39#39')  and ' +
          'os.status_ped = '#39'FECHADA'#39
        'and (os.tipo = '#39'OS'#39' and'
        
          '(select retorno from sp_retorno_tipo_venda(os.tipo, os.tipo_os))' +
          ' = '#39'S'#39');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VENDASPCLIENTES4('
        '    TIPO,'
        '    N_DOC,'
        '    DATA_VENDA,'
        '    COD_CLIENTE,'
        '    COD_EMPRESA)'
        'as'
        'select p.tipo, p.nped,p.data_fech, p.cod_cliente,p.cod_empresa'
        'from pedvenda p where p.ativo = 1 and'
        'p.status_ped <> '#39#39' and not p.status_ped is null and'
        
          '((p.tipo = '#39'OS'#39' and (select retorno from sp_retorno_tipo_venda(p' +
          '.tipo, p.tipo_os)) = '#39'S'#39') or'
        
          '(p.tipo = '#39'REQ'#39' and (select retorno from sp_retorno_tipo_venda(p' +
          '.tipo, p.tipv)) = '#39'S'#39')) and p.ativo = 1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW PROD_SERV_EMVENDAS('
        '    COD_EMPRESA,'
        '    DATA_FECH,'
        '    NPED,'
        '    TIPO,'
        '    NITEM,'
        '    PROD_SERV,'
        '    GRUPOP_CODSERV,'
        '    COD_PROD,'
        '    QUANT_PED_ITEM,'
        '    VLUN_PED_ITEM,'
        '    VLTOT_PED_ITEM,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    PCUST_MC,'
        '    DESCR_ITEM_PED,'
        '    COMISS_PROD,'
        '    COMISS_PROD_GER,'
        '    N_NF,'
        '    DESCRICAO,'
        '    SIGLA,'
        '    TIPO_OS,'
        '    NOME_VENDEDOR,'
        '    COD_VENDEDOR,'
        '    COL_COD_VENDEDOR,'
        '    PC_VEND_SERV,'
        '    PC_VEND_PROD,'
        '    COD_FUNCAO,'
        '    DESC_FUNCAO,'
        '    VENDA)'
        'AS'
        
          'select v.cod_empresa,  v.data_fech, pp.nped,pp.tipo,pp.nitem,'#39'P'#39 +
          ' as prod_serv,'
        'pp.grupo_prod,pp.cod_prod,'
        'coalesce(pp.quant_ped_item,0) as quant_ped_item,'
        'coalesce(pp.vlun_ped_item,0) as vlun_ped_item,'
        'coalesce(pp.vltot_ped_item,0) as vltot_ped_item,'
        'coalesce(pp.rateio_desc,0) as rateio_desc,'
        'coalesce(pp.rateio_acresc,0) as rateio_acresc,'
        'coalesce(pp.pcust_mc,0) as pcust_mc,'
        'pp.descr_prod_ped,'
        'coalesce(pp.comiss_prod,0) as comiss_prod,'
        'coalesce(pp.comiss_prod_ger,0) as comiss_prod_ger,'
        'coalesce(pp.n_nf,0) as n_nf,'
        'tv.descricao,tv.sigla,tv.tipo_os,c.nome_vendedor,c.cod_vendedor,'
        
          'pp.col_cod_vendedor,c.pc_vend_serv, c.PC_VEND_PROD,f.cod_funcao,' +
          'f.desc_funcao,tv.venda'
        'from  tipo_vendas tv inner join pedvenda v'
        
          'on v.tipo=tv.tipo and (v.tipv=tv.sigla or (v.tipo_os=tv.tipo_os)' +
          ')'
        
          'inner join pedvenda_prod pp on v.tipo=pp.tipo and v.nped=pp.nped' +
          ' and v.cod_empresa=pp.cod_empresa'
        'inner join grupos g on pp.grupo_prod=g.codigo_grup'
        
          'inner join colaborador c on pp.cod_vendedor=c.cod_vendedor and p' +
          'p.cod_empresa=c.cod_empresa'
        'inner join funcoes f on c.cod_funcao=f.cod_funcao'
        
          'where v.status_ped='#39'FECHADA'#39' and v.ativo=1 and (pp.status<>'#39'CANC' +
          'ELADO'#39' or (pp.status is null))'
        'union'
        
          'select v.cod_empresa,  v.data_fech, ps.nped,ps.tipo,ps.nitem,'#39'S'#39 +
          ' as prod_serv,'
        'ps.cod_servico,'#39'      '#39','
        'coalesce(ps.quant_serv_ped,0) as quant_serv_ped,'
        
          '(case when ps.valor_un_serv=0 then ps.prc_int_serv else ps.valor' +
          '_un_serv end) as valor_un_serv,'
        'coalesce(ps.valor_tot_serv,0) as valor_tot_serv,'
        'coalesce(ps.rateio_desc,0) as rateio_desc,'
        'coalesce(ps.rateio_acresc,0) as rateio_acresc,0,'
        'ps.desc_serv_ped,0,0,'
        'coalesce(ps.n_nf,0) as n_nf,'
        
          'tv.descricao,tv.sigla,tv.tipo_os,c.nome_vendedor,c.cod_vendedor,' +
          'c.cod_vendedor,'
        'c.pc_vend_serv, c.PC_VEND_PROD,'
        'f.cod_funcao,f.desc_funcao,tv.venda'
        'from  tipo_vendas tv inner join pedvenda v'
        
          'on v.tipo=tv.tipo and (v.tipv=tv.sigla or (v.tipo_os=tv.tipo_os)' +
          ')'
        
          'inner join pedvenda_serv ps on v.tipo=ps.tipo and v.nped=ps.nped' +
          ' and v.cod_empresa=ps.cod_empresa'
        
          'inner join colaborador c on ps.cod_vendedor=c.cod_vendedor and p' +
          's.cod_empresa=c.cod_empresa'
        'inner join funcoes f on c.cod_funcao=f.cod_funcao'
        
          'where v.status_ped='#39'FECHADA'#39' and v.ativo=1 and (ps.status<>'#39'CANC' +
          'ELADO'#39' or (ps.status is null))'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW SERVICOSPRESTADOS('
        '    COD_EMPRESA,'
        '    DATA_FECH,'
        '    NPED,'
        '    TIPO,'
        '    COD_SERVICO,'
        '    QUANT_SERV_PED,'
        '    VALOR_UN_SERV,'
        '    PRC_INT_SERV,'
        '    VALOR_TOT_SERV,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    DESC_SERV_PED,'
        '    N_NF,'
        '    DESCRICAO_TIPV,'
        '    TIPV,'
        '    TIPO_OS,'
        '    NOME_VENDEDOR,'
        '    COD_VENDEDOR,'
        '    COD_FUNCAO,'
        '    DESC_FUNCAO,'
        '    VENDA)'
        'as'
        
          'select v.cod_empresa,  v.data_fech, ps.nped,ps.tipo, ps.cod_serv' +
          'ico,'
        
          'coalesce(ps.quant_serv_ped,0) as quant_serv_ped,coalesce(ps.valo' +
          'r_un_serv,0) as valor_un_serv,'
        'coalesce(ps.prc_int_serv,0) as prc_int_serv,'
        
          'coalesce(ps.valor_tot_serv,0) as valor_tot_serv, coalesce(ps.rat' +
          'eio_desc,0) as rateio_desc,'
        'coalesce(ps.rateio_acresc,0) as rateio_acresc, ps.desc_serv_ped,'
        
          'coalesce(ps.n_nf,0) as n_nf,tv.descricao,tv.sigla,tv.tipo_os,c.n' +
          'ome_vendedor,c.cod_vendedor,'
        
          'f.cod_funcao,f.desc_funcao,tv.venda from  tipo_vendas tv inner j' +
          'oin pedvenda v'
        
          'on v.tipo=tv.tipo and (v.tipv=tv.sigla or (v.tipo_os=tv.tipo_os)' +
          ')'
        
          'inner join pedvenda_serv ps on v.tipo=ps.tipo and v.nped=ps.nped' +
          ' and v.cod_empresa=ps.cod_empresa'
        
          'inner join colaborador c on ps.cod_vendedor=c.cod_vendedor and p' +
          's.cod_empresa=c.cod_empresa'
        'inner join funcoes f on c.cod_funcao=f.cod_funcao'
        
          'where v.status_ped='#39'FECHADA'#39' and v.ativo=1 and (ps.status<>'#39'CANC' +
          'ELADO'#39' or (ps.status is null));'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW VENDAPRODUTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure GETPROXIMONOSSONUMERO ('
        '    vcod_empresa integer,'
        '    vcod_cobrebem integer)'
        'returns ('
        '    nossonumero varchar(20))'
        'as'
        'declare variable vdig integer;'
        'declare variable vpnum varchar(20);'
        'declare variable vnovonum varchar(20);'
        'declare variable vinum varchar(20);'
        'declare variable j bigint;'
        'declare variable vfnum varchar(20);'
        'declare variable f bigint;'
        'declare variable i bigint;'
        'begin'
        
          '    select proximonossonumero, inicionossonumero, qtdedignossonu' +
          'mero,FIMNOSSONUMERO from cobrebem where cod_cobrebem = :vcod_cob' +
          'rebem and'
        
          '        cod_empresa = :vcod_empresa into :vpnum, :vinum, :vdig, ' +
          ':vfnum;'
        ''
        '    if (:vpnum is null) then'
        '        vpnum = :vinum;'
        ''
        '    vpnum = trim(:vpnum);'
        '    vfnum = trim(:vfnum);'
        '    vinum = trim(:vinum);'
        ''
        '    J = cast(:vpnum as bigint);'
        '    F = cast(:vfnum as bigint);'
        '    I = cast(:vinum as bigint);'
        ''
        '    if (J = F) then'
        '    J = I;'
        '    else'
        '    J = J + 1;'
        ''
        '    select result from strzero(:J,:vdig) into :vnovonum;'
        
          '    update cobrebem set proximonossonumero = :vnovonum where cod' +
          '_cobrebem = :vcod_cobrebem and'
        '            cod_empresa = :vcod_empresa;'
        '    nossonumero = :vpnum;'
        '    suspend;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure STRZERO ('
        '    VALOR bigint,'
        '    QTD integer = 0)'
        'returns ('
        '    RESULT varchar(50))'
        'as'
        'declare variable I integer;'
        'declare variable VVAL varchar(50);'
        'BEGIN'
        ''
        'i = 0;'
        ''
        'RESULT = rtrim(cast(:valor as varchar(50)));'
        'vval = cast(:valor as varchar(50));'
        'vval=rtrim(vval);'
        ''
        'while (i < (:QTD - char_length(:vval)))do'
        'begin'
        ''
        'RESULT = '#39'0'#39' || RESULT;'
        ''
        'i = i + 1;'
        ''
        'end'
        ''
        'SUSPEND;'
        ''
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CODIGO_CORFAB_BI FOR CODIGO_CORFAB'
        'INACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  new.descricao_cor = new.descricao_cor;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CONTRATO_BI FOR CONTRATO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (NEW.COD_CONTRATO is null) THEN'
        '    NEW.COD_CONTRATO = GEN_ID(GEN_CONTRATO_ID,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CEP_BI FOR CEP'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (NEW.COD_CEP is null) THEN'
        '    NEW.COD_CEP = GEN_ID(GEN_CEP_ID,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW PRODISENTO_PISCOFINS('
        'TIPO,'
        'DATA_LANC,'
        'NUM_NF_CUMPOM,'
        'NSERIEECF,'
        'COD_TERMINAL,'
        'NITEM,'
        'GRUPO_PROD,'
        'COD_PROD,'
        'NUM_FAB_PROD,'
        'NBM,'
        'DESCR_PROD,'
        'QUANTIDADE,'
        'VALOR_UNITARIO,'
        'VALOR_TOTAL,'
        'NCM,'
        'COD_EMPRESA)'
        ' AS '
        'select'
        #39'NF'#39' as Tipo,'
        'nf.data_lanc,'
        'nf.num_nf,'
        'null as nserieecf,'
        'null as cod_terminal,'
        'inf.nitem,'
        'p.grupo_prod,'
        'p.cod_prod,'
        'p.num_fab_prod,'
        'p.nbm,'
        'p.descr_prod,'
        'coalesce(inf.quantidade,0) as quantidade,'
        
          'coalesce(inf.valor_unitario,0)-(coalesce(inf.rateio_desconto,0)/' +
          'coalesce(inf.quantidade,1)) as valor_unitario,'
        
          'coalesce(inf.valor_total,0)-coalesce(inf.rateio_desconto,0) as v' +
          'alor_total,'
        'inf.ncm,'
        'inf.cod_empresa'
        'from notafiscal nf inner join notafiscal_item inf'
        'on nf.cod_nf=inf.cod_nf and nf.cod_empresa=inf.cod_empresa'
        
          'inner join produtos p on inf.grupo_prod=p.grupo_prod and inf.cod' +
          '_prod=p.cod_prod and inf.cod_empresa=p.cod_empresa'
        
          'where p.nbm is not null and p.nbm<>'#39#39' and p.ativo=1 and p.isento' +
          '_pis='#39'S'#39' and'
        'nf.status ='#39'Fechada'#39' and nf.situacao_nfe='#39'Autorizada'#39
        'union'
        'select'
        #39'ECF'#39' as Tipo,'
        'c.data,'
        'c.cupom,'
        'c.nserieecf,'
        'c.cod_terminal,'
        'c2.registro,'
        'p.grupo_prod,'
        'p.cod_prod,'
        'p.num_fab_prod,'
        'p.nbm,'
        'p.descr_prod,'
        'coalesce(c2.quantidade,0) as quantidade,'
        'coalesce(c2.preco,0)+'
        
          '(((coalesce(c2.perc_acresc,0)+coalesce(c2.rat_acres,0))/coalesce' +
          '(c2.quantidade,1))-'
        
          '((coalesce(c2.rat_desc,0)+coalesce(c2.perc_desc,0))/coalesce(c2.' +
          'quantidade,1))) as valor_unitario,'
        
          '(coalesce(c2.total,0)+coalesce(c2.perc_acresc,0)+coalesce(c2.rat' +
          '_acres,0)-coalesce(c2.rat_desc,0)-coalesce(c2.perc_desc,0)) as v' +
          'alor_total,'
        #39#39' as NCM,'
        'c2.cod_empresa'
        'from cupom c inner join cupom2 c2 on'
        'c.cod_terminal=c2.cod_terminal and'
        'c.nserieecf=c2.nserieecf and'
        'c.cupom = c2.cupom and'
        'c.registro=c2.ordem and'
        'c.cod_empresa =c2.cod_empresa'
        'inner join produtos p on'
        'c2.grupo_prod=p.grupo_prod and'
        'c2.cod_prod=p.cod_prod and'
        'c2.cod_empresa=p.cod_empresa'
        
          'where p.nbm is not null and p.nbm<>'#39#39' and p.ativo=1 and p.isento' +
          '_pis='#39'S'#39' and'
        '(c.status_cp is null or (c.status_cp<>'#39'CANCELADO'#39'))'
        'order by 1,2;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TIPO_DESPESA_BI FOR TIPO_DESPESA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (NEW.COD_TP_DESPESA is null) THEN'
        '    NEW.COD_TP_DESPESA = GEN_ID(GEN_TIPO_DESPESA_ID,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TIPO_PENDENCIA_BI FOR TIPO_PENDENCIA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (NEW.COD_TP_PENDENCIA is null) THEN'
        '    NEW.COD_TP_PENDENCIA = GEN_ID(GEN_TIPO_PENDENCIA_ID,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW ORCAMENTO4('
        '    COD_EMPRESA,'
        '    TIPO,'
        '    PROD_SERV,'
        '    NITEM,'
        '    NPED,'
        '    COD_PROD_SER,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    DESCRICAO,'
        '    QUANTIDADE,'
        '    VL_UNITARIO,'
        '    VL_TOTAL_ITEM,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    MARCA_P,'
        '    STATUS)'
        'AS'
        
          'select pvp.cod_empresa,pvp.tipo, '#39'PRODUTO'#39',pvp.nitem,pvp.nped,'#39'P' +
          '-'#39'||p.num_fab_prod,pvp.grupo_prod,pvp.cod_prod,pvp.descr_prod_pe' +
          'd,pvp.quant_ped_item,'
        
          'pvp.vlun_ped_item,pvp.vltot_ped_item,coalesce(pvp.rateio_desc,0)' +
          ' as rateio_desc,coalesce(pvp.rateio_acresc,0) as rateio_acresc,p' +
          '.marca_p,pvp.status'
        
          'from pedvenda_prod pvp inner join produtos p on pvp.grupo_prod=p' +
          '.grupo_prod and pvp.cod_prod=p.cod_prod and pvp.cod_empresa=p.co' +
          'd_empresa'
        'where pvp.ativo=1'
        'union'
        
          'select pvs.cod_empresa,pvs.tipo, '#39'SERVICO'#39',pvs.nitem,pvs.nped,'#39'S' +
          '-'#39'||pvs.cod_servico,null, null, pvs.desc_serv_ped,pvs.quant_serv' +
          '_ped,'
        
          'pvs.valor_un_serv,pvs.valor_tot_serv,coalesce(pvs.rateio_desc,0)' +
          ' as rateio_desc,coalesce(pvs.rateio_acresc,0) as rateio_acresc,n' +
          'ull,pvs.status'
        'from pedvenda_serv pvs where pvs.ativo=1'
        'union'
        
          'select vpt.cod_empresa,vpt.tipo, '#39'PRODUTOT'#39',null,vpt.nped, '#39'PROD' +
          '-T'#39',null,null,vpt.descricao,vpt.qtde,vpt.vl_unit,vpt.vl_total,0,' +
          ' 0,null,'#39#39'  from pedvenda pv inner join pedvenda_prod_terc vpt o' +
          'n pv.nped=vpt.nped and pv.cod_empresa=vpt.cod_empresa and pv.tip' +
          'o=vpt.tipo'
        'where vpt.ativo=1'
        'union'
        
          'select vst.cod_empresa,vst.tipo, '#39'SERVICOT'#39',null,vst.nped, '#39'SERV' +
          '-T'#39',null,null,vst.descr_servt,1,vst.vl_servt,vst.vl_servt,0, 0,n' +
          'ull,'#39#39'  from pedvenda pv inner join pedvenda_serv_terc vst on pv' +
          '.nped=vst.nped and pv.cod_empresa=vst.cod_empresa and pv.tipo=vs' +
          't.tipo'
        'where vst.ativo=1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PEDVENDA_PROD_RAT_AC FOR PEDVENDA_PRO' +
          'D'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '    if (new.rateio_acresc is null) then'
        '        new.rateio_acresc = 0;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER GENMACRO FOR MACRO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        'IF (NEW.MACRO IS NULL) THEN'
        '   NEW.MACRO = GEN_ID(GENMACRO,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER OPCIONAIS_BI FOR OPCIONAIS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (NEW.COD_OPCIONAIS IS NULL) THEN'
        '    NEW.COD_OPCIONAIS = GEN_ID(GEN_OPCIONAIS_ID,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TP_COMB_RENAVAM_BI FOR TP_COMB_RENAVAM'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (NEW.CODIGO_TPCOMB is null) THEN'
        '    NEW.CODIGO_TPCOMB = GEN_ID(GEN_TP_COMB_RENAVAM_ID,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW VENDAS_GERAIS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW PROD_PISCOFINS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'UPDATE HIST_REC SET TP_BAIXA = '#39'P'#39' WHERE HISTORICO_REC LIKE '#39'%PA' +
          'RCIAL%'#39' AND TP_BAIXA IS NULL;'
        
          'UPDATE HIST_REC SET TP_BAIXA = '#39'T'#39' WHERE HISTORICO_REC LIKE '#39'%TO' +
          'TAL%'#39' AND TP_BAIXA IS NULL;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW RECEB_DOCS('
        '    TP_RECEBIMENTO,'
        '    TIPO,'
        '    NPED,'
        '    NOME_CTRL,'
        '    DATA_FECH,'
        '    VALOR_DOC,'
        '    SEQFORM,'
        '    N_DOC,'
        '    COD_CLIENTE,'
        '    COD_EMPRESA,'
        '    NOME_CLIENTE,'
        '    VALOR_TOTAL,'
        '    NRECIBO,'
        '    VALOR_RECIBO,'
        '    DATA_VENC,'
        '    N_PROCESSAMENTO,'
        '    DATA_MOV)'
        'AS'
        'select '#39'DIRETO'#39' as tipo,pd.tipo as tipo_ped,pd.nped,'
        
          'case when ctrl.nome_ctrl is null then '#39'SEM FORMA'#39' else ctrl.nome' +
          '_ctrl end as nome_ctrl,'
        
          'pd.data_fech,fr.valordoc,fr.seqform,fr.ndoc,pd.cod_cliente,pd.co' +
          'd_empresa,'
        
          'fr.cliente,pd.valor_total,coalesce(fr.rec_numvend,0) as num_reci' +
          'bo,0 as valor_recibo,'
        'fr.data_venc,fr.n_processamento,fr.data_mov'
        
          'from pedvenda pd left join formpagamento fr on pd.tipo = fr.tpdo' +
          'cs and pd.nped = fr.nrequisicao and'
        'pd.cod_empresa = fr.cod_empresa and fr.recibo is null left join'
        
          'controles ctrl on fr.cod_controle = ctrl.codigo_ctrl and fr.cod_' +
          'empresa = ctrl.codigo_emp'
        
          'where (pd.tipo <> '#39'MOT'#39' and pd.tipo <> '#39'ORC'#39') and  pd.data_fech ' +
          '>= '#39'01/01/2011'#39' and'
        'pd.valor_total <> 0 and'
        
          'coalesce((select count(*) from formpagamento frc where frc.nrequ' +
          'isicao = pd.nped and'
        
          'frc.tpdocs = pd.tipo and frc.cod_empresa = pd.cod_empresa and (n' +
          'ot frc.recibo is null)),0) <= 0'
        'union'
        'select '#39'RECIBO'#39' as tipo,pd.tipo as tipo_ped,pd.nped,'
        
          'case when (select first 1 ctrl.nome_ctrl from controles ctrl inn' +
          'er join formpagamento rc'
        
          'on rc.cod_controle = ctrl.codigo_ctrl and rc.cod_empresa = ctrl.' +
          'codigo_emp'
        
          'where rc.nrequisicao = fr.rec_numvend and rc.cod_empresa = fr.co' +
          'd_empresa and rc.tpdocs ='#39'REC'#39' order by valordoc asc)'
        
          'is null then '#39'SEM FORMA'#39' else (select first 1 ctrl.nome_ctrl fro' +
          'm controles ctrl inner join formpagamento rc'
        
          'on rc.cod_controle = ctrl.codigo_ctrl and rc.cod_empresa = ctrl.' +
          'codigo_emp'
        
          'where rc.nrequisicao = fr.rec_numvend and rc.cod_empresa = fr.co' +
          'd_empresa and rc.tpdocs ='#39'REC'#39' order by valordoc asc) end as nom' +
          'e_ctrl,'
        
          'pd.data_fech,fr.valordoc,fr.seqform,fr.ndoc,pd.cod_cliente,pd.co' +
          'd_empresa,fr.cliente,pd.valor_total,coalesce(fr.rec_numvend,0) a' +
          's num_recibo,'
        
          '(select sum(rc.valor_orig) from recibos rc where rc.nrecibo = fr' +
          '.rec_numvend and rc.cod_empresa = fr.cod_empresa) as valor_recib' +
          'o,'
        'fr.data_venc,fr.n_processamento,fr.data_mov'
        
          'from pedvenda pd inner join formpagamento fr on pd.tipo = fr.tpd' +
          'ocs and pd.nped = fr.nrequisicao and'
        'pd.cod_empresa = fr.cod_empresa and (not fr.recibo is null)'
        
          'where (pd.tipo <> '#39'MOT'#39' and pd.tipo <> '#39'ORC'#39') and  pd.data_fech ' +
          '>= '#39'01/01/2011'#39
        'and pd.valor_total <> 0'
        ';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_CONTR_CRED_VALORES FOR CONTROLE_CREDI' +
          'TOS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  new.valor_original = new.valor_c;'
        
          '  if ((new.valor_liquido is null) or (new.valor_liquido = 0)) th' +
          'en'
        '    new.valor_liquido = new.valor_c;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_BAIXA_CREDITOS_VL_P_EST FOR BAIXA_CRE' +
          'DITOS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  new.valor_para_estorno = new.valor_quitado;      '
        '  new.valor_para_estorno_ctb = coalesce(new.vl_contabil, 0);'
        ''
        '  if (new.tp_operacao = '#39'T'#39') then'
        '    new.valor_para_estorno = new.valor_c;'
        
          '  else if (coalesce(new.valor_c, 0) < coalesce(new.valor_quitado' +
          ', 0)) then'
        '    new.valor_para_estorno = new.valor_c;'
        '  '
        
          '  if (coalesce(new.vl_contabil, 0) > coalesce(new.valor_quitado,' +
          ' 0)) then'
        '    new.valor_para_estorno_ctb = new.valor_quitado;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'UPDATE NAT_OP_DESCRICAO SET NITEM_NOP_DESC = 1 WHERE NITEM_NOP_D' +
          'ESC IS NULL;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'UPDATE NAT_OP SET NAT_BC_CRED = '#39'01'#39
        
          'WHERE CODIGO_NOP IN (1102, 1113, 1117, 1118, 1121, 1251, 1403, 1' +
          '652, 2102, 2113, 2117,'
        
          '2118, 2121, 2251, 2403, 2652, 3102, 3251, 3652) AND NAT_BC_CRED ' +
          'IS NULL;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'UPDATE NAT_OP SET NAT_BC_CRED = '#39'02'#39
        
          'WHERE CODIGO_NOP IN (1101, 1111, 1116, 1120, 1122, 1126, 1128, 1' +
          '401, 1407, 1556, 1651,'
        
          '1653, 2101, 2111, 2116, 2120, 2122, 2126, 2128, 2401, 2407, 2556' +
          ', 2651, 2653, 3101, 3126,'
        '3128, 3556, 3651, 3653) AND NAT_BC_CRED IS NULL;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'UPDATE NAT_OP SET NAT_BC_CRED = '#39'03'#39
        
          'WHERE CODIGO_NOP IN (1124, 1125, 1933, 2124, 2125, 2933) AND NAT' +
          '_BC_CRED IS NULL;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'UPDATE NAT_OP SET NAT_BC_CRED = '#39'12'#39
        
          'WHERE CODIGO_NOP IN (1201, 1202, 1203, 1204, 1410, 1411, 1660, 1' +
          '661, 1662, 2201, 2202,'
        '2410, 2411, 2660, 2661, 2662) AND NAT_BC_CRED IS NULL;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'UPDATE NAT_OP SET NAT_BC_CRED = '#39'13'#39
        'WHERE CODIGO_NOP IN ( 1922, 2922) AND NAT_BC_CRED IS NULL;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TI_PRODUTOS_CP2 FOR PRODUTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'UPDATE CONTROLE_CREDITOS SET VALOR_LIQUIDO = VALOR_C WHERE COALE' +
          'SCE(VALOR_LIQUIDO,0) <= 0;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'UPDATE NAT_OP SET CREDITO_PIS_COFINS = '#39'S'#39' WHERE CREDITO_PIS_COF' +
          'INS IS NULL AND CODIGO_NOP IN ('
        
          '1102, 1113, 1117, 1118, 1121, 1251, 1403, 1652, 2102, 2113, 2117' +
          ', 2118, 2121, 2251, 2403, 2652, 3102, 3251,'
        
          '3652, 1101, 1111, 1116, 1120, 1122, 1126, 1128, 1401, 1407, 1556' +
          ', 1651, 1653, 2101, 2111, 2116, 2120, 2122,'
        
          '2126, 2128, 2401, 2407, 2556, 2651, 2653, 3101, 3126, 3128, 3556' +
          ', 3651, 3653, 1124, 1125, 1933, 2124, 2125,'
        
          '2933, 1201, 1202, 1203, 1204, 1410, 1411, 1660, 1661, 1662, 2201' +
          ', 2202, 2410, 2411, 2660, 2661, 2662'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'UPDATE NAT_OP SET RECEITA_PIS_COFINS = '#39'S'#39' WHERE RECEITA_PIS_COF' +
          'INS IS NULL AND CODIGO_NOP IN ('
        
          '5101, 5102, 5103, 5104, 5105, 5106, 5109, 5110, 5111, 5112, 5113' +
          ', 5114, 5115, 5116, 5117, 5118, 5119, 5120, 5122, 5123, 5124,'
        
          '5125, 5151, 5152, 5153, 5155, 5156, 5201, 5202, 5205, 5206, 5207' +
          ', 5208, 5209, 5210, 5251, 5252, 5253, 5254, 5255, 5256, 5257,'
        
          '5258, 5301, 5302, 5303, 5304, 5305, 5306, 5307, 5351, 5352, 5353' +
          ', 5354, 5355, 5356, 5357, 5359, 5360, 5401, 5402, 5403, 5405,'
        
          '5408, 5409, 5410, 5411, 5412, 5413, 5414, 5415, 5451, 5501, 5502' +
          ', 5503, 5504, 5505, 5551, 5552, 5553, 5554, 5555, 5556, 5557,'
        
          '5601, 5602, 5603, 5605, 5606, 5651, 5652, 5653, 5654, 5655, 5656' +
          ', 5657, 5658, 5659, 5660, 5661, 5662, 5663, 5664, 5665, 5666,'
        
          '5667, 5901, 5902, 5903, 5904, 5905, 5906, 5907, 5908, 5909, 5910' +
          ', 5911, 5912, 5913, 5914, 5915, 5916, 5917, 5918, 5919, 5920,'
        
          '5921, 5922, 5923, 5924, 5925, 5926, 5927, 5928, 5929, 5931, 5932' +
          ', 5933, 5949, 6101, 6102, 6103, 6104, 6105, 6106, 6107, 6108,'
        
          '6109, 6110, 6111, 6112, 6113, 6114, 6115, 6116, 6117, 6118, 6119' +
          ', 6120, 6122, 6123, 6124, 6125, 6151, 6152, 6153, 6155, 6156,'
        
          '6201, 6202, 6205, 6206, 6207, 6208, 6209, 6210, 6251, 6252, 6253' +
          ', 6254, 6255, 6256, 6257, 6258, 6301, 6302, 6303, 6304, 6305,'
        
          '6306, 6307, 6351, 6352, 6353, 6354, 6355, 6356, 6357, 6359, 6360' +
          ', 6401, 6402, 6403, 6404, 6408, 6409, 6410, 6411, 6412, 6413,'
        
          '6414, 6415, 6501, 6502, 6503, 6504, 6505, 6551, 6552, 6553, 6554' +
          ', 6555, 6556, 6557, 6603, 6651, 6652, 6653, 6654, 6655, 6656,'
        
          '6657, 6658, 6659, 6660, 6661, 6662, 6663, 6664, 6665, 6666, 6667' +
          ', 6901, 6902, 6903, 6904, 6905, 6906, 6907, 6908, 6909, 6910,'
        
          '6911, 6912, 6913, 6914, 6915, 6916, 6917, 6918, 6919, 6920, 6921' +
          ', 6922, 6923, 6924, 6925, 6929, 6931, 6932, 6933, 6949, 7101,'
        
          '7102, 7105, 7106, 7127, 7201, 7202, 7205, 7206, 7207, 7210, 7211' +
          ', 7251, 7301, 7358, 7501, 7551, 7553, 7556, 7651, 7654, 7667,'
        '7930, 7949, 5923, 5934, 6923, 6934'
        ');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER DEPTOTRIGGER1 FOR DEPTO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  if (new.cod_depto is null) then'
        '    new.cod_depto = gen_id(inc_cod_depto, 1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_ATUALIZAITEMPED'
        'as'
        'declare variable PNITEMKEY varchar(30);'
        'declare variable V_NUM_PED integer;'
        'declare variable VCOD_EMPRESA integer;'
        'declare variable VNUM_PED integer;'
        'declare variable PNUM_PED integer;'
        'declare variable PGRUPO_PROD integer;'
        'declare variable PCOD_PROD varchar(30);'
        'declare variable PCOD_EMPRESA integer;'
        'begin'
        '    select i.rdb$field_name'
        '    from rdb$relation_constraints r'
        '    join rdb$index_segments i'
        '    on (r.rdb$index_name = i.rdb$index_name)'
        '    where (r.rdb$relation_name = '#39'ITEM_PEDIDO'#39') and'
        '    (r.rdb$constraint_type = '#39'PRIMARY KEY'#39') and'
        '    i.rdb$field_name='#39'NITEM'#39
        '    into :pNITEMKEY;'
        '    if (:pNITEMKEY is null) then'
        '    begin'
        
          '      for select NUM_PED,COD_EMPRESA from pedido order by COD_EM' +
          'PRESA,NUM_PED'
        '      into :vNUM_PED,:vCOD_EMPRESA do'
        '      begin'
        '        V_NUM_PED=1;'
        '        for select NUM_PED,GRUPO_PROD,COD_PROD,COD_EMPRESA'
        
          '        from item_pedido where COD_EMPRESA = :vCOD_EMPRESA and N' +
          'UM_PED = :vNUM_PED'
        '        order by COD_EMPRESA,NUM_PED'
        '        into :pNUM_PED,:pGRUPO_PROD,:pCOD_PROD,:pCOD_EMPRESA do'
        '        begin'
        '          update item_pedido set NITEM = :V_NUM_PED,COD_GRADE=0'
        
          '          where NUM_PED= :pNUM_PED and GRUPO_PROD = :pGRUPO_PROD' +
          ' and'
        '          COD_PROD = :pCOD_PROD and COD_EMPRESA = :pCOD_EMPRESA;'
        ''
        '          V_NUM_PED=V_NUM_PED+1;'
        '        end'
        '      end'
        
          '      update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RD' +
          'B$FIELD_NAME = '#39'COD_GRADE'#39') and (RDB$RELATION_NAME = '#39'ITEM_PEDID' +
          'O'#39');'
        '    end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'execute procedure sp_atualizaitemped;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'UPDATE PRODUTOS SET CONSUMO = '#39'N'#39' WHERE CONSUMO IS NULL;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NOTAFISCAL_ITEM_DEL_CUST_EST FOR NOTAFIS' +
          'CAL_ITEM'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        'begin'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TRIGGER NOTAFISCAL_ITEM_DEL_CUST_EST INACTIVE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW MAPA_DESP_T('
        '    N_CONTA_PLC,'
        '    DESC_PLC,'
        '    VALOR_L,'
        '    DESC_GR,'
        '    TIPO_GR,'
        '    HISTORICO_L,'
        '    DATA,'
        '    GRUP_CT,'
        '    COD_LANC,'
        '    COD_DEP,'
        '    MES_MAPA,'
        '    DESC_P)'
        'AS'
        'select p.n_conta_plc,p.desc_plc,l.valor_l,c.desc_gr,c.tipo_gr,'
        
          '       l.historico_l,l.data,p.grup_ct,l.cod_lanc,c.cod_dep,extra' +
          'ct(month from l.data),p.desc_padr'
        
          '       from Lancamentos l RIGHT JOIN p_contas p ON l.n_conta_plc' +
          ' = p.n_conta_plc and l.lote is null'
        '       INNER JOIN GRUPOS_CT c on'
        
          '       p.grup_ct = c.grup_ct and (c.tipo_gr = '#39'S'#39' or (c.desc_gr ' +
          'like '#39'%INVEST%'#39'))'
        'union'
        'select P.n_conta_plc,p.desc_plc,'
        '       ctr.valor_pago,c.desc_gr,c.tipo_gr,ctr.historico_ctp,'
        
          '       ctr.datq_ctp,p.grup_ct,ctr.cod_contrp,c.cod_dep,extract(m' +
          'onth from ctr.datq_ctp),p.desc_padr'
        
          '       from contas_a_pagar ctr RIGHT JOIN p_contas p ON ctr.n_co' +
          'nta_plc = p.n_conta_plc and ctr.lote is not null'
        '       INNER JOIN grupos_ct c ON p.grup_ct = c.grup_ct and'
        '       (c.tipo_gr = '#39'S'#39' or (c.desc_gr like '#39'%INVEST%'#39'));'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW MAPA_REC('
        '    N_CONTA_PLC,'
        '    DESC_PLC,'
        '    VALOR_L,'
        '    DESC_GR,'
        '    TIPO_GR,'
        '    HISTORICO_L,'
        '    DATA,'
        '    GRUP_CT,'
        '    COD_LANC,'
        '    COD_DEP,'
        '    MES_MAPA,'
        '    DESC_P)'
        'AS'
        'select p.n_conta_plc,p.desc_plc,l.valor_l,c.desc_gr,c.tipo_gr,'
        
          '       l.historico_l,l.data,p.grup_ct,l.cod_lanc,c.cod_dep,extra' +
          'ct(month from l.data),p.desc_padr'
        
          '       from Lancamentos l RIGHT JOIN p_contas p ON l.n_conta_plc' +
          ' = p.n_conta_plc and l.lote is null'
        '       INNER JOIN GRUPOS_CT c on'
        
          '       p.grup_ct = c.grup_ct and (c.tipo_gr = '#39'E'#39') WHERE p.ativo' +
          ' = 1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER DATALIBTRAVA_OS FOR ORDEM_SERV'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   new.DATA_LIBTRAVA=new.DATA_OS;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER DATALIBTRAVA_REQ FOR REQVENDA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   new.DATA_LIBTRAVA=new.DATA_REQ;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER DATALIBTRAVA_PED FOR PEDVENDA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   new.DATA_LIBTRAVA=new.DATA_PED;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER ti_devolucao_grade FOR devolucao_grade'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (new.seqid is null) THEN'
        '    new.seqid = gen_id(INCSEQIDDEVGRADE,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER PROCEDURE SP_ATUALIZADEVOLUCAO_GRADE'
        'as'
        'declare variable PCODDEV integer;'
        'BEGIN'
        
          '    select first 1 COD_DEVOLUCAO from devolucao_grade where seqi' +
          'd is null into :PCODDEV;'
        '    if (:PCODDEV is not null) then'
        '    begin'
        
          '     insert into devolucao_grade select * from devolucao_grade w' +
          'here seqid is null'
        
          '       order by devolucao_grade.cod_devolucao,devolucao_grade.co' +
          'd_empresa,'
        
          '       devolucao_grade.grupo_prod,devolucao_grade.cod_prod,devol' +
          'ucao_grade.cod_grade;'
        '      delete from devolucao_grade where seqid is null;'
        '    end'
        '    suspend;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'EXECUTE PROCEDURE SP_ATUALIZADEVOLUCAO_GRADE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIEL' +
          'D_NAME = '#39'SEQID'#39') and (RDB$RELATION_NAME = '#39'DEVOLUCAO_GRADE'#39');'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'DROP PROCEDURE SP_ATUALIZADEVOLUCAO_GRADE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PROMOCAO_PRODUTO FOR PROMOCAO'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        'begin'
        
          'if ((old.data_ini <> new.data_ini) or (old.data_fim <> new.data_' +
          'fim) or (old.hora_ini <> new.hora_ini) or (old.hora_fim <> new.h' +
          'ora_fim))then'
        '   begin'
        
          '    update promocao_produto set data_ini = new.data_ini, data_fi' +
          'm = new.data_fim, hora_ini = new.hora_ini, hora_fim = new.hora_f' +
          'im'
        
          '    where cod_promocao = old.cod_promocao and cod_tppreco = old.' +
          'cod_tppreco and cod_empresa = old.cod_empresa;'
        '   end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER procedure INCREMENTA_CODIGO ('
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
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_AGENDAMENTO_BI0 FOR AGENDAMENTO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        
          '  update clientes set data_agendada = new.data_agendada where co' +
          'd_cliente = new.cod_cliente and cod_empresa = new.cod_empresa;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_AGENDAMENTO_AU0 FOR AGENDAMENTO'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (old.data_agendada <> new.data_agendada) then'
        
          '    update clientes set data_agendada = new.data_agendada where ' +
          'cod_cliente = new.cod_cliente and cod_empresa = new.cod_empresa;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_BI_NOME_CL FOR PEDVENDA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        '  declare variable vnomecl varchar(35);'
        'begin'
        '  vnomecl = '#39#39';'
        
          '  if ((new.tipo = '#39'ORC'#39') and (coalesce(new.nome_cli_orc, '#39#39') <> ' +
          #39#39')) then'
        '    vnomecl = substring(new.nome_cli_orc from 1 for 35);'
        ''
        
          '  if ((new.tipo <> '#39'ORC'#39') and (coalesce(new.nome_cli_orc, '#39#39') = ' +
          #39#39')) then'
        
          '    select substring(cl.nome_cliente from 1 for 35) from cliente' +
          's cl'
        
          '      where cl.cod_cliente = new.cod_cliente and cl.cod_empresa ' +
          '= new.cod_empresa'
        '      into :vnomecl;'
        ''
        '  if (coalesce(:vnomecl,'#39#39') <> '#39#39') then'
        '    new.nome_clientedav = :vnomecl;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_BU_NOME_CL FOR PEDVENDA'
        'ACTIVE BEFORE UPDATE POSITION 0'
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
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PEDVENDA_PROD_AI_CONTA_CLIEN FOR PEDV' +
          'ENDA_PROD'
        'ACTIVE AFTER INSERT POSITION 0'
        'AS'
        'begin'
        '  if ((new.tipo = rtrim('#39'OS'#39')) and (new.nitem = 1))  then'
        
          '    update pedvenda p set p.status_conta_cliente = '#39'Conta de Cli' +
          'ente Aberta'#39
        
          '      where p.nped = new.nped and p.tipo = new.tipo and p.cod_em' +
          'presa = new.cod_empresa and'
        
          '      coalesce(p.status_conta_cliente, '#39#39' ) = '#39#39' and coalesce(p.' +
          'status_ped, '#39#39' ) <> '#39'FECHADA'#39' ;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PEDVENDA_SERV_AI_CONTA_CLIEN FOR PEDV' +
          'ENDA_SERV'
        'ACTIVE AFTER INSERT POSITION 0'
        'AS'
        'begin'
        '  if ((new.tipo = rtrim('#39'OS'#39')) and (new.nitem = 1))  then'
        
          '    update pedvenda p set p.status_conta_cliente = '#39'Conta de Cli' +
          'ente Aberta'#39
        
          '      where p.nped = new.nped and p.tipo = new.tipo and p.cod_em' +
          'presa = new.cod_empresa and'
        
          '      coalesce(p.status_conta_cliente, '#39#39' ) = '#39#39' and coalesce(p.' +
          'status_ped, '#39#39' ) <> '#39'FECHADA'#39' ;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_TMO_SERV_OS FOR PEDVENDA'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        'begin'
        '  if (Rtrim(old.tipo)='#39'OS'#39') then'
        
          '  delete from tmo_serv_os where tmo_serv_os.n_os = old.nped and ' +
          'tmo_serv_os.cod_empresa = old.cod_empresa;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVIDENCIAS_PAF_BI FOR EVIDENCIAS_PAF'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   NEW.SEQID = GEN_ID(GEN_EVIDENCIAS_PAF, 1);'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVIDENCIAS_PAF_BI FOR EVIDENCIAS_PAF'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '   NEW.SEQID = GEN_ID(GEN_EVIDENCIAS_PAF, 1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'delete from EVIDENCIAS_PAF;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER INCR_CODCARTAS FOR MODCARTAS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        ' if (new.cod_carta is null) then'
        '   new.cod_carta = gen_id(inc_cod_carta,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER CCREDITOS_UP_ITEMCARTA FOR CONTROLE_CRED' +
          'ITOS'
        'ACTIVE AFTER UPDATE OR DELETE POSITION 0'
        'AS'
        'DECLARE VARIABLE  vqtd INTEGER;'
        'DECLARE VARIABLE  vcoditemcarta INTEGER;'
        'begin'
        '  if (updating) then'
        '  begin'
        
          '  if ((trim(coalesce(old.status_c,'#39#39'))<>trim(coalesce(new.status' +
          '_c,'#39#39'))) or'
        
          '     (old.status_c is null and (not new.status_c is null)))  the' +
          'n'
        '  begin'
        
          '    if ((trim(coalesce(new.status_c,'#39#39')) = '#39'QUITADO'#39') and (not n' +
          'ew.datq_c is null)) then'
        '    begin'
        
          '      update itens_carta_cred set itens_carta_cred.solucionado='#39 +
          'S'#39','
        
          '      itens_carta_cred.dt_solucao_cred= coalesce(new.data_baixa,' +
          'new.datq_c) where itens_carta_cred.cod_cred = new.cod_cred'
        '        and itens_carta_cred.cod_empresa = new.codigo_emp;'
        ''
        
          '      for select itens_carta_cred.cod_itemcarta  from itens_cart' +
          'a_cred'
        
          '        where itens_carta_cred.cod_cred = new.cod_cred and itens' +
          '_carta_cred.cod_empresa = new.codigo_emp'
        '        into :vcoditemcarta do'
        '      begin'
        
          '        select count(itens_carta_cred.cod_itemcarta) from itens_' +
          'carta_cred'
        '          where itens_carta_cred.cod_itemcarta = :vcoditemcarta'
        
          '          and itens_carta_cred.cod_empresa=new.codigo_emp and (i' +
          'tens_carta_cred.solucionado='#39'N'#39' or (itens_carta_cred.solucionado' +
          ' is null))'
        '          into :vqtd;'
        '          if ((vqtd is null) or (vqtd = 0)) then'
        
          '            update itens_carta set itens_carta.dt_solucao=coales' +
          'ce(new.data_baixa,new.datq_c)'
        
          '            where itens_carta.codigo = :vcoditemcarta and itens_' +
          'carta.cod_empresa=new.codigo_emp and itens_carta.versaocarta=1;'
        '      end'
        '    end'
        
          '    else  if ((trim(coalesce(old.status_c,'#39#39')) = '#39'QUITADO'#39') and ' +
          '(new.status_c is null or (trim(coalesce(new.status_c,'#39#39')) = '#39#39'))' +
          ') then'
        '    begin'
        
          '      update itens_carta_cred set itens_carta_cred.solucionado= ' +
          'null,'
        
          '      itens_carta_cred.dt_solucao_cred = null where itens_carta_' +
          'cred.cod_cred = new.cod_cred'
        '        and itens_carta_cred.cod_empresa = new.codigo_emp;'
        ''
        
          '      for select itens_carta_cred.cod_itemcarta  from itens_cart' +
          'a_cred'
        
          '        where itens_carta_cred.cod_cred = new.cod_cred and itens' +
          '_carta_cred.cod_empresa = new.codigo_emp'
        '        into :vcoditemcarta do'
        '      begin'
        
          '        select count(itens_carta_cred.cod_itemcarta) from itens_' +
          'carta_cred'
        '          where itens_carta_cred.cod_itemcarta = :vcoditemcarta'
        
          '          and itens_carta_cred.cod_empresa=new.codigo_emp and (i' +
          'tens_carta_cred.solucionado='#39'N'#39' or (itens_carta_cred.solucionado' +
          ' is null))'
        '          into :vqtd;'
        '          if ((not vqtd is null) or (vqtd > 0)) then'
        '            update itens_carta set itens_carta.dt_solucao=null'
        
          '            where itens_carta.codigo = :vcoditemcarta and itens_' +
          'carta.cod_empresa=new.codigo_emp and itens_carta.versaocarta=1;'
        '      end'
        '    end'
        '  end'
        '  end'
        '  else if (deleting) then'
        '  begin'
        
          '    for select itens_carta_cred.cod_itemcarta  from itens_carta_' +
          'cred'
        
          '      where itens_carta_cred.cod_cred = old.cod_cred and itens_c' +
          'arta_cred.cod_empresa = old.codigo_emp'
        '      into :vcoditemcarta do'
        '    begin'
        
          '      select count(itens_carta_cred.cod_itemcarta) from itens_ca' +
          'rta_cred'
        '        where itens_carta_cred.cod_itemcarta = :vcoditemcarta'
        '        and itens_carta_cred.cod_empresa=old.codigo_emp'
        '        and itens_carta_cred.cod_cred<>old.cod_cred'
        
          '        and (itens_carta_cred.solucionado='#39'N'#39' or (itens_carta_cr' +
          'ed.solucionado is null))'
        '        into :vqtd;'
        '        if ((vqtd is null) or (vqtd = 0)) then'
        
          '          update itens_carta set itens_carta.dt_solucao= (select' +
          ' current_date from rdb$database)'
        
          '          where itens_carta.codigo = :vcoditemcarta and itens_ca' +
          'rta.cod_empresa=old.codigo_emp and itens_carta.versaocarta=1;'
        '    end'
        
          '    delete from itens_carta_cred  where itens_carta_cred.cod_cre' +
          'd = old.cod_cred'
        '      and itens_carta_cred.cod_empresa = old.codigo_emp;'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW DATABANCO('
        '    DATABANCO)'
        'AS'
        'select current_timestamp from rdb$database;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_PROD_ALMOX FOR PEDVENDA_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        'DECLARE VARIABLE  almox char(2);'
        'DECLARE VARIABLE  nitem integer;'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        '  if (inserting) then'
        '  begin'
        '  select trim(empresa.almox) from empresa'
        '  where empresa.cod_empresa = new.cod_empresa'
        '  into :almox;'
        ''
        
          '  if (((new.tipo = '#39'REQ'#39')or(new.tipo = '#39'OS'#39')) and (coalesce(new.' +
          'status,'#39#39')='#39#39') and (almox ='#39'S2'#39') and (new.cod_pedido > 0)) then'
        '  begin'
        '  delete from controle_almoxarifado'
        
          '  where controle_almoxarifado.cod_pedido = new.cod_pedido and co' +
          'ntrole_almoxarifado.cod_empresa = new.cod_empresa and controle_a' +
          'lmoxarifado.nitem = coalesce(new.nitem_pedido, 1);'
        '  end'
        '  end'
        '  else if (deleting)then'
        '  begin'
        '  select trim(empresa.almox) from empresa'
        '  where empresa.cod_empresa = old.cod_empresa'
        '  into :almox;'
        ''
        
          '  if(((old.tipo = '#39'REQ'#39')or(old.tipo = '#39'OS'#39')) and (almox ='#39'S2'#39') a' +
          'nd(old.cod_pedido > 0))  then'
        '  begin'
        
          '  insert into controle_almoxarifado (controle_almoxarifado.cod_p' +
          'edido, controle_almoxarifado.nitem,'
        
          '  controle_almoxarifado.cod_empresa,  controle_almoxarifado.tipv' +
          ', controle_almoxarifado.cod_cond_pag,'
        
          '  controle_almoxarifado.cod_vendedor, controle_almoxarifado.grup' +
          'o_prod, controle_almoxarifado.cod_prod,'
        
          '  controle_almoxarifado.num_fab_prod, controle_almoxarifado.quan' +
          't, controle_almoxarifado.vlun,'
        '  controle_almoxarifado.vltot, controle_almoxarifado.cod_grade,'
        
          '  controle_almoxarifado.codigo_nop, controle_almoxarifado.sit_at' +
          'd, controle_almoxarifado.descr_prod,'
        
          '  controle_almoxarifado.data_pedido, controle_almoxarifado.hora_' +
          'pedido, controle_almoxarifado.cod_cliente)'
        ''
        
          '  select pedvenda_prod.cod_pedido, 1 nitem, pedvenda_prod.cod_em' +
          'presa, pedvenda.tipv, coalesce(pedvenda.cod_cond_pag, 1),'
        
          '  pedvenda_prod.cod_vendedor, pedvenda_prod.grupo_prod, pedvenda' +
          '_prod.cod_prod, pedvenda_prod.num_fab_prod,'
        
          '  pedvenda_prod.quant_ped_item, pedvenda_prod.vlun_ped_item, ped' +
          'venda_prod.vltot_ped_item,'
        
          '  pedvenda_prod.cod_grade, pedvenda_prod.codigo_nop, '#39'DV'#39' sit_at' +
          'd, pedvenda_prod.descr_prod_ped,'
        
          '  current_date, current_time, pedvenda.cod_cliente from pedvenda' +
          ' inner join pedvenda_prod on pedvenda_prod.nped = pedvenda.nped'
        
          '  and pedvenda_prod.tipo = pedvenda.tipo and pedvenda_prod.cod_e' +
          'mpresa = pedvenda.cod_empresa'
        
          '  where pedvenda_prod.nped = old.nped and pedvenda_prod.nitem = ' +
          'old.nitem'
        
          '  and pedvenda_prod.cod_empresa = old.cod_empresa and pedvenda_p' +
          'rod.tipo = old.tipo;'
        '  end'
        '  end'
        '  if(updating) then'
        '  begin'
        ''
        '  select trim(empresa.almox) from empresa'
        '  where empresa.cod_empresa = new.cod_empresa'
        '  into :almox;'
        ''
        
          '  if ((coalesce(old.status,'#39#39')<>new.status) and (new.status = '#39'C' +
          'ANCELADO'#39') and (((new.tipo = '#39'REQ'#39'))or(new.tipo = '#39'OS'#39')) and (al' +
          'mox ='#39'S2'#39') and(new.cod_pedido > 0))then'
        '  begin'
        
          '   insert into controle_almoxarifado (controle_almoxarifado.cod_' +
          'pedido, controle_almoxarifado.nitem,'
        
          '   controle_almoxarifado.cod_empresa, controle_almoxarifado.tipv' +
          ', controle_almoxarifado.cod_cond_pag,'
        
          '   controle_almoxarifado.cod_vendedor, controle_almoxarifado.gru' +
          'po_prod, controle_almoxarifado.cod_prod,'
        
          '   controle_almoxarifado.num_fab_prod, controle_almoxarifado.qua' +
          'nt, controle_almoxarifado.vlun,'
        
          '   controle_almoxarifado.vltot, controle_almoxarifado.cod_grade,' +
          ' controle_almoxarifado.codigo_nop,'
        
          '   controle_almoxarifado.sit_atd, controle_almoxarifado.descr_pr' +
          'od,'
        
          '   controle_almoxarifado.data_pedido, controle_almoxarifado.hora' +
          '_pedido, controle_almoxarifado.cod_cliente)'
        ''
        
          '   select pedvenda_prod.cod_pedido, 1 nitem, pedvenda_prod.cod_e' +
          'mpresa, pedvenda.tipv, coalesce(pedvenda.cod_cond_pag, 1),'
        
          '   pedvenda_prod.cod_vendedor, pedvenda_prod.grupo_prod, pedvend' +
          'a_prod.cod_prod, pedvenda_prod.num_fab_prod,'
        
          '   pedvenda_prod.quant_ped_item, pedvenda_prod.vlun_ped_item, pe' +
          'dvenda_prod.vltot_ped_item,'
        
          '   pedvenda_prod.cod_grade, pedvenda_prod.codigo_nop, '#39'DV'#39' sit_a' +
          'td, pedvenda_prod.descr_prod_ped,'
        
          '   current_date, current_time, pedvenda.cod_cliente from pedvend' +
          'a inner join pedvenda_prod on pedvenda_prod.nped = pedvenda.nped'
        
          '   and pedvenda_prod.tipo = pedvenda.tipo and pedvenda_prod.cod_' +
          'empresa = pedvenda.cod_empresa'
        
          '   where pedvenda_prod.nped = new.nped and pedvenda_prod.nitem =' +
          ' new.nitem'
        
          '   and pedvenda_prod.cod_empresa = new.cod_empresa and pedvenda_' +
          'prod.tipo = new.tipo;'
        '   end'
        ''
        
          '  if ((coalesce(old.status,'#39#39')='#39#39') and (old.quant_ped_item > new' +
          '.quant_ped_item) and ((new.tipo = '#39'REQ'#39')or(new.tipo = '#39'OS'#39')) and' +
          ' (almox ='#39'S2'#39') and(new.cod_pedido > 0))then'
        '  begin'
        '   select (count(*) + 1) as nitem from controle_almoxarifado'
        '   where controle_almoxarifado.cod_pedido = new.cod_pedido'
        '   into :nitem;'
        ''
        
          '   insert into controle_almoxarifado (controle_almoxarifado.cod_' +
          'pedido, controle_almoxarifado.nitem,'
        
          '   controle_almoxarifado.cod_empresa, controle_almoxarifado.tipv' +
          ', controle_almoxarifado.cod_cond_pag,'
        
          '   controle_almoxarifado.cod_vendedor, controle_almoxarifado.dat' +
          'a_pedido, controle_almoxarifado.hora_pedido,'
        
          '   controle_almoxarifado.grupo_prod, controle_almoxarifado.cod_p' +
          'rod, controle_almoxarifado.num_fab_prod,'
        
          '   controle_almoxarifado.quant, controle_almoxarifado.vlun, cont' +
          'role_almoxarifado.vltot, controle_almoxarifado.cod_grade,'
        
          '   controle_almoxarifado.codigo_nop, controle_almoxarifado.sit_a' +
          'td, controle_almoxarifado.descr_prod,'
        
          '   controle_almoxarifado.cod_vendedor1,  controle_almoxarifado.d' +
          'ata_atd, controle_almoxarifado.hora_atd, controle_almoxarifado.c' +
          'od_cliente)'
        ''
        
          '   select pedvenda_prod.cod_pedido, :nitem as nitem, pedvenda_pr' +
          'od.cod_empresa, pedvenda.tipv, coalesce(pedvenda.cod_cond_pag, 1' +
          '),'
        
          '   pedvenda_prod.cod_vendedor, pedvenda_prod.data_atd, pedvenda_' +
          'prod.hora_atd,'
        
          '   pedvenda_prod.grupo_prod, pedvenda_prod.cod_prod, pedvenda_pr' +
          'od.num_fab_prod,'
        
          '   old.quant_ped_item - new.quant_ped_item, pedvenda_prod.vlun_p' +
          'ed_item, (old.quant_ped_item - new.quant_ped_item) * pedvenda_pr' +
          'od.vlun_ped_item,'
        
          '   pedvenda_prod.cod_grade, pedvenda_prod.codigo_nop, '#39'DV'#39' sit_a' +
          'td, pedvenda_prod.descr_prod_ped,'
        
          '   pedvenda_prod.cod_almoxarifado, current_date, current_time, p' +
          'edvenda.cod_cliente'
        
          '   from pedvenda inner join pedvenda_prod on pedvenda_prod.nped ' +
          '= pedvenda.nped'
        
          '   and pedvenda_prod.tipo = pedvenda.tipo and pedvenda_prod.cod_' +
          'empresa = pedvenda.cod_empresa'
        
          '   where pedvenda_prod.nped = new.nped and pedvenda_prod.nitem =' +
          ' new.nitem'
        
          '   and pedvenda_prod.cod_empresa = new.cod_empresa and pedvenda_' +
          'prod.tipo = new.tipo;'
        '  end'
        ''
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_NAT_OP_BIU_FAT FOR NAT_OP'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (new.receita_pis_cofins <> old.receita_pis_cofins) then'
        '    new.faturamento = new.receita_pis_cofins;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW COMPRASMESESV4('
        '    NUM_NOTA,'
        '    CHASSI,'
        '    DATA_CH_NOTA,'
        '    DESCRICAO_VERSAO,'
        '    COR,'
        '    ANO_FAB,'
        '    ANO_MOD,'
        '    CUSTO,'
        '    COD_EMPRESA)'
        'AS'
        
          'select it.num_nota,it.chassi_c,et.data_ch_nota,it.descricao_vers' +
          'ao,'
        
          'it.cor,it.ano_fab,it.ano_mod,((et.valor_tot_nota/et.qtde_motos_n' +
          'ota)+it.piscofins),et.cod_empresa'
        'from ent_moto_itens it,ent_moto et'
        'where'
        'it.num_nota = et.num_nota'
        'and it.cod_fornecedor = et.cod_fornecedor and '
        '(et.cod_fisc_nota <> 1409 and'
        'et.cod_fisc_nota <> 2409 and et.cod_fisc_nota <> 1913)'
        'and it.cod_empresa = et.cod_empresa and et.ativo = 1'
        'union'
        
          'select nf4.num_nf,it4.chassi,nf4.data_lanc,substr(it4.descricao_' +
          'item,1,25),'
        
          'itv4.cor,itv4.ano_fab,itv4.ano_mod,it4.prec_cusm_prod,nf4.cod_em' +
          'presa'
        'from notafiscal nf4 inner join notafiscal_item it4 on'
        'nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa'
        'inner join notafiscal_item_veiculo itv4'
        
          'on it4.cod_nf=itv4.cod_nf and it4.cod_empresa = itv4.cod_empresa' +
          ' and'
        'it4.chassi = itv4.chassi'
        'where nf4.natureza_nf='#39'E'#39' and (nf4.status = '#39'Fechada'#39')'
        'and (nf4.codigo_nop <> 1409 and nf4.tipo_nf = '#39'V'#39' and'
        'nf4.codigo_nop <> 2409 and nf4.codigo_nop <> 1913)'
        'and nf4.ativo=1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW FICHAVENDAPROD('
        '    TP,'
        '    NOME_CLIENTE,'
        '    NDOC,'
        '    VALOR,'
        '    DATA,'
        '    DATA_FECH,'
        '    DESCR_PROD,'
        '    NUM_FAB_PROD,'
        '    QTDE,'
        '    VL_UNIT,'
        '    VL_TOT,'
        '    COD_CLIENTE,'
        '    COD_EMPRESA,'
        '    COD_PROD,'
        '    GRUPO_PROD)'
        'AS'
        
          'select '#39'REQ'#39',cl.nome_cliente, r.nreq, r.valor_total, r.data_req,' +
          ' r.data_c, ri.desc_prod_req,'
        
          'ri.num_fab_prod, ri.quant_rq_item, ri.vlun_rq_item, ri.vltot_rq_' +
          'item,'
        'r.cod_cliente, r.cod_empresa, P.cod_prod, p.grupo_prod'
        'from reqvenda r'
        
          'inner join reqvenda_itens ri on ri.nreq = r.nreq and ri.cod_empr' +
          'esa = r.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = r.cod_cliente and cl.' +
          'cod_empresa = r.cod_empresa'
        
          'inner join produtos p on p.cod_prod = ri.cod_prod and p.grupo_pr' +
          'od = ri.grupo_prod and p.cod_empresa = ri.cod_empresa'
        'where ri.n_nf is null and r.ativo = 1'
        'union'
        
          'select '#39'OS '#39',cl.nome_cliente ,os.n_os, os.valor_os, os.data_os, ' +
          'os.data_fec_os, osi.desc_os_prod,'
        
          'osi.num_fab_prod, osi.quant_os_prod, osi.vl_unt_os_prod, osi.vl_' +
          'tot_os_prod,'
        'os.cod_cliente, os.cod_empresa , P.cod_prod, p.grupo_prod'
        'from ordem_serv os'
        
          'inner join os_item_prod osi on os.n_os = osi.n_os and os.cod_emp' +
          'resa = osi.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = os.cod_cliente and cl' +
          '.cod_empresa = os.cod_empresa'
        
          'inner join produtos p on p.cod_prod = osi.cod_prod and p.grupo_p' +
          'rod = osi.grupo_prod and p.cod_empresa = osi.cod_empresa'
        'where osi.n_nf is null and os.ativo = 1'
        'union'
        
          'select '#39'NF '#39',cl.nome_cliente ,nf.num_nf_vnd, nf.vl_tot_vnd, nf.d' +
          'ata_em_vnd, nf.data_ets_vnd, nfi.desc_prod_nf,'
        
          'nfi.num_fab_prod, nfi.quant_item_vnd, nfi.vlun_item_vnd, nfi.vlt' +
          'ot_item_vnd,'
        'nf.cod_cliente, nf.cod_empresa, P.cod_prod, p.grupo_prod'
        'from nf_venda nf'
        
          'inner join item_nfvenda nfi on nf.num_nf_vnd = nfi.num_nf_vnd an' +
          'd nf.cod_empresa = nfi.cod_empresa'
        
          'inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl' +
          '.cod_empresa = nf.cod_empresa'
        
          'inner join produtos p on p.cod_prod = nfi.cod_prod and p.grupo_p' +
          'rod = nfi.grupo_prod and p.cod_empresa = nfi.cod_empresa'
        'and nf.sub_serie = nfi.sub_serie where nf.ativo = 1;'
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
        '    STATUS_ITEM)'
        'AS'
        
          'select '#39'P'#39' tipops ,p.tipo,p.status_ped,p.valor_total,c.cod_clien' +
          'te,c.nome_cliente,p.data_ped,p.data_fech,pp.nped,pp.cod_prod,'
        '    pp.grupo_prod grupoOuServ,pp.cod_empresa, pp.num_fab_prod,'
        
          '     pp.quant_ped_item qtde, pp.vlun_ped_item vl_unit,pp.descr_p' +
          'rod_ped descr,'
        
          '     pp.rateio_desc,pp.rateio_acresc,pp.acresc_item, pp.desc_ite' +
          'm,'
        '     pp.dav_origem,pp.nped_origem,pp.tipo_origem,pp.status'
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
        '     ps.dav_origem,ps.nped_origem,ps.tipo_origem,ps.status'
        '     from pedvenda_serv ps'
        
          '     inner join pedvenda p on p.nped = ps.nped and p.cod_empresa' +
          ' = ps.cod_empresa and ps.tipo = p.tipo'
        
          '     inner join clientes c on c.cod_cliente = p.cod_cliente and ' +
          'c.cod_empresa = p.cod_empresa'
        '     where p.ativo = 1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW ORCAMENTO3('
        '    COD_EMPRESA,'
        '    PROD_SERV,'
        '    NITEM,'
        '    NPED,'
        '    COD_PROD_SER,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    DESCRICAO,'
        '    QUANTIDADE,'
        '    VL_UNITARIO,'
        '    VL_TOTAL_ITEM,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    MARCA_P)'
        'AS'
        
          'select pvp.cod_empresa, '#39'PRODUTO'#39',pvp.nitem,pvp.nped,'#39'P-'#39'||p.num' +
          '_fab_prod,pvp.grupo_prod,pvp.cod_prod,pvp.descr_prod_ped,pvp.qua' +
          'nt_ped_item,'
        'pvp.vlun_ped_item,pvp.vltot_ped_item,'
        
          'case when (pv.desc_p_prod is null) and (pv.desconto is null) the' +
          'n 0'
        'else ('
        
          'coalesce(pvp.vltot_ped_item,0) * (coalesce(pv.desc_p_prod,0)/100' +
          ')) +'
        '((coalesce(pv.desconto,0)/'
        'case when ('
        
          'coalesce((select sum(pedp.vltot_ped_item) from pedvenda_prod ped' +
          'p where pedp.nped=pv.nped and pedp.cod_empresa=pv.cod_empresa),0' +
          ')'
        
          '+coalesce((select sum(peds.valor_tot_serv) from pedvenda_serv pe' +
          'ds where peds.nped=pv.nped and peds.cod_empresa=pv.cod_empresa),' +
          '0)'
        ') =0 then 1 else ('
        
          'coalesce((select sum(pedp.vltot_ped_item) from pedvenda_prod ped' +
          'p where pedp.nped=pv.nped and pedp.cod_empresa=pv.cod_empresa),0' +
          ')'
        
          '+coalesce((select sum(peds.valor_tot_serv) from pedvenda_serv pe' +
          'ds where peds.nped=pv.nped and peds.cod_empresa=pv.cod_empresa),' +
          '0)'
        ') end'
        ')*coalesce(pvp.vltot_ped_item,0))'
        'end as rateio_desc,'
        'coalesce(pvp.rateio_acresc,0) as rateio_acresc,p.marca_p'
        
          'from pedvenda pv inner join pedvenda_prod pvp on pv.nped=pvp.npe' +
          'd and pv.cod_empresa=pvp.cod_empresa and pv.tipo=pvp.tipo inner ' +
          'join produtos p on pvp.grupo_prod=p.grupo_prod and pvp.cod_prod=' +
          'p.cod_prod and pvp.cod_empresa=p.cod_empresa'
        'where pvp.tipo='#39'ORC'#39' and pvp.ativo=1'
        'union'
        
          'select pvs.cod_empresa, '#39'SERVICO'#39',pvs.nitem,pvs.nped,'#39'S-'#39'||pvs.c' +
          'od_servico,null, null, pvs.desc_serv_ped,pvs.quant_serv_ped,'
        'pvs.valor_un_serv,pvs.valor_tot_serv,'
        
          'case when (pv.desc_p_serv is null) and (pv.desconto is null) the' +
          'n 0'
        
          'else (coalesce(pvs.valor_tot_serv,0)*(coalesce(pv.desc_p_serv,0)' +
          '/100)) +'
        '((coalesce(pv.desconto,0)/'
        'case when('
        
          'coalesce((select sum(pedp.vltot_ped_item) from pedvenda_prod ped' +
          'p where pedp.nped=pv.nped and pedp.cod_empresa=pv.cod_empresa),0' +
          ')+'
        
          'coalesce((select sum(peds.valor_tot_serv) from pedvenda_serv ped' +
          's where peds.nped=pv.nped and peds.cod_empresa=pv.cod_empresa),0' +
          ')'
        ')=0 then 1 else ('
        
          'coalesce((select sum(pedp.vltot_ped_item) from pedvenda_prod ped' +
          'p where pedp.nped=pv.nped and pedp.cod_empresa=pv.cod_empresa),0' +
          ')+'
        
          'coalesce((select sum(peds.valor_tot_serv) from pedvenda_serv ped' +
          's where peds.nped=pv.nped and peds.cod_empresa=pv.cod_empresa),0' +
          ')'
        ') end'
        ')*coalesce(pvs.valor_tot_serv,0))'
        'end as rateio_desc,'
        'coalesce(pvs.rateio_acresc,0) as rateio_acresc,null'
        
          'from pedvenda pv inner join pedvenda_serv pvs on pv.nped=pvs.npe' +
          'd and pv.cod_empresa=pvs.cod_empresa and pv.tipo=pvs.tipo'
        'where pvs.tipo='#39'ORC'#39' and pvs.ativo=1'
        'union'
        
          'select vpt.cod_empresa, '#39'PRODUTOT'#39',null,vpt.nped, '#39'PROD-T'#39',null,' +
          'null,vpt.descricao,vpt.qtde,vpt.vl_unit,vpt.vl_total,0, 0,null  ' +
          'from pedvenda pv inner join pedvenda_prod_terc vpt on pv.nped=vp' +
          't.nped and pv.cod_empresa=vpt.cod_empresa and pv.tipo=vpt.tipo'
        'where vpt.tipo='#39'ORC'#39' and vpt.ativo=1'
        'union'
        
          'select vst.cod_empresa, '#39'SERVICOT'#39',null,vst.nped, '#39'SERV-T'#39',null,' +
          'null,vst.descr_servt,1,vst.vl_servt,vst.vl_servt,0, 0,null  from' +
          ' pedvenda pv inner join pedvenda_serv_terc vst on pv.nped=vst.np' +
          'ed and pv.cod_empresa=vst.cod_empresa and pv.tipo=vst.tipo'
        'where vst.tipo='#39'ORC'#39' and vst.ativo=1;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER FLW_PESQUISA_BD_CODPESQ FOR FLW_PESQUISA'
        'ACTIVE BEFORE DELETE POSITION 0'
        'AS'
        'begin'
        '  if (old.tipo_ped = '#39'ATD'#39') then'
        '    update flw_atendimento set codpesquisa = null'
        
          '      where codatendimento = old.nped and cod_empresa =  old.cod' +
          '_empresa;'
        '  else'
        '  begin'
        '    update pedvenda set codpesquisa = null'
        
          '      where nped = old.nped and tipo = old.tipo_ped and cod_empr' +
          'esa =  old.cod_empresa;'
        '  end'
        ''
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER trg_itens_carta FOR ITENS_CARTA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS BEGIN'
        '  if (new.codigo is null) then'
        '  new.codigo = gen_id(INC_itens_carta,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NOTAFISCAL_BOLETAS FOR NOTAFISCAL'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        
          '  if ((coalesce(new.situacao_nfe,'#39#39')='#39'Autorizada'#39') and (coalesce' +
          '(old.situacao_nfe,'#39#39') <> new.situacao_nfe) and (trim(new.modelo_' +
          'nf)='#39'55'#39')) then'
        '  begin'
        
          '   update boletas set boletas.nf_aut = '#39'S'#39' where boletas.num_nf_' +
          'vnd = new.num_nf and boletas.cod_empresa = new.cod_empresa and b' +
          'oletas.nf_aut <> '#39'S'#39' and cast (boletas.sub_serie as varchar(11))' +
          ' = cast(new.serie as varchar(11));'
        '  end'
        '  else if (trim(new.modelo_nf) <> '#39'55'#39') then'
        '  begin'
        
          '   update boletas set boletas.nf_aut = '#39'S'#39' where boletas.num_nf_' +
          'vnd = new.num_nf and boletas.cod_empresa = new.cod_empresa and b' +
          'oletas.nf_aut <> '#39'S'#39' and cast (boletas.sub_serie as varchar(11))' +
          ' = cast(new.serie as varchar(11));'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW CRED_JUR*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW SPED_PRESUMIDO*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW FICHAPRODUTOS('
        '    TIPO,'
        '    NATUREZA,'
        '    EMPRESA,'
        '    NUMDOC,'
        '    NITEM,'
        '    DATA,'
        '    CLIENTE,'
        '    COD_EMPRESA,'
        '    DESCR_GRUPO,'
        '    GRUPO_PROD,'
        '    COD_PROD,'
        '    COD_GRADE,'
        '    DESCR_GRADE,'
        '    NUM_FAB_PROD,'
        '    DESCR_PROD,'
        '    EST_F,'
        '    EST_PROD,'
        '    PREC_TAB_PROD,'
        '    PREC_PUBLICO,'
        '    PREC_CUS_PRD,'
        '    ENTRADA,'
        '    SAIDA,'
        '    VLTOT_VENDA)'
        'AS'
        
          'select distinct '#39'VENDA'#39' TIPO, '#39'S'#39' NATUREZA, emp.nome_emp EMPRESA' +
          ', ped.nped NUMDOC, pedpro.nitem, ped.data_fech DATA, (cl.cod_cli' +
          'ente ||'#39' - '#39'|| cl.nome_cliente) CLIENTE, pr.cod_empresa,gr.descr' +
          'icao descr_grupo, pr.grupo_prod, pr.cod_prod, coalesce(gra.cod_g' +
          'rade, 0) cod_grade, coalesce(gra.descricao,'#39'SEM GRADE'#39') descr_gr' +
          'ade, pr.num_fab_prod, pr.descr_prod,'
        
          '(case when coalesce(gra.cod_grade, 0) <= 0 then coalesce(pr.est_' +
          'f,0) else coalesce(gp.qtde,0) end) EST_F,'
        'coalesce(pr.est_f,0) est_prod,'
        
          'coalesce(pr.prec_tab_prod, 0) prec_tab_prod, coalesce(pr.prec_pu' +
          'blico,0) prec_publico, coalesce(pr.prec_cus_prod,0) prec_cus_pro' +
          'd,'
        
          '0.00 ENTRADA, coalesce(pedpro.quant_ped_item,0) SAIDA, (coalesce' +
          '(pedpro.vltot_ped_item,0) + coalesce(pedpro.acresc_item,0) - coa' +
          'lesce(pedpro.desc_item,0)) VLTOT_VENDA'
        'from produtos pr'
        
          'inner join pedvenda_prod pedpro on pedpro.grupo_prod = pr.grupo_' +
          'prod and pedpro.cod_prod = pr.cod_prod and pedpro.cod_empresa = ' +
          'pr.cod_empresa and coalesce(pedpro.status,'#39#39') <> '#39'CANCELADO'#39
        
          'inner join pedvenda ped on ped.nped = pedpro.nped and ped.tipo =' +
          ' pedpro.tipo and ped.cod_empresa = pedpro.cod_empresa and ped.ti' +
          'po <> '#39'ORC'#39' and (not ped.status_ped is null or ped.status_ped <>' +
          ' '#39#39#39#39')'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        
          'left join grade gra on gra.cod_grade = pedpro.cod_grade and gra.' +
          'cod_empresa = pedpro.cod_empresa'
        
          'left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and ' +
          'gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and ' +
          'gp.cod_empresa = pr.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = ped.cod_cliente and cl' +
          '.cod_empresa = ped.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa'
        'union'
        
          'select distinct '#39'PRODUCAO'#39' TIPO, '#39'E'#39' NATUREZA, emp.nome_emp EMPR' +
          'ESA, pd.cod_producao NUMDOC, pdi.nitem, pd.data_fechamento DATA,' +
          ' (cl.cod_cliente ||'#39' - '#39'|| cl.nome_cliente) CLIENTE, pr.cod_empr' +
          'esa,gr.descricao descr_grupo, pr.grupo_prod, pr.cod_prod, 0 cod_' +
          'grade, '#39'SEM GRADE'#39' descr_grade, pr.num_fab_prod, pr.descr_prod,'
        
          'pr.est_f, coalesce(pr.est_f,0) est_prod, coalesce(pr.prec_tab_pr' +
          'od, 0) prec_tab_prod, coalesce(pr.prec_publico,0) prec_publico, ' +
          'coalesce(pr.prec_cus_prod,0) prec_cus_prod,'
        'coalesce(pdi.quantidade,0) ENTRADA, 0.00 SAIDA, 0.00 VLTOT_VENDA'
        'from produtos pr'
        
          'inner join producao_item pdi on pdi.grupo_prod = pr.grupo_prod a' +
          'nd pdi.cod_prod = pr.cod_prod and pdi.cod_empresa = pr.cod_empre' +
          'sa'
        
          'inner join producao pd on pd.cod_producao = pdi.cod_producao and' +
          ' pd.cod_empresa = pdi.cod_empresa'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        
          'left join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.' +
          'cod_empresa = pd.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa'
        'where pd.status = '#39'FECHADO'#39
        'union'
        
          'select distinct '#39'NF'#39' TIPO, '#39'E'#39' NATUREZA, emp.nome_emp EMPRESA, n' +
          'f.num_nf NUMDOC, nfi.nitem, nf.data_lanc DATA, (cl.cod_cliente |' +
          '|'#39' - '#39'|| cl.nome_cliente) CLIENTE, pr.cod_empresa, gr.descricao ' +
          'descr_grupo, pr.grupo_prod, pr.cod_prod, coalesce(gra.cod_grade,' +
          ' 0) cod_grade, coalesce(gra.descricao,'#39'SEM GRADE'#39') descr_grade, ' +
          'pr.num_fab_prod, pr.descr_prod,'
        
          '(case when coalesce(gra.cod_grade, 0) <= 0 then coalesce(pr.est_' +
          'f,0) else coalesce(gp.qtde,0) end) EST_F,'
        
          'coalesce(pr.est_f,0) est_prod, coalesce(pr.prec_tab_prod, 0) pre' +
          'c_tab_prod, coalesce(pr.prec_publico,0) prec_publico, coalesce(p' +
          'r.prec_cus_prod,0) prec_cus_prod,'
        
          '(case when coalesce(gra.cod_grade, 0) <= 0 then coalesce(nfi.qua' +
          'ntidade,0) else coalesce(grcomp.qtde,0) end) ENTRADA,'
        '0.00 SAIDA, 0.00 VLTOT_VENDA'
        'from produtos pr'
        
          'inner join notafiscal_item nfi on nfi.grupo_prod = pr.grupo_prod' +
          ' and nfi.cod_prod = pr.cod_prod and nfi.cod_empresa = pr.cod_emp' +
          'resa and (nfi.altera_estoque_cfop <> '#39'N'#39' or nfi.altera_estoque_c' +
          'fop is null)'
        
          'inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nfi.cod_e' +
          'mpresa = nf.cod_empresa and nf.natureza_nf ='#39'E'#39' and nf.status ='#39 +
          'Fechada'#39' and nf.ativo = 1'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        'left join cod_grade_prod_compra grcomp on'
        
          'nfi.grupo_prod = grcomp.grupo_prod and nfi.cod_prod = grcomp.cod' +
          '_prod and nfi.cod_empresa = grcomp.cod_empresa and'
        
          'nfi.cod_nf = grcomp.num_nota_nfe and nfi.nitem = grcomp.cod_forn' +
          '_nfe'
        
          'left join grade gra on grcomp.cod_grade = gra.cod_grade and grco' +
          'mp.cod_empresa = gra.cod_empresa'
        
          'left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and ' +
          'gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and ' +
          'gp.cod_empresa = pr.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.' +
          'cod_empresa = nf.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa'
        'union'
        
          'select distinct '#39'PRODUCAO'#39' TIPO, '#39'S'#39' NATUREZA, emp.nome_emp EMPR' +
          'ESA, pd.cod_producao NUMDOC, pi.nitem, pd.data_fechamento DATA, ' +
          '(cl.cod_cliente ||'#39' - '#39'|| cl.nome_cliente) CLIENTE, pr.cod_empre' +
          'sa, gr.descricao descr_grupo, pr.grupo_prod, pr.cod_prod, 0 cod_' +
          'grade, '#39'SEM GRADE'#39' descr_grade, pr.num_fab_prod, pr.descr_prod,'
        
          'pr.est_f, coalesce(pr.est_f,0) est_prod, coalesce(pr.prec_tab_pr' +
          'od, 0) prec_tab_prod, coalesce(pr.prec_publico,0) prec_publico, ' +
          'coalesce(pr.prec_cus_prod,0) prec_cus_prod,'
        
          '0.00 ENTRADA, coalesce(pi.quantidade_utilizada,0) SAIDA, 0.00 VL' +
          'TOT_VENDA'
        'from produtos pr'
        
          'inner join producao_item_indice pi on pi.grupo_prod = pr.grupo_p' +
          'rod and pi.cod_prod = pr.cod_prod and pi.cod_empresa = pr.cod_em' +
          'presa'
        
          'inner join producao pd on pd.cod_producao = pi.cod_producao and ' +
          'pd.cod_empresa = pi.cod_empresa'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        
          'left join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.' +
          'cod_empresa = pd.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa'
        'where pd.status = '#39'FECHADO'#39
        'union'
        
          'select distinct '#39'DEV'#39' TIPO, '#39'E'#39' NATUREZA, emp.nome_emp EMPRESA, ' +
          'dev.sequencia, 1 nitem, dev.data, (cl.cod_cliente ||'#39' - '#39'|| cl.n' +
          'ome_cliente) CLIENTE, pr.cod_empresa, gr.descricao descr_grupo, ' +
          'pr.grupo_prod, pr.cod_prod, coalesce(gra.cod_grade, 0) cod_grade' +
          ', coalesce(gra.descricao,'#39'SEM GRADE'#39') descr_grade, pr.num_fab_pr' +
          'od, pr.descr_prod,'
        
          '(case when coalesce(gra.cod_grade, 0) <= 0 then coalesce(pr.est_' +
          'f,0) else coalesce(gp.qtde,0) end) EST_F,'
        
          'coalesce(pr.est_f,0) est_prod, coalesce(pr.prec_tab_prod, 0) pre' +
          'c_tab_prod, coalesce(pr.prec_publico,0) prec_publico, coalesce(p' +
          'r.prec_cus_prod,0) prec_cus_prod,'
        'coalesce(dev.quant,0) ENTRADA, 0.00 SAIDA, 0.00 VLTOT_VENDA'
        'from produtos pr'
        
          'inner join devolucao dev on dev.grupo_prod = pr.grupo_prod and d' +
          'ev.cod_prod = pr.cod_prod and dev.cod_empresa = pr.cod_empresa'
        'left join grupos gr on gr.codigo_grup = pr.grupo_prod'
        
          'left join grade gra on gra.cod_grade = dev.cod_grade and gra.cod' +
          '_empresa = dev.cod_empresa'
        
          'left join cod_grade_prod gp on gp.cod_grade = gra.cod_grade and ' +
          'gp.grupo_prod = pr.grupo_prod and gp.cod_prod = pr.cod_prod and ' +
          'gp.cod_empresa = pr.cod_empresa'
        
          'left join clientes cl on cl.cod_cliente = dev.cod_cliente and cl' +
          '.cod_empresa = dev.cod_empresa'
        'inner join empresa emp on emp.cod_empresa = pr.cod_empresa;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER GEN_CODIGO_CORFAB FOR CODIGO_CORFAB'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        '  IF (NEW.COD_COR is null) THEN'
        '    NEW.COD_COR = GEN_ID(INC_CODIGO_CORFAB,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_OS_GARANTIA ('
        '    PCAMPOPESQUISA varchar(10))'
        'returns ('
        '    RETORNO char(1))'
        'as'
        'declare variable VCOMGARANTIA char(1);'
        'begin'
        '  select tipo_vendas.comgarantia from tipo_vendas'
        
          '      where tipo = '#39'OS'#39' and tipo_os = :pcampopesquisa and ativo ' +
          '= 1'
        '      into :vcomgarantia;'
        '  retorno = '#39'N'#39';'
        '  if ( ltrim(rtrim(vcomgarantia))  <> '#39#39' ) then'
        '    retorno = ltrim(rtrim(vcomgarantia));'
        ''
        '  suspend;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW FICHAVENDAPROD_SERV*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER trigger observacao_bi_datahora for observacao'
        'active before insert position 0'
        'AS'
        'declare variable vnitem integer;'
        'begin'
        '  select coalesce((max(obs.nitem)+1),1) from observacao obs'
        
          '  where obs.cod_obs=new.cod_obs and obs.cod_empresa= new.cod_emp' +
          'resa'
        '  into :vnitem;'
        '  new.data_obs = current_date;'
        '  new.hora_obs = current_time;'
        '  new.nitem = vnitem;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NOTAFISCAL_AU_NUMNF_REP FOR NOTAFISCAL'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        'declare variable VNUMNF integer;'
        'begin'
        
          '    if ((((new.emissao_propria = '#39'S'#39') and (new.natureza_nf = '#39'S'#39 +
          ')) or'
        
          '    ((new.emissao_propria = '#39'S'#39') and (new.natureza_nf = '#39'E'#39') and' +
          ' (new.num_gerado = '#39'S'#39'))) and'
        '    (new.num_nf > 0) ) then'
        '  begin'
        ''
        
          '    select first 1 num_nf from notafiscal nf where nf.num_nf = n' +
          'ew.num_nf and nf.cod_empresa = new.cod_empresa and'
        
          '      nf.modelo_nf = new.modelo_nf and nf.serie = new.serie and ' +
          'nf.emissao_propria = '#39'S'#39' and'
        '      nf.cod_nf <> new.cod_nf and'
        
          '      ((nf.natureza_nf = '#39'S'#39') or ( (nf.natureza_nf = '#39'E'#39') and (n' +
          'f.num_gerado = '#39'S'#39') )) into :VNUMNF;'
        ''
        '    if (coalesce(:vnumnf,0) > 0) then'
        '      EXCEPTION exc_num_nf_repetido;'
        ''
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER GEN_COD_OCORRENCIA_ADM FOR OCORRENCIA_AD' +
          'M'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        
          '  if ((NEW.ID_OCORR_ADM is null) or (NEW.ID_OCORR_ADM = 0))  the' +
          'n'
        '    NEW.ID_OCORR_ADM = GEN_ID(INC_COD_OCORR,1);'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER GEN_COD_OCORRENCIA_ADM FOR OCORRENCIA_AD' +
          'M'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'BEGIN'
        
          '  if ((NEW.ID_OCORR_ADM is null) or (NEW.ID_OCORR_ADM = 0))  the' +
          'n'
        '    NEW.ID_OCORR_ADM = GEN_ID(INC_COD_OCORR,1);'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'ALTER TRIGGER ATITEM_RQVENDA INACTIVE;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER PROMOCAO_PRODUTO_SEQID FOR PROMOCAO_PROD' +
          'UTO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        ' DECLARE VARIABLE  vCodigo integer;'
        'BEGIN'
        '   if (NEW.SEQID IS NULL) then'
        '   begin'
        
          '     select cod from INCREMENTA_CODIGO(NEW.COD_EMPRESA, '#39'PROMOCA' +
          'O_PRODUTO'#39') into :vCodigo;'
        '     NEW.SEQID = vCodigo;'
        '   end'
        'END;'
        '|/BLOCO|'
        ''
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
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CLAT_MOBILE FOR CLIENTES'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_MODMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CLCAD_MOBILE FOR CLIENTES'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_CADMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CLDEL_MOBILE FOR CLIENTES'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        'IF (USER <> '#39'REPL'#39') THEN BEGIN'
        
          ' insert into del_mobile(seqid,cod_empresa,data_hora_del,id_del,t' +
          'abela)'
        
          ' values ((select cod from incrementa_codigo(old.cod_empresa,'#39'DEL' +
          '_MOBILE'#39')),'
        ' old.cod_empresa, current_timestamp,old.cod_cliente,'#39'CLIENTES'#39');'
        'end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CDAT_MOBILE FOR cidades'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_MODMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CDCAD_MOBILE FOR cidades'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_CADMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CDDEL_MOBILE FOR cidades'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        'IF (USER <> '#39'REPL'#39') THEN BEGIN'
        
          ' insert into del_mobile(seqid,cod_empresa,data_hora_del,id_del,t' +
          'abela)'
        ' values ((select cod from incrementa_codigo(1,'#39'DEL_MOBILE'#39')),'
        ' 1, current_timestamp,old.cod_cidade,'#39'CIDADES'#39');'
        'end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PMAT_MOBILE FOR promocao_produto'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_MODMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PMCAD_MOBILE FOR promocao_produto'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_CADMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PMDEL_MOBILE FOR promocao_produto'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        'IF (USER <> '#39'REPL'#39') THEN BEGIN'
        
          ' insert into del_mobile(seqid,cod_empresa,data_hora_del,id_del,t' +
          'abela)'
        
          ' values ((select cod from incrementa_codigo(old.cod_empresa,'#39'DEL' +
          '_MOBILE'#39')),'
        
          ' old.cod_empresa, current_timestamp,old.seqid,'#39'PROMOCAO_PRODUTO'#39 +
          ');'
        'end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PRAT_MOBILE FOR produtos'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_MODMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PRCAD_MOBILE FOR produtos'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_CADMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PRDEL_MOBILE FOR produtos'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        'IF (USER <> '#39'REPL'#39') THEN BEGIN'
        
          ' insert into del_mobile(seqid,cod_empresa,data_hora_del,id_del,t' +
          'abela)'
        
          ' values ((select cod from incrementa_codigo(old.cod_empresa,'#39'DEL' +
          '_MOBILE'#39')),'
        ' old.cod_empresa, current_timestamp,old.seqid,'#39'PRODUTOS'#39');'
        'end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER PEDVENDA_AI_SIT_PED FOR PEDVENDA*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER BAAT_MOBILE FOR bairros'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_MODMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER BACAD_MOBILE FOR bairros'
        'ACTIVE BEFORE INSERT POSITION 0'
        'as'
        'begin'
        '  NEW.DTHR_CADMOBILE=current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER BADEL_MOBILE FOR bairros'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        'IF (USER <> '#39'REPL'#39') THEN BEGIN'
        
          ' insert into del_mobile(seqid,cod_empresa,data_hora_del,id_del,t' +
          'abela)'
        ' values ((select cod from incrementa_codigo(1,'#39'DEL_MOBILE'#39')),'
        ' 1, current_timestamp,old.cod_bairro,'#39'BAIRROS'#39');'
        'end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure MOVIMENTA_ESTOQUE ('
        '    PGRUPO_PROD integer,'
        '    PCOD_PROD char(6),'
        '    PCOD_EMPRESA integer,'
        '    PCOD_GRADE integer,'
        '    PQTDE_ENTRADA double precision,'
        '    PQTDE_SAIDA double precision,'
        '    PALTDTULTVND integer)'
        'as'
        'declare variable PEXISTEGRADE smallint;'
        'declare variable PEXISTEMOVD smallint;'
        'declare variable VESTOQUE double precision;'
        'declare variable VCUSTOMEDIO double precision;'
        'begin'
        '  if (:pqtde_entrada > 0) then'
        '  begin'
        '    if (:paltdtultvnd > 0) then'
        '    begin'
        
          '      update produtos set est_f = est_f + :pqtde_entrada, dt_ult' +
          '_vnd = dt_ult_vnda'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa;'
        '    end'
        '    else'
        '    begin'
        '      update produtos set est_f = est_f + :pqtde_entrada'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa;'
        '    end'
        ''
        '    if (:pcod_grade > 0) then'
        '    begin'
        '      pexistegrade = 0;'
        '      select first 1 cod_grade from cod_grade_prod'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa'
        '        and cod_grade = :pcod_grade into :pexistegrade;'
        ''
        '      if (coalesce(:pexistegrade,0) > 0) then'
        '      begin'
        '        update cod_grade_prod set qtde = qtde + :pqtde_entrada'
        
          '          where grupo_prod = :pgrupo_prod and cod_prod = :pcod_p' +
          'rod and cod_empresa = :pcod_empresa'
        '          and cod_grade = :pcod_grade;'
        '      end'
        '      else'
        '      begin'
        
          '        insert into cod_grade_prod (grupo_prod, cod_prod, cod_gr' +
          'ade, cod_empresa, qtde, ativo)'
        
          '          values (:pgrupo_prod, :pcod_prod, :pcod_grade, :pcod_e' +
          'mpresa, :pqtde_entrada, 1);'
        '      end'
        '    end'
        '  end'
        '  else if (:pqtde_saida > 0) then'
        '  begin'
        '    if (:paltdtultvnd > 0) then'
        '    begin'
        
          '      update produtos set est_f = est_f - :pqtde_saida, dt_ult_v' +
          'nda = dt_ult_vnd, dt_ult_vnd = current_date'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa;'
        '    end'
        '    else'
        '    begin'
        '      update produtos set est_f = est_f - :pqtde_saida'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa;'
        '    end'
        ''
        '    if (:pcod_grade > 0) then'
        '    begin'
        '      pexistegrade = 0;'
        '      select first 1 cod_grade from cod_grade_prod'
        
          '        where grupo_prod = :pgrupo_prod and cod_prod = :pcod_pro' +
          'd and cod_empresa = :pcod_empresa'
        '        and cod_grade = :pcod_grade into :pexistegrade;'
        ''
        '      if (coalesce(:pexistegrade,0) > 0) then'
        '      begin'
        '        update cod_grade_prod set qtde = qtde - :pqtde_saida'
        
          '          where grupo_prod = :pgrupo_prod and cod_prod = :pcod_p' +
          'rod and cod_empresa = :pcod_empresa'
        '          and cod_grade = :pcod_grade;'
        '      end'
        '      else'
        '      begin'
        
          '        insert into cod_grade_prod (grupo_prod, cod_prod, cod_gr' +
          'ade, cod_empresa, qtde, ativo)'
        
          '          values (:pgrupo_prod, :pcod_prod, :pcod_grade, :pcod_e' +
          'mpresa, ((-1) * :pqtde_saida), 1);'
        '      end'
        '    end'
        '  end'
        ''
        '  pexisteMovD = 0;'
        '  select first 1 cod_empresa from estoque_diario'
        
          '    where grupo_prod = :pgrupo_prod and cod_prod = :pcod_prod an' +
          'd cod_empresa = :pcod_empresa'
        
          '    and cod_grade = :pcod_grade and dia = current_date and tipo ' +
          '= '#39'P'#39' into :pexisteMovD;'
        '    '
        
          '  select case when coalesce(gp.cod_grade, 0) > 0 then gp.qtde el' +
          'se p.est_f end, p.prec_cusm_prod'
        '    from produtos p'
        
          '    left join cod_grade_prod gp on gp.grupo_prod = p.grupo_prod ' +
          'and gp.cod_prod = p.cod_prod'
        
          '      and gp.cod_empresa = p.cod_empresa and gp.cod_grade = :pco' +
          'd_grade'
        
          '    where p.grupo_prod = :pgrupo_prod and p.cod_prod = :pcod_pro' +
          'd and p.cod_empresa = :pcod_empresa'
        '    into :vEstoque, :vCustoMedio;'
        '    '
        '  if (coalesce(:pexisteMovD,0) > 0) then'
        '  begin'
        
          '    update estoque_diario set estoque = :vEstoque, custo_medio =' +
          ' :vCustoMedio'
        
          '      where grupo_prod = :pgrupo_prod and cod_prod = :pcod_prod ' +
          'and cod_empresa = :pcod_empresa'
        
          '      and cod_grade = :pcod_grade and dia = current_date and tip' +
          'o = '#39'P'#39';'
        '  end'
        '  else'
        '  begin'
        
          '    insert into estoque_diario (grupo_prod, cod_prod, cod_empres' +
          'a, cod_grade, dia, estoque, custo_medio, tipo, seqid )'
        
          '      values (:pgrupo_prod, :pcod_prod, :pcod_empresa, :pcod_gra' +
          'de, current_date, :vEstoque, :vCustoMedio, '#39'P'#39', gen_id(INC_ESTOQ' +
          'UE_DIARIO, 1));'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_DES_E('
        '    COD_EMPRESA,'
        '    NUM_DOC,'
        '    TIPO_DOC,'
        '    COD_SERVICO,'
        '    TIPO_REGISTRO,'
        '    DATA_EMISSAO,'
        '    COD_CTISS,'
        '    COD_SUBITEM,'
        '    MODELO_DOCUMENTO,'
        '    SERIE_DOCUMENTO,'
        '    SUBSERIE_DOCUMENTO,'
        '    TIPO_NEGOCIO,'
        '    EXIGIBILIDADE_ISSQN,'
        '    LOCAL_INCIDENCIA,'
        '    REG_ESP_TRIB,'
        '    TIPO_REC_ISSQN,'
        '    NUMERO_DOCUMENTO,'
        '    NUMERO_FINAL,'
        '    VALOR_BRUTO,'
        '    VALOR_SERVICO,'
        '    ALIQUOTA,'
        '    SITUACAO_DOCUMENTO,'
        '    SIMPLES_NACIONAL,'
        '    INSC_MUN_TOMADOR,'
        '    CNPJ_TOMADOR,'
        '    CPF_TOMADOR,'
        '    NOME_TOMADOR,'
        '    LOGRADOURO_TOMADOR,'
        '    NUM_IMOVEL_TOMADOR,'
        '    COMPLEMENTO_TOMADOR,'
        '    BAIRRO_TOMADOR,'
        '    CIDADE_TOMADOR,'
        '    PAIS_TOMADOR,'
        '    CEP_TOMADOR,'
        '    TELEFONE_TOMADOR,'
        '    EMAIL_TOMADOR,'
        '    LOCAL_PRESTACAO,'
        '    PAIS_PRESTACAO,'
        '    DATA_COMPETENCIA,'
        '    DATA_CANCELAMENTO,'
        '    MOTIVO_CANCELAMENTO,'
        '    OUTRO_MOTIVO_CANCELAMENTO)'
        'AS'
        'SELECT PV.COD_EMPRESA,'
        'PV.NPED,'
        #39'NFS-EXT'#39','
        'PS.COD_SERVICO,'
        #39'E'#39','
        'PV.DATA_NFEXT,'
        'TS.CTISS,'
        'TS.NFS_SERVICO,'
        '5,'
        '0,'
        #39#39','
        '1,'
        '1,'
        'CI.IBGE_COD_CIDADE,'
        '(CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 9 ELSE 1 END),'
        'COALESCE(PS.ISS_RETIDO, 2),'
        
          '(CASE WHEN (SUBSTRING(PV.NUM_NFEEXT FROM 1 FOR 4) = EXTRACT(YEAR' +
          ' FROM PV.DATA_NFEXT))'
        
          ' THEN PV.NUM_NFEEXT ELSE EXTRACT(YEAR FROM PV.DATA_NFEXT) || PV.' +
          'NUM_NFEEXT END),'
        
          '(CASE WHEN (SUBSTRING(PV.NUM_NFEEXT FROM 1 FOR 4) = EXTRACT(YEAR' +
          ' FROM PV.DATA_NFEXT))'
        
          ' THEN PV.NUM_NFEEXT ELSE EXTRACT(YEAR FROM PV.DATA_NFEXT) || PV.' +
          'NUM_NFEEXT END),'
        'PV.VALOR_NFEXT,'
        '(((SELECT COALESCE(SUM(COALESCE(PST.VL_SERVT, 0)), 0)'
        '  FROM PEDVENDA_SERV_TERC PST'
        '  WHERE PST.NPED = PV.NPED'
        '  AND PST.TIPO = PV.TIPO'
        
          '  AND PST.COD_EMPRESA = PV.COD_EMPRESA) / PV.TOT_SERV) * PS.VALO' +
          'R_TOT_SERV) +'
        '  PS.VALOR_TOT_SERV - PS.RATEIO_DESC + PS.RATEIO_ACRESC,'
        
          '(CASE WHEN COALESCE(CI.IBGE_COD_CIDADE, E.IBGE_COD_CIDADE) = E.I' +
          'BGE_COD_CIDADE THEN (CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 0 ' +
          'ELSE TS.ALIQ_ISS END) ELSE 0 END),'
        '1,'
        '(CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 1 ELSE 2 END),'
        
          '(CASE WHEN CI.IBGE_COD_CIDADE = 3106200 THEN COALESCE(C.INSC_MUN' +
          'ICIPAL, '#39#39') ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 14 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 11 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        'COALESCE(C.RAZAO, '#39'DIVERSOS'#39'),'
        'COALESCE(C.ENDERECO, '#39#39'),'
        'COALESCE(C.NUM_END_CLIENTE, '#39#39'),'
        'COALESCE(C.COMPLEMENTO, '#39#39'),'
        'COALESCE(C.BAIRRO, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        'C.COD_PAIS,'
        'COALESCE(C.CEP, '#39#39'),'
        'COALESCE(C.FONE_CLIENTE, '#39#39'),'
        'COALESCE(C.EMAIL, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        #39'1058'#39','
        'PV.DATA_NFEXT,'
        'NULL,'
        'NULL,'
        'NULL'
        'FROM PEDVENDA PV'
        
          'LEFT JOIN PEDVENDA_SERV PS ON PV.NPED = PS.NPED AND PV.TIPO = PS' +
          '.TIPO AND PV.COD_EMPRESA = PS.COD_EMPRESA'
        'LEFT JOIN TIPO_SERVICO TS ON TS.COD_SERVICO = PS.COD_SERVICO'
        
          'LEFT JOIN CLIENTES C ON C.COD_CLIENTE = PV.COD_CLIENTE AND C.COD' +
          '_EMPRESA = PV.COD_EMPRESA'
        'LEFT JOIN CIDADES CI ON CI.COD_CIDADE = C.COD_CIDADE'
        'LEFT JOIN EMPRESA E ON E.COD_EMPRESA = PS.COD_EMPRESA'
        'WHERE COALESCE(PV.NUM_NFEEXT, 0) > 0 AND PV.TIPO = '#39'OS'#39
        'AND COALESCE(PS.LOTE_NFSE, 0) = 0'
        'AND COALESCE(PS.VALOR_TOT_SERV, 0) > 0'
        'AND UPPER(TRIM(COALESCE(PS.STATUS, '#39#39'))) <> '#39'CANCELADO'#39
        ''
        'UNION'
        ''
        'SELECT PV.COD_EMPRESA,'
        'PV.NPED,'
        #39'NFS-E'#39','
        'PS.COD_SERVICO,'
        #39'E'#39','
        'PS.EMISSAO_NFSE,'
        'COALESCE(PS.CTISS, TS.CTISS),'
        'COALESCE(PS.NFS_SERVICO, TS.NFS_SERVICO),'
        '5,'
        '0,'
        #39#39','
        '1,'
        '1,'
        'CI.IBGE_COD_CIDADE,'
        '(CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 9 ELSE 1 END),'
        'COALESCE(PS.ISS_RETIDO, 2),'
        
          '(CASE WHEN (SUBSTRING(PS.N_NF FROM 1 FOR 4) = EXTRACT(YEAR FROM ' +
          'PS.EMISSAO_NFSE))'
        
          ' THEN PS.N_NF ELSE EXTRACT(YEAR FROM PS.EMISSAO_NFSE) || PS.N_NF' +
          ' END),'
        
          '(CASE WHEN (SUBSTRING(PS.N_NF FROM 1 FOR 4) = EXTRACT(YEAR FROM ' +
          'PS.EMISSAO_NFSE))'
        
          ' THEN PS.N_NF ELSE EXTRACT(YEAR FROM PS.EMISSAO_NFSE) || PS.N_NF' +
          ' END),'
        'PS.VALOR_NFSE,'
        '(((SELECT COALESCE(SUM(COALESCE(PST.VL_SERVT, 0)), 0)'
        '  FROM PEDVENDA_SERV_TERC PST'
        '  WHERE PST.NPED = PV.NPED'
        '  AND PST.TIPO = PV.TIPO'
        
          '  AND PST.COD_EMPRESA = PV.COD_EMPRESA) / PV.TOT_SERV) * PS.VALO' +
          'R_TOT_SERV) +'
        '  PS.VALOR_TOT_SERV - PS.RATEIO_DESC + PS.RATEIO_ACRESC,'
        
          '(CASE WHEN COALESCE(CI.IBGE_COD_CIDADE, E.IBGE_COD_CIDADE) = E.I' +
          'BGE_COD_CIDADE THEN (CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 0 ' +
          'ELSE COALESCE(PS.ALIQ_ISS, TS.ALIQ_ISS) END) ELSE 0 END),'
        '1,'
        '(CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 1 ELSE 2 END),'
        
          '(CASE WHEN CI.IBGE_COD_CIDADE = 3106200 THEN COALESCE(C.INSC_MUN' +
          'ICIPAL, '#39#39') ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 14 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 11 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        'COALESCE(C.RAZAO, '#39'DIVERSOS'#39'),'
        'COALESCE(C.ENDERECO, '#39#39'),'
        'COALESCE(C.NUM_END_CLIENTE, '#39#39'),'
        'COALESCE(C.COMPLEMENTO, '#39#39'),'
        'COALESCE(C.BAIRRO, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        'C.COD_PAIS,'
        'COALESCE(C.CEP, '#39#39'),'
        'COALESCE(C.FONE_CLIENTE, '#39#39'),'
        'COALESCE(C.EMAIL, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        #39'1058'#39','
        'PS.EMISSAO_NFSE,'
        'NULL,'
        'NULL,'
        'NULL'
        'FROM PEDVENDA_SERV PS'
        
          'LEFT JOIN PEDVENDA PV ON PS.NPED = PV.NPED AND PS.TIPO = PV.TIPO' +
          ' AND PS.COD_EMPRESA = PV.COD_EMPRESA'
        'LEFT JOIN TIPO_SERVICO TS ON TS.COD_SERVICO = PS.COD_SERVICO'
        
          'LEFT JOIN CLIENTES C ON C.COD_CLIENTE = PV.COD_CLIENTE AND C.COD' +
          '_EMPRESA = PV.COD_EMPRESA'
        'LEFT JOIN CIDADES CI ON CI.COD_CIDADE = C.COD_CIDADE'
        'LEFT JOIN EMPRESA E ON E.COD_EMPRESA = PS.COD_EMPRESA'
        
          'WHERE PS.STATUS_NFSE = '#39'Autorizada'#39' AND PV.TIPO = '#39'OS'#39' AND PS.LO' +
          'TE_NFSE > 0'
        'AND COALESCE(PS.VALOR_TOT_SERV, 0) > 0'
        'AND UPPER(TRIM(COALESCE(PS.STATUS, '#39#39'))) <> '#39'CANCELADO'#39
        ''
        'UNION'
        ''
        'SELECT NC.COD_EMPRESA,'
        'NC.N_OS,'
        #39'NFS-E CANCELADAS'#39','
        'NULL,'
        #39'E'#39','
        'NC.EMISSAO_NFSE,'
        'NC.CTISS,'
        'NC.NFS_SERVICO,'
        '5,'
        '0,'
        #39#39','
        '0,'
        '0,'
        'CI.IBGE_COD_CIDADE,'
        '0,'
        
          '(CASE WHEN COALESCE(NC.ISS_RETIDO, 2) = 0 THEN 2 ELSE COALESCE(N' +
          'C.ISS_RETIDO, 2) END),'
        
          '(CASE WHEN (SUBSTRING(NC.NUM_NFSE FROM 1 FOR 4) = EXTRACT(YEAR F' +
          'ROM NC.EMISSAO_NFSE))'
        
          ' THEN NC.NUM_NFSE ELSE EXTRACT(YEAR FROM NC.EMISSAO_NFSE) || NC.' +
          'NUM_NFSE END),'
        
          '(CASE WHEN (SUBSTRING(NC.NUM_NFSE FROM 1 FOR 4) = EXTRACT(YEAR F' +
          'ROM NC.EMISSAO_NFSE))'
        
          ' THEN NC.NUM_NFSE ELSE EXTRACT(YEAR FROM NC.EMISSAO_NFSE) || NC.' +
          'NUM_NFSE END),'
        'NC.VALOR_NFSE,'
        'NC.VALOR_NFSE,'
        
          '(CASE WHEN COALESCE(CI.IBGE_COD_CIDADE, E.IBGE_COD_CIDADE) = E.I' +
          'BGE_COD_CIDADE THEN (CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 0 ' +
          'ELSE NC.ALIQ_ISS END) ELSE 0 END),'
        '2,'
        '(CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 1 ELSE 2 END),'
        
          '(CASE WHEN CI.IBGE_COD_CIDADE = 3106200 THEN COALESCE(C.INSC_MUN' +
          'ICIPAL, '#39#39') ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 14 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 11 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        'COALESCE(C.RAZAO, '#39'DIVERSOS'#39'),'
        'COALESCE(C.ENDERECO, '#39#39'),'
        'COALESCE(C.NUM_END_CLIENTE, '#39#39'),'
        'COALESCE(C.COMPLEMENTO, '#39#39'),'
        'COALESCE(C.BAIRRO, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        'C.COD_PAIS,'
        'COALESCE(C.CEP, '#39#39'),'
        'COALESCE(C.FONE_CLIENTE, '#39#39'),'
        'COALESCE(C.EMAIL, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        #39'1058'#39','
        'NC.EMISSAO_NFSE,'
        'NC.DATA_CANC,'
        'SUBSTRING(NC.MOTIVO_CANCELAMENTO FROM 1 FOR 1),'
        'NULL'
        'FROM NFSE_CANCELADAS NC'
        
          'LEFT JOIN CLIENTES C ON C.COD_CLIENTE = NC.COD_CLIENTE AND C.COD' +
          '_EMPRESA = NC.COD_EMPRESA'
        'LEFT JOIN CIDADES CI ON CI.COD_CIDADE = C.COD_CIDADE'
        'LEFT JOIN EMPRESA E ON E.COD_EMPRESA = NC.COD_EMPRESA'
        ''
        'UNION'
        ''
        'SELECT CP.COD_EMPRESA,'
        'CP.CUPOM,'
        #39'CP'#39','
        'CP2.GRUPO_PROD,'
        #39'E'#39','
        'CP.DATA,'
        'TS.CTISS,'
        'TS.NFS_SERVICO,'
        '13,'
        '0,'
        #39#39','
        
          '(CASE WHEN UPPER(COALESCE(CP2.STATUS_IT, '#39#39')) = '#39'CANCELADO'#39' THEN' +
          ' 0 ELSE 1 END),'
        
          '(CASE WHEN UPPER(COALESCE(CP2.STATUS_IT, '#39#39')) = '#39'CANCELADO'#39' THEN' +
          ' 0 ELSE 1 END),'
        'E.IBGE_COD_CIDADE,'
        
          '(CASE WHEN UPPER(COALESCE(CP2.STATUS_IT, '#39#39')) = '#39'CANCELADO'#39' THEN' +
          ' 0 ELSE (CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 9 ELSE 1 END) ' +
          'END),'
        'COALESCE(TS.ISS_RETIDO, 2),'
        'CF.NUM_EQUIP || CP.CUPOM,'
        'CF.NUM_EQUIP || CP.CUPOM,'
        'CP.TOTAL,'
        'CP2.TOTAL + CP2.RAT_ACRES - CP2.RAT_DESC,'
        
          '(CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 0 ELSE TS.ALIQ_ISS END' +
          '),'
        
          '(CASE WHEN UPPER(COALESCE(CP2.STATUS_IT, '#39#39')) = '#39'CANCELADO'#39' THEN' +
          ' 2 ELSE 1 END),'
        '(CASE WHEN E.REGIME LIKE '#39'%SIMPLES%'#39' THEN 1 ELSE 2 END),'
        
          '(CASE WHEN CI.IBGE_COD_CIDADE = 3106200 THEN COALESCE(C.INSC_MUN' +
          'ICIPAL, '#39#39') ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 14 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 11 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        'COALESCE(C.RAZAO, '#39'DIVERSOS'#39'),'
        'COALESCE(C.ENDERECO, '#39#39'),'
        'COALESCE(C.NUM_END_CLIENTE, '#39#39'),'
        'COALESCE(C.COMPLEMENTO, '#39#39'),'
        'COALESCE(C.BAIRRO, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        'C.COD_PAIS,'
        'COALESCE(C.CEP, '#39#39'),'
        'COALESCE(C.FONE_CLIENTE, '#39#39'),'
        'COALESCE(C.EMAIL, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        #39'1058'#39','
        'CP.DATA,'
        
          '(CASE WHEN UPPER(COALESCE(CP2.STATUS_IT, '#39#39')) = '#39'CANCELADO'#39' THEN' +
          ' CP.DATA ELSE NULL END),'
        
          '(CASE WHEN UPPER(COALESCE(CP2.STATUS_IT, '#39#39')) = '#39'CANCELADO'#39' THEN' +
          ' 2 ELSE NULL END),'
        'NULL'
        'FROM CUPOM CP'
        
          'LEFT JOIN CUPOM2 CP2 ON CP2.COD_TERMINAL = CP.COD_TERMINAL AND C' +
          'P2.CUPOM = CP.CUPOM AND CP2.NSERIEECF = CP.NSERIEECF'
        'AND CP2.COD_EMPRESA = CP.COD_EMPRESA AND CP2.ORDEM = CP.REGISTRO'
        
          'LEFT JOIN CONFIMP CF ON CF.NUM_SERIE_ECF = CP.NSERIEECF AND CF.C' +
          'OD_TERMINAL = CP.COD_TERMINAL AND CF.COD_EMPRESA = CP.COD_EMPRES' +
          'A'
        'LEFT JOIN TIPO_SERVICO TS ON TS.COD_SERVICO = CP2.GRUPO_PROD'
        
          'LEFT JOIN CLIENTES C ON C.COD_CLIENTE = CP.CLIENTE AND C.COD_EMP' +
          'RESA = CP.COD_EMPRESA'
        'LEFT JOIN CIDADES CI ON CI.COD_CIDADE = C.COD_CIDADE'
        'LEFT JOIN EMPRESA E ON E.COD_EMPRESA = CP.COD_EMPRESA'
        'WHERE CP2.PROD_SERV = '#39'S'#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW VW_DES_R('
        '    COD_EMPRESA,'
        '    NUM_DOC,'
        '    TIPO_DOC,'
        '    COD_SERVICO,'
        '    TIPO_REGISTRO,'
        '    DATA_PAG_REC_CRED,'
        '    DATA_EMISSAO,'
        '    MODELO_DOCUMENTO,'
        '    SERIE_DOCUMENTO,'
        '    SUBSERIE_DOCUMENTO,'
        '    SIT_ESP_RESP,'
        '    MOTIVO_NAO_RETENCAO,'
        '    LOCAL_INCIDENCIA,'
        '    TIPO_REC_ISSQN,'
        '    NUMERO_DOCUMENTO,'
        '    VALOR_BRUTO,'
        '    VALOR_SERVICO,'
        '    ALIQUOTA,'
        '    SIMPLES_NACIONAL,'
        '    INSC_MUN_PRESTADOR,'
        '    CNPJ_PRESTADOR,'
        '    CPF_PRESTADOR,'
        '    NOME_PRESTADOR,'
        '    LOGRADOURO_PRESTADOR,'
        '    NUM_IMOVEL_PRESTADOR,'
        '    COMPLEMENTO_PRESTADOR,'
        '    BAIRRO_PRESTADOR,'
        '    CIDADE_PRESTADOR,'
        '    PAIS_PRESTADOR,'
        '    CEP_PRESTADOR,'
        '    TELEFONE_PRESTADOR,'
        '    EMAIL_PRESTADOR,'
        '    LOCAL_PRESTACAO,'
        '    PAIS_PRESTACAO)'
        'AS'
        'SELECT NF.COD_EMPRESA,'
        'NF.NUM_NF,'
        #39'NOTAFISCAL'#39','
        'NI.COD_SERVICO,'
        #39'R'#39','
        'NF.DATA_LANC,'
        'NF.DATA_CONTABIL,'
        'NF.MOD_DES_BH,'
        
          '(CASE WHEN COALESCE(NF.SEM_SERIE, '#39#39') = '#39'S'#39' THEN NULL ELSE NF.SE' +
          'RIE END),'
        'NF.SUBSERIE,'
        '1,'
        '(CASE WHEN NF.TIPO_REC_ISSQN = 1 THEN 16 ELSE 1 END),'
        'NF.LOCAL_INCIDENCIA,'
        'NF.TIPO_REC_ISSQN,'
        '(CASE WHEN COALESCE(NF.MOD_DES_BH, 0) = 5'
        
          '    THEN (CASE WHEN (SUBSTRING(NF.NUM_NF FROM 1 FOR 4) = EXTRACT' +
          '(YEAR FROM NF.DATA_CONTABIL))'
        
          '            THEN NF.NUM_NF ELSE EXTRACT(YEAR FROM NF.DATA_CONTAB' +
          'IL) || NF.NUM_NF END)'
        '            ELSE NF.NUM_NF END),'
        'NF.VALOR_SERV,'
        'NI.VALOR_TOTAL,'
        '(CASE'
        
          '    WHEN (COALESCE(NF.TIPO_REC_ISSQN, '#39#39') = '#39'1'#39' AND TRIM(UPPER(C' +
          'OALESCE(C.REGIME, '#39#39'))) = '#39'SIMPLES'#39') THEN NF.ALIQ_ISS'
        
          '    WHEN (COALESCE(NF.TIPO_REC_ISSQN, '#39#39') = '#39'2'#39' AND (TRIM(UPPER(' +
          'COALESCE(C.REGIME, '#39#39'))) = '#39'SIMPLES'#39' OR TRIM(UPPER(COALESCE(C.RE' +
          'GIME, '#39#39'))) = '#39'MEI'#39')) THEN 0'
        '    ELSE NF.ALIQ_ISS'
        'END),'
        '(CASE TRIM(UPPER(C.REGIME))'
        '    WHEN '#39'SIMPLES'#39' THEN'
        '        1'
        '    WHEN '#39'MEI'#39' THEN'
        '        3'
        '    ELSE'
        '        2'
        'END),'
        
          '(CASE WHEN CI.IBGE_COD_CIDADE = 3106200 THEN COALESCE(C.INSC_MUN' +
          'ICIPAL, '#39#39') ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 14 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        
          '(CASE WHEN CHAR_LENGTH(TRIM(C.CPFCGC)) = 11 THEN TRIM(C.CPFCGC) ' +
          'ELSE '#39#39' END),'
        'COALESCE(C.RAZAO, '#39#39'),'
        'COALESCE(C.ENDERECO, '#39#39'),'
        'COALESCE(C.NUM_END_CLIENTE, '#39#39'),'
        'COALESCE(C.COMPLEMENTO, '#39#39'),'
        'COALESCE(C.BAIRRO, '#39#39'),'
        'CI.IBGE_COD_CIDADE,'
        'C.COD_PAIS,'
        'COALESCE(C.CEP, '#39#39'),'
        'COALESCE(C.FONE_CLIENTE, '#39#39'),'
        'COALESCE(C.EMAIL, '#39#39'),'
        'E.IBGE_COD_CIDADE,'
        #39'1058'#39
        'FROM NOTAFISCAL NF'
        
          'LEFT JOIN NOTAFISCAL_ITEM NI ON NI.COD_NF = NF.COD_NF AND NI.COD' +
          '_EMPRESA = NF.COD_EMPRESA'
        'LEFT JOIN TIPO_SERVICO TS ON TS.COD_SERVICO = NI.COD_SERVICO'
        
          'LEFT JOIN CLIENTES C ON C.COD_CLIENTE = NF.COD_CLIENTE AND C.COD' +
          '_EMPRESA = NF.COD_EMPRESA'
        'LEFT JOIN CIDADES CI ON CI.COD_CIDADE = C.COD_CIDADE'
        'LEFT JOIN EMPRESA E ON E.COD_EMPRESA = NF.COD_EMPRESA'
        
          'WHERE NI.TIPO_ITEM = '#39'S'#39' AND NF.STATUS = '#39'Fechada'#39' AND NF.EMISSA' +
          'O_PROPRIA <> '#39'S'#39';'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_BI_NFSE_CANCELADAS_SEQID FOR NFSE_CAN' +
          'CELADAS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        '    DECLARE VARIABLE COD INTEGER;'
        'BEGIN'
        
          '    SELECT COD FROM INCREMENTA_CODIGO(NEW.COD_EMPRESA, '#39'NFSE_CAN' +
          'CELADAS_SEQID'#39') INTO :COD;'
        '    NEW.SEQID = :COD;'
        'END;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_NOTAFISCAL_MOD21 FOR NOTAFISCAL'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        
          '  if (((new.MODELO_NF <> '#39'06'#39') and (new.MODELO_NF <> '#39'21'#39') and (' +
          'new.MODELO_NF <> '#39'22'#39'))'
        '    and (not new.ID_MODELO21 is null)) then'
        '    new.ID_MODELO21 = null;'
        
          '  if ((new.MODELO_NF = '#39'06'#39') or (new.MODELO_NF = '#39'21'#39') or (new.M' +
          'ODELO_NF = '#39'22'#39')) then'
        
          '    if ((new.ID_MODELO21 is null) or (old.data_lanc <> new.data_' +
          'lanc)) then'
        
          '      new.ID_MODELO21 = (select result from strzero(extract(mont' +
          'h from new.data_lanc), 2))||extract(year from new.data_lanc);'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER trigger ti_pedvenda_biu_sts_sep_auto for pedvend' +
          'a'
        'active before insert or update position 0'
        'AS'
        '  declare variable nivelus integer;'
        '  declare variable nivelpro integer;'
        '  declare variable vuser char(10);'
        '  declare variable vcodigo integer;'
        '  declare variable vseparacaoativada char(1);'
        'begin'
        '  if ((coalesce(new.idmobile,0) > 0) and'
        '    (coalesce(old.env_mobile, '#39'N'#39') = '#39'N'#39') and'
        '    (coalesce(new.env_mobile, '#39'N'#39') = '#39'S'#39') and'
        '    (coalesce(new.status_sep_conf, '#39#39') = '#39#39')) then'
        '  begin'
        
          '    select e.usar_separacao_ped from empresa e where e.cod_empre' +
          'sa = new.cod_empresa into :vseparacaoativada;'
        ''
        '    if (coalesce(:vseparacaoativada,'#39#39') = '#39'S'#39') then'
        '    begin'
        
          '      select first 1 s.nivel_us, s.usuario from senhas s where s' +
          '.codigo = new.cod_vendedor and s.cod_empresa = new.cod_empresa i' +
          'nto :nivelus, :vuser;'
        
          '      select first 1 tb.nivel_processo, tu.cod_empresa from tabe' +
          'la_processos tb'
        
          '        left join tabela_processos_usuarios tu on tu.cod_process' +
          'o = tb.cod_processo and tu.cod_empresa = tb.cod_empresa and tu.u' +
          'suario = :vuser'
        
          '        where tb.cod_processo = '#39'VND182'#39' and tb.cod_empresa = ne' +
          'w.cod_empresa into :nivelpro, :vcodigo;'
        ''
        
          '      if ((coalesce(:nivelus, 0) > 0) and (coalesce(:nivelpro, 0' +
          ') > 0)) then'
        '      begin'
        
          '        if ((:nivelus >= nivelpro) or (coalesce(:vcodigo,0) > 0)' +
          ')  then'
        '        begin'
        '          new.status_sep_conf = '#39'SEPARACAO'#39';'
        '        end'
        '      end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PROD_ALT_BIU_WS FOR PRODUTOS_ALTERACO' +
          'ES'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  new.data_hora_alt_ws = current_timestamp;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PROD_AU_SPED_0205 FOR PRODUTOS'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        '  declare variable vseqid integer;'
        '  declare variable vvalorant varchar(32);'
        '  declare variable vdescrant varchar(75);'
        '  declare variable vvalornew varchar(32);'
        '  declare variable vdescrnew varchar(75);'
        '  declare variable vdataini timestamp;'
        '  declare variable vtipo_alt char(1); -- tipo_alt para gravar'
        'begin'
        '  vtipo_alt = '#39#39';'
        
          '  if (((old.grupo_prod <> new.grupo_prod) or (old.cod_prod <> ne' +
          'w.cod_prod)) and (old.descr_prod <> new.descr_prod)) then'
        '    vtipo_alt = '#39'A'#39'; -- ambos'
        
          '  else if ((old.grupo_prod <> new.grupo_prod) or (old.cod_prod <' +
          '> new.cod_prod)) then'
        '    vtipo_alt = '#39'C'#39'; -- codigo'
        '  else if (old.descr_prod <> new.descr_prod) then'
        '    vtipo_alt = '#39'D'#39'; -- descricao'
        ''
        '  if (vtipo_alt <> '#39#39') then'
        '  begin'
        
          '    select seqid, valor_anterior, descr_prod_anterior from produ' +
          'tos_alteracoes where grupo_prod = old.grupo_prod and cod_prod = ' +
          'old.cod_prod and cod_empresa = old.cod_empresa and data_alteraca' +
          'o = current_date'
        '      into :vseqid, :vvalorant, :vdescrant;'
        '    if (coalesce(vseqid, 0) = 0) then -- sem alteracao no dia'
        '    begin'
        
          '      select first 1 data_alteracao from produtos_alteracoes whe' +
          're grupo_prod = old.grupo_prod and cod_prod = old.cod_prod and c' +
          'od_empresa = old.cod_empresa and data_alteracao < current_date o' +
          'rder by data_alteracao desc'
        '        into :vdataini;'
        
          '      if ((:vdataini  is null) and (not old.dat_cad_prod is null' +
          ')) then -- data de cadastro do prduto'
        '        vdataini = old.dat_cad_prod;'
        
          '      else if (:vdataini is null) then -- caso nao tenha data re' +
          'gistrada sera registrado com data posterior 365 dias'
        '        vdataini = current_date - 365;'
        '      else'
        
          '        vdataini = :vdataini + 1; -- caso encontre a data, esta ' +
          'sera usada como data inicial da alteracao'
        '      if (:vdataini > current_date) then'
        '        vdataini = current_date;'
        
          '      select cod from incrementa_codigo(new.cod_empresa, '#39'PRODUT' +
          'OS_ALTERACOES'#39') into :vseqid;'
        
          '      insert into produtos_alteracoes (seqid, grupo_prod, cod_pr' +
          'od, cod_empresa, tipo_alt, valor_anterior, data_alteracao, data_' +
          'ini, descr_prod_anterior)'
        
          '        values ( :vseqid, new.grupo_prod, new.cod_prod, new.cod_' +
          'empresa, :vtipo_alt, old.grupo_prod||'#39'|'#39'||rtrim(old.cod_prod)||'#39 +
          '|'#39', current_date, :vdataini, rtrim(old.descr_prod));'
        '    end'
        '    else'
        '    begin'
        '      vvalornew = new.grupo_prod||'#39'|'#39'||rtrim(new.cod_prod)||'#39'|'#39';'
        '      vdescrnew = rtrim(new.descr_prod);'
        
          '      if ((vvalorant = vvalornew) and (vdescrant = vdescrnew)) t' +
          'hen'
        
          '        delete from produtos_alteracoes where seqid = :vseqid an' +
          'd cod_empresa = old.cod_empresa;'
        '      else'
        '      begin'
        
          '        if ((vvalorant <> vvalornew) and (vdescrant <> vdescrnew' +
          ')) then'
        '          vtipo_alt = '#39'A'#39';'
        '        else if (vvalorant <> vvalornew) then'
        '          vtipo_alt = '#39'C'#39';'
        '        else'
        '          vtipo_alt = '#39'D'#39';'
        
          '        update produtos_alteracoes set tipo_alt = :vtipo_alt whe' +
          're seqid = :vseqid and cod_empresa = old.cod_empresa;'
        '      end'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PRODUTOS_ALT_PRECO FOR PRODUTOS'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        'begin'
        '  /* Trigger text */'
        '  if (old.prec_tab_prod <> new.prec_tab_prod) then'
        '    new.data_alt_preco = current_date;'
        
          '  if ((coalesce(old.icm_prod, 0) <> coalesce(new.icm_prod, 0)) o' +
          'r (coalesce(old.isento_prod, '#39#39') <> coalesce(new.isento_prod, '#39#39 +
          ')) or (coalesce(old.n_incidencia_prod, '#39#39') <> coalesce(new.n_inc' +
          'idencia_prod, '#39#39')))  then'
        '  begin'
        
          '    if ((coalesce(new.icm_prod, 0) > 0) and (coalesce(old.sit_tr' +
          'ib, '#39#39') <> '#39'T'#39')) then'
        '      new.sit_trib = '#39'T'#39';'
        
          '    else if ((coalesce(new.isento_prod, '#39#39') = '#39'S'#39') and (coalesce' +
          '(old.sit_trib, '#39#39') <> '#39'I'#39')) then'
        '      new.sit_trib = '#39'I'#39';'
        
          '    else if ((coalesce(new.n_incidencia_prod, '#39#39') = '#39'S'#39') and (co' +
          'alesce(old.sit_trib, '#39#39') <> '#39'N'#39')) then'
        '      new.sit_trib = '#39'N'#39';'
        '    else if (coalesce(old.sit_trib, '#39#39') <> '#39'F'#39') then'
        '      new.sit_trib = '#39'F'#39';'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_EVD_PAF ('
        '    PCODEMPRESA integer,'
        '    PTIPOREGISTRO varchar(3),'
        '    PDATA timestamp,'
        '    PCAMPOSCHAVE varchar(100),'
        '    PVALORECHAVE varchar(100),'
        '    PMD5 varchar(32),'
        '    PACAO varchar(1))'
        'as'
        'declare variable VTEMREGISTRO integer;'
        'begin'
        '  select first 1 ep.seqid from evidencias_paf ep'
        
          '    where ep.cod_empresa = :pcodempresa and ep.registro = :ptipo' +
          'registro and'
        '    ep.valores_campos = :pvalorechave into :vtemregistro;'
        ''
        '  if (coalesce(:pacao, '#39#39') = '#39'I'#39') then -- insert'
        '  begin'
        '    if (coalesce(:pmd5, '#39#39') = '#39#39') then'
        '      if (coalesce(:vtemregistro, 0) = 0) then'
        
          '        insert into evidencias_paf (cod_empresa, registro, data_' +
          'movimento, campos_chave, valores_campos)'
        
          '          values (:pcodempresa, :ptiporegistro, :pdata, :pcampos' +
          'chave, :pvalorechave);'
        '    '
        '    if (coalesce(:pmd5, '#39#39') <> '#39#39') then'
        '      if (coalesce(:vtemregistro, 0) > 0) then'
        '        delete from evidencias_paf eep'
        
          '          where eep.seqid = :vtemregistro and eep.cod_empresa = ' +
          ':pcodempresa;'
        '  end'
        '  else if (coalesce(:pacao, '#39#39') = '#39'D'#39') then -- delete'
        '  begin'
        '    if (coalesce(:pmd5, '#39#39') <> '#39#39') then'
        '      if (coalesce(:vtemregistro, 0) = 0) then'
        
          '        insert into evidencias_paf (cod_empresa, registro, data_' +
          'movimento, campos_chave, valores_campos)'
        
          '          values (:pcodempresa, :ptiporegistro, :pdata, :pcampos' +
          'chave, :pvalorechave);'
        '    '
        '    if (coalesce(:pmd5, '#39#39') = '#39#39') then'
        '      if (coalesce(:vtemregistro, 0) > 0) then'
        '        delete from evidencias_paf eep'
        
          '          where eep.seqid = :vtemregistro and eep.cod_empresa = ' +
          ':pcodempresa;'
        '  end'
        ' suspend;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_CP FOR CUPOM'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'CP'#39';'
        
          '  vcamposchave = '#39'|COD_TERMINAL|NSERIEECF|COD_EMPRESA|REGISTRO|C' +
          'UPOM|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = new.data;'
        
          '    vvalorechave = '#39'|'#39'||new.cod_terminal||'#39'|'#39'||new.nserieecf||'#39'|' +
          #39'||new.cod_empresa||'#39'|'#39'||new.registro||'#39'|'#39'||new.cupom||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = old.data;'
        
          '    vvalorechave = '#39'|'#39'||old.cod_terminal||'#39'|'#39'||old.nserieecf||'#39'|' +
          #39'||old.cod_empresa||'#39'|'#39'||old.registro||'#39'|'#39'||old.cupom||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coalesc' +
          'e(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_CP2 FOR CUPOM2'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'C2'#39';'
        
          '  vcamposchave = '#39'|COD_TERMINAL|NSERIEECF|COD_EMPRESA|REGISTRO|O' +
          'RDEM|CUPOM|NITEM|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = new.data;'
        
          '    vvalorechave = '#39'|'#39'||new.cod_terminal||'#39'|'#39'||new.nserieecf||'#39'|' +
          #39'||new.cod_empresa||'#39'|'#39'||new.registro||'#39'|'#39'||new.ordem||'#39'|'#39'||new.' +
          'cupom||'#39'|'#39'||new.nitem||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = old.data;'
        
          '    vvalorechave = '#39'|'#39'||old.cod_terminal||'#39'|'#39'||old.nserieecf||'#39'|' +
          #39'||old.cod_empresa||'#39'|'#39'||old.registro||'#39'|'#39'||old.ordem||'#39'|'#39'||old.' +
          'cupom||'#39'|'#39'||old.nitem||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coalesc' +
          'e(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_EVD_PAF_DOCBASEATEST FOR PAF_DOC_BASE' +
          '_ATEST'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'AE'#39';'
        '  vcamposchave = '#39'|DATA_AT|COD_EMPRESA|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = new.data_at;'
        '    vvalorechave = '#39'|'#39'||new.data_at||'#39'|'#39'||new.cod_empresa||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = old.data_at;'
        '    vvalorechave = '#39'|'#39'||old.data_at||'#39'|'#39'||old.cod_empresa||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coalesc' +
          'e(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_EVD_PAF_DOCNF FOR DOC_NAOFISCAL_TERMI' +
          'NAL'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'DN'#39';'
        '  vcamposchave = '#39'|COD_TERMINAL|NSERIEECF|COD_EMPRESA|COO_ECF|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = new.data_f_emissao;'
        
          '    vvalorechave = '#39'|'#39'||new.cod_terminal||'#39'|'#39'||new.nserieecf||'#39'|' +
          #39'||new.cod_empresa||'#39'|'#39'||new.coo_ecf||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = old.data_f_emissao;'
        
          '    vvalorechave = '#39'|'#39'||old.cod_terminal||'#39'|'#39'||old.nserieecf||'#39'|' +
          #39'||old.cod_empresa||'#39'|'#39'||old.coo_ecf||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coalesc' +
          'e(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        ' CREATE OR ALTER TRIGGER TI_EVD_PAF_FINCP FOR FINCUPOM'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'FC'#39';'
        '  vcamposchave = '#39'|COD_TERMINAL|NSERIEECF|REGISTRO|TIPO_DOC|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = new.data;'
        
          '    vvalorechave = '#39'|'#39'||new.cod_terminal||'#39'|'#39'||new.nserieecf||'#39'|' +
          #39'||new.registro||'#39'|'#39'||new.tipo_doc||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = old.data;'
        
          '    vvalorechave = '#39'|'#39'||old.cod_terminal||'#39'|'#39'||old.nserieecf||'#39'|' +
          #39'||old.registro||'#39'|'#39'||old.tipo_doc||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coalesc' +
          'e(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_FORMPAG FOR FORMPAGAMENTO'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        
          '  if (((rtrim(new.tpdocs) = '#39'NF'#39') and (inserting)) or ((rtrim(ol' +
          'd.tpdocs) = '#39'NF'#39') and ((deleting) or (updating) )))  then'
        '  begin'
        '    vtiporegistro = '#39'FP'#39';'
        '    vcamposchave = '#39'|SEQFORM|COD_EMPRESA|'#39';'
        '    if (inserting) then'
        '    begin              '
        '      vcodempresa =  new.cod_empresa;'
        '      vdata = new.data_mov;'
        
          '      vvalorechave = '#39'|'#39'||new.SEQFORM||'#39'|'#39'||new.cod_empresa||'#39'|'#39 +
          ';'
        '      vmd5 = new.md5;'
        '      vacao = '#39'I'#39';'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '    end'
        '    else if ((deleting) or (updating)) then'
        '    begin              '
        '      vcodempresa =  old.cod_empresa;'
        '      vdata = old.data_mov;'
        
          '      vvalorechave = '#39'|'#39'||old.seqform||'#39'|'#39'||old.cod_empresa||'#39'|'#39 +
          ';'
        '      vmd5 = old.md5;'
        '      vacao = '#39'D'#39';'
        
          '      if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coale' +
          'sce(old.md5, '#39#39') = '#39#39')) then'
        
          '        execute procedure sp_evd_paf(vcodempresa, vtiporegistro,' +
          ' vdata, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32' +
          '), vacao);'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_MAPALIQ FOR MAPA_RESUMO_ALIQ'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'MR'#39';'
        
          '  vcamposchave = '#39'|COD_TERMINAL|NSERIEECF|COD_EMPRESA|COORED|ALI' +
          'Q_SEQ|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        
          '    select first 1 data_mov from resumod where cod_terminal = ne' +
          'w.cod_terminal and nserieecf = new.nserieecf and'
        
          '      cod_empresa = new.cod_empresa and coored = new.coored into' +
          ' :vdata;'
        
          '    vvalorechave = '#39'|'#39'||new.cod_terminal||'#39'|'#39'||new.nserieecf||'#39'|' +
          #39'||new.cod_empresa||'#39'|'#39'||new.coored||'#39'|'#39'||new.aliq_seq||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        
          '    select first 1 data_mov from resumod where cod_terminal = ol' +
          'd.cod_terminal and nserieecf = old.nserieecf and'
        
          '      cod_empresa = old.cod_empresa and coored = old.coored into' +
          ' :vdata;'
        
          '    vvalorechave = '#39'|'#39'||old.cod_terminal||'#39'|'#39'||old.nserieecf||'#39'|' +
          #39'||old.cod_empresa||'#39'|'#39'||old.coored||'#39'|'#39'||old.aliq_seq||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coalesc' +
          'e(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_PEDVENDA FOR PEDVENDA'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'PV'#39';'
        '  vcamposchave = '#39'|NPED|TIPO|COD_EMPRESA|'#39';'
        
          '  if (((coalesce(new.nprevenda, 0) > 0) and (inserting)) or ((co' +
          'alesce(old.nprevenda, 0) > 0 ) and ((deleting) or (updating) )))' +
          '  then'
        '  begin'
        '    if (inserting) then'
        '    begin              '
        '      vcodempresa =  new.cod_empresa;'
        '      vdata = new.data_ped;'
        
          '      vvalorechave = '#39'|'#39'||new.nped||'#39'|'#39'||new.tipo||'#39'|'#39'||new.cod_' +
          'empresa||'#39'|'#39';'
        '      vmd5 = new.md5;'
        '      vacao = '#39'I'#39';'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '    end'
        '    else if ((deleting) or (updating)) then'
        '    begin'
        '      vcodempresa =  old.cod_empresa;'
        '      vdata = old.data_ped;'
        
          '      vvalorechave = '#39'|'#39'||old.nped||'#39'|'#39'||old.tipo||'#39'|'#39'||old.cod_' +
          'empresa||'#39'|'#39';'
        '      vmd5 = old.md5;'
        '      vacao = '#39'D'#39';'
        
          '      if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coale' +
          'sce(old.md5, '#39#39') = '#39#39')) then'
        
          '        execute procedure sp_evd_paf(vcodempresa, vtiporegistro,' +
          ' vdata, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32' +
          '), vacao);'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_PROD FOR PRODUTOS'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        '  declare variable vtemregistro integer;     '
        '  declare variable vconsultaexclusao varchar(100);'
        'begin'
        '  vtiporegistro = '#39'PR'#39';'
        '  vcamposchave = '#39'|GRUPO_PROD|COD_PROD|COD_EMPRESA|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = current_date;'
        
          '    vvalorechave = '#39'|'#39'||new.grupo_prod||'#39'|'#39'||new.cod_prod||'#39'|'#39'||' +
          'new.cod_empresa||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = current_date;'
        
          '    vvalorechave = '#39'|'#39'||old.grupo_prod||'#39'|'#39'||old.cod_prod||'#39'|'#39'||' +
          'old.cod_empresa||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((updating) and (coalesce(new.md5, '#39#39') <> '#39#39') and (coales' +
          'ce(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '    else if (deleting) then'
        '    begin'
        
          '      vconsultaexclusao = '#39'P|'#39'||old.grupo_prod||'#39'|'#39'||rtrim(old.c' +
          'od_prod)||'#39'|'#39';'
        '      select first 1 ep.seqid from evidencias_paf ep'
        
          '        where ep.cod_empresa = :vcodempresa and ep.registro = '#39'P' +
          'RD'#39' and --PRD e incluido pelo sistema, sendo assim quando exclui' +
          'r'
        
          '        ep.valores_campos = :vconsultaexclusao into :vtemregistr' +
          'o;      --pelo banco de dados nao vai ter este registro la e vai' +
          ' gerar uma evidencia'
        '      if (coalesce(:vtemregistro, 0) = 0) then'
        
          '        execute procedure sp_evd_paf(vcodempresa, vtiporegistro,' +
          ' vdata, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32' +
          '), vacao);'
        '      else'
        
          '        delete from evidencias_paf ep where ep.seqid = :vtemregi' +
          'stro and ep.cod_empresa = :vcodempresa;'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_PVPROD FOR PEDVENDA_PROD'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        '  declare variable vtemregistro integer;     '
        '  declare variable vconsultaexclusao varchar(100);'
        'begin'
        '  vtiporegistro = '#39'PP'#39';'
        
          '  vcamposchave = '#39'|NPED|TIPO|GRUPO_PROD|COD_PROD|NITEM|COD_GRADE' +
          '|COD_EMPRESA|CODIGO_NOP|'#39';'
        
          '  if (((coalesce(new.nprevenda, 0) > 0) and (inserting)) or ((co' +
          'alesce(old.nprevenda, 0) > 0 ) and ((deleting) or (updating) )))' +
          '  then'
        '  begin'
        '    if (inserting) then'
        '    begin              '
        '      vcodempresa =  new.cod_empresa;'
        '      vdata = new.data_inclusao;'
        
          '      vvalorechave = '#39'|'#39'||new.nped||'#39'|'#39'||new.tipo||'#39'|'#39'||new.cod_' +
          'prod||'#39'|'#39'||new.nitem||'#39'|'#39'||new.cod_grade||'#39'|'#39'||new.cod_empresa||' +
          #39'|'#39'||trunc(new.codigo_nop)||'#39'|'#39';'
        '      vmd5 = new.md5;'
        '      vacao = '#39'I'#39';'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '    end'
        '    else if ((deleting) or (updating)) then'
        '    begin'
        '      vcodempresa =  old.cod_empresa;'
        '      vdata = old.data_inclusao;'
        
          '      vvalorechave = '#39'|'#39'||old.nped||'#39'|'#39'||old.tipo||'#39'|'#39'||old.cod_' +
          'prod||'#39'|'#39'||old.nitem||'#39'|'#39'||old.cod_grade||'#39'|'#39'||old.cod_empresa||' +
          #39'|'#39'||Trunc(old.codigo_nop)||'#39'|'#39';'
        '      vmd5 = old.md5;'
        '      vacao = '#39'D'#39';'
        
          '      if ((updating) and (coalesce(new.md5, '#39#39') <> '#39#39') and (coal' +
          'esce(old.md5, '#39#39') = '#39#39')) then'
        
          '        execute procedure sp_evd_paf(vcodempresa, vtiporegistro,' +
          ' vdata, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32' +
          '), vacao);'
        '      else if (deleting) then'
        '      begin'
        
          '        vconsultaexclusao = '#39'P|'#39'||old.grupo_prod||'#39'|'#39'||rtrim(old' +
          '.cod_prod)||'#39'|'#39';'
        '        select first 1 ep.seqid from evidencias_paf ep'
        
          '          where ep.cod_empresa = :vcodempresa and ep.registro = ' +
          #39'PPD'#39' and --PPD e incluido pelo sistema, sendo assim quando excl' +
          'uir'
        
          '          ep.campos_chave = cast(old.nprevenda as varchar(32)) a' +
          'nd'
        
          '          ep.valores_campos = :vconsultaexclusao into :vtemregis' +
          'tro;      --pelo banco de dados nao vai ter este registro la e v' +
          'ai gerar uma evidencia'
        '        if (coalesce(:vtemregistro, 0) = 0) then'
        
          '          execute procedure sp_evd_paf(vcodempresa, vtiporegistr' +
          'o, vdata, vcamposchave, vvalorechave, substring(vmd5 from 1 for ' +
          '32), vacao);'
        '        else'
        
          '          delete from evidencias_paf ep where ep.seqid = :vtemre' +
          'gistro and ep.cod_empresa = :vcodempresa;'
        '      end'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_PVSERV FOR PEDVENDA_SERV'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        '  declare variable vtemregistro integer;     '
        '  declare variable vconsultaexclusao varchar(100);'
        'begin'
        '  vtiporegistro = '#39'PS'#39';'
        
          '  vcamposchave = '#39'|NPED|TIPO|COD_SERVICO|COD_EMPRESA|NITEM|CODIG' +
          'O_NOP|'#39';'
        
          '  if (((coalesce(new.nprevenda, 0) > 0) and (inserting)) or ((co' +
          'alesce(old.nprevenda, 0) > 0 ) and ((deleting) or (updating) )))' +
          '  then'
        '  begin'
        '    if (inserting) then'
        '    begin              '
        '      vcodempresa =  new.cod_empresa;'
        '      vdata = new.data_inclusao;'
        
          '      vvalorechave = '#39'|'#39'||new.nped||'#39'|'#39'||new.tipo||'#39'|'#39'||new.cod_' +
          'servico||'#39'|'#39'||new.cod_empresa||'#39'|'#39'||new.nitem||'#39'|'#39'||new.codigo_n' +
          'op||'#39'|'#39';'
        '      vmd5 = new.md5;'
        '      vacao = '#39'I'#39';'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '    end'
        '    else if ((deleting) or (updating)) then'
        '    begin'
        '      vcodempresa =  old.cod_empresa;'
        '      vdata = old.data_inclusao;'
        
          '      vvalorechave = '#39'|'#39'||old.nped||'#39'|'#39'||old.tipo||'#39'|'#39'||old.cod_' +
          'servico||'#39'|'#39'||old.cod_empresa||'#39'|'#39'||old.nitem||'#39'|'#39'||old.codigo_n' +
          'op||'#39'|'#39';'
        '      vmd5 = old.md5;'
        '      vacao = '#39'D'#39';'
        
          '      if ((updating) and (coalesce(new.md5, '#39#39') <> '#39#39') and (coal' +
          'esce(old.md5, '#39#39') = '#39#39')) then'
        
          '        execute procedure sp_evd_paf(vcodempresa, vtiporegistro,' +
          ' vdata, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32' +
          '), vacao);'
        '      else if (deleting) then'
        '      begin'
        '        vconsultaexclusao = '#39'S|'#39'||old.cod_servico||'#39'|'#39';'
        '        select first 1 ep.seqid from evidencias_paf ep'
        
          '          where ep.cod_empresa = :vcodempresa and ep.registro = ' +
          #39'PSD'#39' and --PSD e incluido pelo sistema, sendo assim quando excl' +
          'uir'
        
          '          ep.campos_chave = cast(old.nprevenda as varchar(32)) a' +
          'nd'
        
          '          ep.valores_campos = :vconsultaexclusao into :vtemregis' +
          'tro;      --pelo banco de dados nao vai ter este registro la e v' +
          'ai gerar uma evidencia'
        '        if (coalesce(:vtemregistro, 0) = 0) then'
        
          '          execute procedure sp_evd_paf(vcodempresa, vtiporegistr' +
          'o, vdata, vcamposchave, vvalorechave, substring(vmd5 from 1 for ' +
          '32), vacao);'
        '        else'
        
          '          delete from evidencias_paf ep where ep.seqid = :vtemre' +
          'gistro and ep.cod_empresa = :vcodempresa;'
        '      end'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_REDZ FOR RESUMOD'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'RZ'#39';'
        '  vcamposchave = '#39'|COD_TERMINAL|NSERIEECF|COD_EMPRESA|COORED|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = new.data_mov;'
        
          '    vvalorechave = '#39'|'#39'||new.cod_terminal||'#39'|'#39'||new.nserieecf||'#39'|' +
          #39'||new.cod_empresa||'#39'|'#39'||new.coored||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = old.data_mov;'
        
          '    vvalorechave = '#39'|'#39'||old.cod_terminal||'#39'|'#39'||old.nserieecf||'#39'|' +
          #39'||old.cod_empresa||'#39'|'#39'||old.coored||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coalesc' +
          'e(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_EVD_PAF_SERV FOR TIPO_SERVICO'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        '  declare variable vtemregistro integer;     '
        '  declare variable vconsultaexclusao varchar(100);'
        'begin'
        '  vtiporegistro = '#39'TS'#39';'
        '  vcamposchave = '#39'|COD_SERVICO|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = current_date;'
        '    vvalorechave = '#39'|'#39'||new.cod_servico||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = current_date;'
        '    vvalorechave = '#39'|'#39'||old.cod_servico||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((updating) and (coalesce(new.md5, '#39#39') <> '#39#39') and (coales' +
          'ce(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '    else if (deleting) then'
        '    begin'
        '      vconsultaexclusao = '#39'TS|'#39'||old.cod_servico||'#39'|'#39';'
        '      select first 1 ep.seqid from evidencias_paf ep'
        
          '        where ep.cod_empresa = :vcodempresa and ep.registro = '#39'T' +
          'SD'#39' and --TSD e incluido pelo sistema, sendo assim quando exclui' +
          'r'
        
          '        ep.valores_campos = :vconsultaexclusao into :vtemregistr' +
          'o;      --pelo banco de dados nao vai ter este registro la e vai' +
          ' gerar uma evidencia'
        '      if (coalesce(:vtemregistro, 0) = 0) then'
        
          '        execute procedure sp_evd_paf(vcodempresa, vtiporegistro,' +
          ' vdata, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32' +
          '), vacao);'
        '      else'
        
          '        delete from evidencias_paf ep where ep.seqid = :vtemregi' +
          'stro and ep.cod_empresa = :vcodempresa;'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_EVD_PAF_TERMIMP FOR TERMINAL_IMPRESSO' +
          'RAS'
        'ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 0'
        'AS                                      '
        '  declare variable vcodempresa integer; '
        '  declare variable vtiporegistro varchar(3);'
        '  declare variable vdata timestamp;'
        '  declare variable vcamposchave varchar(100);'
        '  declare variable vvalorechave varchar(100);'
        '  declare variable vmd5 varchar(256);'
        '  declare variable vacao varchar(1);'
        'begin'
        '  vtiporegistro = '#39'TI'#39';'
        '  vcamposchave = '#39'|COD_TERMINAL|NUM_SERIE_ECF|COD_EMPRESA|'#39';'
        '  if (inserting) then'
        '  begin              '
        '    vcodempresa =  new.cod_empresa;'
        '    vdata = current_date;'
        
          '    vvalorechave = '#39'|'#39'||new.cod_terminal||'#39'|'#39'||new.num_serie_ecf' +
          '||'#39'|'#39'||new.cod_empresa||'#39'|'#39';'
        '    vmd5 = new.md5;'
        '    vacao = '#39'I'#39';'
        
          '    execute procedure sp_evd_paf(vcodempresa, vtiporegistro, vda' +
          'ta, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32), v' +
          'acao);'
        '  end'
        '  else if ((deleting) or (updating)) then'
        '  begin              '
        '    vcodempresa =  old.cod_empresa;'
        '    vdata = current_date;'
        
          '    vvalorechave = '#39'|'#39'||old.cod_terminal||'#39'|'#39'||old.num_serie_ecf' +
          '||'#39'|'#39'||old.cod_empresa||'#39'|'#39';'
        '    vmd5 = old.md5;'
        '    vacao = '#39'D'#39';'
        
          '    if ((deleting) or (coalesce(new.md5, '#39#39') <> '#39#39') and (coalesc' +
          'e(old.md5, '#39#39') = '#39#39')) then'
        
          '      execute procedure sp_evd_paf(vcodempresa, vtiporegistro, v' +
          'data, vcamposchave, vvalorechave, substring(vmd5 from 1 for 32),' +
          ' vacao);'
        '  end'
        'END'
        '|/BLOCO|'
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
        'END'
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
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure SP_RETORNO_DEBITOCREDITO ('
        '    PTIPO char(3),'
        '    PTIPV varchar(1),'
        '    PTIPO_OS varchar(10))'
        'returns ('
        '    RETORNO char(1))'
        'as'
        'declare variable VDEBCRED char(1);'
        'begin'
        '  vdebcred='#39#39';'
        '  if ((ptipo = '#39'REQ'#39') and (coalesce(:ptipv,'#39#39')<>'#39#39')) then'
        '  begin'
        '    select usar_debcred from tipo_vendas'
        '      where tipo = :ptipo and sigla = :ptipv and ativo = 1'
        '      into :vdebcred;'
        '  end'
        
          '  else if ((rtrim(ptipo) = '#39'OS'#39') and (coalesce(:ptipo_os,'#39#39')<>'#39#39 +
          ')) then'
        '  begin'
        '    select venda from tipo_vendas'
        '      where tipo = :ptipo and tipo_os = :ptipo_os and ativo = 1'
        '      into :vdebcred;'
        '  end'
        '  '
        '  retorno = '#39'N'#39';'
        '  if ( ltrim(rtrim(vdebcred))  <> '#39#39' ) then'
        '    retorno = ltrim(rtrim(vdebcred));'
        ''
        '  suspend;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_DEBCRED FOR PEDVENDA'
        'ACTIVE AFTER INSERT OR UPDATE POSITION 0'
        'AS'
        '  declare variable vdebcred t_vl_todos;'
        '  declare variable vcodvendedor integer;'
        '  declare variable vdescricao varchar(48);'
        '  declare variable vempusadebcred char(1);'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '     exit;'
        
          '  select coalesce(e.usardebitocredito,'#39#39') as usardebitocredito  ' +
          'from empresa e where e.cod_empresa=new.cod_empresa into :vempusa' +
          'debcred;'
        '  if (vempusadebcred<>'#39'S'#39')then'
        '    exit;'
        '  vdebcred = 0;'
        
          '  if (((coalesce(new.status_ped, '#39#39')) = '#39'FECHADA'#39') and ((coalesc' +
          'e(old.status_ped, '#39#39')) <> '#39'FECHADA'#39')) then'
        '  begin'
        
          '    if ((select retorno from sp_retorno_debitocredito(new.tipo,n' +
          'ew.tipv,new.tipo_os)) <> '#39'S'#39') then'
        '      exit;'
        
          '    update pedvenda_prod pvp set pvp.vl_debcred = (coalesce(pvp.' +
          'rateio_acresc,0)- coalesce(pvp.rateio_desc,0))+'
        
          '        (coalesce(pvp.vltot_ped_item,0)- (coalesce(pvp.vlun_orig' +
          ',coalesce(pvp.vlun_ped_item,0))*coalesce(pvp.quant_ped_item,0)))' +
          ' /*Para o caso de alterar o valor unitario*/'
        
          '        where pvp.cod_empresa = new.cod_empresa and pvp.nped = n' +
          'ew.nped and pvp.tipo=new.tipo and coalesce(pvp.status, '#39#39') <> '#39'C' +
          'ANCELADO'#39';'
        ''
        
          '    for select pvp.cod_vendedor, sum(coalesce(pvp.vl_debcred,0))' +
          ' from pedvenda_prod pvp'
        
          '      where pvp.cod_empresa = new.cod_empresa and pvp.nped = new' +
          '.nped'
        
          '      and pvp.tipo=new.tipo and coalesce(pvp.status, '#39#39') <> '#39'CAN' +
          'CELADO'#39
        '      group by pvp.cod_vendedor'
        '      into :vcodvendedor, :vdebcred do'
        '    begin'
        '      if (vcodvendedor is not null) then'
        '      begin'
        '        if (vdebcred>0) then'
        '          vdescricao= '#39'LANCAMENTO DE CREDITO - FECHAMENTO VND'#39';'
        '        else if (vdebcred<0) then'
        '          vdescricao = '#39'LANCAMENTO DE DEBITO - FECHAMENTO VND'#39';'
        '        if (vdebcred<>0) then'
        
          '          insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VEN' +
          'DEDOR,DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,' +
          'DESCRICAO)'
        
          '            values ((select COD from INCREMENTA_CODIGO(new.cod_e' +
          'mpresa, '#39'LANC_DEBCRED'#39')),'
        
          '            new.cod_empresa,:vcodvendedor,current_date ,current_' +
          'time,new.tipo,'
        '            :vdebcred ,new.nped, :vdescricao);'
        '      end'
        '    end'
        '  end'
        
          '  else if (((coalesce(old.status_ped, '#39#39')) = '#39'FECHADA'#39') and ((co' +
          'alesce(new.status_ped, '#39#39')) <> '#39'FECHADA'#39')) then'
        '  begin'
        
          '    if ((select retorno from sp_retorno_debitocredito(new.tipo,n' +
          'ew.tipv,new.tipo_os)) <> '#39'S'#39') then'
        '      exit;'
        
          '    for select pvp.cod_vendedor, sum(coalesce(pvp.vl_debcred,0))' +
          ' from pedvenda_prod pvp'
        
          '      where pvp.cod_empresa = new.cod_empresa and pvp.nped = new' +
          '.nped'
        
          '      and pvp.tipo=new.tipo and coalesce(pvp.status, '#39#39') <> '#39'CAN' +
          'CELADO'#39
        '      group by pvp.cod_vendedor'
        '      into :vcodvendedor, :vdebcred do'
        '    begin'
        '      if (vcodvendedor is not null) then'
        '      begin'
        '        if (vdebcred>0) then'
        
          '          vdescricao= '#39'ESTORNO REFERENTE A CREDITO - VENDA REABE' +
          'RTA'#39';'
        '        else if (vdebcred<0) then'
        
          '          vdescricao = '#39'ESTORNO REFERENTE A DEBITO - VENDA REABE' +
          'RTA'#39';'
        '        if (vdebcred<>0) then'
        
          '          insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VEN' +
          'DEDOR,DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,' +
          'DESCRICAO)'
        
          '            values ((select COD from INCREMENTA_CODIGO(new.cod_e' +
          'mpresa, '#39'LANC_DEBCRED'#39')),'
        
          '            new.cod_empresa,:vcodvendedor,current_date ,current_' +
          'time,new.tipo,'
        '            -(:vdebcred) ,new.nped, :vdescricao);'
        '      end'
        '    end'
        '    update pedvenda_prod pvp set pvp.vl_debcred = 0'
        
          '      where pvp.cod_empresa = new.cod_empresa and pvp.nped = new' +
          '.nped'
        
          '      and pvp.tipo=new.tipo and coalesce(pvp.status, '#39#39') <> '#39'CAN' +
          'CELADO'#39';'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PEDVENDAPROD_DEBCRED FOR PEDVENDA_PRO' +
          'D'
        'ACTIVE AFTER UPDATE POSITION 1'
        'AS'
        '  declare variable vstatus varchar(10);'
        '  declare variable vdescricao varchar(48);'
        '  declare variable vdescricaonew varchar(48);'
        '  declare variable vempusadebcred char(1);'
        '  declare variable vtipo varchar(3);'
        '  declare variable vtipv varchar(1);'
        '  declare variable vtipo_os varchar(10);'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '     exit;'
        ''
        
          '  if ((coalesce(old.vl_debcred,0)=0) and (coalesce(new.vl_debcre' +
          'd,0)=0)) then'
        '    exit;'
        ''
        
          '  select coalesce(e.usardebitocredito,'#39#39') as usardebitocredito  ' +
          'from empresa e where e.cod_empresa=new.cod_empresa into :vempusa' +
          'debcred;'
        '  if (vempusadebcred<>'#39'S'#39')then'
        '    exit;'
        
          '  select v.status_ped,v.tipo,v.tipv,v.tipo_os from pedvenda v wh' +
          'ere v.nped = new.nped and v.cod_empresa=new.cod_empresa and v.ti' +
          'po = new.tipo'
        '    into :vstatus,:vtipo,:vtipv,:vtipo_os;'
        '  if (vstatus is null) then'
        '    vstatus='#39#39';'
        
          '  if ((vstatus = '#39'FECHADA'#39') and (coalesce(new.status,'#39#39')<>'#39'CANCE' +
          'LADO'#39')) then'
        '  begin'
        
          '    if ((select retorno from sp_retorno_debitocredito(:vtipo,:vt' +
          'ipv,:vtipo_os)) <> '#39'S'#39') then'
        '      exit;'
        
          '    /*No caso de alterar o vendedor da venda ja fechada, lancar ' +
          'um credito ou debito para o new e old vendedor*/'
        '    if (coalesce(new.vl_debcred,0)>0) then'
        '    begin'
        '      vdescricao = '#39'ESTORNO DE CREDITO: ITEM '#39';'
        '      vdescricaonew = '#39'LANCAMENTO DE CREDITO: ITEM '#39';'
        '    end'
        '    else if (coalesce(new.vl_debcred,0)<0) then'
        '    begin'
        '      vdescricao = '#39'ESTORNO DE DEBITO: ITEM '#39';'
        '      vdescricaonew = '#39'LANCAMENTO DE DEBITO: ITEM '#39';'
        '    end'
        ''
        
          '    if ((coalesce(old.cod_vendedor, 0)) <> (coalesce(new.cod_ven' +
          'dedor, 0)))  then'
        '    begin'
        
          '      if ((not(old.cod_vendedor is null)) and (coalesce(old.vl_d' +
          'ebcred,0)<>0)) then'
        
          '        insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VENDE' +
          'DOR,DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,DE' +
          'SCRICAO)'
        
          '          values ((select COD from INCREMENTA_CODIGO(old.cod_emp' +
          'resa, '#39'LANC_DEBCRED'#39')),'
        
          '          old.cod_empresa,old.cod_vendedor,current_date ,current' +
          '_time,old.tipo,'
        
          '          -(coalesce(old.vl_debcred,0))  ,old.nped, :vdescricao|' +
          '|'#39'|'#39'||old.nitem||'#39'|'#39'||old.grupo_prod||'#39'|'#39'||old.cod_prod);'
        ''
        
          '      if ((not(new.cod_vendedor is null)) and (coalesce(new.vl_d' +
          'ebcred,0)<>0)) then'
        
          '        insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VENDE' +
          'DOR,DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,DE' +
          'SCRICAO)'
        
          '          values ((select COD from INCREMENTA_CODIGO(new.cod_emp' +
          'resa, '#39'LANC_DEBCRED'#39')),'
        
          '          new.cod_empresa,new.cod_vendedor,current_date ,current' +
          '_time,new.tipo,'
        
          '          (coalesce(new.vl_debcred,0))  ,new.nped, :vdescricaone' +
          'w||'#39'|'#39'||new.nitem||'#39'|'#39'||new.grupo_prod||'#39'|'#39'||new.cod_prod);'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_DEVOLUCAO_DEBCRED FOR DEVOLUCAO'
        'ACTIVE AFTER INSERT OR DELETE POSITION 0'
        'AS'
        '  declare variable vdescricao varchar(48);'
        '  declare variable vpercetual_dc t_vl_todos;'
        '  declare variable vpercetual_dc_temp t_vl_todos;'
        '  declare variable vdebcred t_vl_todos;'
        '  declare variable vempusadebcred char(1);'
        '  declare variable vlancdebcred_dev char(1);'
        '  /*declare variable vtipo_os varchar(10);*/'
        'begin'
        '  if (USER = '#39'REPL'#39') THEN'
        '     exit;'
        '  /*vtipo_os='#39#39'; */'
        '  if (inserting) then'
        '  begin'
        '    if (coalesce(new.tipo,'#39#39')<>'#39'D'#39') then'
        '      exit;'
        
          '    select coalesce(e.usardebitocredito,'#39#39') as usardebitocredito' +
          ','
        
          '      coalesce(e.perc_lancdebcred_dev,0) as perc_lancdebcred_dev' +
          ','
        
          '      coalesce(p.perc_lancdebcred_dev,0) as perc_lancdebcre_dev2' +
          ','
        '      coalesce(e.lancdebcred_dev,'#39#39') as lancdebcred_dev'
        
          '      from empresa e inner join produtos p on e.cod_empresa=p.co' +
          'd_empresa'
        
          '      where e.cod_empresa=new.cod_empresa and p.grupo_prod=new.g' +
          'rupo_prod and p.cod_prod=new.cod_prod'
        
          '      into :vempusadebcred, :vpercetual_dc, :vpercetual_dc_temp,' +
          ' :vlancdebcred_dev;'
        ''
        
          '    if ((vempusadebcred<>'#39'S'#39') or ((vpercetual_dc<=0) and (vperce' +
          'tual_dc_temp<=0)) or (vlancdebcred_dev <> '#39'S'#39') ) then'
        '      exit;'
        ''
        '    /*if (rtrim(coalesce(new.tipo_venda,'#39#39'))='#39'OS'#39') then'
        
          '      select v.tipo_os from pedvenda v where v.nped = coalesce(n' +
          'ew.cod_venda,-1) and v.cod_empresa=new.cod_empresa into :vtipo_o' +
          's;'
        
          '    if ((select retorno from sp_retorno_debitocredito(new.tipo_v' +
          'enda,new.tipv,:vtipo_os)) <> '#39'S'#39') then'
        '      exit;*/'
        '  end'
        '  else begin'
        '    if (coalesce(old.tipo,'#39#39')<>'#39'D'#39') then'
        '      exit;'
        
          '    select coalesce(e.usardebitocredito,'#39#39') as usardebitocredito' +
          ','
        
          '      coalesce(e.perc_lancdebcred_dev,0) as perc_lancdebcred_dev' +
          ','
        
          '      coalesce(p.perc_lancdebcred_dev,0) as perc_lancdebcred_dev' +
          '2,'
        '      coalesce(e.lancdebcred_dev,'#39#39') as lancdebcred_dev'
        
          '      from empresa e inner join produtos p on e.cod_empresa=p.co' +
          'd_empresa'
        
          '      where e.cod_empresa=old.cod_empresa and p.grupo_prod=old.g' +
          'rupo_prod'
        '      and p.cod_prod=old.cod_prod'
        
          '      into :vempusadebcred,:vpercetual_dc,:vpercetual_dc_temp, :' +
          'vlancdebcred_dev;'
        
          '    if ((vempusadebcred<>'#39'S'#39') or ((vpercetual_dc<=0) and (vperce' +
          'tual_dc_temp<=0)) or (vlancdebcred_dev <> '#39'S'#39') ) then'
        '      exit;'
        ''
        '    /*if (rtrim(coalesce(old.tipo_venda,'#39#39'))='#39'OS'#39') then'
        
          '      select v.tipo_os from pedvenda v where v.nped = coalesce(o' +
          'ld.cod_venda,-1) and v.cod_empresa=old.cod_empresa into :vtipo_o' +
          's;'
        
          '    if ((select retorno from sp_retorno_debitocredito(old.tipo_v' +
          'enda,old.tipv,:vtipo_os)) <> '#39'S'#39') then'
        '      exit;*/'
        '  end'
        ''
        '  if (coalesce(vpercetual_dc_temp,0)> 0) then'
        '    vpercetual_dc = vpercetual_dc_temp;'
        ''
        '  if (inserting) then'
        
          '    vdebcred = (coalesce(new.quant,0) * coalesce(new.valor,0) * ' +
          'vpercetual_dc)/100;'
        
          '  else vdebcred = (coalesce(old.quant,0) * coalesce(old.valor,0)' +
          ' * vpercetual_dc)/100;'
        ''
        '  if (inserting) then'
        '    vdescricao = '#39'DEBITO REF. A DEVOLUCAO ITEM '#39';'
        '  else vdescricao = '#39'ESTORNO - EXCLUSAO DE ITEM DEV '#39';'
        ''
        '  if ((inserting) and (new.cod_vendedor is not null)) then'
        '  begin'
        
          '    insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VENDEDOR,' +
          'DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,DESCRI' +
          'CAO)'
        
          '      values ((select COD from INCREMENTA_CODIGO(new.cod_empresa' +
          ', '#39'LANC_DEBCRED'#39')),'
        
          '      new.cod_empresa,new.cod_vendedor,current_date ,current_tim' +
          'e,'#39'DEV'#39','
        
          '      -(:vdebcred) ,new.sequencia, :vdescricao||'#39'|'#39'||new.seqid||' +
          #39'|'#39'||new.grupo_prod||'#39'|'#39'||new.cod_prod);'
        '  end'
        '  else if (old.cod_vendedor is not null) then'
        '  begin'
        
          '    insert into LANC_DEBCRED (COD_LANC,COD_EMPRESA,COD_VENDEDOR,' +
          'DATA_LANC,HORA_LANC,ORIGEM_LANC,VL_LANCDEBCRED,NPEDORIGEM,DESCRI' +
          'CAO)'
        
          '      values ((select COD from INCREMENTA_CODIGO(old.cod_empresa' +
          ', '#39'LANC_DEBCRED'#39')),'
        
          '      old.cod_empresa,old.cod_vendedor,current_date ,current_tim' +
          'e,'#39'DEV'#39','
        
          '      (:vdebcred) ,old.sequencia, :vdescricao||'#39'|'#39'||old.seqid||'#39 +
          '|'#39'||old.grupo_prod||'#39'|'#39'||old.cod_prod);'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_LANCDEBCRED_SALDODEBCRED FOR LANC_DEB' +
          'CRED'
        'ACTIVE AFTER INSERT OR DELETE POSITION 0'
        'AS'
        '  declare variable vsaldo t_vl_todos;'
        'begin'
        '  if (inserting) then'
        '  begin'
        '    if (new.cod_vendedor is not null) then'
        '    begin'
        '      select sdc.saldo from saldo_debcred sdc'
        
          '        where sdc.cod_vendedor = new.cod_vendedor and sdc.cod_em' +
          'presa=new.cod_empresa and sdc.data=current_date'
        '        into :vsaldo;'
        '      if (row_count>0) then'
        '      begin'
        
          '        if ((round((coalesce(vsaldo,0) + coalesce(new.vl_lancdeb' +
          'cred,0)),5))=0.00000) then'
        '          update saldo_debcred sdc set sdc.saldo= 0'
        
          '            where sdc.cod_empresa=new.cod_empresa and sdc.cod_ve' +
          'ndedor=new.cod_vendedor and sdc.data=current_date;'
        '        else'
        
          '          update saldo_debcred sdc set sdc.saldo= coalesce(:vsal' +
          'do,0) + coalesce(new.vl_lancdebcred,0)'
        
          '            where sdc.cod_empresa=new.cod_empresa and sdc.cod_ve' +
          'ndedor=new.cod_vendedor and sdc.data=current_date;'
        '      end else'
        '      begin'
        
          '        select first 1 coalesce(sdc.saldo,0) from saldo_debcred ' +
          'sdc'
        
          '          where sdc.cod_vendedor= new.cod_vendedor and sdc.cod_e' +
          'mpresa=new.cod_empresa order by sdc.cod_saldo desc'
        '          into :vsaldo;'
        '        if (row_count=0) then'
        '          vsaldo=0;'
        
          '        insert into saldo_debcred (COD_SALDO,COD_EMPRESA,COD_VEN' +
          'DEDOR,SALDO,DATA)'
        
          '          values ((select COD from INCREMENTA_CODIGO(new.cod_emp' +
          'resa, '#39'SALDO_DEBCRED'#39')),'
        
          '          new.cod_empresa,new.cod_vendedor, (coalesce(:vsaldo,0)' +
          '+coalesce(new.vl_lancdebcred,0)),current_date);'
        '      end'
        '    end'
        '  end else'
        '  begin'
        '    if (old.cod_vendedor is not null) then'
        '    begin'
        '      select sdc.saldo from saldo_debcred sdc'
        
          '        where sdc.cod_vendedor = old.cod_vendedor and sdc.cod_em' +
          'presa=old.cod_empresa and sdc.data=current_date'
        '        into :vsaldo;'
        '      if (row_count>0) then'
        '      begin'
        
          '        if ((round((coalesce(vsaldo,0) - coalesce(old.vl_lancdeb' +
          'cred,0)),5))=0.00000) then'
        '          update saldo_debcred sdc set sdc.saldo= 0'
        
          '            where sdc.cod_empresa=old.cod_empresa and sdc.cod_ve' +
          'ndedor=old.cod_vendedor and sdc.data=current_date;'
        '        else'
        
          '          update saldo_debcred sdc set sdc.saldo= coalesce(sdc.s' +
          'aldo,0) - coalesce(old.vl_lancdebcred,0)'
        
          '            where sdc.cod_empresa=old.cod_empresa and sdc.cod_ve' +
          'ndedor=old.cod_vendedor and sdc.data=current_date;'
        '       end else'
        '      begin'
        '        select first 1 sdc.saldo from saldo_debcred sdc'
        
          '          where sdc.cod_vendedor= old.cod_vendedor and sdc.cod_e' +
          'mpresa=old.cod_empresa order by sdc.cod_saldo desc'
        '          into :vsaldo;'
        '        if (vsaldo is null) then'
        '          vsaldo=0;'
        
          '        insert into saldo_debcred (COD_SALDO,COD_EMPRESA,COD_VEN' +
          'DEDOR,SALDO,DATA)'
        
          '          values ((select COD from INCREMENTA_CODIGO(old.cod_emp' +
          'resa, '#39'SALDO_DEBCRED'#39')),'
        
          '          old.cod_empresa,old.cod_vendedor,coalesce(:vsaldo,0)-c' +
          'oalesce(old.vl_lancdebcred,0),current_date);'
        '      end'
        '    end'
        '  end'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_BAIXA_CREDITOS_BI_EMPMULT FOR BAIXA_C' +
          'REDITOS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (new.cod_emp_mult is null) then'
        '    new.cod_emp_mult = new.codigo_emp;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_CONTAS_A_PAGAR_BI_EMPMULT FOR CONTAS_' +
          'A_PAGAR'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (new.cod_emp_mult is null) then'
        '    new.cod_emp_mult = new.codigo_emp;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_CONTROLE_CHEQUE_BI_EMPMULT FOR CONTRO' +
          'LE_CHEQUE'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (new.cod_emp_mult is null) then'
        '    new.cod_emp_mult = new.codigo_emp;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_CONTROLE_CREDITOS_BI_EMPMULT FOR CONT' +
          'ROLE_CREDITOS'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (new.cod_emp_mult is null) then'
        '    new.cod_emp_mult = new.codigo_emp;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_LANCAMENTOS_BI_EMPMULT FOR LANCAMENTO' +
          'S'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (new.cod_emp_mult is null) then'
        '    new.cod_emp_mult = new.codigo_emp;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_LOTE_LANC_BI_EMPMULT FOR LOTE_LANC'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (new.cod_emp_mult is null) then'
        '    new.cod_emp_mult = new.codigo_emp;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_ITENS_CARTA_BI_EMPMULT FOR ITENS_CART' +
          'A'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (new.cod_emp_mult is null) then'
        '    new.cod_emp_mult = new.cod_empresa;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_COBREBEM_BI_EMPMULT FOR COBREBEM'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (new.cod_emp_mult is null) then'
        '    new.cod_emp_mult = new.cod_empresa;'
        'END'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW DESPMES*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER NOTAFISCAL_DEL_CONTAS_A_PAG FOR NOTAFISC' +
          'AL'
        'ACTIVE BEFORE DELETE POSITION 0'
        'as'
        '  declare variable vunificado char(1);'
        'begin'
        
          '  if ((old.natureza_nf = '#39'E'#39') and (old.emissao_propria = '#39'N'#39')) t' +
          'hen'
        '  begin'
        '    select coalesce(e.financeiro_unificado, '#39#39')'
        
          '      from empresa e where e.cod_empresa = old.cod_empresa into ' +
          ':vunificado;'
        ''
        '    if (:vunificado = '#39'S'#39') then'
        '    begin'
        
          '      delete from contas_a_pagar where num_nota_nfe = old.num_nf' +
          ' and'
        
          '        cod_forn_nfe = old.cod_cliente and cod_emp_mult = old.co' +
          'd_empresa and'
        '        (( status_ctp <> '#39'QUITADO'#39' ) or ( status_ctp is null ));'
        '    end'
        '    else'
        '    begin'
        
          '      delete from contas_a_pagar where num_nota_nfe = old.num_nf' +
          ' and'
        
          '        cod_forn_nfe = old.cod_cliente and codigo_emp = old.cod_' +
          'empresa and'
        '        (( status_ctp <> '#39'QUITADO'#39' ) or ( status_ctp is null ));'
        '    end'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_SPED_CREDITOS_PERIODO_UTIL FOR SPED_C' +
          'REDITOS_PERIODO_UTIL'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        'begin'
        '  if (inserting) then'
        
          '    update sped_creditos_periodo scp set scp.valor_pis_util = co' +
          'alesce(scp.valor_pis_util, 0) + coalesce(new.valor_pis_util,0),'
        
          '      scp.valor_cofins_util = coalesce(scp.valor_cofins_util, 0)' +
          ' + coalesce(new.valor_cofins_util,0)'
        
          '    where scp.ano = new.ano and scp.mes = new.mes and scp.cnpj =' +
          ' new.cnpj and scp.sped = new.sped;'
        ''
        '  if (deleting) then'
        
          '    update sped_creditos_periodo scp set scp.valor_pis_util = co' +
          'alesce(scp.valor_pis_util, 0) - coalesce(old.valor_pis_util,0),'
        
          '      scp.valor_cofins_util = coalesce(scp.valor_cofins_util, 0)' +
          ' - coalesce(old.valor_cofins_util,0)'
        
          '    where scp.ano = old.ano and scp.mes = old.mes and scp.cnpj =' +
          ' old.cnpj and scp.sped = old.sped;'
        '    '
        '  if (updating) then'
        
          '    update sped_creditos_periodo scp set scp.valor_pis_util = co' +
          'alesce(scp.valor_pis_util, 0) - coalesce(old.valor_pis_util,0) +' +
          ' coalesce(new.valor_pis_util,0),'
        
          '      scp.valor_cofins_util = coalesce(scp.valor_cofins_util, 0)' +
          ' - coalesce(old.valor_cofins_util,0) + coalesce(new.valor_cofins' +
          '_util,0)'
        
          '    where scp.ano = new.ano and scp.mes = new.mes and scp.cnpj =' +
          ' new.cnpj and scp.sped = new.sped;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PROM_PROD_BI_PROPORC_PREC FOR PROMOCA' +
          'O_PRODUTO'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        '  declare variable vprec_tab_prod t_vl_todos;'
        'begin'
        
          '  if ((coalesce(new.proporcao_tabela, 0) = 0) and (coalesce(new.' +
          'valor_promocao, 0) > 0) and (coalesce(new.cod_tppreco, 0) > 1)) ' +
          'then'
        '  begin'
        
          '    select prec_tab_prod from produtos where new.grupo_prod = gr' +
          'upo_prod and new.cod_prod = cod_prod and new.cod_empresa = cod_e' +
          'mpresa'
        '      into :vprec_tab_prod;'
        ''
        '    if (coalesce(vprec_tab_prod, 0) > 0) then'
        
          '      new.proporcao_tabela = new.valor_promocao / vprec_tab_prod' +
          ';'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_DTWS_CEST FOR CEST*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TISPED_PC_RETENCAO_PERIODO_UTIL FOR SPED' +
          '_PC_RETENCAO_PERIODO_UTIL'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        'begin'
        '  if (inserting) then'
        
          '    update sped_pc_retencao_periodo scp set scp.valor_pis_util =' +
          ' coalesce(scp.valor_pis_util, 0) + coalesce(new.valor_pis_util,0' +
          '),'
        
          '      scp.valor_cofins_util = coalesce(scp.valor_cofins_util, 0)' +
          ' + coalesce(new.valor_cofins_util,0)'
        
          '    where scp.ano = new.ano and scp.mes = new.mes and scp.cnpj =' +
          ' new.cnpj and scp.sped = new.sped;'
        ''
        '  if (deleting) then'
        
          '    update sped_pc_retencao_periodo scp set scp.valor_pis_util =' +
          ' coalesce(scp.valor_pis_util, 0) - coalesce(old.valor_pis_util,0' +
          '),'
        
          '      scp.valor_cofins_util = coalesce(scp.valor_cofins_util, 0)' +
          ' - coalesce(old.valor_cofins_util,0)'
        
          '    where scp.ano = old.ano and scp.mes = old.mes and scp.cnpj =' +
          ' old.cnpj and scp.sped = old.sped;'
        '    '
        '  if (updating) then'
        
          '    update sped_pc_retencao_periodo scp set scp.valor_pis_util =' +
          ' coalesce(scp.valor_pis_util, 0) - coalesce(old.valor_pis_util,0' +
          ') + coalesce(new.valor_pis_util,0),'
        
          '      scp.valor_cofins_util = coalesce(scp.valor_cofins_util, 0)' +
          ' - coalesce(old.valor_cofins_util,0) + coalesce(new.valor_cofins' +
          '_util,0)'
        
          '    where scp.ano = new.ano and scp.mes = new.mes and scp.cnpj =' +
          ' new.cnpj and scp.sped = new.sped;'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CONFIG_SISTEMA_BI_ORD FOR CONFIG_SISTEMA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (inserting) then'
        '    if (new.ordem is null) then'
        '      new.ordem = gen_id(inc_ord_config_sistema, 1);'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CONFIG_SISTEMA_BI_ORD FOR CONFIG_SISTEMA'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  if (inserting) then'
        '    if (new.ordem is null) then'
        '      new.ordem = gen_id(inc_ord_config_sistema, 1);'
        'end;'
        '|/BLOCO|'
        ''
        'DROP TRIGGER CODIGO_CORFAB_BI;'
        
          'CMD:REPL|UPDATE RECIBOS SET NUM_REC_DEP = NRECIBO WHERE NUM_REC_' +
          'DEP IS NULL;'
        'ALTER TABLE PEDVENDA ADD QTDE_IMPRESSAO SMALLINT;'
        
          'INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PR' +
          'OCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRAVAR_AUDIT' +
          'ORIA, DATA_MOD_CAD) VALUES ('#39'VND225'#39', :COD_EMPRESA, '#39'PERMITIR RE' +
          'IMPRESSAO DAV ACIMA DO LIMITE'#39', 10, '#39'FRMCADPEDVENDA'#39', 1, '#39'S'#39', '#39'S' +
          #39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NOTAFISCAL_AU_NUMNF_REP FOR NOTAFISCAL'
        'ACTIVE AFTER UPDATE POSITION 0'
        'AS'
        'declare variable VNUMNF integer;'
        'begin'
        '  if ( (old.emissao_propria = new.emissao_propria) and'
        '       (old.natureza_nf = new.natureza_nf) and'
        '       (old.num_gerado = new.num_gerado) and'
        '       (old.status = new.status) and'
        '       (old.num_nf = new.num_nf) ) then'
        '    exit;'
        ''
        
          '    if ((((new.emissao_propria = '#39'S'#39') and (new.natureza_nf = '#39'S'#39 +
          ')) or'
        
          '    ((new.emissao_propria = '#39'S'#39') and (new.natureza_nf = '#39'E'#39') and' +
          ' (new.num_gerado = '#39'S'#39'))) and'
        '    (new.num_nf > 0) ) then'
        '  begin'
        ''
        
          '    select first 1 num_nf from notafiscal nf where nf.num_nf = n' +
          'ew.num_nf and nf.cod_empresa = new.cod_empresa and'
        
          '      nf.modelo_nf = new.modelo_nf and nf.serie = new.serie and ' +
          'nf.emissao_propria = '#39'S'#39' and'
        '      nf.cod_nf <> new.cod_nf and'
        
          '      ((nf.natureza_nf = '#39'S'#39') or ( (nf.natureza_nf = '#39'E'#39') and (n' +
          'f.num_gerado = '#39'S'#39') )) into :VNUMNF;'
        ''
        '    if (coalesce(:vnumnf,0) > 0) then'
        '      EXCEPTION exc_num_nf_repetido;'
        ''
        '  end'
        'end'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_COLAB_BIU_ENV_WSHW FOR COLABORADOR'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  if (updating) then'
        '  begin'
        '    if (new.data_hora_env_ws = old.data_hora_env_ws ) then'
        '        new.data_hora_alt_ws = current_timestamp;'
        '  end'
        '  else'
        '    new.data_hora_alt_ws = current_timestamp;'
        'end'
        '|/BLOCO|'
        ''
        'ALTER TABLE CODIGO_CORFAB ADD US_CAD INTEGER;'
        'ALTER TABLE CODIGO_CORFAB ADD US_EDIT INTEGER;'
        'ALTER TABLE CODIGO_CORFAB ADD DATA_CAD TIMESTAMP;'
        'ALTER TABLE CODIGO_CORFAB ADD DATA_EDIT TIMESTAMP; '
        'ALTER TABLE TIPMODELO ADD CEST VARCHAR(7);'
        
          'CMD:REPL|update TIPMODELO t set t.cest = (select first 1 n.cest ' +
          'from nbm n where n.cod_ncm = t.ncmsh) where coalesce(t.cest, '#39#39')' +
          ' = '#39#39' and coalesce(t.ncmsh, '#39#39') <> '#39#39' and t.cod_empresa = :COD_E' +
          'MPRESA;'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 30' +
          ', RDB$CHARACTER_LENGTH = 30, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'EST_MOTO'#39') and (r.rdb$field_name='#39'CORE' +
          'ST'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 30' +
          ', RDB$CHARACTER_LENGTH = 30, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'EST_MOTO'#39') and (r.rdb$field_name='#39'TIPO' +
          'EST'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 50' +
          ', RDB$CHARACTER_LENGTH = 50, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'EST_MOTO'#39') and (r.rdb$field_name='#39'COMB' +
          'USTIVELEST'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 60' +
          ', RDB$CHARACTER_LENGTH = 60, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'EST_MOTO'#39') and (r.rdb$field_name='#39'DESC' +
          'RICAO_VERSAOEST'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 30' +
          ', RDB$CHARACTER_LENGTH = 30 where RDB$FIELD_NAME = (select trim(' +
          'f.rdb$field_name) from rdb$relation_fields r join rdb$fields f o' +
          'n f.rdb$field_name = rdb$field_source where (r.rdb$relation_name' +
          ' = '#39'NOTAFISCAL_ITEM_VEICULO'#39') and (r.rdb$field_name='#39'COR'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 30' +
          ', RDB$CHARACTER_LENGTH = 30 where RDB$FIELD_NAME = (select trim(' +
          'f.rdb$field_name) from rdb$relation_fields r join rdb$fields f o' +
          'n f.rdb$field_name = rdb$field_source where (r.rdb$relation_name' +
          ' = '#39'NOTAFISCAL_ITEM_VEICULO'#39') and (r.rdb$field_name='#39'TIPO'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 50' +
          ', RDB$CHARACTER_LENGTH = 50 where RDB$FIELD_NAME = (select trim(' +
          'f.rdb$field_name) from rdb$relation_fields r join rdb$fields f o' +
          'n f.rdb$field_name = rdb$field_source where (r.rdb$relation_name' +
          ' = '#39'NOTAFISCAL_ITEM_VEICULO'#39') and (r.rdb$field_name='#39'COMBUSTIVEL' +
          #39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 60' +
          ', RDB$CHARACTER_LENGTH = 60 where RDB$FIELD_NAME = (select trim(' +
          'f.rdb$field_name) from rdb$relation_fields r join rdb$fields f o' +
          'n f.rdb$field_name = rdb$field_source where (r.rdb$relation_name' +
          ' = '#39'NOTAFISCAL_ITEM_VEICULO'#39') and (r.rdb$field_name='#39'DESCRICAO_V' +
          'ERSAO'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 30' +
          ', RDB$CHARACTER_LENGTH = 30, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'VEICULOS'#39') and (r.rdb$field_name='#39'COR'#39 +
          '));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 30' +
          ', RDB$CHARACTER_LENGTH = 30, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'VEICULOS'#39') and (r.rdb$field_name='#39'ESPE' +
          'CIE'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 50' +
          ', RDB$CHARACTER_LENGTH = 50, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'VEICULOS'#39') and (r.rdb$field_name='#39'COMB' +
          'USTIVEL'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 60' +
          ', RDB$CHARACTER_LENGTH = 60, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'VEICULOS'#39') and (r.rdb$field_name='#39'DESC' +
          'MODELO'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 32' +
          ', RDB$CHARACTER_LENGTH = 32, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'VEICULOS'#39') and (r.rdb$field_name='#39'MARC' +
          'A_V'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 30' +
          ', RDB$CHARACTER_LENGTH = 30, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'COM_FAT'#39') and (r.rdb$field_name='#39'CODFI' +
          'SC_V'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 30' +
          ', RDB$CHARACTER_LENGTH = 30, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'TIPMODELO'#39') and (r.rdb$field_name='#39'TIP' +
          'O'#39'));'
        
          'update RDB$FIELDS set RDB$FIELD_TYPE = 37, RDB$FIELD_LENGTH = 50' +
          ', RDB$CHARACTER_LENGTH = 50, RDB$COLLATION_ID = 0 where RDB$FIEL' +
          'D_NAME = (select trim(f.rdb$field_name) from rdb$relation_fields' +
          ' r join rdb$fields f on f.rdb$field_name = rdb$field_source wher' +
          'e (r.rdb$relation_name = '#39'TIPMODELO'#39') and (r.rdb$field_name='#39'COM' +
          'BUSTIVEL'#39'));'
        'ALTER TABLE CLIENTES ADD US_MOD_CL INTEGER DEFAULT 0;'
        'ALTER TABLE FILA_RESERVA_VEIC ADD STATUS_RENOV_RES CHAR(1);'
        'ALTER TABLE FILA_RESERVA_VEIC ADD QTDE_RENOV_RES INTEGER;'
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
          '_ESTMOTO, EST.CHASSI_C,'
        
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
          '_ESTMOTO, EST.CHASSI_C,'
        
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
          '_ESTMOTO, EST.CHASSI_C,'
        
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
          'D_ESTMOTO, EST.CHASSI_C,'
        
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
        #39'N'#39' STATUS_DEMONST, 0 COD_ESTMOTO, NULL CHASSI_C,'
        
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
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_AI_SIT_PED FOR PEDVENDA'
        'ACTIVE AFTER INSERT POSITION 0'
        'AS'
        '  declare variable vcodig integer;'
        'begin'
        '  IF (USER = '#39'REPL'#39') THEN'
        '    exit;'
        '  if ((new.tipo = '#39'REQ'#39') or (rtrim(new.tipo) = '#39'OS'#39'))  then'
        '  begin'
        
          '    select COD from INCREMENTA_CODIGO(new.cod_empresa, '#39'OCORRENC' +
          'IAS_OS'#39') into :vcodig;'
        
          '    insert into OCORRENCIAS_OS (COD_OCORRENCIA, NPED, TIPO, COD_' +
          'EMPRESA, HISTORICO_OC, DATA_E_HORA, ATIVO, N_OS, SITUACAO, STATU' +
          'S_SITUACAO)'
        
          '      values (:vcodig, new.nped, new.tipo, new.cod_empresa, '#39'PED' +
          'IDO - Iniciado'#39', current_timestamp , 1, new.nped, '#39'PEDIDO'#39', '#39'Ini' +
          'ciado'#39');'
        '  end'
        'end'
        '|/BLOCO|'
        ''
        'ALTER TABLE END_PCLIENTES ADD US_MOD_US INTEGER DEFAULT 0;'
        
          'ALTER TABLE CLIENTES_COM_CONTRATO ADD COD_CTR_INTEGRA INTEGER DE' +
          'FAULT 0;'
        
          'ALTER TABLE CLIENTES_COM_CONTRATO ADD US_MOD_CL INTEGER DEFAULT ' +
          '0;'
        
          'ALTER TABLE CLIENTES_COM_CONTRATO ADD IND_INCLALT INTEGER DEFAUL' +
          'T 0;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ALIQ_ICM_XML T_N_GERAL;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD VALOR_ICM_XML T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ESPELHO_CALC_ST VARCHAR(512);'
        ''
        '|BLOCO|'
        
          'delete from config_colunas conf where conf.componente in ('#39'cdsCt' +
          'rlCh'#39', '#39'cdsCtrlCr'#39');'
        '|/BLOCO|')
    end
  end
end
