inherited frmReestruturaVersao11: TfrmReestruturaVersao11
  Caption = 'frmReestruturaVersao11'
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
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CXG121'#39', :COD_EMPRESA, '#39'CO' +
          'PIAR'#39', 3, '#39'N'#39', '#39'FRMCADPLANOCONTAS'#39', 1, '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND232'#39', :COD_EMPRESA, '#39'BT' +
          ' ENVIAR BOLETO POR EMAIL'#39', 3, '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39', '#39'S'#39', CUR' +
          'RENT_TIMESTAMP);'
        'ALTER TABLE CONTAS_A_PAGAR ADD NPED INTEGER;'
        'ALTER TABLE CONTAS_A_PAGAR ADD TIPO_NPED CHAR(3);'
        
          'CREATE INDEX IDX_CONTAS_A_PAGAR_PED ON CONTAS_A_PAGAR (NPED, TIP' +
          'O_NPED, CODIGO_EMP);'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA2'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'DEV017'#39', :COD_EMPRESA, '#39'HA' +
          'B ALTERAR VL DEVOLV PRODUTOS VINCULADOS REQ/OS'#39', 100, '#39'FRMDEVOLU' +
          'CAO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'DEV018'#39', :COD_EMPRESA, '#39'AL' +
          'TERAR VL DEVOLV PRODUTOS VINCULADOS REQ/OS'#39', 100, '#39'FRMDEVOLUCAO'#39 +
          ', 1, '#39'S'#39', '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND233'#39', :COD_EMPRESA, '#39'LI' +
          'BERA COND A VISTA P/ CLIENTE FATURAMENTO BARRADO'#39', 10, '#39'FRMCADPE' +
          'DVENDA'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_TIMESTAMP);'
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
          'l, null, null, new.chassi_c, 1, coalesce(new.preco_custo_rep, 0)' +
          ', new.status_uso);'
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
          'll, null, null, new.chassi_c, 1, coalesce(new.preco_custo_rep, 0' +
          '), new.status_uso);'
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
          'll, null, null, new.chassi_c, 0, coalesce(new.preco_custo_rep, 0' +
          '), new.status_uso);'
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
          'l, null, null, old.chassi_c, 0, coalesce(old.preco_custo_rep, 0)' +
          ', new.status_uso);'
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
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND234'#39', :COD_EMPRESA, '#39'LI' +
          'BERA FORM A VISTA P/ CLIENTE FATURAMENTO BARRADO'#39', 10, '#39'FRMCADPE' +
          'DVENDA'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND235'#39', :COD_EMPRESA, '#39'LI' +
          'BERA FORM NAO DEF P/ CLIENTE FATURAMENTO BARRAD'#39', 10, '#39'FRMCADPED' +
          'VENDA'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_TIMESTAMP);'
        'ALTER TABLE PEDVENDA ADD TOT_SERV_TERC T_VL_TODOS;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND236'#39', :COD_EMPRESA, '#39'AB' +
          'RIR DESPESAS SERVICO DE TERCEIRO'#39', 10, '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39',' +
          ' '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'VND237'#39', :COD_EMPRESA, '#39'IN' +
          'CLUIR DESPESAS SERVICO DE TERCERO'#39', 10, '#39'FRMCADPEDVENDA'#39', 1, '#39'N'#39 +
          ', '#39'S'#39', CURRENT_TIMESTAMP);'
        'ALTER TABLE PEDVENDA ADD TOT_PROD_TERC T_VL_TODOS;'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA'
        '|/BLOCO|'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW FICHAPRODUTOSDETALHADA2'
        '|/BLOCO|'
        ''
        
          'CREATE INDEX PEDVENDA_PROD_CONF_IDX2 ON PEDVENDA_PROD_CONF (NPED' +
          '_CONF, TIPO_CONF, NITEM_CONF, COD_EMPRESA);'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW VENDAS_VAN'
        '|/BLOCO|'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'DEV019'#39', :COD_EMPRESA, '#39'NA' +
          'O GERAR VALE COMPRA'#39', 10, '#39'FRMDEVOLUCAO'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_T' +
          'IMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'DEV020'#39', :COD_EMPRESA, '#39'VI' +
          'SUALIZAR VALE COMPRA'#39', 10, '#39'FRMDEVOLUCAO'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_' +
          'TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'DEV021'#39', :COD_EMPRESA, '#39'GE' +
          'RAR VALE COMPRA'#39', 10, '#39'FRMDEVOLUCAO'#39', 1, '#39'S'#39', '#39'S'#39', CURRENT_TIMES' +
          'TAMP);'
        ''
        '|BLOCO|CMD:INATIVO|'
        'CREATE OR ALTER VIEW VENDAS_VAN'
        '|/BLOCO|'
        ''
        'ALTER TABLE PEDVENDA_PROD_CONF ADD GRUPO_PROD INTEGER;'
        'ALTER TABLE PEDVENDA_PROD_CONF ADD COD_PROD CHAR(6);'
        'ALTER TABLE PEDVENDA_PROD_CONF ADD COD_GRADE INTEGER;'
        
          'CREATE INDEX PEDVENDA_PROD_CONF_IDX3 ON PEDVENDA_PROD_CONF (NPED' +
          ', TIPO, GRUPO_PROD, COD_PROD, COD_GRADE, NITEM, COD_EMPRESA);'
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
        'DECLARE VARIABLE VGRUPOPRODPDC integer;'
        'begin'
        '  IF (SUBSTRING(USER FROM 1 FOR 4) = '#39'REPL'#39') THEN'
        '   exit;'
        ''
        '  select coalesce(emp.abater_itens, '#39#39') from empresa emp'
        '  where emp.cod_empresa = new.cod_empresa and emp.ativo = 1'
        '  into :vAbaterItens;'
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
        '  into :vconfTp, :vNAbaterItens, :vTipV;'
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
        
          '  if ((updating) and (coalesce(old.nitem, 0) <> coalesce(new.nit' +
          'em, 0)) and (upper(coalesce(vconfTp, '#39#39')) <> '#39'S'#39')'
        '    and (upper(coalesce(trim(old.status), '#39#39')) <> '#39'CANCELADO'#39')'
        
          '    and (upper(coalesce(trim(new.status), '#39#39')) <> '#39'CANCELADO'#39')) ' +
          'then'
        '  begin'
        '     select first 1 pdc.grupo_prod from pedvenda pv'
        
          '      left join pedvenda_prod pp on pp.nped = pv.nped and pp.tip' +
          'o = pv.tipo and pv.cod_empresa = pp.cod_empresa'
        
          '      left join pedvenda_prod_conf pdc on pdc.nped_conf = pp.npe' +
          'd and pdc.tipo_conf = pp.tipo and pdc.nitem_conf = pp.nitem and ' +
          'pdc.cod_empresa = pp.cod_empresa'
        
          '      where pdc.nped = old.nped and pdc.tipo = old.tipo and pdc.' +
          'nitem = old.nitem and pdc.cod_empresa = old.cod_empresa'
        '      into :vgrupoprodpdc;'
        ''
        '     if (coalesce(vgrupoprodpdc, 0) > 0) then'
        '     begin'
        '       update pedvenda_prod_conf pdc set pdc.nitem = new.nitem'
        '       where pdc.nped = new.nped and pdc.tipo = new.tipo'
        
          '       and pdc.grupo_prod = new.grupo_prod and pdc.cod_prod = ne' +
          'w.cod_prod and pdc.cod_grade = new.cod_grade'
        
          '       and pdc.nitem = old.nitem and pdc.cod_empresa = new.cod_e' +
          'mpresa;'
        '     end'
        '     else'
        '     begin'
        '       update pedvenda_prod_conf pdc set pdc.nitem = new.nitem'
        
          '       where pdc.nped = new.nped and pdc.tipo = new.tipo and pdc' +
          '.nitem = old.nitem and pdc.cod_empresa = new.cod_empresa;'
        '     end'
        '  end'
        
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
        
          '         into  :vnped, :vtipo, :vnitem, :vquantConfTemp, :vcod_e' +
          'mpresa do'
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
        '               into :vquantConf, :vstatusItem;'
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
        '            into :vtotvenda, :vtotprod, :vtotacresc, :vtotdesc;'
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
        '           into :vtotvenda, :vtotprod, :vtotacresc, :vtotdesc;'
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
        
          '         into :vconfProd, :vnped, :vtipo, :vcod_empresa, :vgrupo' +
          '_prod, :vcod_prod, :vnitem, :vcod_grade, :vquantConf, :vstatusIt' +
          'em;'
        ''
        
          '         select coalesce(pdi.status,'#39#39') status from pedvenda_pro' +
          'd pdi'
        
          '         where pdi.nped = :vnped and pdi.tipo = :vtipo and pdi.c' +
          'od_empresa = :vcod_empresa'
        
          '                 and pdi.grupo_prod = :vgrupo_prod and pdi.cod_p' +
          'rod = :vcod_prod and pdi.nitem = :vnitem and pdi.cod_grade = :vc' +
          'od_grade'
        '         into :vstatusItem;'
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
          'cod_vendedor, tipv, grupo_prod, cod_prod, cod_grade)'
        
          '               values ((select cod from incrementa_codigo(new.co' +
          'd_empresa, '#39'PRODUTOS_PROD_CONF'#39')), new.nped, new.tipo, new.nitem' +
          ', new.cod_empresa, :vquantConfTemp, :vnped, :vnitem, :vtipo, new' +
          '.cod_vendedor, :vTipV, new.grupo_prod, new.cod_prod, new.cod_gra' +
          'de);'
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
          'cod_vendedor, tipv, grupo_prod, cod_prod, cod_grade)'
        
          '               values ((select cod from incrementa_codigo(new.co' +
          'd_empresa, '#39'PRODUTOS_PROD_CONF'#39')), new.nped, new.tipo, new.nitem' +
          ', new.cod_empresa, :vquantConfTemp, :vnped, :vnitem, :vtipo, new' +
          '.cod_vendedor, :vTipV, new.grupo_prod, new.cod_prod, new.cod_gra' +
          'de);'
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
        '             into :vtotvenda, :vtotprod, :vtotacresc, :vtotdesc;'
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
        
          'ALTER TABLE CONTROLE_ALMOXARIFADO ADD VALOR_DESCACRES T_VL_TODOS' +
          ';'
        'ALTER TABLE CONTROLE_ALMOXARIFADO ADD DESC_ITEM T_VL_TODOS'
        'ALTER TABLE CONTROLE_ALMOXARIFADO ADD TABPRATICADA CHAR(1);'
        ''
        '|BLOCO|'
        'CREATE GENERATOR GEN_DOC_ELETRONICO;'
        ''
        'CREATE TABLE DOC_ELETRONICO ('
        '    SEQID        BIGINT NOT NULL,'
        '    COD_EMPRESA  INTEGER NOT NULL,'
        '    ID_DOC       VARCHAR(32),'
        '    DOC          BLOB SUB_TYPE 1 SEGMENT SIZE 4096'
        ');'
        
          'ALTER TABLE DOC_ELETRONICO ADD CONSTRAINT PK_DOC_ELETRONICO PRIM' +
          'ARY KEY (SEQID, COD_EMPRESA);'
        '|/BLOCO|'
        ''
        '|BLOCO|'
        
          'CREATE OR ALTER TRIGGER DOC_ELETRONICO_BI_SEQID FOR DOC_ELETRONI' +
          'CO'
        'ACTIVE BEFORE INSERT POSITION 0'
        'AS'
        'begin'
        '  new.seqid = next value for gen_doc_eletronico;'
        'end'
        '|/BLOCO|')
    end
  end
end
