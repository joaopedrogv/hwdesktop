inherited frmReestruturaVersao5: TfrmReestruturaVersao5
  Caption = 'frmReestruturaVersao5'
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
        
          'ALTER TABLE COLABORADOR ADD TOKEN BLOB SUB_TYPE 1 SEGMENT SIZE 2' +
          '048 CHARACTER SET ASCII;'
        'ALTER TABLE REESTRURURA_VER ADD MD5BPL VARCHAR(32);')
    end
  end
  inherited Panel3: TPanel
    inherited Label3: TLabel
      Width = 1054
    end
    inherited sqlHwauto: TMemo
      Lines.Strings = (
        
          'ALTER TABLE NOTAFISCAL ADD XML_NFE BLOB SUB_TYPE 1 SEGMENT SIZE ' +
          '8192;'
        
          'ALTER TABLE NOTAFISCAL_CARTA_CORRECAO ADD XML_EVENTO BLOB SUB_TY' +
          'PE 1 SEGMENT SIZE 4096;'
        
          'ALTER TABLE NOTAFISCAL_CARTA_CORRECAO ADD XML_NFE_EPEC BLOB SUB_' +
          'TYPE 1 SEGMENT SIZE 8192;'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CDDEL_MOBILE FOR CIDADES'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        '        '
        
          '     insert into del_mobile(seqid,cod_empresa,data_hora_del,id_d' +
          'el,tabela)'
        
          '     values ((select cod from incrementa_codigo(1,'#39'DEL_MOBILE'#39'))' +
          ','
        '     1, current_timestamp,old.cod_cidade,'#39'CIDADES'#39');'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER CLDEL_MOBILE FOR CLIENTES'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '        exit;'
        ''
        
          '    insert into del_mobile(seqid,cod_empresa,data_hora_del,id_de' +
          'l,tabela)'
        
          '    values ((select cod from incrementa_codigo(old.cod_empresa,'#39 +
          'DEL_MOBILE'#39')),'
        
          '     old.cod_empresa, current_timestamp,old.cod_cliente,'#39'CLIENTE' +
          'S'#39');'
        'end;'
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
        '   IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER DEVOLUCAO_DATA_ESTOQUE FOR DEVOLUCAO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  new.data_estoque = current_date;'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER DEVOLUCAO_HIST_ESTOQUE_D FOR DEVOLUCAO' +
          '*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER NOTAFISCAL_DATA_ESTOQUE FOR NOTAFISCAL'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '/*CREATE OR ALTER TRIGGER NOTAFISCAL_ITEM_HIST_ESTOQUE_D FOR NOT' +
          'AFISCAL_ITEM*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_AI_SIT_PED FOR PEDVENDA'
        'ACTIVE AFTER INSERT POSITION 0'
        'AS'
        '  declare variable vcodig integer;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_DATA_ESTOQUE FOR PEDVENDA'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER PEDVENDA_HIST_ESTOQUE_D FOR PEDVENDA*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PEDVENDA_PROD_ALMOX FOR PEDVENDA_PROD'
        'ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0'
        'AS'
        'DECLARE VARIABLE  almox char(2);'
        'DECLARE VARIABLE  nitem integer;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PRODUCAO_DATA_ESTOQUE FOR PRODUCAO'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER PRODUCAO_HIST_ESTOQUE_D FOR PRODUCAO*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_CLIENTES_BIU_LISTAEMAIL FOR CLIENTES'
        'ACTIVE BEFORE INSERT OR UPDATE POSITION 0'
        'AS'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '    exit;'
        ''
        '  if (trim(coalesce(new.listasemail,'#39#39')) = '#39#39') then'
        '    new.listasemail = '#39'COMERCIAL'#39';'
        '  if (position('#39'COMERCIAL'#39', upper(new.listasemail)) = 0) then'
        '    new.listasemail = new.listasemail||'#39','#39'||'#39'COMERCIAL'#39';'
        '  if (new.listasemail <> upper(new.listasemail)) then'
        '    new.listasemail = upper(new.listasemail);'
        'end;'
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
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
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
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'END;'
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
        'end;'
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
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
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
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
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
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
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
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'END;'
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
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'END;'
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
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
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
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER TI_PEDVENDA_SERV_TMO_SERV_OS FOR PEDVEND' +
          'A_SERV'
        'ACTIVE AFTER DELETE POSITION 0'
        'AS'
        'DECLARE VARIABLE  vregistros Integer;'
        'begin'
        ' IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PEDVENDA_SUG_OS FOR PEDVENDA'
        'ACTIVE BEFORE UPDATE POSITION 0'
        'AS'
        '    DECLARE VARIABLE vSugServico integer;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
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
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        '   '
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
        'end;'
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
        '    DECLARE VARIABLE vExisteSug integer;'
        'begin'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        '    select first 1 sugestaoservico.cod_sug from sugestaoservico'
        
          '    where sugestaoservico.placa = new.placa and sugestaoservico.' +
          'chassi = new.chassi'
        
          '    and sugestaoservico.cod_veic = new.codigo and sugestaoservic' +
          'o.cod_empresa = new.cod_empresa'
        '    and coalesce(sugestaoservico.status, '#39#39') <> '#39'CANCELADA'#39
        '    into: vExisteSug;'
        ''
        '    if (vExisteSug > 0) then'
        '        exit;    '
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '--CREATE OR ALTER TRIGGER TR_CLIENTES_IDCONTATO_MARK FOR CLIENTE' +
          'S'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER TRIGGER TR_DTWS_CEST FOR CEST*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        
          '--CREATE OR ALTER TRIGGER TR_END_PCLIENTES_TR_IDCONTATO FOR END_' +
          'PCLIENTES'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER BADEL_MOBILE FOR BAIRROS'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        ' IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        '   '
        
          ' insert into del_mobile(seqid,cod_empresa,data_hora_del,id_del,t' +
          'abela)'
        ' values ((select cod from incrementa_codigo(1,'#39'DEL_MOBILE'#39')),'
        ' 1, current_timestamp,old.cod_bairro,'#39'BAIRROS'#39');'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PMDEL_MOBILE FOR PROMOCAO_PRODUTO'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        ' IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        
          ' insert into del_mobile(seqid,cod_empresa,data_hora_del,id_del,t' +
          'abela)'
        
          ' values ((select cod from incrementa_codigo(old.cod_empresa,'#39'DEL' +
          '_MOBILE'#39')),'
        
          ' old.cod_empresa, current_timestamp,old.seqid,'#39'PROMOCAO_PRODUTO'#39 +
          ');'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER PRDEL_MOBILE FOR PRODUTOS'
        'ACTIVE AFTER DELETE POSITION 0'
        'as'
        'begin'
        ' IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        
          ' insert into del_mobile(seqid,cod_empresa,data_hora_del,id_del,t' +
          'abela)'
        
          ' values ((select cod from incrementa_codigo(old.cod_empresa,'#39'DEL' +
          '_MOBILE'#39')),'
        ' old.cod_empresa, current_timestamp,old.seqid,'#39'PRODUTOS'#39');'
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER TRIGGER TI_PRODUTOS_BU0_EST_REPL FOR PRODUTOS'
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
        '      new.est_f = old.est_f;'
        '      new.prec_cus_prod = old.prec_cus_prod;'
        '      new.prec_cusm_prod = old.prec_cusm_prod;'
        '      new.prec_cusr_prod = old.prec_cusr_prod;'
        '      new.prec_cusmr_prod = old.prec_cusmr_prod;'
        '      new.prec_cus_mnf = old.prec_cus_mnf;'
        '      new.prec_cusr_mnf = old.prec_cusr_mnf;'
        '      new.prec_rep_prod = old.prec_rep_prod;'
        '      new.data_ult_compra = old.data_ult_compra;'
        '      new.num_nf_rec = old.num_nf_rec;'
        '      new.vl_ult_compra = old.vl_ult_compra;'
        '      new.perc_frete_prod = old.perc_frete_prod;'
        '      new.icmant_sub = old.icmant_sub;'
        '      new.baseicmant_sub = old.baseicmant_sub;'
        '      new.locacao_prod = old.locacao_prod;'
        '      new.locacao_prod_1 = old.locacao_prod_1;'
        '      new.comissao_prod = old.comissao_prod;'
        '      new.comissao_prod_ger = old.comissao_prod_ger;'
        '      new.dt_ult_vnd = old.dt_ult_vnd;'
        '      new.dt_ult_vnda = old.dt_ult_vnda;'
        '      new.perc_red_prod = old.perc_red_prod;'
        '      new.aliq_red_prod = old.aliq_red_prod;'
        '      new.tot_aliq = old.tot_aliq;'
        '      new.classe_prod = old.classe_prod;'
        '      new.clinv = old.clinv;'
        '      new.clpreco = old.clpreco;'
        '      new.clpop = old.clpop;'
        '      new.clqtv = old.clqtv;'
        '      new.clfrv = old.clfrv;'
        '      new.clatl = old.clatl;'
        '      new.dat_cad_prod = old.dat_cad_prod;'
        '      new.valorge = old.valorge;'
        '      new.valorpme = old.valorpme;'
        '      new.qtdprod_excesso = old.qtdprod_excesso;'
        '      new.qtddias_excesso = old.qtddias_excesso;'
        '      new.est_seguranca = old.est_seguranca;'
        '      new.freq_pedido = old.freq_pedido;'
        '      new.dmd = old.dmd;'
        '      new.tcutilizado = old.tcutilizado;'
        '      new.qtd_etiquetas = old.qtd_etiquetas;'
        '      new.md5 = old.md5;'
        '      new.tempo_entregasug = old.tempo_entregasug;'
        '      new.cod_inf = old.cod_inf;'
        '      new.cod_producao = old.cod_producao;'
        '      new.dt_ult_s_producao = old.dt_ult_s_producao;'
        '      new.dt_ult_e_producao = old.dt_ult_e_producao;'
        '    end'
        '  end'
        'end;'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CWS035'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA SINCR EM ANDAMENTO WSREPLICACAO'#39', 10, '#39'N'#39', '#39'FRMCADCONFI' +
          'GWS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CWS036'#39', :COD_EMPRESA, '#39'FI' +
          'NALIZAR SINCR EM ANDAMENTO WSREPLICACAO'#39', 10, '#39'N'#39', '#39'FRMCADCONFIG' +
          'WS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CWS037'#39', :COD_EMPRESA, '#39'DE' +
          'SMARCAR SINCR EM ANDAMENTO WSREPLICACAO'#39', 10, '#39'N'#39', '#39'FRMCADCONFIG' +
          'WS'#39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CWS038'#39', :COD_EMPRESA, '#39'AB' +
          'RIR TELA SCRIPTS WSREPLICACAO'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGWS'#39', 1, '#39'S' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CWS039'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTAR SCRIPT WSREPLICACAO'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGWS'#39', 1, '#39 +
          'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CWS040'#39', :COD_EMPRESA, '#39'BT' +
          ' EXECUTAR SCRIPT WSREPLICACAO'#39', 10, '#39'N'#39', '#39'FRMCADCONFIGWS'#39', 1, '#39'S' +
          #39', CURRENT_DATE);'
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
        'end;'
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
        '    DECLARE VARIABLE vExisteSug integer;'
        'begin'
        '    IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
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
        'end;'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'CREATE OR ALTER VIEW FICHAVENDAPROD_SERV('
        '    COD_EMPRESA,'
        '    NOME_EMP,'
        '    TIPO,'
        '    NPED,'
        '    NITEM,'
        '    DATA_FECH,'
        '    GRPROD_CODSERV,'
        '    COD_PROD,'
        '    DESCR_PROD_PED,'
        '    COD_GRADE,'
        '    DESCRICAO_GRADE,'
        '    QUANT_PED_ITEM,'
        '    VLUN_PED_ITEM,'
        '    VLTOT_PED_ITEM,'
        '    N_NF,'
        '    NUM_FAB_PROD,'
        '    RATEIO_DESC,'
        '    RATEIO_ACRESC,'
        '    COD_CLIENTE,'
        '    NOME_CLIENTE,'
        '    CPFCNPJ,'
        '    COD_VENDEDOR,'
        '    NOME_VENDEDOR)'
        'AS'
        
          'select e.cod_empresa, e.nome_emp, pv.tipo,pv.nped,it.nitem,pv.da' +
          'ta_fech,it.grupo_prod,it.cod_prod, it.descr_prod_ped,'
        'g.cod_grade,g.descricao, it.quant_ped_item,it.vlun_ped_item,'
        
          'it.vltot_ped_item,it.n_nf,pr.num_fab_prod,it.rateio_desc,it.rate' +
          'io_acresc,'
        
          'cl.cod_cliente, cl.nome_cliente,cl.cpfcgc,col.cod_vendedor,col.n' +
          'ome_vendedor'
        'from clientes cl inner join pedvenda pv'
        
          'on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_e' +
          'mpresa'
        'inner join pedvenda_prod it'
        
          'on it.nped = pv.nped and it.tipo = pv.tipo and it.cod_empresa=pv' +
          '.cod_empresa'
        
          'inner join colaborador col on it.cod_vendedor=col.cod_vendedor a' +
          'nd it.cod_empresa=col.cod_empresa'
        
          'inner join grade g on it.cod_grade = g.cod_grade and it.cod_empr' +
          'esa = g.cod_empresa'
        'inner join produtos pr'
        
          'on it.cod_prod = pr.cod_prod and it.grupo_prod = pr.grupo_prod a' +
          'nd pr.cod_empresa=it.cod_empresa'
        'inner join empresa e on cl.cod_empresa=e.cod_empresa'
        
          'where (coalesce(it.status,'#39#39') <> '#39'CANCELADO'#39') and pv.data_fech i' +
          's not null and'
        
          '(pv.tipo = '#39'REQ'#39' and ((select retorno from sp_retorno_tipo_venda' +
          '(pv.tipo, pv.tipv))='#39'S'#39'))'
        'and pv.ativo=1'
        ''
        'union'
        ''
        
          'select e.cod_empresa, e.nome_emp, '#39'MOT'#39' tipo, cf.n_comando nped,' +
          ' 1 nitem, cf.data_fech, 0 grupo_prod, cf.chassiv cod_prod, est.d' +
          'escricao_versaoest descr_prod_ped,'
        
          '0 cod_grade, '#39' '#39' descricao, 1 quant_ped_item, cf.valor_real vlun' +
          '_ped_item,'
        
          'cf.valor_real vltot_ped_item, cf.num_nota_v n_nf, cf.chassiv num' +
          '_fab_prod, 0 rateio_desc, 0 rateio_acresc,'
        
          'cl.cod_cliente, cl.nome_cliente, cl.cpfcgc, col.cod_vendedor,col' +
          '.nome_vendedor'
        'from clientes cl'
        
          'inner join com_fat cf on cl.cod_cliente = cf.clientes_v and cl.c' +
          'od_empresa = cf.cod_empresa'
        
          'inner join est_moto est on est.codigo = cf.cod_estmoto and est.c' +
          'hassi_c = cf.chassiv and est.cod_empresa = cf.cod_empresa'
        
          'inner join colaborador col on cf.covend_v = col.cod_vendedor and' +
          ' cf.cod_empresa = col.cod_empresa'
        'inner join empresa e on cl.cod_empresa = e.cod_empresa'
        
          'where cf.natureza = '#39'S'#39' and (coalesce(trim(cf.status_v), '#39#39') = '#39 +
          'FECHADO'#39')'
        ''
        'union'
        ''
        
          'select e.cod_empresa, e.nome_emp, pv.tipo,pv.nped,it.nitem,pv.da' +
          'ta_fech,it.grupo_prod,it.cod_prod, it.descr_prod_ped,'
        'g.cod_grade,g.descricao, it.quant_ped_item,it.vlun_ped_item,'
        
          'it.vltot_ped_item,it.n_nf,pr.num_fab_prod,it.rateio_desc,it.rate' +
          'io_acresc,'
        
          'cl.cod_cliente, cl.nome_cliente,cl.cpfcgc,col.cod_vendedor,col.n' +
          'ome_vendedor'
        'from clientes cl inner join pedvenda pv'
        
          'on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_e' +
          'mpresa'
        'inner join pedvenda_prod it'
        
          'on it.nped = pv.nped and it.tipo = pv.tipo and it.cod_empresa=pv' +
          '.cod_empresa'
        
          'inner join colaborador col on it.cod_vendedor=col.cod_vendedor a' +
          'nd it.cod_empresa=col.cod_empresa'
        
          'inner join grade g on it.cod_grade = g.cod_grade and it.cod_empr' +
          'esa = g.cod_empresa'
        'inner join produtos pr'
        
          'on it.cod_prod = pr.cod_prod and it.grupo_prod = pr.grupo_prod a' +
          'nd pr.cod_empresa=it.cod_empresa'
        'inner join empresa e on cl.cod_empresa=e.cod_empresa'
        
          'where (coalesce(it.status,'#39#39') <> '#39'CANCELADO'#39') and pv.data_fech i' +
          's not null and'
        '(pv.tipo = '#39'OS'#39' and'
        
          '(((select retorno from sp_retorno_tipo_venda(pv.tipo, pv.tipo_os' +
          '))='#39'S'#39')'
        'or ((select retorno from sp_os_garantia(pv.tipo_os))='#39'S'#39')))'
        'and pv.ativo=1'
        ''
        'union'
        ''
        
          'SELECT e.cod_empresa, e.nome_emp, pv.tipo,pv.nped,s.nitem,pv.dat' +
          'a_fech,s.cod_servico,'#39'      '#39',s.desc_serv_ped,null,'
        #39'                               '#39','
        
          's.quant_serv_ped, s.valor_un_serv,s.valor_tot_serv,s.n_nf,'#39'     ' +
          '               '#39','
        
          's.rateio_desc,s.rateio_acresc,cl.cod_cliente, cl.nome_cliente,cl' +
          '.cpfcgc,col.cod_vendedor,col.nome_vendedor'
        'FROM clientes cl inner join  pedvenda pv'
        
          'on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_e' +
          'mpresa'
        'inner join pedvenda_serv s'
        
          'on s.nped = pv.nped and s.tipo = pv.tipo and s.cod_empresa=pv.co' +
          'd_empresa'
        
          'inner join colaborador col on s.cod_vendedor=col.cod_vendedor an' +
          'd s.cod_empresa=col.cod_empresa'
        'inner join empresa e on cl.cod_empresa=e.cod_empresa'
        
          'where coalesce(s.status,'#39#39') <> '#39'CANCELADO'#39'  and  pv.data_fech  i' +
          's not null and'
        'pv.ativo=1 and (pv.tipo = '#39'OS'#39' and'
        
          '(((select retorno from sp_retorno_tipo_venda('#39'OS'#39', pv.tipo_os))=' +
          #39'S'#39')'
        'or ((select retorno from sp_os_garantia(pv.tipo_os))='#39'S'#39')))'
        ''
        'union'
        ''
        
          'SELECT e.cod_empresa, e.nome_emp, '#39'DEV'#39',d.sequencia,d.seqid,d.da' +
          'ta,d.grupo_prod,'
        
          'd.cod_prod,d.descricao,d.cod_grade,g.descricao, (-1)*d.quant,(-1' +
          ')*d.valor,(-1)*(d.valor*d.quant),'
        
          'd.NUM_NOTA_NFE,d.num_fab_prod,0,0,cl.cod_cliente, cl.nome_client' +
          'e,cl.cpfcgc,col.cod_vendedor,col.nome_vendedor FROM clientes cl'
        'inner join  devolucao d'
        
          'on cl.cod_cliente =d.cod_cliente and cl.cod_empresa = d.cod_empr' +
          'esa'
        
          'inner join colaborador col on d.cod_vendedor=col.cod_vendedor an' +
          'd d.cod_empresa=col.cod_empresa'
        
          'inner join grade g on d.cod_grade = g.cod_grade and d.cod_empres' +
          'a = g.cod_empresa'
        'inner join empresa e on cl.cod_empresa=e.cod_empresa'
        'WHERE d.ativo=1 and d.data is not null;'
        '|/BLOCO|'
        ''
        'ALTER TABLE EMPRESA ADD EMP_REPL_INTERNA INTEGER;'
        'ALTER TABLE EQUIPAMENTO ADD PORTARIA_MODELO VARCHAR(64);'
        
          'ALTER TABLE PEDVENDA ADD SELOS_COL BLOB SUB_TYPE 0 SEGMENT SIZE ' +
          '80;'
        
          'ALTER TABLE PEDVENDA ADD SELOS_REM BLOB SUB_TYPE 0 SEGMENT SIZE ' +
          '80;'
        
          'ALTER TABLE PEDVENDA ADD LACRES_COL BLOB SUB_TYPE 0 SEGMENT SIZE' +
          ' 80;'
        
          'ALTER TABLE PEDVENDA ADD LACRES_REM BLOB SUB_TYPE 0 SEGMENT SIZE' +
          ' 80;'
        'ALTER TABLE COLABORADOR ADD RG_VENDEDOR VARCHAR(11);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG100'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTA BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG101'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG102'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG103'#39', :COD_EMPRESA, '#39'BT' +
          ' ENVIAR PARA LIXEIRA BANDEIRAS CARTAO'#39', 5, '#39'S'#39', '#39'FRMCADADMCARTAO' +
          #39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG104'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR DEFINITIVO BANDEIRAS CARTAO'#39', 10, '#39'S'#39', '#39'FRMCADADMCARTAO' +
          #39', 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG105'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', CU' +
          'RRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG106'#39', :COD_EMPRESA, '#39'BT' +
          ' CANCELA BANDEIRAS CARTAO'#39', 1, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', C' +
          'URRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG107'#39', :COD_EMPRESA, '#39'BT' +
          ' VER LIXEIRA BANDEIRAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S' +
          #39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG108'#39', :COD_EMPRESA, '#39'BT' +
          ' RESTAURAR REGISTRO BANDERIA CARTAO'#39', 5, '#39'S'#39', '#39'FRMCADADMCARTAO'#39',' +
          ' 1, '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG109'#39', :COD_EMPRESA, '#39'BT' +
          ' CONSULTA TAXAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', CURR' +
          'ENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG110'#39', :COD_EMPRESA, '#39'BT' +
          ' NOVO TAXAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', CURRENT_' +
          'DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG111'#39', :COD_EMPRESA, '#39'BT' +
          ' ALTERAR TAXAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', CURRE' +
          'NT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG112'#39', :COD_EMPRESA, '#39'BT' +
          ' EXCLUIR DEFINITIVO TAXAS CARTAO'#39', 10, '#39'S'#39', '#39'FRMCADADMCARTAO'#39', 1' +
          ', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG113'#39', :COD_EMPRESA, '#39'BT' +
          ' SALVAR TAXAS CARTAO'#39', 5, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', CURREN' +
          'T_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG114'#39', :COD_EMPRESA, '#39'BT' +
          ' CANCELA TAXAS CARTAO'#39', 1, '#39'N'#39', '#39'FRMCADADMCARTAO'#39', 1, '#39'S'#39', CURRE' +
          'NT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE BANDEIRAS_CARTAO ('
        '    COD_BANDEIRA  INTEGER NOT NULL,'
        '    COD_EMPRESA   INTEGER NOT NULL,'
        '    DESCRICAO     VARCHAR(32),'
        '    ATIVO         SMALLINT DEFAULT 1'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE BANDEIRAS_CARTAO ADD CONSTRAINT PK_BANDEIRAS_CARTAO ' +
          'PRIMARY KEY (COD_BANDEIRA, COD_EMPRESA);'
        ''
        '|BLOCO|'
        'CREATE TABLE ADM_CARTAO_TAXAS_BANDEIRAS ('
        '    SEQID           INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        '    COD_BANDEIRA    INTEGER NOT NULL,'
        '    COD_ADM         INTEGER NOT NULL,'
        '    DEBITO_CREDITO  CHAR(1) default '#39'C'#39','
        '    PARCELAS_DE     SMALLINT,'
        '    PARCELAS_ATE    SMALLINT,'
        
          '    TAXA            T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
          'DEFAULT 000000000.00 */'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE ADM_CARTAO_TAXAS_BANDEIRAS ADD CONSTRAINT PK_ADM_CAR' +
          'TAO_TAXAS_BANDEIRAS PRIMARY KEY (SEQID, COD_EMPRESA);'
        
          'ALTER TABLE ADM_CARTAO_TAXAS_BANDEIRAS ADD CONSTRAINT FK_ADM_CAR' +
          'TAO_TAXA FOREIGN KEY (COD_ADM, COD_EMPRESA) REFERENCES ADM_CARTA' +
          'O (COD_ADM, COD_EMPRESA) ON UPDATE CASCADE;'
        
          'ALTER TABLE ADM_CARTAO_TAXAS_BANDEIRAS ADD CONSTRAINT FK_BANDEIR' +
          'A_CARTA_TAXA FOREIGN KEY (COD_BANDEIRA, COD_EMPRESA) REFERENCES ' +
          'BANDEIRAS_CARTAO (COD_BANDEIRA, COD_EMPRESA) ON UPDATE CASCADE;'
        'ALTER TABLE PEDVENDA ADD N_NFD INTEGER;'
        'ALTER TABLE PEDVENDA ADD SERIE_NFD VARCHAR(5);'
        'ALTER TABLE PEDVENDA ADD NFD_GEROU CHAR(1);'
        'ALTER TABLE PEDVENDA_PROD ADD N_NFD INTEGER;'
        'ALTER TABLE PEDVENDA_PROD ADD SERIED VARCHAR(5);'
        'ALTER TABLE PEDVENDA ADD DATA_NFD TIMESTAMP;'
        'ALTER TABLE PEDVENDA ADD VALOR_NFD T_VL_TODOS;'
        'ALTER TABLE NF_SERIE_D ADD NPED INTEGER;'
        'ALTER TABLE NF_SERIE_D ADD TIPO_PED VARCHAR(3);'
        'ALTER TABLE NF_SERIE_D_ITENS ADD NPED INTEGER;'
        'ALTER TABLE NF_SERIE_D_ITENS ADD TIPO_PED VARCHAR(3);'
        'ALTER TABLE NF_SERIE_D_ITENS ADD NITEM_PED INTEGER;'
        
          'ALTER TABLE COLABORADOR ADD TOKEN BLOB SUB_TYPE 1 SEGMENT SIZE 2' +
          '048 CHARACTER SET ASCII;'
        
          'ALTER TABLE CLIENTES_COM_CONTRATO ADD CONTRATOS_CADA_MES INTEGER' +
          ';'
        'ALTER TABLE PRODUTOS ADD ICMS_RECOMPOSICAO T_VL_TODOS;'
        'ALTER TABLE NOTAFISCAL_ITEM ADD ICMS_RECOMPOSICAO T_VL_TODOS;'
        'ALTER TABLE COND_PAG ADD MODALIDADE CHAR(1);'
        'ALTER TABLE COND_PAG ADD CONSIDERAR_DIA_UTIL VARCHAR(3);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI204'#39', :COD_EMPRESA, '#39'AB' +
          'RIR GERADOR DE OS/FORMAS/BOLETAS'#39', 10, '#39'FRMGERADOROSFORMASBOLETA' +
          'S'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI205'#39', :COD_EMPRESA, '#39'GE' +
          'RAR OS/FORMAS/BOLETAS'#39', 10, '#39'FRMGERADOROSFORMASBOLETAS'#39', 1, '#39'S'#39',' +
          ' '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI206'#39', :COD_EMPRESA, '#39'CO' +
          'NSULTAR CONTRATOS COM CLIENTES'#39', 5, '#39'FRMCADCLIENTES'#39', 1, '#39'N'#39', '#39'S' +
          #39', CURRENT_DATE);'
        ''
        '|BLOCO|'
        'CREATE TABLE GERADOR_OSBOL ('
        '    COD_GERADOR     INTEGER NOT NULL,'
        '    COD_EMPRESA     INTEGER NOT NULL,'
        
          '    VALOR_GERADOR   T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
          'DEFAULT 000000000.00 */,'
        '    DATA_BASE_DOC   TIMESTAMP NOT NULL,'
        '    DATA_GERADOR    TIMESTAMP NOT NULL,'
        '    MES_VENCIMENTO  INTEGER,'
        '    ANO_VENCIMENTO  INTEGER,'
        '    STATUS_TMO      VARCHAR(10),'
        '    COD_VENDEDOR    INTEGER,'
        '    COD_SUB_GRUPO   INTEGER,'
        '    UTILIZA_CXL     CHAR(1),'
        '    GERAR_BOLETO    CHAR(1),'
        '    AGRUPAR_CONTR   CHAR(1),'
        '    DESCONS_CTRL    CHAR(1)'
        ');'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE GERADOR_OSBOL ADD CONSTRAINT PK_GERADOR_OSBOL PRIMAR' +
          'Y KEY (COD_GERADOR, COD_EMPRESA);'
        'ALTER TABLE PEDVENDA ADD COD_GERADOR INTEGER;'
        'ALTER TABLE FORMPAGAMENTO ADD COD_GERADOR INTEGER;'
        'ALTER TABLE BOLETAS ADD COD_GERADOR INTEGER;'
        'ALTER TABLE COND_PAG ADD PARCELAS_ADICIONAIS SMALLINT;'
        'ALTER TABLE CLIENTES ADD COND_PAG_VND VARCHAR(128);'
        'ALTER TABLE CLIENTES ADD COND_PAG_PRE VARCHAR(128);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI207'#39', :COD_EMPRESA, '#39'AD' +
          'D OU REMOVER COND PAG CLIENTE VENDAS'#39', 6, '#39'FRMCADCLIENTES'#39', 1, '#39 +
          'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI208'#39', :COD_EMPRESA, '#39'AD' +
          'D OU REMOVER COND PAG CLIENTE PRESTACOES'#39', 6, '#39'FRMCADCLIENTES'#39', ' +
          '1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS409'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR ALTERACAO DATA BASE PARCELAMENTO'#39', 100, '#39'FRMCONDPAGPARCE' +
          'LAMENTO'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS410'#39', :COD_EMPRESA, '#39'HA' +
          'BILITAR ALTERACAO QTDE PARC ADIC PARCELAMENTO'#39', 100, '#39'FRMCONDPAG' +
          'PARCELAMENTO'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_DATE);'
        
          'CMD:REPL|UPDATE CODIGO SET VALOR = 100000 WHERE TABELA = '#39'DEVOLU' +
          'CAO'#39' AND VALOR < 100000;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BAS411'#39', :COD_EMPRESA, '#39'CO' +
          'NFIGURAR REPLICACAO INTERNA'#39', 10, '#39'FRMCADEMPRESA'#39', 1, '#39'S'#39', '#39'S'#39', ' +
          'CURRENT_DATE);'
        
          'CREATE INDEX IDX_PEDVENDA_AGENDA ON PEDVENDA (COD_EMPRESA, COD_A' +
          'GENDA, STATUS_PED);'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS5*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS6*/'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX IDX_PROC_CARTAO_VND ON CONTROLE_CREDITOS (RO_ADM, N' +
          'SU_RO_ADM, NPARCELA, COD_ADM, COD_EMP_MULT)'
        
          'CREATE INDEX IDX_PROC_CARTAO_PARC ON CONTROLE_CREDITOS (N_AUT_CA' +
          'RT, N_DOCNSU_ADM, COD_ADM, COD_EMP_MULT);'
        
          'CMD:REPL|update config_sistema set value1_f = value1_f - 1 where' +
          ' chave = '#39'versao_config_sistema'#39
        ''
        '|BLOCO|CMD:COMMIT|'
        'execute block as begin'
        
          'IF (NOT EXISTS(SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS WH' +
          'ERE RDB$FIELD_NAME = '#39'EXIBIR_RESUMO_FINANCEIRO'#39' AND RDB$RELATION' +
          '_NAME = '#39'CONTROLES'#39')) THEN'
        
          '    execute statement '#39' ALTER TABLE CONTROLES ADD EXIBIR_RESUMO_' +
          'FINANCEIRO CHAR(1); '#39';'
        'end;'
        '|/BLOCO|'
        ''
        
          'UPDATE CONTROLES SET EXIBIR_RESUMO_FINANCEIRO = '#39'S'#39' WHERE EXIBIR' +
          '_RESUMO_FINANCEIRO IS NULL;'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW SALDOS_CTR_LANCAMENTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS4*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW CRED_JUR*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW DEB_JUR*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RESUMO_FINANCEIRO*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW RECEBIMENTOS2*/'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        'create or alter procedure INCREMENTA_WS ('
        '    VCOD_EMPRESA integer,'
        '    VTABELA varchar(32),'
        '    VSEQUENCIA varchar(32))'
        'returns ('
        '    COD integer)'
        'as'
        'declare variable TAB varchar(32);'
        'BEGIN '
        
          '     EXECUTE STATEMENT '#39'SELECT GEN_ID('#39'||:VSEQUENCIA||'#39', 1) FROM' +
          ' RDB$DATABASE'#39' INTO :cod; '
        '     if (coalesce(cod, 0) <= 1) then'
        '     BEGIN '
        
          '       SELECT MAX(VALOR) FROM CODIGO WHERE TABELA = :VTABELA INT' +
          'O :cod; '
        '       if (coalesce(cod, 0) > 0) then'
        '       BEGIN'
        
          '         EXECUTE STATEMENT '#39'ALTER SEQUENCE '#39'||:VSEQUENCIA||'#39' RES' +
          'TART WITH '#39'|| CAST(:cod AS VARCHAR(128));'
        
          '         EXECUTE STATEMENT '#39'SELECT GEN_ID('#39'||:VSEQUENCIA||'#39', 1) ' +
          'FROM RDB$DATABASE'#39' INTO :cod;'
        '       END'
        '    END '
        '    SUSPEND; '
        'END'
        '|/BLOCO|'
        ''
        
          'update menus_auto set desc_menu = '#39'Recebimentos Caixa Auxiliar'#39' ' +
          'where desc_menu = '#39'Recebimento Caixa Auxiliar'#39';'
        
          'update menus_auto set nome_menu = '#39'RecebimentosCaixaAuxiliar'#39' wh' +
          'ere nome_menu = '#39'RecebimentoCaixaAuxiliar'#39';'
        
          'update menus_auto_sistema set nome_menu = '#39'RecebimentosCaixaAuxi' +
          'liar'#39' where nome_menu = '#39'RecebimentoCaixaAuxiliar'#39';'
        
          'update menus_auto_sistema set desc_menu = '#39'Recebimentos Caixa Au' +
          'xiliar'#39' where desc_menu = '#39'Recebimento Caixa Auxiliar'#39';'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW ENTRADASSAIDASDIVERAS*/'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        '/*CREATE OR ALTER VIEW SALDOS_CTR_LANCAMENTOS*/'
        '|/BLOCO|')
    end
  end
end
