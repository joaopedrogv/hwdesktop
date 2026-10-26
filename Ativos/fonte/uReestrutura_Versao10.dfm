inherited frmReestruturaVersao10: TfrmReestruturaVersao10
  Caption = 'frmReestruturaVersao10'
  ExplicitWidth = 1068
  ExplicitHeight = 593
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 1054
    end
    inherited sqlFiscal: TMemo
      Lines.Strings = (
        'ALTER TABLE CUPOM ADD NPED_ORC INTEGER;'
        'ALTER TABLE CUPOM2 ADD NITEM_ORC INTEGER;')
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
        'ALTER TABLE CUPOM ADD NPED_ORC INTEGER;'
        'ALTER TABLE CUPOM2 ADD NITEM_ORC INTEGER;'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, FORM, ATIVO, SENHA_GERENTE, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'FIS056'#39', :COD_EMPRESA, '#39'US' +
          'AR ORCAMENTO NO PAF-ECF'#39', 10, '#39'.'#39', 1, '#39'N'#39', '#39'S'#39', CURRENT_DATE);'
        'ALTER TABLE NFCE_ITEM ADD NAT_REC CHAR(3);'
        ''
        '|BLOCO|'
        'create or alter procedure SP_NFCE_RESET_PISCOFINS ('
        '    CODIGO_NFCE integer,'
        '    CODIGO_EMPRESA integer)'
        'returns ('
        '    SUCESSO smallint)'
        'as'
        'declare variable AGRUPO_PROD integer;'
        'declare variable ACOD_PROD char(6);'
        'declare variable ASEQID integer;'
        'declare variable ACST char(2);'
        'declare variable APIS_EMP double precision;'
        'declare variable ACOFINS_EMP double precision;'
        'declare variable APIS_PROD double precision;'
        'declare variable ACOFINS_PROD double precision;'
        'declare variable ANAT_REC char(3);'
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
        '      pis_ppis = case when :acst = '#39'01'#39' then :apis_emp'
        '                      when :acst = '#39'02'#39' then :apis_prod'
        '                      else 0'
        '                 end, '
        '      pis_valiqprod = case when :acst = '#39'03'#39' then :apis_prod'
        '                           else 0'
        '                      end,'
        '      cofins_pcofins = case when :acst = '#39'01'#39' then :acofins_emp'
        '                            when :acst = '#39'02'#39' then :acofins_prod'
        '                            else 0'
        '                       end,'
        
          '      cofins_valiqprod = case when :acst = '#39'03'#39' then :acofins_pr' +
          'od'
        '                              else 0'
        '                         end'
        
          '      where cod_nfce = :codigo_nfce and cod_empresa = :codigo_em' +
          'presa and seqid = :aseqid;'
        '  end'
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
        '  declare variable update_iss char(1);'
        '  declare variable valor_tmp t_vl_todos;'
        'begin'
        '  if (user = '#39'REPL'#39') then'
        '    exit;'
        ''
        '--  calcular = '#39'N'#39';--coalesce(new.calcular, '#39'N'#39');'
        '  update_icms = '#39'N'#39';'
        '  update_pis = '#39'N'#39';'
        '  update_iss = '#39'N'#39';'
        ''
        '  if ((inserting) or (deleting) ) then'
        '  begin'
        '--    calcular = '#39'S'#39';'
        '    update_icms = '#39'S'#39';'
        '    update_pis = '#39'S'#39';'
        '    update_iss = '#39'S'#39';'
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
        '      update_pis = '#39'S'#39';'
        '      update_iss = '#39'S'#39';'
        '    end'
        '    else'
        '    begin'
        '      if ((old.icm_cst <> new.icm_cst) or'
        '        (old.icm_csosn <> new.icm_csosn) or'
        '        (old.icm_predbc <> new.icm_predbc) or'
        '        (old.icm_picms <> new.icm_picms) or'
        '        (old.icm_pcredsn <> new.icm_pcredsn)) then-- or'
        '        update_icms = '#39'S'#39';'
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
        '    end'
        ''
        
          '  if ((update_icms = '#39'N'#39') and (update_pis = '#39'N'#39') and (update_iss' +
          ' = '#39'N'#39')) then'
        '    exit;'
        ''
        '  if (new.frete_na_base = '#39'S'#39') then'
        '    valor_tmp = new.vfrete;'
        '  else'
        '     valor_tmp = 0;'
        
          '  valor_tmp = valor_tmp + new.vprod + new.vseg + new.voutro - ne' +
          'w.vdesc;'
        ''
        '  if (update_icms = '#39'S'#39') then'
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
        'end'
        '|/BLOCO|'
        ''
        
          'ALTER TABLE BOLETAS ADD HTMLBOLETO BLOB SUB_TYPE 1 SEGMENT SIZE ' +
          '1024;'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'BOL038'#39', :COD_EMPRESA, '#39'EN' +
          'VIAR EMAIL BOLETO'#39', 3, '#39'N'#39', '#39'FRMCADBOLETO'#39', 1, '#39'S'#39', CURRENT_TIME' +
          'STAMP);'
        ''
        'ALTER TABLE GERADOR_OSBOL ADD QTDE_GERADOR INTEGER;'
        'ALTER TABLE GERADOR_OSBOL ADD QTDE_GERADO INTEGER;'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI215'#39', :COD_EMPRESA, '#39'AB' +
          'RIR CONTRATOS CLIENTES'#39', 3, '#39'N'#39', '#39'FRMENVIARCONTRATOSCLIENTES'#39', 1' +
          ', '#39'S'#39', CURRENT_TIMESTAMP);'
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'CLI216'#39', :COD_EMPRESA, '#39'CO' +
          'NSULTAR CONTRATOS CLIENTES'#39', 3, '#39'N'#39', '#39'FRMENVIARCONTRATOSCLIENTES' +
          #39', 1, '#39'S'#39', CURRENT_TIMESTAMP);'
        ''
        'ALTER TABLE BOLETAS ADD ENV_EMAIL_BOL CHAR(1) DEFAULT '#39'N'#39';'
        'ALTER TABLE PEDVENDA ADD ENV_EMAIL_NFS CHAR(1) DEFAULT '#39'N'#39';'
        'CREATE INDEX IDX_NFCE_DATALANC ON NFCE (DATA_LANC,COD_EMPRESA);'
        ''
        
          'CMD:REPL|INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA' +
          ', NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, FORM, ATIVO, GRA' +
          'VAR_AUDITORIA, DATA_MOD_CAD) VALUES ('#39'NF0199'#39', :COD_EMPRESA, '#39'CH' +
          'ECK USAR VALOR DO PEDIDO PARA BOLETOS NF'#39', 12, '#39'S'#39', '#39'FRMCADNF'#39', ' +
          '1, '#39'S'#39', CURRENT_TIMESTAMP);'
        'CMD:INATIVO|ALTER TABLE NOTAFISCAL_ITEM ADD COD_NFCE INTEGER;')
    end
  end
end
